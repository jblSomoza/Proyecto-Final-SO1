# Escenario Sin semáforo

**Resultado SQL real:** 29 creadas, 29 procesadas, 0 pendientes, 26 intentos duplicados. Primer procesamiento: consumidor1 23; consumidor2 6.

Fuente: [log completo](escenario_sin_semaforo.log) y [consulta SQL](escenario_sin_semaforo_sql.txt). Horas tomadas de los mensajes reales de los procesos. Las filas están ordenadas por hora.

| Tiempo | Proceso | Evento | Transacción | Estado |
|---|---|---|---:|---|
| 2026-10-27 21:19:55.657715 | productor | Transacción creada | 1 | PENDIENTE |
| 2026-10-27 21:19:55.744380 | consumidor2 | Inicio de procesamiento | 1 | PENDIENTE |
| 2026-10-27 21:19:55.816845 | consumidor1 | Inicio de procesamiento | 1 | PENDIENTE |
| 2026-10-27 21:19:57.142074 | productor | Transacción creada | 2 | PENDIENTE |
| 2026-10-27 21:19:58.121356 | consumidor1 | Transacción procesada | 1 | PROCESADO |
| 2026-10-27 21:19:58.240628 | consumidor1 | Inicio de procesamiento | 2 | PENDIENTE |
| 2026-10-27 21:19:58.242125 | consumidor2 | Segundo procesamiento de la misma transacción | 1 | PROCESADO (duplicado) |
| 2026-10-27 21:19:58.361624 | consumidor2 | Inicio de procesamiento | 2 | PENDIENTE |
| 2026-10-27 21:19:59.038926 | productor | Transacción creada | 3 | PENDIENTE |
| 2026-10-27 21:19:59.448617 | consumidor1 | Transacción procesada | 2 | PROCESADO |
| 2026-10-27 21:19:59.474640 | consumidor2 | Segundo procesamiento de la misma transacción | 2 | PROCESADO (duplicado) |
| 2026-10-27 21:19:59.567078 | consumidor1 | Inicio de procesamiento | 3 | PENDIENTE |
| 2026-10-27 21:19:59.588280 | consumidor2 | Inicio de procesamiento | 3 | PENDIENTE |
| 2026-10-27 21:20:00.571586 | productor | Transacción creada | 4 | PENDIENTE |
| 2026-10-27 21:20:00.745180 | consumidor1 | Transacción procesada | 3 | PROCESADO |
| 2026-10-27 21:20:00.858803 | consumidor1 | Inicio de procesamiento | 4 | PENDIENTE |
| 2026-10-27 21:20:01.606279 | productor | Transacción creada | 5 | PENDIENTE |
| 2026-10-27 21:20:01.926836 | consumidor2 | Segundo procesamiento de la misma transacción | 3 | PROCESADO (duplicado) |
| 2026-10-27 21:20:02.045107 | consumidor2 | Inicio de procesamiento | 4 | PENDIENTE |
| 2026-10-27 21:20:02.992131 | productor | Transacción creada | 6 | PENDIENTE |
| 2026-10-27 21:20:03.121788 | consumidor2 | Transacción procesada | 4 | PROCESADO |
| 2026-10-27 21:20:03.232886 | consumidor2 | Inicio de procesamiento | 5 | PENDIENTE |
| 2026-10-27 21:20:03.544118 | consumidor1 | Segundo procesamiento de la misma transacción | 4 | PROCESADO (duplicado) |
| 2026-10-27 21:20:03.662882 | consumidor1 | Inicio de procesamiento | 5 | PENDIENTE |
| 2026-10-27 21:20:04.618759 | productor | Transacción creada | 7 | PENDIENTE |
| 2026-10-27 21:20:05.114062 | consumidor2 | Transacción procesada | 5 | PROCESADO |
| 2026-10-27 21:20:05.231177 | consumidor2 | Inicio de procesamiento | 6 | PENDIENTE |
| 2026-10-27 21:20:06.349637 | productor | Transacción creada | 8 | PENDIENTE |
| 2026-10-27 21:20:06.518963 | consumidor1 | Segundo procesamiento de la misma transacción | 5 | PROCESADO (duplicado) |
| 2026-10-27 21:20:06.632438 | consumidor1 | Inicio de procesamiento | 6 | PENDIENTE |
| 2026-10-27 21:20:07.680394 | consumidor2 | Transacción procesada | 6 | PROCESADO |
| 2026-10-27 21:20:07.796798 | consumidor2 | Inicio de procesamiento | 7 | PENDIENTE |
| 2026-10-27 21:20:08.309121 | productor | Transacción creada | 9 | PENDIENTE |
| 2026-10-27 21:20:09.510474 | consumidor1 | Segundo procesamiento de la misma transacción | 6 | PROCESADO (duplicado) |
| 2026-10-27 21:20:09.625238 | consumidor1 | Inicio de procesamiento | 7 | PENDIENTE |
| 2026-10-27 21:20:09.902726 | productor | Transacción creada | 10 | PENDIENTE |
| 2026-10-27 21:20:10.248473 | consumidor2 | Transacción procesada | 7 | PROCESADO |
| 2026-10-27 21:20:10.365286 | consumidor2 | Inicio de procesamiento | 8 | PENDIENTE |
| 2026-10-27 21:20:11.021045 | productor | Transacción creada | 11 | PENDIENTE |
| 2026-10-27 21:20:12.355997 | consumidor2 | Transacción procesada | 8 | PROCESADO |
| 2026-10-27 21:20:12.427267 | consumidor1 | Segundo procesamiento de la misma transacción | 7 | PROCESADO (duplicado) |
| 2026-10-27 21:20:12.467875 | consumidor2 | Inicio de procesamiento | 9 | PENDIENTE |
| 2026-10-27 21:20:12.537804 | consumidor1 | Inicio de procesamiento | 9 | PENDIENTE |
| 2026-10-27 21:20:12.765449 | productor | Transacción creada | 12 | PENDIENTE |
| 2026-10-27 21:20:13.639546 | consumidor1 | Transacción procesada | 9 | PROCESADO |
| 2026-10-27 21:20:13.758719 | consumidor1 | Inicio de procesamiento | 10 | PENDIENTE |
| 2026-10-27 21:20:14.739502 | productor | Transacción creada | 13 | PENDIENTE |
| 2026-10-27 21:20:15.272194 | consumidor2 | Segundo procesamiento de la misma transacción | 9 | PROCESADO (duplicado) |
| 2026-10-27 21:20:15.390859 | consumidor2 | Inicio de procesamiento | 10 | PENDIENTE |
| 2026-10-27 21:20:16.519501 | productor | Transacción creada | 14 | PENDIENTE |
| 2026-10-27 21:20:16.636322 | consumidor1 | Transacción procesada | 10 | PROCESADO |
| 2026-10-27 21:20:16.685389 | consumidor2 | Segundo procesamiento de la misma transacción | 10 | PROCESADO (duplicado) |
| 2026-10-27 21:20:16.755941 | consumidor1 | Inicio de procesamiento | 11 | PENDIENTE |
| 2026-10-27 21:20:16.803081 | consumidor2 | Inicio de procesamiento | 11 | PENDIENTE |
| 2026-10-27 21:20:18.093222 | consumidor1 | Transacción procesada | 11 | PROCESADO |
| 2026-10-27 21:20:18.211854 | consumidor1 | Inicio de procesamiento | 12 | PENDIENTE |
| 2026-10-27 21:20:18.461199 | productor | Transacción creada | 15 | PENDIENTE |
| 2026-10-27 21:20:18.599841 | consumidor2 | Segundo procesamiento de la misma transacción | 11 | PROCESADO (duplicado) |
| 2026-10-27 21:20:18.716460 | consumidor2 | Inicio de procesamiento | 12 | PENDIENTE |
| 2026-10-27 21:20:19.631199 | consumidor1 | Transacción procesada | 12 | PROCESADO |
| 2026-10-27 21:20:19.742635 | consumidor1 | Inicio de procesamiento | 13 | PENDIENTE |
| 2026-10-27 21:20:20.188255 | productor | Transacción creada | 16 | PENDIENTE |
| 2026-10-27 21:20:21.252055 | consumidor2 | Segundo procesamiento de la misma transacción | 12 | PROCESADO (duplicado) |
| 2026-10-27 21:20:21.365551 | consumidor2 | Inicio de procesamiento | 13 | PENDIENTE |
| 2026-10-27 21:20:21.442508 | consumidor1 | Transacción procesada | 13 | PROCESADO |
| 2026-10-27 21:20:21.558803 | consumidor1 | Inicio de procesamiento | 14 | PENDIENTE |
| 2026-10-27 21:20:22.055094 | productor | Transacción creada | 17 | PENDIENTE |
| 2026-10-27 21:20:22.974300 | consumidor2 | Segundo procesamiento de la misma transacción | 13 | PROCESADO (duplicado) |
| 2026-10-27 21:20:23.097124 | consumidor2 | Inicio de procesamiento | 14 | PENDIENTE |
| 2026-10-27 21:20:23.116397 | productor | Transacción creada | 18 | PENDIENTE |
| 2026-10-27 21:20:24.139024 | productor | Transacción creada | 19 | PENDIENTE |
| 2026-10-27 21:20:24.474886 | consumidor1 | Transacción procesada | 14 | PROCESADO |
| 2026-10-27 21:20:24.594102 | consumidor1 | Inicio de procesamiento | 15 | PENDIENTE |
| 2026-10-27 21:20:24.830475 | consumidor2 | Segundo procesamiento de la misma transacción | 14 | PROCESADO (duplicado) |
| 2026-10-27 21:20:24.941493 | consumidor2 | Inicio de procesamiento | 15 | PENDIENTE |
| 2026-10-27 21:20:26.087015 | productor | Transacción creada | 20 | PENDIENTE |
| 2026-10-27 21:20:26.206848 | consumidor1 | Transacción procesada | 15 | PROCESADO |
| 2026-10-27 21:20:26.320776 | consumidor1 | Inicio de procesamiento | 16 | PENDIENTE |
| 2026-10-27 21:20:27.147287 | productor | Transacción creada | 21 | PENDIENTE |
| 2026-10-27 21:20:27.531329 | consumidor2 | Segundo procesamiento de la misma transacción | 15 | PROCESADO (duplicado) |
| 2026-10-27 21:20:27.644158 | consumidor2 | Inicio de procesamiento | 16 | PENDIENTE |
| 2026-10-27 21:20:28.616876 | productor | Transacción creada | 22 | PENDIENTE |
| 2026-10-27 21:20:28.722649 | consumidor1 | Transacción procesada | 16 | PROCESADO |
| 2026-10-27 21:20:28.837321 | consumidor1 | Inicio de procesamiento | 17 | PENDIENTE |
| 2026-10-27 21:20:29.723261 | productor | Transacción creada | 23 | PENDIENTE |
| 2026-10-27 21:20:30.037993 | consumidor2 | Segundo procesamiento de la misma transacción | 16 | PROCESADO (duplicado) |
| 2026-10-27 21:20:30.151317 | consumidor2 | Inicio de procesamiento | 17 | PENDIENTE |
| 2026-10-27 21:20:30.850186 | consumidor1 | Transacción procesada | 17 | PROCESADO |
| 2026-10-27 21:20:30.968085 | consumidor1 | Inicio de procesamiento | 18 | PENDIENTE |
| 2026-10-27 21:20:31.651251 | productor | Transacción creada | 24 | PENDIENTE |
| 2026-10-27 21:20:32.962846 | consumidor2 | Segundo procesamiento de la misma transacción | 17 | PROCESADO (duplicado) |
| 2026-10-27 21:20:33.077093 | consumidor2 | Inicio de procesamiento | 18 | PENDIENTE |
| 2026-10-27 21:20:33.580855 | productor | Transacción creada | 25 | PENDIENTE |
| 2026-10-27 21:20:33.912928 | consumidor1 | Transacción procesada | 18 | PROCESADO |
| 2026-10-27 21:20:34.036665 | consumidor1 | Inicio de procesamiento | 19 | PENDIENTE |
| 2026-10-27 21:20:34.827951 | productor | Transacción creada | 26 | PENDIENTE |
| 2026-10-27 21:20:35.504196 | consumidor1 | Transacción procesada | 19 | PROCESADO |
| 2026-10-27 21:20:35.622943 | consumidor1 | Inicio de procesamiento | 20 | PENDIENTE |
| 2026-10-27 21:20:35.649389 | consumidor2 | Segundo procesamiento de la misma transacción | 18 | PROCESADO (duplicado) |
| 2026-10-27 21:20:35.775138 | consumidor2 | Inicio de procesamiento | 20 | PENDIENTE |
| 2026-10-27 21:20:36.414939 | productor | Transacción creada | 27 | PENDIENTE |
| 2026-10-27 21:20:37.634429 | consumidor1 | Transacción procesada | 20 | PROCESADO |
| 2026-10-27 21:20:37.657418 | productor | Transacción creada | 28 | PENDIENTE |
| 2026-10-27 21:20:37.745670 | consumidor1 | Inicio de procesamiento | 21 | PENDIENTE |
| 2026-10-27 21:20:38.381184 | consumidor2 | Segundo procesamiento de la misma transacción | 20 | PROCESADO (duplicado) |
| 2026-10-27 21:20:38.490818 | consumidor2 | Inicio de procesamiento | 21 | PENDIENTE |
| 2026-10-27 21:20:39.421111 | consumidor1 | Transacción procesada | 21 | PROCESADO |
| 2026-10-27 21:20:39.542254 | consumidor1 | Inicio de procesamiento | 22 | PENDIENTE |
| 2026-10-27 21:20:39.656274 | productor | Transacción creada | 29 | PENDIENTE |
| 2026-10-27 21:20:40.620366 | consumidor2 | Segundo procesamiento de la misma transacción | 21 | PROCESADO (duplicado) |
| 2026-10-27 21:20:40.740207 | consumidor2 | Inicio de procesamiento | 22 | PENDIENTE |
| 2026-10-27 21:20:42.216739 | consumidor1 | Transacción procesada | 22 | PROCESADO |
| 2026-10-27 21:20:42.335609 | consumidor2 | Segundo procesamiento de la misma transacción | 22 | PROCESADO (duplicado) |
| 2026-10-27 21:20:42.336517 | consumidor1 | Inicio de procesamiento | 23 | PENDIENTE |
| 2026-10-27 21:20:42.455267 | consumidor2 | Inicio de procesamiento | 23 | PENDIENTE |
| 2026-10-27 21:20:43.467709 | consumidor1 | Transacción procesada | 23 | PROCESADO |
| 2026-10-27 21:20:43.588618 | consumidor1 | Inicio de procesamiento | 24 | PENDIENTE |
| 2026-10-27 21:20:45.181172 | consumidor2 | Segundo procesamiento de la misma transacción | 23 | PROCESADO (duplicado) |
| 2026-10-27 21:20:45.291309 | consumidor2 | Inicio de procesamiento | 24 | PENDIENTE |
| 2026-10-27 21:20:45.756616 | consumidor1 | Transacción procesada | 24 | PROCESADO |
| 2026-10-27 21:20:45.874971 | consumidor1 | Inicio de procesamiento | 25 | PENDIENTE |
| 2026-10-27 21:20:46.414838 | consumidor2 | Segundo procesamiento de la misma transacción | 24 | PROCESADO (duplicado) |
| 2026-10-27 21:20:46.533837 | consumidor2 | Inicio de procesamiento | 25 | PENDIENTE |
| 2026-10-27 21:20:47.081577 | consumidor1 | Transacción procesada | 25 | PROCESADO |
| 2026-10-27 21:20:47.201802 | consumidor1 | Inicio de procesamiento | 26 | PENDIENTE |
| 2026-10-27 21:20:48.626606 | consumidor2 | Segundo procesamiento de la misma transacción | 25 | PROCESADO (duplicado) |
| 2026-10-27 21:20:48.747999 | consumidor2 | Inicio de procesamiento | 26 | PENDIENTE |
| 2026-10-27 21:20:49.046564 | consumidor1 | Transacción procesada | 26 | PROCESADO |
| 2026-10-27 21:20:49.166469 | consumidor1 | Inicio de procesamiento | 27 | PENDIENTE |
| 2026-10-27 21:20:51.199158 | consumidor2 | Segundo procesamiento de la misma transacción | 26 | PROCESADO (duplicado) |
| 2026-10-27 21:20:51.320351 | consumidor2 | Inicio de procesamiento | 27 | PENDIENTE |
| 2026-10-27 21:20:51.386606 | consumidor1 | Transacción procesada | 27 | PROCESADO |
| 2026-10-27 21:20:51.498064 | consumidor1 | Inicio de procesamiento | 28 | PENDIENTE |
| 2026-10-27 21:20:54.043369 | consumidor2 | Segundo procesamiento de la misma transacción | 27 | PROCESADO (duplicado) |
| 2026-10-27 21:20:54.111616 | consumidor1 | Transacción procesada | 28 | PROCESADO |
| 2026-10-27 21:20:54.163297 | consumidor2 | Inicio de procesamiento | 29 | PENDIENTE |
| 2026-10-27 21:20:54.230586 | consumidor1 | Inicio de procesamiento | 29 | PENDIENTE |
| 2026-10-27 21:20:56.266701 | consumidor2 | Transacción procesada | 29 | PROCESADO |
| 2026-10-27 21:20:56.558024 | consumidor1 | Segundo procesamiento de la misma transacción | 29 | PROCESADO (duplicado) |

Conteo en esta traza: 29 creaciones, 29 procesamientos iniciales y 26 intentos duplicados.

