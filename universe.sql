--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    diameter integer,
    mass numeric(20,2) NOT NULL,
    type character varying(50)
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
    name character varying(100) NOT NULL,
    mass numeric NOT NULL,
    description text,
    atmosphere boolean NOT NULL,
    radius integer,
    density integer,
    unique_code character varying(20),
    planet_id integer
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
    name character varying(100) NOT NULL,
    mass numeric NOT NULL,
    description text,
    has_life boolean NOT NULL,
    orbital_period integer,
    unique_code character varying(20),
    avg_temperature integer,
    star_id integer
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
-- Name: spaceship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceship (
    spaceship_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    capacity integer NOT NULL
);


ALTER TABLE public.spaceship OWNER TO freecodecamp;

--
-- Name: spaceship_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceship_planet (
    spaceship_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.spaceship_planet OWNER TO freecodecamp;

--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spaceship_spaceship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spaceship_spaceship_id_seq OWNER TO freecodecamp;

--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spaceship_spaceship_id_seq OWNED BY public.spaceship.spaceship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mass numeric NOT NULL,
    description text,
    activity boolean NOT NULL,
    temperature integer,
    age integer,
    spectral_class character varying(20),
    galaxy_id integer
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
-- Name: spaceship spaceship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship ALTER COLUMN spaceship_id SET DEFAULT nextval('public.spaceship_spaceship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Milky Way', 'Our home galaxy, spiral type', true, 13600, 105700, 1500000000000.00, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Andromeda', 'Nearest large galaxy', false, 10000, 220000, 1230000000000.00, 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'Triangulum', 'Small spiral galaxy in Local Group', false, 13000, 60000, 500000000000.00, 'Spiral');
INSERT INTO public.galaxy VALUES (8, 'Messier 87', 'Giant elliptical galaxy with supermassive black hole', false, 13000, 120000, 2700000000000.00, 'Elliptical');
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy', 'Bright spiral galaxy with a large central bulge', false, 9000, 49000, 800000000000.00, 'Spiral');
INSERT INTO public.galaxy VALUES (10, 'Whirlpool Galaxy', 'Classic spiral galaxy interacting with a smaller companion', false, 12000, 60000, 1000000000000.00, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 73500000000000000000000, 'Earth’s only natural satellite', false, 1737, 3340, 'MOON001', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 10700000000000000, 'Larger moon of Mars', false, 11, 1876, 'PHOB002', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 1480000000000000, 'Smaller moon of Mars', false, 6, 1471, 'DEIM003', 2);
INSERT INTO public.moon VALUES (4, 'Io', 89300000000000000000000, 'Volcanically active moon of Jupiter', false, 1821, 3528, 'IO004', 3);
INSERT INTO public.moon VALUES (5, 'Europa', 48000000000000000000000, 'Icy moon of Jupiter with subsurface ocean', false, 1560, 3010, 'EURO005', 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 148000000000000000000000, 'Largest moon in the Solar System', false, 2634, 1940, 'GANY006', 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 108000000000000000000000, 'Heavily cratered moon of Jupiter', false, 2410, 1834, 'CALL007', 3);
INSERT INTO public.moon VALUES (8, 'Proxima b I', 5000000000000000000000, 'Hypothetical moon of Proxima b', false, 800, 3000, 'PBMO008', 4);
INSERT INTO public.moon VALUES (9, 'Kepler-22b I', 6000000000000000000000, 'Hypothetical moon of Kepler-22b', false, 900, 3050, 'K22MO009', 5);
INSERT INTO public.moon VALUES (10, 'Alpha Centauri Bb I', 4500000000000000000000, 'Hypothetical moon of Alpha Centauri Bb', false, 700, 2980, 'ACMO010', 6);
INSERT INTO public.moon VALUES (11, 'Gliese 581d I', 7200000000000000000000, 'Hypothetical moon of Gliese 581d', false, 1000, 3200, 'G581M011', 7);
INSERT INTO public.moon VALUES (12, 'TRAPPIST-1e I', 5500000000000000000000, 'Possible icy moon', false, 750, 3100, 'TR1EMO012', 8);
INSERT INTO public.moon VALUES (13, 'HD 209458 b I', 12000000000000000000000, 'Hypothetical hot moon', true, 1200, 2900, 'HDMO013', 9);
INSERT INTO public.moon VALUES (14, 'WASP-12b I', 15000000000000000000000, 'Possible volcanic moon', true, 1300, 2850, 'W12MO014', 10);
INSERT INTO public.moon VALUES (15, 'Kepler-452b I', 6800000000000000000000, 'Possible habitable moon', true, 950, 2950, 'K452MO015', 11);
INSERT INTO public.moon VALUES (16, '55 Cancri e I', 9000000000000000000000, 'Superheated moon', true, 850, 3300, '55CEMO016', 12);
INSERT INTO public.moon VALUES (17, 'Jupiter XX', 400000000000000000000, 'Small outer moon of Jupiter', false, 100, 1800, 'JUPMO017', 3);
INSERT INTO public.moon VALUES (18, 'Jupiter XXI', 500000000000000000000, 'Another small irregular moon', false, 120, 1750, 'JUPMO018', 3);
INSERT INTO public.moon VALUES (19, 'Mars Moon X', 2000000000000000, 'Captured asteroid moon of Mars', false, 15, 2000, 'MAMO019', 2);
INSERT INTO public.moon VALUES (20, 'Earth II Moon', 60000000000000000000000, 'Hypothetical second moon of Earth', false, 1600, 3400, 'EARMO020', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5970000000000000000000000, 'Our home planet', true, 365, 'EARTH001', 15, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 642000000000000000000000, 'The Red Planet', false, 687, 'MARS002', -63, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1900000000000000000000000000, 'The largest planet in our solar system', false, 4333, 'JUPI003', -108, 1);
INSERT INTO public.planet VALUES (4, 'Proxima b', 12700000000000000000000000, 'Exoplanet orbiting Proxima Centauri', false, 11, 'PROX004', 234, 2);
INSERT INTO public.planet VALUES (5, 'Kepler-22b', 23800000000000000000000000, 'Potentially habitable exoplanet', false, 290, 'KEPL005', 22, 2);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', 11000000000000000000000000, 'Exoplanet orbiting Alpha Centauri B', false, 3, 'ALPH006', 450, 3);
INSERT INTO public.planet VALUES (7, 'Gliese 581d', 7000000000000000000000000, 'Possible super-Earth', false, 67, 'GLIE007', -40, 4);
INSERT INTO public.planet VALUES (8, 'TRAPPIST-1e', 6390000000000000000000000, 'One of seven exoplanets in TRAPPIST-1 system', false, 6, 'TRAP008', -12, 5);
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 1310000000000000000000000000, 'Hot Jupiter exoplanet', false, 4, 'HD209009', 1300, 6);
INSERT INTO public.planet VALUES (10, 'WASP-12b', 1410000000000000000000000000, 'Inflated hot Jupiter', false, 1, 'WASP010', 2500, 6);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 5000000000000000000000000, 'Earth-like exoplanet', false, 385, 'KEPL011', 20, 5);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 8000000000000000000000000, 'Super-Earth', false, 1, '55CAN012', 2000, 4);


