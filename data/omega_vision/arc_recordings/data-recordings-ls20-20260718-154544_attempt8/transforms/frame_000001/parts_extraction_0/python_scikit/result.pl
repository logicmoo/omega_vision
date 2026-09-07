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

region(r1, '#aaaaaa', 296200, centroid(354,370)).
perimeter(r1, 4380).
polygon(r1, [xy(50,0),xy(50,9),xy(40,10),xy(40,229),xy(50,230),xy(50,249),xy(59,250),xy(60,259),xy(69,260),xy(70,269),xy(80,270),xy(80,280),xy(99,280),xy(100,289),xy(110,290),xy(110,300),xy(129,300),xy(130,310),xy(169,310),xy(170,320),xy(249,320),xy(250,310),xy(289,310),xy(290,300),xy(309,300),xy(310,290),xy(319,290),xy(320,280),xy(339,280),xy(340,270),xy(349,270),xy(350,260),xy(359,260),xy(360,250),xy(370,249),xy(370,230),xy(379,230),xy(380,220),xy(390,219),xy(390,200),xy(400,199),xy(400,160),xy(410,159),xy(410,80),xy(400,79),xy(400,40),xy(390,39),xy(390,20),xy(380,20),xy(380,10),xy(370,9),xy(370,0)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(429,635),xy(126,634),xy(92,602),xy(77,581),xy(71,568),xy(84,538),xy(109,502),xy(145,462),xy(98,403),xy(70,358),xy(61,337),xy(46,312),xy(28,269),xy(25,258),xy(26,250),xy(20,237),xy(19,19),xy(34,6),xy(45,5)]).
midline(r1, [xy(430,635),xy(553,634),xy(555,632),xy(555,525),xy(454,424),xy(395,443),xy(354,452),xy(287,385),xy(285,378),xy(287,375),xy(283,371),xy(279,353),xy(276,350),xy(278,348)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,630),xy(583,634),xy(577,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(281,359),xy(282,360)]).
midline(r1, [xy(104,408),xy(134,378),xy(132,376),xy(102,406)]).
midline(r1, [xy(133,381),xy(106,409),xy(131,386)]).
midline(r1, [xy(278,350),xy(280,352)]).
midline(r1, [xy(353,453),xy(273,464),xy(146,464)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,631),xy(609,635),xy(585,633)]).
midline(r1, [xy(455,423),xy(490,339),xy(498,306),xy(506,286),xy(513,253),xy(456,196),xy(448,193),xy(442,187),xy(433,186),xy(422,178),xy(420,177),xy(420,179)]).
midline(r1, [xy(445,188),xy(448,191)]).
midline(r1, [xy(514,252),xy(456,192),xy(454,193),xy(450,190)]).
midline(r1, [xy(458,192),xy(462,194),xy(460,195)]).
midline(r1, [xy(463,195),xy(467,197),xy(465,199),xy(462,197)]).
midline(r1, [xy(514,250),xy(466,200),xy(514,246),xy(515,243),xy(468,197),xy(479,198),xy(516,235),xy(516,242)]).
midline(r1, [xy(517,234),xy(524,180),xy(525,115),xy(477,68),xy(461,56),xy(447,48),xy(437,54),xy(433,53),xy(430,55),xy(433,55)]).
midline(r1, [xy(446,51),xy(447,50)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(280,355),xy(281,356)]).
midline(r1, [xy(447,47),xy(431,32),xy(412,22),xy(403,14),xy(395,10),xy(389,10),xy(383,5),xy(374,5)]).
midline(r1, [xy(410,22),xy(409,21)]).
midline(r1, [xy(149,334),xy(148,337),xy(145,336),xy(145,345),xy(140,353),xy(141,356),xy(138,359),xy(138,365),xy(133,375),xy(135,375)]).
midline(r1, [xy(148,338),xy(146,341)]).
midline(r1, [xy(146,334),xy(150,330),xy(150,333)]).
midline(r1, [xy(61,319),xy(81,299),xy(64,318)]).
fillpoint(r1, xy(454,424), 185.1).
fillpoint(r1, xy(437,430), 180.0).
fillpoint(r1, xy(434,431), 179.0).
fillpoint(r1, xy(430,432), 178.0).
fillpoint(r1, xy(423,434), 176.0).
fillpoint(r1, xy(466,398), 174.0).
fillpoint(r1, xy(404,440), 170.0).
fillpoint(r1, xy(401,441), 169.0).
fillpoint(r1, xy(394,443), 167.0).
fillpoint(r1, xy(390,444), 166.0).
fillpoint(r1, xy(386,445), 165.0).
fillpoint(r1, xy(382,446), 164.0).
fillpoint(r1, xy(378,447), 163.0).
fillpoint(r1, xy(373,448), 162.0).
fillpoint(r1, xy(369,449), 161.0).
fillpoint(r1, xy(365,450), 160.0).
fillpoint(r1, xy(361,451), 159.0).
fillpoint(r1, xy(357,452), 158.0).
fillpoint(r1, xy(352,453), 157.0).
fillpoint(r1, xy(348,454), 156.0).
fillpoint(r1, xy(342,455), 155.0).
fillpoint(r1, xy(336,456), 154.0).
fillpoint(r1, xy(329,457), 153.0).
fillpoint(r1, xy(321,458), 152.0).
fillpoint(r1, xy(310,459), 151.0).
fillpoint(r1, xy(490,338), 150.0).
fillpoint(r1, xy(301,460), 150.0).
fillpoint(r1, xy(296,461), 149.0).
fillpoint(r1, xy(289,462), 148.0).
fillpoint(r1, xy(493,328), 147.0).
fillpoint(r1, xy(281,463), 147.0).
fillpoint(r1, xy(494,325), 146.0).
fillpoint(r1, xy(148,464), 146.0).
fillpoint(r1, xy(270,464), 146.0).
fillpoint(r1, xy(495,321), 145.0).
fillpoint(r1, xy(171,465), 145.0).
fillpoint(r1, xy(496,317), 144.0).
fillpoint(r1, xy(497,313), 143.0).
fillpoint(r1, xy(503,295), 137.0).
fillpoint(r1, xy(504,292), 136.0).
fillpoint(r1, xy(506,285), 134.0).
fillpoint(r1, xy(507,281), 133.0).
fillpoint(r1, xy(508,277), 132.0).
fillpoint(r1, xy(509,272), 131.0).
fillpoint(r1, xy(510,268), 130.0).
fillpoint(r1, xy(513,255), 127.0).
fillpoint(r1, xy(514,251), 126.0).
fillpoint(r1, xy(515,246), 125.0).
fillpoint(r1, xy(516,241), 124.0).
fillpoint(r1, xy(517,235), 123.0).
fillpoint(r1, xy(518,227), 122.0).
fillpoint(r1, xy(519,217), 121.0).
fillpoint(r1, xy(520,205), 120.0).
fillpoint(r1, xy(521,200), 119.0).
fillpoint(r1, xy(522,194), 118.0).
fillpoint(r1, xy(523,187), 117.0).
fillpoint(r1, xy(524,177), 116.0).
fillpoint(r1, xy(525,136), 115.0).
border(r1).
region(r3, '#2ecc40', 51400, centroid(231,169)).
perimeter(r3, 2300).
polygon(r3, [xy(139,310),xy(130,310),xy(129,300),xy(110,300),xy(109,290),xy(100,290),xy(99,280),xy(90,279),xy(90,50),xy(339,50),xy(340,100),xy(389,100),xy(390,50),xy(400,50),xy(400,89),xy(410,90),xy(410,149),xy(390,150),xy(390,219),xy(380,220),xy(379,230),xy(370,230),xy(370,249),xy(360,250),xy(360,259),xy(350,260),xy(350,269),xy(340,270),xy(339,280),xy(320,280),xy(320,289),xy(310,290),xy(309,300),xy(140,300),xy(139,310)]).
hole(r3, [xy(290,249),xy(290,200),xy(339,200),xy(340,150),xy(290,150),xy(289,100),xy(190,100),xy(190,149),xy(239,150),xy(240,199),xy(140,200),xy(140,249),xy(290,249)]).
hole(r3, [xy(130,89),xy(129,60),xy(100,60),xy(100,90),xy(130,89)]).
hole(r3, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r3, [xy(156,108),xy(149,125),xy(138,138),xy(96,95),xy(94,89),xy(95,55),xy(129,54),xy(140,60),xy(162,82),xy(157,107)]).
midline(r3, [xy(140,139),xy(140,150),xy(125,167),xy(115,191),xy(115,257),xy(113,259),xy(118,262),xy(121,268),xy(131,275),xy(289,274),xy(289,276)]).
midline(r3, [xy(135,276),xy(135,305)]).
midline(r3, [xy(141,150),xy(154,162),xy(173,172),xy(190,175),xy(215,175)]).
midline(r3, [xy(163,82),xy(176,76),xy(191,74),xy(299,75),xy(310,79),xy(312,83),xy(315,108),xy(319,120),xy(331,124),xy(353,126),xy(365,131),xy(365,200),xy(360,209),xy(351,218),xy(347,217),xy(333,205),xy(295,205),xy(294,239),xy(296,245),xy(308,261),xy(299,270),xy(291,274)]).
midline(r3, [xy(309,261),xy(322,260),xy(335,255)]).
midline(r3, [xy(351,219),xy(350,232),xy(345,244),xy(336,253)]).
midline(r3, [xy(366,130),xy(385,125)]).
midline(r3, [xy(386,123),xy(395,113),xy(400,99),xy(396,95),xy(394,87),xy(395,54)]).
fillpoint(r3, xy(140,144), 50.0).
fillpoint(r3, xy(162,82), 33.0).
fillpoint(r3, xy(161,86), 32.0).
fillpoint(r3, xy(158,103), 32.0).
fillpoint(r3, xy(365,131), 31.4).
fillpoint(r3, xy(160,91), 31.1).
fillpoint(r3, xy(159,98), 31.1).
fillpoint(r3, xy(310,79), 29.7).
fillpoint(r3, xy(319,120), 29.7).
fillpoint(r3, xy(171,78), 29.0).
fillpoint(r3, xy(308,78), 29.0).
fillpoint(r3, xy(311,81), 29.0).
fillpoint(r3, xy(318,118), 29.0).
fillpoint(r3, xy(321,121), 29.0).
fillpoint(r3, xy(358,128), 29.0).
fillpoint(r3, xy(371,128), 29.0).
fillpoint(r3, xy(171,171), 29.0).
fillpoint(r3, xy(118,181), 29.0).
fillpoint(r3, xy(174,77), 28.0).
fillpoint(r3, xy(305,77), 28.0).
fillpoint(r3, xy(312,84), 28.0).
fillpoint(r3, xy(317,115), 28.0).
fillpoint(r3, xy(324,122), 28.0).
fillpoint(r3, xy(355,127), 28.0).
fillpoint(r3, xy(374,127), 28.0).
fillpoint(r3, xy(174,172), 28.0).
fillpoint(r3, xy(117,184), 28.0).
fillpoint(r3, xy(177,76), 27.0).
fillpoint(r3, xy(302,76), 27.0).
fillpoint(r3, xy(313,87), 27.0).
fillpoint(r3, xy(316,112), 27.0).
fillpoint(r3, xy(327,123), 27.0).
fillpoint(r3, xy(352,126), 27.0).
fillpoint(r3, xy(377,126), 27.0).
fillpoint(r3, xy(177,173), 27.0).
fillpoint(r3, xy(116,187), 27.0).
fillpoint(r3, xy(116,260), 26.2).
fillpoint(r3, xy(129,273), 26.2).
fillpoint(r3, xy(132,274), 26.2).
fillpoint(r3, xy(182,75), 26.0).
fillpoint(r3, xy(298,75), 26.0).
fillpoint(r3, xy(314,92), 26.0).
fillpoint(r3, xy(315,108), 26.0).
fillpoint(r3, xy(332,124), 26.0).
fillpoint(r3, xy(348,125), 26.0).
fillpoint(r3, xy(382,125), 26.0).
fillpoint(r3, xy(182,174), 26.0).
fillpoint(r3, xy(115,192), 26.0).
fillpoint(r3, xy(115,258), 26.0).
fillpoint(r3, xy(119,264), 25.6).
fillpoint(r3, xy(120,265), 25.6).
fillpoint(r3, xy(121,267), 25.6).
fillpoint(r3, xy(122,268), 25.6).
fillpoint(r3, xy(124,269), 25.6).
fillpoint(r3, xy(125,270), 25.6).
fillpoint(r3, xy(191,75), 25.0).
fillpoint(r3, xy(364,175), 25.0).
fillpoint(r3, xy(191,175), 25.0).
fillpoint(r3, xy(364,200), 25.0).
fillpoint(r3, xy(114,225), 25.0).
fillpoint(r3, xy(141,275), 25.0).
fillpoint(r3, xy(290,274), 25.0).
fillpoint(r3, xy(359,210), 22.8).
fillpoint(r3, xy(300,269), 22.8).
fillpoint(r3, xy(352,217), 22.2).
fillpoint(r3, xy(307,262), 22.2).
fillpoint(r3, xy(350,223), 21.0).
fillpoint(r3, xy(313,260), 21.0).
fillpoint(r3, xy(349,232), 20.0).
fillpoint(r3, xy(323,259), 20.0).
fillpoint(r3, xy(346,240), 17.0).
fillpoint(r3, xy(330,256), 17.0).
fillpoint(r3, xy(345,243), 16.5).
fillpoint(r3, xy(333,255), 16.5).
fillpoint(r3, xy(344,245), 16.2).
fillpoint(r3, xy(335,254), 16.2).
region(r2, '#ffdc00', 30100, centroid(175,74)).
perimeter(r2, 1380).
polygon(r2, [xy(370,0),xy(370,9),xy(379,10),xy(380,19),xy(390,20),xy(390,39),xy(400,40),xy(400,49),xy(390,50),xy(389,100),xy(340,100),xy(339,50),xy(90,50),xy(89,280),xy(80,280),xy(80,270),xy(70,270),xy(70,260),xy(60,260),xy(59,250),xy(50,249),xy(50,230),xy(40,229),xy(40,10),xy(50,9),xy(50,0)]).
midline(r2, [xy(152,25),xy(90,24),xy(74,27),xy(70,24),xy(70,21),xy(72,23)]).
midline(r2, [xy(153,25),xy(349,25),xy(349,21),xy(351,19),xy(351,21)]).
midline(r2, [xy(350,26),xy(358,31),xy(364,40),xy(365,75)]).
midline(r2, [xy(73,27),xy(70,26)]).
midline(r2, [xy(71,28),xy(65,31),xy(67,35),xy(64,50),xy(64,210),xy(69,222),xy(69,232),xy(79,254),xy(79,260),xy(84,266),xy(85,275)]).
midline(r2, [xy(366,45),xy(395,45)]).
fillpoint(r2, xy(71,28), 29.0).
fillpoint(r2, xy(70,29), 29.0).
fillpoint(r2, xy(69,30), 29.0).
fillpoint(r2, xy(68,31), 29.0).
fillpoint(r2, xy(74,27), 28.0).
fillpoint(r2, xy(67,34), 28.0).
fillpoint(r2, xy(77,26), 27.0).
fillpoint(r2, xy(66,37), 27.0).
fillpoint(r2, xy(350,26), 26.2).
fillpoint(r2, xy(363,39), 26.2).
fillpoint(r2, xy(364,42), 26.2).
fillpoint(r2, xy(82,25), 26.0).
fillpoint(r2, xy(348,25), 26.0).
fillpoint(r2, xy(65,42), 26.0).
fillpoint(r2, xy(354,29), 25.6).
fillpoint(r2, xy(355,30), 25.6).
fillpoint(r2, xy(357,31), 25.6).
fillpoint(r2, xy(358,32), 25.6).
fillpoint(r2, xy(359,34), 25.6).
fillpoint(r2, xy(360,35), 25.6).
fillpoint(r2, xy(91,25), 25.0).
fillpoint(r2, xy(64,131), 25.0).
fillpoint(r2, xy(365,63), 25.0).
fillpoint(r2, xy(69,223), 21.0).
fillpoint(r2, xy(69,232), 20.0).
fillpoint(r2, xy(74,244), 16.0).
fillpoint(r2, xy(79,255), 11.0).
border(r2).
region(r8, '#ffdc00', 15000, centroid(248,191)).
perimeter(r8, 700).
polygon(r8, [xy(289,250),xy(140,249),xy(140,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r8, [xy(263,210),xy(266,186),xy(271,175),xy(265,159),xy(265,124)]).
midline(r8, [xy(263,211),xy(258,221),xy(249,224),xy(164,225)]).
midline(r8, [xy(272,174),xy(315,175)]).
fillpoint(r8, xy(271,175), 31.4).
fillpoint(r8, xy(260,220), 29.7).
fillpoint(r8, xy(268,168), 29.0).
fillpoint(r8, xy(268,181), 29.0).
fillpoint(r8, xy(261,218), 29.0).
fillpoint(r8, xy(258,221), 29.0).
fillpoint(r8, xy(267,165), 28.0).
fillpoint(r8, xy(267,184), 28.0).
fillpoint(r8, xy(262,215), 28.0).
fillpoint(r8, xy(255,222), 28.0).
fillpoint(r8, xy(266,162), 27.0).
fillpoint(r8, xy(266,187), 27.0).
fillpoint(r8, xy(263,212), 27.0).
fillpoint(r8, xy(252,223), 27.0).
fillpoint(r8, xy(265,158), 26.0).
fillpoint(r8, xy(265,192), 26.0).
fillpoint(r8, xy(264,208), 26.0).
fillpoint(r8, xy(248,224), 26.0).
fillpoint(r8, xy(265,136), 25.0).
fillpoint(r8, xy(291,175), 25.0).
fillpoint(r8, xy(164,225), 25.0).
region(r16, '#5a5a5a', 8000, centroid(350,620)).
perimeter(r16, 840).
polygon(r16, [xy(549,630),xy(150,630),xy(150,610),xy(549,610),xy(549,630)]).
midline(r16, [xy(365,620),xy(159,620)]).
midline(r16, [xy(366,620),xy(540,620)]).
fillpoint(r16, xy(159,620), 10.0).
region(r14, '#ffdc00', 2300, centroid(213,308)).
perimeter(r14, 340).
polygon(r14, [xy(249,320),xy(170,320),xy(169,310),xy(140,310),xy(140,300),xy(290,300),xy(289,310),xy(250,310),xy(249,320)]).
midline(r14, [xy(194,310),xy(179,310),xy(169,304),xy(144,305)]).
midline(r14, [xy(195,309),xy(240,310),xy(244,306),xy(252,304),xy(285,305)]).
fillpoint(r14, xy(179,310), 10.0).
fillpoint(r14, xy(144,305), 5.0).
fillpoint(r14, xy(251,305), 5.0).
region(r9, '#870c25', 1500, centroid(214,134)).
perimeter(r9, 160).
polygon(r9, [xy(239,150),xy(190,150),xy(190,120),xy(239,120),xy(239,150)]).
midline(r9, [xy(216,134),xy(204,135)]).
midline(r9, [xy(217,135),xy(225,135)]).
fillpoint(r9, xy(204,135), 15.0).
region(r7, '#bebebe', 1000, centroid(214,110)).
perimeter(r7, 140).
polygon(r7, [xy(239,120),xy(190,120),xy(190,100),xy(239,100),xy(239,120)]).
midline(r7, [xy(210,109),xy(199,110)]).
midline(r7, [xy(211,109),xy(230,110)]).
fillpoint(r7, xy(199,110), 10.0).
region(r4, '#5a5a5a', 800, centroid(114,74)).
perimeter(r4, 160).
polygon(r4, [xy(129,90),xy(100,89),xy(100,60),xy(130,60),xy(129,90)]).
hole(r4, [xy(120,79),xy(119,70),xy(110,70),xy(110,80),xy(120,79)]).
midline(r4, [xy(119,64),xy(105,65),xy(105,84),xy(118,85),xy(124,83),xy(124,66),xy(120,65)]).
fillpoint(r4, xy(106,65), 6.0).
fillpoint(r4, xy(124,65), 6.0).
fillpoint(r4, xy(105,84), 6.0).
fillpoint(r4, xy(123,84), 6.0).
fillpoint(r4, xy(111,65), 5.0).
fillpoint(r4, xy(104,75), 5.0).
fillpoint(r4, xy(124,75), 5.0).
fillpoint(r4, xy(111,85), 5.0).
region(r12, '#5a5a5a', 800, centroid(314,224)).
perimeter(r12, 160).
polygon(r12, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r12, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r12, [xy(305,227),xy(305,215),xy(324,215),xy(325,222),xy(323,234),xy(306,234),xy(305,228)]).
fillpoint(r12, xy(306,215), 6.0).
fillpoint(r12, xy(324,215), 6.0).
fillpoint(r12, xy(305,234), 6.0).
fillpoint(r12, xy(323,234), 6.0).
fillpoint(r12, xy(311,215), 5.0).
fillpoint(r12, xy(304,225), 5.0).
fillpoint(r12, xy(324,225), 5.0).
fillpoint(r12, xy(311,235), 5.0).
region(r10, '#ffdc00', 500, centroid(396,166)).
perimeter(r10, 120).
polygon(r10, [xy(399,190),xy(390,189),xy(390,150),xy(409,150),xy(410,159),xy(400,160),xy(399,190)]).
midline(r10, [xy(395,161),xy(395,155),xy(405,155)]).
midline(r10, [xy(395,162),xy(395,185)]).
fillpoint(r10, xy(396,155), 6.0).
fillpoint(r10, xy(401,155), 5.0).
fillpoint(r10, xy(395,173), 5.0).
region(r15, '#2ecc40', 400, centroid(140,620)).
perimeter(r15, 80).
polygon(r15, [xy(149,630),xy(130,629),xy(130,610),xy(150,610),xy(149,630)]).
midline(r15, [xy(139,619),xy(140,620)]).
fillpoint(r15, xy(139,620), 10.0).
region(r17, '#7fdbff', 400, centroid(570,620)).
perimeter(r17, 80).
polygon(r17, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r17, [xy(569,619),xy(570,620)]).
fillpoint(r17, xy(569,620), 10.0).
region(r18, '#7fdbff', 400, centroid(600,620)).
perimeter(r18, 80).
polygon(r18, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r18, [xy(599,619),xy(600,620)]).
fillpoint(r18, xy(599,620), 10.0).
region(r19, '#7fdbff', 400, centroid(630,620)).
perimeter(r19, 80).
polygon(r19, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r19, [xy(629,619),xy(630,620)]).
fillpoint(r19, xy(629,620), 10.0).
border(r19).
region(r5, '#2ecc40', 100, centroid(114,74)).
perimeter(r5, 40).
polygon(r5, [xy(119,80),xy(110,79),xy(110,70),xy(120,70),xy(119,80)]).
midline(r5, [xy(115,75),xy(115,74)]).
fillpoint(r5, xy(114,75), 5.0).
region(r13, '#2ecc40', 100, centroid(314,224)).
perimeter(r13, 40).
polygon(r13, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r13, [xy(315,225),xy(315,224)]).
fillpoint(r13, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 420).
adjacent(r1, r3).
shared_edge(r1, r3, 370).
adjacent(r1, r10).
shared_edge(r1, r10, 50).
adjacent(r1, r14).
shared_edge(r1, r14, 180).
adjacent(r1, r15).
shared_edge(r1, r15, 60).
adjacent(r1, r16).
shared_edge(r1, r16, 820).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 640).
adjacent(r3, r4).
shared_edge(r3, r4, 120).
adjacent(r3, r7).
shared_edge(r3, r7, 70).
adjacent(r3, r8).
shared_edge(r3, r8, 650).
adjacent(r3, r9).
shared_edge(r3, r9, 80).
adjacent(r3, r10).
shared_edge(r3, r10, 60).
adjacent(r3, r12).
shared_edge(r3, r12, 120).
adjacent(r3, r14).
shared_edge(r3, r14, 160).
adjacent(r4, r5).
shared_edge(r4, r5, 40).
adjacent(r7, r8).
shared_edge(r7, r8, 20).
adjacent(r7, r9).
shared_edge(r7, r9, 50).
adjacent(r8, r9).
shared_edge(r8, r9, 30).
adjacent(r12, r13).
shared_edge(r12, r13, 40).
adjacent(r15, r16).
shared_edge(r15, r16, 20).

encloses(r4, r5).
encloses(r12, r13).
encloses(r1, r17).
encloses(r1, r18).
