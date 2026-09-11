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

region(r1, '#aaaaaa', 282400, centroid(361,369)).
perimeter(r1, 4680).
polygon(r1, [xy(0,0),xy(0,639),xy(639,639),xy(639,630),xy(619,629),xy(619,610),xy(639,609),xy(639,0),xy(320,0),xy(320,9),xy(339,9),xy(340,19),xy(349,19),xy(350,29),xy(359,29),xy(360,39),xy(370,40),xy(370,59),xy(379,59),xy(380,69),xy(390,70),xy(390,89),xy(400,90),xy(400,129),xy(410,130),xy(410,209),xy(400,210),xy(400,249),xy(390,250),xy(390,269),xy(380,270),xy(379,280),xy(370,280),xy(370,299),xy(360,300),xy(360,309),xy(350,310),xy(350,319),xy(340,320),xy(339,330),xy(320,330),xy(320,339),xy(310,340),xy(309,350),xy(290,350),xy(289,360),xy(250,360),xy(249,370),xy(170,370),xy(169,360),xy(130,360),xy(129,350),xy(110,350),xy(109,340),xy(99,339),xy(99,330),xy(80,330),xy(79,320),xy(70,320),xy(69,310),xy(60,310),xy(59,300),xy(49,299),xy(49,280),xy(39,279),xy(39,60),xy(49,59),xy(49,40),xy(59,39),xy(59,30),xy(69,29),xy(69,20),xy(79,19),xy(80,9),xy(99,9),xy(99,0),xy(0,0)]).
hole(r1, [xy(589,610),xy(609,609),xy(610,629),xy(590,630),xy(589,610)]).
hole(r1, [xy(559,610),xy(579,609),xy(580,629),xy(560,630),xy(559,610)]).
hole(r1, [xy(129,610),xy(549,609),xy(550,629),xy(130,630),xy(129,610)]).
midline(r1, [xy(325,4),xy(344,4),xy(349,9),xy(359,9),xy(364,14),xy(374,14),xy(379,19),xy(389,19),xy(399,29),xy(409,29),xy(414,34),xy(424,34),xy(434,44),xy(444,44),xy(464,64),xy(474,64),xy(524,114),xy(524,324),xy(519,330),xy(519,369),xy(514,375),xy(514,394),xy(509,400),xy(509,409),xy(504,415),xy(504,434),xy(499,440),xy(499,449),xy(494,455),xy(494,463),xy(485,464),xy(479,469),xy(460,469),xy(454,474),xy(445,474),xy(439,479),xy(420,479),xy(414,484),xy(375,484),xy(369,489),xy(119,489),xy(84,454),xy(84,444),xy(64,424),xy(64,414),xy(54,404),xy(54,394),xy(49,389),xy(49,379),xy(39,369),xy(39,359),xy(34,354),xy(34,344),xy(29,339),xy(29,329),xy(24,324),xy(24,304),xy(19,299),xy(19,40),xy(24,35),xy(25,23),xy(30,19),xy(40,19),xy(45,14),xy(55,14),xy(58,10),xy(70,9),xy(75,4),xy(94,4)]).
midline(r1, [xy(418,481),xy(415,484)]).
midline(r1, [xy(511,398),xy(514,395)]).
midline(r1, [xy(373,486),xy(370,489)]).
midline(r1, [xy(501,438),xy(504,435)]).
midline(r1, [xy(509,410),xy(506,413)]).
midline(r1, [xy(516,373),xy(519,370)]).
midline(r1, [xy(443,476),xy(440,479)]).
midline(r1, [xy(480,469),xy(483,466)]).
midline(r1, [xy(499,450),xy(496,453)]).
midline(r1, [xy(524,325),xy(521,328)]).
midline(r1, [xy(458,471),xy(455,474)]).
midline(r1, [xy(634,634),xy(124,634),xy(64,574),xy(65,543),xy(119,490)]).
midline(r1, [xy(554,632),xy(554,524),xy(494,464)]).
midline(r1, [xy(555,525),xy(584,554),xy(584,632)]).
midline(r1, [xy(585,555),xy(614,584),xy(614,632)]).
fillpoint(r1, xy(467,439), 163.3).
fillpoint(r1, xy(470,433), 162.4).
fillpoint(r1, xy(463,440), 162.4).
fillpoint(r1, xy(475,423), 157.6).
fillpoint(r1, xy(453,445), 157.6).
fillpoint(r1, xy(476,418), 156.6).
fillpoint(r1, xy(448,446), 156.6).
fillpoint(r1, xy(444,447), 155.7).
fillpoint(r1, xy(439,448), 154.7).
fillpoint(r1, xy(434,449), 153.8).
fillpoint(r1, xy(481,408), 151.8).
fillpoint(r1, xy(428,451), 151.8).
fillpoint(r1, xy(482,404), 150.9).
fillpoint(r1, xy(424,452), 150.9).
fillpoint(r1, xy(483,399), 149.9).
fillpoint(r1, xy(484,394), 149.0).
fillpoint(r1, xy(485,390), 148.0).
fillpoint(r1, xy(487,384), 146.1).
fillpoint(r1, xy(414,457), 146.1).
fillpoint(r1, xy(488,379), 145.2).
fillpoint(r1, xy(409,458), 145.2).
fillpoint(r1, xy(404,459), 144.2).
fillpoint(r1, xy(400,460), 143.3).
fillpoint(r1, xy(395,461), 142.3).
fillpoint(r1, xy(493,369), 140.4).
fillpoint(r1, xy(389,463), 140.4).
fillpoint(r1, xy(494,364), 139.4).
fillpoint(r1, xy(384,464), 139.4).
fillpoint(r1, xy(495,360), 138.5).
fillpoint(r1, xy(380,465), 138.5).
fillpoint(r1, xy(496,355), 137.5).
fillpoint(r1, xy(375,466), 137.5).
fillpoint(r1, xy(497,350), 136.6).
fillpoint(r1, xy(370,467), 136.6).
fillpoint(r1, xy(366,468), 135.6).
fillpoint(r1, xy(499,344), 134.7).
fillpoint(r1, xy(361,469), 134.7).
fillpoint(r1, xy(500,340), 133.7).
fillpoint(r1, xy(357,470), 133.7).
fillpoint(r1, xy(501,335), 132.7).
fillpoint(r1, xy(352,471), 132.7).
fillpoint(r1, xy(502,330), 131.8).
fillpoint(r1, xy(347,472), 131.8).
fillpoint(r1, xy(503,326), 130.8).
fillpoint(r1, xy(343,473), 130.8).
fillpoint(r1, xy(504,321), 129.9).
fillpoint(r1, xy(338,474), 129.9).
fillpoint(r1, xy(505,317), 128.9).
fillpoint(r1, xy(334,475), 128.9).
fillpoint(r1, xy(506,312), 128.0).
fillpoint(r1, xy(329,476), 128.0).
fillpoint(r1, xy(507,307), 127.0).
fillpoint(r1, xy(324,477), 127.0).
fillpoint(r1, xy(508,303), 126.1).
fillpoint(r1, xy(320,478), 126.1).
fillpoint(r1, xy(509,298), 125.1).
fillpoint(r1, xy(315,479), 125.1).
fillpoint(r1, xy(510,294), 124.2).
fillpoint(r1, xy(311,480), 124.2).
fillpoint(r1, xy(511,289), 123.2).
fillpoint(r1, xy(306,481), 123.2).
fillpoint(r1, xy(512,284), 122.2).
fillpoint(r1, xy(301,482), 122.2).
fillpoint(r1, xy(513,280), 121.3).
fillpoint(r1, xy(297,483), 121.3).
fillpoint(r1, xy(126,485), 121.0).
fillpoint(r1, xy(514,275), 120.3).
fillpoint(r1, xy(292,484), 120.3).
fillpoint(r1, xy(515,271), 119.4).
fillpoint(r1, xy(132,485), 119.4).
fillpoint(r1, xy(271,485), 119.4).
fillpoint(r1, xy(516,266), 118.4).
fillpoint(r1, xy(153,486), 118.4).
fillpoint(r1, xy(266,486), 118.4).
fillpoint(r1, xy(517,261), 117.5).
fillpoint(r1, xy(158,487), 117.5).
fillpoint(r1, xy(261,487), 117.5).
fillpoint(r1, xy(518,257), 116.5).
fillpoint(r1, xy(163,488), 116.5).
fillpoint(r1, xy(257,488), 116.5).
fillpoint(r1, xy(519,252), 115.6).
fillpoint(r1, xy(167,489), 115.6).
fillpoint(r1, xy(252,489), 115.6).
fillpoint(r1, xy(520,239), 114.6).
fillpoint(r1, xy(171,490), 114.6).
fillpoint(r1, xy(521,226), 113.6).
fillpoint(r1, xy(522,118), 112.7).
fillpoint(r1, xy(522,221), 112.7).
fillpoint(r1, xy(523,123), 111.7).
fillpoint(r1, xy(523,217), 111.7).
fillpoint(r1, xy(524,127), 110.8).
fillpoint(r1, xy(524,212), 110.8).
fillpoint(r1, xy(525,170), 109.8).
fillpoint(r1, xy(75,561), 72.6).
fillpoint(r1, xy(74,565), 71.6).
fillpoint(r1, xy(64,393), 62.1).
fillpoint(r1, xy(63,389), 61.1).
fillpoint(r1, xy(58,379), 56.3).
fillpoint(r1, xy(46,360), 44.9).
fillpoint(r1, xy(45,355), 43.9).
border(r1).
region(r3, '#2ecc40', 60400, centroid(234,190)).
perimeter(r3, 2580).
polygon(r3, [xy(90,50),xy(90,329),xy(99,329),xy(100,339),xy(110,340),xy(110,349),xy(129,349),xy(130,359),xy(169,359),xy(170,369),xy(239,369),xy(239,350),xy(140,350),xy(140,299),xy(289,299),xy(290,349),xy(309,349),xy(309,340),xy(319,339),xy(320,329),xy(339,329),xy(339,320),xy(349,319),xy(349,310),xy(359,309),xy(360,299),xy(369,299),xy(369,280),xy(379,279),xy(380,269),xy(389,269),xy(389,250),xy(399,249),xy(399,210),xy(409,209),xy(409,200),xy(389,199),xy(389,150),xy(409,149),xy(409,130),xy(399,129),xy(399,90),xy(390,90),xy(389,100),xy(340,100),xy(339,50),xy(90,50)]).
hole(r3, [xy(299,210),xy(329,209),xy(330,239),xy(300,240),xy(299,210)]).
hole(r3, [xy(340,150),xy(340,199),xy(290,200),xy(289,250),xy(139,249),xy(139,200),xy(189,199),xy(189,150),xy(239,149),xy(240,99),xy(289,99),xy(290,149),xy(340,150)]).
hole(r3, [xy(99,60),xy(129,59),xy(130,89),xy(100,90),xy(99,60)]).
midline(r3, [xy(299,339),xy(299,330),xy(304,325),xy(304,315),xy(314,304),xy(314,295),xy(319,290),xy(319,280),xy(322,274),xy(114,273),xy(114,175),xy(139,150),xy(139,139),xy(94,94),xy(94,55),xy(134,54),xy(179,99),xy(140,139),xy(180,99),xy(190,99),xy(215,74),xy(314,74),xy(314,124),xy(364,124),xy(364,224),xy(359,229),xy(334,204),xy(294,205),xy(294,244),xy(323,274),xy(330,269),xy(340,269),xy(353,256),xy(354,245),xy(359,240),xy(359,230),xy(365,224),xy(375,224),xy(393,205),xy(404,204)]).
midline(r3, [xy(114,274),xy(114,304),xy(119,309),xy(119,319),xy(124,324),xy(124,334),xy(134,344),xy(134,354),xy(174,354),xy(179,359),xy(229,359)]).
midline(r3, [xy(365,124),xy(375,123),xy(389,139),xy(398,139)]).
midline(r3, [xy(394,95),xy(394,104),xy(376,122),xy(394,105)]).
fillpoint(r3, xy(176,103), 50.7).
fillpoint(r3, xy(143,136), 50.7).
fillpoint(r3, xy(178,102), 50.6).
fillpoint(r3, xy(142,138), 50.6).
fillpoint(r3, xy(183,101), 49.7).
fillpoint(r3, xy(141,143), 49.7).
fillpoint(r3, xy(187,100), 48.7).
fillpoint(r3, xy(140,147), 48.7).
fillpoint(r3, xy(322,281), 39.3).
fillpoint(r3, xy(324,280), 39.2).
fillpoint(r3, xy(329,279), 38.2).
fillpoint(r3, xy(336,273), 35.4).
fillpoint(r3, xy(365,225), 33.4).
fillpoint(r3, xy(364,229), 33.4).
fillpoint(r3, xy(363,233), 32.5).
fillpoint(r3, xy(362,238), 31.5).
fillpoint(r3, xy(361,241), 31.4).
fillpoint(r3, xy(364,132), 31.3).
fillpoint(r3, xy(360,243), 31.3).
fillpoint(r3, xy(359,246), 31.3).
fillpoint(r3, xy(122,275), 31.3).
fillpoint(r3, xy(356,251), 30.8).
fillpoint(r3, xy(357,249), 30.7).
fillpoint(r3, xy(355,253), 30.6).
fillpoint(r3, xy(354,255), 30.5).
fillpoint(r3, xy(310,79), 28.6).
fillpoint(r3, xy(319,120), 28.6).
fillpoint(r3, xy(223,78), 27.7).
fillpoint(r3, xy(306,78), 27.7).
fillpoint(r3, xy(311,83), 27.7).
fillpoint(r3, xy(318,116), 27.7).
fillpoint(r3, xy(323,121), 27.7).
fillpoint(r3, xy(356,128), 27.7).
fillpoint(r3, xy(118,183), 27.7).
fillpoint(r3, xy(118,266), 27.7).
fillpoint(r3, xy(118,283), 27.7).
fillpoint(r3, xy(228,77), 26.7).
fillpoint(r3, xy(301,77), 26.7).
fillpoint(r3, xy(312,88), 26.7).
fillpoint(r3, xy(317,111), 26.7).
fillpoint(r3, xy(328,122), 26.7).
fillpoint(r3, xy(351,127), 26.7).
fillpoint(r3, xy(117,188), 26.7).
fillpoint(r3, xy(117,261), 26.7).
fillpoint(r3, xy(117,288), 26.7).
fillpoint(r3, xy(233,76), 25.8).
fillpoint(r3, xy(297,76), 25.8).
fillpoint(r3, xy(313,93), 25.8).
fillpoint(r3, xy(316,107), 25.8).
fillpoint(r3, xy(333,123), 25.8).
fillpoint(r3, xy(347,126), 25.8).
fillpoint(r3, xy(116,193), 25.8).
fillpoint(r3, xy(116,257), 25.8).
fillpoint(r3, xy(116,293), 25.8).
fillpoint(r3, xy(237,75), 24.8).
fillpoint(r3, xy(292,75), 24.8).
fillpoint(r3, xy(314,97), 24.8).
fillpoint(r3, xy(315,102), 24.8).
fillpoint(r3, xy(337,124), 24.8).
fillpoint(r3, xy(342,125), 24.8).
fillpoint(r3, xy(115,197), 24.8).
fillpoint(r3, xy(115,252), 24.8).
fillpoint(r3, xy(115,297), 24.8).
fillpoint(r3, xy(241,75), 23.9).
fillpoint(r3, xy(364,175), 23.9).
fillpoint(r3, xy(114,225), 23.9).
fillpoint(r3, xy(141,275), 23.9).
fillpoint(r3, xy(115,306), 23.9).
fillpoint(r3, xy(117,318), 22.0).
fillpoint(r3, xy(306,323), 16.2).
fillpoint(r3, xy(123,333), 16.2).
region(r2, '#ffdc00', 28800, centroid(157,98)).
perimeter(r2, 1460).
polygon(r2, [xy(339,10),xy(320,10),xy(319,0),xy(100,0),xy(99,10),xy(80,10),xy(80,19),xy(70,20),xy(70,29),xy(60,30),xy(59,40),xy(50,40),xy(50,59),xy(40,60),xy(40,279),xy(50,280),xy(50,299),xy(59,299),xy(60,309),xy(69,309),xy(70,319),xy(80,320),xy(80,329),xy(89,329),xy(89,50),xy(339,49),xy(340,99),xy(389,99),xy(389,70),xy(380,70),xy(379,60),xy(369,59),xy(369,40),xy(360,40),xy(359,30),xy(350,30),xy(349,20),xy(339,19),xy(339,10)]).
midline(r2, [xy(374,84),xy(364,84),xy(354,74),xy(354,54),xy(349,49),xy(348,39),xy(339,39),xy(334,34),xy(324,34),xy(319,29),xy(299,29),xy(294,24),xy(125,24),xy(119,29),xy(100,29),xy(94,34),xy(83,35),xy(74,45),xy(74,54),xy(69,60),xy(69,79),xy(64,85),xy(64,254),xy(69,259),xy(69,279),xy(74,284),xy(74,294),xy(79,299),xy(79,309),xy(84,314),xy(84,324)]).
midline(r2, [xy(98,31),xy(95,34)]).
midline(r2, [xy(83,36),xy(76,43)]).
midline(r2, [xy(71,58),xy(74,55)]).
midline(r2, [xy(120,29),xy(123,26)]).
midline(r2, [xy(69,80),xy(66,83)]).
fillpoint(r2, xy(118,25), 23.9).
fillpoint(r2, xy(64,170), 23.9).
fillpoint(r2, xy(111,27), 22.0).
fillpoint(r2, xy(308,27), 22.0).
fillpoint(r2, xy(67,71), 22.0).
fillpoint(r2, xy(67,268), 22.0).
fillpoint(r2, xy(107,28), 21.0).
fillpoint(r2, xy(313,28), 21.0).
fillpoint(r2, xy(68,67), 21.0).
fillpoint(r2, xy(361,78), 21.0).
fillpoint(r2, xy(68,273), 21.0).
fillpoint(r2, xy(102,29), 20.1).
fillpoint(r2, xy(317,29), 20.1).
fillpoint(r2, xy(69,62), 20.1).
fillpoint(r2, xy(69,277), 20.1).
fillpoint(r2, xy(95,30), 19.1).
fillpoint(r2, xy(321,30), 19.1).
fillpoint(r2, xy(69,57), 19.1).
fillpoint(r2, xy(69,283), 19.1).
fillpoint(r2, xy(88,33), 17.1).
fillpoint(r2, xy(73,48), 17.1).
fillpoint(r2, xy(86,34), 16.9).
fillpoint(r2, xy(74,46), 16.9).
fillpoint(r2, xy(84,35), 16.8).
fillpoint(r2, xy(75,44), 16.8).
fillpoint(r2, xy(333,33), 16.2).
fillpoint(r2, xy(356,67), 16.2).
fillpoint(r2, xy(373,83), 16.2).
fillpoint(r2, xy(73,293), 16.2).
fillpoint(r2, xy(355,62), 15.3).
fillpoint(r2, xy(355,55), 14.3).
fillpoint(r2, xy(348,41), 12.3).
fillpoint(r2, xy(343,39), 12.2).
fillpoint(r2, xy(346,40), 12.2).
fillpoint(r2, xy(349,43), 12.2).
fillpoint(r2, xy(350,46), 12.2).
fillpoint(r2, xy(78,303), 11.5).
fillpoint(r2, xy(79,307), 10.5).
border(r2).
region(r6, '#ffdc00', 15000, centroid(248,191)).
perimeter(r6, 700).
polygon(r6, [xy(339,150),xy(290,150),xy(289,100),xy(240,100),xy(240,199),xy(140,200),xy(140,249),xy(289,249),xy(289,200),xy(339,199),xy(339,150)]).
midline(r6, [xy(165,224),xy(263,224),xy(264,125)]).
midline(r6, [xy(265,174),xy(314,174)]).
fillpoint(r6, xy(272,175), 31.3).
fillpoint(r6, xy(260,220), 28.6).
fillpoint(r6, xy(268,166), 27.7).
fillpoint(r6, xy(268,183), 27.7).
fillpoint(r6, xy(261,216), 27.7).
fillpoint(r6, xy(256,221), 27.7).
fillpoint(r6, xy(267,161), 26.7).
fillpoint(r6, xy(267,188), 26.7).
fillpoint(r6, xy(262,211), 26.7).
fillpoint(r6, xy(251,222), 26.7).
fillpoint(r6, xy(266,157), 25.8).
fillpoint(r6, xy(266,193), 25.8).
fillpoint(r6, xy(263,207), 25.8).
fillpoint(r6, xy(247,223), 25.8).
fillpoint(r6, xy(265,152), 24.8).
fillpoint(r6, xy(265,197), 24.8).
fillpoint(r6, xy(264,202), 24.8).
fillpoint(r6, xy(242,224), 24.8).
fillpoint(r6, xy(265,136), 23.9).
fillpoint(r6, xy(291,175), 23.9).
fillpoint(r6, xy(164,225), 23.9).
region(r14, '#5a5a5a', 8400, centroid(340,620)).
perimeter(r14, 880).
polygon(r14, [xy(130,610),xy(130,629),xy(549,629),xy(549,610),xy(130,610)]).
midline(r14, [xy(539,619),xy(140,619)]).
fillpoint(r14, xy(139,620), 9.6).
region(r13, '#ffdc00', 8100, centroid(218,327)).
perimeter(r13, 440).
polygon(r13, [xy(140,300),xy(140,349),xy(239,349),xy(240,369),xy(249,369),xy(250,359),xy(289,359),xy(289,300),xy(140,300)]).
midline(r13, [xy(165,324),xy(264,324),xy(264,334),xy(245,353),xy(244,364)]).
midline(r13, [xy(264,335),xy(246,353)]).
fillpoint(r13, xy(260,329), 28.6).
fillpoint(r13, xy(256,328), 27.7).
fillpoint(r13, xy(251,327), 26.7).
fillpoint(r13, xy(247,326), 25.8).
fillpoint(r13, xy(242,325), 24.8).
fillpoint(r13, xy(164,325), 23.9).
region(r9, '#870c25', 1500, centroid(214,184)).
perimeter(r9, 160).
polygon(r9, [xy(190,170),xy(190,199),xy(239,199),xy(239,170),xy(190,170)]).
midline(r9, [xy(205,184),xy(224,184)]).
fillpoint(r9, xy(204,185), 14.3).
region(r7, '#bebebe', 1000, centroid(214,160)).
perimeter(r7, 140).
polygon(r7, [xy(190,150),xy(190,169),xy(239,169),xy(239,150),xy(190,150)]).
midline(r7, [xy(200,159),xy(229,159)]).
fillpoint(r7, xy(199,160), 9.6).
region(r4, '#5a5a5a', 800, centroid(114,74)).
perimeter(r4, 160).
polygon(r4, [xy(100,60),xy(100,89),xy(129,89),xy(129,60),xy(100,60)]).
hole(r4, [xy(109,70),xy(119,69),xy(120,79),xy(110,80),xy(109,70)]).
midline(r4, [xy(119,64),xy(104,65),xy(104,84),xy(124,83),xy(124,65),xy(120,64)]).
fillpoint(r4, xy(107,65), 5.7).
fillpoint(r4, xy(124,65), 5.7).
fillpoint(r4, xy(105,84), 5.7).
fillpoint(r4, xy(122,84), 5.7).
fillpoint(r4, xy(111,65), 4.8).
fillpoint(r4, xy(104,75), 4.8).
fillpoint(r4, xy(124,75), 4.8).
fillpoint(r4, xy(111,85), 4.8).
region(r8, '#ffdc00', 800, centroid(400,170)).
perimeter(r8, 120).
polygon(r8, [xy(390,150),xy(390,189),xy(409,189),xy(409,150),xy(390,150)]).
midline(r8, [xy(399,160),xy(399,179)]).
fillpoint(r8, xy(399,170), 9.6).
region(r11, '#5a5a5a', 800, centroid(314,224)).
perimeter(r11, 160).
polygon(r11, [xy(300,210),xy(300,239),xy(329,239),xy(329,210),xy(300,210)]).
hole(r11, [xy(309,220),xy(319,219),xy(320,229),xy(310,230),xy(309,220)]).
midline(r11, [xy(319,214),xy(304,215),xy(304,234),xy(324,233),xy(324,215),xy(320,214)]).
fillpoint(r11, xy(307,215), 5.7).
fillpoint(r11, xy(324,215), 5.7).
fillpoint(r11, xy(305,234), 5.7).
fillpoint(r11, xy(322,234), 5.7).
fillpoint(r11, xy(311,215), 4.8).
fillpoint(r11, xy(304,225), 4.8).
fillpoint(r11, xy(324,225), 4.8).
fillpoint(r11, xy(311,235), 4.8).
region(r15, '#7fdbff', 400, centroid(570,620)).
perimeter(r15, 80).
polygon(r15, [xy(560,610),xy(560,629),xy(579,629),xy(579,610),xy(560,610)]).
midline(r15, [xy(569,619)]).
fillpoint(r15, xy(569,620), 9.6).
region(r16, '#7fdbff', 400, centroid(600,620)).
perimeter(r16, 80).
polygon(r16, [xy(590,610),xy(590,629),xy(609,629),xy(609,610),xy(590,610)]).
midline(r16, [xy(599,619)]).
fillpoint(r16, xy(599,620), 9.6).
region(r17, '#7fdbff', 400, centroid(630,620)).
perimeter(r17, 80).
polygon(r17, [xy(620,610),xy(620,629),xy(639,629),xy(639,610),xy(620,610)]).
midline(r17, [xy(629,619)]).
fillpoint(r17, xy(629,620), 9.6).
border(r17).
region(r5, '#2ecc40', 100, centroid(114,74)).
perimeter(r5, 40).
polygon(r5, [xy(110,70),xy(110,79),xy(119,79),xy(119,70),xy(110,70)]).
midline(r5, [xy(114,74)]).
fillpoint(r5, xy(114,75), 4.8).
region(r12, '#2ecc40', 100, centroid(314,224)).
perimeter(r12, 40).
polygon(r12, [xy(310,220),xy(310,229),xy(319,229),xy(319,220),xy(310,220)]).
midline(r12, [xy(314,224)]).
fillpoint(r12, xy(314,225), 4.8).

