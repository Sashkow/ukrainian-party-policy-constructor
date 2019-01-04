--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

-- Started on 2018-12-29 11:54:00 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 16417)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- TOC entry 187 (class 1259 OID 16415)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO admin;

--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 187
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 190 (class 1259 OID 16427)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- TOC entry 189 (class 1259 OID 16425)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO admin;

--
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 186 (class 1259 OID 16409)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- TOC entry 185 (class 1259 OID 16407)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO admin;

--
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 192 (class 1259 OID 16435)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- TOC entry 194 (class 1259 OID 16445)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
-- TOC entry 193 (class 1259 OID 16443)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO admin;

--
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 191 (class 1259 OID 16433)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO admin;

--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 196 (class 1259 OID 16453)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
-- TOC entry 195 (class 1259 OID 16451)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO admin;

--
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 215 (class 1259 OID 16668)
-- Name: demo_post; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.demo_post (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    text text NOT NULL,
    created_date timestamp with time zone NOT NULL,
    published_date timestamp with time zone,
    author_id integer NOT NULL
);


ALTER TABLE public.demo_post OWNER TO admin;

--
-- TOC entry 213 (class 1259 OID 16651)
-- Name: demo_post_demo_fun; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.demo_post_demo_fun (
    id integer NOT NULL,
    "Title" character varying(100) NOT NULL,
    "TellSometing" text NOT NULL,
    "Name_id" integer NOT NULL
);


ALTER TABLE public.demo_post_demo_fun OWNER TO admin;

--
-- TOC entry 212 (class 1259 OID 16649)
-- Name: demo_post_demo_fun_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.demo_post_demo_fun_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demo_post_demo_fun_id_seq OWNER TO admin;

--
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 212
-- Name: demo_post_demo_fun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.demo_post_demo_fun_id_seq OWNED BY public.demo_post_demo_fun.id;


--
-- TOC entry 214 (class 1259 OID 16666)
-- Name: demo_post_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.demo_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demo_post_id_seq OWNER TO admin;

--
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 214
-- Name: demo_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.demo_post_id_seq OWNED BY public.demo_post.id;


--
-- TOC entry 217 (class 1259 OID 16685)
-- Name: demo_pub_howareyou; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.demo_pub_howareyou (
    id integer NOT NULL,
    "Title" character varying(200) NOT NULL,
    "Text" text NOT NULL,
    created_date timestamp with time zone NOT NULL,
    "Name_id" integer NOT NULL
);


ALTER TABLE public.demo_pub_howareyou OWNER TO admin;

--
-- TOC entry 216 (class 1259 OID 16683)
-- Name: demo_pub_howareyou_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.demo_pub_howareyou_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.demo_pub_howareyou_id_seq OWNER TO admin;

--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 216
-- Name: demo_pub_howareyou_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.demo_pub_howareyou_id_seq OWNED BY public.demo_pub_howareyou.id;


--
-- TOC entry 198 (class 1259 OID 16513)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- TOC entry 197 (class 1259 OID 16511)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO admin;

--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 197
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 184 (class 1259 OID 16399)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- TOC entry 183 (class 1259 OID 16397)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO admin;

--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 183
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 182 (class 1259 OID 16388)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- TOC entry 181 (class 1259 OID 16386)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO admin;

--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 181
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 211 (class 1259 OID 16635)
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- TOC entry 200 (class 1259 OID 16543)
-- Name: django_site; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO admin;

--
-- TOC entry 199 (class 1259 OID 16541)
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO admin;

--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- TOC entry 202 (class 1259 OID 16551)
-- Name: forms_field; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.forms_field (
    id integer NOT NULL,
    label character varying(1500) NOT NULL,
    slug character varying(1500) NOT NULL,
    field_type integer NOT NULL,
    required boolean NOT NULL,
    visible boolean NOT NULL,
    choices character varying(1000) NOT NULL,
    "default" character varying(2000) NOT NULL,
    placeholder_text character varying(100),
    help_text character varying(100) NOT NULL,
    "order" integer,
    form_id integer NOT NULL
);


ALTER TABLE public.forms_field OWNER TO admin;

--
-- TOC entry 201 (class 1259 OID 16549)
-- Name: forms_field_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.forms_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_field_id_seq OWNER TO admin;

--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 201
-- Name: forms_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.forms_field_id_seq OWNED BY public.forms_field.id;


--
-- TOC entry 204 (class 1259 OID 16562)
-- Name: forms_fieldentry; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.forms_fieldentry (
    id integer NOT NULL,
    field_id integer NOT NULL,
    value character varying(2000),
    entry_id integer NOT NULL
);


ALTER TABLE public.forms_fieldentry OWNER TO admin;

--
-- TOC entry 203 (class 1259 OID 16560)
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.forms_fieldentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_fieldentry_id_seq OWNER TO admin;

--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 203
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.forms_fieldentry_id_seq OWNED BY public.forms_fieldentry.id;


--
-- TOC entry 206 (class 1259 OID 16573)
-- Name: forms_form; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.forms_form (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    slug character varying(100) NOT NULL,
    intro text NOT NULL,
    button_text character varying(50) NOT NULL,
    response text NOT NULL,
    redirect_url character varying(200),
    status integer NOT NULL,
    publish_date timestamp with time zone,
    expiry_date timestamp with time zone,
    login_required boolean NOT NULL,
    send_email boolean NOT NULL,
    email_from character varying(254) NOT NULL,
    email_copies character varying(200) NOT NULL,
    email_subject character varying(200) NOT NULL,
    email_message text NOT NULL
);


ALTER TABLE public.forms_form OWNER TO admin;

--
-- TOC entry 205 (class 1259 OID 16571)
-- Name: forms_form_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.forms_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_form_id_seq OWNER TO admin;

--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 205
-- Name: forms_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.forms_form_id_seq OWNED BY public.forms_form.id;


--
-- TOC entry 208 (class 1259 OID 16586)
-- Name: forms_form_sites; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.forms_form_sites (
    id integer NOT NULL,
    form_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.forms_form_sites OWNER TO admin;

--
-- TOC entry 207 (class 1259 OID 16584)
-- Name: forms_form_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.forms_form_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_form_sites_id_seq OWNER TO admin;

--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 207
-- Name: forms_form_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.forms_form_sites_id_seq OWNED BY public.forms_form_sites.id;


--
-- TOC entry 210 (class 1259 OID 16594)
-- Name: forms_formentry; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.forms_formentry (
    id integer NOT NULL,
    entry_time timestamp with time zone NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE public.forms_formentry OWNER TO admin;

--
-- TOC entry 209 (class 1259 OID 16592)
-- Name: forms_formentry_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.forms_formentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_formentry_id_seq OWNER TO admin;

--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 209
-- Name: forms_formentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.forms_formentry_id_seq OWNED BY public.forms_formentry.id;


--
-- TOC entry 219 (class 1259 OID 16702)
-- Name: questionnaire_demo_model; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.questionnaire_demo_model (
    id integer NOT NULL,
    "Title" character varying(200) NOT NULL,
    "Name_id" integer NOT NULL,
    "Condition" character varying(20) NOT NULL,
    "Author" character varying(30) NOT NULL,
    "Weapon" character varying(20) NOT NULL
);


ALTER TABLE public.questionnaire_demo_model OWNER TO admin;

--
-- TOC entry 218 (class 1259 OID 16700)
-- Name: questionnaire_demo_model_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.questionnaire_demo_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionnaire_demo_model_id_seq OWNER TO admin;

--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 218
-- Name: questionnaire_demo_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.questionnaire_demo_model_id_seq OWNED BY public.questionnaire_demo_model.id;


--
-- TOC entry 2144 (class 2604 OID 16420)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 16430)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2143 (class 2604 OID 16412)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2146 (class 2604 OID 16438)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 16448)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 16456)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2158 (class 2604 OID 16671)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.demo_post ALTER COLUMN id SET DEFAULT nextval('public.demo_post_id_seq'::regclass);


--
-- TOC entry 2157 (class 2604 OID 16654)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.demo_post_demo_fun ALTER COLUMN id SET DEFAULT nextval('public.demo_post_demo_fun_id_seq'::regclass);


--
-- TOC entry 2159 (class 2604 OID 16688)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.demo_pub_howareyou ALTER COLUMN id SET DEFAULT nextval('public.demo_pub_howareyou_id_seq'::regclass);


--
-- TOC entry 2149 (class 2604 OID 16516)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2142 (class 2604 OID 16402)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2141 (class 2604 OID 16391)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 16546)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 16554)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_field ALTER COLUMN id SET DEFAULT nextval('public.forms_field_id_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 16565)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_fieldentry ALTER COLUMN id SET DEFAULT nextval('public.forms_fieldentry_id_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 16576)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_form ALTER COLUMN id SET DEFAULT nextval('public.forms_form_id_seq'::regclass);


--
-- TOC entry 2155 (class 2604 OID 16589)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_form_sites ALTER COLUMN id SET DEFAULT nextval('public.forms_form_sites_id_seq'::regclass);


--
-- TOC entry 2156 (class 2604 OID 16597)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_formentry ALTER COLUMN id SET DEFAULT nextval('public.forms_formentry_id_seq'::regclass);


--
-- TOC entry 2160 (class 2604 OID 16705)
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.questionnaire_demo_model ALTER COLUMN id SET DEFAULT nextval('public.questionnaire_demo_model_id_seq'::regclass);


--
-- TOC entry 2386 (class 0 OID 16417)
-- Dependencies: 188
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 187
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 2388 (class 0 OID 16427)
-- Dependencies: 190
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2384 (class 0 OID 16409)
-- Dependencies: 186
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add Field	8	add_field
23	Can change Field	8	change_field
24	Can delete Field	8	delete_field
25	Can add Form field entry	9	add_fieldentry
26	Can change Form field entry	9	change_fieldentry
27	Can delete Form field entry	9	delete_fieldentry
28	Can add Form	10	add_form
29	Can change Form	10	change_form
30	Can delete Form	10	delete_form
31	Can add Form entry	11	add_formentry
32	Can change Form entry	11	change_formentry
33	Can delete Form entry	11	delete_formentry
34	Can add demo_fun	12	add_demo_fun
35	Can change demo_fun	12	change_demo_fun
36	Can delete demo_fun	12	delete_demo_fun
37	Can add post	13	add_post
38	Can change post	13	change_post
39	Can delete post	13	delete_post
40	Can add how are you	14	add_howareyou
41	Can change how are you	14	change_howareyou
42	Can delete how are you	14	delete_howareyou
43	Can add demo_model	15	add_demo_model
44	Can change demo_model	15	change_demo_model
45	Can delete demo_model	15	delete_demo_model
46	Can add policy	16	add_policy
47	Can change policy	16	change_policy
48	Can delete policy	16	delete_policy
49	Can add question answer	17	add_questionanswer
50	Can change question answer	17	change_questionanswer
51	Can delete question answer	17	delete_questionanswer
\.


