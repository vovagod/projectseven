--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
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
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
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
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
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
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
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
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
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
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
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
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
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
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: base_base; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.base_base (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    slug character varying(50) NOT NULL,
    subtitle character varying(120) NOT NULL,
    sentence character varying(120) NOT NULL,
    description text NOT NULL,
    desc_html text NOT NULL,
    image character varying(100),
    filenum smallint NOT NULL,
    urllink character varying(200) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    flag boolean NOT NULL,
    data1 character varying(50) NOT NULL,
    data2 character varying(50) NOT NULL,
    data3 character varying(50) NOT NULL,
    data4 character varying(50) NOT NULL,
    menu_id character varying(120) NOT NULL,
    CONSTRAINT base_base_filenum_check CHECK ((filenum >= 0))
);


ALTER TABLE public.base_base OWNER TO admin;

--
-- Name: base_base_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.base_base_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_base_id_seq OWNER TO admin;

--
-- Name: base_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.base_base_id_seq OWNED BY public.base_base.id;


--
-- Name: base_image; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.base_image (
    id integer NOT NULL,
    image character varying(100),
    slug character varying(50) NOT NULL,
    title character varying(120) NOT NULL,
    sentence character varying(120) NOT NULL,
    urllink character varying(200) NOT NULL,
    description text NOT NULL,
    desc_html text NOT NULL,
    data1 character varying(50) NOT NULL,
    data2 character varying(50) NOT NULL,
    name_id integer
);


ALTER TABLE public.base_image OWNER TO admin;

--
-- Name: base_image_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.base_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_image_id_seq OWNER TO admin;

--
-- Name: base_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.base_image_id_seq OWNED BY public.base_image.id;


--
-- Name: base_menu; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.base_menu (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    slug character varying(120) NOT NULL,
    mark smallint,
    fafa character varying(50) NOT NULL,
    color character varying(50) NOT NULL,
    CONSTRAINT base_menu_mark_check CHECK ((mark >= 0))
);


ALTER TABLE public.base_menu OWNER TO admin;

--
-- Name: base_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.base_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_menu_id_seq OWNER TO admin;

--
-- Name: base_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.base_menu_id_seq OWNED BY public.base_menu.id;


--
-- Name: base_submenu; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.base_submenu (
    id integer NOT NULL,
    subtitle character varying(120) NOT NULL,
    subslug character varying(120) NOT NULL,
    submark smallint,
    subfafa character varying(50) NOT NULL,
    subcolor character varying(50) NOT NULL,
    submenu_id character varying(120) NOT NULL,
    CONSTRAINT base_submenu_submark_check CHECK ((submark >= 0))
);


ALTER TABLE public.base_submenu OWNER TO admin;

--
-- Name: base_submenu_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.base_submenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_submenu_id_seq OWNER TO admin;

--
-- Name: base_submenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.base_submenu_id_seq OWNED BY public.base_submenu.id;


--
-- Name: clients_clients; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.clients_clients (
    uuid uuid NOT NULL,
    company character varying(120) NOT NULL,
    slug character varying(50) NOT NULL,
    country character varying(120) NOT NULL,
    address character varying(240) NOT NULL,
    email character varying(120) NOT NULL,
    email2 character varying(120),
    phone character varying(120) NOT NULL,
    about text NOT NULL,
    area character varying(120) NOT NULL,
    category character varying(30) NOT NULL,
    language character varying(30) NOT NULL,
    persons character varying(120) NOT NULL,
    created timestamp with time zone NOT NULL,
    last_post timestamp with time zone,
    enable_mailing boolean NOT NULL,
    interested boolean NOT NULL,
    preorder boolean NOT NULL,
    counter smallint NOT NULL,
    count smallint NOT NULL,
    bid integer NOT NULL,
    error_mailing character varying(360) NOT NULL,
    file character varying(100),
    filepath character varying(120) NOT NULL,
    flag boolean NOT NULL,
    CONSTRAINT clients_clients_bid_check CHECK ((bid >= 0)),
    CONSTRAINT clients_clients_count_check CHECK ((count >= 0)),
    CONSTRAINT clients_clients_counter_check CHECK ((counter >= 0))
);


ALTER TABLE public.clients_clients OWNER TO admin;

--
-- Name: clients_importduplication; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.clients_importduplication (
    id integer NOT NULL,
    company character varying(120) NOT NULL,
    cause text NOT NULL,
    created timestamp with time zone NOT NULL,
    flag boolean NOT NULL
);


ALTER TABLE public.clients_importduplication OWNER TO admin;

--
-- Name: clients_importduplication_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.clients_importduplication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_importduplication_id_seq OWNER TO admin;

--
-- Name: clients_importduplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.clients_importduplication_id_seq OWNED BY public.clients_importduplication.id;


--
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
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
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
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
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
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Name: interaction_contact; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.interaction_contact (
    id integer NOT NULL,
    fullname character varying(120) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(120) NOT NULL,
    content character varying(500) NOT NULL,
    subject character varying(120) NOT NULL,
    ipaddr character varying(120) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    flag boolean NOT NULL
);


ALTER TABLE public.interaction_contact OWNER TO admin;

--
-- Name: interaction_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.interaction_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interaction_contact_id_seq OWNER TO admin;

--
-- Name: interaction_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.interaction_contact_id_seq OWNED BY public.interaction_contact.id;


--
-- Name: interaction_correspondence; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.interaction_correspondence (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(120) NOT NULL,
    content text NOT NULL,
    content_html text NOT NULL,
    theme character varying(120) NOT NULL,
    subject character varying(120) NOT NULL,
    feedback character varying(120) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    action boolean NOT NULL,
    flag boolean NOT NULL,
    person_id_id integer
);


ALTER TABLE public.interaction_correspondence OWNER TO admin;

--
-- Name: interaction_correspondence_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.interaction_correspondence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interaction_correspondence_id_seq OWNER TO admin;

--
-- Name: interaction_correspondence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.interaction_correspondence_id_seq OWNED BY public.interaction_correspondence.id;


--
-- Name: promotion_image; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.promotion_image (
    id integer NOT NULL,
    image character varying(100),
    slug character varying(50) NOT NULL,
    title character varying(120) NOT NULL,
    sentence character varying(120) NOT NULL,
    urllink character varying(200) NOT NULL,
    description text NOT NULL,
    desc_html text NOT NULL,
    data1 character varying(50) NOT NULL,
    data2 character varying(50) NOT NULL,
    name_id integer
);


ALTER TABLE public.promotion_image OWNER TO admin;

--
-- Name: promotion_image_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.promotion_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_image_id_seq OWNER TO admin;

--
-- Name: promotion_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.promotion_image_id_seq OWNED BY public.promotion_image.id;


--
-- Name: promotion_promotion; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.promotion_promotion (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    slug character varying(50) NOT NULL,
    subtitle character varying(120) NOT NULL,
    sentence character varying(120) NOT NULL,
    description text NOT NULL,
    desc_html text NOT NULL,
    image character varying(100),
    filenum smallint NOT NULL,
    urllink character varying(200) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    flag boolean NOT NULL,
    data1 character varying(50) NOT NULL,
    data2 character varying(50) NOT NULL,
    data3 character varying(50) NOT NULL,
    data4 character varying(50) NOT NULL,
    category character varying(30) NOT NULL,
    language character varying(30) NOT NULL,
    CONSTRAINT promotion_promotion_filenum_check CHECK ((filenum >= 0))
);


ALTER TABLE public.promotion_promotion OWNER TO admin;

--
-- Name: promotion_promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.promotion_promotion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_promotion_id_seq OWNER TO admin;

--
-- Name: promotion_promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.promotion_promotion_id_seq OWNED BY public.promotion_promotion.id;


--
-- Name: scheduler_scheduler; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.scheduler_scheduler (
    id integer NOT NULL,
    category character varying(30) NOT NULL,
    tick smallint,
    counter smallint,
    event character varying(120),
    processing character varying(120),
    CONSTRAINT scheduler_scheduler_counter_check CHECK ((counter >= 0)),
    CONSTRAINT scheduler_scheduler_tick_check CHECK ((tick >= 0))
);


ALTER TABLE public.scheduler_scheduler OWNER TO admin;

--
-- Name: scheduler_scheduler_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.scheduler_scheduler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scheduler_scheduler_id_seq OWNER TO admin;

