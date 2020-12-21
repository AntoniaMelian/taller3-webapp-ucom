PGDMP     0                    x        	   tallerIII    13.1    13.1 1    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16416 	   tallerIII    DATABASE     j   CREATE DATABASE "tallerIII" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Guarani_Paraguay.1252';
    DROP DATABASE "tallerIII";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    24697    articulo    TABLE     �   CREATE TABLE public.articulo (
    articulo_id integer NOT NULL,
    descripcion character varying,
    precio_publico integer,
    precio_mayorista integer,
    activo boolean
);
    DROP TABLE public.articulo;
       public         heap    postgres    false    3            �            1259    24695    articulo_articulo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.articulo_articulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.articulo_articulo_id_seq;
       public          postgres    false    210    3            �           0    0    articulo_articulo_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.articulo_articulo_id_seq OWNED BY public.articulo.articulo_id;
          public          postgres    false    209            �            1259    24646 	   categoria    TABLE     ^   CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(200)
);
    DROP TABLE public.categoria;
       public         heap    postgres    false    3            �            1259    24649    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre character varying,
    apellido character varying,
    direccion character varying,
    telefono character varying
);
    DROP TABLE public.cliente;
       public         heap    postgres    false    3            �            1259    24655    cliente_mascota    TABLE     �   CREATE TABLE public.cliente_mascota (
    id integer NOT NULL,
    id_cliente integer,
    id_mascota integer,
    activo boolean
);
 #   DROP TABLE public.cliente_mascota;
       public         heap    postgres    false    3            �            1259    24658    cliente_mascota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_mascota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_mascota_id_seq;
       public          postgres    false    3    202            �           0    0    cliente_mascota_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_mascota_id_seq OWNED BY public.cliente_mascota.id;
          public          postgres    false    203            �            1259    24660    mascota    TABLE     y   CREATE TABLE public.mascota (
    id_mascota integer NOT NULL,
    nombre character varying,
    id_categoria integer
);
    DROP TABLE public.mascota;
       public         heap    postgres    false    3            �            1259    24666    servicio    TABLE     �   CREATE TABLE public.servicio (
    fecha_servicio date,
    estado character varying,
    id_tipo_servicio integer,
    id_servicio integer NOT NULL,
    id_client integer,
    id_mascota integer
);
    DROP TABLE public.servicio;
       public         heap    postgres    false    3            �            1259    24672    servicio_id_servicio_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_id_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.servicio_id_servicio_seq;
       public          postgres    false    3    205            �           0    0    servicio_id_servicio_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.servicio_id_servicio_seq OWNED BY public.servicio.id_servicio;
          public          postgres    false    206            �            1259    24674    tipo_servicio    TABLE     t   CREATE TABLE public.tipo_servicio (
    id_tipo_servicio integer NOT NULL,
    nombre_servicio character varying
);
 !   DROP TABLE public.tipo_servicio;
       public         heap    postgres    false    3            �            1259    24680 "   tipo_servicio_id_tipo_servicio_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_servicio_id_tipo_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.tipo_servicio_id_tipo_servicio_seq;
       public          postgres    false    207    3            �           0    0 "   tipo_servicio_id_tipo_servicio_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.tipo_servicio_id_tipo_servicio_seq OWNED BY public.tipo_servicio.id_tipo_servicio;
          public          postgres    false    208            �            1259    24708    venta    TABLE     �   CREATE TABLE public.venta (
    venta_id integer NOT NULL,
    fecha_venta date,
    cliente_id integer,
    monto_total integer,
    nro_factura character varying,
    activo boolean
);
    DROP TABLE public.venta;
       public         heap    postgres    false    3            �            1259    24706    venta_venta_id_seq    SEQUENCE     �   CREATE SEQUENCE public.venta_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.venta_venta_id_seq;
       public          postgres    false    212    3            �           0    0    venta_venta_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.venta_venta_id_seq OWNED BY public.venta.venta_id;
          public          postgres    false    211            O           2604    24700    articulo articulo_id    DEFAULT     |   ALTER TABLE ONLY public.articulo ALTER COLUMN articulo_id SET DEFAULT nextval('public.articulo_articulo_id_seq'::regclass);
 C   ALTER TABLE public.articulo ALTER COLUMN articulo_id DROP DEFAULT;
       public          postgres    false    209    210    210            L           2604    24682    cliente_mascota id    DEFAULT     x   ALTER TABLE ONLY public.cliente_mascota ALTER COLUMN id SET DEFAULT nextval('public.cliente_mascota_id_seq'::regclass);
 A   ALTER TABLE public.cliente_mascota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            M           2604    24683    servicio id_servicio    DEFAULT     |   ALTER TABLE ONLY public.servicio ALTER COLUMN id_servicio SET DEFAULT nextval('public.servicio_id_servicio_seq'::regclass);
 C   ALTER TABLE public.servicio ALTER COLUMN id_servicio DROP DEFAULT;
       public          postgres    false    206    205            N           2604    24684    tipo_servicio id_tipo_servicio    DEFAULT     �   ALTER TABLE ONLY public.tipo_servicio ALTER COLUMN id_tipo_servicio SET DEFAULT nextval('public.tipo_servicio_id_tipo_servicio_seq'::regclass);
 M   ALTER TABLE public.tipo_servicio ALTER COLUMN id_tipo_servicio DROP DEFAULT;
       public          postgres    false    208    207            P           2604    24711    venta venta_id    DEFAULT     p   ALTER TABLE ONLY public.venta ALTER COLUMN venta_id SET DEFAULT nextval('public.venta_venta_id_seq'::regclass);
 =   ALTER TABLE public.venta ALTER COLUMN venta_id DROP DEFAULT;
       public          postgres    false    211    212    212            �          0    24697    articulo 
   TABLE DATA           f   COPY public.articulo (articulo_id, descripcion, precio_publico, precio_mayorista, activo) FROM stdin;
    public          postgres    false    210            �          0    24646 	   categoria 
   TABLE DATA           /   COPY public.categoria (id, nombre) FROM stdin;
    public          postgres    false    200            �          0    24649    cliente 
   TABLE DATA           T   COPY public.cliente (id_cliente, nombre, apellido, direccion, telefono) FROM stdin;
    public          postgres    false    201            �          0    24655    cliente_mascota 
   TABLE DATA           M   COPY public.cliente_mascota (id, id_cliente, id_mascota, activo) FROM stdin;
    public          postgres    false    202            �          0    24660    mascota 
   TABLE DATA           C   COPY public.mascota (id_mascota, nombre, id_categoria) FROM stdin;
    public          postgres    false    204            �          0    24666    servicio 
   TABLE DATA           p   COPY public.servicio (fecha_servicio, estado, id_tipo_servicio, id_servicio, id_client, id_mascota) FROM stdin;
    public          postgres    false    205            �          0    24674    tipo_servicio 
   TABLE DATA           J   COPY public.tipo_servicio (id_tipo_servicio, nombre_servicio) FROM stdin;
    public          postgres    false    207            �          0    24708    venta 
   TABLE DATA           d   COPY public.venta (venta_id, fecha_venta, cliente_id, monto_total, nro_factura, activo) FROM stdin;
    public          postgres    false    212            �           0    0    articulo_articulo_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.articulo_articulo_id_seq', 1, false);
          public          postgres    false    209            �           0    0    cliente_mascota_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_mascota_id_seq', 3, true);
          public          postgres    false    203            �           0    0    servicio_id_servicio_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.servicio_id_servicio_seq', 19, true);
          public          postgres    false    206            �           0    0 "   tipo_servicio_id_tipo_servicio_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.tipo_servicio_id_tipo_servicio_seq', 4, true);
          public          postgres    false    208            �           0    0    venta_venta_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.venta_venta_id_seq', 1, false);
          public          postgres    false    211            \           2606    24705    articulo articulo_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT articulo_pk PRIMARY KEY (articulo_id);
 >   ALTER TABLE ONLY public.articulo DROP CONSTRAINT articulo_pk;
       public            postgres    false    210            T           2606    24686 "   cliente_mascota cliente_mascota_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.cliente_mascota
    ADD CONSTRAINT cliente_mascota_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.cliente_mascota DROP CONSTRAINT cliente_mascota_pk;
       public            postgres    false    202            R           2606    24688    cliente cliente_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY (id_cliente);
 <   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pk;
       public            postgres    false    201            V           2606    24690    mascota mascota_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT mascota_pk PRIMARY KEY (id_mascota);
 <   ALTER TABLE ONLY public.mascota DROP CONSTRAINT mascota_pk;
       public            postgres    false    204            X           2606    24692    servicio servicio_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pk PRIMARY KEY (id_servicio);
 >   ALTER TABLE ONLY public.servicio DROP CONSTRAINT servicio_pk;
       public            postgres    false    205            Z           2606    24694    tipo_servicio tipo_servicio_pk 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipo_servicio
    ADD CONSTRAINT tipo_servicio_pk PRIMARY KEY (id_tipo_servicio);
 H   ALTER TABLE ONLY public.tipo_servicio DROP CONSTRAINT tipo_servicio_pk;
       public            postgres    false    207            ^           2606    24716    venta venta_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pk PRIMARY KEY (venta_id);
 8   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_pk;
       public            postgres    false    212            �   Q   x�3�t�/*JMT(H,�EE�Ŝ�@�i"J��8R�S�9M��&acN����|��T����DNC�4Tg�W� ���      �   +   x�3�,H-*��2�LO,��2����L83s�KR��b���� �v
B      �   �   x��1�0@��9EN��D.Ɉ�:Q	1�D��h\�0�m8�]��~]�ۃ̹N'^�G����I�z�\�C�CG�@ORU)���Rn�<�s�*�����;�L��V�{^����v(�<oklۘ��\wƘ?9�+�      �   #   x�3�4�4�,�2�4�J����g�W� D�j      �   5   x�3���L���4�2�,�OJ��4�2�,H�K���4�2�,�/��4����� u      �   l   x����#�0�
��r����'��sr��!NYs��xd��Z�6�44 8���Ymh�_���	~iS�������5�$�b���� 1�mb      �   :   x�3�LJ<�1�ˈ�,1�4/19���<.c���"(ۄ39��$U!%U����D�=... 7y^      �   L   x�-��� г�q�%:c�����f=[��Z�*Jh��ּ�u�	�}�ѽY�]��7�'�1W�~e?"�wd      1    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16416 	   tallerIII    DATABASE     j   CREATE DATABASE "tallerIII" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Guarani_Paraguay.1252';
    DROP DATABASE "tallerIII";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    24697    articulo    TABLE     �   CREATE TABLE public.articulo (
    articulo_id integer NOT NULL,
    descripcion character varying,
    precio_publico integer,
    precio_mayorista integer,
    activo boolean
);
    DROP TABLE public.articulo;
       public         heap    postgres    false    3            �            1259    24695    articulo_articulo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.articulo_articulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.articulo_articulo_id_seq;
       public          postgres    false    210    3            �           0    0    articulo_articulo_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.articulo_articulo_id_seq OWNED BY public.articulo.articulo_id;
          public          postgres    false    209            �            1259    24646 	   categoria    TABLE     ^   CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(200)
);
    DROP TABLE public.categoria;
       public         heap    postgres    false    3            �            1259    24649    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre character varying,
    apellido character varying,
    direccion character varying,
    telefono character varying
);
    DROP TABLE public.cliente;
       public         heap    postgres    false    3            �            1259    24655    cliente_mascota    TABLE     �   CREATE TABLE public.cliente_mascota (
    id integer NOT NULL,
    id_cliente integer,
    id_mascota integer,
    activo boolean
);
 #   DROP TABLE public.cliente_mascota;
       public         heap    postgres    false    3            �            1259    24658    cliente_mascota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_mascota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_mascota_id_seq;
       public          postgres    false    3    202            �           0    0    cliente_mascota_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_mascota_id_seq OWNED BY public.cliente_mascota.id;
          public          postgres    false    203            �            1259    24660    mascota    TABLE     y   CREATE TABLE public.mascota (
    id_mascota integer NOT NULL,
    nombre character varying,
    id_categoria integer
);
    DROP TABLE public.mascota;
       public         heap    postgres    false    3            �            1259    24666    servicio    TABLE     �   CREATE TABLE public.servicio (
    fecha_servicio date,
    estado character varying,
    id_tipo_servicio integer,
    id_servicio integer NOT NULL,
    id_client integer,
    id_mascota integer
);
    DROP TABLE public.servicio;
       public         heap    postgres    false    3            �            1259    24672    servicio_id_servicio_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_id_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.servicio_id_servicio_seq;
       public          postgres    false    3    205            �           0    0    servicio_id_servicio_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.servicio_id_servicio_seq OWNED BY public.servicio.id_servicio;
          public          postgres    false    206            �            1259    24674    tipo_servicio    TABLE     t   CREATE TABLE public.tipo_servicio (
    id_tipo_servicio integer NOT NULL,
    nombre_servicio character varying
);
 !   DROP TABLE public.tipo_servicio;
       public         heap    postgres    false    3            �            1259    24680 "   tipo_servicio_id_tipo_servicio_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_servicio_id_tipo_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.tipo_servicio_id_tipo_servicio_seq;
       public          postgres    false    207    3            �           0    0 "   tipo_servicio_id_tipo_servicio_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.tipo_servicio_id_tipo_servicio_seq OWNED BY public.tipo_servicio.id_tipo_servicio;
          public          postgres    false    208            �            1259    24708    venta    TABLE     �   CREATE TABLE public.venta (
    venta_id integer NOT NULL,
    fecha_venta date,
    cliente_id integer,
    monto_total integer,
    nro_factura character varying,
    activo boolean
);
    DROP TABLE public.venta;
       public         heap    postgres    false    3            �            1259    24706    venta_venta_id_seq    SEQUENCE     �   CREATE SEQUENCE public.venta_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.venta_venta_id_seq;
       public          postgres    false    212    3            �           0    0    venta_venta_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.venta_venta_id_seq OWNED BY public.venta.venta_id;
          public          postgres    false    211            O           2604    24700    articulo articulo_id    DEFAULT     |   ALTER TABLE ONLY public.articulo ALTER COLUMN articulo_id SET DEFAULT nextval('public.articulo_articulo_id_seq'::regclass);
 C   ALTER TABLE public.articulo ALTER COLUMN articulo_id DROP DEFAULT;
       public          postgres    false    209    210    210            L           2604    24682    cliente_mascota id    DEFAULT     x   ALTER TABLE ONLY public.cliente_mascota ALTER COLUMN id SET DEFAULT nextval('public.cliente_mascota_id_seq'::regclass);
 A   ALTER TABLE public.cliente_mascota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            M           2604    24683    servicio id_servicio    DEFAULT     |   ALTER TABLE ONLY public.servicio ALTER COLUMN id_servicio SET DEFAULT nextval('public.servicio_id_servicio_seq'::regclass);
 C   ALTER TABLE public.servicio ALTER COLUMN id_servicio DROP DEFAULT;
       public          postgres    false    206    205            N           2604    24684    tipo_servicio id_tipo_servicio    DEFAULT     �   ALTER TABLE ONLY public.tipo_servicio ALTER COLUMN id_tipo_servicio SET DEFAULT nextval('public.tipo_servicio_id_tipo_servicio_seq'::regclass);
 M   ALTER TABLE public.tipo_servicio ALTER COLUMN id_tipo_servicio DROP DEFAULT;
       public          postgres    false    208    207            P           2604    24711    venta venta_id    DEFAULT     p   ALTER TABLE ONLY public.venta ALTER COLUMN venta_id SET DEFAULT nextval('public.venta_venta_id_seq'::regclass);
 =   ALTER TABLE public.venta ALTER COLUMN venta_id DROP DEFAULT;
       public          postgres    false    211    212    212            �          0    24697    articulo 
   TABLE DATA           f   COPY public.articulo (articulo_id, descripcion, precio_publico, precio_mayorista, activo) FROM stdin;
    public          postgres    false    210   E       �          0    24646 	   categoria 
   TABLE DATA           /   COPY public.categoria (id, nombre) FROM stdin;
    public          postgres    false    200   [        �          0    24649    cliente 
   TABLE DATA           T   COPY public.cliente (id_cliente, nombre, apellido, direccion, telefono) FROM stdin;
    public          postgres    false    201   5        �          0    24655    cliente_mascota 
   TABLE DATA           M   COPY public.cliente_mascota (id, id_cliente, id_mascota, activo) FROM stdin;
    public          postgres    false    202   �        �          0    24660    mascota 
   TABLE DATA           C   COPY public.mascota (id_mascota, nombre, id_categoria) FROM stdin;
    public          postgres    false    204   -        �          0    24666    servicio 
   TABLE DATA           p   COPY public.servicio (fecha_servicio, estado, id_tipo_servicio, id_servicio, id_client, id_mascota) FROM stdin;
    public          postgres    false    205   ?        �          0    24674    tipo_servicio 
   TABLE DATA           J   COPY public.tipo_servicio (id_tipo_servicio, nombre_servicio) FROM stdin;
    public          postgres    false    207   v        �          0    24708    venta 
   TABLE DATA           d   COPY public.venta (venta_id, fecha_venta, cliente_id, monto_total, nro_factura, activo) FROM stdin;
    public          postgres    false    212   D        �           0    0    articulo_articulo_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.articulo_articulo_id_seq', 1, false);
          public          postgres    false    209            �           0    0    cliente_mascota_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_mascota_id_seq', 3, true);
          public          postgres    false    203            �           0    0    servicio_id_servicio_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.servicio_id_servicio_seq', 19, true);
          public          postgres    false    206            �           0    0 "   tipo_servicio_id_tipo_servicio_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.tipo_servicio_id_tipo_servicio_seq', 4, true);
          public          postgres    false    208            �           0    0    venta_venta_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.venta_venta_id_seq', 1, false);
          public          postgres    false    211            \           2606    24705    articulo articulo_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT articulo_pk PRIMARY KEY (articulo_id);
 >   ALTER TABLE ONLY public.articulo DROP CONSTRAINT articulo_pk;
       public            postgres    false    210            T           2606    24686 "   cliente_mascota cliente_mascota_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.cliente_mascota
    ADD CONSTRAINT cliente_mascota_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.cliente_mascota DROP CONSTRAINT cliente_mascota_pk;
       public            postgres    false    202            R           2606    24688    cliente cliente_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY (id_cliente);
 <   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pk;
       public            postgres    false    201            V           2606    24690    mascota mascota_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT mascota_pk PRIMARY KEY (id_mascota);
 <   ALTER TABLE ONLY public.mascota DROP CONSTRAINT mascota_pk;
       public            postgres    false    204            X           2606    24692    servicio servicio_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pk PRIMARY KEY (id_servicio);
 >   ALTER TABLE ONLY public.servicio DROP CONSTRAINT servicio_pk;
       public            postgres    false    205            Z           2606    24694    tipo_servicio tipo_servicio_pk 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipo_servicio
    ADD CONSTRAINT tipo_servicio_pk PRIMARY KEY (id_tipo_servicio);
 H   ALTER TABLE ONLY public.tipo_servicio DROP CONSTRAINT tipo_servicio_pk;
       public            postgres    false    207            ^           2606    24716    venta venta_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pk PRIMARY KEY (venta_id);
 8   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_pk;
       public            postgres    false    212           