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
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying NOT NULL,
    specialization character varying,
    number character(12) NOT NULL,
    email character varying NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    senior_id integer,
    position_id integer
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
-- Name: mtm_employee_deal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mtm_employee_deal (
    deal_id integer NOT NULL,
    employee_id integer NOT NULL
);


ALTER TABLE public.mtm_employee_deal OWNER TO postgres;

--
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    id integer NOT NULL,
    name character varying NOT NULL,
    access_code smallint NOT NULL
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- Name: position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_id_seq
    AS integer
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
    complex_id integer,
    floor_count smallint NOT NULL,
    dev_id integer NOT NULL
);


ALTER TABLE public.real_estate_building OWNER TO postgres;

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
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


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
-- Name: real_estate_complex id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_complex ALTER COLUMN id SET DEFAULT nextval('public.real_estate_complex_id_seq'::regclass);


--
-- Name: real_estate_object id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_object ALTER COLUMN id SET DEFAULT nextval('public.real_estate_object_id_seq'::regclass);


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, name, status, number, email) FROM stdin;
1	Иванов Виктор Викторович	Обычный	79294977357 	IvanovViktorViktorovich-1@agency.ru
2	Романов Артём Петрович	Обычный	79296847806 	RomanovArtemPetrovich-2@agency.ru
3	Солдатов Пётр Дмитриевич	Повышенный	79292152819 	SoldatovPetrDmitrievich-3@agency.ru
4	Иванов Евгений Ильич	Повышенный	79299791994 	IvanovEvgeniyIlich-4@agency.ru
5	Круглов Олег Леонидович	Приоритетный	79298869675 	KruglovOlegLeonidovich-5@agency.ru
6	Иванов Илья Арсеньевич	Приоритетный	79298303402 	IvanovIlyaArsenevich-6@agency.ru
7	Антипов Леонид Олегович	Повышенный	79299860471 	AntipovLeonidOlegovich-7@agency.ru
8	Круглов Иван Александрович	Обычный	79299371723 	KruglovIvanAleksandrovich-8@agency.ru
9	Васильев Юрий Ильич	Приоритетный	79298151185 	VasilevYuriyIlich-9@agency.ru
10	Петров Александр Юрьевич	Повышенный	79297241841 	PetrovAleksandrYurevich-10@agency.ru
11	Романов Василий Олегович	Приоритетный	79290453230 	RomanovVasiliyOlegovich-11@agency.ru
12	Васильев Леонид Петрович	Обычный	79294717257 	VasilevLeonidPetrovich-12@agency.ru
13	Солдатов Юрий Эдуардович	Обычный	79292513054 	SoldatovYuriyEduardovich-13@agency.ru
14	Егоров Олег Артёмович	Повышенный	79297842494 	EgorovOlegArtemovich-14@agency.ru
15	Петров Василий Викторович	Приоритетный	79293194805 	PetrovVasiliyViktorovich-15@agency.ru
16	Круглов Илья Олегович	Повышенный	79294103662 	KruglovIlyaOlegovich-16@agency.ru
17	Солдатов Арсений Петрович	Приоритетный	79298288749 	SoldatovArseniyPetrovich-17@agency.ru
18	Романов Артём Юрьевич	Приоритетный	79294694808 	RomanovArtemYurevich-18@agency.ru
19	Петров Антон Васильевич	Обычный	79295896077 	PetrovAntonVasilevich-19@agency.ru
20	Баранов Арсений Арсеньевич	Обычный	79299562752 	BaranovArseniyArsenevich-20@agency.ru
21	Баранов Виктор Артёмович	Повышенный	79295965076 	BaranovViktorArtemovich-21@agency.ru
22	Антипов Евгений Евгеньевич	Повышенный	79293081067 	AntipovEvgeniyEvgenevich-22@agency.ru
23	Круглов Вадим Арсеньевич	Обычный	79298360043 	KruglovVadimArsenevich-23@agency.ru
24	Иванов Виктор Олегович	Повышенный	79294648169 	IvanovViktorOlegovich-24@agency.ru
25	Высоцкий Иван Петрович	Повышенный	79292288816 	VysockiyIvanPetrovich-25@agency.ru
26	Новиков Виктор Викторович	Обычный	79295237623 	NovikovViktorViktorovich-26@agency.ru
27	Иванов Вадим Геннадьевич	Обычный	79292562243 	IvanovVadimGennadevich-27@agency.ru
28	Солдатов Виктор Дмитриевич	Приоритетный	79294032586 	SoldatovViktorDmitrievich-28@agency.ru
29	Кузнецов Леонид Васильевич	Приоритетный	79294449926 	KuznecovLeonidVasilevich-29@agency.ru
30	Баранов Евгений Вадимович	Обычный	79295499973 	BaranovEvgeniyVadimovich-30@agency.ru
31	Васильев Антон Арсеньевич	Приоритетный	79292132009 	VasilevAntonArsenevich-31@agency.ru
32	Солдатов Антон Дмитриевич	Приоритетный	79292696468 	SoldatovAntonDmitrievich-32@agency.ru
33	Новиков Пётр Дмитриевич	Приоритетный	79298588547 	NovikovPetrDmitrievich-33@agency.ru
34	Игнатьев Владимир Викторович	Повышенный	79296967157 	IgnatevVladimirViktorovich-34@agency.ru
35	Егоров Александр Владимирович	Повышенный	79291067487 	EgorovAleksandrVladimirovich-35@agency.ru
36	Кузнецов Дмитрий Геннадьевич	Обычный	79299135339 	KuznecovDmitriyGennadevich-36@agency.ru
37	Романов Виктор Эдуардович	Приоритетный	79292852211 	RomanovViktorEduardovich-37@agency.ru
38	Романов Илья Евгеньевич	Обычный	79292015573 	RomanovIlyaEvgenevich-38@agency.ru
39	Игнатьев Александр Леонидович	Повышенный	79291778011 	IgnatevAleksandrLeonidovich-39@agency.ru
40	Круглов Леонид Петрович	Приоритетный	79290636220 	KruglovLeonidPetrovich-40@agency.ru
41	Антипов Иван Васильевич	Приоритетный	79294253627 	AntipovIvanVasilevich-41@agency.ru
42	Петров Олег Викторович	Повышенный	79290039695 	PetrovOlegViktorovich-42@agency.ru
43	Игнатьев Василий Леонидович	Повышенный	79299577235 	IgnatevVasiliyLeonidovich-43@agency.ru
44	Новиков Александр Иванович	Повышенный	79295210101 	NovikovAleksandrIvanovich-44@agency.ru
45	Таманский Александр Васильевич	Приоритетный	79291558147 	TamanskiyAleksandrVasilevich-45@agency.ru
46	Ерёмин Илья Ильич	Повышенный	79295193732 	EreminIlyaIlich-46@agency.ru
47	Егоров Иван Геннадьевич	Повышенный	79296826578 	EgorovIvanGennadevich-47@agency.ru
48	Егоров Виктор Ильич	Обычный	79298173805 	EgorovViktorIlich-48@agency.ru
49	Таманский Юрий Олегович	Обычный	79295560593 	TamanskiyYuriyOlegovich-49@agency.ru
50	Шульц Антон Иванович	Приоритетный	79291509048 	ShulcAntonIvanovich-50@agency.ru
51	Таманский Антон Леонидович	Обычный	79294389734 	TamanskiyAntonLeonidovich-51@agency.ru
52	Васильев Дмитрий Арсеньевич	Повышенный	79296467812 	VasilevDmitriyArsenevich-52@agency.ru
53	Игнатьев Дмитрий Эдуардович	Приоритетный	79292983652 	IgnatevDmitriyEduardovich-53@agency.ru
54	Игнатьев Антон Викторович	Повышенный	79294078674 	IgnatevAntonViktorovich-54@agency.ru
55	Антипов Евгений Васильевич	Приоритетный	79290175573 	AntipovEvgeniyVasilevich-55@agency.ru
56	Ерёмин Владимир Иванович	Приоритетный	79290857434 	EreminVladimirIvanovich-56@agency.ru
57	Иванов Виктор Викторович	Приоритетный	79294551466 	IvanovViktorViktorovich-57@agency.ru
58	Баранов Виктор Ильич	Повышенный	79298750073 	BaranovViktorIlich-58@agency.ru
59	Петров Антон Владимирович	Обычный	79296688919 	PetrovAntonVladimirovich-59@agency.ru
60	Егоров Антон Викторович	Приоритетный	79298080821 	EgorovAntonViktorovich-60@agency.ru
61	Петров Василий Олегович	Приоритетный	79292402477 	PetrovVasiliyOlegovich-61@agency.ru
62	Романов Геннадий Артёмович	Повышенный	79294636022 	RomanovGennadiyArtemovich-62@agency.ru
63	Шульц Владимир Юрьевич	Обычный	79296219345 	ShulcVladimirYurevich-63@agency.ru
64	Круглов Дмитрий Владимирович	Приоритетный	79297568773 	KruglovDmitriyVladimirovich-64@agency.ru
65	Иванов Вадим Олегович	Повышенный	79297478414 	IvanovVadimOlegovich-65@agency.ru
66	Круглов Иван Вадимович	Обычный	79293468580 	KruglovIvanVadimovich-66@agency.ru
67	Петров Иван Эдуардович	Обычный	79292337294 	PetrovIvanEduardovich-67@agency.ru
68	Круглов Виктор Артёмович	Приоритетный	79293495304 	KruglovViktorArtemovich-68@agency.ru
69	Кузнецов Арсений Ильич	Обычный	79295230489 	KuznecovArseniyIlich-69@agency.ru
70	Васильев Илья Антонович	Приоритетный	79292357761 	VasilevIlyaAntonovich-70@agency.ru
71	Антипов Леонид Александрович	Приоритетный	79296739826 	AntipovLeonidAleksandrovich-71@agency.ru
72	Ерёмин Геннадий Петрович	Повышенный	79291474395 	EreminGennadiyPetrovich-72@agency.ru
73	Новиков Арсений Викторович	Обычный	79291015857 	NovikovArseniyViktorovich-73@agency.ru
74	Егоров Геннадий Иванович	Повышенный	79297467192 	EgorovGennadiyIvanovich-74@agency.ru
75	Антипов Дмитрий Петрович	Повышенный	79296044922 	AntipovDmitriyPetrovich-75@agency.ru
76	Шульц Артём Юрьевич	Обычный	79296337140 	ShulcArtemYurevich-76@agency.ru
77	Кузнецов Артём Александрович	Повышенный	79297264031 	KuznecovArtemAleksandrovich-77@agency.ru
78	Егоров Артём Эдуардович	Приоритетный	79296923501 	EgorovArtemEduardovich-78@agency.ru
79	Игнатьев Юрий Петрович	Приоритетный	79295112095 	IgnatevYuriyPetrovich-79@agency.ru
80	Егоров Иван Арсеньевич	Повышенный	79296149646 	EgorovIvanArsenevich-80@agency.ru
81	Акимов Геннадий Артёмович	Обычный	79294447759 	AkimovGennadiyArtemovich-81@agency.ru
82	Шульц Леонид Александрович	Приоритетный	79297891916 	ShulcLeonidAleksandrovich-82@agency.ru
83	Акимов Леонид Геннадьевич	Повышенный	79292448946 	AkimovLeonidGennadevich-83@agency.ru
84	Кузнецов Геннадий Леонидович	Обычный	79291881943 	KuznecovGennadiyLeonidovich-84@agency.ru
85	Антипов Евгений Артёмович	Приоритетный	79290138699 	AntipovEvgeniyArtemovich-85@agency.ru
86	Солдатов Антон Геннадьевич	Приоритетный	79295986397 	SoldatovAntonGennadevich-86@agency.ru
87	Акимов Евгений Эдуардович	Приоритетный	79294054055 	AkimovEvgeniyEduardovich-87@agency.ru
88	Ерёмин Василий Викторович	Повышенный	79290109516 	EreminVasiliyViktorovich-88@agency.ru
89	Романов Евгений Дмитриевич	Обычный	79298763612 	RomanovEvgeniyDmitrievich-89@agency.ru
90	Круглов Владимир Ильич	Повышенный	79298010095 	KruglovVladimirIlich-90@agency.ru
91	Антипов Антон Александрович	Приоритетный	79299801839 	AntipovAntonAleksandrovich-91@agency.ru
92	Солдатов Виктор Леонидович	Повышенный	79294180875 	SoldatovViktorLeonidovich-92@agency.ru
93	Егоров Арсений Эдуардович	Повышенный	79295832848 	EgorovArseniyEduardovich-93@agency.ru
94	Солдатов Эдуард Артёмович	Повышенный	79296082443 	SoldatovEduardArtemovich-94@agency.ru
95	Егоров Эдуард Геннадьевич	Повышенный	79293896663 	EgorovEduardGennadevich-95@agency.ru
96	Шульц Александр Иванович	Приоритетный	79293903023 	ShulcAleksandrIvanovich-96@agency.ru
97	Петров Юрий Викторович	Повышенный	79291941618 	PetrovYuriyViktorovich-97@agency.ru
98	Егоров Геннадий Петрович	Обычный	79293945838 	EgorovGennadiyPetrovich-98@agency.ru
99	Таманский Геннадий Леонидович	Обычный	79297549591 	TamanskiyGennadiyLeonidovich-99@agency.ru
100	Круглов Виктор Артёмович	Приоритетный	79291849403 	KruglovViktorArtemovich-100@agency.ru
101	Игнатьев Дмитрий Викторович	Повышенный	79296945906 	IgnatevDmitriyViktorovich-101@agency.ru
102	Кузнецов Владимир Арсеньевич	Приоритетный	79292976865 	KuznecovVladimirArsenevich-102@agency.ru
103	Акимов Эдуард Александрович	Обычный	79297585717 	AkimovEduardAleksandrovich-103@agency.ru
104	Васнецов Олег Геннадьевич	Обычный	79290715522 	VasnecovOlegGennadevich-104@agency.ru
105	Высоцкий Артём Ильич	Обычный	79299577015 	VysockiyArtemIlich-105@agency.ru
106	Антипов Олег Викторович	Обычный	79295501547 	AntipovOlegViktorovich-106@agency.ru
107	Солдатов Александр Ильич	Обычный	79298270493 	SoldatovAleksandrIlich-107@agency.ru
108	Высоцкий Илья Дмитриевич	Приоритетный	79293386773 	VysockiyIlyaDmitrievich-108@agency.ru
109	Баранов Леонид Юрьевич	Повышенный	79296332444 	BaranovLeonidYurevich-109@agency.ru
110	Круглов Артём Леонидович	Обычный	79296025190 	KruglovArtemLeonidovich-110@agency.ru
111	Романов Виктор Леонидович	Повышенный	79299205387 	RomanovViktorLeonidovich-111@agency.ru
112	Круглов Илья Эдуардович	Повышенный	79295690977 	KruglovIlyaEduardovich-112@agency.ru
113	Высоцкий Леонид Ильич	Повышенный	79294973316 	VysockiyLeonidIlich-113@agency.ru
114	Игнатьев Дмитрий Дмитриевич	Приоритетный	79295457057 	IgnatevDmitriyDmitrievich-114@agency.ru
115	Иванов Эдуард Антонович	Повышенный	79298305603 	IvanovEduardAntonovich-115@agency.ru
116	Игнатьев Александр Викторович	Приоритетный	79290249542 	IgnatevAleksandrViktorovich-116@agency.ru
117	Антипов Леонид Васильевич	Обычный	79294450337 	AntipovLeonidVasilevich-117@agency.ru
118	Новиков Олег Геннадьевич	Повышенный	79296768768 	NovikovOlegGennadevich-118@agency.ru
119	Солдатов Дмитрий Эдуардович	Обычный	79293282502 	SoldatovDmitriyEduardovich-119@agency.ru
120	Таманский Юрий Ильич	Приоритетный	79292239043 	TamanskiyYuriyIlich-120@agency.ru
121	Романов Вадим Антонович	Повышенный	79292401493 	RomanovVadimAntonovich-121@agency.ru
122	Романов Эдуард Евгеньевич	Повышенный	79292339278 	RomanovEduardEvgenevich-122@agency.ru
123	Игнатьев Виктор Олегович	Повышенный	79296577238 	IgnatevViktorOlegovich-123@agency.ru
124	Ерёмин Пётр Иванович	Обычный	79292010657 	EreminPetrIvanovich-124@agency.ru
125	Акимов Леонид Дмитриевич	Приоритетный	79297531201 	AkimovLeonidDmitrievich-125@agency.ru
126	Романов Арсений Иванович	Повышенный	79294187958 	RomanovArseniyIvanovich-126@agency.ru
127	Васнецов Вадим Владимирович	Повышенный	79291891787 	VasnecovVadimVladimirovich-127@agency.ru
128	Петров Илья Олегович	Обычный	79291077443 	PetrovIlyaOlegovich-128@agency.ru
129	Кузнецов Дмитрий Олегович	Обычный	79295470631 	KuznecovDmitriyOlegovich-129@agency.ru
130	Кузнецов Дмитрий Васильевич	Обычный	79292680420 	KuznecovDmitriyVasilevich-130@agency.ru
131	Высоцкий Вадим Геннадьевич	Повышенный	79298170195 	VysockiyVadimGennadevich-131@agency.ru
132	Новиков Илья Арсеньевич	Обычный	79299525194 	NovikovIlyaArsenevich-132@agency.ru
133	Круглов Иван Леонидович	Обычный	79296525836 	KruglovIvanLeonidovich-133@agency.ru
134	Высоцкий Евгений Геннадьевич	Повышенный	79296355199 	VysockiyEvgeniyGennadevich-134@agency.ru
135	Васнецов Иван Арсеньевич	Повышенный	79297344750 	VasnecovIvanArsenevich-135@agency.ru
136	Игнатьев Эдуард Иванович	Приоритетный	79297705330 	IgnatevEduardIvanovich-136@agency.ru
137	Антипов Дмитрий Викторович	Повышенный	79293769532 	AntipovDmitriyViktorovich-137@agency.ru
138	Таманский Виктор Олегович	Приоритетный	79290862433 	TamanskiyViktorOlegovich-138@agency.ru
139	Круглов Иван Владимирович	Приоритетный	79294869896 	KruglovIvanVladimirovich-139@agency.ru
140	Егоров Александр Леонидович	Повышенный	79295497690 	EgorovAleksandrLeonidovich-140@agency.ru
141	Ерёмин Эдуард Геннадьевич	Повышенный	79295121413 	EreminEduardGennadevich-141@agency.ru
142	Романов Артём Леонидович	Повышенный	79291889058 	RomanovArtemLeonidovich-142@agency.ru
143	Высоцкий Василий Геннадьевич	Приоритетный	79298920247 	VysockiyVasiliyGennadevich-143@agency.ru
144	Таманский Вадим Арсеньевич	Приоритетный	79290867593 	TamanskiyVadimArsenevich-144@agency.ru
145	Васильев Илья Владимирович	Повышенный	79292592636 	VasilevIlyaVladimirovich-145@agency.ru
146	Шульц Александр Евгеньевич	Обычный	79294262612 	ShulcAleksandrEvgenevich-146@agency.ru
147	Егоров Арсений Вадимович	Обычный	79294815833 	EgorovArseniyVadimovich-147@agency.ru
148	Кузнецов Василий Александрович	Приоритетный	79292573353 	KuznecovVasiliyAleksandrovich-148@agency.ru
149	Высоцкий Антон Владимирович	Повышенный	79295873738 	VysockiyAntonVladimirovich-149@agency.ru
150	Егоров Артём Вадимович	Повышенный	79292939820 	EgorovArtemVadimovich-150@agency.ru
151	Акимов Виктор Арсеньевич	Обычный	79292744890 	AkimovViktorArsenevich-151@agency.ru
152	Кузнецов Юрий Леонидович	Приоритетный	79291371762 	KuznecovYuriyLeonidovich-152@agency.ru
153	Кузнецов Дмитрий Евгеньевич	Обычный	79299803609 	KuznecovDmitriyEvgenevich-153@agency.ru
154	Антипов Илья Геннадьевич	Повышенный	79299180798 	AntipovIlyaGennadevich-154@agency.ru
155	Игнатьев Артём Геннадьевич	Обычный	79294883845 	IgnatevArtemGennadevich-155@agency.ru
156	Иванов Юрий Олегович	Повышенный	79299548433 	IvanovYuriyOlegovich-156@agency.ru
157	Солдатов Артём Викторович	Обычный	79290388806 	SoldatovArtemViktorovich-157@agency.ru
158	Таманский Леонид Юрьевич	Обычный	79292462971 	TamanskiyLeonidYurevich-158@agency.ru
159	Антипов Антон Дмитриевич	Приоритетный	79292954866 	AntipovAntonDmitrievich-159@agency.ru
160	Романов Пётр Вадимович	Приоритетный	79292367515 	RomanovPetrVadimovich-160@agency.ru
161	Акимов Юрий Эдуардович	Приоритетный	79290029121 	AkimovYuriyEduardovich-161@agency.ru
162	Васнецов Юрий Леонидович	Обычный	79293258807 	VasnecovYuriyLeonidovich-162@agency.ru
163	Егоров Олег Владимирович	Повышенный	79295443636 	EgorovOlegVladimirovich-163@agency.ru
164	Шульц Пётр Васильевич	Обычный	79292626360 	ShulcPetrVasilevich-164@agency.ru
165	Круглов Леонид Антонович	Приоритетный	79295854765 	KruglovLeonidAntonovich-165@agency.ru
166	Петров Вадим Васильевич	Повышенный	79291136211 	PetrovVadimVasilevich-166@agency.ru
167	Егоров Пётр Ильич	Приоритетный	79296976612 	EgorovPetrIlich-167@agency.ru
168	Высоцкий Александр Александрович	Повышенный	79292262715 	VysockiyAleksandrAleksandrovich-168@agency.ru
169	Романов Арсений Геннадьевич	Приоритетный	79299263707 	RomanovArseniyGennadevich-169@agency.ru
170	Баранов Владимир Иванович	Приоритетный	79292145583 	BaranovVladimirIvanovich-170@agency.ru
171	Шульц Антон Арсеньевич	Повышенный	79294241289 	ShulcAntonArsenevich-171@agency.ru
172	Игнатьев Олег Олегович	Обычный	79293255791 	IgnatevOlegOlegovich-172@agency.ru
173	Баранов Виктор Ильич	Приоритетный	79299386100 	BaranovViktorIlich-173@agency.ru
174	Егоров Леонид Артёмович	Обычный	79295783120 	EgorovLeonidArtemovich-174@agency.ru
175	Игнатьев Антон Арсеньевич	Приоритетный	79294652533 	IgnatevAntonArsenevich-175@agency.ru
176	Круглов Дмитрий Иванович	Повышенный	79292769220 	KruglovDmitriyIvanovich-176@agency.ru
177	Егоров Эдуард Васильевич	Приоритетный	79298593713 	EgorovEduardVasilevich-177@agency.ru
178	Акимов Арсений Арсеньевич	Повышенный	79299902173 	AkimovArseniyArsenevich-178@agency.ru
179	Новиков Антон Иванович	Повышенный	79296621543 	NovikovAntonIvanovich-179@agency.ru
180	Кузнецов Вадим Евгеньевич	Повышенный	79292688085 	KuznecovVadimEvgenevich-180@agency.ru
181	Высоцкий Дмитрий Владимирович	Повышенный	79297710146 	VysockiyDmitriyVladimirovich-181@agency.ru
182	Васильев Дмитрий Евгеньевич	Приоритетный	79293418118 	VasilevDmitriyEvgenevich-182@agency.ru
183	Васильев Иван Петрович	Повышенный	79299572525 	VasilevIvanPetrovich-183@agency.ru
184	Новиков Виктор Иванович	Обычный	79294591720 	NovikovViktorIvanovich-184@agency.ru
185	Иванов Александр Артёмович	Обычный	79297807425 	IvanovAleksandrArtemovich-185@agency.ru
186	Новиков Артём Дмитриевич	Повышенный	79298668301 	NovikovArtemDmitrievich-186@agency.ru
187	Кузнецов Эдуард Артёмович	Приоритетный	79295208202 	KuznecovEduardArtemovich-187@agency.ru
188	Кузнецов Дмитрий Леонидович	Обычный	79299282861 	KuznecovDmitriyLeonidovich-188@agency.ru
189	Высоцкий Вадим Ильич	Повышенный	79299499058 	VysockiyVadimIlich-189@agency.ru
190	Таманский Леонид Евгеньевич	Повышенный	79293349374 	TamanskiyLeonidEvgenevich-190@agency.ru
191	Игнатьев Пётр Олегович	Приоритетный	79291760106 	IgnatevPetrOlegovich-191@agency.ru
192	Иванов Илья Викторович	Обычный	79297473177 	IvanovIlyaViktorovich-192@agency.ru
193	Круглов Арсений Антонович	Повышенный	79299885343 	KruglovArseniyAntonovich-193@agency.ru
194	Высоцкий Дмитрий Вадимович	Приоритетный	79297940724 	VysockiyDmitriyVadimovich-194@agency.ru
195	Ерёмин Юрий Иванович	Повышенный	79297948336 	EreminYuriyIvanovich-195@agency.ru
196	Акимов Арсений Викторович	Повышенный	79294529072 	AkimovArseniyViktorovich-196@agency.ru
197	Шульц Виктор Эдуардович	Повышенный	79295966044 	ShulcViktorEduardovich-197@agency.ru
198	Круглов Арсений Александрович	Обычный	79291819771 	KruglovArseniyAleksandrovich-198@agency.ru
199	Высоцкий Александр Дмитриевич	Повышенный	79292568230 	VysockiyAleksandrDmitrievich-199@agency.ru
200	Баранов Пётр Евгеньевич	Приоритетный	79290061657 	BaranovPetrEvgenevich-200@agency.ru
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
28	Романов Илья Юрьевич	Жилая недвижимость	79294694449 	RomanovIlyaYurevich-28@agency.ru	IlYuRo-2828	lyaurevoman2861	14	8
25	Петров Виктор Владимирович	Коммерческая недвижимость	79299475958 	PetrovViktorVladimirovich-25@agency.ru	ViVlPe-2534	iktoladietro2559	13	8
29	Игнатьев Дмитрий Леонидович	Жилая недвижимость	79298419871 	IgnatevDmitriyLeonidovich-29@agency.ru	DmLeIg-2961	mitreonignat2993	15	8
23	Таманский Юрий Викторович	Жилая недвижимость	79292857426 	TamanskiyYuriyViktorovich-23@agency.ru	YuViTa-2395	uriyiktoaman2323	12	8
17	Антипов Арсений Вадимович	\N	79299000297 	AntipovArseniyVadimovich-17@agency.ru	ArVaAn-1759	rsenadimntip1740	3	9
12	Круглов Владимир Викторович	\N	79299506475 	KruglovVladimirViktorovich-12@agency.ru	VlViKr-1271	ladiiktorugl1279	3	9
15	Игнатьев Евгений Антонович	\N	79297942777 	IgnatevEvgeniyAntonovich-15@agency.ru	EvAnIg-1529	vgenntongnat1541	3	9
14	Антипов Юрий Олегович	\N	79298871242 	AntipovYuriyOlegovich-14@agency.ru	YuOlAn-1410	uriylegontip1422	3	9
19	Антипов Вадим Геннадьевич	\N	79294149803 	AntipovVadimGennadevich-19@agency.ru	VaGeAn-1943	adimennantip1997	3	9
11	Егоров Дмитрий Арсеньевич	\N	79293829936 	EgorovDmitriyArsenevich-11@agency.ru	DmArEg-1120	mitrrsengoro1116	3	9
13	Антипов Виктор Артёмович	\N	79292392510 	AntipovViktorArtemovich-13@agency.ru	ViArAn-1389	iktortemntip1364	3	9
20	Антипов Виктор Юрьевич	\N	79292604782 	AntipovViktorYurevich-20@agency.ru	ViYuAn-2094	iktourevntip2012	3	9
16	Акимов Артём Дмитриевич	\N	79291115630 	AkimovArtemDmitrievich-16@agency.ru	ArDmAk-1676	rtemmitrkimo1693	3	9
18	Высоцкий Александр Артёмович	\N	79295015355 	VysockiyAleksandrArtemovich-18@agency.ru	AlArVy-1830	leksrtemysoc1813	3	9
27	Акимов Леонид Эдуардович	Жилая недвижимость	79298007518 	AkimovLeonidEduardovich-27@agency.ru	LeEdAk-2767	eoniduarkimo2772	14	8
22	Кузнецов Евгений Вадимович	Жилая недвижимость	79297262467 	KuznecovEvgeniyVadimovich-22@agency.ru	EvVaKu-2270	vgenadimuzne2276	11	8
21	Егоров Арсений Викторович	Жилая недвижимость	79297942821 	EgorovArseniyViktorovich-21@agency.ru	ArViEg-2114	rseniktogoro2189	11	8
31	Солдатов Василий Геннадьевич	Жилая недвижимость	79298392024 	SoldatovVasiliyGennadevich-31@agency.ru	VaGeSo-3174	asilennaolda3181	16	8
30	Игнатьев Илья Леонидович	Коммерческая недвижимость	79294449896 	IgnatevIlyaLeonidovich-30@agency.ru	IlLeIg-3046	lyaeonignat3063	16	8
26	Антипов Иван Викторович	Коммерческая недвижимость	79294663134 	AntipovIvanViktorovich-26@agency.ru	IvViAn-2658	vaniktontip2682	13	8
24	Петров Иван Артёмович	Коммерческая недвижимость	79295652590 	PetrovIvanArtemovich-24@agency.ru	IvArPe-2496	vanrtemetro2490	12	8
9	Иванов Александр Олегович	\N	79298699306 	IvanovAleksandrOlegovich-9@agency.ru	AlOlIv-962	lekslegovano980	3	4
8	Васнецов Евгений Олегович	\N	79297577549 	VasnecovEvgeniyOlegovich-8@agency.ru	EvOlVa-885	vgenlegoasne866	3	4
2	Шульц Дмитрий Владимирович	\N	79290394316 	ShulcDmitriyVladimirovich-2@agency.ru	DmVlSh-225	mitrladihulc268	1	2
33	Шульц Владимир Владимирович	Коммерческая недвижимость	79297675087 	ShulcVladimirVladimirovich-33@agency.ru	VlVlSh-3325	ladiladihulc3368	18	8
36	Антипов Виктор Дмитриевич	Жилая недвижимость	79293246459 	AntipovViktorDmitrievich-36@agency.ru	ViDmAn-3646	iktomitrntip3642	19	8
35	Солдатов Виктор Васильевич	Жилая недвижимость	79299801300 	SoldatovViktorVasilevich-35@agency.ru	ViVaSo-3538	iktoasilolda3544	18	8
34	Игнатьев Евгений Юрьевич	Коммерческая недвижимость	79293728277 	IgnatevEvgeniyYurevich-34@agency.ru	EvYuIg-3488	vgenurevgnat3421	18	8
45	Таманский Евгений Владимирович	Коммерческая недвижимость	79292697900 	TamanskiyEvgeniyVladimirovich-45@agency.ru	EvVlTa-4591	vgenladiaman4517	17	8
37	Ерёмин Юрий Дмитриевич	Жилая недвижимость	79293858525 	EreminYuriyDmitrievich-37@agency.ru	YuDmEr-3714	uriymitrremi3723	19	8
41	Васильев Евгений Антонович	Жилая недвижимость	79293449795 	VasilevEvgeniyAntonovich-41@agency.ru	EvAnVa-4164	vgenntonasil4189	20	8
56	Иванов Евгений Вадимович	Коммерческая недвижимость	79295808517 	IvanovEvgeniyVadimovich-56@agency.ru	EvVaIv-5621	vgenadimvano5646	23	7
106	Баранов Виктор Артёмович	Коммерческая недвижимость	79294278643 	BaranovViktorArtemovich-106@agency.ru	ViArBa-10660	iktortemaran10660	36	7
57	Солдатов Илья Эдуардович	Коммерческая недвижимость	79293295663 	SoldatovIlyaEduardovich-57@agency.ru	IlEdSo-5710	lyaduarolda5786	23	7
108	Романов Эдуард Юрьевич	Коммерческая недвижимость	79299158916 	RomanovEduardYurevich-108@agency.ru	EdYuRo-10820	duarurevoman10857	36	7
87	Романов Владимир Ильич	Коммерческая недвижимость	79297263873 	RomanovVladimirIlich-87@agency.ru	VlIlRo-8764	ladilichoman8753	31	7
86	Акимов Владимир Владимирович	Коммерческая недвижимость	79293246535 	AkimovVladimirVladimirovich-86@agency.ru	VlVlAk-8638	ladiladikimo8665	31	7
102	Васильев Эдуард Васильевич	Коммерческая недвижимость	79297717970 	VasilevEduardVasilevich-102@agency.ru	EdVaVa-10230	duarasilasil10272	35	7
142	Егоров Арсений Вадимович	Коммерческая недвижимость	79299868855 	EgorovArseniyVadimovich-142@agency.ru	ArVaEg-14297	rsenadimgoro14223	45	7
82	Акимов Пётр Арсеньевич	Коммерческая недвижимость	79290698159 	AkimovPetrArsenevich-82@agency.ru	PeArAk-8256	etrrsenkimo8279	30	7
129	Новиков Василий Васильевич	Коммерческая недвижимость	79296539921 	NovikovVasiliyVasilevich-129@agency.ru	VaVaNo-12979	asilasilovik12999	41	7
84	Новиков Эдуард Ильич	Жилая недвижимость	79295643119 	NovikovEduardIlich-84@agency.ru	EdIlNo-8486	duarlichovik8486	30	7
116	Баранов Антон Антонович	Жилая недвижимость	79291811019 	BaranovAntonAntonovich-116@agency.ru	AnAnBa-11617	ntonntonaran11610	38	7
115	Солдатов Арсений Юрьевич	Жилая недвижимость	79292707026 	SoldatovArseniyYurevich-115@agency.ru	ArYuSo-11587	rsenurevolda11591	38	7
114	Петров Антон Антонович	Коммерческая недвижимость	79297451921 	PetrovAntonAntonovich-114@agency.ru	AnAnPe-11445	ntonntonetro11473	38	7
113	Васильев Олег Евгеньевич	Жилая недвижимость	79295606035 	VasilevOlegEvgenevich-113@agency.ru	OlEvVa-11375	legvgenasil11337	37	7
3	Егоров Василий Ильич	\N	79298963522 	EgorovVasiliyIlich-3@agency.ru	VaIlEg-360	asillichgoro343	2	3
4	Таманский Евгений Вадимович	\N	79290849839 	TamanskiyEvgeniyVadimovich-4@agency.ru	EvVaTa-481	vgenadimaman486	3	5
43	Баранов Вадим Васильевич	Коммерческая недвижимость	79299260474 	BaranovVadimVasilevich-43@agency.ru	VaVaBa-4340	adimasilaran4351	15	8
7	Акимов Иван Леонидович	\N	79290355690 	AkimovIvanLeonidovich-7@agency.ru	IvLeAk-729	vaneonikimo760	3	4
6	Романов Эдуард Викторович	\N	79294140638 	RomanovEduardViktorovich-6@agency.ru	EdViRo-695	duariktooman613	3	5
40	Романов Владимир Геннадьевич	Коммерческая недвижимость	79292260909 	RomanovVladimirGennadevich-40@agency.ru	VlGeRo-4058	ladiennaoman4039	20	8
38	Петров Вадим Геннадьевич	Коммерческая недвижимость	79299916504 	PetrovVadimGennadevich-38@agency.ru	VaGePe-3882	adimennaetro3886	16	8
39	Кузнецов Вадим Юрьевич	Коммерческая недвижимость	79294588270 	KuznecovVadimYurevich-39@agency.ru	VaYuKu-3953	adimurevuzne3951	20	8
42	Баранов Евгений Артёмович	Жилая недвижимость	79293373140 	BaranovEvgeniyArtemovich-42@agency.ru	EvArBa-4249	vgenrtemaran4272	15	8
32	Кузнецов Олег Артёмович	Жилая недвижимость	79291651690 	KuznecovOlegArtemovich-32@agency.ru	OlArKu-3231	legrtemuzne3299	17	8
44	Ерёмин Илья Евгеньевич	Коммерческая недвижимость	79296576621 	EreminIlyaEvgenevich-44@agency.ru	IlEvEr-4418	lyavgenremi4471	15	8
71	Васильев Геннадий Олегович	Коммерческая недвижимость	79298604059 	VasilevGennadiyOlegovich-71@agency.ru	GeOlVa-7142	ennalegoasil7137	27	7
1	Шульц Геннадий Викторович	\N	79299901005 	ShulcGennadiyViktorovich-1@agency.ru	GeViSh-129	ennaiktohulc189	\N	1
70	Солдатов Владимир Леонидович	Коммерческая недвижимость	79290171844 	SoldatovVladimirLeonidovich-70@agency.ru	VlLeSo-7047	ladieoniolda7055	27	7
5	Таманский Геннадий Леонидович	\N	79299180228 	TamanskiyGennadiyLeonidovich-5@agency.ru	GeLeTa-512	ennaeoniaman535	3	5
10	Кузнецов Вадим Ильич	\N	79293341672 	KuznecovVadimIlich-10@agency.ru	VaIlKu-1039	adimlichuzne1012	3	4
55	Таманский Дмитрий Антонович	Жилая недвижимость	79293991084 	TamanskiyDmitriyAntonovich-55@agency.ru	DmAnTa-5528	mitrntonaman5597	23	6
72	Иванов Леонид Петрович	Коммерческая недвижимость	79295740929 	IvanovLeonidPetrovich-72@agency.ru	LePeIv-7259	eonietrovano7247	27	7
68	Антипов Эдуард Вадимович	Коммерческая недвижимость	79296206102 	AntipovEduardVadimovich-68@agency.ru	EdVaAn-6880	duaradimntip6831	26	7
67	Петров Артём Артёмович	Коммерческая недвижимость	79297853827 	PetrovArtemArtemovich-67@agency.ru	ArArPe-6763	rtemrtemetro6762	26	7
66	Высоцкий Василий Арсеньевич	Жилая недвижимость	79293165694 	VysockiyVasiliyArsenevich-66@agency.ru	VaArVy-6641	asilrsenysoc6659	26	7
69	Баранов Олег Вадимович	Жилая недвижимость	79296454129 	BaranovOlegVadimovich-69@agency.ru	OlVaBa-6992	legadimaran6998	26	7
54	Антипов Вадим Ильич	Коммерческая недвижимость	79299018109 	AntipovVadimIlich-54@agency.ru	VaIlAn-5455	adimlichntip5448	23	6
53	Игнатьев Александр Петрович	Жилая недвижимость	79298932213 	IgnatevAleksandrPetrovich-53@agency.ru	AlPeIg-5316	leksetrognat5327	22	6
150	Солдатов Евгений Эдуардович	Жилая недвижимость	79291323811 	SoldatovEvgeniyEduardovich-150@agency.ru	EvEdSo-15012	vgenduarolda15043	\N	7
147	Петров Арсений Евгеньевич	Коммерческая недвижимость	79298749578 	PetrovArseniyEvgenevich-147@agency.ru	ArEvPe-14786	rsenvgenetro14759	\N	7
149	Егоров Антон Васильевич	Жилая недвижимость	79290515667 	EgorovAntonVasilevich-149@agency.ru	AnVaEg-14926	ntonasilgoro14961	\N	7
146	Петров Олег Владимирович	Жилая недвижимость	79290507738 	PetrovOlegVladimirovich-146@agency.ru	OlVlPe-14682	legladietro14652	\N	7
148	Высоцкий Александр Юрьевич	Коммерческая недвижимость	79291695419 	VysockiyAleksandrYurevich-148@agency.ru	AlYuVy-14844	leksurevysoc14880	\N	7
128	Акимов Арсений Викторович	Коммерческая недвижимость	79297270555 	AkimovArseniyViktorovich-128@agency.ru	ArViAk-12887	rseniktokimo12812	41	7
138	Баранов Вадим Вадимович	Коммерческая недвижимость	79295669890 	BaranovVadimVadimovich-138@agency.ru	VaVaBa-13889	adimadimaran13876	44	7
49	Баранов Виктор Вадимович	Коммерческая недвижимость	79290684074 	BaranovViktorVadimovich-49@agency.ru	ViVaBa-4913	iktoadimaran4989	21	6
120	Солдатов Эдуард Леонидович	Жилая недвижимость	79297927551 	SoldatovEduardLeonidovich-120@agency.ru	EdLeSo-12025	duareoniolda12039	39	7
100	Кузнецов Илья Юрьевич	Жилая недвижимость	79291605798 	KuznecovIlyaYurevich-100@agency.ru	IlYuKu-10028	lyaurevuzne10039	34	7
144	Баранов Евгений Леонидович	Жилая недвижимость	79298094286 	BaranovEvgeniyLeonidovich-144@agency.ru	EvLeBa-14456	vgeneoniaran14424	45	7
75	Антипов Арсений Иванович	Жилая недвижимость	79296824764 	AntipovArseniyIvanovich-75@agency.ru	ArIvAn-7510	rsenvanontip7597	28	7
95	Баранов Владимир Викторович	Жилая недвижимость	79294912562 	BaranovVladimirViktorovich-95@agency.ru	VlViBa-9546	ladiiktoaran9524	33	7
77	Васнецов Евгений Ильич	Коммерческая недвижимость	79294741318 	VasnecovEvgeniyIlich-77@agency.ru	EvIlVa-7743	vgenlichasne7742	28	7
76	Солдатов Леонид Владимирович	Коммерческая недвижимость	79295248959 	SoldatovLeonidVladimirovich-76@agency.ru	LeVlSo-7627	eoniladiolda7691	28	7
88	Ерёмин Эдуард Геннадьевич	Коммерческая недвижимость	79295714825 	EreminEduardGennadevich-88@agency.ru	EdGeEr-8820	duarennaremi8829	31	7
101	Игнатьев Леонид Ильич	Коммерческая недвижимость	79295734360 	IgnatevLeonidIlich-101@agency.ru	LeIlIg-10173	eonilichgnat10197	34	7
51	Шульц Дмитрий Викторович	Коммерческая недвижимость	79298782341 	ShulcDmitriyViktorovich-51@agency.ru	DmViSh-5121	mitriktohulc5165	22	6
121	Кузнецов Антон Олегович	Коммерческая недвижимость	79292731500 	KuznecovAntonOlegovich-121@agency.ru	AnOlKu-12169	ntonlegouzne12118	39	7
73	Круглов Артём Вадимович	Жилая недвижимость	79295644859 	KruglovArtemVadimovich-73@agency.ru	ArVaKr-7342	rtemadimrugl7348	27	7
99	Таманский Эдуард Эдуардович	Жилая недвижимость	79291746257 	TamanskiyEduardEduardovich-99@agency.ru	EdEdTa-9926	duarduaraman9921	34	7
98	Антипов Антон Юрьевич	Коммерческая недвижимость	79293954373 	AntipovAntonYurevich-98@agency.ru	AnYuAn-9867	ntonurevntip9885	34	7
74	Солдатов Эдуард Дмитриевич	Коммерческая недвижимость	79297420997 	SoldatovEduardDmitrievich-74@agency.ru	EdDmSo-7439	duarmitrolda7467	28	7
104	Новиков Виктор Эдуардович	Коммерческая недвижимость	79298600904 	NovikovViktorEduardovich-104@agency.ru	ViEdNo-10446	iktoduarovik10435	35	7
103	Круглов Иван Артёмович	Коммерческая недвижимость	79298558823 	KruglovIvanArtemovich-103@agency.ru	IvArKr-10334	vanrtemrugl10313	35	7
119	Акимов Вадим Геннадьевич	Коммерческая недвижимость	79292889665 	AkimovVadimGennadevich-119@agency.ru	VaGeAk-11981	adimennakimo11933	39	7
48	Круглов Василий Геннадьевич	Жилая недвижимость	79297175580 	KruglovVasiliyGennadevich-48@agency.ru	VaGeKr-4889	asilennarugl4881	21	6
89	Новиков Арсений Петрович	Жилая недвижимость	79293552856 	NovikovArseniyPetrovich-89@agency.ru	ArPeNo-8937	rsenetroovik8912	31	7
105	Васильев Юрий Антонович	Коммерческая недвижимость	79294697551 	VasilevYuriyAntonovich-105@agency.ru	YuAnVa-10511	uriyntonasil10587	35	7
94	Иванов Геннадий Александрович	Коммерческая недвижимость	79298573033 	IvanovGennadiyAleksandrovich-94@agency.ru	GeAlIv-9456	ennaleksvano9429	33	7
65	Солдатов Геннадий Александрович	Жилая недвижимость	79297180063 	SoldatovGennadiyAleksandrovich-65@agency.ru	GeAlSo-6529	ennaleksolda6551	25	7
64	Шульц Арсений Олегович	Коммерческая недвижимость	79299569893 	ShulcArseniyOlegovich-64@agency.ru	ArOlSh-6475	rsenlegohulc6459	25	7
126	Круглов Геннадий Дмитриевич	Жилая недвижимость	79291825904 	KruglovGennadiyDmitrievich-126@agency.ru	GeDmKr-12682	ennamitrrugl12661	41	7
85	Васильев Александр Эдуардович	Жилая недвижимость	79295037003 	VasilevAleksandrEduardovich-85@agency.ru	AlEdVa-8544	leksduarasil8544	30	7
46	Шульц Василий Арсеньевич	Жилая недвижимость	79292743453 	ShulcVasiliyArsenevich-46@agency.ru	VaArSh-4612	asilrsenhulc4672	21	6
127	Акимов Александр Антонович	Жилая недвижимость	79290272488 	AkimovAleksandrAntonovich-127@agency.ru	AlAnAk-12786	leksntonkimo12772	41	7
140	Круглов Дмитрий Вадимович	Коммерческая недвижимость	79290200298 	KruglovDmitriyVadimovich-140@agency.ru	DmVaKr-14079	mitradimrugl14027	44	7
83	Егоров Юрий Владимирович	Жилая недвижимость	79298789821 	EgorovYuriyVladimirovich-83@agency.ru	YuVlEg-8348	uriyladigoro8322	30	7
47	Романов Владимир Артёмович	Коммерческая недвижимость	79298780197 	RomanovVladimirArtemovich-47@agency.ru	VlArRo-4724	ladirtemoman4748	21	6
62	Ерёмин Олег Владимирович	Коммерческая недвижимость	79291753552 	EreminOlegVladimirovich-62@agency.ru	OlVlEr-6273	legladiremi6238	25	7
139	Ерёмин Леонид Юрьевич	Жилая недвижимость	79299569000 	EreminLeonidYurevich-139@agency.ru	LeYuEr-13961	eoniurevremi13934	44	7
63	Егоров Геннадий Владимирович	Жилая недвижимость	79299664387 	EgorovGennadiyVladimirovich-63@agency.ru	GeVlEg-6350	ennaladigoro6367	25	7
117	Кузнецов Арсений Петрович	Коммерческая недвижимость	79290477266 	KuznecovArseniyPetrovich-117@agency.ru	ArPeKu-11761	rsenetrouzne11729	38	7
50	Петров Владимир Геннадьевич	Коммерческая недвижимость	79299527439 	PetrovVladimirGennadevich-50@agency.ru	VlGePe-5074	ladiennaetro5040	22	6
141	Петров Юрий Александрович	Жилая недвижимость	79291906334 	PetrovYuriyAleksandrovich-141@agency.ru	YuAlPe-14175	uriyleksetro14170	44	7
107	Игнатьев Илья Александрович	Жилая недвижимость	79296633946 	IgnatevIlyaAleksandrovich-107@agency.ru	IlAlIg-10730	lyaleksgnat10750	36	7
78	Таманский Евгений Эдуардович	Коммерческая недвижимость	79295286545 	TamanskiyEvgeniyEduardovich-78@agency.ru	EvEdTa-7831	vgenduaraman7888	29	7
79	Новиков Дмитрий Олегович	Коммерческая недвижимость	79296693571 	NovikovDmitriyOlegovich-79@agency.ru	DmOlNo-7971	mitrlegoovik7942	29	7
134	Петров Иван Геннадьевич	Жилая недвижимость	79299711162 	PetrovIvanGennadevich-134@agency.ru	IvGePe-13437	vanennaetro13463	43	7
135	Романов Владимир Эдуардович	Жилая недвижимость	79292091398 	RomanovVladimirEduardovich-135@agency.ru	VlEdRo-13514	ladiduaroman13598	43	7
123	Таманский Эдуард Владимирович	Коммерческая недвижимость	79295106708 	TamanskiyEduardVladimirovich-123@agency.ru	EdVlTa-12384	duarladiaman12341	40	7
122	Иванов Дмитрий Олегович	Жилая недвижимость	79299842060 	IvanovDmitriyOlegovich-122@agency.ru	DmOlIv-12292	mitrlegovano12232	40	7
125	Васнецов Василий Юрьевич	Коммерческая недвижимость	79297368984 	VasnecovVasiliyYurevich-125@agency.ru	VaYuVa-12541	asilurevasne12519	40	7
124	Игнатьев Антон Викторович	Коммерческая недвижимость	79297773528 	IgnatevAntonViktorovich-124@agency.ru	AnViIg-12465	ntoniktognat12431	40	7
81	Васильев Василий Ильич	Коммерческая недвижимость	79292197302 	VasilevVasiliyIlich-81@agency.ru	VaIlVa-8148	asillichasil8171	29	7
80	Антипов Виктор Леонидович	Коммерческая недвижимость	79297819665 	AntipovViktorLeonidovich-80@agency.ru	ViLeAn-8025	iktoeonintip8052	29	7
59	Егоров Юрий Ильич	Коммерческая недвижимость	79291378694 	EgorovYuriyIlich-59@agency.ru	YuIlEg-5941	uriylichgoro5928	24	7
58	Петров Владимир Викторович	Жилая недвижимость	79298223813 	PetrovVladimirViktorovich-58@agency.ru	VlViPe-5838	ladiiktoetro5889	24	7
61	Игнатьев Пётр Олегович	Жилая недвижимость	79293655533 	IgnatevPetrOlegovich-61@agency.ru	PeOlIg-6116	etrlegognat6156	24	7
60	Егоров Иван Эдуардович	Коммерческая недвижимость	79298442606 	EgorovIvanEduardovich-60@agency.ru	IvEdEg-6080	vanduargoro6017	24	7
145	Антипов Вадим Петрович	Коммерческая недвижимость	79299835099 	AntipovVadimPetrovich-145@agency.ru	VaPeAn-14588	adimetrontip14580	45	7
132	Шульц Иван Геннадьевич	Жилая недвижимость	79290534994 	ShulcIvanGennadevich-132@agency.ru	IvGeSh-13270	vanennahulc13238	42	7
133	Баранов Олег Петрович	Коммерческая недвижимость	79298098191 	BaranovOlegPetrovich-133@agency.ru	OlPeBa-13315	legetroaran13324	42	7
136	Васнецов Илья Артёмович	Жилая недвижимость	79295439088 	VasnecovIlyaArtemovich-136@agency.ru	IlArVa-13610	lyartemasne13689	43	7
109	Солдатов Артём Ильич	Жилая недвижимость	79298876260 	SoldatovArtemIlich-109@agency.ru	ArIlSo-10986	rtemlicholda10938	36	7
110	Новиков Василий Вадимович	Коммерческая недвижимость	79293839188 	NovikovVasiliyVadimovich-110@agency.ru	VaVaNo-11091	asiladimovik11072	37	7
91	Круглов Александр Евгеньевич	Жилая недвижимость	79293857517 	KruglovAleksandrEvgenevich-91@agency.ru	AlEvKr-9133	leksvgenrugl9157	32	7
90	Кузнецов Эдуард Геннадьевич	Коммерческая недвижимость	79291350465 	KuznecovEduardGennadevich-90@agency.ru	EdGeKu-9052	duarennauzne9047	32	7
93	Круглов Пётр Евгеньевич	Жилая недвижимость	79299210161 	KruglovPetrEvgenevich-93@agency.ru	PeEvKr-9394	etrvgenrugl9366	32	7
92	Таманский Дмитрий Артёмович	Жилая недвижимость	79297502515 	TamanskiyDmitriyArtemovich-92@agency.ru	DmArTa-9246	mitrrtemaman9285	32	7
111	Высоцкий Пётр Вадимович	Жилая недвижимость	79296044615 	VysockiyPetrVadimovich-111@agency.ru	PeVaVy-11119	etradimysoc11116	37	7
143	Игнатьев Владимир Евгеньевич	Коммерческая недвижимость	79299652666 	IgnatevVladimirEvgenevich-143@agency.ru	VlEvIg-14324	ladivgengnat14340	45	7
118	Васнецов Виктор Владимирович	Коммерческая недвижимость	79299079932 	VasnecovViktorVladimirovich-118@agency.ru	ViVlVa-11845	iktoladiasne11811	39	7
137	Круглов Антон Александрович	Коммерческая недвижимость	79291043261 	KruglovAntonAleksandrovich-137@agency.ru	AnAlKr-13756	ntonleksrugl13732	43	7
97	Новиков Геннадий Владимирович	Коммерческая недвижимость	79298601164 	NovikovGennadiyVladimirovich-97@agency.ru	GeVlNo-9742	ennaladiovik9752	33	7
96	Новиков Юрий Юрьевич	Жилая недвижимость	79297212699 	NovikovYuriyYurevich-96@agency.ru	YuYuNo-9647	uriyurevovik9649	33	7
112	Иванов Владимир Антонович	Жилая недвижимость	79292852836 	IvanovVladimirAntonovich-112@agency.ru	VlAnIv-11235	ladintonvano11236	37	7
52	Баранов Вадим Петрович	Коммерческая недвижимость	79294824974 	BaranovVadimPetrovich-52@agency.ru	VaPeBa-5294	adimetroaran5251	22	6
131	Романов Евгений Артёмович	Коммерческая недвижимость	79293212983 	RomanovEvgeniyArtemovich-131@agency.ru	EvArRo-13165	vgenrtemoman13167	42	7
130	Высоцкий Геннадий Дмитриевич	Жилая недвижимость	79292765087 	VysockiyGennadiyDmitrievich-130@agency.ru	GeDmVy-13074	ennamitrysoc13054	42	7
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
1	Генеральный директор	5
2	Руководитель отдела	5
3	Заместитель руководителя	5
4	Технический специалист	5
5	HR	1
6	Младший брокер	3
7	Брокер	4
8	Старший брокер	4
9	Менеджер	2
\.


