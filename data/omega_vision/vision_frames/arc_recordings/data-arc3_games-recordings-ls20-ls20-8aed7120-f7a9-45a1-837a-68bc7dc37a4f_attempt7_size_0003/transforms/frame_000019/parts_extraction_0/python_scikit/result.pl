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

region(r1, '#aaaaaa', 291800, centroid(255,274)).
perimeter(r1, 4420).
polygon(r1, [xy(639,260),xy(620,260),xy(620,250),xy(610,250),xy(609,240),xy(590,240),xy(589,230),xy(550,230),xy(549,220),xy(470,220),xy(469,230),xy(430,230),xy(429,240),xy(410,240),xy(410,249),xy(400,250),xy(399,260),xy(380,260),xy(380,269),xy(370,270),xy(370,279),xy(360,280),xy(360,289),xy(350,290),xy(350,309),xy(340,310),xy(340,319),xy(330,320),xy(330,339),xy(320,340),xy(320,379),xy(310,380),xy(310,459),xy(320,460),xy(320,489),xy(350,490),xy(350,549),xy(359,550),xy(360,559),xy(369,560),xy(370,570),xy(380,570),xy(380,580),xy(399,580),xy(400,589),xy(409,590),xy(410,600),xy(609,600),xy(610,590),xy(620,589),xy(620,580),xy(639,580)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(205,216),xy(186,199),xy(167,269),xy(155,356),xy(154,455),xy(114,496),xy(90,528),xy(70,569),xy(76,578),xy(75,580),xy(77,580)]).
midline(r1, [xy(206,217),xy(309,320),xy(307,321),xy(188,202)]).
midline(r1, [xy(169,271),xy(239,341),xy(242,340),xy(170,266)]).
midline(r1, [xy(243,341),xy(172,268)]).
midline(r1, [xy(310,321),xy(309,322)]).
midline(r1, [xy(187,197),xy(189,189),xy(203,183)]).
midline(r1, [xy(155,455),xy(194,490),xy(239,522),xy(273,488),xy(285,485),xy(295,479),xy(294,482)]).
midline(r1, [xy(240,523),xy(260,535),xy(284,544),xy(305,563),xy(326,575),xy(333,576),xy(340,581),xy(347,582),xy(373,594),xy(385,594),xy(394,599),xy(400,599),xy(406,604),xy(553,605),xy(555,606),xy(555,631),xy(553,634),xy(130,635),xy(120,630),xy(92,602),xy(77,582)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,632),xy(585,607),xy(583,605),xy(556,605)]).
midline(r1, [xy(204,181),xy(286,146),xy(328,135)]).
midline(r1, [xy(585,606),xy(591,604),xy(615,604),xy(615,632),xy(613,634),xy(590,635),xy(585,633)]).
midline(r1, [xy(616,603),xy(619,599),xy(627,598),xy(630,589)]).
midline(r1, [xy(245,341),xy(247,343)]).
midline(r1, [xy(249,342),xy(270,350),xy(276,350),xy(276,352)]).
midline(r1, [xy(278,352),xy(284,355),xy(286,354),xy(284,352)]).
midline(r1, [xy(287,355),xy(295,358),xy(295,360)]).
midline(r1, [xy(329,133),xy(395,117),xy(432,154),xy(430,159),xy(391,120)]).
midline(r1, [xy(397,117),xy(450,110),xy(530,109),xy(562,143),xy(581,170),xy(581,179),xy(575,192),xy(578,190)]).
midline(r1, [xy(583,176),xy(582,178)]).
midline(r1, [xy(580,183),xy(579,186)]).
midline(r1, [xy(582,183),xy(581,181),xy(583,181)]).
midline(r1, [xy(433,158),xy(431,160),xy(432,164),xy(433,160)]).
midline(r1, [xy(583,174),xy(606,200),xy(612,213),xy(608,217),xy(613,214),xy(616,217),xy(622,227),xy(630,250)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(298,156),xy(383,241)]).
midline(r1, [xy(437,174),xy(433,169),xy(433,165),xy(435,165)]).
midline(r1, [xy(438,175),xy(436,177),xy(438,177)]).
midline(r1, [xy(438,179),xy(449,207),xy(451,207)]).
midline(r1, [xy(435,167),xy(437,172)]).
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
fillpoint(r1, xy(155,418), 155.0).
fillpoint(r1, xy(287,146), 147.0).
fillpoint(r1, xy(290,145), 146.0).
fillpoint(r1, xy(293,144), 145.0).
fillpoint(r1, xy(296,143), 144.0).
fillpoint(r1, xy(299,142), 143.0).
fillpoint(r1, xy(309,139), 140.0).
fillpoint(r1, xy(313,138), 139.0).
fillpoint(r1, xy(317,137), 138.0).
fillpoint(r1, xy(342,129), 130.0).
fillpoint(r1, xy(354,126), 127.0).
fillpoint(r1, xy(358,125), 126.0).
fillpoint(r1, xy(363,124), 125.0).
fillpoint(r1, xy(367,123), 124.0).
fillpoint(r1, xy(371,122), 123.0).
fillpoint(r1, xy(375,121), 122.0).
fillpoint(r1, xy(379,120), 121.0).
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
midline(r4, [xy(595,475),xy(564,475)]).
midline(r4, [xy(596,475),xy(608,474),xy(613,486),xy(615,501),xy(615,549),xy(614,555),xy(599,570),xy(590,575),xy(430,574),xy(421,567),xy(407,549),xy(400,539),xy(399,533),xy(393,533),xy(388,538),xy(386,537),xy(386,539)]).
midline(r4, [xy(430,575),xy(427,579),xy(430,578)]).
midline(r4, [xy(393,535),xy(392,536)]).
midline(r4, [xy(400,532),xy(400,490),xy(364,455),xy(365,384)]).
midline(r4, [xy(609,473),xy(614,459),xy(615,447),xy(615,284),xy(607,272),xy(600,255),xy(600,249)]).
midline(r4, [xy(401,490),xy(412,482),xy(426,476),xy(443,474),xy(465,475)]).
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
midline(r3, [xy(329,480),xy(329,454),xy(324,445),xy(324,394),xy(329,385),xy(330,377),xy(329,349),xy(344,334),xy(369,325),xy(390,310),xy(393,311),xy(399,307),xy(400,300),xy(417,274),xy(424,254),xy(434,243),xy(435,234)]).
midline(r3, [xy(331,480),xy(340,485),xy(354,485),xy(355,545)]).
midline(r3, [xy(398,310),xy(412,333),xy(418,369),xy(427,385),xy(439,400),xy(454,387),xy(470,378),xy(499,374),xy(519,366),xy(540,348),xy(540,279),xy(524,254),xy(529,242),xy(531,242)]).
midline(r3, [xy(540,350),xy(552,364),xy(562,383),xy(565,400),xy(565,425)]).
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
region(r9, '#2ecc40', 10000, centroid(514,512)).
perimeter(r9, 500).
polygon(r9, [xy(589,550),xy(440,550),xy(440,500),xy(489,500),xy(490,450),xy(539,450),xy(540,499),xy(590,500),xy(589,550)]).
midline(r9, [xy(514,491),xy(515,515),xy(513,519),xy(498,524),xy(464,525)]).
midline(r9, [xy(515,518),xy(531,524),xy(565,525)]).
midline(r9, [xy(515,490),xy(515,474)]).
fillpoint(r9, xy(515,518), 31.4).
fillpoint(r9, xy(508,521), 29.0).
fillpoint(r9, xy(521,521), 29.0).
fillpoint(r9, xy(505,522), 28.0).
fillpoint(r9, xy(524,522), 28.0).
fillpoint(r9, xy(502,523), 27.0).
fillpoint(r9, xy(527,523), 27.0).
fillpoint(r9, xy(498,524), 26.0).
fillpoint(r9, xy(532,524), 26.0).
fillpoint(r9, xy(515,486), 25.0).
fillpoint(r9, xy(464,525), 25.0).
fillpoint(r9, xy(541,525), 25.0).
region(r11, '#5a5a5a', 7200, centroid(370,620)).
perimeter(r11, 760).
polygon(r11, [xy(549,630),xy(190,630),xy(190,610),xy(549,610),xy(549,630)]).
midline(r11, [xy(364,619),xy(199,620)]).
midline(r11, [xy(365,619),xy(540,620)]).
fillpoint(r11, xy(199,620), 10.0).
region(r2, '#ffdc00', 5700, centroid(467,284)).
perimeter(r2, 360).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,230),xy(469,230),xy(470,220),xy(490,220),xy(489,350)]).
midline(r2, [xy(478,237),xy(464,254),xy(465,275),xy(462,279),xy(465,278)]).
midline(r2, [xy(478,236),xy(480,229)]).
midline(r2, [xy(465,280),xy(469,292),xy(470,330)]).
fillpoint(r2, xy(465,267), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(479,234), 11.0).
region(r8, '#870c25', 1500, centroid(514,434)).
perimeter(r8, 160).
polygon(r8, [xy(539,450),xy(490,450),xy(490,420),xy(539,420),xy(539,450)]).
midline(r8, [xy(516,434),xy(504,435)]).
midline(r8, [xy(517,434),xy(525,435)]).
fillpoint(r8, xy(504,435), 15.0).
region(r10, '#2ecc40', 1200, centroid(160,620)).
perimeter(r10, 160).
polygon(r10, [xy(189,630),xy(130,630),xy(130,610),xy(189,610),xy(189,630)]).
midline(r10, [xy(149,620),xy(139,620)]).
midline(r10, [xy(150,619),xy(180,620)]).
fillpoint(r10, xy(139,620), 10.0).
region(r7, '#bebebe', 1000, centroid(514,410)).
perimeter(r7, 140).
polygon(r7, [xy(539,420),xy(490,420),xy(490,400),xy(539,400),xy(539,420)]).
midline(r7, [xy(501,409),xy(499,410)]).
midline(r7, [xy(502,410),xy(530,410)]).
fillpoint(r7, xy(499,410), 10.0).
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
region(r12, '#7fdbff', 400, centroid(570,620)).
perimeter(r12, 80).
polygon(r12, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r12, [xy(569,619),xy(570,620)]).
fillpoint(r12, xy(569,620), 10.0).
region(r13, '#7fdbff', 400, centroid(600,620)).
perimeter(r13, 80).
polygon(r13, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r13, [xy(599,619),xy(600,620)]).
fillpoint(r13, xy(599,620), 10.0).
region(r14, '#7fdbff', 400, centroid(630,620)).
perimeter(r14, 80).
polygon(r14, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r14, [xy(629,619),xy(630,620)]).
fillpoint(r14, xy(629,620), 10.0).
border(r14).

adjacent(r1, r2).
shared_edge(r1, r2, 60).
adjacent(r1, r3).
shared_edge(r1, r3, 620).
adjacent(r1, r4).
shared_edge(r1, r4, 420).
adjacent(r1, r10).
shared_edge(r1, r10, 140).
adjacent(r1, r11).
shared_edge(r1, r11, 740).
adjacent(r1, r12).
shared_edge(r1, r12, 80).
adjacent(r1, r13).
shared_edge(r1, r13, 80).
adjacent(r1, r14).
shared_edge(r1, r14, 60).
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
adjacent(r10, r11).
shared_edge(r10, r11, 20).

encloses(r1, r12).
encloses(r1, r13).
