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

region(r1, '#aaaaaa', 291800, centroid(368,328)).
perimeter(r1, 5080).
polygon(r1, [xy(200,469),xy(200,460),xy(239,460),xy(240,450),xy(259,450),xy(260,440),xy(270,439),xy(270,430),xy(289,430),xy(290,420),xy(299,420),xy(300,410),xy(309,410),xy(310,400),xy(320,399),xy(320,380),xy(329,380),xy(330,370),xy(340,369),xy(340,350),xy(350,349),xy(350,310),xy(360,309),xy(360,230),xy(350,229),xy(350,190),xy(340,189),xy(340,170),xy(330,170),xy(330,160),xy(320,159),xy(320,140),xy(310,139),xy(310,130),xy(300,129),xy(300,120),xy(290,119),xy(289,110),xy(270,110),xy(270,100),xy(260,99),xy(259,90),xy(240,90),xy(239,80),xy(200,80),xy(199,70),xy(174,70),xy(120,70),xy(119,80),xy(80,80),xy(79,90),xy(60,90),xy(60,99),xy(50,100),xy(50,109),xy(40,110),xy(40,429),xy(49,430),xy(50,439),xy(59,440),xy(60,450),xy(79,450),xy(80,460),xy(119,460),xy(120,470),xy(200,469)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(492,147),xy(433,110),xy(379,82),xy(328,61),xy(303,56),xy(289,49),xy(256,41),xy(226,40),xy(215,36),xy(197,34),xy(121,34),xy(104,36),xy(93,40),xy(68,40),xy(45,45)]).
midline(r1, [xy(492,149),xy(499,207),xy(500,301),xy(498,342),xy(489,407),xy(428,348),xy(418,345),xy(414,347),xy(410,343),xy(402,340),xy(402,342)]).
midline(r1, [xy(416,347),xy(418,347)]).
midline(r1, [xy(418,349),xy(486,417),xy(480,446),xy(477,450),xy(455,461),xy(362,368),xy(453,461),xy(452,463),xy(415,483),xy(389,494),xy(384,494),xy(357,507),xy(299,525),xy(256,534),xy(243,534),xy(234,525),xy(234,518),xy(229,509),xy(231,507),xy(228,505),xy(222,487),xy(218,482),xy(221,483)]).
midline(r1, [xy(228,500),xy(231,505)]).
midline(r1, [xy(223,488),xy(224,490)]).
midline(r1, [xy(233,515),xy(233,513)]).
midline(r1, [xy(488,409),xy(487,411),xy(422,348)]).
midline(r1, [xy(407,344),xy(410,347)]).
midline(r1, [xy(479,449),xy(555,526),xy(555,630),xy(553,634),xy(132,635),xy(120,630),xy(84,593),xy(81,585),xy(71,572),xy(72,570),xy(70,569),xy(82,542),xy(58,514),xy(40,485),xy(20,437),xy(19,111),xy(21,98),xy(27,87),xy(28,80),xy(45,47)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,631),xy(583,634),xy(578,635),xy(555,633)]).
midline(r1, [xy(73,571),xy(74,573)]).
midline(r1, [xy(241,534),xy(198,540),xy(131,539),xy(83,543)]).
midline(r1, [xy(480,141),xy(430,191),xy(422,193),xy(417,191),xy(410,196),xy(406,195),xy(402,199),xy(400,198),xy(392,202),xy(389,200),xy(386,203),xy(390,203)]).
midline(r1, [xy(419,193),xy(417,193)]).
midline(r1, [xy(235,519),xy(236,525)]).
midline(r1, [xy(81,539),xy(82,534),xy(80,532),xy(77,535)]).
midline(r1, [xy(82,532),xy(84,521),xy(89,512),xy(89,504),xy(92,501)]).
midline(r1, [xy(85,524),xy(85,525)]).
midline(r1, [xy(236,529),xy(237,533)]).
midline(r1, [xy(478,140),xy(429,189)]).
midline(r1, [xy(408,197),xy(406,197)]).
midline(r1, [xy(586,556),xy(616,586),xy(614,589),xy(614,633),xy(608,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(425,351),xy(487,413),xy(487,416)]).
midline(r1, [xy(91,41),xy(94,42),xy(92,45),xy(95,46),xy(93,50),xy(96,47)]).
midline(r1, [xy(91,504),xy(92,503)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(54,60),xy(45,51),xy(43,53),xy(54,64),xy(55,61)]).
midline(r1, [xy(60,66),xy(57,63),xy(55,65),xy(61,71)]).
midline(r1, [xy(225,44),xy(223,47),xy(225,47)]).
midline(r1, [xy(98,51),xy(95,52),xy(99,56)]).
midline(r1, [xy(226,41),xy(227,42)]).
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
fillpoint(r1, xy(82,543), 82.4).
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
fillpoint(r1, xy(131,540), 70.0).
fillpoint(r1, xy(327,61), 62.0).
fillpoint(r1, xy(324,60), 61.0).
fillpoint(r1, xy(321,59), 60.0).
fillpoint(r1, xy(317,58), 59.0).
fillpoint(r1, xy(313,57), 58.0).
fillpoint(r1, xy(308,56), 57.0).
fillpoint(r1, xy(288,49), 50.0).
fillpoint(r1, xy(281,47), 48.0).
fillpoint(r1, xy(276,46), 47.0).
fillpoint(r1, xy(46,46), 46.2).
fillpoint(r1, xy(49,45), 46.0).
fillpoint(r1, xy(270,45), 46.0).
fillpoint(r1, xy(53,44), 45.0).
fillpoint(r1, xy(266,44), 45.0).
fillpoint(r1, xy(56,43), 44.0).
fillpoint(r1, xy(263,43), 44.0).
fillpoint(r1, xy(64,41), 42.0).
fillpoint(r1, xy(255,41), 42.0).
fillpoint(r1, xy(70,40), 41.0).
fillpoint(r1, xy(249,40), 41.0).
border(r1).
region(r3, '#2ecc40', 40500, centroid(157,256)).
perimeter(r3, 1620).
polygon(r3, [xy(189,470),xy(180,470),xy(179,460),xy(150,460),xy(150,469),xy(140,470),xy(139,450),xy(90,449),xy(90,80),xy(99,80),xy(100,90),xy(129,90),xy(130,70),xy(199,70),xy(200,80),xy(239,80),xy(240,90),xy(260,90),xy(259,100),xy(240,100),xy(239,200),xy(140,200),xy(140,349),xy(240,350),xy(240,449),xy(190,450),xy(189,470)]).
hole(r3, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
hole(r3, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r3, [xy(230,440),xy(223,444),xy(210,445),xy(204,443),xy(192,433),xy(166,425),xy(164,390),xy(144,381),xy(123,377),xy(117,366),xy(114,348),xy(115,191),xy(123,170),xy(145,143),xy(99,99),xy(95,93),xy(95,84)]).
midline(r3, [xy(146,143),xy(162,140),xy(172,135),xy(170,119),xy(166,112),xy(169,105),xy(178,98),xy(171,105),xy(173,108),xy(169,109)]).
midline(r3, [xy(165,425),xy(151,429),xy(133,444),xy(101,445),xy(95,443),xy(95,406),xy(122,377)]).
midline(r3, [xy(165,427),xy(162,429),xy(155,444),xy(146,454),xy(145,465)]).
midline(r3, [xy(170,117),xy(171,114),xy(168,112),xy(171,110),xy(172,113)]).
midline(r3, [xy(150,432),xy(151,431)]).
midline(r3, [xy(230,438),xy(235,429),xy(234,416),xy(224,404),xy(220,393),xy(209,379),xy(185,381),xy(165,390)]).
midline(r3, [xy(224,405),xy(195,434)]).
midline(r3, [xy(173,136),xy(178,138),xy(184,134),xy(226,95)]).
midline(r3, [xy(228,94),xy(255,95)]).
midline(r3, [xy(166,429),xy(171,440),xy(183,454),xy(185,465)]).
fillpoint(r3, xy(172,136), 63.5).
fillpoint(r3, xy(175,137), 63.0).
fillpoint(r3, xy(167,138), 62.0).
fillpoint(r3, xy(164,139), 61.0).
fillpoint(r3, xy(161,140), 60.0).
fillpoint(r3, xy(157,141), 59.0).
fillpoint(r3, xy(153,142), 58.0).
fillpoint(r3, xy(148,143), 57.0).
fillpoint(r3, xy(165,390), 40.3).
fillpoint(r3, xy(165,424), 35.4).
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
midline(r4, [xy(77,102),xy(74,104),xy(65,129),xy(59,128),xy(65,134),xy(64,409),xy(74,435),xy(84,446),xy(85,454),xy(119,454),xy(130,460)]).
midline(r4, [xy(78,101),xy(84,93),xy(85,84)]).
fillpoint(r4, xy(64,270), 25.0).
fillpoint(r4, xy(74,105), 16.0).
fillpoint(r4, xy(74,434), 16.0).
fillpoint(r4, xy(129,460), 10.0).
region(r7, '#2ecc40', 16300, centroid(296,291)).
perimeter(r7, 920).
polygon(r7, [xy(299,420),xy(290,419),xy(290,300),xy(190,300),xy(190,250),xy(289,250),xy(290,200),xy(339,200),xy(340,190),xy(349,190),xy(350,229),xy(360,230),xy(360,309),xy(350,310),xy(350,349),xy(340,350),xy(340,369),xy(330,370),xy(329,380),xy(320,380),xy(320,399),xy(310,400),xy(310,409),xy(300,410),xy(299,420)]).
hole(r7, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r7, [xy(340,232),xy(340,210),xy(335,206),xy(326,204),xy(295,205),xy(295,243),xy(309,261),xy(314,275),xy(214,275)]).
midline(r7, [xy(340,208),xy(344,203),xy(345,194)]).
midline(r7, [xy(340,233),xy(345,244),xy(340,256),xy(321,278),xy(316,275)]).
midline(r7, [xy(321,279),xy(324,285),xy(320,299),xy(320,327),xy(315,340),xy(316,348),xy(305,373),xy(305,385),xy(300,394),xy(300,400),xy(295,406),xy(295,415)]).
midline(r7, [xy(321,328),xy(329,330),xy(329,332)]).
midline(r7, [xy(325,285),xy(328,286),xy(330,284),xy(329,287)]).
midline(r7, [xy(331,287),xy(335,287),xy(336,290),xy(337,288)]).
midline(r7, [xy(339,290),xy(338,291)]).
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
midline(r5, [xy(308,178),xy(299,174),xy(300,171),xy(300,173)]).
midline(r5, [xy(298,175),xy(272,175),xy(270,173),xy(265,159),xy(265,134),xy(259,126),xy(255,114)]).
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
midline(r12, [xy(262,335),xy(260,329),xy(248,325),xy(164,325)]).
midline(r12, [xy(263,336),xy(265,352),xy(265,405),xy(257,417),xy(250,434),xy(250,440)]).
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
region(r23, '#5a5a5a', 6400, centroid(390,620)).
perimeter(r23, 680).
polygon(r23, [xy(549,630),xy(230,630),xy(230,610),xy(549,610),xy(549,630)]).
midline(r23, [xy(445,620),xy(239,620)]).
midline(r23, [xy(446,620),xy(540,620)]).
fillpoint(r23, xy(239,620), 10.0).
region(r22, '#2ecc40', 2000, centroid(180,620)).
perimeter(r22, 240).
polygon(r22, [xy(229,630),xy(130,630),xy(130,610),xy(229,610),xy(229,630)]).
midline(r22, [xy(184,620),xy(139,620)]).
midline(r22, [xy(185,619),xy(220,620)]).
fillpoint(r22, xy(139,620), 10.0).
region(r11, '#870c25', 1500, centroid(164,284)).
perimeter(r11, 160).
polygon(r11, [xy(189,300),xy(140,300),xy(140,270),xy(189,270),xy(189,300)]).
midline(r11, [xy(166,284),xy(154,285)]).
midline(r11, [xy(167,284),xy(175,285)]).
fillpoint(r11, xy(154,285), 15.0).
region(r10, '#bebebe', 1000, centroid(164,260)).
perimeter(r10, 140).
polygon(r10, [xy(189,270),xy(140,270),xy(140,250),xy(189,250),xy(189,270)]).
midline(r10, [xy(170,260),xy(149,260)]).
midline(r10, [xy(171,259),xy(180,260)]).
fillpoint(r10, xy(149,260), 10.0).
region(r8, '#5a5a5a', 800, centroid(314,224)).
perimeter(r8, 160).
polygon(r8, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r8, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r8, [xy(324,232),xy(325,221),xy(323,215),xy(305,215),xy(304,220),xy(305,234),xy(324,234)]).
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
midline(r2, [xy(113,85),xy(104,85)]).
midline(r2, [xy(114,84),xy(123,84),xy(125,74)]).
fillpoint(r2, xy(123,84), 6.0).
fillpoint(r2, xy(125,76), 5.0).
fillpoint(r2, xy(104,85), 5.0).
region(r24, '#7fdbff', 400, centroid(570,620)).
perimeter(r24, 80).
polygon(r24, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r24, [xy(569,619),xy(570,620)]).
fillpoint(r24, xy(569,620), 10.0).
region(r25, '#7fdbff', 400, centroid(600,620)).
perimeter(r25, 80).
polygon(r25, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r25, [xy(599,619),xy(600,620)]).
fillpoint(r25, xy(599,620), 10.0).
region(r26, '#7fdbff', 400, centroid(630,620)).
perimeter(r26, 80).
polygon(r26, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r26, [xy(629,619),xy(630,620)]).
fillpoint(r26, xy(629,620), 10.0).
border(r26).
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
shared_edge(r1, r3, 190).
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
adjacent(r1, r22).
shared_edge(r1, r22, 220).
adjacent(r1, r23).
shared_edge(r1, r23, 660).
adjacent(r1, r24).
shared_edge(r1, r24, 80).
adjacent(r1, r25).
shared_edge(r1, r25, 80).
adjacent(r1, r26).
shared_edge(r1, r26, 60).
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
adjacent(r22, r23).
shared_edge(r22, r23, 20).

encloses(r8, r9).
encloses(r3, r15).
encloses(r3, r18).
encloses(r1, r24).
encloses(r1, r25).
