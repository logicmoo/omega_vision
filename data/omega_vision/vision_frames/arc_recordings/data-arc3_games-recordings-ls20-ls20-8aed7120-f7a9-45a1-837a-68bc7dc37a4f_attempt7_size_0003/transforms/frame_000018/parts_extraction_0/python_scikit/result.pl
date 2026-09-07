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
midline(r1, [xy(429,635),xy(130,635),xy(119,629),xy(90,600),xy(76,577),xy(69,570),xy(84,538),xy(98,516),xy(114,496),xy(154,455),xy(155,406),xy(162,347),xy(178,274),xy(201,203),xy(231,191)]).
midline(r1, [xy(173,304),xy(259,390),xy(255,393),xy(252,392),xy(171,311)]).
midline(r1, [xy(253,393),xy(255,395),xy(258,394),xy(258,396)]).
midline(r1, [xy(73,572),xy(71,570)]).
midline(r1, [xy(430,635),xy(553,634),xy(555,632),xy(555,607),xy(553,605),xy(346,604),xy(334,594),xy(305,582),xy(288,567),xy(266,554),xy(237,527),xy(205,504),xy(155,455)]).
midline(r1, [xy(555,633),xy(575,635),xy(585,632),xy(585,608),xy(583,605),xy(560,604),xy(555,606)]).
midline(r1, [xy(585,606),xy(608,604),xy(614,606),xy(615,612),xy(615,631),xy(613,634),xy(591,635),xy(585,633)]).
midline(r1, [xy(615,606),xy(620,604),xy(635,605)]).
midline(r1, [xy(260,391),xy(263,394),xy(260,394)]).
midline(r1, [xy(264,395),xy(264,397),xy(262,396)]).
midline(r1, [xy(266,395),xy(268,397),xy(265,398)]).
midline(r1, [xy(268,399),xy(271,396),xy(270,399),xy(275,401),xy(273,398)]).
midline(r1, [xy(276,402),xy(279,401),xy(279,403)]).
midline(r1, [xy(171,313),xy(169,319),xy(173,315),xy(175,317),xy(171,321),xy(176,318),xy(173,323),xy(178,320),xy(175,325),xy(180,322),xy(177,327),xy(182,324),xy(179,329),xy(184,326),xy(181,331),xy(186,328),xy(183,333),xy(188,330),xy(185,335),xy(190,332),xy(187,337),xy(192,334),xy(189,339),xy(194,336),xy(191,341),xy(196,338),xy(193,343),xy(198,340),xy(195,345),xy(200,342),xy(197,347),xy(202,344),xy(199,349),xy(204,346),xy(201,351),xy(206,348),xy(203,353),xy(208,350),xy(205,355),xy(210,352),xy(207,357),xy(212,354),xy(209,359),xy(214,356),xy(211,361),xy(216,358),xy(213,363),xy(218,360),xy(215,365),xy(220,362),xy(217,367),xy(222,364),xy(219,369),xy(224,366),xy(221,371),xy(226,368),xy(223,373),xy(228,370),xy(225,375),xy(230,372),xy(227,377),xy(232,374),xy(229,379),xy(234,376),xy(231,381),xy(236,378),xy(233,383),xy(238,380),xy(235,385),xy(240,382),xy(237,387),xy(242,384),xy(239,389),xy(245,387),xy(241,391)]).
midline(r1, [xy(243,391),xy(246,388),xy(245,391),xy(249,391),xy(247,393)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(289,566),xy(292,565),xy(292,567)]).
midline(r1, [xy(294,567),xy(295,564),xy(297,565),xy(317,553),xy(337,548),xy(340,537),xy(338,524),xy(258,524),xy(240,528)]).
midline(r1, [xy(339,523),xy(339,504),xy(337,501),xy(329,499),xy(314,500),xy(278,517),xy(272,523)]).
midline(r1, [xy(232,189),xy(245,185)]).
midline(r1, [xy(246,183),xy(287,168),xy(307,164)]).
midline(r1, [xy(308,162),xy(342,152),xy(397,141),xy(418,140),xy(447,135),xy(505,134),xy(562,193),xy(583,223),xy(579,230),xy(580,234),xy(569,255),xy(572,253)]).
midline(r1, [xy(375,147),xy(430,202),xy(431,199),xy(378,146)]).
midline(r1, [xy(431,203),xy(434,218),xy(436,218)]).
midline(r1, [xy(581,229),xy(581,233)]).
midline(r1, [xy(583,232),xy(584,234),xy(578,238),xy(577,242)]).
midline(r1, [xy(581,237),xy(580,238)]).
midline(r1, [xy(436,220),xy(438,226),xy(435,230),xy(438,233),xy(440,231),xy(439,227)]).
midline(r1, [xy(440,232),xy(441,234),xy(439,234)]).
midline(r1, [xy(441,236),xy(450,259),xy(452,259)]).
midline(r1, [xy(584,224),xy(586,226),xy(583,229)]).
midline(r1, [xy(585,229),xy(585,233)]).
midline(r1, [xy(587,229),xy(587,227)]).
midline(r1, [xy(589,229),xy(602,244),xy(611,262),xy(620,273),xy(630,300)]).
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
midline(r4, [xy(400,515),xy(400,490),xy(364,455),xy(365,384)]).
midline(r4, [xy(399,516),xy(400,559),xy(382,576),xy(366,584),xy(353,575),xy(344,575)]).
midline(r4, [xy(401,490),xy(412,482),xy(426,476),xy(442,474),xy(465,475)]).
midline(r4, [xy(401,559),xy(418,570),xy(440,575),xy(588,575),xy(610,570)]).
midline(r4, [xy(611,568),xy(615,548),xy(615,500),xy(609,476),xy(607,474),xy(564,475)]).
midline(r4, [xy(608,474),xy(613,463),xy(615,448),xy(615,334),xy(607,322),xy(600,305),xy(600,299)]).
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
midline(r3, [xy(439,400),xy(419,371),xy(415,358),xy(414,340),xy(411,334),xy(397,330),xy(375,339),xy(369,339),xy(363,344),xy(354,345)]).
midline(r3, [xy(441,399),xy(503,399),xy(531,391)]).
midline(r3, [xy(412,333),xy(424,304),xy(434,293),xy(435,284)]).
midline(r3, [xy(532,389),xy(539,363),xy(540,328),xy(523,303),xy(528,298),xy(527,296),xy(529,296)]).
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
region(r14, '#5a5a5a', 7600, centroid(360,620)).
perimeter(r14, 800).
polygon(r14, [xy(549,630),xy(170,630),xy(170,610),xy(549,610),xy(549,630)]).
midline(r14, [xy(344,619),xy(179,620)]).
midline(r14, [xy(345,620),xy(540,620)]).
fillpoint(r14, xy(179,620), 10.0).
region(r10, '#2ecc40', 7500, centroid(514,524)).
perimeter(r10, 400).
polygon(r10, [xy(589,550),xy(440,550),xy(440,500),xy(589,500),xy(589,550)]).
midline(r10, [xy(561,524),xy(464,525)]).
midline(r10, [xy(562,525),xy(565,525)]).
fillpoint(r10, xy(464,525), 25.0).
region(r7, '#2ecc40', 4000, centroid(334,466)).
perimeter(r7, 540).
polygon(r7, [xy(359,570),xy(330,569),xy(330,560),xy(350,559),xy(350,490),xy(310,489),xy(310,430),xy(320,429),xy(320,390),xy(330,389),xy(330,370),xy(340,370),xy(340,479),xy(360,480),xy(359,570)]).
midline(r7, [xy(334,392),xy(335,374)]).
midline(r7, [xy(334,393),xy(329,399),xy(330,427),xy(329,435),xy(324,444),xy(324,475),xy(336,484),xy(354,485),xy(355,490),xy(354,563),xy(334,565)]).
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
midline(r2, [xy(455,290),xy(463,294),xy(470,301),xy(470,330)]).
midline(r2, [xy(470,298),xy(475,293),xy(480,279)]).
fillpoint(r2, xy(469,315), 20.0).
fillpoint(r2, xy(479,284), 11.0).
fillpoint(r2, xy(454,290), 11.0).
region(r9, '#870c25', 1500, centroid(514,484)).
perimeter(r9, 160).
polygon(r9, [xy(539,500),xy(490,500),xy(490,470),xy(539,470),xy(539,500)]).
midline(r9, [xy(522,485),xy(504,485)]).
midline(r9, [xy(523,485),xy(525,485)]).
fillpoint(r9, xy(504,485), 15.0).
region(r8, '#bebebe', 1000, centroid(514,460)).
perimeter(r8, 140).
polygon(r8, [xy(539,470),xy(490,470),xy(490,450),xy(539,450),xy(539,470)]).
midline(r8, [xy(520,460),xy(499,460)]).
midline(r8, [xy(521,460),xy(530,460)]).
fillpoint(r8, xy(499,460), 10.0).
region(r13, '#2ecc40', 800, centroid(150,620)).
perimeter(r13, 120).
polygon(r13, [xy(169,630),xy(130,630),xy(130,610),xy(169,610),xy(169,630)]).
midline(r13, [xy(160,620),xy(139,620)]).
fillpoint(r13, xy(139,620), 10.0).
region(r5, '#0074d9', 500, centroid(444,324)).
perimeter(r5, 120).
polygon(r5, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r5, [xy(445,311),xy(445,304)]).
midline(r5, [xy(445,312),xy(445,345)]).
fillpoint(r5, xy(444,325), 5.0).
region(r6, '#0074d9', 400, centroid(370,354)).
perimeter(r6, 100).
polygon(r6, [xy(389,360),xy(350,360),xy(350,350),xy(389,350),xy(389,360)]).
midline(r6, [xy(369,354),xy(354,355)]).
midline(r6, [xy(370,355),xy(385,355)]).
fillpoint(r6, xy(354,355), 5.0).
region(r15, '#7fdbff', 400, centroid(570,620)).
perimeter(r15, 80).
polygon(r15, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r15, [xy(569,619),xy(570,620)]).
fillpoint(r15, xy(569,620), 10.0).
region(r16, '#7fdbff', 400, centroid(600,620)).
perimeter(r16, 80).
polygon(r16, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r16, [xy(599,619),xy(600,620)]).
fillpoint(r16, xy(599,620), 10.0).
region(r17, '#7fdbff', 400, centroid(630,620)).
perimeter(r17, 80).
polygon(r17, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r17, [xy(629,619),xy(630,620)]).
fillpoint(r17, xy(629,620), 10.0).
border(r17).
region(r11, '#7fdbff', 100, centroid(324,514)).
perimeter(r11, 40).
polygon(r11, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r11, [xy(325,515),xy(325,514)]).
fillpoint(r11, xy(324,515), 5.0).
region(r12, '#7fdbff', 100, centroid(324,534)).
perimeter(r12, 40).
polygon(r12, [xy(329,540),xy(320,539),xy(320,530),xy(330,530),xy(329,540)]).
midline(r12, [xy(325,535),xy(325,534)]).
fillpoint(r12, xy(324,535), 5.0).

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
adjacent(r1, r12).
shared_edge(r1, r12, 40).
adjacent(r1, r13).
shared_edge(r1, r13, 100).
adjacent(r1, r14).
shared_edge(r1, r14, 780).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 60).
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
adjacent(r13, r14).
shared_edge(r13, r14, 20).

encloses(r1, r11).
encloses(r1, r12).
encloses(r1, r15).
encloses(r1, r16).
