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

region(r1, '#aaaaaa', 303200, centroid(259,308)).
perimeter(r1, 4560).
polygon(r1, [xy(639,130),xy(600,130),xy(599,120),xy(520,120),xy(519,130),xy(480,130),xy(479,140),xy(460,140),xy(460,149),xy(450,150),xy(449,160),xy(430,160),xy(430,169),xy(420,170),xy(420,179),xy(410,180),xy(409,190),xy(400,190),xy(400,209),xy(390,210),xy(390,219),xy(380,220),xy(380,239),xy(370,240),xy(370,279),xy(360,280),xy(360,359),xy(370,360),xy(370,399),xy(380,400),xy(380,419),xy(389,420),xy(390,429),xy(400,430),xy(400,449),xy(409,450),xy(410,459),xy(419,460),xy(420,469),xy(430,470),xy(430,480),xy(449,480),xy(450,489),xy(460,490),xy(460,500),xy(479,500),xy(480,510),xy(519,510),xy(520,520),xy(599,520),xy(600,510),xy(639,510)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(271,427),xy(235,461),xy(200,436),xy(181,404),xy(174,410),xy(166,414),xy(163,413),xy(151,422),xy(138,429),xy(136,428),xy(122,439),xy(104,449),xy(81,468),xy(31,518),xy(17,537),xy(14,551),xy(14,568),xy(17,580),xy(14,590),xy(14,609),xy(17,622),xy(30,625),xy(47,625),xy(60,622),xy(60,600),xy(39,579),xy(18,580)]).
midline(r1, [xy(200,438),xy(187,470),xy(188,473),xy(172,504),xy(173,507),xy(169,510),xy(163,522),xy(164,524),xy(144,555),xy(122,578),xy(114,590),xy(110,602),xy(109,617),xy(102,622),xy(89,625),xy(61,623)]).
midline(r1, [xy(165,522),xy(166,519)]).
midline(r1, [xy(202,440),xy(200,442)]).
midline(r1, [xy(198,447),xy(198,448)]).
midline(r1, [xy(232,458),xy(293,397),xy(299,397),xy(272,426),xy(301,395),xy(304,395),xy(236,462)]).
midline(r1, [xy(305,394),xy(308,394),xy(308,396)]).
midline(r1, [xy(146,553),xy(145,554)]).
midline(r1, [xy(174,508),xy(170,512),xy(173,513),xy(172,515),xy(169,514)]).
midline(r1, [xy(182,403),xy(179,357),xy(179,283),xy(181,243),xy(188,188),xy(241,153),xy(273,136),xy(357,221),xy(359,220),xy(274,135),xy(295,125)]).
midline(r1, [xy(296,123),xy(320,111),xy(329,109)]).
midline(r1, [xy(360,221),xy(359,222)]).
midline(r1, [xy(330,107),xy(343,103)]).
midline(r1, [xy(170,517),xy(168,517)]).
midline(r1, [xy(136,430),xy(135,431)]).
midline(r1, [xy(174,512),xy(173,510)]).
midline(r1, [xy(109,619),xy(120,630),xy(130,635),xy(549,635),xy(554,633),xy(554,565),xy(507,564),xy(490,560),xy(487,557),xy(484,560),xy(460,558),xy(382,536),xy(320,510),xy(270,483),xy(238,462),xy(270,430),xy(240,462)]).
midline(r1, [xy(486,560),xy(487,559)]).
midline(r1, [xy(272,430),xy(305,397),xy(307,398),xy(242,463)]).
midline(r1, [xy(556,565),xy(578,564),xy(585,566),xy(585,632),xy(578,635),xy(555,633)]).
midline(r1, [xy(586,565),xy(595,564),xy(615,585),xy(615,629),xy(614,633),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(308,398),xy(311,397),xy(311,392),xy(312,396)]).
midline(r1, [xy(313,392),xy(320,389),xy(323,390),xy(314,396)]).
midline(r1, [xy(317,395),xy(321,393)]).
midline(r1, [xy(162,416),xy(163,415)]).
midline(r1, [xy(181,406),xy(180,407)]).
midline(r1, [xy(324,392),xy(326,391),xy(325,388),xy(329,386),xy(327,390)]).
midline(r1, [xy(596,563),xy(610,547),xy(615,539),xy(617,530),xy(619,530)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(344,101),xy(371,90),xy(382,88)]).
midline(r1, [xy(383,86),xy(399,83),xy(423,74),xy(464,65),xy(484,64),xy(485,68),xy(483,70),xy(486,69),xy(487,71),xy(484,73),xy(485,77),xy(488,76),xy(487,73)]).
midline(r1, [xy(487,79),xy(489,77)]).
midline(r1, [xy(489,81),xy(492,89),xy(490,92),xy(493,91),xy(492,94),xy(494,94)]).
midline(r1, [xy(494,96),xy(497,99)]).
midline(r1, [xy(486,64),xy(505,60),xy(580,59),xy(607,88),xy(615,100),xy(617,109),xy(619,109)]).
midline(r1, [xy(443,538),xy(460,521),xy(446,537)]).
midline(r1, [xy(229,178),xy(219,170),xy(290,241)]).
midline(r1, [xy(292,241),xy(297,241),xy(224,166),xy(299,241),xy(297,243)]).
midline(r1, [xy(300,241),xy(304,245),xy(314,245),xy(313,247)]).
midline(r1, [xy(315,248),xy(318,247),xy(316,246)]).
midline(r1, [xy(318,245),xy(322,249),xy(318,249)]).
midline(r1, [xy(496,535),xy(492,541),xy(495,542),xy(491,547),xy(491,553),xy(488,556),xy(491,555)]).
midline(r1, [xy(496,534),xy(499,533),xy(496,540)]).
midline(r1, [xy(494,546),xy(493,549)]).
fillpoint(r1, xy(188,189), 189.0).
fillpoint(r1, xy(187,195), 188.0).
fillpoint(r1, xy(186,205), 187.0).
fillpoint(r1, xy(185,215), 186.0).
fillpoint(r1, xy(184,222), 185.0).
fillpoint(r1, xy(183,229), 184.0).
fillpoint(r1, xy(183,406), 183.1).
fillpoint(r1, xy(182,236), 183.0).
fillpoint(r1, xy(182,403), 183.0).
fillpoint(r1, xy(181,246), 182.0).
fillpoint(r1, xy(181,394), 182.0).
fillpoint(r1, xy(180,258), 181.0).
fillpoint(r1, xy(180,381), 181.0).
fillpoint(r1, xy(179,320), 180.0).
fillpoint(r1, xy(384,86), 87.0).
fillpoint(r1, xy(351,523), 87.0).
fillpoint(r1, xy(391,84), 85.0).
fillpoint(r1, xy(396,83), 84.0).
fillpoint(r1, xy(411,78), 79.0).
fillpoint(r1, xy(414,77), 78.0).
fillpoint(r1, xy(417,76), 77.0).
fillpoint(r1, xy(424,74), 75.0).
fillpoint(r1, xy(428,73), 74.0).
fillpoint(r1, xy(433,72), 73.0).
fillpoint(r1, xy(438,71), 72.0).
fillpoint(r1, xy(442,70), 71.0).
fillpoint(r1, xy(392,539), 71.0).
fillpoint(r1, xy(445,69), 70.0).
fillpoint(r1, xy(395,540), 70.0).
fillpoint(r1, xy(449,68), 69.0).
fillpoint(r1, xy(399,541), 69.0).
fillpoint(r1, xy(454,67), 68.0).
fillpoint(r1, xy(404,542), 68.0).
fillpoint(r1, xy(460,66), 67.0).
fillpoint(r1, xy(409,543), 67.0).
fillpoint(r1, xy(467,65), 66.0).
fillpoint(r1, xy(487,64), 65.0).
fillpoint(r1, xy(495,62), 63.0).
fillpoint(r1, xy(500,61), 62.0).
fillpoint(r1, xy(422,548), 62.0).
fillpoint(r1, xy(508,60), 61.0).
fillpoint(r1, xy(425,549), 61.0).
fillpoint(r1, xy(521,60), 60.0).
fillpoint(r1, xy(428,550), 60.0).
fillpoint(r1, xy(432,551), 59.0).
fillpoint(r1, xy(436,552), 58.0).
fillpoint(r1, xy(441,553), 57.0).
fillpoint(r1, xy(453,556), 54.0).
fillpoint(r1, xy(457,557), 53.0).
fillpoint(r1, xy(462,558), 52.0).
fillpoint(r1, xy(468,559), 51.0).
fillpoint(r1, xy(481,560), 50.0).
fillpoint(r1, xy(498,562), 48.0).
border(r1).
region(r2, '#2ecc40', 54100, centroid(493,320)).
perimeter(r2, 1840).
polygon(r2, [xy(589,520),xy(580,520),xy(579,510),xy(550,510),xy(549,520),xy(520,520),xy(519,510),xy(480,510),xy(480,500),xy(490,499),xy(490,450),xy(400,450),xy(400,430),xy(390,429),xy(390,350),xy(360,349),xy(360,280),xy(370,279),xy(370,240),xy(380,239),xy(380,220),xy(389,220),xy(390,210),xy(399,210),xy(400,200),xy(440,200),xy(440,349),xy(490,349),xy(490,130),xy(519,130),xy(520,120),xy(549,120),xy(550,129),xy(559,130),xy(560,140),xy(569,140),xy(570,130),xy(580,129),xy(580,120),xy(590,120),xy(590,299),xy(540,300),xy(540,349),xy(590,350),xy(590,449),xy(540,450),xy(540,499),xy(589,500),xy(589,520)]).
midline(r2, [xy(417,223),xy(408,244),xy(409,249),xy(405,263),xy(403,265),xy(392,258),xy(392,260)]).
midline(r2, [xy(404,265),xy(404,290),xy(400,305),xy(394,306),xy(388,301),xy(386,302),xy(388,303)]).
midline(r2, [xy(399,307),xy(395,307)]).
midline(r2, [xy(399,309),xy(413,336),xy(418,369),xy(427,385),xy(439,398),xy(439,401),xy(442,399),xy(515,400),xy(515,484),xy(495,503),xy(484,505)]).
midline(r2, [xy(515,485),xy(525,496),xy(531,508),xy(540,510),xy(544,506),xy(552,504),xy(579,504),xy(584,505),xy(585,515)]).
midline(r2, [xy(514,300),xy(514,397),xy(518,400),xy(540,400)]).
midline(r2, [xy(515,299),xy(516,286),xy(523,270),xy(540,250),xy(540,185),xy(530,169),xy(535,154),xy(535,134)]).
midline(r2, [xy(541,185),xy(552,177),xy(575,153),xy(579,145),xy(579,139),xy(584,133),xy(585,124)]).
fillpoint(r2, xy(514,400), 55.9).
fillpoint(r2, xy(539,218), 50.0).
fillpoint(r2, xy(439,400), 50.0).
fillpoint(r2, xy(400,308), 40.0).
fillpoint(r2, xy(402,298), 38.0).
fillpoint(r2, xy(403,294), 37.0).
fillpoint(r2, xy(404,289), 36.0).
fillpoint(r2, xy(404,271), 35.0).
fillpoint(r2, xy(408,253), 32.0).
fillpoint(r2, xy(409,248), 31.0).
fillpoint(r2, xy(411,238), 29.0).
fillpoint(r2, xy(518,281), 29.0).
fillpoint(r2, xy(411,331), 29.0).
fillpoint(r2, xy(418,368), 29.0).
fillpoint(r2, xy(412,235), 28.0).
fillpoint(r2, xy(517,284), 28.0).
fillpoint(r2, xy(412,334), 28.0).
fillpoint(r2, xy(417,365), 28.0).
fillpoint(r2, xy(516,287), 27.0).
fillpoint(r2, xy(413,337), 27.0).
fillpoint(r2, xy(416,362), 27.0).
fillpoint(r2, xy(515,292), 26.0).
fillpoint(r2, xy(414,342), 26.0).
fillpoint(r2, xy(415,358), 26.0).
fillpoint(r2, xy(514,325), 25.0).
fillpoint(r2, xy(515,468), 25.0).
region(r5, '#ffdc00', 21700, centroid(609,337)).
perimeter(r5, 1000).
polygon(r5, [xy(639,510),xy(600,510),xy(600,519),xy(590,520),xy(589,500),xy(540,499),xy(540,450),xy(590,449),xy(590,120),xy(599,120),xy(600,130),xy(639,130)]).
midline(r5, [xy(614,170),xy(615,156),xy(596,135),xy(595,124)]).
midline(r5, [xy(615,171),xy(614,459),xy(610,471),xy(606,475),xy(564,475)]).
midline(r5, [xy(608,475),xy(612,482),xy(608,487),xy(609,489),xy(596,504),xy(595,515)]).
midline(r5, [xy(610,487),xy(610,488)]).
fillpoint(r5, xy(608,475), 31.4).
fillpoint(r5, xy(611,468), 29.0).
fillpoint(r5, xy(611,481), 29.0).
fillpoint(r5, xy(612,465), 28.0).
fillpoint(r5, xy(613,462), 27.0).
fillpoint(r5, xy(614,458), 26.0).
fillpoint(r5, xy(615,301), 25.0).
fillpoint(r5, xy(564,475), 25.0).
border(r5).
region(r6, '#ffdc00', 10400, centroid(464,239)).
perimeter(r6, 600).
polygon(r6, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(410,189),xy(410,180),xy(419,180),xy(420,170),xy(429,170),xy(430,160),xy(449,160),xy(450,150),xy(460,149),xy(460,140),xy(479,140),xy(480,130),xy(490,130),xy(489,350)]).
midline(r6, [xy(464,186),xy(463,181),xy(444,174),xy(435,179),xy(429,179),xy(423,184),xy(414,185)]).
midline(r6, [xy(464,187),xy(465,275),xy(463,279),xy(465,279)]).
midline(r6, [xy(464,180),xy(474,154),xy(484,143),xy(485,134)]).
midline(r6, [xy(465,281),xy(470,300),xy(470,330)]).
fillpoint(r6, xy(464,182), 26.0).
fillpoint(r6, xy(464,236), 25.0).
fillpoint(r6, xy(469,293), 21.0).
fillpoint(r6, xy(469,316), 20.0).
fillpoint(r6, xy(474,155), 16.0).
fillpoint(r6, xy(445,175), 16.0).
fillpoint(r6, xy(434,179), 11.0).
region(r19, '#5a5a5a', 4400, centroid(440,620)).
perimeter(r19, 480).
polygon(r19, [xy(549,630),xy(330,630),xy(330,610),xy(549,610),xy(549,630)]).
midline(r19, [xy(501,620),xy(339,620)]).
midline(r19, [xy(502,619),xy(540,620)]).
fillpoint(r19, xy(339,620), 10.0).
region(r18, '#2ecc40', 4000, centroid(230,620)).
perimeter(r18, 440).
polygon(r18, [xy(329,630),xy(130,630),xy(130,610),xy(329,610),xy(329,630)]).
midline(r18, [xy(304,619),xy(139,620)]).
midline(r18, [xy(305,620),xy(320,620)]).
fillpoint(r18, xy(139,620), 10.0).
region(r14, '#ffdc00', 2800, centroid(458,470)).
perimeter(r14, 260).
polygon(r14, [xy(489,500),xy(460,500),xy(460,490),xy(450,490),xy(449,480),xy(430,480),xy(430,470),xy(420,470),xy(420,460),xy(410,459),xy(410,450),xy(489,450),xy(489,500)]).
midline(r14, [xy(469,470),xy(456,465),xy(444,465),xy(435,460),xy(429,460),xy(423,455),xy(414,455)]).
midline(r14, [xy(469,472),xy(475,485)]).
fillpoint(r14, xy(468,471), 21.0).
fillpoint(r14, xy(455,465), 16.0).
fillpoint(r14, xy(474,484), 16.0).
fillpoint(r14, xy(448,464), 15.0).
fillpoint(r14, xy(434,460), 11.0).
region(r16, '#7fdbff', 2000, centroid(64,576)).
perimeter(r16, 240).
polygon(r16, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r16, [xy(51,560),xy(39,560)]).
midline(r16, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r16, xy(58,561), 12.0).
fillpoint(r16, xy(61,578), 12.0).
fillpoint(r16, xy(78,581), 12.0).
fillpoint(r16, xy(54,560), 11.0).
fillpoint(r16, xy(59,565), 11.0).
fillpoint(r16, xy(60,574), 11.0).
fillpoint(r16, xy(65,579), 11.0).
fillpoint(r16, xy(74,580), 11.0).
fillpoint(r16, xy(79,585), 11.0).
fillpoint(r16, xy(39,560), 10.0).
fillpoint(r16, xy(79,596), 10.0).
region(r11, '#870c25', 1500, centroid(564,334)).
perimeter(r11, 160).
polygon(r11, [xy(589,350),xy(540,350),xy(540,320),xy(589,320),xy(589,350)]).
midline(r11, [xy(562,335),xy(554,335)]).
midline(r11, [xy(563,335),xy(575,335)]).
fillpoint(r11, xy(554,335), 15.0).
region(r10, '#bebebe', 1000, centroid(564,310)).
perimeter(r10, 140).
polygon(r10, [xy(589,320),xy(540,320),xy(540,300),xy(589,300),xy(589,320)]).
midline(r10, [xy(559,310),xy(549,310)]).
midline(r10, [xy(560,310),xy(580,310)]).
fillpoint(r10, xy(549,310), 10.0).
region(r13, '#ffdc00', 1000, centroid(380,386)).
perimeter(r13, 160).
polygon(r13, [xy(389,420),xy(380,419),xy(380,400),xy(370,399),xy(370,360),xy(390,360),xy(389,420)]).
midline(r13, [xy(384,398),xy(379,390),xy(380,369)]).
midline(r13, [xy(384,399),xy(385,415)]).
fillpoint(r13, xy(379,380), 10.0).
fillpoint(r13, xy(385,408), 5.0).
region(r9, '#0074d9', 500, centroid(444,324)).
perimeter(r9, 120).
polygon(r9, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r9, [xy(445,317),xy(445,304)]).
midline(r9, [xy(445,318),xy(445,345)]).
fillpoint(r9, xy(444,325), 5.0).
region(r8, '#0074d9', 400, centroid(420,194)).
perimeter(r8, 100).
polygon(r8, [xy(439,200),xy(400,200),xy(400,190),xy(439,190),xy(439,200)]).
midline(r8, [xy(419,194),xy(404,195)]).
midline(r8, [xy(420,194),xy(435,195)]).
fillpoint(r8, xy(404,195), 5.0).
region(r17, '#7fdbff', 400, centroid(40,600)).
perimeter(r17, 80).
polygon(r17, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r17, [xy(39,599),xy(40,600)]).
fillpoint(r17, xy(39,600), 10.0).
region(r20, '#7fdbff', 400, centroid(570,620)).
perimeter(r20, 80).
polygon(r20, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r20, [xy(569,619),xy(570,620)]).
fillpoint(r20, xy(569,620), 10.0).
region(r21, '#7fdbff', 400, centroid(600,620)).
perimeter(r21, 80).
polygon(r21, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r21, [xy(599,619),xy(600,620)]).
fillpoint(r21, xy(599,620), 10.0).
region(r22, '#2ecc40', 400, centroid(630,620)).
perimeter(r22, 80).
polygon(r22, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r22, [xy(629,619),xy(630,620)]).
fillpoint(r22, xy(629,620), 10.0).
border(r22).

