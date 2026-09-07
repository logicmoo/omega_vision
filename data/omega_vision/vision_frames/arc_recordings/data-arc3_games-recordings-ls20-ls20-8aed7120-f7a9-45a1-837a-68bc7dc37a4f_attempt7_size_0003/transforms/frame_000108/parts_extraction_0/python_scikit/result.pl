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

region(r1, '#aaaaaa', 286300, centroid(324,257)).
perimeter(r1, 5420).
polygon(r1, [xy(470,599),xy(470,580),xy(479,580),xy(480,570),xy(490,569),xy(490,550),xy(500,549),xy(500,510),xy(510,509),xy(510,430),xy(500,429),xy(500,390),xy(490,389),xy(490,370),xy(480,370),xy(480,360),xy(470,359),xy(470,340),xy(460,340),xy(460,330),xy(450,330),xy(450,320),xy(440,319),xy(439,310),xy(420,310),xy(420,300),xy(410,300),xy(409,290),xy(390,290),xy(389,280),xy(350,280),xy(349,270),xy(270,270),xy(269,280),xy(230,280),xy(229,290),xy(210,290),xy(210,299),xy(200,300),xy(199,310),xy(180,310),xy(179,320),xy(170,320),xy(169,330),xy(160,330),xy(159,340),xy(150,340),xy(150,359),xy(140,360),xy(140,369),xy(130,370),xy(130,389),xy(120,390),xy(120,439),xy(110,440),xy(110,509),xy(120,510),xy(120,549),xy(130,550),xy(130,569),xy(139,570),xy(140,579),xy(150,580),xy(150,600),xy(470,599)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(150,150),xy(106,232),xy(86,280),xy(68,338),xy(60,375),xy(60,406),xy(55,426),xy(55,494),xy(23,527),xy(17,537),xy(14,550),xy(15,596),xy(19,606),xy(27,616),xy(37,622),xy(54,625),xy(96,624),xy(109,617),xy(110,602),xy(115,589),xy(110,580),xy(81,580),xy(59,560)]).
midline(r1, [xy(61,407),xy(66,407),xy(76,412),xy(79,411),xy(79,413)]).
midline(r1, [xy(81,413),xy(93,417),xy(93,419)]).
midline(r1, [xy(55,496),xy(60,502),xy(60,558)]).
midline(r1, [xy(116,590),xy(120,589),xy(135,594),xy(144,603),xy(150,605),xy(469,605),xy(475,603),xy(484,594),xy(517,580),xy(519,577),xy(512,568),xy(521,577),xy(554,556),xy(560,549),xy(548,539),xy(533,535),xy(526,530),xy(527,533)]).
midline(r1, [xy(555,543),xy(558,542),xy(560,546),xy(562,544),xy(560,543)]).
midline(r1, [xy(110,578),xy(110,568),xy(105,556),xy(104,543),xy(100,533),xy(95,527),xy(78,517),xy(61,501)]).
midline(r1, [xy(548,541),xy(549,542)]).
midline(r1, [xy(555,557),xy(555,631),xy(549,635),xy(130,635),xy(124,633),xy(109,619)]).
midline(r1, [xy(555,633),xy(574,635),xy(585,632),xy(585,555),xy(571,541),xy(561,547)]).
midline(r1, [xy(571,540),xy(575,507),xy(575,433),xy(570,393),xy(568,391),xy(564,394),xy(556,395),xy(552,399),xy(548,398),xy(543,402),xy(541,400),xy(539,402),xy(541,402)]).
midline(r1, [xy(559,396),xy(562,395)]).
midline(r1, [xy(555,398),xy(556,397)]).
midline(r1, [xy(568,393),xy(565,395)]).
midline(r1, [xy(569,390),xy(566,357),xy(544,279),xy(515,210),xy(498,180),xy(496,179),xy(408,267),xy(496,181)]).
midline(r1, [xy(498,179),xy(484,154),xy(436,143),xy(372,135),xy(247,135),xy(183,143),xy(152,150)]).
midline(r1, [xy(447,148),xy(386,207),xy(386,215),xy(383,218),xy(384,221),xy(381,224),xy(380,232),xy(372,250),xy(377,247),xy(376,245)]).
midline(r1, [xy(386,216),xy(385,219)]).
midline(r1, [xy(388,210),xy(387,212)]).
midline(r1, [xy(387,214),xy(388,216)]).
midline(r1, [xy(586,556),xy(615,585),xy(615,632),xy(609,635),xy(585,633)]).
midline(r1, [xy(387,205),xy(388,199),xy(442,147),xy(390,199)]).
midline(r1, [xy(548,400),xy(549,400)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(168,148),xy(233,211),xy(231,218),xy(234,215)]).
midline(r1, [xy(108,320),xy(131,343)]).
midline(r1, [xy(235,219),xy(233,222),xy(236,220)]).
midline(r1, [xy(241,240),xy(236,234),xy(237,228),xy(234,225),xy(237,222),xy(238,227)]).
midline(r1, [xy(238,230),xy(240,231),xy(238,234),xy(241,238)]).
midline(r1, [xy(242,241),xy(249,253),xy(248,255),xy(250,255)]).
fillpoint(r1, xy(485,154), 155.0).
fillpoint(r1, xy(480,153), 154.0).
fillpoint(r1, xy(476,152), 153.0).
fillpoint(r1, xy(471,151), 152.0).
fillpoint(r1, xy(153,150), 151.0).
fillpoint(r1, xy(466,150), 151.0).
fillpoint(r1, xy(151,151), 151.0).
fillpoint(r1, xy(165,147), 148.0).
fillpoint(r1, xy(454,147), 148.0).
fillpoint(r1, xy(169,146), 147.0).
fillpoint(r1, xy(450,146), 147.0).
fillpoint(r1, xy(174,145), 146.0).
fillpoint(r1, xy(445,145), 146.0).
fillpoint(r1, xy(179,144), 145.0).
fillpoint(r1, xy(440,144), 145.0).
fillpoint(r1, xy(185,143), 144.0).
fillpoint(r1, xy(435,143), 144.0).
fillpoint(r1, xy(192,142), 143.0).
fillpoint(r1, xy(428,142), 143.0).
fillpoint(r1, xy(199,141), 142.0).
fillpoint(r1, xy(420,141), 142.0).
fillpoint(r1, xy(211,140), 141.0).
fillpoint(r1, xy(409,140), 141.0).
fillpoint(r1, xy(220,139), 140.0).
fillpoint(r1, xy(399,139), 140.0).
fillpoint(r1, xy(226,138), 139.0).
fillpoint(r1, xy(394,138), 139.0).
fillpoint(r1, xy(232,137), 138.0).
fillpoint(r1, xy(387,137), 138.0).
fillpoint(r1, xy(240,136), 137.0).
fillpoint(r1, xy(379,136), 137.0).
fillpoint(r1, xy(251,135), 136.0).
fillpoint(r1, xy(369,135), 136.0).
fillpoint(r1, xy(271,135), 135.0).
fillpoint(r1, xy(524,231), 116.0).
fillpoint(r1, xy(544,280), 96.0).
fillpoint(r1, xy(545,283), 95.0).
fillpoint(r1, xy(546,286), 94.0).
fillpoint(r1, xy(547,289), 93.0).
fillpoint(r1, xy(549,296), 91.0).
fillpoint(r1, xy(550,300), 90.0).
fillpoint(r1, xy(551,305), 89.0).
fillpoint(r1, xy(86,281), 87.0).
fillpoint(r1, xy(553,311), 87.0).
fillpoint(r1, xy(80,299), 81.0).
fillpoint(r1, xy(559,329), 81.0).
fillpoint(r1, xy(79,303), 80.0).
fillpoint(r1, xy(560,333), 80.0).
fillpoint(r1, xy(78,307), 79.0).
fillpoint(r1, xy(561,337), 79.0).
fillpoint(r1, xy(77,312), 78.0).
fillpoint(r1, xy(562,342), 78.0).
fillpoint(r1, xy(563,347), 77.0).
fillpoint(r1, xy(565,354), 75.0).
fillpoint(r1, xy(566,358), 74.0).
fillpoint(r1, xy(567,363), 73.0).
fillpoint(r1, xy(568,369), 72.0).
fillpoint(r1, xy(70,332), 71.0).
fillpoint(r1, xy(569,377), 71.0).
fillpoint(r1, xy(69,335), 70.0).
fillpoint(r1, xy(569,393), 70.0).
fillpoint(r1, xy(68,339), 69.0).
fillpoint(r1, xy(571,399), 69.0).
fillpoint(r1, xy(571,541), 69.0).
fillpoint(r1, xy(67,344), 68.0).
fillpoint(r1, xy(572,404), 68.0).
fillpoint(r1, xy(572,535), 68.0).
fillpoint(r1, xy(66,350), 67.0).
fillpoint(r1, xy(573,410), 67.0).
fillpoint(r1, xy(573,530), 67.0).
fillpoint(r1, xy(574,417), 66.0).
fillpoint(r1, xy(574,523), 66.0).
fillpoint(r1, xy(64,357), 65.0).
fillpoint(r1, xy(574,470), 65.0).
fillpoint(r1, xy(62,365), 63.0).
fillpoint(r1, xy(61,370), 62.0).
fillpoint(r1, xy(60,378), 61.0).
fillpoint(r1, xy(60,399), 60.0).
fillpoint(r1, xy(58,412), 59.0).
fillpoint(r1, xy(57,416), 58.0).
fillpoint(r1, xy(56,421), 57.0).
fillpoint(r1, xy(55,428), 56.0).
fillpoint(r1, xy(55,468), 55.0).
border(r1).
region(r3, '#ffdc00', 55400, centroid(295,484)).
perimeter(r3, 2240).
polygon(r3, [xy(469,600),xy(150,600),xy(150,580),xy(140,580),xy(140,570),xy(130,569),xy(130,550),xy(120,549),xy(120,510),xy(110,509),xy(110,450),xy(140,450),xy(140,500),xy(189,500),xy(190,450),xy(240,449),xy(240,350),xy(150,350),xy(150,340),xy(159,340),xy(160,330),xy(169,330),xy(170,320),xy(179,320),xy(180,310),xy(199,310),xy(200,300),xy(290,300),xy(290,479),xy(270,480),xy(270,570),xy(360,569),xy(360,480),xy(340,479),xy(340,360),xy(389,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,549),xy(490,550),xy(490,569),xy(480,570),xy(479,580),xy(470,580),xy(469,600)]).
midline(r3, [xy(428,573),xy(410,566),xy(400,558),xy(400,490),xy(364,455),xy(365,384)]).
midline(r3, [xy(429,573),xy(445,575),xy(457,567),xy(474,560),xy(480,560)]).
midline(r3, [xy(400,559),xy(382,576),xy(366,584),xy(272,585),xy(257,582),xy(240,570),xy(216,546),xy(189,550),xy(149,529),xy(134,513),xy(124,495),xy(125,464)]).
midline(r3, [xy(216,545),xy(228,516),xy(229,489),xy(264,455),xy(265,351),xy(263,336),xy(261,331),xy(253,326),xy(219,324),xy(207,329),xy(197,328),xy(175,339),xy(169,339),xy(163,344),xy(154,345)]).
midline(r3, [xy(401,490),xy(410,483),xy(426,476),xy(440,474),xy(465,475)]).
fillpoint(r3, xy(216,546), 54.0).
fillpoint(r3, xy(212,547), 53.0).
fillpoint(r3, xy(208,548), 52.0).
fillpoint(r3, xy(201,549), 51.0).
fillpoint(r3, xy(225,526), 45.0).
fillpoint(r3, xy(176,544), 45.0).
fillpoint(r3, xy(226,523), 44.0).
fillpoint(r3, xy(228,515), 42.0).
fillpoint(r3, xy(400,491), 41.0).
fillpoint(r3, xy(229,509), 41.0).
fillpoint(r3, xy(400,559), 41.0).
fillpoint(r3, xy(229,494), 40.0).
fillpoint(r3, xy(399,525), 40.0).
fillpoint(r3, xy(260,329), 29.7).
fillpoint(r3, xy(258,328), 29.0).
fillpoint(r3, xy(261,331), 29.0).
fillpoint(r3, xy(421,478), 29.0).
fillpoint(r3, xy(148,528), 29.0).
fillpoint(r3, xy(421,571), 29.0).
fillpoint(r3, xy(255,327), 28.0).
fillpoint(r3, xy(262,334), 28.0).
fillpoint(r3, xy(424,477), 28.0).
fillpoint(r3, xy(424,572), 28.0).
fillpoint(r3, xy(252,326), 27.0).
fillpoint(r3, xy(263,337), 27.0).
fillpoint(r3, xy(427,476), 27.0).
fillpoint(r3, xy(427,573), 27.0).
fillpoint(r3, xy(248,325), 26.0).
fillpoint(r3, xy(264,342), 26.0).
fillpoint(r3, xy(432,475), 26.0).
fillpoint(r3, xy(432,574), 26.0).
fillpoint(r3, xy(264,455), 25.7).
fillpoint(r3, xy(365,455), 25.7).
fillpoint(r3, xy(219,325), 25.0).
fillpoint(r3, xy(264,400), 25.0).
fillpoint(r3, xy(365,416), 25.0).
fillpoint(r3, xy(441,475), 25.0).
fillpoint(r3, xy(441,575), 25.0).
fillpoint(r3, xy(206,329), 21.0).
fillpoint(r3, xy(196,330), 20.0).
fillpoint(r3, xy(185,334), 16.0).
fillpoint(r3, xy(464,565), 16.0).
fillpoint(r3, xy(264,584), 16.0).
fillpoint(r3, xy(365,584), 16.0).
fillpoint(r3, xy(124,480), 15.0).
fillpoint(r3, xy(271,585), 15.0).
region(r2, '#2ecc40', 31300, centroid(389,382)).
perimeter(r2, 1460).
polygon(r2, [xy(499,550),xy(440,549),xy(440,500),xy(489,500),xy(490,450),xy(390,450),xy(389,350),xy(340,350),xy(340,449),xy(290,450),xy(290,300),xy(210,300),xy(210,290),xy(229,290),xy(230,280),xy(269,280),xy(270,270),xy(349,270),xy(350,280),xy(389,280),xy(390,290),xy(409,290),xy(410,299),xy(419,300),xy(420,310),xy(439,310),xy(440,349),xy(469,350),xy(470,359),xy(479,360),xy(480,369),xy(490,370),xy(490,389),xy(500,390),xy(500,429),xy(510,430),xy(510,509),xy(500,510),xy(499,550)]).
midline(r2, [xy(439,400),xy(427,385),xy(418,369),xy(413,336),xy(392,321),xy(364,314),xy(331,313),xy(312,293),xy(296,285),xy(284,284),xy(269,290),xy(239,289),xy(229,295),xy(214,295)]).
midline(r2, [xy(328,313),xy(319,328),xy(315,340),xy(315,425)]).
midline(r2, [xy(439,396),xy(443,389),xy(441,386),xy(448,378),xy(449,371),xy(451,369),xy(451,372)]).
midline(r2, [xy(443,388),xy(445,384)]).
midline(r2, [xy(441,400),xy(454,409),xy(466,414),xy(467,417),xy(470,414)]).
midline(r2, [xy(473,411),xy(473,413)]).
midline(r2, [xy(468,418),xy(486,435),xy(498,441),xy(500,450),xy(500,497),xy(474,525),xy(464,525)]).
fillpoint(r2, xy(439,400), 50.0).
fillpoint(r2, xy(329,312), 39.1).
fillpoint(r2, xy(341,314), 36.0).
fillpoint(r2, xy(351,315), 35.0).
fillpoint(r2, xy(376,318), 32.0).
fillpoint(r2, xy(382,319), 31.0).
fillpoint(r2, xy(391,321), 29.1).
fillpoint(r2, xy(318,331), 29.0).
fillpoint(r2, xy(418,368), 29.0).
fillpoint(r2, xy(317,334), 28.0).
fillpoint(r2, xy(417,365), 28.0).
fillpoint(r2, xy(396,323), 27.8).
fillpoint(r2, xy(412,335), 27.2).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(413,337), 27.0).
fillpoint(r2, xy(416,362), 27.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(414,342), 26.0).
fillpoint(r2, xy(415,358), 26.0).
fillpoint(r2, xy(404,329), 25.6).
fillpoint(r2, xy(405,330), 25.6).
fillpoint(r2, xy(315,388), 25.0).
fillpoint(r2, xy(464,525), 25.0).
fillpoint(r2, xy(295,285), 16.0).
fillpoint(r2, xy(283,285), 15.0).
region(r6, '#2ecc40', 13200, centroid(179,415)).
perimeter(r6, 700).
polygon(r6, [xy(189,500),xy(140,499),xy(140,450),xy(110,449),xy(110,440),xy(130,439),xy(130,410),xy(120,409),xy(120,390),xy(130,389),xy(130,370),xy(139,370),xy(140,360),xy(149,360),xy(150,350),xy(239,350),xy(240,449),xy(190,450),xy(189,500)]).
hole(r6, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r6, [xy(210,379),xy(190,380),xy(178,384),xy(175,384),xy(173,379),xy(176,382)]).
midline(r6, [xy(210,381),xy(220,393),xy(224,405),xy(195,434),xy(164,424),xy(156,429),xy(152,428),xy(133,444),xy(114,445)]).
midline(r6, [xy(225,405),xy(234,416),xy(235,429),xy(233,435),xy(225,443),xy(215,445),xy(206,444),xy(195,435)]).
midline(r6, [xy(165,423),xy(165,402),xy(152,388),xy(147,387),xy(159,397),xy(156,400),xy(129,400)]).
midline(r6, [xy(158,400),xy(160,398),xy(162,400)]).
midline(r6, [xy(174,385),xy(169,389),xy(165,399)]).
midline(r6, [xy(165,426),xy(165,475)]).
fillpoint(r6, xy(166,395), 37.2).
fillpoint(r6, xy(165,398), 37.0).
fillpoint(r6, xy(167,393), 36.9).
fillpoint(r6, xy(170,389), 36.6).
fillpoint(r6, xy(169,390), 36.6).
fillpoint(r6, xy(165,425), 35.4).
fillpoint(r6, xy(164,415), 35.0).
fillpoint(r6, xy(186,381), 32.0).
fillpoint(r6, xy(192,380), 31.0).
fillpoint(r6, xy(201,380), 30.0).
fillpoint(r6, xy(165,463), 25.0).
fillpoint(r6, xy(224,404), 16.0).
fillpoint(r6, xy(194,434), 16.0).
fillpoint(r6, xy(229,440), 10.0).
region(r21, '#5a5a5a', 4400, centroid(440,620)).
perimeter(r21, 480).
polygon(r21, [xy(549,630),xy(330,630),xy(330,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(490,620),xy(339,620)]).
midline(r21, [xy(491,619),xy(540,620)]).
fillpoint(r21, xy(339,620), 10.0).
region(r20, '#2ecc40', 4000, centroid(230,620)).
perimeter(r20, 440).
polygon(r20, [xy(329,630),xy(130,630),xy(130,610),xy(329,610),xy(329,630)]).
midline(r20, [xy(301,620),xy(139,620)]).
midline(r20, [xy(302,619),xy(320,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r15, '#aaaaaa', 3800, centroid(314,528)).
perimeter(r15, 460).
polygon(r15, [xy(349,560),xy(280,559),xy(280,490),xy(289,490),xy(290,500),xy(339,500),xy(340,490),xy(350,490),xy(349,560)]).
hole(r15, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(330,519),xy(329,510),xy(320,510),xy(319,520),xy(310,520),xy(309,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(330,539)]).
midline(r15, [xy(339,542),xy(339,526),xy(324,524),xy(314,514),xy(314,515)]).
midline(r15, [xy(339,524),xy(340,512),xy(335,506),xy(329,504),xy(315,506),xy(302,504),xy(290,509),xy(285,503),xy(285,494)]).
midline(r15, [xy(315,507),xy(315,513)]).
midline(r15, [xy(339,509),xy(344,503),xy(345,494)]).
midline(r15, [xy(289,510),xy(290,535),xy(296,545),xy(304,549),xy(328,550),xy(337,548),xy(339,543)]).
fillpoint(r15, xy(295,544), 15.8).
fillpoint(r15, xy(337,548), 12.0).
fillpoint(r15, xy(339,525), 11.0).
fillpoint(r15, xy(290,534), 11.0).
fillpoint(r15, xy(339,544), 11.0).
fillpoint(r15, xy(305,549), 11.0).
fillpoint(r15, xy(334,549), 11.0).
fillpoint(r15, xy(289,519), 10.0).
fillpoint(r15, xy(339,514), 10.0).
fillpoint(r15, xy(339,535), 10.0).
fillpoint(r15, xy(311,550), 10.0).
fillpoint(r15, xy(315,506), 6.4).
fillpoint(r15, xy(285,496), 5.0).
fillpoint(r15, xy(345,496), 5.0).
fillpoint(r15, xy(301,505), 5.0).
fillpoint(r15, xy(321,505), 5.0).
fillpoint(r15, xy(315,513), 5.0).
fillpoint(r15, xy(324,525), 5.0).
region(r14, '#2ecc40', 2700, centroid(314,532)).
perimeter(r14, 560).
polygon(r14, [xy(359,570),xy(270,569),xy(270,480),xy(290,480),xy(290,489),xy(280,490),xy(280,560),xy(349,560),xy(350,490),xy(340,490),xy(340,480),xy(360,480),xy(359,570)]).
midline(r14, [xy(275,561),xy(275,485),xy(285,485)]).
midline(r14, [xy(275,562),xy(275,564),xy(281,565),xy(349,565),xy(354,563),xy(355,491),xy(353,485),xy(344,485)]).
fillpoint(r14, xy(276,485), 6.0).
fillpoint(r14, xy(354,485), 6.0).
fillpoint(r14, xy(275,564), 6.0).
fillpoint(r14, xy(353,564), 6.0).
fillpoint(r14, xy(281,485), 5.0).
fillpoint(r14, xy(344,485), 5.0).
fillpoint(r14, xy(274,525), 5.0).
fillpoint(r14, xy(354,525), 5.0).
fillpoint(r14, xy(281,565), 5.0).
region(r18, '#7fdbff', 2000, centroid(56,584)).
perimeter(r18, 240).
polygon(r18, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r18, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r18, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r18, xy(41,578), 12.0).
fillpoint(r18, xy(58,581), 12.0).
fillpoint(r18, xy(61,598), 12.0).
fillpoint(r18, xy(40,574), 11.0).
fillpoint(r18, xy(45,579), 11.0).
fillpoint(r18, xy(54,580), 11.0).
fillpoint(r18, xy(59,585), 11.0).
fillpoint(r18, xy(60,594), 11.0).
fillpoint(r18, xy(65,599), 11.0).
fillpoint(r18, xy(39,564), 10.0).
fillpoint(r18, xy(71,600), 10.0).
region(r13, '#870c25', 1500, centroid(314,484)).
perimeter(r13, 160).
polygon(r13, [xy(339,500),xy(290,500),xy(290,470),xy(339,470),xy(339,500)]).
midline(r13, [xy(316,484),xy(304,485)]).
midline(r13, [xy(317,485),xy(325,485)]).
fillpoint(r13, xy(304,485), 15.0).
region(r12, '#bebebe', 1000, centroid(314,460)).
perimeter(r12, 140).
polygon(r12, [xy(339,470),xy(290,470),xy(290,450),xy(339,450),xy(339,470)]).
midline(r12, [xy(320,460),xy(299,460)]).
midline(r12, [xy(321,459),xy(330,460)]).
fillpoint(r12, xy(299,460), 10.0).
region(r7, '#0074d9', 500, centroid(364,354)).
perimeter(r7, 120).
polygon(r7, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r7, [xy(359,354),xy(344,355)]).
midline(r7, [xy(360,355),xy(385,355)]).
fillpoint(r7, xy(344,355), 5.0).
region(r16, '#7fdbff', 500, centroid(312,526)).
perimeter(r16, 120).
polygon(r16, [xy(329,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r16, [xy(305,521),xy(305,514)]).
midline(r16, [xy(305,522),xy(305,524),xy(314,525),xy(315,534),xy(325,535)]).
fillpoint(r16, xy(305,524), 6.0).
fillpoint(r16, xy(314,525), 6.0).
fillpoint(r16, xy(315,534), 6.0).
fillpoint(r16, xy(305,516), 5.0).
fillpoint(r16, xy(321,535), 5.0).
region(r19, '#7fdbff', 400, centroid(80,560)).
perimeter(r19, 80).
polygon(r19, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r19, [xy(79,559),xy(80,560)]).
fillpoint(r19, xy(79,560), 10.0).
region(r22, '#7fdbff', 400, centroid(570,620)).
perimeter(r22, 80).
polygon(r22, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r22, [xy(569,619),xy(570,620)]).
fillpoint(r22, xy(569,620), 10.0).
region(r23, '#7fdbff', 400, centroid(600,620)).
perimeter(r23, 80).
polygon(r23, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r23, [xy(599,619),xy(600,620)]).
fillpoint(r23, xy(599,620), 10.0).
region(r24, '#2ecc40', 400, centroid(630,620)).
perimeter(r24, 80).
polygon(r24, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r24, [xy(629,619),xy(630,620)]).
fillpoint(r24, xy(629,620), 10.0).
border(r24).
region(r11, '#000000', 300, centroid(218,428)).
perimeter(r11, 80).
polygon(r11, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r11, [xy(215,431),xy(215,425),xy(225,425)]).
midline(r11, [xy(215,432),xy(215,435)]).
fillpoint(r11, xy(216,425), 6.0).
fillpoint(r11, xy(221,425), 5.0).
fillpoint(r11, xy(215,433), 5.0).
region(r9, '#000000', 100, centroid(204,414)).
perimeter(r9, 40).
polygon(r9, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r9, [xy(205,415),xy(205,414)]).
fillpoint(r9, xy(204,415), 5.0).
region(r17, '#7fdbff', 100, centroid(324,514)).
perimeter(r17, 40).
polygon(r17, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r17, [xy(325,515),xy(325,514)]).
fillpoint(r17, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 570).
adjacent(r1, r3).
shared_edge(r1, r3, 690).
adjacent(r1, r6).
shared_edge(r1, r6, 110).
adjacent(r1, r18).
shared_edge(r1, r18, 240).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 420).
adjacent(r1, r21).
shared_edge(r1, r21, 460).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 710).
adjacent(r2, r7).
shared_edge(r2, r7, 70).
adjacent(r2, r12).
shared_edge(r2, r12, 50).
adjacent(r3, r6).
shared_edge(r3, r6, 420).
adjacent(r3, r7).
shared_edge(r3, r7, 50).
adjacent(r3, r12).
shared_edge(r3, r12, 40).
adjacent(r3, r13).
shared_edge(r3, r13, 20).
adjacent(r3, r14).
shared_edge(r3, r14, 310).
adjacent(r6, r9).
shared_edge(r6, r9, 40).
adjacent(r6, r11).
shared_edge(r6, r11, 80).
adjacent(r12, r13).
shared_edge(r12, r13, 50).
adjacent(r13, r14).
shared_edge(r13, r14, 20).
adjacent(r13, r15).
shared_edge(r13, r15, 70).
adjacent(r14, r15).
shared_edge(r14, r15, 230).
adjacent(r15, r16).
shared_edge(r15, r16, 120).
adjacent(r15, r17).
shared_edge(r15, r17, 40).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r6, r9).
encloses(r6, r11).
encloses(r15, r16).
encloses(r15, r17).
encloses(r1, r18).
encloses(r1, r19).
encloses(r1, r22).
encloses(r1, r23).
