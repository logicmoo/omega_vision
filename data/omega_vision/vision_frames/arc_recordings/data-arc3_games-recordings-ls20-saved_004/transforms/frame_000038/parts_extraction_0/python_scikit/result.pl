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

region(r2, '#ffdc00', 189900, centroid(335,312)).
perimeter(r2, 7520).
polygon(r2, [xy(610,569),xy(610,480),xy(590,479),xy(589,40),xy(540,40),xy(539,50),xy(440,50),xy(440,199),xy(539,200),xy(539,250),xy(390,249),xy(390,150),xy(340,149),xy(340,100),xy(390,99),xy(389,50),xy(80,50),xy(80,99),xy(90,100),xy(90,500),xy(190,499),xy(190,400),xy(140,399),xy(140,100),xy(289,100),xy(289,150),xy(190,150),xy(190,349),xy(290,350),xy(290,399),xy(240,400),xy(240,549),xy(390,549),xy(390,400),xy(340,399),xy(340,350),xy(539,350),xy(540,479),xy(520,480),xy(520,569),xy(610,569)]).
hole(r2, [xy(0,520),xy(40,519),xy(40,0)]).
hole(r2, [xy(639,600),xy(120,600),xy(120,639)]).
hole(r2, [xy(110,629),xy(109,530),xy(10,530),xy(10,630),xy(110,629)]).
midline(r2, [xy(164,215),xy(164,152),xy(165,140),xy(170,128),xy(193,124),xy(265,125)]).
midline(r2, [xy(165,216),xy(164,348),xy(168,369),xy(176,373),xy(203,376),xy(214,382),xy(230,375),xy(265,375)]).
midline(r2, [xy(215,383),xy(214,508),xy(204,532),xy(189,549),xy(159,549),xy(132,523),xy(122,517),xy(107,514),xy(83,514),xy(65,504),xy(43,524),xy(5,525),xy(4,629),xy(5,634),xy(11,635),xy(113,634),xy(115,628),xy(114,600),xy(116,594),xy(159,550)]).
midline(r2, [xy(65,503),xy(65,119),xy(61,111),xy(59,98),xy(59,53),xy(61,38),xy(66,26),xy(80,24),xy(389,24),xy(403,26),xy(415,31),xy(415,99),xy(412,116),xy(407,125),xy(364,125)]).
midline(r2, [xy(408,125),xy(414,141),xy(415,209),xy(419,220),xy(440,225),xy(515,225)]).
midline(r2, [xy(416,30),xy(426,26),xy(442,24),xy(520,25),xy(528,21),xy(540,19),xy(588,19),xy(601,21),xy(613,26),xy(615,40),xy(614,455),xy(622,467),xy(625,480),xy(625,569),xy(623,579),xy(619,583),xy(608,585),xy(513,584),xy(497,576),xy(455,535),xy(419,566),xy(403,573),xy(389,575),xy(230,574),xy(207,564),xy(190,549)]).
midline(r2, [xy(455,534),xy(455,464),xy(465,425),xy(429,390),xy(409,378),xy(388,374),xy(364,375)]).
midline(r2, [xy(466,429),xy(470,429),xy(470,431)]).
fillpoint(r2, xy(464,427), 75.0).
fillpoint(r2, xy(460,442), 71.0).
fillpoint(r2, xy(459,445), 70.0).
fillpoint(r2, xy(458,449), 69.0).
fillpoint(r2, xy(457,454), 68.0).
fillpoint(r2, xy(456,460), 67.0).
fillpoint(r2, xy(455,467), 66.0).
fillpoint(r2, xy(455,508), 65.0).
fillpoint(r2, xy(159,550), 50.0).
fillpoint(r2, xy(415,31), 31.4).
fillpoint(r2, xy(408,125), 31.4).
fillpoint(r2, xy(215,381), 31.4).
fillpoint(r2, xy(169,129), 29.7).
fillpoint(r2, xy(419,220), 29.7).
fillpoint(r2, xy(169,370), 29.7).
fillpoint(r2, xy(408,28), 29.0).
fillpoint(r2, xy(421,28), 29.0).
fillpoint(r2, xy(411,118), 29.0).
fillpoint(r2, xy(171,128), 29.0).
fillpoint(r2, xy(168,131), 29.0).
fillpoint(r2, xy(411,131), 29.0).
fillpoint(r2, xy(418,218), 29.0).
fillpoint(r2, xy(421,221), 29.0).
fillpoint(r2, xy(168,368), 29.0).
fillpoint(r2, xy(171,371), 29.0).
fillpoint(r2, xy(208,378), 29.0).
fillpoint(r2, xy(221,378), 29.0).
fillpoint(r2, xy(408,378), 29.0).
fillpoint(r2, xy(211,518), 29.0).
fillpoint(r2, xy(221,571), 29.0).
fillpoint(r2, xy(408,571), 29.0).
fillpoint(r2, xy(405,27), 28.0).
fillpoint(r2, xy(424,27), 28.0).
fillpoint(r2, xy(412,115), 28.0).
fillpoint(r2, xy(174,127), 28.0).
fillpoint(r2, xy(167,134), 28.0).
fillpoint(r2, xy(412,134), 28.0).
fillpoint(r2, xy(417,215), 28.0).
fillpoint(r2, xy(424,222), 28.0).
fillpoint(r2, xy(167,365), 28.0).
fillpoint(r2, xy(174,372), 28.0).
fillpoint(r2, xy(205,377), 28.0).
fillpoint(r2, xy(224,377), 28.0).
fillpoint(r2, xy(405,377), 28.0).
fillpoint(r2, xy(212,515), 28.0).
fillpoint(r2, xy(224,572), 28.0).
fillpoint(r2, xy(405,572), 28.0).
fillpoint(r2, xy(67,26), 27.0).
fillpoint(r2, xy(402,26), 27.0).
fillpoint(r2, xy(427,26), 27.0).
fillpoint(r2, xy(613,27), 27.0).
fillpoint(r2, xy(413,112), 27.0).
fillpoint(r2, xy(177,126), 27.0).
fillpoint(r2, xy(166,137), 27.0).
fillpoint(r2, xy(413,137), 27.0).
fillpoint(r2, xy(416,212), 27.0).
fillpoint(r2, xy(427,223), 27.0).
fillpoint(r2, xy(166,362), 27.0).
fillpoint(r2, xy(177,373), 27.0).
fillpoint(r2, xy(202,376), 27.0).
fillpoint(r2, xy(227,376), 27.0).
fillpoint(r2, xy(402,376), 27.0).
fillpoint(r2, xy(213,512), 27.0).
fillpoint(r2, xy(227,573), 27.0).
fillpoint(r2, xy(402,573), 27.0).
fillpoint(r2, xy(72,25), 26.0).
fillpoint(r2, xy(398,25), 26.0).
fillpoint(r2, xy(432,25), 26.0).
fillpoint(r2, xy(614,32), 26.0).
fillpoint(r2, xy(414,108), 26.0).
fillpoint(r2, xy(182,125), 26.0).
fillpoint(r2, xy(165,142), 26.0).
fillpoint(r2, xy(414,142), 26.0).
fillpoint(r2, xy(415,208), 26.0).
fillpoint(r2, xy(432,224), 26.0).
fillpoint(r2, xy(165,358), 26.0).
fillpoint(r2, xy(182,374), 26.0).
fillpoint(r2, xy(198,375), 26.0).
fillpoint(r2, xy(232,375), 26.0).
fillpoint(r2, xy(398,375), 26.0).
fillpoint(r2, xy(214,508), 26.0).
fillpoint(r2, xy(232,574), 26.0).
fillpoint(r2, xy(398,574), 26.0).
fillpoint(r2, xy(65,504), 25.5).
fillpoint(r2, xy(81,25), 25.0).
fillpoint(r2, xy(441,25), 25.0).
fillpoint(r2, xy(615,248), 25.0).
fillpoint(r2, xy(414,75), 25.0).
fillpoint(r2, xy(64,309), 25.0).
fillpoint(r2, xy(191,125), 25.0).
fillpoint(r2, xy(364,125), 25.0).
fillpoint(r2, xy(164,250), 25.0).
fillpoint(r2, xy(414,175), 25.0).
fillpoint(r2, xy(441,225), 25.0).
fillpoint(r2, xy(241,375), 25.0).
fillpoint(r2, xy(364,375), 25.0).
fillpoint(r2, xy(214,450), 25.0).
fillpoint(r2, xy(241,575), 25.0).
fillpoint(r2, xy(533,20), 21.0).
fillpoint(r2, xy(596,20), 21.0).
fillpoint(r2, xy(60,43), 21.0).
fillpoint(r2, xy(60,106), 21.0).
fillpoint(r2, xy(541,20), 20.0).
fillpoint(r2, xy(59,75), 20.0).
border(r2).
region(r5, '#2ecc40', 158800, centroid(338,279)).
perimeter(r5, 5120).
polygon(r5, [xy(609,570),xy(520,569),xy(520,480),xy(540,479),xy(539,350),xy(340,350),xy(340,399),xy(390,400),xy(390,549),xy(240,549),xy(240,400),xy(289,400),xy(290,350),xy(190,349),xy(190,150),xy(289,150),xy(289,100),xy(140,100),xy(140,399),xy(190,400),xy(190,499),xy(90,499),xy(90,50),xy(389,50),xy(390,99),xy(340,100),xy(340,149),xy(390,150),xy(390,250),xy(540,249),xy(539,200),xy(440,199),xy(440,50),xy(590,50),xy(590,479),xy(610,480),xy(609,570)]).
hole(r5, [xy(600,559),xy(599,490),xy(530,490),xy(530,560),xy(600,559)]).
hole(r5, [xy(540,149),xy(539,100),xy(490,100),xy(490,150),xy(540,149)]).
hole(r5, [xy(330,489),xy(329,460),xy(300,460),xy(300,490),xy(330,489)]).
midline(r5, [xy(565,127),xy(564,91),xy(559,78),xy(533,74),xy(481,75),xy(469,79),xy(465,90),xy(464,149),xy(469,170),xy(490,175),xy(558,174),xy(562,183),xy(565,200),xy(564,259),xy(554,282),xy(539,299),xy(391,300),xy(370,298),xy(350,292),xy(314,274),xy(289,250)]).
midline(r5, [xy(539,300),xy(556,320),xy(564,340),xy(565,464),xy(545,483),xy(525,485),xy(524,559),xy(525,564),xy(530,565),xy(593,565),xy(604,563),xy(604,486),xy(584,483),xy(565,465)]).
midline(r5, [xy(314,275),xy(315,423),xy(274,436),xy(270,450),xy(269,489),xy(274,513),xy(285,518),xy(329,520),xy(344,518),xy(355,513),xy(360,488),xy(359,450),xy(355,436),xy(344,431),xy(325,428),xy(315,424)]).
midline(r5, [xy(290,248),xy(315,220),xy(315,83),xy(313,80),xy(289,74),xy(142,74),xy(130,75),xy(119,79),xy(114,101),xy(114,399),xy(116,413),xy(122,427),xy(140,450)]).
midline(r5, [xy(315,81),xy(331,75),xy(365,75)]).
midline(r5, [xy(559,173),xy(564,159),xy(564,128)]).
fillpoint(r5, xy(290,250), 100.0).
fillpoint(r5, xy(351,292), 58.0).
fillpoint(r5, xy(363,296), 54.0).
fillpoint(r5, xy(367,297), 53.0).
fillpoint(r5, xy(372,298), 52.0).
fillpoint(r5, xy(378,299), 51.0).
fillpoint(r5, xy(391,300), 50.0).
fillpoint(r5, xy(139,450), 50.0).
fillpoint(r5, xy(315,424), 35.4).
fillpoint(r5, xy(275,435), 35.4).
fillpoint(r5, xy(354,435), 35.4).
fillpoint(r5, xy(275,514), 35.4).
fillpoint(r5, xy(354,514), 35.4).
fillpoint(r5, xy(303,428), 32.0).
fillpoint(r5, xy(326,428), 32.0).
fillpoint(r5, xy(286,431), 32.0).
fillpoint(r5, xy(343,431), 32.0).
fillpoint(r5, xy(271,446), 32.0).
fillpoint(r5, xy(358,446), 32.0).
fillpoint(r5, xy(271,503), 32.0).
fillpoint(r5, xy(358,503), 32.0).
fillpoint(r5, xy(286,518), 32.0).
fillpoint(r5, xy(343,518), 32.0).
fillpoint(r5, xy(315,81), 31.4).
fillpoint(r5, xy(558,175), 31.4).
fillpoint(r5, xy(298,429), 31.1).
fillpoint(r5, xy(331,429), 31.1).
fillpoint(r5, xy(291,430), 31.1).
fillpoint(r5, xy(338,430), 31.1).
fillpoint(r5, xy(270,452), 31.0).
fillpoint(r5, xy(359,452), 31.0).
fillpoint(r5, xy(270,498), 31.0).
fillpoint(r5, xy(359,498), 31.0).
fillpoint(r5, xy(292,519), 31.0).
fillpoint(r5, xy(338,519), 31.0).
fillpoint(r5, xy(269,475), 30.0).
fillpoint(r5, xy(359,475), 30.0).
fillpoint(r5, xy(301,520), 30.0).
fillpoint(r5, xy(119,79), 29.7).
fillpoint(r5, xy(469,79), 29.7).
fillpoint(r5, xy(560,79), 29.7).
fillpoint(r5, xy(469,170), 29.7).
fillpoint(r5, xy(121,78), 29.0).
fillpoint(r5, xy(308,78), 29.0).
fillpoint(r5, xy(321,78), 29.0).
fillpoint(r5, xy(471,78), 29.0).
fillpoint(r5, xy(558,78), 29.0).
fillpoint(r5, xy(118,81), 29.0).
fillpoint(r5, xy(468,81), 29.0).
fillpoint(r5, xy(561,81), 29.0).
fillpoint(r5, xy(468,168), 29.0).
fillpoint(r5, xy(561,168), 29.0).
fillpoint(r5, xy(471,171), 29.0).
fillpoint(r5, xy(561,181), 29.0).
fillpoint(r5, xy(561,268), 29.0).
fillpoint(r5, xy(561,331), 29.0).
fillpoint(r5, xy(118,418), 29.0).
fillpoint(r5, xy(124,77), 28.0).
fillpoint(r5, xy(305,77), 28.0).
fillpoint(r5, xy(324,77), 28.0).
fillpoint(r5, xy(474,77), 28.0).
fillpoint(r5, xy(555,77), 28.0).
fillpoint(r5, xy(117,84), 28.0).
fillpoint(r5, xy(467,84), 28.0).
fillpoint(r5, xy(562,84), 28.0).
fillpoint(r5, xy(467,165), 28.0).
fillpoint(r5, xy(562,165), 28.0).
fillpoint(r5, xy(474,172), 28.0).
fillpoint(r5, xy(562,184), 28.0).
fillpoint(r5, xy(562,265), 28.0).
fillpoint(r5, xy(562,334), 28.0).
fillpoint(r5, xy(117,415), 28.0).
fillpoint(r5, xy(127,76), 27.0).
fillpoint(r5, xy(302,76), 27.0).
fillpoint(r5, xy(327,76), 27.0).
fillpoint(r5, xy(477,76), 27.0).
fillpoint(r5, xy(552,76), 27.0).
fillpoint(r5, xy(116,87), 27.0).
fillpoint(r5, xy(466,87), 27.0).
fillpoint(r5, xy(563,87), 27.0).
fillpoint(r5, xy(466,162), 27.0).
fillpoint(r5, xy(563,162), 27.0).
fillpoint(r5, xy(477,173), 27.0).
fillpoint(r5, xy(563,187), 27.0).
fillpoint(r5, xy(563,262), 27.0).
fillpoint(r5, xy(563,337), 27.0).
fillpoint(r5, xy(116,412), 27.0).
fillpoint(r5, xy(132,75), 26.0).
fillpoint(r5, xy(298,75), 26.0).
fillpoint(r5, xy(332,75), 26.0).
fillpoint(r5, xy(482,75), 26.0).
fillpoint(r5, xy(548,75), 26.0).
fillpoint(r5, xy(115,92), 26.0).
fillpoint(r5, xy(465,92), 26.0).
fillpoint(r5, xy(564,92), 26.0).
fillpoint(r5, xy(465,158), 26.0).
fillpoint(r5, xy(564,158), 26.0).
fillpoint(r5, xy(482,174), 26.0).
fillpoint(r5, xy(564,192), 26.0).
fillpoint(r5, xy(564,258), 26.0).
fillpoint(r5, xy(564,342), 26.0).
fillpoint(r5, xy(115,408), 26.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(19,483),xy(20,500)]).
midline(r1, [xy(20,482),xy(20,19)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r19, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r19, 2200).
polygon(r19, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r19, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r19, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r19, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r19, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r19, [xy(524,635),xy(130,635),xy(126,634),xy(124,629),xy(125,605),xy(547,604),xy(555,606),xy(555,632),xy(548,635),xy(525,634)]).
midline(r19, [xy(556,605),xy(577,604),xy(585,606),xy(585,629),xy(584,633),xy(579,635),xy(560,635),xy(555,633)]).
midline(r19, [xy(586,605),xy(609,604),xy(615,606),xy(615,631),xy(609,635),xy(590,635),xy(585,633)]).
midline(r19, [xy(616,605),xy(635,605)]).
midline(r19, [xy(615,633),xy(635,635)]).
fillpoint(r19, xy(555,606), 6.4).
fillpoint(r19, xy(585,606), 6.4).
fillpoint(r19, xy(615,606), 6.4).
fillpoint(r19, xy(555,633), 6.4).
fillpoint(r19, xy(585,633), 6.4).
fillpoint(r19, xy(615,633), 6.4).
fillpoint(r19, xy(126,605), 6.0).
fillpoint(r19, xy(125,634), 6.0).
fillpoint(r19, xy(131,605), 5.0).
fillpoint(r19, xy(561,605), 5.0).
fillpoint(r19, xy(591,605), 5.0).
fillpoint(r19, xy(621,605), 5.0).
fillpoint(r19, xy(124,620), 5.0).
fillpoint(r19, xy(554,620), 5.0).
fillpoint(r19, xy(584,620), 5.0).
fillpoint(r19, xy(614,620), 5.0).
fillpoint(r19, xy(131,635), 5.0).
fillpoint(r19, xy(561,635), 5.0).
fillpoint(r19, xy(591,635), 5.0).
fillpoint(r19, xy(621,635), 5.0).
border(r19).
region(r16, '#aaaaaa', 7600, centroid(61,578)).
perimeter(r16, 720).
polygon(r16, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
hole(r16, [xy(90,609),xy(89,590),xy(50,589),xy(49,550),xy(30,550),xy(30,610),xy(90,609)]).
hole(r16, [xy(90,569),xy(89,550),xy(70,550),xy(70,570),xy(90,569)]).
midline(r16, [xy(61,578),xy(59,565),xy(60,547),xy(57,541),xy(49,539),xy(21,541),xy(19,550),xy(20,615),xy(21,618),xy(35,620),xy(86,620),xy(98,617),xy(100,594),xy(97,580),xy(70,580),xy(62,578)]).
midline(r16, [xy(97,578),xy(100,568),xy(100,551),xy(97,541),xy(70,539),xy(60,542)]).
fillpoint(r16, xy(60,542), 12.8).
fillpoint(r16, xy(97,580), 12.8).
fillpoint(r16, xy(22,541), 12.0).
fillpoint(r16, xy(98,541), 12.0).
fillpoint(r16, xy(61,578), 12.0).
fillpoint(r16, xy(21,618), 12.0).
fillpoint(r16, xy(97,618), 12.0).
fillpoint(r16, xy(25,540), 11.0).
fillpoint(r16, xy(54,540), 11.0).
fillpoint(r16, xy(65,540), 11.0).
fillpoint(r16, xy(94,540), 11.0).
fillpoint(r16, xy(20,545), 11.0).
fillpoint(r16, xy(99,545), 11.0).
fillpoint(r16, xy(60,574), 11.0).
fillpoint(r16, xy(99,574), 11.0).
fillpoint(r16, xy(65,579), 11.0).
fillpoint(r16, xy(99,585), 11.0).
fillpoint(r16, xy(20,614), 11.0).
fillpoint(r16, xy(99,614), 11.0).
fillpoint(r16, xy(25,619), 11.0).
fillpoint(r16, xy(94,619), 11.0).
fillpoint(r16, xy(31,540), 10.0).
fillpoint(r16, xy(71,540), 10.0).
fillpoint(r16, xy(19,580), 10.0).
fillpoint(r16, xy(59,560), 10.0).
fillpoint(r16, xy(99,560), 10.0).
fillpoint(r16, xy(71,580), 10.0).
fillpoint(r16, xy(99,600), 10.0).
fillpoint(r16, xy(31,620), 10.0).
region(r20, '#2ecc40', 5600, centroid(270,620)).
perimeter(r20, 600).
polygon(r20, [xy(409,630),xy(130,630),xy(130,610),xy(409,610),xy(409,630)]).
midline(r20, [xy(304,619),xy(139,620)]).
midline(r20, [xy(305,619),xy(400,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r13, '#aaaaaa', 4300, centroid(565,524)).
perimeter(r13, 440).
polygon(r13, [xy(599,560),xy(530,559),xy(530,490),xy(600,490),xy(599,560)]).
hole(r13, [xy(580,539),xy(579,530),xy(560,529),xy(559,510),xy(550,510),xy(550,540),xy(580,539)]).
hole(r13, [xy(580,519),xy(579,510),xy(570,510),xy(570,520),xy(580,519)]).
midline(r13, [xy(589,542),xy(590,530),xy(588,525),xy(570,525),xy(565,523),xy(564,500),xy(541,501),xy(539,512),xy(541,548),xy(550,550),xy(578,550),xy(587,548),xy(589,543)]).
midline(r13, [xy(566,500),xy(588,501),xy(590,512),xy(589,524)]).
fillpoint(r13, xy(542,501), 12.0).
fillpoint(r13, xy(588,501), 12.0).
fillpoint(r13, xy(541,548), 12.0).
fillpoint(r13, xy(587,548), 12.0).
fillpoint(r13, xy(545,500), 11.0).
fillpoint(r13, xy(565,500), 11.0).
fillpoint(r13, xy(584,500), 11.0).
fillpoint(r13, xy(540,505), 11.0).
fillpoint(r13, xy(589,505), 11.0).
fillpoint(r13, xy(589,525), 11.0).
fillpoint(r13, xy(540,544), 11.0).
fillpoint(r13, xy(589,544), 11.0).
fillpoint(r13, xy(545,549), 11.0).
fillpoint(r13, xy(584,549), 11.0).
fillpoint(r13, xy(551,500), 10.0).
fillpoint(r13, xy(571,500), 10.0).
fillpoint(r13, xy(539,525), 10.0).
fillpoint(r13, xy(589,515), 10.0).
fillpoint(r13, xy(589,535), 10.0).
fillpoint(r13, xy(551,550), 10.0).
fillpoint(r13, xy(565,524), 6.0).
fillpoint(r13, xy(564,515), 5.0).
fillpoint(r13, xy(571,525), 5.0).
region(r21, '#5a5a5a', 2800, centroid(480,620)).
perimeter(r21, 320).
polygon(r21, [xy(549,630),xy(410,630),xy(410,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(421,619),xy(419,620)]).
midline(r21, [xy(422,619),xy(540,620)]).
fillpoint(r21, xy(419,620), 10.0).
region(r17, '#870c25', 2000, centroid(52,588)).
perimeter(r17, 240).
polygon(r17, [xy(89,610),xy(30,609),xy(30,550),xy(50,550),xy(50,590),xy(90,590),xy(89,610)]).
midline(r17, [xy(40,585),xy(40,559)]).
midline(r17, [xy(40,586),xy(41,598),xy(50,600),xy(80,600)]).
fillpoint(r17, xy(41,598), 12.0).
fillpoint(r17, xy(40,594), 11.0).
fillpoint(r17, xy(45,599), 11.0).
fillpoint(r17, xy(39,574), 10.0).
fillpoint(r17, xy(51,600), 10.0).
region(r7, '#870c25', 1500, centroid(514,134)).
perimeter(r7, 160).
polygon(r7, [xy(539,150),xy(490,150),xy(490,120),xy(539,120),xy(539,150)]).
midline(r7, [xy(510,135),xy(504,135)]).
midline(r7, [xy(511,134),xy(525,135)]).
fillpoint(r7, xy(504,135), 15.0).
region(r6, '#bebebe', 1000, centroid(514,110)).
perimeter(r6, 140).
polygon(r6, [xy(539,120),xy(490,120),xy(490,100),xy(539,100),xy(539,120)]).
midline(r6, [xy(509,110),xy(499,110)]).
midline(r6, [xy(510,109),xy(530,110)]).
fillpoint(r6, xy(499,110), 10.0).
region(r3, '#0074d9', 500, centroid(564,44)).
perimeter(r3, 120).
polygon(r3, [xy(589,50),xy(540,50),xy(540,40),xy(589,40),xy(589,50)]).
midline(r3, [xy(559,44),xy(544,45)]).
midline(r3, [xy(560,44),xy(585,45)]).
fillpoint(r3, xy(544,45), 5.0).
region(r4, '#0074d9', 500, centroid(84,74)).
perimeter(r4, 120).
polygon(r4, [xy(89,100),xy(80,99),xy(80,50),xy(90,50),xy(89,100)]).
midline(r4, [xy(85,64),xy(85,54)]).
midline(r4, [xy(84,65),xy(85,95)]).
fillpoint(r4, xy(84,75), 5.0).
region(r14, '#870c25', 500, centroid(560,528)).
perimeter(r14, 120).
polygon(r14, [xy(579,540),xy(550,539),xy(550,510),xy(560,510),xy(560,530),xy(580,530),xy(579,540)]).
midline(r14, [xy(555,521),xy(555,534),xy(575,535)]).
midline(r14, [xy(555,520),xy(555,514)]).
fillpoint(r14, xy(555,534), 6.0).
fillpoint(r14, xy(555,521), 5.0).
fillpoint(r14, xy(561,535), 5.0).
region(r18, '#870c25', 400, centroid(80,560)).
perimeter(r18, 80).
polygon(r18, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r18, [xy(79,559),xy(80,560)]).
fillpoint(r18, xy(79,560), 10.0).
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
region(r15, '#870c25', 100, centroid(574,514)).
perimeter(r15, 40).
polygon(r15, [xy(579,520),xy(570,519),xy(570,510),xy(580,510),xy(579,520)]).
midline(r15, [xy(575,515),xy(575,514)]).
fillpoint(r15, xy(574,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 70).
adjacent(r2, r4).
shared_edge(r2, r4, 70).
adjacent(r2, r5).
shared_edge(r2, r5, 4420).
adjacent(r2, r16).
shared_edge(r2, r16, 400).
adjacent(r2, r19).
shared_edge(r2, r19, 560).
adjacent(r3, r5).
shared_edge(r3, r5, 50).
adjacent(r4, r5).
shared_edge(r4, r5, 50).
adjacent(r5, r6).
shared_edge(r5, r6, 90).
adjacent(r5, r7).
shared_edge(r5, r7, 110).
adjacent(r5, r13).
shared_edge(r5, r13, 280).
adjacent(r6, r7).
shared_edge(r6, r7, 50).
adjacent(r13, r14).
shared_edge(r13, r14, 120).
adjacent(r13, r15).
shared_edge(r13, r15, 40).
adjacent(r16, r17).
shared_edge(r16, r17, 240).
adjacent(r16, r18).
shared_edge(r16, r18, 80).
adjacent(r19, r20).
shared_edge(r19, r20, 580).
adjacent(r19, r21).
shared_edge(r19, r21, 300).
adjacent(r19, r22).
shared_edge(r19, r22, 80).
adjacent(r19, r23).
shared_edge(r19, r23, 80).
adjacent(r19, r24).
shared_edge(r19, r24, 60).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r13, r14).
encloses(r13, r15).
encloses(r16, r17).
encloses(r16, r18).
encloses(r19, r22).
encloses(r19, r23).
