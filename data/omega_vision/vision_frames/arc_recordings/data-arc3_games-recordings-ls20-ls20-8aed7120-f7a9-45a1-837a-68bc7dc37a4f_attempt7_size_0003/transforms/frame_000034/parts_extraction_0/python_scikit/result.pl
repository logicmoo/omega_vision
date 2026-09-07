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

region(r1, '#aaaaaa', 309400, centroid(365,325)).
perimeter(r1, 4980).
polygon(r1, [xy(150,469),xy(150,460),xy(189,460),xy(190,450),xy(209,450),xy(210,440),xy(220,439),xy(220,430),xy(239,430),xy(240,420),xy(249,420),xy(250,410),xy(259,410),xy(260,400),xy(270,399),xy(270,380),xy(279,380),xy(280,370),xy(290,369),xy(290,350),xy(300,349),xy(300,310),xy(310,309),xy(310,230),xy(300,229),xy(300,190),xy(290,189),xy(290,170),xy(280,170),xy(280,160),xy(270,159),xy(270,140),xy(260,139),xy(260,130),xy(250,129),xy(250,120),xy(240,119),xy(239,110),xy(220,110),xy(220,100),xy(210,100),xy(209,90),xy(190,90),xy(189,80),xy(150,80),xy(149,70),xy(70,70),xy(69,80),xy(40,80),xy(40,459),xy(69,460),xy(70,470),xy(150,469)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(39,39),xy(24,60),xy(19,81),xy(19,459),xy(21,471),xy(27,484),xy(41,500),xy(49,486),xy(48,483),xy(50,481),xy(50,483)]).
midline(r1, [xy(43,500),xy(42,502),xy(52,519),xy(79,549),xy(70,569),xy(72,569)]).
midline(r1, [xy(80,548),xy(114,540),xy(165,539),xy(187,535),xy(184,517),xy(170,486),xy(175,489),xy(175,493)]).
midline(r1, [xy(185,521),xy(185,518)]).
midline(r1, [xy(184,515),xy(177,493)]).
midline(r1, [xy(184,512),xy(203,533),xy(200,534),xy(187,521)]).
midline(r1, [xy(180,499),xy(179,497)]).
midline(r1, [xy(198,534),xy(186,523)]).
midline(r1, [xy(196,534),xy(189,533)]).
midline(r1, [xy(188,529),xy(187,525)]).
midline(r1, [xy(204,534),xy(256,523),xy(283,513),xy(299,510),xy(329,498),xy(334,494),xy(339,494),xy(365,483),xy(403,462),xy(310,367),xy(404,462)]).
midline(r1, [xy(406,461),xy(439,443),xy(454,432),xy(367,345),xy(354,341),xy(354,343)]).
midline(r1, [xy(367,347),xy(368,348)]).
midline(r1, [xy(370,346),xy(372,348),xy(375,347),xy(458,430),xy(455,433)]).
midline(r1, [xy(41,40),xy(45,44),xy(44,48),xy(47,49),xy(45,53),xy(47,51)]).
midline(r1, [xy(49,53),xy(47,55)]).
midline(r1, [xy(49,57),xy(50,56)]).
midline(r1, [xy(44,39),xy(73,34),xy(160,35),xy(177,40),xy(171,51),xy(173,51)]).
midline(r1, [xy(178,39),xy(179,41),xy(176,44)]).
midline(r1, [xy(180,40),xy(201,40),xy(227,46),xy(209,68),xy(230,47),xy(253,56),xy(266,58),xy(238,90),xy(268,58)]).
midline(r1, [xy(270,59),xy(329,82),xy(341,89),xy(290,142),xy(343,89),xy(353,96),xy(383,110),xy(421,134),xy(365,191),xy(359,196),xy(356,195),xy(346,201),xy(336,201),xy(332,206),xy(339,203)]).
midline(r1, [xy(422,134),xy(427,138),xy(373,192),xy(366,192)]).
midline(r1, [xy(372,193),xy(371,193)]).
midline(r1, [xy(375,192),xy(428,139),xy(378,191)]).
midline(r1, [xy(380,191),xy(431,140),xy(469,170),xy(473,194),xy(475,232),xy(474,334),xy(466,401),xy(459,430),xy(556,526),xy(554,529),xy(555,632),xy(549,635),xy(132,635),xy(120,630),xy(91,601),xy(72,571)]).
midline(r1, [xy(366,194),xy(362,195)]).
midline(r1, [xy(555,633),xy(560,635),xy(578,635),xy(583,634),xy(585,631),xy(585,556),xy(557,527)]).
midline(r1, [xy(355,198),xy(356,197)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,631),xy(613,634),xy(608,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(615,633),xy(635,635)]).
fillpoint(r1, xy(460,430), 180.0).
fillpoint(r1, xy(461,426), 179.0).
fillpoint(r1, xy(462,421), 178.0).
fillpoint(r1, xy(463,416), 177.0).
fillpoint(r1, xy(464,411), 176.0).
fillpoint(r1, xy(465,406), 175.0).
fillpoint(r1, xy(466,399), 174.0).
fillpoint(r1, xy(467,392), 173.0).
fillpoint(r1, xy(468,383), 172.0).
fillpoint(r1, xy(469,372), 171.0).
fillpoint(r1, xy(469,170), 170.9).
fillpoint(r1, xy(470,175), 170.0).
fillpoint(r1, xy(470,365), 170.0).
fillpoint(r1, xy(471,181), 169.0).
fillpoint(r1, xy(471,359), 169.0).
fillpoint(r1, xy(472,188), 168.0).
fillpoint(r1, xy(472,351), 168.0).
fillpoint(r1, xy(473,197), 167.0).
fillpoint(r1, xy(473,343), 167.0).
fillpoint(r1, xy(474,209), 166.0).
fillpoint(r1, xy(474,331), 166.0).
fillpoint(r1, xy(474,270), 165.0).
fillpoint(r1, xy(338,494), 116.0).
fillpoint(r1, xy(298,510), 100.0).
fillpoint(r1, xy(288,513), 97.0).
fillpoint(r1, xy(284,514), 96.0).
fillpoint(r1, xy(280,515), 95.0).
fillpoint(r1, xy(275,516), 94.0).
fillpoint(r1, xy(255,523), 87.0).
fillpoint(r1, xy(248,525), 85.0).
fillpoint(r1, xy(243,526), 84.0).
fillpoint(r1, xy(238,527), 83.0).
fillpoint(r1, xy(230,529), 81.0).
fillpoint(r1, xy(226,530), 80.0).
fillpoint(r1, xy(79,549), 79.5).
fillpoint(r1, xy(222,531), 79.0).
fillpoint(r1, xy(81,548), 79.0).
fillpoint(r1, xy(218,532), 78.0).
fillpoint(r1, xy(84,547), 78.0).
fillpoint(r1, xy(212,533), 77.0).
fillpoint(r1, xy(87,546), 77.0).
fillpoint(r1, xy(204,534), 76.0).
fillpoint(r1, xy(186,535), 75.0).
fillpoint(r1, xy(94,544), 75.0).
fillpoint(r1, xy(181,536), 74.0).
fillpoint(r1, xy(98,543), 74.0).
fillpoint(r1, xy(176,537), 73.0).
fillpoint(r1, xy(103,542), 73.0).
fillpoint(r1, xy(171,538), 72.0).
fillpoint(r1, xy(109,541), 72.0).
fillpoint(r1, xy(163,539), 71.0).
fillpoint(r1, xy(117,540), 71.0).
fillpoint(r1, xy(131,540), 70.0).
fillpoint(r1, xy(277,61), 62.0).
fillpoint(r1, xy(274,60), 61.0).
fillpoint(r1, xy(271,59), 60.0).
fillpoint(r1, xy(267,58), 59.0).
fillpoint(r1, xy(263,57), 58.0).
fillpoint(r1, xy(258,56), 57.0).
fillpoint(r1, xy(238,49), 50.0).
fillpoint(r1, xy(231,47), 48.0).
fillpoint(r1, xy(226,46), 47.0).
fillpoint(r1, xy(220,45), 46.0).
fillpoint(r1, xy(216,44), 45.0).
border(r1).
region(r2, '#ffdc00', 20400, centroid(67,279)).
perimeter(r2, 1000).
polygon(r2, [xy(139,470),xy(70,470),xy(69,460),xy(40,459),xy(40,80),xy(69,80),xy(70,70),xy(90,70),xy(90,449),xy(139,450),xy(139,470)]).
midline(r2, [xy(65,209),xy(64,104),xy(75,93),xy(80,79)]).
midline(r2, [xy(65,210),xy(64,435),xy(75,446),xy(81,458),xy(90,460),xy(130,460)]).
fillpoint(r2, xy(64,270), 25.0).
fillpoint(r2, xy(81,457), 12.0).
fillpoint(r2, xy(79,84), 11.0).
fillpoint(r2, xy(85,459), 11.0).
fillpoint(r2, xy(91,460), 10.0).
region(r3, '#2ecc40', 19500, centroid(155,153)).
perimeter(r3, 700).
polygon(r3, [xy(139,250),xy(90,249),xy(90,70),xy(100,70),xy(100,90),xy(129,90),xy(130,70),xy(149,70),xy(150,80),xy(189,80),xy(190,90),xy(209,90),xy(210,99),xy(220,100),xy(220,110),xy(240,110),xy(240,199),xy(140,200),xy(139,250)]).
midline(r3, [xy(188,149),xy(176,143),xy(165,142),xy(159,139),xy(160,123),xy(156,119),xy(142,90),xy(140,79)]).
midline(r3, [xy(158,119),xy(161,118),xy(164,112),xy(165,115),xy(160,121),xy(162,121)]).
midline(r3, [xy(159,140),xy(149,143),xy(143,142),xy(99,99),xy(95,93),xy(95,74)]).
midline(r3, [xy(145,144),xy(127,164),xy(118,180),xy(114,201),xy(115,225)]).
fillpoint(r3, xy(160,140), 59.2).
fillpoint(r3, xy(157,141), 59.0).
fillpoint(r3, xy(162,141), 59.0).
fillpoint(r3, xy(153,142), 58.0).
fillpoint(r3, xy(166,142), 58.0).
fillpoint(r3, xy(148,143), 57.0).
fillpoint(r3, xy(171,143), 57.0).
fillpoint(r3, xy(118,181), 29.0).
fillpoint(r3, xy(117,184), 28.0).
fillpoint(r3, xy(116,187), 27.0).
fillpoint(r3, xy(115,192), 26.0).
fillpoint(r3, xy(115,213), 25.0).
region(r11, '#2ecc40', 16300, centroid(156,387)).
perimeter(r11, 820).
polygon(r11, [xy(149,470),xy(140,469),xy(139,450),xy(90,449),xy(90,300),xy(139,300),xy(140,350),xy(240,350),xy(240,429),xy(230,430),xy(229,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,449),xy(190,450),xy(189,460),xy(150,460),xy(149,470)]).
hole(r11, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
midline(r11, [xy(210,379),xy(185,381),xy(164,390),xy(144,381),xy(123,377),xy(115,358),xy(115,324)]).
midline(r11, [xy(165,391),xy(165,423),xy(162,426),xy(152,428),xy(133,444),xy(96,444),xy(94,439),xy(95,406),xy(122,377)]).
midline(r11, [xy(153,430),xy(150,432)]).
midline(r11, [xy(210,381),xy(220,393),xy(224,405),xy(195,434),xy(165,425),xy(157,442),xy(146,454),xy(145,465)]).
midline(r11, [xy(161,435),xy(165,427)]).
midline(r11, [xy(161,437),xy(158,441)]).
midline(r11, [xy(225,405),xy(233,414),xy(235,425)]).
fillpoint(r11, xy(165,390), 40.3).
fillpoint(r11, xy(165,424), 35.4).
fillpoint(r11, xy(164,415), 35.0).
fillpoint(r11, xy(122,377), 33.0).
fillpoint(r11, xy(126,378), 32.0).
fillpoint(r11, xy(143,381), 32.0).
fillpoint(r11, xy(186,381), 32.0).
fillpoint(r11, xy(131,379), 31.1).
fillpoint(r11, xy(138,380), 31.1).
fillpoint(r11, xy(192,380), 31.0).
fillpoint(r11, xy(201,380), 30.0).
fillpoint(r11, xy(118,368), 29.0).
fillpoint(r11, xy(117,365), 28.0).
fillpoint(r11, xy(116,362), 27.0).
fillpoint(r11, xy(115,358), 26.0).
fillpoint(r11, xy(115,336), 25.0).
fillpoint(r11, xy(224,404), 16.0).
fillpoint(r11, xy(194,434), 16.0).
region(r6, '#ffdc00', 10400, centroid(227,209)).
perimeter(r6, 580).
polygon(r6, [xy(289,250),xy(140,250),xy(140,200),xy(239,200),xy(240,120),xy(249,120),xy(250,129),xy(259,130),xy(260,140),xy(270,140),xy(270,159),xy(279,160),xy(280,169),xy(290,170),xy(290,189),xy(300,190),xy(300,199),xy(290,200),xy(289,250)]).
midline(r6, [xy(190,224),xy(164,225)]).
midline(r6, [xy(191,225),xy(238,225),xy(253,223),xy(261,219),xy(266,191),xy(255,166),xy(255,154),xy(250,145),xy(250,139),xy(245,133),xy(245,124)]).
midline(r6, [xy(267,195),xy(295,195)]).
midline(r6, [xy(266,189),xy(267,190)]).
fillpoint(r6, xy(260,220), 29.7).
fillpoint(r6, xy(261,218), 29.0).
fillpoint(r6, xy(258,221), 29.0).
fillpoint(r6, xy(262,215), 28.0).
fillpoint(r6, xy(255,222), 28.0).
fillpoint(r6, xy(263,212), 27.0).
fillpoint(r6, xy(252,223), 27.0).
fillpoint(r6, xy(264,208), 26.0).
fillpoint(r6, xy(248,224), 26.0).
fillpoint(r6, xy(265,195), 25.5).
fillpoint(r6, xy(164,225), 25.0).
fillpoint(r6, xy(255,165), 16.0).
fillpoint(r6, xy(254,156), 15.0).
fillpoint(r6, xy(250,144), 11.0).
region(r12, '#ffdc00', 9800, centroid(225,337)).
perimeter(r12, 540).
polygon(r12, [xy(249,420),xy(240,419),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(290,369),xy(280,370),xy(279,380),xy(270,380),xy(270,399),xy(260,400),xy(260,409),xy(250,410),xy(249,420)]).
midline(r12, [xy(262,335),xy(261,330),xy(256,327),xy(239,324),xy(164,325)]).
midline(r12, [xy(263,336),xy(265,350),xy(255,373),xy(255,385),xy(250,394),xy(250,400),xy(245,406),xy(245,415)]).
midline(r12, [xy(266,350),xy(270,351)]).
fillpoint(r12, xy(260,329), 29.7).
fillpoint(r12, xy(258,328), 29.0).
fillpoint(r12, xy(261,331), 29.0).
fillpoint(r12, xy(255,327), 28.0).
fillpoint(r12, xy(262,334), 28.0).
fillpoint(r12, xy(252,326), 27.0).
fillpoint(r12, xy(263,337), 27.0).
fillpoint(r12, xy(248,325), 26.0).
fillpoint(r12, xy(264,342), 26.0).
fillpoint(r12, xy(164,325), 25.0).
fillpoint(r12, xy(255,374), 16.0).
fillpoint(r12, xy(255,383), 15.0).
fillpoint(r12, xy(250,395), 11.0).
region(r7, '#2ecc40', 9700, centroid(233,274)).
perimeter(r7, 640).
polygon(r7, [xy(299,350),xy(290,349),xy(289,300),xy(140,300),xy(140,250),xy(289,250),xy(290,200),xy(299,200),xy(300,239),xy(310,240),xy(310,309),xy(300,310),xy(299,350)]).
midline(r7, [xy(194,274),xy(164,275)]).
midline(r7, [xy(195,274),xy(285,274),xy(295,286),xy(300,300),xy(296,304),xy(294,312),xy(295,345)]).
midline(r7, [xy(286,273),xy(295,263),xy(300,249),xy(294,239),xy(295,204)]).
fillpoint(r7, xy(164,275), 25.0).
fillpoint(r7, xy(299,254), 11.0).
fillpoint(r7, xy(299,295), 11.0).
region(r20, '#2ecc40', 7200, centroid(310,620)).
perimeter(r20, 760).
polygon(r20, [xy(489,630),xy(130,630),xy(130,610),xy(489,610),xy(489,630)]).
midline(r20, [xy(345,620),xy(139,620)]).
midline(r20, [xy(346,620),xy(480,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r10, '#870c25', 1500, centroid(114,284)).
perimeter(r10, 160).
polygon(r10, [xy(139,300),xy(90,300),xy(90,270),xy(139,270),xy(139,300)]).
midline(r10, [xy(122,285),xy(104,285)]).
midline(r10, [xy(123,285),xy(125,285)]).
fillpoint(r10, xy(104,285), 15.0).
region(r21, '#5a5a5a', 1200, centroid(520,620)).
perimeter(r21, 160).
polygon(r21, [xy(549,630),xy(490,630),xy(490,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(520,620),xy(499,620)]).
midline(r21, [xy(521,619),xy(540,620)]).
fillpoint(r21, xy(499,620), 10.0).
region(r9, '#bebebe', 1000, centroid(114,260)).
perimeter(r9, 140).
polygon(r9, [xy(139,270),xy(90,270),xy(90,250),xy(139,250),xy(139,270)]).
midline(r9, [xy(111,260),xy(99,260)]).
midline(r9, [xy(112,259),xy(130,260)]).
fillpoint(r9, xy(99,260), 10.0).
region(r4, '#5a5a5a', 500, centroid(114,80)).
perimeter(r4, 120).
polygon(r4, [xy(129,90),xy(100,90),xy(100,70),xy(109,70),xy(110,79),xy(119,80),xy(120,70),xy(129,70),xy(129,90)]).
midline(r4, [xy(105,81),xy(105,74)]).
midline(r4, [xy(105,82),xy(105,84),xy(110,85),xy(123,84),xy(125,74)]).
fillpoint(r4, xy(105,84), 6.0).
fillpoint(r4, xy(123,84), 6.0).
fillpoint(r4, xy(105,76), 5.0).
fillpoint(r4, xy(125,76), 5.0).
fillpoint(r4, xy(111,85), 5.0).
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
region(r24, '#7fdbff', 400, centroid(630,620)).
perimeter(r24, 80).
polygon(r24, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r24, [xy(629,619),xy(630,620)]).
fillpoint(r24, xy(629,620), 10.0).
border(r24).
region(r15, '#000000', 100, centroid(204,414)).
perimeter(r15, 40).
polygon(r15, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r15, [xy(205,415),xy(205,414)]).
fillpoint(r15, xy(204,415), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 550).
adjacent(r1, r3).
shared_edge(r1, r3, 170).
adjacent(r1, r4).
shared_edge(r1, r4, 20).
adjacent(r1, r6).
shared_edge(r1, r6, 140).
adjacent(r1, r7).
shared_edge(r1, r7, 160).
adjacent(r1, r11).
shared_edge(r1, r11, 120).
adjacent(r1, r12).
shared_edge(r1, r12, 120).
adjacent(r1, r20).
shared_edge(r1, r20, 740).
adjacent(r1, r21).
shared_edge(r1, r21, 140).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 180).
adjacent(r2, r9).
shared_edge(r2, r9, 20).
adjacent(r2, r10).
shared_edge(r2, r10, 30).
adjacent(r2, r11).
shared_edge(r2, r11, 220).
adjacent(r3, r4).
shared_edge(r3, r4, 70).
adjacent(r3, r6).
shared_edge(r3, r6, 230).
adjacent(r3, r9).
shared_edge(r3, r9, 50).
adjacent(r6, r7).
shared_edge(r6, r7, 210).
adjacent(r7, r9).
shared_edge(r7, r9, 20).
adjacent(r7, r10).
shared_edge(r7, r10, 30).
adjacent(r7, r12).
shared_edge(r7, r12, 200).
adjacent(r9, r10).
shared_edge(r9, r10, 50).
adjacent(r10, r11).
shared_edge(r10, r11, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 220).
adjacent(r11, r15).
shared_edge(r11, r15, 40).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r11, r15).
encloses(r1, r22).
encloses(r1, r23).
