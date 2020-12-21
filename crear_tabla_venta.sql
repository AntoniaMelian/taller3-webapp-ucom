CREATE TABLE public.venta (
	venta_id serial NULL,
	fecha_venta date NULL,
	cliente_id int NULL,
	monto_total int NULL,
	nro_factura varchar NULL,
	activo boolean NULL,
	CONSTRAINT venta_pk PRIMARY KEY (venta_id)
);