--
-- Name: scheduler_scheduler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.scheduler_scheduler_id_seq OWNED BY public.scheduler_scheduler.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_base ALTER COLUMN id SET DEFAULT nextval('public.base_base_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_image ALTER COLUMN id SET DEFAULT nextval('public.base_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_menu ALTER COLUMN id SET DEFAULT nextval('public.base_menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_submenu ALTER COLUMN id SET DEFAULT nextval('public.base_submenu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.clients_importduplication ALTER COLUMN id SET DEFAULT nextval('public.clients_importduplication_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.interaction_contact ALTER COLUMN id SET DEFAULT nextval('public.interaction_contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.interaction_correspondence ALTER COLUMN id SET DEFAULT nextval('public.interaction_correspondence_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.promotion_image ALTER COLUMN id SET DEFAULT nextval('public.promotion_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.promotion_promotion ALTER COLUMN id SET DEFAULT nextval('public.promotion_promotion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scheduler_scheduler ALTER COLUMN id SET DEFAULT nextval('public.scheduler_scheduler_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add user	2	add_user
5	Can change user	2	change_user
6	Can delete user	2	delete_user
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Page content	7	add_base
20	Can change Page content	7	change_base
21	Can delete Page content	7	delete_base
22	Can add Horizontal menu	8	add_menu
23	Can change Horizontal menu	8	change_menu
24	Can delete Horizontal menu	8	delete_menu
25	Can add Additional images	9	add_image
26	Can change Additional images	9	change_image
27	Can delete Additional images	9	delete_image
28	Can add Vertical submenu	10	add_submenu
29	Can change Vertical submenu	10	change_submenu
30	Can delete Vertical submenu	10	delete_submenu
31	Can add Forwarded correspondence	11	add_correspondence
32	Can change Forwarded correspondence	11	change_correspondence
33	Can delete Forwarded correspondence	11	delete_correspondence
34	Can add Incoming messages	12	add_contact
35	Can change Incoming messages	12	change_contact
36	Can delete Incoming messages	12	delete_contact
37	Can add Clients	13	add_clients
38	Can change Clients	13	change_clients
39	Can delete Clients	13	delete_clients
40	Can add ImportDuplication	14	add_importduplication
41	Can change ImportDuplication	14	change_importduplication
42	Can delete ImportDuplication	14	delete_importduplication
43	Can add Promotion	15	add_promotion
44	Can change Promotion	15	change_promotion
45	Can delete Promotion	15	delete_promotion
46	Can add Additional image	16	add_image
47	Can change Additional image	16	change_image
48	Can delete Additional image	16	delete_image
49	Can add Scheduler	17	add_scheduler
50	Can change Scheduler	17	change_scheduler
51	Can delete Scheduler	17	delete_scheduler
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 51, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$KOlh8fVDRyhH$f0XP0dXDBsMZe07oPsgACSSsivOtzaAbjel7IaHhGq4=	2019-12-29 21:25:06.413797+03	t	admin			gva008@gmail.com	t	t	2019-12-29 21:24:24.667764+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: base_base; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.base_base (id, title, slug, subtitle, sentence, description, desc_html, image, filenum, urllink, "timestamp", flag, data1, data2, data3, data4, menu_id) FROM stdin;
1	Сервер Comaex	slider			Супервизор для \r\nсистем HVAC, умного\r\nдома и интернета объектов	<p>Супервизор для \nсистем HVAC, умного\nдома и интернета объектов</p>	slider/slider_1_sSpCWMv.jpg	0	http://127.0.0.1:8000/home/#about	2019-12-29 21:43:38.429886+03	t	#4E4E4E	inherit	inherit	blue	Слайдер
2	Comaex для инженерных систем	slider			Супервизорский \r\nконтроль и управление\r\nинженерным оборудованием	<p>Супервизорский \nконтроль и управление\nинженерным оборудованием</p>	slider/slider_2.jpg	0	http://127.0.0.1:8000/home/#application1	2019-12-29 21:47:16.053001+03	t	blue	white	#4A5970	blue	Слайдер
3	Comaex для Умного Дома	slider			Контроль \r\nза безопасностью, климатом \r\nи инженерными системами жилища	<p>Контроль \nза безопасностью, климатом \nи инженерными системами жилища</p>	slider/slider_3.jpg	0	http://127.0.0.1:8000/home/#application2	2019-12-29 21:48:59.95746+03	t	blue	white	#84756E	blue	Слайдер
4	Comaex для Интернета объектов	slider			Хаб для \r\nдатчиков и счетчиков	<p>Хаб для \nдатчиков и счетчиков</p>	slider/slider_4.jpg	0	http://127.0.0.1:8000/home/#application3	2019-12-29 21:50:35.222762+03	t	white	white	#000324		Слайдер
5	Супервизор-сервер Comaex	o-comaex			&emsp;Сервер Comaex - система контроля и управления уровня супервизор  для систем HVAC, умного дома и интернета объектов. Представляет собой <a onclick="document.getElementById('id01').style.display='block'" style="color:red; cursor: pointer;">компактное устройство</a>,  предназначенное для подключения к контроллерам:<ul style="font-style: italic;"><li> управления светом;</li><li>управления различными приводами - жалюзи или замков к примеру;</li><li>передачи данных с разнообразных датчиков – движения, температуры, влажности, давления и т.п.;</li><li>передачи информации со счетчиков ресурсов – воды, газа, электроэнергии;</li><li>управления сложным инженерным оборудованием – вентмашинами, тепловыми пунктами, бойлерами и другим устройствам с микропроцессорным управлением.</li></ul>&emsp;Обмен данными с контроллерами происходит по протоколу Modbus RTU, к устройствам контроля сервер может подключаться посредством кабеля или беспроводным способом - с помощью <a onclick="document.getElementById('id02').style.display='block'" style="color:red; cursor: pointer;">радиомодуля</a>. <br><p>&emsp;Ввод параметров конфигурации устройств объекта производится вручную через панель администратора либо загрузкой специального xls-файла. Данный файл является шаблоном ввода данных и позволяет в считанные минуты запустить супервизор-сервер в работу. Вместе с файлом конфигурации вносятся мнемосхемы объектов для создания страниц визуализации. После ввода этих данных формируется автоматический интерфейс управления объекта и сервер готов к работе.<br>\r\n&emsp;Интерфейс управления становится доступен на компьютере, смартфоне либо планшете. При этом возможна работа устройства, как в локальной Wi-Fi сети объекта, так и с глобального Интернета.<br>\r\n&emsp;Сервер имеет производительность до 1000 точек данных и до 20 слейв-устройств, что более чем достаточно для большинства объектов. Помотреть реальный образец в работе можно тут: <a href="http://comaex.ddns.net" style="color:red; cursor:pointer;" target="_blank">Comaex Demo</a>. Если у вас нет данных входа, запросите их через<a href="#contact" style="color:red; cursor: pointer;"> Контакты</a>.</p>	<p>&emsp;Сервер Comaex - система контроля и управления уровня супервизор  для систем HVAC, умного дома и интернета объектов. Представляет собой <a onclick="document.getElementById('id01').style.display='block'" style="color:red; cursor: pointer;">компактное устройство</a>,  предназначенное для подключения к контроллерам:<ul style="font-style: italic;"><li> управления светом;</li><li>управления различными приводами - жалюзи или замков к примеру;</li><li>передачи данных с разнообразных датчиков – движения, температуры, влажности, давления и т.п.;</li><li>передачи информации со счетчиков ресурсов – воды, газа, электроэнергии;</li><li>управления сложным инженерным оборудованием – вентмашинами, тепловыми пунктами, бойлерами и другим устройствам с микропроцессорным управлением.</li></ul>&emsp;Обмен данными с контроллерами происходит по протоколу Modbus RTU, к устройствам контроля сервер может подключаться посредством кабеля или беспроводным способом - с помощью <a onclick="document.getElementById('id02').style.display='block'" style="color:red; cursor: pointer;">радиомодуля</a>. <br><p>&emsp;Ввод параметров конфигурации устройств объекта производится вручную через панель администратора либо загрузкой специального xls-файла. Данный файл является шаблоном ввода данных и позволяет в считанные минуты запустить супервизор-сервер в работу. Вместе с файлом конфигурации вносятся мнемосхемы объектов для создания страниц визуализации. После ввода этих данных формируется автоматический интерфейс управления объекта и сервер готов к работе.<br>\n&emsp;Интерфейс управления становится доступен на компьютере, смартфоне либо планшете. При этом возможна работа устройства, как в локальной Wi-Fi сети объекта, так и с глобального Интернета.<br>\n&emsp;Сервер имеет производительность до 1000 точек данных и до 20 слейв-устройств, что более чем достаточно для большинства объектов. Помотреть реальный образец в работе можно тут: <a href="http://comaex.ddns.net" style="color:red; cursor:pointer;" target="_blank">Comaex Demo</a>. Если у вас нет данных входа, запросите их через<a href="#contact" style="color:red; cursor: pointer;"> Контакты</a>.</p></p>	no_image.png	0		2019-12-29 21:54:39.847991+03	f					О Comaex
6	Функциональные возможности	funkcional			&emsp;Comaex обладает полным набором супервизорских функций, таких как:  контроль, управление, запись, визуализация, сигнализация, отчеты.<br>\r\n&emsp;Функция <a href="#control" style="color:red; cursor: pointer;">Контроль</a> отвечает за получение данных, таких как температура, давление и т.п. с удаленных устройств и отображение их на экране интерфейса. Другой важной частью контроля есть получение сигналов <a href="#alarms" style="color:red; cursor: pointer;">Аварий</a> или <a href="#events" style="color:red; cursor: pointer;">Событий</a> произошедших с устройствами объекта.     \r\n&emsp;Функция <a href="#management" style="color:red; cursor: pointer;">Управление</a> осуществляет передачу управляющих сигналов, к примеру включить-выключить, а также данных в виде <a href="#setpoint" style="color:red; cursor: pointer;">Уставок</a>, к примеру установить температуру помещения.<br>\r\n&emsp;Помимо обмена данными с устройствами, сервер производит запись информации. Это разделы <a href="#charts" style="color:red; cursor: pointer;">Графики</a> и <a href="#events" style="color:red; cursor: pointer;">Архив событий</a> интерфейса. В разделе Графики выводится информация с датчиков контроля, а в разделе Архив событий осуществляется запись событий объекта контроля. Вся записанная информация может быть выведена на печать в PDF-формате.<br>\r\n&emsp;Следующей важной функцией интерфейса есть раздел <a href="#visualization" style="color:red; cursor: pointer;">Визуализация</a>, где представлена мнемосхема устройства или объекта, на которую выводится вся информация контроля и элементы управления объекта. Это наглядная и удобная функция для мгновенной оценки состояния объекта.<br>\r\n&emsp;Для просмотра всех устройств и всех их параметров существует раздел <a href="#all" style="color:red; cursor: pointer;">ВСЕ</a> расположенный в первой строчке левого меню.<br>\r\n&emsp;И наконец, функция Сигнализация проинформирует о чрезвычайном событии на почту или СМС-сообщением на мобильный телефон. Это может быть любое событие, о котором надо знать незамедлительно, чтобы вовремя принять меры.<br>\r\n&emsp;Ниже представлено описание каждого функционального состояния и показаны скриншоты экранов интерфейса:	<p>&emsp;Comaex обладает полным набором супервизорских функций, таких как:  контроль, управление, запись, визуализация, сигнализация, отчеты.<br>\n&emsp;Функция <a href="#control" style="color:red; cursor: pointer;">Контроль</a> отвечает за получение данных, таких как температура, давление и т.п. с удаленных устройств и отображение их на экране интерфейса. Другой важной частью контроля есть получение сигналов <a href="#alarms" style="color:red; cursor: pointer;">Аварий</a> или <a href="#events" style="color:red; cursor: pointer;">Событий</a> произошедших с устройствами объекта.   <br />\n&emsp;Функция <a href="#management" style="color:red; cursor: pointer;">Управление</a> осуществляет передачу управляющих сигналов, к примеру включить-выключить, а также данных в виде <a href="#setpoint" style="color:red; cursor: pointer;">Уставок</a>, к примеру установить температуру помещения.<br>\n&emsp;Помимо обмена данными с устройствами, сервер производит запись информации. Это разделы <a href="#charts" style="color:red; cursor: pointer;">Графики</a> и <a href="#events" style="color:red; cursor: pointer;">Архив событий</a> интерфейса. В разделе Графики выводится информация с датчиков контроля, а в разделе Архив событий осуществляется запись событий объекта контроля. Вся записанная информация может быть выведена на печать в PDF-формате.<br>\n&emsp;Следующей важной функцией интерфейса есть раздел <a href="#visualization" style="color:red; cursor: pointer;">Визуализация</a>, где представлена мнемосхема устройства или объекта, на которую выводится вся информация контроля и элементы управления объекта. Это наглядная и удобная функция для мгновенной оценки состояния объекта.<br>\n&emsp;Для просмотра всех устройств и всех их параметров существует раздел <a href="#all" style="color:red; cursor: pointer;">ВСЕ</a> расположенный в первой строчке левого меню.<br>\n&emsp;И наконец, функция Сигнализация проинформирует о чрезвычайном событии на почту или СМС-сообщением на мобильный телефон. Это может быть любое событие, о котором надо знать незамедлительно, чтобы вовремя принять меры.<br>\n&emsp;Ниже представлено описание каждого функционального состояния и показаны скриншоты экранов интерфейса:</p>	no_image.png	0		2019-12-29 22:11:43.279368+03	f					Функционал
7	Контроль	control	Раздел Контроль	Пример экрана объекта "Партер"	&emsp;Знакомство с интерфейсом сервера Comaex начнем на примере страницы «Контроль». В левой стороне экрана распологается меню, где первой строкой есть ссылка на страницу «ВСЕ», на которой выводятся все наблюдаемые параметры всех устройств. Ниже следует список категорий объектов, которые объединяют наблюдаемые сервером устройства. Цветные кружочки, слева от устройств/объектов показывают их актуальное состояние: зеленый – нет аварий, желтый – предупреждение, красный – авария.\r\n&emsp;Кликнув на вкладку «Контроль» происходит переход на указанную страницу, на которой выводится таблица значений контролируемых параметров. Обновление информации происходит с интервалом 2-5 секунд.	<p>&emsp;Знакомство с интерфейсом сервера Comaex начнем на примере страницы «Контроль». В левой стороне экрана распологается меню, где первой строкой есть ссылка на страницу «ВСЕ», на которой выводятся все наблюдаемые параметры всех устройств. Ниже следует список категорий объектов, которые объединяют наблюдаемые сервером устройства. Цветные кружочки, слева от устройств/объектов показывают их актуальное состояние: зеленый – нет аварий, желтый – предупреждение, красный – авария.\n&emsp;Кликнув на вкладку «Контроль» происходит переход на указанную страницу, на которой выводится таблица значений контролируемых параметров. Обновление информации происходит с интервалом 2-5 секунд.</p>	control/control_2_3915sGE.jpg	0		2019-12-29 22:13:43.224576+03	f	blue		fa fa-thermometer-full		Функционал картинки
8	Управление	management	Раздел Управление	Пример экрана объекта "Рекуператор"	&emsp;Выбрав в левом меню нужное устройство и кликнув по вкладке «Управление» происходит переход на эту страницу. Здесь можно послать выбранную команду на устройство «Рекуператор» (выделено синим в меню устройств) кликнув по полю «Изменить».\r\n&emsp;После подтвержденной отправки команды состояние изменится на противоположное.	<p>&emsp;Выбрав в левом меню нужное устройство и кликнув по вкладке «Управление» происходит переход на эту страницу. Здесь можно послать выбранную команду на устройство «Рекуператор» (выделено синим в меню устройств) кликнув по полю «Изменить».\n&emsp;После подтвержденной отправки команды состояние изменится на противоположное.</p>	management/management_1_69n3T2i.jpg	0		2019-12-29 22:15:30.502953+03	f	blue		fa fa-toggle-on		Функционал картинки
9	Уставки	setpoint	Раздел Уставки	Пример экрана объекта "Партер"	&emsp;Страница «Уставки» предназначена для изменения параметров, которые необходимо внести в выбранное устройство. Дополнительно страница содержит селектор выбора шага изменения значения – «интервал счета».\r\n&emsp;После введения нового значения необходимо его подтвердить, кликнув по полю «подтвердить».	<p>&emsp;Страница «Уставки» предназначена для изменения параметров, которые необходимо внести в выбранное устройство. Дополнительно страница содержит селектор выбора шага изменения значения – «интервал счета».\n&emsp;После введения нового значения необходимо его подтвердить, кликнув по полю «подтвердить».</p>	setpoint/setpoints_1_FFk9bLx.jpg	0		2019-12-29 22:17:24.927729+03	f	blue		fa fa-sliders		Функционал картинки
10	Аварии	alarms	Раздел Аварии	Пример экрана объекта "Рекуператор"	&emsp; Кликнув по вкладке «Аварии» происходит переход на данную страницу. Здесь выводится список аварий по выбранному устройству/объекту. Их состояния обновляются с интервалом 2 секунды.	<p>&emsp; Кликнув по вкладке «Аварии» происходит переход на данную страницу. Здесь выводится список аварий по выбранному устройству/объекту. Их состояния обновляются с интервалом 2 секунды.</p>	alarms/alarms_1_wI9xzcQ.jpg	0		2019-12-29 22:19:07.115205+03	f	blue		fa fa-bell-o		Функционал картинки
11	Графики	charts	Раздел Графики	Пример экрана объекта "Рекуператор". Режим стандартного вывода.	&emsp;Страница «Графики» отображает график выбранного параметра устройства/объекта. Страница имеет обширный интерфейс в виде многочисленных настроек и опций.\r\n&emsp;На данном скриншоте показан стандартный вывод графика параметра «Темература подачи, С»  виде линии, 20 точек данных с интервалом 10 секунд.	<p>&emsp;Страница «Графики» отображает график выбранного параметра устройства/объекта. Страница имеет обширный интерфейс в виде многочисленных настроек и опций.\n&emsp;На данном скриншоте показан стандартный вывод графика параметра «Темература подачи, С»  виде линии, 20 точек данных с интервалом 10 секунд.</p>	charts/charts_1_tedAfRK.jpg	0		2019-12-29 22:22:28.81159+03	f	blue		fa fa-area-chart		Функционал картинки
12	Архив событий	events	Раздел Архив событий	Пример экрана объекта "Рекуператор".	&emsp;Страница «Архив событий» показывает аварии и события, произошедшие с выбранным объектом/устройством. Аварии обозначаются первыми буквами индекса «AL», события - «EV». Показанная на экране страница может быть распечатана, для чего необходимо кликнуть кнопку «PDF».	<p>&emsp;Страница «Архив событий» показывает аварии и события, произошедшие с выбранным объектом/устройством. Аварии обозначаются первыми буквами индекса «AL», события - «EV». Показанная на экране страница может быть распечатана, для чего необходимо кликнуть кнопку «PDF».</p>	events/events_1_JUWjdBK.jpg	0		2019-12-29 22:25:54.711739+03	f	blue		fa fa-archive		Функционал картинки
13	Визуализация	visualization	Раздел Визуализация	Пример экрана объекта "Рекуператор".	&emsp;Страница «Визуализация» выводит схематическое изображение устройства/объекта со всеми необходимыми значениями и состояниями. Такая обобщенная информация очень удобна для наблюдения и отладки. Ниже поля изображения располагается область аварий - где в случае аварии появляется соответствующее сообщение, далее следует поле управления – здесь можно включить/выключить какое-либо состояние, и наконец, замыкает страницу поле уставок – здесь можно послать на устройство команду с новым значением.	<p>&emsp;Страница «Визуализация» выводит схематическое изображение устройства/объекта со всеми необходимыми значениями и состояниями. Такая обобщенная информация очень удобна для наблюдения и отладки. Ниже поля изображения располагается область аварий - где в случае аварии появляется соответствующее сообщение, далее следует поле управления – здесь можно включить/выключить какое-либо состояние, и наконец, замыкает страницу поле уставок – здесь можно послать на устройство команду с новым значением.</p>	visualization/vizualization_1_evAeuCU.jpg	0		2019-12-29 22:28:12.90622+03	f	blue		fa fa-eye		Функционал картинки
14	ВСЕ	all	Раздел ВСЕ		&emsp;Страница «ВСЕ» выводит полный список всех устройств/объектов в виде таблицы параметров всех значений и состояний. Порядок вывода категорий и их объектов/устройств соответствует порядку меню. Интервал обновления данных – 2-5 секунд. \r\n&emsp;На данном скриншоте показано лишь начало страницы «ВСЕ».	<p>&emsp;Страница «ВСЕ» выводит полный список всех устройств/объектов в виде таблицы параметров всех значений и состояний. Порядок вывода категорий и их объектов/устройств соответствует порядку меню. Интервал обновления данных – 2-5 секунд. \n&emsp;На данном скриншоте показано лишь начало страницы «ВСЕ».</p>	all/all_1_G24eTdw.jpg	0		2019-12-29 23:17:52.925053+03	f	blue		fa fa-list-alt		Функционал картинки
15	Применение	primenenie			&emsp;Сервер Comaex является супервизорской системой, то есть  устройством, которое подключается к контроллерам управления оборудованием для осуществления надзорных функций и расширения их возможностей, среди которых:<ul style="font-style: italic;"> <li>удаленный контроль и управление устройствами, как в локальной зоне, так и далеко за ее пределами посредством интернета;</li><li>запись информации;</li><li>формирование отчетов;</li><li>сигнализация состояний;</li><li>визуализации объектов;</li><li>объединение устройств в группы и категории.</li></ul>&emsp;Преимуществами сервера Comaex есть его компактность, высокая производительность, низкая цена, простота обслуживания и быстрый ввод в эксплуатацию. \r\n&emsp;Помотреть реальный образец в работе можно тут: <a href="http://comaex.ddns.net" style="color:red; cursor:pointer;" target="_blank">Comaex Demo</a>. Если у вас нет данных входа, запросите их через<a href="#contact" style="color:red; cursor: pointer;"> Контакты</a>.\r\n&emsp;Наиболее распространенные области применения сервера Comaex:	<p>&emsp;Сервер Comaex является супервизорской системой, то есть  устройством, которое подключается к контроллерам управления оборудованием для осуществления надзорных функций и расширения их возможностей, среди которых:<ul style="font-style: italic;"> <li>удаленный контроль и управление устройствами, как в локальной зоне, так и далеко за ее пределами посредством интернета;</li><li>запись информации;</li><li>формирование отчетов;</li><li>сигнализация состояний;</li><li>визуализации объектов;</li><li>объединение устройств в группы и категории.</li></ul>&emsp;Преимуществами сервера Comaex есть его компактность, высокая производительность, низкая цена, простота обслуживания и быстрый ввод в эксплуатацию. \n&emsp;Помотреть реальный образец в работе можно тут: <a href="http://comaex.ddns.net" style="color:red; cursor:pointer;" target="_blank">Comaex Demo</a>. Если у вас нет данных входа, запросите их через<a href="#contact" style="color:red; cursor: pointer;"> Контакты</a>.\n&emsp;Наиболее распространенные области применения сервера Comaex:</p>	no_image.png	0		2019-12-29 23:19:16.756323+03	f					Применение
16	Системы HVAC	primenenie-kartinki			&emsp;Это направление климатических систем – отопление, вентиляция, кондиционирование. Очень востребованная область для применения супервизорских технологий, поскольку любой коммерческий или промышленный объект от подвала до крыши укомплектован HVAC оборудованием, которое необходимо контролировать. Данная технология называется диспетчеризацией объекта. Сервер Comaex прекрасно подходит для этой цели, поскольку любое HVAC оборудование имеет контроллеры управления со своим стандартным ПО, для множества которого у Comaex есть готовые шаблоны и мнемосхемы визуализаций.	<p>&emsp;Это направление климатических систем – отопление, вентиляция, кондиционирование. Очень востребованная область для применения супервизорских технологий, поскольку любой коммерческий или промышленный объект от подвала до крыши укомплектован HVAC оборудованием, которое необходимо контролировать. Данная технология называется диспетчеризацией объекта. Сервер Comaex прекрасно подходит для этой цели, поскольку любое HVAC оборудование имеет контроллеры управления со своим стандартным ПО, для множества которого у Comaex есть готовые шаблоны и мнемосхемы визуализаций.</p>	primenenie-kartinki/app1_QcYiWe7.jpg	0		2019-12-29 23:20:52.122706+03	f					Применение картинки
17	Умный дом	primenenie-kartinki			&emsp;Контроль за безопасностью, климатом и возможностью управлять инженерными системами жилища находит в последнее время все больший интерес. Сервер Comaex способен полностью обеспечить эту возможность, поскольку он может обмениваться данными с любыми контроллерами управления. Кроме того, готовые шаблоны конфигураций сложных устройств, таких как вентиляционное и отопительное оборудование, а также мнемосхемы для них уже имеются в репозиториях сервера. Это значительно облегчает и ускоряет создание умного дома.	<p>&emsp;Контроль за безопасностью, климатом и возможностью управлять инженерными системами жилища находит в последнее время все больший интерес. Сервер Comaex способен полностью обеспечить эту возможность, поскольку он может обмениваться данными с любыми контроллерами управления. Кроме того, готовые шаблоны конфигураций сложных устройств, таких как вентиляционное и отопительное оборудование, а также мнемосхемы для них уже имеются в репозиториях сервера. Это значительно облегчает и ускоряет создание умного дома.</p>	primenenie-kartinki/app2_1OJGDju.jpg	0		2019-12-29 23:21:52.676128+03	f					Применение картинки
18	Интернет объектов	primenenie-kartinki			&emsp;Новое направление в цифровом мире, где главной идеей есть обеспечение любого электронного устройства выходом в глобальный интернет. Технология находит практическое применение в областях получения данных от различных датчиков и счетчиков. Имеет большой потенциал роста, но сдерживается естественным препятствием в виде исчерпания IP адресов протокола ipv4. Поэтому передача данных на устройства IoT сопряжены со сложностями, так как для этого каждое устройство должно иметь свой индивидуальный IP адрес. Comaex может решить эту проблему, поскольку физически является хабом – он имеет один внешний IP адрес взаимодействующий с сотнями внутренних устройств в обоих направлениях.	<p>&emsp;Новое направление в цифровом мире, где главной идеей есть обеспечение любого электронного устройства выходом в глобальный интернет. Технология находит практическое применение в областях получения данных от различных датчиков и счетчиков. Имеет большой потенциал роста, но сдерживается естественным препятствием в виде исчерпания IP адресов протокола ipv4. Поэтому передача данных на устройства IoT сопряжены со сложностями, так как для этого каждое устройство должно иметь свой индивидуальный IP адрес. Comaex может решить эту проблему, поскольку физически является хабом – он имеет один внешний IP адрес взаимодействующий с сотнями внутренних устройств в обоих направлениях.</p>	primenenie-kartinki/app3_d68vTe1.jpg	0		2019-12-29 23:23:03.983282+03	f					Применение картинки
\.


--
-- Name: base_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.base_base_id_seq', 18, true);


--
-- Data for Name: base_image; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.base_image (id, image, slug, title, sentence, urllink, description, desc_html, data1, data2, name_id) FROM stdin;
1	o-comaex/Mini_PC_1.jpg	o-comaex	Супервизор-сервер Comaex	Технические характеристики:		<ul><li>Процессор: Intel Dual Core i5-4200Y</li><li>ОЗУ: RAM4GB</li><li>ПЗУ: SSD30GB</li><li>Интерфейс: 4*USB3.0, 2*USB2.0, 1000Mbps BaseT LAN, 802.11 b/g/n WiFi</li><li>Тип корпуса: алюминиевый теплоотводящий</li><li>Размеры: 133x124x40 мм</li></ul>	<ul><li>Процессор: Intel Dual Core i5-4200Y</li><li>ОЗУ: RAM4GB</li><li>ПЗУ: SSD30GB</li><li>Интерфейс: 4*USB3.0, 2*USB2.0, 1000Mbps BaseT LAN, 802.11 b/g/n WiFi</li><li>Тип корпуса: алюминиевый теплоотводящий</li><li>Размеры: 133x124x40 мм</li></ul>			5
2	o-comaex/E800_DTU_ajn8oDg.png	o-comaex	Радиомодуль E800-DTU	Технические характеристики:		<ul><li>Рабочая частота: 433 МГц</li><li>Мощность передатчика: 30 дБм</li><li>Скорость передачи: 1,2-115,2 кбит/сек</li><li>тип антенны: SMA-K</li><li>комм.интерфейс : RS232/RS485</li><li>дальность связи: 2500 м</li><li>размеры: 66х66х21 мм</li></ul>	<ul><li>Рабочая частота: 433 МГц</li><li>Мощность передатчика: 30 дБм</li><li>Скорость передачи: 1,2-115,2 кбит/сек</li><li>тип антенны: SMA-K</li><li>комм.интерфейс : RS232/RS485</li><li>дальность связи: 2500 м</li><li>размеры: 66х66х21 мм</li></ul>			5
3	charts/charts_2_upEd301.jpg	charts		Пример экрана объекта "Рекуператор". Режим вывода таблицы значений.		&emsp;На данном скриншоте показан вывод таблицы значений выбранного параметра. Вывод таблицы возможен как в статическом режиме так в динамическом режиме «REAL TIME».	<p>&emsp;На данном скриншоте показан вывод таблицы значений выбранного параметра. Вывод таблицы возможен как в статическом режиме так в динамическом режиме «REAL TIME».</p>			11
4	charts/charts_3_nzxeV5e.jpg	charts		Пример экрана объекта "Рекуператор". Режим наложения графиков.		&emsp;На этом скриншоте выведены три графика в режиме наложения друг на друга. К основному графику можно добавить  до 2-ух дополнительных параметров только при условии равных интервалов записи.	<p>&emsp;На этом скриншоте выведены три графика в режиме наложения друг на друга. К основному графику можно добавить  до 2-ух дополнительных параметров только при условии равных интервалов записи.</p>			11
5	visualization/vizualization_3_nXCz8sO.jpg	visualization		Пример экрана объекта "Партер".		&emsp;На этом скриншоте показан пример объекта «Партер» со следующим функционалом: \r\n&emsp;&emsp;- температура, влажность, счетчики электричества, газа, холодной и горячей воды (значение), \r\n&emsp;&emsp;- датчики движения, сенсоры дыма, огня (событие), \r\n&emsp;&emsp;- жалюзи, замки дверей, освещение (управление), \r\n&emsp;&emsp;- температура, влажность (уставки)	<p>&emsp;На этом скриншоте показан пример объекта «Партер» со следующим функционалом: \n&emsp;&emsp;- температура, влажность, счетчики электричества, газа, холодной и горячей воды (значение), \n&emsp;&emsp;- датчики движения, сенсоры дыма, огня (событие), \n&emsp;&emsp;- жалюзи, замки дверей, освещение (управление), \n&emsp;&emsp;- температура, влажность (уставки)</p>			13
\.


--
-- Name: base_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.base_image_id_seq', 5, true);


--
-- Data for Name: base_menu; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.base_menu (id, title, slug, mark, fafa, color) FROM stdin;
1	О Comaex	#about	0		
2	Функционал	#specification	0		
3	Применение	application	0		
4	Инфо	info	0		
\.


--
-- Name: base_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.base_menu_id_seq', 4, true);


--
-- Data for Name: base_submenu; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.base_submenu (id, subtitle, subslug, submark, subfafa, subcolor, submenu_id) FROM stdin;
1	Слайдер	#slider	0			О Comaex
2	О Comaex	#about	0			О Comaex
3	Функционал	#specification	0			Функционал
4	Функционал картинки	#specification_images	0			Функционал
5	Применение	#application	1			Применение
6	Применение картинки	#application_images	0			Применение
7	Портфолио	portfolio	0			Применение
8	Стоимость	price	0			Применение
9	Стоимость картинки	price_images	0			Применение
10	Контакты	#contact	1			Инфо
11	Новости	#news	0			Инфо
\.


--
-- Name: base_submenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.base_submenu_id_seq', 11, true);


--
-- Data for Name: clients_clients; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.clients_clients (uuid, company, slug, country, address, email, email2, phone, about, area, category, language, persons, created, last_post, enable_mailing, interested, preorder, counter, count, bid, error_mailing, file, filepath, flag) FROM stdin;
814a94bb-1a0f-461e-9a49-dd448d2d9518	Computer LTD	computer-ltd	Russia	Unknown	chim73@mail.ru	\N	+7(985)4828588		Manufacture	SFUGD	EN		2019-12-30 12:01:13.486253+03	2019-12-30 12:01:52.376227+03	t	f	f	1	0	0				f
\.


--
-- Data for Name: clients_importduplication; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.clients_importduplication (id, company, cause, created, flag) FROM stdin;
\.


--
-- Name: clients_importduplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.clients_importduplication_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-12-29 21:26:44.057389+03	1	О Comaex	1	[{"added": {}}]	8	1
2	2019-12-29 21:27:24.992261+03	2	Функционал	1	[{"added": {}}]	8	1
3	2019-12-29 21:27:56.189945+03	3	Применение	1	[{"added": {}}]	8	1
4	2019-12-29 21:28:34.218816+03	4	Инфо	1	[{"added": {}}]	8	1
5	2019-12-29 21:29:57.037996+03	1	Слайдер	1	[{"added": {}}]	10	1
6	2019-12-29 21:30:53.953286+03	2	О Comaex	1	[{"added": {}}]	10	1
7	2019-12-29 21:31:36.997802+03	3	Функционал	1	[{"added": {}}]	10	1
8	2019-12-29 21:32:14.82789+03	4	Функционал картинки	1	[{"added": {}}]	10	1
9	2019-12-29 21:33:09.280752+03	5	Применение	1	[{"added": {}}]	10	1
10	2019-12-29 21:33:49.65464+03	6	Применение картинки	1	[{"added": {}}]	10	1
11	2019-12-29 21:35:06.316403+03	7	Портфолио	1	[{"added": {}}]	10	1
12	2019-12-29 21:36:05.048704+03	8	Стоимость	1	[{"added": {}}]	10	1
13	2019-12-29 21:36:48.428478+03	9	Стоимость картинки	1	[{"added": {}}]	10	1
14	2019-12-29 21:37:47.486651+03	10	Контакты	1	[{"added": {}}]	10	1
15	2019-12-29 21:39:01.579206+03	11	Новости	1	[{"added": {}}]	10	1
16	2019-12-29 21:43:38.434775+03	1	Сервер Comaex	1	[{"added": {}}]	7	1
17	2019-12-29 21:47:16.054607+03	2	Comaex для инженерных систем	1	[{"added": {}}]	7	1
18	2019-12-29 21:48:59.959448+03	3	Comaex для Умного Дома	1	[{"added": {}}]	7	1
19	2019-12-29 21:50:35.224737+03	4	Comaex для Интернета объектов	1	[{"added": {}}]	7	1
20	2019-12-29 21:54:39.8503+03	5	Супервизор-сервер Comaex	1	[{"added": {}}]	7	1
21	2019-12-29 22:01:16.399432+03	5	Супервизор-сервер Comaex	2	[{"added": {"object": "\\u0421\\u0443\\u043f\\u0435\\u0440\\u0432\\u0438\\u0437\\u043e\\u0440-\\u0441\\u0435\\u0440\\u0432\\u0435\\u0440 Comaex", "name": "Additional images"}}, {"added": {"object": "\\u0420\\u0430\\u0434\\u0438\\u043e\\u043c\\u043e\\u0434\\u0443\\u043b\\u044c E800-DTU", "name": "Additional images"}}]	7	1
22	2019-12-29 22:03:28.406631+03	5	Супервизор-сервер Comaex	2	[{"changed": {"fields": ["description"], "object": "\\u0421\\u0443\\u043f\\u0435\\u0440\\u0432\\u0438\\u0437\\u043e\\u0440-\\u0441\\u0435\\u0440\\u0432\\u0435\\u0440 Comaex", "name": "Additional images"}}]	7	1
23	2019-12-29 22:06:07.672814+03	5	Супервизор-сервер Comaex	2	[{"changed": {"fields": ["description"], "object": "\\u0420\\u0430\\u0434\\u0438\\u043e\\u043c\\u043e\\u0434\\u0443\\u043b\\u044c E800-DTU", "name": "Additional images"}}]	7	1
24	2019-12-29 22:07:15.219574+03	5	Супервизор-сервер Comaex	2	[{"changed": {"fields": ["description"], "object": "\\u0420\\u0430\\u0434\\u0438\\u043e\\u043c\\u043e\\u0434\\u0443\\u043b\\u044c E800-DTU", "name": "Additional images"}}]	7	1
25	2019-12-29 22:11:43.283332+03	6	Функциональные возможности	1	[{"added": {}}]	7	1
26	2019-12-29 22:13:43.226365+03	7	Контроль	1	[{"added": {}}]	7	1
27	2019-12-29 22:15:30.504824+03	8	Управление	1	[{"added": {}}]	7	1
28	2019-12-29 22:17:24.929406+03	9	Уставки	1	[{"added": {}}]	7	1
29	2019-12-29 22:19:07.116781+03	10	Аварии	1	[{"added": {}}]	7	1
30	2019-12-29 22:22:28.822696+03	11	Графики	1	[{"added": {}}, {"added": {"object": "", "name": "Additional images"}}, {"added": {"object": "", "name": "Additional images"}}]	7	1
31	2019-12-29 22:25:54.714729+03	12	Архив событий	1	[{"added": {}}]	7	1
32	2019-12-29 22:28:12.940993+03	13	Визуализация	1	[{"added": {}}, {"added": {"object": "", "name": "Additional images"}}]	7	1
33	2019-12-29 23:17:52.926842+03	14	ВСЕ	1	[{"added": {}}]	7	1
34	2019-12-29 23:19:16.758748+03	15	Применение	1	[{"added": {}}]	7	1
35	2019-12-29 23:20:52.125107+03	16	Системы HVAC	1	[{"added": {}}]	7	1
36	2019-12-29 23:21:52.678076+03	17	Умный дом	1	[{"added": {}}]	7	1
37	2019-12-29 23:23:03.986105+03	18	Интернет объектов	1	[{"added": {}}]	7	1
38	2019-12-29 23:54:23.530432+03	1	Comaex	1	[{"added": {}}]	8	1
39	2019-12-29 23:54:54.503424+03	2	Specification	1	[{"added": {}}]	8	1
40	2019-12-29 23:55:21.57774+03	3	Application	1	[{"added": {}}]	8	1
41	2019-12-29 23:55:51.382313+03	4	Info	1	[{"added": {}}]	8	1
42	2019-12-29 23:57:13.855622+03	1	Slider	1	[{"added": {}}]	10	1
43	2019-12-29 23:58:15.753105+03	2	Comaex	1	[{"added": {}}]	10	1
44	2019-12-29 23:58:59.205633+03	3	Specification	1	[{"added": {}}]	10	1
45	2019-12-30 00:00:52.444618+03	4	Specification images	1	[{"added": {}}]	10	1
46	2019-12-30 00:01:41.478744+03	5	Application	1	[{"added": {}}]	10	1
47	2019-12-30 00:02:20.449943+03	6	Application images	1	[{"added": {}}]	10	1
48	2019-12-30 00:03:09.754432+03	7	Portfolio	1	[{"added": {}}]	10	1
49	2019-12-30 00:03:59.768526+03	8	Cost	1	[{"added": {}}]	10	1
50	2019-12-30 00:04:43.53725+03	9	Cost images	1	[{"added": {}}]	10	1
51	2019-12-30 00:05:35.30842+03	10	Contact	1	[{"added": {}}]	10	1
52	2019-12-30 00:06:28.768533+03	11	News	1	[{"added": {}}]	10	1
53	2019-12-30 00:09:43.85798+03	1	Comaex Server	1	[{"added": {}}]	7	1
54	2019-12-30 10:01:23.969286+03	2	Comaex for Engineering systems	1	[{"added": {}}]	7	1
55	2019-12-30 10:02:49.299798+03	3	Comaex for Smart Home	1	[{"added": {}}]	7	1
56	2019-12-30 10:04:18.499495+03	4	Comaex for IoT	1	[{"added": {}}]	7	1
57	2019-12-30 10:15:41.441199+03	5	Supervisor Server Comaex	1	[{"added": {}}, {"added": {"object": "Supervisor Server Comaex", "name": "Additional images"}}, {"added": {"object": "Radio module E800-DTU", "name": "Additional images"}}]	7	1
58	2019-12-30 10:32:43.2836+03	6	Specification	1	[{"added": {}}]	7	1
59	2019-12-30 10:38:00.200534+03	7	Monitoring	1	[{"added": {}}]	7	1
60	2019-12-30 10:40:18.619171+03	8	Control	1	[{"added": {}}]	7	1
61	2019-12-30 11:01:53.515845+03	9	Setpoints	1	[{"added": {}}]	7	1
62	2019-12-30 11:03:32.251577+03	10	Alarms	1	[{"added": {}}]	7	1
63	2019-12-30 11:06:18.120579+03	11	Charts	1	[{"added": {}}, {"added": {"object": "", "name": "Additional images"}}, {"added": {"object": "", "name": "Additional images"}}]	7	1
64	2019-12-30 11:09:08.13485+03	12	Event Archive	1	[{"added": {}}]	7	1
65	2019-12-30 11:14:16.38187+03	13	Visualization	1	[{"added": {}}, {"added": {"object": "", "name": "Additional images"}}]	7	1
66	2019-12-30 11:15:45.344955+03	14	All	1	[{"added": {}}]	7	1
67	2019-12-30 11:18:10.043601+03	15	Application	1	[{"added": {}}]	7	1
68	2019-12-30 11:19:16.873892+03	16	HVAC Systems	1	[{"added": {}}]	7	1
69	2019-12-30 11:20:18.850493+03	17	Smart Home	1	[{"added": {}}]	7	1
70	2019-12-30 11:21:24.18898+03	18	Internet of Things	1	[{"added": {}}]	7	1
71	2019-12-30 11:42:24.058755+03	1	HVAC	1	[{"added": {}}, {"added": {"object": "\\u041e \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0435", "name": "Additional image"}}, {"added": {"object": "\\u041d\\u0430\\u0448\\u0435 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u0435", "name": "Additional image"}}, {"added": {"object": "\\u041f\\u0440\\u0435\\u0438\\u043c\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u0430", "name": "Additional image"}}, {"added": {"object": "\\u0412\\u0430\\u0448\\u0430 \\u0432\\u044b\\u0433\\u043e\\u0434\\u0430", "name": "Additional image"}}, {"added": {"object": "\\u0418\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f \\u0434\\u043b\\u044f \\u0438\\u0437\\u0443\\u0447\\u0435\\u043d\\u0438\\u044f", "name": "Additional image"}}]	15	1
72	2019-12-30 11:46:32.549117+03	2	HVAC	1	[{"added": {}}, {"added": {"object": "About product", "name": "Additional image"}}, {"added": {"object": "What we offer", "name": "Additional image"}}, {"added": {"object": "Advantages", "name": "Additional image"}}, {"added": {"object": "Your benefit", "name": "Additional image"}}, {"added": {"object": "Information for learning", "name": "Additional image"}}]	15	1
73	2019-12-30 11:49:07.031752+03	3	SFUGD	1	[{"added": {}}, {"added": {"object": "", "name": "Additional image"}}]	15	1
74	2019-12-30 11:54:25.023944+03	4	SFUGD	1	[{"added": {}}, {"added": {"object": "Patent brief", "name": "Additional image"}}, {"added": {"object": "Your benefit", "name": "Additional image"}}, {"added": {"object": "Get more information", "name": "Additional image"}}, {"added": {"object": "Contact us", "name": "Additional image"}}]	15	1
75	2019-12-30 12:01:13.488172+03	814a94bb-1a0f-461e-9a49-dd448d2d9518	Computer LTD	1	[{"added": {}}]	13	1
76	2019-12-30 12:29:44.477309+03	1	HVAC	1	[{"added": {}}]	17	1
77	2019-12-30 12:29:51.274701+03	2	SFUGD	1	[{"added": {}}]	17	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 77, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	user
3	auth	permission
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	base	base
8	base	menu
9	base	image
10	base	submenu
11	interaction	correspondence
12	interaction	contact
13	clients	clients
14	clients	importduplication
15	promotion	promotion
16	promotion	image
17	scheduler	scheduler
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-29 21:21:41.55838+03
2	auth	0001_initial	2019-12-29 21:21:42.905134+03
3	admin	0001_initial	2019-12-29 21:21:43.180245+03
4	admin	0002_logentry_remove_auto_add	2019-12-29 21:21:43.218762+03
5	contenttypes	0002_remove_content_type_name	2019-12-29 21:21:43.289498+03
6	auth	0002_alter_permission_name_max_length	2019-12-29 21:21:43.322505+03
7	auth	0003_alter_user_email_max_length	2019-12-29 21:21:43.367261+03
8	auth	0004_alter_user_username_opts	2019-12-29 21:21:43.392212+03
9	auth	0005_alter_user_last_login_null	2019-12-29 21:21:43.443721+03
10	auth	0006_require_contenttypes_0002	2019-12-29 21:21:43.454859+03
11	auth	0007_alter_validators_add_error_messages	2019-12-29 21:21:43.480295+03
12	auth	0008_alter_user_username_max_length	2019-12-29 21:21:43.608711+03
13	auth	0009_alter_user_last_name_max_length	2019-12-29 21:21:43.663394+03
14	base	0001_initial	2019-12-29 21:21:45.277679+03
15	clients	0001_initial	2019-12-29 21:21:45.828024+03
16	interaction	0001_initial	2019-12-29 21:21:46.357722+03
17	promotion	0001_initial	2019-12-29 21:21:47.019208+03
18	scheduler	0001_initial	2019-12-29 21:21:47.283763+03
19	sessions	0001_initial	2019-12-29 21:21:47.591393+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
5fqwm9at31kxn3ys6m781bgr78jtkj0k	YjhiNDg4NGNkZTMzNDQ2OWE4ZThjZTMzYzdkZTViMTZhODU1NDFkNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2xhbmd1YWdlIjoiZW4iLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfaGFzaCI6Ijk1Y2U3ZWUzNjU4ODgxZGM2NDc3ZGU1ZDVhYWIyZTc5OWI3NDJhODUifQ==	2020-01-13 12:43:16.445969+03
\.


--
-- Data for Name: interaction_contact; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.interaction_contact (id, fullname, email, phone, content, subject, ipaddr, "timestamp", flag) FROM stdin;
1	Владимир Годовалов	chim73@mail.ru	+7(985)4828588	Please send me login details for Comaex Demo	credentials	127.0.0.1	2019-12-30 12:43:07.985385+03	f
\.


--
-- Name: interaction_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.interaction_contact_id_seq', 1, true);


--
-- Data for Name: interaction_correspondence; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.interaction_correspondence (id, name, email, phone, content, content_html, theme, subject, feedback, "timestamp", action, flag, person_id_id) FROM stdin;
\.


--
-- Name: interaction_correspondence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.interaction_correspondence_id_seq', 1, false);


--
-- Data for Name: promotion_image; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.promotion_image (id, image, slug, title, sentence, urllink, description, desc_html, data1, data2, name_id) FROM stdin;
1	hvac/email_image2_J8j8r4u.jpg	hvac	О продукте			&ensp;Сервер подключается к контроллерам управления оборудованием и осуществляет функции мониторинга, управления, записи информации, сигнализации состояний, визуализацию устройств. Вот примеры интерфейса функционала:	<p>&ensp;Сервер подключается к контроллерам управления оборудованием и осуществляет функции мониторинга, управления, записи информации, сигнализации состояний, визуализацию устройств. Вот примеры интерфейса функционала:</p>			1
2		hvac	Наше предложение			&ensp;Мы предлагаем на условиях OEM-соглашения поставлять вашей компании сервера Comaex под логотипом вашей компании. Мы разработаем листы параметров конфигурации ваших устройств и мнемосхемы визуализаций. Вам останется только загружать файлы объектов и подключать устройства к серверу.	<p>&ensp;Мы предлагаем на условиях OEM-соглашения поставлять вашей компании сервера Comaex под логотипом вашей компании. Мы разработаем листы параметров конфигурации ваших устройств и мнемосхемы визуализаций. Вам останется только загружать файлы объектов и подключать устройства к серверу.</p>			1
3		hvac	Преимущества			<ul style='text-align:left'><li><b>Низкая цена устройства</b> - от 23000 рублей;</li><li><b>Высокая производительность</b> – контроль до 1000 переменных и до 20 слейв-устройств;</li><li><b>Быстрый ввод в эксплуатацию</b>. Достаточно ввести файл конфигурации объекта, соеденить сервер со слейв-устройствами с помощью кабеля или радиомодулей и настроить роутер объекта на доступ к серверу с глобального интернета если необходимо;</li><li><b>Не нужен стационарный ПК</b>, интерфейс доступен в любом браузере;</li><li><b>LAN и WAN доступ</b>.</li></ul>	<ul style='text-align:left'><li><b>Низкая цена устройства</b> - от 23000 рублей;</li><li><b>Высокая производительность</b> – контроль до 1000 переменных и до 20 слейв-устройств;</li><li><b>Быстрый ввод в эксплуатацию</b>. Достаточно ввести файл конфигурации объекта, соеденить сервер со слейв-устройствами с помощью кабеля или радиомодулей и настроить роутер объекта на доступ к серверу с глобального интернета если необходимо;</li><li><b>Не нужен стационарный ПК</b>, интерфейс доступен в любом браузере;</li><li><b>LAN и WAN доступ</b>.</li></ul>			1
4		hvac	Ваша выгода			<ul style='text-align:left'><li><b>Конкурентные преимущества</b>. Ваше HVAC оборудование уже поставляется с готовой, полнофункциональной системой диспетчеризации;</li><li><b>Минимальные затраты на ввод в эксплуатацию</b>;</li><li><b>Высокая маржинальность</b>. Благодаря низкой цене продажи, вы можете вводить свою целесообразную наценку;</li><li><b>Нет необходимости в собственной разработке</b>. Сервера поставляются под вашим логотипом, а наша команда профессионалов отвечает за продукт.</li></ul>	<ul style='text-align:left'><li><b>Конкурентные преимущества</b>. Ваше HVAC оборудование уже поставляется с готовой, полнофункциональной системой диспетчеризации;</li><li><b>Минимальные затраты на ввод в эксплуатацию</b>;</li><li><b>Высокая маржинальность</b>. Благодаря низкой цене продажи, вы можете вводить свою целесообразную наценку;</li><li><b>Нет необходимости в собственной разработке</b>. Сервера поставляются под вашим логотипом, а наша команда профессионалов отвечает за продукт.</li></ul>			1
5		hvac	Информация для изучения			<ul style='text-align:left'><li>Более детальное описание технологии: <a href='http://www.comaex.info' title='Посетить сайт' target='_blank'>comaex.info</a>;</li><li>Реальный сервер в работе:  <a href='http://comaex.ddns.net' title='Comaex Demo' target='_blank'>comaex.ddns.net</a>. Даные для входа: логин-<b>user</b>, пароль-<b>user12345.</b></li></ul>	<ul style='text-align:left'><li>Более детальное описание технологии: <a href='http://www.comaex.info' title='Посетить сайт' target='_blank'>comaex.info</a>;</li><li>Реальный сервер в работе:  <a href='http://comaex.ddns.net' title='Comaex Demo' target='_blank'>comaex.ddns.net</a>. Даные для входа: логин-<b>user</b>, пароль-<b>user12345.</b></li></ul>			1
6	hvac/email_image2_8u2E0xf.jpg	hvac	About product			&ensp;The server connects to the equipment controllers and performs the functions of monitoring, control, recording information, signaling states, visualizing devices. Here are the examples of the functional interface:	<p>&ensp;The server connects to the equipment controllers and performs the functions of monitoring, control, recording information, signaling states, visualizing devices. Here are the examples of the functional interface:</p>			2
7		hvac	What we offer			&ensp;We offer, under the terms of an OEM agreement, to supply your company with Comaex servers under your company logo. We will develop configuration sheets for your devices and visualization mimics. You just have to upload the object files and connect the devices to the server.	<p>&ensp;We offer, under the terms of an OEM agreement, to supply your company with Comaex servers under your company logo. We will develop configuration sheets for your devices and visualization mimics. You just have to upload the object files and connect the devices to the server.</p>			2
8		hvac	Advantages			<ul style = 'text-align: left'> <li> <b> Low device price </b> - from 23,000 rubles; </li> <li> <b> High performance </b> - control up to 1000 variables and up to 20 slaves; </li> <li> <b> Quick commissioning </b>. It is enough to enter the object configuration file, connect the server to the slave devices using a cable or radio modules and configure the object router to access the server from the global Internet if necessary; </li> <li> <b> No need for a stationary PC </b>, the interface is accessible in any browser; </li> <li> <b> LAN and WAN access </b>. </li> </ul>	<ul style = 'text-align: left'> <li> <b> Low device price </b> - from 23,000 rubles; </li> <li> <b> High performance </b> - control up to 1000 variables and up to 20 slaves; </li> <li> <b> Quick commissioning </b>. It is enough to enter the object configuration file, connect the server to the slave devices using a cable or radio modules and configure the object router to access the server from the global Internet if necessary; </li> <li> <b> No need for a stationary PC </b>, the interface is accessible in any browser; </li> <li> <b> LAN and WAN access </b>. </li> </ul>			2
9		hvac	Your benefit			<ul style = 'text-align: left'> <li> <b> Competitive Advantages </b>. Your HVAC equipment is already supplied with a ready-made fully-functional dispatch system </li> <li> <b> Minimum commissioning costs </b> </li> <li> <b> High margin </b>. Due to the low selling price, you can enter your own reasonable margin </li> <li> <b> No need for your own development </b>. Servers are delivered under your logo, and our team of professionals is responsible for the product. </li> </ul>	<ul style = 'text-align: left'> <li> <b> Competitive Advantages </b>. Your HVAC equipment is already supplied with a ready-made fully-functional dispatch system </li> <li> <b> Minimum commissioning costs </b> </li> <li> <b> High margin </b>. Due to the low selling price, you can enter your own reasonable margin </li> <li> <b> No need for your own development </b>. Servers are delivered under your logo, and our team of professionals is responsible for the product. </li> </ul>			2
10		hvac	Information for learning			<ul style = 'text-align: left'> <li> A more detailed description of the technology: <a href='http://www.comaex.info' title='Visit the site 'target='_blank'> comaex.info </a> </li> <li> The real server is at work: <a href='http://comaex.ddns.net' title='Comaex Demo' target='_blank'> comaex.ddns.net </a>. Login- <b> user </b>, password- <b> user12345. </b> </li> </ul>	<ul style = 'text-align: left'> <li> A more detailed description of the technology: <a href='http://www.comaex.info' title='Visit the site 'target='_blank'> comaex.info </a> </li> <li> The real server is at work: <a href='http://comaex.ddns.net' title='Comaex Demo' target='_blank'> comaex.ddns.net </a>. Login- <b> user </b>, password- <b> user12345. </b> </li> </ul>			2
11	sfugd/garage_door_vMUH6oF.jpg	sfugd				Бла бла бла	<p>Бла бла бла</p>			3
12	sfugd/garage_patent_1.jpg	sfugd	Patent brief		http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&r=1&f=G&l=50&s1=8327908.PN.&OS=PN/8327908&RS=PN/8327908	&emsp;The design is intended for use in garages for opening and closing openings. This model is made in accordance with <a href ="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&r=1&f=G&l=50&s1=8327908.PN.&OS=PN/8327908&RS=PN/8327908" style="color:red; cursor:pointer;" target="_blank">US Pat. No. 8,327,908</a> and is based on the key clauses of the claims. The design has four sections that are folded like an accordion, which ensures a substantial compactness of the structure. Additional advantages also include: a small headroom opening, high opening speed of 5-8 seconds, no ropes and torsion springs, which significantly reduces the cost of low maintenance and provides a longer service life. The model is simple in design, therefore, reliable in operation and inexpensive in mass production. More information and video of working prototype you can find here:  <a href ="http://www.fold-up-door.com" style="color:red; cursor:pointer;" target="_blank">www.fold-up-door.com</a>.	<p>&emsp;The design is intended for use in garages for opening and closing openings. This model is made in accordance with <a href ="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&r=1&f=G&l=50&s1=8327908.PN.&OS=PN/8327908&RS=PN/8327908" style="color:red; cursor:pointer;" target="_blank">US Pat. No. 8,327,908</a> and is based on the key clauses of the claims. The design has four sections that are folded like an accordion, which ensures a substantial compactness of the structure. Additional advantages also include: a small headroom opening, high opening speed of 5-8 seconds, no ropes and torsion springs, which significantly reduces the cost of low maintenance and provides a longer service life. The model is simple in design, therefore, reliable in operation and inexpensive in mass production. More information and video of working prototype you can find here:  <a href ="http://www.fold-up-door.com" style="color:red; cursor:pointer;" target="_blank">www.fold-up-door.com</a>.</p>	Visit USPTO website to view the patent		4
13		sfugd	Your benefit			<ul style = 'text-align: left'><li>low technology purchase price: $ 100,000</li><li>patent protection</li><li>proven performance - there is a valid  <a href ="http://www.fold-up-door.com" style="color:red; cursor:pointer;" target="_blank">prototype</a></li><li>huge market potential</li></ul>	<ul style = 'text-align: left'><li>low technology purchase price: $ 100,000</li><li>patent protection</li><li>proven performance - there is a valid  <a href ="http://www.fold-up-door.com" style="color:red; cursor:pointer;" target="_blank">prototype</a></li><li>huge market potential</li></ul>			4
14		sfugd	Get more information			For more information visit website: <a href ="http://www.fold-up-door.com" style="color:red; cursor:pointer;" target="_blank">www.fold-up-door.com</a>.	<p>For more information visit website: <a href ="http://www.fold-up-door.com" style="color:red; cursor:pointer;" target="_blank">www.fold-up-door.com</a>.</p>			4
15		sfugd	Contact us			<ul style = 'text-align: left'><li>Vladimir Godovalov, Moscow, Russia. Phone: +7 (985)482-85-88</li><li>Kseniia Hodovalova, USA, Texas. Phone: +1 (956) 620-63-03</li></ul>	<ul style = 'text-align: left'><li>Vladimir Godovalov, Moscow, Russia. Phone: +7 (985)482-85-88</li><li>Kseniia Hodovalova, USA, Texas. Phone: +1 (956) 620-63-03</li></ul>			4
\.


--
-- Name: promotion_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.promotion_image_id_seq', 15, true);


--
-- Data for Name: promotion_promotion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.promotion_promotion (id, title, slug, subtitle, sentence, description, desc_html, image, filenum, urllink, "timestamp", flag, data1, data2, data3, data4, category, language) FROM stdin;
1	О нас	hvac			&ensp;Мы занимаемся разработкой супервизор – серверов <a href='http://www.comaex.info' title='Посетить сайт' target='_blank'>Comaex</a>, предназначенных для формирования информационной среды объекта. Так он выглядит:	<p>&ensp;Мы занимаемся разработкой супервизор – серверов <a href='http://www.comaex.info' title='Посетить сайт' target='_blank'>Comaex</a>, предназначенных для формирования информационной среды объекта. Так он выглядит:</p>	hvac/image_slider1_hbpOrxj.jpg	0		2019-12-30 11:42:24.026731+03	f					HVAC	RU
2	About Us	hvac			&ensp;We are developing a supervisor server <a href='http://www.comaex.info' title='Visit the site 'target='_blank'> Comaex </a>, designed to form the information environment of the object. So it looks like:	<p>&ensp;We are developing a supervisor server <a href='http://www.comaex.info' title='Visit the site 'target='_blank'> Comaex </a>, designed to form the information environment of the object. So it looks like:</p>	hvac/Mini_PC_3_oc0UO56.jpg	0		2019-12-30 11:46:32.521116+03	f					HVAC	EN
3	Компактные ворота. Патент США 8327908	sfugd			Бла бла бла	<p>Бла бла бла</p>	sfugd/car_garage_vcpfEr9.jpg	0		2019-12-30 11:49:07.025735+03	f					SFUGD	RU
4	Uncontested market	sfugd			&emsp;Any industry must develop. Overhead garage door has long been in operation as the only technology on the market. And it is worth appearing on the market for an alternative model, as it will certainly share consumer demand. For this, it should have undoubted advantages, even being somewhat more expensive. Such <a href ="http://www.fold-up-door.com" style="color:red; cursor:pointer;" target="_blank">a model</a> has been created and we offer to buy a patent for this technology. Developing this market will take time and money, but it's worth it - you will create a new market and earn hundreds of millions of dollars.	<p>&emsp;Any industry must develop. Overhead garage door has long been in operation as the only technology on the market. And it is worth appearing on the market for an alternative model, as it will certainly share consumer demand. For this, it should have undoubted advantages, even being somewhat more expensive. Such <a href ="http://www.fold-up-door.com" style="color:red; cursor:pointer;" target="_blank">a model</a> has been created and we offer to buy a patent for this technology. Developing this market will take time and money, but it's worth it - you will create a new market and earn hundreds of millions of dollars.</p>	sfugd/car_garage_V9GmCY6.jpg	0	http://www.fold-up-door.com	2019-12-30 11:54:24.961893+03	f	Visit website www.fold-up-door.com				SFUGD	EN
\.


--
-- Name: promotion_promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.promotion_promotion_id_seq', 4, true);


--
-- Data for Name: scheduler_scheduler; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scheduler_scheduler (id, category, tick, counter, event, processing) FROM stdin;
1	HVAC	0	0	Тик равен 0. Планировщик остановлен	Нет данных
2	SFUGD	0	0	Тик равен 0. Планировщик остановлен	Нет данных
\.


--
-- Name: scheduler_scheduler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.scheduler_scheduler_id_seq', 2, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: base_base_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_base
    ADD CONSTRAINT base_base_pkey PRIMARY KEY (id);


--
-- Name: base_image_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_image
    ADD CONSTRAINT base_image_pkey PRIMARY KEY (id);


--
-- Name: base_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_menu
    ADD CONSTRAINT base_menu_pkey PRIMARY KEY (id);


--
-- Name: base_menu_slug_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_menu
    ADD CONSTRAINT base_menu_slug_key UNIQUE (slug);


--
-- Name: base_menu_title_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_menu
    ADD CONSTRAINT base_menu_title_key UNIQUE (title);


--
-- Name: base_submenu_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_submenu
    ADD CONSTRAINT base_submenu_pkey PRIMARY KEY (id);


--
-- Name: base_submenu_subslug_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_submenu
    ADD CONSTRAINT base_submenu_subslug_key UNIQUE (subslug);


--
-- Name: base_submenu_subtitle_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_submenu
    ADD CONSTRAINT base_submenu_subtitle_key UNIQUE (subtitle);


--
-- Name: clients_clients_email_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.clients_clients
    ADD CONSTRAINT clients_clients_email_key UNIQUE (email);


--
-- Name: clients_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.clients_clients
    ADD CONSTRAINT clients_clients_pkey PRIMARY KEY (uuid);


--
-- Name: clients_importduplication_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.clients_importduplication
    ADD CONSTRAINT clients_importduplication_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: interaction_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.interaction_contact
    ADD CONSTRAINT interaction_contact_pkey PRIMARY KEY (id);


--
-- Name: interaction_correspondence_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.interaction_correspondence
    ADD CONSTRAINT interaction_correspondence_pkey PRIMARY KEY (id);


--
-- Name: promotion_image_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.promotion_image
    ADD CONSTRAINT promotion_image_pkey PRIMARY KEY (id);


--
-- Name: promotion_promotion_category_language_aea87d58_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.promotion_promotion
    ADD CONSTRAINT promotion_promotion_category_language_aea87d58_uniq UNIQUE (category, language);


--
-- Name: promotion_promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.promotion_promotion
    ADD CONSTRAINT promotion_promotion_pkey PRIMARY KEY (id);


--
-- Name: scheduler_scheduler_category_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scheduler_scheduler
    ADD CONSTRAINT scheduler_scheduler_category_key UNIQUE (category);


--
-- Name: scheduler_scheduler_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scheduler_scheduler
    ADD CONSTRAINT scheduler_scheduler_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: base_base_menu_id_a95e2661; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_base_menu_id_a95e2661 ON public.base_base USING btree (menu_id);


--
-- Name: base_base_menu_id_a95e2661_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_base_menu_id_a95e2661_like ON public.base_base USING btree (menu_id varchar_pattern_ops);


--
-- Name: base_base_slug_ea4374f1; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_base_slug_ea4374f1 ON public.base_base USING btree (slug);


--
-- Name: base_base_slug_ea4374f1_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_base_slug_ea4374f1_like ON public.base_base USING btree (slug varchar_pattern_ops);


--
-- Name: base_image_name_id_7bbf23b4; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_image_name_id_7bbf23b4 ON public.base_image USING btree (name_id);


--
-- Name: base_image_slug_295384b2; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_image_slug_295384b2 ON public.base_image USING btree (slug);


--
-- Name: base_image_slug_295384b2_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_image_slug_295384b2_like ON public.base_image USING btree (slug varchar_pattern_ops);


--
-- Name: base_menu_slug_e20cad49_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_menu_slug_e20cad49_like ON public.base_menu USING btree (slug varchar_pattern_ops);


--
-- Name: base_menu_title_e1d8c594_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_menu_title_e1d8c594_like ON public.base_menu USING btree (title varchar_pattern_ops);


--
-- Name: base_submenu_submenu_id_67f7b58f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_submenu_submenu_id_67f7b58f ON public.base_submenu USING btree (submenu_id);


--
-- Name: base_submenu_submenu_id_67f7b58f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_submenu_submenu_id_67f7b58f_like ON public.base_submenu USING btree (submenu_id varchar_pattern_ops);


--
-- Name: base_submenu_subslug_d12257df_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_submenu_subslug_d12257df_like ON public.base_submenu USING btree (subslug varchar_pattern_ops);


--
-- Name: base_submenu_subtitle_78d78541_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX base_submenu_subtitle_78d78541_like ON public.base_submenu USING btree (subtitle varchar_pattern_ops);


--
-- Name: clients_clients_email_dcc1d15b_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX clients_clients_email_dcc1d15b_like ON public.clients_clients USING btree (email varchar_pattern_ops);


--
-- Name: clients_clients_slug_d653c936; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX clients_clients_slug_d653c936 ON public.clients_clients USING btree (slug);


--
-- Name: clients_clients_slug_d653c936_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX clients_clients_slug_d653c936_like ON public.clients_clients USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: interaction_correspondence_person_id_id_d539749c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX interaction_correspondence_person_id_id_d539749c ON public.interaction_correspondence USING btree (person_id_id);


--
-- Name: promotion_image_name_id_b68956b5; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX promotion_image_name_id_b68956b5 ON public.promotion_image USING btree (name_id);


--
-- Name: promotion_image_slug_75191e9e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX promotion_image_slug_75191e9e ON public.promotion_image USING btree (slug);


--
-- Name: promotion_image_slug_75191e9e_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX promotion_image_slug_75191e9e_like ON public.promotion_image USING btree (slug varchar_pattern_ops);


--
-- Name: promotion_promotion_slug_9cd58d82; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX promotion_promotion_slug_9cd58d82 ON public.promotion_promotion USING btree (slug);


--
-- Name: promotion_promotion_slug_9cd58d82_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX promotion_promotion_slug_9cd58d82_like ON public.promotion_promotion USING btree (slug varchar_pattern_ops);


--
-- Name: scheduler_scheduler_category_c74efccc_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX scheduler_scheduler_category_c74efccc_like ON public.scheduler_scheduler USING btree (category varchar_pattern_ops);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_base_menu_id_a95e2661_fk_base_submenu_subtitle; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_base
    ADD CONSTRAINT base_base_menu_id_a95e2661_fk_base_submenu_subtitle FOREIGN KEY (menu_id) REFERENCES public.base_submenu(subtitle) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_image_name_id_7bbf23b4_fk_base_base_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_image
    ADD CONSTRAINT base_image_name_id_7bbf23b4_fk_base_base_id FOREIGN KEY (name_id) REFERENCES public.base_base(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_submenu_submenu_id_67f7b58f_fk_base_menu_title; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_submenu
    ADD CONSTRAINT base_submenu_submenu_id_67f7b58f_fk_base_menu_title FOREIGN KEY (submenu_id) REFERENCES public.base_menu(title) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: interaction_correspo_person_id_id_d539749c_fk_interacti; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.interaction_correspondence
    ADD CONSTRAINT interaction_correspo_person_id_id_d539749c_fk_interacti FOREIGN KEY (person_id_id) REFERENCES public.interaction_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: promotion_image_name_id_b68956b5_fk_promotion_promotion_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.promotion_image
    ADD CONSTRAINT promotion_image_name_id_b68956b5_fk_promotion_promotion_id FOREIGN KEY (name_id) REFERENCES public.promotion_promotion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

