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

region(r1, '#aaaaaa', 291700, centroid(369,291)).
perimeter(r1, 5420).
polygon(r1, [xy(200,569),xy(200,560),xy(239,560),xy(240,550),xy(259,550),xy(260,540),xy(269,540),xy(270,530),xy(280,529),xy(280,490),xy(319,490),xy(320,480),xy(329,480),xy(330,470),xy(340,469),xy(340,450),xy(350,449),xy(350,410),xy(360,409),xy(360,330),xy(350,329),xy(350,290),xy(340,289),xy(340,270),xy(330,270),xy(329,260),xy(320,259),xy(320,240),xy(310,240),xy(310,230),xy(300,230),xy(300,220),xy(290,219),xy(289,210),xy(270,210),xy(270,200),xy(260,199),xy(259,190),xy(240,190),xy(239,180),xy(200,180),xy(199,170),xy(120,170),xy(119,180),xy(80,180),xy(79,190),xy(60,190),xy(60,199),xy(50,200),xy(50,209),xy(40,210),xy(40,519),xy(30,520),xy(30,529),xy(109,530),xy(110,559),xy(119,560),xy(120,570),xy(200,569)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(90,549),xy(75,540),xy(68,539),xy(18,540),xy(15,536),xy(14,528),xy(15,513),xy(20,502),xy(20,202),xy(40,154),xy(68,112),xy(77,103),xy(80,107),xy(82,105),xy(78,102)]).
midline(r1, [xy(82,103),xy(80,101),xy(87,87)]).
midline(r1, [xy(89,87),xy(122,84),xy(199,84),xy(248,90),xy(237,103),xy(238,109),xy(234,114),xy(232,128),xy(229,131),xy(230,136),xy(221,151),xy(225,147)]).
midline(r1, [xy(90,551),xy(98,561),xy(109,586),xy(114,592),xy(110,602),xy(109,617),xy(102,622),xy(89,625),xy(70,625),xy(60,622),xy(49,625),xy(23,624),xy(17,621),xy(14,609),xy(14,590),xy(17,580),xy(14,564),xy(16,540)]).
midline(r1, [xy(60,621),xy(60,600),xy(40,580),xy(18,580)]).
midline(r1, [xy(115,592),xy(136,589),xy(198,590),xy(211,588),xy(220,583),xy(220,585)]).
midline(r1, [xy(222,585),xy(239,585),xy(259,581),xy(264,578),xy(259,571),xy(265,579)]).
midline(r1, [xy(267,579),xy(283,575),xy(290,570),xy(295,570),xy(319,560),xy(337,547),xy(353,545),xy(399,527),xy(429,511),xy(462,489),xy(420,447),xy(412,444),xy(409,445),xy(405,441),xy(401,442),xy(398,439),xy(398,441)]).
midline(r1, [xy(463,489),xy(464,487),xy(421,446)]).
midline(r1, [xy(403,443),xy(405,443)]).
midline(r1, [xy(412,446),xy(410,446)]).
midline(r1, [xy(465,487),xy(467,486),xy(426,447)]).
midline(r1, [xy(468,485),xy(494,464),xy(499,432),xy(499,307),xy(489,234),xy(487,232),xy(428,291),xy(426,290),xy(422,293),xy(416,291),xy(412,295),xy(405,292),xy(394,301),xy(390,303),xy(385,301),xy(382,306),xy(385,303)]).
midline(r1, [xy(415,294),xy(418,294)]).
midline(r1, [xy(430,291),xy(487,234)]).
midline(r1, [xy(405,294),xy(404,298),xy(401,296),xy(396,301)]).
midline(r1, [xy(489,232),xy(487,229),xy(427,289)]).
midline(r1, [xy(488,228),xy(477,182),xy(470,166),xy(424,142),xy(368,119),xy(302,99),xy(271,92),xy(250,90)]).
midline(r1, [xy(407,297),xy(411,296)]).
midline(r1, [xy(495,465),xy(555,526),xy(555,630),xy(553,634),xy(131,635),xy(124,633),xy(109,619)]).
midline(r1, [xy(556,526),xy(586,556),xy(584,558),xy(585,631),xy(579,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(401,298),xy(400,299)]).
midline(r1, [xy(227,147),xy(227,143),xy(231,139)]).
midline(r1, [xy(587,557),xy(615,585),xy(615,631),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(237,113),xy(236,115)]).
midline(r1, [xy(252,92),xy(239,105)]).
midline(r1, [xy(234,121),xy(236,127),xy(233,127)]).
midline(r1, [xy(237,126),xy(268,94)]).
midline(r1, [xy(237,128),xy(231,133)]).
midline(r1, [xy(233,132),xy(233,137)]).
midline(r1, [xy(235,132),xy(236,131)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(86,129),xy(84,124),xy(86,119),xy(81,112),xy(81,108),xy(83,108)]).
midline(r1, [xy(86,130),xy(90,133),xy(87,122)]).
midline(r1, [xy(83,110),xy(83,112)]).
midline(r1, [xy(93,145),xy(94,142),xy(89,137),xy(90,135),xy(93,139)]).
midline(r1, [xy(95,145),xy(94,146)]).
fillpoint(r1, xy(472,167), 168.0).
fillpoint(r1, xy(477,183), 163.0).
fillpoint(r1, xy(479,190), 161.0).
fillpoint(r1, xy(480,194), 160.0).
fillpoint(r1, xy(481,198), 159.0).
fillpoint(r1, xy(482,202), 158.0).
fillpoint(r1, xy(483,207), 157.0).
fillpoint(r1, xy(484,211), 156.0).
fillpoint(r1, xy(485,215), 155.0).
fillpoint(r1, xy(486,219), 154.0).
fillpoint(r1, xy(487,223), 153.0).
fillpoint(r1, xy(488,228), 152.0).
fillpoint(r1, xy(489,233), 151.0).
fillpoint(r1, xy(490,238), 150.0).
fillpoint(r1, xy(491,244), 149.0).
fillpoint(r1, xy(492,251), 148.0).
fillpoint(r1, xy(493,259), 147.0).
fillpoint(r1, xy(494,270), 146.0).
fillpoint(r1, xy(494,464), 145.8).
fillpoint(r1, xy(495,279), 145.0).
fillpoint(r1, xy(495,460), 145.0).
fillpoint(r1, xy(496,285), 144.0).
fillpoint(r1, xy(496,455), 144.0).
fillpoint(r1, xy(497,292), 143.0).
fillpoint(r1, xy(497,448), 143.0).
fillpoint(r1, xy(498,299), 142.0).
fillpoint(r1, xy(498,440), 142.0).
fillpoint(r1, xy(499,311), 141.0).
fillpoint(r1, xy(499,429), 141.0).
fillpoint(r1, xy(499,370), 140.0).
fillpoint(r1, xy(349,113), 114.0).
fillpoint(r1, xy(342,111), 112.0).
fillpoint(r1, xy(338,110), 111.0).
fillpoint(r1, xy(316,103), 104.0).
fillpoint(r1, xy(313,102), 103.0).
fillpoint(r1, xy(309,101), 102.0).
fillpoint(r1, xy(305,100), 101.0).
fillpoint(r1, xy(301,99), 100.0).
fillpoint(r1, xy(296,98), 99.0).
fillpoint(r1, xy(288,96), 97.0).
fillpoint(r1, xy(284,95), 96.0).
fillpoint(r1, xy(280,94), 95.0).
fillpoint(r1, xy(275,93), 94.0).
fillpoint(r1, xy(270,92), 93.0).
fillpoint(r1, xy(264,91), 92.0).
fillpoint(r1, xy(255,90), 91.0).
fillpoint(r1, xy(239,89), 90.0).
fillpoint(r1, xy(234,88), 89.0).
fillpoint(r1, xy(90,87), 88.0).
fillpoint(r1, xy(229,87), 88.0).
fillpoint(r1, xy(88,88), 88.0).
fillpoint(r1, xy(96,86), 87.0).
fillpoint(r1, xy(223,86), 87.0).
fillpoint(r1, xy(105,85), 86.0).
fillpoint(r1, xy(215,85), 86.0).
fillpoint(r1, xy(121,85), 85.0).
fillpoint(r1, xy(352,545), 65.0).
fillpoint(r1, xy(344,547), 63.0).
fillpoint(r1, xy(339,548), 62.0).
fillpoint(r1, xy(306,565), 45.0).
border(r1).
region(r3, '#ffdc00', 47100, centroid(155,415)).
perimeter(r3, 1900).
polygon(r3, [xy(199,570),xy(120,570),xy(120,560),xy(110,559),xy(109,530),xy(30,529),xy(30,520),xy(40,519),xy(40,210),xy(49,210),xy(50,200),xy(59,200),xy(60,190),xy(79,190),xy(80,180),xy(90,180),xy(90,449),xy(139,450),xy(140,500),xy(189,500),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(290,479),xy(270,480),xy(270,539),xy(260,540),xy(259,550),xy(240,550),xy(239,560),xy(200,560),xy(199,570)]).
midline(r3, [xy(252,467),xy(229,489),xy(229,510),xy(214,525),xy(175,535),xy(145,535),xy(100,490),xy(81,489),xy(72,477),xy(66,463),xy(64,449),xy(64,230),xy(74,204),xy(84,193),xy(85,184)]).
midline(r3, [xy(80,489),xy(45,523),xy(34,525)]).
midline(r3, [xy(211,527),xy(213,529),xy(215,526)]).
midline(r3, [xy(253,466),xy(264,455),xy(265,447),xy(265,350),xy(261,330),xy(249,325),xy(236,324),xy(164,325)]).
midline(r3, [xy(174,536),xy(175,539),xy(173,541),xy(176,544),xy(178,542),xy(176,539)]).
midline(r3, [xy(143,534),xy(134,540),xy(132,539),xy(132,541)]).
midline(r3, [xy(145,536),xy(140,543),xy(141,545),xy(142,543)]).
midline(r3, [xy(179,543),xy(177,545),xy(181,547)]).
midline(r3, [xy(217,532),xy(214,530),xy(216,528),xy(217,531)]).
midline(r3, [xy(218,533),xy(217,536),xy(220,539),xy(219,534)]).
midline(r3, [xy(222,539),xy(221,540)]).
fillpoint(r3, xy(81,489), 41.0).
fillpoint(r3, xy(229,509), 41.0).
fillpoint(r3, xy(91,490), 40.0).
fillpoint(r3, xy(229,494), 40.0).
fillpoint(r3, xy(176,534), 35.0).
fillpoint(r3, xy(203,528), 32.0).
fillpoint(r3, xy(186,531), 32.0).
fillpoint(r3, xy(198,529), 31.1).
fillpoint(r3, xy(191,530), 31.1).
fillpoint(r3, xy(260,329), 29.7).
fillpoint(r3, xy(258,328), 29.0).
fillpoint(r3, xy(261,331), 29.0).
fillpoint(r3, xy(68,468), 29.0).
fillpoint(r3, xy(255,327), 28.0).
fillpoint(r3, xy(262,334), 28.0).
fillpoint(r3, xy(67,465), 28.0).
fillpoint(r3, xy(252,326), 27.0).
fillpoint(r3, xy(263,337), 27.0).
fillpoint(r3, xy(66,462), 27.0).
fillpoint(r3, xy(248,325), 26.0).
fillpoint(r3, xy(264,342), 26.0).
fillpoint(r3, xy(65,458), 26.0).
fillpoint(r3, xy(264,455), 25.7).
fillpoint(r3, xy(64,339), 25.0).
fillpoint(r3, xy(164,325), 25.0).
fillpoint(r3, xy(264,400), 25.0).
fillpoint(r3, xy(74,205), 16.0).
region(r2, '#2ecc40', 45800, centroid(208,336)).
perimeter(r2, 2500).
polygon(r2, [xy(279,530),xy(270,529),xy(270,480),xy(290,479),xy(289,300),xy(140,300),xy(140,400),xy(189,400),xy(190,350),xy(240,350),xy(240,449),xy(190,450),xy(189,500),xy(140,500),xy(140,450),xy(90,449),xy(90,180),xy(119,180),xy(120,170),xy(199,170),xy(200,180),xy(239,180),xy(239,200),xy(140,200),xy(140,249),xy(289,250),xy(290,220),xy(299,220),xy(300,239),xy(319,240),xy(320,259),xy(329,260),xy(330,269),xy(340,270),xy(340,289),xy(350,290),xy(350,329),xy(360,330),xy(360,349),xy(340,350),xy(340,469),xy(330,470),xy(330,479),xy(320,480),xy(319,490),xy(280,490),xy(279,530)]).
hole(r2, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
hole(r2, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r2, [xy(230,440),xy(223,444),xy(210,445),xy(204,443),xy(194,434),xy(173,426),xy(164,431),xy(158,428),xy(115,385),xy(95,406),xy(95,444),xy(133,444),xy(151,429),xy(157,428)]).
midline(r2, [xy(115,384),xy(114,300),xy(116,286),xy(121,274),xy(115,259),xy(114,204),xy(134,184),xy(185,184),xy(194,189),xy(201,190),xy(230,190)]).
midline(r2, [xy(122,274),xy(297,275),xy(304,254),xy(295,243),xy(295,224)]).
midline(r2, [xy(299,275),xy(308,281),xy(314,290),xy(320,312),xy(320,327),xy(316,336),xy(314,354),xy(314,443),xy(316,448),xy(305,474),xy(300,479),xy(293,484),xy(275,485),xy(275,525)]).
midline(r2, [xy(317,448),xy(320,450),xy(316,450)]).
midline(r2, [xy(230,438),xy(235,429),xy(234,416),xy(224,404),xy(220,393),xy(214,385),xy(174,425)]).
midline(r2, [xy(195,434),xy(224,405)]).
midline(r2, [xy(215,384),xy(215,374)]).
midline(r2, [xy(164,432),xy(165,475)]).
midline(r2, [xy(321,326),xy(335,335),xy(350,340)]).
midline(r2, [xy(321,311),xy(329,307),xy(329,309)]).
midline(r2, [xy(321,451),xy(322,452)]).
fillpoint(r2, xy(121,275), 31.4).
fillpoint(r2, xy(165,431), 31.4).
fillpoint(r2, xy(319,320), 30.0).
fillpoint(r2, xy(118,268), 29.0).
fillpoint(r2, xy(118,281), 29.0).
fillpoint(r2, xy(318,308), 29.0).
fillpoint(r2, xy(318,331), 29.0).
fillpoint(r2, xy(158,428), 29.0).
fillpoint(r2, xy(171,428), 29.0).
fillpoint(r2, xy(117,265), 28.0).
fillpoint(r2, xy(117,284), 28.0).
fillpoint(r2, xy(317,305), 28.0).
fillpoint(r2, xy(317,334), 28.0).
fillpoint(r2, xy(116,262), 27.0).
fillpoint(r2, xy(116,287), 27.0).
fillpoint(r2, xy(316,302), 27.0).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(298,275), 26.6).
fillpoint(r2, xy(313,289), 26.2).
fillpoint(r2, xy(314,292), 26.2).
fillpoint(r2, xy(315,297), 26.2).
fillpoint(r2, xy(115,258), 26.0).
fillpoint(r2, xy(115,292), 26.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(304,279), 25.6).
fillpoint(r2, xy(305,280), 25.6).
fillpoint(r2, xy(307,281), 25.6).
fillpoint(r2, xy(308,282), 25.6).
fillpoint(r2, xy(309,284), 25.6).
fillpoint(r2, xy(310,285), 25.6).
fillpoint(r2, xy(115,226), 25.0).
fillpoint(r2, xy(141,275), 25.0).
fillpoint(r2, xy(115,343), 25.0).
fillpoint(r2, xy(314,401), 25.0).
fillpoint(r2, xy(214,380), 25.0).
fillpoint(r2, xy(165,463), 25.0).
fillpoint(r2, xy(134,185), 16.0).
fillpoint(r2, xy(304,255), 16.0).
fillpoint(r2, xy(224,404), 16.0).
fillpoint(r2, xy(194,434), 16.0).
fillpoint(r2, xy(305,474), 16.0).
fillpoint(r2, xy(141,185), 15.0).
fillpoint(r2, xy(195,189), 11.0).
fillpoint(r2, xy(345,339), 11.0).
fillpoint(r2, xy(201,190), 10.0).
fillpoint(r2, xy(229,440), 10.0).
region(r4, '#ffdc00', 7500, centroid(214,224)).
perimeter(r4, 420).
polygon(r4, [xy(289,250),xy(140,250),xy(140,200),xy(239,200),xy(240,190),xy(259,190),xy(260,199),xy(269,200),xy(270,210),xy(290,210),xy(289,250)]).
midline(r4, [xy(172,225),xy(164,225)]).
midline(r4, [xy(173,225),xy(247,224),xy(250,219),xy(250,199)]).
midline(r4, [xy(249,224),xy(270,230)]).
fillpoint(r4, xy(248,224), 26.0).
fillpoint(r4, xy(164,225), 25.0).
fillpoint(r4, xy(263,229), 21.0).
region(r20, '#5a5a5a', 6800, centroid(380,620)).
perimeter(r20, 720).
polygon(r20, [xy(549,630),xy(210,630),xy(210,610),xy(549,610),xy(549,630)]).
midline(r20, [xy(436,620),xy(219,620)]).
midline(r20, [xy(437,620),xy(540,620)]).
fillpoint(r20, xy(219,620), 10.0).
region(r17, '#7fdbff', 2000, centroid(64,576)).
perimeter(r17, 240).
polygon(r17, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r17, [xy(51,560),xy(39,560)]).
midline(r17, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r17, xy(58,561), 12.0).
fillpoint(r17, xy(61,578), 12.0).
fillpoint(r17, xy(78,581), 12.0).
fillpoint(r17, xy(54,560), 11.0).
fillpoint(r17, xy(59,565), 11.0).
fillpoint(r17, xy(60,574), 11.0).
fillpoint(r17, xy(65,579), 11.0).
fillpoint(r17, xy(74,580), 11.0).
fillpoint(r17, xy(79,585), 11.0).
fillpoint(r17, xy(39,560), 10.0).
fillpoint(r17, xy(79,596), 10.0).
region(r19, '#2ecc40', 1600, centroid(170,620)).
perimeter(r19, 200).
polygon(r19, [xy(209,630),xy(130,630),xy(130,610),xy(209,610),xy(209,630)]).
midline(r19, [xy(156,619),xy(139,620)]).
midline(r19, [xy(157,620),xy(200,620)]).
fillpoint(r19, xy(139,620), 10.0).
region(r9, '#870c25', 1500, centroid(164,384)).
perimeter(r9, 160).
polygon(r9, [xy(189,400),xy(140,400),xy(140,370),xy(189,370),xy(189,400)]).
midline(r9, [xy(160,385),xy(154,385)]).
midline(r9, [xy(161,385),xy(175,385)]).
fillpoint(r9, xy(154,385), 15.0).
region(r8, '#ffdc00', 1400, centroid(348,397)).
perimeter(r8, 220).
polygon(r8, [xy(349,450),xy(340,449),xy(340,360),xy(359,360),xy(360,409),xy(350,410),xy(349,450)]).
midline(r8, [xy(349,396),xy(350,369)]).
midline(r8, [xy(350,397),xy(344,411),xy(345,445)]).
fillpoint(r8, xy(349,385), 10.0).
fillpoint(r8, xy(345,428), 5.0).
region(r6, '#bebebe', 1000, centroid(164,360)).
perimeter(r6, 140).
polygon(r6, [xy(189,370),xy(140,370),xy(140,350),xy(189,350),xy(189,370)]).
midline(r6, [xy(160,359),xy(149,360)]).
midline(r6, [xy(161,360),xy(180,360)]).
fillpoint(r6, xy(149,360), 10.0).
region(r18, '#7fdbff', 400, centroid(40,600)).
perimeter(r18, 80).
polygon(r18, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r18, [xy(39,599),xy(40,600)]).
fillpoint(r18, xy(39,600), 10.0).
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
region(r15, '#000000', 300, centroid(218,428)).
perimeter(r15, 80).
polygon(r15, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r15, [xy(215,434),xy(215,435)]).
midline(r15, [xy(215,433),xy(215,425),xy(225,425)]).
fillpoint(r15, xy(216,425), 6.0).
fillpoint(r15, xy(221,425), 5.0).
fillpoint(r15, xy(215,433), 5.0).
region(r12, '#000000', 100, centroid(204,414)).
perimeter(r12, 40).
polygon(r12, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r12, [xy(205,415),xy(205,414)]).
fillpoint(r12, xy(204,415), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 510).
adjacent(r1, r3).
shared_edge(r1, r3, 730).
adjacent(r1, r4).
shared_edge(r1, r4, 80).
adjacent(r1, r8).
shared_edge(r1, r8, 110).
adjacent(r1, r17).
shared_edge(r1, r17, 240).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 180).
adjacent(r1, r20).
shared_edge(r1, r20, 700).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 1120).
adjacent(r2, r4).
shared_edge(r2, r4, 340).
adjacent(r2, r6).
shared_edge(r2, r6, 40).
adjacent(r2, r8).
shared_edge(r2, r8, 90).
adjacent(r2, r9).
shared_edge(r2, r9, 110).
adjacent(r2, r12).
shared_edge(r2, r12, 40).
adjacent(r2, r15).
shared_edge(r2, r15, 80).
adjacent(r3, r6).
shared_edge(r3, r6, 50).
adjacent(r6, r9).
shared_edge(r6, r9, 50).
adjacent(r19, r20).
shared_edge(r19, r20, 20).

encloses(r2, r12).
encloses(r2, r15).
encloses(r1, r17).
encloses(r1, r18).
encloses(r1, r21).
encloses(r1, r22).
