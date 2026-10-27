"""Dos instancias compiten por transacciones; Redis protege la sección crítica."""

import os
import random
import threading
import time
import uuid
from datetime import datetime

import mysql.connector
import redis
from mysql.connector import Error as MySQLError
from redis.exceptions import RedisError


NOMBRE = os.environ["CONSUMIDOR_ID"]
USAR_SEMAFORO = os.getenv("USAR_SEMAFORO", "true").lower() == "true"
CLAVE = "semaforo:transacciones"
TTL = 10

# Lua ejecuta la comprobación del dueño y la operación en un solo paso atómico.
RENOVAR = "if redis.call('GET', KEYS[1]) == ARGV[1] then return redis.call('EXPIRE', KEYS[1], ARGV[2]) else return 0 end"
LIBERAR = "if redis.call('GET', KEYS[1]) == ARGV[1] then return redis.call('DEL', KEYS[1]) else return 0 end"


def log(mensaje):
    print(f"[{datetime.now():%Y-%m-%d %H:%M:%S.%f}] {NOMBRE} -> {mensaje}", flush=True)


def conectar_mysql():
    return mysql.connector.connect(
        host=os.environ["MYSQL_HOST"],
        database=os.environ["MYSQL_DATABASE"],
        user=os.environ["MYSQL_USER"],
        password=os.environ["MYSQL_PASSWORD"],
        connection_timeout=5,
    )


def mantener_semaforo(cliente, token, detener, perdido):
    """Renueva la concesión durante pausas inesperadas del proceso."""
    while not detener.wait(2):
        try:
            if not cliente.eval(RENOVAR, 1, CLAVE, token, TTL):
                perdido.set()
                log("SEMAFORO PERDIDO: otro proceso puede adquirirlo")
                return
        except RedisError as error:
            perdido.set()
            log(f"ERROR REDIS al renovar: {error}")
            return


def procesar(cliente, token, perdido):
    conexion = conectar_mysql()
    try:
        # La lectura se confirma antes de dormir para permitir la carrera
        # intencional del escenario sin semáforo.
        with conexion.cursor(dictionary=True) as cursor:
            cursor.execute(
                "SELECT id FROM transacciones WHERE estado = 'PENDIENTE' "
                "ORDER BY creado_en, id LIMIT 1"
            )
            fila = cursor.fetchone()
        conexion.commit()

        if fila is None:
            log("NO HAY TRANSACCIONES PENDIENTES")
            return

        transaccion_id = fila["id"]
        iniciado_en = datetime.now()
        demora = random.uniform(1, 3)
        log(f"PROCESANDO TRANSACCION #{transaccion_id} | demora={demora:.2f}s")
        time.sleep(demora)

        if USAR_SEMAFORO:
            # Si se perdió la concesión, no se modifica la transacción.
            if perdido.is_set() or not cliente.eval(RENOVAR, 1, CLAVE, token, TTL):
                log(f"SEMAFORO PERDIDO | Transacción #{transaccion_id} sigue PENDIENTE")
                return

        with conexion.cursor() as cursor:
            if USAR_SEMAFORO:
                cursor.execute(
                    "UPDATE transacciones SET estado='PROCESADO', "
                    "procesado_en=NOW(6), procesado_por=%s "
                    "WHERE id=%s AND estado='PENDIENTE'",
                    (NOMBRE, transaccion_id),
                )
                resultado = "PROCESADO" if cursor.rowcount == 1 else "DUPLICADO"
            else:
                # Escenario didáctico: ambos consumidores pueden leer la misma
                # fila antes de dormir y después escribirla sin protección.
                cursor.execute(
                    "SELECT estado FROM transacciones WHERE id=%s FOR UPDATE",
                    (transaccion_id,),
                )
                estado_anterior = cursor.fetchone()[0]
                cursor.execute(
                    "UPDATE transacciones SET estado='PROCESADO', "
                    "procesado_en=NOW(6), procesado_por=%s WHERE id=%s",
                    (NOMBRE, transaccion_id),
                )
                resultado = "PROCESADO" if estado_anterior == "PENDIENTE" else "DUPLICADO"

            cursor.execute(
                "INSERT INTO intentos_procesamiento "
                "(transaccion_id, consumidor, modo, resultado, iniciado_en) "
                "VALUES (%s, %s, %s, %s, %s)",
                (
                    transaccion_id,
                    NOMBRE,
                    "CON_SEMAFORO" if USAR_SEMAFORO else "SIN_SEMAFORO",
                    resultado,
                    iniciado_en,
                ),
            )
        conexion.commit()
        if resultado == "PROCESADO":
            log(f"TRANSACCION #{transaccion_id} PROCESADA")
        else:
            log(f"CARRERA: TRANSACCION #{transaccion_id} PROCESADA DOS VECES")
    except Exception:
        conexion.rollback()
        raise
    finally:
        conexion.close()


def main():
    cliente = redis.Redis(host=os.environ["REDIS_HOST"], port=6379, decode_responses=True)
    log("INICIADO | modo=" + ("CON SEMAFORO" if USAR_SEMAFORO else "SIN SEMAFORO"))
    while True:
        token = f"{NOMBRE}:{uuid.uuid4().hex}"
        detener = threading.Event()
        perdido = threading.Event()
        hilo = None
        adquirido = False
        try:
            if USAR_SEMAFORO:
                adquirido = bool(cliente.set(CLAVE, token, nx=True, ex=TTL))
                if not adquirido:
                    log("ESPERANDO SEMAFORO | recurso ocupado")
                    time.sleep(0.5)
                    continue
                log(f"SEMAFORO ADQUIRIDO | dueño={token} | TTL={TTL}s")
                hilo = threading.Thread(
                    target=mantener_semaforo,
                    args=(cliente, token, detener, perdido),
                    daemon=True,
                )
                hilo.start()
            procesar(cliente, token, perdido)
        except (MySQLError, RedisError) as error:
            log(f"ERROR DE CONEXION: {error}. Reintentando")
            time.sleep(2)
        finally:
            if adquirido:
                detener.set()
                hilo.join(timeout=3)
                try:
                    if cliente.eval(LIBERAR, 1, CLAVE, token):
                        log("SEMAFORO LIBERADO")
                    else:
                        log("SEMAFORO NO LIBERADO | ya no soy el dueño")
                except RedisError as error:
                    log(f"ERROR REDIS al liberar: {error}; expirará por TTL")
        time.sleep(0.5 if USAR_SEMAFORO else 0.1)


if __name__ == "__main__":
    main()
