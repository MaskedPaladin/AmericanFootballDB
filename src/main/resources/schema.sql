--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Debian 13.5-0+deb11u1)
-- Dumped by pg_dump version 13.5 (Debian 13.5-0+deb11u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: defense_fumbles_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.defense_fumbles_stats (
    id_defense_fumbles_stats integer NOT NULL,
    uniform_number integer,
    play_at_start boolean,
    intercepted integer,
    yards_interceptions integer,
    intercepted_touchdowns integer,
    longest_interception_return integer,
    passes_defended integer,
    forced_fumbles integer,
    yards_recovered_fumbles integer,
    fumbles_to_touchdown integer,
    sacks double precision,
    solo_tackles integer,
    assists_on_tackle integer,
    tackles_for_loss integer,
    quarterback_hits integer,
    safeties_scored integer
);


ALTER TABLE public.defense_fumbles_stats OWNER TO postgres;

--
-- Name: defense_fumbles_stats_id_defense_fumbles_stats_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.defense_fumbles_stats_id_defense_fumbles_stats_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defense_fumbles_stats_id_defense_fumbles_stats_seq OWNER TO postgres;

--
-- Name: defense_fumbles_stats_id_defense_fumbles_stats_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.defense_fumbles_stats_id_defense_fumbles_stats_seq OWNED BY public.defense_fumbles_stats.id_defense_fumbles_stats;


--
-- Name: match; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match (
    id_match integer NOT NULL,
    local_team_id integer NOT NULL,
    visitor_team_id integer NOT NULL,
    local_points integer,
    visitor_points integer,
    date date
);


ALTER TABLE public.match OWNER TO postgres;

--
-- Name: match_id_match_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.match_id_match_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.match_id_match_seq OWNER TO postgres;

--
-- Name: match_id_match_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.match_id_match_seq OWNED BY public.match.id_match;


--
-- Name: match_local_team_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.match_local_team_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.match_local_team_seq OWNER TO postgres;

--
-- Name: match_local_team_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.match_local_team_seq OWNED BY public.match.local_team_id;


--
-- Name: match_visitor_team_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.match_visitor_team_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.match_visitor_team_seq OWNER TO postgres;

--
-- Name: match_visitor_team_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.match_visitor_team_seq OWNED BY public.match.visitor_team_id;


--
-- Name: passing_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passing_stats (
    id_passing_stats integer NOT NULL,
    uniform_number integer,
    play_at_start boolean,
    passes_completed integer,
    passes_attempted integer,
    yards_gained_by_passing integer,
    passing_touchdowns integer,
    interceptions_thrown integer,
    first_downs_passing integer,
    longest_completed_pass integer,
    times_sacked integer
);


ALTER TABLE public.passing_stats OWNER TO postgres;

--
-- Name: passing_stats_id_passing_stats_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passing_stats_id_passing_stats_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passing_stats_id_passing_stats_seq OWNER TO postgres;

--
-- Name: passing_stats_id_passing_stats_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passing_stats_id_passing_stats_seq OWNED BY public.passing_stats.id_passing_stats;


--
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    id_player integer NOT NULL,
    name character varying(20),
    surname1 character varying(20),
    surname2 character varying(20),
    birthdate date,
    active boolean
);


ALTER TABLE public.player OWNER TO postgres;

--
-- Name: player_id_player_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_id_player_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_id_player_seq OWNER TO postgres;

--
-- Name: player_id_player_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_id_player_seq OWNED BY public.player.id_player;


--
-- Name: player_match_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_match_stats (
    id_player_stats integer NOT NULL,
    id_player integer NOT NULL,
    id_defense_fumbles_stats integer NOT NULL,
    id_receiving_rushing_stats integer NOT NULL,
    id_passing_stats integer NOT NULL,
    id_match integer NOT NULL
);


ALTER TABLE public.player_match_stats OWNER TO postgres;

--
-- Name: player_match_stats_id_match_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_match_stats_id_match_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_match_stats_id_match_seq OWNER TO postgres;

--
-- Name: player_match_stats_id_match_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_match_stats_id_match_seq OWNED BY public.player_match_stats.id_match;


--
-- Name: player_team_season; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_team_season (
    id_player integer NOT NULL,
    id_team integer NOT NULL,
    id_season integer NOT NULL
);


