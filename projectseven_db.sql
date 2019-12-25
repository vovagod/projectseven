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
    description text NOT NULL,
    name_id integer,
    desc_html text NOT NULL,
    urllink character varying(200) NOT NULL,
    data1 character varying(50) NOT NULL,
    data2 character varying(50) NOT NULL
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
    company character varying(120) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(120) NOT NULL,
    about text NOT NULL,
    area character varying(120) NOT NULL,
    persons character varying(120) NOT NULL,
    created timestamp with time zone NOT NULL,
    enable_mailing boolean NOT NULL,
    interested boolean NOT NULL,
    flag boolean NOT NULL,
    category character varying(30) NOT NULL,
    counter smallint NOT NULL,
    uuid uuid NOT NULL,
    error_mailing character varying(360) NOT NULL,
    file character varying(100),
    slug character varying(50) NOT NULL,
    address character varying(240) NOT NULL,
    email2 character varying(120),
    filepath character varying(120) NOT NULL,
    preorder boolean NOT NULL,
    language character varying(30) NOT NULL,
    last_post timestamp with time zone,
    bid integer NOT NULL,
    count smallint NOT NULL,
    country character varying(120) NOT NULL,
    CONSTRAINT clients_clients_bid_check CHECK ((bid >= 0)),
    CONSTRAINT clients_clients_count_check CHECK ((count >= 0)),
    CONSTRAINT clients_clients_counter_check CHECK ((counter >= 0))
);


ALTER TABLE public.clients_clients OWNER TO admin;

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
    ipaddr character varying(120) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    flag boolean NOT NULL,
    subject character varying(120) NOT NULL
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
    "timestamp" timestamp with time zone NOT NULL,
    flag boolean NOT NULL,
    person_id_id integer,
    action boolean NOT NULL,
    content_html text NOT NULL,
    feedback character varying(120) NOT NULL,
    subject character varying(120) NOT NULL,
    theme character varying(120) NOT NULL
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
    name_id integer,
    data1 character varying(50) NOT NULL,
    data2 character varying(50) NOT NULL
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
    category character varying(30) NOT NULL,
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
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add permission	4	add_permission
11	Can change permission	4	change_permission
12	Can delete permission	4	delete_permission
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Вертикальное подменю	7	add_submenu
20	Can change Вертикальное подменю	7	change_submenu
21	Can delete Вертикальное подменю	7	delete_submenu
22	Can add Содержание страницы	8	add_base
23	Can change Содержание страницы	8	change_base
24	Can delete Содержание страницы	8	delete_base
25	Can add Горизонтальное меню	9	add_menu
26	Can change Горизонтальное меню	9	change_menu
27	Can delete Горизонтальное меню	9	delete_menu
28	Can add Дополнительные изображения	10	add_image
29	Can change Дополнительные изображения	10	change_image
30	Can delete Дополнительные изображения	10	delete_image
31	Can add Входящие сообщения	11	add_contact
32	Can change Входящие сообщения	11	change_contact
33	Can delete Входящие сообщения	11	delete_contact
34	Can add Отправленная корреспонденция	12	add_correspondence
35	Can change Отправленная корреспонденция	12	change_correspondence
36	Can delete Отправленная корреспонденция	12	delete_correspondence
37	Can add Клиенты	13	add_clients
38	Can change Клиенты	13	change_clients
39	Can delete Клиенты	13	delete_clients
40	Can add Дополнительное изображение	14	add_image
41	Can change Дополнительное изображение	14	change_image
42	Can delete Дополнительное изображение	14	delete_image
43	Can add Промоция	15	add_promotion
44	Can change Промоция	15	change_promotion
45	Can delete Промоция	15	delete_promotion
46	Can add Панировщик	16	add_scheduler
47	Can change Панировщик	16	change_scheduler
48	Can delete Панировщик	16	delete_scheduler
49	Can add lang info	17	add_langinfo
50	Can change lang info	17	change_langinfo
51	Can delete lang info	17	delete_langinfo
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 51, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$1EdKk0LQWvIq$tcJhxXNlgpeVrQt1uQ5qulpHwz0dSfgRBfEKyb3gRIs=	2019-12-22 17:19:45.462732+03	t	admin			gva008@gmail.com	t	t	2019-12-12 21:20:11.404664+03
2	pbkdf2_sha256$100000$4lq5uOkwfbnH$nacd9qYHA7U/vUsZGVSga9NIfFNiycy/IXnLw/xrpcI=	2019-12-23 09:25:35.201497+03	t	admincomaex			gva008@gmail.com	t	t	2019-12-22 22:28:45.967877+03
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

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


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
1	Сервер Comaex	slider			Супервизор для \r\nсистем HVAC, умного\r\nдома и интернета объектов	<p>Супервизор для \nсистем HVAC, умного\nдома и интернета объектов</p>	slider/slider_1_eouQh4l.jpg	0	http://127.0.0.1:8000/home/#about	2019-12-12 22:14:02.018967+03	t	#4E4E4E	inherit	inherit	blue	Слайдер
2	Comaex для инженерных систем	slajder			Супервизорский \r\nконтроль и управление\r\nинженерным оборудованием	<p>Супервизорский \nконтроль и управление\nинженерным оборудованием</p>	slajder/slider_2_8Qqosbf.jpg	0	http://127.0.0.1:8000/home/#application1	2019-12-12 22:21:18.663433+03	t	blue	white	#4A5970	blue	Слайдер
3	Comaex для Умного Дома	slajder			Контроль \r\nза безопасностью, климатом \r\nи инженерными системами жилища	<p>Контроль \nза безопасностью, климатом \nи инженерными системами жилища</p>	slajder/slider_3_mmIH0uE.jpg	0	http://127.0.0.1:8000/home/#application2	2019-12-12 22:22:50.150943+03	t	blue	white	#84756E	blue	Слайдер
4	Comaex для Интернета объектов	slajder			Хаб для \r\nдатчиков и счетчиков	<p>Хаб для \nдатчиков и счетчиков</p>	slajder/slider_4_NWxc2fx.jpg	0	http://127.0.0.1:8000/home/#application3	2019-12-12 22:24:22.946345+03	f	white	white	#000324		Слайдер
6	Функциональные возможности	funkcional			&emsp;Comaex обладает полным набором супервизорских функций, таких как:  контроль, управление, запись, визуализация, сигнализация, отчеты.<br>\r\n&emsp;Функция <a href="#control" style="color:red; cursor: pointer;">Контроль</a> отвечает за получение данных, таких как температура, давление и т.п. с удаленных устройств и отображение их на экране интерфейса. Другой важной частью контроля есть получение сигналов <a href="#alarms" style="color:red; cursor: pointer;">Аварий</a> или <a href="#events" style="color:red; cursor: pointer;">Событий</a> произошедших с устройствами объекта.     \r\n&emsp;Функция <a href="#management" style="color:red; cursor: pointer;">Управление</a> осуществляет передачу управляющих сигналов, к примеру включить-выключить, а также данных в виде <a href="#setpoint" style="color:red; cursor: pointer;">Уставок</a>, к примеру установить температуру помещения.<br>\r\n&emsp;Помимо обмена данными с устройствами, сервер производит запись информации. Это разделы <a href="#charts" style="color:red; cursor: pointer;">Графики</a> и <a href="#events" style="color:red; cursor: pointer;">Архив событий</a> интерфейса. В разделе Графики выводится информация с датчиков контроля, а в разделе Архив событий осуществляется запись событий объекта контроля. Вся записанная информация может быть выведена на печать в PDF-формате.<br>\r\n&emsp;Следующей важной функцией интерфейса есть раздел <a href="#visualization" style="color:red; cursor: pointer;">Визуализация</a>, где представлена мнемосхема устройства или объекта, на которую выводится вся информация контроля и элементы управления объекта. Это наглядная и удобная функция для мгновенной оценки состояния объекта.<br>\r\n&emsp;Для просмотра всех устройств и всех их параметров существует раздел <a href="#all" style="color:red; cursor: pointer;">ВСЕ</a> расположенный в первой строчке левого меню.<br>\r\n&emsp;И наконец, функция Сигнализация проинформирует о чрезвычайном событии на почту или СМС-сообщением на мобильный телефон. Это может быть любое событие, о котором надо знать незамедлительно, чтобы вовремя принять меры.<br>\r\n&emsp;Ниже представлено описание каждого функционального состояния и показаны скриншоты экранов интерфейса:	<p>&emsp;Comaex обладает полным набором супервизорских функций, таких как:  контроль, управление, запись, визуализация, сигнализация, отчеты.<br>\n&emsp;Функция <a href="#control" style="color:red; cursor: pointer;">Контроль</a> отвечает за получение данных, таких как температура, давление и т.п. с удаленных устройств и отображение их на экране интерфейса. Другой важной частью контроля есть получение сигналов <a href="#alarms" style="color:red; cursor: pointer;">Аварий</a> или <a href="#events" style="color:red; cursor: pointer;">Событий</a> произошедших с устройствами объекта.   <br />\n&emsp;Функция <a href="#management" style="color:red; cursor: pointer;">Управление</a> осуществляет передачу управляющих сигналов, к примеру включить-выключить, а также данных в виде <a href="#setpoint" style="color:red; cursor: pointer;">Уставок</a>, к примеру установить температуру помещения.<br>\n&emsp;Помимо обмена данными с устройствами, сервер производит запись информации. Это разделы <a href="#charts" style="color:red; cursor: pointer;">Графики</a> и <a href="#events" style="color:red; cursor: pointer;">Архив событий</a> интерфейса. В разделе Графики выводится информация с датчиков контроля, а в разделе Архив событий осуществляется запись событий объекта контроля. Вся записанная информация может быть выведена на печать в PDF-формате.<br>\n&emsp;Следующей важной функцией интерфейса есть раздел <a href="#visualization" style="color:red; cursor: pointer;">Визуализация</a>, где представлена мнемосхема устройства или объекта, на которую выводится вся информация контроля и элементы управления объекта. Это наглядная и удобная функция для мгновенной оценки состояния объекта.<br>\n&emsp;Для просмотра всех устройств и всех их параметров существует раздел <a href="#all" style="color:red; cursor: pointer;">ВСЕ</a> расположенный в первой строчке левого меню.<br>\n&emsp;И наконец, функция Сигнализация проинформирует о чрезвычайном событии на почту или СМС-сообщением на мобильный телефон. Это может быть любое событие, о котором надо знать незамедлительно, чтобы вовремя принять меры.<br>\n&emsp;Ниже представлено описание каждого функционального состояния и показаны скриншоты экранов интерфейса:</p>	funkcional/no_image.jpg	0		2019-12-12 22:30:49.742821+03	f					Функционал
7	Контроль	control	Раздел Контроль	Пример экрана объекта "Партер"	&emsp;Знакомство с интерфейсом сервера Comaex начнем на примере страницы «Контроль». В левой стороне экрана распологается меню, где первой строкой есть ссылка на страницу «ВСЕ», на которой выводятся все наблюдаемые параметры всех устройств. Ниже следует список категорий объектов, которые объединяют наблюдаемые сервером устройства. Цветные кружочки, слева от устройств/объектов показывают их актуальное состояние: зеленый – нет аварий, желтый – предупреждение, красный – авария.\r\n&emsp;Кликнув на вкладку «Контроль» происходит переход на указанную страницу, на которой выводится таблица значений контролируемых параметров. Обновление информации происходит с интервалом 2-5 секунд.	<p>&emsp;Знакомство с интерфейсом сервера Comaex начнем на примере страницы «Контроль». В левой стороне экрана распологается меню, где первой строкой есть ссылка на страницу «ВСЕ», на которой выводятся все наблюдаемые параметры всех устройств. Ниже следует список категорий объектов, которые объединяют наблюдаемые сервером устройства. Цветные кружочки, слева от устройств/объектов показывают их актуальное состояние: зеленый – нет аварий, желтый – предупреждение, красный – авария.\n&emsp;Кликнув на вкладку «Контроль» происходит переход на указанную страницу, на которой выводится таблица значений контролируемых параметров. Обновление информации происходит с интервалом 2-5 секунд.</p>	control/control_2.jpg	0		2019-12-12 22:35:28.65235+03	f	blue		fa fa-thermometer-full		Функционал картинки
8	Управление	management	Раздел Управление	Пример экрана объекта "Рекуператор"	&emsp;Выбрав в левом меню нужное устройство и кликнув по вкладке «Управление» происходит переход на эту страницу. Здесь можно послать выбранную команду на устройство «Рекуператор» (выделено синим в меню устройств) кликнув по полю «Изменить».\r\n&emsp;После подтвержденной отправки команды состояние изменится на противоположное.	<p>&emsp;Выбрав в левом меню нужное устройство и кликнув по вкладке «Управление» происходит переход на эту страницу. Здесь можно послать выбранную команду на устройство «Рекуператор» (выделено синим в меню устройств) кликнув по полю «Изменить».\n&emsp;После подтвержденной отправки команды состояние изменится на противоположное.</p>	management/management_1.jpg	0		2019-12-12 22:38:22.853435+03	f	blue		fa fa-toggle-on		Функционал картинки
9	Уставки	setpoint	Раздел Уставки	Пример экрана объекта "Партер"	&emsp;Страница «Уставки» предназначена для изменения параметров, которые необходимо внести в выбранное устройство. Дополнительно страница содержит селектор выбора шага изменения значения – «интервал счета».\r\n&emsp;После введения нового значения необходимо его подтвердить, кликнув по полю «подтвердить».	<p>&emsp;Страница «Уставки» предназначена для изменения параметров, которые необходимо внести в выбранное устройство. Дополнительно страница содержит селектор выбора шага изменения значения – «интервал счета».\n&emsp;После введения нового значения необходимо его подтвердить, кликнув по полю «подтвердить».</p>	setpoint/setpoints_1.jpg	0		2019-12-12 22:40:31.937647+03	f	blue		fa fa-sliders		Функционал картинки
10	Аварии	alarms	Раздел Аварии	Пример экрана объекта "Рекуператор"	&emsp; Кликнув по вкладке «Аварии» происходит переход на данную страницу. Здесь выводится список аварий по выбранному устройству/объекту. Их состояния обновляются с интервалом 2 секунды.	<p>&emsp; Кликнув по вкладке «Аварии» происходит переход на данную страницу. Здесь выводится список аварий по выбранному устройству/объекту. Их состояния обновляются с интервалом 2 секунды.</p>	alarms/alarms_1.jpg	0		2019-12-12 22:42:53.197722+03	f	blue		fa fa-bell-o		Функционал картинки
12	Архив событий	events	Раздел Архив событий	Пример экрана объекта "Рекуператор".	&emsp;Страница «Архив событий» показывает аварии и события, произошедшие с выбранным объектом/устройством. Аварии обозначаются первыми буквами индекса «AL», события - «EV». Показанная на экране страница может быть распечатана, для чего необходимо кликнуть кнопку «PDF».	<p>&emsp;Страница «Архив событий» показывает аварии и события, произошедшие с выбранным объектом/устройством. Аварии обозначаются первыми буквами индекса «AL», события - «EV». Показанная на экране страница может быть распечатана, для чего необходимо кликнуть кнопку «PDF».</p>	events/events_1.jpg	0		2019-12-12 22:47:37.782215+03	f	blue		fa fa-archive		Функционал картинки
11	Графики	charts	Раздел Графики	Пример экрана объекта "Рекуператор". Режим стандартного вывода.	&emsp;Страница «Графики» отображает график выбранного параметра устройства/объекта. Страница имеет обширный интерфейс в виде многочисленных настроек и опций.\r\n&emsp;На данном скриншоте показан стандартный вывод графика параметра «Темература подачи, С»  виде линии, 20 точек данных с интервалом 10 секунд.	<p>&emsp;Страница «Графики» отображает график выбранного параметра устройства/объекта. Страница имеет обширный интерфейс в виде многочисленных настроек и опций.\n&emsp;На данном скриншоте показан стандартный вывод графика параметра «Темература подачи, С»  виде линии, 20 точек данных с интервалом 10 секунд.</p>	charts/charts_1.jpg	0		2019-12-12 22:45:04.331126+03	f	blue		fa fa-area-chart		Функционал картинки
13	Визуализация	visualization	Раздел Визуализация	Пример экрана объекта "Рекуператор".	&emsp;Страница «Визуализация» выводит схематическое изображение устройства/объекта со всеми необходимыми значениями и состояниями. Такая обобщенная информация очень удобна для наблюдения и отладки. Ниже поля изображения располагается область аварий - где в случае аварии появляется соответствующее сообщение, далее следует поле управления – здесь можно включить/выключить какое-либо состояние, и наконец, замыкает страницу поле уставок – здесь можно послать на устройство команду с новым значением.	<p>&emsp;Страница «Визуализация» выводит схематическое изображение устройства/объекта со всеми необходимыми значениями и состояниями. Такая обобщенная информация очень удобна для наблюдения и отладки. Ниже поля изображения располагается область аварий - где в случае аварии появляется соответствующее сообщение, далее следует поле управления – здесь можно включить/выключить какое-либо состояние, и наконец, замыкает страницу поле уставок – здесь можно послать на устройство команду с новым значением.</p>	visualization/vizualization_1.jpg	0		2019-12-12 22:50:11.376077+03	f	blue		fa fa-eye		Функционал картинки
14	ВСЕ	all	Раздел ВСЕ		&emsp;Страница «ВСЕ» выводит полный список всех устройств/объектов в виде таблицы параметров всех значений и состояний. Порядок вывода категорий и их объектов/устройств соответствует порядку меню. Интервал обновления данных – 2-5 секунд. \r\n&emsp;На данном скриншоте показано лишь начало страницы «ВСЕ».	<p>&emsp;Страница «ВСЕ» выводит полный список всех устройств/объектов в виде таблицы параметров всех значений и состояний. Порядок вывода категорий и их объектов/устройств соответствует порядку меню. Интервал обновления данных – 2-5 секунд. \n&emsp;На данном скриншоте показано лишь начало страницы «ВСЕ».</p>	all/all_1.jpg	0		2019-12-12 23:05:13.45636+03	f	blue		fa fa-list-alt		Функционал картинки
15	Применение	primenenie			&emsp;Сервер Comaex является супервизорской системой, то есть  устройством, которое подключается к контроллерам управления оборудованием для осуществления надзорных функций и расширения их возможностей, среди которых:<ul style="font-style: italic;"> <li>удаленный контроль и управление устройствами, как в локальной зоне, так и далеко за ее пределами посредством интернета;</li><li>запись информации;</li><li>формирование отчетов;</li><li>сигнализация состояний;</li><li>визуализации объектов;</li><li>объединение устройств в группы и категории.</li></ul>&emsp;Преимуществами сервера Comaex есть его компактность, высокая производительность, низкая цена, простота обслуживания и быстрый ввод в эксплуатацию. \r\n&emsp;Помотреть реальный образец в работе можно тут: <a href="http://comaex.ddns.net" style="color:red; cursor:pointer;" target="_blank">Comaex Demo</a>. Если у вас нет данных входа, запросите их через<a href="#contact" style="color:red; cursor: pointer;"> Контакты</a>.\r\n&emsp;Наиболее распространенные области применения сервера Comaex:	<p>&emsp;Сервер Comaex является супервизорской системой, то есть  устройством, которое подключается к контроллерам управления оборудованием для осуществления надзорных функций и расширения их возможностей, среди которых:<ul style="font-style: italic;"> <li>удаленный контроль и управление устройствами, как в локальной зоне, так и далеко за ее пределами посредством интернета;</li><li>запись информации;</li><li>формирование отчетов;</li><li>сигнализация состояний;</li><li>визуализации объектов;</li><li>объединение устройств в группы и категории.</li></ul>&emsp;Преимуществами сервера Comaex есть его компактность, высокая производительность, низкая цена, простота обслуживания и быстрый ввод в эксплуатацию. \n&emsp;Помотреть реальный образец в работе можно тут: <a href="http://comaex.ddns.net" style="color:red; cursor:pointer;" target="_blank">Comaex Demo</a>. Если у вас нет данных входа, запросите их через<a href="#contact" style="color:red; cursor: pointer;"> Контакты</a>.\n&emsp;Наиболее распространенные области применения сервера Comaex:</p>	primenenie/no_image.jpg	0		2019-12-12 23:30:30.345429+03	f					Применение
16	Системы HVAC	primenenie-kartinki			&emsp;Это направление климатических систем – отопление, вентиляция, кондиционирование. Очень востребованная область для применения супервизорских технологий, поскольку любой коммерческий или промышленный объект от подвала до крыши укомплектован HVAC оборудованием, которое необходимо контролировать. Данная технология называется диспетчеризацией объекта. Сервер Comaex прекрасно подходит для этой цели, поскольку любое HVAC оборудование имеет контроллеры управления со своим стандартным ПО, для множества которого у Comaex есть готовые шаблоны и мнемосхемы визуализаций.	<p>&emsp;Это направление климатических систем – отопление, вентиляция, кондиционирование. Очень востребованная область для применения супервизорских технологий, поскольку любой коммерческий или промышленный объект от подвала до крыши укомплектован HVAC оборудованием, которое необходимо контролировать. Данная технология называется диспетчеризацией объекта. Сервер Comaex прекрасно подходит для этой цели, поскольку любое HVAC оборудование имеет контроллеры управления со своим стандартным ПО, для множества которого у Comaex есть готовые шаблоны и мнемосхемы визуализаций.</p>	primenenie-kartinki/app1_v4E38r0.jpg	0		2019-12-12 23:31:51.878896+03	f					Применение картинки
17	Умный дом	primenenie-kartinki			&emsp;Контроль за безопасностью, климатом и возможностью управлять инженерными системами жилища находит в последнее время все больший интерес. Сервер Comaex способен полностью обеспечить эту возможность, поскольку он может обмениваться данными с любыми контроллерами управления. Кроме того, готовые шаблоны конфигураций сложных устройств, таких как вентиляционное и отопительное оборудование, а также мнемосхемы для них уже имеются в репозиториях сервера. Это значительно облегчает и ускоряет создание умного дома.	<p>&emsp;Контроль за безопасностью, климатом и возможностью управлять инженерными системами жилища находит в последнее время все больший интерес. Сервер Comaex способен полностью обеспечить эту возможность, поскольку он может обмениваться данными с любыми контроллерами управления. Кроме того, готовые шаблоны конфигураций сложных устройств, таких как вентиляционное и отопительное оборудование, а также мнемосхемы для них уже имеются в репозиториях сервера. Это значительно облегчает и ускоряет создание умного дома.</p>	primenenie-kartinki/app2_VhNOBSy.jpg	0		2019-12-12 23:32:49.719611+03	f					Применение картинки
18	Интернет объектов	primenenie-kartinki			&emsp;Новое направление в цифровом мире, где главной идеей есть обеспечение любого электронного устройства выходом в глобальный интернет. Технология находит практическое применение в областях получения данных от различных датчиков и счетчиков. Имеет большой потенциал роста, но сдерживается естественным препятствием в виде исчерпания IP адресов протокола ipv4. Поэтому передача данных на устройства IoT сопряжены со сложностями, так как для этого каждое устройство должно иметь свой индивидуальный IP адрес. Comaex может решить эту проблему, поскольку физически является хабом – он имеет один внешний IP адрес взаимодействующий с сотнями внутренних устройств в обоих направлениях.	<p>&emsp;Новое направление в цифровом мире, где главной идеей есть обеспечение любого электронного устройства выходом в глобальный интернет. Технология находит практическое применение в областях получения данных от различных датчиков и счетчиков. Имеет большой потенциал роста, но сдерживается естественным препятствием в виде исчерпания IP адресов протокола ipv4. Поэтому передача данных на устройства IoT сопряжены со сложностями, так как для этого каждое устройство должно иметь свой индивидуальный IP адрес. Comaex может решить эту проблему, поскольку физически является хабом – он имеет один внешний IP адрес взаимодействующий с сотнями внутренних устройств в обоих направлениях.</p>	primenenie-kartinki/app3_ndEHkhg.jpg	0		2019-12-12 23:33:34.412612+03	f					Применение картинки
5	Супервизор-сервер Comaex	o-comaex			&emsp;Сервер Comaex - система контроля и управления уровня супервизор  для систем HVAC, умного дома и интернета объектов. Представляет собой <a onclick="document.getElementById('id01').style.display='block'" style="color:red; cursor: pointer;">компактное устройство</a>,  предназначенное для подключения к контроллерам:<ul style="font-style: italic;"><li> управления светом;</li><li>управления различными приводами - жалюзи или замков к примеру;</li><li>передачи данных с разнообразных датчиков – движения, температуры, влажности, давления и т.п.;</li><li>передачи информации со счетчиков ресурсов – воды, газа, электроэнергии;</li><li>управления сложным инженерным оборудованием – вентмашинами, тепловыми пунктами, бойлерами и другим устройствам с микропроцессорным управлением.</li></ul>&emsp;Обмен данными с контроллерами происходит по протоколу Modbus RTU, к устройствам контроля сервер может подключаться посредством кабеля или беспроводным способом - с помощью <a onclick="document.getElementById('id02').style.display='block'" style="color:red; cursor: pointer;">радиомодуля</a>. <br><p>&emsp;Ввод параметров конфигурации устройств объекта производится вручную через панель администратора либо загрузкой специального xls-файла. Данный файл является шаблоном ввода данных и позволяет в считанные минуты запустить супервизор-сервер в работу. Вместе с файлом конфигурации вносятся мнемосхемы объектов для создания страниц визуализации. После ввода этих данных формируется автоматический интерфейс управления объекта и сервер готов к работе.<br>\r\n&emsp;Интерфейс управления становится доступен на компьютере, смартфоне либо планшете. При этом возможна работа устройства, как в локальной Wi-Fi сети объекта, так и с глобального Интернета.<br>\r\n&emsp;Сервер имеет производительность до 1000 точек данных и до 20 слейв-устройств, что более чем достаточно для большинства объектов. Помотреть реальный образец в работе можно тут: <a href="http://comaex.ddns.net" style="color:red; cursor:pointer;" target="_blank">Comaex Demo</a>. Если у вас нет данных входа, запросите их через<a href="#contact" style="color:red; cursor: pointer;"> Контакты</a>.</p>	<p>&emsp;Сервер Comaex - система контроля и управления уровня супервизор  для систем HVAC, умного дома и интернета объектов. Представляет собой <a onclick="document.getElementById('id01').style.display='block'" style="color:red; cursor: pointer;">компактное устройство</a>,  предназначенное для подключения к контроллерам:<ul style="font-style: italic;"><li> управления светом;</li><li>управления различными приводами - жалюзи или замков к примеру;</li><li>передачи данных с разнообразных датчиков – движения, температуры, влажности, давления и т.п.;</li><li>передачи информации со счетчиков ресурсов – воды, газа, электроэнергии;</li><li>управления сложным инженерным оборудованием – вентмашинами, тепловыми пунктами, бойлерами и другим устройствам с микропроцессорным управлением.</li></ul>&emsp;Обмен данными с контроллерами происходит по протоколу Modbus RTU, к устройствам контроля сервер может подключаться посредством кабеля или беспроводным способом - с помощью <a onclick="document.getElementById('id02').style.display='block'" style="color:red; cursor: pointer;">радиомодуля</a>. <br><p>&emsp;Ввод параметров конфигурации устройств объекта производится вручную через панель администратора либо загрузкой специального xls-файла. Данный файл является шаблоном ввода данных и позволяет в считанные минуты запустить супервизор-сервер в работу. Вместе с файлом конфигурации вносятся мнемосхемы объектов для создания страниц визуализации. После ввода этих данных формируется автоматический интерфейс управления объекта и сервер готов к работе.<br>\n&emsp;Интерфейс управления становится доступен на компьютере, смартфоне либо планшете. При этом возможна работа устройства, как в локальной Wi-Fi сети объекта, так и с глобального Интернета.<br>\n&emsp;Сервер имеет производительность до 1000 точек данных и до 20 слейв-устройств, что более чем достаточно для большинства объектов. Помотреть реальный образец в работе можно тут: <a href="http://comaex.ddns.net" style="color:red; cursor:pointer;" target="_blank">Comaex Demo</a>. Если у вас нет данных входа, запросите их через<a href="#contact" style="color:red; cursor: pointer;"> Контакты</a>.</p></p>	o-comaex/no_image.jpg	0		2019-12-12 22:28:37.814303+03	f					О Comaex
\.


