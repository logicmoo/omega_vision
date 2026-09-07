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

region(r3, '#2ecc40', 161600, centroid(351,307)).
perimeter(r3, 5480).
polygon(r3, [xy(589,550),xy(490,550),xy(490,500),xy(440,499),xy(439,450),xy(390,450),xy(389,550),xy(240,550),xy(239,500),xy(140,500),xy(140,450),xy(90,449),xy(90,250),xy(139,250),xy(140,200),xy(189,200),xy(190,150),xy(240,149),xy(240,100),xy(160,100),xy(159,120),xy(70,120),xy(70,30),xy(159,30),xy(160,50),xy(289,50),xy(290,150),xy(339,150),xy(340,100),xy(389,100),xy(390,50),xy(540,50),xy(539,100),xy(440,100),xy(440,199),xy(489,200),xy(490,150),xy(590,150),xy(589,550)]).
hole(r3, [xy(340,449),xy(340,400),xy(440,399),xy(440,300),xy(390,300),xy(390,349),xy(340,350),xy(340,200),xy(290,200),xy(289,250),xy(190,250),xy(190,349),xy(239,350),xy(240,300),xy(289,300),xy(290,449),xy(340,449)]).
hole(r3, [xy(150,109),xy(149,40),xy(80,40),xy(80,110),xy(150,109)]).
hole(r3, [xy(540,299),xy(539,250),xy(490,250),xy(490,300),xy(540,299)]).
hole(r3, [xy(540,449),xy(539,400),xy(490,400),xy(490,450),xy(540,449)]).
hole(r3, [xy(230,189),xy(229,160),xy(200,160),xy(200,190),xy(230,189)]).
hole(r3, [xy(270,339),xy(270,330),xy(279,330),xy(280,320),xy(260,320),xy(260,310),xy(250,310),xy(250,319),xy(260,320),xy(260,339),xy(270,339)]).
hole(r3, [xy(380,339),xy(379,310),xy(350,310),xy(350,340),xy(380,339)]).
hole(r3, [xy(380,539),xy(379,510),xy(350,510),xy(350,540),xy(380,539)]).
midline(r3, [xy(280,309),xy(269,310),xy(259,304),xy(245,305),xy(244,317),xy(245,323),xy(250,329),xy(250,345),xy(261,369),xy(249,389),xy(214,425),xy(210,425),xy(188,411),xy(149,392),xy(141,369),xy(139,299),xy(149,289),xy(160,271),xy(164,258),xy(167,233),xy(169,229),xy(176,226),xy(198,224),xy(212,219),xy(208,209),xy(195,193),xy(195,155),xy(233,155),xy(250,167),xy(250,169)]).
midline(r3, [xy(262,367),xy(275,353),xy(279,345),xy(279,339),xy(284,333),xy(284,316),xy(280,311)]).
midline(r3, [xy(213,218),xy(216,220),xy(239,219),xy(255,213),xy(264,176),xy(252,169)]).
midline(r3, [xy(268,311),xy(251,328)]).
midline(r3, [xy(215,425),xy(289,500),xy(300,499),xy(346,544),xy(379,545),xy(384,543),xy(384,506),xy(357,477),xy(326,484),xy(302,499)]).
midline(r3, [xy(357,476),xy(363,463),xy(365,441),xy(369,429),xy(390,424),xy(458,424),xy(464,440),xy(465,459),xy(469,470),xy(480,474),xy(509,478),xy(525,487),xy(540,500)]).
midline(r3, [xy(459,423),xy(463,413),xy(465,391),xy(469,378),xy(477,364),xy(490,349),xy(480,339),xy(469,321),xy(461,280),xy(448,259),xy(438,249),xy(420,248),xy(403,243),xy(397,239),xy(391,219),xy(389,186),xy(386,175),xy(265,174),xy(265,101),xy(260,79),xy(239,74),xy(174,74),xy(156,55),xy(154,36),xy(149,34),xy(75,35),xy(75,114),xy(153,114),xy(156,94),xy(174,75)]).
midline(r3, [xy(398,241),xy(377,264),xy(369,280),xy(345,306),xy(345,344),xy(379,345),xy(384,343),xy(384,306),xy(368,283)]).
midline(r3, [xy(491,349),xy(539,349),xy(556,370),xy(563,386),xy(565,400),xy(565,449),xy(563,463),xy(554,482),xy(540,498)]).
midline(r3, [xy(540,348),xy(556,329),xy(563,313),xy(565,298),xy(565,250),xy(563,236),xy(557,222),xy(539,199),xy(519,216),xy(503,223),xy(481,225),xy(468,229),xy(454,237),xy(440,249)]).
midline(r3, [xy(386,174),xy(389,163),xy(389,149),xy(402,135),xy(412,116),xy(415,90),xy(419,79),xy(430,75),xy(443,74),xy(515,75)]).
fillpoint(r3, xy(210,425), 75.0).
fillpoint(r3, xy(398,241), 59.0).
fillpoint(r3, xy(148,391), 59.0).
fillpoint(r3, xy(397,238), 58.0).
fillpoint(r3, xy(401,242), 58.0).
fillpoint(r3, xy(147,388), 58.0).
fillpoint(r3, xy(393,226), 54.0).
fillpoint(r3, xy(413,246), 54.0).
fillpoint(r3, xy(143,376), 54.0).
fillpoint(r3, xy(386,175), 53.2).
fillpoint(r3, xy(387,172), 53.0).
fillpoint(r3, xy(387,177), 53.0).
fillpoint(r3, xy(392,222), 53.0).
fillpoint(r3, xy(417,247), 53.0).
fillpoint(r3, xy(142,372), 53.0).
fillpoint(r3, xy(388,168), 52.0).
fillpoint(r3, xy(388,182), 52.0).
fillpoint(r3, xy(391,218), 52.0).
fillpoint(r3, xy(422,248), 52.0).
fillpoint(r3, xy(141,368), 52.0).
fillpoint(r3, xy(389,161), 51.0).
fillpoint(r3, xy(389,188), 51.0).
fillpoint(r3, xy(390,211), 51.0).
fillpoint(r3, xy(428,249), 51.0).
fillpoint(r3, xy(140,361), 51.0).
fillpoint(r3, xy(539,200), 50.0).
fillpoint(r3, xy(139,324), 50.0).
fillpoint(r3, xy(489,350), 50.0).
fillpoint(r3, xy(289,499), 50.0).
fillpoint(r3, xy(291,500), 50.0).
fillpoint(r3, xy(539,500), 50.0).
fillpoint(r3, xy(265,175), 35.4).
fillpoint(r3, xy(254,214), 35.4).
fillpoint(r3, xy(357,477), 33.0).
fillpoint(r3, xy(261,186), 32.0).
fillpoint(r3, xy(258,203), 32.0).
fillpoint(r3, xy(243,218), 32.0).
fillpoint(r3, xy(353,478), 32.0).
fillpoint(r3, xy(336,481), 32.0).
fillpoint(r3, xy(458,425), 31.4).
fillpoint(r3, xy(260,191), 31.1).
fillpoint(r3, xy(259,198), 31.1).
fillpoint(r3, xy(348,479), 31.1).
fillpoint(r3, xy(341,480), 31.1).
fillpoint(r3, xy(238,219), 31.0).
fillpoint(r3, xy(211,220), 30.0).
fillpoint(r3, xy(260,79), 29.7).
fillpoint(r3, xy(419,79), 29.7).
fillpoint(r3, xy(169,229), 29.7).
fillpoint(r3, xy(369,429), 29.7).
fillpoint(r3, xy(469,470), 29.7).
fillpoint(r3, xy(258,78), 29.0).
fillpoint(r3, xy(421,78), 29.0).
fillpoint(r3, xy(261,81), 29.0).
fillpoint(r3, xy(418,81), 29.0).
fillpoint(r3, xy(411,118), 29.0).
fillpoint(r3, xy(208,221), 29.0).
fillpoint(r3, xy(508,221), 29.0).
fillpoint(r3, xy(171,228), 29.0).
fillpoint(r3, xy(471,228), 29.0).
fillpoint(r3, xy(168,231), 29.0).
fillpoint(r3, xy(561,231), 29.0).
fillpoint(r3, xy(161,268), 29.0).
fillpoint(r3, xy(368,281), 29.0).
fillpoint(r3, xy(461,281), 29.0).
fillpoint(r3, xy(468,318), 29.0).
fillpoint(r3, xy(561,318), 29.0).
fillpoint(r3, xy(261,368), 29.0).
fillpoint(r3, xy(468,381), 29.0).
fillpoint(r3, xy(561,381), 29.0).
fillpoint(r3, xy(461,418), 29.0).
fillpoint(r3, xy(371,428), 29.0).
fillpoint(r3, xy(368,431), 29.0).
fillpoint(r3, xy(461,431), 29.0).
fillpoint(r3, xy(361,468), 29.0).
fillpoint(r3, xy(468,468), 29.0).
fillpoint(r3, xy(561,468), 29.0).
fillpoint(r3, xy(471,471), 29.0).
fillpoint(r3, xy(508,478), 29.0).
fillpoint(r3, xy(255,77), 28.0).
fillpoint(r3, xy(424,77), 28.0).
fillpoint(r3, xy(262,84), 28.0).
fillpoint(r3, xy(417,84), 28.0).
fillpoint(r3, xy(412,115), 28.0).
fillpoint(r3, xy(205,222), 28.0).
fillpoint(r3, xy(505,222), 28.0).
fillpoint(r3, xy(174,227), 28.0).
fillpoint(r3, xy(474,227), 28.0).
fillpoint(r3, xy(167,234), 28.0).
fillpoint(r3, xy(562,234), 28.0).
fillpoint(r3, xy(162,265), 28.0).
fillpoint(r3, xy(462,284), 28.0).
fillpoint(r3, xy(467,315), 28.0).
fillpoint(r3, xy(562,315), 28.0).
fillpoint(r3, xy(467,384), 28.0).
fillpoint(r3, xy(562,384), 28.0).
fillpoint(r3, xy(462,415), 28.0).
fillpoint(r3, xy(374,427), 28.0).
fillpoint(r3, xy(367,434), 28.0).
fillpoint(r3, xy(462,434), 28.0).
fillpoint(r3, xy(362,465), 28.0).
fillpoint(r3, xy(467,465), 28.0).
fillpoint(r3, xy(562,465), 28.0).
fillpoint(r3, xy(474,472), 28.0).
fillpoint(r3, xy(505,477), 28.0).
fillpoint(r3, xy(252,76), 27.0).
fillpoint(r3, xy(427,76), 27.0).
fillpoint(r3, xy(263,87), 27.0).
fillpoint(r3, xy(416,87), 27.0).
fillpoint(r3, xy(413,112), 27.0).
fillpoint(r3, xy(202,223), 27.0).
fillpoint(r3, xy(502,223), 27.0).
fillpoint(r3, xy(177,226), 27.0).
fillpoint(r3, xy(477,226), 27.0).
fillpoint(r3, xy(166,237), 27.0).
fillpoint(r3, xy(563,237), 27.0).
fillpoint(r3, xy(163,262), 27.0).
fillpoint(r3, xy(463,287), 27.0).
fillpoint(r3, xy(466,312), 27.0).
fillpoint(r3, xy(563,312), 27.0).
fillpoint(r3, xy(466,387), 27.0).
fillpoint(r3, xy(563,387), 27.0).
fillpoint(r3, xy(463,412), 27.0).
fillpoint(r3, xy(377,426), 27.0).
fillpoint(r3, xy(366,437), 27.0).
fillpoint(r3, xy(463,437), 27.0).
fillpoint(r3, xy(363,462), 27.0).
fillpoint(r3, xy(466,462), 27.0).
fillpoint(r3, xy(563,462), 27.0).
fillpoint(r3, xy(477,473), 27.0).
fillpoint(r3, xy(502,476), 27.0).
fillpoint(r3, xy(248,75), 26.0).
fillpoint(r3, xy(432,75), 26.0).
fillpoint(r3, xy(264,92), 26.0).
fillpoint(r3, xy(415,92), 26.0).
fillpoint(r3, xy(414,108), 26.0).
fillpoint(r3, xy(198,224), 26.0).
fillpoint(r3, xy(498,224), 26.0).
fillpoint(r3, xy(182,225), 26.0).
fillpoint(r3, xy(482,225), 26.0).
fillpoint(r3, xy(165,242), 26.0).
fillpoint(r3, xy(564,242), 26.0).
fillpoint(r3, xy(164,258), 26.0).
fillpoint(r3, xy(464,292), 26.0).
fillpoint(r3, xy(465,308), 26.0).
fillpoint(r3, xy(564,308), 26.0).
fillpoint(r3, xy(465,392), 26.0).
fillpoint(r3, xy(564,392), 26.0).
fillpoint(r3, xy(464,408), 26.0).
fillpoint(r3, xy(382,425), 26.0).
fillpoint(r3, xy(365,442), 26.0).
fillpoint(r3, xy(464,442), 26.0).
fillpoint(r3, xy(364,458), 26.0).
fillpoint(r3, xy(465,458), 26.0).
fillpoint(r3, xy(564,458), 26.0).
fillpoint(r3, xy(482,474), 26.0).
fillpoint(r3, xy(498,475), 26.0).
fillpoint(r3, xy(174,75), 25.0).
fillpoint(r3, xy(441,75), 25.0).
fillpoint(r3, xy(264,125), 25.0).
fillpoint(r3, xy(291,175), 25.0).
fillpoint(r3, xy(564,275), 25.0).
fillpoint(r3, xy(564,425), 25.0).
fillpoint(r3, xy(391,425), 25.0).
region(r2, '#ffdc00', 152400, centroid(333,293)).
perimeter(r2, 6180).
polygon(r2, [xy(590,549),xy(590,150),xy(490,150),xy(489,190),xy(440,189),xy(440,100),xy(589,100),xy(589,50),xy(390,50),xy(390,99),xy(340,100),xy(339,150),xy(290,150),xy(289,50),xy(160,50),xy(159,30),xy(70,30),xy(70,120),xy(159,120),xy(160,100),xy(240,100),xy(240,149),xy(190,150),xy(190,199),xy(140,200),xy(140,249),xy(90,250),xy(90,349),xy(80,350),xy(80,399),xy(90,400),xy(90,449),xy(139,450),xy(140,500),xy(239,500),xy(240,550),xy(389,550),xy(390,450),xy(439,450),xy(440,499),xy(489,500),xy(490,550),xy(590,549)]).
hole(r2, [xy(0,520),xy(40,519),xy(40,0)]).
hole(r2, [xy(639,600),xy(120,600),xy(120,639)]).
hole(r2, [xy(110,629),xy(109,530),xy(10,530),xy(10,630),xy(110,629)]).
midline(r2, [xy(508,25),xy(380,25),xy(357,35),xy(339,50),xy(322,35),xy(298,25),xy(184,25),xy(172,17),xy(159,14),xy(70,14),xy(57,17),xy(54,30),xy(55,126),xy(63,142),xy(93,173),xy(90,186),xy(90,200),xy(73,220),xy(65,240),xy(65,330),xy(61,338),xy(59,351),xy(59,399),xy(61,411),xy(65,419),xy(65,458),xy(69,471),xy(80,489),xy(43,524),xy(5,525),xy(4,629),xy(5,634),xy(10,635),xy(109,635),xy(114,633),xy(114,600),xy(116,594),xy(159,549),xy(99,489),xy(81,489)]).
midline(r2, [xy(509,24),xy(589,24),xy(610,29),xy(614,40),xy(615,53),xy(613,113),xy(609,123),xy(606,125),xy(490,124),xy(473,127),xy(468,130),xy(465,140),xy(465,165)]).
midline(r2, [xy(608,125),xy(613,136),xy(615,151),xy(615,539),xy(614,558),xy(611,569),xy(603,573),xy(589,575),xy(493,575),xy(470,571),xy(450,559),xy(423,529),xy(415,509),xy(415,474)]).
midline(r2, [xy(94,173),xy(123,161),xy(150,160)]).
midline(r2, [xy(339,51),xy(323,70),xy(316,86),xy(314,100),xy(315,125)]).
midline(r2, [xy(439,549),xy(419,566),xy(403,573),xy(389,575),xy(230,574),xy(210,566),xy(190,549),xy(160,550)]).
midline(r2, [xy(151,158),xy(184,124),xy(215,125)]).
fillpoint(r2, xy(93,173), 54.0).
fillpoint(r2, xy(92,177), 53.0).
fillpoint(r2, xy(91,182), 52.0).
fillpoint(r2, xy(90,188), 51.0).
fillpoint(r2, xy(339,50), 50.0).
fillpoint(r2, xy(159,550), 50.0).
fillpoint(r2, xy(439,550), 50.0).
fillpoint(r2, xy(113,164), 45.0).
fillpoint(r2, xy(116,163), 44.0).
fillpoint(r2, xy(124,161), 42.0).
fillpoint(r2, xy(130,160), 41.0).
fillpoint(r2, xy(81,489), 41.0).
fillpoint(r2, xy(141,160), 40.0).
fillpoint(r2, xy(91,490), 40.0).
fillpoint(r2, xy(608,125), 31.4).
fillpoint(r2, xy(610,29), 29.7).
fillpoint(r2, xy(469,129), 29.7).
fillpoint(r2, xy(610,570), 29.7).
fillpoint(r2, xy(308,28), 29.0).
fillpoint(r2, xy(371,28), 29.0).
fillpoint(r2, xy(608,28), 29.0).
fillpoint(r2, xy(611,31), 29.0).
fillpoint(r2, xy(318,81), 29.0).
fillpoint(r2, xy(611,118), 29.0).
fillpoint(r2, xy(471,128), 29.0).
fillpoint(r2, xy(468,131), 29.0).
fillpoint(r2, xy(611,131), 29.0).
fillpoint(r2, xy(68,231), 29.0).
fillpoint(r2, xy(68,468), 29.0).
fillpoint(r2, xy(418,518), 29.0).
fillpoint(r2, xy(611,568), 29.0).
fillpoint(r2, xy(221,571), 29.0).
fillpoint(r2, xy(408,571), 29.0).
fillpoint(r2, xy(471,571), 29.0).
fillpoint(r2, xy(608,571), 29.0).
fillpoint(r2, xy(305,27), 28.0).
fillpoint(r2, xy(374,27), 28.0).
fillpoint(r2, xy(605,27), 28.0).
fillpoint(r2, xy(612,34), 28.0).
fillpoint(r2, xy(317,84), 28.0).
fillpoint(r2, xy(612,115), 28.0).
fillpoint(r2, xy(474,127), 28.0).
fillpoint(r2, xy(467,134), 28.0).
fillpoint(r2, xy(612,134), 28.0).
fillpoint(r2, xy(67,234), 28.0).
fillpoint(r2, xy(67,465), 28.0).
fillpoint(r2, xy(417,515), 28.0).
fillpoint(r2, xy(612,565), 28.0).
fillpoint(r2, xy(224,572), 28.0).
fillpoint(r2, xy(405,572), 28.0).
fillpoint(r2, xy(474,572), 28.0).
fillpoint(r2, xy(605,572), 28.0).
fillpoint(r2, xy(302,26), 27.0).
fillpoint(r2, xy(377,26), 27.0).
fillpoint(r2, xy(602,26), 27.0).
fillpoint(r2, xy(613,37), 27.0).
fillpoint(r2, xy(316,87), 27.0).
fillpoint(r2, xy(613,112), 27.0).
fillpoint(r2, xy(477,126), 27.0).
fillpoint(r2, xy(466,137), 27.0).
fillpoint(r2, xy(613,137), 27.0).
fillpoint(r2, xy(66,237), 27.0).
fillpoint(r2, xy(66,462), 27.0).
fillpoint(r2, xy(416,512), 27.0).
fillpoint(r2, xy(613,562), 27.0).
fillpoint(r2, xy(227,573), 27.0).
fillpoint(r2, xy(402,573), 27.0).
fillpoint(r2, xy(477,573), 27.0).
fillpoint(r2, xy(602,573), 27.0).
fillpoint(r2, xy(298,25), 26.0).
fillpoint(r2, xy(382,25), 26.0).
fillpoint(r2, xy(598,25), 26.0).
fillpoint(r2, xy(614,42), 26.0).
fillpoint(r2, xy(315,92), 26.0).
fillpoint(r2, xy(614,108), 26.0).
fillpoint(r2, xy(482,125), 26.0).
fillpoint(r2, xy(465,142), 26.0).
fillpoint(r2, xy(614,142), 26.0).
fillpoint(r2, xy(65,242), 26.0).
fillpoint(r2, xy(65,458), 26.0).
fillpoint(r2, xy(415,508), 26.0).
fillpoint(r2, xy(614,558), 26.0).
fillpoint(r2, xy(232,574), 26.0).
fillpoint(r2, xy(398,574), 26.0).
fillpoint(r2, xy(482,574), 26.0).
fillpoint(r2, xy(598,574), 26.0).
fillpoint(r2, xy(184,125), 25.7).
fillpoint(r2, xy(184,25), 25.0).
fillpoint(r2, xy(391,25), 25.0).
fillpoint(r2, xy(614,75), 25.0).
fillpoint(r2, xy(315,113), 25.0).
fillpoint(r2, xy(191,125), 25.0).
fillpoint(r2, xy(491,125), 25.0).
fillpoint(r2, xy(465,158), 25.0).
fillpoint(r2, xy(614,350), 25.0).
fillpoint(r2, xy(64,291), 25.0).
fillpoint(r2, xy(64,434), 25.0).
fillpoint(r2, xy(415,486), 25.0).
fillpoint(r2, xy(241,575), 25.0).
fillpoint(r2, xy(491,575), 25.0).
fillpoint(r2, xy(60,343), 21.0).
fillpoint(r2, xy(60,406), 21.0).
fillpoint(r2, xy(59,375), 20.0).
fillpoint(r2, xy(57,17), 18.0).
fillpoint(r2, xy(64,15), 16.0).
fillpoint(r2, xy(165,15), 16.0).
fillpoint(r2, xy(55,24), 16.0).
fillpoint(r2, xy(55,125), 16.0).
fillpoint(r2, xy(71,15), 15.0).
fillpoint(r2, xy(54,75), 15.0).
border(r2).
region(r12, '#ffdc00', 25500, centroid(314,324)).
perimeter(r12, 1160).
polygon(r12, [xy(339,450),xy(300,449),xy(300,400),xy(290,399),xy(289,300),xy(240,300),xy(239,340),xy(190,339),xy(190,250),xy(289,250),xy(290,200),xy(330,200),xy(330,249),xy(340,250),xy(340,350),xy(389,350),xy(390,310),xy(440,310),xy(440,399),xy(340,400),xy(339,450)]).
midline(r12, [xy(320,413),xy(319,377),xy(321,374),xy(316,363),xy(314,349),xy(315,301),xy(313,286),xy(307,274),xy(240,274),xy(220,278),xy(215,290),xy(215,315)]).
midline(r12, [xy(308,274),xy(310,272),xy(310,219)]).
midline(r12, [xy(319,414),xy(320,430)]).
midline(r12, [xy(322,375),xy(388,375),xy(410,370)]).
midline(r12, [xy(411,368),xy(414,359),xy(415,334)]).
fillpoint(r12, xy(308,275), 31.4).
fillpoint(r12, xy(321,375), 31.4).
fillpoint(r12, xy(219,279), 29.7).
fillpoint(r12, xy(410,370), 29.7).
fillpoint(r12, xy(221,278), 29.0).
fillpoint(r12, xy(218,281), 29.0).
fillpoint(r12, xy(311,281), 29.0).
fillpoint(r12, xy(318,368), 29.0).
fillpoint(r12, xy(411,368), 29.0).
fillpoint(r12, xy(408,371), 29.0).
fillpoint(r12, xy(224,277), 28.0).
fillpoint(r12, xy(217,284), 28.0).
fillpoint(r12, xy(312,284), 28.0).
fillpoint(r12, xy(317,365), 28.0).
fillpoint(r12, xy(412,365), 28.0).
fillpoint(r12, xy(405,372), 28.0).
fillpoint(r12, xy(227,276), 27.0).
fillpoint(r12, xy(216,287), 27.0).
fillpoint(r12, xy(313,287), 27.0).
fillpoint(r12, xy(316,362), 27.0).
fillpoint(r12, xy(413,362), 27.0).
fillpoint(r12, xy(402,373), 27.0).
fillpoint(r12, xy(232,275), 26.0).
fillpoint(r12, xy(215,292), 26.0).
fillpoint(r12, xy(314,292), 26.0).
fillpoint(r12, xy(315,358), 26.0).
fillpoint(r12, xy(414,358), 26.0).
fillpoint(r12, xy(398,374), 26.0).
fillpoint(r12, xy(241,275), 25.0).
fillpoint(r12, xy(215,308), 25.0).
fillpoint(r12, xy(314,325), 25.0).
fillpoint(r12, xy(415,341), 25.0).
fillpoint(r12, xy(341,375), 25.0).
fillpoint(r12, xy(309,234), 20.0).
fillpoint(r12, xy(319,416), 20.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(19,364),xy(20,19)]).
midline(r1, [xy(19,365),xy(20,500)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r33, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r33, 2200).
polygon(r33, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r33, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r33, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r33, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r33, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r33, [xy(524,635),xy(133,635),xy(126,634),xy(124,627),xy(125,605),xy(131,604),xy(544,604),xy(554,606),xy(554,633),xy(549,635),xy(525,635)]).
midline(r33, [xy(555,606),xy(563,604),xy(583,605),xy(585,611),xy(585,632),xy(583,634),xy(561,635),xy(555,633)]).
midline(r33, [xy(585,606),xy(593,604),xy(615,606),xy(615,631),xy(613,634),xy(591,635),xy(585,633)]).
midline(r33, [xy(616,605),xy(635,605)]).
midline(r33, [xy(615,633),xy(635,635)]).
fillpoint(r33, xy(555,606), 6.4).
fillpoint(r33, xy(585,606), 6.4).
fillpoint(r33, xy(615,606), 6.4).
fillpoint(r33, xy(555,633), 6.4).
fillpoint(r33, xy(585,633), 6.4).
fillpoint(r33, xy(615,633), 6.4).
fillpoint(r33, xy(126,605), 6.0).
fillpoint(r33, xy(125,634), 6.0).
fillpoint(r33, xy(131,605), 5.0).
fillpoint(r33, xy(561,605), 5.0).
fillpoint(r33, xy(591,605), 5.0).
fillpoint(r33, xy(621,605), 5.0).
fillpoint(r33, xy(124,620), 5.0).
fillpoint(r33, xy(554,620), 5.0).
fillpoint(r33, xy(584,620), 5.0).
fillpoint(r33, xy(614,620), 5.0).
fillpoint(r33, xy(131,635), 5.0).
fillpoint(r33, xy(561,635), 5.0).
fillpoint(r33, xy(591,635), 5.0).
fillpoint(r33, xy(621,635), 5.0).
border(r33).
region(r34, '#5a5a5a', 8400, centroid(340,620)).
perimeter(r34, 880).
polygon(r34, [xy(549,630),xy(130,630),xy(130,610),xy(549,610),xy(549,630)]).
midline(r34, [xy(304,619),xy(139,620)]).
midline(r34, [xy(305,619),xy(540,620)]).
fillpoint(r34, xy(139,620), 10.0).
region(r31, '#aaaaaa', 8000, centroid(60,578)).
perimeter(r31, 640).
polygon(r31, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
hole(r31, [xy(90,609),xy(90,590),xy(70,589),xy(69,550),xy(50,550),xy(50,569),xy(30,570),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
midline(r31, [xy(29,610),xy(20,595),xy(19,589),xy(20,564),xy(29,549)]).
midline(r31, [xy(31,549),xy(44,540),xy(54,539),xy(75,540),xy(83,544),xy(89,550),xy(89,570),xy(95,576),xy(100,592),xy(99,615),xy(95,619),xy(50,620),xy(36,615),xy(31,610)]).
fillpoint(r31, xy(29,550), 20.0).
fillpoint(r31, xy(89,560), 20.0).
fillpoint(r31, xy(29,610), 20.0).
fillpoint(r31, xy(97,618), 12.0).
fillpoint(r31, xy(45,540), 11.0).
fillpoint(r31, xy(74,540), 11.0).
fillpoint(r31, xy(20,565), 11.0).
fillpoint(r31, xy(99,585), 11.0).
fillpoint(r31, xy(20,594), 11.0).
fillpoint(r31, xy(99,614), 11.0).
fillpoint(r31, xy(45,619), 11.0).
fillpoint(r31, xy(94,619), 11.0).
fillpoint(r31, xy(51,540), 10.0).
fillpoint(r31, xy(19,580), 10.0).
fillpoint(r31, xy(99,600), 10.0).
fillpoint(r31, xy(51,620), 10.0).
region(r4, '#aaaaaa', 4300, centroid(114,75)).
perimeter(r4, 440).
polygon(r4, [xy(149,110),xy(80,109),xy(80,40),xy(150,40),xy(149,110)]).
hole(r4, [xy(130,89),xy(129,60),xy(100,60),xy(100,70),xy(120,70),xy(120,90),xy(130,89)]).
hole(r4, [xy(110,89),xy(109,80),xy(100,80),xy(100,90),xy(110,89)]).
midline(r4, [xy(139,92),xy(140,60),xy(139,54),xy(135,50),xy(100,49),xy(91,51),xy(89,63),xy(91,98),xy(101,100),xy(113,99),xy(115,93),xy(114,76),xy(106,74),xy(92,75)]).
midline(r4, [xy(139,93),xy(135,99),xy(115,99)]).
fillpoint(r4, xy(92,51), 12.0).
fillpoint(r4, xy(138,51), 12.0).
fillpoint(r4, xy(91,98), 12.0).
fillpoint(r4, xy(137,98), 12.0).
fillpoint(r4, xy(95,50), 11.0).
fillpoint(r4, xy(134,50), 11.0).
fillpoint(r4, xy(90,55), 11.0).
fillpoint(r4, xy(139,55), 11.0).
fillpoint(r4, xy(90,75), 11.0).
fillpoint(r4, xy(90,94), 11.0).
fillpoint(r4, xy(139,94), 11.0).
fillpoint(r4, xy(95,99), 11.0).
fillpoint(r4, xy(115,99), 11.0).
fillpoint(r4, xy(134,99), 11.0).
fillpoint(r4, xy(101,50), 10.0).
fillpoint(r4, xy(89,65), 10.0).
fillpoint(r4, xy(139,75), 10.0).
fillpoint(r4, xy(89,85), 10.0).
fillpoint(r4, xy(101,100), 10.0).
fillpoint(r4, xy(121,100), 10.0).
fillpoint(r4, xy(114,75), 6.0).
fillpoint(r4, xy(101,75), 5.0).
fillpoint(r4, xy(114,85), 5.0).
region(r15, '#ffdc00', 2000, centroid(520,274)).
perimeter(r15, 180).
polygon(r15, [xy(539,300),xy(500,299),xy(500,250),xy(540,250),xy(539,300)]).
midline(r15, [xy(520,269),xy(520,280)]).
fillpoint(r15, xy(519,275), 20.0).
region(r28, '#ffdc00', 2000, centroid(520,424)).
perimeter(r28, 180).
polygon(r28, [xy(539,450),xy(500,449),xy(500,400),xy(540,400),xy(539,450)]).
midline(r28, [xy(520,419),xy(520,430)]).
fillpoint(r28, xy(519,425), 20.0).
region(r32, '#dcdcdc', 2000, centroid(60,584)).
perimeter(r32, 240).
polygon(r32, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,570),xy(49,570),xy(50,550),xy(70,550),xy(70,589),xy(90,590),xy(89,610)]).
midline(r32, [xy(44,579),xy(39,580)]).
midline(r32, [xy(45,579),xy(57,579),xy(60,559)]).
midline(r32, [xy(57,581),xy(61,598),xy(80,600)]).
fillpoint(r32, xy(57,580), 12.8).
fillpoint(r32, xy(61,598), 12.0).
fillpoint(r32, xy(59,574), 11.0).
fillpoint(r32, xy(59,585), 11.0).
fillpoint(r32, xy(60,594), 11.0).
fillpoint(r32, xy(65,599), 11.0).
fillpoint(r32, xy(59,564), 10.0).
fillpoint(r32, xy(39,580), 10.0).
fillpoint(r32, xy(71,600), 10.0).
region(r7, '#870c25', 1500, centroid(564,84)).
perimeter(r7, 160).
polygon(r7, [xy(589,100),xy(540,100),xy(540,70),xy(589,70),xy(589,100)]).
midline(r7, [xy(560,85),xy(554,85)]).
midline(r7, [xy(561,85),xy(575,85)]).
fillpoint(r7, xy(554,85), 15.0).
region(r5, '#bebebe', 1000, centroid(564,60)).
perimeter(r5, 140).
polygon(r5, [xy(589,70),xy(540,70),xy(540,50),xy(589,50),xy(589,70)]).
midline(r5, [xy(570,60),xy(549,60)]).
midline(r5, [xy(571,59),xy(580,60)]).
fillpoint(r5, xy(549,60), 10.0).
region(r9, '#5a5a5a', 800, centroid(214,174)).
perimeter(r9, 160).
polygon(r9, [xy(229,190),xy(200,189),xy(200,160),xy(230,160),xy(229,190)]).
hole(r9, [xy(220,179),xy(219,170),xy(210,170),xy(210,180),xy(220,179)]).
midline(r9, [xy(224,182),xy(225,170),xy(223,165),xy(205,165),xy(204,172),xy(205,184),xy(224,184)]).
fillpoint(r9, xy(206,165), 6.0).
fillpoint(r9, xy(224,165), 6.0).
fillpoint(r9, xy(205,184), 6.0).
fillpoint(r9, xy(223,184), 6.0).
fillpoint(r9, xy(211,165), 5.0).
fillpoint(r9, xy(204,175), 5.0).
fillpoint(r9, xy(224,175), 5.0).
fillpoint(r9, xy(211,185), 5.0).
region(r29, '#5a5a5a', 800, centroid(364,524)).
perimeter(r29, 160).
polygon(r29, [xy(379,540),xy(350,539),xy(350,510),xy(380,510),xy(379,540)]).
hole(r29, [xy(370,529),xy(369,520),xy(360,520),xy(360,530),xy(370,529)]).
midline(r29, [xy(374,532),xy(375,522),xy(373,515),xy(355,515),xy(354,526),xy(355,534),xy(374,534)]).
fillpoint(r29, xy(356,515), 6.0).
fillpoint(r29, xy(374,515), 6.0).
fillpoint(r29, xy(355,534), 6.0).
fillpoint(r29, xy(373,534), 6.0).
fillpoint(r29, xy(361,515), 5.0).
fillpoint(r29, xy(354,525), 5.0).
fillpoint(r29, xy(374,525), 5.0).
fillpoint(r29, xy(361,535), 5.0).
region(r6, '#870c25', 500, centroid(118,70)).
perimeter(r6, 120).
polygon(r6, [xy(129,90),xy(120,89),xy(119,70),xy(100,69),xy(100,60),xy(130,60),xy(129,90)]).
midline(r6, [xy(119,64),xy(104,65)]).
midline(r6, [xy(120,65),xy(124,65),xy(125,85)]).
fillpoint(r6, xy(124,65), 6.0).
fillpoint(r6, xy(104,65), 5.0).
fillpoint(r6, xy(125,78), 5.0).
region(r11, '#0074d9', 500, centroid(464,194)).
perimeter(r11, 120).
polygon(r11, [xy(489,200),xy(440,200),xy(440,190),xy(489,190),xy(489,200)]).
midline(r11, [xy(476,195),xy(444,195)]).
midline(r11, [xy(477,195),xy(485,195)]).
fillpoint(r11, xy(444,195), 5.0).
region(r13, '#0074d9', 500, centroid(334,224)).
perimeter(r13, 120).
polygon(r13, [xy(339,250),xy(330,249),xy(330,200),xy(340,200),xy(339,250)]).
midline(r13, [xy(335,217),xy(335,204)]).
midline(r13, [xy(335,218),xy(335,245)]).
fillpoint(r13, xy(334,225), 5.0).
region(r14, '#0074d9', 500, centroid(494,274)).
perimeter(r14, 120).
polygon(r14, [xy(499,300),xy(490,299),xy(490,250),xy(500,250),xy(499,300)]).
midline(r14, [xy(495,261),xy(495,254)]).
midline(r14, [xy(495,262),xy(495,295)]).
fillpoint(r14, xy(494,275), 5.0).
region(r16, '#0074d9', 500, centroid(414,304)).
perimeter(r16, 120).
polygon(r16, [xy(439,310),xy(390,310),xy(390,300),xy(439,300),xy(439,310)]).
midline(r16, [xy(420,304),xy(394,305)]).
midline(r16, [xy(421,304),xy(435,305)]).
fillpoint(r16, xy(394,305), 5.0).
region(r24, '#0074d9', 500, centroid(214,344)).
perimeter(r24, 120).
polygon(r24, [xy(239,350),xy(190,350),xy(190,340),xy(239,340),xy(239,350)]).
midline(r24, [xy(209,344),xy(194,345)]).
midline(r24, [xy(210,345),xy(235,345)]).
fillpoint(r24, xy(194,345), 5.0).
region(r25, '#0074d9', 500, centroid(84,374)).
perimeter(r25, 120).
polygon(r25, [xy(89,400),xy(80,399),xy(80,350),xy(90,350),xy(89,400)]).
midline(r25, [xy(85,361),xy(85,354)]).
midline(r25, [xy(84,362),xy(85,395)]).
fillpoint(r25, xy(84,375), 5.0).
region(r26, '#0074d9', 500, centroid(294,424)).
perimeter(r26, 120).
polygon(r26, [xy(299,450),xy(290,449),xy(290,400),xy(300,400),xy(299,450)]).
midline(r26, [xy(295,417),xy(295,445)]).
midline(r26, [xy(295,416),xy(295,404)]).
fillpoint(r26, xy(294,425), 5.0).
region(r27, '#0074d9', 500, centroid(494,424)).
perimeter(r27, 120).
polygon(r27, [xy(499,450),xy(490,449),xy(490,400),xy(500,400),xy(499,450)]).
midline(r27, [xy(495,411),xy(495,404)]).
midline(r27, [xy(495,412),xy(495,445)]).
fillpoint(r27, xy(494,425), 5.0).
region(r35, '#7fdbff', 400, centroid(570,620)).
perimeter(r35, 80).
polygon(r35, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r35, [xy(569,619),xy(570,620)]).
fillpoint(r35, xy(569,620), 10.0).
region(r36, '#7fdbff', 400, centroid(600,620)).
perimeter(r36, 80).
polygon(r36, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r36, [xy(599,619),xy(600,620)]).
fillpoint(r36, xy(599,620), 10.0).
region(r37, '#7fdbff', 400, centroid(630,620)).
perimeter(r37, 80).
polygon(r37, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r37, [xy(629,619),xy(630,620)]).
fillpoint(r37, xy(629,620), 10.0).
border(r37).
region(r20, '#000000', 300, centroid(268,328)).
perimeter(r20, 80).
polygon(r20, [xy(269,340),xy(260,339),xy(260,320),xy(279,320),xy(280,329),xy(270,330),xy(269,340)]).
midline(r20, [xy(265,331),xy(265,335)]).
midline(r20, [xy(265,330),xy(265,325),xy(275,325)]).
fillpoint(r20, xy(266,325), 6.0).
fillpoint(r20, xy(271,325), 5.0).
fillpoint(r20, xy(265,333), 5.0).
region(r8, '#870c25', 100, centroid(104,84)).
perimeter(r8, 40).
polygon(r8, [xy(109,90),xy(100,89),xy(100,80),xy(110,80),xy(109,90)]).
midline(r8, [xy(105,85),xy(105,84)]).
fillpoint(r8, xy(104,85), 5.0).
region(r10, '#2ecc40', 100, centroid(214,174)).
perimeter(r10, 40).
polygon(r10, [xy(219,180),xy(210,179),xy(210,170),xy(220,170),xy(219,180)]).
midline(r10, [xy(215,175),xy(215,174)]).
fillpoint(r10, xy(214,175), 5.0).
region(r17, '#000000', 100, centroid(254,314)).
perimeter(r17, 40).
polygon(r17, [xy(259,320),xy(250,319),xy(250,310),xy(260,310),xy(259,320)]).
midline(r17, [xy(255,315),xy(255,314)]).
fillpoint(r17, xy(254,315), 5.0).
region(r30, '#2ecc40', 100, centroid(364,524)).
perimeter(r30, 40).
polygon(r30, [xy(369,530),xy(360,529),xy(360,520),xy(370,520),xy(369,530)]).
midline(r30, [xy(365,525),xy(365,524)]).
fillpoint(r30, xy(364,525), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 2950).
adjacent(r2, r5).
shared_edge(r2, r5, 70).
adjacent(r2, r7).
shared_edge(r2, r7, 80).
adjacent(r2, r11).
shared_edge(r2, r11, 50).
adjacent(r2, r25).
shared_edge(r2, r25, 70).
adjacent(r2, r31).
shared_edge(r2, r31, 400).
adjacent(r2, r33).
shared_edge(r2, r33, 560).
adjacent(r3, r4).
shared_edge(r3, r4, 280).
adjacent(r3, r5).
shared_edge(r3, r5, 20).
adjacent(r3, r7).
shared_edge(r3, r7, 30).
adjacent(r3, r9).
shared_edge(r3, r9, 120).
adjacent(r3, r11).
shared_edge(r3, r11, 70).
adjacent(r3, r12).
shared_edge(r3, r12, 940).
adjacent(r3, r13).
shared_edge(r3, r13, 60).
adjacent(r3, r14).
shared_edge(r3, r14, 70).
adjacent(r3, r15).
shared_edge(r3, r15, 130).
adjacent(r3, r16).
shared_edge(r3, r16, 70).
adjacent(r3, r17).
shared_edge(r3, r17, 40).
adjacent(r3, r20).
shared_edge(r3, r20, 80).
adjacent(r3, r24).
shared_edge(r3, r24, 70).
adjacent(r3, r25).
shared_edge(r3, r25, 50).
adjacent(r3, r26).
shared_edge(r3, r26, 60).
adjacent(r3, r27).
shared_edge(r3, r27, 70).
adjacent(r3, r28).
shared_edge(r3, r28, 130).
adjacent(r3, r29).
shared_edge(r3, r29, 120).
adjacent(r4, r6).
shared_edge(r4, r6, 120).
adjacent(r4, r8).
shared_edge(r4, r8, 40).
adjacent(r5, r7).
shared_edge(r5, r7, 50).
adjacent(r9, r10).
shared_edge(r9, r10, 40).
adjacent(r12, r13).
shared_edge(r12, r13, 60).
adjacent(r12, r16).
shared_edge(r12, r16, 50).
adjacent(r12, r24).
shared_edge(r12, r24, 50).
adjacent(r12, r26).
shared_edge(r12, r26, 60).
adjacent(r14, r15).
shared_edge(r14, r15, 50).
adjacent(r27, r28).
shared_edge(r27, r28, 50).
adjacent(r29, r30).
shared_edge(r29, r30, 40).
adjacent(r31, r32).
shared_edge(r31, r32, 240).
adjacent(r33, r34).
shared_edge(r33, r34, 880).
adjacent(r33, r35).
shared_edge(r33, r35, 80).
adjacent(r33, r36).
shared_edge(r33, r36, 80).
adjacent(r33, r37).
shared_edge(r33, r37, 60).

encloses(r4, r6).
encloses(r4, r8).
encloses(r9, r10).
encloses(r3, r17).
encloses(r3, r20).
encloses(r29, r30).
encloses(r31, r32).
encloses(r33, r34).
encloses(r33, r35).
encloses(r33, r36).
