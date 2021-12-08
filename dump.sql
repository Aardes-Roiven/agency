--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE db;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:PMu3+RG0hNOYhhFf5rlU/A==$jVAHCbnp073sgEGu8y8sfhAqR0vjnN63Kd0tJKZxAFY=:xtFsrYJrnxczFif7YHcJJDdsOogQxc3Ap68mtl2r8mA=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Debian 14.0-1.pgdg110+1)
-- Dumped by pg_dump version 14.0 (Debian 14.0-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Debian 14.0-1.pgdg110+1)
-- Dumped by pg_dump version 14.0 (Debian 14.0-1.pgdg110+1)

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
-- Name: db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE db OWNER TO postgres;

\connect db

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    name character varying NOT NULL,
    status character varying DEFAULT 'обычный'::character varying NOT NULL,
    number character(12) NOT NULL,
    email character varying
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: deal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deal (
    id integer NOT NULL,
    real_estate_obj_id integer NOT NULL,
    property_dev_id integer NOT NULL,
    client_id integer NOT NULL,
    type character varying NOT NULL,
    status character varying NOT NULL,
    contract_number character varying NOT NULL
);


ALTER TABLE public.deal OWNER TO postgres;

--
-- Name: deal_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deal_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_client_id_seq OWNER TO postgres;

--
-- Name: deal_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deal_client_id_seq OWNED BY public.deal.client_id;


--
-- Name: deal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_id_seq OWNER TO postgres;

--
-- Name: deal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deal_id_seq OWNED BY public.deal.id;


--
-- Name: deal_property_dev_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deal_property_dev_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_property_dev_id_seq OWNER TO postgres;

--
-- Name: deal_property_dev_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deal_property_dev_id_seq OWNED BY public.deal.property_dev_id;


--
-- Name: deal_real_estate_obj_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deal_real_estate_obj_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_real_estate_obj_id_seq OWNER TO postgres;

--
-- Name: deal_real_estate_obj_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deal_real_estate_obj_id_seq OWNED BY public.deal.real_estate_obj_id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying NOT NULL,
    specialization character varying NOT NULL,
    number character(12) NOT NULL,
    email character varying NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    senior_id integer NOT NULL,
    position_id smallint NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- Name: employee_position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_position_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_position_id_seq OWNER TO postgres;

--
-- Name: employee_position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_position_id_seq OWNED BY public.employee.position_id;


--
-- Name: employee_senior_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_senior_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_senior_id_seq OWNER TO postgres;

--
-- Name: employee_senior_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_senior_id_seq OWNED BY public.employee.senior_id;


--
-- Name: mtm_employee_deal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mtm_employee_deal (
    deal_id integer NOT NULL,
    employee_id integer NOT NULL
);


ALTER TABLE public.mtm_employee_deal OWNER TO postgres;

--
-- Name: mtm_employee_deal_deal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mtm_employee_deal_deal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mtm_employee_deal_deal_id_seq OWNER TO postgres;

--
-- Name: mtm_employee_deal_deal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mtm_employee_deal_deal_id_seq OWNED BY public.mtm_employee_deal.deal_id;


--
-- Name: mtm_employee_deal_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mtm_employee_deal_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mtm_employee_deal_employee_id_seq OWNER TO postgres;

--
-- Name: mtm_employee_deal_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mtm_employee_deal_employee_id_seq OWNED BY public.mtm_employee_deal.employee_id;


--
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    id smallint NOT NULL,
    name character varying NOT NULL,
    access_code smallint NOT NULL
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- Name: position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.position_id_seq OWNER TO postgres;

--
-- Name: position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_id_seq OWNED BY public."position".id;


