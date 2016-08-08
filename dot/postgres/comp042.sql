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
-- Name: genre; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE genre (
    id integer NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE genre OWNER TO drbean;

--
-- Name: jigsawroles; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE jigsawroles (
    player character varying(10) NOT NULL,
    role character(1) NOT NULL
);


ALTER TABLE jigsawroles OWNER TO drbean;

--
-- Name: leaguegenre; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE leaguegenre (
    league character varying(25) NOT NULL,
    genre integer NOT NULL
);


ALTER TABLE leaguegenre OWNER TO drbean;

--
-- Name: leagues; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE leagues (
    id character varying(15) NOT NULL,
    name character varying(25) NOT NULL,
    field character varying(25) NOT NULL
);


ALTER TABLE leagues OWNER TO drbean;

--
-- Name: members; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE members (
    league character varying(15) NOT NULL,
    player character varying(10) NOT NULL
);


ALTER TABLE members OWNER TO drbean;

--
-- Name: play; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE play (
    league character varying(15) NOT NULL,
    player character varying(10) NOT NULL,
    topic character varying(15) NOT NULL,
    story character varying(15) NOT NULL,
    question smallint NOT NULL,
    response boolean NOT NULL
);


ALTER TABLE play OWNER TO drbean;

--
-- Name: players; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE players (
    id character varying(10) NOT NULL,
    name character varying(15) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE players OWNER TO drbean;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE questions (
    genre integer NOT NULL,
    topic character varying(15) NOT NULL,
    story character varying(15) NOT NULL,
    id smallint NOT NULL,
    description character varying(50) NOT NULL,
    target character varying(15) NOT NULL,
    content character varying(500) NOT NULL,
    answer character varying(500) NOT NULL
);


ALTER TABLE questions OWNER TO drbean;

--
-- Name: quiz; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE quiz (
    topic character varying(15) NOT NULL,
    story character varying(15) NOT NULL,
    description character varying(50) NOT NULL,
    genre integer NOT NULL,
    action boolean NOT NULL
);


ALTER TABLE quiz OWNER TO drbean;

--
-- Name: rolebearers; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE rolebearers (
    player character varying(10) NOT NULL,
    role integer NOT NULL
);


ALTER TABLE rolebearers OWNER TO drbean;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(15) NOT NULL
);


ALTER TABLE roles OWNER TO drbean;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE sessions (
    id character(72) NOT NULL,
    session_data character varying(7500),
    expires integer
);


ALTER TABLE sessions OWNER TO drbean;

--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY genre (id, name) FROM stdin;
1	conversation
2	business
3	intercultural
4	access
5	multimedia
6	friends
7	speaking
8	media
9	literature
10	tourism
\.


--
-- Data for Name: jigsawroles; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY jigsawroles (player, role) FROM stdin;
\.


--
-- Data for Name: leaguegenre; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY leaguegenre (league, genre) FROM stdin;
2L2	7
MB2	7
FLA0003	1
FLA0013	1
FLA0019	2
FLA0021	8
\.


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY leagues (id, name, field) FROM stdin;
2L2	BAF022_四技應外二乙	英語會話(一)
MB2	NAF021_四技外二甲	英語會話(二)
FLA0003	夜應外二甲	英語會話(二)
FLA0013	夜應外三甲	英語會話(四)
FLA0019	夜應外大學三甲	職場英語
FLA0021	夜應外大學四甲	科技英文
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY members (league, player) FROM stdin;
2L2	B03200110
2L2	B03200023
2L2	B03200052
2L2	B03200100
2L2	B03200031
2L2	B03200011
2L2	193001
2L2	B03200007
2L2	B02200094
2L2	B02200096
2L2	B03200056
2L2	B03200106
2L2	B03200092
2L2	B03192105
2L2	B03200019
2L2	B03200039
2L2	B03200043
2L2	B03200084
2L2	B02200046
2L2	B01130006
2L2	B03200102
2L2	B00230075
2L2	B03200078
2L2	B03200005
2L2	B02200064
2L2	B03200064
2L2	B03200068
2L2	B03200015
2L2	B03200027
2L2	B03200037
MB2	N03200025
MB2	N02202111
MB2	N03203103
MB2	N03200004
MB2	N03203104
MB2	N03200030
MB2	N03200006
MB2	N03200008
MB2	N03200010
MB2	N03200027
MB2	N01200014
MB2	N03200014
MB2	N02202107
MB2	N03200001
MB2	N02203102
MB2	N04202109
MB2	N03200022
MB2	N04202101
MB2	N03200036
MB2	193001
MB2	100100100
FLA0003	V0341012
FLA0003	V0499145
FLA0003	V0141063
FLA0003	V0341011
FLA0003	V0341019
FLA0003	V0241008
FLA0003	193001
FLA0003	V0341005
FLA0003	V0041066
FLA0003	V0341004
FLA0003	V0341013
FLA0003	V0341003
FLA0003	V0141062
FLA0003	V0341016
FLA0003	V0341010
FLA0003	V0341015
FLA0003	V0341001
FLA0003	V0341017
FLA0013	V0241041
FLA0013	V0041022
FLA0013	V0241001
FLA0013	V0241066
FLA0013	V0241032
FLA0013	U0143020
FLA0013	V0241004
FLA0013	V0241039
FLA0013	V0241022
FLA0013	V0241038
FLA0013	V0241034
FLA0013	V0241045
FLA0013	V0241024
FLA0013	193001
FLA0013	V0241030
FLA0013	V0241037
FLA0013	V0241014
FLA0013	V0241067
FLA0013	V0241046
FLA0013	V0241044
FLA0013	V0241017
FLA0013	V0241042
FLA0013	V0241029
FLA0013	V0041008
FLA0013	V0241031
FLA0019	V0241039
FLA0019	V0141062
FLA0019	V0241001
FLA0019	V0241063
FLA0019	V0241041
FLA0019	V0241004
FLA0019	V0241034
FLA0019	V0241045
FLA0019	V0241065
FLA0019	193001
FLA0019	V0241038
FLA0019	V0241022
FLA0019	V9941077
FLA0019	V0241067
FLA0019	V0241064
FLA0019	V0141001
FLA0019	V0241014
FLA0019	V0316060
FLA0019	V0241029
FLA0019	V0041042
FLA0019	V0041008
FLA0019	V0241046
FLA0019	V0241017
FLA0021	V0141003
FLA0021	V0141041
FLA0021	V0141029
FLA0021	V0141016
FLA0021	V0141019
FLA0021	V0141012
FLA0021	V0141011
FLA0021	V0141022
FLA0021	V0141053
FLA0021	V0141008
FLA0021	V0141025
FLA0021	V0141017
FLA0021	V0141023
FLA0021	V0141021
FLA0021	V0141028
FLA0021	V0141052
FLA0021	V0141018
FLA0021	V0141035
FLA0021	V0141050
FLA0021	V0141059
FLA0021	V0141048
FLA0021	V0141061
FLA0021	V0141036
FLA0021	193001
FLA0021	V0141046
FLA0021	V9941077
FLA0021	V0141054
FLA0021	V0141037
FLA0021	V0141055
FLA0021	V0141026
FLA0021	V0141051
FLA0021	V0141009
\.


--
-- Data for Name: play; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY play (league, player, topic, story, question, response) FROM stdin;
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY players (id, name, password) FROM stdin;
V0141055	黃柔禎	rou
N03203103	羅加聘	jia
B03200005	廖珈瑩	jia
V0141009	黃志泉	zhi
B03200078	鄒沛筠	pei
V0141051	徐郁惠	yu
V0341010	葉芳成	fang
B03192105	徐珮云	pei
V0141048	林宛瑩	wan
V0241001	胡靖宜	jing
V0141028	宋紫婷	zi
V0241039	梁怡萍	yi
V0341003	羅鋐韶	hong
V0341012	江宜潔	yi
V0141061	施志昇	zhi
N03200036	陳桂益	gui
B03200037	范君儒	jun
N03200025	林嘉莉	jia
V0141019	黃宇	yu
N02202111	董翌亦	yi
B03200068	林采鈴	cai
V0141011	鍾育霖	yu
V0341017	陳宣妤	xuan
V0141023	宋紫如	zi
V0241044	張淑筠	shu
V0241031	蔡方如	fang
N03200010	江宜蓁	yi
V0241029	陳亮彤	liang
V0241004	施其儀	qi
N03200014	鄭又元	you
V0141016	張偉棋	wei
V0341004	吳恩維	en
B03200031	葉書晴	shu
V0241034	王緯婷	wei
V0141054	林雨潔	yu
V0141037	藍美文	mei
V9941077	陳韋志	wei
V0341016	羅文伶	wen
B03200039	林慧娟	hui
V0141059	陳虹吟	hong
V0241032	彭?惠	?
N02203102	溫嘉翔	jia
V0341013	余孟穎	meng
V0141018	胡智鈞	zhi
V0141050	陳珮文	pei
V0341011	周雅云	ya
V0316060	黃嘉嘉	jia
V0141012	彭振浩	zhen
B02200064	廖婉廷	wan
N03200004	曾美梅	mei
B01130006	李宜安	yi
V0241042	羅思弦	si
V0241046	陳瑀濤	yu
V0141025	林嘉真	jia
N03200008	王顥臻	hao
V0241066	郭姿婷	zi
N03200001	陳翎軒	ling
V0041022	謝宜潔	yi
V0241038	何姿儀	zi
V0499145	黃海敏	hai
N04202101	許晏甄	yan
B02200094	郭俐君	li
V0141029	邱凱蒂	kai
V0241065	黃昭寧	zhao
V0341005	吳祐誠	you
V0041066	馮永碇	yong
B03200052	李佳宜	jia
100100100	邱宇凡	yu
B03200027	藍季妍	ji
B03200064	黃靖廷	jing
B03200102	李怡宣	yi
B03200043	鍾亞寰	ya
N03200027	陳沚瑩	zhi
N02202107	劉怡甄	yi
V0141021	徐筱柔	xiao
B03200056	簡逸欣	yi
N04202109	楊竣傑	jun
V0141035	吳翊甄	yi
N03200022	楊峻瑋	jun
V0141063	洪君綾	jun
V0241045	羅宇辰	yu
V0141008	曾慧珊	hui
V0341001	李樵風	qiao
V0241014	賴彥鈞	yan
N03200030	潘韻宇	yun
V0241017	吳思賢	si
V0041042	賴于雯	yu
V0141041	邱晴	qing
B03200092	盧毅	yi
V0241041	黃鈺婷	yu
V0241024	李盈瑩	ying
B03200110	黃曉雯	xiao
V0341019	卓意瑄	yi
V0241037	?鈺茹	yu
V0141026	傅欣誼	xin
V0141046	黃如妘	ru
B02200046	曾淑慧	shu
N03200006	鄧如芸	ru
B03200019	張雅媛	ya
N01200014	范育芳	yu
V0141052	陳沛雯	pei
V0241008	陳鴻郁	hong
V0141036	解雅婷	ya
193001	DrBean	ok
V0341015	李殷	yin
V0141053	溫燁葶	ye
V0141022	陳宥蓁	you
V0241030	何瑞嬿	rui
B03200015	張珈瑜	jia
V0241064	黃俊豪	jun
V0241067	劉威昇	wei
N03203104	許雅晶	ya
V0141001	蔡立瑋	li
B00230075	劉意玲	yi
V0041008	蔣宜芸	yi
B03200084	邱睦翔	mu
V0141017	陳冠儒	guan
U0143020	廖家成	jia
V0241063	邱煒傑	wei
B03200106	蔡明翰	ming
V0141003	吳于嫥	yu
B02200096	王韻筌	yun
V0141062	林遠凱	yuan
V0241022	陳巧惠	qiao
B03200007	游妤婷	yu
B03200023	陳彥蓁	yan
B03200100	方楚云	chu
B03200011	羅韻如	yun
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY questions (genre, topic, story, id, description, target, content, answer) FROM stdin;
\.


--
-- Data for Name: quiz; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY quiz (topic, story, description, genre, action) FROM stdin;
\.


--
-- Data for Name: rolebearers; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY rolebearers (player, role) FROM stdin;
193001	1
B03200007	2
B03200100	2
B03200011	2
B03200031	2
B03200110	2
B03200023	2
B03200052	2
B02200094	2
B03200106	2
B03200056	2
B02200096	2
B03192105	2
B03200092	2
B03200084	2
B03200043	2
B03200039	2
B03200019	2
B03200078	2
B03200102	2
B00230075	2
B01130006	2
B02200046	2
B03200015	2
B03200027	2
B03200064	2
B03200068	2
B02200064	2
B03200005	2
B03200037	2
100100100	2
N03200036	2
N04202101	2
N03200022	2
N04202109	2
N02203102	2
N01200014	2
N03200014	2
N03200001	2
N02202107	2
N03200027	2
N03200008	2
N03200010	2
N03200006	2
N03200030	2
N03200004	2
N03203104	2
N02202111	2
N03203103	2
N03200025	2
V0141062	2
V0341003	2
V0341013	2
V0341012	2
V0499145	2
V0341019	2
V0141063	2
V0341011	2
V0341005	2
V0041066	2
V0341004	2
V0241008	2
V0341015	2
V0341017	2
V0341001	2
V0341016	2
V0341010	2
V0241004	2
U0143020	2
V0241066	2
V0241032	2
V0241041	2
V0041022	2
V0241001	2
V0241039	2
V0241022	2
V0241038	2
V0241024	2
V0241034	2
V0241045	2
V0241037	2
V0241030	2
V0241067	2
V0241014	2
V0241017	2
V0241042	2
V0241044	2
V0241046	2
V0241031	2
V0041008	2
V0241029	2
V0316060	2
V9941077	2
V0241064	2
V0141001	2
V0041042	2
V0241063	2
V0241065	2
V0141016	2
V0141029	2
V0141061	2
V0141036	2
V0141048	2
V0141041	2
V0141059	2
V0141003	2
V0141052	2
V0141018	2
V0141035	2
V0141050	2
V0141021	2
V0141028	2
V0141023	2
V0141009	2
V0141017	2
V0141025	2
V0141051	2
V0141055	2
V0141054	2
V0141037	2
V0141026	2
V0141053	2
V0141008	2
V0141022	2
V0141011	2
V0141019	2
V0141012	2
V0141046	2
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY roles (id, name) FROM stdin;
1	official
2	player
3	amateur
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY sessions (id, session_data, expires) FROM stdin;
session:5c1a829ae661dbe6f3db849bb289b65415d5ea0d                        	BQoDAAAABwoEZGJpYwAAAAxfX3VzZXJfcmVhbG0FAAAACHF1ZXN0aW9uBAMAAAABFwYxOTMwMDEA\nAAACaWQAAAAGX191c2VyCVdksw4AAAAJX19jcmVhdGVkFwdGTEEwMDAzAAAACnRvdXJuYW1lbnQJ\nV2S1FgAAAAlfX3VwZGF0ZWQXBjE5MzAwMQAAAAlwbGF5ZXJfaWQ=\n	1466221354
session:c9ce579a23d7ec87154500cdf75fa019211d03e2                        	BQoDAAAABxcDTUIyAAAACnRvdXJuYW1lbnQJVz6U8AAAAAlfX3VwZGF0ZWQKBGRiaWMAAAAMX191\nc2VyX3JlYWxtFwYxOTMwMDEAAAAJcGxheWVyX2lkBQAAAAhxdWVzdGlvbgQDAAAAARcGMTkzMDAx\nAAAAAmlkAAAABl9fdXNlcglXPpTnAAAACV9fY3JlYXRlZA==\n	1463722754
session:a2a115097891512699181a53b242f367c451c8c8                        	BQoDAAAABxcHRkxBMDAxMwAAAAp0b3VybmFtZW50CVc9JtUAAAAJX191cGRhdGVkCVc9JEQAAAAJ\nX19jcmVhdGVkBQAAAAhxdWVzdGlvbhcGMTkzMDAxAAAACXBsYXllcl9pZAQDAAAAARcGMTkzMDAx\nAAAAAmlkAAAABl9fdXNlcgoEZGJpYwAAAAxfX3VzZXJfcmVhbG0=\n	1463629033
session:748741b2d7aa6a6b83f89f475512068909a064e8                        	BQoDAAAABwlXPpQMAAAACV9fY3JlYXRlZAUAAAAIcXVlc3Rpb24EAwAAAAEXBjE5MzAwMQAAAAJp\nZAAAAAZfX3VzZXIXBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBGRiaWMAAAAMX191c2VyX3JlYWxtCVc+\nlBgAAAAJX191cGRhdGVkFwdGTEEwMDE5AAAACnRvdXJuYW1lbnQ=\n	1463722538
session:bbd4a26b9a7df45039eeb5dbcafea430d7cc983f                        	BQoDAAAABxcDTUIyAAAACnRvdXJuYW1lbnQJVz6UnwAAAAlfX3VwZGF0ZWQXBjE5MzAwMQAAAAlw\nbGF5ZXJfaWQKBGRiaWMAAAAMX191c2VyX3JlYWxtCVc+lJQAAAAJX19jcmVhdGVkBAMAAAABFwYx\nOTMwMDEAAAACaWQAAAAGX191c2VyBQAAAAhxdWVzdGlvbg==\n	1463722725
\.


--
-- Name: genre_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: jigsawroles_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY jigsawroles
    ADD CONSTRAINT jigsawroles_pkey PRIMARY KEY (player);


--
-- Name: leaguegenre_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY leaguegenre
    ADD CONSTRAINT leaguegenre_pkey PRIMARY KEY (league, genre);


--
-- Name: leagues_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY leagues
    ADD CONSTRAINT leagues_pkey PRIMARY KEY (id);


--
-- Name: members_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (league, player);


--
-- Name: play_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY play
    ADD CONSTRAINT play_pkey PRIMARY KEY (league, player, topic, story, question);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (topic, story, id);


--
-- Name: quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (topic, story);


--
-- Name: rolebearers_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY rolebearers
    ADD CONSTRAINT rolebearers_pkey PRIMARY KEY (player, role);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: leaguegenre_idx_genre; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX leaguegenre_idx_genre ON leaguegenre USING btree (genre);


--
-- Name: leaguegenre_idx_league; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX leaguegenre_idx_league ON leaguegenre USING btree (league);


--
-- Name: members_idx_league; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX members_idx_league ON members USING btree (league);


--
-- Name: members_idx_player; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX members_idx_player ON members USING btree (player);


--
-- Name: play_idx_topic_story_question; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX play_idx_topic_story_question ON play USING btree (topic, story, question);


--
-- Name: rolebearers_idx_player; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX rolebearers_idx_player ON rolebearers USING btree (player);


--
-- Name: rolebearers_idx_role; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX rolebearers_idx_role ON rolebearers USING btree (role);


--
-- Name: leaguegenre_fk_genre; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY leaguegenre
    ADD CONSTRAINT leaguegenre_fk_genre FOREIGN KEY (genre) REFERENCES genre(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: leaguegenre_fk_league; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY leaguegenre
    ADD CONSTRAINT leaguegenre_fk_league FOREIGN KEY (league) REFERENCES leagues(id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: members_fk_league; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_fk_league FOREIGN KEY (league) REFERENCES leagues(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: members_fk_player; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_fk_player FOREIGN KEY (player) REFERENCES players(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: play_fk_topic_story_question; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY play
    ADD CONSTRAINT play_fk_topic_story_question FOREIGN KEY (topic, story, question) REFERENCES questions(topic, story, id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: rolebearers_fk_player; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY rolebearers
    ADD CONSTRAINT rolebearers_fk_player FOREIGN KEY (player) REFERENCES players(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: rolebearers_fk_role; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY rolebearers
    ADD CONSTRAINT rolebearers_fk_role FOREIGN KEY (role) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE DEFERRABLE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

