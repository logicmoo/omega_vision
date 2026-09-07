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
midline(r1, [xy(84,84),xy(87,84),xy(103,69),xy(136,48),xy(154,39),xy(159,39)]).
midline(r1, [xy(160,37),xy(180,24),xy(214,10),xy(220,10),xy(226,5),xy(245,5)]).
midline(r1, [xy(110,244),xy(98,247),xy(86,259),xy(80,226),xy(80,113),xy(85,87),xy(92,91),xy(89,84),xy(95,90),xy(93,92)]).
midline(r1, [xy(100,248),xy(86,262),xy(85,260)]).
midline(r1, [xy(111,243),xy(115,241),xy(115,243)]).
midline(r1, [xy(96,91),xy(104,95),xy(112,95),xy(111,97)]).
midline(r1, [xy(114,95),xy(115,98),xy(117,95),xy(120,98),xy(117,99)]).
midline(r1, [xy(85,263),xy(94,311),xy(109,362),xy(136,429),xy(81,468),xy(30,519),xy(17,537),xy(14,553),xy(14,568),xy(17,580),xy(14,591),xy(14,609),xy(17,622),xy(40,625),xy(60,622),xy(59,599),xy(39,579),xy(18,579)]).
midline(r1, [xy(61,623),xy(89,625),xy(102,622),xy(109,617),xy(110,602),xy(114,590),xy(156,537),xy(188,472),xy(186,468),xy(167,452),xy(137,430)]).
midline(r1, [xy(145,434),xy(232,347),xy(231,352),xy(147,436)]).
midline(r1, [xy(109,619),xy(124,633),xy(134,635),xy(553,634),xy(555,631),xy(555,525),xy(506,476),xy(486,480),xy(436,430),xy(434,418),xy(431,415),xy(428,400),xy(424,394),xy(428,396),xy(432,412),xy(434,412)]).
midline(r1, [xy(556,526),xy(586,556),xy(584,558),xy(585,631),xy(583,634),xy(578,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(506,475),xy(550,396),xy(566,357),xy(565,355),xy(571,345),xy(577,325),xy(577,317),xy(586,297),xy(594,262),xy(595,240),xy(576,230),xy(576,232)]).
midline(r1, [xy(595,238),xy(600,207),xy(600,133),xy(598,113),xy(595,102),xy(593,100),xy(593,102)]).
midline(r1, [xy(435,417),xy(434,414)]).
midline(r1, [xy(437,433),xy(483,481),xy(420,489),xy(320,490),xy(242,482),xy(191,470),xy(186,478)]).
midline(r1, [xy(435,419),xy(435,420)]).
midline(r1, [xy(162,527),xy(163,526)]).
midline(r1, [xy(158,534),xy(157,536)]).
midline(r1, [xy(587,557),xy(616,586),xy(614,588),xy(615,632),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(117,243),xy(118,240),xy(121,241),xy(119,243)]).
midline(r1, [xy(122,240),xy(139,232),xy(139,234)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(238,479),xy(281,436),xy(284,428),xy(282,426),xy(285,421),xy(284,418),xy(289,408),xy(287,405),xy(291,397),xy(295,395),xy(290,403),xy(291,405),xy(289,405)]).
midline(r1, [xy(290,409),xy(289,410)]).
midline(r1, [xy(286,420),xy(287,417)]).
midline(r1, [xy(284,426),xy(285,425)]).
midline(r1, [xy(594,99),xy(594,77),xy(586,50),xy(554,35),xy(539,24),xy(505,10),xy(499,10),xy(493,5),xy(474,5)]).
midline(r1, [xy(583,50),xy(561,71),xy(581,49)]).
midline(r1, [xy(141,232),xy(145,229),xy(144,232)]).
midline(r1, [xy(239,394),xy(238,395)]).
midline(r1, [xy(250,381),xy(240,393),xy(253,380)]).
midline(r1, [xy(140,105),xy(132,99),xy(130,101),xy(122,98),xy(123,101),xy(129,102)]).
midline(r1, [xy(140,107),xy(141,106)]).
midline(r1, [xy(131,102),xy(137,106)]).
midline(r1, [xy(547,35),xy(546,36)]).
midline(r1, [xy(548,32),xy(549,33)]).
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
midline(r2, [xy(312,25),xy(269,24),xy(261,28),xy(245,30),xy(225,39),xy(219,39),xy(213,44),xy(204,45)]).
midline(r2, [xy(313,24),xy(348,25),xy(365,31),xy(365,75)]).
midline(r2, [xy(366,30),xy(376,26),xy(391,24),xy(449,25),xy(463,36),xy(472,30),xy(464,38),xy(465,149),xy(462,166),xy(459,170),xy(409,170)]).
midline(r2, [xy(461,170),xy(465,191),xy(464,280),xy(469,292),xy(470,310),xy(460,324),xy(460,330),xy(454,340),xy(455,345)]).
midline(r2, [xy(468,36),xy(472,34),xy(485,34),xy(494,39),xy(500,39),xy(506,44),xy(515,45)]).
midline(r2, [xy(270,22),xy(267,20),xy(270,21)]).
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
region(r11, '#2ecc40', 27900, centroid(343,280)).
perimeter(r11, 1020).
polygon(r11, [xy(399,370),xy(390,369),xy(389,350),xy(340,350),xy(339,370),xy(320,370),xy(319,360),xy(290,360),xy(289,300),xy(200,300),xy(200,280),xy(190,280),xy(190,270),xy(180,269),xy(180,250),xy(289,250),xy(290,200),xy(439,200),xy(440,359),xy(400,360),xy(399,370)]).
hole(r11, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r11, [xy(383,254),xy(335,206),xy(327,204),xy(301,204),xy(295,205),xy(294,211),xy(295,243),xy(307,260),xy(310,261),xy(309,264),xy(313,269),xy(313,274),xy(224,275),xy(212,267),xy(195,260),xy(189,260)]).
midline(r11, [xy(314,275),xy(330,283),xy(345,294),xy(327,314),xy(317,332),xy(325,345),xy(330,360)]).
midline(r11, [xy(346,293),xy(362,290),xy(375,284),xy(402,314),xy(412,332),xy(408,337),xy(409,339),xy(396,354),xy(395,365)]).
midline(r11, [xy(376,283),xy(384,255)]).
fillpoint(r11, xy(375,285), 65.0).
fillpoint(r11, xy(378,277), 62.0).
fillpoint(r11, xy(367,288), 62.0).
fillpoint(r11, xy(379,274), 61.0).
fillpoint(r11, xy(364,289), 61.0).
fillpoint(r11, xy(380,271), 60.0).
fillpoint(r11, xy(361,290), 60.0).
fillpoint(r11, xy(381,267), 59.0).
fillpoint(r11, xy(357,291), 59.0).
fillpoint(r11, xy(382,263), 58.0).
fillpoint(r11, xy(353,292), 58.0).
fillpoint(r11, xy(383,258), 57.0).
fillpoint(r11, xy(348,293), 57.0).
fillpoint(r11, xy(318,331), 29.0).
fillpoint(r11, xy(411,331), 29.0).
fillpoint(r11, xy(224,275), 25.0).
region(r3, '#2ecc40', 25500, centroid(288,113)).
perimeter(r3, 1060).
polygon(r3, [xy(239,200),xy(160,199),xy(160,130),xy(170,129),xy(170,90),xy(180,89),xy(180,70),xy(189,70),xy(190,60),xy(200,59),xy(200,50),xy(339,50),xy(340,100),xy(389,100),xy(390,50),xy(440,50),xy(439,150),xy(290,150),xy(290,100),xy(240,100),xy(239,200)]).
midline(r3, [xy(272,75),xy(241,74),xy(221,77),xy(214,84),xy(208,95),xy(209,99),xy(204,115),xy(204,140),xy(200,155),xy(192,153),xy(192,155)]).
midline(r3, [xy(200,157),xy(200,160)]).
midline(r3, [xy(273,74),xy(298,75),xy(309,78),xy(313,86),xy(318,119),xy(326,123),xy(340,125),xy(389,125),xy(410,120),xy(414,109),xy(415,74)]).
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
fillpoint(r3, xy(412,115), 28.0).
fillpoint(r3, xy(324,122), 28.0).
fillpoint(r3, xy(405,122), 28.0).
fillpoint(r3, xy(227,76), 27.0).
fillpoint(r3, xy(302,76), 27.0).
fillpoint(r3, xy(313,87), 27.0).
fillpoint(r3, xy(316,112), 27.0).
fillpoint(r3, xy(413,112), 27.0).
fillpoint(r3, xy(327,123), 27.0).
fillpoint(r3, xy(402,123), 27.0).
fillpoint(r3, xy(232,75), 26.0).
fillpoint(r3, xy(298,75), 26.0).
fillpoint(r3, xy(314,92), 26.0).
fillpoint(r3, xy(315,108), 26.0).
fillpoint(r3, xy(414,108), 26.0).
fillpoint(r3, xy(332,124), 26.0).
fillpoint(r3, xy(398,124), 26.0).
fillpoint(r3, xy(241,75), 25.0).
fillpoint(r3, xy(415,86), 25.0).
fillpoint(r3, xy(341,125), 25.0).
region(r7, '#ffdc00', 13600, centroid(258,188)).
perimeter(r7, 660).
polygon(r7, [xy(289,250),xy(170,249),xy(170,210),xy(160,209),xy(160,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r7, [xy(309,174),xy(273,175),xy(270,173),xy(265,159),xy(265,124)]).
midline(r7, [xy(310,174),xy(315,175)]).
midline(r7, [xy(271,175),xy(266,186),xy(262,216),xy(253,223),xy(196,225),xy(175,206),xy(164,205)]).
fillpoint(r7, xy(271,175), 31.4).
fillpoint(r7, xy(260,220), 29.7).
fillpoint(r7, xy(268,168), 29.0).
fillpoint(r7, xy(268,181), 29.0).
fillpoint(r7, xy(261,218), 29.0).
fillpoint(r7, xy(258,221), 29.0).
fillpoint(r7, xy(267,165), 28.0).
fillpoint(r7, xy(267,184), 28.0).
fillpoint(r7, xy(262,215), 28.0).
fillpoint(r7, xy(255,222), 28.0).
fillpoint(r7, xy(266,162), 27.0).
fillpoint(r7, xy(266,187), 27.0).
fillpoint(r7, xy(263,212), 27.0).
fillpoint(r7, xy(252,223), 27.0).
fillpoint(r7, xy(265,158), 26.0).
fillpoint(r7, xy(265,192), 26.0).
fillpoint(r7, xy(264,208), 26.0).
fillpoint(r7, xy(248,224), 26.0).
fillpoint(r7, xy(265,136), 25.0).
fillpoint(r7, xy(291,175), 25.0).
fillpoint(r7, xy(194,225), 25.0).
region(r4, '#2ecc40', 13500, centroid(519,182)).
perimeter(r4, 760).
polygon(r4, [xy(499,320),xy(490,319),xy(490,50),xy(519,50),xy(519,60),xy(500,60),xy(500,89),xy(529,90),xy(530,70),xy(539,70),xy(540,89),xy(550,90),xy(550,129),xy(560,130),xy(560,209),xy(550,210),xy(550,249),xy(540,250),xy(540,269),xy(530,270),xy(530,279),xy(520,280),xy(520,299),xy(510,300),xy(510,309),xy(500,310),xy(499,320)]).
midline(r4, [xy(517,235),xy(515,249),xy(505,273),xy(505,285),xy(500,294),xy(500,300),xy(495,306),xy(495,315)]).
midline(r4, [xy(517,234),xy(520,227),xy(520,200),xy(526,184),xy(524,182),xy(525,155),xy(520,139),xy(520,120),xy(499,99),xy(494,89),xy(495,55),xy(515,55)]).
midline(r4, [xy(521,226),xy(521,228)]).
midline(r4, [xy(520,119),xy(535,103),xy(535,74)]).
fillpoint(r4, xy(524,170), 35.0).
fillpoint(r4, xy(521,143), 32.0).
fillpoint(r4, xy(521,196), 32.0).
fillpoint(r4, xy(520,138), 31.0).
fillpoint(r4, xy(520,202), 31.0).
fillpoint(r4, xy(519,124), 30.0).
fillpoint(r4, xy(520,219), 30.0).
fillpoint(r4, xy(518,231), 29.0).
fillpoint(r4, xy(517,234), 28.0).
fillpoint(r4, xy(516,237), 27.0).
fillpoint(r4, xy(515,242), 26.0).
fillpoint(r4, xy(505,274), 16.0).
fillpoint(r4, xy(505,283), 15.0).
fillpoint(r4, xy(500,295), 11.0).
region(r21, '#5a5a5a', 7200, centroid(370,620)).
perimeter(r21, 760).
polygon(r21, [xy(549,630),xy(190,630),xy(190,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(364,619),xy(199,620)]).
midline(r21, [xy(365,619),xy(540,620)]).
fillpoint(r21, xy(199,620), 10.0).
region(r14, '#ffdc00', 2900, centroid(259,321)).
perimeter(r14, 280).
polygon(r14, [xy(289,360),xy(280,360),xy(279,350),xy(260,350),xy(260,340),xy(250,340),xy(249,330),xy(230,330),xy(230,320),xy(220,320),xy(220,310),xy(210,309),xy(210,300),xy(289,300),xy(289,360)]).
midline(r14, [xy(269,320),xy(256,315),xy(244,315),xy(235,310),xy(229,310),xy(223,305),xy(214,305)]).
midline(r14, [xy(269,322),xy(274,335),xy(284,346),xy(285,355)]).
fillpoint(r14, xy(268,321), 21.0).
fillpoint(r14, xy(255,315), 16.0).
fillpoint(r14, xy(274,334), 16.0).
fillpoint(r14, xy(248,314), 15.0).
fillpoint(r14, xy(234,310), 11.0).
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
region(r9, '#870c25', 1500, centroid(364,184)).
perimeter(r9, 160).
polygon(r9, [xy(389,200),xy(340,200),xy(340,170),xy(389,170),xy(389,200)]).
midline(r9, [xy(366,184),xy(354,185)]).
midline(r9, [xy(367,184),xy(375,185)]).
fillpoint(r9, xy(354,185), 15.0).
region(r20, '#2ecc40', 1200, centroid(160,620)).
perimeter(r20, 160).
polygon(r20, [xy(189,630),xy(130,630),xy(130,610),xy(189,610),xy(189,630)]).
midline(r20, [xy(160,620),xy(139,620)]).
midline(r20, [xy(161,620),xy(180,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r8, '#bebebe', 1000, centroid(364,160)).
perimeter(r8, 140).
polygon(r8, [xy(389,170),xy(340,170),xy(340,150),xy(389,150),xy(389,170)]).
midline(r8, [xy(360,159),xy(349,160)]).
midline(r8, [xy(361,159),xy(380,160)]).
fillpoint(r8, xy(349,160), 10.0).
region(r5, '#5a5a5a', 800, centroid(514,74)).
perimeter(r5, 160).
polygon(r5, [xy(529,90),xy(500,89),xy(500,60),xy(530,60),xy(529,90)]).
hole(r5, [xy(520,79),xy(519,70),xy(510,70),xy(510,80),xy(520,79)]).
midline(r5, [xy(524,82),xy(525,70),xy(523,65),xy(505,65),xy(504,70),xy(505,84),xy(524,84)]).
fillpoint(r5, xy(506,65), 6.0).
fillpoint(r5, xy(524,65), 6.0).
fillpoint(r5, xy(505,84), 6.0).
fillpoint(r5, xy(523,84), 6.0).
fillpoint(r5, xy(511,65), 5.0).
fillpoint(r5, xy(504,75), 5.0).
fillpoint(r5, xy(524,75), 5.0).
fillpoint(r5, xy(511,85), 5.0).
region(r12, '#5a5a5a', 800, centroid(314,224)).
perimeter(r12, 160).
polygon(r12, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r12, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r12, [xy(319,214),xy(305,215),xy(305,234),xy(319,235),xy(324,233),xy(325,220),xy(324,216),xy(320,215)]).
fillpoint(r12, xy(306,215), 6.0).
fillpoint(r12, xy(324,215), 6.0).
fillpoint(r12, xy(305,234), 6.0).
fillpoint(r12, xy(323,234), 6.0).
fillpoint(r12, xy(311,215), 5.0).
fillpoint(r12, xy(304,225), 5.0).
fillpoint(r12, xy(324,225), 5.0).
fillpoint(r12, xy(311,235), 5.0).
region(r10, '#0074d9', 500, centroid(414,194)).
perimeter(r10, 120).
polygon(r10, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r10, [xy(409,194),xy(394,195)]).
midline(r10, [xy(410,195),xy(435,195)]).
fillpoint(r10, xy(394,195), 5.0).
region(r15, '#0074d9', 500, centroid(444,324)).
perimeter(r15, 120).
polygon(r15, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r15, [xy(445,317),xy(445,304)]).
midline(r15, [xy(445,318),xy(445,345)]).
fillpoint(r15, xy(444,325), 5.0).
region(r16, '#0074d9', 500, centroid(364,354)).
perimeter(r16, 120).
polygon(r16, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r16, [xy(361,354),xy(344,355)]).
midline(r16, [xy(362,354),xy(385,355)]).
fillpoint(r16, xy(344,355), 5.0).
region(r17, '#ffdc00', 500, centroid(364,364)).
perimeter(r17, 120).
polygon(r17, [xy(389,370),xy(340,370),xy(340,360),xy(389,360),xy(389,370)]).
midline(r17, [xy(359,364),xy(344,365)]).
midline(r17, [xy(360,365),xy(385,365)]).
fillpoint(r17, xy(344,365), 5.0).
region(r19, '#7fdbff', 400, centroid(40,600)).
perimeter(r19, 80).
polygon(r19, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r19, [xy(39,599),xy(40,600)]).
fillpoint(r19, xy(39,600), 10.0).
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
region(r6, '#2ecc40', 100, centroid(514,74)).
perimeter(r6, 40).
polygon(r6, [xy(519,80),xy(510,79),xy(510,70),xy(520,70),xy(519,80)]).
midline(r6, [xy(515,75),xy(515,74)]).
fillpoint(r6, xy(514,75), 5.0).
region(r13, '#2ecc40', 100, centroid(314,224)).
perimeter(r13, 40).
polygon(r13, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r13, [xy(315,225),xy(315,224)]).
fillpoint(r13, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 270).
adjacent(r1, r3).
shared_edge(r1, r3, 190).
adjacent(r1, r4).
shared_edge(r1, r4, 360).
adjacent(r1, r5).
shared_edge(r1, r5, 20).
adjacent(r1, r7).
shared_edge(r1, r7, 70).
adjacent(r1, r11).
shared_edge(r1, r11, 210).
adjacent(r1, r14).
shared_edge(r1, r14, 140).
adjacent(r1, r15).
shared_edge(r1, r15, 10).
adjacent(r1, r17).
shared_edge(r1, r17, 50).
adjacent(r1, r18).
shared_edge(r1, r18, 240).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 140).
adjacent(r1, r21).
shared_edge(r1, r21, 740).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 490).
adjacent(r2, r4).
shared_edge(r2, r4, 300).
adjacent(r2, r8).
shared_edge(r2, r8, 20).
adjacent(r2, r9).
shared_edge(r2, r9, 20).
adjacent(r2, r10).
shared_edge(r2, r10, 60).
adjacent(r2, r11).
shared_edge(r2, r11, 100).
adjacent(r2, r15).
shared_edge(r2, r15, 60).
adjacent(r3, r7).
shared_edge(r3, r7, 330).
adjacent(r3, r8).
shared_edge(r3, r8, 50).
adjacent(r4, r5).
shared_edge(r4, r5, 100).
adjacent(r5, r6).
shared_edge(r5, r6, 40).
adjacent(r7, r8).
shared_edge(r7, r8, 20).
adjacent(r7, r9).
shared_edge(r7, r9, 30).
adjacent(r7, r11).
shared_edge(r7, r11, 210).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r9, r10).
shared_edge(r9, r10, 10).
adjacent(r9, r11).
shared_edge(r9, r11, 50).
adjacent(r10, r11).
shared_edge(r10, r11, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 120).
adjacent(r11, r14).
shared_edge(r11, r14, 140).
adjacent(r11, r15).
shared_edge(r11, r15, 50).
adjacent(r11, r16).
shared_edge(r11, r16, 70).
adjacent(r11, r17).
shared_edge(r11, r17, 20).
adjacent(r12, r13).
shared_edge(r12, r13, 40).
adjacent(r16, r17).
shared_edge(r16, r17, 50).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r5, r6).
encloses(r12, r13).
encloses(r1, r18).
encloses(r1, r19).
encloses(r1, r22).
encloses(r1, r23).
