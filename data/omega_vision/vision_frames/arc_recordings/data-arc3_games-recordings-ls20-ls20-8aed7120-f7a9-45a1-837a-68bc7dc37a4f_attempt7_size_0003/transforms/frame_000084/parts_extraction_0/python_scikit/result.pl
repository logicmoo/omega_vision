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

region(r1, '#aaaaaa', 279500, centroid(261,268)).
perimeter(r1, 5320).
polygon(r1, [xy(639,320),xy(630,320),xy(630,310),xy(620,309),xy(620,290),xy(610,290),xy(610,280),xy(600,280),xy(600,270),xy(590,270),xy(589,260),xy(570,260),xy(570,250),xy(560,250),xy(559,240),xy(540,240),xy(539,230),xy(500,230),xy(499,220),xy(420,220),xy(419,230),xy(380,230),xy(379,240),xy(360,240),xy(360,249),xy(350,250),xy(349,260),xy(330,260),xy(330,269),xy(320,270),xy(320,279),xy(310,280),xy(309,290),xy(300,290),xy(300,309),xy(290,310),xy(290,319),xy(280,320),xy(280,339),xy(270,340),xy(270,379),xy(260,380),xy(260,459),xy(270,460),xy(270,499),xy(279,500),xy(280,490),xy(350,490),xy(350,559),xy(320,560),xy(320,569),xy(329,570),xy(330,580),xy(349,580),xy(350,589),xy(359,590),xy(360,600),xy(559,600),xy(560,590),xy(569,590),xy(570,580),xy(589,580),xy(590,570),xy(599,570),xy(600,560),xy(610,559),xy(610,550),xy(620,549),xy(620,530),xy(629,530),xy(630,520),xy(639,520)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(330,519),xy(329,510),xy(320,510),xy(319,520),xy(310,520),xy(309,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(330,539)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(429,635),xy(130,635),xy(120,630),xy(108,618),xy(96,624),xy(71,625),xy(61,623),xy(59,621),xy(60,600),xy(39,579),xy(20,580),xy(16,578),xy(14,553),xy(17,537),xy(30,519),xy(85,464),xy(119,439),xy(125,435),xy(125,437)]).
midline(r1, [xy(430,634),xy(553,634),xy(555,632),xy(555,608),xy(553,605),xy(361,605),xy(335,594),xy(330,595),xy(317,592),xy(295,582),xy(276,566),xy(247,552),xy(231,548),xy(209,538),xy(180,518),xy(169,508),xy(154,485),xy(130,434),xy(127,435)]).
midline(r1, [xy(278,567),xy(280,566),xy(280,568)]).
midline(r1, [xy(130,432),xy(130,358),xy(137,300),xy(150,242),xy(172,172),xy(248,142),xy(291,129),xy(343,117),xy(373,115),xy(400,110),xy(495,109),xy(528,111),xy(542,133),xy(550,141),xy(537,154),xy(536,163),xy(529,180),xy(530,182),xy(533,179),xy(534,173)]).
midline(r1, [xy(538,158),xy(538,157)]).
midline(r1, [xy(349,119),xy(381,151),xy(382,156),xy(380,158),xy(342,120)]).
midline(r1, [xy(141,289),xy(197,343)]).
midline(r1, [xy(16,580),xy(14,608),xy(17,622),xy(32,625),xy(59,623)]).
midline(r1, [xy(109,617),xy(110,602),xy(117,585),xy(147,550),xy(170,511)]).
midline(r1, [xy(145,273),xy(212,340),xy(210,341),xy(144,275)]).
midline(r1, [xy(213,341),xy(213,343),xy(210,343),xy(144,277)]).
midline(r1, [xy(551,142),xy(572,170),xy(590,200),xy(597,218),xy(611,240),xy(612,247),xy(629,284),xy(629,300),xy(634,306),xy(635,315)]).
midline(r1, [xy(555,633),xy(560,635),xy(578,635),xy(585,632),xy(585,597),xy(583,595),xy(555,606)]).
midline(r1, [xy(584,594),xy(596,594),xy(615,587),xy(615,632),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(333,121),xy(381,169),xy(384,165),xy(381,159),xy(383,159)]).
midline(r1, [xy(385,166),xy(382,170),xy(385,175),xy(387,173),xy(385,169)]).
midline(r1, [xy(388,174),xy(386,176)]).
midline(r1, [xy(389,177),xy(387,179),xy(388,182),xy(400,205),xy(399,208),xy(401,207)]).
midline(r1, [xy(391,184),xy(389,179)]).
midline(r1, [xy(402,209),xy(401,210)]).
midline(r1, [xy(177,514),xy(193,498),xy(195,499),xy(180,516),xy(197,497),xy(204,494),xy(206,495),xy(202,497)]).
midline(r1, [xy(248,551),xy(280,519),xy(291,501),xy(294,500),xy(314,500),xy(314,515),xy(315,515),xy(324,525),xy(337,525),xy(340,519),xy(338,502),xy(329,499),xy(316,500)]).
midline(r1, [xy(339,525),xy(340,537),xy(337,548),xy(314,550),xy(289,562),xy(285,566),xy(283,565),xy(283,567)]).
midline(r1, [xy(289,564),xy(293,562)]).
midline(r1, [xy(143,283),xy(203,342),xy(199,343)]).
midline(r1, [xy(203,344),xy(207,342),xy(204,341)]).
midline(r1, [xy(208,343),xy(206,345)]).
midline(r1, [xy(208,346),xy(212,346),xy(215,342)]).
midline(r1, [xy(616,586),xy(629,555),xy(629,539),xy(634,533),xy(635,524)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(216,347),xy(214,346),xy(215,348)]).
midline(r1, [xy(217,348),xy(217,344),xy(225,351),xy(234,353),xy(234,355)]).
midline(r1, [xy(231,488),xy(211,492),xy(208,495)]).
midline(r1, [xy(222,491),xy(229,489)]).
midline(r1, [xy(218,492),xy(217,493)]).
midline(r1, [xy(230,486),xy(232,485),xy(232,487)]).
midline(r1, [xy(237,354),xy(238,355)]).
fillpoint(r1, xy(173,172), 173.0).
fillpoint(r1, xy(162,203), 163.0).
fillpoint(r1, xy(160,210), 161.0).
fillpoint(r1, xy(159,214), 160.0).
fillpoint(r1, xy(158,218), 159.0).
fillpoint(r1, xy(152,236), 153.0).
fillpoint(r1, xy(150,243), 151.0).
fillpoint(r1, xy(147,255), 148.0).
fillpoint(r1, xy(237,146), 147.0).
fillpoint(r1, xy(146,259), 147.0).
fillpoint(r1, xy(240,145), 146.0).
fillpoint(r1, xy(145,264), 146.0).
fillpoint(r1, xy(243,144), 145.0).
fillpoint(r1, xy(144,268), 145.0).
fillpoint(r1, xy(246,143), 144.0).
fillpoint(r1, xy(143,272), 144.0).
fillpoint(r1, xy(249,142), 143.0).
fillpoint(r1, xy(142,276), 143.0).
fillpoint(r1, xy(141,280), 142.0).
fillpoint(r1, xy(140,285), 141.0).
fillpoint(r1, xy(259,139), 140.0).
fillpoint(r1, xy(139,290), 140.0).
fillpoint(r1, xy(263,138), 139.0).
fillpoint(r1, xy(138,296), 139.0).
fillpoint(r1, xy(267,137), 138.0).
fillpoint(r1, xy(137,302), 138.0).
fillpoint(r1, xy(136,310), 137.0).
fillpoint(r1, xy(135,321), 136.0).
fillpoint(r1, xy(134,331), 135.0).
fillpoint(r1, xy(133,337), 134.0).
fillpoint(r1, xy(132,343), 133.0).
fillpoint(r1, xy(131,351), 132.0).
fillpoint(r1, xy(130,361), 131.0).
fillpoint(r1, xy(292,129), 130.0).
fillpoint(r1, xy(129,408), 130.0).
fillpoint(r1, xy(304,126), 127.0).
fillpoint(r1, xy(308,125), 126.0).
fillpoint(r1, xy(313,124), 125.0).
fillpoint(r1, xy(317,123), 124.0).
fillpoint(r1, xy(321,122), 123.0).
fillpoint(r1, xy(325,121), 122.0).
fillpoint(r1, xy(329,120), 121.0).
fillpoint(r1, xy(334,119), 120.0).
fillpoint(r1, xy(339,118), 119.0).
fillpoint(r1, xy(345,117), 118.0).
fillpoint(r1, xy(352,116), 117.0).
fillpoint(r1, xy(362,115), 116.0).
fillpoint(r1, xy(375,114), 115.0).
fillpoint(r1, xy(380,113), 114.0).
fillpoint(r1, xy(386,112), 113.0).
fillpoint(r1, xy(393,111), 112.0).
fillpoint(r1, xy(527,111), 112.0).
fillpoint(r1, xy(149,472), 111.7).
fillpoint(r1, xy(403,110), 111.0).
fillpoint(r1, xy(516,110), 111.0).
fillpoint(r1, xy(421,110), 110.0).
fillpoint(r1, xy(163,497), 103.9).
fillpoint(r1, xy(165,500), 103.3).
fillpoint(r1, xy(167,503), 102.8).
fillpoint(r1, xy(168,505), 102.2).
fillpoint(r1, xy(232,548), 62.0).
fillpoint(r1, xy(235,549), 61.0).
fillpoint(r1, xy(238,550), 60.0).
fillpoint(r1, xy(242,551), 59.0).
fillpoint(r1, xy(246,552), 58.0).
fillpoint(r1, xy(595,213), 45.0).
fillpoint(r1, xy(273,565), 45.0).
border(r1).
region(r2, '#2ecc40', 61200, centroid(450,376)).
perimeter(r2, 2540).
polygon(r2, [xy(359,570),xy(320,569),xy(320,560),xy(350,559),xy(349,490),xy(280,490),xy(279,500),xy(270,499),xy(270,480),xy(290,479),xy(290,310),xy(300,309),xy(300,290),xy(309,290),xy(310,280),xy(319,280),xy(320,270),xy(329,270),xy(330,260),xy(349,260),xy(350,250),xy(359,250),xy(360,240),xy(379,240),xy(380,230),xy(419,230),xy(420,220),xy(439,220),xy(440,349),xy(489,350),xy(490,220),xy(499,220),xy(500,230),xy(539,230),xy(540,240),xy(559,240),xy(560,249),xy(569,250),xy(570,260),xy(589,260),xy(590,449),xy(540,450),xy(540,499),xy(589,500),xy(590,549),xy(440,550),xy(440,500),xy(490,499),xy(490,400),xy(440,400),xy(440,449),xy(390,450),xy(390,350),xy(340,350),xy(340,479),xy(360,480),xy(359,570)]).
hole(r2, [xy(580,539),xy(579,510),xy(550,510),xy(550,540),xy(580,539)]).
midline(r2, [xy(343,564),xy(324,565)]).
midline(r2, [xy(344,564),xy(353,564),xy(355,559),xy(354,486),xy(334,483),xy(314,465),xy(295,483),xy(275,485),xy(275,495)]).
midline(r2, [xy(315,464),xy(315,340),xy(317,332),xy(330,319),xy(321,309),xy(332,317),xy(340,310),xy(367,303),xy(349,281),xy(370,302),xy(386,297),xy(390,287),xy(405,264),xy(400,256),xy(404,258),xy(406,263)]).
midline(r2, [xy(387,297),xy(406,320),xy(414,340),xy(415,359),xy(421,374),xy(415,390),xy(415,425)]).
midline(r2, [xy(422,374),xy(536,374),xy(537,376),xy(540,400),xy(523,420),xy(515,441),xy(515,516),xy(511,520),xy(498,524),xy(464,525)]).
midline(r2, [xy(537,373),xy(540,347),xy(539,302),xy(541,300),xy(518,258),xy(496,235),xy(495,224)]).
midline(r2, [xy(515,518),xy(522,521),xy(546,544),xy(578,545),xy(583,544),xy(585,538),xy(585,511),xy(583,505),xy(546,505),xy(529,518),xy(523,520)]).
midline(r2, [xy(542,299),xy(548,295),xy(547,298)]).
midline(r2, [xy(408,261),xy(425,243),xy(430,229)]).
fillpoint(r2, xy(536,375), 53.2).
fillpoint(r2, xy(386,297), 53.0).
fillpoint(r2, xy(537,372), 53.0).
fillpoint(r2, xy(537,377), 53.0).
fillpoint(r2, xy(538,368), 52.0).
fillpoint(r2, xy(538,382), 52.0).
fillpoint(r2, xy(539,361), 51.0).
fillpoint(r2, xy(539,388), 51.0).
fillpoint(r2, xy(539,324), 50.0).
fillpoint(r2, xy(378,300), 50.0).
fillpoint(r2, xy(371,302), 48.0).
fillpoint(r2, xy(366,303), 47.0).
fillpoint(r2, xy(360,304), 46.0).
fillpoint(r2, xy(534,286), 45.0).
fillpoint(r2, xy(356,305), 45.0).
fillpoint(r2, xy(421,375), 31.4).
fillpoint(r2, xy(515,518), 31.4).
fillpoint(r2, xy(518,258), 29.0).
fillpoint(r2, xy(319,330), 29.0).
fillpoint(r2, xy(318,331), 29.0).
fillpoint(r2, xy(411,331), 29.0).
fillpoint(r2, xy(418,368), 29.0).
fillpoint(r2, xy(418,381), 29.0).
fillpoint(r2, xy(518,431), 29.0).
fillpoint(r2, xy(508,521), 29.0).
fillpoint(r2, xy(521,521), 29.0).
fillpoint(r2, xy(317,334), 28.0).
fillpoint(r2, xy(412,334), 28.0).
fillpoint(r2, xy(417,365), 28.0).
fillpoint(r2, xy(417,384), 28.0).
fillpoint(r2, xy(517,434), 28.0).
fillpoint(r2, xy(505,522), 28.0).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(413,337), 27.0).
fillpoint(r2, xy(416,362), 27.0).
fillpoint(r2, xy(416,387), 27.0).
fillpoint(r2, xy(516,437), 27.0).
fillpoint(r2, xy(502,523), 27.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(414,342), 26.0).
fillpoint(r2, xy(415,358), 26.0).
fillpoint(r2, xy(415,392), 26.0).
fillpoint(r2, xy(515,442), 26.0).
fillpoint(r2, xy(498,524), 26.0).
fillpoint(r2, xy(315,408), 25.0).
fillpoint(r2, xy(441,375), 25.0).
fillpoint(r2, xy(415,413), 25.0).
fillpoint(r2, xy(514,475), 25.0).
fillpoint(r2, xy(464,525), 25.0).
region(r4, '#ffdc00', 42100, centroid(490,482)).
perimeter(r4, 1900).
polygon(r4, [xy(639,520),xy(630,520),xy(630,529),xy(620,530),xy(620,549),xy(610,550),xy(610,559),xy(600,560),xy(600,569),xy(590,570),xy(589,580),xy(570,580),xy(570,589),xy(560,590),xy(559,600),xy(360,600),xy(360,590),xy(350,589),xy(349,580),xy(330,579),xy(330,570),xy(360,569),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,550),xy(589,550),xy(590,500),xy(540,500),xy(540,450),xy(590,449),xy(590,270),xy(599,270),xy(600,279),xy(609,280),xy(610,290),xy(620,290),xy(620,309),xy(629,310),xy(630,320),xy(639,320)]).
midline(r4, [xy(609,472),xy(607,475),xy(564,475)]).
midline(r4, [xy(608,475),xy(613,486),xy(615,500),xy(605,523),xy(605,535),xy(600,544),xy(600,549),xy(589,560),xy(584,560),xy(575,565),xy(563,565),xy(540,575),xy(440,575),xy(423,572),xy(400,558),xy(400,490),xy(364,455),xy(365,384)]).
midline(r4, [xy(610,471),xy(615,446),xy(615,339),xy(605,316),xy(605,304),xy(600,295),xy(600,289),xy(595,283),xy(595,274)]).
midline(r4, [xy(401,490),xy(412,482),xy(430,475),xy(465,475)]).
midline(r4, [xy(400,559),xy(375,580),xy(359,580),xy(355,576),xy(347,574),xy(334,575)]).
fillpoint(r4, xy(400,491), 41.0).
fillpoint(r4, xy(400,559), 41.0).
fillpoint(r4, xy(399,525), 40.0).
fillpoint(r4, xy(608,475), 31.4).
fillpoint(r4, xy(611,468), 29.0).
fillpoint(r4, xy(421,478), 29.0).
fillpoint(r4, xy(611,481), 29.0).
fillpoint(r4, xy(421,571), 29.0).
fillpoint(r4, xy(612,465), 28.0).
fillpoint(r4, xy(424,477), 28.0).
fillpoint(r4, xy(612,484), 28.0).
fillpoint(r4, xy(424,572), 28.0).
fillpoint(r4, xy(613,462), 27.0).
fillpoint(r4, xy(427,476), 27.0).
fillpoint(r4, xy(613,487), 27.0).
fillpoint(r4, xy(427,573), 27.0).
fillpoint(r4, xy(614,458), 26.0).
fillpoint(r4, xy(432,475), 26.0).
fillpoint(r4, xy(614,492), 26.0).
fillpoint(r4, xy(432,574), 26.0).
fillpoint(r4, xy(365,455), 25.7).
fillpoint(r4, xy(614,394), 25.0).
fillpoint(r4, xy(365,416), 25.0).
fillpoint(r4, xy(441,475), 25.0).
fillpoint(r4, xy(564,475), 25.0).
fillpoint(r4, xy(441,575), 25.0).
fillpoint(r4, xy(605,315), 16.0).
fillpoint(r4, xy(605,524), 16.0).
fillpoint(r4, xy(564,565), 16.0).
fillpoint(r4, xy(604,306), 15.0).
fillpoint(r4, xy(605,533), 15.0).
fillpoint(r4, xy(576,564), 15.0).
fillpoint(r4, xy(600,294), 11.0).
fillpoint(r4, xy(600,545), 11.0).
fillpoint(r4, xy(585,560), 11.0).
border(r4).
region(r3, '#ffdc00', 6000, centroid(466,281)).
perimeter(r3, 360).
polygon(r3, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,220),xy(490,220),xy(489,350)]).
midline(r3, [xy(468,291),xy(465,280),xy(463,278),xy(461,280),xy(463,280)]).
midline(r3, [xy(469,292),xy(470,330)]).
midline(r3, [xy(465,278),xy(465,244)]).
fillpoint(r3, xy(465,262), 25.0).
fillpoint(r3, xy(469,293), 21.0).
fillpoint(r3, xy(469,316), 20.0).
region(r17, '#5a5a5a', 6000, centroid(400,620)).
perimeter(r17, 640).
polygon(r17, [xy(549,630),xy(250,630),xy(250,610),xy(549,610),xy(549,630)]).
midline(r17, [xy(424,619),xy(259,620)]).
midline(r17, [xy(425,620),xy(540,620)]).
fillpoint(r17, xy(259,620), 10.0).
region(r6, '#ffdc00', 3800, centroid(277,407)).
perimeter(r6, 380).
polygon(r6, [xy(289,480),xy(270,480),xy(270,460),xy(260,459),xy(260,380),xy(270,379),xy(270,340),xy(280,339),xy(280,320),xy(290,320),xy(289,480)]).
midline(r6, [xy(284,342),xy(285,324)]).
midline(r6, [xy(284,343),xy(279,349),xy(280,379),xy(274,394),xy(274,445),xy(279,454),xy(280,470)]).
fillpoint(r6, xy(274,420), 15.0).
fillpoint(r6, xy(279,384), 11.0).
fillpoint(r6, xy(279,455), 11.0).
fillpoint(r6, xy(279,364), 10.0).
fillpoint(r6, xy(279,466), 10.0).
fillpoint(r6, xy(285,331), 5.0).
region(r16, '#2ecc40', 2400, centroid(190,620)).
perimeter(r16, 280).
polygon(r16, [xy(249,630),xy(130,630),xy(130,610),xy(249,610),xy(249,630)]).
midline(r16, [xy(151,620),xy(139,620)]).
midline(r16, [xy(152,620),xy(240,620)]).
fillpoint(r16, xy(139,620), 10.0).
region(r14, '#7fdbff', 2000, centroid(64,576)).
perimeter(r14, 240).
polygon(r14, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r14, [xy(51,560),xy(39,560)]).
midline(r14, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r14, xy(58,561), 12.0).
fillpoint(r14, xy(61,578), 12.0).
fillpoint(r14, xy(78,581), 12.0).
fillpoint(r14, xy(54,560), 11.0).
fillpoint(r14, xy(59,565), 11.0).
fillpoint(r14, xy(60,574), 11.0).
fillpoint(r14, xy(65,579), 11.0).
fillpoint(r14, xy(74,580), 11.0).
fillpoint(r14, xy(79,585), 11.0).
fillpoint(r14, xy(39,560), 10.0).
fillpoint(r14, xy(79,596), 10.0).
region(r9, '#870c25', 1500, centroid(464,434)).
perimeter(r9, 160).
polygon(r9, [xy(489,450),xy(440,450),xy(440,420),xy(489,420),xy(489,450)]).
midline(r9, [xy(466,434),xy(454,435)]).
midline(r9, [xy(467,435),xy(475,435)]).
fillpoint(r9, xy(454,435), 15.0).
region(r8, '#bebebe', 1000, centroid(464,410)).
perimeter(r8, 140).
polygon(r8, [xy(489,420),xy(440,420),xy(440,400),xy(489,400),xy(489,420)]).
midline(r8, [xy(470,410),xy(449,410)]).
midline(r8, [xy(471,410),xy(480,410)]).
fillpoint(r8, xy(449,410), 10.0).
region(r12, '#5a5a5a', 800, centroid(564,524)).
perimeter(r12, 160).
polygon(r12, [xy(579,540),xy(550,539),xy(550,510),xy(580,510),xy(579,540)]).
hole(r12, [xy(570,529),xy(569,520),xy(560,520),xy(560,530),xy(570,529)]).
midline(r12, [xy(574,532),xy(575,520),xy(573,515),xy(555,515),xy(554,521),xy(555,534),xy(574,534)]).
fillpoint(r12, xy(556,515), 6.0).
fillpoint(r12, xy(574,515), 6.0).
fillpoint(r12, xy(555,534), 6.0).
fillpoint(r12, xy(573,534), 6.0).
fillpoint(r12, xy(561,515), 5.0).
fillpoint(r12, xy(554,525), 5.0).
fillpoint(r12, xy(574,525), 5.0).
fillpoint(r12, xy(561,535), 5.0).
region(r5, '#0074d9', 500, centroid(444,324)).
perimeter(r5, 120).
polygon(r5, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r5, [xy(445,311),xy(445,345)]).
midline(r5, [xy(445,310),xy(445,304)]).
fillpoint(r5, xy(444,325), 5.0).
region(r7, '#0074d9', 500, centroid(364,354)).
perimeter(r7, 120).
polygon(r7, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r7, [xy(361,354),xy(344,355)]).
midline(r7, [xy(362,354),xy(385,355)]).
fillpoint(r7, xy(344,355), 5.0).
region(r10, '#7fdbff', 500, centroid(312,526)).
perimeter(r10, 120).
polygon(r10, [xy(329,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r10, [xy(305,521),xy(305,514)]).
midline(r10, [xy(305,522),xy(305,524),xy(314,525),xy(315,534),xy(325,535)]).
fillpoint(r10, xy(305,524), 6.0).
fillpoint(r10, xy(314,525), 6.0).
fillpoint(r10, xy(315,534), 6.0).
fillpoint(r10, xy(305,516), 5.0).
fillpoint(r10, xy(321,535), 5.0).
region(r15, '#7fdbff', 400, centroid(40,600)).
perimeter(r15, 80).
polygon(r15, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r15, [xy(39,599),xy(40,600)]).
fillpoint(r15, xy(39,600), 10.0).
region(r18, '#7fdbff', 400, centroid(570,620)).
perimeter(r18, 80).
polygon(r18, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r18, [xy(569,619),xy(570,620)]).
fillpoint(r18, xy(569,620), 10.0).
region(r19, '#7fdbff', 400, centroid(600,620)).
perimeter(r19, 80).
polygon(r19, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r19, [xy(599,619),xy(600,620)]).
fillpoint(r19, xy(599,620), 10.0).
region(r20, '#2ecc40', 400, centroid(630,620)).
perimeter(r20, 80).
polygon(r20, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r20, [xy(629,619),xy(630,620)]).
fillpoint(r20, xy(629,620), 10.0).
border(r20).
region(r11, '#7fdbff', 100, centroid(324,514)).
perimeter(r11, 40).
polygon(r11, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r11, [xy(325,515),xy(325,514)]).
fillpoint(r11, xy(324,515), 5.0).
region(r13, '#2ecc40', 100, centroid(564,524)).
perimeter(r13, 40).
polygon(r13, [xy(569,530),xy(560,529),xy(560,520),xy(570,520),xy(569,530)]).
midline(r13, [xy(565,525),xy(565,524)]).
fillpoint(r13, xy(564,525), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 630).
adjacent(r1, r3).
shared_edge(r1, r3, 50).
adjacent(r1, r4).
shared_edge(r1, r4, 520).
adjacent(r1, r6).
shared_edge(r1, r6, 200).
adjacent(r1, r10).
shared_edge(r1, r10, 120).
adjacent(r1, r11).
shared_edge(r1, r11, 40).
adjacent(r1, r14).
shared_edge(r1, r14, 240).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 260).
adjacent(r1, r17).
shared_edge(r1, r17, 620).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 250).
adjacent(r2, r4).
shared_edge(r2, r4, 1080).
adjacent(r2, r5).
shared_edge(r2, r5, 60).
adjacent(r2, r6).
shared_edge(r2, r6, 180).
adjacent(r2, r7).
shared_edge(r2, r7, 70).
adjacent(r2, r8).
shared_edge(r2, r8, 90).
adjacent(r2, r9).
shared_edge(r2, r9, 60).
adjacent(r2, r12).
shared_edge(r2, r12, 120).
adjacent(r3, r5).
shared_edge(r3, r5, 60).
adjacent(r4, r7).
shared_edge(r4, r7, 50).
adjacent(r4, r9).
shared_edge(r4, r9, 50).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r12, r13).
shared_edge(r12, r13, 40).
adjacent(r16, r17).
shared_edge(r16, r17, 20).

encloses(r1, r10).
encloses(r1, r11).
encloses(r12, r13).
encloses(r1, r14).
encloses(r1, r15).
encloses(r1, r18).
encloses(r1, r19).
