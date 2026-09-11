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
polygon(r1, [xy(0,0),xy(0,639),xy(639,639),xy(639,630),xy(619,629),xy(619,610),xy(639,609),xy(639,0),xy(370,0),xy(370,9),xy(379,9),xy(380,19),xy(390,20),xy(390,39),xy(400,40),xy(400,79),xy(410,80),xy(410,159),xy(400,160),xy(400,199),xy(390,200),xy(390,219),xy(380,220),xy(379,230),xy(370,230),xy(370,249),xy(360,250),xy(360,259),xy(350,260),xy(350,269),xy(340,270),xy(339,280),xy(320,280),xy(320,289),xy(310,290),xy(309,300),xy(290,300),xy(289,310),xy(250,310),xy(249,320),xy(170,320),xy(169,310),xy(130,310),xy(129,300),xy(110,300),xy(109,290),xy(99,289),xy(99,280),xy(80,280),xy(79,270),xy(70,270),xy(69,260),xy(60,260),xy(59,250),xy(49,249),xy(49,230),xy(39,229),xy(39,10),xy(49,9),xy(49,0),xy(0,0)]).
hole(r1, [xy(589,610),xy(609,609),xy(610,629),xy(590,630),xy(589,610)]).
hole(r1, [xy(559,610),xy(579,609),xy(580,629),xy(560,630),xy(559,610)]).
hole(r1, [xy(129,610),xy(549,609),xy(550,629),xy(130,630),xy(129,610)]).
midline(r1, [xy(375,4),xy(384,4),xy(389,9),xy(399,9),xy(409,19),xy(419,19),xy(439,39),xy(449,39),xy(524,114),xy(524,274),xy(519,280),xy(519,319),xy(514,325),xy(514,344),xy(509,350),xy(509,359),xy(504,365),xy(504,384),xy(499,390),xy(499,399),xy(494,405),xy(494,414),xy(489,420),xy(489,429),xy(480,438),xy(478,449),xy(470,449),xy(464,454),xy(445,454),xy(439,459),xy(400,459),xy(394,464),xy(144,464),xy(84,404),xy(84,394),xy(64,374),xy(64,364),xy(54,354),xy(54,344),xy(49,339),xy(49,329),xy(39,319),xy(39,309),xy(34,304),xy(34,294),xy(29,289),xy(29,279),xy(24,274),xy(24,254),xy(19,249),xy(19,20),xy(33,5),xy(44,4)]).
midline(r1, [xy(504,385),xy(501,388)]).
midline(r1, [xy(514,345),xy(511,348)]).
midline(r1, [xy(496,403),xy(499,400)]).
midline(r1, [xy(519,320),xy(516,323)]).
midline(r1, [xy(506,363),xy(509,360)]).
midline(r1, [xy(521,278),xy(524,275)]).
midline(r1, [xy(443,456),xy(440,459)]).
midline(r1, [xy(479,449),xy(554,524),xy(553,634),xy(124,634),xy(64,574),xy(64,545),xy(144,465)]).
midline(r1, [xy(555,525),xy(584,554),xy(584,633),xy(554,634)]).
midline(r1, [xy(468,451),xy(465,454)]).
midline(r1, [xy(494,415),xy(491,418)]).
midline(r1, [xy(481,438),xy(489,430)]).
midline(r1, [xy(584,634),xy(614,633),xy(614,584),xy(585,555)]).
midline(r1, [xy(614,634),xy(634,634)]).
midline(r1, [xy(398,461),xy(395,464)]).
fillpoint(r1, xy(451,421), 180.5).
fillpoint(r1, xy(447,422), 179.5).
fillpoint(r1, xy(432,428), 173.8).
fillpoint(r1, xy(427,429), 172.9).
fillpoint(r1, xy(423,430), 171.9).
fillpoint(r1, xy(418,431), 170.9).
fillpoint(r1, xy(414,432), 170.0).
fillpoint(r1, xy(464,397), 168.1).
fillpoint(r1, xy(407,434), 168.1).
fillpoint(r1, xy(403,435), 167.1).
fillpoint(r1, xy(398,436), 166.2).
fillpoint(r1, xy(394,437), 165.2).
fillpoint(r1, xy(389,438), 164.3).
fillpoint(r1, xy(469,387), 163.3).
fillpoint(r1, xy(384,439), 163.3).
fillpoint(r1, xy(470,383), 162.4).
fillpoint(r1, xy(380,440), 162.4).
fillpoint(r1, xy(375,441), 161.4).
fillpoint(r1, xy(370,442), 160.4).
fillpoint(r1, xy(366,443), 159.5).
fillpoint(r1, xy(361,444), 158.5).
fillpoint(r1, xy(475,373), 157.6).
fillpoint(r1, xy(357,445), 157.6).
fillpoint(r1, xy(476,368), 156.6).
fillpoint(r1, xy(352,446), 156.6).
fillpoint(r1, xy(347,447), 155.7).
fillpoint(r1, xy(343,448), 154.7).
fillpoint(r1, xy(338,449), 153.8).
fillpoint(r1, xy(334,450), 152.8).
fillpoint(r1, xy(481,358), 151.8).
fillpoint(r1, xy(329,451), 151.8).
fillpoint(r1, xy(482,354), 150.9).
fillpoint(r1, xy(324,452), 150.9).
fillpoint(r1, xy(483,349), 149.9).
fillpoint(r1, xy(320,453), 149.9).
fillpoint(r1, xy(484,344), 149.0).
fillpoint(r1, xy(315,454), 149.0).
fillpoint(r1, xy(485,340), 148.0).
fillpoint(r1, xy(311,455), 148.0).
fillpoint(r1, xy(306,456), 147.1).
fillpoint(r1, xy(487,334), 146.1).
fillpoint(r1, xy(301,457), 146.1).
fillpoint(r1, xy(488,329), 145.2).
fillpoint(r1, xy(297,458), 145.2).
fillpoint(r1, xy(292,459), 144.2).
fillpoint(r1, xy(271,460), 143.3).
fillpoint(r1, xy(149,460), 143.3).
fillpoint(r1, xy(153,461), 142.3).
fillpoint(r1, xy(266,461), 142.3).
fillpoint(r1, xy(158,462), 141.3).
fillpoint(r1, xy(261,462), 141.3).
fillpoint(r1, xy(493,319), 140.4).
fillpoint(r1, xy(163,463), 140.4).
fillpoint(r1, xy(257,463), 140.4).
fillpoint(r1, xy(494,314), 139.4).
fillpoint(r1, xy(167,464), 139.4).
fillpoint(r1, xy(252,464), 139.4).
fillpoint(r1, xy(495,310), 138.5).
fillpoint(r1, xy(171,465), 138.5).
fillpoint(r1, xy(496,305), 137.5).
fillpoint(r1, xy(497,300), 136.6).
fillpoint(r1, xy(499,294), 134.7).
fillpoint(r1, xy(500,290), 133.7).
fillpoint(r1, xy(501,285), 132.7).
fillpoint(r1, xy(502,280), 131.8).
fillpoint(r1, xy(503,276), 130.8).
fillpoint(r1, xy(504,271), 129.9).
fillpoint(r1, xy(505,267), 128.9).
fillpoint(r1, xy(506,262), 128.0).
fillpoint(r1, xy(507,257), 127.0).
fillpoint(r1, xy(508,253), 126.1).
fillpoint(r1, xy(509,248), 125.1).
fillpoint(r1, xy(510,244), 124.2).
fillpoint(r1, xy(511,239), 123.2).
fillpoint(r1, xy(512,234), 122.2).
fillpoint(r1, xy(513,230), 121.3).
fillpoint(r1, xy(514,225), 120.3).
fillpoint(r1, xy(515,221), 119.4).
fillpoint(r1, xy(516,216), 118.4).
fillpoint(r1, xy(517,211), 117.5).
fillpoint(r1, xy(518,207), 116.5).
fillpoint(r1, xy(519,202), 115.6).
fillpoint(r1, xy(520,189), 114.6).
fillpoint(r1, xy(521,176), 113.6).
fillpoint(r1, xy(522,171), 112.7).
fillpoint(r1, xy(523,167), 111.7).
fillpoint(r1, xy(524,162), 110.8).
fillpoint(r1, xy(525,136), 109.8).
fillpoint(r1, xy(75,561), 72.6).
fillpoint(r1, xy(74,565), 71.6).
fillpoint(r1, xy(64,343), 62.1).
fillpoint(r1, xy(63,339), 61.1).
fillpoint(r1, xy(58,329), 56.3).
border(r1).
region(r3, '#2ecc40', 51400, centroid(231,169)).
perimeter(r3, 2300).
polygon(r3, [xy(90,50),xy(90,279),xy(99,279),xy(100,289),xy(110,290),xy(110,299),xy(129,299),xy(130,309),xy(139,309),xy(140,299),xy(309,299),xy(309,290),xy(319,289),xy(320,279),xy(339,279),xy(339,270),xy(349,269),xy(349,260),xy(359,259),xy(360,249),xy(369,249),xy(369,230),xy(379,229),xy(380,219),xy(389,219),xy(389,150),xy(409,149),xy(409,90),xy(399,89),xy(399,50),xy(390,50),xy(389,100),xy(340,100),xy(339,50),xy(90,50)]).
hole(r3, [xy(299,210),xy(329,209),xy(330,239),xy(300,240),xy(299,210)]).
hole(r3, [xy(139,249),xy(140,199),xy(239,199),xy(239,150),xy(189,149),xy(190,99),xy(289,99),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250),xy(139,249)]).
hole(r3, [xy(99,60),xy(129,59),xy(130,89),xy(100,90),xy(99,60)]).
midline(r3, [xy(394,55),xy(394,94),xy(399,99),xy(399,109),xy(384,124),xy(315,124),xy(313,74),xy(165,74),xy(159,79),xy(134,54),xy(95,54),xy(94,94),xy(139,139),xy(139,149),xy(114,175),xy(114,254),xy(119,259),xy(119,269),xy(129,269),xy(134,274),xy(134,304)]).
midline(r3, [xy(163,76),xy(159,80),xy(159,119),xy(140,138),xy(159,120)]).
midline(r3, [xy(116,173),xy(140,150),xy(164,174),xy(214,174)]).
midline(r3, [xy(385,124),xy(399,110)]).
midline(r3, [xy(364,125),xy(364,194),xy(359,200),xy(359,209),xy(349,219),xy(334,204),xy(294,205),xy(294,244),xy(309,259),xy(299,269),xy(290,269),xy(284,274),xy(135,274)]).
midline(r3, [xy(285,274),xy(288,271)]).
midline(r3, [xy(300,269),xy(310,259),xy(320,259),xy(325,254),xy(335,254),xy(344,245),xy(344,235),xy(349,230),xy(349,220),xy(359,210)]).
midline(r3, [xy(364,195),xy(361,198)]).
fillpoint(r3, xy(140,143), 47.8).
fillpoint(r3, xy(155,111), 33.4).
fillpoint(r3, xy(163,83), 32.5).
fillpoint(r3, xy(156,106), 32.5).
fillpoint(r3, xy(162,88), 31.5).
fillpoint(r3, xy(157,101), 31.5).
fillpoint(r3, xy(161,91), 31.4).
fillpoint(r3, xy(158,98), 31.4).
fillpoint(r3, xy(160,93), 31.3).
fillpoint(r3, xy(159,96), 31.3).
fillpoint(r3, xy(364,132), 31.3).
fillpoint(r3, xy(310,79), 28.6).
fillpoint(r3, xy(319,120), 28.6).
fillpoint(r3, xy(173,78), 27.7).
fillpoint(r3, xy(306,78), 27.7).
fillpoint(r3, xy(311,83), 27.7).
fillpoint(r3, xy(318,116), 27.7).
fillpoint(r3, xy(323,121), 27.7).
fillpoint(r3, xy(356,128), 27.7).
fillpoint(r3, xy(373,128), 27.7).
fillpoint(r3, xy(173,171), 27.7).
fillpoint(r3, xy(118,183), 27.7).
fillpoint(r3, xy(178,77), 26.7).
fillpoint(r3, xy(301,77), 26.7).
fillpoint(r3, xy(312,88), 26.7).
fillpoint(r3, xy(317,111), 26.7).
fillpoint(r3, xy(328,122), 26.7).
fillpoint(r3, xy(351,127), 26.7).
fillpoint(r3, xy(378,127), 26.7).
fillpoint(r3, xy(178,172), 26.7).
fillpoint(r3, xy(117,188), 26.7).
fillpoint(r3, xy(131,273), 26.6).
fillpoint(r3, xy(117,260), 26.5).
fillpoint(r3, xy(129,272), 26.5).
fillpoint(r3, xy(133,274), 26.5).
fillpoint(r3, xy(121,268), 26.0).
fillpoint(r3, xy(119,263), 25.9).
fillpoint(r3, xy(120,266), 25.9).
fillpoint(r3, xy(123,269), 25.9).
fillpoint(r3, xy(126,270), 25.9).
fillpoint(r3, xy(183,76), 25.8).
fillpoint(r3, xy(297,76), 25.8).
fillpoint(r3, xy(313,93), 25.8).
fillpoint(r3, xy(316,107), 25.8).
fillpoint(r3, xy(333,123), 25.8).
fillpoint(r3, xy(347,126), 25.8).
fillpoint(r3, xy(383,126), 25.8).
fillpoint(r3, xy(183,173), 25.8).
fillpoint(r3, xy(116,193), 25.8).
fillpoint(r3, xy(116,257), 25.8).
fillpoint(r3, xy(187,75), 24.8).
fillpoint(r3, xy(292,75), 24.8).
fillpoint(r3, xy(314,97), 24.8).
fillpoint(r3, xy(315,102), 24.8).
fillpoint(r3, xy(337,124), 24.8).
fillpoint(r3, xy(342,125), 24.8).
fillpoint(r3, xy(187,174), 24.8).
fillpoint(r3, xy(115,197), 24.8).
fillpoint(r3, xy(115,252), 24.8).
fillpoint(r3, xy(364,201), 24.7).
fillpoint(r3, xy(291,274), 24.7).
fillpoint(r3, xy(191,75), 23.9).
fillpoint(r3, xy(364,175), 23.9).
fillpoint(r3, xy(191,175), 23.9).
fillpoint(r3, xy(114,225), 23.9).
fillpoint(r3, xy(361,206), 23.9).
fillpoint(r3, xy(296,271), 23.9).
fillpoint(r3, xy(141,275), 23.9).
fillpoint(r3, xy(362,204), 23.8).
fillpoint(r3, xy(360,208), 23.8).
fillpoint(r3, xy(298,270), 23.8).
fillpoint(r3, xy(294,272), 23.8).
fillpoint(r3, xy(359,210), 23.7).
fillpoint(r3, xy(300,269), 23.7).
fillpoint(r3, xy(353,216), 22.0).
fillpoint(r3, xy(352,218), 22.0).
fillpoint(r3, xy(308,262), 22.0).
fillpoint(r3, xy(306,263), 22.0).
fillpoint(r3, xy(351,223), 21.0).
fillpoint(r3, xy(313,261), 21.0).
fillpoint(r3, xy(350,227), 20.1).
fillpoint(r3, xy(317,260), 20.1).
fillpoint(r3, xy(349,233), 19.1).
fillpoint(r3, xy(321,260), 19.1).
fillpoint(r3, xy(346,241), 17.1).
fillpoint(r3, xy(331,256), 17.1).
fillpoint(r3, xy(345,243), 16.9).
fillpoint(r3, xy(333,255), 16.9).
fillpoint(r3, xy(344,245), 16.8).
fillpoint(r3, xy(335,254), 16.8).
region(r2, '#ffdc00', 30100, centroid(175,74)).
perimeter(r2, 1380).
polygon(r2, [xy(40,229),xy(50,230),xy(50,249),xy(59,249),xy(60,259),xy(69,259),xy(70,269),xy(79,269),xy(80,279),xy(89,279),xy(90,49),xy(339,49),xy(340,99),xy(389,99),xy(389,50),xy(399,49),xy(399,40),xy(389,39),xy(389,20),xy(380,20),xy(379,10),xy(369,9),xy(369,0),xy(50,0),xy(50,9),xy(40,10),xy(40,229)]).
midline(r2, [xy(364,74),xy(364,44),xy(359,39),xy(359,30),xy(349,29),xy(344,24),xy(73,25),xy(64,35),xy(64,204),xy(69,209),xy(69,229),xy(74,234),xy(74,244),xy(79,249),xy(79,259),xy(84,264),xy(84,274)]).
midline(r2, [xy(394,44),xy(365,44)]).
midline(r2, [xy(66,33),xy(73,26)]).
fillpoint(r2, xy(70,29), 28.3).
fillpoint(r2, xy(69,30), 28.3).
fillpoint(r2, xy(73,28), 27.7).
fillpoint(r2, xy(68,33), 27.7).
fillpoint(r2, xy(78,27), 26.7).
fillpoint(r2, xy(67,38), 26.7).
fillpoint(r2, xy(363,41), 26.6).
fillpoint(r2, xy(350,27), 26.5).
fillpoint(r2, xy(362,39), 26.5).
fillpoint(r2, xy(364,43), 26.5).
fillpoint(r2, xy(358,31), 26.0).
fillpoint(r2, xy(353,29), 25.9).
fillpoint(r2, xy(356,30), 25.9).
fillpoint(r2, xy(359,33), 25.9).
fillpoint(r2, xy(360,36), 25.9).
fillpoint(r2, xy(83,26), 25.8).
fillpoint(r2, xy(347,26), 25.8).
fillpoint(r2, xy(66,43), 25.8).
fillpoint(r2, xy(87,25), 24.8).
fillpoint(r2, xy(342,25), 24.8).
fillpoint(r2, xy(65,47), 24.8).
fillpoint(r2, xy(91,25), 23.9).
fillpoint(r2, xy(65,131), 23.9).
fillpoint(r2, xy(365,63), 23.9).
fillpoint(r2, xy(67,218), 22.0).
fillpoint(r2, xy(68,223), 21.0).
fillpoint(r2, xy(69,227), 20.1).
fillpoint(r2, xy(69,233), 19.1).
fillpoint(r2, xy(73,243), 16.2).
fillpoint(r2, xy(78,253), 11.5).
fillpoint(r2, xy(79,257), 10.5).
border(r2).
region(r8, '#ffdc00', 15000, centroid(248,191)).
perimeter(r8, 700).
polygon(r8, [xy(339,150),xy(290,150),xy(289,100),xy(240,100),xy(240,199),xy(140,200),xy(140,249),xy(289,249),xy(289,200),xy(339,199),xy(339,150)]).
midline(r8, [xy(165,224),xy(263,224),xy(264,125)]).
midline(r8, [xy(265,174),xy(314,174)]).
fillpoint(r8, xy(272,175), 31.3).
fillpoint(r8, xy(260,220), 28.6).
fillpoint(r8, xy(268,166), 27.7).
fillpoint(r8, xy(268,183), 27.7).
fillpoint(r8, xy(261,216), 27.7).
fillpoint(r8, xy(256,221), 27.7).
fillpoint(r8, xy(267,161), 26.7).
fillpoint(r8, xy(267,188), 26.7).
fillpoint(r8, xy(262,211), 26.7).
fillpoint(r8, xy(251,222), 26.7).
fillpoint(r8, xy(266,157), 25.8).
fillpoint(r8, xy(266,193), 25.8).
fillpoint(r8, xy(263,207), 25.8).
fillpoint(r8, xy(247,223), 25.8).
fillpoint(r8, xy(265,152), 24.8).
fillpoint(r8, xy(265,197), 24.8).
fillpoint(r8, xy(264,202), 24.8).
fillpoint(r8, xy(242,224), 24.8).
fillpoint(r8, xy(265,136), 23.9).
fillpoint(r8, xy(291,175), 23.9).
fillpoint(r8, xy(164,225), 23.9).
region(r16, '#5a5a5a', 8000, centroid(350,620)).
perimeter(r16, 840).
polygon(r16, [xy(150,610),xy(150,629),xy(549,629),xy(549,610),xy(150,610)]).
midline(r16, [xy(539,619),xy(160,619)]).
fillpoint(r16, xy(159,620), 9.6).
region(r14, '#ffdc00', 2300, centroid(213,308)).
perimeter(r14, 340).
polygon(r14, [xy(140,300),xy(140,309),xy(169,309),xy(170,319),xy(249,319),xy(250,309),xy(289,309),xy(289,300),xy(140,300)]).
midline(r14, [xy(284,304),xy(245,304),xy(239,309),xy(179,309),xy(174,304),xy(145,304)]).
midline(r14, [xy(243,306),xy(240,309)]).
fillpoint(r14, xy(179,310), 9.6).
fillpoint(r14, xy(172,305), 5.7).
fillpoint(r14, xy(247,305), 5.7).
fillpoint(r14, xy(144,305), 4.8).
fillpoint(r14, xy(251,305), 4.8).
region(r9, '#870c25', 1500, centroid(214,134)).
perimeter(r9, 160).
polygon(r9, [xy(190,120),xy(190,149),xy(239,149),xy(239,120),xy(190,120)]).
midline(r9, [xy(205,134),xy(224,134)]).
fillpoint(r9, xy(204,135), 14.3).
region(r7, '#bebebe', 1000, centroid(214,110)).
perimeter(r7, 140).
polygon(r7, [xy(190,100),xy(190,119),xy(239,119),xy(239,100),xy(190,100)]).
midline(r7, [xy(200,109),xy(229,109)]).
fillpoint(r7, xy(199,110), 9.6).
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
region(r12, '#5a5a5a', 800, centroid(314,224)).
perimeter(r12, 160).
polygon(r12, [xy(300,210),xy(300,239),xy(329,239),xy(329,210),xy(300,210)]).
hole(r12, [xy(309,220),xy(319,219),xy(320,229),xy(310,230),xy(309,220)]).
midline(r12, [xy(319,214),xy(304,215),xy(304,234),xy(324,233),xy(324,215),xy(320,214)]).
fillpoint(r12, xy(307,215), 5.7).
fillpoint(r12, xy(324,215), 5.7).
fillpoint(r12, xy(305,234), 5.7).
fillpoint(r12, xy(322,234), 5.7).
fillpoint(r12, xy(311,215), 4.8).
fillpoint(r12, xy(304,225), 4.8).
fillpoint(r12, xy(324,225), 4.8).
fillpoint(r12, xy(311,235), 4.8).
region(r10, '#ffdc00', 500, centroid(396,166)).
perimeter(r10, 120).
polygon(r10, [xy(409,150),xy(390,150),xy(390,189),xy(399,189),xy(399,160),xy(409,159),xy(409,150)]).
midline(r10, [xy(404,154),xy(394,155),xy(394,184)]).
fillpoint(r10, xy(397,155), 5.7).
fillpoint(r10, xy(401,155), 4.8).
fillpoint(r10, xy(395,173), 4.8).
region(r15, '#2ecc40', 400, centroid(140,620)).
perimeter(r15, 80).
polygon(r15, [xy(130,610),xy(130,629),xy(149,629),xy(149,610),xy(130,610)]).
midline(r15, [xy(139,619)]).
fillpoint(r15, xy(139,620), 9.6).
region(r17, '#7fdbff', 400, centroid(570,620)).
perimeter(r17, 80).
polygon(r17, [xy(560,610),xy(560,629),xy(579,629),xy(579,610),xy(560,610)]).
midline(r17, [xy(569,619)]).
fillpoint(r17, xy(569,620), 9.6).
region(r18, '#7fdbff', 400, centroid(600,620)).
perimeter(r18, 80).
polygon(r18, [xy(590,610),xy(590,629),xy(609,629),xy(609,610),xy(590,610)]).
midline(r18, [xy(599,619)]).
fillpoint(r18, xy(599,620), 9.6).
region(r19, '#7fdbff', 400, centroid(630,620)).
perimeter(r19, 80).
polygon(r19, [xy(620,610),xy(620,629),xy(639,629),xy(639,610),xy(620,610)]).
midline(r19, [xy(629,619)]).
fillpoint(r19, xy(629,620), 9.6).
border(r19).
region(r5, '#2ecc40', 100, centroid(114,74)).
perimeter(r5, 40).
polygon(r5, [xy(110,70),xy(110,79),xy(119,79),xy(119,70),xy(110,70)]).
midline(r5, [xy(114,74)]).
fillpoint(r5, xy(114,75), 4.8).
region(r13, '#2ecc40', 100, centroid(314,224)).
perimeter(r13, 40).
polygon(r13, [xy(310,220),xy(310,229),xy(319,229),xy(319,220),xy(310,220)]).
midline(r13, [xy(314,224)]).
fillpoint(r13, xy(314,225), 4.8).

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
opencv_component(cc1, [r2,r3,r4,r5,r7,r8,r9,r10,r12,r13,r14]).
opencv_component_area(cc1, 103600).
opencv_component_centroid(cc1, centroid(217,146)).
opencv_component(cc2, [r15,r16]).
opencv_component_area(cc2, 8400).
opencv_component_centroid(cc2, centroid(340,620)).
opencv_component(cc3, [r17]).
opencv_component_area(cc3, 400).
opencv_component_centroid(cc3, centroid(570,620)).
opencv_component(cc4, [r18]).
opencv_component_area(cc4, 400).
opencv_component_centroid(cc4, centroid(600,620)).
opencv_component(cc5, [r19]).
opencv_component_area(cc5, 400).
opencv_component_centroid(cc5, centroid(630,620)).
opencv_morphology(r1, opening_area(296168), closing_area(298448), gradient_area(8688)).
opencv_shape_metrics(r1, contour_area(303745.0), hull_area(408321.0), solidity(0.743888), circularity(0.346376), extent(0.741565), aspect_ratio(1.0)).
opencv_contour(r1, c0, outer, 303745.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 439.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 439.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 8839.0).
opencv_contour_hierarchy(r1, c3, next(none), previous(c2), child(none), parent(c0)).
opencv_morphology(r2, opening_area(30085), closing_area(30663), gradient_area(2734)).
opencv_shape_metrics(r2, contour_area(29416.5), hull_area(69711.0), solidity(0.421978), circularity(0.197079), extent(0.29183), aspect_ratio(1.285714)).
opencv_contour(r2, c0, outer, 29416.5).
opencv_contour_hierarchy(r2, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r3, opening_area(51377), closing_area(51981), gradient_area(4546)).
opencv_shape_metrics(r3, contour_area(70078.5), hull_area(75121.0), solidity(0.932875), circularity(0.566126), extent(0.84229), aspect_ratio(1.230769)).
opencv_contour(r3, c0, outer, 70078.5).
opencv_contour_hierarchy(r3, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r3, c1, hole, 959.0).
opencv_contour_hierarchy(r3, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r3, c2, hole, 17897.0).
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
opencv_morphology(r7, opening_area(996), closing_area(1132), gradient_area(276)).
opencv_shape_metrics(r7, contour_area(931.0), hull_area(931.0), solidity(1.0), circularity(0.632531), extent(0.931), aspect_ratio(2.5)).
opencv_contour(r7, c0, outer, 931.0).
opencv_contour_hierarchy(r7, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r8, opening_area(14993), closing_area(15295), gradient_area(1390)).
opencv_shape_metrics(r8, contour_area(14652.5), hull_area(22151.0), solidity(0.661483), circularity(0.382031), extent(0.488417), aspect_ratio(1.333333)).
opencv_contour(r8, c0, outer, 14652.5).
opencv_contour_hierarchy(r8, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r9, opening_area(1496), closing_area(1652), gradient_area(316)).
opencv_shape_metrics(r9, contour_area(1421.0), hull_area(1421.0), solidity(1.0), circularity(0.733761), extent(0.947333), aspect_ratio(1.666667)).
opencv_contour(r9, c0, outer, 1421.0).
opencv_contour_hierarchy(r9, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r10, opening_area(495), closing_area(573), gradient_area(234)).
opencv_shape_metrics(r10, contour_area(441.5), hull_area(591.0), solidity(0.747039), circularity(0.416507), extent(0.551875), aspect_ratio(0.5)).
opencv_contour(r10, c0, outer, 441.5).
opencv_contour_hierarchy(r10, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r12, opening_area(796), closing_area(916), gradient_area(312)).
opencv_shape_metrics(r12, contour_area(841.0), hull_area(841.0), solidity(1.0), circularity(0.785398), extent(0.934444), aspect_ratio(1.0)).
opencv_contour(r12, c0, outer, 841.0).
opencv_contour_hierarchy(r12, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r12, c1, hole, 119.0).
opencv_contour_hierarchy(r12, c1, next(none), previous(none), child(none), parent(c0)).
opencv_morphology(r13, opening_area(96), closing_area(132), gradient_area(76)).
opencv_shape_metrics(r13, contour_area(81.0), hull_area(81.0), solidity(1.0), circularity(0.785398), extent(0.81), aspect_ratio(1.0)).
opencv_contour(r13, c0, outer, 81.0).
opencv_contour_hierarchy(r13, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r14, opening_area(2294), closing_area(2544), gradient_area(672)).
opencv_shape_metrics(r14, contour_area(2132.0), hull_area(2481.0), solidity(0.859331), circularity(0.238975), extent(0.710667), aspect_ratio(7.5)).
opencv_contour(r14, c0, outer, 2132.0).
opencv_contour_hierarchy(r14, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r15, opening_area(396), closing_area(472), gradient_area(156)).
opencv_shape_metrics(r15, contour_area(361.0), hull_area(361.0), solidity(1.0), circularity(0.785398), extent(0.9025), aspect_ratio(1.0)).
opencv_contour(r15, c0, outer, 361.0).
opencv_contour_hierarchy(r15, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r16, opening_area(7996), closing_area(8832), gradient_area(1676)).
opencv_shape_metrics(r16, contour_area(7581.0), hull_area(7581.0), solidity(1.0), circularity(0.136309), extent(0.947625), aspect_ratio(20.0)).
opencv_contour(r16, c0, outer, 7581.0).
opencv_contour_hierarchy(r16, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r17, opening_area(396), closing_area(472), gradient_area(156)).
opencv_shape_metrics(r17, contour_area(361.0), hull_area(361.0), solidity(1.0), circularity(0.785398), extent(0.9025), aspect_ratio(1.0)).
opencv_contour(r17, c0, outer, 361.0).
opencv_contour_hierarchy(r17, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r18, opening_area(396), closing_area(472), gradient_area(156)).
opencv_shape_metrics(r18, contour_area(361.0), hull_area(361.0), solidity(1.0), circularity(0.785398), extent(0.9025), aspect_ratio(1.0)).
opencv_contour(r18, c0, outer, 361.0).
opencv_contour_hierarchy(r18, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r19, opening_area(396), closing_area(472), gradient_area(156)).
opencv_shape_metrics(r19, contour_area(361.0), hull_area(361.0), solidity(1.0), circularity(0.785398), extent(0.9025), aspect_ratio(1.0)).
opencv_contour(r19, c0, outer, 361.0).
opencv_contour_hierarchy(r19, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r2, 1).
opencv_watershed_segment(r2, ws1, 28735, centroid(175,73)).
opencv_watershed_count(r3, 2).
opencv_watershed_segment(r3, ws1, 36512, centroid(189,165)).
opencv_watershed_segment(r3, ws2, 12511, centroid(352,180)).
opencv_watershed_count(r4, 1).
opencv_watershed_segment(r4, ws1, 644, centroid(114,74)).
opencv_watershed_count(r5, 1).
opencv_watershed_segment(r5, ws1, 64, centroid(114,74)).
opencv_watershed_count(r7, 1).
opencv_watershed_segment(r7, ws1, 864, centroid(214,110)).
opencv_watershed_count(r8, 1).
opencv_watershed_segment(r8, ws1, 14307, centroid(248,191)).
opencv_watershed_count(r9, 1).
opencv_watershed_segment(r9, ws1, 1344, centroid(214,134)).
opencv_watershed_count(r10, 1).
opencv_watershed_segment(r10, ws1, 385, centroid(396,166)).
opencv_watershed_count(r12, 1).
opencv_watershed_segment(r12, ws1, 644, centroid(314,224)).
opencv_watershed_count(r13, 1).
opencv_watershed_segment(r13, ws1, 64, centroid(314,224)).
opencv_watershed_count(r14, 1).
opencv_watershed_segment(r14, ws1, 1966, centroid(213,308)).
opencv_watershed_count(r15, 1).
opencv_watershed_segment(r15, ws1, 324, centroid(140,620)).
opencv_watershed_count(r16, 1).
opencv_watershed_segment(r16, ws1, 7164, centroid(350,620)).
opencv_watershed_count(r17, 1).
opencv_watershed_segment(r17, ws1, 324, centroid(570,620)).
opencv_watershed_count(r18, 1).
opencv_watershed_segment(r18, ws1, 324, centroid(600,620)).
opencv_watershed_count(r19, 1).
opencv_watershed_segment(r19, ws1, 324, centroid(630,620)).
