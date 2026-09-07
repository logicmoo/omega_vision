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

region(r1, '#aaaaaa', 302900, centroid(267,269)).
perimeter(r1, 4820).
polygon(r1, [xy(639,310),xy(620,310),xy(620,300),xy(610,300),xy(609,290),xy(590,290),xy(589,280),xy(550,280),xy(549,270),xy(470,270),xy(469,280),xy(430,280),xy(429,290),xy(410,290),xy(410,299),xy(400,300),xy(399,310),xy(380,310),xy(380,319),xy(370,320),xy(370,329),xy(360,330),xy(360,339),xy(350,340),xy(350,359),xy(340,360),xy(340,369),xy(330,370),xy(330,389),xy(320,390),xy(320,429),xy(310,430),xy(310,465),xy(310,490),xy(350,490),xy(350,559),xy(330,560),xy(330,569),xy(339,570),xy(340,580),xy(350,580),xy(350,600),xy(639,600)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
hole(r1, [xy(330,519),xy(329,510),xy(320,510),xy(320,520),xy(330,519)]).
hole(r1, [xy(330,539),xy(329,530),xy(320,530),xy(320,540),xy(330,539)]).
midline(r1, [xy(115,588),xy(110,602),xy(109,617),xy(102,622),xy(89,625),xy(51,625),xy(37,622),xy(23,612),xy(15,596),xy(15,543),xy(19,533),xy(30,519),xy(107,442),xy(155,408),xy(167,319),xy(178,274),xy(187,251),xy(196,216),xy(203,201),xy(231,191)]).
midline(r1, [xy(155,409),xy(179,454),xy(193,492),xy(184,508),xy(162,537),xy(120,579),xy(81,580),xy(59,559),xy(60,492)]).
midline(r1, [xy(170,318),xy(243,391),xy(252,394),xy(257,392),xy(259,394),xy(256,394)]).
midline(r1, [xy(109,619),xy(124,633),xy(132,635),xy(549,635),xy(555,632),xy(555,607),xy(548,604),xy(346,604),xy(334,594),xy(305,582),xy(289,567),xy(270,557),xy(237,527),xy(216,513),xy(194,493)]).
midline(r1, [xy(555,633),xy(560,635),xy(577,635),xy(583,634),xy(585,630),xy(585,608),xy(583,605),xy(560,604),xy(555,606)]).
midline(r1, [xy(290,566),xy(295,566),xy(299,562),xy(298,565)]).
midline(r1, [xy(585,606),xy(593,604),xy(615,606),xy(615,632),xy(613,634),xy(590,635),xy(585,633)]).
midline(r1, [xy(616,605),xy(635,605)]).
midline(r1, [xy(301,562),xy(319,552),xy(338,547),xy(340,537),xy(338,524),xy(276,525),xy(268,523),xy(240,528)]).
midline(r1, [xy(273,522),xy(275,518),xy(269,522)]).
midline(r1, [xy(339,523),xy(339,504),xy(337,501),xy(329,499),xy(314,500),xy(285,515),xy(276,517)]).
midline(r1, [xy(120,580),xy(116,587)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(232,189),xy(245,185)]).
midline(r1, [xy(246,183),xy(266,175),xy(268,176)]).
midline(r1, [xy(269,174),xy(334,154),xy(377,145),xy(431,200),xy(431,208),xy(371,148)]).
midline(r1, [xy(378,144),xy(447,135),xy(505,134),xy(562,193),xy(575,210),xy(583,223),xy(573,247),xy(577,243)]).
midline(r1, [xy(584,224),xy(607,252),xy(612,263),xy(608,267),xy(613,264),xy(620,273),xy(630,300)]).
midline(r1, [xy(431,209),xy(441,233),xy(439,237),xy(441,239),xy(441,236)]).
midline(r1, [xy(443,239),xy(446,250)]).
midline(r1, [xy(308,164),xy(411,267),xy(410,269),xy(306,165)]).
midline(r1, [xy(411,270),xy(412,269)]).
midline(r1, [xy(249,259),xy(201,211),xy(199,213),xy(248,262),xy(250,260),xy(249,263),xy(252,262),xy(251,265),xy(254,264),xy(253,267),xy(256,266),xy(255,269),xy(258,268),xy(257,271),xy(260,270),xy(259,273),xy(262,272),xy(261,275),xy(264,274),xy(263,277),xy(266,276),xy(265,279),xy(268,278),xy(267,281),xy(270,280),xy(269,283),xy(272,282),xy(271,285),xy(274,284),xy(273,287),xy(276,286),xy(275,289),xy(278,288),xy(277,291),xy(280,290),xy(279,293),xy(282,292),xy(281,295),xy(284,294),xy(283,297),xy(286,296),xy(285,299),xy(288,298),xy(287,301),xy(290,300),xy(289,303),xy(292,302),xy(291,305),xy(294,304),xy(293,307),xy(296,306),xy(295,309),xy(298,308),xy(297,311),xy(300,310),xy(299,313),xy(302,312),xy(301,315),xy(304,314),xy(303,317),xy(306,316),xy(305,319),xy(308,318),xy(307,321),xy(310,320),xy(309,323),xy(312,322),xy(311,325),xy(314,324),xy(313,327),xy(316,326),xy(315,329),xy(318,328),xy(317,331),xy(320,330),xy(319,333),xy(322,332),xy(321,335),xy(324,334),xy(323,337),xy(326,336),xy(325,339),xy(329,339),xy(327,341)]).
midline(r1, [xy(269,394),xy(261,393),xy(262,396),xy(266,396),xy(264,397)]).
midline(r1, [xy(266,398),xy(268,397),xy(271,400),xy(270,395),xy(274,401),xy(276,400),xy(284,405),xy(287,404),xy(287,406)]).
midline(r1, [xy(332,342),xy(330,340),xy(331,343)]).
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
fillpoint(r1, xy(155,408), 156.0).
fillpoint(r1, xy(335,154), 155.0).
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
fillpoint(r1, xy(190,485), 120.0).
border(r1).
region(r4, '#ffdc00', 45000, centroid(498,490)).
perimeter(r4, 1840).
polygon(r4, [xy(639,600),xy(350,600),xy(350,580),xy(340,580),xy(340,570),xy(360,569),xy(360,480),xy(340,480),xy(340,464),xy(340,360),xy(389,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,550),xy(589,550),xy(590,500),xy(540,500),xy(540,450),xy(590,449),xy(590,290),xy(609,290),xy(610,299),xy(620,300),xy(620,310),xy(639,310)]).
midline(r4, [xy(614,386),xy(615,334),xy(607,322),xy(600,305),xy(600,299)]).
midline(r4, [xy(615,387),xy(615,446),xy(614,459),xy(609,473),xy(601,475),xy(564,475)]).
midline(r4, [xy(608,475),xy(613,486),xy(615,501),xy(615,549),xy(613,563),xy(609,571),xy(589,575),xy(443,575),xy(420,571),xy(400,558),xy(400,490),xy(364,455),xy(365,384)]).
midline(r4, [xy(400,559),xy(382,576),xy(366,584),xy(353,575),xy(344,575)]).
midline(r4, [xy(401,490),xy(410,483),xy(430,475),xy(465,475)]).
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
region(r3, '#2ecc40', 31400, centroid(491,369)).
perimeter(r3, 980).
polygon(r3, [xy(589,450),xy(390,450),xy(390,350),xy(350,350),xy(350,340),xy(359,340),xy(360,330),xy(369,330),xy(370,320),xy(379,320),xy(380,310),xy(399,310),xy(400,300),xy(410,299),xy(410,290),xy(429,290),xy(430,280),xy(439,280),xy(440,349),xy(489,350),xy(490,270),xy(549,270),xy(550,280),xy(589,280),xy(589,450)]).
midline(r3, [xy(439,400),xy(419,371),xy(415,358),xy(413,336),xy(411,334),xy(397,329),xy(375,339),xy(369,339),xy(363,344),xy(354,345)]).
midline(r3, [xy(441,400),xy(503,399),xy(531,390),xy(539,363),xy(540,328),xy(523,303),xy(528,298),xy(528,294),xy(530,294)]).
midline(r3, [xy(412,333),xy(424,304),xy(434,293),xy(435,284)]).
fillpoint(r3, xy(531,391), 59.0).
fillpoint(r3, xy(532,388), 58.0).
fillpoint(r3, xy(528,392), 58.0).
fillpoint(r3, xy(536,376), 54.0).
fillpoint(r3, xy(516,396), 54.0).
fillpoint(r3, xy(537,372), 53.0).
fillpoint(r3, xy(512,397), 53.0).
fillpoint(r3, xy(538,368), 52.0).
fillpoint(r3, xy(508,398), 52.0).
fillpoint(r3, xy(539,361), 51.0).
fillpoint(r3, xy(501,399), 51.0).
fillpoint(r3, xy(540,338), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(424,305), 16.0).
fillpoint(r3, xy(385,334), 16.0).
region(r17, '#2ecc40', 7200, centroid(310,620)).
perimeter(r17, 760).
polygon(r17, [xy(489,630),xy(130,630),xy(130,610),xy(489,610),xy(489,630)]).
midline(r17, [xy(345,620),xy(139,620)]).
midline(r17, [xy(346,619),xy(480,620)]).
fillpoint(r17, xy(139,620), 10.0).
region(r10, '#2ecc40', 6600, centroid(508,524)).
perimeter(r10, 520).
polygon(r10, [xy(589,550),xy(440,550),xy(440,500),xy(589,500),xy(589,550)]).
hole(r10, [xy(580,539),xy(579,510),xy(550,510),xy(550,540),xy(580,539)]).
midline(r10, [xy(584,532),xy(585,539),xy(583,544),xy(552,545),xy(544,543),xy(524,524),xy(464,525)]).
midline(r10, [xy(525,524),xy(546,505),xy(578,504),xy(584,505),xy(585,531)]).
fillpoint(r10, xy(464,525), 25.0).
region(r7, '#2ecc40', 4000, centroid(334,466)).
perimeter(r7, 540).
polygon(r7, [xy(359,570),xy(330,569),xy(330,560),xy(350,559),xy(350,490),xy(310,489),xy(310,430),xy(320,429),xy(320,390),xy(330,389),xy(330,370),xy(340,370),xy(340,479),xy(360,480),xy(359,570)]).
midline(r7, [xy(334,392),xy(335,374)]).
midline(r7, [xy(334,393),xy(329,399),xy(330,429),xy(324,444),xy(324,475),xy(336,484),xy(354,485),xy(355,490),xy(354,563),xy(334,565)]).
fillpoint(r7, xy(325,459), 15.0).
fillpoint(r7, xy(329,434), 11.0).
fillpoint(r7, xy(329,414), 10.0).
fillpoint(r7, xy(354,485), 6.0).
fillpoint(r7, xy(353,564), 6.0).
fillpoint(r7, xy(335,381), 5.0).
fillpoint(r7, xy(341,485), 5.0).
fillpoint(r7, xy(354,525), 5.0).
fillpoint(r7, xy(334,565), 5.0).
region(r2, '#ffdc00', 3200, centroid(469,310)).
perimeter(r2, 260).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,280),xy(469,280),xy(470,270),xy(490,270),xy(489,350)]).
midline(r2, [xy(454,290),xy(449,290)]).
midline(r2, [xy(455,290),xy(469,300),xy(475,293),xy(480,279)]).
midline(r2, [xy(470,301),xy(470,330)]).
fillpoint(r2, xy(469,315), 20.0).
fillpoint(r2, xy(479,284), 11.0).
fillpoint(r2, xy(454,290), 11.0).
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
region(r9, '#870c25', 1500, centroid(514,484)).
perimeter(r9, 160).
polygon(r9, [xy(539,500),xy(490,500),xy(490,470),xy(539,470),xy(539,500)]).
midline(r9, [xy(516,484),xy(504,485)]).
midline(r9, [xy(517,485),xy(525,485)]).
fillpoint(r9, xy(504,485), 15.0).
region(r18, '#5a5a5a', 1200, centroid(520,620)).
perimeter(r18, 160).
polygon(r18, [xy(549,630),xy(490,630),xy(490,610),xy(549,610),xy(549,630)]).
midline(r18, [xy(511,620),xy(499,620)]).
midline(r18, [xy(512,620),xy(540,620)]).
fillpoint(r18, xy(499,620), 10.0).
region(r8, '#bebebe', 1000, centroid(514,460)).
perimeter(r8, 140).
polygon(r8, [xy(539,470),xy(490,470),xy(490,450),xy(539,450),xy(539,470)]).
midline(r8, [xy(509,460),xy(499,460)]).
midline(r8, [xy(510,459),xy(530,460)]).
fillpoint(r8, xy(499,460), 10.0).
region(r12, '#5a5a5a', 800, centroid(564,524)).
perimeter(r12, 160).
polygon(r12, [xy(579,540),xy(550,539),xy(550,510),xy(580,510),xy(579,540)]).
hole(r12, [xy(570,529),xy(569,520),xy(560,520),xy(560,530),xy(570,529)]).
midline(r12, [xy(569,514),xy(555,515),xy(555,534),xy(567,535),xy(574,533),xy(575,520),xy(574,516),xy(570,515)]).
fillpoint(r12, xy(556,515), 6.0).
fillpoint(r12, xy(574,515), 6.0).
fillpoint(r12, xy(555,534), 6.0).
fillpoint(r12, xy(573,534), 6.0).
fillpoint(r12, xy(561,515), 5.0).
fillpoint(r12, xy(554,525), 5.0).
fillpoint(r12, xy(574,525), 5.0).
fillpoint(r12, xy(561,535), 5.0).
region(r5, '#0074d9', 500, centroid(444,324)).
perimeter(r5, 120).
polygon(r5, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r5, [xy(445,317),xy(445,345)]).
midline(r5, [xy(445,316),xy(445,304)]).
fillpoint(r5, xy(444,325), 5.0).
region(r6, '#0074d9', 400, centroid(370,354)).
perimeter(r6, 100).
polygon(r6, [xy(389,360),xy(350,360),xy(350,350),xy(389,350),xy(389,360)]).
midline(r6, [xy(369,354),xy(354,355)]).
midline(r6, [xy(370,354),xy(385,355)]).
fillpoint(r6, xy(354,355), 5.0).
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
region(r11, '#7fdbff', 100, centroid(324,514)).
perimeter(r11, 40).
polygon(r11, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r11, [xy(325,515),xy(325,514)]).
fillpoint(r11, xy(324,515), 5.0).
region(r13, '#2ecc40', 100, centroid(564,524)).
perimeter(r13, 40).
polygon(r13, [xy(569,530),xy(560,529),xy(560,520),xy(570,520),xy(569,530)]).
midline(r13, [xy(565,525),xy(565,524)]).
fillpoint(r13, xy(564,525), 5.0).
region(r14, '#7fdbff', 100, centroid(324,534)).
perimeter(r14, 40).
polygon(r14, [xy(329,540),xy(320,539),xy(320,530),xy(330,530),xy(329,540)]).
midline(r14, [xy(325,535),xy(325,534)]).
fillpoint(r14, xy(324,535), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 60).
adjacent(r1, r3).
shared_edge(r1, r3, 280).
adjacent(r1, r4).
shared_edge(r1, r4, 420).
adjacent(r1, r6).
shared_edge(r1, r6, 10).
adjacent(r1, r7).
shared_edge(r1, r7, 300).
adjacent(r1, r11).
shared_edge(r1, r11, 40).
adjacent(r1, r14).
shared_edge(r1, r14, 40).
adjacent(r1, r15).
shared_edge(r1, r15, 240).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 740).
adjacent(r1, r18).
shared_edge(r1, r18, 140).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 140).
adjacent(r2, r5).
shared_edge(r2, r5, 60).
adjacent(r3, r4).
shared_edge(r3, r4, 400).
adjacent(r3, r5).
shared_edge(r3, r5, 60).
adjacent(r3, r6).
shared_edge(r3, r6, 50).
adjacent(r3, r8).
shared_edge(r3, r8, 50).
adjacent(r4, r6).
shared_edge(r4, r6, 40).
adjacent(r4, r7).
shared_edge(r4, r7, 240).
adjacent(r4, r8).
shared_edge(r4, r8, 40).
adjacent(r4, r9).
shared_edge(r4, r9, 60).
adjacent(r4, r10).
shared_edge(r4, r10, 350).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r9, r10).
shared_edge(r9, r10, 50).
adjacent(r10, r12).
shared_edge(r10, r12, 120).
adjacent(r12, r13).
shared_edge(r12, r13, 40).
adjacent(r17, r18).
shared_edge(r17, r18, 20).

encloses(r1, r11).
encloses(r12, r13).
encloses(r1, r14).
encloses(r1, r15).
encloses(r1, r16).
encloses(r1, r19).
encloses(r1, r20).
