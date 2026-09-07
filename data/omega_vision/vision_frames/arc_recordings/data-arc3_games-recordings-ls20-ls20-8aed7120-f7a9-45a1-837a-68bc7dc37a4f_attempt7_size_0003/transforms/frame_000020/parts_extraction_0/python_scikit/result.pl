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

region(r1, '#aaaaaa', 288600, centroid(253,290)).
perimeter(r1, 4460).
polygon(r1, [xy(639,210),xy(620,210),xy(620,200),xy(610,199),xy(609,190),xy(590,190),xy(589,180),xy(550,180),xy(549,170),xy(470,170),xy(469,180),xy(430,180),xy(429,190),xy(410,190),xy(410,199),xy(400,200),xy(399,210),xy(380,210),xy(380,219),xy(370,220),xy(370,229),xy(360,230),xy(360,239),xy(350,240),xy(350,259),xy(340,260),xy(340,269),xy(330,270),xy(330,289),xy(320,290),xy(320,329),xy(310,330),xy(310,409),xy(320,410),xy(320,449),xy(330,450),xy(330,469),xy(339,470),xy(340,480),xy(350,480),xy(350,499),xy(359,500),xy(360,509),xy(369,510),xy(370,519),xy(379,520),xy(380,530),xy(399,530),xy(400,539),xy(409,540),xy(410,550),xy(429,550),xy(430,560),xy(469,560),xy(470,570),xy(549,570),xy(550,560),xy(589,560),xy(590,550),xy(609,550),xy(610,540),xy(620,539),xy(620,530),xy(639,530)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(555,84),xy(452,85),xy(428,90),xy(404,91),xy(367,99),xy(291,123),xy(245,142),xy(177,177),xy(164,234),xy(155,306),xy(154,409),xy(157,452),xy(114,496),xy(98,516),xy(84,538),xy(71,568),xy(77,581),xy(92,602),xy(120,630),xy(130,635),xy(553,634),xy(555,632),xy(555,594),xy(553,589),xy(470,590),xy(449,584),xy(430,585),xy(416,583),xy(404,578),xy(395,578),xy(366,567),xy(352,565),xy(301,544),xy(274,528),xy(250,517),xy(207,490),xy(158,452)]).
midline(r1, [xy(411,92),xy(431,112),xy(433,117),xy(430,122),xy(402,94)]).
midline(r1, [xy(555,589),xy(570,583),xy(572,585),xy(579,584),xy(585,586),xy(584,633),xy(579,635),xy(555,633)]).
midline(r1, [xy(420,92),xy(431,103),xy(433,107),xy(431,109),xy(433,109)]).
midline(r1, [xy(586,585),xy(599,584),xy(611,579),xy(622,562),xy(630,539)]).
midline(r1, [xy(209,490),xy(250,449),xy(246,447),xy(241,448),xy(204,485)]).
midline(r1, [xy(251,448),xy(251,446),xy(247,446)]).
midline(r1, [xy(206,487),xy(244,449)]).
midline(r1, [xy(433,111),xy(435,117),xy(431,124),xy(433,126),xy(435,124),xy(435,119)]).
midline(r1, [xy(434,127),xy(437,131),xy(439,129),xy(436,123)]).
midline(r1, [xy(611,581),xy(615,585),xy(614,633),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(252,445),xy(255,445),xy(254,448),xy(256,444),xy(261,442),xy(261,444)]).
midline(r1, [xy(555,86),xy(570,103),xy(583,123),xy(577,141),xy(568,157),xy(571,156)]).
midline(r1, [xy(582,129),xy(583,131),xy(580,134)]).
midline(r1, [xy(584,130),xy(585,127),xy(583,125),xy(586,128)]).
midline(r1, [xy(588,128),xy(602,144),xy(612,164),xy(620,173),xy(630,200)]).
midline(r1, [xy(440,130),xy(437,133),xy(439,135),xy(440,132)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(234,279),xy(171,214),xy(246,289),xy(246,292),xy(249,292),xy(247,290)]).
midline(r1, [xy(250,293),xy(252,292),xy(267,299),xy(272,297),xy(275,299),xy(270,300)]).
midline(r1, [xy(294,531),xy(327,498),xy(297,530)]).
midline(r1, [xy(275,438),xy(272,441),xy(264,441),xy(263,444),xy(265,445),xy(266,442)]).
midline(r1, [xy(273,442),xy(275,439)]).
midline(r1, [xy(276,442),xy(278,440),xy(276,437)]).
midline(r1, [xy(271,442),xy(268,442)]).
midline(r1, [xy(278,437),xy(284,434),xy(285,438),xy(283,440),xy(280,439)]).
midline(r1, [xy(268,444),xy(264,448),xy(260,446),xy(258,448)]).
midline(r1, [xy(286,434),xy(289,434),xy(287,438),xy(283,442),xy(279,441)]).
midline(r1, [xy(263,449),xy(260,448)]).
midline(r1, [xy(288,437),xy(291,434),xy(290,432),xy(293,430),xy(292,433)]).
midline(r1, [xy(295,430),xy(301,426),xy(301,428)]).
midline(r1, [xy(446,148),xy(440,142),xy(442,140),xy(440,136),xy(442,136)]).
midline(r1, [xy(447,149),xy(445,150)]).
midline(r1, [xy(446,147),xy(443,141)]).
midline(r1, [xy(448,151),xy(446,153),xy(448,155)]).
midline(r1, [xy(219,491),xy(260,450),xy(222,490)]).
midline(r1, [xy(278,302),xy(276,300),xy(276,302)]).
midline(r1, [xy(279,303),xy(278,300)]).
midline(r1, [xy(280,300),xy(282,304),xy(283,301)]).
midline(r1, [xy(284,304),xy(286,302),xy(287,305),xy(291,306),xy(288,306)]).
midline(r1, [xy(291,308),xy(292,307)]).
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
fillpoint(r1, xy(157,451), 158.0).
fillpoint(r1, xy(156,298), 157.0).
fillpoint(r1, xy(156,442), 157.0).
fillpoint(r1, xy(155,310), 156.0).
fillpoint(r1, xy(155,430), 156.0).
fillpoint(r1, xy(154,370), 155.0).
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
region(r3, '#2ecc40', 62800, centroid(475,353)).
perimeter(r3, 2260).
polygon(r3, [xy(589,550),xy(440,550),xy(440,500),xy(489,500),xy(490,450),xy(390,450),xy(389,350),xy(340,350),xy(340,469),xy(330,469),xy(330,450),xy(320,449),xy(320,410),xy(310,409),xy(310,330),xy(320,329),xy(320,290),xy(330,289),xy(330,270),xy(339,270),xy(340,260),xy(350,259),xy(350,240),xy(359,240),xy(360,230),xy(369,230),xy(370,220),xy(379,220),xy(380,210),xy(399,210),xy(400,200),xy(440,200),xy(440,349),xy(489,350),xy(490,400),xy(539,400),xy(540,350),xy(490,349),xy(490,170),xy(549,170),xy(550,180),xy(590,180),xy(590,449),xy(540,450),xy(540,499),xy(590,500),xy(589,550)]).
midline(r3, [xy(439,400),xy(419,371),xy(410,328),xy(402,314),xy(389,299),xy(387,297),xy(379,299),xy(356,313),xy(324,344),xy(324,395),xy(330,410),xy(329,440),xy(334,446),xy(335,465)]).
midline(r3, [xy(441,398),xy(540,299),xy(540,229),xy(524,203)]).
midline(r3, [xy(540,301),xy(556,320),xy(564,340),xy(565,399),xy(560,420),xy(549,424),xy(526,426),xy(514,431),xy(503,426),xy(481,424),xy(468,420),xy(454,412),xy(441,400)]).
midline(r3, [xy(387,296),xy(394,268),xy(401,252),xy(400,250),xy(412,234),xy(419,220)]).
midline(r3, [xy(515,432),xy(515,517),xy(499,524),xy(464,525)]).
midline(r3, [xy(515,518),xy(530,524),xy(565,525)]).
fillpoint(r3, xy(386,297), 53.0).
fillpoint(r3, xy(540,264), 50.0).
fillpoint(r3, xy(390,288), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(392,281), 48.0).
fillpoint(r3, xy(393,276), 47.0).
fillpoint(r3, xy(394,270), 46.0).
fillpoint(r3, xy(395,266), 45.0).
fillpoint(r3, xy(515,431), 31.4).
fillpoint(r3, xy(515,518), 31.4).
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
fillpoint(r3, xy(524,522), 28.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(563,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(563,412), 27.0).
fillpoint(r3, xy(477,423), 27.0).
fillpoint(r3, xy(552,423), 27.0).
fillpoint(r3, xy(502,426), 27.0).
fillpoint(r3, xy(527,426), 27.0).
fillpoint(r3, xy(502,523), 27.0).
fillpoint(r3, xy(527,523), 27.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(564,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(564,408), 26.0).
fillpoint(r3, xy(482,424), 26.0).
fillpoint(r3, xy(548,424), 26.0).
fillpoint(r3, xy(498,425), 26.0).
fillpoint(r3, xy(532,425), 26.0).
fillpoint(r3, xy(498,524), 26.0).
fillpoint(r3, xy(532,524), 26.0).
fillpoint(r3, xy(564,375), 25.0).
fillpoint(r3, xy(514,475), 25.0).
fillpoint(r3, xy(464,525), 25.0).
fillpoint(r3, xy(541,525), 25.0).
fillpoint(r3, xy(325,344), 16.0).
fillpoint(r3, xy(325,373), 15.0).
region(r5, '#ffdc00', 19500, centroid(607,383)).
perimeter(r5, 920).
polygon(r5, [xy(639,530),xy(620,530),xy(620,539),xy(610,540),xy(609,550),xy(590,550),xy(590,500),xy(540,499),xy(540,450),xy(590,449),xy(590,190),xy(609,190),xy(610,199),xy(620,200),xy(620,210),xy(639,210)]).
midline(r5, [xy(614,240),xy(615,234),xy(607,222),xy(600,205),xy(600,199)]).
midline(r5, [xy(615,241),xy(615,448),xy(613,463),xy(609,473),xy(606,475),xy(564,475)]).
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
region(r9, '#ffdc00', 16800, centroid(415,475)).
perimeter(r9, 1020).
polygon(r9, [xy(549,570),xy(470,570),xy(469,560),xy(430,560),xy(429,550),xy(410,550),xy(410,540),xy(400,540),xy(399,530),xy(380,530),xy(380,520),xy(370,520),xy(370,510),xy(360,509),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,549),xy(590,550),xy(589,560),xy(550,560),xy(549,570)]).
midline(r9, [xy(531,559),xy(479,560),xy(469,554),xy(441,555),xy(435,553),xy(434,546),xy(424,534),xy(415,510),xy(404,495),xy(403,489),xy(396,486),xy(364,455),xy(365,384)]).
midline(r9, [xy(403,488),xy(426,476),xy(442,474),xy(465,475)]).
midline(r9, [xy(532,559),xy(540,560),xy(544,556),xy(551,554),xy(585,555)]).
fillpoint(r9, xy(402,488), 39.0).
fillpoint(r9, xy(421,478), 29.0).
fillpoint(r9, xy(424,477), 28.0).
fillpoint(r9, xy(427,476), 27.0).
fillpoint(r9, xy(432,475), 26.0).
fillpoint(r9, xy(365,455), 25.7).
fillpoint(r9, xy(365,416), 25.0).
fillpoint(r9, xy(441,475), 25.0).
fillpoint(r9, xy(424,534), 16.0).
fillpoint(r9, xy(479,560), 10.0).
region(r2, '#ffdc00', 8300, centroid(466,258)).
perimeter(r2, 480).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(430,190),xy(430,180),xy(469,180),xy(470,170),xy(490,170),xy(489,350)]).
midline(r2, [xy(470,328),xy(470,330)]).
midline(r2, [xy(470,327),xy(470,300),xy(464,279),xy(465,205),xy(445,186),xy(434,185)]).
midline(r2, [xy(465,204),xy(475,193),xy(480,179)]).
fillpoint(r2, xy(465,242), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(479,184), 11.0).
region(r13, '#5a5a5a', 6800, centroid(380,620)).
perimeter(r13, 720).
polygon(r13, [xy(549,630),xy(210,630),xy(210,610),xy(549,610),xy(549,630)]).
midline(r13, [xy(436,620),xy(219,620)]).
midline(r13, [xy(437,620),xy(540,620)]).
fillpoint(r13, xy(219,620), 10.0).
region(r12, '#2ecc40', 1600, centroid(170,620)).
perimeter(r12, 200).
polygon(r12, [xy(209,630),xy(130,630),xy(130,610),xy(209,610),xy(209,630)]).
midline(r12, [xy(163,619),xy(139,620)]).
midline(r12, [xy(164,620),xy(200,620)]).
fillpoint(r12, xy(139,620), 10.0).
region(r10, '#870c25', 1500, centroid(514,384)).
perimeter(r10, 160).
polygon(r10, [xy(539,400),xy(490,400),xy(490,370),xy(539,370),xy(539,400)]).
midline(r10, [xy(516,384),xy(504,385)]).
midline(r10, [xy(517,384),xy(525,385)]).
fillpoint(r10, xy(504,385), 15.0).
region(r8, '#bebebe', 1000, centroid(514,360)).
perimeter(r8, 140).
polygon(r8, [xy(539,370),xy(490,370),xy(490,350),xy(539,350),xy(539,370)]).
midline(r8, [xy(520,360),xy(499,360)]).
midline(r8, [xy(521,359),xy(530,360)]).
fillpoint(r8, xy(499,360), 10.0).
region(r6, '#0074d9', 500, centroid(444,324)).
perimeter(r6, 120).
polygon(r6, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r6, [xy(445,314),xy(445,304)]).
midline(r6, [xy(444,315),xy(445,345)]).
fillpoint(r6, xy(444,325), 5.0).
region(r7, '#0074d9', 500, centroid(364,354)).
perimeter(r7, 120).
polygon(r7, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r7, [xy(359,354),xy(344,355)]).
midline(r7, [xy(360,355),xy(385,355)]).
fillpoint(r7, xy(344,355), 5.0).
region(r14, '#7fdbff', 400, centroid(570,620)).
perimeter(r14, 80).
polygon(r14, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r14, [xy(569,619),xy(570,620)]).
fillpoint(r14, xy(569,620), 10.0).
region(r15, '#7fdbff', 400, centroid(600,620)).
perimeter(r15, 80).
polygon(r15, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r15, [xy(599,619),xy(600,620)]).
fillpoint(r15, xy(599,620), 10.0).
region(r16, '#7fdbff', 400, centroid(630,620)).
perimeter(r16, 80).
polygon(r16, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r16, [xy(629,619),xy(630,620)]).
fillpoint(r16, xy(629,620), 10.0).
border(r16).

adjacent(r1, r2).
shared_edge(r1, r2, 80).
adjacent(r1, r3).
shared_edge(r1, r3, 520).
adjacent(r1, r5).
shared_edge(r1, r5, 140).
adjacent(r1, r9).
shared_edge(r1, r9, 340).
adjacent(r1, r12).
shared_edge(r1, r12, 180).
adjacent(r1, r13).
shared_edge(r1, r13, 700).
adjacent(r1, r14).
shared_edge(r1, r14, 80).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 320).
adjacent(r2, r6).
shared_edge(r2, r6, 60).
adjacent(r3, r5).
shared_edge(r3, r5, 460).
adjacent(r3, r6).
shared_edge(r3, r6, 60).
adjacent(r3, r7).
shared_edge(r3, r7, 70).
adjacent(r3, r8).
shared_edge(r3, r8, 90).
adjacent(r3, r9).
shared_edge(r3, r9, 600).
adjacent(r3, r10).
shared_edge(r3, r10, 110).
adjacent(r7, r9).
shared_edge(r7, r9, 50).
adjacent(r8, r10).
shared_edge(r8, r10, 50).
adjacent(r12, r13).
shared_edge(r12, r13, 20).

encloses(r1, r14).
encloses(r1, r15).
