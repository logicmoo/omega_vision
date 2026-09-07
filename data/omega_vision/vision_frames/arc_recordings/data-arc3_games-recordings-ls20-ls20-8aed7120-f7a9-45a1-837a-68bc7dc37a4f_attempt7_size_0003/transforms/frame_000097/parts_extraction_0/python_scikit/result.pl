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

region(r1, '#aaaaaa', 318300, centroid(278,271)).
perimeter(r1, 4880).
polygon(r1, [xy(639,360),xy(620,360),xy(620,350),xy(610,350),xy(609,340),xy(590,340),xy(589,330),xy(550,330),xy(549,320),xy(470,320),xy(469,330),xy(430,330),xy(429,340),xy(410,340),xy(410,349),xy(400,350),xy(399,360),xy(380,360),xy(380,369),xy(370,370),xy(370,379),xy(360,380),xy(359,390),xy(350,390),xy(350,409),xy(340,410),xy(340,419),xy(330,420),xy(330,439),xy(320,440),xy(320,479),xy(310,480),xy(310,490),xy(350,490),xy(350,559),xy(320,560),xy(320,600),xy(639,600)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(329,520),xy(330,510),xy(320,510),xy(320,519),xy(310,520),xy(310,539),xy(330,539)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(438,604),xy(320,605),xy(314,603),xy(276,566),xy(260,557),xy(239,539),xy(191,490),xy(171,424),xy(162,406),xy(159,404),xy(105,444),xy(29,520),xy(19,533),xy(15,543),xy(15,596),xy(19,606),xy(27,616),xy(37,622),xy(50,625),xy(89,625),xy(102,622),xy(109,617),xy(111,598),xy(119,581),xy(115,579),xy(79,579),xy(59,559),xy(59,560)]).
midline(r1, [xy(279,567),xy(314,550),xy(337,548),xy(340,539),xy(340,530),xy(337,524),xy(324,524),xy(304,504),xy(207,504)]).
midline(r1, [xy(192,493),xy(176,520),xy(120,580)]).
midline(r1, [xy(162,404),xy(164,384),xy(178,324),xy(187,301),xy(196,266),xy(216,216),xy(273,195),xy(287,193)]).
midline(r1, [xy(60,558),xy(60,491)]).
midline(r1, [xy(288,191),xy(344,176),xy(431,264),xy(433,261),xy(345,175)]).
midline(r1, [xy(434,263),xy(436,269),xy(434,272),xy(341,179),xy(431,267),xy(432,265)]).
midline(r1, [xy(431,271),xy(435,275),xy(436,273)]).
midline(r1, [xy(170,366),xy(245,441),xy(240,441),xy(169,370)]).
midline(r1, [xy(306,504),xy(320,499),xy(338,501),xy(340,510),xy(339,524)]).
midline(r1, [xy(439,604),xy(553,605),xy(555,606),xy(555,630),xy(553,634),xy(549,635),xy(130,635),xy(120,630),xy(109,619)]).
midline(r1, [xy(171,364),xy(247,440),xy(247,443),xy(250,440),xy(172,360),xy(252,440),xy(250,443)]).
midline(r1, [xy(253,441),xy(254,444),xy(258,442),xy(172,356)]).
midline(r1, [xy(258,444),xy(261,442),xy(262,445),xy(264,444),xy(270,450),xy(279,451),xy(279,453)]).
midline(r1, [xy(188,300),xy(308,420)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,632),xy(585,607),xy(583,605),xy(556,605)]).
midline(r1, [xy(585,606),xy(590,604),xy(607,604),xy(614,607),xy(620,604),xy(635,605)]).
midline(r1, [xy(615,608),xy(615,630),xy(613,634),xy(590,635),xy(585,633)]).
midline(r1, [xy(348,175),xy(354,173),xy(431,250),xy(430,254),xy(352,176)]).
midline(r1, [xy(356,173),xy(435,161),xy(480,159),xy(570,253),xy(583,273),xy(573,298),xy(574,300),xy(577,294)]).
midline(r1, [xy(431,255),xy(433,257)]).
midline(r1, [xy(583,275),xy(589,279),xy(606,300),xy(612,313),xy(608,317),xy(613,314),xy(616,317),xy(622,327),xy(630,350)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(581,281),xy(584,278)]).
midline(r1, [xy(211,273),xy(328,390)]).
midline(r1, [xy(269,227),xy(380,338)]).
midline(r1, [xy(437,275),xy(449,303),xy(448,305),xy(450,305)]).
fillpoint(r1, xy(217,216), 217.0).
fillpoint(r1, xy(247,204), 205.0).
fillpoint(r1, xy(202,251), 203.0).
fillpoint(r1, xy(261,199), 200.0).
fillpoint(r1, xy(196,267), 197.0).
fillpoint(r1, xy(274,195), 196.0).
fillpoint(r1, xy(195,270), 196.0).
fillpoint(r1, xy(194,273), 195.0).
fillpoint(r1, xy(281,193), 194.0).
fillpoint(r1, xy(193,276), 194.0).
fillpoint(r1, xy(285,192), 193.0).
fillpoint(r1, xy(192,279), 193.0).
fillpoint(r1, xy(191,282), 192.0).
fillpoint(r1, xy(189,289), 190.0).
fillpoint(r1, xy(187,296), 188.0).
fillpoint(r1, xy(186,300), 187.0).
fillpoint(r1, xy(307,185), 186.0).
fillpoint(r1, xy(314,183), 184.0).
fillpoint(r1, xy(317,182), 183.0).
fillpoint(r1, xy(321,181), 182.0).
fillpoint(r1, xy(325,180), 181.0).
fillpoint(r1, xy(329,179), 180.0).
fillpoint(r1, xy(179,322), 180.0).
fillpoint(r1, xy(333,178), 179.0).
fillpoint(r1, xy(178,325), 179.0).
fillpoint(r1, xy(338,177), 178.0).
fillpoint(r1, xy(177,329), 178.0).
fillpoint(r1, xy(346,175), 176.0).
fillpoint(r1, xy(175,336), 176.0).
fillpoint(r1, xy(350,174), 175.0).
fillpoint(r1, xy(174,340), 175.0).
fillpoint(r1, xy(354,173), 174.0).
fillpoint(r1, xy(173,344), 174.0).
fillpoint(r1, xy(359,172), 173.0).
fillpoint(r1, xy(172,349), 173.0).
fillpoint(r1, xy(364,171), 172.0).
fillpoint(r1, xy(171,354), 172.0).
fillpoint(r1, xy(369,170), 171.0).
fillpoint(r1, xy(375,169), 170.0).
fillpoint(r1, xy(169,361), 170.0).
fillpoint(r1, xy(381,168), 169.0).
fillpoint(r1, xy(168,366), 169.0).
fillpoint(r1, xy(388,167), 168.0).
fillpoint(r1, xy(167,370), 168.0).
fillpoint(r1, xy(397,166), 167.0).
fillpoint(r1, xy(166,375), 167.0).
fillpoint(r1, xy(408,165), 166.0).
fillpoint(r1, xy(165,380), 166.0).
fillpoint(r1, xy(416,164), 165.0).
fillpoint(r1, xy(164,386), 165.0).
fillpoint(r1, xy(422,163), 164.0).
fillpoint(r1, xy(163,392), 164.0).
fillpoint(r1, xy(429,162), 163.0).
fillpoint(r1, xy(162,399), 163.0).
fillpoint(r1, xy(437,161), 162.0).
fillpoint(r1, xy(449,160), 161.0).
fillpoint(r1, xy(471,160), 160.0).
fillpoint(r1, xy(190,485), 120.0).
border(r1).
region(r5, '#ffdc00', 42200, centroid(492,504)).
perimeter(r5, 1780).
polygon(r5, [xy(639,600),xy(320,599),xy(320,570),xy(360,569),xy(360,480),xy(340,479),xy(340,410),xy(350,409),xy(350,390),xy(359,390),xy(360,380),xy(369,380),xy(370,370),xy(380,369),xy(380,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,550),xy(589,550),xy(590,500),xy(540,500),xy(540,450),xy(590,449),xy(590,340),xy(609,340),xy(610,349),xy(620,350),xy(620,360),xy(639,360)]).
midline(r5, [xy(374,396),xy(369,407),xy(369,417),xy(364,429),xy(364,455),xy(400,490),xy(400,559),xy(382,576),xy(372,582),xy(359,585),xy(334,585)]).
midline(r5, [xy(374,395),xy(379,385),xy(379,379),xy(384,373),xy(385,364)]).
midline(r5, [xy(401,490),xy(412,482),xy(426,476),xy(441,474),xy(465,475)]).
midline(r5, [xy(401,559),xy(418,570),xy(440,575),xy(589,575),xy(610,570),xy(615,548),xy(615,501),xy(611,480),xy(607,474),xy(564,475)]).
midline(r5, [xy(608,474),xy(613,463),xy(615,447),xy(615,384),xy(607,372),xy(600,355),xy(600,349)]).
fillpoint(r5, xy(400,491), 41.0).
fillpoint(r5, xy(400,559), 41.0).
fillpoint(r5, xy(399,525), 40.0).
fillpoint(r5, xy(608,475), 31.4).
fillpoint(r5, xy(610,570), 29.7).
fillpoint(r5, xy(611,468), 29.0).
fillpoint(r5, xy(421,478), 29.0).
fillpoint(r5, xy(611,481), 29.0).
fillpoint(r5, xy(611,568), 29.0).
fillpoint(r5, xy(421,571), 29.0).
fillpoint(r5, xy(608,571), 29.0).
fillpoint(r5, xy(612,465), 28.0).
fillpoint(r5, xy(424,477), 28.0).
fillpoint(r5, xy(612,484), 28.0).
fillpoint(r5, xy(612,565), 28.0).
fillpoint(r5, xy(424,572), 28.0).
fillpoint(r5, xy(605,572), 28.0).
fillpoint(r5, xy(613,462), 27.0).
fillpoint(r5, xy(427,476), 27.0).
fillpoint(r5, xy(613,487), 27.0).
fillpoint(r5, xy(613,562), 27.0).
fillpoint(r5, xy(427,573), 27.0).
fillpoint(r5, xy(602,573), 27.0).
fillpoint(r5, xy(614,458), 26.0).
fillpoint(r5, xy(432,475), 26.0).
fillpoint(r5, xy(614,492), 26.0).
fillpoint(r5, xy(614,558), 26.0).
fillpoint(r5, xy(432,574), 26.0).
fillpoint(r5, xy(598,574), 26.0).
fillpoint(r5, xy(365,455), 25.7).
fillpoint(r5, xy(615,416), 25.0).
fillpoint(r5, xy(364,439), 25.0).
fillpoint(r5, xy(441,475), 25.0).
fillpoint(r5, xy(564,475), 25.0).
fillpoint(r5, xy(614,525), 25.0).
fillpoint(r5, xy(441,575), 25.0).
fillpoint(r5, xy(369,416), 21.0).
fillpoint(r5, xy(370,407), 20.0).
fillpoint(r5, xy(605,365), 16.0).
fillpoint(r5, xy(374,395), 16.0).
fillpoint(r5, xy(365,584), 16.0).
fillpoint(r5, xy(334,585), 15.0).
fillpoint(r5, xy(600,354), 11.0).
fillpoint(r5, xy(379,384), 11.0).
border(r5).
region(r3, '#2ecc40', 25400, centroid(496,400)).
perimeter(r3, 800).
polygon(r3, [xy(539,500),xy(490,500),xy(489,450),xy(390,449),xy(390,360),xy(399,360),xy(400,350),xy(410,349),xy(410,340),xy(429,340),xy(430,330),xy(439,330),xy(440,350),xy(489,350),xy(490,320),xy(549,320),xy(550,330),xy(590,330),xy(590,449),xy(540,450),xy(539,500)]).
midline(r3, [xy(532,388),xy(535,382),xy(526,357),xy(522,352),xy(526,345),xy(530,343),xy(524,352),xy(526,352)]).
midline(r3, [xy(532,389),xy(530,392),xy(514,400),xy(440,400),xy(427,385),xy(421,384),xy(428,388)]).
midline(r3, [xy(427,384),xy(423,373),xy(425,371),xy(424,354),xy(433,345),xy(435,334)]).
midline(r3, [xy(514,401),xy(515,475)]).
fillpoint(r3, xy(531,391), 59.0).
fillpoint(r3, xy(532,388), 58.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(515,463), 25.0).
region(r17, '#2ecc40', 7600, centroid(320,620)).
perimeter(r17, 800).
polygon(r17, [xy(509,630),xy(130,630),xy(130,610),xy(509,610),xy(509,630)]).
midline(r17, [xy(304,619),xy(139,620)]).
midline(r17, [xy(305,619),xy(500,620)]).
fillpoint(r17, xy(139,620), 10.0).
region(r6, '#2ecc40', 2600, centroid(339,496)).
perimeter(r6, 460).
polygon(r6, [xy(359,570),xy(320,569),xy(320,560),xy(350,559),xy(350,490),xy(310,489),xy(310,480),xy(320,479),xy(320,440),xy(330,439),xy(330,420),xy(340,420),xy(340,479),xy(360,480),xy(359,570)]).
midline(r6, [xy(334,442),xy(335,424)]).
midline(r6, [xy(334,443),xy(329,449),xy(330,478),xy(323,484),xy(314,485)]).
midline(r6, [xy(330,479),xy(336,484),xy(354,485),xy(355,559),xy(354,563),xy(349,565),xy(324,565)]).
fillpoint(r6, xy(329,465), 10.0).
fillpoint(r6, xy(354,485), 6.0).
fillpoint(r6, xy(353,564), 6.0).
fillpoint(r6, xy(335,431), 5.0).
fillpoint(r6, xy(314,485), 5.0).
fillpoint(r6, xy(341,485), 5.0).
fillpoint(r6, xy(354,525), 5.0).
fillpoint(r6, xy(324,565), 5.0).
region(r7, '#2ecc40', 2500, centroid(464,524)).
perimeter(r7, 200).
polygon(r7, [xy(489,550),xy(440,549),xy(440,500),xy(490,500),xy(489,550)]).
midline(r7, [xy(464,525),xy(465,525)]).
fillpoint(r7, xy(464,525), 25.0).
region(r15, '#7fdbff', 2000, centroid(56,584)).
perimeter(r15, 240).
polygon(r15, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r15, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r15, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r15, xy(41,578), 12.0).
fillpoint(r15, xy(58,581), 12.0).
fillpoint(r15, xy(61,598), 12.0).
fillpoint(r15, xy(40,574), 11.0).
fillpoint(r15, xy(45,579), 11.0).
fillpoint(r15, xy(54,580), 11.0).
fillpoint(r15, xy(59,585), 11.0).
fillpoint(r15, xy(60,594), 11.0).
fillpoint(r15, xy(65,599), 11.0).
fillpoint(r15, xy(39,564), 10.0).
fillpoint(r15, xy(71,600), 10.0).
region(r9, '#2ecc40', 1600, centroid(564,524)).
perimeter(r9, 320).
polygon(r9, [xy(589,550),xy(540,549),xy(540,500),xy(590,500),xy(589,550)]).
hole(r9, [xy(580,539),xy(579,510),xy(550,510),xy(550,540),xy(580,539)]).
midline(r9, [xy(545,517),xy(545,544),xy(578,545),xy(583,544),xy(585,538),xy(585,510),xy(583,505),xy(545,505),xy(545,516)]).
fillpoint(r9, xy(546,505), 6.0).
fillpoint(r9, xy(584,505), 6.0).
fillpoint(r9, xy(545,544), 6.0).
fillpoint(r9, xy(583,544), 6.0).
fillpoint(r9, xy(551,505), 5.0).
fillpoint(r9, xy(544,525), 5.0).
fillpoint(r9, xy(584,525), 5.0).
fillpoint(r9, xy(551,545), 5.0).
region(r13, '#870c25', 1500, centroid(514,534)).
perimeter(r13, 160).
polygon(r13, [xy(539,550),xy(490,550),xy(490,520),xy(539,520),xy(539,550)]).
midline(r13, [xy(516,534),xy(504,535)]).
midline(r13, [xy(517,535),xy(525,535)]).
fillpoint(r13, xy(504,535), 15.0).
region(r2, '#ffdc00', 1000, centroid(472,336)).
perimeter(r2, 140).
polygon(r2, [xy(489,350),xy(450,350),xy(450,330),xy(469,330),xy(470,320),xy(489,320),xy(489,350)]).
midline(r2, [xy(464,340),xy(459,340)]).
midline(r2, [xy(465,339),xy(477,338),xy(480,329)]).
fillpoint(r2, xy(477,338), 12.0).
fillpoint(r2, xy(479,334), 11.0).
fillpoint(r2, xy(474,339), 11.0).
fillpoint(r2, xy(459,340), 10.0).
region(r8, '#bebebe', 1000, centroid(514,510)).
perimeter(r8, 140).
polygon(r8, [xy(539,520),xy(490,520),xy(490,500),xy(539,500),xy(539,520)]).
midline(r8, [xy(509,510),xy(499,510)]).
midline(r8, [xy(510,510),xy(530,510)]).
fillpoint(r8, xy(499,510), 10.0).
region(r11, '#5a5a5a', 800, centroid(564,524)).
perimeter(r11, 160).
polygon(r11, [xy(579,540),xy(550,539),xy(550,510),xy(580,510),xy(579,540)]).
hole(r11, [xy(570,529),xy(569,520),xy(560,520),xy(560,530),xy(570,529)]).
midline(r11, [xy(574,532),xy(575,520),xy(573,515),xy(555,515),xy(554,520),xy(555,534),xy(574,534)]).
fillpoint(r11, xy(556,515), 6.0).
fillpoint(r11, xy(574,515), 6.0).
fillpoint(r11, xy(555,534), 6.0).
fillpoint(r11, xy(573,534), 6.0).
fillpoint(r11, xy(561,515), 5.0).
fillpoint(r11, xy(554,525), 5.0).
fillpoint(r11, xy(574,525), 5.0).
fillpoint(r11, xy(561,535), 5.0).
region(r18, '#5a5a5a', 800, centroid(530,620)).
perimeter(r18, 120).
polygon(r18, [xy(549,630),xy(510,630),xy(510,610),xy(549,610),xy(549,630)]).
midline(r18, [xy(540,620),xy(519,620)]).
fillpoint(r18, xy(519,620), 10.0).
region(r16, '#7fdbff', 400, centroid(80,560)).
perimeter(r16, 80).
polygon(r16, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r16, [xy(79,559),xy(80,560)]).
fillpoint(r16, xy(79,560), 10.0).
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
region(r21, '#2ecc40', 400, centroid(630,620)).
perimeter(r21, 80).
polygon(r21, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r21, [xy(629,619),xy(630,620)]).
fillpoint(r21, xy(629,620), 10.0).
border(r21).
region(r12, '#7fdbff', 300, centroid(318,531)).
perimeter(r12, 80).
polygon(r12, [xy(329,540),xy(310,539),xy(310,520),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r12, [xy(315,531),xy(315,524)]).
midline(r12, [xy(315,532),xy(315,534),xy(325,535)]).
fillpoint(r12, xy(315,534), 6.0).
fillpoint(r12, xy(315,526), 5.0).
fillpoint(r12, xy(321,535), 5.0).
region(r10, '#7fdbff', 100, centroid(324,514)).
perimeter(r10, 40).
polygon(r10, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r10, [xy(325,515),xy(325,514)]).
fillpoint(r10, xy(324,515), 5.0).
region(r14, '#2ecc40', 100, centroid(564,524)).
perimeter(r14, 40).
polygon(r14, [xy(569,530),xy(560,529),xy(560,520),xy(570,520),xy(569,530)]).
midline(r14, [xy(565,525),xy(565,524)]).
fillpoint(r14, xy(564,525), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 50).
adjacent(r1, r3).
shared_edge(r1, r3, 200).
adjacent(r1, r5).
shared_edge(r1, r5, 530).
adjacent(r1, r6).
shared_edge(r1, r6, 250).
adjacent(r1, r10).
shared_edge(r1, r10, 40).
adjacent(r1, r12).
shared_edge(r1, r12, 80).
adjacent(r1, r15).
shared_edge(r1, r15, 240).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 780).
adjacent(r1, r18).
shared_edge(r1, r18, 100).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 70).
adjacent(r3, r5).
shared_edge(r3, r5, 450).
adjacent(r3, r8).
shared_edge(r3, r8, 50).
adjacent(r5, r6).
shared_edge(r5, r6, 210).
adjacent(r5, r7).
shared_edge(r5, r7, 150).
adjacent(r5, r9).
shared_edge(r5, r9, 150).
adjacent(r5, r13).
shared_edge(r5, r13, 50).
adjacent(r7, r8).
shared_edge(r7, r8, 20).
adjacent(r7, r13).
shared_edge(r7, r13, 30).
adjacent(r8, r9).
shared_edge(r8, r9, 20).
adjacent(r8, r13).
shared_edge(r8, r13, 50).
adjacent(r9, r11).
shared_edge(r9, r11, 120).
adjacent(r9, r13).
shared_edge(r9, r13, 30).
adjacent(r11, r14).
shared_edge(r11, r14, 40).
adjacent(r17, r18).
shared_edge(r17, r18, 20).

encloses(r1, r10).
encloses(r1, r12).
encloses(r11, r14).
encloses(r1, r15).
encloses(r1, r16).
encloses(r1, r19).
encloses(r1, r20).
