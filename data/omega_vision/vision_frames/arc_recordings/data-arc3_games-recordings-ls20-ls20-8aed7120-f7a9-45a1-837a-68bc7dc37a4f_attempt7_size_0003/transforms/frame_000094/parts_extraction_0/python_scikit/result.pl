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

region(r1, '#aaaaaa', 286200, centroid(254,288)).
perimeter(r1, 4780).
polygon(r1, [xy(639,210),xy(620,210),xy(620,200),xy(610,199),xy(609,190),xy(590,190),xy(589,180),xy(550,180),xy(549,170),xy(470,170),xy(469,180),xy(430,180),xy(429,190),xy(410,190),xy(410,199),xy(400,200),xy(399,210),xy(380,210),xy(380,219),xy(370,220),xy(370,229),xy(360,230),xy(360,239),xy(350,240),xy(350,259),xy(340,260),xy(340,269),xy(330,270),xy(330,289),xy(320,290),xy(320,329),xy(310,330),xy(310,409),xy(320,410),xy(320,449),xy(330,450),xy(330,469),xy(339,470),xy(340,480),xy(350,480),xy(350,499),xy(359,500),xy(360,509),xy(369,510),xy(370,519),xy(379,520),xy(380,530),xy(399,530),xy(400,539),xy(409,540),xy(410,550),xy(429,550),xy(430,560),xy(469,560),xy(470,570),xy(549,570),xy(550,560),xy(589,560),xy(590,550),xy(609,550),xy(610,540),xy(620,539),xy(620,530),xy(639,530)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(555,84),xy(452,85),xy(428,90),xy(404,91),xy(367,99),xy(291,123),xy(245,142),xy(177,177),xy(164,234),xy(156,295),xy(154,330),xy(155,406),xy(151,411),xy(126,427),xy(103,446),xy(30,519),xy(19,533),xy(15,543),xy(15,596),xy(19,606),xy(27,616),xy(37,622),xy(53,625),xy(89,625),xy(102,622),xy(109,617),xy(111,598),xy(119,581),xy(115,579),xy(81,580),xy(59,560),xy(59,492)]).
midline(r1, [xy(170,218),xy(247,293)]).
midline(r1, [xy(154,409),xy(188,461),xy(198,484),xy(171,526),xy(120,580)]).
midline(r1, [xy(190,499),xy(189,500)]).
midline(r1, [xy(192,495),xy(193,494)]).
midline(r1, [xy(109,619),xy(124,633),xy(135,635),xy(549,635),xy(554,633),xy(554,590),xy(472,590),xy(458,588),xy(449,583),xy(445,585),xy(430,585),xy(416,583),xy(404,578),xy(395,578),xy(373,569),xy(352,565),xy(301,544),xy(274,528),xy(250,517),xy(199,484)]).
midline(r1, [xy(555,589),xy(569,585),xy(569,581),xy(566,578),xy(568,578)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,632),xy(585,587),xy(577,584),xy(571,585)]).
midline(r1, [xy(585,585),xy(599,584),xy(611,579),xy(622,562),xy(630,539)]).
midline(r1, [xy(611,581),xy(615,585),xy(615,632),xy(608,635),xy(585,633)]).
midline(r1, [xy(418,92),xy(432,106),xy(434,111),xy(432,114),xy(435,115),xy(433,119),xy(435,118)]).
midline(r1, [xy(555,86),xy(570,103),xy(582,122),xy(574,145),xy(580,141),xy(578,139)]).
midline(r1, [xy(581,139),xy(579,136)]).
midline(r1, [xy(581,129),xy(582,133),xy(580,133)]).
midline(r1, [xy(583,124),xy(583,129)]).
midline(r1, [xy(581,136),xy(582,135)]).
midline(r1, [xy(585,126),xy(602,144),xy(611,162),xy(620,173),xy(630,200)]).
midline(r1, [xy(249,293),xy(251,292),xy(251,294)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(253,293),xy(258,296),xy(261,295),xy(261,297)]).
midline(r1, [xy(263,297),xy(273,299),xy(273,301)]).
midline(r1, [xy(275,300),xy(279,301),xy(279,303)]).
midline(r1, [xy(228,465),xy(205,486),xy(227,466),xy(207,488)]).
midline(r1, [xy(229,466),xy(228,463),xy(244,447),xy(231,464),xy(247,446),xy(251,445),xy(251,447)]).
midline(r1, [xy(253,445),xy(258,445),xy(261,442),xy(264,443),xy(270,439),xy(273,439),xy(272,441)]).
midline(r1, [xy(275,439),xy(282,435),xy(280,439),xy(277,439)]).
midline(r1, [xy(284,436),xy(295,429),xy(295,431)]).
midline(r1, [xy(439,131),xy(435,121),xy(437,121)]).
midline(r1, [xy(217,180),xy(204,165),xy(310,271)]).
fillpoint(r1, xy(177,178), 178.0).
fillpoint(r1, xy(175,186), 176.0).
fillpoint(r1, xy(174,190), 175.0).
fillpoint(r1, xy(173,194), 174.0).
fillpoint(r1, xy(172,199), 173.0).
fillpoint(r1, xy(171,204), 172.0).
fillpoint(r1, xy(169,211), 170.0).
fillpoint(r1, xy(168,216), 169.0).
fillpoint(r1, xy(167,220), 168.0).
fillpoint(r1, xy(166,225), 167.0).
fillpoint(r1, xy(165,230), 166.0).
fillpoint(r1, xy(164,236), 165.0).
fillpoint(r1, xy(163,242), 164.0).
fillpoint(r1, xy(162,249), 163.0).
fillpoint(r1, xy(161,257), 162.0).
fillpoint(r1, xy(160,269), 161.0).
fillpoint(r1, xy(159,277), 160.0).
fillpoint(r1, xy(158,283), 159.0).
fillpoint(r1, xy(157,289), 158.0).
fillpoint(r1, xy(156,298), 157.0).
fillpoint(r1, xy(155,310), 156.0).
fillpoint(r1, xy(155,370), 155.0).
fillpoint(r1, xy(185,457), 133.7).
fillpoint(r1, xy(187,460), 133.1).
fillpoint(r1, xy(189,464), 131.9).
fillpoint(r1, xy(192,471), 129.8).
fillpoint(r1, xy(193,473), 129.2).
fillpoint(r1, xy(195,478), 128.1).
fillpoint(r1, xy(196,480), 127.8).
fillpoint(r1, xy(197,482), 127.3).
fillpoint(r1, xy(320,113), 114.0).
fillpoint(r1, xy(327,111), 112.0).
fillpoint(r1, xy(331,110), 111.0).
fillpoint(r1, xy(353,103), 104.0).
fillpoint(r1, xy(356,102), 103.0).
fillpoint(r1, xy(360,101), 102.0).
fillpoint(r1, xy(364,100), 101.0).
fillpoint(r1, xy(368,99), 100.0).
fillpoint(r1, xy(373,98), 99.0).
fillpoint(r1, xy(381,96), 97.0).
fillpoint(r1, xy(385,95), 96.0).
fillpoint(r1, xy(389,94), 95.0).
fillpoint(r1, xy(394,93), 94.0).
fillpoint(r1, xy(399,92), 93.0).
fillpoint(r1, xy(406,91), 92.0).
fillpoint(r1, xy(415,90), 91.0).
fillpoint(r1, xy(430,89), 90.0).
fillpoint(r1, xy(435,88), 89.0).
fillpoint(r1, xy(440,87), 88.0).
fillpoint(r1, xy(446,86), 87.0).
fillpoint(r1, xy(455,85), 86.0).
fillpoint(r1, xy(554,85), 85.1).
fillpoint(r1, xy(471,85), 85.0).
fillpoint(r1, xy(321,552), 58.0).
fillpoint(r1, xy(353,565), 45.0).
border(r1).
region(r3, '#2ecc40', 61400, centroid(473,351)).
perimeter(r3, 2500).
polygon(r3, [xy(589,550),xy(440,550),xy(440,500),xy(489,500),xy(490,450),xy(390,450),xy(389,350),xy(340,350),xy(340,469),xy(330,469),xy(330,450),xy(320,449),xy(320,410),xy(310,409),xy(310,330),xy(320,329),xy(320,290),xy(330,289),xy(330,270),xy(339,270),xy(340,260),xy(350,259),xy(350,240),xy(359,240),xy(360,230),xy(369,230),xy(370,220),xy(379,220),xy(380,210),xy(399,210),xy(400,200),xy(440,200),xy(440,349),xy(489,350),xy(490,400),xy(539,400),xy(540,350),xy(490,349),xy(490,170),xy(549,170),xy(550,180),xy(590,180),xy(590,449),xy(540,450),xy(540,499),xy(590,500),xy(589,550)]).
hole(r3, [xy(570,239),xy(570,230),xy(579,230),xy(580,220),xy(570,219),xy(569,210),xy(560,210),xy(560,219),xy(550,220),xy(550,229),xy(559,230),xy(560,240),xy(570,239)]).
hole(r3, [xy(580,539),xy(579,510),xy(550,510),xy(550,540),xy(580,539)]).
midline(r3, [xy(439,400),xy(419,371),xy(415,358),xy(413,336),xy(399,310),xy(387,297),xy(369,305),xy(352,288),xy(368,306),xy(356,313),xy(324,344),xy(324,395),xy(330,410),xy(329,440),xy(335,450),xy(335,465)]).
midline(r3, [xy(441,398),xy(540,299),xy(540,285),xy(524,253),xy(519,229),xy(521,205),xy(527,199),xy(531,192),xy(530,190),xy(532,190)]).
midline(r3, [xy(541,285),xy(550,279),xy(575,253),xy(579,245),xy(579,239),xy(584,233),xy(585,220),xy(574,195),xy(560,194),xy(540,200),xy(528,200)]).
midline(r3, [xy(540,301),xy(556,320),xy(564,341),xy(565,395),xy(561,419),xy(553,423),xy(530,425),xy(514,431),xy(499,425),xy(480,424),xy(470,421),xy(454,412),xy(441,400)]).
midline(r3, [xy(387,296),xy(392,282),xy(367,257),xy(372,258),xy(391,279),xy(401,252),xy(400,250),xy(415,229),xy(417,220),xy(419,220)]).
midline(r3, [xy(515,432),xy(514,518),xy(499,524),xy(464,525)]).
midline(r3, [xy(515,518),xy(522,522),xy(525,519),xy(525,521)]).
midline(r3, [xy(523,523),xy(546,544),xy(583,544),xy(585,538),xy(585,511),xy(583,505),xy(546,505),xy(527,519)]).
fillpoint(r3, xy(386,297), 53.0).
fillpoint(r3, xy(539,293), 50.0).
fillpoint(r3, xy(390,288), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(392,281), 48.0).
fillpoint(r3, xy(393,276), 47.0).
fillpoint(r3, xy(394,270), 46.0).
fillpoint(r3, xy(395,266), 45.0).
fillpoint(r3, xy(522,202), 33.0).
fillpoint(r3, xy(521,206), 32.0).
fillpoint(r3, xy(521,243), 32.0).
fillpoint(r3, xy(515,431), 31.4).
fillpoint(r3, xy(515,518), 31.4).
fillpoint(r3, xy(520,212), 31.0).
fillpoint(r3, xy(520,238), 31.0).
fillpoint(r3, xy(519,225), 30.0).
fillpoint(r3, xy(560,420), 29.7).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(561,331), 29.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(561,418), 29.0).
fillpoint(r3, xy(471,421), 29.0).
fillpoint(r3, xy(558,421), 29.0).
fillpoint(r3, xy(508,428), 29.0).
fillpoint(r3, xy(521,428), 29.0).
fillpoint(r3, xy(508,521), 29.0).
fillpoint(r3, xy(521,521), 29.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(562,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(562,415), 28.0).
fillpoint(r3, xy(474,422), 28.0).
fillpoint(r3, xy(555,422), 28.0).
fillpoint(r3, xy(505,427), 28.0).
fillpoint(r3, xy(524,427), 28.0).
fillpoint(r3, xy(505,522), 28.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(563,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(563,412), 27.0).
fillpoint(r3, xy(477,423), 27.0).
fillpoint(r3, xy(552,423), 27.0).
fillpoint(r3, xy(502,426), 27.0).
fillpoint(r3, xy(527,426), 27.0).
fillpoint(r3, xy(502,523), 27.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(564,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(564,408), 26.0).
fillpoint(r3, xy(482,424), 26.0).
fillpoint(r3, xy(548,424), 26.0).
fillpoint(r3, xy(498,425), 26.0).
fillpoint(r3, xy(532,425), 26.0).
fillpoint(r3, xy(498,524), 26.0).
fillpoint(r3, xy(564,375), 25.0).
fillpoint(r3, xy(514,475), 25.0).
fillpoint(r3, xy(464,525), 25.0).
fillpoint(r3, xy(554,195), 16.0).
fillpoint(r3, xy(325,344), 16.0).
fillpoint(r3, xy(574,195), 15.8).
fillpoint(r3, xy(561,195), 15.0).
fillpoint(r3, xy(325,373), 15.0).
region(r5, '#ffdc00', 19500, centroid(607,383)).
perimeter(r5, 920).
polygon(r5, [xy(639,530),xy(620,530),xy(620,539),xy(610,540),xy(609,550),xy(590,550),xy(590,500),xy(540,499),xy(540,450),xy(590,449),xy(590,190),xy(609,190),xy(610,199),xy(620,200),xy(620,210),xy(639,210)]).
midline(r5, [xy(614,240),xy(615,448),xy(613,463),xy(609,473),xy(606,475),xy(564,475)]).
midline(r5, [xy(615,239),xy(615,234),xy(609,226),xy(600,205),xy(600,199)]).
midline(r5, [xy(608,475),xy(614,490),xy(615,505),xy(607,517),xy(600,534),xy(600,540)]).
fillpoint(r5, xy(608,475), 31.4).
fillpoint(r5, xy(611,468), 29.0).
fillpoint(r5, xy(611,481), 29.0).
fillpoint(r5, xy(612,465), 28.0).
fillpoint(r5, xy(612,484), 28.0).
fillpoint(r5, xy(613,462), 27.0).
fillpoint(r5, xy(613,487), 27.0).
fillpoint(r5, xy(614,458), 26.0).
fillpoint(r5, xy(614,492), 26.0).
fillpoint(r5, xy(615,341), 25.0).
fillpoint(r5, xy(564,475), 25.0).
fillpoint(r5, xy(615,503), 25.0).
fillpoint(r5, xy(605,215), 16.0).
fillpoint(r5, xy(605,524), 16.0).
fillpoint(r5, xy(600,204), 11.0).
fillpoint(r5, xy(600,535), 11.0).
border(r5).
region(r12, '#ffdc00', 16800, centroid(415,475)).
perimeter(r12, 1020).
polygon(r12, [xy(549,570),xy(470,570),xy(469,560),xy(430,560),xy(429,550),xy(410,550),xy(410,540),xy(400,540),xy(399,530),xy(380,530),xy(380,520),xy(370,520),xy(370,510),xy(360,509),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,549),xy(590,550),xy(589,560),xy(550,560),xy(549,570)]).
midline(r12, [xy(419,479),xy(402,489),xy(396,486),xy(364,455),xy(365,384)]).
midline(r12, [xy(403,490),xy(404,495),xy(415,510),xy(424,535),xy(433,544),xy(435,554),xy(468,554),xy(475,556),xy(479,560),xy(540,560),xy(546,555),xy(585,555)]).
midline(r12, [xy(420,478),xy(440,474),xy(465,475)]).
fillpoint(r12, xy(402,488), 39.0).
fillpoint(r12, xy(421,478), 29.0).
fillpoint(r12, xy(424,477), 28.0).
fillpoint(r12, xy(427,476), 27.0).
fillpoint(r12, xy(432,475), 26.0).
fillpoint(r12, xy(365,455), 25.7).
fillpoint(r12, xy(365,416), 25.0).
fillpoint(r12, xy(441,475), 25.0).
fillpoint(r12, xy(424,534), 16.0).
fillpoint(r12, xy(479,560), 10.0).
region(r2, '#ffdc00', 8300, centroid(466,258)).
perimeter(r2, 480).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(430,190),xy(430,180),xy(469,180),xy(470,170),xy(490,170),xy(489,350)]).
midline(r2, [xy(464,257),xy(465,277),xy(462,281)]).
midline(r2, [xy(464,280),xy(469,292),xy(470,330)]).
midline(r2, [xy(465,256),xy(465,206),xy(445,186),xy(434,185)]).
midline(r2, [xy(465,204),xy(475,193),xy(480,179)]).
fillpoint(r2, xy(465,242), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(479,184), 11.0).
region(r19, '#2ecc40', 6400, centroid(290,620)).
perimeter(r19, 680).
polygon(r19, [xy(449,630),xy(130,630),xy(130,610),xy(449,610),xy(449,630)]).
midline(r19, [xy(304,619),xy(139,620)]).
midline(r19, [xy(305,619),xy(440,620)]).
fillpoint(r19, xy(139,620), 10.0).
region(r17, '#7fdbff', 2000, centroid(56,584)).
perimeter(r17, 240).
polygon(r17, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r17, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r17, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r17, xy(41,578), 12.0).
fillpoint(r17, xy(58,581), 12.0).
fillpoint(r17, xy(61,598), 12.0).
fillpoint(r17, xy(40,574), 11.0).
fillpoint(r17, xy(45,579), 11.0).
fillpoint(r17, xy(54,580), 11.0).
fillpoint(r17, xy(59,585), 11.0).
fillpoint(r17, xy(60,594), 11.0).
fillpoint(r17, xy(65,599), 11.0).
fillpoint(r17, xy(39,564), 10.0).
fillpoint(r17, xy(71,600), 10.0).
region(r20, '#5a5a5a', 2000, centroid(500,620)).
perimeter(r20, 240).
polygon(r20, [xy(549,630),xy(450,630),xy(450,610),xy(549,610),xy(549,630)]).
midline(r20, [xy(471,620),xy(459,620)]).
midline(r20, [xy(472,620),xy(540,620)]).
fillpoint(r20, xy(459,620), 10.0).
region(r13, '#870c25', 1500, centroid(514,384)).
perimeter(r13, 160).
polygon(r13, [xy(539,400),xy(490,400),xy(490,370),xy(539,370),xy(539,400)]).
midline(r13, [xy(522,385),xy(504,385)]).
midline(r13, [xy(523,384),xy(525,385)]).
fillpoint(r13, xy(504,385), 15.0).
region(r11, '#bebebe', 1000, centroid(514,360)).
perimeter(r11, 140).
polygon(r11, [xy(539,370),xy(490,370),xy(490,350),xy(539,350),xy(539,370)]).
midline(r11, [xy(511,360),xy(499,360)]).
midline(r11, [xy(512,359),xy(530,360)]).
fillpoint(r11, xy(499,360), 10.0).
region(r15, '#5a5a5a', 800, centroid(564,524)).
perimeter(r15, 160).
polygon(r15, [xy(579,540),xy(550,539),xy(550,510),xy(580,510),xy(579,540)]).
hole(r15, [xy(570,529),xy(569,520),xy(560,520),xy(560,530),xy(570,529)]).
midline(r15, [xy(569,514),xy(555,515),xy(555,534),xy(569,535),xy(574,533),xy(575,520),xy(574,516),xy(570,515)]).
fillpoint(r15, xy(556,515), 6.0).
fillpoint(r15, xy(574,515), 6.0).
fillpoint(r15, xy(555,534), 6.0).
fillpoint(r15, xy(573,534), 6.0).
fillpoint(r15, xy(561,515), 5.0).
fillpoint(r15, xy(554,525), 5.0).
fillpoint(r15, xy(574,525), 5.0).
fillpoint(r15, xy(561,535), 5.0).
region(r9, '#0074d9', 500, centroid(444,324)).
perimeter(r9, 120).
polygon(r9, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r9, [xy(445,311),xy(445,304)]).
midline(r9, [xy(444,312),xy(445,345)]).
fillpoint(r9, xy(444,325), 5.0).
region(r10, '#0074d9', 500, centroid(364,354)).
perimeter(r10, 120).
polygon(r10, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r10, [xy(376,355),xy(344,355)]).
midline(r10, [xy(377,354),xy(385,355)]).
fillpoint(r10, xy(344,355), 5.0).
region(r18, '#7fdbff', 400, centroid(80,560)).
perimeter(r18, 80).
polygon(r18, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r18, [xy(79,559),xy(80,560)]).
fillpoint(r18, xy(79,560), 10.0).
region(r21, '#7fdbff', 400, centroid(570,620)).
perimeter(r21, 80).
polygon(r21, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r21, [xy(569,619),xy(570,620)]).
fillpoint(r21, xy(569,620), 10.0).
region(r22, '#7fdbff', 400, centroid(600,620)).
perimeter(r22, 80).
polygon(r22, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r22, [xy(599,619),xy(600,620)]).
fillpoint(r22, xy(599,620), 10.0).
region(r23, '#2ecc40', 400, centroid(630,620)).
perimeter(r23, 80).
polygon(r23, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r23, [xy(629,619),xy(630,620)]).
fillpoint(r23, xy(629,620), 10.0).
border(r23).
region(r16, '#2ecc40', 100, centroid(564,524)).
perimeter(r16, 40).
polygon(r16, [xy(569,530),xy(560,529),xy(560,520),xy(570,520),xy(569,530)]).
midline(r16, [xy(565,525),xy(565,524)]).
fillpoint(r16, xy(564,525), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 80).
adjacent(r1, r3).
shared_edge(r1, r3, 520).
adjacent(r1, r5).
shared_edge(r1, r5, 140).
adjacent(r1, r12).
shared_edge(r1, r12, 340).
adjacent(r1, r17).
shared_edge(r1, r17, 240).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 660).
adjacent(r1, r20).
shared_edge(r1, r20, 220).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 320).
adjacent(r2, r9).
shared_edge(r2, r9, 60).
adjacent(r3, r5).
shared_edge(r3, r5, 460).
adjacent(r3, r9).
shared_edge(r3, r9, 60).
adjacent(r3, r10).
shared_edge(r3, r10, 70).
adjacent(r3, r11).
shared_edge(r3, r11, 90).
adjacent(r3, r12).
shared_edge(r3, r12, 600).
adjacent(r3, r13).
shared_edge(r3, r13, 110).
adjacent(r3, r15).
shared_edge(r3, r15, 120).
adjacent(r10, r12).
shared_edge(r10, r12, 50).
adjacent(r11, r13).
shared_edge(r11, r13, 50).
adjacent(r15, r16).
shared_edge(r15, r16, 40).
adjacent(r19, r20).
shared_edge(r19, r20, 20).

encloses(r15, r16).
encloses(r1, r17).
encloses(r1, r18).
encloses(r1, r21).
encloses(r1, r22).
