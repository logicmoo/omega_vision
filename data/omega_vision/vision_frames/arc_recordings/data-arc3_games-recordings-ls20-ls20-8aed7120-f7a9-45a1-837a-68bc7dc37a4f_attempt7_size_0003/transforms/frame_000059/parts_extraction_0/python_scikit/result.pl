% bbox-FREE region facts (topology only).
:- dynamic region/4.
:- dynamic adjacent/2.
:- dynamic shared_edge/3.
:- dynamic encloses/2.
:- dynamic border/1.
:- dynamic img_size/2.
:- dynamic perimeter/2.
:- dynamic polygon/2.
:- dynamic hole/2.
:- dynamic midline/2.
:- dynamic fillpoint/3.
:- discontiguous region/4.
:- discontiguous adjacent/2.
:- discontiguous shared_edge/3.
:- discontiguous encloses/2.
:- discontiguous border/1.
:- discontiguous perimeter/2.
:- discontiguous polygon/2.
:- discontiguous hole/2.
:- discontiguous midline/2.
:- discontiguous fillpoint/3.
img_size(640, 640).

region(r1, '#aaaaaa', 302400, centroid(366,267)).
perimeter(r1, 4940).
polygon(r1, [xy(120,639),xy(120,600),xy(320,599),xy(320,580),xy(329,580),xy(330,570),xy(340,569),xy(340,560),xy(280,559),xy(280,490),xy(349,490),xy(350,509),xy(360,509),xy(360,430),xy(350,429),xy(350,390),xy(340,389),xy(340,370),xy(330,370),xy(330,360),xy(320,359),xy(320,340),xy(310,340),xy(310,330),xy(300,330),xy(300,320),xy(290,320),xy(289,310),xy(270,310),xy(270,300),xy(260,300),xy(259,290),xy(240,290),xy(239,280),xy(200,280),xy(199,270),xy(120,270),xy(119,280),xy(80,280),xy(79,290),xy(60,290),xy(60,299),xy(50,300),xy(50,309),xy(40,310),xy(40,519),xy(0,520)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(330,519),xy(329,510),xy(320,510),xy(319,520),xy(310,520),xy(309,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(330,539)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(37,260),xy(22,295),xy(19,314),xy(20,500)]).
midline(r1, [xy(38,259),xy(64,217),xy(81,199),xy(105,165),xy(134,134),xy(222,135),xy(286,143),xy(293,146),xy(238,201),xy(235,211),xy(237,216),xy(233,219),xy(227,241),xy(220,253),xy(222,253)]).
midline(r1, [xy(230,233),xy(232,231)]).
midline(r1, [xy(236,219),xy(232,228)]).
midline(r1, [xy(226,244),xy(228,242)]).
midline(r1, [xy(79,203),xy(84,211),xy(83,216),xy(85,216)]).
midline(r1, [xy(85,218),xy(88,230),xy(90,230)]).
midline(r1, [xy(90,232),xy(94,242),xy(93,247),xy(97,249)]).
midline(r1, [xy(238,214),xy(237,212),xy(302,147),xy(294,145)]).
midline(r1, [xy(44,250),xy(61,268),xy(43,252)]).
midline(r1, [xy(62,269),xy(61,270)]).
midline(r1, [xy(303,147),xy(382,168),xy(446,193),xy(457,219),xy(457,224),xy(460,227),xy(469,263),xy(477,282),xy(486,322),xy(417,391),xy(402,399),xy(388,401),xy(384,405),xy(380,405),xy(380,407)]).
midline(r1, [xy(414,395),xy(419,391),xy(422,392),xy(418,394)]).
midline(r1, [xy(487,323),xy(488,329),xy(423,392)]).
midline(r1, [xy(488,331),xy(499,407),xy(499,470),xy(445,523),xy(422,540),xy(395,554),xy(358,538),xy(344,524),xy(325,525),xy(314,514),xy(315,502),xy(313,500),xy(291,501),xy(289,528),xy(290,535),xy(296,545),xy(310,550),xy(329,550),xy(340,547),xy(356,538)]).
midline(r1, [xy(315,500),xy(329,499),xy(338,501),xy(340,515),xy(344,523)]).
midline(r1, [xy(394,555),xy(367,580),xy(334,594),xy(323,604),xy(125,605),xy(125,634),xy(553,634),xy(555,628),xy(555,525),xy(500,470)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,632),xy(572,635),xy(555,633)]).
midline(r1, [xy(390,403),xy(388,403)]).
midline(r1, [xy(586,556),xy(616,586),xy(614,591),xy(614,633),xy(608,635),xy(585,633)]).
midline(r1, [xy(615,633),xy(635,635)]).
fillpoint(r1, xy(446,193), 193.7).
fillpoint(r1, xy(460,228), 180.0).
fillpoint(r1, xy(461,231), 179.0).
fillpoint(r1, xy(462,234), 178.0).
fillpoint(r1, xy(463,237), 177.0).
fillpoint(r1, xy(402,175), 176.0).
fillpoint(r1, xy(464,240), 176.0).
fillpoint(r1, xy(467,250), 173.0).
fillpoint(r1, xy(468,254), 172.0).
fillpoint(r1, xy(384,169), 170.0).
fillpoint(r1, xy(470,261), 170.0).
fillpoint(r1, xy(381,168), 169.0).
fillpoint(r1, xy(374,166), 167.0).
fillpoint(r1, xy(370,165), 166.0).
fillpoint(r1, xy(366,164), 165.0).
fillpoint(r1, xy(360,162), 163.0).
fillpoint(r1, xy(477,283), 163.0).
fillpoint(r1, xy(357,161), 162.0).
fillpoint(r1, xy(354,160), 161.0).
fillpoint(r1, xy(479,290), 161.0).
fillpoint(r1, xy(351,159), 160.0).
fillpoint(r1, xy(480,294), 160.0).
fillpoint(r1, xy(348,158), 159.0).
fillpoint(r1, xy(481,298), 159.0).
fillpoint(r1, xy(482,302), 158.0).
fillpoint(r1, xy(341,156), 157.0).
fillpoint(r1, xy(483,307), 157.0).
fillpoint(r1, xy(484,311), 156.0).
fillpoint(r1, xy(334,154), 155.0).
fillpoint(r1, xy(485,315), 155.0).
fillpoint(r1, xy(330,153), 154.0).
fillpoint(r1, xy(486,319), 154.0).
fillpoint(r1, xy(326,152), 153.0).
fillpoint(r1, xy(487,323), 153.0).
fillpoint(r1, xy(321,151), 152.0).
fillpoint(r1, xy(488,328), 152.0).
fillpoint(r1, xy(316,150), 151.0).
fillpoint(r1, xy(489,333), 151.0).
fillpoint(r1, xy(490,338), 150.0).
fillpoint(r1, xy(491,344), 149.0).
fillpoint(r1, xy(304,147), 148.0).
fillpoint(r1, xy(492,351), 148.0).
fillpoint(r1, xy(300,146), 147.0).
fillpoint(r1, xy(493,359), 147.0).
fillpoint(r1, xy(295,145), 146.0).
fillpoint(r1, xy(494,370), 146.0).
fillpoint(r1, xy(290,144), 145.0).
fillpoint(r1, xy(495,379), 145.0).
fillpoint(r1, xy(285,143), 144.0).
fillpoint(r1, xy(496,385), 144.0).
fillpoint(r1, xy(278,142), 143.0).
fillpoint(r1, xy(497,392), 143.0).
fillpoint(r1, xy(270,141), 142.0).
fillpoint(r1, xy(498,399), 142.0).
fillpoint(r1, xy(259,140), 141.0).
fillpoint(r1, xy(499,411), 141.0).
fillpoint(r1, xy(249,139), 140.0).
fillpoint(r1, xy(499,451), 140.0).
fillpoint(r1, xy(244,138), 139.0).
fillpoint(r1, xy(237,137), 138.0).
fillpoint(r1, xy(229,136), 137.0).
fillpoint(r1, xy(219,135), 136.0).
fillpoint(r1, xy(134,135), 135.0).
fillpoint(r1, xy(398,552), 58.0).
border(r1).
region(r3, '#ffdc00', 51500, centroid(169,463)).
perimeter(r3, 2280).
polygon(r3, [xy(0,520),xy(40,519),xy(40,310),xy(49,310),xy(50,300),xy(59,300),xy(60,290),xy(79,290),xy(80,280),xy(90,280),xy(90,449),xy(139,450),xy(140,500),xy(189,500),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(269,300),xy(270,310),xy(289,310),xy(290,479),xy(270,480),xy(270,569),xy(329,570),xy(330,579),xy(320,580),xy(320,599),xy(120,600),xy(120,639)]).
hole(r3, [xy(50,639),xy(50,630),xy(110,629),xy(109,530),xy(10,530),xy(10,599),xy(0,600)]).
midline(r3, [xy(203,325),xy(164,325)]).
midline(r3, [xy(204,325),xy(247,325),xy(250,320),xy(249,325),xy(263,336),xy(265,352),xy(264,455),xy(229,489),xy(228,516),xy(223,532),xy(215,546),xy(203,549),xy(161,550),xy(100,490),xy(81,489),xy(73,479),xy(66,463),xy(64,447),xy(64,329),xy(74,304),xy(84,293),xy(85,284)]).
midline(r3, [xy(216,546),xy(239,569),xy(257,582),xy(270,585),xy(305,585)]).
midline(r3, [xy(306,583),xy(316,575),xy(325,575)]).
midline(r3, [xy(159,550),xy(116,594),xy(114,600),xy(115,629),xy(113,634),xy(54,635)]).
midline(r3, [xy(80,489),xy(43,524),xy(5,525),xy(5,595)]).
fillpoint(r3, xy(216,546), 54.0).
fillpoint(r3, xy(212,547), 53.0).
fillpoint(r3, xy(208,548), 52.0).
fillpoint(r3, xy(201,549), 51.0).
fillpoint(r3, xy(159,550), 50.0).
fillpoint(r3, xy(225,526), 45.0).
fillpoint(r3, xy(226,523), 44.0).
fillpoint(r3, xy(228,515), 42.0).
fillpoint(r3, xy(81,489), 41.0).
fillpoint(r3, xy(229,509), 41.0).
fillpoint(r3, xy(91,490), 40.0).
fillpoint(r3, xy(229,494), 40.0).
fillpoint(r3, xy(68,468), 29.0).
fillpoint(r3, xy(67,465), 28.0).
fillpoint(r3, xy(262,335), 27.2).
fillpoint(r3, xy(263,337), 27.0).
fillpoint(r3, xy(66,462), 27.0).
fillpoint(r3, xy(250,326), 26.2).
fillpoint(r3, xy(248,325), 26.0).
fillpoint(r3, xy(264,342), 26.0).
fillpoint(r3, xy(65,458), 26.0).
fillpoint(r3, xy(264,455), 25.7).
fillpoint(r3, xy(254,329), 25.6).
fillpoint(r3, xy(255,330), 25.6).
fillpoint(r3, xy(164,325), 25.0).
fillpoint(r3, xy(64,389), 25.0).
fillpoint(r3, xy(264,400), 25.0).
fillpoint(r3, xy(74,305), 16.0).
fillpoint(r3, xy(264,584), 16.0).
fillpoint(r3, xy(271,585), 15.0).
border(r3).
region(r2, '#2ecc40', 20200, centroid(160,366)).
perimeter(r2, 1140).
polygon(r2, [xy(239,450),xy(90,449),xy(90,280),xy(119,280),xy(120,270),xy(199,270),xy(200,280),xy(239,280),xy(240,290),xy(260,290),xy(259,300),xy(140,300),xy(140,350),xy(240,350),xy(239,450)]).
hole(r2, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
hole(r2, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r2, [xy(210,379),xy(185,381),xy(164,390),xy(144,381),xy(123,377),xy(118,369),xy(115,358),xy(114,304),xy(134,284),xy(185,284),xy(200,290),xy(230,289),xy(240,295),xy(255,295)]).
midline(r2, [xy(164,391),xy(164,415),xy(135,443),xy(125,445),xy(96,444),xy(94,439),xy(95,406),xy(122,377)]).
midline(r2, [xy(210,381),xy(220,393),xy(224,405),xy(195,434),xy(183,430),xy(165,415)]).
midline(r2, [xy(195,435),xy(206,444),xy(219,445),xy(225,443),xy(233,435),xy(235,427),xy(234,416),xy(225,405)]).
fillpoint(r2, xy(165,390), 40.3).
fillpoint(r2, xy(165,413), 35.0).
fillpoint(r2, xy(122,377), 33.0).
fillpoint(r2, xy(126,378), 32.0).
fillpoint(r2, xy(143,381), 32.0).
fillpoint(r2, xy(186,381), 32.0).
fillpoint(r2, xy(131,379), 31.1).
fillpoint(r2, xy(138,380), 31.1).
fillpoint(r2, xy(192,380), 31.0).
fillpoint(r2, xy(201,380), 30.0).
fillpoint(r2, xy(118,368), 29.0).
fillpoint(r2, xy(117,365), 28.0).
fillpoint(r2, xy(116,362), 27.0).
fillpoint(r2, xy(115,358), 26.0).
fillpoint(r2, xy(115,326), 25.0).
fillpoint(r2, xy(134,285), 16.0).
fillpoint(r2, xy(224,404), 16.0).
fillpoint(r2, xy(194,434), 16.0).
fillpoint(r2, xy(141,285), 15.0).
fillpoint(r2, xy(195,289), 11.0).
region(r4, '#2ecc40', 9300, centroid(310,440)).
perimeter(r4, 840).
polygon(r4, [xy(339,570),xy(270,569),xy(270,480),xy(290,479),xy(290,320),xy(299,320),xy(300,329),xy(309,330),xy(310,340),xy(320,340),xy(320,359),xy(329,360),xy(330,369),xy(340,370),xy(340,479),xy(360,480),xy(360,509),xy(350,509),xy(349,490),xy(280,490),xy(280,559),xy(339,560),xy(339,570)]).
midline(r4, [xy(275,511),xy(275,564),xy(335,565)]).
midline(r4, [xy(275,510),xy(275,485),xy(295,483),xy(315,464),xy(315,390),xy(305,366),xy(305,354),xy(300,345),xy(300,339),xy(295,333),xy(295,324)]).
midline(r4, [xy(315,465),xy(334,483),xy(354,485),xy(355,505)]).
midline(r4, [xy(316,389),xy(317,390)]).
fillpoint(r4, xy(315,427), 25.0).
fillpoint(r4, xy(305,365), 16.0).
fillpoint(r4, xy(304,356), 15.0).
fillpoint(r4, xy(300,344), 11.0).
region(r17, '#aaaaaa', 8400, centroid(54,585)).
perimeter(r17, 760).
polygon(r17, [xy(0,600),xy(10,599),xy(10,530),xy(109,530),xy(110,629),xy(50,630),xy(50,639)]).
hole(r17, [xy(90,609),xy(89,550),xy(30,550),xy(30,570),xy(70,570),xy(70,610),xy(90,609)]).
hole(r17, [xy(50,609),xy(49,590),xy(30,590),xy(30,610),xy(50,609)]).
midline(r17, [xy(15,613),xy(17,622),xy(30,625),xy(60,616),xy(60,590),xy(57,581),xy(49,579),xy(22,579),xy(19,569),xy(21,541),xy(30,539),xy(89,539),xy(98,541),xy(100,550),xy(99,615),xy(95,619),xy(88,620),xy(70,620),xy(61,617)]).
midline(r17, [xy(15,612),xy(19,605),xy(19,591),xy(22,581)]).
fillpoint(r17, xy(17,622), 18.0).
fillpoint(r17, xy(15,615), 16.0).
fillpoint(r17, xy(24,624), 16.0).
fillpoint(r17, xy(36,624), 15.0).
fillpoint(r17, xy(22,580), 12.8).
fillpoint(r17, xy(60,617), 12.8).
fillpoint(r17, xy(22,541), 12.0).
fillpoint(r17, xy(98,541), 12.0).
fillpoint(r17, xy(58,581), 12.0).
fillpoint(r17, xy(97,618), 12.0).
fillpoint(r17, xy(25,540), 11.0).
fillpoint(r17, xy(94,540), 11.0).
fillpoint(r17, xy(20,545), 11.0).
fillpoint(r17, xy(99,545), 11.0).
fillpoint(r17, xy(20,574), 11.0).
fillpoint(r17, xy(54,580), 11.0).
fillpoint(r17, xy(20,585), 11.0).
fillpoint(r17, xy(59,585), 11.0).
fillpoint(r17, xy(19,604), 11.0).
fillpoint(r17, xy(99,614), 11.0).
fillpoint(r17, xy(54,619), 11.0).
fillpoint(r17, xy(65,619), 11.0).
fillpoint(r17, xy(94,619), 11.0).
fillpoint(r17, xy(45,620), 11.0).
fillpoint(r17, xy(31,540), 10.0).
fillpoint(r17, xy(19,560), 10.0).
fillpoint(r17, xy(99,580), 10.0).
fillpoint(r17, xy(31,580), 10.0).
fillpoint(r17, xy(19,595), 10.0).
fillpoint(r17, xy(59,600), 10.0).
fillpoint(r17, xy(71,620), 10.0).
border(r17).
region(r20, '#5a5a5a', 8400, centroid(340,620)).
perimeter(r20, 880).
polygon(r20, [xy(549,630),xy(130,630),xy(130,610),xy(549,610),xy(549,630)]).
midline(r20, [xy(425,619),xy(139,620)]).
midline(r20, [xy(426,619),xy(540,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r18, '#7fdbff', 2000, centroid(68,572)).
perimeter(r18, 240).
polygon(r18, [xy(89,610),xy(70,609),xy(69,570),xy(30,569),xy(30,550),xy(90,550),xy(89,610)]).
midline(r18, [xy(80,587),xy(80,600)]).
midline(r18, [xy(80,586),xy(80,570),xy(77,561),xy(67,559),xy(39,560)]).
fillpoint(r18, xy(78,561), 12.0).
fillpoint(r18, xy(74,560), 11.0).
fillpoint(r18, xy(79,565), 11.0).
fillpoint(r18, xy(39,560), 10.0).
fillpoint(r18, xy(79,586), 10.0).
region(r14, '#870c25', 1500, centroid(164,484)).
perimeter(r14, 160).
polygon(r14, [xy(189,500),xy(140,500),xy(140,470),xy(189,470),xy(189,500)]).
midline(r14, [xy(160,485),xy(154,485)]).
midline(r14, [xy(161,484),xy(175,485)]).
fillpoint(r14, xy(154,485), 15.0).
region(r5, '#ffdc00', 1400, centroid(348,442)).
perimeter(r5, 220).
polygon(r5, [xy(359,480),xy(340,479),xy(340,390),xy(350,390),xy(350,429),xy(360,430),xy(359,480)]).
midline(r5, [xy(345,407),xy(345,394)]).
midline(r5, [xy(345,408),xy(344,429),xy(350,439),xy(350,470)]).
fillpoint(r5, xy(349,455), 10.0).
fillpoint(r5, xy(345,411), 5.0).
region(r13, '#bebebe', 1000, centroid(164,460)).
perimeter(r13, 140).
polygon(r13, [xy(189,470),xy(140,470),xy(140,450),xy(189,450),xy(189,470)]).
midline(r13, [xy(159,460),xy(149,460)]).
midline(r13, [xy(160,460),xy(180,460)]).
fillpoint(r13, xy(149,460), 10.0).
region(r15, '#7fdbff', 500, centroid(312,526)).
perimeter(r15, 120).
polygon(r15, [xy(329,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r15, [xy(305,521),xy(305,514)]).
midline(r15, [xy(305,522),xy(305,524),xy(314,525),xy(315,534),xy(325,535)]).
fillpoint(r15, xy(305,524), 6.0).
fillpoint(r15, xy(314,525), 6.0).
fillpoint(r15, xy(315,534), 6.0).
fillpoint(r15, xy(305,516), 5.0).
fillpoint(r15, xy(321,535), 5.0).
region(r19, '#7fdbff', 400, centroid(40,600)).
perimeter(r19, 80).
polygon(r19, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r19, [xy(39,599),xy(40,600)]).
fillpoint(r19, xy(39,600), 10.0).
region(r21, '#7fdbff', 400, centroid(570,620)).
perimeter(r21, 80).
polygon(r21, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r21, [xy(569,619),xy(570,620)]).
fillpoint(r21, xy(569,620), 10.0).
region(r22, '#7fdbff', 400, centroid(600,620)).
perimeter(r22, 80).
polygon(r22, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r22, [xy(599,619),xy(600,620)]).
fillpoint(r22, xy(599,620), 10.0).
region(r23, '#2ecc40', 400, centroid(630,620)).
perimeter(r23, 80).
polygon(r23, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r23, [xy(629,619),xy(630,620)]).
fillpoint(r23, xy(629,620), 10.0).
border(r23).
region(r11, '#000000', 300, centroid(218,428)).
perimeter(r11, 80).
polygon(r11, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r11, [xy(215,431),xy(215,425),xy(225,425)]).
midline(r11, [xy(215,432),xy(215,435)]).
fillpoint(r11, xy(216,425), 6.0).
fillpoint(r11, xy(221,425), 5.0).
fillpoint(r11, xy(215,433), 5.0).
region(r8, '#000000', 100, centroid(204,414)).
perimeter(r8, 40).
polygon(r8, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r8, [xy(205,415),xy(205,414)]).
fillpoint(r8, xy(204,415), 5.0).
region(r16, '#7fdbff', 100, centroid(324,514)).
perimeter(r16, 40).
polygon(r16, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r16, [xy(325,515),xy(325,514)]).
fillpoint(r16, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 210).
adjacent(r1, r3).
shared_edge(r1, r3, 660).
adjacent(r1, r4).
shared_edge(r1, r4, 400).
adjacent(r1, r5).
shared_edge(r1, r5, 110).
adjacent(r1, r15).
shared_edge(r1, r15, 120).
adjacent(r1, r16).
shared_edge(r1, r16, 40).
adjacent(r1, r20).
shared_edge(r1, r20, 880).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 640).
adjacent(r2, r8).
shared_edge(r2, r8, 40).
adjacent(r2, r11).
shared_edge(r2, r11, 80).
adjacent(r2, r13).
shared_edge(r2, r13, 50).
adjacent(r3, r4).
shared_edge(r3, r4, 330).
adjacent(r3, r13).
shared_edge(r3, r13, 40).
adjacent(r3, r14).
shared_edge(r3, r14, 110).
adjacent(r3, r17).
shared_edge(r3, r17, 350).
adjacent(r4, r5).
shared_edge(r4, r5, 110).
adjacent(r13, r14).
shared_edge(r13, r14, 50).
adjacent(r17, r18).
shared_edge(r17, r18, 240).
adjacent(r17, r19).
shared_edge(r17, r19, 80).

encloses(r2, r8).
encloses(r2, r11).
encloses(r1, r15).
encloses(r1, r16).
encloses(r17, r18).
encloses(r17, r19).
encloses(r1, r20).
encloses(r1, r21).
encloses(r1, r22).