ALTER TABLE public.player_team_season OWNER TO postgres;

--
-- Name: player_season_team_id_player_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_season_team_id_player_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_season_team_id_player_seq OWNER TO postgres;

--
-- Name: player_season_team_id_player_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_season_team_id_player_seq OWNED BY public.player_team_season.id_player;


--
-- Name: player_season_team_id_season_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_season_team_id_season_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_season_team_id_season_seq OWNER TO postgres;

--
-- Name: player_season_team_id_season_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_season_team_id_season_seq OWNED BY public.player_team_season.id_season;


--
-- Name: player_season_team_id_team_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_season_team_id_team_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_season_team_id_team_seq OWNER TO postgres;

--
-- Name: player_season_team_id_team_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_season_team_id_team_seq OWNED BY public.player_team_season.id_team;


--
-- Name: player_stats_id_defense_fumbles_stats_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_stats_id_defense_fumbles_stats_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_stats_id_defense_fumbles_stats_seq OWNER TO postgres;

--
-- Name: player_stats_id_defense_fumbles_stats_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_stats_id_defense_fumbles_stats_seq OWNED BY public.player_match_stats.id_defense_fumbles_stats;


--
-- Name: player_stats_id_passing_stats_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_stats_id_passing_stats_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_stats_id_passing_stats_seq OWNER TO postgres;

--
-- Name: player_stats_id_passing_stats_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_stats_id_passing_stats_seq OWNED BY public.player_match_stats.id_passing_stats;


--
-- Name: player_stats_id_player_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_stats_id_player_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_stats_id_player_seq OWNER TO postgres;

--
-- Name: player_stats_id_player_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_stats_id_player_seq OWNED BY public.player_match_stats.id_player;


--
-- Name: player_stats_id_player_stats_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_stats_id_player_stats_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_stats_id_player_stats_seq OWNER TO postgres;

--
-- Name: player_stats_id_player_stats_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_stats_id_player_stats_seq OWNED BY public.player_match_stats.id_player_stats;


--
-- Name: player_stats_id_receiving_rushing_stats_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_stats_id_receiving_rushing_stats_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_stats_id_receiving_rushing_stats_seq OWNER TO postgres;

--
-- Name: player_stats_id_receiving_rushing_stats_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_stats_id_receiving_rushing_stats_seq OWNED BY public.player_match_stats.id_receiving_rushing_stats;


--
-- Name: receiving_rushing_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receiving_rushing_stats (
    id_receiving_rushing_stats integer NOT NULL,
    uniform_number integer,
    play_at_start boolean,
    pass_target integer,
    receptions integer,
    receiving_yards integer,
    receiving_touchdowns integer,
    first_downs_receiving integer,
    longest_reception integer,
    rushing_attempts integer,
    rushing_yards_gained integer,
    rushing_touchdowns integer,
    first_downs_rushing integer,
    longest_rushing_attempt integer
);


ALTER TABLE public.receiving_rushing_stats OWNER TO postgres;

--
-- Name: receiving_rushing_stats_id_receiving_rushing_stats_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receiving_rushing_stats_id_receiving_rushing_stats_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receiving_rushing_stats_id_receiving_rushing_stats_seq OWNER TO postgres;

--
-- Name: receiving_rushing_stats_id_receiving_rushing_stats_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receiving_rushing_stats_id_receiving_rushing_stats_seq OWNED BY public.receiving_rushing_stats.id_receiving_rushing_stats;


--
-- Name: season; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.season (
    id_season integer NOT NULL,
    name character varying(20),
    date date
);


ALTER TABLE public.season OWNER TO postgres;

--
-- Name: season_id_season_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.season_id_season_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.season_id_season_seq OWNER TO postgres;

--
-- Name: season_id_season_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.season_id_season_seq OWNED BY public.season.id_season;


--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    id_team integer NOT NULL,
    name character varying(20),
    bowls_won integer
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: team_id_team_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_id_team_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_id_team_seq OWNER TO postgres;

--
-- Name: team_id_team_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_id_team_seq OWNED BY public.team.id_team;


--
-- Name: defense_fumbles_stats id_defense_fumbles_stats; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.defense_fumbles_stats ALTER COLUMN id_defense_fumbles_stats SET DEFAULT nextval('public.defense_fumbles_stats_id_defense_fumbles_stats_seq'::regclass);