adjacent(r1, r2).
shared_edge(r1, r2, 420).
adjacent(r1, r5).
shared_edge(r1, r5, 120).
adjacent(r1, r6).
shared_edge(r1, r6, 140).
adjacent(r1, r8).
shared_edge(r1, r8, 20).
adjacent(r1, r13).
shared_edge(r1, r13, 80).
adjacent(r1, r14).
shared_edge(r1, r14, 120).
adjacent(r1, r16).
shared_edge(r1, r16, 240).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 420).
adjacent(r1, r19).
shared_edge(r1, r19, 460).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 60).
adjacent(r2, r5).
shared_edge(r2, r5, 450).
adjacent(r2, r6).
shared_edge(r2, r6, 360).
adjacent(r2, r8).
shared_edge(r2, r8, 40).
adjacent(r2, r9).
shared_edge(r2, r9, 60).
adjacent(r2, r10).
shared_edge(r2, r10, 70).
adjacent(r2, r11).
shared_edge(r2, r11, 80).
adjacent(r2, r13).
shared_edge(r2, r13, 60).
adjacent(r2, r14).
shared_edge(r2, r14, 140).
adjacent(r5, r10).
shared_edge(r5, r10, 20).
adjacent(r5, r11).
shared_edge(r5, r11, 30).
adjacent(r6, r8).
shared_edge(r6, r8, 40).
adjacent(r6, r9).
shared_edge(r6, r9, 60).
adjacent(r10, r11).
shared_edge(r10, r11, 50).
adjacent(r18, r19).
shared_edge(r18, r19, 20).

encloses(r1, r16).
encloses(r1, r17).
encloses(r1, r20).
encloses(r1, r21).
