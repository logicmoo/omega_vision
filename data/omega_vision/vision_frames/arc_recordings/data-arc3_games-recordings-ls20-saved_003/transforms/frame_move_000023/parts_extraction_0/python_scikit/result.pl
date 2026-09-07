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
midline(r2, [xy(590,49),xy(575,37),xy(559,28),xy(538,24),xy(192,24),xy(168,29),xy(154,37),xy(140,50),xy(89,49),xy(77,64),xy(68,80),xy(64,102),xy(65,258),xy(75,282),xy(90,299),xy(90,339),xy(83,355),xy(79,382),xy(79,467),xy(82,487),xy(43,524),xy(5,525),xy(5,634),xy(113,634),xy(115,625),xy(114,600),xy(116,594),xy(174,535),xy(159,520),xy(145,510),xy(124,501),xy(96,495),xy(83,488)]).
midline(r2, [xy(175,535),xy(225,534),xy(245,530),xy(265,522),xy(250,461),xy(249,368),xy(239,339),xy(248,308),xy(265,299),xy(265,174)]).
midline(r2, [xy(266,300),xy(290,300)]).
midline(r2, [xy(589,51),xy(589,150),xy(604,167),xy(614,191),xy(615,296),xy(613,313),xy(606,329),xy(593,345),xy(584,345)]).
midline(r2, [xy(594,345),xy(610,368),xy(615,390),xy(615,543),xy(614,558),xy(610,570),xy(588,575),xy(381,574),xy(370,571),xy(354,562),xy(313,524),xy(266,523)]).
midline(r2, [xy(315,524),xy(350,490),xy(362,482),xy(376,476),xy(398,474),xy(410,470),xy(415,449),xy(414,401),xy(418,380),xy(430,375),xy(459,371),xy(463,363),xy(465,346),xy(465,250),xy(463,236),xy(456,227),xy(426,223),xy(418,219),xy(414,199),xy(415,174)]).
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
region(r3, '#2ecc40', 136800, centroid(366,259)).
perimeter(r3, 4420).
polygon(r3, [xy(589,550),xy(390,549),xy(390,500),xy(440,499),xy(440,400),xy(490,399),xy(490,200),xy(440,199),xy(439,150),xy(390,150),xy(390,249),xy(440,250),xy(440,349),xy(390,350),xy(390,449),xy(290,449),xy(290,350),xy(340,349),xy(340,250),xy(290,249),xy(290,150),xy(240,150),xy(240,249),xy(190,250),xy(190,379),xy(210,380),xy(210,469),xy(120,470),xy(120,380),xy(140,379),xy(140,250),xy(90,249),xy(90,100),xy(189,100),xy(190,50),xy(539,50),xy(540,199),xy(590,200),xy(590,299),xy(540,300),xy(540,389),xy(590,390),xy(589,550)]).
hole(r3, [xy(200,459),xy(199,390),xy(130,390),xy(130,460),xy(200,459)]).
hole(r3, [xy(540,499),xy(539,450),xy(490,450),xy(490,500),xy(540,499)]).
hole(r3, [xy(180,189),xy(179,160),xy(150,160),xy(150,190),xy(180,189)]).
midline(r3, [xy(180,465),xy(132,465),xy(126,464),xy(124,459),xy(125,385),xy(145,383),xy(165,363),xy(165,231),xy(163,224),xy(135,218),xy(124,213),xy(119,187),xy(120,150),xy(124,136),xy(140,130),xy(179,129),xy(206,133),xy(209,150),xy(210,189),xy(205,213),xy(194,218),xy(175,221),xy(165,225)]).
midline(r3, [xy(207,132),xy(239,99),xy(303,100),xy(326,106),xy(339,113),xy(339,200),xy(356,220),xy(363,236),xy(368,269),xy(377,285),xy(390,299),xy(377,314),xy(369,328),xy(360,371),xy(340,400)]).
midline(r3, [xy(340,112),xy(362,103),xy(390,99),xy(453,100),xy(481,108),xy(489,136),xy(489,150),xy(507,172),xy(513,186),xy(518,219),xy(527,235),xy(540,249),xy(522,272),xy(515,291),xy(514,389),xy(519,415),xy(503,423),xy(481,425),xy(468,430),xy(464,450),xy(465,517),xy(448,524),xy(414,525)]).
midline(r3, [xy(520,416),xy(557,422),xy(562,433),xy(565,452),xy(565,499),xy(560,520),xy(538,525),xy(490,525),xy(476,523),xy(465,518)]).
midline(r3, [xy(181,464),xy(197,465),xy(204,463),xy(205,390),xy(203,385),xy(184,383),xy(165,365)]).
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
fillpoint(r3, xy(206,133), 38.0).
fillpoint(r3, xy(125,135), 35.4).
fillpoint(r3, xy(125,214), 35.4).
fillpoint(r3, xy(204,214), 35.4).
fillpoint(r3, xy(165,225), 35.4).
fillpoint(r3, xy(519,416), 34.0).
fillpoint(r3, xy(557,422), 33.0).
fillpoint(r3, xy(136,131), 32.0).
fillpoint(r3, xy(121,146), 32.0).
fillpoint(r3, xy(121,203), 32.0).
fillpoint(r3, xy(208,203), 32.0).
fillpoint(r3, xy(136,218), 32.0).
fillpoint(r3, xy(193,218), 32.0).
fillpoint(r3, xy(153,221), 32.0).
fillpoint(r3, xy(176,221), 32.0).
fillpoint(r3, xy(526,418), 32.0).
fillpoint(r3, xy(553,421), 32.0).
fillpoint(r3, xy(465,518), 31.4).
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
fillpoint(r3, xy(532,419), 31.0).
fillpoint(r3, xy(548,420), 31.0).
fillpoint(r3, xy(151,130), 30.0).
fillpoint(r3, xy(119,175), 30.0).
fillpoint(r3, xy(209,175), 30.0).
fillpoint(r3, xy(469,429), 29.7).
fillpoint(r3, xy(560,520), 29.7).
fillpoint(r3, xy(511,181), 29.0).
fillpoint(r3, xy(518,218), 29.0).
fillpoint(r3, xy(361,231), 29.0).
fillpoint(r3, xy(368,268), 29.0).
fillpoint(r3, xy(518,281), 29.0).
fillpoint(r3, xy(368,331), 29.0).
fillpoint(r3, xy(361,368), 29.0).
fillpoint(r3, xy(508,421), 29.0).
fillpoint(r3, xy(471,428), 29.0).
fillpoint(r3, xy(468,431), 29.0).
fillpoint(r3, xy(561,431), 29.0).
fillpoint(r3, xy(561,518), 29.0).
fillpoint(r3, xy(458,521), 29.0).
fillpoint(r3, xy(471,521), 29.0).
fillpoint(r3, xy(558,521), 29.0).
fillpoint(r3, xy(512,184), 28.0).
fillpoint(r3, xy(517,215), 28.0).
fillpoint(r3, xy(362,234), 28.0).
fillpoint(r3, xy(367,265), 28.0).
fillpoint(r3, xy(517,284), 28.0).
fillpoint(r3, xy(367,334), 28.0).
fillpoint(r3, xy(362,365), 28.0).
fillpoint(r3, xy(505,422), 28.0).
fillpoint(r3, xy(474,427), 28.0).
fillpoint(r3, xy(467,434), 28.0).
fillpoint(r3, xy(562,434), 28.0).
fillpoint(r3, xy(562,515), 28.0).
fillpoint(r3, xy(455,522), 28.0).
fillpoint(r3, xy(474,522), 28.0).
fillpoint(r3, xy(555,522), 28.0).
fillpoint(r3, xy(513,187), 27.0).
fillpoint(r3, xy(516,212), 27.0).
fillpoint(r3, xy(363,237), 27.0).
fillpoint(r3, xy(366,262), 27.0).
fillpoint(r3, xy(516,287), 27.0).
fillpoint(r3, xy(366,337), 27.0).
fillpoint(r3, xy(363,362), 27.0).
fillpoint(r3, xy(502,423), 27.0).
fillpoint(r3, xy(477,426), 27.0).
fillpoint(r3, xy(466,437), 27.0).
fillpoint(r3, xy(563,437), 27.0).
fillpoint(r3, xy(563,512), 27.0).
fillpoint(r3, xy(452,523), 27.0).
fillpoint(r3, xy(477,523), 27.0).
fillpoint(r3, xy(552,523), 27.0).
fillpoint(r3, xy(514,192), 26.0).
fillpoint(r3, xy(515,208), 26.0).
fillpoint(r3, xy(364,242), 26.0).
fillpoint(r3, xy(365,258), 26.0).
fillpoint(r3, xy(515,292), 26.0).
fillpoint(r3, xy(365,342), 26.0).
fillpoint(r3, xy(364,358), 26.0).
fillpoint(r3, xy(515,398), 26.0).
fillpoint(r3, xy(498,424), 26.0).
fillpoint(r3, xy(482,425), 26.0).
fillpoint(r3, xy(465,442), 26.0).
fillpoint(r3, xy(564,442), 26.0).
fillpoint(r3, xy(564,508), 26.0).
fillpoint(r3, xy(448,524), 26.0).
fillpoint(r3, xy(482,524), 26.0).
fillpoint(r3, xy(548,524), 26.0).
fillpoint(r3, xy(165,308), 25.0).
fillpoint(r3, xy(514,345), 25.0).
fillpoint(r3, xy(464,475), 25.0).
fillpoint(r3, xy(564,475), 25.0).
fillpoint(r3, xy(414,525), 25.0).
fillpoint(r3, xy(491,525), 25.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(19,483),xy(20,19)]).
midline(r1, [xy(20,484),xy(20,500)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r14, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r14, 2200).
polygon(r14, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r14, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r14, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r14, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r14, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r14, [xy(377,634),xy(132,635),xy(126,634),xy(124,629),xy(125,605),xy(130,604),xy(549,604),xy(554,607),xy(561,604),xy(579,604),xy(585,606),xy(585,632),xy(578,635),xy(555,633),xy(549,635),xy(378,634)]).
midline(r14, [xy(586,605),xy(613,605),xy(615,610),xy(615,631),xy(609,635),xy(585,633)]).
midline(r14, [xy(555,608),xy(555,632)]).
midline(r14, [xy(615,606),xy(621,604),xy(635,605)]).
midline(r14, [xy(615,633),xy(635,635)]).
fillpoint(r14, xy(555,606), 6.4).
fillpoint(r14, xy(585,606), 6.4).
fillpoint(r14, xy(615,606), 6.4).
fillpoint(r14, xy(555,633), 6.4).
fillpoint(r14, xy(585,633), 6.4).
fillpoint(r14, xy(615,633), 6.4).
fillpoint(r14, xy(126,605), 6.0).
fillpoint(r14, xy(125,634), 6.0).
fillpoint(r14, xy(131,605), 5.0).
fillpoint(r14, xy(561,605), 5.0).
fillpoint(r14, xy(591,605), 5.0).
fillpoint(r14, xy(621,605), 5.0).
fillpoint(r14, xy(124,620), 5.0).
fillpoint(r14, xy(554,620), 5.0).
fillpoint(r14, xy(584,620), 5.0).
fillpoint(r14, xy(614,620), 5.0).
fillpoint(r14, xy(131,635), 5.0).
fillpoint(r14, xy(561,635), 5.0).
fillpoint(r14, xy(591,635), 5.0).
fillpoint(r14, xy(621,635), 5.0).
border(r14).
region(r11, '#aaaaaa', 7600, centroid(61,578)).
perimeter(r11, 720).
polygon(r11, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
hole(r11, [xy(90,609),xy(89,590),xy(50,589),xy(49,550),xy(30,550),xy(30,610),xy(90,609)]).
hole(r11, [xy(90,569),xy(89,550),xy(70,550),xy(70,570),xy(90,569)]).
midline(r11, [xy(19,563),xy(21,541),xy(33,539),xy(55,540),xy(60,543),xy(59,569),xy(61,578),xy(96,580),xy(100,569),xy(98,542),xy(87,539),xy(72,539),xy(61,542)]).
midline(r11, [xy(19,564),xy(19,609),xy(21,618),xy(24,619),xy(87,620),xy(97,618),xy(100,608),xy(100,590),xy(97,581)]).
fillpoint(r11, xy(60,542), 12.8).
fillpoint(r11, xy(97,580), 12.8).
fillpoint(r11, xy(22,541), 12.0).
fillpoint(r11, xy(98,541), 12.0).
fillpoint(r11, xy(61,578), 12.0).
fillpoint(r11, xy(21,618), 12.0).
fillpoint(r11, xy(97,618), 12.0).
fillpoint(r11, xy(25,540), 11.0).
fillpoint(r11, xy(54,540), 11.0).
fillpoint(r11, xy(65,540), 11.0).
fillpoint(r11, xy(94,540), 11.0).
fillpoint(r11, xy(20,545), 11.0).
fillpoint(r11, xy(99,545), 11.0).
fillpoint(r11, xy(60,574), 11.0).
fillpoint(r11, xy(99,574), 11.0).
fillpoint(r11, xy(65,579), 11.0).
fillpoint(r11, xy(99,585), 11.0).
fillpoint(r11, xy(20,614), 11.0).
fillpoint(r11, xy(99,614), 11.0).
fillpoint(r11, xy(25,619), 11.0).
fillpoint(r11, xy(94,619), 11.0).
fillpoint(r11, xy(31,540), 10.0).
fillpoint(r11, xy(71,540), 10.0).
fillpoint(r11, xy(19,580), 10.0).
fillpoint(r11, xy(59,560), 10.0).
fillpoint(r11, xy(99,560), 10.0).
fillpoint(r11, xy(71,580), 10.0).
fillpoint(r11, xy(99,600), 10.0).
fillpoint(r11, xy(31,620), 10.0).
region(r16, '#5a5a5a', 7200, centroid(370,620)).
perimeter(r16, 760).
polygon(r16, [xy(549,630),xy(190,630),xy(190,610),xy(549,610),xy(549,630)]).
midline(r16, [xy(364,619),xy(199,620)]).
midline(r16, [xy(365,619),xy(540,620)]).
fillpoint(r16, xy(199,620), 10.0).
region(r6, '#aaaaaa', 4300, centroid(165,425)).
perimeter(r6, 440).
polygon(r6, [xy(199,460),xy(130,459),xy(130,390),xy(200,390),xy(199,460)]).
hole(r6, [xy(160,439),xy(160,420),xy(179,420),xy(179,410),xy(150,410),xy(150,439),xy(160,439)]).
hole(r6, [xy(180,439),xy(179,430),xy(170,430),xy(170,440),xy(180,439)]).
midline(r6, [xy(189,442),xy(190,431),xy(188,424),xy(165,425),xy(165,447),xy(163,449),xy(144,449),xy(141,447),xy(139,439),xy(139,410),xy(141,401),xy(144,400),xy(178,399),xy(188,401),xy(190,410),xy(189,423)]).
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
region(r12, '#870c25', 2000, centroid(52,588)).
perimeter(r12, 240).
polygon(r12, [xy(89,610),xy(30,609),xy(30,550),xy(50,550),xy(50,590),xy(90,590),xy(89,610)]).
midline(r12, [xy(39,586),xy(40,559)]).
midline(r12, [xy(40,587),xy(40,595),xy(44,599),xy(80,600)]).
fillpoint(r12, xy(41,598), 12.0).
fillpoint(r12, xy(40,594), 11.0).
fillpoint(r12, xy(45,599), 11.0).
fillpoint(r12, xy(39,574), 10.0).
fillpoint(r12, xy(51,600), 10.0).
region(r10, '#870c25', 1500, centroid(514,484)).
perimeter(r10, 160).
polygon(r10, [xy(539,500),xy(490,500),xy(490,470),xy(539,470),xy(539,500)]).
midline(r10, [xy(510,485),xy(504,485)]).
midline(r10, [xy(511,485),xy(525,485)]).
fillpoint(r10, xy(504,485), 15.0).
region(r15, '#2ecc40', 1200, centroid(160,620)).
perimeter(r15, 160).
polygon(r15, [xy(189,630),xy(130,630),xy(130,610),xy(189,610),xy(189,630)]).
midline(r15, [xy(150,619),xy(139,620)]).
midline(r15, [xy(151,619),xy(180,620)]).
fillpoint(r15, xy(139,620), 10.0).
region(r9, '#bebebe', 1000, centroid(514,460)).
perimeter(r9, 140).
polygon(r9, [xy(539,470),xy(490,470),xy(490,450),xy(539,450),xy(539,470)]).
midline(r9, [xy(520,460),xy(499,460)]).
midline(r9, [xy(521,459),xy(530,460)]).
fillpoint(r9, xy(499,460), 10.0).
region(r4, '#5a5a5a', 800, centroid(164,174)).
perimeter(r4, 160).
polygon(r4, [xy(179,190),xy(150,189),xy(150,160),xy(180,160),xy(179,190)]).
hole(r4, [xy(170,179),xy(169,170),xy(160,170),xy(160,180),xy(170,179)]).
midline(r4, [xy(155,177),xy(155,184),xy(160,185),xy(173,184),xy(175,179),xy(174,166),xy(168,164),xy(155,165),xy(155,176)]).
fillpoint(r4, xy(156,165), 6.0).
fillpoint(r4, xy(174,165), 6.0).
fillpoint(r4, xy(155,184), 6.0).
fillpoint(r4, xy(173,184), 6.0).
fillpoint(r4, xy(161,165), 5.0).
fillpoint(r4, xy(154,175), 5.0).
fillpoint(r4, xy(174,175), 5.0).
fillpoint(r4, xy(161,185), 5.0).
region(r7, '#870c25', 500, centroid(160,420)).
perimeter(r7, 120).
polygon(r7, [xy(159,440),xy(150,439),xy(150,410),xy(179,410),xy(179,420),xy(160,420),xy(159,440)]).
midline(r7, [xy(155,427),xy(155,435)]).
midline(r7, [xy(155,426),xy(155,415),xy(175,415)]).
fillpoint(r7, xy(156,415), 6.0).
fillpoint(r7, xy(161,415), 5.0).
fillpoint(r7, xy(155,428), 5.0).
region(r13, '#870c25', 400, centroid(80,560)).
perimeter(r13, 80).
polygon(r13, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r13, [xy(79,559),xy(80,560)]).
fillpoint(r13, xy(79,560), 10.0).
region(r17, '#7fdbff', 400, centroid(570,620)).
perimeter(r17, 80).
polygon(r17, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r17, [xy(569,619),xy(570,620)]).
fillpoint(r17, xy(569,620), 10.0).
region(r18, '#7fdbff', 400, centroid(600,620)).
perimeter(r18, 80).
polygon(r18, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r18, [xy(599,619),xy(600,620)]).
fillpoint(r18, xy(599,620), 10.0).
region(r19, '#7fdbff', 400, centroid(630,620)).
perimeter(r19, 80).
polygon(r19, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r19, [xy(629,619),xy(630,620)]).
fillpoint(r19, xy(629,620), 10.0).
border(r19).
region(r5, '#2ecc40', 100, centroid(164,174)).
perimeter(r5, 40).
polygon(r5, [xy(169,180),xy(160,179),xy(160,170),xy(170,170),xy(169,180)]).
midline(r5, [xy(165,175),xy(165,174)]).
fillpoint(r5, xy(164,175), 5.0).
region(r8, '#870c25', 100, centroid(174,434)).
perimeter(r8, 40).
polygon(r8, [xy(179,440),xy(170,439),xy(170,430),xy(180,430),xy(179,440)]).
midline(r8, [xy(175,435),xy(175,434)]).
fillpoint(r8, xy(174,435), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 3820).
adjacent(r2, r11).
shared_edge(r2, r11, 400).
adjacent(r2, r14).
shared_edge(r2, r14, 560).
adjacent(r3, r4).
shared_edge(r3, r4, 120).
adjacent(r3, r6).
shared_edge(r3, r6, 280).
adjacent(r3, r9).
shared_edge(r3, r9, 90).
adjacent(r3, r10).
shared_edge(r3, r10, 110).
adjacent(r4, r5).
shared_edge(r4, r5, 40).
adjacent(r6, r7).
shared_edge(r6, r7, 120).
adjacent(r6, r8).
shared_edge(r6, r8, 40).
adjacent(r9, r10).
shared_edge(r9, r10, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 240).
adjacent(r11, r13).
shared_edge(r11, r13, 80).
adjacent(r14, r15).
shared_edge(r14, r15, 140).
adjacent(r14, r16).
shared_edge(r14, r16, 740).
adjacent(r14, r17).
shared_edge(r14, r17, 80).
adjacent(r14, r18).
shared_edge(r14, r18, 80).
adjacent(r14, r19).
shared_edge(r14, r19, 60).
adjacent(r15, r16).
shared_edge(r15, r16, 20).

encloses(r4, r5).
encloses(r6, r7).
encloses(r6, r8).
encloses(r11, r12).
encloses(r11, r13).
encloses(r14, r17).
encloses(r14, r18).
