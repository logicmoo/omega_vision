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

region(r2, '#ffdc00', 250900, centroid(337,278)).
perimeter(r2, 4680).
polygon(r2, [xy(540,499),xy(540,250),xy(390,250),xy(390,170),xy(410,169),xy(410,80),xy(320,80),xy(320,169),xy(340,170),xy(339,250),xy(140,250),xy(140,399),xy(190,400),xy(190,499),xy(540,499)]).
hole(r2, [xy(0,520),xy(40,519),xy(40,0)]).
hole(r2, [xy(639,600),xy(120,600),xy(120,639)]).
hole(r2, [xy(110,629),xy(109,530),xy(10,530),xy(10,630),xy(110,629)]).
midline(r2, [xy(91,231),xy(89,254),xy(90,413),xy(97,439),xy(108,461),xy(45,523),xy(39,525),xy(5,525),xy(4,628),xy(5,634),xy(13,635),xy(109,635),xy(114,633),xy(114,602),xy(116,594),xy(163,545),xy(133,478),xy(122,464),xy(109,461)]).
midline(r2, [xy(92,230),xy(98,208),xy(115,178),xy(164,124),xy(195,124),xy(252,181),xy(273,196),xy(297,207)]).
midline(r2, [xy(196,123),xy(252,68),xy(273,53),xy(295,43),xy(321,39),xy(409,39),xy(437,44),xy(456,53),xy(477,68),xy(524,114),xy(525,133),xy(489,170),xy(461,193),xy(432,207),xy(420,198),xy(420,200)]).
midline(r2, [xy(429,206),xy(431,208)]).
midline(r2, [xy(525,135),xy(553,164),xy(572,190),xy(582,210),xy(589,236),xy(590,498),xy(588,519),xy(582,539),xy(567,546),xy(539,550),xy(190,550),xy(164,546)]).
fillpoint(r2, xy(164,125), 125.0).
fillpoint(r2, xy(524,125), 115.0).
fillpoint(r2, xy(109,461), 69.0).
fillpoint(r2, xy(114,462), 68.2).
fillpoint(r2, xy(118,463), 67.6).
fillpoint(r2, xy(122,464), 67.3).
fillpoint(r2, xy(581,541), 59.0).
fillpoint(r2, xy(97,211), 58.0).
fillpoint(r2, xy(582,211), 58.0).
fillpoint(r2, xy(97,438), 58.0).
fillpoint(r2, xy(582,538), 58.0).
fillpoint(r2, xy(578,542), 58.0).
fillpoint(r2, xy(93,223), 54.0).
fillpoint(r2, xy(586,223), 54.0).
fillpoint(r2, xy(93,426), 54.0).
fillpoint(r2, xy(586,526), 54.0).
fillpoint(r2, xy(163,546), 54.0).
fillpoint(r2, xy(566,546), 54.0).
fillpoint(r2, xy(92,227), 53.0).
fillpoint(r2, xy(587,227), 53.0).
fillpoint(r2, xy(92,422), 53.0).
fillpoint(r2, xy(587,522), 53.0).
fillpoint(r2, xy(167,547), 53.0).
fillpoint(r2, xy(562,547), 53.0).
fillpoint(r2, xy(91,232), 52.0).
fillpoint(r2, xy(588,232), 52.0).
fillpoint(r2, xy(91,418), 52.0).
fillpoint(r2, xy(588,518), 52.0).
fillpoint(r2, xy(172,548), 52.0).
fillpoint(r2, xy(558,548), 52.0).
fillpoint(r2, xy(90,238), 51.0).
fillpoint(r2, xy(589,238), 51.0).
fillpoint(r2, xy(90,411), 51.0).
fillpoint(r2, xy(589,511), 51.0).
fillpoint(r2, xy(178,549), 51.0).
fillpoint(r2, xy(551,549), 51.0).
fillpoint(r2, xy(89,325), 50.0).
fillpoint(r2, xy(589,375), 50.0).
fillpoint(r2, xy(191,550), 50.0).
fillpoint(r2, xy(144,500), 46.0).
fillpoint(r2, xy(155,529), 46.0).
fillpoint(r2, xy(293,44), 45.0).
fillpoint(r2, xy(436,44), 45.0).
fillpoint(r2, xy(293,205), 45.0).
fillpoint(r2, xy(436,205), 45.0).
fillpoint(r2, xy(146,505), 44.4).
fillpoint(r2, xy(153,524), 44.4).
fillpoint(r2, xy(296,43), 44.0).
fillpoint(r2, xy(433,43), 44.0).
fillpoint(r2, xy(296,206), 44.0).
fillpoint(r2, xy(433,206), 44.0).
fillpoint(r2, xy(147,508), 43.9).
fillpoint(r2, xy(152,521), 43.9).
fillpoint(r2, xy(148,510), 43.4).
fillpoint(r2, xy(151,519), 43.4).
fillpoint(r2, xy(149,513), 43.3).
fillpoint(r2, xy(150,516), 43.3).
fillpoint(r2, xy(304,41), 42.0).
fillpoint(r2, xy(425,41), 42.0).
fillpoint(r2, xy(310,40), 41.0).
fillpoint(r2, xy(419,40), 41.0).
fillpoint(r2, xy(321,40), 40.0).
border(r2).
region(r7, '#2ecc40', 82000, centroid(355,372)).
perimeter(r7, 2020).
polygon(r7, [xy(539,500),xy(190,500),xy(190,400),xy(140,399),xy(140,250),xy(339,250),xy(340,299),xy(290,300),xy(290,399),xy(240,400),xy(240,450),xy(339,450),xy(340,300),xy(389,300),xy(390,250),xy(539,250),xy(539,500)]).
hole(r7, [xy(220,339),xy(220,330),xy(229,330),xy(230,320),xy(220,320),xy(219,310),xy(210,310),xy(210,319),xy(200,320),xy(200,329),xy(209,330),xy(210,340),xy(220,339)]).
midline(r7, [xy(334,475),xy(243,475),xy(230,474),xy(218,469),xy(214,449),xy(215,377),xy(213,374),xy(180,362),xy(171,344),xy(169,328),xy(170,310),xy(174,296),xy(179,289)]).
midline(r7, [xy(178,361),xy(179,360)]).
midline(r7, [xy(335,475),xy(359,471),xy(380,458),xy(439,400),xy(439,390),xy(431,382),xy(401,361),xy(314,274),xy(280,275),xy(268,279),xy(253,288),xy(234,281),xy(219,279),xy(195,281),xy(180,287)]).
midline(r7, [xy(253,289),xy(258,305),xy(260,322),xy(259,339),xy(255,353),xy(249,362),xy(215,375)]).
midline(r7, [xy(440,389),xy(439,386),xy(453,359),xy(463,326)]).
fillpoint(r7, xy(440,393), 100.0).
fillpoint(r7, xy(453,358), 87.0).
fillpoint(r7, xy(459,340), 81.0).
fillpoint(r7, xy(460,336), 80.0).
fillpoint(r7, xy(461,332), 79.0).
fillpoint(r7, xy(462,328), 78.0).
fillpoint(r7, xy(252,288), 39.0).
fillpoint(r7, xy(178,288), 38.8).
fillpoint(r7, xy(178,361), 38.8).
fillpoint(r7, xy(251,361), 38.8).
fillpoint(r7, xy(215,375), 35.4).
fillpoint(r7, xy(192,367), 33.1).
fillpoint(r7, xy(237,367), 33.1).
fillpoint(r7, xy(207,372), 33.1).
fillpoint(r7, xy(222,372), 33.1).
fillpoint(r7, xy(195,368), 32.6).
fillpoint(r7, xy(234,368), 32.6).
fillpoint(r7, xy(204,371), 32.6).
fillpoint(r7, xy(225,371), 32.6).
fillpoint(r7, xy(198,369), 32.3).
fillpoint(r7, xy(231,369), 32.3).
fillpoint(r7, xy(201,370), 32.3).
fillpoint(r7, xy(228,370), 32.3).
fillpoint(r7, xy(196,281), 32.0).
fillpoint(r7, xy(233,281), 32.0).
fillpoint(r7, xy(171,306), 32.0).
fillpoint(r7, xy(258,306), 32.0).
fillpoint(r7, xy(171,343), 32.0).
fillpoint(r7, xy(258,343), 32.0).
fillpoint(r7, xy(202,280), 31.0).
fillpoint(r7, xy(228,280), 31.0).
fillpoint(r7, xy(170,312), 31.0).
fillpoint(r7, xy(259,312), 31.0).
fillpoint(r7, xy(170,338), 31.0).
fillpoint(r7, xy(259,338), 31.0).
fillpoint(r7, xy(211,280), 30.0).
fillpoint(r7, xy(169,325), 30.0).
fillpoint(r7, xy(259,325), 30.0).
fillpoint(r7, xy(219,470), 29.7).
fillpoint(r7, xy(271,278), 29.0).
fillpoint(r7, xy(218,468), 29.0).
fillpoint(r7, xy(221,471), 29.0).
fillpoint(r7, xy(358,471), 29.0).
fillpoint(r7, xy(274,277), 28.0).
fillpoint(r7, xy(217,465), 28.0).
fillpoint(r7, xy(224,472), 28.0).
fillpoint(r7, xy(355,472), 28.0).
fillpoint(r7, xy(277,276), 27.0).
fillpoint(r7, xy(216,462), 27.0).
fillpoint(r7, xy(227,473), 27.0).
fillpoint(r7, xy(352,473), 27.0).
fillpoint(r7, xy(282,275), 26.0).
fillpoint(r7, xy(215,458), 26.0).
fillpoint(r7, xy(232,474), 26.0).
fillpoint(r7, xy(348,474), 26.0).
fillpoint(r7, xy(291,275), 25.0).
fillpoint(r7, xy(214,425), 25.0).
fillpoint(r7, xy(241,475), 25.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(20,189),xy(20,500)]).
midline(r1, [xy(20,188),xy(20,19)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r17, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r17, 2200).
polygon(r17, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r17, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r17, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r17, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r17, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r17, [xy(524,635),xy(132,635),xy(126,634),xy(124,629),xy(125,605),xy(549,604),xy(553,605),xy(555,609),xy(555,632),xy(546,635),xy(525,634)]).
midline(r17, [xy(555,606),xy(560,604),xy(577,604),xy(583,605),xy(585,609),xy(585,631),xy(583,634),xy(560,635),xy(555,633)]).
midline(r17, [xy(585,606),xy(590,604),xy(615,606),xy(615,632),xy(613,634),xy(590,635),xy(585,633)]).
midline(r17, [xy(616,605),xy(635,605)]).
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
region(r10, '#ffdc00', 10000, centroid(302,387)).
perimeter(r10, 500).
polygon(r10, [xy(339,450),xy(240,449),xy(240,400),xy(290,399),xy(290,300),xy(340,300),xy(339,450)]).
midline(r10, [xy(314,405),xy(315,324)]).
midline(r10, [xy(314,406),xy(309,421),xy(289,425),xy(264,425)]).
fillpoint(r10, xy(310,420), 29.7).
fillpoint(r10, xy(311,418), 29.0).
fillpoint(r10, xy(308,421), 29.0).
fillpoint(r10, xy(312,415), 28.0).
fillpoint(r10, xy(305,422), 28.0).
fillpoint(r10, xy(313,412), 27.0).
fillpoint(r10, xy(302,423), 27.0).
fillpoint(r10, xy(314,408), 26.0).
fillpoint(r10, xy(298,424), 26.0).
fillpoint(r10, xy(315,361), 25.0).
fillpoint(r10, xy(264,425), 25.0).
region(r14, '#aaaaaa', 7600, centroid(58,581)).
perimeter(r14, 720).
polygon(r14, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
hole(r14, [xy(90,609),xy(89,550),xy(30,550),xy(30,570),xy(70,570),xy(70,610),xy(90,609)]).
hole(r14, [xy(50,609),xy(49,590),xy(30,590),xy(30,610),xy(50,609)]).
midline(r14, [xy(99,553),xy(99,544),xy(95,540),xy(31,539),xy(21,541),xy(19,551),xy(19,569),xy(23,580),xy(19,590),xy(21,618),xy(33,620),xy(55,619),xy(60,615),xy(60,590),xy(58,582),xy(49,579),xy(24,580)]).
midline(r14, [xy(100,554),xy(100,609),xy(98,617),xy(89,620),xy(70,620),xy(60,617)]).
fillpoint(r14, xy(22,580), 12.8).
fillpoint(r14, xy(60,617), 12.8).
fillpoint(r14, xy(22,541), 12.0).
fillpoint(r14, xy(98,541), 12.0).
fillpoint(r14, xy(58,581), 12.0).
fillpoint(r14, xy(21,618), 12.0).
fillpoint(r14, xy(97,618), 12.0).
fillpoint(r14, xy(25,540), 11.0).
fillpoint(r14, xy(94,540), 11.0).
fillpoint(r14, xy(20,545), 11.0).
fillpoint(r14, xy(99,545), 11.0).
fillpoint(r14, xy(20,574), 11.0).
fillpoint(r14, xy(54,580), 11.0).
fillpoint(r14, xy(20,585), 11.0).
fillpoint(r14, xy(59,585), 11.0).
fillpoint(r14, xy(20,614), 11.0).
fillpoint(r14, xy(99,614), 11.0).
fillpoint(r14, xy(25,619), 11.0).
fillpoint(r14, xy(54,619), 11.0).
fillpoint(r14, xy(65,619), 11.0).
fillpoint(r14, xy(94,619), 11.0).
fillpoint(r14, xy(31,540), 10.0).
fillpoint(r14, xy(19,560), 10.0).
fillpoint(r14, xy(99,580), 10.0).
fillpoint(r14, xy(31,580), 10.0).
fillpoint(r14, xy(19,600), 10.0).
fillpoint(r14, xy(59,600), 10.0).
fillpoint(r14, xy(31,620), 10.0).
fillpoint(r14, xy(71,620), 10.0).
region(r3, '#2ecc40', 7200, centroid(364,172)).
perimeter(r3, 800).
polygon(r3, [xy(389,250),xy(340,249),xy(340,170),xy(320,169),xy(320,80),xy(410,80),xy(410,169),xy(390,170),xy(389,250)]).
hole(r3, [xy(400,159),xy(399,90),xy(330,90),xy(330,160),xy(400,159)]).
midline(r3, [xy(372,84),xy(330,84),xy(325,85),xy(324,90),xy(325,164),xy(345,166),xy(364,184),xy(365,225)]).
midline(r3, [xy(365,184),xy(384,166),xy(403,164),xy(405,159),xy(404,86),xy(399,84),xy(373,85)]).
fillpoint(r3, xy(364,205), 25.0).
region(r19, '#5a5a5a', 6600, centroid(384,620)).
perimeter(r19, 700).
polygon(r19, [xy(549,630),xy(220,630),xy(220,610),xy(549,610),xy(549,630)]).
midline(r19, [xy(435,620),xy(229,620)]).
midline(r19, [xy(436,619),xy(540,620)]).
fillpoint(r19, xy(229,620), 10.0).
region(r4, '#aaaaaa', 4300, centroid(364,125)).
perimeter(r4, 440).
polygon(r4, [xy(399,160),xy(330,159),xy(330,90),xy(400,90),xy(399,160)]).
hole(r4, [xy(380,139),xy(379,110),xy(350,110),xy(350,120),xy(370,120),xy(370,140),xy(380,139)]).
hole(r4, [xy(360,139),xy(359,130),xy(350,130),xy(350,140),xy(360,139)]).
midline(r4, [xy(389,142),xy(390,113),xy(389,104),xy(385,100),xy(351,99),xy(341,101),xy(339,110),xy(341,124),xy(339,139),xy(341,148),xy(350,150),xy(364,149),xy(364,126),xy(356,124),xy(342,125)]).
midline(r4, [xy(366,149),xy(385,149),xy(389,143)]).
fillpoint(r4, xy(342,101), 12.0).
fillpoint(r4, xy(388,101), 12.0).
fillpoint(r4, xy(341,148), 12.0).
fillpoint(r4, xy(387,148), 12.0).
fillpoint(r4, xy(345,100), 11.0).
fillpoint(r4, xy(384,100), 11.0).
fillpoint(r4, xy(340,105), 11.0).
fillpoint(r4, xy(389,105), 11.0).
fillpoint(r4, xy(340,125), 11.0).
fillpoint(r4, xy(340,144), 11.0).
fillpoint(r4, xy(389,144), 11.0).
fillpoint(r4, xy(345,149), 11.0).
fillpoint(r4, xy(365,149), 11.0).
fillpoint(r4, xy(384,149), 11.0).
fillpoint(r4, xy(351,100), 10.0).
fillpoint(r4, xy(339,115), 10.0).
fillpoint(r4, xy(389,125), 10.0).
fillpoint(r4, xy(339,135), 10.0).
fillpoint(r4, xy(351,150), 10.0).
fillpoint(r4, xy(371,150), 10.0).
fillpoint(r4, xy(364,125), 6.0).
fillpoint(r4, xy(351,125), 5.0).
fillpoint(r4, xy(364,135), 5.0).
region(r15, '#870c25', 2000, centroid(68,572)).
perimeter(r15, 240).
polygon(r15, [xy(89,610),xy(70,609),xy(69,570),xy(30,569),xy(30,550),xy(90,550),xy(89,610)]).
midline(r15, [xy(80,587),xy(80,600)]).
midline(r15, [xy(80,586),xy(80,570),xy(77,561),xy(69,559),xy(39,560)]).
fillpoint(r15, xy(78,561), 12.0).
fillpoint(r15, xy(74,560), 11.0).
fillpoint(r15, xy(79,565), 11.0).
fillpoint(r15, xy(39,560), 10.0).
fillpoint(r15, xy(79,586), 10.0).
region(r18, '#2ecc40', 1800, centroid(174,620)).
perimeter(r18, 220).
polygon(r18, [xy(219,630),xy(130,630),xy(130,610),xy(219,610),xy(219,630)]).
midline(r18, [xy(141,619),xy(139,620)]).
midline(r18, [xy(142,620),xy(210,620)]).
fillpoint(r18, xy(139,620), 10.0).
region(r9, '#870c25', 1500, centroid(364,284)).
perimeter(r9, 160).
polygon(r9, [xy(389,300),xy(340,300),xy(340,270),xy(389,270),xy(389,300)]).
midline(r9, [xy(366,284),xy(354,285)]).
midline(r9, [xy(367,284),xy(375,285)]).
fillpoint(r9, xy(354,285), 15.0).
region(r8, '#bebebe', 1000, centroid(364,260)).
perimeter(r8, 140).
polygon(r8, [xy(389,270),xy(340,270),xy(340,250),xy(389,250),xy(389,270)]).
midline(r8, [xy(359,260),xy(349,260)]).
midline(r8, [xy(360,260),xy(380,260)]).
fillpoint(r8, xy(349,260), 10.0).
region(r5, '#870c25', 500, centroid(368,120)).
perimeter(r5, 120).
polygon(r5, [xy(379,140),xy(370,139),xy(369,120),xy(350,119),xy(350,110),xy(380,110),xy(379,140)]).
midline(r5, [xy(375,130),xy(373,115),xy(354,115)]).
midline(r5, [xy(375,131),xy(375,135)]).
fillpoint(r5, xy(374,115), 6.0).
fillpoint(r5, xy(354,115), 5.0).
fillpoint(r5, xy(375,128), 5.0).
region(r16, '#870c25', 400, centroid(40,600)).
perimeter(r16, 80).
polygon(r16, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r16, [xy(39,599),xy(40,600)]).
fillpoint(r16, xy(39,600), 10.0).
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
region(r6, '#870c25', 100, centroid(354,134)).
perimeter(r6, 40).
polygon(r6, [xy(359,140),xy(350,139),xy(350,130),xy(360,130),xy(359,140)]).
midline(r6, [xy(355,135),xy(355,134)]).
fillpoint(r6, xy(354,135), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 470).
adjacent(r2, r7).
shared_edge(r2, r7, 1250).
adjacent(r2, r14).
shared_edge(r2, r14, 400).
adjacent(r2, r17).
shared_edge(r2, r17, 560).
adjacent(r3, r4).
shared_edge(r3, r4, 280).
adjacent(r3, r8).
shared_edge(r3, r8, 50).
adjacent(r4, r5).
shared_edge(r4, r5, 120).
adjacent(r4, r6).
shared_edge(r4, r6, 40).
adjacent(r7, r8).
shared_edge(r7, r8, 40).
adjacent(r7, r9).
shared_edge(r7, r9, 110).
adjacent(r7, r10).
shared_edge(r7, r10, 500).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r14, r15).
shared_edge(r14, r15, 240).
adjacent(r14, r16).
shared_edge(r14, r16, 80).
adjacent(r17, r18).
shared_edge(r17, r18, 200).
adjacent(r17, r19).
shared_edge(r17, r19, 680).
adjacent(r17, r20).
shared_edge(r17, r20, 80).
adjacent(r17, r21).
shared_edge(r17, r21, 80).
adjacent(r17, r22).
shared_edge(r17, r22, 60).
adjacent(r18, r19).
shared_edge(r18, r19, 20).

encloses(r4, r5).
encloses(r4, r6).
encloses(r7, r10).
encloses(r14, r15).
encloses(r14, r16).
encloses(r17, r20).
encloses(r17, r21).
