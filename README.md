# Productor y consumidores con semáforo en Redis y MySQL

Proyecto final de Sistemas Operativos 1. Simula transacciones bancarias con un productor y dos consumidores. MySQL es el canal compartido y Redis coordina el acceso a la sección crítica.

## Arquitectura

| Servicio | Imagen | Función |
|---|---|---|
| `mysql` | `mysql:8` | Guarda transacciones e intentos de procesamiento. |
| `redis` | `redis:7` | Guarda el semáforo distribuido. |
| `productor` | Dockerfile propio | Inserta una transacción `PENDIENTE` cada 1–2 segundos. |
| `consumidor1` | Imagen compartida de consumidor | Procesa transacciones. |
| `consumidor2` | Misma imagen | Compite con el primer consumidor. |

La tabla se crea automáticamente desde `mysql/init.sql` cuando se inicializa un volumen MySQL vacío. La tabla `intentos_procesamiento` permite observar procesamientos duplicados durante la prueba sin semáforo.

## Requisitos

- Docker Desktop con el motor iniciado.
- Docker Compose (incluido en Docker Desktop).

No hace falta instalar Python ni MySQL en la computadora anfitriona.

## Variables de `.env`

| Variable | Función |
|---|---|
| `MYSQL_ROOT_PASSWORD` | Contraseña de administración de MySQL. |
| `MYSQL_DATABASE` | Base de datos del proyecto; debe coincidir con `banco_so1` en `init.sql`. |
| `MYSQL_USER` | Usuario de la aplicación. |
| `MYSQL_PASSWORD` | Contraseña de ese usuario. |
| `USAR_SEMAFORO` | `true` para la corrida normal; `false` para demostrar la carrera. |

Las contraseñas incluidas son solo para la demostración local.

## Levantar y observar

Desde la raíz del proyecto:

```bash
docker compose up -d --build
docker compose ps
docker compose logs -f productor
docker compose logs -f consumidor1
docker compose logs -f consumidor2
```

`mysql` y `redis` deben aparecer como `healthy`. Los demás servicios deben aparecer como `Up`. El productor imprime `TRANSACCION CREADA`; los consumidores imprimen `SEMAFORO ADQUIRIDO`, `PROCESANDO TRANSACCION`, `TRANSACCION ... PROCESADA` y `SEMAFORO LIBERADO`.

## Escenario A: con semáforo

1. Dejar `USAR_SEMAFORO=true` en `.env`.
2. Para una muestra limpia, ejecutar `docker compose down -v` y luego `docker compose up -d --build`. **`down -v` elimina los datos MySQL anteriores**; guardar antes los logs o resultados que se quieran conservar.
3. Esperar a que el productor cree al menos 20 transacciones. Consultar el total con el comando SQL de abajo.
4. Detener solamente el productor: `docker compose stop productor`.
5. Esperar hasta que la consulta muestre cero pendientes.
6. Guardar logs: `docker compose logs --no-color --timestamps productor consumidor1 consumidor2 > trazas/escenario_con_semaforo.log`.
7. Comprobar que no existan filas en la consulta de duplicidades de `mysql/consultas.sql`.

La corrida real incluida en `trazas/` obtuvo **26 procesadas y 0 duplicados**.

## Escenario B: sin semáforo

Se conserva la misma arquitectura. Solo cambia `USAR_SEMAFORO` en ambos consumidores. En PowerShell:

```powershell
docker compose down -v
$env:USAR_SEMAFORO = "false"
docker compose up -d --build
```

En Bash:

```bash
docker compose down -v
USAR_SEMAFORO=false docker compose up -d --build
```

Esperar al menos 20 transacciones, detener el productor, esperar a que no queden pendientes y guardar los logs:

```bash
docker compose stop productor
docker compose logs --no-color --timestamps productor consumidor1 consumidor2 > trazas/escenario_sin_semaforo.log
```

En PowerShell, al terminar, quitar la variable temporal con `Remove-Item Env:USAR_SEMAFORO`. La corrida real incluida obtuvo **29 procesadas y 26 intentos duplicados**. Sin protección, ambos consumidores pueden leer la misma fila `PENDIENTE` antes de dormir y luego escribirla. La tabla de intentos conserva ambos procesamientos aunque la fila final solo muestre un `procesado_por`.

## Consultas MySQL

Abrir la consola SQL:

```bash
docker compose exec mysql mysql -uso1 -pclave_so1 banco_so1
```

Después ejecutar las consultas de `mysql/consultas.sql`. Para contar rápidamente:

```sql
SELECT estado, COUNT(*) AS cantidad FROM transacciones GROUP BY estado;
SELECT transaccion_id, COUNT(*) AS intentos
FROM intentos_procesamiento
GROUP BY transaccion_id HAVING COUNT(*) > 1;
```

Los comandos usan los valores de demostración de `.env`. Si se cambian, adaptar el usuario, contraseña y nombre de base de datos.

## Ver el semáforo Redis

Ejecutar estos comandos mientras los consumidores procesan transacciones:

```bash
docker compose exec redis redis-cli EXISTS semaforo:transacciones
docker compose exec redis redis-cli GET semaforo:transacciones
docker compose exec redis redis-cli TTL semaforo:transacciones
```

`EXISTS=1` indica que está ocupado; `GET` muestra `consumidor1:<id>` o `consumidor2:<id>`; `TTL` muestra los segundos restantes. Como el bloqueo dura poco, una consulta puede devolver `EXISTS=0`, `GET` vacío y `TTL=-2` justo entre dos adquisiciones. Los logs muestran cada adquisición y liberación.

La adquisición usa `SET semaforo:transacciones <token> NX EX 10`. Un hilo renueva el TTL mientras el consumidor trabaja. La liberación usa Lua para ejecutar de forma atómica `GET` y `DEL` solamente si el token sigue perteneciendo al consumidor.

## Evidencias y trazas

- `trazas/escenario_con_semaforo.md` y `trazas/escenario_sin_semaforo.md` contienen tablas de eventos ordenados por hora.
- Los archivos `.log` y `_sql.txt` de `trazas/` son las fuentes reales de esas tablas.
- `evidencias/` contiene salidas capturadas y sus imágenes PNG: contenedores, servicios, logs, consultas, Redis y comparación.

Tomar capturas durante la corrida, especialmente cuando los cinco servicios estén `Up` y cuando `GET semaforo:transacciones` devuelva un propietario.

## Detener o reiniciar

```bash
docker compose down
```

Conserva el volumen MySQL. Para borrar los datos y empezar desde cero:

```bash
docker compose down -v
docker compose up -d --build
```

`init.sql` se ejecuta nuevamente al crearse el volumen vacío.
