CREATE DATABASE IF NOT EXISTS banco_so1;
USE banco_so1;

CREATE TABLE IF NOT EXISTS transacciones (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cuenta VARCHAR(20) NOT NULL,
    tipo ENUM('DEPOSITO', 'RETIRO') NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    estado ENUM('PENDIENTE', 'PROCESADO') NOT NULL DEFAULT 'PENDIENTE',
    creado_en DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    procesado_en DATETIME(6) NULL,
    procesado_por VARCHAR(30) NULL,
    INDEX idx_pendientes (estado, creado_en, id)
);

-- Cada intento queda registrado para observar el procesamiento duplicado
-- en la demostración sin semáforo.
CREATE TABLE IF NOT EXISTS intentos_procesamiento (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transaccion_id BIGINT UNSIGNED NOT NULL,
    consumidor VARCHAR(30) NOT NULL,
    modo ENUM('CON_SEMAFORO', 'SIN_SEMAFORO') NOT NULL,
    resultado ENUM('PROCESADO', 'DUPLICADO', 'BLOQUEO_PERDIDO') NOT NULL,
    iniciado_en DATETIME(6) NOT NULL,
    terminado_en DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    FOREIGN KEY (transaccion_id) REFERENCES transacciones(id),
    INDEX idx_intentos_transaccion (transaccion_id)
);

