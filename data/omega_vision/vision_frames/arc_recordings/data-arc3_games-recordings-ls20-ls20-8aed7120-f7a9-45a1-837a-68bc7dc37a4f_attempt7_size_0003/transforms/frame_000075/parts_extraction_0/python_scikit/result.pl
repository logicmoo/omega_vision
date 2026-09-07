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

region(r1, '#aaaaaa', 275600, centroid(302,370)).
perimeter(r1, 5060).
polygon(r1, [xy(250,0),xy(249,10),xy(230,10),xy(230,19),xy(220,20),xy(220,29),xy(210,30),xy(209,40),xy(200,40),xy(200,59),xy(190,60),xy(190,69),xy(180,70),xy(180,89),xy(170,90),xy(170,129),xy(160,130),xy(160,209),xy(170,210),xy(170,249),xy(180,250),xy(180,269),xy(189,270),xy(190,279),xy(200,280),xy(200,299),xy(209,300),xy(210,309),xy(219,310),xy(220,320),xy(230,320),xy(230,330),xy(249,330),xy(250,339),xy(259,340),xy(260,350),xy(279,350),xy(280,360),xy(319,360),xy(320,370),xy(399,370),xy(400,360),xy(439,360),xy(440,350),xy(459,350),xy(460,340),xy(470,339),xy(470,330),xy(489,330),xy(490,320),xy(499,320),xy(500,310),xy(509,310),xy(510,300),xy(520,299),xy(520,280),xy(529,280),xy(530,270),xy(540,269),xy(540,250),xy(550,249),xy(550,210),xy(560,209),xy(560,130),xy(550,129),xy(550,90),xy(540,89),xy(540,70),xy(530,70),xy(530,60),xy(520,59),xy(520,40),xy(510,40),xy(510,30),xy(500,30),xy(499,20),xy(490,19),xy(489,10),xy(470,10),xy(470,0)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(84,84),xy(85,90),xy(81,105),xy(79,130),xy(79,209),xy(81,234),xy(86,252),xy(86,275),xy(96,319),xy(104,340),xy(109,362),xy(136,430),xy(112,444),xy(81,468),xy(30,519),xy(17,537),xy(14,551),xy(14,569),xy(17,579),xy(15,583),xy(14,608),xy(17,622),xy(30,625),xy(49,625),xy(60,621),xy(59,599),xy(39,579),xy(18,579)]).
midline(r1, [xy(87,251),xy(90,248),xy(95,248),xy(87,258)]).
midline(r1, [xy(60,623),xy(73,625),xy(96,624),xy(109,617),xy(110,602),xy(117,585),xy(148,549),xy(171,509),xy(185,479),xy(188,470),xy(137,430)]).
midline(r1, [xy(89,256),xy(100,246),xy(107,246),xy(114,241),xy(114,243)]).
midline(r1, [xy(109,619),xy(124,633),xy(131,635),xy(553,634),xy(555,627),xy(555,526),xy(506,476),xy(488,480),xy(435,427),xy(426,400),xy(428,400)]).
midline(r1, [xy(556,526),xy(586,556),xy(584,559),xy(585,631),xy(583,634),xy(577,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(506,475),xy(526,440),xy(458,371),xy(527,439)]).
midline(r1, [xy(436,430),xy(438,432),xy(437,436),xy(482,479),xy(477,482),xy(448,484),xy(420,489),xy(320,490),xy(242,482),xy(189,470)]).
midline(r1, [xy(482,481),xy(485,479),xy(439,433)]).
midline(r1, [xy(528,437),xy(550,396),xy(575,333),xy(577,317),xy(586,297),xy(594,262),xy(595,242),xy(590,237),xy(592,241)]).
midline(r1, [xy(595,240),xy(600,209),xy(599,118),xy(594,101),xy(572,110),xy(570,109),xy(571,111)]).
midline(r1, [xy(595,100),xy(594,77),xy(588,52),xy(551,32),xy(542,41),xy(549,34)]).
midline(r1, [xy(549,31),xy(539,24),xy(505,10),xy(499,10),xy(493,5),xy(474,5)]).
midline(r1, [xy(149,548),xy(152,545)]).
midline(r1, [xy(241,480),xy(281,440),xy(282,436),xy(279,433),xy(234,478),xy(279,435)]).
midline(r1, [xy(282,434),xy(280,432),xy(285,422),xy(281,419),xy(289,409),xy(290,403),xy(292,403)]).
midline(r1, [xy(283,419),xy(286,421)]).
midline(r1, [xy(286,418),xy(285,415),xy(287,415)]).
midline(r1, [xy(283,431),xy(282,432)]).
midline(r1, [xy(432,410),xy(431,409)]).
midline(r1, [xy(587,557),xy(615,586),xy(615,632),xy(607,635),xy(585,633)]).
midline(r1, [xy(288,413),xy(288,412)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(86,84),xy(110,64),xy(141,45),xy(154,39),xy(159,39)]).
midline(r1, [xy(160,37),xy(170,32)]).
midline(r1, [xy(171,30),xy(180,24),xy(214,10),xy(220,10),xy(226,5),xy(245,5)]).
midline(r1, [xy(125,241),xy(120,239),xy(117,242)]).
midline(r1, [xy(122,242),xy(120,241)]).
midline(r1, [xy(122,239),xy(129,237),xy(126,240)]).
midline(r1, [xy(125,97),xy(115,98),xy(94,79),xy(104,92),xy(111,97)]).
midline(r1, [xy(123,98),xy(120,100)]).
midline(r1, [xy(123,100),xy(136,104),xy(132,99),xy(126,98)]).
midline(r1, [xy(137,101),xy(140,104),xy(137,105)]).
midline(r1, [xy(139,107),xy(141,105),xy(144,107),xy(141,107)]).
midline(r1, [xy(146,110),xy(147,111)]).
fillpoint(r1, xy(187,469), 140.5).
fillpoint(r1, xy(184,467), 140.1).
fillpoint(r1, xy(189,470), 140.0).
fillpoint(r1, xy(179,463), 139.8).
fillpoint(r1, xy(193,471), 139.0).
fillpoint(r1, xy(197,472), 138.0).
fillpoint(r1, xy(165,451), 137.9).
fillpoint(r1, xy(138,431), 137.4).
fillpoint(r1, xy(161,448), 137.4).
fillpoint(r1, xy(142,434), 137.0).
fillpoint(r1, xy(157,445), 137.0).
fillpoint(r1, xy(201,473), 137.0).
fillpoint(r1, xy(146,437), 136.7).
fillpoint(r1, xy(153,442), 136.7).
fillpoint(r1, xy(149,439), 136.6).
fillpoint(r1, xy(150,440), 136.6).
fillpoint(r1, xy(206,474), 136.0).
fillpoint(r1, xy(214,476), 134.0).
fillpoint(r1, xy(506,476), 134.0).
fillpoint(r1, xy(218,477), 133.0).
fillpoint(r1, xy(501,477), 133.0).
fillpoint(r1, xy(222,478), 132.0).
fillpoint(r1, xy(497,478), 132.0).
fillpoint(r1, xy(227,479), 131.0).
fillpoint(r1, xy(492,479), 131.0).
fillpoint(r1, xy(232,480), 130.0).
fillpoint(r1, xy(488,480), 130.0).
fillpoint(r1, xy(238,481), 129.0).
fillpoint(r1, xy(482,481), 129.0).
fillpoint(r1, xy(244,482), 128.0).
fillpoint(r1, xy(476,482), 128.0).
fillpoint(r1, xy(251,483), 127.0).
fillpoint(r1, xy(468,483), 127.0).
fillpoint(r1, xy(262,484), 126.0).
fillpoint(r1, xy(458,484), 126.0).
fillpoint(r1, xy(273,485), 125.0).
fillpoint(r1, xy(446,485), 125.0).
fillpoint(r1, xy(278,486), 124.0).
fillpoint(r1, xy(441,486), 124.0).
fillpoint(r1, xy(285,487), 123.0).
fillpoint(r1, xy(435,487), 123.0).
fillpoint(r1, xy(292,488), 122.0).
fillpoint(r1, xy(427,488), 122.0).
fillpoint(r1, xy(302,489), 121.0).
fillpoint(r1, xy(417,489), 121.0).
fillpoint(r1, xy(321,490), 120.0).
fillpoint(r1, xy(115,378), 116.0).
fillpoint(r1, xy(112,370), 113.0).
fillpoint(r1, xy(111,367), 112.0).
fillpoint(r1, xy(110,364), 111.0).
fillpoint(r1, xy(109,361), 110.0).
fillpoint(r1, xy(108,358), 109.0).
fillpoint(r1, xy(107,354), 108.0).
fillpoint(r1, xy(104,342), 105.0).
fillpoint(r1, xy(99,328), 100.0).
fillpoint(r1, xy(96,318), 97.0).
fillpoint(r1, xy(95,314), 96.0).
fillpoint(r1, xy(94,310), 95.0).
fillpoint(r1, xy(93,305), 94.0).
fillpoint(r1, xy(92,300), 93.0).
fillpoint(r1, xy(90,293), 91.0).
fillpoint(r1, xy(89,289), 90.0).
fillpoint(r1, xy(88,284), 89.0).
fillpoint(r1, xy(87,279), 88.0).
fillpoint(r1, xy(86,273), 87.0).
fillpoint(r1, xy(553,388), 87.0).
fillpoint(r1, xy(85,265), 86.0).
fillpoint(r1, xy(85,85), 85.1).
fillpoint(r1, xy(84,91), 85.0).
fillpoint(r1, xy(84,248), 85.0).
fillpoint(r1, xy(83,96), 84.0).
fillpoint(r1, xy(83,243), 84.0).
fillpoint(r1, xy(82,101), 83.0).
fillpoint(r1, xy(82,238), 83.0).
fillpoint(r1, xy(81,107), 82.0).
fillpoint(r1, xy(81,232), 82.0).
fillpoint(r1, xy(80,116), 81.0).
fillpoint(r1, xy(80,224), 81.0).
fillpoint(r1, xy(79,170), 80.0).
fillpoint(r1, xy(575,332), 65.0).
fillpoint(r1, xy(577,324), 63.0).
fillpoint(r1, xy(578,319), 62.0).
fillpoint(r1, xy(582,308), 58.0).
fillpoint(r1, xy(586,296), 54.0).
fillpoint(r1, xy(587,292), 53.0).
fillpoint(r1, xy(588,52), 52.0).
fillpoint(r1, xy(588,288), 52.0).
fillpoint(r1, xy(589,58), 51.0).
fillpoint(r1, xy(589,282), 51.0).
fillpoint(r1, xy(590,61), 50.0).
fillpoint(r1, xy(590,278), 50.0).
fillpoint(r1, xy(592,68), 48.0).
fillpoint(r1, xy(592,271), 48.0).
fillpoint(r1, xy(593,73), 47.0).
fillpoint(r1, xy(593,266), 47.0).
fillpoint(r1, xy(594,79), 46.0).
fillpoint(r1, xy(594,260), 46.0).
fillpoint(r1, xy(594,97), 45.0).
fillpoint(r1, xy(594,243), 45.0).
fillpoint(r1, xy(596,106), 44.0).
fillpoint(r1, xy(596,233), 44.0).
fillpoint(r1, xy(598,114), 42.0).
fillpoint(r1, xy(598,225), 42.0).
fillpoint(r1, xy(599,120), 41.0).
fillpoint(r1, xy(599,219), 41.0).
fillpoint(r1, xy(599,170), 40.0).
border(r1).
region(r2, '#ffdc00', 32300, centroid(409,110)).
perimeter(r2, 1540).
polygon(r2, [xy(470,0),xy(470,10),xy(489,10),xy(490,19),xy(499,20),xy(500,29),xy(509,30),xy(510,40),xy(520,40),xy(520,49),xy(490,50),xy(490,329),xy(470,330),xy(470,339),xy(460,340),xy(459,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,150),xy(440,149),xy(440,50),xy(390,50),xy(390,99),xy(340,100),xy(339,50),xy(200,49),xy(200,40),xy(209,40),xy(210,30),xy(219,30),xy(220,20),xy(230,19),xy(230,10),xy(249,10),xy(250,0)]).
midline(r2, [xy(312,25),xy(272,25),xy(270,23),xy(264,27),xy(247,29),xy(225,39),xy(219,39),xy(213,44),xy(204,45)]).
midline(r2, [xy(313,25),xy(348,25),xy(365,31),xy(365,75)]).
midline(r2, [xy(366,30),xy(376,26),xy(392,24),xy(448,25),xy(464,38),xy(470,34),xy(485,34),xy(494,39),xy(500,39),xy(506,44),xy(515,45)]).
midline(r2, [xy(465,39),xy(465,148),xy(462,166),xy(460,169),xy(455,170),xy(409,170)]).
midline(r2, [xy(461,170),xy(465,191),xy(465,276),xy(463,279),xy(465,279)]).
midline(r2, [xy(465,281),xy(469,292),xy(470,310),xy(460,324),xy(460,330),xy(454,340),xy(455,345)]).
fillpoint(r2, xy(365,31), 31.4).
fillpoint(r2, xy(358,28), 29.0).
fillpoint(r2, xy(371,28), 29.0).
fillpoint(r2, xy(460,170), 29.0).
fillpoint(r2, xy(465,37), 28.2).
fillpoint(r2, xy(355,27), 28.0).
fillpoint(r2, xy(374,27), 28.0).
fillpoint(r2, xy(462,165), 28.0).
fillpoint(r2, xy(462,174), 28.0).
fillpoint(r2, xy(352,26), 27.0).
fillpoint(r2, xy(377,26), 27.0).
fillpoint(r2, xy(463,162), 27.0).
fillpoint(r2, xy(463,177), 27.0).
fillpoint(r2, xy(450,26), 26.2).
fillpoint(r2, xy(348,25), 26.0).
fillpoint(r2, xy(382,25), 26.0).
fillpoint(r2, xy(448,25), 26.0).
fillpoint(r2, xy(464,158), 26.0).
fillpoint(r2, xy(464,182), 26.0).
fillpoint(r2, xy(454,29), 25.6).
fillpoint(r2, xy(455,30), 25.6).
fillpoint(r2, xy(269,25), 25.0).
fillpoint(r2, xy(391,25), 25.0).
fillpoint(r2, xy(365,63), 25.0).
fillpoint(r2, xy(464,100), 25.0).
fillpoint(r2, xy(464,236), 25.0).
fillpoint(r2, xy(256,29), 21.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(246,30), 20.0).
fillpoint(r2, xy(409,170), 20.0).
fillpoint(r2, xy(469,306), 20.0).
fillpoint(r2, xy(235,34), 16.0).
fillpoint(r2, xy(224,39), 11.0).
fillpoint(r2, xy(495,39), 11.0).
fillpoint(r2, xy(460,325), 11.0).
border(r2).
region(r14, '#2ecc40', 27900, centroid(343,280)).
perimeter(r14, 1020).
polygon(r14, [xy(399,370),xy(390,369),xy(389,350),xy(340,350),xy(339,370),xy(320,370),xy(319,360),xy(290,360),xy(289,300),xy(200,300),xy(200,280),xy(190,280),xy(190,270),xy(180,269),xy(180,250),xy(289,250),xy(290,200),xy(439,200),xy(440,359),xy(400,360),xy(399,370)]).
hole(r14, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r14, [xy(329,283),xy(314,274),xy(224,275),xy(212,267),xy(195,260),xy(189,260)]).
midline(r14, [xy(316,274),xy(295,243),xy(295,205),xy(327,204),xy(335,206),xy(378,248),xy(383,255),xy(383,259),xy(378,278),xy(373,286),xy(345,294),xy(330,283)]).
midline(r14, [xy(345,295),xy(327,314),xy(317,332),xy(327,349),xy(330,360)]).
midline(r14, [xy(375,285),xy(398,309),xy(411,330),xy(407,341),xy(395,356),xy(395,365)]).
fillpoint(r14, xy(375,285), 65.0).
fillpoint(r14, xy(378,277), 62.0).
fillpoint(r14, xy(367,288), 62.0).
fillpoint(r14, xy(379,274), 61.0).
fillpoint(r14, xy(364,289), 61.0).
fillpoint(r14, xy(380,271), 60.0).
fillpoint(r14, xy(361,290), 60.0).
fillpoint(r14, xy(381,267), 59.0).
fillpoint(r14, xy(357,291), 59.0).
fillpoint(r14, xy(382,263), 58.0).
fillpoint(r14, xy(353,292), 58.0).
fillpoint(r14, xy(383,258), 57.0).
fillpoint(r14, xy(348,293), 57.0).
fillpoint(r14, xy(318,331), 29.0).
fillpoint(r14, xy(411,331), 29.0).
fillpoint(r14, xy(224,275), 25.0).
region(r3, '#2ecc40', 24600, centroid(284,114)).
perimeter(r3, 1180).
polygon(r3, [xy(239,200),xy(160,199),xy(160,130),xy(170,129),xy(170,90),xy(180,89),xy(180,70),xy(189,70),xy(190,60),xy(200,59),xy(200,50),xy(339,50),xy(340,100),xy(389,100),xy(390,50),xy(440,50),xy(439,150),xy(290,150),xy(290,100),xy(240,100),xy(239,200)]).
hole(r3, [xy(430,89),xy(429,60),xy(400,60),xy(400,90),xy(430,89)]).
midline(r3, [xy(331,124),xy(320,121),xy(317,116),xy(311,80),xy(303,76),xy(289,74),xy(240,74),xy(221,77),xy(214,84),xy(208,95),xy(209,99),xy(205,114),xy(201,114),xy(205,116)]).
midline(r3, [xy(205,118),xy(204,140),xy(200,155),xy(198,156),xy(188,151),xy(188,153)]).
midline(r3, [xy(200,157),xy(200,160)]).
midline(r3, [xy(332,124),xy(387,125),xy(410,120),xy(412,117),xy(396,95),xy(394,88),xy(394,60),xy(395,55),xy(400,54),xy(434,55),xy(434,93),xy(413,116)]).
fillpoint(r3, xy(199,158), 40.0).
fillpoint(r3, xy(202,148), 38.0).
fillpoint(r3, xy(203,144), 37.0).
fillpoint(r3, xy(204,139), 36.0).
fillpoint(r3, xy(204,121), 35.0).
fillpoint(r3, xy(208,103), 32.0).
fillpoint(r3, xy(209,98), 31.1).
fillpoint(r3, xy(210,92), 31.0).
fillpoint(r3, xy(211,90), 30.4).
fillpoint(r3, xy(213,87), 30.0).
fillpoint(r3, xy(310,79), 29.7).
fillpoint(r3, xy(215,84), 29.7).
fillpoint(r3, xy(214,85), 29.7).
fillpoint(r3, xy(319,120), 29.7).
fillpoint(r3, xy(410,120), 29.7).
fillpoint(r3, xy(221,78), 29.0).
fillpoint(r3, xy(308,78), 29.0).
fillpoint(r3, xy(220,79), 29.0).
fillpoint(r3, xy(311,81), 29.0).
fillpoint(r3, xy(318,118), 29.0).
fillpoint(r3, xy(411,118), 29.0).
fillpoint(r3, xy(321,121), 29.0).
fillpoint(r3, xy(408,121), 29.0).
fillpoint(r3, xy(224,77), 28.0).
fillpoint(r3, xy(305,77), 28.0).
fillpoint(r3, xy(312,84), 28.0).
fillpoint(r3, xy(317,115), 28.0).
fillpoint(r3, xy(324,122), 28.0).
fillpoint(r3, xy(405,122), 28.0).
fillpoint(r3, xy(227,76), 27.0).
fillpoint(r3, xy(302,76), 27.0).
fillpoint(r3, xy(313,87), 27.0).
fillpoint(r3, xy(316,112), 27.0).
fillpoint(r3, xy(327,123), 27.0).
fillpoint(r3, xy(402,123), 27.0).
fillpoint(r3, xy(232,75), 26.0).
fillpoint(r3, xy(298,75), 26.0).
fillpoint(r3, xy(314,92), 26.0).
fillpoint(r3, xy(315,108), 26.0).
fillpoint(r3, xy(332,124), 26.0).
fillpoint(r3, xy(398,124), 26.0).
fillpoint(r3, xy(241,75), 25.0).
fillpoint(r3, xy(341,125), 25.0).
region(r9, '#ffdc00', 13600, centroid(258,188)).
perimeter(r9, 660).
polygon(r9, [xy(289,250),xy(170,249),xy(170,210),xy(160,209),xy(160,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r9, [xy(264,142),xy(265,124)]).
midline(r9, [xy(265,143),xy(265,159),xy(271,175),xy(265,190),xy(263,213),xy(258,221),xy(239,225),xy(196,225),xy(175,206),xy(164,205)]).
midline(r9, [xy(272,175),xy(315,175)]).
fillpoint(r9, xy(271,175), 31.4).
fillpoint(r9, xy(260,220), 29.7).
fillpoint(r9, xy(268,168), 29.0).
fillpoint(r9, xy(268,181), 29.0).
fillpoint(r9, xy(261,218), 29.0).
fillpoint(r9, xy(258,221), 29.0).
fillpoint(r9, xy(267,165), 28.0).
fillpoint(r9, xy(267,184), 28.0).
fillpoint(r9, xy(262,215), 28.0).
fillpoint(r9, xy(255,222), 28.0).
fillpoint(r9, xy(266,162), 27.0).
fillpoint(r9, xy(266,187), 27.0).
fillpoint(r9, xy(263,212), 27.0).
fillpoint(r9, xy(252,223), 27.0).
fillpoint(r9, xy(265,158), 26.0).
fillpoint(r9, xy(265,192), 26.0).
fillpoint(r9, xy(264,208), 26.0).
fillpoint(r9, xy(248,224), 26.0).
fillpoint(r9, xy(265,136), 25.0).
fillpoint(r9, xy(291,175), 25.0).
fillpoint(r9, xy(194,225), 25.0).
region(r4, '#2ecc40', 13400, centroid(519,182)).
perimeter(r4, 780).
polygon(r4, [xy(499,320),xy(490,319),xy(490,50),xy(519,50),xy(519,60),xy(500,60),xy(500,89),xy(529,90),xy(530,70),xy(539,70),xy(540,89),xy(550,90),xy(550,129),xy(560,130),xy(560,169),xy(550,170),xy(550,179),xy(560,180),xy(560,209),xy(550,210),xy(550,249),xy(540,250),xy(540,269),xy(530,270),xy(530,279),xy(520,280),xy(520,299),xy(510,300),xy(510,309),xy(500,310),xy(499,320)]).
midline(r4, [xy(521,159),xy(519,170),xy(522,194),xy(519,213),xy(520,227),xy(515,241),xy(516,248),xy(505,273),xy(505,285),xy(500,294),xy(500,300),xy(495,306),xy(495,315)]).
midline(r4, [xy(523,195),xy(545,195)]).
midline(r4, [xy(521,158),xy(524,149),xy(520,139),xy(520,121),xy(496,95),xy(494,89),xy(495,55),xy(515,55)]).
midline(r4, [xy(520,119),xy(535,104),xy(535,74)]).
midline(r4, [xy(516,250),xy(517,251)]).
fillpoint(r4, xy(523,150), 33.6).
fillpoint(r4, xy(521,143), 32.0).
fillpoint(r4, xy(521,156), 32.0).
fillpoint(r4, xy(521,195), 32.0).
fillpoint(r4, xy(520,138), 31.0).
fillpoint(r4, xy(520,162), 31.0).
fillpoint(r4, xy(520,188), 31.0).
fillpoint(r4, xy(520,202), 31.0).
fillpoint(r4, xy(519,124), 30.0).
fillpoint(r4, xy(519,175), 30.0).
fillpoint(r4, xy(520,219), 30.0).
fillpoint(r4, xy(518,231), 29.0).
fillpoint(r4, xy(517,234), 28.0).
fillpoint(r4, xy(516,237), 27.0).
fillpoint(r4, xy(515,242), 26.0).
fillpoint(r4, xy(505,274), 16.0).
fillpoint(r4, xy(505,283), 15.0).
fillpoint(r4, xy(500,295), 11.0).
region(r23, '#2ecc40', 6400, centroid(290,620)).
perimeter(r23, 680).
polygon(r23, [xy(449,630),xy(130,630),xy(130,610),xy(449,610),xy(449,630)]).
midline(r23, [xy(356,620),xy(139,620)]).
midline(r23, [xy(357,619),xy(440,620)]).
fillpoint(r23, xy(139,620), 10.0).
region(r17, '#ffdc00', 2900, centroid(259,321)).
perimeter(r17, 280).
polygon(r17, [xy(289,360),xy(280,360),xy(279,350),xy(260,350),xy(260,340),xy(250,340),xy(249,330),xy(230,330),xy(230,320),xy(220,320),xy(220,310),xy(210,309),xy(210,300),xy(289,300),xy(289,360)]).
midline(r17, [xy(269,320),xy(256,315),xy(244,315),xy(235,310),xy(229,310),xy(223,305),xy(214,305)]).
midline(r17, [xy(269,322),xy(274,335),xy(284,346),xy(285,355)]).
fillpoint(r17, xy(268,321), 21.0).
fillpoint(r17, xy(255,315), 16.0).
fillpoint(r17, xy(274,334), 16.0).
fillpoint(r17, xy(248,314), 15.0).
fillpoint(r17, xy(234,310), 11.0).
region(r21, '#7fdbff', 2000, centroid(64,576)).
perimeter(r21, 240).
polygon(r21, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r21, [xy(51,560),xy(39,560)]).
midline(r21, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r21, xy(58,561), 12.0).
fillpoint(r21, xy(61,578), 12.0).
fillpoint(r21, xy(78,581), 12.0).
fillpoint(r21, xy(54,560), 11.0).
fillpoint(r21, xy(59,565), 11.0).
fillpoint(r21, xy(60,574), 11.0).
fillpoint(r21, xy(65,579), 11.0).
fillpoint(r21, xy(74,580), 11.0).
fillpoint(r21, xy(79,585), 11.0).
fillpoint(r21, xy(39,560), 10.0).
fillpoint(r21, xy(79,596), 10.0).
region(r24, '#5a5a5a', 2000, centroid(500,620)).
perimeter(r24, 240).
polygon(r24, [xy(549,630),xy(450,630),xy(450,610),xy(549,610),xy(549,630)]).
midline(r24, [xy(471,620),xy(459,620)]).
midline(r24, [xy(472,620),xy(540,620)]).
fillpoint(r24, xy(459,620), 10.0).
region(r11, '#870c25', 1500, centroid(364,184)).
perimeter(r11, 160).
polygon(r11, [xy(389,200),xy(340,200),xy(340,170),xy(389,170),xy(389,200)]).
midline(r11, [xy(366,184),xy(354,185)]).
midline(r11, [xy(367,185),xy(375,185)]).
fillpoint(r11, xy(354,185), 15.0).
region(r10, '#bebebe', 1000, centroid(364,160)).
perimeter(r10, 140).
polygon(r10, [xy(389,170),xy(340,170),xy(340,150),xy(389,150),xy(389,170)]).
midline(r10, [xy(370,160),xy(349,160)]).
midline(r10, [xy(371,159),xy(380,160)]).
fillpoint(r10, xy(349,160), 10.0).
region(r5, '#5a5a5a', 800, centroid(414,74)).
perimeter(r5, 160).
polygon(r5, [xy(429,90),xy(400,89),xy(400,60),xy(430,60),xy(429,90)]).
hole(r5, [xy(420,79),xy(419,70),xy(410,70),xy(410,80),xy(420,79)]).
midline(r5, [xy(419,64),xy(405,65),xy(405,84),xy(419,85),xy(424,83),xy(424,66),xy(420,65)]).
fillpoint(r5, xy(406,65), 6.0).
fillpoint(r5, xy(424,65), 6.0).
fillpoint(r5, xy(405,84), 6.0).
fillpoint(r5, xy(423,84), 6.0).
fillpoint(r5, xy(411,65), 5.0).
fillpoint(r5, xy(404,75), 5.0).
fillpoint(r5, xy(424,75), 5.0).
fillpoint(r5, xy(411,85), 5.0).
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
midline(r15, [xy(305,227),xy(305,215),xy(324,215),xy(325,223),xy(323,234),xy(306,234),xy(305,228)]).
fillpoint(r15, xy(306,215), 6.0).
fillpoint(r15, xy(324,215), 6.0).
fillpoint(r15, xy(305,234), 6.0).
fillpoint(r15, xy(323,234), 6.0).
fillpoint(r15, xy(311,215), 5.0).
fillpoint(r15, xy(304,225), 5.0).
fillpoint(r15, xy(324,225), 5.0).
fillpoint(r15, xy(311,235), 5.0).
region(r13, '#0074d9', 500, centroid(414,194)).
perimeter(r13, 120).
polygon(r13, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r13, [xy(420,194),xy(394,195)]).
midline(r13, [xy(421,195),xy(435,195)]).
fillpoint(r13, xy(394,195), 5.0).
region(r18, '#0074d9', 500, centroid(444,324)).
perimeter(r18, 120).
polygon(r18, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r18, [xy(445,311),xy(445,345)]).
midline(r18, [xy(445,310),xy(445,304)]).
fillpoint(r18, xy(444,325), 5.0).
region(r19, '#0074d9', 500, centroid(364,354)).
perimeter(r19, 120).
polygon(r19, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r19, [xy(376,355),xy(344,355)]).
midline(r19, [xy(377,354),xy(385,355)]).
fillpoint(r19, xy(344,355), 5.0).
region(r20, '#ffdc00', 500, centroid(364,364)).
perimeter(r20, 120).
polygon(r20, [xy(389,370),xy(340,370),xy(340,360),xy(389,360),xy(389,370)]).
midline(r20, [xy(359,364),xy(344,365)]).
midline(r20, [xy(360,365),xy(385,365)]).
fillpoint(r20, xy(344,365), 5.0).
region(r22, '#7fdbff', 400, centroid(40,600)).
perimeter(r22, 80).
polygon(r22, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r22, [xy(39,599),xy(40,600)]).
fillpoint(r22, xy(39,600), 10.0).
region(r25, '#7fdbff', 400, centroid(570,620)).
perimeter(r25, 80).
polygon(r25, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r25, [xy(569,619),xy(570,620)]).
fillpoint(r25, xy(569,620), 10.0).
region(r26, '#7fdbff', 400, centroid(600,620)).
perimeter(r26, 80).
polygon(r26, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r26, [xy(599,619),xy(600,620)]).
fillpoint(r26, xy(599,620), 10.0).
region(r27, '#2ecc40', 400, centroid(630,620)).
perimeter(r27, 80).
polygon(r27, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r27, [xy(629,619),xy(630,620)]).
fillpoint(r27, xy(629,620), 10.0).
border(r27).
region(r7, '#2ecc40', 100, centroid(414,74)).
perimeter(r7, 40).
polygon(r7, [xy(419,80),xy(410,79),xy(410,70),xy(420,70),xy(419,80)]).
midline(r7, [xy(415,75),xy(415,74)]).
fillpoint(r7, xy(414,75), 5.0).
region(r8, '#2ecc40', 100, centroid(514,74)).
perimeter(r8, 40).
polygon(r8, [xy(519,80),xy(510,79),xy(510,70),xy(520,70),xy(519,80)]).
midline(r8, [xy(515,75),xy(515,74)]).
fillpoint(r8, xy(514,75), 5.0).
region(r16, '#2ecc40', 100, centroid(314,224)).
perimeter(r16, 40).
polygon(r16, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r16, [xy(315,225),xy(315,224)]).
fillpoint(r16, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 270).
adjacent(r1, r3).
shared_edge(r1, r3, 190).
adjacent(r1, r4).
shared_edge(r1, r4, 350).
adjacent(r1, r6).
shared_edge(r1, r6, 20).
adjacent(r1, r9).
shared_edge(r1, r9, 70).
adjacent(r1, r14).
shared_edge(r1, r14, 210).
adjacent(r1, r17).
shared_edge(r1, r17, 140).
adjacent(r1, r18).
shared_edge(r1, r18, 10).
adjacent(r1, r20).
shared_edge(r1, r20, 50).
adjacent(r1, r21).
shared_edge(r1, r21, 240).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 660).
adjacent(r1, r24).
shared_edge(r1, r24, 220).
adjacent(r1, r25).
shared_edge(r1, r25, 80).
adjacent(r1, r26).
shared_edge(r1, r26, 80).
adjacent(r1, r27).
shared_edge(r1, r27, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 490).
adjacent(r2, r4).
shared_edge(r2, r4, 300).
adjacent(r2, r10).
shared_edge(r2, r10, 20).
adjacent(r2, r11).
shared_edge(r2, r11, 20).
adjacent(r2, r13).
shared_edge(r2, r13, 60).
adjacent(r2, r14).
shared_edge(r2, r14, 100).
adjacent(r2, r18).
shared_edge(r2, r18, 60).
adjacent(r3, r5).
shared_edge(r3, r5, 120).
adjacent(r3, r9).
shared_edge(r3, r9, 330).
adjacent(r3, r10).
shared_edge(r3, r10, 50).
adjacent(r4, r6).
shared_edge(r4, r6, 100).
adjacent(r5, r7).
shared_edge(r5, r7, 40).
adjacent(r6, r8).
shared_edge(r6, r8, 40).
adjacent(r9, r10).
shared_edge(r9, r10, 20).
adjacent(r9, r11).
shared_edge(r9, r11, 30).
adjacent(r9, r14).
shared_edge(r9, r14, 210).
adjacent(r10, r11).
shared_edge(r10, r11, 50).
adjacent(r11, r13).
shared_edge(r11, r13, 10).
adjacent(r11, r14).
shared_edge(r11, r14, 50).
adjacent(r13, r14).
shared_edge(r13, r14, 50).
adjacent(r14, r15).
shared_edge(r14, r15, 120).
adjacent(r14, r17).
shared_edge(r14, r17, 140).
adjacent(r14, r18).
shared_edge(r14, r18, 50).
adjacent(r14, r19).
shared_edge(r14, r19, 70).
adjacent(r14, r20).
shared_edge(r14, r20, 20).
adjacent(r15, r16).
shared_edge(r15, r16, 40).
adjacent(r19, r20).
shared_edge(r19, r20, 50).
adjacent(r23, r24).
shared_edge(r23, r24, 20).

encloses(r5, r7).
encloses(r6, r8).
encloses(r15, r16).
encloses(r1, r21).
encloses(r1, r22).
encloses(r1, r25).
encloses(r1, r26).
