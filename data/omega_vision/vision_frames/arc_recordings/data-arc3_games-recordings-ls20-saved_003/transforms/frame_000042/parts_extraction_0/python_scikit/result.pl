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

region(r2, '#ffdc00', 212900, centroid(327,319)).
perimeter(r2, 6780).
polygon(r2, [xy(590,549),xy(590,390),xy(540,389),xy(540,300),xy(590,299),xy(590,200),xy(540,199),xy(539,50),xy(190,50),xy(189,100),xy(90,100),xy(90,249),xy(140,250),xy(140,379),xy(120,380),xy(120,470),xy(210,469),xy(210,380),xy(190,379),xy(190,250),xy(240,249),xy(240,150),xy(290,150),xy(290,249),xy(340,250),xy(340,349),xy(290,350),xy(290,449),xy(390,449),xy(390,350),xy(440,349),xy(440,250),xy(390,249),xy(390,150),xy(439,150),xy(440,199),xy(490,200),xy(490,399),xy(440,400),xy(440,499),xy(390,500),xy(390,549),xy(590,549)]).
hole(r2, [xy(0,520),xy(40,519),xy(40,0)]).
hole(r2, [xy(639,600),xy(120,600),xy(120,639)]).
hole(r2, [xy(110,629),xy(109,530),xy(10,530),xy(10,630),xy(110,629)]).
midline(r2, [xy(590,49),xy(575,37),xy(559,28),xy(536,24),xy(191,24),xy(176,26),xy(160,33),xy(140,50),xy(89,49)]).
midline(r2, [xy(589,51),xy(589,150),xy(604,167),xy(614,190),xy(615,299),xy(611,319),xy(602,335),xy(594,344),xy(584,345)]).
midline(r2, [xy(594,345),xy(610,368),xy(615,392),xy(615,548),xy(612,566),xy(609,571),xy(603,573),xy(589,575),xy(380,574),xy(354,562),xy(314,524),xy(290,525),xy(265,522),xy(245,530),xy(225,534),xy(176,535),xy(145,510),xy(133,504),xy(105,498),xy(84,489),xy(81,486),xy(79,468),xy(79,380),xy(83,355),xy(90,340),xy(90,299),xy(73,279),xy(65,259),xy(64,100),xy(66,86),xy(72,72),xy(89,51)]).
midline(r2, [xy(265,521),xy(250,461),xy(249,368),xy(241,341),xy(239,339),xy(235,339),xy(232,342),xy(236,341)]).
midline(r2, [xy(315,524),xy(339,500),xy(360,483),xy(376,476),xy(399,474),xy(410,470)]).
midline(r2, [xy(411,468),xy(415,449),xy(414,400),xy(418,380),xy(430,375),xy(448,374),xy(460,370),xy(465,349),xy(465,250),xy(463,236),xy(456,227),xy(430,224),xy(418,218),xy(414,198),xy(415,174)]).
midline(r2, [xy(174,535),xy(116,594),xy(114,602),xy(115,629),xy(113,634),xy(6,634),xy(4,629),xy(5,525),xy(43,524),xy(81,488)]).
midline(r2, [xy(240,338),xy(248,308),xy(265,298),xy(265,174)]).
midline(r2, [xy(91,340),xy(94,339),xy(96,341)]).
midline(r2, [xy(265,300),xy(290,300)]).
fillpoint(r2, xy(265,522), 77.1).
fillpoint(r2, xy(268,523), 77.0).
fillpoint(r2, xy(276,524), 76.0).
fillpoint(r2, xy(291,525), 75.0).
fillpoint(r2, xy(247,529), 71.0).
fillpoint(r2, xy(244,530), 70.0).
fillpoint(r2, xy(240,531), 69.0).
fillpoint(r2, xy(235,532), 68.0).
fillpoint(r2, xy(230,533), 67.0).
fillpoint(r2, xy(223,534), 66.0).
fillpoint(r2, xy(174,535), 65.0).
fillpoint(r2, xy(248,308), 59.0).
fillpoint(r2, xy(247,311), 58.0).
fillpoint(r2, xy(243,323), 54.0).
fillpoint(r2, xy(242,327), 53.0).
fillpoint(r2, xy(241,332), 52.0).
fillpoint(r2, xy(240,338), 51.0).
fillpoint(r2, xy(89,50), 50.0).
fillpoint(r2, xy(589,100), 50.0).
fillpoint(r2, xy(89,320), 50.0).
fillpoint(r2, xy(594,345), 45.3).
fillpoint(r2, xy(584,345), 45.0).
fillpoint(r2, xy(84,353), 45.0).
fillpoint(r2, xy(245,353), 45.0).
fillpoint(r2, xy(83,356), 44.0).
fillpoint(r2, xy(246,356), 44.0).
fillpoint(r2, xy(81,364), 42.0).
fillpoint(r2, xy(248,364), 42.0).
fillpoint(r2, xy(251,465), 42.0).
fillpoint(r2, xy(81,485), 42.0).
fillpoint(r2, xy(82,487), 42.0).
fillpoint(r2, xy(80,370), 41.0).
fillpoint(r2, xy(249,370), 41.0).
fillpoint(r2, xy(250,459), 41.0).
fillpoint(r2, xy(80,479), 41.0).
fillpoint(r2, xy(79,425), 40.0).
fillpoint(r2, xy(249,415), 40.0).
fillpoint(r2, xy(106,498), 32.0).
fillpoint(r2, xy(123,501), 32.0).
fillpoint(r2, xy(111,499), 31.1).
fillpoint(r2, xy(118,500), 31.1).
fillpoint(r2, xy(419,220), 29.7).
fillpoint(r2, xy(460,229), 29.7).
fillpoint(r2, xy(460,370), 29.7).
fillpoint(r2, xy(419,379), 29.7).
fillpoint(r2, xy(410,470), 29.7).
fillpoint(r2, xy(610,570), 29.7).
fillpoint(r2, xy(171,28), 29.0).
fillpoint(r2, xy(558,28), 29.0).
fillpoint(r2, xy(68,81), 29.0).
fillpoint(r2, xy(611,181), 29.0).
fillpoint(r2, xy(418,218), 29.0).
fillpoint(r2, xy(421,221), 29.0).
fillpoint(r2, xy(458,228), 29.0).
fillpoint(r2, xy(461,231), 29.0).
fillpoint(r2, xy(68,268), 29.0).
fillpoint(r2, xy(611,318), 29.0).
fillpoint(r2, xy(461,368), 29.0).
fillpoint(r2, xy(458,371), 29.0).
fillpoint(r2, xy(611,371), 29.0).
fillpoint(r2, xy(421,378), 29.0).
fillpoint(r2, xy(418,381), 29.0).
fillpoint(r2, xy(411,468), 29.0).
fillpoint(r2, xy(408,471), 29.0).
fillpoint(r2, xy(371,478), 29.0).
fillpoint(r2, xy(611,568), 29.0).
fillpoint(r2, xy(371,571), 29.0).
fillpoint(r2, xy(608,571), 29.0).
fillpoint(r2, xy(174,27), 28.0).
fillpoint(r2, xy(555,27), 28.0).
fillpoint(r2, xy(67,84), 28.0).
fillpoint(r2, xy(612,184), 28.0).
fillpoint(r2, xy(417,215), 28.0).
fillpoint(r2, xy(424,222), 28.0).
fillpoint(r2, xy(455,227), 28.0).
fillpoint(r2, xy(462,234), 28.0).
fillpoint(r2, xy(67,265), 28.0).
fillpoint(r2, xy(612,315), 28.0).
fillpoint(r2, xy(462,365), 28.0).
fillpoint(r2, xy(455,372), 28.0).
fillpoint(r2, xy(612,374), 28.0).
fillpoint(r2, xy(424,377), 28.0).
fillpoint(r2, xy(417,384), 28.0).
fillpoint(r2, xy(412,465), 28.0).
fillpoint(r2, xy(405,472), 28.0).
fillpoint(r2, xy(374,477), 28.0).
fillpoint(r2, xy(612,565), 28.0).
fillpoint(r2, xy(374,572), 28.0).
fillpoint(r2, xy(605,572), 28.0).
fillpoint(r2, xy(177,26), 27.0).
fillpoint(r2, xy(552,26), 27.0).
fillpoint(r2, xy(66,87), 27.0).
fillpoint(r2, xy(613,187), 27.0).
fillpoint(r2, xy(416,212), 27.0).
fillpoint(r2, xy(427,223), 27.0).
fillpoint(r2, xy(452,226), 27.0).
fillpoint(r2, xy(463,237), 27.0).
fillpoint(r2, xy(66,262), 27.0).
fillpoint(r2, xy(613,312), 27.0).
fillpoint(r2, xy(463,362), 27.0).
fillpoint(r2, xy(452,373), 27.0).
fillpoint(r2, xy(427,376), 27.0).
fillpoint(r2, xy(613,377), 27.0).
fillpoint(r2, xy(416,387), 27.0).
fillpoint(r2, xy(413,462), 27.0).
fillpoint(r2, xy(402,473), 27.0).
fillpoint(r2, xy(377,476), 27.0).
fillpoint(r2, xy(613,562), 27.0).
fillpoint(r2, xy(377,573), 27.0).
fillpoint(r2, xy(602,573), 27.0).
fillpoint(r2, xy(182,25), 26.0).
fillpoint(r2, xy(548,25), 26.0).
fillpoint(r2, xy(65,92), 26.0).
fillpoint(r2, xy(614,192), 26.0).
fillpoint(r2, xy(415,208), 26.0).
fillpoint(r2, xy(432,224), 26.0).
fillpoint(r2, xy(448,225), 26.0).
fillpoint(r2, xy(464,242), 26.0).
fillpoint(r2, xy(65,258), 26.0).
fillpoint(r2, xy(614,308), 26.0).
fillpoint(r2, xy(464,358), 26.0).
fillpoint(r2, xy(448,374), 26.0).
fillpoint(r2, xy(432,375), 26.0).
fillpoint(r2, xy(614,382), 26.0).
fillpoint(r2, xy(415,392), 26.0).
fillpoint(r2, xy(414,458), 26.0).
fillpoint(r2, xy(398,474), 26.0).
fillpoint(r2, xy(382,475), 26.0).
fillpoint(r2, xy(614,558), 26.0).
fillpoint(r2, xy(382,574), 26.0).
fillpoint(r2, xy(598,574), 26.0).
fillpoint(r2, xy(191,25), 25.0).
fillpoint(r2, xy(64,175), 25.0).
fillpoint(r2, xy(265,211), 25.0).
fillpoint(r2, xy(415,186), 25.0).
fillpoint(r2, xy(614,250), 25.0).
fillpoint(r2, xy(464,300), 25.0).
fillpoint(r2, xy(614,470), 25.0).
fillpoint(r2, xy(414,425), 25.0).
fillpoint(r2, xy(391,575), 25.0).
border(r2).
region(r3, '#2ecc40', 130000, centroid(382,255)).
perimeter(r3, 3420).
polygon(r3, [xy(589,550),xy(390,549),xy(390,500),xy(440,499),xy(440,400),xy(490,399),xy(490,200),xy(440,199),xy(439,150),xy(390,150),xy(390,249),xy(440,250),xy(440,349),xy(390,350),xy(389,450),xy(290,450),xy(290,350),xy(340,349),xy(340,250),xy(290,249),xy(290,150),xy(240,150),xy(239,250),xy(90,250),xy(90,100),xy(189,100),xy(190,50),xy(539,50),xy(540,199),xy(590,200),xy(590,299),xy(540,300),xy(540,389),xy(590,390),xy(589,550)]).
hole(r3, [xy(520,489),xy(520,480),xy(529,480),xy(530,470),xy(520,470),xy(519,460),xy(510,460),xy(510,469),xy(500,470),xy(500,479),xy(509,480),xy(510,490),xy(520,489)]).
midline(r3, [xy(549,430),xy(520,421),xy(478,438),xy(471,455),xy(469,471),xy(471,494),xy(477,510),xy(453,523),xy(414,525)]).
midline(r3, [xy(549,432),xy(550,439),xy(558,455),xy(560,470),xy(558,494),xy(552,509),xy(543,515),xy(519,520),xy(495,518),xy(479,510)]).
midline(r3, [xy(520,420),xy(514,387),xy(515,291),xy(523,270),xy(540,249),xy(527,235),xy(518,219),xy(512,183),xy(502,164),xy(489,150),xy(487,126),xy(479,107),xy(453,100),xy(390,99),xy(362,103),xy(339,113),xy(329,107),xy(303,100),xy(239,99),xy(165,175)]).
midline(r3, [xy(340,114),xy(339,200),xy(349,210),xy(360,228),xy(364,240),xy(366,263),xy(373,279),xy(390,299),xy(377,314),xy(368,330),xy(361,369),xy(352,385),xy(340,400)]).
fillpoint(r3, xy(164,175), 75.0).
fillpoint(r3, xy(340,112), 62.8).
fillpoint(r3, xy(481,108), 59.0).
fillpoint(r3, xy(328,107), 58.0).
fillpoint(r3, xy(351,107), 58.0).
fillpoint(r3, xy(478,107), 58.0).
fillpoint(r3, xy(482,111), 58.0).
fillpoint(r3, xy(316,103), 54.0).
fillpoint(r3, xy(363,103), 54.0).
fillpoint(r3, xy(466,103), 54.0).
fillpoint(r3, xy(486,123), 54.0).
fillpoint(r3, xy(312,102), 53.0).
fillpoint(r3, xy(367,102), 53.0).
fillpoint(r3, xy(462,102), 53.0).
fillpoint(r3, xy(487,127), 53.0).
fillpoint(r3, xy(308,101), 52.0).
fillpoint(r3, xy(372,101), 52.0).
fillpoint(r3, xy(458,101), 52.0).
fillpoint(r3, xy(488,132), 52.0).
fillpoint(r3, xy(301,100), 51.0).
fillpoint(r3, xy(378,100), 51.0).
fillpoint(r3, xy(451,100), 51.0).
fillpoint(r3, xy(489,138), 51.0).
fillpoint(r3, xy(241,100), 50.0).
fillpoint(r3, xy(391,100), 50.0).
fillpoint(r3, xy(239,100), 50.0).
fillpoint(r3, xy(339,176), 50.0).
fillpoint(r3, xy(539,250), 50.0).
fillpoint(r3, xy(389,300), 50.0).
fillpoint(r3, xy(339,400), 50.0).
fillpoint(r3, xy(548,431), 41.0).
fillpoint(r3, xy(477,511), 39.0).
fillpoint(r3, xy(478,438), 38.8).
fillpoint(r3, xy(551,511), 38.8).
fillpoint(r3, xy(521,422), 38.1).
fillpoint(r3, xy(538,427), 38.1).
fillpoint(r3, xy(524,423), 37.3).
fillpoint(r3, xy(535,426), 37.3).
fillpoint(r3, xy(528,424), 37.0).
fillpoint(r3, xy(531,425), 37.0).
fillpoint(r3, xy(507,427), 33.1).
fillpoint(r3, xy(492,432), 33.1).
fillpoint(r3, xy(504,428), 32.6).
fillpoint(r3, xy(495,431), 32.6).
fillpoint(r3, xy(501,429), 32.3).
fillpoint(r3, xy(498,430), 32.3).
fillpoint(r3, xy(471,456), 32.0).
fillpoint(r3, xy(558,456), 32.0).
fillpoint(r3, xy(471,493), 32.0).
fillpoint(r3, xy(558,493), 32.0).
fillpoint(r3, xy(496,518), 32.0).
fillpoint(r3, xy(533,518), 32.0).
fillpoint(r3, xy(470,462), 31.0).
fillpoint(r3, xy(559,462), 31.0).
fillpoint(r3, xy(470,488), 31.0).
fillpoint(r3, xy(559,488), 31.0).
fillpoint(r3, xy(502,519), 31.0).
fillpoint(r3, xy(528,519), 31.0).
fillpoint(r3, xy(469,475), 30.0).
fillpoint(r3, xy(559,475), 30.0).
fillpoint(r3, xy(511,520), 30.0).
fillpoint(r3, xy(511,181), 29.0).
fillpoint(r3, xy(518,218), 29.0).
fillpoint(r3, xy(361,231), 29.0).
fillpoint(r3, xy(368,268), 29.0).
fillpoint(r3, xy(518,281), 29.0).
fillpoint(r3, xy(368,331), 29.0).
fillpoint(r3, xy(361,368), 29.0).
fillpoint(r3, xy(458,521), 29.0).
fillpoint(r3, xy(512,184), 28.0).
fillpoint(r3, xy(517,215), 28.0).
fillpoint(r3, xy(362,234), 28.0).
fillpoint(r3, xy(367,265), 28.0).
fillpoint(r3, xy(517,284), 28.0).
fillpoint(r3, xy(367,334), 28.0).
fillpoint(r3, xy(362,365), 28.0).
fillpoint(r3, xy(455,522), 28.0).
fillpoint(r3, xy(513,187), 27.0).
fillpoint(r3, xy(516,212), 27.0).
fillpoint(r3, xy(363,237), 27.0).
fillpoint(r3, xy(366,262), 27.0).
fillpoint(r3, xy(516,287), 27.0).
fillpoint(r3, xy(366,337), 27.0).
fillpoint(r3, xy(363,362), 27.0).
fillpoint(r3, xy(452,523), 27.0).
fillpoint(r3, xy(514,192), 26.0).
fillpoint(r3, xy(515,208), 26.0).
fillpoint(r3, xy(364,242), 26.0).
fillpoint(r3, xy(365,258), 26.0).
fillpoint(r3, xy(515,292), 26.0).
fillpoint(r3, xy(365,342), 26.0).
fillpoint(r3, xy(364,358), 26.0).
fillpoint(r3, xy(515,398), 26.0).
fillpoint(r3, xy(448,524), 26.0).
fillpoint(r3, xy(514,345), 25.0).
fillpoint(r3, xy(414,525), 25.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(19,483),xy(20,19)]).
midline(r1, [xy(20,484),xy(20,500)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r16, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r16, 2200).
polygon(r16, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r16, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r16, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r16, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r16, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r16, [xy(418,635),xy(133,635),xy(126,634),xy(124,629),xy(125,605),xy(130,604),xy(549,604),xy(555,606),xy(555,632),xy(549,635),xy(419,635)]).
midline(r16, [xy(556,605),xy(583,605),xy(585,632),xy(579,635),xy(560,635),xy(555,633)]).
midline(r16, [xy(585,606),xy(590,604),xy(609,604),xy(615,606),xy(615,632),xy(613,634),xy(591,635),xy(585,633)]).
midline(r16, [xy(616,605),xy(635,605)]).
midline(r16, [xy(615,633),xy(635,635)]).
fillpoint(r16, xy(555,606), 6.4).
fillpoint(r16, xy(585,606), 6.4).
fillpoint(r16, xy(615,606), 6.4).
fillpoint(r16, xy(555,633), 6.4).
fillpoint(r16, xy(585,633), 6.4).
fillpoint(r16, xy(615,633), 6.4).
fillpoint(r16, xy(126,605), 6.0).
fillpoint(r16, xy(125,634), 6.0).
fillpoint(r16, xy(131,605), 5.0).
fillpoint(r16, xy(561,605), 5.0).
fillpoint(r16, xy(591,605), 5.0).
fillpoint(r16, xy(621,605), 5.0).
fillpoint(r16, xy(124,620), 5.0).
fillpoint(r16, xy(554,620), 5.0).
fillpoint(r16, xy(584,620), 5.0).
fillpoint(r16, xy(614,620), 5.0).
fillpoint(r16, xy(131,635), 5.0).
fillpoint(r16, xy(561,635), 5.0).
fillpoint(r16, xy(591,635), 5.0).
fillpoint(r16, xy(621,635), 5.0).
border(r16).
region(r13, '#aaaaaa', 7600, centroid(61,581)).
perimeter(r13, 720).
polygon(r13, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
hole(r13, [xy(50,609),xy(50,570),xy(89,570),xy(89,550),xy(30,550),xy(30,609),xy(50,609)]).
hole(r13, [xy(90,609),xy(89,590),xy(70,590),xy(70,610),xy(90,609)]).
midline(r13, [xy(99,553),xy(100,568),xy(96,580),xy(71,579),xy(61,581),xy(59,591),xy(60,615),xy(57,618),xy(30,620),xy(22,618),xy(19,609),xy(19,550),xy(21,541),xy(32,539),xy(95,540),xy(98,541),xy(100,552)]).
midline(r13, [xy(97,581),xy(100,590),xy(100,609),xy(97,618),xy(71,620),xy(60,617)]).
fillpoint(r13, xy(97,580), 12.8).
fillpoint(r13, xy(60,617), 12.8).
fillpoint(r13, xy(22,541), 12.0).
fillpoint(r13, xy(98,541), 12.0).
fillpoint(r13, xy(62,581), 12.0).
fillpoint(r13, xy(21,618), 12.0).
fillpoint(r13, xy(97,618), 12.0).
fillpoint(r13, xy(25,540), 11.0).
fillpoint(r13, xy(94,540), 11.0).
fillpoint(r13, xy(20,545), 11.0).
fillpoint(r13, xy(99,545), 11.0).
fillpoint(r13, xy(99,574), 11.0).
fillpoint(r13, xy(65,580), 11.0).
fillpoint(r13, xy(60,585), 11.0).
fillpoint(r13, xy(99,585), 11.0).
fillpoint(r13, xy(20,614), 11.0).
fillpoint(r13, xy(99,614), 11.0).
fillpoint(r13, xy(25,619), 11.0).
fillpoint(r13, xy(54,619), 11.0).
fillpoint(r13, xy(65,619), 11.0).
fillpoint(r13, xy(94,619), 11.0).
fillpoint(r13, xy(31,540), 10.0).
fillpoint(r13, xy(19,580), 10.0).
fillpoint(r13, xy(99,560), 10.0).
fillpoint(r13, xy(71,580), 10.0).
fillpoint(r13, xy(59,600), 10.0).
fillpoint(r13, xy(99,600), 10.0).
fillpoint(r13, xy(31,620), 10.0).
fillpoint(r13, xy(71,620), 10.0).
region(r18, '#5a5a5a', 7600, centroid(360,620)).
perimeter(r18, 800).
polygon(r18, [xy(549,630),xy(170,630),xy(170,610),xy(549,610),xy(549,630)]).
midline(r18, [xy(344,619),xy(179,620)]).
midline(r18, [xy(345,620),xy(540,620)]).
fillpoint(r18, xy(179,620), 10.0).
region(r6, '#2ecc40', 7200, centroid(164,377)).
perimeter(r6, 800).
polygon(r6, [xy(209,470),xy(120,469),xy(120,380),xy(140,379),xy(140,300),xy(190,300),xy(190,379),xy(210,380),xy(209,470)]).
hole(r6, [xy(200,459),xy(199,390),xy(130,390),xy(130,460),xy(200,459)]).
midline(r6, [xy(181,380),xy(164,365),xy(145,383),xy(125,385),xy(125,464),xy(198,465),xy(204,463),xy(204,386),xy(186,384),xy(182,381)]).
midline(r6, [xy(165,364),xy(165,324)]).
fillpoint(r6, xy(164,345), 25.0).
region(r7, '#aaaaaa', 4300, centroid(165,425)).
perimeter(r7, 440).
polygon(r7, [xy(199,460),xy(130,459),xy(130,390),xy(200,390),xy(199,460)]).
hole(r7, [xy(160,439),xy(160,420),xy(179,420),xy(179,410),xy(150,410),xy(150,439),xy(160,439)]).
hole(r7, [xy(180,439),xy(179,430),xy(170,430),xy(170,440),xy(180,439)]).
midline(r7, [xy(189,442),xy(190,431),xy(188,424),xy(165,425),xy(165,445),xy(163,449),xy(144,449),xy(140,445),xy(139,437),xy(140,404),xy(144,400),xy(177,399),xy(188,401),xy(190,410),xy(189,423)]).
midline(r7, [xy(189,443),xy(185,449),xy(165,449)]).
fillpoint(r7, xy(142,401), 12.0).
fillpoint(r7, xy(188,401), 12.0).
fillpoint(r7, xy(141,448), 12.0).
fillpoint(r7, xy(187,448), 12.0).
fillpoint(r7, xy(145,400), 11.0).
fillpoint(r7, xy(184,400), 11.0).
fillpoint(r7, xy(140,405), 11.0).
fillpoint(r7, xy(189,405), 11.0).
fillpoint(r7, xy(189,425), 11.0).
fillpoint(r7, xy(140,444), 11.0).
fillpoint(r7, xy(189,444), 11.0).
fillpoint(r7, xy(145,449), 11.0).
fillpoint(r7, xy(165,449), 11.0).
fillpoint(r7, xy(184,449), 11.0).
fillpoint(r7, xy(151,400), 10.0).
fillpoint(r7, xy(139,425), 10.0).
fillpoint(r7, xy(189,415), 10.0).
fillpoint(r7, xy(189,435), 10.0).
fillpoint(r7, xy(151,450), 10.0).
fillpoint(r7, xy(171,450), 10.0).
fillpoint(r7, xy(166,425), 6.0).
fillpoint(r7, xy(171,425), 5.0).
fillpoint(r7, xy(164,435), 5.0).
region(r14, '#870c25', 2000, centroid(52,572)).
perimeter(r14, 240).
polygon(r14, [xy(49,610),xy(30,609),xy(30,550),xy(89,550),xy(89,570),xy(50,570),xy(49,610)]).
midline(r14, [xy(39,586),xy(40,600)]).
midline(r14, [xy(40,585),xy(41,561),xy(51,559),xy(80,560)]).
fillpoint(r14, xy(42,561), 12.0).
fillpoint(r14, xy(45,560), 11.0).
fillpoint(r14, xy(40,565), 11.0).
fillpoint(r14, xy(51,560), 10.0).
fillpoint(r14, xy(39,586), 10.0).
region(r5, '#870c25', 1500, centroid(164,284)).
perimeter(r5, 160).
polygon(r5, [xy(189,300),xy(140,300),xy(140,270),xy(189,270),xy(189,300)]).
midline(r5, [xy(173,285),xy(154,285)]).
midline(r5, [xy(175,285),xy(175,284)]).
fillpoint(r5, xy(154,285), 15.0).
region(r4, '#bebebe', 1000, centroid(164,260)).
perimeter(r4, 140).
polygon(r4, [xy(189,270),xy(140,270),xy(140,250),xy(189,250),xy(189,270)]).
midline(r4, [xy(161,260),xy(149,260)]).
midline(r4, [xy(162,259),xy(180,260)]).
fillpoint(r4, xy(149,260), 10.0).
region(r17, '#2ecc40', 800, centroid(150,620)).
perimeter(r17, 120).
polygon(r17, [xy(169,630),xy(130,630),xy(130,610),xy(169,610),xy(169,630)]).
midline(r17, [xy(149,620),xy(139,620)]).
midline(r17, [xy(150,620),xy(160,620)]).
fillpoint(r17, xy(139,620), 10.0).
region(r8, '#870c25', 500, centroid(160,420)).
perimeter(r8, 120).
polygon(r8, [xy(159,440),xy(150,439),xy(150,410),xy(179,410),xy(179,420),xy(160,420),xy(159,440)]).
midline(r8, [xy(169,414),xy(155,415),xy(155,435)]).
midline(r8, [xy(170,415),xy(175,415)]).
fillpoint(r8, xy(156,415), 6.0).
fillpoint(r8, xy(161,415), 5.0).
fillpoint(r8, xy(155,428), 5.0).
region(r15, '#870c25', 400, centroid(80,600)).
perimeter(r15, 80).
polygon(r15, [xy(89,610),xy(70,609),xy(70,590),xy(90,590),xy(89,610)]).
midline(r15, [xy(79,599),xy(80,600)]).
fillpoint(r15, xy(79,600), 10.0).
region(r19, '#7fdbff', 400, centroid(570,620)).
perimeter(r19, 80).
polygon(r19, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r19, [xy(569,619),xy(570,620)]).
fillpoint(r19, xy(569,620), 10.0).
region(r20, '#7fdbff', 400, centroid(600,620)).
perimeter(r20, 80).
polygon(r20, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r20, [xy(599,619),xy(600,620)]).
fillpoint(r20, xy(599,620), 10.0).
region(r21, '#7fdbff', 400, centroid(630,620)).
perimeter(r21, 80).
polygon(r21, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r21, [xy(629,619),xy(630,620)]).
fillpoint(r21, xy(629,620), 10.0).
border(r21).
region(r9, '#870c25', 100, centroid(174,434)).
perimeter(r9, 40).
polygon(r9, [xy(179,440),xy(170,439),xy(170,430),xy(180,430),xy(179,440)]).
midline(r9, [xy(175,435),xy(175,434)]).
fillpoint(r9, xy(174,435), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 3250).
adjacent(r2, r4).
shared_edge(r2, r4, 40).
adjacent(r2, r5).
shared_edge(r2, r5, 60).
adjacent(r2, r6).
shared_edge(r2, r6, 470).
adjacent(r2, r13).
shared_edge(r2, r13, 400).
adjacent(r2, r16).
shared_edge(r2, r16, 560).
adjacent(r3, r4).
shared_edge(r3, r4, 50).
adjacent(r4, r5).
shared_edge(r4, r5, 50).
adjacent(r5, r6).
shared_edge(r5, r6, 50).
adjacent(r6, r7).
shared_edge(r6, r7, 280).
adjacent(r7, r8).
shared_edge(r7, r8, 120).
adjacent(r7, r9).
shared_edge(r7, r9, 40).
adjacent(r13, r14).
shared_edge(r13, r14, 240).
adjacent(r13, r15).
shared_edge(r13, r15, 80).
adjacent(r16, r17).
shared_edge(r16, r17, 100).
adjacent(r16, r18).
shared_edge(r16, r18, 780).
adjacent(r16, r19).
shared_edge(r16, r19, 80).
adjacent(r16, r20).
shared_edge(r16, r20, 80).
adjacent(r16, r21).
shared_edge(r16, r21, 60).
adjacent(r17, r18).
shared_edge(r17, r18, 20).

encloses(r7, r8).
encloses(r7, r9).
encloses(r13, r14).
encloses(r13, r15).
encloses(r16, r19).
encloses(r16, r20).