--
-- Name: match id_match; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match ALTER COLUMN id_match SET DEFAULT nextval('public.match_id_match_seq'::regclass);


--
-- Name: match local_team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match ALTER COLUMN local_team_id SET DEFAULT nextval('public.match_local_team_seq'::regclass);


--
-- Name: match visitor_team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match ALTER COLUMN visitor_team_id SET DEFAULT nextval('public.match_visitor_team_seq'::regclass);


--
-- Name: passing_stats id_passing_stats; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passing_stats ALTER COLUMN id_passing_stats SET DEFAULT nextval('public.passing_stats_id_passing_stats_seq'::regclass);


--
-- Name: player id_player; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player ALTER COLUMN id_player SET DEFAULT nextval('public.player_id_player_seq'::regclass);


--
-- Name: player_match_stats id_player_stats; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_match_stats ALTER COLUMN id_player_stats SET DEFAULT nextval('public.player_stats_id_player_stats_seq'::regclass);


--
-- Name: player_match_stats id_player; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_match_stats ALTER COLUMN id_player SET DEFAULT nextval('public.player_stats_id_player_seq'::regclass);


--
-- Name: player_match_stats id_defense_fumbles_stats; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_match_stats ALTER COLUMN id_defense_fumbles_stats SET DEFAULT nextval('public.player_stats_id_defense_fumbles_stats_seq'::regclass);


--
-- Name: player_match_stats id_receiving_rushing_stats; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_match_stats ALTER COLUMN id_receiving_rushing_stats SET DEFAULT nextval('public.player_stats_id_receiving_rushing_stats_seq'::regclass);


--
-- Name: player_match_stats id_passing_stats; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_match_stats ALTER COLUMN id_passing_stats SET DEFAULT nextval('public.player_stats_id_passing_stats_seq'::regclass);


--
-- Name: player_match_stats id_match; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_match_stats ALTER COLUMN id_match SET DEFAULT nextval('public.player_match_stats_id_match_seq'::regclass);


--
-- Name: player_team_season id_player; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_team_season ALTER COLUMN id_player SET DEFAULT nextval('public.player_season_team_id_player_seq'::regclass);


--
-- Name: player_team_season id_team; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_team_season ALTER COLUMN id_team SET DEFAULT nextval('public.player_season_team_id_team_seq'::regclass);


--
-- Name: player_team_season id_season; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_team_season ALTER COLUMN id_season SET DEFAULT nextval('public.player_season_team_id_season_seq'::regclass);


--
-- Name: receiving_rushing_stats id_receiving_rushing_stats; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_rushing_stats ALTER COLUMN id_receiving_rushing_stats SET DEFAULT nextval('public.receiving_rushing_stats_id_receiving_rushing_stats_seq'::regclass);


--
-- Name: season id_season; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.season ALTER COLUMN id_season SET DEFAULT nextval('public.season_id_season_seq'::regclass);


--
-- Name: team id_team; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team ALTER COLUMN id_team SET DEFAULT nextval('public.team_id_team_seq'::regclass);


--
-- Data for Name: defense_fumbles_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.defense_fumbles_stats (id_defense_fumbles_stats, uniform_number, play_at_start, intercepted, yards_interceptions, intercepted_touchdowns, longest_interception_return, passes_defended, forced_fumbles, yards_recovered_fumbles, fumbles_to_touchdown, sacks, solo_tackles, assists_on_tackle, tackles_for_loss, quarterback_hits, safeties_scored) FROM stdin;
1       90      f       0       0       0       0       0       0       0       0       0       3       1       0       0       0
\.


--
-- Data for Name: match; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.match (id_match, local_team_id, visitor_team_id, local_points, visitor_points, date) FROM stdin;
1       2       1       3       48      2022-01-15
\.


--
-- Data for Name: passing_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passing_stats (id_passing_stats, uniform_number, play_at_start, passes_completed, passes_attempted, yards_gained_by_passing, passing_touchdowns, interceptions_thrown, first_downs_passing, longest_completed_pass, times_sacked) FROM stdin;
1       90      f       \N      \N      \N      \N      \N      \N      \N      \N
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player (id_player, name, surname1, surname2, birthdate, active) FROM stdin;
2       Dummy   To      Test    2004-01-01      t
1       Carlos  Jimenez Encinas 2002-02-15      t
\.


