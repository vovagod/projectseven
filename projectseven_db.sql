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
    desc_html text NOT NULL
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
-- Name: base_langinfo; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.base_langinfo (
    id integer NOT NULL,
    language character varying(100) NOT NULL
);


ALTER TABLE public.base_langinfo OWNER TO admin;

--
-- Name: base_langinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.base_langinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_langinfo_id_seq OWNER TO admin;

--
-- Name: base_langinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.base_langinfo_id_seq OWNED BY public.base_langinfo.id;


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
    description text NOT NULL,
    desc_html text NOT NULL,
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

ALTER TABLE ONLY public.base_langinfo ALTER COLUMN id SET DEFAULT nextval('public.base_langinfo_id_seq'::regclass);


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
1	pbkdf2_sha256$100000$1EdKk0LQWvIq$tcJhxXNlgpeVrQt1uQ5qulpHwz0dSfgRBfEKyb3gRIs=	2019-12-14 20:53:52.058082+03	t	admin			gva008@gmail.com	t	t	2019-12-12 21:20:11.404664+03
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
1	Сервер Comaex	slider			Супервизор для \r\nсистем HVAC, умного\r\nдома и интернета объектов	<p>Супервизор для \nсистем HVAC, умного\nдома и интернета объектов</p>	slider/slider_1_eouQh4l.jpg	0	http://127.0.0.1:8000/home/#about	2019-12-12 22:14:02.018967+03	t	#4E4E4E	inherit	inherit	blue	Слайдер
2	Comaex для инженерных систем	slajder			Супервизорский \r\nконтроль и управление\r\nинженерным оборудованием	<p>Супервизорский \nконтроль и управление\nинженерным оборудованием</p>	slajder/slider_2_8Qqosbf.jpg	0	http://127.0.0.1:8000/home/#application1	2019-12-12 22:21:18.663433+03	t	blue	white	#4A5970	blue	Слайдер
3	Comaex для Умного Дома	slajder			Контроль \r\nза безопасностью, климатом \r\nи инженерными системами жилища	<p>Контроль \nза безопасностью, климатом \nи инженерными системами жилища</p>	slajder/slider_3_mmIH0uE.jpg	0	http://127.0.0.1:8000/home/#application2	2019-12-12 22:22:50.150943+03	t	blue	white	#84756E	blue	Слайдер
4	Comaex для Интернета объектов	slajder			Хаб для \r\nдатчиков и счетчиков	<p>Хаб для \nдатчиков и счетчиков</p>	slajder/slider_4_NWxc2fx.jpg	0	http://127.0.0.1:8000/home/#application3	2019-12-12 22:24:22.946345+03	f	white	white	#000324		Слайдер
5	Супервизор-сервер Comaex	o-comaex			&emsp;Сервер Comaex - система контроля и управления уровня супервизор  для систем HVAC, умного дома и интернета объектов. Представляет собой <a onclick="document.getElementById('id01').style.display='block'" style="color:red; cursor: pointer;">компактное устройство</a>,  предназначенное для подключения к контроллерам:<ul style="font-style: italic;"><li> управления светом;</li><li>управления различными приводами - жалюзи или замков к примеру;</li><li>передачи данных с разнообразных датчиков – движения, температуры, влажности, давления и т.п.;</li><li>передачи информации со счетчиков ресурсов – воды, газа, электроэнергии;</li><li>управления сложным инженерным оборудованием – вентмашинами, тепловыми пунктами, бойлерами и другим устройствам с микропроцессорным управлением.</li></ul>&emsp;Обмен данными с контроллерами происходит по протоколу Modbus RTU, к устройствам контроля сервер может подключаться посредством кабеля или беспроводным способом - с помощью <a onclick="document.getElementById('id02').style.display='block'" style="color:red; cursor: pointer;">радиомодуля</a>. <br>\r\n&emsp;Ввод параметров конфигурации устройств объекта производится вручную через панель администратора либо загрузкой специального xls-файла. Данный файл является шаблоном ввода данных и позволяет в считанные минуты запустить супервизор-сервер в работу. Вместе с файлом конфигурации вносятся мнемосхемы объектов для создания страниц визуализации. После ввода этих данных формируется автоматический интерфейс управления объекта и сервер готов к работе.<br>\r\n&emsp;Интерфейс управления становится доступен на компьютере, смартфоне либо планшете. При этом возможна работа устройства, как в локальной Wi-Fi сети объекта, так и с глобального Интернета.<br>\r\n&emsp;Сервер имеет производительность до 1000 точек данных и до 20 слейв-устройств, что более чем достаточно для большинства объектов. Помотреть реальный образец в работе можно тут: <a href="http://comaex.ddns.net" style="color:red; cursor:pointer;" target="_blank">Comaex Demo</a>. Если у вас нет данных входа, запросите их через<a href="#contact" style="color:red; cursor: pointer;"> Контакты</a>.	<p>&emsp;Сервер Comaex - система контроля и управления уровня супервизор  для систем HVAC, умного дома и интернета объектов. Представляет собой <a onclick="document.getElementById('id01').style.display='block'" style="color:red; cursor: pointer;">компактное устройство</a>,  предназначенное для подключения к контроллерам:<ul style="font-style: italic;"><li> управления светом;</li><li>управления различными приводами - жалюзи или замков к примеру;</li><li>передачи данных с разнообразных датчиков – движения, температуры, влажности, давления и т.п.;</li><li>передачи информации со счетчиков ресурсов – воды, газа, электроэнергии;</li><li>управления сложным инженерным оборудованием – вентмашинами, тепловыми пунктами, бойлерами и другим устройствам с микропроцессорным управлением.</li></ul>&emsp;Обмен данными с контроллерами происходит по протоколу Modbus RTU, к устройствам контроля сервер может подключаться посредством кабеля или беспроводным способом - с помощью <a onclick="document.getElementById('id02').style.display='block'" style="color:red; cursor: pointer;">радиомодуля</a>. <br>\n&emsp;Ввод параметров конфигурации устройств объекта производится вручную через панель администратора либо загрузкой специального xls-файла. Данный файл является шаблоном ввода данных и позволяет в считанные минуты запустить супервизор-сервер в работу. Вместе с файлом конфигурации вносятся мнемосхемы объектов для создания страниц визуализации. После ввода этих данных формируется автоматический интерфейс управления объекта и сервер готов к работе.<br>\n&emsp;Интерфейс управления становится доступен на компьютере, смартфоне либо планшете. При этом возможна работа устройства, как в локальной Wi-Fi сети объекта, так и с глобального Интернета.<br>\n&emsp;Сервер имеет производительность до 1000 точек данных и до 20 слейв-устройств, что более чем достаточно для большинства объектов. Помотреть реальный образец в работе можно тут: <a href="http://comaex.ddns.net" style="color:red; cursor:pointer;" target="_blank">Comaex Demo</a>. Если у вас нет данных входа, запросите их через<a href="#contact" style="color:red; cursor: pointer;"> Контакты</a>.</p>	o-comaex/no_image.jpg	0		2019-12-12 22:28:37.814303+03	f					О Comaex
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
\.


