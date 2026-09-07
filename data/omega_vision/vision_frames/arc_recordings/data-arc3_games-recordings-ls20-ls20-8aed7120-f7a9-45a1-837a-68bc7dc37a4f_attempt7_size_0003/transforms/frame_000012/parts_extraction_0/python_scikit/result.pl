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

region(r1, '#aaaaaa', 281900, centroid(259,270)).
perimeter(r1, 5000).
polygon(r1, [xy(639,320),xy(630,320),xy(630,310),xy(620,309),xy(620,290),xy(610,290),xy(610,280),xy(600,280),xy(600,270),xy(590,270),xy(589,260),xy(570,260),xy(570,250),xy(560,250),xy(559,240),xy(540,240),xy(539,230),xy(500,230),xy(499,220),xy(420,220),xy(419,230),xy(380,230),xy(379,240),xy(360,240),xy(360,249),xy(350,250),xy(349,260),xy(330,260),xy(330,269),xy(320,270),xy(320,279),xy(310,280),xy(309,290),xy(300,290),xy(300,309),xy(290,310),xy(290,319),xy(280,320),xy(280,339),xy(270,340),xy(270,379),xy(260,380),xy(260,459),xy(270,460),xy(270,499),xy(279,500),xy(280,490),xy(350,490),xy(350,559),xy(320,560),xy(320,569),xy(329,570),xy(330,580),xy(349,580),xy(350,589),xy(359,590),xy(360,600),xy(559,600),xy(560,590),xy(569,590),xy(570,580),xy(589,580),xy(590,570),xy(599,570),xy(600,560),xy(610,559),xy(610,550),xy(620,549),xy(620,530),xy(629,530),xy(630,520),xy(639,520)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(330,519),xy(329,510),xy(320,510),xy(319,520),xy(310,520),xy(309,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(330,539)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(130,451),xy(130,358),xy(137,300),xy(150,242),xy(172,172),xy(236,146),xy(278,135)]).
midline(r1, [xy(279,133),xy(343,117),xy(373,115),xy(400,110),xy(499,109),xy(528,111),xy(542,133),xy(549,140),xy(537,153),xy(538,156),xy(551,143),xy(550,141)]).
midline(r1, [xy(143,279),xy(142,286),xy(145,285),xy(145,281)]).
midline(r1, [xy(141,288),xy(195,341),xy(144,288),xy(147,283),xy(149,285),xy(146,288),xy(150,286),xy(148,290),xy(152,288),xy(150,292),xy(154,290),xy(152,294),xy(156,292),xy(154,296),xy(158,294),xy(156,298),xy(160,296),xy(158,300),xy(162,298),xy(160,302),xy(164,300),xy(162,304),xy(166,302),xy(164,306),xy(168,304),xy(166,308),xy(170,306),xy(168,310),xy(172,308),xy(170,312),xy(174,310),xy(172,314),xy(176,312),xy(174,316),xy(178,314),xy(176,318),xy(180,316),xy(178,320),xy(182,318),xy(180,322),xy(184,320),xy(182,324),xy(186,322),xy(184,326),xy(188,324),xy(186,328),xy(190,326),xy(188,330),xy(192,328),xy(190,332),xy(194,330),xy(192,334),xy(196,332),xy(194,336),xy(198,334),xy(196,338),xy(201,337),xy(196,342)]).
midline(r1, [xy(552,143),xy(583,188),xy(598,220),xy(610,238),xy(612,247),xy(629,284),xy(629,300),xy(634,306),xy(635,315)]).
midline(r1, [xy(348,119),xy(382,153),xy(381,157),xy(383,157)]).
midline(r1, [xy(383,159),xy(382,161),xy(391,183),xy(390,186),xy(392,186)]).
midline(r1, [xy(392,188),xy(392,192),xy(394,192)]).
midline(r1, [xy(130,452),xy(130,479),xy(109,502),xy(90,528),xy(69,570),xy(71,571),xy(72,569)]).
midline(r1, [xy(131,479),xy(178,516),xy(196,497),xy(178,513)]).
midline(r1, [xy(72,572),xy(78,580),xy(77,582),xy(79,582)]).
midline(r1, [xy(79,584),xy(91,601),xy(120,630),xy(130,635),xy(553,634),xy(555,631),xy(555,607),xy(553,605),xy(360,605),xy(335,594),xy(323,594),xy(295,582),xy(276,566),xy(247,552),xy(221,544),xy(185,522),xy(180,517),xy(202,495),xy(182,517)]).
midline(r1, [xy(279,567),xy(282,565),xy(281,568)]).
midline(r1, [xy(284,566),xy(314,550),xy(335,549),xy(339,545),xy(339,525),xy(324,524),xy(314,514),xy(314,500),xy(302,499),xy(291,501),xy(280,519),xy(248,551)]).
midline(r1, [xy(555,633),xy(560,635),xy(579,635),xy(585,632),xy(584,594),xy(555,606)]).
midline(r1, [xy(586,595),xy(614,588),xy(615,632),xy(607,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(339,523),xy(340,512),xy(338,502),xy(329,499),xy(316,500)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(615,587),xy(629,555),xy(629,539),xy(634,533),xy(635,524)]).
midline(r1, [xy(224,351),xy(212,345),xy(202,344),xy(199,341),xy(202,338),xy(201,341),xy(205,341),xy(203,343)]).
midline(r1, [xy(209,344),xy(209,342),xy(206,342)]).
midline(r1, [xy(211,343),xy(216,344),xy(216,346)]).
midline(r1, [xy(218,346),xy(225,348),xy(226,351),xy(227,348)]).
midline(r1, [xy(229,350),xy(227,352)]).
midline(r1, [xy(230,353),xy(232,352),xy(239,357),xy(248,359),xy(247,361)]).
midline(r1, [xy(249,362),xy(250,361)]).
midline(r1, [xy(205,494),xy(205,496),xy(208,493),xy(208,495)]).
midline(r1, [xy(226,487),xy(222,490),xy(211,492),xy(211,494)]).
midline(r1, [xy(227,487),xy(226,489)]).
midline(r1, [xy(229,487),xy(234,484),xy(234,486)]).
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
fillpoint(r1, xy(130,478), 131.0).
fillpoint(r1, xy(292,129), 130.0).
fillpoint(r1, xy(129,420), 130.0).
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
fillpoint(r1, xy(403,110), 111.0).
fillpoint(r1, xy(516,110), 111.0).
fillpoint(r1, xy(421,110), 110.0).
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
midline(r2, [xy(515,509),xy(515,440),xy(523,420),xy(540,400),xy(537,376),xy(532,374),xy(422,375),xy(416,363),xy(411,330),xy(402,314),xy(387,297),xy(340,310),xy(317,331),xy(314,350),xy(315,462),xy(295,483),xy(275,485),xy(275,495)]).
midline(r2, [xy(315,465),xy(334,483),xy(354,485),xy(355,496),xy(354,563),xy(349,565),xy(324,565)]).
midline(r2, [xy(421,375),xy(415,391),xy(415,425)]).
midline(r2, [xy(515,510),xy(514,518),xy(503,523),xy(464,525)]).
midline(r2, [xy(515,518),xy(522,521),xy(546,544),xy(583,544),xy(585,539),xy(585,510),xy(583,505),xy(546,505),xy(524,521)]).
midline(r2, [xy(387,296),xy(395,279),xy(378,262),xy(396,278),xy(405,264),xy(403,262),xy(406,263),xy(425,243),xy(430,229)]).
midline(r2, [xy(536,374),xy(539,363),xy(540,300),xy(532,281),xy(523,269),xy(519,259),xy(496,235),xy(495,224)]).
midline(r2, [xy(518,257),xy(518,254),xy(520,254)]).
midline(r2, [xy(541,301),xy(545,297),xy(543,301)]).
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
midline(r4, [xy(609,472),xy(605,475),xy(564,475)]).
midline(r4, [xy(608,475),xy(613,486),xy(615,500),xy(605,523),xy(605,535),xy(600,544),xy(600,549),xy(589,560),xy(584,560),xy(575,565),xy(563,565),xy(538,576),xy(536,574),xy(442,575),xy(423,572),xy(410,566),xy(400,558),xy(400,490),xy(364,455),xy(365,384)]).
midline(r4, [xy(610,471),xy(615,448),xy(615,340),xy(605,316),xy(605,304),xy(600,295),xy(600,289),xy(595,283),xy(595,274)]).
midline(r4, [xy(401,490),xy(410,483),xy(426,476),xy(443,474),xy(465,475)]).
midline(r4, [xy(616,500),xy(618,499),xy(619,502),xy(620,500)]).
midline(r4, [xy(622,502),xy(621,503)]).
midline(r4, [xy(400,559),xy(377,580),xy(359,580),xy(355,576),xy(348,574),xy(334,575)]).
midline(r4, [xy(540,578),xy(541,577)]).
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
midline(r3, [xy(468,291),xy(465,281),xy(462,279),xy(459,281),xy(462,281)]).
midline(r3, [xy(469,292),xy(470,330)]).
midline(r3, [xy(465,279),xy(463,278)]).
midline(r3, [xy(464,276),xy(465,244)]).
fillpoint(r3, xy(465,262), 25.0).
fillpoint(r3, xy(469,293), 21.0).
fillpoint(r3, xy(469,316), 20.0).
region(r14, '#2ecc40', 4800, centroid(250,620)).
perimeter(r14, 520).
polygon(r14, [xy(369,630),xy(130,630),xy(130,610),xy(369,610),xy(369,630)]).
midline(r14, [xy(279,620),xy(139,620)]).
midline(r14, [xy(280,619),xy(360,620)]).
fillpoint(r14, xy(139,620), 10.0).
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
region(r15, '#5a5a5a', 3600, centroid(460,620)).
perimeter(r15, 400).
polygon(r15, [xy(549,630),xy(370,630),xy(370,610),xy(549,610),xy(549,630)]).
midline(r15, [xy(519,620),xy(379,620)]).
midline(r15, [xy(520,619),xy(540,620)]).
fillpoint(r15, xy(379,620), 10.0).
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
midline(r8, [xy(471,409),xy(480,410)]).
fillpoint(r8, xy(449,410), 10.0).
region(r12, '#5a5a5a', 800, centroid(564,524)).
perimeter(r12, 160).
polygon(r12, [xy(579,540),xy(550,539),xy(550,510),xy(580,510),xy(579,540)]).
hole(r12, [xy(570,529),xy(569,520),xy(560,520),xy(560,530),xy(570,529)]).
midline(r12, [xy(555,527),xy(555,534),xy(560,535),xy(573,534),xy(575,528),xy(574,516),xy(568,514),xy(555,515),xy(555,526)]).
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
midline(r5, [xy(445,311),xy(445,304)]).
midline(r5, [xy(444,312),xy(445,345)]).
fillpoint(r5, xy(444,325), 5.0).
region(r7, '#0074d9', 500, centroid(364,354)).
perimeter(r7, 120).
polygon(r7, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r7, [xy(359,354),xy(344,355)]).
midline(r7, [xy(360,355),xy(385,355)]).
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
region(r16, '#7fdbff', 400, centroid(570,620)).
perimeter(r16, 80).
polygon(r16, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r16, [xy(569,619),xy(570,620)]).
fillpoint(r16, xy(569,620), 10.0).
region(r17, '#7fdbff', 400, centroid(600,620)).
perimeter(r17, 80).
polygon(r17, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r17, [xy(599,619),xy(600,620)]).
fillpoint(r17, xy(599,620), 10.0).
region(r18, '#7fdbff', 400, centroid(630,620)).
perimeter(r18, 80).
polygon(r18, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r18, [xy(629,619),xy(630,620)]).
fillpoint(r18, xy(629,620), 10.0).
border(r18).
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
shared_edge(r1, r14, 500).
adjacent(r1, r15).
shared_edge(r1, r15, 380).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 60).
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
adjacent(r14, r15).
shared_edge(r14, r15, 20).

encloses(r1, r10).
encloses(r1, r11).
encloses(r12, r13).
encloses(r1, r16).
encloses(r1, r17).
