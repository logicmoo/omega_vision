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

region(r1, '#aaaaaa', 305300, centroid(265,272)).
perimeter(r1, 4500).
polygon(r1, [xy(639,310),xy(620,310),xy(620,300),xy(610,300),xy(609,290),xy(590,290),xy(589,280),xy(550,280),xy(549,270),xy(470,270),xy(469,280),xy(430,280),xy(429,290),xy(410,290),xy(410,299),xy(400,300),xy(399,310),xy(380,310),xy(380,319),xy(370,320),xy(370,329),xy(360,330),xy(360,339),xy(350,340),xy(350,359),xy(340,360),xy(340,369),xy(330,370),xy(330,389),xy(320,390),xy(320,429),xy(310,430),xy(310,465),xy(310,490),xy(350,490),xy(350,559),xy(330,560),xy(330,569),xy(339,570),xy(340,580),xy(350,580),xy(350,600),xy(639,600)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
hole(r1, [xy(330,519),xy(329,510),xy(320,510),xy(320,520),xy(330,519)]).
hole(r1, [xy(330,539),xy(329,530),xy(320,530),xy(320,540),xy(330,539)]).
midline(r1, [xy(69,570),xy(84,538),xy(98,516),xy(114,496),xy(155,453),xy(155,406),xy(162,347),xy(178,274),xy(201,203),xy(231,191)]).
midline(r1, [xy(72,570),xy(73,575),xy(75,575)]).
midline(r1, [xy(169,319),xy(241,391),xy(244,390),xy(170,316)]).
midline(r1, [xy(155,455),xy(205,504),xy(239,529),xy(255,524),xy(269,525),xy(276,518),xy(272,524),xy(275,525),xy(281,519),xy(278,518)]).
midline(r1, [xy(240,530),xy(270,557),xy(288,568),xy(292,565),xy(294,566),xy(292,567)]).
midline(r1, [xy(280,516),xy(288,514),xy(277,525)]).
midline(r1, [xy(280,524),xy(339,524),xy(339,504),xy(335,500),xy(314,500),xy(289,513)]).
midline(r1, [xy(339,526),xy(340,539),xy(337,548),xy(324,550),xy(295,565)]).
midline(r1, [xy(244,392),xy(249,391),xy(252,394)]).
midline(r1, [xy(75,577),xy(91,601),xy(124,633),xy(133,635),xy(547,635),xy(555,632),xy(555,609),xy(553,605),xy(353,605),xy(346,604),xy(334,594),xy(310,585),xy(289,569)]).
midline(r1, [xy(555,633),xy(560,635),xy(578,635),xy(583,634),xy(585,631),xy(585,611),xy(583,605),xy(560,604),xy(555,606)]).
midline(r1, [xy(585,606),xy(591,604),xy(609,604),xy(614,607),xy(620,604),xy(635,605)]).
midline(r1, [xy(615,608),xy(615,632),xy(613,634),xy(590,635),xy(585,633)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(232,189),xy(245,185)]).
midline(r1, [xy(246,183),xy(320,158),xy(369,146),xy(368,149),xy(371,148),xy(370,151),xy(373,150),xy(372,153),xy(375,152),xy(374,155),xy(377,154),xy(376,157),xy(379,156),xy(378,159),xy(381,158),xy(380,161),xy(383,160),xy(382,163),xy(385,162),xy(384,165),xy(387,164),xy(386,167),xy(389,166),xy(388,169),xy(391,168),xy(390,171),xy(393,170),xy(392,173),xy(395,172),xy(394,175),xy(397,174),xy(396,177),xy(399,176),xy(398,179),xy(401,178),xy(400,181),xy(403,180),xy(402,183),xy(405,182),xy(404,185),xy(407,184),xy(406,187),xy(409,186),xy(408,189),xy(411,188),xy(410,191),xy(413,190),xy(412,193),xy(415,192),xy(414,195),xy(417,194),xy(416,197),xy(419,196),xy(418,199),xy(421,198),xy(420,201),xy(423,200),xy(422,203),xy(425,202),xy(424,205),xy(427,204),xy(426,207),xy(429,206),xy(429,210),xy(433,207),xy(431,199),xy(377,145),xy(371,146)]).
midline(r1, [xy(378,144),xy(447,135),xy(505,134),xy(562,193),xy(575,210),xy(582,222),xy(575,242),xy(576,245),xy(578,241)]).
midline(r1, [xy(582,227),xy(583,224)]).
midline(r1, [xy(433,209),xy(430,211),xy(434,213),xy(434,218),xy(436,218)]).
midline(r1, [xy(578,239),xy(579,236)]).
midline(r1, [xy(585,225),xy(606,250),xy(612,263),xy(608,267),xy(606,271),xy(608,271)]).
midline(r1, [xy(613,264),xy(622,277),xy(630,300)]).
midline(r1, [xy(254,394),xy(265,398),xy(268,395),xy(267,398)]).
midline(r1, [xy(270,397),xy(269,398)]).
midline(r1, [xy(447,256),xy(448,251),xy(441,244),xy(443,240),xy(437,227),xy(438,224),xy(435,221),xy(437,221)]).
midline(r1, [xy(445,246),xy(444,243)]).
midline(r1, [xy(450,259),xy(449,255),xy(451,258)]).
fillpoint(r1, xy(202,202), 202.4).
fillpoint(r1, xy(196,217), 197.0).
fillpoint(r1, xy(195,220), 196.0).
fillpoint(r1, xy(194,223), 195.0).
fillpoint(r1, xy(193,226), 194.0).
fillpoint(r1, xy(192,229), 193.0).
fillpoint(r1, xy(191,232), 192.0).
fillpoint(r1, xy(189,239), 190.0).
fillpoint(r1, xy(187,246), 188.0).
fillpoint(r1, xy(186,250), 187.0).
fillpoint(r1, xy(179,272), 180.0).
fillpoint(r1, xy(178,275), 179.0).
fillpoint(r1, xy(177,279), 178.0).
fillpoint(r1, xy(267,175), 176.0).
fillpoint(r1, xy(175,286), 176.0).
fillpoint(r1, xy(174,290), 175.0).
fillpoint(r1, xy(173,294), 174.0).
fillpoint(r1, xy(172,299), 173.0).
fillpoint(r1, xy(171,304), 172.0).
fillpoint(r1, xy(285,169), 170.0).
fillpoint(r1, xy(169,311), 170.0).
fillpoint(r1, xy(288,168), 169.0).
fillpoint(r1, xy(168,316), 169.0).
fillpoint(r1, xy(167,320), 168.0).
fillpoint(r1, xy(295,166), 167.0).
fillpoint(r1, xy(166,325), 167.0).
fillpoint(r1, xy(299,165), 166.0).
fillpoint(r1, xy(165,330), 166.0).
fillpoint(r1, xy(303,164), 165.0).
fillpoint(r1, xy(164,336), 165.0).
fillpoint(r1, xy(163,342), 164.0).
fillpoint(r1, xy(309,162), 163.0).
fillpoint(r1, xy(162,349), 163.0).
fillpoint(r1, xy(312,161), 162.0).
fillpoint(r1, xy(161,357), 162.0).
fillpoint(r1, xy(315,160), 161.0).
fillpoint(r1, xy(160,369), 161.0).
fillpoint(r1, xy(318,159), 160.0).
fillpoint(r1, xy(159,377), 160.0).
fillpoint(r1, xy(321,158), 159.0).
fillpoint(r1, xy(158,383), 159.0).
fillpoint(r1, xy(157,389), 158.0).
fillpoint(r1, xy(328,156), 157.0).
fillpoint(r1, xy(156,398), 157.0).
fillpoint(r1, xy(155,410), 156.0).
fillpoint(r1, xy(335,154), 155.0).
fillpoint(r1, xy(155,443), 155.0).
fillpoint(r1, xy(339,153), 154.0).
fillpoint(r1, xy(343,152), 153.0).
fillpoint(r1, xy(348,151), 152.0).
fillpoint(r1, xy(353,150), 151.0).
fillpoint(r1, xy(365,147), 148.0).
fillpoint(r1, xy(369,146), 147.0).
fillpoint(r1, xy(374,145), 146.0).
fillpoint(r1, xy(379,144), 145.0).
fillpoint(r1, xy(385,143), 144.0).
fillpoint(r1, xy(392,142), 143.0).
fillpoint(r1, xy(399,141), 142.0).
fillpoint(r1, xy(411,140), 141.0).
fillpoint(r1, xy(420,139), 140.0).
fillpoint(r1, xy(426,138), 139.0).
fillpoint(r1, xy(432,137), 138.0).
fillpoint(r1, xy(440,136), 137.0).
fillpoint(r1, xy(451,135), 136.0).
fillpoint(r1, xy(471,135), 135.0).
border(r1).
region(r4, '#ffdc00', 45000, centroid(498,490)).
perimeter(r4, 1840).
polygon(r4, [xy(639,600),xy(350,600),xy(350,580),xy(340,580),xy(340,570),xy(360,569),xy(360,480),xy(340,480),xy(340,464),xy(340,360),xy(389,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,550),xy(589,550),xy(590,500),xy(540,500),xy(540,450),xy(590,449),xy(590,290),xy(609,290),xy(610,299),xy(620,300),xy(620,310),xy(639,310)]).
midline(r4, [xy(396,563),xy(382,576),xy(366,584),xy(353,575),xy(344,575)]).
midline(r4, [xy(397,562),xy(400,559),xy(400,490),xy(364,455),xy(365,384)]).
midline(r4, [xy(401,490),xy(410,483),xy(426,476),xy(441,474),xy(465,475)]).
midline(r4, [xy(401,559),xy(420,571),xy(440,575),xy(587,575),xy(610,570)]).
midline(r4, [xy(611,568),xy(615,549),xy(615,500),xy(609,476),xy(605,474),xy(564,475)]).
midline(r4, [xy(608,474),xy(613,463),xy(615,449),xy(615,334),xy(607,322),xy(600,305),xy(600,299)]).
fillpoint(r4, xy(400,491), 41.0).
fillpoint(r4, xy(400,559), 41.0).
fillpoint(r4, xy(399,525), 40.0).
fillpoint(r4, xy(608,475), 31.4).
fillpoint(r4, xy(610,570), 29.7).
fillpoint(r4, xy(611,468), 29.0).
fillpoint(r4, xy(421,478), 29.0).
fillpoint(r4, xy(611,481), 29.0).
fillpoint(r4, xy(611,568), 29.0).
fillpoint(r4, xy(421,571), 29.0).
fillpoint(r4, xy(608,571), 29.0).
fillpoint(r4, xy(612,465), 28.0).
fillpoint(r4, xy(424,477), 28.0).
fillpoint(r4, xy(612,484), 28.0).
fillpoint(r4, xy(612,565), 28.0).
fillpoint(r4, xy(424,572), 28.0).
fillpoint(r4, xy(605,572), 28.0).
fillpoint(r4, xy(613,462), 27.0).
fillpoint(r4, xy(427,476), 27.0).
fillpoint(r4, xy(613,487), 27.0).
fillpoint(r4, xy(613,562), 27.0).
fillpoint(r4, xy(427,573), 27.0).
fillpoint(r4, xy(602,573), 27.0).
fillpoint(r4, xy(614,458), 26.0).
fillpoint(r4, xy(432,475), 26.0).
fillpoint(r4, xy(614,492), 26.0).
fillpoint(r4, xy(614,558), 26.0).
fillpoint(r4, xy(432,574), 26.0).
fillpoint(r4, xy(598,574), 26.0).
fillpoint(r4, xy(365,455), 25.7).
fillpoint(r4, xy(615,391), 25.0).
fillpoint(r4, xy(365,416), 25.0).
fillpoint(r4, xy(441,475), 25.0).
fillpoint(r4, xy(564,475), 25.0).
fillpoint(r4, xy(614,525), 25.0).
fillpoint(r4, xy(441,575), 25.0).
fillpoint(r4, xy(605,315), 16.0).
fillpoint(r4, xy(365,584), 16.0).
fillpoint(r4, xy(600,304), 11.0).
border(r4).
region(r3, '#2ecc40', 30900, centroid(490,370)).
perimeter(r3, 1100).
polygon(r3, [xy(589,450),xy(390,450),xy(390,350),xy(350,350),xy(350,340),xy(359,340),xy(360,330),xy(369,330),xy(370,320),xy(379,320),xy(380,310),xy(399,310),xy(400,300),xy(410,299),xy(410,290),xy(429,290),xy(430,280),xy(439,280),xy(440,349),xy(489,350),xy(490,270),xy(549,270),xy(550,280),xy(589,280),xy(589,450)]).
hole(r3, [xy(570,339),xy(570,330),xy(580,329),xy(580,320),xy(570,320),xy(569,310),xy(560,310),xy(560,319),xy(550,320),xy(550,329),xy(559,330),xy(560,340),xy(570,339)]).
midline(r3, [xy(439,400),xy(427,385),xy(418,369),xy(413,336),xy(410,333),xy(398,329),xy(375,339),xy(369,339),xy(363,344),xy(354,345)]).
midline(r3, [xy(412,333),xy(424,304),xy(434,293),xy(435,284)]).
midline(r3, [xy(441,400),xy(503,399),xy(531,390),xy(528,361),xy(521,344),xy(519,327),xy(521,305),xy(522,302),xy(527,298),xy(527,300)]).
midline(r3, [xy(529,299),xy(540,300),xy(560,294),xy(574,295),xy(585,321),xy(584,333),xy(579,339),xy(579,345),xy(575,353),xy(552,377),xy(532,392)]).
fillpoint(r3, xy(531,391), 59.0).
fillpoint(r3, xy(528,392), 58.0).
fillpoint(r3, xy(516,396), 54.0).
fillpoint(r3, xy(512,397), 53.0).
fillpoint(r3, xy(508,398), 52.0).
fillpoint(r3, xy(501,399), 51.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(522,302), 33.0).
fillpoint(r3, xy(521,306), 32.0).
fillpoint(r3, xy(521,343), 32.0).
fillpoint(r3, xy(520,312), 31.0).
fillpoint(r3, xy(520,338), 31.0).
fillpoint(r3, xy(519,325), 30.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(554,295), 16.0).
fillpoint(r3, xy(424,305), 16.0).
fillpoint(r3, xy(385,334), 16.0).
fillpoint(r3, xy(574,295), 15.8).
fillpoint(r3, xy(561,295), 15.0).
region(r13, '#2ecc40', 6600, centroid(508,524)).
perimeter(r13, 520).
polygon(r13, [xy(589,550),xy(440,550),xy(440,500),xy(589,500),xy(589,550)]).
hole(r13, [xy(580,539),xy(579,510),xy(550,510),xy(550,540),xy(580,539)]).
midline(r13, [xy(502,524),xy(464,525)]).
midline(r13, [xy(503,524),xy(525,524),xy(546,544),xy(579,545),xy(583,544),xy(585,539),xy(585,510),xy(583,505),xy(546,505),xy(526,523)]).
fillpoint(r13, xy(464,525), 25.0).
region(r18, '#2ecc40', 5600, centroid(270,620)).
perimeter(r18, 600).
polygon(r18, [xy(409,630),xy(130,630),xy(130,610),xy(409,610),xy(409,630)]).
midline(r18, [xy(345,620),xy(139,620)]).
midline(r18, [xy(346,620),xy(400,620)]).
fillpoint(r18, xy(139,620), 10.0).
region(r10, '#2ecc40', 4000, centroid(334,466)).
perimeter(r10, 540).
polygon(r10, [xy(359,570),xy(330,569),xy(330,560),xy(350,559),xy(350,490),xy(310,489),xy(310,430),xy(320,429),xy(320,390),xy(330,389),xy(330,370),xy(340,370),xy(340,479),xy(360,480),xy(359,570)]).
midline(r10, [xy(334,392),xy(335,374)]).
midline(r10, [xy(334,393),xy(329,399),xy(330,429),xy(324,444),xy(324,475),xy(336,484),xy(354,485),xy(355,490),xy(354,563),xy(334,565)]).
fillpoint(r10, xy(325,459), 15.0).
fillpoint(r10, xy(329,434), 11.0).
fillpoint(r10, xy(329,414), 10.0).
fillpoint(r10, xy(354,485), 6.0).
fillpoint(r10, xy(353,564), 6.0).
fillpoint(r10, xy(335,381), 5.0).
fillpoint(r10, xy(341,485), 5.0).
fillpoint(r10, xy(354,525), 5.0).
fillpoint(r10, xy(334,565), 5.0).
region(r2, '#ffdc00', 3200, centroid(469,310)).
perimeter(r2, 260).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,280),xy(469,280),xy(470,270),xy(490,270),xy(489,350)]).
midline(r2, [xy(454,290),xy(449,290)]).
midline(r2, [xy(455,290),xy(463,294),xy(470,302),xy(470,330)]).
midline(r2, [xy(470,299),xy(475,293),xy(480,279)]).
fillpoint(r2, xy(469,315), 20.0).
fillpoint(r2, xy(479,284), 11.0).
fillpoint(r2, xy(454,290), 11.0).
region(r19, '#5a5a5a', 2800, centroid(480,620)).
perimeter(r19, 320).
polygon(r19, [xy(549,630),xy(410,630),xy(410,610),xy(549,610),xy(549,630)]).
midline(r19, [xy(464,620),xy(419,620)]).
midline(r19, [xy(465,620),xy(540,620)]).
fillpoint(r19, xy(419,620), 10.0).
region(r12, '#870c25', 1500, centroid(514,484)).
perimeter(r12, 160).
polygon(r12, [xy(539,500),xy(490,500),xy(490,470),xy(539,470),xy(539,500)]).
midline(r12, [xy(512,485),xy(504,485)]).
midline(r12, [xy(513,485),xy(525,485)]).
fillpoint(r12, xy(504,485), 15.0).
region(r11, '#bebebe', 1000, centroid(514,460)).
perimeter(r11, 140).
polygon(r11, [xy(539,470),xy(490,470),xy(490,450),xy(539,450),xy(539,470)]).
midline(r11, [xy(520,460),xy(499,460)]).
midline(r11, [xy(521,460),xy(530,460)]).
fillpoint(r11, xy(499,460), 10.0).
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
region(r5, '#0074d9', 500, centroid(444,324)).
perimeter(r5, 120).
polygon(r5, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r5, [xy(445,311),xy(445,304)]).
midline(r5, [xy(445,312),xy(445,345)]).
fillpoint(r5, xy(444,325), 5.0).
region(r9, '#0074d9', 400, centroid(370,354)).
perimeter(r9, 100).
polygon(r9, [xy(389,360),xy(350,360),xy(350,350),xy(389,350),xy(389,360)]).
midline(r9, [xy(371,354),xy(354,355)]).
midline(r9, [xy(372,354),xy(385,355)]).
fillpoint(r9, xy(354,355), 5.0).
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
region(r14, '#7fdbff', 100, centroid(324,514)).
perimeter(r14, 40).
polygon(r14, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r14, [xy(325,515),xy(325,514)]).
fillpoint(r14, xy(324,515), 5.0).
region(r16, '#2ecc40', 100, centroid(564,524)).
perimeter(r16, 40).
polygon(r16, [xy(569,530),xy(560,529),xy(560,520),xy(570,520),xy(569,530)]).
midline(r16, [xy(565,525),xy(565,524)]).
fillpoint(r16, xy(564,525), 5.0).
region(r17, '#7fdbff', 100, centroid(324,534)).
perimeter(r17, 40).
polygon(r17, [xy(329,540),xy(320,539),xy(320,530),xy(330,530),xy(329,540)]).
midline(r17, [xy(325,535),xy(325,534)]).
fillpoint(r17, xy(324,535), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 60).
adjacent(r1, r3).
shared_edge(r1, r3, 280).
adjacent(r1, r4).
shared_edge(r1, r4, 420).
adjacent(r1, r9).
shared_edge(r1, r9, 10).
adjacent(r1, r10).
shared_edge(r1, r10, 300).
adjacent(r1, r14).
shared_edge(r1, r14, 40).
adjacent(r1, r17).
shared_edge(r1, r17, 40).
adjacent(r1, r18).
shared_edge(r1, r18, 580).
adjacent(r1, r19).
shared_edge(r1, r19, 300).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 140).
adjacent(r2, r5).
shared_edge(r2, r5, 60).
adjacent(r3, r4).
shared_edge(r3, r4, 400).
adjacent(r3, r5).
shared_edge(r3, r5, 60).
adjacent(r3, r9).
shared_edge(r3, r9, 50).
adjacent(r3, r11).
shared_edge(r3, r11, 50).
adjacent(r4, r9).
shared_edge(r4, r9, 40).
adjacent(r4, r10).
shared_edge(r4, r10, 240).
adjacent(r4, r11).
shared_edge(r4, r11, 40).
adjacent(r4, r12).
shared_edge(r4, r12, 60).
adjacent(r4, r13).
shared_edge(r4, r13, 350).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r12, r13).
shared_edge(r12, r13, 50).
adjacent(r13, r15).
shared_edge(r13, r15, 120).
adjacent(r15, r16).
shared_edge(r15, r16, 40).
adjacent(r18, r19).
shared_edge(r18, r19, 20).

encloses(r1, r14).
encloses(r15, r16).
encloses(r1, r17).
encloses(r1, r20).
encloses(r1, r21).
