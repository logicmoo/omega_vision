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
midline(r2, [xy(590,49),xy(575,37),xy(559,28),xy(539,24),xy(190,24),xy(176,26),xy(162,32),xy(140,50),xy(89,49)]).
midline(r2, [xy(589,51),xy(589,150),xy(604,167),xy(614,190),xy(615,298),xy(613,313),xy(606,329),xy(593,345),xy(584,345)]).
midline(r2, [xy(594,345),xy(602,354),xy(611,370),xy(615,391),xy(615,548),xy(611,569),xy(603,573),xy(586,575),xy(380,574),xy(370,571),xy(350,559),xy(314,524),xy(292,525),xy(265,522),xy(245,530),xy(225,534),xy(179,535),xy(174,534),xy(154,516),xy(133,504),xy(105,498),xy(84,489),xy(81,486),xy(79,468),xy(79,382),xy(83,355),xy(90,339),xy(90,299),xy(75,282),xy(65,259),xy(64,100),xy(66,86),xy(73,70),xy(89,51)]).
midline(r2, [xy(265,521),xy(250,461),xy(249,368),xy(241,342),xy(237,340),xy(233,343),xy(231,342),xy(231,344)]).
midline(r2, [xy(315,524),xy(350,490),xy(362,482),xy(376,476),xy(399,474),xy(410,470)]).
midline(r2, [xy(411,468),xy(415,447),xy(414,400),xy(418,380),xy(426,376),xy(449,374),xy(460,370),xy(463,363),xy(465,346),xy(465,254),xy(463,236),xy(459,228),xy(449,225),xy(430,224),xy(418,218),xy(414,197),xy(415,174)]).
midline(r2, [xy(174,535),xy(116,594),xy(114,600),xy(115,626),xy(113,634),xy(6,634),xy(4,628),xy(5,525),xy(43,524),xy(81,488)]).
midline(r2, [xy(240,339),xy(248,308),xy(265,299),xy(265,174)]).
midline(r2, [xy(266,300),xy(290,300)]).
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
region(r3, '#2ecc40', 136300, centroid(366,259)).
perimeter(r3, 4540).
polygon(r3, [xy(589,550),xy(390,549),xy(390,500),xy(440,499),xy(440,400),xy(489,400),xy(490,450),xy(540,449),xy(540,400),xy(490,399),xy(490,200),xy(440,199),xy(439,150),xy(390,150),xy(390,249),xy(440,250),xy(440,349),xy(390,350),xy(390,449),xy(290,449),xy(290,350),xy(340,349),xy(340,250),xy(290,249),xy(290,150),xy(240,150),xy(240,249),xy(190,250),xy(190,379),xy(210,380),xy(210,469),xy(120,470),xy(120,380),xy(140,379),xy(140,250),xy(90,249),xy(90,100),xy(189,100),xy(190,50),xy(539,50),xy(540,199),xy(590,200),xy(590,299),xy(540,300),xy(540,389),xy(590,390),xy(589,550)]).
hole(r3, [xy(200,459),xy(199,390),xy(130,390),xy(130,460),xy(200,459)]).
hole(r3, [xy(180,189),xy(179,160),xy(150,160),xy(150,190),xy(180,189)]).
hole(r3, [xy(520,489),xy(520,480),xy(529,480),xy(530,470),xy(520,470),xy(519,460),xy(510,460),xy(510,469),xy(500,470),xy(500,479),xy(509,480),xy(510,490),xy(520,489)]).
midline(r3, [xy(186,130),xy(155,129),xy(135,131),xy(126,134),xy(121,145),xy(119,188),xy(124,213),xy(135,218),xy(154,221),xy(164,226),xy(175,221),xy(203,215),xy(208,204),xy(210,160),xy(206,134),xy(187,130)]).
midline(r3, [xy(206,133),xy(239,99),xy(303,100),xy(329,107),xy(339,113),xy(339,200),xy(357,222),xy(363,236),xy(365,259),xy(369,271),xy(377,285),xy(390,299),xy(377,314),xy(369,328),xy(360,371),xy(340,400)]).
midline(r3, [xy(340,112),xy(362,103),xy(390,99),xy(453,100),xy(481,108),xy(489,136),xy(489,150),xy(507,172),xy(513,186),xy(518,219),xy(527,235),xy(540,249),xy(523,270),xy(516,286),xy(514,300),xy(515,374),xy(465,424),xy(464,424),xy(465,459),xy(470,472),xy(471,494),xy(477,510),xy(467,517),xy(449,524),xy(414,525)]).
midline(r3, [xy(515,375),xy(530,390),xy(545,396),xy(565,414)]).
midline(r3, [xy(565,416),xy(565,449),xy(563,463),xy(559,472),xy(542,463),xy(529,460),xy(525,456),xy(517,454),xy(506,455),xy(500,460),xy(494,460),xy(471,471)]).
midline(r3, [xy(165,227),xy(164,365),xy(145,383),xy(125,385),xy(124,390),xy(125,464),xy(203,464),xy(205,458),xy(204,386),xy(184,383),xy(165,365)]).
midline(r3, [xy(560,473),xy(559,489),xy(555,503),xy(552,509),xy(543,515),xy(529,519),xy(510,520),xy(495,518),xy(479,510)]).
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
fillpoint(r3, xy(477,511), 39.0).
fillpoint(r3, xy(551,511), 38.8).
fillpoint(r3, xy(206,133), 38.0).
fillpoint(r3, xy(125,135), 35.4).
fillpoint(r3, xy(125,214), 35.4).
fillpoint(r3, xy(204,214), 35.4).
fillpoint(r3, xy(165,225), 35.4).
fillpoint(r3, xy(136,131), 32.0).
fillpoint(r3, xy(121,146), 32.0).
fillpoint(r3, xy(121,203), 32.0).
fillpoint(r3, xy(208,203), 32.0).
fillpoint(r3, xy(136,218), 32.0).
fillpoint(r3, xy(193,218), 32.0).
fillpoint(r3, xy(153,221), 32.0).
fillpoint(r3, xy(176,221), 32.0).
fillpoint(r3, xy(471,493), 32.0).
fillpoint(r3, xy(558,493), 32.0).
fillpoint(r3, xy(496,518), 32.0).
fillpoint(r3, xy(533,518), 32.0).
fillpoint(r3, xy(141,219), 31.1).
fillpoint(r3, xy(188,219), 31.1).
fillpoint(r3, xy(148,220), 31.1).
fillpoint(r3, xy(181,220), 31.1).
fillpoint(r3, xy(142,130), 31.0).
fillpoint(r3, xy(188,130), 31.0).
fillpoint(r3, xy(120,152), 31.0).
fillpoint(r3, xy(209,152), 31.0).
fillpoint(r3, xy(120,198), 31.0).
fillpoint(r3, xy(209,198), 31.0).
fillpoint(r3, xy(470,488), 31.0).
fillpoint(r3, xy(559,488), 31.0).
fillpoint(r3, xy(502,519), 31.0).
fillpoint(r3, xy(528,519), 31.0).
fillpoint(r3, xy(151,130), 30.0).
fillpoint(r3, xy(119,175), 30.0).
fillpoint(r3, xy(209,175), 30.0).
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
fillpoint(r3, xy(468,468), 29.0).
fillpoint(r3, xy(561,468), 29.0).
fillpoint(r3, xy(458,521), 29.0).
fillpoint(r3, xy(512,184), 28.0).
fillpoint(r3, xy(517,215), 28.0).
fillpoint(r3, xy(362,234), 28.0).
fillpoint(r3, xy(367,265), 28.0).
fillpoint(r3, xy(517,284), 28.0).
fillpoint(r3, xy(367,334), 28.0).
fillpoint(r3, xy(362,365), 28.0).
fillpoint(r3, xy(467,465), 28.0).
fillpoint(r3, xy(562,465), 28.0).
fillpoint(r3, xy(455,522), 28.0).
fillpoint(r3, xy(513,187), 27.0).
fillpoint(r3, xy(516,212), 27.0).
fillpoint(r3, xy(363,237), 27.0).
fillpoint(r3, xy(366,262), 27.0).
fillpoint(r3, xy(516,287), 27.0).
fillpoint(r3, xy(366,337), 27.0).
fillpoint(r3, xy(363,362), 27.0).
fillpoint(r3, xy(466,462), 27.0).
fillpoint(r3, xy(563,462), 27.0).
fillpoint(r3, xy(452,523), 27.0).
fillpoint(r3, xy(514,192), 26.0).
fillpoint(r3, xy(515,208), 26.0).
fillpoint(r3, xy(364,242), 26.0).
fillpoint(r3, xy(365,258), 26.0).
fillpoint(r3, xy(515,292), 26.0).
fillpoint(r3, xy(365,342), 26.0).
fillpoint(r3, xy(364,358), 26.0).
fillpoint(r3, xy(465,458), 26.0).
fillpoint(r3, xy(564,458), 26.0).
fillpoint(r3, xy(448,524), 26.0).
fillpoint(r3, xy(165,308), 25.0).
fillpoint(r3, xy(515,338), 25.0).
fillpoint(r3, xy(565,431), 25.0).
fillpoint(r3, xy(465,436), 25.0).
fillpoint(r3, xy(414,525), 25.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(19,364),xy(20,19)]).
midline(r1, [xy(20,365),xy(20,500)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r17, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r17, 2200).
polygon(r17, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r17, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r17, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r17, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r17, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r17, [xy(524,635),xy(131,635),xy(126,634),xy(124,629),xy(125,605),xy(130,604),xy(549,604),xy(553,605),xy(555,610),xy(555,632),xy(549,635),xy(525,635)]).
midline(r17, [xy(555,606),xy(560,604),xy(579,604),xy(584,607),xy(590,604),xy(615,606),xy(615,631),xy(613,634),xy(590,635),xy(584,632),xy(577,635),xy(560,635),xy(555,633)]).
midline(r17, [xy(616,605),xy(635,605)]).
midline(r17, [xy(585,631),xy(585,608)]).
midline(r17, [xy(615,633),xy(635,635)]).
fillpoint(r17, xy(555,606), 6.4).
fillpoint(r17, xy(585,606), 6.4).
fillpoint(r17, xy(615,606), 6.4).
fillpoint(r17, xy(555,633), 6.4).
fillpoint(r17, xy(585,633), 6.4).
fillpoint(r17, xy(615,633), 6.4).
fillpoint(r17, xy(126,605), 6.0).
fillpoint(r17, xy(125,634), 6.0).
fillpoint(r17, xy(131,605), 5.0).
fillpoint(r17, xy(561,605), 5.0).
fillpoint(r17, xy(591,605), 5.0).
fillpoint(r17, xy(621,605), 5.0).
fillpoint(r17, xy(124,620), 5.0).
fillpoint(r17, xy(554,620), 5.0).
fillpoint(r17, xy(584,620), 5.0).
fillpoint(r17, xy(614,620), 5.0).
fillpoint(r17, xy(131,635), 5.0).
fillpoint(r17, xy(561,635), 5.0).
fillpoint(r17, xy(591,635), 5.0).
fillpoint(r17, xy(621,635), 5.0).
border(r17).
region(r14, '#aaaaaa', 7600, centroid(61,581)).
perimeter(r14, 720).
polygon(r14, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
hole(r14, [xy(50,609),xy(50,570),xy(89,570),xy(89,550),xy(30,550),xy(30,609),xy(50,609)]).
hole(r14, [xy(90,609),xy(89,590),xy(70,590),xy(70,610),xy(90,609)]).
midline(r14, [xy(84,580),xy(70,579),xy(61,581),xy(59,617),xy(49,620),xy(22,618),xy(19,609),xy(19,550),xy(21,541),xy(31,539),xy(87,539),xy(98,541),xy(100,550),xy(99,575),xy(96,580),xy(85,580)]).
midline(r14, [xy(97,581),xy(100,591),xy(98,617),xy(88,620),xy(70,620),xy(61,617)]).
fillpoint(r14, xy(97,580), 12.8).
fillpoint(r14, xy(60,617), 12.8).
fillpoint(r14, xy(22,541), 12.0).
fillpoint(r14, xy(98,541), 12.0).
fillpoint(r14, xy(62,581), 12.0).
fillpoint(r14, xy(21,618), 12.0).
fillpoint(r14, xy(97,618), 12.0).
fillpoint(r14, xy(25,540), 11.0).
fillpoint(r14, xy(94,540), 11.0).
fillpoint(r14, xy(20,545), 11.0).
fillpoint(r14, xy(99,545), 11.0).
fillpoint(r14, xy(99,574), 11.0).
fillpoint(r14, xy(65,580), 11.0).
fillpoint(r14, xy(60,585), 11.0).
fillpoint(r14, xy(99,585), 11.0).
fillpoint(r14, xy(20,614), 11.0).
fillpoint(r14, xy(99,614), 11.0).
fillpoint(r14, xy(25,619), 11.0).
fillpoint(r14, xy(54,619), 11.0).
fillpoint(r14, xy(65,619), 11.0).
fillpoint(r14, xy(94,619), 11.0).
fillpoint(r14, xy(31,540), 10.0).
fillpoint(r14, xy(19,580), 10.0).
fillpoint(r14, xy(99,560), 10.0).
fillpoint(r14, xy(71,580), 10.0).
fillpoint(r14, xy(59,600), 10.0).
fillpoint(r14, xy(99,600), 10.0).
fillpoint(r14, xy(31,620), 10.0).
fillpoint(r14, xy(71,620), 10.0).
region(r19, '#5a5a5a', 6000, centroid(400,620)).
perimeter(r19, 640).
polygon(r19, [xy(549,630),xy(250,630),xy(250,610),xy(549,610),xy(549,630)]).
midline(r19, [xy(424,619),xy(259,620)]).
midline(r19, [xy(425,620),xy(540,620)]).
fillpoint(r19, xy(259,620), 10.0).
region(r6, '#aaaaaa', 4300, centroid(165,425)).
perimeter(r6, 440).
polygon(r6, [xy(199,460),xy(130,459),xy(130,390),xy(200,390),xy(199,460)]).
hole(r6, [xy(160,439),xy(160,420),xy(179,420),xy(179,410),xy(150,410),xy(150,439),xy(160,439)]).
hole(r6, [xy(180,439),xy(179,430),xy(170,430),xy(170,440),xy(180,439)]).
midline(r6, [xy(189,442),xy(190,430),xy(186,424),xy(165,425),xy(165,447),xy(163,449),xy(144,449),xy(140,445),xy(139,438),xy(140,404),xy(144,400),xy(179,399),xy(188,401),xy(190,411),xy(189,424)]).
midline(r6, [xy(189,443),xy(185,449),xy(165,449)]).
fillpoint(r6, xy(142,401), 12.0).
fillpoint(r6, xy(188,401), 12.0).
fillpoint(r6, xy(141,448), 12.0).
fillpoint(r6, xy(187,448), 12.0).
fillpoint(r6, xy(145,400), 11.0).
fillpoint(r6, xy(184,400), 11.0).
fillpoint(r6, xy(140,405), 11.0).
fillpoint(r6, xy(189,405), 11.0).
fillpoint(r6, xy(189,425), 11.0).
fillpoint(r6, xy(140,444), 11.0).
fillpoint(r6, xy(189,444), 11.0).
fillpoint(r6, xy(145,449), 11.0).
fillpoint(r6, xy(165,449), 11.0).
fillpoint(r6, xy(184,449), 11.0).
fillpoint(r6, xy(151,400), 10.0).
fillpoint(r6, xy(139,425), 10.0).
fillpoint(r6, xy(189,415), 10.0).
fillpoint(r6, xy(189,435), 10.0).
fillpoint(r6, xy(151,450), 10.0).
fillpoint(r6, xy(171,450), 10.0).
fillpoint(r6, xy(166,425), 6.0).
fillpoint(r6, xy(171,425), 5.0).
fillpoint(r6, xy(164,435), 5.0).
region(r18, '#2ecc40', 2400, centroid(190,620)).
perimeter(r18, 280).
polygon(r18, [xy(249,630),xy(130,630),xy(130,610),xy(249,610),xy(249,630)]).
midline(r18, [xy(152,619),xy(139,620)]).
midline(r18, [xy(153,619),xy(240,620)]).
fillpoint(r18, xy(139,620), 10.0).
region(r15, '#870c25', 2000, centroid(52,572)).
perimeter(r15, 240).
polygon(r15, [xy(49,610),xy(30,609),xy(30,550),xy(89,550),xy(89,570),xy(50,570),xy(49,610)]).
midline(r15, [xy(39,586),xy(41,561),xy(50,559),xy(80,560)]).
midline(r15, [xy(40,587),xy(40,600)]).
fillpoint(r15, xy(42,561), 12.0).
fillpoint(r15, xy(45,560), 11.0).
fillpoint(r15, xy(40,565), 11.0).
fillpoint(r15, xy(51,560), 10.0).
fillpoint(r15, xy(39,586), 10.0).
region(r9, '#870c25', 1500, centroid(514,434)).
perimeter(r9, 160).
polygon(r9, [xy(539,450),xy(490,450),xy(490,420),xy(539,420),xy(539,450)]).
midline(r9, [xy(516,434),xy(504,435)]).
midline(r9, [xy(517,434),xy(525,435)]).
fillpoint(r9, xy(504,435), 15.0).
region(r7, '#bebebe', 1000, centroid(514,410)).
perimeter(r7, 140).
polygon(r7, [xy(539,420),xy(490,420),xy(490,400),xy(539,400),xy(539,420)]).
midline(r7, [xy(511,410),xy(499,410)]).
midline(r7, [xy(512,409),xy(530,410)]).
fillpoint(r7, xy(499,410), 10.0).
region(r4, '#5a5a5a', 800, centroid(164,174)).
perimeter(r4, 160).
polygon(r4, [xy(179,190),xy(150,189),xy(150,160),xy(180,160),xy(179,190)]).
hole(r4, [xy(170,179),xy(169,170),xy(160,170),xy(160,180),xy(170,179)]).
midline(r4, [xy(169,164),xy(155,165),xy(155,184),xy(169,185),xy(174,183),xy(175,170),xy(174,166),xy(170,165)]).
fillpoint(r4, xy(156,165), 6.0).
fillpoint(r4, xy(174,165), 6.0).
fillpoint(r4, xy(155,184), 6.0).
fillpoint(r4, xy(173,184), 6.0).
fillpoint(r4, xy(161,165), 5.0).
fillpoint(r4, xy(154,175), 5.0).
fillpoint(r4, xy(174,175), 5.0).
fillpoint(r4, xy(161,185), 5.0).
region(r8, '#870c25', 500, centroid(160,420)).
perimeter(r8, 120).
polygon(r8, [xy(159,440),xy(150,439),xy(150,410),xy(179,410),xy(179,420),xy(160,420),xy(159,440)]).
midline(r8, [xy(169,414),xy(155,415),xy(155,435)]).
midline(r8, [xy(170,414),xy(175,415)]).
fillpoint(r8, xy(156,415), 6.0).
fillpoint(r8, xy(161,415), 5.0).
fillpoint(r8, xy(155,428), 5.0).
region(r16, '#870c25', 400, centroid(80,600)).
perimeter(r16, 80).
polygon(r16, [xy(89,610),xy(70,609),xy(70,590),xy(90,590),xy(89,610)]).
midline(r16, [xy(79,599),xy(80,600)]).
fillpoint(r16, xy(79,600), 10.0).
region(r20, '#7fdbff', 400, centroid(570,620)).
perimeter(r20, 80).
polygon(r20, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r20, [xy(569,619),xy(570,620)]).
fillpoint(r20, xy(569,620), 10.0).
region(r21, '#7fdbff', 400, centroid(600,620)).
perimeter(r21, 80).
polygon(r21, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r21, [xy(599,619),xy(600,620)]).
fillpoint(r21, xy(599,620), 10.0).
region(r22, '#7fdbff', 400, centroid(630,620)).
perimeter(r22, 80).
polygon(r22, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r22, [xy(629,619),xy(630,620)]).
fillpoint(r22, xy(629,620), 10.0).
border(r22).
region(r5, '#2ecc40', 100, centroid(164,174)).
perimeter(r5, 40).
polygon(r5, [xy(169,180),xy(160,179),xy(160,170),xy(170,170),xy(169,180)]).
midline(r5, [xy(165,175),xy(165,174)]).
fillpoint(r5, xy(164,175), 5.0).
region(r10, '#870c25', 100, centroid(174,434)).
perimeter(r10, 40).
polygon(r10, [xy(179,440),xy(170,439),xy(170,430),xy(180,430),xy(179,440)]).
midline(r10, [xy(175,435),xy(175,434)]).
fillpoint(r10, xy(174,435), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 3820).
adjacent(r2, r14).
shared_edge(r2, r14, 400).
adjacent(r2, r17).
shared_edge(r2, r17, 560).
adjacent(r3, r4).
shared_edge(r3, r4, 120).
adjacent(r3, r6).
shared_edge(r3, r6, 280).
adjacent(r3, r7).
shared_edge(r3, r7, 90).
adjacent(r3, r9).
shared_edge(r3, r9, 110).
adjacent(r4, r5).
shared_edge(r4, r5, 40).
adjacent(r6, r8).
shared_edge(r6, r8, 120).
adjacent(r6, r10).
shared_edge(r6, r10, 40).
adjacent(r7, r9).
shared_edge(r7, r9, 50).
adjacent(r14, r15).
shared_edge(r14, r15, 240).
adjacent(r14, r16).
shared_edge(r14, r16, 80).
adjacent(r17, r18).
shared_edge(r17, r18, 260).
adjacent(r17, r19).
shared_edge(r17, r19, 620).
adjacent(r17, r20).
shared_edge(r17, r20, 80).
adjacent(r17, r21).
shared_edge(r17, r21, 80).
adjacent(r17, r22).
shared_edge(r17, r22, 60).
adjacent(r18, r19).
shared_edge(r18, r19, 20).

encloses(r4, r5).
encloses(r6, r8).
encloses(r6, r10).
encloses(r14, r15).
encloses(r14, r16).
encloses(r17, r20).
encloses(r17, r21).
