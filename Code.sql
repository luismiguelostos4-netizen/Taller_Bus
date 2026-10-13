
CREATE DATABASE IF NOT EXISTS glob_gusters
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE glob_gusters;



DROP TABLE IF EXISTS Registro_torniquete;
DROP TABLE IF EXISTS Tarjeta;
DROP TABLE IF EXISTS Torniquete;
DROP TABLE IF EXISTS Horario;
DROP TABLE IF EXISTS Parada;
DROP TABLE IF EXISTS Bus_ruta;
DROP TABLE IF EXISTS Bus_Chofer;
DROP TABLE IF EXISTS Chofer;
DROP TABLE IF EXISTS Bus;
DROP TABLE IF EXISTS Ruta;
DROP TABLE IF EXISTS Pasajero;
DROP TABLE IF EXISTS Empresa_de_buses;

-- 2. TABLA: Empresa_de_buses

CREATE TABLE Empresa_de_buses (
    id_empresa INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre_empresa VARCHAR(100) NOT NULL,

    PRIMARY KEY (id_empresa),
    UNIQUE (nombre_empresa)
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 3. TABLA: Pasajero

CREATE TABLE Pasajero (
    id_pasajero INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre_pasajero VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) NOT NULL,

    PRIMARY KEY (id_pasajero),
    UNIQUE (cedula)
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 4. TABLA: Bus

CREATE TABLE Bus (
    id_bus INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_empresa INT UNSIGNED NOT NULL,
    placa VARCHAR(10) NOT NULL,
    modelo VARCHAR(80) NOT NULL,

    PRIMARY KEY (id_bus),
    UNIQUE (placa),

    CONSTRAINT fk_bus_empresa
        FOREIGN KEY (id_empresa)
        REFERENCES Empresa_de_buses (id_empresa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 5. TABLA: Chofer

CREATE TABLE Chofer (
    id_chofer INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_empresa INT UNSIGNED NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    nombre_chofer VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) NOT NULL,

    PRIMARY KEY (id_chofer),
    UNIQUE (cedula),

    CONSTRAINT fk_chofer_empresa
        FOREIGN KEY (id_empresa)
        REFERENCES Empresa_de_buses (id_empresa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 6. TABLA: Bus_Chofer
-- Relacion muchos a muchos entre Bus y Chofer

CREATE TABLE Bus_Chofer (
    id_bus INT UNSIGNED NOT NULL,
    id_chofer INT UNSIGNED NOT NULL,

    PRIMARY KEY (id_bus, id_chofer),

    CONSTRAINT fk_bus_chofer_bus
        FOREIGN KEY (id_bus)
        REFERENCES Bus (id_bus)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_bus_chofer_chofer
        FOREIGN KEY (id_chofer)
        REFERENCES Chofer (id_chofer)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 7. TABLA: Ruta

CREATE TABLE Ruta (
    id_ruta INT UNSIGNED NOT NULL AUTO_INCREMENT,
    inicio_viaje VARCHAR(100) NOT NULL,
    fin_viaje VARCHAR(100) NOT NULL,

    PRIMARY KEY (id_ruta)
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 8. TABLA: Bus_ruta
-- Relacion muchos a muchos entre Bus y Ruta

CREATE TABLE Bus_ruta (
    id_bus INT UNSIGNED NOT NULL,
    id_ruta INT UNSIGNED NOT NULL,

    PRIMARY KEY (id_bus, id_ruta),

    CONSTRAINT fk_bus_ruta_bus
        FOREIGN KEY (id_bus)
        REFERENCES Bus (id_bus)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_bus_ruta_ruta
        FOREIGN KEY (id_ruta)
        REFERENCES Ruta (id_ruta)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 9. TABLA: Parada

CREATE TABLE Parada (
    id_parada INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_ruta INT UNSIGNED NOT NULL,
    numero_parada INT UNSIGNED NOT NULL,
    direccion_parada VARCHAR(150) NOT NULL,

    PRIMARY KEY (id_parada),

    CONSTRAINT uq_parada_ruta_numero
        UNIQUE (id_ruta, numero_parada),

    CONSTRAINT fk_parada_ruta
        FOREIGN KEY (id_ruta)
        REFERENCES Ruta (id_ruta)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 10. TABLA: Horario

CREATE TABLE Horario (
    id_horario INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_parada INT UNSIGNED NOT NULL,
    hora_estimada TIME NOT NULL,
    fecha DATE NOT NULL,

    PRIMARY KEY (id_horario),

    CONSTRAINT fk_horario_parada
        FOREIGN KEY (id_parada)
        REFERENCES Parada (id_parada)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 11. TABLA: Torniquete

CREATE TABLE Torniquete (
    id_torniquete INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_bus INT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    modelo VARCHAR(50) NOT NULL,

    PRIMARY KEY (id_torniquete),

    CONSTRAINT fk_torniquete_bus
        FOREIGN KEY (id_bus)
        REFERENCES Bus (id_bus)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 12. TABLA: Tarjeta

CREATE TABLE Tarjeta (
    id_tarjeta INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_pasajero INT UNSIGNED NOT NULL,
    id_empresa INT UNSIGNED NOT NULL,
    saldo DECIMAL(10,2) NOT NULL,
    fecha_creacion DATE NOT NULL,

    PRIMARY KEY (id_tarjeta),

    CONSTRAINT fk_tarjeta_pasajero
        FOREIGN KEY (id_pasajero)
        REFERENCES Pasajero (id_pasajero)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_tarjeta_empresa
        FOREIGN KEY (id_empresa)
        REFERENCES Empresa_de_buses (id_empresa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- 13. TABLA: Registro_torniquete

CREATE TABLE Registro_torniquete (
    id_registro_torniquete INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_torniquete INT UNSIGNED NOT NULL,
    id_tarjeta INT UNSIGNED NOT NULL,
    fecha DATETIME NOT NULL,
    numero_registro INT UNSIGNED NOT NULL,

    PRIMARY KEY (id_registro_torniquete),

    CONSTRAINT fk_registro_torniquete
        FOREIGN KEY (id_torniquete)
        REFERENCES Torniquete (id_torniquete)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_registro_tarjeta
        FOREIGN KEY (id_tarjeta)
        REFERENCES Tarjeta (id_tarjeta)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_general_ci;

-- FIN DEL SCRIPT