--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 185
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 51, true);


--
-- TOC entry 2390 (class 0 OID 16435)
-- Dependencies: 192
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$hRd8hAPROAdE$t6tYmyZiR6qR2XYbrRTxKSsJy8FFbwJ0chgnKzjpSTo=	2018-12-18 20:26:30.416826+02	t	astria			adm@adm.com	t	t	2018-12-18 19:58:46.11281+02
\.


--
-- TOC entry 2392 (class 0 OID 16445)
-- Dependencies: 194
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 2394 (class 0 OID 16453)
-- Dependencies: 196
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2413 (class 0 OID 16668)
-- Dependencies: 215
-- Data for Name: demo_post; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.demo_post (id, title, text, created_date, published_date, author_id) FROM stdin;
1	sdf	sdfasfdsadf	2018-12-18 20:30:21+02	2018-12-18 20:30:29+02	1
\.


--
-- TOC entry 2411 (class 0 OID 16651)
-- Dependencies: 213
-- Data for Name: demo_post_demo_fun; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.demo_post_demo_fun (id, "Title", "TellSometing", "Name_id") FROM stdin;
\.


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 212
-- Name: demo_post_demo_fun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.demo_post_demo_fun_id_seq', 1, false);


--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 214
-- Name: demo_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.demo_post_id_seq', 1, true);


--
-- TOC entry 2415 (class 0 OID 16685)
-- Dependencies: 217
-- Data for Name: demo_pub_howareyou; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.demo_pub_howareyou (id, "Title", "Text", created_date, "Name_id") FROM stdin;
1	Fuck	FuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuck	2018-12-18 20:35:07+02	1
2	FuckFuck	FuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuckFuck	2018-12-18 20:35:29+02	1
\.


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 216
-- Name: demo_pub_howareyou_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.demo_pub_howareyou_id_seq', 2, true);


