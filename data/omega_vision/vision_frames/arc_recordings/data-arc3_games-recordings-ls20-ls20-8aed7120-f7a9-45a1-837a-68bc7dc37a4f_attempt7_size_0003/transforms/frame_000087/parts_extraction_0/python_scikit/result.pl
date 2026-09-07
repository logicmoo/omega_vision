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

region(r1, '#aaaaaa', 303200, centroid(259,292)).
perimeter(r1, 4560).
polygon(r1, [xy(639,180),xy(600,180),xy(599,170),xy(520,170),xy(519,180),xy(480,180),xy(479,190),xy(460,190),xy(460,199),xy(450,200),xy(449,210),xy(430,210),xy(430,219),xy(420,220),xy(420,229),xy(410,230),xy(410,239),xy(400,240),xy(400,259),xy(390,260),xy(390,269),xy(380,270),xy(380,289),xy(370,290),xy(370,329),xy(360,330),xy(360,409),xy(370,410),xy(370,449),xy(380,450),xy(380,469),xy(389,470),xy(390,480),xy(400,480),xy(400,499),xy(409,500),xy(410,509),xy(419,510),xy(420,519),xy(430,520),xy(430,530),xy(449,530),xy(450,539),xy(460,540),xy(460,550),xy(479,550),xy(480,560),xy(519,560),xy(520,570),xy(599,570),xy(600,560),xy(639,560)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(617,156),xy(607,138),xy(555,85),xy(502,85),xy(473,91),xy(462,90),xy(438,94),xy(351,119),xy(280,149),xy(196,196),xy(188,236),xy(180,304),xy(180,406),xy(168,413),xy(165,412),xy(159,415),xy(108,448),xy(106,447),xy(81,468),xy(30,519),xy(19,533),xy(14,550),xy(14,568),xy(17,579),xy(15,583),xy(14,609),xy(17,622),xy(30,625),xy(56,624),xy(59,622),xy(59,599),xy(40,580),xy(18,579)]).
midline(r1, [xy(202,195),xy(299,292),xy(320,300),xy(323,299),xy(323,301)]).
midline(r1, [xy(180,408),xy(198,444),xy(187,470),xy(187,476),xy(182,482),xy(183,485),xy(159,532),xy(148,549),xy(117,585),xy(111,598),xy(109,617),xy(106,620),xy(89,625),xy(60,623)]).
midline(r1, [xy(199,445),xy(257,490),xy(300,517),xy(307,519),xy(351,544),xy(397,563),xy(429,570),xy(436,575),xy(471,584),xy(500,584),xy(508,588),xy(521,590),xy(554,590),xy(555,632),xy(548,635),xy(132,635),xy(124,633),xy(109,619)]).
midline(r1, [xy(165,414),xy(162,416)]).
midline(r1, [xy(160,531),xy(165,524)]).
midline(r1, [xy(184,482),xy(184,484)]).
midline(r1, [xy(188,474),xy(189,470)]).
midline(r1, [xy(472,92),xy(481,99),xy(483,117),xy(488,124),xy(489,135),xy(491,134)]).
midline(r1, [xy(485,116),xy(485,117)]).
midline(r1, [xy(491,137),xy(495,144),xy(493,149),xy(495,148),xy(498,151),xy(497,154),xy(495,151)]).
midline(r1, [xy(256,486),xy(295,447),xy(305,444),xy(306,447),xy(317,440),xy(329,436),xy(329,438)]).
midline(r1, [xy(331,437),xy(335,434),xy(334,437)]).
midline(r1, [xy(555,633),xy(560,635),xy(577,635),xy(585,632),xy(585,591),xy(579,589),xy(556,590)]).
midline(r1, [xy(171,511),xy(172,510)]).
midline(r1, [xy(360,118),xy(430,188)]).
midline(r1, [xy(586,590),xy(615,587),xy(615,631),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(616,586),xy(619,580)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(325,300),xy(341,308),xy(343,307),xy(343,309)]).
midline(r1, [xy(339,434),xy(338,435)]).
fillpoint(r1, xy(196,197), 197.0).
fillpoint(r1, xy(195,201), 196.0).
fillpoint(r1, xy(194,206), 195.0).
fillpoint(r1, xy(193,210), 194.0).
fillpoint(r1, xy(192,215), 193.0).
fillpoint(r1, xy(191,220), 192.0).
fillpoint(r1, xy(190,226), 191.0).
fillpoint(r1, xy(189,232), 190.0).
fillpoint(r1, xy(188,238), 189.0).
fillpoint(r1, xy(187,245), 188.0).
fillpoint(r1, xy(186,255), 187.0).
fillpoint(r1, xy(185,265), 186.0).
fillpoint(r1, xy(184,272), 185.0).
fillpoint(r1, xy(183,279), 184.0).
fillpoint(r1, xy(182,286), 183.0).
fillpoint(r1, xy(181,296), 182.0).
fillpoint(r1, xy(180,308), 181.0).
fillpoint(r1, xy(180,369), 180.0).
fillpoint(r1, xy(191,431), 170.4).
fillpoint(r1, xy(370,113), 114.0).
fillpoint(r1, xy(377,111), 112.0).
fillpoint(r1, xy(381,110), 111.0).
fillpoint(r1, xy(403,103), 104.0).
fillpoint(r1, xy(406,102), 103.0).
fillpoint(r1, xy(410,101), 102.0).
fillpoint(r1, xy(414,100), 101.0).
fillpoint(r1, xy(418,99), 100.0).
fillpoint(r1, xy(423,98), 99.0).
fillpoint(r1, xy(431,96), 97.0).
fillpoint(r1, xy(435,95), 96.0).
fillpoint(r1, xy(439,94), 95.0).
fillpoint(r1, xy(444,93), 94.0).
fillpoint(r1, xy(449,92), 93.0).
fillpoint(r1, xy(456,91), 92.0).
fillpoint(r1, xy(465,90), 91.0).
fillpoint(r1, xy(480,89), 90.0).
fillpoint(r1, xy(485,88), 89.0).
fillpoint(r1, xy(490,87), 88.0).
fillpoint(r1, xy(496,86), 87.0).
fillpoint(r1, xy(505,85), 86.0).
fillpoint(r1, xy(521,85), 85.0).
fillpoint(r1, xy(371,552), 58.0).
border(r1).
region(r2, '#2ecc40', 51500, centroid(495,357)).
perimeter(r2, 1920).
polygon(r2, [xy(589,550),xy(460,550),xy(460,540),xy(450,540),xy(449,530),xy(440,529),xy(440,500),xy(489,500),xy(490,450),xy(390,450),xy(390,350),xy(360,349),xy(360,330),xy(370,329),xy(370,290),xy(380,289),xy(380,270),xy(389,270),xy(390,260),xy(400,259),xy(400,240),xy(409,240),xy(410,230),xy(419,230),xy(420,220),xy(430,219),xy(430,210),xy(440,210),xy(440,349),xy(490,349),xy(490,180),xy(519,180),xy(520,170),xy(590,170),xy(590,349),xy(540,350),xy(540,399),xy(590,400),xy(590,449),xy(540,450),xy(540,499),xy(590,500),xy(589,550)]).
hole(r2, [xy(580,539),xy(579,510),xy(550,510),xy(550,540),xy(580,539)]).
midline(r2, [xy(439,400),xy(427,385),xy(418,369),xy(413,336),xy(403,317),xy(383,335),xy(369,340)]).
midline(r2, [xy(441,400),xy(488,400),xy(506,379),xy(513,363),xy(515,341),xy(519,328),xy(527,314),xy(540,300),xy(539,225),xy(547,210),xy(549,210)]).
midline(r2, [xy(490,400),xy(515,425),xy(515,516),xy(513,519),xy(503,523),xy(479,525),xy(454,515)]).
midline(r2, [xy(515,518),xy(522,521),xy(546,544),xy(579,545),xy(583,544),xy(585,539),xy(585,510),xy(583,505),xy(546,505),xy(530,519),xy(523,520)]).
midline(r2, [xy(404,317),xy(403,314),xy(408,304),xy(412,282),xy(418,271),xy(419,257),xy(429,235),xy(429,229),xy(434,223),xy(435,214)]).
midline(r2, [xy(516,424),xy(565,425)]).
fillpoint(r2, xy(539,263), 50.0).
fillpoint(r2, xy(439,400), 50.0).
fillpoint(r2, xy(490,400), 50.0).
fillpoint(r2, xy(404,316), 35.0).
fillpoint(r2, xy(408,303), 32.0).
fillpoint(r2, xy(515,518), 31.4).
fillpoint(r2, xy(409,298), 31.0).
fillpoint(r2, xy(411,288), 29.0).
fillpoint(r2, xy(411,331), 29.0).
fillpoint(r2, xy(518,331), 29.0).
fillpoint(r2, xy(418,368), 29.0).
fillpoint(r2, xy(511,368), 29.0).
fillpoint(r2, xy(508,521), 29.0).
fillpoint(r2, xy(521,521), 29.0).
fillpoint(r2, xy(412,285), 28.0).
fillpoint(r2, xy(412,334), 28.0).
fillpoint(r2, xy(517,334), 28.0).
fillpoint(r2, xy(417,365), 28.0).
fillpoint(r2, xy(512,365), 28.0).
fillpoint(r2, xy(505,522), 28.0).
fillpoint(r2, xy(413,337), 27.0).
fillpoint(r2, xy(516,337), 27.0).
fillpoint(r2, xy(416,362), 27.0).
fillpoint(r2, xy(513,362), 27.0).
fillpoint(r2, xy(502,523), 27.0).
fillpoint(r2, xy(414,342), 26.0).
fillpoint(r2, xy(515,342), 26.0).
fillpoint(r2, xy(415,358), 26.0).
fillpoint(r2, xy(514,358), 26.0).
fillpoint(r2, xy(498,524), 26.0).
fillpoint(r2, xy(541,425), 25.0).
fillpoint(r2, xy(514,475), 25.0).
fillpoint(r2, xy(479,525), 25.0).
fillpoint(r2, xy(419,266), 21.0).
fillpoint(r2, xy(420,257), 20.0).
fillpoint(r2, xy(424,245), 16.0).
fillpoint(r2, xy(455,515), 16.0).
region(r3, '#ffdc00', 23500, centroid(603,395)).
perimeter(r3, 1220).
polygon(r3, [xy(639,560),xy(600,560),xy(599,570),xy(520,570),xy(519,560),xy(480,559),xy(480,550),xy(590,549),xy(590,500),xy(540,499),xy(540,450),xy(590,449),xy(590,170),xy(599,170),xy(600,180),xy(639,180)]).
midline(r3, [xy(614,344),xy(615,205),xy(596,185),xy(595,174)]).
midline(r3, [xy(614,345),xy(615,449),xy(611,469),xy(607,475),xy(564,475)]).
midline(r3, [xy(608,475),xy(614,491),xy(615,534),xy(589,560),xy(529,560),xy(523,555),xy(484,555)]).
fillpoint(r3, xy(608,475), 31.4).
fillpoint(r3, xy(611,468), 29.0).
fillpoint(r3, xy(611,481), 29.0).
fillpoint(r3, xy(612,465), 28.0).
fillpoint(r3, xy(612,484), 28.0).
fillpoint(r3, xy(613,462), 27.0).
fillpoint(r3, xy(613,487), 27.0).
fillpoint(r3, xy(614,458), 26.0).
fillpoint(r3, xy(614,492), 26.0).
fillpoint(r3, xy(615,326), 25.0).
fillpoint(r3, xy(564,475), 25.0).
fillpoint(r3, xy(615,518), 25.0).
fillpoint(r3, xy(529,560), 10.0).
fillpoint(r3, xy(590,559), 10.0).
border(r3).
region(r8, '#ffdc00', 7900, centroid(420,455)).
perimeter(r8, 600).
polygon(r8, [xy(439,530),xy(430,530),xy(430,520),xy(420,520),xy(420,510),xy(410,510),xy(410,500),xy(400,499),xy(400,480),xy(390,480),xy(390,470),xy(380,469),xy(380,450),xy(370,449),xy(370,410),xy(360,409),xy(360,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(439,530)]).
midline(r8, [xy(374,380),xy(374,395),xy(379,404),xy(380,411),xy(379,440),xy(383,444),xy(389,460),xy(395,460),xy(412,467),xy(426,477),xy(424,479),xy(424,495),xy(429,504),xy(429,510),xy(434,516),xy(435,525)]).
midline(r8, [xy(375,379),xy(375,374)]).
midline(r8, [xy(427,476),xy(443,474),xy(465,475)]).
fillpoint(r8, xy(427,476), 27.0).
fillpoint(r8, xy(432,475), 26.0).
fillpoint(r8, xy(441,475), 25.0).
fillpoint(r8, xy(405,465), 16.0).
fillpoint(r8, xy(374,385), 15.0).
fillpoint(r8, xy(379,405), 11.0).
fillpoint(r8, xy(394,460), 11.0).
fillpoint(r8, xy(429,505), 11.0).
fillpoint(r8, xy(379,426), 10.0).
region(r4, '#ffdc00', 7300, centroid(467,268)).
perimeter(r4, 440).
polygon(r4, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,210),xy(449,210),xy(450,200),xy(460,199),xy(460,190),xy(479,190),xy(480,180),xy(490,180),xy(489,350)]).
midline(r4, [xy(477,202),xy(474,204),xy(467,224),xy(463,229),xy(465,231),xy(465,278),xy(460,280),xy(460,282)]).
midline(r4, [xy(477,201),xy(484,193),xy(485,184)]).
midline(r4, [xy(464,280),xy(469,292),xy(470,330)]).
fillpoint(r4, xy(464,255), 25.0).
fillpoint(r4, xy(469,293), 21.0).
fillpoint(r4, xy(469,316), 20.0).
fillpoint(r4, xy(474,205), 16.0).
region(r15, '#5a5a5a', 4800, centroid(430,620)).
perimeter(r15, 520).
polygon(r15, [xy(549,630),xy(310,630),xy(310,610),xy(549,610),xy(549,630)]).
midline(r15, [xy(470,620),xy(319,620)]).
midline(r15, [xy(471,619),xy(540,620)]).
fillpoint(r15, xy(319,620), 10.0).
region(r14, '#2ecc40', 3600, centroid(220,620)).
perimeter(r14, 400).
polygon(r14, [xy(309,630),xy(130,630),xy(130,610),xy(309,610),xy(309,630)]).
midline(r14, [xy(279,620),xy(139,620)]).
midline(r14, [xy(280,620),xy(300,620)]).
fillpoint(r14, xy(139,620), 10.0).
region(r12, '#7fdbff', 2000, centroid(64,576)).
perimeter(r12, 240).
polygon(r12, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r12, [xy(51,560),xy(39,560)]).
midline(r12, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r12, xy(58,561), 12.0).
fillpoint(r12, xy(61,578), 12.0).
fillpoint(r12, xy(78,581), 12.0).
fillpoint(r12, xy(54,560), 11.0).
fillpoint(r12, xy(59,565), 11.0).
fillpoint(r12, xy(60,574), 11.0).
fillpoint(r12, xy(65,579), 11.0).
fillpoint(r12, xy(74,580), 11.0).
fillpoint(r12, xy(79,585), 11.0).
fillpoint(r12, xy(39,560), 10.0).
fillpoint(r12, xy(79,596), 10.0).
region(r9, '#870c25', 1500, centroid(564,384)).
perimeter(r9, 160).
polygon(r9, [xy(589,400),xy(540,400),xy(540,370),xy(589,370),xy(589,400)]).
midline(r9, [xy(560,385),xy(554,385)]).
midline(r9, [xy(561,385),xy(575,385)]).
fillpoint(r9, xy(554,385), 15.0).
region(r7, '#bebebe', 1000, centroid(564,360)).
perimeter(r7, 140).
polygon(r7, [xy(589,370),xy(540,370),xy(540,350),xy(589,350),xy(589,370)]).
midline(r7, [xy(559,360),xy(549,360)]).
midline(r7, [xy(560,360),xy(580,360)]).
fillpoint(r7, xy(549,360), 10.0).
region(r10, '#5a5a5a', 800, centroid(564,524)).
perimeter(r10, 160).
polygon(r10, [xy(579,540),xy(550,539),xy(550,510),xy(580,510),xy(579,540)]).
hole(r10, [xy(570,529),xy(569,520),xy(560,520),xy(560,530),xy(570,529)]).
midline(r10, [xy(569,514),xy(555,515),xy(555,534),xy(569,535),xy(574,533),xy(574,516),xy(570,515)]).
fillpoint(r10, xy(556,515), 6.0).
fillpoint(r10, xy(574,515), 6.0).
fillpoint(r10, xy(555,534), 6.0).
fillpoint(r10, xy(573,534), 6.0).
fillpoint(r10, xy(561,515), 5.0).
fillpoint(r10, xy(554,525), 5.0).
fillpoint(r10, xy(574,525), 5.0).
fillpoint(r10, xy(561,535), 5.0).
region(r5, '#0074d9', 500, centroid(444,324)).
perimeter(r5, 120).
polygon(r5, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r5, [xy(445,317),xy(445,345)]).
midline(r5, [xy(445,316),xy(445,304)]).
fillpoint(r5, xy(444,325), 5.0).
region(r13, '#7fdbff', 400, centroid(40,600)).
perimeter(r13, 80).
polygon(r13, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r13, [xy(39,599),xy(40,600)]).
fillpoint(r13, xy(39,600), 10.0).
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
region(r18, '#2ecc40', 400, centroid(630,620)).
perimeter(r18, 80).
polygon(r18, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r18, [xy(629,619),xy(630,620)]).
fillpoint(r18, xy(629,620), 10.0).
border(r18).
region(r11, '#2ecc40', 100, centroid(564,524)).
perimeter(r11, 40).
polygon(r11, [xy(569,530),xy(560,529),xy(560,520),xy(570,520),xy(569,530)]).
midline(r11, [xy(565,525),xy(565,524)]).
fillpoint(r11, xy(564,525), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 390).
adjacent(r1, r3).
shared_edge(r1, r3, 250).
adjacent(r1, r4).
shared_edge(r1, r4, 80).
adjacent(r1, r8).
shared_edge(r1, r8, 250).
adjacent(r1, r12).
shared_edge(r1, r12, 240).
adjacent(r1, r13).
shared_edge(r1, r13, 80).
adjacent(r1, r14).
shared_edge(r1, r14, 380).
adjacent(r1, r15).
shared_edge(r1, r15, 500).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 540).
adjacent(r2, r4).
shared_edge(r2, r4, 300).
adjacent(r2, r5).
shared_edge(r2, r5, 60).
adjacent(r2, r7).
shared_edge(r2, r7, 70).
adjacent(r2, r8).
shared_edge(r2, r8, 320).
adjacent(r2, r9).
shared_edge(r2, r9, 80).
adjacent(r2, r10).
shared_edge(r2, r10, 120).
adjacent(r3, r7).
shared_edge(r3, r7, 20).
adjacent(r3, r9).
shared_edge(r3, r9, 30).
adjacent(r4, r5).
shared_edge(r4, r5, 60).
adjacent(r7, r9).
shared_edge(r7, r9, 50).
adjacent(r10, r11).
shared_edge(r10, r11, 40).
adjacent(r14, r15).
shared_edge(r14, r15, 20).

encloses(r10, r11).
encloses(r1, r12).
encloses(r1, r13).
encloses(r1, r16).
encloses(r1, r17).
