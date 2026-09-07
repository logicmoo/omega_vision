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

region(r1, '#aaaaaa', 274500, centroid(278,286)).
perimeter(r1, 5780).
polygon(r1, [xy(450,569),xy(450,560),xy(489,560),xy(490,550),xy(509,550),xy(510,540),xy(519,540),xy(520,530),xy(539,530),xy(540,520),xy(549,520),xy(550,510),xy(559,510),xy(560,500),xy(570,499),xy(570,480),xy(579,480),xy(580,470),xy(590,469),xy(590,450),xy(600,449),xy(600,410),xy(610,409),xy(610,330),xy(600,329),xy(600,290),xy(590,289),xy(590,270),xy(580,270),xy(580,260),xy(570,259),xy(570,240),xy(560,240),xy(560,230),xy(550,230),xy(550,220),xy(540,219),xy(539,210),xy(520,210),xy(520,200),xy(510,199),xy(509,190),xy(490,190),xy(489,180),xy(450,180),xy(449,170),xy(370,170),xy(369,180),xy(330,180),xy(329,190),xy(310,190),xy(310,199),xy(300,200),xy(299,210),xy(280,210),xy(280,219),xy(270,220),xy(270,229),xy(260,230),xy(259,240),xy(250,240),xy(250,259),xy(240,260),xy(240,269),xy(230,270),xy(230,289),xy(220,290),xy(220,329),xy(210,330),xy(210,409),xy(220,410),xy(220,449),xy(230,450),xy(230,469),xy(239,470),xy(240,480),xy(250,480),xy(250,499),xy(259,500),xy(260,509),xy(269,510),xy(270,520),xy(280,519),xy(280,490),xy(349,490),xy(350,560),xy(369,560),xy(370,570),xy(450,569)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(330,519),xy(329,510),xy(320,510),xy(319,520),xy(310,520),xy(309,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(330,539)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(494,90),xy(475,86),xy(448,84),xy(370,84),xy(344,86),xy(323,91),xy(304,91),xy(255,102),xy(234,110),xy(219,113),xy(143,143),xy(125,199),xy(115,239),xy(105,310),xy(104,406),xy(107,443),xy(23,527),xy(17,537),xy(14,550),xy(14,589),xy(17,602),xy(27,616),xy(43,624),xy(88,625),xy(106,620),xy(109,617),xy(111,598),xy(119,581),xy(118,579),xy(81,580),xy(59,560),xy(60,491)]).
midline(r1, [xy(495,90),xy(488,99),xy(487,112),xy(479,130),xy(476,139),xy(478,139)]).
midline(r1, [xy(497,90),xy(490,99)]).
midline(r1, [xy(312,92),xy(331,111),xy(333,109),xy(332,104),xy(320,92)]).
midline(r1, [xy(482,129),xy(482,133),xy(479,136)]).
midline(r1, [xy(108,444),xy(125,462),xy(140,449),xy(126,463),xy(130,468),xy(153,447),xy(151,445),xy(144,449),xy(141,448)]).
midline(r1, [xy(131,469),xy(152,496),xy(169,527),xy(160,539),xy(120,579)]).
midline(r1, [xy(170,527),xy(201,544),xy(240,560),xy(267,564),xy(276,552),xy(275,550),xy(289,525),xy(291,501),xy(300,499),xy(314,500),xy(314,515),xy(315,515),xy(324,525),xy(339,524),xy(340,510),xy(338,502),xy(329,499),xy(316,500)]).
midline(r1, [xy(485,119),xy(487,115)]).
midline(r1, [xy(489,115),xy(512,92),xy(499,90)]).
midline(r1, [xy(484,122),xy(485,121)]).
midline(r1, [xy(488,110),xy(506,92)]).
midline(r1, [xy(109,619),xy(124,633),xy(130,635),xy(553,634),xy(555,632),xy(555,571),xy(553,568),xy(540,570),xy(533,575),xy(519,579),xy(509,571),xy(514,578),xy(499,584),xy(472,585),xy(470,583),xy(464,587),xy(449,590),xy(371,590),xy(349,584),xy(336,583),xy(318,574),xy(290,572),xy(269,564)]).
midline(r1, [xy(318,573),xy(335,553),xy(339,545),xy(339,526)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,632),xy(585,559),xy(579,559),xy(556,568),xy(539,551),xy(553,567)]).
midline(r1, [xy(115,252),xy(153,290),xy(149,292),xy(114,257)]).
midline(r1, [xy(114,259),xy(145,290),xy(143,291),xy(113,261)]).
midline(r1, [xy(148,293),xy(145,292)]).
midline(r1, [xy(324,92),xy(331,101)]).
midline(r1, [xy(153,445),xy(159,444),xy(155,448)]).
midline(r1, [xy(160,443),xy(169,442),xy(174,438),xy(174,440)]).
midline(r1, [xy(129,464),xy(143,450)]).
midline(r1, [xy(176,439),xy(180,436),xy(179,439)]).
midline(r1, [xy(182,435),xy(184,436),xy(182,438)]).
midline(r1, [xy(585,633),xy(590,635),xy(609,635),xy(615,632),xy(614,589),xy(616,586),xy(585,557)]).
midline(r1, [xy(587,556),xy(602,519),xy(606,496),xy(613,483),xy(613,470),xy(617,464),xy(620,449),xy(620,430),xy(617,427),xy(622,422),xy(625,408),xy(625,331),xy(622,317),xy(618,312),xy(620,310),xy(619,282),xy(615,271),xy(612,269),xy(612,271)]).
midline(r1, [xy(614,269),xy(613,256),xy(606,243),xy(600,214),xy(581,168),xy(564,139),xy(555,118),xy(541,97),xy(513,91)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(334,114),xy(332,112),xy(334,112)]).
midline(r1, [xy(335,115),xy(333,115)]).
midline(r1, [xy(146,156),xy(231,243)]).
midline(r1, [xy(176,300),xy(174,298),xy(172,300),xy(164,292),xy(162,294),xy(159,291),xy(157,293),xy(154,291),xy(156,295),xy(160,294),xy(158,296)]).
midline(r1, [xy(175,297),xy(179,301),xy(173,301)]).
midline(r1, [xy(179,303),xy(182,302),xy(182,304)]).
midline(r1, [xy(164,294),xy(160,296)]).
midline(r1, [xy(184,304),xy(187,304),xy(187,306)]).
midline(r1, [xy(169,299),xy(166,296),xy(164,297),xy(167,299)]).
midline(r1, [xy(338,129),xy(333,118),xy(336,119)]).
midline(r1, [xy(339,130),xy(347,152)]).
fillpoint(r1, xy(143,143), 144.0).
fillpoint(r1, xy(136,164), 137.0).
fillpoint(r1, xy(135,167), 136.0).
fillpoint(r1, xy(133,174), 134.0).
fillpoint(r1, xy(132,178), 133.0).
fillpoint(r1, xy(131,182), 132.0).
fillpoint(r1, xy(129,188), 130.0).
fillpoint(r1, xy(128,191), 129.0).
fillpoint(r1, xy(127,194), 128.0).
fillpoint(r1, xy(126,197), 127.0).
fillpoint(r1, xy(125,200), 126.0).
fillpoint(r1, xy(123,207), 124.0).
fillpoint(r1, xy(122,211), 123.0).
fillpoint(r1, xy(121,215), 122.0).
fillpoint(r1, xy(120,219), 121.0).
fillpoint(r1, xy(119,224), 120.0).
fillpoint(r1, xy(117,232), 118.0).
fillpoint(r1, xy(116,236), 117.0).
fillpoint(r1, xy(115,240), 116.0).
fillpoint(r1, xy(114,245), 115.0).
fillpoint(r1, xy(220,113), 114.0).
fillpoint(r1, xy(113,250), 114.0).
fillpoint(r1, xy(112,256), 113.0).
fillpoint(r1, xy(227,111), 112.0).
fillpoint(r1, xy(111,263), 112.0).
fillpoint(r1, xy(231,110), 111.0).
fillpoint(r1, xy(110,273), 111.0).
fillpoint(r1, xy(109,286), 110.0).
fillpoint(r1, xy(108,291), 109.0).
fillpoint(r1, xy(107,297), 108.0).
fillpoint(r1, xy(107,443), 108.0).
fillpoint(r1, xy(106,304), 107.0).
fillpoint(r1, xy(106,436), 107.0).
fillpoint(r1, xy(105,313), 106.0).
fillpoint(r1, xy(105,426), 106.0).
fillpoint(r1, xy(104,370), 105.0).
fillpoint(r1, xy(253,103), 104.0).
fillpoint(r1, xy(256,102), 103.0).
fillpoint(r1, xy(260,101), 102.0).
fillpoint(r1, xy(264,100), 101.0).
fillpoint(r1, xy(268,99), 100.0).
fillpoint(r1, xy(273,98), 99.0).
fillpoint(r1, xy(542,97), 98.0).
fillpoint(r1, xy(281,96), 97.0).
fillpoint(r1, xy(538,96), 97.0).
fillpoint(r1, xy(285,95), 96.0).
fillpoint(r1, xy(534,95), 96.0).
fillpoint(r1, xy(289,94), 95.0).
fillpoint(r1, xy(530,94), 95.0).
fillpoint(r1, xy(294,93), 94.0).
fillpoint(r1, xy(525,93), 94.0).
fillpoint(r1, xy(299,92), 93.0).
fillpoint(r1, xy(520,92), 93.0).
fillpoint(r1, xy(306,91), 92.0).
fillpoint(r1, xy(514,91), 92.0).
fillpoint(r1, xy(315,90), 91.0).
fillpoint(r1, xy(505,90), 91.0).
fillpoint(r1, xy(330,89), 90.0).
fillpoint(r1, xy(489,89), 90.0).
fillpoint(r1, xy(335,88), 89.0).
fillpoint(r1, xy(484,88), 89.0).
fillpoint(r1, xy(340,87), 88.0).
fillpoint(r1, xy(479,87), 88.0).
fillpoint(r1, xy(346,86), 87.0).
fillpoint(r1, xy(473,86), 87.0).
fillpoint(r1, xy(355,85), 86.0).
fillpoint(r1, xy(465,85), 86.0).
fillpoint(r1, xy(371,85), 85.0).
fillpoint(r1, xy(169,526), 83.5).
fillpoint(r1, xy(151,495), 82.9).
fillpoint(r1, xy(168,524), 82.9).
fillpoint(r1, xy(154,500), 82.0).
fillpoint(r1, xy(165,519), 82.0).
fillpoint(r1, xy(155,502), 81.6).
fillpoint(r1, xy(164,517), 81.6).
fillpoint(r1, xy(157,505), 81.4).
fillpoint(r1, xy(162,514), 81.4).
fillpoint(r1, xy(158,507), 81.3).
fillpoint(r1, xy(161,512), 81.3).
fillpoint(r1, xy(159,509), 81.1).
fillpoint(r1, xy(160,510), 81.1).
fillpoint(r1, xy(582,171), 58.0).
fillpoint(r1, xy(221,552), 58.0).
fillpoint(r1, xy(586,557), 53.0).
fillpoint(r1, xy(241,560), 50.0).
fillpoint(r1, xy(248,562), 48.0).
fillpoint(r1, xy(253,563), 47.0).
fillpoint(r1, xy(259,564), 46.0).
fillpoint(r1, xy(595,203), 45.0).
fillpoint(r1, xy(595,536), 45.0).
fillpoint(r1, xy(272,565), 45.0).
fillpoint(r1, xy(566,565), 45.0).
fillpoint(r1, xy(563,566), 44.0).
fillpoint(r1, xy(556,568), 42.2).
fillpoint(r1, xy(548,569), 41.0).
fillpoint(r1, xy(602,221), 38.0).
fillpoint(r1, xy(602,518), 38.0).
fillpoint(r1, xy(291,572), 38.0).
fillpoint(r1, xy(603,225), 37.0).
fillpoint(r1, xy(603,514), 37.0).
fillpoint(r1, xy(295,573), 37.0).
fillpoint(r1, xy(604,231), 36.0).
fillpoint(r1, xy(604,509), 36.0).
fillpoint(r1, xy(301,574), 36.0).
border(r1).
region(r6, '#2ecc40', 37600, centroid(511,382)).
perimeter(r6, 1260).
polygon(r6, [xy(509,550),xy(440,549),xy(440,500),xy(490,499),xy(489,450),xy(390,449),xy(390,400),xy(439,400),xy(440,350),xy(490,349),xy(490,190),xy(509,190),xy(510,199),xy(520,200),xy(520,210),xy(539,210),xy(540,219),xy(549,220),xy(550,229),xy(559,230),xy(560,239),xy(570,240),xy(570,259),xy(579,260),xy(580,269),xy(590,270),xy(590,449),xy(540,450),xy(540,499),xy(559,500),xy(560,509),xy(550,510),xy(550,519),xy(540,520),xy(539,530),xy(520,530),xy(520,539),xy(510,540),xy(509,550)]).
midline(r6, [xy(439,424),xy(414,425)]).
midline(r6, [xy(440,424),xy(453,423),xy(467,417),xy(489,399),xy(510,399),xy(515,402),xy(514,505),xy(499,520),xy(489,525),xy(464,525)]).
midline(r6, [xy(515,399),xy(531,391),xy(536,377),xy(540,345),xy(540,299),xy(533,284),xy(528,260),xy(518,237),xy(507,222),xy(500,205),xy(500,199)]).
midline(r6, [xy(515,505),xy(523,511),xy(527,509),xy(540,510),xy(546,505),xy(555,505)]).
midline(r6, [xy(533,274),xy(535,272)]).
midline(r6, [xy(561,291),xy(554,296),xy(552,295),xy(549,298),xy(542,297),xy(542,299)]).
midline(r6, [xy(562,291),xy(567,288),xy(567,290)]).
midline(r6, [xy(552,297),xy(551,298)]).
fillpoint(r6, xy(531,391), 59.0).
fillpoint(r6, xy(532,388), 58.0).
fillpoint(r6, xy(536,376), 54.0).
fillpoint(r6, xy(537,372), 53.0).
fillpoint(r6, xy(538,368), 52.0).
fillpoint(r6, xy(539,361), 51.0).
fillpoint(r6, xy(539,324), 50.0).
fillpoint(r6, xy(534,286), 45.0).
fillpoint(r6, xy(533,283), 44.0).
fillpoint(r6, xy(531,275), 42.0).
fillpoint(r6, xy(530,269), 41.0).
fillpoint(r6, xy(518,238), 29.0).
fillpoint(r6, xy(458,421), 29.0).
fillpoint(r6, xy(455,422), 28.0).
fillpoint(r6, xy(452,423), 27.0).
fillpoint(r6, xy(448,424), 26.0).
fillpoint(r6, xy(514,505), 25.7).
fillpoint(r6, xy(414,425), 25.0).
fillpoint(r6, xy(514,475), 25.0).
fillpoint(r6, xy(464,525), 25.0).
fillpoint(r6, xy(490,524), 25.0).
fillpoint(r6, xy(500,519), 22.8).
fillpoint(r6, xy(505,215), 16.0).
region(r2, '#2ecc40', 33900, centroid(346,313)).
perimeter(r2, 1480).
polygon(r2, [xy(359,560),xy(350,559),xy(349,490),xy(280,490),xy(280,519),xy(270,519),xy(270,480),xy(290,479),xy(290,300),xy(220,300),xy(220,290),xy(230,289),xy(230,270),xy(239,270),xy(240,260),xy(249,260),xy(250,250),xy(290,249),xy(290,210),xy(300,210),xy(300,240),xy(330,239),xy(330,210),xy(300,210),xy(300,200),xy(339,200),xy(340,180),xy(369,180),xy(370,170),xy(389,170),xy(390,200),xy(440,200),xy(440,349),xy(340,350),xy(340,479),xy(360,480),xy(359,560)]).
midline(r2, [xy(270,274),xy(244,284),xy(233,294),xy(224,295)]).
midline(r2, [xy(271,274),xy(315,274),xy(308,259),xy(296,245),xy(294,239),xy(294,214),xy(295,214),xy(304,204),xy(333,205),xy(348,217),xy(358,221),xy(359,224),xy(363,224),xy(365,222),xy(364,204),xy(375,193),xy(380,179)]).
midline(r2, [xy(315,275),xy(345,294),xy(325,317),xy(315,341),xy(315,464),xy(295,483),xy(275,485),xy(275,515)]).
midline(r2, [xy(315,465),xy(334,483),xy(354,485),xy(355,555)]).
midline(r2, [xy(346,293),xy(375,285)]).
midline(r2, [xy(376,283),xy(384,255),xy(373,240),xy(365,224)]).
fillpoint(r2, xy(375,285), 65.0).
fillpoint(r2, xy(378,277), 62.0).
fillpoint(r2, xy(367,288), 62.0).
fillpoint(r2, xy(379,274), 61.0).
fillpoint(r2, xy(364,289), 61.0).
fillpoint(r2, xy(380,271), 60.0).
fillpoint(r2, xy(361,290), 60.0).
fillpoint(r2, xy(381,267), 59.0).
fillpoint(r2, xy(357,291), 59.0).
fillpoint(r2, xy(382,263), 58.0).
fillpoint(r2, xy(353,292), 58.0).
fillpoint(r2, xy(383,258), 57.0).
fillpoint(r2, xy(348,293), 57.0).
fillpoint(r2, xy(318,331), 29.0).
fillpoint(r2, xy(317,334), 28.0).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(269,275), 25.0).
fillpoint(r2, xy(315,408), 25.0).
region(r16, '#ffdc00', 17700, centroid(400,478)).
perimeter(r16, 820).
polygon(r16, [xy(449,570),xy(370,570),xy(370,560),xy(360,559),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,549),xy(489,550),xy(490,559),xy(450,560),xy(449,570)]).
midline(r16, [xy(419,479),xy(400,490),xy(364,455),xy(365,384)]).
midline(r16, [xy(400,491),xy(400,528),xy(396,533),xy(382,541),xy(380,540),xy(380,542)]).
midline(r16, [xy(394,535),xy(395,534)]).
midline(r16, [xy(400,530),xy(420,550),xy(434,559),xy(440,560),xy(450,554),xy(485,555)]).
midline(r16, [xy(420,478),xy(440,474),xy(465,475)]).
fillpoint(r16, xy(400,491), 41.0).
fillpoint(r16, xy(399,516), 40.0).
fillpoint(r16, xy(421,478), 29.0).
fillpoint(r16, xy(424,477), 28.0).
fillpoint(r16, xy(427,476), 27.0).
fillpoint(r16, xy(432,475), 26.0).
fillpoint(r16, xy(365,455), 25.7).
fillpoint(r16, xy(365,416), 25.0).
fillpoint(r16, xy(441,475), 25.0).
fillpoint(r16, xy(435,559), 11.0).
region(r11, '#ffdc00', 10900, centroid(260,389)).
perimeter(r11, 600).
polygon(r11, [xy(269,510),xy(260,510),xy(260,500),xy(250,499),xy(250,480),xy(240,480),xy(240,470),xy(230,469),xy(230,450),xy(240,449),xy(240,350),xy(210,349),xy(210,330),xy(220,329),xy(220,300),xy(290,300),xy(290,479),xy(270,480),xy(269,510)]).
midline(r11, [xy(261,458),xy(259,460),xy(239,460)]).
midline(r11, [xy(260,461),xy(259,490),xy(264,496),xy(265,505)]).
midline(r11, [xy(262,457),xy(265,449),xy(265,350),xy(262,333),xy(259,328),xy(244,324),xy(233,335),xy(219,340)]).
fillpoint(r11, xy(260,329), 29.7).
fillpoint(r11, xy(258,328), 29.0).
fillpoint(r11, xy(261,331), 29.0).
fillpoint(r11, xy(255,327), 28.0).
fillpoint(r11, xy(262,334), 28.0).
fillpoint(r11, xy(252,326), 27.0).
fillpoint(r11, xy(263,337), 27.0).
fillpoint(r11, xy(248,325), 26.0).
fillpoint(r11, xy(264,342), 26.0).
fillpoint(r11, xy(264,455), 25.7).
fillpoint(r11, xy(264,400), 25.0).
fillpoint(r11, xy(224,339), 11.0).
fillpoint(r11, xy(259,486), 10.0).
region(r3, '#ffdc00', 9100, centroid(460,251)).
perimeter(r3, 560).
polygon(r3, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,190),xy(390,170),xy(449,170),xy(450,180),xy(490,180),xy(489,350)]).
midline(r3, [xy(464,211),xy(464,204),xy(438,179),xy(399,180)]).
midline(r3, [xy(465,212),xy(464,279),xy(470,300),xy(470,330)]).
fillpoint(r3, xy(465,242), 25.0).
fillpoint(r3, xy(469,293), 21.0).
fillpoint(r3, xy(469,316), 20.0).
fillpoint(r3, xy(399,180), 10.0).
fillpoint(r3, xy(440,180), 10.0).
region(r25, '#5a5a5a', 6000, centroid(400,620)).
perimeter(r25, 640).
polygon(r25, [xy(549,630),xy(250,630),xy(250,610),xy(549,610),xy(549,630)]).
midline(r25, [xy(424,619),xy(259,620)]).
midline(r25, [xy(425,620),xy(540,620)]).
fillpoint(r25, xy(259,620), 10.0).
region(r13, '#2ecc40', 2500, centroid(226,394)).
perimeter(r13, 280).
polygon(r13, [xy(239,450),xy(220,449),xy(220,430),xy(229,430),xy(230,420),xy(220,420),xy(219,410),xy(210,409),xy(210,350),xy(240,350),xy(239,450)]).
midline(r13, [xy(224,370),xy(225,364)]).
midline(r13, [xy(225,371),xy(224,395),xy(235,421),xy(234,433),xy(230,440)]).
fillpoint(r13, xy(224,380), 15.0).
fillpoint(r13, xy(229,405), 11.0).
fillpoint(r13, xy(229,440), 10.0).
fillpoint(r13, xy(234,425), 5.0).
region(r10, '#ffdc00', 2400, centroid(598,370)).
perimeter(r10, 360).
polygon(r10, [xy(599,450),xy(590,449),xy(590,290),xy(600,290),xy(600,329),xy(610,330),xy(610,409),xy(600,410),xy(599,450)]).
midline(r10, [xy(595,307),xy(594,329),xy(600,339),xy(600,400),xy(595,406),xy(594,413),xy(595,445)]).
midline(r10, [xy(595,306),xy(595,294)]).
fillpoint(r10, xy(599,370), 10.0).
fillpoint(r10, xy(595,311), 5.0).
fillpoint(r10, xy(595,428), 5.0).
region(r24, '#2ecc40', 2400, centroid(190,620)).
perimeter(r24, 280).
polygon(r24, [xy(249,630),xy(130,630),xy(130,610),xy(249,610),xy(249,630)]).
midline(r24, [xy(151,620),xy(139,620)]).
midline(r24, [xy(152,619),xy(240,620)]).
fillpoint(r24, xy(139,620), 10.0).
region(r19, '#ffdc00', 2000, centroid(560,472)).
perimeter(r19, 200).
polygon(r19, [xy(569,500),xy(540,499),xy(540,450),xy(590,450),xy(590,469),xy(580,470),xy(580,479),xy(570,480),xy(569,500)]).
midline(r19, [xy(568,463),xy(557,467),xy(555,485)]).
midline(r19, [xy(569,463),xy(574,460),xy(580,460)]).
fillpoint(r19, xy(557,467), 18.0).
fillpoint(r19, xy(564,465), 16.0).
fillpoint(r19, xy(555,474), 16.0).
fillpoint(r19, xy(555,483), 15.0).
fillpoint(r19, xy(575,460), 11.0).
region(r22, '#7fdbff', 2000, centroid(56,584)).
perimeter(r22, 240).
polygon(r22, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r22, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r22, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r22, xy(41,578), 12.0).
fillpoint(r22, xy(58,581), 12.0).
fillpoint(r22, xy(61,598), 12.0).
fillpoint(r22, xy(40,574), 11.0).
fillpoint(r22, xy(45,579), 11.0).
fillpoint(r22, xy(54,580), 11.0).
fillpoint(r22, xy(59,585), 11.0).
fillpoint(r22, xy(60,594), 11.0).
fillpoint(r22, xy(65,599), 11.0).
fillpoint(r22, xy(39,564), 10.0).
fillpoint(r22, xy(71,600), 10.0).
region(r17, '#870c25', 1500, centroid(414,384)).
perimeter(r17, 160).
polygon(r17, [xy(439,400),xy(390,400),xy(390,370),xy(439,370),xy(439,400)]).
midline(r17, [xy(422,385),xy(404,385)]).
midline(r17, [xy(423,385),xy(425,385)]).
fillpoint(r17, xy(404,385), 15.0).
region(r7, '#ffdc00', 1000, centroid(274,234)).
perimeter(r7, 160).
polygon(r7, [xy(289,250),xy(250,249),xy(250,240),xy(259,240),xy(260,230),xy(269,230),xy(270,220),xy(280,219),xy(280,210),xy(290,210),xy(289,250)]).
midline(r7, [xy(273,239),xy(269,239),xy(263,244),xy(254,245)]).
midline(r7, [xy(274,239),xy(279,235),xy(279,229),xy(284,223),xy(285,214)]).
fillpoint(r7, xy(277,238), 12.0).
fillpoint(r7, xy(279,234), 11.0).
fillpoint(r7, xy(274,239), 11.0).
fillpoint(r7, xy(285,216), 5.0).
fillpoint(r7, xy(254,245), 5.0).
region(r15, '#bebebe', 1000, centroid(414,360)).
perimeter(r15, 140).
polygon(r15, [xy(439,370),xy(390,370),xy(390,350),xy(439,350),xy(439,370)]).
midline(r15, [xy(409,360),xy(399,360)]).
midline(r15, [xy(410,360),xy(430,360)]).
fillpoint(r15, xy(399,360), 10.0).
region(r8, '#5a5a5a', 800, centroid(314,224)).
perimeter(r8, 160).
polygon(r8, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r8, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r8, [xy(324,232),xy(325,220),xy(323,215),xy(305,215),xy(304,220),xy(305,234),xy(324,234)]).
fillpoint(r8, xy(306,215), 6.0).
fillpoint(r8, xy(324,215), 6.0).
fillpoint(r8, xy(305,234), 6.0).
fillpoint(r8, xy(323,234), 6.0).
fillpoint(r8, xy(311,215), 5.0).
fillpoint(r8, xy(304,225), 5.0).
fillpoint(r8, xy(324,225), 5.0).
fillpoint(r8, xy(311,235), 5.0).
region(r5, '#0074d9', 500, centroid(414,194)).
perimeter(r5, 120).
polygon(r5, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r5, [xy(420,194),xy(394,195)]).
midline(r5, [xy(421,195),xy(435,195)]).
fillpoint(r5, xy(394,195), 5.0).
region(r12, '#0074d9', 500, centroid(444,324)).
perimeter(r12, 120).
polygon(r12, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r12, [xy(445,311),xy(445,304)]).
midline(r12, [xy(445,312),xy(445,345)]).
fillpoint(r12, xy(444,325), 5.0).
region(r14, '#0074d9', 500, centroid(364,354)).
perimeter(r14, 120).
polygon(r14, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r14, [xy(361,354),xy(344,355)]).
midline(r14, [xy(362,354),xy(385,355)]).
fillpoint(r14, xy(344,355), 5.0).
region(r20, '#7fdbff', 500, centroid(312,526)).
perimeter(r20, 120).
polygon(r20, [xy(329,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r20, [xy(305,521),xy(305,514)]).
midline(r20, [xy(305,522),xy(305,524),xy(314,525),xy(315,534),xy(325,535)]).
fillpoint(r20, xy(305,524), 6.0).
fillpoint(r20, xy(314,525), 6.0).
fillpoint(r20, xy(315,534), 6.0).
fillpoint(r20, xy(305,516), 5.0).
fillpoint(r20, xy(321,535), 5.0).
region(r4, '#ffdc00', 400, centroid(327,192)).
perimeter(r4, 100).
polygon(r4, [xy(339,200),xy(310,200),xy(310,190),xy(329,190),xy(330,180),xy(339,180),xy(339,200)]).
midline(r4, [xy(314,195),xy(333,194),xy(335,184)]).
fillpoint(r4, xy(333,194), 6.0).
fillpoint(r4, xy(335,186), 5.0).
fillpoint(r4, xy(314,195), 5.0).
region(r23, '#7fdbff', 400, centroid(80,560)).
perimeter(r23, 80).
polygon(r23, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r23, [xy(79,559),xy(80,560)]).
fillpoint(r23, xy(79,560), 10.0).
region(r26, '#7fdbff', 400, centroid(570,620)).
perimeter(r26, 80).
polygon(r26, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r26, [xy(569,619),xy(570,620)]).
fillpoint(r26, xy(569,620), 10.0).
region(r27, '#7fdbff', 400, centroid(600,620)).
perimeter(r27, 80).
polygon(r27, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r27, [xy(599,619),xy(600,620)]).
fillpoint(r27, xy(599,620), 10.0).
region(r28, '#2ecc40', 400, centroid(630,620)).
perimeter(r28, 80).
polygon(r28, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r28, [xy(629,619),xy(630,620)]).
fillpoint(r28, xy(629,620), 10.0).
border(r28).
region(r9, '#2ecc40', 100, centroid(314,224)).
perimeter(r9, 40).
polygon(r9, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r9, [xy(315,225),xy(315,224)]).
fillpoint(r9, xy(314,225), 5.0).
region(r21, '#7fdbff', 100, centroid(324,514)).
perimeter(r21, 40).
polygon(r21, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r21, [xy(325,515),xy(325,514)]).
fillpoint(r21, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 370).
adjacent(r1, r3).
shared_edge(r1, r3, 120).
adjacent(r1, r4).
shared_edge(r1, r4, 50).
adjacent(r1, r6).
shared_edge(r1, r6, 320).
adjacent(r1, r7).
shared_edge(r1, r7, 80).
adjacent(r1, r10).
shared_edge(r1, r10, 200).
adjacent(r1, r11).
shared_edge(r1, r11, 160).
adjacent(r1, r13).
shared_edge(r1, r13, 110).
adjacent(r1, r16).
shared_edge(r1, r16, 160).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 120).
adjacent(r1, r21).
shared_edge(r1, r21, 40).
adjacent(r1, r22).
shared_edge(r1, r22, 240).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 260).
adjacent(r1, r25).
shared_edge(r1, r25, 620).
adjacent(r1, r26).
shared_edge(r1, r26, 80).
adjacent(r1, r27).
shared_edge(r1, r27, 80).
adjacent(r1, r28).
shared_edge(r1, r28, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 120).
adjacent(r2, r4).
shared_edge(r2, r4, 50).
adjacent(r2, r5).
shared_edge(r2, r5, 60).
adjacent(r2, r7).
shared_edge(r2, r7, 80).
adjacent(r2, r8).
shared_edge(r2, r8, 120).
adjacent(r2, r11).
shared_edge(r2, r11, 300).
adjacent(r2, r12).
shared_edge(r2, r12, 50).
adjacent(r2, r14).
shared_edge(r2, r14, 60).
adjacent(r2, r15).
shared_edge(r2, r15, 50).
adjacent(r2, r16).
shared_edge(r2, r16, 220).
adjacent(r3, r5).
shared_edge(r3, r5, 60).
adjacent(r3, r6).
shared_edge(r3, r6, 200).
adjacent(r3, r12).
shared_edge(r3, r12, 60).
adjacent(r6, r10).
shared_edge(r6, r10, 160).
adjacent(r6, r12).
shared_edge(r6, r12, 10).
adjacent(r6, r15).
shared_edge(r6, r15, 20).
adjacent(r6, r16).
shared_edge(r6, r16, 350).
adjacent(r6, r17).
shared_edge(r6, r17, 80).
adjacent(r6, r19).
shared_edge(r6, r19, 120).
adjacent(r8, r9).
shared_edge(r8, r9, 40).
adjacent(r11, r13).
shared_edge(r11, r13, 140).
adjacent(r14, r15).
shared_edge(r14, r15, 10).
adjacent(r14, r16).
shared_edge(r14, r16, 50).
adjacent(r15, r16).
shared_edge(r15, r16, 10).
adjacent(r15, r17).
shared_edge(r15, r17, 50).
adjacent(r16, r17).
shared_edge(r16, r17, 30).
adjacent(r24, r25).
shared_edge(r24, r25, 20).

encloses(r8, r9).
encloses(r1, r20).
encloses(r1, r21).
encloses(r1, r22).
encloses(r1, r23).
encloses(r1, r26).
encloses(r1, r27).