--
-- TOC entry 2396 (class 0 OID 16513)
-- Dependencies: 198
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-12-18 20:30:31.336272+02	1	sdf	1	[{"added": {}}]	13	1
2	2018-12-18 20:35:25.259834+02	1	Fuck	1	[{"added": {}}]	14	1
3	2018-12-18 20:35:39.72976+02	2	FuckFuck	1	[{"added": {}}]	14	1
4	2018-12-19 20:51:40.128132+02	1	Some text	1	[{"added": {}}]	15	1
5	2018-12-19 20:52:07.736801+02	2	one more title	1	[{"added": {}}]	15	1
6	2018-12-24 15:15:43.734878+02	1	ыжавдпофыэа	1	[{"added": {}}, {"added": {"name": "Field", "object": "1"}}, {"added": {"name": "Field", "object": "1"}}, {"added": {"name": "Field", "object": "1"}}]	10	1
7	2018-12-24 16:53:39.261363+02	1	ыжавдпофыэа	3		10	1
8	2018-12-25 15:42:36.783436+02	9	title	1	[{"added": {}}, {"added": {"name": "Field", "object": "\\u0437 \\u043f\\u0438\\u0442\\u0430\\u043d\\u044c \\u043d\\u0430\\u0446\\u0456\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0457 \\u0431\\u0435\\u0437\\u043f\\u0435\\u043a\\u0438. \\u042f\\u043a\\u0456 \\u0431\\u0443\\u0434\\u0443\\u0442\\u044c \\u0432\\u0430\\u0448\\u0456 \\u0434\\u0456\\u0457 \\u0456\\u0437 \\u0431\\u0443\\u0434\\u0456\\u0432\\u043d\\u0438\\u0446\\u0442\\u0432\\u0430 \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e-\\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u0441\\u043e\\u044e\\u0437\\u0443?"}}]	10	1
9	2018-12-25 15:44:44.193901+02	9	title	3		10	1
10	2018-12-26 17:24:33.926097+02	17	questions	1	[{"added": {}}, {"added": {"name": "Field", "object": "\\u041f\\u043e\\u0447\\u043d\\u0435\\u043c\\u043e \\u0437 \\u043f\\u0438\\u0442\\u0430\\u043d\\u044c \\u043d\\u0430\\u0446\\u0456\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0457 \\u0431\\u0435\\u0437\\u043f\\u0435\\u043a\\u0438. \\u042f\\u043a\\u0456 \\u0431\\u0443\\u0434\\u0443\\u0442\\u044c \\u0432\\u0430\\u0448\\u0456 \\u0434\\u0456\\u0457 \\u0456\\u0437 \\u0431\\u0443\\u0434\\u0456\\u0432\\u043d\\u0438\\u0446\\u0442\\u0432\\u0430 \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e-\\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u0441\\u043e\\u044e\\u0437\\u0443?"}}]	10	1
11	2018-12-26 17:27:33.847008+02	17	questions	2	[{"added": {"name": "Field", "object": "\\u0429\\u043e \\u0432\\u0438 \\u043f\\u043b\\u0430\\u043d\\u0443\\u0454\\u0442\\u0435 \\u0437\\u0440\\u043e\\u0431\\u0438\\u0442\\u0438 \\u0456\\u0437 \\u0443\\u043a\\u0440\\u0430\\u0457\\u043d\\u0441\\u044c\\u043a\\u0438\\u043c\\u0438 \\u0437\\u0431\\u0440\\u043e\\u0439\\u043d\\u0438\\u043c\\u0438 \\u0441\\u0438\\u043b\\u0430\\u043c\\u0438?"}}]	10	1
12	2018-12-26 17:29:47.486606+02	17	questions	2	[{"added": {"name": "Field", "object": "\\u042f\\u043a \\u043f\\u043e\\u0432\\u0435\\u0440\\u0442\\u0430\\u0442\\u0438\\u043c\\u0435\\u043c\\u043e \\u041a\\u0440\\u0438\\u043c \\u0456 \\u0414\\u043e\\u043d\\u0431\\u0430\\u0441?"}}, {"added": {"name": "Field", "object": "\\u042f\\u043a\\u0438\\u043c \\u0447\\u0438\\u043d\\u043e\\u043c \\u043f\\u0440\\u043e\\u0442\\u0438\\u0434\\u0456\\u044f\\u0442\\u0438\\u043c\\u0435\\u043c\\u043e \\u0430\\u0433\\u0440\\u0435\\u0441\\u0456\\u0457 \\u0420\\u043e\\u0441\\u0456\\u0457?"}}, {"added": {"name": "Field", "object": "\\u041e\\u043a\\u0440\\u0456\\u043c \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0433\\u043e \\u043f\\u0430\\u0440\\u0442\\u043d\\u0435\\u0440\\u0441\\u0442\\u0432\\u0430 \\u0442\\u0430\\u043a\\u043e\\u0436 \\u0442\\u0440\\u0435\\u0431\\u0430 \\u043e\\u0431\\u0438\\u0440\\u0430\\u0442\\u0438 \\u0437 \\u043a\\u0438\\u043c \\u0434\\u0440\\u0443\\u0436\\u0438\\u0442\\u0438\\u043c\\u0435\\u043c\\u043e \\u0432 \\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u0447\\u043d\\u0456\\u0439 \\u0456 \\u0435\\u043a\\u043e\\u043d\\u043e\\u043c\\u0456\\u0447\\u043d\\u0456\\u0439 \\u0441\\u0444\\u0435\\u0440\\u0430\\u0445. \\u0412\\u0436\\u0435 \\u043c\\u0430\\u0454\\u0442\\u0435 \\u0432\\u0430\\u0440\\u0456\\u0430\\u043d\\u0442\\u0438?"}}]	10	1
13	2018-12-26 17:34:35.055377+02	17	questions	2	[{"added": {"name": "Field", "object": "\\u0414\\u043e\\u0431\\u0440\\u0435, \\u0456\\u0437 \\u0437\\u043e\\u0432\\u043d\\u0456\\u0448\\u043d\\u044c\\u043e\\u044e \\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u043a\\u043e\\u044e \\u0440\\u043e\\u0437\\u0456\\u0431\\u0440\\u0430\\u043b\\u0438\\u0441\\u044f, \\u0442\\u0440\\u0435\\u0431\\u0430 \\u0432\\u0438\\u0440\\u0456\\u0448\\u0438\\u0442\\u0438 \\u0456 \\u0437\\u0430 \\u0432\\u043d\\u0443\\u0442\\u0440\\u0456\\u0448\\u043d\\u044e. \\u042f\\u043a\\u043e\\u044e \\u043c\\u0430\\u0454 \\u0431\\u0443\\u0442\\u0438 \\u0444\\u043e\\u0440\\u043c\\u0430 \\u043f\\u0440\\u0430\\u0432\\u043b\\u0456\\u043d\\u043d\\u044f \\u0432 \\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0456?"}}, {"added": {"name": "Field", "object": "\\u042f\\u043a\\u043e\\u044e \\u043c\\u0430\\u0454 \\u0431\\u0443\\u0442\\u0438 \\u0432\\u0438\\u0431\\u043e\\u0440\\u0447\\u0430 \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430?"}}, {"added": {"name": "Field", "object": "\\u0425\\u043e\\u0447\\u0435\\u0442\\u0435 \\u0437\\u043c\\u0435\\u043d\\u0448\\u0438\\u0442\\u0438 \\u043a\\u0456\\u043b\\u044c\\u043a\\u0456\\u0441\\u0442\\u044c \\u0434\\u0435\\u043f\\u0443\\u0442\\u0430\\u0442\\u0456\\u0432 \\u0412\\u0435\\u0440\\u0445\\u043e\\u0432\\u043d\\u043e\\u0457 \\u0420\\u0430\\u0434\\u0438?"}}, {"changed": {"name": "Field", "object": "\\u0429\\u043e \\u0432\\u0438 \\u043f\\u043b\\u0430\\u043d\\u0443\\u0454\\u0442\\u0435 \\u0437\\u0440\\u043e\\u0431\\u0438\\u0442\\u0438 \\u0456\\u0437 \\u0443\\u043a\\u0440\\u0430\\u0457\\u043d\\u0441\\u044c\\u043a\\u0438\\u043c\\u0438 \\u0437\\u0431\\u0440\\u043e\\u0439\\u043d\\u0438\\u043c\\u0438 \\u0441\\u0438\\u043b\\u0430\\u043c\\u0438?", "fields": ["required"]}}, {"changed": {"name": "Field", "object": "\\u042f\\u043a\\u0438\\u043c \\u0447\\u0438\\u043d\\u043e\\u043c \\u043f\\u0440\\u043e\\u0442\\u0438\\u0434\\u0456\\u044f\\u0442\\u0438\\u043c\\u0435\\u043c\\u043e \\u0430\\u0433\\u0440\\u0435\\u0441\\u0456\\u0457 \\u0420\\u043e\\u0441\\u0456\\u0457?", "fields": ["required"]}}, {"changed": {"name": "Field", "object": "\\u041e\\u043a\\u0440\\u0456\\u043c \\u0432\\u0456\\u0439\\u0441\\u044c\\u043a\\u043e\\u0432\\u043e\\u0433\\u043e \\u043f\\u0430\\u0440\\u0442\\u043d\\u0435\\u0440\\u0441\\u0442\\u0432\\u0430 \\u0442\\u0430\\u043a\\u043e\\u0436 \\u0442\\u0440\\u0435\\u0431\\u0430 \\u043e\\u0431\\u0438\\u0440\\u0430\\u0442\\u0438 \\u0437 \\u043a\\u0438\\u043c \\u0434\\u0440\\u0443\\u0436\\u0438\\u0442\\u0438\\u043c\\u0435\\u043c\\u043e \\u0432 \\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u0447\\u043d\\u0456\\u0439 \\u0456 \\u0435\\u043a\\u043e\\u043d\\u043e\\u043c\\u0456\\u0447\\u043d\\u0456\\u0439 \\u0441\\u0444\\u0435\\u0440\\u0430\\u0445. \\u0412\\u0436\\u0435 \\u043c\\u0430\\u0454\\u0442\\u0435 \\u0432\\u0430\\u0440\\u0456\\u0430\\u043d\\u0442\\u0438?", "fields": ["required"]}}]	10	1
14	2018-12-26 17:38:44.94158+02	17	questions	2	[{"added": {"name": "Field", "object": "\\u0429\\u043e \\u0440\\u043e\\u0431\\u0438\\u0442\\u0438\\u043c\\u0435\\u043c\\u043e \\u0437 \\u0434\\u0435\\u0440\\u0436\\u0430\\u0432\\u043d\\u0438\\u043c \\u0444\\u0456\\u043d\\u0430\\u043d\\u0441\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u0447\\u043d\\u0438\\u0445 \\u043f\\u0430\\u0440\\u0442\\u0456\\u0439?"}}, {"added": {"name": "Field", "object": "\\u0429\\u043e \\u0440\\u043e\\u0431\\u0438\\u0442\\u0438\\u043c\\u0435\\u043c\\u043e \\u0437 \\u0456\\u043d\\u043e\\u0437\\u0435\\u043c\\u0446\\u044f\\u043c\\u0438, \\u044f\\u043a\\u0456 \\u0445\\u043e\\u0447\\u0443\\u0442\\u044c \\u043e\\u0442\\u0440\\u0438\\u043c\\u0430\\u0442\\u0438 \\u0443\\u043a\\u0440\\u0430\\u0457\\u043d\\u0441\\u044c\\u043a\\u0435 \\u0433\\u0440\\u043e\\u043c\\u0430\\u0434\\u044f\\u043d\\u0441\\u0442\\u0432\\u043e?"}}, {"added": {"name": "Field", "object": "\\u041f\\u0456\\u0441\\u043b\\u044f \\u043f\\u0435\\u0440\\u0435\\u043c\\u043e\\u0433\\u0438, \\u0434\\u0430\\u043c\\u043e \\u0430\\u043c\\u043d\\u0456\\u0441\\u0442\\u0456\\u044e \\u0433\\u0440\\u043e\\u043c\\u0430\\u0434\\u044f\\u043d\\u0430\\u043c \\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0438, \\u044f\\u043a\\u0456 \\u0432\\u043e\\u044e\\u0432\\u0430\\u043b\\u0438 \\u043d\\u0430 \\u0431\\u043e\\u0446\\u0456 \\u0420\\u043e\\u0441\\u0456\\u0457?"}}, {"added": {"name": "Field", "object": "\\u0413\\u0440\\u043e\\u043c\\u0430\\u0434\\u044f\\u043d\\u0438 \\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0438 \\u043c\\u0430\\u044e\\u0442\\u044c \\u043f\\u0440\\u0430\\u0432\\u043e \\u043d\\u0430 \\u0432\\u0456\\u043b\\u044c\\u043d\\u0435 \\u0432\\u043e\\u043b\\u043e\\u0434\\u0456\\u043d\\u043d\\u044f \\u0437\\u0431\\u0440\\u043e\\u0454\\u044e?"}}, {"added": {"name": "Field", "object": "\\u0429\\u043e \\u0440\\u043e\\u0431\\u0438\\u0442\\u0438\\u043c\\u0435\\u043c\\u043e \\u0437 \\u0447\\u0438\\u043d\\u043e\\u0432\\u043d\\u0438\\u043a\\u0430\\u043c\\u0438, \\u044f\\u043a\\u0438\\u0445 \\u0432\\u043f\\u0456\\u0439\\u043c\\u0430\\u044e\\u0442\\u044c \\u043d\\u0430 \\u043a\\u043e\\u0440\\u0443\\u043f\\u0446\\u0456\\u0457?"}}, {"added": {"name": "Field", "object": "\\u0412\\u0456\\u0434 \\u043a\\u043e\\u0440\\u0443\\u043f\\u0446\\u0456\\u043e\\u043d\\u0435\\u0440\\u0456\\u0432 \\u043c\\u0438 \\u043f\\u043e\\u0437\\u0431\\u0430\\u0432\\u0438\\u043b\\u0438\\u0441\\u044f. \\u0429\\u043e \\u043f\\u043b\\u0430\\u043d\\u0443\\u0454\\u0442\\u0435 \\u0437\\u0440\\u043e\\u0431\\u0438\\u0442\\u0438, \\u0449\\u043e\\u0431 \\u043d\\u0435 \\u0437'\\u044f\\u0432\\u0438\\u043b\\u0438\\u0441\\u044f \\u043d\\u043e\\u0432\\u0456?"}}, {"added": {"name": "Field", "object": "\\u041c\\u0430\\u0454\\u0442\\u0435 \\u0456\\u0434\\u0435\\u0457 \\u0449\\u043e\\u0434\\u043e \\u043a\\u0430\\u0434\\u0440\\u043e\\u0432\\u043e\\u0457 \\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u043a\\u0438?"}}, {"added": {"name": "Field", "object": "\\u042f\\u043a\\u0456 \\u0442\\u0435\\u0437\\u0438 \\u0449\\u043e\\u0434\\u043e \\u0440\\u0435\\u0444\\u043e\\u0440\\u043c\\u0438 \\u0441\\u0443\\u0434\\u043e\\u0432\\u043e\\u0457 \\u0442\\u0430 \\u043f\\u0440\\u0430\\u0432\\u043e\\u043e\\u0445\\u043e\\u0440\\u043e\\u043d\\u043d\\u043e\\u0457 \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0438 \\u0432\\u0430\\u043c \\u043f\\u043e\\u0434\\u043e\\u0431\\u0430\\u044e\\u0442\\u044c\\u0441\\u044f?"}}, {"added": {"name": "Field", "object": "\\u0429\\u043e\\u0441\\u044c \\u043d\\u043e\\u0432\\u0435 \\u0441\\u0442\\u0432\\u043e\\u0440\\u044e\\u0432\\u0430\\u0442\\u0438\\u043c\\u0435\\u043c\\u043e?"}}]	10	1
15	2018-12-26 17:52:32.180069+02	17	questions	2	[{"added": {"name": "Field", "object": "\\u0429\\u043e \\u043f\\u0440\\u043e\\u043f\\u043e\\u043d\\u0443\\u0454\\u0442\\u0435 \\u0434\\u043b\\u044f \\u0440\\u0435\\u0444\\u043e\\u0440\\u043c\\u0438 \\u043c\\u0456\\u0441\\u0446\\u0435\\u0432\\u043e\\u0433\\u043e \\u0441\\u0430\\u043c\\u043e\\u0432\\u0440\\u044f\\u0434\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f?"}}, {"added": {"name": "Field", "object": "\\u041f\\u0435\\u0440\\u0435\\u0439\\u0434\\u0456\\u043c\\u043e \\u0434\\u043e \\u0435\\u043a\\u043e\\u043d\\u043e\\u043c\\u0456\\u043a\\u0438. \\u041f\\u0435\\u0440\\u0448\\u0435 \\u043f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f: \\u0449\\u043e \\u0432\\u0438 \\u0437\\u0430\\u043f\\u0440\\u043e\\u043f\\u043e\\u043d\\u0443\\u0454\\u0442\\u0435, \\u0449\\u043e\\u0431 \\u043f\\u043e\\u043b\\u0456\\u043f\\u0448\\u0438\\u0442\\u0438 \\u0443\\u043c\\u043e\\u0432\\u0438 \\u0432\\u0435\\u0434\\u0435\\u043d\\u043d\\u044f \\u0431\\u0456\\u0437\\u043d\\u0435\\u0441\\u0443?"}}, {"added": {"name": "Field", "object": "\\u0422\\u0440\\u043e\\u0448\\u043a\\u0438 \\u043f\\u0440\\u043e \\u043c\\u043e\\u043d\\u0435\\u0442\\u0430\\u0440\\u043d\\u0443 \\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u043a\\u0443. \\u041e\\u0431\\u0435\\u0440\\u0435\\u0442\\u0435 \\u0449\\u043e\\u0441\\u044c \\u0437 \\u0446\\u044c\\u043e\\u0433\\u043e?"}}, {"added": {"name": "Field", "object": "\\u0423\\u0441\\u0456\\u0445 \\u0445\\u0432\\u0438\\u043b\\u044e\\u0454 \\u043f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f \\u043f\\u043e\\u0434\\u0430\\u0442\\u043a\\u0456\\u0432. \\u0417\\u043c\\u0456\\u043d\\u0438\\u043c\\u043e \\u043f\\u043e\\u0434\\u0430\\u0442\\u043a\\u043e\\u0432\\u0443 \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0443?"}}, {"added": {"name": "Field", "object": "\\u0411\\u0430\\u0433\\u0430\\u0442\\u043e \\u0443\\u0441\\u043f\\u0456\\u0448\\u043d\\u0438\\u0445 \\u0434\\u0435\\u0440\\u0436\\u0430\\u0432\\u043d\\u0438\\u0445 \\u043f\\u0456\\u0434\\u043f\\u0440\\u0438\\u0454\\u043c\\u0441\\u0442\\u0432 \\u0431\\u0443\\u043b\\u043e \\u043f\\u0440\\u0438\\u0432\\u0430\\u0442\\u0438\\u0437\\u043e\\u0432\\u0430\\u043d\\u043e \\u0437\\u0430 \\u0431\\u0435\\u0437\\u0446\\u0456\\u043d\\u044c, \\u0430 \\u0437\\u0431\\u0438\\u0442\\u043a\\u043e\\u0432\\u0456, \\u043d\\u0430\\u0432\\u043f\\u0430\\u043a\\u0438, \\u043f\\u0440\\u043e\\u0434\\u043e\\u0432\\u0436\\u0443\\u0442\\u044c \\u0442\\u0438\\u0441\\u043d\\u0443\\u0442\\u0438 \\u043d\\u0430 \\u0431\\u044e\\u0434\\u0436\\u0435\\u0442. \\u0414\\u0430\\u0432\\u0430\\u0439\\u0442\\u0435 \\u0440\\u043e\\u0437\\u0431\\u0435\\u0440\\u0435\\u043c\\u043e\\u0441\\u044f \\u0437 \\u0446\\u0438\\u043c."}}, {"added": {"name": "Field", "object": "\\u042f\\u043a\\u0438\\u0439 \\u043a\\u0443\\u0440\\u0441 \\u043d\\u0430 \\u0434\\u0435\\u043e\\u043b\\u0456\\u0433\\u0430\\u0440\\u0445\\u0456\\u0437\\u0430\\u0446\\u0456\\u044e \\u0435\\u043a\\u043e\\u043d\\u043e\\u043c\\u0456\\u043a\\u0438 \\u0432\\u0438 \\u0432\\u0456\\u0437\\u044c\\u043c\\u0435\\u0442\\u0435 (\\u0456 \\u0447\\u0438 \\u0432\\u0456\\u0437\\u044c\\u043c\\u0435\\u0442\\u0435)?"}}, {"added": {"name": "Field", "object": "\\u0427\\u0438 \\u0431\\u0443\\u0434\\u0435\\u043c\\u043e \\u043f\\u0440\\u043e\\u0434\\u0430\\u0432\\u0430\\u0442\\u0438 \\u0437\\u0435\\u043c\\u043b\\u044e \\u0441\\u0456\\u043b\\u044c\\u0441\\u044c\\u043a\\u043e\\u0433\\u043e\\u0441\\u043f\\u043e\\u0434\\u0430\\u0440\\u0441\\u044c\\u043a\\u043e\\u0433\\u043e \\u043f\\u0440\\u0438\\u0437\\u043d\\u0430\\u0447\\u0435\\u043d\\u043d\\u044f?"}}, {"added": {"name": "Field", "object": "\\u041a\\u043e\\u0436\\u0435\\u043d \\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u043a \\u0437\\u043d\\u0430\\u0454, \\u0449\\u043e \\u0441\\u0435\\u043b\\u043e \\u2014 \\u0442\\u043e \\u043a\\u043e\\u043b\\u0438\\u0441\\u043a\\u0430 \\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0438. \\u042f\\u043a\\u0438\\u043c \\u0447\\u0438\\u043d\\u043e\\u043c \\u043f\\u0456\\u0434\\u0442\\u0440\\u0438\\u043c\\u0430\\u0454\\u043c\\u043e \\u0439\\u043e\\u0433\\u043e?"}}, {"added": {"name": "Field", "object": "\\u042f\\u043a \\u0440\\u0435\\u0444\\u043e\\u0440\\u043c\\u0443\\u0432\\u0430\\u0442\\u0438\\u043c\\u0435\\u043c\\u043e \\u0435\\u043d\\u0435\\u0440\\u0433\\u0435\\u0442\\u0438\\u0447\\u043d\\u0443 \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0443 \\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0438?"}}, {"added": {"name": "Field", "object": "\\u0410 \\u043f\\u0440\\u043e\\u043c\\u0438\\u0441\\u043b\\u043e\\u0432\\u0456\\u0441\\u0442\\u044c?"}}, {"added": {"name": "Field", "object": "\\u041d\\u0443 \\u0439 \\u043d\\u0430\\u043e\\u0441\\u0442\\u0430\\u043d\\u043e\\u043a, \\u0456\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u0430 \\u0456 \\u0442\\u0440\\u0430\\u043d\\u0441\\u043f\\u043e\\u0440\\u0442."}}, {"added": {"name": "Field", "object": "\\u0427\\u0438 \\u0431\\u0443\\u0434\\u0435\\u0442\\u0435 \\u0449\\u043e\\u0441\\u044c \\u043e\\u0431\\u0456\\u0446\\u044f\\u0442\\u0438 \\u0437\\u0456 \\u0441\\u0444\\u0435\\u0440\\u0438 \\u0442\\u0440\\u0443\\u0434\\u043e\\u0432\\u043e\\u0457 \\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u043a\\u0438?"}}, {"added": {"name": "Field", "object": "\\u041f\\u0435\\u043d\\u0441\\u0456\\u0439\\u043d\\u043e\\u0457 \\u0440\\u0435\\u0444\\u043e\\u0440\\u043c\\u0438?"}}]	10	1
16	2018-12-26 18:02:25.267794+02	17	questions	2	[{"added": {"name": "Field", "object": "\\u042f\\u043a \\u043f\\u043e\\u043a\\u0440\\u0430\\u0449\\u0443\\u0432\\u0430\\u0442\\u0438\\u043c\\u0438\\u0442\\u0435 \\u0441\\u043e\\u0446\\u0456\\u0430\\u043b\\u044c\\u043d\\u0438\\u0439 \\u0437\\u0430\\u0445\\u0438\\u0441\\u0442 \\u0433\\u0440\\u043e\\u043c\\u0430\\u0434\\u044f\\u043d?"}}, {"added": {"name": "Field", "object": "\\u0415\\u043a\\u043e\\u043b\\u043e\\u0433\\u0456\\u044f \\u2014 \\u0432\\u0430\\u0436\\u043b\\u0438\\u0432\\u0430 \\u0442\\u0435\\u043c\\u0430 \\u0456 \\u0442\\u0443\\u0442 \\u043d\\u0435 \\u043c\\u043e\\u0436\\u0435 \\u0431\\u0443\\u0442\\u0438 \\u043a\\u043e\\u043c\\u043f\\u0440\\u043e\\u043c\\u0456\\u0441\\u0456\\u0432."}}, {"added": {"name": "Field", "object": "\\u041f\\u0440\\u043e \\u043c\\u0435\\u0434\\u0438\\u0447\\u043d\\u0443 \\u0440\\u0435\\u0444\\u043e\\u0440\\u043c\\u0443 \\u0437\\u0430\\u0440\\u0430\\u0437 \\u0433\\u043e\\u0432\\u043e\\u0440\\u044f\\u0442\\u044c \\u0443\\u0441\\u0456, \\u0441\\u043a\\u0430\\u0436\\u0456\\u043c\\u043e \\u0449\\u043e\\u0441\\u044c \\u0456 \\u043c\\u0438."}}, {"added": {"name": "Field", "object": "\\u042f\\u043a\\u0431\\u0438 \\u0441\\u0442\\u0432\\u043e\\u0440\\u044e\\u044e\\u0447\\u0438 \\u0446\\u0435\\u0439 \\u0433\\u0435\\u043d\\u0435\\u0440\\u0430\\u0442\\u043e\\u0440 \\u043c\\u0438 \\u0431\\u0440\\u0430\\u043b\\u0438 \\u0434\\u043e \\u0443\\u0432\\u0430\\u0433\\u0438 \\u0437\\u043e\\u0432\\u043d\\u0456\\u0448\\u043d\\u044e \\u0440\\u0435\\u043a\\u043b\\u0430\\u043c\\u0443, \\u0446\\u0435 \\u043f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f \\u043c\\u0430\\u043b\\u043e \\u0431 \\u0431\\u0443\\u0442\\u0438 \\u043f\\u0435\\u0440\\u0448\\u0438\\u043c (\\u0456 \\u0454\\u0434\\u0438\\u043d\\u0438\\u043c). \\u041e\\u0442\\u0436\\u0435, \\u0449\\u043e \\u0432\\u0438 \\u043e\\u0431\\u0456\\u0446\\u044f\\u0454\\u0442\\u0435 \\u0437\\u0440\\u043e\\u0431\\u0438\\u0442\\u0438 \\u0437 \\u043a\\u043e\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u0438\\u043c \\u0433\\u043e\\u0441\\u043f\\u043e\\u0434\\u0430\\u0440\\u0441\\u0442\\u0432\\u043e\\u043c \\u0456 \\u043f\\u043e\\u0441\\u043b\\u0443\\u0433\\u0430\\u043c\\u0438?"}}, {"added": {"name": "Field", "object": "\\u0422\\u0435\\u043f\\u0435\\u0440 \\u043a\\u043e\\u043b\\u0438 \\u0432\\u0438\\u0437\\u043d\\u0430\\u0447\\u0438\\u043b\\u0438\\u0441\\u044f \\u0437 \\u043f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f\\u043c\\u0438, \\u0449\\u043e \\u0434\\u0456\\u0439\\u0441\\u043d\\u043e \\u0445\\u0432\\u0438\\u043b\\u044e\\u044e\\u0442\\u044c \\u0432\\u0438\\u0431\\u043e\\u0440\\u0446\\u0456\\u0432, \\u043f\\u043e\\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u043c\\u043e \\u043f\\u0440\\u043e \\u043f\\u0456\\u0434\\u0442\\u0440\\u0438\\u043c\\u043a\\u0443 \\u043c\\u043e\\u043b\\u043e\\u0434\\u0456 \\u0456 \\u0441\\u043f\\u043e\\u0440\\u0442\\u0443."}}, {"added": {"name": "Field", "object": "\\u041d\\u0430\\u0432\\u0440\\u044f\\u0434 \\u0446\\u0456 \\u0437\\u0430\\u0434\\u0440\\u043e\\u0442\\u0438 \\u0437\\u0430 \\u0432\\u0430\\u0441 \\u043f\\u0440\\u043e\\u0433\\u043e\\u043b\\u043e\\u0441\\u0443\\u044e\\u0442\\u044c, \\u0430\\u043b\\u0435 \\u0434\\u0430\\u0432\\u0430\\u0439\\u0442\\u0435 \\u0437\\u0440\\u043e\\u0431\\u0438\\u043c\\u043e \\u0432\\u0438\\u0433\\u043b\\u044f\\u0434, \\u0449\\u043e \\u043c\\u0438 \\u043f\\u0435\\u0440\\u0435\\u0436\\u0438\\u0432\\u0430\\u0454\\u043c\\u043e \\u0437\\u0430 \\u043d\\u0430\\u0443\\u043a\\u0443."}}, {"added": {"name": "Field", "object": "\\u0421\\u043f\\u0440\\u043e\\u0431\\u0443\\u0454\\u043c\\u043e \\u0437\\u043d\\u0430\\u0439\\u0442\\u0438 \\u0434\\u043e\\u0440\\u043e\\u0433\\u0443 \\u0434\\u043e \\u0441\\u0435\\u0440\\u0434\\u0435\\u0446\\u044c \\u043e\\u0441\\u0432\\u0456\\u0442\\u044f\\u043d. \\u0429\\u043e \\u043c\\u0430\\u0454\\u0442\\u0435 \\u0449\\u043e\\u0434\\u043e \\u0443\\u043d\\u0456\\u0432\\u0435\\u0440\\u0441\\u0438\\u0442\\u0435\\u0442\\u0456\\u0432?"}}, {"added": {"name": "Field", "object": "\\u0425\\u043e\\u0447 \\u0434\\u0456\\u0442\\u0438 \\u0439 \\u043d\\u0435 \\u0433\\u043e\\u043b\\u043e\\u0441\\u0443\\u044e\\u0442\\u044c, \\u043f\\u0440\\u043e\\u0442\\u0435 \\u043f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f \\u0448\\u043a\\u0456\\u043b\\u044c\\u043d\\u043e\\u0457 \\u043e\\u0441\\u0432\\u0456\\u0442\\u0438 \\u2014 \\u0446\\u0435 \\u0442\\u0435, \\u0449\\u043e \\u0445\\u0432\\u0438\\u043b\\u044e\\u0454 \\u0443\\u0441\\u0456\\u0445 \\u0431\\u0430\\u0442\\u044c\\u043a\\u0456\\u0432."}}, {"added": {"name": "Field", "object": "\\"\\u0406 \\u0447\\u0443\\u0436\\u043e\\u0433\\u043e \\u043d\\u0430\\u0432\\u0447\\u0430\\u0439\\u0442\\u0435\\u0441\\u044c, \\u0439 \\u0441\\u0432\\u043e\\u0433\\u043e \\u043d\\u0435 \\u0447\\u0443\\u0440\\u0430\\u0439\\u0442\\u0435\\u0441\\u044c\\", \\u2014 \\u043a\\u0430\\u0437\\u0430\\u0432 \\u043a\\u043b\\u0430\\u0441\\u0438\\u043a. \\u0427\\u0430\\u0441 \\u043f\\u043e\\u0434\\u0443\\u043c\\u0430\\u0442\\u0438 \\u043f\\u0440\\u043e \\u0432\\u0456\\u0447\\u043d\\u0435 \\u2014 \\u043f\\u0440\\u043e \\u043a\\u0443\\u043b\\u044c\\u0442\\u0443\\u0440\\u0443."}}, {"added": {"name": "Field", "object": "\\u041d\\u0430\\u0446\\u0456\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u0430 \\u0442\\u0430 \\u043c\\u043e\\u0432\\u043d\\u0430 \\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u043a\\u0430"}}, {"added": {"name": "Field", "object": "\\u0425\\u043e\\u0447 \\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430 \\u0456 \\u0454 \\u0441\\u0432\\u0456\\u0442\\u0441\\u044c\\u043a\\u043e\\u0457 \\u0434\\u0435\\u0440\\u0436\\u0430\\u0432\\u043e\\u044e, \\u043f\\u0440\\u043e\\u0442\\u0435 \\u0446\\u0435\\u0440\\u043a\\u0432\\u0430 \\u043c\\u0430\\u0454 \\u043d\\u0430\\u0439\\u0431\\u0456\\u043b\\u044c\\u0448\\u0443 \\u043f\\u0456\\u0434\\u0442\\u0440\\u0438\\u043c\\u043a\\u0443 \\u0443 \\u043f\\u043e\\u0442\\u0435\\u043d\\u0446\\u0456\\u0439\\u043d\\u0438\\u0445 \\u0432\\u0438\\u0431\\u043e\\u0440\\u0446\\u0456\\u0432."}}, {"added": {"name": "Field", "object": "\\u041f\\u0440\\u043e\\u0432\\u0430\\u0434\\u0436\\u0435\\u043d\\u043d\\u044f \\u0431\\u0443\\u0434\\u044c-\\u044f\\u043a\\u043e\\u0457 \\u0433\\u0443\\u043c\\u0430\\u043d\\u0456\\u0442\\u0430\\u0440\\u043d\\u043e\\u0457 \\u043f\\u043e\\u043b\\u0456\\u0442\\u0438\\u043a\\u0438 \\u043d\\u0435\\u043c\\u043e\\u0436\\u043b\\u0438\\u0432\\u0435 \\u0431\\u0435\\u0437 \\u0443\\u0447\\u0430\\u0441\\u0442\\u0456 \\u043c\\u0435\\u0434\\u0456\\u0430. \\u042f\\u043a\\u0430 \\u0432\\u0430\\u0448\\u0430 \\u043c\\u0435\\u0434\\u0456\\u0430\\u0441\\u0442\\u0440\\u0430\\u0442\\u0435\\u0433\\u0456\\u044f?"}}, {"added": {"name": "Field", "object": "\\u041e\\u0441\\u0442\\u0430\\u043d\\u043d\\u0454 \\u043f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f: \\u044f\\u043a \\u0431\\u0443\\u0434\\u0435\\u043c\\u043e \\u043f\\u0435\\u0440\\u0435\\u043c\\u0430\\u0433\\u0430\\u0442\\u0438 \\u0432 \\u0456\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0456\\u0439\\u043d\\u0456\\u0439 \\u0432\\u0456\\u0439\\u043d\\u0456?"}}]	10	1
17	2018-12-26 18:14:42.11985+02	17	questions	2	[{"changed": {"fields": ["button_text"]}}]	10	1
18	2018-12-26 18:25:00.293311+02	17	questions	2	[]	10	1
19	2018-12-26 22:03:59.857109+02	17	Форма опитування	2	[{"changed": {"fields": ["title"]}}]	10	1
20	2018-12-27 22:22:58.347205+02	17	Форма опитування	2	[{"changed": {"name": "Field", "object": "\\u0415\\u043a\\u043e\\u043b\\u043e\\u0433\\u0456\\u044f \\u2014 \\u0432\\u0430\\u0436\\u043b\\u0438\\u0432\\u0430 \\u0442\\u0435\\u043c\\u0430 \\u0456 \\u0442\\u0443\\u0442 \\u043d\\u0435 \\u043c\\u043e\\u0436\\u0435 \\u0431\\u0443\\u0442\\u0438 \\u043a\\u043e\\u043c\\u043f\\u0440\\u043e\\u043c\\u0456\\u0441\\u0456\\u0432", "fields": ["label"]}}, {"changed": {"name": "Field", "object": "\\u041f\\u0440\\u043e \\u043c\\u0435\\u0434\\u0438\\u0447\\u043d\\u0443 \\u0440\\u0435\\u0444\\u043e\\u0440\\u043c\\u0443 \\u0437\\u0430\\u0440\\u0430\\u0437 \\u0433\\u043e\\u0432\\u043e\\u0440\\u044f\\u0442\\u044c \\u0443\\u0441\\u0456, \\u0441\\u043a\\u0430\\u0436\\u0456\\u043c\\u043e \\u0449\\u043e\\u0441\\u044c \\u0456 \\u043c\\u0438", "fields": ["label"]}}, {"changed": {"name": "Field", "object": "\\u0422\\u0435\\u043f\\u0435\\u0440 \\u043a\\u043e\\u043b\\u0438 \\u0432\\u0438\\u0437\\u043d\\u0430\\u0447\\u0438\\u043b\\u0438\\u0441\\u044f \\u0437 \\u043f\\u0438\\u0442\\u0430\\u043d\\u043d\\u044f\\u043c\\u0438, \\u0449\\u043e \\u0434\\u0456\\u0439\\u0441\\u043d\\u043e \\u0445\\u0432\\u0438\\u043b\\u044e\\u044e\\u0442\\u044c \\u0432\\u0438\\u0431\\u043e\\u0440\\u0446\\u0456\\u0432, \\u043f\\u043e\\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u043c\\u043e \\u043f\\u0440\\u043e \\u043f\\u0456\\u0434\\u0442\\u0440\\u0438\\u043c\\u043a\\u0443 \\u043c\\u043e\\u043b\\u043e\\u0434\\u0456 \\u0456 \\u0441\\u043f\\u043e\\u0440\\u0442\\u0443", "fields": ["label"]}}, {"changed": {"name": "Field", "object": "\\u041d\\u0430\\u0432\\u0440\\u044f\\u0434 \\u0446\\u0456 \\u0437\\u0430\\u0434\\u0440\\u043e\\u0442\\u0438 \\u0437\\u0430 \\u0432\\u0430\\u0441 \\u043f\\u0440\\u043e\\u0433\\u043e\\u043b\\u043e\\u0441\\u0443\\u044e\\u0442\\u044c, \\u0430\\u043b\\u0435 \\u0434\\u0430\\u0432\\u0430\\u0439\\u0442\\u0435 \\u0437\\u0440\\u043e\\u0431\\u0438\\u043c\\u043e \\u0432\\u0438\\u0433\\u043b\\u044f\\u0434, \\u0449\\u043e \\u043c\\u0438 \\u043f\\u0435\\u0440\\u0435\\u0436\\u0438\\u0432\\u0430\\u0454\\u043c\\u043e \\u0437\\u0430 \\u043d\\u0430\\u0443\\u043a\\u0443", "fields": ["label"]}}]	10	1
\.


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 197
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 20, true);


