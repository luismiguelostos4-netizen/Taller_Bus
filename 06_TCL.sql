
USE glob_gusters;

-- Limpiar registros reservados para esta prueba anterior
DELETE FROM Empresa_de_buses
WHERE nombre_empresa IN (
    'Empresa Prueba TCL',
    'Empresa Prueba TCL 2',
    'Empresa Prueba ROLLBACK'
);

-- ============================================
-- 1. EJEMPLO CON SAVEPOINT Y COMMIT
-- ============================================

START TRANSACTION;

-- Insertar una empresa
INSERT INTO Empresa_de_buses (nombre_empresa)
VALUES ('Empresa Prueba TCL');

-- Crear un punto de guardado
SAVEPOINT punto_guardado;

-- Insertar una segunda empresa
INSERT INTO Empresa_de_buses (nombre_empresa)
VALUES ('Empresa Prueba TCL 2');

-- Deshacer solamente lo realizado después del SAVEPOINT
ROLLBACK TO SAVEPOINT punto_guardado;

-- Confirmar los cambios que quedan en la transacción
COMMIT;

-- Verificar el resultado
SELECT *
FROM Empresa_de_buses
WHERE nombre_empresa IN (
    'Empresa Prueba TCL',
    'Empresa Prueba TCL 2'
);

-- ============================================
-- 2. LIMPIEZA DEL PRIMER EJEMPLO
-- ============================================

START TRANSACTION;

DELETE FROM Empresa_de_buses
WHERE nombre_empresa = 'Empresa Prueba TCL';

COMMIT;

-- ============================================
-- 3. EJEMPLO CON ROLLBACK
-- ============================================

START TRANSACTION;

INSERT INTO Empresa_de_buses (nombre_empresa)
VALUES ('Empresa Prueba ROLLBACK');

-- Deshacer la inserción anterior
ROLLBACK;

-- Verificar que no se guardó el registro
SELECT *
FROM Empresa_de_buses
WHERE nombre_empresa = 'Empresa Prueba ROLLBACK';
