# Escenario Con semáforo

**Resultado SQL real:** 26 creadas, 26 procesadas, 0 pendientes, 0 intentos duplicados. consumidor1: 13; consumidor2: 13.

Fuente: [log completo](escenario_con_semaforo.log) y [consulta SQL](escenario_con_semaforo_sql.txt). Horas tomadas de los mensajes reales de los procesos. Las filas están ordenadas por hora.

| Tiempo | Proceso | Evento | Transacción | Estado |
|---|---|---|---:|---|
| 2026-10-27 21:16:33.117567 | productor | Transacción creada | 1 | PENDIENTE |
| 2026-10-27 21:16:33.367854 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:33.381751 | consumidor1 | Inicio de procesamiento | 1 | PENDIENTE |
| 2026-10-27 21:16:34.185401 | productor | Transacción creada | 2 | PENDIENTE |
| 2026-10-27 21:16:34.465030 | consumidor1 | Transacción procesada | 1 | PROCESADO |
| 2026-10-27 21:16:34.467760 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:16:34.518597 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:34.538134 | consumidor2 | Inicio de procesamiento | 2 | PENDIENTE |
| 2026-10-27 21:16:35.835750 | productor | Transacción creada | 3 | PENDIENTE |
| 2026-10-27 21:16:36.530639 | consumidor2 | Transacción procesada | 2 | PROCESADO |
| 2026-10-27 21:16:36.531561 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:16:36.972233 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:36.979932 | productor | Transacción creada | 4 | PENDIENTE |
| 2026-10-27 21:16:36.980556 | consumidor1 | Inicio de procesamiento | 3 | PENDIENTE |
| 2026-10-27 21:16:38.597426 | productor | Transacción creada | 5 | PENDIENTE |
| 2026-10-27 21:16:38.735303 | consumidor1 | Transacción procesada | 3 | PROCESADO |
| 2026-10-27 21:16:38.738093 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:16:39.035243 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:39.048605 | consumidor2 | Inicio de procesamiento | 4 | PENDIENTE |
| 2026-10-27 21:16:39.901638 | productor | Transacción creada | 6 | PENDIENTE |
| 2026-10-27 21:16:41.171766 | productor | Transacción creada | 7 | PENDIENTE |
| 2026-10-27 21:16:42.052730 | consumidor2 | Transacción procesada | 4 | PROCESADO |
| 2026-10-27 21:16:42.053743 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:16:42.246377 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:42.265351 | consumidor1 | Inicio de procesamiento | 5 | PENDIENTE |
| 2026-10-27 21:16:43.039414 | productor | Transacción creada | 8 | PENDIENTE |
| 2026-10-27 21:16:43.520013 | consumidor1 | Transacción procesada | 5 | PROCESADO |
| 2026-10-27 21:16:43.522550 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:16:43.555449 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:43.564477 | consumidor2 | Inicio de procesamiento | 6 | PENDIENTE |
| 2026-10-27 21:16:44.164237 | productor | Transacción creada | 9 | PENDIENTE |
| 2026-10-27 21:16:45.903644 | productor | Transacción creada | 10 | PENDIENTE |
| 2026-10-27 21:16:46.009304 | consumidor2 | Transacción procesada | 6 | PROCESADO |
| 2026-10-27 21:16:46.010333 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:16:46.027738 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:46.036211 | consumidor1 | Inicio de procesamiento | 7 | PENDIENTE |
| 2026-10-27 21:16:47.212012 | productor | Transacción creada | 11 | PENDIENTE |
| 2026-10-27 21:16:48.848241 | consumidor1 | Transacción procesada | 7 | PROCESADO |
| 2026-10-27 21:16:48.849284 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:16:48.969410 | productor | Transacción creada | 12 | PENDIENTE |
| 2026-10-27 21:16:49.021231 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:49.042807 | consumidor2 | Inicio de procesamiento | 8 | PENDIENTE |
| 2026-10-27 21:16:50.106374 | productor | Transacción creada | 13 | PENDIENTE |
| 2026-10-27 21:16:51.716644 | consumidor2 | Transacción procesada | 8 | PROCESADO |
| 2026-10-27 21:16:51.718143 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:16:51.855789 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:51.866345 | consumidor1 | Inicio de procesamiento | 9 | PENDIENTE |
| 2026-10-27 21:16:51.925047 | productor | Transacción creada | 14 | PENDIENTE |
| 2026-10-27 21:16:53.709384 | productor | Transacción creada | 15 | PENDIENTE |
| 2026-10-27 21:16:54.216712 | consumidor1 | Transacción procesada | 9 | PROCESADO |
| 2026-10-27 21:16:54.218014 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:16:54.221613 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:54.230319 | consumidor2 | Inicio de procesamiento | 10 | PENDIENTE |
| 2026-10-27 21:16:54.891338 | productor | Transacción creada | 16 | PENDIENTE |
| 2026-10-27 21:16:56.048367 | consumidor2 | Transacción procesada | 10 | PROCESADO |
| 2026-10-27 21:16:56.050148 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:16:56.219952 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:56.230577 | consumidor1 | Inicio de procesamiento | 11 | PENDIENTE |
| 2026-10-27 21:16:56.338869 | productor | Transacción creada | 17 | PENDIENTE |
| 2026-10-27 21:16:57.408674 | consumidor1 | Transacción procesada | 11 | PROCESADO |
| 2026-10-27 21:16:57.409879 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:16:57.553178 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:57.563343 | consumidor2 | Inicio de procesamiento | 12 | PENDIENTE |
| 2026-10-27 21:16:57.636530 | productor | Transacción creada | 18 | PENDIENTE |
| 2026-10-27 21:16:58.964052 | consumidor2 | Transacción procesada | 12 | PROCESADO |
| 2026-10-27 21:16:58.965178 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:16:59.071295 | productor | Transacción creada | 19 | PENDIENTE |
| 2026-10-27 21:16:59.413645 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:16:59.425184 | consumidor1 | Inicio de procesamiento | 13 | PENDIENTE |
| 2026-10-27 21:17:00.301932 | productor | Transacción creada | 20 | PENDIENTE |
| 2026-10-27 21:17:01.073319 | consumidor1 | Transacción procesada | 13 | PROCESADO |
| 2026-10-27 21:17:01.076545 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:01.470180 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:01.485651 | consumidor2 | Inicio de procesamiento | 14 | PENDIENTE |
| 2026-10-27 21:17:02.322046 | productor | Transacción creada | 21 | PENDIENTE |
| 2026-10-27 21:17:03.909048 | consumidor2 | Transacción procesada | 14 | PROCESADO |
| 2026-10-27 21:17:03.911414 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:04.081892 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:04.090420 | consumidor1 | Inicio de procesamiento | 15 | PENDIENTE |
| 2026-10-27 21:17:04.246599 | productor | Transacción creada | 22 | PENDIENTE |
| 2026-10-27 21:17:06.243640 | productor | Transacción creada | 23 | PENDIENTE |
| 2026-10-27 21:17:06.519404 | consumidor1 | Transacción procesada | 15 | PROCESADO |
| 2026-10-27 21:17:06.521888 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:06.916299 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:06.929643 | consumidor2 | Inicio de procesamiento | 16 | PENDIENTE |
| 2026-10-27 21:17:08.152912 | productor | Transacción creada | 24 | PENDIENTE |
| 2026-10-27 21:17:09.402932 | consumidor2 | Transacción procesada | 16 | PROCESADO |
| 2026-10-27 21:17:09.405407 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:09.527139 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:09.546135 | consumidor1 | Inicio de procesamiento | 17 | PENDIENTE |
| 2026-10-27 21:17:10.158993 | productor | Transacción creada | 25 | PENDIENTE |
| 2026-10-27 21:17:11.537905 | consumidor1 | Transacción procesada | 17 | PROCESADO |
| 2026-10-27 21:17:11.538872 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:11.910999 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:11.932608 | consumidor2 | Inicio de procesamiento | 18 | PENDIENTE |
| 2026-10-27 21:17:11.938566 | productor | Transacción creada | 26 | PENDIENTE |
| 2026-10-27 21:17:13.116726 | consumidor2 | Transacción procesada | 18 | PROCESADO |
| 2026-10-27 21:17:13.118211 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:13.542387 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:13.561171 | consumidor1 | Inicio de procesamiento | 19 | PENDIENTE |
| 2026-10-27 21:17:16.571868 | consumidor1 | Transacción procesada | 19 | PROCESADO |
| 2026-10-27 21:17:16.574281 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:16.624344 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:16.641824 | consumidor2 | Inicio de procesamiento | 20 | PENDIENTE |
| 2026-10-27 21:17:18.709455 | consumidor2 | Transacción procesada | 20 | PROCESADO |
| 2026-10-27 21:17:18.710401 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:19.079148 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:19.098786 | consumidor1 | Inicio de procesamiento | 21 | PENDIENTE |
| 2026-10-27 21:17:20.203587 | consumidor1 | Transacción procesada | 21 | PROCESADO |
| 2026-10-27 21:17:20.205527 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:20.212839 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:20.222519 | consumidor2 | Inicio de procesamiento | 22 | PENDIENTE |
| 2026-10-27 21:17:21.527029 | consumidor2 | Transacción procesada | 22 | PROCESADO |
| 2026-10-27 21:17:21.529861 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:21.708508 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:21.726047 | consumidor1 | Inicio de procesamiento | 23 | PENDIENTE |
| 2026-10-27 21:17:24.627928 | consumidor1 | Transacción procesada | 23 | PROCESADO |
| 2026-10-27 21:17:24.628988 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:25.036874 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:25.048078 | consumidor2 | Inicio de procesamiento | 24 | PENDIENTE |
| 2026-10-27 21:17:26.329389 | consumidor2 | Transacción procesada | 24 | PROCESADO |
| 2026-10-27 21:17:26.331644 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:26.639961 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:26.648673 | consumidor1 | Inicio de procesamiento | 25 | PENDIENTE |
| 2026-10-27 21:17:29.552680 | consumidor1 | Transacción procesada | 25 | PROCESADO |
| 2026-10-27 21:17:29.555406 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:29.838341 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:29.847322 | consumidor2 | Inicio de procesamiento | 26 | PENDIENTE |
| 2026-10-27 21:17:32.438323 | consumidor2 | Transacción procesada | 26 | PROCESADO |
| 2026-10-27 21:17:32.439479 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:32.560870 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:32.571221 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:32.940748 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:32.961802 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:33.072070 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:33.089196 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:33.462547 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:33.478023 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:33.589936 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:33.599825 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:33.978990 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:34.001812 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:34.100323 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:34.109944 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:34.502355 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:34.512921 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:34.610780 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:34.620866 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:35.013928 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:35.033292 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:35.121931 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:35.139026 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:35.533863 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:35.544252 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:35.639533 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:35.650816 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:36.045379 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:36.060373 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:36.151673 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:36.166136 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:36.561478 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:36.579696 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:36.666689 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:36.677000 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:37.080377 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:37.089877 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:37.177512 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:37.187044 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:37.590676 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:37.601170 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:37.688060 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:37.707146 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:38.102211 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:38.116693 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:38.207691 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:38.217375 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:38.617767 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:38.633211 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:38.717903 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:38.727523 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:39.133924 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:39.143951 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:39.228296 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:39.242187 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:39.645191 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:39.657649 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:39.743667 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:39.763973 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:40.158789 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:40.183430 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:40.265029 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:40.280359 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:40.684098 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:40.694556 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:40.781095 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:40.799732 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:41.195133 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:41.205293 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:41.300448 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:41.317687 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:41.705863 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:41.717018 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:41.818190 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:41.828206 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:42.217964 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:42.238937 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:42.329237 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:42.349583 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:42.739618 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:42.754240 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:42.850400 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:42.863251 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:43.255554 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:43.275960 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:43.364066 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:43.375101 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:43.776774 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:43.793954 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:43.875617 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:43.885457 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:44.294973 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:44.305863 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:44.386055 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:44.395347 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:44.806505 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:44.817216 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:44.895913 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:44.905620 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:45.318325 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:45.330416 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:45.406391 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:45.417468 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:45.831671 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:45.850454 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:45.918643 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:45.943977 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:46.351637 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:46.370416 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:46.444687 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:46.455591 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:46.872237 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:46.890884 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:46.956285 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:46.967709 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:47.392054 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:47.404195 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:47.468363 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:47.478542 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:47.905104 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:47.929893 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:47.979502 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:47.996986 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:48.431804 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:48.454951 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:48.497858 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:48.517766 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:48.955566 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:48.964889 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:49.018570 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:49.028151 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:49.465680 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:49.475608 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:49.528888 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:49.540109 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:49.976603 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:49.987462 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:50.040873 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:50.053175 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:50.488545 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:50.509242 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:50.554061 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:50.578362 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:51.009828 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:51.020223 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:51.078864 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:51.087988 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:51.521031 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:51.530573 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:51.588766 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:51.598478 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:52.031482 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:52.040959 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:52.099311 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:52.109420 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:52.542149 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:52.560908 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:52.610419 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:52.629676 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:53.061898 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:53.071765 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:53.130280 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:53.139961 | consumidor1 | Semáforo liberado | — | — |
| 2026-10-27 21:17:53.572805 | consumidor2 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:53.593291 | consumidor2 | Semáforo liberado | — | — |
| 2026-10-27 21:17:53.640906 | consumidor1 | Semáforo adquirido | — | — |
| 2026-10-27 21:17:53.663209 | consumidor1 | Semáforo liberado | — | — |

Conteo en esta traza: 26 creaciones, 26 procesamientos iniciales y 0 intentos duplicados.

