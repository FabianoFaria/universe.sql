--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30),
    catalog_international_id integer,
    order_discovery integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_types text,
    order_discovery integer DEFAULT 0 NOT NULL,
    dicovered_by text,
    catalog_international_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    is_spherical integer,
    planet_id integer,
    order_discovery integer DEFAULT 0 NOT NULL,
    dicovered_by text,
    catalog_international_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    has_water boolean,
    is_gas_form boolean,
    has_life integer,
    star_id integer,
    dicovered_by text,
    order_discovery integer DEFAULT 0 NOT NULL,
    catalog_international_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years numeric,
    galaxy_id integer,
    dicovered_by text,
    order_discovery integer DEFAULT 0 NOT NULL,
    catalog_international_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Bremiker', NULL, 0);
INSERT INTO public.comet VALUES (2, 'Grande Cometa de 1843', NULL, 0);
INSERT INTO public.comet VALUES (3, 'Brorsen', NULL, 0);
INSERT INTO public.comet VALUES (4, 'Schweizer', NULL, 0);
INSERT INTO public.comet VALUES (5, 'Donati', NULL, 0);
INSERT INTO public.comet VALUES (6, 'Pons', NULL, 0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andrômeda', 'via lactea', 0, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Galáxia Olho Negro', 'Coma Berenices', 0, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Galáxia de Bode', 'Ursa Major', 0, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Galáxia Cartwheel', 'via lactea', 0, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Galáxia Charuto', 'Coma Berenices', 0, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Galáxia do Cometa', 'Ursa Major', 0, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Temisto', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Leda', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Himalia', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Lisiteia', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Elara', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganímedes', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Dia', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'S/2003 J 12', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Euporia', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'S/2003 J 3', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'S/2003 J 18', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'S/2011 J 1', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'S/2010 J 2', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Thelxinoe', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Euante', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Helique', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Ortósia', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'S/2016 J 1', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Iocasta', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'S/2003 J 16', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Praxidique', 0, 4, 0, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Carpo', 0, 4, 0, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', false, false, 0, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (2, 'Earth', true, false, 1, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (3, 'venus', false, false, 0, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (4, 'Plutão', false, false, 0, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (5, 'Mercúrio', true, false, 1, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (6, 'Haumea', true, false, 1, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (7, 'Ceres', true, false, 1, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (8, 'Júpiter', true, false, 1, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (9, 'Saturno', true, false, 1, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (10, 'Urano', true, false, 1, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (11, 'Neptuno', true, false, 1, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (12, 'Plutão', true, false, 1, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (13, 'Sedna', true, false, 1, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (14, 'Makemake', false, false, 0, 4, NULL, 0, NULL);
INSERT INTO public.planet VALUES (15, 'Jupiter', false, false, 0, 4, NULL, 0, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Lynx', 123, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (2, 'Eridanus', 321312313, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (3, 'Cassiopeia', 3443, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (4, 'Scorpius', 123, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (5, 'Crux', 321312313, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (6, 'Leo', 321312313, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (7, 'Canis Major', 321312313, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (8, 'Andromeda', 321312313, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (9, 'Taurus', 321312313, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (10, 'Sagittarius', 321312313, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (11, 'Lyra', 321312313, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (12, 'Cancer', 3443, 1, NULL, 0, NULL);
INSERT INTO public.star VALUES (13, 'sun', 1234, 1, NULL, 0, NULL);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: comet comet_catalog_international_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_catalog_international_id_key UNIQUE (catalog_international_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_catalog_international_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_catalog_international_id_key UNIQUE (catalog_international_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_catalog_international_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_catalog_international_id_key UNIQUE (catalog_international_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_catalog_international_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_catalog_international_id_key UNIQUE (catalog_international_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_catalog_international_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_catalog_international_id_key UNIQUE (catalog_international_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

