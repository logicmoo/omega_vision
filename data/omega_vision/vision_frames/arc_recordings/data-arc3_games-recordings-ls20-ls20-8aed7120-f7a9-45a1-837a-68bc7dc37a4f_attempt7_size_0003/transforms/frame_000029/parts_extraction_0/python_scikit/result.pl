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

region(r1, '#aaaaaa', 275500, centroid(322,310)).
perimeter(r1, 5360).
polygon(r1, [xy(280,519),xy(280,490),xy(349,490),xy(350,510),xy(389,510),xy(390,500),xy(409,500),xy(410,490),xy(419,490),xy(420,480),xy(439,480),xy(440,470),xy(449,470),xy(450,460),xy(459,460),xy(460,450),xy(470,449),xy(470,430),xy(479,430),xy(480,420),xy(490,419),xy(490,400),xy(500,399),xy(500,360),xy(510,359),xy(510,280),xy(500,279),xy(500,240),xy(490,239),xy(490,220),xy(480,220),xy(480,210),xy(470,209),xy(470,190),xy(460,190),xy(460,180),xy(450,180),xy(450,170),xy(440,170),xy(439,160),xy(420,160),xy(420,150),xy(410,150),xy(409,140),xy(390,140),xy(389,130),xy(350,130),xy(349,120),xy(270,120),xy(269,130),xy(230,130),xy(229,140),xy(210,140),xy(210,149),xy(200,150),xy(199,160),xy(180,160),xy(180,169),xy(170,170),xy(170,179),xy(160,180),xy(159,190),xy(150,190),xy(150,209),xy(140,210),xy(140,219),xy(130,220),xy(130,239),xy(120,240),xy(120,279),xy(110,280),xy(110,359),xy(120,360),xy(120,399),xy(130,400),xy(130,419),xy(139,420),xy(140,429),xy(150,430),xy(150,449),xy(159,450),xy(160,459),xy(169,460),xy(170,469),xy(180,470),xy(180,480),xy(199,480),xy(200,489),xy(210,490),xy(210,500),xy(229,500),xy(230,510),xy(269,510),xy(270,520),xy(280,519)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
hole(r1, [xy(310,519),xy(309,510),xy(300,510),xy(300,520),xy(310,519)]).
hole(r1, [xy(330,519),xy(329,510),xy(320,510),xy(320,520),xy(330,519)]).
midline(r1, [xy(429,635),xy(130,635),xy(120,630),xy(84,593),xy(71,568),xy(77,552),xy(93,524),xy(85,506),xy(78,483),xy(79,480),xy(70,458),xy(60,414),xy(60,393),xy(56,379),xy(54,359),xy(54,281),xy(60,245),xy(60,225),xy(68,188),xy(77,164),xy(85,133),xy(99,99),xy(133,86),xy(198,68),xy(270,59),xy(347,59),xy(387,64),xy(383,68),xy(385,70),xy(381,74),xy(380,83),xy(372,99),xy(374,99)]).
midline(r1, [xy(61,244),xy(61,242)]).
midline(r1, [xy(430,634),xy(548,635),xy(554,633),xy(555,525),xy(543,513),xy(487,536),xy(434,552),xy(403,559),xy(359,559),xy(352,562),xy(329,565),xy(321,565),xy(314,562),xy(314,500),xy(300,499),xy(291,501),xy(289,510),xy(289,564),xy(257,564),xy(238,558),xy(234,560),xy(210,558),xy(177,550),xy(119,530),xy(94,524)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,632),xy(578,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(388,67),xy(386,69)]).
midline(r1, [xy(235,66),xy(239,77),xy(238,80),xy(240,80)]).
midline(r1, [xy(543,512),xy(557,466),xy(510,419),xy(512,418),xy(557,463),xy(566,432),xy(570,399),xy(567,395),xy(561,395),xy(555,391),xy(538,387),xy(520,377),xy(520,379)]).
midline(r1, [xy(558,464),xy(557,465)]).
midline(r1, [xy(169,78),xy(210,119),xy(211,117),xy(171,77)]).
midline(r1, [xy(539,388),xy(543,389),xy(544,392),xy(546,390)]).
midline(r1, [xy(532,385),xy(530,384)]).
midline(r1, [xy(61,246),xy(63,244)]).
midline(r1, [xy(64,247),xy(67,247),xy(65,245)]).
midline(r1, [xy(68,248),xy(70,247),xy(70,249)]).
midline(r1, [xy(291,564),xy(314,564)]).
midline(r1, [xy(83,492),xy(127,448),xy(129,449),xy(83,495)]).
midline(r1, [xy(240,558),xy(244,542),xy(246,542)]).
midline(r1, [xy(72,247),xy(76,252),xy(81,251),xy(80,253)]).
midline(r1, [xy(74,247),xy(77,246),xy(77,248)]).
midline(r1, [xy(79,247),xy(84,250),xy(82,254)]).
midline(r1, [xy(85,251),xy(90,255),xy(84,254)]).
midline(r1, [xy(212,119),xy(211,120)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,631),xy(609,635),xy(585,633)]).
midline(r1, [xy(359,558),xy(356,545),xy(340,515),xy(338,502),xy(329,499),xy(316,500)]).
midline(r1, [xy(61,393),xy(73,388),xy(70,391)]).
midline(r1, [xy(75,388),xy(80,386),xy(80,388)]).
midline(r1, [xy(82,386),xy(84,384),xy(84,386)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(556,393),xy(553,394),xy(551,392)]).
midline(r1, [xy(389,65),xy(405,65),xy(446,74),xy(470,83),xy(498,90),xy(534,105),xy(544,129),xy(551,157),xy(559,178),xy(569,224),xy(569,232),xy(559,242),xy(554,243),xy(542,252),xy(533,253),xy(531,255),xy(534,255)]).
midline(r1, [xy(549,250),xy(554,245),xy(555,248),xy(557,244),xy(558,247)]).
midline(r1, [xy(546,251),xy(547,250)]).
midline(r1, [xy(569,234),xy(560,243)]).
midline(r1, [xy(569,236),xy(560,245)]).
midline(r1, [xy(564,245),xy(565,242),xy(570,241),xy(569,238)]).
midline(r1, [xy(570,243),xy(575,281),xy(575,359),xy(570,396)]).
midline(r1, [xy(81,446),xy(80,447)]).
midline(r1, [xy(101,424),xy(82,445),xy(104,423)]).
midline(r1, [xy(91,256),xy(92,257)]).
fillpoint(r1, xy(534,105), 106.0).
fillpoint(r1, xy(99,99), 100.0).
fillpoint(r1, xy(542,513), 97.0).
fillpoint(r1, xy(544,130), 96.0).
fillpoint(r1, xy(544,509), 96.0).
fillpoint(r1, xy(545,133), 95.0).
fillpoint(r1, xy(545,506), 95.0).
fillpoint(r1, xy(546,136), 94.0).
fillpoint(r1, xy(546,503), 94.0).
fillpoint(r1, xy(93,524), 93.3).
fillpoint(r1, xy(547,139), 93.0).
fillpoint(r1, xy(547,500), 93.0).
fillpoint(r1, xy(549,146), 91.0).
fillpoint(r1, xy(549,493), 91.0).
fillpoint(r1, xy(550,150), 90.0).
fillpoint(r1, xy(550,489), 90.0).
fillpoint(r1, xy(551,155), 89.0).
fillpoint(r1, xy(551,484), 89.0).
fillpoint(r1, xy(134,86), 87.0).
fillpoint(r1, xy(485,86), 87.0).
fillpoint(r1, xy(86,131), 87.0).
fillpoint(r1, xy(553,161), 87.0).
fillpoint(r1, xy(553,478), 87.0).
fillpoint(r1, xy(86,508), 87.0).
fillpoint(r1, xy(518,523), 87.0).
fillpoint(r1, xy(141,84), 85.0).
fillpoint(r1, xy(478,84), 85.0).
fillpoint(r1, xy(146,83), 84.0).
fillpoint(r1, xy(473,83), 84.0).
fillpoint(r1, xy(80,149), 81.0).
fillpoint(r1, xy(559,179), 81.0).
fillpoint(r1, xy(559,460), 81.0).
fillpoint(r1, xy(80,490), 81.0).
fillpoint(r1, xy(79,153), 80.0).
fillpoint(r1, xy(560,183), 80.0).
fillpoint(r1, xy(560,456), 80.0).
fillpoint(r1, xy(79,486), 80.0).
fillpoint(r1, xy(161,78), 79.0).
fillpoint(r1, xy(458,78), 79.0).
fillpoint(r1, xy(78,157), 79.0).
fillpoint(r1, xy(561,187), 79.0).
fillpoint(r1, xy(561,452), 79.0).
fillpoint(r1, xy(78,482), 79.0).
fillpoint(r1, xy(164,77), 78.0).
fillpoint(r1, xy(455,77), 78.0).
fillpoint(r1, xy(77,162), 78.0).
fillpoint(r1, xy(562,192), 78.0).
fillpoint(r1, xy(562,448), 78.0).
fillpoint(r1, xy(77,478), 78.0).
fillpoint(r1, xy(167,76), 77.0).
fillpoint(r1, xy(452,76), 77.0).
fillpoint(r1, xy(563,197), 77.0).
fillpoint(r1, xy(563,442), 77.0).
fillpoint(r1, xy(174,74), 75.0).
fillpoint(r1, xy(445,74), 75.0).
fillpoint(r1, xy(565,204), 75.0).
fillpoint(r1, xy(565,435), 75.0).
fillpoint(r1, xy(178,73), 74.0).
fillpoint(r1, xy(441,73), 74.0).
fillpoint(r1, xy(566,208), 74.0).
fillpoint(r1, xy(566,431), 74.0).
fillpoint(r1, xy(183,72), 73.0).
fillpoint(r1, xy(436,72), 73.0).
fillpoint(r1, xy(567,213), 73.0).
fillpoint(r1, xy(567,426), 73.0).
fillpoint(r1, xy(188,71), 72.0).
fillpoint(r1, xy(431,71), 72.0).
fillpoint(r1, xy(568,219), 72.0).
fillpoint(r1, xy(568,421), 72.0).
fillpoint(r1, xy(192,70), 71.0).
fillpoint(r1, xy(427,70), 71.0).
fillpoint(r1, xy(70,182), 71.0).
fillpoint(r1, xy(569,227), 71.0).
fillpoint(r1, xy(569,413), 71.0).
fillpoint(r1, xy(70,457), 71.0).
fillpoint(r1, xy(142,539), 71.0).
fillpoint(r1, xy(477,539), 71.0).
fillpoint(r1, xy(195,69), 70.0).
fillpoint(r1, xy(424,69), 70.0).
fillpoint(r1, xy(69,185), 70.0).
fillpoint(r1, xy(569,243), 70.0).
fillpoint(r1, xy(569,397), 70.0).
fillpoint(r1, xy(69,454), 70.0).
fillpoint(r1, xy(145,540), 70.0).
fillpoint(r1, xy(474,540), 70.0).
fillpoint(r1, xy(199,68), 69.0).
fillpoint(r1, xy(420,68), 69.0).
fillpoint(r1, xy(68,189), 69.0).
fillpoint(r1, xy(571,249), 69.0).
fillpoint(r1, xy(571,390), 69.0).
fillpoint(r1, xy(68,450), 69.0).
fillpoint(r1, xy(149,541), 69.0).
fillpoint(r1, xy(470,541), 69.0).
fillpoint(r1, xy(204,67), 68.0).
fillpoint(r1, xy(415,67), 68.0).
fillpoint(r1, xy(67,194), 68.0).
fillpoint(r1, xy(572,254), 68.0).
fillpoint(r1, xy(572,385), 68.0).
fillpoint(r1, xy(67,445), 68.0).
fillpoint(r1, xy(154,542), 68.0).
fillpoint(r1, xy(465,542), 68.0).
fillpoint(r1, xy(210,66), 67.0).
fillpoint(r1, xy(410,66), 67.0).
fillpoint(r1, xy(66,200), 67.0).
fillpoint(r1, xy(573,260), 67.0).
fillpoint(r1, xy(573,380), 67.0).
fillpoint(r1, xy(66,440), 67.0).
fillpoint(r1, xy(159,543), 67.0).
fillpoint(r1, xy(460,543), 67.0).
fillpoint(r1, xy(217,65), 66.0).
fillpoint(r1, xy(403,65), 66.0).
fillpoint(r1, xy(574,267), 66.0).
fillpoint(r1, xy(574,373), 66.0).
fillpoint(r1, xy(237,64), 65.0).
fillpoint(r1, xy(388,64), 65.0).
fillpoint(r1, xy(64,207), 65.0).
fillpoint(r1, xy(574,320), 65.0).
fillpoint(r1, xy(64,432), 65.0).
fillpoint(r1, xy(245,62), 63.0).
fillpoint(r1, xy(374,62), 63.0).
fillpoint(r1, xy(62,215), 63.0).
fillpoint(r1, xy(62,424), 63.0).
fillpoint(r1, xy(250,61), 62.0).
fillpoint(r1, xy(369,61), 62.0).
fillpoint(r1, xy(61,220), 62.0).
fillpoint(r1, xy(61,419), 62.0).
fillpoint(r1, xy(172,548), 62.0).
fillpoint(r1, xy(447,548), 62.0).
fillpoint(r1, xy(258,60), 61.0).
fillpoint(r1, xy(362,60), 61.0).
fillpoint(r1, xy(60,228), 61.0).
fillpoint(r1, xy(60,412), 61.0).
fillpoint(r1, xy(175,549), 61.0).
fillpoint(r1, xy(444,549), 61.0).
fillpoint(r1, xy(271,60), 60.0).
fillpoint(r1, xy(60,244), 60.0).
fillpoint(r1, xy(60,395), 60.0).
fillpoint(r1, xy(178,550), 60.0).
fillpoint(r1, xy(441,550), 60.0).
fillpoint(r1, xy(58,252), 59.0).
fillpoint(r1, xy(58,387), 59.0).
fillpoint(r1, xy(182,551), 59.0).
fillpoint(r1, xy(437,551), 59.0).
fillpoint(r1, xy(57,256), 58.0).
fillpoint(r1, xy(57,383), 58.0).
fillpoint(r1, xy(186,552), 58.0).
fillpoint(r1, xy(433,552), 58.0).
fillpoint(r1, xy(56,261), 57.0).
fillpoint(r1, xy(56,378), 57.0).
fillpoint(r1, xy(191,553), 57.0).
fillpoint(r1, xy(428,553), 57.0).
fillpoint(r1, xy(55,268), 56.0).
fillpoint(r1, xy(55,371), 56.0).
fillpoint(r1, xy(54,320), 55.0).
fillpoint(r1, xy(203,556), 54.0).
fillpoint(r1, xy(416,556), 54.0).
fillpoint(r1, xy(207,557), 53.0).
fillpoint(r1, xy(412,557), 53.0).
fillpoint(r1, xy(212,558), 52.0).
fillpoint(r1, xy(408,558), 52.0).
fillpoint(r1, xy(218,559), 51.0).
fillpoint(r1, xy(401,559), 51.0).
fillpoint(r1, xy(231,560), 50.0).
fillpoint(r1, xy(358,560), 50.0).
fillpoint(r1, xy(248,562), 48.0).
fillpoint(r1, xy(351,562), 48.0).
fillpoint(r1, xy(253,563), 47.0).
fillpoint(r1, xy(346,563), 47.0).
fillpoint(r1, xy(259,564), 46.0).
fillpoint(r1, xy(290,564), 46.0).
fillpoint(r1, xy(340,564), 46.0).
fillpoint(r1, xy(315,564), 45.3).
fillpoint(r1, xy(271,565), 45.0).
fillpoint(r1, xy(301,565), 45.0).
fillpoint(r1, xy(321,565), 45.0).
border(r1).
region(r3, '#2ecc40', 58100, centroid(316,309)).
perimeter(r3, 2680).
polygon(r3, [xy(189,480),xy(180,479),xy(180,460),xy(160,460),xy(160,450),xy(150,449),xy(150,430),xy(140,430),xy(140,420),xy(130,419),xy(130,400),xy(120,399),xy(120,360),xy(110,359),xy(110,280),xy(120,279),xy(120,240),xy(130,239),xy(130,220),xy(140,220),xy(140,250),xy(289,250),xy(290,200),xy(340,199),xy(340,150),xy(290,150),xy(290,120),xy(349,120),xy(350,130),xy(389,130),xy(390,140),xy(409,140),xy(409,150),xy(390,150),xy(390,199),xy(440,200),xy(440,350),xy(490,349),xy(490,240),xy(500,240),xy(500,279),xy(510,280),xy(510,359),xy(500,360),xy(500,399),xy(490,400),xy(490,419),xy(480,420),xy(480,429),xy(470,430),xy(469,450),xy(390,450),xy(390,350),xy(340,350),xy(339,300),xy(140,300),xy(140,350),xy(240,350),xy(240,449),xy(190,450),xy(189,480)]).
hole(r3, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
hole(r3, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r3, [xy(433,406),xy(437,396),xy(427,385),xy(418,369),xy(414,340),xy(410,328),xy(402,314),xy(389,300),xy(389,286),xy(383,263),xy(376,262),xy(340,269),xy(315,270),xy(295,243),xy(295,205),xy(333,205),xy(346,216),xy(354,219),xy(355,222),xy(356,220)]).
midline(r3, [xy(382,261),xy(384,255),xy(366,226),xy(360,222),xy(357,223)]).
midline(r3, [xy(365,223),xy(364,154),xy(353,144),xy(335,134),xy(304,135)]).
midline(r3, [xy(438,396),xy(455,388)]).
midline(r3, [xy(312,269),xy(303,273),xy(288,275),xy(145,275),xy(134,263),xy(130,255),xy(129,249),xy(133,245),xy(135,237),xy(135,224)]).
midline(r3, [xy(144,275),xy(124,294),xy(124,345),xy(134,363),xy(147,378),xy(167,389),xy(167,402),xy(175,425),xy(173,429),xy(177,428),xy(195,434),xy(206,444),xy(219,445),xy(225,443),xy(233,435),xy(235,428),xy(234,416),xy(224,404),xy(220,393),xy(209,379),xy(185,381),xy(168,388)]).
midline(r3, [xy(196,433),xy(224,405)]).
midline(r3, [xy(175,431),xy(174,445),xy(184,456),xy(185,475)]).
midline(r3, [xy(365,154),xy(376,143),xy(378,145),xy(405,145)]).
midline(r3, [xy(456,386),xy(472,378)]).
midline(r3, [xy(473,376),xy(500,349),xy(500,289),xy(494,279),xy(495,244)]).
fillpoint(r3, xy(382,262), 57.4).
fillpoint(r3, xy(383,258), 57.0).
fillpoint(r3, xy(386,273), 54.0).
fillpoint(r3, xy(387,277), 53.0).
fillpoint(r3, xy(388,282), 52.0).
fillpoint(r3, xy(389,288), 51.0).
fillpoint(r3, xy(437,396), 47.1).
fillpoint(r3, xy(443,394), 45.0).
fillpoint(r3, xy(434,403), 45.0).
fillpoint(r3, xy(433,406), 44.0).
fillpoint(r3, xy(167,389), 39.1).
fillpoint(r3, xy(186,381), 32.0).
fillpoint(r3, xy(338,269), 31.0).
fillpoint(r3, xy(192,380), 31.0).
fillpoint(r3, xy(311,270), 30.0).
fillpoint(r3, xy(201,380), 30.0).
fillpoint(r3, xy(308,271), 29.0).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(148,378), 29.0).
fillpoint(r3, xy(471,378), 29.0).
fillpoint(r3, xy(171,411), 29.0).
fillpoint(r3, xy(305,272), 28.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(172,414), 28.0).
fillpoint(r3, xy(302,273), 27.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(173,417), 27.0).
fillpoint(r3, xy(174,422), 26.2).
fillpoint(r3, xy(175,427), 26.2).
fillpoint(r3, xy(298,274), 26.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(365,176), 25.0).
fillpoint(r3, xy(144,275), 25.0).
fillpoint(r3, xy(125,294), 16.0).
fillpoint(r3, xy(224,404), 16.0).
fillpoint(r3, xy(194,434), 16.0).
fillpoint(r3, xy(304,135), 15.0).
fillpoint(r3, xy(125,323), 15.0).
region(r9, '#ffdc00', 17200, centroid(236,387)).
perimeter(r9, 820).
polygon(r9, [xy(269,510),xy(230,510),xy(229,500),xy(210,500),xy(210,490),xy(200,490),xy(200,480),xy(190,479),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(290,479),xy(270,480),xy(269,510)]).
midline(r9, [xy(265,416),xy(264,455),xy(243,476),xy(229,475),xy(204,465)]).
midline(r9, [xy(243,477),xy(249,489)]).
midline(r9, [xy(265,415),xy(265,350),xy(263,336),xy(259,328),xy(239,324),xy(164,325)]).
fillpoint(r9, xy(260,329), 29.7).
fillpoint(r9, xy(258,328), 29.0).
fillpoint(r9, xy(261,331), 29.0).
fillpoint(r9, xy(255,327), 28.0).
fillpoint(r9, xy(262,334), 28.0).
fillpoint(r9, xy(243,476), 27.3).
fillpoint(r9, xy(252,326), 27.0).
fillpoint(r9, xy(263,337), 27.0).
fillpoint(r9, xy(248,325), 26.0).
fillpoint(r9, xy(264,342), 26.0).
fillpoint(r9, xy(238,475), 26.0).
fillpoint(r9, xy(264,455), 25.7).
fillpoint(r9, xy(164,325), 25.0).
fillpoint(r9, xy(264,400), 25.0).
fillpoint(r9, xy(205,465), 16.0).
region(r2, '#ffdc00', 13600, centroid(247,199)).
perimeter(r2, 660).
polygon(r2, [xy(289,250),xy(140,250),xy(140,210),xy(149,210),xy(150,200),xy(239,200),xy(240,130),xy(269,130),xy(270,120),xy(289,120),xy(290,150),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r2, [xy(190,224),xy(171,225),xy(169,223),xy(160,229)]).
midline(r2, [xy(191,224),xy(249,224),xy(261,219),xy(266,186),xy(271,175),xy(264,154),xy(275,143),xy(280,129)]).
midline(r2, [xy(272,175),xy(315,175)]).
fillpoint(r2, xy(271,175), 31.4).
fillpoint(r2, xy(260,220), 29.7).
fillpoint(r2, xy(268,168), 29.0).
fillpoint(r2, xy(268,181), 29.0).
fillpoint(r2, xy(261,218), 29.0).
fillpoint(r2, xy(258,221), 29.0).
fillpoint(r2, xy(267,165), 28.0).
fillpoint(r2, xy(267,184), 28.0).
fillpoint(r2, xy(262,215), 28.0).
fillpoint(r2, xy(255,222), 28.0).
fillpoint(r2, xy(266,162), 27.0).
fillpoint(r2, xy(266,187), 27.0).
fillpoint(r2, xy(263,212), 27.0).
fillpoint(r2, xy(252,223), 27.0).
fillpoint(r2, xy(265,158), 26.0).
fillpoint(r2, xy(265,192), 26.0).
fillpoint(r2, xy(264,208), 26.0).
fillpoint(r2, xy(248,224), 26.0).
fillpoint(r2, xy(291,175), 25.0).
fillpoint(r2, xy(169,225), 25.0).
fillpoint(r2, xy(279,134), 11.0).
region(r15, '#ffdc00', 9200, centroid(378,439)).
perimeter(r15, 540).
polygon(r15, [xy(389,510),xy(360,510),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(460,450),xy(460,459),xy(450,460),xy(450,469),xy(440,470),xy(439,480),xy(420,480),xy(420,489),xy(410,490),xy(409,500),xy(390,500),xy(389,510)]).
midline(r15, [xy(365,444),xy(365,384)]).
midline(r15, [xy(365,445),xy(364,455),xy(385,475),xy(379,483),xy(375,495)]).
midline(r15, [xy(386,475),xy(413,465),xy(425,465),xy(434,460),xy(440,460),xy(446,455),xy(455,455)]).
fillpoint(r15, xy(365,455), 25.7).
fillpoint(r15, xy(384,474), 25.7).
fillpoint(r15, xy(365,416), 25.0).
fillpoint(r15, xy(414,465), 16.0).
fillpoint(r15, xy(375,494), 16.0).
fillpoint(r15, xy(426,464), 15.0).
fillpoint(r15, xy(435,460), 11.0).
region(r5, '#ffdc00', 9100, centroid(454,248)).
perimeter(r5, 600).
polygon(r5, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,190),xy(390,150),xy(419,150),xy(420,160),xy(439,160),xy(440,169),xy(449,170),xy(450,179),xy(460,180),xy(460,190),xy(470,190),xy(470,209),xy(479,210),xy(480,219),xy(490,220),xy(489,350)]).
midline(r5, [xy(469,324),xy(469,292),xy(464,280),xy(465,239),xy(455,216),xy(455,204),xy(450,195),xy(450,190),xy(439,179),xy(434,179),xy(425,174),xy(420,175),xy(408,172),xy(405,164)]).
midline(r5, [xy(469,325),xy(470,330)]).
fillpoint(r5, xy(464,260), 25.0).
fillpoint(r5, xy(469,293), 21.0).
fillpoint(r5, xy(469,316), 20.0).
fillpoint(r5, xy(407,172), 18.0).
fillpoint(r5, xy(405,165), 16.0).
fillpoint(r5, xy(414,174), 16.0).
fillpoint(r5, xy(455,215), 16.0).
fillpoint(r5, xy(421,175), 15.0).
fillpoint(r5, xy(454,206), 15.0).
fillpoint(r5, xy(435,179), 11.0).
fillpoint(r5, xy(450,194), 11.0).
fillpoint(r5, xy(440,180), 10.0).
fillpoint(r5, xy(449,189), 10.0).
region(r13, '#2ecc40', 7900, centroid(314,428)).
perimeter(r13, 560).
polygon(r13, [xy(279,520),xy(270,519),xy(270,480),xy(290,479),xy(290,350),xy(339,350),xy(340,479),xy(360,480),xy(360,509),xy(350,509),xy(349,490),xy(280,490),xy(279,520)]).
midline(r13, [xy(275,486),xy(295,483),xy(315,464),xy(315,374)]).
midline(r13, [xy(315,465),xy(334,483),xy(354,485),xy(355,505)]).
midline(r13, [xy(275,487),xy(275,515)]).
fillpoint(r13, xy(314,420), 25.0).
region(r21, '#2ecc40', 5200, centroid(260,620)).
perimeter(r21, 560).
polygon(r21, [xy(389,630),xy(130,630),xy(130,610),xy(389,610),xy(389,630)]).
midline(r21, [xy(290,620),xy(139,620)]).
midline(r21, [xy(291,619),xy(380,620)]).
fillpoint(r21, xy(139,620), 10.0).
region(r4, '#2ecc40', 3800, centroid(206,174)).
perimeter(r4, 320).
polygon(r4, [xy(239,200),xy(150,200),xy(150,190),xy(159,190),xy(160,180),xy(169,180),xy(170,170),xy(179,170),xy(180,160),xy(199,160),xy(200,150),xy(210,149),xy(210,140),xy(229,140),xy(230,130),xy(239,130),xy(239,200)]).
midline(r4, [xy(235,134),xy(234,143),xy(224,154),xy(217,174),xy(207,179),xy(199,180),xy(196,178),xy(198,178)]).
midline(r4, [xy(196,180),xy(175,189),xy(169,189),xy(163,194),xy(154,195)]).
fillpoint(r4, xy(216,176), 24.0).
fillpoint(r4, xy(206,179), 21.0).
fillpoint(r4, xy(196,180), 20.0).
fillpoint(r4, xy(224,155), 16.0).
fillpoint(r4, xy(185,184), 16.0).
fillpoint(r4, xy(174,189), 11.0).
region(r22, '#5a5a5a', 3200, centroid(470,620)).
perimeter(r22, 360).
polygon(r22, [xy(549,630),xy(390,630),xy(390,610),xy(549,610),xy(549,630)]).
midline(r22, [xy(423,619),xy(399,620)]).
midline(r22, [xy(424,619),xy(540,620)]).
fillpoint(r22, xy(399,620), 10.0).
region(r12, '#870c25', 1500, centroid(314,334)).
perimeter(r12, 160).
polygon(r12, [xy(339,350),xy(290,350),xy(290,320),xy(339,320),xy(339,350)]).
midline(r12, [xy(316,334),xy(304,335)]).
midline(r12, [xy(317,334),xy(325,335)]).
fillpoint(r12, xy(304,335), 15.0).
region(r10, '#bebebe', 1000, centroid(314,310)).
perimeter(r10, 140).
polygon(r10, [xy(339,320),xy(290,320),xy(290,300),xy(339,300),xy(339,320)]).
midline(r10, [xy(320,310),xy(299,310)]).
midline(r10, [xy(321,310),xy(330,310)]).
fillpoint(r10, xy(299,310), 10.0).
region(r7, '#5a5a5a', 800, centroid(314,224)).
perimeter(r7, 160).
polygon(r7, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r7, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r7, [xy(324,232),xy(325,220),xy(323,215),xy(305,215),xy(304,220),xy(305,234),xy(324,234)]).
fillpoint(r7, xy(306,215), 6.0).
fillpoint(r7, xy(324,215), 6.0).
fillpoint(r7, xy(305,234), 6.0).
fillpoint(r7, xy(323,234), 6.0).
fillpoint(r7, xy(311,215), 5.0).
fillpoint(r7, xy(304,225), 5.0).
fillpoint(r7, xy(324,225), 5.0).
fillpoint(r7, xy(311,235), 5.0).
region(r6, '#0074d9', 500, centroid(414,194)).
perimeter(r6, 120).
polygon(r6, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r6, [xy(408,195),xy(394,195)]).
midline(r6, [xy(409,195),xy(435,195)]).
fillpoint(r6, xy(394,195), 5.0).
region(r11, '#0074d9', 500, centroid(444,324)).
perimeter(r11, 120).
polygon(r11, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r11, [xy(445,311),xy(445,304)]).
midline(r11, [xy(445,312),xy(445,345)]).
fillpoint(r11, xy(444,325), 5.0).
region(r14, '#0074d9', 500, centroid(364,354)).
perimeter(r14, 120).
polygon(r14, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r14, [xy(359,354),xy(344,355)]).
midline(r14, [xy(360,354),xy(385,355)]).
fillpoint(r14, xy(344,355), 5.0).
region(r23, '#7fdbff', 400, centroid(570,620)).
perimeter(r23, 80).
polygon(r23, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r23, [xy(569,619),xy(570,620)]).
fillpoint(r23, xy(569,620), 10.0).
region(r24, '#7fdbff', 400, centroid(600,620)).
perimeter(r24, 80).
polygon(r24, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r24, [xy(599,619),xy(600,620)]).
fillpoint(r24, xy(599,620), 10.0).
region(r25, '#7fdbff', 400, centroid(630,620)).
perimeter(r25, 80).
polygon(r25, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r25, [xy(629,619),xy(630,620)]).
fillpoint(r25, xy(629,620), 10.0).
border(r25).
region(r17, '#000000', 300, centroid(218,428)).
perimeter(r17, 80).
polygon(r17, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r17, [xy(214,434),xy(215,435)]).
midline(r17, [xy(215,433),xy(215,425),xy(225,425)]).
fillpoint(r17, xy(216,425), 6.0).
fillpoint(r17, xy(221,425), 5.0).
fillpoint(r17, xy(215,433), 5.0).
region(r8, '#2ecc40', 100, centroid(314,224)).
perimeter(r8, 40).
polygon(r8, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r8, [xy(315,225),xy(315,224)]).
fillpoint(r8, xy(314,225), 5.0).
region(r16, '#000000', 100, centroid(204,414)).
perimeter(r16, 40).
polygon(r16, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r16, [xy(205,415),xy(205,414)]).
fillpoint(r16, xy(204,415), 5.0).
region(r19, '#7fdbff', 100, centroid(304,514)).
perimeter(r19, 40).
polygon(r19, [xy(309,520),xy(300,519),xy(300,510),xy(310,510),xy(309,520)]).
midline(r19, [xy(305,515),xy(305,514)]).
fillpoint(r19, xy(304,515), 5.0).
region(r20, '#7fdbff', 100, centroid(324,514)).
perimeter(r20, 40).
polygon(r20, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r20, [xy(325,515),xy(325,514)]).
fillpoint(r20, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 90).
adjacent(r1, r3).
shared_edge(r1, r3, 780).
adjacent(r1, r4).
shared_edge(r1, r4, 160).
adjacent(r1, r5).
shared_edge(r1, r5, 170).
adjacent(r1, r9).
shared_edge(r1, r9, 110).
adjacent(r1, r13).
shared_edge(r1, r13, 150).
adjacent(r1, r15).
shared_edge(r1, r15, 160).
adjacent(r1, r19).
shared_edge(r1, r19, 40).
adjacent(r1, r20).
shared_edge(r1, r20, 40).
adjacent(r1, r21).
shared_edge(r1, r21, 540).
adjacent(r1, r22).
shared_edge(r1, r22, 340).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 80).
adjacent(r1, r25).
shared_edge(r1, r25, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 410).
adjacent(r2, r4).
shared_edge(r2, r4, 160).
adjacent(r3, r5).
shared_edge(r3, r5, 310).
adjacent(r3, r6).
shared_edge(r3, r6, 60).
adjacent(r3, r7).
shared_edge(r3, r7, 120).
adjacent(r3, r9).
shared_edge(r3, r9, 480).
adjacent(r3, r10).
shared_edge(r3, r10, 70).
adjacent(r3, r11).
shared_edge(r3, r11, 60).
adjacent(r3, r12).
shared_edge(r3, r12, 30).
adjacent(r3, r14).
shared_edge(r3, r14, 60).
adjacent(r3, r15).
shared_edge(r3, r15, 160).
adjacent(r3, r16).
shared_edge(r3, r16, 40).
adjacent(r3, r17).
shared_edge(r3, r17, 80).
adjacent(r5, r6).
shared_edge(r5, r6, 60).
adjacent(r5, r11).
shared_edge(r5, r11, 60).
adjacent(r7, r8).
shared_edge(r7, r8, 40).
adjacent(r9, r10).
shared_edge(r9, r10, 20).
adjacent(r9, r12).
shared_edge(r9, r12, 30).
adjacent(r9, r13).
shared_edge(r9, r13, 180).
adjacent(r10, r12).
shared_edge(r10, r12, 50).
adjacent(r12, r13).
shared_edge(r12, r13, 50).
adjacent(r13, r14).
shared_edge(r13, r14, 10).
adjacent(r13, r15).
shared_edge(r13, r15, 170).
adjacent(r14, r15).
shared_edge(r14, r15, 50).
adjacent(r21, r22).
shared_edge(r21, r22, 20).

encloses(r7, r8).
encloses(r3, r16).
encloses(r3, r17).
encloses(r1, r19).
encloses(r1, r20).
encloses(r1, r23).
encloses(r1, r24).
