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
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(330,519),xy(329,510),xy(320,510),xy(319,520),xy(310,520),xy(309,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(330,539)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(216,491),xy(199,498),xy(193,497),xy(177,513),xy(173,501),xy(149,456),xy(129,426),xy(103,446),xy(30,519),xy(19,533),xy(14,550),xy(15,596),xy(19,606),xy(27,616),xy(37,622),xy(53,625),xy(96,624),xy(109,617),xy(111,598),xy(119,580),xy(80,580),xy(59,559),xy(59,560)]).
midline(r1, [xy(217,490),xy(217,492)]).
midline(r1, [xy(219,491),xy(234,484),xy(234,488),xy(237,483),xy(243,480),xy(238,485)]).
midline(r1, [xy(193,499),xy(177,515),xy(174,522),xy(160,539),xy(120,579)]).
midline(r1, [xy(245,480),xy(249,477),xy(249,479)]).
midline(r1, [xy(60,491),xy(60,558)]).
midline(r1, [xy(238,487),xy(236,488)]).
midline(r1, [xy(109,619),xy(120,630),xy(130,635),xy(549,635),xy(555,632),xy(555,610),xy(554,606),xy(549,604),xy(361,605),xy(335,594),xy(323,594),xy(300,585),xy(274,565),xy(260,560),xy(247,552),xy(231,548),xy(209,538),xy(179,517)]).
midline(r1, [xy(278,567),xy(281,566),xy(281,569)]).
midline(r1, [xy(282,565),xy(286,565),xy(283,567)]).
midline(r1, [xy(287,564),xy(293,560),xy(293,562)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,632),xy(585,598),xy(583,595),xy(555,606)]).
midline(r1, [xy(584,594),xy(596,594),xy(615,587),xy(614,633),xy(607,635),xy(585,633)]).
midline(r1, [xy(295,560),xy(314,550),xy(335,549),xy(339,545),xy(339,525),xy(325,525),xy(314,514),xy(314,515)]).
midline(r1, [xy(315,513),xy(315,503),xy(313,500),xy(291,501),xy(285,513),xy(248,551)]).
midline(r1, [xy(315,500),xy(329,499),xy(338,501),xy(340,510),xy(339,523)]).
midline(r1, [xy(130,425),xy(130,358),xy(137,300),xy(150,242),xy(172,172),xy(236,146),xy(291,129),xy(343,117),xy(373,115),xy(400,110),xy(496,109),xy(528,111),xy(548,139),xy(537,153),xy(550,142),xy(549,140)]).
midline(r1, [xy(142,287),xy(196,341),xy(193,342),xy(141,290)]).
midline(r1, [xy(347,119),xy(382,154),xy(381,159),xy(383,159)]).
midline(r1, [xy(141,292),xy(190,341)]).
midline(r1, [xy(197,342),xy(203,344),xy(205,342),xy(204,345)]).
midline(r1, [xy(207,344),xy(216,348),xy(218,346),xy(220,348),xy(217,349)]).
midline(r1, [xy(220,350),xy(226,348),xy(224,351)]).
midline(r1, [xy(616,586),xy(629,555),xy(629,539),xy(634,533),xy(635,524)]).
midline(r1, [xy(226,352),xy(228,350),xy(230,352)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(383,161),xy(381,166),xy(383,168),xy(384,165)]).
midline(r1, [xy(604,227),xy(601,225),xy(588,240),xy(601,227)]).
midline(r1, [xy(602,224),xy(570,167),xy(551,143),xy(535,161),xy(532,177),xy(518,208),xy(520,208)]).
midline(r1, [xy(536,165),xy(537,161),xy(553,147)]).
midline(r1, [xy(539,157),xy(551,145)]).
midline(r1, [xy(533,175),xy(534,174)]).
midline(r1, [xy(535,169),xy(535,168)]).
midline(r1, [xy(604,228),xy(629,284),xy(629,300),xy(634,306),xy(635,315)]).
midline(r1, [xy(159,221),xy(258,320)]).
midline(r1, [xy(388,174),xy(384,169),xy(386,169)]).
midline(r1, [xy(388,175),xy(387,177),xy(394,192),xy(393,195),xy(395,195)]).
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
fillpoint(r1, xy(129,404), 130.0).
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
fillpoint(r1, xy(162,481), 100.4).
fillpoint(r1, xy(163,483), 99.8).
fillpoint(r1, xy(164,485), 99.2).
fillpoint(r1, xy(169,494), 97.5).
fillpoint(r1, xy(170,496), 97.3).
fillpoint(r1, xy(171,498), 97.1).
fillpoint(r1, xy(172,500), 96.9).
fillpoint(r1, xy(173,502), 96.7).
fillpoint(r1, xy(174,505), 96.2).
fillpoint(r1, xy(175,508), 95.4).
fillpoint(r1, xy(176,512), 94.9).
fillpoint(r1, xy(177,515), 94.4).
fillpoint(r1, xy(232,548), 62.0).
fillpoint(r1, xy(235,549), 61.0).
fillpoint(r1, xy(238,550), 60.0).
fillpoint(r1, xy(242,551), 59.0).
fillpoint(r1, xy(246,552), 58.0).
fillpoint(r1, xy(595,213), 45.0).
fillpoint(r1, xy(273,565), 45.0).
border(r1).
region(r2, '#2ecc40', 61600, centroid(451,379)).
perimeter(r2, 2540).
polygon(r2, [xy(359,570),xy(320,569),xy(320,560),xy(350,559),xy(349,490),xy(280,490),xy(279,500),xy(270,499),xy(270,480),xy(290,479),xy(290,310),xy(300,309),xy(300,290),xy(309,290),xy(310,280),xy(319,280),xy(320,270),xy(329,270),xy(330,260),xy(349,260),xy(350,250),xy(359,250),xy(360,240),xy(379,240),xy(380,230),xy(419,230),xy(420,220),xy(439,220),xy(440,349),xy(489,350),xy(490,220),xy(499,220),xy(500,230),xy(539,230),xy(540,240),xy(559,240),xy(560,249),xy(569,250),xy(570,260),xy(589,260),xy(590,449),xy(540,450),xy(540,499),xy(589,500),xy(590,549),xy(440,550),xy(440,500),xy(490,499),xy(490,400),xy(440,400),xy(440,449),xy(390,450),xy(390,350),xy(340,350),xy(340,479),xy(360,480),xy(359,570)]).
hole(r2, [xy(570,339),xy(570,330),xy(580,329),xy(580,320),xy(570,320),xy(569,310),xy(560,310),xy(560,319),xy(550,320),xy(550,329),xy(559,330),xy(560,340),xy(570,339)]).
midline(r2, [xy(355,556),xy(353,564),xy(324,565)]).
midline(r2, [xy(355,555),xy(355,490),xy(353,485),xy(334,483),xy(314,465),xy(295,483),xy(275,485),xy(275,495)]).
midline(r2, [xy(315,464),xy(314,351),xy(317,331),xy(340,310),xy(342,311),xy(358,304),xy(386,297),xy(405,263),xy(400,256),xy(406,262),xy(408,261),xy(425,243),xy(430,229)]).
midline(r2, [xy(387,297),xy(406,320),xy(414,340),xy(415,359),xy(421,374),xy(415,391),xy(415,425)]).
midline(r2, [xy(422,374),xy(529,374),xy(520,339),xy(519,322),xy(521,305),xy(531,280),xy(519,259),xy(496,235),xy(495,224)]).
midline(r2, [xy(532,280),xy(540,279),xy(565,284),xy(579,304),xy(579,310),xy(585,320),xy(585,329),xy(579,339),xy(579,345),xy(575,353),xy(546,382),xy(539,386),xy(529,375)]).
midline(r2, [xy(539,387),xy(540,400),xy(523,420),xy(515,440),xy(514,518),xy(498,524),xy(464,525)]).
midline(r2, [xy(515,518),xy(531,524),xy(565,525)]).
midline(r2, [xy(533,269),xy(532,270)]).
midline(r2, [xy(541,259),xy(533,267),xy(542,260)]).
fillpoint(r2, xy(386,297), 53.0).
fillpoint(r2, xy(539,388), 51.0).
fillpoint(r2, xy(378,300), 50.0).
fillpoint(r2, xy(371,302), 48.0).
fillpoint(r2, xy(366,303), 47.0).
fillpoint(r2, xy(360,304), 46.0).
fillpoint(r2, xy(356,305), 45.0).
fillpoint(r2, xy(531,280), 41.7).
fillpoint(r2, xy(521,306), 32.0).
fillpoint(r2, xy(521,343), 32.0).
fillpoint(r2, xy(421,375), 31.4).
fillpoint(r2, xy(515,518), 31.4).
fillpoint(r2, xy(520,312), 31.0).
fillpoint(r2, xy(520,338), 31.0).
fillpoint(r2, xy(519,325), 30.0).
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
fillpoint(r2, xy(524,522), 28.0).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(413,337), 27.0).
fillpoint(r2, xy(416,362), 27.0).
fillpoint(r2, xy(416,387), 27.0).
fillpoint(r2, xy(516,437), 27.0).
fillpoint(r2, xy(502,523), 27.0).
fillpoint(r2, xy(527,523), 27.0).
fillpoint(r2, xy(562,284), 26.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(414,342), 26.0).
fillpoint(r2, xy(415,358), 26.0).
fillpoint(r2, xy(415,392), 26.0).
fillpoint(r2, xy(515,442), 26.0).
fillpoint(r2, xy(498,524), 26.0).
fillpoint(r2, xy(532,524), 26.0).
fillpoint(r2, xy(315,408), 25.0).
fillpoint(r2, xy(441,375), 25.0).
fillpoint(r2, xy(415,413), 25.0).
fillpoint(r2, xy(514,475), 25.0).
fillpoint(r2, xy(464,525), 25.0).
fillpoint(r2, xy(541,525), 25.0).
region(r4, '#ffdc00', 42100, centroid(490,482)).
perimeter(r4, 1900).
polygon(r4, [xy(639,520),xy(630,520),xy(630,529),xy(620,530),xy(620,549),xy(610,550),xy(610,559),xy(600,560),xy(600,569),xy(590,570),xy(589,580),xy(570,580),xy(570,589),xy(560,590),xy(559,600),xy(360,600),xy(360,590),xy(350,589),xy(349,580),xy(330,579),xy(330,570),xy(360,569),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,550),xy(589,550),xy(590,500),xy(540,500),xy(540,450),xy(590,449),xy(590,270),xy(599,270),xy(600,279),xy(609,280),xy(610,290),xy(620,290),xy(620,309),xy(629,310),xy(630,320),xy(639,320)]).
midline(r4, [xy(609,472),xy(607,475),xy(564,475)]).
midline(r4, [xy(608,475),xy(613,486),xy(615,500),xy(605,523),xy(605,535),xy(600,544),xy(600,549),xy(589,560),xy(584,560),xy(575,565),xy(563,565),xy(540,575),xy(440,575),xy(420,571),xy(400,558),xy(400,490),xy(364,455),xy(365,384)]).
midline(r4, [xy(610,471),xy(615,449),xy(615,340),xy(605,316),xy(605,304),xy(600,295),xy(600,289),xy(595,283),xy(595,274)]).
midline(r4, [xy(616,339),xy(616,341)]).
midline(r4, [xy(401,490),xy(412,482),xy(430,475),xy(465,475)]).
midline(r4, [xy(616,498),xy(618,500)]).
midline(r4, [xy(400,559),xy(377,580),xy(359,580),xy(349,574),xy(334,575)]).
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
region(r18, '#5a5a5a', 6800, centroid(380,620)).
perimeter(r18, 720).
polygon(r18, [xy(549,630),xy(210,630),xy(210,610),xy(549,610),xy(549,630)]).
midline(r18, [xy(425,620),xy(219,620)]).
midline(r18, [xy(426,620),xy(540,620)]).
fillpoint(r18, xy(219,620), 10.0).
region(r3, '#ffdc00', 6000, centroid(466,281)).
perimeter(r3, 360).
polygon(r3, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,220),xy(490,220),xy(489,350)]).
midline(r3, [xy(468,291),xy(464,279),xy(465,244)]).
midline(r3, [xy(469,292),xy(470,330)]).
fillpoint(r3, xy(465,262), 25.0).
fillpoint(r3, xy(469,293), 21.0).
fillpoint(r3, xy(469,316), 20.0).
region(r7, '#ffdc00', 3800, centroid(277,407)).
perimeter(r7, 380).
polygon(r7, [xy(289,480),xy(270,480),xy(270,460),xy(260,459),xy(260,380),xy(270,379),xy(270,340),xy(280,339),xy(280,320),xy(290,320),xy(289,480)]).
midline(r7, [xy(284,342),xy(285,324)]).
midline(r7, [xy(284,343),xy(279,349),xy(280,379),xy(274,394),xy(274,445),xy(279,454),xy(280,470)]).
fillpoint(r7, xy(274,420), 15.0).
fillpoint(r7, xy(279,384), 11.0).
fillpoint(r7, xy(279,455), 11.0).
fillpoint(r7, xy(279,364), 10.0).
fillpoint(r7, xy(279,466), 10.0).
fillpoint(r7, xy(285,331), 5.0).
region(r15, '#7fdbff', 2000, centroid(56,584)).
perimeter(r15, 240).
polygon(r15, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r15, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r15, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r15, xy(41,578), 12.0).
fillpoint(r15, xy(58,581), 12.0).
fillpoint(r15, xy(61,598), 12.0).
fillpoint(r15, xy(40,574), 11.0).
fillpoint(r15, xy(45,579), 11.0).
fillpoint(r15, xy(54,580), 11.0).
fillpoint(r15, xy(59,585), 11.0).
fillpoint(r15, xy(60,594), 11.0).
fillpoint(r15, xy(65,599), 11.0).
fillpoint(r15, xy(39,564), 10.0).
fillpoint(r15, xy(71,600), 10.0).
region(r17, '#2ecc40', 1600, centroid(170,620)).
perimeter(r17, 200).
polygon(r17, [xy(209,630),xy(130,630),xy(130,610),xy(209,610),xy(209,630)]).
midline(r17, [xy(151,620),xy(139,620)]).
midline(r17, [xy(152,620),xy(200,620)]).
fillpoint(r17, xy(139,620), 10.0).
region(r12, '#870c25', 1500, centroid(464,434)).
perimeter(r12, 160).
polygon(r12, [xy(489,450),xy(440,450),xy(440,420),xy(489,420),xy(489,450)]).
midline(r12, [xy(466,434),xy(454,435)]).
midline(r12, [xy(467,434),xy(475,435)]).
fillpoint(r12, xy(454,435), 15.0).
region(r11, '#bebebe', 1000, centroid(464,410)).
perimeter(r11, 140).
polygon(r11, [xy(489,420),xy(440,420),xy(440,400),xy(489,400),xy(489,420)]).
midline(r11, [xy(459,410),xy(449,410)]).
midline(r11, [xy(460,409),xy(480,410)]).
fillpoint(r11, xy(449,410), 10.0).
region(r5, '#0074d9', 500, centroid(444,324)).
perimeter(r5, 120).
polygon(r5, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r5, [xy(445,317),xy(445,345)]).
midline(r5, [xy(445,316),xy(445,304)]).
fillpoint(r5, xy(444,325), 5.0).
region(r10, '#0074d9', 500, centroid(364,354)).
perimeter(r10, 120).
polygon(r10, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r10, [xy(370,354),xy(344,355)]).
midline(r10, [xy(371,354),xy(385,355)]).
fillpoint(r10, xy(344,355), 5.0).
region(r13, '#7fdbff', 500, centroid(312,526)).
perimeter(r13, 120).
polygon(r13, [xy(329,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r13, [xy(305,521),xy(305,514)]).
midline(r13, [xy(305,522),xy(305,524),xy(314,525),xy(315,534),xy(325,535)]).
fillpoint(r13, xy(305,524), 6.0).
fillpoint(r13, xy(314,525), 6.0).
fillpoint(r13, xy(315,534), 6.0).
fillpoint(r13, xy(305,516), 5.0).
fillpoint(r13, xy(321,535), 5.0).
region(r16, '#7fdbff', 400, centroid(80,560)).
perimeter(r16, 80).
polygon(r16, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r16, [xy(79,559),xy(80,560)]).
fillpoint(r16, xy(79,560), 10.0).
region(r19, '#7fdbff', 400, centroid(570,620)).
perimeter(r19, 80).
polygon(r19, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r19, [xy(569,619),xy(570,620)]).
fillpoint(r19, xy(569,620), 10.0).
region(r20, '#7fdbff', 400, centroid(600,620)).
perimeter(r20, 80).
polygon(r20, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r20, [xy(599,619),xy(600,620)]).
fillpoint(r20, xy(599,620), 10.0).
region(r21, '#2ecc40', 400, centroid(630,620)).
perimeter(r21, 80).
polygon(r21, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r21, [xy(629,619),xy(630,620)]).
fillpoint(r21, xy(629,620), 10.0).
border(r21).
region(r14, '#7fdbff', 100, centroid(324,514)).
perimeter(r14, 40).
polygon(r14, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r14, [xy(325,515),xy(325,514)]).
fillpoint(r14, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 630).
adjacent(r1, r3).
shared_edge(r1, r3, 50).
adjacent(r1, r4).
shared_edge(r1, r4, 520).
adjacent(r1, r7).
shared_edge(r1, r7, 200).
adjacent(r1, r13).
shared_edge(r1, r13, 120).
adjacent(r1, r14).
shared_edge(r1, r14, 40).
adjacent(r1, r15).
shared_edge(r1, r15, 240).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 180).
adjacent(r1, r18).
shared_edge(r1, r18, 700).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 250).
adjacent(r2, r4).
shared_edge(r2, r4, 1080).
adjacent(r2, r5).
shared_edge(r2, r5, 60).
adjacent(r2, r7).
shared_edge(r2, r7, 180).
adjacent(r2, r10).
shared_edge(r2, r10, 70).
adjacent(r2, r11).
shared_edge(r2, r11, 90).
adjacent(r2, r12).
shared_edge(r2, r12, 60).
adjacent(r3, r5).
shared_edge(r3, r5, 60).
adjacent(r4, r10).
shared_edge(r4, r10, 50).
adjacent(r4, r12).
shared_edge(r4, r12, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r17, r18).
shared_edge(r17, r18, 20).

encloses(r1, r13).
encloses(r1, r14).
encloses(r1, r15).
encloses(r1, r16).
encloses(r1, r19).
encloses(r1, r20).
