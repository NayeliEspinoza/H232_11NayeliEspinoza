
-- Poner es uso la base de datos db_11JasDigitalMedio
USE db_11JasDigitalMedio;

-- Cambiamos el idioma a español  
SET LANGUAGE Español;
SELECT @@language AS 'Idioma';

-- Ver formato de fecha y hora del servidor 
SELECT sysdatetime() as 'Fecha y  hora'
GO

-- Configurar el formato de fecha 
SET DATEFORMAT dmy
GO

-------------------TABLAS "MAESTRAS" INSERCCION DE DATOS-------------------  

-- DATOS DE TABLA AREA

INSERT INTO area(name, name_head_area, lastname_head_area)
VALUES
('PRODUCCION','Nayeli Jackeline', 'Espinoza Tellez'),
('CONTABILIDAD','Rosa Carolina', 'Sanchez Gamez'),
('MARKETING','Melissa Linn', 'Panduro Albino'),
('RECURSOS HUMANOS', 'Rosa Maria', 'Palacios Castillon'),
('VENTAS',  'Erica Janeth', 'Ojeda Sanchez');

SELECT * FROM area

-- DATOS DE TABLA DEPRECIATION

INSERT INTO depreciation(descriptions_good, percentage)
VALUES
('Ganado de trabajo y reproduccion redes de pesca', 25),
('Vehiculo de transporte terrestre (excepto ferrocarriles; horno en general)',20),
('Maquinaria y equipo utilizados por las actividades mineras, petroleras y de construccion',20),
('Equipos de procesamiento de datos', 25),
('Maquinaria y equipo adquirido a partir del 1/1/1991',  10),
('Otros bienes del activo fijo',  10);

SELECT*FROM depreciation

-- 1ro Configurar el formato de fecha 

SET DATEFORMAT dmy
GO

--DATOS DE TABLA GOODS

INSERT INTO goods(code, amount, details_goods, book_value,date_entry, depreciation_id, area_id, state)
VALUES
('EQ-001', '12', 'Escritorio color gris', '400.00','11/12/2023', 2, 1, 'ALTA'),
('EQ-002','10', 'Escritorio color marrón', '900.00','09/11/2023', 4, 2, 'ALTA'),
('EQ-003','2', 'Escritorio color gris', '490.00','28/02/2023', 2, 3, 'ALTA'),
('EQ-004','32', 'Escritorio color gris', '90.00','01/10/2023', 1, 4, 'ALTA'),
('EQ-005', '9', 'Escritorio color gris', '40.00','08/05/2023', 2, 1, 'BAJA');

SELECT * FROM goods

-------------------TABLAS "TRANSACCIONALES" INSERCCION DE DATOS------------------- 

-- DATOS DE TABLA INVENTORY

INSERT INTO inventory(goods_id, state)
VALUES
(1, 'ALTA'),
(3, 'ALTA'),
(3, 'ALTA'),
(2, 'ALTA'),
(1, 'BAJA');

SELECT * FROM inventory 


