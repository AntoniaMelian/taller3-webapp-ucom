CREATE TABLE public.articulo (
	articulo_id serial NOT NULL,
	descripcion varchar NULL,
	precio_publico int NULL,
	precio_mayorista int NULL,
	activo boolean NULL,
	CONSTRAINT articulo_pk PRIMARY KEY (articulo_id)
);