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

region(r1, '#aaaaaa', 307000, centroid(293,367)).
perimeter(r1, 4540).
polygon(r1, [xy(220,0),xy(220,29),xy(210,30),xy(210,109),xy(220,110),xy(220,149),xy(230,150),xy(230,169),xy(239,170),xy(240,179),xy(250,180),xy(250,199),xy(259,200),xy(260,209),xy(269,210),xy(270,219),xy(279,220),xy(280,230),xy(299,230),xy(300,239),xy(309,240),xy(310,250),xy(329,250),xy(330,260),xy(369,260),xy(370,270),xy(449,270),xy(450,260),xy(489,260),xy(490,250),xy(509,250),xy(510,240),xy(519,240),xy(520,230),xy(539,230),xy(540,220),xy(549,220),xy(550,210),xy(559,210),xy(560,200),xy(570,199),xy(570,180),xy(579,180),xy(580,170),xy(590,169),xy(590,150),xy(600,149),xy(600,110),xy(610,109),xy(610,30),xy(600,29),xy(600,0)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(429,635),xy(130,635),xy(124,633),xy(108,618),xy(102,622),xy(88,625),xy(70,625),xy(59,622),xy(49,625),xy(33,625),xy(18,622),xy(14,609),xy(14,590),xy(17,579),xy(14,569),xy(14,551),xy(19,533),xy(30,519),xy(81,468),xy(103,450),xy(130,432),xy(130,434)]).
midline(r1, [xy(18,580),xy(40,579),xy(40,580),xy(60,599),xy(59,621)]).
midline(r1, [xy(430,635),xy(549,635),xy(555,632),xy(555,526),xy(469,439),xy(370,440),xy(285,432),xy(210,416),xy(191,401),xy(173,410),xy(169,408),xy(162,415),xy(157,416),xy(151,422),xy(132,432)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,631),xy(579,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(469,438),xy(522,372),xy(488,338),xy(487,327),xy(484,325),xy(476,295),xy(468,282),xy(470,282)]).
midline(r1, [xy(488,329),xy(488,333)]).
midline(r1, [xy(473,288),xy(476,291)]).
midline(r1, [xy(483,315),xy(485,313),xy(482,311),xy(484,306),xy(478,300)]).
midline(r1, [xy(490,331),xy(525,366),xy(523,369),xy(490,336)]).
midline(r1, [xy(164,415),xy(169,410)]).
midline(r1, [xy(191,400),xy(167,354),xy(144,299),xy(125,240),xy(112,185),xy(104,104),xy(180,29),xy(193,19),xy(205,15)]).
midline(r1, [xy(113,178),xy(113,174),xy(139,148),xy(115,176)]).
midline(r1, [xy(156,419),xy(161,416)]).
midline(r1, [xy(109,617),xy(110,602),xy(117,585),xy(140,559),xy(164,523),xy(193,460),xy(193,455),xy(198,446),xy(197,442),xy(202,436),xy(210,417)]).
midline(r1, [xy(161,529),xy(163,526)]).
midline(r1, [xy(185,480),xy(187,477)]).
midline(r1, [xy(185,482),xy(184,483)]).
midline(r1, [xy(243,422),xy(332,333),xy(335,321),xy(333,316),xy(338,310),xy(339,301),xy(344,290),xy(347,287),xy(346,290)]).
midline(r1, [xy(339,309),xy(343,298)]).
midline(r1, [xy(339,311),xy(335,316),xy(337,316)]).
midline(r1, [xy(331,336),xy(246,422),xy(331,339)]).
midline(r1, [xy(117,174),xy(141,148)]).
midline(r1, [xy(345,293),xy(343,296)]).
midline(r1, [xy(200,441),xy(199,442)]).
midline(r1, [xy(143,148),xy(154,144),xy(157,147),xy(153,147)]).
midline(r1, [xy(480,304),xy(480,306)]).
midline(r1, [xy(526,367),xy(528,364),xy(487,323),xy(484,318),xy(487,313),xy(484,309),xy(532,356),xy(530,359),xy(488,317),xy(488,320)]).
midline(r1, [xy(488,316),xy(487,315)]).
midline(r1, [xy(530,360),xy(528,362),xy(489,323)]).
midline(r1, [xy(586,556),xy(616,586),xy(614,592),xy(614,633),xy(608,635),xy(585,633)]).
midline(r1, [xy(533,356),xy(555,321),xy(566,296),xy(573,287),xy(538,252),xy(573,285),xy(575,283),xy(600,225),xy(606,196),xy(610,191),xy(614,178),xy(614,172),xy(611,169),xy(614,170)]).
midline(r1, [xy(490,338),xy(523,371)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(615,168),xy(620,148),xy(619,127),xy(625,109),xy(625,30),xy(622,18),xy(614,15)]).
midline(r1, [xy(181,137),xy(159,143),xy(158,146),xy(160,147),xy(160,145)]).
midline(r1, [xy(182,136),xy(187,133),xy(185,136)]).
midline(r1, [xy(165,143),xy(162,145)]).
fillpoint(r1, xy(209,415), 194.3).
fillpoint(r1, xy(211,416), 194.0).
fillpoint(r1, xy(205,412), 193.8).
fillpoint(r1, xy(200,408), 193.2).
fillpoint(r1, xy(215,417), 193.0).
fillpoint(r1, xy(195,404), 192.9).
fillpoint(r1, xy(227,420), 190.0).
fillpoint(r1, xy(231,421), 189.0).
fillpoint(r1, xy(236,422), 188.0).
fillpoint(r1, xy(240,423), 187.0).
fillpoint(r1, xy(244,424), 186.0).
fillpoint(r1, xy(248,425), 185.0).
fillpoint(r1, xy(252,426), 184.0).
fillpoint(r1, xy(257,427), 183.0).
fillpoint(r1, xy(262,428), 182.0).
fillpoint(r1, xy(267,429), 181.0).
fillpoint(r1, xy(273,430), 180.0).
fillpoint(r1, xy(280,431), 179.0).
fillpoint(r1, xy(287,432), 178.0).
fillpoint(r1, xy(296,433), 177.0).
fillpoint(r1, xy(307,434), 176.0).
fillpoint(r1, xy(314,435), 175.0).
fillpoint(r1, xy(320,436), 174.0).
fillpoint(r1, xy(327,437), 173.0).
fillpoint(r1, xy(337,438), 172.0).
fillpoint(r1, xy(348,439), 171.0).
fillpoint(r1, xy(469,439), 171.0).
fillpoint(r1, xy(371,440), 170.0).
fillpoint(r1, xy(144,298), 145.0).
fillpoint(r1, xy(136,275), 137.0).
fillpoint(r1, xy(135,272), 136.0).
fillpoint(r1, xy(133,265), 134.0).
fillpoint(r1, xy(132,261), 133.0).
fillpoint(r1, xy(131,257), 132.0).
fillpoint(r1, xy(129,251), 130.0).
fillpoint(r1, xy(128,248), 129.0).
fillpoint(r1, xy(127,245), 128.0).
fillpoint(r1, xy(126,242), 127.0).
fillpoint(r1, xy(125,239), 126.0).
fillpoint(r1, xy(123,232), 124.0).
fillpoint(r1, xy(122,228), 123.0).
fillpoint(r1, xy(121,224), 122.0).
fillpoint(r1, xy(120,220), 121.0).
fillpoint(r1, xy(119,215), 120.0).
fillpoint(r1, xy(117,207), 118.0).
fillpoint(r1, xy(116,203), 117.0).
fillpoint(r1, xy(115,199), 116.0).
fillpoint(r1, xy(114,194), 115.0).
fillpoint(r1, xy(113,189), 114.0).
fillpoint(r1, xy(112,184), 113.0).
fillpoint(r1, xy(111,176), 112.0).
fillpoint(r1, xy(110,166), 111.0).
fillpoint(r1, xy(109,153), 110.0).
fillpoint(r1, xy(108,148), 109.0).
fillpoint(r1, xy(107,143), 108.0).
fillpoint(r1, xy(106,136), 107.0).
fillpoint(r1, xy(105,126), 106.0).
fillpoint(r1, xy(105,106), 105.0).
fillpoint(r1, xy(582,268), 58.0).
border(r1).
region(r2, '#ffdc00', 36100, centroid(431,78)).
perimeter(r2, 1740).
polygon(r2, [xy(600,0),xy(600,29),xy(610,30),xy(610,109),xy(600,110),xy(600,149),xy(590,149),xy(589,50),xy(490,50),xy(490,259),xy(450,260),xy(449,270),xy(440,269),xy(440,190),xy(390,189),xy(390,150),xy(440,149),xy(440,50),xy(390,50),xy(390,99),xy(340,100),xy(339,50),xy(210,50),xy(210,30),xy(220,29),xy(220,0)]).
midline(r2, [xy(465,235),xy(446,254),xy(445,265)]).
midline(r2, [xy(465,234),xy(465,190),xy(461,170),xy(409,170)]).
midline(r2, [xy(461,168),xy(465,149),xy(465,33),xy(463,30),xy(439,24),xy(390,24),xy(376,26),xy(365,31),xy(349,25),xy(335,24),xy(244,24),xy(233,35),xy(219,40)]).
midline(r2, [xy(465,31),xy(476,26),xy(490,24),xy(575,24),xy(586,35),xy(598,41),xy(600,50),xy(600,100),xy(596,104),xy(594,111),xy(595,145)]).
midline(r2, [xy(365,32),xy(365,75)]).
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
fillpoint(r2, xy(244,25), 25.0).
fillpoint(r2, xy(391,25), 25.0).
fillpoint(r2, xy(491,25), 25.0).
fillpoint(r2, xy(365,63), 25.0).
fillpoint(r2, xy(464,100), 25.0).
fillpoint(r2, xy(465,213), 25.0).
fillpoint(r2, xy(409,170), 20.0).
fillpoint(r2, xy(597,41), 12.0).
fillpoint(r2, xy(224,39), 11.0).
fillpoint(r2, xy(599,45), 11.0).
fillpoint(r2, xy(599,76), 10.0).
border(r2).
region(r3, '#2ecc40', 25900, centroid(340,150)).
perimeter(r3, 1320).
polygon(r3, [xy(439,270),xy(370,270),xy(369,260),xy(330,260),xy(329,250),xy(310,250),xy(310,240),xy(330,239),xy(330,210),xy(300,210),xy(300,229),xy(290,230),xy(290,200),xy(339,200),xy(340,150),xy(290,150),xy(289,100),xy(240,100),xy(240,169),xy(230,170),xy(230,150),xy(220,149),xy(220,110),xy(210,109),xy(210,50),xy(339,50),xy(340,100),xy(439,100),xy(440,149),xy(390,150),xy(390,199),xy(440,200),xy(439,270)]).
midline(r3, [xy(343,125),xy(326,123),xy(318,119),xy(313,86),xy(306,77),xy(289,74),xy(235,75),xy(224,95),xy(229,104),xy(229,140),xy(234,146),xy(235,165)]).
midline(r3, [xy(344,125),xy(353,126),xy(365,131),xy(365,224),xy(360,224),xy(356,220),xy(349,218),xy(333,205),xy(300,204),xy(295,205),xy(295,225)]).
midline(r3, [xy(366,130),xy(380,125),xy(415,125)]).
midline(r3, [xy(359,225),xy(356,222)]).
midline(r3, [xy(362,225),xy(343,245),xy(314,245)]).
midline(r3, [xy(350,219),xy(351,220)]).
midline(r3, [xy(366,225),xy(394,234),xy(395,236),xy(392,239),xy(394,239)]).
midline(r3, [xy(396,234),xy(405,235)]).
fillpoint(r3, xy(365,224), 35.4).
fillpoint(r3, xy(405,234), 35.0).
fillpoint(r3, xy(372,227), 33.1).
fillpoint(r3, xy(387,232), 33.1).
fillpoint(r3, xy(375,228), 32.6).
fillpoint(r3, xy(384,231), 32.6).
fillpoint(r3, xy(378,229), 32.3).
fillpoint(r3, xy(381,230), 32.3).
fillpoint(r3, xy(365,131), 31.4).
fillpoint(r3, xy(310,79), 29.7).
fillpoint(r3, xy(319,120), 29.7).
fillpoint(r3, xy(308,78), 29.0).
fillpoint(r3, xy(311,81), 29.0).
fillpoint(r3, xy(318,118), 29.0).
fillpoint(r3, xy(321,121), 29.0).
fillpoint(r3, xy(358,128), 29.0).
fillpoint(r3, xy(371,128), 29.0).
fillpoint(r3, xy(305,77), 28.0).
fillpoint(r3, xy(312,84), 28.0).
fillpoint(r3, xy(317,115), 28.0).
fillpoint(r3, xy(324,122), 28.0).
fillpoint(r3, xy(355,127), 28.0).
fillpoint(r3, xy(374,127), 28.0).
fillpoint(r3, xy(302,76), 27.0).
fillpoint(r3, xy(313,87), 27.0).
fillpoint(r3, xy(316,112), 27.0).
fillpoint(r3, xy(327,123), 27.0).
fillpoint(r3, xy(352,126), 27.0).
fillpoint(r3, xy(377,126), 27.0).
fillpoint(r3, xy(298,75), 26.0).
fillpoint(r3, xy(314,92), 26.0).
fillpoint(r3, xy(315,108), 26.0).
fillpoint(r3, xy(332,124), 26.0).
fillpoint(r3, xy(348,125), 26.0).
fillpoint(r3, xy(382,125), 26.0).
fillpoint(r3, xy(235,75), 25.5).
fillpoint(r3, xy(241,75), 25.0).
fillpoint(r3, xy(391,125), 25.0).
fillpoint(r3, xy(364,175), 25.0).
fillpoint(r3, xy(225,94), 16.0).
fillpoint(r3, xy(229,105), 11.0).
fillpoint(r3, xy(229,126), 10.0).
region(r5, '#2ecc40', 15400, centroid(535,140)).
perimeter(r5, 840).
polygon(r5, [xy(509,250),xy(490,249),xy(490,50),xy(589,50),xy(590,169),xy(580,170),xy(580,179),xy(570,180),xy(570,199),xy(560,200),xy(560,209),xy(550,210),xy(550,219),xy(540,220),xy(539,230),xy(520,230),xy(520,239),xy(510,240),xy(509,250)]).
hole(r5, [xy(530,89),xy(529,60),xy(500,60),xy(500,90),xy(530,89)]).
hole(r5, [xy(570,139),xy(570,130),xy(579,130),xy(580,120),xy(570,120),xy(569,110),xy(560,110),xy(560,119),xy(550,120),xy(550,129),xy(559,130),xy(560,140),xy(570,139)]).
midline(r5, [xy(577,149),xy(573,155),xy(561,161),xy(531,168),xy(521,144),xy(519,119),xy(495,93),xy(495,55),xy(529,54),xy(535,56),xy(560,80),xy(542,103),xy(520,119)]).
midline(r5, [xy(577,148),xy(579,139),xy(585,129),xy(584,116),xy(579,110),xy(579,104),xy(575,96),xy(561,81)]).
midline(r5, [xy(530,169),xy(528,179),xy(518,202),xy(507,217),xy(500,234),xy(500,240)]).
fillpoint(r5, xy(530,169), 41.0).
fillpoint(r5, xy(521,143), 32.0).
fillpoint(r5, xy(520,138), 31.0).
fillpoint(r5, xy(559,80), 30.0).
fillpoint(r5, xy(519,124), 30.0).
fillpoint(r5, xy(518,201), 29.0).
fillpoint(r5, xy(543,102), 18.8).
fillpoint(r5, xy(542,103), 18.8).
fillpoint(r5, xy(545,99), 18.6).
fillpoint(r5, xy(544,100), 18.6).
fillpoint(r5, xy(540,104), 18.6).
fillpoint(r5, xy(539,105), 18.6).
fillpoint(r5, xy(570,156), 17.0).
fillpoint(r5, xy(573,155), 16.5).
fillpoint(r5, xy(505,224), 16.0).
fillpoint(r5, xy(579,105), 11.0).
fillpoint(r5, xy(579,144), 11.0).
fillpoint(r5, xy(500,235), 11.0).
region(r18, '#5a5a5a', 8400, centroid(340,620)).
perimeter(r18, 880).
polygon(r18, [xy(549,630),xy(130,630),xy(130,610),xy(549,610),xy(549,630)]).
midline(r18, [xy(345,620),xy(139,620)]).
midline(r18, [xy(346,620),xy(540,620)]).
fillpoint(r18, xy(139,620), 10.0).
region(r9, '#ffdc00', 7900, centroid(282,161)).
perimeter(r9, 460).
polygon(r9, [xy(289,230),xy(280,230),xy(280,220),xy(270,219),xy(270,210),xy(260,209),xy(259,200),xy(250,199),xy(250,180),xy(240,179),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,230)]).
midline(r9, [xy(274,187),xy(275,183),xy(273,180),xy(277,174),xy(265,159),xy(262,159),xy(262,161)]).
midline(r9, [xy(265,158),xy(265,124)]).
midline(r9, [xy(274,188),xy(274,195),xy(279,204),xy(279,210),xy(284,216),xy(285,225)]).
midline(r9, [xy(278,174),xy(315,175)]).
fillpoint(r9, xy(277,175), 28.2).
fillpoint(r9, xy(266,160), 26.2).
fillpoint(r9, xy(265,158), 26.0).
fillpoint(r9, xy(269,164), 25.6).
fillpoint(r9, xy(270,165), 25.6).
fillpoint(r9, xy(265,136), 25.0).
fillpoint(r9, xy(291,175), 25.0).
fillpoint(r9, xy(279,205), 11.0).
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
region(r7, '#870c25', 1500, centroid(414,84)).
perimeter(r7, 160).
polygon(r7, [xy(439,100),xy(390,100),xy(390,70),xy(439,70),xy(439,100)]).
midline(r7, [xy(412,85),xy(404,85)]).
midline(r7, [xy(413,85),xy(425,85)]).
fillpoint(r7, xy(404,85), 15.0).
region(r4, '#bebebe', 1000, centroid(414,60)).
perimeter(r4, 140).
polygon(r4, [xy(439,70),xy(390,70),xy(390,50),xy(439,50),xy(439,70)]).
midline(r4, [xy(409,60),xy(399,60)]).
midline(r4, [xy(410,59),xy(430,60)]).
fillpoint(r4, xy(399,60), 10.0).
region(r6, '#5a5a5a', 800, centroid(514,74)).
perimeter(r6, 160).
polygon(r6, [xy(529,90),xy(500,89),xy(500,60),xy(530,60),xy(529,90)]).
hole(r6, [xy(520,79),xy(519,70),xy(510,70),xy(510,80),xy(520,79)]).
midline(r6, [xy(519,64),xy(505,65),xy(505,84),xy(518,85),xy(524,83),xy(524,66),xy(520,65)]).
fillpoint(r6, xy(506,65), 6.0).
fillpoint(r6, xy(524,65), 6.0).
fillpoint(r6, xy(505,84), 6.0).
fillpoint(r6, xy(523,84), 6.0).
fillpoint(r6, xy(511,65), 5.0).
fillpoint(r6, xy(504,75), 5.0).
fillpoint(r6, xy(524,75), 5.0).
fillpoint(r6, xy(511,85), 5.0).
region(r14, '#5a5a5a', 800, centroid(314,224)).
perimeter(r14, 160).
polygon(r14, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r14, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r14, [xy(324,232),xy(325,220),xy(323,215),xy(305,215),xy(304,220),xy(305,234),xy(324,234)]).
fillpoint(r14, xy(306,215), 6.0).
fillpoint(r14, xy(324,215), 6.0).
fillpoint(r14, xy(305,234), 6.0).
fillpoint(r14, xy(323,234), 6.0).
fillpoint(r14, xy(311,215), 5.0).
fillpoint(r14, xy(304,225), 5.0).
fillpoint(r14, xy(324,225), 5.0).
fillpoint(r14, xy(311,235), 5.0).
region(r13, '#0074d9', 500, centroid(414,194)).
perimeter(r13, 120).
polygon(r13, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r13, [xy(409,194),xy(394,195)]).
midline(r13, [xy(410,194),xy(435,195)]).
fillpoint(r13, xy(394,195), 5.0).
region(r17, '#7fdbff', 400, centroid(40,600)).
perimeter(r17, 80).
polygon(r17, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r17, [xy(39,599),xy(40,600)]).
fillpoint(r17, xy(39,600), 10.0).
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
region(r8, '#2ecc40', 100, centroid(514,74)).
perimeter(r8, 40).
polygon(r8, [xy(519,80),xy(510,79),xy(510,70),xy(520,70),xy(519,80)]).
midline(r8, [xy(515,75),xy(515,74)]).
fillpoint(r8, xy(514,75), 5.0).
region(r15, '#2ecc40', 100, centroid(314,224)).
perimeter(r15, 40).
polygon(r15, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r15, [xy(315,225),xy(315,224)]).
fillpoint(r15, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 310).
adjacent(r1, r3).
shared_edge(r1, r3, 320).
adjacent(r1, r5).
shared_edge(r1, r5, 200).
adjacent(r1, r9).
shared_edge(r1, r9, 110).
adjacent(r1, r14).
shared_edge(r1, r14, 20).
adjacent(r1, r16).
shared_edge(r1, r16, 240).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 880).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 440).
adjacent(r2, r4).
shared_edge(r2, r4, 90).
adjacent(r2, r5).
shared_edge(r2, r5, 400).
adjacent(r2, r7).
shared_edge(r2, r7, 60).
adjacent(r2, r13).
shared_edge(r2, r13, 60).
adjacent(r3, r7).
shared_edge(r3, r7, 50).
adjacent(r3, r9).
shared_edge(r3, r9, 350).
adjacent(r3, r13).
shared_edge(r3, r13, 60).
adjacent(r3, r14).
shared_edge(r3, r14, 100).
adjacent(r4, r7).
shared_edge(r4, r7, 50).
adjacent(r5, r6).
shared_edge(r5, r6, 120).
adjacent(r6, r8).
shared_edge(r6, r8, 40).
adjacent(r14, r15).
shared_edge(r14, r15, 40).

encloses(r6, r8).
encloses(r14, r15).
encloses(r1, r16).
encloses(r1, r17).
encloses(r1, r18).
encloses(r1, r19).
encloses(r1, r20).
