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
\.


--
-- Data for Name: real_estate_building; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.real_estate_building (id, address, complex_id, floor_count, dev_id) FROM stdin;
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

SELECT pg_catalog.setval('public.real_estate_complex_id_seq', 1, false);


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
    ADD CONSTRAINT mtm_employee_deal_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.client(id) ON DELETE CASCADE;


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

