--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2020-12-21 13:33:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 24697)
-- Name: articulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articulo (
    articulo_id integer NOT NULL,
    descripcion character varying,
    precio_publico integer,
    precio_mayorista integer,
    activo boolean
);


ALTER TABLE public.articulo OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24695)
-- Name: articulo_articulo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articulo_articulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articulo_articulo_id_seq OWNER TO postgres;

--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 209
-- Name: articulo_articulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articulo_articulo_id_seq OWNED BY public.articulo.articulo_id;


--
-- TOC entry 200 (class 1259 OID 24646)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(200)
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24649)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre character varying,
    apellido character varying,
    direccion character varying,
    telefono character varying
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24655)
-- Name: cliente_mascota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_mascota (
    id integer NOT NULL,
    id_cliente integer,
    id_mascota integer,
    activo boolean
);


ALTER TABLE public.cliente_mascota OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24658)
-- Name: cliente_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_mascota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_mascota_id_seq OWNER TO postgres;

--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 203
-- Name: cliente_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_mascota_id_seq OWNED BY public.cliente_mascota.id;


--
-- TOC entry 204 (class 1259 OID 24660)
-- Name: mascota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mascota (
    id_mascota integer NOT NULL,
    nombre character varying,
    id_categoria integer
);


ALTER TABLE public.mascota OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24666)
-- Name: servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicio (
    fecha_servicio date,
    estado character varying,
    id_tipo_servicio integer,
    id_servicio integer NOT NULL,
    id_client integer,
    id_mascota integer
);


ALTER TABLE public.servicio OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24672)
-- Name: servicio_id_servicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicio_id_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servicio_id_servicio_seq OWNER TO postgres;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 206
-- Name: servicio_id_servicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicio_id_servicio_seq OWNED BY public.servicio.id_servicio;


--
-- TOC entry 207 (class 1259 OID 24674)
-- Name: tipo_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_servicio (
    id_tipo_servicio integer NOT NULL,
    nombre_servicio character varying
);


ALTER TABLE public.tipo_servicio OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24680)
-- Name: tipo_servicio_id_tipo_servicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_servicio_id_tipo_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_servicio_id_tipo_servicio_seq OWNER TO postgres;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 208
-- Name: tipo_servicio_id_tipo_servicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_servicio_id_tipo_servicio_seq OWNED BY public.tipo_servicio.id_tipo_servicio;


--
-- TOC entry 212 (class 1259 OID 24708)
-- Name: venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venta (
    venta_id integer NOT NULL,
    fecha_venta date,
    cliente_id integer,
    monto_total integer,
    nro_factura character varying,
    activo boolean
);


ALTER TABLE public.venta OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24706)
-- Name: venta_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venta_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venta_venta_id_seq OWNER TO postgres;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 211
-- Name: venta_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venta_venta_id_seq OWNED BY public.venta.venta_id;


