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

region(r1, '#aaaaaa', 289400, centroid(305,373)).
perimeter(r1, 4760).
polygon(r1, [xy(200,0),xy(200,9),xy(190,10),xy(190,19),xy(180,20),xy(180,39),xy(170,40),xy(170,79),xy(160,80),xy(160,159),xy(170,160),xy(170,199),xy(180,200),xy(180,219),xy(189,220),xy(190,230),xy(200,230),xy(200,249),xy(209,250),xy(210,259),xy(219,260),xy(220,269),xy(229,270),xy(230,280),xy(249,280),xy(250,289),xy(259,290),xy(260,300),xy(279,300),xy(280,310),xy(319,310),xy(320,320),xy(399,320),xy(400,310),xy(439,310),xy(440,300),xy(459,300),xy(460,290),xy(470,289),xy(470,280),xy(489,280),xy(490,270),xy(499,270),xy(500,260),xy(509,260),xy(510,250),xy(520,249),xy(520,230),xy(529,230),xy(530,220),xy(540,219),xy(540,200),xy(550,199),xy(550,160),xy(560,159),xy(560,80),xy(550,79),xy(550,40),xy(540,39),xy(540,20),xy(530,20),xy(530,10),xy(520,9),xy(520,0)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(79,79),xy(80,176),xy(86,204),xy(85,217),xy(89,240),xy(112,321),xy(138,384),xy(148,401)]).
midline(r1, [xy(87,217),xy(105,199),xy(97,196),xy(87,203)]).
midline(r1, [xy(148,403),xy(157,418),xy(135,431),xy(132,430),xy(82,467),xy(29,520),xy(17,537),xy(14,550),xy(15,576),xy(17,579),xy(14,592),xy(14,608),xy(17,622),xy(30,625),xy(49,625),xy(60,622),xy(59,599),xy(39,579),xy(18,579)]).
midline(r1, [xy(88,220),xy(109,199),xy(106,198)]).
midline(r1, [xy(112,316),xy(179,249),xy(177,248),xy(112,313)]).
midline(r1, [xy(179,247),xy(180,248)]).
midline(r1, [xy(61,623),xy(89,625),xy(102,622),xy(109,617),xy(110,602),xy(117,585),xy(148,549),xy(178,496),xy(178,491),xy(188,473),xy(187,470),xy(193,461),xy(193,455),xy(197,449),xy(157,419)]).
midline(r1, [xy(195,458),xy(194,459)]).
midline(r1, [xy(198,448),xy(216,452),xy(282,386),xy(281,376),xy(292,353),xy(292,345),xy(297,340),xy(297,336),xy(299,336)]).
midline(r1, [xy(294,347),xy(293,348)]).
midline(r1, [xy(285,373),xy(283,379)]).
midline(r1, [xy(100,196),xy(105,194),xy(104,197)]).
midline(r1, [xy(109,619),xy(124,633),xy(130,635),xy(548,635),xy(555,632),xy(555,525),xy(486,456),xy(423,464),xy(320,465),xy(286,463),xy(217,453)]).
midline(r1, [xy(556,526),xy(586,556),xy(584,560),xy(585,632),xy(577,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(219,452),xy(281,389)]).
midline(r1, [xy(486,455),xy(495,441),xy(436,382),xy(432,363),xy(424,345),xy(427,347)]).
midline(r1, [xy(430,356),xy(429,353)]).
midline(r1, [xy(432,361),xy(432,356)]).
midline(r1, [xy(433,359),xy(435,361),xy(433,366),xy(436,365)]).
midline(r1, [xy(496,441),xy(438,381),xy(435,368)]).
midline(r1, [xy(179,495),xy(179,494)]).
midline(r1, [xy(187,476),xy(188,478),xy(185,479),xy(185,484),xy(180,491)]).
midline(r1, [xy(440,381),xy(497,438),xy(526,391),xy(459,321),xy(527,389)]).
midline(r1, [xy(587,557),xy(615,586),xy(615,631),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(81,79),xy(105,58),xy(121,48),xy(123,51)]).
midline(r1, [xy(122,47),xy(142,29),xy(159,21)]).
midline(r1, [xy(160,19),xy(166,14),xy(174,10),xy(180,10),xy(186,5),xy(195,5)]).
midline(r1, [xy(107,194),xy(109,194),xy(109,197),xy(113,194),xy(110,193)]).
midline(r1, [xy(110,198),xy(116,193),xy(113,192)]).
midline(r1, [xy(131,433),xy(132,432)]).
midline(r1, [xy(528,387),xy(550,346),xy(566,307),xy(565,305),xy(571,295),xy(577,275),xy(577,267),xy(582,259),xy(592,222),xy(594,190),xy(590,186),xy(579,183),xy(570,177),xy(570,179)]).
midline(r1, [xy(586,187),xy(585,186)]).
midline(r1, [xy(595,189),xy(600,158),xy(599,68),xy(593,48),xy(586,54),xy(576,59),xy(572,58),xy(569,61),xy(572,60)]).
midline(r1, [xy(594,48),xy(595,45),xy(581,32),xy(562,22),xy(553,14),xy(545,10),xy(539,10),xy(533,5),xy(524,5)]).
midline(r1, [xy(593,50),xy(589,53)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(117,192),xy(121,189),xy(123,190),xy(120,192)]).
midline(r1, [xy(87,206),xy(94,199)]).
midline(r1, [xy(125,51),xy(126,52)]).
fillpoint(r1, xy(196,448), 162.0).
fillpoint(r1, xy(194,447), 161.7).
fillpoint(r1, xy(200,449), 161.0).
fillpoint(r1, xy(204,450), 160.0).
fillpoint(r1, xy(208,451), 159.0).
fillpoint(r1, xy(177,434), 158.5).
fillpoint(r1, xy(173,431), 158.0).
fillpoint(r1, xy(212,452), 158.0).
fillpoint(r1, xy(157,419), 157.8).
fillpoint(r1, xy(160,421), 157.7).
fillpoint(r1, xy(169,428), 157.7).
fillpoint(r1, xy(164,424), 157.6).
fillpoint(r1, xy(165,425), 157.6).
fillpoint(r1, xy(217,453), 157.0).
fillpoint(r1, xy(222,454), 156.0).
fillpoint(r1, xy(227,455), 155.0).
fillpoint(r1, xy(234,456), 154.0).
fillpoint(r1, xy(486,456), 154.0).
fillpoint(r1, xy(240,457), 153.0).
fillpoint(r1, xy(479,457), 153.0).
fillpoint(r1, xy(248,458), 152.0).
fillpoint(r1, xy(471,458), 152.0).
fillpoint(r1, xy(260,459), 151.0).
fillpoint(r1, xy(460,459), 151.0).
fillpoint(r1, xy(268,460), 150.0).
fillpoint(r1, xy(451,460), 150.0).
fillpoint(r1, xy(274,461), 149.0).
fillpoint(r1, xy(446,461), 149.0).
fillpoint(r1, xy(281,462), 148.0).
fillpoint(r1, xy(439,462), 148.0).
fillpoint(r1, xy(289,463), 147.0).
fillpoint(r1, xy(431,463), 147.0).
fillpoint(r1, xy(300,464), 146.0).
fillpoint(r1, xy(420,464), 146.0).
fillpoint(r1, xy(321,465), 145.0).
fillpoint(r1, xy(115,328), 116.0).
fillpoint(r1, xy(112,320), 113.0).
fillpoint(r1, xy(111,317), 112.0).
fillpoint(r1, xy(110,314), 111.0).
fillpoint(r1, xy(109,311), 110.0).
fillpoint(r1, xy(108,308), 109.0).
fillpoint(r1, xy(107,304), 108.0).
fillpoint(r1, xy(104,292), 105.0).
fillpoint(r1, xy(99,278), 100.0).
fillpoint(r1, xy(96,268), 97.0).
fillpoint(r1, xy(95,264), 96.0).
fillpoint(r1, xy(94,260), 95.0).
fillpoint(r1, xy(93,255), 94.0).
fillpoint(r1, xy(92,250), 93.0).
fillpoint(r1, xy(90,243), 91.0).
fillpoint(r1, xy(89,239), 90.0).
fillpoint(r1, xy(88,234), 89.0).
fillpoint(r1, xy(87,229), 88.0).
fillpoint(r1, xy(86,223), 87.0).
fillpoint(r1, xy(553,338), 87.0).
fillpoint(r1, xy(85,215), 86.0).
fillpoint(r1, xy(84,198), 85.0).
fillpoint(r1, xy(83,193), 84.0).
fillpoint(r1, xy(82,188), 83.0).
fillpoint(r1, xy(81,182), 82.0).
fillpoint(r1, xy(80,174), 81.0).
fillpoint(r1, xy(79,119), 80.0).
fillpoint(r1, xy(575,282), 65.0).
fillpoint(r1, xy(577,274), 63.0).
fillpoint(r1, xy(578,269), 62.0).
fillpoint(r1, xy(582,258), 58.0).
fillpoint(r1, xy(586,246), 54.0).
fillpoint(r1, xy(587,242), 53.0).
fillpoint(r1, xy(588,238), 52.0).
fillpoint(r1, xy(589,232), 51.0).
fillpoint(r1, xy(590,228), 50.0).
fillpoint(r1, xy(592,221), 48.0).
fillpoint(r1, xy(593,216), 47.0).
fillpoint(r1, xy(594,210), 46.0).
fillpoint(r1, xy(595,48), 45.0).
fillpoint(r1, xy(594,193), 45.0).
fillpoint(r1, xy(596,56), 44.0).
fillpoint(r1, xy(596,183), 44.0).
fillpoint(r1, xy(598,64), 42.0).
fillpoint(r1, xy(598,175), 42.0).
fillpoint(r1, xy(599,70), 41.0).
fillpoint(r1, xy(599,169), 41.0).
border(r1).
region(r2, '#ffdc00', 34100, centroid(400,88)).
perimeter(r2, 1560).
polygon(r2, [xy(520,0),xy(520,9),xy(529,10),xy(530,19),xy(540,20),xy(540,39),xy(549,40),xy(550,49),xy(490,50),xy(490,279),xy(470,280),xy(470,289),xy(460,290),xy(459,300),xy(440,299),xy(440,190),xy(390,189),xy(390,150),xy(440,149),xy(440,50),xy(390,50),xy(390,99),xy(340,100),xy(339,50),xy(170,50),xy(170,40),xy(180,39),xy(180,20),xy(189,20),xy(190,10),xy(200,9),xy(200,0)]).
midline(r2, [xy(464,154),xy(465,32),xy(463,30),xy(449,25),xy(438,24),xy(391,24),xy(376,26),xy(365,31),xy(353,26),xy(339,24),xy(222,25),xy(217,20),xy(216,18),xy(218,18)]).
midline(r2, [xy(364,32),xy(365,75)]).
midline(r2, [xy(464,155),xy(460,170),xy(409,170)]).
midline(r2, [xy(461,171),xy(465,190),xy(465,255),xy(457,267),xy(450,284),xy(450,290)]).
midline(r2, [xy(219,25),xy(194,34),xy(183,44),xy(174,45)]).
midline(r2, [xy(465,31),xy(480,25),xy(499,24),xy(525,34),xy(536,44),xy(545,45)]).
fillpoint(r2, xy(365,31), 31.4).
fillpoint(r2, xy(465,31), 31.4).
fillpoint(r2, xy(358,28), 29.0).
fillpoint(r2, xy(371,28), 29.0).
fillpoint(r2, xy(458,28), 29.0).
fillpoint(r2, xy(471,28), 29.0).
fillpoint(r2, xy(460,170), 29.0).
fillpoint(r2, xy(355,27), 28.0).
fillpoint(r2, xy(374,27), 28.0).
fillpoint(r2, xy(455,27), 28.0).
fillpoint(r2, xy(474,27), 28.0).
fillpoint(r2, xy(462,165), 28.0).
fillpoint(r2, xy(462,174), 28.0).
fillpoint(r2, xy(352,26), 27.0).
fillpoint(r2, xy(377,26), 27.0).
fillpoint(r2, xy(452,26), 27.0).
fillpoint(r2, xy(477,26), 27.0).
fillpoint(r2, xy(463,162), 27.0).
fillpoint(r2, xy(463,177), 27.0).
fillpoint(r2, xy(348,25), 26.0).
fillpoint(r2, xy(382,25), 26.0).
fillpoint(r2, xy(448,25), 26.0).
fillpoint(r2, xy(482,25), 26.0).
fillpoint(r2, xy(464,158), 26.0).
fillpoint(r2, xy(464,182), 26.0).
fillpoint(r2, xy(219,25), 25.0).
fillpoint(r2, xy(391,25), 25.0).
fillpoint(r2, xy(491,25), 25.0).
fillpoint(r2, xy(365,63), 25.0).
fillpoint(r2, xy(464,100), 25.0).
fillpoint(r2, xy(465,223), 25.0).
fillpoint(r2, xy(409,170), 20.0).
fillpoint(r2, xy(195,34), 16.0).
fillpoint(r2, xy(524,34), 16.0).
fillpoint(r2, xy(455,274), 16.0).
fillpoint(r2, xy(450,285), 11.0).
border(r2).
region(r14, '#2ecc40', 21700, centroid(353,251)).
perimeter(r14, 920).
polygon(r14, [xy(399,320),xy(320,320),xy(319,310),xy(290,310),xy(289,300),xy(260,300),xy(260,290),xy(250,289),xy(249,280),xy(230,280),xy(230,270),xy(220,270),xy(219,260),xy(210,259),xy(210,250),xy(289,250),xy(290,200),xy(339,200),xy(340,150),xy(389,150),xy(390,199),xy(440,200),xy(440,309),xy(400,310),xy(399,320)]).
hole(r14, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r14, [xy(296,275),xy(279,275),xy(256,265),xy(244,265),xy(235,260),xy(229,260),xy(223,255),xy(214,255)]).
midline(r14, [xy(279,276),xy(276,281),xy(279,279)]).
midline(r14, [xy(297,274),xy(312,275),xy(314,270),xy(295,243),xy(295,205),xy(333,205),xy(347,217),xy(358,221),xy(358,223)]).
midline(r14, [xy(360,222),xy(365,224),xy(365,174)]).
midline(r14, [xy(365,225),xy(384,255),xy(370,269),xy(348,278),xy(315,274),xy(307,289),xy(309,289)]).
midline(r14, [xy(348,279),xy(347,281),xy(346,279)]).
midline(r14, [xy(346,282),xy(344,284),xy(346,284)]).
midline(r14, [xy(370,270),xy(370,276),xy(372,276)]).
midline(r14, [xy(372,278),xy(377,289),xy(376,291),xy(378,291)]).
fillpoint(r14, xy(383,256), 56.6).
fillpoint(r14, xy(356,275), 45.0).
fillpoint(r14, xy(353,276), 44.0).
fillpoint(r14, xy(328,275), 36.0).
fillpoint(r14, xy(314,275), 35.0).
fillpoint(r14, xy(365,186), 25.0).
fillpoint(r14, xy(279,275), 25.0).
fillpoint(r14, xy(255,265), 16.0).
fillpoint(r14, xy(248,264), 15.0).
region(r3, '#2ecc40', 18800, centroid(240,111)).
perimeter(r3, 760).
polygon(r3, [xy(239,200),xy(170,199),xy(170,160),xy(160,159),xy(160,80),xy(170,79),xy(170,50),xy(339,50),xy(340,149),xy(290,150),xy(290,100),xy(240,100),xy(239,200)]).
midline(r3, [xy(203,94),xy(207,85),xy(230,75),xy(289,74),xy(303,76),xy(310,79),xy(314,90),xy(315,125)]).
midline(r3, [xy(203,95),xy(199,106),xy(199,132),xy(204,149),xy(205,165)]).
fillpoint(r3, xy(199,120), 40.0).
fillpoint(r3, xy(202,98), 38.1).
fillpoint(r3, xy(202,141), 38.0).
fillpoint(r3, xy(203,95), 37.3).
fillpoint(r3, xy(205,88), 37.0).
fillpoint(r3, xy(204,91), 37.0).
fillpoint(r3, xy(203,145), 37.0).
fillpoint(r3, xy(204,151), 36.0).
fillpoint(r3, xy(205,163), 35.0).
fillpoint(r3, xy(310,79), 29.7).
fillpoint(r3, xy(221,78), 29.0).
fillpoint(r3, xy(308,78), 29.0).
fillpoint(r3, xy(311,81), 29.0).
fillpoint(r3, xy(224,77), 28.0).
fillpoint(r3, xy(305,77), 28.0).
fillpoint(r3, xy(312,84), 28.0).
fillpoint(r3, xy(227,76), 27.0).
fillpoint(r3, xy(302,76), 27.0).
fillpoint(r3, xy(313,87), 27.0).
fillpoint(r3, xy(232,75), 26.0).
fillpoint(r3, xy(298,75), 26.0).
fillpoint(r3, xy(314,92), 26.0).
fillpoint(r3, xy(241,75), 25.0).
fillpoint(r3, xy(315,113), 25.0).
region(r10, '#ffdc00', 12500, centroid(264,184)).
perimeter(r10, 620).
polygon(r10, [xy(289,250),xy(200,250),xy(200,230),xy(190,230),xy(190,220),xy(180,219),xy(180,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r10, [xy(285,174),xy(273,175),xy(268,169),xy(264,148),xy(265,124)]).
midline(r10, [xy(271,175),xy(266,186),xy(264,208),xy(259,221),xy(249,224),xy(224,225),xy(212,217),xy(195,210),xy(189,210)]).
midline(r10, [xy(286,175),xy(315,175)]).
fillpoint(r10, xy(271,175), 31.4).
fillpoint(r10, xy(260,220), 29.7).
fillpoint(r10, xy(268,168), 29.0).
fillpoint(r10, xy(268,181), 29.0).
fillpoint(r10, xy(261,218), 29.0).
fillpoint(r10, xy(258,221), 29.0).
fillpoint(r10, xy(267,165), 28.0).
fillpoint(r10, xy(267,184), 28.0).
fillpoint(r10, xy(262,215), 28.0).
fillpoint(r10, xy(255,222), 28.0).
fillpoint(r10, xy(266,162), 27.0).
fillpoint(r10, xy(266,187), 27.0).
fillpoint(r10, xy(263,212), 27.0).
fillpoint(r10, xy(252,223), 27.0).
fillpoint(r10, xy(265,158), 26.0).
fillpoint(r10, xy(265,192), 26.0).
fillpoint(r10, xy(264,208), 26.0).
fillpoint(r10, xy(248,224), 26.0).
fillpoint(r10, xy(265,136), 25.0).
fillpoint(r10, xy(291,175), 25.0).
fillpoint(r10, xy(224,225), 25.0).
fillpoint(r10, xy(205,215), 16.0).
fillpoint(r10, xy(194,210), 11.0).
region(r5, '#2ecc40', 11100, centroid(520,149)).
perimeter(r5, 720).
polygon(r5, [xy(499,270),xy(490,269),xy(490,50),xy(549,50),xy(550,79),xy(560,80),xy(560,119),xy(550,120),xy(550,129),xy(560,130),xy(560,159),xy(550,160),xy(550,199),xy(540,200),xy(540,219),xy(530,220),xy(530,229),xy(520,230),xy(520,249),xy(510,250),xy(510,259),xy(500,260),xy(499,270)]).
hole(r5, [xy(530,89),xy(529,60),xy(500,60),xy(500,90),xy(530,89)]).
midline(r5, [xy(540,59),xy(529,54),xy(495,55),xy(495,93),xy(519,119),xy(522,145),xy(519,160),xy(520,177),xy(516,186),xy(516,197),xy(505,223),xy(505,235),xy(500,244),xy(500,250),xy(495,256),xy(495,265)]).
midline(r5, [xy(540,61),xy(540,85),xy(545,94),xy(542,102),xy(520,119)]).
midline(r5, [xy(517,198),xy(519,200),xy(516,200)]).
midline(r5, [xy(520,201),xy(519,202)]).
midline(r5, [xy(523,145),xy(545,145)]).
fillpoint(r5, xy(521,145), 32.0).
fillpoint(r5, xy(520,138), 31.0).
fillpoint(r5, xy(520,152), 31.0).
fillpoint(r5, xy(519,124), 30.0).
fillpoint(r5, xy(520,169), 30.0).
fillpoint(r5, xy(518,181), 29.0).
fillpoint(r5, xy(517,184), 28.0).
fillpoint(r5, xy(516,187), 27.0).
fillpoint(r5, xy(515,192), 26.0).
fillpoint(r5, xy(540,104), 18.6).
fillpoint(r5, xy(539,105), 18.6).
fillpoint(r5, xy(544,95), 16.0).
fillpoint(r5, xy(505,224), 16.0).
fillpoint(r5, xy(505,233), 15.0).
fillpoint(r5, xy(540,84), 11.0).
fillpoint(r5, xy(500,245), 11.0).
fillpoint(r5, xy(539,69), 10.0).
region(r21, '#2ecc40', 6800, centroid(300,620)).
perimeter(r21, 720).
polygon(r21, [xy(469,630),xy(130,630),xy(130,610),xy(469,610),xy(469,630)]).
midline(r21, [xy(185,619),xy(139,620)]).
midline(r21, [xy(186,620),xy(460,620)]).
fillpoint(r21, xy(139,620), 10.0).
region(r4, '#2ecc40', 4100, centroid(414,105)).
perimeter(r4, 420).
polygon(r4, [xy(439,150),xy(390,149),xy(390,50),xy(440,50),xy(439,150)]).
hole(r4, [xy(430,89),xy(429,60),xy(400,60),xy(400,90),xy(430,89)]).
midline(r4, [xy(395,67),xy(395,55),xy(429,54),xy(434,55),xy(435,60),xy(434,93),xy(415,114),xy(395,93),xy(395,68)]).
midline(r4, [xy(414,115),xy(415,125)]).
fillpoint(r4, xy(414,120), 25.0).
region(r19, '#7fdbff', 2000, centroid(64,576)).
perimeter(r19, 240).
polygon(r19, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r19, [xy(51,560),xy(39,560)]).
midline(r19, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r19, xy(58,561), 12.0).
fillpoint(r19, xy(61,578), 12.0).
fillpoint(r19, xy(78,581), 12.0).
fillpoint(r19, xy(54,560), 11.0).
fillpoint(r19, xy(59,565), 11.0).
fillpoint(r19, xy(60,574), 11.0).
fillpoint(r19, xy(65,579), 11.0).
fillpoint(r19, xy(74,580), 11.0).
fillpoint(r19, xy(79,585), 11.0).
fillpoint(r19, xy(39,560), 10.0).
fillpoint(r19, xy(79,596), 10.0).
region(r22, '#5a5a5a', 1600, centroid(510,620)).
perimeter(r22, 200).
polygon(r22, [xy(549,630),xy(470,630),xy(470,610),xy(549,610),xy(549,630)]).
midline(r22, [xy(491,620),xy(479,620)]).
midline(r22, [xy(492,620),xy(540,620)]).
fillpoint(r22, xy(479,620), 10.0).
region(r12, '#870c25', 1500, centroid(364,134)).
perimeter(r12, 160).
polygon(r12, [xy(389,150),xy(340,150),xy(340,120),xy(389,120),xy(389,150)]).
midline(r12, [xy(360,135),xy(354,135)]).
midline(r12, [xy(361,134),xy(375,135)]).
fillpoint(r12, xy(354,135), 15.0).
region(r11, '#bebebe', 1000, centroid(364,110)).
perimeter(r11, 140).
polygon(r11, [xy(389,120),xy(340,120),xy(340,100),xy(389,100),xy(389,120)]).
midline(r11, [xy(359,110),xy(349,110)]).
midline(r11, [xy(360,110),xy(380,110)]).
fillpoint(r11, xy(349,110), 10.0).
region(r6, '#5a5a5a', 800, centroid(414,74)).
perimeter(r6, 160).
polygon(r6, [xy(429,90),xy(400,89),xy(400,60),xy(430,60),xy(429,90)]).
hole(r6, [xy(420,79),xy(419,70),xy(410,70),xy(410,80),xy(420,79)]).
midline(r6, [xy(419,64),xy(405,65),xy(405,84),xy(417,85),xy(424,83),xy(424,66),xy(420,65)]).
fillpoint(r6, xy(406,65), 6.0).
fillpoint(r6, xy(424,65), 6.0).
fillpoint(r6, xy(405,84), 6.0).
fillpoint(r6, xy(423,84), 6.0).
fillpoint(r6, xy(411,65), 5.0).
fillpoint(r6, xy(404,75), 5.0).
fillpoint(r6, xy(424,75), 5.0).
fillpoint(r6, xy(411,85), 5.0).
region(r7, '#5a5a5a', 800, centroid(514,74)).
perimeter(r7, 160).
polygon(r7, [xy(529,90),xy(500,89),xy(500,60),xy(530,60),xy(529,90)]).
hole(r7, [xy(520,79),xy(519,70),xy(510,70),xy(510,80),xy(520,79)]).
midline(r7, [xy(519,64),xy(505,65),xy(505,84),xy(519,85),xy(524,83),xy(524,66),xy(520,65)]).
fillpoint(r7, xy(506,65), 6.0).
fillpoint(r7, xy(524,65), 6.0).
fillpoint(r7, xy(505,84), 6.0).
fillpoint(r7, xy(523,84), 6.0).
fillpoint(r7, xy(511,65), 5.0).
fillpoint(r7, xy(504,75), 5.0).
fillpoint(r7, xy(524,75), 5.0).
fillpoint(r7, xy(511,85), 5.0).
region(r16, '#5a5a5a', 800, centroid(314,224)).
perimeter(r16, 160).
polygon(r16, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r16, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r16, [xy(319,214),xy(305,215),xy(305,234),xy(318,235),xy(324,233),xy(325,220),xy(324,216),xy(320,215)]).
fillpoint(r16, xy(306,215), 6.0).
fillpoint(r16, xy(324,215), 6.0).
fillpoint(r16, xy(305,234), 6.0).
fillpoint(r16, xy(323,234), 6.0).
fillpoint(r16, xy(311,215), 5.0).
fillpoint(r16, xy(304,225), 5.0).
fillpoint(r16, xy(324,225), 5.0).
fillpoint(r16, xy(311,235), 5.0).
region(r15, '#0074d9', 500, centroid(414,194)).
perimeter(r15, 120).
polygon(r15, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r15, [xy(411,194),xy(394,195)]).
midline(r15, [xy(412,194),xy(435,195)]).
fillpoint(r15, xy(394,195), 5.0).
region(r20, '#7fdbff', 400, centroid(40,600)).
perimeter(r20, 80).
polygon(r20, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r20, [xy(39,599),xy(40,600)]).
fillpoint(r20, xy(39,600), 10.0).
region(r23, '#7fdbff', 400, centroid(570,620)).
perimeter(r23, 80).
polygon(r23, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r23, [xy(569,619),xy(570,620)]).
fillpoint(r23, xy(569,620), 10.0).
region(r24, '#7fdbff', 400, centroid(600,620)).
perimeter(r24, 80).
polygon(r24, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r24, [xy(599,619),xy(600,620)]).
fillpoint(r24, xy(599,620), 10.0).
region(r25, '#2ecc40', 400, centroid(630,620)).
perimeter(r25, 80).
polygon(r25, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r25, [xy(629,619),xy(630,620)]).
fillpoint(r25, xy(629,620), 10.0).
border(r25).
region(r8, '#2ecc40', 100, centroid(414,74)).
perimeter(r8, 40).
polygon(r8, [xy(419,80),xy(410,79),xy(410,70),xy(420,70),xy(419,80)]).
midline(r8, [xy(415,75),xy(415,74)]).
fillpoint(r8, xy(414,75), 5.0).
region(r9, '#2ecc40', 100, centroid(514,74)).
perimeter(r9, 40).
polygon(r9, [xy(519,80),xy(510,79),xy(510,70),xy(520,70),xy(519,80)]).
midline(r9, [xy(515,75),xy(515,74)]).
fillpoint(r9, xy(514,75), 5.0).
region(r17, '#2ecc40', 100, centroid(314,224)).
perimeter(r17, 40).
polygon(r17, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r17, [xy(315,225),xy(315,224)]).
fillpoint(r17, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 240).
adjacent(r1, r3).
shared_edge(r1, r3, 180).
adjacent(r1, r5).
shared_edge(r1, r5, 290).
adjacent(r1, r10).
shared_edge(r1, r10, 80).
adjacent(r1, r14).
shared_edge(r1, r14, 300).
adjacent(r1, r19).
shared_edge(r1, r19, 240).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 700).
adjacent(r1, r22).
shared_edge(r1, r22, 180).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 80).
adjacent(r1, r25).
shared_edge(r1, r25, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 220).
adjacent(r2, r4).
shared_edge(r2, r4, 250).
adjacent(r2, r5).
shared_edge(r2, r5, 280).
adjacent(r2, r11).
shared_edge(r2, r11, 50).
adjacent(r2, r14).
shared_edge(r2, r14, 140).
adjacent(r2, r15).
shared_edge(r2, r15, 60).
adjacent(r3, r10).
shared_edge(r3, r10, 310).
adjacent(r3, r11).
shared_edge(r3, r11, 20).
adjacent(r3, r12).
shared_edge(r3, r12, 30).
adjacent(r4, r6).
shared_edge(r4, r6, 120).
adjacent(r4, r11).
shared_edge(r4, r11, 20).
adjacent(r4, r12).
shared_edge(r4, r12, 30).
adjacent(r5, r7).
shared_edge(r5, r7, 120).
adjacent(r6, r8).
shared_edge(r6, r8, 40).
adjacent(r7, r9).
shared_edge(r7, r9, 40).
adjacent(r10, r14).
shared_edge(r10, r14, 230).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r12, r14).
shared_edge(r12, r14, 50).
adjacent(r14, r15).
shared_edge(r14, r15, 60).
adjacent(r14, r16).
shared_edge(r14, r16, 120).
adjacent(r16, r17).
shared_edge(r16, r17, 40).
adjacent(r21, r22).
shared_edge(r21, r22, 20).

encloses(r6, r8).
encloses(r7, r9).
encloses(r16, r17).
encloses(r1, r19).
encloses(r1, r20).
encloses(r1, r23).
encloses(r1, r24).
