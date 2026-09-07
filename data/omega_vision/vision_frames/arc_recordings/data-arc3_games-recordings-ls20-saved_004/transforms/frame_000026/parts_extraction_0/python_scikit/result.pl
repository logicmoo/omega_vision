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
midline(r2, [xy(112,25),xy(81,24),xy(66,26),xy(60,42),xy(59,99),xy(65,120),xy(65,504),xy(43,524),xy(5,525),xy(4,628),xy(5,634),xy(10,635),xy(113,634),xy(116,594),xy(159,550),xy(132,523),xy(122,517),xy(108,514),xy(83,514),xy(66,505)]).
midline(r2, [xy(113,24),xy(384,24),xy(409,28),xy(415,31),xy(415,96),xy(411,119),xy(407,125),xy(364,125)]).
midline(r2, [xy(408,125),xy(414,140),xy(414,199),xy(419,220),xy(430,224),xy(443,225),xy(515,225)]).
midline(r2, [xy(416,30),xy(440,24),xy(520,25),xy(528,21),xy(540,19),xy(589,19),xy(613,26),xy(615,42),xy(614,455),xy(622,467),xy(625,480),xy(624,576),xy(621,582),xy(609,585),xy(520,585),xy(507,582),xy(497,576),xy(454,534),xy(455,464),xy(465,425),xy(429,390),xy(411,379),xy(398,375),xy(364,375)]).
midline(r2, [xy(466,429),xy(482,436),xy(486,435),xy(485,437)]).
midline(r2, [xy(454,535),xy(419,566),xy(403,573),xy(388,575),xy(230,574),xy(207,564),xy(189,549),xy(160,549)]).
midline(r2, [xy(190,548),xy(204,532),xy(214,508),xy(215,383),xy(213,380),xy(203,376),xy(173,372),xy(168,369),xy(166,363),xy(164,349),xy(165,140),xy(170,128),xy(181,125),xy(265,125)]).
midline(r2, [xy(215,381),xy(230,375),xy(265,375)]).
midline(r2, [xy(488,439),xy(489,438)]).
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
region(r5, '#2ecc40', 158300, centroid(341,277)).
perimeter(r5, 5240).
polygon(r5, [xy(609,570),xy(520,569),xy(520,480),xy(540,479),xy(539,350),xy(340,350),xy(340,399),xy(390,400),xy(390,549),xy(240,549),xy(240,400),xy(289,400),xy(290,350),xy(190,349),xy(190,150),xy(289,150),xy(289,100),xy(140,100),xy(140,399),xy(190,400),xy(190,499),xy(90,499),xy(90,50),xy(389,50),xy(390,99),xy(340,100),xy(340,149),xy(390,150),xy(390,250),xy(540,249),xy(539,200),xy(440,199),xy(440,50),xy(590,50),xy(590,479),xy(610,480),xy(609,570)]).
hole(r5, [xy(600,559),xy(599,490),xy(530,490),xy(530,560),xy(600,559)]).
hole(r5, [xy(290,299),xy(289,250),xy(240,250),xy(240,300),xy(290,299)]).
hole(r5, [xy(520,139),xy(520,130),xy(529,130),xy(530,120),xy(520,120),xy(519,110),xy(510,110),xy(510,119),xy(500,120),xy(500,129),xy(509,130),xy(510,140),xy(520,139)]).
hole(r5, [xy(330,489),xy(329,460),xy(300,460),xy(300,490),xy(330,489)]).
midline(r5, [xy(239,199),xy(223,220),xy(215,241),xy(214,296),xy(218,319),xy(226,323),xy(242,325),xy(315,324),xy(315,422),xy(313,425),xy(285,431),xy(274,436),xy(269,461),xy(270,499),xy(274,513),xy(285,518),xy(303,520),xy(339,519),xy(355,513),xy(360,489),xy(360,460),xy(355,436),xy(344,431),xy(325,428),xy(315,424)]).
midline(r5, [xy(241,199),xy(312,200),xy(315,198),xy(315,83),xy(313,80),xy(289,74),xy(140,74),xy(120,78),xy(117,83),xy(114,101),xy(114,397),xy(119,421),xy(127,435),xy(140,450)]).
midline(r5, [xy(315,81),xy(330,75),xy(365,75)]).
midline(r5, [xy(316,323),xy(348,290),xy(340,263),xy(339,236),xy(333,213),xy(330,207),xy(315,200)]).
midline(r5, [xy(349,291),xy(370,298),xy(390,300),xy(537,300),xy(556,279),xy(563,263),xy(565,249),xy(565,200),xy(561,180),xy(550,162),xy(534,168),xy(512,170),xy(495,168),xy(477,159),xy(471,144),xy(469,122),xy(471,105),xy(479,89)]).
midline(r5, [xy(479,160),xy(478,161)]).
midline(r5, [xy(540,300),xy(557,322),xy(564,341),xy(565,461),xy(564,465),xy(545,483),xy(525,485),xy(524,559),xy(525,564),xy(533,565),xy(599,565),xy(604,563),xy(604,486),xy(584,483),xy(565,465)]).
midline(r5, [xy(480,87),xy(495,81),xy(519,79),xy(534,81),xy(551,88),xy(558,105),xy(560,120),xy(558,144),xy(551,161)]).
fillpoint(r5, xy(331,208), 59.0).
fillpoint(r5, xy(348,291), 59.0).
fillpoint(r5, xy(332,211), 58.0).
fillpoint(r5, xy(347,288), 58.0).
fillpoint(r5, xy(351,292), 58.0).
fillpoint(r5, xy(336,223), 54.0).
fillpoint(r5, xy(343,276), 54.0).
fillpoint(r5, xy(363,296), 54.0).
fillpoint(r5, xy(337,227), 53.0).
fillpoint(r5, xy(342,272), 53.0).
fillpoint(r5, xy(367,297), 53.0).
fillpoint(r5, xy(338,232), 52.0).
fillpoint(r5, xy(341,268), 52.0).
fillpoint(r5, xy(372,298), 52.0).
fillpoint(r5, xy(339,238), 51.0).
fillpoint(r5, xy(340,261), 51.0).
fillpoint(r5, xy(378,299), 51.0).
fillpoint(r5, xy(239,200), 50.0).
fillpoint(r5, xy(391,300), 50.0).
fillpoint(r5, xy(139,450), 50.0).
fillpoint(r5, xy(551,162), 39.0).
fillpoint(r5, xy(478,88), 38.8).
fillpoint(r5, xy(551,88), 38.8).
fillpoint(r5, xy(478,161), 38.8).
fillpoint(r5, xy(315,424), 35.4).
fillpoint(r5, xy(275,435), 35.4).
fillpoint(r5, xy(354,435), 35.4).
fillpoint(r5, xy(275,514), 35.4).
fillpoint(r5, xy(354,514), 35.4).
fillpoint(r5, xy(496,81), 32.0).
fillpoint(r5, xy(533,81), 32.0).
fillpoint(r5, xy(471,106), 32.0).
fillpoint(r5, xy(558,106), 32.0).
fillpoint(r5, xy(471,143), 32.0).
fillpoint(r5, xy(558,143), 32.0).
fillpoint(r5, xy(496,168), 32.0).
fillpoint(r5, xy(533,168), 32.0).
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
fillpoint(r5, xy(298,429), 31.1).
fillpoint(r5, xy(331,429), 31.1).
fillpoint(r5, xy(291,430), 31.1).
fillpoint(r5, xy(338,430), 31.1).
fillpoint(r5, xy(502,80), 31.0).
fillpoint(r5, xy(528,80), 31.0).
fillpoint(r5, xy(470,112), 31.0).
fillpoint(r5, xy(559,112), 31.0).
fillpoint(r5, xy(470,138), 31.0).
fillpoint(r5, xy(559,138), 31.0).
fillpoint(r5, xy(502,169), 31.0).
fillpoint(r5, xy(528,169), 31.0).
fillpoint(r5, xy(270,452), 31.0).
fillpoint(r5, xy(359,452), 31.0).
fillpoint(r5, xy(270,498), 31.0).
fillpoint(r5, xy(359,498), 31.0).
fillpoint(r5, xy(292,519), 31.0).
fillpoint(r5, xy(338,519), 31.0).
fillpoint(r5, xy(511,80), 30.0).
fillpoint(r5, xy(469,125), 30.0).
fillpoint(r5, xy(559,125), 30.0).
fillpoint(r5, xy(511,170), 30.0).
fillpoint(r5, xy(269,475), 30.0).
fillpoint(r5, xy(359,475), 30.0).
fillpoint(r5, xy(301,520), 30.0).
fillpoint(r5, xy(119,79), 29.7).
fillpoint(r5, xy(219,320), 29.7).
fillpoint(r5, xy(121,78), 29.0).
fillpoint(r5, xy(308,78), 29.0).
fillpoint(r5, xy(321,78), 29.0).
fillpoint(r5, xy(118,81), 29.0).
fillpoint(r5, xy(561,181), 29.0).
fillpoint(r5, xy(218,231), 29.0).
fillpoint(r5, xy(561,268), 29.0).
fillpoint(r5, xy(218,318), 29.0).
fillpoint(r5, xy(221,321), 29.0).
fillpoint(r5, xy(561,331), 29.0).
fillpoint(r5, xy(118,418), 29.0).
fillpoint(r5, xy(124,77), 28.0).
fillpoint(r5, xy(305,77), 28.0).
fillpoint(r5, xy(324,77), 28.0).
fillpoint(r5, xy(117,84), 28.0).
fillpoint(r5, xy(562,184), 28.0).
fillpoint(r5, xy(217,234), 28.0).
fillpoint(r5, xy(562,265), 28.0).
fillpoint(r5, xy(217,315), 28.0).
fillpoint(r5, xy(224,322), 28.0).
fillpoint(r5, xy(562,334), 28.0).
fillpoint(r5, xy(117,415), 28.0).
fillpoint(r5, xy(127,76), 27.0).
fillpoint(r5, xy(302,76), 27.0).
fillpoint(r5, xy(327,76), 27.0).
fillpoint(r5, xy(116,87), 27.0).
fillpoint(r5, xy(563,187), 27.0).
fillpoint(r5, xy(216,237), 27.0).
fillpoint(r5, xy(563,262), 27.0).
fillpoint(r5, xy(216,312), 27.0).
fillpoint(r5, xy(227,323), 27.0).
fillpoint(r5, xy(563,337), 27.0).
fillpoint(r5, xy(116,412), 27.0).
fillpoint(r5, xy(132,75), 26.0).
fillpoint(r5, xy(298,75), 26.0).
fillpoint(r5, xy(332,75), 26.0).
fillpoint(r5, xy(115,92), 26.0).
fillpoint(r5, xy(564,192), 26.0).
fillpoint(r5, xy(215,242), 26.0).
fillpoint(r5, xy(564,258), 26.0).
fillpoint(r5, xy(215,308), 26.0).
fillpoint(r5, xy(232,324), 26.0).
fillpoint(r5, xy(564,342), 26.0).
fillpoint(r5, xy(115,408), 26.0).
fillpoint(r5, xy(141,75), 25.0).
fillpoint(r5, xy(341,75), 25.0).
fillpoint(r5, xy(114,250), 25.0).
fillpoint(r5, xy(314,125), 25.0).
fillpoint(r5, xy(564,225), 25.0).
fillpoint(r5, xy(214,275), 25.0).
fillpoint(r5, xy(241,325), 25.0).
fillpoint(r5, xy(314,375), 25.0).
fillpoint(r5, xy(565,408), 25.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(20,70),xy(20,19)]).
midline(r1, [xy(20,71),xy(20,500)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r22, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r22, 2200).
polygon(r22, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r22, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r22, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r22, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r22, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r22, [xy(524,635),xy(130,635),xy(126,634),xy(124,629),xy(125,605),xy(130,604),xy(549,604),xy(555,606),xy(554,633),xy(547,635),xy(525,635)]).
midline(r22, [xy(556,605),xy(578,604),xy(584,607),xy(592,604),xy(608,604),xy(614,607),xy(620,604),xy(635,605)]).
midline(r22, [xy(585,608),xy(585,631),xy(583,634),xy(560,635),xy(555,633)]).
midline(r22, [xy(615,608),xy(615,631),xy(613,634),xy(591,635),xy(585,633)]).
midline(r22, [xy(615,633),xy(635,635)]).
fillpoint(r22, xy(555,606), 6.4).
fillpoint(r22, xy(585,606), 6.4).
fillpoint(r22, xy(615,606), 6.4).
fillpoint(r22, xy(555,633), 6.4).
fillpoint(r22, xy(585,633), 6.4).
fillpoint(r22, xy(615,633), 6.4).
fillpoint(r22, xy(126,605), 6.0).
fillpoint(r22, xy(125,634), 6.0).
fillpoint(r22, xy(131,605), 5.0).
fillpoint(r22, xy(561,605), 5.0).
fillpoint(r22, xy(591,605), 5.0).
fillpoint(r22, xy(621,605), 5.0).
fillpoint(r22, xy(124,620), 5.0).
fillpoint(r22, xy(554,620), 5.0).
fillpoint(r22, xy(584,620), 5.0).
fillpoint(r22, xy(614,620), 5.0).
fillpoint(r22, xy(131,635), 5.0).
fillpoint(r22, xy(561,635), 5.0).
fillpoint(r22, xy(591,635), 5.0).
fillpoint(r22, xy(621,635), 5.0).
border(r22).
region(r19, '#aaaaaa', 7600, centroid(58,581)).
perimeter(r19, 720).
polygon(r19, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
hole(r19, [xy(90,609),xy(89,550),xy(30,550),xy(30,570),xy(70,570),xy(70,610),xy(90,609)]).
hole(r19, [xy(50,609),xy(49,590),xy(30,590),xy(30,610),xy(50,609)]).
midline(r19, [xy(43,539),xy(24,540),xy(20,544),xy(19,569),xy(23,580),xy(20,584),xy(19,592),xy(20,615),xy(21,618),xy(30,620),xy(55,619),xy(60,616),xy(58,582),xy(47,579),xy(24,580)]).
midline(r19, [xy(61,617),xy(70,620),xy(95,619),xy(98,617),xy(100,608),xy(99,544),xy(95,540),xy(88,539),xy(44,539)]).
fillpoint(r19, xy(22,580), 12.8).
fillpoint(r19, xy(60,617), 12.8).
fillpoint(r19, xy(22,541), 12.0).
fillpoint(r19, xy(98,541), 12.0).
fillpoint(r19, xy(58,581), 12.0).
fillpoint(r19, xy(21,618), 12.0).
fillpoint(r19, xy(97,618), 12.0).
fillpoint(r19, xy(25,540), 11.0).
fillpoint(r19, xy(94,540), 11.0).
fillpoint(r19, xy(20,545), 11.0).
fillpoint(r19, xy(99,545), 11.0).
fillpoint(r19, xy(20,574), 11.0).
fillpoint(r19, xy(54,580), 11.0).
fillpoint(r19, xy(20,585), 11.0).
fillpoint(r19, xy(59,585), 11.0).
fillpoint(r19, xy(20,614), 11.0).
fillpoint(r19, xy(99,614), 11.0).
fillpoint(r19, xy(25,619), 11.0).
fillpoint(r19, xy(54,619), 11.0).
fillpoint(r19, xy(65,619), 11.0).
fillpoint(r19, xy(94,619), 11.0).
fillpoint(r19, xy(31,540), 10.0).
fillpoint(r19, xy(19,560), 10.0).
fillpoint(r19, xy(99,580), 10.0).
fillpoint(r19, xy(31,580), 10.0).
fillpoint(r19, xy(19,600), 10.0).
fillpoint(r19, xy(59,600), 10.0).
fillpoint(r19, xy(31,620), 10.0).
fillpoint(r19, xy(71,620), 10.0).
region(r24, '#5a5a5a', 7600, centroid(360,620)).
perimeter(r24, 800).
polygon(r24, [xy(549,630),xy(170,630),xy(170,610),xy(549,610),xy(549,630)]).
midline(r24, [xy(344,619),xy(179,620)]).
midline(r24, [xy(345,620),xy(540,620)]).
fillpoint(r24, xy(179,620), 10.0).
region(r16, '#aaaaaa', 4300, centroid(565,524)).
perimeter(r16, 440).
polygon(r16, [xy(599,560),xy(530,559),xy(530,490),xy(600,490),xy(599,560)]).
hole(r16, [xy(580,539),xy(579,530),xy(560,529),xy(559,510),xy(550,510),xy(550,540),xy(580,539)]).
hole(r16, [xy(580,519),xy(579,510),xy(570,510),xy(570,520),xy(580,519)]).
midline(r16, [xy(589,542),xy(590,530),xy(587,524),xy(570,525),xy(565,523),xy(564,500),xy(552,499),xy(541,501),xy(539,510),xy(539,539),xy(541,548),xy(579,550),xy(587,548),xy(589,543)]).
midline(r16, [xy(566,500),xy(579,499),xy(588,501),xy(590,510),xy(589,524)]).
fillpoint(r16, xy(542,501), 12.0).
fillpoint(r16, xy(588,501), 12.0).
fillpoint(r16, xy(541,548), 12.0).
fillpoint(r16, xy(587,548), 12.0).
fillpoint(r16, xy(545,500), 11.0).
fillpoint(r16, xy(565,500), 11.0).
fillpoint(r16, xy(584,500), 11.0).
fillpoint(r16, xy(540,505), 11.0).
fillpoint(r16, xy(589,505), 11.0).
fillpoint(r16, xy(589,525), 11.0).
fillpoint(r16, xy(540,544), 11.0).
fillpoint(r16, xy(589,544), 11.0).
fillpoint(r16, xy(545,549), 11.0).
fillpoint(r16, xy(584,549), 11.0).
fillpoint(r16, xy(551,500), 10.0).
fillpoint(r16, xy(571,500), 10.0).
fillpoint(r16, xy(539,525), 10.0).
fillpoint(r16, xy(589,515), 10.0).
fillpoint(r16, xy(589,535), 10.0).
fillpoint(r16, xy(551,550), 10.0).
fillpoint(r16, xy(565,524), 6.0).
fillpoint(r16, xy(564,515), 5.0).
fillpoint(r16, xy(571,525), 5.0).
region(r20, '#870c25', 2000, centroid(68,572)).
perimeter(r20, 240).
polygon(r20, [xy(89,610),xy(70,609),xy(69,570),xy(30,569),xy(30,550),xy(90,550),xy(89,610)]).
midline(r20, [xy(51,560),xy(39,560)]).
midline(r20, [xy(52,559),xy(78,561),xy(80,570),xy(80,600)]).
fillpoint(r20, xy(78,561), 12.0).
fillpoint(r20, xy(74,560), 11.0).
fillpoint(r20, xy(79,565), 11.0).
fillpoint(r20, xy(39,560), 10.0).
fillpoint(r20, xy(79,586), 10.0).
region(r10, '#870c25', 1500, centroid(264,284)).
perimeter(r10, 160).
polygon(r10, [xy(289,300),xy(240,300),xy(240,270),xy(289,270),xy(289,300)]).
midline(r10, [xy(260,285),xy(254,285)]).
midline(r10, [xy(261,284),xy(275,285)]).
fillpoint(r10, xy(254,285), 15.0).
region(r9, '#bebebe', 1000, centroid(264,260)).
perimeter(r9, 140).
polygon(r9, [xy(289,270),xy(240,270),xy(240,250),xy(289,250),xy(289,270)]).
midline(r9, [xy(259,260),xy(249,260)]).
midline(r9, [xy(260,259),xy(280,260)]).
fillpoint(r9, xy(249,260), 10.0).
region(r23, '#2ecc40', 800, centroid(150,620)).
perimeter(r23, 120).
polygon(r23, [xy(169,630),xy(130,630),xy(130,610),xy(169,610),xy(169,630)]).
midline(r23, [xy(160,620),xy(139,620)]).
fillpoint(r23, xy(139,620), 10.0).
region(r3, '#0074d9', 500, centroid(564,44)).
perimeter(r3, 120).
polygon(r3, [xy(589,50),xy(540,50),xy(540,40),xy(589,40),xy(589,50)]).
midline(r3, [xy(576,45),xy(544,45)]).
midline(r3, [xy(577,44),xy(585,45)]).
fillpoint(r3, xy(544,45), 5.0).
region(r4, '#0074d9', 500, centroid(84,74)).
perimeter(r4, 120).
polygon(r4, [xy(89,100),xy(80,99),xy(80,50),xy(90,50),xy(89,100)]).
midline(r4, [xy(85,61),xy(85,54)]).
midline(r4, [xy(85,62),xy(85,95)]).
fillpoint(r4, xy(84,75), 5.0).
region(r17, '#870c25', 500, centroid(560,528)).
perimeter(r17, 120).
polygon(r17, [xy(579,540),xy(550,539),xy(550,510),xy(560,510),xy(560,530),xy(580,530),xy(579,540)]).
midline(r17, [xy(555,527),xy(555,514)]).
midline(r17, [xy(555,528),xy(555,534),xy(575,535)]).
fillpoint(r17, xy(555,534), 6.0).
fillpoint(r17, xy(555,521), 5.0).
fillpoint(r17, xy(561,535), 5.0).
region(r21, '#870c25', 400, centroid(40,600)).
perimeter(r21, 80).
polygon(r21, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r21, [xy(39,599),xy(40,600)]).
fillpoint(r21, xy(39,600), 10.0).
region(r25, '#7fdbff', 400, centroid(570,620)).
perimeter(r25, 80).
polygon(r25, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r25, [xy(569,619),xy(570,620)]).
fillpoint(r25, xy(569,620), 10.0).
region(r26, '#7fdbff', 400, centroid(600,620)).
perimeter(r26, 80).
polygon(r26, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r26, [xy(599,619),xy(600,620)]).
fillpoint(r26, xy(599,620), 10.0).
region(r27, '#7fdbff', 400, centroid(630,620)).
perimeter(r27, 80).
polygon(r27, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r27, [xy(629,619),xy(630,620)]).
fillpoint(r27, xy(629,620), 10.0).
border(r27).
region(r18, '#870c25', 100, centroid(574,514)).
perimeter(r18, 40).
polygon(r18, [xy(579,520),xy(570,519),xy(570,510),xy(580,510),xy(579,520)]).
midline(r18, [xy(575,515),xy(575,514)]).
fillpoint(r18, xy(574,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 70).
adjacent(r2, r4).
shared_edge(r2, r4, 70).
adjacent(r2, r5).
shared_edge(r2, r5, 4420).
adjacent(r2, r19).
shared_edge(r2, r19, 400).
adjacent(r2, r22).
shared_edge(r2, r22, 560).
adjacent(r3, r5).
shared_edge(r3, r5, 50).
adjacent(r4, r5).
shared_edge(r4, r5, 50).
adjacent(r5, r9).
shared_edge(r5, r9, 90).
adjacent(r5, r10).
shared_edge(r5, r10, 110).
adjacent(r5, r16).
shared_edge(r5, r16, 280).
adjacent(r9, r10).
shared_edge(r9, r10, 50).
adjacent(r16, r17).
shared_edge(r16, r17, 120).
adjacent(r16, r18).
shared_edge(r16, r18, 40).
adjacent(r19, r20).
shared_edge(r19, r20, 240).
adjacent(r19, r21).
shared_edge(r19, r21, 80).
adjacent(r22, r23).
shared_edge(r22, r23, 100).
adjacent(r22, r24).
shared_edge(r22, r24, 780).
adjacent(r22, r25).
shared_edge(r22, r25, 80).
adjacent(r22, r26).
shared_edge(r22, r26, 80).
adjacent(r22, r27).
shared_edge(r22, r27, 60).
adjacent(r23, r24).
shared_edge(r23, r24, 20).

encloses(r16, r17).
encloses(r16, r18).
encloses(r19, r20).
encloses(r19, r21).
encloses(r22, r25).
encloses(r22, r26).
