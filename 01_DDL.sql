
USE glob_gusters;

-- 1. Crear una tabla temporal de prueba
CREATE TABLE tabla_prueba (
    id_prueba INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- 2. Agregar una columna a la tabla Ruta
ALTER TABLE Ruta
ADD COLUMN descripcion_ruta VARCHAR(200) NULL;

-- 3. Modificar el tamaño del campo modelo de Bus
ALTER TABLE Bus
MODIFY COLUMN modelo VARCHAR(80) NOT NULL;

-- 4. Crear un índice para buscar direcciones de paradas
CREATE INDEX idx_parada_direccion
ON Parada(direccion_parada);

-- 5. Eliminar la tabla de prueba
DROP TABLE tabla_prueba;