--
-- Name: property_dev; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_dev (
    id integer NOT NULL,
    name character varying NOT NULL,
    number character(12) NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.property_dev OWNER TO postgres;

--
-- Name: property_dev_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.property_dev_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.property_dev_id_seq OWNER TO postgres;

--
-- Name: property_dev_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.property_dev_id_seq OWNED BY public.property_dev.id;


--
-- Name: real_estate_building; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.real_estate_building (
    id integer NOT NULL,
    address character varying NOT NULL,
    complex_id integer NOT NULL,
    floor_count smallint NOT NULL
);


ALTER TABLE public.real_estate_building OWNER TO postgres;

--
-- Name: real_estate_building_complex_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.real_estate_building_complex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.real_estate_building_complex_id_seq OWNER TO postgres;

--
-- Name: real_estate_building_complex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.real_estate_building_complex_id_seq OWNED BY public.real_estate_building.complex_id;


--
-- Name: real_estate_building_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.real_estate_building_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.real_estate_building_id_seq OWNER TO postgres;

--
-- Name: real_estate_building_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.real_estate_building_id_seq OWNED BY public.real_estate_building.id;


--
-- Name: real_estate_complex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.real_estate_complex (
    id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL,
    comfort_class character varying NOT NULL
);


ALTER TABLE public.real_estate_complex OWNER TO postgres;

--
-- Name: real_estate_complex_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.real_estate_complex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.real_estate_complex_id_seq OWNER TO postgres;

--
-- Name: real_estate_complex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.real_estate_complex_id_seq OWNED BY public.real_estate_complex.id;


--
-- Name: real_estate_object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.real_estate_object (
    id integer NOT NULL,
    building_id integer NOT NULL,
    local_address character varying NOT NULL,
    places smallint NOT NULL,
    price money NOT NULL,
    area integer NOT NULL,
    floor smallint NOT NULL,
    type character varying NOT NULL,
    estate_type character varying NOT NULL
);


ALTER TABLE public.real_estate_object OWNER TO postgres;

--
-- Name: real_estate_object_building_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.real_estate_object_building_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.real_estate_object_building_id_seq OWNER TO postgres;

--
-- Name: real_estate_object_building_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.real_estate_object_building_id_seq OWNED BY public.real_estate_object.building_id;


--
-- Name: real_estate_object_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.real_estate_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.real_estate_object_id_seq OWNER TO postgres;

--
-- Name: real_estate_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.real_estate_object_id_seq OWNED BY public.real_estate_object.id;


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: deal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal ALTER COLUMN id SET DEFAULT nextval('public.deal_id_seq'::regclass);


--
-- Name: deal real_estate_obj_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal ALTER COLUMN real_estate_obj_id SET DEFAULT nextval('public.deal_real_estate_obj_id_seq'::regclass);


--
-- Name: deal property_dev_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal ALTER COLUMN property_dev_id SET DEFAULT nextval('public.deal_property_dev_id_seq'::regclass);


--
-- Name: deal client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal ALTER COLUMN client_id SET DEFAULT nextval('public.deal_client_id_seq'::regclass);


--
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: employee senior_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN senior_id SET DEFAULT nextval('public.employee_senior_id_seq'::regclass);


--
-- Name: employee position_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN position_id SET DEFAULT nextval('public.employee_position_id_seq'::regclass);


--
-- Name: mtm_employee_deal deal_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mtm_employee_deal ALTER COLUMN deal_id SET DEFAULT nextval('public.mtm_employee_deal_deal_id_seq'::regclass);


--
-- Name: mtm_employee_deal employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mtm_employee_deal ALTER COLUMN employee_id SET DEFAULT nextval('public.mtm_employee_deal_employee_id_seq'::regclass);


--
-- Name: position id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position" ALTER COLUMN id SET DEFAULT nextval('public.position_id_seq'::regclass);


--
-- Name: property_dev id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_dev ALTER COLUMN id SET DEFAULT nextval('public.property_dev_id_seq'::regclass);


--
-- Name: real_estate_building id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_building ALTER COLUMN id SET DEFAULT nextval('public.real_estate_building_id_seq'::regclass);


--
-- Name: real_estate_building complex_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_building ALTER COLUMN complex_id SET DEFAULT nextval('public.real_estate_building_complex_id_seq'::regclass);


--
-- Name: real_estate_complex id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_complex ALTER COLUMN id SET DEFAULT nextval('public.real_estate_complex_id_seq'::regclass);


--
-- Name: real_estate_object id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_object ALTER COLUMN id SET DEFAULT nextval('public.real_estate_object_id_seq'::regclass);


--
-- Name: real_estate_object building_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_object ALTER COLUMN building_id SET DEFAULT nextval('public.real_estate_object_building_id_seq'::regclass);


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, name, status, number, email) FROM stdin;
\.


--
-- Data for Name: deal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deal (id, real_estate_obj_id, property_dev_id, client_id, type, status, contract_number) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, name, specialization, number, email, login, password, senior_id, position_id) FROM stdin;
\.


--
-- Data for Name: mtm_employee_deal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mtm_employee_deal (deal_id, employee_id) FROM stdin;
\.


--
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."position" (id, name, access_code) FROM stdin;
\.


--
-- Data for Name: property_dev; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_dev (id, name, number, email) FROM stdin;
\.


--
-- Data for Name: real_estate_building; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_building (id, address, complex_id, floor_count) FROM stdin;
\.


--
-- Data for Name: real_estate_complex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_complex (id, name, type, comfort_class) FROM stdin;
\.


--
-- Data for Name: real_estate_object; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_object (id, building_id, local_address, places, price, area, floor, type, estate_type) FROM stdin;
\.


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 1, false);


--
-- Name: deal_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deal_client_id_seq', 1, false);


--
-- Name: deal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deal_id_seq', 1, false);


--
-- Name: deal_property_dev_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deal_property_dev_id_seq', 1, false);


--
-- Name: deal_real_estate_obj_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deal_real_estate_obj_id_seq', 1, false);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 1, false);


--
-- Name: employee_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_position_id_seq', 1, false);


--
-- Name: employee_senior_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_senior_id_seq', 1, false);


