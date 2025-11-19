--
-- PostgreSQL database dump
--

\restrict KUbN5Aq52nK9eSRi6C6oWzo6IIHBbjgUefO6k9oVS0r3JCGflRY5sYlub7mkWz0

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-13 16:56:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 17206)
-- Name: alerta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alerta (
    id_alerta bigint NOT NULL,
    nombre_alerta text NOT NULL,
    id_tipo_alerta bigint NOT NULL
);


ALTER TABLE public.alerta OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17211)
-- Name: alerta_id_alerta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alerta_id_alerta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alerta_id_alerta_seq OWNER TO postgres;

--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 218
-- Name: alerta_id_alerta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alerta_id_alerta_seq OWNED BY public.alerta.id_alerta;


--
-- TOC entry 219 (class 1259 OID 17212)
-- Name: dashboard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard (
    id_dashboard bigint NOT NULL,
    titulo_dashboard text NOT NULL,
    estado_dashboard text NOT NULL,
    generado text NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE public.dashboard OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17217)
-- Name: dashboard_id_dashboard_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_id_dashboard_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboard_id_dashboard_seq OWNER TO postgres;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 220
-- Name: dashboard_id_dashboard_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_id_dashboard_seq OWNED BY public.dashboard.id_dashboard;


--
-- TOC entry 221 (class 1259 OID 17218)
-- Name: datos_dispositivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.datos_dispositivo (
    id_dato_dispositivo bigint NOT NULL,
    fecha_registro date NOT NULL,
    dia_semana text NOT NULL,
    hora_registro time without time zone NOT NULL,
    timestamp_registro timestamp without time zone NOT NULL,
    tem_bme280 numeric(6,1),
    hum_bme280 numeric(6,1),
    pres_bme280 numeric(6,1),
    alt_bme280 numeric(6,1),
    "mp1.0_stp" numeric(6,1),
    "mp2.5_stp" numeric(6,1),
    mp10_stp numeric(6,1),
    "mp1.0_ate" numeric(6,1),
    "mp2.5_ate" numeric(6,1),
    mp10_ate numeric(6,1),
    "mp_gt_0.3um" numeric(6,1),
    "mp_gt_0.5um" numeric(6,1),
    "mp_gt_1.0um" numeric(6,1),
    "mp_gt_2.5um" numeric(6,1),
    "mp_gt_5.0um" numeric(6,1),
    mp_gt_10um numeric(6,1),
    co2_mhz19 numeric(6,1),
    dir_viento smallint,
    rap_viento numeric(6,1),
    agua_caida numeric(6,1),
    consumo_1 numeric(6,1),
    consumo_2 numeric(6,1),
    consumo_3 numeric(6,1),
    id_dispositivo bigint NOT NULL
);


ALTER TABLE public.datos_dispositivo OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17223)
-- Name: datos_dispositivo_id_dato_dispositivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datos_dispositivo_id_dato_dispositivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.datos_dispositivo_id_dato_dispositivo_seq OWNER TO postgres;

--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 222
-- Name: datos_dispositivo_id_dato_dispositivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.datos_dispositivo_id_dato_dispositivo_seq OWNED BY public.datos_dispositivo.id_dato_dispositivo;


--
-- TOC entry 223 (class 1259 OID 17224)
-- Name: detalle_alerta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_alerta (
    id_alerta bigint NOT NULL,
    id_dato_dispositivo bigint NOT NULL,
    fecha_hora_alerta timestamp without time zone NOT NULL,
    valor_anomalo numeric(6,1)
);


ALTER TABLE public.detalle_alerta OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17227)
-- Name: detalle_dashboard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_dashboard (
    id_grafico bigint NOT NULL,
    id_dashboard bigint NOT NULL,
    fecha_creacion_dashboard date NOT NULL
);


ALTER TABLE public.detalle_dashboard OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17410)
-- Name: diccionario_dato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diccionario_dato (
    nombre_variable text NOT NULL,
    descripcion_variable text NOT NULL,
    rango_variable text NOT NULL
);


ALTER TABLE public.diccionario_dato OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17230)
-- Name: dispositivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dispositivo (
    id_dispositivo bigint NOT NULL,
    nombre_dispositivo text NOT NULL,
    ubicacion text NOT NULL,
    estado text NOT NULL
);


