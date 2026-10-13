
USE glob_gusters;

-- 1. Vista de buses y sus empresas
CREATE OR REPLACE VIEW v_buses_empresa AS
SELECT
    b.id_bus,
    b.placa,
    b.modelo,
    e.nombre_empresa
FROM Bus b
INNER JOIN Empresa_de_buses e
    ON b.id_empresa = e.id_empresa;

-- Consultar la vista
SELECT *
FROM v_buses_empresa;

-- 2. Vista de rutas y paradas
CREATE OR REPLACE VIEW v_rutas_paradas AS
SELECT
    r.id_ruta,
    r.inicio_viaje,
    r.fin_viaje,
    p.numero_parada,
    p.direccion_parada
FROM Ruta r
INNER JOIN Parada p
    ON r.id_ruta = p.id_ruta;

-- Consultar la vista
SELECT *
FROM v_rutas_paradas;

-- 3. Vista de pasajeros y sus tarjetas
CREATE OR REPLACE VIEW v_tarjetas_pasajeros AS
SELECT
    p.id_pasajero,
    p.nombre_pasajero,
    t.id_tarjeta,
    t.saldo,
    t.fecha_creacion
FROM Pasajero p
INNER JOIN Tarjeta t
    ON p.id_pasajero = t.id_pasajero;

-- Consultar la vista
SELECT *
FROM v_tarjetas_pasajeros;

-- Opcional: eliminar las vistas
-- DROP VIEW IF EXISTS v_buses_empresa;
-- DROP VIEW IF EXISTS v_rutas_paradas;
-- DROP VIEW IF EXISTS v_tarjetas_pasajeros;