--
-- Name: mtm_employee_deal_deal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mtm_employee_deal_deal_id_seq', 1, false);


--
-- Name: mtm_employee_deal_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mtm_employee_deal_employee_id_seq', 1, false);


--
-- Name: position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_id_seq', 1, false);


--
-- Name: property_dev_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_dev_id_seq', 1, false);


--
-- Name: real_estate_building_complex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.real_estate_building_complex_id_seq', 1, false);


--
-- Name: real_estate_building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.real_estate_building_id_seq', 1, false);


--
-- Name: real_estate_complex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.real_estate_complex_id_seq', 1, false);


--
-- Name: real_estate_object_building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.real_estate_object_building_id_seq', 1, false);


--
-- Name: real_estate_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.real_estate_object_id_seq', 1, false);


--
-- Name: real_estate_building building_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_building
    ADD CONSTRAINT building_id PRIMARY KEY (id);


--
-- Name: client client_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_email_key UNIQUE (email);


--
-- Name: client client_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_key PRIMARY KEY (id);


--
-- Name: client client_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_number_key UNIQUE (number);


--
-- Name: real_estate_complex complex_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_complex
    ADD CONSTRAINT complex_id PRIMARY KEY (id);


--
-- Name: real_estate_complex complex_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_complex
    ADD CONSTRAINT complex_name_key UNIQUE (name);


--
-- Name: deal deal_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT deal_key PRIMARY KEY (id);


--
-- Name: property_dev dev_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_dev
    ADD CONSTRAINT dev_email_key UNIQUE (email);


--
-- Name: property_dev dev_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_dev
    ADD CONSTRAINT dev_key PRIMARY KEY (id);


--
-- Name: property_dev dev_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_dev
    ADD CONSTRAINT dev_number_key UNIQUE (number);


--
-- Name: mtm_employee_deal employee_deal_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mtm_employee_deal
    ADD CONSTRAINT employee_deal_id PRIMARY KEY (deal_id, employee_id);


--
-- Name: employee employee_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_email_key UNIQUE (email);


--
-- Name: employee employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_id PRIMARY KEY (id);


--
-- Name: employee employee_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_login_key UNIQUE (login);


--
-- Name: employee employee_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_number_key UNIQUE (number);


--
-- Name: real_estate_object object_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_object
    ADD CONSTRAINT object_id PRIMARY KEY (id);


--
-- Name: position position_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_id PRIMARY KEY (id);


--
-- Name: deal deal_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT deal_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id) ON DELETE CASCADE;


--
-- Name: deal deal_property_dev_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT deal_property_dev_id_fkey FOREIGN KEY (property_dev_id) REFERENCES public.property_dev(id) ON DELETE CASCADE;


--
-- Name: deal deal_real_estate_obj_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT deal_real_estate_obj_id_fkey FOREIGN KEY (real_estate_obj_id) REFERENCES public.real_estate_object(id) ON DELETE CASCADE;


--
-- Name: employee employee_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_position_id_fkey FOREIGN KEY (position_id) REFERENCES public."position"(id) ON DELETE SET NULL;


--
-- Name: employee employee_senior_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_senior_id_fkey FOREIGN KEY (senior_id) REFERENCES public.employee(id) ON DELETE SET NULL;


--
-- Name: mtm_employee_deal mtm_employee_deal_deal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mtm_employee_deal
    ADD CONSTRAINT mtm_employee_deal_deal_id_fkey FOREIGN KEY (deal_id) REFERENCES public.deal(id) ON DELETE CASCADE;


--
-- Name: mtm_employee_deal mtm_employee_deal_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mtm_employee_deal
    ADD CONSTRAINT mtm_employee_deal_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON DELETE CASCADE;


--
-- Name: real_estate_building real_estate_building_complex_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_building
    ADD CONSTRAINT real_estate_building_complex_id_fkey FOREIGN KEY (complex_id) REFERENCES public.real_estate_complex(id) ON DELETE CASCADE;


--
-- Name: real_estate_object real_estate_object_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_object
    ADD CONSTRAINT real_estate_object_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.real_estate_building(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Debian 14.0-1.pgdg110+1)
-- Dumped by pg_dump version 14.0 (Debian 14.0-1.pgdg110+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: real_estate_complex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.real_estate_complex (
    id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL,
    comfort_class character varying NOT NULL
);


ALTER TABLE public.real_estate_complex OWNER TO postgres;

--
-- Name: real_estate_complex_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.real_estate_complex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.real_estate_complex_id_seq OWNER TO postgres;

--
-- Name: real_estate_complex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.real_estate_complex_id_seq OWNED BY public.real_estate_complex.id;


--
-- Name: real_estate_complex id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_complex ALTER COLUMN id SET DEFAULT nextval('public.real_estate_complex_id_seq'::regclass);


--
-- Data for Name: real_estate_complex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_complex (id, name, type, comfort_class) FROM stdin;
\.


--
-- Name: real_estate_complex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.real_estate_complex_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

