--
-- PostgreSQL database dump
--

\restrict p4jlMRmc7O0DF6GA77cbWeqxhVkkSeNL0de4nATL6q4znOm88Wp0zetgItho9RE

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

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

ALTER TABLE IF EXISTS ONLY public.track DROP CONSTRAINT IF EXISTS track_album_id_fkey;
ALTER TABLE IF EXISTS ONLY public.collection_track DROP CONSTRAINT IF EXISTS collection_track_track_id_fkey;
ALTER TABLE IF EXISTS ONLY public.collection_track DROP CONSTRAINT IF EXISTS collection_track_collection_id_fkey;
ALTER TABLE IF EXISTS ONLY public.author_genres DROP CONSTRAINT IF EXISTS author_genres_genres_id_fkey;
ALTER TABLE IF EXISTS ONLY public.author_genres DROP CONSTRAINT IF EXISTS author_genres_author_id_fkey;
ALTER TABLE IF EXISTS ONLY public.author_album DROP CONSTRAINT IF EXISTS author_album_author_id_fkey;
ALTER TABLE IF EXISTS ONLY public.author_album DROP CONSTRAINT IF EXISTS author_album_album_id_fkey;
ALTER TABLE IF EXISTS ONLY public.track DROP CONSTRAINT IF EXISTS track_pkey;
ALTER TABLE IF EXISTS ONLY public.genres DROP CONSTRAINT IF EXISTS genres_pkey;
ALTER TABLE IF EXISTS ONLY public.genres DROP CONSTRAINT IF EXISTS genres_genres_name_key;
ALTER TABLE IF EXISTS ONLY public.collection_track DROP CONSTRAINT IF EXISTS collection_track_pkey;
ALTER TABLE IF EXISTS ONLY public.collection DROP CONSTRAINT IF EXISTS collection_pkey;
ALTER TABLE IF EXISTS ONLY public.author DROP CONSTRAINT IF EXISTS author_pkey;
ALTER TABLE IF EXISTS ONLY public.author_genres DROP CONSTRAINT IF EXISTS author_genres_pkey;
ALTER TABLE IF EXISTS ONLY public.author DROP CONSTRAINT IF EXISTS author_author_name_key;
ALTER TABLE IF EXISTS ONLY public.author_album DROP CONSTRAINT IF EXISTS author_album_pkey;
ALTER TABLE IF EXISTS ONLY public.album DROP CONSTRAINT IF EXISTS album_pkey;
ALTER TABLE IF EXISTS public.track ALTER COLUMN track_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.genres ALTER COLUMN genres_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.collection ALTER COLUMN collection_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.author ALTER COLUMN author_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.album ALTER COLUMN album_id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.track_track_id_seq;
DROP TABLE IF EXISTS public.track;
DROP SEQUENCE IF EXISTS public.genres_genres_id_seq;
DROP TABLE IF EXISTS public.genres;
DROP TABLE IF EXISTS public.collection_track;
DROP SEQUENCE IF EXISTS public.collection_collection_id_seq;
DROP TABLE IF EXISTS public.collection;
DROP TABLE IF EXISTS public.author_genres;
DROP SEQUENCE IF EXISTS public.author_author_id_seq;
DROP TABLE IF EXISTS public.author_album;
DROP TABLE IF EXISTS public.author;
DROP SEQUENCE IF EXISTS public.album_album_id_seq;
DROP TABLE IF EXISTS public.album;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: album; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.album (
    album_id integer NOT NULL,
    album_name character varying(255) NOT NULL,
    album_release integer NOT NULL,
    CONSTRAINT album_album_release_check CHECK (((album_release >= 1900) AND (album_release <= 2100)))
);


--
-- Name: album_album_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.album_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: album_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.album_album_id_seq OWNED BY public.album.album_id;


--
-- Name: author; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.author (
    author_id integer NOT NULL,
    author_name character varying(255) NOT NULL,
    CONSTRAINT author_author_name_check CHECK (((author_name)::text !~ '\s'::text))
);


--
-- Name: author_album; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.author_album (
    author_id integer NOT NULL,
    album_id integer NOT NULL
);


--
-- Name: author_author_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.author_author_id_seq OWNED BY public.author.author_id;


--
-- Name: author_genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.author_genres (
    author_id integer NOT NULL,
    genres_id integer NOT NULL
);


--
-- Name: collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection (
    collection_id integer NOT NULL,
    collection_name character varying(255) NOT NULL,
    collection_release integer NOT NULL,
    CONSTRAINT collection_collection_release_check CHECK (((collection_release >= 1900) AND (collection_release <= 2100)))
);


--
-- Name: collection_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.collection_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: collection_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.collection_collection_id_seq OWNED BY public.collection.collection_id;


--
-- Name: collection_track; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection_track (
    collection_id integer NOT NULL,
    track_id integer NOT NULL
);


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    genres_id integer NOT NULL,
    genres_name character varying(255) NOT NULL
);


--
-- Name: genres_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_genres_id_seq OWNED BY public.genres.genres_id;


