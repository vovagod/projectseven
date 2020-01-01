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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin_en
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin_en;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO admin_en;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin_en
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin_en;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO admin_en;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin_en
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin_en;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO admin_en;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.auth_user OWNER TO admin_en;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin_en
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin_en;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO admin_en;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO admin_en;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin_en
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin_en;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO admin_en;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: base_base; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.base_base OWNER TO admin_en;

--
-- Name: base_base_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.base_base_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_base_id_seq OWNER TO admin_en;

--
-- Name: base_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.base_base_id_seq OWNED BY public.base_base.id;


--
-- Name: base_image; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.base_image OWNER TO admin_en;

--
-- Name: base_image_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.base_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_image_id_seq OWNER TO admin_en;

--
-- Name: base_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.base_image_id_seq OWNED BY public.base_image.id;


--
-- Name: base_menu; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.base_menu OWNER TO admin_en;

--
-- Name: base_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.base_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_menu_id_seq OWNER TO admin_en;

--
-- Name: base_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.base_menu_id_seq OWNED BY public.base_menu.id;


--
-- Name: base_submenu; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.base_submenu OWNER TO admin_en;

--
-- Name: base_submenu_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.base_submenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_submenu_id_seq OWNER TO admin_en;

--
-- Name: base_submenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.base_submenu_id_seq OWNED BY public.base_submenu.id;


--
-- Name: clients_clients; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.clients_clients OWNER TO admin_en;

--
-- Name: clients_importduplication; Type: TABLE; Schema: public; Owner: admin_en
--

CREATE TABLE public.clients_importduplication (
    id integer NOT NULL,
    company character varying(120) NOT NULL,
    cause text NOT NULL,
    created timestamp with time zone NOT NULL,
    flag boolean NOT NULL
);


ALTER TABLE public.clients_importduplication OWNER TO admin_en;

--
-- Name: clients_importduplication_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.clients_importduplication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_importduplication_id_seq OWNER TO admin_en;

--
-- Name: clients_importduplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.clients_importduplication_id_seq OWNED BY public.clients_importduplication.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.django_admin_log OWNER TO admin_en;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO admin_en;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin_en
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin_en;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO admin_en;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin_en
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin_en;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO admin_en;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin_en
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin_en;

--
-- Name: interaction_contact; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.interaction_contact OWNER TO admin_en;

--
-- Name: interaction_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.interaction_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interaction_contact_id_seq OWNER TO admin_en;

--
-- Name: interaction_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.interaction_contact_id_seq OWNED BY public.interaction_contact.id;


--
-- Name: interaction_correspondence; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.interaction_correspondence OWNER TO admin_en;

--
-- Name: interaction_correspondence_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.interaction_correspondence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interaction_correspondence_id_seq OWNER TO admin_en;

--
-- Name: interaction_correspondence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.interaction_correspondence_id_seq OWNED BY public.interaction_correspondence.id;


--
-- Name: promotion_image; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.promotion_image OWNER TO admin_en;

--
-- Name: promotion_image_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.promotion_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_image_id_seq OWNER TO admin_en;

--
-- Name: promotion_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.promotion_image_id_seq OWNED BY public.promotion_image.id;


--
-- Name: promotion_promotion; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.promotion_promotion OWNER TO admin_en;

--
-- Name: promotion_promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.promotion_promotion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_promotion_id_seq OWNER TO admin_en;

--
-- Name: promotion_promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.promotion_promotion_id_seq OWNED BY public.promotion_promotion.id;


--
-- Name: scheduler_scheduler; Type: TABLE; Schema: public; Owner: admin_en
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


ALTER TABLE public.scheduler_scheduler OWNER TO admin_en;

--
-- Name: scheduler_scheduler_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_en
--

CREATE SEQUENCE public.scheduler_scheduler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scheduler_scheduler_id_seq OWNER TO admin_en;

--
-- Name: scheduler_scheduler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_en
--

