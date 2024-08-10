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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_history; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_history (
    id integer NOT NULL,
    user_id integer NOT NULL,
    guess_count integer
);


ALTER TABLE public.game_history OWNER TO freecodecamp;

--
-- Name: game_history_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_history_id_seq OWNER TO freecodecamp;

--
-- Name: game_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_history_id_seq OWNED BY public.game_history.id;


--
-- Name: game_history_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_history_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_history_user_id_seq OWNER TO freecodecamp;

--
-- Name: game_history_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_history_user_id_seq OWNED BY public.game_history.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: game_history id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_history ALTER COLUMN id SET DEFAULT nextval('public.game_history_id_seq'::regclass);


--
-- Name: game_history user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_history ALTER COLUMN user_id SET DEFAULT nextval('public.game_history_user_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: game_history; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'saoji');
INSERT INTO public.users VALUES (2, 'user_1723293570340');
INSERT INTO public.users VALUES (3, 'user_1723293570339');
INSERT INTO public.users VALUES (4, 'user_1723293999898');
INSERT INTO public.users VALUES (5, 'user_1723293999897');
INSERT INTO public.users VALUES (6, 'user_1723294529116');
INSERT INTO public.users VALUES (7, 'user_1723294529115');
INSERT INTO public.users VALUES (8, 'user_1723294549335');
INSERT INTO public.users VALUES (9, 'user_1723294549334');
INSERT INTO public.users VALUES (10, 'user_1723294932068');
INSERT INTO public.users VALUES (11, 'user_1723294932067');
INSERT INTO public.users VALUES (12, 'user_1723295420688');
INSERT INTO public.users VALUES (13, 'user_1723295420687');
INSERT INTO public.users VALUES (14, 'user_1723295498992');
INSERT INTO public.users VALUES (15, 'user_1723295498991');
INSERT INTO public.users VALUES (16, 'user_1723295584622');
INSERT INTO public.users VALUES (17, 'user_1723295584621');
INSERT INTO public.users VALUES (18, 'user_1723296112447');
INSERT INTO public.users VALUES (19, 'user_1723296112446');
INSERT INTO public.users VALUES (20, 'user_1723296162561');
INSERT INTO public.users VALUES (21, 'user_1723296162560');
INSERT INTO public.users VALUES (22, 'user_1723296213081');
INSERT INTO public.users VALUES (23, 'user_1723296213080');


--
-- Name: game_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_history_id_seq', 1, false);


--
-- Name: game_history_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_history_user_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_id_seq', 23, true);


--
-- Name: game_history game_history_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_history
    ADD CONSTRAINT game_history_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: game_history game_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_history
    ADD CONSTRAINT game_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