--
-- TOC entry 2382 (class 0 OID 16399)
-- Dependencies: 184
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	forms	field
9	forms	fieldentry
10	forms	form
11	forms	formentry
12	demo_post	demo_fun
13	demo	post
14	demo_pub	howareyou
15	questionnaire	demo_model
16	questionnaire	policy
17	questionnaire	questionanswer
\.


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 183
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- TOC entry 2380 (class 0 OID 16388)
-- Dependencies: 182
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-12-18 19:56:46.264698+02
2	auth	0001_initial	2018-12-18 19:56:47.544435+02
3	admin	0001_initial	2018-12-18 19:56:47.794382+02
4	admin	0002_logentry_remove_auto_add	2018-12-18 19:56:47.828181+02
5	contenttypes	0002_remove_content_type_name	2018-12-18 19:56:47.93579+02
6	auth	0002_alter_permission_name_max_length	2018-12-18 19:56:47.961342+02
7	auth	0003_alter_user_email_max_length	2018-12-18 19:56:48.002836+02
8	auth	0004_alter_user_username_opts	2018-12-18 19:56:48.039378+02
9	auth	0005_alter_user_last_login_null	2018-12-18 19:56:48.086053+02
10	auth	0006_require_contenttypes_0002	2018-12-18 19:56:48.094414+02
11	auth	0007_alter_validators_add_error_messages	2018-12-18 19:56:48.1287+02
12	auth	0008_alter_user_username_max_length	2018-12-18 19:56:48.227847+02
13	auth	0009_alter_user_last_name_max_length	2018-12-18 19:56:48.269918+02
14	sites	0001_initial	2018-12-18 19:56:48.353379+02
15	forms	0001_initial	2018-12-18 19:56:49.31475+02
16	forms	0002_auto_20160418_0120	2018-12-18 19:56:49.348394+02
17	sessions	0001_initial	2018-12-18 19:56:49.556296+02
18	sites	0002_alter_domain_unique	2018-12-18 19:56:49.672503+02
19	demo_post	0001_initial	2018-12-18 20:18:34.78045+02
20	demo	0001_initial	2018-12-18 20:25:56.124751+02
21	demo_pub	0001_initial	2018-12-18 20:34:17.363481+02
22	questionnaire	0001_initial	2018-12-19 17:33:05.723563+02
23	questionnaire	0002_demo_model_condition	2018-12-19 18:35:31.09719+02
24	questionnaire	0003_auto_20181219_1830	2018-12-19 20:30:48.569379+02
25	forms	0003_auto_20181224_1540	2018-12-24 17:41:10.366594+02
26	forms	0004_auto_20181226_1523	2018-12-26 17:23:51.391698+02
\.


