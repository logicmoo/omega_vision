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

region(r1, '#aaaaaa', 289400, centroid(286,373)).
perimeter(r1, 4760).
polygon(r1, [xy(250,0),xy(250,9),xy(240,10),xy(240,19),xy(230,20),xy(230,39),xy(220,40),xy(220,79),xy(210,80),xy(210,159),xy(220,160),xy(220,199),xy(230,200),xy(230,219),xy(239,220),xy(240,230),xy(250,230),xy(250,249),xy(259,250),xy(260,259),xy(269,260),xy(270,269),xy(280,270),xy(280,280),xy(299,280),xy(300,289),xy(309,290),xy(310,300),xy(329,300),xy(330,310),xy(369,310),xy(370,320),xy(449,320),xy(450,310),xy(489,310),xy(490,300),xy(509,300),xy(510,290),xy(520,289),xy(520,280),xy(539,280),xy(540,270),xy(549,270),xy(550,260),xy(559,260),xy(560,250),xy(570,249),xy(570,230),xy(579,230),xy(580,220),xy(590,219),xy(590,200),xy(600,199),xy(600,160),xy(610,159),xy(610,80),xy(600,79),xy(600,40),xy(590,39),xy(590,20),xy(580,20),xy(580,10),xy(570,9),xy(570,0)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(184,422),xy(169,410),xy(164,411),xy(155,419),xy(119,439),xy(84,465),xy(34,515),xy(19,533),xy(14,550),xy(14,567),xy(17,579),xy(14,590),xy(14,609),xy(17,622),xy(33,625),xy(59,623),xy(60,600),xy(40,580),xy(18,579)]).
midline(r1, [xy(185,423),xy(202,436),xy(197,442),xy(198,445),xy(185,475),xy(185,480),xy(152,543),xy(114,590),xy(110,602),xy(109,617),xy(102,622),xy(89,625),xy(61,623)]).
midline(r1, [xy(158,418),xy(162,414),xy(169,412)]).
midline(r1, [xy(166,520),xy(168,518)]).
midline(r1, [xy(196,453),xy(197,456),xy(199,454),xy(197,450)]).
midline(r1, [xy(188,474),xy(189,478),xy(184,483)]).
midline(r1, [xy(152,421),xy(151,422)]).
midline(r1, [xy(190,477),xy(189,471),xy(195,462),xy(193,460)]).
midline(r1, [xy(170,409),xy(141,341),xy(115,250),xy(105,179),xy(104,104),xy(147,64),xy(168,51),xy(192,29),xy(209,21)]).
midline(r1, [xy(136,430),xy(135,431)]).
midline(r1, [xy(109,619),xy(120,630),xy(130,635),xy(549,635),xy(554,633),xy(554,530),xy(556,526),xy(491,461),xy(449,465),xy(346,464),xy(276,455),xy(203,436)]).
midline(r1, [xy(268,451),xy(331,388),xy(330,384),xy(264,450)]).
midline(r1, [xy(248,447),xy(332,363),xy(336,354),xy(343,346),xy(339,353),xy(340,356),xy(333,362),xy(331,367),xy(251,447)]).
midline(r1, [xy(332,384),xy(333,380),xy(331,377),xy(259,449)]).
midline(r1, [xy(555,633),xy(575,635),xy(585,632),xy(585,556),xy(557,527)]).
midline(r1, [xy(341,355),xy(343,350)]).
midline(r1, [xy(586,556),xy(616,586),xy(614,588),xy(615,632),xy(606,635),xy(585,633)]).
midline(r1, [xy(113,228),xy(115,226)]).
midline(r1, [xy(143,198),xy(158,193),xy(158,195)]).
midline(r1, [xy(333,366),xy(334,368),xy(256,448),xy(336,369),xy(336,362),xy(338,362),xy(338,365)]).
midline(r1, [xy(336,371),xy(332,374),xy(333,377),xy(334,374)]).
midline(r1, [xy(492,460),xy(522,421),xy(488,387),xy(488,380),xy(481,365),xy(483,362),xy(478,356),xy(475,343),xy(468,332),xy(470,332)]).
midline(r1, [xy(484,364),xy(483,366)]).
midline(r1, [xy(523,420),xy(525,418),xy(489,382)]).
midline(r1, [xy(526,417),xy(555,369),xy(508,322),xy(506,318),xy(508,318)]).
midline(r1, [xy(485,370),xy(486,368),xy(484,368)]).
midline(r1, [xy(487,373),xy(487,370)]).
midline(r1, [xy(487,376),xy(487,375)]).
midline(r1, [xy(476,345),xy(476,344)]).
midline(r1, [xy(180,494),xy(178,496)]).
midline(r1, [xy(171,50),xy(182,54),xy(185,53),xy(184,55)]).
midline(r1, [xy(187,54),xy(195,60),xy(197,59),xy(197,61)]).
midline(r1, [xy(210,19),xy(216,14),xy(224,10),xy(230,10),xy(236,5),xy(245,5)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(510,322),xy(557,367),xy(566,346),xy(582,319),xy(600,275),xy(606,246),xy(612,236),xy(614,229),xy(613,221),xy(619,207),xy(619,178),xy(625,159),xy(625,80),xy(622,67),xy(618,61),xy(620,57),xy(619,32),xy(617,25),xy(603,14),xy(595,10),xy(589,10),xy(583,5),xy(574,5)]).
midline(r1, [xy(199,456),xy(195,460),xy(199,458)]).
midline(r1, [xy(200,455),xy(199,445),xy(201,441),xy(201,445)]).
midline(r1, [xy(202,452),xy(201,451)]).
midline(r1, [xy(187,184),xy(161,192),xy(161,194)]).
midline(r1, [xy(187,186),xy(189,182),xy(193,180),xy(193,182)]).
midline(r1, [xy(608,23),xy(609,22)]).
fillpoint(r1, xy(200,435), 174.3).
fillpoint(r1, xy(188,425), 172.6).
fillpoint(r1, xy(184,422), 172.1).
fillpoint(r1, xy(179,418), 171.8).
fillpoint(r1, xy(171,412), 171.6).
fillpoint(r1, xy(174,414), 171.6).
fillpoint(r1, xy(175,415), 171.6).
fillpoint(r1, xy(215,440), 170.0).
fillpoint(r1, xy(218,441), 169.0).
fillpoint(r1, xy(225,443), 167.0).
fillpoint(r1, xy(229,444), 166.0).
fillpoint(r1, xy(233,445), 165.0).
fillpoint(r1, xy(237,446), 164.0).
fillpoint(r1, xy(241,447), 163.0).
fillpoint(r1, xy(246,448), 162.0).
fillpoint(r1, xy(250,449), 161.0).
fillpoint(r1, xy(254,450), 160.0).
fillpoint(r1, xy(258,451), 159.0).
fillpoint(r1, xy(262,452), 158.0).
fillpoint(r1, xy(267,453), 157.0).
fillpoint(r1, xy(272,454), 156.0).
fillpoint(r1, xy(277,455), 155.0).
fillpoint(r1, xy(284,456), 154.0).
fillpoint(r1, xy(290,457), 153.0).
fillpoint(r1, xy(298,458), 152.0).
fillpoint(r1, xy(310,459), 151.0).
fillpoint(r1, xy(318,460), 150.0).
fillpoint(r1, xy(324,461), 149.0).
fillpoint(r1, xy(491,461), 148.1).
fillpoint(r1, xy(331,462), 148.0).
fillpoint(r1, xy(489,462), 148.0).
fillpoint(r1, xy(339,463), 147.0).
fillpoint(r1, xy(481,463), 147.0).
fillpoint(r1, xy(350,464), 146.0).
fillpoint(r1, xy(470,464), 146.0).
fillpoint(r1, xy(144,348), 145.0).
fillpoint(r1, xy(371,465), 145.0).
fillpoint(r1, xy(136,325), 137.0).
fillpoint(r1, xy(135,322), 136.0).
fillpoint(r1, xy(133,315), 134.0).
fillpoint(r1, xy(132,311), 133.0).
fillpoint(r1, xy(131,307), 132.0).
fillpoint(r1, xy(129,301), 130.0).
fillpoint(r1, xy(128,298), 129.0).
fillpoint(r1, xy(127,295), 128.0).
fillpoint(r1, xy(126,292), 127.0).
fillpoint(r1, xy(125,289), 126.0).
fillpoint(r1, xy(123,282), 124.0).
fillpoint(r1, xy(122,278), 123.0).
fillpoint(r1, xy(121,274), 122.0).
fillpoint(r1, xy(120,270), 121.0).
fillpoint(r1, xy(119,265), 120.0).
fillpoint(r1, xy(117,257), 118.0).
fillpoint(r1, xy(116,253), 117.0).
fillpoint(r1, xy(115,249), 116.0).
fillpoint(r1, xy(114,244), 115.0).
fillpoint(r1, xy(113,239), 114.0).
fillpoint(r1, xy(112,234), 113.0).
fillpoint(r1, xy(111,226), 112.0).
fillpoint(r1, xy(110,216), 111.0).
fillpoint(r1, xy(109,203), 110.0).
fillpoint(r1, xy(108,198), 109.0).
fillpoint(r1, xy(107,193), 108.0).
fillpoint(r1, xy(106,186), 107.0).
fillpoint(r1, xy(105,176), 106.0).
fillpoint(r1, xy(105,131), 105.0).
fillpoint(r1, xy(582,318), 58.0).
fillpoint(r1, xy(595,286), 45.0).
border(r1).
region(r2, '#ffdc00', 37300, centroid(437,95)).
perimeter(r2, 1900).
polygon(r2, [xy(570,0),xy(570,9),xy(579,10),xy(580,20),xy(590,20),xy(590,39),xy(600,40),xy(600,79),xy(610,80),xy(610,159),xy(600,160),xy(600,199),xy(590,199),xy(590,50),xy(490,50),xy(489,310),xy(450,310),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,150),xy(440,149),xy(440,50),xy(390,50),xy(390,99),xy(340,100),xy(339,50),xy(220,49),xy(220,40),xy(230,39),xy(230,20),xy(239,20),xy(240,10),xy(250,9),xy(250,0)]).
midline(r2, [xy(467,286),xy(464,280),xy(465,190),xy(462,173),xy(457,169),xy(409,170)]).
midline(r2, [xy(461,169),xy(465,148),xy(465,33),xy(463,30),xy(439,24),xy(390,24),xy(376,26),xy(364,31),xy(353,26),xy(339,24),xy(274,25),xy(268,22),xy(266,18),xy(268,18)]).
midline(r2, [xy(465,31),xy(476,26),xy(490,24),xy(548,25),xy(550,23),xy(555,27),xy(575,34),xy(584,43),xy(594,45),xy(594,78),xy(596,85),xy(600,89),xy(600,150),xy(594,160),xy(595,195)]).
midline(r2, [xy(365,32),xy(365,75)]).
midline(r2, [xy(269,24),xy(244,34),xy(233,44),xy(224,45)]).
fillpoint(r2, xy(365,31), 31.4).
fillpoint(r2, xy(465,31), 31.4).
fillpoint(r2, xy(358,28), 29.0).
fillpoint(r2, xy(371,28), 29.0).
fillpoint(r2, xy(458,28), 29.0).
fillpoint(r2, xy(471,28), 29.0).
fillpoint(r2, xy(460,170), 29.0).
fillpoint(r2, xy(355,27), 28.0).
fillpoint(r2, xy(374,27), 28.0).
fillpoint(r2, xy(455,27), 28.0).
fillpoint(r2, xy(474,27), 28.0).
fillpoint(r2, xy(462,165), 28.0).
fillpoint(r2, xy(462,174), 28.0).
fillpoint(r2, xy(352,26), 27.0).
fillpoint(r2, xy(377,26), 27.0).
fillpoint(r2, xy(452,26), 27.0).
fillpoint(r2, xy(477,26), 27.0).
fillpoint(r2, xy(463,162), 27.0).
fillpoint(r2, xy(463,177), 27.0).
fillpoint(r2, xy(348,25), 26.0).
fillpoint(r2, xy(382,25), 26.0).
fillpoint(r2, xy(448,25), 26.0).
fillpoint(r2, xy(482,25), 26.0).
fillpoint(r2, xy(464,158), 26.0).
fillpoint(r2, xy(464,182), 26.0).
fillpoint(r2, xy(269,25), 25.0).
fillpoint(r2, xy(391,25), 25.0).
fillpoint(r2, xy(491,25), 25.0).
fillpoint(r2, xy(365,63), 25.0).
fillpoint(r2, xy(464,100), 25.0).
fillpoint(r2, xy(464,236), 25.0).
fillpoint(r2, xy(409,170), 20.0).
fillpoint(r2, xy(245,34), 16.0).
fillpoint(r2, xy(574,34), 16.0).
fillpoint(r2, xy(599,120), 10.0).
border(r2).
region(r3, '#2ecc40', 32500, centroid(335,187)).
perimeter(r3, 1480).
polygon(r3, [xy(439,320),xy(370,320),xy(369,310),xy(330,310),xy(329,300),xy(310,300),xy(310,290),xy(300,290),xy(299,280),xy(280,280),xy(280,270),xy(270,270),xy(270,260),xy(260,259),xy(260,250),xy(290,249),xy(290,200),xy(340,199),xy(340,150),xy(290,150),xy(289,100),xy(240,100),xy(240,199),xy(220,200),xy(220,160),xy(210,159),xy(210,80),xy(220,79),xy(220,50),xy(339,50),xy(340,99),xy(390,100),xy(390,199),xy(440,200),xy(439,320)]).
hole(r3, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r3, [xy(343,125),xy(330,124),xy(318,119),xy(313,86),xy(308,78),xy(286,74),xy(244,74),xy(224,94),xy(224,145),xy(230,160),xy(230,190)]).
midline(r3, [xy(344,125),xy(359,128),xy(363,136),xy(365,150),xy(364,224),xy(343,214),xy(333,205),xy(295,205),xy(294,239),xy(307,260),xy(294,265),xy(285,260),xy(279,260),xy(273,255),xy(264,255)]).
midline(r3, [xy(308,261),xy(329,269),xy(355,269),xy(354,275),xy(356,274)]).
midline(r3, [xy(357,269),xy(383,255),xy(364,226),xy(366,226)]).
midline(r3, [xy(384,255),xy(397,277),xy(396,285),xy(392,289),xy(395,288)]).
midline(r3, [xy(398,281),xy(397,282)]).
fillpoint(r3, xy(383,255), 56.3).
fillpoint(r3, xy(310,79), 29.7).
fillpoint(r3, xy(319,120), 29.7).
fillpoint(r3, xy(360,129), 29.7).
fillpoint(r3, xy(308,78), 29.0).
fillpoint(r3, xy(311,81), 29.0).
fillpoint(r3, xy(318,118), 29.0).
fillpoint(r3, xy(321,121), 29.0).
fillpoint(r3, xy(358,128), 29.0).
fillpoint(r3, xy(361,131), 29.0).
fillpoint(r3, xy(328,268), 29.0).
fillpoint(r3, xy(305,77), 28.0).
fillpoint(r3, xy(312,84), 28.0).
fillpoint(r3, xy(317,115), 28.0).
fillpoint(r3, xy(324,122), 28.0).
fillpoint(r3, xy(355,127), 28.0).
fillpoint(r3, xy(362,134), 28.0).
fillpoint(r3, xy(325,267), 28.0).
fillpoint(r3, xy(302,76), 27.0).
fillpoint(r3, xy(313,87), 27.0).
fillpoint(r3, xy(316,112), 27.0).
fillpoint(r3, xy(327,123), 27.0).
fillpoint(r3, xy(352,126), 27.0).
fillpoint(r3, xy(363,137), 27.0).
fillpoint(r3, xy(298,75), 26.0).
fillpoint(r3, xy(314,92), 26.0).
fillpoint(r3, xy(315,108), 26.0).
fillpoint(r3, xy(332,124), 26.0).
fillpoint(r3, xy(348,125), 26.0).
fillpoint(r3, xy(364,142), 26.0).
fillpoint(r3, xy(244,75), 25.0).
fillpoint(r3, xy(364,175), 25.0).
fillpoint(r3, xy(225,94), 16.0).
fillpoint(r3, xy(295,264), 16.0).
fillpoint(r3, xy(225,123), 15.0).
region(r5, '#2ecc40', 20400, centroid(536,164)).
perimeter(r5, 940).
polygon(r5, [xy(509,300),xy(490,299),xy(490,50),xy(589,50),xy(590,219),xy(580,220),xy(580,229),xy(570,230),xy(570,249),xy(560,250),xy(560,259),xy(550,260),xy(550,269),xy(540,270),xy(539,280),xy(520,280),xy(520,289),xy(510,290),xy(509,300)]).
hole(r5, [xy(530,89),xy(529,60),xy(500,60),xy(500,90),xy(530,89)]).
hole(r5, [xy(570,189),xy(570,180),xy(579,180),xy(580,170),xy(570,170),xy(569,160),xy(560,160),xy(560,169),xy(550,170),xy(550,179),xy(559,180),xy(560,190),xy(570,189)]).
midline(r5, [xy(556,108),xy(549,123),xy(531,131),xy(495,93),xy(495,55),xy(527,54),xy(533,55),xy(540,60),xy(560,79),xy(557,107)]).
midline(r5, [xy(530,132),xy(521,155),xy(519,176),xy(521,194),xy(531,218),xy(518,252),xy(507,267),xy(500,284),xy(500,290)]).
midline(r5, [xy(532,218),xy(561,211),xy(573,205),xy(579,195),xy(579,189),xy(584,183),xy(584,166),xy(579,160),xy(579,154),xy(575,146),xy(552,122)]).
midline(r5, [xy(518,254),xy(521,257)]).
fillpoint(r5, xy(531,130), 41.0).
fillpoint(r5, xy(530,219), 41.0).
fillpoint(r5, xy(550,122), 39.1).
fillpoint(r5, xy(539,127), 39.1).
fillpoint(r5, xy(548,123), 38.9).
fillpoint(r5, xy(541,126), 38.9).
fillpoint(r5, xy(546,124), 38.6).
fillpoint(r5, xy(543,125), 38.6).
fillpoint(r5, xy(558,103), 32.0).
fillpoint(r5, xy(521,156), 32.0).
fillpoint(r5, xy(521,193), 32.0).
fillpoint(r5, xy(559,98), 31.0).
fillpoint(r5, xy(520,162), 31.0).
fillpoint(r5, xy(520,188), 31.0).
fillpoint(r5, xy(559,84), 30.0).
fillpoint(r5, xy(519,175), 30.0).
fillpoint(r5, xy(518,251), 29.0).
fillpoint(r5, xy(570,206), 17.0).
fillpoint(r5, xy(573,205), 16.5).
fillpoint(r5, xy(505,274), 16.0).
fillpoint(r5, xy(579,155), 11.0).
fillpoint(r5, xy(579,194), 11.0).
fillpoint(r5, xy(500,285), 11.0).
region(r8, '#ffdc00', 10000, centroid(277,174)).
perimeter(r8, 520).
polygon(r8, [xy(289,250),xy(250,250),xy(250,230),xy(240,230),xy(240,220),xy(230,219),xy(230,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r8, [xy(313,174),xy(273,175),xy(270,173),xy(265,158),xy(265,124)]).
midline(r8, [xy(271,175),xy(265,190),xy(264,207),xy(258,211),xy(256,209),xy(239,210)]).
midline(r8, [xy(264,209),xy(270,230)]).
midline(r8, [xy(314,174),xy(315,175)]).
fillpoint(r8, xy(271,175), 31.4).
fillpoint(r8, xy(268,168), 29.0).
fillpoint(r8, xy(268,181), 29.0).
fillpoint(r8, xy(267,165), 28.0).
fillpoint(r8, xy(267,184), 28.0).
fillpoint(r8, xy(266,162), 27.0).
fillpoint(r8, xy(266,187), 27.0).
fillpoint(r8, xy(265,158), 26.0).
fillpoint(r8, xy(265,192), 26.0).
fillpoint(r8, xy(264,208), 26.0).
fillpoint(r8, xy(265,136), 25.0).
fillpoint(r8, xy(291,175), 25.0).
fillpoint(r8, xy(269,223), 21.0).
region(r21, '#5a5a5a', 8000, centroid(350,620)).
perimeter(r21, 840).
polygon(r21, [xy(549,630),xy(150,630),xy(150,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(365,620),xy(159,620)]).
midline(r21, [xy(366,620),xy(540,620)]).
fillpoint(r21, xy(159,620), 10.0).
region(r4, '#2ecc40', 2500, centroid(414,74)).
perimeter(r4, 200).
polygon(r4, [xy(439,100),xy(390,99),xy(390,50),xy(440,50),xy(439,100)]).
midline(r4, [xy(414,75),xy(415,75)]).
fillpoint(r4, xy(414,75), 25.0).
region(r18, '#7fdbff', 2000, centroid(64,576)).
perimeter(r18, 240).
polygon(r18, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r18, [xy(51,560),xy(39,560)]).
midline(r18, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r18, xy(58,561), 12.0).
fillpoint(r18, xy(61,578), 12.0).
fillpoint(r18, xy(78,581), 12.0).
fillpoint(r18, xy(54,560), 11.0).
fillpoint(r18, xy(59,565), 11.0).
fillpoint(r18, xy(60,574), 11.0).
fillpoint(r18, xy(65,579), 11.0).
fillpoint(r18, xy(74,580), 11.0).
fillpoint(r18, xy(79,585), 11.0).
fillpoint(r18, xy(39,560), 10.0).
fillpoint(r18, xy(79,596), 10.0).
region(r10, '#870c25', 1500, centroid(414,134)).
perimeter(r10, 160).
polygon(r10, [xy(439,150),xy(390,150),xy(390,120),xy(439,120),xy(439,150)]).
midline(r10, [xy(410,135),xy(404,135)]).
midline(r10, [xy(411,134),xy(425,135)]).
fillpoint(r10, xy(404,135), 15.0).
region(r9, '#bebebe', 1000, centroid(414,110)).
perimeter(r9, 140).
polygon(r9, [xy(439,120),xy(390,120),xy(390,100),xy(439,100),xy(439,120)]).
midline(r9, [xy(409,110),xy(399,110)]).
midline(r9, [xy(410,110),xy(430,110)]).
fillpoint(r9, xy(399,110), 10.0).
region(r6, '#5a5a5a', 800, centroid(514,74)).
perimeter(r6, 160).
polygon(r6, [xy(529,90),xy(500,89),xy(500,60),xy(530,60),xy(529,90)]).
hole(r6, [xy(520,79),xy(519,70),xy(510,70),xy(510,80),xy(520,79)]).
midline(r6, [xy(519,64),xy(505,65),xy(505,84),xy(519,85),xy(524,83),xy(524,66),xy(520,65)]).
fillpoint(r6, xy(506,65), 6.0).
fillpoint(r6, xy(524,65), 6.0).
fillpoint(r6, xy(505,84), 6.0).
fillpoint(r6, xy(523,84), 6.0).
fillpoint(r6, xy(511,65), 5.0).
fillpoint(r6, xy(504,75), 5.0).
fillpoint(r6, xy(524,75), 5.0).
fillpoint(r6, xy(511,85), 5.0).
region(r15, '#5a5a5a', 800, centroid(314,224)).
perimeter(r15, 160).
polygon(r15, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r15, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r15, [xy(319,214),xy(305,215),xy(305,234),xy(319,235),xy(324,233),xy(324,216),xy(320,215)]).
fillpoint(r15, xy(306,215), 6.0).
fillpoint(r15, xy(324,215), 6.0).
fillpoint(r15, xy(305,234), 6.0).
fillpoint(r15, xy(323,234), 6.0).
fillpoint(r15, xy(311,215), 5.0).
fillpoint(r15, xy(304,225), 5.0).
fillpoint(r15, xy(324,225), 5.0).
fillpoint(r15, xy(311,235), 5.0).
region(r14, '#0074d9', 500, centroid(414,194)).
perimeter(r14, 120).
polygon(r14, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r14, [xy(409,194),xy(394,195)]).
midline(r14, [xy(410,194),xy(435,195)]).
fillpoint(r14, xy(394,195), 5.0).
region(r19, '#7fdbff', 400, centroid(40,600)).
perimeter(r19, 80).
polygon(r19, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r19, [xy(39,599),xy(40,600)]).
fillpoint(r19, xy(39,600), 10.0).
region(r20, '#2ecc40', 400, centroid(140,620)).
perimeter(r20, 80).
polygon(r20, [xy(149,630),xy(130,629),xy(130,610),xy(150,610),xy(149,630)]).
midline(r20, [xy(139,619),xy(140,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r22, '#7fdbff', 400, centroid(570,620)).
perimeter(r22, 80).
polygon(r22, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r22, [xy(569,619),xy(570,620)]).
fillpoint(r22, xy(569,620), 10.0).
region(r23, '#7fdbff', 400, centroid(600,620)).
perimeter(r23, 80).
polygon(r23, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r23, [xy(599,619),xy(600,620)]).
fillpoint(r23, xy(599,620), 10.0).
region(r24, '#2ecc40', 400, centroid(630,620)).
perimeter(r24, 80).
polygon(r24, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r24, [xy(629,619),xy(630,620)]).
fillpoint(r24, xy(629,620), 10.0).
border(r24).
region(r7, '#2ecc40', 100, centroid(514,74)).
perimeter(r7, 40).
polygon(r7, [xy(519,80),xy(510,79),xy(510,70),xy(520,70),xy(519,80)]).
midline(r7, [xy(515,75),xy(515,74)]).
fillpoint(r7, xy(514,75), 5.0).
region(r16, '#2ecc40', 100, centroid(314,224)).
perimeter(r16, 40).
polygon(r16, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r16, [xy(315,225),xy(315,224)]).
fillpoint(r16, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 390).
adjacent(r1, r3).
shared_edge(r1, r3, 430).
adjacent(r1, r5).
shared_edge(r1, r5, 200).
adjacent(r1, r8).
shared_edge(r1, r8, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 240).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 60).
adjacent(r1, r21).
shared_edge(r1, r21, 820).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 360).
adjacent(r2, r4).
shared_edge(r2, r4, 150).
adjacent(r2, r5).
shared_edge(r2, r5, 500).
adjacent(r2, r9).
shared_edge(r2, r9, 20).
adjacent(r2, r10).
shared_edge(r2, r10, 80).
adjacent(r2, r14).
shared_edge(r2, r14, 60).
adjacent(r3, r8).
shared_edge(r3, r8, 440).
adjacent(r3, r9).
shared_edge(r3, r9, 20).
adjacent(r3, r10).
shared_edge(r3, r10, 30).
adjacent(r3, r14).
shared_edge(r3, r14, 60).
adjacent(r3, r15).
shared_edge(r3, r15, 120).
adjacent(r4, r9).
shared_edge(r4, r9, 50).
adjacent(r5, r6).
shared_edge(r5, r6, 120).
adjacent(r6, r7).
shared_edge(r6, r7, 40).
adjacent(r9, r10).
shared_edge(r9, r10, 50).
adjacent(r15, r16).
shared_edge(r15, r16, 40).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r6, r7).
encloses(r15, r16).
encloses(r1, r18).
encloses(r1, r19).
encloses(r1, r22).
encloses(r1, r23).
