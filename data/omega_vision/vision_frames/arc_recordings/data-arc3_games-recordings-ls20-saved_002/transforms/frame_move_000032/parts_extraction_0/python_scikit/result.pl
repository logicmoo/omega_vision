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
midline(r2, [xy(89,49),xy(77,64),xy(68,80),xy(64,101),xy(65,259),xy(73,279),xy(90,299),xy(90,340),xy(83,355),xy(79,380),xy(79,469),xy(82,487),xy(43,524),xy(5,525),xy(4,629),xy(5,634),xy(10,635),xy(113,634),xy(116,594),xy(174,535),xy(159,520),xy(145,510),xy(124,501),xy(96,495),xy(83,488)]).
midline(r2, [xy(91,49),xy(140,50),xy(160,33),xy(176,26),xy(190,24),xy(539,24),xy(553,26),xy(569,33),xy(590,49),xy(589,150),xy(606,170),xy(613,186),xy(615,200),xy(615,298),xy(613,313),xy(607,327),xy(598,340),xy(594,344),xy(584,345)]).
midline(r2, [xy(594,345),xy(610,368),xy(615,392),xy(615,549),xy(613,563),xy(609,571),xy(588,575),xy(381,574),xy(368,570),xy(354,562),xy(313,524),xy(291,525),xy(265,522),xy(245,530),xy(225,534),xy(175,535)]).
midline(r2, [xy(265,521),xy(250,461),xy(249,368),xy(241,341),xy(237,337),xy(230,343),xy(238,340)]).
midline(r2, [xy(315,524),xy(349,491),xy(362,482),xy(376,476),xy(399,474),xy(410,470),xy(414,459),xy(414,401),xy(417,383),xy(419,379),xy(426,376),xy(459,371),xy(463,363),xy(465,349),xy(465,258),xy(463,236),xy(459,228),xy(430,224),xy(418,219),xy(414,197),xy(415,174)]).
midline(r2, [xy(240,338),xy(238,336)]).
midline(r2, [xy(241,335),xy(248,308),xy(265,298),xy(265,174)]).
midline(r2, [xy(265,300),xy(290,300)]).
midline(r2, [xy(92,341),xy(93,340)]).
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
region(r3, '#2ecc40', 137200, centroid(364,257)).
perimeter(r3, 4320).
polygon(r3, [xy(589,550),xy(540,550),xy(539,500),xy(490,500),xy(489,550),xy(390,549),xy(390,500),xy(440,499),xy(440,400),xy(490,399),xy(490,200),xy(440,199),xy(439,150),xy(390,150),xy(390,249),xy(440,250),xy(440,349),xy(390,350),xy(390,449),xy(290,449),xy(290,350),xy(340,349),xy(340,250),xy(290,249),xy(290,150),xy(240,150),xy(240,249),xy(190,250),xy(190,379),xy(210,380),xy(210,469),xy(120,470),xy(120,380),xy(140,379),xy(140,250),xy(90,249),xy(90,100),xy(189,100),xy(190,50),xy(539,50),xy(540,199),xy(590,200),xy(590,299),xy(540,300),xy(540,389),xy(590,390),xy(589,550)]).
hole(r3, [xy(200,459),xy(199,390),xy(130,390),xy(130,460),xy(200,459)]).
hole(r3, [xy(520,489),xy(520,480),xy(529,480),xy(530,470),xy(520,470),xy(519,460),xy(510,460),xy(510,469),xy(500,470),xy(500,479),xy(509,480),xy(510,490),xy(520,489)]).
midline(r3, [xy(549,430),xy(520,421),xy(478,438),xy(471,455),xy(470,477),xy(465,490),xy(461,519),xy(448,524),xy(414,525)]).
midline(r3, [xy(471,477),xy(487,486),xy(500,489),xy(504,493),xy(511,495),xy(523,494),xy(529,489),xy(535,489),xy(556,477),xy(556,479)]).
midline(r3, [xy(549,432),xy(550,439),xy(558,455),xy(560,470),xy(558,477)]).
midline(r3, [xy(520,420),xy(514,389),xy(515,291),xy(523,270),xy(540,249),xy(527,235),xy(519,221),xy(515,209),xy(513,186),xy(506,170),xy(489,150),xy(488,130),xy(481,109),xy(453,100),xy(376,100),xy(350,107),xy(340,113),xy(326,106),xy(303,100),xy(239,99),xy(164,174),xy(165,363),xy(145,383),xy(125,385),xy(124,390),xy(125,464),xy(195,465),xy(204,463),xy(204,386),xy(184,383),xy(165,365)]).
midline(r3, [xy(339,114),xy(339,200),xy(356,220),xy(363,236),xy(365,259),xy(369,271),xy(377,285),xy(390,299),xy(377,314),xy(368,330),xy(361,369),xy(352,385),xy(340,400)]).
midline(r3, [xy(560,477),xy(564,490),xy(565,525)]).
fillpoint(r3, xy(164,177), 75.0).
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
fillpoint(r3, xy(478,438), 38.8).
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
fillpoint(r3, xy(470,462), 31.0).
fillpoint(r3, xy(559,462), 31.0).
fillpoint(r3, xy(470,474), 30.0).
fillpoint(r3, xy(560,474), 30.0).
fillpoint(r3, xy(460,520), 29.7).
fillpoint(r3, xy(511,181), 29.0).
fillpoint(r3, xy(518,218), 29.0).
fillpoint(r3, xy(361,231), 29.0).
fillpoint(r3, xy(368,268), 29.0).
fillpoint(r3, xy(518,281), 29.0).
fillpoint(r3, xy(368,331), 29.0).
fillpoint(r3, xy(361,368), 29.0).
fillpoint(r3, xy(468,481), 29.0).
fillpoint(r3, xy(561,481), 29.0).
fillpoint(r3, xy(461,518), 29.0).
fillpoint(r3, xy(458,521), 29.0).
fillpoint(r3, xy(512,184), 28.0).
fillpoint(r3, xy(517,215), 28.0).
fillpoint(r3, xy(362,234), 28.0).
fillpoint(r3, xy(367,265), 28.0).
fillpoint(r3, xy(517,284), 28.0).
fillpoint(r3, xy(367,334), 28.0).
fillpoint(r3, xy(362,365), 28.0).
fillpoint(r3, xy(467,484), 28.0).
fillpoint(r3, xy(562,484), 28.0).
fillpoint(r3, xy(462,515), 28.0).
fillpoint(r3, xy(455,522), 28.0).
fillpoint(r3, xy(513,187), 27.0).
fillpoint(r3, xy(516,212), 27.0).
fillpoint(r3, xy(363,237), 27.0).
fillpoint(r3, xy(366,262), 27.0).
fillpoint(r3, xy(516,287), 27.0).
fillpoint(r3, xy(366,337), 27.0).
fillpoint(r3, xy(363,362), 27.0).
fillpoint(r3, xy(466,487), 27.0).
fillpoint(r3, xy(563,487), 27.0).
fillpoint(r3, xy(463,512), 27.0).
fillpoint(r3, xy(452,523), 27.0).
fillpoint(r3, xy(514,192), 26.0).
fillpoint(r3, xy(515,208), 26.0).
fillpoint(r3, xy(364,242), 26.0).
fillpoint(r3, xy(365,258), 26.0).
fillpoint(r3, xy(515,292), 26.0).
fillpoint(r3, xy(365,342), 26.0).
fillpoint(r3, xy(364,358), 26.0).
fillpoint(r3, xy(515,398), 26.0).
fillpoint(r3, xy(465,492), 26.0).
fillpoint(r3, xy(564,492), 26.0).
fillpoint(r3, xy(464,508), 26.0).
fillpoint(r3, xy(448,524), 26.0).
fillpoint(r3, xy(165,308), 25.0).
fillpoint(r3, xy(514,345), 25.0).
fillpoint(r3, xy(565,513), 25.0).
fillpoint(r3, xy(414,525), 25.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(19,364),xy(20,19)]).
midline(r1, [xy(20,365),xy(20,500)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r15, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r15, 2200).
polygon(r15, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r15, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r15, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r15, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r15, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r15, [xy(524,635),xy(130,635),xy(126,634),xy(124,629),xy(125,605),xy(549,604),xy(554,607),xy(560,604),xy(579,604),xy(583,605),xy(585,609),xy(585,631),xy(583,634),xy(560,635),xy(554,632),xy(548,635),xy(525,634)]).
midline(r15, [xy(585,606),xy(590,604),xy(609,604),xy(615,606),xy(615,630),xy(613,634),xy(591,635),xy(585,633)]).
midline(r15, [xy(616,605),xy(635,605)]).
midline(r15, [xy(555,631),xy(555,608)]).
midline(r15, [xy(615,633),xy(635,635)]).
fillpoint(r15, xy(555,606), 6.4).
fillpoint(r15, xy(585,606), 6.4).
fillpoint(r15, xy(615,606), 6.4).
fillpoint(r15, xy(555,633), 6.4).
fillpoint(r15, xy(585,633), 6.4).
fillpoint(r15, xy(615,633), 6.4).
fillpoint(r15, xy(126,605), 6.0).
fillpoint(r15, xy(125,634), 6.0).
fillpoint(r15, xy(131,605), 5.0).
fillpoint(r15, xy(561,605), 5.0).
fillpoint(r15, xy(591,605), 5.0).
fillpoint(r15, xy(621,605), 5.0).
fillpoint(r15, xy(124,620), 5.0).
fillpoint(r15, xy(554,620), 5.0).
fillpoint(r15, xy(584,620), 5.0).
fillpoint(r15, xy(614,620), 5.0).
fillpoint(r15, xy(131,635), 5.0).
fillpoint(r15, xy(561,635), 5.0).
fillpoint(r15, xy(591,635), 5.0).
fillpoint(r15, xy(621,635), 5.0).
border(r15).
region(r12, '#aaaaaa', 7600, centroid(58,581)).
perimeter(r12, 720).
polygon(r12, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
hole(r12, [xy(90,609),xy(89,550),xy(30,550),xy(30,570),xy(70,570),xy(70,610),xy(90,609)]).
hole(r12, [xy(50,609),xy(49,590),xy(30,590),xy(30,610),xy(50,609)]).
midline(r12, [xy(99,562),xy(99,544),xy(95,540),xy(30,539),xy(21,541),xy(19,550),xy(20,575),xy(23,579),xy(19,590),xy(21,618),xy(30,620),xy(55,619),xy(60,616),xy(60,590),xy(58,582),xy(49,579),xy(24,579)]).
midline(r12, [xy(100,563),xy(100,609),xy(98,617),xy(89,620),xy(71,620),xy(61,617)]).
fillpoint(r12, xy(22,580), 12.8).
fillpoint(r12, xy(60,617), 12.8).
fillpoint(r12, xy(22,541), 12.0).
fillpoint(r12, xy(98,541), 12.0).
fillpoint(r12, xy(58,581), 12.0).
fillpoint(r12, xy(21,618), 12.0).
fillpoint(r12, xy(97,618), 12.0).
fillpoint(r12, xy(25,540), 11.0).
fillpoint(r12, xy(94,540), 11.0).
fillpoint(r12, xy(20,545), 11.0).
fillpoint(r12, xy(99,545), 11.0).
fillpoint(r12, xy(20,574), 11.0).
fillpoint(r12, xy(54,580), 11.0).
fillpoint(r12, xy(20,585), 11.0).
fillpoint(r12, xy(59,585), 11.0).
fillpoint(r12, xy(20,614), 11.0).
fillpoint(r12, xy(99,614), 11.0).
fillpoint(r12, xy(25,619), 11.0).
fillpoint(r12, xy(54,619), 11.0).
fillpoint(r12, xy(65,619), 11.0).
fillpoint(r12, xy(94,619), 11.0).
fillpoint(r12, xy(31,540), 10.0).
fillpoint(r12, xy(19,560), 10.0).
fillpoint(r12, xy(99,580), 10.0).
fillpoint(r12, xy(31,580), 10.0).
fillpoint(r12, xy(19,600), 10.0).
fillpoint(r12, xy(59,600), 10.0).
fillpoint(r12, xy(31,620), 10.0).
fillpoint(r12, xy(71,620), 10.0).
region(r17, '#5a5a5a', 7600, centroid(360,620)).
perimeter(r17, 800).
polygon(r17, [xy(549,630),xy(170,630),xy(170,610),xy(549,610),xy(549,630)]).
midline(r17, [xy(385,620),xy(179,620)]).
midline(r17, [xy(386,619),xy(540,620)]).
fillpoint(r17, xy(179,620), 10.0).
region(r4, '#aaaaaa', 4300, centroid(165,425)).
perimeter(r4, 440).
polygon(r4, [xy(199,460),xy(130,459),xy(130,390),xy(200,390),xy(199,460)]).
hole(r4, [xy(160,439),xy(160,420),xy(179,420),xy(179,410),xy(150,410),xy(150,439),xy(160,439)]).
hole(r4, [xy(180,439),xy(179,430),xy(170,430),xy(170,440),xy(180,439)]).
midline(r4, [xy(189,442),xy(190,431),xy(188,424),xy(165,425),xy(165,446),xy(163,449),xy(144,449),xy(140,445),xy(139,438),xy(139,410),xy(141,401),xy(144,400),xy(179,399),xy(188,401),xy(190,410),xy(189,423)]).
midline(r4, [xy(189,443),xy(185,449),xy(165,449)]).
fillpoint(r4, xy(142,401), 12.0).
fillpoint(r4, xy(188,401), 12.0).
fillpoint(r4, xy(141,448), 12.0).
fillpoint(r4, xy(187,448), 12.0).
fillpoint(r4, xy(145,400), 11.0).
fillpoint(r4, xy(184,400), 11.0).
fillpoint(r4, xy(140,405), 11.0).
fillpoint(r4, xy(189,405), 11.0).
fillpoint(r4, xy(189,425), 11.0).
fillpoint(r4, xy(140,444), 11.0).
fillpoint(r4, xy(189,444), 11.0).
fillpoint(r4, xy(145,449), 11.0).
fillpoint(r4, xy(165,449), 11.0).
fillpoint(r4, xy(184,449), 11.0).
fillpoint(r4, xy(151,400), 10.0).
fillpoint(r4, xy(139,425), 10.0).
fillpoint(r4, xy(189,415), 10.0).
fillpoint(r4, xy(189,435), 10.0).
fillpoint(r4, xy(151,450), 10.0).
fillpoint(r4, xy(171,450), 10.0).
fillpoint(r4, xy(166,425), 6.0).
fillpoint(r4, xy(171,425), 5.0).
fillpoint(r4, xy(164,435), 5.0).
region(r13, '#870c25', 2000, centroid(68,572)).
perimeter(r13, 240).
polygon(r13, [xy(89,610),xy(70,609),xy(69,570),xy(30,569),xy(30,550),xy(90,550),xy(89,610)]).
midline(r13, [xy(52,559),xy(39,560)]).
midline(r13, [xy(53,560),xy(68,559),xy(78,561),xy(80,600)]).
fillpoint(r13, xy(78,561), 12.0).
fillpoint(r13, xy(74,560), 11.0).
fillpoint(r13, xy(79,565), 11.0).
fillpoint(r13, xy(39,560), 10.0).
fillpoint(r13, xy(79,586), 10.0).
region(r11, '#870c25', 1500, centroid(514,534)).
perimeter(r11, 160).
polygon(r11, [xy(539,550),xy(490,550),xy(490,520),xy(539,520),xy(539,550)]).
midline(r11, [xy(524,535),xy(504,535)]).
midline(r11, [xy(525,535),xy(525,534)]).
fillpoint(r11, xy(504,535), 15.0).
region(r10, '#bebebe', 1000, centroid(514,510)).
perimeter(r10, 140).
polygon(r10, [xy(539,520),xy(490,520),xy(490,500),xy(539,500),xy(539,520)]).
midline(r10, [xy(520,510),xy(499,510)]).
midline(r10, [xy(521,509),xy(530,510)]).
fillpoint(r10, xy(499,510), 10.0).
region(r16, '#2ecc40', 800, centroid(150,620)).
perimeter(r16, 120).
polygon(r16, [xy(169,630),xy(130,630),xy(130,610),xy(169,610),xy(169,630)]).
midline(r16, [xy(160,620),xy(139,620)]).
fillpoint(r16, xy(139,620), 10.0).
region(r5, '#870c25', 500, centroid(160,420)).
perimeter(r5, 120).
polygon(r5, [xy(159,440),xy(150,439),xy(150,410),xy(179,410),xy(179,420),xy(160,420),xy(159,440)]).
midline(r5, [xy(169,414),xy(155,415),xy(155,435)]).
midline(r5, [xy(170,415),xy(175,415)]).
fillpoint(r5, xy(156,415), 6.0).
fillpoint(r5, xy(161,415), 5.0).
fillpoint(r5, xy(155,428), 5.0).
region(r14, '#870c25', 400, centroid(40,600)).
perimeter(r14, 80).
polygon(r14, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r14, [xy(39,599),xy(40,600)]).
fillpoint(r14, xy(39,600), 10.0).
region(r18, '#7fdbff', 400, centroid(570,620)).
perimeter(r18, 80).
polygon(r18, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r18, [xy(569,619),xy(570,620)]).
fillpoint(r18, xy(569,620), 10.0).
region(r19, '#7fdbff', 400, centroid(600,620)).
perimeter(r19, 80).
polygon(r19, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r19, [xy(599,619),xy(600,620)]).
fillpoint(r19, xy(599,620), 10.0).
region(r20, '#7fdbff', 400, centroid(630,620)).
perimeter(r20, 80).
polygon(r20, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r20, [xy(629,619),xy(630,620)]).
fillpoint(r20, xy(629,620), 10.0).
border(r20).
region(r6, '#870c25', 100, centroid(174,434)).
perimeter(r6, 40).
polygon(r6, [xy(179,440),xy(170,439),xy(170,430),xy(180,430),xy(179,440)]).
midline(r6, [xy(175,435),xy(175,434)]).
fillpoint(r6, xy(174,435), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 3770).
adjacent(r2, r11).
shared_edge(r2, r11, 50).
adjacent(r2, r12).
shared_edge(r2, r12, 400).
adjacent(r2, r15).
shared_edge(r2, r15, 560).
adjacent(r3, r4).
shared_edge(r3, r4, 280).
adjacent(r3, r10).
shared_edge(r3, r10, 90).
adjacent(r3, r11).
shared_edge(r3, r11, 60).
adjacent(r4, r5).
shared_edge(r4, r5, 120).
adjacent(r4, r6).
shared_edge(r4, r6, 40).
adjacent(r10, r11).
shared_edge(r10, r11, 50).
adjacent(r12, r13).
shared_edge(r12, r13, 240).
adjacent(r12, r14).
shared_edge(r12, r14, 80).
adjacent(r15, r16).
shared_edge(r15, r16, 100).
adjacent(r15, r17).
shared_edge(r15, r17, 780).
adjacent(r15, r18).
shared_edge(r15, r18, 80).
adjacent(r15, r19).
shared_edge(r15, r19, 80).
adjacent(r15, r20).
shared_edge(r15, r20, 60).
adjacent(r16, r17).
shared_edge(r16, r17, 20).

encloses(r4, r5).
encloses(r4, r6).
encloses(r12, r13).
encloses(r12, r14).
encloses(r15, r18).
encloses(r15, r19).