ALTER TABLE public.dispositivo OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17235)
-- Name: dispositivo_id_dispositivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dispositivo_id_dispositivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dispositivo_id_dispositivo_seq OWNER TO postgres;

--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 226
-- Name: dispositivo_id_dispositivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dispositivo_id_dispositivo_seq OWNED BY public.dispositivo.id_dispositivo;


--
-- TOC entry 227 (class 1259 OID 17236)
-- Name: grafico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grafico (
    id_grafico bigint NOT NULL,
    titulo_grafico text NOT NULL,
    fecha_creacion_grafico date NOT NULL,
    id_tipo_grafico bigint NOT NULL,
    id_modelo bigint NOT NULL,
    id_dato_dispositivo bigint NOT NULL
);


ALTER TABLE public.grafico OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17241)
-- Name: grafico_id_grafico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grafico_id_grafico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grafico_id_grafico_seq OWNER TO postgres;

--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 228
-- Name: grafico_id_grafico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grafico_id_grafico_seq OWNED BY public.grafico.id_grafico;


--
-- TOC entry 229 (class 1259 OID 17242)
-- Name: modelo_entrenado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelo_entrenado (
    id_modelo bigint NOT NULL,
    nombre_modelo text NOT NULL,
    descripcion_modelo text NOT NULL,
    fecha_entrenamiento date NOT NULL,
    version_modelo text NOT NULL,
    estado text NOT NULL,
    metricas jsonb NOT NULL,
    id_tipo_modelo bigint NOT NULL
);


ALTER TABLE public.modelo_entrenado OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17247)
-- Name: modelo_entrenado_id_modelo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modelo_entrenado_id_modelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modelo_entrenado_id_modelo_seq OWNER TO postgres;

--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 230
-- Name: modelo_entrenado_id_modelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modelo_entrenado_id_modelo_seq OWNED BY public.modelo_entrenado.id_modelo;


--
-- TOC entry 231 (class 1259 OID 17248)
-- Name: reporte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reporte (
    id_reporte bigint NOT NULL,
    fecha_reporte date NOT NULL,
    titulo_reporte text NOT NULL,
    solicitado text NOT NULL,
    id_tipo_reporte bigint NOT NULL,
    id_dashboard bigint NOT NULL
);


ALTER TABLE public.reporte OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17253)
-- Name: reporte_id_reporte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reporte_id_reporte_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reporte_id_reporte_seq OWNER TO postgres;

--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 232
-- Name: reporte_id_reporte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reporte_id_reporte_seq OWNED BY public.reporte.id_reporte;


--
-- TOC entry 233 (class 1259 OID 17254)
-- Name: tipo_alerta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_alerta (
    id_tipo_alerta bigint NOT NULL,
    nivel_alerta text NOT NULL,
    CONSTRAINT chk_nivel_alerta CHECK ((nivel_alerta = ANY (ARRAY['bajo'::text, 'medio'::text, 'alto'::text, 'extremo'::text])))
);


ALTER TABLE public.tipo_alerta OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17260)
-- Name: tipo_alerta_id_tipo_alerta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_alerta_id_tipo_alerta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_alerta_id_tipo_alerta_seq OWNER TO postgres;

--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 234
-- Name: tipo_alerta_id_tipo_alerta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_alerta_id_tipo_alerta_seq OWNED BY public.tipo_alerta.id_tipo_alerta;


--
-- TOC entry 235 (class 1259 OID 17261)
-- Name: tipo_grafico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_grafico (
    id_tipo_grafico bigint NOT NULL,
    nombre_tipo_grafico text NOT NULL
);


ALTER TABLE public.tipo_grafico OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17266)
-- Name: tipo_grafico_id_tipo_grafico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_grafico_id_tipo_grafico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_grafico_id_tipo_grafico_seq OWNER TO postgres;

--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 236
-- Name: tipo_grafico_id_tipo_grafico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_grafico_id_tipo_grafico_seq OWNED BY public.tipo_grafico.id_tipo_grafico;


--
-- TOC entry 237 (class 1259 OID 17267)
-- Name: tipo_modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_modelo (
    id_tipo_modelo bigint NOT NULL,
    nombre_tipo_modelo text NOT NULL
);


ALTER TABLE public.tipo_modelo OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17272)
-- Name: tipo_modelo_id_tipo_modelo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_modelo_id_tipo_modelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_modelo_id_tipo_modelo_seq OWNER TO postgres;