--
-- Name: track; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.track (
    track_id integer NOT NULL,
    track_name character varying(255) NOT NULL,
    track_duration integer NOT NULL,
    album_id integer NOT NULL,
    CONSTRAINT track_track_duration_check CHECK (((track_duration > 0) AND (track_duration <= 7200)))
);


--
-- Name: track_track_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.track_track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: track_track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.track_track_id_seq OWNED BY public.track.track_id;


--
-- Name: album album_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.album ALTER COLUMN album_id SET DEFAULT nextval('public.album_album_id_seq'::regclass);


--
-- Name: author author_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author ALTER COLUMN author_id SET DEFAULT nextval('public.author_author_id_seq'::regclass);


--
-- Name: collection collection_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection ALTER COLUMN collection_id SET DEFAULT nextval('public.collection_collection_id_seq'::regclass);


--
-- Name: genres genres_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN genres_id SET DEFAULT nextval('public.genres_genres_id_seq'::regclass);


--
-- Name: track track_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track ALTER COLUMN track_id SET DEFAULT nextval('public.track_track_id_seq'::regclass);


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.album (album_id, album_name, album_release) FROM stdin;
1	A Night at the Opera	1975
2	Like a Prayer	1989
3	Random Access Memories	2013
4	Lemonade	2016
5	Future Nostalgia	2020
\.


--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.author (author_id, author_name) FROM stdin;
1	Queen
2	Madonna
3	DaftPunk
4	Beyonce
\.


--
-- Data for Name: author_album; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.author_album (author_id, album_id) FROM stdin;
1	1
2	2
3	3
4	4
1	3
2	5
\.


--
-- Data for Name: author_genres; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.author_genres (author_id, genres_id) FROM stdin;
1	1
2	2
3	3
4	2
1	2
3	1
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collection (collection_id, collection_name, collection_release) FROM stdin;
1	Greatest Hits 2018	2018
2	Best of Pop	2019
3	Electronic Vibes	2020
4	Rock Legends	2017
5	Summer Mix 2020	2020
\.


--
-- Data for Name: collection_track; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.collection_track (collection_id, track_id) FROM stdin;
1	1
1	3
2	3
2	6
3	4
3	5
4	1
5	7
5	8
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.genres (genres_id, genres_name) FROM stdin;
1	Rock
2	Pop
3	Electronic
\.


--
-- Data for Name: track; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.track (track_id, track_name, track_duration, album_id) FROM stdin;
1	Bohemian Rhapsody	354	1
2	My Heart Will Go On	280	1
3	Like a Prayer	340	2
4	Get Lucky	368	3
5	my way	295	3
6	Formation	206	4
7	Halo	261	4
8	Levitating	203	5
\.


--
-- Name: album_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.album_album_id_seq', 5, true);


--
-- Name: author_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.author_author_id_seq', 4, true);


--
-- Name: collection_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.collection_collection_id_seq', 5, true);


--
-- Name: genres_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genres_genres_id_seq', 3, true);


--
-- Name: track_track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.track_track_id_seq', 8, true);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (album_id);


--
-- Name: author_album author_album_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author_album
    ADD CONSTRAINT author_album_pkey PRIMARY KEY (author_id, album_id);


--
-- Name: author author_author_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_author_name_key UNIQUE (author_name);


--
-- Name: author_genres author_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author_genres
    ADD CONSTRAINT author_genres_pkey PRIMARY KEY (author_id, genres_id);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);


--
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (collection_id);


--
-- Name: collection_track collection_track_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_track
    ADD CONSTRAINT collection_track_pkey PRIMARY KEY (collection_id, track_id);


--
-- Name: genres genres_genres_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_genres_name_key UNIQUE (genres_name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genres_id);


--
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_pkey PRIMARY KEY (track_id);


--
-- Name: author_album author_album_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author_album
    ADD CONSTRAINT author_album_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(album_id) ON DELETE CASCADE;


--
-- Name: author_album author_album_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author_album
    ADD CONSTRAINT author_album_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.author(author_id) ON DELETE CASCADE;


--
-- Name: author_genres author_genres_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author_genres
    ADD CONSTRAINT author_genres_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.author(author_id) ON DELETE CASCADE;


--
-- Name: author_genres author_genres_genres_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author_genres
    ADD CONSTRAINT author_genres_genres_id_fkey FOREIGN KEY (genres_id) REFERENCES public.genres(genres_id) ON DELETE CASCADE;


--
-- Name: collection_track collection_track_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_track
    ADD CONSTRAINT collection_track_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collection(collection_id) ON DELETE CASCADE;


--
-- Name: collection_track collection_track_track_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_track
    ADD CONSTRAINT collection_track_track_id_fkey FOREIGN KEY (track_id) REFERENCES public.track(track_id) ON DELETE CASCADE;


--
-- Name: track track_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(album_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict p4jlMRmc7O0DF6GA77cbWeqxhVkkSeNL0de4nATL6q4znOm88Wp0zetgItho9RE

