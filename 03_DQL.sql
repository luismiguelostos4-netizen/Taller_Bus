
USE glob_gusters;

-- 1. Consultar todos los buses
SELECT *
FROM Bus;

-- 2. Buscar buses cuyo modelo contenga la palabra Mercedes
SELECT *
FROM Bus
WHERE modelo LIKE '%Mercedes%';

-- 3. Consultar buses junto con el nombre de su empresa
SELECT
    b.id_bus,
    b.placa,
    b.modelo,
    e.nombre_empresa
FROM Bus b
INNER JOIN Empresa_de_buses e
    ON b.id_empresa = e.id_empresa;

-- 4. Consultar los buses y sus choferes
SELECT
    b.placa,
    b.modelo,
    c.nombre_chofer
FROM Bus b
INNER JOIN Bus_Chofer bc
    ON b.id_bus = bc.id_bus
INNER JOIN Chofer c
    ON bc.id_chofer = c.id_chofer;

-- 5. Consultar las rutas y sus paradas
SELECT
    r.id_ruta,
    r.inicio_viaje,
    r.fin_viaje,
    p.numero_parada,
    p.direccion_parada
FROM Ruta r
INNER JOIN Parada p
    ON r.id_ruta = p.id_ruta
ORDER BY r.id_ruta, p.numero_parada;

-- 6. Contar cuántos buses tiene cada empresa
SELECT
    e.nombre_empresa,
    COUNT(b.id_bus) AS cantidad_buses
FROM Empresa_de_buses e
LEFT JOIN Bus b
    ON e.id_empresa = b.id_empresa
GROUP BY e.id_empresa, e.nombre_empresa;

-- 7. Contar cuántas tarjetas tiene cada empresa
SELECT
    e.nombre_empresa,
    COUNT(t.id_tarjeta) AS cantidad_tarjetas
FROM Empresa_de_buses e
LEFT JOIN Tarjeta t
    ON e.id_empresa = t.id_empresa
GROUP BY e.id_empresa, e.nombre_empresa;

-- 8. Consultar los pasajeros y sus tarjetas
SELECT
    p.nombre_pasajero,
    t.id_tarjeta,
    t.saldo
FROM Pasajero p
INNER JOIN Tarjeta t
    ON p.id_pasajero = t.id_pasajero;