ALTER SEQUENCE public.scheduler_scheduler_id_seq OWNED BY public.scheduler_scheduler.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_base ALTER COLUMN id SET DEFAULT nextval('public.base_base_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_image ALTER COLUMN id SET DEFAULT nextval('public.base_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_menu ALTER COLUMN id SET DEFAULT nextval('public.base_menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_submenu ALTER COLUMN id SET DEFAULT nextval('public.base_submenu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.clients_importduplication ALTER COLUMN id SET DEFAULT nextval('public.clients_importduplication_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.interaction_contact ALTER COLUMN id SET DEFAULT nextval('public.interaction_contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.interaction_correspondence ALTER COLUMN id SET DEFAULT nextval('public.interaction_correspondence_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.promotion_image ALTER COLUMN id SET DEFAULT nextval('public.promotion_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.promotion_promotion ALTER COLUMN id SET DEFAULT nextval('public.promotion_promotion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.scheduler_scheduler ALTER COLUMN id SET DEFAULT nextval('public.scheduler_scheduler_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Additional images	7	add_image
20	Can change Additional images	7	change_image
21	Can delete Additional images	7	delete_image
22	Can add Page content	8	add_base
23	Can change Page content	8	change_base
24	Can delete Page content	8	delete_base
25	Can add Vertical submenu	9	add_submenu
26	Can change Vertical submenu	9	change_submenu
27	Can delete Vertical submenu	9	delete_submenu
28	Can add Horizontal menu	10	add_menu
29	Can change Horizontal menu	10	change_menu
30	Can delete Horizontal menu	10	delete_menu
31	Can add Incoming messages	11	add_contact
32	Can change Incoming messages	11	change_contact
33	Can delete Incoming messages	11	delete_contact
34	Can add Forwarded correspondence	12	add_correspondence
35	Can change Forwarded correspondence	12	change_correspondence
36	Can delete Forwarded correspondence	12	delete_correspondence
37	Can add ImportDuplication	13	add_importduplication
38	Can change ImportDuplication	13	change_importduplication
39	Can delete ImportDuplication	13	delete_importduplication
40	Can add Clients	14	add_clients
41	Can change Clients	14	change_clients
42	Can delete Clients	14	delete_clients
43	Can add Additional image	15	add_image
44	Can change Additional image	15	change_image
45	Can delete Additional image	15	delete_image
46	Can add Promotion	16	add_promotion
47	Can change Promotion	16	change_promotion
48	Can delete Promotion	16	delete_promotion
49	Can add Scheduler	17	add_scheduler
50	Can change Scheduler	17	change_scheduler
51	Can delete Scheduler	17	delete_scheduler
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 51, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$UdmRHbhR1E4T$Vrr24GdiFT1/zluHuYZiC7sT5vwKOs7c1b/O4dZ/qV0=	\N	t	admin			gva008@gmail.com	t	t	2019-12-29 21:24:55.484667+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: base_base; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.base_base (id, title, slug, subtitle, sentence, description, desc_html, image, filenum, urllink, "timestamp", flag, data1, data2, data3, data4, menu_id) FROM stdin;
1	Comaex Server	slider			Supervisor for\r\nHVAC systems, \r\nSmart Home and IoT	<p>Supervisor for\nHVAC systems, \nSmart Home and IoT</p>	slider/slider_1.jpg	0	http://127.0.0.1:8000/home/#about	2019-12-30 00:09:43.855223+03	t	#4E4E4E	inherit	inherit	blue	Slider
2	Comaex for Engineering systems	slider			Supervisor\r\ncontrol and monitoring\r\nof engineering equipment	<p>Supervisor\ncontrol and monitoring\nof engineering equipment</p>	slider/slider_2_FefRhUX.jpg	0	http://127.0.0.1:8000/home/#application1	2019-12-30 10:01:23.920764+03	t	blue	white	#4A5970	blue	Slider
3	Comaex for Smart Home	slider			Safety, climate\r\nand house engineering\r\nsystems monitoring	<p>Safety, climate\nand house engineering\nsystems monitoring</p>	slider/slider_3_ieCdpCp.jpg	0	http://127.0.0.1:8000/home/#application2	2019-12-30 10:02:49.298045+03	t	blue	white	#84756E	blue	Slider
4	Comaex for IoT	slider			Hub for\r\nsensors and meters	<p>Hub for\nsensors and meters</p>	slider/slider_4_opfiUZx.jpg	0	http://127.0.0.1:8000/home/#application3	2019-12-30 10:04:18.497742+03	t	white	white	#000324		Slider
5	Supervisor Server Comaex	comaex			&emsp; Comaex server is a supervisor level monitoring and control system for HVAC systems, smart home and Internet facilities. It is a <a onclick="document.getElementById('id01').style.display='block'" style="color:red; cursor: pointer;"> compact device </a>, designed to connect to controllers: <ul style = "font-style: italic;"> <li> light control; </li> <li> control of various drives - blinds or locks for example; </li> <li> data transmission from various sensors - movement , temperature, humidity, pressure, etc .; </li> <li> the transmission of information from resource meters - water, gas, electricity; </li> <li> management of complex engineering equipment -ventilation machines, heat points, boilers and other microprocessor-controlled devices. </li> </ul> &emsp; Data exchange with controllers is carried out using the Modbus RTU protocol, the server can be connected to control devices via cable or wirelessly using <a onclick = "document.getElementById ('id02'). style.display = 'block'" style = "color: red; cursor: pointer;"> radio module </a>. <br><p>&emsp; Entering the device’s device configuration parameters is done manually through the admin panel or by downloading a special xls-file. This file is a data entry template and allows you to start the supervisor server in a matter of minutes. Together with the configuration file, mnemonic diagrams of objects are added to create visualization pages. After entering this data, an automatic object management interface is formed and the server is ready to work. <br>\r\n&emsp; The control interface is available on a computer, smartphone or tablet. At the same time, the device can operate both in the local Wi-Fi network of the object and from the global Internet. <br>\r\n&emsp; The server has a capacity of up to 1000 data points and up to 20 slave devices, which is more than enough for most objects. You can see the real sample in the work here: <a href = "http://comaex.ddns.net" style = "color: red; cursor: pointer;" target = "_ blank"> Comaex Demo </a>. If you don’t have login information, request it via <a href="#contact" style="color:red; cursor: pointer;"> Contacts </a>.</p>	<p>&emsp; Comaex server is a supervisor level monitoring and control system for HVAC systems, smart home and Internet facilities. It is a <a onclick="document.getElementById('id01').style.display='block'" style="color:red; cursor: pointer;"> compact device </a>, designed to connect to controllers: <ul style = "font-style: italic;"> <li> light control; </li> <li> control of various drives - blinds or locks for example; </li> <li> data transmission from various sensors - movement , temperature, humidity, pressure, etc .; </li> <li> the transmission of information from resource meters - water, gas, electricity; </li> <li> management of complex engineering equipment -ventilation machines, heat points, boilers and other microprocessor-controlled devices. </li> </ul> &emsp; Data exchange with controllers is carried out using the Modbus RTU protocol, the server can be connected to control devices via cable or wirelessly using <a onclick = "document.getElementById ('id02'). style.display = 'block'" style = "color: red; cursor: pointer;"> radio module </a>. <br><p>&emsp; Entering the device’s device configuration parameters is done manually through the admin panel or by downloading a special xls-file. This file is a data entry template and allows you to start the supervisor server in a matter of minutes. Together with the configuration file, mnemonic diagrams of objects are added to create visualization pages. After entering this data, an automatic object management interface is formed and the server is ready to work. <br>\n&emsp; The control interface is available on a computer, smartphone or tablet. At the same time, the device can operate both in the local Wi-Fi network of the object and from the global Internet. <br>\n&emsp; The server has a capacity of up to 1000 data points and up to 20 slave devices, which is more than enough for most objects. You can see the real sample in the work here: <a href = "http://comaex.ddns.net" style = "color: red; cursor: pointer;" target = "_ blank"> Comaex Demo </a>. If you don’t have login information, request it via <a href="#contact" style="color:red; cursor: pointer;"> Contacts </a>.</p></p>	no_image.png	0		2019-12-30 10:15:41.173805+03	f					Comaex
6	Specification	specification			&emsp; Comaex has a full range of supervisor functions, such as: control, management, recording, visualization, alarm, reports. <br>\r\n&emsp; The function <a href="#control" style="color:red; cursor: pointer;"> Control </a> is responsible for receiving data, such as temperature, pressure, etc. from remote devices and displaying them on the interface screen. Another important part of the control is receiving signals <a href="#alarms" style="color:red; cursor: pointer;"> Alarms </a> or <a href = "# events" style = "color: red; cursor : pointer; "> Events </a> that occurred with the devices of the object.\r\n&emsp; Function <a href="#management" style="color:red; cursor: pointer;"> Control </a> transmits control signals, for example, enable / disable, as well as data in the form <a href = " #setpoint "style =" color: red; cursor: pointer; "> Setpoints </a>, for example, set the room temperature. <br>\r\n&emsp; In addition to exchanging data with devices, the server records information. These are the sections <a href="#charts" style="color:red; cursor: pointer:"> Charts </a> and <a href="#events" style="color:red; cursor: pointer;"> Archive of events </a> of the interface. In the Charts section, information from control sensors is displayed, and in the Events archive section, events of the control object are recorded. All recorded information can be printed in PDF format. <br>\r\n&emsp; The next important interface function is the <a href="#visualization" style="color:red; cursor: pointer;"> Visualization </a> section, which displays a mnemonic diagram of a device or object to which all control information and elements are displayed facility management. This is a visual and convenient function for instantly assessing the state of an object. <br>\r\n&emsp; To view all the devices and all their parameters, there is a section <a href="#all" style="color:red; cursor: pointer;"> ALL </a> located in the first line of the left menu. <br>\r\n&emsp; And finally, the Alarm function will inform you about an emergency event by mail or SMS message on your mobile phone. It can be any event that needs to be known immediately in order to take action in time. <br>\r\n&emsp; Below is a description of each functional state and screenshots of the interface screens are shown:	<p>&emsp; Comaex has a full range of supervisor functions, such as: control, management, recording, visualization, alarm, reports. <br>\n&emsp; The function <a href="#control" style="color:red; cursor: pointer;"> Control </a> is responsible for receiving data, such as temperature, pressure, etc. from remote devices and displaying them on the interface screen. Another important part of the control is receiving signals <a href="#alarms" style="color:red; cursor: pointer;"> Alarms </a> or <a href = "# events" style = "color: red; cursor : pointer; "> Events </a> that occurred with the devices of the object.\n&emsp; Function <a href="#management" style="color:red; cursor: pointer;"> Control </a> transmits control signals, for example, enable / disable, as well as data in the form <a href = " #setpoint "style =" color: red; cursor: pointer; "> Setpoints </a>, for example, set the room temperature. <br>\n&emsp; In addition to exchanging data with devices, the server records information. These are the sections <a href="#charts" style="color:red; cursor: pointer:"> Charts </a> and <a href="#events" style="color:red; cursor: pointer;"> Archive of events </a> of the interface. In the Charts section, information from control sensors is displayed, and in the Events archive section, events of the control object are recorded. All recorded information can be printed in PDF format. <br>\n&emsp; The next important interface function is the <a href="#visualization" style="color:red; cursor: pointer;"> Visualization </a> section, which displays a mnemonic diagram of a device or object to which all control information and elements are displayed facility management. This is a visual and convenient function for instantly assessing the state of an object. <br>\n&emsp; To view all the devices and all their parameters, there is a section <a href="#all" style="color:red; cursor: pointer;"> ALL </a> located in the first line of the left menu. <br>\n&emsp; And finally, the Alarm function will inform you about an emergency event by mail or SMS message on your mobile phone. It can be any event that needs to be known immediately in order to take action in time. <br>\n&emsp; Below is a description of each functional state and screenshots of the interface screens are shown:</p>	no_image.png	0		2019-12-30 10:32:43.281351+03	f					Specification
7	Monitoring	control	Section Monitoring	An example of the "Parter" screen	&emsp; We begin our introduction to the Comaex server interface using the “Control” page as an example. A menu is located on the left side of the screen, where the first line is a link to the "ALL" page, which displays all the observed parameters of all devices. The following is a list of categories of objects that combine the devices monitored by the server. Colored circles to the left of devices / objects show their current status: green - no accidents, yellow - warning, red - accident.\r\n&emsp; By clicking on the “Control” tab, you will be redirected to the specified page on which a table of values ​​of the monitored parameters is displayed. Information is updated at intervals of 2-5 seconds.	<p>&emsp; We begin our introduction to the Comaex server interface using the “Control” page as an example. A menu is located on the left side of the screen, where the first line is a link to the "ALL" page, which displays all the observed parameters of all devices. The following is a list of categories of objects that combine the devices monitored by the server. Colored circles to the left of devices / objects show their current status: green - no accidents, yellow - warning, red - accident.\n&emsp; By clicking on the “Control” tab, you will be redirected to the specified page on which a table of values ​​of the monitored parameters is displayed. Information is updated at intervals of 2-5 seconds.</p>	control/control_2_013OgBq.jpg	0		2019-12-30 10:38:00.15364+03	f	blue		fa fa-thermometer-full		Specification images
8	Control	management	Section Control	An example of ''Recuperator"screen	&emsp; Selecting the desired device in the left menu and clicking on the "Management" tab will take you to this page. Here you can send the selected command to the “Recuperator” device (highlighted in blue in the device menu) by clicking on the “Change” field.\r\n&emsp; After the command has been confirmed, the status will be reversed.	<p>&emsp; Selecting the desired device in the left menu and clicking on the "Management" tab will take you to this page. Here you can send the selected command to the “Recuperator” device (highlighted in blue in the device menu) by clicking on the “Change” field.\n&emsp; After the command has been confirmed, the status will be reversed.</p>	management/management_1_O2o6hdL.jpg	0		2019-12-30 10:40:18.616935+03	f	blue		fa fa-toggle-on		Specification images
9	Setpoints	setpoint	Section Setpoints	An example of "Parter"screen	&emsp; The “Settings” page is intended for changing the parameters that must be entered into the selected device. Additionally, the page contains a selector for selecting the step for changing the value - “count interval”.\r\n&emsp; After entering a new value, it is necessary to confirm it by clicking on the "confirm" field.	<p>&emsp; The “Settings” page is intended for changing the parameters that must be entered into the selected device. Additionally, the page contains a selector for selecting the step for changing the value - “count interval”.\n&emsp; After entering a new value, it is necessary to confirm it by clicking on the "confirm" field.</p>	setpoint/setpoints_1_jjOvYUx.jpg	0		2019-12-30 11:01:53.513068+03	f	blue		fa fa-sliders		Specification images
10	Alarms	alarms	Section Alarms	An example of "Recuperator" screen	&emsp; By clicking on the “Accidents” tab, you will be redirected to this page. A list of alarms for the selected device / object is displayed here. Their status is updated at intervals of 2 seconds.	<p>&emsp; By clicking on the “Accidents” tab, you will be redirected to this page. A list of alarms for the selected device / object is displayed here. Their status is updated at intervals of 2 seconds.</p>	alarms/alarms_1_zkJ9SkD.jpg	0		2019-12-30 11:03:32.179945+03	f	blue		fa fa-bell-o		Specification images
11	Charts	charts	Section Charts	An example of "Recuperator" screen. Standard output mode.	&emsp; The Charts page displays a graph of the selected device / object parameter. The page has an extensive interface in the form of numerous settings and options.\r\n&emsp; This screenshot shows the standard output of the graph of the parameter “Flow temperature, C” as a line, 20 data points with an interval of 10 seconds.	<p>&emsp; The Charts page displays a graph of the selected device / object parameter. The page has an extensive interface in the form of numerous settings and options.\n&emsp; This screenshot shows the standard output of the graph of the parameter “Flow temperature, C” as a line, 20 data points with an interval of 10 seconds.</p>	charts/charts_1_Rold3SM.jpg	0		2019-12-30 11:06:18.103392+03	f	blue		fa fa-area-chart		Specification images
12	Event Archive	events	Section Event Archive	An example of "Recuperator" screen.	&emsp; Event Archive page shows alarms and events that occurred with the selected object / device. Accidents are indicated by the first letters of the index “AL”, events - “EV”. The page shown on the screen can be printed, for which you need to click the "PDF" button.	<p>&emsp; Event Archive page shows alarms and events that occurred with the selected object / device. Accidents are indicated by the first letters of the index “AL”, events - “EV”. The page shown on the screen can be printed, for which you need to click the "PDF" button.</p>	events/events_1_Plo8R5B.jpg	0		2019-12-30 11:09:08.132206+03	f	blue		fa fa-archive		Specification images
13	Visualization	visualization	Section Visualization	An example of "Recuperator" screen.	&emsp; Page "Visualization" displays a schematic image of a device / object with all the necessary values ​​and states. Such generalized information is very convenient for monitoring and debugging. Below the image field is the accident area - where in case of an accident a message appears, then the control field follows - here you can turn on / off some state, and finally the settings field closes the page - here you can send a command with a new value to the device.	<p>&emsp; Page "Visualization" displays a schematic image of a device / object with all the necessary values ​​and states. Such generalized information is very convenient for monitoring and debugging. Below the image field is the accident area - where in case of an accident a message appears, then the control field follows - here you can turn on / off some state, and finally the settings field closes the page - here you can send a command with a new value to the device.</p>	visualization/vizualization_1_Wl95oge.jpg	0		2019-12-30 11:14:16.371533+03	f	blue		fa fa-eye		Specification images
14	All	all	Section All		&emsp; The “ALL” page displays a complete list of all devices / objects in the form of a table of parameters of all values ​​and states. The order of output of categories and their objects / devices corresponds to the order of the menu. The data update interval is 2-5 seconds.\r\n&emsp; This screenshot shows only the beginning of the ALL page.	<p>&emsp; The “ALL” page displays a complete list of all devices / objects in the form of a table of parameters of all values ​​and states. The order of output of categories and their objects / devices corresponds to the order of the menu. The data update interval is 2-5 seconds.\n&emsp; This screenshot shows only the beginning of the ALL page.</p>	all/all_1_HLCe82p.jpg	0		2019-12-30 11:15:45.342533+03	f	blue		fa fa-list-alt		Specification images
15	Application	application			&emsp; The Comaex server is a supervisor system, that is, a device that connects to equipment controllers to perform supervisory functions and expand their capabilities, including: <ul style = "font-style: italic;"> <li> remote monitoring and control devices, both in the local zone and far beyond its borders via the Internet; </li> <li> recording information; </li> <li> reporting; </li> <li> signaling of states; </li> <li> visualization of objects; </li> <li> grouping devices into groups and categories. </li> </ul> &emsp; Advantages of the Comae server x has its compactness, high performance, low price, ease of maintenance and quick commissioning.\r\n&emsp; You can watch a real sample in work here: <a href = "http://comaex.ddns.net" style = "color: red; cursor: pointer;" target = "_ blank"> Comaex Demo </a>. If you don’t have login information, request it via <a href="#contact" style="color:red; cursor: pointer;"> Contacts </a>.\r\n&emsp; Common Comaex Server Application Areas:	<p>&emsp; The Comaex server is a supervisor system, that is, a device that connects to equipment controllers to perform supervisory functions and expand their capabilities, including: <ul style = "font-style: italic;"> <li> remote monitoring and control devices, both in the local zone and far beyond its borders via the Internet; </li> <li> recording information; </li> <li> reporting; </li> <li> signaling of states; </li> <li> visualization of objects; </li> <li> grouping devices into groups and categories. </li> </ul> &emsp; Advantages of the Comae server x has its compactness, high performance, low price, ease of maintenance and quick commissioning.\n&emsp; You can watch a real sample in work here: <a href = "http://comaex.ddns.net" style = "color: red; cursor: pointer;" target = "_ blank"> Comaex Demo </a>. If you don’t have login information, request it via <a href="#contact" style="color:red; cursor: pointer;"> Contacts </a>.\n&emsp; Common Comaex Server Application Areas:</p>	no_image.png	0		2019-12-30 11:18:09.945767+03	f					Application
16	HVAC Systems	application-images			&emsp; This is the direction of climate systems - heating, ventilation, air conditioning. A very popular area for the application of supervisor technologies, since any commercial or industrial facility from the basement to the roof is equipped with HVAC equipment that needs to be monitored. This technology is called object scheduling. The Comaex server is perfectly suited for this purpose, since any HVAC equipment has controllers with its standard software, for a lot of which Comaex has ready-made templates and visualization mimics.	<p>&emsp; This is the direction of climate systems - heating, ventilation, air conditioning. A very popular area for the application of supervisor technologies, since any commercial or industrial facility from the basement to the roof is equipped with HVAC equipment that needs to be monitored. This technology is called object scheduling. The Comaex server is perfectly suited for this purpose, since any HVAC equipment has controllers with its standard software, for a lot of which Comaex has ready-made templates and visualization mimics.</p>	application-images/app1_BHFsO4n.jpg	0		2019-12-30 11:19:16.871127+03	f					Application images
17	Smart Home	application-images			&emsp; Monitoring security, climate and the ability to manage the engineering systems of a dwelling has recently become increasingly interesting. The Comaex server is able to fully provide this feature, since it can exchange data with any controllers. In addition, ready-made configuration templates for complex devices, such as ventilation and heating equipment, as well as mimic diagrams for them are already available in the server repositories. This greatly facilitates and accelerates the creation of a smart home.	<p>&emsp; Monitoring security, climate and the ability to manage the engineering systems of a dwelling has recently become increasingly interesting. The Comaex server is able to fully provide this feature, since it can exchange data with any controllers. In addition, ready-made configuration templates for complex devices, such as ventilation and heating equipment, as well as mimic diagrams for them are already available in the server repositories. This greatly facilitates and accelerates the creation of a smart home.</p>	application-images/app2_qGFHEWq.jpg	0		2019-12-30 11:20:18.848549+03	f					Application images
18	Internet of Things	application-images			&emsp; A new direction in the digital world, where the main idea is to provide any electronic device with access to the global Internet. The technology finds practical application in the fields of obtaining data from various sensors and counters. It has great growth potential, but is constrained by a natural obstacle in the form of exhaustion of IP addresses of ipv4 protocol. Therefore, the transfer of data to IoT devices is difficult, since for this each device must have its own individual IP address. Comaex can solve this problem because it is physically a hub - it has one external IP address interacting with hundreds of internal devices in both directions.	<p>&emsp; A new direction in the digital world, where the main idea is to provide any electronic device with access to the global Internet. The technology finds practical application in the fields of obtaining data from various sensors and counters. It has great growth potential, but is constrained by a natural obstacle in the form of exhaustion of IP addresses of ipv4 protocol. Therefore, the transfer of data to IoT devices is difficult, since for this each device must have its own individual IP address. Comaex can solve this problem because it is physically a hub - it has one external IP address interacting with hundreds of internal devices in both directions.</p>	application-images/app3_CCwrwpi.jpg	0		2019-12-30 11:21:24.185928+03	f					Application images
\.


--
-- Name: base_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.base_base_id_seq', 18, true);


--
-- Data for Name: base_image; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.base_image (id, image, slug, title, sentence, urllink, description, desc_html, data1, data2, name_id) FROM stdin;
1	comaex/Mini_PC_1_2VqXVDK.jpg	comaex	Supervisor Server Comaex	Specifications:		<ul><li>Processor: Intel Dual Core i5-4200Y</li><li>RAM: RAM4GB</li><li>ROM: SSD30GB</li><li>Interface: 4 * USB3.0, 2 * USB2.0, 1000Mbps BaseT LAN, 802.11 b/g/n WiFi</li><li>Case type: aluminum heat sink</li><li>Dimensions: 133x124x40 mm</li></ul>	<ul><li>Processor: Intel Dual Core i5-4200Y</li><li>RAM: RAM4GB</li><li>ROM: SSD30GB</li><li>Interface: 4 * USB3.0, 2 * USB2.0, 1000Mbps BaseT LAN, 802.11 b/g/n WiFi</li><li>Case type: aluminum heat sink</li><li>Dimensions: 133x124x40 mm</li></ul>			5
2	comaex/E800_DTU.png	comaex	Radio module E800-DTU	Specifications:		<ul><li>Operating frequency: 433 MHz</li><li>Transmit Power: 30 dBm</li><li>Transfer rate: 1.2-115.2 kbps</li><li>antenna type: SMA-K</li><li>comm interface: RS232 / RS485</li><li>communication range: 2500 m</li><li>dimensions: 66x66x21 mm</li></ul>	<ul><li>Operating frequency: 433 MHz</li><li>Transmit Power: 30 dBm</li><li>Transfer rate: 1.2-115.2 kbps</li><li>antenna type: SMA-K</li><li>comm interface: RS232 / RS485</li><li>communication range: 2500 m</li><li>dimensions: 66x66x21 mm</li></ul>			5
3	charts/charts_2_T9TZa2n.jpg	charts		An example of "Recuperator" screen. The output mode of the table of values.		&emsp; This screenshot shows the output of the table of values ​​of the selected parameter. The output of the table is possible both in static mode and in dynamic mode “REAL TIME”.	<p>&emsp; This screenshot shows the output of the table of values ​​of the selected parameter. The output of the table is possible both in static mode and in dynamic mode “REAL TIME”.</p>			11
4	charts/charts_3_2fKl3WM.jpg	charts		An example of "Recuperator" screen. Chart overlay mode.		&emsp; In this screenshot, three graphs are displayed in the overlay mode. You can add up to 2 additional parameters to the main schedule only if the recording intervals are equal.	<p>&emsp; In this screenshot, three graphs are displayed in the overlay mode. You can add up to 2 additional parameters to the main schedule only if the recording intervals are equal.</p>			11
5	visualization/vizualization_3_FLQYROZ.jpg	visualization		An example of "Recuperator" screen.		&emsp; This screenshot shows an example of the “Parterre” object with the following functionality:\r\n&emsp; &emsp; - temperature, humidity, electricity, gas, cold and hot water meters (value),\r\n&emsp; &emsp; - motion sensors, smoke sensors, fire (event),\r\n&emsp; &emsp; - blinds, door locks, lighting (control),\r\n&emsp; &emsp; - temperature, humidity (settings)	<p>&emsp; This screenshot shows an example of the “Parterre” object with the following functionality:\n&emsp; &emsp; - temperature, humidity, electricity, gas, cold and hot water meters (value),\n&emsp; &emsp; - motion sensors, smoke sensors, fire (event),\n&emsp; &emsp; - blinds, door locks, lighting (control),\n&emsp; &emsp; - temperature, humidity (settings)</p>			13
\.


--
-- Name: base_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.base_image_id_seq', 5, true);


--
-- Data for Name: base_menu; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.base_menu (id, title, slug, mark, fafa, color) FROM stdin;
1	Comaex	#about	0		
2	Specification	#specification	0		
3	Application	application	0		
4	Info	info	0		
\.


--
-- Name: base_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.base_menu_id_seq', 4, true);


--
-- Data for Name: base_submenu; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.base_submenu (id, subtitle, subslug, submark, subfafa, subcolor, submenu_id) FROM stdin;
1	Slider	#slider	0			Comaex
2	Comaex	#about	0			Comaex
3	Specification	#specification	0			Specification
4	Specification images	#specification_images	0			Specification
5	Application	#application	1			Application
6	Application images	#application_images	0			Application
7	Portfolio	portfolio	0			Application
8	Cost	price	0			Application
9	Cost images	price_images	0			Application
10	Contact	#contact	1			Info
11	News	#news	0			Info
\.


--
-- Name: base_submenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.base_submenu_id_seq', 11, true);


--
-- Data for Name: clients_clients; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.clients_clients (uuid, company, slug, country, address, email, email2, phone, about, area, category, language, persons, created, last_post, enable_mailing, interested, preorder, counter, count, bid, error_mailing, file, filepath, flag) FROM stdin;
\.


--
-- Data for Name: clients_importduplication; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.clients_importduplication (id, company, cause, created, flag) FROM stdin;
\.


--
-- Name: clients_importduplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.clients_importduplication_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	base	image
8	base	base
9	base	submenu
10	base	menu
11	interaction	contact
12	interaction	correspondence
13	clients	importduplication
14	clients	clients
15	promotion	image
16	promotion	promotion
17	scheduler	scheduler
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-29 21:21:27.082265+03
2	auth	0001_initial	2019-12-29 21:21:28.361917+03
3	admin	0001_initial	2019-12-29 21:21:28.704335+03
4	admin	0002_logentry_remove_auto_add	2019-12-29 21:21:28.737329+03
5	contenttypes	0002_remove_content_type_name	2019-12-29 21:21:28.790498+03
6	auth	0002_alter_permission_name_max_length	2019-12-29 21:21:28.823488+03
7	auth	0003_alter_user_email_max_length	2019-12-29 21:21:28.857318+03
8	auth	0004_alter_user_username_opts	2019-12-29 21:21:28.87974+03
9	auth	0005_alter_user_last_login_null	2019-12-29 21:21:28.912477+03
10	auth	0006_require_contenttypes_0002	2019-12-29 21:21:28.923637+03
11	auth	0007_alter_validators_add_error_messages	2019-12-29 21:21:28.9558+03
12	auth	0008_alter_user_username_max_length	2019-12-29 21:21:29.067378+03
13	auth	0009_alter_user_last_name_max_length	2019-12-29 21:21:29.110132+03
14	base	0001_initial	2019-12-29 21:21:31.018416+03
15	clients	0001_initial	2019-12-29 21:21:31.547249+03
16	interaction	0001_initial	2019-12-29 21:21:31.987204+03
17	promotion	0001_initial	2019-12-29 21:21:32.704525+03
18	scheduler	0001_initial	2019-12-29 21:21:32.937083+03
19	sessions	0001_initial	2019-12-29 21:21:33.224232+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: interaction_contact; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.interaction_contact (id, fullname, email, phone, content, subject, ipaddr, "timestamp", flag) FROM stdin;
\.


--
-- Name: interaction_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.interaction_contact_id_seq', 1, false);


--
-- Data for Name: interaction_correspondence; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.interaction_correspondence (id, name, email, phone, content, content_html, theme, subject, feedback, "timestamp", action, flag, person_id_id) FROM stdin;
\.


--
-- Name: interaction_correspondence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.interaction_correspondence_id_seq', 1, false);


--
-- Data for Name: promotion_image; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.promotion_image (id, image, slug, title, sentence, urllink, description, desc_html, data1, data2, name_id) FROM stdin;
\.


--
-- Name: promotion_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.promotion_image_id_seq', 1, false);


--
-- Data for Name: promotion_promotion; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.promotion_promotion (id, title, slug, subtitle, sentence, description, desc_html, image, filenum, urllink, "timestamp", flag, data1, data2, data3, data4, category, language) FROM stdin;
\.


--
-- Name: promotion_promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.promotion_promotion_id_seq', 1, false);


--
-- Data for Name: scheduler_scheduler; Type: TABLE DATA; Schema: public; Owner: admin_en
--

COPY public.scheduler_scheduler (id, category, tick, counter, event, processing) FROM stdin;
\.


--
-- Name: scheduler_scheduler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_en
--

SELECT pg_catalog.setval('public.scheduler_scheduler_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: base_base_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_base
    ADD CONSTRAINT base_base_pkey PRIMARY KEY (id);


--
-- Name: base_image_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_image
    ADD CONSTRAINT base_image_pkey PRIMARY KEY (id);


--
-- Name: base_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_menu
    ADD CONSTRAINT base_menu_pkey PRIMARY KEY (id);


--
-- Name: base_menu_slug_key; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_menu
    ADD CONSTRAINT base_menu_slug_key UNIQUE (slug);


--
-- Name: base_menu_title_key; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_menu
    ADD CONSTRAINT base_menu_title_key UNIQUE (title);


--
-- Name: base_submenu_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_submenu
    ADD CONSTRAINT base_submenu_pkey PRIMARY KEY (id);


--
-- Name: base_submenu_subslug_key; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_submenu
    ADD CONSTRAINT base_submenu_subslug_key UNIQUE (subslug);


--
-- Name: base_submenu_subtitle_key; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_submenu
    ADD CONSTRAINT base_submenu_subtitle_key UNIQUE (subtitle);


--
-- Name: clients_clients_email_key; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.clients_clients
    ADD CONSTRAINT clients_clients_email_key UNIQUE (email);


--
-- Name: clients_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.clients_clients
    ADD CONSTRAINT clients_clients_pkey PRIMARY KEY (uuid);


--
-- Name: clients_importduplication_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.clients_importduplication
    ADD CONSTRAINT clients_importduplication_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: interaction_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.interaction_contact
    ADD CONSTRAINT interaction_contact_pkey PRIMARY KEY (id);


--
-- Name: interaction_correspondence_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.interaction_correspondence
    ADD CONSTRAINT interaction_correspondence_pkey PRIMARY KEY (id);


--
-- Name: promotion_image_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.promotion_image
    ADD CONSTRAINT promotion_image_pkey PRIMARY KEY (id);


--
-- Name: promotion_promotion_category_language_aea87d58_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.promotion_promotion
    ADD CONSTRAINT promotion_promotion_category_language_aea87d58_uniq UNIQUE (category, language);


--
-- Name: promotion_promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.promotion_promotion
    ADD CONSTRAINT promotion_promotion_pkey PRIMARY KEY (id);


--
-- Name: scheduler_scheduler_category_key; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.scheduler_scheduler
    ADD CONSTRAINT scheduler_scheduler_category_key UNIQUE (category);


--
-- Name: scheduler_scheduler_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.scheduler_scheduler
    ADD CONSTRAINT scheduler_scheduler_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: base_base_menu_id_a95e2661; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_base_menu_id_a95e2661 ON public.base_base USING btree (menu_id);


--
-- Name: base_base_menu_id_a95e2661_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_base_menu_id_a95e2661_like ON public.base_base USING btree (menu_id varchar_pattern_ops);


--
-- Name: base_base_slug_ea4374f1; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_base_slug_ea4374f1 ON public.base_base USING btree (slug);


--
-- Name: base_base_slug_ea4374f1_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_base_slug_ea4374f1_like ON public.base_base USING btree (slug varchar_pattern_ops);


--
-- Name: base_image_name_id_7bbf23b4; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_image_name_id_7bbf23b4 ON public.base_image USING btree (name_id);


--
-- Name: base_image_slug_295384b2; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_image_slug_295384b2 ON public.base_image USING btree (slug);


--
-- Name: base_image_slug_295384b2_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_image_slug_295384b2_like ON public.base_image USING btree (slug varchar_pattern_ops);


--
-- Name: base_menu_slug_e20cad49_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_menu_slug_e20cad49_like ON public.base_menu USING btree (slug varchar_pattern_ops);


--
-- Name: base_menu_title_e1d8c594_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_menu_title_e1d8c594_like ON public.base_menu USING btree (title varchar_pattern_ops);


--
-- Name: base_submenu_submenu_id_67f7b58f; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_submenu_submenu_id_67f7b58f ON public.base_submenu USING btree (submenu_id);


--
-- Name: base_submenu_submenu_id_67f7b58f_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_submenu_submenu_id_67f7b58f_like ON public.base_submenu USING btree (submenu_id varchar_pattern_ops);


--
-- Name: base_submenu_subslug_d12257df_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_submenu_subslug_d12257df_like ON public.base_submenu USING btree (subslug varchar_pattern_ops);


--
-- Name: base_submenu_subtitle_78d78541_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX base_submenu_subtitle_78d78541_like ON public.base_submenu USING btree (subtitle varchar_pattern_ops);


--
-- Name: clients_clients_email_dcc1d15b_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX clients_clients_email_dcc1d15b_like ON public.clients_clients USING btree (email varchar_pattern_ops);


--
-- Name: clients_clients_slug_d653c936; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX clients_clients_slug_d653c936 ON public.clients_clients USING btree (slug);


--
-- Name: clients_clients_slug_d653c936_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX clients_clients_slug_d653c936_like ON public.clients_clients USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: interaction_correspondence_person_id_id_d539749c; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX interaction_correspondence_person_id_id_d539749c ON public.interaction_correspondence USING btree (person_id_id);


--
-- Name: promotion_image_name_id_b68956b5; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX promotion_image_name_id_b68956b5 ON public.promotion_image USING btree (name_id);


--
-- Name: promotion_image_slug_75191e9e; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX promotion_image_slug_75191e9e ON public.promotion_image USING btree (slug);


--
-- Name: promotion_image_slug_75191e9e_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX promotion_image_slug_75191e9e_like ON public.promotion_image USING btree (slug varchar_pattern_ops);


--
-- Name: promotion_promotion_slug_9cd58d82; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX promotion_promotion_slug_9cd58d82 ON public.promotion_promotion USING btree (slug);


--
-- Name: promotion_promotion_slug_9cd58d82_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX promotion_promotion_slug_9cd58d82_like ON public.promotion_promotion USING btree (slug varchar_pattern_ops);


--
-- Name: scheduler_scheduler_category_c74efccc_like; Type: INDEX; Schema: public; Owner: admin_en
--

CREATE INDEX scheduler_scheduler_category_c74efccc_like ON public.scheduler_scheduler USING btree (category varchar_pattern_ops);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_base_menu_id_a95e2661_fk_base_submenu_subtitle; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_base
    ADD CONSTRAINT base_base_menu_id_a95e2661_fk_base_submenu_subtitle FOREIGN KEY (menu_id) REFERENCES public.base_submenu(subtitle) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_image_name_id_7bbf23b4_fk_base_base_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_image
    ADD CONSTRAINT base_image_name_id_7bbf23b4_fk_base_base_id FOREIGN KEY (name_id) REFERENCES public.base_base(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_submenu_submenu_id_67f7b58f_fk_base_menu_title; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.base_submenu
    ADD CONSTRAINT base_submenu_submenu_id_67f7b58f_fk_base_menu_title FOREIGN KEY (submenu_id) REFERENCES public.base_menu(title) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: interaction_correspo_person_id_id_d539749c_fk_interacti; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
--

ALTER TABLE ONLY public.interaction_correspondence
    ADD CONSTRAINT interaction_correspo_person_id_id_d539749c_fk_interacti FOREIGN KEY (person_id_id) REFERENCES public.interaction_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: promotion_image_name_id_b68956b5_fk_promotion_promotion_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_en
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