--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 181
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- TOC entry 2409 (class 0 OID 16635)
-- Dependencies: 211
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2frnmwack31dcoosvdgcyh7n00le6nad	ZTBmYzk4MzJlMzllMjk3NjNkNjI2NjQzOWQzZTY3NjBjNDUwM2FiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NzY3NWQ2MjcyMmE4NjRlZjYwZDQ3ZjViZTFjM2YyNDc3N2U1ZjJjIn0=	2019-01-01 20:26:30.425311+02
\.


--
-- TOC entry 2398 (class 0 OID 16543)
-- Dependencies: 200
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- TOC entry 2400 (class 0 OID 16551)
-- Dependencies: 202
-- Data for Name: forms_field; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.forms_field (id, label, slug, field_type, required, visible, choices, "default", placeholder_text, help_text, "order", form_id) FROM stdin;
5	Почнемо з питань національної безпеки. Які будуть ваші дії із будівництва військово-політичного союзу?	pochnemo_z_pitan_natsionalnoyi_bezpeki_iaki_budut_vashi_diyi_iz_budivnitstva_viiskovo_politichnogo_soiuzu	8	t	t	Інтеграція до НАТО, Створення Балто-Чорноморського союзу, Нейтралітет		\N		0	17
7	Як повертатимемо Крим і Донбас?	iak_povertatimemo_krim_i_donbas	8	t	t	Військова перемога, Економічна перемога, Культурна перемога		\N		2	17
6	Що ви плануєте зробити із українськими збройними силами?	shcho_vi_planuiete_zrobiti_iz_ukrayinskimi_zbroinimi_silami	5	f	t	Створення системи військового резерву, Відновлення ядерного статусу, Перехід до контрактної армії, Реформування та переоснащення армії		\N		1	17
8	Яким чином протидіятимемо агресії Росії?	iakim_chinom_protidiiatimemo_agresiyi_rosiyi	5	f	t	Дотримуватимемося Мінських угод, Підтримхуватимемо ворогів Росії, Введемо візовий режим з Російською Федерацією, Вимагатимемо гарантій безпеки, України згідно з Будапештським меморандумом, Протидіятимемо в міжнародних судах, Націоналізуємо російське майно на території України		\N		3	17
9	Окрім військового партнерства також треба обирати з ким дружитимемо в політичній і економічній сферах. Вже маєте варіанти?	okrim_viiskovogo_partnerstva_takozh_treba_obirati_z_kim_druzhitimemo_v_politichnii_i_ekonomichnii_sferakh_vzhe_maiete_varianti	5	f	t	ЄС, Країни Балтії, США, Китай		\N		4	17
10	Добре, із зовнішньою політикою розібралися, треба вирішити і за внутрішню. Якою має бути форма правління в Україні?	dobre_iz_zovnishnoiu_politikoiu_rozibralisia_treba_virishiti_i_za_vnutrishniu_iakoiu_maie_buti_forma_pravlinnia_v_ukrayini	8	t	t	Парламентська республіка, Президентська республіка, Парламентсько-президентська республіка		\N		5	17
11	Якою має бути виборча система?	iakoiu_maie_buti_viborcha_sistema	5	f	t	Вибори за відкритими партійними списками на національному рівні, Вибори за мажоритарними списками на локальному рівні		\N		6	17
12	Хочете зменшити кількість депутатів Верховної Ради?	khochete_zmenshiti_kilkist_deputativ_verkhovnoyi_radi	8	t	t	Так,Ні		\N		7	17
13	Що робитимемо з державним фінансування політичних партій?	shcho_robitimemo_z_derzhavnim_finansuvannia_politichnikh_partii	8	t	t	Відміна державного фінансування, Запровадження державного		\N		8	17
14	Що робитимемо з іноземцями, які хочуть отримати українське громадянство?	shcho_robitimemo_z_inozemtsiami_iaki_khochut_otrimati_ukrayinske_gromadianstvo	8	t	t	Спрощення системи отримання громадянства, Ускладнення системи отримання громадянства		\N		9	17
15	Після перемоги, дамо амністію громадянам України, які воювали на боці Росії?	pislia_peremogi_damo_amnistiiu_gromadianam_ukrayini_iaki_voiuvali_na_botsi_rosiyi	8	t	t	Так, Ні		\N		10	17
16	Громадяни України мають право на вільне володіння зброєю?	gromadiani_ukrayini_maiut_pravo_na_vilne_volodinnia_zbroieiu	8	t	t	Так, Ні		\N		11	17
17	Що робитимемо з чиновниками, яких впіймають на корупції?	shcho_robitimemo_z_chinovnikami_iakikh_vpiimaiut_na_koruptsiyi	5	f	t	Конфіскація майна, Смертна кара		\N		12	17
18	Від корупціонерів ми позбавилися. Що плануєте зробити, щоб не з'явилися нові?	vid_koruptsioneriv_mi_pozbavilisia_shcho_planuiete_zrobiti_shchob_ne_ziavilisia_novi	5	f	t	Люстраційна перевірка, Створення громадських рад, Вільний доступ до різноманітної публічної інформації, Сервісний підхід до надання адміністративних послуг, Розвиток інструментів електронної демократії та електронного урядування		\N		13	17
19	Маєте ідеї щодо кадрової політики?	maiete_ideyi_shchodo_kadrovoyi_politiki	5	f	t	Заборона на політичну діяльність для державних службовців, Збільшення заробітніх плат чиновників, Скорочення кількості чиновників		\N		14	17
20	Які тези щодо реформи судової та правоохоронної системи вам подобаються?	iaki_tezi_shchodo_reformi_sudovoyi_ta_pravookhoronnoyi_sistemi_vam_podobaiutsia	5	f	t	Створення жорстких механізмів контролю над судами і поліцією, Залучення громадськості, Залучення міжнародних фахівців та досвіду, Переатестація поліцейських на конкурсній основі		\N		15	17
21	Щось нове створюватимемо?	shchos_nove_stvoriuvatimemo	5	f	t	Суди присяжних, Муніципальна поліція		\N		16	17
22	Що пропонуєте для реформи місцевого самоврядування?	shcho_proponuiete_dlia_reformi_mistsevogo_samovriaduvannia	5	f	t	Управлінська автономія громад, Економічна автономія громад, Ліквідація районних у містах рад, Скорочення кількості депутатів місцевих рад, Впровадження механізму відкликання депутатів та місцевих голів		\N		17	17
23	Перейдімо до економіки. Перше питання: що ви запропонуєте, щоб поліпшити умови ведення бізнесу?	pereidimo_do_ekonomiki_pershe_pitannia_shcho_vi_zaproponuiete_shchob_polipshiti_umovi_vedennia_biznesu	5	f	t	Спрощення дозвільної системи, Обмеження кількості перевірок, Сервісний підхід до обслуговування бізнесу, Посилення відповідальності за нечесне ведення бізнесу		\N		18	17
24	Трошки про монетарну політику. Оберете щось з цього?	troshki_pro_monetarnu_politiku_oberete_shchos_z_tsogo	5	f	t	Залучення іноземних інвестицій, Державне регулювання економіки, Контроль над банками		\N		19	17
25	Усіх хвилює питання податків. Змінимо податкову систему?	usikh_khviliuie_pitannia_podatkiv_zminimo_podatkovu_sistemu	5	f	t	Зниження податків, Спрощення податкової системи, переведення її в електронну форму, Запровадження податку на розкіш		\N		20	17
26	Багато успішних державних підприємств було приватизовано за безцінь, а збиткові, навпаки, продовжуть тиснути на бюджет. Давайте розберемося з цим.	bagato_uspishnikh_derzhavnikh_pidpriiemstv_bulo_privatizovano_za_beztsin_a_zbitkovi_navpaki_prodovzhut_tisnuti_na_biudzhet_davaite_rozberemosia_z_tsim	5	f	t	Націоналізація стратегічних підприємств, Приватизація неприпуткових підприємств, Доплата за попередню приватизацію підприємств олігархами		\N		21	17
27	Який курс на деолігархізацію економіки ви візьмете (і чи візьмете)?	iakii_kurs_na_deoligarkhizatsiiu_ekonomiki_vi_vizmete_i_chi_vizmete	5	f	t	Розміщення контрольних пакетів акцій на біржах, Створення державних компаній в стратегічних галузях, У державних компаній — іноземні керівники		\N		22	17
28	Чи будемо продавати землю сільськогосподарського призначення?	chi_budemo_prodavati_zemliu_silskogospodarskogo_priznachennia	8	t	t	Продовження мораторію на продаж сільськогосподарської землі, Вільний продаж сільськогосподарської землі		\N		23	17
29	Кожен політик знає, що село — то колиска України. Яким чином підтримаємо його?	kozhen_politik_znaie_shcho_selo_to_koliska_ukrayini_iakim_chinom_pidtrimaiemo_iogo	5	f	t	Ведення земельного реєстру, Підтримка фермерських господарств, Підтримка сільськогосподарських кооперативів		\N		24	17
30	Як реформуватимемо енергетичну систему України?	iak_reformuvatimemo_energetichnu_sistemu_ukrayini	5	f	t	Впровадження поновлювальної енергетики, Модернізація існуючого фонду, Ліквідація залежності від російських енергоносіїв		\N		25	17
31	А промисловість?	a_promislovist	5	f	t	Підтримка вітчизняного виробника, Ліквідація торговельних стосунків з Росією, Впровадження інноваційних технологій, Залучення міжнародних інвесторів та ринків збуту		\N		26	17
32	Ну й наостанок, інфраструктура і транспорт.	nu_i_naostanok_infrastruktura_i_transport	5	f	t	Фінансування державою інфраструктурних проектів, Інтеграція до європейської інфраструктурної системи, Підвищення якості транспортних послуг та інфаструктури, Ремонт доріг		\N		27	17
33	Чи будете щось обіцяти зі сфери трудової політики?	chi_budete_shchos_obitsiati_zi_sferi_trudovoyi_politiki	5	f	t	Збільшення кількості робочих місць, Ухвалення нового Трудового кодексу, який краще захищатиме права працівників		\N		28	17
34	Пенсійної реформи?	pensiinoyi_reformi	5	f	t	Зменшення розриву між найбільшою і найменшою пенсіями, Позбавлення пенсій заможних громадян, Введення накопичувальної пенсійної системи паралельно з солідарною		\N		29	17
35	Як покращуватимите соціальний захист громадян?	iak_pokrashchuvatimite_sotsialnii_zakhist_gromadian	5	f	t	Індексація соціальних виплат, Впровадження адресної допомоги, Створення реєстру отримувачів соціальної допомоги, Підтримка ветеранів і переселенців		\N		30	17
38	Якби створюючи цей генератор ми брали до уваги зовнішню рекламу, це питання мало б бути першим (і єдиним). Отже, що ви обіцяєте зробити з комунальним господарством і послугами?	iakbi_stvoriuiuchi_tsei_generator_mi_brali_do_uvagi_zovnishniu_reklamu_tse_pitannia_malo_b_buti_pershim_i_iedinim_otzhe_shcho_vi_obitsiaiete_zrobiti_z_komunalnim_gospodarstvom_i_poslugami	5	f	t	Запровадження справедливих тарифів, Колективне управління господарством, Підвищення якості надавання комунальних послуг, Покращення благоустрою та комунальної інфраструктури		\N		33	17
41	Спробуємо знайти дорогу до сердець освітян. Що маєте щодо університетів?	sprobuiemo_znaiti_dorogu_do_serdets_osvitian_shcho_maiete_shchodo_universitetiv	5	f	t	Широка автономія, Підвищення якості освіти, Персональні гранти для абітурієнтів, Збільшення фінансування університетів		\N		36	17
42	Хоч діти й не голосують, проте питання шкільної освіти — це те, що хвилює усіх батьків.	khoch_diti_i_ne_golosuiut_prote_pitannia_shkilnoyi_osviti_tse_te_shcho_khviliuie_usikh_batkiv	5	f	t	Уніфікований рівень освіти у державних школах, Безкоштовна освіта, Збільшення заробітніх плат вчителів, покращення умов праці, Підвищення кваліфікації вчителів, Децентралізація освітніх адміністративних процесів, Ліквідація департаментів освіти і науки		\N		37	17
43	"І чужого навчайтесь, й свого не чурайтесь", — казав класик. Час подумати про вічне — про культуру.	i_chuzhogo_navchaites_i_svogo_ne_churaites_kazav_klasik_chas_podumati_pro_vichne_pro_kulturu	5	f	t	Підтримка українського культурного виробника, Підтримка музеїв, Розвиток меценацтва, Збереження культури національних меншин		\N		38	17
44	Національна та мовна політика	natsionalna_ta_movna_politika	5	f	t	Робота з діаспорою, Єдина державна мова, Мовні квоти у ЗМІ		\N		39	17
45	Хоч Україна і є світської державою, проте церква має найбільшу підтримку у потенційних виборців.	khoch_ukrayina_i_ie_svitskoyi_derzhavoiu_prote_tserkva_maie_naibilshu_pidtrimku_u_potentsiinikh_vibortsiv	5	f	t	Свобода віросповідання, Створення помісної церкви		\N		40	17
46	Провадження будь-якої гуманітарної політики неможливе без участі медіа. Яка ваша медіастратегія?	provadzhennia_bud_iakoyi_gumanitarnoyi_politiki_nemozhlive_bez_uchasti_media_iaka_vasha_mediastrategiia	5	f	t	Обмеження впливу власників каналів на їх редакційну політику, Створення українських закордонних мовників, Створення суспільних медіа, Обмеження ліцензій ЗМІ відповідно до їх інформаційної політики		\N		41	17
47	Останнє питання: як будемо перемагати в інформаційній війні?	ostannie_pitannia_iak_budemo_peremagati_v_informatsiinii_viini	5	f	t	Запровадимо вільний доступ до Інтернету, Створимо стандарти роботи з інформацією для чиновників, Розробимо державну інформаційну політику, Сформуємо власні кібервійська		\N		42	17
36	Екологія — важлива тема і тут не може бути компромісів	ekologiia_vazhliva_tema_i_tut_ne_mozhe_buti_kompromisiv	5	f	t	Розвиток "зеленої" економіки, Захист довкілля, Додаткові виплати від держави для громадян, що проживають на екологічно забруднених територіях, Відповідальність за забруднення довкілля		\N		31	17
37	Про медичну реформу зараз говорять усі, скажімо щось і ми	pro_medichnu_reformu_zaraz_govoriat_usi_skazhimo_shchos_i_mi	5	f	t	Запровадження системи медичного страхування, Безкоштовної невідкладна та первинна медичної допомоги, Вибір пацієнтом лікаря, Покращення якості медичних закладів і послуг, Збільшення зарплат лікарів, Створення дієвих наглядових громадських рад при лікарнях, Лікарнями керуватимуть професійні управлінці		\N		32	17
39	Тепер коли визначилися з питаннями, що дійсно хвилюють виборців, поговоримо про підтримку молоді і спорту	teper_koli_viznachilisia_z_pitanniami_shcho_diisno_khviliuiut_vibortsiv_pogovorimo_pro_pidtrimku_molodi_i_sportu	5	f	t	Підтримка багатодітних сімей, Доступне житло, Допомога в працевлаштуванні, Пропаганда здорового способу життя, Національно-патріотичне виховання		\N		34	17
40	Навряд ці задроти за вас проголосують, але давайте зробимо вигляд, що ми переживаємо за науку	navriad_tsi_zadroti_za_vas_progolosuiut_ale_davaite_zrobimo_vigliad_shcho_mi_perezhivaiemo_za_nauku	5	f	t	Підтримка науки бізнесом, Гранти і стипендії для науковців, Підтримка молодих науковців		\N		35	17
\.


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 201
-- Name: forms_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.forms_field_id_seq', 47, true);


