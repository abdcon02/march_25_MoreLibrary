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
    copy_id integer
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
    book_name character varying,
    book_id integer,
    due_date date
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

SELECT pg_catalog.setval('admin_id_seq', 2152, true);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY authors (id, name) FROM stdin;
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('authors_id_seq', 4426, true);


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
711	1492	1476
712	1493	1477
713	1494	1477
715	1505	1479
716	1506	1480
717	1506	1481
719	1510	1492
720	1511	1493
721	1512	1493
723	1523	1495
724	1524	1496
725	1524	1497
727	1530	1508
728	1531	1509
729	1532	1509
731	1543	1511
732	1544	1512
733	1544	1513
735	1550	1524
736	1551	1525
737	1552	1525
739	1563	1527
740	1564	1528
741	1564	1529
743	1570	1540
744	1571	1541
745	1572	1541
747	1583	1543
748	1584	1544
749	1584	1545
751	1590	1556
752	1591	1557
753	1592	1557
755	1603	1559
756	1604	1560
757	1604	1561
759	1610	1572
760	1611	1573
761	1612	1573
763	1623	1575
764	1624	1576
765	1624	1577
767	1630	1588
768	1631	1589
769	1632	1589
771	1643	1591
772	1644	1592
773	1644	1593
775	1650	1604
776	1651	1605
777	1652	1605
779	1663	1607
780	1664	1608
781	1664	1609
783	1670	1620
784	1671	1621
785	1672	1621
787	1683	1623
788	1684	1624
789	1684	1625
791	1690	1636
792	1691	1637
793	1692	1637
795	1703	1639
796	1704	1640
797	1704	1641
799	1710	1652
800	1711	1653
801	1712	1653
803	1723	1655
804	1724	1656
805	1724	1657
807	1730	1668
808	1731	1669
809	1732	1669
811	1743	1671
812	1744	1672
813	1744	1673
815	1750	1684
816	1751	1685
817	1752	1685
819	1763	1687
820	1764	1688
821	1764	1689
823	1770	1700
824	1771	1701
825	1772	1701
827	1783	1703
828	1784	1704
829	1784	1705
831	1790	1716
832	1791	1717
833	1792	1717
835	1803	1719
836	1804	1720
837	1804	1721
839	1810	1732
840	1811	1733
841	1812	1733
843	1823	1735
844	1824	1736
845	1824	1737
847	1830	1748
848	1831	1749
849	1832	1749
851	1843	1751
852	1844	1752
853	1844	1753
855	1850	1764
856	1851	1765
857	1852	1765
859	1863	1767
860	1864	1768
861	1864	1769
863	1870	1780
864	1871	1781
865	1872	1781
867	1883	1783
868	1884	1784
869	1884	1785
871	1890	1796
872	1891	1797
873	1892	1797
875	1903	1799
876	1904	1800
877	1904	1801
879	1910	1812
880	1911	1813
881	1912	1813
883	1923	1815
884	1924	1816
885	1924	1817
887	1930	1828
888	1931	1829
889	1932	1829
891	1943	1831
892	1944	1832
893	1944	1833
895	1950	1844
896	1951	1845
897	1952	1845
899	1963	1847
900	1964	1848
901	1964	1849
903	1972	1860
904	1973	1861
905	1974	1861
907	1985	1863
908	1986	1864
909	1986	1865
911	1994	1876
912	1995	1877
913	1996	1877
915	2007	1879
916	2008	1880
917	2008	1881
919	2016	1892
920	2017	1893
921	2018	1893
923	2029	1895
924	2030	1896
925	2030	1897
927	2038	1908
928	2039	1909
929	2040	1909
931	2051	1911
932	2052	1912
933	2052	1913
935	2060	1924
936	2061	1925
937	2062	1925
939	2073	1927
940	2074	1928
941	2074	1929
943	2082	1940
944	2083	1941
945	2084	1941
947	2095	1943
948	2096	1944
949	2096	1945
951	2104	1956
952	2105	1957
953	2106	1957
955	2117	1959
956	2118	1960
957	2118	1961
959	2126	1972
960	2127	1973
961	2128	1973
963	2139	1975
964	2140	1976
965	2140	1977
967	2148	1988
968	2149	1989
969	2150	1989
971	2161	1991
972	2162	1992
973	2162	1993
975	2170	2004
976	2171	2005
977	2172	2005
979	2183	2007
980	2184	2008
981	2184	2009
983	2192	2020
984	2193	2021
985	2194	2021
987	2205	2023
988	2206	2024
989	2206	2025
991	2214	2036
992	2215	2037
993	2216	2037
995	2227	2039
996	2228	2040
997	2228	2041
999	2236	2052
1000	2237	2053
1001	2238	2053
1003	2249	2055
1004	2250	2056
1005	2250	2057
1007	2258	2068
1008	2259	2069
1009	2260	2069
1011	2271	2071
1012	2272	2072
1013	2272	2073
1015	2282	2084
1016	2283	2085
1017	2284	2085
1019	2295	2087
1020	2296	2088
1021	2296	2089
1023	2306	2100
1024	2307	2101
1025	2308	2101
1027	2319	2103
1028	2320	2104
1029	2320	2105
1031	2330	2116
1032	2331	2117
1033	2332	2117
1035	2343	2119
1036	2344	2120
1037	2344	2121
1039	2354	2132
1040	2355	2133
1041	2356	2133
1043	2367	2135
1044	2368	2136
1045	2368	2137
1047	2378	2148
1048	2379	2149
1049	2380	2149
1051	2391	2151
1052	2392	2152
1053	2392	2153
1055	2402	2164
1056	2403	2165
1057	2404	2165
1059	2415	2167
1060	2416	2168
1061	2416	2169
1063	2426	2180
1064	2427	2181
1065	2428	2181
1067	2439	2183
1068	2440	2184
1069	2440	2185
1071	2450	2196
1072	2451	2197
1073	2452	2197
1075	2463	2199
1076	2464	2200
1077	2464	2201
1079	2474	2212
1080	2475	2213
1081	2476	2213
1083	2487	2215
1084	2488	2216
1085	2488	2217
1087	2498	2228
1088	2499	2229
1089	2500	2229
1091	2511	2231
1092	2512	2232
1093	2512	2233
1095	2522	2244
1096	2523	2245
1097	2524	2245
1099	2535	2247
1100	2536	2248
1101	2536	2249
1103	2546	2260
1104	2547	2261
1105	2548	2261
1107	2559	2263
1108	2560	2264
1109	2560	2265
1111	2570	2276
1112	2571	2277
1113	2572	2277
1115	2583	2279
1116	2584	2280
1117	2584	2281
1119	2594	2292
1120	2595	2293
1121	2596	2293
1123	2607	2295
1124	2608	2296
1125	2608	2297
1127	2618	2308
1128	2619	2309
1129	2620	2309
1131	2631	2311
1132	2632	2312
1133	2632	2313
1135	2642	2324
1136	2643	2325
1137	2644	2325
1139	2655	2327
1140	2656	2328
1141	2656	2329
1143	2666	2340
1144	2667	2341
1145	2668	2341
1147	2679	2343
1148	2680	2344
1149	2680	2345
1151	2690	2356
1152	2691	2357
1153	2692	2357
1155	2703	2359
1156	2704	2360
1157	2704	2361
1159	2714	2372
1160	2715	2373
1161	2716	2373
1163	2727	2375
1164	2728	2376
1165	2728	2377
1167	2738	2388
1168	2739	2389
1169	2740	2389
1171	2751	2391
1172	2752	2392
1173	2752	2393
1175	2762	2404
1176	2763	2405
1177	2764	2405
1179	2775	2407
1180	2776	2408
1181	2776	2409
1183	2786	2420
1184	2787	2421
1185	2788	2421
1187	2799	2423
1188	2800	2424
1189	2800	2425
1191	2810	2436
1192	2811	2437
1193	2812	2437
1195	2823	2439
1196	2824	2440
1197	2824	2441
1199	2834	2452
1200	2835	2453
1201	2836	2453
1203	2847	2455
1204	2848	2456
1205	2848	2457
1207	2858	2468
1208	2859	2469
1209	2860	2469
1211	2871	2471
1212	2872	2472
1213	2872	2473
1215	2882	2484
1216	2883	2485
1217	2884	2485
1219	2895	2487
1220	2896	2488
1221	2896	2489
1223	2906	2500
1224	2907	2501
1225	2908	2501
1227	2919	2503
1228	2920	2504
1229	2920	2505
1231	2930	2516
1232	2931	2517
1233	2932	2517
1235	2943	2519
1236	2944	2520
1237	2944	2521
1239	2948	2532
1240	2949	2533
1241	2950	2533
1243	2961	2535
1244	2962	2536
1245	2962	2537
1247	2972	2548
1248	2973	2549
1249	2974	2549
1251	2985	2551
1252	2986	2552
1253	2986	2553
1255	2996	2564
1256	2997	2565
1257	2998	2565
1259	3009	2567
1260	3010	2568
1261	3010	2569
1263	3020	2580
1264	3021	2581
1265	3022	2581
1267	3033	2583
1268	3034	2584
1269	3034	2585
1271	3044	2596
1272	3045	2597
1273	3046	2597
1275	3057	2599
1276	3058	2600
1277	3058	2601
1279	3068	2612
1280	3069	2613
1281	3070	2613
1283	3081	2615
1284	3082	2616
1285	3082	2617
1287	3092	2628
1288	3093	2629
1289	3094	2629
1291	3105	2631
1292	3106	2632
1293	3106	2633
1295	3116	2644
1296	3117	2645
1297	3118	2645
1299	3129	2647
1300	3130	2648
1301	3130	2649
1303	3140	2660
1304	3141	2661
1305	3142	2661
1307	3153	2663
1308	3154	2664
1309	3154	2665
1311	3164	2676
1312	3165	2677
1313	3166	2677
1315	3177	2679
1316	3178	2680
1317	3178	2681
1319	3188	2692
1320	3189	2693
1321	3190	2693
1323	3201	2695
1324	3202	2696
1325	3202	2697
1327	3212	2708
1328	3213	2709
1329	3214	2709
1331	3225	2711
1332	3226	2712
1333	3226	2713
1335	3236	2724
1336	3237	2725
1337	3238	2725
1339	3249	2727
1340	3250	2728
1341	3250	2729
1343	3261	2740
1344	3262	2741
1345	3263	2741
1347	3274	2743
1348	3275	2744
1349	3275	2745
1351	3286	2756
1352	3287	2757
1353	3288	2757
1355	3299	2759
1356	3300	2760
1357	3300	2761
1359	3311	2772
1360	3312	2773
1361	3313	2773
1363	3324	2775
1364	3325	2776
1365	3325	2777
1367	3336	2788
1368	3337	2789
1369	3338	2789
1371	3349	2791
1372	3350	2792
1373	3350	2793
1375	3361	2804
1376	3362	2805
1377	3363	2805
1379	3374	2807
1380	3375	2808
1381	3375	2809
1383	3386	2820
1384	3387	2821
1385	3388	2821
1387	3399	2823
1388	3400	2824
1389	3400	2825
1391	3411	2836
1392	3412	2837
1393	3413	2837
1395	3424	2839
1396	3425	2840
1397	3425	2841
1399	3436	2852
1400	3437	2853
1401	3438	2853
1403	3449	2855
1404	3450	2856
1405	3450	2857
1407	3461	2868
1408	3462	2869
1409	3463	2869
1411	3474	2871
1412	3475	2872
1413	3475	2873
1415	3486	2884
1416	3487	2885
1417	3488	2885
1419	3499	2887
1420	3500	2888
1421	3500	2889
1423	3511	2900
1424	3512	2901
1425	3513	2901
1427	3524	2903
1428	3525	2904
1429	3525	2905
1431	3536	2916
1432	3537	2917
1433	3538	2917
1435	3549	2919
1436	3550	2920
1437	3550	2921
1439	3561	2932
1440	3562	2933
1441	3563	2933
1443	3574	2935
1444	3575	2936
1445	3575	2937
1447	3586	2948
1448	3587	2949
1449	3588	2949
1451	3599	2951
1452	3600	2952
1453	3600	2953
1455	3611	2964
1456	3612	2965
1457	3613	2965
1459	3624	2967
1460	3625	2968
1461	3625	2969
1463	3636	2980
1464	3637	2981
1465	3638	2981
1467	3649	2983
1468	3650	2984
1469	3650	2985
1471	3661	2996
1472	3662	2997
1473	3663	2997
1475	3674	2999
1476	3675	3000
1477	3675	3001
1479	3686	3012
1480	3687	3013
1481	3688	3013
1483	3699	3015
1484	3700	3016
1485	3700	3017
1487	3711	3028
1488	3712	3029
1489	3713	3029
1491	3724	3031
1492	3725	3032
1493	3725	3033
1495	3736	3044
1496	3737	3045
1497	3738	3045
1499	3749	3047
1500	3750	3048
1501	3750	3049
1503	3761	3060
1504	3762	3061
1505	3763	3061
1507	3774	3063
1508	3775	3064
1509	3775	3065
1511	3786	3076
1512	3787	3077
1513	3788	3077
1515	3799	3079
1516	3800	3080
1517	3800	3081
1519	3811	3092
1520	3812	3093
1521	3813	3093
1523	3824	3095
1524	3825	3096
1525	3825	3097
1527	3836	3108
1528	3837	3109
1529	3838	3109
1531	3849	3111
1532	3850	3112
1533	3850	3113
1535	3861	3124
1536	3862	3125
1537	3863	3125
1539	3874	3127
1540	3875	3128
1541	3875	3129
1543	3888	3140
1544	3889	3141
1545	3890	3141
1547	3901	3143
1548	3902	3144
1549	3902	3145
1551	3915	3156
1552	3916	3157
1553	3917	3157
1555	3928	3159
1556	3929	3160
1557	3929	3161
1559	3942	3172
1560	3943	3173
1561	3944	3173
1563	3955	3175
1564	3956	3176
1565	3956	3177
1567	3969	3188
1568	3970	3189
1569	3971	3189
1571	3982	3191
1572	3983	3192
1573	3983	3193
1575	3996	3204
1576	3997	3205
1577	3998	3205
1579	4009	3207
1580	4010	3208
1581	4010	3209
1583	4023	3220
1584	4024	3221
1585	4025	3221
1587	4036	3223
1588	4037	3224
1589	4037	3225
1591	4048	3236
1592	4049	3237
1593	4050	3237
1595	4061	3239
1596	4062	3240
1597	4062	3241
1599	4075	3252
1600	4076	3253
1601	4077	3253
1603	4088	3255
1604	4089	3256
1605	4089	3257
1607	4102	3268
1608	4103	3269
1609	4104	3269
1611	4115	3271
1612	4116	3272
1613	4116	3273
1615	4127	3284
1616	4128	3285
1617	4129	3285
1619	4140	3287
1620	4141	3288
1621	4141	3289
1623	4152	3300
1624	4153	3301
1625	4154	3301
1627	4165	3303
1628	4166	3304
1629	4166	3305
1631	4177	3316
1632	4178	3317
1633	4179	3317
1635	4190	3319
1636	4191	3320
1637	4191	3321
1639	4202	3332
1640	4203	3333
1641	4204	3333
1643	4215	3335
1644	4216	3336
1645	4216	3337
1647	4227	3348
1648	4228	3349
1649	4229	3349
1651	4240	3351
1652	4241	3352
1653	4241	3353
1655	4252	3364
1656	4253	3365
1657	4254	3365
1659	4265	3367
1660	4266	3368
1661	4266	3369
1663	4277	3380
1664	4278	3381
1665	4279	3381
1667	4290	3383
1668	4291	3384
1669	4291	3385
1671	4302	3396
1672	4303	3397
1673	4304	3397
1675	4315	3399
1676	4316	3400
1677	4316	3401
1679	4327	3412
1680	4328	3413
1681	4329	3413
1683	4340	3415
1684	4341	3416
1685	4341	3417
1687	4352	3428
1688	4353	3429
1689	4354	3429
1691	4365	3431
1692	4366	3432
1693	4366	3433
1695	4377	3444
1696	4378	3445
1697	4379	3445
1699	4390	3447
1700	4391	3448
1701	4391	3449
1703	4402	3460
1704	4403	3461
1705	4404	3461
1707	4415	3463
1708	4416	3464
1709	4416	3465
1711	4427	3476
1712	4428	3477
1713	4429	3477
1715	4440	3479
1716	4441	3480
1717	4441	3481
1719	4452	3492
1720	4453	3493
1721	4454	3493
1723	4465	3495
1724	4466	3496
1725	4466	3497
1727	4477	3508
1728	4478	3509
1729	4479	3509
1731	4490	3511
1732	4491	3512
1733	4491	3513
1735	4502	3524
1736	4503	3525
1737	4504	3525
1739	4515	3527
1740	4516	3528
1741	4516	3529
1743	4527	3540
1744	4528	3541
1745	4529	3541
1747	4540	3543
1748	4541	3544
1749	4541	3545
1751	4552	3556
1752	4553	3557
1753	4554	3557
1755	4565	3559
1756	4566	3560
1757	4566	3561
1759	4577	3572
1760	4578	3573
1761	4579	3573
1763	4590	3575
1764	4591	3576
1765	4591	3577
1767	4602	3588
1768	4603	3589
1769	4604	3589
1771	4615	3591
1772	4616	3592
1773	4616	3593
1775	4627	3604
1776	4628	3605
1777	4629	3605
1779	4640	3607
1780	4641	3608
1781	4641	3609
1783	4652	3620
1784	4653	3621
1785	4654	3621
1787	4665	3623
1788	4666	3624
1789	4666	3625
1791	4677	3636
1792	4678	3637
1793	4679	3637
1795	4690	3639
1796	4691	3640
1797	4691	3641
1799	4702	3652
1800	4703	3653
1801	4704	3653
1803	4715	3655
1804	4716	3656
1805	4716	3657
1807	4727	3668
1808	4728	3669
1809	4729	3669
1811	4740	3671
1812	4741	3672
1813	4741	3673
1815	4752	3684
1816	4753	3685
1817	4754	3685
1819	4765	3687
1820	4766	3688
1821	4766	3689
1823	4777	3700
1824	4778	3701
1825	4779	3701
1827	4790	3703
1828	4791	3704
1829	4791	3705
1831	4802	3716
1832	4803	3717
1833	4804	3717
1835	4815	3719
1836	4816	3720
1837	4816	3721
1839	4827	3732
1840	4828	3733
1841	4829	3733
1843	4840	3735
1844	4841	3736
1845	4841	3737
1847	4852	3748
1848	4853	3749
1849	4854	3749
1851	4865	3751
1852	4866	3752
1853	4866	3753
1855	4877	3764
1856	4878	3765
1857	4879	3765
1859	4890	3767
1860	4891	3768
1861	4891	3769
1863	4902	3780
1864	4903	3781
1865	4904	3781
1867	4915	3783
1868	4916	3784
1869	4916	3785
1871	4927	3796
1872	4928	3797
1873	4929	3797
1875	4940	3799
1876	4941	3800
1877	4941	3801
1879	4952	3812
1880	4953	3813
1881	4954	3813
1883	4965	3815
1884	4966	3816
1885	4966	3817
1887	4977	3828
1888	4978	3829
1889	4979	3829
1891	4990	3831
1892	4991	3832
1893	4991	3833
1895	5002	3844
1896	5003	3845
1897	5004	3845
1899	5015	3847
1900	5016	3848
1901	5016	3849
1903	5027	3860
1904	5028	3861
1905	5029	3861
1907	5040	3863
1908	5041	3864
1909	5041	3865
1911	5052	3876
1912	5053	3877
1913	5054	3877
1915	5065	3879
1916	5066	3880
1917	5066	3881
1919	5077	3892
1920	5078	3893
1921	5079	3893
1923	5090	3895
1924	5091	3896
1925	5091	3897
1927	5102	3908
1928	5103	3909
1929	5104	3909
1931	5115	3911
1932	5116	3912
1933	5116	3913
1935	5127	3924
1936	5128	3925
1937	5129	3925
2103	5690	4260
1939	5140	3927
1940	5141	3928
1941	5141	3929
2104	5691	4261
1943	5152	3940
1944	5153	3941
1945	5154	3941
2105	5692	4261
1947	5165	3943
1948	5166	3944
1949	5166	3945
1951	5177	3956
1952	5178	3957
1953	5179	3957
2107	5703	4263
1955	5190	3959
1956	5191	3960
1957	5191	3961
2108	5704	4264
1959	5204	3972
1960	5205	3973
1961	5206	3973
2109	5704	4265
1963	5217	3975
1964	5218	3976
1965	5218	3977
1967	5231	3988
1968	5232	3989
1969	5233	3989
2111	5717	4276
1971	5244	3991
1972	5245	3992
1973	5245	3993
2112	5718	4277
1975	5258	4004
1976	5259	4005
1977	5260	4005
2113	5719	4277
1979	5271	4007
1980	5272	4008
1981	5272	4009
1983	5285	4020
1984	5286	4021
1985	5287	4021
2115	5730	4279
1987	5298	4023
1988	5299	4024
1989	5299	4025
2116	5731	4280
1991	5312	4036
1992	5313	4037
1993	5314	4037
2117	5731	4281
1995	5325	4039
1996	5326	4040
1997	5326	4041
1999	5339	4052
2000	5340	4053
2001	5341	4053
2119	5744	4292
2003	5352	4055
2004	5353	4056
2005	5353	4057
2120	5745	4293
2007	5366	4068
2008	5367	4069
2009	5368	4069
2121	5746	4293
2011	5379	4071
2012	5380	4072
2013	5380	4073
2015	5393	4084
2016	5394	4085
2017	5395	4085
2123	5757	4295
2019	5406	4087
2020	5407	4088
2021	5407	4089
2124	5758	4296
2023	5420	4100
2024	5421	4101
2025	5422	4101
2125	5758	4297
2027	5433	4103
2028	5434	4104
2029	5434	4105
2031	5447	4116
2032	5448	4117
2033	5449	4117
2127	5771	4308
2035	5460	4119
2036	5461	4120
2037	5461	4121
2128	5772	4309
2039	5474	4132
2040	5475	4133
2041	5476	4133
2129	5773	4309
2043	5487	4135
2044	5488	4136
2045	5488	4137
2047	5501	4148
2048	5502	4149
2049	5503	4149
2131	5784	4311
2051	5514	4151
2052	5515	4152
2053	5515	4153
2132	5785	4312
2055	5528	4164
2056	5529	4165
2057	5530	4165
2133	5785	4313
2059	5541	4167
2060	5542	4168
2061	5542	4169
2063	5555	4180
2064	5556	4181
2065	5557	4181
2135	5798	4324
2067	5568	4183
2068	5569	4184
2069	5569	4185
2136	5799	4325
2071	5582	4196
2072	5583	4197
2073	5584	4197
2137	5800	4325
2075	5595	4199
2076	5596	4200
2077	5596	4201
2079	5609	4212
2080	5610	4213
2081	5611	4213
2139	5811	4327
2083	5622	4215
2084	5623	4216
2085	5623	4217
2140	5812	4328
2087	5636	4228
2088	5637	4229
2089	5638	4229
2141	5812	4329
2091	5649	4231
2092	5650	4232
2093	5650	4233
2095	5663	4244
2096	5664	4245
2097	5665	4245
2143	5825	4340
2099	5676	4247
2100	5677	4248
2101	5677	4249
2144	5826	4341
2145	5827	4341
2147	5838	4343
2148	5839	4344
2149	5839	4345
2151	5852	4356
2152	5853	4357
2153	5854	4357
2155	5865	4359
2156	5866	4360
2157	5866	4361
2159	5879	4372
2160	5880	4373
2161	5881	4373
2163	5892	4375
2164	5893	4376
2165	5893	4377
2167	5906	4388
2168	5907	4389
2169	5908	4389
2171	5919	4391
2172	5920	4392
2173	5920	4393
2175	5933	4404
2176	5934	4405
2177	5935	4405
2179	5946	4407
2180	5947	4408
2181	5947	4409
2183	5960	4420
2184	5961	4421
2185	5962	4421
2187	5973	4423
2188	5974	4424
2189	5974	4425
\.


--
-- Name: books_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('books_authors_id_seq', 2190, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('books_id_seq', 5986, true);


--
-- Data for Name: checkout; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY checkout (id, patron_id, copy_id) FROM stdin;
\.


--
-- Name: checkout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('checkout_id_seq', 1015, true);


--
-- Data for Name: copies; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY copies (id, in_library, book_name, book_id, due_date) FROM stdin;
\.


--
-- Name: copies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('copies_id_seq', 5616, true);


--
-- Data for Name: patrons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY patrons (id, name, patron_number, password) FROM stdin;
\.


--
-- Name: patrons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('patrons_id_seq', 2733, true);


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

