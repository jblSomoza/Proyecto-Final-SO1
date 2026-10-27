"""Inserta transacciones bancarias nuevas cada 1 a 2 segundos."""

import os
import random
import time
from datetime import datetime
from decimal import Decimal

import mysql.connector
from mysql.connector import Error


def log(mensaje):
    print(f"[{datetime.now():%Y-%m-%d %H:%M:%S.%f}] productor -> {mensaje}", flush=True)


def conectar():
    return mysql.connector.connect(
        host=os.environ["MYSQL_HOST"],
        database=os.environ["MYSQL_DATABASE"],
        user=os.environ["MYSQL_USER"],
        password=os.environ["MYSQL_PASSWORD"],
        connection_timeout=5,
    )


def main():
    while True:
        try:
            cuenta = str(random.randint(10000, 10099))
            tipo = random.choice(("DEPOSITO", "RETIRO"))
            monto = Decimal(random.randint(1000, 50000)) / 100
            with conectar() as conexion:
                with conexion.cursor() as cursor:
                    cursor.execute(
                        "INSERT INTO transacciones (cuenta, tipo, monto, estado) "
                        "VALUES (%s, %s, %s, 'PENDIENTE')",
                        (cuenta, tipo, monto),
                    )
                    transaccion_id = cursor.lastrowid
                conexion.commit()
            log(
                f"TRANSACCION CREADA #{transaccion_id} | Cuenta: {cuenta} | "
                f"{tipo} | Monto: Q{monto:.2f} | PENDIENTE"
            )
            time.sleep(random.uniform(1, 2))
        except Error as error:
            log(f"ERROR MYSQL: {error}. Reintentando en 3 segundos")
            time.sleep(3)


if __name__ == "__main__":
    main()

