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
midline(r2, [xy(590,49),xy(575,37),xy(559,28),xy(537,24),xy(190,24),xy(176,26),xy(160,33),xy(140,50),xy(89,49)]).
midline(r2, [xy(589,51),xy(589,150),xy(604,167),xy(614,191),xy(615,298),xy(613,313),xy(604,332),xy(594,344),xy(584,345)]).
midline(r2, [xy(594,345),xy(602,354),xy(611,370),xy(615,391),xy(615,547),xy(612,566),xy(609,571),xy(603,573),xy(587,575),xy(381,574),xy(368,570),xy(354,562),xy(314,524),xy(290,525),xy(265,522),xy(245,530),xy(225,534),xy(175,535),xy(145,510),xy(133,504),xy(105,498),xy(84,489),xy(81,486),xy(79,466),xy(79,383),xy(81,363),xy(90,339),xy(90,299),xy(75,282),xy(65,259),xy(64,100),xy(66,86),xy(72,72),xy(89,51)]).
midline(r2, [xy(265,521),xy(250,461),xy(249,368),xy(241,342),xy(238,339),xy(233,341),xy(233,343)]).
midline(r2, [xy(315,524),xy(349,491),xy(362,482),xy(376,476),xy(399,474),xy(410,470)]).
midline(r2, [xy(411,468),xy(415,449),xy(414,400),xy(417,383),xy(419,379),xy(426,376),xy(448,374),xy(460,370)]).
midline(r2, [xy(461,368),xy(465,348),xy(465,251),xy(463,236),xy(461,230),xy(456,227),xy(426,223),xy(418,219),xy(414,199),xy(415,174)]).
midline(r2, [xy(174,535),xy(116,594),xy(113,634),xy(6,634),xy(4,628),xy(5,525),xy(43,524),xy(81,488)]).
midline(r2, [xy(240,339),xy(248,308),xy(265,299),xy(265,174)]).
midline(r2, [xy(266,299),xy(290,300)]).
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
region(r3, '#2ecc40', 135400, centroid(371,262)).
perimeter(r3, 4560).
polygon(r3, [xy(589,550),xy(390,549),xy(390,500),xy(440,499),xy(440,400),xy(490,399),xy(490,200),xy(440,199),xy(439,150),xy(390,150),xy(390,249),xy(440,250),xy(440,349),xy(390,350),xy(390,449),xy(290,449),xy(290,350),xy(340,349),xy(340,250),xy(290,249),xy(289,150),xy(190,150),xy(190,199),xy(240,200),xy(240,249),xy(190,250),xy(190,379),xy(210,380),xy(210,469),xy(120,470),xy(120,380),xy(140,379),xy(140,250),xy(90,249),xy(90,100),xy(189,100),xy(190,50),xy(539,50),xy(540,199),xy(590,200),xy(590,299),xy(540,300),xy(540,389),xy(590,390),xy(589,550)]).
hole(r3, [xy(200,459),xy(199,390),xy(130,390),xy(130,460),xy(200,459)]).
hole(r3, [xy(180,189),xy(179,160),xy(150,160),xy(150,190),xy(180,189)]).
hole(r3, [xy(520,489),xy(520,480),xy(529,480),xy(530,470),xy(520,470),xy(519,460),xy(510,460),xy(510,469),xy(500,470),xy(500,479),xy(509,480),xy(510,490),xy(520,489)]).
hole(r3, [xy(430,539),xy(429,510),xy(400,510),xy(400,540),xy(430,539)]).
midline(r3, [xy(549,430),xy(520,421),xy(478,438),xy(471,455),xy(469,470),xy(470,489),xy(476,511),xy(459,521),xy(451,519),xy(433,505),xy(395,505),xy(395,544),xy(433,544),xy(455,524),xy(452,520)]).
midline(r3, [xy(477,511),xy(479,510),xy(495,518),xy(510,520),xy(534,518),xy(551,511)]).
midline(r3, [xy(520,420),xy(514,387),xy(515,291),xy(522,272),xy(540,249),xy(527,235),xy(518,219),xy(511,180),xy(502,164),xy(489,150),xy(487,126),xy(482,110),xy(479,107),xy(453,100),xy(391,99),xy(362,103),xy(339,113),xy(329,107),xy(303,100),xy(239,99),xy(225,112),xy(203,123),xy(181,125),xy(166,130),xy(140,130),xy(126,134),xy(121,145),xy(119,160),xy(120,199),xy(124,213),xy(135,218),xy(162,224),xy(170,214),xy(171,209),xy(183,195),xy(185,189),xy(184,156),xy(172,142),xy(167,131)]).
midline(r3, [xy(168,218),xy(164,224),xy(165,361),xy(164,365),xy(145,383),xy(125,385),xy(124,458),xy(125,464),xy(131,465),xy(198,465),xy(203,464),xy(205,458),xy(204,386),xy(184,383),xy(165,365)]).
midline(r3, [xy(166,225),xy(215,225)]).
midline(r3, [xy(340,114),xy(339,200),xy(356,220),xy(363,236),xy(365,259),xy(369,271),xy(377,285),xy(390,299),xy(377,314),xy(369,328),xy(365,340),xy(364,359),xy(361,369),xy(352,385),xy(340,400)]).
midline(r3, [xy(457,522),xy(456,523)]).
midline(r3, [xy(552,509),xy(558,494),xy(560,470),xy(558,455),xy(550,439),xy(549,432)]).
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
fillpoint(r3, xy(239,100), 50.0).
fillpoint(r3, xy(391,100), 50.0).
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
fillpoint(r3, xy(125,135), 35.4).
fillpoint(r3, xy(125,214), 35.4).
fillpoint(r3, xy(165,225), 35.4).
fillpoint(r3, xy(507,427), 33.1).
fillpoint(r3, xy(492,432), 33.1).
fillpoint(r3, xy(504,428), 32.6).
fillpoint(r3, xy(495,431), 32.6).
fillpoint(r3, xy(501,429), 32.3).
fillpoint(r3, xy(498,430), 32.3).
fillpoint(r3, xy(136,131), 32.0).
fillpoint(r3, xy(121,146), 32.0).
fillpoint(r3, xy(121,203), 32.0).
fillpoint(r3, xy(136,218), 32.0).
fillpoint(r3, xy(153,221), 32.0).
fillpoint(r3, xy(471,456), 32.0).
fillpoint(r3, xy(558,456), 32.0).
fillpoint(r3, xy(471,493), 32.0).
fillpoint(r3, xy(558,493), 32.0).
fillpoint(r3, xy(496,518), 32.0).
fillpoint(r3, xy(533,518), 32.0).
fillpoint(r3, xy(141,219), 31.1).
fillpoint(r3, xy(148,220), 31.1).
fillpoint(r3, xy(142,130), 31.0).
fillpoint(r3, xy(120,152), 31.0).
fillpoint(r3, xy(120,198), 31.0).
fillpoint(r3, xy(470,462), 31.0).
fillpoint(r3, xy(559,462), 31.0).
fillpoint(r3, xy(470,488), 31.0).
fillpoint(r3, xy(559,488), 31.0).
fillpoint(r3, xy(502,519), 31.0).
fillpoint(r3, xy(528,519), 31.0).
fillpoint(r3, xy(168,129), 30.0).
fillpoint(r3, xy(119,175), 30.0).
fillpoint(r3, xy(469,475), 30.0).
fillpoint(r3, xy(559,475), 30.0).
fillpoint(r3, xy(511,520), 30.0).
fillpoint(r3, xy(208,121), 29.0).
fillpoint(r3, xy(171,128), 29.0).
fillpoint(r3, xy(511,181), 29.0).
fillpoint(r3, xy(518,218), 29.0).
fillpoint(r3, xy(361,231), 29.0).
fillpoint(r3, xy(368,268), 29.0).
fillpoint(r3, xy(518,281), 29.0).
fillpoint(r3, xy(368,331), 29.0).
fillpoint(r3, xy(361,368), 29.0).
fillpoint(r3, xy(458,521), 29.0).
fillpoint(r3, xy(205,122), 28.0).
fillpoint(r3, xy(174,127), 28.0).
fillpoint(r3, xy(512,184), 28.0).
fillpoint(r3, xy(517,215), 28.0).
fillpoint(r3, xy(362,234), 28.0).
fillpoint(r3, xy(367,265), 28.0).
fillpoint(r3, xy(517,284), 28.0).
fillpoint(r3, xy(367,334), 28.0).
fillpoint(r3, xy(362,365), 28.0).
fillpoint(r3, xy(202,123), 27.0).
fillpoint(r3, xy(177,126), 27.0).
fillpoint(r3, xy(513,187), 27.0).
fillpoint(r3, xy(516,212), 27.0).
fillpoint(r3, xy(363,237), 27.0).
fillpoint(r3, xy(366,262), 27.0).
fillpoint(r3, xy(516,287), 27.0).
fillpoint(r3, xy(366,337), 27.0).
fillpoint(r3, xy(363,362), 27.0).
fillpoint(r3, xy(198,124), 26.0).
fillpoint(r3, xy(182,125), 26.0).
fillpoint(r3, xy(514,192), 26.0).
fillpoint(r3, xy(515,208), 26.0).
fillpoint(r3, xy(364,242), 26.0).
fillpoint(r3, xy(365,258), 26.0).
fillpoint(r3, xy(515,292), 26.0).
fillpoint(r3, xy(365,342), 26.0).
fillpoint(r3, xy(364,358), 26.0).
fillpoint(r3, xy(515,398), 26.0).
fillpoint(r3, xy(191,225), 25.0).
fillpoint(r3, xy(165,308), 25.0).
fillpoint(r3, xy(514,345), 25.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(19,373),xy(20,19)]).
midline(r1, [xy(20,374),xy(20,500)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r19, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r19, 2200).
polygon(r19, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r19, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r19, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r19, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r19, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r19, [xy(418,635),xy(130,635),xy(126,634),xy(124,629),xy(124,610),xy(125,605),xy(131,604),xy(548,604),xy(553,605),xy(555,609),xy(555,632),xy(553,634),xy(419,635)]).
midline(r19, [xy(555,606),xy(560,604),xy(579,604),xy(585,606),xy(585,632),xy(583,634),xy(561,635),xy(555,633)]).
midline(r19, [xy(586,605),xy(609,604),xy(614,607),xy(620,604),xy(635,605)]).
midline(r19, [xy(615,608),xy(615,630),xy(613,634),xy(594,635),xy(585,633)]).
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
region(r16, '#aaaaaa', 7600, centroid(58,581)).
perimeter(r16, 720).
polygon(r16, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
hole(r16, [xy(90,609),xy(89,550),xy(30,550),xy(30,570),xy(70,570),xy(70,610),xy(90,609)]).
hole(r16, [xy(50,609),xy(49,590),xy(30,590),xy(30,610),xy(50,609)]).
midline(r16, [xy(19,563),xy(20,544),xy(24,540),xy(95,540),xy(98,541),xy(100,550),xy(100,609),xy(99,615),xy(95,619),xy(70,620),xy(59,616),xy(48,620),xy(22,618),xy(19,608),xy(19,591),xy(23,579),xy(20,575),xy(19,564)]).
midline(r16, [xy(60,615),xy(60,590),xy(58,582),xy(49,579),xy(24,579)]).
fillpoint(r16, xy(22,580), 12.8).
fillpoint(r16, xy(60,617), 12.8).
fillpoint(r16, xy(22,541), 12.0).
fillpoint(r16, xy(98,541), 12.0).
fillpoint(r16, xy(58,581), 12.0).
fillpoint(r16, xy(21,618), 12.0).
fillpoint(r16, xy(97,618), 12.0).
fillpoint(r16, xy(25,540), 11.0).
fillpoint(r16, xy(94,540), 11.0).
fillpoint(r16, xy(20,545), 11.0).
fillpoint(r16, xy(99,545), 11.0).
fillpoint(r16, xy(20,574), 11.0).
fillpoint(r16, xy(54,580), 11.0).
fillpoint(r16, xy(20,585), 11.0).
fillpoint(r16, xy(59,585), 11.0).
fillpoint(r16, xy(20,614), 11.0).
fillpoint(r16, xy(99,614), 11.0).
fillpoint(r16, xy(25,619), 11.0).
fillpoint(r16, xy(54,619), 11.0).
fillpoint(r16, xy(65,619), 11.0).
fillpoint(r16, xy(94,619), 11.0).
fillpoint(r16, xy(31,540), 10.0).
fillpoint(r16, xy(19,560), 10.0).
fillpoint(r16, xy(99,580), 10.0).
fillpoint(r16, xy(31,580), 10.0).
fillpoint(r16, xy(19,600), 10.0).
fillpoint(r16, xy(59,600), 10.0).
fillpoint(r16, xy(31,620), 10.0).
fillpoint(r16, xy(71,620), 10.0).
region(r20, '#2ecc40', 4400, centroid(240,620)).
perimeter(r20, 480).
polygon(r20, [xy(349,630),xy(130,630),xy(130,610),xy(349,610),xy(349,630)]).
midline(r20, [xy(290,620),xy(139,620)]).
midline(r20, [xy(291,620),xy(340,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r8, '#aaaaaa', 4300, centroid(165,425)).
perimeter(r8, 440).
polygon(r8, [xy(199,460),xy(130,459),xy(130,390),xy(200,390),xy(199,460)]).
hole(r8, [xy(160,439),xy(160,420),xy(179,420),xy(179,410),xy(150,410),xy(150,439),xy(160,439)]).
hole(r8, [xy(180,439),xy(179,430),xy(170,430),xy(170,440),xy(180,439)]).
midline(r8, [xy(189,442),xy(190,430),xy(186,424),xy(165,425),xy(165,446),xy(163,449),xy(142,448),xy(139,436),xy(139,410),xy(141,401),xy(144,400),xy(178,399),xy(188,401),xy(190,410),xy(189,424)]).
midline(r8, [xy(189,443),xy(185,449),xy(165,449)]).
fillpoint(r8, xy(142,401), 12.0).
fillpoint(r8, xy(188,401), 12.0).
fillpoint(r8, xy(141,448), 12.0).
fillpoint(r8, xy(187,448), 12.0).
fillpoint(r8, xy(145,400), 11.0).
fillpoint(r8, xy(184,400), 11.0).
fillpoint(r8, xy(140,405), 11.0).
fillpoint(r8, xy(189,405), 11.0).
fillpoint(r8, xy(189,425), 11.0).
fillpoint(r8, xy(140,444), 11.0).
fillpoint(r8, xy(189,444), 11.0).
fillpoint(r8, xy(145,449), 11.0).
fillpoint(r8, xy(165,449), 11.0).
fillpoint(r8, xy(184,449), 11.0).
fillpoint(r8, xy(151,400), 10.0).
fillpoint(r8, xy(139,425), 10.0).
fillpoint(r8, xy(189,415), 10.0).
fillpoint(r8, xy(189,435), 10.0).
fillpoint(r8, xy(151,450), 10.0).
fillpoint(r8, xy(171,450), 10.0).
fillpoint(r8, xy(166,425), 6.0).
fillpoint(r8, xy(171,425), 5.0).
fillpoint(r8, xy(164,435), 5.0).
region(r21, '#5a5a5a', 4000, centroid(450,620)).
perimeter(r21, 440).
polygon(r21, [xy(549,630),xy(350,630),xy(350,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(510,620),xy(359,620)]).
midline(r21, [xy(511,620),xy(540,620)]).
fillpoint(r21, xy(359,620), 10.0).
region(r17, '#870c25', 2000, centroid(68,572)).
perimeter(r17, 240).
polygon(r17, [xy(89,610),xy(70,609),xy(69,570),xy(30,569),xy(30,550),xy(90,550),xy(89,610)]).
midline(r17, [xy(80,596),xy(80,572),xy(77,561),xy(69,559),xy(39,560)]).
midline(r17, [xy(79,597),xy(80,600)]).
fillpoint(r17, xy(78,561), 12.0).
fillpoint(r17, xy(74,560), 11.0).
fillpoint(r17, xy(79,565), 11.0).
fillpoint(r17, xy(39,560), 10.0).
fillpoint(r17, xy(79,586), 10.0).
region(r7, '#870c25', 1500, centroid(214,184)).
perimeter(r7, 160).
polygon(r7, [xy(239,200),xy(190,200),xy(190,170),xy(239,170),xy(239,200)]).
midline(r7, [xy(216,184),xy(204,185)]).
midline(r7, [xy(217,185),xy(225,185)]).
fillpoint(r7, xy(204,185), 15.0).
region(r4, '#bebebe', 1000, centroid(214,160)).
perimeter(r4, 140).
polygon(r4, [xy(239,170),xy(190,170),xy(190,150),xy(239,150),xy(239,170)]).
midline(r4, [xy(220,160),xy(199,160)]).
midline(r4, [xy(221,160),xy(230,160)]).
fillpoint(r4, xy(199,160), 10.0).
region(r5, '#5a5a5a', 800, centroid(164,174)).
perimeter(r5, 160).
polygon(r5, [xy(179,190),xy(150,189),xy(150,160),xy(180,160),xy(179,190)]).
hole(r5, [xy(170,179),xy(169,170),xy(160,170),xy(160,180),xy(170,179)]).
midline(r5, [xy(169,164),xy(155,165),xy(155,184),xy(169,185),xy(174,183),xy(175,170),xy(174,166),xy(170,165)]).
fillpoint(r5, xy(156,165), 6.0).
fillpoint(r5, xy(174,165), 6.0).
fillpoint(r5, xy(155,184), 6.0).
fillpoint(r5, xy(173,184), 6.0).
fillpoint(r5, xy(161,165), 5.0).
fillpoint(r5, xy(154,175), 5.0).
fillpoint(r5, xy(174,175), 5.0).
fillpoint(r5, xy(161,185), 5.0).
region(r14, '#5a5a5a', 800, centroid(414,524)).
perimeter(r14, 160).
polygon(r14, [xy(429,540),xy(400,539),xy(400,510),xy(430,510),xy(429,540)]).
hole(r14, [xy(420,529),xy(419,520),xy(410,520),xy(410,530),xy(420,529)]).
midline(r14, [xy(405,527),xy(405,534),xy(411,535),xy(423,534),xy(425,528),xy(424,516),xy(417,514),xy(405,515),xy(405,526)]).
fillpoint(r14, xy(406,515), 6.0).
fillpoint(r14, xy(424,515), 6.0).
fillpoint(r14, xy(405,534), 6.0).
fillpoint(r14, xy(423,534), 6.0).
fillpoint(r14, xy(411,515), 5.0).
fillpoint(r14, xy(404,525), 5.0).
fillpoint(r14, xy(424,525), 5.0).
fillpoint(r14, xy(411,535), 5.0).
region(r9, '#870c25', 500, centroid(160,420)).
perimeter(r9, 120).
polygon(r9, [xy(159,440),xy(150,439),xy(150,410),xy(179,410),xy(179,420),xy(160,420),xy(159,440)]).
midline(r9, [xy(155,427),xy(155,415),xy(175,415)]).
midline(r9, [xy(155,428),xy(155,435)]).
fillpoint(r9, xy(156,415), 6.0).
fillpoint(r9, xy(161,415), 5.0).
fillpoint(r9, xy(155,428), 5.0).
region(r18, '#870c25', 400, centroid(40,600)).
perimeter(r18, 80).
polygon(r18, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r18, [xy(39,599),xy(40,600)]).
fillpoint(r18, xy(39,600), 10.0).
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
region(r6, '#2ecc40', 100, centroid(164,174)).
perimeter(r6, 40).
polygon(r6, [xy(169,180),xy(160,179),xy(160,170),xy(170,170),xy(169,180)]).
midline(r6, [xy(165,175),xy(165,174)]).
fillpoint(r6, xy(164,175), 5.0).
region(r10, '#870c25', 100, centroid(174,434)).
perimeter(r10, 40).
polygon(r10, [xy(179,440),xy(170,439),xy(170,430),xy(180,430),xy(179,440)]).
midline(r10, [xy(175,435),xy(175,434)]).
fillpoint(r10, xy(174,435), 5.0).
region(r15, '#2ecc40', 100, centroid(414,524)).
perimeter(r15, 40).
polygon(r15, [xy(419,530),xy(410,529),xy(410,520),xy(420,520),xy(419,530)]).
midline(r15, [xy(415,525),xy(415,524)]).
fillpoint(r15, xy(414,525), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 3770).
adjacent(r2, r4).
shared_edge(r2, r4, 20).
adjacent(r2, r7).
shared_edge(r2, r7, 30).
adjacent(r2, r16).
shared_edge(r2, r16, 400).
adjacent(r2, r19).
shared_edge(r2, r19, 560).
adjacent(r3, r4).
shared_edge(r3, r4, 70).
adjacent(r3, r5).
shared_edge(r3, r5, 120).
adjacent(r3, r7).
shared_edge(r3, r7, 80).
adjacent(r3, r8).
shared_edge(r3, r8, 280).
adjacent(r3, r14).
shared_edge(r3, r14, 120).
adjacent(r4, r7).
shared_edge(r4, r7, 50).
adjacent(r5, r6).
shared_edge(r5, r6, 40).
adjacent(r8, r9).
shared_edge(r8, r9, 120).
adjacent(r8, r10).
shared_edge(r8, r10, 40).
adjacent(r14, r15).
shared_edge(r14, r15, 40).
adjacent(r16, r17).
shared_edge(r16, r17, 240).
adjacent(r16, r18).
shared_edge(r16, r18, 80).
adjacent(r19, r20).
shared_edge(r19, r20, 460).
adjacent(r19, r21).
shared_edge(r19, r21, 420).
adjacent(r19, r22).
shared_edge(r19, r22, 80).
adjacent(r19, r23).
shared_edge(r19, r23, 80).
adjacent(r19, r24).
shared_edge(r19, r24, 60).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r5, r6).
encloses(r8, r9).
encloses(r8, r10).
encloses(r14, r15).
encloses(r16, r17).
encloses(r16, r18).
encloses(r19, r22).
encloses(r19, r23).