--
-- Data for Name: property_dev; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_dev (id, name, number, email) FROM stdin;
1	ПИК	79293282157 	pik-official@pik.ru
2	Домстрой	79294937417 	domstroy-official@domstroy.ru
3	CapitalGroup	79291473040 	capitalgroup-official@capitalgroup.ru
4	Донстрой	79298691971 	donstroy-official@donstroy.ru
5	ФСК	79299643208 	fsk-official@fsk.ru
6	Удача	79290557759 	udacha-official@udacha.ru
7	Главстрой	79298711080 	glavstroy-official@glavstroy.ru
8	Группа Эталон	79296266381 	gruppa etalon-official@gruppa etalon.ru
9	Концерн Крост	79290785873 	koncern krost-official@koncern krost.ru
10	ГК-Пионер	79293110284 	gk-pioner-official@gk-pioner.ru
11	Интеко	79293200534 	inteko-official@inteko.ru
12	Инград	79293932310 	ingrad-official@ingrad.ru
13	МосРеалСтрой	79290942933 	mosrealstroy-official@mosrealstroy.ru
14	Каскад	79296541185 	kaskad-official@kaskad.ru
15	ГК-МИЦ	79298983082 	gk-mic-official@gk-mic.ru
16	Юнит	79296047774 	yunit-official@yunit.ru
17	Комстрин	79295475920 	komstrin-official@komstrin.ru
18	Скайгард	79295599226 	skaygard-official@skaygard.ru
19	Бесткон	79292165065 	bestkon-official@bestkon.ru
20	Астерра	79294704133 	asterra-official@asterra.ru
\.