--
-- TOC entry 2402 (class 0 OID 16562)
-- Dependencies: 204
-- Data for Name: forms_fieldentry; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.forms_fieldentry (id, field_id, value, entry_id) FROM stdin;
\.


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 203
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.forms_fieldentry_id_seq', 3, true);


--
-- TOC entry 2404 (class 0 OID 16573)
-- Dependencies: 206
-- Data for Name: forms_form; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.forms_form (id, title, slug, intro, button_text, response, redirect_url, status, publish_date, expiry_date, login_required, send_email, email_from, email_copies, email_subject, email_message) FROM stdin;
17	Форма опитування	questions		Завершити		\N	2	\N	\N	f	t				
\.


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 205
-- Name: forms_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.forms_form_id_seq', 17, true);


--
-- TOC entry 2406 (class 0 OID 16586)
-- Dependencies: 208
-- Data for Name: forms_form_sites; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.forms_form_sites (id, form_id, site_id) FROM stdin;
17	17	1
\.


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 207
-- Name: forms_form_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.forms_form_sites_id_seq', 17, true);


--
-- TOC entry 2408 (class 0 OID 16594)
-- Dependencies: 210
-- Data for Name: forms_formentry; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.forms_formentry (id, entry_time, form_id) FROM stdin;
\.


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 209
-- Name: forms_formentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.forms_formentry_id_seq', 1, true);


