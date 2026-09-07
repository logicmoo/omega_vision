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
midline(r2, [xy(64,277),xy(65,119),xy(60,107),xy(59,53),xy(61,38),xy(66,26),xy(81,24),xy(389,24),xy(403,26),xy(415,31),xy(415,99),xy(412,116),xy(406,125),xy(364,125)]).
midline(r2, [xy(408,125),xy(414,141),xy(414,198),xy(416,213),xy(420,221),xy(441,225),xy(515,225)]).
midline(r2, [xy(416,30),xy(440,24),xy(520,25),xy(528,21),xy(541,19),xy(589,19),xy(613,26),xy(615,42),xy(614,455),xy(622,467),xy(625,480),xy(624,576),xy(621,582),xy(606,585),xy(523,585),xy(507,582),xy(497,576),xy(454,534),xy(455,464),xy(465,425),xy(430,391),xy(411,379),xy(399,375),xy(364,375)]).
midline(r2, [xy(466,428),xy(470,431),xy(472,429),xy(470,428)]).
midline(r2, [xy(473,429),xy(475,431),xy(472,431)]).
midline(r2, [xy(475,433),xy(489,438)]).
midline(r2, [xy(66,121),xy(68,119)]).
midline(r2, [xy(454,535),xy(425,562),xy(399,574),xy(241,575),xy(226,573),xy(212,567),xy(190,549),xy(160,550),xy(132,523),xy(122,517),xy(108,514),xy(83,514),xy(65,504),xy(43,524),xy(5,525),xy(5,634),xy(102,635),xy(114,633),xy(114,601),xy(116,594),xy(159,550)]).
midline(r2, [xy(65,503),xy(65,278)]).
midline(r2, [xy(190,548),xy(204,532),xy(214,508),xy(215,382),xy(199,375),xy(180,374),xy(170,371),xy(166,363),xy(164,349),xy(165,140),xy(169,129),xy(180,125),xy(265,125)]).
midline(r2, [xy(215,381),xy(231,375),xy(265,375)]).
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
region(r8, '#2ecc40', 119000, centroid(398,292)).
perimeter(r8, 3780).
polygon(r8, [xy(609,570),xy(520,569),xy(520,480),xy(540,479),xy(539,350),xy(340,350),xy(340,399),xy(390,400),xy(390,549),xy(240,549),xy(240,400),xy(289,400),xy(290,350),xy(190,349),xy(190,150),xy(289,150),xy(290,100),xy(339,100),xy(340,149),xy(390,150),xy(390,250),xy(539,250),xy(539,200),xy(440,199),xy(440,50),xy(590,50),xy(590,479),xy(610,480),xy(609,570)]).
hole(r8, [xy(600,559),xy(599,490),xy(530,490),xy(530,560),xy(600,559)]).
hole(r8, [xy(520,139),xy(520,130),xy(529,130),xy(530,120),xy(520,120),xy(519,110),xy(510,110),xy(510,119),xy(500,120),xy(500,129),xy(509,130),xy(510,140),xy(520,139)]).
hole(r8, [xy(380,189),xy(379,160),xy(350,160),xy(350,190),xy(380,189)]).
hole(r8, [xy(230,339),xy(229,310),xy(200,310),xy(200,340),xy(230,339)]).
hole(r8, [xy(330,489),xy(329,460),xy(300,460),xy(300,490),xy(330,489)]).
midline(r8, [xy(327,168),xy(320,173),xy(314,174),xy(315,124)]).
midline(r8, [xy(314,175),xy(278,233),xy(238,261),xy(199,300),xy(194,312),xy(195,344),xy(233,344),xy(281,298),xy(287,288),xy(307,268),xy(276,236)]).
midline(r8, [xy(321,174),xy(346,155),xy(379,154),xy(384,155),xy(385,160),xy(385,186),xy(384,193),xy(380,199),xy(341,238),xy(327,248),xy(308,267),xy(315,276),xy(315,423),xy(304,428),xy(276,434),xy(270,450),xy(269,489),xy(271,504),xy(276,515),xy(302,520),xy(339,519),xy(353,515),xy(358,504),xy(360,461),xy(355,436),xy(344,431),xy(325,428),xy(315,424)]).
midline(r8, [xy(316,275),xy(362,296),xy(392,300),xy(539,300),xy(549,289),xy(556,279),xy(564,259),xy(565,200),xy(562,183),xy(550,162),xy(534,168),xy(510,170),xy(495,168),xy(477,159),xy(471,144),xy(469,120),xy(471,105),xy(479,89)]).
midline(r8, [xy(479,160),xy(478,161)]).
midline(r8, [xy(480,87),xy(495,81),xy(518,79),xy(534,81),xy(551,88),xy(558,105),xy(560,121),xy(558,144),xy(551,161)]).
midline(r8, [xy(540,301),xy(556,320),xy(564,340),xy(565,464),xy(545,483),xy(525,485),xy(524,559),xy(525,564),xy(530,565),xy(597,565),xy(604,563),xy(604,486),xy(584,483),xy(565,465)]).
midline(r8, [xy(330,248),xy(331,247)]).
fillpoint(r8, xy(303,263), 87.7).
fillpoint(r8, xy(277,237), 87.4).
fillpoint(r8, xy(351,292), 58.0).
fillpoint(r8, xy(363,296), 54.0).
fillpoint(r8, xy(367,297), 53.0).
fillpoint(r8, xy(372,298), 52.0).
fillpoint(r8, xy(378,299), 51.0).
fillpoint(r8, xy(391,300), 50.0).
fillpoint(r8, xy(551,162), 39.0).
fillpoint(r8, xy(478,88), 38.8).
fillpoint(r8, xy(551,88), 38.8).
fillpoint(r8, xy(478,161), 38.8).
fillpoint(r8, xy(315,424), 35.4).
fillpoint(r8, xy(275,435), 35.4).
fillpoint(r8, xy(354,435), 35.4).
fillpoint(r8, xy(275,514), 35.4).
fillpoint(r8, xy(354,514), 35.4).
fillpoint(r8, xy(496,81), 32.0).
fillpoint(r8, xy(533,81), 32.0).
fillpoint(r8, xy(471,106), 32.0).
fillpoint(r8, xy(558,106), 32.0).
fillpoint(r8, xy(471,143), 32.0).
fillpoint(r8, xy(558,143), 32.0).
fillpoint(r8, xy(496,168), 32.0).
fillpoint(r8, xy(533,168), 32.0).
fillpoint(r8, xy(303,428), 32.0).
fillpoint(r8, xy(326,428), 32.0).
fillpoint(r8, xy(286,431), 32.0).
fillpoint(r8, xy(343,431), 32.0).
fillpoint(r8, xy(271,446), 32.0).
fillpoint(r8, xy(358,446), 32.0).
fillpoint(r8, xy(271,503), 32.0).
fillpoint(r8, xy(358,503), 32.0).
fillpoint(r8, xy(286,518), 32.0).
fillpoint(r8, xy(343,518), 32.0).
fillpoint(r8, xy(298,429), 31.1).
fillpoint(r8, xy(331,429), 31.1).
fillpoint(r8, xy(291,430), 31.1).
fillpoint(r8, xy(338,430), 31.1).
fillpoint(r8, xy(502,80), 31.0).
fillpoint(r8, xy(528,80), 31.0).
fillpoint(r8, xy(470,112), 31.0).
fillpoint(r8, xy(559,112), 31.0).
fillpoint(r8, xy(470,138), 31.0).
fillpoint(r8, xy(559,138), 31.0).
fillpoint(r8, xy(502,169), 31.0).
fillpoint(r8, xy(528,169), 31.0).
fillpoint(r8, xy(270,452), 31.0).
fillpoint(r8, xy(359,452), 31.0).
fillpoint(r8, xy(270,498), 31.0).
fillpoint(r8, xy(359,498), 31.0).
fillpoint(r8, xy(292,519), 31.0).
fillpoint(r8, xy(338,519), 31.0).
fillpoint(r8, xy(511,80), 30.0).
fillpoint(r8, xy(469,125), 30.0).
fillpoint(r8, xy(559,125), 30.0).
fillpoint(r8, xy(511,170), 30.0).
fillpoint(r8, xy(269,475), 30.0).
fillpoint(r8, xy(359,475), 30.0).
fillpoint(r8, xy(301,520), 30.0).
fillpoint(r8, xy(561,181), 29.0).
fillpoint(r8, xy(561,268), 29.0).
fillpoint(r8, xy(561,331), 29.0).
fillpoint(r8, xy(562,184), 28.0).
fillpoint(r8, xy(562,265), 28.0).
fillpoint(r8, xy(562,334), 28.0).
fillpoint(r8, xy(563,187), 27.0).
fillpoint(r8, xy(563,262), 27.0).
fillpoint(r8, xy(563,337), 27.0).
fillpoint(r8, xy(564,192), 26.0).
fillpoint(r8, xy(564,258), 26.0).
fillpoint(r8, xy(564,342), 26.0).
fillpoint(r8, xy(315,136), 25.0).
fillpoint(r8, xy(564,225), 25.0).
fillpoint(r8, xy(314,375), 25.0).
fillpoint(r8, xy(565,408), 25.0).
region(r5, '#2ecc40', 35000, centroid(143,257)).
perimeter(r5, 1400).
polygon(r5, [xy(189,500),xy(90,499),xy(90,50),xy(289,50),xy(289,100),xy(140,100),xy(140,399),xy(190,400),xy(189,500)]).
midline(r5, [xy(115,308),xy(114,100),xy(119,79),xy(141,74),xy(265,75)]).
midline(r5, [xy(115,309),xy(115,409),xy(123,429),xy(140,450)]).
fillpoint(r5, xy(139,450), 50.0).
fillpoint(r5, xy(119,79), 29.7).
fillpoint(r5, xy(121,78), 29.0).
fillpoint(r5, xy(118,81), 29.0).
fillpoint(r5, xy(118,418), 29.0).
fillpoint(r5, xy(124,77), 28.0).
fillpoint(r5, xy(117,84), 28.0).
fillpoint(r5, xy(117,415), 28.0).
fillpoint(r5, xy(127,76), 27.0).
fillpoint(r5, xy(116,87), 27.0).
fillpoint(r5, xy(116,412), 27.0).
fillpoint(r5, xy(132,75), 26.0).
fillpoint(r5, xy(115,92), 26.0).
fillpoint(r5, xy(115,408), 26.0).
fillpoint(r5, xy(141,75), 25.0).
fillpoint(r5, xy(114,250), 25.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(19,364),xy(20,19)]).
midline(r1, [xy(20,365),xy(20,500)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r26, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r26, 2200).
polygon(r26, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r26, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r26, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r26, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r26, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r26, [xy(418,635),xy(130,635),xy(126,634),xy(124,629),xy(125,605),xy(553,605),xy(555,606),xy(555,632),xy(549,635),xy(419,634)]).
midline(r26, [xy(556,605),xy(583,605),xy(585,609),xy(585,629),xy(584,633),xy(579,635),xy(555,633)]).
midline(r26, [xy(585,606),xy(590,604),xy(608,604),xy(614,607),xy(621,604),xy(635,605)]).
midline(r26, [xy(615,608),xy(615,631),xy(613,634),xy(592,635),xy(585,633)]).
midline(r26, [xy(615,633),xy(635,635)]).
fillpoint(r26, xy(555,606), 6.4).
fillpoint(r26, xy(585,606), 6.4).
fillpoint(r26, xy(615,606), 6.4).
fillpoint(r26, xy(555,633), 6.4).
fillpoint(r26, xy(585,633), 6.4).
fillpoint(r26, xy(615,633), 6.4).
fillpoint(r26, xy(126,605), 6.0).
fillpoint(r26, xy(125,634), 6.0).
fillpoint(r26, xy(131,605), 5.0).
fillpoint(r26, xy(561,605), 5.0).
fillpoint(r26, xy(591,605), 5.0).
fillpoint(r26, xy(621,605), 5.0).
fillpoint(r26, xy(124,620), 5.0).
fillpoint(r26, xy(554,620), 5.0).
fillpoint(r26, xy(584,620), 5.0).
fillpoint(r26, xy(614,620), 5.0).
fillpoint(r26, xy(131,635), 5.0).
fillpoint(r26, xy(561,635), 5.0).
fillpoint(r26, xy(591,635), 5.0).
fillpoint(r26, xy(621,635), 5.0).
border(r26).
region(r25, '#afafaf', 10000, centroid(60,580)).
perimeter(r25, 400).
polygon(r25, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
midline(r25, [xy(59,579),xy(60,580)]).
fillpoint(r25, xy(59,580), 50.0).
region(r28, '#5a5a5a', 4800, centroid(430,620)).
perimeter(r28, 520).
polygon(r28, [xy(549,630),xy(310,630),xy(310,610),xy(549,610),xy(549,630)]).
midline(r28, [xy(459,620),xy(319,620)]).
midline(r28, [xy(460,620),xy(540,620)]).
fillpoint(r28, xy(319,620), 10.0).
region(r22, '#aaaaaa', 4300, centroid(565,524)).
perimeter(r22, 440).
polygon(r22, [xy(599,560),xy(530,559),xy(530,490),xy(600,490),xy(599,560)]).
hole(r22, [xy(580,539),xy(579,530),xy(560,529),xy(559,510),xy(550,510),xy(550,540),xy(580,539)]).
hole(r22, [xy(580,519),xy(579,510),xy(570,510),xy(570,520),xy(580,519)]).
midline(r22, [xy(589,542),xy(590,533),xy(587,524),xy(570,525),xy(565,523),xy(564,500),xy(551,499),xy(541,501),xy(539,520),xy(541,548),xy(577,550),xy(587,548),xy(589,543)]).
midline(r22, [xy(566,500),xy(578,499),xy(588,501),xy(590,510),xy(589,524)]).
fillpoint(r22, xy(542,501), 12.0).
fillpoint(r22, xy(588,501), 12.0).
fillpoint(r22, xy(541,548), 12.0).
fillpoint(r22, xy(587,548), 12.0).
fillpoint(r22, xy(545,500), 11.0).
fillpoint(r22, xy(565,500), 11.0).
fillpoint(r22, xy(584,500), 11.0).
fillpoint(r22, xy(540,505), 11.0).
fillpoint(r22, xy(589,505), 11.0).
fillpoint(r22, xy(589,525), 11.0).
fillpoint(r22, xy(540,544), 11.0).
fillpoint(r22, xy(589,544), 11.0).
fillpoint(r22, xy(545,549), 11.0).
fillpoint(r22, xy(584,549), 11.0).
fillpoint(r22, xy(551,500), 10.0).
fillpoint(r22, xy(571,500), 10.0).
fillpoint(r22, xy(539,525), 10.0).
fillpoint(r22, xy(589,515), 10.0).
fillpoint(r22, xy(589,535), 10.0).
fillpoint(r22, xy(551,550), 10.0).
fillpoint(r22, xy(565,524), 6.0).
fillpoint(r22, xy(564,515), 5.0).
fillpoint(r22, xy(571,525), 5.0).
region(r27, '#2ecc40', 3600, centroid(220,620)).
perimeter(r27, 400).
polygon(r27, [xy(309,630),xy(130,630),xy(130,610),xy(309,610),xy(309,630)]).
midline(r27, [xy(279,620),xy(139,620)]).
midline(r27, [xy(280,620),xy(300,620)]).
fillpoint(r27, xy(139,620), 10.0).
region(r7, '#2ecc40', 2500, centroid(364,74)).
perimeter(r7, 200).
polygon(r7, [xy(389,100),xy(340,99),xy(340,50),xy(390,50),xy(389,100)]).
midline(r7, [xy(364,75),xy(365,75)]).
fillpoint(r7, xy(364,75), 25.0).
region(r9, '#870c25', 1500, centroid(314,84)).
perimeter(r9, 160).
polygon(r9, [xy(339,100),xy(290,100),xy(290,70),xy(339,70),xy(339,100)]).
midline(r9, [xy(316,84),xy(304,85)]).
midline(r9, [xy(317,84),xy(325,85)]).
fillpoint(r9, xy(304,85), 15.0).
region(r6, '#bebebe', 1000, centroid(314,60)).
perimeter(r6, 140).
polygon(r6, [xy(339,70),xy(290,70),xy(290,50),xy(339,50),xy(339,70)]).
midline(r6, [xy(311,60),xy(299,60)]).
midline(r6, [xy(312,59),xy(330,60)]).
fillpoint(r6, xy(299,60), 10.0).
region(r13, '#5a5a5a', 800, centroid(364,174)).
perimeter(r13, 160).
polygon(r13, [xy(379,190),xy(350,189),xy(350,160),xy(380,160),xy(379,190)]).
hole(r13, [xy(370,179),xy(369,170),xy(360,170),xy(360,180),xy(370,179)]).
midline(r13, [xy(369,164),xy(355,165),xy(355,184),xy(367,185),xy(374,183),xy(375,170),xy(374,166),xy(370,165)]).
fillpoint(r13, xy(356,165), 6.0).
fillpoint(r13, xy(374,165), 6.0).
fillpoint(r13, xy(355,184), 6.0).
fillpoint(r13, xy(373,184), 6.0).
fillpoint(r13, xy(361,165), 5.0).
fillpoint(r13, xy(354,175), 5.0).
fillpoint(r13, xy(374,175), 5.0).
fillpoint(r13, xy(361,185), 5.0).
region(r15, '#5a5a5a', 800, centroid(214,324)).
perimeter(r15, 160).
polygon(r15, [xy(229,340),xy(200,339),xy(200,310),xy(230,310),xy(229,340)]).
hole(r15, [xy(220,329),xy(219,320),xy(210,320),xy(210,330),xy(220,329)]).
midline(r15, [xy(219,314),xy(205,315),xy(205,334),xy(218,335),xy(224,333),xy(225,320),xy(224,316),xy(220,315)]).
fillpoint(r15, xy(206,315), 6.0).
fillpoint(r15, xy(224,315), 6.0).
fillpoint(r15, xy(205,334), 6.0).
fillpoint(r15, xy(223,334), 6.0).
fillpoint(r15, xy(211,315), 5.0).
fillpoint(r15, xy(204,325), 5.0).
fillpoint(r15, xy(224,325), 5.0).
fillpoint(r15, xy(211,335), 5.0).
region(r3, '#0074d9', 500, centroid(564,44)).
perimeter(r3, 120).
polygon(r3, [xy(589,50),xy(540,50),xy(540,40),xy(589,40),xy(589,50)]).
midline(r3, [xy(559,44),xy(544,45)]).
midline(r3, [xy(560,44),xy(585,45)]).
fillpoint(r3, xy(544,45), 5.0).
region(r4, '#0074d9', 500, centroid(84,74)).
perimeter(r4, 120).
polygon(r4, [xy(89,100),xy(80,99),xy(80,50),xy(90,50),xy(89,100)]).
midline(r4, [xy(85,67),xy(85,54)]).
midline(r4, [xy(85,68),xy(85,95)]).
fillpoint(r4, xy(84,75), 5.0).
region(r23, '#870c25', 500, centroid(560,528)).
perimeter(r23, 120).
polygon(r23, [xy(579,540),xy(550,539),xy(550,510),xy(560,510),xy(560,530),xy(580,530),xy(579,540)]).
midline(r23, [xy(555,527),xy(555,514)]).
midline(r23, [xy(555,528),xy(555,534),xy(575,535)]).
fillpoint(r23, xy(555,534), 6.0).
fillpoint(r23, xy(555,521), 5.0).
fillpoint(r23, xy(561,535), 5.0).
region(r29, '#7fdbff', 400, centroid(570,620)).
perimeter(r29, 80).
polygon(r29, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r29, [xy(569,619),xy(570,620)]).
fillpoint(r29, xy(569,620), 10.0).
region(r30, '#7fdbff', 400, centroid(600,620)).
perimeter(r30, 80).
polygon(r30, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r30, [xy(599,619),xy(600,620)]).
fillpoint(r30, xy(599,620), 10.0).
region(r31, '#7fdbff', 400, centroid(630,620)).
perimeter(r31, 80).
polygon(r31, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r31, [xy(629,619),xy(630,620)]).
fillpoint(r31, xy(629,620), 10.0).
border(r31).
region(r14, '#2ecc40', 100, centroid(364,174)).
perimeter(r14, 40).
polygon(r14, [xy(369,180),xy(360,179),xy(360,170),xy(370,170),xy(369,180)]).
midline(r14, [xy(365,175),xy(365,174)]).
fillpoint(r14, xy(364,175), 5.0).
region(r16, '#2ecc40', 100, centroid(214,324)).
perimeter(r16, 40).
polygon(r16, [xy(219,330),xy(210,329),xy(210,320),xy(220,320),xy(219,330)]).
midline(r16, [xy(215,325),xy(215,324)]).
fillpoint(r16, xy(214,325), 5.0).
region(r24, '#870c25', 100, centroid(574,514)).
perimeter(r24, 40).
polygon(r24, [xy(579,520),xy(570,519),xy(570,510),xy(580,510),xy(579,520)]).
midline(r24, [xy(575,515),xy(575,514)]).
fillpoint(r24, xy(574,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 70).
adjacent(r2, r4).
shared_edge(r2, r4, 70).
adjacent(r2, r5).
shared_edge(r2, r5, 1300).
adjacent(r2, r6).
shared_edge(r2, r6, 50).
adjacent(r2, r7).
shared_edge(r2, r7, 150).
adjacent(r2, r8).
shared_edge(r2, r8, 2920).
adjacent(r2, r25).
shared_edge(r2, r25, 400).
adjacent(r2, r26).
shared_edge(r2, r26, 560).
adjacent(r3, r8).
shared_edge(r3, r8, 50).
adjacent(r4, r5).
shared_edge(r4, r5, 50).
adjacent(r5, r6).
shared_edge(r5, r6, 20).
adjacent(r5, r9).
shared_edge(r5, r9, 30).
adjacent(r6, r7).
shared_edge(r6, r7, 20).
adjacent(r6, r9).
shared_edge(r6, r9, 50).
adjacent(r7, r9).
shared_edge(r7, r9, 30).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r8, r13).
shared_edge(r8, r13, 120).
adjacent(r8, r15).
shared_edge(r8, r15, 120).
adjacent(r8, r22).
shared_edge(r8, r22, 280).
adjacent(r13, r14).
shared_edge(r13, r14, 40).
adjacent(r15, r16).
shared_edge(r15, r16, 40).
adjacent(r22, r23).
shared_edge(r22, r23, 120).
adjacent(r22, r24).
shared_edge(r22, r24, 40).
adjacent(r26, r27).
shared_edge(r26, r27, 380).
adjacent(r26, r28).
shared_edge(r26, r28, 500).
adjacent(r26, r29).
shared_edge(r26, r29, 80).
adjacent(r26, r30).
shared_edge(r26, r30, 80).
adjacent(r26, r31).
shared_edge(r26, r31, 60).
adjacent(r27, r28).
shared_edge(r27, r28, 20).

encloses(r13, r14).
encloses(r15, r16).
encloses(r22, r23).
encloses(r22, r24).
encloses(r2, r25).
encloses(r26, r29).
encloses(r26, r30).