--
-- Data for Name: real_estate_building; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_building (id, address, complex_id, floor_count, dev_id) FROM stdin;
1	г. Москва, ул. Красноармейская, д. 13	1	9	1
2	г. Москва, ул. Красноармейская, д. 14	1	9	1
3	г. Москва, ул. Красноармейская, д. 15	1	6	1
4	г. Москва, ул. Красноармейская, д. 16	1	7	1
5	г. Москва, ул. Красноармейская, д. 17	1	11	1
6	г. Москва, ул. Красноармейская, д. 18	1	8	1
7	г. Москва, ул. Красноармейская, д. 19	1	8	1
8	г. Москва, ул. Красноармейская, д. 20	1	10	1
9	г. Москва, ул. Красноармейская, д. 21	1	9	1
10	г. Москва, ул. Красноармейская, д. 22	1	10	1
11	г. Москва, ул. Красноармейская, д. 23	1	6	1
12	г. Москва, ул. Красноармейская, д. 24	1	9	1
13	г. Москва, ул. Красноармейская, д. 25	1	7	1
14	г. Москва, ул. Красноармейская, д. 26	1	8	1
15	г. Москва, ул. Донская, д. 27	3	10	2
16	г. Москва, ул. Донская, д. 28	3	9	2
17	г. Москва, ул. Донская, д. 29	3	10	2
18	г. Москва, ул. Донская, д. 30	3	9	2
19	г. Москва, ул. Донская, д. 31	3	8	2
20	г. Москва, ул. Донская, д. 32	3	11	2
21	г. Москва, ул. Донская, д. 33	3	10	2
22	г. Москва, ул. Донская, д. 34	3	8	2
23	г. Москва, ул. Донская, д. 35	3	10	2
24	г. Москва, ул. Донская, д. 36	3	11	2
25	г. Москва, ул. Донская, д. 37	3	8	2
26	г. Москва, ул. Донская, д. 38	3	7	2
27	г. Москва, ул. Донская, д. 39	3	11	2
28	г. Москва, ул. Донская, д. 40	3	8	2
29	г. Москва, ул. Донская, д. 41	3	8	2
30	г. Москва, ул. Донская, д. 42	3	6	2
31	г. Москва, ул. Донская, д. 43	3	10	2
32	г. Москва, ул. Донская, д. 44	3	7	2
33	г. Москва, ул. Донская, д. 45	3	6	2
34	г. Москва, ул. Донская, д. 46	3	7	2
35	г. Москва, ул. Донская, д. 47	3	11	2
36	г. Москва, ул. Донская, д. 48	3	9	2
37	г. Москва, ул. Донская, д. 49	3	11	2
38	г. Москва, ул. Донская, д. 50	3	8	2
39	г. Москва, ул. Донская, д. 51	3	8	2
40	г. Москва, ул. Донская, д. 52	3	11	2
41	г. Москва, ул. Донская, д. 53	3	7	2
\.


