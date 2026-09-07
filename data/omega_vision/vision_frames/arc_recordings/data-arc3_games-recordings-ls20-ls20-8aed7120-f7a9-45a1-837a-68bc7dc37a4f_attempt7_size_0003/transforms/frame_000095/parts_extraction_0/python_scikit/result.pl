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

region(r1, '#aaaaaa', 289400, centroid(257,272)).
perimeter(r1, 4740).
polygon(r1, [xy(639,260),xy(620,260),xy(620,250),xy(610,250),xy(609,240),xy(590,240),xy(589,230),xy(550,230),xy(549,220),xy(470,220),xy(469,230),xy(430,230),xy(429,240),xy(410,240),xy(410,249),xy(400,250),xy(399,260),xy(380,260),xy(380,269),xy(370,270),xy(370,279),xy(360,280),xy(360,289),xy(350,290),xy(350,309),xy(340,310),xy(340,319),xy(330,320),xy(330,339),xy(320,340),xy(320,379),xy(310,380),xy(310,459),xy(320,460),xy(320,489),xy(350,490),xy(350,549),xy(359,550),xy(360,559),xy(369,560),xy(370,570),xy(380,570),xy(380,580),xy(399,580),xy(400,589),xy(409,590),xy(410,600),xy(609,600),xy(610,590),xy(620,589),xy(620,580),xy(639,580)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(438,604),xy(406,604),xy(400,599),xy(394,599),xy(385,594),xy(373,594),xy(338,580),xy(314,569),xy(284,544),xy(260,535),xy(234,519),xy(193,489),xy(179,454),xy(165,426),xy(153,408),xy(103,446),xy(30,519),xy(19,533),xy(15,543),xy(15,596),xy(19,606),xy(27,616),xy(37,622),xy(51,625),xy(96,624),xy(109,617),xy(111,598),xy(119,580),xy(81,580),xy(59,560)]).
midline(r1, [xy(439,605),xy(553,605),xy(555,606),xy(555,632),xy(549,635),xy(132,635),xy(124,633),xy(109,619)]).
midline(r1, [xy(247,525),xy(283,487),xy(273,488),xy(240,521),xy(273,490)]).
midline(r1, [xy(155,408),xy(155,356),xy(167,269),xy(189,189),xy(203,183)]).
midline(r1, [xy(555,633),xy(560,635),xy(577,635),xy(583,634),xy(585,631),xy(585,610),xy(583,605),xy(556,605)]).
midline(r1, [xy(285,487),xy(290,482),xy(282,485)]).
midline(r1, [xy(170,267),xy(245,342),xy(251,341),xy(171,261)]).
midline(r1, [xy(252,341),xy(251,343)]).
midline(r1, [xy(204,181),xy(286,146),xy(288,147),xy(298,142),xy(328,134),xy(327,136),xy(411,220)]).
midline(r1, [xy(60,558),xy(60,492)]).
midline(r1, [xy(193,491),xy(179,515),xy(165,533),xy(120,579)]).
midline(r1, [xy(585,606),xy(590,604),xy(614,605),xy(619,599),xy(627,598),xy(630,589)]).
midline(r1, [xy(615,606),xy(615,632),xy(613,634),xy(590,635),xy(585,633)]).
midline(r1, [xy(329,133),xy(392,118),xy(432,159),xy(432,155),xy(393,117)]).
midline(r1, [xy(396,117),xy(450,110),xy(530,109),xy(562,143),xy(582,172),xy(574,198),xy(568,207),xy(572,204)]).
midline(r1, [xy(433,160),xy(434,163),xy(432,165),xy(434,167),xy(432,169),xy(436,169),xy(434,171),xy(436,174),xy(436,171)]).
midline(r1, [xy(438,174),xy(437,177),xy(439,177)]).
midline(r1, [xy(434,164),xy(435,166)]).
midline(r1, [xy(439,179),xy(439,187),xy(443,189)]).
midline(r1, [xy(441,183),xy(441,185)]).
midline(r1, [xy(253,344),xy(255,343),xy(261,347),xy(263,345),xy(263,347)]).
midline(r1, [xy(265,347),xy(284,355),xy(288,354),xy(287,356)]).
midline(r1, [xy(290,356),xy(289,357)]).
midline(r1, [xy(583,174),xy(604,197),xy(611,212),xy(622,227),xy(630,250)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(291,481),xy(299,477),xy(299,479)]).
midline(r1, [xy(342,199),xy(381,238)]).
fillpoint(r1, xy(189,189), 190.0).
fillpoint(r1, xy(187,196), 188.0).
fillpoint(r1, xy(186,200), 187.0).
fillpoint(r1, xy(179,222), 180.0).
fillpoint(r1, xy(178,225), 179.0).
fillpoint(r1, xy(177,229), 178.0).
fillpoint(r1, xy(175,236), 176.0).
fillpoint(r1, xy(174,240), 175.0).
fillpoint(r1, xy(173,244), 174.0).
fillpoint(r1, xy(172,249), 173.0).
fillpoint(r1, xy(171,254), 172.0).
fillpoint(r1, xy(169,261), 170.0).
fillpoint(r1, xy(168,266), 169.0).
fillpoint(r1, xy(167,270), 168.0).
fillpoint(r1, xy(166,275), 167.0).
fillpoint(r1, xy(165,280), 166.0).
fillpoint(r1, xy(164,286), 165.0).
fillpoint(r1, xy(163,292), 164.0).
fillpoint(r1, xy(162,299), 163.0).
fillpoint(r1, xy(161,307), 162.0).
fillpoint(r1, xy(160,319), 161.0).
fillpoint(r1, xy(159,327), 160.0).
fillpoint(r1, xy(158,333), 159.0).
fillpoint(r1, xy(157,339), 158.0).
fillpoint(r1, xy(156,348), 157.0).
fillpoint(r1, xy(155,360), 156.0).
fillpoint(r1, xy(155,395), 155.0).
fillpoint(r1, xy(287,146), 147.0).
fillpoint(r1, xy(290,145), 146.0).
fillpoint(r1, xy(293,144), 145.0).
fillpoint(r1, xy(296,143), 144.0).
fillpoint(r1, xy(299,142), 143.0).
fillpoint(r1, xy(309,139), 140.0).
fillpoint(r1, xy(313,138), 139.0).
fillpoint(r1, xy(317,137), 138.0).
fillpoint(r1, xy(342,129), 130.0).
fillpoint(r1, xy(182,462), 128.0).
fillpoint(r1, xy(354,126), 127.0).
fillpoint(r1, xy(358,125), 126.0).
fillpoint(r1, xy(363,124), 125.0).
fillpoint(r1, xy(367,123), 124.0).
fillpoint(r1, xy(187,474), 123.9).
fillpoint(r1, xy(371,122), 123.0).
fillpoint(r1, xy(189,479), 122.6).
fillpoint(r1, xy(375,121), 122.0).
fillpoint(r1, xy(191,484), 121.5).
fillpoint(r1, xy(379,120), 121.0).
fillpoint(r1, xy(192,486), 121.0).
fillpoint(r1, xy(193,489), 120.6).
fillpoint(r1, xy(384,119), 120.0).
fillpoint(r1, xy(389,118), 119.0).
fillpoint(r1, xy(395,117), 118.0).
fillpoint(r1, xy(402,116), 117.0).
fillpoint(r1, xy(412,115), 116.0).
fillpoint(r1, xy(425,114), 115.0).
fillpoint(r1, xy(430,113), 114.0).
fillpoint(r1, xy(436,112), 113.0).
fillpoint(r1, xy(443,111), 112.0).
fillpoint(r1, xy(453,110), 111.0).
fillpoint(r1, xy(471,110), 110.0).
border(r1).
region(r4, '#ffdc00', 45400, centroid(508,474)).
perimeter(r4, 1900).
polygon(r4, [xy(639,580),xy(620,580),xy(620,589),xy(610,590),xy(609,600),xy(410,600),xy(410,590),xy(400,590),xy(399,580),xy(380,580),xy(380,570),xy(370,570),xy(370,560),xy(360,559),xy(360,480),xy(340,480),xy(340,464),xy(340,360),xy(389,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,550),xy(589,550),xy(590,500),xy(540,500),xy(540,450),xy(590,449),xy(590,240),xy(609,240),xy(610,249),xy(620,250),xy(620,260),xy(639,260)]).
midline(r4, [xy(615,301),xy(615,284),xy(607,272),xy(600,255),xy(600,249)]).
midline(r4, [xy(615,302),xy(615,446),xy(613,463),xy(607,475),xy(564,475)]).
midline(r4, [xy(608,475),xy(613,486),xy(615,500),xy(614,555),xy(599,570),xy(590,575),xy(431,575),xy(421,567),xy(407,549),xy(400,539),xy(399,533),xy(397,532),xy(392,536),xy(386,537),xy(386,539)]).
midline(r4, [xy(399,532),xy(400,490),xy(364,455),xy(365,384)]).
midline(r4, [xy(401,490),xy(410,483),xy(426,476),xy(441,474),xy(465,475)]).
fillpoint(r4, xy(400,491), 41.0).
fillpoint(r4, xy(400,517), 40.0).
fillpoint(r4, xy(608,475), 31.4).
fillpoint(r4, xy(611,468), 29.0).
fillpoint(r4, xy(421,478), 29.0).
fillpoint(r4, xy(611,481), 29.0).
fillpoint(r4, xy(612,465), 28.0).
fillpoint(r4, xy(424,477), 28.0).
fillpoint(r4, xy(612,484), 28.0).
fillpoint(r4, xy(613,462), 27.0).
fillpoint(r4, xy(427,476), 27.0).
fillpoint(r4, xy(613,487), 27.0).
fillpoint(r4, xy(429,573), 26.2).
fillpoint(r4, xy(614,458), 26.0).
fillpoint(r4, xy(432,475), 26.0).
fillpoint(r4, xy(614,492), 26.0).
fillpoint(r4, xy(432,574), 26.0).
fillpoint(r4, xy(365,455), 25.7).
fillpoint(r4, xy(614,555), 25.7).
fillpoint(r4, xy(419,564), 25.6).
fillpoint(r4, xy(420,565), 25.6).
fillpoint(r4, xy(421,567), 25.6).
fillpoint(r4, xy(422,568), 25.6).
fillpoint(r4, xy(424,569), 25.6).
fillpoint(r4, xy(425,570), 25.6).
fillpoint(r4, xy(615,366), 25.0).
fillpoint(r4, xy(365,416), 25.0).
fillpoint(r4, xy(441,475), 25.0).
fillpoint(r4, xy(564,475), 25.0).
fillpoint(r4, xy(614,525), 25.0).
fillpoint(r4, xy(441,575), 25.0).
fillpoint(r4, xy(590,574), 25.0).
fillpoint(r4, xy(600,569), 22.8).
fillpoint(r4, xy(605,265), 16.0).
fillpoint(r4, xy(600,254), 11.0).
border(r4).
region(r3, '#2ecc40', 43600, centroid(466,349)).
perimeter(r3, 1800).
polygon(r3, [xy(359,550),xy(350,549),xy(350,490),xy(320,490),xy(320,460),xy(310,459),xy(310,380),xy(320,379),xy(320,340),xy(330,339),xy(330,320),xy(339,320),xy(340,310),xy(350,309),xy(350,290),xy(359,290),xy(360,280),xy(369,280),xy(370,270),xy(380,269),xy(380,260),xy(399,260),xy(400,250),xy(409,250),xy(410,240),xy(429,240),xy(430,230),xy(439,230),xy(440,349),xy(489,350),xy(490,220),xy(549,220),xy(550,230),xy(589,230),xy(589,450),xy(540,450),xy(539,400),xy(490,400),xy(489,450),xy(390,450),xy(390,350),xy(340,350),xy(340,479),xy(360,480),xy(359,550)]).
midline(r3, [xy(329,480),xy(329,454),xy(324,445),xy(324,394),xy(330,379),xy(329,349),xy(344,334),xy(377,320),xy(379,317),xy(372,308),xy(381,317),xy(398,308),xy(413,336),xy(418,369),xy(427,385),xy(439,400),xy(454,387),xy(470,378),xy(480,375),xy(499,374),xy(519,366),xy(540,349),xy(540,278),xy(524,254),xy(528,248),xy(527,246),xy(529,246)]).
midline(r3, [xy(331,480),xy(340,485),xy(354,485),xy(355,545)]).
midline(r3, [xy(540,351),xy(552,364),xy(561,380),xy(565,400),xy(565,425)]).
midline(r3, [xy(399,307),xy(400,300),xy(407,291),xy(398,282),xy(407,289),xy(410,287),xy(424,254),xy(434,243),xy(435,234)]).
fillpoint(r3, xy(540,314), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(398,309), 41.7).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(508,371), 29.0).
fillpoint(r3, xy(471,378), 29.0).
fillpoint(r3, xy(561,381), 29.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(505,372), 28.0).
fillpoint(r3, xy(474,377), 28.0).
fillpoint(r3, xy(562,384), 28.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(502,373), 27.0).
fillpoint(r3, xy(477,376), 27.0).
fillpoint(r3, xy(563,387), 27.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(498,374), 26.0).
fillpoint(r3, xy(482,375), 26.0).
fillpoint(r3, xy(564,392), 26.0).
fillpoint(r3, xy(565,413), 25.0).
fillpoint(r3, xy(424,255), 16.0).
fillpoint(r3, xy(345,334), 16.0).
fillpoint(r3, xy(324,420), 15.0).
region(r9, '#2ecc40', 9100, centroid(510,511)).
perimeter(r9, 620).
polygon(r9, [xy(589,550),xy(440,550),xy(440,500),xy(489,500),xy(490,450),xy(539,450),xy(540,499),xy(590,500),xy(589,550)]).
hole(r9, [xy(580,539),xy(579,510),xy(550,510),xy(550,540),xy(580,539)]).
midline(r9, [xy(546,544),xy(514,517),xy(515,474)]).
midline(r9, [xy(523,521),xy(546,505),xy(584,505),xy(584,543),xy(579,545),xy(547,544)]).
midline(r9, [xy(514,518),xy(498,524),xy(464,525)]).
fillpoint(r9, xy(515,518), 31.4).
fillpoint(r9, xy(508,521), 29.0).
fillpoint(r9, xy(521,521), 29.0).
fillpoint(r9, xy(505,522), 28.0).
fillpoint(r9, xy(502,523), 27.0).
fillpoint(r9, xy(498,524), 26.0).
fillpoint(r9, xy(515,486), 25.0).
fillpoint(r9, xy(464,525), 25.0).
region(r14, '#2ecc40', 6800, centroid(300,620)).
perimeter(r14, 720).
polygon(r14, [xy(469,630),xy(130,630),xy(130,610),xy(469,610),xy(469,630)]).
midline(r14, [xy(345,620),xy(139,620)]).
midline(r14, [xy(346,620),xy(460,620)]).
fillpoint(r14, xy(139,620), 10.0).
region(r2, '#ffdc00', 5700, centroid(467,284)).
perimeter(r2, 360).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,230),xy(469,230),xy(470,220),xy(490,220),xy(489,350)]).
midline(r2, [xy(478,237),xy(464,254),xy(464,280),xy(468,288),xy(470,301),xy(470,330)]).
midline(r2, [xy(478,236),xy(480,229)]).
fillpoint(r2, xy(465,267), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(479,234), 11.0).
region(r12, '#7fdbff', 2000, centroid(56,584)).
perimeter(r12, 240).
polygon(r12, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r12, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r12, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r12, xy(41,578), 12.0).
fillpoint(r12, xy(58,581), 12.0).
fillpoint(r12, xy(61,598), 12.0).
fillpoint(r12, xy(40,574), 11.0).
fillpoint(r12, xy(45,579), 11.0).
fillpoint(r12, xy(54,580), 11.0).
fillpoint(r12, xy(59,585), 11.0).
fillpoint(r12, xy(60,594), 11.0).
fillpoint(r12, xy(65,599), 11.0).
fillpoint(r12, xy(39,564), 10.0).
fillpoint(r12, xy(71,600), 10.0).
region(r15, '#5a5a5a', 1600, centroid(510,620)).
perimeter(r15, 200).
polygon(r15, [xy(549,630),xy(470,630),xy(470,610),xy(549,610),xy(549,630)]).
midline(r15, [xy(491,620),xy(479,620)]).
midline(r15, [xy(492,619),xy(540,620)]).
fillpoint(r15, xy(479,620), 10.0).
region(r8, '#870c25', 1500, centroid(514,434)).
perimeter(r8, 160).
polygon(r8, [xy(539,450),xy(490,450),xy(490,420),xy(539,420),xy(539,450)]).
midline(r8, [xy(522,435),xy(504,435)]).
midline(r8, [xy(523,435),xy(525,435)]).
fillpoint(r8, xy(504,435), 15.0).
region(r7, '#bebebe', 1000, centroid(514,410)).
perimeter(r7, 140).
polygon(r7, [xy(539,420),xy(490,420),xy(490,400),xy(539,400),xy(539,420)]).
midline(r7, [xy(509,410),xy(499,410)]).
midline(r7, [xy(510,410),xy(530,410)]).
fillpoint(r7, xy(499,410), 10.0).
region(r10, '#5a5a5a', 800, centroid(564,524)).
perimeter(r10, 160).
polygon(r10, [xy(579,540),xy(550,539),xy(550,510),xy(580,510),xy(579,540)]).
hole(r10, [xy(570,529),xy(569,520),xy(560,520),xy(560,530),xy(570,529)]).
midline(r10, [xy(555,527),xy(555,515),xy(574,515),xy(574,533),xy(569,535),xy(556,534),xy(554,528)]).
fillpoint(r10, xy(556,515), 6.0).
fillpoint(r10, xy(574,515), 6.0).
fillpoint(r10, xy(555,534), 6.0).
fillpoint(r10, xy(573,534), 6.0).
fillpoint(r10, xy(561,515), 5.0).
fillpoint(r10, xy(554,525), 5.0).
fillpoint(r10, xy(574,525), 5.0).
fillpoint(r10, xy(561,535), 5.0).
region(r5, '#0074d9', 500, centroid(444,324)).
perimeter(r5, 120).
polygon(r5, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r5, [xy(445,311),xy(445,304)]).
midline(r5, [xy(445,312),xy(445,345)]).
fillpoint(r5, xy(444,325), 5.0).
region(r6, '#0074d9', 500, centroid(364,354)).
perimeter(r6, 120).
polygon(r6, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r6, [xy(359,354),xy(344,355)]).
midline(r6, [xy(360,355),xy(385,355)]).
fillpoint(r6, xy(344,355), 5.0).
region(r13, '#7fdbff', 400, centroid(80,560)).
perimeter(r13, 80).
polygon(r13, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r13, [xy(79,559),xy(80,560)]).
fillpoint(r13, xy(79,560), 10.0).
region(r16, '#7fdbff', 400, centroid(570,620)).
perimeter(r16, 80).
polygon(r16, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r16, [xy(569,619),xy(570,620)]).
fillpoint(r16, xy(569,620), 10.0).
region(r17, '#7fdbff', 400, centroid(600,620)).
perimeter(r17, 80).
polygon(r17, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r17, [xy(599,619),xy(600,620)]).
fillpoint(r17, xy(599,620), 10.0).
region(r18, '#2ecc40', 400, centroid(630,620)).
perimeter(r18, 80).
polygon(r18, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r18, [xy(629,619),xy(630,620)]).
fillpoint(r18, xy(629,620), 10.0).
border(r18).
region(r11, '#2ecc40', 100, centroid(564,524)).
perimeter(r11, 40).
polygon(r11, [xy(569,530),xy(560,529),xy(560,520),xy(570,520),xy(569,530)]).
midline(r11, [xy(565,525),xy(565,524)]).
fillpoint(r11, xy(564,525), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 60).
adjacent(r1, r3).
shared_edge(r1, r3, 620).
adjacent(r1, r4).
shared_edge(r1, r4, 420).
adjacent(r1, r12).
shared_edge(r1, r12, 240).
adjacent(r1, r13).
shared_edge(r1, r13, 80).
adjacent(r1, r14).
shared_edge(r1, r14, 700).
adjacent(r1, r15).
shared_edge(r1, r15, 180).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 240).
adjacent(r2, r5).
shared_edge(r2, r5, 60).
adjacent(r3, r4).
shared_edge(r3, r4, 660).
adjacent(r3, r5).
shared_edge(r3, r5, 60).
adjacent(r3, r6).
shared_edge(r3, r6, 70).
adjacent(r3, r7).
shared_edge(r3, r7, 90).
adjacent(r3, r8).
shared_edge(r3, r8, 60).
adjacent(r4, r6).
shared_edge(r4, r6, 50).
adjacent(r4, r9).
shared_edge(r4, r9, 450).
adjacent(r7, r8).
shared_edge(r7, r8, 50).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r9, r10).
shared_edge(r9, r10, 120).
adjacent(r10, r11).
shared_edge(r10, r11, 40).
adjacent(r14, r15).
shared_edge(r14, r15, 20).

encloses(r10, r11).
encloses(r1, r12).
encloses(r1, r13).
encloses(r1, r16).
encloses(r1, r17).
