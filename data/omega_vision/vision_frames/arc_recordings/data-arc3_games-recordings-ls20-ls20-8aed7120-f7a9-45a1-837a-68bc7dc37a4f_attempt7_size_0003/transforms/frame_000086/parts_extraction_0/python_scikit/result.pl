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

region(r1, '#aaaaaa', 286200, centroid(254,288)).
perimeter(r1, 4780).
polygon(r1, [xy(639,210),xy(620,210),xy(620,200),xy(610,199),xy(609,190),xy(590,190),xy(589,180),xy(550,180),xy(549,170),xy(470,170),xy(469,180),xy(430,180),xy(429,190),xy(410,190),xy(410,199),xy(400,200),xy(399,210),xy(380,210),xy(380,219),xy(370,220),xy(370,229),xy(360,230),xy(360,239),xy(350,240),xy(350,259),xy(340,260),xy(340,269),xy(330,270),xy(330,289),xy(320,290),xy(320,329),xy(310,330),xy(310,409),xy(320,410),xy(320,449),xy(330,450),xy(330,469),xy(339,470),xy(340,480),xy(350,480),xy(350,499),xy(359,500),xy(360,509),xy(369,510),xy(370,519),xy(379,520),xy(380,530),xy(399,530),xy(400,539),xy(409,540),xy(410,550),xy(429,550),xy(430,560),xy(469,560),xy(470,570),xy(549,570),xy(550,560),xy(589,560),xy(590,550),xy(609,550),xy(610,540),xy(620,539),xy(620,530),xy(639,530)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(555,84),xy(452,85),xy(423,91),xy(404,91),xy(367,99),xy(291,123),xy(245,142),xy(177,177),xy(164,234),xy(156,295),xy(154,330),xy(155,418),xy(111,444),xy(81,468),xy(29,520),xy(17,537),xy(14,550),xy(15,576),xy(17,579),xy(14,591),xy(14,609),xy(17,622),xy(30,625),xy(49,625),xy(59,622),xy(60,600),xy(40,580),xy(18,579)]).
midline(r1, [xy(170,216),xy(244,290),xy(241,291),xy(169,219)]).
midline(r1, [xy(422,92),xy(431,99),xy(430,107),xy(415,92)]).
midline(r1, [xy(60,623),xy(71,625),xy(96,624),xy(109,617),xy(110,602),xy(117,585),xy(146,551),xy(176,500),xy(175,498),xy(187,474),xy(155,420)]).
midline(r1, [xy(177,499),xy(180,491)]).
midline(r1, [xy(188,475),xy(205,488),xy(247,448)]).
midline(r1, [xy(183,485),xy(182,491)]).
midline(r1, [xy(244,292),xy(248,291),xy(171,214)]).
midline(r1, [xy(248,293),xy(258,294),xy(258,296)]).
midline(r1, [xy(431,108),xy(432,112),xy(434,112)]).
midline(r1, [xy(433,108),xy(432,106)]).
midline(r1, [xy(109,619),xy(124,633),xy(130,635),xy(549,635),xy(555,632),xy(555,595),xy(552,589),xy(470,590),xy(449,584),xy(420,584),xy(405,578),xy(395,578),xy(373,569),xy(352,565),xy(301,544),xy(274,528),xy(250,517),xy(206,489)]).
midline(r1, [xy(555,633),xy(574,635),xy(585,632),xy(585,591),xy(584,586),xy(579,584),xy(569,584),xy(554,590)]).
midline(r1, [xy(585,585),xy(599,584),xy(610,579),xy(615,585),xy(615,632),xy(607,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(611,578),xy(622,562),xy(630,539)]).
midline(r1, [xy(434,114),xy(435,119),xy(433,121),xy(435,124),xy(432,127),xy(436,127),xy(434,129),xy(437,130),xy(436,133),xy(439,130),xy(436,120)]).
midline(r1, [xy(440,131),xy(437,134),xy(441,142),xy(443,142),xy(439,134)]).
midline(r1, [xy(260,295),xy(264,298),xy(284,303),xy(284,305)]).
midline(r1, [xy(286,305),xy(292,308),xy(295,307),xy(294,309)]).
midline(r1, [xy(184,489),xy(186,486),xy(185,480),xy(187,480)]).
midline(r1, [xy(555,86),xy(570,103),xy(583,123),xy(574,144),xy(577,143)]).
midline(r1, [xy(584,124),xy(585,126),xy(580,134)]).
midline(r1, [xy(586,126),xy(602,144),xy(611,162),xy(620,173),xy(630,200)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(249,446),xy(250,449),xy(211,490),xy(252,449),xy(251,446),xy(256,444),xy(253,448)]).
midline(r1, [xy(258,446),xy(261,442),xy(262,445),xy(260,446)]).
midline(r1, [xy(263,442),xy(268,441),xy(263,444)]).
midline(r1, [xy(269,440),xy(272,440),xy(269,442)]).
midline(r1, [xy(273,439),xy(290,432),xy(290,434)]).
midline(r1, [xy(405,161),xy(349,107),xy(410,168)]).
midline(r1, [xy(263,175),xy(328,240)]).
midline(r1, [xy(296,310),xy(297,311)]).
midline(r1, [xy(364,565),xy(382,547),xy(365,566)]).
midline(r1, [xy(443,144),xy(444,145)]).
fillpoint(r1, xy(177,178), 178.0).
fillpoint(r1, xy(175,186), 176.0).
fillpoint(r1, xy(174,190), 175.0).
fillpoint(r1, xy(173,194), 174.0).
fillpoint(r1, xy(172,199), 173.0).
fillpoint(r1, xy(171,204), 172.0).
fillpoint(r1, xy(169,211), 170.0).
fillpoint(r1, xy(168,216), 169.0).
fillpoint(r1, xy(167,220), 168.0).
fillpoint(r1, xy(166,225), 167.0).
fillpoint(r1, xy(165,230), 166.0).
fillpoint(r1, xy(164,236), 165.0).
fillpoint(r1, xy(163,242), 164.0).
fillpoint(r1, xy(162,249), 163.0).
fillpoint(r1, xy(161,257), 162.0).
fillpoint(r1, xy(160,269), 161.0).
fillpoint(r1, xy(159,277), 160.0).
fillpoint(r1, xy(158,283), 159.0).
fillpoint(r1, xy(157,289), 158.0).
fillpoint(r1, xy(156,298), 157.0).
fillpoint(r1, xy(155,310), 156.0).
fillpoint(r1, xy(155,420), 155.4).
fillpoint(r1, xy(154,370), 155.0).
fillpoint(r1, xy(174,453), 142.9).
fillpoint(r1, xy(175,455), 142.3).
fillpoint(r1, xy(178,460), 141.4).
fillpoint(r1, xy(320,113), 114.0).
fillpoint(r1, xy(327,111), 112.0).
fillpoint(r1, xy(331,110), 111.0).
fillpoint(r1, xy(353,103), 104.0).
fillpoint(r1, xy(356,102), 103.0).
fillpoint(r1, xy(360,101), 102.0).
fillpoint(r1, xy(364,100), 101.0).
fillpoint(r1, xy(368,99), 100.0).
fillpoint(r1, xy(373,98), 99.0).
fillpoint(r1, xy(381,96), 97.0).
fillpoint(r1, xy(385,95), 96.0).
fillpoint(r1, xy(389,94), 95.0).
fillpoint(r1, xy(394,93), 94.0).
fillpoint(r1, xy(399,92), 93.0).
fillpoint(r1, xy(406,91), 92.0).
fillpoint(r1, xy(415,90), 91.0).
fillpoint(r1, xy(430,89), 90.0).
fillpoint(r1, xy(435,88), 89.0).
fillpoint(r1, xy(440,87), 88.0).
fillpoint(r1, xy(446,86), 87.0).
fillpoint(r1, xy(455,85), 86.0).
fillpoint(r1, xy(554,85), 85.1).
fillpoint(r1, xy(471,85), 85.0).
fillpoint(r1, xy(321,552), 58.0).
fillpoint(r1, xy(353,565), 45.0).
border(r1).
region(r3, '#2ecc40', 61900, centroid(473,350)).
perimeter(r3, 2380).
polygon(r3, [xy(589,550),xy(440,550),xy(440,500),xy(489,500),xy(490,450),xy(390,450),xy(389,350),xy(340,350),xy(340,469),xy(330,469),xy(330,450),xy(320,449),xy(320,410),xy(310,409),xy(310,330),xy(320,329),xy(320,290),xy(330,289),xy(330,270),xy(339,270),xy(340,260),xy(350,259),xy(350,240),xy(359,240),xy(360,230),xy(369,230),xy(370,220),xy(379,220),xy(380,210),xy(399,210),xy(400,200),xy(440,200),xy(440,349),xy(489,350),xy(490,400),xy(539,400),xy(540,350),xy(490,349),xy(490,170),xy(549,170),xy(550,180),xy(590,180),xy(590,449),xy(540,450),xy(540,499),xy(590,500),xy(589,550)]).
hole(r3, [xy(580,539),xy(579,510),xy(550,510),xy(550,540),xy(580,539)]).
midline(r3, [xy(439,400),xy(427,385),xy(418,369),xy(415,359),xy(414,340),xy(407,322),xy(387,297),xy(377,300),xy(354,315),xy(340,307),xy(340,309)]).
midline(r3, [xy(353,316),xy(324,344),xy(324,395),xy(329,404),xy(329,440),xy(334,446),xy(335,465)]).
midline(r3, [xy(441,398),xy(539,300),xy(540,228),xy(524,204),xy(527,200),xy(526,198),xy(528,198)]).
midline(r3, [xy(540,301),xy(554,317),xy(564,341),xy(565,396),xy(563,413),xy(560,420),xy(548,424),xy(526,426),xy(514,431),xy(503,426),xy(480,424),xy(468,420),xy(454,412),xy(441,400)]).
midline(r3, [xy(387,296),xy(394,268),xy(401,252),xy(400,250),xy(412,234),xy(419,220)]).
midline(r3, [xy(515,432),xy(514,518),xy(499,524),xy(464,525)]).
midline(r3, [xy(515,518),xy(522,522),xy(524,521),xy(524,524),xy(528,521),xy(525,520)]).
midline(r3, [xy(529,520),xy(529,518),xy(527,519)]).
midline(r3, [xy(525,525),xy(546,544),xy(579,545),xy(584,543),xy(585,510),xy(583,505),xy(546,505),xy(531,516),xy(531,518)]).
fillpoint(r3, xy(386,297), 53.0).
fillpoint(r3, xy(540,264), 50.0).
fillpoint(r3, xy(390,288), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(392,281), 48.0).
fillpoint(r3, xy(393,276), 47.0).
fillpoint(r3, xy(394,270), 46.0).
fillpoint(r3, xy(395,266), 45.0).
fillpoint(r3, xy(515,431), 31.4).
fillpoint(r3, xy(515,518), 31.4).
fillpoint(r3, xy(560,420), 29.7).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(561,331), 29.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(561,418), 29.0).
fillpoint(r3, xy(471,421), 29.0).
fillpoint(r3, xy(558,421), 29.0).
fillpoint(r3, xy(508,428), 29.0).
fillpoint(r3, xy(521,428), 29.0).
fillpoint(r3, xy(508,521), 29.0).
fillpoint(r3, xy(521,521), 29.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(562,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(562,415), 28.0).
fillpoint(r3, xy(474,422), 28.0).
fillpoint(r3, xy(555,422), 28.0).
fillpoint(r3, xy(505,427), 28.0).
fillpoint(r3, xy(524,427), 28.0).
fillpoint(r3, xy(505,522), 28.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(563,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(563,412), 27.0).
fillpoint(r3, xy(477,423), 27.0).
fillpoint(r3, xy(552,423), 27.0).
fillpoint(r3, xy(502,426), 27.0).
fillpoint(r3, xy(527,426), 27.0).
fillpoint(r3, xy(502,523), 27.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(564,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(564,408), 26.0).
fillpoint(r3, xy(482,424), 26.0).
fillpoint(r3, xy(548,424), 26.0).
fillpoint(r3, xy(498,425), 26.0).
fillpoint(r3, xy(532,425), 26.0).
fillpoint(r3, xy(498,524), 26.0).
fillpoint(r3, xy(564,375), 25.0).
fillpoint(r3, xy(514,475), 25.0).
fillpoint(r3, xy(464,525), 25.0).
fillpoint(r3, xy(325,344), 16.0).
fillpoint(r3, xy(325,373), 15.0).
region(r5, '#ffdc00', 19500, centroid(607,383)).
perimeter(r5, 920).
polygon(r5, [xy(639,530),xy(620,530),xy(620,539),xy(610,540),xy(609,550),xy(590,550),xy(590,500),xy(540,499),xy(540,450),xy(590,449),xy(590,190),xy(609,190),xy(610,199),xy(620,200),xy(620,210),xy(639,210)]).
midline(r5, [xy(614,350),xy(615,234),xy(607,222),xy(600,205),xy(600,199)]).
midline(r5, [xy(615,351),xy(615,449),xy(610,471),xy(606,475),xy(564,475)]).
midline(r5, [xy(608,475),xy(613,486),xy(615,505),xy(607,517),xy(600,534),xy(600,540)]).
fillpoint(r5, xy(608,475), 31.4).
fillpoint(r5, xy(611,468), 29.0).
fillpoint(r5, xy(611,481), 29.0).
fillpoint(r5, xy(612,465), 28.0).
fillpoint(r5, xy(612,484), 28.0).
fillpoint(r5, xy(613,462), 27.0).
fillpoint(r5, xy(613,487), 27.0).
fillpoint(r5, xy(614,458), 26.0).
fillpoint(r5, xy(614,492), 26.0).
fillpoint(r5, xy(615,341), 25.0).
fillpoint(r5, xy(564,475), 25.0).
fillpoint(r5, xy(615,503), 25.0).
fillpoint(r5, xy(605,215), 16.0).
fillpoint(r5, xy(605,524), 16.0).
fillpoint(r5, xy(600,204), 11.0).
fillpoint(r5, xy(600,535), 11.0).
border(r5).
region(r9, '#ffdc00', 16800, centroid(415,475)).
perimeter(r9, 1020).
polygon(r9, [xy(549,570),xy(470,570),xy(469,560),xy(430,560),xy(429,550),xy(410,550),xy(410,540),xy(400,540),xy(399,530),xy(380,530),xy(380,520),xy(370,520),xy(370,510),xy(360,509),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,549),xy(590,550),xy(589,560),xy(550,560),xy(549,570)]).
midline(r9, [xy(419,479),xy(400,488),xy(364,455),xy(365,384)]).
midline(r9, [xy(403,489),xy(406,499),xy(410,502),xy(417,515),xy(424,535),xy(434,546),xy(435,554),xy(467,554),xy(473,555),xy(479,560),xy(540,560),xy(544,556),xy(552,554),xy(585,555)]).
midline(r9, [xy(420,479),xy(430,475),xy(465,475)]).
fillpoint(r9, xy(402,488), 39.0).
fillpoint(r9, xy(421,478), 29.0).
fillpoint(r9, xy(424,477), 28.0).
fillpoint(r9, xy(427,476), 27.0).
fillpoint(r9, xy(432,475), 26.0).
fillpoint(r9, xy(365,455), 25.7).
fillpoint(r9, xy(365,416), 25.0).
fillpoint(r9, xy(441,475), 25.0).
fillpoint(r9, xy(424,534), 16.0).
fillpoint(r9, xy(479,560), 10.0).
region(r2, '#ffdc00', 8300, centroid(466,258)).
perimeter(r2, 480).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(430,190),xy(430,180),xy(469,180),xy(470,170),xy(490,170),xy(489,350)]).
midline(r2, [xy(470,328),xy(469,292),xy(463,280),xy(465,275),xy(465,205),xy(445,186),xy(434,185)]).
midline(r2, [xy(465,204),xy(475,193),xy(480,179)]).
midline(r2, [xy(470,330),xy(470,329)]).
fillpoint(r2, xy(465,242), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(479,184), 11.0).
region(r17, '#5a5a5a', 5200, centroid(420,620)).
perimeter(r17, 560).
polygon(r17, [xy(549,630),xy(290,630),xy(290,610),xy(549,610),xy(549,630)]).
midline(r17, [xy(450,620),xy(299,620)]).
midline(r17, [xy(451,620),xy(540,620)]).
fillpoint(r17, xy(299,620), 10.0).
region(r16, '#2ecc40', 3200, centroid(210,620)).
perimeter(r16, 360).
polygon(r16, [xy(289,630),xy(130,630),xy(130,610),xy(289,610),xy(289,630)]).
midline(r16, [xy(279,620),xy(139,620)]).
midline(r16, [xy(280,620),xy(280,619)]).
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
region(r10, '#870c25', 1500, centroid(514,384)).
perimeter(r10, 160).
polygon(r10, [xy(539,400),xy(490,400),xy(490,370),xy(539,370),xy(539,400)]).
midline(r10, [xy(510,385),xy(504,385)]).
midline(r10, [xy(511,385),xy(525,385)]).
fillpoint(r10, xy(504,385), 15.0).
region(r8, '#bebebe', 1000, centroid(514,360)).
perimeter(r8, 140).
polygon(r8, [xy(539,370),xy(490,370),xy(490,350),xy(539,350),xy(539,370)]).
midline(r8, [xy(510,359),xy(499,360)]).
midline(r8, [xy(511,359),xy(530,360)]).
fillpoint(r8, xy(499,360), 10.0).
region(r12, '#5a5a5a', 800, centroid(564,524)).
perimeter(r12, 160).
polygon(r12, [xy(579,540),xy(550,539),xy(550,510),xy(580,510),xy(579,540)]).
hole(r12, [xy(570,529),xy(569,520),xy(560,520),xy(560,530),xy(570,529)]).
midline(r12, [xy(574,532),xy(575,521),xy(573,515),xy(555,515),xy(554,522),xy(555,534),xy(574,534)]).
fillpoint(r12, xy(556,515), 6.0).
fillpoint(r12, xy(574,515), 6.0).
fillpoint(r12, xy(555,534), 6.0).
fillpoint(r12, xy(573,534), 6.0).
fillpoint(r12, xy(561,515), 5.0).
fillpoint(r12, xy(554,525), 5.0).
fillpoint(r12, xy(574,525), 5.0).
fillpoint(r12, xy(561,535), 5.0).
region(r6, '#0074d9', 500, centroid(444,324)).
perimeter(r6, 120).
polygon(r6, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r6, [xy(445,317),xy(445,345)]).
midline(r6, [xy(445,316),xy(445,304)]).
fillpoint(r6, xy(444,325), 5.0).
region(r7, '#0074d9', 500, centroid(364,354)).
perimeter(r7, 120).
polygon(r7, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r7, [xy(370,354),xy(344,355)]).
midline(r7, [xy(371,355),xy(385,355)]).
fillpoint(r7, xy(344,355), 5.0).
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
region(r13, '#2ecc40', 100, centroid(564,524)).
perimeter(r13, 40).
polygon(r13, [xy(569,530),xy(560,529),xy(560,520),xy(570,520),xy(569,530)]).
midline(r13, [xy(565,525),xy(565,524)]).
fillpoint(r13, xy(564,525), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 80).
adjacent(r1, r3).
shared_edge(r1, r3, 520).
adjacent(r1, r5).
shared_edge(r1, r5, 140).
adjacent(r1, r9).
shared_edge(r1, r9, 340).
adjacent(r1, r14).
shared_edge(r1, r14, 240).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 340).
adjacent(r1, r17).
shared_edge(r1, r17, 540).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 320).
adjacent(r2, r6).
shared_edge(r2, r6, 60).
adjacent(r3, r5).
shared_edge(r3, r5, 460).
adjacent(r3, r6).
shared_edge(r3, r6, 60).
adjacent(r3, r7).
shared_edge(r3, r7, 70).
adjacent(r3, r8).
shared_edge(r3, r8, 90).
adjacent(r3, r9).
shared_edge(r3, r9, 600).
adjacent(r3, r10).
shared_edge(r3, r10, 110).
adjacent(r3, r12).
shared_edge(r3, r12, 120).
adjacent(r7, r9).
shared_edge(r7, r9, 50).
adjacent(r8, r10).
shared_edge(r8, r10, 50).
adjacent(r12, r13).
shared_edge(r12, r13, 40).
adjacent(r16, r17).
shared_edge(r16, r17, 20).

encloses(r12, r13).
encloses(r1, r14).
encloses(r1, r15).
encloses(r1, r18).
encloses(r1, r19).
