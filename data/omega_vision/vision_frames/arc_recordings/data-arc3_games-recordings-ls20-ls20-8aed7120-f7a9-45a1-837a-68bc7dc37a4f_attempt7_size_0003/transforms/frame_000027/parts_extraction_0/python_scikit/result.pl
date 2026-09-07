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

region(r1, '#aaaaaa', 277300, centroid(257,288)).
perimeter(r1, 4840).
polygon(r1, [xy(639,270),xy(630,270),xy(630,260),xy(620,259),xy(620,240),xy(610,240),xy(610,230),xy(600,230),xy(600,220),xy(590,219),xy(589,210),xy(570,210),xy(570,200),xy(560,199),xy(559,190),xy(540,190),xy(539,180),xy(500,180),xy(499,170),xy(420,170),xy(419,180),xy(380,180),xy(379,190),xy(360,190),xy(360,199),xy(350,200),xy(349,210),xy(330,210),xy(330,219),xy(320,220),xy(320,229),xy(310,230),xy(309,240),xy(300,240),xy(300,259),xy(290,260),xy(290,269),xy(280,270),xy(280,289),xy(270,290),xy(270,329),xy(260,330),xy(260,409),xy(270,410),xy(270,449),xy(280,450),xy(280,469),xy(289,470),xy(290,479),xy(299,480),xy(300,490),xy(349,490),xy(350,539),xy(359,540),xy(360,550),xy(379,550),xy(380,560),xy(419,560),xy(420,570),xy(499,570),xy(500,560),xy(539,560),xy(540,550),xy(559,550),xy(560,540),xy(569,540),xy(570,530),xy(589,530),xy(590,520),xy(599,520),xy(600,510),xy(610,509),xy(610,500),xy(620,499),xy(620,480),xy(629,480),xy(630,470),xy(639,470)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
hole(r1, [xy(330,519),xy(329,510),xy(320,510),xy(320,520),xy(330,519)]).
midline(r1, [xy(205,216),xy(157,170),xy(138,244),xy(130,308),xy(129,409),xy(136,473),xy(98,516),xy(84,538),xy(72,567),xy(67,572),xy(69,574),xy(70,570)]).
midline(r1, [xy(72,570),xy(72,569)]).
midline(r1, [xy(72,572),xy(73,574),xy(70,575)]).
midline(r1, [xy(158,168),xy(160,160),xy(174,154)]).
midline(r1, [xy(137,474),xy(157,490),xy(200,517),xy(232,532),xy(244,535),xy(280,556),xy(307,564),xy(335,533),xy(339,525),xy(340,510),xy(337,501),xy(322,499),xy(306,504),xy(264,544)]).
midline(r1, [xy(309,564),xy(327,571),xy(329,570),xy(336,575),xy(350,579),xy(354,578),xy(366,583),xy(380,585),xy(397,585),xy(400,583),xy(405,587),xy(420,590),xy(497,590),xy(511,588),xy(520,583),xy(520,585)]).
midline(r1, [xy(159,488),xy(198,449),xy(196,447),xy(189,448),xy(153,484)]).
midline(r1, [xy(197,446),xy(199,448)]).
midline(r1, [xy(522,585),xy(554,583),xy(555,632),xy(549,635),xy(130,635),xy(118,628),xy(91,601),xy(72,577),xy(74,574)]).
midline(r1, [xy(201,446),xy(203,445),xy(204,448),xy(206,444),xy(208,445),xy(211,442),xy(229,436),xy(230,439),xy(226,443),xy(223,444),xy(221,442),xy(216,445),xy(214,443)]).
midline(r1, [xy(206,448),xy(211,444),xy(210,447)]).
midline(r1, [xy(212,447),xy(214,445)]).
midline(r1, [xy(225,444),xy(223,446),xy(219,445)]).
midline(r1, [xy(231,438),xy(234,434),xy(238,433),xy(239,436),xy(234,437),xy(234,439)]).
midline(r1, [xy(240,435),xy(240,432),xy(243,430),xy(242,433)]).
midline(r1, [xy(555,633),xy(560,635),xy(583,634),xy(585,629),xy(584,576),xy(564,578),xy(555,582)]).
midline(r1, [xy(584,575),xy(590,570),xy(599,568),xy(615,585),xy(615,632),xy(608,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(600,567),xy(611,549),xy(612,542),xy(629,505),xy(629,489),xy(634,483),xy(635,474)]).
midline(r1, [xy(141,239),xy(193,291),xy(197,290),xy(143,234),xy(199,290),xy(198,293),xy(200,291),xy(204,295),xy(210,293),xy(212,295),xy(208,296)]).
midline(r1, [xy(159,172),xy(260,271)]).
midline(r1, [xy(75,577),xy(79,582)]).
midline(r1, [xy(213,294),xy(218,299),xy(219,296)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(175,152),xy(251,119),xy(338,94),xy(361,91),xy(380,111),xy(382,108),xy(381,101),xy(370,90),xy(362,90)]).
midline(r1, [xy(187,148),xy(278,241),xy(185,149)]).
midline(r1, [xy(280,241),xy(279,242)]).
midline(r1, [xy(372,90),xy(421,84),xy(498,84),xy(547,90),xy(537,103),xy(536,116),xy(530,127),xy(531,132),xy(527,136),xy(527,141),xy(523,147),xy(526,144)]).
midline(r1, [xy(535,119),xy(535,123),xy(532,126),xy(533,132),xy(529,137)]).
midline(r1, [xy(534,130),xy(534,126)]).
midline(r1, [xy(374,92),xy(381,99)]).
midline(r1, [xy(537,113),xy(554,96),xy(550,92),xy(539,103),xy(540,106),xy(538,108)]).
midline(r1, [xy(550,91),xy(549,90)]).
midline(r1, [xy(541,105),xy(543,103)]).
midline(r1, [xy(555,97),xy(560,103),xy(536,128)]).
midline(r1, [xy(561,104),xy(584,142),xy(557,169),xy(556,171),xy(558,171)]).
midline(r1, [xy(585,142),xy(598,170),xy(610,188),xy(612,197),xy(629,234),xy(629,250),xy(634,256),xy(635,265)]).
midline(r1, [xy(528,142),xy(528,144)]).
midline(r1, [xy(387,121),xy(382,115),xy(381,112),xy(383,111),xy(385,116)]).
midline(r1, [xy(386,122),xy(387,127),xy(389,127)]).
midline(r1, [xy(390,131),xy(388,131),xy(390,130)]).
midline(r1, [xy(235,304),xy(226,302),xy(221,298),xy(221,300)]).
midline(r1, [xy(389,133),xy(391,139),xy(393,139)]).
midline(r1, [xy(236,305),xy(239,304),xy(237,306)]).
midline(r1, [xy(241,308),xy(241,306),xy(244,308)]).
fillpoint(r1, xy(160,160), 161.0).
fillpoint(r1, xy(159,164), 160.0).
fillpoint(r1, xy(158,168), 159.0).
fillpoint(r1, xy(152,186), 153.0).
fillpoint(r1, xy(150,193), 151.0).
fillpoint(r1, xy(147,205), 148.0).
fillpoint(r1, xy(146,209), 147.0).
fillpoint(r1, xy(145,214), 146.0).
fillpoint(r1, xy(144,218), 145.0).
fillpoint(r1, xy(143,222), 144.0).
fillpoint(r1, xy(142,226), 143.0).
fillpoint(r1, xy(141,230), 142.0).
fillpoint(r1, xy(140,235), 141.0).
fillpoint(r1, xy(139,240), 140.0).
fillpoint(r1, xy(138,246), 139.0).
fillpoint(r1, xy(137,252), 138.0).
fillpoint(r1, xy(136,260), 137.0).
fillpoint(r1, xy(136,473), 136.1).
fillpoint(r1, xy(135,271), 136.0).
fillpoint(r1, xy(135,469), 136.0).
fillpoint(r1, xy(134,281), 135.0).
fillpoint(r1, xy(134,458), 135.0).
fillpoint(r1, xy(133,287), 134.0).
fillpoint(r1, xy(133,453), 134.0).
fillpoint(r1, xy(132,293), 133.0).
fillpoint(r1, xy(132,447), 133.0).
fillpoint(r1, xy(131,301), 132.0).
fillpoint(r1, xy(131,439), 132.0).
fillpoint(r1, xy(130,311), 131.0).
fillpoint(r1, xy(130,428), 131.0).
fillpoint(r1, xy(129,370), 130.0).
fillpoint(r1, xy(270,113), 114.0).
fillpoint(r1, xy(277,111), 112.0).
fillpoint(r1, xy(281,110), 111.0).
fillpoint(r1, xy(303,103), 104.0).
fillpoint(r1, xy(306,102), 103.0).
fillpoint(r1, xy(310,101), 102.0).
fillpoint(r1, xy(314,100), 101.0).
fillpoint(r1, xy(318,99), 100.0).
fillpoint(r1, xy(323,98), 99.0).
fillpoint(r1, xy(331,96), 97.0).
fillpoint(r1, xy(335,95), 96.0).
fillpoint(r1, xy(339,94), 95.0).
fillpoint(r1, xy(344,93), 94.0).
fillpoint(r1, xy(349,92), 93.0).
fillpoint(r1, xy(356,91), 92.0).
fillpoint(r1, xy(365,90), 91.0).
fillpoint(r1, xy(549,90), 90.6).
fillpoint(r1, xy(380,89), 90.0).
fillpoint(r1, xy(539,89), 90.0).
fillpoint(r1, xy(385,88), 89.0).
fillpoint(r1, xy(534,88), 89.0).
fillpoint(r1, xy(390,87), 88.0).
fillpoint(r1, xy(529,87), 88.0).
fillpoint(r1, xy(396,86), 87.0).
fillpoint(r1, xy(523,86), 87.0).
fillpoint(r1, xy(405,85), 86.0).
fillpoint(r1, xy(515,85), 86.0).
fillpoint(r1, xy(421,85), 85.0).
fillpoint(r1, xy(291,560), 50.0).
fillpoint(r1, xy(298,562), 48.0).
fillpoint(r1, xy(303,563), 47.0).
fillpoint(r1, xy(309,564), 46.0).
fillpoint(r1, xy(595,163), 45.0).
fillpoint(r1, xy(599,569), 41.0).
border(r1).
region(r3, '#2ecc40', 72000, centroid(450,353)).
perimeter(r3, 2460).
polygon(r3, [xy(559,550),xy(440,549),xy(440,500),xy(489,500),xy(490,450),xy(390,450),xy(389,350),xy(340,350),xy(340,479),xy(360,480),xy(360,539),xy(350,539),xy(349,490),xy(300,490),xy(300,480),xy(290,479),xy(290,300),xy(270,300),xy(270,290),xy(280,289),xy(280,270),xy(289,270),xy(290,260),xy(300,259),xy(300,240),xy(329,240),xy(330,210),xy(349,210),xy(350,200),xy(359,200),xy(360,190),xy(379,190),xy(380,180),xy(389,180),xy(390,200),xy(440,200),xy(440,400),xy(490,399),xy(490,170),xy(499,170),xy(500,180),xy(539,180),xy(540,190),xy(559,190),xy(560,199),xy(569,200),xy(570,210),xy(590,210),xy(590,449),xy(540,450),xy(540,499),xy(589,500),xy(590,529),xy(570,530),xy(570,539),xy(560,540),xy(559,550)]).
midline(r3, [xy(415,390),xy(415,350),xy(411,330),xy(399,310),xy(375,285),xy(345,294),xy(342,291),xy(313,283),xy(311,285),xy(294,284),xy(285,293),xy(274,295)]).
midline(r3, [xy(375,284),xy(384,255),xy(381,252),xy(374,223),xy(374,204),xy(383,195),xy(385,184)]).
midline(r3, [xy(415,391),xy(415,408),xy(419,420),xy(440,425),xy(514,425),xy(539,400),xy(540,249),xy(519,209),xy(496,185),xy(495,174)]).
midline(r3, [xy(515,426),xy(514,518),xy(498,524),xy(464,525)]).
midline(r3, [xy(515,518),xy(526,523),xy(539,525),xy(563,515),xy(575,515)]).
midline(r3, [xy(344,295),xy(325,317),xy(315,340),xy(314,460),xy(317,467),xy(334,483),xy(354,485),xy(355,535)]).
fillpoint(r3, xy(375,285), 65.0).
fillpoint(r3, xy(378,277), 62.0).
fillpoint(r3, xy(367,288), 62.0).
fillpoint(r3, xy(379,274), 61.0).
fillpoint(r3, xy(364,289), 61.0).
fillpoint(r3, xy(380,271), 60.0).
fillpoint(r3, xy(361,290), 60.0).
fillpoint(r3, xy(381,267), 59.0).
fillpoint(r3, xy(357,291), 59.0).
fillpoint(r3, xy(382,263), 58.0).
fillpoint(r3, xy(353,292), 58.0).
fillpoint(r3, xy(383,258), 57.0).
fillpoint(r3, xy(348,293), 57.0).
fillpoint(r3, xy(539,324), 50.0).
fillpoint(r3, xy(539,400), 50.0).
fillpoint(r3, xy(534,236), 45.0).
fillpoint(r3, xy(515,518), 31.4).
fillpoint(r3, xy(419,420), 29.7).
fillpoint(r3, xy(518,208), 29.0).
fillpoint(r3, xy(318,331), 29.0).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(418,418), 29.0).
fillpoint(r3, xy(421,421), 29.0).
fillpoint(r3, xy(508,521), 29.0).
fillpoint(r3, xy(521,521), 29.0).
fillpoint(r3, xy(317,334), 28.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,415), 28.0).
fillpoint(r3, xy(424,422), 28.0).
fillpoint(r3, xy(505,522), 28.0).
fillpoint(r3, xy(524,522), 28.0).
fillpoint(r3, xy(316,337), 27.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,412), 27.0).
fillpoint(r3, xy(427,423), 27.0).
fillpoint(r3, xy(502,523), 27.0).
fillpoint(r3, xy(527,523), 27.0).
fillpoint(r3, xy(315,342), 26.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,408), 26.0).
fillpoint(r3, xy(432,424), 26.0).
fillpoint(r3, xy(498,524), 26.0).
fillpoint(r3, xy(532,524), 26.0).
fillpoint(r3, xy(314,406), 25.0).
fillpoint(r3, xy(414,375), 25.0).
fillpoint(r3, xy(441,425), 25.0).
fillpoint(r3, xy(514,475), 25.0).
fillpoint(r3, xy(464,525), 25.0).
region(r11, '#ffdc00', 18000, centroid(406,479)).
perimeter(r11, 920).
polygon(r11, [xy(499,570),xy(420,570),xy(419,560),xy(380,560),xy(379,550),xy(360,549),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,549),xy(540,550),xy(539,560),xy(500,560),xy(499,570)]).
midline(r11, [xy(417,537),xy(403,523),xy(399,515),xy(400,490),xy(364,455),xy(365,384)]).
midline(r11, [xy(417,538),xy(425,546),xy(431,558),xy(440,560),xy(490,560),xy(500,554),xy(535,555)]).
midline(r11, [xy(401,490),xy(412,482),xy(426,476),xy(445,474),xy(465,475)]).
midline(r11, [xy(404,526),xy(400,533),xy(402,533)]).
fillpoint(r11, xy(400,491), 41.0).
fillpoint(r11, xy(400,508), 40.0).
fillpoint(r11, xy(421,478), 29.0).
fillpoint(r11, xy(424,477), 28.0).
fillpoint(r11, xy(427,476), 27.0).
fillpoint(r11, xy(432,475), 26.0).
fillpoint(r11, xy(365,455), 25.7).
fillpoint(r11, xy(365,416), 25.0).
fillpoint(r11, xy(441,475), 25.0).
fillpoint(r11, xy(431,557), 12.0).
fillpoint(r11, xy(435,559), 11.0).
region(r6, '#ffdc00', 15100, centroid(604,387)).
perimeter(r6, 800).
polygon(r6, [xy(639,470),xy(630,470),xy(630,479),xy(620,480),xy(620,499),xy(610,500),xy(610,509),xy(600,510),xy(599,520),xy(590,519),xy(589,500),xy(540,499),xy(540,450),xy(590,449),xy(590,220),xy(599,220),xy(600,229),xy(609,230),xy(610,240),xy(620,240),xy(620,259),xy(629,260),xy(630,270),xy(639,270)]).
midline(r6, [xy(595,229),xy(595,224)]).
midline(r6, [xy(595,230),xy(605,254),xy(607,272),xy(615,289),xy(615,449),xy(610,459),xy(594,475),xy(564,475)]).
midline(r6, [xy(595,476),xy(600,483),xy(600,500),xy(595,506),xy(595,515)]).
fillpoint(r6, xy(595,474), 25.7).
fillpoint(r6, xy(614,369), 25.0).
fillpoint(r6, xy(614,450), 25.0).
fillpoint(r6, xy(564,475), 25.0).
fillpoint(r6, xy(609,460), 22.8).
fillpoint(r6, xy(605,265), 16.0).
fillpoint(r6, xy(604,256), 15.0).
fillpoint(r6, xy(600,244), 11.0).
border(r6).
region(r2, '#ffdc00', 9200, centroid(462,250)).
perimeter(r2, 560).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,190),xy(390,180),xy(419,180),xy(420,170),xy(490,170),xy(489,350)]).
midline(r2, [xy(444,180),xy(429,179),xy(419,185),xy(394,185)]).
midline(r2, [xy(445,180),xy(465,194),xy(464,279),xy(469,292),xy(470,330)]).
fillpoint(r2, xy(465,237), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(444,180), 11.0).
fillpoint(r2, xy(429,180), 10.0).
region(r14, '#2ecc40', 4400, centroid(240,620)).
perimeter(r14, 480).
polygon(r14, [xy(349,630),xy(130,630),xy(130,610),xy(349,610),xy(349,630)]).
midline(r14, [xy(279,620),xy(139,620)]).
midline(r14, [xy(280,619),xy(340,620)]).
fillpoint(r14, xy(139,620), 10.0).
region(r7, '#ffdc00', 4000, centroid(277,378)).
perimeter(r7, 400).
polygon(r7, [xy(289,470),xy(280,469),xy(280,450),xy(270,449),xy(270,410),xy(260,409),xy(260,330),xy(270,329),xy(270,300),xy(290,300),xy(289,470)]).
midline(r7, [xy(274,393),xy(274,344),xy(279,335),xy(280,309)]).
midline(r7, [xy(275,394),xy(279,404),xy(279,440),xy(284,446),xy(285,465)]).
fillpoint(r7, xy(274,370), 15.0).
fillpoint(r7, xy(279,334), 11.0).
fillpoint(r7, xy(279,405), 11.0).
fillpoint(r7, xy(279,319), 10.0).
fillpoint(r7, xy(279,426), 10.0).
fillpoint(r7, xy(285,458), 5.0).
region(r15, '#5a5a5a', 4000, centroid(450,620)).
perimeter(r15, 440).
polygon(r15, [xy(549,630),xy(350,630),xy(350,610),xy(549,610),xy(549,630)]).
midline(r15, [xy(383,619),xy(359,620)]).
midline(r15, [xy(384,620),xy(540,620)]).
fillpoint(r15, xy(359,620), 10.0).
region(r12, '#870c25', 1500, centroid(464,384)).
perimeter(r12, 160).
polygon(r12, [xy(489,400),xy(440,400),xy(440,370),xy(489,370),xy(489,400)]).
midline(r12, [xy(466,384),xy(454,385)]).
midline(r12, [xy(467,385),xy(475,385)]).
fillpoint(r12, xy(454,385), 15.0).
region(r10, '#bebebe', 1000, centroid(464,360)).
perimeter(r10, 140).
polygon(r10, [xy(489,370),xy(440,370),xy(440,350),xy(489,350),xy(489,370)]).
midline(r10, [xy(451,359),xy(449,360)]).
midline(r10, [xy(452,360),xy(480,360)]).
fillpoint(r10, xy(449,360), 10.0).
region(r4, '#0074d9', 500, centroid(414,194)).
perimeter(r4, 120).
polygon(r4, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r4, [xy(420,194),xy(394,195)]).
midline(r4, [xy(421,195),xy(435,195)]).
fillpoint(r4, xy(394,195), 5.0).
region(r8, '#0074d9', 500, centroid(444,324)).
perimeter(r8, 120).
polygon(r8, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r8, [xy(445,311),xy(445,304)]).
midline(r8, [xy(445,312),xy(445,345)]).
fillpoint(r8, xy(444,325), 5.0).
region(r9, '#0074d9', 500, centroid(364,354)).
perimeter(r9, 120).
polygon(r9, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r9, [xy(359,354),xy(344,355)]).
midline(r9, [xy(360,355),xy(385,355)]).
fillpoint(r9, xy(344,355), 5.0).
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
region(r13, '#7fdbff', 100, centroid(324,514)).
perimeter(r13, 40).
polygon(r13, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r13, [xy(325,515),xy(325,514)]).
fillpoint(r13, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 110).
adjacent(r1, r3).
shared_edge(r1, r3, 570).
adjacent(r1, r6).
shared_edge(r1, r6, 200).
adjacent(r1, r7).
shared_edge(r1, r7, 210).
adjacent(r1, r11).
shared_edge(r1, r11, 230).
adjacent(r1, r13).
shared_edge(r1, r13, 40).
adjacent(r1, r14).
shared_edge(r1, r14, 460).
adjacent(r1, r15).
shared_edge(r1, r15, 420).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 290).
adjacent(r2, r4).
shared_edge(r2, r4, 60).
adjacent(r2, r8).
shared_edge(r2, r8, 60).
adjacent(r2, r10).
shared_edge(r2, r10, 40).
adjacent(r3, r4).
shared_edge(r3, r4, 60).
adjacent(r3, r6).
shared_edge(r3, r6, 400).
adjacent(r3, r7).
shared_edge(r3, r7, 190).
adjacent(r3, r8).
shared_edge(r3, r8, 50).
adjacent(r3, r9).
shared_edge(r3, r9, 70).
adjacent(r3, r10).
shared_edge(r3, r10, 40).
adjacent(r3, r11).
shared_edge(r3, r11, 640).
adjacent(r3, r12).
shared_edge(r3, r12, 110).
adjacent(r8, r10).
shared_edge(r8, r10, 10).
adjacent(r9, r11).
shared_edge(r9, r11, 50).
adjacent(r10, r12).
shared_edge(r10, r12, 50).
adjacent(r14, r15).
shared_edge(r14, r15, 20).

encloses(r1, r13).
encloses(r1, r16).
encloses(r1, r17).