--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 238
-- Name: tipo_modelo_id_tipo_modelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_modelo_id_tipo_modelo_seq OWNED BY public.tipo_modelo.id_tipo_modelo;


--
-- TOC entry 239 (class 1259 OID 17273)
-- Name: tipo_reporte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_reporte (
    id_tipo_reporte bigint NOT NULL,
    nombre_tipo_reporte text NOT NULL,
    descripcion_tipo_reporte text NOT NULL
);


ALTER TABLE public.tipo_reporte OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17278)
-- Name: tipo_reporte_id_tipo_reporte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_reporte_id_tipo_reporte_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_reporte_id_tipo_reporte_seq OWNER TO postgres;

--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 240
-- Name: tipo_reporte_id_tipo_reporte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_reporte_id_tipo_reporte_seq OWNED BY public.tipo_reporte.id_tipo_reporte;


--
-- TOC entry 241 (class 1259 OID 17279)
-- Name: tipo_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_usuario (
    id_tipo_usuario bigint NOT NULL,
    nombre_tipo_usuario text NOT NULL,
    descripcion_tipo_usuario text NOT NULL
);


ALTER TABLE public.tipo_usuario OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17284)
-- Name: tipo_usuario_id_tipo_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_usuario_id_tipo_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_usuario_id_tipo_usuario_seq OWNER TO postgres;

--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 242
-- Name: tipo_usuario_id_tipo_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_usuario_id_tipo_usuario_seq OWNED BY public.tipo_usuario.id_tipo_usuario;


--
-- TOC entry 243 (class 1259 OID 17285)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario bigint NOT NULL,
    nombre_usuario text NOT NULL,
    correo_usuario text NOT NULL,
    contrasena_usuario text NOT NULL,
    id_tipo_usuario bigint NOT NULL,
    CONSTRAINT chk_correo_usuario CHECK ((correo_usuario ~ '^[^@]+@[^@]+\.[^@]+$'::text))
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17291)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 244
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 4814 (class 2604 OID 17292)
-- Name: alerta id_alerta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerta ALTER COLUMN id_alerta SET DEFAULT nextval('public.alerta_id_alerta_seq'::regclass);


--
-- TOC entry 4815 (class 2604 OID 17293)
-- Name: dashboard id_dashboard; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard ALTER COLUMN id_dashboard SET DEFAULT nextval('public.dashboard_id_dashboard_seq'::regclass);


--
-- TOC entry 4816 (class 2604 OID 17294)
-- Name: datos_dispositivo id_dato_dispositivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datos_dispositivo ALTER COLUMN id_dato_dispositivo SET DEFAULT nextval('public.datos_dispositivo_id_dato_dispositivo_seq'::regclass);


--
-- TOC entry 4817 (class 2604 OID 17295)
-- Name: dispositivo id_dispositivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dispositivo ALTER COLUMN id_dispositivo SET DEFAULT nextval('public.dispositivo_id_dispositivo_seq'::regclass);


--
-- TOC entry 4818 (class 2604 OID 17296)
-- Name: grafico id_grafico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grafico ALTER COLUMN id_grafico SET DEFAULT nextval('public.grafico_id_grafico_seq'::regclass);


--
-- TOC entry 4819 (class 2604 OID 17297)
-- Name: modelo_entrenado id_modelo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo_entrenado ALTER COLUMN id_modelo SET DEFAULT nextval('public.modelo_entrenado_id_modelo_seq'::regclass);


--
-- TOC entry 4820 (class 2604 OID 17298)
-- Name: reporte id_reporte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte ALTER COLUMN id_reporte SET DEFAULT nextval('public.reporte_id_reporte_seq'::regclass);


--
-- TOC entry 4821 (class 2604 OID 17299)
-- Name: tipo_alerta id_tipo_alerta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_alerta ALTER COLUMN id_tipo_alerta SET DEFAULT nextval('public.tipo_alerta_id_tipo_alerta_seq'::regclass);


--
-- TOC entry 4822 (class 2604 OID 17300)
-- Name: tipo_grafico id_tipo_grafico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_grafico ALTER COLUMN id_tipo_grafico SET DEFAULT nextval('public.tipo_grafico_id_tipo_grafico_seq'::regclass);


