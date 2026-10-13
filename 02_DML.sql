
USE glob_gusters;

-- 1. Limpiar registros de prueba de una ejecución anterior
DELETE FROM Bus
WHERE placa = 'ZZZ999';

DELETE FROM Empresa_de_buses
WHERE nombre_empresa = 'Empresa Prueba DML';

-- 2. Insertar una empresa de prueba
INSERT INTO Empresa_de_buses (nombre_empresa)
VALUES ('Empresa Prueba DML');

-- Guardar el identificador de la empresa recién creada
SET @id_empresa_prueba = LAST_INSERT_ID();

-- 3. Insertar un bus asociado a esa empresa
INSERT INTO Bus (id_empresa, placa, modelo)
VALUES (@id_empresa_prueba, 'ZZZ999', 'Bus de prueba');

-- 4. Actualizar el modelo del bus
UPDATE Bus
SET modelo = 'Bus de prueba actualizado'
WHERE placa = 'ZZZ999';

-- 5. Consultar el resultado de la actualización
SELECT *
FROM Bus
WHERE placa = 'ZZZ999';

-- 6. Eliminar el bus de prueba
DELETE FROM Bus
WHERE placa = 'ZZZ999';

-- 7. Eliminar la empresa de prueba
DELETE FROM Empresa_de_buses
WHERE nombre_empresa = 'Empresa Prueba DML';