--
-- Data for Name: spaceship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceship VALUES (1, 'Explorer I', 'Long-range research vessel', 50);
INSERT INTO public.spaceship VALUES (2, 'Galaxy Rider', 'Passenger transport between star systems', 200);
INSERT INTO public.spaceship VALUES (3, 'Starblazer', 'Decommissioned battleship', 120);
INSERT INTO public.spaceship VALUES (4, 'Luna Express', 'Shuttle between Earth and Moon', 80);
INSERT INTO public.spaceship VALUES (5, 'Solar Wind', 'Eco-friendly exploration ship', 40);
INSERT INTO public.spaceship VALUES (6, 'Cosmos Voyager', 'Luxury interstellar cruise ship', 300);


--
-- Data for Name: spaceship_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceship_planet VALUES (1, 1);
INSERT INTO public.spaceship_planet VALUES (1, 2);
INSERT INTO public.spaceship_planet VALUES (2, 3);
INSERT INTO public.spaceship_planet VALUES (2, 4);
INSERT INTO public.spaceship_planet VALUES (3, 5);
INSERT INTO public.spaceship_planet VALUES (3, 6);
INSERT INTO public.spaceship_planet VALUES (4, 7);
INSERT INTO public.spaceship_planet VALUES (5, 8);
INSERT INTO public.spaceship_planet VALUES (6, 9);
INSERT INTO public.spaceship_planet VALUES (6, 10);
INSERT INTO public.spaceship_planet VALUES (6, 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1000000000000000000000000000000, 'The star at the center of our solar system', true, 5778, 4600, 'G2V', 5);
INSERT INTO public.star VALUES (2, 'Sirius', 2020000000000000000000000000000, 'Brightest star in the night sky', true, 9940, 242, 'A1V', 5);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 12000000000000000000000000000000, 'Red supergiant star in Orion constellation', false, 3500, 8000, 'M2Iab', 5);
INSERT INTO public.star VALUES (4, 'Rigel', 20000000000000000000000000000000, 'Blue supergiant star, also in Orion', true, 12100, 8000, 'B8Ia', 5);
INSERT INTO public.star VALUES (5, 'Vega', 4100000000000000000000000000000, 'Bright star in Lyra constellation', true, 9602, 455, 'A0V', 6);
INSERT INTO public.star VALUES (6, 'Polaris', 6000000000000000000000000000000, 'North Star, a Cepheid variable', true, 6015, 7000, 'F7Ib', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceship_spaceship_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_code_key UNIQUE (unique_code);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_code_key UNIQUE (unique_code);


--
-- Name: spaceship spaceship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_name_key UNIQUE (name);


--
-- Name: spaceship spaceship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_pkey PRIMARY KEY (spaceship_id);


--
-- Name: spaceship_planet spaceship_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship_planet
    ADD CONSTRAINT spaceship_planet_pkey PRIMARY KEY (spaceship_id, planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_spectral_class_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_spectral_class_key UNIQUE (spectral_class);


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
-- Name: spaceship_planet spaceship_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship_planet
    ADD CONSTRAINT spaceship_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: spaceship_planet spaceship_planet_spaceship_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship_planet
    ADD CONSTRAINT spaceship_planet_spaceship_id_fkey FOREIGN KEY (spaceship_id) REFERENCES public.spaceship(spaceship_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

