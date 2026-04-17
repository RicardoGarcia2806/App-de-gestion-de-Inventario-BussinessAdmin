--CREACION DE ESQUEMAS Y TABLAS 

--CLIENTE: 
CREATE SCHEMA bussinessadmin AUTHORIZATION postgres;

SET search_path TO bussinessadmin;
CREATE TABLE "CLIENTE"
(
id_cliente integer NOT NULL,
nombre character varying, 
usuario character varying NOT NULL,
clave character varying NOT NULL, 
estado character varying NOT NULL,
PRIMARY KEY (id_cliente)
);

ALTER TABLE IF EXISTS "CLIENTE"
OWNER TO postgres;

CREATE TABLE "CLIENTE_NATURAL"(
id_cliente integer,
cedula character varying,
nombre character varying, 
apellido character varying,
estado character varying,
PRIMARY KEY (cedula),
CONSTRAINT id_cliente FOREIGN KEY (id_cliente)
	REFERENCES "CLIENTE" (id_cliente) MATCH SIMPLE 
	ON UPDATE NO ACTION 
	ON DELETE NO ACTION 
	NOT VALID 
);

ALTER TABLE IF EXISTS "CLIENTE_NATURAL"
OWNER TO postgres;

CREATE TABLE "CLIENTE_JURIDICO"(
id_cliente integer,
rif character varying,
nombre_org character varying, 
tipo_org character varying,
estado character varying, 
PRIMARY KEY (rif),
CONSTRAINT id_cliente FOREIGN KEY (id_cliente)
	REFERENCES "CLIENTE" (id_cliente) MATCH SIMPLE 
	ON UPDATE NO ACTION 
	ON DELETE NO ACTION  
	NOT VALID 
);


ALTER TABLE IF EXISTS "CLIENTE_JURIDICO"
OWNER TO postgres;

--id_factura tiene el formato FXXXX
CREATE TABLE "VENTA"(
id_cliente integer, 
id_factura integer,
id_producto character varying, 
fecha timestamp,
monto numeric, 
estado character varying,
PRIMARY KEY (id_producto), 
CONSTRAINT id_cliente FOREIGN KEY (id_cliente)
	REFERENCES "CLIENTE" (id_cliente) MATCH SIMPLE 
	ON UPDATE NO ACTION 
	ON DELETE NO ACTION
	NOT VALID 
);

ALTER TABLE IF EXISTS "VENTA" 
OWNER TO postgres;

--nro_nota_entrega tiene el formato NXXXX
CREATE TABLE "DEUDA"(
id_cliente integer, 
nro_nota_entrega integer,
monto numeric, 
fecha timestamp, 
estado character varying,
PRIMARY KEY (nro_nota_entrega),
CONSTRAINT id_cliente FOREIGN KEY (id_cliente)
REFERENCES "CLIENTE" (id_cliente) MATCH SIMPLE 
	ON DELETE NO ACTION
	ON UPDATE NO ACTION 
	NOT VALID
);

ALTER TABLE IF EXISTS "DEUDA"
OWNER TO postgres;

CREATE TABLE "INVENTARIO"(
id_catalogo integer,
id_producto character varying,
descripcion character varying, 
estado character varying,
PRIMARY KEY (id_catalogo),
CONSTRAINT id_producto FOREIGN KEY (id_producto)
REFERENCES "VENTA" (id_producto) MATCH SIMPLE 
	ON UPDATE NO ACTION
	ON DELETE NO ACTION 
	NOT VALID 
);

ALTER TABLE IF EXISTS "INVENTARIO"
OWNER TO postgres;

CREATE TABLE "INVENTARIO_ELECTRONICA"(
id_catalogo integer,
id_producto character varying, 
codigo character varying, 
nombre character varying,
existencia integer, 
precio numeric,
PRIMARY KEY (codigo),
CONSTRAINT id_catalogo FOREIGN KEY (id_catalogo)
	REFERENCES "INVENTARIO" (id_catalogo) MATCH SIMPLE 
	ON UPDATE NO ACTION
	ON DELETE NO ACTION 
	NOT VALID
);

ALTER TABLE IF EXISTS "INVENTARIO_ELECTRONICA"
OWNER TO postgres;


CREATE TABLE "INVENTARIO_ROPA"(
id_catalogo integer,
id_producto character varying, 
codigo character varying, 
nombre character varying,
tipo character varying, 
talla character varying,
existencia integer,
precio numeric,
PRIMARY KEY (codigo),
CONSTRAINT id_catalogo FOREIGN KEY (id_catalogo)
	REFERENCES "INVENTARIO" (id_catalogo) MATCH SIMPLE 
	ON UPDATE NO ACTION
	ON DELETE NO ACTION 
	NOT VALID
);

ALTER TABLE IF EXISTS "INVENTARIO_ROPA"
OWNER TO postgres; 

CREATE TABLE "INVENTARIO_LIMPIEZA"(
id_catalogo integer,
id_producto character varying, 
codigo character varying, 
nombre character varying,
existencia integer, 
precio numeric,
PRIMARY KEY (codigo),
CONSTRAINT id_catalogo FOREIGN KEY (id_catalogo)
	REFERENCES "INVENTARIO" (id_catalogo) MATCH SIMPLE 
	ON UPDATE NO ACTION
	ON DELETE NO ACTION 
	NOT VALID
);

ALTER TABLE IF EXISTS "INVENTARIO_LIMPIEZA"
OWNER TO postgres;

CREATE TABLE "INVENTARIO_CONFITERIA"(
id_catalogo integer,
id_producto character varying, 
codigo character varying, 
nombre character varying,
existencia integer, 
precio numeric,
PRIMARY KEY (codigo),
CONSTRAINT id_catalogo FOREIGN KEY (id_catalogo)
	REFERENCES "INVENTARIO" (id_catalogo) MATCH SIMPLE 
	ON UPDATE NO ACTION
	ON DELETE NO ACTION 
	NOT VALID
);

ALTER TABLE IF EXISTS "INVENTARIO_CONFITERIA"
OWNER TO postgres;