--
-- TOC entry 4823 (class 2604 OID 17301)
-- Name: tipo_modelo id_tipo_modelo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_modelo ALTER COLUMN id_tipo_modelo SET DEFAULT nextval('public.tipo_modelo_id_tipo_modelo_seq'::regclass);


--
-- TOC entry 4824 (class 2604 OID 17302)
-- Name: tipo_reporte id_tipo_reporte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_reporte ALTER COLUMN id_tipo_reporte SET DEFAULT nextval('public.tipo_reporte_id_tipo_reporte_seq'::regclass);


--
-- TOC entry 4825 (class 2604 OID 17303)
-- Name: tipo_usuario id_tipo_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_usuario ALTER COLUMN id_tipo_usuario SET DEFAULT nextval('public.tipo_usuario_id_tipo_usuario_seq'::regclass);


--
-- TOC entry 4826 (class 2604 OID 17304)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 4830 (class 2606 OID 17306)
-- Name: alerta alerta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerta
    ADD CONSTRAINT alerta_pkey PRIMARY KEY (id_alerta);


--
-- TOC entry 4832 (class 2606 OID 17308)
-- Name: dashboard dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (id_dashboard);


--
-- TOC entry 4834 (class 2606 OID 17310)
-- Name: datos_dispositivo datos_dispositivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datos_dispositivo
    ADD CONSTRAINT datos_dispositivo_pkey PRIMARY KEY (id_dato_dispositivo);


--
-- TOC entry 4836 (class 2606 OID 17312)
-- Name: detalle_alerta detalle_alerta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_alerta
    ADD CONSTRAINT detalle_alerta_pkey PRIMARY KEY (id_alerta, id_dato_dispositivo);


--
-- TOC entry 4838 (class 2606 OID 17314)
-- Name: detalle_dashboard detalle_dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_dashboard
    ADD CONSTRAINT detalle_dashboard_pkey PRIMARY KEY (id_grafico, id_dashboard);


--
-- TOC entry 4840 (class 2606 OID 17316)
-- Name: dispositivo dispositivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dispositivo
    ADD CONSTRAINT dispositivo_pkey PRIMARY KEY (id_dispositivo);


--
-- TOC entry 4842 (class 2606 OID 17318)
-- Name: grafico grafico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grafico
    ADD CONSTRAINT grafico_pkey PRIMARY KEY (id_grafico);


--
-- TOC entry 4844 (class 2606 OID 17320)
-- Name: modelo_entrenado modelo_entrenado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo_entrenado
    ADD CONSTRAINT modelo_entrenado_pkey PRIMARY KEY (id_modelo);


--
-- TOC entry 4846 (class 2606 OID 17322)
-- Name: reporte reporte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT reporte_pkey PRIMARY KEY (id_reporte);


--
-- TOC entry 4848 (class 2606 OID 17324)
-- Name: tipo_alerta tipo_alerta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_alerta
    ADD CONSTRAINT tipo_alerta_pkey PRIMARY KEY (id_tipo_alerta);


--
-- TOC entry 4850 (class 2606 OID 17326)
-- Name: tipo_grafico tipo_grafico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_grafico
    ADD CONSTRAINT tipo_grafico_pkey PRIMARY KEY (id_tipo_grafico);


--
-- TOC entry 4852 (class 2606 OID 17328)
-- Name: tipo_modelo tipo_modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_modelo
    ADD CONSTRAINT tipo_modelo_pkey PRIMARY KEY (id_tipo_modelo);


--
-- TOC entry 4854 (class 2606 OID 17330)
-- Name: tipo_reporte tipo_reporte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_reporte
    ADD CONSTRAINT tipo_reporte_pkey PRIMARY KEY (id_tipo_reporte);


--
-- TOC entry 4856 (class 2606 OID 17332)
-- Name: tipo_usuario tipo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (id_tipo_usuario);


--
-- TOC entry 4858 (class 2606 OID 17334)
-- Name: usuario unique_correo_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT unique_correo_usuario UNIQUE (correo_usuario);


--
-- TOC entry 4860 (class 2606 OID 17336)
-- Name: usuario unique_nombre_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT unique_nombre_usuario UNIQUE (nombre_usuario);


--
-- TOC entry 4862 (class 2606 OID 17338)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4874 (class 2606 OID 17339)
-- Name: reporte fk_id_dashboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT fk_id_dashboard FOREIGN KEY (id_dashboard) REFERENCES public.dashboard(id_dashboard) ON DELETE CASCADE;


