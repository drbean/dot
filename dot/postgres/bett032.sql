--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: character; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE "character" (
    entity text NOT NULL,
    string text,
    exercise text NOT NULL
);


ALTER TABLE public."character" OWNER TO drbean;

--
-- Name: exercise; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE exercise (
    type character varying(15) NOT NULL,
    genre character varying(15) NOT NULL,
    id character varying(15) NOT NULL,
    description character varying(50) NOT NULL
);


ALTER TABLE public.exercise OWNER TO drbean;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE genre (
    id integer NOT NULL,
    value text
);


ALTER TABLE public.genre OWNER TO drbean;

--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: drbean
--

CREATE SEQUENCE genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_seq OWNER TO drbean;

--
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drbean
--

ALTER SEQUENCE genre_id_seq OWNED BY genre.id;


--
-- Name: league; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE league (
    id text NOT NULL,
    name text,
    field text,
    genre text
);


ALTER TABLE public.league OWNER TO drbean;

--
-- Name: leaguegenre; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE leaguegenre (
    league text NOT NULL,
    genre smallint NOT NULL
);


ALTER TABLE public.leaguegenre OWNER TO drbean;

--
-- Name: member; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE member (
    league text NOT NULL,
    player text NOT NULL
);


ALTER TABLE public.member OWNER TO drbean;

--
-- Name: play; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE play (
    question text NOT NULL,
    answer text,
    player text NOT NULL,
    league text NOT NULL,
    course text NOT NULL,
    try integer,
    score integer,
    questionchance integer,
    answerchance integer,
    exercise text NOT NULL
);


ALTER TABLE public.play OWNER TO drbean;

--
-- Name: player; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE player (
    id text NOT NULL,
    name text,
    password text
);


ALTER TABLE public.player OWNER TO drbean;

--
-- Name: question; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE question (
    player text NOT NULL,
    lexed text NOT NULL,
    league text NOT NULL,
    exercise text NOT NULL,
    course text NOT NULL,
    quoted text NOT NULL,
    grammatical boolean NOT NULL
);


ALTER TABLE public.question OWNER TO drbean;

--
-- Name: role; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE role (
    id integer NOT NULL,
    role text
);


ALTER TABLE public.role OWNER TO drbean;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: drbean
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO drbean;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drbean
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- Name: rolebearer; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE rolebearer (
    player text NOT NULL,
    role integer NOT NULL
);


ALTER TABLE public.rolebearer OWNER TO drbean;

--
-- Name: s; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE s (
    exercise text NOT NULL,
    player text NOT NULL,
    league text NOT NULL,
    try integer,
    score integer,
    questionchance integer,
    answerchance integer
);


ALTER TABLE public.s OWNER TO drbean;

--
-- Name: session; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE session (
    id character(72) NOT NULL,
    session_data character varying(7500),
    expires integer
);


ALTER TABLE public.session OWNER TO drbean;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE tag (
    exercise text NOT NULL,
    player text NOT NULL,
    league text NOT NULL,
    try integer,
    score integer,
    questionchance integer,
    answerchance integer
);


ALTER TABLE public.tag OWNER TO drbean;

--
-- Name: try; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE try (
    exercise text NOT NULL,
    player text NOT NULL,
    league text NOT NULL,
    try integer NOT NULL,
    quoted text,
    answer text
);


ALTER TABLE public.try OWNER TO drbean;

--
-- Name: wh; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE wh (
    exercise text NOT NULL,
    player text NOT NULL,
    league text NOT NULL,
    try integer,
    score integer,
    questionchance integer,
    answerchance integer
);


ALTER TABLE public.wh OWNER TO drbean;

--
-- Name: word; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE word (
    exercise text NOT NULL,
    string text
);


ALTER TABLE public.word OWNER TO drbean;

--
-- Name: yn; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE yn (
    exercise text NOT NULL,
    player text NOT NULL,
    league text NOT NULL,
    try integer,
    score integer,
    questionchance integer,
    answerchance integer
);


ALTER TABLE public.yn OWNER TO drbean;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY genre ALTER COLUMN id SET DEFAULT nextval('genre_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY "character" (entity, string, exercise) FROM stdin;
O	oliver	AFB1J0
O	oliver	oliver
C	chiyuantien	siar
A	ariel	siar
S	simon	siar
F	frank	clay
R	rebia	clay
D	Dr Bean	candidate
B	Barbara	candidate
T	Tadeusz	candidate
E	Eva	candidate
F	Fast-Track	candidate
Ariel	ariel	chat
Alice	alice	chat
Sabrina	sabrina	chat
Mandy	mandy	chat
Lisa1	lisa1	chat
Viola1	viola1	chat
Annie	annie	chat
Demi	demi	chat
Andy	andy	chat
Dora	dora	chat
Jessie	jessie	chat
Cheney	cheney	chat
Maggie	maggie	chat
Cherry2	cherry2	chat
\.


--
-- Data for Name: exercise; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY exercise (type, genre, id, description) FROM stdin;
Non-competitive	call	oliver	Oliver's self-introduction
Non-competitive	call	intros	Questions about Simon and Ariel
Non-competitive	call	siar	Questions about Simon and Ariel
Non-competitive	conversation	clay	
Non-competitive	call	chat	Chat dialogue in AFB1J0, Internet English
Non-competitive	call	chat-test	Test of chat dialogue in AFB1J0, Internet English
Non-competitive	conversation	chat	
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY genre (id, value) FROM stdin;
\.


--
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drbean
--

SELECT pg_catalog.setval('genre_id_seq', 1, false);


--
-- Data for Name: league; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY league (id, name, field, genre) FROM stdin;
\.


--
-- Data for Name: leaguegenre; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY leaguegenre (league, genre) FROM stdin;
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY member (league, player) FROM stdin;
\.


--
-- Data for Name: play; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY play (question, answer, player, league, course, try, score, questionchance, answerchance, exercise) FROM stdin;
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY player (id, name, password) FROM stdin;
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY question (player, lexed, league, exercise, course, quoted, grammatical) FROM stdin;
B03200092	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad happy)))))"]	1J0	oliver	YN	Is he happy?	t
B03200087	Does Oliver is happy?	1J0	oliver	WH	Does Oliver is happy?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity oliver) (Be_vp (Be_someone (Item a_Det (Kind optimistic person)))))))"]	1J0	oliver	YN	Is Oliver an optimistic person?	f
B03200012	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad optimistic)))))"]	1J0	oliver	YN	Is he optimistic?	t
B03200073	Does Oliver study?	1J0	oliver	YN	Does Oliver study?	f
B03200032	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad humorous)))))"]	1J0	oliver	YN	Is he humorous?	t
B03200018	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad chinese)))))"]	1J0	oliver	YN	Is he Chinese?	t
B03200074	["QUt (PosQ (YN (Sentence (Entity oliver) (WithPlace live (Locating in_prep taipei)))))"]	1J0	oliver	YN	Does Oliver live in Taipei	t
B03200037	["QUt (PosQ (YN (Sentence he (WithPlace study (Locating in_prep kainan)))))"]	1J0	oliver	YN	Does he study in Kainan University	t
B03200037	Is he study in Kainan University	1J0	oliver	YN	Is he study in Kainan University	f
B03200037	Is he study Kainan University	1J0	oliver	YN	Is he study Kainan University	f
B03200037	["QUt (PosQ (YN (Sentence (Entity oliver) (WithPlace live (Locating in_prep pingZhen)))))"]	1J0	oliver	YN	Does Oliver live in PingZhen	t
B03200039	Is he live in PingZhen 	1J0	oliver	YN	Is he live in PingZhen 	f
B03200039	Does Oliver is a name	1J0	oliver	YN	Does Oliver is a name	f
B03200039	Does Oliver is  name	1J0	oliver	YN	Does Oliver is  name	f
B03200039	["QUt (PosQ (YN (Sentence he (Be_vp (Be_someone (Entity oliver))))))"]	1J0	oliver	YN	Is he Oliver 	t
B03200054	["QUt (PosQ (YN (Sentence he (Be_vp (Be_someone (Entity panYanMin))))))"]	1J0	oliver	YN	Is he Pan YanMin?	t
B03200030	["QUt (PosQ (YN (Sentence (Entity oliver) (Changing have (Item a_Det older_sister)))))"]	1J0	oliver	YN	Does Oliver have a older sister?	t
B03200046	["QUt (PosQ (YN (Sentence he (WithPlace live (Locating in_prep taipei)))))"]	1J0	oliver	YN	Does he live in Taipei?	t
B03200046	Is he live in Taipei?	1J0	oliver	YN	Is he live in Taipei?	f
B03200067	Who has older sister  ?	1J0	oliver	WH	Who has older sister  ?	f
B03200067	Who name is Oliver ?	1J0	oliver	WH	Who name is Oliver ?	f
B03200067	Who has older sister? 	1J0	oliver	WH	Who has older sister? 	f
B03200031	who has older sister?	1J0	oliver	WH	who has older sister?	f
B03200019	["QUt (PosQ (WH_Pred what_WH (Be_vp (Be_someone (Item (Apos he) name)))))"]	1J0	oliver	WH	what is his name?	f
B03200075	Does he happy?	1J0	oliver	YN	Does he happy?	f
B03200073	["QUt (PosQ (WH_Pred who_WH (Changing have (Item a_Det older_sister))))"]	1J0	oliver	WH	Who has an older sister?	t
B03200057	["QUt (PosQ (YN (Sentence (Entity oliver) (Changing love (MassItem zero_Det_sg basketball)))))"]	1J0	oliver	YN	Does Oliver love  basketball?	t
B03200057	Who love basketball?	1J0	oliver	WH	Who love basketball?	f
B03200057	["QUt (PosQ (WH_Pred who_WH (Changing love (MassItem zero_Det_sg basketball))))"]	1J0	oliver	WH	Who loves basketball?	t
B03200073	Do they happy?	1J0	oliver	YN	Do they happy?	f
B03200073	["QUt (PosQ (YN (Sentence he (Be_vp (Be_someone (MassItem zero_Det_sg music))))))"]	1J0	oliver	YN	Is he listening to music?	f
B03200073	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad positive)))))"]	1J0	oliver	YN	Is he positive?	t
B03200078	Is Oliver positive person?	1J0	oliver	YN	Is Oliver positive person?	f
B03200078	["QUt (PosQ (YN (Sentence (Entity oliver) (Be_vp (Be_someone (Item a_Det (Kind positive person)))))))"]	1J0	oliver	YN	Is Oliver  a positive person?	t
B03200078	who is positive a person?	1J0	oliver	WH	who is positive a person?	f
B03200078	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind positive person))))))"]	1J0	oliver	WH	who is a positive person?	t
B03200109	["QUt (NegQ (YN (Sentence he (Be_vp (Be_bad chinese)))))"]	1J0	oliver	YN	Isn't he Chinese?	t
B03200109	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad chinese))))"]	1J0	oliver	WH	Who is Chinese	t
B03200093	["QUt (PosQ (WH_Pred who_WH (WithPlace live (Locating in_prep taipei))))"]	1J0	oliver	WH	Who lives in Taipei?	t
B03200093	["QUt (PosQ (WH_Pred (WHose (Kind favorite sport)) (Be_vp (Be_someone (MassItem zero_Det_sg basketball)))))"]	1J0	oliver	WH	Whose favorite sport is basketball?	t
B03200056	["Ut (PosS (Sentence (Entity oliver) (Changing love (MassItem zero_Det_sg music))))"]	1J0	oliver	YN	Oliver loves listening to music ?	f
B03200056	["QUt (PosQ (YN (Sentence (Entity oliver) (Be_vp (Be_someone (Item a_Det person))))))"]	1J0	oliver	YN	Is Oliver a person ?	t
B03200071	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad relaxed)))))"]	1J0	oliver	YN	Is he relaxed ?	t
B03200042	["QUt (NegQ (YN (Sentence he (Be_vp (Be_bad optimistic)))))"]	1J0	oliver	YN	Isn't he optimistic ?	t
B03200094	Isn't he loves Oliver?	1J0	oliver	YN	Isn't he loves Oliver?	f
B03200094	Does he loves Oliver?	1J0	oliver	YN	Does he loves Oliver?	f
B03200094	["QUt (PosQ (YN (Sentence he (Changing love (Entity oliver)))))"]	1J0	oliver	YN	Does he love Oliver?	t
B03200063	["QUt (PosQ (YN (Sentence she (WithPlace live (Locating in_prep taipei)))))"]	1J0	siar	WH	Does she live in Taipei?	t
B03200097	["QUt (PosQ (WH_Pred (WHose family) (Changing have (Item three people))))"]	1J0	siar	WH	Whose family has three people?	t
B03200019	Who have three people in family?	1J0	siar	WH	Who have three people in family?	f
B03200031	Who like play guitar?	1J0	siar	WH	Who like play guitar?	f
B03200012	["QUt (PosQ (WH_Pred who_WH (Intens like (Changing play (MassItem zero_Det_sg baseball)))))"]	1J0	siar	WH	Who likes to play baseball?	t
B03200056	Who like play guitar ?	1J0	siar	WH	Who like play guitar ?	f
B03200056	Who like playing guitar ?	1J0	siar	WH	Who like playing guitar ?	f
B03200097	["QUt (PosQ (WH_Pred (WHose (Kind favorite sport)) (Be_vp (Be_someone (MassItem zero_Det_sg baseball)))))"]	1J0	siar	WH	Whose favorite sport is baseball?	t
B03200082	["QUt (PosQ (WH_Pred who_WH (WithPlace live (Locating in_prep taipei))))"]	1J0	siar	WH	Who lives in Taipei?	t
B03200087	who has younger sister?	1J0	siar	WH	who has younger sister?	f
B03200019	Does Simon older brother studies in WenHua University?	1J0	siar	YN	Does Simon older brother studies in WenHua University?	f
B03200029	Does Ariel favorite subject is English?	1J0	siar	WH	Does Ariel favorite subject is English?	f
B03200056	Who like to play guitar ?	1J0	siar	WH	Who like to play guitar ?	f
B03200087	["QUt (PosQ (YN (Sentence (Entity simon) (Changing have (Item a_Det sister)))))"]	1J0	siar	WH	Does Simon have a younger sister?	t
B03200046	Who like to listen English songs?	1J0	siar	WH	Who like to listen English songs?	f
B03200092	who has younger sister ?	1J0	siar	WH	who has younger sister ?	f
B03200094	Doesn't he has younger sister	1J0	siar	WH	Doesn't he has younger sister	f
B03200012	who like English?	1J0	siar	WH	who like English?	f
B03200012	["QUt (PosQ (WH_Pred (WHose brother) (WithPlace study (Locating in_prep wenhua))))"]	1J0	siar	WH	Whose older brother studies in WenHua University?	t
B03200082	["QUt (PosQ (YN (Sentence (Entity simon) (Intens love (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Does Simon love to play drums?	t
B03200087	Whom does Simon has a younger sister?	1J0	siar	WH	Whom does Simon has a younger sister?	f
B03200087	Who does Simon  younger sister?	1J0	siar	WH	Who does Simon  younger sister?	f
B03200078	Who is a humorous people?	1J0	siar	WH	Who is a humorous people?	f
B03200089	["QUt (PosQ (WH_Pred who_WH (Intens like_ing (Changing play (MassItem zero_Det_sg drums)))))"]	1J0	siar	WH	Who likes playing drums?	t
B03200012	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad sixteen)))))"]	1J0	chat	YN	is she 16	t
B03200012	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad sixteen)))))"]	1J0	chat	YN	isn't she 16	t
B03200012	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad young)))))"]	1J0	chat	YN	is she young?	t
B03200012	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad young)))))"]	1J0	chat	YN	isn't she young?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity filibee) (V_NP_S tell (Entity ariel) (PosS (Sentence he (Be_vp (Be_somewhere (Locating from turkey)))))))))","QUt (PosQ (YN (Sentence (Entity filibee) (V_NP_that_S tell (Entity ariel) (PosS (Sentence he (Be_vp (Be_somewhere (Locating from turkey)))))))))"]	1J0	chat	YN	Does Filibee tell Ariel that he is from Turkey?	f
B03200012	["QUt (PosQ (YN (Sentence she (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	is she from Taiwan	t
B03200012	["QUt (NegQ (YN (Sentence she (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	isn't she from Taiwan	t
B03200097	["QUt (PosQ (YN (Sentence (Entity filibee) (V_NP_S tell (Entity ellarose) (PosS (Sentence he (Be_vp (Be_somewhere (Locating from turkey)))))))))","QUt (PosQ (YN (Sentence (Entity filibee) (V_NP_that_S tell (Entity ellarose) (PosS (Sentence he (Be_vp (Be_somewhere (Locating from turkey)))))))))"]	1J0	chat	YN	Does Filibee tell Ellarose that he is from Turkey?	f
B03200012	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad eighteen)))))"]	1J0	chat	YN	is she 18	t
B03200097	["QUt (PosQ (YN (Sentence (Entity junior) (V_NP_whether_S ask_V2Q (Entity sabrina) (PosQ (YN (Sentence she (Be_vp (Be_bad hispanic)))))))))"]	1J0	chat	YN	Does Junior ask Sabrina if she is Hispanic?	f
B03200012	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad eighteen)))))"]	1J0	chat	YN	isn't she 18	t
B03200012	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	isn't she beautiful	t
B03200012	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	is she beautiful	t
193001	["QUt (PosQ (WH_Pred who_WH (V_NP_S tell (Entity ellarose) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan))))))))","QUt (PosQ (WH_Pred who_WH (V_NP_that_S tell (Entity ellarose) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan))))))))"]	1J0	chat	WH	Who tells Ellarose that she is from Taiwan?	f
B03200082	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad sixteen))))"]	1J0	chat	WH	who isn't 16	t
B03200087	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity mandy)))))"]	1J0	chat	WH	who is Mandy?	t
B03200082	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad fifteen))))"]	1J0	chat	WH	who isn't 15	t
B03200097	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det student)))))"]	1J0	chat	WH	Who is a student?	t
B03200082	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad eighteen))))"]	1J0	chat	WH	who isn't 18	t
B03200092	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det girl)))))"]	1J0	chat	WH	who is a girl ?	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad young))))"]	1J0	chat	WH	who isn't young	t
B03200046	who is beautiful girl?	1J0	chat	WH	who is beautiful girl?	f
B03200097	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_bad beautiful))))"]	1J0	chat	WH	whose name is beautiful	t
B03200031	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad sixteen)))))"]	1J0	chat	YN	Is he 16?	t
B01202106	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_somewhere (Locating from usa)))))"]	1J0	chat	WH	Who is from the USA?	t
B03200097	["QUt (PosQ (WH_Pred (WHose age) (Be_vp (Be_bad eighteen))))"]	1J0	chat	WH	whose age is 18	t
B03200037	["QUt (PosQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	WH	Is he a student?	t
B03200012	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad old)))))"]	1J0	chat	YN	isn't she old	t
B03200097	["QUt (PosQ (YN (Sentence (Item (Apos (Entity sabrina)) name) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	is Sabrina's name beautiful	f
B03200089	["QUt (NegQ (WH_Pred (WHose age) (Be_vp (Be_bad twentythree))))"]	1J0	chat	WH	Whose age isn't 23?	t
B03200063	["QUt (PosQ (YN (Sentence (Entity yisian) (ToPlace come (Locating from taiwan)))))"]	1J0	chat	YN	does YiSian come from Taiwan	t
B03200087	who like Jack?	1J0	chat	WH	who like Jack?	f
B03200078	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad female))))"]	1J0	chat	WH	who isn't female?	t
B03200097	["QUt (NegQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	Isn't he a student?	t
B03200012	["QUt (NegQ (YN (Sentence she (V_that_S say (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan)))))))))"]	1J0	chat	YN	doesn't she say that she is from Taiwan	t
B03200056	["QUt (NegQ (YN (Sentence (Entity sabrina) (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	YN	isn't Sabrina from Turkey	t
B03200094	["QUt (NegQ (YN (Sentence (Entity ariel) (Changing greet (Entity alice)))))"]	1J0	chat	YN	Doesn't Ariel greet Alice?	t
B99110055	who female from USA 	1J0	chat	WH	who female from USA 	f
B03200046	["QUt (PosQ (YN (Sentence it (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	Is it a student?	t
B03200097	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item (Apos (Entity must)) student)))))"]	1J0	chat	WH	who is MUST's student	f
B03200063	does she have older brother	1J0	siar	YN	does she have older brother	f
B03200087	do Simon have a younger sister?	1J0	siar	WH	do Simon have a younger sister?	f
B03200012	Who likes English?	1J0	siar	WH	Who likes English?	f
B03200050	Does Simon favorite sport is baseball?	1J0	siar	WH	Does Simon favorite sport is baseball?	f
B03200074	Who likes English	1J0	siar	WH	Who likes English	f
B03200012	["QUt (PosQ (YN (Sentence he (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	YN	is he from Turkey	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_somewhere (Locating from taiwan)))))"]	1J0	chat	WH	who is from Taiwan?	t
B03200012	["QUt (NegQ (YN (Sentence he (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	YN	isn't he from Turkey	t
B03200012	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad beautiful))))"]	1J0	chat	WH	who is beautiful	t
B03200082	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad sixteen))))"]	1J0	chat	WH	who is 16	t
B03200082	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad fifteen))))"]	1J0	chat	WH	who is 15	t
B03200102	["QUt (PosQ (YN (Sentence (Entity alice) (V_that_S say (PosS (Sentence she (Be_vp (Be_bad sixteen))))))))"]	1J0	chat	WH	Does Alice say that she is 16?	f
B03200082	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad eighteen))))"]	1J0	chat	WH	who is 18	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad beautiful))))"]	1J0	chat	WH	who isn't beautiful	t
B03200012	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad young))))"]	1J0	chat	WH	who is young	t
B03200050	Who is girl?	1J0	chat	WH	Who is girl?	f
B03200031	["QUt (PosQ (YN (Sentence (Entity ellarose) (V_that_S say (PosS (Sentence she (Be_vp (Be_bad sixteen))))))))"]	1J0	chat	YN	Does Ellarose say that she is 16	f
B03200097	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad female))))"]	1J0	chat	WH	who is female	t
B03200087	when Taiwan is beautiful	1J0	chat	WH	when Taiwan is beautiful	f
B03200029	["QUt (PosQ (YN (Sentence (Entity mandy) (V_S say (PosS (Sentence she (Be_vp (Be_bad nineteen))))))))"]	1J0	chat	YN	Does Mandy say she is 19?	f
B01202106	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_somewhere (Locating from turkey)))))"]	1J0	chat	WH	Who is from  Turkey?	t
B03200031	["QUt (PosQ (YN (Sentence she (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	Is she a student?	t
B03200097	["QUt (PosQ (WH_Pred (WHose stranger) (Be_vp (Be_someone (Entity junior)))))"]	1J0	chat	WH	whose stranger is Junior	t
B03200074	["QUt (PosQ (YN (Sentence (Entity alice) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Is Alice from Taiwan	t
B03200087	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity demi)))))"]	1J0	chat	WH	who is Demi?	t
B03200082	who isn't from Ariel	1J0	chat	WH	who isn't from Ariel	f
B01202106	Who is from USA?	1J0	chat	WH	Who is from USA?	f
B03200012	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad good))))"]	1J0	chat	WH	who is good	t
B03200087	who woman is beautiful ?	1J0	chat	WH	who woman is beautiful ?	f
B03200050	["QUt (NegQ (YN (Sentence he (Be_vp (Be_bad old)))))"]	1J0	chat	YN	isn't he old?	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad good))))"]	1J0	chat	WH	who isn't good	t
B03200088	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item theSg_Det (Kind male man))))))"]	1J0	chat	YN	Who is the male man?	t
B03200082	who is age 18	1J0	chat	WH	who is age 18	f
B01202104	["QUt (PosQ (YN (Sentence it (Be_vp (Be_bad twentyone)))))"]	1J0	chat	WH	Is it 21?	t
B03200054	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing greet (Entity filibee)))))"]	1J0	chat	YN	Does Ariel greet Filibee?	t
B03200012	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind good girl))))))"]	1J0	chat	WH	who is a good girl	t
B03200082	who is man	1J0	chat	WH	who is man	f
B03200082	who is greet	1J0	chat	WH	who is greet	t
B03200060	["Ut (PosS (Sentence (Entity alice) (Be_vp (Be_someone (Item a_Det woman)))))"]	1J0	chat	WH	Alice is a woman.	t
B03200012	["QUt (NegQ (YN (Sentence he (Be_vp (Be_bad eighteen)))))"]	1J0	chat	YN	isn't he 18	t
B03200094	["QUt (PosQ (WH_Pred (WHose stranger) (Be_vp (Be_someone (Entity must)))))"]	1J0	chat	WH	whose stranger is MUST?	t
B03200063	who  talk in Hispanic?	1J0	chat	WH	who  talk in Hispanic?	f
B03200089	["QUt (NegQ (YN (Sentence it (Be_vp (Be_bad right)))))"]	1J0	chat	YN	Isn't it right	t
B03200052	Does she is a student?	1J0	chat	YN	Does she is a student?	f
B03200012	["QUt (NegQ (YN (Sentence (Entity filibee) (V_that_S say (PosS (Sentence she (Be_vp (Be_somewhere (Locating from turkey)))))))))"]	1J0	chat	YN	doesn't Filibee  say that she is from Turkey	f
B03200046	Does she a student?	1J0	chat	YN	Does she a student?	f
B03200091	["QUt (PosQ (YN (Sentence (Entity jessie) (Be_vp (Be_someone (Item a_Det (Kind good girl)))))))"]	1J0	chat	YN	Is Jessie a good girl?	t
B99110055	who is a good MUST student? 	1J0	chat	WH	who is a good MUST student? 	f
B03200046	Is she come to Taiwan?	1J0	chat	YN	Is she come to Taiwan?	f
B03200087	["QUt (PosQ (YN (Sentence (Entity marian) (Be_vp (Be_bad old)))))"]	1J0	chat	YN	Is Marian old ?	t
B03200046	Does he come to Andy?	1J0	chat	YN	Does he come to Andy?	f
B03200094	Doesn't Marian come from MUST?	1J0	chat	YN	Doesn't Marian come from MUST?	f
B99110055	who are from USA 	1J0	chat	WH	who are from USA 	f
B03200034	Doesn't he like Alice?	1J0	chat	WH	Doesn't he like Alice?	f
B03200094	Doesn't Marian come from USA?	1J0	chat	YN	Doesn't Marian come from USA?	f
B03200046	Is it a female?	1J0	chat	YN	Is it a female?	f
B03200087	is Dora from USA?	1J0	chat	YN	is Dora from USA?	f
B03200046	Is she a female?	1J0	chat	YN	Is she a female?	f
B03200029	Is Andy beautiful man?	1J0	chat	YN	Is Andy beautiful man?	f
B03200046	["QUt (PosQ (YN (Sentence she (Be_vp (Be_someone (Item a_Det woman))))))"]	1J0	chat	YN	Is she a woman?	t
B03200029	["QUt (PosQ (YN (Sentence (Entity andy) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	Is Andy beautiful?	t
B03200094	Does Ariel come from USA?	1J0	chat	YN	Does Ariel come from USA?	f
B03200091	["QUt (PosQ (YN (Sentence (Entity ariel) (Happening understand))))"]	1J0	chat	YN	Does Ariel understand?	t
B03200087	is USA beautiful?	1J0	chat	YN	is USA beautiful?	f
B03200046	["QUt (PosQ (YN (Sentence she (Changing guess_V2 (Item (Apos (Entity andy)) age)))))"]	1J0	chat	YN	Does she guess Andy's age?	f
B03200092	["QUt (PosQ (WH_Pred who_WH (Intens like (Changing play (MassItem the_mass_Det guitar)))))"]	1J0	siar	WH	who likes to play the guitar ?	t
B03200034	Who  favorite subject is English?	1J0	siar	WH	Who  favorite subject is English?	f
B03200054	Who likes English song?	1J0	siar	WH	Who likes English song?	f
B03200083	Who like baseball?	1J0	siar	WH	Who like baseball?	f
B03200050	Simon favorite sport is baseball?	1J0	siar	WH	Simon favorite sport is baseball?	f
B03200083	Who likes baseball?	1J0	siar	WH	Who likes baseball?	f
B03200109	Who has five family?	1J0	siar	WH	Who has five family?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity simon) (Intens love (Changing play (MassItem the_mass_Det guitar))))))"]	1J0	siar	YN	Does Simon love to play the guitar?	t
B03200102	["QUt (PosQ (YN (Sentence (Entity simon) (WithPlace live (Locating in_prep taipei)))))"]	1J0	siar	YN	Does Simon live in Taipei?	t
B03200031	["QUt (PosQ (WH_Pred who_WH (Intens like (Changing play (MassItem zero_Det_sg guitar)))))"]	1J0	siar	WH	Who likes to play guitar?	t
B03200063	who like to play guitar	1J0	siar	WH	who like to play guitar	f
B03200109	Who have five family?	1J0	siar	WH	Who have five family?	f
B03200003	Does she like English?	1J0	siar	YN	Does she like English?	f
B03200018	["QUt (PosQ (WH_Pred (WHose family) (Changing have (Item five people))))"]	1J0	siar	WH	Whose family has five people?	t
B03200012	Whose lives in Taipei?	1J0	siar	WH	Whose lives in Taipei?	f
B03200046	["QUt (PosQ (WH_Pred (WHose (Kind favorite subject)) (Be_vp (Be_bad english))))"]	1J0	siar	WH	Whose favorite subject is English?	t
B03200006	Does he like to playing drums?	1J0	siar	WH	Does he like to playing drums?	f
B03200039	Who is play baseball	1J0	siar	WH	Who is play baseball	f
B03200052	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens like (Changing play (MassItem zero_Det_sg baseball))))))"]	1J0	siar	WH	Does Ariel like to play baseball	t
B03200094	["QUt (PosQ (WH_Pred who_WH (Changing have (Item a_Det brother))))"]	1J0	siar	WH	Who has an older brother?	t
B03200063	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item theSg_Det tourguide)))))"]	1J0	siar	WH	who is the tour guide	t
B03200029	["QUt (PosQ (YN (Membership five people (Locating in_prep (Location (Apos (Entity simon)) family_place)))))"]	1J0	siar	YN	Are there five people in Simon's family?	t
B03200089	["QUt (PosQ (YN (Sentence he (Intens like (Changing play (MassItem zero_Det_sg baseball))))))"]	1J0	siar	WH	Does he like to play baseball?	t
B03200046	["QUt (PosQ (WH_Pred (WHose (Kind chinese name)) (Be_vp (Be_someone (Entity chiyuantien)))))"]	1J0	siar	WH	Whose Chinese name is ChiYuan Tien?	t
B03200037	Who does Simon younger sister ?	1J0	siar	WH	Who does Simon younger sister ?	f
B03200052	who like to play guitar?	1J0	siar	YN	who like to play guitar?	f
B03200083	["QUt (PosQ (WH_Pred who_WH (Intens can (Changing play (MassItem the_mass_Det guitar)))))"]	1J0	siar	WH	Who can play the guitar?	t
B03200060	Does Simon feel ?	1J0	siar	YN	Does Simon feel ?	f
B03200063	Who is playing the drums	1J0	siar	WH	Who is playing the drums	f
B03200089	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item (Apos she) brother)))))","QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item her_Det brother)))))"]	1J0	siar	WH	Who is her older brother?	t
B03200019	["QUt (PosQ (WH_Pred who_WH (Intens like (Changing listen (Item zero_Det_pl (Kind english song))))))"]	1J0	siar	WH	Who likes to listen to English songs?	t
B03200063	Who is play the drums	1J0	siar	WH	Who is play the drums	f
B03200031	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing have (Item a_Det sister)))))"]	1J0	siar	YN	Does Ariel have a younger sister?	t
B03200106	Who like listening	1J0	siar	WH	Who like listening	f
B03200063	Who playing the drums	1J0	siar	WH	Who playing the drums	f
B03200012	["QUt (PosQ (WH_Pred who_WH (Changing have (Item a_Det sister))))"]	1J0	siar	WH	Who has a younger sister?	t
B03200054	["QUt (PosQ (WH_Pred who_WH (Intens like (Changing play (MassItem zero_Det_sg drums)))))"]	1J0	siar	WH	Who likes to play drums?	t
B03200031	["QUt (PosQ (YN (Sentence (Entity ariel) (WithPlace live (Locating in_prep taipei)))))"]	1J0	siar	YN	Does Ariel live in Taipei?	t
B03200078	Does Simon is humorous people?	1J0	siar	YN	Does Simon is humorous people?	f
B01202104	Who likes to playing guitar?	1J0	siar	WH	Who likes to playing guitar?	f
B03200074	Who have younger sister	1J0	siar	WH	Who have younger sister	f
B03200037	Does Ariel feel ?	1J0	siar	WH	Does Ariel feel ?	f
B03200056	Who like to play baseball 	1J0	siar	WH	Who like to play baseball 	f
B03200083	Who likes to study English?	1J0	siar	WH	Who likes to study English?	f
B03200063	["QUt (PosQ (YN (Sentence she (Look_bad feel happy))))"]	1J0	siar	YN	does she feel happy	t
B03200109	Does he has a younger sister	1J0	siar	WH	Does he has a younger sister	f
B03200078	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens like (Changing make_V2 (Item zero_Det_pl friend))))))"]	1J0	siar	YN	Does Ariel like to make friends?	t
B03200106	Who likes listening?	1J0	siar	WH	Who likes listening?	f
B03200019	["QUt (PosQ (WH_Pred who_WH (Intens want (Be_vp (Be_someone (Item a_Det translator))))))"]	1J0	siar	WH	Who wants to be a translator?	t
B03200092	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens want (Be_vp (Be_someone (Item a_Det tourguide)))))))"]	1J0	siar	YN	Does Ariel want to be a tour guide ?	t
B03200109	Does he has a younger sister?	1J0	siar	WH	Does he has a younger sister?	f
B03200031	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens love (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Does Ariel love to play drums?	t
B03200088	Who like to listen to English song?	1J0	siar	WH	Who like to listen to English song?	f
B03200063	does Simon happy	1J0	siar	YN	does Simon happy	f
B03200054	Who is humorous person?	1J0	siar	WH	Who is humorous person?	f
B03200097	Who has older brother?	1J0	siar	WH	Who has older brother?	f
B03200064	Does Simon playing guitar?	1J0	siar	WH	Does Simon playing guitar?	f
B03200034	Who is playing the drums?	1J0	siar	WH	Who is playing the drums?	f
B03200039	Who live in Taipei?	1J0	siar	WH	Who live in Taipei?	f
B03200083	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad nineteen))))"]	1J0	siar	WH	Who is 19 years old?	t
B03200034	Who is playing the drums ?	1J0	siar	WH	Who is playing the drums ?	f
B03200087	whose family loves song?	1J0	siar	YN	whose family loves song?	f
B03200037	["QUt (NegQ (YN (Sentence (Entity simon) (Intens love (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Doesn't Simon love to play drums ?	t
B03200097	whose is the beautiful girl	1J0	chat	WH	whose is the beautiful girl	f
B03200046	Isn't she come from Taiwan?	1J0	chat	YN	Isn't she come from Taiwan?	f
B03200097	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item theSg_Det (Kind beautiful girl))))))"]	1J0	chat	WH	who is the beautiful girl	t
B03200071	Does the stranger guess that Sabrina is 18 ?	1J0	chat	WH	Does the stranger guess that Sabrina is 18 ?	f
B03200031	Alice is good girl.	1J0	chat	YN	Alice is good girl.	f
B03200092	["QUt (PosQ (WH_Pred who_WH (ToPlace come (Locating from turkey))))"]	1J0	chat	WH	who comes from Turkey ?	f
B03200046	Is she come from Turkey?	1J0	chat	YN	Is she come from Turkey?	f
B03200012	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is he good	t
B03200012	["QUt (NegQ (YN (Sentence he (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't he good	t
B03200056	["QUt (PosQ (YN (Sentence (Entity cheney) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Is Cheney from Taiwan	t
B03200012	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad right)))))"]	1J0	chat	YN	is she right	t
B03200012	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad right)))))"]	1J0	chat	YN	isn't she right	t
B03200089	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad twentythree))))"]	1J0	chat	WH	Who isn't 23?	t
B03200013	["QUt (PosQ (YN (Sentence (Entity mandy) (V_that_S say (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan)))))))))"]	1J0	chat	YN	Does Mandy say that she is from Taiwan?	f
B03200052	Does she is young	1J0	chat	WH	Does she is young	f
B03200056	["QUt (PosQ (YN (Sentence (Entity cherry2) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Is Cherry2 from Taiwan	t
B01202104	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad twentyone))))"]	1J0	chat	WH	Who is 21	t
B03200063	does YiSian come from USA	1J0	chat	YN	does YiSian come from USA	f
B03200056	Who is man 	1J0	chat	WH	Who is man 	f
B03200063	["QUt (PosQ (YN (Sentence (Entity yisian) (ToPlace come (Locating from turkey)))))"]	1J0	chat	YN	does YiSian come from Turkey	t
B03200019	Who is from USA ?	1J0	chat	WH	Who is from USA ?	f
B03200060	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing greet (Entity alice)))))"]	1J0	chat	WH	Does Ariel greet Alice?	t
B03200082	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad male))))"]	1J0	chat	WH	who is male	t
B03200062	Who talk to the stranger?	1J0	chat	WH	Who talk to the stranger?	f
B03200097	["QUt (NegQ (YN (Sentence she (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	YN	isn't she from Turkey 	t
B03200046	Doesn't she come Taiwan?	1J0	chat	YN	Doesn't she come Taiwan?	f
B01202106	["QUt (PosQ (WH_Pred who_WH (ToPlace come (Locating from taiwan))))"]	1J0	chat	WH	Who comes from Taiwan?	f
B03200012	["QUt (PosQ (YN (Sentence (Entity ellarose) (Be_vp (Be_bad sixteen)))))"]	1J0	chat	YN	is Ellarose  16	t
B03200012	["QUt (NegQ (YN (Sentence (Entity ellarose) (Be_vp (Be_bad sixteen)))))"]	1J0	chat	YN	isn't Ellarose 16	t
B03200097	["QUt (PosQ (YN (Sentence (Entity marian) (ToPlace come (Locating from taiwan)))))"]	1J0	chat	YN	does Marian come from Taiwan 	t
B03200082	["QUt (NegQ (WH_Pred (WHose age) (Be_vp (Be_bad nineteen))))"]	1J0	chat	YN	Whose age isn't 19	t
B03200087	is it from MUST?	1J0	chat	YN	is it from MUST?	f
B03200087	["QUt (PosQ (YN (Sentence it (Be_vp (Be_someone (Entity must))))))"]	1J0	chat	YN	is it  MUST?	t
B03200097	["QUt (NegQ (YN (Sentence (Entity marian) (ToPlace come (Locating from taiwan)))))"]	1J0	chat	YN	doesn't Marian come from Taiwan 	t
B03200082	["QUt (NegQ (WH_Pred (WHose age) (Be_vp (Be_bad eighteen))))"]	1J0	chat	YN	Whose age isn't 18	t
B03200012	["QUt (PosQ (YN (Sentence (Entity filibee) (V_that_S say (PosS (Sentence she (Be_vp (Be_somewhere (Locating from turkey)))))))))"]	1J0	chat	YN	does Filibee  say that she is from Turkey	f
B03200046	Does he talk to Mandy?	1J0	chat	YN	Does he talk to Mandy?	f
B03200060	Does she from the USA?	1J0	chat	WH	Does she from the USA?	f
B03200006	Does she guess right?	1J0	chat	YN	Does she guess right?	f
B03200087	when Andy is old	1J0	chat	WH	when Andy is old	f
B03200060	Doesn't she from the USA?	1J0	chat	WH	Doesn't she from the USA?	f
B03200013	Who is USA?	1J0	chat	WH	Who is USA?	f
B03200046	Is she say that she is from Taiwan?	1J0	chat	YN	Is she say that she is from Taiwan?	f
B03200062	["QUt (PosQ (WH_Pred who_WH (WithStyle (Be_vp (Be_someone (Item a_Det student))) (Styling from_prep (Entity must)))))"]	1J0	chat	WH	who is a student from MUST?	t
B03200087	["QUt (PosQ (YN (Sentence (Entity stefan) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	is Stefan beautiful?	t
B03200089	["Ut (NegS (Sentence (Entity mandy) (Be_vp (Be_someone (Item a_Det student)))))"]	1J0	chat	YN	Mandy isn't a student	t
B03200018	who is woman	1J0	chat	WH	who is woman	f
B03200094	Isn't Ellarose from USA?	1J0	chat	YN	Isn't Ellarose from USA?	f
B03200046	Does she come to MUST?	1J0	chat	YN	Does she come to MUST?	f
B03200097	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity dora)))))"]	1J0	chat	WH	whose name is Dora	t
B03200046	Is she come to MUST?	1J0	chat	YN	Is she come to MUST?	f
B03200097	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity viola1)))))"]	1J0	chat	WH	whose name is Viola1	t
B03200094	Does Ellarose come  from USA?	1J0	chat	YN	Does Ellarose come  from USA?	f
B03200034	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item theSg_Det (Kind good girl))))))"]	1J0	chat	WH	who is the good girl ?	t
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity demi)))))"]	1J0	chat	WH	whose name isn't Demi	t
B03200089	["QUt (PosQ (YN (Sentence she (Be_vp (Be_someone (Item a_Det (Kind good student)))))))"]	1J0	chat	YN	Is she a good student?	t
B03200087	Who is from the Taiwan?	1J0	chat	WH	Who is from the Taiwan?	f
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity alice)))))"]	1J0	chat	WH	whose name isn't Alice	t
B03200063	who is good in Hispanic?	1J0	chat	WH	who is good in Hispanic?	f
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity annie)))))"]	1J0	chat	WH	whose name isn't Annie	t
B03200087	who is greet woman?	1J0	chat	WH	who is greet woman?	f
B03200018	Does Simon love play guitar?	1J0	siar	WH	Does Simon love play guitar?	f
B03200034	Who is play the drums ?	1J0	siar	WH	Who is play the drums ?	f
B01202104	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens love (Changing play (MassItem the_mass_Det guitar))))))"]	1J0	siar	WH	Does Ariel love to play the guitar?	t
B03200034	Who is play the drums?	1J0	siar	WH	Who is play the drums?	f
B03200018	Does Simon love play the guitar?	1J0	siar	WH	Does Simon love play the guitar?	f
B03200087	whose family love song?	1J0	siar	YN	whose family love song?	f
B03200029	Who like to play baseball?	1J0	siar	WH	Who like to play baseball?	f
B03200094	["QUt (PosQ (YN (Sentence he (Look_bad feel happy))))"]	1J0	siar	WH	Does he feel happy?	t
B03200031	Whose family have five people?	1J0	siar	WH	Whose family have five people?	f
B03200046	["QUt (PosQ (YN (Sentence (Entity ariel) (Look_bad feel happy))))"]	1J0	siar	YN	Does Ariel feel happy?	t
B03200097	Who likes to listen English songs?	1J0	siar	WH	Who likes to listen English songs?	f
B03200031	Who family have five people?	1J0	siar	WH	Who family have five people?	f
B03200054	Who like listening to English song?	1J0	siar	WH	Who like listening to English song?	f
B03200087	Does Simon love song?	1J0	siar	YN	Does Simon love song?	f
B03200083	Who have a younger sister?	1J0	siar	WH	Who have a younger sister?	f
B03200006	["QUt (PosQ (YN (Sentence she (Changing have (Item theSg_Det sister)))))"]	1J0	siar	WH	Does she have the younger sister?	t
B03200087	Does Simon love a song?	1J0	siar	YN	Does Simon love a song?	f
B03200082	["QUt (PosQ (YN (Sentence (Item (Apos (Entity simon)) sister) (WithPlace study (Locating in_prep minghu)))))"]	1J0	siar	YN	Does Simon's younger sister study in Minghu Junior High School?	t
B03200082	["QUt (PosQ (YN (Sentence (Item (Apos (Entity simon)) brother) (WithPlace study (Locating in_prep wenhua)))))"]	1J0	siar	YN	Does Simon's older brother study in WenHua University?	t
B01202106	["QUt (PosQ (WH_Pred who_WH (Intens can (Changing play (MassItem zero_Det_sg baseball)))))"]	1J0	siar	WH	Who can play baseball?	t
B03200089	["QUt (PosQ (YN (Sentence he (WithPlace live (Locating in_prep taipei)))))"]	1J0	siar	YN	Does he live in Taipei?	t
B03200037	["QUt (NegQ (YN (Sentence he (Intens like (Changing play (MassItem zero_Det_sg baseball))))))"]	1J0	siar	YN	Doesn't he like to play baseball?	t
B03200109	Does Simon have friend?	1J0	siar	WH	Does Simon have friend?	f
B03200052	Does Ariel like English?	1J0	siar	WH	Does Ariel like English?	f
B03200074	["QUt (PosQ (WH_Pred (WHose father) (WithPlace live (Locating in_prep taipei))))"]	1J0	siar	WH	whose father lives in Taipei	t
B03200031	Who have an younger sister?	1J0	siar	WH	Who have an younger sister?	f
B03200029	Who likes play baseball?	1J0	siar	WH	Who likes play baseball?	f
B03200046	Does Simon loves to play guitar?	1J0	siar	YN	Does Simon loves to play guitar?	f
B03200094	Who is happy person?	1J0	siar	WH	Who is happy person?	f
B03200083	Who likes to study the English?	1J0	siar	WH	Who likes to study the English?	f
B03200037	["QUt (NegQ (YN (Sentence (Entity ariel) (Changing have (Item a_Det sister)))))"]	1J0	siar	YN	Doesn't Ariel have a younger sister?	t
B03200056	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind humorous person))))))"]	1J0	siar	WH	Who is a humorous person	t
B03200046	["QUt (PosQ (YN (Sentence (Entity simon) (Intens love (Changing play (MassItem zero_Det_sg guitar))))))"]	1J0	siar	YN	Does Simon love to play guitar?	t
B03200031	Who is she?	1J0	siar	WH	Who is she?	f
B03200032	Who have father?	1J0	siar	WH	Who have father?	f
B03200045	do Simon love to playing?	1J0	siar	WH	do Simon love to playing?	f
B03200102	Does Simon loves play the guitar?	1J0	siar	YN	Does Simon loves play the guitar?	f
B03200012	["QUt (PosQ (YN (Sentence (Entity simon) (Intens like (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Does Simon like to play drums?	t
B03200032	Who has father?	1J0	siar	WH	Who has father?	f
B03200102	Does Simon like play the guitar?	1J0	siar	YN	Does Simon like play the guitar?	f
B03200094	["QUt (NegQ (WH_Pred who_WH (Look_bad feel happy)))"]	1J0	siar	WH	Who doesn't feel happy?	t
B03200052	who like to play baseball?	1J0	siar	WH	who like to play baseball?	f
B03200012	["QUt (PosQ (YN (Sentence (Entity simon) (Changing have (Item a_Det brother)))))"]	1J0	siar	YN	Does Simon have an older brother?	t
B03200045	Does he love to playing?	1J0	siar	WH	Does he love to playing?	f
B03200054	["QUt (PosQ (WH_Pred who_WH (Intens can (Changing play (MassItem zero_Det_sg drums)))))"]	1J0	siar	WH	Who can play drums?	t
B03200032	["QUt (PosQ (WH_Pred who_WH (Intens want (Be_vp (Be_someone (Item a_Det tourguide))))))"]	1J0	siar	WH	Who wants to be a tour guide?	t
B03200052	who like to play baseball ?	1J0	siar	WH	who like to play baseball ?	f
B03200045	["QUt (PosQ (YN (Sentence he (Intens love (Changing play (MassItem zero_Det_sg guitar))))))"]	1J0	siar	WH	Does he love to play guitar?	t
B03200106	who likes to listening?	1J0	siar	WH	who likes to listening?	f
B03200074	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad humorous))))"]	1J0	siar	WH	who is humorous	t
B03200039	["QUt (PosQ (WH_Pred who_WH (Intens want (Be_vp (Be_someone (CloseList or_Conj (List (Item a_Det translator) (Item a_Det tourguide))))))))"]	1J0	siar	WH	Who wants to be a translator or a tour guide?	t
B03200087	Does Simon have family?	1J0	siar	YN	Does Simon have family?	f
B03200088	["QUt (PosQ (YN (Sentence (Entity simon) (Intens like (Changing play (MassItem zero_Det_sg guitar))))))"]	1J0	siar	YN	Does Simon like to play guitar?	t
B03200087	["QUt (PosQ (YN (Sentence (Entity simon) (Changing have (Item a_Det family)))))"]	1J0	siar	YN	Does Simon have a family?	t
B03200083	Who likes the English?	1J0	siar	WH	Who likes the English?	f
B03200037	["QUt (NegQ (YN (Sentence (Entity simon) (WithPlace live (Locating in_prep taipei)))))"]	1J0	siar	YN	Doesn't Simon live in Taipei?	t
B01202106	["QUt (PosQ (YN (Sentence (Entity simon) (Intens like (Changing play (MassItem zero_Det_sg baseball))))))"]	1J0	siar	YN	Does Simon like to play baseball?	t
B01202104	Does Ariel love to playing drums?	1J0	siar	YN	Does Ariel love to playing drums?	f
B03200082	["QUt (PosQ (YN (Sentence (Item (Apos (Entity simon)) family) (Changing have (Item five people)))))"]	1J0	siar	YN	Does Simon's family have five people ?	t
V0141002	Is Frank seventeen?	FLA0017	clay	YN	Is Frank seventeen?	f
B03200094	["QUt (PosQ (WH_Pred (WHose mother) (WithPlace live (Locating in_prep taipei))))"]	1J0	siar	WH	Whose mother lives in Taipei?	t
B03200034	Does Simon older brother ?	1J0	siar	YN	Does Simon older brother ?	f
B03200012	["QUt (PosQ (YN (Sentence (Entity simon) (Be_vp (Be_bad humorous)))))"]	1J0	siar	YN	Is Simon humorous?	t
B03200094	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind happy person))))))"]	1J0	siar	WH	Who is a happy person?	t
B03200013	who likes English	1J0	siar	WH	who likes English	f
B03200087	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad old))))"]	1J0	chat	WH	who is old ?	t
B03200056	["QUt (PosQ (YN (Sentence (Entity ariel) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Is Ariel from Taiwan	t
B03200097	["QUt (PosQ (WH_Pred who_WH (V_NP_whether_S ask_V2Q (Item a_Det stranger) (ICompS how_old he))))"]	1J0	chat	WH	who asks a stranger how old he is	f
B03200074	["QUt (PosQ (YN (Sentence (Entity marian) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Is Marian from Taiwan	t
B03200089	Doesn't he 18?	1J0	chat	WH	Doesn't he 18?	f
B01202106	Who is from Dora?	1J0	chat	WH	Who is from Dora?	f
B03200046	["QUt (NegQ (YN (Sentence he (ToPlace come (Locating from turkey)))))"]	1J0	chat	YN	Doesn't he come from Turkey?	t
B03200097	["QUt (PosQ (YN (Sentence he (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	is he from Taiwan 	t
B03200087	["QUt (PosQ (YN (Sentence (Entity junior) (Be_vp (Be_bad old)))))"]	1J0	chat	WH	is Junior old?	t
B03200082	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad twentythree))))"]	1J0	chat	WH	who is 23	t
B03200046	["QUt (PosQ (YN (Sentence (Item theSg_Det (Modified stranger (ObjRel IdRP (VPClSlash (Entity mandy) (V2Slash greet))))) (V_NP_whether_S ask_V2Q she (ICompS how_old she)))))"]	1J0	chat	YN	Does the stranger whom Mandy greets ask her how old she is	f
B03200088	Doesn't he old?	1J0	chat	YN	Doesn't he old?	f
B03200056	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity andy)))))"]	1J0	chat	WH	who is Andy?	t
B03200097	["QUt (NegQ (YN (Sentence (Entity cherry2) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Isn't Cherry2 from Taiwan 	t
B03200054	aren't they beautiful	1J0	chat	YN	aren't they beautiful	f
B03200094	who is stranger	1J0	chat	WH	who is stranger	f
B03200019	Does Sabrina say that she is a girl.  	1J0	chat	YN	Does Sabrina say that she is a girl.  	t
B03200046	who is a good MUST student?	1J0	chat	WH	who is a good MUST student?	f
B03200046	whose name is Turkey?	1J0	chat	WH	whose name is Turkey?	f
B03200052	Doesn't she is a student?	1J0	chat	YN	Doesn't she is a student?	f
B03200091	["QUt (PosQ (YN (Sentence (Entity cheney) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	Is Cheney young?	t
B03200087	Is it USA?	1J0	chat	YN	Is it USA?	f
B03200046	whose name is from USA?	1J0	chat	WH	whose name is from USA?	f
193001	["QUt (PosQ (YN (Sentence (Entity mandy) (V_NP_S tell (Item a_Det stranger) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from turkey)))))))))","QUt (PosQ (YN (Sentence (Entity mandy) (V_NP_that_S tell (Item a_Det stranger) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from turkey)))))))))"]	1J0	chat	YN	Does Mandy tell a stranger that she is from Turkey?	f
B03200091	["QUt (NegQ (YN (Sentence (Entity cheney) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	Isn't Cheney young?	t
B03200029	Who isn't girl?	1J0	chat	WH	Who isn't girl?	f
B03200046	when does she talk to stranger?	1J0	chat	WH	when does she talk to stranger?	f
B03200097	["QUt (NegQ (YN (Sentence (Entity yisian) (ToPlace come (Locating from taiwan)))))"]	1J0	chat	YN	doesn't YiSian come from Taiwan 	t
B03200102	Does Dora is from Taiwan	1J0	chat	YN	Does Dora is from Taiwan	f
B03200029	Who is like female?	1J0	chat	WH	Who is like female?	f
B03200087	["QUt (PosQ (YN (Sentence (Entity annie) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	is Annie young?	t
B03200087	["QUt (PosQ (YN (Sentence (Entity andy) (Be_vp (Be_bad old)))))"]	1J0	chat	YN	is Andy old?	t
B03200060	Does she from USA?	1J0	chat	WH	Does she from USA?	f
B03200018	["QUt (PosQ (YN (Sentence (Entity andy) (Be_vp (Be_bad twentyone)))))"]	1J0	chat	YN	is Andy 21 	t
B03200087	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_bad right)))))"]	1J0	chat	YN	is Maggie right?	t
B03200097	["QUt (PosQ (YN (Sentence she (Be_vp (Be_someone (Entity ariel))))))"]	1J0	chat	YN	is she Ariel 	t
B03200046	Does YiSian beautiful?	1J0	chat	YN	Does YiSian beautiful?	f
B03200012	who isn't greet	1J0	chat	WH	who isn't greet	f
B03200097	["QUt (NegQ (YN (Sentence (Entity ariel) (Changing greet (Entity filibee)))))"]	1J0	chat	YN	Doesn't Ariel greet Filibee?	t
B03200046	["QUt (PosQ (YN (Sentence he (Changing guess_V2 (Item (Apos (Entity andy)) age)))))"]	1J0	chat	YN	Does he guess Andy's age?	f
B03200003	Who is tell the right?	1J0	chat	WH	Who is tell the right?	f
B03200046	Does Mandy a student?	1J0	chat	YN	Does Mandy a student?	f
B03200094	Does Jessie is female?	1J0	chat	YN	Does Jessie is female?	f
B03200046	Does she in Taiwan?	1J0	chat	YN	Does she in Taiwan?	f
B03200062	["QUt (PosQ (YN (Sentence (Entity mandy) (WithStyle (Be_vp (Be_someone (Item a_Det student))) (Styling from_prep (Entity must))))))"]	1J0	chat	WH	Is Mandy a student from MUST?	t
B03200018	who is good girl	1J0	chat	WH	who is good girl	f
B03200046	Isn't she come to MUST?	1J0	chat	YN	Isn't she come to MUST?	f
B03200094	Does Ellarose from USA?	1J0	chat	YN	Does Ellarose from USA?	f
B03200097	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity sabrina)))))"]	1J0	chat	WH	whose name is Sabrina	t
B03200046	Isn't she like Taiwan?	1J0	chat	YN	Isn't she like Taiwan?	f
B03200087	Who is from the MUST?	1J0	chat	WH	Who is from the MUST?	f
B03200087	who is good man?	1J0	chat	WH	who is good man?	f
B03200029	["QUt (PosQ (YN (Sentence (Entity andy) (Be_vp (Be_someone (Item a_Det woman))))))"]	1J0	chat	YN	Is Andy a woman?	t
B03200046	Who greet to Annie?	1J0	chat	WH	Who greet to Annie?	f
B03200102	Does Andy like Cheney?	1J0	chat	YN	Does Andy like Cheney?	f
B03200097	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity sabrina)))))"]	1J0	chat	WH	whose name isn't Sabrina 	t
B03200089	["QUt (PosQ (YN (Sentence she (Be_vp (Be_someone (Item a_Det (Kind old woman)))))))"]	1J0	chat	YN	Is she a old woman?	t
B03200087	who name is Andy?	1J0	chat	WH	who name is Andy?	f
B03200056	Who favorite subject is English 	1J0	siar	WH	Who favorite subject is English 	f
B03200097	["QUt (PosQ (WH_Pred who_WH (Intens love (Changing play (MassItem the_mass_Det drums)))))"]	1J0	siar	WH	Who loves to play the drums?	t
B03200063	["QUt (PosQ (YN (Sentence (Entity simon) (Changing have (Item a_Det father)))))"]	1J0	siar	YN	does Simon have a father	t
B03200089	Is he optimistic?	1J0	siar	YN	Is he optimistic?	f
B03200106	Does he love to listening?	1J0	siar	WH	Does he love to listening?	f
B01202104	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens like (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Does Ariel like to play drums?	t
B03200034	Does Simon  have older brother ?	1J0	siar	YN	Does Simon  have older brother ?	f
B03200037	Whom like to play baseball?	1J0	siar	WH	Whom like to play baseball?	f
B03200089	Is he a optimistic person ?	1J0	siar	YN	Is he a optimistic person ?	f
B03200063	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing have (Item a_Det brother)))))"]	1J0	siar	YN	Does Ariel have a older brother	t
B03200032	["QUt (PosQ (YN (Sentence (Entity simon) (Intens want (Be_vp (Be_someone (Item a_Det tourguide)))))))"]	1J0	siar	YN	Does Simon want to be a tour guide?	t
B03200029	Who likes to subject is English?	1J0	siar	WH	Who likes to subject is English?	f
B03200046	Who listening songs ?	1J0	siar	WH	Who listening songs ?	f
B03200097	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind logical person))))))"]	1J0	siar	WH	Who is a logical person?	t
B03200082	["QUt (PosQ (WH_Pred (WHose family) (WithPlace live (Locating in_prep taipei))))"]	1J0	siar	WH	Whose family lives in Taipei?	t
B03200087	Does Ariel love Simon?	1J0	siar	YN	Does Ariel love Simon?	f
B03200087	Does Ariel loves Simon?	1J0	siar	YN	Does Ariel loves Simon?	f
B03200087	Are Ariel love Simon?	1J0	siar	YN	Are Ariel love Simon?	f
B03200052	who is play guitar	1J0	siar	WH	who is play guitar	f
B03200109	["QUt (NegQ (YN (Sentence (Entity simon) (Look_bad feel happy))))"]	1J0	siar	WH	Doesn't Simon feel happy?	t
B03200039	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens want (Be_vp (Be_someone (CloseList or_Conj (List (Item a_Det translator) (Item a_Det tourguide)))))))))"]	1J0	siar	YN	Does Ariel want to be a translator or a tour guide?	t
B03200056	Does she likes to listen to English	1J0	siar	YN	Does she likes to listen to English	f
B03200063	Is Ariel a positive person	1J0	siar	YN	Is Ariel a positive person	f
B03200087	Is Ariel love Simon?	1J0	siar	YN	Is Ariel love Simon?	f
B03200062	Who likes to play a guitar?	1J0	siar	WH	Who likes to play a guitar?	f
B03200071	Does Simon love Ariel	1J0	siar	YN	Does Simon love Ariel	f
B03200056	Does she likes to listen to English songs	1J0	siar	YN	Does she likes to listen to English songs	f
B03200046	Who is listening songs?\t	1J0	siar	WH	Who is listening songs?\t	f
B03200013	Doesn't Simon like play baseball?	1J0	siar	YN	Doesn't Simon like play baseball?	f
B03200083	Does Ariel Chinese name is ChiYuan Tien?	1J0	siar	WH	Does Ariel Chinese name is ChiYuan Tien?	f
B03200034	Ariel loves Simon?	1J0	siar	YN	Ariel loves Simon?	f
B03200018	["QUt (PosQ (YN (Sentence (Entity simon) (Changing play (MassItem zero_Det_sg baseball)))))"]	1J0	siar	YN	Does Simon play baseball?	t
B03200052	["QUt (PosQ (WH_Pred what_WH (Be_vp (Be_someone (Item (Apos (Entity simon)) (Kind favorite sport))))))"]	1J0	siar	WH	What is Simon's favorite sport?	t
B03200037	Who does feel happy?	1J0	siar	WH	Who does feel happy?	f
B03200013	Does Simon like play baseball?	1J0	siar	YN	Does Simon like play baseball?	f
B03200042	Does Simon listening the songs	1J0	siar	WH	Does Simon listening the songs	f
B03200074	Is Simon lives in Taipei	1J0	siar	YN	Is Simon lives in Taipei	f
B03200056	["QUt (PosQ (YN (Sentence (Entity simon) (Intens want (Be_vp (Be_someone (CloseList or_Conj (List (Item a_Det translator) (Item a_Det tourguide)))))))))"]	1J0	siar	YN	Does Simon want to be a translator or a tour guide?	t
B03200037	Does Simon is a logical person?	1J0	siar	YN	Does Simon is a logical person?	f
B03200056	["QUt (PosQ (YN (Sentence (Entity simon) (Intens want (Be_vp (Be_someone (Item a_Det translator)))))))"]	1J0	siar	YN	Does Simon want to be a translator	t
B03200109	["QUt (PosQ (WH_Pred who_WH (Intens can (Changing play (MassItem the_mass_Det drums)))))"]	1J0	siar	WH	who can play the drums?	t
B03200056	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens want (Be_vp (Be_someone (Item a_Det translator)))))))"]	1J0	siar	YN	Does Ariel want to be a translator 	t
B03200042	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing play (MassItem zero_Det_sg baseball)))))"]	1J0	siar	YN	Does Ariel play baseball?	t
B03200037	["QUt (NegQ (YN (Sentence (Entity ariel) (Intens want (Be_vp (Be_someone (CloseList or_Conj (List (Item a_Det translator) (Item a_Det tourguide)))))))))"]	1J0	siar	YN	Doesn't Ariel want to be a translator or a tour guide?	t
B01202104	["QUt (PosQ (YN (Sentence he (Intens love (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Does he love to play drums?	t
B03200062	Does Ariel likes to listen to English songs?	1J0	siar	YN	Does Ariel likes to listen to English songs?	f
B03200098	Who like to play baseball	1J0	siar	WH	Who like to play baseball	f
B03200074	Who feel relaxed	1J0	siar	WH	Who feel relaxed	f
B03200056	["QUt (PosQ (YN (Sentence she (Intens love (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Does she love to play drums?	t
B03200012	Does Ariel have mother?	1J0	siar	YN	Does Ariel have mother?	f
B03200032	["QUt (PosQ (YN (Sentence (Entity simon) (WithPlace study (Locating in_prep wenhua)))))"]	1J0	siar	YN	Does Simon study in WenHua University	t
B03200012	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing have (Item a_Det mother)))))"]	1J0	siar	YN	Does Ariel have a mother?	t
B03200056	["QUt (PosQ (YN (Sentence (Entity ariel) (Be_vp (Be_bad humorous)))))"]	1J0	siar	YN	Is Ariel humorous?	t
B03200012	["QUt (PosQ (YN (Sentence (Entity simon) (Changing have (Item a_Det mother)))))"]	1J0	siar	YN	Does Simon have a mother?	t
B03200082	Does Simon have mother?	1J0	siar	YN	Does Simon have mother?	f
B03200046	Does Ariel have father?	1J0	siar	WH	Does Ariel have father?	f
B03200046	Does Ariel has father?	1J0	siar	WH	Does Ariel has father?	f
B03200071	["QUt (PosQ (YN (Sentence she (Changing play (Item theSg_Det tourguide)))))"]	1J0	siar	WH	Does she play the tour guide?	t
B03200087	Is it Turkey?	1J0	chat	YN	Is it Turkey?	f
B03200037	["QUt (NegQ (YN (Sentence (Entity ariel) (Intens like (Changing make_V2 (Item zero_Det_pl friend))))))"]	1J0	siar	YN	Doesn't Ariel like to make friends?	t
B03200052	["QUt (PosQ (WH_Pred who_WH (Intens can (Changing play (MassItem zero_Det_sg guitar)))))"]	1J0	siar	WH	who can play guitar?	t
B03200089	["QUt (PosQ (WH_Pred who_WH (Intens like_ing (Changing play (MassItem zero_Det_sg guitar)))))"]	1J0	siar	WH	Who likes playing guitar?	t
B03200012	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing listen (Item zero_Det_pl (Kind english song))))))"]	1J0	siar	YN	Does Ariel listen to English songs?	t
B03200083	Whose older brother study in Taipei?	1J0	siar	WH	Whose older brother study in Taipei?	f
B03200083	Whose older brother is study in Taipei?	1J0	siar	WH	Whose older brother is study in Taipei?	f
B03200029	Does Simon like to mother?	1J0	siar	YN	Does Simon like to mother?	f
B03200031	["Ut (PosS (Sentence (Entity alice) (Be_vp (Be_someone (Item a_Det (Kind good girl))))))"]	1J0	chat	YN	Alice is a good girl.	t
B03200012	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is she good	t
B03200050	doesn't he like Alice?	1J0	chat	YN	doesn't he like Alice?	f
B03200054	["QUt (PosQ (YN (Sentence (Item theSg_Det stranger) (V_that_S say (PosS (Sentence he (Be_vp (Be_bad sixteen))))))))"]	1J0	chat	YN	Does the stranger say that he is 16	f
B03200056	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity jack)))))"]	1J0	chat	WH	who is Jack?	t
B01202104	Who is from the Taiwan	1J0	chat	WH	Who is from the Taiwan	f
B03200082	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad twentyone))))"]	1J0	chat	WH	who isn't 21	t
B03200019	["QUt (PosQ (YN (Sentence (Item a_Det stranger) (Changing greet (Entity sabrina)))))"]	1J0	chat	YN	Does a stranger greet Sabrina. 	t
B03200089	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad twentythree)))))"]	1J0	chat	WH	is he 23?	t
B03200019	["QUt (PosQ (YN (Sentence (Item theSg_Det stranger) (V_S say (PosS (Sentence he (Be_vp (Be_bad male))))))))"]	1J0	chat	YN	Does the stranger say he is male.	f
B03200082	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad right))))"]	1J0	chat	WH	who isn't right	t
B03200082	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad right))))"]	1J0	chat	WH	who is right	t
B03200097	Is Cherry2 from USA 	1J0	chat	YN	Is Cherry2 from USA 	f
B03200087	["QUt (PosQ (YN (Sentence (Entity sabrina) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	is Sabrina beautiful?	t
B03200037	Who isn't 18?	1J0	chat	WH	Who isn't 18?	t
B03200013	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity alice)))))"]	1J0	chat	WH	Whose name is Alice?	t
B01202104	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity maggie)))))"]	1J0	chat	WH	Who is Maggie	t
B03200102	Does Dora is from Taiwan?	1J0	chat	YN	Does Dora is from Taiwan?	f
B03200091	["QUt (PosQ (YN (Sentence (Entity annie) (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	YN	Is Annie from Turkey?	t
B03200063	who is talk to  Alice?	1J0	chat	WH	who is talk to  Alice?	f
B03200046	Does she talk to Mandy?	1J0	chat	YN	Does she talk to Mandy?	f
B03200091	["QUt (NegQ (YN (Sentence (Entity annie) (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	YN	Isn't Annie from Turkey?	t
B03200091	["QUt (NegQ (WH_Pred (WHose age) (Be_vp (Be_bad twentyone))))"]	1J0	chat	WH	Whose age isn't 21?	t
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity maggie)))))"]	1J0	chat	WH	whose name isn't Maggie	t
B03200091	["QUt (PosQ (YN (Sentence (Entity filibee) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	WH	Is Filibee from Taiwan	t
B03200046	Who greet to Taiwan?	1J0	chat	WH	Who greet to Taiwan?	f
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity yisian)))))"]	1J0	chat	WH	whose name isn't YiSian	t
B03200089	["QUt (PosQ (YN (Sentence she (Be_vp (Be_someone (Item a_Det (Kind good woman)))))))"]	1J0	chat	YN	Is she a good woman?	t
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity filibee)))))"]	1J0	chat	WH	whose name isn't Filibee	t
B03200050	["QUt (PosQ (YN (Sentence (Entity cheney) (Be_vp (Be_someone (Item a_Det girl))))))"]	1J0	chat	YN	Is Cheney a girl?	t
B03200102	Is Andy like a man	1J0	chat	YN	Is Andy like a man	f
B03200087	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity andy)))))"]	1J0	chat	WH	whose name is Andy	t
B03200097	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity dora)))))"]	1J0	chat	WH	whose name isn't Dora	t
B03200083	["QUt (NegQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det (Kind old man)))))))"]	1J0	chat	YN	isn't he a old man?	t
B03200029	Whose age 19?	1J0	chat	WH	Whose age 19?	f
B03200063	["QUt (PosQ (YN (Sentence (Entity alice) (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	is Alice a stranger?	t
B03200063	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	is Maggie a student	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified man (SubjRel that_RP (Be_vp (Be_bad nineteen)))))))))"]	1J0	chat	WH	who is a man that is 19?	t
B03200089	Are they young?	1J0	chat	YN	Are they young?	f
B03200087	["QUt (PosQ (YN (Sentence (Entity jack) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	is Jack beautiful?	t
B03200083	Is she like a man?	1J0	chat	YN	Is she like a man?	f
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified woman (SubjRel that_RP (Be_vp (Be_bad twentytwo)))))))))"]	1J0	chat	WH	who is a woman that is 22?	t
B03200087	["QUt (PosQ (YN (Sentence (Entity jack) (Be_vp (Be_bad old)))))"]	1J0	chat	YN	is Jack old?	t
B03200063	["QUt (PosQ (YN (Sentence (Entity sabrina) (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	is Sabrina a student	t
B03200087	["QUt (PosQ (YN (Sentence (Entity dora) (Be_vp (Be_bad old)))))"]	1J0	chat	YN	is Dora  old?	t
B03200091	doesn't she understand Mandy	1J0	chat	YN	doesn't she understand Mandy	f
B03200089	["QUt (PosQ (YN (Sentence (Item (Apos she) name) (Be_vp (Be_someone (Entity dora))))))","QUt (PosQ (YN (Sentence (Item her_Det name) (Be_vp (Be_someone (Entity dora))))))"]	1J0	chat	YN	is her name Dora?	f
B03200083	Is she like the old man?	1J0	chat	YN	Is she like the old man?	f
B03200032	is YiSian from USA	1J0	chat	YN	is YiSian from USA	f
B03200083	are they old man?	1J0	chat	YN	are they old man?	f
B03200089	is he name Andy ?	1J0	chat	YN	is he name Andy ?	f
B03200052	does Alice is female	1J0	chat	WH	does Alice is female	f
B03200089	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det tourguide)))))"]	1J0	siar	WH	Who is a tour guide?	t
B03200012	["QUt (PosQ (YN (Sentence he (Changing play (Item theSg_Det tourguide)))))"]	1J0	siar	YN	Does he play the tour guide	t
B03200012	["QUt (PosQ (YN (Sentence he (Changing play (MassItem the_mass_Det drums)))))"]	1J0	siar	YN	Does he play the drums?	t
B03200089	Whose baseball?	1J0	siar	WH	Whose baseball?	f
B03200018	["QUt (PosQ (WH_Pred (WHose brother) (WithPlace study (Locating at_prep wenhua))))"]	1J0	siar	WH	Whose older brother studies at WenHua University?	t
B03200012	["QUt (PosQ (YN (Sentence he (Changing play (MassItem zero_Det_sg guitar)))))"]	1J0	siar	YN	Does he play guitar?	t
B01202104	["QUt (NegQ (YN (Sentence (Entity simon) (Changing have (Item a_Det brother)))))"]	1J0	siar	YN	Doesn't Simon have a older brother?	t
B03200012	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't she good	t
B03200071	["QUt (PosQ (YN (Sentence (Entity alice) (V_NP_S tell (Entity ellarose) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan)))))))))","QUt (PosQ (YN (Sentence (Entity alice) (V_NP_that_S tell (Entity ellarose) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan)))))))))"]	1J0	chat	WH	Does Alice tell Ellarose that she is from Taiwan ?	f
B03200082	who is student	1J0	chat	WH	who is student	f
B03200082	who isn't student	1J0	chat	WH	who isn't student	f
B03200089	["QUt (PosQ (YN (Sentence (Entity ariel) (ToPlace come (Locating from turkey)))))"]	1J0	chat	WH	does Ariel come from Turkey?	t
B03200013	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity cheney)))))"]	1J0	chat	WH	Who is Cheney?	t
B03200037	Who is the MUST?	1J0	chat	WH	Who is the MUST?	f
B03200012	["QUt (PosQ (YN (Sentence (Entity yisian) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	is YiSian from Taiwan	t
B03200082	who isn't disconnect	1J0	chat	WH	who isn't disconnect	f
B03200046	does she a student?	1J0	chat	YN	does she a student?	f
B03200032	["QUt (PosQ (YN (Sentence she (Be_vp (Be_someone (Item a_Det (Kind young girl)))))))"]	1J0	chat	WH	is she a young girl	t
B03200102	who is beautiful female	1J0	chat	YN	who is beautiful female	f
B03200018	["QUt (PosQ (YN (Sentence (Entity alice) (Be_vp (Be_bad eighteen)))))"]	1J0	chat	YN	is Alice 18	t
B03200046	Does YiSian a student	1J0	chat	YN	Does YiSian a student	f
B03200087	when Andy is right	1J0	chat	WH	when Andy is right	f
B03200032	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind young girl))))))"]	1J0	chat	WH	who is a young girl	t
B03200046	Is she say?	1J0	chat	YN	Is she say?	f
B03200003	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item theSg_Det (Kind young man))))))"]	1J0	chat	WH	Who is the young man?	t
B03200006	["QUt (PosQ (YN (Sentence he (Happening understand))))"]	1J0	chat	YN	Does he understand?	t
B03200087	["QUt (PosQ (YN (Sentence (Entity junior) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is Junior good?	t
B03200012	who isn't from USA	1J0	chat	WH	who isn't from USA	f
B03200083	["QUt (PosQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det (Kind young man)))))))"]	1J0	chat	YN	Is he a young man?	t
B03200089	["QUt (PosQ (YN (Sentence she (Be_vp (Be_someone (Item a_Det (Kind young woman)))))))"]	1J0	chat	YN	Is she a young woman?	t
B03200083	["QUt (PosQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det (Kind old man)))))))"]	1J0	chat	YN	Is he a old man?	t
B03200046	Who like Taiwan?	1J0	chat	WH	Who like Taiwan?	f
B03200034	Aren't they young?	1J0	chat	WH	Aren't they young?	f
B03200089	["QUt (PosQ (YN (Sentence she (Be_vp (Be_someone (Item a_Det (Kind beautiful woman)))))))"]	1J0	chat	YN	Is she a beautiful woman?	t
B03200097	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity marian)))))"]	1J0	chat	WH	whose name isn't Marian	t
B03200083	["QUt (NegQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det (Kind young man)))))))"]	1J0	chat	YN	Isn't he a young man?	t
B03200012	who talk to stranger 	1J0	chat	WH	who talk to stranger 	f
B03200087	["QUt (PosQ (YN (Sentence (Entity dora) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	is Dora young?	t
B03200032	is she from USA	1J0	chat	YN	is she from USA	f
B03200089	["QUt (PosQ (YN (Sentence (Item (Apos she) name) (Be_vp (Be_someone (Entity alice))))))","QUt (PosQ (YN (Sentence (Item her_Det name) (Be_vp (Be_someone (Entity alice))))))"]	1J0	chat	YN	is her name Alice?	f
B03200089	["QUt (PosQ (YN (Sentence (Item (Apos she) name) (Be_vp (Be_someone (Entity jessie))))))","QUt (PosQ (YN (Sentence (Item her_Det name) (Be_vp (Be_someone (Entity jessie))))))"]	1J0	chat	YN	is her name Jessie ?	f
B03200083	Is she like old man?	1J0	chat	YN	Is she like old man?	f
B03200089	["QUt (PosQ (YN (Sentence (Item (Apos she) name) (Be_vp (Be_someone (Entity maggie))))))","QUt (PosQ (YN (Sentence (Item her_Det name) (Be_vp (Be_someone (Entity maggie))))))"]	1J0	chat	YN	is her name Maggie ?	f
B03200083	Are they old man?	1J0	chat	YN	Are they old man?	f
B03200032	["QUt (PosQ (YN (Sentence (Entity jessie) (Be_vp (Be_bad nineteen)))))"]	1J0	chat	YN	is Jessie 19	t
B03200046	who is a student that is from USA?	1J0	chat	WH	who is a student that is from USA?	f
B03200083	Are they understand?	1J0	chat	YN	Are they understand?	f
B03200032	["QUt (PosQ (YN (Sentence (Entity sabrina) (Be_vp (Be_bad twentyone)))))"]	1J0	chat	YN	is Sabrina 21	t
B03200032	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_bad sixteen)))))"]	1J0	chat	YN	is Maggie 16	t
B03200032	["QUt (PosQ (YN (Sentence (Entity dora) (Be_vp (Be_bad twentyone)))))"]	1J0	chat	YN	is Dora 21	t
B03200012	["QUt (PosQ (YN (Sentence (Item (Apos he) name) (Be_vp (Be_someone (Entity andy))))))","QUt (PosQ (YN (Sentence (Item he_Det name) (Be_vp (Be_someone (Entity andy))))))"]	1J0	chat	YN	is his name Andy	f
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified student (SubjRel that_RP (Be_vp (Be_bad old)))))))))"]	1J0	chat	WH	who is a student that is old?	t
B03200052	does she from Turkey?	1J0	chat	WH	does she from Turkey?	f
B03200032	["QUt (PosQ (YN (Sentence (Entity jack) (Be_vp (Be_bad fifteen)))))"]	1J0	chat	YN	is Jack 15	t
B03200012	["QUt (NegQ (YN (Sentence (Item (Apos he) name) (Be_vp (Be_someone (Entity andy))))))","QUt (NegQ (YN (Sentence (Item he_Det name) (Be_vp (Be_someone (Entity andy))))))"]	1J0	chat	YN	isn't his name Andy	f
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified student (SubjRel that_RP (Be_vp (Be_bad young)))))))))"]	1J0	chat	WH	who is a student that is young?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity simon) (Be_vp (Be_someone (Item a_Det (Kind logical person)))))))"]	1J0	siar	YN	Is Simon a logical person?	t
B03200056	["QUt (PosQ (YN (Sentence (Entity simon) (Look_bad feel happy))))"]	1J0	siar	YN	Does Simon feel happy?	t
B03200029	Does Simon likes to older brother?	1J0	siar	YN	Does Simon likes to older brother?	f
B03200056	["QUt (PosQ (YN (Sentence she (Intens like (Changing play (MassItem zero_Det_sg baseball))))))"]	1J0	siar	YN	Does she like to play baseball?	t
B03200012	["QUt (PosQ (WH_Pred who_WH (Changing have (MassItem zero_Det_sg drums))))"]	1J0	siar	WH	Who has drums?	t
B01202106	["QUt (PosQ (WH_Pred (WHose brother) (WithPlace study (Locating in_prep taipei))))"]	1J0	siar	WH	Whose older brother studies in Taipei?	t
B03200063	Whose guitar is	1J0	siar	WH	Whose guitar is	f
B03200087	Does family loves Simon ?	1J0	siar	YN	Does family loves Simon ?	f
B03200083	["QUt (PosQ (WH_Pred who_WH (Changing have (MassItem zero_Det_sg guitar))))"]	1J0	siar	WH	Who has guitar?	t
B03200012	Who have drums?	1J0	siar	WH	Who have drums?	f
B03200097	Does Ariel like to listen English songs?	1J0	siar	YN	Does Ariel like to listen English songs?	f
B03200029	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens like (Changing listen (Item zero_Det_pl (Kind english song)))))))"]	1J0	siar	YN	Does Ariel like to listen to English songs?	t
B03200087	Does family feel humorous?	1J0	siar	YN	Does family feel humorous?	f
B03200046	["QUt (PosQ (WH_Pred (WHose sister) (WithPlace study (Locating in_prep minghu))))"]	1J0	siar	WH	Whose younger sister studies in Minghu Junior High School?	t
B03200040	Who likes play the drums?	1J0	siar	WH	Who likes play the drums?	f
B03200097	Does Ariel like to study English?	1J0	siar	YN	Does Ariel like to study English?	f
B03200087	["QUt (PosQ (YN (Sentence (Entity ariel) (Look_bad feel humorous))))"]	1J0	siar	YN	Does Ariel feel humorous?	t
B01202104	Is Simon positive?	1J0	siar	YN	Is Simon positive?	f
B03200089	Whose older brother like playing guitar?	1J0	siar	WH	Whose older brother like playing guitar?	f
B03200040	["QUt (PosQ (WH_Pred who_WH (Intens like (Changing play (MassItem the_mass_Det drums)))))"]	1J0	siar	WH	Who likes to play the drums?	t
B03200018	["QUt (PosQ (WH_Pred (WHose sister) (WithPlace study (Locating in_prep wenhua))))"]	1J0	siar	WH	Whose younger sister studies in WenHua University?	t
B03200089	["QUt (PosQ (WH_Pred (WHose brother) (Intens like_ing (Changing play (MassItem zero_Det_sg guitar)))))"]	1J0	siar	WH	Whose older brother likes playing guitar?	t
B03200012	Who listen English songs?	1J0	siar	WH	Who listen English songs?	f
B03200012	Who listens English songs?	1J0	siar	WH	Who listens English songs?	f
B01202106	Who has mother?	1J0	siar	WH	Who has mother?	f
B01202104	Is Ariel positive?	1J0	siar	YN	Is Ariel positive?	f
B01202106	Who have mother?	1J0	siar	WH	Who have mother?	f
B03200012	["QUt (PosQ (WH_Pred who_WH (Changing listen (Item zero_Det_pl (Kind english song)))))"]	1J0	siar	WH	Who listens to English songs?	t
B03200018	Who love listens to English songs?	1J0	siar	WH	Who love listens to English songs?	f
B03200012	["QUt (PosQ (WH_Pred who_WH (Changing play (MassItem zero_Det_sg drums))))"]	1J0	siar	WH	Who plays drums?	t
B01202104	Who likes to play mother?	1J0	siar	YN	Who likes to play mother?	f
B03200012	["QUt (PosQ (WH_Pred who_WH (Changing play (MassItem zero_Det_sg guitar))))"]	1J0	siar	WH	Who plays guitar?	t
B03200018	Who likes listens to English songs?	1J0	siar	WH	Who likes listens to English songs?	f
B03200089	["QUt (PosQ (WH_Pred (WHose father) (Intens like_ing (Changing play (MassItem zero_Det_sg baseball)))))"]	1J0	siar	WH	Whose father likes playing baseball?	t
B03200087	Does Ariel listen a song?	1J0	siar	YN	Does Ariel listen a song?	f
B01202104	["QUt (PosQ (WH_Pred (WHose sister) (WithPlace study (Locating in_prep taipei))))"]	1J0	siar	YN	Whose younger sister studies in Taipei?	t
B03200029	Does Simon like to playing guitar?	1J0	siar	YN	Does Simon like to playing guitar?	f
B03200037	Whom favorite sport is baseball?	1J0	siar	WH	Whom favorite sport is baseball?	f
B03200087	Is Ariel listen a song?	1J0	siar	YN	Is Ariel listen a song?	f
B03200018	Who loves listens to English songs?	1J0	siar	WH	Who loves listens to English songs?	f
B01202106	["QUt (PosQ (WH_Pred who_WH (Intens like (Changing make_V2 (Item zero_Det_pl friend)))))"]	1J0	siar	WH	Who likes to make friends?	t
B03200056	Isn't Simon love to play the guitar?	1J0	siar	YN	Isn't Simon love to play the guitar?	f
B03200089	Does Simon like Chinese?	1J0	siar	YN	Does Simon like Chinese?	f
B03200056	Is Simon love to play the guitar?	1J0	siar	YN	Is Simon love to play the guitar?	f
B03200097	Does she like to listen English songs? 	1J0	siar	YN	Does she like to listen English songs? 	f
B03200040	Does Simon like play guitar?	1J0	siar	YN	Does Simon like play guitar?	f
B03200056	Is Simon loves to play the guitar?	1J0	siar	YN	Is Simon loves to play the guitar?	f
B03200056	Is Simon like to play the guitar?	1J0	siar	YN	Is Simon like to play the guitar?	f
B03200056	Is Simon likes to play the guitar?	1J0	siar	YN	Is Simon likes to play the guitar?	f
B03200089	Does Simon like to study Chinese?	1J0	siar	YN	Does Simon like to study Chinese?	f
B03200078	Who loves Simon ?	1J0	siar	WH	Who loves Simon ?	f
B03200018	He likes guitar isn't he?	1J0	siar	WH	He likes guitar isn't he?	f
B03200087	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing have (Item a_Det (Kind favorite song))))))"]	1J0	siar	YN	Does Ariel have a favorite song?	t
B03200078	Who likes Simon ?	1J0	siar	WH	Who likes Simon ?	f
B01202106	Who likes to listen songs?	1J0	siar	WH	Who likes to listen songs?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity simon) (Intens like (Changing play (MassItem the_mass_Det drums))))))"]	1J0	siar	YN	Does Simon like to play the drums?	t
B03200089	Does Simon like to study English?	1J0	siar	YN	Does Simon like to study English?	f
B03200056	["QUt (PosQ (YN (Sentence (Item (Apos (Entity ariel)) brother) (WithPlace study (Locating in_prep wenhua)))))"]	1J0	siar	YN	Does Ariel's older brother study in WenHua University?	t
B03200032	Does Ariel like to listen songs?	1J0	siar	YN	Does Ariel like to listen songs?	f
B03200018	Is he likes guitar isn't he	1J0	siar	YN	Is he likes guitar isn't he	f
B03200018	["QUt (NegQ (YN (Sentence she (Changing have (Item a_Det sister)))))"]	1J0	siar	WH	Doesn't she have a younger sister	t
B03200056	["QUt (PosQ (YN (Sentence (Entity simon) (Changing have (Item a_Det (Kind favorite song))))))"]	1J0	siar	YN	Does Simon have a favorite song?	t
B03200029	["QUt (PosQ (YN (Sentence (Entity simon) (Look_bad feel relaxed))))"]	1J0	siar	YN	Does Simon feel relaxed?	t
B03200046	Who likes to make friend?	1J0	siar	WH	Who likes to make friend?	f
B03200018	Do Ariel likes to study Chinese?	1J0	siar	YN	Do Ariel likes to study Chinese?	f
B03200056	["QUt (PosQ (YN (Sentence (Entity ariel) (Be_vp (Be_someone (Item a_Det (Kind happy person)))))))"]	1J0	siar	YN	Is Ariel a happy person?	t
B03200045	["QUt (PosQ (YN (Sentence (Entity alice) (ToPlace come (Locating from taiwan)))))"]	1J0	chat	WH	Does Alice come from Taiwan?	t
B03200012	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad right)))))"]	1J0	chat	YN	is he right	t
B03200087	who is come?	1J0	chat	WH	who is come?	f
B01202104	["QUt (PosQ (YN (Sentence (Entity sabrina) (Be_vp (Be_someone (Item a_Det (Kind good girl)))))))"]	1J0	chat	WH	Is Sabrina a good girl?	t
B03200060	["QUt (PosQ (YN (Sentence (Entity alice) (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	WH	Is Alice from Turkey?	t
B01202106	who come from Taiwan?	1J0	chat	WH	who come from Taiwan?	f
B03200097	["QUt (NegQ (YN (Sentence (Entity ellarose) (Be_vp (Be_bad female)))))"]	1J0	chat	YN	Isn't Ellarose female	t
B01202104	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad twentyone)))))"]	1J0	chat	WH	Is she 21?	t
B03200094	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity stefan)))))"]	1J0	chat	WH	Whose name is Stefan?	t
B03200097	["QUt (NegQ (YN (Sentence (Entity ariel) (Changing greet (Entity ellarose)))))"]	1J0	chat	YN	Doesn't Ariel greet Ellarose?	t
B03200018	["QUt (PosQ (YN (Sentence (Entity ariel) (Be_vp (Be_bad twentyone)))))"]	1J0	chat	YN	is Ariel 21	t
B03200046	["QUt (PosQ (YN (Sentence she (V_that_S say (PosS (Sentence she (Be_vp (Be_bad sixteen))))))))"]	1J0	chat	YN	Does she say that she is 16?	t
B03200060	who is like the USA?	1J0	chat	WH	who is like the USA?	f
B03200060	Alice is beautiful female	1J0	chat	WH	Alice is beautiful female	f
B03200037	["QUt (PosQ (YN (Sentence (Entity demi) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Is Demi from Taiwan	t
B03200097	["QUt (NegQ (YN (Sentence (Entity ariel) (Changing greet (Entity mandy)))))"]	1J0	chat	YN	Doesn't Ariel greet Mandy?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity sabrina) (Changing greet (Entity ariel)))))"]	1J0	chat	YN	Does Sabrina greet Ariel 	t
B03200062	who ask Alice name?	1J0	chat	WH	who ask Alice name?	f
B03200087	["QUt (PosQ (YN (Sentence (Entity dora) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	is Dora beautiful?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity sabrina) (Changing greet (Entity alice)))))"]	1J0	chat	YN	Does Sabrina greet Alice	t
B03200087	["QUt (PosQ (YN (Sentence (Entity ellarose) (Be_vp (Be_bad old)))))"]	1J0	chat	YN	is Ellarose old?	t
B03200046	Does he say that he is student?	1J0	chat	YN	Does he say that he is student?	f
B03200012	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity maggie)))))"]	1J0	chat	WH	whose name is Maggie	t
B03200060	Alice is a  female.	1J0	chat	WH	Alice is a  female.	f
B03200046	Who disconnect Ellarose?	1J0	chat	WH	Who disconnect Ellarose?	f
B03200063	["QUt (PosQ (YN (Sentence (Entity ariel) (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	is Ariel a stranger	t
B03200034	who understand?	1J0	chat	WH	who understand?	f
B03200063	["QUt (PosQ (YN (Sentence (Entity yisian) (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	is YiSian a stranger	t
B03200034	who understand name?	1J0	chat	WH	who understand name?	f
B03200091	doesn't he right	1J0	chat	YN	doesn't he right	f
B03200063	["QUt (PosQ (YN (Sentence (Entity sabrina) (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	is Sabrina a stranger	t
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity andy)))))"]	1J0	chat	WH	whose name isn't Andy	t
B03200032	["QUt (PosQ (YN (Sentence (Entity alice) (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	Is Alice a student?	t
B03200063	["QUt (PosQ (YN (Sentence (Entity ellarose) (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	is Ellarose a stranger	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind beautiful student))))))"]	1J0	chat	WH	who is a beautiful student?	t
B03200087	whose name is from MUST?	1J0	chat	WH	whose name is from MUST?	f
B03200063	["QUt (PosQ (YN (Sentence (Entity andy) (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	is Andy a stranger	t
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity jessie)))))"]	1J0	chat	WH	whose name isn't Jessie	t
B03200083	Is she come?	1J0	chat	YN	Is she come?	f
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified man (SubjRel that_RP (Be_vp (Be_somewhere (Locating from turkey))))))))))"]	1J0	chat	WH	who is a man that is from Turkey?	t
B03200083	Isn't she come?	1J0	chat	YN	Isn't she come?	f
B03200087	who is student ?	1J0	chat	WH	who is student ?	f
B03200097	["Ut (NegS (Sentence (Entity alice) (Be_vp (Be_someone (Item a_Det woman)))))"]	1J0	chat	YN	Alice isn't a woman. 	t
B03200089	Do they understand?	1J0	chat	YN	Do they understand?	f
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity jack)))))"]	1J0	chat	WH	whose name isn't Jack	t
B03200063	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	is Maggie a stranger	t
B03200091	Does Dora talk to stranger?	1J0	chat	YN	Does Dora talk to stranger?	f
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified woman (SubjRel that_RP (Be_vp (Be_bad fifteen)))))))))"]	1J0	chat	WH	who is a woman that is 15?	t
B03200034	whose like Junior?	1J0	chat	WH	whose like Junior?	f
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity stefan)))))"]	1J0	chat	WH	whose name isn't Stefan	t
B03200034	who like Junior?	1J0	chat	WH	who like Junior?	f
B03200083	Is she like man?	1J0	chat	YN	Is she like man?	f
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity junior)))))"]	1J0	chat	WH	whose name isn't Junior 	t
B03200083	Is she like the man?	1J0	chat	YN	Is she like the man?	f
B03200087	["QUt (PosQ (YN (Sentence (Entity sabrina) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	is Sabrina young?	t
B03200032	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens like (Changing listen (Item zero_Det_pl song))))))"]	1J0	siar	YN	Does Ariel like to listen to songs?	t
B03200032	["QUt (PosQ (YN (Sentence (Entity simon) (Intens like (Changing listen (Item zero_Det_pl song))))))"]	1J0	siar	YN	Does Simon like to listen to songs?	t
B03200082	["QUt (PosQ (YN (Sentence (Item (Apos (Entity ariel)) sister) (WithPlace study (Locating in_prep wenhua)))))"]	1J0	siar	YN	Does Ariel's younger sister study in WenHua University?	t
B01202104	Who is a positive person?	1J0	siar	YN	Who is a positive person?	f
B03200018	Does Ariel like Chinese?	1J0	siar	YN	Does Ariel like Chinese?	f
B03200074	["QUt (PosQ (YN (Membership five people (Locating in_prep (Location (Apos (Entity ariel)) family_place)))))"]	1J0	siar	YN	Are there five people in Ariel's family?	t
B03200018	Does Ariel like to study Chinese?	1J0	siar	YN	Does Ariel like to study Chinese?	f
B03200018	Does Ariel like to studies Chinese?	1J0	siar	YN	Does Ariel like to studies Chinese?	f
B03200087	Who loves play?	1J0	siar	WH	Who loves play?	f
B03200018	Does Ariel likes to study Chinese?	1J0	siar	YN	Does Ariel likes to study Chinese?	f
B03200012	["QUt (NegQ (YN (Sentence he (Be_vp (Be_bad right)))))"]	1J0	chat	YN	isn't he right	t
B01202106	["QUt (PosQ (YN (Sentence (Entity alice) (Be_vp (Be_someone (Item a_Det (Kind good girl)))))))"]	1J0	chat	WH	Is Alice a good girl?	t
B03200082	["QUt (NegQ (YN (Sentence he (ToPlace come (Locating from taiwan)))))"]	1J0	chat	YN	doesn't he come from Taiwan ?	t
B03200056	["QUt (PosQ (YN (Sentence (Entity annie) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Is Annie from Taiwan	t
B03200089	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad twentythree)))))"]	1J0	chat	WH	Is she 23?	t
B03200013	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad fifteen)))))"]	1J0	chat	WH	Is he 15?	t
B03200094	["QUt (PosQ (WH_Pred (WHose stranger) (Be_vp (Be_bad beautiful))))"]	1J0	chat	WH	whose stranger is beautiful?	t
B03200082	who is guess	1J0	chat	WH	who is guess	f
B03200029	Who is man?	1J0	chat	WH	Who is man?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity ellarose) (Be_vp (Be_bad female)))))"]	1J0	chat	YN	Is Ellarose female	t
B03200012	["QUt (NegQ (YN (Sentence (Entity yisian) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	isn't YiSian from Taiwan	t
B01202106	Who come from Taiwan?	1J0	chat	WH	Who come from Taiwan?	f
B03200063	Who is 19  old?	1J0	chat	WH	Who is 19  old?	f
B03200082	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad old))))"]	1J0	chat	WH	who isn't old	t
B03200078	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity lisa1)))))"]	1J0	chat	WH	who is Lisa1 ?	t
B03200037	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity jessie)))))"]	1J0	chat	WH	Who is Jessie	t
B03200054	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad nineteen)))))"]	1J0	chat	YN	Isn't she 19	t
B03200097	["QUt (NegQ (YN (Sentence (Entity junior) (Be_vp (Be_bad female)))))"]	1J0	chat	YN	isn't Junior female	t
B03200082	who is disconnect	1J0	chat	WH	who is disconnect	f
B03200097	["QUt (PosQ (YN (Sentence (Entity junior) (Be_vp (Be_bad female)))))"]	1J0	chat	YN	is Junior female 	t
B03200060	does she like the USA?	1J0	chat	WH	does she like the USA?	f
B03200091	Aren't they Taiwan	1J0	chat	YN	Aren't they Taiwan	f
B03200018	["QUt (PosQ (YN (Sentence (Entity mandy) (Be_vp (Be_bad sixteen)))))"]	1J0	chat	YN	is Mandy 16	t
B03200097	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing greet (Entity ellarose)))))"]	1J0	chat	YN	Does Ariel greet Ellarose?	t
B03200087	who is understand?	1J0	chat	WH	who is understand?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing greet (Entity mandy)))))"]	1J0	chat	YN	Does Ariel greet Mandy?	t
B03200046	["QUt (NegQ (YN (Sentence he (V_that_S say (PosS (Sentence he (Be_vp (Be_somewhere (Locating from turkey)))))))))"]	1J0	chat	YN	Doesn't he say that he is from Turkey?	t
B03200087	is Dora understand?	1J0	chat	YN	is Dora understand?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing greet (Entity sabrina)))))"]	1J0	chat	YN	Does Ariel greet Sabrina?	t
B01202106	Who is student?	1J0	chat	YN	Who is student?	f
B03200006	Does he talk to stranger?	1J0	chat	YN	Does he talk to stranger?	f
B03200063	who is stranger?	1J0	chat	WH	who is stranger?	f
B03200060	Alice is a beautiful female	1J0	chat	WH	Alice is a beautiful female	f
B03200046	["QUt (PosQ (YN (Sentence he (V_that_S say (PosS (Sentence he (Be_vp (Be_someone (Item a_Det student)))))))))"]	1J0	chat	YN	Does he say that he is a student?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity sabrina) (Changing greet (Entity junior)))))"]	1J0	chat	YN	Does Sabrina greet Junior 	t
B03200097	["QUt (NegQ (YN (Sentence (Entity sabrina) (Changing greet (Entity junior)))))"]	1J0	chat	YN	Doesn't Sabrina greet Junior 	t
B03200060	Alice is a  female	1J0	chat	WH	Alice is a  female	f
B03200063	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det stranger)))))"]	1J0	chat	WH	who is a stranger?	t
B03200097	["QUt (NegQ (YN (Sentence (Entity sabrina) (Changing greet (Entity alice)))))"]	1J0	chat	YN	Doesn't Sabrina greet Alice	t
B03200034	who understand Alice?	1J0	chat	WH	who understand Alice?	f
B03200083	Is he stranger?	1J0	chat	YN	Is he stranger?	f
B03200046	Whose name is from Demi?	1J0	chat	WH	Whose name is from Demi?	f
B03200029	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det man)))))"]	1J0	chat	WH	Who isn't a man?	t
B03200087	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det man)))))"]	1J0	chat	WH	who is a man ?	t
B03200083	["QUt (PosQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	Is he a stranger?	t
B03200046	who is girl	1J0	chat	WH	who is girl	f
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity cherry2)))))"]	1J0	chat	WH	whose name isn't Cherry2	t
B03200063	["QUt (PosQ (YN (Sentence (Entity filibee) (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	is Filibee a stranger	t
B03200012	["QUt (NegQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity cheney)))))"]	1J0	chat	WH	whose name isn't Cheney	t
B03200102	Who is a young female	1J0	chat	WH	Who is a young female	f
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified student (SubjRel that_RP (Be_vp (Be_bad beautiful)))))))))"]	1J0	chat	WH	who is a student that is beautiful?	t
B03200063	["QUt (PosQ (WH_Pred (WHose (Kind favorite subject)) (Be_vp (Be_bad chinese))))"]	1J0	siar	WH	Whose favorite subject is Chinese	t
B03200097	["QUt (PosQ (YN (Sentence (Entity simon) (Be_vp (Be_someone (Item a_Det (Kind happy person)))))))"]	1J0	siar	YN	Is Simon a happy person?	t
B01202104	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad happy))))"]	1J0	siar	YN	Who is happy?	t
B03200056	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens like (Changing play (MassItem the_mass_Det drums))))))"]	1J0	siar	YN	Does Ariel like to play the drums?	t
B03200046	Who like to make friend?	1J0	siar	WH	Who like to make friend?	f
B03200063	["QUt (PosQ (WH_Pred who_WH (Intens like (Changing listen (Item zero_Det_pl (Kind chinese song))))))"]	1J0	siar	WH	Who likes to listen to Chinese songs	t
B03200078	whose family  have three people ?	1J0	siar	WH	whose family  have three people ?	f
B03200056	["QUt (NegQ (YN (Sentence (Entity ariel) (Intens love (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Doesn't Ariel love to play drums ?	t
B03200089	["QUt (NegQ (YN (Sentence he (WithPlace live (Locating in_prep taipei)))))"]	1J0	siar	YN	Doesn't  he live in Taipei?	t
B03200018	Does Simon likes to study English?	1J0	siar	YN	Does Simon likes to study English?	f
B03200018	Does Simon like English?	1J0	siar	YN	Does Simon like English?	f
B03200082	["QUt (PosQ (YN (Sentence (Item (Apos (Entity ariel)) brother) (WithPlace study (Locating in_prep minghu)))))"]	1J0	siar	YN	Does Ariel's older brother study in Minghu Junior High School?	t
B03200087	Who loves song?	1J0	siar	WH	Who loves song?	f
B03200029	Does Ariel likes to English?	1J0	siar	YN	Does Ariel likes to English?	f
B03200083	Who likes the guitar?	1J0	siar	WH	Who likes the guitar?	f
B03200089	["QUt (NegQ (YN (Sentence (Entity ariel) (Intens love (Changing play (MassItem the_mass_Det guitar))))))"]	1J0	siar	YN	Doesn't Ariel love to play the guitar?	t
B03200063	who live in Taipei	1J0	siar	WH	who live in Taipei	f
B03200018	Does he like guitar?	1J0	siar	YN	Does he like guitar?	f
B03200018	Does he like play guitar?	1J0	siar	YN	Does he like play guitar?	f
B03200018	["QUt (PosQ (YN (Sentence he (Intens like (Changing play (MassItem zero_Det_sg guitar))))))"]	1J0	siar	YN	Does he like to play guitar?	t
B03200056	["QUt (PosQ (YN (Sentence (Item (Apos (Entity ariel)) sister) (WithPlace study (Locating in_prep minghu)))))"]	1J0	siar	YN	Does Ariel's younger sister study in Minghu Junior High School?	t
B03200018	["QUt (PosQ (YN (Sentence he (Intens like (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Does he like to play drums?	t
B03200087	Who have a family?	1J0	siar	WH	Who have a family?	f
B03200087	Who have family?	1J0	siar	WH	Who have family?	f
B03200052	Does Simon like baseball	1J0	siar	YN	Does Simon like baseball	f
B01202104	Who plays translator baseball?	1J0	siar	YN	Who plays translator baseball?	f
B03200018	["QUt (PosQ (YN (Sentence she (Intens like (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Does she like to play drums?	t
B03200046	Doesn't she like to make friend?	1J0	siar	YN	Doesn't she like to make friend?	f
B03200089	["QUt (NegQ (YN (Sentence (Item (Apos (Entity simon)) brother) (WithPlace study (Locating in_prep minghu)))))"]	1J0	siar	YN	Doesn't Simon's older brother study in Minghu Junior High School?	t
B03200052	Does Simon like baseball?	1J0	siar	YN	Does Simon like baseball?	f
B03200087	Who has family?	1J0	siar	WH	Who has family?	f
B03200098	who 	1J0	siar	WH	who 	f
B03200018	["QUt (PosQ (YN (Sentence she (Intens like (Changing play (MassItem zero_Det_sg guitar))))))"]	1J0	siar	YN	Does she like to play guitar?	t
B03200046	Does she like to make friend?	1J0	siar	YN	Does she like to make friend?	f
B03200046	Does she likes to make friend?	1J0	siar	YN	Does she likes to make friend?	f
B03200097	Is Simon an optimistic person?	1J0	siar	YN	Is Simon an optimistic person?	f
B03200018	["QUt (PosQ (YN (Sentence (Entity ariel) (Intens like (Changing play (MassItem zero_Det_sg guitar))))))"]	1J0	siar	YN	Does Ariel like to play guitar?	t
B03200078	["QUt (PosQ (WH_Pred (WHose brother) (Be_vp (Be_someone (Entity simon)))))"]	1J0	siar	WH	Whose older brother is Simon ?	t
B03200089	Don't they have friend?	1J0	siar	YN	Don't they have friend?	f
B03200056	["QUt (PosQ (YN (Sentence (Entity simon) (Look_bad feel humorous))))"]	1J0	siar	YN	Does Simon feel humorous?	t
B03200097	Is Simon optimistic?	1J0	siar	YN	Is Simon optimistic?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity simon) (Be_vp (Be_bad happy)))))"]	1J0	siar	YN	Is Simon happy?	t
B03200046	Does she likes to listen to  English songs?	1J0	siar	YN	Does she likes to listen to  English songs?	f
B03200018	["QUt (PosQ (YN (Sentence he (Intens like (Changing listen (Item zero_Det_pl (Kind english song)))))))"]	1J0	siar	YN	Does he like to listen to English songs?	t
B03200063	who is he	1J0	siar	WH	who is he	f
B03200089	["QUt (NegQ (YN (Sentence (Entity simon) (Changing have (Item a_Det friend)))))"]	1J0	siar	YN	Doesn't Simon have a friend?	t
B03200040	["QUt (PosQ (YN (Sentence (Entity ariel) (Be_vp (Be_bad happy)))))"]	1J0	siar	YN	Is Ariel happy?	t
B03200018	["QUt (PosQ (YN (Sentence (Entity simon) (Intens like (Changing listen (Item zero_Det_pl (Kind english song)))))))"]	1J0	siar	YN	Does Simon like to listen to English songs?	t
B03200083	Does Simon has younger sister?	1J0	siar	YN	Does Simon has younger sister?	f
B03200063	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item theSg_Det translator)))))"]	1J0	siar	WH	who is the translator	t
B03200093	["QUt (PosQ (WH_Pred (WHose sister) (Be_vp (Be_someone (Entity simon)))))"]	1J0	siar	WH	whose younger sister is Simon ?	t
B03200018	Does Simon relaxed?	1J0	siar	YN	Does Simon relaxed?	f
B03200093	["QUt (PosQ (WH_Pred (WHose father) (Be_vp (Be_someone (Entity simon)))))"]	1J0	siar	WH	whose father is Simon ?	t
B03200083	["QUt (PosQ (YN (Sentence (Entity chiyuantien) (Be_vp (Be_bad happy)))))"]	1J0	siar	YN	Is ChiYuan Tien happy?	t
B03200018	Does Simon like to relaxed?	1J0	siar	YN	Does Simon like to relaxed?	f
B03200046	["QUt (PosQ (WH_Pred (WHose mother) (Be_vp (Be_someone (Entity ariel)))))"]	1J0	siar	WH	whose mother is Ariel?	t
B03200093	["QUt (PosQ (WH_Pred (WHose mother) (Be_vp (Be_someone (Entity simon)))))"]	1J0	siar	WH	whose mother is Simon ?	t
B03200087	Who is family?	1J0	siar	WH	Who is family?	f
B03200046	["QUt (PosQ (WH_Pred (WHose family) (Be_vp (Be_someone (Entity simon)))))"]	1J0	siar	WH	Whose family is Simon?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity chiyuantien) (Intens like (Changing play (MassItem zero_Det_sg baseball))))))"]	1J0	siar	YN	Does ChiYuan Tien like to play baseball?	t
B03200029	["QUt (PosQ (WH_Pred (WHose friend) (Be_vp (Be_someone (Entity ariel)))))"]	1J0	siar	WH	Whose friend is Ariel?	t
B03200082	["QUt (PosQ (WH_Pred (WHose family) (Be_vp (Be_someone (Entity ariel)))))"]	1J0	siar	WH	whose family is Ariel?	t
B03200083	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing play (MassItem the_mass_Det drums)))))"]	1J0	siar	YN	Does Ariel play the drums?	t
B03200082	["QUt (NegQ (WH_Pred (WHose family) (Be_vp (Be_someone (Entity ariel)))))"]	1J0	siar	WH	whose family isn't Ariel?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity chiyuantien) (Intens love (Changing play (MassItem the_mass_Det guitar))))))"]	1J0	siar	YN	Does ChiYuan Tien love to play the guitar?	t
B03200092	["QUt (NegQ (WH_Pred (WHose brother) (Be_vp (Be_someone (Entity simon)))))"]	1J0	siar	WH	Whose older brother isn't Simon ?	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Changing have (Item a_Det family))))"]	1J0	siar	WH	Who has a family?	t
B03200063	["QUt (PosQ (YN (Sentence (Entity chiyuantien) (Changing have (Item a_Det mother)))))"]	1J0	siar	YN	Does ChiYuan Tien have a mother	t
B03200087	["QUt (PosQ (YN (Sentence (Entity simon) (Intens love (Changing play (MassItem zero_Det_sg baseball))))))"]	1J0	siar	YN	Does Simon love to play baseball?	t
B03200032	Who likes English songs? 	1J0	siar	WH	Who likes English songs? 	f
B03200032	Whom likes to listen to the songs?	1J0	siar	WH	Whom likes to listen to the songs?	f
B03200037	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity dora)))))"]	1J0	chat	WH	who is Dora?	t
B03200042	["QUt (PosQ (YN (Sentence it (Be_vp (Be_bad twentytwo)))))"]	1J0	chat	WH	Is it 22	t
B03200056	["QUt (PosQ (YN (Sentence (Entity stefan) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Is Stefan from Taiwan	t
B03200012	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad nineteen))))"]	1J0	chat	WH	who is 19	t
B03200087	when Andy is come.	1J0	chat	WH	when Andy is come.	f
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad nineteen))))"]	1J0	chat	WH	who isn't 19	t
B03200042	Who is from the Turkey	1J0	chat	WH	Who is from the Turkey	f
B03200089	["QUt (NegQ (YN (Sentence (Entity dora) (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	YN	Isn't Dora from Turkey?	t
193001	["QUt (PosQ (YN (Sentence (Entity mandy) (V_NP_S tell (Item a_Det stranger) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan)))))))))","QUt (PosQ (YN (Sentence (Entity mandy) (V_NP_that_S tell (Item a_Det stranger) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan)))))))))"]	1J0	chat	YN	Does Mandy tell a stranger that she is from Taiwan?	f
B03200094	Who age is 23?	1J0	chat	WH	Who age is 23?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity yisian) (Be_vp (Be_bad female)))))"]	1J0	chat	YN	is YiSian female 	t
193001	["QUt (PosQ (YN (Sentence (Entity mandy) (V_NP_S tell (Item a_Det stranger) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from usa)))))))))","QUt (PosQ (YN (Sentence (Entity mandy) (V_NP_that_S tell (Item a_Det stranger) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from usa)))))))))"]	1J0	chat	YN	Does Mandy tell a stranger that she is from the USA?	f
B03200046	who is talk to stranger?	1J0	chat	WH	who is talk to stranger?	f
B03200082	["QUt (NegQ (YN (Sentence (Entity annie) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Isn't Annie from Taiwan	t
B03200046	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_somewhere (Locating from turkey)))))"]	1J0	chat	WH	whose name is from Turkey?	t
B03200082	["QUt (NegQ (YN (Sentence (Entity cheney) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	Isn't Cheney beautiful	t
B03200082	Isn't she from USA	1J0	chat	YN	Isn't she from USA	f
B03200082	Isn't he from USA	1J0	chat	YN	Isn't he from USA	f
B01202106	["QUt (NegQ (YN (Sentence (Entity dora) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	WH	Isn't Dora from Taiwan?	t
B03200082	["QUt (NegQ (YN (Sentence he (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Isn't he from Taiwan	t
B03200082	Doesn't she come?	1J0	chat	YN	Doesn't she come?	f
B03200062	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity stefan)))))"]	1J0	chat	WH	who is Stefan?	t
B03200012	isn't she a female	1J0	chat	YN	isn't she a female	f
B03200089	["QUt (NegQ (YN (Sentence it (Be_vp (Be_bad old)))))"]	1J0	chat	YN	Isn't it old?	t
B03200046	who is Taiwan student?	1J0	chat	WH	who is Taiwan student?	f
B03200089	["QUt (PosQ (YN (Sentence it (Be_vp (Be_bad old)))))"]	1J0	chat	YN	Is it old?	t
B03200082	["QUt (PosQ (WH_Pred (WHose age) (Be_vp (Be_bad twentythree))))"]	1J0	chat	YN	Whose age is 23	t
B03200082	["QUt (PosQ (WH_Pred (WHose age) (Be_vp (Be_bad twentyone))))"]	1J0	chat	YN	Whose age is 21	t
B03200082	["QUt (NegQ (WH_Pred (WHose age) (Be_vp (Be_bad sixteen))))"]	1J0	chat	YN	Whose age isn't 16	t
B03200046	who greet to Mandy?	1J0	chat	WH	who greet to Mandy?	f
B03200089	["QUt (NegQ (YN (Sentence it (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	Isn't it beautiful?	t
B03200082	["QUt (NegQ (WH_Pred (WHose age) (Be_vp (Be_bad fifteen))))"]	1J0	chat	YN	Whose age isn't 15	t
B03200063	who is talk in Hispanic?	1J0	chat	WH	who is talk in Hispanic?	f
B03200012	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity annie)))))"]	1J0	chat	WH	whose name is Annie	t
B03200097	["QUt (PosQ (YN (Sentence (Entity sabrina) (Changing greet (Entity marian)))))"]	1J0	chat	YN	Does Sabrina greet Marian	t
B03200062	["QUt (NegQ (YN (Sentence (Entity ariel) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	WH	isn't Ariel from Taiwan?	t
B03200012	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity demi)))))"]	1J0	chat	WH	whose name is Demi	t
B03200097	["QUt (PosQ (YN (Sentence (Entity sabrina) (Changing greet (Entity jack)))))"]	1J0	chat	YN	Does Sabrina greet Jack	t
B03200087	are they right?	1J0	chat	YN	are they right?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity sabrina) (Changing greet (Entity dora)))))"]	1J0	chat	YN	Does Sabrina greet Dora 	t
B01202106	["QUt (PosQ (YN (Sentence (Entity dora) (Be_vp (Be_somewhere (Locating from usa))))))"]	1J0	chat	YN	Is Dora from the USA?	t
B03200087	["QUt (PosQ (YN (Sentence (Entity jack) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	is Jack young?	t
B03200018	who is she 	1J0	chat	WH	who is she 	f
B03200046	Don't they talk to stranger?	1J0	chat	YN	Don't they talk to stranger?	f
B03200093	["QUt (NegQ (WH_Pred (WHose family) (Be_vp (Be_someone (Entity simon)))))"]	1J0	siar	WH	whose family isn't Simon ?	t
B03200083	["QUt (PosQ (YN (Sentence (Entity ariel) (Changing play (MassItem the_mass_Det guitar)))))"]	1J0	siar	YN	Does Ariel play the guitar?	t
B03200040	["QUt (PosQ (YN (Sentence (Entity simon) (Intens like (Changing make_V2 (Item a_Det friend))))))"]	1J0	siar	YN	Does Simon like to make a friend?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity chiyuantien) (WithPlace live (Locating in_prep taipei)))))"]	1J0	siar	YN	Does ChiYuan Tien live in Taipei?	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Changing have (Item a_Det father))))"]	1J0	siar	WH	Who has a father?	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Changing have (Item a_Det mother))))"]	1J0	siar	WH	Who has a mother?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity chiyuantien) (Intens love (Changing play (MassItem zero_Det_sg baseball))))))"]	1J0	siar	YN	Does ChiYuan Tien love to play baseball?	t
B03200040	Is Simon like to listening song?	1J0	siar	YN	Is Simon like to listening song?	f
B03200063	["QUt (PosQ (YN (Sentence (Entity chiyuantien) (Be_vp (Be_bad humorous)))))"]	1J0	siar	YN	Is ChiYuan Tien humorous	t
B03200018	Who like to listen to songs?	1J0	siar	WH	Who like to listen to songs?	f
B03200091	["QUt (NegQ (YN (Sentence (Entity simon) (Intens like (Changing play (MassItem zero_Det_sg drums))))))"]	1J0	siar	YN	Doesn't Simon like to play drums?	t
B03200032	["QUt (PosQ (WH_Pred who_WH (Intens like (Changing listen (Item theSg_Det song)))))"]	1J0	siar	WH	Who likes to listen to the song?	t
B03200091	["QUt (PosQ (YN (Sentence (Entity chiyuantien) (Look_bad feel happy))))"]	1J0	siar	YN	Does ChiYuan Tien feel happy?	t
B03200091	["QUt (NegQ (YN (Sentence (Entity chiyuantien) (Intens want (Be_vp (Be_someone (Item a_Det tourguide)))))))"]	1J0	siar	YN	Doesn't ChiYuan Tien want to be a tour guide ?	t
B03200042	Who is from the Turkey?	1J0	chat	WH	Who is from the Turkey?	f
B03200006	Does she come?	1J0	chat	YN	Does she come?	f
B03200040	is she from USA?	1J0	chat	WH	is she from USA?	f
B03200012	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad old)))))"]	1J0	chat	YN	is she old	t
B03200063	["QUt (PosQ (YN (Sentence (Entity filibee) (ToPlace come (Locating from taiwan)))))"]	1J0	chat	YN	does Filibee come from Taiwan	t
B03200054	["QUt (PosQ (YN (Sentence (Item a_Det stranger) (V_NP_whether_S ask_V2Q (Entity mandy) (PosQ (YN (Sentence she (Be_vp (Be_bad (CloseAP or_Conj (APList male female)))))))))))"]	1J0	chat	YN	Does a stranger ask Mandy if she is male or female?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity marian) (Be_vp (Be_bad female)))))"]	1J0	chat	YN	is Marian female 	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind good man))))))"]	1J0	chat	WH	who is a good man?	t
B03200012	["QUt (NegQ (YN (Sentence (Entity marian) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	isn't Marian from Taiwan	t
B03200097	["QUt (NegQ (YN (Sentence (Entity marian) (Be_vp (Be_bad female)))))"]	1J0	chat	YN	isn't Marian female 	t
B03200089	["QUt (NegQ (YN (Sentence (Entity dora) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	Isn't Dora beautiful?	t
B03200087	Is Andy from USA?	1J0	chat	YN	Is Andy from USA?	f
B03200046	who talk to stranger?	1J0	chat	WH	who talk to stranger?	f
B03200097	["QUt (NegQ (YN (Sentence (Entity yisian) (Be_vp (Be_bad female)))))"]	1J0	chat	YN	isn't YiSian female 	t
B03200089	["QUt (PosQ (YN (Sentence (Entity dora) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	Is Dora 23? 	t
B03200018	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad twentyone)))))"]	1J0	chat	YN	is he 21	t
B03200097	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad nineteen)))))"]	1J0	chat	YN	is he 19	t
B03200089	["QUt (PosQ (YN (Sentence it (Be_vp (Be_bad good)))))"]	1J0	chat	YN	Is it good?	t
B03200012	["QUt (NegQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det man))))))"]	1J0	chat	YN	isn't he a man	t
B01202104	["QUt (NegQ (YN (Sentence (Entity andy) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	WH	Isn't Andy from Taiwan?	t
B03200046	who is a Taiwan student?	1J0	chat	WH	who is a Taiwan student?	f
B01202104	["QUt (NegQ (YN (Sentence (Entity jessie) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	WH	Isn't Jessie from Taiwan?	t
B03200087	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity sabrina)))))"]	1J0	chat	WH	who is Sabrina?	t
B03200087	are they beautiful?	1J0	chat	YN	are they beautiful?	f
193001	["QUt (PosQ (YN (Sentence (Entity mandy) (V_NP_S tell (Entity ariel) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from usa)))))))))","QUt (PosQ (YN (Sentence (Entity mandy) (V_NP_that_S tell (Entity ariel) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from usa)))))))))"]	1J0	chat	YN	Does Mandy tell Ariel that she is from the USA?	f
B03200089	doesn't he a student?	1J0	chat	YN	doesn't he a student?	f
B03200032	Is she from USA?	1J0	chat	WH	Is she from USA?	f
B03200012	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity mandy)))))"]	1J0	chat	WH	whose name is Mandy	t
B03200062	isn't she talk to the stranger?	1J0	chat	WH	isn't she talk to the stranger?	f
B03200056	["QUt (NegQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	Isn't he a stranger ?	t
B03200087	aren't they from MUST	1J0	chat	YN	aren't they from MUST	f
B03200006	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind beautiful girl))))))"]	1J0	chat	WH	Who is a beautiful girl?	t
B01202106	["QUt (NegQ (YN (Sentence (Entity stefan) (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	YN	isn't Stefan  from Turkey	t
B03200087	who is from USA ?	1J0	chat	WH	who is from USA ?	f
B03200091	Is stranger student say right?	1J0	chat	WH	Is stranger student say right?	f
B03200089	["Ut (NegS (Sentence (Entity alice) (Be_vp (Be_someone (Item a_Det man)))))"]	1J0	chat	YN	Alice isn't a man.	t
B03200087	isn't she from USA?	1J0	chat	YN	isn't she from USA?	f
B03200052	Is Alice from USA?	1J0	chat	YN	Is Alice from USA?	f
B03200087	["QUt (PosQ (YN (Sentence (Entity marian) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	is Marian young?	t
B03200087	["QUt (PosQ (YN (Sentence (Entity must) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	is MUST beautiful?	t
B03200097	Who is she? 	1J0	chat	WH	Who is she? 	f
B03200094	Doesn't Ariel come from USA?	1J0	chat	YN	Doesn't Ariel come from USA?	f
B03200018	whose age 21	1J0	chat	WH	whose age 21	f
B03200018	whose age 18	1J0	chat	WH	whose age 18	f
B03200046	Whose family is tour guide?	1J0	siar	WH	Whose family is tour guide?	f
B03200018	["QUt (PosQ (WH_Pred (WHose (Kind english name)) (Be_vp (Be_someone (Entity ariel)))))"]	1J0	siar	WH	Whose English name is Ariel?	t
B03200087	["QUt (PosQ (WH_Pred (WHose (Kind english name)) (Be_vp (Be_someone (Entity simon)))))"]	1J0	siar	YN	Whose English name is Simon?	t
B03200087	Does who love to play baseball?	1J0	siar	YN	Does who love to play baseball?	f
B03200063	["QUt (PosQ (YN (Sentence (Entity chiyuantien) (Intens like (Changing play (MassItem the_mass_Det drums))))))"]	1J0	siar	YN	Does ChiYuan Tien like to play the drums	t
B03200032	who likes English songs? 	1J0	siar	WH	who likes English songs? 	f
B03200032	Who likes to listen English songs? 	1J0	siar	WH	Who likes to listen English songs? 	f
B03200018	["QUt (PosQ (WH_Pred who_WH (Intens like (Changing listen (Item thePlural_Det song)))))"]	1J0	siar	WH	Who likes to listen to the songs?	t
B03200032	["QUt (PosQ (WH_Pred who_WH (Intens love (Changing listen (Item thePlural_Det song)))))"]	1J0	siar	WH	Who loves to listen to the songs?	t
B03200032	Who loves guitar?	1J0	siar	WH	Who loves guitar?	f
B03200091	["QUt (NegQ (YN (Sentence (Entity chiyuantien) (WithPlace live (Locating in_prep taipei)))))"]	1J0	siar	YN	Doesn't ChiYuan Tien live in Taipei?	t
B03200032	["QUt (PosQ (WH_Pred who_WH (Intens love (Changing play (MassItem the_mass_Det guitar)))))"]	1J0	siar	WH	Who loves to play the guitar?	t
B03200091	["QUt (NegQ (YN (Sentence (Entity chiyuantien) (Changing have (Item theSg_Det sister)))))"]	1J0	siar	YN	Doesn't ChiYuan Tien  have the younger sister?	t
B03200091	["QUt (NegQ (YN (Sentence (Entity chiyuantien) (Intens want (Be_vp (Be_someone (CloseList or_Conj (List (Item a_Det translator) (Item a_Det tourguide)))))))))"]	1J0	siar	YN	Doesn't ChiYuan Tien want to be a translator or a tour guide?	t
B03200032	Who is a optimistic person?	1J0	siar	WH	Who is a optimistic person?	f
B03200032	Who is an optimistic person?	1J0	siar	WH	Who is an optimistic person?	f
B03200032	Who is  optimistic ?	1J0	siar	WH	Who is  optimistic ?	f
B03200032	Who is optimistic ?	1J0	siar	WH	Who is optimistic ?	f
B03200091	Aren't they playing guitar?	1J0	siar	YN	Aren't they playing guitar?	f
B03200091	Are they playing guitar?	1J0	siar	YN	Are they playing guitar?	f
193001	["QUt (PosQ (YN (Sentence (Entity rebia) (Changing have (Item a_Det child)))))"]	FLA0017	clay	YN	Does Rebia have a child?	t
193001	["QUt (PosQ (YN (Sentence (Entity rebia) (Changing have (Item a_Det son)))))"]	FLA0017	clay	YN	Does Rebia have a son?	t
V0141018	["QUt (PosQ (YN (Sentence rebia_and_frank (WithPlace go (Locating down_to city_hall)))))"]	FLA0017	clay	YN	Do Rebia and Frank go down to City Hall?	t
V0141035	Who does pregnant?	FLA0017	clay	WH	Who does pregnant?	f
V0141035	Who  pregnant?	FLA0017	clay	WH	Who  pregnant?	f
V0141035	When does Rebia  pregnant?	FLA0017	clay	WH	When does Rebia  pregnant?	f
V0141019	["QUt (NegQ (YN (Sentence (Entity rebia) (Changing have (Item a_Det child)))))"]	FLA0017	clay	YN	Doesn't Rebia have a child?	t
V0141035	Does Rebia pregnant?	FLA0017	clay	YN	Does Rebia pregnant?	f
V0141019	["QUt (NegQ (YN (Sentence rebia_and_frank (WithPlace go (Locating down_to city_hall)))))"]	FLA0017	clay	YN	Don't Rebia and Frank go down to City Hall?	t
V0141019	["QUt (NegQ (YN (Sentence (Entity rebia) (Changing have (Item a_Det son)))))"]	FLA0017	clay	YN	Doesn't Rebia have a son?	t
V0141035	Does Rebia have child ?	FLA0017	clay	YN	Does Rebia have child ?	f
V0141002	When does she meet Frank?	FLA0017	clay	WH	When does she meet Frank?	f
V0141009	Is Rebia have  child? 	FLA0017	clay	YN	Is Rebia have  child? 	f
V0141002	When does Rebia meet Frank?	FLA0017	clay	WH	When does Rebia meet Frank?	f
V0141002	["QUt (PosQ (YN (Sentence (Entity rebia) (Changing meet (Entity frank)))))"]	FLA0017	clay	YN	Does Rebia meet Frank?	t
V0141035	["QUt (NegQ (YN (Sentence (Entity rebia) (Changing meet (Entity frank)))))"]	FLA0017	clay	WH	Doesn't Rebia meet Frank?	t
V0141017	["QUt (PosQ (YN (Sentence she (Changing have (Item a_Det child)))))"]	FLA0017	clay	YN	Does she have a child?	t
V0141009	["QUt (PosQ (YN (Sentence (Entity rebia) (Changing have (Item a_Det father)))))"]	FLA0017	clay	YN	does Rebia have a father? 	t
V0141021	["QUt (NegQ (YN (Sentence she (Changing have (Item a_Det child)))))"]	FLA0017	clay	YN	Doesn't she have a child?	t
V0141035	["QUt (NegQ (YN (Sentence (Entity rebia) (Happening get_married))))"]	FLA0017	clay	WH	Doesn't Rebia get married? 	t
V0141002	Does Frank separate Rebia?	FLA0017	clay	YN	Does Frank separate Rebia?	f
V0141017	["QUt (NegQ (YN (Sentence (Entity rebia) (Changing have (Item a_Det father)))))"]	FLA0017	clay	YN	Doesn't Rebia have a father?	t
V0141009	Does Rebia have boyfriend? 	FLA0017	clay	YN	Does Rebia have boyfriend? 	f
V0141016	Does Rebia pregnant when meet Frank	FLA0017	clay	YN	Does Rebia pregnant when meet Frank	f
V0141016	Does Rebia pregnant ?	FLA0017	clay	YN	Does Rebia pregnant ?	f
V0141017	Does she grab the ugly wedding_ring?	FLA0017	clay	YN	Does she grab the ugly wedding_ring?	f
V0141002	["QUt (PosQ (YN (Sentence (Entity frank) (Be_vp (Be_bad married)))))"]	FLA0017	clay	YN	Is Frank married?	t
V0141017	Does she get the ugly wedding_ring?	FLA0017	clay	YN	Does she get the ugly wedding_ring?	f
V0141035	Who have a fourth child	FLA0017	clay	WH	Who have a fourth child	f
V0141029	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad beautiful)))))"]	FLA0017	clay	YN	Is she beautiful?	t
V0141002	["QUt (PosQ (YN (Sentence (Entity frank) (Be_vp (Be_bad pregnant)))))"]	FLA0017	clay	YN	Is Frank pregnant?	t
V0141035	Who have a fourth child?	FLA0017	clay	WH	Who have a fourth child?	f
V0141002	["QUt (PosQ (YN (Sentence (Entity frank) (Changing have (Item a_Det child)))))"]	FLA0017	clay	YN	Does Frank have a child?	t
V0141035	Who does have a fourth child?	FLA0017	clay	WH	Who does have a fourth child?	f
V0141019	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad beautiful)))))"]	FLA0017	clay	YN	Isn't she beautiful?	t
V0141002	["QUt (PosQ (YN (Sentence (Entity frank) (Be_vp (Be_bad beautiful)))))"]	FLA0017	clay	YN	Is Frank beautiful?	t
V0141035	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad happy)))))"]	FLA0017	clay	YN	Is she happy?	t
V0141019	["QUt (NegQ (YN (Sentence (Entity frank) (Changing have (Item a_Det child)))))"]	FLA0017	clay	YN	Doesn't Frank have a child?	t
V0141016	["QUt (PosQ (YN (Sentence (Entity rebia) (Be_vp (Be_bad pregnant)))))"]	FLA0017	clay	YN	Is Rebia pregnant?	t
V0141017	["QUt (NegQ (YN (Sentence (Entity frank) (Be_vp (Be_bad pregnant)))))"]	FLA0017	clay	YN	Isn't Frank pregnant?	t
V0141009	["QUt (PosQ (YN (Sentence (Entity rebia) (Changing have (MassItem zero_Det_sg home)))))"]	FLA0017	clay	YN	Does Rebia have home? 	t
V0141035	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad happy)))))"]	FLA0017	clay	YN	Isn't she happy?	t
V0141009	["QUt (PosQ (YN (Sentence (Entity rebia) (Changing have (MassItem zero_Det_sg true_love)))))"]	FLA0017	clay	YN	Does Rebia have "true love"? 	t
V0141017	["QUt (PosQ (YN (Sentence (Entity frank) (Triangulating give (Entity rebia) (Item theSg_Det wedding_ring)))))"]	FLA0017	clay	YN	Does Frank give Rebia the wedding ring ?	t
V0141035	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item theSg_Det boyfriend)))))"]	FLA0017	clay	WH	Who is the boyfriend?	t
V0141002	["QUt (PosQ (YN (Sentence (Entity frank) (Changing have (Item a_Det boyfriend)))))"]	FLA0017	clay	YN	Does Frank have a boyfriend?	t
V0141029	Is the City Hall  big ?	FLA0017	clay	YN	Is the City Hall  big ?	f
V0141029	Doesn't Frank married?	FLA0017	clay	YN	Doesn't Frank married?	f
V0141002	["QUt (PosQ (YN (Sentence (Entity rebia) (Changing have (Item a_Det class_ring)))))"]	FLA0017	clay	YN	Does Rebia have a class ring?	t
V0141002	Does Frank make Rebia happy?	FLA0017	clay	YN	Does Frank make Rebia happy?	f
V0141029	["QUt (PosQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det (Kind ugly kid)))))))"]	FLA0017	clay	YN	Is he a ugly kid?	t
V0141029	Is Michigan a kid?	FLA0017	clay	YN	Is Michigan a kid?	f
V0141029	Does Michigan have a kid?	FLA0017	clay	YN	Does Michigan have a kid?	f
V0141029	Does Michigan have a child?	FLA0017	clay	YN	Does Michigan have a child?	f
V0141029	Does Rebia meet Michigan?	FLA0017	clay	YN	Does Rebia meet Michigan?	f
V0141017	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity rebia)))))"]	FLA0017	clay	WH	Who is Rebia?	t
B03200039	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity alice)))))"]	1J0	chat	WH	Who  is Alice	t
B03200052	Is she from 	1J0	chat	WH	Is she from 	f
B03200013	Who is a beautiful female?	1J0	chat	WH	Who is a beautiful female?	f
B03200071	does she old ?	1J0	chat	WH	does she old ?	f
B03200088	["QUt (PosQ (YN (Sentence (Entity cheney) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	Is Cheney beautiful?	t
B03200087	who female from MUST?	1J0	chat	WH	who female from MUST?	f
B03200054	["QUt (PosQ (YN (Sentence (Entity mandy) (V_NP_whether_S ask_V2Q (Item a_Det stranger) (ICompS how_old he)))))"]	1J0	chat	YN	Does Mandy ask a stranger how old he is?	f
B03200056	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity ellarose)))))"]	1J0	chat	WH	who is Ellarose?	t
B01202106	["QUt (NegQ (YN (Sentence (Entity alice) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	WH	Isn't Alice from Taiwan?	t
B03200046	Does she tell stranger?	1J0	chat	YN	Does she tell stranger?	f
B03200082	aren't they good ?	1J0	chat	YN	aren't they good ?	f
B03200054	["QUt (PosQ (YN (Sentence she (Be_vp (Be_bad twentytwo)))))"]	1J0	chat	YN	is she 22	t
B03200012	who is a Alice	1J0	chat	WH	who is a Alice	f
B03200060	["Ut (PosS (Sentence she (Be_vp (Be_someone (Item a_Det student)))))"]	1J0	chat	WH	she is a student.	f
B03200071	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad twentytwo))))"]	1J0	chat	YN	who is 22 ?	t
B03200063	["QUt (PosQ (YN (Sentence (Entity alice) (ToPlace come (Locating from turkey)))))"]	1J0	chat	YN	does Alice come from Turkey	t
B01202104	["QUt (NegQ (YN (Sentence she (Be_vp (Be_bad twentyone)))))"]	1J0	chat	WH	Isn't she 21?	t
B03200012	["QUt (PosQ (WH_Pred (WHose age) (Be_vp (Be_bad nineteen))))"]	1J0	chat	WH	whose age is 19	t
B03200006	Is she come from Taiwan?	1J0	chat	YN	Is she come from Taiwan?	f
B03200060	["Ut (PosS (Sentence (Entity mandy) (Be_vp (Be_someone (Item a_Det student)))))"]	1J0	chat	WH	Mandy is a student.	t
B01202104	["QUt (NegQ (YN (Sentence (Entity sabrina) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	WH	Isn't Sabrina from Taiwan?	t
B03200006	Does she come to MUST	1J0	chat	YN	Does she come to MUST	f
B03200019	Does the stranger guess that Sabrina is 18. 	1J0	chat	YN	Does the stranger guess that Sabrina is 18. 	f
B03200003	Does Annie come from USA?	1J0	chat	WH	Does Annie come from USA?	f
B03200087	Is Andy like Junior?	1J0	chat	YN	Is Andy like Junior?	f
B03200013	Who is a beautiful female	1J0	chat	WH	Who is a beautiful female	f
B03200097	["QUt (PosQ (YN (Sentence (Entity filibee) (Be_vp (Be_bad female)))))"]	1J0	chat	YN	is Filibee female 	t
B03200046	who like to  talk to stranger?	1J0	chat	WH	who like to  talk to stranger?	f
B03200042	["QUt (PosQ (WH_Pred (WHose age) (Be_vp (Be_bad twentytwo))))"]	1J0	chat	YN	Whose age is 22	t
B03200094	["QUt (NegQ (WH_Pred who_WH (Happening understand)))"]	1J0	chat	WH	Who doesn't understand?	t
B03200097	["QUt (NegQ (YN (Sentence (Entity filibee) (Be_vp (Be_bad female)))))"]	1J0	chat	YN	isn't Filibee female 	t
B03200046	who is MUST student?	1J0	chat	WH	who is MUST student?	f
B01202106	["QUt (NegQ (YN (Sentence (Entity maggie) (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	WH	isn't Maggie  from Turkey	t
B03200087	are they from Taiwan?	1J0	chat	YN	are they from Taiwan?	f
B03200012	["QUt (PosQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det man))))))"]	1J0	chat	YN	is he a man	t
B03200029	Who is tell to Stefan?	1J0	chat	WH	Who is tell to Stefan?	f
B03200046	["QUt (PosQ (WH_Pred (WHose age) (Be_vp (Be_bad sixteen))))"]	1J0	chat	WH	Whose age is 16	t
B03200087	are they from Turkey?	1J0	chat	YN	are they from Turkey?	f
B03200012	is she a female	1J0	chat	YN	is she a female	f
B03200089	["QUt (PosQ (YN (Sentence it (Be_vp (Be_bad right)))))"]	1J0	chat	YN	Is it right?	t
B03200082	Doesn't he come?	1J0	chat	YN	Doesn't he come?	f
B03200092	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity cherry2)))))"]	1J0	chat	WH	who is Cherry2?	t
B03200012	["QUt (PosQ (YN (Sentence she (V_that_S say (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan)))))))))"]	1J0	chat	YN	does she say that she is from Taiwan	t
B03200082	["QUt (PosQ (WH_Pred (WHose age) (Be_vp (Be_bad fifteen))))"]	1J0	chat	YN	Whose age is 15	t
B03200094	Who is good girl ?	1J0	chat	WH	Who is good girl ?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity sabrina) (Changing greet (Entity yisian)))))"]	1J0	chat	YN	Does Sabrina greet YiSian 	t
V0141019	["QUt (NegQ (YN (Sentence (Entity frank) (Be_vp (Be_bad married)))))"]	FLA0017	clay	YN	Isn't Frank married?	t
V0141019	["QUt (NegQ (YN (Sentence (Entity rebia) (Be_vp (Be_bad pregnant)))))"]	FLA0017	clay	YN	Isn't Rebia pregnant?	t
V0141019	["QUt (NegQ (YN (Sentence (Entity rebia) (Changing have (MassItem zero_Det_sg home)))))"]	FLA0017	clay	YN	Doesn't Rebia have home?	t
V0141002	Is Rebia seventeen?	FLA0017	clay	YN	Is Rebia seventeen?	f
V0141017	Does Frank give Rebia the wedding_ring ?	FLA0017	clay	YN	Does Frank give Rebia the wedding_ring ?	f
V0141002	["QUt (PosQ (YN (Sentence (Entity rebia) (Be_vp (Be_bad happy)))))"]	FLA0017	clay	YN	Is Rebia happy?	t
V0141035	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_bad oldest))))"]	FLA0017	clay	WH	Who is oldest?	t
V0141019	["QUt (NegQ (YN (Sentence (Entity rebia) (Changing have (MassItem zero_Det_sg true_love)))))"]	FLA0017	clay	YN	Doesn't Rebia have "true love"?	t
V0141017	["QUt (PosQ (YN (Sentence (Entity rebia) (Be_vp (Be_bad ugly)))))"]	FLA0017	clay	YN	Is Rebia ugly?	t
V0141035	Who is boyfriend?	FLA0017	clay	WH	Who is boyfriend?	f
V0141017	Does Rebia pregnant when meet Frank?	FLA0017	clay	YN	Does Rebia pregnant when meet Frank?	f
V0141002	["QUt (PosQ (YN (Sentence (Entity rebia) (Changing have (Item a_Det boyfriend)))))"]	FLA0017	clay	YN	Does Rebia have a boyfriend?	t
V0141016	["QUt (NegQ (YN (Sentence (Entity frank) (Happening get_married))))"]	FLA0017	clay	YN	Doesn't Frank get married?	t
V0141002	["QUt (PosQ (YN (Sentence rebia_and_frank (Be_vp (Be_bad happy)))))"]	FLA0017	clay	YN	Are Rebia and Frank happy?	t
V0141002	Does Rebia have a class_ring?	FLA0017	clay	YN	Does Rebia have a class_ring?	f
V0141002	["QUt (PosQ (YN (Sentence (Entity frank) (Changing have (Item a_Det house)))))"]	FLA0017	clay	YN	Does Frank have a house?	t
V0141029	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity frank)))))"]	FLA0017	clay	YN	Who is Frank?	t
V0141029	Does he a ugly kid?	FLA0017	clay	YN	Does he a ugly kid?	f
V0141018	["QUt (PosQ (YN (Sentence (Entity rebia) (Be_vp (Be_bad married)))))"]	FLA0017	clay	YN	Is Rebia married?	t
V0141002	Does Rebia believe true love?	FLA0017	clay	YN	Does Rebia believe true love?	f
V0141018	["QUt (PosQ (YN (Sentence frank_and_rebia (Be_vp (Be_bad happy)))))"]	FLA0017	clay	YN	Are Frank and Rebia happy?	t
V0141029	Does Michigan remember Frank?	FLA0017	clay	YN	Does Michigan remember Frank?	f
V0141017	Who get married?	FLA0017	clay	WH	Who get married?	f
V0141029	["QUt (PosQ (YN (Sentence (Entity rebia) (WithPlace go (Locating to_prep city_hall)))))"]	FLA0017	clay	YN	Does Rebia go to City Hall?	t
V0141029	Does she look beautiful?	FLA0017	clay	YN	Does she look beautiful?	f
V0141021	Who have fourth child ?	FLA0017	clay	WH	Who have fourth child ?	f
V0141029	Does she get home?	FLA0017	clay	YN	Does she get home?	f
V0141018	Does Rebia believe "true love"?	FLA0017	clay	YN	Does Rebia believe "true love"?	f
V0141018	["QUt (PosQ (YN (Sentence (Entity rebia) (Changing know_V2 (MassItem zero_Det_sg true_love)))))"]	FLA0017	clay	YN	Does Rebia know true love?	t
V0141029	["QUt (PosQ (YN (Sentence (Entity rebia) (Be_vp (Be_someone (Item a_Det (Kind beautiful child)))))))"]	FLA0017	clay	YN	Is Rebia a beautiful child?	t
V0141029	Does she believe "true love"?	FLA0017	clay	YN	Does she believe "true love"?	f
V0141029	Does she believe Frank?	FLA0017	clay	YN	Does she believe Frank?	f
V0141018	["QUt (PosQ (YN (Sentence (Entity rebia) (Changing have (Item (Apos (Entity frank)) (Kind biological child))))))"]	FLA0017	clay	YN	Does Rebia have Frank's biological child?	t
V0141021	Who grab the wedding_ring?	FLA0017	clay	WH	Who grab the wedding_ring?	f
V0141029	Who is child?	FLA0017	clay	YN	Who is child?	f
V0141002	["QUt (PosQ (YN (Sentence (Entity frank) (Changing have (Item a_Det kid)))))"]	FLA0017	clay	YN	Does Frank have a kid?	t
V0141002	Who believe true love?	FLA0017	clay	WH	Who believe true love?	f
V0141029	["QUt (NegQ (YN (Sentence (Entity frank) (WithPlace go (Locating to_prep city_hall)))))"]	FLA0017	clay	YN	Doesn't Frank go to City Hall?	t
V0141018	["QUt (PosQ (YN (Sentence (Entity frank) (Be_vp (Be_someone (MassItem (MassApos (Entity rebia)) true_love))))))"]	FLA0017	clay	YN	Is Frank Rebia's true love?	t
V0141002	Who married Rebia?	FLA0017	clay	WH	Who married Rebia?	f
V0141002	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item theSg_Det wife)))))"]	FLA0017	clay	WH	Who is the wife?	t
V0141009	Does Rebia give  Frank  the wedding_ring ?	FLA0017	clay	YN	Does Rebia give  Frank  the wedding_ring ?	f
V0141029	["QUt (PosQ (YN (Sentence she (Changing have (Item a_Det boyfriend)))))"]	FLA0017	clay	YN	Does she have a boyfriend?	t
V0141029	["QUt (PosQ (YN (Sentence he (Be_vp (Be_someone (Item a_Det father))))))"]	FLA0017	clay	YN	Is he a father?	t
V0141029	When does he come home?	FLA0017	clay	YN	When does he come home?	f
V0141029	["QUt (PosQ (YN (Sentence rebia_and_frank (Changing have (Item a_Det son)))))"]	FLA0017	clay	YN	Do Rebia and Frank have a son?	t
B03200063	["QUt (PosQ (YN (Sentence (Entity ariel) (ToPlace come (Locating from taiwan)))))"]	1J0	chat	YN	does Ariel come from Taiwan	t
B03200078	["QUt (PosQ (YN (Sentence she (Be_vp (Be_someone (Item a_Det girl))))))"]	1J0	chat	YN	is she a girl?	t
B03200052	Is she from USA	1J0	chat	WH	Is she from USA	f
B03200063	["QUt (PosQ (YN (Sentence (Entity ellarose) (ToPlace come (Locating from taiwan)))))"]	1J0	chat	YN	does Ellarose come from Taiwan	t
B03200039	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Entity ariel)))))"]	1J0	chat	WH	Who  is Ariel	t
B03200046	Is he understand that he is from Turkey?	1J0	chat	YN	Is he understand that he is from Turkey?	f
B03200037	who is from USA	1J0	chat	WH	who is from USA	f
B03200097	["QUt (PosQ (YN (Sentence she (Be_vp (Be_somewhere (Locating from turkey))))))"]	1J0	chat	YN	is she from Turkey 	t
B03200019	["QUt (PosQ (YN (Sentence (Entity ariel) (V_NP_S tell (Entity filibee) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan)))))))))","QUt (PosQ (YN (Sentence (Entity ariel) (V_NP_that_S tell (Entity filibee) (PosS (Sentence she (Be_vp (Be_somewhere (Locating from taiwan)))))))))"]	1J0	chat	YN	Does Ariel tell Filibee that she is from Taiwan	f
B03200088	Is Alice come from Taiwan?	1J0	chat	YN	Is Alice come from Taiwan?	f
B03200037	["QUt (PosQ (YN (Sentence he (Be_vp (Be_bad eighteen)))))"]	1J0	chat	WH	is he 18	t
B03200063	["QUt (PosQ (YN (Sentence (Entity jack) (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	is Jack a stranger	t
B03200052	aren't they student?	1J0	chat	WH	aren't they student?	f
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified man (SubjRel that_RP (Be_vp (Be_bad old)))))))))"]	1J0	chat	WH	who is a man that is old?	t
B03200087	["QUt (PosQ (YN (Sentence (Entity mandy) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	is Mandy young?	t
B03200003	Does he like Alice?	1J0	chat	WH	Does he like Alice?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity junior) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Junior 23 	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified girl (SubjRel that_RP (Be_vp (Be_bad beautiful)))))))))"]	1J0	chat	WH	who is a girl that is beautiful?	t
B03200032	["QUt (PosQ (YN (Sentence (Entity ellarose) (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	is Ellarose a student	t
B03200032	["QUt (PosQ (YN (Sentence (Entity mandy) (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	is Mandy a student	t
B03200012	["QUt (NegQ (YN (Sentence (Entity yisian) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't YiSian good	t
B03200032	["QUt (PosQ (YN (Sentence (Entity marian) (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	is Marian a student	t
B03200097	["QUt (PosQ (YN (Sentence (Entity demi) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Demi 23 	t
B03200012	["QUt (PosQ (YN (Sentence (Entity ariel) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is Ariel good	t
B03200032	["QUt (PosQ (YN (Sentence (Entity jack) (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	is Jack a student	t
B03200052	["QUt (PosQ (YN (Sentence (Entity annie) (Be_vp (Be_someone (Item a_Det (Kind good girl)))))))"]	1J0	chat	WH	Is Annie a good girl?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity junior) (Be_vp (Be_bad twentyone)))))"]	1J0	chat	YN	is Junior 21	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified girl (SubjRel that_RP (Be_vp (Be_bad hispanic)))))))))"]	1J0	chat	WH	who is a girl that is Hispanic?	t
B03200032	["QUt (PosQ (YN (Sentence (Entity dora) (Be_vp (Be_someone (Item a_Det girl))))))"]	1J0	chat	YN	is Dora a girl	t
B03200032	["QUt (PosQ (YN (Sentence (Entity jack) (Be_vp (Be_someone (Item a_Det girl))))))"]	1J0	chat	YN	is Jack a girl	t
B03200097	["QUt (NegQ (YN (Sentence (Entity junior) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	isn't Junior 23 	t
B03200012	is Taiwan good	1J0	chat	YN	is Taiwan good	f
B03200052	["QUt (NegQ (YN (Sentence she (Be_vp (Be_someone (Item a_Det (Kind good girl)))))))"]	1J0	chat	WH	Isn't she a good girl?	t
B03200032	["QUt (PosQ (YN (Sentence (Entity junior) (Be_vp (Be_someone (Item a_Det girl))))))"]	1J0	chat	YN	is Junior a girl	t
B03200087	who is Turkey	1J0	chat	WH	who is Turkey	f
B03200056	["QUt (PosQ (YN (Sentence (Entity lisa1) (Be_vp (Be_someone (Item a_Det girl))))))"]	1J0	chat	YN	is Lisa1 a girl	t
B03200097	["QUt (NegQ (YN (Sentence (Entity andy) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	isn't Andy 23 	t
B03200097	["QUt (PosQ (YN (Sentence (Entity andy) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Andy 23 	t
B03200012	["QUt (NegQ (YN (Sentence (Entity filibee) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't Filibee good	t
B03200012	["QUt (PosQ (YN (Sentence (Entity mandy) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is Mandy good	t
B03200097	["QUt (NegQ (YN (Sentence (Entity stefan) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	isn't Stefan 23	t
B03200012	["QUt (PosQ (YN (Sentence (Entity dora) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is Dora good	t
B03200046	Who is male that is old?	1J0	chat	WH	Who is male that is old?	f
B03200012	["QUt (PosQ (YN (Sentence (Entity cherry2) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is Cherry2 good	t
B03200087	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity yisian)))))"]	1J0	chat	WH	whose name is YiSian?	t
B03200097	["QUt (NegQ (YN (Sentence (Entity viola1) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	isn't Viola1 23 	t
B03200012	["QUt (NegQ (YN (Sentence (Entity cherry2) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't Cherry2 good	t
B03200087	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity lisa1)))))"]	1J0	chat	WH	whose name is Lisa1?	t
B03200032	["QUt (PosQ (YN (Sentence (Entity alice) (Be_vp (Be_someone (Item a_Det (Kind beautiful girl)))))))"]	1J0	chat	YN	Is Alice a beautiful girl	t
B03200032	["QUt (PosQ (YN (Sentence (Entity annie) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Annie 23	t
B03200052	isn't he student?	1J0	chat	WH	isn't he student?	f
B03200052	["QUt (NegQ (YN (Sentence he (Be_vp (Be_bad male)))))"]	1J0	chat	WH	isn't he male	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified man (SubjRel that_RP (Be_vp (Be_bad young)))))))))"]	1J0	chat	WH	who is a man that is young?	t
B03200094	["QUt (NegQ (YN (Sentence (Entity sabrina) (Changing greet (Entity must)))))"]	1J0	chat	YN	Doesn't Sabrina greet MUST?	t
B03200012	who isn't come from Taiwan	1J0	chat	WH	who isn't come from Taiwan	f
B03200052	who the man is young	1J0	chat	WH	who the man is young	f
B03200052	who the man is young?	1J0	chat	WH	who the man is young?	f
B03200087	["QUt (PosQ (YN (Sentence (Entity mandy) (Be_vp (Be_bad old)))))"]	1J0	chat	YN	is Mandy old?	t
B03200012	["QUt (PosQ (YN (Sentence (Entity alice) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is Alice good	t
B03200087	["QUt (PosQ (YN (Sentence (Entity mandy) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	is Mandy beautiful?	t
B03200012	["QUt (NegQ (YN (Sentence (Entity alice) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't Alice good	t
B03200046	who is a man that the name is good?	1J0	chat	WH	who is a man that the name is good?	f
B03200012	["QUt (PosQ (YN (Sentence (Entity yisian) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is YiSian good	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified man (SubjRel that_RP (Be_vp (Be_bad fifteen)))))))))"]	1J0	chat	WH	who is a man that is 15	t
B03200052	who is from USA?	1J0	chat	WH	who is from USA?	f
B03200097	["QUt (PosQ (YN (Sentence (Entity sabrina) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Sabrina  23 	t
B03200032	["QUt (PosQ (YN (Sentence (Entity yisian) (Be_vp (Be_someone (Item a_Det student))))))"]	1J0	chat	YN	is YiSian a student	t
B03200012	["QUt (NegQ (YN (Sentence (Entity ariel) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't Ariel good	t
B03200097	["QUt (PosQ (YN (Sentence (Entity cherry2) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Cherry2 23 	t
B03200046	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Modified woman (SubjRel that_RP (Be_vp (Be_bad female)))))))))"]	1J0	chat	WH	Who is a woman that is female?	t
B03200052	does she is good girl?	1J0	chat	WH	does she is good girl?	f
B03200012	["QUt (NegQ (YN (Sentence (Entity junior) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't Junior good	t
B03200097	["QUt (NegQ (YN (Sentence (Entity junior) (Be_vp (Be_bad twentyone)))))"]	1J0	chat	YN	isn't Junior 21	t
B03200012	["QUt (PosQ (YN (Sentence (Entity marian) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is Marian good	t
B03200097	["QUt (NegQ (YN (Sentence (Entity junior) (Be_vp (Be_bad twentytwo)))))"]	1J0	chat	YN	isn't Junior 22	t
B03200012	["QUt (NegQ (YN (Sentence (Entity marian) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't Marian good	t
B03200056	["QUt (NegQ (YN (Sentence (Entity sabrina) (Be_vp (Be_bad twentytwo)))))"]	1J0	chat	YN	isn't Sabrina 22	t
B03200032	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_someone (Item a_Det girl))))))"]	1J0	chat	YN	is Maggie a girl	t
B03200063	who is 	1J0	chat	WH	who is 	f
B03200012	["QUt (PosQ (YN (Sentence (Entity ellarose) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is Ellarose good	t
B03200012	["QUt (NegQ (YN (Sentence (Entity ellarose) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't Ellarose good	t
B03200012	["QUt (PosQ (YN (Sentence (Entity filibee) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is Filibee good	t
B03200056	["QUt (PosQ (YN (Sentence (Entity dora) (Be_vp (Be_someone (Item a_Det (Kind good student)))))))"]	1J0	chat	YN	Is Dora a good student?	t
B03200056	["QUt (PosQ (YN (Sentence (Entity jessie) (Be_vp (Be_somewhere (Locating from taiwan))))))"]	1J0	chat	YN	Is Jessie from Taiwan	t
B03200012	["QUt (NegQ (YN (Sentence (Entity mandy) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't Mandy good	t
B03200097	["QUt (PosQ (YN (Sentence (Entity stefan) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Stefan 23	t
B03200012	["QUt (NegQ (YN (Sentence (Entity dora) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	isn't Dora good	t
B03200097	["QUt (PosQ (YN (Sentence (Entity viola1) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Viola1 23	t
B03200089	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_bad good)))))"]	1J0	chat	YN	is Maggie good?	t
B03200091	["QUt (NegQ (YN (Sentence (Entity andy) (Be_vp (Be_someone (Item a_Det stranger))))))"]	1J0	chat	YN	Isn't Andy a stranger ?	t
B03200089	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	is Maggie young?	t
B03200089	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	is Maggie beautiful?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity yisian) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is YiSian 23	t
B03200097	["QUt (NegQ (YN (Sentence (Entity yisian) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	isn't YiSian  23	t
B03200063	whose name is	1J0	chat	WH	whose name is	f
B03200032	["QUt (PosQ (YN (Sentence (Entity ariel) (Be_vp (Be_someone (Item a_Det (Kind beautiful girl)))))))"]	1J0	chat	YN	Is Ariel a beautiful girl	t
B03200089	["QUt (NegQ (YN (Sentence (Entity maggie) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	isn't Maggie beautiful?	t
B03200012	who doesn't good 	1J0	chat	WH	who doesn't good 	f
B03200097	["QUt (PosQ (YN (Sentence (Entity jack) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Jack 23	t
B03200089	["QUt (NegQ (YN (Sentence (Entity maggie) (Be_vp (Be_bad old)))))"]	1J0	chat	YN	isn't Maggie old?	t
B03200097	["QUt (NegQ (YN (Sentence (Entity jack) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	isn't Jack 23	t
B03200032	["QUt (PosQ (YN (Sentence (Entity marian) (Be_vp (Be_someone (Item a_Det (Kind beautiful girl)))))))"]	1J0	chat	YN	Is Marian a beautiful girl	t
B03200032	["QUt (PosQ (YN (Sentence (Entity yisian) (Be_vp (Be_someone (Item a_Det (Kind beautiful girl)))))))"]	1J0	chat	YN	Is YiSian a beautiful girl	t
B03200091	Who greet to Andy?	1J0	chat	WH	Who greet to Andy?	f
B03200003	Doesn't Alice a good girl? 	1J0	chat	WH	Doesn't Alice a good girl? 	f
B03200089	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_somewhere (Locating from usa)))))"]	1J0	chat	WH	Who isn't from the USA?	t
B03200097	["QUt (PosQ (YN (Sentence (Entity jessie) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Jessie 23	t
B03200091	Who like Jack?	1J0	chat	WH	Who like Jack?	f
B03200097	["QUt (NegQ (YN (Sentence (Entity jessie) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	isn't Jessie 23	t
B03200087	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity filibee)))))"]	1J0	chat	WH	whose name is Filibee?	t
B03200097	["QUt (NegQ (YN (Sentence (Entity annie) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	isn't Annie 23	t
B03200032	who don't like to talk to stranger	1J0	chat	WH	who don't like to talk to stranger	f
B03200097	["QUt (PosQ (YN (Sentence (Entity marian) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Marian 23	t
B03200063	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity ellarose)))))"]	1J0	chat	WH	whose name is Ellarose	t
B03200097	["QUt (NegQ (YN (Sentence (Entity marian) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	isn't Marian 23	t
B03200034	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity must)))))"]	1J0	chat	WH	whose name is MUST	t
B03200097	["QUt (PosQ (YN (Sentence (Entity lisa1) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	is Lisa1 23	t
B03200063	whose name is Turkey	1J0	chat	WH	whose name is Turkey	f
B03200097	["QUt (NegQ (YN (Sentence (Entity lisa1) (Be_vp (Be_bad twentythree)))))"]	1J0	chat	YN	isn't Lisa1 23	t
B03200056	["QUt (PosQ (YN (Sentence (Entity marian) (Be_vp (Be_someone (Item a_Det (Kind good student)))))))"]	1J0	chat	YN	Is Marian a good student?	t
B03200012	who isn't from USA 	1J0	chat	WH	who isn't from USA 	f
B03200063	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity junior)))))"]	1J0	chat	WH	whose name is Junior	t
B03200097	is USA 23	1J0	chat	YN	is USA 23	f
B03200056	["QUt (PosQ (YN (Sentence (Entity cherry2) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	is Cherry2 young?	t
B03200052	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item (Apos she) name)))))","QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item her_Det name)))))"]	1J0	chat	WH	who is her name?	f
B03200089	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind good woman))))))"]	1J0	chat	WH	who is a good woman?	t
B03200087	["QUt (PosQ (YN (Sentence (Entity filibee) (Be_vp (Be_bad beautiful)))))"]	1J0	chat	YN	is Filibee  beautiful	t
B03200087	["QUt (PosQ (YN (Sentence (Entity must) (Be_vp (Be_bad old)))))"]	1J0	chat	YN	is MUST old?	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity mandy)))))"]	1J0	chat	WH	who isn't Mandy	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity marian)))))"]	1J0	chat	WH	who isn't Marian	t
B03200097	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity filibee)))))"]	1J0	chat	WH	who isn't Filibee 	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity cheney)))))"]	1J0	chat	WH	who isn't Cheney	t
B03200089	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_someone (Item a_Det (Kind old student)))))))"]	1J0	chat	YN	is Maggie an old student?	t
B03200089	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_someone (Item a_Det (Kind good stranger)))))))"]	1J0	chat	YN	is Maggie a good stranger ?	t
B03200089	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_someone (Item a_Det (Kind good name)))))))"]	1J0	chat	YN	is Maggie a good name?	t
B03200089	["QUt (PosQ (YN (Sentence (Entity alice) (Be_vp (Be_someone (Item a_Det (Kind good name)))))))"]	1J0	chat	YN	is Alice a good name?	t
193001	["QUt (PosQ (YN (Sentence (Entity filibee) (V_NP_S tell (Entity mandy) (PosS (Sentence he (Be_vp (Be_somewhere (Locating from taiwan)))))))))","QUt (PosQ (YN (Sentence (Entity filibee) (V_NP_that_S tell (Entity mandy) (PosS (Sentence he (Be_vp (Be_somewhere (Locating from taiwan)))))))))"]	1J0	chat	YN	Does Filibee tell Mandy that he is from Taiwan?	f
B03200089	["QUt (PosQ (YN (Sentence (Entity annie) (Be_vp (Be_someone (Item a_Det (Kind good name)))))))"]	1J0	chat	YN	is Annie a good name?	t
B03200089	["QUt (PosQ (YN (Sentence (Entity jessie) (Be_vp (Be_someone (Item a_Det (Kind good name)))))))"]	1J0	chat	YN	is Jessie a good name?	t
193001	["QUt (PosQ (YN (Sentence (Entity filibee) (V_NP_S tell (Entity mandy) (PosS (Sentence he (Be_vp (Be_somewhere (Locating from turkey)))))))))","QUt (PosQ (YN (Sentence (Entity filibee) (V_NP_that_S tell (Entity mandy) (PosS (Sentence he (Be_vp (Be_somewhere (Locating from turkey)))))))))"]	1J0	chat	YN	Does Filibee tell Mandy  that he is from Turkey?	f
193001	["QUt (PosQ (YN (Sentence (Entity filibee) (V_NP_S tell (Item a_Det stranger) (PosS (Sentence he (Be_vp (Be_somewhere (Locating from turkey)))))))))","QUt (PosQ (YN (Sentence (Entity filibee) (V_NP_that_S tell (Item a_Det stranger) (PosS (Sentence he (Be_vp (Be_somewhere (Locating from turkey)))))))))"]	1J0	chat	YN	Does Filibee tell a stranger  that he is from Turkey?	f
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_somewhere (Locating from turkey)))))"]	1J0	chat	WH	who isn't from Turkey	t
B03200097	["QUt (PosQ (YN (Sentence (Entity lisa1) (Be_vp (Be_bad twentytwo)))))"]	1J0	chat	YN	is Lisa1 22	t
B03200089	["QUt (PosQ (WH_Pred who_WH (Be_vp (Be_someone (Item a_Det (Kind good student))))))"]	1J0	chat	WH	who is a good student?	t
B03200087	["QUt (PosQ (WH_Pred (WHose name) (Be_vp (Be_someone (Entity jack)))))"]	1J0	chat	WH	whose name is Jack?	t
B03200056	["QUt (PosQ (YN (Sentence (Entity annie) (Be_vp (Be_someone (Item a_Det woman))))))"]	1J0	chat	YN	Is Annie a woman?	t
B03200087	["QUt (PosQ (YN (Sentence (Entity ellarose) (Be_vp (Be_bad young)))))"]	1J0	chat	YN	is Ellarose young?	t
B03200012	who isn't stranger	1J0	chat	WH	who isn't stranger	f
B03200087	["QUt (PosQ (YN (Sentence (Entity filibee) (Be_vp (Be_bad old)))))"]	1J0	chat	YN	is Filibee old?	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity jessie)))))"]	1J0	chat	WH	who isn't Jessie	t
B03200034	whose name is USA?	1J0	chat	WH	whose name is USA?	f
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity stefan)))))"]	1J0	chat	WH	who isn't Stefan	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity annie)))))"]	1J0	chat	WH	who isn't Annie	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity maggie)))))"]	1J0	chat	WH	who isn't Maggie	t
B03200091	who like to talk to Annie?	1J0	chat	WH	who like to talk to Annie?	f
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity lisa1)))))"]	1J0	chat	WH	who isn't Lisa1	t
B03200091	Does Annie like to talk?	1J0	chat	YN	Does Annie like to talk?	f
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity cherry2)))))"]	1J0	chat	WH	who isn't Cherry2	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity dora)))))"]	1J0	chat	WH	who isn't Dora	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity viola1)))))"]	1J0	chat	WH	who isn't Viola1	t
B03200012	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity ellarose)))))"]	1J0	chat	WH	who isn't Ellarose	t
B03200097	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_someone (Entity junior)))))"]	1J0	chat	WH	who isn't Junior 	t
B03200089	Do they like Andy?	1J0	chat	YN	Do they like Andy?	f
B03200097	["QUt (NegQ (WH_Pred who_WH (Be_vp (Be_bad twentytwo))))"]	1J0	chat	WH	who isn't 22	t
B03200089	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_someone (Item a_Det (Kind old woman)))))))"]	1J0	chat	YN	is Maggie an old woman?	t
B03200089	["QUt (PosQ (YN (Sentence (Entity maggie) (Be_vp (Be_someone (Item a_Det (Kind old stranger)))))))"]	1J0	chat	YN	is Maggie an old stranger ?	t
193001	["QUt (PosQ (YN (Sentence (Item a_Det stranger) (V_S say (PosS (Sentence he (Be_vp (Be_somewhere (Locating from taiwan)))))))))"]	1J0	chat	YN	Does a stranger say he is from Taiwan?	t
B03200089	["QUt (PosQ (YN (Sentence (Entity andy) (Be_vp (Be_someone (Item a_Det (Kind good name)))))))"]	1J0	chat	YN	is Andy a good name?	t
B03200089	["QUt (PosQ (YN (Sentence (Entity ariel) (Be_vp (Be_someone (Item a_Det (Kind good name)))))))"]	1J0	chat	YN	is Ariel a good name?	t
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY role (id, role) FROM stdin;
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drbean
--

SELECT pg_catalog.setval('role_id_seq', 1, false);


--
-- Data for Name: rolebearer; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY rolebearer (player, role) FROM stdin;
\.


--
-- Data for Name: s; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY s (exercise, player, league, try, score, questionchance, answerchance) FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY session (id, session_data, expires) FROM stdin;
session:cf0a7395e197bd8134dd1daafbf13ecc39af33c7                        	BQkDAAAABwlU9aj/AAAACV9fY3JlYXRlZAoGMTkzMDAxAAAACXBsYXllcl9pZAQDAAAAAwoGMTkz\nMDAxAAAAAmlkCgZEckJlYW4AAAAEbmFtZQoCb2sAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZh\ndWx0AAAADF9fdXNlcl9yZWFsbQoGb2xpdmVyAAAACGV4ZXJjaXNlCgMxSjAAAAAGbGVhZ3VlCVT1\nqQYAAAAJX191cGRhdGVk\n	1425393675
session:ad2d4e0298a892a5289dfe2ced43b02e62c90162                        	BQkDAAAABwlU8wX9AAAACV9fdXBkYXRlZAoGMTkzMDAxAAAACXBsYXllcl9pZAlU8wXYAAAACV9f\nY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KAzFKMAAAAAZsZWFndWUEAwAAAAMKBjE5\nMzAwMQAAAAJpZAoCb2sAAAAIcGFzc3dvcmQKBkRyQmVhbgAAAARuYW1lAAAABl9fdXNlcgoGQUZC\nMUowAAAACGV4ZXJjaXNl\n	1425216530
session:0c4fc72ea0e6262bd581c8479cde313d81cf773d                        	BQkDAAAABQlU+Ui/AAAACV9fY3JlYXRlZAlU+Ui/AAAACV9fdXBkYXRlZAoJQjk5MTEwMDU1AAAA\nCXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUI5OTExMDA1NQAAAAJp\nZAoCcnUAAAAIcGFzc3dvcmQKCeisneWmguaZtAAAAARuYW1lAAAABl9fdXNlcg==\n	1425626831
session:a16f52ca5c8f1649925af62ff9212c39880b6184                        	BQkDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBm9s\naXZlcgAAAAhleGVyY2lzZQlU+QFwAAAACV9fdXBkYXRlZAQDAAAAAwoCb2sAAAAIcGFzc3dvcmQK\nBjE5MzAwMQAAAAJpZAoGRHJCZWFuAAAABG5hbWUAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCVT5\nAWgAAAAJX19jcmVhdGVk\n	1425614632
session:67e9e78f9cc9ccdb9a258568464e4e268734d684                        	BQkDAAAAAwoJY2FuZGlkYXRlAAAACGV4ZXJjaXNlCVTz+q0AAAAJX191cGRhdGVkCVTz+q0AAAAJ\nX19jcmVhdGVk\n	1425279169
session:9f3e2ea80575e366a1ac6ac22027f2070c59fc26                        	BQkDAAAABwoDMUowAAAABmxlYWd1ZQlU99bbAAAACV9fdXBkYXRlZAoGMTkzMDAxAAAACXBsYXll\ncl9pZAQDAAAAAwoCb2sAAAAIcGFzc3dvcmQKBjE5MzAwMQAAAAJpZAoGRHJCZWFuAAAABG5hbWUA\nAAAGX191c2VyCVT31q8AAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoGb2xp\ndmVyAAAACGV4ZXJjaXNl\n	1425532150
session:f1d4dc6bacdfe0e2396f6277494b9a6de903c02e                        	BQkDAAAABwQDAAAAAwoGRHJCZWFuAAAABG5hbWUKAm9rAAAACHBhc3N3b3JkCgYxOTMwMDEAAAAC\naWQAAAAGX191c2VyCgYxOTMwMDEAAAAJcGxheWVyX2lkCVT1RZEAAAAJX191cGRhdGVkCVT1RXgA\nAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoDMUowAAAABmxlYWd1ZQoGb2xp\ndmVyAAAACGV4ZXJjaXNl\n	1425370083
session:2f8fb205e4fc2c9961f508c210459008111c9f92                        	BQkDAAAACAQDAAAAAwoJQjAzMjAwMDkyAAAAAmlkCgJ5aQAAAAhwYXNzd29yZAoG55un5q+FAAAA\nBG5hbWUAAAAGX191c2VyCVT5R2oAAAAJX19jcmVhdGVkCgRjYWxsAAAABWdlbnJlCgMxSjAAAAAG\nbGVhZ3VlCglCMDMyMDAwOTIAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoG\nb2xpdmVyAAAACGV4ZXJjaXNlCVT5SA4AAAAJX191cGRhdGVk\n	1425628665
session:b6fe5996a63fdc77ee6945de2a4e9e678de94389                        	BQkDAAAAAwoJY2FuZGlkYXRlAAAACGV4ZXJjaXNlCVT0AAIAAAAJX19jcmVhdGVkCVT0AAIAAAAJ\nX191cGRhdGVk\n	1425280633
session:ed2b2c2c5a7a8f0b8edb834c32be587f25758d1c                        	BQkDAAAAAwlU+TYnAAAACV9fY3JlYXRlZAlU+TYnAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425622078
session:868b55b31a4ee8bfd414ddc458b8779d2c02c519                        	BQkDAAAABwoGb2xpdmVyAAAACGV4ZXJjaXNlCgYxOTMwMDEAAAAJcGxheWVyX2lkCgdkZWZhdWx0\nAAAADF9fdXNlcl9yZWFsbQlU+EZyAAAACV9fY3JlYXRlZAoDMUowAAAABmxlYWd1ZQQDAAAAAwoC\nb2sAAAAIcGFzc3dvcmQKBkRyQmVhbgAAAARuYW1lCgYxOTMwMDEAAAACaWQAAAAGX191c2VyCVT4\nRnoAAAAJX191cGRhdGVk\n	1425560774
session:3c593c1f9252e2348dd1855cf5be12ffa01cc517                        	BQkDAAAABwoGMTkzMDAxAAAACXBsYXllcl9pZAoDMUowAAAABmxlYWd1ZQlU+VobAAAACV9fY3Jl\nYXRlZAQDAAAAAwoGRHJCZWFuAAAABG5hbWUKAm9rAAAACHBhc3N3b3JkCgYxOTMwMDEAAAACaWQA\nAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoGb2xpdmVyAAAACGV4ZXJjaXNlCVT5\nWiQAAAAJX191cGRhdGVk\n	1425634478
session:c7b0a31f73a4f1eff162a7876807bc7455e72306                        	BQkDAAAAAwlU+Vs2AAAACV9fY3JlYXRlZAlU+Vs2AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425631569
session:ed3c949c7d0ade6bf9394a9f6b4eb44e1b34e86b                        	BQkDAAAAAwlU+VlrAAAACV9fdXBkYXRlZAlU+VlrAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425631106
session:f8407773cec74c143adcfc0c44d19d31f2d60e02                        	BQkDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVPlkLgAAAAlfX2NyZWF0ZWQKAzFKMAAA\nAAZsZWFndWUKBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAAAAMKBjE5MzAwMQAAAAJpZAoGRHJCZWFu\nAAAABG5hbWUKAm9rAAAACHBhc3N3b3JkAAAABl9fdXNlcgoGb2xpdmVyAAAACGV4ZXJjaXNlCVT5\nZE8AAAAJX191cGRhdGVk\n	1425633892
session:c6da1449545a0310f2b1339f30d2c7e883410b71                        	BQkDAAAAAwlU+ZEJAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVT5kQkAAAAJX19j\ncmVhdGVk\n	1425645339
session:f333e6a1fc2acee229c608e75780922c3e171ebf                        	BQkDAAAACAlU+V0RAAAACV9fY3JlYXRlZAoJQjAzMjAwMDg3AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0KBm9saXZlcgAAAAhleGVyY2lzZQlU+V1EAAAACV9fdXBkYXRlZAoD\nMUowAAAABmxlYWd1ZQQDAAAAAwoJ5qWK5reR5am3AAAABG5hbWUKA3NodQAAAAhwYXNzd29yZAoJ\nQjAzMjAwMDg3AAAAAmlkAAAABl9fdXNlcgoEY2FsbAAAAAVnZW5yZQ==\n	1425632314
session:2fc6a5e439dbb023beb6153c881c3416f1d0a38c                        	BQkDAAAAAwlU+V0fAAAACV9fY3JlYXRlZAlU+V0fAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425632054
session:e383864e4cdf93acb66abd86771ed10d3f20d598                        	BQkDAAAAAwlU+VzEAAAACV9fY3JlYXRlZAlU+VzEAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425632009
session:3d6e9c33b99f0dd3e04451562139eb29f39376fe                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVPm1VgAAAAlfX3VwZGF0ZWQKCUIwMzIw\nMDA3MwAAAAlwbGF5ZXJfaWQEAwAAAAMKBHpoZW4AAAAIcGFzc3dvcmQKCUIwMzIwMDA3MwAAAAJp\nZAoJ5by155SE6IKyAAAABG5hbWUAAAAGX191c2VyCVT5tVYAAAAJX19jcmVhdGVk\n	1425654630
session:418f3787248ad2671cafae96848d5f4c3f9ab093                        	BQkDAAAABQlU+bVZAAAACV9fY3JlYXRlZAoJQjAzMjAwMDczAAAACXBsYXllcl9pZAlU+bVZAAAA\nCV9fdXBkYXRlZAQDAAAAAwoEemhlbgAAAAhwYXNzd29yZAoJQjAzMjAwMDczAAAAAmlkCgnlvLXn\nlITogrIAAAAEbmFtZQAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1425654633
session:cbe6b7d95c966846f7490ead86dc7639e5dc69fd                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoJQjAzMjAwMDM0AAAACXBsYXllcl9pZAoEY2FsbAAAAAVn\nZW5yZQlU+as+AAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBm9saXZlcgAA\nAAhleGVyY2lzZQQDAAAAAwoJ6Zmz6Kmp5piAAAAABG5hbWUKA3NoaQAAAAhwYXNzd29yZAoJQjAz\nMjAwMDM0AAAAAmlkAAAABl9fdXNlcglU+bwyAAAACV9fdXBkYXRlZA==\n	1425656597
session:02d4a3a55407fb3c24ce9b4053a91d9e97dba28b                        	BQkDAAAAAwlU+bKuAAAACV9fY3JlYXRlZAlU+bKuAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425655460
session:ca18c794c9285788be3783de4095fae433263b8f                        	BQkDAAAACAQDAAAAAwoJ6Zmz6Kmp5piAAAAABG5hbWUKCUIwMzIwMDAzNAAAAAJpZAoDc2hpAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBm9saXZlcgAAAAhl\neGVyY2lzZQoJQjAzMjAwMDM0AAAACXBsYXllcl9pZAlU+a5yAAAACV9fY3JlYXRlZAlU+byJAAAA\nCV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQ==\n	1425656615
session:10aad0195eaa9719ef9162d69528cb7d39d027cd                        	BQkDAAAAAwlU+bi3AAAACV9fdXBkYXRlZAlU+bi3AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425655503
session:4d975c48ae776dd21851f5321c98f5bec1495d80                        	BQkDAAAAAwlVB/o/AAAACV9fdXBkYXRlZAlVB/o/AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589775
session:beda0e13be7502dbfa0d29306719b3bddfbb6cf0                        	BQkDAAAAAwlVB/pDAAAACV9fdXBkYXRlZAlVB/pDAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589779
session:0c1b4fe46930a59519837d2b3d1ee0f649649bc4                        	BQkDAAAAAwlVB/pGAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+kYAAAAJX19j\ncmVhdGVk\n	1426589782
session:5b647a8208423867954b140e3fcbf4251c2199e9                        	BQkDAAAACAlU+qSjAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCgMxSjAAAAAGbGVh\nZ3VlCgRjYWxsAAAABWdlbnJlBAMAAAADCglCMDMyMDAwNzMAAAACaWQKBHpoZW4AAAAIcGFzc3dv\ncmQKCeW8teeUhOiCsgAAAARuYW1lAAAABl9fdXNlcglU+qTJAAAACV9fdXBkYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA3MwAAAAlwbGF5ZXJfaWQ=\n	1425716316
session:1b3d8a2067fd5d9849785a847cb15f6a9234cafa                        	BQkDAAAACAQDAAAAAwoJQjAzMjAwMDk3AAAAAmlkCgJzaQAAAAhwYXNzd29yZAoJ5p6X5oCd6L6w\nAAAABG5hbWUAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCVT6gZYAAAAJX191cGRhdGVkCVT6gVMA\nAAAJX19jcmVhdGVkCgRjYWxsAAAABWdlbnJlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoJQjAz\nMjAwMDk3AAAACXBsYXllcl9pZAoGb2xpdmVyAAAACGV4ZXJjaXNl\n	1425707391
session:ec57b859bc4855221192f2989340c21ae2f201d2                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDEwMgAAAAJpZAoC\neWkAAAAIcGFzc3dvcmQKCeadjuaAoeWuowAAAARuYW1lAAAABl9fdXNlcglU+dsSAAAACV9fdXBk\nYXRlZAlU+dsSAAAACV9fY3JlYXRlZAoJQjAzMjAwMTAyAAAACXBsYXllcl9pZA==\n	1425665695
session:63186c6ff58e3875ca6db80e851cae42f12c03d3                        	BQkDAAAAAwlU+qSeAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVT6pJ4AAAAJX19j\ncmVhdGVk\n	1425715886
session:5eb5dc44a4536263005f23d308a42161024f9367                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBm9saXZlcgAA\nAAhleGVyY2lzZQlU+leOAAAACV9fY3JlYXRlZAlU+lgZAAAACV9fdXBkYXRlZAoDMUowAAAABmxl\nYWd1ZQoJQjAzMjAwMDk3AAAACXBsYXllcl9pZAQDAAAAAwoJ5p6X5oCd6L6wAAAABG5hbWUKAnNp\nAAAACHBhc3N3b3JkCglCMDMyMDAwOTcAAAACaWQAAAAGX191c2Vy\n	1425696301
session:d3b317a1a6d3d8abda6fed3ed54e1b2f5fd9c456                        	BQkDAAAACAQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCemCseS+neWruwAAAARuYW1lCglCMDMyMDAw\nMTIAAAACaWQAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCVT66lgAAAAJX191cGRhdGVkCgdkZWZh\ndWx0AAAADF9fdXNlcl9yZWFsbQlU+unsAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNl\nCgRjYWxsAAAABWdlbnJlCglCMDMyMDAwMTIAAAAJcGxheWVyX2lk\n	1425734946
session:60fc00e044925df6e306c23a24fbe68a350e7357                        	BQkDAAAABQlU+sLlAAAACV9fY3JlYXRlZAQDAAAAAwoJ6Zmz6Kmp5piAAAAABG5hbWUKCUIwMzIw\nMDAzNAAAAAJpZAoDc2hpAAAACHBhc3N3b3JkAAAABl9fdXNlcglU+sLlAAAACV9fdXBkYXRlZAoJ\nQjAzMjAwMDM0AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1425723662
session:454c74fedb3c3bcb131f985b3e0a47d577a8833b                        	BQkDAAAABwlU/Q/MAAAACV9fdXBkYXRlZAlU/Q/FAAAACV9fY3JlYXRlZAoGMTkzMDAxAAAACXBs\nYXllcl9pZAoDMUowAAAABmxlYWd1ZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBm9saXZlcgAA\nAAhleGVyY2lzZQQDAAAAAwoGRHJCZWFuAAAABG5hbWUKAm9rAAAACHBhc3N3b3JkCgYxOTMwMDEA\nAAACaWQAAAAGX191c2Vy\n	1425874620
session:ee3e8b6a77f506cc3cdfd9fc48017bd6ffa67f3b                        	BQkDAAAAAwlU+u8bAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVT67xsAAAAJX191\ncGRhdGVk\n	1425734955
session:29aec8079ecf11c094316cefe7209d0613748d08                        	BQkDAAAAAwlU+u0mAAAACV9fY3JlYXRlZAlU+u0mAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425734454
session:4bdaddc3d1db7cfd6b4afffe8172ead6b7bec98d                        	BQkDAAAABwlU+wLZAAAACV9fY3JlYXRlZAoDMUowAAAABmxlYWd1ZQQDAAAAAwoGMTkzMDAxAAAA\nAmlkCgZEckJlYW4AAAAEbmFtZQoCb2sAAAAIcGFzc3dvcmQAAAAGX191c2VyCgYxOTMwMDEAAAAJ\ncGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlU+wL1AAAACV9fdXBkYXRlZAoGb2xp\ndmVyAAAACGV4ZXJjaXNl\n	1425741470
session:731eca8f01d659f021ed63ebf40a35de1b73f870                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVT67xgAAAAJX19jcmVhdGVkCVT67xgAAAAJX191\ncGRhdGVk\n	1425734958
session:701749b50f8f4dc5c17496d037854f6a7725c1cc                        	BQkDAAAACAoJQjAzMjAwMDk3AAAACXBsYXllcl9pZAQDAAAAAwoJ5p6X5oCd6L6wAAAABG5hbWUK\nAnNpAAAACHBhc3N3b3JkCglCMDMyMDAwOTcAAAACaWQAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3Vl\nCgZvbGl2ZXIAAAAIZXhlcmNpc2UKBGNhbGwAAAAFZ2VucmUJVPrvbgAAAAlfX3VwZGF0ZWQKB2Rl\nZmF1bHQAAAAMX191c2VyX3JlYWxtCVT671cAAAAJX19jcmVhdGVk\n	1425735374
session:cdd198ab1a65b15d147316adffc565e7c8adc392                        	BQkDAAAACAlU+7h0AAAACV9fY3JlYXRlZAoJQjAzMjAwMDczAAAACXBsYXllcl9pZAoGb2xpdmVy\nAAAACGV4ZXJjaXNlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEY2FsbAAAAAVnZW5yZQoDMUow\nAAAABmxlYWd1ZQlU+7iZAAAACV9fdXBkYXRlZAQDAAAAAwoJ5by155SE6IKyAAAABG5hbWUKBHpo\nZW4AAAAIcGFzc3dvcmQKCUIwMzIwMDA3MwAAAAJpZAAAAAZfX3VzZXI=\n	1425787146
session:56a3247b95469f7be0ea774eb005df788579fbcb                        	BQkDAAAAAwlU/HenAAAACV9fY3JlYXRlZAoHY29ubmVsbAAAAAhleGVyY2lzZQlU/HenAAAACV9f\ndXBkYXRlZA==\n	1425835447
session:2ce3f339fb9ada363fd71a84bc85a23ab5a3e056                        	BQkDAAAABwoDMUowAAAABmxlYWd1ZQlU/Pl+AAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3Vz\nZXJfcmVhbG0EAwAAAAMKBjE5MzAwMQAAAAJpZAoCb2sAAAAIcGFzc3dvcmQKBkRyQmVhbgAAAARu\nYW1lAAAABl9fdXNlcgoGMTkzMDAxAAAACXBsYXllcl9pZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVT8\n+Y0AAAAJX191cGRhdGVk\n	1425869396
session:87e6d5ac01b53c9268609ecf1b46179dbcb996ed                        	BQkDAAAAAwlU/Pw7AAAACV9fdXBkYXRlZAlU/Pw7AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425869405
session:1094b086efa3b25a5231a10770ec3b767aa3cca4                        	BQkDAAAAAwlU/O+dAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVT8750AAAAJX19j\ncmVhdGVk\n	1425866165
session:df1f7e5f9bfe34ad51f6d304fad71c56b92408d2                        	BQkDAAAACAlU/PyjAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoGb2xpdmVyAAAACGV4ZXJj\naXNlCgMxSjAAAAAGbGVhZ3VlCglCMDMyMDAwMzIAAAAJcGxheWVyX2lkBAMAAAADCglCMDMyMDAw\nMzIAAAACaWQKCeWui+eri+WptwAAAARuYW1lCgJsaQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVPz7\nzQAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1425869643
session:d4f46698eb95e65a5e627dc27df208aa6d55ddbc                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVT9o3EAAAAJX191cGRhdGVkCVT9o3EAAAAJX19j\ncmVhdGVk\n	1425912193
session:4cc008cecac8300a61fcb43fa0282797eb291a82                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeWQ\ns+iyneWuuAAAAARuYW1lCgNiZWkAAAAIcGFzc3dvcmQKCUIwMzIwMDAxOAAAAAJpZAAAAAZfX3Vz\nZXIKCUIwMzIwMDAxOAAAAAlwbGF5ZXJfaWQKAzFKMAAAAAZsZWFndWUKBm9saXZlcgAAAAhleGVy\nY2lzZQlU/X+gAAAACV9fY3JlYXRlZAlU/YBHAAAACV9fdXBkYXRlZA==\n	1425903494
session:f7b9adb35f1160ebb64cdcf90f6d77c7b5bc3a1e                        	BQkDAAAAAwlU/n88AAAACV9fdXBkYXRlZAlU/n87AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425968459
session:bd3ecd0ad56f7fbe32c276989c09e39fd4be8cf7                        	BQkDAAAAAwlU/n12AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVT+fXYAAAAJX191\ncGRhdGVk\n	1425968548
session:930b592a3f36d4c4a52e04533684a4cb8d7857f3                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDc0AAAAAmlkCgNwaW4AAAAIcGFzc3dvcmQKCeioseWTgeeQ\npgAAAARuYW1lAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVP6AGQAAAAlfX2Ny\nZWF0ZWQJVP6AGQAAAAlfX3VwZGF0ZWQKCUIwMzIwMDA3NAAAAAlwbGF5ZXJfaWQ=\n	1425968681
session:1523095702a11d158ec4555fe5324a03a74e9182                        	BQkDAAAAAwlU/rlvAAAACV9fY3JlYXRlZAlU/rlvAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1425983359
session:ee46c1f108c50e1b4e0714a731d77b6021fe7a7f                        	BQkDAAAAAwlVB/pAAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+kEAAAAJX191\ncGRhdGVk\n	1426589776
session:bf84db7c96530a26d53331335af090a8ccd1e12a                        	BQkDAAAAAwlVB/pEAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+kQAAAAJX19j\ncmVhdGVk\n	1426589780
session:8e5a305a0541426285f77f322d8a642cfb7badff                        	BQkDAAAAAwlVB/pHAAAACV9fdXBkYXRlZAlVB/pHAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589783
session:e8b2102ff5367d5b1df9d484b5821fc3063bff87                        	BQkDAAAACAlU/tZqAAAACV9fdXBkYXRlZAQDAAAAAwoDcGluAAAACHBhc3N3b3JkCglCMDMyMDAw\nNzQAAAACaWQKCeioseWTgeeQpgAAAARuYW1lAAAABl9fdXNlcglU/smcAAAACV9fY3JlYXRlZAoG\nb2xpdmVyAAAACGV4ZXJjaXNlCgRjYWxsAAAABWdlbnJlCgMxSjAAAAAGbGVhZ3VlCgdkZWZhdWx0\nAAAADF9fdXNlcl9yZWFsbQoJQjAzMjAwMDc0AAAACXBsYXllcl9pZA==\n	1425990895
session:a6c0f7e56b4eff43b46736c71a6811517f8500dc                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVT/zP8AAAAJX19jcmVhdGVkCVT/zP8AAAAJX191\ncGRhdGVk\n	1426053903
session:b8675a80c7cb328491ebc427da90a8a3dec893f8                        	BQkDAAAACAoGb2xpdmVyAAAACGV4ZXJjaXNlCgMxSjAAAAAGbGVhZ3VlCVT+uZAAAAAJX191cGRh\ndGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEY2FsbAAAAAVnZW5yZQlU/rlxAAAACV9fY3Jl\nYXRlZAQDAAAAAwoJ6Kix5ZOB55CmAAAABG5hbWUKCUIwMzIwMDA3NAAAAAJpZAoDcGluAAAACHBh\nc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDc0AAAACXBsYXllcl9pZA==\n	1425983502
session:c18577899e0277fd20f681c45eace02db88819a8                        	BQkDAAAAAwlU/80BAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVT/zQEAAAAJX191\ncGRhdGVk\n	1426053905
session:996bfe91d57888e8b13413377211612b12c90394                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUBfXEAAAAJX191cGRhdGVkCVUBfXEAAAAJX19j\ncmVhdGVk\n	1426164609
session:34d35f86b0e8a1c4fc620928109f99ce5542abd3                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUBfXIAAAAJX191cGRhdGVkCVUBfXIAAAAJX19j\ncmVhdGVk\n	1426164610
session:23725861d9d99dafeec41da4f3a4fb1838b35fa4                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUBfXMAAAAJX191cGRhdGVkCVUBfXMAAAAJX19j\ncmVhdGVk\n	1426164611
session:896a078c0d99fd9714cb8e5cce56e2dc9205aa66                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUBfXQAAAAJX191cGRhdGVkCVUBfXQAAAAJX19j\ncmVhdGVk\n	1426164612
session:9ff1b447fb86d6709024af161ce9c67b66e142e0                        	BQkDAAAACAQDAAAAAwoJQjAzMjAwMDM3AAAAAmlkCgnojIPlkJvlhJIAAAAEbmFtZQoDanVuAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcgoGb2xpdmVyAAAACGV4ZXJjaXNlCgdkZWZhdWx0AAAADF9fdXNl\ncl9yZWFsbQoEY2FsbAAAAAVnZW5yZQlVAEdMAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQlV\nAEZiAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM3AAAACXBsYXllcl9pZA==\n	1426085936
session:4fb6f764efa1ae90990a03f3f25ef2cfb100f7ee                        	BQkDAAAAAwlVAaPtAAAACV9fY3JlYXRlZAlVAaPtAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426174461
session:54f5e3331fd0d7790eeb0e11d5f4d6e6f6964243                        	BQkDAAAACAlVAaMGAAAACV9fY3JlYXRlZAlVAaNQAAAACV9fdXBkYXRlZAQDAAAAAwoJ6Kix5bWQ\n5am3AAAABG5hbWUKCUIwMzIwMDAzMAAAAAJpZAoDbGFuAAAACHBhc3N3b3JkAAAABl9fdXNlcgoH\nZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KAzFKMAAAAAZsZWFndWUKBm9saXZlcgAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMDMwAAAACXBsYXllcl9pZA==\n	1426174763
session:48de17d9f1a3c72563a259a7b3dccd47ce051752                        	BQkDAAAAAwlVAamlAAAACV9fdXBkYXRlZAlVAamlAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426177519
session:3e3dab6a342e5521a66bc3c7f33c7c11dd22409a                        	BQkDAAAACAlVAaE5AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCgMxSjAAAAAGbGVh\nZ3VlCgRjYWxsAAAABWdlbnJlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQQDAAAAAwoJQjAzMjAw\nMDU0AAAAAmlkCgVjaGVuZwAAAAhwYXNzd29yZAoJ5a6L5om/6LuSAAAABG5hbWUAAAAGX191c2Vy\nCVUBmiAAAAAJX19jcmVhdGVkCglCMDMyMDAwNTQAAAAJcGxheWVyX2lk\n	1426173916
session:b7a64f6b240e1c239e3440d4ba979a6e15f6b12a                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVQGOqQAAAAlfX3VwZGF0ZWQEAwAAAAMK\nCUI5OTExMDA1NQAAAAJpZAoCcnUAAAAIcGFzc3dvcmQKCeisneWmguaZtAAAAARuYW1lAAAABl9f\ndXNlcgoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAlVAY6pAAAACV9fY3JlYXRlZA==\n	1426169180
session:afac028053fc76a2fe00376345e7eb4b7c9bc57f                        	BQkDAAAAAwlVAZ01AAAACV9fY3JlYXRlZAlVAZ01AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426173026
session:e5047dffaa7ac4053885698df8ac68eb0965bc6b                        	BQkDAAAACAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUBE4sAAAAJX19jcmVhdGVkCgMxSjAAAAAGbGVh\nZ3VlCgRjYWxsAAAABWdlbnJlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoJQjAzMjAwMDAyAAAA\nCXBsYXllcl9pZAlVARVPAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDAyAAAAAmlkCgJ5aQAA\nAAhwYXNzd29yZAoJ6Zmz6aGX5pqEAAAABG5hbWUAAAAGX191c2Vy\n	1426138030
session:ce801827e17d7d24a3104c45976f07464a5173b3                        	BQkDAAAAAwlVADgiAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUAOCIAAAAJX191\ncGRhdGVk\n	1426081713
session:9895ed520045eb8b7a6f727dba239518902cb493                        	BQkDAAAAAwlVAaKeAAAACV9fdXBkYXRlZAlVAaKeAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426174131
session:ae3f1706b67751770d1fa9e890b74e6cc94a5ca2                        	BQkDAAAACAlVAa89AAAACV9fY3JlYXRlZAoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAoGb2xpdmVy\nAAAACGV4ZXJjaXNlCgMxSjAAAAAGbGVhZ3VlCgRjYWxsAAAABWdlbnJlCgdkZWZhdWx0AAAADF9f\ndXNlcl9yZWFsbQQDAAAAAwoCcWkAAAAIcGFzc3dvcmQKCeeUsOa3h+WckgAAAARuYW1lCglCMDMy\nMDAwNDYAAAACaWQAAAAGX191c2VyCVUBr10AAAAJX191cGRhdGVk\n	1426177897
session:38da23ee560c120f44e0513c81172eca487716fa                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUBo+0AAAAJX19jcmVhdGVkCVUBo+0AAAAJX191\ncGRhdGVk\n	1426175303
session:fb3cba2ae879c0fba712a991ba30e1ceb5211f90                        	BQkDAAAAAwlVAaLbAAAACV9fdXBkYXRlZAlVAaLbAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426175033
session:7332ba9536a7d6c0b6223405ab1bc33a70bf8239                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUBqXgAAAAJX191cGRhdGVkCVUBqXgAAAAJX19j\ncmVhdGVk\n	1426175883
session:05cdb1e9b6d04741de14f6f7ace5a091c95a36f7                        	BQkDAAAAAwlVAbfHAAAACV9fdXBkYXRlZAlVAbfHAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426179615
session:6fd2b470c70281ada60296663a56e281bb0b15f0                        	BQkDAAAABQQDAAAAAwoJQjk5MTEwMDU1AAAAAmlkCgnorJ3lpoLmmbQAAAAEbmFtZQoCcnUAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVAbxAAAAACV9fdXBk\nYXRlZAoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAlVAbxAAAAACV9fY3JlYXRlZA==\n	1426180877
session:a3ad98cdcf1bb9d33d3ac3e73b6a1f27957084f7                        	BQkDAAAACAQDAAAAAwoJQjAzMjAwMDY3AAAAAmlkCgJibwAAAAhwYXNzd29yZAoJ546L5p+P6K6a\nAAAABG5hbWUAAAAGX191c2VyCglCMDMyMDAwNjcAAAAJcGxheWVyX2lkCgMxSjAAAAAGbGVhZ3Vl\nCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEY2FsbAAAAAVnZW5yZQlVAbZoAAAACV9fY3JlYXRl\nZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUBtvEAAAAJX191cGRhdGVk\n	1426180171
session:1d7396ce57fb297ed011fd90bb8d1a411143a996                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDAyAAAAAmlkCgJ5aQAAAAhwYXNzd29yZAoJ6Zmz6aGX5pqE\nAAAABG5hbWUAAAAGX191c2VyCVUBw0IAAAAJX19jcmVhdGVkCVUBw0IAAAAJX191cGRhdGVkCglC\nMDMyMDAwMDIAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1426182482
session:abe810157bf31834a07cbd6c7437ebd3c65fbe53                        	BQkDAAAAAwlVB/pBAAAACV9fY3JlYXRlZAlVB/pCAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589777
session:5254322c0fc0d745250e118411f2d08cfd43fedb                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+kUAAAAJX19jcmVhdGVkCVUH+kUAAAAJX191\ncGRhdGVk\n	1426589781
session:c07c8079673c12f185aa3572eff5185e2c93441d                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+kgAAAAJX19jcmVhdGVkCVUH+kgAAAAJX191\ncGRhdGVk\n	1426589784
session:6b9cc90f4865f07d6587fa4c9cfc5f26b1d7c691                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+koAAAAJX191cGRhdGVkCVUH+koAAAAJX19j\ncmVhdGVk\n	1426589786
session:c4906ee5b00acfb6ea92c7d0b1877009a200db08                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+ksAAAAJX191cGRhdGVkCVUH+ksAAAAJX19j\ncmVhdGVk\n	1426589786
session:aa3dd763e729d103504f8d6b72ff49e8f67fd6cb                        	BQkDAAAACAlVAndHAAAACV9fY3JlYXRlZAQDAAAAAwoJ5by155SE6IKyAAAABG5hbWUKCUIwMzIw\nMDA3MwAAAAJpZAoEemhlbgAAAAhwYXNzd29yZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2Vy\nX3JlYWxtCgMxSjAAAAAGbGVhZ3VlCVUCeIsAAAAJX191cGRhdGVkCgRjYWxsAAAABWdlbnJlCglC\nMDMyMDAwNzMAAAAJcGxheWVyX2lkCgZvbGl2ZXIAAAAIZXhlcmNpc2U=\n	1426229196
session:451d93c0f40fdbe7b6c8874b7d118b1d71786e70                        	BQkDAAAABwlVAm5vAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQoHZGVmYXVsdAAAAAxfX3Vz\nZXJfcmVhbG0EAwAAAAMKAm9rAAAACHBhc3N3b3JkCgYxOTMwMDEAAAACaWQKBkRyQmVhbgAAAARu\nYW1lAAAABl9fdXNlcgoGMTkzMDAxAAAACXBsYXllcl9pZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUC\nbk4AAAAJX19jcmVhdGVk\n	1426226500
session:50f9c87eed03ba430779b412e32ae9b8ab04d99d                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQoGb2xpdmVyAAAACGV4ZXJjaXNl\nCVUCOfsAAAAJX19jcmVhdGVkCglCMDMyMDAwNTYAAAAJcGxheWVyX2lkCVUCOikAAAAJX191cGRh\ndGVkBAMAAAADCgJ5aQAAAAhwYXNzd29yZAoJ57Ch6YC45qyjAAAABG5hbWUKCUIwMzIwMDA1NgAA\nAAJpZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1426213860
session:ca577d6821c4f3fd425cf63c22c158289370015a                        	BQkDAAAACAQDAAAAAwoEemhlbgAAAAhwYXNzd29yZAoJQjAzMjAwMDczAAAAAmlkCgnlvLXnlITo\ngrIAAAAEbmFtZQAAAAZfX3VzZXIKCUIwMzIwMDA3MwAAAAlwbGF5ZXJfaWQJVQJ+GgAAAAlfX3Vw\nZGF0ZWQKAzFKMAAAAAZsZWFndWUKBm9saXZlcgAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxfX3Vz\nZXJfcmVhbG0KBGNhbGwAAAAFZ2VucmUJVQJ3wwAAAAlfX2NyZWF0ZWQ=\n	1426232825
session:46aafa4243313dbcc99232a0036bed6b5a936726                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQoGb2xpdmVyAAAACGV4ZXJjaXNl\nCVUCdhIAAAAJX19jcmVhdGVkCVUCfucAAAAJX191cGRhdGVkBAMAAAADCglCMDMyMDAwODMAAAAC\naWQKBuW+kOeUhAAAAARuYW1lCgR6aGVuAAAACHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDgz\nAAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1426231022
session:a5d83d06ffd6db87609aa252b197f9374e76066e                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVQKBWAAAAAlf\nX2NyZWF0ZWQKAzFKMAAAAAZsZWFndWUKCUIwMzIwMDA4MgAAAAlwbGF5ZXJfaWQJVQKB+AAAAAlf\nX3VwZGF0ZWQKBm9saXZlcgAAAAhleGVyY2lzZQQDAAAAAwoJ5ZCz5a2f5aiBAAAABG5hbWUKBG1l\nbmcAAAAIcGFzc3dvcmQKCUIwMzIwMDA4MgAAAAJpZAAAAAZfX3VzZXI=\n	1426234328
session:da736f1fe9a92bef7c811f6a92b51891b08c88aa                        	BQkDAAAACAoJQjAzMjAwMDQwAAAACXBsYXllcl9pZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUCdQ0A\nAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoDMUowAAAABmxlYWd1ZQlVAnQX\nAAAACV9fY3JlYXRlZAQDAAAAAwoJQjAzMjAwMDQwAAAAAmlkCgN5b3UAAAAIcGFzc3dvcmQKCeW+\nkOWupeammwAAAARuYW1lAAAABl9fdXNlcgoEY2FsbAAAAAVnZW5yZQ==\n	1426228131
session:fb4e6a7b7ca208838627a12b9c22879e8d0f6e87                        	BQkDAAAACAQDAAAAAwoDcGVpAAAACHBhc3N3b3JkCglCMDMyMDAwNzgAAAACaWQKCemEkuaym+et\noAAAAARuYW1lAAAABl9fdXNlcgoEY2FsbAAAAAVnZW5yZQlVAoanAAAACV9fdXBkYXRlZAoHZGVm\nYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA3OAAAAAlwbGF5ZXJfaWQJVQJ4tgAAAAlfX2Ny\nZWF0ZWQKBm9saXZlcgAAAAhleGVyY2lzZQoDMUowAAAABmxlYWd1ZQ==\n	1426232522
session:f5cf020a1652edc3bb7b6edf8a2cf5e55cbb805b                        	BQkDAAAACAQDAAAAAwoJ6JGJ5pu45pm0AAAABG5hbWUKA3NodQAAAAhwYXNzd29yZAoJQjAzMjAw\nMDMxAAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDMxAAAACXBsYXllcl9pZAoDMUowAAAABmxlYWd1\nZQoEY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVQJwQAAAAAlfX3VwZGF0\nZWQKBm9saXZlcgAAAAhleGVyY2lzZQlVAm/bAAAACV9fY3JlYXRlZA==\n	1426226920
session:b053ff9bf4da9e724aa1e31c28b1ba40228f521f                        	BQkDAAAACAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUCcZEAAAAJX191cGRhdGVkBAMAAAADCgnlvLXp\nm4XlqpsAAAAEbmFtZQoCeWEAAAAIcGFzc3dvcmQKCUIwMzIwMDAxOQAAAAJpZAAAAAZfX3VzZXIJ\nVQJxXwAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCgRjYWxsAAAABWdlbnJl\nCgMxSjAAAAAGbGVhZ3VlCglCMDMyMDAwMTkAAAAJcGxheWVyX2lk\n	1426227362
session:b84a864f28249d06be74e6b96d9ec1ad58cb7c5b                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoGb2xpdmVyAAAACGV4ZXJjaXNlCVUCdb0AAAAJX191cGRh\ndGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCeabvuWm\npOWptwAAAARuYW1lCglCMDMyMDAwNzUAAAACaWQAAAAGX191c2VyCVUCc78AAAAJX19jcmVhdGVk\nCgMxSjAAAAAGbGVhZ3VlCglCMDMyMDAwNzUAAAAJcGxheWVyX2lk\n	1426228284
session:f74e0647d2d38523419e8847b324e9ef39bdeec1                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVQJ/1wAAAAlfX3VwZGF0ZWQKBGNhbGwA\nAAAFZ2VucmUKAzFKMAAAAAZsZWFndWUKBm9saXZlcgAAAAhleGVyY2lzZQQDAAAAAwoEamluZwAA\nAAhwYXNzd29yZAoJ5b2t6Z2W5aqbAAAABG5hbWUKCUIwMzIwMDA5MwAAAAJpZAAAAAZfX3VzZXIK\nCUIwMzIwMDA5MwAAAAlwbGF5ZXJfaWQJVQJ+agAAAAlfX2NyZWF0ZWQ=\n	1426232823
session:a96701dc96cefcfbe76350571c6c4dcc7385b078                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUHyUwAAAAJX19jcmVhdGVkCVUHyUwAAAAJX191\ncGRhdGVk\n	1426577243
session:6109e44486e8672273ea7849bc36eb754b434454                        	BQkDAAAABQlVAnedAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVQJ3nQAA\nAAlfX3VwZGF0ZWQKCUIwMzIwMDA1NwAAAAlwbGF5ZXJfaWQEAwAAAAMKA2ppYQAAAAhwYXNzd29y\nZAoJQjAzMjAwMDU3AAAAAmlkCgnkvZnkvbPnraAAAAAEbmFtZQAAAAZfX3VzZXI=\n	1426229598
session:1a68ca289179586b77d22df3c82e86655076da83                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVQbcYAAAAAlf\nX3VwZGF0ZWQKCUIwMzIwMDAyOQAAAAlwbGF5ZXJfaWQKBm9saXZlcgAAAAhleGVyY2lzZQQDAAAA\nAwoJ6Y2+5a6a6LuSAAAABG5hbWUKCUIwMzIwMDAyOQAAAAJpZAoEZGluZwAAAAhwYXNzd29yZAAA\nAAZfX3VzZXIKBGNhbGwAAAAFZ2VucmUJVQbawgAAAAlfX2NyZWF0ZWQ=\n	1426517446
session:45892b6788b2812c82f7963b87482f57614e5813                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBm9saXZlcgAAAAhleGVyY2lzZQlVAn39\nAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMTA5AAAA\nCXBsYXllcl9pZAlVAn3TAAAACV9fY3JlYXRlZAQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCUIwMzIw\nMDEwOQAAAAJpZAoJ5p2O5a6H57a4AAAABG5hbWUAAAAGX191c2Vy\n	1426232438
session:bd101bbb448a582691fa5b218b14a8ccea619aef                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA5NwAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAnNpAAAACHBhc3N3b3JkCgnmnpfmgJ3ovrAAAAAEbmFtZQoJQjAzMjAwMDk3AAAAAmlk\nAAAABl9fdXNlcgoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQlVAn3yAAAACV9fdXBkYXRl\nZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUCfUsAAAAJX19jcmVhdGVk\n	1426230637
session:01b48d6b751a454cb25d9e01d39180509fe11070                        	BQkDAAAAAwlVAoQaAAAACV9fdXBkYXRlZAlVAoQaAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426231857
session:0efa3f345a287ecb1aa9adc34a1d785269a7fa70                        	BQkDAAAAAwlVB/o5AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+jkAAAAJX19j\ncmVhdGVk\n	1426589769
session:43e72973a393dd1e20bbd67eece86ac43ec4e494                        	BQkDAAAAAwlVB/o6AAAACV9fdXBkYXRlZAlVB/o6AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589770
session:98132e18ff1ecc9918e86a5367a490cf6f1112a0                        	BQkDAAAAAwlVB/o7AAAACV9fdXBkYXRlZAlVB/o7AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589771
session:ea8268e67117918f6d906855a6e797562d412ba6                        	BQkDAAAAAwlVB/o8AAAACV9fY3JlYXRlZAlVB/o8AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589772
session:15af9536e6da313adbcf378924388416dab8bb52                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+j0AAAAJX19jcmVhdGVkCVUH+j0AAAAJX191\ncGRhdGVk\n	1426589773
session:aef0eb9f8515fe73dbd3d1f8cbc7ff6edf1c89ab                        	BQkDAAAAAwlVB/o+AAAACV9fdXBkYXRlZAlVB/o+AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589774
session:d215988684fa009ce02f6687673a65b6d07a52e5                        	BQkDAAAAAwlVB/pMAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+kwAAAAJX191\ncGRhdGVk\n	1426589788
session:1550b001885f08ae32bb3c59ab8e602194a7d3d6                        	BQkDAAAAAwlVB/pNAAAACV9fY3JlYXRlZAlVB/pNAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589789
session:a45aaf9a099f7bbb3a4b961d0365552992851328                        	BQkDAAAAAwlVB/pOAAAACV9fY3JlYXRlZAlVB/pOAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589790
session:a632de48cb2869c89a4cd8eb886e5c0fbd26224d                        	BQkDAAAAAwlVB/pPAAAACV9fY3JlYXRlZAlVB/pPAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589791
session:944ace4c8f5bdfbe88f512049a652dc116e2d618                        	BQkDAAAAAwlVB/pQAAAACV9fY3JlYXRlZAlVB/pRAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589792
session:7426528850f3132fca1ef2c465a121ae09972ecd                        	BQkDAAAAAwlVB/pSAAAACV9fdXBkYXRlZAlVB/pSAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589793
session:166b89fa805222778c29ce65947ced570e8b08b7                        	BQkDAAAAAwlVB/pTAAAACV9fY3JlYXRlZAlVB/pTAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589794
session:dd92ecc51b5243258de37abe6be0b67515937bf4                        	BQkDAAAAAwlVB/pUAAAACV9fdXBkYXRlZAlVB/pUAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589796
session:108961de3991e78ef38a404d6d479c09851c5ed3                        	BQkDAAAAAwlVB/pUAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+lQAAAAJX19j\ncmVhdGVk\n	1426589796
session:2bb2b8d41e5f826caa7a2491fdccb8c43622cf28                        	BQkDAAAAAwlVB/pVAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUH+lUAAAAJX19j\ncmVhdGVk\n	1426589797
session:05d81c8b1ea27bf412457636146670418e1e95d7                        	BQkDAAAAAwlVB/pVAAAACV9fY3JlYXRlZAlVB/pVAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426589797
session:d25d38e634315fa606527346477909a8f97d13d0                        	BQkDAAAAAwlVCP3eAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/d0AAAAJX19j\ncmVhdGVk\n	1426656237
session:90cc580ee59a759f9403b5826592f93c96035d7d                        	BQkDAAAAAwlVCP3eAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/d4AAAAJX191\ncGRhdGVk\n	1426656238
session:6ce62a8d3dafb53bd1e373ecc352be20df402500                        	BQkDAAAAAwlVCP3gAAAACV9fdXBkYXRlZAlVCP3fAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656239
session:2a01be3a5aaeac6b7936a2c3a03f223fee6b90d4                        	BQkDAAAABQlVCDaJAAAACV9fY3JlYXRlZAlVCDaJAAAACV9fdXBkYXRlZAoJQjk5MTEwMDU1AAAA\nCXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUI5OTExMDA1NQAAAAJp\nZAoJ6Kyd5aaC5pm0AAAABG5hbWUKAnJ1AAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1426605449
session:e9630f8587f1fa08478fc11d55cb4e502b3fd236                        	BQkDAAAAAwlVCP3VAAAACV9fY3JlYXRlZAlVCP3VAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656229
session:b9a4233bdccd8b475f5dacd807ae4640d2391c22                        	BQkDAAAAAwlVCP3VAAAACV9fY3JlYXRlZAlVCP3VAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656229
session:3eed78cb6c79e0a194fa44d1afa99b04810c962f                        	BQkDAAAAAwlVCP3XAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/dcAAAAJX19j\ncmVhdGVk\n	1426656231
session:8db3d04d34a06966cd37e5d5e52c08bc1ec32c62                        	BQkDAAAAAwlVCP3YAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/dgAAAAJX191\ncGRhdGVk\n	1426656232
session:256738c0422b2c54941f8b70d37897bf76ba2e16                        	BQkDAAAAAwlVCP3ZAAAACV9fdXBkYXRlZAlVCP3ZAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656233
session:f0639be36f1969a46f76f67bc98959294f861700                        	BQkDAAAAAwlVCP3bAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/dsAAAAJX191\ncGRhdGVk\n	1426656234
session:95206cb7833bed844d339bfe1195cdbc180e9731                        	BQkDAAAAAwlVCP3cAAAACV9fY3JlYXRlZAlVCP3cAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656235
session:c1bbefc0cf8799f665906f420201e7c060932fdd                        	BQkDAAAAAwlVCP3hAAAACV9fdXBkYXRlZAlVCP3hAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656241
session:5aedb4b7c510f356c1faa4d7a8961176b9ede118                        	BQkDAAAAAwlVCP3iAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/eIAAAAJX191\ncGRhdGVk\n	1426656242
session:e868232ae66d0fe40ae844aa905a5720642ddd1b                        	BQkDAAAAAwlVCP3kAAAACV9fY3JlYXRlZAlVCP3kAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656243
session:d8f61af9af9e0e3599c7b4910563470101bb9bf5                        	BQkDAAAAAwlVCP3lAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/eUAAAAJX19j\ncmVhdGVk\n	1426656245
session:551f7fcec77dd1d9c10a9a33742facf26152e6de                        	BQkDAAAAAwlVCP3nAAAACV9fY3JlYXRlZAlVCP3nAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656246
session:433c2b01f7038895aba1654a2c84487be9f15cf9                        	BQkDAAAAAwlVCP3oAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/egAAAAJX19j\ncmVhdGVk\n	1426656247
session:fe6c28af90afadfda7d1e8e52ceb069042e6ce4a                        	BQkDAAAAAwlVCP3qAAAACV9fdXBkYXRlZAlVCP3qAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656249
session:76a6af8101d07faa0123482b6b75afd47d71e657                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/esAAAAJX191cGRhdGVkCVUI/esAAAAJX19j\ncmVhdGVk\n	1426656250
session:f2cc729010971056a83bdd7d87dc5aba93200eec                        	BQkDAAAAAwlVCP3sAAAACV9fdXBkYXRlZAlVCP3sAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656252
session:074849a576ce655400640470a28f08337d231d27                        	BQkDAAAAAwlVCP3uAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/e4AAAAJX191\ncGRhdGVk\n	1426656253
session:26e72094ffad922615875ff49b7278b5e5c7fa73                        	BQkDAAAAAwlVCP3uAAAACV9fdXBkYXRlZAlVCP3uAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656254
session:357493a723cc13da5ed1dec5c3b341c9e0681caa                        	BQkDAAAAAwlVCP3wAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/fAAAAAJX191\ncGRhdGVk\n	1426656256
session:b5b1127527aba3a2eb39a180cf2af969a416cd85                        	BQkDAAAAAwlVCP3xAAAACV9fY3JlYXRlZAlVCP3yAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656257
session:8cafedc34d1d1cd45ca606fbcf2e29c62cf8fad3                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/fIAAAAJX191cGRhdGVkCVUI/fIAAAAJX19j\ncmVhdGVk\n	1426656258
session:4e9e4501306d857c52e9dbd4f6d5297545293bf6                        	BQkDAAAAAwlVCP3zAAAACV9fY3JlYXRlZAlVCP3zAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656259
session:b849d65462594fb84c2665a61c95dd1efbc6c930                        	BQkDAAAAAwlVCP30AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/fQAAAAJX191\ncGRhdGVk\n	1426656260
session:a1befd39b8e57555942380919216da658aa3eb32                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/fcAAAAJX191cGRhdGVkCVUI/fcAAAAJX19j\ncmVhdGVk\n	1426656262
session:2e29acb47ddefd027282f9a4271474f6eb18a25e                        	BQkDAAAAAwlVCP35AAAACV9fdXBkYXRlZAlVCP34AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656264
session:8be2bfbbc35394e4022065a4d852b241b3a2fcd9                        	BQkDAAAAAwlVCP36AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/foAAAAJX19j\ncmVhdGVk\n	1426656266
session:0179f840a69dbbf51a68bf5076ba62808d38cbc7                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/fwAAAAJX191cGRhdGVkCVUI/fwAAAAJX19j\ncmVhdGVk\n	1426656267
session:0ac47c08d498c8f8e0481e21d599173b03895160                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/fwAAAAJX19jcmVhdGVkCVUI/f0AAAAJX191\ncGRhdGVk\n	1426656268
session:2b87e24566e16b1685caced3e85bd1ef6fdd89ae                        	BQkDAAAAAwlVCP3+AAAACV9fdXBkYXRlZAlVCP3+AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656269
session:3daee0712ff4bbb12aeb964c731ff722be162978                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/f8AAAAJX191cGRhdGVkCVUI/f8AAAAJX19j\ncmVhdGVk\n	1426656271
session:d9f4bec77844c3bee35deb441288d3d4cd175408                        	BQkDAAAAAwlVCP4AAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/gAAAAAJX191\ncGRhdGVk\n	1426656272
session:df9b683b88139ef4f8d38d3c5b7f7e5d10b25cb8                        	BQkDAAAAAwlVCP4CAAAACV9fdXBkYXRlZAlVCP4CAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656273
session:b55a6758b3ad6b2ca5a4cc72fa2de250e37fac57                        	BQkDAAAAAwlVCP4CAAAACV9fY3JlYXRlZAlVCP4DAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426656274
session:e6cb40eaafd59181007cb9e910d25bf989e5045b                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/gQAAAAJX19jcmVhdGVkCVUI/gQAAAAJX191\ncGRhdGVk\n	1426656275
session:288c5c513f2e0cba47b5ea74e85554ea0e3a9ca3                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/gQAAAAJX191cGRhdGVkCVUI/gQAAAAJX19j\ncmVhdGVk\n	1426656276
session:7eeb689d8971023b3d18c1cdd1dd55c0cb8f584d                        	BQkDAAAAAwlVCP4FAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/gUAAAAJX19j\ncmVhdGVk\n	1426656277
session:688fc87ae30f6dd5fc9bb726efdb474d9e7a4842                        	BQkDAAAAAwlVCP4FAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/gUAAAAJX19j\ncmVhdGVk\n	1426656277
session:8db0b3cdb0c579d876327bed756ef8984b263966                        	BQkDAAAAAwlVCP4GAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/gYAAAAJX19j\ncmVhdGVk\n	1426656278
session:e88a647134738ca0a2af068182d44a4bde4f0cbc                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/gYAAAAJX19jcmVhdGVkCVUI/gYAAAAJX191\ncGRhdGVk\n	1426656278
session:c1dcb0b2e6edb94dbad0196d14751f20eccd1615                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/gYAAAAJX19jcmVhdGVkCVUI/gYAAAAJX191\ncGRhdGVk\n	1426656278
session:6e9f850809e8c702fe12d1c5e31223030fe23625                        	BQkDAAAAAwlVCP4HAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUI/gYAAAAJX19j\ncmVhdGVk\n	1426656278
session:384de22dad97bc2b0bf0db5ef4f06f318a646356                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJCgYAAAAJX19jcmVhdGVkCVUJCgYAAAAJX191\ncGRhdGVk\n	1426659350
session:16640aca2ca6b6e8ef58d7316de8b9c141a51083                        	BQkDAAAAAwlVCQoHAAAACV9fY3JlYXRlZAlVCQoHAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426659351
session:0243ad701537c67e0c19a2e76d4783b589232565                        	BQkDAAAAAwlVCU8IAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTwgAAAAJX191\ncGRhdGVk\n	1426677016
session:efff1a2c12e0107446fd03a08f9d006ea91269e3                        	BQkDAAAAAwlVCU8IAAAACV9fdXBkYXRlZAlVCU8IAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426677016
session:ec1c17b1e13d2c880490388e91794a15cffde33d                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTw4AAAAJX191cGRhdGVkCVUJTw4AAAAJX19j\ncmVhdGVk\n	1426677021
session:c928361307a2effb0b6cc8d769a727fdfaedad37                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTxkAAAAJX19jcmVhdGVkCVUJTxsAAAAJX191\ncGRhdGVk\n	1426677030
session:33caeecb1432dc6c7bb321e274c968845cb0de9d                        	BQkDAAAAAwlVCU8eAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTx0AAAAJX19j\ncmVhdGVk\n	1426677032
session:1084073f45f9975f663b154dc5dbf258bdaa178c                        	BQkDAAAAAwlVCU8oAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTycAAAAJX19j\ncmVhdGVk\n	1426677043
session:e686d371f450cd7f7ed42518f3c641eaf5aac13a                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTycAAAAJX19jcmVhdGVkCVUJTygAAAAJX191\ncGRhdGVk\n	1426677042
session:d6304272fc17b28b008128781138d627302065f1                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTywAAAAJX19jcmVhdGVkCVUJTy0AAAAJX191\ncGRhdGVk\n	1426677051
session:e198cb41c3b04f1b7d8ef2aa3cfe7183188a72e6                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTy0AAAAJX19jcmVhdGVkCVUJTy4AAAAJX191\ncGRhdGVk\n	1426677052
session:dc264783a4360e5f5b752a43f5d777d37682b0d9                        	BQkDAAAAAwlVCU8wAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTy8AAAAJX19j\ncmVhdGVk\n	1426677054
session:abe110e533b1f72cd738ccf6500bfaf0d590c030                        	BQkDAAAAAwlVCU8wAAAACV9fdXBkYXRlZAlVCU8vAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426677054
session:95cd950db40b0417dc4138d9bf8bdace643d2adb                        	BQkDAAAAAwlVCU80AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzUAAAAJX191\ncGRhdGVk\n	1426677059
session:489884318a11808f2b2dba5f0b072ac5935f1856                        	BQkDAAAAAwlVCU81AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzQAAAAJX19j\ncmVhdGVk\n	1426677059
session:cc76aa72d2c5ec23a59b8f1c9d62ec71807187fc                        	BQkDAAAAAwlVCU83AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzYAAAAJX19j\ncmVhdGVk\n	1426677061
session:33ce131eab738fe1dc4230bb9fe8cfe6b262f3e3                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzcAAAAJX191cGRhdGVkCVUJTzcAAAAJX19j\ncmVhdGVk\n	1426677062
session:bd918469262fdd44e6a798285450ea4d6d43057b                        	BQkDAAAAAwlVCU83AAAACV9fY3JlYXRlZAlVCU84AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426677062
session:14b5293d312616a2b13a4f53f0f74c541caa7166                        	BQkDAAAAAwlVCU84AAAACV9fdXBkYXRlZAlVCU84AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426677063
session:8bb75fd5b74a78495bd3f862904db14855e6ea6f                        	BQkDAAAAAwlVCU84AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzkAAAAJX191\ncGRhdGVk\n	1426677064
session:ac27df89c4e806939ce52fe5a8f423deae04207b                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzkAAAAJX19jcmVhdGVkCVUJTzkAAAAJX191\ncGRhdGVk\n	1426677064
session:65edd8caa94b61c4d5dbcc5cc584319552eba919                        	BQkDAAAAAwlVCU85AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzkAAAAJX191\ncGRhdGVk\n	1426677064
session:c5ddaf9ba7774632d706180a1ded4df84bddcf7c                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzkAAAAJX191cGRhdGVkCVUJTzkAAAAJX19j\ncmVhdGVk\n	1426677064
session:aef73cdd369abd8db488acc0e7863e81a0f1d733                        	BQkDAAAAAwlVCU86AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzoAAAAJX191\ncGRhdGVk\n	1426677065
session:3bafcc9de4cf5c12ecb164e7425c52f4b60afe79                        	BQkDAAAAAwlVCU87AAAACV9fdXBkYXRlZAlVCU87AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426677066
session:6506819972e9091a199486143bdf16f7f1891f60                        	BQkDAAAAAwlVCU87AAAACV9fdXBkYXRlZAlVCU86AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426677066
session:8dafe41a956b6a6e759ef51d5c7e4ee7b35339ab                        	BQkDAAAAAwlVCU87AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzsAAAAJX19j\ncmVhdGVk\n	1426677066
session:5f94037904289e318183d7666888291b711b0a33                        	BQkDAAAAAwlVCU87AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTzwAAAAJX191\ncGRhdGVk\n	1426677067
session:3227bbf83d8ed99e0392808c24dd568852c42da2                        	BQkDAAAAAwlVCU89AAAACV9fY3JlYXRlZAlVCU8+AAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426677068
session:cccac4b34edf5d9a00932e9b2017715ce01e57d1                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJTz8AAAAJX19jcmVhdGVkCVUJTz8AAAAJX191\ncGRhdGVk\n	1426677070
session:7febf7d0b183fc8b37fa249197544286fad1818c                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJT0AAAAAJX191cGRhdGVkCVUJT0AAAAAJX19j\ncmVhdGVk\n	1426677070
session:dd64230b647a15f0b3a1601ca0080e8f49224fb0                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJT0AAAAAJX191cGRhdGVkCVUJT0AAAAAJX19j\ncmVhdGVk\n	1426677071
session:7b3030b96610b10ad7a147a4cdfb582099054586                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJT0AAAAAJX19jcmVhdGVkCVUJT0AAAAAJX191\ncGRhdGVk\n	1426677071
session:4cc35a327acbda755b6791916ba8c1c2dceb8d4a                        	BQkDAAAAAwlVCU9AAAAACV9fdXBkYXRlZAlVCU9AAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426677071
session:1c8b7bd6f5aeef4597a7434e0ba6bdef0eaa7c5d                        	BQkDAAAAAwlVCU9AAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJT0AAAAAJX191\ncGRhdGVk\n	1426677071
session:22383794d9c515492f20d87811ece431e564d6ff                        	BQkDAAAAAwlVCU9AAAAACV9fdXBkYXRlZAlVCU9AAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426677071
session:0f0790a5e5d1ece0ddb1dbf28726914766cbfd01                        	BQkDAAAAAwlVCU9AAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJT0AAAAAJX191\ncGRhdGVk\n	1426677072
session:6c8bf120582c196f72401f328364d3e34edf993f                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJT0AAAAAJX191cGRhdGVkCVUJT0AAAAAJX19j\ncmVhdGVk\n	1426677071
session:93e517768f2c1db50ebc8a37b5a8245e11158268                        	BQkDAAAAAwlVCU9AAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJT0AAAAAJX19j\ncmVhdGVk\n	1426677070
session:8692c92a329511cc8a5a013da18b8350a02fa95f                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJT0AAAAAJX19jcmVhdGVkCVUJT0AAAAAJX191\ncGRhdGVk\n	1426677072
session:60af8b062d111c6e270b64bddd73e7ad7eec2805                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJT0AAAAAJX191cGRhdGVkCVUJT0AAAAAJX19j\ncmVhdGVk\n	1426677072
session:a4f82ec016fe2c7fab855c9c4e73f6f78216d610                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJT0AAAAAJX19jcmVhdGVkCVUJT0AAAAAJX191\ncGRhdGVk\n	1426677071
session:9aa55e03c5d8e2fcdde0a8c5f03778ef4b269c98                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUJc8gAAAAJX191cGRhdGVkCVUJc8gAAAAJX19j\ncmVhdGVk\n	1426686424
session:27b8055a278d40dc460b601bbf14145ec2b9e78f                        	BQkDAAAAAwlVCXPJAAAACV9fdXBkYXRlZAlVCXPJAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426686425
session:78253a55f9d515773163ac0fb1a42afe8c6f1260                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKOy4AAAAJX191cGRhdGVkCVUKOy0AAAAJX19j\ncmVhdGVk\n	1426737469
session:4e9dcc3437270a904e075de6a08cff7c663b0f28                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKjWAAAAAJX191cGRhdGVkCVUKjWAAAAAJX19j\ncmVhdGVk\n	1426758512
session:f496c4cff935d153f242350820342e572aecec26                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeewoemAuOasowAAAARuYW1l\nCgJ5aQAAAAhwYXNzd29yZAoJQjAzMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoEY2FsbAAAAAVnZW5y\nZQlVCkUlAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKRU4AAAAJX191cGRhdGVk\nCgMxSjAAAAAGbGVhZ3VlCglCMDMyMDAwNTYAAAAJcGxheWVyX2lk\n	1426741432
session:af349300f4659cc58c5c29de34c609ab3b3906c2                        	BQkDAAAAAwlVCk4BAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKTgEAAAAJX19j\ncmVhdGVk\n	1426742289
session:fa9a3ce6a8315f9d637841eb7b3204e2b835939c                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoGb2xpdmVyAAAACGV4ZXJjaXNlCglCMDMyMDAwOTQAAAAJ\ncGxheWVyX2lkCgRjYWxsAAAABWdlbnJlCVUKSDIAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9f\ndXNlcl9yZWFsbQQDAAAAAwoJ6YKx562x5bS0AAAABG5hbWUKBHhpYW8AAAAIcGFzc3dvcmQKCUIw\nMzIwMDA5NAAAAAJpZAAAAAZfX3VzZXIJVQpG6gAAAAlfX2NyZWF0ZWQ=\n	1426744087
session:d50dad5ee601d39c37e65a56844843b38a49ff81                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKTq4AAAAJX191cGRhdGVkCVUKTq4AAAAJX19j\ncmVhdGVk\n	1426742462
session:6f07cd5990dc3544af8a706c1916d4cee2c9202b                        	BQkDAAAAAwlVCk6vAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKTq8AAAAJX191\ncGRhdGVk\n	1426742463
session:cb0e20f468de10ceb510a48c32832eb31c9a02da                        	BQkDAAAACAlVCk4CAAAACV9fY3JlYXRlZAlVClG9AAAACV9fdXBkYXRlZAQDAAAAAwoJ6JGJ5aaC\n55SEAAAABG5hbWUKCUIwMzIwMDA0MgAAAAJpZAoCcnUAAAAIcGFzc3dvcmQAAAAGX191c2VyCgRj\nYWxsAAAABWdlbnJlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoJQjAzMjAwMDQyAAAACXBsYXll\ncl9pZAoDMUowAAAABmxlYWd1ZQoGb2xpdmVyAAAACGV4ZXJjaXNl\n	1426743342
session:6e9d818f7a9cb3724baa796982094c5b5f7294ba                        	BQkDAAAAAwlVCo1dAAAACV9fdXBkYXRlZAlVCo1dAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426758509
session:53b71a5ca3b30b3d4eacfe7c1a83e3acc35623eb                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKjWEAAAAJX19jcmVhdGVkCVUKjWEAAAAJX191\ncGRhdGVk\n	1426758513
session:924824ab605bd2f909744b6ed112dd1598af00b0                        	BQkDAAAAAwlVCo1fAAAACV9fdXBkYXRlZAlVCo1fAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1426758511
session:0bd31883aaacff52aa5ec1cb261b8ebb0bab81da                        	BQkDAAAAAwlVCo1iAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKjWIAAAAJX191\ncGRhdGVk\n	1426758514
session:570c58f8a70f5b05d5e4ea9fdc38da0adb21453e                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKjWMAAAAJX191cGRhdGVkCVUKjWMAAAAJX19j\ncmVhdGVk\n	1426758515
session:d70ff6343a50dc1784255daf5b43d7ff57d20b48                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKjWUAAAAJX19jcmVhdGVkCVUKjWYAAAAJX191\ncGRhdGVk\n	1426758517
session:fb63f661aa8937f335b5c75daffbe739a64ba208                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUKjWYAAAAJX19jcmVhdGVkCVUKjWYAAAAJX191\ncGRhdGVk\n	1426758518
session:d09c2c5f932039f8a1ad2759298b1a5b163b477d                        	BQkDAAAAAwlVMJ3rAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVMJ3rAAAACV9fdXBk\nYXRlZA==\n	1429253115
session:d8d024ccea50f3920a1d89358012c86e0c92aaa3                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKBG1lbmcAAAAIcGFzc3dvcmQK\nCeWQs+Wtn+WogQAAAARuYW1lCglCMDMyMDAwODIAAAACaWQAAAAGX191c2VyCgRjYWxsAAAABWdl\nbnJlCVULxocAAAAJX19jcmVhdGVkCVULxq8AAAAJX191cGRhdGVkCglCMDMyMDAwODIAAAAJcGxh\neWVyX2lkCgMxSjAAAAAGbGVhZ3VlCgZvbGl2ZXIAAAAIZXhlcmNpc2U=\n	1426838924
session:5019775a95dd8f35ca0394790e9e0afe8092496c                        	BQkDAAAABQQDAAAAAwoGMTkzMDAxAAAAAmlkCgZEckJlYW4AAAAEbmFtZQoCb2sAAAAIcGFzc3dv\ncmQAAAAGX191c2VyCgYxOTMwMDEAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFs\nbQlVMJ37AAAACV9fdXBkYXRlZAlVMJ37AAAACV9fY3JlYXRlZA==\n	1429253131
session:d2236bebe0a747060c4e3cb11abf65c2cec8e3a8                        	BQkDAAAABQlVFB8WAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDUwAAAAAmlkCgnlh77lvpfo\nj68AAAAEbmFtZQoCZGUAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQlVFB8WAAAACV9fY3JlYXRlZAoJQjAzMjAwMDUwAAAACXBsYXllcl9pZA==\n	1427385697
session:e7448abb342ceb33b37d316266142fa487fcf6ac                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUU2v8AAAAJX19jcmVhdGVkCVUU2v8AAAAJX191\ncGRhdGVk\n	1427433743
session:0bf575ac6ad09e71f81dd87a9b560c965386be15                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUWUfwAAAAJX19jcmVhdGVkCVUWUfwAAAAJX191\ncGRhdGVk\n	1427529740
session:7bb415e81bbc3dfbfd6ffd11ad1634aaf33b4e0d                        	BQkDAAAABwoGb2xpdmVyAAAACGV4ZXJjaXNlCVULzpcAAAAJX191cGRhdGVkCgMxSjAAAAAGbGVh\nZ3VlBAMAAAADCgYxOTMwMDEAAAACaWQKAm9rAAAACHBhc3N3b3JkCgZEckJlYW4AAAAEbmFtZQAA\nAAZfX3VzZXIJVQvOgAAAAAlfX2NyZWF0ZWQKBjE5MzAwMQAAAAlwbGF5ZXJfaWQKB2RlZmF1bHQA\nAAAMX191c2VyX3JlYWxt\n	1426840812
session:aa3c3fe13d3cd935732445d6c569f7580d4ff3b0                        	BQkDAAAACAoJQjAzMjAwMDQwAAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0K\nAzFKMAAAAAZsZWFndWUKBGNhbGwAAAAFZ2VucmUKBm9saXZlcgAAAAhleGVyY2lzZQQDAAAAAwoJ\nQjAzMjAwMDQwAAAAAmlkCgnlvpDlrqXmppsAAAAEbmFtZQoDeW91AAAACHBhc3N3b3JkAAAABl9f\ndXNlcglVC9OhAAAACV9fY3JlYXRlZAlVC9PWAAAACV9fdXBkYXRlZA==\n	1426842365
session:8ba581019cf0f0a5f447c75ff79e4d8f8cc2b5a3                        	BQkDAAAAAwlVF+pwAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUX6nAAAAAJX191\ncGRhdGVk\n	1427634303
session:9c66983943f0ad9ffbb9d64e46e95170d53b8e35                        	BQkDAAAAAwlVDmSRAAAACV9fY3JlYXRlZAoGQUZCMUowAAAACGV4ZXJjaXNlCVUOZJEAAAAJX191\ncGRhdGVk\n	1427010239
session:c7f61b7b67c22b2242ecfaa12615acdf133aeab5                        	BQkDAAAAAwoGb2xpdmVyAAAACGV4ZXJjaXNlCVUOZmUAAAAJX19jcmVhdGVkCVUOZmUAAAAJX191\ncGRhdGVk\n	1427010677
session:f34d941dbd15a94b008e0c66e321c195149506ab                        	BQkDAAAAAwlVDmamAAAACV9fdXBkYXRlZAlVDmamAAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1427010742
session:b0186948511ea2c4b6ea69c5223f8a178de857cb                        	BQkDAAAAAwlVEQ1xAAAACV9fY3JlYXRlZAlVEQ1xAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1427184512
session:dc305a75fb5cb20b8b75b7c88b24c20802692406                        	BQkDAAAAAwlVHUY0AAAACV9fdXBkYXRlZAlVHUY0AAAACV9fY3JlYXRlZAoGb2xpdmVyAAAACGV4\nZXJjaXNl\n	1427985475
session:71a83617cef45f40729cec17f84f5842b3e6ff32                        	BQkDAAAAAwlVErXeAAAACV9fdXBkYXRlZAoGb2xpdmVyAAAACGV4ZXJjaXNlCVUStd4AAAAJX19j\ncmVhdGVk\n	1427293165
session:4794d7954f9dc68b58a7a186fdb80248e6498157                        	BQkDAAAAAglVMJ4IAAAACV9fY3JlYXRlZAlVMJ4IAAAACV9fdXBkYXRlZA==\n	1429253144
session:03137a1ad7593064f4e2955c65183db05c16d6e4                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVMJ5GAAAACV9fdXBkYXRlZAlVMJ5GAAAACV9fY3Jl\nYXRlZA==\n	1429253206
session:bc4a72e3975ba31652d1970d5ef5847d49ea510a                        	BQkDAAAABQoGMTkzMDAxAAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTCe\nXwAAAAlfX3VwZGF0ZWQEAwAAAAMKBjE5MzAwMQAAAAJpZAoGRHJCZWFuAAAABG5hbWUKAm9rAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcglVMJ5fAAAACV9fY3JlYXRlZA==\n	1429253231
session:bd6d2bf19c28e7a3bae70a1db8e8f078289c4654                        	BQkDAAAABwoGMTkzMDAxAAAACXBsYXllcl9pZAQDAAAAAwoGMTkzMDAxAAAAAmlkCgZEckJlYW4A\nAAAEbmFtZQoCb2sAAAAIcGFzc3dvcmQAAAAGX191c2VyCVUwZHcAAAAJX191cGRhdGVkCVUwZFIA\nAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoDMUowAAAABmxlYWd1ZQoEc2lh\ncgAAAAhleGVyY2lzZQ==\n	1429243321
session:2386e34857c4436e19a706696461850f10bd10b2                        	BQkDAAAAAglVMJ5mAAAACV9fdXBkYXRlZAlVMJ5mAAAACV9fY3JlYXRlZA==\n	1429253238
session:8f8b3c7748ac3cc367f8744ade2492ad0dcd5fd4                        	BQkDAAAABQlVMKqvAAAACV9fY3JlYXRlZAlVMKqvAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAAAAMKBjE5MzAwMQAAAAJpZAoGRHJC\nZWFuAAAABG5hbWUKAm9rAAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429256383
session:64404dd9a65365aae60ad7e8893c54593864dced                        	BQkDAAAABwoGMTkzMDAxAAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTCq\nTwAAAAlfX3VwZGF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgYxOTMwMDEAAAACaWQKBkRyQmVh\nbgAAAARuYW1lAAAABl9fdXNlcgoEc2lhcgAAAAhleGVyY2lzZQoDMUowAAAABmxlYWd1ZQlVMKeh\nAAAACV9fY3JlYXRlZA==\n	1429256323
session:9fff10bf82b2e5f33a1fb40a757061e6bc6fb4af                        	BQkDAAAAAglVMKq2AAAACV9fY3JlYXRlZAlVMKq2AAAACV9fdXBkYXRlZA==\n	1429256390
session:067a4dcd5c2e5509e2e7680191c9bdceb46538a3                        	BQkDAAAAAwlVMKqLAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVMKqLAAAACV9fY3Jl\nYXRlZA==\n	1429256347
session:6972788bacdf1298fba13e93610fc3038ae38c6d                        	BQkDAAAABQlVMKqYAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAw\nMQAAAAlwbGF5ZXJfaWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZEckJlYW4AAAAEbmFtZQoGMTkz\nMDAxAAAAAmlkAAAABl9fdXNlcglVMKqYAAAACV9fY3JlYXRlZA==\n	1429256360
session:5a48647b696b1cb0e219e5344d740579367039a0                        	BQkDAAAAAglVMKqgAAAACV9fdXBkYXRlZAlVMKqgAAAACV9fY3JlYXRlZA==\n	1429256368
session:c9cbe3c4feed55977dfcb961c0a1b65c6d149b88                        	BQkDAAAABwlVMK5QAAAACV9fY3JlYXRlZAoDMUowAAAABmxlYWd1ZQlVMK5eAAAACV9fdXBkYXRl\nZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAAAAMKBkRy\nQmVhbgAAAARuYW1lCgYxOTMwMDEAAAACaWQKAm9rAAAACHBhc3N3b3JkAAAABl9fdXNlcgoEc2lh\ncgAAAAhleGVyY2lzZQ==\n	1429257341
session:5696aa9bed819853d4e8b7b43d334ead6573a9a3                        	BQkDAAAABwQDAAAAAwoCb2sAAAAIcGFzc3dvcmQKBjE5MzAwMQAAAAJpZAoGRHJCZWFuAAAABG5h\nbWUAAAAGX191c2VyCVU08l8AAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoM\nY29va2luZy10ZXN0AAAACGV4ZXJjaXNlCgYxOTMwMDEAAAAJcGxheWVyX2lkCgdGTEEwMDI2AAAA\nBmxlYWd1ZQlVNPJMAAAACV9fY3JlYXRlZA==\n	1429537445
session:dc354214a5812d44f989df8c066f44c797e0f260                        	BQkDAAAABwlVNc+TAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAw\nMQAAAAlwbGF5ZXJfaWQJVTXPbwAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoDMUowAAAABmxlYWd1ZQoEc2lh\ncgAAAAhleGVyY2lzZQ==\n	1429593546
session:b1d527c2a081995da224ab442df30a560a261f47                        	BQkDAAAABQlVOdK0AAAACV9fY3JlYXRlZAoJQjAzMjAwMDgyAAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeWQs+Wtn+WogQAAAARuYW1lCglCMDMyMDAwODIAAAAC\naWQKBG1lbmcAAAAIcGFzc3dvcmQAAAAGX191c2VyCVU50rQAAAAJX191cGRhdGVk\n	1429856452
session:cae1346aca0096b3ce6e458e8057d60f03f6657d                        	BQkDAAAACAlVOdSxAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKCeiRieabuOaZtAAAAARuYW1lCglCMDMyMDAwMzEAAAACaWQKA3No\ndQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVTnSkQAAAAlfX2NyZWF0ZWQKAzFKMAAAAAZsZWFndWUK\nBGNhbGwAAAAFZ2VucmUKCUIwMzIwMDAzMQAAAAlwbGF5ZXJfaWQ=\n	1429860618
session:2b4b04067a984cedbffa41189022539e6d8a64c3                        	BQkDAAAABwoGMTkzMDAxAAAACXBsYXllcl9pZAlVNeKAAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhl\neGVyY2lzZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoDMUowAAAABmxlYWd1ZQlVNeK6\nAAAACV9fdXBkYXRlZA==\n	1429598535
session:46b1707f81f55923f1b07d327ec9b4956a21ce72                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdH1AAAACV9fdXBkYXRlZAlVOdH1AAAACV9fY3Jl\nYXRlZA==\n	1429856261
session:3b209d4f304998d934804ae80d0f18309dfb5114                        	BQkDAAAABQQDAAAAAwoCcWkAAAAIcGFzc3dvcmQKCeeUsOa3h+WckgAAAARuYW1lCglCMDMyMDAw\nNDYAAAACaWQAAAAGX191c2VyCVU50ggAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAlVOdIIAAAACV9fY3JlYXRlZA==\n	1429856280
session:506be1e7ef15f794701275f84f16857247689fe4                        	BQkDAAAABwoDMUowAAAABmxlYWd1ZQlVOaMkAAAACV9fdXBkYXRlZAoGMTkzMDAxAAAACXBsYXll\ncl9pZAlVOaL4AAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKBjE5\nMzAwMQAAAAJpZAoGRHJCZWFuAAAABG5hbWUKAm9rAAAACHBhc3N3b3JkAAAABl9fdXNlcgoEc2lh\ncgAAAAhleGVyY2lzZQ==\n	1429844425
session:3e82d60b024c921b471c913d15f9cf7ea856f7c3                        	BQkDAAAABwoDMUowAAAABmxlYWd1ZQQDAAAAAwoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJp\nZAoCb2sAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEc2lh\ncgAAAAhleGVyY2lzZQlVNdFiAAAACV9fY3JlYXRlZAlVNdFuAAAACV9fdXBkYXRlZAoGMTkzMDAx\nAAAACXBsYXllcl9pZA==\n	1429594558
session:d287af1a4b1c0b199f1f64d6f7f377fb1f73cfe0                        	BQkDAAAABQlVOdIdAAAACV9fY3JlYXRlZAoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeeUsOa3h+WckgAAAARuYW1lCglCMDMyMDAwNDYAAAAC\naWQKAnFpAAAACHBhc3N3b3JkAAAABl9fdXNlcglVOdIdAAAACV9fdXBkYXRlZA==\n	1429856301
session:3461be2a3c53f9ac0ce64cabc2ca5d63faf4f263                        	BQkDAAAABwoDMUowAAAABmxlYWd1ZQlVNvxtAAAACV9fdXBkYXRlZAoGMTkzMDAxAAAACXBsYXll\ncl9pZAQDAAAAAwoCb2sAAAAIcGFzc3dvcmQKBkRyQmVhbgAAAARuYW1lCgYxOTMwMDEAAAACaWQA\nAAAGX191c2VyCgRzaWFyAAAACGV4ZXJjaXNlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVNvxW\nAAAACV9fY3JlYXRlZA==\n	1429671054
session:28619cd0722ee8a03fb9423b68702f291aebd891                        	BQkDAAAABQlVOdI6AAAACV9fdXBkYXRlZAQDAAAAAwoCcWkAAAAIcGFzc3dvcmQKCUIwMzIwMDA0\nNgAAAAJpZAoJ55Sw5reH5ZySAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQlVOdI6AAAACV9fY3JlYXRlZAoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZA==\n	1429856330
session:fd45fe973e0053a6ab2d301ea48fc27a8ada7ee2                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdJOAAAACV9fdXBkYXRlZAlVOdJOAAAACV9fY3Jl\nYXRlZA==\n	1429856350
session:62b5586b52a8a70a00acf2760688aea9326152d3                        	BQkDAAAABQlVOdJcAAAACV9fdXBkYXRlZAQDAAAAAwoEbWVuZwAAAAhwYXNzd29yZAoJ5ZCz5a2f\n5aiBAAAABG5hbWUKCUIwMzIwMDA4MgAAAAJpZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2Vy\nX3JlYWxtCglCMDMyMDAwODIAAAAJcGxheWVyX2lkCVU50lwAAAAJX19jcmVhdGVk\n	1429856364
session:3aa6d351277d4d4ab0cc2c995a80870f8c9be6bd                        	BQkDAAAABwlVOcP4AAAACV9fY3JlYXRlZAoGMTkzMDAxAAAACXBsYXllcl9pZAoHZGVmYXVsdAAA\nAAxfX3VzZXJfcmVhbG0KBHNpYXIAAAAIZXhlcmNpc2UEAwAAAAMKBkRyQmVhbgAAAARuYW1lCgYx\nOTMwMDEAAAACaWQKAm9rAAAACHBhc3N3b3JkAAAABl9fdXNlcgoDMUowAAAABmxlYWd1ZQlVOc2s\nAAAACV9fdXBkYXRlZA==\n	1429855190
session:8dbbe8b48450788c1c142dbadcdd581856cabc9a                        	BQkDAAAABQQDAAAAAwoCcWkAAAAIcGFzc3dvcmQKCeeUsOa3h+WckgAAAARuYW1lCglCMDMyMDAw\nNDYAAAACaWQAAAAGX191c2VyCVU50mcAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQlVOdJnAAAACV9fY3JlYXRlZAoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZA==\n	1429856375
session:ce644eda9a76b4aa74cd9fe576efbacf9fab8f22                        	BQkDAAAABQoJQjAzMjAwMDgyAAAACXBsYXllcl9pZAlVOdKDAAAACV9fY3JlYXRlZAlVOdKDAAAA\nCV9fdXBkYXRlZAQDAAAAAwoEbWVuZwAAAAhwYXNzd29yZAoJ5ZCz5a2f5aiBAAAABG5hbWUKCUIw\nMzIwMDA4MgAAAAJpZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429856403
session:b82750a37f3f39879962a2197ee250b0543ec428                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKBG1lbmcAAAAIcGFzc3dvcmQK\nCeWQs+Wtn+WogQAAAARuYW1lCglCMDMyMDAwODIAAAACaWQAAAAGX191c2VyCVU50tEAAAAJX191\ncGRhdGVkCVU50tEAAAAJX19jcmVhdGVkCglCMDMyMDAwODIAAAAJcGxheWVyX2lk\n	1429856481
session:8b1fb01430c60515401eaf38e8d9159d47536ff6                        	BQkDAAAAAwlVOdLGAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdLGAAAACV9fY3Jl\nYXRlZA==\n	1429856470
session:4ba86aaf60a026bca090b3d7c81fefecae68a416                        	BQkDAAAABQoJQjAzMjAwMDgyAAAACXBsYXllcl9pZAlVOdKmAAAACV9fY3JlYXRlZAlVOdKmAAAA\nCV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDgyAAAAAmlkCgnlkLPlrZ/lqIEAAAAEbmFtZQoEbWVu\nZwAAAAhwYXNzd29yZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429856438
session:6e912fb70e66daf35792e5c2ca2fae603330ba47                        	BQkDAAAABQlVOdLUAAAACV9fY3JlYXRlZAoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAQDAAAAAwoC\ncWkAAAAIcGFzc3dvcmQKCUIwMzIwMDA0NgAAAAJpZAoJ55Sw5reH5ZySAAAABG5hbWUAAAAGX191\nc2VyCVU50tQAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856484
session:85a054c51632f0d57f6e538f12cbf9ddeb05b67a                        	BQkDAAAAAwlVOdMBAAAACV9fY3JlYXRlZAlVOdMBAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429856529
session:e6113b2f4f57d0aaf3a7d2a47b59004832b2c0fe                        	BQkDAAAAAwlVOdMBAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdMBAAAACV9fdXBk\nYXRlZA==\n	1429856529
session:d5cc61e85dda2f4cf30b084345d9edef812f1241                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdMHAAAACV9fdXBkYXRlZAlVOdMHAAAACV9fY3Jl\nYXRlZA==\n	1429856535
session:368cd0fbaea1a17839ce326a0a2d9fb227808dcf                        	BQkDAAAABQlVOdMOAAAACV9fY3JlYXRlZAoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAQDAAAAAwoC\ncWkAAAAIcGFzc3dvcmQKCeeUsOa3h+WckgAAAARuYW1lCglCMDMyMDAwNDYAAAACaWQAAAAGX191\nc2VyCVU50w4AAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856542
session:b2f918a528aafaed69ab1ef7b101c23aec3b2adf                        	BQkDAAAAAwlVOdMOAAAACV9fY3JlYXRlZAlVOdMOAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429856542
session:199ebeaf5ca560a8362cbfaa192c7ab412522f81                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQlVOdfsAAAACV9fdXBkYXRlZAoJ\nQjAxMjAyMTA0AAAACXBsYXllcl9pZAlVOdNnAAAACV9fY3JlYXRlZAQDAAAAAwoJ5b2t5pmf5qGU\nAAAABG5hbWUKCUIwMTIwMjEwNAAAAAJpZAoFc2hlbmcAAAAIcGFzc3dvcmQAAAAGX191c2VyCgRz\naWFyAAAACGV4ZXJjaXNlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429861050
session:4e5d142ffbdaa1937e5fca9e94c5d8fc509fe146                        	BQkDAAAABQQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCUIwMzIwMDAxMgAAAAJpZAoJ6YKx5L6d5au7\nAAAABG5hbWUAAAAGX191c2VyCVU509gAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQoJQjAzMjAwMDEyAAAACXBsYXllcl9pZAlVOdPYAAAACV9fY3JlYXRlZA==\n	1429856744
session:c67430d3dfed83036d9dca4dcb49757159242479                        	BQkDAAAACAoEc2lhcgAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMK\nCeW8tembheWqmwAAAARuYW1lCglCMDMyMDAwMTkAAAACaWQKAnlhAAAACHBhc3N3b3JkAAAABl9f\ndXNlcglVOdNAAAAACV9fY3JlYXRlZAoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAlVOdSwAAAACV9f\ndXBkYXRlZAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQ==\n	1429861469
session:e4526c1bf90ed9357e8dc9176f06eff1a5a56a7d                        	BQkDAAAAAwlVOdMsAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdMsAAAACV9fdXBk\nYXRlZA==\n	1429856571
session:fd74567863bf38ce714bdb62d35d35609e692bc7                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnTLAAAAAlfX3VwZGF0ZWQEAwAAAAMK\nCeewoemAuOasowAAAARuYW1lCglCMDMyMDAwNTYAAAACaWQKAnlpAAAACHBhc3N3b3JkAAAABl9f\ndXNlcglVOdMsAAAACV9fY3JlYXRlZAoJQjAzMjAwMDU2AAAACXBsYXllcl9pZA==\n	1429856572
session:344df4aae91209590b804a78cfa327358bb4c777                        	BQkDAAAAAwlVOdMuAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdMuAAAACV9fY3Jl\nYXRlZA==\n	1429856574
session:04ddb66ec3bc5d495ad65e9c31208c513f2d5470                        	BQkDAAAAAwlVOdM+AAAACV9fY3JlYXRlZAlVOdM/AAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429856590
session:133b5b36f91ea346bf5bbe15ac7f5135248f72a6                        	BQkDAAAAAwlVOdNAAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdNAAAAACV9fdXBk\nYXRlZA==\n	1429856592
session:255b32f14ddcdfcd86d0bb23c005631bab780b3a                        	BQkDAAAABQlVOdNpAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDAzOQAAAAJpZAoJ5p6X5oWn5aifAAAABG5h\nbWUKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVTnTaQAAAAlfX3VwZGF0ZWQ=\n	1429856633
session:8838a8c41cfd5c1ef8cb06386e8d596cba1724a0                        	BQkDAAAAAwlVOdNBAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdNBAAAACV9fY3Jl\nYXRlZA==\n	1429856593
session:c00ac7b69e33803fe4fb6a19240b8133b1a824f0                        	BQkDAAAAAwlVOdNGAAAACV9fdXBkYXRlZAlVOdNGAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429856598
session:85e703bf42163302e78f550d944292a12696183b                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUQwAAAAlfX3VwZGF0ZWQKBGNhbGwA\nAAAFZ2VucmUKCUIwMzIwMDEwMgAAAAlwbGF5ZXJfaWQEAwAAAAMKAnlpAAAACHBhc3N3b3JkCgnm\nnY7mgKHlrqMAAAAEbmFtZQoJQjAzMjAwMTAyAAAAAmlkAAAABl9fdXNlcgoDMUowAAAABmxlYWd1\nZQoEc2lhcgAAAAhleGVyY2lzZQlVOdOgAAAACV9fY3JlYXRlZA==\n	1429861719
session:8f3ae4e326eddff0943a20d67f8ae53fa6665184                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDk3AAAAAmlkCgnmnpfmgJ3ovrAAAAAEbmFtZQoCc2kAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCVU501IAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQlVOdNSAAAACV9fY3JlYXRlZAoJQjAzMjAwMDk3AAAACXBsYXllcl9pZA==\n	1429856609
session:bd1da62b5e96508bfbb2b046e69eac017602390f                        	BQkDAAAAAwlVOdNSAAAACV9fY3JlYXRlZAlVOdNSAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429856610
session:8cd22bcf980a92f6605428629b3f22bb90193fcb                        	BQkDAAAAAwlVOdNSAAAACV9fY3JlYXRlZAlVOdNSAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429856610
session:a2676b27012c4cf1c6df2ab14431d1b5739209d0                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnTUwAAAAlfX3VwZGF0ZWQEAwAAAAMK\nAnlpAAAACHBhc3N3b3JkCglCMDMyMDAwNTYAAAACaWQKCeewoemAuOasowAAAARuYW1lAAAABl9f\ndXNlcgoJQjAzMjAwMDU2AAAACXBsYXllcl9pZAlVOdNTAAAACV9fY3JlYXRlZA==\n	1429856611
session:ebdfe9b570c182e255093c461e4333d2e383ad5b                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdNgAAAACV9fdXBkYXRlZAlVOdNgAAAACV9fY3Jl\nYXRlZA==\n	1429856624
session:25279a90d84ea90e0f83339318f89f44bbe5bc7c                        	BQkDAAAAAwlVOdNgAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdNgAAAACV9fY3Jl\nYXRlZA==\n	1429856624
session:f40e89188a5b8781e51387e2f0fa0bb12dc0eabf                        	BQkDAAAABQlVOdN6AAAACV9fdXBkYXRlZAQDAAAAAwoDcGluAAAACHBhc3N3b3JkCgnoqLHlk4Hn\nkKYAAAAEbmFtZQoJQjAzMjAwMDc0AAAAAmlkAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0JVTnTegAAAAlfX2NyZWF0ZWQKCUIwMzIwMDA3NAAAAAlwbGF5ZXJfaWQ=\n	1429856650
session:7fb55149cc050cf8a5b9aec728daf8385f2d52cd                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAxMgAAAAlwbGF5ZXJfaWQE\nAwAAAAMKCemCseS+neWruwAAAARuYW1lCgJ5aQAAAAhwYXNzd29yZAoJQjAzMjAwMDEyAAAAAmlk\nAAAABl9fdXNlcglVOdN7AAAACV9fdXBkYXRlZAlVOdN7AAAACV9fY3JlYXRlZA==\n	1429856651
session:fe742591553eed7490aa539cfb6cc67f2f224985                        	BQkDAAAABQlVOdOAAAAACV9fY3JlYXRlZAoJQjAzMjAwMDMyAAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKAmxpAAAACHBhc3N3b3JkCglCMDMyMDAwMzIAAAACaWQK\nCeWui+eri+WptwAAAARuYW1lAAAABl9fdXNlcglVOdOAAAAACV9fdXBkYXRlZA==\n	1429856656
session:43a0813872748570d2ce656123d1e68e0af2e4e8                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdOQAAAACV9fdXBkYXRlZAlVOdOQAAAACV9fY3Jl\nYXRlZA==\n	1429856672
session:99a3708064f319278dc3d583121571c68376eec2                        	BQkDAAAAAwlVOdOaAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdOaAAAACV9fY3Jl\nYXRlZA==\n	1429856681
session:56ac60cb6716fa8770b8e6986f948f694fdf6f13                        	BQkDAAAAAwlVOdOfAAAACV9fdXBkYXRlZAlVOdOfAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429856687
session:5bc1a0f55aed959cdb7781bd69ba173212d5bb46                        	BQkDAAAABQoJQjAzMjAwMDE4AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0J\nVTnTrQAAAAlfX2NyZWF0ZWQEAwAAAAMKCeWQs+iyneWuuAAAAARuYW1lCglCMDMyMDAwMTgAAAAC\naWQKA2JlaQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVTnTrQAAAAlfX3VwZGF0ZWQ=\n	1429856701
session:bcb304bec727745b4b8f0e6764e42f9ea59bd89c                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdPCAAAACV9fdXBkYXRlZAlVOdPCAAAACV9fY3Jl\nYXRlZA==\n	1429856722
session:631136c7690ec3752ac6b00ad5b93ddb740c01a3                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdPPAAAACV9fY3JlYXRlZAlVOdPPAAAACV9fdXBk\nYXRlZA==\n	1429856734
session:904b7f2713f1aa56810dcdf536cd8e289774d58d                        	BQkDAAAABQlVOdPPAAAACV9fdXBkYXRlZAQDAAAAAwoDcGluAAAACHBhc3N3b3JkCglCMDMyMDAw\nNzQAAAACaWQKCeioseWTgeeQpgAAAARuYW1lAAAABl9fdXNlcglVOdPPAAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDc0AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856735
session:bf69e28c147887ee41aee3fdc6ee05b001705bf1                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA5NAAAAAlwbGF5ZXJfaWQJ\nVTnT0QAAAAlfX2NyZWF0ZWQJVTnT0QAAAAlfX3VwZGF0ZWQEAwAAAAMKCemCseetseW0tAAAAARu\nYW1lCglCMDMyMDAwOTQAAAACaWQKBHhpYW8AAAAIcGFzc3dvcmQAAAAGX191c2Vy\n	1429856737
session:8c85d52e8e3d150e113dc96553e73c0dfbf7dbc5                        	BQkDAAAAAwlVOdPUAAAACV9fY3JlYXRlZAlVOdPUAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429856740
session:7b84573b740d66fe275f491d3a3bdd33e7beff3b                        	BQkDAAAABQlVOdQbAAAACV9fdXBkYXRlZAQDAAAAAwoCbGkAAAAIcGFzc3dvcmQKCUIwMzIwMDAz\nMgAAAAJpZAoJ5a6L56uL5am3AAAABG5hbWUAAAAGX191c2VyCVU51BsAAAAJX19jcmVhdGVkCglC\nMDMyMDAwMzIAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856811
session:090fbf2962595fc6a63e2db156358388850640c0                        	BQkDAAAACAQDAAAAAwoDeW91AAAACHBhc3N3b3JkCgnlvpDlrqXmppsAAAAEbmFtZQoJQjAzMjAw\nMDQwAAAAAmlkAAAABl9fdXNlcglVOdSAAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQoH\nZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNhbGwAAAAFZ2VucmUKCUIwMzIwMDA0MAAAAAlwbGF5\nZXJfaWQJVTnS8gAAAAlfX2NyZWF0ZWQKAzFKMAAAAAZsZWFndWU=\n	1429861791
session:bc70aa18e21fe66c8e83e9bad4c9d6cfbe9311cc                        	BQkDAAAACAQDAAAAAwoDc2h1AAAACHBhc3N3b3JkCglCMDMyMDAwODcAAAACaWQKCealiua3keWp\ntwAAAARuYW1lAAAABl9fdXNlcgoEc2lhcgAAAAhleGVyY2lzZQlVOdRIAAAACV9fdXBkYXRlZAoH\nZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNhbGwAAAAFZ2VucmUKCUIwMzIwMDA4NwAAAAlwbGF5\nZXJfaWQKAzFKMAAAAAZsZWFndWUJVTnTkQAAAAlfX2NyZWF0ZWQ=\n	1429861849
session:76acbc15c7a9a4803a4c539b130365823f460245                        	BQkDAAAACAlVOdUfAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQQD\nAAAAAwoDd2FuAAAACHBhc3N3b3JkCglCMDMyMDAwNzEAAAACaWQKCeW8teiPgOW6rQAAAARuYW1l\nAAAABl9fdXNlcgoEc2lhcgAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnT\nUQAAAAlfX2NyZWF0ZWQKCUIwMzIwMDA3MQAAAAlwbGF5ZXJfaWQ=\n	1429861047
session:62df34d3d65fa78022edcbff40af71c49cffdfb0                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdP2AAAACV9fdXBkYXRlZAlVOdP2AAAACV9fY3Jl\nYXRlZA==\n	1429856774
session:9e248442786c9744bbcbcf6d6bcf7f51ba317951                        	BQkDAAAABQoJQjAzMjAwMDc0AAAACXBsYXllcl9pZAlVOdP6AAAACV9fY3JlYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVTnT+gAAAAlfX3VwZGF0ZWQEAwAAAAMKCUIwMzIwMDA3NAAAAAJp\nZAoJ6Kix5ZOB55CmAAAABG5hbWUKA3BpbgAAAAhwYXNzd29yZAAAAAZfX3VzZXI=\n	1429856778
session:0d165444888c6d9e4e4f80154b6e8430e92d5b02                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKBG1lbmcAAAAIcGFzc3dvcmQK\nCUIwMzIwMDA4MgAAAAJpZAoJ5ZCz5a2f5aiBAAAABG5hbWUAAAAGX191c2VyCVU51AEAAAAJX191\ncGRhdGVkCglCMDMyMDAwODIAAAAJcGxheWVyX2lkCVU51AEAAAAJX19jcmVhdGVk\n	1429856785
session:08e79e3130a9c61977960ec6b4ff43a2c89adc72                        	BQkDAAAABQlVOdQEAAAACV9fY3JlYXRlZAoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDA0NgAAAAJpZAoJ55Sw5reH5ZySAAAABG5h\nbWUKAnFpAAAACHBhc3N3b3JkAAAABl9fdXNlcglVOdQEAAAACV9fdXBkYXRlZA==\n	1429856788
session:92b0f25329a65f6dab6423ae39e6a41139fb2c04                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDAwNgAAAAJpZAoJ\n55+z6YOB5oOgAAAABG5hbWUKAnl1AAAACHBhc3N3b3JkAAAABl9fdXNlcglVOdQHAAAACV9fdXBk\nYXRlZAoJQjAzMjAwMDA2AAAACXBsYXllcl9pZAlVOdQHAAAACV9fY3JlYXRlZA==\n	1429856791
session:21e03f1b297b897bb90d46f3590734c32828a7c1                        	BQkDAAAAAwlVOdQLAAAACV9fY3JlYXRlZAlVOdQLAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429856795
session:886185fec0026a429008d4203ecada2b4cf1403b                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUJwAAAAlfX3VwZGF0ZWQJVTnUJwAA\nAAlfX2NyZWF0ZWQEAwAAAAMKCUIwMzIwMDAzOQAAAAJpZAoDaHVpAAAACHBhc3N3b3JkCgnmnpfm\nhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIKCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQ=\n	1429856823
session:e03fc701e790cb236630228d5fe4ace9c08d8835                        	BQkDAAAAAwlVOdQtAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdQtAAAACV9fY3Jl\nYXRlZA==\n	1429856829
session:0e0a5b59db9e88d1550fae59e481b67bf090f7af                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA1MgAAAAlwbGF5ZXJfaWQE\nAwAAAAMKCUIwMzIwMDA1MgAAAAJpZAoDamlhAAAACHBhc3N3b3JkCgnmnY7kvbPlrpwAAAAEbmFt\nZQAAAAZfX3VzZXIJVTnUNAAAAAlfX3VwZGF0ZWQJVTnUNAAAAAlfX2NyZWF0ZWQ=\n	1429856836
session:9a962b9810ed8d579cc37ada2723be7e2e297cb3                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA0NgAAAAlwbGF5ZXJfaWQE\nAwAAAAMKCeeUsOa3h+WckgAAAARuYW1lCgJxaQAAAAhwYXNzd29yZAoJQjAzMjAwMDQ2AAAAAmlk\nAAAABl9fdXNlcglVOdQ5AAAACV9fY3JlYXRlZAlVOdQ5AAAACV9fdXBkYXRlZA==\n	1429856841
session:1dc8c8763c6473deb03b8b0a041222c3ace17701                        	BQkDAAAABQoJQjAzMjAwMDk0AAAACXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDk0AAAAAmlkCgR4\naWFvAAAACHBhc3N3b3JkCgnpgrHnrbHltLQAAAAEbmFtZQAAAAZfX3VzZXIJVTnUQAAAAAlfX3Vw\nZGF0ZWQJVTnUQAAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429856848
session:69a7cc50f8016171ad7dc8e7aa1eab96edc7e2c5                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdRAAAAACV9fdXBkYXRlZAlVOdRAAAAACV9fY3Jl\nYXRlZA==\n	1429856848
session:78d3ffb99d98ccc880e1609e261d848d7df34556                        	BQkDAAAABQlVOdRAAAAACV9fY3JlYXRlZAlVOdRAAAAACV9fdXBkYXRlZAoJQjAzMjAwMDU0AAAA\nCXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDU0AAAAAmlkCgVjaGVuZwAAAAhwYXNzd29yZAoJ5a6L\n5om/6LuSAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856848
session:b90f1dbfae40773891bde8aa3d762ca1e35aba55                        	BQkDAAAABQlVOdRDAAAACV9fdXBkYXRlZAlVOdRDAAAACV9fY3JlYXRlZAoJQjAzMjAwMDEyAAAA\nCXBsYXllcl9pZAQDAAAAAwoJ6YKx5L6d5au7AAAABG5hbWUKAnlpAAAACHBhc3N3b3JkCglCMDMy\nMDAwMTIAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856851
session:e63c168c2aedcb480471eb0f72f9a253d5ab4aa3                        	BQkDAAAABQQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJQjAzMjAwMDk0AAAAAmlkCgnpgrHnrbHl\ntLQAAAAEbmFtZQAAAAZfX3VzZXIKCUIwMzIwMDA5NAAAAAlwbGF5ZXJfaWQJVTnURgAAAAlfX2Ny\nZWF0ZWQJVTnURgAAAAlfX3VwZGF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429856854
session:434691ae2ca20a4635d262e783192c2ef77b1aee                        	BQkDAAAABQoJQjAzMjAwMDk0AAAACXBsYXllcl9pZAQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJ\n6YKx562x5bS0AAAABG5hbWUKCUIwMzIwMDA5NAAAAAJpZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAM\nX191c2VyX3JlYWxtCVU51EsAAAAJX19jcmVhdGVkCVU51EsAAAAJX191cGRhdGVk\n	1429856859
session:df83ce4cedecc282a5a92e4af01d5c13e178047a                        	BQkDAAAABQlVOdRMAAAACV9fdXBkYXRlZAlVOdRMAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJQjAzMjAwMDYzAAAAAmlkCgnmnpfl\nv4PlubQAAAAEbmFtZQAAAAZfX3VzZXIKCUIwMzIwMDA2MwAAAAlwbGF5ZXJfaWQ=\n	1429856860
session:4a3af3101162f522d6219acd34f117ab4a07ebed                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA3NAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKCUIwMzIwMDA3NAAAAAJpZAoJ6Kix5ZOB55CmAAAABG5hbWUKA3BpbgAAAAhwYXNzd29y\nZAAAAAZfX3VzZXIJVTnUTQAAAAlfX2NyZWF0ZWQJVTnUTQAAAAlfX3VwZGF0ZWQ=\n	1429856861
session:fe646e77ca70f2d2e3b54d13fe50c904d1cdca22                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeadjuS9s+WunAAAAARuYW1l\nCgNqaWEAAAAIcGFzc3dvcmQKCUIwMzIwMDA1MgAAAAJpZAAAAAZfX3VzZXIKCUIwMzIwMDA1MgAA\nAAlwbGF5ZXJfaWQJVTnUTgAAAAlfX3VwZGF0ZWQJVTnUTQAAAAlfX2NyZWF0ZWQ=\n	1429856861
session:e39be90c9b31000fd485170e4952a67085efa336                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA1NgAAAAlwbGF5ZXJfaWQE\nAwAAAAMKCUIwMzIwMDA1NgAAAAJpZAoCeWkAAAAIcGFzc3dvcmQKCeewoemAuOasowAAAARuYW1l\nAAAABl9fdXNlcglVOdROAAAACV9fY3JlYXRlZAlVOdROAAAACV9fdXBkYXRlZA==\n	1429856862
session:8963ab90d2142d769b797c46a70bb46f3f7ecf39                        	BQkDAAAAAwlVOdROAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdROAAAACV9fdXBk\nYXRlZA==\n	1429856862
session:a17a8ec42ad6c5c3cd57383f19040cde323762e6                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDA2AAAAAmlkCgnnn7Ppg4Hmg6AAAAAEbmFtZQoCeXUAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCglCMDMyMDAwMDYAAAAJcGxheWVyX2lkCVU51FAAAAAJX19jcmVh\ndGVkCVU51FAAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856864
session:a96abba187b26ec89e87057ef19cb8792ff6fcbe                        	BQkDAAAABQlVOdRSAAAACV9fdXBkYXRlZAlVOdRSAAAACV9fY3JlYXRlZAQDAAAAAwoCbGkAAAAI\ncGFzc3dvcmQKCeWui+eri+WptwAAAARuYW1lCglCMDMyMDAwMzIAAAACaWQAAAAGX191c2VyCglC\nMDMyMDAwMzIAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856866
session:cde68b0cb1fa5b78b7b7b298a71219db34b20f9d                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdSsAAAACV9fdXBkYXRlZAlVOdSsAAAACV9fY3Jl\nYXRlZA==\n	1429856956
session:c0dbf1e680ac4532af6e62d005fcdc8f4fc1e9b3                        	BQkDAAAABQoJQjAzMjAwMDYzAAAACXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDYzAAAAAmlkCgnm\nnpflv4PlubQAAAAEbmFtZQoDeGluAAAACHBhc3N3b3JkAAAABl9fdXNlcglVOdRVAAAACV9fY3Jl\nYXRlZAlVOdRVAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856869
session:ca037757b4638d41c67c9c3e29196fc9e4dabf72                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUWQAAAAlfX3VwZGF0ZWQJVTnUWQAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDAxOAAAAAlwbGF5ZXJfaWQEAwAAAAMKA2JlaQAAAAhwYXNzd29y\nZAoJ5ZCz6LKd5a64AAAABG5hbWUKCUIwMzIwMDAxOAAAAAJpZAAAAAZfX3VzZXI=\n	1429856873
session:6dd27bac3920c4447e86e97c603ae73df4f3f58a                        	BQkDAAAABQoJQjAzMjAwMDU2AAAACXBsYXllcl9pZAQDAAAAAwoJ57Ch6YC45qyjAAAABG5hbWUK\nAnlpAAAACHBhc3N3b3JkCglCMDMyMDAwNTYAAAACaWQAAAAGX191c2VyCVU51FkAAAAJX191cGRh\ndGVkCVU51FkAAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856873
session:719fcb4b51a561693972546b216102521f1009a0                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAxMgAAAAlwbGF5ZXJfaWQE\nAwAAAAMKCUIwMzIwMDAxMgAAAAJpZAoJ6YKx5L6d5au7AAAABG5hbWUKAnlpAAAACHBhc3N3b3Jk\nAAAABl9fdXNlcglVOdRfAAAACV9fY3JlYXRlZAlVOdRfAAAACV9fdXBkYXRlZA==\n	1429856879
session:cfd77cfd64b236b22da4ff3cd47723cb503e04b5                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUYAAAAAlfX2NyZWF0ZWQJVTnUYAAA\nAAlfX3VwZGF0ZWQKCUIwMzIwMDA1MgAAAAlwbGF5ZXJfaWQEAwAAAAMKCUIwMzIwMDA1MgAAAAJp\nZAoJ5p2O5L2z5a6cAAAABG5hbWUKA2ppYQAAAAhwYXNzd29yZAAAAAZfX3VzZXI=\n	1429856880
session:75b5f129639f6814c5907257ba67bbd49a0c11b4                        	BQkDAAAABQoJQjAzMjAwMDMyAAAACXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDMyAAAAAmlkCgnl\nrovnq4vlqbcAAAAEbmFtZQoCbGkAAAAIcGFzc3dvcmQAAAAGX191c2VyCVU51GEAAAAJX19jcmVh\ndGVkCVU51GEAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856881
session:be879362c9b4f7f1d98110b8327154bd1d584a58                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKCeael+aFp+WonwAAAARuYW1lCgNodWkAAAAIcGFzc3dvcmQKCUIwMzIwMDAzOQAAAAJp\nZAAAAAZfX3VzZXIJVTnUYQAAAAlfX3VwZGF0ZWQJVTnUYQAAAAlfX2NyZWF0ZWQ=\n	1429856881
session:85e5c6343e58899351150b44699212d4a216a4ae                        	BQkDAAAABQlVOdRmAAAACV9fY3JlYXRlZAlVOdRmAAAACV9fdXBkYXRlZAoJQjAzMjAwMDEyAAAA\nCXBsYXllcl9pZAQDAAAAAwoJ6YKx5L6d5au7AAAABG5hbWUKAnlpAAAACHBhc3N3b3JkCglCMDMy\nMDAwMTIAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856886
session:51cef7490e3fa751ead93b205a718257b3a1e4f3                        	BQkDAAAABQlVOdRpAAAACV9fY3JlYXRlZAlVOdRpAAAACV9fdXBkYXRlZAoJQjAzMjAwMDYzAAAA\nCXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDYzAAAAAmlkCgnmnpflv4PlubQAAAAEbmFtZQoDeGlu\nAAAACHBhc3N3b3JkAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856889
session:3a46128e3fbe56aaa8812ea88a837284de08c3c1                        	BQkDAAAABQQDAAAAAwoJQjk5MTEwMDU1AAAAAmlkCgnorJ3lpoLmmbQAAAAEbmFtZQoCcnUAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCglCOTkxMTAwNTUAAAAJcGxheWVyX2lkCVU51G0AAAAJX19jcmVh\ndGVkCVU51G0AAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856893
session:44d1f5481a32423039193d7f3e2d77485a2799de                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUcQAAAAlfX2NyZWF0ZWQJVTnUcQAA\nAAlfX3VwZGF0ZWQKCUIwMzIwMDA2MwAAAAlwbGF5ZXJfaWQEAwAAAAMKCeael+W/g+W5tAAAAARu\nYW1lCgN4aW4AAAAIcGFzc3dvcmQKCUIwMzIwMDA2MwAAAAJpZAAAAAZfX3VzZXI=\n	1429856897
session:a260e9a394698f9deb5cab4fe0e127010fd06730                        	BQkDAAAABQlVOdRyAAAACV9fY3JlYXRlZAlVOdRyAAAACV9fdXBkYXRlZAoJQjAzMjAwMDEyAAAA\nCXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDEyAAAAAmlkCgJ5aQAAAAhwYXNzd29yZAoJ6YKx5L6d\n5au7AAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856898
session:f56080a88c7e1c3127b00226dee7ad62f2bca8f5                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKA2ppYQAAAAhwYXNzd29yZAoJ\n5p2O5L2z5a6cAAAABG5hbWUKCUIwMzIwMDA1MgAAAAJpZAAAAAZfX3VzZXIKCUIwMzIwMDA1MgAA\nAAlwbGF5ZXJfaWQJVTnUcgAAAAlfX3VwZGF0ZWQJVTnUcgAAAAlfX2NyZWF0ZWQ=\n	1429856898
session:2762666a621bb1578439e43e773cb1bfd6ad7adf                        	BQkDAAAABQoJQjAzMjAwMDYzAAAACXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDYzAAAAAmlkCgnm\nnpflv4PlubQAAAAEbmFtZQoDeGluAAAACHBhc3N3b3JkAAAABl9fdXNlcglVOdSNAAAACV9fdXBk\nYXRlZAlVOdSNAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856925
session:535d591f10948a196b54ede4b7bb79ff40d0b77a                        	BQkDAAAABQoJQjAzMjAwMDE4AAAACXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDE4AAAAAmlkCgnl\nkLPosp3lrrgAAAAEbmFtZQoDYmVpAAAACHBhc3N3b3JkAAAABl9fdXNlcglVOdSiAAAACV9fdXBk\nYXRlZAlVOdSiAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856946
session:5d870d14153163051162f48a29c26359f2b982dd                        	BQkDAAAACAlVOdZ6AAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQQD\nAAAAAwoJQjAzMjAwMDQ1AAAAAmlkCgnmlrnmopPpkZIAAAAEbmFtZQoCemkAAAAIcGFzc3dvcmQA\nAAAGX191c2VyCgRzaWFyAAAACGV4ZXJjaXNlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVOdRY\nAAAACV9fY3JlYXRlZAoJQjAzMjAwMDQ1AAAACXBsYXllcl9pZA==\n	1429858943
session:d1bcc3edcb9b7595432e9baefe94cdfb4e9919c0                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMDEyAAAACXBsYXllcl9pZAoDMUowAAAABmxl\nYWd1ZQlVOdFlAAAACV9fY3JlYXRlZAQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCUIwMzIwMDAxMgAA\nAAJpZAoJ6YKx5L6d5au7AAAABG5hbWUAAAAGX191c2VyCgRzaWFyAAAACGV4ZXJjaXNlCVU51KcA\nAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429862358
session:33899e1bc73bd1b31045472212720aa9aa97d0c8                        	BQkDAAAABQlVOdSdAAAACV9fdXBkYXRlZAlVOdSdAAAACV9fY3JlYXRlZAoJQjAzMjAwMDE4AAAA\nCXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDE4AAAAAmlkCgnlkLPosp3lrrgAAAAEbmFtZQoDYmVp\nAAAACHBhc3N3b3JkAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856941
session:46aac18e3757f976fa3487f9fdc45ac7f696b918                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA2MwAAAAlwbGF5ZXJfaWQE\nAwAAAAMKCUIwMzIwMDA2MwAAAAJpZAoJ5p6X5b+D5bm0AAAABG5hbWUKA3hpbgAAAAhwYXNzd29y\nZAAAAAZfX3VzZXIJVTnUngAAAAlfX3VwZGF0ZWQJVTnUngAAAAlfX2NyZWF0ZWQ=\n	1429856942
session:b70425bbe8bdc3a846b4f510b4728d4025f4c17e                        	BQkDAAAABQQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnmnpflv4PlubQAAAAEbmFtZQoJQjAzMjAw\nMDYzAAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDYzAAAACXBsYXllcl9pZAlVOdRaAAAACV9fY3Jl\nYXRlZAlVOdRaAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856874
session:719fd1c7ca095eba5f9b64bab745dc1f40ef0f39                        	BQkDAAAABQlVOdRbAAAACV9fY3JlYXRlZAlVOdRbAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKAnl1AAAACHBhc3N3b3JkCglCMDMyMDAwMDYAAAACaWQKCeefs+mD\ngeaDoAAAAARuYW1lAAAABl9fdXNlcgoJQjAzMjAwMDA2AAAACXBsYXllcl9pZA==\n	1429856875
session:951209504e25a50140298fa318e35440d9bcfdb7                        	BQkDAAAABQQDAAAAAwoJ5ZCz6LKd5a64AAAABG5hbWUKCUIwMzIwMDAxOAAAAAJpZAoDYmVpAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDE4AAAACXBsYXllcl9pZAlVOdReAAAACV9fdXBk\nYXRlZAlVOdReAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856878
session:bdce819b060c6ce8f776e5295f092a3409fa91af                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUXwAAAAlfX2NyZWF0ZWQJVTnUXwAA\nAAlfX3VwZGF0ZWQKCUI5OTExMDA1NQAAAAlwbGF5ZXJfaWQEAwAAAAMKCeisneWmguaZtAAAAARu\nYW1lCglCOTkxMTAwNTUAAAACaWQKAnJ1AAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429856879
session:f8842ca5fb0fcc2153c38b6af07882e95db94b30                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUYwAAAAlfX2NyZWF0ZWQJVTnUYwAA\nAAlfX3VwZGF0ZWQKCUIwMzIwMDAxOAAAAAlwbGF5ZXJfaWQEAwAAAAMKA2JlaQAAAAhwYXNzd29y\nZAoJ5ZCz6LKd5a64AAAABG5hbWUKCUIwMzIwMDAxOAAAAAJpZAAAAAZfX3VzZXI=\n	1429856883
session:c79bce1d8172e55770c4edddfda0785f2a7bbabf                        	BQkDAAAABQlVOdRlAAAACV9fdXBkYXRlZAlVOdRlAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJQjAzMjAwMDYzAAAAAmlkCgnmnpfl\nv4PlubQAAAAEbmFtZQAAAAZfX3VzZXIKCUIwMzIwMDA2MwAAAAlwbGF5ZXJfaWQ=\n	1429856885
session:7c49a663c8ce3ff667ac70d6a27a6340b0a47a69                        	BQkDAAAABQQDAAAAAwoJ6Kyd5aaC5pm0AAAABG5hbWUKCUI5OTExMDA1NQAAAAJpZAoCcnUAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCglCOTkxMTAwNTUAAAAJcGxheWVyX2lkCVU51GcAAAAJX19jcmVh\ndGVkCVU51GcAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856887
session:4f41d66bf9a397eab017188cf334a7327aeb2d18                        	BQkDAAAABQoJQjAzMjAwMDEyAAAACXBsYXllcl9pZAQDAAAAAwoJ6YKx5L6d5au7AAAABG5hbWUK\nCUIwMzIwMDAxMgAAAAJpZAoCeWkAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9f\ndXNlcl9yZWFsbQlVOdR5AAAACV9fY3JlYXRlZAlVOdR5AAAACV9fdXBkYXRlZA==\n	1429856905
session:5815111ce2c210bb723a83c14bb8ba540472b27f                        	BQkDAAAABQoJQjAzMjAwMDA2AAAACXBsYXllcl9pZAQDAAAAAwoJ55+z6YOB5oOgAAAABG5hbWUK\nCUIwMzIwMDAwNgAAAAJpZAoCeXUAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9f\ndXNlcl9yZWFsbQlVOdR9AAAACV9fdXBkYXRlZAlVOdR9AAAACV9fY3JlYXRlZA==\n	1429856909
session:fb7781288db2c5fb31e0003673fb6c6df5409955                        	BQkDAAAABQQDAAAAAwoCbHUAAAAIcGFzc3dvcmQKCUIwMzIwMDA4OQAAAAJpZAoJ5bCk5b6L5pm0\nAAAABG5hbWUAAAAGX191c2VyCglCMDMyMDAwODkAAAAJcGxheWVyX2lkCVU51IIAAAAJX19jcmVh\ndGVkCVU51IIAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856914
session:8714776deff8cf3c55b15525ceb4822ffe2d010a                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUhAAAAAlfX3VwZGF0ZWQJVTnUhAAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDAxMgAAAAlwbGF5ZXJfaWQEAwAAAAMKCemCseS+neWruwAAAARu\nYW1lCglCMDMyMDAwMTIAAAACaWQKAnlpAAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429856916
session:7f18329854618882881457117526664874353834                        	BQkDAAAABQoJQjAzMjAwMDYzAAAACXBsYXllcl9pZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCglC\nMDMyMDAwNjMAAAACaWQKCeael+W/g+W5tAAAAARuYW1lAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0JVTnUiAAAAAlfX2NyZWF0ZWQJVTnUiAAAAAlfX3VwZGF0ZWQ=\n	1429856920
session:30f267125ae6c23d74055d5ebc2a6fac7d714a46                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUkwAAAAlfX2NyZWF0ZWQJVTnUkwAA\nAAlfX3VwZGF0ZWQKCUIwMzIwMDAxMgAAAAlwbGF5ZXJfaWQEAwAAAAMKAnlpAAAACHBhc3N3b3Jk\nCglCMDMyMDAwMTIAAAACaWQKCemCseS+neWruwAAAARuYW1lAAAABl9fdXNlcg==\n	1429856931
session:dfb0bb547a53229b67ce9209adfd02fcd059bbd8                        	BQkDAAAABQoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAQDAAAAAwoJQjk5MTEwMDU1AAAAAmlkCgno\nrJ3lpoLmmbQAAAAEbmFtZQoCcnUAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9f\ndXNlcl9yZWFsbQlVOdSZAAAACV9fY3JlYXRlZAlVOdSZAAAACV9fdXBkYXRlZA==\n	1429856937
session:dc5406628dad6ad5d97d35d978000518da373128                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUnwAAAAlfX2NyZWF0ZWQJVTnUnwAA\nAAlfX3VwZGF0ZWQKCUIwMzIwMDAxMgAAAAlwbGF5ZXJfaWQEAwAAAAMKCemCseS+neWruwAAAARu\nYW1lCglCMDMyMDAwMTIAAAACaWQKAnlpAAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429856943
session:b95d24aebf6f38425ab558b6fb7bd2da1df25c74                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUoAAAAAlfX3VwZGF0ZWQJVTnUoAAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDAzMgAAAAlwbGF5ZXJfaWQEAwAAAAMKAmxpAAAACHBhc3N3b3Jk\nCgnlrovnq4vlqbcAAAAEbmFtZQoJQjAzMjAwMDMyAAAAAmlkAAAABl9fdXNlcg==\n	1429856944
session:839d2b62e295412c47e4c76099d50a8895111707                        	BQkDAAAABQlVOdSgAAAACV9fY3JlYXRlZAlVOdSgAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKAnl1AAAACHBhc3N3b3JkCglCMDMyMDAwMDYAAAACaWQKCeefs+mD\ngeaDoAAAAARuYW1lAAAABl9fdXNlcgoJQjAzMjAwMDA2AAAACXBsYXllcl9pZA==\n	1429856944
session:792b36e4730994985ec08e83cd0a00775a174938                        	BQkDAAAABQlVOdSiAAAACV9fdXBkYXRlZAlVOdSiAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDA1NAAAAAJpZAoJ5a6L5om/6LuSAAAABG5hbWUKBWNo\nZW5nAAAACHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDU0AAAACXBsYXllcl9pZA==\n	1429856946
session:dc3e886b051482e6d847662b486961f0c7102dd3                        	BQkDAAAABQlVOdSkAAAACV9fdXBkYXRlZAlVOdSkAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKCeael+W/g+W5tAAAAARuYW1lCglCMDMyMDAwNjMAAAACaWQKA3hp\nbgAAAAhwYXNzd29yZAAAAAZfX3VzZXIKCUIwMzIwMDA2MwAAAAlwbGF5ZXJfaWQ=\n	1429856948
session:f82c9b635ad980737a52021d9df5286c814e33a2                        	BQkDAAAABQlVOdSmAAAACV9fdXBkYXRlZAlVOdSmAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKAnl1AAAACHBhc3N3b3JkCglCMDMyMDAwMDYAAAACaWQKCeefs+mD\ngeaDoAAAAARuYW1lAAAABl9fdXNlcgoJQjAzMjAwMDA2AAAACXBsYXllcl9pZA==\n	1429856950
session:09cd4187c86d06e0b98188afb12f86493d95f4d6                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDg5AAAAAmlkCgnlsKTlvovmmbQAAAAEbmFtZQoCbHUAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCglCMDMyMDAwODkAAAAJcGxheWVyX2lkCVU51KcAAAAJX191cGRh\ndGVkCVU51KcAAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856951
session:b2546d7c62584b53b41f693f9e23c3501eb8ca0a                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUpwAAAAlfX3VwZGF0ZWQJVTnUpwAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDAxMgAAAAlwbGF5ZXJfaWQEAwAAAAMKCUIwMzIwMDAxMgAAAAJp\nZAoJ6YKx5L6d5au7AAAABG5hbWUKAnlpAAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429856951
session:4a1afbef1eec82e37adecdbdc8f0bb06cc7572fc                        	BQkDAAAABQlVOdSqAAAACV9fdXBkYXRlZAlVOdSqAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKAmxpAAAACHBhc3N3b3JkCglCMDMyMDAwMzIAAAACaWQKCeWui+er\ni+WptwAAAARuYW1lAAAABl9fdXNlcgoJQjAzMjAwMDMyAAAACXBsYXllcl9pZA==\n	1429856954
session:31832c459bbe7cd55d98c6275ded6967bd723ae4                        	BQkDAAAABQQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCemCseS+neWruwAAAARuYW1lCglCMDMyMDAw\nMTIAAAACaWQAAAAGX191c2VyCglCMDMyMDAwMTIAAAAJcGxheWVyX2lkCVU51KsAAAAJX191cGRh\ndGVkCVU51KsAAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429856955
session:b2d914e2f46685b6ed7eb730db749e0b46621fbd                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDE4AAAAAmlkCgnlkLPosp3lrrgAAAAEbmFtZQoDYmVpAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDE4AAAACXBsYXllcl9pZAlVOdSzAAAACV9fdXBk\nYXRlZAlVOdSzAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856963
session:56535c86e7b495c686d2f46da32d15583585f71e                        	BQkDAAAABQlVOdS1AAAACV9fdXBkYXRlZAlVOdS1AAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKAmxpAAAACHBhc3N3b3JkCglCMDMyMDAwMzIAAAACaWQKCeWui+er\ni+WptwAAAARuYW1lAAAABl9fdXNlcgoJQjAzMjAwMDMyAAAACXBsYXllcl9pZA==\n	1429856965
session:566e8481f0aa9e3ee3d2b649f3eb23653fb76eee                        	BQkDAAAABQQDAAAAAwoJ6Kix5ZOB55CmAAAABG5hbWUKCUIwMzIwMDA3NAAAAAJpZAoDcGluAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDc0AAAACXBsYXllcl9pZAlVOdS2AAAACV9fY3Jl\nYXRlZAlVOdS2AAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856966
session:af4de942b5e072857f2b63f9d223f791b5fc13c3                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdS4AAAACV9fdXBkYXRlZAlVOdS4AAAACV9fY3Jl\nYXRlZA==\n	1429856968
session:621e62eb8d289227883eb2d1da2875847e61773f                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUuQAAAAlfX2NyZWF0ZWQJVTnUuQAA\nAAlfX3VwZGF0ZWQKCUIwMzIwMDA2MwAAAAlwbGF5ZXJfaWQEAwAAAAMKA3hpbgAAAAhwYXNzd29y\nZAoJQjAzMjAwMDYzAAAAAmlkCgnmnpflv4PlubQAAAAEbmFtZQAAAAZfX3VzZXI=\n	1429856969
session:9528d75a3a048ac43f9b0567d6dff3fc6e85d3d5                        	BQkDAAAABQoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAQDAAAAAwoJ55Sw5reH5ZySAAAABG5hbWUK\nCUIwMzIwMDA0NgAAAAJpZAoCcWkAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9f\ndXNlcl9yZWFsbQlVOdS5AAAACV9fdXBkYXRlZAlVOdS5AAAACV9fY3JlYXRlZA==\n	1429856969
session:75c0dd2579d498612b1f085f2c00445c3ae3f62e                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDUyAAAAAmlkCgnmnY7kvbPlrpwAAAAEbmFtZQoDamlhAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDUyAAAACXBsYXllcl9pZAlVOdS7AAAACV9fdXBk\nYXRlZAlVOdS7AAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856971
session:2b317de41dd994e991f421ca31737df64f6f2582                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUwQAAAAlfX2NyZWF0ZWQJVTnUwQAA\nAAlfX3VwZGF0ZWQKCUIwMzIwMDAwNgAAAAlwbGF5ZXJfaWQEAwAAAAMKAnl1AAAACHBhc3N3b3Jk\nCgnnn7Ppg4Hmg6AAAAAEbmFtZQoJQjAzMjAwMDA2AAAAAmlkAAAABl9fdXNlcg==\n	1429856977
session:18a392a09d4356c5fd9ecb60e35c05752829d2a4                        	BQkDAAAAAwlVOdTFAAAACV9fdXBkYXRlZAlVOdTFAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429856981
session:574d19ec9115bbc734eb68d1ee93b02832d24ed1                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDYzAAAAAmlkCgnmnpflv4PlubQAAAAEbmFtZQoDeGluAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDYzAAAACXBsYXllcl9pZAlVOdTIAAAACV9fdXBk\nYXRlZAlVOdTIAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429856984
session:b50d1a3286e5ae9a3b86785cfaa0cecaf4f6f1af                        	BQkDAAAAAwlVOdTLAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdTLAAAACV9fdXBk\nYXRlZA==\n	1429856986
session:37dab70a7b2e49d73da727a38e5ec822b0ac1c81                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKAnl1AAAACHBhc3N3b3JkCglC\nMDMyMDAwMDYAAAACaWQKCeefs+mDgeaDoAAAAARuYW1lAAAABl9fdXNlcglVOdTRAAAACV9fdXBk\nYXRlZAlVOdTRAAAACV9fY3JlYXRlZAoJQjAzMjAwMDA2AAAACXBsYXllcl9pZA==\n	1429856993
session:b95ef5fd29f9ef38cea732a37152915966f29124                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnU1AAAAAlfX2NyZWF0ZWQJVTnU1AAA\nAAlfX3VwZGF0ZWQEAwAAAAMKCeWui+aJv+i7kgAAAARuYW1lCgVjaGVuZwAAAAhwYXNzd29yZAoJ\nQjAzMjAwMDU0AAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDU0AAAACXBsYXllcl9pZA==\n	1429856996
session:091645bd0d15339864db26131ba9fbeefe59875a                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnU3QAAAAlfX2NyZWF0ZWQJVTnU3QAA\nAAlfX3VwZGF0ZWQEAwAAAAMKCUIwMzIwMDA1NAAAAAJpZAoJ5a6L5om/6LuSAAAABG5hbWUKBWNo\nZW5nAAAACHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDU0AAAACXBsYXllcl9pZA==\n	1429857005
session:8ee9c4f2845b9e7827549dea8a2c977cdd84778e                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnU3wAAAAlfX3VwZGF0ZWQJVTnU3wAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQEAwAAAAMKCUIwMzIwMDAzOQAAAAJp\nZAoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXI=\n	1429857007
session:c0b24daf35aa85d8e41717c3bfdee62899a2f313                        	BQkDAAAABQlVOdTlAAAACV9fdXBkYXRlZAlVOdTlAAAACV9fY3JlYXRlZAQDAAAAAwoJQjAzMjAw\nMDMyAAAAAmlkCgJsaQAAAAhwYXNzd29yZAoJ5a6L56uL5am3AAAABG5hbWUAAAAGX191c2VyCglC\nMDMyMDAwMzIAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857013
session:41b076abfec246bde44e4ffd00e9e6d848236f41                        	BQkDAAAABQlVOdToAAAACV9fY3JlYXRlZAoJQjAzMjAwMDE4AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeWQs+iyneWuuAAAAARuYW1lCglCMDMyMDAwMTgAAAAC\naWQKA2JlaQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVTnU6AAAAAlfX3VwZGF0ZWQ=\n	1429857016
session:c79f009b9fea0e55899b3b8e07b93e1e91560e8b                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnU7AAAAAlfX3VwZGF0ZWQJVTnU7AAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDA1NAAAAAlwbGF5ZXJfaWQEAwAAAAMKBWNoZW5nAAAACHBhc3N3\nb3JkCgnlrovmib/ou5IAAAAEbmFtZQoJQjAzMjAwMDU0AAAAAmlkAAAABl9fdXNlcg==\n	1429857020
session:f67300e9f7bc6db64ca7d67b4d21b21af90fae8e                        	BQkDAAAABQoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAlVOdTwAAAACV9fY3JlYXRlZAlVOdTwAAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeisneWmguaZtAAAAARu\nYW1lCglCOTkxMTAwNTUAAAACaWQKAnJ1AAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429857024
session:f6f0fede23efce5f629cf2c89e1485f073a2e1e0                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnU+AAAAAlfX2NyZWF0ZWQJVTnU+AAA\nAAlfX3VwZGF0ZWQKCUI5OTExMDA1NQAAAAlwbGF5ZXJfaWQEAwAAAAMKCUI5OTExMDA1NQAAAAJp\nZAoCcnUAAAAIcGFzc3dvcmQKCeisneWmguaZtAAAAARuYW1lAAAABl9fdXNlcg==\n	1429857032
session:2928c3e9f42952040d9a5db9ab54cf03ad44b16f                        	BQkDAAAAAwlVOdT+AAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdT+AAAACV9fY3Jl\nYXRlZA==\n	1429857038
session:6acad2b354a375729567a7735ba73c4613ae78d3                        	BQkDAAAABQoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAlVOdUEAAAACV9fY3JlYXRlZAlVOdUEAAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKAnJ1AAAACHBhc3N3b3Jk\nCgnorJ3lpoLmmbQAAAAEbmFtZQoJQjk5MTEwMDU1AAAAAmlkAAAABl9fdXNlcg==\n	1429857044
session:260f739f5eb98464658c04c24d8bc58d826547fe                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnVBwAAAAlfX3VwZGF0ZWQKBGNhbGwA\nAAAFZ2VucmUEAwAAAAMKCUIwMzIwMDAxOAAAAAJpZAoJ5ZCz6LKd5a64AAAABG5hbWUKA2JlaQAA\nAAhwYXNzd29yZAAAAAZfX3VzZXIKCUIwMzIwMDAxOAAAAAlwbGF5ZXJfaWQJVTnU+wAAAAlfX2Ny\nZWF0ZWQKAzFKMAAAAAZsZWFndWUKBHNpYXIAAAAIZXhlcmNpc2U=\n	1429858569
session:bb885d33453ff4238604a71d88e19ff93df131f1                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUI5OTExMDA1NQAAAAJpZAoJ\n6Kyd5aaC5pm0AAAABG5hbWUKAnJ1AAAACHBhc3N3b3JkAAAABl9fdXNlcglVOdUKAAAACV9fdXBk\nYXRlZAlVOdUKAAAACV9fY3JlYXRlZAoJQjk5MTEwMDU1AAAACXBsYXllcl9pZA==\n	1429857050
session:c319be0e013c573fb38b7f35d8ac9df172a5cc7b                        	BQkDAAAAAwlVOdUcAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdUcAAAACV9fdXBk\nYXRlZA==\n	1429857068
session:e8f1640f4bcdf5e0565ea491de3f43e81c8ec628                        	BQkDAAAABQlVOdUhAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDEyAAAAAmlkCgnpgrHkvp3l\nq7sAAAAEbmFtZQoCeWkAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQoJQjAzMjAwMDEyAAAACXBsYXllcl9pZAlVOdUhAAAACV9fY3JlYXRlZA==\n	1429857073
session:fddbbfaa2bf50d2cfc2f5c06a6f61829de58c5b6                        	BQkDAAAABQoJQjAzMjAwMDEyAAAACXBsYXllcl9pZAlVOdUmAAAACV9fY3JlYXRlZAlVOdUmAAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKAnlpAAAACHBhc3N3b3Jk\nCglCMDMyMDAwMTIAAAACaWQKCemCseS+neWruwAAAARuYW1lAAAABl9fdXNlcg==\n	1429857078
session:7338cc5f46488d75f4943733fdec96a2b4dd9639                        	BQkDAAAABQlVOdUoAAAACV9fY3JlYXRlZAoJQjAzMjAwMDk0AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKBHhpYW8AAAAIcGFzc3dvcmQKCUIwMzIwMDA5NAAAAAJp\nZAoJ6YKx562x5bS0AAAABG5hbWUAAAAGX191c2VyCVU51SgAAAAJX191cGRhdGVk\n	1429857080
session:fe86cff0d663340d255717623f9bbe7c47e543a0                        	BQkDAAAABQlVOdUqAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMK\nCeewoemAuOasowAAAARuYW1lCglCMDMyMDAwNTYAAAACaWQKAnlpAAAACHBhc3N3b3JkAAAABl9f\ndXNlcgoJQjAzMjAwMDU2AAAACXBsYXllcl9pZAlVOdUqAAAACV9fY3JlYXRlZA==\n	1429857082
session:4ffff73efd2b899aca3e354b3d59d7d9bd4ff89b                        	BQkDAAAABQlVOdVeAAAACV9fdXBkYXRlZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCUIwMzIw\nMDA1NAAAAAJpZAoJ5a6L5om/6LuSAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNl\ncl9yZWFsbQoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAlVOdVeAAAACV9fY3JlYXRlZA==\n	1429857134
session:5676b76df8d992443f50d88683ba42fbc7d8ffbc                        	BQkDAAAABQQDAAAAAwoJ5a6L56uL5am3AAAABG5hbWUKCUIwMzIwMDAzMgAAAAJpZAoCbGkAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVOdVeAAAACV9fdXBk\nYXRlZAlVOdVeAAAACV9fY3JlYXRlZAoJQjAzMjAwMDMyAAAACXBsYXllcl9pZA==\n	1429857134
session:69a74263a603cb279b5d69b7ea6515393b725f51                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQlVOeduAAAACV9fdXBkYXRlZAoJ\nQjAzMjAwMDkxAAAACXBsYXllcl9pZAlVOdVtAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lz\nZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKA2p1bgAAAAhwYXNzd29yZAoJQjAzMjAw\nMDkxAAAAAmlkCgnlvpDlnYflrZ8AAAAEbmFtZQAAAAZfX3VzZXI=\n	1429862475
session:40ac9afb287628221e2d5f5055dc20042a8a8541                        	BQkDAAAABQlVOdViAAAACV9fY3JlYXRlZAoJQjAzMjAwMDQyAAAACXBsYXllcl9pZAQDAAAAAwoJ\n6JGJ5aaC55SEAAAABG5hbWUKCUIwMzIwMDA0MgAAAAJpZAoCcnUAAAAIcGFzc3dvcmQAAAAGX191\nc2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVOdViAAAACV9fdXBkYXRlZA==\n	1429857138
session:f05736007b439b936af07ee26a70f159b6421922                        	BQkDAAAABQoJQjAzMjAwMDk0AAAACXBsYXllcl9pZAlVOdViAAAACV9fY3JlYXRlZAlVOdViAAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDA5NAAAAAJp\nZAoJ6YKx562x5bS0AAAABG5hbWUKBHhpYW8AAAAIcGFzc3dvcmQAAAAGX191c2Vy\n	1429857138
session:2e786060a07a65da1de83a4f328e2487bc706d2f                        	BQkDAAAACAoJQjAzMjAwMDA2AAAACXBsYXllcl9pZAlVOdVfAAAACV9fY3JlYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0KBHNpYXIAAAAIZXhlcmNpc2UEAwAAAAMKCeefs+mDgeaDoAAAAARu\nYW1lCglCMDMyMDAwMDYAAAACaWQKAnl1AAAACHBhc3N3b3JkAAAABl9fdXNlcgoEY2FsbAAAAAVn\nZW5yZQoDMUowAAAABmxlYWd1ZQlVOdVzAAAACV9fdXBkYXRlZA==\n	1429861807
session:c3532be43b7436dd3b589cb776d7525d96cb044f                        	BQkDAAAABQlVOdUNAAAACV9fdXBkYXRlZAlVOdUNAAAACV9fY3JlYXRlZAoJQjAzMjAwMDMyAAAA\nCXBsYXllcl9pZAQDAAAAAwoJ5a6L56uL5am3AAAABG5hbWUKAmxpAAAACHBhc3N3b3JkCglCMDMy\nMDAwMzIAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857053
session:c950331bc8e8e6d4dc87226666d31c4abc1947f1                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnVFgAAAAlfX3VwZGF0ZWQJVTnVFgAA\nAAlfX2NyZWF0ZWQEAwAAAAMKCUIwMzIwMDA3NAAAAAJpZAoDcGluAAAACHBhc3N3b3JkCgnoqLHl\nk4HnkKYAAAAEbmFtZQAAAAZfX3VzZXIKCUIwMzIwMDA3NAAAAAlwbGF5ZXJfaWQ=\n	1429857062
session:420da66fb9ef8e4da5318a291aba2dcf29abdc4d                        	BQkDAAAAAwlVOdUaAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdUaAAAACV9fdXBk\nYXRlZA==\n	1429857066
session:4a1c6fb7d7a09de6eeb973c4d32b45527e74d2f4                        	BQkDAAAAAwlVOdUbAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdUbAAAACV9fdXBk\nYXRlZA==\n	1429857067
session:ebe48016a532fc906eece38239e33af18d96bc48                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnVLgAAAAlfX2NyZWF0ZWQJVTnVLgAA\nAAlfX3VwZGF0ZWQKCUIwMzIwMDAxMgAAAAlwbGF5ZXJfaWQEAwAAAAMKCemCseS+neWruwAAAARu\nYW1lCgJ5aQAAAAhwYXNzd29yZAoJQjAzMjAwMDEyAAAAAmlkAAAABl9fdXNlcg==\n	1429857086
session:9b97a104c8e5a13b68785c164b04e7524e6db5a8                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeisneWmguaZtAAAAARuYW1l\nCgJydQAAAAhwYXNzd29yZAoJQjk5MTEwMDU1AAAAAmlkAAAABl9fdXNlcgoJQjk5MTEwMDU1AAAA\nCXBsYXllcl9pZAlVOdU6AAAACV9fY3JlYXRlZAlVOdU6AAAACV9fdXBkYXRlZA==\n	1429857098
session:8d176ca187eb338bf44cf67d45a3f573c46d12a7                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA3NAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3BpbgAAAAhwYXNzd29yZAoJ6Kix5ZOB55CmAAAABG5hbWUKCUIwMzIwMDA3NAAAAAJp\nZAAAAAZfX3VzZXIJVTnVPgAAAAlfX2NyZWF0ZWQJVTnVPgAAAAlfX3VwZGF0ZWQ=\n	1429857102
session:92ef2ee4b1da0c88050d8193e30975b66d1ed635                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdVOAAAACV9fY3JlYXRlZAlVOdVOAAAACV9fdXBk\nYXRlZA==\n	1429857118
session:f5528d0866cf2c0c388678a51e06b1ea899be8b2                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUI5OTExMDA1NQAAAAJpZAoC\ncnUAAAAIcGFzc3dvcmQKCeisneWmguaZtAAAAARuYW1lAAAABl9fdXNlcgoJQjk5MTEwMDU1AAAA\nCXBsYXllcl9pZAlVOdVPAAAACV9fdXBkYXRlZAlVOdVPAAAACV9fY3JlYXRlZA==\n	1429857119
session:00826fdd295874838d9d731e1e1bac8cd9dba9fa                        	BQkDAAAAAwlVOdVQAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdVQAAAACV9fY3Jl\nYXRlZA==\n	1429857120
session:ab7a0c497b7433baa2e23a2c2c26a986d29e972d                        	BQkDAAAAAwlVOdVaAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdVaAAAACV9fdXBk\nYXRlZA==\n	1429857130
session:89cbacc1e6081bbada904fa6962c932fba0b2495                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeael+aFp+WonwAAAARuYW1l\nCgNodWkAAAAIcGFzc3dvcmQKCUIwMzIwMDAzOQAAAAJpZAAAAAZfX3VzZXIKCUIwMzIwMDAzOQAA\nAAlwbGF5ZXJfaWQJVTnVZAAAAAlfX2NyZWF0ZWQJVTnVZAAAAAlfX3VwZGF0ZWQ=\n	1429857140
session:7014246d3a8c4db055dd3ea425c3fc9b5c0ba13c                        	BQkDAAAABQlVOdVkAAAACV9fY3JlYXRlZAlVOdVkAAAACV9fdXBkYXRlZAQDAAAAAwoJ6Kix5ZOB\n55CmAAAABG5hbWUKA3BpbgAAAAhwYXNzd29yZAoJQjAzMjAwMDc0AAAAAmlkAAAABl9fdXNlcgoJ\nQjAzMjAwMDc0AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429857140
session:73df6d9e18d022880bb8f42e6665772ed6c087a4                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnVDQAAAAlfX3VwZGF0ZWQKBGNhbGwA\nAAAFZ2VucmUKCUIwMzIwMDA2MwAAAAlwbGF5ZXJfaWQEAwAAAAMKCUIwMzIwMDA2MwAAAAJpZAoJ\n5p6X5b+D5bm0AAAABG5hbWUKA3hpbgAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVTnU9gAAAAlfX2Ny\nZWF0ZWQKAzFKMAAAAAZsZWFndWUKBHNpYXIAAAAIZXhlcmNpc2U=\n	1429861883
session:ca4983e208d4ca85aa6ba051aabc32a15093f19a                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKBWNoZW5nAAAACHBhc3N3b3Jk\nCgnlrovmib/ou5IAAAAEbmFtZQoJQjAzMjAwMDU0AAAAAmlkAAAABl9fdXNlcglVOdXIAAAACV9f\ndXBkYXRlZAlVOdXIAAAACV9fY3JlYXRlZAoJQjAzMjAwMDU0AAAACXBsYXllcl9pZA==\n	1429857240
session:4fb008d2e65656614394ea3f0863c8a0a9e4e213                        	BQkDAAAAAwlVOdU0AAAACV9fY3JlYXRlZAlVOdU0AAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429857115
session:98761b05a522fb3d4ccd1aa8a706eaed6e6b5379                        	BQkDAAAABQlVOdV5AAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMK\nCeWui+aJv+i7kgAAAARuYW1lCglCMDMyMDAwNTQAAAACaWQKBWNoZW5nAAAACHBhc3N3b3JkAAAA\nBl9fdXNlcgoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAlVOdV5AAAACV9fY3JlYXRlZA==\n	1429857161
session:2798ba805edf30faea9bf5699bf837f6114ee0ed                        	BQkDAAAABQlVOdWDAAAACV9fY3JlYXRlZAoJQjAzMjAwMDUyAAAACXBsYXllcl9pZAQDAAAAAwoJ\n5p2O5L2z5a6cAAAABG5hbWUKCUIwMzIwMDA1MgAAAAJpZAoDamlhAAAACHBhc3N3b3JkAAAABl9f\ndXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnVgwAAAAlfX3VwZGF0ZWQ=\n	1429857171
session:e3e7717ee0e44565e629061570271cf69fe46330                        	BQkDAAAABQlVOdWFAAAACV9fdXBkYXRlZAlVOdWFAAAACV9fY3JlYXRlZAQDAAAAAwoJ6JGJ5aaC\n55SEAAAABG5hbWUKAnJ1AAAACHBhc3N3b3JkCglCMDMyMDAwNDIAAAACaWQAAAAGX191c2VyCglC\nMDMyMDAwNDIAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857173
session:e2e4ca9cb133639050e95cbca1f2bf068ba383d1                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA1NAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKCeWui+aJv+i7kgAAAARuYW1lCgVjaGVuZwAAAAhwYXNzd29yZAoJQjAzMjAwMDU0AAAA\nAmlkAAAABl9fdXNlcglVOdWIAAAACV9fdXBkYXRlZAlVOdWIAAAACV9fY3JlYXRlZA==\n	1429857176
session:9b7e4dfafb755aa344bf6ea79e08cbe016995c19                        	BQkDAAAABQoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAQDAAAAAwoCcWkAAAAIcGFzc3dvcmQKCUIw\nMzIwMDA0NgAAAAJpZAoJ55Sw5reH5ZySAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9f\ndXNlcl9yZWFsbQlVOdWIAAAACV9fdXBkYXRlZAlVOdWIAAAACV9fY3JlYXRlZA==\n	1429857176
session:9eceecd3fb3ea22ee6aec584c9ea472d35286671                        	BQkDAAAABQoJQjAzMjAwMDc0AAAACXBsYXllcl9pZAlVOdWRAAAACV9fY3JlYXRlZAlVOdWRAAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKA3BpbgAAAAhwYXNzd29y\nZAoJ6Kix5ZOB55CmAAAABG5hbWUKCUIwMzIwMDA3NAAAAAJpZAAAAAZfX3VzZXI=\n	1429857185
session:b153b1ede80224560155f01d8936709b1216854f                        	BQkDAAAABQlVOdWYAAAACV9fY3JlYXRlZAlVOdWYAAAACV9fdXBkYXRlZAoJQjAzMjAwMDk0AAAA\nCXBsYXllcl9pZAQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJ6YKx562x5bS0AAAABG5hbWUKCUIw\nMzIwMDA5NAAAAAJpZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429857192
session:b7448baf1274f14ad40e9a855c53e4532603d5d8                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDAzOQAAAAJpZAoJ\n5p6X5oWn5aifAAAABG5hbWUKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVTnVmwAAAAlfX3Vw\nZGF0ZWQJVTnVmwAAAAlfX2NyZWF0ZWQKCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQ=\n	1429857195
session:10f75fc2f242b3997dc32ea8e3e408ccfbb7bff5                        	BQkDAAAAAwlVOdWhAAAACV9fY3JlYXRlZAlVOdWhAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429857201
session:dda313b1163578dba3e521f98aafef376ae940a8                        	BQkDAAAABQlVOdWmAAAACV9fY3JlYXRlZAlVOdWmAAAACV9fdXBkYXRlZAoJQjAzMjAwMDQyAAAA\nCXBsYXllcl9pZAQDAAAAAwoJ6JGJ5aaC55SEAAAABG5hbWUKAnJ1AAAACHBhc3N3b3JkCglCMDMy\nMDAwNDIAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857206
session:8636754be7f1a8fc3848594a07da691deb59074c                        	BQkDAAAABQQDAAAAAwoDaHVpAAAACHBhc3N3b3JkCglCMDMyMDAwMzkAAAACaWQKCeael+aFp+Wo\nnwAAAARuYW1lAAAABl9fdXNlcgoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAlVOdWrAAAACV9fY3Jl\nYXRlZAlVOdWrAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429857211
session:6e2c1c569552be77ad584ca0a2105b46a682d9de                        	BQkDAAAABQlVOdWxAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMK\nAnlpAAAACHBhc3N3b3JkCglCMDMyMDAwMTIAAAACaWQKCemCseS+neWruwAAAARuYW1lAAAABl9f\ndXNlcgoJQjAzMjAwMDEyAAAACXBsYXllcl9pZAlVOdWxAAAACV9fY3JlYXRlZA==\n	1429857217
session:e198ec8570531861b60a2ba84e72a89bac3c7c6f                        	BQkDAAAABQlVOdW4AAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMK\nAnlpAAAACHBhc3N3b3JkCgnnsKHpgLjmrKMAAAAEbmFtZQoJQjAzMjAwMDU2AAAAAmlkAAAABl9f\ndXNlcgoJQjAzMjAwMDU2AAAACXBsYXllcl9pZAlVOdW4AAAACV9fY3JlYXRlZA==\n	1429857224
session:7f278b28150b79c4096da4b21878af90a1da983f                        	BQkDAAAABQoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAlVOdXHAAAACV9fY3JlYXRlZAlVOdXHAAAA\nCV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDU0AAAAAmlkCgnlrovmib/ou5IAAAAEbmFtZQoFY2hl\nbmcAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857239
session:b45108d7f414d846ebc76c53fbc0e8509d9b6d13                        	BQkDAAAABQlVOdXPAAAACV9fdXBkYXRlZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCeWui+aJ\nv+i7kgAAAARuYW1lCglCMDMyMDAwNTQAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNl\ncl9yZWFsbQoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAlVOdXPAAAACV9fY3JlYXRlZA==\n	1429857247
session:9416a9a616386a05b2ce08fb62e6886ad227d7ed                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdXQAAAACV9fY3JlYXRlZAlVOdXQAAAACV9fdXBk\nYXRlZA==\n	1429857248
session:66f7b86afe9e47d06039f28573eedd161203f691                        	BQkDAAAABQlVOdXTAAAACV9fdXBkYXRlZAQDAAAAAwoDanVuAAAACHBhc3N3b3JkCglCMDMyMDAw\nMzcAAAACaWQKCeiMg+WQm+WEkgAAAARuYW1lAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KCUIwMzIwMDAzNwAAAAlwbGF5ZXJfaWQJVTnV0wAAAAlfX2NyZWF0ZWQ=\n	1429857251
session:0860edeb0d63bd646f164bef97b2eeacd8e0250b                        	BQkDAAAABQQDAAAAAwoDcGluAAAACHBhc3N3b3JkCgnoqLHlk4HnkKYAAAAEbmFtZQoJQjAzMjAw\nMDc0AAAAAmlkAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnV0wAAAAlfX3Vw\nZGF0ZWQJVTnV0wAAAAlfX2NyZWF0ZWQKCUIwMzIwMDA3NAAAAAlwbGF5ZXJfaWQ=\n	1429857251
session:d342220a31cb0a96f24fd527991adbec4191a127                        	BQkDAAAABQoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDU0AAAAAmlkCgnl\nrovmib/ou5IAAAAEbmFtZQoFY2hlbmcAAAAIcGFzc3dvcmQAAAAGX191c2VyCVU51dQAAAAJX19j\ncmVhdGVkCVU51dQAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857252
session:aa75caea85ae3f6c30d5603d5c7d4f7fb9b68203                        	BQkDAAAACAoJQjAzMjAwMDI5AAAACXBsYXllcl9pZAlVOdNHAAAACV9fY3JlYXRlZAQDAAAAAwoE\nZGluZwAAAAhwYXNzd29yZAoJ6Y2+5a6a6LuSAAAABG5hbWUKCUIwMzIwMDAyOQAAAAJpZAAAAAZf\nX3VzZXIKBHNpYXIAAAAIZXhlcmNpc2UKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVU51CMAAAAJ\nX191cGRhdGVkCgMxSjAAAAAGbGVhZ3VlCgRjYWxsAAAABWdlbnJl\n	1429861635
session:63ef5f62841fded0372c071d49fa675061a6ab1a                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVXfqYAAAACV9fY3JlYXRlZAlVXfqYAAAACV9fdXBk\nYXRlZA==\n	1432226139
session:24cb3f0645cf49dff0af2065ba0da6afa6cf29d0                        	BQkDAAAAAwlVgWExAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVgWExAAAACV9fY3Jl\nYXRlZA==\n	1434545986
session:fa47d0509700ceddd4f330721cdb24c661420a35                        	BQkDAAAAAwlVgWR5AAAACV9fY3JlYXRlZAlVgWR5AAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434547070
session:4f8fd0ddb307cee44582a941c3a2692bb91f7f5f                        	BQkDAAAAAwlVgWUtAAAACV9fY3JlYXRlZAlVgWUtAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434547005
session:4606cb8e65bc34a5a84f72b06056590a9239782f                        	BQkDAAAABQlVOdXZAAAACV9fY3JlYXRlZAoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeWui+aJv+i7kgAAAARuYW1lCglCMDMyMDAwNTQAAAAC\naWQKBWNoZW5nAAAACHBhc3N3b3JkAAAABl9fdXNlcglVOdXZAAAACV9fdXBkYXRlZA==\n	1429857257
session:eb6cbbea8a20ab2ea399080291b4b97f44286dde                        	BQkDAAAABQlVOdXiAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMK\nCUIwMzIwMDA4MgAAAAJpZAoJ5ZCz5a2f5aiBAAAABG5hbWUKBG1lbmcAAAAIcGFzc3dvcmQAAAAG\nX191c2VyCglCMDMyMDAwODIAAAAJcGxheWVyX2lkCVU51eIAAAAJX19jcmVhdGVk\n	1429857266
session:d5439d4ee494c5901cecd717305ca04165acd74c                        	BQkDAAAABQlVOdXkAAAACV9fY3JlYXRlZAoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKBWNoZW5nAAAACHBhc3N3b3JkCglCMDMyMDAwNTQAAAAC\naWQKCeWui+aJv+i7kgAAAARuYW1lAAAABl9fdXNlcglVOdXkAAAACV9fdXBkYXRlZA==\n	1429857268
session:3264dac70aee6896569caf50dddd0ee37ba8616a                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKBHhpYW8AAAAIcGFzc3dvcmQK\nCemCseetseW0tAAAAARuYW1lCglCMDMyMDAwOTQAAAACaWQAAAAGX191c2VyCVU51egAAAAJX191\ncGRhdGVkCVU51egAAAAJX19jcmVhdGVkCglCMDMyMDAwOTQAAAAJcGxheWVyX2lk\n	1429857272
session:ab92403111beb69c94a0e0f434c88f32786a6ae9                        	BQkDAAAABQlVOdX5AAAACV9fY3JlYXRlZAoJQjAzMjAwMDk0AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCemCseetseW0tAAAAARuYW1lCglCMDMyMDAwOTQAAAAC\naWQKBHhpYW8AAAAIcGFzc3dvcmQAAAAGX191c2VyCVU51fkAAAAJX191cGRhdGVk\n	1429857289
session:c83f5c800bb90506a4e2fd210b169d1961220589                        	BQkDAAAABQoJQjAzMjAwMDk0AAAACXBsYXllcl9pZAlVOdX9AAAACV9fY3JlYXRlZAlVOdX9AAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKBHhpYW8AAAAIcGFzc3dv\ncmQKCemCseetseW0tAAAAARuYW1lCglCMDMyMDAwOTQAAAACaWQAAAAGX191c2Vy\n	1429857293
session:07488e6b21690114f770525ae68f5d6154a7287c                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDU0AAAAAmlkCgnlrovmib/ou5IAAAAEbmFtZQoFY2hlbmcA\nAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVOdYDAAAACV9f\ndXBkYXRlZAlVOdYDAAAACV9fY3JlYXRlZAoJQjAzMjAwMDU0AAAACXBsYXllcl9pZA==\n	1429857299
session:7c155e522e73f2d8669d08e0f3b59d20b71954e2                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDA3NAAAAAJpZAoJ\n6Kix5ZOB55CmAAAABG5hbWUKA3BpbgAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVTnWBQAAAAlfX3Vw\nZGF0ZWQJVTnWBQAAAAlfX2NyZWF0ZWQKCUIwMzIwMDA3NAAAAAlwbGF5ZXJfaWQ=\n	1429857301
session:df7adaf57cdd208f2faa2b64e7b87046a29cbd6c                        	BQkDAAAABQQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCeWui+aJv+i7kgAAAARuYW1lCglCMDMy\nMDAwNTQAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVOdYFAAAACV9f\ndXBkYXRlZAlVOdYFAAAACV9fY3JlYXRlZAoJQjAzMjAwMDU0AAAACXBsYXllcl9pZA==\n	1429857301
session:3b2ca4c406b7f77a4039a1ddc9a7e10ff9a0d173                        	BQkDAAAABQQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCemCseS+neWruwAAAARuYW1lCglCMDMyMDAw\nMTIAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVOdYLAAAACV9fdXBk\nYXRlZAlVOdYLAAAACV9fY3JlYXRlZAoJQjAzMjAwMDEyAAAACXBsYXllcl9pZA==\n	1429857307
session:d858b47173c2bcc0921f093b046a45492e336a54                        	BQkDAAAABQlVOdYMAAAACV9fdXBkYXRlZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCeWui+aJ\nv+i7kgAAAARuYW1lCglCMDMyMDAwNTQAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNl\ncl9yZWFsbQoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAlVOdYMAAAACV9fY3JlYXRlZA==\n	1429857308
session:0b17a0d7148693c58c34fb215534daf86e8c1543                        	BQkDAAAABQlVOdYRAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDEyAAAAAmlkCgnpgrHkvp3l\nq7sAAAAEbmFtZQoCeWkAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQoJQjAzMjAwMDEyAAAACXBsYXllcl9pZAlVOdYRAAAACV9fY3JlYXRlZA==\n	1429857313
session:b1dee253122ccb5f421708594efa0889e82c41d8                        	BQkDAAAABQlVOdYTAAAACV9fY3JlYXRlZAoJQjAzMjAwMDk0AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKBHhpYW8AAAAIcGFzc3dvcmQKCUIwMzIwMDA5NAAAAAJp\nZAoJ6YKx562x5bS0AAAABG5hbWUAAAAGX191c2VyCVU51hMAAAAJX191cGRhdGVk\n	1429857315
session:48685cebf0ac9290500d8791f574854bf9728b68                        	BQkDAAAABQlVOdYZAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDM3AAAAAmlkCgnojIPlkJvl\nhJIAAAAEbmFtZQoDanVuAAAACHBhc3N3b3JkAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KCUIwMzIwMDAzNwAAAAlwbGF5ZXJfaWQJVTnWGQAAAAlfX2NyZWF0ZWQ=\n	1429857321
session:35d42eda7595ed4e30cdd964a597fb54578a48f4                        	BQkDAAAABQQDAAAAAwoEbWVuZwAAAAhwYXNzd29yZAoJ5ZCz5a2f5aiBAAAABG5hbWUKCUIwMzIw\nMDA4MgAAAAJpZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVU51h8AAAAJX191\ncGRhdGVkCVU51h8AAAAJX19jcmVhdGVkCglCMDMyMDAwODIAAAAJcGxheWVyX2lk\n	1429857327
session:f3fda4ce52436661380bf859f902d5cfea23b883                        	BQkDAAAAAwlVOdXpAAAACV9fY3JlYXRlZAlVOdXpAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429857273
session:749a492bd45b5c221c029fb1a597dd0e11c37d18                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnV6QAAAAlfX3VwZGF0ZWQJVTnV6QAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDA1NAAAAAlwbGF5ZXJfaWQEAwAAAAMKBWNoZW5nAAAACHBhc3N3\nb3JkCglCMDMyMDAwNTQAAAACaWQKCeWui+aJv+i7kgAAAARuYW1lAAAABl9fdXNlcg==\n	1429857273
session:38bbf7c4724cb776b504e4066e0f94064616ad29                        	BQkDAAAABQlVOdXsAAAACV9fdXBkYXRlZAlVOdXsAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDA5MgAAAAJpZAoG55un5q+FAAAABG5hbWUKAnlpAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDkyAAAACXBsYXllcl9pZA==\n	1429857276
session:96b5b8695fe7ac39614a86a87ae6d0a0ec19d295                        	BQkDAAAABQoJQjAzMjAwMDk0AAAACXBsYXllcl9pZAQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJ\n6YKx562x5bS0AAAABG5hbWUKCUIwMzIwMDA5NAAAAAJpZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAM\nX191c2VyX3JlYWxtCVU51e0AAAAJX19jcmVhdGVkCVU51e0AAAAJX191cGRhdGVk\n	1429857277
session:272d00b6a98d5550fbdc19b8300fc46b6a6eac4c                        	BQkDAAAABQoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQK\nCUIwMzIwMDA1NAAAAAJpZAoJ5a6L5om/6LuSAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAA\nDF9fdXNlcl9yZWFsbQlVOdXwAAAACV9fdXBkYXRlZAlVOdXwAAAACV9fY3JlYXRlZA==\n	1429857280
session:08e3cabb353583ccae927f6985fdb1d9951c345d                        	BQkDAAAABQQDAAAAAwoJ6YKx562x5bS0AAAABG5hbWUKCUIwMzIwMDA5NAAAAAJpZAoEeGlhbwAA\nAAhwYXNzd29yZAAAAAZfX3VzZXIKCUIwMzIwMDA5NAAAAAlwbGF5ZXJfaWQJVTnV8gAAAAlfX2Ny\nZWF0ZWQJVTnV8gAAAAlfX3VwZGF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429857282
session:b98d9a7c635e5d50b0f9910c508b06ea76ac844f                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnV9QAAAAlfX2NyZWF0ZWQJVTnV9QAA\nAAlfX3VwZGF0ZWQKCUIwMzIwMDA5NAAAAAlwbGF5ZXJfaWQEAwAAAAMKCemCseetseW0tAAAAARu\nYW1lCglCMDMyMDAwOTQAAAACaWQKBHhpYW8AAAAIcGFzc3dvcmQAAAAGX191c2Vy\n	1429857285
session:90a03c2bd4144213281ba044b7e52064e176a754                        	BQkDAAAACAlVOdXVAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KAzFKMAAA\nAAZsZWFndWUKBHNpYXIAAAAIZXhlcmNpc2UJVTnVygAAAAlfX2NyZWF0ZWQEAwAAAAMKCeiRieWm\ngueUhAAAAARuYW1lCgJydQAAAAhwYXNzd29yZAoJQjAzMjAwMDQyAAAAAmlkAAAABl9fdXNlcgoJ\nQjAzMjAwMDQyAAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQ==\n	1429860090
session:cb26b4a34b0db07e53a7697fe761bade03be1be8                        	BQkDAAAAAwlVOdYqAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdYqAAAACV9fdXBk\nYXRlZA==\n	1429857338
session:f53a711d3dcfa03e5e950ef4f3fed13d8278fca1                        	BQkDAAAABQlVOdYtAAAACV9fY3JlYXRlZAlVOdYtAAAACV9fdXBkYXRlZAQDAAAAAwoJ55Sw5reH\n5ZySAAAABG5hbWUKAnFpAAAACHBhc3N3b3JkCglCMDMyMDAwNDYAAAACaWQAAAAGX191c2VyCglC\nMDMyMDAwNDYAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857341
session:836cef67c873f0be40313373edd82005c4c10370                        	BQkDAAAABQoJQjAzMjAwMDk0AAAACXBsYXllcl9pZAQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJ\n6YKx562x5bS0AAAABG5hbWUKCUIwMzIwMDA5NAAAAAJpZAAAAAZfX3VzZXIJVTnWLwAAAAlfX3Vw\nZGF0ZWQJVTnWLwAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429857343
session:1141f5a586d518d9991c1c646863c8180d44356e                        	BQkDAAAABQlVOdY0AAAACV9fY3JlYXRlZAlVOdY0AAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDA5NAAAAAJpZAoJ6YKx562x5bS0AAAABG5hbWUKBHhp\nYW8AAAAIcGFzc3dvcmQAAAAGX191c2VyCglCMDMyMDAwOTQAAAAJcGxheWVyX2lk\n	1429857348
session:f821030b74a68cb10e427c0406c5e02dca322960                        	BQkDAAAABQQDAAAAAwoDanVuAAAACHBhc3N3b3JkCgnojIPlkJvlhJIAAAAEbmFtZQoJQjAzMjAw\nMDM3AAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDM3AAAACXBsYXllcl9pZAlVOdY2AAAACV9fY3Jl\nYXRlZAlVOdY2AAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429857350
session:b76c2f8e62bcac941731e199d8bd951cd9e288ce                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDk0AAAAAmlkCgnpgrHnrbHltLQAAAAEbmFtZQoEeGlhbwAA\nAAhwYXNzd29yZAAAAAZfX3VzZXIKCUIwMzIwMDA5NAAAAAlwbGF5ZXJfaWQJVTnWOgAAAAlfX3Vw\nZGF0ZWQJVTnWOgAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429857354
session:91c61bb90335c7ce33e8ad753ef014d938b71a87                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnWOwAAAAlfX3VwZGF0ZWQJVTnWOwAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDAxMgAAAAlwbGF5ZXJfaWQEAwAAAAMKCemCseS+neWruwAAAARu\nYW1lCgJ5aQAAAAhwYXNzd29yZAoJQjAzMjAwMDEyAAAAAmlkAAAABl9fdXNlcg==\n	1429857355
session:0c822a67f6a838855f1a3fe3d5a6f4b6ca0eddda                        	BQkDAAAABQlVOdY/AAAACV9fY3JlYXRlZAlVOdY/AAAACV9fdXBkYXRlZAoJQjAzMjAwMDk0AAAA\nCXBsYXllcl9pZAQDAAAAAwoJ6YKx562x5bS0AAAABG5hbWUKBHhpYW8AAAAIcGFzc3dvcmQKCUIw\nMzIwMDA5NAAAAAJpZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429857359
session:0025579143f5f6cd5013dfbab45199dcbf987538                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDk0AAAAAmlkCgnpgrHnrbHltLQAAAAEbmFtZQoEeGlhbwAA\nAAhwYXNzd29yZAAAAAZfX3VzZXIKCUIwMzIwMDA5NAAAAAlwbGF5ZXJfaWQJVTnWQwAAAAlfX3Vw\nZGF0ZWQJVTnWQwAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429857363
session:4c21dd03e01c77b6bfde52b4f49fc4f7f8b0438c                        	BQkDAAAABQlVOdZWAAAACV9fdXBkYXRlZAQDAAAAAwoJ5a6L5om/6LuSAAAABG5hbWUKCUIwMzIw\nMDA1NAAAAAJpZAoFY2hlbmcAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNl\ncl9yZWFsbQoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAlVOdZWAAAACV9fY3JlYXRlZA==\n	1429857382
session:80df78e623b0f1ed90ef9ca3d5de697550741312                        	BQkDAAAAAwlVOdZbAAAACV9fY3JlYXRlZAlVOdZbAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVy\nY2lzZQ==\n	1429857387
session:0307ca45bfd7bcdf3b3874627fc7257cf233a808                        	BQkDAAAABQQDAAAAAwoDcGluAAAACHBhc3N3b3JkCgnoqLHlk4HnkKYAAAAEbmFtZQoJQjAzMjAw\nMDc0AAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDc0AAAACXBsYXllcl9pZAlVOdZeAAAACV9fdXBk\nYXRlZAlVOdZeAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429857390
session:409eed3a799d7907a411183d3ae97ee2cfe2bb96                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdZgAAAACV9fY3JlYXRlZAlVOdZgAAAACV9fdXBk\nYXRlZA==\n	1429857392
session:eb9eea1cbe845f90e73b74ae2a464b855703b3a1                        	BQkDAAAABQoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAlVOdZnAAAACV9fY3JlYXRlZAlVOdZnAAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDA1NAAAAAJp\nZAoJ5a6L5om/6LuSAAAABG5hbWUKBWNoZW5nAAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429857399
session:5d1ddcc119a80738be658900e29029c2fffae755                        	BQkDAAAABQlVOdZsAAAACV9fdXBkYXRlZAlVOdZsAAAACV9fY3JlYXRlZAQDAAAAAwoJQjAzMjAw\nMDU0AAAAAmlkCgVjaGVuZwAAAAhwYXNzd29yZAoJ5a6L5om/6LuSAAAABG5hbWUAAAAGX191c2Vy\nCglCMDMyMDAwNTQAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857404
session:c4d2c28cd100867554998dfae29f3a401ada8939                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDU2AAAAAmlkCgnnsKHpgLjmrKMAAAAEbmFtZQoCeWkAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCglCMDMyMDAwNTYAAAAJcGxheWVyX2lkCVU51m0AAAAJX191cGRh\ndGVkCVU51m0AAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857405
session:30caf4a0d2de9254caff40c4877a9287758872ad                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA4OAAAAAlwbGF5ZXJfaWQJ\nVYbSPAAAAAlfX3VwZGF0ZWQJVYbSPAAAAAlfX2NyZWF0ZWQEAwAAAAMKCeefs+aWh+mmqAAAAARu\nYW1lCgN3ZW4AAAAIcGFzc3dvcmQKCUIwMzIwMDA4OAAAAAJpZAAAAAZfX3VzZXI=\n	1434902604
session:5f2615f14bec70bed0abafd51535b3a28ffbf639                        	BQkDAAAABQQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJ6YKx562x5bS0AAAABG5hbWUKCUIwMzIw\nMDA5NAAAAAJpZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVU51noAAAAJX191\ncGRhdGVkCVU51noAAAAJX19jcmVhdGVkCglCMDMyMDAwOTQAAAAJcGxheWVyX2lk\n	1429857418
session:e5111128f2184680812f7b75fe022570645bd55c                        	BQkDAAAABQoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAlVOdaAAAAACV9fY3JlYXRlZAlVOdaAAAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeeUsOa3h+WckgAAAARu\nYW1lCglCMDMyMDAwNDYAAAACaWQKAnFpAAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429857424
session:6f8eeac6ab64d8e8353c4ed59199cbc94fc92b49                        	BQkDAAAABQQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJ6YKx562x5bS0AAAABG5hbWUKCUIwMzIw\nMDA5NAAAAAJpZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVU51oMAAAAJX191\ncGRhdGVkCVU51oMAAAAJX19jcmVhdGVkCglCMDMyMDAwOTQAAAAJcGxheWVyX2lk\n	1429857427
session:b4997407e963abf3681a1ac52c6429978b473e25                        	BQkDAAAABQQDAAAAAwoJ6YKx562x5bS0AAAABG5hbWUKCUIwMzIwMDA5NAAAAAJpZAoEeGlhbwAA\nAAhwYXNzd29yZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVU51oYAAAAJX191\ncGRhdGVkCVU51oYAAAAJX19jcmVhdGVkCglCMDMyMDAwOTQAAAAJcGxheWVyX2lk\n	1429857430
session:f450ca0778fac318d2b6170c52bfd3f25d15d866                        	BQkDAAAAAwlVOdaNAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdaNAAAACV9fdXBk\nYXRlZA==\n	1429857437
session:5c3045f9a872174d0bb21c8a2a96bca502203872                        	BQkDAAAAAwlVOdanAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdanAAAACV9fdXBk\nYXRlZA==\n	1429857463
session:a20fbad95354f56024b2695522db1d439dc12c3c                        	BQkDAAAABQlVOdazAAAACV9fY3JlYXRlZAoJQjAzMjAwMDgyAAAACXBsYXllcl9pZAQDAAAAAwoE\nbWVuZwAAAAhwYXNzd29yZAoJ5ZCz5a2f5aiBAAAABG5hbWUKCUIwMzIwMDA4MgAAAAJpZAAAAAZf\nX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVU51rMAAAAJX191cGRhdGVk\n	1429857475
session:78475eb3772c249876313c31cbde4daddea35f3c                        	BQkDAAAABQlVOda3AAAACV9fY3JlYXRlZAoJQjAzMjAwMDM3AAAACXBsYXllcl9pZAQDAAAAAwoD\nanVuAAAACHBhc3N3b3JkCgnojIPlkJvlhJIAAAAEbmFtZQoJQjAzMjAwMDM3AAAAAmlkAAAABl9f\ndXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnWtwAAAAlfX3VwZGF0ZWQ=\n	1429857479
session:ab3c2d082dc2325072812ca5308cb4e1fd80ee9e                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDk0AAAAAmlkCgR4aWFvAAAACHBhc3N3b3JkCgnpgrHnrbHl\ntLQAAAAEbmFtZQAAAAZfX3VzZXIKCUIwMzIwMDA5NAAAAAlwbGF5ZXJfaWQJVTnWfQAAAAlfX3Vw\nZGF0ZWQJVTnWfQAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429857421
session:191d4afdfc0c119ea51de066dc4f12e442726f10                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDA1NAAAAAJpZAoF\nY2hlbmcAAAAIcGFzc3dvcmQKCeWui+aJv+i7kgAAAARuYW1lAAAABl9fdXNlcgoJQjAzMjAwMDU0\nAAAACXBsYXllcl9pZAlVOdZ+AAAACV9fY3JlYXRlZAlVOdZ+AAAACV9fdXBkYXRlZA==\n	1429857422
session:4d4d1e942ccbeaa82384060d6cf2af9c0efaf111                        	BQkDAAAABQQDAAAAAwoJ5a6L5om/6LuSAAAABG5hbWUKBWNoZW5nAAAACHBhc3N3b3JkCglCMDMy\nMDAwNTQAAAACaWQAAAAGX191c2VyCglCMDMyMDAwNTQAAAAJcGxheWVyX2lkCVU51ooAAAAJX19j\ncmVhdGVkCVU51ooAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857434
session:7a26a4b612f9074dc88d27da2f23b206fc0c849f                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA1NAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBWNoZW5nAAAACHBhc3N3b3JkCgnlrovmib/ou5IAAAAEbmFtZQoJQjAzMjAwMDU0AAAA\nAmlkAAAABl9fdXNlcglVOdacAAAACV9fdXBkYXRlZAlVOdacAAAACV9fY3JlYXRlZA==\n	1429857452
session:5c40c4802e15d00feb8082f752c4bbb603f02dc4                        	BQkDAAAABQlVOdadAAAACV9fY3JlYXRlZAlVOdadAAAACV9fdXBkYXRlZAoJQjAzMjAwMDQ2AAAA\nCXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDQ2AAAAAmlkCgJxaQAAAAhwYXNzd29yZAoJ55Sw5reH\n5ZySAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429857453
session:52619a8da1b8f77a3e0d3a2ca437a44b32319725                        	BQkDAAAABQlVOdagAAAACV9fY3JlYXRlZAlVOdagAAAACV9fdXBkYXRlZAoJQjAzMjAwMDk0AAAA\nCXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDk0AAAAAmlkCgR4aWFvAAAACHBhc3N3b3JkCgnpgrHn\nrbHltLQAAAAEbmFtZQAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429857456
session:08dbc6fd57516cc1d3590f3074928d6f652bee6a                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdalAAAACV9fY3JlYXRlZAlVOdalAAAACV9fdXBk\nYXRlZA==\n	1429857461
session:f127859107ffbff4dca2d4c33ef3062f78c9a30e                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdamAAAACV9fdXBkYXRlZAlVOdamAAAACV9fY3Jl\nYXRlZA==\n	1429857462
session:38e0b5937ef1900ed1c7a5e244fa7b265990e11c                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnWuwAAAAlfX3VwZGF0ZWQJVTnWuwAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDA1NAAAAAlwbGF5ZXJfaWQEAwAAAAMKCeWui+aJv+i7kgAAAARu\nYW1lCglCMDMyMDAwNTQAAAACaWQKBWNoZW5nAAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429857483
session:d95aac209adec18c8f38d87cfc2517e24d2a70e5                        	BQkDAAAACAlVOdbuAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQoH\nZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBHNpYXIAAAAIZXhlcmNpc2UEAwAAAAMKAnlpAAAACHBh\nc3N3b3JkCgnnsKHpgLjmrKMAAAAEbmFtZQoJQjAzMjAwMDU2AAAAAmlkAAAABl9fdXNlcglVOdba\nAAAACV9fY3JlYXRlZAoJQjAzMjAwMDU2AAAACXBsYXllcl9pZA==\n	1429861129
session:7e040465b93f664b53c1e6c3aa4f14e5daf35773                        	BQkDAAAABQlVOddGAAAACV9fdXBkYXRlZAlVOddGAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKCeiMg+WQm+WEkgAAAARuYW1lCglCMDMyMDAwMzcAAAACaWQKA2p1\nbgAAAAhwYXNzd29yZAAAAAZfX3VzZXIKCUIwMzIwMDAzNwAAAAlwbGF5ZXJfaWQ=\n	1429857622
session:97e14bf30ee7e5ccdd2432c6a2678d246223faf7                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUMgAAAAlfX3VwZGF0ZWQKBGNhbGwA\nAAAFZ2VucmUKCUIwMzIwMDAzNAAAAAlwbGF5ZXJfaWQEAwAAAAMKA3NoaQAAAAhwYXNzd29yZAoJ\n6Zmz6Kmp5piAAAAABG5hbWUKCUIwMzIwMDAzNAAAAAJpZAAAAAZfX3VzZXIKAzFKMAAAAAZsZWFn\ndWUJVTnTjAAAAAlfX2NyZWF0ZWQKBHNpYXIAAAAIZXhlcmNpc2U=\n	1429859894
session:ce92818c2c4fde6df7e01a7e20a418d1defee2a0                        	BQkDAAAABQQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJQjAzMjAwMDk0AAAAAmlkCgnpgrHnrbHl\ntLQAAAAEbmFtZQAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVU51v0AAAAJX191\ncGRhdGVkCVU51v0AAAAJX19jcmVhdGVkCglCMDMyMDAwOTQAAAAJcGxheWVyX2lk\n	1429857549
session:4d454d0d30a4f777763d667cb5b5da33b34974a7                        	BQkDAAAAAwlVOdckAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdckAAAACV9fdXBk\nYXRlZA==\n	1429857588
session:da223442b1a87c4bf35f5af774609fc71f020e0c                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoEc2lhcgAAAAhleGVyY2lzZQlVOdcnAAAACV9fY3JlYXRl\nZAoJQjAzMjAwMDg0AAAACXBsYXllcl9pZAQDAAAAAwoJ6YKx552m57+UAAAABG5hbWUKAm11AAAA\nCHBhc3N3b3JkCglCMDMyMDAwODQAAAACaWQAAAAGX191c2VyCgRjYWxsAAAABWdlbnJlCVU52jIA\nAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429861449
session:01cb1b7a5a32b0175c7803a0dc8be9d80929eef2                        	BQkDAAAACAlVOdflAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQoH\nZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBHNpYXIAAAAIZXhlcmNpc2UEAwAAAAMKCeael+aFp+Wo\nnwAAAARuYW1lCglCMDMyMDAwMzkAAAACaWQKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXIKCUIw\nMzIwMDAzOQAAAAlwbGF5ZXJfaWQJVTnXLAAAAAlfX2NyZWF0ZWQ=\n	1429859302
session:883739f63d71c19de2a68687c541b72121f8600a                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQlVOdfYAAAACV9fdXBkYXRlZAoJ\nQjAzMjAwMTA5AAAACXBsYXllcl9pZAlVOde5AAAACV9fY3JlYXRlZAQDAAAAAwoJ5p2O5a6H57a4\nAAAABG5hbWUKCUIwMzIwMDEwOQAAAAJpZAoCeXUAAAAIcGFzc3dvcmQAAAAGX191c2VyCgRzaWFy\nAAAACGV4ZXJjaXNlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429859563
session:0af5d98ecfb6426bb9a2b9a630dea3523e6b1e64                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnWigAAAAlfX3VwZGF0ZWQKBHNpYXIA\nAAAIZXhlcmNpc2UEAwAAAAMKAnlpAAAACHBhc3N3b3JkCgnpgrHkvp3lq7sAAAAEbmFtZQoJQjAz\nMjAwMDEyAAAAAmlkAAAABl9fdXNlcglVOdZ1AAAACV9fY3JlYXRlZAoDMUowAAAABmxlYWd1ZQoJ\nQjAzMjAwMDEyAAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQ==\n	1429861582
session:910a77b6b6e6c9de98154058911006d31bbbfcf2                        	BQkDAAAACAoEc2lhcgAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMK\nBGppbmcAAAAIcGFzc3dvcmQKCUIwMzIwMDA5MwAAAAJpZAoJ5b2t6Z2W5aqbAAAABG5hbWUAAAAG\nX191c2VyCglCMDMyMDAwOTMAAAAJcGxheWVyX2lkCVU518YAAAAJX19jcmVhdGVkCVU519MAAAAJ\nX191cGRhdGVkCgRjYWxsAAAABWdlbnJlCgMxSjAAAAAGbGVhZ3Vl\n	1429857774
session:4128658d48f6b8c7a5bdd3606f787a966a9d1fdd                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoEc2lhcgAAAAhleGVyY2lzZQlVOdb/AAAACV9fY3JlYXRl\nZAoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCeWui+aJ\nv+i7kgAAAARuYW1lCglCMDMyMDAwNTQAAAACaWQAAAAGX191c2VyCgRjYWxsAAAABWdlbnJlCVU5\n1xIAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429859177
session:e58f33c9808d510d3c4609bf71fab3c5857fe46d                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQlVOdbpAAAACV9fdXBkYXRlZAlV\nOdbdAAAACV9fY3JlYXRlZAoJQjAzMjAwMDUyAAAACXBsYXllcl9pZAQDAAAAAwoDamlhAAAACHBh\nc3N3b3JkCglCMDMyMDAwNTIAAAACaWQKCeadjuS9s+WunAAAAARuYW1lAAAABl9fdXNlcgoEc2lh\ncgAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1429861058
session:003dc24fcf0c1553fca72ec41aec4041b3b5b395                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQlVOdcGAAAACV9fY3JlYXRlZAoEY2FsbAAAAAVnZW5yZQoJ\nQjAzMjAwMDkyAAAACXBsYXllcl9pZAoEc2lhcgAAAAhleGVyY2lzZQlVOeaUAAAACV9fdXBkYXRl\nZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKAnlpAAAACHBhc3N3b3JkCglCMDMyMDAw\nOTIAAAACaWQKBuebp+avhQAAAARuYW1lAAAABl9fdXNlcg==\n	1429861595
session:1d4e0586b1f453c025959a2b017c871d7859425b                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQlVOdc2AAAACV9fdXBkYXRlZAlV\nOdciAAAACV9fY3JlYXRlZAoJQjAzMjAwMDk0AAAACXBsYXllcl9pZAQDAAAAAwoEeGlhbwAAAAhw\nYXNzd29yZAoJQjAzMjAwMDk0AAAAAmlkCgnpgrHnrbHltLQAAAAEbmFtZQAAAAZfX3VzZXIKBHNp\nYXIAAAAIZXhlcmNpc2UKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429861621
session:ba823cbf2708d3ee155c99489eab5e9c5ede8025                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMTA2AAAACXBsYXllcl9pZAQDAAAAAwoJQjAz\nMjAwMTA2AAAAAmlkCgnolKHmmI7nv7AAAAAEbmFtZQoEbWluZwAAAAhwYXNzd29yZAAAAAZfX3Vz\nZXIKAzFKMAAAAAZsZWFndWUJVTnXDwAAAAlfX2NyZWF0ZWQKBHNpYXIAAAAIZXhlcmNpc2UKB2Rl\nZmF1bHQAAAAMX191c2VyX3JlYWxtCVU51ysAAAAJX191cGRhdGVk\n	1429859128
session:a28ba9b7bd61fec7850f564e489f69f16f2bb3d5                        	BQkDAAAACAlVOdcIAAAACV9fY3JlYXRlZAoJQjAzMjAwMDc0AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0KBHNpYXIAAAAIZXhlcmNpc2UEAwAAAAMKCUIwMzIwMDA3NAAAAAJp\nZAoJ6Kix5ZOB55CmAAAABG5hbWUKA3BpbgAAAAhwYXNzd29yZAAAAAZfX3VzZXIKBGNhbGwAAAAF\nZ2VucmUKAzFKMAAAAAZsZWFndWUJVTnXHgAAAAlfX3VwZGF0ZWQ=\n	1429861036
session:e8a321721dc8548afc1f779e93288668cf752967                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBHNpYXIAAAAIZXhlcmNpc2UEAwAAAAMK\nA3BlaQAAAAhwYXNzd29yZAoJQjAzMjAwMDc4AAAAAmlkCgnphJLmspvnraAAAAAEbmFtZQAAAAZf\nX3VzZXIJVTnX3wAAAAlfX2NyZWF0ZWQKCUIwMzIwMDA3OAAAAAlwbGF5ZXJfaWQJVTnYUgAAAAlf\nX3VwZGF0ZWQKAzFKMAAAAAZsZWFndWUKBGNhbGwAAAAFZ2VucmU=\n	1429859119
session:e77326e9112fd06f155e5fc12f5a17f758b3abda                        	BQkDAAAAAwlVOddsAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOddsAAAACV9fY3Jl\nYXRlZA==\n	1429857660
session:3ffa6e871e5f47823f6fc413e90b21d15c70427b                        	BQkDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVX/NYAAAAAlfX2NyZWF0ZWQKBGNoYXQA\nAAAIZXhlcmNpc2UJVX/NgQAAAAlfX3VwZGF0ZWQEAwAAAAMKCeael+aAnei+sAAAAARuYW1lCgJz\naQAAAAhwYXNzd29yZAoJQjAzMjAwMDk3AAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDk3AAAACXBs\nYXllcl9pZA==\n	1434442658
session:556a1025bce7334df5ae9a152ee50a87cc545b26                        	BQkDAAAABwoGMTkzMDAxAAAACXBsYXllcl9pZAoEY2hhdAAAAAhleGVyY2lzZQlVgVzHAAAACV9f\ndXBkYXRlZAQDAAAAAwoGMTkzMDAxAAAAAmlkCgZEckJlYW4AAAAEbmFtZQoCb2sAAAAIcGFzc3dv\ncmQAAAAGX191c2VyCVWBXBYAAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoD\nMUowAAAABmxlYWd1ZQ==\n	1434544893
session:f5bb51418fcfe7fd809e8ad25e778870dbcafa67                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnYWAAAAAlfX3VwZGF0ZWQKBHNpYXIA\nAAAIZXhlcmNpc2UEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnpu4Ppg4Hli5sAAAAEbmFtZQoJQjAz\nMjAwMDYwAAAAAmlkAAAABl9fdXNlcglVOdhDAAAACV9fY3JlYXRlZAoDMUowAAAABmxlYWd1ZQoJ\nQjAzMjAwMDYwAAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQ==\n	1429858910
session:26358cf61e2ed8488542a6e4e953f1f679368256                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMDg4AAAACXBsYXllcl9pZAQDAAAAAwoDd2Vu\nAAAACHBhc3N3b3JkCgnnn7PmlofppqgAAAAEbmFtZQoJQjAzMjAwMDg4AAAAAmlkAAAABl9fdXNl\ncgoDMUowAAAABmxlYWd1ZQoEc2lhcgAAAAhleGVyY2lzZQlVOdgcAAAACV9fY3JlYXRlZAoHZGVm\nYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnYPwAAAAlfX3VwZGF0ZWQ=\n	1429860018
session:b47244ee830bf76db8f1066e1dd925bfafdf0d38                        	BQkDAAAACAoJQjAzMjAwMDk3AAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxl\nYWd1ZQlVOdKeAAAACV9fY3JlYXRlZAQDAAAAAwoJQjAzMjAwMDk3AAAAAmlkCgnmnpfmgJ3ovrAA\nAAAEbmFtZQoCc2kAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFs\nbQoEc2lhcgAAAAhleGVyY2lzZQlVOdR3AAAACV9fdXBkYXRlZA==\n	1429861735
session:34e16721d4fc08291e87824771284c115ef0a2f9                        	BQkDAAAACAlVOdizAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQQD\nAAAAAwoJ5by16ZuF5rezAAAABG5hbWUKCUIwMzIwMDA2MgAAAAJpZAoCeWEAAAAIcGFzc3dvcmQA\nAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEc2lhcgAAAAhleGVyY2lzZQoJQjAz\nMjAwMDYyAAAACXBsYXllcl9pZAlVOdhKAAAACV9fY3JlYXRlZA==\n	1429859662
session:abfc3e38df48fa59c8957aac17138e0b7d63c127                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQlVOdWnAAAACV9fY3JlYXRlZAoJQjAzMjAwMDMyAAAACXBs\nYXllcl9pZAoEY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBHNpYXIAAAAI\nZXhlcmNpc2UJVTnVtAAAAAlfX3VwZGF0ZWQEAwAAAAMKCeWui+eri+WptwAAAARuYW1lCglCMDMy\nMDAwMzIAAAACaWQKAmxpAAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429862390
session:407b1750e5898316518d207318c974988159b646                        	BQkDAAAAAwlVOdmUAAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOdmUAAAACV9fY3Jl\nYXRlZA==\n	1429858259
session:93a8b9f0e749e0a85aaf1e29426ea3d963ae35de                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOg7yAAAACV9fY3JlYXRlZAlVOg7yAAAACV9fdXBk\nYXRlZA==\n	1429871912
session:3e29be985519b0375e4017f323f73dff4aa3cc07                        	BQkDAAAABQoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAQDAAAAAwoJQjk5MTEwMDU1AAAAAmlkCgJy\ndQAAAAhwYXNzd29yZAoJ6Kyd5aaC5pm0AAAABG5hbWUAAAAGX191c2VyCVU53JkAAAAJX19jcmVh\ndGVkCVU53JkAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1429858985
session:d44396c7459188a0a08f9f68a0d2b0e6c4e99128                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQlVOdkUAAAACV9fdXBkYXRlZAlV\nOdgnAAAACV9fY3JlYXRlZAoJQjAzMjAwMDEzAAAACXBsYXllcl9pZAQDAAAAAwoEeWluZwAAAAhw\nYXNzd29yZAoJ5rSq56mO6Ie7AAAABG5hbWUKCUIwMzIwMDAxMwAAAAJpZAAAAAZfX3VzZXIKBHNp\nYXIAAAAIZXhlcmNpc2UKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1429860073
session:62812677a7f4e6c47816a79c71fc4d1054d208fc                        	BQkDAAAACAoJQjAzMjAwMDgyAAAACXBsYXllcl9pZAlVOdcRAAAACV9fY3JlYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0KBHNpYXIAAAAIZXhlcmNpc2UEAwAAAAMKCeWQs+Wtn+WogQAAAARu\nYW1lCglCMDMyMDAwODIAAAACaWQKBG1lbmcAAAAIcGFzc3dvcmQAAAAGX191c2VyCgRjYWxsAAAA\nBWdlbnJlCgMxSjAAAAAGbGVhZ3VlCVU51yIAAAAJX191cGRhdGVk\n	1429861666
session:c0c49d594f6654c22485cda94cd18dd45196af0f                        	BQkDAAAACAQDAAAAAwoEamluZwAAAAhwYXNzd29yZAoJQjAzMjAwMDY0AAAAAmlkCgnpu4PpnZbl\nu7cAAAAEbmFtZQAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCgRzaWFyAAAACGV4\nZXJjaXNlCVU52Z0AAAAJX19jcmVhdGVkCglCMDMyMDAwNjQAAAAJcGxheWVyX2lkCVU52bsAAAAJ\nX191cGRhdGVkCgRjYWxsAAAABWdlbnJlCgMxSjAAAAAGbGVhZ3Vl\n	1429858510
session:f5f5f828737dfc55db27597c7ad81aedb4bca4fb                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVOdtyAAAACV9fdXBkYXRlZAlVOdtyAAAACV9fY3Jl\nYXRlZA==\n	1429858798
session:f63fbe94d161577e95da66e5add021947beb54ca                        	BQkDAAAACAlVOdisAAAACV9fY3JlYXRlZAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQoJ\nQjAzMjAwMDM3AAAACXBsYXllcl9pZAlVOdi+AAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lz\nZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKA2p1bgAAAAhwYXNzd29yZAoJ6IyD5ZCb\n5YSSAAAABG5hbWUKCUIwMzIwMDAzNwAAAAJpZAAAAAZfX3VzZXI=\n	1429860679
session:b5f65b565030b69438c311253750d7f0719e43f0                        	BQkDAAAAAwlVOeK1AAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOeK1AAAACV9fY3Jl\nYXRlZA==\n	1429860549
session:25045f14e00d04cdda74fb0a44ca66d5c94613fb                        	BQkDAAAABQoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAlVOeGqAAAACV9fY3JlYXRlZAlVOeGqAAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeisneWmguaZtAAAAARu\nYW1lCglCOTkxMTAwNTUAAAACaWQKAnJ1AAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429860282
session:e29fd11abb2713e2c7789beeee7043170ba24771                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnW7AAAAAlfX3VwZGF0ZWQKBHNpYXIA\nAAAIZXhlcmNpc2UEAwAAAAMKAnFpAAAACHBhc3N3b3JkCgnnlLDmt4flnJIAAAAEbmFtZQoJQjAz\nMjAwMDQ2AAAAAmlkAAAABl9fdXNlcglVOdbfAAAACV9fY3JlYXRlZAoDMUowAAAABmxlYWd1ZQoJ\nQjAzMjAwMDQ2AAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQ==\n	1429861687
session:a49675d9159a926915c2b2d482dc5833c83e18d9                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBHNpYXIAAAAIZXhlcmNpc2UJVTnUuwAA\nAAlfX3VwZGF0ZWQEAwAAAAMKBHpoZW4AAAAIcGFzc3dvcmQKCUIwMzIwMDA4MwAAAAJpZAoG5b6Q\n55SEAAAABG5hbWUAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCVU50yUAAAAJX19jcmVhdGVkCglC\nMDMyMDAwODMAAAAJcGxheWVyX2lkCgRjYWxsAAAABWdlbnJl\n	1429861737
session:b21fe1b10dfb2ad2550de555c26b68fa283752aa                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTni8gAAAAlfX2NyZWF0ZWQJVTni8gAA\nAAlfX3VwZGF0ZWQKCUI5OTExMDA1NQAAAAlwbGF5ZXJfaWQEAwAAAAMKCUI5OTExMDA1NQAAAAJp\nZAoJ6Kyd5aaC5pm0AAAABG5hbWUKAnJ1AAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1429860610
session:88135e19d21c718d76adf234a912fb7a17a6cdff                        	BQkDAAAACAoJQjAzMjAwMDk4AAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQlVOdlRAAAACV9f\nY3JlYXRlZAoDMUowAAAABmxlYWd1ZQQDAAAAAwoJQjAzMjAwMDk4AAAAAmlkCgnlvLXntq3kuK0A\nAAAEbmFtZQoDd2VpAAAACHBhc3N3b3JkAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVh\nbG0JVTnZdQAAAAlfX3VwZGF0ZWQKBHNpYXIAAAAIZXhlcmNpc2U=\n	1429861400
session:730ebbd819befc68036351c22c5ee78d1e5e7949                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMDE4AAAACXBsYXllcl9pZAQDAAAAAwoJ5ZCz\n6LKd5a64AAAABG5hbWUKA2JlaQAAAAhwYXNzd29yZAoJQjAzMjAwMDE4AAAAAmlkAAAABl9fdXNl\ncgoDMUowAAAABmxlYWd1ZQlVOd3PAAAACV9fY3JlYXRlZAoEc2lhcgAAAAhleGVyY2lzZQoHZGVm\nYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnd2wAAAAlfX3VwZGF0ZWQ=\n	1429861976
session:8935394a099111d79cbefbb9733b785d4531a441                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVTnUQAAAAAlfX3VwZGF0ZWQKBGNhbGwA\nAAAFZ2VucmUEAwAAAAMKCeWHvuW+l+iPrwAAAARuYW1lCgJkZQAAAAhwYXNzd29yZAoJQjAzMjAw\nMDUwAAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDUwAAAACXBsYXllcl9pZAlVOdNnAAAACV9fY3Jl\nYXRlZAoDMUowAAAABmxlYWd1ZQoEc2lhcgAAAAhleGVyY2lzZQ==\n	1429860391
session:31801dac2a765e2e8c43b02400cc2d3a438cbc27                        	BQkDAAAACAQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCUIwMzIwMDAwMwAAAAJpZAoJ6Zmz6ZuF5Lqt\nAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEc2lhcgAAAAhleGVy\nY2lzZQlVOde/AAAACV9fdXBkYXRlZAoJQjAzMjAwMDAzAAAACXBsYXllcl9pZAoEY2FsbAAAAAVn\nZW5yZQoDMUowAAAABmxlYWd1ZQlVOdcPAAAACV9fY3JlYXRlZA==\n	1429860798
session:a374e67ffcfdeee162395727192f141707fd36ce                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQlVOdgdAAAACV9fdXBkYXRlZAoJ\nQjAxMjAyMTA2AAAACXBsYXllcl9pZAlVOdODAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3Vz\nZXJfcmVhbG0KBHNpYXIAAAAIZXhlcmNpc2UEAwAAAAMKA2hhbwAAAAhwYXNzd29yZAoJQjAxMjAy\nMTA2AAAAAmlkCgnmsZ/nmpPlrocAAAAEbmFtZQAAAAZfX3VzZXI=\n	1429860777
session:19cc8cb4d4de12a20e1c9829609f5a2e006763ef                        	BQkDAAAACAoJQjAzMjAwMDk3AAAACXBsYXllcl9pZAlVOwpEAAAACV9fY3JlYXRlZAQDAAAAAwoJ\n5p6X5oCd6L6wAAAABG5hbWUKCUIwMzIwMDA5NwAAAAJpZAoCc2kAAAAIcGFzc3dvcmQAAAAGX191\nc2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEc2lhcgAAAAhleGVyY2lzZQoDMUowAAAABmxl\nYWd1ZQoEY2FsbAAAAAVnZW5yZQlVOwpTAAAACV9fdXBkYXRlZA==\n	1429936387
session:5552fcb16665e7b714b8f5489fb8c0e150ef3db5                        	BQkDAAAAAwlVOkn4AAAACV9fdXBkYXRlZAoEc2lhcgAAAAhleGVyY2lzZQlVOkn4AAAACV9fY3Jl\nYXRlZA==\n	1429886984
session:7f3cc031a409efc76a0868061b6f797d6b54831f                        	BQkDAAAAAwoEc2lhcgAAAAhleGVyY2lzZQlVXfqYAAAACV9fY3JlYXRlZAlVXfqYAAAACV9fdXBk\nYXRlZA==\n	1432225959
session:9701078554aace83f36138f5a5e2a37f2ac97faa                        	BQkDAAAACAQDAAAAAwoJ6IOh5pm66YieAAAABG5hbWUKCFYwMTQxMDE4AAAAAmlkCgN6aGkAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCghWMDE0MTAxOAAAAAlwbGF5ZXJfaWQKDGNvbnZlcnNhdGlvbgAA\nAAVnZW5yZQoHRkxBMDAxNwAAAAZsZWFndWUKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVV4KmIA\nAAAJX19jcmVhdGVkCVV4Lf4AAAAJX191cGRhdGVkCgRjbGF5AAAACGV4ZXJjaXNl\n	1433944542
session:af9e7d06911c1877e708ee5196cca14daa149779                        	BQkDAAAACAlVeDFbAAAACV9fdXBkYXRlZAoEY2xheQAAAAhleGVyY2lzZQQDAAAAAwoEeGlhbwAA\nAAhwYXNzd29yZAoIVjAxNDEwMjEAAAACaWQKCeW+kOetseaflAAAAARuYW1lAAAABl9fdXNlcgoI\nVjAxNDEwMjEAAAAJcGxheWVyX2lkCgxjb252ZXJzYXRpb24AAAAFZ2VucmUKB0ZMQTAwMTcAAAAG\nbGVhZ3VlCVV4MN4AAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1433947190
session:365d81a5ee5d3ef9c07f087e168cea5e34568ac7                        	BQkDAAAACAlVeDBGAAAACV9fdXBkYXRlZAoEY2xheQAAAAhleGVyY2lzZQQDAAAAAwoDaHVpAAAA\nCHBhc3N3b3JkCghWMDE0MTAwOAAAAAJpZAoJ5pu+5oWn54+KAAAABG5hbWUAAAAGX191c2VyCgxj\nb252ZXJzYXRpb24AAAAFZ2VucmUKCFYwMTQxMDA4AAAACXBsYXllcl9pZAoHRkxBMDAxNwAAAAZs\nZWFndWUJVXgwJQAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1433944000
session:e83678c3fdc965d0bdf25e33c212f613d3f80dcb                        	BQkDAAAABQlVeDBrAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCFYwMTQx\nMDE4AAAACXBsYXllcl9pZAlVeDBrAAAACV9fdXBkYXRlZAQDAAAAAwoJ6IOh5pm66YieAAAABG5h\nbWUKA3poaQAAAAhwYXNzd29yZAoIVjAxNDEwMTgAAAACaWQAAAAGX191c2Vy\n	1433943819
session:6d503d7045bd958036ce7b700904ea151f1f5461                        	BQkDAAAACAQDAAAAAwoJ6IOh5pm66YieAAAABG5hbWUKCFYwMTQxMDE4AAAAAmlkCgN6aGkAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVenVqAAAACV9fdXBk\nYXRlZAoIVjAxNDEwMTgAAAAJcGxheWVyX2lkCVV6dVUAAAAJX19jcmVhdGVkCgxjb252ZXJzYXRp\nb24AAAAFZ2VucmUKBGNsYXkAAAAIZXhlcmNpc2UKB0ZMQTAwMTcAAAAGbGVhZ3Vl\n	1434092420
session:6c8cd527aa6ad2ab892afdf4f62ff84d4ec87670                        	BQkDAAAABQlVeDBbAAAACV9fdXBkYXRlZAoIVjAxNDEwMTYAAAAJcGxheWVyX2lkBAMAAAADCghW\nMDE0MTAxNgAAAAJpZAoDd2VpAAAACHBhc3N3b3JkCgnlvLXlgYnmo4sAAAAEbmFtZQAAAAZfX3Vz\nZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVV4MFsAAAAJX19jcmVhdGVk\n	1433943659
session:952362f1936e4bb44cc0511a1e8cb9af8067a696                        	BQkDAAAACAoEY2xheQAAAAhleGVyY2lzZQlVeDFMAAAACV9fdXBkYXRlZAlVeC/fAAAACV9fY3Jl\nYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KB0ZMQTAwMTcAAAAGbGVhZ3VlCghWMDE0MTAx\nNgAAAAlwbGF5ZXJfaWQKDGNvbnZlcnNhdGlvbgAAAAVnZW5yZQQDAAAAAwoIVjAxNDEwMTYAAAAC\naWQKA3dlaQAAAAhwYXNzd29yZAoJ5by15YGJ5qOLAAAABG5hbWUAAAAGX191c2Vy\n	1433947067
session:4fd6eac0d4644de4105e8ea511555a01e76973e1                        	BQkDAAAACAQDAAAAAwoEbWluZwAAAAhwYXNzd29yZAoIVjAxNDEwMDIAAAACaWQKCeavm+aYjueP\nigAAAARuYW1lAAAABl9fdXNlcgoMY29udmVyc2F0aW9uAAAABWdlbnJlCghWMDE0MTAwMgAAAAlw\nbGF5ZXJfaWQKB0ZMQTAwMTcAAAAGbGVhZ3VlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVeC+s\nAAAACV9fY3JlYXRlZAlVeC+3AAAACV9fdXBkYXRlZAoEY2xheQAAAAhleGVyY2lzZQ==\n	1433946782
session:1981a14a6d9da83707f7c690959d328463caa84d                        	BQkDAAAABwoGMTkzMDAxAAAACXBsYXllcl9pZAoHRkxBMDAxNwAAAAZsZWFndWUKB2RlZmF1bHQA\nAAAMX191c2VyX3JlYWxtCgRjbGF5AAAACGV4ZXJjaXNlBAMAAAADCgJvawAAAAhwYXNzd29yZAoG\nMTkzMDAxAAAAAmlkCgZEckJlYW4AAAAEbmFtZQAAAAZfX3VzZXIJVXgjRwAAAAlfX2NyZWF0ZWQJ\nVXgjWwAAAAlfX3VwZGF0ZWQ=\n	1433941492
session:d807100c56a283911b60d512db619794a6bdeb21                        	BQkDAAAACAoHRkxBMDAxNwAAAAZsZWFndWUJVXgvwgAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAM\nX191c2VyX3JlYWxtBAMAAAADCgnog6HmmbrpiJ4AAAAEbmFtZQoIVjAxNDEwMTgAAAACaWQKA3po\naQAAAAhwYXNzd29yZAAAAAZfX3VzZXIKCFYwMTQxMDE4AAAACXBsYXllcl9pZAoMY29udmVyc2F0\naW9uAAAABWdlbnJlCgRjbGF5AAAACGV4ZXJjaXNlCVV4MSYAAAAJX191cGRhdGVk\n	1433947221
session:fc52060b3c92c60d955b763f2b62b36d1a42a7d5                        	BQkDAAAACAoMY29udmVyc2F0aW9uAAAABWdlbnJlCghWMDE0MTAxNwAAAAlwbGF5ZXJfaWQEAwAA\nAAMKCemZs+WGoOWEkgAAAARuYW1lCghWMDE0MTAxNwAAAAJpZAoEZ3VhbgAAAAhwYXNzd29yZAAA\nAAZfX3VzZXIJVXgv5AAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCgdGTEEw\nMDE3AAAABmxlYWd1ZQlVeDAxAAAACV9fdXBkYXRlZAoEY2xheQAAAAhleGVyY2lzZQ==\n	1433947056
session:619c7164b1c07cfc5930c95d97cc4806dacf78f7                        	BQkDAAAABQlVeDCFAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMK\nCeW8teWBieajiwAAAARuYW1lCgN3ZWkAAAAIcGFzc3dvcmQKCFYwMTQxMDE2AAAAAmlkAAAABl9f\ndXNlcglVeDCFAAAACV9fdXBkYXRlZAoIVjAxNDEwMTYAAAAJcGxheWVyX2lk\n	1433943701
session:a0a9a35fdf7a5dbefc8e4b88bc94fe68b878ab59                        	BQkDAAAABQoIVjAxNDEwNTUAAAAJcGxheWVyX2lkCVV4MMgAAAAJX191cGRhdGVkBAMAAAADCgnp\nu4Pmn5Tnpo4AAAAEbmFtZQoDcm91AAAACHBhc3N3b3JkCghWMDE0MTA1NQAAAAJpZAAAAAZfX3Vz\nZXIJVXgwyAAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1433944034
session:8f0ae6ffbf8e2253f149c587781c78f8ad8c46a0                        	BQkDAAAAAwlVeZl8AAAACV9fdXBkYXRlZAoEY2xheQAAAAhleGVyY2lzZQlVeZl8AAAACV9fY3Jl\nYXRlZA==\n	1434036110
session:8e1c362dbead4793639020acd0eeae35ceedc95f                        	BQkDAAAACAlVeDArAAAACV9fdXBkYXRlZAoEY2xheQAAAAhleGVyY2lzZQQDAAAAAwoCeWkAAAAI\ncGFzc3dvcmQKCFYwMTQxMDM1AAAAAmlkCgnlkLPnv4rnlIQAAAAEbmFtZQAAAAZfX3VzZXIKDGNv\nbnZlcnNhdGlvbgAAAAVnZW5yZQoIVjAxNDEwMzUAAAAJcGxheWVyX2lkCgdGTEEwMDE3AAAABmxl\nYWd1ZQlVeDAOAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1433945178
session:5a6625a6fe6d8e6b64db02a719088ab2981b3e3a                        	BQkDAAAACAoEY2xheQAAAAhleGVyY2lzZQlVeDEiAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0JVXgwhAAAAAlfX2NyZWF0ZWQKB0ZMQTAwMTcAAAAGbGVhZ3VlCghWMDE0MTAx\nOQAAAAlwbGF5ZXJfaWQKDGNvbnZlcnNhdGlvbgAAAAVnZW5yZQQDAAAAAwoIVjAxNDEwMTkAAAAC\naWQKAnl1AAAACHBhc3N3b3JkCgbpu4PlrocAAAAEbmFtZQAAAAZfX3VzZXI=\n	1433945080
session:edc2cd5c62b27fd127a1c21a0c37547e69377cd5                        	BQkDAAAACAlVeDD1AAAACV9fdXBkYXRlZAoEY2xheQAAAAhleGVyY2lzZQoMY29udmVyc2F0aW9u\nAAAABWdlbnJlCghWMDE0MTAwOQAAAAlwbGF5ZXJfaWQEAwAAAAMKA3poaQAAAAhwYXNzd29yZAoI\nVjAxNDEwMDkAAAACaWQKCem7g+W/l+aziQAAAARuYW1lAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0JVXgw0AAAAAlfX2NyZWF0ZWQKB0ZMQTAwMTcAAAAGbGVhZ3Vl\n	1433946820
session:8be43b8b2c89a2d6619e51a5263b10dd536f4f60                        	BQkDAAAACAoEY2xheQAAAAhleGVyY2lzZQlVeDF/AAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0JVXgxbAAAAAlfX2NyZWF0ZWQKB0ZMQTAwMTcAAAAGbGVhZ3VlCgxjb252ZXJz\nYXRpb24AAAAFZ2VucmUKCFYwMTQxMDI5AAAACXBsYXllcl9pZAQDAAAAAwoIVjAxNDEwMjkAAAAC\naWQKA2thaQAAAAhwYXNzd29yZAoJ6YKx5Yex6JKCAAAABG5hbWUAAAAGX191c2Vy\n	1433947178
session:4f32208caa07bab8bcc08cc3b9d1a60646c0db2a                        	BQkDAAAAAwlVeqO2AAAACV9fdXBkYXRlZAlVeqO2AAAACV9fY3JlYXRlZAoEY2xheQAAAAhleGVy\nY2lzZQ==\n	1434104262
session:94c9d0e3bd519859f4812e8420bb97df90b81db5                        	BQkDAAAABwlVf7jJAAAACV9fY3JlYXRlZAoGMTkzMDAxAAAACXBsYXllcl9pZAoDMUowAAAABmxl\nYWd1ZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNoYXQAAAAIZXhlcmNpc2UJVX+43AAAAAlf\nX3VwZGF0ZWQEAwAAAAMKBkRyQmVhbgAAAARuYW1lCgJvawAAAAhwYXNzd29yZAoGMTkzMDAxAAAA\nAmlkAAAABl9fdXNlcg==\n	1434437423
session:09514a1ca9d4f7ab1bd5e753c7169bd40c43537e                        	BQkDAAAABgoEY2hhdAAAAAhleGVyY2lzZQlVf8sUAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0KCUIwMzIwMDA0NgAAAAlwbGF5ZXJfaWQJVX/LUAAAAAlfX3VwZGF0ZWQEAwAA\nAAMKAnFpAAAACHBhc3N3b3JkCgnnlLDmt4flnJIAAAAEbmFtZQoJQjAzMjAwMDQ2AAAAAmlkAAAA\nBl9fdXNlcg==\n	1434442085
session:8dfcd084bbe25fbd83b18a97e1bdef6bde0833c3                        	BQkDAAAAAwlVgWjNAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVgWjNAAAACV9fY3Jl\nYXRlZA==\n	1434547933
session:b85b8bd19f24d21b129f2f025d349de730741229                        	BQkDAAAACAlVgWkCAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVgWjyAAAACV9fY3Jl\nYXRlZAQDAAAAAwoJ5ZCz57+K55SEAAAABG5hbWUKCFYwMTQxMDM1AAAAAmlkCgJ5aQAAAAhwYXNz\nd29yZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCghWMDE0MTAzNQAAAAlwbGF5\nZXJfaWQKDGNvbnZlcnNhdGlvbgAAAAVnZW5yZQoHRkxBMDAxNwAAAAZsZWFndWU=\n	1434550693
session:72dbc62ed6880278b00fc50410a174488d23343b                        	BQkDAAAACAlVgWYjAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMK\nCFYwMTQxMDE5AAAAAmlkCgJ5dQAAAAhwYXNzd29yZAoG6buD5a6HAAAABG5hbWUAAAAGX191c2Vy\nCVWBaOwAAAAJX191cGRhdGVkCgRjaGF0AAAACGV4ZXJjaXNlCgdGTEEwMDE3AAAABmxlYWd1ZQoI\nVjAxNDEwMTkAAAAJcGxheWVyX2lkCgxjb252ZXJzYXRpb24AAAAFZ2VucmU=\n	1434549131
session:7ce3642d397946486575fa9766fb512a67830402                        	BQkDAAAACAQDAAAAAwoEemhlbgAAAAhwYXNzd29yZAoIVjAxNDEwMTIAAAACaWQKCeW9reaMr+a1\nqQAAAARuYW1lAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYFo+gAAAAlfX2Ny\nZWF0ZWQKBGNoYXQAAAAIZXhlcmNpc2UJVYFpFQAAAAlfX3VwZGF0ZWQKB0ZMQTAwMTcAAAAGbGVh\nZ3VlCgxjb252ZXJzYXRpb24AAAAFZ2VucmUKCFYwMTQxMDEyAAAACXBsYXllcl9pZA==\n	1434550967
session:ed05bbe83f52dec02444370717c0c9a816362646                        	BQkDAAAACAoMY29udmVyc2F0aW9uAAAABWdlbnJlCghWMDE0MTAwOQAAAAlwbGF5ZXJfaWQKB0ZM\nQTAwMTcAAAAGbGVhZ3VlCgRjaGF0AAAACGV4ZXJjaXNlCVWBaNoAAAAJX191cGRhdGVkCgdkZWZh\ndWx0AAAADF9fdXNlcl9yZWFsbQQDAAAAAwoDemhpAAAACHBhc3N3b3JkCghWMDE0MTAwOQAAAAJp\nZAoJ6buD5b+X5rOJAAAABG5hbWUAAAAGX191c2VyCVWBaKcAAAAJX19jcmVhdGVk\n	1434550034
session:f10a9810b9cb00fec3af7925120e015eb58fdc89                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQoMY29udmVyc2F0aW9uAAAABWdlbnJlCgdGTEEwMDE3\nAAAABmxlYWd1ZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCFYwMTQxMDI4AAAACXBsYXllcl9p\nZAQDAAAAAwoIVjAxNDEwMjgAAAACaWQKCeWui+e0q+WptwAAAARuYW1lCgJ6aQAAAAhwYXNzd29y\nZAAAAAZfX3VzZXIJVYFpAQAAAAlfX2NyZWF0ZWQJVYFpCgAAAAlfX3VwZGF0ZWQ=\n	1434549667
session:31fceb512b9d8a8ad0bd7aa744dc080467cda569                        	BQkDAAAACAoIVjAxNDEwMjYAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoH\nRkxBMDAxNwAAAAZsZWFndWUKBGNoYXQAAAAIZXhlcmNpc2UKDGNvbnZlcnNhdGlvbgAAAAVnZW5y\nZQlVgWlgAAAACV9fdXBkYXRlZAQDAAAAAwoIVjAxNDEwMjYAAAACaWQKCeWCheaso+iqvAAAAARu\nYW1lCgN4aW4AAAAIcGFzc3dvcmQAAAAGX191c2VyCVWBaTwAAAAJX19jcmVhdGVk\n	1434550910
session:ce07c44915bb7eb208bba0efb3dd0898a9f27225                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQoMY29udmVyc2F0aW9uAAAABWdlbnJlCgdGTEEwMDE3\nAAAABmxlYWd1ZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCFYwMTQxMDIxAAAACXBsYXllcl9p\nZAQDAAAAAwoIVjAxNDEwMjEAAAACaWQKCeW+kOetseaflAAAAARuYW1lCgR4aWFvAAAACHBhc3N3\nb3JkAAAABl9fdXNlcglVgWmSAAAACV9fY3JlYXRlZAlVgWmkAAAACV9fdXBkYXRlZA==\n	1434551619
session:2e477a19b237b35eae713be145205563712c727b                        	BQkDAAAACAlVgWkhAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVgWkTAAAACV9fY3Jl\nYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeWQs+S6juWrpQAAAARuYW1lCgJ5\ndQAAAAhwYXNzd29yZAoIVjAxNDEwMDMAAAACaWQAAAAGX191c2VyCghWMDE0MTAwMwAAAAlwbGF5\nZXJfaWQKDGNvbnZlcnNhdGlvbgAAAAVnZW5yZQoHRkxBMDAxNwAAAAZsZWFndWU=\n	1434551703
session:7dd6d9a748ba2715e0c38c10ab42b90e7c1c4f26                        	BQkDAAAACAlVgWj/AAAACV9fdXBkYXRlZAlVgWW+AAAACV9fY3JlYXRlZAQDAAAAAwoJ6YKx5Yex\n6JKCAAAABG5hbWUKA2thaQAAAAhwYXNzd29yZAoIVjAxNDEwMjkAAAACaWQAAAAGX191c2VyCgdk\nZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoIVjAxNDEwMjkAAAAJcGxheWVyX2lkCgxjb252ZXJzYXRp\nb24AAAAFZ2VucmUKBGNoYXQAAAAIZXhlcmNpc2UKB0ZMQTAwMTcAAAAGbGVhZ3Vl\n	1434551370
session:724624ee48e770ec7b57b6947cb2eb85f63257f9                        	BQkDAAAACAoHRkxBMDAxNwAAAAZsZWFndWUKCFYwMTQxMDAxAAAACXBsYXllcl9pZAoMY29udmVy\nc2F0aW9uAAAABWdlbnJlCVWBaTMAAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFs\nbQQDAAAAAwoJ6JSh56uL55GLAAAABG5hbWUKCFYwMTQxMDAxAAAAAmlkCgJsaQAAAAhwYXNzd29y\nZAAAAAZfX3VzZXIJVYFpTQAAAAlfX3VwZGF0ZWQKBGNoYXQAAAAIZXhlcmNpc2U=\n	1434551762
session:f7317f638ed33c759b1d46eb130ff3842676834a                        	BQkDAAAACAlVgWUvAAAACV9fY3JlYXRlZAQDAAAAAwoDemhpAAAACHBhc3N3b3JkCghWMDE0MTAx\nOAAAAAJpZAoJ6IOh5pm66YieAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQoEY2hhdAAAAAhleGVyY2lzZQlVgWiOAAAACV9fdXBkYXRlZAoHRkxBMDAxNwAAAAZsZWFn\ndWUKCFYwMTQxMDE4AAAACXBsYXllcl9pZAoMY29udmVyc2F0aW9uAAAABWdlbnJl\n	1434550914
session:c0cc577408196339d9d0c0c9288339ab8b9b5909                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQoMY29udmVyc2F0aW9uAAAABWdlbnJlCgdGTEEwMDE3\nAAAABmxlYWd1ZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCFYwMTQxMDExAAAACXBsYXllcl9p\nZAQDAAAAAwoJ6Y2+6IKy6ZyWAAAABG5hbWUKAnl1AAAACHBhc3N3b3JkCghWMDE0MTAxMQAAAAJp\nZAAAAAZfX3VzZXIJVYFpLQAAAAlfX2NyZWF0ZWQJVYFpPQAAAAlfX3VwZGF0ZWQ=\n	1434551775
session:d13305cfb6281fd14fedff4a4e822d316eae5a58                        	BQkDAAAACAlVgWmRAAAACV9fY3JlYXRlZAQDAAAAAwoJ546L57at5ZCbAAAABG5hbWUKA3dlaQAA\nAAhwYXNzd29yZAoIVjAwNDEwNTUAAAACaWQAAAAGX191c2VyCVWBaaUAAAAJX191cGRhdGVkCgxj\nb252ZXJzYXRpb24AAAAFZ2VucmUKBGNoYXQAAAAIZXhlcmNpc2UKB0ZMQTAwMTcAAAAGbGVhZ3Vl\nCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoIVjAwNDEwNTUAAAAJcGxheWVyX2lk\n	1434551668
session:b9779ebd83aac42dedf48b78aa08846d16ca1085                        	BQkDAAAACAoIVjAxNDEwMTYAAAAJcGxheWVyX2lkCgxjb252ZXJzYXRpb24AAAAFZ2VucmUKB0ZM\nQTAwMTcAAAAGbGVhZ3VlCgRjaGF0AAAACGV4ZXJjaXNlCVWBaQsAAAAJX191cGRhdGVkCVWBaOkA\nAAAJX19jcmVhdGVkBAMAAAADCgN3ZWkAAAAIcGFzc3dvcmQKCFYwMTQxMDE2AAAAAmlkCgnlvLXl\ngYnmo4sAAAAEbmFtZQAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1434550990
session:71f5ba8a04e11a57be9318c53caf8e5d90ba9c05                        	BQkDAAAACAoIVjAxNDEwMjIAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoH\nRkxBMDAxNwAAAAZsZWFndWUKDGNvbnZlcnNhdGlvbgAAAAVnZW5yZQoEY2hhdAAAAAhleGVyY2lz\nZQlVgWkNAAAACV9fdXBkYXRlZAlVgWj3AAAACV9fY3JlYXRlZAQDAAAAAwoJ6Zmz5a6l6JOBAAAA\nBG5hbWUKA3lvdQAAAAhwYXNzd29yZAoIVjAxNDEwMjIAAAACaWQAAAAGX191c2Vy\n	1434549642
session:b30ec79720584eca1b930446bcb323493c0427a5                        	BQkDAAAACAoMY29udmVyc2F0aW9uAAAABWdlbnJlCghWMDE0MTAyMwAAAAlwbGF5ZXJfaWQKB0ZM\nQTAwMTcAAAAGbGVhZ3VlCgRjaGF0AAAACGV4ZXJjaXNlCVWBaT8AAAAJX191cGRhdGVkCgdkZWZh\ndWx0AAAADF9fdXNlcl9yZWFsbQQDAAAAAwoJ5a6L57Sr5aaCAAAABG5hbWUKCFYwMTQxMDIzAAAA\nAmlkCgJ6aQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVYFpLwAAAAlfX2NyZWF0ZWQ=\n	1434550017
session:450e9bb1ef1207235440a31c3c789246212c71f0                        	BQkDAAAACAoIVjAxNDEwMDgAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoH\nRkxBMDAxNwAAAAZsZWFndWUKBGNoYXQAAAAIZXhlcmNpc2UKDGNvbnZlcnNhdGlvbgAAAAVnZW5y\nZQlVgWmNAAAACV9fdXBkYXRlZAQDAAAAAwoIVjAxNDEwMDgAAAACaWQKA2h1aQAAAAhwYXNzd29y\nZAoJ5pu+5oWn54+KAAAABG5hbWUAAAAGX191c2VyCVWBaXQAAAAJX19jcmVhdGVk\n	1434551816
session:cab0f9d84a094e1fb0e518a752a161ddd630acac                        	BQkDAAAACAoIVjAxNDEwMDIAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoH\nRkxBMDAxNwAAAAZsZWFndWUKBGNoYXQAAAAIZXhlcmNpc2UKDGNvbnZlcnNhdGlvbgAAAAVnZW5y\nZQlVgWkYAAAACV9fdXBkYXRlZAQDAAAAAwoIVjAxNDEwMDIAAAACaWQKCeavm+aYjuePigAAAARu\nYW1lCgRtaW5nAAAACHBhc3N3b3JkAAAABl9fdXNlcglVgWkOAAAACV9fY3JlYXRlZA==\n	1434551304
session:fda2d2e7f969256bcee26cada0c934b38d126a24                        	BQkDAAAACAQDAAAAAwoJQjAzMjAwMDk3AAAAAmlkCgJzaQAAAAhwYXNzd29yZAoJ5p6X5oCd6L6w\nAAAABG5hbWUAAAAGX191c2VyCglCMDMyMDAwOTcAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9f\ndXNlcl9yZWFsbQoEY2FsbAAAAAVnZW5yZQoEY2hhdAAAAAhleGVyY2lzZQlVhrm5AAAACV9fdXBk\nYXRlZAoDMUowAAAABmxlYWd1ZQlVhrmnAAAACV9fY3JlYXRlZA==\n	1434896480
session:b5c8a27bd8168af23a8e691e9e40096bcde53764                        	BQkDAAAABwlVhlYeAAAACV9fY3JlYXRlZAoDMUowAAAABmxlYWd1ZQlVhlY0AAAACV9fdXBkYXRl\nZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAAAAMKBjE5\nMzAwMQAAAAJpZAoCb2sAAAAIcGFzc3dvcmQKBkRyQmVhbgAAAARuYW1lAAAABl9fdXNlcgoEY2hh\ndAAAAAhleGVyY2lzZQ==\n	1434871587
session:0d2214e3dd9e6ecf20166c61a580927e4f1b223c                        	BQkDAAAACAoHRkxBMDAxNwAAAAZsZWFndWUJVYJ4PgAAAAlfX3VwZGF0ZWQKB2RlZmF1bHQAAAAM\nX191c2VyX3JlYWxtCgxjb252ZXJzYXRpb24AAAAFZ2VucmUJVYJ4GAAAAAlfX2NyZWF0ZWQKBGNo\nYXQAAAAIZXhlcmNpc2UEAwAAAAMKCFYwMTQxMDE4AAAAAmlkCgnog6HmmbrpiJ4AAAAEbmFtZQoD\nemhpAAAACHBhc3N3b3JkAAAABl9fdXNlcgoIVjAxNDEwMTgAAAAJcGxheWVyX2lk\n	1434617494
session:2f00933b3b4f8ce5d57c6d347a6f088105137b2f                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVgXE6AAAACV9fdXBkYXRlZAlVgXE6AAAACV9fY3Jl\nYXRlZA==\n	1434550091
session:12134c4f1f57186dc66813e62f116d4a1d2e19b3                        	BQkDAAAAAwlVgWrXAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVgWrXAAAACV9fdXBk\nYXRlZA==\n	1434548455
session:a46f1fe64057837413ef50323a928cb31d404eb4                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVhp96AAAACV9fdXBkYXRlZAlVhp96AAAACV9fY3Jl\nYXRlZA==\n	1434889612
session:50429014db496474fe9bee70b789b0131269158d                        	BQkDAAAACAlVgW69AAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVyY2lzZQQDAAAAAwoIVjk5NDEw\nNzcAAAACaWQKA3dlaQAAAAhwYXNzd29yZAoJ6Zmz6Z+L5b+XAAAABG5hbWUAAAAGX191c2VyCghW\nOTk0MTA3NwAAAAlwbGF5ZXJfaWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCgdGTEEwMDE3AAAA\nBmxlYWd1ZQlVgW7MAAAACV9fdXBkYXRlZAoMY29udmVyc2F0aW9uAAAABWdlbnJl\n	1434549627
session:91e3e1cda0888e58ce8d69d477b79f2580f47e2e                        	BQkDAAAABwoEY2hhdAAAAAhleGVyY2lzZQoMY29udmVyc2F0aW9uAAAABWdlbnJlBAMAAAADCgnp\ngrHkvp3lq7sAAAAEbmFtZQoCeWkAAAAIcGFzc3dvcmQKCUIwMzIwMDAxMgAAAAJpZAAAAAZfX3Vz\nZXIJVYF4xgAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVWBeOsAAAAJX191\ncGRhdGVkCglCMDMyMDAwMTIAAAAJcGxheWVyX2lk\n	1434552163
session:615229a2d7391518598c0e662dc58d8fbbdc9748                        	BQkDAAAAAwlVgZRiAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVgZRiAAAACV9fdXBk\nYXRlZA==\n	1434559090
session:dd0c6a754de7c17bd735a3be81be30e5613f0cfd                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCFYwMTQxMDU0AAAACXBsYXllcl9pZAoE\nY2hhdAAAAAhleGVyY2lzZQoMY29udmVyc2F0aW9uAAAABWdlbnJlCgdGTEEwMDE3AAAABmxlYWd1\nZQlVgjIyAAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X6Zuo5r2UAAAABG5hbWUKAnl1AAAACHBhc3N3\nb3JkCghWMDE0MTA1NAAAAAJpZAAAAAZfX3VzZXIJVYIyLgAAAAlfX2NyZWF0ZWQ=\n	1434599490
session:5acc32ed39cb7201692d82bf8e9c2645830c361a                        	BQkDAAAACAoHRkxBMDAxNwAAAAZsZWFndWUKBGNoYXQAAAAIZXhlcmNpc2UKDGNvbnZlcnNhdGlv\nbgAAAAVnZW5yZQoIVjAxNDEwMjUAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFs\nbQQDAAAAAwoJ5p6X5ZiJ55yfAAAABG5hbWUKA2ppYQAAAAhwYXNzd29yZAoIVjAxNDEwMjUAAAAC\naWQAAAAGX191c2VyCVWBaTwAAAAJX19jcmVhdGVkCVWBaaUAAAAJX191cGRhdGVk\n	1434551650
session:ac1f388aebd96d2b70720ffc50bb945fce3dbd19                        	BQkDAAAABwQDAAAAAwoCc2kAAAAIcGFzc3dvcmQKCeael+aAnei+sAAAAARuYW1lCglCMDMyMDAw\nOTcAAAACaWQAAAAGX191c2VyCVWGX9YAAAAJX191cGRhdGVkCgRjaGF0AAAACGV4ZXJjaXNlCgxj\nb252ZXJzYXRpb24AAAAFZ2VucmUKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVWGX8MAAAAJX19j\ncmVhdGVkCglCMDMyMDAwOTcAAAAJcGxheWVyX2lk\n	1434873429
session:4b87b48af9cab5cb98006f2ca2a09213131581a0                        	BQkDAAAABwoJQjAzMjAwMDEyAAAACXBsYXllcl9pZAlVgj2wAAAACV9fdXBkYXRlZAoEY2hhdAAA\nAAhleGVyY2lzZQoMY29udmVyc2F0aW9uAAAABWdlbnJlCVWCPaIAAAAJX19jcmVhdGVkBAMAAAAD\nCgJ5aQAAAAhwYXNzd29yZAoJQjAzMjAwMDEyAAAAAmlkCgnpgrHkvp3lq7sAAAAEbmFtZQAAAAZf\nX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1434602432
session:e5766752f1cf3721dffc84582087739ac50c9ef1                        	BQkDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYZaKAAAAAlfX2NyZWF0ZWQKBjE5MzAw\nMQAAAAlwbGF5ZXJfaWQEAwAAAAMKBkRyQmVhbgAAAARuYW1lCgJvawAAAAhwYXNzd29yZAoGMTkz\nMDAxAAAAAmlkAAAABl9fdXNlcglVhlo7AAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQoEY2hh\ndAAAAAhleGVyY2lzZQ==\n	1434871883
session:440d786fba54b6ce29ebda997a2ab3880d4db51d                        	BQkDAAAACAlVgo7QAAAACV9fdXBkYXRlZAlVgo68AAAACV9fY3JlYXRlZAQDAAAAAwoJ6buD5aaC\n5aaYAAAABG5hbWUKAnJ1AAAACHBhc3N3b3JkCghWMDE0MTA0NgAAAAJpZAAAAAZfX3VzZXIKB2Rl\nZmF1bHQAAAAMX191c2VyX3JlYWxtCghWMDE0MTA0NgAAAAlwbGF5ZXJfaWQKDGNvbnZlcnNhdGlv\nbgAAAAVnZW5yZQoEY2hhdAAAAAhleGVyY2lzZQoHRkxBMDAxNwAAAAZsZWFndWU=\n	1434624371
session:51606f50a6ccf535184754aa5229ac0d879e8a19                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVhpsHAAAACV9fdXBkYXRlZAlVhpsHAAAACV9fY3Jl\nYXRlZA==\n	1434888473
session:a6901f375d7cfd449ce71d17e0c0cea4a1c70bfd                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQoEY2FsbAAAAAVnZW5yZQlVhrkpAAAACV9fdXBkYXRl\nZAoDMUowAAAABmxlYWd1ZQlVhrPbAAAACV9fY3JlYXRlZAQDAAAAAwoJQjAzMjAwMDk3AAAAAmlk\nCgnmnpfmgJ3ovrAAAAAEbmFtZQoCc2kAAAAIcGFzc3dvcmQAAAAGX191c2VyCglCMDMyMDAwOTcA\nAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1434896186
session:6fe76ba21447aaae1a4fefd54f3ecfbf71d25aa8                        	BQkDAAAABgoGMTkzMDAxAAAACXBsYXllcl9pZAlVhrBBAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAA\nAAxfX3VzZXJfcmVhbG0KBGNoYXQAAAAIZXhlcmNpc2UEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcglVhrBaAAAACV9fdXBkYXRlZA==\n	1434893930
session:ed660f816b10c67e95188c81990401e22eec96eb                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNhbGwAAAAFZ2VucmUKAzFKMAAAAAZs\nZWFndWUEAwAAAAMKAnFpAAAACHBhc3N3b3JkCgnnlLDmt4flnJIAAAAEbmFtZQoJQjAzMjAwMDQ2\nAAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAlVhsA1AAAACV9fdXBkYXRl\nZAlVhr+8AAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVyY2lzZQ==\n	1434902875
session:54c49c97bd4e9f898f87d6c6d57097e0cd54fad7                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDk3AAAAAmlkCgJzaQAAAAhwYXNzd29yZAoJ5p6X5oCd6L6w\nAAAABG5hbWUAAAAGX191c2VyCVWG0XsAAAAJX19jcmVhdGVkCglCMDMyMDAwOTcAAAAJcGxheWVy\nX2lkCVWG0XsAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1434902455
session:646668dcd123c387fb0644c868b5ad37b13e46bc                        	BQkDAAAAAwlVhtIZAAAACV9fY3JlYXRlZAlVhtIZAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434902569
session:e66cfecbf19f91d592f87c71832880a6951d642d                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYbSYQAAAAlfX3VwZGF0ZWQKCUIwMzIw\nMDA4OAAAAAlwbGF5ZXJfaWQJVYbSYQAAAAlfX2NyZWF0ZWQEAwAAAAMKCUIwMzIwMDA4OAAAAAJp\nZAoDd2VuAAAACHBhc3N3b3JkCgnnn7PmlofppqgAAAAEbmFtZQAAAAZfX3VzZXI=\n	1434902641
session:6bec37cba139f9bc157b50968d1af502dbdf5fd5                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYe8swAAAAlf\nX2NyZWF0ZWQKBGNoYXQAAAAIZXhlcmNpc2UKAzFKMAAAAAZsZWFndWUKCUIwMzIwMDA3NAAAAAlw\nbGF5ZXJfaWQJVYe8zwAAAAlfX3VwZGF0ZWQEAwAAAAMKCeioseWTgeeQpgAAAARuYW1lCglCMDMy\nMDAwNzQAAAACaWQKA3BpbgAAAAhwYXNzd29yZAAAAAZfX3VzZXI=\n	1434962699
session:f2d98d7478770faf8992538bb48bd975b0894280                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVhtQdAAAACV9fdXBkYXRlZAlVhtQdAAAACV9fY3Jl\nYXRlZA==\n	1434903085
session:c924cd379a21385b2c8213e468a1807eb67c786b                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQlVh02lAAAACV9fdXBkYXRlZAoJQjAzMjAwMDUwAAAA\nCXBsYXllcl9pZAlVh019AAAACV9fY3JlYXRlZAQDAAAAAwoJQjAzMjAwMDUwAAAAAmlkCgnlh77l\nvpfoj68AAAAEbmFtZQoCZGUAAAAIcGFzc3dvcmQAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCgdk\nZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEY2FsbAAAAAVnZW5yZQ==\n	1434937825
session:a69be4feab19162693f1a6b0c090373dcea356cb                        	BQkDAAAAAwlVh1awAAAACV9fY3JlYXRlZAlVh1awAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434936513
session:c9800221994e98f5ddff7b3a16bedd53f0e6eb79                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KAzFKMAAAAAZs\nZWFndWUJVYbX5AAAAAlfX2NyZWF0ZWQKCUIwMzIwMDA4OAAAAAlwbGF5ZXJfaWQJVYbYBgAAAAlf\nX3VwZGF0ZWQEAwAAAAMKCUIwMzIwMDA4OAAAAAJpZAoJ55+z5paH6aaoAAAABG5hbWUKA3dlbgAA\nAAhwYXNzd29yZAAAAAZfX3VzZXIKBGNoYXQAAAAIZXhlcmNpc2U=\n	1434905628
session:c373c36659edb696e1aec93965c77122448f3b8b                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQQDAAAAAwoJQjAzMjAwMDc4AAAAAmlkCgnphJLmspvn\nraAAAAAEbmFtZQoDcGVpAAAACHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDc4AAAACXBsYXll\ncl9pZAlVhtdWAAAACV9fdXBkYXRlZAlVhtb2AAAACV9fY3JlYXRlZAoDMUowAAAABmxlYWd1ZQoE\nY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434903928
session:0b2190be64b52930677f4da3a34b67023604929b                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNhbGwAAAAF\nZ2VucmUKBGNoYXQAAAAIZXhlcmNpc2UJVYdY4wAAAAlfX3VwZGF0ZWQJVYdY2wAAAAlfX2NyZWF0\nZWQKCUIwMzIwMDA0NgAAAAlwbGF5ZXJfaWQEAwAAAAMKAnFpAAAACHBhc3N3b3JkCgnnlLDmt4fl\nnJIAAAAEbmFtZQoJQjAzMjAwMDQ2AAAAAmlkAAAABl9fdXNlcg==\n	1434937129
session:8c3a9105ec36870b431c036736ba96d8436a60d1                        	BQkDAAAAAwlVhtREAAAACV9fY3JlYXRlZAlVhtREAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434903126
session:452d8cf1258599346c17041c70dbcdb007004744                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVhtN0AAAACV9fdXBkYXRlZAlVhtN0AAAACV9fY3Jl\nYXRlZA==\n	1434902917
session:5106fccda4ea570637a62bb8fdd0bf01078264f6                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQlVhtSWAAAACV9fdXBkYXRlZAoJQjAzMjAwMDg0AAAA\nCXBsYXllcl9pZAlVhtH5AAAACV9fY3JlYXRlZAQDAAAAAwoCbXUAAAAIcGFzc3dvcmQKCemCseed\npue/lAAAAARuYW1lCglCMDMyMDAwODQAAAACaWQAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCgdk\nZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEY2FsbAAAAAVnZW5yZQ==\n	1434903825
session:495e4400c4e29d444b1ab644555a5cd16828c430                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVhtOkAAAACV9fdXBkYXRlZAlVhtOkAAAACV9fY3Jl\nYXRlZA==\n	1434902966
session:70a10e122c903c54afc5f94b8ee143b800cd2fe1                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVhtVOAAAACV9fY3JlYXRlZAlVhtVOAAAACV9fdXBk\nYXRlZA==\n	1434903390
session:fc363ffd5614c8fcbea6741355ee83078ab3cd95                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNhbGwAAAAF\nZ2VucmUKBGNoYXQAAAAIZXhlcmNpc2UEAwAAAAMKCUIwMzIwMDAwMwAAAAJpZAoJ6Zmz6ZuF5Lqt\nAAAABG5hbWUKAnlhAAAACHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDAzAAAACXBsYXllcl9p\nZAlVhtLIAAAACV9fY3JlYXRlZAlVhtaMAAAACV9fdXBkYXRlZA==\n	1434905754
session:f82ef59fecbcb6000ecdfed7eafcdabfe4bc4b2e                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KBGNoYXQAAAAIZXhlcmNpc2UKCUIwMzIwMDAxMwAAAAlwbGF5ZXJfaWQJVYbUJwAAAAlf\nX3VwZGF0ZWQJVYbTugAAAAlfX2NyZWF0ZWQEAwAAAAMKBHlpbmcAAAAIcGFzc3dvcmQKCea0quep\njuiHuwAAAARuYW1lCglCMDMyMDAwMTMAAAACaWQAAAAGX191c2Vy\n	1434905026
session:d537b6015aff7edc717d38a58325d93f9ecb1cd5                        	BQkDAAAACAoJQjAzMjAwMTAyAAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0E\nAwAAAAMKCUIwMzIwMDEwMgAAAAJpZAoJ5p2O5oCh5a6jAAAABG5hbWUKAnlpAAAACHBhc3N3b3Jk\nAAAABl9fdXNlcglVhrhfAAAACV9fY3JlYXRlZAoEY2FsbAAAAAVnZW5yZQoEY2hhdAAAAAhleGVy\nY2lzZQoDMUowAAAABmxlYWd1ZQlVhrjvAAAACV9fdXBkYXRlZA==\n	1434905828
session:786a51dcdabfdc3cc1682f3e360268400bbb989b                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNhbGwAAAAFZ2VucmUKAzFKMAAAAAZs\nZWFndWUJVYbUrQAAAAlfX2NyZWF0ZWQKCUIwMzIwMDAzMQAAAAlwbGF5ZXJfaWQJVYbUygAAAAlf\nX3VwZGF0ZWQEAwAAAAMKA3NodQAAAAhwYXNzd29yZAoJ6JGJ5pu45pm0AAAABG5hbWUKCUIwMzIw\nMDAzMQAAAAJpZAAAAAZfX3VzZXIKBGNoYXQAAAAIZXhlcmNpc2U=\n	1434904004
session:1b6e0e831b0b9c275cdd1a44080619a88b8ae140                        	BQkDAAAACAoJQjAzMjAwMDc4AAAACXBsYXllcl9pZAlVhtiqAAAACV9fY3JlYXRlZAlVhtjnAAAA\nCV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDc4AAAAAmlkCgNwZWkAAAAIcGFzc3dvcmQKCemEkuay\nm+etoAAAAARuYW1lAAAABl9fdXNlcgoEY2hhdAAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxfX3Vz\nZXJfcmVhbG0KBGNhbGwAAAAFZ2VucmUKAzFKMAAAAAZsZWFndWU=\n	1434905918
session:2964626fb5154dbffc3b505a17b48a3f23990dec                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQlVhtRAAAAACV9fY3JlYXRlZAoJQjAzMjAwMDYyAAAA\nCXBsYXllcl9pZAlVhtRcAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDYyAAAAAmlkCgJ5YQAA\nAAhwYXNzd29yZAoJ5by16ZuF5rezAAAABG5hbWUAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCgdk\nZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEY2FsbAAAAAVnZW5yZQ==\n	1434906842
session:d8c4409fe485f73217d5774924e21582cee712c1                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJ\nVYfFdwAAAAlfX2NyZWF0ZWQJVYfFdwAAAAlfX3VwZGF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARu\nYW1lCgNodWkAAAAIcGFzc3dvcmQKCUIwMzIwMDAzOQAAAAJpZAAAAAZfX3VzZXI=\n	1434964871
session:5709cc7df63273147103314eb06066ea702c9f76                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVh72rAAAACV9fdXBkYXRlZAlVh72rAAAACV9fY3Jl\nYXRlZA==\n	1434962905
session:118c3df8180741600decf2e3c8d1409ae5ff0fd5                        	BQkDAAAAAwlVh8TtAAAACV9fY3JlYXRlZAlVh8TtAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434964733
session:360a7e00f90bdb2d7b8668b3ccd27130840e3bd2                        	BQkDAAAAAwlVh8WWAAAACV9fY3JlYXRlZAlVh8WWAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434964902
session:828c0e8a413528e64454d9b21eedb347e3d79ee1                        	BQkDAAAABQQDAAAAAwoDaHVpAAAACHBhc3N3b3JkCglCMDMyMDAwMzkAAAACaWQKCeael+aFp+Wo\nnwAAAARuYW1lAAAABl9fdXNlcglVh8WiAAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAlVh8WiAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434964914
session:5c0ad9ddbb63da854d03c2ce17031243e9ae43a2                        	BQkDAAAAAwlVh8W9AAAACV9fdXBkYXRlZAlVh8W9AAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434964941
session:5b2690ac63f2d12eec84930c88b4916ade762b02                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAlVh8XLAAAACV9fY3JlYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeael+aFp+WonwAAAARuYW1lCglCMDMyMDAwMzkAAAAC\naWQKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVYfFywAAAAlfX3VwZGF0ZWQ=\n	1434964955
session:89fc4e86394195be9018d2c913526192d7f73a97                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVh8XuAAAACV9fY3JlYXRlZAlVh8XuAAAACV9fdXBk\nYXRlZA==\n	1434964990
session:b97613ade7ec9c7cfad0624e5d88584323b80533                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJ\nVYfGCgAAAAlfX2NyZWF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARuYW1lCglCMDMyMDAwMzkAAAAC\naWQKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVYfGCgAAAAlfX3VwZGF0ZWQ=\n	1434965017
session:0b8e9e0f59c590cbbc1fd5f39f04c1f5f0bb82e8                        	BQkDAAAABQlVh8YlAAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAA\nAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlkAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJVYfGJQAAAAlfX2NyZWF0ZWQ=\n	1434965045
session:812920a239165db26f72d305363303153c95fd82                        	BQkDAAAABQQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAw\nMDM5AAAAAmlkAAAABl9fdXNlcglVh8bZAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJVYfG2QAAAAlfX2NyZWF0ZWQ=\n	1434965225
session:1ff0ba39e356c3c31cab15c33b501c8f7872fa98                        	BQkDAAAABQlVh8boAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDAzOQAAAAJpZAoDaHVpAAAACHBhc3N3b3Jk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfG6AAAAAlfX3VwZGF0ZWQ=\n	1434965240
session:46617c23883911893ab4831cfa379dec8c5f76de                        	BQkDAAAABQlVh8b+AAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAI\ncGFzc3dvcmQKCeael+aFp+WonwAAAARuYW1lAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJVYfG/gAAAAlfX2NyZWF0ZWQ=\n	1434965261
session:4e561ca77ebea61d99ee9bc66bc8289dd05c9c34                        	BQkDAAAABQlVh8cNAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeael+aFp+WonwAAAARuYW1lCgNodWkAAAAIcGFzc3dv\ncmQKCUIwMzIwMDAzOQAAAAJpZAAAAAZfX3VzZXIJVYfHDQAAAAlfX3VwZGF0ZWQ=\n	1434965277
session:a2d40c0d6962eb3e5c3012f21a500cc90e257d6c                        	BQkDAAAABQlVh8cUAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeael+aFp+WonwAAAARuYW1lCglCMDMyMDAwMzkAAAAC\naWQKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVYfHFAAAAAlfX3VwZGF0ZWQ=\n	1434965284
session:14f7c55e0190fec53aa097c9b96ab4599227b013                        	BQkDAAAABQlVh8cZAAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAA\nAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAlVh8cZAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434965289
session:4ad7b051446f8e59c59d32acb6f9b6483509fc7a                        	BQkDAAAABQlVh8dEAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAI\ncGFzc3dvcmQKCeael+aFp+WonwAAAARuYW1lAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJVYfHRAAAAAlfX2NyZWF0ZWQ=\n	1434965332
session:76d463a6b76d7b70092b65426102e48b4f1adea2                        	BQkDAAAABQlVh8dVAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYfHVQAAAAlfX3VwZGF0ZWQEAwAAAAMKA2h1aQAAAAhwYXNzd29y\nZAoJQjAzMjAwMDM5AAAAAmlkCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXI=\n	1434965349
session:17301fab1040ba05162c24a6791052b3cde88f66                        	BQkDAAAABQlVh8dbAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYfHWwAAAAlfX3VwZGF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARu\nYW1lCglCMDMyMDAwMzkAAAACaWQKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXI=\n	1434965355
session:78872095a01bdabe6b779b4f30f94a9674509935                        	BQkDAAAABQlVh8eAAAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAA\nAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlkAAAABl9fdXNlcglVh8eAAAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434965392
session:7edb2d1c09ec26955fa2ed3ccf902a09a3986bb1                        	BQkDAAAABQlVh8egAAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKCUIwMzIw\nMDAzOQAAAAJpZAoDaHVpAAAACHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfHoAAAAAlfX2NyZWF0ZWQ=\n	1434965423
session:6f81d78dccf63577381ad8e19a4012dda16b71bd                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJ\nVYfH0gAAAAlfX2NyZWF0ZWQEAwAAAAMKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfH0gAAAAlfX3VwZGF0ZWQ=\n	1434965474
session:be7bbdfa1be049c71d8bbaaa93ffbbdd34290116                        	BQkDAAAABQlVh8ffAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfH3wAAAAlfX3VwZGF0ZWQ=\n	1434965487
session:2e6c9875cac815cc7bf70022d833fb5473157367                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVh8ftAAAACV9fY3JlYXRlZAlVh8ftAAAACV9fdXBk\nYXRlZA==\n	1434965501
session:dfc6735a6eca1acfe48147d8e09358db7366a63b                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0J\nVYfIBQAAAAlfX2NyZWF0ZWQEAwAAAAMKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfIBQAAAAlfX3VwZGF0ZWQ=\n	1434965525
session:bd0531cb1e1f99a2a922d03fac2ce9b9d91f5808                        	BQkDAAAABQQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAw\nMDM5AAAAAmlkAAAABl9fdXNlcglVh8gXAAAACV9fdXBkYXRlZAlVh8gXAAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434965543
session:768826bccc148e5af6d1e982d7661a19cccca49f                        	BQkDAAAAAwlVh8gxAAAACV9fY3JlYXRlZAlVh8gxAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434965569
session:dd7317983767f82c97ce9b9dc8f7248f45ca9809                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJ\nVYfIVgAAAAlfX2NyZWF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARuYW1lCgNodWkAAAAIcGFzc3dv\ncmQKCUIwMzIwMDAzOQAAAAJpZAAAAAZfX3VzZXIJVYfIVgAAAAlfX3VwZGF0ZWQ=\n	1434965606
session:996918dc9c35200425bc32e111d3584af6a206e4                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJ\nVYfImwAAAAlfX2NyZWF0ZWQJVYfImwAAAAlfX3VwZGF0ZWQEAwAAAAMKA2h1aQAAAAhwYXNzd29y\nZAoJQjAzMjAwMDM5AAAAAmlkCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXI=\n	1434965675
session:ad183b25652e6db6841f8fb32311446bb722a662                        	BQkDAAAABQQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKCUIwMzIwMDAzOQAAAAJpZAoDaHVpAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcglVh8ihAAAACV9fdXBkYXRlZAlVh8ihAAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434965681
session:dd73efbbb2a9a3341d6f37aa0c0e32c0ddb78766                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAlVh8kDAAAACV9fY3JlYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDAzOQAAAAJpZAoDaHVpAAAACHBhc3N3b3Jk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfJAwAAAAlfX3VwZGF0ZWQ=\n	1434965779
session:9fa4c4d662716ef85253ff431914b2b489cf1c47                        	BQkDAAAABQlVh8kIAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYfJCAAAAAlfX3VwZGF0ZWQEAwAAAAMKCUIwMzIwMDAzOQAAAAJp\nZAoDaHVpAAAACHBhc3N3b3JkCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXI=\n	1434965784
session:251cfa2c36378da50b74b8c7ec55c09ddf83518d                        	BQkDAAAABQQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKCUIwMzIwMDAzOQAAAAJpZAoDaHVpAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcglVh8kNAAAACV9fdXBkYXRlZAlVh8kNAAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434965789
session:c671f504410b7c94232a391242f8e13960dcb518                        	BQkDAAAABQlVh8kSAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDAzOQAAAAJpZAoDaHVpAAAACHBhc3N3b3Jk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfJEgAAAAlfX3VwZGF0ZWQ=\n	1434965794
session:96a0a0cfa9081ac5a2cc2c0ada714199bb1340db                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAIcGFzc3dvcmQKCeael+aFp+Wo\nnwAAAARuYW1lAAAABl9fdXNlcglVh8kZAAAACV9fdXBkYXRlZAlVh8kZAAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434965801
session:a0b3f9ef095c79a7b1d89cf72c093d1e70dcb9e8                        	BQkDAAAABQQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAw\nMDM5AAAAAmlkAAAABl9fdXNlcglVh8koAAAACV9fdXBkYXRlZAlVh8koAAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434965816
session:6516768619a4cd18e3568e52944c519fa6f7a015                        	BQkDAAAAAwlVh8ltAAAACV9fdXBkYXRlZAlVh8ltAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434965885
session:8f07538924d2fde72e285aa4f9fee1a0c8ddc684                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJ\nVYfJeAAAAAlfX2NyZWF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARuYW1lCgNodWkAAAAIcGFzc3dv\ncmQKCUIwMzIwMDAzOQAAAAJpZAAAAAZfX3VzZXIJVYfJeAAAAAlfX3VwZGF0ZWQ=\n	1434965896
session:dd2e39e38d7c7236e6f6529816496ca312059d28                        	BQkDAAAABQQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKCUIwMzIwMDAzOQAAAAJpZAoDaHVpAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcglVh8l/AAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfJfwAAAAlfX2NyZWF0ZWQ=\n	1434965903
session:ae0093023b14e5f050a433afdfe996a63d879b62                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0J\nVYfJnQAAAAlfX2NyZWF0ZWQJVYfJnQAAAAlfX3VwZGF0ZWQEAwAAAAMKCUIwMzIwMDAzOQAAAAJp\nZAoDaHVpAAAACHBhc3N3b3JkCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXI=\n	1434965933
session:bf658330efe9e601e80fc0a041100bb19292eaf1                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAlVh8mjAAAACV9fY3JlYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYfJowAAAAlfX3VwZGF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARu\nYW1lCgNodWkAAAAIcGFzc3dvcmQKCUIwMzIwMDAzOQAAAAJpZAAAAAZfX3VzZXI=\n	1434965938
session:51bf5fe4cb18ee1fb104399e24fb59543ba1afd9                        	BQkDAAAABQlVh8mxAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAI\ncGFzc3dvcmQKCeael+aFp+WonwAAAARuYW1lAAAABl9fdXNlcglVh8mxAAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434965953
session:97437e5068595a7b071c3a36d728ca0b89bc3d16                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJ\nVYfJtgAAAAlfX2NyZWF0ZWQEAwAAAAMKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfJtgAAAAlfX3VwZGF0ZWQ=\n	1434965957
session:14c6476bd95a776d5903204ad459ac09e13d7e34                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVh8n3AAAACV9fdXBkYXRlZAlVh8n3AAAACV9fY3Jl\nYXRlZA==\n	1434966023
session:95b884446016b7c7102289bfd58eea1dfe81326b                        	BQkDAAAABQlVh8oCAAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKCUIwMzIw\nMDAzOQAAAAJpZAoDaHVpAAAACHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfKAgAAAAlfX2NyZWF0ZWQ=\n	1434966033
session:5d51bf9b5bec59df38834c1dab8643d5874d25b6                        	BQkDAAAABQQDAAAAAwoDaHVpAAAACHBhc3N3b3JkCglCMDMyMDAwMzkAAAACaWQKCeael+aFp+Wo\nnwAAAARuYW1lAAAABl9fdXNlcglVh8oWAAAACV9fdXBkYXRlZAlVh8oWAAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434966054
session:8d7434394fe3e83be4e73a5b6bf138f4d08ab54d                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAlVh8orAAAACV9fY3JlYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYfKKwAAAAlfX3VwZGF0ZWQEAwAAAAMKA2h1aQAAAAhwYXNzd29y\nZAoJQjAzMjAwMDM5AAAAAmlkCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXI=\n	1434966075
session:ddd395087045404c322236d0300f3e17b501f2c8                        	BQkDAAAABQlVh8o3AAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAI\ncGFzc3dvcmQKCeael+aFp+WonwAAAARuYW1lAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJVYfKNwAAAAlfX2NyZWF0ZWQ=\n	1434966087
session:9af27f2c519b7df96892fc231bd06e6b931acbb3                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0J\nVYfKPAAAAAlfX2NyZWF0ZWQJVYfKPAAAAAlfX3VwZGF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARu\nYW1lCglCMDMyMDAwMzkAAAACaWQKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXI=\n	1434966092
session:889bbf4a9ab9b0cec1744ded0573fb6b18f59f66                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJ\nVYfKQAAAAAlfX2NyZWF0ZWQEAwAAAAMKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfKQAAAAAlfX3VwZGF0ZWQ=\n	1434966096
session:0dbcb7f7211c528677252235a12dcf17cec8aa5e                        	BQkDAAAABQQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKCUIwMzIwMDAzOQAAAAJpZAoDaHVpAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcglVh8ppAAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAlVh8ppAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434966137
session:600898e3b1a4673754a820fb0f51e3babbe6ac8a                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAlVh8p/AAAACV9fY3JlYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYfKfwAAAAlfX3VwZGF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARu\nYW1lCglCMDMyMDAwMzkAAAACaWQKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXI=\n	1434966158
session:e3e48e326a7367864bcc2294ee2bb91744c4682f                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0J\nVYfKhAAAAAlfX2NyZWF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARuYW1lCglCMDMyMDAwMzkAAAAC\naWQKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVYfKhAAAAAlfX3VwZGF0ZWQ=\n	1434966164
session:2de94ae8e2c52084c2e5cde938f8ae0e961dda3b                        	BQkDAAAABQlVh8rqAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYfK6gAAAAlfX3VwZGF0ZWQEAwAAAAMKCUIwMzIwMDAzOQAAAAJp\nZAoDaHVpAAAACHBhc3N3b3JkCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXI=\n	1434966266
session:504f0cb06a533c2c1b6c4a44fc9ff5c0727a2fe1                        	BQkDAAAABQlVh8ryAAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAA\nAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAlVh8ryAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434966274
session:a113435c62ff587ccd9f64a85d1fe9880344bcdb                        	BQkDAAAABQlVh8r3AAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAI\ncGFzc3dvcmQKCeael+aFp+WonwAAAARuYW1lAAAABl9fdXNlcglVh8r3AAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434966279
session:5bbfd3fd52755bf60be6310c119be4b4e73a413f                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVh85eAAAACV9fdXBkYXRlZAlVh85eAAAACV9fY3Jl\nYXRlZA==\n	1434967150
session:19c736b8bd72a01fc72dd93d9ed98c1d9e0d8c7a                        	BQkDAAAABQlVh85rAAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKCUIwMzIw\nMDAzOQAAAAJpZAoDaHVpAAAACHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfOawAAAAlfX2NyZWF0ZWQ=\n	1434967163
session:17ad1d5c4902a242a4eb90b0421f6ee3ef7be804                        	BQkDAAAABQlVh85xAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAI\ncGFzc3dvcmQKCeael+aFp+WonwAAAARuYW1lAAAABl9fdXNlcglVh85xAAAACV9fY3JlYXRlZAoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434967169
session:268b76e177aec1ba14fd0613d3b565f6ad01f1f0                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0J\nVYfOigAAAAlfX2NyZWF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARuYW1lCgNodWkAAAAIcGFzc3dv\ncmQKCUIwMzIwMDAzOQAAAAJpZAAAAAZfX3VzZXIJVYfOigAAAAlfX3VwZGF0ZWQ=\n	1434967194
session:133730bad3e13c6ee38bcbe3b5ecfb6b409e0815                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0J\nVYfOpQAAAAlfX2NyZWF0ZWQEAwAAAAMKCUIwMzIwMDAzOQAAAAJpZAoDaHVpAAAACHBhc3N3b3Jk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfOpQAAAAlfX3VwZGF0ZWQ=\n	1434967221
session:5b853a3ae155ceaf7a28359c22611587016213b0                        	BQkDAAAABQQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAw\nMDM5AAAAAmlkAAAABl9fdXNlcglVh86tAAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAlVh86tAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434967229
session:0ed79a24a5440806f24d5054610c27af7e692375                        	BQkDAAAABQlVh863AAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAI\ncGFzc3dvcmQKCeael+aFp+WonwAAAARuYW1lAAAABl9fdXNlcgoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfOtwAAAAlfX2NyZWF0ZWQ=\n	1434967239
session:9e9bed1915593329356a28728e47cf1c92caede8                        	BQkDAAAAAwlVh87NAAAACV9fdXBkYXRlZAlVh87NAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434967261
session:9f46e55f2f4f5882f9aa575db164d05262fa08d5                        	BQkDAAAABQQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAw\nMDM5AAAAAmlkAAAABl9fdXNlcglVh87bAAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfO2wAAAAlfX2NyZWF0ZWQ=\n	1434967275
session:c651f69f1aab1050ab6860ecf6cd27610aed4c48                        	BQkDAAAABQlVh87gAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeael+aFp+WonwAAAARuYW1lCgNodWkAAAAIcGFzc3dv\ncmQKCUIwMzIwMDAzOQAAAAJpZAAAAAZfX3VzZXIJVYfO4AAAAAlfX3VwZGF0ZWQ=\n	1434967280
session:d89c72cfa48bd722873f51a75047dbc4911e4572                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAIcGFzc3dvcmQKCeael+aFp+Wo\nnwAAAARuYW1lAAAABl9fdXNlcglVh87xAAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfO8QAAAAlfX2NyZWF0ZWQ=\n	1434967297
session:a8d42b9736735b77466066398a0497cb7a20a14b                        	BQkDAAAABQQDAAAAAwoDaHVpAAAACHBhc3N3b3JkCglCMDMyMDAwMzkAAAACaWQKCeael+aFp+Wo\nnwAAAARuYW1lAAAABl9fdXNlcglVh871AAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfO9QAAAAlfX2NyZWF0ZWQ=\n	1434967301
session:030470e5909fa9d17a6fe263e3f90ac01d09c0f6                        	BQkDAAAABQlVh876AAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAA\nAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfO+gAAAAlfX2NyZWF0ZWQ=\n	1434967306
session:d7d213ddd18f5bc557efef0a5ee7bbb5bcf3c1fd                        	BQkDAAAAAwlVh9COAAAACV9fY3JlYXRlZAlVh9COAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434967710
session:da590599e64ab1433a7ce36f8433aae4bcc94be9                        	BQkDAAAABQlVh9CfAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAI\ncGFzc3dvcmQKCeael+aFp+WonwAAAARuYW1lAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJVYfQnwAAAAlfX2NyZWF0ZWQ=\n	1434967727
session:4eb40b7fed0e05b759136bda47a2eb8ee07184f2                        	BQkDAAAABQlVh9CpAAAACV9fY3JlYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYfQqQAAAAlfX3VwZGF0ZWQEAwAAAAMKCUIwMzIwMDAzOQAAAAJp\nZAoDaHVpAAAACHBhc3N3b3JkCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXI=\n	1434967737
session:0d9e6151da0610d3ab1edf4ecd08797903e7cd3a                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVh9fNAAAACV9fdXBkYXRlZAlVh9fNAAAACV9fY3Jl\nYXRlZA==\n	1434969565
session:cdac99b356c33837f81aa0247621ed734a91b1b2                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJ\nVYfX2QAAAAlfX2NyZWF0ZWQEAwAAAAMKCeael+aFp+WonwAAAARuYW1lCglCMDMyMDAwMzkAAAAC\naWQKA2h1aQAAAAhwYXNzd29yZAAAAAZfX3VzZXIJVYfX2QAAAAlfX3VwZGF0ZWQ=\n	1434969577
session:23b612b65f0d94c86dc3d5dac2f211257c7d417c                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0J\nVYfX3gAAAAlfX2NyZWF0ZWQEAwAAAAMKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfX3gAAAAlfX3VwZGF0ZWQ=\n	1434969582
session:fd029ce148c7cea84b06717c6f9c4304515fddd8                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJ\nVYfX4gAAAAlfX2NyZWF0ZWQEAwAAAAMKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlk\nCgnmnpfmhaflqJ8AAAAEbmFtZQAAAAZfX3VzZXIJVYfX4gAAAAlfX3VwZGF0ZWQ=\n	1434969586
session:240d45a6043cc47a74a7aac17c2e58231ab58b1a                        	BQkDAAAABQQDAAAAAwoDaHVpAAAACHBhc3N3b3JkCglCMDMyMDAwMzkAAAACaWQKCeael+aFp+Wo\nnwAAAARuYW1lAAAABl9fdXNlcglVh9ggAAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAlVh9ggAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434969648
session:295f091b6a81661fc50a3b07d0d6797841102904                        	BQkDAAAABQlVh9gwAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgNodWkAAAAI\ncGFzc3dvcmQKCeael+aFp+WonwAAAARuYW1lAAAABl9fdXNlcgoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfYMAAAAAlfX2NyZWF0ZWQ=\n	1434969664
session:e895e4258fab1a86ea257ee59dd0ea41a099dcb5                        	BQkDAAAAAwlVh9z9AAAACV9fdXBkYXRlZAlVh9z9AAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434970893
session:e58ad88035c2cc152ef64be7819e8747a5fdc211                        	BQkDAAAABQlVh90XAAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKCUIwMzIw\nMDAzOQAAAAJpZAoDaHVpAAAACHBhc3N3b3JkAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJVYfdFwAAAAlfX2NyZWF0ZWQ=\n	1434970919
session:bc93c2afd17ef322bbe98d0c4f2ac90982b20ed6                        	BQkDAAAABQQDAAAAAwoDaHVpAAAACHBhc3N3b3JkCglCMDMyMDAwMzkAAAACaWQKCeael+aFp+Wo\nnwAAAARuYW1lAAAABl9fdXNlcglVh92+AAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAlVh92+AAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1434971086
session:3682d29cd81cc027c8280090c1e2e186df54e718                        	BQkDAAAABwQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCeW+kOmDgeaDoAAAAARuYW1lCghWMDE0MTA1\nMQAAAAJpZAAAAAZfX3VzZXIKCFYwMTQxMDUxAAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQoE\nY2hhdAAAAAhleGVyY2lzZQlViWUHAAAACV9fdXBkYXRlZAlViWTgAAAACV9fY3JlYXRlZAoHZGVm\nYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1435071255
session:bd9aeb106eecde57c0b287f8645f270eda43b600                        	BQkDAAAACAlVh92qAAAACV9fdXBkYXRlZAQDAAAAAwoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAA\nAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoDMUowAAAABmxlYWd1ZQoEY2hhdAAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0JVYfdhAAAAAlfX2NyZWF0ZWQKBGNhbGwAAAAFZ2VucmU=\n	1434972359
session:c7c457ec0ca9b57d5b4558ef91e3b6e1e6b2cad1                        	BQkDAAAAAwlVh93JAAAACV9fdXBkYXRlZAlVh93JAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434971215
session:966ffdcc3c1ee7cf0b3ac0682de89998b1656973                        	BQkDAAAAAwlVh97RAAAACV9fdXBkYXRlZAlVh97RAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434971361
session:8e147c3182ada19b849ce95d34f8191a15e3109b                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCeewoemAuOasowAA\nAARuYW1lCglCMDMyMDAwNTYAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFs\nbQoEY2hhdAAAAAhleGVyY2lzZQoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMDU2AAAACXBsYXllcl9p\nZAlVij8uAAAACV9fY3JlYXRlZAlVij9UAAAACV9fdXBkYXRlZA==\n	1435127835
session:5a1322882a4bb588c055459fae1af5befc91c738                        	BQkDAAAABwoEY2FsbAAAAAVnZW5yZQQDAAAAAwoJ6buD5aaC5aaYAAAABG5hbWUKCFYwMTQxMDQ2\nAAAAAmlkCgJydQAAAAhwYXNzd29yZAAAAAZfX3VzZXIKCFYwMTQxMDQ2AAAACXBsYXllcl9pZAlV\niX6dAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVh\nbG0JVYl+jQAAAAlfX2NyZWF0ZWQ=\n	1435077805
session:3715f75d96c3989804f1c4e43903dbb80b0d2e1e                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVh+C4AAAACV9fdXBkYXRlZAlVh+C4AAAACV9fY3Jl\nYXRlZA==\n	1434971848
session:5f254163713bccbea1d4a6c2167e3f7c18e6fdc3                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYfmEwAAAAlf\nX3VwZGF0ZWQKCUIwMzIwMDAyOQAAAAlwbGF5ZXJfaWQKBGNhbGwAAAAFZ2VucmUKBGNoYXQAAAAI\nZXhlcmNpc2UJVYfl/AAAAAlfX2NyZWF0ZWQEAwAAAAMKCUIwMzIwMDAyOQAAAAJpZAoJ6Y2+5a6a\n6LuSAAAABG5hbWUKBGRpbmcAAAAIcGFzc3dvcmQAAAAGX191c2Vy\n	1434976270
session:21534079a29b981bd811a01ef7ba6dbabb17680b                        	BQkDAAAACAQDAAAAAwoDcGluAAAACHBhc3N3b3JkCglCMDMyMDAwNzQAAAACaWQKCeioseWTgeeQ\npgAAAARuYW1lAAAABl9fdXNlcglVh+CdAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQoJQjAzMjAwMDc0AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0JVYfgvwAAAAlfX3VwZGF0ZWQKAzFKMAAAAAZsZWFndWU=\n	1434976580
session:eedf1ee25a23d6684a3487192de91181b3f6b510                        	BQkDAAAABQlVjOGJAAAACV9fdXBkYXRlZAoJQjAzMjAwMDMyAAAACXBsYXllcl9pZAQDAAAAAwoJ\nQjAzMjAwMDMyAAAAAmlkCgnlrovnq4vlqbcAAAAEbmFtZQoCbGkAAAAIcGFzc3dvcmQAAAAGX191\nc2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVjOGJAAAACV9fY3JlYXRlZA==\n	1435299737
session:569838e009ffd900dcf5efeef17f85fea7b24ca8                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNoYXQAAAAIZXhlcmNpc2UKAzFKMAAA\nAAZsZWFndWUEAwAAAAMKCeiMg+WQm+WEkgAAAARuYW1lCglCMDMyMDAwMzcAAAACaWQKA2p1bgAA\nAAhwYXNzd29yZAAAAAZfX3VzZXIJVYotfwAAAAlfX2NyZWF0ZWQJVYotogAAAAlfX3VwZGF0ZWQK\nBGNhbGwAAAAFZ2VucmUKCUIwMzIwMDAzNwAAAAlwbGF5ZXJfaWQ=\n	1435123139
session:5ee2553c35091c15142d34a85e9dcbe254056766                        	BQkDAAAACAQDAAAAAwoCcWkAAAAIcGFzc3dvcmQKCeeUsOa3h+WckgAAAARuYW1lCglCMDMyMDAw\nNDYAAAACaWQAAAAGX191c2VyCVWH9zAAAAAJX19jcmVhdGVkCgRjaGF0AAAACGV4ZXJjaXNlCgRj\nYWxsAAAABWdlbnJlCglCMDMyMDAwNDYAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQlVh/emAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQ==\n	1434977720
session:cc0979ad0e091bbf0621ab5998158af16024e824                        	BQkDAAAACAQDAAAAAwoCc2kAAAAIcGFzc3dvcmQKCUIwMzIwMDA5NwAAAAJpZAoJ5p6X5oCd6L6w\nAAAABG5hbWUAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCgRjaGF0AAAACGV4ZXJjaXNlCgdkZWZh\ndWx0AAAADF9fdXNlcl9yZWFsbQoJQjAzMjAwMDk3AAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5y\nZQlVilNsAAAACV9fdXBkYXRlZAlVilNQAAAACV9fY3JlYXRlZA==\n	1435134663
session:38ce9286294f50075311ba31fd8662cabf6555d0                        	BQkDAAAAAwlViBsLAAAACV9fY3JlYXRlZAlViBsLAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1434986779
session:bc97ead1b0ba50ffdea0d01dc7a564592086d8c0                        	BQkDAAAACAoJQjAzMjAwMDEyAAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQlVii7sAAAACV9f\nY3JlYXRlZAlVijIVAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQQDAAAAAwoJ6YKx5L6d5au7\nAAAABG5hbWUKCUIwMzIwMDAxMgAAAAJpZAoCeWkAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZh\ndWx0AAAADF9fdXNlcl9yZWFsbQoEY2hhdAAAAAhleGVyY2lzZQ==\n	1435124519
session:056c0d77e06cfd49aa248d26580590ef955e2f6a                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQQDAAAAAwoDamlhAAAACHBhc3N3b3JkCglCMDMyMDAwNTIA\nAAACaWQKCeadjuS9s+WunAAAAARuYW1lAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVh\nbG0KBGNoYXQAAAAIZXhlcmNpc2UKCUIwMzIwMDA1MgAAAAlwbGF5ZXJfaWQKBGNhbGwAAAAFZ2Vu\ncmUJVYn+WAAAAAlfX2NyZWF0ZWQJVYn+cgAAAAlfX3VwZGF0ZWQ=\n	1435110817
session:c8c5c2a223ac57dea420c3c23e97a94c643a8aea                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVilzlAAAACV9fdXBkYXRlZAlVilzlAAAACV9fY3Jl\nYXRlZA==\n	1435134709
session:0b8ad31ff7c4cb9f38db7871b921603ab009b1b1                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQQDAAAAAwoCc2kAAAAIcGFzc3dvcmQKCUIwMzIwMDA5NwAA\nAAJpZAoJ5p6X5oCd6L6wAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFs\nbQoEY2hhdAAAAAhleGVyY2lzZQoJQjAzMjAwMDk3AAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5y\nZQlVil4YAAAACV9fY3JlYXRlZAlVil40AAAACV9fdXBkYXRlZA==\n	1435146974
session:31a7ed119f08ffe0dc5bbe520e90baffedab1926                        	BQkDAAAABQoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDM5AAAAAmlkCgnm\nnpfmhaflqJ8AAAAEbmFtZQoDaHVpAAAACHBhc3N3b3JkAAAABl9fdXNlcgoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0JVYpc8gAAAAlfX2NyZWF0ZWQJVYpc8gAAAAlfX3VwZGF0ZWQ=\n	1435134722
session:80dd4efff3320553f055663ea622c7d213177dc1                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMK\nCUIwMzIwMDAzOQAAAAJpZAoJ5p6X5oWn5aifAAAABG5hbWUKA2h1aQAAAAhwYXNzd29yZAAAAAZf\nX3VzZXIKAzFKMAAAAAZsZWFndWUJVYpeJQAAAAlfX3VwZGF0ZWQJVYpeEAAAAAlfX2NyZWF0ZWQK\nCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQKBGNhbGwAAAAFZ2VucmU=\n	1435136818
session:c53121d10c56994fde6645490958f07da9fc87b6                        	BQkDAAAACAlVilxZAAAACV9fY3JlYXRlZAlVilyLAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5y\nZQoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNoYXQA\nAAAIZXhlcmNpc2UKAzFKMAAAAAZsZWFndWUEAwAAAAMKCeWui+aJv+i7kgAAAARuYW1lCglCMDMy\nMDAwNTQAAAACaWQKBWNoZW5nAAAACHBhc3N3b3JkAAAABl9fdXNlcg==\n	1435135676
session:212fe892c2d0ca79bc2b1c9ac60e87abf58f9cf7                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCeW8tembheWqmwAA\nAARuYW1lCglCMDMyMDAwMTkAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFs\nbQoEY2hhdAAAAAhleGVyY2lzZQoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMDE5AAAACXBsYXllcl9p\nZAlViq9uAAAACV9fY3JlYXRlZAlVirLPAAAACV9fdXBkYXRlZA==\n	1435157534
session:cf0144796b417fccf4b3e1d794eee87362bccdcc                        	BQkDAAAACAoJQjAzMjAwMDgyAAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQlVits8AAAACV9f\nY3JlYXRlZAlVittPAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQQDAAAAAwoJQjAzMjAwMDgy\nAAAAAmlkCgnlkLPlrZ/lqIEAAAAEbmFtZQoEbWVuZwAAAAhwYXNzd29yZAAAAAZfX3VzZXIKB2Rl\nZmF1bHQAAAAMX191c2VyX3JlYWxtCgRjaGF0AAAACGV4ZXJjaXNl\n	1435167115
session:7f05aaea0dcb137e965be084f7bff55f8d60f595                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQoDMUowAAAABmxlYWd1ZQQDAAAAAwoCeWEAAAAIcGFz\nc3dvcmQKCeW8tembheWqmwAAAARuYW1lCglCMDMyMDAwMTkAAAACaWQAAAAGX191c2VyCgRjYWxs\nAAAABWdlbnJlCVWMIx8AAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoJQjAz\nMjAwMDE5AAAACXBsYXllcl9pZAlVjCbzAAAACV9fdXBkYXRlZA==\n	1435252384
session:0a8fcb2e20b3ef1a41f4f24da820a49838011ce3                        	BQkDAAAAAwlVi/F6AAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVi/F6AAAACV9fY3Jl\nYXRlZA==\n	1435238282
session:95de15369bd799b0e456559a7412eaf4f9dff572                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMDUwAAAACXBsYXllcl9pZAlVi3UqAAAACV9f\nY3JlYXRlZAlVi3VRAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQQDAAAAAwoCZGUAAAAIcGFz\nc3dvcmQKCUIwMzIwMDA1MAAAAAJpZAoJ5Ye+5b6X6I+vAAAABG5hbWUAAAAGX191c2VyCgdkZWZh\ndWx0AAAADF9fdXNlcl9yZWFsbQoEY2hhdAAAAAhleGVyY2lzZQ==\n	1435207325
session:8ccc1bdaabc229e58c218ab1d808490ad98e04bf                        	BQkDAAAACAlVi+88AAAACV9fdXBkYXRlZAlVi+8nAAAACV9fY3JlYXRlZAoJQjAzMjAwMTAyAAAA\nCXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQoEY2hhdAAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKAnlpAAAACHBhc3N3b3JkCglCMDMyMDAxMDIAAAACaWQKCeadjuaA\noeWuowAAAARuYW1lAAAABl9fdXNlcgoDMUowAAAABmxlYWd1ZQ==\n	1435237711
session:5ce67b1e8f2dd3e24d279581934eb5874ed40701                        	BQkDAAAACAoJQjAzMjAwMDk3AAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQlVi5WOAAAACV9f\nY3JlYXRlZAlVi5WVAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQQDAAAAAwoCc2kAAAAIcGFz\nc3dvcmQKCUIwMzIwMDA5NwAAAAJpZAoJ5p6X5oCd6L6wAAAABG5hbWUAAAAGX191c2VyCgdkZWZh\ndWx0AAAADF9fdXNlcl9yZWFsbQoEY2hhdAAAAAhleGVyY2lzZQ==\n	1435214762
session:3dcb090d12ea5b408baabdeee6983d3194f03e8a                        	BQkDAAAACAlVi+jXAAAACV9fY3JlYXRlZAlVi+jmAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5y\nZQoJQjAzMjAwMDEyAAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNoYXQA\nAAAIZXhlcmNpc2UKAzFKMAAAAAZsZWFndWUEAwAAAAMKAnlpAAAACHBhc3N3b3JkCgnpgrHkvp3l\nq7sAAAAEbmFtZQoJQjAzMjAwMDEyAAAAAmlkAAAABl9fdXNlcg==\n	1435240342
session:77b2ac03f7c44e0d15a0388a340f3c42b23bbdd2                        	BQkDAAAACAoJQjAzMjAwMDgyAAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQlVi/F6AAAACV9f\nY3JlYXRlZAlVi/HZAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQQDAAAAAwoEbWVuZwAAAAhw\nYXNzd29yZAoJQjAzMjAwMDgyAAAAAmlkCgnlkLPlrZ/lqIEAAAAEbmFtZQAAAAZfX3VzZXIKB2Rl\nZmF1bHQAAAAMX191c2VyX3JlYWxtCgRjaGF0AAAACGV4ZXJjaXNl\n	1435239971
session:466d356b80dc26c510ff58bace91d77bb3ffc193                        	BQkDAAAACAQDAAAAAwoJ5by157at5LitAAAABG5hbWUKCUIwMzIwMDA5OAAAAAJpZAoDd2VpAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcgoDMUowAAAABmxlYWd1ZQoEY2hhdAAAAAhleGVyY2lzZQoHZGVm\nYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA5OAAAAAlwbGF5ZXJfaWQKBGNhbGwAAAAFZ2Vu\ncmUJVYvHJAAAAAlfX3VwZGF0ZWQJVYvF+gAAAAlfX2NyZWF0ZWQ=\n	1435228670
session:930003ed98db845de94868b641e1fcf31dca5a13                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNoYXQAAAAIZXhlcmNpc2UKAzFKMAAA\nAAZsZWFndWUEAwAAAAMKA3dlbgAAAAhwYXNzd29yZAoJ55+z5paH6aaoAAAABG5hbWUKCUIwMzIw\nMDA4OAAAAAJpZAAAAAZfX3VzZXIJVYu6TQAAAAlfX2NyZWF0ZWQJVYu6XgAAAAlfX3VwZGF0ZWQK\nBGNhbGwAAAAFZ2VucmUKCUIwMzIwMDA4OAAAAAlwbGF5ZXJfaWQ=\n	1435224183
session:8e221aa93a0eb3c2d6ae12183681337c8af0dda1                        	BQkDAAAAAwlVjCXjAAAACV9fY3JlYXRlZAlVjCXjAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1435251699
session:87867adbec6b4556dada2b03fc0992664749a8aa                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMDkyAAAACXBsYXllcl9pZAlVjCIHAAAACV9f\ndXBkYXRlZAlVjCH7AAAACV9fY3JlYXRlZAQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKBuebp+avhQAA\nAARuYW1lCglCMDMyMDAwOTIAAAACaWQAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCgRjaGF0AAAA\nCGV4ZXJjaXNlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435251334
session:be42576bd5bad405d6516d353ad50d132c0f7043                        	BQkDAAAABQQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCeW8tembheWqmwAAAARuYW1lCglCMDMyMDAw\nMTkAAAACaWQAAAAGX191c2VyCVWMJf8AAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAlVjCX/AAAACV9fY3JlYXRlZA==\n	1435251727
session:1014d6648ca9e69c03c5d8f0bfd41d55e003c64c                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCUIwMzIwMDA5MgAA\nAAJpZAoG55un5q+FAAAABG5hbWUAAAAGX191c2VyCgRjaGF0AAAACGV4ZXJjaXNlCVWMINAAAAAJ\nX191cGRhdGVkCglCMDMyMDAwOTIAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFs\nbQoEY2FsbAAAAAVnZW5yZQlVjCCBAAAACV9fY3JlYXRlZA==\n	1435250543
session:89ec08f65a8703b004de74e3c31b4d4998843f69                        	BQkDAAAABQoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAQDAAAAAwoJ5by16ZuF5aqbAAAABG5hbWUK\nCUIwMzIwMDAxOQAAAAJpZAoCeWEAAAAIcGFzc3dvcmQAAAAGX191c2VyCVWMJgsAAAAJX19jcmVh\ndGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVjCYMAAAACV9fdXBkYXRlZA==\n	1435251739
session:36a2b572cbf4920851178f80dfeff642e5c1dd34                        	BQkDAAAABQQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCUIwMzIwMDAxOQAAAAJpZAoJ5by16ZuF5aqb\nAAAABG5hbWUAAAAGX191c2VyCVWMJh4AAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAlVjCYeAAAACV9fY3JlYXRlZA==\n	1435251758
session:9d5cbc5521120eea6acf149e73aaf676ac0392fd                        	BQkDAAAABQlVjCZjAAAACV9fY3JlYXRlZAlVjCZjAAAACV9fdXBkYXRlZAQDAAAAAwoCeWEAAAAI\ncGFzc3dvcmQKCUIwMzIwMDAxOQAAAAJpZAoJ5by16ZuF5aqbAAAABG5hbWUAAAAGX191c2VyCglC\nMDMyMDAwMTkAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435251827
session:009beab710eb29ae855e008ad46b578f8ed74936                        	BQkDAAAAAwlVjCsDAAAACV9fY3JlYXRlZAlVjCsDAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1435253011
session:9a4bdadfff38eec9a223b531a98349b25613f6cb                        	BQkDAAAAAwlVjCp6AAAACV9fY3JlYXRlZAlVjCp6AAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1435252874
session:5608885811dd017bda8ccc9a2a153d1710e4261b                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVjCriAAAACV9fdXBkYXRlZAlVjCriAAAACV9fY3Jl\nYXRlZA==\n	1435252978
session:8bc913357784618070c95009a671f80dee8527bd                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoJQjAzMjAwMTA5AAAACXBsYXllcl9pZAlVjCu9AAAACV9f\nY3JlYXRlZAlVjCv1AAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQQDAAAAAwoJ5p2O5a6H57a4\nAAAABG5hbWUKCUIwMzIwMDEwOQAAAAJpZAoCeXUAAAAIcGFzc3dvcmQAAAAGX191c2VyCgdkZWZh\ndWx0AAAADF9fdXNlcl9yZWFsbQoEY2hhdAAAAAhleGVyY2lzZQ==\n	1435255074
session:9cdfefcd90c67bca6001529d760bd986a9f861cd                        	BQkDAAAAAwlVjCu/AAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjCu/AAAACV9fY3Jl\nYXRlZA==\n	1435253200
session:c03951c0386b282a2fb1f804b5e35513a4374b85                        	BQkDAAAABwQDAAAAAwoCb2sAAAAIcGFzc3dvcmQKBkRyQmVhbgAAAARuYW1lCgYxOTMwMDEAAAAC\naWQAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoEY2hh\ndAAAAAhleGVyY2lzZQlVjNy3AAAACV9fY3JlYXRlZAoGMTkzMDAxAAAACXBsYXllcl9pZAlVjNy+\nAAAACV9fdXBkYXRlZA==\n	1435298611
session:a3a5ccc374a05cc5915bc6c7a69c43affb5c21ad                        	BQkDAAAACAoJQjAzMjAwMDI5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0K\nBGNoYXQAAAAIZXhlcmNpc2UJVYyuhwAAAAlfX2NyZWF0ZWQJVYyuswAAAAlfX3VwZGF0ZWQEAwAA\nAAMKBGRpbmcAAAAIcGFzc3dvcmQKCemNvuWumui7kgAAAARuYW1lCglCMDMyMDAwMjkAAAACaWQA\nAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCgRjYWxsAAAABWdlbnJl\n	1435286732
session:e641664d71684c98fcec59adae314acf2afca98d                        	BQkDAAAACAoJQjAzMjAwMDkzAAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0J\nVYzDFwAAAAlfX2NyZWF0ZWQKBGNoYXQAAAAIZXhlcmNpc2UJVYzD4wAAAAlfX3VwZGF0ZWQEAwAA\nAAMKCUIwMzIwMDA5MwAAAAJpZAoJ5b2t6Z2W5aqbAAAABG5hbWUKBGppbmcAAAAIcGFzc3dvcmQA\nAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCgRjYWxsAAAABWdlbnJl\n	1435293486
session:8a89d323e0889642e83a33b5588ba30b4a789114                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQQDAAAAAwoCemkAAAAIcGFzc3dvcmQKCeaWueaik+mRkgAA\nAARuYW1lCglCMDMyMDAwNDUAAAACaWQAAAAGX191c2VyCgRjaGF0AAAACGV4ZXJjaXNlCVWMT40A\nAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoJQjAzMjAwMDQ1AAAACXBsYXll\ncl9pZAoEY2FsbAAAAAVnZW5yZQlVjE5sAAAACV9fY3JlYXRlZA==\n	1435263593
session:25a94bfb41a993552a6d33a418a0953b8850e34e                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVjM7XAAAACV9fY3JlYXRlZAlVjM7XAAAACV9fdXBk\nYXRlZA==\n	1435294951
session:66c667e00915b20482588c97d6367801980ee78a                        	BQkDAAAAAwlVjM82AAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjM82AAAACV9fY3Jl\nYXRlZA==\n	1435295046
session:bf1d2a687b7da480aece94d28b34b740bf8f15d1                        	BQkDAAAABQQDAAAAAwoJ55Sw5reH5ZySAAAABG5hbWUKCUIwMzIwMDA0NgAAAAJpZAoCcWkAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVjNq9AAAACV9fY3Jl\nYXRlZAoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZAlVjNq9AAAACV9fdXBkYXRlZA==\n	1435298009
session:56a7ee9b58ac615f6d9ae88969aa86a75cd22dbb                        	BQkDAAAACAQDAAAAAwoJ55Sw5reH5ZySAAAABG5hbWUKCUIwMzIwMDA0NgAAAAJpZAoCcWkAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCgRjYWxsAAAABWdlbnJlCVWMrfkAAAAJ\nX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVjK3yAAAACV9fY3JlYXRlZAoEY2hh\ndAAAAAhleGVyY2lzZQoJQjAzMjAwMDQ2AAAACXBsYXllcl9pZA==\n	1435286593
session:91a08473f800c0d3c67baf01686a30446732cb0b                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVjOGJAAAACV9fdXBkYXRlZAlVjOGJAAAACV9fY3Jl\nYXRlZA==\n	1435299737
session:e701cc0a2803c95830cdfd21283694b21f52e7a9                        	BQkDAAAAAwlVjOCkAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjOCjAAAACV9fY3Jl\nYXRlZA==\n	1435299507
session:f51fc6e5bb8ffdde5de49146c1e24d1a7b8a6c07                        	BQkDAAAACAlVjODiAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KAzFKMAAA\nAAZsZWFndWUKBGNoYXQAAAAIZXhlcmNpc2UKCUIwMzIwMDA1MgAAAAlwbGF5ZXJfaWQJVYzg+AAA\nAAlfX3VwZGF0ZWQEAwAAAAMKCUIwMzIwMDA1MgAAAAJpZAoDamlhAAAACHBhc3N3b3JkCgnmnY7k\nvbPlrpwAAAAEbmFtZQAAAAZfX3VzZXIKBGNhbGwAAAAFZ2VucmU=\n	1435304044
session:3156a2b4fef84f68307c8b7af20b900a9bb3d1bf                        	BQkDAAAAAwlVjOC4AAAACV9fdXBkYXRlZAlVjOC4AAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1435299528
session:d1b88b19fcfd730b7bb60db65fa66386d6471239                        	BQkDAAAACAoJQjAzMjAwMDI5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0K\nBGNoYXQAAAAIZXhlcmNpc2UJVYzgsAAAAAlfX2NyZWF0ZWQEAwAAAAMKCUIwMzIwMDAyOQAAAAJp\nZAoJ6Y2+5a6a6LuSAAAABG5hbWUKBGRpbmcAAAAIcGFzc3dvcmQAAAAGX191c2VyCgMxSjAAAAAG\nbGVhZ3VlCgRjYWxsAAAABWdlbnJlCVWM4MMAAAAJX191cGRhdGVk\n	1435302520
session:d3d9ca2576f5f1534f85ce1b97c81460c5c454e9                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KAzFKMAAAAAZsZWFndWUKBGNoYXQAAAAI\nZXhlcmNpc2UKCUIwMzIwMDA5MQAAAAlwbGF5ZXJfaWQJVYzh/wAAAAlfX3VwZGF0ZWQJVYzg9AAA\nAAlfX2NyZWF0ZWQEAwAAAAMKCeW+kOWdh+WtnwAAAARuYW1lCgNqdW4AAAAIcGFzc3dvcmQKCUIw\nMzIwMDA5MQAAAAJpZAAAAAZfX3VzZXIKBGNhbGwAAAAFZ2VucmU=\n	1435304345
session:7505e6c6f8c83004ad237672ce3c1177098706c0                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQQDAAAAAwoCeWEAAAAIcGFzc3dv\ncmQKCUIwMzIwMDA2MgAAAAJpZAoJ5by16ZuF5rezAAAABG5hbWUAAAAGX191c2VyCVWM4QQAAAAJ\nX191cGRhdGVkCVWM4K0AAAAJX19jcmVhdGVkCgRjaGF0AAAACGV4ZXJjaXNlCgdkZWZhdWx0AAAA\nDF9fdXNlcl9yZWFsbQoJQjAzMjAwMDYyAAAACXBsYXllcl9pZA==\n	1435305032
session:59ef3d4ed05384579141fb41b3254b99d59d01e6                        	BQkDAAAACAlVjOEqAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQQD\nAAAAAwoDaGFvAAAACHBhc3N3b3JkCgnmsZ/nmpPlrocAAAAEbmFtZQoJQjAxMjAyMTA2AAAAAmlk\nAAAABl9fdXNlcgoJQjAxMjAyMTA2AAAACXBsYXllcl9pZAoEY2hhdAAAAAhleGVyY2lzZQlVjODs\nAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1435301824
session:9379ee19509530e8e011c1911d08a3683fe25954                        	BQkDAAAACAoEY2hhdAAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzmIAAA\nAAlfX3VwZGF0ZWQKAzFKMAAAAAZsZWFndWUEAwAAAAMKAnlpAAAACHBhc3N3b3JkCglCMDMyMDAx\nMDIAAAACaWQKCeadjuaAoeWuowAAAARuYW1lAAAABl9fdXNlcglVjOCgAAAACV9fY3JlYXRlZAoE\nY2FsbAAAAAVnZW5yZQoJQjAzMjAwMTAyAAAACXBsYXllcl9pZA==\n	1435302689
session:5472b11078207f26eb0ffadebe76b368618c37ae                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQQDAAAAAwoJQjAzMjAwMDg3AAAAAmlkCgnmpYrmt5HlqbcA\nAAAEbmFtZQoDc2h1AAAACHBhc3N3b3JkAAAABl9fdXNlcglVjODqAAAACV9fdXBkYXRlZAoHZGVm\nYXVsdAAAAAxfX3VzZXJfcmVhbG0KAzFKMAAAAAZsZWFndWUKBGNoYXQAAAAIZXhlcmNpc2UKCUIw\nMzIwMDA4NwAAAAlwbGF5ZXJfaWQJVYzgwAAAAAlfX2NyZWF0ZWQ=\n	1435304135
session:bd05a882e4219339f36a60eedd70bdefd015e65a                        	BQkDAAAABwlVjODKAAAACV9fdXBkYXRlZAoGMTkzMDAxAAAACXBsYXllcl9pZAoEY2hhdAAAAAhl\neGVyY2lzZQlVjN+0AAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KAzFKMAAA\nAAZsZWFndWUEAwAAAAMKBjE5MzAwMQAAAAJpZAoGRHJCZWFuAAAABG5hbWUKAm9rAAAACHBhc3N3\nb3JkAAAABl9fdXNlcg==\n	1435305131
session:61b157e93ff61108b1613af1506ba3384bedb973                        	BQkDAAAAAwlVjODQAAAACV9fdXBkYXRlZAlVjODQAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1435299595
session:2f315dba38685b9e82fb128ddb6080445dbe38c8                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA1NgAAAAlwbGF5ZXJfaWQE\nAwAAAAMKCeewoemAuOasowAAAARuYW1lCgJ5aQAAAAhwYXNzd29yZAoJQjAzMjAwMDU2AAAAAmlk\nAAAABl9fdXNlcglVjOGjAAAACV9fdXBkYXRlZAlVjOGjAAAACV9fY3JlYXRlZA==\n	1435299763
session:687ade3c825b6646b370cb25d29c8deab45af9db                        	BQkDAAAACAlVjOJDAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjOFDAAAACV9fY3Jl\nYXRlZAoEY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeiRieWm\ngueUhAAAAARuYW1lCglCMDMyMDAwNDIAAAACaWQKAnJ1AAAACHBhc3N3b3JkAAAABl9fdXNlcgoD\nMUowAAAABmxlYWd1ZQoJQjAzMjAwMDQyAAAACXBsYXllcl9pZA==\n	1435303224
session:ff8f8b041578ab911e305d526338ce54551c2358                        	BQkDAAAACAoJQjAzMjAwMDkyAAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0K\nBGNoYXQAAAAIZXhlcmNpc2UJVYzhFQAAAAlfX2NyZWF0ZWQEAwAAAAMKBuebp+avhQAAAARuYW1l\nCglCMDMyMDAwOTIAAAACaWQKAnlpAAAACHBhc3N3b3JkAAAABl9fdXNlcgoEY2FsbAAAAAVnZW5y\nZQoDMUowAAAABmxlYWd1ZQlVjOEwAAAACV9fdXBkYXRlZA==\n	1435300883
session:39a7adcaa57a057e0926b6f12e32c36eaccb53c3                        	BQkDAAAABQlVjOEOAAAACV9fdXBkYXRlZAoJQjAzMjAwMDEzAAAACXBsYXllcl9pZAlVjOEOAAAA\nCV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDAxMwAAAAJp\nZAoJ5rSq56mO6Ie7AAAABG5hbWUKBHlpbmcAAAAIcGFzc3dvcmQAAAAGX191c2Vy\n	1435299614
session:b0c8ec3d75f7369b4ea2378c27f5efcb4cc3e4dd                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVjOFkAAAACV9fdXBkYXRlZAlVjOFkAAAACV9fY3Jl\nYXRlZA==\n	1435299700
session:a0afed7074a91287f8cd57b0ec580ae3ad441dd1                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDM0AAAAAmlkCgnpmbPoqanmmIAAAAAEbmFtZQoDc2hpAAAA\nCHBhc3N3b3JkAAAABl9fdXNlcglVjOF4AAAACV9fdXBkYXRlZAoJQjAzMjAwMDM0AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzheAAAAAlfX2NyZWF0ZWQ=\n	1435299720
session:1966009497e86e6c93f1ce19a28c99f168b7bbe2                        	BQkDAAAACAoJQjAzMjAwMDAzAAAACXBsYXllcl9pZAoEY2FsbAAAAAVnZW5yZQQDAAAAAwoCeWEA\nAAAIcGFzc3dvcmQKCemZs+mbheS6rQAAAARuYW1lCglCMDMyMDAwMDMAAAACaWQAAAAGX191c2Vy\nCVWM4tcAAAAJX19jcmVhdGVkCgRjaGF0AAAACGV4ZXJjaXNlCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQlVjOLuAAAACV9fdXBkYXRlZAoDMUowAAAABmxlYWd1ZQ==\n	1435303749
session:146803a0a08a0c7c767ccb235074ebbd190e239d                        	BQkDAAAABQlVjOE2AAAACV9fY3JlYXRlZAlVjOE2AAAACV9fdXBkYXRlZAoJQjAzMjAwMDEzAAAA\nCXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDEzAAAAAmlkCgnmtKrnqY7oh7sAAAAEbmFtZQoEeWlu\nZwAAAAhwYXNzd29yZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1435299654
session:ad34116a9def0dd4ae806fc3b7f43e6293745623                        	BQkDAAAAAwlVjOEgAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjOEgAAAACV9fY3Jl\nYXRlZA==\n	1435299632
session:f1762dbaadf253c153e6919a3ebaa9186f147c54                        	BQkDAAAABQlVjOFcAAAACV9fY3JlYXRlZAlVjOFcAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDAzNAAAAAJpZAoDc2hpAAAACHBhc3N3b3JkCgnpmbPo\nqanmmIAAAAAEbmFtZQAAAAZfX3VzZXIKCUIwMzIwMDAzNAAAAAlwbGF5ZXJfaWQ=\n	1435299692
session:7b818cebf77a16f3c14d70ebd9c10dfbaf22adb9                        	BQkDAAAABQQDAAAAAwoEeWluZwAAAAhwYXNzd29yZAoJ5rSq56mO6Ie7AAAABG5hbWUKCUIwMzIw\nMDAxMwAAAAJpZAAAAAZfX3VzZXIJVYzhagAAAAlfX3VwZGF0ZWQKCUIwMzIwMDAxMwAAAAlwbGF5\nZXJfaWQJVYzhagAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1435299706
session:9ae1339d11d333f874b52370710e627588104ecd                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVjOFQAAAACV9fdXBkYXRlZAlVjOFQAAAACV9fY3Jl\nYXRlZA==\n	1435299680
session:f913cf7175b9421d4ef0a68ca09ab8cf9d40f29a                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVjOE7AAAACV9fdXBkYXRlZAlVjOE7AAAACV9fY3Jl\nYXRlZA==\n	1435299659
session:1a1a4806fe77f75e30864c8f4d19681600151fa7                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNoYXQAAAAIZXhlcmNpc2UJVYzhMgAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDA4OQAAAAlwbGF5ZXJfaWQJVYzhfwAAAAlfX3VwZGF0ZWQEAwAA\nAAMKCUIwMzIwMDA4OQAAAAJpZAoJ5bCk5b6L5pm0AAAABG5hbWUKAmx1AAAACHBhc3N3b3JkAAAA\nBl9fdXNlcgoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQ==\n	1435304961
session:51caa2cdcfb099e8f2e4c4d65ac3dd3113675d72                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQlVjOExAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVyY2lz\nZQlVjOIeAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKA3hpbgAA\nAAhwYXNzd29yZAoJ5p6X5b+D5bm0AAAABG5hbWUKCUIwMzIwMDA2MwAAAAJpZAAAAAZfX3VzZXIK\nBGNhbGwAAAAFZ2VucmUKCUIwMzIwMDA2MwAAAAlwbGF5ZXJfaWQ=\n	1435304090
session:0bf30d2c19065b23d100d34b1d5da370a466c284                        	BQkDAAAACAlVjOFGAAAACV9fY3JlYXRlZAlVjOHHAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0KAzFKMAAAAAZsZWFndWUKCUIwMzIwMDAxOAAAAAlwbGF5ZXJfaWQKBGNoYXQA\nAAAIZXhlcmNpc2UKBGNhbGwAAAAFZ2VucmUEAwAAAAMKCUIwMzIwMDAxOAAAAAJpZAoDYmVpAAAA\nCHBhc3N3b3JkCgnlkLPosp3lrrgAAAAEbmFtZQAAAAZfX3VzZXI=\n	1435302607
session:992c36d71b63ca25a39baa95dbbdf2941638274c                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQQDAAAAAwoCcWkAAAAIcGFzc3dv\ncmQKCUIwMzIwMDA0NgAAAAJpZAoJ55Sw5reH5ZySAAAABG5hbWUAAAAGX191c2VyCVWM4DsAAAAJ\nX191cGRhdGVkCglCMDMyMDAwNDYAAAAJcGxheWVyX2lkCVWM4BUAAAAJX19jcmVhdGVkCgRjaGF0\nAAAACGV4ZXJjaXNlCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435303624
session:211452064885c41d858f57cf3e42919e47dfd109                        	BQkDAAAACAQDAAAAAwoEemhlbgAAAAhwYXNzd29yZAoG5b6Q55SEAAAABG5hbWUKCUIwMzIwMDA4\nMwAAAAJpZAAAAAZfX3VzZXIKBGNhbGwAAAAFZ2VucmUKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\nCgMxSjAAAAAGbGVhZ3VlCgRjaGF0AAAACGV4ZXJjaXNlCglCMDMyMDAwODMAAAAJcGxheWVyX2lk\nCVWM4VAAAAAJX191cGRhdGVkCVWM4ScAAAAJX19jcmVhdGVk\n	1435303019
session:e38a73f49588ef709a59e87edd12fe8ff7d5946e                        	BQkDAAAACAlVjODwAAAACV9fdXBkYXRlZAoJQjAzMjAwMDUwAAAACXBsYXllcl9pZAoEY2hhdAAA\nAAhleGVyY2lzZQoDMUowAAAABmxlYWd1ZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzgzAAA\nAAlfX2NyZWF0ZWQKBGNhbGwAAAAFZ2VucmUEAwAAAAMKCeWHvuW+l+iPrwAAAARuYW1lCgJkZQAA\nAAhwYXNzd29yZAoJQjAzMjAwMDUwAAAAAmlkAAAABl9fdXNlcg==\n	1435302362
session:21aad1182dcafeb2f646d9018b1063419d55b020                        	BQkDAAAAAwlVjOF5AAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjOF5AAAACV9fdXBk\nYXRlZA==\n	1435299721
session:7cdc8a7ed10db1a544a8877cdf843b97d296e2ee                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDEzAAAAAmlkCgnmtKrnqY7oh7sAAAAEbmFtZQoEeWluZwAA\nAAhwYXNzd29yZAAAAAZfX3VzZXIJVYzhhQAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2Vy\nX3JlYWxtCVWM4YUAAAAJX191cGRhdGVkCglCMDMyMDAwMTMAAAAJcGxheWVyX2lk\n	1435299733
session:3af35b33659d66a6bccec644da476422bab157c8                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVjOGtAAAACV9fY3JlYXRlZAlVjOGtAAAACV9fdXBk\nYXRlZA==\n	1435299773
session:b803ed4c58b9b4f42c5f96bdbfc068b00d936a9d                        	BQkDAAAAAwlVjOG1AAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjOG1AAAACV9fY3Jl\nYXRlZA==\n	1435299781
session:6aa1723a4d105810f6859d774e119815ea338d3e                        	BQkDAAAAAwlVjOG6AAAACV9fdXBkYXRlZAlVjOG6AAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1435299786
session:92cb3d335ffab47ef4092e2e13655d4f5ff1428d                        	BQkDAAAABQQDAAAAAwoCbGkAAAAIcGFzc3dvcmQKCeWui+eri+WptwAAAARuYW1lCglCMDMyMDAw\nMzIAAAACaWQAAAAGX191c2VyCVWM4doAAAAJX191cGRhdGVkCglCMDMyMDAwMzIAAAAJcGxheWVy\nX2lkCVWM4doAAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435299818
session:702f4ee916c6c8e2520b57803ebb85b5f0a2af80                        	BQkDAAAABQQDAAAAAwoJQjAzMjAwMDMyAAAAAmlkCgnlrovnq4vlqbcAAAAEbmFtZQoCbGkAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCglCMDMyMDAwMzIAAAAJcGxheWVyX2lkCVWM4cMAAAAJX191cGRh\ndGVkCVWM4cMAAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435299795
session:85711dacb66038527db0ac3e0d956f618fc2533e                        	BQkDAAAABQlVjOHOAAAACV9fY3JlYXRlZAlVjOHOAAAACV9fdXBkYXRlZAQDAAAAAwoJQjAzMjAw\nMDMyAAAAAmlkCgJsaQAAAAhwYXNzd29yZAoJ5a6L56uL5am3AAAABG5hbWUAAAAGX191c2VyCglC\nMDMyMDAwMzIAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435299806
session:58eeea04958f7be560e42db8502859d0cd784984                        	BQkDAAAABQlVjOHPAAAACV9fY3JlYXRlZAlVjOHPAAAACV9fdXBkYXRlZAQDAAAAAwoDaHVpAAAA\nCHBhc3N3b3JkCgnmnpfmhaflqJ8AAAAEbmFtZQoJQjAzMjAwMDM5AAAAAmlkAAAABl9fdXNlcgoJ\nQjAzMjAwMDM5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1435299807
session:0224a5432835fe2884a069f6baec0112ca0a06e5                        	BQkDAAAABQQDAAAAAwoCcnUAAAAIcGFzc3dvcmQKCUI5OTExMDA1NQAAAAJpZAoJ6Kyd5aaC5pm0\nAAAABG5hbWUAAAAGX191c2VyCVWM4doAAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQlVjOHaAAAACV9fdXBkYXRlZAoJQjk5MTEwMDU1AAAACXBsYXllcl9pZA==\n	1435299818
session:8c7fe0cd007ebd108c13abf3ec10345ff78d6726                        	BQkDAAAACAlVjOHoAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQoJQjAzMjAwMDU2AAAA\nCXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KAzFKMAAAAAZsZWFndWUJVYzh1wAA\nAAlfX2NyZWF0ZWQKBGNhbGwAAAAFZ2VucmUEAwAAAAMKAnlpAAAACHBhc3N3b3JkCgnnsKHpgLjm\nrKMAAAAEbmFtZQoJQjAzMjAwMDU2AAAAAmlkAAAABl9fdXNlcg==\n	1435301853
session:1a9b8e702898a0739e0c7a55757a4e03d1ff2811                        	BQkDAAAACAoJQjAzMjAwMDg4AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0K\nBGNoYXQAAAAIZXhlcmNpc2UJVYzhZwAAAAlfX2NyZWF0ZWQEAwAAAAMKCeefs+aWh+mmqAAAAARu\nYW1lCglCMDMyMDAwODgAAAACaWQKA3dlbgAAAAhwYXNzd29yZAAAAAZfX3VzZXIKAzFKMAAAAAZs\nZWFndWUKBGNhbGwAAAAFZ2VucmUJVYzhiAAAAAlfX3VwZGF0ZWQ=\n	1435300466
session:007a2a6df716490a28db98ba09077f7f482bbdd0                        	BQkDAAAAAwlVjOHUAAAACV9fY3JlYXRlZAlVjOHUAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1435299812
session:2af21f7dd879c503cc71c1fedda5e28afbd3afb1                        	BQkDAAAABQQDAAAAAwoDaHVpAAAACHBhc3N3b3JkCgnmnpfmhaflqJ8AAAAEbmFtZQoJQjAzMjAw\nMDM5AAAAAmlkAAAABl9fdXNlcglVjOHVAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJf\ncmVhbG0KCUIwMzIwMDAzOQAAAAlwbGF5ZXJfaWQJVYzh1QAAAAlfX3VwZGF0ZWQ=\n	1435299813
session:eb1239a34462c0e10dc4964b53768a536dedfe94                        	BQkDAAAABQQDAAAAAwoDaHVpAAAACHBhc3N3b3JkCgnmnpfmhaflqJ8AAAAEbmFtZQoJQjAzMjAw\nMDM5AAAAAmlkAAAABl9fdXNlcglVjOHvAAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXll\ncl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzh7wAAAAlfX2NyZWF0ZWQ=\n	1435299839
session:0b728952c4186b4b918ee403553bc945e63d5f2f                        	BQkDAAAACAlVjOHPAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoDMUowAAAABmxlYWd1ZQQD\nAAAAAwoDcGVpAAAACHBhc3N3b3JkCglCMDMyMDAwNzgAAAACaWQKCemEkuaym+etoAAAAARuYW1l\nAAAABl9fdXNlcgoJQjAzMjAwMDc4AAAACXBsYXllcl9pZAoEY2hhdAAAAAhleGVyY2lzZQlVjOG9\nAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1435303012
session:cf1c08d5e9ad06ed55e00fa8cdb27e1bffdaa5b0                        	BQkDAAAAAwlVjOHpAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjOHpAAAACV9fdXBk\nYXRlZA==\n	1435299833
session:b06650101a4090e270d59c88cdb36e73932b2060                        	BQkDAAAABQlVjOHkAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIw\nMDAxOQAAAAlwbGF5ZXJfaWQEAwAAAAMKCUIwMzIwMDAxOQAAAAJpZAoCeWEAAAAIcGFzc3dvcmQK\nCeW8tembheWqmwAAAARuYW1lAAAABl9fdXNlcglVjOHkAAAACV9fY3JlYXRlZA==\n	1435299828
session:3ce495e7747d275d46be34ca8cef9c2da56c9c60                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzhvQAAAAlfX2NyZWF0ZWQKBGNoYXQA\nAAAIZXhlcmNpc2UKCUIwMzIwMDAzNAAAAAlwbGF5ZXJfaWQJVYzh4wAAAAlfX3VwZGF0ZWQEAwAA\nAAMKA3NoaQAAAAhwYXNzd29yZAoJ6Zmz6Kmp5piAAAAABG5hbWUKCUIwMzIwMDAzNAAAAAJpZAAA\nAAZfX3VzZXIKAzFKMAAAAAZsZWFndWUKBGNhbGwAAAAFZ2VucmU=\n	1435304204
session:d61beb31a98ca5952966242aff4ed2b6d769850e                        	BQkDAAAABQlVjOHnAAAACV9fdXBkYXRlZAoJQjAzMjAwMDMyAAAACXBsYXllcl9pZAQDAAAAAwoJ\nQjAzMjAwMDMyAAAAAmlkCgJsaQAAAAhwYXNzd29yZAoJ5a6L56uL5am3AAAABG5hbWUAAAAGX191\nc2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVjOHnAAAACV9fY3JlYXRlZA==\n	1435299831
session:47055649bed0dc79725ba24234a8413386540c0c                        	BQkDAAAABQlVjOHnAAAACV9fdXBkYXRlZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAQDAAAAAwoJ\n5p6X5oWn5aifAAAABG5hbWUKA2h1aQAAAAhwYXNzd29yZAoJQjAzMjAwMDM5AAAAAmlkAAAABl9f\ndXNlcgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzh5wAAAAlfX2NyZWF0ZWQ=\n	1435299831
session:f6177a1998177d4583a9b98abab12ef260914bf5                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzgugAAAAlfX2NyZWF0ZWQKBGNoYXQA\nAAAIZXhlcmNpc2UKCUIwMzIwMDAwNgAAAAlwbGF5ZXJfaWQEAwAAAAMKCUIwMzIwMDAwNgAAAAJp\nZAoJ55+z6YOB5oOgAAAABG5hbWUKAnl1AAAACHBhc3N3b3JkAAAABl9fdXNlcgoDMUowAAAABmxl\nYWd1ZQoEY2FsbAAAAAVnZW5yZQlVjOERAAAACV9fdXBkYXRlZA==\n	1435303685
session:9e3178dcbf5ad5eb1a67b46ef0ac1fbfa679077c                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKAnlhAAAACHBhc3N3b3JkCgnl\nvLXpm4XlqpsAAAAEbmFtZQoJQjAzMjAwMDE5AAAAAmlkAAAABl9fdXNlcgoJQjAzMjAwMDE5AAAA\nCXBsYXllcl9pZAlVjOIDAAAACV9fdXBkYXRlZAlVjOIDAAAACV9fY3JlYXRlZA==\n	1435299859
session:dfd6e66ffb97334737712952faa7d67b7e3305c4                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoJQjAzMjAwMDYwAAAACXBsYXllcl9pZAoEY2FsbAAAAAVn\nZW5yZQQDAAAAAwoJ6buD6YOB5YubAAAABG5hbWUKAnl1AAAACHBhc3N3b3JkCglCMDMyMDAwNjAA\nAAACaWQAAAAGX191c2VyCVWM4w0AAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFs\nbQlVjOEbAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVyY2lzZQ==\n	1435302130
session:20439ad160076468f5469b7cee31a6bc4a16b96f                        	BQkDAAAABQoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAQDAAAAAwoJQjAzMjAwMDE5AAAAAmlkCgJ5\nYQAAAAhwYXNzd29yZAoJ5by16ZuF5aqbAAAABG5hbWUAAAAGX191c2VyCVWM4hwAAAAJX19jcmVh\ndGVkCVWM4hwAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435299884
session:9a6417f452a759c1a24243e434365f9bbb801017                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeW8tembheWqmwAAAARuYW1l\nCglCMDMyMDAwMTkAAAACaWQKAnlhAAAACHBhc3N3b3JkAAAABl9fdXNlcgoJQjAzMjAwMDE5AAAA\nCXBsYXllcl9pZAlVjOIdAAAACV9fY3JlYXRlZAlVjOIdAAAACV9fdXBkYXRlZA==\n	1435299885
session:6bf4c3a8d941ad7f1523bfab79e6c178a3bceef4                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUI5OTExMDA1NQAAAAlwbGF5ZXJfaWQJ\nVYziHgAAAAlfX2NyZWF0ZWQEAwAAAAMKCeisneWmguaZtAAAAARuYW1lCgJydQAAAAhwYXNzd29y\nZAoJQjk5MTEwMDU1AAAAAmlkAAAABl9fdXNlcglVjOIeAAAACV9fdXBkYXRlZA==\n	1435299886
session:91ae1a7dd4fe55c1a43ffa555faa003e3adbd920                        	BQkDAAAABQoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAlVjOIiAAAACV9fdXBkYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYziIgAAAAlfX2NyZWF0ZWQEAwAAAAMKCeW8tembheWqmwAAAARu\nYW1lCgJ5YQAAAAhwYXNzd29yZAoJQjAzMjAwMDE5AAAAAmlkAAAABl9fdXNlcg==\n	1435299890
session:1ecd4af4220c5a415a1003528027f927099fbb4a                        	BQkDAAAABQoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAlVjOIkAAAACV9fY3JlYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeW8tembheWqmwAAAARuYW1lCglCMDMyMDAwMTkAAAAC\naWQKAnlhAAAACHBhc3N3b3JkAAAABl9fdXNlcglVjOIkAAAACV9fdXBkYXRlZA==\n	1435299892
session:b105b30cd3e25bdc74ae3b60618ff64975069bde                        	BQkDAAAABQlVjOIkAAAACV9fdXBkYXRlZAlVjOIkAAAACV9fY3JlYXRlZAoJQjAzMjAwMDE5AAAA\nCXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCeW8tembheWqmwAAAARu\nYW1lCgJ5YQAAAAhwYXNzd29yZAoJQjAzMjAwMDE5AAAAAmlkAAAABl9fdXNlcg==\n	1435299892
session:469c8e52ddc5260f68d5d47fb62e84e10a28797d                        	BQkDAAAACAlVjOKiAAAACV9fdXBkYXRlZAQDAAAAAwoJ5rSq56mO6Ie7AAAABG5hbWUKBHlpbmcA\nAAAIcGFzc3dvcmQKCUIwMzIwMDAxMwAAAAJpZAAAAAZfX3VzZXIKCUIwMzIwMDAxMwAAAAlwbGF5\nZXJfaWQKAzFKMAAAAAZsZWFndWUKBGNhbGwAAAAFZ2VucmUKB2RlZmF1bHQAAAAMX191c2VyX3Jl\nYWxtCgRjaGF0AAAACGV4ZXJjaXNlCVWM4n8AAAAJX19jcmVhdGVk\n	1435301858
session:278b9799ac3f30612ec6918e4f169626e7aa9f8c                        	BQkDAAAABQoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAlVjOI0AAAACV9fY3JlYXRlZAlVjOI0AAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKAnlhAAAACHBhc3N3b3Jk\nCglCMDMyMDAwMTkAAAACaWQKCeW8tembheWqmwAAAARuYW1lAAAABl9fdXNlcg==\n	1435299908
session:4666ca2417d685d28a70d440a2f7418081da92b1                        	BQkDAAAABQlVjOI9AAAACV9fY3JlYXRlZAoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAlVjOI9AAAA\nCV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKAnlhAAAACHBhc3N3b3Jk\nCglCMDMyMDAwMTkAAAACaWQKCeW8tembheWqmwAAAARuYW1lAAAABl9fdXNlcg==\n	1435299917
session:d4ecfa7f0a109b3afecab4f3f4582fb0661d09c3                        	BQkDAAAABQoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAlVjOJbAAAACV9fdXBkYXRlZAlVjOJbAAAA\nCV9fY3JlYXRlZAQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCUIwMzIwMDAxOQAAAAJpZAoJ5by16ZuF\n5aqbAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435299947
session:55e1870a9fdd108d5c271df87a95347d190b5fc6                        	BQkDAAAAAwlVjOJIAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjOJIAAAACV9fY3Jl\nYXRlZA==\n	1435299928
session:690d46d56fc433ce5a0a109ee0e3620a780d60c8                        	BQkDAAAABQlVjOJNAAAACV9fdXBkYXRlZAoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAQDAAAAAwoJ\nQjAzMjAwMDE5AAAAAmlkCgnlvLXpm4XlqpsAAAAEbmFtZQoCeWEAAAAIcGFzc3dvcmQAAAAGX191\nc2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVjOJNAAAACV9fY3JlYXRlZA==\n	1435299933
session:fb55f98cbbe4f10e0f718bdef3c690995ff553bb                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVjOJRAAAACV9fdXBkYXRlZAlVjOJRAAAACV9fY3Jl\nYXRlZA==\n	1435299937
session:1183909725246271226306779f102c149e358da2                        	BQkDAAAABQQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCeW8tembheWqmwAAAARuYW1lCglCMDMyMDAw\nMTkAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVjOJ3AAAACV9fdXBk\nYXRlZAoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAlVjOJ3AAAACV9fY3JlYXRlZA==\n	1435299975
session:db4028b58afd5473972042f4b159e11d78f19dfe                        	BQkDAAAABQoJQjAzMjAwMDU0AAAACXBsYXllcl9pZAlVjOJeAAAACV9fY3JlYXRlZAQDAAAAAwoF\nY2hlbmcAAAAIcGFzc3dvcmQKCeWui+aJv+i7kgAAAARuYW1lCglCMDMyMDAwNTQAAAACaWQAAAAG\nX191c2VyCVWM4l4AAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435299950
session:da514d9edea31cc608fc042b759d12b71111fe4c                        	BQkDAAAACAQDAAAAAwoJ5a6L56uL5am3AAAABG5hbWUKCUIwMzIwMDAzMgAAAAJpZAoCbGkAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoJQjAzMjAwMDMyAAAA\nCXBsYXllcl9pZAoDMUowAAAABmxlYWd1ZQlVjOJ0AAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5y\nZQoEY2hhdAAAAAhleGVyY2lzZQlVjOJhAAAACV9fY3JlYXRlZA==\n	1435305061
session:482deb8d335dea4c27fd1f9d0719b57ae1b14078                        	BQkDAAAAAwlVjOJiAAAACV9fdXBkYXRlZAlVjOJiAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1435299954
session:6c0264cf012c9504443b28fb2b3afe5c33249b5a                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMzIwMDA1NAAAAAJpZAoF\nY2hlbmcAAAAIcGFzc3dvcmQKCeWui+aJv+i7kgAAAARuYW1lAAAABl9fdXNlcgoJQjAzMjAwMDU0\nAAAACXBsYXllcl9pZAlVjOJlAAAACV9fdXBkYXRlZAlVjOJlAAAACV9fY3JlYXRlZA==\n	1435299957
session:e9fe465cf03938def286d2a18efbdc2d414699da                        	BQkDAAAACAlVjODzAAAACV9fdXBkYXRlZAQDAAAAAwoJ6Kix5ZOB55CmAAAABG5hbWUKCUIwMzIw\nMDA3NAAAAAJpZAoDcGluAAAACHBhc3N3b3JkAAAABl9fdXNlcgoDMUowAAAABmxlYWd1ZQoEY2Fs\nbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBGNoYXQAAAAIZXhlcmNpc2UJVYzg\n4AAAAAlfX2NyZWF0ZWQKCUIwMzIwMDA3NAAAAAlwbGF5ZXJfaWQ=\n	1435303918
session:f18a3ff778c7080c3d7aff25cee30c2e28f1c47c                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoEY2hhdAAAAAhleGVyY2lzZQlVjOKPAAAACV9fdXBkYXRl\nZAoJQjAzMjAwMDM5AAAACXBsYXllcl9pZAoDMUowAAAABmxlYWd1ZQQDAAAAAwoJQjAzMjAwMDM5\nAAAAAmlkCgnmnpfmhaflqJ8AAAAEbmFtZQoDaHVpAAAACHBhc3N3b3JkAAAABl9fdXNlcglVjOIx\nAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1435300652
session:d6b1ebb751076e027f5ee184edb0630e6671ddf7                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzioAAAAAlfX2NyZWF0ZWQEAwAAAAMK\nBHhpYW8AAAAIcGFzc3dvcmQKCemCseetseW0tAAAAARuYW1lCglCMDMyMDAwOTQAAAACaWQAAAAG\nX191c2VyCVWM4qAAAAAJX191cGRhdGVkCglCMDMyMDAwOTQAAAAJcGxheWVyX2lk\n	1435300016
session:4c75188452bdc7f2de6c0a712ac21c93a9204967                        	BQkDAAAABQoJQjAzMjAwMDE5AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0E\nAwAAAAMKCUIwMzIwMDAxOQAAAAJpZAoJ5by16ZuF5aqbAAAABG5hbWUKAnlhAAAACHBhc3N3b3Jk\nAAAABl9fdXNlcglVjOKkAAAACV9fY3JlYXRlZAlVjOKkAAAACV9fdXBkYXRlZA==\n	1435300020
session:3d6f10e7a30aac7b9e2ae8de991e71f5f160678b                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQQDAAAAAwoJQjAzMjAwMDQwAAAA\nAmlkCgnlvpDlrqXmppsAAAAEbmFtZQoDeW91AAAACHBhc3N3b3JkAAAABl9fdXNlcglVjOHhAAAA\nCV9fdXBkYXRlZAoJQjAzMjAwMDQwAAAACXBsYXllcl9pZAoEY2hhdAAAAAhleGVyY2lzZQlVjOHO\nAAAACV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0=\n	1435301130
session:e9d6e225a2d4e7178225cc9aa36e13c492b29781                        	BQkDAAAACAlVjOEgAAAACV9fdXBkYXRlZAQDAAAAAwoEbWVuZwAAAAhwYXNzd29yZAoJQjAzMjAw\nMDgyAAAAAmlkCgnlkLPlrZ/lqIEAAAAEbmFtZQAAAAZfX3VzZXIKBGNhbGwAAAAFZ2VucmUKAzFK\nMAAAAAZsZWFndWUKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxtCVWM4RYAAAAJX19jcmVhdGVkCgRj\naGF0AAAACGV4ZXJjaXNlCglCMDMyMDAwODIAAAAJcGxheWVyX2lk\n	1435301167
session:d59a3f53e990a66909dbfea1a32c71de857ec084                        	BQkDAAAACAlVjOL1AAAACV9fdXBkYXRlZAQDAAAAAwoJ5by16ZuF5aqbAAAABG5hbWUKAnlhAAAA\nCHBhc3N3b3JkCglCMDMyMDAwMTkAAAACaWQAAAAGX191c2VyCgRjYWxsAAAABWdlbnJlCglCMDMy\nMDAwMTkAAAAJcGxheWVyX2lkCgMxSjAAAAAGbGVhZ3VlCgRjaGF0AAAACGV4ZXJjaXNlCVWM4ugA\nAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435303682
session:fc22887edb268294fbe9712856afdaf1062c15b5                        	BQkDAAAACAQDAAAAAwoJQjAzMjAwMDcxAAAAAmlkCgN3YW4AAAAIcGFzc3dvcmQKCeW8teiPgOW6\nrQAAAARuYW1lAAAABl9fdXNlcgoEY2FsbAAAAAVnZW5yZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVh\nbG0KAzFKMAAAAAZsZWFndWUKBGNoYXQAAAAIZXhlcmNpc2UKCUIwMzIwMDA3MQAAAAlwbGF5ZXJf\naWQJVYziBwAAAAlfX3VwZGF0ZWQJVYzhRQAAAAlfX2NyZWF0ZWQ=\n	1435300217
session:1ad7d179dc5db56d6803a3e8179484f51fdff9d7                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA5NAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBHhpYW8AAAAIcGFzc3dvcmQKCUIwMzIwMDA5NAAAAAJpZAoJ6YKx562x5bS0AAAABG5h\nbWUAAAAGX191c2VyCVWM4qcAAAAJX19jcmVhdGVkCVWM4qcAAAAJX191cGRhdGVk\n	1435300023
session:fd49917603e88ddbad761d59072b294467c99c00                        	BQkDAAAABQlVjOKwAAAACV9fdXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzisAAA\nAAlfX2NyZWF0ZWQKCUIwMzIwMDA5NAAAAAlwbGF5ZXJfaWQEAwAAAAMKCemCseetseW0tAAAAARu\nYW1lCglCMDMyMDAwOTQAAAACaWQKBHhpYW8AAAAIcGFzc3dvcmQAAAAGX191c2Vy\n	1435300032
session:2f6e51c562e09fd79851c7f432aadaf3c4cc3a1c                        	BQkDAAAACAoEY2FsbAAAAAVnZW5yZQoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAlVjORgAAAACV9f\nY3JlYXRlZAQDAAAAAwoJ6Kyd5aaC5pm0AAAABG5hbWUKAnJ1AAAACHBhc3N3b3JkCglCOTkxMTAw\nNTUAAAACaWQAAAAGX191c2VyCgMxSjAAAAAGbGVhZ3VlCVWM5dIAAAAJX191cGRhdGVkCgdkZWZh\ndWx0AAAADF9fdXNlcl9yZWFsbQoEY2hhdAAAAAhleGVyY2lzZQ==\n	1435302378
session:9956ab868cad0c7b13f7daf7d1be985058dc134c                        	BQkDAAAABQlVjOK9AAAACV9fdXBkYXRlZAlVjOK9AAAACV9fY3JlYXRlZAoJQjAzMjAwMDk0AAAA\nCXBsYXllcl9pZAQDAAAAAwoJ6YKx562x5bS0AAAABG5hbWUKCUIwMzIwMDA5NAAAAAJpZAoEeGlh\nbwAAAAhwYXNzd29yZAAAAAZfX3VzZXIKB2RlZmF1bHQAAAAMX191c2VyX3JlYWxt\n	1435300045
session:1d4da8be1d12958891d2e729fc27d8debdf3251d                        	BQkDAAAACAlVjOMuAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQoHZGVmYXVsdAAAAAxf\nX3VzZXJfcmVhbG0KCUIwMzIwMDExMAAAAAlwbGF5ZXJfaWQEAwAAAAMKBHhpYW8AAAAIcGFzc3dv\ncmQKCUIwMzIwMDExMAAAAAJpZAoJ6buD5puJ6ZuvAAAABG5hbWUAAAAGX191c2VyCVWM4s8AAAAJ\nX19jcmVhdGVkCgRjYWxsAAAABWdlbnJlCgMxSjAAAAAGbGVhZ3Vl\n	1435301215
session:2c30df22b388e871665dcc222f4ed572c6a16c51                        	BQkDAAAABQlVjOP9AAAACV9fdXBkYXRlZAQDAAAAAwoCcnUAAAAIcGFzc3dvcmQKCeisneWmguaZ\ntAAAAARuYW1lCglCOTkxMTAwNTUAAAACaWQAAAAGX191c2VyCglCOTkxMTAwNTUAAAAJcGxheWVy\nX2lkCVWM4/0AAAAJX19jcmVhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435300365
session:21898fcd886160ed9fc53598ca0b0502e7da8ed7                        	BQkDAAAAAwlVjOvqAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjOvqAAAACV9fY3Jl\nYXRlZA==\n	1435302394
session:f1618fbb028773e009ebca55db4c72714323159f                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoJQjAxMjAyMTA0AAAACXBsYXllcl9pZAoHZGVmYXVsdAAA\nAAxfX3VzZXJfcmVhbG0EAwAAAAMKCUIwMTIwMjEwNAAAAAJpZAoJ5b2t5pmf5qGUAAAABG5hbWUK\nBXNoZW5nAAAACHBhc3N3b3JkAAAABl9fdXNlcgoEY2FsbAAAAAVnZW5yZQlVjOIiAAAACV9fY3Jl\nYXRlZAoEY2hhdAAAAAhleGVyY2lzZQlVjOJkAAAACV9fdXBkYXRlZA==\n	1435301203
session:77de95efc6e473067b73c50ca0b809ac4b5fa98c                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA1NAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBWNoZW5nAAAACHBhc3N3b3JkCglCMDMyMDAwNTQAAAACaWQKCeWui+aJv+i7kgAAAARu\nYW1lAAAABl9fdXNlcglVjOKnAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQoEY2FsbAAA\nAAVnZW5yZQoDMUowAAAABmxlYWd1ZQlVjOKcAAAACV9fY3JlYXRlZA==\n	1435300556
session:47580dac7eab63fbeaac7bafbf04c9344b252320                        	BQkDAAAABQQDAAAAAwoJ6Kyd5aaC5pm0AAAABG5hbWUKAnJ1AAAACHBhc3N3b3JkCglCOTkxMTAw\nNTUAAAACaWQAAAAGX191c2VyCVWM7FwAAAAJX191cGRhdGVkCglCOTkxMTAwNTUAAAAJcGxheWVy\nX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQlVjOxcAAAACV9fY3JlYXRlZA==\n	1435302508
session:2ed24b431205fab158bd9765f885bf1b741c5bf8                        	BQkDAAAABQoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAlVjOQHAAAACV9fdXBkYXRlZAlVjOQHAAAA\nCV9fY3JlYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0EAwAAAAMKAnJ1AAAACHBhc3N3b3Jk\nCglCOTkxMTAwNTUAAAACaWQKCeisneWmguaZtAAAAARuYW1lAAAABl9fdXNlcg==\n	1435300375
session:e97d0b6c75415fb2e5713c369e1c7a38bd332077                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzsagAAAAlfX3VwZGF0ZWQKCUI5OTEx\nMDA1NQAAAAlwbGF5ZXJfaWQJVYzsagAAAAlfX2NyZWF0ZWQEAwAAAAMKCUI5OTExMDA1NQAAAAJp\nZAoCcnUAAAAIcGFzc3dvcmQKCeisneWmguaZtAAAAARuYW1lAAAABl9fdXNlcg==\n	1435302522
session:241a63841f5512db566c83e2be309017c2e0663b                        	BQkDAAAABQQDAAAAAwoJ6Kyd5aaC5pm0AAAABG5hbWUKAnJ1AAAACHBhc3N3b3JkCglCOTkxMTAw\nNTUAAAACaWQAAAAGX191c2VyCVWM7EcAAAAJX19jcmVhdGVkCglCOTkxMTAwNTUAAAAJcGxheWVy\nX2lkCVWM7EcAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435302487
session:d825c19573fdcfd8322f03d93b78f962d31cbe50                        	BQkDAAAACAlVjOFNAAAACV9fdXBkYXRlZAQDAAAAAwoDanVuAAAACHBhc3N3b3JkCgnojIPlkJvl\nhJIAAAAEbmFtZQoJQjAzMjAwMDM3AAAAAmlkAAAABl9fdXNlcgoEY2FsbAAAAAVnZW5yZQoDMUow\nAAAABmxlYWd1ZQoJQjAzMjAwMDM3AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVh\nbG0JVYzhOwAAAAlfX2NyZWF0ZWQKBGNoYXQAAAAIZXhlcmNpc2U=\n	1435301539
session:fcbc4b9dbdd9a326e148a459b68f9af77998231e                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUI5OTExMDA1NQAAAAlwbGF5ZXJfaWQJ\nVYzsUAAAAAlfX2NyZWF0ZWQJVYzsUAAAAAlfX3VwZGF0ZWQEAwAAAAMKCeisneWmguaZtAAAAARu\nYW1lCgJydQAAAAhwYXNzd29yZAoJQjk5MTEwMDU1AAAAAmlkAAAABl9fdXNlcg==\n	1435302496
session:67f62604ae1d27a9bfc71d367c3ed71a8454981b                        	BQkDAAAABQlVjOypAAAACV9fY3JlYXRlZAQDAAAAAwoJ6Kyd5aaC5pm0AAAABG5hbWUKAnJ1AAAA\nCHBhc3N3b3JkCglCOTkxMTAwNTUAAAACaWQAAAAGX191c2VyCglCOTkxMTAwNTUAAAAJcGxheWVy\nX2lkCVWM7KkAAAAJX191cGRhdGVkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435302585
session:7ab685d10e1681c506e6c642113390e1d2f514ea                        	BQkDAAAABQQDAAAAAwoJQjk5MTEwMDU1AAAAAmlkCgJydQAAAAhwYXNzd29yZAoJ6Kyd5aaC5pm0\nAAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQoJQjk5MTEwMDU1AAAA\nCXBsYXllcl9pZAlVjOyxAAAACV9fdXBkYXRlZAlVjOyxAAAACV9fY3JlYXRlZA==\n	1435302593
session:36ffef84ae0ff7638fccebcd0c6252dbcd0113bf                        	BQkDAAAABQQDAAAAAwoJQjk5MTEwMDU1AAAAAmlkCgnorJ3lpoLmmbQAAAAEbmFtZQoCcnUAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCglCOTkxMTAwNTUAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9f\ndXNlcl9yZWFsbQlVjOy4AAAACV9fdXBkYXRlZAlVjOy4AAAACV9fY3JlYXRlZA==\n	1435302600
session:c939e5fd27e589f53eb2d569cd734d576d993320                        	BQkDAAAABQQDAAAAAwoJQjk5MTEwMDU1AAAAAmlkCgnorJ3lpoLmmbQAAAAEbmFtZQoCcnUAAAAI\ncGFzc3dvcmQAAAAGX191c2VyCVWM7lwAAAAJX19jcmVhdGVkCVWM7lwAAAAJX191cGRhdGVkCglC\nOTkxMTAwNTUAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9fdXNlcl9yZWFsbQ==\n	1435303020
session:833ed343897485c4104d8946d077829cf2cd8c36                        	BQkDAAAABQlVjO5vAAAACV9fY3JlYXRlZAQDAAAAAwoJ6Kyd5aaC5pm0AAAABG5hbWUKAnJ1AAAA\nCHBhc3N3b3JkCglCOTkxMTAwNTUAAAACaWQAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQlVjO5vAAAACV9fdXBkYXRlZAoJQjk5MTEwMDU1AAAACXBsYXllcl9pZA==\n	1435303039
session:a328220a0fd55b556f4a9e6e7a8fcc7e72955380                        	BQkDAAAACAQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJ6YKx562x5bS0AAAABG5hbWUKCUIwMzIw\nMDA5NAAAAAJpZAAAAAZfX3VzZXIJVYzjMgAAAAlfX2NyZWF0ZWQKB2RlZmF1bHQAAAAMX191c2Vy\nX3JlYWxtCgRjYWxsAAAABWdlbnJlCgRjaGF0AAAACGV4ZXJjaXNlCVWM40QAAAAJX191cGRhdGVk\nCglCMDMyMDAwOTQAAAAJcGxheWVyX2lkCgMxSjAAAAAGbGVhZ3Vl\n	1435303312
session:eaf22c31ac21b2cb85a6931cfc11c135262f8394                        	BQkDAAAABQlVjO6NAAAACV9fY3JlYXRlZAQDAAAAAwoJQjk5MTEwMDU1AAAAAmlkCgJydQAAAAhw\nYXNzd29yZAoJ6Kyd5aaC5pm0AAAABG5hbWUAAAAGX191c2VyCgdkZWZhdWx0AAAADF9fdXNlcl9y\nZWFsbQlVjO6NAAAACV9fdXBkYXRlZAoJQjk5MTEwMDU1AAAACXBsYXllcl9pZA==\n	1435303069
session:67d045efc72d9fc6310f5b746c661ab9f922a852                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVjO06AAAACV9fY3JlYXRlZAlVjO06AAAACV9fdXBk\nYXRlZA==\n	1435302730
session:1354f554d4088c9af6c4060e90b6f37056f7d412                        	BQkDAAAABQoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAlVjO5oAAAACV9fdXBkYXRlZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYzuaAAAAAlfX2NyZWF0ZWQEAwAAAAMKCUI5OTExMDA1NQAAAAJp\nZAoCcnUAAAAIcGFzc3dvcmQKCeisneWmguaZtAAAAARuYW1lAAAABl9fdXNlcg==\n	1435303032
session:c19abef5312354ff428666e4482801dac8f4e72a                        	BQkDAAAABQlVjO6CAAAACV9fdXBkYXRlZAoJQjk5MTEwMDU1AAAACXBsYXllcl9pZAoHZGVmYXVs\ndAAAAAxfX3VzZXJfcmVhbG0JVYzuggAAAAlfX2NyZWF0ZWQEAwAAAAMKCUI5OTExMDA1NQAAAAJp\nZAoCcnUAAAAIcGFzc3dvcmQKCeisneWmguaZtAAAAARuYW1lAAAABl9fdXNlcg==\n	1435303058
session:47782741e05a017d65e3a2772f293a234e670254                        	BQkDAAAABQQDAAAAAwoCcnUAAAAIcGFzc3dvcmQKCeisneWmguaZtAAAAARuYW1lCglCOTkxMTAw\nNTUAAAACaWQAAAAGX191c2VyCglCOTkxMTAwNTUAAAAJcGxheWVyX2lkCgdkZWZhdWx0AAAADF9f\ndXNlcl9yZWFsbQlVjO6TAAAACV9fY3JlYXRlZAlVjO6TAAAACV9fdXBkYXRlZA==\n	1435303075
session:6da655f6358c582b31ca5e63d77d61d87e0bcdad                        	BQkDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUI5OTExMDA1NQAAAAlwbGF5ZXJfaWQJ\nVYzuyQAAAAlfX2NyZWF0ZWQJVYzuyQAAAAlfX3VwZGF0ZWQEAwAAAAMKAnJ1AAAACHBhc3N3b3Jk\nCgnorJ3lpoLmmbQAAAAEbmFtZQoJQjk5MTEwMDU1AAAAAmlkAAAABl9fdXNlcg==\n	1435303129
session:d5443dbc80f4680b3c2a94b04be476067ca55025                        	BQkDAAAACAoJQjAzMjAwMDMxAAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0J\nVY+FiQAAAAlfX2NyZWF0ZWQEAwAAAAMKA3NodQAAAAhwYXNzd29yZAoJ6JGJ5pu45pm0AAAABG5h\nbWUKCUIwMzIwMDAzMQAAAAJpZAAAAAZfX3VzZXIJVY+FmQAAAAlfX3VwZGF0ZWQKBGNhbGwAAAAF\nZ2VucmUKAzFKMAAAAAZsZWFndWUKBGNoYXQAAAAIZXhlcmNpc2U=\n	1435472843
session:aeb07f5d6818557fc30814f776f043a2f5b3ccaf                        	BQkDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYze4wAAAAlfX2NyZWF0ZWQKBGNoYXQA\nAAAIZXhlcmNpc2UKCUIwMzIwMDAxMgAAAAlwbGF5ZXJfaWQEAwAAAAMKCemCseS+neWruwAAAARu\nYW1lCglCMDMyMDAwMTIAAAACaWQKAnlpAAAACHBhc3N3b3JkAAAABl9fdXNlcgoEY2FsbAAAAAVn\nZW5yZQoDMUowAAAABmxlYWd1ZQlVjN8dAAAACV9fdXBkYXRlZA==\n	1435304443
session:d79c499e3a3b2fa21390aea7c9f98e853f9c9a9a                        	BQkDAAAACAlVjPbGAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVyY2lzZQoDMUowAAAABmxlYWd1\nZQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMzIwMDA4OAAAAAlwbGF5ZXJfaWQEAwAAAAMK\nCeefs+aWh+mmqAAAAARuYW1lCglCMDMyMDAwODgAAAACaWQKA3dlbgAAAAhwYXNzd29yZAAAAAZf\nX3VzZXIKBGNhbGwAAAAFZ2VucmUJVYz2uQAAAAlfX2NyZWF0ZWQ=\n	1435305178
session:c7121801fe28e8829982f6a4f3c7db3a3befa6e0                        	BQkDAAAAAwoEY2hhdAAAAAhleGVyY2lzZQlVkdSzAAAACV9fY3JlYXRlZAlVkdSzAAAACV9fdXBk\nYXRlZA==\n	1435624124
session:70449973ee28fcdbfe6684beb14a7a4be21c6837                        	BQkDAAAACAoJQjAzMjAwMDg4AAAACXBsYXllcl9pZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0K\nBGNhbGwAAAAFZ2VucmUJVYz4CgAAAAlfX2NyZWF0ZWQEAwAAAAMKCUIwMzIwMDA4OAAAAAJpZAoJ\n55+z5paH6aaoAAAABG5hbWUKA3dlbgAAAAhwYXNzd29yZAAAAAZfX3VzZXIKBGNoYXQAAAAIZXhl\ncmNpc2UJVYz4KgAAAAlfX3VwZGF0ZWQKAzFKMAAAAAZsZWFndWU=\n	1435305543
session:f3cc52c317118b67bde1e658618358b10a2ad86b                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoJQjAzMjAwMDU2AAAACXBsYXllcl9pZAlVjO+gAAAACV9f\ndXBkYXRlZAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0JVYzvkgAAAAlfX2NyZWF0ZWQKBGNoYXQA\nAAAIZXhlcmNpc2UKBGNhbGwAAAAFZ2VucmUEAwAAAAMKCeewoemAuOasowAAAARuYW1lCgJ5aQAA\nAAhwYXNzd29yZAoJQjAzMjAwMDU2AAAAAmlkAAAABl9fdXNlcg==\n	1435304038
session:5edda41a4ad4812a8c36d8566553d6baaaf81a41                        	BQkDAAAAAwlVnfgeAAAACV9fY3JlYXRlZAlVnfgfAAAACV9fdXBkYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1436419632
session:08da32f5af83313024118452516ff3f447902e13                        	BQkDAAAACAoDMUowAAAABmxlYWd1ZQoEY2FsbAAAAAVnZW5yZQQDAAAAAwoJ5p6X5oCd6L6wAAAA\nBG5hbWUKCUIwMzIwMDA5NwAAAAJpZAoCc2kAAAAIcGFzc3dvcmQAAAAGX191c2VyCVWM37EAAAAJ\nX191cGRhdGVkCVWM320AAAAJX19jcmVhdGVkCgRjaGF0AAAACGV4ZXJjaXNlCgdkZWZhdWx0AAAA\nDF9fdXNlcl9yZWFsbQoJQjAzMjAwMDk3AAAACXBsYXllcl9pZA==\n	1435305024
session:7b301b166cca0932aa2007d4eb6da68e9bb3950b                        	BQkDAAAAAwlVoXDSAAAACV9fdXBkYXRlZAlVoXDRAAAACV9fY3JlYXRlZAoEY2hhdAAAAAhleGVy\nY2lzZQ==\n	1436647137
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY tag (exercise, player, league, try, score, questionchance, answerchance) FROM stdin;
AFB1J0	193001	1J0	0	0	18	6
oliver	193001	1J0	4	0	9	6
oliver	B03200092	1J0	0	0	18	6
oliver	B03200087	1J0	0	0	18	6
oliver	B03200073	1J0	0	0	18	6
oliver	B03200034	1J0	0	0	18	6
oliver	B03200097	1J0	0	0	18	6
oliver	B03200012	1J0	0	0	18	6
oliver	B03200032	1J0	0	0	18	6
oliver	B03200018	1J0	0	0	18	6
oliver	B03200074	1J0	0	0	18	6
oliver	B03200037	1J0	0	0	18	6
oliver	B03200002	1J0	0	0	18	6
oliver	B03200039	1J0	0	0	18	6
oliver	B03200054	1J0	0	0	18	6
oliver	B03200030	1J0	0	0	18	6
oliver	B03200046	1J0	0	0	18	6
oliver	B03200067	1J0	0	0	18	6
oliver	B03200056	1J0	0	0	18	6
oliver	B03200031	1J0	0	0	18	6
oliver	B03200019	1J0	0	0	18	6
oliver	B03200040	1J0	0	0	18	6
oliver	B03200075	1J0	0	0	18	6
oliver	B03200057	1J0	0	0	18	6
oliver	B03200078	1J0	0	0	18	6
oliver	B03200109	1J0	0	0	18	6
oliver	B03200083	1J0	0	0	18	6
oliver	B03200093	1J0	0	0	18	6
oliver	B03200082	1J0	0	0	18	6
oliver	B03200029	1J0	0	0	18	6
oliver	B03200094	1J0	0	0	18	6
oliver	B03200071	1J0	0	0	18	6
oliver	B03200042	1J0	0	0	18	6
siar	193001	1J0	0	0	18	6
cooking-test	193001	FLA0026	0	0	18	6
siar	B03200029	1J0	0	0	18	6
siar	B03200034	1J0	0	0	18	6
siar	B03200050	1J0	0	0	18	6
siar	B03200102	1J0	0	0	18	6
siar	B03200087	1J0	0	0	18	6
siar	B03200097	1J0	0	0	18	6
siar	B03200040	1J0	0	0	18	6
siar	B03200012	1J0	0	0	18	6
siar	B03200019	1J0	0	0	18	6
siar	B03200031	1J0	0	0	18	6
siar	B03200083	1J0	0	0	18	6
siar	B03200018	1J0	0	0	18	6
siar	B03200063	1J0	0	0	18	6
siar	B03200071	1J0	0	0	18	6
siar	B03200006	1J0	0	0	18	6
siar	B03200032	1J0	0	0	18	6
siar	B03200042	1J0	0	0	18	6
siar	B03200060	1J0	0	0	18	6
siar	B03200045	1J0	0	0	18	6
siar	B03200052	1J0	0	0	18	6
siar	B03200046	1J0	0	0	18	6
siar	B03200056	1J0	0	0	18	6
siar	B03200054	1J0	0	0	18	6
siar	B03200092	1J0	0	0	18	6
siar	B03200074	1J0	0	0	18	6
siar	B03200082	1J0	0	0	18	6
siar	B03200089	1J0	0	0	18	6
siar	B03200106	1J0	0	0	18	6
siar	B03200094	1J0	0	0	18	6
siar	B03200003	1J0	0	0	18	6
siar	B03200093	1J0	0	0	18	6
siar	B03200109	1J0	0	0	18	6
siar	B03200039	1J0	0	0	18	6
siar	B01202104	1J0	0	0	18	6
siar	B01202106	1J0	0	0	18	6
siar	B03200088	1J0	0	0	18	6
siar	B03200078	1J0	0	0	18	6
siar	B03200062	1J0	0	0	18	6
siar	B03200037	1J0	0	0	18	6
siar	B03200013	1J0	0	0	18	6
siar	B03200098	1J0	0	0	18	6
siar	B03200064	1J0	0	0	18	6
siar	B03200084	1J0	0	0	18	6
siar	B03200091	1J0	0	0	18	6
clay	193001	FLA0017	0	0	18	6
clay	V0141018	FLA0017	0	0	18	6
clay	V0141002	FLA0017	0	0	18	6
clay	V0141035	FLA0017	0	0	18	6
clay	V0141017	FLA0017	0	0	18	6
clay	V0141008	FLA0017	0	0	18	6
clay	V0141009	FLA0017	0	0	18	6
clay	V0141019	FLA0017	0	0	18	6
clay	V0141016	FLA0017	0	0	18	6
clay	V0141021	FLA0017	0	0	18	6
clay	V0141029	FLA0017	0	0	18	6
intros	193001	1J0	0	0	18	6
chat	193001	1J0	0	0	18	6
chat	B03200012	1J0	0	0	18	6
chat	B03200097	1J0	0	0	18	6
chat	B03200046	1J0	0	0	18	6
chat	B03200102	1J0	0	0	18	6
chat	B03200029	1J0	0	0	18	6
chat	B03200087	1J0	0	0	18	6
chat	B03200050	1J0	0	0	18	6
chat	B03200074	1J0	0	0	18	6
chat	B03200052	1J0	0	0	18	6
chat	B03200062	1J0	0	0	18	6
chat	B03200006	1J0	0	0	18	6
chat	B03200082	1J0	0	0	18	6
chat	B01202106	1J0	0	0	18	6
chat	B03200031	1J0	0	0	18	6
chat	B03200092	1J0	0	0	18	6
chat	B03200037	1J0	0	0	18	6
chat	B03200083	1J0	0	0	18	6
chat	B03200089	1J0	0	0	18	6
chat	B03200088	1J0	0	0	18	6
chat	B03200018	1J0	0	0	18	6
chat	B03200078	1J0	0	0	18	6
chat	B03200040	1J0	0	0	18	6
chat	B03200034	1J0	0	0	18	6
chat	B03200056	1J0	0	0	18	6
chat	B03200091	1J0	0	0	18	6
chat	B03200071	1J0	0	0	18	6
chat	B03200063	1J0	0	0	18	6
chat	B03200013	1J0	0	0	18	6
chat	B03200042	1J0	0	0	18	6
chat	B01202104	1J0	0	0	18	6
chat	B03200045	1J0	0	0	18	6
chat	B03200032	1J0	0	0	18	6
chat	B03200039	1J0	0	0	18	6
chat	B03200054	1J0	0	0	18	6
chat	B03200003	1J0	0	0	18	6
chat	B03200019	1J0	0	0	18	6
chat	B03200060	1J0	0	0	18	6
chat	B03200110	1J0	0	0	18	6
chat	B03200094	1J0	0	0	18	6
chat	B99110055	1J0	0	0	18	6
\.


--
-- Data for Name: try; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY try (exercise, player, league, try, quoted, answer) FROM stdin;
oliver	193001	1J0	1		\N
oliver	193001	1J0	2	Is Oliver's Chinese name Pan YanMin?	Yes
oliver	193001	1J0	3		\N
oliver	193001	1J0	4	Oliver's Chinese name is Pan YanMin, isnt' it?	Yes
oliver	193001	1J0	5	Oliver's Chinese name is Pan YanMin, isn't it?	Yes
oliver	193001	1J0	6		\N
oliver	193001	1J0	7		\N
oliver	193001	1J0	8	Oliver's Chinese name in Pan YanMin, isn't it?	Yes
oliver	193001	1J0	9	Oliver's Chinese name in Pan YanMin, isn't it?	Yes
oliver	193001	1J0	10		\N
oliver	193001	1J0	11	Whose Chinese name is Pan YanMin?	Oliver
oliver	193001	1J0	12	Pan YanMin is whose Chinese name?	Oliver
oliver	193001	1J0	13	Does Oliver happy?	Yes
oliver	193001	1J0	14	Does Oliver have a sister?	Yes
oliver	193001	1J0	15	Does Oliver have a sister?	Yes
oliver	193001	1J0	16	Does Oliver have a sister?	--
oliver	193001	1J0	17	Does Oliver have a older sister?	Yes
oliver	193001	1J0	18	Does Oliver happy?	Yes
oliver	193001	1J0	19	Does Oliver have a Chinese name?	Yes
oliver	193001	1J0	20	Does Oliver's older sister have a Chinese name?	No
oliver	193001	1J0	21	Does Oliver's mother have a Chinese name?	No
oliver	193001	1J0	22		\N
oliver	193001	1J0	23	 Does Oliver love listening to music?	Yes
oliver	193001	1J0	24	 Does Oliver love listening to music?	Yes
oliver	193001	1J0	25	Does Oliver love listening to music?	--
oliver	B03200092	1J0	1		\N
oliver	B03200092	1J0	2	Does Oliver have a sister?	Yes
oliver	B03200092	1J0	3		\N
oliver	B03200092	1J0	4	Does Oliver happy?	Yes
oliver	B03200092	1J0	5	Is he happy?	--
oliver	193001	1J0	26	 Does Oliver's older sister have a mother?	No
oliver	193001	1J0	27	Does his older sister have a mother?	No
oliver	193001	1J0	28	Does Oliver love his older sister?	No
oliver	B03200087	1J0	1		\N
oliver	B03200087	1J0	2	Does Oliver have a girlfriend?	Oliver
oliver	B03200087	1J0	3	Does Oliver is happy?	Oliver
oliver	193001	1J0	29		\N
oliver	193001	1J0	30	Does Oliver love his older sister?	No
oliver	B03200087	1J0	4	Oliver is happy?	Oliver
oliver	193001	1J0	31		\N
oliver	193001	1J0	32	Who loves listening to music?	Oliver
oliver	193001	1J0	33		\N
oliver	193001	1J0	34	Who studies in Kainan University?	Oliver
oliver	193001	1J0	35	Does Oliver study in Kainan University?	No
oliver	193001	1J0	36		\N
oliver	B03200073	1J0	1		\N
oliver	B03200073	1J0	2	Can he play baseball/	Yes
oliver	B03200073	1J0	3	Can he play baseball?	Yes
oliver	B03200073	1J0	4	Can he play baseball?	Yes
oliver	B03200073	1J0	5	Are he listening to music?	Yes
oliver	B03200073	1J0	6	Do you study everyday?	Yes
oliver	B03200073	1J0	7		\N
oliver	B03200073	1J0	8	Do you study everyday?	Yes
oliver	B03200097	1J0	1		\N
oliver	B03200097	1J0	2	Is Oliver an optimistic person?	Yes
oliver	B03200097	1J0	3	Is Oliver an optimistic person?	Yes
oliver	B03200073	1J0	9		\N
oliver	B03200073	1J0	10	Is he happy?	Yes
oliver	B03200012	1J0	1		\N
oliver	B03200012	1J0	2	Was Oliver born in Taipei	Yes
oliver	B03200012	1J0	3	Was Oliver born in Taipei?	--
oliver	B03200012	1J0	4	Does Oliver born in Taipei?	--
oliver	B03200012	1J0	5	Did Oliver born in Taipei?	Yes
oliver	B03200012	1J0	6	Does Oliver like music?	Yes
oliver	B03200012	1J0	7	Does Oliver like to listen to music?	Yes
oliver	B03200012	1J0	8	Is he unhappy?	No
oliver	B03200012	1J0	9	Is he optimistic?	Yes
oliver	B03200012	1J0	10		\N
oliver	B03200097	1J0	4		\N
oliver	B03200097	1J0	5		\N
oliver	B03200097	1J0	6		\N
oliver	B03200097	1J0	7		\N
oliver	193001	1J0	37		\N
oliver	193001	1J0	38	Is Oliver a happy person?	Yes
oliver	193001	1J0	39	Does Oliver a happy person?	Yes
oliver	193001	1J0	40	Does Oliver a happy person fdsdf fdsdsf fdsds?	Yes
oliver	B03200073	1J0	11		\N
oliver	B03200073	1J0	12	Does Oliver studay?	Yes
oliver	B03200073	1J0	13		\N
oliver	B03200073	1J0	14	Does Oliver study?	Yes
oliver	B03200073	1J0	15		\N
oliver	193001	1J0	41		\N
oliver	193001	1J0	42	Who is the student whose has an older sister?	Oliver
oliver	193001	1J0	43	Who is the person who has an older sister?	Oliver
oliver	193001	1J0	44	Who is the person who has an older sister?	Oliver
oliver	193001	1J0	45	Who is the person who has an older sister?	Oliver
oliver	B03200032	1J0	1		\N
oliver	B03200032	1J0	2	Is he humorous?	Yes
oliver	193001	1J0	46		\N
oliver	193001	1J0	47	Who has an older sister?	Oliver
oliver	193001	1J0	48	Who has an older sister?	Oliver
oliver	B03200018	1J0	1		\N
oliver	B03200018	1J0	2	Is he Chinese?	Yes
oliver	B03200074	1J0	1		\N
oliver	B03200074	1J0	2	Does Oliver born in Taipei	Yes
oliver	B03200074	1J0	3		\N
oliver	B03200074	1J0	4	Does Oliver live in Taipei	No
oliver	B03200074	1J0	5		\N
oliver	B03200074	1J0	6		\N
oliver	B03200074	1J0	7	Does Oliver live in Taipei	No
oliver	B03200037	1J0	1		\N
oliver	B03200037	1J0	2	Is Oliver come from Taipei	No
oliver	B03200037	1J0	3	Is Oliver's parent live in Taipei	No
oliver	B03200037	1J0	4	Does his parents live in Taipei	No
oliver	B03200037	1J0	5	Does his parent live in Taipei	No
oliver	B03200037	1J0	6	Does he have sister	Yes
oliver	B03200037	1J0	7	Does he study in Kainan University	No
oliver	B03200037	1J0	8	Is he study at Kainan University	No
oliver	B03200037	1J0	9	Is he study in Kainan University	No
oliver	B03200037	1J0	10	Is he study Kainan University	No
oliver	B03200037	1J0	11	Does Oliver live in PingZhen	Yes
oliver	B03200002	1J0	1		\N
oliver	B03200039	1J0	1		\N
oliver	B03200039	1J0	2	Does his sister study in Kainan University	Yes
oliver	B03200039	1J0	3	Is he live in PingZhen 	Yes
oliver	B03200039	1J0	4	Does Oliver  live in PingZhen 	Yes
oliver	B03200039	1J0	5	Does Oliver's Chinese name is Pan YanMin 	Yes
oliver	B03200039	1J0	6	Does he born in Taipei	Yes
oliver	B03200039	1J0	7	Does Oliver is his English name	Yes
oliver	B03200039	1J0	8	Does Oliver is his name	Yes
oliver	B03200039	1J0	9	Does Oliver is a name	--
oliver	B03200039	1J0	10	Does Oliver is  name	--
oliver	B03200039	1J0	11	Does Oliver play in Taipei	No
oliver	B03200039	1J0	12	Is he Oliver 	Yes
oliver	B03200054	1J0	1		\N
oliver	B03200054	1J0	2	Is he Pan YanMin?	Yes
oliver	B03200030	1J0	1		\N
oliver	B03200030	1J0	2	Does Oliver have a older sister?	Yes
oliver	B03200046	1J0	1		\N
oliver	B03200046	1J0	2		\N
oliver	B03200046	1J0	3	Does he like to listen to music?	Yes
oliver	B03200046	1J0	4	Does he live in Taipei?	Yes
oliver	B03200046	1J0	5	Is he live in Taipei?	Yes
oliver	B03200046	1J0	6		\N
oliver	B03200046	1J0	7		\N
oliver	B03200046	1J0	8	What does he like?	Oliver
oliver	B03200067	1J0	1		\N
oliver	B03200067	1J0	2	Who is a happy man ?	Oliver
oliver	B03200067	1J0	3	Who has older sister  ?	Oliver
oliver	B03200067	1J0	4	Who has older sister  ?	Oliver
oliver	B03200067	1J0	5	Who has older sister  ?	Oliver
oliver	B03200067	1J0	6	Who name is Oliver ?	Oliver
oliver	B03200067	1J0	7	Who has older sister? 	Oliver
oliver	B03200067	1J0	8	Who has older sister? 	Oliver
oliver	B03200067	1J0	9	Who has older sister? 	--
oliver	B03200067	1J0	10	Who has older sister? 	Oliver
oliver	B03200067	1J0	11	Who loves play basketball ?	Oliver
oliver	B03200056	1J0	1		\N
oliver	B03200056	1J0	2	Is his stay Kainan Univesity 	No
oliver	B03200056	1J0	3	Is he study Kainan Univesity 	No
oliver	B03200056	1J0	4	Is he study Kainan Univesity 	No
oliver	B03200056	1J0	5	Did he has younger sisrer	No
oliver	B03200056	1J0	6	Did Oliver has older sister	Yes
oliver	B03200056	1J0	7	Does I	--
oliver	B03200056	1J0	8	Does Oliver live in Taoyuan	No
oliver	B03200056	1J0	9	Does Oliver live in Taoyuan	No
oliver	B03200056	1J0	10	Does Oliver live in Taoyuan	--
oliver	B03200056	1J0	11	Does Oliver live in Taoyuan	No
oliver	B03200056	1J0	12	Does Oliver live in Taoyuan .	--
oliver	B03200056	1J0	13	Does Oliver live in Taoyuan ?	No
oliver	B03200056	1J0	14	Does Oliver live in Taoyuan ?	No
oliver	B03200056	1J0	15	Is Oliver a boy	Yes
oliver	B03200056	1J0	16	Is he sad	No
oliver	B03200056	1J0	17	Is Oliver sad	No
oliver	B03200056	1J0	18	Is he Pan YanMin	Yes
oliver	193001	1J0	49		\N
oliver	193001	1J0	50		--
oliver	193001	1J0	51	 Whose older sister studies in Kainan University?	Oliver
oliver	193001	1J0	52	 Who ha an older sister who studies in Kainan University?	Oliver
oliver	193001	1J0	53	 Who has an older sister who studies in Kainan University?	Oliver
oliver	B03200031	1J0	1		\N
oliver	B03200031	1J0	2	who has older sister?	Oliver
oliver	B03200019	1J0	1		\N
oliver	B03200019	1J0	2	what is his name?	Oliver
oliver	B03200019	1J0	3	what is his name?	Oliver
oliver	B03200019	1J0	4		\N
oliver	B03200019	1J0	5	He likes to listen to music 	Yes
oliver	B03200040	1J0	1		\N
oliver	B03200040	1J0	2	what kind of sport does he like?	Oliver
oliver	B03200040	1J0	3	what kind of sport does Oliver like?	--
oliver	B03200075	1J0	1		\N
oliver	B03200075	1J0	2	Does he happy?	Yes
oliver	B03200075	1J0	3	Does he happy?	Yes
oliver	B03200057	1J0	1		\N
oliver	B03200057	1J0	2	Can Oliver play baseball?	No
oliver	B03200057	1J0	3	Can Oliver play baseball?	--
oliver	B03200057	1J0	4	Does Oliver play baseball?	No
oliver	B03200073	1J0	16		\N
oliver	B03200078	1J0	1		\N
oliver	B03200078	1J0	2		\N
oliver	B03200078	1J0	3		\N
oliver	B03200073	1J0	17	Who has a sister?	Oliver
oliver	B03200057	1J0	5	ls Oliver happy?	Yes
oliver	B03200057	1J0	6	ls Oliver happy?	Yes
oliver	B03200057	1J0	7	ls Oliver happy?	Yes
oliver	B03200057	1J0	8	ls Oliver happy?	Yes
oliver	B03200073	1J0	18	Who has anv older sister?	Oliver
oliver	B03200078	1J0	4	Does he like Taiwan?	Yes
oliver	B03200057	1J0	9	ls Oliver happy?	Yes
oliver	B03200073	1J0	19	Who has an older sister?	Oliver
oliver	B03200056	1J0	21		\N
oliver	B03200078	1J0	5	Does he like Taiwan?	Yes
oliver	B03200057	1J0	10	ls Oliver happy?	Yes
oliver	B03200078	1J0	6	Does he like Taiwan?	--
oliver	B03200057	1J0	11	ls Oliver happy?	Yes
oliver	B03200078	1J0	7	Does he like Taiwan food?	Yes
oliver	B03200078	1J0	8	Does he like Taiwan food?	Yes
oliver	B03200057	1J0	12	ls Oliver a good student?	Yes
oliver	B03200057	1J0	13	ls Oliver a good student?	Yes
oliver	B03200057	1J0	14	ls Oliver a good student?	--
oliver	B03200057	1J0	15	ls Oliver a good student?	--
oliver	B03200057	1J0	16	ls Oliver a good student?	--
oliver	B03200057	1J0	17	ls Oliver a good student?	--
oliver	B03200078	1J0	9	What's he favorite sport?	Yes
oliver	B03200057	1J0	18	ls Oliver a good student?	Yes
oliver	B03200078	1J0	10	What's he favorite sport?	--
oliver	B03200057	1J0	19	ls Oliver a good student?	Yes
oliver	B03200078	1J0	11	What's he favorite sport?	--
oliver	B03200078	1J0	12	What's he favorite sport?	--
oliver	B03200057	1J0	20	ls Oliver a good student?	--
oliver	B03200078	1J0	13	What's he favorite sport?	Yes
oliver	B03200078	1J0	14	Does he like Taiwan food?	Yes
oliver	B03200078	1J0	15	Does he like Taiwan?	--
oliver	B03200078	1J0	16	Does he like Taiwan?	Yes
oliver	B03200078	1J0	17	Does he like Taiwan?	Yes
oliver	B03200078	1J0	18		\N
oliver	B03200078	1J0	19	What's he favorite sport?	Yes
oliver	B03200057	1J0	21		\N
oliver	B03200057	1J0	22	Does Oliver love  baseball?	No
oliver	B03200057	1J0	23	Does Oliver love  basketball?	No
oliver	B03200057	1J0	24		\N
oliver	B03200057	1J0	25		\N
oliver	B03200057	1J0	26	Who love basketball?	Oliver
oliver	B03200078	1J0	20		\N
oliver	B03200057	1J0	27	Who loves basketball?	Oliver
oliver	B03200057	1J0	28		\N
oliver	B03200109	1J0	1		\N
oliver	B03200097	1J0	8		\N
oliver	B03200109	1J0	2		\N
oliver	B03200109	1J0	3		\N
oliver	B03200073	1J0	20		\N
oliver	B03200073	1J0	21	Do they happy?	Yes
oliver	B03200083	1J0	1		\N
oliver	B03200097	1J0	9	What does he favorite sports?	--
oliver	B03200078	1J0	21	Does he listening music?	Yes
oliver	B03200073	1J0	22	Is he listening to music?	No
oliver	B03200073	1J0	23	Is he listening to music?	Yes
oliver	B03200078	1J0	22	Does he like basketball ?	Yes
oliver	B03200078	1J0	23	Does oliver like basketball ?	Yes
oliver	B03200073	1J0	24	Is he positive?	Yes
oliver	B03200078	1J0	24	Does oliver like basket	--
oliver	B03200093	1J0	1		\N
oliver	B03200093	1J0	2		\N
oliver	B03200093	1J0	3		\N
oliver	B03200083	1J0	2	Which sport does Oliver like?	--
oliver	B03200083	1J0	3	Which sport does Oliver like?	Oliver
oliver	B03200078	1J0	25	Is Oliver positive person?	No
oliver	B03200109	1J0	4	Does he live in New Taipei	No
oliver	B03200078	1J0	26	Is Oliver positive person?	No
oliver	B03200109	1J0	5	Does he live in New Taipei	No
oliver	B03200078	1J0	27	Is Oliver  a positive person?	No
oliver	B03200109	1J0	6	Does he live in New Taipei?	Yes
oliver	B03200109	1J0	7	Does he live in New Taipei?	No
oliver	B03200109	1J0	8	Does he play basketball	Yes
oliver	B03200109	1J0	9	Does he play basketball	--
oliver	B03200109	1J0	10	Does he play basketball	No
oliver	B03200078	1J0	28		\N
oliver	B03200082	1J0	1		\N
oliver	B03200082	1J0	2	where does Oliver live?	Oliver
oliver	B03200078	1J0	29	who is positive and person?	Oliver
oliver	B03200073	1J0	25		\N
oliver	B03200109	1J0	11	Is he a student	Yes
oliver	B03200078	1J0	30	who is positive a person?	--
oliver	B03200078	1J0	31	who is a positive person?	Oliver
oliver	B03200109	1J0	12	Is he a student in unervity	Yes
oliver	B03200109	1J0	13	Is Oliver a optimistic person?	Yes
oliver	B03200109	1J0	14	Does oliver interest in basketball?	Yes
oliver	B03200109	1J0	15	Doesn't oliver live in Taipei?	Yes
oliver	B03200109	1J0	16	Doesn't oliver live in Taipei?	No
oliver	B03200109	1J0	17	Isn't he Chinese?	Yes
oliver	B03200109	1J0	18		\N
oliver	B03200109	1J0	19		\N
oliver	B03200109	1J0	20	Who is Chinese	Oliver
oliver	B03200093	1J0	4		\N
oliver	B03200093	1J0	5	Who lives in Taipei?	Oliver
oliver	B03200109	1J0	21	Who is Chinese	Oliver
oliver	B03200078	1J0	32		\N
oliver	B03200093	1J0	6	Whose favorite sport is basketball?	Oliver
oliver	B03200073	1J0	26		\N
oliver	B03200082	1J0	3	where does Oliver live?	Oliver
oliver	B03200082	1J0	4	Oliver is a happyperson,isn't he?	Oliver
oliver	B03200082	1J0	5	where does Oliver live?	Oliver
oliver	B03200082	1J0	6	where does Oliver study?	--
oliver	B03200029	1J0	1		\N
oliver	B03200029	1J0	2	Does Oliver have a older sister?	Oliver
oliver	B03200029	1J0	3	Where is Oliver older sister study?	Oliver
oliver	B03200029	1J0	4	What is Oliver older sister study?	Oliver
oliver	B03200029	1J0	5	Where is Oliver born in?	Oliver
oliver	B03200029	1J0	6		\N
oliver	B03200029	1J0	7		\N
oliver	B03200056	1J0	19		\N
oliver	B03200056	1J0	20	Did Oliver lives in PingZhen	Oliver
oliver	B03200056	1J0	22		\N
oliver	B03200056	1J0	23	Did Oliver lives in PingZhen	Yes
oliver	B03200056	1J0	24	Did Oliver live in PingZhen	Yes
oliver	B03200056	1J0	25	Does Oliver live in PingZhen	Yes
oliver	B03200056	1J0	26	Does Oliver live in PingZhen	Yes
oliver	B03200056	1J0	27	Is Oliver a boy	Yes
oliver	B03200056	1J0	28	Is Oliver a boy	Yes
oliver	B03200056	1J0	29	Is he funny ?	Yes
oliver	B03200056	1J0	30	Is he funny ?	Yes
oliver	B03200056	1J0	31	Is Oliver's sister studying in Kainan University ?	Yes
oliver	B03200056	1J0	32	Is Oliver's sister studying in Kainan University ?	Yes
oliver	B03200056	1J0	33	Who can play basketball ?	Yes
oliver	B03200056	1J0	34	Who can play basketball ?	Yes
oliver	B03200056	1J0	35	Who can play basketball ?	Yes
oliver	B03200094	1J0	1		\N
oliver	B03200056	1J0	36	Oliver loves listening music ?	Yes
oliver	B03200056	1J0	37	Oliver loves listening music ?	Yes
oliver	B03200056	1J0	38	Oliver loves listening to the music ?	Yes
oliver	B03200056	1J0	39	Oliver loves listening to the music ?	Yes
oliver	B03200056	1J0	40	Oliver loves listening to music ?	Yes
oliver	B03200056	1J0	41	Oliver loves listening to music ?	Yes
oliver	B03200056	1J0	42	Oliver loves listening to music ?	Yes
oliver	B03200056	1J0	43	Oliver loves listening to music ?	Yes
oliver	B03200056	1J0	44	Oliver loves listening to music ?	Yes
oliver	B03200056	1J0	45	Oliver likes listening to music ?	Yes
oliver	B03200056	1J0	46	Oliver likes listening to music ?	Yes
oliver	B03200056	1J0	47	Oliver love listening to music ?	Yes
oliver	B03200056	1J0	48	Oliver love listening to music ?	Yes
oliver	B03200056	1J0	49	Oliver love listening to music ?	Yes
oliver	B03200056	1J0	50		\N
oliver	B03200056	1J0	51	Is Oliver love listening to music ?	Yes
oliver	B03200056	1J0	52	Is Oliver love listening to music ?	Yes
oliver	B03200056	1J0	53	Is Oliver loves listening to music ?	Yes
oliver	B03200056	1J0	54	Does Oliver loves listening to music ?	Yes
oliver	B03200056	1J0	55	Is Oliver a person ?	Yes
oliver	B03200094	1J0	2	Had you heard Kainan University?	Yes
oliver	B03200071	1J0	1		\N
oliver	B03200071	1J0	2		\N
oliver	B03200071	1J0	3	Is he relaxed ?	Yes
oliver	B03200042	1J0	1		\N
oliver	B03200042	1J0	2	Isn't he optimistic ?	Yes
oliver	B03200094	1J0	3	Isn't she loves listening to music?	Yes
oliver	B03200094	1J0	4	Isn't she loves listening music?	Yes
oliver	B03200094	1J0	5	Isn't she loves listening music?	Yes
oliver	B03200094	1J0	6	Isn't she loves listening music?	Yes
oliver	B03200094	1J0	7	Isn't she loves listening music?	Yes
oliver	B03200094	1J0	8	Isn't she loves listening music?	Yes
oliver	B03200094	1J0	9	Isn't she loves listening music?	Yes
oliver	B03200094	1J0	10	Isn't she loves listening music?	Yes
oliver	B03200094	1J0	11	Isn't she tired?	Yes
oliver	B03200094	1J0	12	Isn't he loves Oliver?	--
oliver	B03200094	1J0	13	Does he loves Oliver?	--
oliver	B03200094	1J0	14	Does he love Oliver?	Yes
oliver	B03200082	1J0	7		\N
oliver	B03200082	1J0	8	Is Oliver a positive person?	Yes
oliver	193001	1J0	54		\N
oliver	193001	1J0	55	Is Oliver a positive person?	Yes
oliver	B03200040	1J0	4		\N
oliver	B03200040	1J0	5	what kind of sport does Oliver like?	Oliver
oliver	B03200040	1J0	6	where does Oliver live now?	Oliver
oliver	B03200040	1J0	7	what Oliver's chinese name?	Oliver
siar	193001	1J0	1		\N
siar	193001	1J0	2	Does Simon have a family?	Yes
siar	193001	1J0	3	Does Simon have a mother?	Yes
siar	193001	1J0	4		\N
siar	193001	1J0	5	Who has a younger sister?	Brother
siar	193001	1J0	6		\N
siar	193001	1J0	7	Who likes playing guitar?	Brother
siar	193001	1J0	8		\N
siar	193001	1J0	9		\N
siar	193001	1J0	10	Whose favorite sport is baseball?	Simon
siar	193001	1J0	11		\N
siar	193001	1J0	12		\N
siar	193001	1J0	13	Does Ariel love listening to English songs	Yes
siar	193001	1J0	14		\N
siar	193001	1J0	15	Does Ariel like to listen to English songs?	Yes
siar	193001	1J0	16	Does Ariel like listening to English songs?	Yes
siar	193001	1J0	17	Does Simon like listening to English songs?	No
siar	193001	1J0	18		\N
siar	193001	1J0	19		\N
siar	193001	1J0	20		\N
siar	193001	1J0	21		\N
siar	193001	1J0	22	Who likes listening to songs?	Ariel
siar	193001	1J0	23	Who likes listening to English songs?	Ariel
siar	193001	1J0	24		\N
siar	193001	1J0	25	Who likes to listen to English songs?	Ariel
oliver	193001	1J0	56		\N
siar	193001	1J0	26		\N
siar	193001	1J0	27	Who likes listening to English songs?	Ariel
siar	193001	1J0	28		\N
siar	193001	1J0	29	Does Ariel like listening to English songs?	Yes
siar	193001	1J0	30		\N
siar	193001	1J0	31	Who has a father?	Simon
siar	193001	1J0	32		\N
siar	193001	1J0	33		\N
siar	193001	1J0	34	Who has a mother?	Ariel
siar	193001	1J0	35		\N
oliver	193001	1J0	57		\N
siar	193001	1J0	36		\N
siar	B03200031	1J0	1		\N
siar	B03200031	1J0	2		\N
siar	B03200012	1J0	1		\N
siar	B03200034	1J0	1		\N
siar	B03200019	1J0	1		\N
siar	B03200087	1J0	1		\N
siar	B03200012	1J0	2	Whose older brother studies in WenHua University?	Simon
siar	B03200063	1J0	1		\N
siar	B03200042	1J0	1		\N
siar	B03200087	1J0	2	What are you doing? 	Simon
siar	B03200029	1J0	1		\N
siar	B03200102	1J0	1		\N
siar	B03200087	1J0	5	when do simon play baseball?	--
siar	B03200031	1J0	3	Who have an old bother?	Simon
siar	B03200063	1J0	5		\N
siar	B03200097	1J0	2	Whose family has three people?	Ariel
siar	B03200063	1J0	6	Does she live in Taipei?	Yes
siar	B03200102	1J0	2	When was Ariel born?	Ariel
siar	B03200018	1J0	1		\N
siar	B03200094	1J0	1		\N
siar	B03200046	1J0	2	Where does he live?	Simon
siar	B03200063	1J0	7	does study in wenhua university before	--
siar	B03200082	1J0	1		\N
siar	B03200031	1J0	5	whose bother study in WenHua University?	Simon
siar	B03200102	1J0	6	When was Ariel born?	Ariel
siar	B03200056	1J0	2	Who like play guitar ?	Ariel
siar	B03200029	1J0	2	How many people in Ariel's family?	Ariel
siar	B03200102	1J0	7	When was Ariel born?	Ariel
siar	B03200029	1J0	3	How many people in Ariel's family?	Ariel
siar	B03200052	1J0	2		\N
siar	B03200071	1J0	1		\N
siar	B03200006	1J0	1		\N
siar	B03200071	1J0	2	What can you do in Taipei	Chiyuantien
siar	B03200034	1J0	2	Do you have any brother?	Ariel
siar	B03200034	1J0	3	Are you have any brother?	Ariel
siar	B03200042	1J0	2		\N
siar	B03200063	1J0	2	where does she live?	Simon
siar	B03200087	1J0	3	when do you play baseball?	Ariel
siar	B03200063	1J0	3	Does she live in Taipei?	Simon
siar	B03200087	1J0	4	when do simon play baseball?	Simon
siar	B03200034	1J0	4	Are Ariel have any brother?	Ariel
siar	B03200087	1J0	6	when do he play baseball?	Simon
siar	B03200045	1J0	1		\N
siar	B03200012	1J0	3		\N
siar	B03200045	1J0	2		\N
siar	B03200034	1J0	5	How old is Ariel?	Ariel
siar	B03200097	1J0	1		\N
siar	B03200087	1J0	7	how old are he?	Simon
siar	B03200087	1J0	8	how old are he?	--
siar	B03200063	1J0	4		\N
siar	B03200046	1J0	1		\N
siar	B03200102	1J0	3	When was Ariel born?	Ariel
siar	B03200019	1J0	2	Who have three people in family?	Ariel
siar	B03200074	1J0	1		\N
siar	B03200056	1J0	1		\N
siar	B03200031	1J0	4	Who like play guitar?	Simon
siar	B03200092	1J0	1		\N
siar	B03200032	1J0	1		\N
siar	B03200052	1J0	1		\N
siar	B03200102	1J0	4	When was Ariel born?	--
siar	B03200012	1J0	4	Who likes to play baseball?	Simon
siar	B03200102	1J0	5	When was Ariel born?	Ariel
siar	B03200063	1J0	8	does study in wenhua university before	Yes
siar	B03200106	1J0	1		\N
siar	B03200063	1J0	9	does study in wenhua university before	Yes
siar	B03200089	1J0	1		\N
siar	B03200087	1J0	9	does simon study Minghu Junior High School?	Simon
siar	B03200063	1J0	10	does study in Minghu Junior High Schoo 	Yes
siar	B03200054	1J0	1		\N
siar	B03200050	1J0	1		\N
siar	B03200063	1J0	11	does she study in Minghu Junior High Schoo 	Yes
siar	B03200056	1J0	3	Who like playing guitar ?	--
siar	B03200006	1J0	2		\N
siar	B03200102	1J0	8	When was Ariel born?	Ariel
siar	B03200045	1J0	3		\N
siar	B03200052	1J0	3		\N
siar	B03200019	1J0	3		\N
siar	B03200019	1J0	4		\N
siar	B03200031	1J0	6		\N
siar	B03200031	1J0	7		\N
siar	B03200097	1J0	3	Whose favorite sport is baseball?	Simon
siar	B03200050	1J0	2		\N
siar	B03200082	1J0	2	Who lives in Taipei?	Simon
siar	B03200087	1J0	10	who has younger sister?	--
siar	B03200093	1J0	1		\N
siar	B03200034	1J0	6	How many people are in  Ariel's family?	Ariel
siar	B03200102	1J0	9	:How old is Ariel?	Ariel
siar	B03200102	1J0	10	:How old is Ariel?	--
siar	B03200019	1J0	5	Does Simon older brother studies in WenHua University?	Yes
siar	B03200097	1J0	4		\N
siar	B03200012	1J0	5	Whose favorite sport is baseball?	Simon
siar	B03200019	1J0	6	Does Simon older brother studies in WenHua University?	Yes
siar	B03200029	1J0	4	Does Ariel favorite subject is English?	Ariel
siar	B03200039	1J0	1		\N
siar	B03200056	1J0	4	Who like to play guitar ?	--
siar	B03200056	1J0	5	Who like to play guitar ?	--
siar	B03200063	1J0	12	does she have older brother	No
siar	B03200087	1J0	11	do you have a younger sister?	--
siar	B03200034	1J0	7	Who likes to play baseball?	Ariel
siar	B03200087	1J0	12	do simon have a younger sister?	--
siar	B03200031	1J0	8	Dose Simon oldest bother study in WenHua University?	Yes
siar	B03200087	1J0	13	do Simon have a younger sister?	--
siar	B03200109	1J0	1		\N
siar	B03200003	1J0	1		\N
siar	B03200102	1J0	11		\N
siar	B03200074	1J0	2	Who likes make a lot of friends	Ariel
siar	B03200034	1J0	8	Who like play guitar?	Simon
siar	B03200087	1J0	14	Does Simon have a younger sister?	--
siar	B03200034	1J0	9	Who like play guitar?	Ariel
siar	B03200087	1J0	15		--
siar	B03200082	1J0	3	Who lives in Taipei?	Simon
siar	B03200034	1J0	10	Who like play guitar?	Chiyuantien
siar	B03200031	1J0	9	Dose Simon oldest bother study in WenHua University?	Yes
siar	B03200046	1J0	3	Who like to listen English songs?	Ariel
siar	B03200031	1J0	10	Dose Simon oldest bother study in WenHua University?	--
siar	B03200034	1J0	11	Who like play guitar?	Simon
siar	B03200092	1J0	2	who has younger sister ?	Simon
siar	B03200063	1J0	13	Whose family has three people?	Yes
siar	B03200082	1J0	4		\N
siar	B03200094	1J0	2	Doesn't he has younger sister	Ariel
siar	B03200082	1J0	5		\N
siar	B03200102	1J0	12	:How old is Ariel?	Ariel
siar	B03200012	1J0	6	who like English?	Ariel
siar	B03200063	1J0	14		\N
siar	B03200063	1J0	15		\N
siar	B03200087	1J0	16	What does Simon has a younger sister?	--
siar	B03200063	1J0	16	Whose family has three people?	Simon
siar	B03200012	1J0	7	Whose older brother studies in WenHua University?	Simon
siar	B03200088	1J0	1		\N
siar	B03200052	1J0	4	When does Ariel born?	Ariel
siar	B03200082	1J0	6	Does Simon love to play drums?	Yes
siar	B03200087	1J0	17	Why does Simon has a younger sister?	--
siar	B03200060	1J0	1		\N
siar	B03200087	1J0	18	Whom does Simon has a younger sister?	--
siar	B03200052	1J0	5		\N
siar	B03200102	1J0	13		\N
siar	B03200078	1J0	1		\N
siar	B01202106	1J0	1		\N
siar	B03200003	1J0	2	How many people in her family?	Ariel
siar	B03200052	1J0	6		\N
siar	B03200092	1J0	3	who likes to play the guitar ?	Simon
siar	B03200003	1J0	4		\N
siar	B03200029	1J0	6	Where does Simon's older brother study?	Simon
siar	B03200046	1J0	4		\N
siar	B03200034	1J0	13	Who  favorite subject is English?	Ariel
siar	B03200054	1J0	3	Who likes English song?	Ariel
siar	B03200083	1J0	1		\N
siar	B03200087	1J0	19	Who does Simon  younger sister?	--
siar	B03200031	1J0	11		\N
siar	B03200003	1J0	3		\N
siar	B03200029	1J0	5	Does Simon have a younger sister?	Simon
siar	B03200102	1J0	14		\N
siar	B01202106	1J0	2		\N
siar	B03200078	1J0	2	Who is a humorous people?	Simon
siar	B03200031	1J0	15	Does Simon have a old bother?	Yes
siar	B03200089	1J0	2	Who likes playing drums?	Simon
siar	B03200092	1J0	4		\N
siar	B03200012	1J0	8	Who likes English?	Ariel
siar	B03200034	1J0	12	Does Ariel favorite subject is English?	Ariel
siar	B03200054	1J0	2	Is she unfriendly?	Ariel
siar	B03200031	1J0	12	Does Simon older brother studies in WenHua University?	Yes
siar	B03200060	1J0	2		\N
siar	B03200109	1J0	2	Does he like quitar?	Simon
siar	B03200031	1J0	13	Does Simon older brother studies in WenHua University?	--
siar	B03200050	1J0	3	Does Simon favorite sport is baseball?	Simon
siar	B03200031	1J0	14	Does Simon older brother studies in WenHua University?	Yes
siar	B03200074	1J0	3	Who likes English	Ariel
siar	B03200092	1J0	5		\N
siar	B03200029	1J0	7		\N
siar	B03200034	1J0	14	Which one favorite subject is English?	Ariel
siar	B03200029	1J0	8	Does Simon have a younger sister?	Yes
siar	B03200106	1J0	2	Who likes to play baseball?	Ariel
siar	B03200109	1J0	3	Who like quitar?	Simon
siar	B03200109	1J0	4	Who like quitar?	Simon
siar	B03200083	1J0	2	Who like baseball?	Simon
siar	B03200006	1J0	3		\N
siar	B03200050	1J0	4	Simon favorite sport is baseball?	--
siar	B03200060	1J0	3		Yes
siar	B03200029	1J0	9	Does Ariel favorite subject is English?	Yes
siar	B03200031	1J0	16	Does Simon like play guiter?	Yes
siar	B01202104	1J0	1		\N
siar	B03200032	1J0	2	Who likes to listen English songs in the free time?	Ariel
siar	B03200060	1J0	4		No
siar	B03200037	1J0	1		\N
siar	B03200052	1J0	7		\N
siar	B03200060	1J0	5		Yes
siar	B03200019	1J0	7		\N
siar	B03200042	1J0	3		\N
siar	B03200046	1J0	5	What does she like to do in her free time?	Ariel
siar	B03200078	1J0	3	Who major in English??	Ariel
siar	B03200083	1J0	3	Who likes baseball?	Simon
siar	B03200087	1J0	20	Whose family is two people	--
siar	B03200109	1J0	5	Who has five family?	Simon
siar	B03200034	1J0	15	Whose older brother studies in WenHua University?	Chiyuantien
siar	B03200097	1J0	5	Does Simon love to play the guitar?	Yes
siar	B03200031	1J0	17		\N
siar	B03200031	1J0	18		\N
siar	B03200102	1J0	15	Does Simon live in Taipei?	Yes
siar	B03200071	1J0	3		\N
siar	B03200050	1J0	5	Does Simon live in Taipei?	--
siar	B03200092	1J0	6	Does simon's sister study in minghu junior high school ?	Yes
siar	B03200092	1J0	7	Does simon's sister study in minghu junior high school ?	--
siar	B03200092	1J0	8	Does simon's sister study in minghu junior high school ?	--
siar	B03200031	1J0	19	Who likes to play guitar?	Simon
siar	B03200039	1J0	2	Did Ariel bear on June 7?	--
siar	B03200013	1J0	1		\N
siar	B03200063	1J0	17	who like to play guitar	Ariel
siar	B03200031	1J0	20		\N
siar	B03200062	1J0	1		\N
siar	B03200031	1J0	21		\N
siar	B03200109	1J0	6	Who have five family?	Simon
siar	B03200052	1J0	8		\N
siar	B03200034	1J0	16	Does Simon have a younger sister?	--
siar	B03200003	1J0	5	Does she like English?	Yes
siar	B03200083	1J0	4	Who likes to play baseball?	Simon
siar	B03200078	1J0	4	Who is a humorous people?	Simon
siar	B03200034	1J0	17	Does Simon have a younger sister?	Simon
siar	B03200092	1J0	9	Does simon's sister study in Minghu Junior High School ?	Yes
siar	B03200106	1J0	3	Who likes English	Ariel
siar	B03200018	1J0	2	Whose family has five people?	Simon
siar	B03200031	1J0	22	Dose Simon's older bother study in WenHua University?	Yes
siar	B03200092	1J0	10	Does simon's sister study in Minghu Junior High School ?	Yes
siar	B03200012	1J0	9	Whose lives in Taipei?	Simon
siar	B03200071	1J0	4		\N
siar	B03200050	1J0	6	Who likes English?	--
siar	B03200056	1J0	6		\N
siar	B03200046	1J0	6	Whose favorite subject is English?	Ariel
siar	B03200083	1J0	5	Who likes to play baseball?	Simon
siar	B03200006	1J0	4	Does he like to playing drums?	Simon
siar	B03200019	1J0	8		\N
siar	B03200097	1J0	6		\N
siar	B03200031	1J0	23	Dose Simon's older brother study in WenHua University?	Yes
siar	B03200037	1J0	2	Who like play guita?	Simon
siar	B03200040	1J0	1		\N
siar	B03200109	1J0	7	Who has five family member?	Simon
siar	B03200031	1J0	24	Dose Simon's oldeest brother study in WenHua University?	--
siar	B03200050	1J0	7	Who likes English?	Ariel
siar	B03200039	1J0	3	Who is play baseball	Simon
siar	B03200003	1J0	6		\N
siar	B03200071	1J0	5	Does Simon favorite sport is baseball?	Simon
siar	B03200012	1J0	10	Who lives in Taipei?	Simon
siar	B03200031	1J0	25	Dose Simon's older brother studing in WenHua University?	Yes
siar	B03200098	1J0	1		\N
siar	B03200003	1J0	7		\N
siar	B03200052	1J0	9	Does Ariel like to play baseball	Ariel
siar	B03200094	1J0	3	Who has an older brother?	Simon
siar	B03200052	1J0	10		\N
siar	B03200063	1J0	18	who is the tour guide	Chiyuantien
siar	B03200097	1J0	7	Who lives in Taipei?	Simon
siar	B03200109	1J0	8	Who has five family member?	Simon
siar	B03200042	1J0	4	Who like the basketball?	Ariel
siar	B03200083	1J0	6	who have three people in her family?	Ariel
siar	B03200029	1J0	10	Are there five people in Simon's family?	Yes
siar	B03200018	1J0	3	Who lives in Taipei?	Simon
siar	B03200071	1J0	6	Does Simon favorite sport is baseball?	--
siar	B03200089	1J0	3	Does he like to play baseball?	Ariel
siar	B03200037	1J0	3	Who like play guitar ?	Simon
siar	B03200003	1J0	8	How many people in her family?	Ariel
siar	B03200052	1J0	11		\N
siar	B03200071	1J0	7	Does Simon favorite sport is baseball?	Ariel
siar	B03200042	1J0	5	Who like the basketball?	Chiyuantien
siar	B01202106	1J0	3	 Does he live in Taiepi?	Simon
siar	B03200078	1J0	5	Who does major in English?	Ariel
siar	B03200083	1J0	7	who have three people in her family?	Ariel
siar	B03200083	1J0	8	who have three people in her family?	Ariel
siar	B03200083	1J0	10	who have three people in her family?	--
siar	B03200012	1J0	12	Whose younger sister study in Minghu Junior High School?	Simon
siar	B03200092	1J0	11	Is Minghu Junior High School in Taipei?	Yes
siar	B03200054	1J0	4	who likes to listen to music?	Ariel
siar	B03200092	1J0	12	Is Minghu Junior High School in Taipei?	Yes
siar	B03200042	1J0	7	Who like the basketball?	Chiyuantien
siar	B03200083	1J0	11	who have three people in her family?	Ariel
siar	B03200029	1J0	11		\N
siar	B03200060	1J0	6	Does Simon feel better?	Yes
siar	B03200034	1J0	18	Does she live in Taipei?	Ariel
siar	B03200054	1J0	5	who likes to listen to English music?	Ariel
siar	B03200013	1J0	2		\N
siar	B01202106	1J0	4	 Does he live in Taiepi?	Simon
siar	B03200071	1J0	8	Does Simon favorite sport is baseball?	Chiyuantien
siar	B03200042	1J0	8	Who like the basketball?	Chiyuantien
siar	B03200042	1J0	11	Who like the basketball?	--
siar	B03200042	1J0	13	Who like the basketball?	--
siar	B03200042	1J0	14	Who like the basketball?	--
siar	B03200082	1J0	8		\N
siar	B03200109	1J0	9	Who have five family member?	Simon
siar	B03200042	1J0	6	Who like the basketball?	Simon
siar	B03200083	1J0	9	who have three people in her family?	--
siar	B03200012	1J0	11	Whose younger sister study in Minghu Junior High School?	Ariel
siar	B03200088	1J0	2		\N
siar	B03200064	1J0	1		\N
siar	B03200032	1J0	3	Who likes to listen songs in the free time?	Ariel
siar	B03200046	1J0	7	Whose Chinese name is ChiYuan Tien?	Ariel
siar	B03200037	1J0	4	Who does Simon younger sister ?	Simon
siar	B03200012	1J0	13	Whose younger sister study in Junior High School?	Simon
siar	B03200056	1J0	7	Who younger sister studies in Minghu Junior High School	Simon
siar	B03200034	1J0	19	Does she live in Taipei?	Chiyuantien
siar	B03200082	1J0	7		\N
siar	B03200034	1J0	20	Does she live in Taipei?	Simon
siar	B03200042	1J0	9	Who like the basketball?	--
siar	B03200042	1J0	10	Who like the basketball?	--
siar	B03200071	1J0	9	Who is a humorous people?	Simon
siar	B03200042	1J0	12	Who like the basketball?	--
siar	B03200060	1J0	7	What does Simon feel ?	Yes
siar	B03200031	1J0	26	Does Simon have a younger sister?	Yes
siar	B03200098	1J0	2	what do you do in your free time？	Ariel
siar	B03200012	1J0	14	Whose older brother studies in WenHua University?	Simon
siar	B03200052	1J0	12	who like to play guitar?	Yes
siar	B03200034	1J0	21	who like English?	Ariel
siar	B03200083	1J0	12	Who can play the guitar?	Simon
siar	B03200034	1J0	22	who like English?	Chiyuantien
siar	B03200034	1J0	23	who like English?	Simon
siar	B03200052	1J0	13		\N
siar	B03200042	1J0	15	Who like the basketball?	Ariel
siar	B03200046	1J0	8		\N
siar	B03200060	1J0	8	Does Simon feel ?	Yes
siar	B03200046	1J0	9		\N
siar	B03200042	1J0	16	Who like the basketball?	--
siar	B03200042	1J0	17	Who like the basketball?	--
siar	B03200063	1J0	19	Who is playing the drums	Chiyuantien
siar	B03200089	1J0	4	Who is her older brother?	Chiyuantien
siar	B03200019	1J0	9	Who likes to listen to English songs?	Ariel
siar	B03200018	1J0	4	Who does nice and easy to get along with?	--
siar	B03200003	1J0	9		\N
siar	B03200034	1J0	24	Does he like to play baseball?	Ariel
siar	B03200063	1J0	20	Who is play the drums	Ariel
siar	B03200018	1J0	5	Who does nice and easy to get along with?	Simon
siar	B03200003	1J0	10		\N
siar	B03200034	1J0	25	Does he like to play baseball?	Chiyuantien
siar	B03200078	1J0	6		\N
siar	B01202106	1J0	5	 Does Simon live in Taiepi?	Simon
siar	B03200078	1J0	7		\N
siar	B03200034	1J0	26	Does he like to play baseball?	Simon
siar	B03200087	1J0	21		\N
siar	B03200060	1J0	9	What is Simon's feel ?	Yes
siar	B03200031	1J0	27	Does Ariel have a younger sister?	No
siar	B03200083	1J0	13	Who have an old brother?	Simon
siar	B03200106	1J0	4	Who like listening	Simon
siar	B03200063	1J0	21	Who playing the drums	--
siar	B03200063	1J0	22	Who playing the drums	Ariel
siar	B03200083	1J0	14	Who have an old brother?	Simon
siar	B03200012	1J0	15	Who has a younger sister?	Simon
siar	B03200084	1J0	1		\N
siar	B03200037	1J0	5	Does she live in Taipei ?	Ariel
siar	B03200039	1J0	4	Who want to be a translator or a tour guide?	Ariel
siar	B03200082	1J0	9	Who likes to play guitar?	Simon
siar	B03200071	1J0	10		\N
siar	B03200054	1J0	6	Who likes to play drums?	Simon
siar	B03200109	1J0	10	Who has a younger sisiter?	--
siar	B03200031	1J0	28	Does Ariel live in Taipei?	No
siar	B03200092	1J0	13	Does simon live in taipei ?	Yes
siar	B03200087	1J0	22	Dose she has a bother?	Yes
siar	B03200046	1J0	10	Does she want to be translator?	Yes
siar	B03200052	1J0	14		\N
siar	B03200078	1J0	8	Does Simon is humorous people?	Yes
siar	B01202104	1J0	2	Who likes to playing guitar?	Simon
siar	B03200087	1J0	23	Dose she has a bother?	No
siar	B03200071	1J0	11	Does she live in Taipei?	Ariel
siar	B03200074	1J0	4	Who have younger sister	Simon
siar	B03200092	1J0	14	Does simon live in Taipei ?	--
siar	B03200060	1J0	10	Does Simon feel good ?	Yes
siar	B03200092	1J0	15	Does simon live in Taipei ?	Yes
siar	B03200012	1J0	16	Who has a order brother?	Simon
siar	B01202106	1J0	6	Who  lives in Taiepi?	Simon
siar	B03200031	1J0	29	Does Ariel like to play baseball?	No
siar	B03200012	1J0	17	Who has an order brother?	Simon
siar	B03200060	1J0	11	Does Simon feel ?	Yes
siar	B03200042	1J0	18		\N
siar	B03200037	1J0	6	Does Ariel feel ?	Ariel
siar	B03200082	1J0	10		\N
siar	B03200056	1J0	8	Who like to play baseball 	Simon
siar	B03200082	1J0	11		\N
siar	B03200063	1J0	23		\N
siar	B03200064	1J0	2		\N
siar	B03200063	1J0	24		\N
siar	B03200071	1J0	12	Doesn't he has younger brother?	Simon
siar	B03200083	1J0	15	Who likes to study English?	Ariel
siar	B03200012	1J0	18	Who has an older brother?	Simon
siar	B03200097	1J0	8	Whose Chinese name is ChiYuan Tien?	Ariel
siar	B03200034	1J0	27	Whose favorite sport is baseball?	Ariel
siar	B03200063	1J0	25	does she feel happy	Yes
siar	B03200083	1J0	16	Who likes to study English?	Ariel
siar	B03200102	1J0	16		\N
siar	B03200109	1J0	11	Does he has a younger sister	Simon
siar	B03200037	1J0	7		\N
siar	B03200039	1J0	5	Who is want to be a translator or a tour guide?	Ariel
siar	B03200056	1J0	9	Who likes to play baseball 	Simon
siar	B03200078	1J0	9	Does Ariel like to make friends?	Yes
siar	B03200106	1J0	5	Who likes listening?	Simon
siar	B03200031	1J0	30	Does Simon love to play drums?	No
siar	B03200063	1J0	26	does simon happy	--
siar	B03200083	1J0	17	Who can speak the English?	Ariel
siar	B03200088	1J0	3	Who like to listen to English song?	Ariel
siar	B03200088	1J0	5		\N
siar	B03200013	1J0	3	who like to listen English songs in the free time?	Ariel
siar	B03200078	1J0	11		\N
siar	B03200012	1J0	19	Whose older brother studies in WenHua University?	Simon
siar	B03200034	1J0	32	Who is playing the drums ?	Simon
siar	B03200037	1J0	9	Doesn't Simon love to play drums ?	No
siar	B03200039	1J0	7	Who lives in Taipei?	Simon
siar	B03200032	1J0	4	Who wants to be a tour guide in the future?	Ariel
siar	B03200037	1J0	8		\N
siar	B03200031	1J0	31	Does Ariel love to play drums?	No
siar	B01202106	1J0	7	Who  lives in Taiepi?	--
siar	B03200063	1J0	27	does Simon happy	Yes
siar	B03200031	1J0	32		\N
siar	B03200097	1J0	9	Who has older brother?	Simon
siar	B03200034	1J0	30	Who is playing the drums	Simon
siar	B03200031	1J0	33		\N
siar	B03200088	1J0	4		\N
siar	B03200019	1J0	11		\N
siar	B03200040	1J0	2	Where does Simon's older brother study?	Simon
siar	B03200034	1J0	31	Who is playing the drums?	Simon
siar	B03200029	1J0	12	Who older brother study in culture University	Simon
siar	B03200039	1J0	6	Who live in Taipei?	Simon
siar	B03200082	1J0	12	Does Simon's younger sister  studing in MingHu junior high school?	Yes
siar	B03200019	1J0	10	Who wants to be a translator?	Ariel
siar	B03200092	1J0	16	Does Ariel want to be a tour guide ?	Yes
siar	B03200109	1J0	12	Does he has a younger sister?	Simon
siar	B03200060	1J0	12	Does Simon live in taipei ?	Yes
siar	B03200034	1J0	28	Who is playing the drums	Ariel
siar	B03200054	1J0	7	Who is humorous person?	Simon
siar	B03200034	1J0	29	Who is playing the drums	Chiyuantien
siar	B03200078	1J0	10		\N
siar	B03200064	1J0	3	Does Simon playing guitar?	Simon
siar	B03200089	1J0	5	Do her younger sister like to sing?	Simon
siar	B03200019	1J0	12		\N
siar	B03200083	1J0	18	Who is 19 years old?	Ariel
siar	B03200087	1J0	24	whose family loves song?	Yes
siar	B03200018	1J0	6	Does Simon love play guitar?	Simon
siar	B03200097	1J0	10	Who has  an older brother?	Simon
siar	B03200034	1J0	33	Who is play the drums ?	Simon
siar	B03200078	1J0	12	Who like to make friends?	Ariel
siar	B01202106	1J0	8	Who likes to play baseball?	Simon
siar	B01202104	1J0	3	Does Ariel love to play the guitar?	Ariel
siar	B03200056	1J0	10	Who likes to play baseball game	Simon
siar	B03200034	1J0	34	Who is play the drums?	Simon
siar	B03200034	1J0	35	Who is play the drums?	--
siar	B03200089	1J0	6	Do her younger sister like to sing?	Simon
siar	B03200052	1J0	15	When does Ariel born?	Ariel
siar	B03200013	1J0	4	who like to listen English songs in his free time?	Ariel
siar	B03200037	1J0	10		\N
siar	B03200034	1J0	36	Who is play the drums	Simon
siar	B03200018	1J0	7	Does Simon love play the guitar?	Simon
siar	B03200083	1J0	19	Who is the youngest in the family?	Ariel
siar	B03200037	1J0	11		\N
siar	B03200087	1J0	25	whose family love song?	--
siar	B03200029	1J0	13	Who like to play baseball?	Simon
siar	B03200078	1J0	13	Who like to make a lot of friends?	Ariel
siar	B03200071	1J0	13		\N
siar	B03200003	1J0	11	What does she like to do?	Ariel
siar	B03200083	1J0	20	Who is the 19 years old in the family?	Ariel
siar	B03200046	1J0	11	Does Ariel feel interesting?	Yes
siar	B03200109	1J0	13	Does't he like drums?	Simon
siar	B03200089	1J0	7	Do her younger sister like to sing?	Ariel
siar	B03200094	1J0	4	Does he feel happy?	Simon
siar	B03200012	1J0	20	Whose older brother studies in WenHua University?	Simon
siar	B03200031	1J0	34	Whose family have five people?	Simon
siar	B03200083	1J0	21	Who is the 19-year-old in the family?	Ariel
siar	B03200074	1J0	5	whose favorite sport is basketball	Simon
siar	B03200013	1J0	5	who want to be a translator or a tour guide?	Ariel
siar	B03200046	1J0	12	Does Ariel feel happy?	Yes
siar	B03200097	1J0	11	Who likes to listen English songs?	Ariel
siar	B03200040	1J0	3	When Ariel borned?	Ariel
siar	B03200031	1J0	35	Who family have five people?	Simon
siar	B03200032	1J0	5	Who wants to be a tour guide in the future?	Ariel
siar	B03200045	1J0	4		\N
siar	B03200078	1J0	14	Who like to make friends?	Ariel
siar	B03200062	1J0	2	What does Ariel do in her free time?	--
siar	B03200074	1J0	6	whose favorite sport is baseball	Simon
siar	B03200098	1J0	3	what color do you like best?	Ariel
siar	B03200087	1J0	26	Does SImon love song?	Yes
siar	B03200098	1J0	4	what color do you like best?	--
siar	B03200054	1J0	8	Who like listening to English song?	Ariel
siar	B03200098	1J0	5	what color do you like best?	Chiyuantien
siar	B03200031	1J0	36	Whose family has five people?	Simon
siar	B03200087	1J0	27	Does Simon love song?	Yes
siar	B03200083	1J0	22	Who have a younger sister?	Simon
siar	B03200088	1J0	6	Does Simon order brother studies in WenHua University?	Yes
siar	B03200006	1J0	5	Does she have the younger sister?	Ariel
siar	B03200034	1J0	37	Who is play the drums gab	Simon
siar	B03200039	1J0	8	Whose sister is studying in MingHu Junior High School?	Simon
siar	B03200102	1J0	17		\N
siar	B03200040	1J0	4	When does Ariel born?	Ariel
siar	B03200019	1J0	13	Are there four people in Simon family?	No
siar	B03200034	1J0	38	Who is play the drums gab?	--
siar	B03200034	1J0	39	Who is play the drums gab?	Simon
siar	B03200087	1J0	28	Does Simon love a song?	--
siar	B01202106	1J0	9	Who likes to play baseball?	Simon
siar	B03200032	1J0	6	Who wants to be a tour guide in the future?	Ariel
siar	B03200087	1J0	29	Does Simon love a song?	Yes
siar	B03200045	1J0	5	are they are they are thay	Ariel
siar	B03200083	1J0	23	Who have a sister?	Simon
siar	B03200082	1J0	13	Does Simon's younger sister studing in Minghu Junior High School?	Yes
siar	B03200089	1J0	8	Do her younger sister like to sing?	--
siar	B03200089	1J0	9	Do her younger sister like to sing?	--
siar	B03200089	1J0	10	Do her younger sister like to sing?	--
siar	B03200088	1J0	7	Does Simon order brother studies in WenHua University?	Yes
siar	B03200050	1J0	8	Who has older brother?	--
siar	B03200089	1J0	11	Do her younger sister like to sing?	Chiyuantien
siar	B03200062	1J0	3	What does Ariel do in her free time?	--
siar	B03200052	1J0	16	What does Ariel like to do	Ariel
siar	B03200109	1J0	14	Does't Simon like drums?	Simon
siar	B03200082	1J0	14	Does Simon's younger sister study in Minghu Junior High School?	--
siar	B03200056	1J0	11	Who has an older brother	Simon
siar	B03200037	1J0	12		\N
siar	B03200031	1J0	37	Who is 20 years old?	Chiyuantien
siar	B03200029	1J0	14	Who has a younger sister?	Simon
siar	B03200074	1J0	7	whose parents lives in Taipei	Simon
siar	B03200012	1J0	21	Who likes to listen English songs in the free time?	Ariel
siar	B03200078	1J0	15	Who is a logically people?	Simon
siar	B03200062	1J0	4	What does Ariel do in her free time?	--
siar	B03200062	1J0	6	What does Ariel do in her free time?	--
siar	B03200032	1J0	7		\N
siar	B03200039	1J0	9	Whose family has three people?	Ariel
siar	B03200019	1J0	14	Are there four people in Simon family?	No
siar	B03200037	1J0	13	Does Ariel want to be a tour guide ?	--
siar	B03200082	1J0	15	Does Simon's older brother study in WenHua University?	Yes
siar	B03200062	1J0	7	What does Ariel do in her free time?	--
siar	B03200089	1J0	13	Does he live in Taipei?	Yes
siar	B03200019	1J0	16		\N
siar	B03200052	1J0	18	Does Ariel like English?	Ariel
siar	B03200012	1J0	23		\N
siar	B03200094	1J0	5	Does Simon like to listening music?	Simon
siar	B03200074	1J0	8	whose father lives in Taipei	Simon
siar	B03200031	1J0	38	Who have an younger sister?	Simon
siar	B03200012	1J0	24		\N
siar	B03200037	1J0	17	Does Ariel feel funny?	Yes
siar	B03200088	1J0	8		\N
siar	B03200078	1J0	16	Whose major subject is English?	Ariel
siar	B01202104	1J0	4		\N
siar	B03200029	1J0	15	Who likes play baseball?	Simon
siar	B03200045	1J0	8	What do Simon loves to playing?	Simon
siar	B03200037	1J0	18	Does Ariel feel sad?	No
siar	B03200094	1J0	6	Who is happy person?	Ariel
siar	B03200083	1J0	25	Who likes to study the English?	Ariel
siar	B03200037	1J0	19	Doesn't Ariel have a younger sister?	No
siar	B03200056	1J0	13	Who is a humorous person	Simon
siar	B03200046	1J0	14	Does Simon love to play guitar?	Yes
siar	B03200006	1J0	7	what the sport subject does Simon like?	Simon
siar	B03200019	1J0	17	Who wii do her best to complete any task?	Ariel
siar	B03200082	1J0	16	Does Simon have a good ability to get used to in a new environment?	Yes
siar	B03200088	1J0	9	Does Simon order brother studies in WenHua University?	Yes
siar	B03200054	1J0	9	Does she feel happy?	Ariel
siar	B03200078	1J0	17	Who majors in English?	Ariel
siar	B03200097	1J0	13	Who is a humorous person?	Simon
siar	B03200098	1J0	6	what color do you like best?	Ariel
siar	B03200052	1J0	17	How old is Ariel	Ariel
siar	B03200032	1J0	8		\N
siar	B01202106	1J0	10	Who can play baseball?	Simon
siar	B03200098	1J0	7	what sport do you like best?	--
siar	B03200037	1J0	16	Doesn't he like to play baseball?	No
siar	B03200092	1J0	17	Is Ariel 's chinese name ChiYuan Tien ?	Yes
siar	B03200003	1J0	12		\N
siar	B03200062	1J0	8	What does Ariel do in her free time?	--
siar	B03200109	1J0	15	Does Simon have friend?	Simon
siar	B03200019	1J0	15		\N
siar	B01202106	1J0	11	Who  lives in Taiepi?	--
siar	B03200032	1J0	10	Who wants to be a tour guide in the future?	Ariel
siar	B03200046	1J0	13	Does Simon loves to play guitar?	Yes
siar	B03200106	1J0	6	Does he like to play baseball?	Simon
siar	B03200029	1J0	16	Who likes to play baseball?	--
siar	B03200006	1J0	6	what the sport subject does Simon like?	Simon
siar	B03200097	1J0	12	Who is a humor person?	Simon
siar	B03200098	1J0	9	which sport do you like best?	Simon
siar	B03200052	1J0	19	who like to play guitar?	Simon
siar	B03200050	1J0	9	Does he like to play baseball?	--
siar	B03200039	1J0	11	Whose brother studies in WenHua University?	Simon
siar	B03200031	1J0	39	Who is she?	Ariel
siar	B03200074	1J0	9	whose father lives in Taipei	Simon
siar	B03200012	1J0	25	Does Ariel like English?	Yes
siar	B03200045	1J0	6	are they are they are thay	Simon
siar	B03200062	1J0	5	What does Ariel do in her free time?	--
siar	B03200089	1J0	12		\N
siar	B03200037	1J0	14		\N
siar	B03200037	1J0	15		\N
siar	B03200056	1J0	12	Whose older brother studies in WenHua University	Simon
siar	B03200032	1J0	9	Who wants to be a tour guide in the future?	Ariel
siar	B03200012	1J0	22	Who is 19 years old	Ariel
siar	B03200003	1J0	13		\N
siar	B03200039	1J0	10	Who is nice and easy to get along with?	Simon
siar	B03200098	1J0	8	which sport do you like best?	Ariel
siar	B03200045	1J0	7	What do Simon love?	Simon
siar	B03200062	1J0	9	What does Ariel do in her free time?	--
siar	B03200083	1J0	24	Who likes to learn the English?	Ariel
siar	B03200045	1J0	9	Why do Simon loves to playing?	--
siar	B03200045	1J0	10	Why do Simon loves to playing?	Simon
siar	B03200089	1J0	14	Does he 19 years old?	Yes
siar	B01202106	1J0	12		\N
siar	B03200031	1J0	40	Who have an young sister?	Simon
siar	B03200102	1J0	18	Does Simon love play the guitar?	Yes
siar	B03200098	1J0	10	which sport do you like best?	Ariel
siar	B03200032	1J0	11	Who have father?	Ariel
siar	B03200045	1J0	11	do Simon love to playing?	--
siar	B03200006	1J0	8	what the sport subject does Simon like?	Simon
siar	B03200089	1J0	15	Does he 19 years old?	Yes
siar	B03200045	1J0	12	do Simon love to playing?	Simon
siar	B03200045	1J0	13	do Simon love to playing?	--
siar	B03200045	1J0	14	do Simon love to playing?	--
siar	B03200089	1J0	16	Does he 19 years old?	No
siar	B03200063	1J0	28	does Simon have a younger sister	Yes
siar	B03200012	1J0	26	Whose older brother studies in WenHua University?	Simon
siar	B03200102	1J0	19	Does Simon loves play the guitar?	Yes
siar	B03200012	1J0	27	Does Simon like to play drums?	Yes
siar	B03200032	1J0	12	Who has father?	Simon
siar	B03200102	1J0	20	Does Simon like play the guitar?	Yes
siar	B03200031	1J0	41	Whose family has three people?	Simon
siar	B03200037	1J0	20	Does Arial has five people in her family ?	Yes
siar	B03200019	1J0	18	Who wii do her best in any task?	Ariel
siar	B03200109	1J0	16	Whos favorite is Engish?	Simon
siar	B03200094	1J0	7	Who doesn't feel happy?	Ariel
siar	B03200089	1J0	17	Are they 19 years old?	Yes
siar	B03200089	1J0	18	Are they 19 years old?	--
siar	B03200089	1J0	19	Are they 19 years old?	--
siar	B03200089	1J0	20	Are they 19 years old?	--
siar	B03200003	1J0	14	Who likes to play guitar?	Ariel
siar	B03200098	1J0	11	which sport do you like best?	Ariel
siar	B03200031	1J0	42	Who live in Taipei?	Simon
siar	B03200098	1J0	12	which sport do you like best?	--
siar	B03200082	1J0	17		\N
siar	B03200019	1J0	19	Who will do her best in any task?	Ariel
siar	B03200045	1J0	15	Do he love to playing?	Simon
siar	B03200082	1J0	18		\N
siar	B03200098	1J0	13	which sport do you like best?	Chiyuantien
siar	B03200052	1J0	20	who like to play baseball?	Simon
siar	B03200012	1J0	28	Does Simon have an older brother?	Yes
siar	B03200082	1J0	19	Who is 18 years old?	Simon
siar	B03200045	1J0	16	Do he love to playing?	Simon
siar	B03200098	1J0	14	which sport do you like best?	Simon
siar	B03200045	1J0	17	Does he love to playing?	Simon
siar	B03200102	1J0	21		\N
siar	B03200045	1J0	18	Does he love to playing?	Simon
siar	B03200098	1J0	15	which sport do you like best?	Ariel
siar	B03200062	1J0	10	Who likes to make a lot of friends?	--
siar	B03200089	1J0	21	Are they 19 years old?	--
siar	B03200089	1J0	22	Are they 19 years old?	--
siar	B03200089	1J0	23	Are they 19 years old?	--
siar	B03200097	1J0	14	Whose older brother studies in WenHua University?	Simon
siar	B03200089	1J0	24	Are they 19 years old?	--
siar	B03200032	1J0	13	Who wants to be a tour guide?	Ariel
siar	B03200054	1J0	10	Who can play drums?	Simon
siar	B03200052	1J0	21	who like to play baseball ?	Simon
siar	B03200083	1J0	26	Who likes to study English?	Ariel
siar	B03200045	1J0	19	Does he love to play guitar?	Simon
siar	B03200045	1J0	20	Does he love to play guitar?	Simon
siar	B03200106	1J0	7	who likes to listening?	Simon
siar	B03200082	1J0	20		\N
siar	B03200078	1J0	18	Who likes to listen to music?	Simon
siar	B03200052	1J0	22	who like to play baseball ?	Chiyuantien
siar	B03200074	1J0	10	who is humorous	Simon
siar	B03200012	1J0	29	Does Simon have a younger sister?	Yes
siar	B03200082	1J0	21		\N
siar	B03200039	1J0	12	Who wants to be a translator or a tour guide?	Ariel
siar	B03200087	1J0	30	Does Simon have family?	Yes
siar	B03200088	1J0	10	Does Simon like to play guitar?	Yes
siar	B03200032	1J0	14		\N
siar	B03200087	1J0	31	Does Simon have a family?	Yes
siar	B03200054	1J0	11	Who is born on July 6, 1996?	Ariel
siar	B03200019	1J0	20	Who will do her best at any task?	Ariel
siar	B03200083	1J0	27	Who likes the English?	Ariel
siar	B03200037	1J0	21	Doesn't Simon live in Taipei?	No
siar	B03200032	1J0	15		\N
siar	B03200006	1J0	9		\N
siar	B03200006	1J0	10		\N
siar	B03200031	1J0	43	Who dosen't have old brother?	Ariel
siar	B03200019	1J0	21	Who will do her best on any task?	Ariel
siar	B01202106	1J0	13	Does Simon like to play baseball?	Yes
siar	B03200082	1J0	22	Does simon's family have five people ?	Yes
siar	B03200089	1J0	25		\N
siar	B03200046	1J0	15	Does Simon's older brother studies in WenHua University?	Yes
siar	B03200046	1J0	16	Does Simon's older brother studies in WenHua University?	Yes
siar	B03200034	1J0	40		\N
siar	B01202104	1J0	5	Does Ariel love to playing drums?	Yes
siar	B03200098	1J0	16		\N
siar	B03200082	1J0	23	Does Simon's family have five people ?	Yes
siar	B03200003	1J0	15	Who likes to play guitar?	Chiyuantien
siar	B03200037	1J0	22		\N
siar	B03200106	1J0	8	who likes to listening?	Ariel
siar	B03200037	1J0	23		\N
siar	B01202104	1J0	6	Does Ariel love to play drums?	Yes
siar	B03200037	1J0	25	What does Arial happy?	Ariel
siar	B03200012	1J0	32	Is Simon humorus?	Yes
siar	B03200034	1J0	44	Does Simon older brother ?	No
siar	B03200056	1J0	14	Who favorite subject is English 	Chiyuantien
siar	B03200046	1J0	18		\N
siar	B03200046	1J0	19		\N
siar	B03200003	1J0	16	Who likes to play guitar?	Simon
siar	B03200097	1J0	15	Who loves to play the drums?	Simon
siar	B03200063	1J0	30	does Simon have a father	Yes
siar	B03200082	1J0	29	Whose father lives in Taipei?	Simon
siar	B03200054	1J0	12		\N
siar	B03200042	1J0	19		\N
siar	B03200094	1J0	11	Who can play the guitar?	Simon
siar	B03200082	1J0	30	Whose brother lives in Taipei?	Simon
siar	B03200082	1J0	31	Whose brother lives in Taipei?	--
siar	B03200106	1J0	9	Does he love to listening?	--
siar	B03200032	1J0	16	Does Ariel want to be a tour guide?	Yes
siar	B03200062	1J0	12	Whose family has three people?	--
siar	B01202104	1J0	9	Does Ariel like to play drums?	Yes
siar	B03200013	1J0	7	who is 19 years old?	Ariel
siar	B03200071	1J0	14		\N
siar	B03200012	1J0	30	Does Simon like to play baseball?	Yes
siar	B03200046	1J0	17	Does Simon older brother studies in WenHua University?	Yes
siar	B03200031	1J0	44	Who dosen't have an old brother?	Ariel
siar	B03200006	1J0	11	Does he like to playing drums?	Yes
siar	B03200098	1J0	17	which sport do you like best?	Ariel
siar	B03200034	1J0	41	Does Simon older brother studies in WenHua University?	Yes
siar	B03200034	1J0	42	Does Simon older brother studies in WenHua University?	No
siar	B03200082	1J0	28	Who wants to be a translator?	Ariel
siar	B03200050	1J0	10	Who wants to be a tour guide?	Ariel
siar	B03200083	1J0	28	Does she live in Taipei?	Ariel
siar	B03200034	1J0	46	Does Simon  have older brother ?	No
siar	B03200098	1J0	18	who do like best in your family?	Ariel
siar	B03200094	1J0	8	Whose mother lives in Japan?	Ariel
siar	B03200012	1J0	31	Whose older brother studies in WenHua University?	Simon
siar	B03200037	1J0	24	What does Arial happy?	Ariel
siar	B03200094	1J0	9	Whose mother lives in Taipei?	Simon
siar	B03200034	1J0	43	Does Simon older brother ?	Yes
siar	B03200082	1J0	24		\N
siar	B03200062	1J0	11	Whose family has three people?	--
siar	B03200082	1J0	25		\N
siar	B03200082	1J0	26	Who wants to be a translator?	Ariel
siar	B03200109	1J0	17	Does Simon fell happy?	Simon
siar	B01202104	1J0	7	Does Ariel love to playing drums?	No
siar	B03200056	1J0	15	Who favorites subject is English 	--
siar	B03200012	1J0	33	Is Simon humorous?	Yes
siar	B03200063	1J0	29	does simon have a father	Yes
siar	B03200082	1J0	27		\N
siar	B03200003	1J0	17	Who likes to play guitar?	Chiyuantien
siar	B01202104	1J0	8	Does Ariel love to play drums?	No
siar	B03200094	1J0	10	Who is a happy person?	Ariel
siar	B03200013	1J0	6	who likes English	Ariel
siar	B03200012	1J0	34	Whose older brother studies in WenHua University?	Simon
siar	B03200089	1J0	26	Is he optimistic?	Yes
siar	B03200102	1J0	22		\N
siar	B03200034	1J0	45	Does Simon is a girl ?	No
siar	B03200078	1J0	19	Whose younger sister studying in MingHu  junior high school?	Simon
siar	B03200082	1J0	32	Whose brother lives in Taipei?	--
siar	B03200102	1J0	23	Does Simon love to play the guitar?	Yes
siar	B03200042	1J0	20	Who like the basketball?	Simon
siar	B03200106	1J0	10	Does he love to listening?	Simon
siar	B03200082	1J0	33	Whose sister lives in Taipei?	Simon
siar	B03200034	1J0	47	Does Simon  have older brother ?	Yes
siar	B03200037	1J0	26	Whom like to play baseball?	Simon
siar	B03200056	1J0	16	Who favorite subject is English 	Chiyuantien
siar	B03200089	1J0	27	Is he a optimistic person ?	--
siar	B03200063	1J0	31	Does Ariel have a older brother	No
siar	B03200032	1J0	17	Does Simon want to be a tour guide?	No
siar	B03200029	1J0	17	Who likes to subject is English?	Ariel
siar	B03200102	1J0	24		\N
siar	B03200092	1J0	18		\N
siar	B03200102	1J0	25		\N
siar	B03200046	1J0	20	Who listening songs ?	Ariel
siar	B03200094	1J0	12		\N
siar	B03200039	1J0	13		\N
siar	B03200034	1J0	48	Does Ariel like to play baseball\t	Yes
siar	B03200054	1J0	13	Does Simon like to play drums?	Simon
siar	B03200029	1J0	18	Who wants to be a tour guide?	Ariel
siar	B03200012	1J0	35	Dose Ariel like English?	Yes
siar	B03200078	1J0	20		\N
siar	B03200097	1J0	16	Who is a logical person?	Simon
siar	B03200052	1J0	23	who like to play baseball ?	Chiyuantien
siar	B03200082	1J0	34	Whose family lives in Taipei?	Simon
siar	B03200034	1J0	49	Does she live in Taipei?	Yes
siar	B03200056	1J0	17		\N
siar	B03200046	1J0	21	Who listening songs in her free time?	Ariel
siar	B03200078	1J0	21	who has younger sister ?	Simon
siar	B03200109	1J0	18	Does Simon fell happy?	Simon
siar	B03200074	1J0	11		\N
siar	B03200003	1J0	18		\N
siar	B03200089	1J0	28	Do you like your mother?	Yes
siar	B03200087	1J0	32	Does Ariel love Simon?	Yes
siar	B03200003	1J0	19		\N
siar	B03200062	1J0	13	Whose family has three people?	--
siar	B03200012	1J0	36	Dose Ariel have a order brother?	No
siar	B03200087	1J0	33	Does Ariel loves Simon?	No
siar	B03200013	1J0	8		\N
siar	B03200087	1J0	34	Does Ariel loves Simon?	No
siar	B03200098	1J0	19	Does Simon like to play baseball?	Simon
siar	B03200013	1J0	9		\N
siar	B03200089	1J0	29	Do you like your mother?	Yes
siar	B03200071	1J0	15	Who is a humorous person	Simon
siar	B03200089	1J0	30	Do you like your mother?	--
siar	B03200042	1J0	21	Who like play guitar?	Simon
siar	B03200050	1J0	11	Does Simon like to play drums?	--
siar	B03200019	1J0	22	Who says English is an important language in the world?	Ariel
siar	B03200109	1J0	19	Doesn't Simon fell happy?	Simon
siar	B03200087	1J0	35	Are Ariel love Simon?	Yes
siar	B03200052	1J0	24	who is play guitar	Simon
siar	B03200062	1J0	14	Whose family has three people?	--
siar	B03200062	1J0	15		--
siar	B03200062	1J0	16		--
siar	B03200109	1J0	20	Doesn't Simon feel happy?	Simon
siar	B03200089	1J0	31	Are you happy?	Yes
siar	B03200071	1J0	16		\N
siar	B03200078	1J0	22	Whose sister  study in Minghu Junior High School ?	Simon
siar	B03200039	1J0	14	Does Ariel want to be a translator or a tour guide?	Yes
siar	B03200062	1J0	17	Who likes to make a lot of friends?	--
siar	B03200034	1J0	50	Does Ariel love to play the guitar?	Yes
siar	B03200018	1J0	8		\N
siar	B01202104	1J0	10		--
siar	B03200042	1J0	22		\N
siar	B03200083	1J0	29	Who lives in Hsinchu county?	Ariel
siar	B03200089	1J0	32	Are you humorous?	Yes
siar	B03200052	1J0	25		\N
siar	B03200046	1J0	22	Who was born on July 6, 1996?	Ariel
siar	B03200013	1J0	10	Does Simon's old brother studies in WenHua University?	Yes
siar	B03200082	1J0	35	Who lives in Hsinchu ?	Ariel
siar	B03200012	1J0	37	Whose older brother studies in WenHua University?	Simon
siar	B03200056	1J0	18	Does she likes to listen to English	Yes
siar	B03200063	1J0	32	Is Ariel a positive person	Yes
siar	B03200029	1J0	19	Who likes to play guitar in the free time?	Simon
siar	B03200098	1J0	20	Does Simon like to play baseball?	--
siar	B03200078	1J0	23	who want to be a translator ?	Ariel
siar	B03200087	1J0	36	Is Ariel love Simon?	Yes
siar	B03200071	1J0	17	Does Simon love Ariel	No
siar	B03200078	1J0	25		\N
siar	B03200056	1J0	19	Does she likes to listen to English songs	Yes
siar	B01202106	1J0	14	Does Simon like to play guitar?	Yes
siar	B03200083	1J0	31	Does Ariel's Chinese name is ChiYuan Tien?	Ariel
siar	B03200092	1J0	19		\N
siar	B03200052	1J0	27	Where is Simon live?	Simon
siar	B03200046	1J0	23	Who is listening songs?\t	Ariel
siar	B03200042	1J0	23	Who doesn't like basketball?	Ariel
siar	B03200071	1J0	18		\N
siar	B03200034	1J0	52	Ariel loves Simon?	No
siar	B03200003	1J0	20	Who can sing a song?	Ariel
siar	B03200037	1J0	30		\N
siar	B03200083	1J0	33	Does Ariel call ChiYuan Tien?	Ariel
siar	B03200003	1J0	21	Who can sing a song?	Chiyuantien
siar	B03200098	1J0	24	Does Simon like to play baseball?	Yes
siar	B03200074	1J0	12	Is Simon lives in Taipei	Yes
siar	B03200092	1J0	21		\N
siar	B03200092	1J0	22		\N
siar	B03200037	1J0	32	Does Simon is a logical person?	Yes
siar	B03200109	1J0	23	who can play the drums?	Simon
siar	B03200083	1J0	40	Whose brother study in 文化 university?	Simon
siar	B03200042	1J0	26	Does Ariel play baseball?	No
siar	B03200102	1J0	27	Why do Ariel like to read English	Ariel
siar	B03200052	1J0	30	where is Ariel live?	Ariel
siar	B03200071	1J0	20	DoesChiyuantien  have a family?	Chiyuantien
siar	B03200089	1J0	34	Does Simon want to be a tour guide?	Simon
siar	B03200056	1J0	23	Does Ariel want to be a tour guide?	Yes
siar	B03200019	1J0	26	Who said the English was an important language?	Ariel
siar	B03200012	1J0	42	Whose older brother studies in WenHua University?	Simon
siar	B03200102	1J0	28	Why does Ariel like to read English?	--
siar	B03200098	1J0	30		\N
siar	B03200071	1J0	21	Does Chiyuantien  have a family?	Chiyuantien
siar	B03200012	1J0	43	Does Simon's younger sister study Minghu Junior High School ?	Yes
siar	B03200056	1J0	24	Does Simon want to be a tour guide?	No
siar	B03200018	1J0	9	Does Ariel have a younger sister?	Yes
siar	B03200089	1J0	33		\N
siar	B03200012	1J0	38	Does Ariel have a younger sister?	No
siar	B03200012	1J0	39	Does Ariel have a younger sister?	No
siar	B03200018	1J0	10	Does Simon play baseball?	Yes
siar	B03200062	1J0	19		\N
siar	B03200063	1J0	33		\N
siar	B03200098	1J0	22		\N
siar	B03200037	1J0	27	Who does feel happy?	Ariel
siar	B03200063	1J0	34		\N
siar	B03200019	1J0	23	Who says English is an important language in the world?	Ariel
siar	B03200084	1J0	2		\N
siar	B03200037	1J0	29		\N
siar	B03200037	1J0	31	Does Arial is a logical person?	Yes
siar	B03200003	1J0	22	Who can sing a song?	Simon
siar	B03200019	1J0	24	Who said English is an important language in the world?	Ariel
siar	B03200056	1J0	20	Does Simon want to be a translator or a tour guide?	No
siar	B03200098	1J0	27	Does Simon like to play ball?	No
siar	B03200037	1J0	33	Doesn't Ariel have a younger sister?	No
siar	B03200102	1J0	26	why do you like to read English	Ariel
siar	B03200037	1J0	34	Doesn't Ariel have a younger sister?	Yes
siar	B03200052	1J0	29	what does Ariel favorite subject?	Ariel
siar	B03200037	1J0	35	Doesn't Ariel want to be a translator or a tour guide?	No
siar	B03200098	1J0	29	Does Simon like to play basketball?	Yes
siar	B03200098	1J0	31		\N
siar	B03200098	1J0	21	Does Simon like to play baseball?	Simon
siar	B03200078	1J0	24	who wants to be a translator ?	Ariel
siar	B03200052	1J0	26		\N
siar	B03200062	1J0	18	Who likes to play a guitar?	--
siar	B03200109	1J0	21		\N
siar	B03200083	1J0	30	Does her Chinese name is ChiYuan Tien?	Ariel
siar	B03200013	1J0	11	Doesn't Simon like play baseball?	No
siar	B03200083	1J0	32	Does Ariel Chinese name is ChiYuan Tien?	Ariel
siar	B03200034	1J0	51	Ariel loves Simon?	No
siar	B03200034	1J0	53	Ariel loves Simon?	Yes
siar	B03200012	1J0	40	Whose older brother studies in WenHua University?	Simon
siar	B03200052	1J0	28	What is Simon's favorite sport?	Simon
siar	B03200087	1J0	37	Is Ariel love Simon?	--
siar	B03200098	1J0	23		\N
siar	B03200013	1J0	12	Does Simon like play baseball?	Yes
siar	B03200092	1J0	20	Who wants to be a tour guide ?	Ariel
siar	B03200071	1J0	19	Who like math?	Simon
siar	B01202104	1J0	11		--
siar	B03200037	1J0	28		\N
siar	B03200012	1J0	41	Does Ariel have an older brother?	No
siar	B03200097	1J0	17	Whose favorite subject is English?	Ariel
siar	B03200083	1J0	34	Does Ariel call ChiYuan Tien?	--
siar	B03200083	1J0	35	Does Ariel call ChiYuan Tien?	--
siar	B03200083	1J0	36	Does Ariel call ChiYuan Tien?	--
siar	B03200083	1J0	37	Does Ariel call ChiYuan Tien?	--
siar	B03200083	1J0	38	Does Ariel call ChiYuan Tien?	--
siar	B03200042	1J0	24	Does Simon listening the songs	Simon
siar	B03200098	1J0	25		\N
siar	B03200109	1J0	22		\N
siar	B03200083	1J0	39	Whose brother study in 文化 unuversuty?	Simon
siar	B03200042	1J0	25		\N
siar	B03200098	1J0	26	Does Simon like to play ball?	Yes
siar	B03200019	1J0	25	Who said the English was an important language in the world?	Ariel
siar	B03200056	1J0	21	Does Simon want to be a translator	No
siar	B03200056	1J0	22	Does Ariel want to be a translator 	Yes
siar	B03200098	1J0	28	Does Simon like to play soccor?	Yes
siar	B03200087	1J0	38	Did Ariel loved Simon?	Yes
siar	B03200037	1J0	36	Does he live in Taipei?	Yes
siar	B01202104	1J0	12	Does he love to play drums?	Yes
siar	B03200082	1J0	36	Who is a humorous person?	Simon
siar	B03200052	1J0	31	how many people in Ariel's family?	Ariel
siar	B03200094	1J0	13	Does Simon's younger brother study in Junior High School?	No
siar	B03200071	1J0	22	Doesn't Chiyuantien feel happy?	--
siar	B03200037	1J0	37	Doesn't Simon live in Taipei?	No
siar	B03200071	1J0	23	Doesn't Chiyuantien feel happy?	Chiyuantien
siar	B03200029	1J0	20	Who likes to enjoy the baseball game?	Simon
siar	B03200003	1J0	23	who is college student?	Ariel
siar	B03200062	1J0	20	Does Ariel likes to listen to English songs?	--
siar	B03200098	1J0	32	Who like to play baseball	Simon
siar	B03200056	1J0	25	Does Simon play baseball?	Yes
siar	B03200074	1J0	13	Who feel relaxed	Simon
siar	B03200098	1J0	33	Who likes to play baseball	Simon
siar	B03200003	1J0	24	who is college student?	Simon
siar	B03200052	1J0	32	when does Simon born?	Simon
siar	B03200063	1J0	35	Who likes to sing a song	Ariel
siar	B03200094	1J0	14	Does Simon's older brother study in Junior High School?	No
siar	B01202104	1J0	13	Does Simon like to play drums?	No
siar	B03200056	1J0	26	Does she love to play drums?	No
siar	B03200071	1J0	24	Does Chiyuantien play baseball?	Chiyuantien
siar	B03200012	1J0	44	Does Ariel have mother?	Yes
siar	B03200032	1J0	18	Does Simon study in WenHua University	No
siar	B03200012	1J0	45	Whose older brother studies in WenHua University?	Simon
siar	B03200012	1J0	46	Does Ariel have a mother?	Yes
siar	B03200052	1J0	33	What sport does Simon like?	--
siar	B03200098	1J0	34		\N
siar	B03200098	1J0	35		\N
siar	B03200056	1J0	27	Is Ariel humorous?	No
siar	B03200097	1J0	18	Whoes family has father, mather, older brother, and younger sister?	Simon
siar	B03200042	1J0	27		\N
siar	B03200012	1J0	47	Does Simon have a mother?	Yes
siar	B03200074	1J0	14	Is Simon humorous	Yes
siar	B03200046	1J0	24	Does Ariel have mother?	Ariel
siar	B01202106	1J0	15	Does Ariel like English?	Yes
siar	B03200082	1J0	37		\N
siar	B03200078	1J0	26		\N
siar	B03200082	1J0	38	Does Simon have mother?	Yes
siar	B03200082	1J0	39	Does Simon have mother?	--
siar	B03200082	1J0	40	Does Simon have sister?	Yes
siar	B03200046	1J0	25	Does Ariel have father?	Ariel
siar	B03200078	1J0	27	Who wants to be a tour guide ?	Ariel
siar	B03200082	1J0	41	Does Simon have brother?	Yes
siar	B03200012	1J0	48	Does Simon have a order brother?	Yes
siar	B03200089	1J0	35	Who want to be a tour guide?	--
siar	B03200052	1J0	34	where does Ariel live?	Ariel
siar	B03200046	1J0	26	Does Ariel has father?	Ariel
siar	B03200071	1J0	25	Does she play the tour guide?	Ariel
siar	B03200012	1J0	49	Does Simon have an younger sister?	Yes
siar	B03200037	1J0	38	Doesn't Ariel like to make friends?	No
siar	B03200089	1J0	36	Who be a tour guide?	Ariel
siar	B03200084	1J0	3	Does Simon have brother?	--
siar	B03200084	1J0	4	Does Simon have brother?	Simon
siar	B03200089	1J0	37	Who is a tour guide?	Ariel
siar	B03200029	1J0	21		\N
siar	B03200098	1J0	36	Does Simon like to play tennis?	Yes
siar	B01202104	1J0	14	Doesn Ariel love to play drums?	No
siar	B03200052	1J0	35	who lives in Taipei	Simon
siar	B03200042	1J0	28		\N
siar	B03200042	1J0	29		\N
siar	B03200018	1J0	11		\N
siar	B03200012	1J0	50	Does he play the tour guide	Yes
siar	B03200078	1J0	28	who is a humorous person?	Simon
siar	B03200012	1J0	51	Does he play the drums?	Yes
siar	B03200089	1J0	38	Whose baseball?	Simon
siar	B03200018	1J0	13	Whose older brother studies at WenHua University?	Simon
siar	B03200032	1J0	19	Who plays drums to relax	--
siar	B03200034	1J0	54	Does Simon have a younger sister?	Yes
siar	B03200012	1J0	52	Does he play guitar?	Yes
siar	B03200003	1J0	26	Can Ariel sing?	Ariel
siar	B03200012	1J0	53	Whose older brother studies in WenHua University?	Simon
siar	B03200087	1J0	39	Does Ariel live in Taipei?	Yes
siar	B03200034	1J0	55	Does Simon have a younger sister?	No
siar	B03200019	1J0	27	Who is younger sister is studying in MingHu Junior High School?	Simon
siar	B03200098	1J0	38	Does Simon like to sing a song?	No
siar	B03200029	1J0	24	Does Simon's humorous person?	Yes
siar	B03200018	1J0	15		\N
siar	B03200102	1J0	29	Who like to play drum?	Simon
siar	B03200019	1J0	28	Who is younger sister was stidied in MingHu Junior High School?	Simon
siar	B03200097	1J0	21	Does Simon love to play the guitar?	Yes
siar	B03200056	1J0	30	Does Simon have a younger sister?	No
siar	B01202106	1J0	16	Does Simon like to play guitar?	Yes
siar	B03200019	1J0	30	Who younger sister was stidied in MingHu Junior High School?	Simon
siar	B03200019	1J0	31	Who younger sister was stidied in MingHu Junior High School?	--
siar	B03200098	1J0	40	Does Simon like to eat hamberger?	Yes
siar	B03200087	1J0	40	Does Simon play baseball?	Yes
siar	B03200078	1J0	29	who likes to watch baseball game ?	Simon
siar	B01202104	1J0	18	Doesn't Simon have a older brother?	No
siar	B03200097	1J0	23		\N
siar	B03200052	1J0	39	who can play drum	--
siar	B03200012	1J0	56		\N
siar	B03200083	1J0	45	Who can play the guitar very well?	Simon
siar	B03200098	1J0	41	Does Simon like to watch television?	Yes
siar	B03200029	1J0	26	Does Simon likes to older brother?	Yes
siar	B03200056	1J0	32	Does she like to play baseball?	No
siar	B03200078	1J0	30	who likes to play baseball game ?	Simon
siar	B03200056	1J0	33	Does Simon live in Taipei?	No
siar	B03200087	1J0	41	Does family loves Simon ?	Yes
siar	B03200012	1J0	60	Whose older brother studies in WenHua University?	Simon
siar	B03200052	1J0	42		\N
siar	B03200012	1J0	61	Who have drums?	Simon
siar	B01202106	1J0	20	Whose older brother studies in Taipei?	Ariel
siar	B03200089	1J0	41	Whose older k	--
siar	B03200097	1J0	24	Does Ariel like to listen English songs?	Yes
siar	B03200018	1J0	20		\N
siar	B03200078	1J0	33	who loves to listen to music ?	Ariel
siar	B03200097	1J0	25	Does Ariel like to study English?	Yes
siar	B03200019	1J0	33	Whose younger sister studied in MingHu Junior High School?	Simon
siar	B03200012	1J0	62	Who listen English songs?	Ariel
siar	B01202104	1J0	21	Is Ariel positive?	Yes
siar	B03200078	1J0	34	Whose dream is to be a tour guide ?	Ariel
siar	B01202106	1J0	22	Who have mother?	Simon
siar	B01202104	1J0	15	Doesn Ariel love to play drums?	Yes
siar	B03200018	1J0	12		\N
siar	B03200003	1J0	25	Who lives with Ariel?	Ariel
siar	B03200098	1J0	37	Does Simon like to play table tennis?	No
siar	B03200029	1J0	22	Does Simon has a son?	No
siar	B03200052	1J0	36	who can play guitar?	Simon
siar	B01202104	1J0	17	Who likes to play drums?	No
siar	B03200029	1J0	23	Does Simon's humorous person	Yes
siar	B03200056	1J0	29	Does she feel happy?	Yes
siar	B03200052	1J0	37	who is want to be a tour guide	Ariel
siar	B03200083	1J0	42	Whose brother study in Taipei?	Simon
siar	B03200018	1J0	14		\N
siar	B03200089	1J0	39	Who likes playing guitar?	Simon
siar	B03200012	1J0	54	Does Ariel listen to English songs?	Yes
siar	B03200098	1J0	39	Does Simon like to drink water?	Yes
siar	B03200083	1J0	43	Whose older brother study in Taipei?	Simon
siar	B03200019	1J0	29	Who younger sister was stidied in MingHu Junior High School?	Ariel
siar	B03200083	1J0	44	Whose older brother is study in Taipei?	Simon
siar	B03200029	1J0	25	Does Simon like to mother?	Yes
siar	B03200052	1J0	38	who can play drum	Simon
siar	B03200018	1J0	16	Dose Simon older brother studies at WenHua University?	Yes
siar	B03200012	1J0	55	Whose older brother studies in WenHua University?	Simon
siar	B03200097	1J0	22		\N
siar	B03200056	1J0	31	Does Simon have a younger sister?	Yes
siar	B03200012	1J0	57		\N
siar	B01202106	1J0	17		\N
siar	B03200003	1J0	27	Who can play drum?	Ariel
siar	B03200089	1J0	40	Does Ariel feel happy?	Ariel
siar	B03200018	1J0	17	Dosen't Simon older brother studies at WenHua University?	Yes
siar	B03200078	1J0	31	who likes to play baseball  ?	Simon
siar	B03200098	1J0	43	Does Simon like to play the piano?	No
siar	B03200056	1J0	34	Does Simon live in Taipei?	Yes
siar	B03200012	1J0	59	Who has drums?	Simon
siar	B03200046	1J0	27	Whose younger sister study in MingHu Junior High School?	Simon
siar	B03200056	1J0	36	Is Ariel humorous?	No
siar	B03200046	1J0	29	Whose younger sister studies in Minghu Junior High School?	Simon
siar	B03200040	1J0	5	Who likes play the drums?	Simon
siar	B03200087	1J0	43	Does Ariel feel humorous?	No
siar	B03200089	1J0	42	Whose older brother like playing guitar?	Ariel
siar	B03200019	1J0	32	Whose younger sister is studied in MingHu Junior High School?	Simon
siar	B03200018	1J0	21	Whose younger sister studies in WenHua University?	Simon
siar	B01202104	1J0	20	Is Simon positive?	No
siar	B03200012	1J0	63	Who listens English songs?	Ariel
siar	B01202106	1J0	21	Who has mother?	Simon
siar	B03200012	1J0	64	Whose older brother studies in WenHua University?	Simon
siar	B01202104	1J0	22	Is Ariel positive?	No
siar	B03200063	1J0	36	Who study in Minghu Junior High School	Chiyuantien
siar	B03200097	1J0	19		\N
siar	B03200083	1J0	41	Who graduated in the baseball game?	Simon
siar	B03200097	1J0	20	Is Simon a logical person?	Yes
siar	B03200056	1J0	28	Does Simon feel happy?	Yes
siar	B01202104	1J0	16	Who likes to play drums?	Yes
siar	B03200012	1J0	58	Whose older brother studies in WenHua University?	Simon
siar	B03200063	1J0	37	Who study in Minghu Junior High School	Simon
siar	B03200098	1J0	42	Does Simon like to play the piano?	Yes
siar	B03200083	1J0	46	Who has a younger sister?	Simon
siar	B03200083	1J0	47	Who lives in Taipei?	Simon
siar	B01202106	1J0	18	Whose older brother studies in Taipei?	Simon
siar	B03200063	1J0	38	Whose guitar is	Chiyuantien
siar	B03200013	1J0	13		\N
siar	B03200052	1J0	40		\N
siar	B03200052	1J0	41		\N
siar	B03200083	1J0	48	Who has guitar?	Simon
siar	B01202106	1J0	19	Whose older brother study in Taipei?	Ariel
siar	B03200018	1J0	18	Dose he's older brother studies in WenHua University?	Yes
siar	B03200042	1J0	30		\N
siar	B03200046	1J0	28	Whose younger sister study in Minghu Junior High School?	Simon
siar	B03200098	1J0	44	Does Simon like his family?	Yes
siar	B03200056	1J0	35	Is Ariel humorous?	Yes
siar	B03200003	1J0	28		\N
siar	B03200052	1J0	43	Does Ariel like English?	--
siar	B03200050	1J0	12		\N
siar	B03200029	1J0	27	Does Ariel like to listen to English songs?	Yes
siar	B03200087	1J0	42	Does family feel humorous?	Yes
siar	B03200052	1J0	44	Does Ariel like English?	Yes
siar	B03200018	1J0	19		\N
siar	B03200078	1J0	32	who loves to listen to music ?	Ariel
siar	B01202104	1J0	19	Is Simon positive?	Yes
siar	B03200040	1J0	6	Who likes to play the drums?	Simon
siar	B03200050	1J0	13	Does Simon like to play drums?	Yes
siar	B03200089	1J0	43	Whose older brother likes playing guitar?	Ariel
siar	B03200012	1J0	65	Who listens to English songs?	Ariel
siar	B03200098	1J0	45	Does Simon likes to listening to music?	Yes
siar	B03200078	1J0	35	Whose wants to be a tour guide ?	Ariel
siar	B03200029	1J0	28	Does Ariel make a lot of friends?	Yes
siar	B03200040	1J0	7	who will try the best in this class?	Simon
siar	B03200089	1J0	44	Whose father can sing ?	Simon
siar	B03200018	1J0	22	Who love listens to English songs?	Chiyuantien
siar	B03200029	1J0	29	Does Ariel like to make a lot of friends?	Yes
siar	B01202106	1J0	23	Who likes to play the drums?	Simon
siar	B03200012	1J0	66	Who plays drums?	Simon
siar	B03200040	1J0	8	who  try the best in this class?	Simon
siar	B01202104	1J0	23	Who likes to play mother?	Yes
siar	B03200097	1J0	26	Does Ariel like studying English?	Yes
siar	B03200019	1J0	34	Who is a humorous person?	Simon
siar	B03200018	1J0	23	Who loved listens to English songs?	Ariel
siar	B03200040	1J0	9	who try the best in this class?	Simon
siar	B03200018	1J0	24	Who liked listens to English songs?	Ariel
siar	B03200012	1J0	67	Who plays guitar?	Simon
siar	B03200083	1J0	49	Who was born in Taipei?	Simon
siar	B03200098	1J0	46	Does Simon likes to listening to music?	Yes
siar	B03200040	1J0	10	who do the best in this class?	Simon
siar	B03200078	1J0	36	who has one father?	Ariel
siar	B03200098	1J0	47	Does Simon likes to listening to music?	No
siar	B03200018	1J0	25	Who likes listens to English songs?	Ariel
siar	B03200089	1J0	45	Whose father likes playing baseball?	Ariel
siar	B03200050	1J0	14	Does Ariel like to listen to English songs?	--
siar	B03200029	1J0	30	Does Ariel like to make friends?	Yes
siar	B03200087	1J0	44	Does Ariel listen a song?	Yes
siar	B01202104	1J0	24	Whose younger sister studies in Taipei?	Yes
siar	B03200098	1J0	48	Does Simon likes to play computer games?	Yes
siar	B03200019	1J0	35	Who is a humorous person?	Simon
siar	B03200012	1J0	68	Whose older brother studies in WenHua University?	Simon
siar	B03200037	1J0	39		\N
siar	B03200098	1J0	49	Does Simon like to play computer games?	Yes
siar	B03200037	1J0	40		\N
siar	B03200098	1J0	50		\N
siar	B03200040	1J0	11		\N
siar	B03200098	1J0	51		\N
siar	B03200029	1J0	31	Does Simon like to playing guitar?	Yes
siar	B03200089	1J0	46		\N
siar	B03200102	1J0	30	What is your favorite English song?	Ariel
siar	B03200037	1J0	41	Whom favorite sport is baseball?	Simon
siar	B03200050	1J0	15	Does Ariel like to listen to English songs?	Yes
siar	B03200089	1J0	47		\N
siar	B03200078	1J0	37	whose older brother studies in WenHua University?	Simon
siar	B03200019	1J0	36	Who is a nice person?	Ariel
siar	B03200040	1J0	12		\N
siar	B01202104	1J0	25	Who can play translator baseball ?	Yes
siar	B03200087	1J0	45	Is Ariel listen a song?	Yes
siar	B03200083	1J0	50	Who can plays baseball?	Simon
siar	B03200018	1J0	26	Who loves listens to English songs?	Ariel
siar	B03200083	1J0	51	Who can plays baseball?	--
siar	B03200083	1J0	52	Who can plays baseball?	--
siar	B03200083	1J0	53	Who can plays baseball?	--
siar	B03200083	1J0	54	Who can plays baseball?	--
siar	B03200083	1J0	55	Who can plays baseball?	--
siar	B03200019	1J0	37	Who is a nice person?	Ariel
siar	B03200083	1J0	56	Who can plays baseball?	--
siar	B03200056	1J0	37	Does Ariel love to play the guitar?	No
siar	B01202104	1J0	26	Who can play translator baseball ?	No
siar	B01202106	1J0	24	Who likes to make friends?	Ariel
siar	B03200074	1J0	15	Are Simon parents live in Taipei	Yes
siar	B03200056	1J0	38	Isn't Simon love to play the guitar?	No
siar	B03200089	1J0	48	Does Simon like Chinese?	Yes
siar	B03200083	1J0	57	Who is the boy?	Simon
siar	B03200056	1J0	39	Is Simon love to play the guitar?	--
siar	B03200097	1J0	27	Does she like to listen English songs? 	Yes
siar	B03200056	1J0	40	Is Simon loves to play the guitar?	Yes
siar	B03200032	1J0	21	Does Ariel have an older sister?	No
siar	B03200018	1J0	29	He likes guitar,isn't he?	Simon
siar	B03200056	1J0	43	Does Simon want to be a tour guide ?	No
siar	B03200029	1J0	32	Does Ariel study English for the first time?	Yes
siar	B03200018	1J0	30		\N
siar	B03200018	1J0	31		\N
siar	B03200102	1J0	32	What is your favorite English songs?	--
siar	B03200056	1J0	44	Does Simon have a older brother	Yes
siar	B03200040	1J0	15	Does Simon like to play baseball?	Yes
siar	B03200056	1J0	45	Does Ariel's older brother study in WenHua University?	No
siar	B03200098	1J0	53	who listens to English song in her free time?	Ariel
siar	B03200098	1J0	54	who listens to English song in her free time?	Ariel
siar	B03200032	1J0	23	Does Ariel like to listen songs?	Yes
siar	B03200084	1J0	5	Does Simon can speak chinese	Simon
siar	B03200102	1J0	33	What does Ariel want to be in the future?  	Ariel
siar	B03200032	1J0	24	Does Ariel like to listen to songs?	Yes
siar	B03200018	1J0	35	Dose Ariel likes Chinese?	No
siar	B03200032	1J0	25	Does Simon like to listen to songs?	No
siar	B03200029	1J0	33	Does Simon loves to his older brother?	Yes
siar	B03200102	1J0	34		\N
siar	B03200012	1J0	70	Whose older brother studies in WenHua University?	Simon
siar	B03200082	1J0	47	Does Ariel's younger sister study in WenHua University?	No
siar	B01202104	1J0	29	Who is a positive person?	Yes
siar	B01202104	1J0	31	Who is a positived person?	No
siar	B03200084	1J0	8		\N
siar	B03200018	1J0	39	Dose Simon like Chinese?	No
siar	B03200102	1J0	35	Who want to be a translator?	Ariel
siar	B03200082	1J0	48	Does Ariel's younger sister study in MingHu junior high school?	No
siar	B03200082	1J0	49	Does Ariel's younger sister study in MingHu junior high school?	Yes
siar	B03200018	1J0	41	Does Ariel like Chinese?	No
siar	B03200074	1J0	16	Are there five people in Ariel's family?	No
siar	B03200083	1J0	60	Whose sister study in Minghu Junior High School?	Simon
siar	B03200082	1J0	50	Does Ariel's older sister study in MingHu junior high school?	No
siar	B03200018	1J0	42	Does Ariel like to study Chinese?	No
siar	B03200040	1J0	16		\N
siar	B03200040	1J0	17		\N
siar	B03200018	1J0	43	Does Ariel like to studies Chinese?	No
siar	B03200087	1J0	52	Who loves play?	Simon
siar	B03200018	1J0	44	Does Ariel likes to study Chinese?	No
siar	B03200102	1J0	36	Who want to be a translator in the future?	--
siar	B03200056	1J0	50	Is Ariel a happy person?	No
siar	B01202104	1J0	35		\N
siar	B03200056	1J0	51	Doesn't Ariel love to play drums ?	Yes
siar	B03200078	1J0	44	whose family  has three people ?	Ariel
siar	B03200046	1J0	33	Who likes to make friend?s	Ariel
siar	B03200012	1J0	72	Whose older brother studies in WenHua University?	Simon
siar	B03200082	1J0	52	Does Ariel's older brother study in MingHu  junior high school?	No
siar	B03200063	1J0	47	who is the tour guide	Ariel
siar	B03200018	1J0	48	Does Ariel like English?	Yes
siar	B03200056	1J0	52	Are there five people in Simon's family?	Yes
siar	B03200102	1J0	37	Who like to tour guide in the future?	Ariel
siar	B03200098	1J0	62	Who listens to music in free time?	Simon
siar	B03200098	1J0	69	Who listens to music in free time?	--
siar	B03200098	1J0	71	Who listens to music in free time?	--
siar	B03200087	1J0	53	Who loves song?	Ariel
siar	B03200032	1J0	20	Does Ariel have an older brother?	No
siar	B03200040	1J0	13	Does Simon like play guitar?	Yes
siar	B03200040	1J0	14	Does Simon like to play guitar?	Yes
siar	B03200078	1J0	38	Who loves simon ?	Ariel
siar	B03200089	1J0	49	Does Simon like to study Chinese?	Yes
siar	B03200087	1J0	46	Does Ariel have a favorite song?	Yes
siar	B03200097	1J0	28	Does Simon like to play the drums?	Yes
siar	B03200032	1J0	22	Does Ariel have a younger sister?	No
siar	B03200018	1J0	33	Is he likes guitar,isn't he	Yes
siar	B03200087	1J0	47		\N
siar	B03200087	1J0	48		\N
siar	B03200018	1J0	34	Is he likes guitar isn't he	--
siar	B03200084	1J0	6	Does Simon can speak chinese	--
siar	B01202106	1J0	26	Who has father?	Simon
siar	B03200089	1J0	51	Does Ariel have a younger sister?	No
siar	B03200063	1J0	42		\N
siar	B03200063	1J0	43		\N
siar	B03200087	1J0	50	Who has a younger sister?	Ariel
siar	B03200089	1J0	52	Does Simon want to be a tour guide ?	No
siar	B03200063	1J0	44	Whose favorite subject is Chinese	Chiyuantien
siar	B03200097	1J0	29	Is Simon a happy person?	Yes
siar	B03200078	1J0	41	Whose younger sister studies in Minghu Junior High School ?	Simon
siar	B03200084	1J0	7		\N
siar	B03200018	1J0	37	Dose she likes Chinese?	No
siar	B03200018	1J0	38	Dose she like Chinese?	Yes
siar	B01202106	1J0	28		\N
siar	B01202104	1J0	32	Who is happy?	Yes
siar	B03200012	1J0	71	Whose older brother studies in WenHua University?	Simon
siar	B03200056	1J0	47	Does Ariel like to play the drums?	No
siar	B03200046	1J0	32	Who like to make friend?	Ariel
siar	B03200089	1J0	53	Is Simon a student of Minghu Junior High School?	Yes
siar	B01202104	1J0	33	Whose favorite subject is English?	Yes
siar	B03200056	1J0	48	Is Areil a happy person?	Yes
siar	B03200063	1J0	46	Who likes to listen to Chinese songs	Chiyuantien
siar	B01202104	1J0	34	Whose favorite subject is English?	No
siar	B03200078	1J0	43	whose family  have three people ?	Ariel
siar	B03200082	1J0	51	Does Ariel's older brother study in MingHu, junior, high, school?	No
siar	B03200089	1J0	54	Doesn't  he live in Taipei?	No
siar	B03200018	1J0	46	Does Simon likes to study English?	No
siar	B03200098	1J0	59	Who listens to music in free time? 	--
siar	B03200098	1J0	60	Who listens to music in free time? 	--
siar	B03200097	1J0	30	Are there five people in Simon's family?	Yes
siar	B03200083	1J0	61	Who likes English?	Ariel
siar	B03200098	1J0	61	Who listens to music in free time?	Chiyuantien
siar	B03200098	1J0	63	Who listens to music in free time?	Ariel
siar	B03200098	1J0	64	Who listens to music in free time?	--
siar	B03200098	1J0	65	Who listens to music in free time?	--
siar	B03200098	1J0	66	Who listens to music in free time?	--
siar	B03200098	1J0	67	Who listens to music in free time?	--
siar	B03200098	1J0	68	Who listens to music in free time?	--
siar	B03200098	1J0	70	Who listens to music in free time?	--
siar	B03200029	1J0	36	Does Ariel likes to English?	Yes
siar	B03200056	1J0	41	Is Simon like to play the guitar?	Yes
siar	B03200098	1J0	52	who listens English song in her free time?	Ariel
siar	B03200056	1J0	42	Is Simon likes to play the guitar?	--
siar	B03200018	1J0	27	He likes guitar,isn't he?	Simon
siar	B03200078	1J0	39	Who loves Simon ?	Ariel
siar	B03200046	1J0	30	Whose family has three people?	Ariel
siar	B03200018	1J0	28	He likes guitar isn't he?	Simon
siar	B03200037	1J0	42	Whose favorite sport is baseball?	Simon
siar	B03200102	1J0	31	What is your favorite English songs?	Ariel
siar	B03200078	1J0	40	Who likes Simon ?	Ariel
siar	B01202106	1J0	25	Who likes to listen songs?	Simon
siar	B03200003	1J0	29	What happen to the Ariel in her family?	Ariel
siar	B03200089	1J0	50	Does Simon like to study English?	Yes
siar	B03200012	1J0	69	Whose older brother studies in WenHua University?	Simon
siar	B03200018	1J0	32	He likes guitar,isn't he?	Yes
siar	B01202104	1J0	27		\N
siar	B03200082	1J0	42		\N
siar	B03200082	1J0	43		\N
siar	B03200082	1J0	44		\N
siar	B03200063	1J0	39		\N
siar	B03200063	1J0	40		\N
siar	B03200063	1J0	41	Does Simon live in Taipei?	Yes
siar	B03200098	1J0	55	Does Ariel like to make friends?	Ariel
siar	B01202106	1J0	27	Who have father?	Simon
siar	B03200083	1J0	58	Who plays the baseball before?	Simon
siar	B03200056	1J0	46	Does Simon have a favorite song?	No
siar	B03200087	1J0	49	Who has a brother?	Ariel
siar	B01202104	1J0	28	Who can play drums guitar?	Yes
siar	B03200037	1J0	43	Who live in Taipei?	Simon
siar	B03200082	1J0	45		\N
siar	B03200037	1J0	44	Who lives in Taipei?	Simon
siar	B03200083	1J0	59	Who want to be a tour guide?	Ariel
siar	B03200082	1J0	46	Does Ariel's sister study in WenHua University?	No
siar	B03200052	1J0	45	Does Ariel like English?	Yes
siar	B03200018	1J0	36	Dose Ariel likes Chinese?	No
siar	B03200063	1J0	45	Whose favorite subject is Chinese	Simon
siar	B03200029	1J0	34	Does Simon feel relaxed?	Yes
siar	B01202104	1J0	30	Who is a positived person?	Yes
siar	B03200087	1J0	51	Who can play?	Ariel
siar	B03200029	1J0	35	Does Simon feel happy?	Yes
siar	B03200098	1J0	56	who likes to sing the song?	Ariel
siar	B03200018	1J0	40	Does Simon like Chinese?	No
siar	B03200003	1J0	30	What can Ariel do?	Ariel
siar	B03200046	1J0	31	Who likes to make friend?	Ariel
siar	B03200018	1J0	45	Do Ariel likes to study Chinese?	--
siar	B03200056	1J0	49	Is Ariel a happy person?	Yes
siar	B03200078	1J0	42	whose family member have three people ?	Ariel
siar	B03200040	1J0	18	What Ariel's favorite subjust?	Ariel
siar	B03200098	1J0	57	Who listens to music in free time? 	Ariel
siar	B03200098	1J0	58	Who listens to music in free time? 	--
siar	B01202104	1J0	36		\N
siar	B03200018	1J0	47	Does Simon like English?	No
siar	B03200082	1J0	53	Does Ariel's older brother study in Minghu Junior High School?	No
siar	B03200040	1J0	19	Who's favorite subject is English?	Ariel
siar	B03200018	1J0	49	Does she like English?	Yes
siar	B03200083	1J0	62	Who likes the guitar?	Simon
siar	B03200089	1J0	55	Doesn't Ariel love to play the guitar?	No
siar	B03200098	1J0	72	Who listens to music in free time?	Ariel
siar	B03200046	1J0	34		\N
siar	B03200063	1J0	48	who live in Taipei	--
siar	B03200098	1J0	73	Who listens to music in free time?	Ariel
siar	B03200087	1J0	54	Who can sing a song?	Ariel
siar	B03200012	1J0	73	Whose older brother studies in WenHua University?	Simon
siar	B03200098	1J0	74	Who listens to music in free time?	Ariel
siar	B03200018	1J0	50	Does he like guitar?	Yes
siar	B03200046	1J0	35		\N
siar	B03200083	1J0	63	Who likes to play the guitar?	Simon
siar	B03200018	1J0	51	Does he like play guitar?	Yes
siar	B03200063	1J0	49	who lives in Taipei	Chiyuantien
siar	B03200029	1J0	37	Does Ariel likes to listen to English songs in my free time?	Yes
siar	B03200089	1J0	56	Doesn't Ariel love to play the guitar?	Yes
siar	B03200018	1J0	52	Does he like to play guitar?	Yes
siar	B03200098	1J0	75		\N
siar	B03200056	1J0	53	Does Ariel's younger sister study in Minghu Junior High School?	No
siar	B03200063	1J0	50	who lives in Taipei 	Ariel
siar	B03200018	1J0	53	Does he like to play drums?	Yes
siar	B03200056	1J0	54	Does Simon like to play baseball	No
siar	B03200040	1J0	20	Whose favorite subject is English?	Ariel
siar	B03200087	1J0	55	Who have a family?	Simon
siar	B03200087	1J0	56	Who have family?	Ariel
siar	B03200074	1J0	17	Whose favorite subject is English	Ariel
siar	B03200056	1J0	55	Does Ariel love to play the guitar?	No
siar	B03200052	1J0	46	Does Simon like baseball	No
siar	B03200063	1J0	51	who lives in Taipei	Chiyuantien
siar	B03200071	1J0	26		\N
siar	B01202104	1J0	37	Who plays translator baseball?	Yes
siar	B03200018	1J0	54	Does she like to play drums?	No
siar	B03200046	1J0	36	Doesn't she like to make friend?	Yes
siar	B03200089	1J0	57	Doesn't Simon's older brother study in Minghu Junior High School?	Yes
siar	B03200052	1J0	47	Does Simon like baseball?	Yes
siar	B03200087	1J0	57	Who has family?	Simon
siar	B03200098	1J0	76	who 	Ariel
siar	B03200063	1J0	52	who lives in Taipei	Simon
siar	B03200018	1J0	55	Does she like to play guitar?	No
siar	B03200046	1J0	37	Does she like to make friend?	Yes
siar	B03200029	1J0	38		\N
siar	B03200089	1J0	59	Don't they have friends?	Yes
siar	B03200046	1J0	38	Does she likes to make friend?	Yes
siar	B03200083	1J0	64		\N
siar	B03200078	1J0	45	Whose brother is Simon ?	Ariel
siar	B03200056	1J0	56	Are there five people in Simon's family?	Yes
siar	B03200040	1J0	21	who like to play baseball?	Simon
siar	B03200078	1J0	46	Whose older brother is Simon ?	Ariel
siar	B03200012	1J0	74		\N
siar	B03200018	1J0	58	Does Ariel like to play drums?	No
siar	B03200056	1J0	57	Does Simon feel humorous?	Yes
siar	B03200098	1J0	77	who is your friend?	Ariel
siar	B03200029	1J0	39	Who likes to listen to English songs?	Ariel
siar	B03200102	1J0	38		\N
siar	B03200063	1J0	53	who is he	Chiyuantien
siar	B03200046	1J0	40		\N
siar	B03200046	1J0	41		\N
siar	B03200083	1J0	66	Does Simon can play the guitar?	Yes
siar	B03200089	1J0	60	Doesn't Simon have a friend?	Yes
siar	B03200087	1J0	58	Who is she?	Ariel
siar	B03200029	1J0	40	Who is nice person?	Ariel
siar	B03200078	1J0	47		\N
siar	B03200083	1J0	67	Does Simon has younger sister?	Yes
siar	B03200087	1J0	59	Who is happy'	--
siar	B03200082	1J0	55		\N
siar	B03200063	1J0	54	who is the translator	Ariel
siar	B03200018	1J0	61	Does Simon relax?	Yes
siar	B03200093	1J0	3	whose younger sister is Simon ?	Ariel
siar	B03200102	1J0	41	Who is nice person ?	Ariel
siar	B03200093	1J0	4	whose father is Simon ?	Ariel
siar	B03200102	1J0	42	Who is nice person ?	--
siar	B03200040	1J0	27	Is Simon upset?	No
siar	B03200018	1J0	64		\N
siar	B03200040	1J0	29	Is Simon like cat?	No
siar	B03200087	1J0	61	Who is family?	Ariel
siar	B03200102	1J0	43	Who is a nice person ?	Ariel
siar	B03200098	1J0	83	Who listens to music ? 	Ariel
siar	B03200018	1J0	66	Doesn't she have a younger sister	Chiyuantien
siar	B03200102	1J0	44	Who is a nice person ?	Ariel
siar	B03200098	1J0	87	Who listens to music ? 	--
siar	B03200084	1J0	9	who sister is Areil	Ariel
siar	B03200102	1J0	45		\N
siar	B03200102	1J0	46		\N
siar	B03200040	1J0	31	Is Simon like animal?	Yes
siar	B03200083	1J0	75	Does Simon has sister or brother?	Yes
siar	B03200012	1J0	76	Whose older brother studies in WenHua University?	Simon
siar	B03200046	1J0	43	Whose family is Ariel/	Ariel
siar	B03200097	1J0	34	Does ChiYuan Tien like to play baseball?	No
siar	B03200040	1J0	33	Is Simon like to sing a song?	No
siar	B03200029	1J0	44	Whose friend is Ariel?	Ariel
siar	B03200012	1J0	77	Who wants to be a tour guide?	Ariel
siar	B03200087	1J0	62		\N
siar	B03200084	1J0	11	who sister is Areil'?	--
siar	B03200084	1J0	12	who sister is Areil'?	--
siar	B03200040	1J0	34	Is Simon like to singing a song?	Yes
siar	B03200082	1J0	61		\N
siar	B03200040	1J0	35	Is Simon like to singing a song?	No
siar	B03200018	1J0	67	Whose mother lives in Taipei	Simon
siar	B03200087	1J0	64		\N
siar	B03200087	1J0	65		\N
siar	B03200019	1J0	38	Who have a puppy?	Ariel
siar	B03200012	1J0	78		\N
siar	B03200040	1J0	37	Is Simon like to listen music?	No
siar	B03200102	1J0	47	Who is nineteen years old?	Ariel
siar	B03200012	1J0	80	Does Ariel love to play the guitar?	No
siar	B03200082	1J0	63	whose family is Ariel?	Simon
siar	B03200083	1J0	80	Does Ariel play the drums?	No
siar	B03200082	1J0	64	whose family isn't Ariel?	Simon
siar	B03200012	1J0	86	Does Simon wants to be a translator?	No
siar	B03200083	1J0	82	Does Simon has parents?	Yes
siar	B03200012	1J0	87	Does Simon want to be a translator?	No
siar	B03200029	1J0	46	Who isn't a boy?	Ariel
siar	B03200097	1J0	36	Does ChiYuan Tien love to play the guitar?	No
siar	B03200092	1J0	24	Whose older brother isn't Simon ?	Ariel
siar	B03200046	1J0	46	Who has a family?	Ariel
siar	B03200032	1J0	29	Who is a happy person?	Simon
siar	B03200102	1J0	49	Whose want to be a translator?	Ariel
siar	B03200089	1J0	63	Doesn't he like to play baseball?	Yes
siar	B03200063	1J0	59	Does Ariel like to play baseball	Yes
siar	B03200063	1J0	60	Does Ariel like to play baseball	No
siar	B03200087	1J0	66		\N
siar	B03200018	1J0	56	Does Simon like to play guitar?	Yes
siar	B03200097	1J0	31	Is Simon an optimistic person?	Yes
siar	B03200018	1J0	57	Does Ariel like to play guitar?	No
siar	B03200089	1J0	58	Don't they have friend?	Yes
siar	B03200097	1J0	32	Is Simon optimistic?	Yes
siar	B03200083	1J0	65	Does Ariel like English?	Yes
siar	B03200097	1J0	33	Is Simon happy?	Yes
siar	B03200046	1J0	39	Does she likes to listen to  English songs?	Yes
siar	B03200018	1J0	59	Does he like to listen to English songs?	No
siar	B03200040	1J0	22		\N
siar	B03200040	1J0	23		\N
siar	B03200040	1J0	24	Is Ariel happy?	Yes
siar	B03200018	1J0	60	Does Simon like to listen to English songs?	No
siar	B03200040	1J0	25	Is Ariel happy?	No
siar	B03200098	1J0	78	who is going to play computer?	Ariel
siar	B03200082	1J0	54		\N
siar	B03200093	1J0	2		\N
siar	B03200087	1J0	60	Who is happy?	Simon
siar	B03200083	1J0	68	Does Simon like to play the drums?	Yes
siar	B03200102	1J0	39	Who is nice person	Ariel
siar	B03200029	1J0	41	Whose older brother studies in WenHua University?	Simon
siar	B03200102	1J0	40	Who is nice person	Chiyuantien
siar	B03200018	1J0	62	Does Simon relaxed?	Yes
siar	B03200040	1J0	26	Is Simon sad?	No
siar	B03200083	1J0	70	Is ChiYuan Tien happy?	No
siar	B03200018	1J0	63	Does Simon like to relaxed?	Yes
siar	B03200098	1J0	79	Who lives in Taiwan? 	Ariel
siar	B03200098	1J0	80	Who lives in Taiwan? 	Ariel
siar	B03200063	1J0	56	who want to be a translator 	Ariel
siar	B03200046	1J0	42	whose mother is Ariel?	Simon
siar	B03200082	1J0	57		\N
siar	B03200018	1J0	65		\N
siar	B03200032	1J0	26	Does Ariel like to play guitar?	No
siar	B03200093	1J0	5	whose mother is Simon ?	Ariel
siar	B03200098	1J0	86	Who listens to music ? 	Ariel
siar	B03200093	1J0	6		\N
siar	B03200083	1J0	72	Is Simon unhappy?	No
siar	B03200093	1J0	7		\N
siar	B03200083	1J0	73	Is Simon unhappy?	Yes
siar	B03200012	1J0	75	Who wants to be a turr guide?	Ariel
siar	B03200082	1J0	60	whose sister is Simon?	Ariel
siar	B03200084	1J0	10	who sister is Areil	--
siar	B03200089	1J0	61	Don't her younger sister like to sing?	Yes
siar	B03200040	1J0	30	Is Simon like animal?	No
siar	B03200029	1J0	43	Whose friends is Ariel?	Ariel
siar	B03200083	1J0	76	Does Simon has sister and brother?	Yes
siar	B03200083	1J0	77	Does Simon has sister and brother?	--
siar	B03200093	1J0	8		\N
siar	B03200040	1J0	32	Is Simon like to sing a song?	Yes
siar	B03200046	1J0	44	Whose family is Simon?	Ariel
siar	B03200087	1J0	63		\N
siar	B03200032	1J0	27		\N
siar	B03200012	1J0	79		\N
siar	B03200032	1J0	28		\N
siar	B03200040	1J0	36	Is Simon like to listen music?	Yes
siar	B03200082	1J0	62		\N
siar	B03200083	1J0	78	Does Ariel can play the guitar?	No
siar	B03200012	1J0	81		\N
siar	B03200089	1J0	62	Don't Simon's younger sister like to playing drums?	Yes
siar	B03200012	1J0	83	Who wants to be a tour guide?	Ariel
siar	B03200046	1J0	45	Whose family is tour guide?	Ariel
siar	B03200083	1J0	81	Does Ariel live in Taipei?	No
siar	B03200018	1J0	69	Whose English name is Ariel?	Ariel
siar	B03200040	1J0	39	Does Simon's older brother study in WenHua University?	Yes
siar	B03200029	1J0	47	Who isn't boy?	Ariel
siar	B03200032	1J0	31		\N
siar	B03200029	1J0	48	Who is girl?	Ariel
siar	B03200102	1J0	50		\N
siar	B03200063	1J0	57		\N
siar	B03200063	1J0	58		\N
siar	B03200083	1J0	83	Does Simon want to be a tour guide?	No
siar	B03200032	1J0	34		\N
siar	B03200046	1J0	48	Who has a father?	Ariel
siar	B03200102	1J0	51		\N
siar	B03200083	1J0	69	Does Ariel is 19-year-old?	Yes
siar	B03200063	1J0	55	who is the tour guide	Ariel
siar	B03200040	1J0	28	Is Simon crazy?	No
siar	B03200082	1J0	56		\N
siar	B03200098	1J0	81	Who lives in Taiwan? 	Chiyuantien
siar	B03200098	1J0	82	Who lives in Taiwan? 	--
siar	B03200029	1J0	42	Who likes to make friends?	Ariel
siar	B03200082	1J0	58	whose mother is Ariel?	Ariel
siar	B03200083	1J0	71	Is Simon happy?	Yes
siar	B03200098	1J0	84	Who listens to music ? 	--
siar	B03200098	1J0	85	Who listens to music ? 	--
siar	B03200082	1J0	59	whose brother is Ariel?	Simon
siar	B03200083	1J0	74	Is Simon happy?	No
siar	B03200093	1J0	9	whose family isn't Simon ?	Ariel
siar	B03200083	1J0	79	Does Ariel play the guitar?	No
siar	B03200012	1J0	82		\N
siar	B03200093	1J0	10		\N
siar	B03200040	1J0	38	Does Simon like to make a friend?	No
siar	B03200006	1J0	12	Does he like to playing drums?	Yes
siar	B03200012	1J0	84		\N
siar	B03200012	1J0	85		\N
siar	B03200097	1J0	35	Does ChiYuan Tien live in Taipei?	No
siar	B03200029	1J0	45	Whose birthday is born on July 6?	Ariel
siar	B03200102	1J0	48	Who likes to make friends?	Ariel
siar	B03200092	1J0	23		\N
siar	B03200018	1J0	68	Who has a younger sister ?	Simon
siar	B03200032	1J0	30		\N
siar	B03200040	1J0	40	Is Simon unhappy?	No
siar	B03200032	1J0	32		\N
siar	B03200032	1J0	33		\N
siar	B03200082	1J0	65		\N
siar	B03200046	1J0	47	Who has a father?	Ariel
siar	B03200046	1J0	49	Who has a mother?	Ariel
siar	B03200097	1J0	37	Does ChiYuan Tien like to play baseball?	No
siar	B03200040	1J0	41	Is Simon like to listening music?	Yes
siar	B03200040	1J0	42	Is Simon like to listening music?	No
siar	B03200063	1J0	61	Does Ariel like to play guitar	Yes
siar	B03200097	1J0	38	Does ChiYuan Tien love to play baseball?	No
siar	B03200087	1J0	67	Who has a family?	Yes
siar	B03200083	1J0	84	Does Areil want to be a tour guide?	Yes
siar	B03200040	1J0	43	Is Simon like to listening song?	Yes
siar	B03200040	1J0	44	Is Simon like to listening song?	No
siar	B03200091	1J0	1		\N
siar	B03200087	1J0	68	Whose English name is Simon?	No
siar	B03200087	1J0	69		\N
siar	B03200087	1J0	70		\N
siar	B03200032	1J0	35	What is Ariel's favorite thing? 	Ariel
siar	B03200006	1J0	13	Does Ariel like playing drum?	Yes
siar	B03200063	1J0	62	Does ChiYuan Tien have a mother	No
siar	B03200087	1J0	71	Whose English name is Simon?	Simon
siar	B03200040	1J0	45	Does she like to play guitar?	No
siar	B03200087	1J0	72		\N
siar	B03200087	1J0	73		\N
siar	B03200006	1J0	14		\N
siar	B03200087	1J0	74	Does Simon love to play baseball?	Yes
siar	B03200063	1J0	63	Is ChiYuan Tien humorous	Yes
siar	B03200091	1J0	2		\N
siar	B03200032	1J0	36	what is Ariel favorite thing? 	Ariel
siar	B03200091	1J0	3	Does Simon like to play baseball?	Yes
siar	B03200063	1J0	64	Is ChiYuan Tien humorous	No
siar	B03200087	1J0	75	Does who love to play baseball?	Yes
siar	B03200087	1J0	76	Does who love to play baseball?	--
siar	B03200091	1J0	4	Doesn't he 19 years old?	Yes
siar	B03200063	1J0	65	Does ChiYuan Tien like to play the drums	Yes
siar	B03200063	1J0	66	Does ChiYuan Tien like to play the drums	No
siar	B03200032	1J0	37	who likes English songs? 	Chiyuantien
siar	B03200032	1J0	38	Who likes English songs? 	Chiyuantien
siar	B03200091	1J0	5	Doesn't Simon 19 years old?	Yes
siar	B03200032	1J0	39	Who likes to listen English songs? 	--
siar	B03200032	1J0	40	Who likes to listen English songs? 	Chiyuantien
siar	B03200018	1J0	70	Who like to listen to songs?	Ariel
siar	B03200018	1J0	71	Who likes to listen to the songs?	Ariel
siar	B03200012	1J0	88	Whose older brother studies in WenHua University?	Simon
siar	B03200091	1J0	6	Doesn't Simon like to play drums?	Yes
siar	B03200032	1J0	41	Who's brother study in WenHua University? 	Simon
siar	B03200032	1J0	42	Who likes to listen to the song?	Chiyuantien
siar	B03200091	1J0	7	Does ChiYuan Tien feel happy?	Yes
siar	B03200032	1J0	43	Whom likes to listen to the songs?	Ariel
siar	B03200091	1J0	8	Doesn't ChiYuan Tien want to be a tour guide ?	Yes
siar	B03200032	1J0	44	Who loves to listen to the songs?	Ariel
siar	B03200032	1J0	45	Who loves guitar?	Simon
siar	B03200091	1J0	9	Doesn't ChiYuan Tien live in Taipei?	Yes
siar	B03200032	1J0	46	Who loves to play the guitar?	Simon
siar	B03200032	1J0	47	Who loves to play the drums?	Simon
siar	B03200091	1J0	10	Doesn't ChiYuan Tien  have the younger sister?	Yes
siar	B03200032	1J0	48	Who loves to listen to the songs?	Chiyuantien
siar	B03200091	1J0	11	Doesn't ChiYuan Tien want to be a translator or a tour guide?	Yes
siar	B03200032	1J0	49	Who is a optimistic person?	Simon
siar	B03200032	1J0	50	Who is an optimistic person?	Simon
siar	B03200012	1J0	89	Whose older brother studies in WenHua University?	Simon
siar	B03200032	1J0	51	Who is  optimistic ?	Simon
siar	B03200032	1J0	52	Who is optimistic ?	Simon
siar	B03200091	1J0	12	Aren't they playing guitar?	Yes
siar	B03200032	1J0	53	Who is happy?	Simon
siar	B03200091	1J0	13	Are they playing guitar?	Yes
siar	B03200091	1J0	14		\N
siar	B03200097	1J0	39		\N
clay	193001	FLA0017	1		\N
clay	193001	FLA0017	2		\N
clay	193001	FLA0017	3		\N
clay	193001	FLA0017	4	Who has a child?	Frank
clay	V0141018	FLA0017	1		\N
clay	V0141018	FLA0017	2	Do Rebia and Frank go down to City Hall?	Yes
clay	V0141002	FLA0017	1		\N
clay	V0141035	FLA0017	1		\N
clay	V0141002	FLA0017	2		\N
clay	V0141008	FLA0017	1		\N
clay	V0141008	FLA0017	2		\N
clay	V0141002	FLA0017	3	Did Rebia have a leggal ID when she was young?	No
clay	V0141018	FLA0017	3		\N
clay	V0141018	FLA0017	4		\N
clay	V0141035	FLA0017	2	Who did pregnant?	Rebia
clay	V0141018	FLA0017	5		\N
clay	V0141016	FLA0017	1		\N
clay	V0141017	FLA0017	1		\N
clay	V0141008	FLA0017	3		\N
clay	V0141018	FLA0017	6		\N
clay	V0141016	FLA0017	2		\N
clay	V0141035	FLA0017	3	Who does pregnant?	Rebia
clay	V0141002	FLA0017	4	Does Rebia have a leggal ID when she was young?	No
clay	V0141035	FLA0017	4	Who  pregnant?	Rebia
clay	V0141029	FLA0017	1		\N
clay	V0141017	FLA0017	2		\N
clay	V0141009	FLA0017	1		\N
clay	V0141008	FLA0017	4		\N
clay	V0141019	FLA0017	1		\N
clay	V0141008	FLA0017	5		\N
clay	V0141035	FLA0017	5	When does Rebia  pregnant?	Rebia
clay	V0141018	FLA0017	7	Who is Rebia's fourth child like?	Frank
clay	V0141035	FLA0017	6		\N
clay	V0141035	FLA0017	7		\N
clay	V0141008	FLA0017	6		\N
clay	V0141018	FLA0017	8	Who is Rebia's fourth child like?	Frank
clay	V0141018	FLA0017	9		\N
clay	V0141019	FLA0017	2		\N
clay	V0141018	FLA0017	10		\N
clay	V0141019	FLA0017	3	Doesn't Rebia have a child?	Yes
clay	V0141019	FLA0017	4	Doesn't Rebia have a child?	No
clay	V0141018	FLA0017	11	Was she pregnant when she met Frank?	Yes
clay	V0141035	FLA0017	8	Does Rebia get marry?	Yes
clay	V0141018	FLA0017	12	Was she pregnant when she met Frank?	Yes
clay	V0141035	FLA0017	9	Does Rebia pregnant?	Yes
clay	V0141019	FLA0017	5	Don't Rebia and Frank go down to City Hall?	Yes
clay	V0141019	FLA0017	6	Doesn't Rebia have a son?	Yes
clay	V0141017	FLA0017	3	Wasn't she pregnant when she met Frank?	No
clay	V0141002	FLA0017	5	Does Rebia have a child when she was seventeen?	No
clay	V0141002	FLA0017	6	Does Rebia have a child?	No
clay	V0141002	FLA0017	7		\N
clay	V0141018	FLA0017	13	Was she pregnant when she met Frank?	Yes
clay	V0141035	FLA0017	10	Does Rebia have child ?	Yes
clay	V0141002	FLA0017	8	When does she marry?	--
clay	V0141009	FLA0017	2	Does Rebia have  children? 	Yes
clay	V0141002	FLA0017	9	When does she meet Frank?	--
clay	V0141035	FLA0017	11	Does Rebia have child ?	Yes
clay	V0141002	FLA0017	10	When she meet Frank?	--
clay	V0141021	FLA0017	1		\N
clay	V0141009	FLA0017	3	Is Rebia have  child? 	Yes
clay	V0141021	FLA0017	2		\N
clay	V0141002	FLA0017	11	When she met Frank?	--
clay	V0141018	FLA0017	14		\N
clay	V0141018	FLA0017	15		\N
clay	V0141002	FLA0017	12	When does Rebia meet Frank?	--
clay	V0141002	FLA0017	13	How does Rebia meet Frank?	--
clay	V0141002	FLA0017	14	Why does Rebia meet Frank?	--
clay	V0141035	FLA0017	12		\N
clay	V0141035	FLA0017	13		\N
clay	V0141016	FLA0017	3		\N
clay	V0141002	FLA0017	15		\N
clay	V0141002	FLA0017	16	Does Rebia meet Frank?	Yes
clay	V0141035	FLA0017	14	Who does pregnant?	Rebia
clay	V0141035	FLA0017	15	Doesn't Rebia meet Frank?	Frank
clay	V0141002	FLA0017	17	Does they seperate?	Yes
clay	V0141035	FLA0017	16	Doesn't Rebia meet Frank	Rebia
clay	V0141002	FLA0017	18	Does Rebia and Frank seperate?	Yes
clay	V0141018	FLA0017	16	Who is Rebia's fourth child like?	Frank
clay	V0141016	FLA0017	4	Are Rebia pregnant when she met Frank	Yes
clay	V0141018	FLA0017	17		--
clay	V0141017	FLA0017	4	Does she have a child?	Yes
clay	V0141035	FLA0017	17	Doesn't Rebia meet Frank	Rebia
clay	V0141002	FLA0017	19	Does Rebia and Frank seperate?	Yes
clay	V0141002	FLA0017	20	Does Rebia and Frank separate?	Yes
clay	V0141035	FLA0017	18	Dose Rebia get married? 	Frank
clay	V0141002	FLA0017	21	Does Rebia and Frank separate?	Yes
clay	V0141035	FLA0017	19	Dosen't Rebia get married? 	Frank
clay	V0141009	FLA0017	4	does Rebia have a father? 	Yes
clay	V0141002	FLA0017	22	Does Rebia and Frank separate?	No
clay	V0141002	FLA0017	23	Does Rebia and Frank separate?	Yes
clay	V0141021	FLA0017	3	Doesn't she have a child?	Yes
clay	V0141016	FLA0017	5	Does Rebia pregnant when she met Frank	Yes
clay	V0141035	FLA0017	20	Doesn't Rebia get married? 	Frank
clay	V0141002	FLA0017	24	Does Frank and Rebia separate?	Yes
clay	V0141018	FLA0017	18	Who is fourth child of Rebia like?	Frank
clay	V0141002	FLA0017	25	Does Frank separate Rebia?	Yes
clay	V0141017	FLA0017	5	Doesn't Rebia have a father?	Yes
clay	V0141016	FLA0017	6	Does Rebia pregnant when she meet Frank	Yes
clay	V0141029	FLA0017	2		\N
clay	V0141002	FLA0017	26	Frank separates Rebia, doesn't he?	Yes
clay	V0141009	FLA0017	5	Does Rebia have boyfriend? 	Yes
clay	V0141002	FLA0017	27	Frank separate Rebia, doesn't he?	Yes
clay	V0141016	FLA0017	7	Does Rebia pregnant when meet Frank	Yes
clay	V0141017	FLA0017	6	Does she grab the old wedding ring?	No
clay	V0141016	FLA0017	8	Does Rebia pregnant when meet Frank	Yes
clay	V0141016	FLA0017	9	Does Rebia pregnant ?	Yes
clay	V0141017	FLA0017	7	Does she grab the ugly wedding_ring?	No
clay	V0141002	FLA0017	28	Is Frank married?	Yes
clay	V0141029	FLA0017	3	Is she beautiful?	--
clay	V0141002	FLA0017	29	Is Frank pregnant?	No
clay	V0141016	FLA0017	10	Does Rebia pregnant when she meet Frank ?	Yes
clay	V0141035	FLA0017	22	Who have a fourth child?	Rebia
clay	V0141002	FLA0017	30	Does Frank have a child?	Yes
clay	V0141019	FLA0017	7	Doesn't Rebia have a son?	Yes
clay	V0141018	FLA0017	21	Who believes Frank is her true love?	Rebia
clay	V0141016	FLA0017	11	Does Rebia pregnant when she meet Frank ?	Yes
clay	V0141019	FLA0017	8	Isn't she beautiful?	Yes
clay	V0141002	FLA0017	31	Is Frank beautiful?	No
clay	V0141035	FLA0017	26	Is she happy?	Yes
clay	V0141016	FLA0017	12	Is Rebia pregnant?	Yes
clay	V0141002	FLA0017	32	Is Frank seventeen?	No
clay	V0141017	FLA0017	11	Isn't Frank pregnant?	No
clay	V0141009	FLA0017	6	Does Rebia have home? 	Yes
clay	V0141035	FLA0017	28	Isn't she happy?	Yes
clay	V0141002	FLA0017	33	Frank is seventeen, isn't he?	No
clay	V0141002	FLA0017	34	Rebia is seventeen, isn't she?	No
clay	V0141017	FLA0017	12	Did Frank give Rebia the wedding_ring ?	Yes
clay	V0141009	FLA0017	7	Does Rebia have "true love"? 	Yes
clay	V0141035	FLA0017	30		\N
clay	V0141017	FLA0017	14	Does Frank give Rebia the wedding ring ?	--
clay	V0141029	FLA0017	4	Does Rebia pregnant?	--
clay	V0141009	FLA0017	8	'Does Rebia get "true love"? 	Yes
clay	V0141035	FLA0017	32	Who is oldest?	Rebia
clay	V0141016	FLA0017	16	Who does Rebia merry?	Frank
clay	V0141029	FLA0017	5	Who is the oldest people?	--
clay	V0141018	FLA0017	24	Who fells Frank is her true love?	Rebia
clay	V0141035	FLA0017	34	Who is the boyfriend?	Frank
clay	V0141018	FLA0017	25		\N
clay	V0141018	FLA0017	26		\N
clay	V0141016	FLA0017	19	Who does Rebia marry?	Frank
clay	V0141018	FLA0017	27	Is Rebia's fourth son like Frank?	Yes
clay	V0141002	FLA0017	38	Does Frannk have a boyfriend?	No
clay	V0141002	FLA0017	39	Does Frank have a boyfriend?	No
clay	V0141018	FLA0017	19	Who did Rebia meet when she was pregnant?	Frank
clay	V0141018	FLA0017	20	Who did Rebia meet when she was pregnant?	--
clay	V0141017	FLA0017	8	Does she get the ugly wedding_ring?	Yes
clay	V0141035	FLA0017	21	Who have a fourth child	Rebia
clay	V0141017	FLA0017	9	Does she get the ugly wedding_ring?	Yes
clay	V0141035	FLA0017	23	Who does have a fourth child?	Rebia
clay	V0141018	FLA0017	22	Who believes Frank is her true love?	--
clay	V0141035	FLA0017	24		\N
clay	V0141035	FLA0017	25		\N
clay	V0141017	FLA0017	10	Isn't she beautiful?	Yes
clay	V0141035	FLA0017	27	Is she happy?	No
clay	V0141019	FLA0017	9	Doesn't Frank have a child?	Yes
clay	V0141019	FLA0017	10	Isn't Frank married?	Yes
clay	V0141019	FLA0017	11	Isn't Rebia pregnant?	Yes
clay	V0141016	FLA0017	13	Does Rebia meet Frank?	Yes
clay	V0141019	FLA0017	12	Doesn't Frank have a child?	Yes
clay	V0141019	FLA0017	13	Doesn't Rebia have home?	Yes
clay	V0141002	FLA0017	35	Is Rebia seventeen?	No
clay	V0141035	FLA0017	29		\N
clay	V0141016	FLA0017	14		\N
clay	V0141017	FLA0017	13	Does Frank give Rebia the wedding_ring ?	Yes
clay	V0141016	FLA0017	15		\N
clay	V0141002	FLA0017	36	Is Rebia happy?	Yes
clay	V0141035	FLA0017	31	Who is oldest?	Frank
clay	V0141017	FLA0017	15	Does Frank give Rebia the wedding ring 	No
clay	V0141002	FLA0017	37	Is Rebia happy?	No
clay	V0141019	FLA0017	14	Doesn't Rebia have "true love"?	Yes
clay	V0141017	FLA0017	16	Is Rebia ugly?	No
clay	V0141035	FLA0017	33	Who is boyfriend?	Frank
clay	V0141016	FLA0017	17	Who is Rebia merry?	Frank
clay	V0141018	FLA0017	23	Who fells Frank is her true love?	--
clay	V0141016	FLA0017	18	Who marry with Rebia?	Frank
clay	V0141017	FLA0017	17	Does Rebia pregnant when she meet Frank?	No
clay	V0141017	FLA0017	18	Does Rebia pregnant when meet Frank?	No
clay	V0141035	FLA0017	35	Who is the boyfriend?	Frank
clay	V0141016	FLA0017	20	Who marry with Rebia?	Frank
clay	V0141017	FLA0017	19	Is she happy?	Yes
clay	V0141029	FLA0017	6	Is the City Hall the biggest place?	--
clay	V0141016	FLA0017	21		\N
clay	V0141016	FLA0017	22		\N
clay	V0141029	FLA0017	7	Is the City Hall the biggest place?	Yes
clay	V0141016	FLA0017	23	Is Rebia happy?	Yes
clay	V0141002	FLA0017	40	Does Rebia have a boyfriend?	Yes
clay	V0141017	FLA0017	20	Is she happy?	Yes
clay	V0141016	FLA0017	24	Is Rebia happy?	Yes
clay	V0141002	FLA0017	41	Does Rebia have a boyfriend?	No
clay	V0141029	FLA0017	8	Is the City Hall the a big place?	Yes
clay	V0141016	FLA0017	25		\N
clay	V0141016	FLA0017	26		\N
clay	V0141029	FLA0017	9	Is the City Hall  big ?	Yes
clay	V0141016	FLA0017	27	Who dose Frank marry?	Rebia
clay	V0141016	FLA0017	28	Who dose Frank get married?	Rebia
clay	V0141029	FLA0017	10	Doesn't Frank married?	Yes
clay	V0141002	FLA0017	42	Does Rebia and Frank have a wedding?	Yes
clay	V0141016	FLA0017	29		\N
clay	V0141016	FLA0017	30		\N
clay	V0141002	FLA0017	43	Does Rebia have a wedding?	Yes
clay	V0141029	FLA0017	11	Is Frank married?	--
clay	V0141016	FLA0017	31	Doesn't Frank get married?	Yes
clay	V0141002	FLA0017	44	Are Rebia and Frank happy?	Yes
clay	V0141002	FLA0017	45	Are Rebia and Frank happy?	No
clay	V0141002	FLA0017	46	Does Rebia have a class_ring?	Yes
clay	V0141002	FLA0017	47	Does Rebia have a class ring?	Yes
clay	V0141002	FLA0017	48	Does Rebia have a class ring?	No
clay	V0141002	FLA0017	49	Does Frank make Rebia happy?	No
clay	V0141002	FLA0017	50	Does Frank makes Rebia happy?	No
clay	V0141002	FLA0017	51	Does Frank make Rebia happy?	No
clay	V0141029	FLA0017	12	 Is frank the oldest?	--
clay	V0141002	FLA0017	52	Does Frank have a house?	No
clay	V0141029	FLA0017	13	Who is Frank?	--
clay	V0141029	FLA0017	14	Does he a ugly kid?	--
clay	V0141018	FLA0017	28	Is Rebia married?	Yes
clay	V0141029	FLA0017	15	Is he a ugly kid?	--
clay	V0141029	FLA0017	16	Where is Michigan?	--
clay	V0141002	FLA0017	53	Does Rebia believe true love?	Yes
clay	V0141018	FLA0017	29	Are Frank and Rebia happy?	Yes
clay	V0141029	FLA0017	17	Does Michigan remember Frank?	--
clay	V0141029	FLA0017	18	Is Michigan a kid?	--
clay	V0141029	FLA0017	19	Does Michigan have a kid?	--
clay	V0141029	FLA0017	20	Does Michigan have a child?	--
clay	V0141018	FLA0017	30	Does Rebia have engagement ring?	Yes
clay	V0141018	FLA0017	31	Did Rebia have engagement ring?	--
clay	V0141017	FLA0017	21	Is she happy?	Yes
clay	V0141029	FLA0017	21	Does Rebia meet Michigan?	Yes
clay	V0141018	FLA0017	32	Did Rebia have wedding ring?	Yes
clay	V0141017	FLA0017	22		\N
clay	V0141017	FLA0017	23	Who is Rebia?	Rebia
clay	V0141021	FLA0017	4		\N
clay	V0141017	FLA0017	24	Who is Rebia?	Rebia
clay	V0141018	FLA0017	33	Did Frank love Rebia?	Yes
clay	V0141017	FLA0017	25	Who get married?	Rebia
clay	V0141029	FLA0017	22	Does Rebia go to City Hall?	--
clay	V0141018	FLA0017	34	Did Frank feel Rebia is his true love?	No
clay	V0141029	FLA0017	23	Does she look beautiful?	No
clay	V0141018	FLA0017	35	Did Rebia believe true love?	Yes
clay	V0141018	FLA0017	36	Does Rebia believe true love?	Yes
clay	V0141021	FLA0017	5	Who have fourth child ?	Rebia
clay	V0141029	FLA0017	24	Does she get home?	Yes
clay	V0141021	FLA0017	6	Who grabbed those rings?	Rebia
clay	V0141018	FLA0017	40	Is Fran Rebia's biological child?	No
clay	V0141021	FLA0017	7	Who grab the ring?	Rebia
clay	V0141021	FLA0017	9	Who grab the wedding_ring?	Rebia
clay	V0141002	FLA0017	58	Who believed true love?	Rebia
clay	V0141029	FLA0017	29	Doesn't Frank go to City Hall?	Yes
clay	V0141002	FLA0017	61	Who is boyfriend?	Frank
clay	V0141018	FLA0017	43	Dose Rebia believe true love?	Yes
clay	V0141029	FLA0017	30	Does she have a boyfriend?	No
clay	V0141018	FLA0017	45	Does Rebia know true love?	Yes
clay	V0141029	FLA0017	31	Is he a father?	Yes
clay	V0141018	FLA0017	47	Did Rebia feel true love?	Yes
clay	V0141029	FLA0017	32	When does he come home?	--
clay	V0141018	FLA0017	48	Did Rebia give engagement ring to Frank?	No
clay	V0141018	FLA0017	50	Does Rebia give wedding ring to Frank?	No
clay	V0141017	FLA0017	27		\N
clay	V0141016	FLA0017	33		\N
clay	V0141018	FLA0017	51	Did Rebia give wedding ring to Frank?	No
clay	V0141018	FLA0017	53	Does Frank and Rebia have home?	Yes
clay	V0141021	FLA0017	11	Who went down to city hall?	Frank
clay	V0141021	FLA0017	12	Who go down to city hall?	Frank
clay	V0141018	FLA0017	55	Did Frank and Rebia go City Hall ?	--
clay	V0141018	FLA0017	57	Doesn't Frank and Rebia go City Hall ?	Yes
clay	V0141018	FLA0017	58		\N
clay	V0141018	FLA0017	37	Does Rebia believe "true love"?	Yes
clay	V0141018	FLA0017	38	Does Rebia know true love?	Yes
clay	V0141018	FLA0017	39	Does Rebia know who is her true love?	Yes
clay	V0141029	FLA0017	25	Is Rebia a beautiful child?	Yes
clay	V0141029	FLA0017	26	Does she believe "true love"?	Yes
clay	V0141029	FLA0017	27	Does she believe Frank?	No
clay	V0141016	FLA0017	32		\N
clay	V0141021	FLA0017	8	Who grab the wedding ring?	Rebia
clay	V0141018	FLA0017	41	Does Rebia have Frank's biological child?	Yes
clay	V0141002	FLA0017	54	Does Rebia believe true love?	Yes
clay	V0141029	FLA0017	28	Who is child?	--
clay	V0141002	FLA0017	55	Does Frank have a kid?	Yes
clay	V0141002	FLA0017	56		\N
clay	V0141002	FLA0017	57	Who believe true love?	Rebia
clay	V0141002	FLA0017	59	Who believes true love?	Frank
clay	V0141017	FLA0017	26		\N
clay	V0141018	FLA0017	42	Is Frank Rebia's true love?	Yes
clay	V0141002	FLA0017	60	Who married Rebia?	Frank
clay	V0141002	FLA0017	62	Who is the wife?	Rebia
clay	V0141009	FLA0017	9	Does Rebia give  Frank  the wedding_ring ?	Yes
clay	V0141018	FLA0017	44	Does Rebia believe true love?	Yes
clay	V0141018	FLA0017	46	Does Rebia know true love?	Yes
clay	V0141018	FLA0017	49	Does Rebia give engagement ring to Frank?	No
clay	V0141016	FLA0017	34		\N
clay	V0141018	FLA0017	52	Did Frank and Rebia have home?	Yes
clay	V0141029	FLA0017	33	Do Rebia and Frank have a son?	Yes
clay	V0141021	FLA0017	10	Who went down to city hall and got married?	Frank
clay	V0141029	FLA0017	34	Do Frank and Rebia go home?	No
clay	V0141018	FLA0017	54	Is Frank and Rebia go City Hall ?	Yes
clay	V0141018	FLA0017	56	Does Frank and Rebia go City Hall ?	Yes
chat	193001	1J0	1		\N
chat	193001	1J0	2		\N
chat	193001	1J0	3	Does Mandy ask a stranger if he is a man?	Yes
chat	193001	1J0	4		\N
chat	193001	1J0	5	Does Mandy ask a stranger how old he is?	Yes
clay	V0141018	FLA0017	59		\N
chat	V0141018	FLA0017	1		\N
chat	V0141009	FLA0017	1		\N
chat	V0141019	FLA0017	1		\N
chat	V0141018	FLA0017	2		\N
chat	V0141022	FLA0017	1		\N
chat	V0141029	FLA0017	1		\N
chat	V0141016	FLA0017	1		\N
chat	V0141002	FLA0017	1		\N
chat	V0141019	FLA0017	2	Is Alice beautiful	Yes
chat	V0141009	FLA0017	2		\N
chat	V0141003	FLA0017	1		\N
chat	V0141019	FLA0017	3	Isn't Alice beautiful	Yes
chat	V0141022	FLA0017	2	Is Ariel beautiful?	Yes
chat	V0141018	FLA0017	3		\N
chat	V0141035	FLA0017	1		\N
chat	V0141019	FLA0017	4	Is Ariel beautiful	Yes
chat	V0141011	FLA0017	1		\N
chat	V0141012	FLA0017	1		\N
chat	V0141019	FLA0017	5	Isn't Ariel beautiful	--
chat	V0141028	FLA0017	1		\N
chat	V0141001	FLA0017	1		\N
chat	V0141011	FLA0017	2		\N
chat	V0141019	FLA0017	6	Isn't Ariel beautiful	Yes
chat	V0141022	FLA0017	3	Is Alice a male?	No
chat	V0141019	FLA0017	7	Is Ellarose beautiful	Yes
chat	V0141026	FLA0017	1		\N
chat	V0141022	FLA0017	4	Is Alice old?	No
chat	V0141019	FLA0017	8	Isn't Ellarose beautiful	Yes
chat	V0141009	FLA0017	3		\N
chat	V0141016	FLA0017	2		\N
chat	V0141028	FLA0017	2	Does Alice live in NY?	Yes
chat	V0141002	FLA0017	2	Is Alice from Taiwan?	No
chat	V0141012	FLA0017	2	Is Junior old ?	--
chat	V0141029	FLA0017	2	Are they female?	Yes
chat	V0141002	FLA0017	3		\N
chat	V0141035	FLA0017	2	Who is a female	Abby
chat	V0141002	FLA0017	4		\N
chat	V0141008	FLA0017	1		\N
chat	V0141022	FLA0017	5	Does Ariel use facebook?	No
chat	V0141019	FLA0017	9	Is Mandy beautiful	Yes
chat	V0141035	FLA0017	3	Who is the female?	Abby
chat	V0141012	FLA0017	3	Is Junior young ?	--
chat	V0141028	FLA0017	3	Does Alice from NY?	Yes
chat	V0141019	FLA0017	10	Isn't Mandy beautiful	Yes
chat	V0141022	FLA0017	6	Does Ariel use Facebook?	No
chat	V0141018	FLA0017	4		\N
chat	V0141021	FLA0017	1		\N
chat	V0141002	FLA0017	5	Who ask Alice?	Abby
chat	V0141009	FLA0017	4	Is Alice young?	Yes
chat	V0141026	FLA0017	2	Who will go toTaiwan next week?	Demi
chat	V0141035	FLA0017	4	Who is  female?	Abby
chat	V0041055	FLA0017	1		\N
chat	V0041055	FLA0017	2		\N
chat	V0141002	FLA0017	6	Who asks Alice?	Abby
chat	V0141022	FLA0017	7	Does Ariel have Facebook?	No
chat	V0141019	FLA0017	11	Is Sabrina beautiful	Yes
chat	V0141002	FLA0017	7		\N
chat	V0141018	FLA0017	5	Is Alice beautiful?	Yes
chat	V0141029	FLA0017	3	Is Mandy old?	Yes
chat	V0141023	FLA0017	1		\N
chat	V0141025	FLA0017	1		\N
chat	V0141012	FLA0017	4	Is Junior a male ?	--
chat	V0141012	FLA0017	5	Is Junior a male ?	--
chat	V0141002	FLA0017	8		\N
chat	V0141035	FLA0017	5	Who is beautiful	Abby
chat	V0141019	FLA0017	12	Isn't Sabrina beautiful	Yes
chat	V0141012	FLA0017	6	Is Junior a male ?	--
chat	V0141012	FLA0017	7	Is Junior a male ?	--
chat	V0141012	FLA0017	8	Is Junior a female ?	--
chat	V0141035	FLA0017	6	Who is beautiful	Abby
chat	V0141016	FLA0017	3		\N
chat	V0141021	FLA0017	2		\N
chat	V0141022	FLA0017	8	Is Madison young?	No
chat	V0141023	FLA0017	2	Do you have a red bag?	Yes
chat	V0141019	FLA0017	13	Is Madison beautiful	Yes
chat	V0141023	FLA0017	3	Do you have a red bag?	--
chat	V0141026	FLA0017	3		\N
chat	V0141028	FLA0017	4	Is Ariel a female?	Yes
chat	V0141002	FLA0017	10	Ariel is a freshman, isn't she?	Yes
chat	V0141025	FLA0017	2		\N
chat	V0141018	FLA0017	7	Is Mandy female?	--
chat	V0141025	FLA0017	3	Isn't Alice beautiful	--
chat	V0141029	FLA0017	5	who's male?	--
chat	V0141012	FLA0017	12	Is Mandy young ?	--
chat	V0141022	FLA0017	11	Is Madison a girl?	No
chat	V0141002	FLA0017	11	Ariel is a sophmore, isn't she?	Yes
chat	V0141012	FLA0017	13	Is Mandy old ?	--
chat	V0141035	FLA0017	9		\N
chat	V0141016	FLA0017	7	Isn't Junior old ?	Yes
chat	V0141018	FLA0017	8	Is Taiwan beautiful?	Yes
chat	V0141003	FLA0017	3	isnt alice beautiful?	Alice
chat	V0141022	FLA0017	14	Is Madison from Paris?	No
chat	V0141012	FLA0017	14	Is Mandy beautiful ?	--
chat	V0141035	FLA0017	10	Is Alice female?	Yes
chat	V0141002	FLA0017	12	Ariel is a sophomore, isn't she?	Yes
chat	V0141009	FLA0017	5	Is Alice beautiful Isn't she ?	Yes
chat	V0141012	FLA0017	15	Is Mandy 15 ?	--
chat	V0141025	FLA0017	6	Isn't Ellarose beautiful	Alice
chat	V0141012	FLA0017	16	Is Mandy 16 ?	--
chat	V0141012	FLA0017	17	Is Mandy 18 ?	--
chat	V0141035	FLA0017	11	Is Ariel female	Yes
chat	V0141003	FLA0017	5	Is Junior 15 ?	--
chat	V0141025	FLA0017	7	Does Ariel have Facebook?	Andy
chat	V0141025	FLA0017	8		--
chat	V0141008	FLA0017	2	Who likes Abby	Claire
chat	V0141035	FLA0017	12	Is Ellarose female	Yes
chat	V0141018	FLA0017	11	Isn't Mandy beautiful?	--
chat	V0141012	FLA0017	18	Is Madison 15 ?	--
chat	V0141019	FLA0017	15	Does Alice a female	Yes
chat	V0141002	FLA0017	14	Is Alive a freshman?	No
chat	V0141012	FLA0017	19	Is Madison 16  ?	--
chat	V0141002	FLA0017	15	Is Alice a freshman?	Yes
chat	V0141029	FLA0017	4	Is Ellarose young?	Yes
chat	V0141012	FLA0017	9	Is Junior 15 ?	--
chat	V0141018	FLA0017	6	Is Ellarose female?	--
chat	V0141023	FLA0017	4	Do you have a red bag?	--
chat	V0141002	FLA0017	9	Ariel is freshman, isn't she?	No
chat	V0141012	FLA0017	10	Is Junior 16 ?	--
chat	V0141023	FLA0017	5	Do you have a red bag?	Yes
chat	V0141035	FLA0017	7	Who is male	Ban
chat	V0141016	FLA0017	4	Is Alice beautiful?	Yes
chat	V0141022	FLA0017	9	Is Madison right?	No
chat	V0141012	FLA0017	11	Is Junior 18 ?	--
chat	V0141026	FLA0017	4		\N
chat	V0141016	FLA0017	5	Is Alice beautiful?	Yes
chat	V0141022	FLA0017	10	Is Madison 15?	No
chat	V0141025	FLA0017	4	Isn't Alice beautiful	Claire
chat	V0141022	FLA0017	12	Is Madison a girl?	Yes
chat	V0141016	FLA0017	6	Isn't Junior old ?	Yes
chat	V0141022	FLA0017	13	Is Madison a girl?	--
chat	V0141035	FLA0017	8		\N
chat	V0141028	FLA0017	5	Does Alice be a good girl?	Yes
chat	V0141028	FLA0017	6	Does Alice a good girl?	Yes
chat	V0141003	FLA0017	2	isnt alice beautiful?	--
chat	V0141003	FLA0017	4	isnt alice beautiful?	Sharon
chat	V0141026	FLA0017	5	Is Paris a good place to travel?	Yes
chat	V0141018	FLA0017	9	Is Sabrina beautiful?	--
chat	V0141029	FLA0017	6	Is Madison 18?	No
chat	V0141025	FLA0017	5	Isn't Ellarose beautiful	Alice
chat	V0141022	FLA0017	15	Is Filibee  from Paris?	No
chat	V0141023	FLA0017	6	Is Ariel beautiful?	Yes
chat	V0141002	FLA0017	13	Is Ariel a sophomore?	Yes
chat	V0141009	FLA0017	6	Is Alice beautiful Isn't she ?	No
chat	V0141018	FLA0017	10	Isn't Alice beautiful?	--
chat	V0141028	FLA0017	7	Isn't Madison a girl?	Yes
chat	V0141019	FLA0017	14	Is Alice a female	Yes
chat	V0141026	FLA0017	6	Is Paris a female?	Yes
chat	V0141022	FLA0017	16	Is Mandy a  sophomore?	No
chat	V0141023	FLA0017	7	Is Junior 18 ?	Yes
chat	V0141029	FLA0017	7	Is Ariel beautiful?	Yes
chat	V0141012	FLA0017	20	Is Madison beautiful  ?	--
chat	V0141025	FLA0017	9	Does Ariel have Facebook?	Abby
chat	V0141025	FLA0017	10		--
chat	V0141021	FLA0017	3	Isn't \tJunior young ? 	Yes
chat	V0141022	FLA0017	17	Is Sabrina a student?	Yes
chat	V0141009	FLA0017	7	Isn't Alice 15?	No
chat	V0141008	FLA0017	3	Who is right?	Andy
chat	V0141019	FLA0017	16	Is Alice female	Yes
chat	V0141018	FLA0017	12	Is Alice a sophomore?	--
chat	V0141016	FLA0017	8	Does Ellarose have Facebook?	Yes
chat	V0141002	FLA0017	16	Is Alice a sophomore?	No
chat	V0141035	FLA0017	13	Is Filibee female	Yes
chat	V0141012	FLA0017	21	Is Filibee beautiful  ?	--
chat	V0141019	FLA0017	17	Isn't Alice  female	Yes
chat	V0141018	FLA0017	13	Is Alice right?	--
chat	V0141003	FLA0017	6	Is Alice young?	--
chat	V0141012	FLA0017	22	Is Filibee 15 ?	--
chat	V0141009	FLA0017	8	Isn't Alice	No
chat	V0141018	FLA0017	14	Is Mandy right?	--
chat	V0141022	FLA0017	18	Is Sabrina a woman?	No
chat	V0141029	FLA0017	8	Is he old?	Yes
chat	V0141035	FLA0017	14	Is junior female	No
chat	V0141028	FLA0017	8	Isn't Mandy 18 ?	Yes
chat	V0141002	FLA0017	17	Is Alice a girl?	Yes
chat	V0141012	FLA0017	23	Is Filibee 16 ?	--
chat	V0141025	FLA0017	11		\N
chat	V0141019	FLA0017	18	Is Ariel female	Yes
chat	V0141025	FLA0017	12		\N
chat	V0141026	FLA0017	7	Is Paris female?	Yes
chat	V0141012	FLA0017	24	Is Filibee 18 ?	--
chat	V0141018	FLA0017	15	Is Madison right?	--
chat	V0141009	FLA0017	9	Isn't Alice 15?	Yes
chat	V0141019	FLA0017	19	Isn't Ariel female	Yes
chat	V0141029	FLA0017	9	Is she young?	Yes
chat	V0141035	FLA0017	15	Is Junior female	No
chat	V0141012	FLA0017	25	Is Filibee a male ?	--
chat	V0141025	FLA0017	13	Is Junior old ?	Yes
chat	V0141016	FLA0017	9	Is Alice male?	No
chat	V0141009	FLA0017	10	Isn't Alice 15?	No
chat	V0141003	FLA0017	7	Who says Alice beautiful?	--
chat	V0141022	FLA0017	19	Is Ariel a freshman?	No
chat	V0141012	FLA0017	26	Is Filibee old ? 	--
chat	V0141003	FLA0017	8	Who says Alice beautiful?	Cheney
chat	V0141012	FLA0017	27	Is Filibee young ? 	--
chat	V0141029	FLA0017	10	Isn't she old?	Yes
chat	V0141002	FLA0017	18	Is Alive young?	No
chat	V0141021	FLA0017	4	Isn't Alice a freshman? 	No
chat	V0141018	FLA0017	16	Is Filibee right?	--
chat	V0141019	FLA0017	20	Is Ellarose female	Yes
chat	V0141003	FLA0017	9	Who says Alice beautiful?	Cindy
chat	V0141035	FLA0017	16	Is Madison female	Yes
chat	V0141035	FLA0017	17	Is Madison female	No
chat	V0141023	FLA0017	8	Does Mandy from USA?	Yes
chat	V0141002	FLA0017	19	Is Alice young?	Yes
chat	V0141025	FLA0017	14	Is Alice beautiful	Yes
chat	V0141019	FLA0017	21	Isn't Ellarose female	Yes
chat	V0141026	FLA0017	8	Is Paris a good girl?	Yes
chat	V0141012	FLA0017	28	Is Filibee a good ?	--
chat	V0141012	FLA0017	29	Is Filibee a good ?	--
chat	V0141029	FLA0017	11	Isn't he old?	Yes
chat	V0141003	FLA0017	10	Who says Alice beautiful?	Dora
chat	V0141003	FLA0017	11	Who says Alice beautiful?	Lilian
chat	V0141019	FLA0017	22	Is Mandy female	Yes
chat	V0141003	FLA0017	12	Who says Alice beautiful?	Yisian
chat	V0141016	FLA0017	10	Is Ariel a freshman?	No
chat	V0141025	FLA0017	16		--
chat	V0141002	FLA0017	20	Is Ariel a beautiful female?	Yes
chat	V0141012	FLA0017	31	Is Alice 16 ?	--
chat	V0141021	FLA0017	5	Isn't Filibee old ? 	No
chat	V0141022	FLA0017	21	Is Ariel stranger?	No
chat	V0141012	FLA0017	32	Is Alice 18 ?	--
chat	V0141018	FLA0017	18	Ia Alice male?	--
chat	V0141003	FLA0017	13	Who says Alice beautiful?	Cherry2
chat	V0141003	FLA0017	15	Who says Alice beautiful?	Alice
chat	V0141022	FLA0017	22	Is Alice a stranger?	No
chat	V0141035	FLA0017	19	Is Sabrina female	Yes
chat	V0141029	FLA0017	12	Is Mandy from USA?	Yes
chat	V0141003	FLA0017	16	Who says Alice beautiful?	Andy
chat	V0141012	FLA0017	34	Is Alice young  ?	--
chat	V0141003	FLA0017	19	Who says Alice beautiful?	Ban
chat	V0141003	FLA0017	20	Who says Alice beautiful?	Bella
chat	V0141003	FLA0017	21	Who says Alice beautiful?	Calina
chat	V0141008	FLA0017	4	Is Emma 18?	--
chat	V0141016	FLA0017	11	Is Ellarose right?	--
chat	V0141023	FLA0017	10	Does Ariel have Facebook?	--
chat	V0141035	FLA0017	20	Is Madison girl	Yes
chat	V0141012	FLA0017	35	Is Alice old ?	--
chat	V0141009	FLA0017	11	Isn't Junior 16 ?	Yes
chat	V0141018	FLA0017	19		\N
chat	V0141002	FLA0017	23	Ariel a beautiful  female, isn't she?	No
chat	V0141003	FLA0017	22	Who says Alice beautiful?	--
chat	V0141016	FLA0017	12	Is in Taiwan?	Yes
chat	V0141021	FLA0017	6	Isn't Alice male?	--
chat	V0141029	FLA0017	13	Isn't Ellarose old?	No
chat	V0141018	FLA0017	21	Who is Alice?	--
chat	V0141002	FLA0017	24	Ariel is a beautiful female, isn't she?	Yes
chat	V0141035	FLA0017	22	Is Alice a girl	Yes
chat	V0141012	FLA0017	36	Is Alice young ?	--
chat	V0141018	FLA0017	22	Where is Paris?	--
chat	V0141016	FLA0017	13	where is USA?	--
chat	V0141008	FLA0017	6	Is Emma beautiful?	--
chat	V0141028	FLA0017	10	Is Ariel beautiful	--
chat	V0141016	FLA0017	14	Isn't Alice right?	--
chat	V0141002	FLA0017	26	Ariel is a girl isn't she?	No
chat	V0141002	FLA0017	27	Ariel is a girl isn't she?	--
chat	V0141003	FLA0017	24	How old is Cherry?	--
chat	V0141035	FLA0017	23		\N
chat	V0141012	FLA0017	43	Is Ellarose 15 6	--
chat	V0041055	FLA0017	4	Is Mandy young?	Yes
chat	V0141023	FLA0017	12	Is Mandy female	Yes
chat	V0141012	FLA0017	45	Is Ellarose 18 ?	--
chat	V0141019	FLA0017	28	Is't Junior 16 ?	Yes
chat	V0141002	FLA0017	28	Is Ariel a student?	Yes
chat	V0141003	FLA0017	25	How old is Alice?	--
chat	V0141022	FLA0017	27	Is Paris a city?	Yes
chat	V0141028	FLA0017	11	Is Mandy 15 ?	Yes
chat	V0141012	FLA0017	46	Is Ellarose old ?	--
chat	V0141029	FLA0017	16	Does she have Facebook? \t	Yes
chat	V0141019	FLA0017	29	Isn't Junior 16 	Yes
chat	V0141012	FLA0017	47	Is Ellarose young ?	--
chat	V0141018	FLA0017	24	Who is Ellarose?	--
chat	V0141025	FLA0017	20	Who says Ariel is beautiful?	--
chat	V0141025	FLA0017	21		--
chat	V0141019	FLA0017	30	Isn't Junior 17 ?	Yes
chat	V0141035	FLA0017	27	Who live in Paris	Andy
chat	V0141019	FLA0017	31	Isn't Junior 17 	Yes
chat	V0141028	FLA0017	12	Is Mandy 17	--
chat	V0141008	FLA0017	10	Is Emma a female?	--
chat	V0141016	FLA0017	17	Isn't Alice young?	--
chat	V0141025	FLA0017	23	Isn't Mandy 6 ?	--
chat	V0141025	FLA0017	24	Isn't Mandy 6 ?	--
chat	V0141025	FLA0017	25	Isn't Mandy 6 ?	--
chat	V0141025	FLA0017	27	Isn't Mandy 6 ?	--
chat	V0141009	FLA0017	13	Isn't Alice old?	No
chat	V0141028	FLA0017	14		\N
chat	V0141016	FLA0017	18	Is Filibee right?	--
chat	V0141009	FLA0017	14	Isn't Alice old?	No
chat	V0141018	FLA0017	27	Who is good?	--
chat	V0141025	FLA0017	28	Who is most beautiful	--
chat	V0141003	FLA0017	26	Is Alice 18?	--
chat	V0141029	FLA0017	18	Does Ariel have Facebook? \t	Yes
chat	V0141035	FLA0017	29	Who is freshman	Abby
chat	V0141025	FLA0017	29	Who is most beautiful	Yes
chat	V0041055	FLA0017	7	Do Ariel use Facebook?	Yes
chat	V0141018	FLA0017	28	Who is old?	--
chat	V0141026	FLA0017	12	Is Sabrina a woman?	--
chat	V0141008	FLA0017	12	When did she likes it?	Irene
chat	V0141002	FLA0017	31	Dose Ariel come from Turkey?	Yes
chat	V0141012	FLA0017	48	Is Ellarose beautiful ?	--
chat	V0041055	FLA0017	8	Do Ariel like Facebook?	Yes
chat	V0141008	FLA0017	13	When did she likes him?	--
chat	V0141018	FLA0017	29	Isn't Facebook 15?	--
chat	V0041055	FLA0017	9	Does Ariel like Facebook?	Yes
chat	V0041055	FLA0017	10	Is Ariel like Facebook?	Yes
chat	V0141018	FLA0017	30	Isn't Facebook beautiful?	--
chat	V0141003	FLA0017	28	Who has facebook?	--
chat	V0141003	FLA0017	29	Who has facebook?	--
chat	V0141026	FLA0017	13	Is Sabrina a woman?	Yes
chat	V0141016	FLA0017	19	Is she old?	--
chat	V0141019	FLA0017	34	Doesn't he have Facebook?	Yes
chat	V0141025	FLA0017	34	Isn't Alice female?	--
chat	V0141023	FLA0017	15	Where is Alice?	--
chat	V0141022	FLA0017	29	Is Alice from Taiwan?	No
chat	V0141002	FLA0017	33	Does Alice come from Turkey?	Yes
chat	V0141003	FLA0017	31	Who doesn't have facebook?	--
chat	B03200102	1J0	70		\N
chat	V0141028	FLA0017	9	Does Alice like Paris ?	Yes
chat	V0141035	FLA0017	18	Is Mandy female	Yes
chat	V0141019	FLA0017	23	Isn't Mandy female	Yes
chat	V0141025	FLA0017	15	Does Ariel have Facebook?	Yes
chat	V0141018	FLA0017	17	Ia Alice a man?	--
chat	V0141022	FLA0017	20	Is Filibee stranger?	No
chat	V0141012	FLA0017	30	Is Alice 15 ?	--
chat	V0141012	FLA0017	33	Is Alice old ?	--
chat	V0141003	FLA0017	14	Who says Alice beautiful?	Abby
chat	V0141023	FLA0017	9	Does Ariel have Facebook?	Yes
chat	V0141003	FLA0017	17	Who says Alice beautiful?	Annie
chat	V0141002	FLA0017	21	Is Ariel a beautiful male?	No
chat	V0141025	FLA0017	17	Is Mandy 14 ?	Yes
chat	V0141003	FLA0017	18	Who says Alice beautiful?	Ariel
chat	V0141002	FLA0017	22	Is Ariel a male?	No
chat	V0141025	FLA0017	18	Is Mandy 14 ?	Yes
chat	V0141022	FLA0017	23	Is Paris good?	No
chat	V0141019	FLA0017	24	Isn't Filibee right?	Yes
chat	V0141018	FLA0017	20		\N
chat	V0141035	FLA0017	21	Is Alice girl	Yes
chat	V0141008	FLA0017	5	Is Emma 18?	--
chat	V0141003	FLA0017	23	Who says Alice is beautiful?	--
chat	V0141019	FLA0017	25	Isn't Ellarose right?	Yes
chat	V0141022	FLA0017	24	Is Paris in Taiwan?	No
chat	V0141012	FLA0017	37	Is Ariel 15 ?	--
chat	V0141012	FLA0017	38	Is Ariel 16 ?	--
chat	V0141029	FLA0017	14	Isn't Sabrina beautiful ?	Yes
chat	V0141012	FLA0017	39	Is Ariel 18 ?	--
chat	V0141019	FLA0017	26	Who says Alice isn't beautiful?	Yes
chat	V0141002	FLA0017	25	Ariel is a girl, isn't she?	Yes
chat	V0141022	FLA0017	25	Is Paris from Taiwan?	No
chat	V0141018	FLA0017	23	Where is USA?	--
chat	V0141012	FLA0017	40	Is Ariel old ?	--
chat	V0141026	FLA0017	9	Doesn't Alice come from city?	--
chat	V0141012	FLA0017	41	Is Ariel young ?	--
chat	V0141025	FLA0017	19	Isn't Filibee old ?	--
chat	V0141008	FLA0017	7	Do you thinks Emma beautiful?	--
chat	V0141023	FLA0017	11	IsMandy female	--
chat	V0041055	FLA0017	3	Does Mandy young?	Yes
chat	V0141021	FLA0017	7	Isn't Alice a girl?	--
chat	V0141019	FLA0017	27	Isn't Alice a stranger?	Yes
chat	V0141009	FLA0017	12	Isn't Ellarose young?	Yes
chat	V0141012	FLA0017	42	Is Ellarose 15 ?	--
chat	V0141016	FLA0017	15	Isn't Mandy right?	--
chat	V0141022	FLA0017	26	Is Ariel a man?	No
chat	V0141029	FLA0017	15	Isn't Sabrina young?	Yes
chat	V0141035	FLA0017	24		\N
chat	V0141012	FLA0017	44	Is Ellarose 16 ?	--
chat	V0141026	FLA0017	10	Is Taiwan a good place?	--
chat	V0141016	FLA0017	16	Is Alice 18 ?	--
chat	V0141029	FLA0017	17	Does he have Facebook? \t	Yes
chat	V0141035	FLA0017	25	Who live in Paris	Abby
chat	V0141002	FLA0017	29	Is Alice a girl?	Yes
chat	V0141035	FLA0017	26	Who live in Paris	Alice
chat	V0141008	FLA0017	8	Is Emma a female	--
chat	V0041055	FLA0017	5	Do they from NY?	Yes
chat	V0141018	FLA0017	25	Who is Facebook?	--
chat	V0141008	FLA0017	9	Is Emma a female?	--
chat	V0141026	FLA0017	11	Isn't Taiwan good?	--
chat	V0141035	FLA0017	28	Who live in Paris	Ariel
chat	V0141022	FLA0017	28	Alice is a woman, isn't she?	Yes
chat	V0141025	FLA0017	22	Isn't Mandy 6 ?	Yes
chat	V0141025	FLA0017	26	Isn't Mandy 6 ?	--
chat	V0141019	FLA0017	32	Isn't Junior male	Yes
chat	V0141021	FLA0017	8	Is Alice young ? 	--
chat	V0141023	FLA0017	13		\N
chat	V0141018	FLA0017	26	Who is USA?	--
chat	V0141028	FLA0017	13	Who is Alice ?	Yes
chat	V0041055	FLA0017	6	Do they use Facebook?	Yes
chat	V0141025	FLA0017	30	Who is most beautiful	--
chat	V0141025	FLA0017	31	Who is most beautiful	--
chat	V0141025	FLA0017	32	Who is most beautiful	--
chat	V0141028	FLA0017	15	Who is Alice ?	--
chat	V0141023	FLA0017	14	Who is Alice?	--
chat	V0141035	FLA0017	30	Who is the freshman	Abby
chat	V0141002	FLA0017	30	dose Ariel come from Turkey?	No
chat	V0141008	FLA0017	11	When did she likes it?	--
chat	V0141009	FLA0017	15	Is Alice 18?	Yes
chat	V0141025	FLA0017	33	Who is female?	Yes
chat	V0141028	FLA0017	16	Who live in NY ?	--
chat	V0141019	FLA0017	33	Who isn't Facebook?	Yes
chat	V0141009	FLA0017	16	Is Alice 18	No
chat	V0141002	FLA0017	32	Does Ariel come from Turkey?	No
chat	V0141003	FLA0017	27	Who has facebook?	--
chat	V0141003	FLA0017	30	Who has facebook?	--
chat	V0041055	FLA0017	11	Isn't Ariel like Facebook?	Yes
chat	V0141035	FLA0017	31	Who come from Taiwan	Abby
chat	V0141018	FLA0017	31	Isn't Facebook 16?	--
chat	V0141011	FLA0017	3	Who is the girl?	Alice
chat	V0141025	FLA0017	35	Is Mandy female?	Yes
chat	V0141018	FLA0017	32	Isn't Facebook 18?	--
chat	V0141008	FLA0017	14	Who is Taiwanese?	Irene
chat	V0141028	FLA0017	17	Where is USA	--
chat	V0141035	FLA0017	32		\N
chat	V0041055	FLA0017	13	Isn't Ariel live in USA?	No
chat	V0141035	FLA0017	33		\N
chat	V0141009	FLA0017	17	Is Alice freshman?	Yes
chat	V0141016	FLA0017	20	Is she beautiful?	--
chat	V0041055	FLA0017	14	Is Ariel live in USA?	Yes
chat	V0141009	FLA0017	18	Is Alice freshman?	No
chat	V0141029	FLA0017	20	Is he from Paris?	No
chat	V0141008	FLA0017	16	Who is come from Taiwanese?	Rachel
chat	V0041055	FLA0017	12	Isn't Ariel live in USA?	Yes
chat	V0141003	FLA0017	32	Who doesn't have facebook?	--
chat	V0141019	FLA0017	35	Doesn't Ariel come from Turkey?	Yes
chat	V0141029	FLA0017	19	Isn't he from Paris?	Yes
chat	V0141002	FLA0017	34	Does Ariel come from Taiwan?	No
chat	V0141018	FLA0017	33	Isn't Alice 15?	--
chat	V0141019	FLA0017	36	Does Ariel come from Turkey?	No
chat	V0041055	FLA0017	15	Is Ariel live in USA?	No
chat	V0141018	FLA0017	34	Isn't Alice 16?	--
chat	V0141008	FLA0017	15	Who is come from Taiwanese?	--
chat	V0141002	FLA0017	35	Does Alice come from Taiwan?	No
chat	V0141035	FLA0017	34	Dose Alice come from Taiwan	Yes
chat	V0141008	FLA0017	17	Who is come from Taiwanese?	--
chat	V0141018	FLA0017	35	Isn't Alice 18?	--
chat	V0141008	FLA0017	18	Who is come from Taiwanese?	--
chat	V0141016	FLA0017	21	Is she 16?	--
chat	V0141019	FLA0017	37	Isn't she beautiful?	Yes
chat	V0141022	FLA0017	30	Does Ariel understand?	No
chat	V0141035	FLA0017	35	Does Alice come from Taiwan	Yes
chat	V0141009	FLA0017	19	Is Paris freshman?	Yes
chat	V0141028	FLA0017	18	Isn't Ariel young ?	Yes
chat	V0141029	FLA0017	21	Isn't she from USA?	No
chat	V0141016	FLA0017	24	Is he 15?	--
chat	V0141035	FLA0017	36	Does Alice come from Taiwan	Yes
chat	V0141009	FLA0017	20	Is Filibee freshman?	Yes
chat	V0141023	FLA0017	16	Who is Mandy?	--
chat	V0141035	FLA0017	37	Does Alice come from Taiwan	No
chat	V0141002	FLA0017	36	Does Mandy come from Paris?	No
chat	V0141025	FLA0017	37	Who says Ariel is beautiful?\t	--
chat	V0141008	FLA0017	22	Who ask she?	Irene
chat	V0141016	FLA0017	27	Isn't he 18?	--
chat	V0141019	FLA0017	39	Isn't Alice a sophomore?	Yes
chat	V0141018	FLA0017	38	Isn't Filibee 16?	--
chat	V0041055	FLA0017	17	Do Alice like Facebook?	Yes
chat	V0141022	FLA0017	31	Does Ariel tell anything?	No
chat	V0041055	FLA0017	18	Is Alice like Facebook?	--
chat	V0141025	FLA0017	36	Who says Ariel isn't beautiful?\t	--
chat	V0141016	FLA0017	22	Is he 16?	--
chat	V0141008	FLA0017	19	Who come from Taiwan?	--
chat	V0141003	FLA0017	33	Isn't facebook 13?	--
chat	V0141011	FLA0017	4	Who is the women?	Abby
chat	V0141018	FLA0017	36	Isn't Ariel 15?	--
chat	V0141008	FLA0017	20	Who come from Taiwan?	Irene
chat	V0141026	FLA0017	14	Does Ariel come from NY?	No
chat	V0141019	FLA0017	38	Isn't Sabrina a woman?	Yes
chat	V0141016	FLA0017	23	Isn't he 16?	--
chat	V0141003	FLA0017	34	Who loves Alice?	--
chat	V0141035	FLA0017	38		--
chat	V0141016	FLA0017	25	Is he 18?	--
chat	V0141008	FLA0017	21	Who asked she?	Irene
chat	V0041055	FLA0017	16	Do they like Facebook?	Yes
chat	V0141018	FLA0017	37	Isn't Filibee 15?	--
chat	V0141016	FLA0017	26	Isn't he 15?	--
chat	V0141009	FLA0017	21	Is Ariel freshman?	Yes
chat	V0141029	FLA0017	22	Isn't she from NY?	No
chat	V0141002	FLA0017	37	Does Mandy come from Turkey?	Yes
chat	V0141018	FLA0017	39	Isn't Filibee 18?	--
chat	V0141003	FLA0017	35	Is Alice a woman?	--
chat	V0141019	FLA0017	40	Isn't Mandy beautiful	Yes
chat	V0041055	FLA0017	19	Is Alice like Facebook?	Yes
chat	V0141001	FLA0017	2	Who is the man?	Andy
chat	V0141035	FLA0017	39	Does Ariel come from Taiwan	No
chat	V0141002	FLA0017	38	Does Mandy come from Taiwan?	Yes
chat	V0141018	FLA0017	40	Isn't Sabrina 15?	--
chat	V0141028	FLA0017	19	Isn't Ellarose old ?	--
chat	V0141019	FLA0017	41	Isn't Junior old ?	Yes
chat	V0141022	FLA0017	32	Does Ariel tell ?	No
chat	V0141018	FLA0017	41	Isn't Sabrina 16?	--
chat	V0141003	FLA0017	36	Is Sabrina a woman?	--
chat	V0141018	FLA0017	42	Isn't Sabrina 18?	--
chat	V0141008	FLA0017	23	How old are she	--
chat	V0141029	FLA0017	23	Isn't Ellarose  old?	No
chat	V0141008	FLA0017	24	How old are she?	--
chat	V0141026	FLA0017	15	Does Mandy like Turkey?	Yes
chat	V0141019	FLA0017	42	Isn't Junior old ?	Yes
chat	V0141035	FLA0017	40	Does Ariel come from USA	No
chat	V0141035	FLA0017	41	Does Ariel come from USA	--
chat	V0141008	FLA0017	25	How old are she?	Irene
chat	V0141022	FLA0017	33	Does Ariel tell Alice?	No
chat	V0141025	FLA0017	38	Does Mandy have Facebook?	--
chat	V0141009	FLA0017	22	Does Ariel from Taiwan?	Yes
chat	V0141026	FLA0017	16	Does Mandy like to go to Turkey?	Yes
chat	V0141035	FLA0017	42	Does Ariel come from USA?	Yes
chat	V0141022	FLA0017	34	Does Ariel talk to Alice?	No
chat	V0141011	FLA0017	5	Who is the beautiful girl?	Bella
chat	V0141003	FLA0017	37	Where is Alice from?	--
chat	V0141018	FLA0017	43	Isn't Mandy 15?	--
chat	V0141009	FLA0017	23	Does Ariel com from Taiwan?	Yes
chat	V0141008	FLA0017	26	What is your name?	Abby
chat	V0141028	FLA0017	20	Does Alice live in Paris ?	Yes
chat	V0041055	FLA0017	20	Does Ariel have Facebook?	Yes
chat	V0141018	FLA0017	44	Isn't Mandy 16?	--
chat	V0141003	FLA0017	38	Where does Alice come from?	--
chat	V0141016	FLA0017	28	Is he a freshmen	--
chat	V0141002	FLA0017	39	Is Mandy a female?	Yes
chat	V0141018	FLA0017	45	Isn't Mandy 18?	--
chat	V0141016	FLA0017	29	Is he a freshmen	--
chat	V0141035	FLA0017	43	Doesn't Ariel come from USA?	Yes
chat	V0141008	FLA0017	27	What is her name?	Emma
chat	V0141029	FLA0017	24	Does Alice like Taiwan?	No
chat	V0141002	FLA0017	40	Is Mandy a girl?	Yes
chat	V0141026	FLA0017	17	Does Mandy come from Turkey?	Yes
chat	V0141025	FLA0017	39	Does Ellarose have Facebook?	--
chat	V0141028	FLA0017	21	Does Alice like Paris ?	--
chat	V0141016	FLA0017	30	Is he like she?	--
chat	V0041055	FLA0017	21	Are they old?	No
chat	V0141003	FLA0017	39	Is Alice from Taiwan?	--
chat	V0141035	FLA0017	44	Isn't Junior 18	Yes
chat	V0141016	FLA0017	31	Dose he like she?	--
chat	V0141002	FLA0017	41	Is Ariel a girl?	Yes
chat	V0141028	FLA0017	22	Is Alice like Paris ?	--
chat	V0141029	FLA0017	25	Does Alice like Ellarose?	Yes
chat	V0141025	FLA0017	40	Does Paris have Facebook?	--
chat	V0141009	FLA0017	24	Does Ariel from Taiwan?	Yes
chat	V0141018	FLA0017	46	Is Alice a sophomore?	--
chat	V0141035	FLA0017	45	Doesn't Mandy have Facebook?	Yes
chat	V0141029	FLA0017	26	Who is Ellarose?	--
chat	V0141002	FLA0017	42	Is Alice a sophomore student?	Yes
chat	V0141018	FLA0017	47		\N
chat	V0141016	FLA0017	32	Is she from NY?	--
chat	V0141018	FLA0017	48		\N
chat	V0141009	FLA0017	25	Does Ariel com?	Yes
chat	V0141002	FLA0017	43	Is Alice a student?	Yes
chat	V0141021	FLA0017	9	Isn't Ariel right? 	--
chat	V0141028	FLA0017	23	Is Sabrina a girl? 	--
chat	V0141016	FLA0017	33	Isn't she from Turkey?	--
chat	V0141016	FLA0017	34	Isn't he from NY?	--
chat	V0141025	FLA0017	41	Is Alice old?	--
chat	V0141009	FLA0017	26	Does Ariel come?	Yes
chat	V0141011	FLA0017	6	Who is come from Taiwan?	Emma
chat	V0141016	FLA0017	35	Isn't he from Turkey?	--
chat	V0141003	FLA0017	40	Who comes from USA?	--
chat	V0141028	FLA0017	24	Is Ariel a girl?	--
chat	V0141029	FLA0017	27	Who is male?	Yes
chat	V0141035	FLA0017	46	Isn't Mandy a girl?	Yes
chat	V0141008	FLA0017	28	Who is young?	--
chat	V0141003	FLA0017	41	Who comes from Taiwan?	--
chat	V0141025	FLA0017	42	Is Sabrina old	--
chat	V0141009	FLA0017	28	Does Ariel come city? 	No
chat	V0041055	FLA0017	23	Does Alice is a female from freshman	No
chat	V0141025	FLA0017	44	Is Madison old ?	--
chat	V0141035	FLA0017	48	Doesn't Ariel come from Turkey?	No
chat	V0141026	FLA0017	18	Does Madison come from city?	No
chat	V0141003	FLA0017	42	Does Alice get married?	--
chat	V0041055	FLA0017	24	Is Alice a female from freshman	No
chat	V0141026	FLA0017	19	Does Madison come from the city?	--
chat	V0041055	FLA0017	25	Is Alice a female from freshman?	No
chat	V0141021	FLA0017	10	Isn't Ariel right? 	--
chat	V0141001	FLA0017	3	whose question is right?	Annie
chat	V0141025	FLA0017	45	Is Filibee 20 ?	--
chat	V0141022	FLA0017	38	Where is Filibee?	--
chat	V0141008	FLA0017	29	Who is your friend?	--
chat	V0141002	FLA0017	44	Is Madison from USA?	Yes
chat	V0141028	FLA0017	26	Is Madison a girl ?	--
chat	V0141018	FLA0017	50	Isn't Alice male?	No
chat	V0141025	FLA0017	46	Is Filibee 18 ?	--
chat	V0141011	FLA0017	8	Is Emma come from Taiwan?	Yes
chat	V0141009	FLA0017	29	Does Ariel ask? 	Yes
chat	V0141028	FLA0017	27	Isn't Ellarose a girl ?	--
chat	V0041055	FLA0017	26	Is she a female from freshman?	No
chat	V0141001	FLA0017	4	who is female?	Alice
chat	V0141021	FLA0017	12	Is he from Turkey? 	--
chat	V0041055	FLA0017	27	Does she a female from freshman?	--
chat	V0141035	FLA0017	51	Isn't Sabrina old	Yes
chat	V0141009	FLA0017	30	Does Ariel ask Alice? 	No
chat	V0141002	FLA0017	46	Is Madison 15?	Yes
chat	V0141003	FLA0017	45	What food does Alice like?	--
chat	V0141025	FLA0017	47	Is Filibee 14 ?	--
chat	V0141009	FLA0017	31	Does Ariel greet Alice? 	Yes
chat	V0141025	FLA0017	49	Is Filibee 25 ?	--
chat	V0141002	FLA0017	47	Is Madison good?	Yes
chat	V0141025	FLA0017	51	Is Filibee 19 ?	--
chat	V0141029	FLA0017	28	Isn't she a student?	Yes
chat	V0141035	FLA0017	52	Isn't Ariel young ?	Yes
chat	V0041055	FLA0017	30	Is he a freshman?	Yes
chat	V0141025	FLA0017	52	Isn't Mandy young ?	--
chat	V0141025	FLA0017	53	Isn't Alice young ?	--
chat	V0141018	FLA0017	54	Isn't Sabrina male?	No
chat	V0141016	FLA0017	36	Isn't he from Turkey?	--
chat	V0141028	FLA0017	31	Is Junior a girl ?	--
chat	V0141001	FLA0017	6	who is freshman?	Ban
chat	V0141021	FLA0017	14	Isn't Ellarose a girl ?	--
chat	V0141025	FLA0017	55	Isn't Ellarose beautiful	--
chat	V0141003	FLA0017	50	 do you feel so tired?	--
chat	V0141028	FLA0017	32	Isn't Junior a girl ?	--
chat	V0041055	FLA0017	31	Are they from USA?	Yes
chat	V0141008	FLA0017	33	Is Mandy a sophomore?	--
chat	V0141018	FLA0017	55	Isn't Paris good?	Yes
chat	V0041055	FLA0017	32	Is Alice from USA?	Yes
chat	V0141021	FLA0017	15	Isn't Sabrina old	--
chat	V0141002	FLA0017	51	Madison is a stranger, isn't he?	Yes
chat	V0141008	FLA0017	34	Is Mandy a stranger?	--
chat	V0141003	FLA0017	52	Who is female?	--
chat	V0141018	FLA0017	57	Does Alice come?	No
chat	V0141023	FLA0017	21	Isn't Filibee a man?	--
chat	V0141002	FLA0017	54	Is Madison a sophomore?	--
chat	V0141026	FLA0017	24	Isn't Ellarose a student?	Yes
chat	V0141002	FLA0017	55	Is Madison from Paris?	Yes
chat	V0141025	FLA0017	58	Is Mandy 18?	--
chat	V0141028	FLA0017	33	Is Ma	--
chat	V0141028	FLA0017	34	Is Madison a girl ?	--
chat	V0141008	FLA0017	37	Who says Mandy isn't beautiful?	--
chat	V0141025	FLA0017	62	Is Mandy a girl?\t	--
chat	V0141018	FLA0017	66		\N
chat	V0041055	FLA0017	36	Does she come from USA?	No
chat	V0141035	FLA0017	63	Isn't Filibee a man?	No
chat	V0141023	FLA0017	27	Isn't Filibee a man?	--
chat	V0141008	FLA0017	38	Who says Madison isn't beautiful?	--
chat	V0141023	FLA0017	28	Isn't Paris a man?	--
chat	V0141018	FLA0017	68	Does Filibee understand?	No
chat	V0141018	FLA0017	69	Does Mandy understand?	No
chat	V0141008	FLA0017	39	Isn't Mandy right?	--
chat	V0141002	FLA0017	63	Doesn't Alice come from Taiwna?	Yes
chat	V0141026	FLA0017	25	Is Sabrina a tall girl?	No
chat	V0141008	FLA0017	40	Isn't Mandy young?	--
chat	V0041055	FLA0017	37	Doesn't she come from Paris?	No
chat	V0141035	FLA0017	64	Isn't he a freshman?	No
chat	V0141002	FLA0017	64	Doesn't Alice come from Taiwan?	Yes
chat	V0141018	FLA0017	71	Is Ariel a student?	No
chat	V0141002	FLA0017	65	Doesn't Alice come from USA?	Yes
chat	V0141025	FLA0017	64	Isn't Mandy a woman?	--
chat	V0141011	FLA0017	11	Who is the girl?	Cindy
chat	V0041055	FLA0017	38	Doesn't he come from Paris?	Yes
chat	V0141026	FLA0017	26	Is Sabrina a young girl?	Yes
chat	V0141002	FLA0017	66	Doesn't Alice come from NY?	--
chat	V0141029	FLA0017	33	Aren't they right?	Yes
chat	V0141035	FLA0017	65	Doesn't Mandy understand?	Yes
chat	V0141021	FLA0017	20	Is Mandy a stranger? 	--
chat	V0141028	FLA0017	41	Isn't Ellarose a good girl ?	--
chat	V0141035	FLA0017	66	Isn't Alice from USA?	Yes
chat	V0141028	FLA0017	43	Isn't Filibee a good girl ?	--
chat	V0141035	FLA0017	68	Isn't Mandy a sophomore?	No
chat	V0141023	FLA0017	32	Isn't Taiwan a city?	--
chat	V0141011	FLA0017	12	Who is the old women?	Dora
chat	V0041055	FLA0017	22	Is Alice female from freshman	Yes
chat	V0141011	FLA0017	7	Which is come from Taiwan?	Emma
chat	V0141022	FLA0017	35		\N
chat	V0141009	FLA0017	27	Does Ariel come city? 	Yes
chat	V0141022	FLA0017	36		\N
chat	V0141025	FLA0017	43	Is Junior old ?	--
chat	V0141018	FLA0017	49		\N
chat	V0141035	FLA0017	47	Doesn't Ariel come from Turkey?	Yes
chat	V0141022	FLA0017	37	What is Facebook?	--
chat	V0141028	FLA0017	25	Is Ellarose a girl ?	No
chat	V0141035	FLA0017	49	Doesn't Ariel understand?	Yes
chat	V0141026	FLA0017	20	Does Madison come from a city?	--
chat	V0141003	FLA0017	43	Is Alice single?	--
chat	V0141022	FLA0017	39	Where is Paris?	--
chat	V0141035	FLA0017	50	Doesn't Ariel understand?	No
chat	V0141021	FLA0017	11	Is he from Turkey? 	--
chat	V0141011	FLA0017	9	Is Emma come from Taiwan?	No
chat	V0141002	FLA0017	45	Is Madison a junior?	Yes
chat	V0141008	FLA0017	30	Who is your teacher?	--
chat	V0141003	FLA0017	44	Is Alice married?	--
chat	V0141019	FLA0017	43		\N
chat	V0141018	FLA0017	51	Is Alice male?	No
chat	V0041055	FLA0017	28	Does she a female from freshman?	No
chat	V0141028	FLA0017	28	Isn't Madison a girl ?	--
chat	V0141018	FLA0017	52	Isn't Ariel male?	No
chat	V0141026	FLA0017	21	Isn't it right?	Yes
chat	V0141025	FLA0017	48	Is Filibee 25 ?	--
chat	V0141025	FLA0017	50	Is Filibee 19 ?	--
chat	V0141008	FLA0017	31	Is Emma young?	--
chat	V0141023	FLA0017	17	Is Sabrina from Taiwan?	--
chat	V0141002	FLA0017	48	Is Madison young?	Yes
chat	V0141003	FLA0017	46	Who doesn't have facebook?	--
chat	V0141028	FLA0017	29	Isn't Filibee a girl ?	--
chat	V0141008	FLA0017	32	Is Alice young?	--
chat	V0041055	FLA0017	29	Is she a freshman?	Yes
chat	V0141002	FLA0017	49	Is Madison a young girl?	No
chat	V0141029	FLA0017	29	Isn't he a student?	Yes
chat	V0141035	FLA0017	53	Isn't Ariel young ?	No
chat	V0141023	FLA0017	18		\N
chat	V0141009	FLA0017	32	Is Ariel greet Alice?	Yes
chat	V0141026	FLA0017	22	Aren't they young?	Yes
chat	V0141028	FLA0017	30	Is Filibee a girl ?	--
chat	V0141021	FLA0017	13	Isn't Ellarose a girl ?	--
chat	V0141018	FLA0017	53	Isn't Madison male?	No
chat	V0141009	FLA0017	33	Is Ariel greet Alice?	No
chat	V0141035	FLA0017	54	Isn't she a freshman?	No
chat	V0141003	FLA0017	47	Why we have to be so tired?	--
chat	V0141029	FLA0017	30	Is Ariel a woman?	Yes
chat	V0141003	FLA0017	48	 we have to be so tired?	--
chat	V0141001	FLA0017	5	who is freshman	Ban
chat	V0141025	FLA0017	54	Isn't Alice beautiful	--
chat	V0141023	FLA0017	19	Isn't Mandy a girl	Yes
chat	V0141009	FLA0017	34	Doesn't Ariel greet Alice?	Yes
chat	V0141003	FLA0017	49	 do we feel so tired?	--
chat	V0141002	FLA0017	50	Is Madison a stranger?	Yes
chat	V0141029	FLA0017	31	Is Mandy a woman?	Yes
chat	V0141009	FLA0017	35	Doesn't Ariel greet Ellarose?	Yes
chat	V0141026	FLA0017	23	Isn't Ellarose a Sophomore?	Yes
chat	V0141018	FLA0017	56	Isn't Facebook good?	Yes
chat	V0141003	FLA0017	51	Who is female	--
chat	V0141025	FLA0017	56	Isn't Filibee right?	--
chat	V0141035	FLA0017	55	Isn't Filibee right?	No
chat	V0141023	FLA0017	20	Isn't Filibee a boy?	--
chat	V0041055	FLA0017	33	Is Alice have Facebook?	Yes
chat	V0141002	FLA0017	52	Is Madison from Turkey?	Yes
chat	V0141035	FLA0017	56	Isn't Mandy a woman?	No
chat	V0141002	FLA0017	53	Is Madison a sophomore?	Yes
chat	V0141035	FLA0017	57	Isn't Mandy a stranger?	Yes
chat	V0141021	FLA0017	16	Is Alice a stranger?	--
chat	V0141018	FLA0017	58	Does Ariel come?	No
chat	V0141009	FLA0017	36	Doesn't Alice greet Ellarose?	Yes
chat	V0141008	FLA0017	35	Is Mandy a freshmen?	--
chat	V0141025	FLA0017	57	Is Mandy 19 ?	--
chat	V0141029	FLA0017	32	Isn't Alice a freshman?	Yes
chat	V0141018	FLA0017	59	Did Ariel come?	No
chat	V0041055	FLA0017	34	Is she name Alice?	Yes
chat	V0141035	FLA0017	58	Isn't Alice old?	No
chat	V0141002	FLA0017	56	Dose Madison come from Paris?	Yes
chat	V0141021	FLA0017	17	Isn't Ariel a stranger?	--
chat	V0141018	FLA0017	60	Did Ellarose come?	No
chat	V0141003	FLA0017	53	Are Alice and Ellarose are sibilings?	--
chat	V0141002	FLA0017	57	Does Madison come from Paris?	Yes
chat	V0141023	FLA0017	22	Isn't Alice a man?	--
chat	V0141003	FLA0017	54	Are Alice and Ellarose are couple?	--
chat	V0141009	FLA0017	37	Doesn't  Ellarose greet Alice?	Yes
chat	V0141018	FLA0017	61	Did Ellarose understand?	No
chat	V0141025	FLA0017	59	Isn't he a freshman?	--
chat	V0141035	FLA0017	59	Isn't he 18?	Yes
chat	V0141002	FLA0017	58	Doesn't Madison come from Paris?	Yes
chat	V0141003	FLA0017	55	Are Alice single/	--
chat	V0141011	FLA0017	10	Who is the girl come from Taiwan?	Emma
chat	V0141008	FLA0017	36	Who come from Taiwan?	Alice
chat	V0141003	FLA0017	56	Are Alice single?	--
chat	V0141035	FLA0017	60	Isn't he 18?	Yes
chat	V0141002	FLA0017	59	Doesn't Alice come from Paris?	Yes
chat	V0141018	FLA0017	62	Does Ellarose understand?	No
chat	V0141009	FLA0017	38	Doesn't Ellarose greet Ariel?	Yes
chat	V0141003	FLA0017	57	Is Alice single?	--
chat	V0141023	FLA0017	23	Isn't Ariel a man?	--
chat	V0141025	FLA0017	60	Isn't Mandy a stranger?	--
chat	V0141018	FLA0017	63	Does Alice understand?	No
chat	V0141002	FLA0017	60	Doesn't Ariel come from Paris?	Yes
chat	V0141035	FLA0017	61	Don't they like Facebook?	No
chat	V0141023	FLA0017	24	Isn't Facebook a man?	--
chat	V0141025	FLA0017	61	Is Alice a girl?\t	--
chat	V0141018	FLA0017	67	Does Mandy understand?	No
chat	V0141028	FLA0017	36	Is Alice a good girl ?	--
chat	V0141025	FLA0017	63	Is Alice young ?	--
chat	V0141028	FLA0017	39	Isn't Ariel a good girl?	--
chat	V0141025	FLA0017	65		--
chat	V0141028	FLA0017	40	Is Ellarose a good girl ?	--
chat	V0141008	FLA0017	41	Isn't Mandy understand?	--
chat	V0141008	FLA0017	42	Isn't Mandy understands?	--
chat	V0141023	FLA0017	30	Isn't USA a city?	--
chat	V0141025	FLA0017	67	Isn't mandy a stranger?	--
chat	V0141018	FLA0017	72	Is Taiwan a city?	No
chat	V0141028	FLA0017	42	Is Filibee a good girl ?	--
chat	V0141008	FLA0017	43	Isn't Mandy great?	--
chat	V0141025	FLA0017	69		--
chat	V0141023	FLA0017	31	Isn't NY a city?	--
chat	V0141035	FLA0017	67	Isn't Mandy a sophomore?	Yes
chat	V0141008	FLA0017	44	Isn't Mandy a stranger/	--
chat	V0141018	FLA0017	73	Is Does a city?	No
chat	V0141008	FLA0017	45	Isn't Mandy a stranger?	--
chat	V0141002	FLA0017	68	Doesn't Mandy come from NY?	Yes
chat	V0141028	FLA0017	44	Is Junior a good girl ?	--
chat	V0141008	FLA0017	46	Isn't Mandy a freshmen?	--
chat	V0141011	FLA0017	13	Who is the old woman?	Emma
chat	V0141025	FLA0017	70	Who is most beautiful	--
chat	V0141028	FLA0017	45	Isn't Junior a good girl ?	--
chat	V0141029	FLA0017	35	Isn't he a sophomore?	No
chat	V0141008	FLA0017	47	Isn't Mandy a student?	--
chat	V0141023	FLA0017	33	Isn't Paris a city	--
chat	V0141025	FLA0017	71	Who says Ariel is beautiful?	--
chat	V0141028	FLA0017	47	Isn't Mandy a good girl ?	--
chat	V0141023	FLA0017	34	Is Paris a city	--
chat	V0141008	FLA0017	48	Isn't Mandy old?	--
chat	V0141023	FLA0017	35	Is USA a city	--
chat	V0141028	FLA0017	48	Is Sabrina a good girl ?	--
chat	V0141018	FLA0017	78	Is Alice a city?	No
chat	V0141028	FLA0017	35	Is Alice from Taiwan ?	--
chat	V0041055	FLA0017	35	Does Alice come from USA?	Yes
chat	V0141018	FLA0017	64	Does Ariel understand?	--
chat	V0141023	FLA0017	25	Isn't Junior a man?	--
chat	V0141021	FLA0017	18	Is Filibee a man?	--
chat	V0141018	FLA0017	65		\N
chat	V0141035	FLA0017	62	Isn't Junior old ?	No
chat	V0141002	FLA0017	61	Isn't Alice a freshman?	Yes
chat	V0141023	FLA0017	26	Isn't Mandy a man?	--
chat	V0141009	FLA0017	39	Doesn't Ariel greet Alice?	Yes
chat	V0141021	FLA0017	19	Isn't Filibee a man?	--
chat	V0141009	FLA0017	40	Doesn't Ariel greet Ellarose?	Yes
chat	V0141028	FLA0017	37	Isn't Alice a good girl ?	--
chat	V0141028	FLA0017	38	Is Ariel a good girl ?	--
chat	V0141002	FLA0017	62	Doesn't Alice come from Taiwna?	Yes
chat	V0141018	FLA0017	70	Is Alice a student?	No
chat	V0141023	FLA0017	29	Isn't USA a man?	--
chat	V0141002	FLA0017	67	Doesn't Mandy come from Paris?	Yes
chat	V0141025	FLA0017	66	Isn't Alice a stranger?	--
chat	V0141021	FLA0017	21	Does Mandy understand?	--
chat	V0141025	FLA0017	68	Isn't Mandy a stranger?	--
chat	V0141018	FLA0017	74	Is Facebook a city?	No
chat	V0141009	FLA0017	41	Isn't Alice young?	Yes
chat	V0141028	FLA0017	46	Is Mandy a good girl ?	--
chat	V0141018	FLA0017	76	Is Filibee a city?	No
chat	V0141018	FLA0017	79	Is Ellarose a city?	No
chat	V0141029	FLA0017	34	Is he a sophomore?	Yes
chat	V0041055	FLA0017	39	Do she have facebook?	Yes
chat	V0141018	FLA0017	75	Is Facebook a student?	No
chat	V0041055	FLA0017	40	Don't she have facebook?	Yes
chat	V0041055	FLA0017	41	Don't Ellarose have facebook?	Yes
chat	V0141035	FLA0017	69	Isn't Ellarose a good girl ?	Yes
chat	V0141018	FLA0017	77	Is Mandy a city?	No
chat	V0141001	FLA0017	7	who is 18	Ariel
chat	V0141035	FLA0017	70	Isn't Ariel a sophomore?	Yes
chat	V0141029	FLA0017	36	Isn't Ariel a sophomore?	Yes
chat	V0141025	FLA0017	72	Who says Mandy is beautiful?	--
chat	V0141021	FLA0017	22	Doesn't Alice come from Paris? \t	--
chat	V0141009	FLA0017	42	Doesn't Ariel greet Ellarose?	--
chat	V0141011	FLA0017	14	Who is the guess?	Abby
chat	V0141028	FLA0017	49	Isn't Sabrina a good girl ?	--
chat	V0041055	FLA0017	42	what does Alice say?	Yes
chat	V0141023	FLA0017	36	Isn't Mandy a good man?	--
chat	V0141029	FLA0017	37	Is Ariel a woman?	No
chat	V0041055	FLA0017	43	Does Alice say?	Yes
chat	V0141009	FLA0017	43	Isn't Ariel a sophomore?	Yes
chat	V0141023	FLA0017	37	Isn't Alice a good man?	--
chat	V0141029	FLA0017	38	Is Taiwan big?	No
chat	V0041055	FLA0017	44	Does Alice understand?	Yes
chat	V0141023	FLA0017	38	Isn't Ariel a good man?	--
chat	V0141021	FLA0017	23	Isn't Mandy young? 	--
chat	V0141023	FLA0017	39	Isn't Ellarose a good man?	--
chat	V0141001	FLA0017	8	who is the old man?	Johnny
chat	V0041055	FLA0017	45	Does Ariel understand?	Yes
chat	V0141029	FLA0017	39	Is Taiwan good?	Yes
chat	V0141008	FLA0017	49	Isn't Mandy a girl?	--
chat	V0141023	FLA0017	40	Isn't Filibee a good man?	--
chat	V0041055	FLA0017	46	Does Ellarose understand?	Yes
chat	V0141009	FLA0017	44	Doesn't Sabrina come from NY?	Yes
chat	V0141008	FLA0017	50	Isn't Mandy a mam?	--
chat	V0141025	FLA0017	73	Doesn't Ariel have Facebook?	--
chat	V0141023	FLA0017	41	Isn't Junior a good man?	--
chat	V0141008	FLA0017	51	Isn't Mandy a man?	--
chat	V0141009	FLA0017	45	Doesn't Sabrina come from Turkey?	Yes
chat	V0141029	FLA0017	40	Isn't Alice a good girl?	Yes
chat	V0141018	FLA0017	80	Is Turkey good?	Yes
chat	V0141023	FLA0017	42	Is Mandy a good man?	--
chat	V0141009	FLA0017	46	Doesn't Sabrina come from Paris?	Yes
chat	V0141001	FLA0017	9	who is 17?	Annie
chat	V0141021	FLA0017	24	Isn't Madison a bad man? 	--
chat	V0141025	FLA0017	74	Isn't Ellarose a city?	--
chat	V0041055	FLA0017	47	Does Alice a student?	No
chat	V0141009	FLA0017	47	Doesn't Sabrina come from Taiwan?	Yes
chat	V0041055	FLA0017	48	Does Alice is a student?	No
chat	V0141001	FLA0017	10	who is 16?	Dora
chat	V0141029	FLA0017	41	Isn't Mandy a old woman?	Yes
chat	V0141008	FLA0017	52	Isn't Mandy greet?	--
chat	V0041055	FLA0017	49	Is Alice a student?	No
chat	V0141011	FLA0017	15	Who is 17?	Cindy
chat	V0141001	FLA0017	11	Who is 15?	Cindy
chat	V0141023	FLA0017	43	Isn't Junior an old man?	--
chat	V0141018	FLA0017	81	Is Turkey good?	Yes
chat	V0141008	FLA0017	53	Isn't Mandy right?	--
chat	V0141025	FLA0017	75	Isn't Alice from Taiwan?	--
chat	V0141003	FLA0017	58		\N
chat	V0141021	FLA0017	25	Does Sabrina come from Turkey?	--
chat	V0041055	FLA0017	50	Is Ariel a student?	No
chat	V0141029	FLA0017	42	Isn't  Mandy a Junior?	Yes
chat	V0141009	FLA0017	48	Isn't Filibee from Taiwan?	Yes
chat	V0141018	FLA0017	82	Is USA good?	Yes
chat	V0141029	FLA0017	43	Isn't  Mandy a girl?	Yes
chat	V0141009	FLA0017	49	Isn't Filibee from NY?	Yes
chat	V0141003	FLA0017	59	Is Alice single?	--
chat	V0141018	FLA0017	83	Is Paris good?	Yes
chat	V0141025	FLA0017	76	Isn't Sabrina female	--
chat	V0141021	FLA0017	26	Doesn't Alice come from Turkey?	--
chat	V0141009	FLA0017	50	Isn't Filibee from Paris?	Yes
chat	V0141011	FLA0017	16	Who is young?	Eason
chat	V0141003	FLA0017	60	Is Junior 15 ?	--
chat	V0041055	FLA0017	51	Does Alice like city?	Yes
chat	V0141008	FLA0017	54	Isn't Mandy female?	--
chat	V0041055	FLA0017	52	Do Alice like city?	No
chat	V0041055	FLA0017	53	Do Alice like city?	Yes
chat	V0141001	FLA0017	12	Who is the stranger?	Ariel
chat	V0141018	FLA0017	84	Is Alice a good student?	No
chat	V0141025	FLA0017	77	Isn't Mandy female?	--
chat	V0141023	FLA0017	44	Is Mandy a sophomore?	--
chat	V0141021	FLA0017	27	Does Alice come from Turkey?	--
chat	V0141003	FLA0017	61	Does Alice get married?	--
chat	V0141008	FLA0017	55	Isn't Alice female?	--
chat	V0141029	FLA0017	44	Is Ariel old?	No
chat	V0141011	FLA0017	17	Isn't Sabrina old?	Yes
chat	V0041055	FLA0017	54	Do you like USA?	Yes
chat	V0141003	FLA0017	62	Does Alice come from Taiwan?	--
chat	V0141025	FLA0017	78	Isn't Mandy a stranger?	--
chat	V0141018	FLA0017	85	Is Alice a woman?	Yes
chat	V0141011	FLA0017	18	Isn't Sabrina old	No
chat	V0141008	FLA0017	56	Isn't Ariel female?	--
chat	V0141009	FLA0017	51	Isn't Ellarose from Taiwan?	Yes
chat	V0141023	FLA0017	45	Is Ariel a beautiful girl?	--
chat	V0141018	FLA0017	86	Is Alice a freshman?	No
chat	V0041055	FLA0017	55	Does Alice right?	Yes
chat	V0141021	FLA0017	28	Doesn't Ellarose come from Turkey?	--
chat	V0141003	FLA0017	63	Is Alice a woman?	--
chat	V0141009	FLA0017	52	Isn't Ellarose from NY?	Yes
chat	V0141009	FLA0017	54	Isn't Ellarose from Turkey?	No
chat	V0141025	FLA0017	81	Is Sabrina 20 ?\t	--
chat	V0141023	FLA0017	47	Is Ellarose a beautiful girl?	--
chat	V0141011	FLA0017	19	Is she understand?	Yes
chat	V0041055	FLA0017	57	Is Ariel right?	No
chat	V0141029	FLA0017	46	Isn't Alice a good student?	No
chat	V0141001	FLA0017	15	Isn't Sabrina beautiful?	Yes
chat	V0141003	FLA0017	65	Is Sabrina a beautiful woman?	--
chat	V0141008	FLA0017	59	Isn't Alice old?	--
chat	V0141023	FLA0017	48	Is Filibee a beautiful girl?	--
chat	V0141025	FLA0017	83	Is Sabrina 21?	--
chat	V0141018	FLA0017	87	Is Alice a old student?	No
chat	V0141025	FLA0017	84	Is Sabrina 21?	--
chat	V0141011	FLA0017	20	Does she understand?	No
chat	V0141008	FLA0017	60	Isn't Alice a stranger?	--
chat	V0141009	FLA0017	56	Isn't Ellarose from Taiwan?	No
chat	V0041055	FLA0017	60	Does Alice greet?	No
chat	V0141003	FLA0017	69	Does Alice get up early?	--
chat	V0141018	FLA0017	89	Is Mandy a good student?	No
chat	V0141011	FLA0017	23	Does Emma understand	Yes
chat	V0141003	FLA0017	70	Is Alice is the oldest woman than the other one?	--
chat	V0141003	FLA0017	71	Is Alice is the oldest woman than the other one?	--
chat	V0141029	FLA0017	50	Isn't Ariel a good woman?	Yes
chat	V0141025	FLA0017	92	Who says Mandy is beautiful?	--
chat	V0141011	FLA0017	24	Does Alice understand	No
chat	V0141003	FLA0017	73	does Alice feel she is beautiful?	--
chat	V0141029	FLA0017	52	Is Alice a old woman?	Yes
chat	V0141003	FLA0017	75	Does Alice feel that she is beautiful?	--
chat	V0141001	FLA0017	19	Is NY a beautiful city?	--
chat	V0141001	FLA0017	21	Is Alice a good man?	Yes
chat	V0141025	FLA0017	97	Isn't Ariel a girl?	Alice
chat	V0141008	FLA0017	61	Doesn't Mandy come from NY?	--
chat	V0141011	FLA0017	28	Isn't Alice a good man?	No
chat	V0141029	FLA0017	57	Isn't she a old woman?	Yes
chat	V0041055	FLA0017	65	Does Alice have Facebook?	Yes
chat	V0141011	FLA0017	30	Does Alice like facebook?	Yes
chat	V0141003	FLA0017	79	Is Facebook old?	--
chat	V0141008	FLA0017	64	Does Mandy come from NY?	--
chat	V0141001	FLA0017	25	Does she ask the question?	Yes
chat	V0141003	FLA0017	81	Is Paris young?	--
chat	V0141011	FLA0017	32	Isn't Facebook female	No
chat	V0041055	FLA0017	68	Does Alice young?	No
chat	V0141011	FLA0017	34	Isn't Taiwan female	Yes
chat	V0141003	FLA0017	87	Is Mandy old?	--
chat	V0141029	FLA0017	63	Is Madison a good man?	Yes
chat	V0141029	FLA0017	64	Is Madison a man?	Yes
chat	V0041055	FLA0017	70	doesn't Alice a man?	No
chat	V0141029	FLA0017	66	Don't they Junior?	Yes
chat	V0141029	FLA0017	67	Is Mandy a freshman?	Yes
chat	V0141021	FLA0017	36	Is Filibee a young man? 	--
chat	V0141025	FLA0017	116	Isn't Mandy from USA ?	--
chat	V0141011	FLA0017	41	Is Facebook a freshman?	Yes
chat	V0141008	FLA0017	70	Isn't Alice female?	--
chat	V0041055	FLA0017	74	Does she have question?	Yes
chat	V0041055	FLA0017	75	Does she say the question?	--
chat	V0141025	FLA0017	117	Isn't Mandy from right?	--
chat	V0141011	FLA0017	45	Is Madison a freshman?	No
chat	V0141025	FLA0017	118	Isn't Mandy  right?	--
chat	V0141029	FLA0017	70	Is she a good student?	Yes
chat	V0141008	FLA0017	71	Is Mandy a good girl ?	--
chat	V0141021	FLA0017	37	Isn't Filibee a young man? 	--
chat	V0141025	FLA0017	119	Is Mandy right?	--
chat	V0141002	FLA0017	72	Does Alice ask to Ariel?	No
chat	V0141029	FLA0017	73	Isn't Paris a city?	No
chat	V0141012	FLA0017	53		\N
chat	V0141016	FLA0017	39	Isn't she old?	--
chat	V0141025	FLA0017	122	Isn't she female?	--
chat	V0141002	FLA0017	74	Does Alice ask Ariel's age?	Yes
chat	V0141018	FLA0017	95	Who is woman?	Abby
chat	V0141008	FLA0017	74	Who do you like?	--
chat	V0141012	FLA0017	62		\N
chat	V0141011	FLA0017	51	Doesn't Junior come from Turkey?	No
chat	V0141029	FLA0017	75	'Is Sabrina a good student?	No
chat	V0141008	FLA0017	76	Who says Alice is beautiful?	Emma
chat	V0041055	FLA0017	79	Does Alice come from Sabrina?	No
chat	V0141002	FLA0017	77	Does Alice talk Mandy?	--
chat	V0141029	FLA0017	76	'Isn't he a good student?	No
chat	V0141025	FLA0017	127	Doesn't Alice young?	--
chat	V0141008	FLA0017	78	Doesn't she come from Paris?\t	--
chat	V0141011	FLA0017	54	Doesn't Mandy come from Turkey?	Yes
chat	V0141029	FLA0017	45	Isn't Ariel a student?	No
chat	V0041055	FLA0017	56	Is Alice right?	Yes
chat	V0141025	FLA0017	79	Is Sabrina 16 ?\t	--
chat	V0141003	FLA0017	64	Is Sabrina a beautiful female?	--
chat	V0141008	FLA0017	58	Isn't Alice beautiful?	--
chat	V0041055	FLA0017	58	Is she greet?	Yes
chat	V0141025	FLA0017	89	Is Filibee 16 ?	--
chat	V0141023	FLA0017	51	Is Sabrina a beautiful girl?	--
chat	V0141003	FLA0017	66	does Alice studt hard?	--
chat	V0041055	FLA0017	59	Is Alice greet?	Yes
chat	V0141011	FLA0017	21	Does he understand?	Yes
chat	V0141029	FLA0017	48	Is Mandy  a good student?	Yes
chat	V0141003	FLA0017	68	Does Alice study hard?	--
chat	V0141009	FLA0017	57	Isn't Sabrina from Taiwan?	Yes
chat	V0141001	FLA0017	17	Isn't Mandy a sophomore?	Yes
chat	V0141021	FLA0017	30	Does Alice understand? 	--
chat	V0141003	FLA0017	72	Is Alice is the oldest woman than the other people?	--
chat	V0141001	FLA0017	18	Is Paris a beautiful city?	Yes
chat	V0141011	FLA0017	25	Does Ariel understand	No
chat	V0141021	FLA0017	31	Isn't Madison from Turkey? 	--
chat	V0141029	FLA0017	53	Is Ellarose a good man?	Yes
chat	V0141011	FLA0017	26	Isn't Sabrina a beautiful woman?	Yes
chat	V0041055	FLA0017	63	Does Alice live in Turkey?	Yes
chat	V0141011	FLA0017	27	Isn't Ariel a beautiful girl?	Yes
chat	V0141001	FLA0017	23	Is Junior young?	Yes
chat	V0141003	FLA0017	77	Is Filibee 15 ?	--
chat	V0141025	FLA0017	98	Isn't Filibee a girl?	--
chat	V0141029	FLA0017	56	Is he a old man?	No
chat	V0141025	FLA0017	99	Isn't Filibee a man?	--
chat	V0041055	FLA0017	64	Does Alice like Facebook?	Yes
chat	V0141008	FLA0017	63	Isn't Mandy from NY?	--
chat	V0041055	FLA0017	66	Does she have Facebook	Yes
chat	V0141025	FLA0017	101	Who is cute?	--
chat	V0141029	FLA0017	58	Isn't she a good woman?	Yes
chat	V0141001	FLA0017	24	Doesn't she ask the question?	No
chat	V0141029	FLA0017	59	Is she a young gril?	Yes
chat	V0141008	FLA0017	65	Does Mandy come from USA?	--
chat	V0141003	FLA0017	80	Is Paris old?	--
chat	V0141011	FLA0017	31	Does Alice like a freshman?	No
chat	V0141025	FLA0017	103	Is Mandy right?	--
chat	V0141008	FLA0017	66	Does Mandy come from Turkey?	--
chat	V0141029	FLA0017	60	Is she young ?	Yes
chat	V0141003	FLA0017	82	Isn't Paris young?	--
chat	V0141025	FLA0017	104	Isn't Mandy right?	--
chat	V0141029	FLA0017	61	Is Mandy a good woman?	No
chat	V0141003	FLA0017	84	Who isn't female?	--
chat	V0141029	FLA0017	62	Is Mandy a sophomore?	Yes
chat	V0141001	FLA0017	26	Does Alice ask the question?	Yes
chat	V0141003	FLA0017	85	Does Ariel come from Taiwan?	--
chat	V0141025	FLA0017	105	Is Mandy from Taiwan?	--
chat	V0141011	FLA0017	33	Isn't NY female	Yes
chat	V0141025	FLA0017	106	Isn't Mandy 14 ?	--
chat	V0141003	FLA0017	86	Is mandy old?	--
chat	V0141025	FLA0017	107	Isn't Mandy from taiwan?	--
chat	V0141011	FLA0017	35	Isn't Filibee female	Yes
chat	V0141008	FLA0017	68	Doesn't Alice have Facebook?	--
chat	V0141001	FLA0017	28	Is Sabrina female?	Yes
chat	V0141025	FLA0017	108	Isn't Mandy fromTaiwan?	--
chat	V0141003	FLA0017	88	Is Facebook young?	--
chat	V0141025	FLA0017	109	Isn't Mandy fromTaiwan?	--
chat	V0141029	FLA0017	65	Is he a young man?	Yes
chat	V0141011	FLA0017	37	Isn't Ellarose female	No
chat	V0141003	FLA0017	90	Isn't Facebook old?	--
chat	V0141001	FLA0017	29	Does Sabrina come from Taiwan?	No
chat	V0141025	FLA0017	111	Isn't Mandy  from Taiwan?	--
chat	V0141021	FLA0017	35		\N
chat	V0141011	FLA0017	38	Isn't Junior female	Yes
chat	V0141008	FLA0017	69	Doesn't Ariel have Facebook?	--
chat	V0141003	FLA0017	91	Is Facebook lod?	--
chat	V0141025	FLA0017	112	Isn't Mandy from Paris?	--
chat	V0141003	FLA0017	92	Is Facebook old?	--
chat	V0141025	FLA0017	113	Isn't Mandy from Turkey?	--
chat	V0141003	FLA0017	93	Does Mandy speak English?	--
chat	V0141025	FLA0017	115	Isn't Mandy from USA?	--
chat	V0141029	FLA0017	69	Isn't Alice a good student?	Yes
chat	V0141001	FLA0017	34	Does Mandy come from Taiwan?	No
chat	V0141003	FLA0017	96	isn't facebook a female?	--
chat	V0041055	FLA0017	76	Is she say the question?	Yes
chat	V0141008	FLA0017	72	Is Mandy a good girl ?	Emma
chat	V0141002	FLA0017	70	Isn't Alice a good student?	No
chat	V0141001	FLA0017	36	Does Ellarose come from Taiwan?	No
chat	V0141029	FLA0017	72	Isn't he a sophomore?	Yes
chat	V0141011	FLA0017	49	Isn't Filibee a freshman?	No
chat	V0141012	FLA0017	51		\N
chat	V0141025	FLA0017	120	Isn't FILIBEE from USA ?	--
chat	V0141025	FLA0017	121	Isn't Filibee from USA ?	--
chat	V0141018	FLA0017	93		\N
chat	V0141002	FLA0017	71	Does Alice ask Ariel?	--
chat	V0141012	FLA0017	52		\N
chat	V0141018	FLA0017	94		\N
chat	V0141008	FLA0017	73	Doesn't Mandy understand?	--
chat	V0141012	FLA0017	54	Is Junior a male ?	Yes
chat	V0141016	FLA0017	40	Isn't she a good student?	--
chat	V0141002	FLA0017	73	Does Alice ask Ariel	--
chat	V0141012	FLA0017	55		\N
chat	V0141001	FLA0017	37	Does Ariel ask the question?	Yes
chat	V0141025	FLA0017	123	Isn't he female?	--
chat	V0141018	FLA0017	98	Who is woman?	Ariel
chat	V0141012	FLA0017	58	Isn't Junior a male ?	--
chat	V0141009	FLA0017	53	Isn't Ellarose from Paris?	Yes
chat	V0141008	FLA0017	57	Isn't Alice right?	--
chat	V0141001	FLA0017	13		\N
chat	V0141023	FLA0017	46	Is Alice a beautiful girl?	--
chat	V0141001	FLA0017	14		\N
chat	V0141025	FLA0017	80	Is Sabrina 18 ?\t	--
chat	V0141025	FLA0017	82	Is Sabrina 21 ?\t	--
chat	V0141009	FLA0017	55	Isn't Ellarose from Paris?	No
chat	V0141025	FLA0017	85	Is Sabrina 21?	--
chat	V0141025	FLA0017	86	Is Sabrina 21?	--
chat	V0141023	FLA0017	49	Is Junior a beautiful girl?	--
chat	V0141025	FLA0017	87	Is Sabrina 19?	--
chat	V0141023	FLA0017	50	Is Mandy a beautiful girl?	--
chat	V0141029	FLA0017	47	Is he a good student?	Yes
chat	V0141025	FLA0017	88	Is Filibee 16 ?	--
chat	V0141025	FLA0017	90	Is Filibee 16 ?	--
chat	V0141021	FLA0017	29	Isn't Alice from Paris? 	--
chat	V0141003	FLA0017	67	does Alice study hard?	--
chat	V0141001	FLA0017	16	Isn't Mandy a sophomore?	No
chat	V0041055	FLA0017	61	Does Alice say?	--
chat	V0141018	FLA0017	88	Is Alice a good student?	No
chat	V0141029	FLA0017	49	Is Mandy a good woman?	Yes
chat	V0041055	FLA0017	62	Does Alice have say?	No
chat	V0141011	FLA0017	22	Do you understand	Yes
chat	V0141025	FLA0017	91	Isn't Ariel a junior?	--
chat	V0141029	FLA0017	51	Isn't she a old woman?	No
chat	V0141003	FLA0017	74	Does Alice feel she is beautiful?	--
chat	V0141025	FLA0017	93	Isn't Taiwan a city?	--
chat	V0141001	FLA0017	20	Is NY a beautiful city?	Yes
chat	V0141025	FLA0017	94	Is Ariel a girl?	--
chat	V0141025	FLA0017	95	Isn't Ariel a girl?	--
chat	V0141021	FLA0017	32	Isn't Alice a old woman? 	--
chat	V0141003	FLA0017	76	Is Sabrina young?	--
chat	V0141029	FLA0017	54	Isn't Ellarose a old man?	No
chat	V0141025	FLA0017	96	Isn't Ariel a girl?	--
chat	V0141001	FLA0017	22	Isn't Ellarose young?	No
chat	V0141029	FLA0017	55	Isn't Ellarose a good student?	No
chat	V0141008	FLA0017	62	Doesn't Alice come from NY?	--
chat	V0141003	FLA0017	78	Is Facebook a good man?	--
chat	V0141011	FLA0017	29	Does Ariel come from NY?	Yes
chat	V0141025	FLA0017	100	Who is bad?	--
chat	V0141018	FLA0017	90	Is Mandy a good student?	No
chat	V0141025	FLA0017	102	Who is beautiful?	--
chat	V0141021	FLA0017	33	Isn't Alice a old woman? 	--
chat	V0041055	FLA0017	67	isn't she have Facebook?	Yes
chat	V0141003	FLA0017	83	Isn't Paris old?	--
chat	V0141008	FLA0017	67	Does Mandy come from Paris?	--
chat	V0041055	FLA0017	69	Is Alice young?	Yes
chat	V0141001	FLA0017	27	Is Sabrina a female?	Yes
chat	V0141011	FLA0017	36	Isn't Ariel female	No
chat	V0141003	FLA0017	89	Isn't Facebook young?	--
chat	V0141025	FLA0017	110	Isn't Mandy 6 from Taiwan?	--
chat	V0141021	FLA0017	34		\N
chat	V0141011	FLA0017	39	Isn't Madison female	No
chat	V0141001	FLA0017	30	Does Sabrina come from Taiwan?	--
chat	V0041055	FLA0017	71	isn't Alice a man?	No
chat	V0141011	FLA0017	40	Isn't Mandy female	Yes
chat	V0141025	FLA0017	114	Is Mandy from Taiwan?	--
chat	V0141001	FLA0017	31	Does Alice come from Taiwan?	No
chat	V0141001	FLA0017	32	Does come Ellarose from Taiwan?	No
chat	V0141003	FLA0017	94	Does Mandy a male?	--
chat	V0041055	FLA0017	72	Does Alice have question?	Yes
chat	V0141029	FLA0017	68	Isn't Alice  a freshman?	Yes
chat	V0141003	FLA0017	95	Is Mandy a male?	--
chat	V0141011	FLA0017	42	Is Ellarose a freshman?	No
chat	V0141001	FLA0017	33	Does Ellarose come from Taiwan?	No
chat	V0141035	FLA0017	71	Isn't Ariel a sophomore?	Yes
chat	V0041055	FLA0017	73	Does she have question?	--
chat	V0141011	FLA0017	43	Is Filibee a freshman?	No
chat	V0141002	FLA0017	69	Isn't Alice a stranger?	Yes
chat	V0141018	FLA0017	91	Is Mandy a city?	No
chat	V0141003	FLA0017	97	Isn't facebook a female?	--
chat	V0141011	FLA0017	44	Is Junior a freshman?	No
chat	V0141001	FLA0017	35	Does Madison come from Taiwan?	Yes
chat	V0141011	FLA0017	46	Isn't Madison a freshman?	No
chat	V0141018	FLA0017	92	Is Alice a right student?	No
chat	V0141011	FLA0017	47	Isn't Facebook a freshman?	Yes
chat	V0141029	FLA0017	71	Is she a sophomore?	Yes
chat	V0141011	FLA0017	48	Is Ellarose a freshman?	Yes
chat	V0141016	FLA0017	37		\N
chat	V0141012	FLA0017	49		\N
chat	V0141012	FLA0017	50		\N
chat	V0141016	FLA0017	38	Isn't Junior young ?	--
chat	V0141021	FLA0017	38	Isn't Junior a young man? 	--
chat	V0141018	FLA0017	96	Who is woman?	Alice
chat	V0141002	FLA0017	75	Does Alice ask the age?	--
chat	V0141012	FLA0017	56	Isn't Junior a male ?	Yes
chat	V0141012	FLA0017	57	Isn't Junior a male ?	--
chat	V0141018	FLA0017	97	Who is woman?	Annie
chat	V0141025	FLA0017	124	Is she female	--
chat	V0141018	FLA0017	99	Who is woman?	Cathy
chat	V0141011	FLA0017	50	Doesn't Facebook come from Turkey?	Yes
chat	V0041055	FLA0017	77	Do you come from Paris?	No
chat	V0141012	FLA0017	59		\N
chat	V0141029	FLA0017	74	Is Sabrina old?	Yes
chat	V0141025	FLA0017	126	Is he female?	--
chat	V0141012	FLA0017	60		\N
chat	V0141021	FLA0017	39	Is Junior a young man? 	--
chat	V0141018	FLA0017	100	Who is female?	Abby
chat	V0141012	FLA0017	61		\N
chat	B03200050	1J0	5		\N
chat	V0141025	FLA0017	125	Isn't she female?	--
chat	V0041055	FLA0017	78	Does she come from Sabrina?	No
chat	V0141001	FLA0017	38	Does Facebook ask the question?	No
chat	V0141011	FLA0017	52	Doesn't Filibee come from Turkey?	Yes
chat	V0141012	FLA0017	63		\N
chat	V0141012	FLA0017	64	Does Alice 15 ?	--
chat	V0141011	FLA0017	53	Doesn't Madison come from Turkey?	No
chat	V0141012	FLA0017	65	Does Alice  is 15 ?	--
chat	V0141008	FLA0017	79	Doesn't he come fromTurkey?\t	--
chat	V0141025	FLA0017	128	Does Filibee young?	--
chat	V0141008	FLA0017	75	Who says Alice is old?	--
chat	V0141002	FLA0017	76	Does Alice talk to Mandy?	--
chat	V0141008	FLA0017	77	Doesn't he come from NY?\t	--
chat	V0141001	FLA0017	39	Is Turkey a good nationality?	Yes
chat	V0141029	FLA0017	77	'Isn't Mandy beautiful?	Yes
chat	V0141016	FLA0017	41	Isn't she a good student?	--
chat	V0141025	FLA0017	129	Does Mandy young?	--
chat	V0141011	FLA0017	55	Is Facebook a sophomore?	No
chat	V0141021	FLA0017	40		\N
chat	V0141008	FLA0017	80	Does Alice understand?	--
chat	V0141029	FLA0017	78	'Is Mandy a freshman?	No
chat	V0141008	FLA0017	81	Doesn't Ariel understand?	--
chat	V0141029	FLA0017	79	Is Mandy a freshman?	Yes
chat	V0141011	FLA0017	56	Isn't Facebook young ?	Yes
chat	V0141001	FLA0017	40	Does Alice live in Turkey?	Yes
chat	V0141025	FLA0017	130	Where is Taiwan?	--
chat	V0141025	FLA0017	131	Where is Taiwan?	--
chat	V0141025	FLA0017	132	Where is Taiwan?	--
chat	V0141025	FLA0017	133	Where is Taiwan?	--
chat	V0141011	FLA0017	57	Is Facebook young ?	Yes
chat	V0141021	FLA0017	41	Who isn't old? 	--
chat	V0141001	FLA0017	41	Doesn't Alice live in paris?	Yes
chat	V0141029	FLA0017	80	Isn't she a student?	Yes
chat	V0141025	FLA0017	134	Does here is Taiwan?	--
chat	V0041055	FLA0017	80	Is Alice student?	--
chat	V0041055	FLA0017	81	Is Alice a student?	--
chat	V0141008	FLA0017	82	Who says Alice is young?	--
chat	V0141011	FLA0017	58	Is Facebook 15 ?	No
chat	V0141002	FLA0017	78	Doesn't Alice talk Madison?	--
chat	V0141002	FLA0017	79	Doesn't Alice ask Madison?	--
chat	V0141029	FLA0017	81	Is Ellarose old?	Yes
chat	V0141002	FLA0017	80	Does Alice ask Madison?	--
chat	V0141002	FLA0017	81	Does Alice talk Madison?	--
chat	V0141025	FLA0017	135	Who is girl?	--
chat	V0141025	FLA0017	136	Who is girl?	Abby
chat	V0141008	FLA0017	83	How old is Alice?	--
chat	V0141025	FLA0017	137	Who is girl?	Alice
chat	V0141021	FLA0017	42	Who says Ariel is old?	--
chat	V0141025	FLA0017	138	Who is girl?	Cathy
chat	V0141025	FLA0017	139	Who is girl?	Cindy
chat	V0141025	FLA0017	140	Who is woman?	--
chat	V0141011	FLA0017	59	Isn't Facebook a young man?	No
chat	V0141025	FLA0017	141	Who is woman?	Annie
chat	V0141001	FLA0017	42	Doesn't Alice live in paris?	Yes
chat	V0141025	FLA0017	142	Who is woman?	Ban
chat	V0141025	FLA0017	143	Who is woman?	Mandy
chat	V0141029	FLA0017	82	Is Ariel a Junior?	Yes
chat	V0041055	FLA0017	82	Who was come from USA?	Yes
chat	V0141008	FLA0017	84	Does Mandy come from the city?	--
chat	V0141001	FLA0017	43	Isn't Facebook 15 ?	No
chat	V0141025	FLA0017	144	Who is student?	--
chat	V0141025	FLA0017	145	Who is student?	Ariel
chat	V0141029	FLA0017	83	Is Ariel a woman?	Yes
chat	V0141025	FLA0017	146	Who is student?	Calina
chat	V0141025	FLA0017	147	Who is student?	Irene
chat	V0141003	FLA0017	98	Is Facebook a student?	--
chat	V0141025	FLA0017	148	Who is student?	Viola1
chat	V0141002	FLA0017	82	Does Alice understand Ariel?	--
chat	V0141029	FLA0017	84	Is she young?	No
chat	V0141025	FLA0017	149	Who is sophomore?	Alice
chat	V0041055	FLA0017	83	Does Alice talk to Ariel?	No
chat	V0141025	FLA0017	150	Who is sophomore?	Connie
chat	V0141025	FLA0017	151	Who is a sophomore?	Alice
chat	V0141008	FLA0017	85	Isn't Mandy a good man?	--
chat	V0141001	FLA0017	44	Is Facebook a young girl?	No
chat	V0141003	FLA0017	99	Is Paris from Taiwan?	--
chat	V0141029	FLA0017	85	Is he right?	Yes
chat	V0141001	FLA0017	45	Is Sabrina a Facebook?	No
chat	V0141025	FLA0017	152	Who is a student?	Andy
chat	V0141025	FLA0017	153	Who is a student?	Cheney
chat	V0141001	FLA0017	46	Is Sabrina Facebook?	No
chat	V0141029	FLA0017	86	Is she right?	Yes
chat	V0141025	FLA0017	154	Who is a student?	Lily
chat	V0141008	FLA0017	86	Isn't Mandy a beautiful girl?	--
chat	V0141029	FLA0017	87	Isn't he right?	Yes
chat	V0141025	FLA0017	155	Who is a old student?	Annie
chat	V0141002	FLA0017	83	Is Alice a sophomore or freshman?	--
chat	V0041055	FLA0017	84	Does she a stranger ?	--
chat	V0141002	FLA0017	84	Alice is a sophomore or freshman?	--
chat	V0141029	FLA0017	88	Isn't Mandy  right?	Yes
chat	V0141003	FLA0017	100	Is Mandy a woman?	Yes
chat	V0141025	FLA0017	156	Who is a beautiful student?	Bella
chat	V0141008	FLA0017	87	Isn't Mandy a young girl?	--
chat	V0141029	FLA0017	89	Isn't she right?	Yes
chat	V0141001	FLA0017	47	Is the man facebook?	No
chat	V0041055	FLA0017	85	Does Ariel a stranger ?	No
chat	V0141002	FLA0017	85	Is Alice a sophomore or a freshman?	--
chat	V0141003	FLA0017	101	Is Facebook a woman?	Yes
chat	V0141025	FLA0017	157	Who is a beautiful student?	Claire
chat	V0041055	FLA0017	86	Does Ariel a stranger ?	Yes
chat	V0141001	FLA0017	48	Isn't the man facebook?	--
chat	V0141001	FLA0017	49	Isn't the man facebook?	--
chat	V0141008	FLA0017	88	'Isn't Mandy a right girl?	--
chat	V0141003	FLA0017	102	Is Ariel a woman?	Yes
chat	V0141025	FLA0017	158	Who is a young student?	Ban
chat	V0141029	FLA0017	90	Isn't she a good woman?	Yes
chat	V0141001	FLA0017	50	Is Facebook a sophomore or a freshman?	Yes
chat	V0141025	FLA0017	159	Who is a old student?	Ariel
chat	V0141011	FLA0017	60	Isn't Facebook a young man?	No
chat	V0141029	FLA0017	91	Isn't he young?	Yes
chat	V0141008	FLA0017	89	Isn't Ellarose a good man?	--
chat	V0141025	FLA0017	161	Who is a right student?	Ariel
chat	V0141003	FLA0017	104	Is Mandy a student?	--
chat	V0141025	FLA0017	162	Who is a right girl?	Ariel
chat	V0141008	FLA0017	90	Isn't Ariel a good man?	--
chat	V0141025	FLA0017	166	Who is a right student?	Andy
chat	V0141003	FLA0017	107	Who is the oldest?	--
chat	V0141008	FLA0017	91	Isn't Ellarose right?	--
chat	V0141001	FLA0017	54	Is Ariel a sophomore or a freshman?	Yes
chat	V0141008	FLA0017	92	Doesn't Mandy greet Alice?	--
chat	V0141003	FLA0017	110	isn't mandy a stranger?	--
chat	V0141025	FLA0017	171	is facebook a stranger or a student?	--
chat	V0141008	FLA0017	96	Doesn't Mandy guess Alice?	--
chat	V0141008	FLA0017	98	Doesn't Alice guess Alice?	--
chat	V0141001	FLA0017	57	Is Facebook old ?	No
chat	V0141021	FLA0017	43	Who says Ariel is old?	--
chat	V0141025	FLA0017	175	is Mandy a stranger or a student?	--
chat	V0141025	FLA0017	176	is Mandy a stranger or a student?	No
chat	V0141003	FLA0017	115	Who is a right woman?	--
chat	V0141008	FLA0017	99	Doesn't Ellarose ask Alice?	--
chat	V0141025	FLA0017	177	is Madison a stranger or a student?	No
chat	V0141021	FLA0017	44	Who isn't a good student? 	--
chat	V0141001	FLA0017	59	Isn't Facebook a right woman?	No
chat	V0041055	FLA0017	91	aren't they come from USA?	Yes
chat	V0141003	FLA0017	117	Who is a right woman?	--
chat	V0141001	FLA0017	60	Isn't Facebook a freshman?	--
chat	V0041055	FLA0017	92	are they come from USA?	Yes
chat	V0141008	FLA0017	102	Doesn't Ellarose say?	--
chat	V0141003	FLA0017	118	Who is a young woman?	--
chat	V0141001	FLA0017	64	Isn't Facebook a sophomore?	Yes
chat	V0141008	FLA0017	108	Is Sabrina a old woman?	--
chat	V0141003	FLA0017	103	Isn't Facebook a woman?	--
chat	V0141025	FLA0017	160	Who is a good student?	Alice
chat	V0141001	FLA0017	52	Is Mandy  a sophomore or a freshman?	Yes
chat	V0141025	FLA0017	165	Who is a right female?	Abby
chat	V0141001	FLA0017	53	Is Ellarose a sophomore or a freshman?	No
chat	V0141003	FLA0017	106	Who isn't a good student?	--
chat	V0041055	FLA0017	88	Is Alice a freshman?	Yes
chat	V0141003	FLA0017	108	Who is the youngest	--
chat	V0141025	FLA0017	167	Who is a right man?	Ban
chat	V0141003	FLA0017	109	Who is the youngest?	--
chat	V0141025	FLA0017	169	is Ariel a stranger or a student?	Yes
chat	V0141008	FLA0017	94	Doesn't Ellarose understand Alice?	--
chat	V0141003	FLA0017	111	Isn't mandy a stranger?	--
chat	V0141001	FLA0017	55	Is Facebook a sophomore or a freshman?	No
chat	V0141008	FLA0017	97	Doesn't Ellarose guess Mandy?	--
chat	V0141003	FLA0017	113	Who isn't a right man?	--
chat	V0141003	FLA0017	114	Who isn't a right woman?	--
chat	V0141003	FLA0017	116	Who is a wrong woman?	--
chat	V0141008	FLA0017	100	Doesn't Ellarose likes Alice?	--
chat	V0141008	FLA0017	101	Doesn't Ellarose like Alice?	--
chat	V0141011	FLA0017	62	Isn't Facebook a young man?	No
chat	V0141003	FLA0017	120	Who isn't a young man?	--
chat	V0141001	FLA0017	63	Isn't Facebook a right stranger?	Yes
chat	V0141008	FLA0017	106	Is Sabrina a young woman?	--
chat	V0141008	FLA0017	107	Is Sabrina a NY woman?	--
chat	V0141011	FLA0017	63	Isn't Facebook a young man?	No
chat	V0141008	FLA0017	109	Is Alice a beautiful woman?	--
chat	V0141008	FLA0017	110	Is Ariel a beautiful woman?	--
chat	V0141018	FLA0017	101		\N
chat	V0141001	FLA0017	51	Is Mandy  a sophomore or a freshman?	Yes
chat	V0141025	FLA0017	163	Who is a right women?	Ariel
chat	V0141003	FLA0017	105	Isn't Mandy a student?	--
chat	V0141025	FLA0017	164	Who is a right female?	Annie
chat	V0041055	FLA0017	87	Is she a freshman?	Yes
chat	V0041055	FLA0017	89	Is Ellarose a freshman?	Yes
chat	V0141025	FLA0017	168	Is Alice a stranger or a student?	Yes
chat	V0141011	FLA0017	61	Isn't Facebook a young man?	No
chat	V0141008	FLA0017	93	Doesn't Ellarose greet Mandy?	--
chat	V0141025	FLA0017	170	is Ellarose a stranger or a student?	--
chat	V0141008	FLA0017	95	Doesn't Ellarose guess Alice?	--
chat	V0041055	FLA0017	90	Is Alice a woman?	--
chat	V0141003	FLA0017	112	Isn't Mandy a stranger?	--
chat	V0141025	FLA0017	172	is Facebook a stranger or a student?	--
chat	V0141025	FLA0017	173	is Filibee a stranger or a student?	--
chat	V0141025	FLA0017	174	is Sabrina a stranger or a student?	--
chat	V0141001	FLA0017	56	Is Facebook old ?	No
chat	V0141001	FLA0017	58	Isn't Facebook a right man?	Yes
chat	V0141025	FLA0017	178	Is Madison a stranger or a girl?	No
chat	V0141008	FLA0017	103	Doesn't Ellarose says?	--
chat	V0141001	FLA0017	61	Isn't Facebook a right name?	Yes
chat	V0141003	FLA0017	119	Who isn't a young woman	--
chat	V0141001	FLA0017	62	Isn't Facebook a right female?	Yes
chat	V0141003	FLA0017	121	Who is a young man?	--
chat	V0141008	FLA0017	104	Is Mandy a beautiful woman?	--
chat	V0141008	FLA0017	105	Is Sabrina a Young woman?	--
chat	V0141018	FLA0017	102		\N
chat	V0141018	FLA0017	103		\N
chat	193001	1J0	6		\N
chat	193001	1J0	7	Does Mandy tell a stranger she is a man?	Yes
chat	193001	1J0	8	Does Mandy tell a stranger that she is a man?	Yes
chat	193001	1J0	9		\N
chat	193001	1J0	10		\N
chat	193001	1J0	11	Who asks a stranger how old he is?	Mandy
chat	193001	1J0	12		\N
chat	193001	1J0	13	Does Ellarose say that she is 16?	Yes
chat	B03200102	1J0	1		\N
chat	B03200097	1J0	1		\N
chat	B03200097	1J0	2		\N
chat	B03200097	1J0	3	 Does Mandy say Hello?	Yes
chat	B03200102	1J0	2		\N
chat	B03200102	1J0	3	Does Ariel say that she is 16?	Yes
chat	B03200102	1J0	4	Does Ellarose tell Alice she is from Taiwan?	--
chat	B03200102	1J0	5	Does Ellarose tell Alice is from Taiwan?	--
chat	B03200102	1J0	6		\N
chat	B03200102	1J0	7		\N
chat	B03200102	1J0	8		\N
chat	B03200102	1J0	9	Does Filibee is from Turkey?	--
chat	B03200102	1J0	10	Does Mandy say that she is a beautiful girl	Mandy
chat	B03200046	1J0	1		\N
chat	B03200046	1J0	2		\N
chat	B03200046	1J0	3	Who is she talk to?	Ariel
chat	B03200046	1J0	4	Who come from Taiwan?	Ariel
chat	B03200046	1J0	5		\N
chat	B03200046	1J0	6		\N
chat	B03200046	1J0	7	Does she come from Taiwan?	Yes
chat	B03200046	1J0	8	Don't she come fromTaiwan?	--
chat	B03200046	1J0	9	Doesn't she come from Taiwan?	Yes
chat	B03200046	1J0	10	Doesn't she come from Taiwan?	Yes
chat	B03200102	1J0	11	Who said she come from Taiwan ?	--
chat	B03200102	1J0	12		\N
chat	B03200046	1J0	11	Does Mandy tell a stranger she is a man?	Yes
chat	B03200046	1J0	12	Does Mandy tell a stranger is a man?	Yes
chat	B03200102	1J0	13		\N
chat	B03200046	1J0	13	Does she understand Junior's question?	No
chat	B03200046	1J0	14	Does she understand Junior 's question?	No
chat	B03200046	1J0	15	Does Sabrina understand Junior 's question?	No
chat	B03200102	1J0	14	Who says she is 16 years old	--
chat	B03200046	1J0	16	Does he from Turkey?	Yes
chat	B03200046	1J0	17	Is he from Turkey?	Yes
chat	B03200102	1J0	15	Who says she is come from Taiwan	--
chat	B03200046	1J0	18	Is she understand Junior 's question?	No
chat	B03200102	1J0	16	Who says she is come from Taiwan	Ariel
chat	B03200046	1J0	19		\N
chat	B03200046	1J0	20		\N
chat	B03200102	1J0	17	Who tell Junior is come from Taiwan	--
chat	B03200046	1J0	21	Whose age is 16?	--
chat	B03200102	1J0	18	Who ask Mandy where is she come from?	Sabrina
chat	B03200046	1J0	22	Whose age is 15?	--
chat	B03200102	1J0	19	Who ask Mandy is come from?	Sabrina
chat	B03200102	1J0	20	Who ask Mandy is she come from?	Alice
chat	B03200046	1J0	23	Who is a freshman?	Alice
chat	B03200102	1J0	21		\N
chat	B03200102	1J0	22		\N
chat	B03200102	1J0	23		\N
chat	B03200046	1J0	24	Who is from Taiwan?	Ariel
chat	B03200102	1J0	24	Who is the beautiful girl	Alice
chat	B03200046	1J0	25	Who greet Filibee?	Ariel
chat	B03200046	1J0	26	Who is greet to Filibee?	Ariel
chat	B03200046	1J0	27		\N
chat	B03200046	1J0	28		\N
chat	B03200046	1J0	29		\N
chat	B03200102	1J0	25		\N
chat	B03200046	1J0	30	Does she greet to Filibee?	Yes
chat	B03200102	1J0	26	Who is a boy	--
chat	B03200046	1J0	31	Is she greet to Filibee?	Yes
chat	B03200102	1J0	27	Who is a man	--
chat	B03200102	1J0	28	Who is from USA?	--
chat	B03200046	1J0	32	Are they come to Taiwan?	Yes
chat	B03200046	1J0	33	Are they come to Taiwan ?	Yes
chat	B03200046	1J0	34	Are they come to Taiwan ?	Yes
chat	B03200046	1J0	35	Is she a beautiful girl?	Yes
chat	B03200102	1J0	29		\N
chat	B03200102	1J0	30		\N
chat	B03200046	1J0	36	Who is come from USA?	--
chat	B03200102	1J0	31	Does Ariel say that she is from Taiwan?	Yes
chat	B03200046	1J0	37	Who is come from the USA?	--
chat	B03200046	1J0	38	Who is a student?	Ariel
chat	B03200046	1J0	39	Who is a male?	--
chat	B03200102	1J0	32	Does Alice say that she is a freshman?	--
chat	B03200046	1J0	40	Who is on Facebook?	--
chat	B03200046	1J0	41	Who is a girl?	Ariel
chat	B03200102	1J0	33	Does Junior say that he is from Turkey ?	--
chat	B03200102	1J0	34		\N
chat	B03200102	1J0	35		\N
chat	B03200046	1J0	42	Does Ellarose tell that she is from Madison in the USA?	Yes
chat	B03200102	1J0	36	Who is a handsome man	--
chat	B03200102	1J0	37	Who is a man	--
chat	B03200046	1J0	43	Does Ellarose tell that is from Madison in the USA?	Yes
chat	B03200102	1J0	38	Who is a man	Sabrina
chat	B03200102	1J0	39	Who is come from the Turkey	Mandy
chat	B03200046	1J0	44	Does Alice tell that Ellarose is a student?	Yes
chat	B03200046	1J0	45	Does Alice tell that is a student?	Yes
chat	B03200046	1J0	46	Does Alice tell that she is a student?	Yes
chat	B03200102	1J0	40	Who is comes from the Turkey	--
chat	B03200046	1J0	47	Does Alice tell that is a student?	Yes
chat	B03200102	1J0	41	Who is come from  Turkey	--
chat	B03200046	1J0	48	Does Alice tell that she is a student?	Yes
chat	B03200102	1J0	42	Whose age is 18 	--
chat	B03200046	1J0	49	Does Ariel say that she is 16?	No
chat	B03200102	1J0	43	Who is a Alice	--
chat	B03200102	1J0	44	Who is Alice?	--
chat	B03200102	1J0	45		\N
chat	B03200102	1J0	46		\N
chat	B03200046	1J0	50	Does Filibee say that she is from Taiwan?	No
chat	B03200046	1J0	51	Does Ellarose like Paris?	Yes
chat	B03200046	1J0	52	Does he like Paris?	Yes
chat	B03200102	1J0	47		\N
chat	B03200046	1J0	53	Does he like NY?	Yes
chat	B03200102	1J0	48		\N
chat	B03200046	1J0	54	Does Ellarose like NY?	Yes
chat	B03200046	1J0	55	Who like NY?	--
chat	B03200102	1J0	49	Does Sabrina say that she is from USA?	--
chat	B03200046	1J0	56	Whose name is Ariel?	Ariel
chat	B03200102	1J0	50	Does Sabrina say that she is from Turkey?	--
chat	B03200046	1J0	57	Whose age is 16?	--
chat	B03200102	1J0	51		\N
chat	B03200046	1J0	58	Who is sophomore?	Ariel
chat	B03200102	1J0	52		\N
chat	B03200046	1J0	59	Does she a sophomore?	Yes
chat	B03200102	1J0	53	Who is Ellarose	--
chat	B03200046	1J0	60	Is she a sophomore?	Yes
chat	B03200046	1J0	61	Isn't she a freshman?	No
chat	B03200102	1J0	54	Who is young?	--
chat	B03200102	1J0	55	Who like  Paris?	--
chat	B03200102	1J0	56	Who likes  Paris?	--
chat	B03200046	1J0	62	Isn't it the USA is a beautiful city?	Yes
chat	B03200046	1J0	63	Isn't the USA is a beautiful city?	Yes
chat	B03200046	1J0	64	Isn't the USA a beautiful city?	Yes
chat	B03200102	1J0	57	Who beautiful?	--
chat	B03200102	1J0	58	Whose beautiful?	--
chat	B03200046	1J0	65	Isn't USA a beautiful city?	Yes
chat	B03200046	1J0	66	Whose city ?	--
chat	B03200046	1J0	67	Whose city ?	--
chat	B03200102	1J0	59		\N
chat	B03200046	1J0	68	Whose city is beautiful ?	Ariel
chat	B03200046	1J0	69	Are they old?	Yes
chat	B03200046	1J0	70	Are they understand the questions?	Yes
chat	B03200046	1J0	71	Are they understand the question?	Yes
chat	B03200046	1J0	72	Is she understand the question?	No
chat	B03200102	1J0	60	Does Madison say that he is a freshman?	--
chat	B03200046	1J0	73	Does she understand the question?	No
chat	B03200102	1J0	61	Does Madison say that she is a freshman?	--
chat	B03200102	1J0	62	Does Madison say that is a freshman?	--
chat	B03200046	1J0	74	Who greet to Filibee?	Ariel
chat	B03200102	1J0	63	Does Ellarose tell Alice is from Taiwan?	--
chat	B03200046	1J0	75	Who is young?	Ariel
chat	B03200046	1J0	76	When does he come?	Ariel
chat	B03200046	1J0	77	Who talk to the stranger?	Ariel
chat	B03200102	1J0	64		\N
chat	B03200102	1J0	65	Who is sixteen years old	--
chat	B03200046	1J0	78	 When is a stranger disconnects?	Mandy
chat	B03200102	1J0	66	Who is female	--
chat	B03200046	1J0	79	Who guess Sabrina 's age name?	Sabrina
chat	B03200046	1J0	80	Who guess Sabrina 's age ?	Sabrina
chat	B03200046	1J0	81	Who guess age ?	Ariel
chat	B03200046	1J0	82	Does she guess age?	No
chat	B03200046	1J0	83	Does she guess Sabrina's age?	Yes
chat	B03200046	1J0	84	Does he come to Taiwan?	No
chat	B03200046	1J0	85	Does she talk to the stranger?	Yes
chat	B03200046	1J0	86	Does she talk to stranger?	Yes
chat	B03200046	1J0	87	Does she talk stranger age?	Yes
chat	B03200046	1J0	88	Does she understand he?	No
chat	B03200046	1J0	89	Does she understand Ariel?	Yes
chat	B03200102	1J0	67		\N
chat	B03200046	1J0	90	Who guess age ?	Ariel
chat	B03200046	1J0	91	Does she understand Ariel?	Yes
chat	B03200088	1J0	1		\N
chat	B03200102	1J0	68		\N
chat	B03200046	1J0	92		\N
chat	B03200088	1J0	2		\N
chat	B03200102	1J0	69		\N
chat	B03200088	1J0	3	Who is from USA?	Ariel
chat	B03200088	1J0	4	Who is from USA?	Alice
chat	B03200031	1J0	1		\N
chat	B03200013	1J0	1		\N
chat	B03200084	1J0	1		\N
chat	B03200062	1J0	1		\N
chat	B03200088	1J0	5	Who is old?	Mandy
chat	B03200031	1J0	2		\N
chat	B03200031	1J0	3		\N
chat	B03200102	1J0	71		\N
chat	B03200088	1J0	6	Who ask the question?	--
chat	B03200031	1J0	4		--
chat	B03200031	1J0	5		\N
chat	B03200031	1J0	6	Dose Mandy from Taiwan?	Yes
chat	B03200031	1J0	7	Dose Mandy from Taiwan?	No
chat	B03200102	1J0	72		\N
chat	B03200062	1J0	2	Where is Ariel from?	--
chat	B03200084	1J0	2	where do you come from?	Alice
chat	B03200003	1J0	1		\N
chat	B03200013	1J0	2	Who is male	--
chat	B03200003	1J0	2		\N
chat	B03200084	1J0	3		\N
chat	B03200102	1J0	73		\N
chat	B03200102	1J0	74		\N
chat	B03200084	1J0	4		\N
chat	B03200062	1J0	3	Does Ariel from Taiwan?	--
chat	B03200031	1J0	8	Does Mandy ask a stranger how old he is?	Yes
chat	B03200013	1J0	3		\N
chat	B03200078	1J0	1		\N
chat	B03200102	1J0	75		\N
chat	B03200031	1J0	9	Does Ellarose greet Alice?	Yes
chat	B03200031	1J0	10	Does Ellarose tell Alice that she is a student?	Yes
chat	B03200003	1J0	3	Does Alice know Facebook?	Alice
chat	B03200031	1J0	11	Does Ellarose say  she is 16?	Yes
chat	B03200031	1J0	12	Does Sabrina tell Junior her name?	No
chat	B03200003	1J0	4	Does 	--
chat	B03200062	1J0	4	Who is female?	--
chat	B03200062	1J0	5	Who is female?	--
chat	B03200013	1J0	4	Does Sabrina say that  she is beautiful?	--
chat	B03200102	1J0	76		\N
chat	B03200088	1J0	7		\N
chat	B03200003	1J0	5	Does anyone come to Ariel's house?	Sabrina
chat	B03200062	1J0	6	Who is the freshman?	--
chat	B03200102	1J0	77		\N
chat	B03200003	1J0	6	Does anyone come to school?	Alice
chat	B03200102	1J0	78		\N
chat	B03200088	1J0	8		\N
chat	B03200013	1J0	5	Does Alice tell Mandy that she likes Turkey?	--
chat	B03200062	1J0	7		\N
chat	B03200062	1J0	8		\N
chat	B03200078	1J0	2		\N
chat	B03200013	1J0	6	Does Alice tell Mandy that she understand Facebook?	--
chat	B03200013	1J0	7	Does Alice tell Mandy that understand Facebook?	--
chat	B03200062	1J0	9		\N
chat	B03200102	1J0	79		\N
chat	B03200003	1J0	7	when does Mandy come to school?	Ariel
chat	B03200013	1J0	8	Doesn't  Alice understand  the Facebook?	--
chat	B03200013	1J0	9	Doesn't  Alice understand  the Facebook?	--
chat	B03200003	1J0	8	what kind of food does Mandy like?	Sabrina
chat	B03200003	1J0	9	what kind of food does Mandy like?	--
chat	B03200062	1J0	10	Does Mandy say that she is a student?	--
chat	B03200013	1J0	10	Does Alice say that she is 18？	--
chat	B03200013	1J0	11		\N
chat	B03200013	1J0	12	Does Alice say that she is from Taiwan?	--
chat	B03200003	1J0	10	 Doesn't Mandy  know the question?	Alice
chat	B03200013	1J0	13	Who is Filibee？	--
chat	B03200003	1J0	11	 Does Alice from USA?	Ariel
chat	B03200062	1J0	11	Does Alice say that she understand the question?	--
chat	B03200102	1J0	80		\N
chat	B03200062	1J0	12	Does Alice say that she understand the question?	--
chat	B03200003	1J0	12	Doesn't Alice like Ariel?	Sabrina
chat	B03200013	1J0	14		\N
chat	B03200003	1J0	13	Who can speak English?	Alice
chat	B03200013	1J0	15	Who is women?	--
chat	B03200003	1J0	14	Does Alice have beautiful dress?	Mandy
chat	B03200003	1J0	15	Does Alice have beautiful dress?	--
chat	B03200013	1J0	16	Whose age isn't 18?	--
chat	B03200003	1J0	16	Who is right?	Sabrina
chat	B03200062	1J0	13	Doesn't Alice understand the question?	--
chat	B03200062	1J0	14	Does Alice understand the question?	--
chat	B03200003	1J0	17	Doesn't Alice say goodbye to her mother?	Ariel
chat	B03200102	1J0	81		\N
chat	B03200003	1J0	18	Does anyone can ask the question?	Ariel
chat	B03200062	1J0	15	who isn't a young girl?	--
chat	B03200003	1J0	19	Does Alice understand the question?	Mandy
chat	B03200078	1J0	3	Who is female?	Ariel
chat	B03200003	1J0	20	Is it a dog?	Sabrina
chat	B03200102	1J0	82		\N
chat	B03200088	1J0	9		\N
chat	B03200003	1J0	21	Who feeds the cat?	Ariel
chat	B03200003	1J0	22	Who feeds the cat?	--
chat	B03200088	1J0	10		\N
chat	B03200078	1J0	4	Who is a female?	Mandy
chat	B03200078	1J0	5	Who is a female ?	Ariel
chat	B03200088	1J0	11		\N
chat	B03200088	1J0	12		\N
chat	B03200078	1J0	6	Who is  female ?	Ariel
chat	B03200003	1J0	23	Does Alice sing the song?	Mandy
chat	B03200078	1J0	7	Whose name  nationality?	Ariel
chat	B03200078	1J0	8	Who is freshman?	Ariel
chat	B03200088	1J0	13		\N
chat	B03200078	1J0	9	Who is a freshman?	Ariel
chat	B03200003	1J0	24	Who talks to stranger?	Alice
chat	B03200078	1J0	10	Who is beautiful?	Ariel
chat	B03200003	1J0	25	Doesn't Alice from USA?	Ariel
chat	B03200078	1J0	11		\N
chat	B03200102	1J0	83		\N
chat	B03200078	1J0	12	Is she a freshman?	Yes
chat	B03200050	1J0	1		\N
chat	B03200046	1J0	93		\N
chat	B03200050	1J0	2		\N
chat	B03200046	1J0	94		\N
chat	B03200046	1J0	95		\N
chat	B03200046	1J0	96		\N
chat	B03200046	1J0	97		\N
chat	B03200050	1J0	3		\N
chat	B03200050	1J0	4		\N
chat	B03200050	1J0	6	Who wants to be a tour guide?	Ariel
chat	B03200050	1J0	7		\N
chat	B03200050	1J0	8		\N
chat	B03200050	1J0	9	Does Junior like playing basketball?	Yes
chat	B03200050	1J0	10		\N
chat	B03200050	1J0	11		\N
chat	B03200074	1J0	1		\N
chat	B03200074	1J0	2		\N
chat	B03200074	1J0	3	Doesn't Ariel from USA?	No
chat	B03200039	1J0	1		\N
chat	B03200074	1J0	4	Does Ellarose is junior	No
chat	B03200074	1J0	5	Does Ellarose is from Paris	No
chat	B03200039	1J0	2		\N
chat	B03200039	1J0	3		\N
chat	B03200074	1J0	6	Does Ariel is from Taiwan	Yes
chat	B03200074	1J0	7	Does Ariel is from Taiwan	No
chat	B03200074	1J0	8	Does Ariel  from Taiwan	Yes
chat	B03200074	1J0	9	Does Ellarose is sophomore	Yes
chat	B03200029	1J0	1		\N
chat	B03200029	1J0	2	Does Alice ask a Ellarose whether come to Taiwan?	Alice
chat	B03200029	1J0	3		\N
chat	B03200029	1J0	4		\N
chat	B03200029	1J0	5	Does Alice ask a Ellarose whether come to Taiwan?	Yes
chat	B03200029	1J0	6	Does Alice ask a Ellarose whether come to Taiwan?	No
chat	B03200029	1J0	7	Does Alice ask a Ellarose she come to Taiwan?	No
chat	B03200029	1J0	8	Does Alice ask a Ellarose come to Taiwan?	No
chat	B03200029	1J0	9	Does Alice ask a Ellarose where she from?	Yes
chat	B03200029	1J0	10	Does Ariel tell Filibee she from Taiwan?	Yes
chat	B03200029	1J0	11	Does Ariel tell Filibee our night market have many delicious food?	Yes
chat	B03200029	1J0	12	Does Ariel tell Filibee night market have many delicious food?	Yes
chat	B03200029	1J0	13	Does Ariel tell Filibee she is from Taiwan?	Yes
chat	B03200029	1J0	14	Does Stranger tell Sabrina how old she is?	Yes
chat	B03200029	1J0	15	Does Sabrina ask a stranger he is from?	Yes
chat	B03200029	1J0	16	Doe. Stranger ask Marian why she don't like horrible movie?	Yes
chat	B03200029	1J0	17	Doe Stranger ask Marian why she don't like horrible movie?	Yes
chat	B03200029	1J0	18	Doe Stranger ask Marian why she don't like horrible movie?	--
chat	B03200029	1J0	19	Doe Stranger ask Marian she don't like horrible movie?	Yes
chat	B03200029	1J0	20	Doe Stranger say she is live Hsinchu?	Yes
chat	B03200029	1J0	21	Doe Stranger say she is from Hsinchu?	Yes
chat	B03200029	1J0	22	Does Stranger say she is from Hsinchu?	Yes
chat	B03200029	1J0	23		\N
chat	B03200029	1J0	24	Who say she is 19 years old? 	--
chat	B03200029	1J0	25	Who say hello?	Mandy
chat	B03200029	1J0	26	Who say she is man?	Mandy
chat	B03200029	1J0	27	Who speak she is from Taiwan?	Alice
chat	B03200029	1J0	28	Who tell stranger she is freshman?	Alice
chat	B03200029	1J0	29	Who say night market food is delicious in Taiwan?	Ariel
chat	B03200029	1J0	30	Whose country is Taiwan?	Ariel
chat	B03200029	1J0	31	Who is 18 years old?	Sabrina
chat	B03200029	1J0	32	Who name is beautiful?	Sabrina
chat	B03200029	1J0	33	Who say English is not well	Sabrina
chat	B03200029	1J0	34	Who say English is not well?	Sabrina
chat	B03200074	1J0	10		\N
chat	B03200029	1J0	35		\N
chat	B03200029	1J0	36	Does Mandy say she is man?	Yes
chat	B03200029	1J0	37	Does Mandy say she is from?	No
chat	B03200074	1J0	11	whose nationality is Taiwan	Alice
chat	B03200074	1J0	12	who have Facebook	Sabrina
chat	B03200046	1J0	98		\N
chat	B03200052	1J0	1		\N
chat	B03200052	1J0	2	who old  is she?	Alice
chat	B03200052	1J0	3		\N
chat	B03200052	1J0	4		\N
chat	B03200052	1J0	5	Does Alice is a student?	Yes
chat	B03200052	1J0	6	Does Alice is a student?	--
chat	B03200037	1J0	1		\N
chat	B03200037	1J0	2	Isn't she a sophomore?	Mandy
chat	B03200037	1J0	3	Who is younger? 	Alice
chat	B03200037	1J0	4	Is she from Turkey? 	Sabrina
chat	B03200037	1J0	5	Does Sabrina say that she is a student? 	Sabrina
chat	B03200037	1J0	6	Does Alice is a freshman? 	Alice
chat	B03200037	1J0	7	Does Ellarose say she is 20?	--
chat	B03200037	1J0	8	Whose name is Alice?	Alice
chat	B03200037	1J0	9	Who is the handsome boy 	Alice
chat	B03200037	1J0	10		\N
chat	B03200037	1J0	11		\N
chat	B03200037	1J0	12	Is he a freshman? 	Yes
chat	B03200037	1J0	13	Does Mandy know Facebook? 	No
chat	B03200037	1J0	14	Is he a sophomore? 	No
chat	B03200012	1J0	1		\N
chat	B03200012	1J0	2		\N
chat	B03200012	1J0	3		\N
chat	B03200012	1J0	4	Does Mandy say Hello	Yes
chat	B03200056	1J0	1		\N
chat	B03200056	1J0	2	Isn't she come from Taiwan?\t	Alice
chat	B03200056	1J0	3	Doesn't he come from Taiwan?\t	Ariel
chat	B03200056	1J0	4	Does Alice ask a stranger how old he is?	--
chat	B03200056	1J0	5	Whose age is 23	Sabrina
chat	B03200056	1J0	6	Who is beautiful 	Alice
chat	B03200056	1J0	7	Who is female	Alice
chat	B03200056	1J0	8	Whose name is Ariel?	Ariel
chat	B03200056	1J0	9	Is she a freshman?	Alice
chat	B03200056	1J0	10	Does Alice say that she is a student?	--
chat	B03200056	1J0	11	Does Alice say that she is a student?	Alice
chat	B03200056	1J0	12		\N
chat	B03200056	1J0	13	Does Ellarose say that she is from Taiwan	No
chat	B03200056	1J0	14	Is Mandy a beautiful girl?	Yes
chat	B03200056	1J0	15	Aren't  Mandy a beautiful girl ?	No
chat	B03200056	1J0	16	Isn't  Mandy a beautiful girl ?	No
chat	B03200056	1J0	17	Does Alice say that he is from Turkey ?	No
chat	B03200056	1J0	18	Does Mandy say that she is from Taiwan?	No
chat	B03200097	1J0	4		\N
chat	B03200097	1J0	5		\N
chat	B03200097	1J0	6		\N
chat	B03200097	1J0	7		\N
chat	B03200097	1J0	8		\N
chat	B03200097	1J0	9	Who says she is a male?	Mandy
chat	B03200097	1J0	10	Whose name is beautiful?	Sabrina
chat	B03200097	1J0	11		\N
chat	B03200097	1J0	12		\N
chat	B03200054	1J0	1		\N
chat	B03200097	1J0	13	Is Sabrina's name beautiful?	Yes
chat	B03200054	1J0	2	Whose age is 18?	Alice
chat	B03200054	1J0	3		\N
chat	B03200054	1J0	4		\N
chat	B03200054	1J0	5	Does Sabrina say that she is a girl?	Yes
chat	B03200054	1J0	6	Does Junior ask Sabrina if she is Hispanic?	Yes
chat	B03200039	1J0	4		\N
chat	B03200054	1J0	7	Does a stranger ask Mandy if she is male or female?	No
chat	B03200039	1J0	5	Does Sabrina say that she is a girl	--
chat	B03200097	1J0	14		\N
chat	B03200054	1J0	8	Does Alice say that she is 16?	Alice
chat	B03200054	1J0	9	Does Sabrina know Facebook? 	Sabrina
chat	B03200097	1J0	15	Is Mandy's name beautiful?	No
chat	B03200054	1J0	10	Who is young?	Ariel
chat	B03200039	1J0	6		\N
chat	B03200039	1J0	7		\N
chat	B03200054	1J0	11	Whose age is 18?	Alice
chat	B03200097	1J0	16	Does Sabrina say that she is from Taiwan?	Yes
chat	B03200054	1J0	12	Whose name is Sabrina?	Sabrina
chat	B03200039	1J0	8	Does Ariel say that she is a businessman	No
chat	B03200054	1J0	13	Who is young?	Mandy
chat	B03200054	1J0	14	Who is male man?	Mandy
chat	B03200054	1J0	15		\N
chat	B03200039	1J0	9	Does Ariel ask a stranger how old he is	No
chat	B03200054	1J0	16	Does Alice say that she is beautiful? 	Alice
chat	B03200039	1J0	10	Does Alice say that the stranger is young	No
chat	B03200054	1J0	17	Is Alice young? 	Alice
chat	B03200039	1J0	11	Does Alice say that she is a girl	No
chat	B03200039	1J0	12	Does Ariel know facebook	Yes
chat	B03200039	1J0	13	Does Alice say that she is 16	No
chat	B03200039	1J0	14	Does Mandy ask Ellarose if she is a student	No
chat	B03200039	1J0	15	Does Mandy greet Ariel	No
chat	B03200039	1J0	16	Does Mandy say that the stranger is young	No
chat	B03200039	1J0	17	Does a stranger ask Ariel if she is male or female	Yes
chat	B03200039	1J0	18	Does Ariel ask a stranger if she is a man or woman	No
chat	B03200097	1J0	17	Does Junior say that he is 16?	Yes
chat	B03200039	1J0	19		\N
chat	B03200039	1J0	20		\N
chat	B03200039	1J0	21		\N
chat	B03200039	1J0	22	Who is Ariel	--
chat	B03200039	1J0	23	Who ask Sabrina if she is Hispanic	--
chat	B03200039	1J0	24	Who greet Sabrina	--
chat	B03200039	1J0	25	Who is greet Sabrina	--
chat	B03200039	1J0	26	Who is Sabrina	--
chat	B03200039	1J0	27	Who is 16	--
chat	B03200097	1J0	18	Does Sabrina say that she is a beautiful girl?	No
chat	B03200097	1J0	19	Does Filibee say that she is a beautiful girl?	No
chat	B03200097	1J0	20	Does Mandy come from Taiwan?	Yes
chat	B03200097	1J0	21	Does Mandy say that she comes from Taiwan?	No
chat	B03200097	1J0	22	Is Mandy a female?	No
chat	B03200097	1J0	23	Is Mandy female?	No
chat	B03200097	1J0	24	Is Sabrina a beautiful girl?	Yes
chat	B03200097	1J0	25	Is Junior a beautiful girl?Junior	No
chat	B03200097	1J0	26	Is Junior a beautiful girl?	No
chat	B03200097	1J0	27	Does Junior say that he is a freshman?	No
chat	B03200097	1J0	28		\N
chat	B03200097	1J0	29		\N
chat	B03200097	1J0	30	Who is a girl?	Mandy
chat	B03200097	1J0	31	Who is a girl?	Ariel
chat	B03200097	1J0	32	Who is a freshman?	Alice
chat	B03200097	1J0	33		\N
chat	B03200097	1J0	34		\N
chat	B03200097	1J0	35	Is Ellarose a sophomore?	Yes
chat	B03200097	1J0	36	Does Junior ask Sabrina's nationality?	Yes
chat	B03200097	1J0	37	Does Junior ask the nationality?	Yes
chat	B03200097	1J0	38	Does Junior ask nationality?	Yes
chat	B03200097	1J0	39	Does Junior ask Sabrina that the nationality?	Yes
chat	B03200097	1J0	40	Does Junior ask that Sabrina's nationality?	Yes
chat	B03200097	1J0	41	Is Junior a Hispanic male?	No
chat	B03200097	1J0	42	Is Junior young?	Yes
chat	B03200097	1J0	43		\N
chat	B03200097	1J0	44		\N
chat	B03200097	1J0	45		\N
chat	B03200097	1J0	46	Who asks a stranger that she is male?	Mandy
chat	B03200097	1J0	47	Who was disconnected?	Mandy
chat	B03200097	1J0	48	Whose stranger disconnected?	Mandy
chat	B03200097	1J0	49	Whose stranger disconnect?	Mandy
chat	B03200097	1J0	50	Whose stranger disconnects?	Mandy
chat	B03200097	1J0	51	Whose stranger asks the Facebook?	Sabrina
chat	B03200097	1J0	52	Whose strangers ask the Facebook?	Sabrina
chat	B03200097	1J0	53	Whose stranger ask the Facebook?	Sabrina
chat	B03200097	1J0	54	Who disconnects?	Mandy
chat	B03200097	1J0	55	Who says that is right?	Sabrina
chat	B03200097	1J0	56	Who say that is right?	Sabrina
chat	B03200097	1J0	57		\N
chat	B03200097	1J0	58		\N
chat	B03200097	1J0	59	Who doesn't understand?	Sabrina
chat	B03200097	1J0	60	Whose stranger's name is Junior?	Sabrina
chat	B03200097	1J0	61	Whose stranger is Junior?	Sabrina
chat	B03200097	1J0	62	whose stranger asks Facebook	Sabrina
chat	B03200019	1J0	1		\N
chat	B03200019	1J0	2		\N
chat	B03200019	1J0	3	What do you like to do in your free time?	Alice
chat	B03200019	1J0	4	Who is from Florida?	Alice
chat	B03200019	1J0	5	Whose come from Australia?	Sabrina
chat	B03200019	1J0	6	Who is a freshmen?	Sabrina
chat	B03200019	1J0	7		\N
chat	B03200019	1J0	8		\N
chat	B03200082	1J0	1		\N
chat	B03200050	1J0	12		\N
chat	B03200050	1J0	13	Who always use Facebook?	Mandy
chat	B03200050	1J0	14	Who always use Facebook?	--
chat	B03200050	1J0	15	What Alice like to eat?	--
chat	B03200050	1J0	16	Where is Sabrina living in?	--
chat	B03200050	1J0	17		\N
chat	B03200050	1J0	18		\N
chat	B03200050	1J0	19	Does she have a boyfriend?	No
chat	B03200050	1J0	20	Has he done the homework?	No
chat	B03200050	1J0	21		\N
chat	B03200050	1J0	22		\N
chat	B03200050	1J0	23	Whose hair is black?	Ariel
chat	B03200050	1J0	24		\N
chat	B03200050	1J0	25		\N
chat	B03200050	1J0	26	Does Junior always use facebook?	Yes
chat	B03200097	1J0	63		\N
chat	B03200088	1J0	14		\N
chat	B03200098	1J0	1		\N
chat	B03200098	1J0	2	who will go to the market after two hours?	Alice
chat	B03200098	1J0	3	who will goes to the market after two hours	Alice
chat	B03200098	1J0	4	who will goes to the market after two hours	Ariel
chat	B03200098	1J0	5	who will goes to the market after two hours	Mandy
chat	B03200098	1J0	6	who will goes to the market after two hours?	Alice
chat	B03200098	1J0	7	who  goes to the market after two hours?	Ariel
chat	B03200098	1J0	8	who goes to the market after two hours?	--
chat	B03200098	1J0	9	who goes to the market after two hours?	Ariel
chat	B03200098	1J0	10	Who wants to eat the candy?	Mandy
chat	B03200098	1J0	11	Who wants to eat the candy?	Mandy
chat	B03200098	1J0	12	Who is happy?	Ariel
chat	B03200098	1J0	13	Who is happy?	Ariel
chat	B03200098	1J0	14	Who is happy?	Mandy
chat	B03200098	1J0	15	Who is happy?	Mandy
chat	B03200098	1J0	16	Who is happy?	Sabrina
chat	B03200098	1J0	17	Who age is 17	--
chat	B03200098	1J0	18	Who age is 17	Ariel
chat	B03200098	1J0	19	Who age is 17	Mandy
chat	B03200098	1J0	20	Who age is 17?	--
chat	B03200098	1J0	21	who is young? 	Ariel
chat	B03200098	1J0	22	Who is ugly?	Alice
chat	B03200098	1J0	23	Who is not beautiful?	--
chat	B03200098	1J0	24	Who is not beautiful?	Mandy
chat	B03200098	1J0	25	Who is understand this question?	Ariel
chat	B03200098	1J0	26	Who is understand thequestion?	--
chat	B03200098	1J0	27	Who is understand the question?	Alice
chat	B03200098	1J0	28	Who understands the question?	Alice
chat	B03200098	1J0	29	Who understand the question?	Ariel
chat	B03200098	1J0	30	Who does understand the question?	Ariel
chat	B03200098	1J0	31	Who is right?	Mandy
chat	B03200098	1J0	32	Who is good?	Ariel
chat	B03200012	1J0	5		\N
chat	B03200012	1J0	6	Does a stranger ask Mandy if she is male or female. 	No
chat	B03200012	1J0	7	Does Junior ask Sabrina if she is on Facebook?	Yes
chat	B03200012	1J0	8	Does Junior say that he is a freshman?	Yes
chat	B03200012	1J0	9	Does Junior say that he is a freshman?	No
chat	B03200012	1J0	10	Does Mandy ask a stranger how old he is?	Yes
chat	B03200012	1J0	11	Does Alice say that she is a girl	Yes
chat	B03200012	1J0	12	Does Alice say that she is a girl?	No
chat	B03200012	1J0	13	Does Sabrina tell Junior that she doesn't often use Facebook?	Yes
chat	B03200012	1J0	14	Does Alice say that she is from Taiwan?	Yes
chat	B03200012	1J0	15	Does Ellarose tell Alice that she is a student?	Yes
chat	B03200012	1J0	16	Does Alice tell Alice that she is a student?	No
chat	B03200012	1J0	17	Does Alice say that he is a freshman?	No
chat	B03200012	1J0	18	Does Alice say that she is a freshman?	No
chat	B03200012	1J0	19	Is Alice young?	Yes
chat	B03200012	1J0	20	Is Alice young?	No
chat	B03200012	1J0	21	Does Filibee say that she is from Taiwan?	No
chat	B03200012	1J0	22	Does a stranger ask Mandy if she is male or female. 	Yes
chat	B03200012	1J0	23	Does he guess Sabrina's age?	Yes
chat	B03200012	1J0	24	Does he guess Sabrina's age?	No
chat	B03200012	1J0	25	Dose Ellarose she is a student?	Yes
chat	B03200012	1J0	26	Dose Ellarose she is a student?	No
chat	B03200012	1J0	27	Does Ariel say that she is from Paris?	No
chat	B03200012	1J0	28	Did you ever come?	No
chat	B03200012	1J0	29	Did stranger ever come to Taiwan?	No
chat	B03200012	1J0	30	Does Ellarose say that he is 16?	No
chat	B03200012	1J0	31	Is she a young girl	Yes
chat	B03200012	1J0	32	Is she a  freshman	Yes
chat	B03200012	1J0	33	Is she a  freshman	No
chat	B03200012	1J0	34	Is she a junior?	No
chat	B03200012	1J0	35	Is she a student?	Yes
chat	B03200102	1J0	84		\N
chat	B03200012	1J0	36	Is he a student	Yes
chat	B03200012	1J0	37	Doesn't Filibee say that she is a beautiful girl?	Yes
chat	B03200012	1J0	38	Is stranger a man?	Yes
chat	B03200012	1J0	39	Is stranger a man?	No
chat	B03200012	1J0	40	Is she a good girl?	Yes
chat	B03200012	1J0	41	Isn't she a good girl?	Yes
chat	B03200012	1J0	42	Isn't she a student?	Yes
chat	B03200012	1J0	43	Isn't he a student?	Yes
chat	B03200012	1J0	44	Doesn't Filibee say that she is a beautiful girl?	Yes
chat	B03200012	1J0	45	Doesn't Filibee say that she is a beautiful girl?	No
chat	B03200012	1J0	46	Is Alice young	Yes
chat	B03200012	1J0	47	Is Filibee from Turkey	Yes
chat	B03200012	1J0	48	Isn't Filibee from Turkey	Yes
chat	B03200012	1J0	49	Is Mandy from Turkey	No
chat	B03200012	1J0	50	Isn't Mandy from Turkey	No
chat	B03200012	1J0	51		\N
chat	B03200012	1J0	52	Who is she?	Alice
chat	B03200012	1J0	53	Who is from Taiwan?	Alice
chat	B03200012	1J0	54	Who is from Taiwan?	Ariel
chat	B03200082	1J0	2		\N
chat	B03200012	1J0	55	Who is from Taiwan?	Mandy
chat	B03200082	1J0	3		\N
chat	B03200082	1J0	4	who is facebook?	Alice
chat	B03200082	1J0	5	who lives in taiwan?	Ariel
chat	B03200082	1J0	6	who lives in taiwan?	Sabrina
chat	B03200082	1J0	7	who come from  taiwan?	Sabrina
chat	B03200082	1J0	8	who come from  taiwan?	Mandy
chat	B03200082	1J0	9	who came from taiwan?	Mandy
chat	B03200012	1J0	56	Who is 16 years old	Sabrina
chat	B03200082	1J0	10	who is 18	Alice
chat	B03200012	1J0	57	Who is young	Alice
chat	B03200082	1J0	11	who is 16	--
chat	B03200082	1J0	12	who is 14	Mandy
chat	B03200082	1J0	13	who is 15	Mandy
chat	B03200012	1J0	58	Who is 18 years old	Sabrina
chat	B03200082	1J0	14		\N
chat	B03200012	1J0	59	Who is 18 	Sabrina
chat	B03200082	1J0	15	who is not 15	Alice
chat	B03200082	1J0	16	who is not 16	Ariel
chat	B03200082	1J0	17	who isn't 15	Mandy
chat	B03200082	1J0	18	who isn't 15	--
chat	B03200012	1J0	60	Who is from Taiwan?	Sabrina
chat	B03200082	1J0	19	who isn't 15	Sabrina
chat	B03200082	1J0	20	who isn't 16	Alice
chat	B03200082	1J0	21	who isn't 16	Ariel
chat	B03200082	1J0	22	who isn't 16	Mandy
chat	B03200082	1J0	23	who isn't 16	Sabrina
chat	B03200082	1J0	24	who isn't 18	Alice
chat	B03200082	1J0	25	who isn't 18	Alice
chat	B03200082	1J0	26	who isn't 18	Ariel
chat	B03200082	1J0	27	who isn't 18	Mandy
chat	B03200082	1J0	28	who isn't 18	Sabrina
chat	B03200082	1J0	29	is she good	Alice
chat	B03200082	1J0	30	is he good	Sabrina
chat	B03200012	1J0	61	Who is female?	Alice
chat	B03200012	1J0	62	Who is female?	Ariel
chat	B03200012	1J0	63	Who is female?	Mandy
chat	B03200012	1J0	64	Who is female?	Sabrina
chat	B03200012	1J0	65	Who is good?	Alice
chat	B03200012	1J0	66	Who is a good girl?	Ariel
chat	B03200012	1J0	67	Who is a good girl?	Alice
chat	B03200012	1J0	68	Who is a good girl?	Sabrina
chat	B03200012	1J0	69	Who is a good girl?	Alice
chat	B03200012	1J0	70	Who is a good girl?	Ariel
chat	B03200012	1J0	71	Who is a good girl?	Mandy
chat	B03200012	1J0	72	Who is a good girl?	Sabrina
chat	B03200012	1J0	73	Who is girl?	Ariel
chat	B03200012	1J0	74	Who said that she is girl?	Sabrina
chat	B03200012	1J0	75	Who say that she is girl?	Sabrina
chat	B03200082	1J0	31	who is right	Mandy
chat	B03200082	1J0	32	who is right 	--
chat	B03200012	1J0	76	Who is a young girl?	Alice
chat	B03200082	1J0	33	who is right 	Alice
chat	B03200012	1J0	77	Who is a beautiful girl?	Sabrina
chat	B03200082	1J0	34	who is right 	Ariel
chat	B03200082	1J0	35		--
chat	B03200082	1J0	36	who is right 	Sabrina
chat	B03200082	1J0	37	who isn't  right 	Ariel
chat	B03200082	1J0	38	who isn't right 	Sabrina
chat	B03200082	1J0	39	who isn't man	Sabrina
chat	B03200082	1J0	40	who isn't man	Mandy
chat	B03200082	1J0	41	who isn't man	Alice
chat	B03200082	1J0	42	who isn't man	Ariel
chat	B03200012	1J0	78	who is a freshman 	Alice
chat	B03200082	1J0	43	who isn't freshman	Ariel
chat	B03200082	1J0	44	who isn't freshman	Sabrina
chat	B03200082	1J0	45	who isn't freshman	Mandy
chat	B03200012	1J0	79	who is a freshman 	Ariel
chat	B03200082	1J0	46	who isn't good freshman	Alice
chat	B03200082	1J0	47	who isn't good freshman	Mandy
chat	B03200082	1J0	48	who isn't good freshman	Sabrina
chat	B03200012	1J0	80	who is a freshman 	Mandy
chat	B03200082	1J0	49	who isn't good 	Mandy
chat	B03200012	1J0	81	who is a freshman 	Sabrina
chat	B03200082	1J0	50	who isn't good man	Sabrina
chat	B03200082	1J0	51	who isn't good man	Mandy
chat	B03200082	1J0	52	who isn't young	Alice
chat	B03200012	1J0	82	Who is a good	Sabrina
chat	B03200012	1J0	83	Who isn't beautiful	Ariel
chat	B03200012	1J0	84	Who isn't young	Ariel
chat	B03200012	1J0	85	Who is good	Mandy
chat	B03200082	1J0	53		\N
chat	B03200012	1J0	86	Who isn't a beautiful girl?	Alice
chat	B03200012	1J0	87	Who isn't a good girl?	Mandy
chat	B03200082	1J0	54	Doesn't he come from taiwan?	No
chat	B03200082	1J0	55	Doesn't he come from taiwan?	Yes
chat	B03200082	1J0	56	aren't they come from taiwan?	Yes
chat	B03200082	1J0	57	are they come from taiwan?	Yes
chat	B03200082	1J0	58	are they come from male man ?	Yes
chat	B03200082	1J0	59	are they male man ?	Yes
chat	B03200012	1J0	88	who is right	Ariel
chat	B03200082	1J0	60	are they student ?	Yes
chat	B03200082	1J0	61	are they student ?	--
chat	B03200082	1J0	62	aren't they student ?	Yes
chat	B03200082	1J0	63	aren't they young ?	Yes
chat	B03200082	1J0	64	are they young ?	No
chat	B03200012	1J0	89	who is Alice	Alice
chat	B03200082	1J0	65	are they Hispanic	Yes
chat	B03200082	1J0	66	doesn't he Hispanic	--
chat	B03200082	1J0	67	doesn't he Hispanic	--
chat	B03200082	1J0	68	doesn't he Hispanic	Yes
chat	B03200012	1J0	91	Who is disconnects?	Alice
chat	B03200012	1J0	92	Who isn't old?	Mandy
chat	B03200082	1J0	73	is he young	Yes
chat	B03200082	1J0	74	is he come from ny	Yes
chat	B03200012	1J0	93	Whose name is Ariel?	Ariel
chat	B03200082	1J0	76	is he  from turkey 	Yes
chat	B03200082	1J0	79	isn't he  turkey 	--
chat	B03200012	1J0	94	who doesn't ask a stranger how old he is?	Alice
chat	B03200082	1J0	81	isn't he live in paris	Yes
chat	B03200012	1J0	95	who doesn't ask a stranger how old he is?	Mandy
chat	B03200082	1J0	84	isn't he  female	No
chat	B03200012	1J0	99	Who tell Junior that she is from Taiwan	Alice
chat	B03200012	1J0	101	Who is old?	Ariel
chat	B03200012	1J0	102	Who isn't a girl? 	Ariel
chat	B03200012	1J0	103	Who isn't a good girl?	Ariel
chat	B03200012	1J0	104	Who isn't a female	Ariel
chat	B03200092	1J0	2	Does he come from turkey?	Sabrina
chat	B03200092	1J0	3		\N
chat	B03200092	1J0	4	whose is the most handsome ?	Sabrina
chat	B03200092	1J0	6	who is girl ?	Ariel
chat	B03200092	1J0	9	who is a boy ?	Sabrina
chat	B03200092	1J0	12	Is Mandy a girl ,isn't she ?	Yes
chat	B03200092	1J0	15		\N
chat	B03200092	1J0	16		\N
chat	B03200019	1J0	10	Does Alice tell Ellarose that she is from Taiwan	Yes
chat	B03200019	1J0	11	Does Filibee tell Ariel that he is from Turkey.	Yes
chat	B03200019	1J0	12	Does Sabrina say that she is a girl.  	No
chat	B03200019	1J0	13	Does the stranger say that he is 16. 	Yes
chat	B03200019	1J0	17	Does Sabrina tell Junior that she doesn't often use Facebook.	Yes
chat	B03200019	1J0	18	Does Ariel tell Filibee that he can come to Taiwan.	Yes
chat	B03200019	1J0	20	Does Ellarose tell Alice that she is from Madison in the USA.	Yes
chat	B03200019	1J0	21	Does Ariel greet Filibee.	No
chat	B03200019	1J0	22	Does Alice tell Ellarose she is a student.  	No
chat	B03200019	1J0	23	Does Alice tell Ellarose she is a student.  	Yes
chat	B03200019	1J0	27	Does a stranger disconnect when Mandy tells him she is a man. 	Yes
chat	B03200019	1J0	28	Does a stranger disconnect when Mandy tells him she is a man. 	No
chat	B03200019	1J0	29	Does Alice tell Ellarose she is a student.	--
chat	B03200019	1J0	30	Does Alice tell Ellarose she is a student.	Yes
chat	B03200109	1J0	1		\N
chat	B03200109	1J0	4	Whose name is Mandy	Mandy
chat	B03200109	1J0	7	Whose name is Ariel?	Ariel
chat	B03200109	1J0	10	Who doesn't like Ariel?	Sabrina
chat	B03200109	1J0	11	Who doesn't beauyiful?	Ariel
chat	B03200109	1J0	15	Who is 15 years old ?	Sabrina
chat	B03200109	1J0	16	Who is Alice's friend?	Ariel
chat	B03200109	1J0	17	Who doesn't understand Alice?	Ariel
chat	B03200109	1J0	21	Does Junior come from Taiwan	No
chat	B03200109	1J0	22	Does Ariel come from Taiwan?	Yes
chat	B03200109	1J0	24	Doesn't Ariel like Junior?	Yes
chat	B03200109	1J0	25	Is Ariel like Junior?	Yes
chat	B03200109	1J0	28	Doesn't Ariel come from Taiwan?	No
chat	B03200045	1J0	2	Who is a female?	Alice
chat	B03200045	1J0	3	Who is male?	Ariel
chat	B03200045	1J0	8	Does Alice come from USA?	Alice
chat	B03200045	1J0	9	Does Alice come from Taiwan?	Alice
chat	B03200045	1J0	12	Does Ariel come from Taiwan?	Ariel
chat	B03200045	1J0	14	Alice is a good girl.	Alice
chat	B03200045	1J0	15	Does Alice like turkey?	--
chat	B03200045	1J0	16	Does Alice like Ariel?	--
chat	B03200045	1J0	17	Does Alice like she?	Sabrina
chat	B03200012	1J0	90	Who isn't 18 	Ariel
chat	B03200082	1J0	69	is he Hispanic	Yes
chat	B03200082	1J0	70	is she young	--
chat	B03200082	1J0	71	is he god	No
chat	B03200082	1J0	72	is he good	--
chat	B03200082	1J0	75	is he  from ny	Yes
chat	B03200082	1J0	77	is he from turkey 	--
chat	B03200082	1J0	78	isn't he from turkey 	--
chat	B03200082	1J0	80	isn't he  turkey 	Yes
chat	B03200082	1J0	82	isn't he live in Sabrina	Yes
chat	B03200082	1J0	83	isn't he live in female	Yes
chat	B03200012	1J0	96	Who isn't a man	Sabrina
chat	B03200012	1J0	97	Who is girl?	Alice
chat	B03200012	1J0	98	Who isn't girl?	Alice
chat	B03200012	1J0	100	Who isn't a young girl?	Ariel
chat	B03200092	1J0	1		\N
chat	B03200092	1J0	5	whose is handsome ?	Sabrina
chat	B03200092	1J0	7	who is a girl ?	Alice
chat	B03200092	1J0	8	who is a boy ?	Sabrina
chat	B03200092	1J0	10		\N
chat	B03200092	1J0	11		\N
chat	B03200092	1J0	13	Mandy is a girl,isn't she ?	Yes
chat	B03200092	1J0	14	Does Ariel come from Taiwan?	Yes
chat	B03200092	1J0	17	Who  comes  from Turkey?	Sabrina
chat	B03200019	1J0	9		\N
chat	B03200019	1J0	14	Does Sabrina say that the stranger is young.  	No
chat	B03200019	1J0	15	Does Junior ask if Sabrina wants to talk to him. 	Yes
chat	B03200019	1J0	16	Does Junior ask if Sabrina wants to talk to him. 	Yes
chat	B03200019	1J0	19	Does Ellarose tell Alice that she is from Madison in the USA.	No
chat	B03200019	1J0	24	Does Mandy say Hello.	Yes
chat	B03200019	1J0	25	Does Mandy say Hello.	No
chat	B03200019	1J0	26	Does a stranger ask Mandy if she is male or female. 	Yes
chat	B03200109	1J0	2	Does Junior come from Taiwan	--
chat	B03200109	1J0	3	Who is Mandy?	Mandy
chat	B03200109	1J0	5	Whose name is Sabrina?	Sabrina
chat	B03200109	1J0	6	Whose name is Alice?	Alice
chat	B03200109	1J0	8	Who likes Ariel?	Sabrina
chat	B03200109	1J0	9	Who like Ariel?	Sabrina
chat	B03200109	1J0	12	Who isn't beauyiful?	Alice
chat	B03200109	1J0	13	Who isn't freshman	Alice
chat	B03200109	1J0	14	Who doesn't freshman	Alice
chat	B03200109	1J0	18	Whose city is USA	Sabrina
chat	B03200109	1J0	19	Whose city isn't USA?	Ariel
chat	B03200109	1J0	20		\N
chat	B03200109	1J0	23	Does Ariel like Junior?	Yes
chat	B03200109	1J0	26	Isn't Ariel like Junior?	Yes
chat	B03200109	1J0	27	Doesn't Junior come from Taiwan?	Yes
chat	B03200045	1J0	1		\N
chat	B03200045	1J0	4	Who is female?	--
chat	B03200045	1J0	5	Who is female?	Mandy
chat	B03200045	1J0	6	Who is old?	Sabrina
chat	B03200045	1J0	7	Who come from USA?	Ariel
chat	B03200045	1J0	10	Does she come from USA?	Alice
chat	B03200045	1J0	11	Does Ariel come from USA?	Ariel
chat	B03200045	1J0	13	Does Sabrina come from Taiwan?	Sabrina
chat	B03200045	1J0	18	Alice aren't girl.	Alice
chat	B03200045	1J0	19	Who like Turkey?	--
chat	B03200045	1J0	20	Who like Paris?	Alice
chat	B03200045	1J0	21	Who likes Paris?	Alice
chat	B03200045	1J0	22	Does Alice come from Turkey?	--
chat	B03200046	1J0	99		\N
chat	B03200046	1J0	100		\N
chat	B03200029	1J0	38		\N
chat	B03200093	1J0	1		\N
chat	B03200093	1J0	2		\N
chat	B03200093	1J0	3	Who is in MUST? 	Alice
chat	B03200093	1J0	4	Whose the student in MUST?	Annie
chat	B03200093	1J0	5	Who is student?	Cheney
chat	B03200093	1J0	6	who is that?	Annie
chat	B03200093	1J0	7		\N
chat	B03200093	1J0	8		\N
chat	B03200093	1J0	9	Is Maggie a female?	Yes
chat	B03200093	1J0	10	Dose Anna come to school?	Yes
chat	193001	1J0	14	Does Mandy ask a stranger how old he is?	Yes
chat	193001	1J0	15	Is Junior 16?	No
chat	193001	1J0	16	Does Junior say he is 16?	Yes
chat	193001	1J0	17	Does Junior say that he is 16?	Yes
chat	B03200012	1J0	105		\N
chat	B03200012	1J0	106		\N
chat	B03200012	1J0	107	is she young?	Yes
chat	B03200012	1J0	108	isn't she young?	Yes
chat	B03200012	1J0	109	is she 16	Yes
chat	B03200012	1J0	110	isn't she 16	Yes
chat	B03200097	1J0	64		\N
chat	B03200012	1J0	111	is she from Taiwan	Yes
chat	B03200097	1J0	65	Does Ellarose say that she is 16?	Yes
chat	B03200012	1J0	112	isn't she from Taiwan	Yes
chat	B03200097	1J0	66	Does Alice say that she is 16?	No
chat	B03200012	1J0	113		\N
chat	B03200012	1J0	114		\N
chat	B03200046	1J0	101		\N
chat	B03200012	1J0	115	is she 16	Yes
chat	B03200046	1J0	102		\N
chat	B03200097	1J0	67		\N
chat	B03200046	1J0	103		\N
chat	B03200012	1J0	116	isn't she 16	Yes
chat	B03200012	1J0	117	is she young?	Yes
chat	B03200012	1J0	118	isn't she young?	Yes
chat	B03200097	1J0	68	Does Filibee tell Ariel that he is from Turkey?	Yes
chat	B03200012	1J0	119	is she from Taiwan	Yes
chat	B03200012	1J0	120	isn't she from Taiwan	Yes
chat	B03200097	1J0	69	Does Filibee tell Ellarose that he is from Turkey?	No
chat	B03200012	1J0	121	is she 18	Yes
chat	B03200097	1J0	70	Does Junior ask Sabrina if she is Hispanic?	Yes
chat	B03200012	1J0	122	isn't she 18	Yes
chat	B03200102	1J0	85		\N
chat	B03200012	1J0	123	isn't she beautiful	Yes
chat	B03200029	1J0	39		\N
chat	B03200012	1J0	124	is she beautiful	Yes
chat	B03200097	1J0	71	Does Alice say that she is a freshman?	Yes
chat	B03200012	1J0	125	is he from Turkey	Yes
chat	B03200050	1J0	27		\N
chat	B03200074	1J0	13		\N
chat	B03200087	1J0	1		\N
chat	193001	1J0	18		\N
chat	B03200052	1J0	7		\N
chat	B03200046	1J0	104	who is from Taiwan?	Ariel
chat	B03200046	1J0	105		\N
chat	B03200012	1J0	126	isn't he from Turkey	Yes
chat	B03200046	1J0	106		\N
chat	B03200082	1J0	85		\N
chat	B03200029	1J0	40	Does Mandy she is girl?	Yes
chat	B03200012	1J0	127	who is beautiful	Alice
chat	B03200082	1J0	86	who is 16	Alice
chat	B01202106	1J0	1		\N
chat	B03200031	1J0	13		\N
chat	B03200092	1J0	18		\N
chat	B03200097	1J0	72		\N
chat	B03200082	1J0	87	who is 15	Sabrina
chat	B03200102	1J0	86	Does Alice say that she is 16?	Alice
chat	193001	1J0	19	Who tells Ellarose that she is from Taiwan?	Alice
chat	B03200082	1J0	88	who is 18	Sabrina
chat	B03200012	1J0	128	who isn't beautiful	Cheney
chat	B03200102	1J0	87		\N
chat	B03200082	1J0	89	who isn't 16	Lisa1
chat	B03200087	1J0	2	who is Mandy?	Alice
chat	B03200082	1J0	90	who isn't 15	Cheney
chat	B03200102	1J0	88		\N
chat	B03200097	1J0	73	Who is a student?	Alice
chat	B03200082	1J0	91	who isn't 18	Cherry2
chat	B03200037	1J0	15		\N
chat	B03200012	1J0	129	who is young	Ariel
chat	B03200092	1J0	19	who is a girl ?	Mandy
chat	B03200046	1J0	107		\N
chat	B03200050	1J0	28	Who is girl?	Alice
chat	B03200082	1J0	92	who is from usa	Sabrina
chat	B03200012	1J0	130	who isn't young	Ariel
chat	B03200046	1J0	108		\N
chat	B03200082	1J0	93	who isn't from taiwan	Demi
chat	B03200031	1J0	14		\N
chat	B03200031	1J0	15	Does Ellarose say that she is 16	Yes
chat	B03200097	1J0	74	who is female	Sabrina
chat	B03200031	1J0	16	Does Ellarose say that she is 16?	--
chat	B03200083	1J0	1		\N
chat	B03200087	1J0	3	when Taiwan is beautiful	Annie
chat	B03200088	1J0	15		\N
chat	B03200029	1J0	41	Does Mandy say she is girl?	Yes
chat	B03200029	1J0	42	Does Mandy say she is 19?	Yes
chat	B03200050	1J0	29	Who is handsome?	Andy
chat	B01202106	1J0	2	Who is from  Turkey?	Ariel
chat	B03200031	1J0	17	Is she a student?	Yes
chat	B03200046	1J0	109	who is beautiful girl?	Ariel
chat	B03200012	1J0	131	who is from Taiwan	Alice
chat	B03200074	1J0	14		\N
chat	B03200097	1J0	75	whose stranger is Junior	Sabrina
chat	B03200083	1J0	2		\N
chat	B03200074	1J0	15	Is Alice from Taiwan	Yes
chat	B03200089	1J0	1		\N
chat	B03200050	1J0	30		\N
chat	B03200087	1J0	4	who is Demi?	Alice
chat	B03200082	1J0	94	who isn't from Ariel	Alice
chat	B03200050	1J0	31		\N
chat	B03200082	1J0	95	who isn't from Ariel	Ariel
chat	B01202106	1J0	3	Who is from USA?	Mandy
chat	B03200006	1J0	1		\N
chat	B03200031	1J0	18	IS he 16?	Yes
chat	B03200012	1J0	132	who isn't 16	Jessie
chat	B03200029	1J0	43	Does Stranger say he is 16?	Yes
chat	B03200097	1J0	76	whose name is beautiful	Sabrina
chat	B03200078	1J0	13		\N
chat	B03200062	1J0	16		\N
chat	B03200031	1J0	19	Is he 16?	Yes
chat	B01202106	1J0	4	Who is from the USA?	Sabrina
chat	B03200046	1J0	110		\N
chat	B03200056	1J0	19		\N
chat	B03200046	1J0	111		\N
chat	B03200012	1J0	133	who is good	Andy
chat	B03200097	1J0	77	whose age is 18	Sabrina
chat	B03200087	1J0	5	who woman is beautiful ?	Jessie
chat	B03200050	1J0	32	isn't he old?	No
chat	B03200046	1J0	112	Is she beautiful?	--
chat	B03200012	1J0	134	who isn't good	Demi
chat	B03200029	1J0	44	Does Alice say she is student?	Yes
chat	B03200082	1J0	96	who is young	Andy
chat	B03200089	1J0	2	Who is not 18?	Andy
chat	B03200012	1J0	135	who is a girl	Alice
chat	B03200083	1J0	3	What is your name?	Alice
chat	B03200089	1J0	3	Who is not 18?	--
chat	B03200082	1J0	97	who isn't young	Andy
chat	B03200087	1J0	6	who is beautiful ?	Alice
chat	B03200071	1J0	1		\N
chat	B03200089	1J0	4	Who is not 18?	Andy
chat	B03200050	1J0	33	isn't he from Canada?	No
chat	B03200040	1J0	1		\N
chat	B03200097	1J0	78	whose is the beautiful girl	Sabrina
chat	B03200056	1J0	20		\N
chat	B03200012	1J0	136	who is a student	Alice
chat	B03200046	1J0	113	Isn't she come from Taiwan?	Yes
chat	B03200063	1J0	1		\N
chat	B03200087	1J0	7	who is old ?	Maggie
chat	B03200097	1J0	79	who is the beautiful girl	Sabrina
chat	193001	1J0	20		\N
chat	B03200018	1J0	1		\N
chat	B03200071	1J0	2	Does the stranger guess that Sabrina is 18 ?	Sabrina
chat	B03200031	1J0	20	Alice is good girl.	--
chat	B03200083	1J0	4		\N
chat	B03200092	1J0	20	who comes from Turkey ?	Sabrina
chat	B03200083	1J0	5		\N
chat	B03200029	1J0	45	Does the Stranger say he is female?	Yes
chat	B03200056	1J0	21	Is Ariel from Taiwan	No
chat	B03200042	1J0	1		\N
chat	B03200031	1J0	21	Alice is a good girl.	--
chat	B03200012	1J0	137	is she good	Yes
chat	B03200012	1J0	138	isn't she good	Yes
chat	B03200071	1J0	3	Does Alice tell Ellarose that she is from Taiwan ?	Alice
chat	B03200031	1J0	22		\N
chat	B03200078	1J0	14	who is female?	Ariel
chat	B03200097	1J0	80	who asks a stranger how old he is	Mandy
chat	B03200074	1J0	16	Is Marian from Taiwan	Yes
chat	B03200082	1J0	99	who's age is 18	--
chat	B03200089	1J0	5	Doesn't he 18?	Andy
chat	B01202106	1J0	5	Who is from Dora?	--
chat	B03200092	1J0	21	who comes from Turkey ?	Viola1
chat	B03200097	1J0	81	who asks a stranger how old he is	Mandy
chat	B03200046	1J0	115	Doesn't he come from Turkey?	No
chat	B03200082	1J0	100		\N
chat	B03200082	1J0	101		\N
chat	B03200091	1J0	1		\N
chat	B03200071	1J0	4	Does Junior ask Sabrina if she wants to talk on Facebook ?	Sabrina
chat	B03200082	1J0	98	who's age is 15	Mandy
chat	B03200046	1J0	114	Is she come from Turkey?	Yes
chat	B03200012	1J0	139	is he good	Yes
chat	B03200083	1J0	6	are you 18 years old?	No
chat	B03200012	1J0	140	isn't he good	Yes
chat	B03200045	1J0	23		\N
chat	B03200092	1J0	22	who comes from Turkey ?	Annie
chat	B03200006	1J0	2		\N
chat	B03200056	1J0	22	Is Cheney from Taiwan	No
chat	B03200042	1J0	2	Is Alice from taiwan?	Alice
chat	B03200092	1J0	23	who comes from Turkey ?	Alice
chat	B03200092	1J0	24	who comes from Turkey ?	Andy
chat	B03200088	1J0	16		\N
chat	B03200037	1J0	16		\N
chat	B03200052	1J0	8		\N
chat	B03200012	1J0	141	is she right	Yes
chat	B03200045	1J0	24	Dose alice come from Taiwan?	--
chat	B03200012	1J0	142	isn't she right	Yes
chat	B03200042	1J0	3	Who is't young	--
chat	B03200089	1J0	6	Who isn't 23?	Ariel
chat	B03200042	1J0	4	Who is't young	Demi
chat	B03200045	1J0	25	Does Alice come from Taiwan?	--
chat	B03200012	1J0	143	is he right	Yes
chat	B03200087	1J0	8	who is come?	Annie
chat	B03200092	1J0	25		\N
chat	B01202104	1J0	1		\N
chat	B03200083	1J0	9	who is your classmate?	Maggie
chat	B03200013	1J0	18	Does Mandy say that she is from Taiwan?	Yes
chat	B03200034	1J0	1		\N
chat	B03200074	1J0	17		\N
chat	B03200052	1J0	9	Does she is young	Alice
chat	B03200074	1J0	18		\N
chat	B03200056	1J0	25	Is Cherry2 from Taiwan	No
chat	B03200082	1J0	106	does ariel a student ?	Yes
chat	B03200042	1J0	7	Who is from the Turkey?	--
chat	B03200006	1J0	3	Does she come?	Yes
chat	B03200039	1J0	31		\N
chat	B03200003	1J0	27		\N
chat	B03200040	1J0	6	is she from USA?	Ariel
chat	B03200012	1J0	148	is she old	Yes
chat	B03200063	1J0	7	does Filibee come from Taiwan	Yes
chat	B03200056	1J0	28	who is Ellarose?	Maggie
chat	B03200003	1J0	28		\N
chat	B03200054	1J0	22	Does a stranger ask Mandy if she is male or female?	No
chat	B03200078	1J0	19		\N
chat	B03200029	1J0	48	Does Sabrina tell the stranger she can't understand he means	--
chat	B03200019	1J0	31		\N
chat	B03200029	1J0	50	Does Sabrina tell the stranger she is student?	Yes
chat	B01202104	1J0	2	Who is 21	Alice
chat	B03200063	1J0	9	does YiSian come from USA	No
chat	193001	1J0	21		\N
chat	B03200089	1J0	10	Who is from Taiwan?	--
chat	B03200082	1J0	124	is she study in must?	Mandy
chat	B03200056	1J0	30	Who is man 	Ariel
chat	B03200063	1J0	10	does YiSian come from Turkey	No
chat	B03200019	1J0	33	Who is from USA ?	Andy
chat	B03200050	1J0	34	doesn't he like Alice?	No
chat	B03200082	1J0	115	how old he is ?	Yes
chat	B03200029	1J0	49	Does Sabrina tell the stranger she can't understand he means?	Yes
chat	B03200082	1J0	118	how old he is ?	Sabrina
chat	B03200088	1J0	19	Who is the male man?	--
chat	B03200060	1J0	2	Does Ariel come from Taiwan?	--
chat	B03200056	1J0	29	who isn't 18	Viola1
chat	B03200013	1J0	22	Who is from Turkey?	Viola1
chat	B03200071	1J0	10	does she happy ?	Yes
chat	B03200050	1J0	38	when he come to Taiwan?	--
chat	B03200082	1J0	120	who is age 18	Sabrina
chat	B03200078	1J0	21	who is young?	Mandy
chat	B03200006	1J0	4	Does Alice tell Andy her name?	No
chat	B03200094	1J0	1		\N
chat	B03200083	1J0	7		\N
chat	B03200082	1J0	102	does he come from usa?	Yes
chat	B03200012	1J0	144	isn't he right	Yes
chat	B03200097	1J0	82	who is from Taiwan	Sabrina
chat	B03200083	1J0	8		\N
chat	B03200037	1J0	17	who is Dora?	Dora
chat	B03200029	1J0	46	Does the Stranger say she is female?	Yes
chat	B03200088	1J0	17	who is old?	--
chat	B03200042	1J0	5	Is it 22	--
chat	B03200045	1J0	26		\N
chat	B03200045	1J0	27		\N
chat	B03200082	1J0	103	doesn't he come from turkey?	No
chat	B03200056	1J0	23	Is Stefan from Taiwan	No
chat	B03200082	1J0	104	doesn't he come from turkey?	Yes
chat	B03200071	1J0	5	Does the stranger guess Sabrina's age correctly?	Sabrina
chat	B03200013	1J0	17		\N
chat	B01202106	1J0	6	Is Alice a good girl?	--
chat	B03200063	1J0	2	does Alice come from taiwan	--
chat	B03200054	1J0	18		\N
chat	B03200046	1J0	116	Does she understand it ?	Yes
chat	B03200063	1J0	3	does Alice come from taiwan	Yes
chat	B03200012	1J0	145	who is 19	Ariel
chat	B03200040	1J0	2	what does she like?	Ariel
chat	B03200082	1J0	105	doesn't he come from Taiwan ?	Yes
chat	B03200050	1J0	35		\N
chat	B03200056	1J0	24	Is Annie from Taiwan	No
chat	B03200078	1J0	15	Who is girl?	Ariel
chat	B03200089	1J0	7	Is she 23?	Jessie
chat	B03200087	1J0	9	when Andy is come.	Andy
chat	B03200050	1J0	36		\N
chat	B03200039	1J0	28		\N
chat	B03200012	1J0	146	who isn't 19	Alice
chat	B03200063	1J0	4	does Alice come from Taiwan	Yes
chat	B03200040	1J0	3	which does she like?	Ariel
chat	B03200042	1J0	6	Who is from the Turkey	--
chat	B03200071	1J0	6	who is boy ?	Andy
chat	B03200045	1J0	28	Does Alice come from Taiwan?	No
chat	B03200089	1J0	8	Who isn't young?	--
chat	B03200082	1J0	107	does ariel student ?	Yes
chat	B03200078	1J0	16		\N
chat	B03200082	1J0	109	does ariel a man ?	Yes
chat	B03200082	1J0	110	does ariel a man ?	--
chat	B03200063	1J0	5	does Ariel come from Taiwan	Yes
chat	B03200037	1J0	19	who is beautiful ?	Demi
chat	B03200045	1J0	29		\N
chat	B03200082	1J0	112	does ariel good ?	No
chat	B03200091	1J0	2		\N
chat	B03200013	1J0	21		\N
chat	B03200078	1J0	18	is she a girl?	Yes
chat	B03200054	1J0	20		\N
chat	B03200052	1J0	11	Is she from USA	Annie
chat	B03200060	1J0	1		\N
chat	B03200063	1J0	6	does Ellarose come from Taiwan	Yes
chat	B03200052	1J0	13		\N
chat	B03200071	1J0	8		\N
chat	B03200071	1J0	9		\N
chat	B03200037	1J0	20	Is he a student?	Andy
chat	B03200012	1J0	149	isn't she old	Yes
chat	B03200078	1J0	20		\N
chat	B03200097	1J0	85	is Sabrina's name beautiful	Yes
chat	B03200082	1J0	116		\N
chat	B03200082	1J0	117		\N
chat	B03200019	1J0	32	where she is from	Viola1
chat	B03200082	1J0	119	how old he is ?	Mandy
chat	B03200012	1J0	150	is she 23	Yes
chat	B03200042	1J0	8	Who is 16	--
chat	B03200089	1J0	9	Whose age isn't 23?	Dora
chat	B03200063	1J0	8	does YiSian come from Taiwan	Yes
chat	B03200087	1J0	11	who like Jack?	Alice
chat	B03200082	1J0	121	who is 18	--
chat	B03200039	1J0	32	Who  is Ariel	--
chat	B03200046	1J0	118	Is he understand that he is from Turkey?	Yes
chat	B03200037	1J0	21	who is from USA	Dora
chat	B03200082	1J0	123	where is she study?	Sabrina
chat	B03200097	1J0	86	is he from Turkey 	No
chat	B03200012	1J0	152	who is  Alice	Alice
chat	B03200094	1J0	2	Who is a positived person?	Alice
chat	B03200037	1J0	18	who is the handsome boy	Andy
chat	B03200097	1J0	83		\N
chat	B03200039	1J0	29	Who  is Alice	--
chat	B03200097	1J0	84		\N
chat	B03200078	1J0	17		\N
chat	B01202106	1J0	7	Who is from Taiwan?	Ariel
chat	B03200082	1J0	108	does ariel man ?	Yes
chat	B03200050	1J0	37	whose hair is short?	Cheney
chat	B03200029	1J0	47	Does Sabrina ask the stranger to guess how old she is?	Yes
chat	B03200052	1J0	10	Is she from 	--
chat	B03200092	1J0	26	He comes from Turkey,doesn't he ?	Yes
chat	B03200082	1J0	111	does ariel good ?	Yes
chat	B03200013	1J0	19	Who is a beautiful female?	--
chat	B03200054	1J0	19		\N
chat	B03200013	1J0	20		\N
chat	B03200039	1J0	30	Who is Mandy	--
chat	B03200040	1J0	4	is she from taiwan?	Ariel
chat	B03200082	1J0	113	 ariel good ?	Yes
chat	B03200056	1J0	26		\N
chat	B03200071	1J0	7	does she old ?	Maggie
chat	B03200088	1J0	18	Is Cheney beautiful?	Yes
chat	B03200003	1J0	26		\N
chat	B03200087	1J0	10	who female from MUST?	Mandy
chat	B03200054	1J0	21	Does Mandy ask a stranger how old he is?	Yes
chat	B03200012	1J0	147	who is a freshman	Ariel
chat	B03200056	1J0	27	who is Ellarose?	--
chat	B03200040	1J0	5	is she from usa?	Ariel
chat	B01202106	1J0	8	Isn't Alice from Taiwan?	Alice
chat	B03200046	1J0	117	Does she tell stranger?	Yes
chat	B03200082	1J0	114	aren't they good ?	Yes
chat	B03200052	1J0	12		\N
chat	B03200054	1J0	23	is she 22	Yes
chat	B01202104	1J0	3		--
chat	B03200110	1J0	1		\N
chat	B03200082	1J0	122	who is 15	Maggie
chat	B03200012	1J0	151	who is a Alice	Alice
chat	B03200013	1J0	23		\N
chat	B03200060	1J0	3	she is a student.	Alice
chat	B01202104	1J0	4		--
chat	B03200071	1J0	11	who is 22 ?	Yes
chat	B03200082	1J0	125	who study in must?	Sabrina
chat	B03200029	1J0	51	Does Sabrina say the she is from Taiwan?	Yes
chat	B03200097	1J0	87	is he from Taiwan 	No
chat	B03200060	1J0	4	Jessie is a student.	--
chat	B03200063	1J0	11	does Alice come from Turkey	No
chat	B03200087	1J0	12	is Junior old?	Dora
chat	B03200082	1J0	126	who is 22	Mandy
chat	B03200078	1J0	22		\N
chat	B01202104	1J0	5	Isn't she 21?	Alice
chat	B03200082	1J0	127	who is 23	--
chat	B03200078	1J0	23	who is young?	Lisa1
chat	B03200060	1J0	5	Jack is a student.	--
chat	B03200046	1J0	119	Does the stranger whom Mandy greets ask her how old she is	--
chat	B03200082	1J0	128	who is 21	--
chat	B03200050	1J0	39	who is fat?	Cheney
chat	B03200046	1J0	120	Does the stranger whom Mandy greets ask her how old she is	Yes
chat	B03200088	1J0	20	Doesn't he old?	Yes
chat	B03200089	1J0	11	Who is from USA?	Dora
chat	B03200012	1J0	153	whose age is 19	Ariel
chat	B03200056	1J0	31	Who is 10	Sabrina
chat	B03200082	1J0	129	who is female	Alice
chat	B03200006	1J0	5	Is she come from Taiwan?	Yes
chat	B03200060	1J0	6	Mandy is a student.	--
chat	B03200032	1J0	1		\N
chat	B03200019	1J0	34	Who is from Madison in the USA	Cheney
chat	B03200054	1J0	24	Does Ellarose say that she is 16?	Yes
chat	B01202104	1J0	6	Is it 21?	Alice
chat	B03200078	1J0	24	who isn't female?	Dora
chat	B03200063	1J0	12		\N
chat	B03200097	1J0	88	Isn't he a student?	No
chat	B03200082	1J0	130	who is female 	Sabrina
chat	B03200063	1J0	13		\N
chat	B03200039	1J0	33	Who study in MUST	--
chat	B03200054	1J0	25	Does Ariel greet Filibee?	Yes
chat	B03200056	1J0	32		\N
chat	B03200060	1J0	7	Mandy is a student?	Mandy
chat	B03200046	1J0	121	Is she 16?	Yes
chat	B03200078	1J0	25	who isn't female?	Sabrina
chat	B03200012	1J0	154	who is a good girl	Alice
chat	B03200019	1J0	35		\N
chat	B03200082	1J0	131	who is man	Maggie
chat	B03200019	1J0	36		\N
chat	B03200091	1J0	3	Is she old?	--
chat	B03200039	1J0	34		\N
chat	B03200056	1J0	33	who is Andy?	Andy
chat	B03200097	1J0	89	is she from Turkey 	Yes
chat	B03200019	1J0	37	Does Ariel tell Filibee that she is from Taiwan	Yes
chat	B03200032	1J0	2		\N
chat	B03200039	1J0	35		\N
chat	B03200078	1J0	26	who is mandy ?	Mandy
chat	B03200088	1J0	21	Is Alice come from Taiwan?	Yes
chat	B03200037	1J0	22	is he 18	Andy
chat	B03200092	1J0	27		\N
chat	B03200060	1J0	8	Does Ariel greet Alice?	--
chat	B03200013	1J0	24	Who is Andy?	Andy
chat	B03200054	1J0	26	Does the stranger say that he is 16	No
chat	B03200089	1J0	12	Isn't she from Taiwan?	Maggie
chat	B03200082	1J0	132	who is male	Andy
chat	B03200062	1J0	17	Who talk to the stranger?	--
chat	B03200054	1J0	27	Does the stranger say that he is 16	Yes
chat	B03200056	1J0	34	who is Jack?	Mandy
chat	B03200097	1J0	90	isn't she from Turkey 	No
chat	B03200092	1J0	28	who is alice ?	Alice
chat	B03200078	1J0	27	who is Mandy ?	Mandy
chat	B03200029	1J0	52	Does the stranger say he want Facebook?	Yes
chat	B03200019	1J0	38	Does Ariel greet Filibee.	No
chat	B03200046	1J0	122	Doesn't she come Taiwan?	Yes
chat	B03200091	1J0	4	Is she old?	Andy
chat	B01202106	1J0	9	Who comes from Taiwan?	Alice
chat	B03200013	1J0	26		\N
chat	B03200060	1J0	9	Who is Alice?	--
chat	B03200094	1J0	3	Who is young?	Alice
chat	B03200012	1J0	155	is Ellarose  16	Yes
chat	B03200078	1J0	28	who is16?	Annie
chat	B03200110	1J0	3	Who is from the USA?	Andy
chat	B03200092	1J0	30	who is Alice ?	Alice
chat	B03200082	1J0	135	who isn't 19	Viola1
chat	B03200082	1J0	136		--
chat	B03200078	1J0	29	who is 16 ?	Mandy
chat	B03200012	1J0	156	isn't Ellarose 16	Yes
chat	B01202106	1J0	10	Who is 21 years old?	Alice
chat	B03200050	1J0	40	who is handsome boy?	Andy
chat	B03200082	1J0	137	who isn't 15	Mandy
chat	B03200110	1J0	2	Who is from the USA?	Andy
chat	B03200013	1J0	25	Where is USA?	--
chat	B03200037	1J0	23	who is a younger girl ?	Demi
chat	B03200013	1J0	27		\N
chat	B03200097	1J0	91	Isn't Cherry2 from Taiwan 	No
chat	B03200088	1J0	22	Is Jessie younger than Andy?	Yes
chat	B03200054	1J0	28	aren't they beautiful	No
chat	B03200046	1J0	123	isn't she beautiful?	Yes
chat	B03200094	1J0	4	who is stranger	Viola1
chat	B03200019	1J0	42	Does Sabrina say that she is a girl.  	Yes
chat	B03200092	1J0	29	who is lice ?	--
chat	B03200082	1J0	133	who isn't 23	Lisa1
chat	B01202104	1J0	7	Who is from the Taiwan	Alice
chat	B03200019	1J0	39	Does Filibee tell Ariel that he is from Turkey. 	No
chat	B03200082	1J0	134	who isn't 21	Demi
chat	B03200019	1J0	40	Does a stranger greet Sabrina. 	Yes
chat	B03200089	1J0	13	is he 23?	--
chat	B03200029	1J0	53		\N
chat	B03200056	1J0	35	who is young	Andy
chat	B03200019	1J0	41	Does the stranger say he is male.	Yes
chat	B03200034	1J0	2		\N
chat	B03200087	1J0	13		\N
chat	B03200054	1J0	29	aren't they beautiful	Yes
chat	B03200082	1J0	138	who isn't right	Annie
chat	B03200087	1J0	14		\N
chat	B03200013	1J0	28	Who is Andy?	Andy
chat	B03200091	1J0	5		--
chat	B03200082	1J0	139	who is right	Andy
chat	B03200087	1J0	15		\N
chat	B03200060	1J0	10	Where are you from?	--
chat	B03200097	1J0	92	Is Cherry2 from USA 	No
chat	B03200013	1J0	29	Who is Demi?	--
chat	B03200087	1J0	16	is Sabrina beautiful?	Yes
chat	B01202106	1J0	11	Who is 19 ?	Alice
chat	B03200037	1J0	24	Who isn't 18?	Cherry2
chat	B03200082	1J0	140	who is greet	Sabrina
chat	B03200082	1J0	141	who is greet	Ariel
chat	B03200092	1J0	31	who is Alice ?	Mandy
chat	B03200060	1J0	11	Alice is a woman.	--
chat	B03200012	1J0	157	isn't he 18	Yes
chat	B01202104	1J0	8	Isn't Sabrina from Taiwan?	Sabrina
chat	B03200063	1J0	14	Who is 19 year old?	Andy
chat	B03200006	1J0	6	Does she come to MUST	Yes
chat	B03200019	1J0	43	Does the stranger guess that Sabrina is 18. 	Yes
chat	B03200082	1J0	142	who is student	Demi
chat	B03200088	1J0	23	Is Jessie younger than Andy?	Yes
chat	B03200074	1J0	19	whose age is 19	Demi
chat	B03200088	1J0	24	Is Jessie younger than Andy?	Yes
chat	B03200054	1J0	30	Does Alice tell Ellarose that she is from Taiwan?	Yes
chat	B03200046	1J0	124		\N
chat	B01202106	1J0	12	who is 21?	--
chat	B03200019	1J0	44	Does Junior tell Sabrina that he is from LA.	No
chat	B03200019	1J0	45	Does Junior tell Sabrina that he is from LA.	Yes
chat	B03200029	1J0	54	Who is like Canada girl?	Andy
chat	B01202104	1J0	9	Is Sabrina a good girl?	Sabrina
chat	B03200082	1J0	143	who isn't student	Sabrina
chat	B03200089	1J0	14	does Ariel come from Turkey?	Jessie
chat	B03200046	1J0	125		\N
chat	B03200110	1J0	4	Whose name is beautiful?	Mandy
chat	B03200060	1J0	12	Is Alice from Turkey?	--
chat	B03200013	1J0	30	Is he 15?	--
chat	B03200094	1J0	5	whose stranger is beautiful?	Mandy
chat	B03200110	1J0	5	Whose name is beautiful?	Mandy
chat	B03200082	1J0	144	who isn't beautiful	Sabrina
chat	B03200046	1J0	126	Who is 15?	Annie
chat	B03200082	1J0	145	who is beautiful	Demi
chat	B03200029	1J0	55	Who is andy?	Andy
chat	B03200060	1J0	13	Is he from Turkey?	Andy
chat	B03200054	1J0	31	is he good	Yes
chat	B03200062	1J0	18	Who is a student?	--
chat	B03200019	1J0	46	Does Alice tell Ellarose she is a freshman. 	No
chat	B03200013	1J0	31	Who is Cheney?	Cheney
chat	B03200037	1J0	25	Who is the MUST?	Demi
chat	B03200050	1J0	41	who likes to eat?	Cheney
chat	B03200082	1J0	146	who is guess	Alice
chat	B03200046	1J0	127	who is18	Ariel
chat	B03200029	1J0	56	Who is man?	Andy
chat	B03200078	1J0	30	who is Lisa?	Lisa1
chat	B03200019	1J0	47	Does Mandy ask a stranger how old he is.  	Yes
chat	B01202106	1J0	13	who come from Taiwan?	--
chat	B03200097	1J0	93	Is Ellarose female	Yes
chat	B03200012	1J0	158	is YiSian from Taiwan	Yes
chat	B03200013	1J0	32	Who is Cheney	Cheney
chat	B03200046	1J0	128	who is from Taiwan?	Ariel
chat	B03200082	1J0	147	who is old	Alice
chat	B03200012	1J0	159	isn't YiSian from Taiwan	Yes
chat	B01202106	1J0	14	Who come from Taiwan?	--
chat	B03200063	1J0	15	Who is 19  old?	Maggie
chat	B03200082	1J0	148	who isn't old	Lisa1
chat	B03200078	1J0	31	who is Lisa1 ?	Lisa1
chat	B03200019	1J0	48	Does Junior ask Sabrina if she wants to talk on Facebook.	Yes
chat	B03200097	1J0	94	Isn't Ellarose female	No
chat	B03200054	1J0	32	Isn't she 20	Yes
chat	B03200037	1J0	26	Who is Jessie	Jessie
chat	B03200082	1J0	149	who isn't old	Cheney
chat	B03200054	1J0	33	Isn't she 20	No
chat	B03200013	1J0	33		\N
chat	B03200110	1J0	6	Whose name is beautiful?	Dora
chat	B03200089	1J0	15		\N
chat	B03200013	1J0	34		\N
chat	B03200019	1J0	49	Does Junior ask if Sabrina wants to talk to him. 	No
chat	B03200054	1J0	34	Isn't she 19	Yes
chat	B03200039	1J0	36		\N
chat	B03200046	1J0	129	Who is young?	Andy
chat	B03200029	1J0	57	Who the man is ugly?	Andy
chat	B03200094	1J0	6	who is female?	Dora
chat	B01202106	1J0	15	Who is 19 ?	--
chat	B03200019	1J0	50	Does Sabrina ask the stranger to guess how old she is.	Yes
chat	B03200097	1J0	95	isn't Junior female	Yes
chat	B03200063	1J0	16	Who is from Taiwan?	Jessie
chat	B01202104	1J0	10	Is she 21?	Alice
chat	193001	1J0	22	Does Mandy tell a stranger she is from Taiwan?	No
chat	B03200089	1J0	16	Isn't she from Turkey?	Yes
chat	B01202106	1J0	16	who is old?	--
chat	B03200046	1J0	130	Who is young?	Andy
chat	B03200082	1J0	150	who isn't disconnect	Mandy
chat	B03200019	1J0	51	Does Sabrina understand Junior's question.	No
chat	B03200046	1J0	131	Who is young?	Andy
chat	B03200082	1J0	151	who is disconnect	Lisa1
chat	B03200013	1J0	35		\N
chat	B03200060	1J0	14	Where is Dora from?	Dora
chat	B03200046	1J0	132		\N
chat	B03200097	1J0	96	is Junior female 	No
chat	B03200063	1J0	17		\N
chat	B03200063	1J0	18		\N
chat	B03200094	1J0	7		\N
chat	B03200012	1J0	160	is Marian  from Taiwan	Yes
chat	B03200094	1J0	8		\N
chat	B03200042	1J0	9	Who is Alice?	--
chat	B03200063	1J0	19		\N
chat	B03200029	1J0	58	Who is overweight?	Andy
chat	B03200012	1J0	161	is Marian  from Taiwan	No
chat	B01202104	1J0	11	is she from Turkey	Alice
chat	B03200089	1J0	17	Isn't Dora from Turkey?	--
chat	B01202106	1J0	17	who isn't 23?	--
chat	B03200097	1J0	97	is Marian female 	Yes
chat	B03200046	1J0	133	who is a good man?	Andy
chat	B03200012	1J0	162	isn't Marian from Taiwan	Yes
chat	B03200003	1J0	29	Does Annie come from USA?	Alice
chat	B03200087	1J0	17	Is Andy like Junior?	No
chat	B03200083	1J0	10	Who is your best friend?	Maggie
chat	B03200013	1J0	36	Who is a beautiful female	Alice
chat	B03200097	1J0	98	isn't Marian female 	No
chat	B03200034	1J0	3	who is 18	Alice
chat	B01202106	1J0	18	Is she 18?	--
chat	B03200110	1J0	7		\N
chat	B03200012	1J0	163	is Marian from Taiwan	Yes
chat	B03200013	1J0	37		\N
chat	B03200006	1J0	7	Isn't he old?	Yes
chat	B03200039	1J0	37	Whose number is 16	--
chat	B03200110	1J0	8		\N
chat	B03200012	1J0	164	isn't he 18	Yes
chat	B03200019	1J0	52		\N
chat	B03200019	1J0	53		\N
chat	B03200042	1J0	11		\N
chat	B01202106	1J0	22	Isn't she form Turkey?	--
chat	B03200097	1J0	101	is Filibee female 	Yes
chat	B03200046	1J0	137	who like to  talk to stranger?	Mandy
chat	B03200013	1J0	40	who is Cheney	Cheney
chat	B01202104	1J0	12	Who is Dora?	Dora
chat	B03200083	1J0	13	Do you live in Hsinchu?	No
chat	B03200003	1J0	30	Who is the most beautiful girl?	Annie
chat	B03200019	1J0	55	Who watches movies or listen music?	Maggie
chat	B01202106	1J0	23	Isn't she from Turkey?	--
chat	B03200012	1J0	167	isn't she from Turkey	No
chat	B03200042	1J0	12	Whose age is 22	--
chat	B03200094	1J0	10	Who doesn't understand?	Viola1
chat	B03200018	1J0	3	is he 18 	Yes
chat	B03200097	1J0	102	isn't Filibee female 	Yes
chat	B03200034	1J0	4	Doess Andy  tell ?	Andy
chat	B03200046	1J0	138	who is MUST student?	Maggie
chat	B03200060	1J0	16	when does Alice wake up?	--
chat	B03200110	1J0	11	Isn't he 100?	--
chat	B03200060	1J0	18	when does Alice wake up?	--
chat	B03200060	1J0	19	when does Alice wake up?	--
chat	B01202106	1J0	24	isn't Maggie  from Turkey	--
chat	B03200074	1J0	20	who isn't 20	Alice
chat	B03200087	1J0	19	are they from Taiwan?	Yes
chat	B03200063	1J0	22	who is male	Alice
chat	B03200074	1J0	21	who isn't 21	Alice
chat	B03200110	1J0	14		\N
chat	B03200012	1J0	169	is he a man	Yes
chat	B03200018	1J0	7	is he 18	Yes
chat	B03200029	1J0	60	Who is tell to Stefan?	Andy
chat	B03200046	1J0	140	Whose age is 16	Dora
chat	B03200087	1J0	20	are they from Turkey?	Yes
chat	B03200012	1J0	171	is she a female	Yes
chat	B03200097	1J0	107	is he 15	No
chat	B03200013	1J0	45	Does Cheney tell Andy he is from Taiwan	--
chat	B03200089	1J0	21	Is it right?	Yes
chat	B03200013	1J0	46	Does Cheney tell Andy he is from Taiwan	--
chat	B03200082	1J0	164	Doesn't he come?	Yes
chat	B03200012	1J0	172	is she a female	Yes
chat	B03200092	1J0	34	who is Cherry2?	Cherry2
chat	B03200082	1J0	165	Doesn't she come?	--
chat	B03200087	1J0	22	who is Dora?	Alice
chat	B03200082	1J0	167	Does she come?	Yes
chat	B03200091	1J0	12		\N
chat	B03200013	1J0	49	Does Cheney tell Andy he is from Taiwan	Yes
chat	B03200110	1J0	15	Who is the handsome boy?	Andy
chat	B03200018	1J0	8	isn't she good	Yes
chat	B03200012	1J0	174	does she say that she is from Taiwan	Yes
chat	B03200082	1J0	171	Whose age is 19	Yes
chat	B03200082	1J0	172	Whose age is 15	Yes
chat	B03200094	1J0	12	Who is good girl ?	Annie
chat	B03200012	1J0	175	doesn't she say that she is from Taiwan	Yes
chat	B03200012	1J0	176	who comes from Taiwan	Maggie
chat	193001	1J0	23	Does Mandy tell a stranger that she is from Taiwan?	No
chat	B03200063	1J0	20	who is from Taiwan	Annie
chat	B03200013	1J0	38		\N
chat	B01202106	1J0	19	Is he 18?	--
chat	B03200046	1J0	134	who is a student?	Ariel
chat	B03200062	1J0	19		\N
chat	B03200094	1J0	9	Who age is 23?	Cheney
chat	B03200097	1J0	99	is YiSian female 	Yes
chat	B03200012	1J0	165	isn't he 18	No
chat	B03200060	1J0	15	Where is Mandy from?	Mandy
chat	B03200082	1J0	152		\N
chat	193001	1J0	24	Does Mandy tell a stranger that she is from the USA?	No
chat	B03200018	1J0	2		\N
chat	B03200013	1J0	39	Who is Cheney	--
chat	B03200046	1J0	136	who is talk to stranger?	Mandy
chat	B03200042	1J0	10		\N
chat	B03200082	1J0	154	Is Alice from Taiwan	Yes
chat	B03200013	1J0	41		\N
chat	B03200013	1J0	42		\N
chat	B03200110	1J0	10	Isn't he 100?	Andy
chat	B03200060	1J0	17	when does Alice wake up?	--
chat	B03200082	1J0	155	Isn't Annie from Taiwan	Yes
chat	B03200042	1J0	13	Who is Jessie	--
chat	B03200029	1J0	59	Who is college student from Taiwan?	Andy
chat	B03200012	1J0	168	who comes from Taiwan	Alice
chat	B03200063	1J0	21	who is female?	Alice
chat	B03200046	1J0	139	whose name is from Turkey?	Mandy
chat	B03200091	1J0	8	Who is young?	Alice
chat	B03200110	1J0	12	Isn't he a doctor?	Andy
chat	B03200082	1J0	156	Isn't Cheney beautiful	No
chat	B03200082	1J0	157	Isn't she from USA	Yes
chat	B03200060	1J0	20	Why does  Dora angry?	--
chat	B03200082	1J0	158	Isn't he from USA	Yes
chat	B03200082	1J0	159	Isn't he from USA	--
chat	B03200034	1J0	5	Is Ariel a positive person	--
chat	B03200091	1J0	9		\N
chat	B01202106	1J0	25	Isn't Dora from Taiwan?	--
chat	B03200091	1J0	11		\N
chat	B03200097	1J0	105	is he 21	No
chat	B03200092	1J0	32	WHO IS CHARRY2?	Cherry2
chat	B03200082	1J0	160	Isn't he from Taiwan	Yes
chat	B03200018	1J0	6	is he 18	--
chat	B03200037	1J0	27	Who is from Taiwan ?	Viola1
chat	B03200082	1J0	161	Isn't he from Taiwan	Yes
chat	B03200097	1J0	106	is he 23	No
chat	B03200013	1J0	44	Does Cheney tell Andy he is from Taiwan	Yes
chat	B03200083	1J0	15	is anything good?	Yes
chat	B03200029	1J0	61	Who is talk with Stefan?	Andy
chat	B03200082	1J0	162	Doesn't she come?	Yes
chat	B03200092	1J0	33	who is cherry2?	Cherry2
chat	B03200082	1J0	163	Doesn't she come?	--
chat	B03200046	1J0	141	whose student is 20?	Demi
chat	B03200062	1J0	20	who is Stefan?	--
chat	B03200013	1J0	47	Does Cheney tell Andy he is from Taiwan	--
chat	B03200013	1J0	48	Does Cheney tell Andy he is from Taiwan	--
chat	B03200082	1J0	166	Does she come?	--
chat	B03200012	1J0	173	isn't she a female	Yes
chat	B03200046	1J0	142	who is female?	Mandy
chat	B03200037	1J0	28	isn't he handsome ?	Alice
chat	B03200092	1J0	35	who is Cherry2?	Cherry2
chat	B03200097	1J0	108	Is she a student?	Yes
chat	B03200029	1J0	62	Whose country is Taiwan?	Andy
chat	B03200018	1J0	9	isn't he good	Yes
chat	B03200089	1J0	22	Isn't it old?	No
chat	B03200094	1J0	11	Who is good boy?	Andy
chat	B03200046	1J0	143	who is Taiwan student?	Maggie
chat	B03200110	1J0	16		\N
chat	B03200087	1J0	23	who is Andy?	Dora
chat	B03200110	1J0	17		\N
chat	B03200029	1J0	63	Who is 19?	Andy
chat	B03200089	1J0	23	Is it old?	No
chat	B03200082	1J0	168	Whose age is 23	Yes
chat	B03200082	1J0	170	Whose age is 21	No
chat	B03200056	1J0	36		\N
chat	B03200082	1J0	173	Whose age isn't 16	Yes
chat	B03200052	1J0	15		\N
chat	B03200082	1J0	174	Whose age is 15	Yes
chat	B03200046	1J0	145	who greet to Mandy?	--
chat	B03200046	1J0	146	who greet to Mandy?	Maggie
chat	B03200089	1J0	24	Isn't it beautiful?	Yes
chat	B03200082	1J0	175	Whose age isn't 15	Yes
chat	B03200063	1J0	24	who is talk in Hispanic?	Ariel
chat	B03200082	1J0	176	Whose age is 21	--
chat	B03200050	1J0	42		\N
chat	B03200050	1J0	43		\N
chat	B03200110	1J0	9	Whose name is beautiful?	Sabrina
chat	B01202106	1J0	20	Who is 15 ?	--
chat	B03200091	1J0	6	Who is young?	Alice
chat	B03200089	1J0	18	Isn't Dora beautiful?	Yes
chat	B03200087	1J0	18	Is Andy from USA?	Yes
chat	B03200083	1J0	11		\N
chat	B03200083	1J0	12		\N
chat	B03200046	1J0	135	who talk to stranger?	Mandy
chat	B01202106	1J0	21	who is 23?	--
chat	B03200097	1J0	100	isn't YiSian female 	Yes
chat	B03200019	1J0	54		\N
chat	B03200082	1J0	153		\N
chat	B03200012	1J0	166	isn't she from Turkey	Yes
chat	B03200091	1J0	7	Who is young?	Alice
chat	B03200089	1J0	19	Is Dora 23? 	No
chat	B03200013	1J0	43		\N
chat	B03200097	1J0	103	is he 17	No
chat	B03200110	1J0	13		\N
chat	B03200018	1J0	4	is he 21	Yes
chat	B03200097	1J0	104	is he 19	No
chat	B03200083	1J0	14	are you a student?	Yes
chat	B03200089	1J0	20	Is it good?	Yes
chat	B03200060	1J0	21	Why does Dora angry?	--
chat	B03200019	1J0	56	Who is from Turkey.	Cherry2
chat	B03200091	1J0	10		\N
chat	B03200018	1J0	5	isn't she 21	Yes
chat	B03200012	1J0	170	isn't he a man	Yes
chat	B03200087	1J0	21		\N
chat	B99110055	1J0	1		\N
chat	B01202104	1J0	13	Isn't Andy from Taiwan?	Andy
chat	B03200063	1J0	23	who talks  Hispanic?	Andy
chat	B03200052	1J0	14		\N
chat	B03200082	1J0	169	Whose age is 16	No
chat	B03200102	1J0	89	Does Cheney tell Andy he is from Taiwan	--
chat	B03200046	1J0	144	who is a Taiwan student?	Maggie
chat	B01202104	1J0	14	Isn't Jessie from Taiwan?	Jessie
chat	B03200102	1J0	90		\N
chat	B03200110	1J0	18	Is he a gay?	No
chat	B03200110	1J0	19	Is he a gay?	--
chat	B03200087	1J0	24	who is Sabrina?	Sabrina
chat	B03200056	1J0	37	who isn't 25	--
chat	B03200094	1J0	13	whose stranger is MUST?	Sabrina
chat	B03200063	1J0	25	who  talk in Hispanic?	Dora
chat	B03200050	1J0	44		\N
chat	B03200056	1J0	38	who isn't 25	Mandy
chat	B03200082	1J0	177		\N
chat	B03200094	1J0	14	whose stranger is MUST?	Sabrina
chat	B03200102	1J0	91	Does Cheney tell Andy he is from Taiwan	--
chat	B03200097	1J0	109	does Marian come from Taiwan 	Yes
chat	B03200012	1J0	177	who say that she is from Taiwan	Alice
chat	B03200046	1J0	147	who greet to the women?	Annie
chat	B03200083	1J0	16	are you 19?	Yes
chat	B03200082	1J0	178	Whose age isn't 19	No
chat	B03200087	1J0	25	is it from MUST?	No
chat	B03200102	1J0	92		\N
chat	B03200050	1J0	45	Dose Cheney like to eat?	Yes
chat	B03200089	1J0	25	Isn't it right	No
chat	B03200012	1J0	178	doesn't she say that she is from Taiwan	Yes
chat	B03200060	1J0	22	When did Mandy come home?	--
chat	B03200060	1J0	23	When did Mandy come home?	--
chat	B03200052	1J0	16	Does she is a student?	Yes
chat	B03200083	1J0	17	aren't you 19?	No
chat	B03200091	1J0	13	Is Alice from Turkey?	Yes
chat	B03200083	1J0	18	aren't you 19?	Yes
chat	B03200087	1J0	26	is it  MUST?	Yes
chat	B03200060	1J0	24	When did Mandy pregant?	--
chat	B03200097	1J0	110	doesn't Marian come from Taiwan 	No
chat	B03200060	1J0	25	When did Mandy pregant?	--
chat	B03200082	1J0	179	Whose age isn't 18	Yes
chat	B03200046	1J0	148	who is a good MUST student?	--
chat	B03200052	1J0	17	Does she is a student?	Yes
chat	B03200046	1J0	149	who is a good MUST student?	Jessie
chat	B03200082	1J0	180	Whose age isn't 18	Yes
chat	B03200060	1J0	26	When did Mandy suck his boyfriend dick?	--
chat	B03200060	1J0	27	When did Mandy suck his boyfriend dick?	--
chat	193001	1J0	25	Does Mandy tell a stranger that she is from the USA?	No
chat	B03200012	1J0	179	doesn't Filibee  say that she is from Turkey	Yes
chat	B03200102	1J0	93	does Cheney tell Andy he is from Taiwan	Yes
chat	B03200087	1J0	27	Is it Turkey?	Yes
chat	B03200083	1J0	19	isn't it good for you?	Yes
chat	B03200013	1J0	50	Whose name is Alice?	--
chat	B03200046	1J0	150	whose name is Turkey?	--
chat	B03200012	1J0	180	does Filibee  say that she is from Turkey	Yes
chat	B03200050	1J0	46	is Cheney a fat boy?	Yes
chat	B03200052	1J0	18	Doesn't she is a student?	Yes
chat	B03200046	1J0	151	whose name is Turkey?	Dora
chat	B03200091	1J0	14	Is Cheney young?	Yes
chat	B03200083	1J0	20	are you a man?	No
chat	B03200087	1J0	28	Is it USA?	Yes
chat	B03200012	1J0	181	does Filibee  say that she is from Turkey	No
chat	B03200082	1J0	181		\N
chat	B03200046	1J0	152	whose name is from USA?	Mandy
chat	193001	1J0	26	Does Mandy tell a stranger that she is from Turkey?	No
chat	B03200029	1J0	64	Who is human?	Andy
chat	B03200091	1J0	15	Isn't Cheney young?	--
chat	B03200012	1J0	182	doesn't Filibee  say that she is from Turkey	No
chat	B03200087	1J0	29	Is it USA?	Yes
chat	B03200029	1J0	65	Who isn't girl?	Andy
chat	B03200052	1J0	19	Is she a student?	Yes
chat	B03200046	1J0	153	when does she talk to stranger?	Annie
chat	B03200110	1J0	20		\N
chat	B03200003	1J0	31	Does Annie know Alice's best friend's name?	Ariel
chat	B03200012	1J0	183	Whose age is 23	Viola1
chat	B03200037	1J0	29		\N
chat	B03200034	1J0	6	Does Ariel like to play baseball	Alice
chat	B03200037	1J0	30		\N
chat	B01202104	1J0	15	Who is Maggie	Maggie
chat	B03200040	1J0	7	who is 19	Ariel
chat	B03200087	1J0	31	Whose age is 23	Alice
chat	B03200046	1J0	154		\N
chat	B03200082	1J0	183	who is cherry2	Sabrina
chat	B03200097	1J0	111	doesn't YiSian come from Taiwan 	Yes
chat	B03200046	1J0	155		\N
chat	B03200102	1J0	95	Does Dora is from Taiwan	Yes
chat	B03200037	1J0	31	is he good ?	No
chat	B03200083	1J0	21	do you have friends?	Yes
chat	B03200032	1J0	3		\N
chat	B03200029	1J0	67	Who is like female?	Andy
chat	B03200110	1J0	22	\tIs she from the Africa?	--
chat	B03200110	1J0	23		\N
chat	B01202104	1J0	16	Who is Jessie?	Jessie
chat	B03200110	1J0	24		\N
chat	B03200110	1J0	25	Is he a gay?	No
chat	B03200082	1J0	182		\N
chat	B03200087	1J0	30	Whose age is 23	Alice
chat	B03200062	1J0	21	who is a good girl?	--
chat	B03200060	1J0	28	Where does Taiwan in	--
chat	B03200034	1J0	7	Does Ariel like to play baseball?	--
chat	B03200102	1J0	94	Does Dora is from Taiwan?	--
chat	B03200052	1J0	20	is sabrina from usa?	No
chat	B03200034	1J0	8	Does Ariel come to taiwan?	--
chat	B03200091	1J0	17	Is Annie from Turkey?	Yes
chat	B03200097	1J0	112		\N
chat	B03200083	1J0	22	is she your friends?	No
chat	B03200012	1J0	186	isn't he 18	Yes
chat	B03200063	1J0	26	who is talk to  Alice?	Annie
chat	B03200046	1J0	159	Does she talk to Mandy?	Yes
chat	B03200110	1J0	26	Is he a gay?	--
chat	B03200091	1J0	18	Isn't Annie from Turkey?	Yes
chat	B03200012	1J0	184	who is right	Alice
chat	B03200082	1J0	184	is cherry2 18?	Maggie
chat	B03200046	1J0	156	does she a student?	Yes
chat	B03200034	1J0	9	who come to taiwan?	Alice
chat	B03200046	1J0	158	Does she a student?	Yes
chat	B03200050	1J0	47	is he having a girlfriend?	No
chat	B03200034	1J0	10	who come to taiwan?	Andy
chat	B03200046	1J0	165	Is she come to Taiwan?	--
chat	B03200062	1J0	22	who is beautiful?	--
chat	B03200034	1J0	17	who is the tour guide	Cheney
chat	B99110055	1J0	8	who is a good MUST student? 	Andy
chat	B03200034	1J0	18	who is the tour guide	Cherry2
chat	B03200034	1J0	19	who is the tour guide	Demi
chat	B99110055	1J0	9	who is a good MUST student? 	Annie
chat	B03200083	1J0	25	isn't she old?	No
chat	B03200032	1J0	4	is she a young girl	Maggie
chat	B03200034	1J0	23	who is the tour guide	Maggie
chat	B03200083	1J0	26	is she 20?	No
chat	B99110055	1J0	2	is she from Taiwan ?	Alice
chat	B03200029	1J0	66	Who have not a girlfriend?	Andy
chat	B03200102	1J0	96		\N
chat	B03200046	1J0	157	Does she a student?	--
chat	B03200091	1J0	16	Is Jessie a good girl?	Yes
chat	B03200102	1J0	97		\N
chat	B99110055	1J0	3	who is a good MUST student? 	Mandy
chat	B03200034	1J0	14	who is the tour guide	Alice
chat	B03200046	1J0	161	Is she come to Taiwan?	Yes
chat	B03200034	1J0	15	who is the tour guide	Andy
chat	B99110055	1J0	6	who is a good MUST student? 	Cherry2
chat	B03200046	1J0	164	Is she come to Taiwan?	--
chat	B03200034	1J0	16	who is the tour guide	Annie
chat	B99110055	1J0	7	who is a good MUST student? 	Alice
chat	B03200019	1J0	57	Who is college student?	Demi
chat	B03200062	1J0	23	who is beautiful?	--
chat	B03200019	1J0	58	Who is college student?	Demi
chat	B03200034	1J0	20	who is the tour guide	Viola1
chat	B99110055	1J0	10	who is a good MUST student? 	Cheney
chat	B03200034	1J0	21	who is the tour guide	Sabrina
chat	B99110055	1J0	11	who is a good MUST student? 	Viola1
chat	B03200034	1J0	22	who is the tour guide	Mandy
chat	B99110055	1J0	12	who is a good MUST student? 	Maggie
chat	B01202106	1J0	26	Who is female ?	--
chat	B03200034	1J0	24	who is the tour guide	Lisa1
chat	B03200110	1J0	21	\tIs she from the Africa?	Maggie
chat	B03200012	1J0	185	isn't he 18	Yes
chat	B03200046	1J0	160	Does he talk to Mandy?	Yes
chat	B03200083	1J0	23	is she old?	--
chat	B03200034	1J0	11		\N
chat	B03200034	1J0	12		\N
chat	B03200034	1J0	13		\N
chat	B03200083	1J0	24	is she old?	Yes
chat	B03200097	1J0	113	who isn't female	Mandy
chat	B99110055	1J0	4	who is a good MUST student? 	Mandy
chat	B99110055	1J0	5	who is a good MUST student? 	Maggie
chat	B03200046	1J0	162	Is she come to Taiwan?	--
chat	B03200046	1J0	163	Is she come to Taiwan?	--
chat	B03200034	1J0	25	who is the tour guide	Jessie
chat	B03200019	1J0	59	Who was college student?	Cherry2
chat	B03200087	1J0	32	Is Marian old ?	Yes
chat	B03200012	1J0	187	who say that she's name is Sabrina	Sabrina
chat	B03200102	1J0	98	who is beautiful female	--
chat	B03200046	1J0	166	Does he come to Andy?	Yes
chat	B03200102	1J0	99		\N
chat	B03200063	1J0	27	Whose age isn't 19?	Demi
chat	B03200032	1J0	5		\N
chat	B03200034	1J0	26	Does Ariel come to taiwan?	--
chat	B03200102	1J0	100		\N
chat	B03200012	1J0	188	who say that her name is Sabrina	Sabrina
chat	B03200034	1J0	27	Does Ariel come to taiwan?	Yes
chat	B03200006	1J0	8	Does a stranger greet Sabrina?	Yes
chat	B03200034	1J0	28	Does Ariel come to taiwan?	No
chat	B03200046	1J0	167	Does he come or not?	Yes
chat	B03200087	1J0	33	is Annie young?	Yes
chat	B03200063	1J0	28	Whose age isn't 15 	Alice
chat	B03200029	1J0	68	Who is study in must?	Dora
chat	B03200012	1J0	189	who is young	Alice
chat	B03200087	1J0	34	is Andy old?	No
chat	B03200060	1J0	29	Does she from USA?	--
chat	B03200034	1J0	29	Does Filibee tell Ariel that he is from Turkey?	--
chat	B01202106	1J0	27		\N
chat	B03200034	1J0	30	Does Filibee tell Ariel that he is from Turkey?	Yes
chat	B03200034	1J0	31	Does Filibee tell Ariel that he is from Turkey?	No
chat	B03200091	1J0	19	Whose age isn't 21?	Andy
chat	B03200012	1J0	190	who isn't young	Alice
chat	B03200060	1J0	30	Does she from the USA?	--
chat	B03200097	1J0	114		\N
chat	B03200063	1J0	29	Whose age isn't 16?	Jessie
chat	B03200034	1J0	32	Does Filibee tell Ariel that he is from Turkey?	No
chat	B03200018	1J0	10	is Andy 21 	Yes
chat	B03200087	1J0	35	is Maggie right?	Yes
chat	B03200102	1J0	101	who is a student	--
chat	B03200097	1J0	115	is she Ariel 	Yes
chat	B03200046	1J0	168	Does YiSian beautiful?	Yes
chat	B03200012	1J0	191	who isn't greet	Demi
chat	B03200018	1J0	11	is Alice 18	No
chat	B03200046	1J0	169	Does YiSian a student	--
chat	B03200087	1J0	36	when Andy is right	Maggie
chat	B03200032	1J0	6	who is a young girl	Maggie
chat	B03200003	1J0	32	Doesn't Dora understand it ?	Jessie
chat	B03200060	1J0	31	Does she from the USA?	--
chat	B03200006	1J0	9	Does she guess right?	Yes
chat	B03200087	1J0	37	when Andy is old	Andy
chat	B99110055	1J0	13	who isn't 16 	Cheney
chat	B03200060	1J0	32	Doesn't she from the USA?	--
chat	B03200094	1J0	15	Whose age is 18?	Maggie
chat	B03200013	1J0	51	Who is USA?	--
chat	B03200097	1J0	116		\N
chat	B03200062	1J0	24		\N
chat	B03200046	1J0	170	Is she say?	Yes
chat	B03200087	1J0	38	is Junior great?	No
chat	B03200097	1J0	117		\N
chat	B03200012	1J0	192	who say that she is from Taiwan	Sabrina
chat	B03200046	1J0	171	Is she say that she is from Taiwan?	Yes
chat	B03200003	1J0	33	Who is the young man?	Annie
chat	B03200006	1J0	10	Does he understand?	Yes
chat	B03200097	1J0	118	Doesn't Ariel greet Filibee?	Yes
chat	B03200087	1J0	39	is Junior good?	Yes
chat	B03200046	1J0	172	Does she say that she is from Taiwan?	--
chat	B03200012	1J0	193		\N
chat	B03200094	1J0	16	Whose name is Stefan?	Demi
chat	B03200097	1J0	119	Doesn't Ariel greet Ellarose?	Yes
chat	B03200060	1J0	33	What does she like the USA?	--
chat	B03200060	1J0	34	does she like the USA?	--
chat	B03200012	1J0	194	who is from Taiwan	Sabrina
chat	B03200018	1J0	12	is Ariel 21	No
chat	B03200046	1J0	173	Does she say that she is 16?	Yes
chat	193001	1J0	27	Does Mandy tell a stranger that she is from Hungary?	No
chat	B03200091	1J0	20	Aren't they Taiwan	Yes
chat	B03200018	1J0	13	is Mandy 16	No
chat	B03200006	1J0	11	Is she young?	Yes
chat	B03200097	1J0	120	Does Ariel greet Ellarose?	Yes
chat	B03200060	1J0	35	who is like the USA?	--
chat	B03200060	1J0	36	who is like the USA?	--
chat	B03200012	1J0	195	who is beautiful 	Alice
chat	B03200087	1J0	40	who is understand?	Alice
chat	193001	1J0	28	Does Mandy tell a stranger that she is from MUST?	No
chat	B03200097	1J0	121	Does Ariel greet Mandy?	No
chat	B03200102	1J0	102		\N
chat	B03200046	1J0	174	Doesn't he say that he is from Turkey?	Yes
chat	B03200102	1J0	103	who is a student	--
chat	B03200006	1J0	12	Does he like her?	Yes
chat	B03200060	1J0	37	Alice is beautiful female	--
chat	B03200087	1J0	41	is Dora understand?	Yes
chat	B99110055	1J0	14	doesn't he stady  in Taiwan ? 'yas'	Alice
chat	B03200003	1J0	34	What does the stranger student say?	Dora
chat	B03200102	1J0	104	who is a student	--
chat	B03200034	1J0	33	Have been Ariel come to taiwan?	--
chat	B03200037	1J0	32	Is Demi from Taiwan	Yes
chat	B03200034	1J0	34	who come to taiwan?	--
chat	B03200097	1J0	122	Doesn't Ariel greet Mandy?	Yes
chat	B03200062	1J0	25		\N
chat	B03200091	1J0	21	Whose age isn't 21?	Andy
chat	B01202106	1J0	28	Who is from Must?	--
chat	B03200034	1J0	35	who is young	--
chat	B03200091	1J0	22	Aren't they Taiwan	Yes
chat	B03200013	1J0	52	Who is from Taiwan?	--
chat	B01202106	1J0	30	Who is a student?	--
chat	B03200097	1J0	124	Does Sabrina greet Ariel 	No
chat	B03200062	1J0	26	who ask Alice name?	--
chat	B03200087	1J0	42	is Dora beautiful?	Yes
chat	B03200013	1J0	53	Who is 15?	--
chat	B03200097	1J0	125	Does Sabrina greet Alice	No
chat	B03200087	1J0	43	is Ellarose old?	Yes
chat	B03200046	1J0	175	Does he say that he is student?	No
chat	B03200029	1J0	69	Who is not have a  cellphone?	Andy
chat	B03200012	1J0	198	whose name is Maggie	Maggie
chat	B03200060	1J0	40	Alice is a  female.	--
chat	B03200102	1J0	105		\N
chat	B03200012	1J0	196	whose name is Alice	Alice
chat	B03200097	1J0	123	Does Ariel greet Sabrina?	No
chat	B01202106	1J0	29	Who is student?	--
chat	B03200012	1J0	197	who is a boy	Demi
chat	B03200006	1J0	13	Does he talk to stranger?	Yes
chat	B03200063	1J0	30	who is stranger?	Alice
chat	B03200003	1J0	35	Are they students?	Dora
chat	B03200032	1J0	7	whose age is 18	Jessie
chat	B03200089	1J0	26	does Ariel come from Turkey?	Jessie
chat	B03200060	1J0	38	Alice is a beautiful female	--
chat	B03200102	1J0	106		\N
chat	B03200046	1J0	176	Does he say that he is a student?	Yes
chat	B03200097	1J0	126	Does Sabrina greet Junior 	Yes
chat	B03200097	1J0	127	Doesn't Sabrina greet Junior 	No
chat	B03200018	1J0	14		\N
chat	B03200062	1J0	27	isn't he a student?	--
chat	B03200060	1J0	39	Alice is a  female	--
chat	B03200063	1J0	31	who is a stranger?	Alice
chat	B03200097	1J0	128	Doesn't Sabrina greet Alice	Yes
chat	B03200046	1J0	177	Does she say that she is beautiful women?	Yes
chat	B03200012	1J0	199	whose name is Annie	Annie
chat	B03200046	1J0	178	Does she say that she is beautiful women?	Yes
chat	B03200029	1J0	70	Who haven't a cellphone?	Andy
chat	B03200060	1J0	41	Alice is a  female.	--
chat	B03200006	1J0	14		\N
chat	B03200060	1J0	42	Alice is a  female.	--
chat	B03200060	1J0	43	Alice is a  female.	--
chat	B03200060	1J0	44	Alice is a  female.	--
chat	B03200060	1J0	45	Alice is a  female.	--
chat	B03200087	1J0	44	are they beautiful?	Yes
chat	B03200006	1J0	15		\N
chat	B03200097	1J0	129	Does Sabrina greet Marian	No
chat	B03200013	1J0	54	Whose age isn't 15?	--
chat	B03200046	1J0	179	Does she say that she is a women?	Yes
chat	B03200062	1J0	28	isn't Ariel from Taiwan?	--
chat	B03200012	1J0	200	whose name is Demi	Demi
chat	B03200060	1J0	46	Alice sucks my cock.	--
chat	B03200060	1J0	47	Alice sucks my cock.	--
chat	B03200060	1J0	48	Alice sucks my cock.	--
chat	B03200097	1J0	130	Does Sabrina greet Jack	No
chat	B03200102	1J0	107	who is a student	Dora
chat	B99110055	1J0	15	who study in Taiwan MUST	Alice
chat	B03200018	1J0	15	who is ugly	Annie
chat	B03200087	1J0	45	are they right?	No
chat	B03200029	1J0	71	Who hasn't a woman?	Andy
chat	193001	1J0	29	Does Mandy tell Ariel that she is from the USA?	No
chat	B03200089	1J0	27	doesn't he a student?	--
chat	B03200089	1J0	28	doesn't he a student?	Yes
chat	B03200018	1J0	16	who is beautiful	Alice
chat	B03200097	1J0	131	Does Sabrina greet Dora 	No
chat	B01202106	1J0	31	Is Dora from the USA?	--
chat	B03200029	1J0	72	Who hasn't a cellphone?	Andy
chat	B03200063	1J0	32	who is a young girl?	Dora
chat	B03200032	1J0	8	Is she from USA?	Mandy
chat	B99110055	1J0	16	who study in Taiwan MUST	Dora
chat	B03200012	1J0	201	whose name is Mandy	Mandy
chat	B03200087	1J0	46	is Jack young?	No
chat	B03200006	1J0	16	Who is a  girl?	Alice
chat	B03200034	1J0	36	Does Filibee tell Ariel that he is from Turkey?	--
chat	B03200018	1J0	17	who is Alice	Alice
chat	B03200029	1J0	73	Who say he is a gay?	Andy
chat	B03200056	1J0	39		\N
chat	B03200018	1J0	18	who is she 	Alice
chat	B03200018	1J0	19	who is Alice	Annie
chat	B03200046	1J0	180	Don't they talk to stranger?	Yes
chat	B03200097	1J0	132	Does Sabrina greet YiSian 	No
chat	B03200062	1J0	29	isn't she talk to the stranger?	--
chat	B03200056	1J0	40	Isn't he a stranger ?	No
chat	B03200087	1J0	47	aren't they from MUST	Yes
chat	B03200094	1J0	17		\N
chat	B03200097	1J0	133		\N
chat	B03200006	1J0	17	Who is a beautiful girl?	Sabrina
chat	B01202106	1J0	32	isn't Stefan  from Turkey	--
chat	B03200102	1J0	108	who is a girl 	Viola1
chat	B03200029	1J0	74	Is Andy ugly?	Yes
chat	B03200056	1J0	41	isn't Sabrina from Turkey	No
chat	B03200029	1J0	75	Is Andy ugly?	No
chat	B03200094	1J0	18	Doesn't Ariel greet Alice?	No
chat	B03200013	1J0	55	whose name is Mandy?	--
chat	B03200063	1J0	33	who is a student?	Sabrina
chat	B03200087	1J0	48	who is from USA ?	Alice
chat	B99110055	1J0	17	who female from USA 	Dora
chat	B03200046	1J0	181	Is it a student?	Yes
chat	B03200034	1J0	37	Doesn't he like ALICE?	--
chat	B03200097	1J0	134	who is MUST's student	Dora
chat	B03200091	1J0	23	Is stranger student say right?	Andy
chat	B03200046	1J0	182	Is it a women?	Yes
chat	B03200102	1J0	109	who is from Taiwan	Annie
chat	B03200094	1J0	19	Doesn't Marian come from MUST?	No
chat	B99110055	1J0	18	who are from USA 	Dora
chat	B03200034	1J0	38	Doesn't he like Alice?	--
chat	B03200029	1J0	76	Is Andy like APK?	Yes
chat	B03200097	1J0	135		\N
chat	B03200094	1J0	20	Doesn't Marian come from USA?	No
chat	B03200094	1J0	21	Doesn't Marian come from USA?	Yes
chat	B03200046	1J0	183	Is it a female?	Yes
chat	B03200087	1J0	49	is Dora from USA?	Yes
chat	B03200097	1J0	136		\N
chat	B03200003	1J0	36	Does Annie  come to school?	Alice
chat	B03200046	1J0	184	Is she a female?	Yes
chat	B03200089	1J0	29	Alice isn't a man.	No
chat	B03200097	1J0	137	Who is Dora? 	Dora
chat	B03200087	1J0	50	isn't she from USA?	Yes
chat	B03200018	1J0	31		\N
chat	B03200029	1J0	77	Is Andy beautiful man?	No
chat	B03200029	1J0	78	Is Andy beautiful man?	Yes
chat	B03200046	1J0	185	Is she a woman?	Yes
chat	B03200029	1J0	79	Is Andy beautiful?	Yes
chat	B03200094	1J0	22	Does Ariel come from USA?	Yes
chat	B03200102	1J0	111		\N
chat	B03200102	1J0	112		\N
chat	B03200052	1J0	23	isn't annie 18?	Yes
chat	B03200003	1J0	37	Who can tell me the truth?	Andy
chat	B03200034	1J0	42	Whose family has three people?	--
chat	B03200091	1J0	24	Does Ariel understand?	Yes
chat	B99110055	1J0	19	Whose age is 23?	Cheney
chat	B03200087	1J0	53	is USA beautiful?	No
chat	B03200097	1J0	139	Who is Sabrina ? 	Sabrina
chat	B03200087	1J0	54	is USA beautiful?	Yes
chat	B03200046	1J0	186	Does she guess Andy's age?	Yes
chat	B03200012	1J0	205	YiSian is a student	No
chat	B03200097	1J0	140	who is young	Sabrina
chat	B03200102	1J0	113		\N
chat	B03200062	1J0	30	who is a student from MUST?	--
chat	B03200063	1J0	35		\N
chat	B03200087	1J0	55	is Stefan beautiful?	Yes
chat	B03200063	1J0	36		\N
chat	B99110055	1J0	20	'Who age is 23?'	Cheney
chat	B03200089	1J0	30	Mandy isn't a student	Yes
chat	B03200018	1J0	23	who is woman	Alice
chat	B03200029	1J0	80	Is Andy handsome?	No
chat	B03200003	1J0	39	Who is right?	Maggie
chat	B03200029	1J0	81	Is Andy handsome?	Yes
chat	B03200097	1J0	142		\N
chat	B03200060	1J0	51	isn't sheold 	--
chat	B03200060	1J0	52	isn't she old 	--
chat	B03200029	1J0	82	Does Andy not like woman?	Yes
chat	B03200094	1J0	26	Isn't Ellarose from USA?	No
chat	B03200029	1J0	83	Does Andy not like woman?	No
chat	B03200094	1J0	27	Isn't Ellarose from USA?	Yes
chat	B03200034	1J0	43	why does Alice so beautiful?	--
chat	B03200046	1J0	190	Does she come to MUST?	Yes
chat	B03200097	1J0	143	whose name is Dora	Dora
chat	B03200083	1J0	27	is she 20?	No
chat	B03200046	1J0	191	Is she come to MUST?	Yes
chat	B03200097	1J0	144	whose name is Viola1	Viola1
chat	B03200094	1J0	29	Does Ellarose come  from USA?	--
chat	B03200034	1J0	45	who is the good girl ?	--
chat	B03200012	1J0	206	whose name isn't Demi	Sabrina
chat	B03200094	1J0	30	Does Ellarose come  from USA?	--
chat	B03200091	1J0	26	Whose age isn't 16	Viola1
chat	B03200063	1J0	38	who is good at Hispanic?	Jessie
chat	B03200034	1J0	47	who is the tour guide?	--
chat	B03200089	1J0	32	Is she a good student?	Yes
chat	B03200087	1J0	60	Who is from the Taiwan?	Sabrina
chat	B03200012	1J0	207	whose name isn't Alice	Andy
chat	B03200063	1J0	39	who is good in Hispanic?	Maggie
chat	B03200012	1J0	208	whose name isn't Annie	Sabrina
chat	B03200046	1J0	195		\N
chat	B03200062	1J0	33	Isn't  Lisa talk to a stranger?	--
chat	B03200046	1J0	196		\N
chat	B03200087	1J0	61	who is greet woman?	Cheney
chat	B03200029	1J0	84	Is Andy a pig?	Yes
chat	B03200012	1J0	209	whose name isn't Maggie	Mandy
chat	B03200046	1J0	198		\N
chat	B03200046	1J0	199		\N
chat	B03200012	1J0	210	whose name isn't Annie	Mandy
chat	B03200006	1J0	19	Who is from Taiwan?	Alice
chat	B03200102	1J0	116	who is a student	Alice
chat	B03200087	1J0	63	who is man	Andy
chat	B03200091	1J0	27	Is Filibee from Taiwan	Viola1
chat	B03200046	1J0	200	Who greet to Taiwan?	Maggie
chat	B03200012	1J0	211	whose name isn't YiSian	Viola1
chat	B03200089	1J0	33	Is she a good woman?	--
chat	B03200087	1J0	64	who is the beautiful mam	Andy
chat	B03200102	1J0	117		\N
chat	B03200102	1J0	118		\N
chat	B03200012	1J0	212	whose name isn't Filibee	Alice
chat	B03200032	1J0	10		\N
chat	B03200032	1J0	11		\N
chat	B03200102	1J0	120		\N
chat	B03200050	1J0	49	Is Cheney a girl?	Yes
chat	B03200102	1J0	121		\N
chat	B03200034	1J0	50	Who is good girl ?	--
chat	B03200083	1J0	31	s he a young man?	--
chat	B03200102	1J0	122	Is Andy like a man	Yes
chat	B03200097	1J0	147	whose name is Dora	Dora
chat	B03200087	1J0	66	whose name is Andy	Andy
chat	B03200063	1J0	40		\N
chat	B03200063	1J0	41		\N
chat	B03200097	1J0	148	whose name isn't Dora	Sabrina
chat	B03200102	1J0	123		\N
chat	B03200087	1J0	68	whose name is Dora	Dora
chat	B03200083	1J0	34	isn't he a old man?	No
chat	B03200029	1J0	89	Whose age 19?	Andy
chat	B03200063	1J0	42	is Alice a stranger?	No
chat	B03200097	1J0	150	whose name isn't Alice	Andy
chat	B03200097	1J0	151	whose name is Alice	Alice
chat	B03200087	1J0	69	who is Stefan	Viola1
chat	B03200012	1J0	215	who isn't right	Demi
chat	B03200034	1J0	54	who understand Alice?	--
chat	B03200083	1J0	36	Is he stranger?	Yes
chat	B03200046	1J0	204	Whose name is from Demi?	Jessie
chat	B03200029	1J0	92	Who isn't a man?	Andy
chat	B03200087	1J0	70	who is a man ?	Andy
chat	B03200083	1J0	37	Is he a stranger?	Yes
chat	B03200046	1J0	206	who is girl	Maggie
chat	B03200083	1J0	40	Isn't he a stranger?	Yes
chat	B03200012	1J0	217	whose name isn't Cherry2	--
chat	B03200018	1J0	30		\N
chat	B03200063	1J0	48	is Filibee a stranger	No
chat	B03200097	1J0	154	who is good	Ariel
chat	B03200012	1J0	218	whose name isn't Cheney	Sabrina
chat	B03200052	1J0	21	Is Alice from USA?	Yes
chat	B03200087	1J0	51	is Marian young?	Yes
chat	B03200034	1J0	39	when are they going?	--
chat	B03200052	1J0	22	Is Alice from Taiwan	--
chat	B03200102	1J0	110		\N
chat	B03200034	1J0	40	Is she a student?	Alice
chat	B03200012	1J0	202	Is it right	Yes
chat	B03200034	1J0	41	who lives in Taipei	--
chat	B03200087	1J0	52	is MUST beautiful?	Yes
chat	B03200063	1J0	34	who is a beautiful girl?	Sabrina
chat	B03200097	1J0	138	Who is she? 	Sabrina
chat	B03200012	1J0	203	YiSian is a student	Yes
chat	B03200094	1J0	23	Doesn't Ariel come from USA?	No
chat	B03200018	1J0	20	whose age 21	Andy
chat	B03200094	1J0	24	Is she old?	Yes
chat	B03200018	1J0	21	whose age 18	Alice
chat	B03200012	1J0	204	YiSian is a student	Yes
chat	B03200046	1J0	187	Does he guess Andy's age?	Yes
chat	B03200091	1J0	25	Where Junior come from?	Alice
chat	B03200018	1J0	22	whose age is 21	Andy
chat	B03200063	1J0	37		\N
chat	B03200097	1J0	141		\N
chat	B03200060	1J0	49	isn't he good	--
chat	B03200003	1J0	38	Who is tell the right?	Demi
chat	B03200046	1J0	188	Does Mandy a student?	Yes
chat	B03200032	1J0	9	who is a good girl?	Dora
chat	B03200094	1J0	25	Does Jessie is female?	Yes
chat	B03200060	1J0	50	who isn't 16	--
chat	B99110055	1J0	21	'Who is age are 23?'	Sabrina
chat	B03200046	1J0	189	Does she in Taiwan?	Yes
chat	B03200062	1J0	31	Is Mandy a student from MUST?	--
chat	B03200018	1J0	24	who is good girl	Alice
chat	B03200018	1J0	25	who is good girl	--
chat	B03200018	1J0	26	who is good boy	Andy
chat	B03200102	1J0	114		\N
chat	B03200087	1J0	56	Whose age isn't 21?	Alice
chat	B03200018	1J0	27	who is male	Andy
chat	B03200034	1J0	44	who is the most beautiful?	--
chat	B03200046	1J0	192	Isn't she come to MUST?	Yes
chat	B03200087	1J0	57	Whose age is 23?	Jessie
chat	B03200094	1J0	28	Does Ellarose from USA?	Yes
chat	B03200018	1J0	28	who is man	Andy
chat	B03200089	1J0	31	is she a student?	Yes
chat	B03200097	1J0	145	whose name is Sabrina	Sabrina
chat	B03200094	1J0	31	Does Ellarose come  from USA?	Yes
chat	B03200094	1J0	32	Does Ellarose come  from USA?	--
chat	B03200087	1J0	58	Whose age is 23?	Jessie
chat	B03200046	1J0	193	Isn't she like Taiwan?	Yes
chat	B03200083	1J0	28	is she a teacher?	No
chat	B03200034	1J0	46	who is the tour guide	--
chat	B03200087	1J0	59	Who is from the MUST?	Alice
chat	B03200046	1J0	194	Isn't she like Taiwan?	Yes
chat	B03200034	1J0	48	who is the bad guy?	--
chat	B03200062	1J0	32	Isn't  Lisa talk to a stranger?	--
chat	B03200046	1J0	197		\N
chat	B03200034	1J0	49	who is young?	--
chat	B03200029	1J0	85	Is Andy a pig?	No
chat	B03200102	1J0	115		\N
chat	B03200087	1J0	62	who is good man?	Andy
chat	B03200029	1J0	86	Is Andy a strange?	No
chat	B03200006	1J0	18	Who is from USA?	Andy
chat	B03200029	1J0	87	Is Andy a woman?	Yes
chat	B03200046	1J0	201	Who greet to Annie?	Dora
chat	B03200050	1J0	48	Is Cheney a pig?	Yes
chat	B03200083	1J0	29	is he a boy?	Yes
chat	B03200102	1J0	119	Does Andy like Cheney?	Yes
chat	B03200097	1J0	146	whose name isn't Sabrina 	Viola1
chat	B03200089	1J0	34	Is she a old woman?	No
chat	B99110055	1J0	22	Who is come USE?	Sabrina
chat	B03200034	1J0	51	Who is  a good girl ?	--
chat	B03200083	1J0	30	is he a young boy?	Yes
chat	B03200087	1J0	65	who name is Andy?	Andy
chat	B03200012	1J0	213	who isn't from USA	Andy
chat	B03200083	1J0	32	Is he a young man?	Yes
chat	B03200089	1J0	35	Is she a young woman?	Yes
chat	B03200087	1J0	67	whose name is Sabrina	Sabrina
chat	B03200083	1J0	33	Is he a old man?	No
chat	B03200046	1J0	202	Who like Taiwan?	Maggie
chat	B03200034	1J0	52	Aren't they young?	--
chat	B03200029	1J0	88	Whose age's 19?	Andy
chat	B03200089	1J0	36	Is she a beautiful woman?	Yes
chat	B03200097	1J0	149	whose name isn't Marian	Alice
chat	B03200083	1J0	35	Isn't he a young man?	Yes
chat	B03200012	1J0	214	who is Lisa1	Lisa1
chat	B03200091	1J0	28	Is stranger student say right?	--
chat	B03200046	1J0	203	Who disconnect Ellarose?	Dora
chat	B03200029	1J0	90	Whose age nineteen years old?	Andy
chat	B03200063	1J0	43	is Ariel a stranger	No
chat	B03200034	1J0	53	who understand?	--
chat	B03200029	1J0	91	Who is old?	Andy
chat	B03200097	1J0	152		\N
chat	B03200063	1J0	44	isYiSian a stranger	No
chat	B03200063	1J0	45	is YiSian a stranger	No
chat	B03200034	1J0	55	who understand name?	--
chat	B03200091	1J0	29	doesn't he right	Yes
chat	B03200046	1J0	205	Who is a girl?	Jessie
chat	B03200083	1J0	38	Is he a stranger?	No
chat	B03200063	1J0	46	is Sabrina a stranger	No
chat	B03200012	1J0	216	whose name isn't Andy	Sabrina
chat	B03200032	1J0	12	Is Alice a student?	Yes
chat	B03200083	1J0	39	Isn't he a stranger?	No
chat	B03200102	1J0	124	Who is a student?	--
chat	B03200102	1J0	125		\N
chat	B03200102	1J0	126		\N
chat	B03200032	1J0	13	is mandy a student?	Yes
chat	B03200063	1J0	47	is Ellarose a stranger	No
chat	B03200083	1J0	41	Isn't he a stranger?	No
chat	B03200046	1J0	207	who is a beautiful student?	Maggie
chat	B03200097	1J0	153		\N
chat	B03200018	1J0	29		\N
chat	B03200087	1J0	71	whose name is from MUST?	Alice
chat	B03200063	1J0	49	is Andy a stranger	No
chat	B03200012	1J0	219	whose name isn't Jessie	Cherry2
chat	B03200097	1J0	155		\N
chat	B03200083	1J0	44	Is she come?	Yes
chat	B03200046	1J0	209	who is a man that is from Turkey?	Viola1
chat	B03200083	1J0	45	Isn't she come?	Yes
chat	B03200087	1J0	73	who is student ?	Ariel
chat	B03200097	1J0	156	Alice isn't a woman. 	No
chat	B03200089	1J0	37	Do they understand?	Yes
chat	B03200087	1J0	74	who is a student ?	Sabrina
chat	B03200012	1J0	220	whose name isn't Jack	Annie
chat	B03200063	1J0	51	is Maggie a stranger	No
chat	B03200091	1J0	31	Does Dora talk to stranger?	Yes
chat	B03200046	1J0	210	who is a woman that is 15?	Jessie
chat	B03200034	1J0	57	whose like Junior?	--
chat	B03200012	1J0	221	whose name isn't Stefan	Andy
chat	B03200034	1J0	58	who like Junior?	--
chat	B03200034	1J0	59	who likes Junior?	--
chat	B03200097	1J0	157	Junior is a woman	No
chat	B03200083	1J0	47	Is she like man?	Yes
chat	B03200046	1J0	212	who is a woman that is 20?	Cherry2
chat	B03200032	1J0	17		\N
chat	B03200012	1J0	222	whose name isn't Junior 	Sabrina
chat	B03200083	1J0	49	Is she like a man?	--
chat	B03200083	1J0	50	Is she like the man?	Yes
chat	B03200032	1J0	18	who is the beautiful girl	Jessie
chat	B03200087	1J0	77	is Sabrina young?	Yes
chat	B03200012	1J0	223	who talk to stranger 	Sabrina
chat	B03200063	1J0	54		\N
chat	B03200063	1J0	55		\N
chat	B03200087	1J0	78	is Dora young?	Yes
chat	B03200032	1J0	21	is she from USA	No
chat	B03200089	1J0	40	is her name Alice?	Yes
chat	B03200012	1J0	224	who talk to stranger 	Alice
chat	B03200089	1J0	41	is her name Jessie ?	No
chat	B03200083	1J0	52	Is she like old man?	Yes
chat	B03200089	1J0	42	is her name Maggie ?	--
chat	B03200052	1J0	25		\N
chat	B03200019	1J0	60	Who was college student?	Demi
chat	B03200083	1J0	55	Are they old man?	Yes
chat	B03200032	1J0	23	is Jessie 19	No
chat	B03200052	1J0	27	who is 18?	Alice
chat	B03200074	1J0	23	who is male	Cheney
chat	B03200097	1J0	160	is YiSian from Taiwan 	No
chat	B03200046	1J0	215	who is a student that is old?	Lisa1
chat	B03200046	1J0	216	who is a student that is young?	Cherry2
chat	B03200019	1J0	61	Who tell Ariel he doesn't speak English	Jessie
chat	B03200052	1J0	29	aren't they student?	Andy
chat	B03200097	1J0	162	Isn't Marian from Taiwan 	No
chat	B03200019	1J0	62	Who told Ariel he didn't speak English	Mandy
chat	B03200046	1J0	218	who is a man that is old?	Andy
chat	B03200087	1J0	80	is Mandy young?	Yes
chat	B03200003	1J0	41	Does he like Alice?	Mandy
chat	B03200074	1J0	24	whose age is 19	Maggie
chat	B03200094	1J0	34	whose name isn't Jack?	No
chat	B03200097	1J0	163	is Junior 23 	No
chat	B03200046	1J0	219	who is a girl that is beautiful?	Dora
chat	B03200032	1J0	29	is Ellarose a student	Yes
chat	B03200032	1J0	30	is Mandy a student	Yes
chat	B03200019	1J0	63	who is a ugly student?	Jessie
chat	B03200012	1J0	233	isn't YiSian good	Yes
chat	B03200032	1J0	31	is Marian a student	Yes
chat	B03200094	1J0	35	Isn't he a stranger	Yes
chat	B03200046	1J0	222	who is a woman that is 17?	Mandy
chat	B03200097	1J0	165	is Demi 23 	--
chat	B03200052	1J0	35	WHO is beautiful girl?	Annie
chat	B03200052	1J0	36	WHO is beautiful girl?	Sabrina
chat	B03200094	1J0	36	whose name isn't Demi	Yes
chat	B03200052	1J0	37	WHO is beautiful female	Sabrina
chat	B03200012	1J0	234	is Ariel good	Yes
chat	B03200032	1J0	33	is Jack a student	Yes
chat	B03200052	1J0	38	Is Annie a good girl?	Annie
chat	B03200012	1J0	236	is Junior good	Yes
chat	B03200097	1J0	167	is Junior 21	No
chat	B03200046	1J0	224	who is a girl that is Hispanic?	Dora
chat	B03200089	1J0	49	who is young?	--
chat	B03200083	1J0	42	Does he understand?	Yes
chat	B03200032	1J0	14		\N
chat	B03200102	1J0	127	Who is a young female	Maggie
chat	B03200032	1J0	15		\N
chat	B03200046	1J0	208	who is a student that is beautiful?	Jessie
chat	B03200087	1J0	72	whose name is from USA?	Sabrina
chat	B03200034	1J0	56	does study in wenhua university before	--
chat	B03200083	1J0	43	Is she comes?	Yes
chat	B03200003	1J0	40	Where is the MUST?	Alice
chat	B03200063	1J0	50	is Jack a stranger	No
chat	B03200083	1J0	46	Isn't she come?	--
chat	B03200091	1J0	30	Does Lisa talk to stranger?	No
chat	B03200032	1J0	16		\N
chat	B03200102	1J0	128		\N
chat	B03200063	1J0	52	is Maggie a student	Yes
chat	B03200046	1J0	211	who is a man that is 19?	Demi
chat	B03200089	1J0	38	Are they young?	No
chat	B03200087	1J0	75	is Jack beautiful?	Yes
chat	B03200083	1J0	48	Is she like a man?	Yes
chat	B03200046	1J0	213	who is a woman that is 22?	Ariel
chat	B03200087	1J0	76	is Jack old?	No
chat	B03200063	1J0	53	is Sabrina a student	Yes
chat	B03200083	1J0	51	Is she like the man?	No
chat	B03200097	1J0	158	Junior isn't a woman	Yes
chat	B03200032	1J0	19		\N
chat	B03200032	1J0	20		\N
chat	B03200087	1J0	79	is Dora  old?	No
chat	B03200091	1J0	32	doesn't she understand Mandy	--
chat	B03200097	1J0	159	YiSian is a woman	No
chat	B03200089	1J0	39	is her name Dora?	No
chat	B03200083	1J0	53	Is she like the old man?	No
chat	B03200032	1J0	22	is YiSian from USA	No
chat	B03200089	1J0	43	is her name Maggie ?	Yes
chat	B03200052	1J0	24		\N
chat	B03200089	1J0	44	is her name Maggie ?	No
chat	B03200083	1J0	54	are they old man?	Yes
chat	B03200089	1J0	45	is he name Andy ?	No
chat	B03200052	1J0	26	does Alice is female	Alice
chat	B03200012	1J0	225	whose ago is 16	Alice
chat	B03200046	1J0	214	who is a student that is from USA?	Annie
chat	B03200012	1J0	226	whose age is 16	Alice
chat	B03200083	1J0	56	Are they understand?	Yes
chat	B03200032	1J0	24	is Sabrina 21	--
chat	B03200074	1J0	22	who is female	Alice
chat	B03200032	1J0	25	is Maggie 16	No
chat	B03200032	1J0	26	is Dora 21	No
chat	B03200012	1J0	227	is his name Andy	Yes
chat	B03200052	1J0	28	does she from Turkey?	Dora
chat	B03200032	1J0	27	is Jack 15	No
chat	B03200012	1J0	228	isn't his name Andy	Yes
chat	B03200097	1J0	161	isn't YiSian from Taiwan 	Yes
chat	B03200032	1J0	28	is Annie 23	No
chat	B03200052	1J0	30	isn't he student?	Andy
chat	B03200052	1J0	31	isn't he male	Andy
chat	B03200046	1J0	217	who is a man that is young?	Andy
chat	B03200094	1J0	33	Doesn't Sabrina greet MUST?	Yes
chat	B03200012	1J0	229	who isn't come from Taiwan	Sabrina
chat	B03200052	1J0	32	who the man is young	Andy
chat	B03200052	1J0	33	who the man is young?	Andy
chat	B03200087	1J0	81	is Mandy old?	Yes
chat	B03200089	1J0	46	Whose age isn't 21?	No
chat	B03200012	1J0	230	is Alice good	Yes
chat	B03200089	1J0	47	Whose age isn't 21?	Maggie
chat	B03200087	1J0	82	is Mandy beautiful?	Yes
chat	B03200012	1J0	231	isn't Alice good	Yes
chat	B03200046	1J0	220	who is a man that the name is good?	Lisa1
chat	B03200012	1J0	232	is YiSian good	Yes
chat	B03200046	1J0	221	who is a man that is 15	--
chat	B03200052	1J0	34	who is from USA?	Alice
chat	B03200097	1J0	164	is Sabrina  23 	No
chat	B03200019	1J0	64	who is a ugly student?	Viola1
chat	B03200042	1J0	14	Is she called Connie?	No
chat	B03200074	1J0	25		\N
chat	B03200019	1J0	65	Whose age isn't 15?	--
chat	B03200074	1J0	26		\N
chat	B03200019	1J0	66	Whose age isn't 15?	Demi
chat	B03200074	1J0	27	who is female	Viola1
chat	B03200032	1J0	32	is YiSian a student	Yes
chat	B03200012	1J0	235	isn't Ariel good	Yes
chat	B03200097	1J0	166	is Cherry2 23 	No
chat	B03200046	1J0	223	Who is a woman that is female?	Cherry2
chat	B03200074	1J0	28	whose age is 19	Sabrina
chat	B03200052	1J0	39	does she is good girl?	Alice
chat	B03200094	1J0	37	who is the good girl	Yes
chat	B03200012	1J0	237	isn't Junior good	Yes
chat	B03200019	1J0	67	who is a student that is order?	Mandy
chat	B03200097	1J0	168	isn't Junior 21	No
chat	B03200012	1J0	238	is Marian good	Yes
chat	B03200089	1J0	48	who is young?	--
chat	B03200032	1J0	34	is Dora a girl	Yes
chat	B03200097	1J0	169	isn't Junior 22	No
chat	B03200056	1J0	42		\N
chat	B03200032	1J0	35	is Jack a girl	No
chat	B03200012	1J0	239	isn't Marian good	Yes
chat	B03200097	1J0	170	isn't Junior 23 	No
chat	B03200063	1J0	56	who is Jack?	Andy
chat	B03200012	1J0	240	is Taiwan good	Yes
chat	B03200056	1J0	43	isn't Sabrina 22	No
chat	B03200052	1J0	40	Isn't she a good girl?	Mandy
chat	B03200089	1J0	50	Dora  is young	Mandy
chat	B03200032	1J0	36	is Maggie a girl	No
chat	B03200063	1J0	57	who is 	--
chat	B03200056	1J0	44	doesn't Turkey say that she is from Taiwan	No
chat	B03200063	1J0	58	who is Andy?	Andy
chat	B03200032	1J0	37	is Junior a boy	Yes
chat	B03200012	1J0	241	is Ellarose good	Yes
chat	B03200032	1J0	38	is Junior a girl	No
chat	B03200087	1J0	83	who is Turkey	Alice
chat	B03200056	1J0	45	is Lisa1 a girl	Yes
chat	B03200089	1J0	51	Who talk to you?	Andy
chat	B03200097	1J0	171	isn't Andy 23 	No
chat	B03200032	1J0	39	is Cheney a girl	Yes
chat	B03200097	1J0	172	is Andy 23 	Yes
chat	B03200046	1J0	225	who is a student that is old?	Andy
chat	B03200012	1J0	244	isn't Filibee good	Yes
chat	B03200012	1J0	245	is Mandy good	Yes
chat	B03200097	1J0	173	isn't Stefan 23	Yes
chat	B03200046	1J0	226	who is a student that is beautiful?	Jessie
chat	B03200032	1J0	40		\N
chat	B03200012	1J0	247	is Dora good	Yes
chat	B03200046	1J0	227	Who is male that is old?	Andy
chat	B03200012	1J0	249	is Cherry2 good	Yes
chat	B03200032	1J0	42		\N
chat	B03200087	1J0	85	whose name is YiSian?	Alice
chat	B03200097	1J0	176	isn't Viola1 23 	No
chat	B03200012	1J0	250	isn't Cherry2 good	Yes
chat	B03200046	1J0	228		\N
chat	B03200087	1J0	86	whose name is Lisa1?	Alice
chat	B03200091	1J0	34	is he a stranger?	--
chat	B03200046	1J0	229		\N
chat	B03200046	1J0	231		\N
chat	B03200019	1J0	68	Which student studied in the MUST?	Demi
chat	B03200032	1J0	43	Is Alice a beautiful girl	Yes
chat	B03200097	1J0	178	isn't YiSian  23	No
chat	B03200063	1J0	59	whose name is	Cherry2
chat	B03200032	1J0	44	Is Ariel a beautiful girl	Yes
chat	B03200019	1J0	69	Which one of the students studied in the MUST?	Demi
chat	B03200097	1J0	179	is Jack 23	No
chat	B03200019	1J0	70	Which one of the students studing in the MUST?	Dora
chat	B03200097	1J0	180	isn't Jack 23	No
chat	B03200032	1J0	45	Is Marian a beautiful girl	Yes
chat	B03200034	1J0	62	whose name is Andy?	--
chat	B03200019	1J0	71	Which one of the students studing at the MUST?	Mandy
chat	B03200089	1J0	58	Whose age isn't 21?	Ariel
chat	B03200034	1J0	63		\N
chat	B03200032	1J0	47		\N
chat	B03200091	1J0	37	Who greet to Andy?	Viola1
chat	B03200034	1J0	66	whose name is Andy?	Alice
chat	B03200034	1J0	67		\N
chat	B03200087	1J0	88	whose name is Viola1?	Alice
chat	B03200003	1J0	42	Doesn't Alice a good girl? 	Mandy
chat	B03200012	1J0	253	who is old	Andy
chat	B03200089	1J0	63	Whose name is Alice?	Alice
chat	B03200034	1J0	70	whose name is Ellarose?	Annie
chat	B03200034	1J0	71		\N
chat	B03200091	1J0	39	Who like Jack?	--
chat	B03200097	1J0	187	is Sabrina 23	No
chat	B03200089	1J0	65	who is good?	Sabrina
chat	B03200074	1J0	29	who is Sabrina ?	Sabrina
chat	B03200012	1J0	254	who isn't from Turkey	Annie
chat	B03200097	1J0	191	is Lisa1 22	No
chat	B03200063	1J0	64	whose name is YiSian	Alice
chat	B03200089	1J0	66	who is a good student?	Dora
chat	B03200087	1J0	90	whose name is Jack?	Alice
chat	B03200063	1J0	65	whose name is Demi	Alice
chat	B03200056	1J0	51	Is Annie a woman?	Yes
chat	B03200052	1J0	42	isn't he 18	Andy
chat	B03200063	1J0	67	whose name is Stefan	Alice
chat	B03200087	1J0	91	is Ellarose young?	Yes
chat	B03200012	1J0	256	who isn't stranger	Viola1
chat	B03200087	1J0	92	is Filibee old?	Yes
chat	B03200089	1J0	70	who is a good man?	Andy
chat	B03200089	1J0	71	who is a good man?	Ariel
chat	B03200034	1J0	76	whose name is USA?	Alice
chat	B03200089	1J0	74	Who isn't young?	Sabrina
chat	B03200091	1J0	41	who like to talk to Annie?	--
chat	B03200012	1J0	263	who isn't Lisa1	Maggie
chat	B03200091	1J0	42	Does Annie like to talk?	Yes
chat	B03200091	1J0	43	Does Annie like to talk?	--
chat	B03200012	1J0	265	who isn't Cherry2	Annie
chat	B03200097	1J0	199	who isn't Mandy	Cheney
chat	B03200012	1J0	268	who isn't Viola1	Sabrina
chat	B03200012	1J0	269	who isn't Ellarose	Viola1
chat	B03200097	1J0	202	who isn't Marian	Andy
chat	B03200097	1J0	203	who isn't Junior 	Alice
chat	B03200089	1J0	83	Do they like Andy?	No
chat	B03200097	1J0	206	who isn't 21	Sabrina
chat	B03200089	1J0	87	is Maggie an old stranger ?	No
chat	B03200089	1J0	94	is Maggie a good name?	Yes
chat	B03200097	1J0	209		\N
chat	B03200062	1J0	34		\N
chat	B03200032	1J0	51		\N
chat	B03200032	1J0	52		\N
chat	B03200088	1J0	25		\N
chat	B03200088	1J0	26		\N
chat	B03200012	1J0	242	isn't Ellarose good	Yes
chat	B03200087	1J0	84	who is Ariel?	Ariel
chat	B03200012	1J0	243	is Filibee good	Yes
chat	B03200056	1J0	46	Is Dora a good student?	Yes
chat	B03200056	1J0	47	Is Jessie from Taiwan	No
chat	B03200089	1J0	52	Who ask you?	Sabrina
chat	B03200012	1J0	246	isn't Mandy good	Yes
chat	B03200097	1J0	174	is Stefan 23	Yes
chat	B03200032	1J0	41		\N
chat	B03200012	1J0	248	isn't Dora good	Yes
chat	B03200097	1J0	175	is Viola1 23	No
chat	B03200089	1J0	53	is Maggie good?	Yes
chat	B03200091	1J0	33	Isn't Andy a stranger ?	Yes
chat	B03200089	1J0	54	is Maggie young?	No
chat	B03200046	1J0	230		\N
chat	B03200046	1J0	232		\N
chat	B03200012	1J0	251	whose name is Viola1	Viola1
chat	B03200089	1J0	55	is Maggie beautiful?	Yes
chat	B03200097	1J0	177	is YiSian 23	No
chat	B03200034	1J0	60	whose name is Andy	Alice
chat	B03200089	1J0	56	isn't Maggie beautiful?	Yes
chat	B03200006	1J0	20	Whose name is Andy?                                                                                                                                                                                                                               	--
chat	B03200063	1J0	60	whose name is Alice	Alice
chat	B03200091	1J0	35	ls Cheney right?	--
chat	B03200012	1J0	252	who doesn't good 	Annie
chat	B03200091	1J0	36	ls she right?	--
chat	B03200034	1J0	61	whose name is Andy?	Andy
chat	B03200089	1J0	57	isn't Maggie old?	No
chat	B03200006	1J0	21	Whose name is Alice?	Alice
chat	B03200063	1J0	61	whose name is Dora	Dora
chat	B03200087	1J0	87	whose name is Sabrina	Alice
chat	B03200032	1J0	46	Is YiSian a beautiful girl	Yes
chat	B03200089	1J0	59	Whose age isn't 21?	Dora
chat	B03200032	1J0	48		\N
chat	B03200034	1J0	64	whose name is Andy?	--
chat	B03200034	1J0	65		\N
chat	B03200089	1J0	60	Who isn't from the USA?	Lisa1
chat	B03200097	1J0	181	is Jessie 23	No
chat	B03200097	1J0	182	isn't Jessie 23	No
chat	B03200089	1J0	61	Who isn't from the USA?	Sabrina
chat	B03200089	1J0	62	Who isn't from the USA?	Demi
chat	B03200097	1J0	183	is Annie 23	No
chat	B03200087	1J0	89	whose name is Filibee?	Alice
chat	B03200097	1J0	184	isn't Annie 23	No
chat	B03200091	1J0	38	Is Dora a girl?	Alice
chat	B03200034	1J0	68	whose name is Andy?	Sabrina
chat	B03200034	1J0	69		\N
chat	B03200032	1J0	49	who don't like to talk to stranger	Alice
chat	B03200097	1J0	185	is Marian 23	No
chat	B03200063	1J0	62	whose name is Ellarose	Alice
chat	B03200097	1J0	186	isn't Marian 23	No
chat	B03200089	1J0	64	who is good?	Maggie
chat	B03200034	1J0	72	whose name is Ellarose?	Alice
chat	B03200034	1J0	73	whose name is MUST	Alice
chat	B03200097	1J0	188	is Sabrina 21	No
chat	B03200097	1J0	189	is Lisa1 23	No
chat	B03200063	1J0	63	whose name is Turkey	Alice
chat	B03200056	1J0	48	Is YiSian from Taiwan	No
chat	B03200097	1J0	190	isn't Lisa1 23	No
chat	B03200097	1J0	192	isn't Lisa1 23	No
chat	B03200056	1J0	49	Is Marian a good student?	Yes
chat	B03200012	1J0	255	who isn't from USA 	Alice
chat	B03200089	1J0	67	who is a good girl?	Maggie
chat	B03200063	1J0	66	whose name is Junior	Alice
chat	B03200097	1J0	193	is USA 23	No
chat	B03200056	1J0	50	is Cherry2 young?	Yes
chat	B03200052	1J0	41	who is her name?	Annie
chat	B03200089	1J0	68	who is a good girl?	Mandy
chat	B03200089	1J0	69	who is a good woman?	Sabrina
chat	B03200063	1J0	68	whose name is Lisa1	Cherry2
chat	B03200012	1J0	257	who isn't a man	Annie
chat	B03200087	1J0	93	is Filibee  beautiful	Yes
chat	B03200087	1J0	94	is MUST old?	Yes
chat	B03200097	1J0	194		\N
chat	B03200097	1J0	195		\N
chat	B03200097	1J0	196		\N
chat	B03200097	1J0	197		\N
chat	B03200089	1J0	72	who is a good woman?	Mandy
chat	B03200012	1J0	258	who isn't Jessie	Sabrina
chat	B03200034	1J0	74	whose name is Mandy?	Demi
chat	B03200089	1J0	73	who is a good woman?	Annie
chat	B03200034	1J0	75	whose name is Mandy?	Alice
chat	B03200034	1J0	77	whose name is Viola1?	Sabrina
chat	B03200012	1J0	259	who isn't Stefan	Alice
chat	B03200012	1J0	260	who isn't Mandy	Annie
chat	B03200012	1J0	261	who isn't Annie	Alice
chat	B03200089	1J0	75	Isn't it right	No
chat	B03200089	1J0	76	Isn't it right	--
chat	B03200091	1J0	40	who lie to talk to Annie?	Viola1
chat	B03200089	1J0	77	Isn't it right	Yes
chat	B03200012	1J0	262	who isn't Maggie	Alice
chat	B03200089	1J0	78	is she from Taiwan	Yes
chat	B03200089	1J0	79	is she from Taiwan?	No
chat	B03200012	1J0	264	who isn't Marian	Sabrina
chat	B03200089	1J0	80	is Jessie from Taiwan?	No
chat	B03200097	1J0	198	who isn't Filibee 	Annie
chat	B03200012	1J0	266	who isn't Cheney	Mandy
chat	B03200012	1J0	267	who isn't Dora	Alice
chat	B03200089	1J0	81	is Andy a stranger?	No
chat	B03200097	1J0	200	who is Mandy 	Mandy
chat	B03200097	1J0	201	who isn't Marian	Maggie
chat	B03200089	1J0	82	Is Andy a stranger?	No
chat	B03200097	1J0	204	who isn't 23	Sabrina
chat	B03200097	1J0	205	who isn't 22	Sabrina
chat	B03200089	1J0	84	Aren't they young?	Yes
chat	B03200097	1J0	207	who isn't 15	Sabrina
chat	B03200089	1J0	86	is Maggie an old student?	No
chat	B03200089	1J0	88	is Maggie a good stranger ?	No
chat	B03200089	1J0	89	is Maggie a good name?	Yes
chat	B03200089	1J0	91	is Alice a good name?	Yes
chat	193001	1J0	31	Does Filibee tell Mandy that he is from Taiwan?	No
chat	B03200089	1J0	93	is Annie a good name?	Yes
chat	B03200089	1J0	95	is Jessie a good name?	Yes
chat	193001	1J0	32	Does Filibee tell Mandy  that he is from Turkey?	No
chat	B03200032	1J0	50		\N
chat	193001	1J0	33	Does Filibee tell a stranger  that he is from Turkey?	No
chat	B03200089	1J0	85	is Maggie an old woman?	No
chat	193001	1J0	30	Does a stranger say he is from Taiwan?	Yes
chat	B03200089	1J0	90	is Andy a good name?	Yes
chat	B03200089	1J0	92	is Ariel a good name?	Yes
chat	B03200097	1J0	208		\N
chat	B03200031	1J0	23		\N
chat	B03200031	1J0	24	Dose Mandy say Hello?	No
chat	B03200031	1J0	25	Dose Mandy say Hello?	Yes
\.


--
-- Data for Name: wh; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY wh (exercise, player, league, try, score, questionchance, answerchance) FROM stdin;
AFB1J0	193001	1J0	0	0	24	8
siar	B01202104	1J0	2	0	23	24
siar	B03200056	1J0	14	1	17	23
oliver	B03200029	1J0	4	0	24	8
oliver	B03200092	1J0	0	0	24	8
oliver	B03200056	1J0	1	0	24	8
oliver	B03200094	1J0	0	0	24	8
oliver	B03200087	1J0	3	0	23	8
oliver	B03200071	1J0	0	0	24	8
oliver	B03200042	1J0	0	0	24	8
oliver	B03200034	1J0	0	0	24	8
oliver	B03200012	1J0	0	0	24	8
siar	B03200062	1J0	15	0	23	20
oliver	B03200040	1J0	5	0	24	8
oliver	B03200032	1J0	0	0	24	8
oliver	B03200018	1J0	0	0	24	8
oliver	B03200074	1J0	0	0	24	8
oliver	B03200037	1J0	0	0	24	8
oliver	B03200002	1J0	0	0	24	8
oliver	B03200039	1J0	0	0	24	8
oliver	B03200054	1J0	0	0	24	8
oliver	B03200030	1J0	0	0	24	8
oliver	B03200046	1J0	1	0	24	8
cooking-test	193001	FLA0026	0	0	24	8
siar	B03200054	1J0	11	1	21	24
siar	B03200098	1J0	56	0	22	23
siar	B03200046	1J0	27	5	15	22
siar	193001	1J0	9	2	24	2
oliver	B03200067	1J0	10	0	16	8
oliver	193001	1J0	13	0	9	6
oliver	B03200031	1J0	1	0	23	8
oliver	B03200019	1J0	2	0	24	8
siar	B03200091	1J0	0	0	24	24
oliver	B03200075	1J0	0	0	24	8
oliver	B03200073	1J0	3	1	24	8
oliver	B03200057	1J0	2	1	23	8
oliver	B03200097	1J0	1	0	24	8
oliver	B03200083	1J0	2	0	24	8
oliver	B03200078	1J0	3	1	23	8
oliver	B03200109	1J0	2	0	24	6
oliver	B03200093	1J0	2	2	24	8
oliver	B03200082	1J0	5	0	24	8
siar	B03200003	1J0	17	0	24	22
siar	B03200087	1J0	32	0	13	23
clay	V0141008	FLA0017	0	0	1000	1000
siar	B03200060	1J0	0	0	24	24
clay	V0141009	FLA0017	0	0	1000	1000
clay	V0141019	FLA0017	0	0	1000	1000
chat	B03200037	1J0	12	2	998	998
siar	B03200084	1J0	8	0	24	24
siar	B03200088	1J0	1	0	23	24
siar	B03200034	1J0	38	0	6	21
siar	B03200018	1J0	22	3	17	22
siar	B03200019	1J0	25	1	23	24
chat	B03200012	1J0	77	40	991	998
siar	B03200093	1J0	4	1	24	21
clay	V0141029	FLA0017	0	0	1000	1000
siar	B03200064	1J0	1	0	23	24
siar	B03200050	1J0	9	0	19	24
siar	B03200083	1J0	62	0	11	21
clay	V0141002	FLA0017	13	1	995	1000
clay	V0141035	FLA0017	19	4	992	1000
chat	B03200006	1J0	6	1	999	1000
siar	B03200082	1J0	19	2	24	21
siar	B03200063	1J0	26	0	16	15
clay	V0141016	FLA0017	7	0	1000	1000
siar	B03200045	1J0	16	0	18	24
clay	V0141021	FLA0017	8	0	998	1000
siar	B03200089	1J0	22	2	22	21
clay	V0141017	FLA0017	3	1	999	1000
siar	B03200094	1J0	10	4	22	24
siar	B03200006	1J0	5	0	23	24
intros	193001	1J0	0	0	1000	1000
siar	B03200074	1J0	11	1	21	22
siar	B03200097	1J0	14	4	22	24
siar	B03200012	1J0	51	6	18	22
siar	B03200039	1J0	11	0	22	24
siar	B03200042	1J0	18	0	22	24
chat	B03200063	1J0	33	2	991	995
siar	B03200092	1J0	4	2	23	24
siar	B01202106	1J0	19	0	18	20
siar	B03200032	1J0	30	2	12	22
siar	B03200106	1J0	9	0	17	23
clay	193001	FLA0017	1	0	24	24
siar	B03200071	1J0	16	0	19	24
siar	B03200013	1J0	5	0	23	24
siar	B03200040	1J0	13	1	22	24
siar	B03200052	1J0	25	0	17	24
siar	B03200078	1J0	36	0	18	22
siar	B03200109	1J0	20	1	19	24
siar	B03200037	1J0	14	0	17	24
siar	B03200031	1J0	15	1	18	24
siar	B03200102	1J0	30	0	24	24
siar	B03200029	1J0	24	0	20	22
chat	B03200071	1J0	6	0	998	1000
clay	V0141018	FLA0017	10	0	1000	1000
chat	B03200083	1J0	3	0	1000	1000
chat	B03200088	1J0	0	0	1000	1000
chat	B03200031	1J0	0	0	1000	1000
chat	B03200097	1J0	36	14	998	994
chat	193001	1J0	1	0	1000	999
chat	B03200056	1J0	10	0	999	996
chat	B03200046	1J0	57	18	976	999
chat	B03200034	1J0	59	2	991	1000
chat	B03200050	1J0	7	0	999	1000
chat	B03200092	1J0	14	1	1000	996
chat	B03200074	1J0	9	0	1000	996
chat	B01202106	1J0	25	6	996	999
chat	B03200102	1J0	9	0	999	1000
chat	B03200078	1J0	12	1	999	997
chat	B03200052	1J0	20	2	989	1000
chat	B03200040	1J0	6	0	999	1000
chat	B03200089	1J0	36	8	998	1000
chat	B99110055	1J0	21	0	988	1000
chat	B03200091	1J0	16	2	996	1000
chat	B03200087	1J0	47	7	980	992
chat	B03200062	1J0	14	3	997	999
chat	B03200094	1J0	13	4	997	999
chat	B03200045	1J0	2	1	1000	1000
chat	B03200054	1J0	0	0	1000	1000
chat	B03200042	1J0	8	1	998	999
chat	B03200039	1J0	5	0	1000	997
chat	B03200013	1J0	18	2	997	993
chat	B03200060	1J0	51	3	984	999
chat	B03200018	1J0	14	0	993	997
chat	B03200029	1J0	25	1	995	1000
chat	B03200019	1J0	20	0	999	1000
chat	B03200003	1J0	14	1	996	1000
chat	B03200032	1J0	7	2	998	1000
chat	B03200082	1J0	49	11	990	997
chat	B03200110	1J0	12	0	1000	1000
chat	B01202104	1J0	13	8	999	997
\.


--
-- Data for Name: word; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY word (exercise, string) FROM stdin;
oliver	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>Oliver <TR><TD>Pan YanMin <TR><TD>PingZhen <TR><TD>Taipei <TR><TD>Kainan University\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>Adjective:<TD>Chinese favorite happy humorous optimistic positive relaxed\n<TR><TD>Adverb:<TD>\n<TR><TD>Auxiliary:<TD>doesn't don't does do is are isn't aren't\n<TR><TD>Conjunction:<TD>when\n<TR><TD>Determiner:<TD>a an the four 's\n<TR><TD>Noun:<TD>court family father mother name "older sister" people person sport basketball "listening to music" "free time" "what he wants"\n<TR><TD>Proper Noun:<TD>Oliver "Pan YanMin" PingZhen Taipei "Kainan University"\n<TR><TD>Preposition:<TD>as for in on\n<TR><TD>Pronoun:<TD>who whom whose\n<TR><TD>Relative Pronoun:<TD>that who\n<TR><TD>Question Tag:<TD>"doesn't he" "doesn't she" "doesn't it" "don't they" "does he" "does she" "does it" "do they" "isn't he" "isn't she" "isn't it" "aren't they" "is he" "is she" "is it" "are they"\n<TR><TD>Verb:<TD>"feel, feels" "focus, focuses" "have, has" "live, lives" "love, loves" "make, makes" "study, studies" "think, thinks"\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>':<TD> 's\n<TR><TD>A:<TD> are aren't a an as "aren't they" "are they"\n<TR><TD>B:<TD> basketball\n<TR><TD>C:<TD> court\n<TR><TD>D:<TD> doesn't don't does do "doesn't he" "doesn't she" "doesn't it" "don't they" "does he" "does she" "does it" "do they"\n<TR><TD>E:<TD>\n<TR><TD>F:<TD> favorite four family father "free time" for "feel, feels" "focus, focuses"\n<TR><TD>G:<TD>\n<TR><TD>H:<TD> happy humorous "have, has"\n<TR><TD>I:<TD> is isn't in "isn't he" "isn't she" "isn't it" "is he" "is she" "is it"\n<TR><TD>J:<TD>\n<TR><TD>K:<TD>\n<TR><TD>L:<TD> "listening to music" "live, lives" "love, loves"\n<TR><TD>M:<TD> mother "make, makes"\n<TR><TD>N:<TD> name\n<TR><TD>O:<TD> optimistic "older sister" on\n<TR><TD>P:<TD> positive people person\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> relaxed\n<TR><TD>S:<TD> sport "study, studies"\n<TR><TD>T:<TD> the that "think, thinks"\n<TR><TD>U:<TD>\n<TR><TD>V:<TD>\n<TR><TD>W:<TD> when "what he wants" who whom whose who\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD>\n<TR><TD>Z:<TD>\n</TABLE>
clay	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>City Hall <TR><TD>Frank <TR><TD>Michigan <TR><TD>So-and-so <TR><TD>Rebia <TR><TD>Rebia and Frank <TR><TD>Frank and Rebia\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>Adjective:<TD>beautiful best big biological first fourth happy magnificent married oldest pregnant seventeen three ugly\n<TR><TD>Adverb:<TD>\n<TR><TD>Auxiliary:<TD>doesn't favorite don't does do is are isn't aren't\n<TR><TD>Conjunction:<TD>when\n<TR><TD>Determiner:<TD>a an the go three five 's\n<TR><TD>Noun:<TD>altercation bedroom boyfriend child class_ring dad day door dresser engagement_ring father finger gentleman guy house kid knee name note ring_box thing wedding_ring wife woman year back son whisper dinner home popcorn stuff "true love" details\n<TR><TD>Proper Noun:<TD>"City Hall" Frank Michigan So-and-so Rebia "Rebia and Frank" "Frank and Rebia"\n<TR><TD>Preposition:<TD>as "down on" "down to" for in on over_to to\n<TR><TD>Pronoun:<TD>who whom whose\n<TR><TD>Relative Pronoun:<TD>that who\n<TR><TD>Question Tag:<TD>"doesn't he" "doesn't she" "doesn't it" "don't they" "does he" "does she" "does it" "do they" "isn't he" "isn't she" "isn't it" "aren't they" "is he" "is she" "is it" "are they"\n<TR><TD>Verb:<TD>believe burn come feel find give go get grab have hand help hang know laugh look make meet move put run remember see say separate shake shoot talk tell try walk\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>':<TD> 's\n<TR><TD>A:<TD> are aren't a an altercation as "aren't they" "are they"\n<TR><TD>B:<TD> beautiful best big biological bedroom boyfriend back believe burn\n<TR><TD>C:<TD> child class_ring come\n<TR><TD>D:<TD> doesn't don't does do dad day door dresser dinner details "down on" "down to" "doesn't he" "doesn't she" "doesn't it" "don't they" "does he" "does she" "does it" "do they"\n<TR><TD>E:<TD> engagement_ring\n<TR><TD>F:<TD> first fourth favorite five father finger for feel find\n<TR><TD>G:<TD> go gentleman guy give go get grab\n<TR><TD>H:<TD> happy house home have hand help hang\n<TR><TD>I:<TD> is isn't in "isn't he" "isn't she" "isn't it" "is he" "is she" "is it"\n<TR><TD>J:<TD>\n<TR><TD>K:<TD> kid knee know\n<TR><TD>L:<TD> laugh look\n<TR><TD>M:<TD> magnificent married make meet move\n<TR><TD>N:<TD> name note\n<TR><TD>O:<TD> oldest on over_to\n<TR><TD>P:<TD> pregnant popcorn put\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> ring_box run remember\n<TR><TD>S:<TD> seventeen son stuff see say separate shake shoot\n<TR><TD>T:<TD> three the three thing "true love" to that talk tell try\n<TR><TD>U:<TD> ugly\n<TR><TD>V:<TD>\n<TR><TD>W:<TD> when wedding_ring wife woman whisper who whom whose who walk\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD> year\n<TR><TD>Z:<TD>\n</TABLE>
candidate	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>Barbara <TR><TD>Tadeusz <TR><TD>Eva <TR><TD>Dr Bean <TR><TD>Fast-Track\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>Adjective:<TD>ambitious bad competitive confident difficult "difficult to work with" fast good main many next outgoing patient possible realistic successful true various\n<TR><TD>Adverb:<TD>hard really slowly soon well "in the long term"\n<TR><TD>Auxiliary:<TD>doesn't don't does do is are isn't aren't would should\n<TR><TD>Conjunction:<TD>because if\n<TR><TD>Determiner:<TD>'s "0, _ or zero" a an no some the five "a few" any "a lot of"\n<TR><TD>Noun:<TD>ability "administration of the sales team" aim company department director head job judgement learner "local business club" market "market share" "Fast-Track material" people personality Polish result risk "safe pair of hands" "sales experience" "sales team" "thing things" time top "training course" year\n<TR><TD>Proper Noun:<TD>Barbara Tadeusz Eva "Dr Bean" Fast-Track\n<TR><TD>Preposition:<TD>for in of over to with\n<TR><TD>Pronoun:<TD>who whom\n<TR><TD>Relative Pronoun:<TD>that who\n<TR><TD>Question Tag:<TD>"doesn't he" "doesn't she" "doesn't it" "don't they" "does he" "does she" "does it" "do they" "isn't he" "isn't she" "isn't it" "aren't they" "is he" "is she" "is it" "are they"\n<TR><TD>Verb:<TD>"become, becomes" can know "apply, applies" choose do enjoy expand feel "get to" "get, gets" "have, has" help improve increase lead like motivate offer "organize organizing" respect say "sell, selling" start take "tell, telling" "think, thinks" try "want, wants" win work\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>':<TD> 's\n<TR><TD>A:<TD> ambitious are aren't a an "a few" any "a lot of" ability "administration of the sales team" aim "aren't they" "are they" "apply, applies"\n<TR><TD>B:<TD> bad because "become, becomes"\n<TR><TD>C:<TD> competitive confident company can choose\n<TR><TD>D:<TD> difficult "difficult to work with" doesn't don't does do department director "doesn't he" "doesn't she" "doesn't it" "don't they" "does he" "does she" "does it" "do they" do\n<TR><TD>E:<TD> enjoy expand\n<TR><TD>F:<TD> fast five for feel\n<TR><TD>G:<TD> good "get to" "get, gets"\n<TR><TD>H:<TD> hard head "have, has" help\n<TR><TD>I:<TD> "in the long term" is isn't if in "isn't he" "isn't she" "isn't it" "is he" "is she" "is it" improve increase\n<TR><TD>J:<TD> job judgement\n<TR><TD>K:<TD> know\n<TR><TD>L:<TD> learner "local business club" lead like\n<TR><TD>M:<TD> main many market "market share" motivate\n<TR><TD>N:<TD> next no\n<TR><TD>O:<TD> outgoing of over offer "organize organizing"\n<TR><TD>P:<TD> patient possible people personality\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> realistic really result risk respect\n<TR><TD>S:<TD> successful slowly soon should some "safe pair of hands" "sales experience" "sales team" say "sell, selling" start\n<TR><TD>T:<TD> true the "thing things" time top "training course" to that take "tell, telling" "think, thinks" try\n<TR><TD>U:<TD>\n<TR><TD>V:<TD> various\n<TR><TD>W:<TD> well would with who whom who "want, wants" win work\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD> year\n<TR><TD>Z:<TD>\n</TABLE>
siar	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>Simon <TR><TD>Ariel <TR><TD>ChiYuan Tien <TR><TD>Minghu Junior High School <TR><TD>Taipei <TR><TD>WenHua University\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>Adjective:<TD>Chinese English favorite happy humorous optimistic positive relaxed "19 years old" logical relaxed\n<TR><TD>Adverb:<TD>\n<TR><TD>Auxiliary:<TD>doesn't favorite don't does do is are isn't aren't\n<TR><TD>Conjunction:<TD>when\n<TR><TD>Determiner:<TD>a an the three five 's\n<TR><TD>Noun:<TD>family father friend mother name "older brother" people person "younger sister" "song, songs" sport subject "tour guide" translator baseball drums guitar "playing guitar" "playing drums"\n<TR><TD>Proper Noun:<TD>Simon Ariel "ChiYuan Tien" "Minghu Junior High School" Taipei "WenHua University"\n<TR><TD>Preposition:<TD>as for in on to\n<TR><TD>Pronoun:<TD>who whom whose\n<TR><TD>Relative Pronoun:<TD>that who\n<TR><TD>Question Tag:<TD>"doesn't he" "doesn't she" "doesn't it" "don't they" "does he" "does she" "does it" "do they" "isn't he" "isn't she" "isn't it" "aren't they" "is he" "is she" "is it" "are they"\n<TR><TD>Verb:<TD>"feel, feels" "have, has" "listen, listens, listening" "like, likes" "live, lives" "love, loves" "make, makes" "play, plays, playing" "study, studies"\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>':<TD> 's\n<TR><TD>A:<TD> are aren't a an as "aren't they" "are they"\n<TR><TD>B:<TD> baseball\n<TR><TD>C:<TD>\n<TR><TD>D:<TD> doesn't don't does do drums "doesn't he" "doesn't she" "doesn't it" "don't they" "does he" "does she" "does it" "do they"\n<TR><TD>E:<TD>\n<TR><TD>F:<TD> favorite favorite five family father friend for "feel, feels"\n<TR><TD>G:<TD> guitar\n<TR><TD>H:<TD> happy humorous "have, has"\n<TR><TD>I:<TD> is isn't in "isn't he" "isn't she" "isn't it" "is he" "is she" "is it"\n<TR><TD>J:<TD>\n<TR><TD>K:<TD>\n<TR><TD>L:<TD> logical "listen, listens, listening" "like, likes" "live, lives" "love, loves"\n<TR><TD>M:<TD> mother "make, makes"\n<TR><TD>N:<TD> name\n<TR><TD>O:<TD> optimistic "older brother" on\n<TR><TD>P:<TD> positive people person "playing guitar" "playing drums" "play, plays, playing"\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> relaxed relaxed\n<TR><TD>S:<TD> "song, songs" sport subject "study, studies"\n<TR><TD>T:<TD> the three "tour guide" translator to that\n<TR><TD>U:<TD>\n<TR><TD>V:<TD>\n<TR><TD>W:<TD> when who whom whose who\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD> "younger sister"\n<TR><TD>Z:<TD>\n</TABLE>
chat	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>Alice <TR><TD>Ariel <TR><TD>Ellarose <TR><TD>Filibee <TR><TD>Junior <TR><TD>Mandy <TR><TD>MUST <TR><TD>Sabrina <TR><TD>Taiwan <TR><TD>Turkey <TR><TD>USA <TR><TD>Dora <TR><TD>Cheney <TR><TD>Andy <TR><TD>Cherry2 <TR><TD>Viola1 <TR><TD>Marian <TR><TD>Lisa1 <TR><TD>YiSian <TR><TD>Jessie <TR><TD>Demi <TR><TD>Maggie <TR><TD>Annie <TR><TD>Jack <TR><TD>Stefan\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>Adjective:<TD>15 16 18 19 21 22 23 beautiful female good Hispanic male old right young\n<TR><TD>Adverb:<TD>from in like on or to\n<TR><TD>Auxiliary:<TD>doesn't don't does do is are isn't aren't\n<TR><TD>Conjunction:<TD>when\n<TR><TD>Determiner:<TD>a an the 's\n<TR><TD>Noun:<TD>age girl man name stranger student woman\n<TR><TD>Proper Noun:<TD>Alice Ariel Ellarose Filibee Junior Mandy MUST Sabrina Taiwan Turkey USA Dora Cheney Andy Cherry2 Viola1 Marian Lisa1 YiSian Jessie Demi Maggie Annie Jack Stefan\n<TR><TD>Preposition:<TD>\n<TR><TD>Pronoun:<TD>who whom whose\n<TR><TD>Relative Pronoun:<TD>that who\n<TR><TD>Question Tag:<TD>"doesn't he" "doesn't she" "doesn't it" "don't they" "does he" "does she" "does it" "do they" "isn't he" "isn't she" "isn't it" "aren't they" "is he" "is she" "is it" "are they"\n<TR><TD>Verb:<TD>ask come disconnect greet guess say talk tell understand\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>':<TD> 's\n<TR><TD>A:<TD> are aren't a an age "aren't they" "are they" ask\n<TR><TD>B:<TD> beautiful\n<TR><TD>C:<TD> come\n<TR><TD>D:<TD> doesn't don't does do "doesn't he" "doesn't she" "doesn't it" "don't they" "does he" "does she" "does it" "do they" disconnect\n<TR><TD>E:<TD>\n<TR><TD>F:<TD> female from\n<TR><TD>G:<TD> good girl greet guess\n<TR><TD>H:<TD>\n<TR><TD>I:<TD> in is isn't "isn't he" "isn't she" "isn't it" "is he" "is she" "is it"\n<TR><TD>J:<TD>\n<TR><TD>K:<TD>\n<TR><TD>L:<TD> like\n<TR><TD>M:<TD> male man\n<TR><TD>N:<TD> name\n<TR><TD>O:<TD> old on or\n<TR><TD>P:<TD>\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> right\n<TR><TD>S:<TD> stranger student say\n<TR><TD>T:<TD> to the that talk tell\n<TR><TD>U:<TD> understand\n<TR><TD>V:<TD>\n<TR><TD>W:<TD> when woman who whom whose who\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD> young\n<TR><TD>Z:<TD>\n</TABLE>
\.


--
-- Data for Name: yn; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY yn (exercise, player, league, try, score, questionchance, answerchance) FROM stdin;
AFB1J0	193001	1J0	0	0	18	6
oliver	B03200097	1J0	2	0	18	6
clay	V0141017	FLA0017	19	4	995	996
cooking-test	193001	FLA0026	0	0	18	6
oliver	B03200078	1J0	22	1	16	6
siar	B03200052	1J0	6	0	18	24
siar	B03200071	1J0	1	0	23	24
siar	B03200032	1J0	11	3	23	24
oliver	B03200012	1J0	8	1	18	6
siar	B03200064	1J0	0	0	24	24
siar	193001	1J0	7	2	17	6
oliver	B03200031	1J0	0	0	18	6
oliver	B03200032	1J0	1	1	18	6
oliver	B03200018	1J0	1	0	18	5
oliver	B03200019	1J0	1	0	18	6
oliver	B03200074	1J0	3	1	18	6
oliver	B03200040	1J0	0	0	18	6
oliver	B03200075	1J0	2	0	16	6
oliver	B03200037	1J0	10	2	16	6
oliver	B03200002	1J0	0	0	18	6
oliver	B03200092	1J0	3	0	17	5
oliver	B03200109	1J0	14	1	18	6
oliver	B03200029	1J0	0	0	18	6
oliver	B03200087	1J0	0	0	18	6
oliver	B03200039	1J0	11	1	15	6
oliver	B03200034	1J0	0	0	18	6
oliver	B03200054	1J0	1	0	18	5
oliver	B03200030	1J0	1	1	18	6
oliver	B03200046	1J0	3	1	17	6
oliver	B03200067	1J0	0	0	18	6
siar	B03200045	1J0	0	0	24	24
chat	B03200089	1J0	56	31	993	1000
siar	B03200054	1J0	0	0	24	24
siar	B03200106	1J0	0	0	24	24
siar	B03200089	1J0	35	4	18	24
siar	B03200034	1J0	15	0	15	20
siar	B03200102	1J0	5	1	21	24
oliver	B03200057	1J0	21	0	18	5
oliver	B03200083	1J0	0	0	18	6
siar	B03200093	1J0	0	0	24	24
siar	B03200109	1J0	0	0	24	24
oliver	B03200093	1J0	0	0	18	6
oliver	B03200056	1J0	49	1	18	5
oliver	B03200073	1J0	13	1	16	5
oliver	B03200071	1J0	1	1	18	6
oliver	B03200042	1J0	1	1	18	6
clay	V0141002	FLA0017	44	8	992	995
siar	B03200062	1J0	1	0	23	24
chat	B03200062	1J0	0	0	1000	1000
siar	B03200084	1J0	0	0	24	24
siar	B03200091	1J0	11	3	22	22
siar	B03200094	1J0	2	0	24	24
siar	B03200088	1J0	4	1	24	24
oliver	B03200094	1J0	13	0	16	5
oliver	B03200082	1J0	1	0	18	6
oliver	193001	1J0	22	0	6	5
siar	B03200019	1J0	4	0	22	24
siar	B03200013	1J0	3	0	22	24
siar	B03200056	1J0	40	7	17	17
clay	V0141021	FLA0017	1	1	1000	1000
siar	B03200097	1J0	18	9	19	24
clay	193001	FLA0017	2	2	24	24
siar	B03200083	1J0	20	3	22	23
siar	B03200082	1J0	20	1	22	23
siar	B03200092	1J0	12	0	24	24
clay	V0141035	FLA0017	7	1	997	999
siar	B03200003	1J0	1	0	23	24
siar	B03200046	1J0	12	1	18	23
siar	B01202106	1J0	4	0	23	23
siar	B03200078	1J0	2	0	23	24
siar	B03200006	1J0	3	0	22	24
siar	B03200060	1J0	7	0	22	24
siar	B03200031	1J0	18	3	21	23
siar	B03200040	1J0	25	1	21	22
clay	V0141008	FLA0017	0	0	1000	1000
siar	B03200029	1J0	19	1	19	22
siar	B03200039	1J0	1	0	24	24
clay	V0141019	FLA0017	12	8	1000	1000
siar	B03200087	1J0	30	2	6	20
siar	B03200037	1J0	15	4	23	24
siar	B03200042	1J0	1	1	24	24
clay	V0141029	FLA0017	32	3	985	995
siar	B03200074	1J0	4	0	23	23
clay	V0141009	FLA0017	8	2	997	999
chat	B03200018	1J0	11	5	1000	1000
siar	B01202104	1J0	28	2	15	21
siar	B03200063	1J0	25	3	21	18
siar	B03200098	1J0	19	0	24	23
clay	V0141016	FLA0017	13	2	997	998
siar	B03200050	1J0	3	0	24	23
clay	V0141018	FLA0017	35	2	997	999
chat	B03200097	1J0	85	50	998	988
siar	B03200018	1J0	37	7	9	22
siar	B03200012	1J0	25	8	22	22
intros	193001	1J0	0	0	1000	1000
chat	B03200037	1J0	2	1	1000	1000
chat	B03200029	1J0	27	2	998	999
chat	B03200046	1J0	51	6	969	1000
chat	B03200071	1J0	2	1	1000	1000
chat	B03200056	1J0	16	14	1000	1000
chat	B03200003	1J0	0	0	1000	1000
chat	B03200040	1J0	0	0	1000	1000
chat	B03200092	1J0	1	0	1000	1000
chat	B03200074	1J0	2	2	1000	1000
chat	B03200083	1J0	45	5	986	1000
chat	B03200031	1J0	9	3	999	999
chat	B01202106	1J0	5	2	999	1000
chat	B03200012	1J0	77	51	996	998
chat	B03200102	1J0	9	0	995	1000
chat	B03200063	1J0	22	17	999	1000
chat	B03200088	1J0	8	1	998	1000
chat	B03200078	1J0	1	1	1000	1000
chat	B03200034	1J0	8	0	1000	996
chat	B03200052	1J0	8	0	996	1000
chat	B03200091	1J0	20	6	992	999
chat	193001	1J0	12	0	1000	1000
chat	B03200006	1J0	11	1	995	1000
chat	B01202104	1J0	0	0	1000	1000
chat	B03200039	1J0	0	0	1000	1000
chat	B03200082	1J0	40	11	990	1000
chat	B03200045	1J0	1	0	1000	1000
chat	B03200060	1J0	0	0	1000	1000
chat	B03200032	1J0	25	20	998	1000
chat	B03200110	1J0	4	0	1000	1000
chat	B03200087	1J0	42	25	984	1000
chat	B03200054	1J0	14	3	998	998
chat	B03200019	1J0	15	1	999	998
chat	B99110055	1J0	0	0	1000	1000
chat	B03200050	1J0	8	2	999	1000
chat	B03200013	1J0	7	0	1000	999
chat	B03200042	1J0	3	1	1000	1000
chat	B03200094	1J0	20	2	987	1000
\.


--
-- Name: character_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (entity, exercise);


--
-- Name: exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY exercise
    ADD CONSTRAINT exercise_pkey PRIMARY KEY (genre, id);


--
-- Name: genre_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: league_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY league
    ADD CONSTRAINT league_pkey PRIMARY KEY (id);


--
-- Name: leaguegenre_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY leaguegenre
    ADD CONSTRAINT leaguegenre_pkey PRIMARY KEY (league);


--
-- Name: member_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_pkey PRIMARY KEY (player, league);


--
-- Name: play_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY play
    ADD CONSTRAINT play_pkey PRIMARY KEY (player, league, course, question, exercise);


--
-- Name: player_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: question_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY question
    ADD CONSTRAINT question_pkey PRIMARY KEY (lexed, exercise, league);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: rolebearer_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY rolebearer
    ADD CONSTRAINT rolebearer_pkey PRIMARY KEY (player, role);


--
-- Name: s_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY s
    ADD CONSTRAINT s_pkey PRIMARY KEY (player, league, exercise);


--
-- Name: session_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: tag_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (player, league, exercise);


--
-- Name: try_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY try
    ADD CONSTRAINT try_pkey PRIMARY KEY (player, league, exercise, try);


--
-- Name: wh_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY wh
    ADD CONSTRAINT wh_pkey PRIMARY KEY (player, league, exercise);


--
-- Name: word_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY word
    ADD CONSTRAINT word_pkey PRIMARY KEY (exercise);


--
-- Name: yn_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY yn
    ADD CONSTRAINT yn_pkey PRIMARY KEY (player, league, exercise);


--
-- Name: leaguegenre_idx_genre; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX leaguegenre_idx_genre ON leaguegenre USING btree (genre);


--
-- Name: member_idx_league; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX member_idx_league ON member USING btree (league);


--
-- Name: member_idx_player; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX member_idx_player ON member USING btree (player);


--
-- Name: play_idx_league_player; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX play_idx_league_player ON play USING btree (league, player);


--
-- Name: rolebearer_idx_player; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX rolebearer_idx_player ON rolebearer USING btree (player);


--
-- Name: rolebearer_idx_role; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX rolebearer_idx_role ON rolebearer USING btree (role);


--
-- Name: leaguegenre_fk_genre; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY leaguegenre
    ADD CONSTRAINT leaguegenre_fk_genre FOREIGN KEY (genre) REFERENCES genre(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: leaguegenre_fk_league; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY leaguegenre
    ADD CONSTRAINT leaguegenre_fk_league FOREIGN KEY (league) REFERENCES league(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: member_fk_league; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_fk_league FOREIGN KEY (league) REFERENCES league(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: member_fk_player; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_fk_player FOREIGN KEY (player) REFERENCES player(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: play_fk_league_player; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY play
    ADD CONSTRAINT play_fk_league_player FOREIGN KEY (league, player) REFERENCES member(league, player) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rolebearer_fk_player; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY rolebearer
    ADD CONSTRAINT rolebearer_fk_player FOREIGN KEY (player) REFERENCES player(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rolebearer_fk_role; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY rolebearer
    ADD CONSTRAINT rolebearer_fk_role FOREIGN KEY (role) REFERENCES role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: character; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE "character" FROM PUBLIC;
REVOKE ALL ON TABLE "character" FROM drbean;
GRANT ALL ON TABLE "character" TO drbean;
GRANT SELECT ON TABLE "character" TO apache;


--
-- Name: exercise; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE exercise FROM PUBLIC;
REVOKE ALL ON TABLE exercise FROM drbean;
GRANT ALL ON TABLE exercise TO drbean;
GRANT SELECT ON TABLE exercise TO apache;


--
-- Name: question; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE question FROM PUBLIC;
REVOKE ALL ON TABLE question FROM drbean;
GRANT ALL ON TABLE question TO drbean;
GRANT SELECT,INSERT ON TABLE question TO apache;


--
-- Name: s; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE s FROM PUBLIC;
REVOKE ALL ON TABLE s FROM drbean;
GRANT ALL ON TABLE s TO drbean;
GRANT SELECT,INSERT,UPDATE ON TABLE s TO apache;


--
-- Name: session; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE session FROM PUBLIC;
REVOKE ALL ON TABLE session FROM drbean;
GRANT ALL ON TABLE session TO drbean;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE session TO apache;


--
-- Name: tag; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE tag FROM PUBLIC;
REVOKE ALL ON TABLE tag FROM drbean;
GRANT ALL ON TABLE tag TO drbean;
GRANT SELECT,INSERT,UPDATE ON TABLE tag TO apache;


--
-- Name: try; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE try FROM PUBLIC;
REVOKE ALL ON TABLE try FROM drbean;
GRANT ALL ON TABLE try TO drbean;
GRANT SELECT,INSERT,UPDATE ON TABLE try TO apache;


--
-- Name: wh; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE wh FROM PUBLIC;
REVOKE ALL ON TABLE wh FROM drbean;
GRANT ALL ON TABLE wh TO drbean;
GRANT SELECT,INSERT,UPDATE ON TABLE wh TO apache;


--
-- Name: word; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE word FROM PUBLIC;
REVOKE ALL ON TABLE word FROM drbean;
GRANT ALL ON TABLE word TO drbean;
GRANT SELECT,INSERT,UPDATE ON TABLE word TO apache;


--
-- Name: yn; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE yn FROM PUBLIC;
REVOKE ALL ON TABLE yn FROM drbean;
GRANT ALL ON TABLE yn TO drbean;
GRANT SELECT,INSERT,UPDATE ON TABLE yn TO apache;


--
-- PostgreSQL database dump complete
--

