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

region(r1, '#aaaaaa', 313400, centroid(362,349)).
perimeter(r1, 4560).
polygon(r1, [xy(40,0),xy(40,359),xy(69,360),xy(70,370),xy(149,370),xy(150,360),xy(189,360),xy(190,350),xy(209,350),xy(210,340),xy(220,339),xy(220,330),xy(239,330),xy(240,320),xy(249,320),xy(250,310),xy(259,310),xy(260,300),xy(270,299),xy(270,280),xy(279,280),xy(280,270),xy(290,269),xy(290,250),xy(300,249),xy(300,210),xy(310,209),xy(310,130),xy(300,129),xy(300,90),xy(290,89),xy(290,70),xy(280,70),xy(279,60),xy(270,59),xy(270,40),xy(260,40),xy(260,30),xy(250,30),xy(250,20),xy(240,19),xy(239,10),xy(220,10),xy(220,0)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(247,478),xy(238,480),xy(187,429),xy(188,438),xy(231,479),xy(229,481),xy(170,489),xy(120,490),xy(59,428),xy(42,401),xy(29,387),xy(22,374),xy(19,359),xy(20,19)]).
midline(r1, [xy(248,478),xy(281,470),xy(338,451),xy(237,350),xy(237,347),xy(340,450),xy(339,452)]).
midline(r1, [xy(341,451),xy(412,422),xy(439,407),xy(460,331),xy(377,248),xy(361,243),xy(358,244),xy(340,236),xy(334,236),xy(330,232),xy(334,238),xy(336,237)]).
midline(r1, [xy(439,409),xy(555,526),xy(555,632),xy(553,634),xy(126,634),xy(91,601),xy(70,569),xy(90,528),xy(119,491)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,631),xy(579,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(369,248),xy(368,247)]).
midline(r1, [xy(43,400),xy(42,396),xy(46,392),xy(51,378),xy(53,378)]).
midline(r1, [xy(336,239),xy(338,238),xy(339,241),xy(340,238)]).
midline(r1, [xy(231,481),xy(235,479),xy(189,433)]).
midline(r1, [xy(460,329),xy(466,301),xy(474,234),xy(474,164),xy(423,114),xy(388,89),xy(359,64),xy(328,45),xy(304,35),xy(284,22),xy(255,10),xy(249,10),xy(243,5),xy(224,5)]).
midline(r1, [xy(381,83),xy(368,94),xy(350,97),xy(347,100),xy(333,103),xy(331,105),xy(333,105)]).
midline(r1, [xy(336,104),xy(335,105)]).
midline(r1, [xy(349,100),xy(351,99)]).
midline(r1, [xy(586,556),xy(615,585),xy(615,627),xy(613,634),xy(590,635),xy(585,633)]).
midline(r1, [xy(44,396),xy(45,395)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(174,386),xy(169,381),xy(169,384),xy(172,386),xy(171,388),xy(173,387)]).
midline(r1, [xy(173,390),xy(180,407),xy(179,409),xy(182,410),xy(182,418),xy(184,421),xy(184,418)]).
midline(r1, [xy(184,425),xy(186,421),xy(187,424),xy(185,426),xy(187,428)]).
midline(r1, [xy(343,241),xy(342,242)]).
midline(r1, [xy(344,240),xy(345,243),xy(346,240)]).
fillpoint(r1, xy(438,408), 201.1).
fillpoint(r1, xy(440,403), 200.0).
fillpoint(r1, xy(442,396), 198.0).
fillpoint(r1, xy(443,392), 197.0).
fillpoint(r1, xy(444,389), 196.0).
fillpoint(r1, xy(445,386), 195.0).
fillpoint(r1, xy(446,383), 194.0).
fillpoint(r1, xy(447,380), 193.0).
fillpoint(r1, xy(448,377), 192.0).
fillpoint(r1, xy(450,370), 190.0).
fillpoint(r1, xy(452,363), 188.0).
fillpoint(r1, xy(453,359), 187.0).
fillpoint(r1, xy(454,355), 186.0).
fillpoint(r1, xy(455,351), 185.0).
fillpoint(r1, xy(456,347), 184.0).
fillpoint(r1, xy(457,342), 183.0).
fillpoint(r1, xy(458,338), 182.0).
fillpoint(r1, xy(459,334), 181.0).
fillpoint(r1, xy(460,330), 180.0).
fillpoint(r1, xy(461,326), 179.0).
fillpoint(r1, xy(462,321), 178.0).
fillpoint(r1, xy(463,316), 177.0).
fillpoint(r1, xy(464,311), 176.0).
fillpoint(r1, xy(465,306), 175.0).
fillpoint(r1, xy(466,299), 174.0).
fillpoint(r1, xy(378,436), 174.0).
fillpoint(r1, xy(467,292), 173.0).
fillpoint(r1, xy(468,283), 172.0).
fillpoint(r1, xy(469,272), 171.0).
fillpoint(r1, xy(470,265), 170.0).
fillpoint(r1, xy(471,259), 169.0).
fillpoint(r1, xy(472,251), 168.0).
fillpoint(r1, xy(473,243), 167.0).
fillpoint(r1, xy(474,231), 166.0).
fillpoint(r1, xy(475,186), 165.0).
fillpoint(r1, xy(341,451), 159.0).
fillpoint(r1, xy(323,457), 153.0).
fillpoint(r1, xy(316,459), 151.0).
fillpoint(r1, xy(302,463), 147.0).
fillpoint(r1, xy(299,464), 146.0).
fillpoint(r1, xy(296,465), 145.0).
fillpoint(r1, xy(293,466), 144.0).
fillpoint(r1, xy(290,467), 143.0).
fillpoint(r1, xy(280,470), 140.0).
fillpoint(r1, xy(276,471), 139.0).
fillpoint(r1, xy(272,472), 138.0).
fillpoint(r1, xy(268,473), 137.0).
fillpoint(r1, xy(263,474), 136.0).
fillpoint(r1, xy(255,476), 134.0).
fillpoint(r1, xy(251,477), 133.0).
fillpoint(r1, xy(247,478), 132.0).
fillpoint(r1, xy(242,479), 131.0).
fillpoint(r1, xy(238,480), 130.0).
fillpoint(r1, xy(232,481), 129.0).
fillpoint(r1, xy(226,482), 128.0).
fillpoint(r1, xy(218,483), 127.0).
fillpoint(r1, xy(208,484), 126.0).
fillpoint(r1, xy(196,485), 125.0).
fillpoint(r1, xy(191,486), 124.0).
fillpoint(r1, xy(185,487), 123.0).
fillpoint(r1, xy(177,488), 122.0).
fillpoint(r1, xy(167,489), 121.0).
fillpoint(r1, xy(120,490), 120.4).
fillpoint(r1, xy(131,490), 120.0).
border(r1).
region(r2, '#ffdc00', 26100, centroid(96,134)).
perimeter(r2, 1200).
polygon(r2, [xy(220,0),xy(220,10),xy(239,10),xy(240,19),xy(249,20),xy(250,29),xy(259,30),xy(260,39),xy(270,40),xy(270,49),xy(90,50),xy(89,370),xy(70,370),xy(69,360),xy(40,359),xy(40,0)]).
midline(r2, [xy(64,330),xy(64,50),xy(68,30),xy(76,26),xy(91,24),xy(199,24),xy(212,29),xy(222,29),xy(244,39),xy(250,39),xy(256,44),xy(265,45)]).
midline(r2, [xy(65,331),xy(64,335),xy(75,346),xy(80,360)]).
fillpoint(r2, xy(69,29), 29.7).
fillpoint(r2, xy(71,28), 29.0).
fillpoint(r2, xy(68,31), 29.0).
fillpoint(r2, xy(74,27), 28.0).
fillpoint(r2, xy(67,34), 28.0).
fillpoint(r2, xy(77,26), 27.0).
fillpoint(r2, xy(66,37), 27.0).
fillpoint(r2, xy(82,25), 26.0).
fillpoint(r2, xy(65,42), 26.0).
fillpoint(r2, xy(91,25), 25.0).
fillpoint(r2, xy(65,193), 25.0).
fillpoint(r2, xy(213,29), 21.0).
fillpoint(r2, xy(221,30), 20.0).
fillpoint(r2, xy(234,34), 16.0).
fillpoint(r2, xy(245,39), 11.0).
fillpoint(r2, xy(79,355), 11.0).
border(r2).
region(r3, '#2ecc40', 22100, centroid(187,116)).
perimeter(r3, 960).
polygon(r3, [xy(239,200),xy(140,200),xy(139,150),xy(90,149),xy(90,50),xy(269,50),xy(270,59),xy(279,60),xy(280,70),xy(290,70),xy(290,89),xy(300,90),xy(300,129),xy(310,130),xy(310,149),xy(290,149),xy(289,100),xy(240,100),xy(239,200)]).
hole(r3, [xy(130,89),xy(129,60),xy(100,60),xy(100,90),xy(130,89)]).
midline(r3, [xy(293,95),xy(286,94),xy(274,84),xy(248,73),xy(246,75),xy(231,75),xy(218,79),xy(204,87),xy(184,105),xy(135,56),xy(103,54),xy(95,55),xy(94,89),xy(100,100),xy(119,120),xy(140,119),xy(181,112),xy(183,106)]).
midline(r3, [xy(182,112),xy(188,130),xy(190,150)]).
midline(r3, [xy(294,95),xy(294,129),xy(300,140)]).
fillpoint(r3, xy(182,112), 57.4).
fillpoint(r3, xy(183,108), 57.0).
fillpoint(r3, xy(186,123), 54.0).
fillpoint(r3, xy(187,127), 53.0).
fillpoint(r3, xy(188,132), 52.0).
fillpoint(r3, xy(189,138), 51.0).
fillpoint(r3, xy(138,119), 31.0).
fillpoint(r3, xy(119,120), 30.0).
fillpoint(r3, xy(221,78), 29.0).
fillpoint(r3, xy(224,77), 28.0).
fillpoint(r3, xy(227,76), 27.0).
fillpoint(r3, xy(232,75), 26.0).
fillpoint(r3, xy(241,75), 25.0).
fillpoint(r3, xy(274,84), 16.0).
region(r9, '#2ecc40', 16100, centroid(158,282)).
perimeter(r9, 840).
polygon(r9, [xy(149,370),xy(90,369),xy(90,200),xy(139,200),xy(140,250),xy(290,250),xy(290,269),xy(280,270),xy(279,280),xy(270,280),xy(269,300),xy(140,300),xy(140,349),xy(190,350),xy(189,360),xy(150,360),xy(149,370)]).
midline(r9, [xy(170,275),xy(122,275),xy(115,259),xy(115,224)]).
midline(r9, [xy(121,275),xy(115,291),xy(114,345),xy(126,355),xy(140,360),xy(150,354),xy(185,355)]).
midline(r9, [xy(171,275),xy(245,275),xy(257,267),xy(274,260),xy(280,260)]).
fillpoint(r9, xy(121,275), 31.4).
fillpoint(r9, xy(118,268), 29.0).
fillpoint(r9, xy(118,281), 29.0).
fillpoint(r9, xy(117,265), 28.0).
fillpoint(r9, xy(117,284), 28.0).
fillpoint(r9, xy(116,262), 27.0).
fillpoint(r9, xy(116,287), 27.0).
fillpoint(r9, xy(115,258), 26.0).
fillpoint(r9, xy(115,292), 26.0).
fillpoint(r9, xy(115,236), 25.0).
fillpoint(r9, xy(141,275), 25.0).
fillpoint(r9, xy(115,323), 25.0).
fillpoint(r9, xy(264,265), 16.0).
fillpoint(r9, xy(275,260), 11.0).
fillpoint(r9, xy(135,359), 11.0).
region(r6, '#ffdc00', 13500, centroid(239,193)).
perimeter(r6, 640).
polygon(r6, [xy(289,250),xy(140,249),xy(140,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(310,150),xy(310,199),xy(290,200),xy(289,250)]).
midline(r6, [xy(263,210),xy(261,218),xy(249,224),xy(164,225)]).
midline(r6, [xy(264,209),xy(265,190),xy(271,175),xy(265,159),xy(265,124)]).
midline(r6, [xy(272,174),xy(285,175)]).
fillpoint(r6, xy(271,175), 31.4).
fillpoint(r6, xy(260,220), 29.7).
fillpoint(r6, xy(268,168), 29.0).
fillpoint(r6, xy(268,181), 29.0).
fillpoint(r6, xy(261,218), 29.0).
fillpoint(r6, xy(258,221), 29.0).
fillpoint(r6, xy(267,165), 28.0).
fillpoint(r6, xy(267,184), 28.0).
fillpoint(r6, xy(262,215), 28.0).
fillpoint(r6, xy(255,222), 28.0).
fillpoint(r6, xy(266,162), 27.0).
fillpoint(r6, xy(266,187), 27.0).
fillpoint(r6, xy(263,212), 27.0).
fillpoint(r6, xy(252,223), 27.0).
fillpoint(r6, xy(265,158), 26.0).
fillpoint(r6, xy(265,192), 26.0).
fillpoint(r6, xy(264,208), 26.0).
fillpoint(r6, xy(248,224), 26.0).
fillpoint(r6, xy(265,136), 25.0).
fillpoint(r6, xy(164,225), 25.0).
region(r13, '#5a5a5a', 7600, centroid(360,620)).
perimeter(r13, 800).
polygon(r13, [xy(549,630),xy(170,630),xy(170,610),xy(549,610),xy(549,630)]).
midline(r13, [xy(203,619),xy(179,620)]).
midline(r13, [xy(204,620),xy(540,620)]).
fillpoint(r13, xy(179,620), 10.0).
region(r11, '#ffdc00', 4800, centroid(189,322)).
perimeter(r11, 340).
polygon(r11, [xy(209,350),xy(140,350),xy(140,300),xy(260,300),xy(260,309),xy(250,310),xy(250,319),xy(240,320),xy(239,330),xy(220,330),xy(220,339),xy(210,340),xy(209,350)]).
midline(r11, [xy(212,316),xy(190,325),xy(164,325)]).
midline(r11, [xy(213,315),xy(225,315),xy(234,310),xy(240,310),xy(246,305),xy(255,305)]).
fillpoint(r11, xy(164,325), 25.0).
fillpoint(r11, xy(214,315), 16.0).
fillpoint(r11, xy(226,314), 15.0).
fillpoint(r11, xy(235,310), 11.0).
region(r8, '#870c25', 1500, centroid(114,184)).
perimeter(r8, 160).
polygon(r8, [xy(139,200),xy(90,200),xy(90,170),xy(139,170),xy(139,200)]).
midline(r8, [xy(122,185),xy(104,185)]).
midline(r8, [xy(123,184),xy(125,185)]).
fillpoint(r8, xy(104,185), 15.0).
region(r7, '#bebebe', 1000, centroid(114,160)).
perimeter(r7, 140).
polygon(r7, [xy(139,170),xy(90,170),xy(90,150),xy(139,150),xy(139,170)]).
midline(r7, [xy(109,160),xy(99,160)]).
midline(r7, [xy(110,159),xy(130,160)]).
fillpoint(r7, xy(99,160), 10.0).
region(r4, '#5a5a5a', 800, centroid(114,74)).
perimeter(r4, 160).
polygon(r4, [xy(129,90),xy(100,89),xy(100,60),xy(130,60),xy(129,90)]).
hole(r4, [xy(120,79),xy(119,70),xy(110,70),xy(110,80),xy(120,79)]).
midline(r4, [xy(119,64),xy(105,65),xy(105,84),xy(119,85),xy(124,83),xy(125,70),xy(124,66),xy(120,65)]).
fillpoint(r4, xy(106,65), 6.0).
fillpoint(r4, xy(124,65), 6.0).
fillpoint(r4, xy(105,84), 6.0).
fillpoint(r4, xy(123,84), 6.0).
fillpoint(r4, xy(111,65), 5.0).
fillpoint(r4, xy(104,75), 5.0).
fillpoint(r4, xy(124,75), 5.0).
fillpoint(r4, xy(111,85), 5.0).
region(r12, '#2ecc40', 800, centroid(150,620)).
perimeter(r12, 120).
polygon(r12, [xy(169,630),xy(130,630),xy(130,610),xy(169,610),xy(169,630)]).
midline(r12, [xy(160,620),xy(139,620)]).
fillpoint(r12, xy(139,620), 10.0).
region(r10, '#2ecc40', 600, centroid(296,221)).
perimeter(r10, 140).
polygon(r10, [xy(299,250),xy(290,249),xy(290,200),xy(309,200),xy(310,209),xy(300,210),xy(299,250)]).
midline(r10, [xy(295,217),xy(295,205),xy(305,205)]).
midline(r10, [xy(294,218),xy(295,245)]).
fillpoint(r10, xy(296,205), 6.0).
fillpoint(r10, xy(301,205), 5.0).
fillpoint(r10, xy(295,228), 5.0).
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
region(r5, '#2ecc40', 100, centroid(114,74)).
perimeter(r5, 40).
polygon(r5, [xy(119,80),xy(110,79),xy(110,70),xy(120,70),xy(119,80)]).
midline(r5, [xy(115,75),xy(115,74)]).
fillpoint(r5, xy(114,75), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 520).
adjacent(r1, r3).
shared_edge(r1, r3, 140).
adjacent(r1, r6).
shared_edge(r1, r6, 50).
adjacent(r1, r9).
shared_edge(r1, r9, 200).
adjacent(r1, r10).
shared_edge(r1, r10, 70).
adjacent(r1, r11).
shared_edge(r1, r11, 120).
adjacent(r1, r12).
shared_edge(r1, r12, 100).
adjacent(r1, r13).
shared_edge(r1, r13, 780).
adjacent(r1, r14).
shared_edge(r1, r14, 80).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 280).
adjacent(r2, r7).
shared_edge(r2, r7, 20).
adjacent(r2, r8).
shared_edge(r2, r8, 30).
adjacent(r2, r9).
shared_edge(r2, r9, 170).
adjacent(r3, r4).
shared_edge(r3, r4, 120).
adjacent(r3, r6).
shared_edge(r3, r6, 320).
adjacent(r3, r7).
shared_edge(r3, r7, 70).
adjacent(r3, r8).
shared_edge(r3, r8, 30).
adjacent(r4, r5).
shared_edge(r4, r5, 40).
adjacent(r6, r9).
shared_edge(r6, r9, 200).
adjacent(r6, r10).
shared_edge(r6, r10, 70).
adjacent(r7, r8).
shared_edge(r7, r8, 50).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r9, r11).
shared_edge(r9, r11, 220).
adjacent(r12, r13).
shared_edge(r12, r13, 20).

encloses(r4, r5).
encloses(r1, r14).
encloses(r1, r15).
