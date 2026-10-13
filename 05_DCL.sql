
USE glob_gusters;

-- 1. Crear un usuario para consultar reportes
CREATE USER IF NOT EXISTS
'glob_gusters_reportes'@'localhost'
IDENTIFIED BY 'Reportes_2026_Cambiar';

-- 2. Dar permiso únicamente de consulta sobre la base
GRANT SELECT
ON glob_gusters.*
TO 'glob_gusters_reportes'@'localhost';

-- 3. Crear un usuario para operaciones
CREATE USER IF NOT EXISTS
'glob_gusters_operador'@'localhost'
IDENTIFIED BY 'Operador_2026_Cambiar';

-- 4. Dar permisos de consulta, inserción y actualización
GRANT SELECT, INSERT, UPDATE
ON glob_gusters.*
TO 'glob_gusters_operador'@'localhost';

-- 5. Retirar el permiso de actualización al operador
REVOKE UPDATE
ON glob_gusters.*
FROM 'glob_gusters_operador'@'localhost';

-- 6. Consultar los permisos de cada usuario
SHOW GRANTS FOR 'glob_gusters_reportes'@'localhost';

SHOW GRANTS FOR 'glob_gusters_operador'@'localhost';
