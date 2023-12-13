-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-12-13 17:26:32.325

-- tables
-- Table: Activos_Fijos
CREATE TABLE Activos_Fijos (
    activoID int  NOT NULL,
    nombre_activo varchar(50)  NOT NULL,
    valor_libro decimal(10,2)  NOT NULL,
    fecha_ingreso date  NOT NULL,
    fecha_depreciacion date  NOT NULL,
    cliente_id_cliente int  NOT NULL,
    CONSTRAINT Activos_Fijos_pk PRIMARY KEY  (activoID)
);
drop table Activos_Fijos
-- Table: Area
CREATE TABLE Area (
    id int  NOT NULL,
    nombre_area varchar(50)  NOT NULL,
    nombre_encargado varchar(100)  NOT NULL,
    apellido_encargado varchar(100)  NOT NULL,
    CONSTRAINT Area_pk PRIMARY KEY  (id)
);

-- Table: Bienes
CREATE TABLE Bienes (
    id_bienes int  NOT NULL,
    cantidad varchar(10)  NOT NULL,
    codigo varchar(10)  NOT NULL,
    descripcion_bienes varchar(100)  NOT NULL,
    CONSTRAINT Bienes_pk PRIMARY KEY  (id_bienes)
);

-- Table: Depreciacion_Mensual
CREATE TABLE Depreciacion_Mensual (
    depreciacionID int  NOT NULL,
    nombre_depreciacion varchar(50)  NOT NULL,
    valor_libro decimal(10,2)  NOT NULL,
    fecha_ingreso date  NOT NULL,
    fecha_depreciacion date  NOT NULL,
    Activos_Fijos_activoID int  NOT NULL,
    CONSTRAINT Depreciacion_Mensual_pk PRIMARY KEY  (depreciacionID)
);

-- Table: Cliente
CREATE TABLE cliente (
    id_cliente int  NOT NULL,
    nombre varchar(50)  NOT NULL,
    direccion varchar(50)  NOT NULL,
    correo varchar(100)  NOT NULL,
    celular char(9)  NOT NULL,
    CONSTRAINT Usuarios_pk PRIMARY KEY  (id_cliente)
);



-- Creación de la base de datos
CREATE DATABASE JASDigitalMedio;

-- Seleccionar la base de datos
USE JASDigitalMedio;


-- Inserción de 5 registros en tablas maestras 

INSERT INTO Bienes (id_bienes, cantidad, codigo, descripcion_bienes)
VALUES
    (1, '20', 'EQ-001', 'Computadora portátil'),
    (2, '50', 'EQ-002', 'Impresora láser'),
    (3, '10', 'EQ-003', 'Teléfono móvil'),
    (4, '30', 'EQ-004', 'Escritorio de oficina'),
    (5, '5', 'EQ-005', 'Silla ergonómica');

select * from bienes

INSERT INTO cliente (id_cliente, nombre, direccion, correo, celular)
VALUES
(1, 'John Doe', '123 Main Street', 'john.doe@example.com', '123456789'),
(2, 'Jane Smith', '456 Oak Avenue', 'jane.smith@example.com', '987654321'),
(3, 'Bob Johnson', '789 Pine Road', 'bob.johnson@example.com', '456789012'),
(4, 'Alice Brown', '321 Elm Lane', 'alice.brown@example.com', '789012345'),
(5, 'Charlie Wilson', '555 Maple Drive', 'charlie.wilson@example.com', '234567890');

select * from cliente

-- Inserción de 5 registros en tablas transaccioinales

INSERT INTO Activos_Fijos (activoID, nombre_activo, valor_libro, fecha_ingreso, fecha_depreciacion, cliente_id_cliente)
VALUES
    (1, 'Computadora portátil', 1200.00, '2023-01-01', '2024-01-01', 1),
    (2, 'Impresora láser', 500.00, '2023-02-15', '2024-02-15', 2),
    (3, 'Teléfono móvil', 800.00, '2023-03-10', '2024-03-10', 3),
    (4, 'Escritorio de oficina', 300.00, '2023-04-20', '2024-04-20', 4),
    (5, 'Silla ergonómica', 150.00, '2023-05-05', '2024-05-05', 5),
    (6, 'Proyector multimedia', 1000.00, '2023-06-12', '2024-06-12', 6),
    (7, 'Vehículo de empresa', 15000.00, '2023-07-08', '2024-07-08', 7),
    (8, 'Equipo de refrigeración', 2000.00, '2023-08-25', '2024-08-25', 8),
    (9, 'Maquinaria industrial', 5000.00, '2023-09-18', '2024-09-18', 9),
    (10, 'Muebles de oficina', 600.00, '2023-10-30', '2024-10-30', 10);

select * from Activos_Fijos

-- Actualizar la cantidad del bien con id_bienes igual a 1
UPDATE Bienes
SET cantidad = '15'
WHERE id_bienes = 1;

-- Agregar columna eliminado (si no existe)
ALTER TABLE Bienes
ADD COLUMN eliminado int DEFAULT 0;

-- Realizar eliminado lógico del bien con id_bienes igual a 2
UPDATE Bienes
SET eliminado = 1
WHERE id_bienes = 2;

-- Listar todos los registros en la tabla Bienes
SELECT * FROM Bienes;

-- Actualizar la dirección del cliente con id_cliente igual a 1
UPDATE cliente
SET direccion = 'Nueva Dirección'
WHERE id_cliente = 1;

-- Agregar columna eliminado (si no existe)
ALTER TABLE cliente
ADD COLUMN eliminado int DEFAULT 0;

-- Realizar eliminado lógico del cliente con id_cliente igual a 2
UPDATE cliente
SET eliminado = 1
WHERE id_cliente = 2;

-- Listar todos los registros en la tabla cliente
SELECT * FROM cliente;


--transaccional 

-- Actualizar el nombre del área con id igual a 1
UPDATE Area
SET nombre_area = 'Nuevo Nombre de Área'
WHERE id = 1;

-- Agregar columna eliminado (si no existe)
ALTER TABLE Activos_Fijos
ADD COLUMN eliminado int DEFAULT 0;

-- Realizar eliminado lógico del área con id igual a 2
UPDATE Activos_Fijos
SET eliminado = 1
WHERE id = 2;

-- Listar todos los registros en la tabla Area
SELECT * FROM Activos_Fijos;