--
-- TOC entry 2417 (class 0 OID 16702)
-- Dependencies: 219
-- Data for Name: questionnaire_demo_model; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.questionnaire_demo_model (id, "Title", "Name_id", "Condition", "Author", "Weapon") FROM stdin;
1	Some text	1	cond_one	Author	sec_two
2	one more title	1	cond_three	Author	sec_one
\.


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 218
-- Name: questionnaire_demo_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.questionnaire_demo_model_id_seq', 2, true);


--
-- TOC entry 2174 (class 2606 OID 16424)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2179 (class 2606 OID 16479)
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2182 (class 2606 OID 16432)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 16422)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2169 (class 2606 OID 16465)
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2171 (class 2606 OID 16414)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2190 (class 2606 OID 16450)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2193 (class 2606 OID 16494)
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2184 (class 2606 OID 16440)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2196 (class 2606 OID 16458)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2199 (class 2606 OID 16508)
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2187 (class 2606 OID 16536)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2237 (class 2606 OID 16659)
-- Name: demo_post_demo_fun_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.demo_post_demo_fun
    ADD CONSTRAINT demo_post_demo_fun_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 16676)
-- Name: demo_post_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.demo_post
    ADD CONSTRAINT demo_post_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 16693)
-- Name: demo_pub_howareyou_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.demo_pub_howareyou
    ADD CONSTRAINT demo_pub_howareyou_pkey PRIMARY KEY (id);