adjacent(r1, r2).
shared_edge(r1, r2, 600).
adjacent(r1, r3).
shared_edge(r1, r3, 540).
adjacent(r1, r8).
shared_edge(r1, r8, 40).
adjacent(r1, r13).
shared_edge(r1, r13, 70).
adjacent(r1, r14).
shared_edge(r1, r14, 880).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 640).
adjacent(r3, r4).
shared_edge(r3, r4, 120).
adjacent(r3, r6).
shared_edge(r3, r6, 600).
adjacent(r3, r7).
shared_edge(r3, r7, 70).
adjacent(r3, r8).
shared_edge(r3, r8, 60).
adjacent(r3, r9).
shared_edge(r3, r9, 30).
adjacent(r3, r11).
shared_edge(r3, r11, 120).
adjacent(r3, r13).
shared_edge(r3, r13, 370).
adjacent(r4, r5).
shared_edge(r4, r5, 40).
adjacent(r6, r7).
shared_edge(r6, r7, 20).
adjacent(r6, r9).
shared_edge(r6, r9, 80).
adjacent(r7, r9).
shared_edge(r7, r9, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 40).

encloses(r4, r5).
encloses(r11, r12).
encloses(r1, r14).
encloses(r1, r15).
encloses(r1, r16).

% OpenCV grouping evidence (advisory; base topology remains authoritative).
:- dynamic opencv_background_candidate/1.
:- discontiguous opencv_background_candidate/1.
:- dynamic opencv_component/2.
:- discontiguous opencv_component/2.
:- dynamic opencv_component_area/2.
:- discontiguous opencv_component_area/2.
:- dynamic opencv_component_centroid/2.
:- discontiguous opencv_component_centroid/2.
:- dynamic opencv_contour/4.
:- discontiguous opencv_contour/4.
:- dynamic opencv_contour_hierarchy/6.
:- discontiguous opencv_contour_hierarchy/6.
:- dynamic opencv_morphology/4.
:- discontiguous opencv_morphology/4.
:- dynamic opencv_shape_metrics/7.
:- discontiguous opencv_shape_metrics/7.
:- dynamic opencv_watershed_count/2.
:- discontiguous opencv_watershed_count/2.
:- dynamic opencv_watershed_segment/4.
:- discontiguous opencv_watershed_segment/4.
opencv_background_candidate(r1).
opencv_component(cc1, [r2,r3,r4,r5,r6,r7,r8,r9,r11,r12,r13]).
opencv_component_area(cc1, 117400).
opencv_component_centroid(cc1, centroid(216,176)).
opencv_component(cc2, [r14]).
opencv_component_area(cc2, 8400).
opencv_component_centroid(cc2, centroid(340,620)).
opencv_component(cc3, [r15]).
opencv_component_area(cc3, 400).
opencv_component_centroid(cc3, centroid(570,620)).
opencv_component(cc4, [r16]).
opencv_component_area(cc4, 400).
opencv_component_centroid(cc4, centroid(600,620)).
opencv_component(cc5, [r17]).
opencv_component_area(cc5, 400).
opencv_component_centroid(cc5, centroid(630,620)).
opencv_morphology(r1, opening_area(282360), closing_area(284756), gradient_area(9272)).
opencv_shape_metrics(r1, contour_area(289799.0), hull_area(408321.0), solidity(0.709733), circularity(0.278684), extent(0.707517), aspect_ratio(1.0)).
opencv_contour(r1, c0, outer, 289799.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 439.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 439.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 8839.0).
opencv_contour_hierarchy(r1, c3, next(none), previous(c2), child(none), parent(c0)).
opencv_morphology(r2, opening_area(28779), closing_area(29289), gradient_area(2882)).
opencv_shape_metrics(r2, contour_area(28079.5), hull_area(76171.0), solidity(0.368638), circularity(0.168748), extent(0.243113), aspect_ratio(1.060606)).
opencv_contour(r2, c0, outer, 28079.5).
opencv_contour_hierarchy(r2, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r3, opening_area(60371), closing_area(61057), gradient_area(5094)).
opencv_shape_metrics(r3, contour_area(78891.5), hull_area(91411.0), solidity(0.863042), circularity(0.376036), extent(0.770425), aspect_ratio(1.0)).
opencv_contour(r3, c0, outer, 78891.5).
opencv_contour_hierarchy(r3, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r3, c1, hole, 959.0).
opencv_contour_hierarchy(r3, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r3, c2, hole, 17847.0).
opencv_contour_hierarchy(r3, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r3, c3, hole, 959.0).
opencv_contour_hierarchy(r3, c3, next(none), previous(c2), child(none), parent(c0)).
opencv_morphology(r4, opening_area(796), closing_area(916), gradient_area(312)).
opencv_shape_metrics(r4, contour_area(841.0), hull_area(841.0), solidity(1.0), circularity(0.785398), extent(0.934444), aspect_ratio(1.0)).
opencv_contour(r4, c0, outer, 841.0).
opencv_contour_hierarchy(r4, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r4, c1, hole, 119.0).
opencv_contour_hierarchy(r4, c1, next(none), previous(none), child(none), parent(c0)).
opencv_morphology(r5, opening_area(96), closing_area(132), gradient_area(76)).
opencv_shape_metrics(r5, contour_area(81.0), hull_area(81.0), solidity(1.0), circularity(0.785398), extent(0.81), aspect_ratio(1.0)).
opencv_contour(r5, c0, outer, 81.0).
opencv_contour_hierarchy(r5, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r6, opening_area(14993), closing_area(15295), gradient_area(1390)).
opencv_shape_metrics(r6, contour_area(14652.5), hull_area(22151.0), solidity(0.661483), circularity(0.382031), extent(0.488417), aspect_ratio(1.333333)).
opencv_contour(r6, c0, outer, 14652.5).
opencv_contour_hierarchy(r6, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r7, opening_area(996), closing_area(1132), gradient_area(276)).
opencv_shape_metrics(r7, contour_area(931.0), hull_area(931.0), solidity(1.0), circularity(0.632531), extent(0.931), aspect_ratio(2.5)).
opencv_contour(r7, c0, outer, 931.0).
opencv_contour_hierarchy(r7, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r8, opening_area(796), closing_area(912), gradient_area(236)).
opencv_shape_metrics(r8, contour_area(741.0), hull_area(741.0), solidity(1.0), circularity(0.69201), extent(0.92625), aspect_ratio(0.5)).
opencv_contour(r8, c0, outer, 741.0).
opencv_contour_hierarchy(r8, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r9, opening_area(1496), closing_area(1652), gradient_area(316)).
opencv_shape_metrics(r9, contour_area(1421.0), hull_area(1421.0), solidity(1.0), circularity(0.733761), extent(0.947333), aspect_ratio(1.666667)).
opencv_contour(r9, c0, outer, 1421.0).
opencv_contour_hierarchy(r9, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r11, opening_area(796), closing_area(916), gradient_area(312)).
opencv_shape_metrics(r11, contour_area(841.0), hull_area(841.0), solidity(1.0), circularity(0.785398), extent(0.934444), aspect_ratio(1.0)).
opencv_contour(r11, c0, outer, 841.0).
opencv_contour_hierarchy(r11, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r11, c1, hole, 119.0).
opencv_contour_hierarchy(r11, c1, next(none), previous(none), child(none), parent(c0)).
opencv_morphology(r12, opening_area(96), closing_area(132), gradient_area(76)).
opencv_shape_metrics(r12, contour_area(81.0), hull_area(81.0), solidity(1.0), circularity(0.785398), extent(0.81), aspect_ratio(1.0)).
opencv_contour(r12, c0, outer, 81.0).
opencv_contour_hierarchy(r12, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r13, opening_area(8094), closing_area(8364), gradient_area(872)).
opencv_shape_metrics(r13, contour_area(7882.0), hull_area(9081.0), solidity(0.867966), circularity(0.523854), extent(0.750667), aspect_ratio(2.142857)).
opencv_contour(r13, c0, outer, 7882.0).
opencv_contour_hierarchy(r13, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r14, opening_area(8396), closing_area(9272), gradient_area(1756)).
opencv_shape_metrics(r14, contour_area(7961.0), hull_area(7961.0), solidity(1.0), circularity(0.130367), extent(0.947738), aspect_ratio(21.0)).
opencv_contour(r14, c0, outer, 7961.0).
opencv_contour_hierarchy(r14, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r15, opening_area(396), closing_area(472), gradient_area(156)).
opencv_shape_metrics(r15, contour_area(361.0), hull_area(361.0), solidity(1.0), circularity(0.785398), extent(0.9025), aspect_ratio(1.0)).
opencv_contour(r15, c0, outer, 361.0).
opencv_contour_hierarchy(r15, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r16, opening_area(396), closing_area(472), gradient_area(156)).
opencv_shape_metrics(r16, contour_area(361.0), hull_area(361.0), solidity(1.0), circularity(0.785398), extent(0.9025), aspect_ratio(1.0)).
opencv_contour(r16, c0, outer, 361.0).
opencv_contour_hierarchy(r16, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r17, opening_area(396), closing_area(472), gradient_area(156)).
opencv_shape_metrics(r17, contour_area(361.0), hull_area(361.0), solidity(1.0), circularity(0.785398), extent(0.9025), aspect_ratio(1.0)).
opencv_contour(r17, c0, outer, 361.0).
opencv_contour_hierarchy(r17, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r2, 2).
opencv_watershed_segment(r2, ws1, 14702, centroid(235,33)).
opencv_watershed_segment(r2, ws2, 12639, centroid(66,174)).
opencv_watershed_count(r3, 4).
opencv_watershed_segment(r3, ws1, 36625, centroid(177,168)).
opencv_watershed_segment(r3, ws2, 5442, centroid(361,134)).
opencv_watershed_segment(r3, ws3, 5566, centroid(363,220)).
opencv_watershed_segment(r3, ws4, 10012, centroid(297,282)).
opencv_watershed_count(r4, 1).
opencv_watershed_segment(r4, ws1, 644, centroid(114,74)).
opencv_watershed_count(r5, 1).
opencv_watershed_segment(r5, ws1, 64, centroid(114,74)).
opencv_watershed_count(r6, 1).
opencv_watershed_segment(r6, ws1, 14307, centroid(248,191)).
opencv_watershed_count(r7, 1).
opencv_watershed_segment(r7, ws1, 864, centroid(214,160)).
opencv_watershed_count(r8, 1).
opencv_watershed_segment(r8, ws1, 684, centroid(400,170)).
opencv_watershed_count(r9, 1).
opencv_watershed_segment(r9, ws1, 1344, centroid(214,184)).
opencv_watershed_count(r11, 1).
opencv_watershed_segment(r11, ws1, 644, centroid(314,224)).
opencv_watershed_count(r12, 1).
opencv_watershed_segment(r12, ws1, 64, centroid(314,224)).
opencv_watershed_count(r13, 1).
opencv_watershed_segment(r13, ws1, 7666, centroid(218,327)).
opencv_watershed_count(r14, 1).
opencv_watershed_segment(r14, ws1, 7524, centroid(340,620)).
opencv_watershed_count(r15, 1).
opencv_watershed_segment(r15, ws1, 324, centroid(570,620)).
opencv_watershed_count(r16, 1).
opencv_watershed_segment(r16, ws1, 324, centroid(600,620)).
opencv_watershed_count(r17, 1).
opencv_watershed_segment(r17, ws1, 324, centroid(630,620)).
