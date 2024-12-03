--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Homebrew)

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
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    genre character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.genres ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: movies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying(512),
    release_date date,
    runtime integer,
    mpaa_rating character varying(10),
    description text,
    image character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: movies_genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movies_genres (
    id integer NOT NULL,
    movie_id integer,
    genre_id integer
);


--
-- Name: movies_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.movies_genres ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.movies_genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.movies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    password character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.genres (id, genre, created_at, updated_at) FROM stdin;
1	Comedy	2022-09-23 00:00:00	2022-09-23 00:00:00
2	Sci-Fi	2022-09-23 00:00:00	2022-09-23 00:00:00
3	Horror	2022-09-23 00:00:00	2022-09-23 00:00:00
4	Romance	2022-09-23 00:00:00	2022-09-23 00:00:00
5	Action	2022-09-23 00:00:00	2022-09-23 00:00:00
6	Thriller	2022-09-23 00:00:00	2022-09-23 00:00:00
7	Drama	2022-09-23 00:00:00	2022-09-23 00:00:00
8	Mystery	2022-09-23 00:00:00	2022-09-23 00:00:00
9	Crime	2022-09-23 00:00:00	2022-09-23 00:00:00
10	Animation	2022-09-23 00:00:00	2022-09-23 00:00:00
11	Adventure	2022-09-23 00:00:00	2022-09-23 00:00:00
12	Fantasy	2022-09-23 00:00:00	2022-09-23 00:00:00
13	Superhero	2022-09-23 00:00:00	2022-09-23 00:00:00
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.movies (id, title, release_date, runtime, mpaa_rating, description, image, created_at, updated_at) FROM stdin;
1	Spider-Man: No Way Home	2021-12-15	148	PG-13	Peter Parker faces his toughest challenge yet.	/xGdz67eD2ZCZarNVEzJkk5lNuxz.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
2	Avengers: Endgame	2019-04-24	181	PG-13	After the devastating events of Avengers: Infinity War...	/sd78f23kJszbdh5K.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
3	Inception	2010-07-16	148	PG-13	A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea.	/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
4	Interstellar	2014-11-07	169	PG-13	A team of explorers travel through a wormhole in space in an attempt to ensure humanitys survival.	/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
5	The Dark Knight	2008-07-18	152	PG-13	When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.	/qJ2tW6WMUDux911r6m7haRef0WH.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
6	Titanic	1997-12-19	195	PG-13	A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.	/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
7	Forrest Gump	1994-07-06	142	PG-13	The presidencies of Kennedy and Johnson, Vietnam, Watergate, and other history unfold through the perspective of an Alabama man.	/h5J4W4veyxMXDMjeNxZI46TsHOb.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
8	Gladiator	2000-05-05	155	R	A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family.	/hE24GYddaxB9MVZl1CaiI86M3kp.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
9	The Matrix	1999-03-31	136	R	A computer hacker learns about the true nature of his reality and his role in the war against its controllers.	/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
10	Jurassic Park	1993-06-11	127	PG-13	A pragmatic paleontologist touring an almost complete theme park on an island in Central America is tasked with protecting a couple of kids.	/9i3plLl89DHMz7mahksDaAo7HIS.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
11	The Shawshank Redemption	1994-09-23	142	R	Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.	/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
12	Pulp Fiction	1994-10-14	154	R	The lives of two mob hitmen, a boxer, a gangster and his wife intertwine in four tales of violence and redemption.	/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
13	The Lord of the Rings: The Fellowship of the Ring	2001-12-19	178	PG-13	A meek Hobbit from the Shire and his eight companions set out on a journey to destroy the powerful One Ring.	/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
14	Star Wars: A New Hope	1977-05-25	121	PG	Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee, and two droids to save the galaxy.	/buF3O9N1NuEVE7sfxZYNaX4e6w2.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
15	The Lion King	1994-06-24	88	G	Lion cub and future king Simba searches for his identity.	/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
16	Fight Club	1999-10-15	139	R	An insomniac office worker and a devil-may-care soap maker form an underground fight club.	/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
17	Avatar	2009-12-18	162	PG-13	A paraplegic Marine is dispatched to the moon Pandora on a unique mission.	/6EiRUJpuoeQPghrs3YNktfnqOVh.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
18	Back to the Future	1985-07-03	116	PG	Marty McFly, a teenager, is accidentally sent 30 years into the past in a time-traveling DeLorean.	/fNOH9f1aA7XRTzl1sAOx9iF553Q.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
19	The Silence of the Lambs	1991-02-14	118	R	A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to catch another serial killer.	/rplLJ2hPcOQmkFhTqUte0MkEaO2.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
20	The Green Mile	1999-12-10	189	R	The lives of guards on Death Row are affected by one of their charges: a man accused of child murder and rape, yet who has a mysterious gift.	/sOhL6F4REpUzrOVYJvqrjzPzVWz.jpg	2024-12-02 10:00:00	2024-12-02 10:00:00
\.


--
-- Data for Name: movies_genres; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.movies_genres (id, movie_id, genre_id) FROM stdin;
1	1	5
2	1	12
3	2	5
4	2	11
5	3	9
6	3	7
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, first_name, last_name, email, password, created_at, updated_at) FROM stdin;
1	Admin	User	admin@example.com	$2a$14$wVsaPvJnJJsomWArouWCtusem6S/.Gauq/GjOIEHpyh2DAMmso1wy	2022-09-23 00:00:00	2022-09-23 00:00:00
\.


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genres_id_seq', 13, true);


--
-- Name: movies_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movies_genres_id_seq', 6, true);


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movies_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: movies_genres movies_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT movies_genres_pkey PRIMARY KEY (id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: movies_genres movies_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT movies_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movies_genres movies_genres_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT movies_genres_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

