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
2L1	7
MB1	7
FLA0003	10
FLA0008	1
FLA0011	1
FLA0024	8
\.


--
-- Data for Name: leagues; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY leagues (id, name, field) FROM stdin;
2L1	BAF022_四技應外二乙	英語會話(一)
MB1	NAF021四技外二甲	英語會話(一)
FLA0003	夜應外二甲	觀光英語
FLA0008	夜應外二甲	英語會話(一)
FLA0011	夜應外三甲	英語會話(三)
FLA0024	夜應外大學四甲	新聞英語
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY members (league, player) FROM stdin;
2L1	B03200078
2L1	B03200106
2L1	B03200011
2L1	B03200100
2L1	B03200052
2L1	B03200031
2L1	B03200084
2L1	B03200056
2L1	B03200068
2L1	B03200027
2L1	B03200043
2L1	193001
2L1	B02200098
2L1	B03200005
2L1	B03200007
2L1	B03200039
2L1	B03200102
2L1	B01130056
2L1	B03200092
2L1	B03200110
2L1	B02200086
2L1	B03200037
2L1	B03200015
2L1	B01080096
2L1	B02200064
2L1	B03200023
2L1	B03200072
2L1	B03200064
2L1	B03200019
2L1	B02200062
MB1	N04202105
MB1	N03203105
MB1	N03200001
MB1	N03200030
MB1	N03200034
MB1	N03200025
MB1	N03203103
MB1	N02202201
MB1	N03200006
MB1	N03200012
MB1	N03200027
MB1	N04202109
MB1	N03200004
MB1	N03200020
MB1	N03200036
MB1	100100100
MB1	N04202101
MB1	N03200014
MB1	193001
MB1	N03200018
MB1	N03200008
MB1	N03200022
MB1	N01200048
MB1	N03080070
MB1	N03200010
FLA0003	V0341012
FLA0003	V0241046
FLA0003	V0341009
FLA0003	V0141036
FLA0003	V0041047
FLA0003	V0241045
FLA0003	V0141009
FLA0003	V0141002
FLA0003	V0141016
FLA0003	V0341005
FLA0003	V0341034
FLA0003	V0241064
FLA0003	V0341004
FLA0003	V0141008
FLA0003	V0341051
FLA0003	V0341019
FLA0003	193001
FLA0003	V0041042
FLA0003	V9941077
FLA0003	V0341015
FLA0003	V0141055
FLA0003	V0341024
FLA0003	V0141019
FLA0003	V0341044
FLA0003	V0341052
FLA0003	V0241067
FLA0003	V0341039
FLA0003	V0041062
FLA0003	V0041008
FLA0003	V0241014
FLA0003	V0041055
FLA0003	V0141001
FLA0003	V0341025
FLA0003	V0341033
FLA0003	V0341035
FLA0003	V0141064
FLA0003	V0341023
FLA0003	V0041015
FLA0003	V0141054
FLA0003	V0341010
FLA0003	V0041053
FLA0003	V0341011
FLA0003	V0341041
FLA0003	V0141022
FLA0003	V0341027
FLA0003	V0341031
FLA0003	V0141063
FLA0003	V0341001
FLA0003	V0141011
FLA0003	V0141051
FLA0003	V9941010
FLA0003	V0141012
FLA0003	V0241004
FLA0003	V0141062
FLA0003	V0141037
FLA0003	V0141046
FLA0003	V0141041
FLA0003	V0341013
FLA0003	V0341016
FLA0003	V0341022
FLA0003	V0141059
FLA0003	V0341036
FLA0008	V0341017
FLA0008	V0341037
FLA0008	V0341001
FLA0008	V0241008
FLA0008	V0341003
FLA0008	V0241004
FLA0008	V0341036
FLA0008	V0341022
FLA0008	V0341016
FLA0008	V0341013
FLA0008	V0341046
FLA0008	V0341035
FLA0008	V0341029
FLA0008	V0341023
FLA0008	V0341033
FLA0008	V0341025
FLA0008	V0341010
FLA0008	V0341031
FLA0008	V0341027
FLA0008	V0341041
FLA0008	V0341011
FLA0008	V0341015
FLA0008	V0341024
FLA0008	V0341052
FLA0008	V0341044
FLA0008	V0341039
FLA0008	V0341032
FLA0008	V0341009
FLA0008	V0341012
FLA0008	V0341051
FLA0008	V0341004
FLA0008	V0341034
FLA0008	V0241064
FLA0008	V0341047
FLA0008	V0341005
FLA0008	V0341021
FLA0008	193001
FLA0008	V0341019
FLA0011	V0241026
FLA0011	V0241046
FLA0011	V0241034
FLA0011	V0241045
FLA0011	V0241064
FLA0011	V0241044
FLA0011	V0241012
FLA0011	V0241042
FLA0011	193001
FLA0011	V0241039
FLA0011	V0241067
FLA0011	V0241020
FLA0011	V0241065
FLA0011	V0241001
FLA0011	V0241014
FLA0011	V0241022
FLA0011	V0141001
FLA0011	V0241031
FLA0011	V0241066
FLA0011	V0241063
FLA0011	V0241030
FLA0011	V0241038
FLA0011	V0241037
FLA0011	V0141063
FLA0011	V0241029
FLA0011	V0141062
FLA0011	V0241004
FLA0011	V0241024
FLA0011	V0241041
FLA0011	V0241032
FLA0024	V0141026
FLA0024	V0141059
FLA0024	V0141029
FLA0024	V0041046
FLA0024	V0141060
FLA0024	V0141037
FLA0024	V0141012
FLA0024	V0141041
FLA0024	V0141046
FLA0024	V0141023
FLA0024	V0141017
FLA0024	V0141051
FLA0024	V0141011
FLA0024	V0141018
FLA0024	V0141022
FLA0024	V0141035
FLA0024	U0143010
FLA0024	U0131117
FLA0024	V0141049
FLA0024	V0141054
FLA0024	V0141064
FLA0024	V0141001
FLA0024	V0041062
FLA0024	V0041008
FLA0024	V0141061
FLA0024	V0141048
FLA0024	V0141055
FLA0024	V0141019
FLA0024	193001
FLA0024	V0041042
FLA0024	V0141003
FLA0024	V0141021
FLA0024	V0141052
FLA0024	U0143020
FLA0024	V0141008
FLA0024	V0141053
FLA0024	V0041066
FLA0024	V0141038
FLA0024	V0141009
FLA0024	V0241045
FLA0024	V0141016
FLA0024	V0141002
FLA0024	V0241046
FLA0024	V0141025
FLA0024	V0141036
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
V0341022	張敬暄	jing
V0341046	蔡岳霖	yue
V0241032	彭?惠	?
N03200012	連苡伶	yi
V0141041	邱晴	qing
V0141037	藍美文	mei
V0241004	施其儀	qi
V9941010	湯明勳	ming
V0141011	鍾育霖	yu
B03200084	邱睦翔	mu
V0141063	洪君綾	jun
V0341001	李樵風	qiao
B03200056	簡逸欣	yi
N03200034	萬筱微	xiao
V0141017	陳冠儒	guan
B03200027	藍季妍	ji
V0241029	陳亮彤	liang
V0141022	陳宥蓁	you
V0041053	李葦唯	wei
V0341010	葉芳成	fang
B03200039	林慧娟	hui
U0143010	張宜臻	yi
N03200008	王顥臻	hao
V0341023	邱閔暄	min
V0041055	王維君	wei
B03200019	張雅媛	ya
V0241014	賴彥鈞	yan
V0141061	施志昇	zhi
V0041062	張雅筑	ya
V0141019	黃宇	yu
V0141048	林宛瑩	wan
V0341015	李殷	yin
V0041042	賴于雯	yu
N03200014	鄭又元	you
V0241012	王耀陞	yao
V0341005	吳祐誠	you
V0141009	黃志泉	zhi
V0041066	馮永碇	yong
B01080096	黃婉晴	wan
B03200072	劉恩典	en
V0041047	賴意穎	yi
V0241046	陳瑀濤	yu
B02200062	洪嘉翎	jia
V0241034	王緯婷	wei
V0341012	江宜潔	yi
B03200011	羅韻如	yun
V0341013	余孟穎	meng
V0041046	吳宛	wan
V0241024	李盈瑩	ying
V0141062	林遠凱	yuan
V0241008	陳鴻郁	hong
V0341017	陳宣妤	xuan
V0141051	徐郁惠	yu
V0241038	何姿儀	zi
V0341031	劉家瑋	jia
V0241037	?鈺茹	yu
U0131117	林坤儀	kun
N03200022	楊峻瑋	jun
B01130056	趙升文	sheng
V0341029	陳英傑	ying
V0241030	何瑞嬿	rui
V0141064	余季穎	ji
V0341035	陳佑維	you
V0241031	蔡方如	fang
B03200106	蔡明翰	ming
N02202201	徐銘謙	ming
V0241065	黃昭寧	zhao
V0241039	梁怡萍	yi
V0341044	楊淑儀	shu
B03200031	葉書晴	shu
N03203105	蔡欣祐	xin
N03200025	林嘉莉	jia
N03200030	潘韻宇	yun
V0141021	徐筱柔	xiao
V0141052	陳沛雯	pei
B03200102	李怡宣	yi
V0341051	陳思妘	si
V0341004	吳恩維	en
V0241044	張淑筠	shu
N03080070	郭子菁	zi
B02200086	林柏彤	bai
B03200037	范君儒	jun
B03200023	陳彥蓁	yan
V0141036	解雅婷	ya
N03200036	陳桂益	gui
100100100	邱宇凡	yu
V0341009	吳佳芸	jia
B03200078	鄒沛筠	pei
V0141059	陳虹吟	hong
V0341036	潘卉蓁	hui
V0341016	羅文伶	wen
V0141026	傅欣誼	xin
V0141060	徐銘均	ming
B03200100	方楚云	chu
V0241041	黃鈺婷	yu
N04202105	黃冠潔	guan
V0141012	彭振浩	zhen
V0341003	羅鋐韶	hong
N03203103	羅加聘	jia
V0141023	宋紫如	zi
B03200068	林采鈴	cai
V0341027	彭紹安	shao
V0341041	陳晏淇	yan
B02200098	姜瀚威	han
V0241066	郭姿婷	zi
V0241063	邱煒傑	wei
V0041015	段禹辰	yu
N03200006	鄧如芸	ru
V0241001	胡靖宜	jing
V0341032	羅佳?	jia
V0241020	王覲	jin
V0341052	李佳玲	jia
V0341024	梁春竹	chun
V0141055	黃柔禎	rou
V9941077	陳韋志	wei
193001	DrBean	ok
B03200007	游妤婷	yu
V0241042	羅思弦	si
V0141008	曾慧珊	hui
U0143020	廖家成	jia
B03200092	盧毅	yi
V0341021	楊雅惠	ya
V0141016	張偉棋	wei
V0141038	謝婕榆	jie
V0141025	林嘉真	jia
V0241026	涂馨尹	xin
N03200020	林毓斌	yu
V0141029	邱凱蒂	kai
N03200004	曾美梅	mei
N04202109	楊竣傑	jun
B03200052	李佳宜	jia
V0141046	黃如妘	ru
V0141018	胡智鈞	zhi
V0341037	江婕熙	jie
B03200043	鍾亞寰	ya
N03200018	宋柏賢	bai
V0341011	周雅云	ya
B03200005	廖珈瑩	jia
N03200010	江宜蓁	yi
N01200048	陳怡真	yi
V0141035	吳翊甄	yi
B03200110	黃曉雯	xiao
V0141054	林雨潔	yu
V0141049	黃姵甄	pei
B02200064	廖婉廷	wan
V0341033	陳聖儒	sheng
V0341025	萬世揚	shi
B03200064	黃靖廷	jing
V0141001	蔡立瑋	li
V0241022	陳巧惠	qiao
V0041008	蔣宜芸	yi
V0341039	張彤寧	tong
V0241067	劉威昇	wei
N03200027	陳沚瑩	zhi
N03200001	陳翎軒	ling
V0141003	吳于嫥	yu
V0341019	卓意瑄	yi
V0241064	黃俊豪	jun
V0341034	李彥熾	yan
V0341047	甘泓灝	hong
V0141002	毛明珊	ming
B03200015	張珈瑜	jia
V0141053	溫燁葶	ye
V0241045	羅宇辰	yu
N04202101	許晏甄	yan
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
B03200084	2
B03200056	2
B03200027	2
B03200068	2
B03200031	2
B03200100	2
B03200052	2
B03200106	2
B03200078	2
B03200011	2
B03200072	2
B03200064	2
B03200019	2
B02200062	2
B03200110	2
B03200037	2
B02200086	2
B03200015	2
B01080096	2
B03200023	2
B02200064	2
B03200007	2
B03200005	2
B03200039	2
B03200102	2
B03200092	2
B01130056	2
B03200043	2
B02200098	2
N03200001	2
N03200030	2
N03200034	2
N03200025	2
N03203103	2
N04202105	2
N03203105	2
N03200027	2
N04202109	2
N03200012	2
N03200004	2
N03200020	2
N02202201	2
N03200006	2
100100100	2
N03200036	2
N04202101	2
N03200022	2
N03200008	2
N03080070	2
N01200048	2
N03200010	2
N03200014	2
N03200018	2
V0341036	2
V0141059	2
V0341022	2
V0341016	2
V0341013	2
V9941010	2
V0141011	2
V0141051	2
V0141063	2
V0341001	2
V0141046	2
V0141041	2
V0141062	2
V0141037	2
V0241004	2
V0141012	2
V0341010	2
V0341031	2
V0341027	2
V0341041	2
V0141022	2
V0341011	2
V0041053	2
V0141001	2
V0041055	2
V0141054	2
V0341035	2
V0341023	2
V0141064	2
V0041015	2
V0341033	2
V0341025	2
V0241067	2
V0341044	2
V0341052	2
V0241014	2
V0041008	2
V0041062	2
V0341039	2
V0341015	2
V9941077	2
V0141019	2
V0341024	2
V0141055	2
V0341051	2
V0141008	2
V0241064	2
V0341004	2
V0341034	2
V0341005	2
V0041042	2
V0341019	2
V0141036	2
V0041047	2
V0241046	2
V0341009	2
V0341012	2
V0141016	2
V0141002	2
V0141009	2
V0241045	2
V0341047	2
V0341021	2
V0341032	2
V0341029	2
V0341046	2
V0241008	2
V0341003	2
V0341037	2
V0341017	2
V0241024	2
V0241029	2
V0241032	2
V0241041	2
V0241030	2
V0241063	2
V0241066	2
V0241031	2
V0241037	2
V0241038	2
V0241022	2
V0241001	2
V0241065	2
V0241020	2
V0241039	2
V0241034	2
V0241026	2
V0241042	2
V0241012	2
V0241044	2
V0041046	2
V0141029	2
V0141060	2
V0141026	2
V0141017	2
V0141023	2
V0141018	2
U0143010	2
V0141035	2
U0131117	2
V0141049	2
V0141061	2
V0141048	2
U0143020	2
V0141021	2
V0141052	2
V0141003	2
V0141025	2
V0141053	2
V0041066	2
V0141038	2
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
session:407204554a67aa089c8d875e7c6400f73fb38339                        	BQoDAAAABwQDAAAAARcGMTkzMDAxAAAAAmlkAAAABl9fdXNlcglWY+DMAAAACV9fY3JlYXRlZBcG\nMTkzMDAxAAAACXBsYXllcl9pZAUAAAAIcXVlc3Rpb24KBGRiaWMAAAAMX191c2VyX3JlYWxtFwNN\nQjEAAAAKdG91cm5hbWVudAlWY+DWAAAACV9fdXBkYXRlZA==\n	1449390475
session:0379e8c299f6864646ff1bb2c5aefd9f9848349c                        	BQoDAAAABwUAAAAIcXVlc3Rpb24EAwAAAAEXBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIXBjE5MzAw\nMQAAAAlwbGF5ZXJfaWQKBGRiaWMAAAAMX191c2VyX3JlYWxtFwdGTEEwMDExAAAACnRvdXJuYW1l\nbnQJVpDKrQAAAAlfX3VwZGF0ZWQJVpDIUwAAAAlfX2NyZWF0ZWQ=\n	1452333724
session:b2c25193d78528b56a505e1863ee581fdd09e868                        	BQoDAAAABwlWW5uDAAAACV9fdXBkYXRlZAQDAAAAARcGMTkzMDAxAAAAAmlkAAAABl9fdXNlcglW\nW5t3AAAACV9fY3JlYXRlZBcGMTkzMDAxAAAACXBsYXllcl9pZBcDMkwxAAAACnRvdXJuYW1lbnQF\nAAAACHF1ZXN0aW9uCgRkYmljAAAADF9fdXNlcl9yZWFsbQ==\n	1448851764
session:f6e8ab86ec578f82db571f8950df49fc8deca367                        	BQoDAAAABwlWP0+2AAAACV9fdXBkYXRlZAUAAAAIcXVlc3Rpb24EAwAAAAEXBjE5MzAwMQAAAAJp\nZAAAAAZfX3VzZXIXAzJMMQAAAAp0b3VybmFtZW50CgoxNDQ2OTg5NDcyAAAACV9fY3JlYXRlZAoE\nZGJpYwAAAAxfX3VzZXJfcmVhbG0XBjE5MzAwMQAAAAlwbGF5ZXJfaWQ=\n	1446993729
session:5cee51e8ee1957d43527edf964d51eee9b2c69b6                        	BQoDAAAABwUAAAAIcXVlc3Rpb24KBGRiaWMAAAAMX191c2VyX3JlYWxtFwYxOTMwMDEAAAAJcGxh\neWVyX2lkFwMyTDEAAAAKdG91cm5hbWVudAlWPtXOAAAACV9fdXBkYXRlZAoKMTQ0Njk1MzM1OQAA\nAAlfX2NyZWF0ZWQEAwAAAAEXBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXI=\n	1446962142
session:dd1560fc2b66f2fa881126612fbcba32320de759                        	BQoDAAAABwoEZGJpYwAAAAxfX3VzZXJfcmVhbG0EAwAAAAEXBjE5MzAwMQAAAAJpZAAAAAZfX3Vz\nZXIJVlvMUwAAAAlfX2NyZWF0ZWQXAzJMMQAAAAp0b3VybmFtZW50CVZbzF4AAAAJX191cGRhdGVk\nBQAAAAhxdWVzdGlvbhcGMTkzMDAxAAAACXBsYXllcl9pZA==\n	1448860274
session:d0fb3d2f8340eed9cbec3abb34a199ddecf37336                        	BQoDAAAABwQDAAAAARcGMTkzMDAxAAAAAmlkAAAABl9fdXNlchcGMTkzMDAxAAAACXBsYXllcl9p\nZAlWWvv+AAAACV9fY3JlYXRlZAlWWvwLAAAACV9fdXBkYXRlZBcDMkwxAAAACnRvdXJuYW1lbnQF\nAAAACHF1ZXN0aW9uCgRkYmljAAAADF9fdXNlcl9yZWFsbQ==\n	1448806947
session:54157f5bafb84273391a1e70b1402aa2583ded14                        	BQoDAAAABwoEZGJpYwAAAAxfX3VzZXJfcmVhbG0EAwAAAAEXBjE5MzAwMQAAAAJpZAAAAAZfX3Vz\nZXIJVl0IpAAAAAlfX3VwZGF0ZWQXA01CMQAAAAp0b3VybmFtZW50CVZdAi0AAAAJX19jcmVhdGVk\nBQAAAAhxdWVzdGlvbhcGMTkzMDAxAAAACXBsYXllcl9pZA==\n	1448941239
session:6e0565ff1188e702f282692855eee72ba145fc84                        	BQoDAAAABxcGMTkzMDAxAAAACXBsYXllcl9pZBcDMkwxAAAACnRvdXJuYW1lbnQFAAAACHF1ZXN0\naW9uBAMAAAABFwYxOTMwMDEAAAACaWQAAAAGX191c2VyCVY+6CUAAAAJX19jcmVhdGVkCVY+6a0A\nAAAJX191cGRhdGVkCgRkYmljAAAADF9fdXNlcl9yZWFsbQ==\n	1446969707
session:970b0ad7927d4bcb5db0f1230a8471821bb142a2                        	BQoDAAAABwQDAAAAARcGMTkzMDAxAAAAAmlkAAAABl9fdXNlchcDTUIxAAAACnRvdXJuYW1lbnQJ\nVn/tXgAAAAlfX3VwZGF0ZWQJVn/rgQAAAAlfX2NyZWF0ZWQXBjE5MzAwMQAAAAlwbGF5ZXJfaWQK\nBGRiaWMAAAAMX191c2VyX3JlYWxtBQAAAAhxdWVzdGlvbg==\n	1451228018
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