--
-- TOC entry 2202 (class 2606 OID 16522)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 16406)
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2166 (class 2606 OID 16404)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 16396)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2233 (class 2606 OID 16642)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2206 (class 2606 OID 16646)
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- TOC entry 2208 (class 2606 OID 16548)
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- TOC entry 2211 (class 2606 OID 16559)
-- Name: forms_field_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_field
    ADD CONSTRAINT forms_field_pkey PRIMARY KEY (id);


--
-- TOC entry 2216 (class 2606 OID 16570)
-- Name: forms_fieldentry_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 16581)
-- Name: forms_form_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_form
    ADD CONSTRAINT forms_form_pkey PRIMARY KEY (id);


--
-- TOC entry 2224 (class 2606 OID 16614)
-- Name: forms_form_sites_form_id_site_id_4315a00a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_form_sites
    ADD CONSTRAINT forms_form_sites_form_id_site_id_4315a00a_uniq UNIQUE (form_id, site_id);


--
-- TOC entry 2226 (class 2606 OID 16591)
-- Name: forms_form_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_form_sites
    ADD CONSTRAINT forms_form_sites_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 16583)
-- Name: forms_form_slug_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_form
    ADD CONSTRAINT forms_form_slug_key UNIQUE (slug);


--
-- TOC entry 2230 (class 2606 OID 16599)
-- Name: forms_formentry_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_formentry
    ADD CONSTRAINT forms_formentry_pkey PRIMARY KEY (id);


--
-- TOC entry 2246 (class 2606 OID 16710)
-- Name: questionnaire_demo_model_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.questionnaire_demo_model
    ADD CONSTRAINT questionnaire_demo_model_pkey PRIMARY KEY (id);


--
-- TOC entry 2172 (class 1259 OID 16467)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2177 (class 1259 OID 16480)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2180 (class 1259 OID 16481)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2167 (class 1259 OID 16466)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2188 (class 1259 OID 16496)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2191 (class 1259 OID 16495)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2194 (class 1259 OID 16510)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2197 (class 1259 OID 16509)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2185 (class 1259 OID 16537)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2238 (class 1259 OID 16682)
-- Name: demo_post_author_id_4e90d0ab; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX demo_post_author_id_4e90d0ab ON public.demo_post USING btree (author_id);


--
-- TOC entry 2235 (class 1259 OID 16665)
-- Name: demo_post_demo_fun_Name_id_c3deab38; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "demo_post_demo_fun_Name_id_c3deab38" ON public.demo_post_demo_fun USING btree ("Name_id");


--
-- TOC entry 2241 (class 1259 OID 16699)
-- Name: demo_pub_howareyou_Name_id_7b441444; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "demo_pub_howareyou_Name_id_7b441444" ON public.demo_pub_howareyou USING btree ("Name_id");


--
-- TOC entry 2200 (class 1259 OID 16533)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2203 (class 1259 OID 16534)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2231 (class 1259 OID 16644)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2234 (class 1259 OID 16643)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2204 (class 1259 OID 16647)
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- TOC entry 2209 (class 1259 OID 16629)
-- Name: forms_field_form_id_9ca5dc7e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX forms_field_form_id_9ca5dc7e ON public.forms_field USING btree (form_id);


--
-- TOC entry 2212 (class 1259 OID 16739)
-- Name: forms_field_slug_9980e165; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX forms_field_slug_9980e165 ON public.forms_field USING btree (slug);


--
-- TOC entry 2213 (class 1259 OID 16738)
-- Name: forms_field_slug_9980e165_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX forms_field_slug_9980e165_like ON public.forms_field USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2214 (class 1259 OID 16623)
-- Name: forms_fieldentry_entry_id_c4fdc570; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX forms_fieldentry_entry_id_c4fdc570 ON public.forms_fieldentry USING btree (entry_id);


--
-- TOC entry 2222 (class 1259 OID 16615)
-- Name: forms_form_sites_form_id_eae2ae5a; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX forms_form_sites_form_id_eae2ae5a ON public.forms_form_sites USING btree (form_id);


--
-- TOC entry 2227 (class 1259 OID 16616)
-- Name: forms_form_sites_site_id_25b7859e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX forms_form_sites_site_id_25b7859e ON public.forms_form_sites USING btree (site_id);


--
-- TOC entry 2219 (class 1259 OID 16602)
-- Name: forms_form_slug_5f6d63a6_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX forms_form_slug_5f6d63a6_like ON public.forms_form USING btree (slug varchar_pattern_ops);


--
-- TOC entry 2228 (class 1259 OID 16622)
-- Name: forms_formentry_form_id_d0f23912; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX forms_formentry_form_id_d0f23912 ON public.forms_formentry USING btree (form_id);


--
-- TOC entry 2244 (class 1259 OID 16716)
-- Name: questionnaire_demo_model_Name_id_e691348d; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "questionnaire_demo_model_Name_id_e691348d" ON public.questionnaire_demo_model USING btree ("Name_id");


--
-- TOC entry 2249 (class 2606 OID 16473)
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2248 (class 2606 OID 16468)
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2247 (class 2606 OID 16459)
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2251 (class 2606 OID 16488)
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2250 (class 2606 OID 16483)
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2253 (class 2606 OID 16502)
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2252 (class 2606 OID 16497)
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2262 (class 2606 OID 16677)
-- Name: demo_post_author_id_4e90d0ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.demo_post
    ADD CONSTRAINT demo_post_author_id_4e90d0ab_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2261 (class 2606 OID 16660)
-- Name: demo_post_demo_fun_Name_id_c3deab38_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.demo_post_demo_fun
    ADD CONSTRAINT "demo_post_demo_fun_Name_id_c3deab38_fk_auth_user_id" FOREIGN KEY ("Name_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2263 (class 2606 OID 16694)
-- Name: demo_pub_howareyou_Name_id_7b441444_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.demo_pub_howareyou
    ADD CONSTRAINT "demo_pub_howareyou_Name_id_7b441444_fk_auth_user_id" FOREIGN KEY ("Name_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2254 (class 2606 OID 16523)
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2255 (class 2606 OID 16528)
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2256 (class 2606 OID 16630)
-- Name: forms_field_form_id_9ca5dc7e_fk_forms_form_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_field
    ADD CONSTRAINT forms_field_form_id_9ca5dc7e_fk_forms_form_id FOREIGN KEY (form_id) REFERENCES public.forms_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2257 (class 2606 OID 16624)
-- Name: forms_fieldentry_entry_id_c4fdc570_fk_forms_formentry_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_entry_id_c4fdc570_fk_forms_formentry_id FOREIGN KEY (entry_id) REFERENCES public.forms_formentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2258 (class 2606 OID 16603)
-- Name: forms_form_sites_form_id_eae2ae5a_fk_forms_form_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_form_sites
    ADD CONSTRAINT forms_form_sites_form_id_eae2ae5a_fk_forms_form_id FOREIGN KEY (form_id) REFERENCES public.forms_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2259 (class 2606 OID 16608)
-- Name: forms_form_sites_site_id_25b7859e_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_form_sites
    ADD CONSTRAINT forms_form_sites_site_id_25b7859e_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2260 (class 2606 OID 16617)
-- Name: forms_formentry_form_id_d0f23912_fk_forms_form_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.forms_formentry
    ADD CONSTRAINT forms_formentry_form_id_d0f23912_fk_forms_form_id FOREIGN KEY (form_id) REFERENCES public.forms_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2264 (class 2606 OID 16711)
-- Name: questionnaire_demo_model_Name_id_e691348d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.questionnaire_demo_model
    ADD CONSTRAINT "questionnaire_demo_model_Name_id_e691348d_fk_auth_user_id" FOREIGN KEY ("Name_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-12-29 11:54:01 EET

--
-- PostgreSQL database dump complete
--

