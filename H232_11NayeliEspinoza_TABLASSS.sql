
-- Crear la base de datos db_JasDigitalMedio
CREATE DATABASE db_11JasDigitalMedio

-- Poner es uso la base de datos db_JasDigitalMedio
USE db_11JasDigitalMedio;

-- Cambiamos el idioma a español  
SET LANGUAGE Español;
SELECT @@language AS 'Idioma';


-------------------TABLAS "MAESTRAS"-------------------   

-- Table: area
CREATE TABLE area (
    id int  NOT NULL IDENTITY (1,1),
    name varchar(70)  NOT NULL,
    name_head_area varchar(80)  NOT NULL,
    lastname_head_area varchar(90)  NOT NULL,
    CONSTRAINT area_pk PRIMARY KEY  (id)
);

-- Table: depreciation
CREATE TABLE depreciation (
    id int  NOT NULL  IDENTITY (1,1),
    descriptions_good varchar(100)  NOT NULL,
    percentage int  NOT NULL,
    CONSTRAINT depreciation_pk PRIMARY KEY  (id)
);

-- Table: goods
CREATE TABLE goods (
    id int identity(1,1),
    code varchar(10)  NOT NULL,
    amount int  NOT NULL,
    details_goods varchar(100)  NOT NULL,
    book_value decimal(8,2)  NOT NULL,
    date_entry date  NOT NULL,
    date_depreciation date  NOT NULL,
    state char(4)  NOT NULL,
    depreciation_id int  NOT NULL,
    area_id int  NOT NULL,
    CONSTRAINT goods_pk PRIMARY KEY  (id)
);

-------------------TABLAS "TRANSACCIONAL"-------------------

-- Table: inventory
CREATE TABLE inventory (
    id int  NOT NULL  IDENTITY (1,1),
    goods_id int  NOT NULL,
    date_time datetime  NOT NULL,
    state char(4)  NOT NULL,
    CONSTRAINT inventory_pk PRIMARY KEY  (id)
);


 -------------------- "RESTRICCIONES"  -----------------------
											 
-- Restricciones para la Tabla Goods 

-- Restricción para estados  válidos (ALTA o BAJA)
ALTER TABLE goods
    ADD CONSTRAINT chk_state_goods CHECK(state ='ALTA' OR state ='BAJA');

-- Restriccion para asegurar que el campo amount (cantidad) sera un valor positivo
ALTER TABLE goods
    ADD CONSTRAINT chk_amount_goods CHECK(amount > 0);

-- Restricción para asignar por defecto la fecha del 31 de diciembre del año en curso a la columna date_depreciation
ALTER TABLE goods
    ADD CONSTRAINT df_date_depreciation_goods DEFAULT DATEFROMPARTS(YEAR(GETDATE()), 12, 31) FOR date_depreciation;


-- Restricciones para la Tabla inventory 

-- Restricción para asignar un valor por defecto la fecha y hora actual a la columna date_time
ALTER TABLE inventory
    ADD CONSTRAINT df_date_time_inventory DEFAULT GETDATE() FOR date_time;

-- Restricción para estados  válidos (ALTA o BAJA)
ALTER TABLE inventory
    ADD CONSTRAINT chk_state_inventory CHECK(state ='ALTA' OR state ='BAJA');



------------------  "RELACIONES"  -------------------
											 
-- foreign keys

-- 1. Un bien puede estar en uno o varias veces en el inventario
ALTER TABLE inventory ADD CONSTRAINT inventory_goods
    FOREIGN KEY (goods_id)
    REFERENCES goods (id);

-- 2. Un area puede estar una o muchos bienes
ALTER TABLE goods ADD CONSTRAINT goods_area
    FOREIGN KEY (area_id)
    REFERENCES area (id);

-- 3. Una depreciacion puede estar una o muchos bienes
ALTER TABLE goods ADD CONSTRAINT goods_depreciation
    FOREIGN KEY (depreciation_id)
    REFERENCES depreciation (id);


------------------  "INDICE"  -------------------

-- Índice no agrupado para la tabla goods en la columna details_goods
CREATE NONCLUSTERED INDEX idx_details_goods
ON goods (details_goods);