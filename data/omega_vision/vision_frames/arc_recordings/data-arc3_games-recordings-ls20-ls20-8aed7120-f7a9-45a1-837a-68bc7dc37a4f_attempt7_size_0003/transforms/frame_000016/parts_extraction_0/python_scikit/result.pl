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

region(r1, '#aaaaaa', 330800, centroid(278,279)).
perimeter(r1, 4220).
polygon(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(639,330),xy(600,330),xy(599,320),xy(520,320),xy(519,330),xy(480,330),xy(479,340),xy(460,340),xy(460,349),xy(450,350),xy(449,360),xy(430,360),xy(430,369),xy(420,370),xy(420,379),xy(410,380),xy(409,390),xy(400,390),xy(400,409),xy(390,410),xy(390,419),xy(380,420),xy(380,439),xy(370,440),xy(370,479),xy(360,480),xy(360,559),xy(370,560),xy(370,600),xy(639,600)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(617,306),xy(612,295),xy(599,279),xy(502,182),xy(477,162),xy(423,169),xy(366,182),xy(296,204),xy(231,231),xy(217,270),xy(199,333),xy(188,386),xy(184,425),xy(114,496),xy(90,528),xy(70,569),xy(73,571),xy(82,590),xy(84,590)]).
midline(r1, [xy(84,592),xy(117,627),xy(130,635),xy(549,635),xy(555,632),xy(555,607),xy(549,604),xy(372,605),xy(364,603),xy(340,580),xy(324,572),xy(309,559),xy(213,463),xy(184,427)]).
midline(r1, [xy(402,176),xy(481,255),xy(482,253),xy(404,175)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,632),xy(585,607),xy(583,605),xy(560,604),xy(555,606)]).
midline(r1, [xy(585,606),xy(591,604),xy(615,606),xy(615,631),xy(613,634),xy(591,635),xy(585,633)]).
midline(r1, [xy(616,605),xy(635,605)]).
midline(r1, [xy(198,345),xy(294,441),xy(301,442),xy(301,444)]).
midline(r1, [xy(303,443),xy(311,447),xy(315,446),xy(315,448)]).
midline(r1, [xy(317,448),xy(320,450),xy(324,449),xy(324,451)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(492,287),xy(488,285),xy(493,289),xy(491,292),xy(494,293),xy(495,299),xy(497,299)]).
midline(r1, [xy(497,301),xy(501,307),xy(500,309),xy(502,309)]).
midline(r1, [xy(491,284),xy(481,261),xy(482,256),xy(484,263)]).
fillpoint(r1, xy(231,231), 232.0).
fillpoint(r1, xy(218,268), 219.0).
fillpoint(r1, xy(217,271), 218.0).
fillpoint(r1, xy(215,278), 216.0).
fillpoint(r1, xy(214,282), 215.0).
fillpoint(r1, xy(212,289), 213.0).
fillpoint(r1, xy(211,292), 212.0).
fillpoint(r1, xy(210,295), 211.0).
fillpoint(r1, xy(209,298), 210.0).
fillpoint(r1, xy(208,301), 209.0).
fillpoint(r1, xy(205,311), 206.0).
fillpoint(r1, xy(297,204), 205.0).
fillpoint(r1, xy(203,318), 204.0).
fillpoint(r1, xy(202,322), 203.0).
fillpoint(r1, xy(201,326), 202.0).
fillpoint(r1, xy(200,330), 201.0).
fillpoint(r1, xy(311,199), 200.0).
fillpoint(r1, xy(199,334), 200.0).
fillpoint(r1, xy(198,339), 199.0).
fillpoint(r1, xy(197,343), 198.0).
fillpoint(r1, xy(196,347), 197.0).
fillpoint(r1, xy(324,195), 196.0).
fillpoint(r1, xy(195,351), 196.0).
fillpoint(r1, xy(194,356), 195.0).
fillpoint(r1, xy(331,193), 194.0).
fillpoint(r1, xy(193,360), 194.0).
fillpoint(r1, xy(335,192), 193.0).
fillpoint(r1, xy(192,365), 193.0).
fillpoint(r1, xy(191,370), 192.0).
fillpoint(r1, xy(190,376), 191.0).
fillpoint(r1, xy(189,382), 190.0).
fillpoint(r1, xy(188,388), 189.0).
fillpoint(r1, xy(187,395), 188.0).
fillpoint(r1, xy(186,405), 187.0).
fillpoint(r1, xy(357,185), 186.0).
fillpoint(r1, xy(185,415), 186.0).
fillpoint(r1, xy(184,422), 185.0).
fillpoint(r1, xy(364,183), 184.0).
fillpoint(r1, xy(367,182), 183.0).
fillpoint(r1, xy(371,181), 182.0).
fillpoint(r1, xy(375,180), 181.0).
fillpoint(r1, xy(379,179), 180.0).
fillpoint(r1, xy(383,178), 179.0).
fillpoint(r1, xy(388,177), 178.0).
fillpoint(r1, xy(396,175), 176.0).
fillpoint(r1, xy(400,174), 175.0).
fillpoint(r1, xy(404,173), 174.0).
fillpoint(r1, xy(409,172), 173.0).
fillpoint(r1, xy(414,171), 172.0).
fillpoint(r1, xy(419,170), 171.0).
fillpoint(r1, xy(425,169), 170.0).
fillpoint(r1, xy(431,168), 169.0).
fillpoint(r1, xy(438,167), 168.0).
fillpoint(r1, xy(447,166), 167.0).
fillpoint(r1, xy(458,165), 166.0).
fillpoint(r1, xy(466,164), 165.0).
fillpoint(r1, xy(472,163), 164.0).
border(r1).
region(r3, '#ffdc00', 37800, centroid(515,505)).
perimeter(r3, 1580).
polygon(r3, [xy(639,600),xy(370,600),xy(370,560),xy(360,559),xy(360,480),xy(370,479),xy(370,440),xy(380,439),xy(380,420),xy(390,420),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,550),xy(589,550),xy(590,500),xy(540,500),xy(540,450),xy(590,449),xy(590,320),xy(599,320),xy(600,330),xy(639,330)]).
midline(r3, [xy(399,513),xy(400,509),xy(398,506),xy(378,496),xy(378,498)]).
midline(r3, [xy(400,514),xy(400,527),xy(387,537),xy(398,533),xy(400,529)]).
midline(r3, [xy(400,533),xy(406,563),xy(430,574),xy(589,575),xy(609,571),xy(613,563),xy(615,549),xy(615,504),xy(611,480),xy(607,474),xy(564,475)]).
midline(r3, [xy(608,474),xy(613,463),xy(615,447),xy(615,357),xy(596,335),xy(595,324)]).
midline(r3, [xy(396,507),xy(390,504)]).
midline(r3, [xy(400,506),xy(406,486),xy(389,469),xy(380,455),xy(379,449),xy(383,445),xy(385,438),xy(385,424)]).
midline(r3, [xy(407,485),xy(430,475),xy(465,475)]).
fillpoint(r3, xy(399,520), 40.0).
fillpoint(r3, xy(402,498), 38.1).
fillpoint(r3, xy(402,541), 38.0).
fillpoint(r3, xy(403,495), 37.3).
fillpoint(r3, xy(405,488), 37.0).
fillpoint(r3, xy(404,491), 37.0).
fillpoint(r3, xy(403,545), 37.0).
fillpoint(r3, xy(406,563), 36.8).
fillpoint(r3, xy(404,551), 36.1).
fillpoint(r3, xy(405,558), 36.1).
fillpoint(r3, xy(608,475), 31.4).
fillpoint(r3, xy(610,570), 29.7).
fillpoint(r3, xy(611,468), 29.0).
fillpoint(r3, xy(421,478), 29.0).
fillpoint(r3, xy(611,481), 29.0).
fillpoint(r3, xy(611,568), 29.0).
fillpoint(r3, xy(421,571), 29.0).
fillpoint(r3, xy(608,571), 29.0).
fillpoint(r3, xy(612,465), 28.0).
fillpoint(r3, xy(424,477), 28.0).
fillpoint(r3, xy(612,484), 28.0).
fillpoint(r3, xy(612,565), 28.0).
fillpoint(r3, xy(424,572), 28.0).
fillpoint(r3, xy(605,572), 28.0).
fillpoint(r3, xy(613,462), 27.0).
fillpoint(r3, xy(427,476), 27.0).
fillpoint(r3, xy(613,487), 27.0).
fillpoint(r3, xy(613,562), 27.0).
fillpoint(r3, xy(427,573), 27.0).
fillpoint(r3, xy(602,573), 27.0).
fillpoint(r3, xy(614,458), 26.0).
fillpoint(r3, xy(432,475), 26.0).
fillpoint(r3, xy(614,492), 26.0).
fillpoint(r3, xy(614,558), 26.0).
fillpoint(r3, xy(432,574), 26.0).
fillpoint(r3, xy(598,574), 26.0).
fillpoint(r3, xy(615,401), 25.0).
fillpoint(r3, xy(441,475), 25.0).
fillpoint(r3, xy(564,475), 25.0).
fillpoint(r3, xy(614,525), 25.0).
fillpoint(r3, xy(441,575), 25.0).
fillpoint(r3, xy(380,454), 11.0).
border(r3).
region(r2, '#2ecc40', 28500, centroid(502,424)).
perimeter(r2, 960).
polygon(r2, [xy(539,550),xy(440,550),xy(440,500),xy(489,500),xy(490,450),xy(390,450),xy(390,410),xy(400,409),xy(400,390),xy(409,390),xy(410,380),xy(419,380),xy(420,370),xy(430,369),xy(430,360),xy(449,360),xy(450,350),xy(489,350),xy(490,330),xy(519,330),xy(520,320),xy(589,320),xy(590,449),xy(540,450),xy(539,550)]).
midline(r2, [xy(413,427),xy(429,418),xy(421,408),xy(431,417),xy(440,410),xy(480,399),xy(474,381),xy(467,370),xy(469,370)]).
midline(r2, [xy(478,389),xy(478,390)]).
midline(r2, [xy(481,399),xy(514,400),xy(530,392),xy(547,362),xy(542,350),xy(544,350)]).
midline(r2, [xy(515,401),xy(515,498),xy(511,519),xy(499,524),xy(464,525)]).
midline(r2, [xy(476,383),xy(475,382)]).
fillpoint(r2, xy(531,391), 59.0).
fillpoint(r2, xy(532,388), 58.0).
fillpoint(r2, xy(478,400), 50.0).
fillpoint(r2, xy(471,402), 48.0).
fillpoint(r2, xy(466,403), 47.0).
fillpoint(r2, xy(460,404), 46.0).
fillpoint(r2, xy(456,405), 45.0).
fillpoint(r2, xy(510,520), 29.7).
fillpoint(r2, xy(511,518), 29.0).
fillpoint(r2, xy(508,521), 29.0).
fillpoint(r2, xy(512,515), 28.0).
fillpoint(r2, xy(505,522), 28.0).
fillpoint(r2, xy(513,512), 27.0).
fillpoint(r2, xy(502,523), 27.0).
fillpoint(r2, xy(514,508), 26.0).
fillpoint(r2, xy(498,524), 26.0).
fillpoint(r2, xy(514,475), 25.0).
fillpoint(r2, xy(464,525), 25.0).
region(r7, '#5a5a5a', 8400, centroid(340,620)).
perimeter(r7, 880).
polygon(r7, [xy(549,630),xy(130,630),xy(130,610),xy(549,610),xy(549,630)]).
midline(r7, [xy(345,620),xy(139,620)]).
midline(r7, [xy(346,620),xy(540,620)]).
fillpoint(r7, xy(139,620), 10.0).
region(r6, '#870c25', 1500, centroid(564,534)).
perimeter(r6, 160).
polygon(r6, [xy(589,550),xy(540,550),xy(540,520),xy(589,520),xy(589,550)]).
midline(r6, [xy(560,535),xy(554,535)]).
midline(r6, [xy(561,535),xy(575,535)]).
fillpoint(r6, xy(554,535), 15.0).
region(r5, '#bebebe', 1000, centroid(564,510)).
perimeter(r5, 140).
polygon(r5, [xy(589,520),xy(540,520),xy(540,500),xy(589,500),xy(589,520)]).
midline(r5, [xy(559,510),xy(549,510)]).
midline(r5, [xy(560,510),xy(580,510)]).
fillpoint(r5, xy(549,510), 10.0).
region(r4, '#ffdc00', 400, centroid(477,342)).
perimeter(r4, 100).
polygon(r4, [xy(489,350),xy(460,350),xy(460,340),xy(479,340),xy(480,330),xy(489,330),xy(489,350)]).
midline(r4, [xy(464,345),xy(483,344),xy(485,334)]).
fillpoint(r4, xy(483,344), 6.0).
fillpoint(r4, xy(485,336), 5.0).
fillpoint(r4, xy(464,345), 5.0).
region(r8, '#7fdbff', 400, centroid(570,620)).
perimeter(r8, 80).
polygon(r8, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r8, [xy(569,619),xy(570,620)]).
fillpoint(r8, xy(569,620), 10.0).
region(r9, '#7fdbff', 400, centroid(600,620)).
perimeter(r9, 80).
polygon(r9, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r9, [xy(599,619),xy(600,620)]).
fillpoint(r9, xy(599,620), 10.0).
region(r10, '#7fdbff', 400, centroid(630,620)).
perimeter(r10, 80).
polygon(r10, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r10, [xy(629,619),xy(630,620)]).
fillpoint(r10, xy(629,620), 10.0).
border(r10).

adjacent(r1, r2).
shared_edge(r1, r2, 250).
adjacent(r1, r3).
shared_edge(r1, r3, 550).
adjacent(r1, r4).
shared_edge(r1, r4, 50).
adjacent(r1, r7).
shared_edge(r1, r7, 880).
adjacent(r1, r8).
shared_edge(r1, r8, 80).
adjacent(r1, r9).
shared_edge(r1, r9, 80).
adjacent(r1, r10).
shared_edge(r1, r10, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 610).
adjacent(r2, r4).
shared_edge(r2, r4, 50).
adjacent(r2, r5).
shared_edge(r2, r5, 20).
adjacent(r2, r6).
shared_edge(r2, r6, 30).
adjacent(r3, r5).
shared_edge(r3, r5, 70).
adjacent(r3, r6).
shared_edge(r3, r6, 80).
adjacent(r5, r6).
shared_edge(r5, r6, 50).

encloses(r1, r7).
encloses(r1, r8).
encloses(r1, r9).
