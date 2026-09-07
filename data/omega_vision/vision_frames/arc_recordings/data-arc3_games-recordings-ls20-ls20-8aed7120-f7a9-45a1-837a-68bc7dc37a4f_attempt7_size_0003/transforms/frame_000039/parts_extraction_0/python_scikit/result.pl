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

region(r1, '#aaaaaa', 296200, centroid(364,360)).
perimeter(r1, 4580).
polygon(r1, [xy(50,0),xy(50,9),xy(40,10),xy(40,329),xy(49,330),xy(50,339),xy(59,340),xy(60,350),xy(79,350),xy(80,360),xy(119,360),xy(120,370),xy(199,370),xy(200,360),xy(239,360),xy(240,350),xy(259,350),xy(260,340),xy(269,340),xy(270,330),xy(289,330),xy(290,320),xy(299,320),xy(300,310),xy(309,310),xy(310,300),xy(320,299),xy(320,280),xy(329,280),xy(330,270),xy(340,269),xy(340,250),xy(350,249),xy(350,210),xy(360,209),xy(360,130),xy(350,129),xy(350,90),xy(340,89),xy(340,70),xy(330,70),xy(329,60),xy(320,59),xy(320,40),xy(310,40),xy(310,30),xy(300,30),xy(300,20),xy(290,20),xy(289,10),xy(270,10),xy(270,0)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(425,256),xy(408,242),xy(405,243),xy(374,231),xy(370,227),xy(370,229)]).
midline(r1, [xy(375,232),xy(376,233)]).
midline(r1, [xy(406,244),xy(413,247)]).
midline(r1, [xy(426,257),xy(486,317),xy(479,350),xy(458,415),xy(340,297),xy(338,296),xy(338,298)]).
midline(r1, [xy(487,316),xy(488,308),xy(428,248),xy(414,244)]).
midline(r1, [xy(389,238),xy(391,239)]).
midline(r1, [xy(458,416),xy(453,426),xy(392,451),xy(331,470),xy(283,480),xy(237,434),xy(233,416),xy(223,392),xy(225,392)]).
midline(r1, [xy(237,436),xy(238,440),xy(278,480),xy(277,482),xy(248,484),xy(220,489),xy(121,490),xy(100,468),xy(80,438),xy(58,414),xy(34,373),xy(27,352),xy(22,344),xy(19,329),xy(19,19),xy(34,6),xy(45,5)]).
midline(r1, [xy(77,435),xy(84,427),xy(85,418),xy(83,416),xy(88,413),xy(86,420)]).
midline(r1, [xy(279,481),xy(282,481)]).
midline(r1, [xy(120,490),xy(98,516),xy(77,552),xy(70,569),xy(73,571),xy(75,579),xy(77,579)]).
midline(r1, [xy(77,581),xy(92,602),xy(120,630),xy(130,635),xy(553,634),xy(555,630),xy(555,526),xy(455,425)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,632),xy(579,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(586,556),xy(615,585),xy(615,630),xy(613,634),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(83,431),xy(80,436),xy(82,436)]).
midline(r1, [xy(489,307),xy(499,232),xy(500,140),xy(473,114),xy(428,80),xy(416,92),xy(408,92),xy(401,98),xy(399,97),xy(397,99),xy(400,99)]).
midline(r1, [xy(428,79),xy(383,48),xy(354,35),xy(334,22),xy(305,10),xy(299,10),xy(293,5),xy(274,5)]).
midline(r1, [xy(434,86),xy(429,91),xy(419,93),xy(428,82)]).
midline(r1, [xy(402,99),xy(405,96),xy(405,98)]).
midline(r1, [xy(350,33),xy(341,41),xy(348,32)]).
midline(r1, [xy(415,93),xy(407,97)]).
midline(r1, [xy(615,633),xy(635,635)]).
fillpoint(r1, xy(455,425), 185.0).
fillpoint(r1, xy(460,411), 180.0).
fillpoint(r1, xy(461,408), 179.0).
fillpoint(r1, xy(462,405), 178.0).
fillpoint(r1, xy(463,402), 177.0).
fillpoint(r1, xy(464,399), 176.0).
fillpoint(r1, xy(428,436), 174.0).
fillpoint(r1, xy(467,389), 173.0).
fillpoint(r1, xy(468,385), 172.0).
fillpoint(r1, xy(470,378), 170.0).
fillpoint(r1, xy(477,356), 163.0).
fillpoint(r1, xy(479,349), 161.0).
fillpoint(r1, xy(480,345), 160.0).
fillpoint(r1, xy(481,341), 159.0).
fillpoint(r1, xy(391,451), 159.0).
fillpoint(r1, xy(482,337), 158.0).
fillpoint(r1, xy(483,332), 157.0).
fillpoint(r1, xy(484,328), 156.0).
fillpoint(r1, xy(485,324), 155.0).
fillpoint(r1, xy(486,320), 154.0).
fillpoint(r1, xy(487,316), 153.0).
fillpoint(r1, xy(373,457), 153.0).
fillpoint(r1, xy(488,311), 152.0).
fillpoint(r1, xy(489,306), 151.0).
fillpoint(r1, xy(366,459), 151.0).
fillpoint(r1, xy(490,301), 150.0).
fillpoint(r1, xy(491,296), 149.0).
fillpoint(r1, xy(492,289), 148.0).
fillpoint(r1, xy(493,281), 147.0).
fillpoint(r1, xy(352,463), 147.0).
fillpoint(r1, xy(494,270), 146.0).
fillpoint(r1, xy(349,464), 146.0).
fillpoint(r1, xy(495,260), 145.0).
fillpoint(r1, xy(346,465), 145.0).
fillpoint(r1, xy(496,255), 144.0).
fillpoint(r1, xy(343,466), 144.0).
fillpoint(r1, xy(497,248), 143.0).
fillpoint(r1, xy(340,467), 143.0).
fillpoint(r1, xy(498,240), 142.0).
fillpoint(r1, xy(499,229), 141.0).
fillpoint(r1, xy(499,174), 140.0).
fillpoint(r1, xy(330,470), 140.0).
fillpoint(r1, xy(326,471), 139.0).
fillpoint(r1, xy(322,472), 138.0).
fillpoint(r1, xy(318,473), 137.0).
fillpoint(r1, xy(313,474), 136.0).
fillpoint(r1, xy(305,476), 134.0).
fillpoint(r1, xy(301,477), 133.0).
fillpoint(r1, xy(297,478), 132.0).
fillpoint(r1, xy(292,479), 131.0).
fillpoint(r1, xy(288,480), 130.0).
fillpoint(r1, xy(282,481), 129.0).
fillpoint(r1, xy(276,482), 128.0).
fillpoint(r1, xy(268,483), 127.0).
fillpoint(r1, xy(258,484), 126.0).
fillpoint(r1, xy(246,485), 125.0).
fillpoint(r1, xy(241,486), 124.0).
fillpoint(r1, xy(235,487), 123.0).
fillpoint(r1, xy(227,488), 122.0).
fillpoint(r1, xy(217,489), 121.0).
fillpoint(r1, xy(120,490), 120.4).
fillpoint(r1, xy(131,490), 120.0).
border(r1).
region(r3, '#2ecc40', 49800, centroid(204,187)).
perimeter(r3, 2460).
polygon(r3, [xy(199,370),xy(120,370),xy(119,360),xy(90,359),xy(90,50),xy(319,50),xy(320,59),xy(329,60),xy(330,69),xy(340,70),xy(340,99),xy(350,100),xy(350,129),xy(360,130),xy(360,209),xy(350,210),xy(350,249),xy(340,250),xy(340,269),xy(330,270),xy(330,279),xy(320,280),xy(320,299),xy(310,300),xy(310,309),xy(300,310),xy(299,320),xy(290,319),xy(289,300),xy(140,300),xy(140,350),xy(240,350),xy(239,360),xy(200,360),xy(199,370)]).
hole(r3, [xy(290,249),xy(290,200),xy(339,200),xy(340,150),xy(290,150),xy(289,100),xy(240,100),xy(239,200),xy(190,199),xy(189,150),xy(140,150),xy(140,250),xy(290,249)]).
hole(r3, [xy(130,89),xy(129,60),xy(100,60),xy(100,90),xy(130,89)]).
hole(r3, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r3, [xy(215,157),xy(211,130),xy(202,114),xy(189,100),xy(180,100),xy(133,55),xy(95,55),xy(95,93),xy(122,122),xy(116,136),xy(114,150),xy(114,246),xy(115,259),xy(121,274),xy(115,290),xy(114,335),xy(125,346),xy(131,358),xy(134,359),xy(190,360),xy(200,354),xy(235,355)]).
midline(r3, [xy(190,100),xy(204,87),xy(226,76),xy(240,74),xy(298,75),xy(308,81),xy(311,87),xy(316,90),xy(314,92),xy(314,99),xy(318,119),xy(322,122),xy(331,116),xy(331,118)]).
midline(r3, [xy(122,275),xy(295,274),xy(298,281),xy(301,282),xy(299,284),xy(300,300),xy(295,306),xy(295,315)]).
midline(r3, [xy(123,122),xy(153,115),xy(178,99)]).
midline(r3, [xy(296,273),xy(308,261),xy(307,257),xy(295,243),xy(295,205),xy(329,204),xy(339,210),xy(350,197),xy(349,144),xy(323,123)]).
midline(r3, [xy(309,261),xy(325,255)]).
midline(r3, [xy(340,211),xy(340,239),xy(326,253)]).
midline(r3, [xy(214,158),xy(215,175)]).
fillpoint(r3, xy(178,100), 50.0).
fillpoint(r3, xy(122,122), 33.0).
fillpoint(r3, xy(143,118), 32.0).
fillpoint(r3, xy(126,121), 32.0).
fillpoint(r3, xy(121,275), 31.4).
fillpoint(r3, xy(138,119), 31.1).
fillpoint(r3, xy(131,120), 31.1).
fillpoint(r3, xy(319,120), 29.7).
fillpoint(r3, xy(221,78), 29.0).
fillpoint(r3, xy(318,118), 29.0).
fillpoint(r3, xy(321,121), 29.0).
fillpoint(r3, xy(118,131), 29.0).
fillpoint(r3, xy(211,131), 29.0).
fillpoint(r3, xy(118,268), 29.0).
fillpoint(r3, xy(118,281), 29.0).
fillpoint(r3, xy(224,77), 28.0).
fillpoint(r3, xy(317,115), 28.0).
fillpoint(r3, xy(117,134), 28.0).
fillpoint(r3, xy(212,134), 28.0).
fillpoint(r3, xy(117,265), 28.0).
fillpoint(r3, xy(117,284), 28.0).
fillpoint(r3, xy(227,76), 27.0).
fillpoint(r3, xy(316,112), 27.0).
fillpoint(r3, xy(116,137), 27.0).
fillpoint(r3, xy(213,137), 27.0).
fillpoint(r3, xy(116,262), 27.0).
fillpoint(r3, xy(116,287), 27.0).
fillpoint(r3, xy(300,76), 26.2).
fillpoint(r3, xy(313,89), 26.2).
fillpoint(r3, xy(232,75), 26.0).
fillpoint(r3, xy(298,75), 26.0).
fillpoint(r3, xy(314,92), 26.0).
fillpoint(r3, xy(315,108), 26.0).
fillpoint(r3, xy(115,142), 26.0).
fillpoint(r3, xy(214,142), 26.0).
fillpoint(r3, xy(115,258), 26.0).
fillpoint(r3, xy(115,292), 26.0).
fillpoint(r3, xy(295,274), 25.7).
fillpoint(r3, xy(304,79), 25.6).
fillpoint(r3, xy(305,80), 25.6).
fillpoint(r3, xy(307,81), 25.6).
fillpoint(r3, xy(308,82), 25.6).
fillpoint(r3, xy(309,84), 25.6).
fillpoint(r3, xy(310,85), 25.6).
fillpoint(r3, xy(241,75), 25.0).
fillpoint(r3, xy(114,200), 25.0).
fillpoint(r3, xy(215,163), 25.0).
fillpoint(r3, xy(141,275), 25.0).
fillpoint(r3, xy(115,318), 25.0).
fillpoint(r3, xy(307,262), 22.2).
fillpoint(r3, xy(324,255), 16.0).
region(r2, '#ffdc00', 27600, centroid(114,118)).
perimeter(r2, 1280).
polygon(r2, [xy(270,0),xy(270,10),xy(289,10),xy(290,19),xy(299,20),xy(300,29),xy(309,30),xy(310,39),xy(320,40),xy(320,49),xy(90,50),xy(89,360),xy(80,360),xy(79,350),xy(60,350),xy(60,340),xy(50,340),xy(50,330),xy(40,329),xy(40,10),xy(50,9),xy(50,0)]).
midline(r2, [xy(152,25),xy(90,24),xy(73,27),xy(68,22),xy(71,23)]).
midline(r2, [xy(153,25),xy(245,25),xy(247,23),xy(249,25),xy(248,22),xy(251,19),xy(250,22)]).
midline(r2, [xy(251,25),xy(262,29),xy(272,29),xy(294,39),xy(300,39),xy(306,44),xy(315,45)]).
midline(r2, [xy(70,26),xy(64,50),xy(64,310),xy(74,335),xy(84,346),xy(85,355)]).
fillpoint(r2, xy(71,28), 29.0).
fillpoint(r2, xy(70,29), 29.0).
fillpoint(r2, xy(69,30), 29.0).
fillpoint(r2, xy(68,31), 29.0).
fillpoint(r2, xy(74,27), 28.0).
fillpoint(r2, xy(67,34), 28.0).
fillpoint(r2, xy(77,26), 27.0).
fillpoint(r2, xy(66,37), 27.0).
fillpoint(r2, xy(82,25), 26.0).
fillpoint(r2, xy(65,42), 26.0).
fillpoint(r2, xy(91,25), 25.0).
fillpoint(r2, xy(64,181), 25.0).
fillpoint(r2, xy(263,29), 21.0).
fillpoint(r2, xy(271,30), 20.0).
fillpoint(r2, xy(284,34), 16.0).
fillpoint(r2, xy(74,334), 16.0).
fillpoint(r2, xy(295,39), 11.0).
border(r2).
region(r7, '#ffdc00', 15000, centroid(248,191)).
perimeter(r7, 700).
polygon(r7, [xy(289,250),xy(140,249),xy(140,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r7, [xy(263,210),xy(262,216),xy(258,221),xy(248,224),xy(164,225)]).
midline(r7, [xy(264,209),xy(266,186),xy(271,175),xy(265,159),xy(265,124)]).
midline(r7, [xy(272,174),xy(315,175)]).
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
fillpoint(r7, xy(164,225), 25.0).
region(r14, '#5a5a5a', 8000, centroid(350,620)).
perimeter(r14, 840).
polygon(r14, [xy(549,630),xy(150,630),xy(150,610),xy(549,610),xy(549,630)]).
midline(r14, [xy(324,619),xy(159,620)]).
midline(r14, [xy(325,620),xy(540,620)]).
fillpoint(r14, xy(159,620), 10.0).
region(r12, '#ffdc00', 7000, centroid(210,323)).
perimeter(r12, 400).
polygon(r12, [xy(259,350),xy(140,350),xy(140,300),xy(289,300),xy(290,329),xy(270,330),xy(270,339),xy(260,340),xy(259,350)]).
midline(r12, [xy(179,325),xy(164,325)]).
midline(r12, [xy(180,325),xy(238,324),xy(240,326)]).
midline(r12, [xy(241,324),xy(263,315),xy(275,315)]).
fillpoint(r12, xy(164,325), 25.0).
fillpoint(r12, xy(264,315), 16.0).
fillpoint(r12, xy(271,315), 15.0).
region(r9, '#870c25', 1500, centroid(164,184)).
perimeter(r9, 160).
polygon(r9, [xy(189,200),xy(140,200),xy(140,170),xy(189,170),xy(189,200)]).
midline(r9, [xy(160,185),xy(154,185)]).
midline(r9, [xy(161,184),xy(175,185)]).
fillpoint(r9, xy(154,185), 15.0).
region(r8, '#bebebe', 1000, centroid(164,160)).
perimeter(r8, 140).
polygon(r8, [xy(189,170),xy(140,170),xy(140,150),xy(189,150),xy(189,170)]).
midline(r8, [xy(170,160),xy(149,160)]).
midline(r8, [xy(171,159),xy(180,160)]).
fillpoint(r8, xy(149,160), 10.0).
region(r4, '#5a5a5a', 800, centroid(114,74)).
perimeter(r4, 160).
polygon(r4, [xy(129,90),xy(100,89),xy(100,60),xy(130,60),xy(129,90)]).
hole(r4, [xy(120,79),xy(119,70),xy(110,70),xy(110,80),xy(120,79)]).
midline(r4, [xy(119,64),xy(105,65),xy(105,84),xy(116,85),xy(124,83),xy(125,70),xy(124,66),xy(120,65)]).
fillpoint(r4, xy(106,65), 6.0).
fillpoint(r4, xy(124,65), 6.0).
fillpoint(r4, xy(105,84), 6.0).
fillpoint(r4, xy(123,84), 6.0).
fillpoint(r4, xy(111,65), 5.0).
fillpoint(r4, xy(104,75), 5.0).
fillpoint(r4, xy(124,75), 5.0).
fillpoint(r4, xy(111,85), 5.0).
region(r10, '#5a5a5a', 800, centroid(314,224)).
perimeter(r10, 160).
polygon(r10, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r10, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r10, [xy(319,214),xy(305,215),xy(305,234),xy(316,235),xy(324,233),xy(325,220),xy(324,216),xy(320,215)]).
fillpoint(r10, xy(306,215), 6.0).
fillpoint(r10, xy(324,215), 6.0).
fillpoint(r10, xy(305,234), 6.0).
fillpoint(r10, xy(323,234), 6.0).
fillpoint(r10, xy(311,215), 5.0).
fillpoint(r10, xy(304,225), 5.0).
fillpoint(r10, xy(324,225), 5.0).
fillpoint(r10, xy(311,235), 5.0).
region(r13, '#2ecc40', 400, centroid(140,620)).
perimeter(r13, 80).
polygon(r13, [xy(149,630),xy(130,629),xy(130,610),xy(150,610),xy(149,630)]).
midline(r13, [xy(139,619),xy(140,620)]).
fillpoint(r13, xy(139,620), 10.0).
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
region(r17, '#2ecc40', 400, centroid(630,620)).
perimeter(r17, 80).
polygon(r17, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r17, [xy(629,619),xy(630,620)]).
fillpoint(r17, xy(629,620), 10.0).
border(r17).
region(r5, '#2ecc40', 100, centroid(114,74)).
perimeter(r5, 40).
polygon(r5, [xy(119,80),xy(110,79),xy(110,70),xy(120,70),xy(119,80)]).
midline(r5, [xy(115,75),xy(115,74)]).
fillpoint(r5, xy(114,75), 5.0).
region(r11, '#2ecc40', 100, centroid(314,224)).
perimeter(r11, 40).
polygon(r11, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r11, [xy(315,225),xy(315,224)]).
fillpoint(r11, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 520).
adjacent(r1, r3).
shared_edge(r1, r3, 540).
adjacent(r1, r12).
shared_edge(r1, r12, 80).
adjacent(r1, r13).
shared_edge(r1, r13, 60).
adjacent(r1, r14).
shared_edge(r1, r14, 820).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 540).
adjacent(r3, r4).
shared_edge(r3, r4, 120).
adjacent(r3, r7).
shared_edge(r3, r7, 650).
adjacent(r3, r8).
shared_edge(r3, r8, 90).
adjacent(r3, r9).
shared_edge(r3, r9, 60).
adjacent(r3, r10).
shared_edge(r3, r10, 120).
adjacent(r3, r12).
shared_edge(r3, r12, 320).
adjacent(r4, r5).
shared_edge(r4, r5, 40).
adjacent(r7, r9).
shared_edge(r7, r9, 50).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r10, r11).
shared_edge(r10, r11, 40).
adjacent(r13, r14).
shared_edge(r13, r14, 20).

encloses(r4, r5).
encloses(r10, r11).
encloses(r1, r15).
encloses(r1, r16).