--
-- TOC entry 4870 (class 2606 OID 17344)
-- Name: grafico fk_id_dato_dispositivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grafico
    ADD CONSTRAINT fk_id_dato_dispositivo FOREIGN KEY (id_dato_dispositivo) REFERENCES public.datos_dispositivo(id_dato_dispositivo) ON DELETE CASCADE;


--
-- TOC entry 4865 (class 2606 OID 17349)
-- Name: datos_dispositivo fk_id_dispositivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datos_dispositivo
    ADD CONSTRAINT fk_id_dispositivo FOREIGN KEY (id_dispositivo) REFERENCES public.dispositivo(id_dispositivo) ON DELETE CASCADE;


--
-- TOC entry 4871 (class 2606 OID 17354)
-- Name: grafico fk_id_modelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grafico
    ADD CONSTRAINT fk_id_modelo FOREIGN KEY (id_modelo) REFERENCES public.modelo_entrenado(id_modelo) ON DELETE CASCADE;


--
-- TOC entry 4872 (class 2606 OID 17359)
-- Name: grafico fk_id_tipo_grafico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grafico
    ADD CONSTRAINT fk_id_tipo_grafico FOREIGN KEY (id_tipo_grafico) REFERENCES public.tipo_grafico(id_tipo_grafico) ON DELETE CASCADE;


--
-- TOC entry 4873 (class 2606 OID 17364)
-- Name: modelo_entrenado fk_id_tipo_modelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo_entrenado
    ADD CONSTRAINT fk_id_tipo_modelo FOREIGN KEY (id_tipo_modelo) REFERENCES public.tipo_modelo(id_tipo_modelo) ON DELETE CASCADE;


--
-- TOC entry 4875 (class 2606 OID 17369)
-- Name: reporte fk_id_tipo_reporte; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT fk_id_tipo_reporte FOREIGN KEY (id_tipo_reporte) REFERENCES public.tipo_reporte(id_tipo_reporte) ON DELETE CASCADE;


--
-- TOC entry 4876 (class 2606 OID 17374)
-- Name: usuario fk_id_tipo_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_id_tipo_usuario FOREIGN KEY (id_tipo_usuario) REFERENCES public.tipo_usuario(id_tipo_usuario) ON DELETE CASCADE;


--
-- TOC entry 4864 (class 2606 OID 17379)
-- Name: dashboard fk_id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 4863 (class 2606 OID 17384)
-- Name: alerta fk_tipo_alerta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerta
    ADD CONSTRAINT fk_tipo_alerta FOREIGN KEY (id_tipo_alerta) REFERENCES public.tipo_alerta(id_tipo_alerta) ON DELETE CASCADE;


--
-- TOC entry 4866 (class 2606 OID 17389)
-- Name: detalle_alerta pf_id_alerta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_alerta
    ADD CONSTRAINT pf_id_alerta FOREIGN KEY (id_alerta) REFERENCES public.alerta(id_alerta) ON DELETE CASCADE;


--
-- TOC entry 4868 (class 2606 OID 17394)
-- Name: detalle_dashboard pf_id_dashboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_dashboard
    ADD CONSTRAINT pf_id_dashboard FOREIGN KEY (id_dashboard) REFERENCES public.dashboard(id_dashboard) ON DELETE CASCADE;


--
-- TOC entry 4867 (class 2606 OID 17399)
-- Name: detalle_alerta pf_id_dato_dispositivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_alerta
    ADD CONSTRAINT pf_id_dato_dispositivo FOREIGN KEY (id_dato_dispositivo) REFERENCES public.datos_dispositivo(id_dato_dispositivo) ON DELETE CASCADE;


--
-- TOC entry 4869 (class 2606 OID 17404)
-- Name: detalle_dashboard pf_id_grafico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_dashboard
    ADD CONSTRAINT pf_id_grafico FOREIGN KEY (id_grafico) REFERENCES public.grafico(id_grafico) ON DELETE CASCADE;


-- Completed on 2025-10-13 16:56:55

--
-- PostgreSQL database dump complete
--

\unrestrict KUbN5Aq52nK9eSRi6C6oWzo6IIHBbjgUefO6k9oVS0r3JCGflRY5sYlub7mkWz0

