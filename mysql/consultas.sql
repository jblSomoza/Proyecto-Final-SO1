-- Todas las transacciones.
SELECT * FROM transacciones ORDER BY id;

-- Pendientes.
SELECT * FROM transacciones
WHERE estado = 'PENDIENTE' ORDER BY creado_en, id;

-- Procesadas.
SELECT * FROM transacciones
WHERE estado = 'PROCESADO' ORDER BY procesado_en, id;

-- Cantidad final atribuida a cada consumidor.
SELECT procesado_por, COUNT(*) AS cantidad
FROM transacciones WHERE estado = 'PROCESADO'
GROUP BY procesado_por ORDER BY procesado_por;

-- Intentos de procesamiento por consumidor y resultado.
SELECT modo, consumidor, resultado, COUNT(*) AS cantidad
FROM intentos_procesamiento
GROUP BY modo, consumidor, resultado
ORDER BY modo, consumidor, resultado;

-- IDs con más de un intento: evidencia directa de una carrera.
SELECT transaccion_id, COUNT(*) AS intentos,
       GROUP_CONCAT(CONCAT(consumidor, ':', resultado)
                    ORDER BY iniciado_en SEPARATOR ', ') AS detalle
FROM intentos_procesamiento
GROUP BY transaccion_id HAVING COUNT(*) > 1;

-- Resultados anómalos: procesada sin metadatos o pendiente con metadatos.
SELECT * FROM transacciones
WHERE (estado = 'PROCESADO' AND (procesado_en IS NULL OR procesado_por IS NULL))
   OR (estado = 'PENDIENTE' AND (procesado_en IS NOT NULL OR procesado_por IS NOT NULL));

-- Resumen rápido de la corrida.
SELECT estado, COUNT(*) AS cantidad FROM transacciones GROUP BY estado;
