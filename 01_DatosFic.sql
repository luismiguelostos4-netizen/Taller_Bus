
USE glob_gusters;

-- ============================================
-- 1. DATOS PARA LA TABLA Empresa_de_buses
-- ============================================

INSERT INTO Empresa_de_buses (id_empresa, nombre_empresa) VALUES
(1, 'TransRápido Bogotá'),
(2, 'Movilidad Andina'),
(3, 'Transportes del Centro');

-- ============================================
-- 2. DATOS PARA LA TABLA Pasajero
-- ============================================

INSERT INTO Pasajero (id_pasajero, nombre_pasajero, cedula) VALUES
(1, 'Laura Gómez', '1000000001'),
(2, 'Andrés Torres', '1000000002'),
(3, 'Sofía Ramírez', '1000000003'),
(4, 'Carlos Méndez', '1000000004'),
(5, 'Valentina Rojas', '1000000005'),
(6, 'Daniel Castro', '1000000006');

-- ============================================
-- 3. DATOS PARA LA TABLA Bus
-- ============================================

INSERT INTO Bus (id_bus, id_empresa, placa, modelo) VALUES
(1, 1, 'ABC123', 'Mercedes-Benz OF'),
(2, 1, 'DEF456', 'BYD K9'),
(3, 2, 'GHI789', 'Volvo B8R'),
(4, 2, 'JKL012', 'Mercedes-Benz O500'),
(5, 3, 'MNO345', 'Scania K280');

-- ============================================
-- 4. DATOS PARA LA TABLA Chofer
-- ============================================

INSERT INTO Chofer
(id_chofer, id_empresa, direccion, nombre_chofer, cedula)
VALUES
(1, 1, 'Calle 10 # 15-20', 'Jorge Martínez', '2000000001'),
(2, 1, 'Carrera 20 # 30-15', 'Diana López', '2000000002'),
(3, 2, 'Calle 45 # 12-10', 'Felipe Herrera', '2000000003'),
(4, 2, 'Carrera 60 # 25-40', 'Natalia Pérez', '2000000004'),
(5, 3, 'Calle 80 # 10-25', 'Sebastián Ruiz', '2000000005');

-- ============================================
-- 5. DATOS PARA LA TABLA Bus_Chofer
-- ============================================

INSERT INTO Bus_Chofer (id_bus, id_chofer) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- ============================================
-- 6. DATOS PARA LA TABLA Ruta
-- ============================================

INSERT INTO Ruta (id_ruta, inicio_viaje, fin_viaje) VALUES
(1, 'Portal Norte', 'Portal Sur'),
(2, 'Suba', 'Centro'),
(3, 'Chapinero', 'Kennedy'),
(4, 'Usaquén', 'Fontibón');

-- ============================================
-- 7. DATOS PARA LA TABLA Bus_ruta
-- ============================================

INSERT INTO Bus_ruta (id_bus, id_ruta) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 4);

-- ============================================
-- 8. DATOS PARA LA TABLA Parada
-- ============================================

INSERT INTO Parada
(id_parada, id_ruta, numero_parada, direccion_parada)
VALUES
(1, 1, 1, 'Portal Norte'),
(2, 1, 2, 'Calle 100'),
(3, 1, 3, 'Portal Sur'),
(4, 2, 1, 'Suba Centro'),
(5, 2, 2, 'Avenida Caracas'),
(6, 2, 3, 'Centro Histórico'),
(7, 3, 1, 'Chapinero Central'),
(8, 3, 2, 'Kennedy Central'),
(9, 4, 1, 'Usaquén Principal'),
(10, 4, 2, 'Fontibón Central');

-- ============================================
-- 9. DATOS PARA LA TABLA Horario
-- ============================================

INSERT INTO Horario
(id_horario, id_parada, hora_estimada, fecha)
VALUES
(1, 1, '06:00:00', '2026-10-12'),
(2, 2, '06:20:00', '2026-10-12'),
(3, 3, '07:00:00', '2026-10-12'),
(4, 4, '07:30:00', '2026-10-12'),
(5, 5, '07:50:00', '2026-10-12'),
(6, 6, '08:15:00', '2026-10-12'),
(7, 7, '08:30:00', '2026-10-12'),
(8, 8, '09:10:00', '2026-10-12'),
(9, 9, '09:30:00', '2026-10-12'),
(10, 10, '10:00:00', '2026-10-12');

-- ============================================
-- 10. DATOS PARA LA TABLA Torniquete
-- ============================================

INSERT INTO Torniquete
(id_torniquete, id_bus, fecha, modelo)
VALUES
(1, 1, '2025-01-15', 'Torniquete T100'),
(2, 2, '2025-03-20', 'Torniquete T200'),
(3, 3, '2025-05-10', 'Torniquete T100'),
(4, 4, '2025-07-25', 'Torniquete T300'),
(5, 5, '2025-09-01', 'Torniquete T200');

-- ============================================
-- 11. DATOS PARA LA TABLA Tarjeta
-- ============================================

INSERT INTO Tarjeta
(id_tarjeta, id_pasajero, id_empresa, saldo, fecha_creacion)
VALUES
(1, 1, 1, 25000.00, '2026-01-10'),
(2, 2, 1, 18000.00, '2026-02-15'),
(3, 3, 2, 32000.00, '2026-03-05'),
(4, 4, 2, 12000.00, '2026-04-20'),
(5, 5, 3, 28000.00, '2026-05-12'),
(6, 6, 3, 15000.00, '2026-06-08');

-- ============================================
-- 12. DATOS PARA LA TABLA Registro_torniquete
-- ============================================

INSERT INTO Registro_torniquete
(id_registro_torniquete, id_torniquete, id_tarjeta, fecha, numero_registro)
VALUES
(1, 1, 1, '2026-10-12 06:05:00', 1001),
(2, 1, 2, '2026-10-12 06:12:00', 1002),
(3, 2, 3, '2026-10-12 07:35:00', 1003),
(4, 3, 4, '2026-10-12 08:40:00', 1004),
(5, 4, 5, '2026-10-12 09:15:00', 1005),
(6, 5, 6, '2026-10-12 10:05:00', 1006),
(7, 2, 1, '2026-10-12 11:20:00', 1007),
(8, 3, 2, '2026-10-12 12:10:00', 1008);

-- ============================================
-- FIN DEL SCRIPT DE DATOS FICTICIOS
-- ============================================
