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

region(r1, '#aaaaaa', 303200, centroid(259,339)).
perimeter(r1, 4560).
polygon(r1, [xy(639,30),xy(600,30),xy(599,20),xy(520,20),xy(519,30),xy(480,30),xy(479,40),xy(460,40),xy(460,49),xy(450,50),xy(449,60),xy(430,60),xy(430,69),xy(420,70),xy(420,79),xy(410,80),xy(410,89),xy(400,90),xy(400,109),xy(390,110),xy(390,119),xy(380,120),xy(380,139),xy(370,140),xy(370,179),xy(360,180),xy(360,259),xy(370,260),xy(370,299),xy(380,300),xy(380,319),xy(389,320),xy(390,330),xy(400,330),xy(400,349),xy(409,350),xy(410,359),xy(419,360),xy(420,369),xy(430,370),xy(430,380),xy(449,380),xy(450,389),xy(460,390),xy(460,400),xy(479,400),xy(480,410),xy(519,410),xy(520,420),xy(599,420),xy(600,410),xy(639,410)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(70,609),xy(70,590),xy(90,589),xy(90,550),xy(70,550),xy(70,569),xy(50,570),xy(50,550),xy(30,550),xy(30,569),xy(49,570),xy(50,589),xy(30,590),xy(30,609),xy(70,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(179,179),xy(180,285),xy(187,346),xy(194,383),xy(142,417),xy(139,417),xy(105,444),xy(23,527),xy(17,537),xy(14,550),xy(14,568),xy(17,580),xy(14,590),xy(14,609),xy(17,622),xy(30,625),xy(76,624),xy(94,614),xy(103,612),xy(122,578),xy(176,520),xy(193,490),xy(198,485),xy(223,435),xy(226,426),xy(225,422),xy(202,393),xy(193,386)]).
midline(r1, [xy(59,492),xy(59,560),xy(40,579),xy(18,580)]).
midline(r1, [xy(103,613),xy(124,633),xy(131,635),xy(549,635),xy(554,633),xy(554,529),xy(556,526),xy(545,515),xy(501,514),xy(476,509),xy(452,508),xy(399,496),xy(347,480),xy(286,455),xy(227,424)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,631),xy(585,555),xy(557,527)]).
midline(r1, [xy(463,507),xy(481,489),xy(480,485),xy(459,506)]).
midline(r1, [xy(482,485),xy(486,471),xy(485,468),xy(490,458),xy(489,453),xy(491,451),xy(491,454)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,632),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(200,390),xy(293,297),xy(297,296),xy(203,392)]).
midline(r1, [xy(299,296),xy(302,295),xy(301,297)]).
midline(r1, [xy(545,514),xy(600,459),xy(612,444),xy(617,430),xy(619,430)]).
midline(r1, [xy(181,179),xy(206,155),xy(261,112),xy(290,141),xy(262,111),xy(265,109),xy(296,141),xy(292,141)]).
midline(r1, [xy(266,108),xy(311,79),xy(337,67),xy(350,58),xy(394,39),xy(399,39)]).
midline(r1, [xy(400,37),xy(415,31),xy(425,31),xy(448,21),xy(462,20),xy(473,15),xy(505,15),xy(520,9),xy(598,9),xy(605,10),xy(614,15),xy(625,15)]).
midline(r1, [xy(297,142),xy(302,141),xy(304,145)]).
midline(r1, [xy(306,145),xy(308,144),xy(306,143)]).
midline(r1, [xy(308,146),xy(310,144),xy(314,145),xy(315,148),xy(316,146)]).
midline(r1, [xy(317,149),xy(322,148),xy(323,151),xy(334,155),xy(337,154),xy(337,156)]).
midline(r1, [xy(304,295),xy(312,294),xy(317,290),xy(317,292)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(329,288),xy(326,287),xy(320,289),xy(320,291)]).
midline(r1, [xy(323,290),xy(322,291)]).
midline(r1, [xy(330,287),xy(329,286)]).
fillpoint(r1, xy(195,386), 195.3).
fillpoint(r1, xy(194,384), 195.0).
fillpoint(r1, xy(193,379), 194.0).
fillpoint(r1, xy(192,374), 193.0).
fillpoint(r1, xy(191,369), 192.0).
fillpoint(r1, xy(190,364), 191.0).
fillpoint(r1, xy(189,358), 190.0).
fillpoint(r1, xy(188,351), 189.0).
fillpoint(r1, xy(187,344), 188.0).
fillpoint(r1, xy(186,335), 187.0).
fillpoint(r1, xy(222,419), 186.7).
fillpoint(r1, xy(223,420), 186.7).
fillpoint(r1, xy(185,324), 186.0).
fillpoint(r1, xy(184,317), 185.0).
fillpoint(r1, xy(183,311), 184.0).
fillpoint(r1, xy(182,303), 183.0).
fillpoint(r1, xy(181,294), 182.0).
fillpoint(r1, xy(180,281), 181.0).
fillpoint(r1, xy(179,219), 180.0).
fillpoint(r1, xy(311,465), 145.0).
fillpoint(r1, xy(348,480), 130.0).
fillpoint(r1, xy(351,481), 129.0).
fillpoint(r1, xy(354,482), 128.0).
fillpoint(r1, xy(357,483), 127.0).
fillpoint(r1, xy(360,484), 126.0).
fillpoint(r1, xy(367,486), 124.0).
fillpoint(r1, xy(371,487), 123.0).
fillpoint(r1, xy(375,488), 122.0).
fillpoint(r1, xy(379,489), 121.0).
fillpoint(r1, xy(400,496), 114.0).
fillpoint(r1, xy(407,498), 112.0).
fillpoint(r1, xy(411,499), 111.0).
fillpoint(r1, xy(416,500), 110.0).
fillpoint(r1, xy(421,501), 109.0).
fillpoint(r1, xy(425,502), 108.0).
fillpoint(r1, xy(437,505), 105.0).
fillpoint(r1, xy(442,506), 104.0).
fillpoint(r1, xy(448,507), 103.0).
fillpoint(r1, xy(454,508), 102.0).
fillpoint(r1, xy(463,509), 101.0).
fillpoint(r1, xy(478,510), 100.0).
fillpoint(r1, xy(483,511), 99.0).
fillpoint(r1, xy(489,512), 98.0).
fillpoint(r1, xy(495,513), 97.0).
fillpoint(r1, xy(504,514), 96.0).
fillpoint(r1, xy(521,515), 95.0).
border(r1).
region(r3, '#2ecc40', 51300, centroid(495,241)).
perimeter(r3, 2100).
polygon(r3, [xy(589,420),xy(520,420),xy(519,410),xy(480,410),xy(479,400),xy(460,400),xy(460,390),xy(450,390),xy(449,380),xy(430,380),xy(430,370),xy(420,370),xy(420,360),xy(410,360),xy(410,350),xy(400,349),xy(400,330),xy(390,330),xy(390,320),xy(380,319),xy(380,300),xy(370,299),xy(370,260),xy(360,259),xy(360,180),xy(370,179),xy(370,140),xy(380,139),xy(380,120),xy(389,120),xy(390,110),xy(400,109),xy(400,90),xy(409,90),xy(410,80),xy(419,80),xy(420,70),xy(430,69),xy(430,60),xy(440,60),xy(440,149),xy(390,150),xy(390,199),xy(440,200),xy(440,349),xy(489,350),xy(490,50),xy(590,50),xy(590,199),xy(540,200),xy(540,249),xy(590,250),xy(589,420)]).
hole(r3, [xy(530,89),xy(529,60),xy(500,60),xy(500,90),xy(530,89)]).
midline(r3, [xy(528,128),xy(495,93),xy(495,55),xy(529,54),xy(540,60),xy(559,79),xy(559,99),xy(555,113),xy(540,138),xy(529,129)]).
midline(r3, [xy(539,140),xy(540,150),xy(527,164),xy(518,180),xy(514,204),xy(516,263),xy(523,279),xy(540,299),xy(539,361),xy(503,379),xy(480,375),xy(456,365),xy(444,365),xy(433,359),xy(426,349),xy(419,332),xy(418,318),xy(412,307),xy(409,295),xy(407,293),xy(399,301),xy(407,295)]).
midline(r3, [xy(409,293),xy(404,274),xy(405,260),xy(402,240),xy(391,231),xy(379,216),xy(375,206),xy(374,194),xy(380,179),xy(379,149),xy(394,134),xy(416,126)]).
midline(r3, [xy(417,124),xy(419,107),xy(429,85),xy(429,79),xy(434,73),xy(435,64)]).
midline(r3, [xy(539,363),xy(547,377),xy(547,381),xy(544,384),xy(549,381),xy(548,378)]).
midline(r3, [xy(393,234),xy(384,240),xy(381,239),xy(379,241),xy(382,241)]).
midline(r3, [xy(503,381),xy(502,382)]).
fillpoint(r3, xy(539,362), 51.0).
fillpoint(r3, xy(540,144), 50.0).
fillpoint(r3, xy(539,324), 50.0).
fillpoint(r3, xy(401,238), 38.8).
fillpoint(r3, xy(402,241), 38.0).
fillpoint(r3, xy(403,245), 37.0).
fillpoint(r3, xy(404,251), 36.0).
fillpoint(r3, xy(405,268), 35.0).
fillpoint(r3, xy(558,103), 32.0).
fillpoint(r3, xy(408,286), 32.0).
fillpoint(r3, xy(503,378), 32.0).
fillpoint(r3, xy(559,98), 31.0).
fillpoint(r3, xy(409,292), 31.0).
fillpoint(r3, xy(559,84), 30.0).
fillpoint(r3, xy(518,181), 29.0).
fillpoint(r3, xy(518,268), 29.0).
fillpoint(r3, xy(411,301), 29.0).
fillpoint(r3, xy(517,184), 28.0).
fillpoint(r3, xy(517,265), 28.0).
fillpoint(r3, xy(412,304), 28.0).
fillpoint(r3, xy(516,187), 27.0).
fillpoint(r3, xy(516,262), 27.0).
fillpoint(r3, xy(515,192), 26.0).
fillpoint(r3, xy(515,258), 26.0).
fillpoint(r3, xy(488,375), 26.0).
fillpoint(r3, xy(514,225), 25.0).
fillpoint(r3, xy(416,126), 24.0).
fillpoint(r3, xy(419,116), 21.0).
fillpoint(r3, xy(419,323), 21.0).
fillpoint(r3, xy(420,107), 20.0).
fillpoint(r3, xy(419,332), 20.0).
fillpoint(r3, xy(424,95), 16.0).
fillpoint(r3, xy(395,134), 16.0).
fillpoint(r3, xy(375,205), 16.0).
fillpoint(r3, xy(424,344), 16.0).
fillpoint(r3, xy(455,365), 16.0).
fillpoint(r3, xy(374,196), 15.0).
fillpoint(r3, xy(448,364), 15.0).
region(r2, '#ffdc00', 38700, centroid(542,194)).
perimeter(r2, 1900).
polygon(r2, [xy(639,410),xy(600,410),xy(599,420),xy(590,419),xy(589,50),xy(490,50),xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,150),xy(440,149),xy(440,60),xy(449,60),xy(450,50),xy(460,49),xy(460,40),xy(479,40),xy(480,30),xy(519,30),xy(520,20),xy(599,20),xy(600,30),xy(639,30)]).
midline(r2, [xy(615,251),xy(615,55),xy(603,44),xy(585,34),xy(534,34),xy(519,40),xy(489,39),xy(474,54),xy(464,80),xy(465,142),xy(464,159),xy(461,169),xy(409,170)]).
midline(r2, [xy(461,171),xy(465,192),xy(465,277),xy(463,280),xy(469,292),xy(470,330)]).
midline(r2, [xy(615,252),xy(615,383),xy(596,404),xy(595,415)]).
fillpoint(r2, xy(460,170), 29.0).
fillpoint(r2, xy(462,165), 28.0).
fillpoint(r2, xy(462,174), 28.0).
fillpoint(r2, xy(463,162), 27.0).
fillpoint(r2, xy(463,177), 27.0).
fillpoint(r2, xy(464,158), 26.0).
fillpoint(r2, xy(464,182), 26.0).
fillpoint(r2, xy(614,220), 25.0).
fillpoint(r2, xy(464,114), 25.0).
fillpoint(r2, xy(464,236), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(409,170), 20.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(474,55), 16.0).
fillpoint(r2, xy(534,35), 15.0).
fillpoint(r2, xy(524,39), 11.0).
fillpoint(r2, xy(491,40), 10.0).
fillpoint(r2, xy(489,40), 10.0).
border(r2).
region(r12, '#2ecc40', 4800, centroid(250,620)).
perimeter(r12, 520).
polygon(r12, [xy(369,630),xy(130,630),xy(130,610),xy(369,610),xy(369,630)]).
midline(r12, [xy(279,620),xy(139,620)]).
midline(r12, [xy(280,619),xy(360,620)]).
fillpoint(r12, xy(139,620), 10.0).
region(r13, '#5a5a5a', 3600, centroid(460,620)).
perimeter(r13, 400).
polygon(r13, [xy(549,630),xy(370,630),xy(370,610),xy(549,610),xy(549,630)]).
midline(r13, [xy(519,620),xy(379,620)]).
midline(r13, [xy(520,620),xy(540,620)]).
fillpoint(r13, xy(379,620), 10.0).
region(r11, '#7fdbff', 2000, centroid(64,584)).
perimeter(r11, 240).
polygon(r11, [xy(69,610),xy(30,610),xy(30,590),xy(49,590),xy(50,570),xy(69,570),xy(70,550),xy(89,550),xy(90,589),xy(70,590),xy(69,610)]).
midline(r11, [xy(61,583),xy(57,598),xy(39,600)]).
midline(r11, [xy(78,578),xy(61,582)]).
midline(r11, [xy(78,577),xy(80,559)]).
fillpoint(r11, xy(77,578), 12.0).
fillpoint(r11, xy(62,581), 12.0).
fillpoint(r11, xy(57,598), 12.0).
fillpoint(r11, xy(79,574), 11.0).
fillpoint(r11, xy(74,579), 11.0).
fillpoint(r11, xy(65,580), 11.0).
fillpoint(r11, xy(60,585), 11.0).
fillpoint(r11, xy(59,594), 11.0).
fillpoint(r11, xy(54,599), 11.0).
fillpoint(r11, xy(79,564), 10.0).
fillpoint(r11, xy(39,600), 10.0).
region(r8, '#870c25', 1500, centroid(564,234)).
perimeter(r8, 160).
polygon(r8, [xy(589,250),xy(540,250),xy(540,220),xy(589,220),xy(589,250)]).
midline(r8, [xy(572,235),xy(554,235)]).
midline(r8, [xy(573,234),xy(575,235)]).
fillpoint(r8, xy(554,235), 15.0).
region(r7, '#bebebe', 1000, centroid(564,210)).
perimeter(r7, 140).
polygon(r7, [xy(589,220),xy(540,220),xy(540,200),xy(589,200),xy(589,220)]).
midline(r7, [xy(559,210),xy(549,210)]).
midline(r7, [xy(560,209),xy(580,210)]).
fillpoint(r7, xy(549,210), 10.0).
region(r4, '#5a5a5a', 800, centroid(514,74)).
perimeter(r4, 160).
polygon(r4, [xy(529,90),xy(500,89),xy(500,60),xy(530,60),xy(529,90)]).
hole(r4, [xy(520,79),xy(519,70),xy(510,70),xy(510,80),xy(520,79)]).
midline(r4, [xy(505,77),xy(505,65),xy(524,65),xy(524,83),xy(519,85),xy(506,84),xy(504,78)]).
fillpoint(r4, xy(506,65), 6.0).
fillpoint(r4, xy(524,65), 6.0).
fillpoint(r4, xy(505,84), 6.0).
fillpoint(r4, xy(523,84), 6.0).
fillpoint(r4, xy(511,65), 5.0).
fillpoint(r4, xy(504,75), 5.0).
fillpoint(r4, xy(524,75), 5.0).
fillpoint(r4, xy(511,85), 5.0).
region(r6, '#0074d9', 500, centroid(414,194)).
perimeter(r6, 120).
polygon(r6, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r6, [xy(409,194),xy(394,195)]).
midline(r6, [xy(410,195),xy(435,195)]).
fillpoint(r6, xy(394,195), 5.0).
region(r9, '#0074d9', 500, centroid(444,324)).
perimeter(r9, 120).
polygon(r9, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r9, [xy(445,323),xy(445,345)]).
midline(r9, [xy(445,322),xy(445,304)]).
fillpoint(r9, xy(444,325), 5.0).
region(r10, '#7fdbff', 400, centroid(40,560)).
perimeter(r10, 80).
polygon(r10, [xy(49,570),xy(30,569),xy(30,550),xy(50,550),xy(49,570)]).
midline(r10, [xy(39,559),xy(40,560)]).
fillpoint(r10, xy(39,560), 10.0).
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
region(r5, '#2ecc40', 100, centroid(514,74)).
perimeter(r5, 40).
polygon(r5, [xy(519,80),xy(510,79),xy(510,70),xy(520,70),xy(519,80)]).
midline(r5, [xy(515,75),xy(515,74)]).
fillpoint(r5, xy(514,75), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 310).
adjacent(r1, r3).
shared_edge(r1, r3, 670).
adjacent(r1, r10).
shared_edge(r1, r10, 80).
adjacent(r1, r11).
shared_edge(r1, r11, 240).
adjacent(r1, r12).
shared_edge(r1, r12, 500).
adjacent(r1, r13).
shared_edge(r1, r13, 380).
adjacent(r1, r14).
shared_edge(r1, r14, 80).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 1040).
adjacent(r2, r6).
shared_edge(r2, r6, 60).
adjacent(r2, r7).
shared_edge(r2, r7, 20).
adjacent(r2, r8).
shared_edge(r2, r8, 30).
adjacent(r2, r9).
shared_edge(r2, r9, 60).
adjacent(r3, r4).
shared_edge(r3, r4, 120).
adjacent(r3, r6).
shared_edge(r3, r6, 60).
adjacent(r3, r7).
shared_edge(r3, r7, 70).
adjacent(r3, r8).
shared_edge(r3, r8, 80).
adjacent(r3, r9).
shared_edge(r3, r9, 60).
adjacent(r4, r5).
shared_edge(r4, r5, 40).
adjacent(r7, r8).
shared_edge(r7, r8, 50).
adjacent(r12, r13).
shared_edge(r12, r13, 20).

encloses(r4, r5).
encloses(r1, r10).
encloses(r1, r11).
encloses(r1, r14).
encloses(r1, r15).
