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

region(r1, '#aaaaaa', 271200, centroid(325,330)).
perimeter(r1, 5560).
polygon(r1, [xy(350,469),xy(350,460),xy(389,460),xy(390,450),xy(409,450),xy(410,440),xy(419,440),xy(420,430),xy(439,430),xy(440,420),xy(449,420),xy(450,410),xy(459,410),xy(460,400),xy(470,399),xy(470,380),xy(479,380),xy(480,370),xy(490,369),xy(490,350),xy(500,349),xy(500,310),xy(510,309),xy(510,230),xy(500,229),xy(500,190),xy(490,189),xy(490,170),xy(480,170),xy(480,160),xy(470,159),xy(470,140),xy(460,140),xy(460,130),xy(450,130),xy(449,120),xy(440,119),xy(439,110),xy(420,110),xy(420,100),xy(410,100),xy(409,90),xy(390,90),xy(389,80),xy(350,80),xy(349,70),xy(290,70),xy(270,70),xy(269,80),xy(230,80),xy(229,90),xy(210,90),xy(210,99),xy(200,100),xy(199,110),xy(180,110),xy(180,119),xy(170,120),xy(170,129),xy(160,130),xy(159,140),xy(150,140),xy(150,159),xy(140,160),xy(139,170),xy(130,170),xy(130,189),xy(120,190),xy(120,229),xy(110,230),xy(110,309),xy(120,310),xy(120,349),xy(130,350),xy(130,369),xy(139,370),xy(140,379),xy(150,380),xy(150,399),xy(159,400),xy(160,409),xy(169,410),xy(170,419),xy(179,420),xy(180,430),xy(199,430),xy(200,439),xy(209,440),xy(210,450),xy(229,450),xy(230,460),xy(269,460),xy(270,470),xy(350,469)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(84,84),xy(77,114),xy(69,134),xy(60,175),xy(60,196),xy(56,210),xy(54,230),xy(54,309),xy(57,334),xy(59,342),xy(62,343),xy(59,348),xy(62,375),xy(69,405),xy(88,462),xy(31,518),xy(19,533),xy(15,543),xy(14,567),xy(17,579),xy(15,583),xy(14,605),xy(17,622),xy(35,625),xy(49,625),xy(59,622),xy(59,599),xy(40,580),xy(18,579)]).
midline(r1, [xy(60,623),xy(86,625),xy(106,620),xy(109,617),xy(110,602),xy(114,590),xy(122,578),xy(144,554),xy(163,525),xy(148,508),xy(138,502),xy(117,482),xy(89,463)]).
midline(r1, [xy(164,524),xy(213,534),xy(229,533),xy(230,535),xy(232,533),xy(230,532)]).
midline(r1, [xy(232,534),xy(247,538),xy(270,540),xy(349,540),xy(386,535),xy(386,524),xy(382,518),xy(382,512),xy(379,509),xy(381,507),xy(377,503),xy(376,494),xy(371,488),xy(373,488)]).
midline(r1, [xy(380,504),xy(379,503)]).
midline(r1, [xy(109,619),xy(124,633),xy(133,635),xy(553,634),xy(555,632),xy(555,525),xy(528,498),xy(499,510),xy(483,513),xy(456,523),xy(406,534),xy(403,534),xy(388,519),xy(386,520),xy(384,518),xy(386,514),xy(381,509)]).
midline(r1, [xy(528,497),xy(544,460),xy(557,416),xy(510,369),xy(557,414),xy(568,372),xy(570,348),xy(565,344),xy(550,341),xy(520,327),xy(520,329)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,632),xy(578,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(566,347),xy(564,346)]).
midline(r1, [xy(388,518),xy(386,516),xy(388,516)]).
midline(r1, [xy(569,346),xy(574,325),xy(575,308),xy(575,230),xy(573,208),xy(570,194),xy(567,192),xy(562,192),xy(549,200),xy(544,197),xy(540,201),xy(544,199),xy(543,202)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,626),xy(613,634),xy(592,635),xy(585,633)]).
midline(r1, [xy(388,534),xy(391,533),xy(387,529),xy(388,523),xy(386,522)]).
midline(r1, [xy(389,529),xy(392,534)]).
midline(r1, [xy(394,534),xy(398,533),xy(388,521)]).
midline(r1, [xy(391,524),xy(399,534)]).
midline(r1, [xy(570,192),xy(568,191)]).
midline(r1, [xy(569,189),xy(566,157),xy(547,91),xy(478,61),xy(453,56),xy(432,47),xy(406,41),xy(376,40),xy(365,36),xy(349,34),xy(270,34),xy(242,40),xy(218,40),xy(187,47),xy(166,56),xy(147,59),xy(86,84)]).
midline(r1, [xy(429,49),xy(408,70)]).
midline(r1, [xy(427,48),xy(408,67)]).
midline(r1, [xy(377,41),xy(374,44),xy(376,44)]).
midline(r1, [xy(243,41),xy(243,45),xy(245,45)]).
midline(r1, [xy(61,197),xy(67,197),xy(67,199)]).
midline(r1, [xy(69,197),xy(70,200),xy(79,203),xy(83,202),xy(83,204)]).
midline(r1, [xy(546,201),xy(547,200)]).
midline(r1, [xy(567,194),xy(558,197)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(62,345),xy(65,341),xy(65,343)]).
midline(r1, [xy(67,341),xy(71,339),xy(71,341)]).
midline(r1, [xy(73,339),xy(74,342),xy(75,338),xy(78,337),xy(77,339)]).
midline(r1, [xy(80,337),xy(83,335),xy(83,337)]).
midline(r1, [xy(85,335),xy(97,328),xy(97,330)]).
midline(r1, [xy(468,60),xy(466,62)]).
midline(r1, [xy(234,521),xy(236,519),xy(235,514),xy(240,509),xy(239,505),xy(243,500),xy(243,492),xy(245,490),xy(245,494)]).
midline(r1, [xy(237,516),xy(239,512)]).
midline(r1, [xy(236,521),xy(231,527),xy(232,530),xy(235,525)]).
fillpoint(r1, xy(528,498), 111.7).
fillpoint(r1, xy(498,510), 100.0).
fillpoint(r1, xy(488,513), 97.0).
fillpoint(r1, xy(544,459), 96.0).
fillpoint(r1, xy(484,514), 96.0).
fillpoint(r1, xy(545,456), 95.0).
fillpoint(r1, xy(480,515), 95.0).
fillpoint(r1, xy(546,453), 94.0).
fillpoint(r1, xy(475,516), 94.0).
fillpoint(r1, xy(547,450), 93.0).
fillpoint(r1, xy(548,91), 92.0).
fillpoint(r1, xy(549,96), 91.0).
fillpoint(r1, xy(549,443), 91.0).
fillpoint(r1, xy(550,100), 90.0).
fillpoint(r1, xy(550,439), 90.0).
fillpoint(r1, xy(551,105), 89.0).
fillpoint(r1, xy(551,434), 89.0).
fillpoint(r1, xy(88,463), 89.0).
fillpoint(r1, xy(90,464), 88.5).
fillpoint(r1, xy(92,465), 87.9).
fillpoint(r1, xy(162,522), 87.4).
fillpoint(r1, xy(553,111), 87.0).
fillpoint(r1, xy(553,428), 87.0).
fillpoint(r1, xy(86,458), 87.0).
fillpoint(r1, xy(164,523), 87.0).
fillpoint(r1, xy(455,523), 87.0).
fillpoint(r1, xy(100,470), 85.6).
fillpoint(r1, xy(149,509), 85.6).
fillpoint(r1, xy(85,85), 85.1).
fillpoint(r1, xy(103,472), 85.0).
fillpoint(r1, xy(146,507), 85.0).
fillpoint(r1, xy(171,525), 85.0).
fillpoint(r1, xy(448,525), 85.0).
fillpoint(r1, xy(143,505), 84.5).
fillpoint(r1, xy(106,474), 84.4).
fillpoint(r1, xy(140,503), 84.1).
fillpoint(r1, xy(176,526), 84.0).
fillpoint(r1, xy(443,526), 84.0).
fillpoint(r1, xy(137,501), 83.8).
fillpoint(r1, xy(138,502), 83.8).
fillpoint(r1, xy(181,527), 83.0).
fillpoint(r1, xy(438,527), 83.0).
fillpoint(r1, xy(115,481), 82.9).
fillpoint(r1, xy(124,489), 82.1).
fillpoint(r1, xy(125,490), 82.1).
fillpoint(r1, xy(80,99), 81.0).
fillpoint(r1, xy(559,129), 81.0).
fillpoint(r1, xy(559,410), 81.0).
fillpoint(r1, xy(80,440), 81.0).
fillpoint(r1, xy(189,529), 81.0).
fillpoint(r1, xy(430,529), 81.0).
fillpoint(r1, xy(79,103), 80.0).
fillpoint(r1, xy(560,133), 80.0).
fillpoint(r1, xy(560,406), 80.0).
fillpoint(r1, xy(79,436), 80.0).
fillpoint(r1, xy(193,530), 80.0).
fillpoint(r1, xy(426,530), 80.0).
fillpoint(r1, xy(78,107), 79.0).
fillpoint(r1, xy(561,137), 79.0).
fillpoint(r1, xy(561,402), 79.0).
fillpoint(r1, xy(78,432), 79.0).
fillpoint(r1, xy(197,531), 79.0).
fillpoint(r1, xy(422,531), 79.0).
fillpoint(r1, xy(77,112), 78.0).
fillpoint(r1, xy(562,142), 78.0).
fillpoint(r1, xy(562,398), 78.0).
fillpoint(r1, xy(77,428), 78.0).
fillpoint(r1, xy(202,532), 78.0).
fillpoint(r1, xy(418,532), 78.0).
fillpoint(r1, xy(563,147), 77.0).
fillpoint(r1, xy(563,392), 77.0).
fillpoint(r1, xy(208,533), 77.0).
fillpoint(r1, xy(412,533), 77.0).
fillpoint(r1, xy(216,534), 76.0).
fillpoint(r1, xy(404,534), 76.0).
fillpoint(r1, xy(565,154), 75.0).
fillpoint(r1, xy(565,385), 75.0).
fillpoint(r1, xy(232,535), 75.0).
fillpoint(r1, xy(386,535), 75.0).
fillpoint(r1, xy(566,158), 74.0).
fillpoint(r1, xy(566,381), 74.0).
fillpoint(r1, xy(238,536), 74.0).
fillpoint(r1, xy(381,536), 74.0).
fillpoint(r1, xy(567,163), 73.0).
fillpoint(r1, xy(567,376), 73.0).
fillpoint(r1, xy(243,537), 73.0).
fillpoint(r1, xy(376,537), 73.0).
fillpoint(r1, xy(568,169), 72.0).
fillpoint(r1, xy(568,371), 72.0).
fillpoint(r1, xy(249,538), 72.0).
fillpoint(r1, xy(371,538), 72.0).
fillpoint(r1, xy(70,132), 71.0).
fillpoint(r1, xy(569,177), 71.0).
fillpoint(r1, xy(569,363), 71.0).
fillpoint(r1, xy(70,407), 71.0).
fillpoint(r1, xy(257,539), 71.0).
fillpoint(r1, xy(363,539), 71.0).
fillpoint(r1, xy(69,135), 70.0).
fillpoint(r1, xy(569,193), 70.0).
fillpoint(r1, xy(569,347), 70.0).
fillpoint(r1, xy(69,404), 70.0).
fillpoint(r1, xy(271,540), 70.0).
fillpoint(r1, xy(68,139), 69.0).
fillpoint(r1, xy(571,199), 69.0).
fillpoint(r1, xy(571,340), 69.0).
fillpoint(r1, xy(68,400), 69.0).
fillpoint(r1, xy(67,144), 68.0).
fillpoint(r1, xy(572,204), 68.0).
fillpoint(r1, xy(572,335), 68.0).
fillpoint(r1, xy(67,395), 68.0).
fillpoint(r1, xy(66,150), 67.0).
fillpoint(r1, xy(573,210), 67.0).
fillpoint(r1, xy(573,330), 67.0).
fillpoint(r1, xy(66,390), 67.0).
fillpoint(r1, xy(574,217), 66.0).
fillpoint(r1, xy(574,323), 66.0).
fillpoint(r1, xy(64,157), 65.0).
fillpoint(r1, xy(574,270), 65.0).
fillpoint(r1, xy(64,382), 65.0).
fillpoint(r1, xy(62,165), 63.0).
fillpoint(r1, xy(62,374), 63.0).
fillpoint(r1, xy(142,61), 62.0).
fillpoint(r1, xy(477,61), 62.0).
fillpoint(r1, xy(61,170), 62.0).
fillpoint(r1, xy(61,369), 62.0).
fillpoint(r1, xy(145,60), 61.0).
fillpoint(r1, xy(474,60), 61.0).
fillpoint(r1, xy(60,178), 61.0).
fillpoint(r1, xy(60,362), 61.0).
fillpoint(r1, xy(148,59), 60.0).
fillpoint(r1, xy(471,59), 60.0).
fillpoint(r1, xy(60,194), 60.0).
fillpoint(r1, xy(60,345), 60.0).
fillpoint(r1, xy(152,58), 59.0).
fillpoint(r1, xy(467,58), 59.0).
fillpoint(r1, xy(58,202), 59.0).
fillpoint(r1, xy(58,337), 59.0).
fillpoint(r1, xy(156,57), 58.0).
fillpoint(r1, xy(463,57), 58.0).
fillpoint(r1, xy(57,206), 58.0).
fillpoint(r1, xy(57,333), 58.0).
fillpoint(r1, xy(161,56), 57.0).
fillpoint(r1, xy(458,56), 57.0).
fillpoint(r1, xy(56,211), 57.0).
fillpoint(r1, xy(56,328), 57.0).
fillpoint(r1, xy(55,218), 56.0).
fillpoint(r1, xy(55,321), 56.0).
fillpoint(r1, xy(54,270), 55.0).
fillpoint(r1, xy(181,49), 50.0).
fillpoint(r1, xy(438,49), 50.0).
fillpoint(r1, xy(188,47), 48.0).
fillpoint(r1, xy(431,47), 48.0).
fillpoint(r1, xy(193,46), 47.0).
fillpoint(r1, xy(426,46), 47.0).
fillpoint(r1, xy(199,45), 46.0).
fillpoint(r1, xy(420,45), 46.0).
fillpoint(r1, xy(203,44), 45.0).
fillpoint(r1, xy(416,44), 45.0).
fillpoint(r1, xy(206,43), 44.0).
fillpoint(r1, xy(413,43), 44.0).
fillpoint(r1, xy(214,41), 42.0).
fillpoint(r1, xy(405,41), 42.0).
fillpoint(r1, xy(220,40), 41.0).
fillpoint(r1, xy(399,40), 41.0).
fillpoint(r1, xy(244,39), 40.0).
fillpoint(r1, xy(388,39), 40.0).
fillpoint(r1, xy(251,37), 38.0).
fillpoint(r1, xy(368,37), 38.0).
fillpoint(r1, xy(255,36), 37.0).
fillpoint(r1, xy(364,36), 37.0).
fillpoint(r1, xy(261,35), 36.0).
fillpoint(r1, xy(359,35), 36.0).
fillpoint(r1, xy(271,35), 35.0).
border(r1).
region(r2, '#2ecc40', 72400, centroid(299,267)).
perimeter(r2, 3520).
polygon(r2, [xy(339,470),xy(290,469),xy(290,300),xy(340,299),xy(340,250),xy(290,250),xy(290,200),xy(339,200),xy(340,150),xy(290,150),xy(289,100),xy(240,100),xy(239,200),xy(140,200),xy(140,250),xy(290,250),xy(289,300),xy(140,300),xy(140,350),xy(240,350),xy(239,450),xy(210,449),xy(210,440),xy(219,440),xy(220,430),xy(230,429),xy(229,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(200,440),xy(199,430),xy(180,430),xy(180,420),xy(170,420),xy(170,410),xy(160,410),xy(159,400),xy(150,399),xy(150,380),xy(140,380),xy(140,370),xy(130,369),xy(130,350),xy(120,349),xy(120,310),xy(110,309),xy(110,230),xy(120,229),xy(120,190),xy(130,189),xy(130,170),xy(139,170),xy(140,160),xy(150,159),xy(150,140),xy(159,140),xy(160,130),xy(169,130),xy(170,120),xy(179,120),xy(180,110),xy(199,110),xy(200,100),xy(210,99),xy(210,90),xy(229,90),xy(230,80),xy(269,80),xy(270,70),xy(339,70),xy(340,100),xy(389,100),xy(390,90),xy(409,90),xy(410,99),xy(419,100),xy(420,110),xy(440,110),xy(439,150),xy(390,150),xy(390,199),xy(440,200),xy(440,349),xy(490,350),xy(490,369),xy(480,370),xy(480,379),xy(470,380),xy(470,399),xy(460,400),xy(460,409),xy(450,410),xy(450,419),xy(440,420),xy(439,430),xy(420,430),xy(420,439),xy(410,440),xy(409,450),xy(390,450),xy(390,350),xy(340,350),xy(339,470)]).
hole(r2, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r2, [xy(139,360),xy(134,346),xy(129,340),xy(130,310),xy(124,295),xy(135,275),xy(127,262),xy(124,247),xy(129,235),xy(129,199),xy(144,184),xy(169,175),xy(190,160),xy(197,159),xy(200,155),xy(200,150),xy(217,124),xy(224,104),xy(239,89),xy(269,90),xy(284,84),xy(302,87),xy(314,95),xy(315,109),xy(319,120),xy(330,124),xy(353,126),xy(364,132),xy(380,125),xy(397,124),xy(400,119),xy(400,99)]).
midline(r2, [xy(365,133),xy(364,224),xy(347,216),xy(333,205),xy(295,205),xy(295,244),xy(263,275),xy(136,274)]).
midline(r2, [xy(265,275),xy(319,329),xy(314,350),xy(315,445)]).
midline(r2, [xy(320,329),xy(330,325),xy(349,324),xy(361,320),xy(375,312),xy(390,299),xy(390,250),xy(365,225)]).
midline(r2, [xy(390,301),xy(402,314),xy(410,328),xy(414,341),xy(416,363),xy(426,383),xy(418,402),xy(407,417),xy(400,434),xy(400,440)]).
midline(r2, [xy(427,383),xy(442,378),xy(457,367),xy(474,360),xy(480,360)]).
midline(r2, [xy(296,244),xy(329,245),xy(335,243),xy(356,227),xy(356,229)]).
midline(r2, [xy(358,228),xy(363,225)]).
midline(r2, [xy(141,360),xy(162,367),xy(185,382),xy(183,386),xy(185,387),xy(184,405),xy(189,414),xy(189,420),xy(196,424),xy(204,425),xy(204,435),xy(205,435),xy(214,445),xy(225,443),xy(233,435),xy(234,416),xy(224,404),xy(220,393),xy(209,379),xy(186,381)]).
midline(r2, [xy(224,405),xy(205,424)]).
midline(r2, [xy(399,124),xy(420,130)]).
midline(r2, [xy(416,406),xy(418,404),xy(417,407),xy(420,406),xy(419,409),xy(423,411)]).
fillpoint(r2, xy(389,249), 50.0).
fillpoint(r2, xy(389,276), 50.0).
fillpoint(r2, xy(198,158), 41.0).
fillpoint(r2, xy(426,383), 36.1).
fillpoint(r2, xy(186,381), 32.0).
fillpoint(r2, xy(365,131), 31.4).
fillpoint(r2, xy(192,380), 31.0).
fillpoint(r2, xy(201,380), 30.0).
fillpoint(r2, xy(319,120), 29.7).
fillpoint(r2, xy(319,329), 29.7).
fillpoint(r2, xy(318,118), 29.0).
fillpoint(r2, xy(321,121), 29.0).
fillpoint(r2, xy(358,128), 29.0).
fillpoint(r2, xy(371,128), 29.0).
fillpoint(r2, xy(358,321), 29.0).
fillpoint(r2, xy(321,328), 29.0).
fillpoint(r2, xy(318,331), 29.0).
fillpoint(r2, xy(411,331), 29.0).
fillpoint(r2, xy(418,368), 29.0).
fillpoint(r2, xy(178,378), 29.0).
fillpoint(r2, xy(441,378), 29.0).
fillpoint(r2, xy(418,401), 29.0).
fillpoint(r2, xy(317,115), 28.0).
fillpoint(r2, xy(324,122), 28.0).
fillpoint(r2, xy(355,127), 28.0).
fillpoint(r2, xy(374,127), 28.0).
fillpoint(r2, xy(355,322), 28.0).
fillpoint(r2, xy(324,327), 28.0).
fillpoint(r2, xy(317,334), 28.0).
fillpoint(r2, xy(412,334), 28.0).
fillpoint(r2, xy(417,365), 28.0).
fillpoint(r2, xy(316,112), 27.0).
fillpoint(r2, xy(327,123), 27.0).
fillpoint(r2, xy(352,126), 27.0).
fillpoint(r2, xy(377,126), 27.0).
fillpoint(r2, xy(352,323), 27.0).
fillpoint(r2, xy(327,326), 27.0).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(413,337), 27.0).
fillpoint(r2, xy(416,362), 27.0).
fillpoint(r2, xy(315,108), 26.0).
fillpoint(r2, xy(332,124), 26.0).
fillpoint(r2, xy(398,124), 26.0).
fillpoint(r2, xy(348,125), 26.0).
fillpoint(r2, xy(382,125), 26.0).
fillpoint(r2, xy(348,324), 26.0).
fillpoint(r2, xy(332,325), 26.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(414,342), 26.0).
fillpoint(r2, xy(415,358), 26.0).
fillpoint(r2, xy(314,95), 25.5).
fillpoint(r2, xy(135,275), 25.5).
fillpoint(r2, xy(364,175), 25.0).
fillpoint(r2, xy(141,275), 25.0).
fillpoint(r2, xy(315,398), 25.0).
fillpoint(r2, xy(413,129), 21.0).
fillpoint(r2, xy(295,85), 16.0).
fillpoint(r2, xy(224,105), 16.0).
fillpoint(r2, xy(145,184), 16.0).
fillpoint(r2, xy(125,255), 16.0).
fillpoint(r2, xy(125,294), 16.0).
fillpoint(r2, xy(155,365), 16.0).
fillpoint(r2, xy(464,365), 16.0).
fillpoint(r2, xy(224,404), 16.0).
fillpoint(r2, xy(405,424), 16.0).
fillpoint(r2, xy(283,85), 15.0).
fillpoint(r2, xy(124,246), 15.0).
region(r4, '#ffdc00', 15000, centroid(248,191)).
perimeter(r4, 700).
polygon(r4, [xy(289,250),xy(140,249),xy(140,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r4, [xy(263,210),xy(260,220),xy(248,224),xy(164,225)]).
midline(r4, [xy(264,209),xy(266,186),xy(271,175),xy(265,159),xy(265,124)]).
midline(r4, [xy(272,175),xy(315,175)]).
fillpoint(r4, xy(271,175), 31.4).
fillpoint(r4, xy(260,220), 29.7).
fillpoint(r4, xy(268,168), 29.0).
fillpoint(r4, xy(268,181), 29.0).
fillpoint(r4, xy(261,218), 29.0).
fillpoint(r4, xy(258,221), 29.0).
fillpoint(r4, xy(267,165), 28.0).
fillpoint(r4, xy(267,184), 28.0).
fillpoint(r4, xy(262,215), 28.0).
fillpoint(r4, xy(255,222), 28.0).
fillpoint(r4, xy(266,162), 27.0).
fillpoint(r4, xy(266,187), 27.0).
fillpoint(r4, xy(263,212), 27.0).
fillpoint(r4, xy(252,223), 27.0).
fillpoint(r4, xy(265,158), 26.0).
fillpoint(r4, xy(265,192), 26.0).
fillpoint(r4, xy(264,208), 26.0).
fillpoint(r4, xy(248,224), 26.0).
fillpoint(r4, xy(265,136), 25.0).
fillpoint(r4, xy(291,175), 25.0).
fillpoint(r4, xy(164,225), 25.0).
region(r12, '#ffdc00', 13300, centroid(236,361)).
perimeter(r12, 660).
polygon(r12, [xy(289,470),xy(270,470),xy(269,460),xy(230,459),xy(230,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(289,470)]).
midline(r12, [xy(265,407),xy(265,351),xy(260,329),xy(239,324),xy(164,325)]).
midline(r12, [xy(265,408),xy(265,434),xy(245,453),xy(234,455)]).
midline(r12, [xy(265,435),xy(275,446),xy(280,460)]).
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
fillpoint(r12, xy(265,393), 25.0).
fillpoint(r12, xy(279,455), 11.0).
region(r5, '#ffdc00', 11800, centroid(456,229)).
perimeter(r5, 660).
polygon(r5, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,150),xy(439,150),xy(440,120),xy(449,120),xy(450,129),xy(459,130),xy(460,139),xy(470,140),xy(470,159),xy(479,160),xy(480,169),xy(490,170),xy(489,350)]).
midline(r5, [xy(464,280),xy(465,190),xy(460,180),xy(448,169),xy(409,170)]).
midline(r5, [xy(465,281),xy(470,301),xy(470,330)]).
midline(r5, [xy(450,169),xy(455,154),xy(450,145),xy(450,139),xy(445,133),xy(445,124)]).
fillpoint(r5, xy(464,189), 25.0).
fillpoint(r5, xy(464,236), 25.0).
fillpoint(r5, xy(450,170), 22.8).
fillpoint(r5, xy(459,179), 22.8).
fillpoint(r5, xy(469,293), 21.0).
fillpoint(r5, xy(409,170), 20.0).
fillpoint(r5, xy(469,316), 20.0).
fillpoint(r5, xy(454,155), 16.0).
fillpoint(r5, xy(450,144), 11.0).
region(r15, '#ffdc00', 5100, centroid(364,411)).
perimeter(r15, 320).
polygon(r15, [xy(349,470),xy(340,469),xy(340,360),xy(389,360),xy(390,459),xy(350,460),xy(349,470)]).
midline(r15, [xy(350,450),xy(345,456),xy(345,465)]).
midline(r15, [xy(351,449),xy(365,433),xy(365,384)]).
fillpoint(r15, xy(364,410), 25.0).
region(r20, '#2ecc40', 4400, centroid(240,620)).
perimeter(r20, 480).
polygon(r20, [xy(349,630),xy(130,630),xy(130,610),xy(349,610),xy(349,630)]).
midline(r20, [xy(290,620),xy(139,620)]).
midline(r20, [xy(291,619),xy(340,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r21, '#5a5a5a', 4000, centroid(450,620)).
perimeter(r21, 440).
polygon(r21, [xy(549,630),xy(350,630),xy(350,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(510,620),xy(359,620)]).
midline(r21, [xy(511,619),xy(540,620)]).
fillpoint(r21, xy(359,620), 10.0).
region(r7, '#2ecc40', 2400, centroid(498,270)).
perimeter(r7, 360).
polygon(r7, [xy(499,350),xy(490,349),xy(490,190),xy(500,190),xy(500,229),xy(510,230),xy(510,309),xy(500,310),xy(499,350)]).
midline(r7, [xy(495,326),xy(494,310),xy(500,300),xy(500,239),xy(496,235),xy(494,228),xy(495,194)]).
midline(r7, [xy(495,327),xy(495,345)]).
fillpoint(r7, xy(499,270), 10.0).
fillpoint(r7, xy(495,211), 5.0).
fillpoint(r7, xy(495,328), 5.0).
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
region(r11, '#870c25', 1500, centroid(314,284)).
perimeter(r11, 160).
polygon(r11, [xy(339,300),xy(290,300),xy(290,270),xy(339,270),xy(339,300)]).
midline(r11, [xy(310,285),xy(304,285)]).
midline(r11, [xy(311,285),xy(325,285)]).
fillpoint(r11, xy(304,285), 15.0).
region(r3, '#ffdc00', 1100, centroid(363,88)).
perimeter(r3, 160).
polygon(r3, [xy(389,100),xy(340,100),xy(340,70),xy(349,70),xy(350,80),xy(389,80),xy(389,100)]).
midline(r3, [xy(349,90),xy(345,83),xy(345,74)]).
midline(r3, [xy(351,90),xy(380,90)]).
fillpoint(r3, xy(349,90), 10.0).
fillpoint(r3, xy(345,76), 5.0).
region(r10, '#bebebe', 1000, centroid(314,260)).
perimeter(r10, 140).
polygon(r10, [xy(339,270),xy(290,270),xy(290,250),xy(339,250),xy(339,270)]).
midline(r10, [xy(310,259),xy(299,260)]).
midline(r10, [xy(311,259),xy(330,260)]).
fillpoint(r10, xy(299,260), 10.0).
region(r8, '#5a5a5a', 800, centroid(314,224)).
perimeter(r8, 160).
polygon(r8, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r8, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r8, [xy(319,214),xy(305,215),xy(305,234),xy(318,235),xy(324,233),xy(325,220),xy(324,216),xy(320,215)]).
fillpoint(r8, xy(306,215), 6.0).
fillpoint(r8, xy(324,215), 6.0).
fillpoint(r8, xy(305,234), 6.0).
fillpoint(r8, xy(323,234), 6.0).
fillpoint(r8, xy(311,215), 5.0).
fillpoint(r8, xy(304,225), 5.0).
fillpoint(r8, xy(324,225), 5.0).
fillpoint(r8, xy(311,235), 5.0).
region(r6, '#0074d9', 500, centroid(414,194)).
perimeter(r6, 120).
polygon(r6, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r6, [xy(420,194),xy(394,195)]).
midline(r6, [xy(421,194),xy(435,195)]).
fillpoint(r6, xy(394,195), 5.0).
region(r13, '#0074d9', 500, centroid(444,324)).
perimeter(r13, 120).
polygon(r13, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r13, [xy(445,314),xy(445,345)]).
midline(r13, [xy(445,313),xy(445,304)]).
fillpoint(r13, xy(444,325), 5.0).
region(r14, '#0074d9', 500, centroid(364,354)).
perimeter(r14, 120).
polygon(r14, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r14, [xy(359,354),xy(344,355)]).
midline(r14, [xy(360,354),xy(385,355)]).
fillpoint(r14, xy(344,355), 5.0).
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
region(r17, '#000000', 300, centroid(218,428)).
perimeter(r17, 80).
polygon(r17, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r17, [xy(215,431),xy(215,425),xy(225,425)]).
midline(r17, [xy(215,432),xy(215,435)]).
fillpoint(r17, xy(216,425), 6.0).
fillpoint(r17, xy(221,425), 5.0).
fillpoint(r17, xy(215,433), 5.0).
region(r9, '#2ecc40', 100, centroid(314,224)).
perimeter(r9, 40).
polygon(r9, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r9, [xy(315,225),xy(315,224)]).
fillpoint(r9, xy(314,225), 5.0).
region(r16, '#000000', 100, centroid(204,414)).
perimeter(r16, 40).
polygon(r16, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r16, [xy(205,415),xy(205,414)]).
fillpoint(r16, xy(204,415), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 1060).
adjacent(r1, r3).
shared_edge(r1, r3, 70).
adjacent(r1, r5).
shared_edge(r1, r5, 120).
adjacent(r1, r7).
shared_edge(r1, r7, 200).
adjacent(r1, r12).
shared_edge(r1, r12, 80).
adjacent(r1, r15).
shared_edge(r1, r15, 70).
adjacent(r1, r18).
shared_edge(r1, r18, 240).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 460).
adjacent(r1, r21).
shared_edge(r1, r21, 420).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 90).
adjacent(r2, r4).
shared_edge(r2, r4, 700).
adjacent(r2, r5).
shared_edge(r2, r5, 260).
adjacent(r2, r6).
shared_edge(r2, r6, 60).
adjacent(r2, r8).
shared_edge(r2, r8, 120).
adjacent(r2, r10).
shared_edge(r2, r10, 90).
adjacent(r2, r11).
shared_edge(r2, r11, 110).
adjacent(r2, r12).
shared_edge(r2, r12, 580).
adjacent(r2, r13).
shared_edge(r2, r13, 60).
adjacent(r2, r14).
shared_edge(r2, r14, 70).
adjacent(r2, r15).
shared_edge(r2, r15, 200).
adjacent(r2, r16).
shared_edge(r2, r16, 40).
adjacent(r2, r17).
shared_edge(r2, r17, 80).
adjacent(r5, r6).
shared_edge(r5, r6, 60).
adjacent(r5, r7).
shared_edge(r5, r7, 160).
adjacent(r5, r13).
shared_edge(r5, r13, 60).
adjacent(r8, r9).
shared_edge(r8, r9, 40).
adjacent(r10, r11).
shared_edge(r10, r11, 50).
adjacent(r14, r15).
shared_edge(r14, r15, 50).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r2, r4).
encloses(r8, r9).
encloses(r2, r16).
encloses(r2, r17).
encloses(r1, r18).
encloses(r1, r19).
encloses(r1, r22).
encloses(r1, r23).
