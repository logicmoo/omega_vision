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

region(r1, '#aaaaaa', 313400, centroid(346,365)).
perimeter(r1, 4200).
polygon(r1, [xy(40,0),xy(40,179),xy(50,180),xy(50,199),xy(59,200),xy(60,209),xy(69,210),xy(70,219),xy(79,220),xy(80,230),xy(99,230),xy(100,239),xy(109,240),xy(110,250),xy(129,250),xy(130,260),xy(169,260),xy(170,270),xy(249,270),xy(250,260),xy(289,260),xy(290,250),xy(309,250),xy(310,240),xy(319,240),xy(320,230),xy(339,230),xy(340,220),xy(349,220),xy(350,210),xy(359,210),xy(360,200),xy(370,199),xy(370,180),xy(379,180),xy(380,170),xy(390,169),xy(390,150),xy(400,149),xy(400,110),xy(410,109),xy(410,30),xy(400,29),xy(400,0)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(428,410),xy(380,423),xy(286,329),xy(276,300),xy(277,298),xy(274,295),xy(273,291),xy(276,292)]).
midline(r1, [xy(277,296),xy(276,295)]).
midline(r1, [xy(378,423),xy(288,335),xy(288,340),xy(371,425),xy(348,430),xy(275,439),xy(170,440),xy(152,421),xy(98,353),xy(77,320),xy(46,262),xy(26,213),xy(25,200),xy(19,178),xy(20,19)]).
midline(r1, [xy(169,440),xy(114,496),xy(98,516),xy(77,552),xy(70,569),xy(74,573)]).
midline(r1, [xy(74,575),xy(76,580),xy(78,580)]).
midline(r1, [xy(72,309),xy(113,268)]).
midline(r1, [xy(285,321),xy(286,322)]).
midline(r1, [xy(373,424),xy(290,339)]).
midline(r1, [xy(288,333),xy(288,334)]).
midline(r1, [xy(429,409),xy(437,406),xy(555,526),xy(555,631),xy(553,634),xy(130,635),xy(118,628),xy(92,602),xy(78,582)]).
midline(r1, [xy(556,526),xy(585,556),xy(585,632),xy(578,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,630),xy(613,634),xy(604,635),xy(585,633)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(438,405),xy(439,403),xy(308,272),xy(440,402)]).
midline(r1, [xy(441,400),xy(460,363),xy(487,296),xy(389,198),xy(392,198),xy(487,293),xy(506,236),xy(514,198),xy(460,144),xy(452,143),xy(449,145),xy(435,134),xy(433,135),xy(435,136)]).
midline(r1, [xy(488,294),xy(487,295)]).
midline(r1, [xy(441,138),xy(448,139),xy(450,141),xy(446,141)]).
midline(r1, [xy(451,141),xy(455,142)]).
midline(r1, [xy(515,197),xy(516,192),xy(472,148),xy(461,143)]).
midline(r1, [xy(466,148),xy(464,146)]).
midline(r1, [xy(473,147),xy(476,147),xy(477,150),xy(479,148),xy(478,151),xy(481,150),xy(480,153),xy(483,152),xy(482,155),xy(485,154),xy(484,157),xy(487,156),xy(486,159),xy(489,158),xy(488,161),xy(491,160),xy(490,163),xy(493,162),xy(492,165),xy(495,164),xy(494,167),xy(497,166),xy(496,169),xy(499,168),xy(498,171),xy(501,170),xy(500,173),xy(503,172),xy(502,175),xy(505,174),xy(504,177),xy(507,176),xy(506,179),xy(509,178),xy(508,181),xy(511,180),xy(510,183),xy(513,182),xy(512,185),xy(515,184),xy(515,188),xy(517,186)]).
midline(r1, [xy(516,189),xy(516,190)]).
midline(r1, [xy(517,184),xy(524,130),xy(524,114),xy(439,29),xy(426,19),xy(414,15)]).
midline(r1, [xy(147,288),xy(143,295),xy(137,318),xy(134,321),xy(132,332),xy(105,359),xy(132,334)]).
midline(r1, [xy(132,336),xy(107,361)]).
midline(r1, [xy(148,287),xy(148,284),xy(150,284)]).
fillpoint(r1, xy(437,407), 203.0).
fillpoint(r1, xy(428,410), 200.0).
fillpoint(r1, xy(415,414), 196.0).
fillpoint(r1, xy(408,416), 194.0).
fillpoint(r1, xy(404,417), 193.0).
fillpoint(r1, xy(392,420), 190.0).
fillpoint(r1, xy(388,421), 189.0).
fillpoint(r1, xy(383,422), 188.0).
fillpoint(r1, xy(379,423), 187.0).
fillpoint(r1, xy(375,424), 186.0).
fillpoint(r1, xy(371,425), 185.0).
fillpoint(r1, xy(367,426), 184.0).
fillpoint(r1, xy(362,427), 183.0).
fillpoint(r1, xy(358,428), 182.0).
fillpoint(r1, xy(352,429), 181.0).
fillpoint(r1, xy(347,430), 180.0).
fillpoint(r1, xy(340,431), 179.0).
fillpoint(r1, xy(332,432), 178.0).
fillpoint(r1, xy(324,433), 177.0).
fillpoint(r1, xy(313,434), 176.0).
fillpoint(r1, xy(306,435), 175.0).
fillpoint(r1, xy(466,348), 174.0).
fillpoint(r1, xy(299,436), 174.0).
fillpoint(r1, xy(292,437), 173.0).
fillpoint(r1, xy(283,438), 172.0).
fillpoint(r1, xy(271,439), 171.0).
fillpoint(r1, xy(169,440), 170.0).
fillpoint(r1, xy(490,288), 150.0).
fillpoint(r1, xy(493,278), 147.0).
fillpoint(r1, xy(494,275), 146.0).
fillpoint(r1, xy(495,271), 145.0).
fillpoint(r1, xy(496,267), 144.0).
fillpoint(r1, xy(497,263), 143.0).
fillpoint(r1, xy(503,245), 137.0).
fillpoint(r1, xy(504,242), 136.0).
fillpoint(r1, xy(506,235), 134.0).
fillpoint(r1, xy(507,231), 133.0).
fillpoint(r1, xy(508,227), 132.0).
fillpoint(r1, xy(509,222), 131.0).
fillpoint(r1, xy(510,218), 130.0).
fillpoint(r1, xy(513,205), 127.0).
fillpoint(r1, xy(514,201), 126.0).
fillpoint(r1, xy(515,196), 125.0).
fillpoint(r1, xy(516,191), 124.0).
fillpoint(r1, xy(517,185), 123.0).
fillpoint(r1, xy(518,177), 122.0).
fillpoint(r1, xy(519,167), 121.0).
fillpoint(r1, xy(520,155), 120.0).
fillpoint(r1, xy(521,150), 119.0).
fillpoint(r1, xy(522,144), 118.0).
fillpoint(r1, xy(523,137), 117.0).
fillpoint(r1, xy(524,127), 116.0).
border(r1).
region(r2, '#ffdc00', 28600, centroid(191,58)).
perimeter(r2, 1300).
polygon(r2, [xy(400,0),xy(400,29),xy(410,30),xy(410,49),xy(390,50),xy(389,100),xy(340,100),xy(339,50),xy(90,50),xy(89,230),xy(80,230),xy(80,220),xy(70,220),xy(70,210),xy(60,209),xy(59,200),xy(50,199),xy(50,180),xy(40,179),xy(40,0)]).
midline(r2, [xy(380,32),xy(372,27),xy(364,31),xy(353,26),xy(339,24),xy(93,24),xy(70,28),xy(66,36),xy(64,50),xy(65,158),xy(63,160),xy(67,165),xy(69,182),xy(79,204),xy(79,210),xy(84,216),xy(85,225)]).
midline(r2, [xy(364,32),xy(365,75)]).
midline(r2, [xy(381,32),xy(389,37),xy(400,40)]).
fillpoint(r2, xy(365,31), 31.4).
fillpoint(r2, xy(69,29), 29.7).
fillpoint(r2, xy(71,28), 29.0).
fillpoint(r2, xy(358,28), 29.0).
fillpoint(r2, xy(371,28), 29.0).
fillpoint(r2, xy(68,31), 29.0).
fillpoint(r2, xy(74,27), 28.0).
fillpoint(r2, xy(355,27), 28.0).
fillpoint(r2, xy(67,34), 28.0).
fillpoint(r2, xy(77,26), 27.0).
fillpoint(r2, xy(352,26), 27.0).
fillpoint(r2, xy(66,37), 27.0).
fillpoint(r2, xy(82,25), 26.0).
fillpoint(r2, xy(348,25), 26.0).
fillpoint(r2, xy(65,42), 26.0).
fillpoint(r2, xy(91,25), 25.0).
fillpoint(r2, xy(64,106), 25.0).
fillpoint(r2, xy(365,63), 25.0).
fillpoint(r2, xy(69,173), 21.0).
fillpoint(r2, xy(69,182), 20.0).
fillpoint(r2, xy(74,194), 16.0).
fillpoint(r2, xy(395,39), 11.0).
fillpoint(r2, xy(79,205), 11.0).
border(r2).
region(r3, '#2ecc40', 23700, centroid(161,154)).
perimeter(r3, 1160).
polygon(r3, [xy(249,270),xy(170,270),xy(169,260),xy(130,260),xy(129,250),xy(110,250),xy(109,240),xy(100,240),xy(99,230),xy(90,229),xy(90,50),xy(189,50),xy(190,99),xy(240,100),xy(240,199),xy(140,200),xy(140,249),xy(290,250),xy(289,260),xy(250,260),xy(249,270)]).
hole(r3, [xy(130,89),xy(129,60),xy(100,60),xy(100,90),xy(130,89)]).
midline(r3, [xy(201,259),xy(179,260),xy(169,254),xy(136,254),xy(133,244),xy(123,232),xy(114,209),xy(116,186),xy(127,164),xy(145,143),xy(96,95),xy(94,88),xy(95,55),xy(133,55),xy(159,79),xy(159,100),xy(152,141),xy(146,143)]).
midline(r3, [xy(202,260),xy(240,260),xy(250,254),xy(285,255)]).
midline(r3, [xy(152,142),xy(166,147),xy(190,150)]).
fillpoint(r3, xy(152,142), 57.4).
fillpoint(r3, xy(148,143), 57.0).
fillpoint(r3, xy(163,146), 54.0).
fillpoint(r3, xy(167,147), 53.0).
fillpoint(r3, xy(172,148), 52.0).
fillpoint(r3, xy(178,149), 51.0).
fillpoint(r3, xy(159,98), 31.0).
fillpoint(r3, xy(159,84), 30.0).
fillpoint(r3, xy(118,181), 29.0).
fillpoint(r3, xy(117,184), 28.0).
fillpoint(r3, xy(116,187), 27.0).
fillpoint(r3, xy(115,192), 26.0).
fillpoint(r3, xy(114,206), 25.0).
fillpoint(r3, xy(124,234), 16.0).
region(r10, '#ffdc00', 15000, centroid(248,191)).
perimeter(r10, 700).
polygon(r10, [xy(289,250),xy(140,249),xy(140,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r10, [xy(263,210),xy(261,219),xy(249,224),xy(164,225)]).
midline(r10, [xy(264,209),xy(265,190),xy(271,175),xy(265,159),xy(265,124)]).
midline(r10, [xy(272,175),xy(315,175)]).
fillpoint(r10, xy(271,175), 31.4).
fillpoint(r10, xy(260,220), 29.7).
fillpoint(r10, xy(268,168), 29.0).
fillpoint(r10, xy(268,181), 29.0).
fillpoint(r10, xy(261,218), 29.0).
fillpoint(r10, xy(258,221), 29.0).
fillpoint(r10, xy(267,165), 28.0).
fillpoint(r10, xy(267,184), 28.0).
fillpoint(r10, xy(262,215), 28.0).
fillpoint(r10, xy(255,222), 28.0).
fillpoint(r10, xy(266,162), 27.0).
fillpoint(r10, xy(266,187), 27.0).
fillpoint(r10, xy(263,212), 27.0).
fillpoint(r10, xy(252,223), 27.0).
fillpoint(r10, xy(265,158), 26.0).
fillpoint(r10, xy(265,192), 26.0).
fillpoint(r10, xy(264,208), 26.0).
fillpoint(r10, xy(248,224), 26.0).
fillpoint(r10, xy(265,136), 25.0).
fillpoint(r10, xy(291,175), 25.0).
fillpoint(r10, xy(164,225), 25.0).
region(r5, '#2ecc40', 14800, centroid(328,121)).
perimeter(r5, 1020).
polygon(r5, [xy(309,250),xy(290,249),xy(290,200),xy(339,200),xy(340,150),xy(290,150),xy(289,100),xy(240,100),xy(240,50),xy(339,50),xy(340,99),xy(389,100),xy(390,50),xy(409,50),xy(410,59),xy(400,60),xy(400,89),xy(410,90),xy(410,109),xy(400,110),xy(400,149),xy(390,150),xy(390,169),xy(380,170),xy(379,180),xy(370,180),xy(370,199),xy(360,200),xy(360,209),xy(350,210),xy(350,219),xy(340,220),xy(339,230),xy(330,229),xy(329,210),xy(300,210),xy(300,239),xy(310,240),xy(309,250)]).
midline(r5, [xy(314,91),xy(311,80),xy(303,76),xy(289,74),xy(264,75)]).
midline(r5, [xy(314,92),xy(315,109),xy(320,121),xy(330,124),xy(349,125),xy(364,132),xy(372,127),xy(374,129),xy(373,126),xy(400,99),xy(396,95),xy(394,88),xy(394,62),xy(395,55),xy(405,55)]).
midline(r5, [xy(365,133),xy(365,150),xy(355,173),xy(355,185),xy(350,194),xy(350,199),xy(340,209),xy(329,204),xy(295,205),xy(295,244),xy(305,245)]).
midline(r5, [xy(340,210),xy(335,216),xy(335,225)]).
midline(r5, [xy(376,128),xy(375,130)]).
fillpoint(r5, xy(365,131), 31.4).
fillpoint(r5, xy(310,79), 29.7).
fillpoint(r5, xy(319,120), 29.7).
fillpoint(r5, xy(308,78), 29.0).
fillpoint(r5, xy(311,81), 29.0).
fillpoint(r5, xy(318,118), 29.0).
fillpoint(r5, xy(321,121), 29.0).
fillpoint(r5, xy(358,128), 29.0).
fillpoint(r5, xy(371,128), 29.0).
fillpoint(r5, xy(305,77), 28.0).
fillpoint(r5, xy(312,84), 28.0).
fillpoint(r5, xy(317,115), 28.0).
fillpoint(r5, xy(324,122), 28.0).
fillpoint(r5, xy(355,127), 28.0).
fillpoint(r5, xy(302,76), 27.0).
fillpoint(r5, xy(313,87), 27.0).
fillpoint(r5, xy(316,112), 27.0).
fillpoint(r5, xy(327,123), 27.0).
fillpoint(r5, xy(352,126), 27.0).
fillpoint(r5, xy(298,75), 26.0).
fillpoint(r5, xy(314,92), 26.0).
fillpoint(r5, xy(315,108), 26.0).
fillpoint(r5, xy(332,124), 26.0).
fillpoint(r5, xy(348,125), 26.0).
fillpoint(r5, xy(264,75), 25.0).
fillpoint(r5, xy(355,174), 16.0).
fillpoint(r5, xy(355,183), 15.0).
fillpoint(r5, xy(350,195), 11.0).
fillpoint(r5, xy(399,100), 10.0).
fillpoint(r5, xy(349,200), 10.0).
fillpoint(r5, xy(340,209), 10.0).
region(r14, '#5a5a5a', 7600, centroid(360,620)).
perimeter(r14, 800).
polygon(r14, [xy(549,630),xy(170,630),xy(170,610),xy(549,610),xy(549,630)]).
midline(r14, [xy(385,620),xy(179,620)]).
midline(r14, [xy(386,620),xy(540,620)]).
fillpoint(r14, xy(179,620), 10.0).
region(r9, '#870c25', 1500, centroid(214,84)).
perimeter(r9, 160).
polygon(r9, [xy(239,100),xy(190,100),xy(190,70),xy(239,70),xy(239,100)]).
midline(r9, [xy(210,85),xy(204,85)]).
midline(r9, [xy(211,84),xy(225,85)]).
fillpoint(r9, xy(204,85), 15.0).
region(r4, '#bebebe', 1000, centroid(214,60)).
perimeter(r4, 140).
polygon(r4, [xy(239,70),xy(190,70),xy(190,50),xy(239,50),xy(239,70)]).
midline(r4, [xy(220,60),xy(199,60)]).
midline(r4, [xy(221,59),xy(230,60)]).
fillpoint(r4, xy(199,60), 10.0).
region(r6, '#5a5a5a', 800, centroid(114,74)).
perimeter(r6, 160).
polygon(r6, [xy(129,90),xy(100,89),xy(100,60),xy(130,60),xy(129,90)]).
hole(r6, [xy(120,79),xy(119,70),xy(110,70),xy(110,80),xy(120,79)]).
midline(r6, [xy(119,64),xy(105,65),xy(105,84),xy(118,85),xy(124,83),xy(125,70),xy(124,66),xy(120,65)]).
fillpoint(r6, xy(106,65), 6.0).
fillpoint(r6, xy(124,65), 6.0).
fillpoint(r6, xy(105,84), 6.0).
fillpoint(r6, xy(123,84), 6.0).
fillpoint(r6, xy(111,65), 5.0).
fillpoint(r6, xy(104,75), 5.0).
fillpoint(r6, xy(124,75), 5.0).
fillpoint(r6, xy(111,85), 5.0).
region(r13, '#2ecc40', 800, centroid(150,620)).
perimeter(r13, 120).
polygon(r13, [xy(169,630),xy(130,630),xy(130,610),xy(169,610),xy(169,630)]).
midline(r13, [xy(160,620),xy(139,620)]).
fillpoint(r13, xy(139,620), 10.0).
region(r11, '#5a5a5a', 700, centroid(313,223)).
perimeter(r11, 160).
polygon(r11, [xy(319,240),xy(300,239),xy(300,210),xy(330,210),xy(329,230),xy(320,230),xy(319,220),xy(310,220),xy(310,229),xy(320,230),xy(319,240)]).
midline(r11, [xy(305,227),xy(305,234),xy(315,235)]).
midline(r11, [xy(305,226),xy(305,215),xy(324,215),xy(325,224),xy(316,233)]).
fillpoint(r11, xy(306,215), 6.0).
fillpoint(r11, xy(324,215), 6.0).
fillpoint(r11, xy(305,234), 6.0).
fillpoint(r11, xy(311,215), 5.0).
fillpoint(r11, xy(304,225), 5.0).
fillpoint(r11, xy(325,223), 5.0).
fillpoint(r11, xy(311,235), 5.0).
region(r15, '#7fdbff', 400, centroid(570,620)).
perimeter(r15, 80).
polygon(r15, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r15, [xy(569,619),xy(570,620)]).
fillpoint(r15, xy(569,620), 10.0).
region(r16, '#7fdbff', 400, centroid(600,620)).
perimeter(r16, 80).
polygon(r16, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r16, [xy(599,619),xy(600,620)]).
fillpoint(r16, xy(599,620), 10.0).
region(r17, '#7fdbff', 400, centroid(630,620)).
perimeter(r17, 80).
polygon(r17, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r17, [xy(629,619),xy(630,620)]).
fillpoint(r17, xy(629,620), 10.0).
border(r17).
region(r8, '#2ecc40', 100, centroid(114,74)).
perimeter(r8, 40).
polygon(r8, [xy(119,80),xy(110,79),xy(110,70),xy(120,70),xy(119,80)]).
midline(r8, [xy(115,75),xy(115,74)]).
fillpoint(r8, xy(114,75), 5.0).
region(r12, '#2ecc40', 100, centroid(314,224)).
perimeter(r12, 40).
polygon(r12, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r12, [xy(315,225),xy(315,224)]).
fillpoint(r12, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 340).
adjacent(r1, r3).
shared_edge(r1, r3, 260).
adjacent(r1, r5).
shared_edge(r1, r5, 260).
adjacent(r1, r11).
shared_edge(r1, r11, 30).
adjacent(r1, r13).
shared_edge(r1, r13, 100).
adjacent(r1, r14).
shared_edge(r1, r14, 780).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 280).
adjacent(r2, r4).
shared_edge(r2, r4, 50).
adjacent(r2, r5).
shared_edge(r2, r5, 270).
adjacent(r3, r4).
shared_edge(r3, r4, 20).
adjacent(r3, r6).
shared_edge(r3, r6, 120).
adjacent(r3, r9).
shared_edge(r3, r9, 80).
adjacent(r3, r10).
shared_edge(r3, r10, 400).
adjacent(r4, r5).
shared_edge(r4, r5, 20).
adjacent(r4, r9).
shared_edge(r4, r9, 50).
adjacent(r5, r9).
shared_edge(r5, r9, 30).
adjacent(r5, r10).
shared_edge(r5, r10, 300).
adjacent(r5, r11).
shared_edge(r5, r11, 90).
adjacent(r6, r8).
shared_edge(r6, r8, 40).
adjacent(r11, r12).
shared_edge(r11, r12, 40).
adjacent(r13, r14).
shared_edge(r13, r14, 20).

encloses(r6, r8).
encloses(r11, r12).
encloses(r1, r15).
encloses(r1, r16).
