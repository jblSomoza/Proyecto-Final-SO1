# Evidencias

Las 12 imágenes PNG son capturas de páginas de estilo terminal que muestran salidas **reales** de Docker Compose, MySQL, Redis y los procesos. No son pantallazos directos de Docker Desktop. Cada imagen tiene un archivo `.txt` con su salida fuente y un `.html` que permite repetir la captura. No se inventaron resultados.

| Imagen | Contenido |
|---|---|
| `01_contenedores.png` | Cinco contenedores activos; MySQL y Redis `healthy`. |
| `02_mysql.png` | Versión, tablas y conteo de MySQL. |
| `03_redis.png` | Respuesta `PONG`. |
| `04_productor.png` | Transacciones creadas. |
| `05_consumidor1.png` | Logs del primer consumidor. |
| `06_consumidor2.png` | Logs del segundo consumidor. |
| `07_pendientes.png` | Consulta antes de iniciar los consumidores. |
| `08_procesadas.png` | Consulta después de procesar. |
| `09_semaforo.png` | `EXISTS`, `GET` y `TTL` durante una adquisición. |
| `10_con_semaforo.png` | Resumen SQL y logs del escenario A. |
| `11_sin_semaforo.png` | Resumen SQL y logs del escenario B. |
| `12_comparativo.png` | Comparación de ambas corridas. |

Para volver a generar los PNG desde los `.txt` en Windows con Edge o Chrome:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\evidencias\generar_capturas.ps1
```

Las trazas completas y los resultados SQL de ambas corridas están en `trazas/`.
