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
midline(r2, [xy(91,231),xy(97,210),xy(115,178),xy(164,124),xy(195,124),xy(252,181),xy(273,196),xy(297,207)]).
midline(r2, [xy(196,123),xy(252,68),xy(273,53),xy(295,43),xy(320,39),xy(409,39),xy(437,44),xy(449,49),xy(472,64),xy(525,114),xy(525,134),xy(489,170),xy(464,191),xy(432,207),xy(423,200),xy(423,202)]).
midline(r2, [xy(525,135),xy(553,164),xy(572,190),xy(582,210),xy(589,236),xy(589,513),xy(581,540),xy(559,548),xy(538,550),xy(190,550),xy(164,546),xy(159,539),xy(136,483),xy(122,464),xy(108,460),xy(97,439),xy(91,419),xy(89,397),xy(89,251),xy(91,232)]).
midline(r2, [xy(298,205),xy(300,204),xy(300,206)]).
midline(r2, [xy(163,546),xy(116,594),xy(114,601),xy(115,629),xy(113,634),xy(11,635),xy(5,633),xy(5,525),xy(39,525),xy(45,523),xy(108,461)]).
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
region(r3, '#2ecc40', 89200, centroid(360,353)).
perimeter(r3, 2820).
polygon(r3, [xy(539,500),xy(190,499),xy(190,400),xy(239,400),xy(240,450),xy(340,449),xy(339,300),xy(290,300),xy(289,400),xy(240,400),xy(239,350),xy(190,350),xy(189,400),xy(140,399),xy(140,250),xy(340,249),xy(340,170),xy(320,169),xy(320,80),xy(410,80),xy(410,169),xy(390,170),xy(390,250),xy(540,250),xy(539,500)]).
hole(r3, [xy(400,159),xy(399,90),xy(330,90),xy(330,160),xy(400,159)]).
hole(r3, [xy(220,339),xy(220,330),xy(229,330),xy(230,320),xy(220,320),xy(219,310),xy(210,310),xy(210,319),xy(200,320),xy(200,329),xy(209,330),xy(210,340),xy(220,339)]).
midline(r3, [xy(398,308),xy(364,274),xy(281,275),xy(270,278),xy(253,288),xy(234,281),xy(211,279),xy(195,281),xy(178,288),xy(171,305),xy(170,327),xy(165,340),xy(164,375),xy(165,375),xy(214,425),xy(265,374),xy(264,340),xy(261,330),xy(258,326),xy(254,330),xy(235,339),xy(229,339),xy(223,344),xy(210,345),xy(200,339),xy(194,339),xy(171,328)]).
midline(r3, [xy(215,426),xy(215,459),xy(218,469),xy(226,473),xy(240,475),xy(339,475),xy(353,473),xy(369,466),xy(389,450),xy(440,398),xy(439,349),xy(399,309)]).
midline(r3, [xy(259,325),xy(259,310),xy(253,289)]).
midline(r3, [xy(364,273),xy(365,188),xy(364,184),xy(345,166),xy(325,163),xy(324,92),xy(325,85),xy(330,84),xy(404,85),xy(404,163),xy(384,166),xy(365,184)]).
fillpoint(r3, xy(439,375), 100.0).
fillpoint(r3, xy(252,288), 39.0).
fillpoint(r3, xy(178,288), 38.8).
fillpoint(r3, xy(196,281), 32.0).
fillpoint(r3, xy(233,281), 32.0).
fillpoint(r3, xy(171,306), 32.0).
fillpoint(r3, xy(258,306), 32.0).
fillpoint(r3, xy(202,280), 31.0).
fillpoint(r3, xy(228,280), 31.0).
fillpoint(r3, xy(170,312), 31.0).
fillpoint(r3, xy(259,312), 31.0).
fillpoint(r3, xy(211,280), 30.0).
fillpoint(r3, xy(170,324), 30.0).
fillpoint(r3, xy(260,324), 30.0).
fillpoint(r3, xy(219,470), 29.7).
fillpoint(r3, xy(271,278), 29.0).
fillpoint(r3, xy(168,331), 29.0).
fillpoint(r3, xy(261,331), 29.0).
fillpoint(r3, xy(218,468), 29.0).
fillpoint(r3, xy(221,471), 29.0).
fillpoint(r3, xy(358,471), 29.0).
fillpoint(r3, xy(274,277), 28.0).
fillpoint(r3, xy(167,334), 28.0).
fillpoint(r3, xy(262,334), 28.0).
fillpoint(r3, xy(217,465), 28.0).
fillpoint(r3, xy(224,472), 28.0).
fillpoint(r3, xy(355,472), 28.0).
fillpoint(r3, xy(277,276), 27.0).
fillpoint(r3, xy(166,337), 27.0).
fillpoint(r3, xy(263,337), 27.0).
fillpoint(r3, xy(216,462), 27.0).
fillpoint(r3, xy(227,473), 27.0).
fillpoint(r3, xy(352,473), 27.0).
fillpoint(r3, xy(282,275), 26.0).
fillpoint(r3, xy(165,342), 26.0).
fillpoint(r3, xy(264,342), 26.0).
fillpoint(r3, xy(215,458), 26.0).
fillpoint(r3, xy(232,474), 26.0).
fillpoint(r3, xy(348,474), 26.0).
fillpoint(r3, xy(365,216), 25.0).
fillpoint(r3, xy(291,275), 25.0).
fillpoint(r3, xy(165,363), 25.0).
fillpoint(r3, xy(265,363), 25.0).
fillpoint(r3, xy(215,436), 25.0).
fillpoint(r3, xy(241,475), 25.0).
region(r1, '#aaaaaa', 20800, centroid(20,260)).
perimeter(r1, 1120).
polygon(r1, [xy(40,0),xy(40,519),xy(0,520)]).
midline(r1, [xy(19,364),xy(20,19)]).
midline(r1, [xy(19,365),xy(20,500)]).
fillpoint(r1, xy(19,260), 20.0).
border(r1).
region(r16, '#aaaaaa', 11200, centroid(386,620)).
perimeter(r16, 2200).
polygon(r16, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r16, [xy(120,639),xy(120,600),xy(639,600)]).
hole(r16, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r16, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r16, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r16, [xy(169,605),xy(125,605),xy(125,634),xy(132,635),xy(553,634),xy(555,630),xy(555,607),xy(549,604),xy(170,605)]).
midline(r16, [xy(555,606),xy(560,604),xy(579,604),xy(583,605),xy(585,610),xy(585,630),xy(583,634),xy(560,635),xy(555,633)]).
midline(r16, [xy(585,606),xy(590,604),xy(606,604),xy(613,605),xy(615,609),xy(615,632),xy(613,634),xy(590,635),xy(585,633)]).
midline(r16, [xy(615,606),xy(623,604),xy(635,605)]).
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
region(r7, '#ffdc00', 10000, centroid(302,387)).
perimeter(r7, 500).
polygon(r7, [xy(339,450),xy(240,449),xy(240,400),xy(290,399),xy(290,300),xy(340,300),xy(339,450)]).
midline(r7, [xy(314,405),xy(315,324)]).
midline(r7, [xy(314,406),xy(312,416),xy(306,422),xy(287,425),xy(264,425)]).
fillpoint(r7, xy(310,420), 29.7).
fillpoint(r7, xy(311,418), 29.0).
fillpoint(r7, xy(308,421), 29.0).
fillpoint(r7, xy(312,415), 28.0).
fillpoint(r7, xy(305,422), 28.0).
fillpoint(r7, xy(313,412), 27.0).
fillpoint(r7, xy(302,423), 27.0).
fillpoint(r7, xy(314,408), 26.0).
fillpoint(r7, xy(298,424), 26.0).
fillpoint(r7, xy(315,361), 25.0).
fillpoint(r7, xy(264,425), 25.0).
region(r13, '#aaaaaa', 7600, centroid(61,581)).
perimeter(r13, 720).
polygon(r13, [xy(109,630),xy(10,629),xy(10,530),xy(110,530),xy(109,630)]).
hole(r13, [xy(50,609),xy(50,570),xy(89,570),xy(89,550),xy(30,550),xy(30,609),xy(50,609)]).
hole(r13, [xy(90,609),xy(89,590),xy(70,590),xy(70,610),xy(90,609)]).
midline(r13, [xy(19,563),xy(19,607),xy(21,618),xy(49,620),xy(59,617),xy(61,581),xy(70,579),xy(95,580),xy(98,577),xy(100,567),xy(98,542),xy(89,539),xy(24,540),xy(20,544),xy(20,562)]).
midline(r13, [xy(61,617),xy(70,620),xy(89,620),xy(98,617),xy(100,590),xy(97,580)]).
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
region(r18, '#5a5a5a', 7200, centroid(370,620)).
perimeter(r18, 760).
polygon(r18, [xy(549,630),xy(190,630),xy(190,610),xy(549,610),xy(549,630)]).
midline(r18, [xy(405,620),xy(199,620)]).
midline(r18, [xy(406,619),xy(540,620)]).
fillpoint(r18, xy(199,620), 10.0).
region(r4, '#aaaaaa', 4300, centroid(364,125)).
perimeter(r4, 440).
polygon(r4, [xy(399,160),xy(330,159),xy(330,90),xy(400,90),xy(399,160)]).
hole(r4, [xy(380,139),xy(379,110),xy(350,110),xy(350,120),xy(370,120),xy(370,140),xy(380,139)]).
hole(r4, [xy(360,139),xy(359,130),xy(350,130),xy(350,140),xy(360,139)]).
midline(r4, [xy(389,142),xy(390,113),xy(389,104),xy(385,100),xy(350,99),xy(341,101),xy(339,114),xy(341,148),xy(363,149),xy(365,145),xy(364,126),xy(359,124),xy(342,125)]).
midline(r4, [xy(389,143),xy(385,149),xy(365,149)]).
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
region(r14, '#870c25', 2000, centroid(52,572)).
perimeter(r14, 240).
polygon(r14, [xy(49,610),xy(30,609),xy(30,550),xy(89,550),xy(89,570),xy(50,570),xy(49,610)]).
midline(r14, [xy(39,586),xy(41,561),xy(55,559),xy(80,560)]).
midline(r14, [xy(40,587),xy(40,600)]).
fillpoint(r14, xy(42,561), 12.0).
fillpoint(r14, xy(45,560), 11.0).
fillpoint(r14, xy(40,565), 11.0).
fillpoint(r14, xy(51,560), 10.0).
fillpoint(r14, xy(39,586), 10.0).
region(r12, '#870c25', 1500, centroid(214,384)).
perimeter(r12, 160).
polygon(r12, [xy(239,400),xy(190,400),xy(190,370),xy(239,370),xy(239,400)]).
midline(r12, [xy(216,384),xy(204,385)]).
midline(r12, [xy(217,384),xy(225,385)]).
fillpoint(r12, xy(204,385), 15.0).
region(r17, '#2ecc40', 1200, centroid(160,620)).
perimeter(r17, 160).
polygon(r17, [xy(189,630),xy(130,630),xy(130,610),xy(189,610),xy(189,630)]).
midline(r17, [xy(150,619),xy(139,620)]).
midline(r17, [xy(151,619),xy(180,620)]).
fillpoint(r17, xy(139,620), 10.0).
region(r11, '#bebebe', 1000, centroid(214,360)).
perimeter(r11, 140).
polygon(r11, [xy(239,370),xy(190,370),xy(190,350),xy(239,350),xy(239,370)]).
midline(r11, [xy(220,360),xy(199,360)]).
midline(r11, [xy(221,359),xy(230,360)]).
fillpoint(r11, xy(199,360), 10.0).
region(r5, '#870c25', 500, centroid(368,120)).
perimeter(r5, 120).
polygon(r5, [xy(379,140),xy(370,139),xy(369,120),xy(350,119),xy(350,110),xy(380,110),xy(379,140)]).
midline(r5, [xy(369,114),xy(354,115)]).
midline(r5, [xy(370,115),xy(374,115),xy(375,135)]).
fillpoint(r5, xy(374,115), 6.0).
fillpoint(r5, xy(354,115), 5.0).
fillpoint(r5, xy(375,128), 5.0).
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
region(r6, '#870c25', 100, centroid(354,134)).
perimeter(r6, 40).
polygon(r6, [xy(359,140),xy(350,139),xy(350,130),xy(360,130),xy(359,140)]).
midline(r6, [xy(355,135),xy(355,134)]).
fillpoint(r6, xy(354,135), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 560).
adjacent(r2, r3).
shared_edge(r2, r3, 1720).
adjacent(r2, r13).
shared_edge(r2, r13, 400).
adjacent(r2, r16).
shared_edge(r2, r16, 560).
adjacent(r3, r4).
shared_edge(r3, r4, 280).
adjacent(r3, r7).
shared_edge(r3, r7, 500).
adjacent(r3, r11).
shared_edge(r3, r11, 90).
adjacent(r3, r12).
shared_edge(r3, r12, 110).
adjacent(r4, r5).
shared_edge(r4, r5, 120).
adjacent(r4, r6).
shared_edge(r4, r6, 40).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r13, r14).
shared_edge(r13, r14, 240).
adjacent(r13, r15).
shared_edge(r13, r15, 80).
adjacent(r16, r17).
shared_edge(r16, r17, 140).
adjacent(r16, r18).
shared_edge(r16, r18, 740).
adjacent(r16, r19).
shared_edge(r16, r19, 80).
adjacent(r16, r20).
shared_edge(r16, r20, 80).
adjacent(r16, r21).
shared_edge(r16, r21, 60).
adjacent(r17, r18).
shared_edge(r17, r18, 20).

encloses(r4, r5).
encloses(r4, r6).
encloses(r3, r7).
encloses(r13, r14).
encloses(r13, r15).
encloses(r16, r19).
encloses(r16, r20).