--
-- Name: base_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.base_base_id_seq', 18, true);


--
-- Data for Name: base_image; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.base_image (id, image, slug, title, sentence, description, name_id, desc_html) FROM stdin;
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
-- Data for Name: base_langinfo; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.base_langinfo (id, language) FROM stdin;
\.


--
-- Name: base_langinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.base_langinfo_id_seq', 1, false);


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
9	Стоимость картинки	#price_images	0			Применение
5	Применение	#application	1			Применение
7	Портфолио	#portfolio	1			Применение
8	Стоимость	#price	1			Применение
10	Контакты	#contact	1			Инфо
11	Новости	#news	1			Инфо
\.


--
-- Name: base_submenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.base_submenu_id_seq', 11, true);


--
-- Data for Name: clients_clients; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.clients_clients (company, email, phone, about, area, persons, created, enable_mailing, interested, flag, category, counter, uuid, error_mailing, file, slug, address, email2, filepath, preorder, language, last_post) FROM stdin;
Computer LTD	innotech@yandex.ru	+7(985)4828588				2019-12-14 21:19:50.766516+03	t	f	f	HVAC	0	f1ad8ff7-18d3-469f-b26e-ef8b399c0605	None		computer-ltd		\N		f	RU	2019-12-14 21:20:20.567745+03
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
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 62, true);


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
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 82, true);


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
\.


--
-- Data for Name: interaction_contact; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.interaction_contact (id, fullname, email, phone, content, ipaddr, "timestamp", flag, subject) FROM stdin;
11	Вова Годовалов	gva008@gmail.com	+7(985)4828588	Пожалуйста пришлите мне данные входа в Comaex Demo	127.0.0.1	2019-12-14 21:33:48.763628+03	f	credentials
12	Вова Годовалов	gva008@gmail.com	+7(985)4828588	Пожалуйста пришлите мне данные входа в Comaex Demo	127.0.0.1	2019-12-14 21:35:27.314552+03	f	credentials
13	Владимир Годовалов	chim73@mail.ru	+7(985)4828588	Пожалуйста пришлите мне данные входа в Comaex Demo	127.0.0.1	2019-12-14 21:41:50.722217+03	f	credentials
14	Владимир Годовалов	chim73@mail.ru	+7(985)4828588	Пожалуйста пришлите мне данные входа в Comaex Demo	127.0.0.1	2019-12-14 21:44:41.259077+03	f	credentials
15	Владимир Годовалов	chim73@mail.ru	+7(985)4828588	Пожалуйста пришлите мне данные входа в Comaex Demo	127.0.0.1	2019-12-14 22:11:31.903413+03	f	credentials
\.


--
-- Name: interaction_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.interaction_contact_id_seq', 15, true);


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

COPY public.promotion_image (id, image, slug, title, sentence, description, desc_html, name_id) FROM stdin;
\.


--
-- Name: promotion_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.promotion_image_id_seq', 1, false);


--
-- Data for Name: promotion_promotion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.promotion_promotion (id, category, title, slug, subtitle, sentence, description, desc_html, image, filenum, urllink, "timestamp", flag, data1, data2, data3, data4, language) FROM stdin;
\.


--
-- Name: promotion_promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.promotion_promotion_id_seq', 1, false);


--
-- Data for Name: scheduler_scheduler; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.scheduler_scheduler (id, category, tick, counter, event, processing) FROM stdin;
\.


--
-- Name: scheduler_scheduler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.scheduler_scheduler_id_seq', 1, false);


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
-- Name: base_langinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.base_langinfo
    ADD CONSTRAINT base_langinfo_pkey PRIMARY KEY (id);


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