--
-- Name: base_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.base_base_id_seq', 18, true);


--
-- Data for Name: base_image; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.base_image (id, image, slug, title, sentence, description, name_id, desc_html, urllink, data1, data2) FROM stdin;
1	o-comaex/Mini_PC_1_SIzKpNf.png	o-comaex	Супервизор-сервер Comaex	Технические характеристики:	- Процессор: Intel Dual Core i5-4200Y \r\n- ОЗУ: RAM4GB \r\n- ПЗУ: SSD30GB \r\n- Интерфейс: 4*USB3.0, 2*USB2.0, 1000Mbps BaseT LAN, 802.11 b/g/n WiFi \r\n- Тип корпуса: алюминиевый теплоотводящий \r\n- Размеры: 133x124x40 мм	5	<ul>\n<li>Процессор: Intel Dual Core i5-4200Y </li>\n<li>ОЗУ: RAM4GB </li>\n<li>ПЗУ: SSD30GB </li>\n<li>Интерфейс: 4<em>USB3.0, 2</em>USB2.0, 1000Mbps BaseT LAN, 802.11 b/g/n WiFi </li>\n<li>Тип корпуса: алюминиевый теплоотводящий </li>\n<li>Размеры: 133x124x40 мм</li>\n</ul>			
2	o-comaex/E800_DTU_0nMONu1.png	o-comaex	Радиомодуль E800-DTU	Технические характеристики:	- Рабочая частота: 433 МГц\r\n- Мощность передатчика: 30 дБм\r\n- Скорость передачи: 1,2-115,2 кбит/сек\r\n- тип антенны: SMA-K\r\n- комм.интерфейс : RS232/RS485\r\n- дальность связи: 2500 м\r\n- размеры: 66х66х21 мм	5	<ul>\n<li>Рабочая частота: 433 МГц</li>\n<li>Мощность передатчика: 30 дБм</li>\n<li>Скорость передачи: 1,2-115,2 кбит/сек</li>\n<li>тип антенны: SMA-K</li>\n<li>комм.интерфейс : RS232/RS485</li>\n<li>дальность связи: 2500 м</li>\n<li>размеры: 66х66х21 мм</li>\n</ul>			
3	visualization/vizualization_3.jpg	visualization		Пример экрана объекта "Партер".	&emsp;На этом скриншоте показан пример объекта «Партер» со следующим функционалом: \r\n&emsp;&emsp;- температура, влажность, счетчики электричества, газа, холодной и горячей воды (значение), \r\n&emsp;&emsp;- датчики движения, сенсоры дыма, огня (событие), \r\n&emsp;&emsp;- жалюзи, замки дверей, освещение (управление), \r\n&emsp;&emsp;- температура, влажность (уставки)	13	<p>&emsp;На этом скриншоте показан пример объекта «Партер» со следующим функционалом: \n&emsp;&emsp;- температура, влажность, счетчики электричества, газа, холодной и горячей воды (значение), \n&emsp;&emsp;- датчики движения, сенсоры дыма, огня (событие), \n&emsp;&emsp;- жалюзи, замки дверей, освещение (управление), \n&emsp;&emsp;- температура, влажность (уставки)</p>			
4	charts/charts_2.jpg	charts		Пример экрана объекта "Рекуператор". Режим вывода таблицы значений.	&emsp;На данном скриншоте показан вывод таблицы значений выбранного параметра. Вывод таблицы возможен как в статическом режиме так в динамическом режиме «REAL TIME».	11	<p>&emsp;На данном скриншоте показан вывод таблицы значений выбранного параметра. Вывод таблицы возможен как в статическом режиме так в динамическом режиме «REAL TIME».</p>			
5	charts/charts_3.jpg	charts		Пример экрана объекта "Рекуператор". Режим наложения графиков.	&emsp;На этом скриншоте выведены три графика в режиме наложения друг на друга. К основному графику можно добавить  до 2-ух дополнительных параметров только при условии равных интервалов записи.	11	<p>&emsp;На этом скриншоте выведены три графика в режиме наложения друг на друга. К основному графику можно добавить  до 2-ух дополнительных параметров только при условии равных интервалов записи.</p>			
\.


--
-- Name: base_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.base_image_id_seq', 5, true);


--
-- Data for Name: base_menu; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.base_menu (id, title, slug, mark, fafa, color) FROM stdin;
4	Инфо	info	0		
3	Применение	application	0		
1	О Comaex	#about	0		
2	Функционал	#specification	0		
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
6	Применение картинки	#application_images	0			Применение
5	Применение	#application	1			Применение
10	Контакты	#contact	1			Инфо
11	Новости	#news	0			Инфо
7	Портфолио	portfolio	0			Применение
8	Стоимость	price	0			Применение
9	Стоимость картинки	price_images	0			Применение
\.


--
-- Name: base_submenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.base_submenu_id_seq', 11, true);


