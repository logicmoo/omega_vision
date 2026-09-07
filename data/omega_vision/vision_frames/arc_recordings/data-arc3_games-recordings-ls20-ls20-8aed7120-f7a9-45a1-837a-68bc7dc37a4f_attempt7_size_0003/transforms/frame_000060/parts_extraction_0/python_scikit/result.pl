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

region(r1, '#aaaaaa', 298700, centroid(364,279)).
perimeter(r1, 5620).
polygon(r1, [xy(0,550),xy(10,549),xy(10,530),xy(109,530),xy(110,610),xy(119,610),xy(120,600),xy(259,600),xy(260,590),xy(269,590),xy(270,580),xy(289,580),xy(290,570),xy(300,569),xy(300,560),xy(280,559),xy(280,490),xy(349,490),xy(350,460),xy(360,459),xy(360,380),xy(350,379),xy(350,340),xy(340,339),xy(340,320),xy(330,320),xy(330,310),xy(320,309),xy(320,290),xy(310,290),xy(310,280),xy(300,280),xy(300,270),xy(290,270),xy(289,260),xy(270,260),xy(270,250),xy(260,249),xy(259,240),xy(240,240),xy(239,230),xy(200,230),xy(199,220),xy(120,220),xy(119,230),xy(80,230),xy(79,240),xy(60,240),xy(60,249),xy(50,250),xy(50,259),xy(40,260),xy(40,519),xy(0,520)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(89,550),xy(30,550),xy(30,570),xy(70,570),xy(70,610),xy(90,609)]).
hole(r1, [xy(320,539),xy(320,520),xy(329,520),xy(330,510),xy(320,510),xy(320,519),xy(310,520),xy(310,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(320,539)]).
hole(r1, [xy(50,609),xy(49,590),xy(30,590),xy(30,610),xy(50,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(399,347),xy(395,347),xy(391,351),xy(379,355),xy(371,361),xy(369,360),xy(367,362),xy(369,362)]).
midline(r1, [xy(390,352),xy(389,353)]).
midline(r1, [xy(395,349),xy(399,349),xy(401,345),xy(402,348)]).
midline(r1, [xy(404,348),xy(408,343),xy(413,344),xy(406,347)]).
midline(r1, [xy(414,344),xy(419,341),xy(422,342),xy(418,344)]).
midline(r1, [xy(423,341),xy(426,341),xy(488,279),xy(477,232),xy(469,213),xy(467,199),xy(459,178),xy(383,146),xy(328,129),xy(276,117),xy(199,109),xy(110,110),xy(96,126),xy(77,154),xy(68,162),xy(56,178),xy(34,216),xy(20,252),xy(20,500)]).
midline(r1, [xy(272,119),xy(238,153),xy(234,171),xy(230,177),xy(224,198),xy(217,209),xy(219,209)]).
midline(r1, [xy(237,162),xy(279,120)]).
midline(r1, [xy(231,180),xy(232,177)]).
midline(r1, [xy(74,157),xy(81,164),xy(83,162),xy(77,156),xy(81,156),xy(79,153)]).
midline(r1, [xy(83,160),xy(81,158),xy(83,158)]).
midline(r1, [xy(81,151),xy(82,154)]).
midline(r1, [xy(238,158),xy(277,119)]).
midline(r1, [xy(488,281),xy(499,357),xy(499,469),xy(479,487),xy(429,523),xy(392,487),xy(383,485),xy(376,480),xy(379,485)]).
midline(r1, [xy(500,470),xy(555,525),xy(555,632),xy(553,634),xy(130,635),xy(124,633),xy(114,624),xy(103,624),xy(99,621),xy(100,550),xy(97,541),xy(87,539),xy(30,539),xy(21,541),xy(19,555),xy(14,564),xy(17,579),xy(14,590),xy(14,609),xy(17,622),xy(32,625),xy(58,623),xy(60,621),xy(60,591),xy(58,582),xy(48,579),xy(18,580)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,632),xy(578,635),xy(555,633)]).
midline(r1, [xy(99,623),xy(87,625),xy(60,623)]).
midline(r1, [xy(427,524),xy(387,545),xy(360,518),xy(335,500),xy(294,500),xy(291,501),xy(289,511),xy(290,535),xy(296,545),xy(313,554),xy(334,574),xy(327,580),xy(302,592),xy(289,595),xy(284,594),xy(258,605),xy(125,605),xy(123,615),xy(115,624)]).
midline(r1, [xy(360,520),xy(386,546),xy(363,560),xy(340,537),xy(334,534),xy(315,515),xy(314,515),xy(314,502)]).
midline(r1, [xy(382,486),xy(381,485)]).
midline(r1, [xy(335,573),xy(350,568),xy(362,561)]).
midline(r1, [xy(586,556),xy(616,586),xy(614,589),xy(615,632),xy(608,635),xy(585,633)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(96,201),xy(98,205),xy(99,203),xy(92,192),xy(93,189),xy(88,183),xy(87,173),xy(82,166),xy(84,163),xy(86,169)]).
midline(r1, [xy(100,205),xy(98,207),xy(102,209)]).
fillpoint(r1, xy(460,179), 179.4).
fillpoint(r1, xy(461,181), 179.0).
fillpoint(r1, xy(462,184), 178.0).
fillpoint(r1, xy(463,187), 177.0).
fillpoint(r1, xy(464,190), 176.0).
fillpoint(r1, xy(467,200), 173.0).
fillpoint(r1, xy(468,204), 172.0).
fillpoint(r1, xy(470,211), 170.0).
fillpoint(r1, xy(477,233), 163.0).
fillpoint(r1, xy(479,240), 161.0).
fillpoint(r1, xy(480,244), 160.0).
fillpoint(r1, xy(481,248), 159.0).
fillpoint(r1, xy(482,252), 158.0).
fillpoint(r1, xy(483,257), 157.0).
fillpoint(r1, xy(484,261), 156.0).
fillpoint(r1, xy(485,265), 155.0).
fillpoint(r1, xy(486,269), 154.0).
fillpoint(r1, xy(487,273), 153.0).
fillpoint(r1, xy(488,278), 152.0).
fillpoint(r1, xy(489,283), 151.0).
fillpoint(r1, xy(490,288), 150.0).
fillpoint(r1, xy(491,294), 149.0).
fillpoint(r1, xy(492,301), 148.0).
fillpoint(r1, xy(382,146), 147.0).
fillpoint(r1, xy(493,309), 147.0).
fillpoint(r1, xy(379,145), 146.0).
fillpoint(r1, xy(494,320), 146.0).
fillpoint(r1, xy(376,144), 145.0).
fillpoint(r1, xy(495,329), 145.0).
fillpoint(r1, xy(373,143), 144.0).
fillpoint(r1, xy(496,335), 144.0).
fillpoint(r1, xy(370,142), 143.0).
fillpoint(r1, xy(497,342), 143.0).
fillpoint(r1, xy(498,349), 142.0).
fillpoint(r1, xy(499,361), 141.0).
fillpoint(r1, xy(499,469), 140.4).
fillpoint(r1, xy(360,139), 140.0).
fillpoint(r1, xy(499,420), 140.0).
fillpoint(r1, xy(356,138), 139.0).
fillpoint(r1, xy(352,137), 138.0).
fillpoint(r1, xy(327,129), 130.0).
fillpoint(r1, xy(315,126), 127.0).
fillpoint(r1, xy(311,125), 126.0).
fillpoint(r1, xy(306,124), 125.0).
fillpoint(r1, xy(302,123), 124.0).
fillpoint(r1, xy(298,122), 123.0).
fillpoint(r1, xy(294,121), 122.0).
fillpoint(r1, xy(290,120), 121.0).
fillpoint(r1, xy(285,119), 120.0).
fillpoint(r1, xy(280,118), 119.0).
fillpoint(r1, xy(274,117), 118.0).
fillpoint(r1, xy(267,116), 117.0).
fillpoint(r1, xy(257,115), 116.0).
fillpoint(r1, xy(244,114), 115.0).
fillpoint(r1, xy(239,113), 114.0).
fillpoint(r1, xy(234,112), 113.0).
fillpoint(r1, xy(226,111), 112.0).
fillpoint(r1, xy(216,110), 111.0).
fillpoint(r1, xy(110,110), 110.5).
fillpoint(r1, xy(121,110), 110.0).
border(r1).
region(r4, '#ffdc00', 51300, centroid(163,445)).
perimeter(r4, 2020).
polygon(r4, [xy(0,520),xy(40,519),xy(40,260),xy(49,260),xy(50,250),xy(59,250),xy(60,240),xy(79,240),xy(80,230),xy(90,230),xy(90,449),xy(139,450),xy(140,500),xy(189,500),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(290,479),xy(270,480),xy(270,569),xy(289,570),xy(289,580),xy(270,580),xy(270,589),xy(260,590),xy(259,600),xy(120,600),xy(119,610),xy(110,610),xy(109,530),xy(10,530),xy(10,549),xy(0,550)]).
midline(r4, [xy(36,525),xy(5,525),xy(5,545)]).
midline(r4, [xy(37,524),xy(43,524),xy(49,520),xy(80,489),xy(68,469),xy(64,449),xy(64,279),xy(74,254),xy(84,243),xy(85,234)]).
midline(r4, [xy(81,489),xy(100,489),xy(159,549),xy(116,594),xy(115,605)]).
midline(r4, [xy(160,550),xy(203,549),xy(216,545),xy(235,565),xy(242,566),xy(243,569),xy(256,576),xy(258,574),xy(285,575)]).
midline(r4, [xy(217,544),xy(228,516),xy(229,489),xy(264,455),xy(265,351),xy(263,336),xy(259,328),xy(249,325),xy(164,325)]).
fillpoint(r4, xy(216,546), 54.0).
fillpoint(r4, xy(212,547), 53.0).
fillpoint(r4, xy(208,548), 52.0).
fillpoint(r4, xy(201,549), 51.0).
fillpoint(r4, xy(159,550), 50.0).
fillpoint(r4, xy(225,526), 45.0).
fillpoint(r4, xy(226,523), 44.0).
fillpoint(r4, xy(228,515), 42.0).
fillpoint(r4, xy(81,489), 41.0).
fillpoint(r4, xy(229,509), 41.0).
fillpoint(r4, xy(91,490), 40.0).
fillpoint(r4, xy(229,494), 40.0).
fillpoint(r4, xy(260,329), 29.7).
fillpoint(r4, xy(258,328), 29.0).
fillpoint(r4, xy(261,331), 29.0).
fillpoint(r4, xy(68,468), 29.0).
fillpoint(r4, xy(255,327), 28.0).
fillpoint(r4, xy(262,334), 28.0).
fillpoint(r4, xy(67,465), 28.0).
fillpoint(r4, xy(252,326), 27.0).
fillpoint(r4, xy(263,337), 27.0).
fillpoint(r4, xy(66,462), 27.0).
fillpoint(r4, xy(248,325), 26.0).
fillpoint(r4, xy(264,342), 26.0).
fillpoint(r4, xy(65,458), 26.0).
fillpoint(r4, xy(264,455), 25.7).
fillpoint(r4, xy(64,364), 25.0).
fillpoint(r4, xy(164,325), 25.0).
fillpoint(r4, xy(264,400), 25.0).
fillpoint(r4, xy(74,255), 16.0).
border(r4).
region(r2, '#2ecc40', 35900, centroid(212,354)).
perimeter(r2, 2160).
polygon(r2, [xy(299,570),xy(270,569),xy(270,480),xy(290,479),xy(290,300),xy(140,300),xy(140,350),xy(240,350),xy(240,449),xy(190,450),xy(190,400),xy(140,400),xy(140,449),xy(90,450),xy(90,230),xy(119,230),xy(120,220),xy(139,220),xy(140,250),xy(269,250),xy(270,260),xy(289,260),xy(290,269),xy(299,270),xy(300,279),xy(309,280),xy(310,289),xy(320,290),xy(320,309),xy(329,310),xy(330,320),xy(340,320),xy(340,339),xy(350,340),xy(350,349),xy(340,350),xy(340,479),xy(349,480),xy(350,489),xy(280,490),xy(280,559),xy(299,560),xy(299,570)]).
hole(r2, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
hole(r2, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r2, [xy(230,440),xy(223,444),xy(212,445),xy(206,444),xy(199,439),xy(200,429),xy(195,423),xy(194,410),xy(196,404),xy(212,383),xy(209,378),xy(189,374),xy(123,375),xy(119,371),xy(114,349),xy(114,300),xy(116,286),xy(121,274),xy(114,254),xy(125,243),xy(130,229)]).
midline(r2, [xy(121,375),xy(119,380),xy(95,406),xy(95,444),xy(129,445),xy(134,443),xy(134,406),xy(118,383)]).
midline(r2, [xy(122,274),xy(250,274),xy(262,279),xy(272,279),xy(298,291),xy(305,304),xy(305,316),xy(316,342),xy(314,350),xy(315,463),xy(295,483),xy(275,485),xy(274,490),xy(275,564),xy(295,565)]).
midline(r2, [xy(230,438),xy(234,433),xy(234,416),xy(224,404),xy(220,393),xy(213,384)]).
midline(r2, [xy(315,465),xy(334,483),xy(345,485)]).
midline(r2, [xy(201,428),xy(224,405)]).
midline(r2, [xy(317,345),xy(345,345)]).
fillpoint(r2, xy(121,275), 31.4).
fillpoint(r2, xy(121,375), 31.4).
fillpoint(r2, xy(210,379), 29.7).
fillpoint(r2, xy(118,268), 29.0).
fillpoint(r2, xy(118,281), 29.0).
fillpoint(r2, xy(118,368), 29.0).
fillpoint(r2, xy(208,378), 29.0).
fillpoint(r2, xy(118,381), 29.0).
fillpoint(r2, xy(211,381), 29.0).
fillpoint(r2, xy(117,265), 28.0).
fillpoint(r2, xy(117,284), 28.0).
fillpoint(r2, xy(117,365), 28.0).
fillpoint(r2, xy(205,377), 28.0).
fillpoint(r2, xy(116,262), 27.0).
fillpoint(r2, xy(116,287), 27.0).
fillpoint(r2, xy(116,362), 27.0).
fillpoint(r2, xy(202,376), 27.0).
fillpoint(r2, xy(115,258), 26.0).
fillpoint(r2, xy(115,292), 26.0).
fillpoint(r2, xy(115,358), 26.0).
fillpoint(r2, xy(198,375), 26.0).
fillpoint(r2, xy(315,345), 25.5).
fillpoint(r2, xy(141,275), 25.0).
fillpoint(r2, xy(114,325), 25.0).
fillpoint(r2, xy(315,408), 25.0).
fillpoint(r2, xy(141,375), 25.0).
fillpoint(r2, xy(263,279), 21.0).
fillpoint(r2, xy(271,280), 20.0).
fillpoint(r2, xy(284,284), 16.0).
fillpoint(r2, xy(305,315), 16.0).
fillpoint(r2, xy(224,404), 16.0).
fillpoint(r2, xy(304,306), 15.0).
fillpoint(r2, xy(298,291), 12.2).
fillpoint(r2, xy(129,234), 11.0).
fillpoint(r2, xy(199,435), 10.0).
fillpoint(r2, xy(229,440), 10.0).
region(r22, '#5a5a5a', 8000, centroid(350,620)).
perimeter(r22, 840).
polygon(r22, [xy(549,630),xy(150,630),xy(150,610),xy(549,610),xy(549,630)]).
midline(r22, [xy(324,619),xy(159,620)]).
midline(r22, [xy(325,619),xy(540,620)]).
fillpoint(r22, xy(159,620), 10.0).
region(r3, '#ffdc00', 2800, centroid(190,237)).
perimeter(r3, 300).
polygon(r3, [xy(259,250),xy(140,250),xy(140,220),xy(199,220),xy(200,230),xy(239,230),xy(240,240),xy(259,240),xy(259,250)]).
midline(r3, [xy(252,245),xy(236,244),xy(230,239),xy(200,240),xy(185,234),xy(154,235)]).
midline(r3, [xy(253,245),xy(255,245)]).
fillpoint(r3, xy(154,235), 15.0).
fillpoint(r3, xy(195,239), 11.0).
fillpoint(r3, xy(201,240), 10.0).
fillpoint(r3, xy(241,245), 5.0).
region(r16, '#2ecc40', 2500, centroid(164,474)).
perimeter(r16, 200).
polygon(r16, [xy(189,500),xy(140,499),xy(140,450),xy(190,450),xy(189,500)]).
midline(r16, [xy(164,475),xy(165,475)]).
fillpoint(r16, xy(164,475), 25.0).
region(r6, '#ffdc00', 2000, centroid(348,420)).
perimeter(r6, 280).
polygon(r6, [xy(349,480),xy(340,479),xy(340,360),xy(350,360),xy(350,379),xy(360,380),xy(360,459),xy(350,460),xy(349,480)]).
midline(r6, [xy(350,450),xy(350,389),xy(345,383),xy(345,364)]).
midline(r6, [xy(349,451),xy(344,460),xy(345,475)]).
fillpoint(r6, xy(349,420), 10.0).
fillpoint(r6, xy(345,371), 5.0).
fillpoint(r6, xy(345,468), 5.0).
region(r19, '#7fdbff', 2000, centroid(68,572)).
perimeter(r19, 240).
polygon(r19, [xy(89,610),xy(70,609),xy(69,570),xy(30,569),xy(30,550),xy(90,550),xy(89,610)]).
midline(r19, [xy(80,587),xy(80,571),xy(77,561),xy(69,559),xy(39,560)]).
midline(r19, [xy(79,588),xy(80,600)]).
fillpoint(r19, xy(78,561), 12.0).
fillpoint(r19, xy(74,560), 11.0).
fillpoint(r19, xy(79,565), 11.0).
fillpoint(r19, xy(39,560), 10.0).
fillpoint(r19, xy(79,586), 10.0).
region(r13, '#870c25', 1500, centroid(164,434)).
perimeter(r13, 160).
polygon(r13, [xy(189,450),xy(140,450),xy(140,420),xy(189,420),xy(189,450)]).
midline(r13, [xy(160,435),xy(154,435)]).
midline(r13, [xy(161,435),xy(175,435)]).
fillpoint(r13, xy(154,435), 15.0).
region(r7, '#bebebe', 1000, centroid(164,410)).
perimeter(r7, 140).
polygon(r7, [xy(189,420),xy(140,420),xy(140,400),xy(189,400),xy(189,420)]).
midline(r7, [xy(160,409),xy(149,410)]).
midline(r7, [xy(161,410),xy(180,410)]).
fillpoint(r7, xy(149,410), 10.0).
region(r17, '#7fdbff', 400, centroid(310,524)).
perimeter(r17, 100).
polygon(r17, [xy(319,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(320,520),xy(319,540)]).
midline(r17, [xy(305,521),xy(305,514)]).
midline(r17, [xy(305,522),xy(305,524),xy(314,525),xy(315,535)]).
fillpoint(r17, xy(305,524), 6.0).
fillpoint(r17, xy(314,525), 6.0).
fillpoint(r17, xy(305,516), 5.0).
fillpoint(r17, xy(315,533), 5.0).
region(r20, '#7fdbff', 400, centroid(40,600)).
perimeter(r20, 80).
polygon(r20, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r20, [xy(39,599),xy(40,600)]).
fillpoint(r20, xy(39,600), 10.0).
region(r21, '#2ecc40', 400, centroid(140,620)).
perimeter(r21, 80).
polygon(r21, [xy(149,630),xy(130,629),xy(130,610),xy(150,610),xy(149,630)]).
midline(r21, [xy(139,619),xy(140,620)]).
fillpoint(r21, xy(139,620), 10.0).
region(r23, '#7fdbff', 400, centroid(570,620)).
perimeter(r23, 80).
polygon(r23, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r23, [xy(569,619),xy(570,620)]).
fillpoint(r23, xy(569,620), 10.0).
region(r24, '#7fdbff', 400, centroid(600,620)).
perimeter(r24, 80).
polygon(r24, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r24, [xy(599,619),xy(600,620)]).
fillpoint(r24, xy(599,620), 10.0).
region(r25, '#2ecc40', 400, centroid(630,620)).
perimeter(r25, 80).
polygon(r25, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r25, [xy(629,619),xy(630,620)]).
fillpoint(r25, xy(629,620), 10.0).
border(r25).
region(r14, '#000000', 300, centroid(218,428)).
perimeter(r14, 80).
polygon(r14, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r14, [xy(214,434),xy(215,425),xy(225,425)]).
midline(r14, [xy(214,435),xy(215,435)]).
fillpoint(r14, xy(216,425), 6.0).
fillpoint(r14, xy(221,425), 5.0).
fillpoint(r14, xy(215,433), 5.0).
region(r10, '#000000', 100, centroid(204,414)).
perimeter(r10, 40).
polygon(r10, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r10, [xy(205,415),xy(205,414)]).
fillpoint(r10, xy(204,415), 5.0).
region(r18, '#7fdbff', 100, centroid(324,514)).
perimeter(r18, 40).
polygon(r18, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r18, [xy(325,515),xy(325,514)]).
fillpoint(r18, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 440).
adjacent(r1, r3).
shared_edge(r1, r3, 150).
adjacent(r1, r4).
shared_edge(r1, r4, 810).
adjacent(r1, r6).
shared_edge(r1, r6, 140).
adjacent(r1, r17).
shared_edge(r1, r17, 100).
adjacent(r1, r18).
shared_edge(r1, r18, 40).
adjacent(r1, r19).
shared_edge(r1, r19, 240).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 60).
adjacent(r1, r22).
shared_edge(r1, r22, 820).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 80).
adjacent(r1, r25).
shared_edge(r1, r25, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 150).
adjacent(r2, r4).
shared_edge(r2, r4, 1030).
adjacent(r2, r6).
shared_edge(r2, r6, 130).
adjacent(r2, r7).
shared_edge(r2, r7, 90).
adjacent(r2, r10).
shared_edge(r2, r10, 40).
adjacent(r2, r13).
shared_edge(r2, r13, 60).
adjacent(r2, r14).
shared_edge(r2, r14, 80).
adjacent(r4, r16).
shared_edge(r4, r16, 150).
adjacent(r7, r13).
shared_edge(r7, r13, 50).
adjacent(r13, r16).
shared_edge(r13, r16, 50).
adjacent(r21, r22).
shared_edge(r21, r22, 20).

encloses(r2, r10).
encloses(r2, r14).
encloses(r1, r17).
encloses(r1, r18).
encloses(r1, r19).
encloses(r1, r20).
encloses(r1, r23).
encloses(r1, r24).
