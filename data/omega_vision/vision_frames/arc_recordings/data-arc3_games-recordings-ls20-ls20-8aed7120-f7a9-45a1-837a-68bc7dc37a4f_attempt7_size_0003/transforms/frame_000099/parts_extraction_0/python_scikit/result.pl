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
midline(r1, [xy(433,260),xy(431,260),xy(433,264),xy(431,266),xy(342,177),xy(316,182),xy(273,195),xy(216,216),xy(196,266),xy(178,324),xy(167,369),xy(162,404),xy(159,404),xy(146,414),xy(144,413),xy(103,446),xy(29,520),xy(19,533),xy(15,543),xy(15,596),xy(19,606),xy(27,616),xy(37,622),xy(51,625),xy(96,624),xy(109,617),xy(111,598),xy(119,581),xy(117,579),xy(80,580),xy(60,560),xy(59,560),xy(60,492)]).
midline(r1, [xy(343,176),xy(394,166),xy(445,160),xy(480,159),xy(570,253),xy(582,272),xy(576,289),xy(579,288),xy(583,281),xy(581,280)]).
midline(r1, [xy(434,261),xy(435,266),xy(432,270),xy(431,267)]).
midline(r1, [xy(171,361),xy(250,440),xy(248,441),xy(171,364)]).
midline(r1, [xy(583,273),xy(582,278),xy(585,275),xy(587,277),xy(584,280)]).
midline(r1, [xy(354,175),xy(432,253),xy(433,258)]).
midline(r1, [xy(145,415),xy(143,416)]).
midline(r1, [xy(247,206),xy(380,339),xy(381,337),xy(249,205)]).
midline(r1, [xy(382,339),xy(381,340)]).
midline(r1, [xy(109,619),xy(124,633),xy(131,635),xy(549,635),xy(555,632),xy(555,608),xy(549,604),xy(322,605),xy(314,603),xy(276,566),xy(251,550),xy(191,490),xy(171,424),xy(162,406)]).
midline(r1, [xy(208,505),xy(305,505),xy(314,500),xy(335,500),xy(339,504),xy(339,523),xy(337,525),xy(327,525),xy(324,524),xy(306,506)]).
midline(r1, [xy(279,567),xy(314,550),xy(337,548),xy(340,539),xy(339,525)]).
midline(r1, [xy(192,493),xy(166,532),xy(119,580)]).
midline(r1, [xy(555,633),xy(560,635),xy(579,635),xy(585,631),xy(585,608),xy(583,605),xy(560,604),xy(555,606)]).
midline(r1, [xy(585,606),xy(590,604),xy(608,604),xy(614,607),xy(622,604),xy(635,605)]).
midline(r1, [xy(615,608),xy(615,629),xy(613,634),xy(591,635),xy(585,633)]).
midline(r1, [xy(435,268),xy(433,271),xy(435,273),xy(435,284),xy(439,289),xy(442,286),xy(437,282)]).
midline(r1, [xy(442,288),xy(443,290),xy(441,292),xy(440,290)]).
midline(r1, [xy(436,271),xy(436,274),xy(438,274)]).
midline(r1, [xy(441,283),xy(437,278),xy(438,276),xy(439,278)]).
midline(r1, [xy(440,293),xy(442,297),xy(444,294),xy(442,293)]).
midline(r1, [xy(443,298),xy(445,298),xy(444,296)]).
midline(r1, [xy(169,368),xy(242,441),xy(248,443),xy(251,441),xy(254,445),xy(256,444),xy(254,442)]).
midline(r1, [xy(257,445),xy(260,443),xy(258,441),xy(256,443)]).
midline(r1, [xy(259,446),xy(262,447),xy(261,444)]).
midline(r1, [xy(264,447),xy(267,447),xy(267,449)]).
midline(r1, [xy(269,449),xy(274,448),xy(276,452)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(588,278),xy(602,294),xy(611,312),xy(620,323),xy(630,350)]).
midline(r1, [xy(449,304),xy(445,300),xy(448,301)]).
midline(r1, [xy(450,305),xy(446,303)]).
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
midline(r5, [xy(374,396),xy(369,407),xy(368,421),xy(363,430),xy(365,432),xy(364,455),xy(400,490),xy(400,559),xy(382,576),xy(372,582),xy(358,585),xy(334,585)]).
midline(r5, [xy(374,395),xy(379,385),xy(379,379),xy(384,373),xy(385,364)]).
midline(r5, [xy(401,490),xy(412,482),xy(430,475),xy(465,475)]).
midline(r5, [xy(401,559),xy(418,570),xy(440,575),xy(589,575),xy(610,570),xy(615,549),xy(615,500),xy(611,480),xy(607,474),xy(564,475)]).
midline(r5, [xy(608,474),xy(613,463),xy(615,449),xy(615,384),xy(607,372),xy(600,355),xy(600,349)]).
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
midline(r3, [xy(515,427),xy(514,399),xy(440,400),xy(426,386),xy(427,382),xy(423,373),xy(425,371),xy(424,354),xy(433,345),xy(435,334)]).
midline(r3, [xy(515,428),xy(515,475)]).
midline(r3, [xy(428,386),xy(430,388)]).
midline(r3, [xy(516,399),xy(530,392),xy(534,383),xy(524,354),xy(528,348),xy(526,345),xy(529,342),xy(528,346)]).
fillpoint(r3, xy(531,391), 59.0).
fillpoint(r3, xy(532,388), 58.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(515,463), 25.0).
region(r16, '#5a5a5a', 8000, centroid(350,620)).
perimeter(r16, 840).
polygon(r16, [xy(549,630),xy(150,630),xy(150,610),xy(549,610),xy(549,630)]).
midline(r16, [xy(324,619),xy(159,620)]).
midline(r16, [xy(325,619),xy(540,620)]).
fillpoint(r16, xy(159,620), 10.0).
region(r6, '#2ecc40', 2600, centroid(339,496)).
perimeter(r6, 460).
polygon(r6, [xy(359,570),xy(320,569),xy(320,560),xy(350,559),xy(350,490),xy(310,489),xy(310,480),xy(320,479),xy(320,440),xy(330,439),xy(330,420),xy(340,420),xy(340,479),xy(360,480),xy(359,570)]).
midline(r6, [xy(334,442),xy(335,424)]).
midline(r6, [xy(334,443),xy(329,449),xy(330,478),xy(323,484),xy(314,485)]).
midline(r6, [xy(330,480),xy(340,485),xy(354,485),xy(355,559),xy(353,564),xy(324,565)]).
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
region(r9, '#2ecc40', 2500, centroid(564,524)).
perimeter(r9, 200).
polygon(r9, [xy(589,550),xy(540,549),xy(540,500),xy(590,500),xy(589,550)]).
midline(r9, [xy(564,525),xy(565,525)]).
fillpoint(r9, xy(564,525), 25.0).
region(r13, '#7fdbff', 2000, centroid(56,584)).
perimeter(r13, 240).
polygon(r13, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r13, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r13, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r13, xy(41,578), 12.0).
fillpoint(r13, xy(58,581), 12.0).
fillpoint(r13, xy(61,598), 12.0).
fillpoint(r13, xy(40,574), 11.0).
fillpoint(r13, xy(45,579), 11.0).
fillpoint(r13, xy(54,580), 11.0).
fillpoint(r13, xy(59,585), 11.0).
fillpoint(r13, xy(60,594), 11.0).
fillpoint(r13, xy(65,599), 11.0).
fillpoint(r13, xy(39,564), 10.0).
fillpoint(r13, xy(71,600), 10.0).
region(r12, '#870c25', 1500, centroid(514,534)).
perimeter(r12, 160).
polygon(r12, [xy(539,550),xy(490,550),xy(490,520),xy(539,520),xy(539,550)]).
midline(r12, [xy(516,534),xy(504,535)]).
midline(r12, [xy(517,535),xy(525,535)]).
fillpoint(r12, xy(504,535), 15.0).
region(r2, '#ffdc00', 1000, centroid(472,336)).
perimeter(r2, 140).
polygon(r2, [xy(489,350),xy(450,350),xy(450,330),xy(469,330),xy(470,320),xy(489,320),xy(489,350)]).
midline(r2, [xy(465,339),xy(459,340)]).
midline(r2, [xy(466,339),xy(477,338),xy(480,329)]).
fillpoint(r2, xy(477,338), 12.0).
fillpoint(r2, xy(479,334), 11.0).
fillpoint(r2, xy(474,339), 11.0).
fillpoint(r2, xy(459,340), 10.0).
region(r8, '#bebebe', 1000, centroid(514,510)).
perimeter(r8, 140).
polygon(r8, [xy(539,520),xy(490,520),xy(490,500),xy(539,500),xy(539,520)]).
midline(r8, [xy(511,510),xy(499,510)]).
midline(r8, [xy(512,509),xy(530,510)]).
fillpoint(r8, xy(499,510), 10.0).
region(r14, '#7fdbff', 400, centroid(80,560)).
perimeter(r14, 80).
polygon(r14, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r14, [xy(79,559),xy(80,560)]).
fillpoint(r14, xy(79,560), 10.0).
region(r15, '#2ecc40', 400, centroid(140,620)).
perimeter(r15, 80).
polygon(r15, [xy(149,630),xy(130,629),xy(130,610),xy(150,610),xy(149,630)]).
midline(r15, [xy(139,619),xy(140,620)]).
fillpoint(r15, xy(139,620), 10.0).
region(r17, '#7fdbff', 400, centroid(570,620)).
perimeter(r17, 80).
polygon(r17, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r17, [xy(569,619),xy(570,620)]).
fillpoint(r17, xy(569,620), 10.0).
region(r18, '#7fdbff', 400, centroid(600,620)).
perimeter(r18, 80).
polygon(r18, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r18, [xy(599,619),xy(600,620)]).
fillpoint(r18, xy(599,620), 10.0).
region(r19, '#2ecc40', 400, centroid(630,620)).
perimeter(r19, 80).
polygon(r19, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r19, [xy(629,619),xy(630,620)]).
fillpoint(r19, xy(629,620), 10.0).
border(r19).
region(r11, '#7fdbff', 300, centroid(318,531)).
perimeter(r11, 80).
polygon(r11, [xy(329,540),xy(310,539),xy(310,520),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r11, [xy(315,531),xy(315,524)]).
midline(r11, [xy(315,532),xy(315,534),xy(325,535)]).
fillpoint(r11, xy(315,534), 6.0).
fillpoint(r11, xy(315,526), 5.0).
fillpoint(r11, xy(321,535), 5.0).
region(r10, '#7fdbff', 100, centroid(324,514)).
perimeter(r10, 40).
polygon(r10, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r10, [xy(325,515),xy(325,514)]).
fillpoint(r10, xy(324,515), 5.0).

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
adjacent(r1, r11).
shared_edge(r1, r11, 80).
adjacent(r1, r13).
shared_edge(r1, r13, 240).
adjacent(r1, r14).
shared_edge(r1, r14, 80).
adjacent(r1, r15).
shared_edge(r1, r15, 60).
adjacent(r1, r16).
shared_edge(r1, r16, 820).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 60).
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
adjacent(r5, r12).
shared_edge(r5, r12, 50).
adjacent(r7, r8).
shared_edge(r7, r8, 20).
adjacent(r7, r12).
shared_edge(r7, r12, 30).
adjacent(r8, r9).
shared_edge(r8, r9, 20).
adjacent(r8, r12).
shared_edge(r8, r12, 50).
adjacent(r9, r12).
shared_edge(r9, r12, 30).
adjacent(r15, r16).
shared_edge(r15, r16, 20).

encloses(r1, r10).
encloses(r1, r11).
encloses(r1, r13).
encloses(r1, r14).
encloses(r1, r17).
encloses(r1, r18).