--
-- Data for Name: clients_clients; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.clients_clients (company, email, phone, about, area, persons, created, enable_mailing, interested, flag, category, counter, uuid, error_mailing, file, slug, address, email2, filepath, preorder, language, last_post, bid, count, country) FROM stdin;
OVERHEAD DOOR COMPANY	bmtsales@theoverheaddoor.com	(409) 866-2535	The Overhead Door Company of Beaumont™ has proudly served Beaumont and surrounding communities for almost 75 years. Though founded in the 1940s, Buford Coe, a veteran of World War II, established The Overhead Door Company of Beaumont™’s current identity when he took over the distributorship in April 1963 at the invitation of The Overhead Door™ Corporation...	manufacture		2019-12-24 23:19:39.610654+03	t	f	f	HVAC	0	f4cdf359-8de0-47b5-bb1f-af2f285a44c9			overhead-door-company	1547 Main Ln\nBeaumont, TX 77713	\N		f	RU	\N	0	0	USA
Entrematic/Amarr	marketing@amarr.com	800-503-DOOR (3667)	A full line of quality residential and commercial doors in wood and steel. Product line also includes carriage house doors, operators, springs, hardware, and special track applications.	manufacture		2019-12-24 23:19:39.763592+03	t	f	f	HVAC	0	48ac51d6-f6dd-433f-873c-0536b2728af3			entrematicamarr	165 Carriage CourtWinston-Salem, NC 27105	\N		f	RU	\N	0	0	USA
TNR Industrial Doors Inc.	info@tnrdoors.com	705-795-9968	High performance doors.	manufacture		2019-12-24 23:19:39.851656+03	t	f	f	HVAC	0	03dac85a-522e-4ced-8f28-c4aadfa72cad			tnr-industrial-doors-inc	200 Fairview Road, Unite #2Barrie, OntarioCanada, L4N 8X8	\N		f	RU	\N	0	0	USA
Hörmann LLC	info@hormann.us	630-859-3000	Complete line of commercial and residential sectional overhead garage doors	manufacture		2019-12-24 23:19:39.86258+03	t	f	f	HVAC	0	71ef83e4-1ec1-4cbf-a147-22c7eee12e73			hörmann-llc	5050 Baseline RoadMontgomery, IL 60538-1125	\N		f	RU	\N	0	0	USA
Raynor Garage Doors	thegarage@raynor.com	888-598-4790	Since 1944, Raynor Garage Doors has been an industry leader as a family-owned garage door manufacturing company located in Dixon, IL. With over 800 distributors in the United States, 190 in Canada, and 60 distributors in 50 countries on 5 continents, Raynor proudly manufactures a full line of residential garage doors and commercial doors, industrial, agricultural, and loading dock doors.	manufacture		2019-12-24 23:19:39.874284+03	t	f	f	SFUGD	0	5c4ff9b4-7231-4104-b96e-08ede8ad6505			raynor-garage-doors	P.O. Box 448\n1101 East River Road\nDixon, IL 61021-0448 USA	\N		f	EN	\N	0	0	USA
Northwest Door	jsiegel@northwestdoor.com	800-233-9352	We manufacture sectional garage doors in steel, wood and aluminum for both residential and commercial applications, and have the largest selection of styles, models, sizes and materials in the industry. This is in addition to producing custom built garage doors to meet architectural specifications. Our “carriage house” garage doors replicate historic swing-type and side-folding doors. Both our carriage house style and traditional style garage doors are available in a variety of materials and configurations.	manufacture		2019-12-24 23:19:39.88549+03	t	f	f	SFUGD	0	963d44ee-e7bb-41c9-ad60-a119b4237ab1			northwest-door	North 3808 Sullivan Rd, Bldg N-7 #3Spokane, WA 99216-1611	\N		f	EN	\N	0	0	USA
\nAirlift Doors Inc.	info@airliftdoors.com	888-368-4403	COMMERCIAL DOORS, OPENERS, HEATERS	manufacture		2019-12-24 23:19:39.895341+03	t	f	f	HVAC	0	064c2383-dafb-413a-add9-4b379ef5254a			airlift-doors-inc	4700 Osseo Road\nMinneapolis, MN 55430	\N		f	EN	\N	0	0	USA
Northwest Door	rrussell@northwestdoor.com	866-269-3667	We manufacture sectional garage doors in steel, wood and aluminum for both residential and commercial applications, and have the largest selection of styles, models, sizes and materials in the industry. This is in addition to producing custom built garage doors to meet architectural specifications. Our “carriage house” garage doors replicate historic swing-type and side-folding doors. Both our carriage house style and traditional style garage doors are available in a variety of materials and configurations.	manufacture		2019-12-24 23:19:39.907516+03	t	f	f	SFUGD	0	71a9af43-3070-423f-82e8-c8b1cdff5c33			northwest-door	2620 SE Mailwell DriveMilwaukie, OR 97222-7316	\N		f	EN	\N	0	0	USA
OVERHEAD DOOR COMPANY OF DALLAS	websales@dallasdoors.com	(972)416-7100	Welcome to Overhead Door Company of Dallas/Fort Worth™. We install and repair residential garage doors, commercial garage doors, and garage door openers and accessories. We are proud to offer the highest quality products and best service in the industry. Our highly trained and experienced service department services all brands of overhead doors.	manufacture		2019-12-24 23:19:39.917746+03	t	f	f	HVAC	0	c0ba28f2-192e-49cb-8fe2-dbd2c69d90a3			overhead-door-company-of-dallas	1800 Vantage Drive\nCarrollton, TX 75006	\N		f	EN	\N	0	0	USA
Innotech	innotech@yandex.ru	+7(985)4828588		manufacture	Facking Facker	2019-12-24 23:19:39.928475+03	t	f	f	SFUGD	0	64086d97-17d7-47e0-ae93-52d3796d81d7			innotech	Innotech	innotech@yandex.ru		f	EN	\N	0	0	Russia
Overhead Door of Columbia	info@ohdcolumbia.com	(803) 768-4682	You won’t find his name in history books, but Overhead Door Corporation’s founder, C. G. Johnson, invented the upward-lifting garage door in 1921 and the electric garage door opener in 1926. For nearly 90 years, the Overhead Door brand has stood for product quality and expertise, as well as professional service.	manufacture		2019-12-24 23:19:39.974979+03	t	f	f	HVAC	0	2a19c521-8a31-4e7d-a39c-01db99c13713			overhead-door-of-columbia	313 Rabon Road\nColumbia, SC 29223	\N		f	EN	\N	0	0	USA
CornellCookson	cornell@cornelliron.com	800-233-8366	Rolling steel service and fire doors, security grilles, counter shutters, and side folding closures	manufacture		2019-12-24 23:19:39.983996+03	t	f	f	HVAC	0	a2eccbbd-da70-4d70-ba78-ee018bb714ae			cornellcookson	24 Elmwood AveMountaintop, PA	\N		f	RU	\N	0	0	USA
Computer LTD	chim73@mail.ru	+7(985)4828588		manufacture	Facking Facker	2019-12-24 23:19:39.99475+03	t	f	f	HVAC	0	113fc6a4-e918-46ef-8ca6-357db583d905			computer-ltd	Computer LTD	chim73@mail.ru		f	RU	\N	0	0	Russia
Rytec Corporation	info@rytecdoors.com	262-677-9046	Rytec Corporation is a leading U.S. manufacturer of high-performance rolling, folding and sliding doors for industrial, commercial, cold storage, food processing and pharmaceutical applications. Rytec's innovations help provide customers with durable and effective door solutions.	manufacture		2019-12-24 23:19:40.005625+03	t	f	f	HVAC	0	d22cff8c-9cfb-455f-854d-4f0c0a205d1e			rytec-corporation	One Cedar ParkwayJackson, Wisconsin 53037	\N		f	RU	\N	0	0	USA
MIDLAND GARAGE DOORS	scottr@midlandgaragedoor.com	800.437.4056	For over 40 years, Midland has been manufacturing the longest-lasting, smoothest-running residential and commercial overhead garage doors. We are a proud Midwest company built on the tradition of making products that dealers love to install and customers love to own.	manufacture		2019-12-24 23:19:40.01652+03	t	f	f	SFUGD	0	a8f145c8-e1a8-4aac-9e54-43c4015c3ab6			midland-garage-doors	675 12th Ave NE West Fargo, ND 58078	\N		f	EN	\N	0	0	USA
ГК РОВЕН	msk@rowen.ru	+7 (495) 646-23-90	ГК РОВЕН — ведущий российский производитель и надежный поставщик вентиляционного оборудования.\nКомпания РОВЕН предлагает эффективные решения для создания микроклимата в помещениях различного типа с 2002 года.	manufacture		2019-12-24 23:19:40.028105+03	t	f	f	HVAC	0	434826c5-1a7a-46a7-8f5c-41bc3e908d83			гк-ровен	г. Москва,ул. Южнопортовая,д.7 стр.7 оф. 403	\N		f	RU	\N	0	0	Russia
Northwest Door	snaccarato@northwestdoor.com	661-772-0051	We manufacture sectional garage doors in steel, wood and aluminum for both residential and commercial applications, and have the largest selection of styles, models, sizes and materials in the industry. This is in addition to producing custom built garage doors to meet architectural specifications. Our “carriage house” garage doors replicate historic swing-type and side-folding doors. Both our carriage house style and traditional style garage doors are available in a variety of materials and configurations.	manufacture		2019-12-24 23:19:40.039301+03	t	f	f	SFUGD	0	00f6fd1a-e2a1-4c40-a552-1bb1856e495f			northwest-door	3206 Pegasus Drive\nBakersfield, CA 93308-6840	\N		f	EN	\N	0	0	USA
OVERHEAD DOOR COMPANY	lcsales@theoverheaddoor.com	(337) 625-4117	The Overhead Door Company of Beaumont™ has proudly served Beaumont and surrounding communities for almost 75 years. Though founded in the 1940s, Buford Coe, a veteran of World War II, established The Overhead Door Company of Beaumont™’s current identity when he took over the distributorship in April 1963 at the invitation of The Overhead Door™ Corporation...	manufacture		2019-12-24 23:19:40.05275+03	t	f	f	HVAC	0	c2dfb9f9-69ff-4761-8385-0997947f140f			overhead-door-company	2707 E Napoleon St\nSulphur, LA 70663	\N		f	EN	\N	0	0	USA
Lawrence Roll-Up Doors, Inc.	info@lawrencedoors.com	(626) 869-0837	Rolling service doors, fire doors, counter doors, grilles, motor operators, high performance doors & grilles, and side-folding closure products.	manufacture		2019-12-24 23:19:40.075252+03	t	f	f	HVAC	0	6e8713f7-7c9e-4b4f-beaf-7a701a2c73ec			lawrence-roll-up-doors-inc	4525 Littlejohn StreetBaldwin Park, CA 91706	\N		f	RU	\N	0	0	USA
Entrematic/Dynaco	dynaco@dynacodoor.us	847-562-4910	High Performance automatic industrial doors.	manufacture		2019-12-24 23:19:40.083745+03	t	f	f	HVAC	0	66462be9-989d-458c-a20d-dcd84577582a			entrematicdynaco	935 Campus DriveMundelein, IL 60060	\N		f	RU	\N	0	0	USA
Delden Mfg	sales@deldenmfg.com	1.800.821.3708	Today, Delden has over 100 employees and five branches throughout the Midwest. Door center locations include Kansas City, St. Louis, Springfield and Osage Beach in Missouri and Des Moines, IA. Gene Renner credited his earlier success to his management team and expressed confidence that Delden has a strong management team for the future. Gene is fondly remembered as the “core of the company."	manufacture		2019-12-24 23:19:40.094456+03	t	f	f	SFUGD	0	56518356-065e-4038-aae7-79a3bf3a18a0			delden-mfg	3530 N. Kimball Dr.\nKansas City, MO 64161	\N		f	EN	\N	0	0	USA
Overhead Door Corporation	info@overheaddoor.com	800/929-2553	Residential garage doors and automatic openers, commercial sectional doors, rolling steel and high speed fabric industrial doors, automatic gate openers, commercial-industrial upward-acting door openers, Thermacore insulated residential and commercial doors and Genie residential garage door openers and accessories.	manufacture		2019-12-24 23:19:40.106218+03	t	f	f	HVAC	0	53029ab2-daf6-4789-8981-8fc77b1570e6			overhead-door-corporation	2501 South State Highway 121Lewisville, TX 75067	\N		f	RU	\N	0	0	USA
Northwest Door	jfry@northwestdoor.com	208-463-7639	We manufacture sectional garage doors in steel, wood and aluminum for both residential and commercial applications, and have the largest selection of styles, models, sizes and materials in the industry. This is in addition to producing custom built garage doors to meet architectural specifications. Our “carriage house” garage doors replicate historic swing-type and side-folding doors. Both our carriage house style and traditional style garage doors are available in a variety of materials and configurations.	manufacture		2019-12-24 23:19:40.117294+03	t	f	f	SFUGD	0	9825a35c-a3d9-4b39-a41c-0f958374e371			northwest-door	331 NW 13th Place, Suite 120Meridian, ID 83642-4684	\N		f	EN	\N	0	0	USA
Overhead Door Company of Mason City	dennis.reidel@overheaddoormasoncity.com	641-424-4114	You won't find his name in history books, but Overhead Door Corporation’s founder, C. G. Johnson, invented the upward-lifting garage door in 1921 and the electric garage door opener in 1926. For nearly 90 years, the Overhead Door brand has stood for product quality and expertise, as well as professional service.	manufacture		2019-12-24 23:19:40.127663+03	t	f	f	HVAC	0	62bf997a-e8c2-4d68-a1c8-e4dd2816d08f			overhead-door-company-of-mason-city	225 18th Street SE\nPO Box 710\nMason City, IA 50402	\N		f	EN	\N	0	0	USA
MIDLAND GARAGE DOORS	charliek@midlandgaragedoor.com	800.521.0047	For over 40 years, Midland has been manufacturing the longest-lasting, smoothest-running residential and commercial overhead garage doors. We are a proud Midwest company built on the tradition of making products that dealers love to install and customers love to own.	manufacture		2019-12-24 23:19:40.139386+03	t	f	f	SFUGD	0	0bcd1fad-05db-4b3d-ae11-a522a15d08e4			midland-garage-doors	6775 Shady Oak Road Eden Prairie, MN 55344	\N		f	EN	\N	0	0	USA
Wayne Dalton	info@wayne-dalton.com	800.827.3667	Since its inception in 1954, Wayne Dalton has become known as a company with innovative ideas which far exceed industry standards. Often, Wayne Dalton is the only source for the latest garage door and garage door opener features. Because the company has always maintained a staunch commitment to developing innovative new products, Wayne Dalton is now a world leader in the garage door industry.	manufacture		2019-12-24 23:19:40.150104+03	t	f	f	HVAC	0	c19251cb-7a33-4a07-b354-c322ed5b1cb1			wayne-dalton	2501 S. State Hwy. 121 Business\nLewisville, TX 75067	\N		f	RU	\N	0	0	USA
C.H.I. Overhead Doors	chiohd@chiohd.com	800-677-2650	Residential and commercial steel garage doors and rolling steel doors.	manufacture		2019-12-24 23:19:40.160283+03	t	f	f	HVAC	0	3602a938-bbf7-4ecd-b40f-45de1ecdd469			chi-overhead-doors	1485 Sunrise Drive\nP.O. Box 260\nArthur, IL 61911	\N		f	EN	\N	0	0	USA
GVA008	gva008@gmail.com	+7(985)4828588		manufacture	Mike	2019-12-24 23:19:40.174976+03	t	f	f	HVAC	0	284b95e1-7727-47bc-ae7b-7e95a594a12a			gva008	Москва, Сиреневый бульвар 32	gva008@gmail.com		f	EN	\N	0	0	Russia
OVERHEAD DOOR COMPANY	centralsales@theoverheaddoor.com	(512) 595-3667	The Overhead Door Company of Beaumont™ has proudly served Beaumont and surrounding communities for almost 75 years. Though founded in the 1940s, Buford Coe, a veteran of World War II, established The Overhead Door Company of Beaumont™’s current identity when he took over the distributorship in April 1963 at the invitation of The Overhead Door™ Corporation...	manufacture		2019-12-24 23:19:40.197015+03	t	f	f	HVAC	0	e906213f-0771-4010-a8cd-ec37648e9455			overhead-door-company	2100 Greenhill Drive\nRound Rock, TX 78664	\N		f	EN	\N	0	0	USA
Jamison Door	contact@jamisondoor.com	800-532-3667	Insulated doors for cold storage applications	manufacture		2019-12-24 23:19:40.217118+03	t	f	f	HVAC	0	9674803f-fcb4-428b-87c4-98f20346baea			jamison-door	55 JV Jamison DriveHagerstown, MD 21740	\N		f	RU	\N	0	0	USA
Overhead Door Corporation	National_Accts@overheaddoor.com	800-972-1730	Whether you're an architect, contractor or builder, you don’t have to feel limited in the construction of a new facility or facility remodel. We provide garage doors for numerous applications including dock equipment, air curtains, bollards, safety gates, automatic entrance doors, and much more. Our nationwide distribution network makes us experts in large-scale projects involving sports venues, convention centers, manufacturing facilities, and more.	manufacture		2019-12-24 23:19:40.227055+03	t	f	f	HVAC	0	7841c0c3-d478-4f38-9131-ec9ac8b67712			overhead-door-corporation	Unknown	\N		f	EN	\N	0	0	USA
Overhead Door Corporation	Cedric_Baker@overheaddoor.com	501-779-1878	Whether you're an architect, contractor or builder, you don’t have to feel limited in the construction of a new facility or facility remodel. We provide garage doors for numerous applications including dock equipment, air curtains, bollards, safety gates, automatic entrance doors, and much more. Our nationwide distribution network makes us experts in large-scale projects involving sports venues, convention centers, manufacturing facilities, and more.	manufacture		2019-12-24 23:19:40.239952+03	t	f	f	HVAC	0	c6c7e01f-203a-4b86-8d9b-9166be1a596a			overhead-door-corporation	Unknown	\N		f	EN	\N	0	0	USA
Rite-Hite Doors, Inc.	info@ritehite.com	414-355-2600	Rite-Hite Doors is a leading manufacturer of industrial and cold storage doors designed for increased safety and productivity and energy savings. Products include FasTrax, Protecdor and Trakline High Performance Doors, Fas Trax FR, Iso-Tek and Barrier Cold Storage Doors, Insul-Rite and Steel-Rite Sectional Doors, and a full line of Impact Doors.	manufacture		2019-12-24 23:19:40.250115+03	t	f	f	HVAC	0	e1bcc906-11ab-4782-a106-2fa1056400ac			rite-hite-doors-inc	8900 North Arbon DriveMilwaukee, WI 53082	\N		f	RU	\N	0	0	USA
Northwest Door	gwetherell@northwestdoor.com	800-974-2224	We manufacture sectional garage doors in steel, wood and aluminum for both residential and commercial applications, and have the largest selection of styles, models, sizes and materials in the industry. This is in addition to producing custom built garage doors to meet architectural specifications. Our “carriage house” garage doors replicate historic swing-type and side-folding doors. Both our carriage house style and traditional style garage doors are available in a variety of materials and configurations.	manufacture		2019-12-24 23:19:40.26051+03	t	f	f	SFUGD	0	1368fae0-5a30-4dad-aa99-294484d066cd			northwest-door	625 West 3900 South, Bldg D #1Salt Lake City, UT 84123-6977	\N		f	EN	\N	0	0	USA
MIDLAND GARAGE DOORS	brockf@midlandgaragedoor.com	800.533.8358	For over 40 years, Midland has been manufacturing the longest-lasting, smoothest-running residential and commercial overhead garage doors. We are a proud Midwest company built on the tradition of making products that dealers love to install and customers love to own.	manufacture		2019-12-24 23:19:40.27247+03	t	f	f	SFUGD	0	18de9e2c-f39a-4d15-917f-2ab7f56c6c40			midland-garage-doors	13661 Giles Road Omaha, NE 68138	\N		f	EN	\N	0	0	USA
Amarr Garage Doors	ask.amarr@entrematic.com	1.800.503.DOOR (3667)	Established in 1951, Amarr is one of the world’s leading brands in design, manufacturing and distribution of sectional doors for residential garages, condominiums, commercial buildings, shopping malls, warehouses and other industrial applications.	manufacture		2019-12-24 23:19:40.282928+03	t	f	f	SFUGD	0	0910ed83-13e5-4b4b-b976-169a35222450			amarr-garage-doors	3800 Greenway Circle\nLawrence, KS 66046	\N		f	EN	\N	0	0	USA
Overhead Door Corporation	Steve_Hart@overheaddoor.com	972-207-7963	Whether you're an architect, contractor or builder, you don’t have to feel limited in the construction of a new facility or facility remodel. We provide garage doors for numerous applications including dock equipment, air curtains, bollards, safety gates, automatic entrance doors, and much more. Our nationwide distribution network makes us experts in large-scale projects involving sports venues, convention centers, manufacturing facilities, and more.	manufacture	Steve Hart	2019-12-24 23:19:40.293555+03	t	f	f	HVAC	0	553aa484-b7c0-405d-99ca-bdf3b766c0a6			overhead-door-corporation	Unknown	\N		f	EN	\N	0	0	USA
Northwest Door	aschwarz@northwestdoor.com	800-963-2002	We manufacture sectional garage doors in steel, wood and aluminum for both residential and commercial applications, and have the largest selection of styles, models, sizes and materials in the industry. This is in addition to producing custom built garage doors to meet architectural specifications. Our “carriage house” garage doors replicate historic swing-type and side-folding doors. Both our carriage house style and traditional style garage doors are available in a variety of materials and configurations.	manufacture		2019-12-24 23:19:40.30602+03	t	f	f	SFUGD	0	b402e559-ea10-46ea-87ca-2bdaabfe86f6			northwest-door	6125 East 39th Ave.\nDenver, CO 80207-1309	\N		f	EN	\N	0	0	USA
OVERHEAD DOOR COMPANY	lufkinsales@theoverheaddoor.com	(936) 564-8559	The Overhead Door Company of Beaumont™ has proudly served Beaumont and surrounding communities for almost 75 years. Though founded in the 1940s, Buford Coe, a veteran of World War II, established The Overhead Door Company of Beaumont™’s current identity when he took over the distributorship in April 1963 at the invitation of The Overhead Door™ Corporation...	manufacture		2019-12-24 23:19:40.316649+03	t	f	f	HVAC	0	c8a1f0bb-9835-427c-8ad2-96201a843774			overhead-door-company	413 Della Russell Road\nLufkin, TX 75904	\N		f	EN	\N	0	0	USA
Northwest Door	dtoll@northwestdoor.com	408-786-9999	We manufacture sectional garage doors in steel, wood and aluminum for both residential and commercial applications, and have the largest selection of styles, models, sizes and materials in the industry. This is in addition to producing custom built garage doors to meet architectural specifications. Our “carriage house” garage doors replicate historic swing-type and side-folding doors. Both our carriage house style and traditional style garage doors are available in a variety of materials and configurations.	manufacture		2019-12-24 23:19:40.328099+03	t	f	f	SFUGD	0	7d3a2f0a-0963-4b01-9e91-5219dad7415d			northwest-door	2277 Ringwood Avenue\nSan Jose, CA 95131-1717	\N		f	EN	\N	0	0	USA
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-12-12 21:22:55.319193+03	1	О Comaex	1	[{"added": {}}]	9	1
2	2019-12-12 21:23:37.668466+03	2	Функционал	1	[{"added": {}}]	9	1
3	2019-12-12 21:54:51.751021+03	2	Функционал	2	[]	9	1
4	2019-12-12 21:55:49.886604+03	3	Применение	1	[{"added": {}}]	9	1
5	2019-12-12 21:56:26.501928+03	4	Инфо	1	[{"added": {}}]	9	1
6	2019-12-12 21:56:33.838026+03	3	Применение	2	[{"changed": {"fields": ["slug"]}}]	9	1
7	2019-12-12 21:56:40.912539+03	2	Функционал	2	[{"changed": {"fields": ["slug"]}}]	9	1
8	2019-12-12 21:56:48.123931+03	1	О Comaex	2	[{"changed": {"fields": ["slug"]}}]	9	1
9	2019-12-12 21:58:03.760551+03	1	Слайдер	1	[{"added": {}}]	7	1
10	2019-12-12 21:58:49.404293+03	2	О Comaex	1	[{"added": {}}]	7	1
11	2019-12-12 22:00:08.73269+03	3	Функционал	1	[{"added": {}}]	7	1
12	2019-12-12 22:04:13.687057+03	4	Функционал картинки	1	[{"added": {}}]	7	1
13	2019-12-12 22:05:13.824125+03	5	Применение	1	[{"added": {}}]	7	1
14	2019-12-12 22:05:53.075047+03	6	Применение картинки	1	[{"added": {}}]	7	1
15	2019-12-12 22:07:30.281151+03	7	Портфолио	1	[{"added": {}}]	7	1
16	2019-12-12 22:08:34.069163+03	8	Стоимость	1	[{"added": {}}]	7	1
17	2019-12-12 22:09:36.086847+03	9	Стоимость_картинки	1	[{"added": {}}]	7	1
18	2019-12-12 22:10:19.337844+03	10	Контакты	1	[{"added": {}}]	7	1
19	2019-12-12 22:10:54.802221+03	11	Новости	1	[{"added": {}}]	7	1
20	2019-12-12 22:11:09.943237+03	9	Стоимость картинки	2	[{"changed": {"fields": ["subtitle"]}}]	7	1
21	2019-12-12 22:14:02.021144+03	1	Сервер Comaex	1	[{"added": {}}]	8	1
22	2019-12-12 22:21:18.665419+03	2	Comaex для инженерных систем	1	[{"added": {}}]	8	1
23	2019-12-12 22:22:50.15326+03	3	Comaex для Умного Дома	1	[{"added": {}}]	8	1
24	2019-12-12 22:24:22.947906+03	4	Comaex для Интернета объектов	1	[{"added": {}}]	8	1
25	2019-12-12 22:28:37.991179+03	5	Супервизор-сервер Comaex	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f", "object": "\\u0421\\u0443\\u043f\\u0435\\u0440\\u0432\\u0438\\u0437\\u043e\\u0440-\\u0441\\u0435\\u0440\\u0432\\u0435\\u0440 Comaex"}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f", "object": "\\u0420\\u0430\\u0434\\u0438\\u043e\\u043c\\u043e\\u0434\\u0443\\u043b\\u044c E800-DTU"}}]	8	1
26	2019-12-12 22:30:49.747279+03	6	Функциональные возможности	1	[{"added": {}}]	8	1
27	2019-12-12 22:35:28.655345+03	7	Контроль	1	[{"added": {}}]	8	1
28	2019-12-12 22:38:22.895066+03	8	Управление	1	[{"added": {}}]	8	1
29	2019-12-12 22:40:31.939478+03	9	Уставки	1	[{"added": {}}]	8	1
30	2019-12-12 22:42:53.199432+03	10	Аварии	1	[{"added": {}}]	8	1
31	2019-12-12 22:45:04.332828+03	11	Графики	1	[{"added": {}}]	8	1
32	2019-12-12 22:47:37.783928+03	12	Архив событий	1	[{"added": {}}]	8	1
33	2019-12-12 22:50:11.451338+03	13	Визуализация	1	[{"added": {}}]	8	1
34	2019-12-12 22:51:55.349757+03	13	Визуализация	2	[{"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f", "object": ""}}]	8	1
35	2019-12-12 22:55:09.23848+03	11	Графики	2	[{"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f", "object": ""}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f", "object": ""}}]	8	1
36	2019-12-12 23:05:13.644918+03	14	ВСЕ	1	[{"added": {}}]	8	1
37	2019-12-12 23:30:30.347462+03	15	Применение	1	[{"added": {}}]	8	1
38	2019-12-12 23:31:51.881145+03	16	Системы HVAC	1	[{"added": {}}]	8	1
39	2019-12-12 23:32:49.721766+03	17	Умный дом	1	[{"added": {}}]	8	1
40	2019-12-12 23:33:34.41498+03	18	Интернет объектов	1	[{"added": {}}]	8	1
41	2019-12-12 23:35:56.058912+03	10	Контакты	2	[{"changed": {"fields": ["submark"]}}]	7	1
42	2019-12-12 23:36:09.115767+03	5	Применение	2	[{"changed": {"fields": ["submark"]}}]	7	1
43	2019-12-12 23:36:15.961775+03	7	Портфолио	2	[{"changed": {"fields": ["submark"]}}]	7	1
44	2019-12-12 23:36:22.26035+03	8	Стоимость	2	[{"changed": {"fields": ["submark"]}}]	7	1
45	2019-12-12 23:36:27.531532+03	11	Новости	2	[{"changed": {"fields": ["submark"]}}]	7	1
46	2019-12-12 23:40:39.608282+03	10	Контакты	2	[{"changed": {"fields": ["submark"]}}]	7	1
47	2019-12-12 23:40:44.87244+03	11	Новости	2	[{"changed": {"fields": ["submark"]}}]	7	1
48	2019-12-12 23:42:26.057148+03	10	Контакты	2	[{"changed": {"fields": ["submark"]}}]	7	1
49	2019-12-12 23:42:32.429566+03	11	Новости	2	[{"changed": {"fields": ["submark"]}}]	7	1
50	2019-12-13 00:09:47.850168+03	1	О Comaex	2	[{"changed": {"fields": ["slug"]}}]	9	1
51	2019-12-13 00:09:55.232151+03	2	Функционал	2	[{"changed": {"fields": ["slug"]}}]	9	1
52	2019-12-14 21:19:50.76841+03	f1ad8ff7-18d3-469f-b26e-ef8b399c0605	Computer LTD	1	[{"added": {}}]	13	1
53	2019-12-14 21:33:25.876992+03	1	Владимир Годовалов	3		11	1
54	2019-12-14 21:33:26.041168+03	2	Владимир Годовалов	3		11	1
55	2019-12-14 21:33:26.117841+03	3	Владимир Годовалов	3		11	1
56	2019-12-14 21:33:26.184184+03	4	vladimir	3		11	1
57	2019-12-14 21:33:26.206283+03	5	Владимир Годовалов	3		11	1
58	2019-12-14 21:33:26.227926+03	6	Владимир Годовалов	3		11	1
59	2019-12-14 21:33:26.249944+03	7	Владимир Годовалов	3		11	1
60	2019-12-14 21:33:26.260976+03	8	Владимир Годовалов	3		11	1
61	2019-12-14 21:33:26.272226+03	9	Владимир Годовалов	3		11	1
62	2019-12-14 21:33:26.283149+03	10	Vladimir	3		11	1
63	2019-12-16 21:14:01.332399+03	7	Портфолио	2	[{"changed": {"fields": ["submark"]}}]	7	1
64	2019-12-16 21:14:07.694421+03	8	Стоимость	2	[{"changed": {"fields": ["submark"]}}]	7	1
65	2019-12-16 21:14:16.035389+03	11	Новости	2	[{"changed": {"fields": ["submark"]}}]	7	1
66	2019-12-16 21:17:53.291052+03	7	Портфолио	2	[{"changed": {"fields": ["subslug"]}}]	7	1
67	2019-12-16 21:17:58.936071+03	8	Стоимость	2	[{"changed": {"fields": ["subslug"]}}]	7	1
68	2019-12-16 21:18:05.951368+03	9	Стоимость картинки	2	[{"changed": {"fields": ["subslug"]}}]	7	1
69	2019-12-17 22:42:24.01442+03	5	Супервизор-сервер Comaex	2	[{"changed": {"fields": ["description"]}}]	8	1
70	2019-12-17 22:43:09.784587+03	5	Супервизор-сервер Comaex	2	[{"changed": {"fields": ["description"]}}]	8	1
71	2019-12-17 22:43:46.21503+03	5	Супервизор-сервер Comaex	2	[{"changed": {"fields": ["description"]}}]	8	1
72	2019-12-17 22:44:27.281719+03	5	Супервизор-сервер Comaex	2	[{"changed": {"fields": ["description"]}}]	8	1
73	2019-12-20 00:06:29.152554+03	1	HVAC	1	[{"added": {}}]	15	1
74	2019-12-20 00:06:45.696293+03	1	HVAC	2	[{"changed": {"fields": ["image"]}}]	15	1
75	2019-12-20 00:07:17.878609+03	1	HVAC	3		15	1
76	2019-12-20 00:07:30.708382+03	f1ad8ff7-18d3-469f-b26e-ef8b399c0605	Computer LTD	3		13	1
77	2019-12-21 10:39:46.957265+03	2	HVAC	1	[{"added": {}}, {"added": {"object": "\\u041e \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0435", "name": "Additional image"}}]	15	1
78	2019-12-21 10:41:37.980092+03	2	HVAC	2	[{"added": {"object": "\\u041d\\u0430\\u0448\\u0435 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u0435", "name": "Additional image"}}, {"added": {"object": "\\u041f\\u0440\\u0435\\u0438\\u043c\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u0430", "name": "Additional image"}}, {"added": {"object": "\\u0412\\u0430\\u0448\\u0430 \\u0432\\u044b\\u0433\\u043e\\u0434\\u0430", "name": "Additional image"}}, {"added": {"object": "\\u0418\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f \\u0434\\u043b\\u044f \\u0438\\u0437\\u0443\\u0447\\u0435\\u043d\\u0438\\u044f", "name": "Additional image"}}]	15	1
79	2019-12-21 10:42:32.007583+03	cae0d8eb-0bb1-4478-b93e-34e990bf6a61	Computer LTD	1	[{"added": {}}]	13	1
80	2019-12-21 10:43:16.581641+03	2022d696-62ed-4cc8-a6f0-9747495220fa	GVA008	1	[{"added": {}}]	13	1
81	2019-12-21 10:43:30.621223+03	cae0d8eb-0bb1-4478-b93e-34e990bf6a61	Computer LTD	2	[{"changed": {"fields": ["email"]}}]	13	1
82	2019-12-21 10:43:46.689558+03	dddaf662-5ce8-4e7f-a6f6-67fbcb0a8a4a	Innotech	1	[{"added": {}}]	13	1
83	2019-12-21 10:47:36.250052+03	3	HVAC	1	[{"added": {}}, {"added": {"object": "About product", "name": "Additional image"}}, {"added": {"object": "What we offer", "name": "Additional image"}}, {"added": {"object": "Advantages", "name": "Additional image"}}, {"added": {"object": "Your benefit", "name": "Additional image"}}, {"added": {"object": "Information for learning", "name": "Additional image"}}]	15	1
84	2019-12-21 11:41:32.773376+03	dddaf662-5ce8-4e7f-a6f6-67fbcb0a8a4a	Innotech	2	[{"changed": {"fields": ["language"]}}]	13	1
85	2019-12-21 12:19:02.020217+03	1	HVAC	1	[{"added": {}}]	16	1
86	2019-12-21 13:21:58.97921+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	1
87	2019-12-21 13:31:36.896295+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	1
88	2019-12-21 13:33:15.948512+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	1
89	2019-12-21 17:55:46.027572+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	1
90	2019-12-21 18:26:43.23128+03	4	SFUGD	1	[{"added": {}}, {"added": {"name": "Additional image", "object": ""}}]	15	1
91	2019-12-21 18:27:09.52172+03	dddaf662-5ce8-4e7f-a6f6-67fbcb0a8a4a	Innotech	2	[{"changed": {"fields": ["category", "language"]}}]	13	1
92	2019-12-22 14:29:33.457958+03	dddaf662-5ce8-4e7f-a6f6-67fbcb0a8a4a	Innotech	3		13	1
93	2019-12-22 14:29:33.903627+03	cae0d8eb-0bb1-4478-b93e-34e990bf6a61	Computer LTD	3		13	1
94	2019-12-22 14:29:33.914613+03	2022d696-62ed-4cc8-a6f0-9747495220fa	GVA008	3		13	1
95	2019-12-22 17:38:27.093737+03	b35bcca4-8700-4aef-a698-838f5e94c145	Innotech	3		13	1
96	2019-12-22 17:38:27.250142+03	36b229d8-f9f5-4b43-853b-f9ac957a94fe	Computer LTD	3		13	1
97	2019-12-22 17:38:41.623837+03	15830abd-4447-4269-87ed-2c9149d61a80	Innotech	1	new through import_export	13	1
98	2019-12-22 17:38:41.634059+03	a25e63a8-4e92-45cf-a616-bf6b73041270	Computer LTD	1	new through import_export	13	1
99	2019-12-22 17:38:41.645043+03	00438a4d-a37c-40dc-945a-50e8bd5f484b	GVA008	1	new through import_export	13	1
100	2019-12-22 18:42:25.962443+03	a25e63a8-4e92-45cf-a616-bf6b73041270	Computer LTD	3		13	1
101	2019-12-22 18:42:26.087398+03	15830abd-4447-4269-87ed-2c9149d61a80	Innotech	3		13	1
102	2019-12-22 18:42:26.131533+03	00438a4d-a37c-40dc-945a-50e8bd5f484b	GVA008	3		13	1
103	2019-12-22 18:42:38.580078+03	5922d3c2-a46a-4a54-8d73-31cbe145f6c3	Innotech	1	new through import_export	13	1
104	2019-12-22 18:42:38.589777+03	5175eff6-294b-4de6-b079-869c87d4fa2f	Computer LTD	1	new through import_export	13	1
105	2019-12-22 18:42:38.600749+03	e5b0b3ed-7d62-44a8-83ca-1eda65ee1b40	GVA008	1	new through import_export	13	1
106	2019-12-22 18:47:42.516548+03	e5b0b3ed-7d62-44a8-83ca-1eda65ee1b40	GVA008	3		13	1
107	2019-12-22 18:47:42.691009+03	5922d3c2-a46a-4a54-8d73-31cbe145f6c3	Innotech	3		13	1
108	2019-12-22 18:47:42.757201+03	5175eff6-294b-4de6-b079-869c87d4fa2f	Computer LTD	3		13	1
109	2019-12-22 18:47:55.15074+03	ec547418-ad6e-4e23-a775-a10c1c2e4dee	Innotech	1	new through import_export	13	1
110	2019-12-22 18:47:55.160669+03	f26192c7-af32-4786-b012-c37f54183965	Computer LTD	1	new through import_export	13	1
111	2019-12-22 18:47:55.17173+03	5e23dadc-ea0c-4f36-b1bf-9ea69f980ef6	GVA008	1	new through import_export	13	1
112	2019-12-22 18:49:00.897347+03	f26192c7-af32-4786-b012-c37f54183965	Computer LTD	3		13	1
113	2019-12-22 18:49:01.042159+03	ec547418-ad6e-4e23-a775-a10c1c2e4dee	Innotech	3		13	1
114	2019-12-22 18:49:01.09706+03	5e23dadc-ea0c-4f36-b1bf-9ea69f980ef6	GVA008	3		13	1
115	2019-12-22 18:49:14.205721+03	a4c26fb9-73d1-438a-853f-4d0c74db7be4	Innotech	1	new through import_export	13	1
116	2019-12-22 18:49:14.215826+03	0ec42a7d-bc6c-495a-851b-05e8f034d305	Computer LTD	1	new through import_export	13	1
117	2019-12-22 18:49:14.226827+03	6786a59f-7056-43df-aefc-74d39e3ae2c5	GVA008	1	new through import_export	13	1
118	2019-12-22 19:12:29.544692+03	a4c26fb9-73d1-438a-853f-4d0c74db7be4	Innotech	3		13	1
119	2019-12-22 19:12:29.795279+03	6786a59f-7056-43df-aefc-74d39e3ae2c5	GVA008	3		13	1
120	2019-12-22 19:12:29.80572+03	0ec42a7d-bc6c-495a-851b-05e8f034d305	Computer LTD	3		13	1
121	2019-12-22 19:12:42.144097+03	61a1cdd6-6e52-405d-85aa-e80bcf0fe436	Innotech	1	new through import_export	13	1
122	2019-12-22 19:12:42.154273+03	37f14b7a-4dc4-4335-9d2a-53516b4acbe3	Computer LTD	1	new through import_export	13	1
123	2019-12-22 19:12:42.16521+03	43280844-7c22-4e6d-87eb-145ace411f6d	GVA008	1	new through import_export	13	1
124	2019-12-22 19:12:42.176299+03	57b26246-0433-40b0-87ef-071fb598d52f	ГК РОВЕН	1	new through import_export	13	1
125	2019-12-22 19:14:16.573163+03	61a1cdd6-6e52-405d-85aa-e80bcf0fe436	Innotech	3		13	1
126	2019-12-22 19:14:16.672873+03	57b26246-0433-40b0-87ef-071fb598d52f	ГК РОВЕН	3		13	1
127	2019-12-22 19:14:16.716233+03	43280844-7c22-4e6d-87eb-145ace411f6d	GVA008	3		13	1
128	2019-12-22 19:14:16.848387+03	37f14b7a-4dc4-4335-9d2a-53516b4acbe3	Computer LTD	3		13	1
129	2019-12-22 19:14:56.881062+03	609b9b47-2b4e-4840-a190-1032f646d533	Innotech	1	new through import_export	13	1
130	2019-12-22 19:14:56.920398+03	83295202-a128-4116-b586-df556ffbfd96	Computer LTD	1	new through import_export	13	1
131	2019-12-22 19:14:56.931425+03	aacfbed1-5f6d-4dca-963f-911e0bb242ba	GVA008	1	new through import_export	13	1
132	2019-12-22 19:14:56.942506+03	5fd03742-423b-4559-9d7e-7bcff83d8c0f	ГК РОВЕН	1	new through import_export	13	1
133	2019-12-22 20:03:05.95254+03	b8c54ec5-b4ab-4589-92cb-fabf18341e1c	Innotech1	1	new through import_export	13	1
134	2019-12-22 20:03:06.016308+03	29a2cd62-65c6-4333-8321-3eab551feaa9	Computer LTD1	1	new through import_export	13	1
135	2019-12-22 20:03:06.027214+03	f8d26a9e-57ad-4503-8342-6221af246752	GVA0081	1	new through import_export	13	1
136	2019-12-22 20:03:06.038271+03	b3dd2700-aa87-493e-abd4-96dcb2ae633c	ГК РОВЕН1	1	new through import_export	13	1
137	2019-12-22 20:03:57.69505+03	83295202-a128-4116-b586-df556ffbfd96	Computer LTD	3		13	1
138	2019-12-22 20:03:57.76571+03	609b9b47-2b4e-4840-a190-1032f646d533	Innotech	3		13	1
139	2019-12-22 20:03:57.776379+03	5fd03742-423b-4559-9d7e-7bcff83d8c0f	ГК РОВЕН	3		13	1
140	2019-12-22 20:03:57.787304+03	29a2cd62-65c6-4333-8321-3eab551feaa9	Computer LTD1	3		13	1
141	2019-12-22 20:44:40.19054+03	f8d26a9e-57ad-4503-8342-6221af246752	GVA0081	3		13	1
142	2019-12-22 20:44:40.367888+03	eea077a2-3fb6-4d7f-8b79-c53bb09b4935	Innotech1	3		13	1
143	2019-12-22 20:44:40.400901+03	c4914cbd-396b-46d5-9f04-ef8432db6e0f	Computer LTD1	3		13	1
144	2019-12-22 20:44:40.411849+03	b8c54ec5-b4ab-4589-92cb-fabf18341e1c	Innotech1	3		13	1
145	2019-12-22 20:44:40.423679+03	b3dd2700-aa87-493e-abd4-96dcb2ae633c	ГК РОВЕН1	3		13	1
146	2019-12-22 20:44:40.43388+03	aacfbed1-5f6d-4dca-963f-911e0bb242ba	GVA008	3		13	1
147	2019-12-22 21:36:26.003882+03	bd3c12bc-4228-46c4-bc5c-9d04e0e97025	Innotech	1	new through import_export	13	1
148	2019-12-22 21:36:26.012322+03	e3e34eef-aea5-47e8-8d96-ab20a06fa1df	Computer LTD	1	new through import_export	13	1
149	2019-12-22 21:36:26.023281+03	e52dee80-375d-4869-8040-dc5972fa71d2	GVA008	1	new through import_export	13	1
150	2019-12-22 21:36:26.03428+03	52ba09c3-1440-4984-857b-36340ef4ce03	ГК РОВЕН	1	new through import_export	13	1
151	2019-12-22 22:32:20.615509+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	2
152	2019-12-22 22:43:55.396302+03	11	Вова Годовалов	3		11	2
153	2019-12-22 22:43:55.398428+03	12	Вова Годовалов	3		11	2
154	2019-12-22 22:43:55.399851+03	13	Владимир Годовалов	3		11	2
155	2019-12-22 22:43:55.401343+03	14	Владимир Годовалов	3		11	2
156	2019-12-22 22:43:55.402861+03	15	Владимир Годовалов	3		11	2
157	2019-12-22 22:43:55.404241+03	16	Владимир Годовалов	3		11	2
158	2019-12-22 22:43:55.405682+03	17	Владимир Годовалов	3		11	2
159	2019-12-22 22:43:55.407013+03	18	Владимир Годовалов	3		11	2
160	2019-12-22 22:43:55.408378+03	19	Владимир Годовалов	3		11	2
161	2019-12-22 23:06:35.079271+03	e3e34eef-aea5-47e8-8d96-ab20a06fa1df	Computer LTD	2	[{"changed": {"fields": ["language"]}}]	13	2
162	2019-12-22 23:09:57.042965+03	2	HVAC	2	[{"changed": {"fields": ["image"]}}]	15	2
163	2019-12-22 23:10:47.806091+03	3	HVAC	2	[{"changed": {"fields": ["image"]}}]	15	2
164	2019-12-22 23:13:43.358281+03	bd3c12bc-4228-46c4-bc5c-9d04e0e97025	Innotech	2	[{"changed": {"fields": ["category"]}}]	13	2
165	2019-12-22 23:15:36.145993+03	bd3c12bc-4228-46c4-bc5c-9d04e0e97025	Innotech	2	[{"changed": {"fields": ["category", "language"]}}]	13	2
166	2019-12-22 23:15:47.951659+03	bd3c12bc-4228-46c4-bc5c-9d04e0e97025	Innotech	2	[{"changed": {"fields": ["language"]}}]	13	2
167	2019-12-23 11:04:16.43846+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	2
168	2019-12-23 11:04:36.547217+03	e3e34eef-aea5-47e8-8d96-ab20a06fa1df	Computer LTD	2	[{"changed": {"fields": ["enable_mailing", "interested", "preorder"]}}]	13	2
169	2019-12-23 11:04:46.886208+03	e52dee80-375d-4869-8040-dc5972fa71d2	GVA008	2	[{"changed": {"fields": ["enable_mailing"]}}]	13	2
170	2019-12-23 11:05:00.999013+03	bd3c12bc-4228-46c4-bc5c-9d04e0e97025	Innotech	2	[{"changed": {"fields": ["enable_mailing", "interested", "preorder"]}}]	13	2
171	2019-12-23 13:34:52.578015+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	2
172	2019-12-23 13:37:41.877526+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	2
173	2019-12-23 13:45:34.979812+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	2
174	2019-12-23 14:00:27.116014+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	2
175	2019-12-23 14:18:54.88048+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	2
176	2019-12-23 14:19:00.918482+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	2
177	2019-12-23 16:45:09.873283+03	5	SFUGD	1	[{"added": {}}, {"added": {"name": "Additional image", "object": ""}}]	15	2
178	2019-12-23 16:45:33.091851+03	e3e34eef-aea5-47e8-8d96-ab20a06fa1df	Computer LTD	2	[{"changed": {"fields": ["category"]}}]	13	2
179	2019-12-23 16:47:17.620037+03	5	SFUGD	2	[{"changed": {"fields": ["title"]}}, {"changed": {"name": "Additional image", "object": "", "fields": ["image"]}}]	15	2
180	2019-12-23 17:12:52.865371+03	5	SFUGD	2	[{"changed": {"name": "Additional image", "object": "", "fields": ["description"]}}]	15	2
181	2019-12-23 17:16:39.471801+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	2
182	2019-12-23 17:18:03.036445+03	e3e34eef-aea5-47e8-8d96-ab20a06fa1df	Computer LTD	2	[{"changed": {"fields": ["enable_mailing", "interested", "preorder"]}}]	13	2
183	2019-12-23 21:20:07.487657+03	5	SFUGD	2	[{"changed": {"name": "Additional image", "object": "Patent description", "fields": ["title", "urllink"]}}]	15	2
184	2019-12-23 21:22:52.202394+03	5	SFUGD	2	[{"changed": {"name": "Additional image", "object": "Patent description", "fields": ["description"]}}]	15	2
185	2019-12-23 21:24:15.638108+03	5	SFUGD	2	[{"changed": {"name": "Additional image", "object": "Patent description", "fields": ["description"]}}]	15	2
186	2019-12-23 21:35:36.680343+03	5	SFUGD	2	[]	15	2
187	2019-12-23 21:38:58.632193+03	5	SFUGD	2	[]	15	2
188	2019-12-23 21:43:18.986559+03	5	SFUGD	2	[{"changed": {"fields": ["urllink"]}}]	15	2
189	2019-12-23 21:45:21.948805+03	5	SFUGD	2	[{"changed": {"fields": ["urllink"]}}]	15	2
190	2019-12-23 21:52:03.850644+03	e52dee80-375d-4869-8040-dc5972fa71d2	GVA008	2	[{"changed": {"fields": ["category", "language"]}}]	13	2
191	2019-12-23 22:00:54.695614+03	e52dee80-375d-4869-8040-dc5972fa71d2	GVA008	2	[{"changed": {"fields": ["address", "interested", "preorder"]}}]	13	2
192	2019-12-23 22:18:58.364709+03	5	SFUGD	2	[{"changed": {"fields": ["urllink", "data1"]}}]	15	2
193	2019-12-23 22:34:29.631321+03	5	SFUGD	2	[{"changed": {"name": "Additional image", "object": "Patent description", "fields": ["data1"]}}]	15	2
194	2019-12-23 22:38:31.934066+03	5	SFUGD	2	[{"changed": {"fields": ["urllink", "data1"]}}]	15	2
195	2019-12-23 22:51:44.079529+03	5	SFUGD	2	[{"changed": {"fields": ["data1"]}}, {"changed": {"name": "Additional image", "object": "Patent description", "fields": ["data1"]}}]	15	2
196	2019-12-23 23:00:01.017835+03	bd3c12bc-4228-46c4-bc5c-9d04e0e97025	Innotech	2	[{"changed": {"fields": ["language"]}}]	13	2
197	2019-12-23 23:16:08.978661+03	5	SFUGD	2	[{"added": {"name": "Additional image", "object": "Your benefit"}}, {"added": {"name": "Additional image", "object": "Make your bid"}}]	15	2
198	2019-12-23 23:19:44.653224+03	5	SFUGD	2	[{"changed": {"fields": ["data1"]}}]	15	2
199	2019-12-23 23:50:12.765193+03	2	SFUGD	1	[{"added": {}}]	16	2
200	2019-12-23 23:50:34.563237+03	bd3c12bc-4228-46c4-bc5c-9d04e0e97025	Innotech	2	[{"changed": {"fields": ["enable_mailing"]}}]	13	2
201	2019-12-23 23:50:56.795146+03	e3e34eef-aea5-47e8-8d96-ab20a06fa1df	Computer LTD	2	[{"changed": {"fields": ["category", "language"]}}]	13	2
202	2019-12-23 23:51:16.495144+03	e52dee80-375d-4869-8040-dc5972fa71d2	GVA008	2	[{"changed": {"fields": ["category"]}}]	13	2
203	2019-12-24 21:18:02.195321+03	2	SFUGD	2	[{"changed": {"fields": ["tick"]}}]	16	1
204	2019-12-24 21:18:12.291163+03	1	HVAC	2	[{"changed": {"fields": ["tick"]}}]	16	1
205	2019-12-24 21:24:29.119838+03	e529b59c-74d0-4fae-b6df-af313b8be1ff	Wayne Dalton	3		13	1
206	2019-12-24 21:24:29.180789+03	d67bb851-a67e-40a6-b11b-2abbd108462e	Northwest Door	3		13	1
207	2019-12-24 21:24:29.191831+03	ca9028cf-22b1-4f1b-a91b-280b822920cc	Overhead Door of Columbia	3		13	1
208	2019-12-24 21:24:29.202785+03	c63f65cb-2e94-4345-bb62-ba283e3c4104	MIDLAND GARAGE DOORS	3		13	1
209	2019-12-24 21:24:29.213841+03	c06b6f5e-3c89-4884-bbfb-8d0885c4f9f8	Northwest Door	3		13	1
210	2019-12-24 21:24:29.224816+03	96a974e4-6be7-4fac-9e8e-6e56c94100fc	OVERHEAD DOOR COMPANY	3		13	1
211	2019-12-24 21:24:29.235868+03	92b5dfdb-4fae-446b-bb22-9e36870eb403	MIDLAND GARAGE DOORS	3		13	1
212	2019-12-24 21:24:29.247098+03	9080ff9a-d226-4d19-97f2-2b0845736a50	Overhead Door Company of Mason City	3		13	1
213	2019-12-24 21:24:29.257928+03	7ded93a1-fc79-4e06-9a3b-5f6017cf8685	Delden Mfg	3		13	1
214	2019-12-24 21:24:29.269017+03	6d3d3108-985b-4166-a52f-7ebd9df24b72	Northwest Door	3		13	1
215	2019-12-24 21:24:29.280188+03	53ff29ab-2a85-42f5-b5fe-d37a2cf63f00	Northwest Door	3		13	1
216	2019-12-24 21:24:29.291058+03	52c9964a-d3af-44e0-a019-a5ac80fc5ddc	OVERHEAD DOOR COMPANY	3		13	1
217	2019-12-24 21:24:29.302035+03	4dccce6e-99dd-4558-9586-5142e19d6186	Raynor Garage Doors	3		13	1
218	2019-12-24 21:24:29.313161+03	4179f261-2d9e-41fb-9d96-74af2aa02c0b	OVERHEAD DOOR COMPANY	3		13	1
219	2019-12-24 21:24:29.324018+03	38a1e50a-9886-47d6-a2eb-e52c4d40bcd6	Northwest Door	3		13	1
220	2019-12-24 21:24:29.335033+03	2e0deddc-b547-4ea0-96db-6ad04fcde39d	Northwest Door	3		13	1
221	2019-12-24 21:24:29.346099+03	097933d5-091d-4e0d-a173-e240a9adf80c	OVERHEAD DOOR COMPANY	3		13	1
222	2019-12-24 21:24:29.35708+03	05d2332b-569d-4051-b762-675af7cbe93b	Amarr Garage Doors	3		13	1
223	2019-12-24 21:24:29.368039+03	02a3cdcd-450e-40ba-899c-54a46cbe792c	Northwest Door	3		13	1
224	2019-12-24 21:24:37.926114+03	8300049d-eaeb-4148-98f2-95e45ce47e8b	MIDLAND GARAGE DOORS	3		13	1
225	2019-12-24 21:29:01.896976+03	ff3e210e-e4e9-481d-9b32-72efd61fd680	Raynor Garage Doors	3		13	1
226	2019-12-24 21:29:01.92943+03	f8b5a57c-b5cd-4346-8ec6-c34911fa6eb3	MIDLAND GARAGE DOORS	3		13	1
227	2019-12-24 21:29:01.962375+03	f4b87d28-0ceb-405e-856a-c9833e15aa86	Northwest Door	3		13	1
228	2019-12-24 21:29:01.99544+03	f00a35f3-3e11-4a12-be6c-7fa528e14e3c	OVERHEAD DOOR COMPANY	3		13	1
229	2019-12-24 21:29:02.006296+03	ea427a86-7df1-43ba-8811-827e0d7e1f4b	Entrematic/Amarr	3		13	1
230	2019-12-24 21:29:02.017283+03	dde9e0aa-e06b-4fb5-b90e-23305cfd30c6	Overhead Door Company of Mason City	3		13	1
231	2019-12-24 21:29:02.028269+03	db86d855-8a78-459f-8929-2e7a3f72ee31	Northwest Door	3		13	1
232	2019-12-24 21:29:02.039338+03	d89a96f2-e404-4df7-942a-d01d64ced028	Delden Mfg	3		13	1
233	2019-12-24 21:29:02.050486+03	cbd4ca1f-fb80-4a05-b983-63a9d7f01965	Northwest Door	3		13	1
234	2019-12-24 21:29:02.061367+03	c23e39b5-b9f0-465c-8b1a-4867a4b9b9cf	Amarr Garage Doors	3		13	1
235	2019-12-24 21:29:02.07253+03	c0d829ae-43b1-417a-b95a-3847e09c98fc	OVERHEAD DOOR COMPANY	3		13	1
236	2019-12-24 21:29:02.083505+03	be66835f-7765-41b7-82c6-73d261988dcb	OVERHEAD DOOR COMPANY OF DALLAS	3		13	1
237	2019-12-24 21:29:02.094532+03	ab54e07e-0e9b-4e5b-a1de-d5b8acfdac33	\nCornellCookson	3		13	1
238	2019-12-24 21:29:02.105595+03	a84348cd-65b7-40a8-b3a1-7144c51c8f1c	OVERHEAD DOOR COMPANY	3		13	1
239	2019-12-24 21:29:02.116505+03	912b07f1-2abe-4e27-97d2-201b6d35a169	MIDLAND GARAGE DOORS	3		13	1
240	2019-12-24 21:29:02.127441+03	8dcdb423-37f8-4652-9222-fa407a9b1f19	Wayne Dalton	3		13	1
241	2019-12-24 21:29:02.138523+03	8b38c8df-afb4-487e-b416-bce0b95393af	Hörmann LLC	3		13	1
242	2019-12-24 21:29:02.149445+03	8492dcfa-1924-4b92-ac21-19dceb623af6	Overhead Door of Columbia	3		13	1
243	2019-12-24 21:29:02.160475+03	78d07f4c-edc5-4e31-9f06-cced6bbdde2d	\nAirlift Doors Inc.	3		13	1
244	2019-12-24 21:29:02.171484+03	719f3285-425c-4fdf-a057-fc375dc1577e	Entrematic/Dynaco	3		13	1
245	2019-12-24 21:29:02.182463+03	7068af8d-b87e-46a0-bcb2-cf586fc95aa4	Overhead Door Corporation	3		13	1
246	2019-12-24 21:29:02.193611+03	5e6039d7-431e-4ac7-a05a-8aee5012f03d	Overhead Door Corporation	3		13	1
247	2019-12-24 21:29:02.20468+03	4eb1e818-bee3-4490-852a-3494456faac3	OVERHEAD DOOR COMPANY	3		13	1
248	2019-12-24 21:29:02.215594+03	3ad7c9c1-ad18-4361-b8c3-e3a9d901f8ce	Northwest Door	3		13	1
249	2019-12-24 21:29:02.259641+03	31a18077-ddde-4c56-a9f6-0c9a76506f02	Northwest Door	3		13	1
250	2019-12-24 21:29:02.270699+03	2e286591-f5b8-442a-aa79-a1beab135c35	MIDLAND GARAGE DOORS	3		13	1
251	2019-12-24 21:29:02.281565+03	1594514c-0449-4535-9af9-d0a51d846160	\nJamison Door	3		13	1
252	2019-12-24 21:29:02.292906+03	0e6fd9db-02e5-474a-ba68-e0eebe7bf710	Northwest Door	3		13	1
253	2019-12-24 21:29:02.304254+03	0ae5e3bb-2b0c-4493-a418-a0c309e91850	Overhead Door Corporation	3		13	1
254	2019-12-24 21:29:02.314803+03	0512564b-9a1d-4e2f-bb19-bbfe2141e9fb	C.H.I. Overhead Doors	3		13	1
255	2019-12-24 21:29:02.325808+03	00154e41-ed84-4d6b-8efd-4d8ec85afb61	Northwest Door	3		13	1
256	2019-12-24 21:29:16.624114+03	94e57235-e0f6-4cff-b843-5f06306294b3	Amarr Garage Doors	1	new through import_export	13	1
257	2019-12-24 21:29:16.634774+03	574cbac2-9587-43c4-a3cd-627830f40e57	Delden Mfg	1	new through import_export	13	1
258	2019-12-24 21:29:16.646187+03	7e4bbf3a-5da1-41e1-ad08-d106be3c36e8	MIDLAND GARAGE DOORS	1	new through import_export	13	1
259	2019-12-24 21:29:16.65681+03	e68392cb-2318-48da-bcd0-b8c9a3a00a7e	MIDLAND GARAGE DOORS	1	new through import_export	13	1
260	2019-12-24 21:29:16.667604+03	28b998f4-329a-4d5a-9229-67bb97ddc2ed	MIDLAND GARAGE DOORS	1	new through import_export	13	1
261	2019-12-24 21:29:16.679046+03	f71a149c-982d-4b8e-8e8e-3344ed9077c6	Northwest Door	1	new through import_export	13	1
262	2019-12-24 21:29:16.689498+03	8b7c29eb-6ed6-410c-8793-8ec37cae7e05	Northwest Door	1	new through import_export	13	1
263	2019-12-24 21:29:16.700436+03	2a61c1ea-1744-4070-9565-4b95e339772d	Northwest Door	1	new through import_export	13	1
264	2019-12-24 21:29:16.711728+03	f3b1ac12-e206-4d88-a9c9-ac26b17cbe68	Northwest Door	1	new through import_export	13	1
265	2019-12-24 21:29:16.722465+03	979aa108-c886-48a9-8509-4cc65c9ae2cb	Northwest Door	1	new through import_export	13	1
266	2019-12-24 21:29:16.733872+03	6b957d0c-e7e6-4a2b-a2c8-271da5922372	Northwest Door	1	new through import_export	13	1
267	2019-12-24 21:29:16.745021+03	d64edf61-2068-416c-b5e7-1bc00a2d7253	Northwest Door	1	new through import_export	13	1
268	2019-12-24 21:29:16.755544+03	f506de92-822b-494b-822c-b8ab0f1e6ff5	Raynor Garage Doors	1	new through import_export	13	1
269	2019-12-24 21:29:16.766976+03	e8b7e047-177c-4972-8500-4c881c342757	Wayne Dalton	1	new through import_export	13	1
270	2019-12-24 21:29:16.777826+03	9fc6c6a7-8f18-4d63-a4c0-b0d608e04dc7	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
271	2019-12-24 21:29:16.788563+03	1b61ffc1-619a-4817-abb8-9d4f56d276c6	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
272	2019-12-24 21:29:16.799522+03	1e8c3494-91bd-4d98-b039-4ab8fd4d7a80	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
273	2019-12-24 21:29:16.811296+03	b27a1845-fc0e-4a3e-8ea9-d16f871132d0	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
274	2019-12-24 21:29:16.821464+03	9506b1c9-0cd5-4afb-9516-dd19f4c904f8	Overhead Door of Columbia	1	new through import_export	13	1
275	2019-12-24 21:29:16.832607+03	120fd34f-c585-49f7-95e0-21ef62aab220	Overhead Door Company of Mason City	1	new through import_export	13	1
276	2019-12-24 21:29:16.844322+03	a19ce347-fe2e-4278-8e20-41b7e6bb2e0c	Overhead Door Corporation	1	new through import_export	13	1
277	2019-12-24 21:29:16.854653+03	cd7f3602-3afb-4cab-b621-0d5da097dded	Overhead Door Corporation	1	new through import_export	13	1
278	2019-12-24 21:29:16.950755+03	571671a9-6477-4248-832e-722d3f448122	Overhead Door Corporation	1	new through import_export	13	1
279	2019-12-24 21:29:16.964661+03	212e74c3-32b3-444c-9ed0-9ba434060d47	OVERHEAD DOOR COMPANY OF DALLAS	1	new through import_export	13	1
280	2019-12-24 21:29:16.975777+03	87d8f97d-18f1-4d22-867f-c7d872092555	C.H.I. Overhead Doors	1	new through import_export	13	1
281	2019-12-24 21:29:16.986771+03	707fb2e1-8d6a-4a73-be43-a4fc8ee4174e	\nAirlift Doors Inc.	1	new through import_export	13	1
282	2019-12-24 21:29:16.99769+03	5320f32b-a2c0-4557-8e6d-f64fc9765e08	\nCornellCookson	1	new through import_export	13	1
283	2019-12-24 21:29:17.008635+03	61133ea3-58cf-42dc-b2cb-f4c56b8a3973	Entrematic/Amarr	1	new through import_export	13	1
284	2019-12-24 21:29:17.019626+03	83cbe475-b977-4725-8bc0-df9b68a2c71c	Entrematic/Dynaco	1	new through import_export	13	1
285	2019-12-24 21:29:17.030819+03	4c1c675e-1a65-472d-ba6e-8c1675387372	Hörmann LLC	1	new through import_export	13	1
286	2019-12-24 21:29:17.041715+03	20dc5ce1-60eb-4409-872c-1f73accd8fca	\nJamison Door	1	new through import_export	13	1
287	2019-12-24 21:29:17.052682+03	d2801dd3-7bb2-4583-afd4-474d407f3e4f	\nLawrence Roll-Up Doors, Inc.	1	new through import_export	13	1
288	2019-12-24 21:29:17.064106+03	928cacfe-a3fa-447c-b4ea-6f9e93e26147	Overhead Door Corporation	1	new through import_export	13	1
289	2019-12-24 21:29:17.075034+03	018c5ca4-97aa-4c0a-aeae-af9d336c0768	\nRite-Hite Doors, Inc.	1	new through import_export	13	1
290	2019-12-24 21:29:17.085784+03	ef300c9b-e68e-4b6a-84b8-8c3c4a0a75e2	Rytec Corporation	1	new through import_export	13	1
291	2019-12-24 21:29:17.097012+03	8852c0b8-9168-42cf-ae9e-b62d1bd2ece2	TNR Industrial Doors Inc.	1	new through import_export	13	1
292	2019-12-24 21:48:02.202982+03	f71a149c-982d-4b8e-8e8e-3344ed9077c6	Northwest Door	3		13	1
293	2019-12-24 21:48:02.343632+03	f506de92-822b-494b-822c-b8ab0f1e6ff5	Raynor Garage Doors	3		13	1
294	2019-12-24 21:48:02.387947+03	f3b1ac12-e206-4d88-a9c9-ac26b17cbe68	Northwest Door	3		13	1
295	2019-12-24 21:48:02.453814+03	ef300c9b-e68e-4b6a-84b8-8c3c4a0a75e2	Rytec Corporation	3		13	1
296	2019-12-24 21:48:02.46466+03	e8b7e047-177c-4972-8500-4c881c342757	Wayne Dalton	3		13	1
297	2019-12-24 21:48:02.475662+03	e68392cb-2318-48da-bcd0-b8c9a3a00a7e	MIDLAND GARAGE DOORS	3		13	1
298	2019-12-24 21:48:02.486842+03	e52dee80-375d-4869-8040-dc5972fa71d2	GVA008	3		13	1
299	2019-12-24 21:48:02.497914+03	e3e34eef-aea5-47e8-8d96-ab20a06fa1df	Computer LTD	3		13	1
300	2019-12-24 21:48:02.508896+03	d64edf61-2068-416c-b5e7-1bc00a2d7253	Northwest Door	3		13	1
301	2019-12-24 21:48:02.519751+03	d2801dd3-7bb2-4583-afd4-474d407f3e4f	\nLawrence Roll-Up Doors, Inc.	3		13	1
302	2019-12-24 21:48:02.530814+03	cd7f3602-3afb-4cab-b621-0d5da097dded	Overhead Door Corporation	3		13	1
303	2019-12-24 21:48:02.541903+03	bd3c12bc-4228-46c4-bc5c-9d04e0e97025	Innotech	3		13	1
304	2019-12-24 21:48:02.552985+03	b27a1845-fc0e-4a3e-8ea9-d16f871132d0	OVERHEAD DOOR COMPANY	3		13	1
305	2019-12-24 21:48:02.563747+03	a19ce347-fe2e-4278-8e20-41b7e6bb2e0c	Overhead Door Corporation	3		13	1
306	2019-12-24 21:48:02.574618+03	9fc6c6a7-8f18-4d63-a4c0-b0d608e04dc7	OVERHEAD DOOR COMPANY	3		13	1
307	2019-12-24 21:48:02.585996+03	979aa108-c886-48a9-8509-4cc65c9ae2cb	Northwest Door	3		13	1
308	2019-12-24 21:48:02.59692+03	9506b1c9-0cd5-4afb-9516-dd19f4c904f8	Overhead Door of Columbia	3		13	1
309	2019-12-24 21:48:02.607903+03	94e57235-e0f6-4cff-b843-5f06306294b3	Amarr Garage Doors	3		13	1
310	2019-12-24 21:48:02.618907+03	928cacfe-a3fa-447c-b4ea-6f9e93e26147	Overhead Door Corporation	3		13	1
311	2019-12-24 21:48:02.629973+03	8b7c29eb-6ed6-410c-8793-8ec37cae7e05	Northwest Door	3		13	1
312	2019-12-24 21:48:02.6408+03	8852c0b8-9168-42cf-ae9e-b62d1bd2ece2	TNR Industrial Doors Inc.	3		13	1
313	2019-12-24 21:48:02.65184+03	87d8f97d-18f1-4d22-867f-c7d872092555	C.H.I. Overhead Doors	3		13	1
314	2019-12-24 21:48:02.66287+03	83cbe475-b977-4725-8bc0-df9b68a2c71c	Entrematic/Dynaco	3		13	1
315	2019-12-24 21:48:02.673935+03	7e4bbf3a-5da1-41e1-ad08-d106be3c36e8	MIDLAND GARAGE DOORS	3		13	1
316	2019-12-24 21:48:02.751802+03	707fb2e1-8d6a-4a73-be43-a4fc8ee4174e	\nAirlift Doors Inc.	3		13	1
317	2019-12-24 21:48:02.762225+03	6b957d0c-e7e6-4a2b-a2c8-271da5922372	Northwest Door	3		13	1
318	2019-12-24 21:48:02.773539+03	61133ea3-58cf-42dc-b2cb-f4c56b8a3973	Entrematic/Amarr	3		13	1
319	2019-12-24 21:48:02.784519+03	574cbac2-9587-43c4-a3cd-627830f40e57	Delden Mfg	3		13	1
320	2019-12-24 21:48:02.79544+03	571671a9-6477-4248-832e-722d3f448122	Overhead Door Corporation	3		13	1
321	2019-12-24 21:48:02.806752+03	5320f32b-a2c0-4557-8e6d-f64fc9765e08	\nCornellCookson	3		13	1
322	2019-12-24 21:48:02.817574+03	52ba09c3-1440-4984-857b-36340ef4ce03	ГК РОВЕН	3		13	1
323	2019-12-24 21:48:02.82847+03	4c1c675e-1a65-472d-ba6e-8c1675387372	Hörmann LLC	3		13	1
324	2019-12-24 21:48:02.839437+03	2a61c1ea-1744-4070-9565-4b95e339772d	Northwest Door	3		13	1
325	2019-12-24 21:48:02.850443+03	28b998f4-329a-4d5a-9229-67bb97ddc2ed	MIDLAND GARAGE DOORS	3		13	1
326	2019-12-24 21:48:02.861481+03	212e74c3-32b3-444c-9ed0-9ba434060d47	OVERHEAD DOOR COMPANY OF DALLAS	3		13	1
327	2019-12-24 21:48:02.872388+03	20dc5ce1-60eb-4409-872c-1f73accd8fca	\nJamison Door	3		13	1
328	2019-12-24 21:48:02.883315+03	1e8c3494-91bd-4d98-b039-4ab8fd4d7a80	OVERHEAD DOOR COMPANY	3		13	1
329	2019-12-24 21:48:02.894436+03	1b61ffc1-619a-4817-abb8-9d4f56d276c6	OVERHEAD DOOR COMPANY	3		13	1
330	2019-12-24 21:48:02.905344+03	120fd34f-c585-49f7-95e0-21ef62aab220	Overhead Door Company of Mason City	3		13	1
331	2019-12-24 21:48:02.916359+03	018c5ca4-97aa-4c0a-aeae-af9d336c0768	\nRite-Hite Doors, Inc.	3		13	1
332	2019-12-24 21:48:55.561432+03	c889f710-0983-4c37-90d2-541720ba8cd4	Rytec Corporation	3		13	1
333	2019-12-24 21:48:55.800726+03	ab840c93-1f42-49b4-85a8-d537795303e5	Raynor Garage Doors	3		13	1
334	2019-12-24 21:48:55.866475+03	a8e8136c-683f-4563-abbd-1a5291f8bfcd	Northwest Door	3		13	1
335	2019-12-24 21:48:56.0209+03	8ad56a9c-e0f2-461a-9a50-e026de79cbb9	Northwest Door	3		13	1
336	2019-12-24 21:48:56.043464+03	5a706852-b399-460a-8887-26ea8fe21951	Wayne Dalton	3		13	1
337	2019-12-24 21:48:56.054314+03	512832bf-d966-4fb0-a745-4ccb2ce3f8e8	MIDLAND GARAGE DOORS	3		13	1
338	2019-12-24 21:53:18.249846+03	fa435eba-d3eb-4de7-a20a-d75c04ffb72f	Northwest Door	1	new through import_export	13	1
339	2019-12-24 21:53:18.2682+03	e9a09dec-be68-4230-ae3e-e2a715df6afa	Raynor Garage Doors	1	new through import_export	13	1
340	2019-12-24 21:53:18.27911+03	c17732d9-a429-45f2-bf85-52f1d8e8bc76	Northwest Door	1	new through import_export	13	1
341	2019-12-24 21:53:18.290041+03	b6424d18-a4e6-42d0-9372-a0b394351249	Rytec Corporation	1	new through import_export	13	1
342	2019-12-24 21:53:18.301188+03	1acea087-5639-45dc-9c11-fc3c37008077	Wayne Dalton	1	new through import_export	13	1
343	2019-12-24 21:53:18.312354+03	af50618d-81af-48f4-b078-1f1cf9f1f1b3	MIDLAND GARAGE DOORS	1	new through import_export	13	1
344	2019-12-24 21:53:18.323265+03	61a1218c-1418-4bd5-9e1d-3f2ae74575b8	GVA008	1	new through import_export	13	1
345	2019-12-24 21:53:18.334173+03	bc6d9160-622f-40c3-92c6-62d390a72347	Computer LTD	1	new through import_export	13	1
346	2019-12-24 21:53:18.345245+03	dd1ecca7-28bc-4bdb-a2d9-6d0efe0de138	Northwest Door	1	new through import_export	13	1
347	2019-12-24 21:53:18.356118+03	881f3dd3-54cf-4806-9ca9-6bfd10f0678e	\nLawrence Roll-Up Doors, Inc.	1	new through import_export	13	1
348	2019-12-24 21:53:18.367202+03	3cb8d06b-310e-474b-a30c-c176ea8f5a80	Overhead Door Corporation	1	new through import_export	13	1
349	2019-12-24 21:53:18.378183+03	ce4bcaaf-a56e-4968-8334-eeb4a5297480	Innotech	1	new through import_export	13	1
350	2019-12-24 21:53:18.389161+03	7aeefb71-0aed-40e1-a10a-fd9f9d2bf804	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
351	2019-12-24 21:53:18.40026+03	a5180229-448f-4ce5-8e7f-d52e707dbf12	Overhead Door Corporation	1	new through import_export	13	1
352	2019-12-24 21:53:18.411407+03	41752b94-aea5-447f-9a06-ae9631dfc2f5	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
353	2019-12-24 21:53:18.422326+03	3fa3013e-11cb-40c6-a234-71ad04d4d48b	Northwest Door	1	new through import_export	13	1
354	2019-12-24 21:53:18.433427+03	26ea94f6-004a-4305-bf21-fd490021a7c3	Overhead Door of Columbia	1	new through import_export	13	1
355	2019-12-24 21:53:18.444478+03	cf6ebd35-0c44-44e9-b15f-f46d11b2a00b	Amarr Garage Doors	1	new through import_export	13	1
356	2019-12-24 21:53:18.455429+03	8ac67bf8-88dd-4384-8075-b8a4a4b11184	Overhead Door Corporation	1	new through import_export	13	1
357	2019-12-24 21:53:18.466308+03	9e1b628b-3df9-490f-8b96-f82207c5b3b6	Northwest Door	1	new through import_export	13	1
358	2019-12-24 21:53:18.477345+03	8c29a3c2-e212-426e-bd86-ccc58479f342	TNR Industrial Doors Inc.	1	new through import_export	13	1
359	2019-12-24 21:53:18.48875+03	59cf9ee2-5074-4726-9350-3ecafecfda23	C.H.I. Overhead Doors	1	new through import_export	13	1
360	2019-12-24 21:53:18.49942+03	af8c0f7f-fdfd-49e7-95c8-6e0fd46ee691	Entrematic/Dynaco	1	new through import_export	13	1
361	2019-12-24 21:53:18.510377+03	418dd00c-a79b-4919-8c1d-c765fc489584	MIDLAND GARAGE DOORS	1	new through import_export	13	1
362	2019-12-24 21:53:18.521507+03	35cce5c1-5b8a-4c47-b3f3-3600da43b3d5	\nAirlift Doors Inc.	1	new through import_export	13	1
363	2019-12-24 21:53:18.532379+03	6d8d625f-2a59-4d8b-a449-ac2b3fbb4d22	Northwest Door	1	new through import_export	13	1
364	2019-12-24 21:53:18.543363+03	c2e82f01-ac82-4f2f-b494-f12110a29e07	Entrematic/Amarr	1	new through import_export	13	1
365	2019-12-24 21:53:18.554627+03	f7d600a5-1424-423a-a1bc-ee246568d731	Delden Mfg	1	new through import_export	13	1
366	2019-12-24 21:53:18.565352+03	5b98dcb2-de85-4af7-9465-f424e824a3b6	Overhead Door Corporation	1	new through import_export	13	1
367	2019-12-24 21:53:18.57649+03	cd727eef-359f-4ead-9310-b6582f98f279	\nCornellCookson	1	new through import_export	13	1
368	2019-12-24 21:53:18.587528+03	a88667ae-4e96-4c53-bc03-6a1640077d3d	ГК РОВЕН	1	new through import_export	13	1
369	2019-12-24 21:53:18.598488+03	9dec7d19-ed81-42e6-89e4-f125537a0e31	Hörmann LLC	1	new through import_export	13	1
370	2019-12-24 21:53:18.609539+03	9ddf7ae2-9552-47ca-a12d-84374e49bc36	Northwest Door	1	new through import_export	13	1
371	2019-12-24 21:53:18.620619+03	f24012bf-614b-4db6-8756-130431af4fe7	MIDLAND GARAGE DOORS	1	new through import_export	13	1
372	2019-12-24 21:53:18.631528+03	b6cd540b-54a0-4f3a-9c61-41210125446f	OVERHEAD DOOR COMPANY OF DALLAS	1	new through import_export	13	1
373	2019-12-24 21:53:18.642496+03	178f912f-884f-417b-bcd1-4c8c0bac3f24	\nJamison Door	1	new through import_export	13	1
374	2019-12-24 21:53:18.65365+03	d2dfe96e-5cd1-4838-9a96-3f83597f5338	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
375	2019-12-24 21:53:18.665156+03	f1df7972-ace2-461b-9d05-03fc21702000	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
376	2019-12-24 21:53:18.675734+03	6c50167e-6c2d-43fb-be91-aa937a16dd69	Overhead Door Company of Mason City	1	new through import_export	13	1
377	2019-12-24 21:53:18.686766+03	8b12fc9f-a51e-4958-ab4a-664769ad7a05	\nRite-Hite Doors, Inc.	1	new through import_export	13	1
378	2019-12-24 21:53:49.510222+03	ce4bcaaf-a56e-4968-8334-eeb4a5297480	Innotech	2	[{"changed": {"fields": ["country"]}}]	13	1
379	2019-12-24 21:54:04.266328+03	bc6d9160-622f-40c3-92c6-62d390a72347	Computer LTD	2	[{"changed": {"fields": ["country"]}}]	13	1
380	2019-12-24 21:54:33.992382+03	a88667ae-4e96-4c53-bc03-6a1640077d3d	ГК РОВЕН	2	[{"changed": {"fields": ["slug", "country", "about"]}}]	13	1
381	2019-12-24 21:54:51.580996+03	61a1218c-1418-4bd5-9e1d-3f2ae74575b8	GVA008	2	[{"changed": {"fields": ["country"]}}]	13	1
382	2019-12-24 22:14:42.525699+03	cd727eef-359f-4ead-9310-b6582f98f279	CornellCookson	2	[{"changed": {"fields": ["company", "address", "enable_mailing"]}}]	13	1
383	2019-12-24 22:14:51.397699+03	c2e82f01-ac82-4f2f-b494-f12110a29e07	Entrematic/Amarr	2	[{"changed": {"fields": ["address", "enable_mailing"]}}]	13	1
384	2019-12-24 22:15:01.323012+03	b6424d18-a4e6-42d0-9372-a0b394351249	Rytec Corporation	2	[{"changed": {"fields": ["address", "enable_mailing"]}}]	13	1
385	2019-12-24 22:15:11.36921+03	af8c0f7f-fdfd-49e7-95c8-6e0fd46ee691	Entrematic/Dynaco	2	[{"changed": {"fields": ["address", "enable_mailing"]}}]	13	1
386	2019-12-24 22:15:19.8203+03	a88667ae-4e96-4c53-bc03-6a1640077d3d	ГК РОВЕН	2	[{"changed": {"fields": ["enable_mailing"]}}]	13	1
387	2019-12-24 22:15:38.071872+03	9dec7d19-ed81-42e6-89e4-f125537a0e31	Hörmann LLC	2	[{"changed": {"fields": ["slug", "address", "enable_mailing"]}}]	13	1
388	2019-12-24 22:15:47.086301+03	8c29a3c2-e212-426e-bd86-ccc58479f342	TNR Industrial Doors Inc.	2	[{"changed": {"fields": ["address", "enable_mailing"]}}]	13	1
389	2019-12-24 22:15:56.019285+03	8b12fc9f-a51e-4958-ab4a-664769ad7a05	Rite-Hite Doors, Inc.	2	[{"changed": {"fields": ["company", "address", "enable_mailing"]}}]	13	1
390	2019-12-24 22:16:04.968149+03	8ac67bf8-88dd-4384-8075-b8a4a4b11184	Overhead Door Corporation	2	[{"changed": {"fields": ["address", "enable_mailing"]}}]	13	1
391	2019-12-24 22:16:13.677129+03	881f3dd3-54cf-4806-9ca9-6bfd10f0678e	Lawrence Roll-Up Doors, Inc.	2	[{"changed": {"fields": ["company", "address", "enable_mailing"]}}]	13	1
392	2019-12-24 22:16:22.985155+03	178f912f-884f-417b-bcd1-4c8c0bac3f24	Jamison Door	2	[{"changed": {"fields": ["company", "address", "enable_mailing"]}}]	13	1
393	2019-12-24 22:32:58.053497+03	fa435eba-d3eb-4de7-a20a-d75c04ffb72f	Northwest Door	3		13	1
394	2019-12-24 22:32:58.106824+03	f7d600a5-1424-423a-a1bc-ee246568d731	Delden Mfg	3		13	1
395	2019-12-24 22:32:58.117766+03	f24012bf-614b-4db6-8756-130431af4fe7	MIDLAND GARAGE DOORS	3		13	1
396	2019-12-24 22:32:58.128858+03	f1df7972-ace2-461b-9d05-03fc21702000	OVERHEAD DOOR COMPANY	3		13	1
397	2019-12-24 22:32:58.139822+03	e9a09dec-be68-4230-ae3e-e2a715df6afa	Raynor Garage Doors	3		13	1
398	2019-12-24 22:32:58.150773+03	dd1ecca7-28bc-4bdb-a2d9-6d0efe0de138	Northwest Door	3		13	1
399	2019-12-24 22:32:58.162235+03	d2dfe96e-5cd1-4838-9a96-3f83597f5338	OVERHEAD DOOR COMPANY	3		13	1
400	2019-12-24 22:32:58.172758+03	cf6ebd35-0c44-44e9-b15f-f46d11b2a00b	Amarr Garage Doors	3		13	1
401	2019-12-24 22:32:58.183775+03	cd727eef-359f-4ead-9310-b6582f98f279	CornellCookson	3		13	1
402	2019-12-24 22:32:58.194819+03	c2e82f01-ac82-4f2f-b494-f12110a29e07	Entrematic/Amarr	3		13	1
403	2019-12-24 22:32:58.205817+03	c17732d9-a429-45f2-bf85-52f1d8e8bc76	Northwest Door	3		13	1
404	2019-12-24 22:32:58.216805+03	b6cd540b-54a0-4f3a-9c61-41210125446f	OVERHEAD DOOR COMPANY OF DALLAS	3		13	1
405	2019-12-24 22:32:58.228228+03	b6424d18-a4e6-42d0-9372-a0b394351249	Rytec Corporation	3		13	1
406	2019-12-24 22:32:58.238733+03	af8c0f7f-fdfd-49e7-95c8-6e0fd46ee691	Entrematic/Dynaco	3		13	1
407	2019-12-24 22:32:58.24984+03	af50618d-81af-48f4-b078-1f1cf9f1f1b3	MIDLAND GARAGE DOORS	3		13	1
408	2019-12-24 22:32:58.260991+03	a5180229-448f-4ce5-8e7f-d52e707dbf12	Overhead Door Corporation	3		13	1
409	2019-12-24 22:32:58.305031+03	9e1b628b-3df9-490f-8b96-f82207c5b3b6	Northwest Door	3		13	1
410	2019-12-24 22:32:58.331824+03	9dec7d19-ed81-42e6-89e4-f125537a0e31	Hörmann LLC	3		13	1
411	2019-12-24 22:32:58.348966+03	9ddf7ae2-9552-47ca-a12d-84374e49bc36	Northwest Door	3		13	1
412	2019-12-24 22:32:58.360048+03	8c29a3c2-e212-426e-bd86-ccc58479f342	TNR Industrial Doors Inc.	3		13	1
413	2019-12-24 22:32:58.370964+03	8b12fc9f-a51e-4958-ab4a-664769ad7a05	Rite-Hite Doors, Inc.	3		13	1
414	2019-12-24 22:32:58.382189+03	8ac67bf8-88dd-4384-8075-b8a4a4b11184	Overhead Door Corporation	3		13	1
415	2019-12-24 22:32:58.393884+03	881f3dd3-54cf-4806-9ca9-6bfd10f0678e	Lawrence Roll-Up Doors, Inc.	3		13	1
416	2019-12-24 22:32:58.403963+03	7aeefb71-0aed-40e1-a10a-fd9f9d2bf804	OVERHEAD DOOR COMPANY	3		13	1
417	2019-12-24 22:32:58.415102+03	6d8d625f-2a59-4d8b-a449-ac2b3fbb4d22	Northwest Door	3		13	1
418	2019-12-24 22:32:58.426647+03	6c50167e-6c2d-43fb-be91-aa937a16dd69	Overhead Door Company of Mason City	3		13	1
419	2019-12-24 22:32:58.437214+03	5b98dcb2-de85-4af7-9465-f424e824a3b6	Overhead Door Corporation	3		13	1
420	2019-12-24 22:32:58.448321+03	59cf9ee2-5074-4726-9350-3ecafecfda23	C.H.I. Overhead Doors	3		13	1
421	2019-12-24 22:32:58.459266+03	418dd00c-a79b-4919-8c1d-c765fc489584	MIDLAND GARAGE DOORS	3		13	1
422	2019-12-24 22:32:58.470349+03	41752b94-aea5-447f-9a06-ae9631dfc2f5	OVERHEAD DOOR COMPANY	3		13	1
423	2019-12-24 22:32:58.481236+03	3fa3013e-11cb-40c6-a234-71ad04d4d48b	Northwest Door	3		13	1
424	2019-12-24 22:32:58.492229+03	3cb8d06b-310e-474b-a30c-c176ea8f5a80	Overhead Door Corporation	3		13	1
425	2019-12-24 22:32:58.503236+03	35cce5c1-5b8a-4c47-b3f3-3600da43b3d5	\nAirlift Doors Inc.	3		13	1
426	2019-12-24 22:32:58.514347+03	26ea94f6-004a-4305-bf21-fd490021a7c3	Overhead Door of Columbia	3		13	1
427	2019-12-24 22:32:58.525248+03	1acea087-5639-45dc-9c11-fc3c37008077	Wayne Dalton	3		13	1
428	2019-12-24 22:32:58.536524+03	178f912f-884f-417b-bcd1-4c8c0bac3f24	Jamison Door	3		13	1
429	2019-12-24 22:33:38.898079+03	92d0cba4-5911-4137-bbd1-5ed04eab16b9	Amarr Garage Doors	1	new through import_export	13	1
430	2019-12-24 22:33:38.907143+03	a992892c-3d03-46e9-b616-5759e940d8b4	Delden Mfg	1	new through import_export	13	1
431	2019-12-24 22:33:38.917755+03	3ac4e94b-208d-456b-af14-446b890bbefe	MIDLAND GARAGE DOORS	1	new through import_export	13	1
432	2019-12-24 22:33:38.928922+03	4a542e1a-57da-4867-867b-c8d81bbf590a	MIDLAND GARAGE DOORS	1	new through import_export	13	1
433	2019-12-24 22:33:38.939949+03	ebbdfce4-e230-415b-b7d9-200348ea5e8f	MIDLAND GARAGE DOORS	1	new through import_export	13	1
434	2019-12-24 22:33:38.951178+03	adde1f01-6297-4aa7-81dc-22e4484a5243	Northwest Door	1	new through import_export	13	1
435	2019-12-24 22:33:38.962181+03	f4b87b50-186e-4e14-8484-fa3c82f7e61b	Northwest Door	1	new through import_export	13	1
436	2019-12-24 22:33:38.973093+03	5f19118f-22b5-472f-9714-9e21be23faca	Northwest Door	1	new through import_export	13	1
437	2019-12-24 22:33:38.9841+03	1e9f221b-3e14-43d3-beee-8997a8b5f78d	Northwest Door	1	new through import_export	13	1
438	2019-12-24 22:33:38.995089+03	af760d0d-df3e-4d12-af28-22680acb7d42	Northwest Door	1	new through import_export	13	1
439	2019-12-24 22:33:39.006083+03	d16ceaa1-48f9-4e6c-be68-3700d19ee729	Northwest Door	1	new through import_export	13	1
440	2019-12-24 22:33:39.016968+03	3601690f-20a8-4a2f-990c-dd8e9ee5c5d0	Northwest Door	1	new through import_export	13	1
441	2019-12-24 22:33:39.028051+03	ae40d4c3-5012-4dd0-9323-ea2a292f3bd0	Raynor Garage Doors	1	new through import_export	13	1
442	2019-12-24 22:33:39.039434+03	ebef5e03-f87a-4935-bae2-8580c18d80b4	Wayne Dalton	1	new through import_export	13	1
443	2019-12-24 22:33:39.050526+03	b3587c7c-6352-4dce-afd2-aef142b27f45	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
444	2019-12-24 22:33:39.061349+03	6c130c9b-f2a5-4bfd-bae4-1d7b10c176fd	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
445	2019-12-24 22:33:39.072288+03	cda1c9b4-4ebc-44b9-a502-391ff950ad52	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
446	2019-12-24 22:33:39.083332+03	ce805da0-cf0d-432b-aae6-ddcda5a6242b	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
511	2019-12-24 22:53:49.173934+03	798bea4f-c0e3-4cf8-b61c-5c3133424fad	Northwest Door	1	new through import_export	13	1
447	2019-12-24 22:33:39.094231+03	5a58b1d1-0d90-4d2e-8e14-a42cebc213ea	Overhead Door of Columbia	1	new through import_export	13	1
448	2019-12-24 22:33:39.126946+03	631cc25a-f00d-4cff-a4a1-b215b95d670f	Overhead Door Company of Mason City	1	new through import_export	13	1
449	2019-12-24 22:33:39.138078+03	989af04d-efb1-46ce-8d75-9c239191315c	Overhead Door Corporation	1	new through import_export	13	1
450	2019-12-24 22:33:39.149087+03	9ebc4365-7432-4506-8302-30889e968d76	Overhead Door Corporation	1	new through import_export	13	1
451	2019-12-24 22:33:39.160171+03	25a91200-ff74-4bc1-820b-c9e4939c8b01	Overhead Door Corporation	1	new through import_export	13	1
452	2019-12-24 22:33:39.171047+03	e7550e80-e89f-4b90-ba43-4b9e5aa5db5f	OVERHEAD DOOR COMPANY OF DALLAS	1	new through import_export	13	1
453	2019-12-24 22:33:39.18206+03	fb25f598-3f8a-44de-a996-86c02da2a0e8	C.H.I. Overhead Doors	1	new through import_export	13	1
454	2019-12-24 22:33:39.19319+03	b9f85d00-d10d-4e5d-8b4b-ec84074918dc	\nAirlift Doors Inc.	1	new through import_export	13	1
455	2019-12-24 22:33:39.204313+03	caa46878-5267-4925-9f41-f6e02e8224fa	\nCornellCookson	1	new through import_export	13	1
456	2019-12-24 22:33:39.215292+03	0eb9b500-dd44-4e04-ab21-ba57fb47f32f	Entrematic/Amarr	1	new through import_export	13	1
457	2019-12-24 22:33:39.226399+03	803954a5-a937-4ddb-b041-9834c73ef313	Entrematic/Dynaco	1	new through import_export	13	1
458	2019-12-24 22:33:39.237699+03	3593258c-7019-4f20-8bdf-48ef6c075d51	Hörmann LLC	1	new through import_export	13	1
459	2019-12-24 22:33:39.248479+03	e401606c-d426-43b5-9575-5f1b9dfede77	\nJamison Door	1	new through import_export	13	1
460	2019-12-24 22:33:39.259501+03	9fefe6cd-66a0-4d91-8d45-d8ef71842682	\nLawrence Roll-Up Doors, Inc.	1	new through import_export	13	1
461	2019-12-24 22:33:39.270502+03	5e489838-898f-4dfa-872e-1da6712f7272	Overhead Door Corporation	1	new through import_export	13	1
462	2019-12-24 22:33:39.281271+03	ad118961-b7de-4a9d-b193-12cf60ff837d	\nRite-Hite Doors, Inc.	1	new through import_export	13	1
463	2019-12-24 22:33:39.292439+03	c9894edf-0b1c-4912-9a6a-f1bcd3ab2a38	Rytec Corporation	1	new through import_export	13	1
464	2019-12-24 22:33:39.303287+03	12a64599-d963-425e-a73d-cd3fa46c2386	TNR Industrial Doors Inc.	1	new through import_export	13	1
465	2019-12-24 22:37:31.195181+03	fb25f598-3f8a-44de-a996-86c02da2a0e8	C.H.I. Overhead Doors	3		13	1
466	2019-12-24 22:37:31.219162+03	f4b87b50-186e-4e14-8484-fa3c82f7e61b	Northwest Door	3		13	1
467	2019-12-24 22:37:31.230229+03	ebef5e03-f87a-4935-bae2-8580c18d80b4	Wayne Dalton	3		13	1
468	2019-12-24 22:37:31.241584+03	ebbdfce4-e230-415b-b7d9-200348ea5e8f	MIDLAND GARAGE DOORS	3		13	1
469	2019-12-24 22:37:31.252228+03	e7550e80-e89f-4b90-ba43-4b9e5aa5db5f	OVERHEAD DOOR COMPANY OF DALLAS	3		13	1
470	2019-12-24 22:37:31.263313+03	e401606c-d426-43b5-9575-5f1b9dfede77	\nJamison Door	3		13	1
471	2019-12-24 22:37:31.274369+03	d16ceaa1-48f9-4e6c-be68-3700d19ee729	Northwest Door	3		13	1
472	2019-12-24 22:37:31.285325+03	ce805da0-cf0d-432b-aae6-ddcda5a6242b	OVERHEAD DOOR COMPANY	3		13	1
473	2019-12-24 22:37:31.296349+03	cda1c9b4-4ebc-44b9-a502-391ff950ad52	OVERHEAD DOOR COMPANY	3		13	1
474	2019-12-24 22:37:31.30721+03	caa46878-5267-4925-9f41-f6e02e8224fa	\nCornellCookson	3		13	1
475	2019-12-24 22:37:31.318527+03	c9894edf-0b1c-4912-9a6a-f1bcd3ab2a38	Rytec Corporation	3		13	1
476	2019-12-24 22:37:31.329159+03	b9f85d00-d10d-4e5d-8b4b-ec84074918dc	\nAirlift Doors Inc.	3		13	1
477	2019-12-24 22:37:31.340287+03	b3587c7c-6352-4dce-afd2-aef142b27f45	OVERHEAD DOOR COMPANY	3		13	1
478	2019-12-24 22:37:31.351309+03	af760d0d-df3e-4d12-af28-22680acb7d42	Northwest Door	3		13	1
479	2019-12-24 22:37:31.362287+03	ae40d4c3-5012-4dd0-9323-ea2a292f3bd0	Raynor Garage Doors	3		13	1
480	2019-12-24 22:37:31.373358+03	adde1f01-6297-4aa7-81dc-22e4484a5243	Northwest Door	3		13	1
481	2019-12-24 22:37:31.384426+03	ad118961-b7de-4a9d-b193-12cf60ff837d	\nRite-Hite Doors, Inc.	3		13	1
482	2019-12-24 22:37:31.395421+03	a992892c-3d03-46e9-b616-5759e940d8b4	Delden Mfg	3		13	1
483	2019-12-24 22:37:31.406371+03	9fefe6cd-66a0-4d91-8d45-d8ef71842682	\nLawrence Roll-Up Doors, Inc.	3		13	1
484	2019-12-24 22:37:31.417411+03	9ebc4365-7432-4506-8302-30889e968d76	Overhead Door Corporation	3		13	1
485	2019-12-24 22:37:31.428654+03	989af04d-efb1-46ce-8d75-9c239191315c	Overhead Door Corporation	3		13	1
486	2019-12-24 22:37:31.439452+03	92d0cba4-5911-4137-bbd1-5ed04eab16b9	Amarr Garage Doors	3		13	1
487	2019-12-24 22:37:31.450429+03	803954a5-a937-4ddb-b041-9834c73ef313	Entrematic/Dynaco	3		13	1
488	2019-12-24 22:37:31.461508+03	6c130c9b-f2a5-4bfd-bae4-1d7b10c176fd	OVERHEAD DOOR COMPANY	3		13	1
489	2019-12-24 22:37:31.472498+03	631cc25a-f00d-4cff-a4a1-b215b95d670f	Overhead Door Company of Mason City	3		13	1
490	2019-12-24 22:37:31.483577+03	5f19118f-22b5-472f-9714-9e21be23faca	Northwest Door	3		13	1
491	2019-12-24 22:37:31.494489+03	5e489838-898f-4dfa-872e-1da6712f7272	Overhead Door Corporation	3		13	1
492	2019-12-24 22:37:31.505799+03	5a58b1d1-0d90-4d2e-8e14-a42cebc213ea	Overhead Door of Columbia	3		13	1
493	2019-12-24 22:37:31.516442+03	4a542e1a-57da-4867-867b-c8d81bbf590a	MIDLAND GARAGE DOORS	3		13	1
494	2019-12-24 22:37:31.527571+03	3ac4e94b-208d-456b-af14-446b890bbefe	MIDLAND GARAGE DOORS	3		13	1
495	2019-12-24 22:37:31.539233+03	3601690f-20a8-4a2f-990c-dd8e9ee5c5d0	Northwest Door	3		13	1
496	2019-12-24 22:37:31.549529+03	3593258c-7019-4f20-8bdf-48ef6c075d51	Hörmann LLC	3		13	1
497	2019-12-24 22:37:31.560919+03	25a91200-ff74-4bc1-820b-c9e4939c8b01	Overhead Door Corporation	3		13	1
498	2019-12-24 22:37:31.572073+03	1e9f221b-3e14-43d3-beee-8997a8b5f78d	Northwest Door	3		13	1
499	2019-12-24 22:37:31.582542+03	12a64599-d963-425e-a73d-cd3fa46c2386	TNR Industrial Doors Inc.	3		13	1
500	2019-12-24 22:37:31.593693+03	0eb9b500-dd44-4e04-ab21-ba57fb47f32f	Entrematic/Amarr	3		13	1
501	2019-12-24 22:53:48.937126+03	2b1872ed-70b0-442b-b30f-9d55f6045339	Amarr Garage Doors	1	new through import_export	13	1
502	2019-12-24 22:53:49.074907+03	88c0608e-aaf5-40e1-ac96-8ae4c0272f16	Delden Mfg	1	new through import_export	13	1
503	2019-12-24 22:53:49.085374+03	aca5c232-2cc3-4418-82a0-e79510939d10	MIDLAND GARAGE DOORS	1	new through import_export	13	1
504	2019-12-24 22:53:49.096436+03	70ec1a85-a831-44c0-b858-6b249e4deb00	MIDLAND GARAGE DOORS	1	new through import_export	13	1
505	2019-12-24 22:53:49.107441+03	2f48d29e-a657-4f59-a957-909eb42b431a	MIDLAND GARAGE DOORS	1	new through import_export	13	1
506	2019-12-24 22:53:49.118498+03	d74d71bb-37a3-4335-9bd2-e30432ddded3	Northwest Door	1	new through import_export	13	1
507	2019-12-24 22:53:49.129853+03	021197c5-909f-4750-963b-28f9a414ef2e	Northwest Door	1	new through import_export	13	1
508	2019-12-24 22:53:49.140992+03	a22e1515-3c51-4838-8fd9-fc500999c748	Northwest Door	1	new through import_export	13	1
509	2019-12-24 22:53:49.151858+03	213b72f4-1092-4d0c-a5b1-1b4e7420763d	Northwest Door	1	new through import_export	13	1
510	2019-12-24 22:53:49.162889+03	42c38d30-a257-4bae-a3e2-478bf95e17be	Northwest Door	1	new through import_export	13	1
512	2019-12-24 22:53:49.184999+03	e196a021-e679-4ec7-a6ac-15469051cecd	Northwest Door	1	new through import_export	13	1
513	2019-12-24 22:53:49.240078+03	e5210c95-e199-4cab-b89e-6de8622ae507	Raynor Garage Doors	1	new through import_export	13	1
514	2019-12-24 22:53:49.251057+03	706c6ea7-9b33-40df-a5f5-e16ea928bc98	Wayne Dalton	1	new through import_export	13	1
515	2019-12-24 22:53:49.261995+03	fee4626c-ffad-4468-ab44-87a6832f13ff	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
516	2019-12-24 22:53:49.272787+03	5dec6207-c36c-4011-bc3a-68c7986b3230	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
517	2019-12-24 22:53:49.283598+03	0ae30071-acf0-439c-b097-9de9f98a8a3d	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
518	2019-12-24 22:53:49.31691+03	9bef83c5-dfee-4bb3-9e1e-d007e8d54d39	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
519	2019-12-24 22:53:49.361421+03	c1a10e06-d207-43a2-ba04-810a895c9c9a	Overhead Door of Columbia	1	new through import_export	13	1
520	2019-12-24 22:53:49.404681+03	7621ec7e-11a2-41a8-a26c-f431767c0358	Overhead Door Company of Mason City	1	new through import_export	13	1
521	2019-12-24 22:53:49.416093+03	22df121d-9f53-48c9-a15e-36a78dd4dbf2	Overhead Door Corporation	1	new through import_export	13	1
522	2019-12-24 22:53:49.427183+03	4b6132ce-0733-493b-bd6b-f3671c5ca8ea	Overhead Door Corporation	1	new through import_export	13	1
523	2019-12-24 22:53:49.438337+03	52262112-c395-42ef-88bb-90579fe360cb	Overhead Door Corporation	1	new through import_export	13	1
524	2019-12-24 22:53:49.449251+03	d2624281-14ad-4ffb-9ef7-f029b8540ba3	OVERHEAD DOOR COMPANY OF DALLAS	1	new through import_export	13	1
525	2019-12-24 22:53:49.460284+03	696eeaf9-f7d2-41b6-96ee-7b48e45b99f8	C.H.I. Overhead Doors	1	new through import_export	13	1
526	2019-12-24 22:53:49.471192+03	d89e5ac2-777c-42dc-b5a3-e780b981b33e	\nAirlift Doors Inc.	1	new through import_export	13	1
527	2019-12-24 22:53:49.482143+03	bd4703f9-31e6-4b04-bd26-e6145e76f873	\nCornellCookson	1	new through import_export	13	1
528	2019-12-24 22:53:49.493378+03	f9d16c4d-c466-4dea-b086-8aa03999b8c5	Entrematic/Amarr	1	new through import_export	13	1
529	2019-12-24 22:53:49.504987+03	8a4e6975-13b9-4ff0-ac07-aaa6a2fb3197	Entrematic/Dynaco	1	new through import_export	13	1
530	2019-12-24 22:53:49.515282+03	e660023d-53f0-4977-84b2-c1407075f0ca	Hörmann LLC	1	new through import_export	13	1
531	2019-12-24 22:53:49.5264+03	5670b969-339f-479a-badb-d663a3c747b3	\nJamison Door	1	new through import_export	13	1
532	2019-12-24 22:53:49.537122+03	8e61b286-bcbc-4619-9ee2-28c9b93651f1	\nLawrence Roll-Up Doors, Inc.	1	new through import_export	13	1
533	2019-12-24 22:53:49.548142+03	84238207-bcda-47d9-af1b-8ffa46299f42	Overhead Door Corporation	1	new through import_export	13	1
534	2019-12-24 22:53:49.559165+03	449ef8b9-24b3-45f4-8f3b-26b60e4dcdc7	\nRite-Hite Doors, Inc.	1	new through import_export	13	1
535	2019-12-24 22:53:49.570188+03	bae8078f-dbef-42f7-8878-7580a6fd08d8	Rytec Corporation	1	new through import_export	13	1
536	2019-12-24 22:53:49.581381+03	ebde4ef0-44c1-4b92-aedb-abb9474d57fe	TNR Industrial Doors Inc.	1	new through import_export	13	1
537	2019-12-24 22:54:02.962344+03	f9d16c4d-c466-4dea-b086-8aa03999b8c5	Entrematic/Amarr	2	[{"changed": {"fields": ["address", "enable_mailing"]}}]	13	1
538	2019-12-24 22:54:09.445037+03	ebde4ef0-44c1-4b92-aedb-abb9474d57fe	TNR Industrial Doors Inc.	2	[{"changed": {"fields": ["address"]}}]	13	1
539	2019-12-24 22:54:17.587451+03	ebde4ef0-44c1-4b92-aedb-abb9474d57fe	TNR Industrial Doors Inc.	2	[{"changed": {"fields": ["enable_mailing"]}}]	13	1
540	2019-12-24 22:54:27.640977+03	bd4703f9-31e6-4b04-bd26-e6145e76f873	CornellCookson	2	[{"changed": {"fields": ["company", "address", "enable_mailing"]}}]	13	1
541	2019-12-24 22:54:44.200857+03	e660023d-53f0-4977-84b2-c1407075f0ca	Hörmann LLC	2	[{"changed": {"fields": ["slug", "address", "enable_mailing"]}}]	13	1
542	2019-12-24 22:54:53.923708+03	bae8078f-dbef-42f7-8878-7580a6fd08d8	Rytec Corporation	2	[{"changed": {"fields": ["address", "enable_mailing"]}}]	13	1
543	2019-12-24 22:55:01.368354+03	8e61b286-bcbc-4619-9ee2-28c9b93651f1	Lawrence Roll-Up Doors, Inc.	2	[{"changed": {"fields": ["company", "address", "enable_mailing"]}}]	13	1
544	2019-12-24 22:55:11.428569+03	8a4e6975-13b9-4ff0-ac07-aaa6a2fb3197	Entrematic/Dynaco	2	[{"changed": {"fields": ["address", "enable_mailing"]}}]	13	1
545	2019-12-24 22:55:20.741494+03	84238207-bcda-47d9-af1b-8ffa46299f42	Overhead Door Corporation	2	[{"changed": {"fields": ["address", "enable_mailing"]}}]	13	1
546	2019-12-24 22:55:29.075407+03	5670b969-339f-479a-badb-d663a3c747b3	Jamison Door	2	[{"changed": {"fields": ["company", "address", "enable_mailing"]}}]	13	1
547	2019-12-24 22:55:38.408845+03	449ef8b9-24b3-45f4-8f3b-26b60e4dcdc7	Rite-Hite Doors, Inc.	2	[{"changed": {"fields": ["company", "address", "enable_mailing"]}}]	13	1
548	2019-12-24 22:58:42.562377+03	fee4626c-ffad-4468-ab44-87a6832f13ff	OVERHEAD DOOR COMPANY	3		13	1
549	2019-12-24 22:58:42.579366+03	f9d16c4d-c466-4dea-b086-8aa03999b8c5	Entrematic/Amarr	3		13	1
550	2019-12-24 22:58:42.590347+03	ebde4ef0-44c1-4b92-aedb-abb9474d57fe	TNR Industrial Doors Inc.	3		13	1
551	2019-12-24 22:58:42.601346+03	e660023d-53f0-4977-84b2-c1407075f0ca	Hörmann LLC	3		13	1
552	2019-12-24 22:58:42.612473+03	e5210c95-e199-4cab-b89e-6de8622ae507	Raynor Garage Doors	3		13	1
553	2019-12-24 22:58:42.623409+03	e196a021-e679-4ec7-a6ac-15469051cecd	Northwest Door	3		13	1
554	2019-12-24 22:58:42.634389+03	d89e5ac2-777c-42dc-b5a3-e780b981b33e	\nAirlift Doors Inc.	3		13	1
555	2019-12-24 22:58:42.645328+03	d74d71bb-37a3-4335-9bd2-e30432ddded3	Northwest Door	3		13	1
556	2019-12-24 22:58:42.65651+03	d2624281-14ad-4ffb-9ef7-f029b8540ba3	OVERHEAD DOOR COMPANY OF DALLAS	3		13	1
557	2019-12-24 22:58:42.667584+03	ce4bcaaf-a56e-4968-8334-eeb4a5297480	Innotech	3		13	1
558	2019-12-24 22:58:42.678416+03	c1a10e06-d207-43a2-ba04-810a895c9c9a	Overhead Door of Columbia	3		13	1
559	2019-12-24 22:58:42.689542+03	bd4703f9-31e6-4b04-bd26-e6145e76f873	CornellCookson	3		13	1
560	2019-12-24 22:58:42.70049+03	bc6d9160-622f-40c3-92c6-62d390a72347	Computer LTD	3		13	1
561	2019-12-24 22:58:42.711845+03	bae8078f-dbef-42f7-8878-7580a6fd08d8	Rytec Corporation	3		13	1
562	2019-12-24 22:58:42.722493+03	aca5c232-2cc3-4418-82a0-e79510939d10	MIDLAND GARAGE DOORS	3		13	1
563	2019-12-24 22:58:42.733497+03	a88667ae-4e96-4c53-bc03-6a1640077d3d	ГК РОВЕН	3		13	1
564	2019-12-24 22:58:42.744561+03	a22e1515-3c51-4838-8fd9-fc500999c748	Northwest Door	3		13	1
565	2019-12-24 22:58:42.755673+03	9bef83c5-dfee-4bb3-9e1e-d007e8d54d39	OVERHEAD DOOR COMPANY	3		13	1
566	2019-12-24 22:58:42.767979+03	8e61b286-bcbc-4619-9ee2-28c9b93651f1	Lawrence Roll-Up Doors, Inc.	3		13	1
567	2019-12-24 22:58:42.777474+03	8a4e6975-13b9-4ff0-ac07-aaa6a2fb3197	Entrematic/Dynaco	3		13	1
568	2019-12-24 22:58:42.788545+03	88c0608e-aaf5-40e1-ac96-8ae4c0272f16	Delden Mfg	3		13	1
569	2019-12-24 22:58:42.799727+03	84238207-bcda-47d9-af1b-8ffa46299f42	Overhead Door Corporation	3		13	1
570	2019-12-24 22:58:42.810598+03	798bea4f-c0e3-4cf8-b61c-5c3133424fad	Northwest Door	3		13	1
571	2019-12-24 22:58:42.821629+03	7621ec7e-11a2-41a8-a26c-f431767c0358	Overhead Door Company of Mason City	3		13	1
572	2019-12-24 22:58:42.832864+03	70ec1a85-a831-44c0-b858-6b249e4deb00	MIDLAND GARAGE DOORS	3		13	1
573	2019-12-24 22:58:42.843559+03	706c6ea7-9b33-40df-a5f5-e16ea928bc98	Wayne Dalton	3		13	1
574	2019-12-24 22:58:42.854629+03	696eeaf9-f7d2-41b6-96ee-7b48e45b99f8	C.H.I. Overhead Doors	3		13	1
575	2019-12-24 22:58:42.882376+03	61a1218c-1418-4bd5-9e1d-3f2ae74575b8	GVA008	3		13	1
576	2019-12-24 22:58:42.898588+03	5dec6207-c36c-4011-bc3a-68c7986b3230	OVERHEAD DOOR COMPANY	3		13	1
577	2019-12-24 22:58:42.909711+03	5670b969-339f-479a-badb-d663a3c747b3	Jamison Door	3		13	1
578	2019-12-24 22:58:42.92066+03	52262112-c395-42ef-88bb-90579fe360cb	Overhead Door Corporation	3		13	1
579	2019-12-24 22:58:42.931601+03	4b6132ce-0733-493b-bd6b-f3671c5ca8ea	Overhead Door Corporation	3		13	1
580	2019-12-24 22:58:42.942741+03	449ef8b9-24b3-45f4-8f3b-26b60e4dcdc7	Rite-Hite Doors, Inc.	3		13	1
581	2019-12-24 22:58:42.953737+03	42c38d30-a257-4bae-a3e2-478bf95e17be	Northwest Door	3		13	1
582	2019-12-24 22:58:42.964686+03	2f48d29e-a657-4f59-a957-909eb42b431a	MIDLAND GARAGE DOORS	3		13	1
583	2019-12-24 22:58:42.975697+03	2b1872ed-70b0-442b-b30f-9d55f6045339	Amarr Garage Doors	3		13	1
584	2019-12-24 22:58:42.986994+03	22df121d-9f53-48c9-a15e-36a78dd4dbf2	Overhead Door Corporation	3		13	1
585	2019-12-24 22:58:42.997686+03	213b72f4-1092-4d0c-a5b1-1b4e7420763d	Northwest Door	3		13	1
586	2019-12-24 22:58:43.008806+03	0ae30071-acf0-439c-b097-9de9f98a8a3d	OVERHEAD DOOR COMPANY	3		13	1
587	2019-12-24 22:58:43.020009+03	021197c5-909f-4750-963b-28f9a414ef2e	Northwest Door	3		13	1
588	2019-12-24 23:19:40.338227+03	f4cdf359-8de0-47b5-bb1f-af2f285a44c9	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
589	2019-12-24 23:19:40.355889+03	48ac51d6-f6dd-433f-873c-0536b2728af3	Entrematic/Amarr	1	new through import_export	13	1
590	2019-12-24 23:19:40.367036+03	03dac85a-522e-4ced-8f28-c4aadfa72cad	TNR Industrial Doors Inc.	1	new through import_export	13	1
591	2019-12-24 23:19:40.378277+03	71ef83e4-1ec1-4cbf-a147-22c7eee12e73	Hörmann LLC	1	new through import_export	13	1
592	2019-12-24 23:19:40.388934+03	5c4ff9b4-7231-4104-b96e-08ede8ad6505	Raynor Garage Doors	1	new through import_export	13	1
593	2019-12-24 23:19:40.399922+03	963d44ee-e7bb-41c9-ad60-a119b4237ab1	Northwest Door	1	new through import_export	13	1
594	2019-12-24 23:19:40.411179+03	064c2383-dafb-413a-add9-4b379ef5254a	\nAirlift Doors Inc.	1	new through import_export	13	1
595	2019-12-24 23:19:40.422092+03	71a9af43-3070-423f-82e8-c8b1cdff5c33	Northwest Door	1	new through import_export	13	1
596	2019-12-24 23:19:40.432975+03	c0ba28f2-192e-49cb-8fe2-dbd2c69d90a3	OVERHEAD DOOR COMPANY OF DALLAS	1	new through import_export	13	1
597	2019-12-24 23:19:40.443946+03	64086d97-17d7-47e0-ae93-52d3796d81d7	Innotech	1	new through import_export	13	1
598	2019-12-24 23:19:40.454998+03	2a19c521-8a31-4e7d-a39c-01db99c13713	Overhead Door of Columbia	1	new through import_export	13	1
599	2019-12-24 23:19:40.466058+03	a2eccbbd-da70-4d70-ba78-ee018bb714ae	CornellCookson	1	new through import_export	13	1
600	2019-12-24 23:19:40.476983+03	113fc6a4-e918-46ef-8ca6-357db583d905	Computer LTD	1	new through import_export	13	1
601	2019-12-24 23:19:40.488032+03	d22cff8c-9cfb-455f-854d-4f0c0a205d1e	Rytec Corporation	1	new through import_export	13	1
602	2019-12-24 23:19:40.499366+03	a8f145c8-e1a8-4aac-9e54-43c4015c3ab6	MIDLAND GARAGE DOORS	1	new through import_export	13	1
603	2019-12-24 23:19:40.51039+03	434826c5-1a7a-46a7-8f5c-41bc3e908d83	ГК РОВЕН	1	new through import_export	13	1
604	2019-12-24 23:19:40.521191+03	00f6fd1a-e2a1-4c40-a552-1bb1856e495f	Northwest Door	1	new through import_export	13	1
605	2019-12-24 23:19:40.531985+03	c2dfb9f9-69ff-4761-8385-0997947f140f	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
606	2019-12-24 23:19:40.543002+03	6e8713f7-7c9e-4b4f-beaf-7a701a2c73ec	Lawrence Roll-Up Doors, Inc.	1	new through import_export	13	1
607	2019-12-24 23:19:40.553988+03	66462be9-989d-458c-a20d-dcd84577582a	Entrematic/Dynaco	1	new through import_export	13	1
608	2019-12-24 23:19:40.565002+03	56518356-065e-4038-aae7-79a3bf3a18a0	Delden Mfg	1	new through import_export	13	1
609	2019-12-24 23:19:40.576+03	53029ab2-daf6-4789-8981-8fc77b1570e6	Overhead Door Corporation	1	new through import_export	13	1
610	2019-12-24 23:19:40.587345+03	9825a35c-a3d9-4b39-a41c-0f958374e371	Northwest Door	1	new through import_export	13	1
611	2019-12-24 23:19:40.598163+03	62bf997a-e8c2-4d68-a1c8-e4dd2816d08f	Overhead Door Company of Mason City	1	new through import_export	13	1
612	2019-12-24 23:19:40.609138+03	0bcd1fad-05db-4b3d-ae11-a522a15d08e4	MIDLAND GARAGE DOORS	1	new through import_export	13	1
613	2019-12-24 23:19:40.620323+03	c19251cb-7a33-4a07-b354-c322ed5b1cb1	Wayne Dalton	1	new through import_export	13	1
614	2019-12-24 23:19:40.631126+03	3602a938-bbf7-4ecd-b40f-45de1ecdd469	C.H.I. Overhead Doors	1	new through import_export	13	1
615	2019-12-24 23:19:40.642431+03	284b95e1-7727-47bc-ae7b-7e95a594a12a	GVA008	1	new through import_export	13	1
616	2019-12-24 23:19:40.653426+03	e906213f-0771-4010-a8cd-ec37648e9455	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
617	2019-12-24 23:19:40.664448+03	9674803f-fcb4-428b-87c4-98f20346baea	Jamison Door	1	new through import_export	13	1
618	2019-12-24 23:19:40.675496+03	7841c0c3-d478-4f38-9131-ec9ac8b67712	Overhead Door Corporation	1	new through import_export	13	1
619	2019-12-24 23:19:40.68674+03	c6c7e01f-203a-4b86-8d9b-9166be1a596a	Overhead Door Corporation	1	new through import_export	13	1
620	2019-12-24 23:19:40.697269+03	e1bcc906-11ab-4782-a106-2fa1056400ac	Rite-Hite Doors, Inc.	1	new through import_export	13	1
621	2019-12-24 23:19:40.708254+03	1368fae0-5a30-4dad-aa99-294484d066cd	Northwest Door	1	new through import_export	13	1
622	2019-12-24 23:19:40.719574+03	18de9e2c-f39a-4d15-917f-2ab7f56c6c40	MIDLAND GARAGE DOORS	1	new through import_export	13	1
623	2019-12-24 23:19:40.730558+03	0910ed83-13e5-4b4b-b976-169a35222450	Amarr Garage Doors	1	new through import_export	13	1
624	2019-12-24 23:19:40.741636+03	553aa484-b7c0-405d-99ca-bdf3b766c0a6	Overhead Door Corporation	1	new through import_export	13	1
625	2019-12-24 23:19:40.752294+03	b402e559-ea10-46ea-87ca-2bdaabfe86f6	Northwest Door	1	new through import_export	13	1
626	2019-12-24 23:19:40.763296+03	c8a1f0bb-9835-427c-8ad2-96201a843774	OVERHEAD DOOR COMPANY	1	new through import_export	13	1
627	2019-12-24 23:19:40.77465+03	7d3a2f0a-0963-4b01-9e91-5219dad7415d	Northwest Door	1	new through import_export	13	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 627, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	user
4	auth	permission
5	contenttypes	contenttype
6	sessions	session
7	base	submenu
8	base	base
9	base	menu
10	base	image
11	interaction	contact
12	interaction	correspondence
13	clients	clients
14	promotion	image
15	promotion	promotion
16	scheduler	scheduler
17	base	langinfo
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-12 21:13:52.277601+03
2	auth	0001_initial	2019-12-12 21:13:53.591788+03
3	admin	0001_initial	2019-12-12 21:13:53.932579+03
4	admin	0002_logentry_remove_auto_add	2019-12-12 21:13:53.965097+03
5	contenttypes	0002_remove_content_type_name	2019-12-12 21:13:54.030468+03
6	auth	0002_alter_permission_name_max_length	2019-12-12 21:13:54.06467+03
7	auth	0003_alter_user_email_max_length	2019-12-12 21:13:54.108684+03
8	auth	0004_alter_user_username_opts	2019-12-12 21:13:54.133293+03
9	auth	0005_alter_user_last_login_null	2019-12-12 21:13:54.162555+03
10	auth	0006_require_contenttypes_0002	2019-12-12 21:13:54.175102+03
11	auth	0007_alter_validators_add_error_messages	2019-12-12 21:13:54.206418+03
12	auth	0008_alter_user_username_max_length	2019-12-12 21:13:54.340424+03
13	auth	0009_alter_user_last_name_max_length	2019-12-12 21:13:54.385097+03
14	base	0001_initial	2019-12-12 21:13:55.929111+03
15	base	0002_auto_20191006_1619	2019-12-12 21:13:55.958375+03
16	base	0003_auto_20191006_1746	2019-12-12 21:13:55.986249+03
17	base	0004_auto_20191006_1800	2019-12-12 21:13:56.017876+03
18	base	0005_auto_20191006_1831	2019-12-12 21:13:56.04818+03
19	base	0006_auto_20191006_1914	2019-12-12 21:13:56.081065+03
20	base	0007_auto_20191006_1927	2019-12-12 21:13:56.103535+03
21	base	0008_auto_20191014_2030	2019-12-12 21:13:56.526832+03
22	base	0009_delete_contact	2019-12-12 21:13:56.569433+03
23	base	0010_auto_20191212_1804	2019-12-12 21:13:56.863061+03
24	clients	0001_initial	2019-12-12 21:13:57.041526+03
25	clients	0002_auto_20191101_0827	2019-12-12 21:13:57.106367+03
26	clients	0003_clients_category	2019-12-12 21:13:57.254471+03
27	clients	0004_auto_20191101_1640	2019-12-12 21:13:57.280122+03
28	clients	0005_auto_20191106_1731	2019-12-12 21:13:57.576753+03
29	clients	0006_auto_20191106_1750	2019-12-12 21:13:57.614492+03
30	clients	0007_clients_error_mailing	2019-12-12 21:13:57.904913+03
31	clients	0008_auto_20191109_2050	2019-12-12 21:13:58.122237+03
32	clients	0009_clients_slug	2019-12-12 21:13:58.545111+03
33	clients	0010_auto_20191110_1649	2019-12-12 21:13:58.573893+03
34	clients	0011_auto_20191110_1710	2019-12-12 21:13:59.411044+03
35	clients	0012_auto_20191110_1719	2019-12-12 21:13:59.459619+03
36	clients	0013_auto_20191114_1837	2019-12-12 21:13:59.489701+03
37	clients	0014_auto_20191114_1919	2019-12-12 21:13:59.511048+03
38	clients	0015_clients_filepath	2019-12-12 21:13:59.544012+03
39	clients	0016_remove_clients_filepath	2019-12-12 21:13:59.577136+03
40	clients	0017_clients_filepath	2019-12-12 21:13:59.989169+03
41	clients	0018_auto_20191116_1456	2019-12-12 21:14:00.449593+03
42	clients	0019_auto_20191130_1009	2019-12-12 21:14:00.464432+03
43	clients	0020_clients_language	2019-12-12 21:14:00.912364+03
44	clients	0021_auto_20191207_0828	2019-12-12 21:14:00.951057+03
45	clients	0022_auto_20191212_1804	2019-12-12 21:14:01.140176+03
46	interaction	0001_initial	2019-12-12 21:14:01.317336+03
47	interaction	0002_correspondence	2019-12-12 21:14:01.517413+03
48	interaction	0003_auto_20191028_1952	2019-12-12 21:14:01.580905+03
49	interaction	0004_auto_20191028_1956	2019-12-12 21:14:01.599018+03
50	interaction	0005_auto_20191028_2025	2019-12-12 21:14:01.703239+03
51	interaction	0006_correspondence_action	2019-12-12 21:14:01.90452+03
52	interaction	0007_auto_20191029_1245	2019-12-12 21:14:02.796434+03
53	interaction	0008_auto_20191030_1940	2019-12-12 21:14:03.381801+03
54	interaction	0009_auto_20191212_1804	2019-12-12 21:14:03.430355+03
55	promotion	0001_initial	2019-12-12 21:14:04.008871+03
56	promotion	0002_auto_20191101_1640	2019-12-12 21:14:04.297183+03
57	promotion	0003_auto_20191106_1731	2019-12-12 21:14:04.470779+03
58	promotion	0004_auto_20191130_1009	2019-12-12 21:14:04.498466+03
59	promotion	0005_auto_20191206_1722	2019-12-12 21:14:04.939347+03
60	promotion	0006_auto_20191206_1814	2019-12-12 21:14:04.971529+03
61	promotion	0007_auto_20191207_0828	2019-12-12 21:14:05.00547+03
62	promotion	0008_auto_20191207_1105	2019-12-12 21:14:05.123295+03
63	promotion	0009_auto_20191212_1804	2019-12-12 21:14:05.264941+03
64	scheduler	0001_initial	2019-12-12 21:14:05.362359+03
65	scheduler	0002_auto_20191101_1249	2019-12-12 21:14:05.382235+03
66	scheduler	0003_auto_20191101_1252	2019-12-12 21:14:05.410643+03
67	scheduler	0004_auto_20191101_1255	2019-12-12 21:14:05.434041+03
68	scheduler	0005_auto_20191101_1640	2019-12-12 21:14:05.455078+03
69	scheduler	0006_auto_20191109_2050	2019-12-12 21:14:05.605001+03
70	scheduler	0007_auto_20191130_1009	2019-12-12 21:14:05.681313+03
71	scheduler	0008_scheduler_processing	2019-12-12 21:14:05.950615+03
72	scheduler	0009_auto_20191212_1804	2019-12-12 21:14:06.010504+03
73	sessions	0001_initial	2019-12-12 21:14:06.299514+03
74	base	0011_auto_20191215_1119	2019-12-15 11:19:38.437046+03
75	interaction	0010_auto_20191215_1119	2019-12-15 11:19:38.902429+03
76	promotion	0010_image_language	2019-12-15 11:19:39.299357+03
77	scheduler	0010_scheduler_language	2019-12-15 11:19:39.574092+03
78	base	0012_auto_20191215_1153	2019-12-15 11:53:32.480904+03
79	interaction	0011_auto_20191215_1153	2019-12-15 11:53:32.525472+03
80	promotion	0011_remove_image_language	2019-12-15 11:53:32.558138+03
81	scheduler	0011_remove_scheduler_language	2019-12-15 11:53:32.591729+03
82	base	0013_langinfo	2019-12-15 11:56:13.84568+03
83	base	0014_delete_langinfo	2019-12-17 20:21:00.747424+03
84	base	0015_auto_20191217_1256	2019-12-17 20:21:02.253329+03
85	clients	0023_auto_20191217_1256	2019-12-17 20:21:02.426338+03
86	interaction	0012_auto_20191217_2019	2019-12-17 20:21:02.671908+03
87	promotion	0012_auto_20191217_1256	2019-12-17 20:21:02.882869+03
88	promotion	0013_image_urllink	2019-12-17 20:21:03.697991+03
89	scheduler	0012_auto_20191217_2019	2019-12-17 20:21:03.786331+03
90	base	0016_auto_20191217_2159	2019-12-17 21:59:57.329998+03
91	promotion	0014_auto_20191217_2159	2019-12-17 21:59:57.424511+03
92	clients	0024_clients_bid	2019-12-18 00:17:23.274951+03
93	clients	0025_auto_20191218_2253	2019-12-18 22:53:07.243487+03
94	clients	0026_auto_20191221_1314	2019-12-21 13:14:41.962713+03
95	base	0002_auto_20191223_2229	2019-12-23 22:29:54.594063+03
96	clients	0027_auto_20191222_1726	2019-12-23 22:29:54.600689+03
97	clients	0028_auto_20191222_1914	2019-12-23 22:29:54.612612+03
98	promotion	0002_auto_20191223_2229	2019-12-23 22:29:54.724381+03
99	clients	0029_clients_country	2019-12-24 14:19:03.103083+03
100	clients	0029_auto_20191223_2045	2019-12-24 23:07:54.449244+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 100, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ssl53p5wfot7gfskcu2mlez9jlz3066c	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:43.411379+03
6jjgov6hdjvqu7brd3clizy1fac3p8om	ODRhODNjZGU1ODhjYzczNmFlNDllZmI2Zjg2NmRhZmRhMDk3Yzc5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-12-26 21:20:29.204913+03
ckxh4x9sxalvqxu274ff41msf49atqpa	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:43.742462+03
mb6fpyl2nc1l0xkkpcornx3lcykwpea4	ODRhODNjZGU1ODhjYzczNmFlNDllZmI2Zjg2NmRhZmRhMDk3Yzc5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-12-26 21:49:11.927507+03
4g5w4x6pvch3agt1wtb3xnebz2w0yv5u	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:43.771042+03
2qeleatk7trq3unhzfd0kp4wq1bh4ykr	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-27 23:05:06.081044+03
h5qhi99r35zxr4xqmpv8y6n5w7cufzb7	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-27 23:16:06.422591+03
j7ug3dzjae39xw3fnakabr04n31ompln	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-27 23:16:09.085534+03
u8h8uek27aev51odlvtbcqezllo922t6	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-27 23:16:11.845093+03
mpfiat4kefc7lysey8h7boi7gu01mkm6	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-27 23:16:14.353122+03
u0gyc3obba24ecc7z6uiibym9efprcnv	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:43.821562+03
lb29qp5smrp82pthkufj3f2jnaqag5iq	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.110681+03
dxn6vth4y7rwbkayz2hqtx5gfo9dsxef	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.119492+03
ni6vxexekh7c5dchcyhi5u2lu6amy01z	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.185229+03
znllljhpvpp1cmva02wy9emdjxgcndxr	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-27 23:56:16.521314+03
njkjakuq85rp4w8f0f24jrasgc2it25v	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-27 23:57:31.084456+03
5lbkchk92178id2mgykffj4mb5pcusbq	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-27 23:57:34.247432+03
yxskbpyy0wnk2k0poc3bn1dp65v6og6r	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:00:59.490164+03
zr4ecbtjr5hmoj6bqwbumwtjxr1fnu5s	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:17.978708+03
9yeh6vo1ctyk0df03i8o2x5f6s2muhlf	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:17.983764+03
bzfllverkg3ggftm8rfthblfy03sug2j	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:17.984714+03
bv70j7dmor5agqtmwqkt54yz2m8enxe8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:17.991937+03
7jnlkhrzd5m5xw53pr43nk2xon2aule8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:17.99702+03
sa4j9x7h4ru3fhiic8her1tbppl63vz8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:17.995703+03
yd5jbl7p0jvap7jvgmpqu8oqfaic9lgd	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.051304+03
wgbnrs5jlu8tzuzhks99gqphcxvy98tn	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.077581+03
dz9vy1631myimkncz5culj0tqop5bgbf	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.082016+03
kwq06j91kcmgm0jmhqi6p748ca6w4gwv	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.096556+03
6r2ucshzppraooxsxiv27zu3snb7oytp	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.128851+03
nfn9t7elevee5owcu0e1p1zfhqw8c72l	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.144379+03
wbl5g46xsvbcccmho09dtehs0r2p07o4	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.147956+03
d51ia7mxoid0205qmz55swxp7h0s0xa6	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.152039+03
w6yef0irzhjw2yoq0d6k6f6logo6zy5s	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.22231+03
yih2s9awfuo749ghsf1o0lapqn567hok	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-27 22:51:54.495134+03
llmxmpc68tqt7xu4jydbl1uwubyj4jyb	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.218272+03
v2ycvd7u9hcdl4runmaukbowlw91ucr5	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.232776+03
k26b7bwsrexe49r9ak9upo8ynkh9xnkn	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.233773+03
syf6j6p97zas35l4a08guwijwwqfen8y	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:18.243992+03
hymbhfkn72lrelpjw2khmqvn6tyoqfk8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:21.074616+03
xitj56tik45qc607nk8pave5p2gpc8ha	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:21.5315+03
688m68p56ulerific1mf4o4e6jqdyqci	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:21.544685+03
37f308kym8wz2gsxspt1r3yk3bpgskjh	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:21.549363+03
uqna89ornrisas5w344piyr4hdznhp18	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:21.555729+03
j7oqez0dc7dm68mllgj2onbid2vo1ilt	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:21.557183+03
5z2wrfry9dxlo2g5y6ftv1x2gqbldolr	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:21.592287+03
2kja5kctjr5oxlybzw7tgfh1dm1vwui3	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:21.604467+03
vcvuak79z30znkkyvc2g6epvjlf0cjwq	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:24.155242+03
qdsp4qtomxsegycoyrr19gdkzwn10xsc	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:01:28.070478+03
lcc1pzpdakd135f2uv0bypzf1a04rzpq	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 00:03:01.412227+03
wczjbsrd1vqt8q8ucmdmw6lqm64vmilg	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:43.725197+03
3ppbj0ecvjjqpp46548h5r7zuphhb1l6	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:43.745221+03
7bhdk6j0o11u3rf1yi12xm2fihenw4mj	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:43.772499+03
bqoag9xs1wipnwt8omj7peja8m3558yt	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.098398+03
hv3xekdvi41kcdyerpgdswk5wssz5l1q	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.117552+03
sj4ysmqb1pxgzzaikp2edhowwmdbh0pz	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.181544+03
cwz8jq95wdw6o98p3sq4u9hhossdj03p	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.265767+03
4o97nriz3iczv653o8m36s650e1o2abv	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.270221+03
5lm21x9rt582xddazr0ys7j74oj77rxa	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.286134+03
uioq6uotzgo337ahot98z1l4bb8h2jv3	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.295812+03
x5rsaq7qf6w3249zsp2doyggka7buzpn	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.310385+03
m2fsoa3r8vj3zhde2s3qjdyu4jv5fiq2	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.312043+03
96g6xphyi85milxoumoqpk5xl837cmif	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.411968+03
bdox0njw30yueweseqma9gpb7d1kgbr0	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.426858+03
2ysq5ypg25a3rpk9h41ao5quchipk9we	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:38:44.438601+03
n7td1jb5purr0wp959fseh8jkbbqa374	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 10:38:47.983052+03
w8lo50tgvfgyjct563vxy5h6b3uzr3r6	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:39:03.137437+03
6n3exo4thhlhgr2y0gs5pw2mcwlyd2r1	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:39:03.284018+03
e4iocxq119f38ti570o6ujkzb8j6f2k9	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:39:03.300148+03
m87qudhsska005ctctosyncd52g4h1cf	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:39:03.301851+03
40d6na8gztrtmh2h698u3vlbxtuwnco1	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:39:03.303286+03
9wdea95n03igk0tjyed3zdsmefqj9ujp	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:40:58.524777+03
ysu4xw66r6umwmkz52o72o5hyke06zlb	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:40:58.770159+03
1mrsb2cnzzmbfgo8eva9hmi5nigvamdc	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:40:58.876752+03
8or1d7ckoxakrg5vxg7efafjl282q7fu	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 10:41:05.08098+03
b5uwiu14l0faw72qihy28oyt78tj3ohp	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:41:09.76263+03
gl9ollsj877akq2cis4338223xz6fomb	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.631674+03
2ewsripz3y6cpvesci4lktscnegzfpw9	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.818602+03
10im7djztpbo49ck5j2ysal2kpvq1jao	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.834686+03
e1uk2ie06n6jv1qybue0if5nstyvds7g	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.845+03
1jt3e9in38fkxy6leuuc1x0hhjl8y0vk	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.848912+03
2s35woimkmujs98z7fsv8d3qv3i4rcz9	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.867472+03
5bi7elpj9yipxigt3f3zs28922r0u5x9	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.869156+03
v0s7aij3hcyvud59r324d1ntyzv45lgf	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.892622+03
1yqoyhc7bw0asbi4s94bilof7we2g9qw	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.89912+03
m9kgd2dcgj8rxxr1rdg1gb3mygn5d006	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.946596+03
3ppdm9dm3sgnhp2hid0kaocdfe5ru9j4	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:44.991259+03
su3exzge50lhnm7wjgm62c8kaz8546uq	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.023015+03
pyt1jehcr242kbzmopzjkdfmbie09h6c	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.025026+03
g51bpawa00dmgdki4o9r2m7kfc2tn66j	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.045818+03
ezb7wbmulkuccoy8dbummuqtyut8u7pk	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.085543+03
ffaoh3q0gu211mxm1uu5n3aw5lok27ts	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.094548+03
9hpyg8fb6ckm0awheezcpw79uipkutto	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.109304+03
g3d2r01pw1zmu23nqmjko82pl32a55l3	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.108476+03
gklb5gi582flijxyd73odk0x4g9kmfr6	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.15546+03
akfy0us37jp00vile1e1z0obbswe8l0x	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.170266+03
kywnndlov1azxfqodt8onbxcrc21tvdl	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.202645+03
eh8ce4jln4isckj22if6xalntpnxcl22	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:45.203685+03
rw0h799v02x45xeb9tmy3ei7f1p0tt33	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:50.6797+03
3qmey41jgzv07mlalqsjnqnbbl6m72tc	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:50.90892+03
fj8717up48mjuq2q389dcu6avsb6h751	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:51.050825+03
ompplbfmtr3rma4bpo3wd11v87d77h4d	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:51.097602+03
zyogh1c1psajwbucqaei15o77labc79k	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 17:53:04.912825+03
aox1oqg90gn94tfgevu65dno3iz8867n	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:55:06.584957+03
gfkqy7i735fza75v62na7s6yo1oa7tj9	NGNlNTk1ZDc0MzY3ZGQ0OWRlZDY4ODYyZTVkY2ZhZDg4Y2IxNWM1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDI2ODY3MzM0MWM2NjMzNmYxYzY3Y2NhMWE5MjQ2MGU4OTA2MDA1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2xhbmd1YWdlIjoicnUifQ==	2019-12-28 12:24:36.064617+03
g6jvr425srhf7k6c0xk65f4wtnjmbd61	YzM0YjAwNjk1NDcwNzQ2NzFkYWUxMGI3MDMwNDZiNTQ1Y2YzMzI5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 15:40:31.594829+03
ukrz9c493ziiz1kvzmyquv01le6uwbhi	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:27:35.334822+03
pdt551wt0adby15v4z1calruynqk1op6	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 14:16:59.230179+03
g83tt4b0e2x58iaakdhqnjaqjpud0vfl	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 14:31:17.811268+03
vs527z82ckcrm8hyfl3a80eaergfeqhv	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:34:26.36822+03
eazga1bmubyhcwg8weyd2k2uysuey3d4	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 15:10:30.046284+03
09tg3ad5gprj7u21vtrzvnpluqnya93k	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:36:46.137366+03
fr21kondw5nipmvghtvrlr7fqz4xyu8z	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 16:37:10.110819+03
kybs3jgwluicjns68a846c8dfnio6b0p	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 15:21:12.871877+03
0g9goqgzcvu7nxsv2j50yfo3zaosmpg9	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:42:33.59863+03
hlq2h3svj787cluxnm0imm7763o52563	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 18:29:10.881158+03
578qr5u2lu8lmh5xmyv5goqgts60a85u	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 20:38:40.734156+03
1khg6cjiv6lpw6x12wd1gpwxzrnr0nyh	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:51.101204+03
u187mfk058495edz2hsnrhr3q1ggc15x	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 10:42:57.844584+03
z9iybzt9jtotoovvcdc2e17dvxci1ej0	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:42:57.899812+03
1sqszekyxqq93jwyxait0fx30dtpissw	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:43:57.41503+03
5wghu15nct11c9eqjls4d1yqlwdznikj	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:43:57.58053+03
jdxsvv8dk7090038stlwagryrh9rtkoy	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:44:36.357454+03
k763x53djvh5csiv2jkwqva1mftoguk1	ZjhmZDE4ZmUzNDA2ZTRiNTU3NzhhZjg0MTc0MDRmY2UyMzllYjk1ODp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIwMjY4NjczMzQxYzY2MzM2ZjFjNjdjY2ExYTkyNDYwZTg5MDYwMDU5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==	2019-12-28 10:44:40.979881+03
5zcuulvxmy67tqbvyoukdn1obum0edsn	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:45:24.942479+03
jqvxkvejq20cninoj6oq5j6cfr29vc09	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:45:25.048818+03
62g50wq2rxpns13tts9pbqwu5zqh9s0c	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:49:46.953524+03
gnsi6mljpxzdvlprn2rqv4oiji499eva	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:49:47.199835+03
v0m2ymtjtkm5u8wcfn3bd6hje0lekk36	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:49:47.530732+03
fet4kg0dxfkv117o0ndpqkin07qz4ay4	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:51:27.092457+03
oivuske86y3bly5r6u2gh5c0aj0gbaoa	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:51:27.271909+03
6ftc6u8bluic1gloeyxkadog1bse58od	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.505441+03
25aqbququ2q0o8mld98zdrvys8cb7vjd	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.804279+03
7wqz9p5exdq21wvzv84sirw01z10veix	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.803217+03
z8app39mdxhc8nq3pshax9gxnm5ufje1	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.808169+03
pn0p38czkb6bwccekup0znd9yntg4ijm	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.819828+03
nzgeo7vpmua7d5g34dtt6o906f00b65b	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.833723+03
l31ruztk8buy0ax4qq0qpvbwa53sbtdh	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.83802+03
d8vdz437d26burjtw3jfo7oj3gyf11dc	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.882838+03
315e3j2tmdrkddeaqnad9u9f3k5w04fj	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.894782+03
dh6keygyyvgj99sxvx2em2jeytxqpb8e	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.93081+03
4qts8s8p60w00yezt2wyolpiooozo07p	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.968197+03
s5a8kycyaxd9bg3eogm48sj3vwykwleo	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.981455+03
mdgvt2bhrqdc5e5u7t17lc78df6gy33e	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.986467+03
ym9w0tye69hmy54yjlkyrlu40pgxdhtn	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.989678+03
5s5dhrsd3cxmeu43g1lu164swv9mj6d8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:20.993812+03
fshddifudrxa8s8glieyhbwha0rk7877	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:21.013075+03
w1o0tlnae07atjbfp2y37chidc7820ce	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:21.023311+03
d3x8to1ciib0up98ix0zicftnh5ppfqh	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:21.074548+03
4rpdpye27s62yl48ew25ihretlof9y59	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:21.089109+03
2gk90qkyjfact17m6poymvsxdt6cpedz	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:21.089985+03
wu1arbv62vukebdlpggvao51yf9etdnq	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:21.095811+03
ee1ibvfk5c8ygfd01xs1e1gcdcwlkmla	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 10:53:21.105187+03
90xeqw7163a9rglnsqzmkgkylul41118	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 10:53:25.28336+03
y2px5towntw1rgb1tmly3r8xdht9k01q	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:41.934633+03
mg8nzjtip3lpjcp9s2a7olm246zoxbfa	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:42.163416+03
bpst8bnjql7tfa19dqrlpy1o4pknp70r	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.452152+03
5s7gm2v86ninl4d6k19gge74cb0rheuq	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.45732+03
hz219yrczjpym7bxigjamc2294crlmtl	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.454479+03
nfx0p5h76rky5e14tovihx2ga21apn92	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.458005+03
i3zf8vms4j80u1nglzn7dy64lzgk8s2h	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.467827+03
18rdclehgxzj8xwprvmvvbgpkc2r35u3	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.48195+03
lvjo8xs58eack9cqhim5j7sfedqpj3x4	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.531784+03
4urpwuw3l3ouo45a6ib63jz3fz2aoj2e	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.564974+03
4npvkqikj508dr9effhunc9h60dkb5gt	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.58843+03
7i9uz3xyr8713dm1s7wtha4lvwhq6bvh	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.594096+03
ssf19y8jrifzajrmuiiykcls4y4a0ecq	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.604411+03
q7cj3ilx9kfecdxyoq2dktxrdhl4smja	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.628701+03
yrp3v1hpvxd1g648j2j51m5fttr7xg3s	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.631533+03
6ld8o15m5jg2tdlcokpqf1juaeqmvpx4	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.703011+03
exexwb0t6s0teh0ld6ha3wzs22tlqctl	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.72315+03
52pcfkerx2ginfehhlkvjqi5yjrxgl5v	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.739625+03
h8ww333ukq2cr0aarvtnx11by1w4oiem	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.7474+03
vx5m8wfxv8zfm5a4ee3rpjno0awinc1j	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.772152+03
utb338pxz53qe5ljtptohl98wrpdcymy	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.7935+03
xcr3d4amhgtaiyqfwqwt7e9fn4yc9oyo	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.795091+03
0bzlglnr8i6f1q346ehk7bcank3kxlsk	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:11:47.806263+03
rt6u5e5coumh0xuk7ds2hqe5l2ajryqw	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 11:16:09.153785+03
o7epr0lmugfrxcc61rinnaz2r53szbzs	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.595892+03
vrpsf25jvudjih1bnjv7qdistldt5yqy	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.796042+03
3fk1dl7jk7o5pesefqygjg252n2lonmm	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.802276+03
c6ma6h9r7jn7xg7wl8coy8quls7z8z6j	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.840275+03
pxvnwqdqmpgz99ho6mavdntr9lcjzcsg	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.841381+03
fxj3fji7syy2meed0y3bv3h6n5dosn4g	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.85527+03
24l55k8cov7uc5a1yhs89ny93lqw0f2k	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.882809+03
928psnj5q7r792bhzqs38hhokmdk84bk	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.906016+03
16xrszzk8rwv4e0jg57ksotb0c8w85oj	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.913998+03
tylf6rulpenjmrpwvzbtfxaz8q7no9sr	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.950728+03
3jsz1bxeplehqp8im4i55drfm1pcxjg8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.955652+03
hauwu1z6rxzfdq3r1i0u009vgfrveo4n	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:15.95867+03
swnrvk81523vw4fqgki8kx3trk4tb8g0	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:16.000443+03
twrmez5ml50wzcah6g3opsk6k3i6m6fh	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:16.001645+03
x5t16o2aedlyvlldzxm96om1yl9az2ns	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:16.003313+03
7x1x5127okxl8aueimi22o70ac089cls	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:16.033706+03
e29l7qi6uvmt81tph27dyxezi9sfm512	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:16:16.04668+03
qbc9wktznhsogvmeznna0dfm93yst46w	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 11:16:19.314191+03
w9m6wh1txgns7q8kxxeo3uj0kxlqu5gb	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:20:43.355407+03
e8n789ri8iira2eex7okjdyfgxf6oob9	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:20:43.516422+03
pjuu7rd1jel2wr342xhi7b0cvi92ta9o	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:20:43.583845+03
0n5u6usx3hwoyj2xj8esfg1gcwp6ifg7	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:20:43.607933+03
adfmvw7s9cz3dsy1hlxqnamsowkgoug1	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:20:43.608986+03
p26oo27kk1wwm9js6in8a1o3an308t7i	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:20:43.653306+03
9bf84ryq7diq5f9i9lzbrjwijvcu648q	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:20:43.685194+03
3mp1zmgwtlcko0koljq7t3pmuy6oazje	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.332387+03
fdupwxqmxjl7hz4xp5ctoh5gqu1ewf2k	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.545887+03
j214g75p72uhacochyrfmg1qjah0qvo5	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.60956+03
mmhenu36m9i5k654eiwf15064iyg7kjz	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.611935+03
3795gbv588xmvwr42o722363exy5jjp9	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.63481+03
itmk53a4ebi51j2ishx438yky5sf2l4z	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.636974+03
9t5spc5725h1dpz4no6o5gl833hne72z	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.647075+03
fur2ocgmb1knkm5cyy0ikbx33pxnf8mo	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.658935+03
yw0ic642m7hy54oh5bkh72t6b39b87wm	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.68795+03
dqw157gkx11gtqns1y89hw4wbatnfuas	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.696173+03
l7p4xi2blxdjxny8rhgvk3mb391nsyjb	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.741989+03
2omynevbumnogzciu6lvobtdykhfzcj6	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.751104+03
bgu6cpwnyd3qrxql1tz5sh2z6d5f9wns	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.754484+03
9sa0cy2x61iev7uk4egwu8bepxfdm036	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.788505+03
9irs6nsdvohcuyvw9t8a3ex36yypn120	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.800976+03
ugwbcoqsfe5bgryxhormz534x2jcw5te	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.79695+03
9pslgfb1ezak8see0hd2ir3gpvg32xje	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.818303+03
7xoo3d6caaz4ckgmj290fd00rqmw8j5h	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.85647+03
7osmkwt9q5b9n93nv2gubv1a3z5vjuve	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.869221+03
a4vfz5qs04noh0ior2zpbtaj58l09lir	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.879096+03
g4ucxopybnlhkcdma8sb5fwr3337yc8d	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:07.885626+03
hrofr4t8l4i5df902n57wuif76ta8keg	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.08096+03
5wtbl47duhq6sb83c1ta0qbspof0xy5f	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.217228+03
ebcc4uunbcxy5vfibbszv878w406bi6y	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.3304+03
tsupv4e1bwzphn8xwgzw0pokkzeja8ir	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.377632+03
zd8gln94edxh64nexspoh5idq9gpq9n6	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.410448+03
zei2mxmvrws5dqnzdmdbsz2ksruekveb	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.408091+03
ve40sx3btf10zs3wn467hkdheq8z2vs4	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.456939+03
7jqtlt9xu9gicjs1sahzhgn6km3plhbh	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.465359+03
ve4ept0s8yml2oemcwnl4ii5kobhh9my	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.468815+03
00u1kpd0iu79an37exywsyjf5mm00qqw	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.548611+03
rx16hn0uuf8unztnswtjj321gciskoiz	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.549552+03
pk8z259yaf5dw4h5czls5zz9vg8z6tmu	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.584608+03
fy8b3mtsrtedtmoh0ae6cyipusfsozse	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.598896+03
rovdbrssjnmfa0uai7zkyzkdb0smiw7z	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.619301+03
d6a2k74thrlmhg5c3r3mx5y8dta3vg7h	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.637895+03
404z46qup75j50ojyhie7qycgn17vd39	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.636871+03
rkwcompc203r93ysfw3bznxizgxj5lgd	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.648401+03
1v5ub3ak3vzbzzhn8rhr033ssz33e6p8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.70036+03
kn5g77ynb1n25wcpowh5xptoxj9l2mk8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.720433+03
cqkaxrgf6pfmupqm7ll48d0efxj335dp	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.727797+03
a8ai3ck7v43wspur0xarhkv0jqjo6lzt	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:21:31.743622+03
r27l3ug9u5x4wh8vkem92cvem5hth85s	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:12.780376+03
vrotzccgka1q4w7b8gn2an90n3rdvv3y	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:12.955238+03
ky1psufmpr0zel0ekty5pyalyq03mu9a	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:12.993275+03
pnppjppfc5s7hse1vez7qe71isisl1pt	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.026443+03
398ycabdmnn9899h6zfjs9dz9279nj45	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.075839+03
ecbmu6yymt3y4he6mv1tr4ihnljckjch	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.084132+03
gctepo0scpnt286tf3m92p3vxs7626og	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.116407+03
ilw1z3zxuyhzwwwy3s8n8g4bmukynuod	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.118238+03
4o9hgyilamvyr4skkzkufx4wjh8y2qf8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.117327+03
brb5e0vzr48gl08eqgyc3yx4wbcick0t	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.145257+03
ptk6yol9zpm83q86hbfqxkuxwbe2sn6h	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.209007+03
8hiz3xodb4b6uhuwzxpq1r700vnym8yq	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.235289+03
t87msl0vv0i99ini63mds9r1eo8mrgxt	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.268234+03
a3zg4t5wpgbq437eda5uplx5kg4brou5	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.27334+03
uxo79v08ww8dlcti5b8o5acfocxs20pt	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.290441+03
1vom5cfppkopwcmu9co1l5riw7uika8q	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.308397+03
igtr3z3dhxomivg49a4gwce7c42y1v8f	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.316252+03
mtp97iuqilkx0xc6scdv4rf9n9y3ovx4	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.347825+03
tfned0gd4al2e98asnzd2x25lincyjk4	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.362139+03
qyi065k1bwkg41lpjxj00sw9g812yedh	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.390986+03
slzyo5s9bzc2smblyb2doq02i4m9lcg2	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.402156+03
qoeyqah55ezgq55hsau5olhycqlr3egj	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:13.430641+03
ljafc0xpodhcgc52hw163s7b8g3vaxu2	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 20:38:45.812474+03
btv348aapnd7s8lscohnjy3r85zztd6g	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:42.329513+03
0k3kmcrdr0s4zhvgwip6yd0ysjyabv4y	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:42.552418+03
l5mlgzo2d0w77uu0po267ne9b270jfra	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:42.791724+03
14g7gvlkem1wyk49v53i4d8kwjktf9de	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:42.914181+03
fuciu5tav6bu85n1t97yecoxu9ab123r	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:42.920641+03
gw5mw3tspc2ely1p8zv885rd1o1b7tel	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:42.923829+03
utj9yanx0koth1az1cp0kqsxanrt0pps	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:22:42.943334+03
m62ale4y1pf97tbd17jk1frmb2e1sy03	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 11:28:13.498922+03
k0brdciqzgmf20634bw5pcf2cp0khlp5	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:28:16.502399+03
05597f651g7o47wwrt0wypnswoxxfbrb	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:28:16.658073+03
zalnlr1kqt81nld2gvaazzukspeo3rg2	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 11:28:22.927497+03
z268gf0scr1j0hg2m8qhfq72muovv7xj	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:23:28.984914+03
jn8fg9sk9f1t0m1rq0g3mjqxko4hgl35	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:51:45.821927+03
03dzlon9fm171om6sxafad9ie8jye9sn	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 23:21:14.42156+03
8nqeukhjb04go7xwz5wa1meem65jr1tg	N2VjOTAxYjYwOWZhMWQ1YjA0NDQzNGNhYjUzMjk5Yzc5NDIzYTkzZjp7Il9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9oYXNoIjoiMDI2ODY3MzM0MWM2NjMzNmYxYzY3Y2NhMWE5MjQ2MGU4OTA2MDA1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:25:59.518126+03
4lkqu88vep14ph3l0fqc70n4ihg1v7vl	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 13:48:43.20164+03
c8l85hh2vp8ytjr3di2m9a07v1u4ztno	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:29:59.448146+03
0esvptsafhv9edvx4phfi4gdfxz8stk1	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 11:43:06.372487+03
e93ml16im2g82nvtdhchr9513hk3n9j4	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 14:28:17.680032+03
4z3h2kpt2pzci64ql91asenxsya5g5gv	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:35:53.926172+03
643zss87bdpzkgzdb9dpmhj95q4vbsw8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 17:50:05.022088+03
r2vqcyne178b0zjxdtuz5vikn7477h6n	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 15:06:42.769196+03
2btnqpr1d0vjl0hfbcww4cwjsdy9xyze	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 23:31:10.578032+03
tqngbr5xzrcmyhu2c9nqxu33uwp5hqb6	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 18:04:19.091618+03
dzmtj8qd7pn50huecmt9bn4e8xuaf7bd	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 23:41:30.443308+03
23i8twa8hlmrksnw9nvqwevg722xegsa	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 23:41:59.163903+03
tuavc2992b5gx7cldwansmgt0utrqm32	NGNlNTk1ZDc0MzY3ZGQ0OWRlZDY4ODYyZTVkY2ZhZDg4Y2IxNWM1ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDI2ODY3MzM0MWM2NjMzNmYxYzY3Y2NhMWE5MjQ2MGU4OTA2MDA1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2xhbmd1YWdlIjoicnUifQ==	2019-12-28 12:38:52.531627+03
8d3rd2hyeq5xwm5j5lh4pzc0ukaguj3c	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 23:48:09.23578+03
mks13b21cukn1yg0ub1yw4jgi5bc8qyj	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 15:18:53.289993+03
dk06ui34i5h15ctkox7ao8g1gpyr3coe	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 15:40:45.542953+03
3rd1c5o0s94zj5cegd64uiijwg1ecdsx	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-29 00:04:07.66634+03
8ksfq0w1oe0k4j35h8pr1bdqaxkzgf07	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 15:24:13.491237+03
k6y0025fquqowqj68a8xhnkzw5g1vppu	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-29 00:41:51.427782+03
cgvk0g9gthdej0d2cx2897w8psi2ango	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-29 11:57:11.985456+03
v7yim3gtl9dp10pka14pgiayfeyewapf	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 16:54:00.125581+03
m5zgz6l1d7hdjukeasvx7xx3e13cxn54	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-29 19:41:12.03163+03
x6c0eb8ibxhm0qg2x7iuvms859tgs8ky	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 18:48:20.022492+03
q6xo124n6xgtlbz47wcp7h1us958n8hs	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 20:39:08.22652+03
v4ourox0t0xyaky68e0swelj1d9pklr8	YjhkOTIyZDVlNGMyODliYmZmYWJiN2U2MmIyZTkwZDQ5YzRhZGU3Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==	2019-12-28 22:44:15.397448+03
h3zyd9ur3372b6x33zau6hif9llxyh39	N2VjOTAxYjYwOWZhMWQ1YjA0NDQzNGNhYjUzMjk5Yzc5NDIzYTkzZjp7Il9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9oYXNoIjoiMDI2ODY3MzM0MWM2NjMzNmYxYzY3Y2NhMWE5MjQ2MGU4OTA2MDA1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:25:30.592213+03
ipyc31r1q6qoy67k0byvfqi4hsv1j66x	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 13:43:08.365274+03
czdbcwegd5jyn3m09a3eq6xd2hiium40	NTYxNWNjY2U3ZDVjZTc4Y2QyNDY1M2I0NjcwZmI2YTZjNTRkNzM0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 11:56:41.630838+03
43c6lbjcorf22t8jsdkeifgveil09bqt	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:29:07.987488+03
m8b4adc0o8kxkgnm97ru063kz7bu6xd4	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 23:40:09.020028+03
g4afmu5s0h30mp9nsboxb99xz4j1sskt	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 23:41:54.995852+03
ig43blnej8dx58wlbyj9i7amnjx0kfkh	NTYxNWNjY2U3ZDVjZTc4Y2QyNDY1M2I0NjcwZmI2YTZjNTRkNzM0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 11:59:14.50604+03
mw0afdaq3zrrh0zr9eg2yrcnc2ujjeuz	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 23:42:02.568314+03
7hfz9hs4820rv4q0sgsmgywy3hln3sx8	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 14:22:48.653809+03
oq9ykamxikdb3w6cunbjgi0kravbmpfm	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 23:48:13.181088+03
g37ko73jg1n7758m7yjyy15aycnjuftj	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:35:11.865389+03
niejwazg18yh7dt8ggl139e7e6yjyt0d	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-28 20:38:31.989685+03
2v3a0v19dozj4be79fxmxtkynxziajcp	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-29 00:41:37.005795+03
ke94p07wc1whkay0rdiyzlg1tpzjkj3f	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 16:20:27.840007+03
z7187l4ci0g1wc6i4vaqxwi9hwi2ds2l	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 13:56:36.298216+03
6bnw3p29hjha8u7g3eh1n8gu6qcjus3t	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 14:39:49.803471+03
0yj9ynoekx80wwwknnqsce6n8m3krk9t	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-29 00:43:21.444584+03
p921tusk96ghd4q9fqae1i3mwfh2bkww	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:37:31.443978+03
zaflvj1nt5hrbbioe2c4dgp7p37d2t8j	NTYxNWNjY2U3ZDVjZTc4Y2QyNDY1M2I0NjcwZmI2YTZjNTRkNzM0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 12:20:17.1403+03
ddtl7tzjjwnws2ezrfkfc4m6ez0pqqvn	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2019-12-28 17:10:20.714777+03
apjb86en8s054fpsa254lnd65197atz5	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2019-12-29 14:03:23.63987+03
2axi3glxs3ztus1bslizchqtub3cjgsc	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 15:16:47.133522+03
zgnyi6r1p0obm7yht14f2bcnnifi89q5	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:21:54.261259+03
h0hy1qo3kwnwnelheu9rgj5tz4uwd9o5	MjUzOTgyNzNiNDIyZGQ4N2E1M2I1OGM5NjE3YzJmMDEwNjhkYTJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2019-12-28 12:47:38.252065+03
0mi2hqsdb7jh8rt7nc1gq0n5zp8v2dsf	NGUwMjI4ZGFkMDdiOWMxZTc4Y2MyNThmMmZkNzY2YmNkOTU0ZTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2019-12-28 15:22:47.515968+03
n3txtnonhlxl3f04f3w2nx694wz4u2gj	MDAzM2FjZmE5ZjU1MTFiODgxNjNjY2FkMGMyZWJhZGFhNTg1ZWRkZjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2xhbmd1YWdlIjoicnUifQ==	2020-01-04 23:45:08.861314+03
560mw08wc6eoip2q31ptxwoadqno4swe	ODJiMDkzZjVmZjQ0NGI3ODdkYjllY2MxMzk0ZjRkMWFiZDkzYzAyODp7Il9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjAyNjg2NzMzNDFjNjYzMzZmMWM2N2NjYTFhOTI0NjBlODkwNjAwNTkifQ==	2020-01-05 16:50:29.186611+03
wt1detbagvdc1nc1nani2tf8s6amony6	Yzc5NTkxYTRlY2JlNzkxMWRhYzcwZWUwZjNhNjA0M2RhZTFjM2NlNDp7Il9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIwMjY4NjczMzQxYzY2MzM2ZjFjNjdjY2ExYTkyNDYwZTg5MDYwMDU5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==	2020-01-05 13:21:08.171323+03
6x4crsbmd0yp57nuwuzsgwpaqnkonc6q	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 12:55:39.925065+03
xb8jod4nhdzf9bplb77x3lseek6mofyf	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 09:31:12.781521+03
21gx3770nku3fttrvst3a9c2erykkvim	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 10:52:17.463163+03
khdxbdg9n2hl6ib86l854tt0g7d0ll10	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 15:40:29.322644+03
gw930cfw9ibkz0kqjcobhhy8by4x7nkt	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 23:44:22.335085+03
n0aq2lc2esrjy88s0imgm87ora08lwvp	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-06 21:53:32.710765+03
jg3b247upm8h3r0d6y8l007axe7m1oiu	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 22:31:05.427651+03
1pcjqd7f3iicvrw58onjav9k7enobb1l	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 22:31:05.584083+03
rftcbzqnruu7i24hnlbvx9we1ayzdfpn	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 22:31:05.747856+03
sta8gkb5vioh7uqk1y56hahlg98mmtk5	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 22:31:05.940383+03
gconb1uyoumkmllztbvy0174kv5cyamo	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-05 23:12:58.133031+03
d7l0q6imz0j49gi4gr2k5pfd8atxwc8s	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-05 23:17:40.799285+03
rry36q2c32g8qemh7j1o76ajgqjbm10w	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 22:56:56.480838+03
tnwqk6ul9b2qlp0tni60g55owrhzw92j	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 22:56:56.741566+03
3tb1k70oqqal56fgwt8b2pz9l8d0elvw	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 22:56:56.928193+03
c12l2j1b6hvg17urz14rbe45knlc49si	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 22:56:57.107836+03
rhcyw4fe5eays3olkgkmcbn8yvh342a5	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-05 23:26:56.241542+03
dxyeyajn51y75mhd78zx33ozaenw5f7h	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 23:56:13.951045+03
1wu99alcnn3z6vo2y3agr0cxj55k4f6y	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 23:56:14.108013+03
2d3lwjeijycr3v0d8kshp2bhuzqdywji	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-05 23:56:14.25793+03
7nfy2ntv8c0ysxfra1aojdr3siaap8ib	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 00:03:14.314498+03
qj7r57tu7pvyhfrlhhdcwxkrs25sjxif	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:03:14.656264+03
aty79eh8jbo5vf254vwm30zbk9en6tk7	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:03:15.244619+03
p4oxs6w71l9w9vxm8w0suylcy8hnhnm7	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:03:15.488466+03
iq1i26yk75a92z6c8ibxrmk3zrruleid	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:03:15.699392+03
bv907ii16wem1jkiqn4fgonomwqbchkx	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:03:16.202578+03
4c74pnszi5xmgov6jenwvll48fhe09xr	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:03:16.432679+03
1qvcqt6g5crfefworgzv6oxjuqv1oaet	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:03:16.622408+03
dbhhv6a3kfu42k53v9adk2xcpfj6wvtd	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:14:36.908255+03
gs6avdtdau5cmf92gep8vqosk0c6hge9	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:14:37.437022+03
8y1ql1oed7neazfgz3k7l0vch51658j9	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:36:13.080842+03
5da6veqgqnx8mddo9djx1md5uzpbgbpq	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 01:36:49.591617+03
53t5b9tak0o00ucbsrx9nnagc6ndgim7	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 04:20:20.139364+03
z0sjg4foe6a8o2xqf05fnecrckia9fuh	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 06:06:36.249908+03
7nhox730oqzu7jtdxtmvsol85lelgos8	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 07:05:27.554206+03
81i2orul8l2agjo5rv5q5lwzcj2rufly	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 07:41:27.136346+03
zblwj29s0c6758jijydpttysrxz4h4jp	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 07:41:28.047272+03
7v2ba75rzncum836mtod8e7fznb7z421	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 23:48:55.804877+03
j9wi22c1fa7eypkc0ptckd1bc6cthxk8	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-06 21:53:32.757137+03
3jxjlgktmxuxkyocugzxdx2q8vfr8ics	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 03:58:03.581169+03
ei4ssze19m8k45n272x0vfyvyq9d3ed3	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:54:44.312935+03
o7uv9io393r9i9k3kilz37me0k37p23t	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 09:34:14.118962+03
wox39kjljic8xffeieb3sylk8m9rsc8h	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 17:27:12.701366+03
rrlnvx3mshv5sh1wkucv3v4dp7gzma6y	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 18:22:34.881481+03
5na1yqtj6wcl83jy4pum9kkqu95n3nak	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 18:49:42.641642+03
awyt38ohzpw5ievgwzridzalfh9qw223	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 19:25:09.290747+03
inl7h6gt0xtnc8mwiybltm98a3muemky	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 20:17:24.698389+03
3f2e4yztsflqop6ipu9cu4d3be09htuc	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 20:17:25.377943+03
c1ajkvb6nicolyqs95hxoyjqamwgdso0	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 12:40:38.013075+03
u92ag4wl86ldyn6iezucaft1kxwtep8h	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:50.239684+03
c4nqy90kn68plp8eqllyjmt02m4bcm0n	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:50.964089+03
c2k9ru1s5c3ggrqhi3qtz4cm89enrmjh	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:51.692272+03
hr68zqw1is9qm6xrx944ahsy8h4penc8	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:52.401438+03
zsp5zy1p7u12yp835r8nvu50uvn93b2a	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:53.097492+03
0f6xfhy8nq6nb6knlz47ljbfda7l9epd	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:53.951994+03
hpusumackd82aghcuv9323y3431q5rtk	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 12:51:17.541611+03
rbi8g6wqcbyspx96aosf66qbat2dhz1k	YTkyYzRkYjYyZDY5ZTIyYjEzOThhMGYzZTFkNGU0ZjY3MjZlNTdhYjp7Il9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRkZDdmMTEzZDZmNDE5M2RkMzgwZmFhOTgwZjMxZTYxOTcyYzhmMDIifQ==	2020-01-07 14:22:16.041774+03
i2rfpq2fwct3kkupb42bgh325fr0ndm3	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 20:43:33.604031+03
5g7jkmp8a2a9zxpp1usi518pmhey9w7h	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-06 21:00:35.719864+03
hxkfdtttg0q81eehcswien2uoyujhnsk	MGU0Njk1NWEzZDIxOWQ5NWE5YjE0NDI3ODJjM2FkNzFiNzgzZjBhMDp7Il9sYW5ndWFnZSI6ImVuIn0=	2020-01-06 21:53:43.77189+03
weat87h4oj1d8mh5ypodgdwg2ju9yaxz	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 01:14:24.888026+03
dq2n6eu3lw5vk0mn1xua6z4kiy967qai	MTZlZmNhMTNjMzJmMWRmNmE3MjlmZjlkZDlkMDE4OGIwZmUyNTA3YTp7Il9sYW5ndWFnZSI6ImVuIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRkZDdmMTEzZDZmNDE5M2RkMzgwZmFhOTgwZjMxZTYxOTcyYzhmMDIifQ==	2020-01-07 07:56:27.751515+03
zlm7ai3qj56y5t11ety4en2utf9bi8p9	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 12:29:32.415423+03
s3z9rr9mhsn5l0iycx0oa3iro32y49ra	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:49.870417+03
5m58ue7e22hk9pbdcc5epbsr98432hd6	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:50.601785+03
ke2uch5bmymwytrxka5zm1g5aws47mhf	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:51.328108+03
a7914hziwqlki45tucma4r145gcnu1r4	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:52.054972+03
qvi1p0gqcuyswe73rhccwgnhtj2bo0v0	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:52.747604+03
2v06spofeq34jmkeed2tmxlk4xaywx9h	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 13:42:53.560098+03
tmoficguz7cj3h6v4z0ky4wc2gfeakyf	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:45.254176+03
smqetibcomor4f4qhcpbnmbe37ffql9p	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:45.758801+03
amr1pj8v2yyyb85be9je4nt0bwn3giup	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:46.28884+03
nf6poyxjkli1eag0wjf2b2csyfjjv54h	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:46.812977+03
l9kuh37crmt26dgao57g27gbn598qpsn	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:47.34588+03
jgycukvcnzffb7v5wlma97k4wmpous2i	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:48.887759+03
xpmcroslytu6f5vdd9sxigebb0sqc5yj	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:49.416943+03
6dmafwedkml0ucuk93kb1fwg70xsf2k9	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:49.934085+03
5utrrijxfdi9xgw4pumkkntl1sv0en06	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:51.464876+03
mw8lt2g27j1s6ab0b4jmoc6gdfi79xsh	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:51.981799+03
cr4ctrz2tffyy94spr47zzzybfbpyijc	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:52.586172+03
wewydvwkummytc90fnu0sa7w5ka8j55m	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-06 21:40:53.137645+03
3j0lbj585ylcezct9j8ku9tut4kufb4l	Y2UwY2Q0ZWU4MmE2MDg2NmNmOTYxZjFlOGE4OWVhMzU4NzdkMWE4Njp7Il9sYW5ndWFnZSI6InJ1In0=	2020-01-07 14:22:16.904687+03
psu8fy0e8y3zp56tmicph5dwriez1k30	YjEwNjhjZjJkYWJhZTFmZjgxN2Q5OGYxMTVlZjE0NjkzNWY5YzczOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDI2ODY3MzM0MWM2NjMzNmYxYzY3Y2NhMWE5MjQ2MGU4OTA2MDA1OSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2xhbmd1YWdlIjoicnUifQ==	2020-01-07 23:20:54.455008+03
\.


--
-- Data for Name: interaction_contact; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.interaction_contact (id, fullname, email, phone, content, ipaddr, "timestamp", flag, subject) FROM stdin;
20	Vladimir Godovalov	gva008@gmail.com	89854828288	Please send me login details for Comaex Demo	46.188.60.127	2019-12-22 23:24:23.774543+03	f	credentials
\.


--
-- Name: interaction_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.interaction_contact_id_seq', 20, true);


--
-- Data for Name: interaction_correspondence; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.interaction_correspondence (id, name, email, phone, content, "timestamp", flag, person_id_id, action, content_html, feedback, subject, theme) FROM stdin;
\.


--
-- Name: interaction_correspondence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.interaction_correspondence_id_seq', 1, false);


--
-- Data for Name: promotion_image; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.promotion_image (id, image, slug, title, sentence, urllink, description, desc_html, name_id, data1, data2) FROM stdin;
1	hvac/email_image2_UQHYe7j.jpg	hvac	О продукте			&ensp;Сервер подключается к контроллерам управления оборудованием и осуществляет функции мониторинга, управления, записи информации, сигнализации состояний, визуализацию устройств. Вот примеры интерфейса функционала:	<p>&ensp;Сервер подключается к контроллерам управления оборудованием и осуществляет функции мониторинга, управления, записи информации, сигнализации состояний, визуализацию устройств. Вот примеры интерфейса функционала:</p>	2		
2		hvac	Наше предложение			&ensp;Мы предлагаем на условиях OEM-соглашения поставлять вашей компании сервера Comaex под логотипом вашей компании. Мы разработаем листы параметров конфигурации ваших устройств и мнемосхемы визуализаций. Вам останется только загружать файлы объектов и подключать устройства к серверу.	<p>&ensp;Мы предлагаем на условиях OEM-соглашения поставлять вашей компании сервера Comaex под логотипом вашей компании. Мы разработаем листы параметров конфигурации ваших устройств и мнемосхемы визуализаций. Вам останется только загружать файлы объектов и подключать устройства к серверу.</p>	2		
3		hvac	Преимущества			<ul style='text-align:left'><li><b>Низкая цена устройства</b> - от 23000 рублей;</li><li><b>Высокая производительность</b> – контроль до 1000 переменных и до 20 слейв-устройств;</li><li><b>Быстрый ввод в эксплуатацию</b>. Достаточно ввести файл конфигурации объекта, соеденить сервер со слейв-устройствами с помощью кабеля или радиомодулей и настроить роутер объекта на доступ к серверу с глобального интернета если необходимо;</li><li><b>Не нужен стационарный ПК</b>, интерфейс доступен в любом браузере;</li><li><b>LAN и WAN доступ</b>.</li></ul>	<ul style='text-align:left'><li><b>Низкая цена устройства</b> - от 23000 рублей;</li><li><b>Высокая производительность</b> – контроль до 1000 переменных и до 20 слейв-устройств;</li><li><b>Быстрый ввод в эксплуатацию</b>. Достаточно ввести файл конфигурации объекта, соеденить сервер со слейв-устройствами с помощью кабеля или радиомодулей и настроить роутер объекта на доступ к серверу с глобального интернета если необходимо;</li><li><b>Не нужен стационарный ПК</b>, интерфейс доступен в любом браузере;</li><li><b>LAN и WAN доступ</b>.</li></ul>	2		
4		hvac	Ваша выгода			<ul style='text-align:left'><li><b>Конкурентные преимущества</b>. Ваше HVAC оборудование уже поставляется с готовой, полнофункциональной системой диспетчеризации;</li><li><b>Минимальные затраты на ввод в эксплуатацию</b>;</li><li><b>Высокая маржинальность</b>. Благодаря низкой цене продажи, вы можете вводить свою целесообразную наценку;</li><li><b>Нет необходимости в собственной разработке</b>. Сервера поставляются под вашим логотипом, а наша команда профессионалов отвечает за продукт.</li></ul>	<ul style='text-align:left'><li><b>Конкурентные преимущества</b>. Ваше HVAC оборудование уже поставляется с готовой, полнофункциональной системой диспетчеризации;</li><li><b>Минимальные затраты на ввод в эксплуатацию</b>;</li><li><b>Высокая маржинальность</b>. Благодаря низкой цене продажи, вы можете вводить свою целесообразную наценку;</li><li><b>Нет необходимости в собственной разработке</b>. Сервера поставляются под вашим логотипом, а наша команда профессионалов отвечает за продукт.</li></ul>	2		
5		hvac	Информация для изучения			<ul style='text-align:left'><li>Более детальное описание технологии: <a href='http://www.comaex.info' title='Посетить сайт' target='_blank'>comaex.info</a>;</li><li>Реальный сервер в работе:  <a href='http://comaex.ddns.net' title='Comaex Demo' target='_blank'>comaex.ddns.net</a>. Даные для входа: логин-<b>user</b>, пароль-<b>user12345.</b></li></ul>	<ul style='text-align:left'><li>Более детальное описание технологии: <a href='http://www.comaex.info' title='Посетить сайт' target='_blank'>comaex.info</a>;</li><li>Реальный сервер в работе:  <a href='http://comaex.ddns.net' title='Comaex Demo' target='_blank'>comaex.ddns.net</a>. Даные для входа: логин-<b>user</b>, пароль-<b>user12345.</b></li></ul>	2		
6	hvac/email_image2_ofeeebJ.jpg	hvac	About product			&ensp;The server connects to the equipment controllers and performs the functions of monitoring, control, recording information, signaling states, visualizing devices. Here are the examples of the functional interface:	<p>&ensp;The server connects to the equipment controllers and performs the functions of monitoring, control, recording information, signaling states, visualizing devices. Here are the examples of the functional interface:</p>	3		
7		hvac	What we offer			&ensp;We offer, under the terms of an OEM agreement, to supply your company with Comaex servers under your company logo. We will develop configuration sheets for your devices and visualization mimics. You just have to upload the object files and connect the devices to the server.	<p>&ensp;We offer, under the terms of an OEM agreement, to supply your company with Comaex servers under your company logo. We will develop configuration sheets for your devices and visualization mimics. You just have to upload the object files and connect the devices to the server.</p>	3		
8		hvac	Advantages			<ul style = 'text-align: left'> <li> <b> Low device price </b> - from 23,000 rubles; </li> <li> <b> High performance </b> - control up to 1000 variables and up to 20 slaves; </li> <li> <b> Quick commissioning </b>. It is enough to enter the object configuration file, connect the server to the slave devices using a cable or radio modules and configure the object router to access the server from the global Internet if necessary; </li> <li> <b> No need for a stationary PC </b>, the interface is accessible in any browser; </li> <li> <b> LAN and WAN access </b>. </li> </ul>	<ul style = 'text-align: left'> <li> <b> Low device price </b> - from 23,000 rubles; </li> <li> <b> High performance </b> - control up to 1000 variables and up to 20 slaves; </li> <li> <b> Quick commissioning </b>. It is enough to enter the object configuration file, connect the server to the slave devices using a cable or radio modules and configure the object router to access the server from the global Internet if necessary; </li> <li> <b> No need for a stationary PC </b>, the interface is accessible in any browser; </li> <li> <b> LAN and WAN access </b>. </li> </ul>	3		
9		hvac	Your benefit			<ul style = 'text-align: left'> <li> <b> Competitive Advantages </b>. Your HVAC equipment is already supplied with a ready-made fully-functional dispatch system </li> <li> <b> Minimum commissioning costs </b> </li> <li> <b> High margin </b>. Due to the low selling price, you can enter your own reasonable margin </li> <li> <b> No need for your own development </b>. Servers are delivered under your logo, and our team of professionals is responsible for the product. </li> </ul>	<ul style = 'text-align: left'> <li> <b> Competitive Advantages </b>. Your HVAC equipment is already supplied with a ready-made fully-functional dispatch system </li> <li> <b> Minimum commissioning costs </b> </li> <li> <b> High margin </b>. Due to the low selling price, you can enter your own reasonable margin </li> <li> <b> No need for your own development </b>. Servers are delivered under your logo, and our team of professionals is responsible for the product. </li> </ul>	3		
10		hvac	Information for learning			<ul style = 'text-align: left'> <li> A more detailed description of the technology: <a href='http://www.comaex.info' title='Visit the site 'target='_blank'> comaex.info </a> </li> <li> The real server is at work: <a href='http://comaex.ddns.net' title='Comaex Demo' target='_blank'> comaex.ddns.net </a>. Login- <b> user </b>, password- <b> user12345. </b> </li> </ul>	<ul style = 'text-align: left'> <li> A more detailed description of the technology: <a href='http://www.comaex.info' title='Visit the site 'target='_blank'> comaex.info </a> </li> <li> The real server is at work: <a href='http://comaex.ddns.net' title='Comaex Demo' target='_blank'> comaex.ddns.net </a>. Login- <b> user </b>, password- <b> user12345. </b> </li> </ul>	3		
11	sfugd/garage_door_JEmGz5T.jpg	sfugd				Bla bla bla	<p>Bla bla bla</p>	4		
12	sfugd/garage_patent_1.jpg	sfugd	Patent description		http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&r=1&f=G&l=50&s1=8327908.PN.&OS=PN/8327908&RS=PN/8327908	The design is intended for use in garages for opening and closing openings. This model is made in accordance with <a href ="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&r=1&f=G&l=50&s1=8327908.PN.&OS=PN/8327908&RS=PN/8327908" style="color:red; cursor:pointer;" target="_blank">US Pat. No. 8,327,908</a> and is based on the key clauses of the claims. The design has four sections that are folded like an accordion, which ensures a substantial compactness of the structure. Additional advantages also include: a small headroom opening, high opening speed of 5-8 seconds, no ropes and torsion springs, which significantly reduces the cost of low maintenance and provides a longer service life. The model is simple in design, therefore, reliable in operation and inexpensive in mass production.	<p>The design is intended for use in garages for opening and closing openings. This model is made in accordance with <a href ="http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&r=1&f=G&l=50&s1=8327908.PN.&OS=PN/8327908&RS=PN/8327908" style="color:red; cursor:pointer;" target="_blank">US Pat. No. 8,327,908</a> and is based on the key clauses of the claims. The design has four sections that are folded like an accordion, which ensures a substantial compactness of the structure. Additional advantages also include: a small headroom opening, high opening speed of 5-8 seconds, no ropes and torsion springs, which significantly reduces the cost of low maintenance and provides a longer service life. The model is simple in design, therefore, reliable in operation and inexpensive in mass production.</p>	5	Visit USPTO website to view the patent	
13		sfugd	Your benefit			Bla bla bla	<p>Bla bla bla</p>	5		
14		sfugd	Make your bid			Bla bla bla	<p>Bla bla bla</p>	5		
\.


--
-- Name: promotion_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.promotion_image_id_seq', 14, true);


--
-- Data for Name: promotion_promotion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.promotion_promotion (id, category, title, slug, subtitle, sentence, description, desc_html, image, filenum, urllink, "timestamp", flag, data1, data2, data3, data4, language) FROM stdin;
4	SFUGD	Компактные ворота. Патент США 8327908	sfugd			Бла бла бла	<p>Бла бла бла</p>	sfugd/car_garage_em0llnt.jpg	0		2019-12-21 18:26:43.220189+03	f					RU
2	HVAC	О нас	hvac			&ensp;Мы занимаемся разработкой супервизор – серверов <a href='http://www.comaex.info' title='Посетить сайт' target='_blank'>Comaex</a>, предназначенных для формирования информационной среды объекта. Так он выглядит:	<p>&ensp;Мы занимаемся разработкой супервизор – серверов <a href='http://www.comaex.info' title='Посетить сайт' target='_blank'>Comaex</a>, предназначенных для формирования информационной среды объекта. Так он выглядит:</p>	hvac/image_slider1_mm9hSLr.jpg	0		2019-12-21 10:39:46.948588+03	f					RU
3	HVAC	About Us	hvac			&ensp;We are developing a supervisor server <a href='http://www.comaex.info' title='Visit the site 'target='_blank'> Comaex </a>, designed to form the information environment of the object. So it looks like:	<p>&ensp;We are developing a supervisor server <a href='http://www.comaex.info' title='Visit the site 'target='_blank'> Comaex </a>, designed to form the information environment of the object. So it looks like:</p>	hvac/Mini_PC_3_bYTqip6.jpg	0		2019-12-21 10:47:36.161966+03	f					EN
5	SFUGD	Patent for SALE	sfugd			Bla bla bla	<p>Bla bla bla</p>	sfugd/car_garage_VwdND1f.jpg	0	http://www.fold-up-door.com	2019-12-23 16:45:09.869516+03	f	Visit website www.fold-up-door.com				EN
\.


--
-- Name: promotion_promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.promotion_promotion_id_seq', 5, true);


--
-- Data for Name: scheduler_scheduler; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scheduler_scheduler (id, category, tick, counter, event, processing) FROM stdin;
2	SFUGD	0	0	Тик равен 0. Планировщик остановлен	Нет данных
1	HVAC	0	0	Тик равен 0. Планировщик остановлен	Нет данных
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
-- Name: clients_clients_email_dcc1d15b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.clients_clients
    ADD CONSTRAINT clients_clients_email_dcc1d15b_uniq UNIQUE (email);


--
-- Name: clients_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.clients_clients
    ADD CONSTRAINT clients_clients_pkey PRIMARY KEY (uuid);


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
-- Name: scheduler_scheduler_category_c74efccc_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.scheduler_scheduler
    ADD CONSTRAINT scheduler_scheduler_category_c74efccc_uniq UNIQUE (category);


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