--
-- TOC entry 2895 (class 2604 OID 24700)
-- Name: articulo articulo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulo ALTER COLUMN articulo_id SET DEFAULT nextval('public.articulo_articulo_id_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 24682)
-- Name: cliente_mascota id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_mascota ALTER COLUMN id SET DEFAULT nextval('public.cliente_mascota_id_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 24683)
-- Name: servicio id_servicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio ALTER COLUMN id_servicio SET DEFAULT nextval('public.servicio_id_servicio_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 24684)
-- Name: tipo_servicio id_tipo_servicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_servicio ALTER COLUMN id_tipo_servicio SET DEFAULT nextval('public.tipo_servicio_id_tipo_servicio_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 24711)
-- Name: venta venta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta ALTER COLUMN venta_id SET DEFAULT nextval('public.venta_venta_id_seq'::regclass);


--
-- TOC entry 3051 (class 0 OID 24697)
-- Dependencies: 210
-- Data for Name: articulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articulo (articulo_id, descripcion, precio_publico, precio_mayorista, activo) FROM stdin;
1	Correa para perros	10000	8000	t
2	Pecera	50000	40000	t
3	Hueso de goma	15000	10000	\N
\.


--
-- TOC entry 3041 (class 0 OID 24646)
-- Dependencies: 200
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id, nombre) FROM stdin;
1	perro
2	gato
3	loro
4	hamster
\.


--
-- TOC entry 3042 (class 0 OID 24649)
-- Dependencies: 201
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, nombre, apellido, direccion, telefono) FROM stdin;
1	Diego Armando	Lopez	Coronel Romero 2025	0982555333
2	Deysi	Fernandez	Facundo Machain 203	0991305220
3	Pedro	Perez	Capitán Miranda	0985668987
\.


--
-- TOC entry 3043 (class 0 OID 24655)
-- Dependencies: 202
-- Data for Name: cliente_mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente_mascota (id, id_cliente, id_mascota, activo) FROM stdin;
1	1	3	t
2	2	1	t
3	1	2	\N
\.


--
-- TOC entry 3045 (class 0 OID 24660)
-- Dependencies: 204
-- Data for Name: mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mascota (id_mascota, nombre, id_categoria) FROM stdin;
2	michi	2
1	tobby	1
3	pancho	3
4	roro	4
\.


--
-- TOC entry 3046 (class 0 OID 24666)
-- Dependencies: 205
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicio (fecha_servicio, estado, id_tipo_servicio, id_servicio, id_client, id_mascota) FROM stdin;
\N	\N	\N	4	\N	\N
\N	\N	\N	5	\N	\N
2020-12-11	en_proceso	1	6	1	1
2020-12-11	en_proceso	1	7	1	1
2020-12-11	en_proceso	1	8	1	1
2020-12-11	en_proceso	\N	9	1	1
2020-12-11	en_proceso	3	10	3	1
2020-12-11	en_proceso	1	11	1	1
2020-12-11	en_proceso	1	12	1	1
2020-12-11	en_proceso	1	13	1	1
2020-12-11	en_proceso	1	14	1	1
2020-12-11	en_proceso	1	15	1	1
2020-12-11	en_proceso	1	16	1	1
2020-12-11	en_proceso	1	17	1	1
2020-12-11	en_proceso	1	18	1	1
2020-12-11	en_proceso	1	19	1	1
\.


--
-- TOC entry 3048 (class 0 OID 24674)
-- Dependencies: 207
-- Data for Name: tipo_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_servicio (id_tipo_servicio, nombre_servicio) FROM stdin;
1	baño
2	vacunación
3	curación
4	corte de uña
\.


--
-- TOC entry 3053 (class 0 OID 24708)
-- Dependencies: 212
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta (venta_id, fecha_venta, cliente_id, monto_total, nro_factura, activo) FROM stdin;
1	2020-09-12	1	200000	1234567	t
2	2020-03-09	2	300000	9876543	t
3	2020-08-12	3	15000	6789543	\N
\.


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 209
-- Name: articulo_articulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articulo_articulo_id_seq', 1, false);


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 203
-- Name: cliente_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_mascota_id_seq', 3, true);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 206
-- Name: servicio_id_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicio_id_servicio_seq', 19, true);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 208
-- Name: tipo_servicio_id_tipo_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_servicio_id_tipo_servicio_seq', 4, true);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 211
-- Name: venta_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_venta_id_seq', 1, false);


--
-- TOC entry 2908 (class 2606 OID 24705)
-- Name: articulo articulo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT articulo_pk PRIMARY KEY (articulo_id);


--
-- TOC entry 2900 (class 2606 OID 24686)
-- Name: cliente_mascota cliente_mascota_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_mascota
    ADD CONSTRAINT cliente_mascota_pk PRIMARY KEY (id);


--
-- TOC entry 2898 (class 2606 OID 24688)
-- Name: cliente cliente_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY (id_cliente);


--
-- TOC entry 2902 (class 2606 OID 24690)
-- Name: mascota mascota_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT mascota_pk PRIMARY KEY (id_mascota);


--
-- TOC entry 2904 (class 2606 OID 24692)
-- Name: servicio servicio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pk PRIMARY KEY (id_servicio);


--
-- TOC entry 2906 (class 2606 OID 24694)
-- Name: tipo_servicio tipo_servicio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_servicio
    ADD CONSTRAINT tipo_servicio_pk PRIMARY KEY (id_tipo_servicio);


--
-- TOC entry 2910 (class 2606 OID 24716)
-- Name: venta venta_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pk PRIMARY KEY (venta_id);


-- Completed on 2020-12-21 13:33:48

--
-- PostgreSQL database dump complete
--

