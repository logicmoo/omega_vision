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

region(r1, '#aaaaaa', 303200, centroid(323,259)).
perimeter(r1, 5320).
polygon(r1, [xy(500,599),xy(500,560),xy(510,559),xy(510,480),xy(500,479),xy(500,440),xy(490,439),xy(490,420),xy(480,420),xy(479,410),xy(470,409),xy(470,390),xy(460,390),xy(460,380),xy(450,379),xy(450,370),xy(440,369),xy(439,360),xy(420,360),xy(420,350),xy(410,350),xy(409,340),xy(390,340),xy(389,330),xy(350,330),xy(349,320),xy(270,320),xy(269,330),xy(230,330),xy(229,340),xy(210,340),xy(210,349),xy(200,350),xy(199,360),xy(180,360),xy(180,369),xy(170,370),xy(170,379),xy(160,380),xy(159,390),xy(150,390),xy(150,409),xy(140,410),xy(140,419),xy(130,420),xy(130,439),xy(120,440),xy(120,479),xy(110,480),xy(110,559),xy(120,560),xy(120,600),xy(500,599)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(438,604),xy(132,604),xy(124,606),xy(110,618),xy(96,624),xy(51,625),xy(37,622),xy(27,616),xy(19,606),xy(15,596),xy(15,543),xy(23,527),xy(54,495),xy(55,466),xy(60,446),xy(61,419),xy(68,388),xy(77,364),xy(85,333),xy(118,258),xy(139,219),xy(170,170),xy(245,160),xy(349,159),xy(384,161),xy(466,173),xy(387,253),xy(386,269),xy(381,276),xy(382,278),xy(376,289),xy(378,289)]).
midline(r1, [xy(439,605),xy(503,604),xy(529,580),xy(539,576),xy(553,565),xy(555,568),xy(555,632),xy(549,635),xy(130,635),xy(120,630),xy(109,619)]).
midline(r1, [xy(384,273),xy(383,276)]).
midline(r1, [xy(555,564),xy(575,543),xy(575,481),xy(571,448),xy(567,441),xy(563,445),xy(555,446),xy(549,450),xy(544,449),xy(535,455),xy(529,455),xy(530,457)]).
midline(r1, [xy(83,345),xy(127,391)]).
midline(r1, [xy(109,616),xy(105,606),xy(103,581),xy(101,579),xy(80,580),xy(59,559),xy(60,500),xy(55,495)]).
midline(r1, [xy(569,442),xy(569,424),xy(566,407),xy(544,329),xy(530,299),xy(528,290),xy(524,285),xy(521,273),xy(514,262),xy(515,260),xy(474,187),xy(471,184),xy(389,266),xy(387,264),xy(388,261)]).
midline(r1, [xy(387,266),xy(386,273)]).
midline(r1, [xy(389,255),xy(391,253)]).
midline(r1, [xy(163,182),xy(231,250),xy(233,257),xy(231,262),xy(233,264),xy(233,261)]).
midline(r1, [xy(235,264),xy(234,269),xy(238,274),xy(238,280),xy(240,280)]).
midline(r1, [xy(555,633),xy(560,635),xy(579,635),xy(583,634),xy(585,630),xy(584,559),xy(586,556),xy(575,545)]).
midline(r1, [xy(61,501),xy(95,536),xy(99,544),xy(100,565),xy(105,574),xy(103,579)]).
midline(r1, [xy(468,178),xy(388,259)]).
midline(r1, [xy(587,557),xy(615,586),xy(615,631),xy(613,634),xy(606,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(240,282),xy(241,289),xy(243,289)]).
midline(r1, [xy(243,291),xy(248,304)]).
midline(r1, [xy(568,444),xy(565,445)]).
midline(r1, [xy(469,180),xy(471,183)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(69,449),xy(63,445),xy(61,446),xy(64,448)]).
midline(r1, [xy(70,449),xy(75,451),xy(77,449),xy(76,452)]).
midline(r1, [xy(78,452),xy(79,450)]).
midline(r1, [xy(81,450),xy(80,453),xy(82,454),xy(85,451),xy(85,455),xy(87,453),xy(88,456),xy(90,455),xy(95,460),xy(97,459),xy(97,461)]).
midline(r1, [xy(150,257),xy(130,239),xy(211,320)]).
midline(r1, [xy(123,281),xy(180,338)]).
midline(r1, [xy(92,404),xy(71,385),xy(107,421)]).
fillpoint(r1, xy(466,173), 174.0).
fillpoint(r1, xy(460,172), 173.0).
fillpoint(r1, xy(455,171), 172.0).
fillpoint(r1, xy(450,170), 171.0).
fillpoint(r1, xy(170,170), 170.9).
fillpoint(r1, xy(175,169), 170.0).
fillpoint(r1, xy(445,169), 170.0).
fillpoint(r1, xy(181,168), 169.0).
fillpoint(r1, xy(439,168), 169.0).
fillpoint(r1, xy(188,167), 168.0).
fillpoint(r1, xy(431,167), 168.0).
fillpoint(r1, xy(197,166), 167.0).
fillpoint(r1, xy(423,166), 167.0).
fillpoint(r1, xy(208,165), 166.0).
fillpoint(r1, xy(411,165), 166.0).
fillpoint(r1, xy(216,164), 165.0).
fillpoint(r1, xy(404,164), 165.0).
fillpoint(r1, xy(222,163), 164.0).
fillpoint(r1, xy(398,163), 164.0).
fillpoint(r1, xy(229,162), 163.0).
fillpoint(r1, xy(391,162), 163.0).
fillpoint(r1, xy(237,161), 162.0).
fillpoint(r1, xy(382,161), 162.0).
fillpoint(r1, xy(249,160), 161.0).
fillpoint(r1, xy(370,160), 161.0).
fillpoint(r1, xy(271,160), 160.0).
fillpoint(r1, xy(524,281), 116.0).
fillpoint(r1, xy(544,330), 96.0).
fillpoint(r1, xy(545,333), 95.0).
fillpoint(r1, xy(546,336), 94.0).
fillpoint(r1, xy(547,339), 93.0).
fillpoint(r1, xy(549,346), 91.0).
fillpoint(r1, xy(550,350), 90.0).
fillpoint(r1, xy(551,355), 89.0).
fillpoint(r1, xy(86,331), 87.0).
fillpoint(r1, xy(553,361), 87.0).
fillpoint(r1, xy(80,349), 81.0).
fillpoint(r1, xy(559,379), 81.0).
fillpoint(r1, xy(79,353), 80.0).
fillpoint(r1, xy(560,383), 80.0).
fillpoint(r1, xy(78,357), 79.0).
fillpoint(r1, xy(561,387), 79.0).
fillpoint(r1, xy(77,362), 78.0).
fillpoint(r1, xy(562,392), 78.0).
fillpoint(r1, xy(563,397), 77.0).
fillpoint(r1, xy(565,404), 75.0).
fillpoint(r1, xy(566,408), 74.0).
fillpoint(r1, xy(567,413), 73.0).
fillpoint(r1, xy(568,419), 72.0).
fillpoint(r1, xy(70,382), 71.0).
fillpoint(r1, xy(569,427), 71.0).
fillpoint(r1, xy(69,385), 70.0).
fillpoint(r1, xy(569,443), 70.0).
fillpoint(r1, xy(68,389), 69.0).
fillpoint(r1, xy(571,449), 69.0).
fillpoint(r1, xy(67,394), 68.0).
fillpoint(r1, xy(572,454), 68.0).
fillpoint(r1, xy(66,400), 67.0).
fillpoint(r1, xy(573,460), 67.0).
fillpoint(r1, xy(574,467), 66.0).
fillpoint(r1, xy(64,407), 65.0).
fillpoint(r1, xy(575,513), 65.0).
fillpoint(r1, xy(62,415), 63.0).
fillpoint(r1, xy(61,420), 62.0).
fillpoint(r1, xy(60,428), 61.0).
fillpoint(r1, xy(60,444), 60.0).
fillpoint(r1, xy(58,452), 59.0).
fillpoint(r1, xy(57,456), 58.0).
fillpoint(r1, xy(56,461), 57.0).
fillpoint(r1, xy(55,468), 56.0).
fillpoint(r1, xy(55,488), 55.0).
border(r1).
region(r2, '#ffdc00', 53400, centroid(301,502)).
perimeter(r2, 2120).
polygon(r2, [xy(499,600),xy(120,600),xy(120,560),xy(110,559),xy(110,480),xy(120,479),xy(120,450),xy(140,450),xy(140,500),xy(189,500),xy(190,450),xy(240,449),xy(240,350),xy(210,350),xy(210,340),xy(229,340),xy(230,330),xy(269,330),xy(270,320),xy(289,320),xy(290,479),xy(270,480),xy(270,569),xy(360,569),xy(360,480),xy(340,479),xy(340,360),xy(389,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,549),xy(509,550),xy(510,559),xy(500,560),xy(499,600)]).
midline(r2, [xy(178,549),xy(168,550),xy(146,536),xy(129,516),xy(125,506),xy(124,494),xy(129,485),xy(130,459)]).
midline(r2, [xy(179,549),xy(203,549),xy(216,545),xy(247,576),xy(257,582),xy(270,585),xy(359,585),xy(376,580),xy(390,569),xy(400,559),xy(400,490),xy(364,455),xy(365,384)]).
midline(r2, [xy(217,544),xy(228,516),xy(229,489),xy(264,455),xy(265,356),xy(253,344),xy(245,340),xy(239,339),xy(229,345),xy(214,345)]).
midline(r2, [xy(401,490),xy(412,482),xy(426,476),xy(441,474),xy(465,475)]).
midline(r2, [xy(401,559),xy(410,566),xy(426,573),xy(475,575)]).
midline(r2, [xy(476,573),xy(494,556),xy(505,555)]).
midline(r2, [xy(265,354),xy(275,343),xy(280,329)]).
fillpoint(r2, xy(216,546), 54.0).
fillpoint(r2, xy(212,547), 53.0).
fillpoint(r2, xy(208,548), 52.0).
fillpoint(r2, xy(201,549), 51.0).
fillpoint(r2, xy(168,550), 50.0).
fillpoint(r2, xy(225,526), 45.0).
fillpoint(r2, xy(226,523), 44.0).
fillpoint(r2, xy(228,515), 42.0).
fillpoint(r2, xy(400,491), 41.0).
fillpoint(r2, xy(229,509), 41.0).
fillpoint(r2, xy(400,559), 41.0).
fillpoint(r2, xy(229,494), 40.0).
fillpoint(r2, xy(399,525), 40.0).
fillpoint(r2, xy(421,478), 29.0).
fillpoint(r2, xy(421,571), 29.0).
fillpoint(r2, xy(424,477), 28.0).
fillpoint(r2, xy(424,572), 28.0).
fillpoint(r2, xy(427,476), 27.0).
fillpoint(r2, xy(427,573), 27.0).
fillpoint(r2, xy(432,475), 26.0).
fillpoint(r2, xy(432,574), 26.0).
fillpoint(r2, xy(264,455), 25.7).
fillpoint(r2, xy(365,455), 25.7).
fillpoint(r2, xy(265,401), 25.0).
fillpoint(r2, xy(365,416), 25.0).
fillpoint(r2, xy(441,475), 25.0).
fillpoint(r2, xy(441,575), 25.0).
fillpoint(r2, xy(125,505), 16.0).
fillpoint(r2, xy(264,584), 16.0).
fillpoint(r2, xy(365,584), 16.0).
fillpoint(r2, xy(124,496), 15.0).
fillpoint(r2, xy(271,585), 15.0).
region(r3, '#2ecc40', 24400, centroid(383,436)).
perimeter(r3, 1800).
polygon(r3, [xy(359,570),xy(270,569),xy(270,480),xy(290,479),xy(290,320),xy(349,320),xy(350,330),xy(389,330),xy(390,340),xy(409,340),xy(410,349),xy(419,350),xy(420,360),xy(439,360),xy(440,369),xy(449,370),xy(450,379),xy(459,380),xy(460,389),xy(470,390),xy(470,409),xy(479,410),xy(480,419),xy(490,420),xy(490,439),xy(500,440),xy(500,479),xy(510,480),xy(510,549),xy(440,550),xy(440,500),xy(489,500),xy(490,450),xy(390,450),xy(390,350),xy(340,350),xy(340,479),xy(360,480),xy(359,570)]).
hole(r3, [xy(350,559),xy(349,490),xy(280,490),xy(280,560),xy(350,559)]).
midline(r3, [xy(275,511),xy(275,485),xy(295,483),xy(315,463),xy(314,353),xy(317,343),xy(335,334),xy(344,339),xy(352,340),xy(380,339),xy(386,344),xy(393,345),xy(400,349),xy(400,355),xy(413,382),xy(415,384),xy(423,378),xy(416,385),xy(423,396)]).
midline(r3, [xy(274,512),xy(275,564),xy(348,565),xy(354,563),xy(354,486),xy(334,483),xy(315,465)]).
midline(r3, [xy(423,398),xy(428,411),xy(438,417),xy(447,408),xy(440,417),xy(442,420),xy(475,434),xy(486,444),xy(494,445),xy(494,479),xy(500,489),xy(499,505),xy(495,513),xy(485,524),xy(464,525)]).
fillpoint(r3, xy(428,411), 38.8).
fillpoint(r3, xy(418,388), 29.0).
fillpoint(r3, xy(315,345), 25.5).
fillpoint(r3, xy(315,408), 25.0).
fillpoint(r3, xy(464,525), 25.0).
fillpoint(r3, xy(334,335), 16.0).
fillpoint(r3, xy(405,365), 16.0).
fillpoint(r3, xy(474,434), 16.0).
fillpoint(r3, xy(345,339), 11.0).
fillpoint(r3, xy(400,354), 11.0).
fillpoint(r3, xy(499,504), 11.0).
fillpoint(r3, xy(351,340), 10.0).
fillpoint(r3, xy(499,494), 10.0).
region(r4, '#2ecc40', 10800, centroid(185,422)).
perimeter(r4, 660).
polygon(r4, [xy(189,500),xy(140,500),xy(140,450),xy(120,450),xy(120,440),xy(130,439),xy(130,420),xy(139,420),xy(140,410),xy(150,409),xy(150,390),xy(159,390),xy(160,380),xy(169,380),xy(170,370),xy(179,370),xy(180,360),xy(199,360),xy(200,350),xy(239,350),xy(240,449),xy(190,450),xy(189,500)]).
hole(r4, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r4, [xy(230,440),xy(223,444),xy(210,445),xy(204,443),xy(194,434),xy(172,426),xy(173,410),xy(179,399),xy(189,389),xy(199,385),xy(199,380),xy(201,384)]).
midline(r4, [xy(230,438),xy(235,428),xy(234,416),xy(224,404),xy(216,387),xy(212,383),xy(203,384)]).
midline(r4, [xy(224,405),xy(195,434)]).
midline(r4, [xy(172,427),xy(165,434),xy(144,434),xy(135,443),xy(124,445)]).
midline(r4, [xy(164,435),xy(165,475)]).
midline(r4, [xy(213,382),xy(219,370)]).
fillpoint(r4, xy(165,434), 29.7).
fillpoint(r4, xy(172,427), 29.1).
fillpoint(r4, xy(212,383), 27.2).
fillpoint(r4, xy(208,384), 26.0).
fillpoint(r4, xy(174,418), 26.0).
fillpoint(r4, xy(199,385), 25.0).
fillpoint(r4, xy(175,409), 25.0).
fillpoint(r4, xy(165,463), 25.0).
fillpoint(r4, xy(189,390), 22.8).
fillpoint(r4, xy(180,399), 22.8).
fillpoint(r4, xy(224,404), 16.0).
fillpoint(r4, xy(194,434), 16.0).
fillpoint(r4, xy(229,440), 10.0).
region(r12, '#2ecc40', 4400, centroid(240,620)).
perimeter(r12, 480).
polygon(r12, [xy(349,630),xy(130,630),xy(130,610),xy(349,610),xy(349,630)]).
midline(r12, [xy(301,620),xy(139,620)]).
midline(r12, [xy(302,620),xy(340,620)]).
fillpoint(r12, xy(139,620), 10.0).
region(r13, '#5a5a5a', 4000, centroid(450,620)).
perimeter(r13, 440).
polygon(r13, [xy(549,630),xy(350,630),xy(350,610),xy(549,610),xy(549,630)]).
midline(r13, [xy(499,620),xy(359,620)]).
midline(r13, [xy(500,619),xy(540,620)]).
fillpoint(r13, xy(359,620), 10.0).
region(r8, '#b0b0b0', 3400, centroid(314,520)).
perimeter(r8, 440).
polygon(r8, [xy(349,560),xy(280,559),xy(280,490),xy(350,490),xy(349,560)]).
hole(r8, [xy(340,549),xy(339,520),xy(290,520),xy(290,550),xy(340,549)]).
midline(r8, [xy(345,528),xy(344,516),xy(334,504),xy(294,504),xy(284,520),xy(285,554),xy(343,554),xy(345,549),xy(344,529)]).
fillpoint(r8, xy(294,505), 15.0).
fillpoint(r8, xy(285,554), 6.0).
fillpoint(r8, xy(343,554), 6.0).
fillpoint(r8, xy(284,535), 5.0).
fillpoint(r8, xy(344,535), 5.0).
fillpoint(r8, xy(291,555), 5.0).
region(r10, '#7fdbff', 2000, centroid(56,584)).
perimeter(r10, 240).
polygon(r10, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r10, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r10, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r10, xy(41,578), 12.0).
fillpoint(r10, xy(58,581), 12.0).
fillpoint(r10, xy(61,598), 12.0).
fillpoint(r10, xy(40,574), 11.0).
fillpoint(r10, xy(45,579), 11.0).
fillpoint(r10, xy(54,580), 11.0).
fillpoint(r10, xy(59,585), 11.0).
fillpoint(r10, xy(60,594), 11.0).
fillpoint(r10, xy(65,599), 11.0).
fillpoint(r10, xy(39,564), 10.0).
fillpoint(r10, xy(71,600), 10.0).
region(r9, '#870c25', 1500, centroid(314,534)).
perimeter(r9, 160).
polygon(r9, [xy(339,550),xy(290,550),xy(290,520),xy(339,520),xy(339,550)]).
midline(r9, [xy(316,534),xy(304,535)]).
midline(r9, [xy(317,535),xy(325,535)]).
fillpoint(r9, xy(304,535), 15.0).
region(r5, '#0074d9', 500, centroid(364,354)).
perimeter(r5, 120).
polygon(r5, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r5, [xy(359,354),xy(344,355)]).
midline(r5, [xy(360,354),xy(385,355)]).
fillpoint(r5, xy(344,355), 5.0).
region(r11, '#7fdbff', 400, centroid(80,560)).
perimeter(r11, 80).
polygon(r11, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r11, [xy(79,559),xy(80,560)]).
fillpoint(r11, xy(79,560), 10.0).
region(r14, '#7fdbff', 400, centroid(570,620)).
perimeter(r14, 80).
polygon(r14, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r14, [xy(569,619),xy(570,620)]).
fillpoint(r14, xy(569,620), 10.0).
region(r15, '#7fdbff', 400, centroid(600,620)).
perimeter(r15, 80).
polygon(r15, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r15, [xy(599,619),xy(600,620)]).
fillpoint(r15, xy(599,620), 10.0).
region(r16, '#2ecc40', 400, centroid(630,620)).
perimeter(r16, 80).
polygon(r16, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r16, [xy(629,619),xy(630,620)]).
fillpoint(r16, xy(629,620), 10.0).
border(r16).
region(r7, '#000000', 300, centroid(218,428)).
perimeter(r7, 80).
polygon(r7, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r7, [xy(215,431),xy(215,435)]).
midline(r7, [xy(215,430),xy(215,425),xy(225,425)]).
fillpoint(r7, xy(216,425), 6.0).
fillpoint(r7, xy(221,425), 5.0).
fillpoint(r7, xy(215,433), 5.0).
region(r6, '#000000', 100, centroid(204,414)).
perimeter(r6, 40).
polygon(r6, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r6, [xy(205,415),xy(205,414)]).
fillpoint(r6, xy(204,415), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 720).
adjacent(r1, r3).
shared_edge(r1, r3, 450).
adjacent(r1, r4).
shared_edge(r1, r4, 190).
adjacent(r1, r10).
shared_edge(r1, r10, 240).
adjacent(r1, r11).
shared_edge(r1, r11, 80).
adjacent(r1, r12).
shared_edge(r1, r12, 460).
adjacent(r1, r13).
shared_edge(r1, r13, 420).
adjacent(r1, r14).
shared_edge(r1, r14, 80).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 1000).
adjacent(r2, r4).
shared_edge(r2, r4, 350).
adjacent(r2, r5).
shared_edge(r2, r5, 50).
adjacent(r3, r5).
shared_edge(r3, r5, 70).
adjacent(r3, r8).
shared_edge(r3, r8, 280).
adjacent(r4, r6).
shared_edge(r4, r6, 40).
adjacent(r4, r7).
shared_edge(r4, r7, 80).
adjacent(r8, r9).
shared_edge(r8, r9, 160).
adjacent(r12, r13).
shared_edge(r12, r13, 20).

encloses(r4, r6).
encloses(r4, r7).
encloses(r8, r9).
encloses(r1, r10).
encloses(r1, r11).
encloses(r1, r14).
encloses(r1, r15).