--
-- Data for Name: real_estate_complex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_complex (id, name, type, comfort_class) FROM stdin;
1	ONYX DELUXE	Жилой	Элитный
2	STELLAR CITY	Смешанный	Бизнес
3	SYMPHONY 34	Жилой	Премиум
4	Крылья	Жилой	Комфорт
5	Вереск	Жилой	Комфорт
6	HEADLINER	Коммерческий	Премиум
7	Новоковалёвское	Жилой	Стандарт
8	Павелецкая Сити	Жилой	Бизнес
9	VOXHALL	Смешанный	Премиум
10	Зиккурат	Жилой	Стандарт
11	Искра-парк	Коммерческий	Бизнес
12	I-CITY	Коммерческий	Премиум
13	Технопарк Алабушево	Смешанный	Элитный
14	Технопарк Орбита	Смешанный	Комфорт
15	Kutuzoff Tower	Коммерческий	Бизнес
16	Морозов	Коммерческий	Эконом
17	Око	Коммерческий	Стандарт
18	Белая площадь	Коммерческий	Элитный
19	Капитал	Коммерческий	Стандарт
20	Комсити	Коммерческий	Элитный
\.


--
-- Data for Name: real_estate_object; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_object (id, building_id, local_address, places, price, area, floor, type, estate_type) FROM stdin;
1	1	1	14	$506,000,000.00	2000	1	0	0
2	1	2	13	$842,000,000.00	2000	2	0	0
3	1	3	8	$375,000,000.00	2000	3	0	0
4	1	4	14	$421,000,000.00	2000	4	0	0
5	1	5	14	$489,000,000.00	2000	5	0	0
6	1	6	12	$806,000,000.00	2000	6	0	0
7	1	7	14	$356,000,000.00	2000	7	0	0
8	1	8	8	$809,000,000.00	2000	8	0	0
9	1	9	11	$725,000,000.00	2000	9	0	0
10	2	1	13	$468,000,000.00	2000	1	0	0
11	2	2	14	$662,000,000.00	2000	2	0	0
12	2	3	15	$784,000,000.00	2000	3	0	0
13	2	4	11	$506,000,000.00	2000	4	0	0
14	2	5	8	$781,000,000.00	2000	5	0	0
15	2	6	14	$319,000,000.00	2000	6	0	0
16	2	7	13	$582,000,000.00	2000	7	0	0
17	2	8	13	$470,000,000.00	2000	8	0	0
18	2	9	8	$678,000,000.00	2000	9	0	0
19	3	1	9	$835,000,000.00	2000	1	0	0
20	3	2	9	$579,000,000.00	2000	2	0	0
21	3	3	8	$404,000,000.00	2000	3	0	0
22	3	4	13	$437,000,000.00	2000	4	0	0
23	3	5	9	$665,000,000.00	2000	5	0	0
24	3	6	14	$750,000,000.00	2000	6	0	0
25	4	1	14	$634,000,000.00	2000	1	0	0
26	4	2	13	$642,000,000.00	2000	2	0	0
27	4	3	12	$454,000,000.00	2000	3	0	0
28	4	4	15	$301,000,000.00	2000	4	0	0
29	4	5	12	$686,000,000.00	2000	5	0	0
30	4	6	13	$590,000,000.00	2000	6	0	0
31	4	7	15	$576,000,000.00	2000	7	0	0
32	5	1	12	$485,000,000.00	2000	1	0	0
33	5	2	9	$672,000,000.00	2000	2	0	0
34	5	3	15	$456,000,000.00	2000	3	0	0
35	5	4	14	$525,000,000.00	2000	4	0	0
36	5	5	11	$672,000,000.00	2000	5	0	0
37	5	6	10	$771,000,000.00	2000	6	0	0
38	5	7	14	$622,000,000.00	2000	7	0	0
39	5	8	11	$735,000,000.00	2000	8	0	0
40	5	9	9	$453,000,000.00	2000	9	0	0
41	5	10	14	$534,000,000.00	2000	10	0	0
42	5	11	11	$371,000,000.00	2000	11	0	0
43	6	1	11	$761,000,000.00	2000	1	0	0
44	6	2	15	$709,000,000.00	2000	2	0	0
45	6	3	13	$410,000,000.00	2000	3	0	0
46	6	4	9	$676,000,000.00	2000	4	0	0
47	6	5	12	$320,000,000.00	2000	5	0	0
48	6	6	13	$324,000,000.00	2000	6	0	0
49	6	7	11	$711,000,000.00	2000	7	0	0
50	6	8	12	$482,000,000.00	2000	8	0	0
51	7	1	11	$716,000,000.00	2000	1	0	0
52	7	2	12	$479,000,000.00	2000	2	0	0
53	7	3	11	$461,000,000.00	2000	3	0	0
54	7	4	9	$561,000,000.00	2000	4	0	0
55	7	5	10	$494,000,000.00	2000	5	0	0
56	7	6	10	$721,000,000.00	2000	6	0	0
57	7	7	15	$722,000,000.00	2000	7	0	0
58	7	8	12	$384,000,000.00	2000	8	0	0
59	8	1	14	$685,000,000.00	2000	1	0	0
60	8	2	15	$464,000,000.00	2000	2	0	0
61	8	3	9	$718,000,000.00	2000	3	0	0
62	8	4	13	$678,000,000.00	2000	4	0	0
63	8	5	14	$395,000,000.00	2000	5	0	0
64	8	6	13	$808,000,000.00	2000	6	0	0
65	8	7	9	$368,000,000.00	2000	7	0	0
66	8	8	8	$376,000,000.00	2000	8	0	0
67	8	9	9	$847,000,000.00	2000	9	0	0
68	8	10	8	$769,000,000.00	2000	10	0	0
69	9	1	12	$516,000,000.00	2000	1	0	0
70	9	2	13	$705,000,000.00	2000	2	0	0
71	9	3	11	$693,000,000.00	2000	3	0	0
72	9	4	14	$810,000,000.00	2000	4	0	0
73	9	5	8	$729,000,000.00	2000	5	0	0
74	9	6	14	$468,000,000.00	2000	6	0	0
75	9	7	9	$345,000,000.00	2000	7	0	0
76	9	8	10	$824,000,000.00	2000	8	0	0
77	9	9	11	$310,000,000.00	2000	9	0	0
78	10	1	11	$500,000,000.00	2000	1	0	0
79	10	2	11	$768,000,000.00	2000	2	0	0
80	10	3	11	$804,000,000.00	2000	3	0	0
81	10	4	11	$356,000,000.00	2000	4	0	0
82	10	5	14	$647,000,000.00	2000	5	0	0
83	10	6	11	$350,000,000.00	2000	6	0	0
84	10	7	13	$544,000,000.00	2000	7	0	0
85	10	8	14	$402,000,000.00	2000	8	0	0
86	10	9	14	$454,000,000.00	2000	9	0	0
87	10	10	10	$312,000,000.00	2000	10	0	0
88	11	1	8	$333,000,000.00	2000	1	0	0
89	11	2	12	$544,000,000.00	2000	2	0	0
90	11	3	15	$718,000,000.00	2000	3	0	0
91	11	4	15	$313,000,000.00	2000	4	0	0
92	11	5	8	$355,000,000.00	2000	5	0	0
93	11	6	9	$691,000,000.00	2000	6	0	0
94	12	1	10	$698,000,000.00	2000	1	0	0
95	12	2	10	$377,000,000.00	2000	2	0	0
96	12	3	13	$630,000,000.00	2000	3	0	0
97	12	4	14	$639,000,000.00	2000	4	0	0
98	12	5	12	$578,000,000.00	2000	5	0	0
99	12	6	13	$710,000,000.00	2000	6	0	0
100	12	7	15	$427,000,000.00	2000	7	0	0
101	12	8	13	$528,000,000.00	2000	8	0	0
102	12	9	13	$483,000,000.00	2000	9	0	0
103	13	1	12	$503,000,000.00	2000	1	0	0
104	13	2	8	$474,000,000.00	2000	2	0	0
105	13	3	14	$765,000,000.00	2000	3	0	0
106	13	4	11	$581,000,000.00	2000	4	0	0
107	13	5	14	$831,000,000.00	2000	5	0	0
108	13	6	9	$496,000,000.00	2000	6	0	0
109	13	7	14	$688,000,000.00	2000	7	0	0
110	14	1	13	$581,000,000.00	2000	1	0	0
111	14	2	15	$816,000,000.00	2000	2	0	0
112	14	3	11	$565,000,000.00	2000	3	0	0
113	14	4	11	$798,000,000.00	2000	4	0	0
114	14	5	9	$439,000,000.00	2000	5	0	0
115	14	6	8	$703,000,000.00	2000	6	0	0
116	14	7	9	$491,000,000.00	2000	7	0	0
117	14	8	9	$637,000,000.00	2000	8	0	0
118	15	1	8	$315,000,000.00	210	1	0	0
119	15	2	7	$154,000,000.00	160	1	0	0
120	15	3	6	$317,000,000.00	140	2	0	0
121	15	4	7	$263,000,000.00	180	2	0	0
122	15	5	5	$212,000,000.00	140	3	0	0
123	15	6	8	$261,000,000.00	120	3	0	0
124	15	7	7	$345,000,000.00	290	4	0	0
125	15	8	6	$208,000,000.00	240	4	0	0
126	15	9	8	$398,000,000.00	140	5	0	0
127	15	10	5	$299,000,000.00	300	5	0	0
128	15	11	6	$220,000,000.00	120	6	0	0
129	15	12	5	$376,000,000.00	110	6	0	0
130	15	13	7	$295,000,000.00	190	7	0	0
131	15	14	7	$220,000,000.00	100	7	0	0
132	15	15	6	$377,000,000.00	300	8	0	0
133	15	16	5	$266,000,000.00	150	8	0	0
134	15	17	6	$364,000,000.00	150	9	0	0
135	15	18	8	$256,000,000.00	220	9	0	0
136	15	19	5	$166,000,000.00	180	10	0	0
137	15	20	6	$208,000,000.00	120	10	0	0
138	16	1	7	$232,000,000.00	100	1	0	0
139	16	2	8	$194,000,000.00	120	1	0	0
140	16	3	7	$350,000,000.00	250	2	0	0
141	16	4	7	$289,000,000.00	190	2	0	0
142	16	5	7	$313,000,000.00	210	3	0	0
143	16	6	7	$229,000,000.00	180	3	0	0
144	16	7	8	$153,000,000.00	180	4	0	0
145	16	8	8	$156,000,000.00	140	4	0	0
146	16	9	5	$364,000,000.00	220	5	0	0
147	16	10	6	$393,000,000.00	230	5	0	0
148	16	11	7	$254,000,000.00	300	6	0	0
149	16	12	5	$221,000,000.00	240	6	0	0
150	16	13	8	$240,000,000.00	150	7	0	0
151	16	14	8	$162,000,000.00	110	7	0	0
152	16	15	7	$195,000,000.00	220	8	0	0
153	16	16	8	$289,000,000.00	170	8	0	0
154	16	17	8	$313,000,000.00	100	9	0	0
155	16	18	5	$221,000,000.00	120	9	0	0
156	17	1	5	$265,000,000.00	230	1	0	0
157	17	2	6	$237,000,000.00	110	1	0	0
158	17	3	6	$277,000,000.00	290	2	0	0
159	17	4	7	$280,000,000.00	130	2	0	0
160	17	5	8	$269,000,000.00	190	3	0	0
161	17	6	6	$164,000,000.00	200	3	0	0
162	17	7	6	$351,000,000.00	120	4	0	0
163	17	8	7	$179,000,000.00	280	4	0	0
164	17	9	5	$367,000,000.00	200	5	0	0
165	17	10	8	$322,000,000.00	240	5	0	0
166	17	11	8	$341,000,000.00	240	6	0	0
167	17	12	6	$389,000,000.00	270	6	0	0
168	17	13	5	$180,000,000.00	120	7	0	0
169	17	14	8	$244,000,000.00	160	7	0	0
170	17	15	8	$241,000,000.00	130	8	0	0
171	17	16	7	$294,000,000.00	120	8	0	0
172	17	17	7	$385,000,000.00	220	9	0	0
173	17	18	7	$296,000,000.00	200	9	0	0
174	17	19	7	$360,000,000.00	200	10	0	0
175	17	20	5	$268,000,000.00	110	10	0	0
176	18	1	7	$261,000,000.00	230	1	0	0
177	18	2	5	$336,000,000.00	210	1	0	0
178	18	3	7	$364,000,000.00	200	2	0	0
179	18	4	6	$185,000,000.00	160	2	0	0
180	18	5	8	$332,000,000.00	160	3	0	0
181	18	6	7	$336,000,000.00	140	3	0	0
182	18	7	5	$206,000,000.00	160	4	0	0
183	18	8	6	$366,000,000.00	240	4	0	0
184	18	9	7	$187,000,000.00	220	5	0	0
185	18	10	6	$213,000,000.00	130	5	0	0
186	18	11	5	$177,000,000.00	230	6	0	0
187	18	12	5	$259,000,000.00	180	6	0	0
188	18	13	5	$203,000,000.00	150	7	0	0
189	18	14	8	$316,000,000.00	160	7	0	0
190	18	15	5	$185,000,000.00	240	8	0	0
191	18	16	5	$355,000,000.00	200	8	0	0
192	18	17	7	$390,000,000.00	210	9	0	0
193	18	18	6	$273,000,000.00	170	9	0	0
194	19	1	6	$247,000,000.00	250	1	0	0
195	19	2	7	$296,000,000.00	270	1	0	0
196	19	3	5	$223,000,000.00	110	2	0	0
197	19	4	7	$295,000,000.00	280	2	0	0
198	19	5	5	$186,000,000.00	290	3	0	0
199	19	6	7	$227,000,000.00	100	3	0	0
200	19	7	5	$200,000,000.00	300	4	0	0
201	19	8	8	$241,000,000.00	130	4	0	0
202	19	9	5	$197,000,000.00	100	5	0	0
203	19	10	7	$313,000,000.00	150	5	0	0
204	19	11	6	$168,000,000.00	110	6	0	0
205	19	12	5	$163,000,000.00	180	6	0	0
206	19	13	8	$278,000,000.00	200	7	0	0
207	19	14	5	$299,000,000.00	110	7	0	0
208	19	15	8	$297,000,000.00	190	8	0	0
209	19	16	7	$345,000,000.00	130	8	0	0
210	20	1	8	$227,000,000.00	300	1	0	0
211	20	2	7	$324,000,000.00	190	1	0	0
212	20	3	6	$247,000,000.00	250	2	0	0
213	20	4	8	$246,000,000.00	250	2	0	0
214	20	5	6	$160,000,000.00	150	3	0	0
215	20	6	5	$210,000,000.00	270	3	0	0
216	20	7	5	$376,000,000.00	280	4	0	0
217	20	8	5	$243,000,000.00	160	4	0	0
218	20	9	8	$240,000,000.00	110	5	0	0
219	20	10	5	$284,000,000.00	300	5	0	0
220	20	11	5	$219,000,000.00	100	6	0	0
221	20	12	8	$209,000,000.00	150	6	0	0
222	20	13	7	$215,000,000.00	150	7	0	0
223	20	14	5	$225,000,000.00	180	7	0	0
224	20	15	5	$371,000,000.00	200	8	0	0
225	20	16	5	$305,000,000.00	140	8	0	0
226	20	17	8	$245,000,000.00	280	9	0	0
227	20	18	8	$230,000,000.00	150	9	0	0
228	20	19	7	$209,000,000.00	190	10	0	0
229	20	20	7	$338,000,000.00	300	10	0	0
230	20	21	5	$297,000,000.00	150	11	0	0
231	20	22	7	$390,000,000.00	160	11	0	0
232	21	1	6	$173,000,000.00	150	1	0	0
233	21	2	8	$226,000,000.00	100	1	0	0
234	21	3	6	$317,000,000.00	260	2	0	0
235	21	4	8	$230,000,000.00	180	2	0	0
236	21	5	7	$220,000,000.00	100	3	0	0
237	21	6	6	$375,000,000.00	190	3	0	0
238	21	7	5	$188,000,000.00	210	4	0	0
239	21	8	7	$207,000,000.00	300	4	0	0
240	21	9	7	$198,000,000.00	150	5	0	0
241	21	10	7	$164,000,000.00	290	5	0	0
242	21	11	8	$398,000,000.00	270	6	0	0
243	21	12	8	$306,000,000.00	180	6	0	0
244	21	13	6	$255,000,000.00	110	7	0	0
245	21	14	8	$336,000,000.00	180	7	0	0
246	21	15	7	$198,000,000.00	180	8	0	0
247	21	16	5	$288,000,000.00	290	8	0	0
248	21	17	6	$286,000,000.00	100	9	0	0
249	21	18	7	$360,000,000.00	290	9	0	0
250	21	19	6	$219,000,000.00	270	10	0	0
251	21	20	8	$218,000,000.00	230	10	0	0
252	22	1	5	$367,000,000.00	240	1	0	0
253	22	2	7	$326,000,000.00	200	1	0	0
254	22	3	8	$256,000,000.00	180	2	0	0
255	22	4	8	$206,000,000.00	270	2	0	0
256	22	5	8	$196,000,000.00	180	3	0	0
257	22	6	6	$179,000,000.00	260	3	0	0
258	22	7	7	$326,000,000.00	270	4	0	0
259	22	8	7	$254,000,000.00	130	4	0	0
260	22	9	5	$219,000,000.00	230	5	0	0
261	22	10	6	$225,000,000.00	120	5	0	0
262	22	11	6	$324,000,000.00	250	6	0	0
263	22	12	6	$181,000,000.00	280	6	0	0
264	22	13	6	$177,000,000.00	190	7	0	0
265	22	14	6	$387,000,000.00	150	7	0	0
266	22	15	7	$170,000,000.00	280	8	0	0
267	22	16	5	$206,000,000.00	240	8	0	0
268	23	1	6	$187,000,000.00	110	1	0	0
269	23	2	7	$153,000,000.00	280	1	0	0
270	23	3	7	$202,000,000.00	180	2	0	0
271	23	4	7	$154,000,000.00	300	2	0	0
272	23	5	5	$314,000,000.00	290	3	0	0
273	23	6	6	$201,000,000.00	160	3	0	0
274	23	7	8	$381,000,000.00	220	4	0	0
275	23	8	7	$347,000,000.00	140	4	0	0
276	23	9	7	$274,000,000.00	300	5	0	0
277	23	10	7	$182,000,000.00	180	5	0	0
278	23	11	8	$304,000,000.00	280	6	0	0
279	23	12	6	$378,000,000.00	160	6	0	0
280	23	13	7	$179,000,000.00	200	7	0	0
281	23	14	8	$238,000,000.00	100	7	0	0
282	23	15	7	$268,000,000.00	190	8	0	0
283	23	16	5	$191,000,000.00	240	8	0	0
284	23	17	8	$224,000,000.00	240	9	0	0
285	23	18	8	$347,000,000.00	200	9	0	0
286	23	19	6	$303,000,000.00	140	10	0	0
287	23	20	8	$343,000,000.00	150	10	0	0
288	24	1	6	$340,000,000.00	190	1	0	0
289	24	2	7	$306,000,000.00	190	1	0	0
290	24	3	5	$274,000,000.00	130	2	0	0
291	24	4	6	$274,000,000.00	140	2	0	0
292	24	5	6	$187,000,000.00	100	3	0	0
293	24	6	5	$332,000,000.00	120	3	0	0
294	24	7	6	$176,000,000.00	100	4	0	0
295	24	8	5	$337,000,000.00	130	4	0	0
296	24	9	5	$378,000,000.00	220	5	0	0
297	24	10	5	$169,000,000.00	110	5	0	0
298	24	11	5	$349,000,000.00	300	6	0	0
299	24	12	6	$384,000,000.00	110	6	0	0
300	24	13	7	$380,000,000.00	240	7	0	0
301	24	14	6	$299,000,000.00	250	7	0	0
302	24	15	6	$175,000,000.00	120	8	0	0
303	24	16	5	$315,000,000.00	300	8	0	0
304	24	17	6	$190,000,000.00	120	9	0	0
305	24	18	6	$384,000,000.00	190	9	0	0
306	24	19	8	$317,000,000.00	220	10	0	0
307	24	20	7	$274,000,000.00	180	10	0	0
308	24	21	8	$367,000,000.00	110	11	0	0
309	24	22	5	$194,000,000.00	160	11	0	0
310	25	1	5	$332,000,000.00	230	1	0	0
311	25	2	8	$168,000,000.00	200	1	0	0
312	25	3	5	$368,000,000.00	110	2	0	0
313	25	4	6	$210,000,000.00	200	2	0	0
314	25	5	8	$310,000,000.00	230	3	0	0
315	25	6	5	$254,000,000.00	170	3	0	0
316	25	7	7	$321,000,000.00	280	4	0	0
317	25	8	8	$220,000,000.00	150	4	0	0
318	25	9	7	$330,000,000.00	160	5	0	0
319	25	10	8	$383,000,000.00	150	5	0	0
320	25	11	6	$188,000,000.00	140	6	0	0
321	25	12	5	$310,000,000.00	120	6	0	0
322	25	13	6	$379,000,000.00	130	7	0	0
323	25	14	8	$313,000,000.00	270	7	0	0
324	25	15	7	$200,000,000.00	300	8	0	0
325	25	16	6	$215,000,000.00	190	8	0	0
326	26	1	6	$316,000,000.00	220	1	0	0
327	26	2	6	$231,000,000.00	180	1	0	0
328	26	3	6	$201,000,000.00	140	2	0	0
329	26	4	5	$250,000,000.00	170	2	0	0
330	26	5	7	$327,000,000.00	170	3	0	0
331	26	6	5	$154,000,000.00	230	3	0	0
332	26	7	8	$228,000,000.00	220	4	0	0
333	26	8	7	$333,000,000.00	190	4	0	0
334	26	9	6	$332,000,000.00	180	5	0	0
335	26	10	8	$253,000,000.00	150	5	0	0
336	26	11	6	$175,000,000.00	280	6	0	0
337	26	12	7	$329,000,000.00	190	6	0	0
338	26	13	6	$340,000,000.00	120	7	0	0
339	26	14	5	$215,000,000.00	260	7	0	0
340	27	1	6	$277,000,000.00	120	1	0	0
341	27	2	6	$227,000,000.00	260	1	0	0
342	27	3	5	$354,000,000.00	130	2	0	0
343	27	4	6	$327,000,000.00	240	2	0	0
344	27	5	7	$170,000,000.00	110	3	0	0
345	27	6	8	$170,000,000.00	170	3	0	0
346	27	7	8	$229,000,000.00	110	4	0	0
347	27	8	6	$205,000,000.00	230	4	0	0
348	27	9	6	$218,000,000.00	290	5	0	0
349	27	10	5	$212,000,000.00	130	5	0	0
350	27	11	7	$233,000,000.00	280	6	0	0
351	27	12	8	$321,000,000.00	290	6	0	0
352	27	13	5	$387,000,000.00	250	7	0	0
353	27	14	8	$193,000,000.00	210	7	0	0
354	27	15	6	$371,000,000.00	200	8	0	0
355	27	16	7	$218,000,000.00	240	8	0	0
356	27	17	5	$381,000,000.00	120	9	0	0
357	27	18	7	$334,000,000.00	180	9	0	0
358	27	19	8	$283,000,000.00	230	10	0	0
359	27	20	8	$346,000,000.00	230	10	0	0
360	27	21	6	$269,000,000.00	230	11	0	0
361	27	22	7	$396,000,000.00	250	11	0	0
362	28	1	5	$245,000,000.00	120	1	0	0
363	28	2	8	$269,000,000.00	190	1	0	0
364	28	3	8	$256,000,000.00	300	2	0	0
365	28	4	7	$204,000,000.00	270	2	0	0
366	28	5	8	$376,000,000.00	290	3	0	0
367	28	6	5	$316,000,000.00	170	3	0	0
368	28	7	6	$392,000,000.00	180	4	0	0
369	28	8	8	$368,000,000.00	150	4	0	0
370	28	9	8	$159,000,000.00	300	5	0	0
371	28	10	7	$186,000,000.00	260	5	0	0
372	28	11	8	$152,000,000.00	250	6	0	0
373	28	12	6	$277,000,000.00	250	6	0	0
374	28	13	7	$189,000,000.00	200	7	0	0
375	28	14	7	$248,000,000.00	100	7	0	0
376	28	15	5	$182,000,000.00	240	8	0	0
377	28	16	8	$154,000,000.00	260	8	0	0
378	29	1	5	$367,000,000.00	220	1	0	0
379	29	2	5	$325,000,000.00	250	1	0	0
380	29	3	6	$264,000,000.00	200	2	0	0
381	29	4	5	$200,000,000.00	150	2	0	0
382	29	5	7	$254,000,000.00	120	3	0	0
383	29	6	6	$343,000,000.00	300	3	0	0
384	29	7	6	$268,000,000.00	300	4	0	0
385	29	8	8	$386,000,000.00	170	4	0	0
386	29	9	8	$203,000,000.00	190	5	0	0
387	29	10	5	$399,000,000.00	190	5	0	0
388	29	11	8	$311,000,000.00	200	6	0	0
389	29	12	7	$266,000,000.00	230	6	0	0
390	29	13	8	$211,000,000.00	140	7	0	0
391	29	14	8	$300,000,000.00	130	7	0	0
392	29	15	5	$341,000,000.00	160	8	0	0
393	29	16	6	$398,000,000.00	190	8	0	0
394	30	1	7	$255,000,000.00	250	1	0	0
395	30	2	6	$336,000,000.00	270	1	0	0
396	30	3	6	$232,000,000.00	200	2	0	0
397	30	4	8	$210,000,000.00	220	2	0	0
398	30	5	5	$212,000,000.00	150	3	0	0
399	30	6	8	$162,000,000.00	180	3	0	0
400	30	7	6	$164,000,000.00	260	4	0	0
401	30	8	5	$171,000,000.00	300	4	0	0
402	30	9	7	$328,000,000.00	280	5	0	0
403	30	10	8	$384,000,000.00	140	5	0	0
404	30	11	6	$221,000,000.00	280	6	0	0
405	30	12	8	$161,000,000.00	260	6	0	0
406	31	1	7	$330,000,000.00	290	1	0	0
407	31	2	7	$323,000,000.00	270	1	0	0
408	31	3	7	$392,000,000.00	300	2	0	0
409	31	4	7	$349,000,000.00	140	2	0	0
410	31	5	5	$384,000,000.00	110	3	0	0
411	31	6	7	$261,000,000.00	110	3	0	0
412	31	7	7	$344,000,000.00	190	4	0	0
413	31	8	5	$213,000,000.00	250	4	0	0
414	31	9	7	$270,000,000.00	300	5	0	0
415	31	10	7	$360,000,000.00	200	5	0	0
416	31	11	8	$302,000,000.00	160	6	0	0
417	31	12	8	$217,000,000.00	130	6	0	0
418	31	13	5	$253,000,000.00	160	7	0	0
419	31	14	6	$222,000,000.00	150	7	0	0
420	31	15	7	$336,000,000.00	160	8	0	0
421	31	16	7	$339,000,000.00	120	8	0	0
422	31	17	6	$307,000,000.00	210	9	0	0
423	31	18	5	$336,000,000.00	240	9	0	0
424	31	19	7	$328,000,000.00	290	10	0	0
425	31	20	7	$221,000,000.00	140	10	0	0
426	32	1	8	$244,000,000.00	200	1	0	0
427	32	2	7	$316,000,000.00	270	1	0	0
428	32	3	8	$281,000,000.00	130	2	0	0
429	32	4	7	$358,000,000.00	260	2	0	0
430	32	5	8	$204,000,000.00	190	3	0	0
431	32	6	7	$167,000,000.00	210	3	0	0
432	32	7	8	$157,000,000.00	180	4	0	0
433	32	8	7	$329,000,000.00	270	4	0	0
434	32	9	5	$195,000,000.00	100	5	0	0
435	32	10	5	$185,000,000.00	160	5	0	0
436	32	11	6	$343,000,000.00	200	6	0	0
437	32	12	8	$329,000,000.00	190	6	0	0
438	32	13	5	$378,000,000.00	230	7	0	0
439	32	14	6	$242,000,000.00	270	7	0	0
440	33	1	8	$228,000,000.00	150	1	0	0
441	33	2	7	$372,000,000.00	300	1	0	0
442	33	3	6	$320,000,000.00	260	2	0	0
443	33	4	5	$355,000,000.00	290	2	0	0
444	33	5	5	$222,000,000.00	290	3	0	0
445	33	6	5	$354,000,000.00	160	3	0	0
446	33	7	5	$231,000,000.00	230	4	0	0
447	33	8	8	$288,000,000.00	250	4	0	0
448	33	9	7	$289,000,000.00	130	5	0	0
449	33	10	8	$263,000,000.00	230	5	0	0
450	33	11	7	$162,000,000.00	200	6	0	0
451	33	12	8	$189,000,000.00	180	6	0	0
452	34	1	8	$297,000,000.00	130	1	0	0
453	34	2	8	$166,000,000.00	240	1	0	0
454	34	3	8	$324,000,000.00	180	2	0	0
455	34	4	6	$352,000,000.00	140	2	0	0
456	34	5	5	$366,000,000.00	270	3	0	0
457	34	6	5	$191,000,000.00	220	3	0	0
458	34	7	6	$354,000,000.00	190	4	0	0
459	34	8	6	$361,000,000.00	170	4	0	0
460	34	9	6	$184,000,000.00	180	5	0	0
461	34	10	5	$164,000,000.00	170	5	0	0
462	34	11	6	$165,000,000.00	260	6	0	0
463	34	12	7	$383,000,000.00	290	6	0	0
464	34	13	5	$390,000,000.00	290	7	0	0
465	34	14	8	$200,000,000.00	230	7	0	0
466	35	1	5	$190,000,000.00	190	1	0	0
467	35	2	6	$265,000,000.00	220	1	0	0
468	35	3	5	$217,000,000.00	180	2	0	0
469	35	4	6	$283,000,000.00	110	2	0	0
470	35	5	6	$261,000,000.00	190	3	0	0
471	35	6	8	$325,000,000.00	300	3	0	0
472	35	7	6	$154,000,000.00	100	4	0	0
473	35	8	8	$369,000,000.00	140	4	0	0
474	35	9	7	$214,000,000.00	270	5	0	0
475	35	10	5	$259,000,000.00	270	5	0	0
476	35	11	7	$306,000,000.00	290	6	0	0
477	35	12	8	$163,000,000.00	250	6	0	0
478	35	13	5	$159,000,000.00	260	7	0	0
479	35	14	6	$327,000,000.00	110	7	0	0
480	35	15	7	$168,000,000.00	110	8	0	0
481	35	16	5	$365,000,000.00	190	8	0	0
482	35	17	7	$347,000,000.00	150	9	0	0
483	35	18	5	$341,000,000.00	200	9	0	0
484	35	19	5	$235,000,000.00	160	10	0	0
485	35	20	6	$185,000,000.00	250	10	0	0
486	35	21	6	$218,000,000.00	230	11	0	0
487	35	22	8	$226,000,000.00	220	11	0	0
488	36	1	7	$283,000,000.00	150	1	0	0
489	36	2	8	$290,000,000.00	180	1	0	0
490	36	3	8	$325,000,000.00	210	2	0	0
491	36	4	5	$228,000,000.00	180	2	0	0
492	36	5	7	$304,000,000.00	180	3	0	0
493	36	6	7	$234,000,000.00	210	3	0	0
494	36	7	8	$223,000,000.00	230	4	0	0
495	36	8	8	$211,000,000.00	220	4	0	0
496	36	9	7	$160,000,000.00	170	5	0	0
497	36	10	5	$381,000,000.00	280	5	0	0
498	36	11	5	$202,000,000.00	190	6	0	0
499	36	12	5	$191,000,000.00	260	6	0	0
500	36	13	7	$385,000,000.00	180	7	0	0
501	36	14	5	$213,000,000.00	190	7	0	0
502	36	15	7	$384,000,000.00	230	8	0	0
503	36	16	5	$335,000,000.00	280	8	0	0
504	36	17	5	$268,000,000.00	170	9	0	0
505	36	18	5	$267,000,000.00	200	9	0	0
506	37	1	6	$291,000,000.00	240	1	0	0
507	37	2	7	$324,000,000.00	200	1	0	0
508	37	3	5	$155,000,000.00	150	2	0	0
509	37	4	8	$384,000,000.00	120	2	0	0
510	37	5	8	$369,000,000.00	170	3	0	0
511	37	6	5	$245,000,000.00	100	3	0	0
512	37	7	7	$313,000,000.00	180	4	0	0
513	37	8	5	$357,000,000.00	180	4	0	0
514	37	9	7	$165,000,000.00	180	5	0	0
515	37	10	5	$316,000,000.00	150	5	0	0
516	37	11	8	$213,000,000.00	160	6	0	0
517	37	12	5	$242,000,000.00	150	6	0	0
518	37	13	5	$207,000,000.00	110	7	0	0
519	37	14	5	$161,000,000.00	240	7	0	0
520	37	15	6	$363,000,000.00	190	8	0	0
521	37	16	6	$229,000,000.00	190	8	0	0
522	37	17	7	$261,000,000.00	290	9	0	0
523	37	18	6	$293,000,000.00	100	9	0	0
524	37	19	7	$385,000,000.00	200	10	0	0
525	37	20	5	$354,000,000.00	280	10	0	0
526	37	21	5	$332,000,000.00	230	11	0	0
527	37	22	5	$212,000,000.00	170	11	0	0
528	38	1	5	$258,000,000.00	110	1	0	0
529	38	2	5	$386,000,000.00	240	1	0	0
530	38	3	7	$254,000,000.00	210	2	0	0
531	38	4	8	$192,000,000.00	170	2	0	0
532	38	5	6	$294,000,000.00	280	3	0	0
533	38	6	5	$257,000,000.00	270	3	0	0
534	38	7	8	$259,000,000.00	300	4	0	0
535	38	8	8	$161,000,000.00	220	4	0	0
536	38	9	8	$394,000,000.00	230	5	0	0
537	38	10	6	$313,000,000.00	250	5	0	0
538	38	11	8	$222,000,000.00	300	6	0	0
539	38	12	5	$394,000,000.00	130	6	0	0
540	38	13	6	$328,000,000.00	130	7	0	0
541	38	14	7	$396,000,000.00	170	7	0	0
542	38	15	8	$392,000,000.00	200	8	0	0
543	38	16	6	$242,000,000.00	110	8	0	0
544	39	1	7	$170,000,000.00	110	1	0	0
545	39	2	6	$271,000,000.00	180	1	0	0
546	39	3	7	$150,000,000.00	220	2	0	0
547	39	4	5	$170,000,000.00	200	2	0	0
548	39	5	7	$381,000,000.00	300	3	0	0
549	39	6	5	$181,000,000.00	250	3	0	0
550	39	7	5	$230,000,000.00	190	4	0	0
551	39	8	5	$295,000,000.00	110	4	0	0
552	39	9	5	$244,000,000.00	180	5	0	0
553	39	10	6	$361,000,000.00	230	5	0	0
554	39	11	5	$302,000,000.00	190	6	0	0
555	39	12	7	$333,000,000.00	100	6	0	0
556	39	13	5	$257,000,000.00	190	7	0	0
557	39	14	5	$189,000,000.00	100	7	0	0
558	39	15	5	$282,000,000.00	200	8	0	0
559	39	16	5	$256,000,000.00	240	8	0	0
560	40	1	6	$303,000,000.00	240	1	0	0
561	40	2	6	$204,000,000.00	280	1	0	0
562	40	3	7	$302,000,000.00	100	2	0	0
563	40	4	7	$260,000,000.00	170	2	0	0
564	40	5	6	$393,000,000.00	260	3	0	0
565	40	6	8	$194,000,000.00	300	3	0	0
566	40	7	7	$213,000,000.00	200	4	0	0
567	40	8	5	$315,000,000.00	120	4	0	0
568	40	9	5	$186,000,000.00	300	5	0	0
569	40	10	8	$275,000,000.00	180	5	0	0
570	40	11	6	$266,000,000.00	100	6	0	0
571	40	12	5	$298,000,000.00	290	6	0	0
572	40	13	7	$204,000,000.00	140	7	0	0
573	40	14	5	$350,000,000.00	270	7	0	0
574	40	15	6	$317,000,000.00	160	8	0	0
575	40	16	7	$183,000,000.00	300	8	0	0
576	40	17	7	$291,000,000.00	250	9	0	0
577	40	18	7	$386,000,000.00	180	9	0	0
578	40	19	5	$212,000,000.00	260	10	0	0
579	40	20	7	$157,000,000.00	190	10	0	0
580	40	21	8	$273,000,000.00	250	11	0	0
581	40	22	8	$156,000,000.00	140	11	0	0
582	41	1	7	$247,000,000.00	220	1	0	0
583	41	2	7	$215,000,000.00	220	1	0	0
584	41	3	8	$182,000,000.00	150	2	0	0
585	41	4	8	$164,000,000.00	190	2	0	0
586	41	5	6	$306,000,000.00	280	3	0	0
587	41	6	7	$302,000,000.00	290	3	0	0
588	41	7	6	$187,000,000.00	210	4	0	0
589	41	8	6	$183,000,000.00	100	4	0	0
590	41	9	5	$391,000,000.00	300	5	0	0
591	41	10	5	$283,000,000.00	190	5	0	0
592	41	11	6	$201,000,000.00	290	6	0	0
593	41	12	7	$387,000,000.00	130	6	0	0
594	41	13	5	$191,000,000.00	130	7	0	0
595	41	14	8	$169,000,000.00	300	7	0	0
\.


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 1, false);


--
-- Name: deal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deal_id_seq', 1, false);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 1, false);


--
-- Name: position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_id_seq', 9, true);


--
-- Name: property_dev_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_dev_id_seq', 1, false);


--
-- Name: real_estate_building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.real_estate_building_id_seq', 1, false);


--
-- Name: real_estate_complex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.real_estate_complex_id_seq', 20, true);


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
-- Name: real_estate_building real_estate_building_dev_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.real_estate_building
    ADD CONSTRAINT real_estate_building_dev_id_fkey FOREIGN KEY (dev_id) REFERENCES public.property_dev(id);


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

