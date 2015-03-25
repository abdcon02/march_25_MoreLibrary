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
-- Name: admin; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE admin (
    id integer NOT NULL,
    name character varying,
    password character varying
);


ALTER TABLE admin OWNER TO "Guest";

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_id_seq OWNER TO "Guest";

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE admin_id_seq OWNED BY admin.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE authors (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE authors OWNER TO "Guest";

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_id_seq OWNER TO "Guest";

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE books OWNER TO "Guest";

--
-- Name: books_authors; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE books_authors (
    id integer NOT NULL,
    book_id integer,
    author_id integer
);


ALTER TABLE books_authors OWNER TO "Guest";

--
-- Name: books_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE books_authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_authors_id_seq OWNER TO "Guest";

--
-- Name: books_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE books_authors_id_seq OWNED BY books_authors.id;


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO "Guest";

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: checkout; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE checkout (
    id integer NOT NULL,
    patron_id integer,
    copy_id integer,
    due_date date
);


ALTER TABLE checkout OWNER TO "Guest";

--
-- Name: checkout_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE checkout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE checkout_id_seq OWNER TO "Guest";

--
-- Name: checkout_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE checkout_id_seq OWNED BY checkout.id;


--
-- Name: copies; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE copies (
    id integer NOT NULL,
    in_library boolean,
    book_name character varying
);


ALTER TABLE copies OWNER TO "Guest";

--
-- Name: copies_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE copies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE copies_id_seq OWNER TO "Guest";

--
-- Name: copies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE copies_id_seq OWNED BY copies.id;


--
-- Name: patrons; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE patrons (
    id integer NOT NULL,
    name character varying,
    patron_number integer,
    password character varying
);


ALTER TABLE patrons OWNER TO "Guest";

--
-- Name: patrons_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE patrons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patrons_id_seq OWNER TO "Guest";

--
-- Name: patrons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE patrons_id_seq OWNED BY patrons.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY admin ALTER COLUMN id SET DEFAULT nextval('admin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY books_authors ALTER COLUMN id SET DEFAULT nextval('books_authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY checkout ALTER COLUMN id SET DEFAULT nextval('checkout_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY copies ALTER COLUMN id SET DEFAULT nextval('copies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY patrons ALTER COLUMN id SET DEFAULT nextval('patrons_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY admin (id, name, password) FROM stdin;
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('admin_id_seq', 672, true);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY authors (id, name) FROM stdin;
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('authors_id_seq', 1466, true);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY books (id, name) FROM stdin;
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY books_authors (id, book_id, author_id) FROM stdin;
1	3	30
2	4	31
3	5	31
5	7	42
6	8	43
7	9	43
9	11	54
10	12	55
11	13	55
13	15	66
14	16	67
15	17	67
17	19	78
18	20	79
19	21	79
21	23	90
22	24	91
23	25	91
25	36	93
26	37	94
27	37	95
28	40	105
29	41	106
30	42	106
32	53	108
33	54	109
34	54	110
35	57	120
36	58	121
37	59	121
39	70	123
40	71	124
41	71	125
43	73	136
44	74	137
45	75	137
47	86	139
48	87	140
49	87	141
51	89	152
52	90	153
53	91	153
55	102	155
56	103	156
57	103	157
59	105	168
60	106	169
61	107	169
63	118	171
64	119	172
65	119	173
67	121	184
68	122	185
69	123	185
71	134	187
72	135	188
73	135	189
75	137	200
76	138	201
77	139	201
79	150	203
80	151	204
81	151	205
83	153	216
84	154	217
85	155	217
87	166	219
88	167	220
89	167	221
91	169	232
92	170	233
93	171	233
95	182	235
96	183	236
97	183	237
99	185	248
100	186	249
101	187	249
103	198	251
104	199	252
105	199	253
107	201	264
108	202	265
109	203	265
111	214	267
112	215	268
113	215	269
115	217	280
116	218	281
117	219	281
119	230	283
120	231	284
121	231	285
123	233	296
124	234	297
125	235	297
127	246	299
128	247	300
129	247	301
131	249	312
132	250	313
133	251	313
135	262	315
136	263	316
137	263	317
139	265	328
140	266	329
141	267	329
143	278	331
144	279	332
145	279	333
147	281	344
148	282	345
149	283	345
151	294	347
152	295	348
153	295	349
155	297	360
156	298	361
157	299	361
159	310	363
160	311	364
161	311	365
163	313	376
164	314	377
165	315	377
167	326	379
168	327	380
169	327	381
171	329	392
172	330	393
173	331	393
175	342	395
176	343	396
177	343	397
179	345	408
180	346	409
181	347	409
183	358	411
184	359	412
185	359	413
187	361	424
188	362	425
189	363	425
191	374	427
192	375	428
193	375	429
195	377	440
196	378	441
197	379	441
199	390	443
200	391	444
201	391	445
203	393	456
204	394	457
205	395	457
207	406	459
208	407	460
209	407	461
211	411	472
212	412	473
213	413	473
215	424	475
216	425	476
217	425	477
219	428	488
220	429	489
221	430	489
223	441	491
224	442	492
225	442	493
227	445	504
228	446	505
229	447	505
231	458	507
232	459	508
233	459	509
235	462	520
236	463	521
237	464	521
455	925	964
239	475	523
240	476	524
241	476	525
456	926	965
243	479	536
244	480	537
245	481	537
457	927	965
247	492	539
248	493	540
249	493	541
251	496	552
252	497	553
253	498	553
459	938	967
255	509	555
256	510	556
257	510	557
460	939	968
259	513	568
260	514	569
261	515	569
461	939	969
263	526	571
264	527	572
265	527	573
267	530	584
268	531	585
269	532	585
463	942	980
271	543	587
272	544	588
273	544	589
464	943	981
275	547	600
276	548	601
277	549	601
465	944	981
279	560	603
280	561	604
281	561	605
283	564	616
284	565	617
285	566	617
467	955	983
287	577	619
288	578	620
289	578	621
468	956	984
291	581	632
292	582	633
293	583	633
469	956	985
295	594	635
296	595	636
297	595	637
299	598	648
300	599	649
301	600	649
471	959	996
303	611	651
304	612	652
305	612	653
472	960	997
307	615	664
308	616	665
309	617	665
473	961	997
311	628	667
312	629	668
313	629	669
315	632	680
316	633	681
317	634	681
475	972	999
319	645	683
320	646	684
321	646	685
476	973	1000
323	649	696
324	650	697
325	651	697
477	973	1001
327	662	699
328	663	700
329	663	701
331	666	712
332	667	713
333	668	713
479	976	1012
335	679	715
336	680	716
337	680	717
480	977	1013
339	683	728
340	684	729
341	685	729
343	696	731
344	697	732
345	697	733
347	700	744
348	701	745
349	702	745
351	713	747
352	714	748
353	714	749
355	717	760
356	718	761
357	719	761
359	730	763
360	731	764
361	731	765
363	734	776
364	735	777
365	736	777
367	747	779
368	748	780
369	748	781
371	751	792
372	752	793
373	753	793
375	764	795
376	765	796
377	765	797
379	768	808
380	769	809
381	770	809
383	781	811
384	782	812
385	782	813
387	785	824
388	786	825
389	787	825
391	789	836
392	790	837
393	791	837
395	802	839
396	803	840
397	803	841
399	806	852
400	807	853
401	808	853
403	819	855
404	820	856
405	820	857
407	823	868
408	824	869
409	825	869
411	836	871
412	837	872
413	837	873
415	840	884
416	841	885
417	842	885
419	853	887
420	854	888
421	854	889
423	857	900
424	858	901
425	859	901
427	870	903
428	871	904
429	871	905
431	874	916
432	875	917
433	876	917
435	887	919
436	888	920
437	888	921
439	891	932
440	892	933
441	893	933
443	904	935
444	905	936
445	905	937
447	908	948
448	909	949
449	910	949
451	921	951
452	922	952
453	922	953
481	978	1013
483	989	1015
484	990	1016
485	990	1017
487	993	1028
488	994	1029
489	995	1029
491	1006	1031
492	1007	1032
493	1007	1033
495	1010	1044
496	1011	1045
497	1012	1045
499	1023	1047
500	1024	1048
501	1024	1049
503	1027	1060
504	1028	1061
505	1029	1061
507	1040	1063
508	1041	1064
509	1041	1065
511	1044	1076
512	1045	1077
513	1046	1077
515	1057	1079
516	1058	1080
517	1058	1081
519	1061	1092
520	1062	1093
521	1063	1093
523	1074	1095
524	1075	1096
525	1075	1097
527	1079	1108
528	1080	1109
529	1081	1109
531	1092	1111
532	1093	1112
533	1093	1113
535	1097	1124
536	1098	1125
537	1099	1125
539	1110	1127
540	1111	1128
541	1111	1129
543	1115	1140
544	1116	1141
545	1117	1141
547	1128	1143
548	1129	1144
549	1129	1145
551	1133	1156
552	1134	1157
553	1135	1157
555	1146	1159
556	1147	1160
557	1147	1161
559	1151	1172
560	1152	1173
561	1153	1173
563	1164	1175
564	1165	1176
565	1165	1177
567	1169	1188
568	1170	1189
569	1171	1189
571	1182	1191
572	1183	1192
573	1183	1193
575	1187	1204
576	1188	1205
577	1189	1205
579	1200	1207
580	1201	1208
581	1201	1209
583	1205	1220
584	1206	1221
585	1207	1221
587	1218	1223
588	1219	1224
589	1219	1225
591	1223	1236
592	1224	1237
593	1225	1237
595	1236	1239
596	1237	1240
597	1237	1241
599	1241	1252
600	1242	1253
601	1243	1253
603	1254	1255
604	1255	1256
605	1255	1257
607	1259	1268
608	1260	1269
609	1261	1269
611	1272	1271
612	1273	1272
613	1273	1273
615	1277	1284
616	1278	1285
617	1279	1285
619	1290	1287
620	1291	1288
621	1291	1289
623	1295	1300
624	1296	1301
625	1297	1301
627	1308	1303
628	1309	1304
629	1309	1305
631	1313	1316
632	1314	1317
633	1315	1317
635	1326	1319
636	1327	1320
637	1327	1321
639	1330	1332
640	1331	1333
641	1332	1333
643	1343	1335
644	1344	1336
645	1344	1337
647	1348	1348
648	1349	1349
649	1350	1349
651	1361	1351
652	1362	1352
653	1362	1353
655	1366	1364
656	1367	1365
657	1368	1365
659	1379	1367
660	1380	1368
661	1380	1369
663	1384	1380
664	1385	1381
665	1386	1381
667	1397	1383
668	1398	1384
669	1398	1385
671	1402	1396
672	1403	1397
673	1404	1397
675	1415	1399
676	1416	1400
677	1416	1401
679	1420	1412
680	1421	1413
681	1422	1413
683	1433	1415
684	1434	1416
685	1434	1417
687	1438	1428
688	1439	1429
689	1440	1429
691	1451	1431
692	1452	1432
693	1452	1433
695	1456	1444
696	1457	1445
697	1458	1445
699	1469	1447
700	1470	1448
701	1470	1449
703	1474	1460
704	1475	1461
705	1476	1461
707	1487	1463
708	1488	1464
709	1488	1465
\.


--
-- Name: books_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('books_authors_id_seq', 710, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('books_id_seq', 1491, true);


--
-- Data for Name: checkout; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY checkout (id, patron_id, copy_id, due_date) FROM stdin;
1	405	1064	\N
2	414	1082	\N
3	423	1100	\N
4	432	1118	\N
\.


--
-- Name: checkout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('checkout_id_seq', 4, true);


--
-- Data for Name: copies; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY copies (id, in_library, book_name) FROM stdin;
\.


--
-- Name: copies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('copies_id_seq', 1118, true);


--
-- Data for Name: patrons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY patrons (id, name, patron_number, password) FROM stdin;
\.


--
-- Name: patrons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('patrons_id_seq', 432, true);


--
-- Name: admin_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY books_authors
    ADD CONSTRAINT books_authors_pkey PRIMARY KEY (id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: checkout_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY checkout
    ADD CONSTRAINT checkout_pkey PRIMARY KEY (id);


--
-- Name: copies_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY copies
    ADD CONSTRAINT copies_pkey PRIMARY KEY (id);


--
-- Name: patrons_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY patrons
    ADD CONSTRAINT patrons_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