--
-- Data for Name: player_match_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_match_stats (id_player_stats, id_player, id_defense_fumbles_stats, id_receiving_rushing_stats, id_passing_stats, id_match) FROM stdin;
1       1       1       1       1       1
\.


--
-- Data for Name: player_team_season; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_team_season (id_player, id_team, id_season) FROM stdin;
1       1       1
2       2       1
\.


--
-- Data for Name: receiving_rushing_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receiving_rushing_stats (id_receiving_rushing_stats, uniform_number, play_at_start, pass_target, receptions, receiving_yards, receiving_touchdowns, first_downs_receiving, longest_reception, rushing_attempts, rushing_yards_gained, rushing_touchdowns, first_downs_rushing, longest_rushing_attempt) FROM stdin;
1       90      f       \N      \N      \N      \N      \N      \N      \N      \N      \N      \N      \N
\.


--
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.season (id_season, name, date) FROM stdin;
1       FEFA-2022       2022-01-01
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (id_team, name, bowls_won) FROM stdin;
2       Hospitalet Pioners      0
3       Gijon Mariners  0
4       Rivas Osos      0
5       Black Demons    0
6       Murcia Cobras   0
7       Mallorca Voltors        0
8       Zaragoza Hurricanes     0
9       Fuengirola Potros       0
10      Barbera Rookies 0
1       Badalona Dracs  15
\.


--
-- Name: defense_fumbles_stats_id_defense_fumbles_stats_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.defense_fumbles_stats_id_defense_fumbles_stats_seq', 1, true);


--
-- Name: match_id_match_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.match_id_match_seq', 1, true);


--
-- Name: match_local_team_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.match_local_team_seq', 1, false);


--
-- Name: match_visitor_team_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.match_visitor_team_seq', 1, false);


--
-- Name: passing_stats_id_passing_stats_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passing_stats_id_passing_stats_seq', 1, true);


--
-- Name: player_id_player_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_id_player_seq', 3, true);


--
-- Name: player_match_stats_id_match_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_match_stats_id_match_seq', 1, false);


--
-- Name: player_season_team_id_player_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_season_team_id_player_seq', 1, false);


--
-- Name: player_season_team_id_season_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_season_team_id_season_seq', 1, false);


--
-- Name: player_season_team_id_team_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_season_team_id_team_seq', 1, false);


--
-- Name: player_stats_id_defense_fumbles_stats_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_stats_id_defense_fumbles_stats_seq', 1, false);


--
-- Name: player_stats_id_passing_stats_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_stats_id_passing_stats_seq', 1, false);


--
-- Name: player_stats_id_player_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_stats_id_player_seq', 1, false);


--
-- Name: player_stats_id_player_stats_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_stats_id_player_stats_seq', 1, true);


--
-- Name: player_stats_id_receiving_rushing_stats_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_stats_id_receiving_rushing_stats_seq', 1, false);


--
-- Name: receiving_rushing_stats_id_receiving_rushing_stats_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receiving_rushing_stats_id_receiving_rushing_stats_seq', 1, true);


--
-- Name: season_id_season_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.season_id_season_seq', 1, true);


--
-- Name: team_id_team_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_id_team_seq', 10, true);


--
-- Name: defense_fumbles_stats defense_fumbles_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.defense_fumbles_stats
    ADD CONSTRAINT defense_fumbles_stats_pkey PRIMARY KEY (id_defense_fumbles_stats);


--
-- Name: match match_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_pkey PRIMARY KEY (id_match);


--
-- Name: passing_stats passing_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passing_stats
    ADD CONSTRAINT passing_stats_pkey PRIMARY KEY (id_passing_stats);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id_player);


--
-- Name: player_match_stats player_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_match_stats
    ADD CONSTRAINT player_stats_pkey PRIMARY KEY (id_player_stats);


--
-- Name: receiving_rushing_stats receiving_rushing_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_rushing_stats
    ADD CONSTRAINT receiving_rushing_stats_pkey PRIMARY KEY (id_receiving_rushing_stats);


--
-- Name: season season_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.season
    ADD CONSTRAINT season_pkey PRIMARY KEY (id_season);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id_team);


--
-- PostgreSQL database dump complete
--