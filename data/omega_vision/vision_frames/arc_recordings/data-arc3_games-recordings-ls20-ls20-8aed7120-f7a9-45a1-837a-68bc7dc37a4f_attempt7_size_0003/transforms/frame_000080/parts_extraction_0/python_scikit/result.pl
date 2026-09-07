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
midline(r1, [xy(499,434),xy(438,373),xy(436,376),xy(434,375),xy(435,372),xy(429,359),xy(430,356),xy(427,353),xy(427,347),xy(422,340),xy(427,343),xy(429,351)]).
midline(r1, [xy(434,367),xy(438,372)]).
midline(r1, [xy(533,347),xy(488,302),xy(487,297),xy(545,355),xy(543,357),xy(534,348)]).
midline(r1, [xy(544,358),xy(521,401),xy(499,436),xy(438,376),xy(436,382),xy(438,382)]).
midline(r1, [xy(499,437),xy(495,441),xy(438,384),xy(437,386),xy(494,444),xy(485,456),xy(433,463),xy(320,465),xy(238,457),xy(196,448),xy(155,419),xy(147,424),xy(145,423),xy(95,456),xy(29,520),xy(17,537),xy(14,550),xy(14,568),xy(17,580),xy(15,583),xy(14,609),xy(17,622),xy(30,625),xy(49,625),xy(59,622),xy(59,599),xy(38,579),xy(18,579)]).
midline(r1, [xy(157,418),xy(138,384),xy(115,329),xy(89,240),xy(86,224),xy(87,218),xy(85,216),xy(86,202),xy(80,176),xy(79,79),xy(105,58),xy(118,51),xy(145,27),xy(157,22),xy(174,10),xy(180,10),xy(186,5),xy(195,5)]).
midline(r1, [xy(88,219),xy(87,216),xy(104,199),xy(101,196),xy(97,196),xy(90,198),xy(87,203)]).
midline(r1, [xy(112,315),xy(114,313)]).
midline(r1, [xy(104,197),xy(107,196),xy(105,194),xy(102,196)]).
midline(r1, [xy(60,623),xy(89,625),xy(102,622),xy(109,617),xy(110,602),xy(117,585),xy(142,556),xy(159,532),xy(183,485),xy(182,482),xy(196,449)]).
midline(r1, [xy(89,201),xy(90,200)]).
midline(r1, [xy(217,451),xy(282,386),xy(283,373),xy(295,345),xy(293,342),xy(297,337),xy(295,342)]).
midline(r1, [xy(109,619),xy(124,633),xy(131,635),xy(553,634),xy(555,632),xy(555,525),xy(486,456)]).
midline(r1, [xy(556,526),xy(586,556),xy(584,558),xy(585,631),xy(579,635),xy(555,633)]).
midline(r1, [xy(546,354),xy(575,283),xy(541,249),xy(575,281)]).
midline(r1, [xy(576,279),xy(577,267),xy(583,256),xy(592,222),xy(595,189),xy(585,184),xy(583,185),xy(570,177),xy(570,179)]).
midline(r1, [xy(595,187),xy(600,158),xy(600,81),xy(598,63),xy(595,51),xy(593,49),xy(591,51),xy(593,51)]).
midline(r1, [xy(594,49),xy(594,44),xy(574,27),xy(560,21),xy(553,14),xy(545,10),xy(539,10),xy(529,4),xy(524,5)]).
midline(r1, [xy(88,224),xy(111,199),xy(108,197),xy(89,216),xy(108,199)]).
midline(r1, [xy(100,198),xy(101,198)]).
midline(r1, [xy(587,557),xy(615,585),xy(615,631),xy(613,634),xy(608,635),xy(585,633)]).
midline(r1, [xy(90,222),xy(113,199),xy(107,194)]).
midline(r1, [xy(110,193),xy(115,192),xy(115,195),xy(111,195)]).
midline(r1, [xy(117,193),xy(114,198)]).
midline(r1, [xy(116,191),xy(121,190),xy(120,195),xy(117,197)]).
midline(r1, [xy(121,194),xy(123,193),xy(123,188),xy(127,190),xy(124,192)]).
midline(r1, [xy(128,189),xy(130,188),xy(127,187)]).
midline(r1, [xy(131,187),xy(130,186)]).
midline(r1, [xy(110,197),xy(109,196)]).
midline(r1, [xy(122,49),xy(124,51),xy(129,50),xy(129,52)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(131,52),xy(134,55)]).
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
midline(r2, [xy(464,154),xy(465,33),xy(459,28),xy(438,24),xy(391,24),xy(376,26),xy(364,31),xy(353,26),xy(336,24),xy(220,24),xy(194,34),xy(183,44),xy(174,45)]).
midline(r2, [xy(464,155),xy(463,163),xy(459,170),xy(409,170)]).
midline(r2, [xy(460,170),xy(464,180),xy(465,191),xy(465,255),xy(457,267),xy(450,284),xy(450,290)]).
midline(r2, [xy(465,31),xy(480,25),xy(500,24),xy(525,34),xy(536,44),xy(545,45)]).
midline(r2, [xy(365,32),xy(365,75)]).
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
region(r11, '#2ecc40', 21700, centroid(353,251)).
perimeter(r11, 920).
polygon(r11, [xy(399,320),xy(320,320),xy(319,310),xy(290,310),xy(289,300),xy(260,300),xy(260,290),xy(250,289),xy(249,280),xy(230,280),xy(230,270),xy(220,270),xy(219,260),xy(210,259),xy(210,250),xy(289,250),xy(290,200),xy(339,200),xy(340,150),xy(389,150),xy(390,199),xy(440,200),xy(440,309),xy(400,310),xy(399,320)]).
hole(r11, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r11, [xy(333,205),xy(295,205),xy(295,243),xy(306,256),xy(314,271),xy(313,275),xy(279,275),xy(256,265),xy(244,265),xy(235,260),xy(229,260),xy(223,255),xy(214,255)]).
midline(r11, [xy(334,206),xy(349,218),xy(362,224),xy(365,222),xy(365,174)]).
midline(r11, [xy(314,276),xy(316,274),xy(330,275),xy(346,279),xy(369,270),xy(368,272),xy(372,276),xy(371,281),xy(373,279)]).
midline(r11, [xy(348,279),xy(344,284),xy(344,288),xy(346,284)]).
midline(r11, [xy(348,284),xy(347,282)]).
midline(r11, [xy(370,269),xy(384,255),xy(373,240),xy(365,224)]).
fillpoint(r11, xy(383,256), 56.6).
fillpoint(r11, xy(356,275), 45.0).
fillpoint(r11, xy(353,276), 44.0).
fillpoint(r11, xy(328,275), 36.0).
fillpoint(r11, xy(314,275), 35.0).
fillpoint(r11, xy(365,186), 25.0).
fillpoint(r11, xy(279,275), 25.0).
fillpoint(r11, xy(255,265), 16.0).
fillpoint(r11, xy(248,264), 15.0).
region(r3, '#2ecc40', 18800, centroid(240,111)).
perimeter(r3, 760).
polygon(r3, [xy(239,200),xy(170,199),xy(170,160),xy(160,159),xy(160,80),xy(170,79),xy(170,50),xy(339,50),xy(340,149),xy(290,150),xy(290,100),xy(240,100),xy(239,200)]).
midline(r3, [xy(314,111),xy(315,100),xy(311,81),xy(303,76),xy(288,74),xy(230,75),xy(207,85),xy(198,107),xy(182,98),xy(182,100)]).
midline(r3, [xy(199,108),xy(200,132),xy(182,141),xy(179,140),xy(177,142),xy(179,142)]).
midline(r3, [xy(315,112),xy(315,125)]).
midline(r3, [xy(200,134),xy(204,149),xy(205,165)]).
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
region(r8, '#ffdc00', 12500, centroid(264,184)).
perimeter(r8, 620).
polygon(r8, [xy(289,250),xy(200,250),xy(200,230),xy(190,230),xy(190,220),xy(180,219),xy(180,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r8, [xy(274,174),xy(270,173),xy(265,158),xy(265,124)]).
midline(r8, [xy(271,175),xy(265,190),xy(263,213),xy(261,219),xy(256,222),xy(224,225),xy(212,217),xy(195,210),xy(189,210)]).
midline(r8, [xy(275,175),xy(315,175)]).
fillpoint(r8, xy(271,175), 31.4).
fillpoint(r8, xy(260,220), 29.7).
fillpoint(r8, xy(268,168), 29.0).
fillpoint(r8, xy(268,181), 29.0).
fillpoint(r8, xy(261,218), 29.0).
fillpoint(r8, xy(258,221), 29.0).
fillpoint(r8, xy(267,165), 28.0).
fillpoint(r8, xy(267,184), 28.0).
fillpoint(r8, xy(262,215), 28.0).
fillpoint(r8, xy(255,222), 28.0).
fillpoint(r8, xy(266,162), 27.0).
fillpoint(r8, xy(266,187), 27.0).
fillpoint(r8, xy(263,212), 27.0).
fillpoint(r8, xy(252,223), 27.0).
fillpoint(r8, xy(265,158), 26.0).
fillpoint(r8, xy(265,192), 26.0).
fillpoint(r8, xy(264,208), 26.0).
fillpoint(r8, xy(248,224), 26.0).
fillpoint(r8, xy(265,136), 25.0).
fillpoint(r8, xy(291,175), 25.0).
fillpoint(r8, xy(224,225), 25.0).
fillpoint(r8, xy(205,215), 16.0).
fillpoint(r8, xy(194,210), 11.0).
region(r5, '#2ecc40', 11200, centroid(520,149)).
perimeter(r5, 700).
polygon(r5, [xy(499,270),xy(490,269),xy(490,50),xy(549,50),xy(550,79),xy(560,80),xy(560,159),xy(550,160),xy(550,199),xy(540,200),xy(540,219),xy(530,220),xy(530,229),xy(520,230),xy(520,249),xy(510,250),xy(510,259),xy(500,260),xy(499,270)]).
hole(r5, [xy(530,89),xy(529,60),xy(500,60),xy(500,90),xy(530,89)]).
midline(r5, [xy(540,59),xy(529,54),xy(495,55),xy(495,93),xy(525,124),xy(525,135),xy(520,150),xy(520,176),xy(515,191),xy(516,197),xy(505,223),xy(505,235),xy(500,244),xy(500,250),xy(495,256),xy(495,265)]).
midline(r5, [xy(526,135),xy(530,135),xy(530,137)]).
midline(r5, [xy(526,123),xy(540,106),xy(545,94),xy(540,85),xy(539,61)]).
midline(r5, [xy(521,175),xy(523,177)]).
fillpoint(r5, xy(524,130), 35.0).
fillpoint(r5, xy(521,146), 32.0).
fillpoint(r5, xy(520,152), 31.0).
fillpoint(r5, xy(520,169), 30.0).
fillpoint(r5, xy(518,181), 29.0).
fillpoint(r5, xy(517,184), 28.0).
fillpoint(r5, xy(516,187), 27.0).
fillpoint(r5, xy(515,192), 26.0).
fillpoint(r5, xy(544,95), 16.0).
fillpoint(r5, xy(505,224), 16.0).
fillpoint(r5, xy(505,233), 15.0).
fillpoint(r5, xy(540,84), 11.0).
fillpoint(r5, xy(500,245), 11.0).
fillpoint(r5, xy(539,69), 10.0).
region(r19, '#5a5a5a', 7600, centroid(360,620)).
perimeter(r19, 800).
polygon(r19, [xy(549,630),xy(170,630),xy(170,610),xy(549,610),xy(549,630)]).
midline(r19, [xy(344,619),xy(179,620)]).
midline(r19, [xy(345,619),xy(540,620)]).
fillpoint(r19, xy(179,620), 10.0).
region(r4, '#2ecc40', 5000, centroid(414,100)).
perimeter(r4, 300).
polygon(r4, [xy(439,150),xy(390,149),xy(390,50),xy(440,50),xy(439,150)]).
midline(r4, [xy(414,84),xy(415,74)]).
midline(r4, [xy(415,85),xy(415,125)]).
fillpoint(r4, xy(414,100), 25.0).
region(r16, '#7fdbff', 2000, centroid(64,576)).
perimeter(r16, 240).
polygon(r16, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r16, [xy(51,560),xy(39,560)]).
midline(r16, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r16, xy(58,561), 12.0).
fillpoint(r16, xy(61,578), 12.0).
fillpoint(r16, xy(78,581), 12.0).
fillpoint(r16, xy(54,560), 11.0).
fillpoint(r16, xy(59,565), 11.0).
fillpoint(r16, xy(60,574), 11.0).
fillpoint(r16, xy(65,579), 11.0).
fillpoint(r16, xy(74,580), 11.0).
fillpoint(r16, xy(79,585), 11.0).
fillpoint(r16, xy(39,560), 10.0).
fillpoint(r16, xy(79,596), 10.0).
region(r10, '#870c25', 1500, centroid(364,134)).
perimeter(r10, 160).
polygon(r10, [xy(389,150),xy(340,150),xy(340,120),xy(389,120),xy(389,150)]).
midline(r10, [xy(360,135),xy(354,135)]).
midline(r10, [xy(361,135),xy(375,135)]).
fillpoint(r10, xy(354,135), 15.0).
region(r9, '#bebebe', 1000, centroid(364,110)).
perimeter(r9, 140).
polygon(r9, [xy(389,120),xy(340,120),xy(340,100),xy(389,100),xy(389,120)]).
midline(r9, [xy(370,110),xy(349,110)]).
midline(r9, [xy(371,109),xy(380,110)]).
fillpoint(r9, xy(349,110), 10.0).
region(r6, '#5a5a5a', 800, centroid(514,74)).
perimeter(r6, 160).
polygon(r6, [xy(529,90),xy(500,89),xy(500,60),xy(530,60),xy(529,90)]).
hole(r6, [xy(520,79),xy(519,70),xy(510,70),xy(510,80),xy(520,79)]).
midline(r6, [xy(524,82),xy(525,73),xy(523,65),xy(505,65),xy(504,72),xy(505,84),xy(524,84)]).
fillpoint(r6, xy(506,65), 6.0).
fillpoint(r6, xy(524,65), 6.0).
fillpoint(r6, xy(505,84), 6.0).
fillpoint(r6, xy(523,84), 6.0).
fillpoint(r6, xy(511,65), 5.0).
fillpoint(r6, xy(504,75), 5.0).
fillpoint(r6, xy(524,75), 5.0).
fillpoint(r6, xy(511,85), 5.0).
region(r13, '#5a5a5a', 800, centroid(314,224)).
perimeter(r13, 160).
polygon(r13, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r13, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r13, [xy(319,214),xy(305,215),xy(305,234),xy(318,235),xy(324,233),xy(324,216),xy(320,215)]).
fillpoint(r13, xy(306,215), 6.0).
fillpoint(r13, xy(324,215), 6.0).
fillpoint(r13, xy(305,234), 6.0).
fillpoint(r13, xy(323,234), 6.0).
fillpoint(r13, xy(311,215), 5.0).
fillpoint(r13, xy(304,225), 5.0).
fillpoint(r13, xy(324,225), 5.0).
fillpoint(r13, xy(311,235), 5.0).
region(r18, '#2ecc40', 800, centroid(150,620)).
perimeter(r18, 120).
polygon(r18, [xy(169,630),xy(130,630),xy(130,610),xy(169,610),xy(169,630)]).
midline(r18, [xy(160,620),xy(139,620)]).
fillpoint(r18, xy(139,620), 10.0).
region(r12, '#0074d9', 500, centroid(414,194)).
perimeter(r12, 120).
polygon(r12, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r12, [xy(420,194),xy(394,195)]).
midline(r12, [xy(421,195),xy(435,195)]).
fillpoint(r12, xy(394,195), 5.0).
region(r17, '#7fdbff', 400, centroid(40,600)).
perimeter(r17, 80).
polygon(r17, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r17, [xy(39,599),xy(40,600)]).
fillpoint(r17, xy(39,600), 10.0).
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
region(r22, '#2ecc40', 400, centroid(630,620)).
perimeter(r22, 80).
polygon(r22, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r22, [xy(629,619),xy(630,620)]).
fillpoint(r22, xy(629,620), 10.0).
border(r22).
region(r7, '#2ecc40', 100, centroid(514,74)).
perimeter(r7, 40).
polygon(r7, [xy(519,80),xy(510,79),xy(510,70),xy(520,70),xy(519,80)]).
midline(r7, [xy(515,75),xy(515,74)]).
fillpoint(r7, xy(514,75), 5.0).
region(r14, '#2ecc40', 100, centroid(314,224)).
perimeter(r14, 40).
polygon(r14, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r14, [xy(315,225),xy(315,224)]).
fillpoint(r14, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 240).
adjacent(r1, r3).
shared_edge(r1, r3, 180).
adjacent(r1, r5).
shared_edge(r1, r5, 300).
adjacent(r1, r8).
shared_edge(r1, r8, 80).
adjacent(r1, r11).
shared_edge(r1, r11, 300).
adjacent(r1, r16).
shared_edge(r1, r16, 240).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 100).
adjacent(r1, r19).
shared_edge(r1, r19, 780).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 220).
adjacent(r2, r4).
shared_edge(r2, r4, 250).
adjacent(r2, r5).
shared_edge(r2, r5, 280).
adjacent(r2, r9).
shared_edge(r2, r9, 50).
adjacent(r2, r11).
shared_edge(r2, r11, 140).
adjacent(r2, r12).
shared_edge(r2, r12, 60).
adjacent(r3, r8).
shared_edge(r3, r8, 310).
adjacent(r3, r9).
shared_edge(r3, r9, 20).
adjacent(r3, r10).
shared_edge(r3, r10, 30).
adjacent(r4, r9).
shared_edge(r4, r9, 20).
adjacent(r4, r10).
shared_edge(r4, r10, 30).
adjacent(r5, r6).
shared_edge(r5, r6, 120).
adjacent(r6, r7).
shared_edge(r6, r7, 40).
adjacent(r8, r11).
shared_edge(r8, r11, 230).
adjacent(r9, r10).
shared_edge(r9, r10, 50).
adjacent(r10, r11).
shared_edge(r10, r11, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 60).
adjacent(r11, r13).
shared_edge(r11, r13, 120).
adjacent(r13, r14).
shared_edge(r13, r14, 40).
adjacent(r18, r19).
shared_edge(r18, r19, 20).

encloses(r6, r7).
encloses(r13, r14).
encloses(r1, r16).
encloses(r1, r17).
encloses(r1, r20).
encloses(r1, r21).
