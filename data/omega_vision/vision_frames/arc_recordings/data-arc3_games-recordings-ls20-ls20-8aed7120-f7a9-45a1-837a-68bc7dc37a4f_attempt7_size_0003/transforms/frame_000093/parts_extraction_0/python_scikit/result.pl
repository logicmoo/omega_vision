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

region(r1, '#aaaaaa', 286200, centroid(254,307)).
perimeter(r1, 4780).
polygon(r1, [xy(639,160),xy(620,160),xy(620,150),xy(610,150),xy(609,140),xy(590,140),xy(589,130),xy(550,130),xy(549,120),xy(470,120),xy(469,130),xy(430,130),xy(429,140),xy(410,140),xy(410,149),xy(400,150),xy(399,160),xy(380,160),xy(380,169),xy(370,170),xy(370,179),xy(360,180),xy(359,190),xy(350,190),xy(350,209),xy(340,210),xy(340,219),xy(330,220),xy(330,239),xy(320,240),xy(320,279),xy(310,280),xy(310,359),xy(320,360),xy(320,399),xy(330,400),xy(330,419),xy(339,420),xy(340,429),xy(350,430),xy(350,449),xy(359,450),xy(360,459),xy(369,460),xy(370,469),xy(379,470),xy(380,480),xy(399,480),xy(400,489),xy(409,490),xy(410,500),xy(429,500),xy(430,510),xy(469,510),xy(470,520),xy(549,520),xy(550,510),xy(589,510),xy(590,500),xy(609,500),xy(610,490),xy(620,489),xy(620,480),xy(639,480)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(577,62),xy(548,59),xy(472,59),xy(455,60),xy(430,66),xy(414,65),xy(373,74),xy(349,83),xy(321,90),xy(263,114),xy(167,167)]).
midline(r1, [xy(167,169),xy(156,245),xy(154,281),xy(154,359),xy(158,405),xy(103,446),xy(30,519),xy(19,533),xy(14,550),xy(14,586),xy(17,602),xy(27,616),xy(43,624),xy(88,625),xy(106,620),xy(109,617),xy(111,598),xy(119,581),xy(118,579),xy(81,580),xy(59,560)]).
midline(r1, [xy(174,166),xy(248,242),xy(172,167)]).
midline(r1, [xy(249,243),xy(255,245),xy(260,243),xy(259,246)]).
midline(r1, [xy(261,246),xy(262,243)]).
midline(r1, [xy(435,66),xy(432,66),xy(431,70),xy(428,67)]).
midline(r1, [xy(60,491),xy(60,558)]).
midline(r1, [xy(109,619),xy(120,630),xy(130,635),xy(549,635),xy(555,632),xy(555,567),xy(552,564),xy(473,565),xy(447,562),xy(437,556),xy(444,547),xy(445,539),xy(450,534)]).
midline(r1, [xy(448,538),xy(447,539)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,631),xy(585,563),xy(580,559),xy(554,565)]).
midline(r1, [xy(580,558),xy(578,556),xy(580,556)]).
midline(r1, [xy(585,560),xy(588,560),xy(604,542),xy(612,525),xy(622,512),xy(630,489)]).
midline(r1, [xy(590,560),xy(615,585),xy(615,632),xy(606,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(440,557),xy(442,552)]).
midline(r1, [xy(577,64),xy(583,75),xy(578,83),xy(575,96),xy(571,101),xy(574,100)]).
midline(r1, [xy(580,82),xy(579,86)]).
midline(r1, [xy(584,74),xy(582,82)]).
midline(r1, [xy(586,76),xy(602,94),xy(611,110),xy(612,113),xy(607,119),xy(613,114),xy(620,123),xy(630,150)]).
midline(r1, [xy(584,79),xy(584,78)]).
midline(r1, [xy(245,242),xy(170,168),xy(241,241)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(158,407),xy(167,417),xy(188,450),xy(241,399),xy(189,451),xy(192,456),xy(251,397),xy(242,398)]).
midline(r1, [xy(193,457),xy(203,472),xy(194,491),xy(161,538),xy(120,579)]).
midline(r1, [xy(251,395),xy(266,392),xy(280,386),xy(281,389),xy(284,386)]).
midline(r1, [xy(286,384),xy(292,381),xy(292,383)]).
midline(r1, [xy(204,473),xy(227,487),xy(268,507),xy(270,510),xy(341,539),xy(380,501),xy(344,539),xy(381,550),xy(410,521),xy(382,551)]).
midline(r1, [xy(384,551),xy(416,559),xy(438,559)]).
midline(r1, [xy(434,75),xy(432,71),xy(435,68),xy(435,76),xy(437,79),xy(437,74)]).
midline(r1, [xy(439,79),xy(438,80)]).
midline(r1, [xy(437,71),xy(437,72)]).
midline(r1, [xy(345,101),xy(331,89),xy(380,138)]).
midline(r1, [xy(264,125),xy(329,190)]).
midline(r1, [xy(272,250),xy(265,245),xy(263,247),xy(267,249)]).
midline(r1, [xy(273,251),xy(278,252),xy(280,250),xy(282,252),xy(279,253)]).
midline(r1, [xy(282,254),xy(293,257)]).
fillpoint(r1, xy(168,168), 168.2).
fillpoint(r1, xy(167,170), 168.0).
fillpoint(r1, xy(166,175), 167.0).
fillpoint(r1, xy(165,180), 166.0).
fillpoint(r1, xy(164,186), 165.0).
fillpoint(r1, xy(163,192), 164.0).
fillpoint(r1, xy(162,199), 163.0).
fillpoint(r1, xy(161,207), 162.0).
fillpoint(r1, xy(160,219), 161.0).
fillpoint(r1, xy(159,227), 160.0).
fillpoint(r1, xy(158,233), 159.0).
fillpoint(r1, xy(158,406), 159.0).
fillpoint(r1, xy(157,239), 158.0).
fillpoint(r1, xy(157,400), 158.0).
fillpoint(r1, xy(156,248), 157.0).
fillpoint(r1, xy(156,392), 157.0).
fillpoint(r1, xy(155,260), 156.0).
fillpoint(r1, xy(155,380), 156.0).
fillpoint(r1, xy(154,320), 155.0).
fillpoint(r1, xy(189,451), 140.7).
fillpoint(r1, xy(191,454), 140.1).
fillpoint(r1, xy(193,457), 139.5).
fillpoint(r1, xy(195,460), 139.1).
fillpoint(r1, xy(197,463), 138.7).
fillpoint(r1, xy(199,466), 138.3).
fillpoint(r1, xy(201,469), 138.1).
fillpoint(r1, xy(202,471), 137.9).
fillpoint(r1, xy(334,86), 87.0).
fillpoint(r1, xy(301,523), 87.0).
fillpoint(r1, xy(341,84), 85.0).
fillpoint(r1, xy(346,83), 84.0).
fillpoint(r1, xy(361,78), 79.0).
fillpoint(r1, xy(364,77), 78.0).
fillpoint(r1, xy(367,76), 77.0).
fillpoint(r1, xy(374,74), 75.0).
fillpoint(r1, xy(378,73), 74.0).
fillpoint(r1, xy(383,72), 73.0).
fillpoint(r1, xy(388,71), 72.0).
fillpoint(r1, xy(392,70), 71.0).
fillpoint(r1, xy(342,539), 71.0).
fillpoint(r1, xy(395,69), 70.0).
fillpoint(r1, xy(345,540), 70.0).
fillpoint(r1, xy(399,68), 69.0).
fillpoint(r1, xy(349,541), 69.0).
fillpoint(r1, xy(404,67), 68.0).
fillpoint(r1, xy(354,542), 68.0).
fillpoint(r1, xy(410,66), 67.0).
fillpoint(r1, xy(359,543), 67.0).
fillpoint(r1, xy(417,65), 66.0).
fillpoint(r1, xy(437,64), 65.0).
fillpoint(r1, xy(576,63), 63.1).
fillpoint(r1, xy(445,62), 63.0).
fillpoint(r1, xy(574,62), 63.0).
fillpoint(r1, xy(450,61), 62.0).
fillpoint(r1, xy(569,61), 62.0).
fillpoint(r1, xy(372,548), 62.0).
fillpoint(r1, xy(458,60), 61.0).
fillpoint(r1, xy(562,60), 61.0).
fillpoint(r1, xy(375,549), 61.0).
fillpoint(r1, xy(471,60), 60.0).
fillpoint(r1, xy(378,550), 60.0).
fillpoint(r1, xy(382,551), 59.0).
fillpoint(r1, xy(386,552), 58.0).
fillpoint(r1, xy(391,553), 57.0).
fillpoint(r1, xy(403,556), 54.0).
fillpoint(r1, xy(407,557), 53.0).
fillpoint(r1, xy(412,558), 52.0).
fillpoint(r1, xy(418,559), 51.0).
fillpoint(r1, xy(585,560), 50.2).
fillpoint(r1, xy(431,560), 50.0).
fillpoint(r1, xy(578,560), 50.0).
fillpoint(r1, xy(448,562), 48.0).
fillpoint(r1, xy(571,562), 48.0).
fillpoint(r1, xy(453,563), 47.0).
fillpoint(r1, xy(566,563), 47.0).
fillpoint(r1, xy(459,564), 46.0).
fillpoint(r1, xy(559,564), 46.0).
fillpoint(r1, xy(561,564), 46.0).
fillpoint(r1, xy(471,565), 45.0).
border(r1).
region(r3, '#2ecc40', 64700, centroid(471,316)).
perimeter(r3, 2300).
polygon(r3, [xy(549,520),xy(470,520),xy(469,510),xy(440,510),xy(440,500),xy(490,499),xy(490,450),xy(390,450),xy(389,350),xy(340,350),xy(340,419),xy(330,420),xy(330,400),xy(320,399),xy(320,360),xy(310,359),xy(310,280),xy(320,279),xy(320,240),xy(330,239),xy(330,220),xy(339,220),xy(340,210),xy(350,209),xy(350,190),xy(359,190),xy(360,180),xy(369,180),xy(370,170),xy(379,170),xy(380,160),xy(390,160),xy(390,200),xy(440,200),xy(440,349),xy(540,349),xy(540,300),xy(490,299),xy(490,120),xy(549,120),xy(550,130),xy(590,130),xy(590,449),xy(540,450),xy(540,499),xy(589,500),xy(590,509),xy(550,510),xy(549,520)]).
hole(r3, [xy(570,289),xy(570,280),xy(580,279),xy(580,270),xy(570,270),xy(569,260),xy(560,260),xy(560,269),xy(550,270),xy(550,279),xy(559,280),xy(560,290),xy(570,289)]).
midline(r3, [xy(439,400),xy(427,385),xy(418,369),xy(413,336),xy(407,322),xy(398,309),xy(379,289),xy(363,301),xy(349,308),xy(333,327),xy(324,345),xy(329,354),xy(329,390),xy(335,400),xy(335,415)]).
midline(r3, [xy(379,288),xy(379,281),xy(374,276),xy(365,272),xy(357,265),xy(350,262),xy(350,264)]).
midline(r3, [xy(365,270),xy(365,268),xy(360,266)]).
midline(r3, [xy(441,399),xy(503,400),xy(513,402),xy(515,407),xy(515,494),xy(503,505),xy(495,509),xy(479,510),xy(469,504),xy(444,505)]).
midline(r3, [xy(379,280),xy(369,269),xy(367,270)]).
midline(r3, [xy(380,277),xy(374,272)]).
midline(r3, [xy(369,271),xy(372,274)]).
midline(r3, [xy(540,400),xy(526,400),xy(515,403)]).
midline(r3, [xy(540,398),xy(556,379),xy(563,363),xy(565,315),xy(546,290),xy(536,285),xy(519,270),xy(524,246),xy(540,214),xy(540,178),xy(522,152),xy(531,142)]).
midline(r3, [xy(565,314),xy(575,303),xy(579,295),xy(579,289),xy(585,279),xy(585,270),xy(579,260),xy(579,254),xy(575,246),xy(550,220),xy(541,214)]).
midline(r3, [xy(525,152),xy(525,153)]).
midline(r3, [xy(515,495),xy(526,505),xy(540,510),xy(546,505),xy(553,504),xy(585,505)]).
midline(r3, [xy(379,183),xy(379,179),xy(384,173),xy(385,164)]).
midline(r3, [xy(379,184),xy(370,207),xy(379,240),xy(379,249),xy(381,249)]).
midline(r3, [xy(381,251),xy(384,255),xy(379,274)]).
fillpoint(r3, xy(379,289), 60.8).
fillpoint(r3, xy(380,275), 60.0).
fillpoint(r3, xy(381,267), 59.0).
fillpoint(r3, xy(382,263), 58.0).
fillpoint(r3, xy(383,258), 57.0).
fillpoint(r3, xy(515,403), 53.2).
fillpoint(r3, xy(512,402), 53.0).
fillpoint(r3, xy(517,402), 53.0).
fillpoint(r3, xy(508,401), 52.0).
fillpoint(r3, xy(522,401), 52.0).
fillpoint(r3, xy(501,400), 51.0).
fillpoint(r3, xy(528,400), 51.0).
fillpoint(r3, xy(540,196), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(521,256), 32.0).
fillpoint(r3, xy(520,262), 31.0).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(561,368), 29.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(562,365), 28.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(563,362), 27.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(564,358), 26.0).
fillpoint(r3, xy(565,331), 25.0).
fillpoint(r3, xy(515,473), 25.0).
fillpoint(r3, xy(374,195), 16.0).
fillpoint(r3, xy(325,344), 16.0).
region(r5, '#ffdc00', 19500, centroid(607,339)).
perimeter(r5, 920).
polygon(r5, [xy(639,480),xy(620,480),xy(620,489),xy(610,490),xy(609,500),xy(540,499),xy(540,450),xy(590,449),xy(590,140),xy(609,140),xy(610,149),xy(620,150),xy(620,160),xy(639,160)]).
midline(r5, [xy(614,300),xy(615,184),xy(607,172),xy(600,155),xy(600,149)]).
midline(r5, [xy(615,301),xy(614,455),xy(599,470),xy(590,475),xy(564,475)]).
midline(r5, [xy(590,476),xy(591,480)]).
fillpoint(r5, xy(614,455), 25.7).
fillpoint(r5, xy(615,316), 25.0).
fillpoint(r5, xy(564,475), 25.0).
fillpoint(r5, xy(590,474), 25.0).
fillpoint(r5, xy(600,469), 22.8).
fillpoint(r5, xy(605,165), 16.0).
fillpoint(r5, xy(600,154), 11.0).
border(r5).
region(r2, '#ffdc00', 12600, centroid(458,224)).
perimeter(r2, 660).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,160),xy(399,160),xy(400,150),xy(439,150),xy(440,130),xy(469,130),xy(470,120),xy(490,120),xy(489,350)]).
midline(r2, [xy(464,280),xy(465,194),xy(461,170),xy(417,169),xy(404,175)]).
midline(r2, [xy(461,168),xy(464,154),xy(475,143),xy(480,129)]).
midline(r2, [xy(465,281),xy(469,292),xy(470,330)]).
fillpoint(r2, xy(460,170), 29.0).
fillpoint(r2, xy(462,165), 28.0).
fillpoint(r2, xy(462,174), 28.0).
fillpoint(r2, xy(463,162), 27.0).
fillpoint(r2, xy(463,177), 27.0).
fillpoint(r2, xy(464,158), 26.0).
fillpoint(r2, xy(464,182), 26.0).
fillpoint(r2, xy(464,236), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(416,170), 20.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(405,174), 16.0).
fillpoint(r2, xy(479,134), 11.0).
region(r14, '#ffdc00', 9700, centroid(404,442)).
perimeter(r14, 600).
polygon(r14, [xy(439,510),xy(430,510),xy(429,500),xy(410,500),xy(410,490),xy(400,490),xy(399,480),xy(380,480),xy(380,470),xy(370,470),xy(370,460),xy(360,460),xy(360,450),xy(350,449),xy(350,430),xy(340,429),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(439,510)]).
midline(r14, [xy(391,463),xy(380,456),xy(369,432),xy(369,422),xy(365,410),xy(360,410),xy(360,412)]).
midline(r14, [xy(392,464),xy(406,465),xy(424,472),xy(429,475),xy(426,481),xy(428,481)]).
midline(r14, [xy(430,475),xy(435,476),xy(435,505)]).
midline(r14, [xy(365,408),xy(365,384)]).
midline(r14, [xy(436,475),xy(465,475)]).
fillpoint(r14, xy(435,475), 25.5).
fillpoint(r14, xy(365,397), 25.0).
fillpoint(r14, xy(441,475), 25.0).
fillpoint(r14, xy(369,423), 21.0).
fillpoint(r14, xy(369,432), 20.0).
fillpoint(r14, xy(374,444), 16.0).
fillpoint(r14, xy(405,465), 16.0).
fillpoint(r14, xy(398,464), 15.0).
fillpoint(r14, xy(381,458), 12.2).
region(r17, '#2ecc40', 6000, centroid(280,620)).
perimeter(r17, 640).
polygon(r17, [xy(429,630),xy(130,630),xy(130,610),xy(429,610),xy(429,630)]).
midline(r17, [xy(239,620),xy(139,620)]).
midline(r17, [xy(240,619),xy(420,620)]).
fillpoint(r17, xy(139,620), 10.0).
region(r18, '#5a5a5a', 2400, centroid(490,620)).
perimeter(r18, 280).
polygon(r18, [xy(549,630),xy(430,630),xy(430,610),xy(549,610),xy(549,630)]).
midline(r18, [xy(441,619),xy(439,620)]).
midline(r18, [xy(442,620),xy(540,620)]).
fillpoint(r18, xy(439,620), 10.0).
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
region(r12, '#870c25', 1500, centroid(514,334)).
perimeter(r12, 160).
polygon(r12, [xy(539,350),xy(490,350),xy(490,320),xy(539,320),xy(539,350)]).
midline(r12, [xy(510,335),xy(504,335)]).
midline(r12, [xy(511,335),xy(525,335)]).
fillpoint(r12, xy(504,335), 15.0).
region(r11, '#bebebe', 1000, centroid(514,310)).
perimeter(r11, 140).
polygon(r11, [xy(539,320),xy(490,320),xy(490,300),xy(539,300),xy(539,320)]).
midline(r11, [xy(509,310),xy(499,310)]).
midline(r11, [xy(510,309),xy(530,310)]).
fillpoint(r11, xy(499,310), 10.0).
region(r6, '#0074d9', 500, centroid(414,194)).
perimeter(r6, 120).
polygon(r6, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r6, [xy(409,194),xy(394,195)]).
midline(r6, [xy(410,194),xy(435,195)]).
fillpoint(r6, xy(394,195), 5.0).
region(r10, '#0074d9', 500, centroid(444,324)).
perimeter(r10, 120).
polygon(r10, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r10, [xy(445,317),xy(445,304)]).
midline(r10, [xy(445,318),xy(445,345)]).
fillpoint(r10, xy(444,325), 5.0).
region(r13, '#0074d9', 500, centroid(364,354)).
perimeter(r13, 120).
polygon(r13, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r13, [xy(380,355),xy(344,355)]).
midline(r13, [xy(381,355),xy(385,355)]).
fillpoint(r13, xy(344,355), 5.0).
region(r4, '#2ecc40', 400, centroid(427,142)).
perimeter(r4, 100).
polygon(r4, [xy(439,150),xy(410,150),xy(410,140),xy(429,140),xy(430,130),xy(439,130),xy(439,150)]).
midline(r4, [xy(423,145),xy(414,145)]).
midline(r4, [xy(424,144),xy(433,144),xy(435,134)]).
fillpoint(r4, xy(433,144), 6.0).
fillpoint(r4, xy(435,136), 5.0).
fillpoint(r4, xy(414,145), 5.0).
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

