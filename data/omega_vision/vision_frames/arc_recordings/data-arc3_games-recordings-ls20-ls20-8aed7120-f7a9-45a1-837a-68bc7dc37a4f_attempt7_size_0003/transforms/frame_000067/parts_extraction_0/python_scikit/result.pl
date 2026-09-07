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

region(r1, '#aaaaaa', 289400, centroid(370,326)).
perimeter(r1, 5400).
polygon(r1, [xy(200,469),xy(200,460),xy(239,460),xy(240,450),xy(259,450),xy(260,440),xy(270,439),xy(270,430),xy(289,430),xy(290,420),xy(299,420),xy(300,410),xy(309,410),xy(310,400),xy(320,399),xy(320,380),xy(329,380),xy(330,370),xy(340,369),xy(340,350),xy(350,349),xy(350,310),xy(360,309),xy(360,230),xy(350,229),xy(350,190),xy(340,189),xy(340,170),xy(330,170),xy(330,160),xy(320,159),xy(320,140),xy(310,139),xy(310,130),xy(300,129),xy(300,120),xy(290,119),xy(289,110),xy(270,110),xy(270,100),xy(260,99),xy(259,90),xy(240,90),xy(239,80),xy(200,80),xy(199,70),xy(174,70),xy(120,70),xy(119,80),xy(80,80),xy(79,90),xy(60,90),xy(60,99),xy(50,100),xy(50,109),xy(40,110),xy(40,429),xy(49,430),xy(50,439),xy(59,440),xy(60,450),xy(79,450),xy(80,460),xy(119,460),xy(120,470),xy(200,469)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(492,147),xy(433,110),xy(379,82),xy(328,61),xy(303,56),xy(282,47),xy(256,41),xy(226,40),xy(210,35),xy(195,34),xy(122,34),xy(104,36),xy(90,41),xy(87,39),xy(68,40),xy(45,45)]).
midline(r1, [xy(477,139),xy(425,191),xy(417,194),xy(413,193),xy(408,197),xy(403,194),xy(399,198),xy(390,201),xy(390,203)]).
midline(r1, [xy(413,195),xy(414,195)]).
midline(r1, [xy(492,149),xy(499,207),xy(500,309),xy(498,342),xy(489,405),xy(430,348),xy(418,347),xy(414,344),xy(411,346),xy(405,341),xy(392,338),xy(405,348),xy(412,347),xy(485,422),xy(479,448),xy(415,483),xy(389,494),xy(384,494),xy(357,507),xy(312,521),xy(258,469),xy(308,521),xy(306,523),xy(269,532),xy(237,534),xy(215,539),xy(153,540),xy(129,527),xy(115,523),xy(87,505),xy(67,504),xy(50,500),xy(34,473),xy(20,437),xy(19,110),xy(21,98),xy(27,87),xy(28,80),xy(45,47)]).
midline(r1, [xy(416,347),xy(414,348)]).
midline(r1, [xy(416,349),xy(486,418),xy(486,421)]).
midline(r1, [xy(487,417),xy(419,348)]).
midline(r1, [xy(401,343),xy(402,343)]).
midline(r1, [xy(479,449),xy(555,526),xy(555,630),xy(553,634),xy(549,635),xy(135,635),xy(124,633),xy(108,618),xy(102,622),xy(88,625),xy(70,625),xy(59,622),xy(48,625),xy(23,624),xy(17,621),xy(14,609),xy(14,590),xy(17,580),xy(14,568),xy(15,543),xy(23,527),xy(49,500)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,629),xy(584,633),xy(579,635),xy(555,633)]).
midline(r1, [xy(18,579),xy(40,579),xy(40,580),xy(60,599),xy(60,621)]).
midline(r1, [xy(109,617),xy(110,602),xy(114,590),xy(152,541)]).
midline(r1, [xy(479,141),xy(426,192)]).
midline(r1, [xy(404,343),xy(407,345)]).
midline(r1, [xy(93,41),xy(91,42)]).
midline(r1, [xy(586,556),xy(615,585),xy(615,632),xy(604,635),xy(585,633)]).
midline(r1, [xy(487,414),xy(489,407)]).
midline(r1, [xy(238,533),xy(227,503),xy(230,506)]).
midline(r1, [xy(235,519),xy(234,518)]).
midline(r1, [xy(226,41),xy(220,53),xy(222,53)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(406,197),xy(395,201)]).
midline(r1, [xy(91,506),xy(89,503),xy(89,505)]).
midline(r1, [xy(91,503),xy(89,499),xy(95,491),xy(95,495),xy(91,499),xy(92,501),xy(93,499)]).
midline(r1, [xy(96,47),xy(93,45),xy(94,43),xy(95,45)]).
midline(r1, [xy(93,47),xy(95,51),xy(95,48)]).
midline(r1, [xy(98,52),xy(99,53)]).
fillpoint(r1, xy(479,449), 161.0).
fillpoint(r1, xy(480,445), 160.0).
fillpoint(r1, xy(481,441), 159.0).
fillpoint(r1, xy(482,437), 158.0).
fillpoint(r1, xy(483,432), 157.0).
fillpoint(r1, xy(484,428), 156.0).
fillpoint(r1, xy(485,424), 155.0).
fillpoint(r1, xy(486,420), 154.0).
fillpoint(r1, xy(487,416), 153.0).
fillpoint(r1, xy(488,411), 152.0).
fillpoint(r1, xy(489,406), 151.0).
fillpoint(r1, xy(490,401), 150.0).
fillpoint(r1, xy(491,396), 149.0).
fillpoint(r1, xy(491,148), 148.1).
fillpoint(r1, xy(492,151), 148.0).
fillpoint(r1, xy(492,389), 148.0).
fillpoint(r1, xy(493,159), 147.0).
fillpoint(r1, xy(493,381), 147.0).
fillpoint(r1, xy(494,170), 146.0).
fillpoint(r1, xy(494,370), 146.0).
fillpoint(r1, xy(495,179), 145.0).
fillpoint(r1, xy(495,360), 145.0).
fillpoint(r1, xy(496,185), 144.0).
fillpoint(r1, xy(496,355), 144.0).
fillpoint(r1, xy(497,192), 143.0).
fillpoint(r1, xy(497,348), 143.0).
fillpoint(r1, xy(498,199), 142.0).
fillpoint(r1, xy(498,340), 142.0).
fillpoint(r1, xy(499,211), 141.0).
fillpoint(r1, xy(499,329), 141.0).
fillpoint(r1, xy(499,270), 140.0).
fillpoint(r1, xy(388,494), 116.0).
fillpoint(r1, xy(348,510), 100.0).
fillpoint(r1, xy(338,513), 97.0).
fillpoint(r1, xy(334,514), 96.0).
fillpoint(r1, xy(330,515), 95.0).
fillpoint(r1, xy(325,516), 94.0).
fillpoint(r1, xy(305,523), 87.0).
fillpoint(r1, xy(298,525), 85.0).
fillpoint(r1, xy(293,526), 84.0).
fillpoint(r1, xy(288,527), 83.0).
fillpoint(r1, xy(280,529), 81.0).
fillpoint(r1, xy(276,530), 80.0).
fillpoint(r1, xy(272,531), 79.0).
fillpoint(r1, xy(268,532), 78.0).
fillpoint(r1, xy(262,533), 77.0).
fillpoint(r1, xy(254,534), 76.0).
fillpoint(r1, xy(236,535), 75.0).
fillpoint(r1, xy(231,536), 74.0).
fillpoint(r1, xy(226,537), 73.0).
fillpoint(r1, xy(221,538), 72.0).
fillpoint(r1, xy(213,539), 71.0).
fillpoint(r1, xy(198,539), 70.0).
fillpoint(r1, xy(327,61), 62.0).
fillpoint(r1, xy(324,60), 61.0).
fillpoint(r1, xy(321,59), 60.0).
fillpoint(r1, xy(317,58), 59.0).
fillpoint(r1, xy(313,57), 58.0).
fillpoint(r1, xy(128,527), 58.0).
fillpoint(r1, xy(308,56), 57.0).
fillpoint(r1, xy(116,523), 54.1).
fillpoint(r1, xy(288,49), 50.0).
fillpoint(r1, xy(49,500), 50.0).
fillpoint(r1, xy(103,515), 48.8).
fillpoint(r1, xy(100,513), 48.3).
fillpoint(r1, xy(281,47), 48.0).
fillpoint(r1, xy(58,502), 48.0).
fillpoint(r1, xy(90,507), 47.9).
fillpoint(r1, xy(92,508), 47.9).
fillpoint(r1, xy(97,511), 47.9).
fillpoint(r1, xy(94,509), 47.7).
fillpoint(r1, xy(95,510), 47.7).
fillpoint(r1, xy(276,46), 47.0).
fillpoint(r1, xy(63,503), 47.0).
fillpoint(r1, xy(86,506), 47.0).
fillpoint(r1, xy(46,46), 46.2).
fillpoint(r1, xy(49,45), 46.0).
fillpoint(r1, xy(270,45), 46.0).
fillpoint(r1, xy(68,504), 46.0).
fillpoint(r1, xy(70,504), 46.0).
fillpoint(r1, xy(79,505), 46.0).
fillpoint(r1, xy(81,505), 46.0).
fillpoint(r1, xy(53,44), 45.0).
fillpoint(r1, xy(266,44), 45.0).
fillpoint(r1, xy(56,43), 44.0).
fillpoint(r1, xy(263,43), 44.0).
fillpoint(r1, xy(64,41), 42.0).
fillpoint(r1, xy(255,41), 42.0).
fillpoint(r1, xy(70,40), 41.0).
fillpoint(r1, xy(249,40), 41.0).
border(r1).
region(r3, '#2ecc40', 40800, centroid(157,258)).
perimeter(r3, 1600).
polygon(r3, [xy(189,470),xy(140,470),xy(139,450),xy(90,449),xy(90,80),xy(99,80),xy(100,90),xy(129,90),xy(130,70),xy(199,70),xy(200,80),xy(239,80),xy(240,90),xy(260,90),xy(259,100),xy(240,100),xy(239,200),xy(140,200),xy(140,349),xy(240,350),xy(240,449),xy(190,450),xy(189,470)]).
hole(r3, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
hole(r3, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r3, [xy(230,440),xy(219,445),xy(206,444),xy(192,433),xy(166,425),xy(164,418),xy(164,390),xy(144,381),xy(125,378),xy(118,369),xy(114,349),xy(115,190),xy(125,167),xy(145,144),xy(101,101),xy(95,93),xy(95,84)]).
midline(r3, [xy(146,143),xy(162,140),xy(172,135),xy(170,117),xy(167,113),xy(172,111),xy(171,105),xy(179,96)]).
midline(r3, [xy(174,107),xy(173,105)]).
midline(r3, [xy(165,425),xy(156,426),xy(133,444),xy(101,445),xy(95,443),xy(95,406),xy(122,377)]).
midline(r3, [xy(165,427),xy(165,445)]).
midline(r3, [xy(158,428),xy(159,427)]).
midline(r3, [xy(156,428),xy(155,429)]).
midline(r3, [xy(171,114),xy(170,115)]).
midline(r3, [xy(230,438),xy(235,428),xy(234,416),xy(224,404),xy(216,387),xy(209,380),xy(185,381),xy(165,390)]).
midline(r3, [xy(224,405),xy(195,434)]).
midline(r3, [xy(173,136),xy(178,138),xy(186,132),xy(226,94),xy(255,95)]).
midline(r3, [xy(176,102),xy(175,105)]).
fillpoint(r3, xy(172,136), 63.5).
fillpoint(r3, xy(175,137), 63.0).
fillpoint(r3, xy(167,138), 62.0).
fillpoint(r3, xy(164,139), 61.0).
fillpoint(r3, xy(161,140), 60.0).
fillpoint(r3, xy(157,141), 59.0).
fillpoint(r3, xy(153,142), 58.0).
fillpoint(r3, xy(148,143), 57.0).
fillpoint(r3, xy(165,390), 40.3).
fillpoint(r3, xy(165,425), 35.4).
fillpoint(r3, xy(164,415), 35.0).
fillpoint(r3, xy(122,377), 33.0).
fillpoint(r3, xy(126,378), 32.0).
fillpoint(r3, xy(143,381), 32.0).
fillpoint(r3, xy(186,381), 32.0).
fillpoint(r3, xy(131,379), 31.1).
fillpoint(r3, xy(138,380), 31.1).
fillpoint(r3, xy(192,380), 31.0).
fillpoint(r3, xy(201,380), 30.0).
fillpoint(r3, xy(118,181), 29.0).
fillpoint(r3, xy(118,368), 29.0).
fillpoint(r3, xy(117,184), 28.0).
fillpoint(r3, xy(117,365), 28.0).
fillpoint(r3, xy(116,187), 27.0).
fillpoint(r3, xy(116,362), 27.0).
fillpoint(r3, xy(115,192), 26.0).
fillpoint(r3, xy(115,358), 26.0).
fillpoint(r3, xy(114,275), 25.0).
fillpoint(r3, xy(224,404), 16.0).
fillpoint(r3, xy(194,434), 16.0).
region(r4, '#ffdc00', 18300, centroid(67,277)).
perimeter(r4, 980).
polygon(r4, [xy(139,470),xy(120,470),xy(119,460),xy(80,460),xy(79,450),xy(60,450),xy(60,440),xy(50,440),xy(50,430),xy(40,429),xy(40,110),xy(50,109),xy(50,100),xy(60,99),xy(60,90),xy(79,90),xy(80,80),xy(90,80),xy(90,449),xy(139,450),xy(139,470)]).
midline(r4, [xy(77,102),xy(74,104),xy(67,124),xy(63,129),xy(65,133),xy(64,410),xy(74,435),xy(84,446),xy(85,454),xy(117,454),xy(123,455),xy(130,460)]).
midline(r4, [xy(78,101),xy(84,93),xy(85,84)]).
fillpoint(r4, xy(64,270), 25.0).
fillpoint(r4, xy(74,105), 16.0).
fillpoint(r4, xy(74,434), 16.0).
fillpoint(r4, xy(129,460), 10.0).
region(r7, '#2ecc40', 16300, centroid(296,291)).
perimeter(r7, 920).
polygon(r7, [xy(299,420),xy(290,419),xy(290,300),xy(190,300),xy(190,250),xy(289,250),xy(290,200),xy(339,200),xy(340,190),xy(349,190),xy(350,229),xy(360,230),xy(360,309),xy(350,310),xy(350,349),xy(340,350),xy(340,369),xy(330,370),xy(329,380),xy(320,380),xy(320,399),xy(310,400),xy(310,409),xy(300,410),xy(299,420)]).
hole(r7, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r7, [xy(340,232),xy(340,212),xy(335,206),xy(329,204),xy(295,205),xy(295,243),xy(308,262),xy(310,262)]).
midline(r7, [xy(339,209),xy(344,203),xy(345,194)]).
midline(r7, [xy(310,264),xy(314,272),xy(313,275),xy(214,275)]).
midline(r7, [xy(315,275),xy(321,278),xy(323,284),xy(319,313),xy(319,324),xy(321,326),xy(316,336),xy(316,349),xy(305,373),xy(305,385),xy(300,394),xy(300,400),xy(295,406),xy(295,415)]).
midline(r7, [xy(321,328),xy(323,326),xy(324,329),xy(330,330),xy(329,332)]).
midline(r7, [xy(322,277),xy(336,262),xy(342,252),xy(345,244),xy(340,233)]).
midline(r7, [xy(332,332),xy(331,333)]).
midline(r7, [xy(324,284),xy(329,287),xy(331,286),xy(331,288)]).
midline(r7, [xy(333,288),xy(337,289),xy(337,291)]).
fillpoint(r7, xy(321,278), 38.8).
fillpoint(r7, xy(322,281), 38.0).
fillpoint(r7, xy(320,302), 31.0).
fillpoint(r7, xy(320,319), 30.0).
fillpoint(r7, xy(318,331), 29.0).
fillpoint(r7, xy(317,334), 28.0).
fillpoint(r7, xy(316,337), 27.0).
fillpoint(r7, xy(315,342), 26.0).
fillpoint(r7, xy(214,275), 25.0).
fillpoint(r7, xy(344,245), 16.0).
fillpoint(r7, xy(305,374), 16.0).
fillpoint(r7, xy(305,383), 15.0).
fillpoint(r7, xy(340,234), 11.0).
fillpoint(r7, xy(300,395), 11.0).
fillpoint(r7, xy(339,219), 10.0).
region(r5, '#ffdc00', 14500, centroid(246,193)).
perimeter(r5, 700).
polygon(r5, [xy(289,250),xy(140,249),xy(140,200),xy(240,199),xy(240,100),xy(269,100),xy(270,110),xy(289,110),xy(290,149),xy(319,150),xy(320,159),xy(329,160),xy(330,169),xy(340,170),xy(339,200),xy(290,200),xy(289,250)]).
midline(r5, [xy(308,178),xy(299,174),xy(272,175),xy(270,173),xy(265,158),xy(265,134),xy(259,126),xy(255,114)]).
midline(r5, [xy(271,175),xy(266,186),xy(263,213),xy(256,222),xy(238,225),xy(164,225)]).
midline(r5, [xy(309,178),xy(325,185)]).
fillpoint(r5, xy(271,175), 31.4).
fillpoint(r5, xy(260,220), 29.7).
fillpoint(r5, xy(268,168), 29.0).
fillpoint(r5, xy(268,181), 29.0).
fillpoint(r5, xy(261,218), 29.0).
fillpoint(r5, xy(258,221), 29.0).
fillpoint(r5, xy(267,165), 28.0).
fillpoint(r5, xy(267,184), 28.0).
fillpoint(r5, xy(262,215), 28.0).
fillpoint(r5, xy(255,222), 28.0).
fillpoint(r5, xy(266,162), 27.0).
fillpoint(r5, xy(266,187), 27.0).
fillpoint(r5, xy(263,212), 27.0).
fillpoint(r5, xy(252,223), 27.0).
fillpoint(r5, xy(265,158), 26.0).
fillpoint(r5, xy(265,192), 26.0).
fillpoint(r5, xy(264,208), 26.0).
fillpoint(r5, xy(248,224), 26.0).
fillpoint(r5, xy(265,141), 25.0).
fillpoint(r5, xy(291,175), 25.0).
fillpoint(r5, xy(164,225), 25.0).
fillpoint(r5, xy(255,115), 16.0).
fillpoint(r5, xy(324,184), 16.0).
region(r12, '#ffdc00', 12000, centroid(233,351)).
perimeter(r12, 600).
polygon(r12, [xy(259,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(290,429),xy(270,430),xy(270,439),xy(260,440),xy(259,450)]).
midline(r12, [xy(262,335),xy(259,328),xy(249,325),xy(164,325)]).
midline(r12, [xy(263,336),xy(265,351),xy(265,405),xy(257,417),xy(250,434),xy(250,440)]).
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
fillpoint(r12, xy(265,378), 25.0).
fillpoint(r12, xy(255,424), 16.0).
fillpoint(r12, xy(250,435), 11.0).
region(r24, '#5a5a5a', 5200, centroid(420,620)).
perimeter(r24, 560).
polygon(r24, [xy(549,630),xy(290,630),xy(290,610),xy(549,610),xy(549,630)]).
midline(r24, [xy(439,620),xy(299,620)]).
midline(r24, [xy(440,619),xy(540,620)]).
fillpoint(r24, xy(299,620), 10.0).
region(r23, '#2ecc40', 3200, centroid(210,620)).
perimeter(r23, 360).
polygon(r23, [xy(289,630),xy(130,630),xy(130,610),xy(289,610),xy(289,630)]).
midline(r23, [xy(163,619),xy(139,620)]).
midline(r23, [xy(164,619),xy(280,620)]).
fillpoint(r23, xy(139,620), 10.0).
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
region(r11, '#870c25', 1500, centroid(164,284)).
perimeter(r11, 160).
polygon(r11, [xy(189,300),xy(140,300),xy(140,270),xy(189,270),xy(189,300)]).
midline(r11, [xy(166,284),xy(154,285)]).
midline(r11, [xy(167,284),xy(175,285)]).
fillpoint(r11, xy(154,285), 15.0).
region(r10, '#bebebe', 1000, centroid(164,260)).
perimeter(r10, 140).
polygon(r10, [xy(189,270),xy(140,270),xy(140,250),xy(189,250),xy(189,270)]).
midline(r10, [xy(159,260),xy(149,260)]).
midline(r10, [xy(160,259),xy(180,260)]).
fillpoint(r10, xy(149,260), 10.0).
region(r8, '#5a5a5a', 800, centroid(314,224)).
perimeter(r8, 160).
polygon(r8, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r8, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r8, [xy(305,227),xy(305,234),xy(311,235),xy(323,234),xy(325,229),xy(323,215),xy(305,215),xy(305,226)]).
fillpoint(r8, xy(306,215), 6.0).
fillpoint(r8, xy(324,215), 6.0).
fillpoint(r8, xy(305,234), 6.0).
fillpoint(r8, xy(323,234), 6.0).
fillpoint(r8, xy(311,215), 5.0).
fillpoint(r8, xy(304,225), 5.0).
fillpoint(r8, xy(324,225), 5.0).
fillpoint(r8, xy(311,235), 5.0).
region(r6, '#2ecc40', 600, centroid(301,138)).
perimeter(r6, 120).
polygon(r6, [xy(319,150),xy(290,149),xy(290,120),xy(299,120),xy(300,129),xy(309,130),xy(310,139),xy(320,140),xy(319,150)]).
midline(r6, [xy(299,140),xy(295,133),xy(295,124)]).
midline(r6, [xy(301,140),xy(306,144),xy(315,145)]).
fillpoint(r6, xy(299,140), 10.0).
fillpoint(r6, xy(295,126), 5.0).
fillpoint(r6, xy(311,145), 5.0).
region(r20, '#ffdc00', 600, centroid(211,456)).
perimeter(r20, 140).
polygon(r20, [xy(199,470),xy(190,469),xy(190,450),xy(240,450),xy(239,460),xy(200,460),xy(199,470)]).
midline(r20, [xy(209,454),xy(195,455),xy(195,465)]).
midline(r20, [xy(210,455),xy(235,455)]).
fillpoint(r20, xy(196,455), 6.0).
fillpoint(r20, xy(201,455), 5.0).
fillpoint(r20, xy(195,463), 5.0).
region(r2, '#5a5a5a', 400, centroid(117,82)).
perimeter(r2, 100).
polygon(r2, [xy(129,90),xy(100,90),xy(100,80),xy(119,80),xy(120,70),xy(129,70),xy(129,90)]).
midline(r2, [xy(111,85),xy(104,85)]).
midline(r2, [xy(112,85),xy(123,84),xy(125,74)]).
fillpoint(r2, xy(123,84), 6.0).
fillpoint(r2, xy(125,76), 5.0).
fillpoint(r2, xy(104,85), 5.0).
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
region(r18, '#000000', 300, centroid(218,428)).
perimeter(r18, 80).
polygon(r18, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r18, [xy(214,434),xy(215,435)]).
midline(r18, [xy(215,433),xy(215,425),xy(225,425)]).
fillpoint(r18, xy(216,425), 6.0).
fillpoint(r18, xy(221,425), 5.0).
fillpoint(r18, xy(215,433), 5.0).
region(r9, '#2ecc40', 100, centroid(314,224)).
perimeter(r9, 40).
polygon(r9, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r9, [xy(315,225),xy(315,224)]).
fillpoint(r9, xy(314,225), 5.0).
region(r15, '#000000', 100, centroid(204,414)).
perimeter(r15, 40).
polygon(r15, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r15, [xy(205,415),xy(205,414)]).
fillpoint(r15, xy(204,415), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 40).
adjacent(r1, r3).
shared_edge(r1, r3, 220).
adjacent(r1, r4).
shared_edge(r1, r4, 540).
adjacent(r1, r5).
shared_edge(r1, r5, 110).
adjacent(r1, r6).
shared_edge(r1, r6, 60).
adjacent(r1, r7).
shared_edge(r1, r7, 320).
adjacent(r1, r12).
shared_edge(r1, r12, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 70).
adjacent(r1, r21).
shared_edge(r1, r21, 240).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 340).
adjacent(r1, r24).
shared_edge(r1, r24, 540).
adjacent(r1, r25).
shared_edge(r1, r25, 80).
adjacent(r1, r26).
shared_edge(r1, r26, 80).
adjacent(r1, r27).
shared_edge(r1, r27, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 60).
adjacent(r3, r4).
shared_edge(r3, r4, 440).
adjacent(r3, r5).
shared_edge(r3, r5, 270).
adjacent(r3, r10).
shared_edge(r3, r10, 20).
adjacent(r3, r11).
shared_edge(r3, r11, 30).
adjacent(r3, r12).
shared_edge(r3, r12, 250).
adjacent(r3, r15).
shared_edge(r3, r15, 40).
adjacent(r3, r18).
shared_edge(r3, r18, 80).
adjacent(r3, r20).
shared_edge(r3, r20, 70).
adjacent(r5, r6).
shared_edge(r5, r6, 60).
adjacent(r5, r7).
shared_edge(r5, r7, 210).
adjacent(r5, r10).
shared_edge(r5, r10, 50).
adjacent(r7, r8).
shared_edge(r7, r8, 120).
adjacent(r7, r10).
shared_edge(r7, r10, 20).
adjacent(r7, r11).
shared_edge(r7, r11, 30).
adjacent(r7, r12).
shared_edge(r7, r12, 220).
adjacent(r8, r9).
shared_edge(r8, r9, 40).
adjacent(r10, r11).
shared_edge(r10, r11, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r23, r24).
shared_edge(r23, r24, 20).

encloses(r8, r9).
encloses(r3, r15).
encloses(r3, r18).
encloses(r1, r21).
encloses(r1, r22).
encloses(r1, r25).
encloses(r1, r26).