adjacent(r1, r2).
shared_edge(r1, r2, 90).
adjacent(r1, r3).
shared_edge(r1, r3, 670).
adjacent(r1, r4).
shared_edge(r1, r4, 50).
adjacent(r1, r5).
shared_edge(r1, r5, 140).
adjacent(r1, r14).
shared_edge(r1, r14, 190).
adjacent(r1, r15).
shared_edge(r1, r15, 240).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 620).
adjacent(r1, r18).
shared_edge(r1, r18, 260).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 350).
adjacent(r2, r4).
shared_edge(r2, r4, 50).
adjacent(r2, r6).
shared_edge(r2, r6, 60).
adjacent(r2, r10).
shared_edge(r2, r10, 60).
adjacent(r2, r11).
shared_edge(r2, r11, 20).
adjacent(r2, r12).
shared_edge(r2, r12, 30).
adjacent(r3, r5).
shared_edge(r3, r5, 460).
adjacent(r3, r6).
shared_edge(r3, r6, 60).
adjacent(r3, r10).
shared_edge(r3, r10, 60).
adjacent(r3, r11).
shared_edge(r3, r11, 70).
adjacent(r3, r12).
shared_edge(r3, r12, 80).
adjacent(r3, r13).
shared_edge(r3, r13, 70).
adjacent(r3, r14).
shared_edge(r3, r14, 360).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r13, r14).
shared_edge(r13, r14, 50).
adjacent(r17, r18).
shared_edge(r17, r18, 20).

encloses(r1, r15).
encloses(r1, r16).
encloses(r1, r19).
encloses(r1, r20).
