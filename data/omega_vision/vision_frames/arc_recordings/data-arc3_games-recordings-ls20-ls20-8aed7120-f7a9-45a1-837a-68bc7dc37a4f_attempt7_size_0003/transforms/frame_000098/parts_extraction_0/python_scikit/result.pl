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

region(r1, '#aaaaaa', 328400, centroid(279,277)).
perimeter(r1, 4540).
polygon(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(639,330),xy(600,330),xy(599,320),xy(520,320),xy(519,330),xy(480,330),xy(479,340),xy(460,340),xy(460,349),xy(450,350),xy(449,360),xy(430,360),xy(430,369),xy(420,370),xy(420,379),xy(410,380),xy(409,390),xy(400,390),xy(400,409),xy(390,410),xy(390,419),xy(380,420),xy(380,439),xy(370,440),xy(370,479),xy(360,480),xy(360,559),xy(370,560),xy(370,600),xy(639,600)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(429,635),xy(130,635),xy(120,630),xy(108,618),xy(102,622),xy(89,625),xy(51,625),xy(37,622),xy(27,616),xy(17,602),xy(14,588),xy(14,553),xy(19,533),xy(29,520),xy(103,446),xy(136,419),xy(135,422)]).
midline(r1, [xy(138,419),xy(156,406),xy(156,408)]).
midline(r1, [xy(158,406),xy(188,388),xy(203,317),xy(225,246),xy(231,231),xy(246,226)]).
midline(r1, [xy(198,347),xy(293,442),xy(295,441),xy(199,343)]).
midline(r1, [xy(430,635),xy(549,635),xy(555,632),xy(555,607),xy(553,605),xy(366,604),xy(340,580),xy(330,576),xy(310,560),xy(210,460),xy(188,501),xy(172,524),xy(161,538),xy(119,580),xy(82,580),xy(59,560),xy(60,492)]).
midline(r1, [xy(109,617),xy(111,598),xy(119,581)]).
midline(r1, [xy(200,340),xy(301,441),xy(297,441),xy(201,345)]).
midline(r1, [xy(302,441),xy(307,443),xy(304,445),xy(300,443)]).
midline(r1, [xy(308,444),xy(311,447)]).
midline(r1, [xy(313,445),xy(315,443),xy(318,446),xy(316,448),xy(313,447)]).
midline(r1, [xy(317,448),xy(327,452),xy(328,449),xy(321,445),xy(319,447)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,632),xy(585,607),xy(583,605),xy(563,604),xy(555,606)]).
midline(r1, [xy(188,390),xy(200,419),xy(210,459)]).
midline(r1, [xy(585,606),xy(590,604),xy(609,604),xy(613,605),xy(615,609),xy(615,631),xy(613,634),xy(590,635),xy(585,633)]).
midline(r1, [xy(615,606),xy(620,604),xy(635,605)]).
midline(r1, [xy(330,450),xy(329,452)]).
midline(r1, [xy(247,224),xy(296,204),xy(298,205)]).
midline(r1, [xy(299,203),xy(366,182),xy(403,173),xy(476,163),xy(478,161),xy(502,182),xy(600,280),xy(612,295),xy(619,309)]).
midline(r1, [xy(403,175),xy(481,253),xy(480,256),xy(400,176)]).
midline(r1, [xy(397,177),xy(480,260),xy(483,257)]).
midline(r1, [xy(483,259),xy(481,261),xy(483,266),xy(485,266)]).
midline(r1, [xy(485,268),xy(483,270),xy(392,178)]).
midline(r1, [xy(485,270),xy(487,272),xy(486,275),xy(483,271)]).
midline(r1, [xy(488,275),xy(486,276)]).
midline(r1, [xy(489,277),xy(487,279),xy(490,280),xy(488,284),xy(491,283)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(334,454),xy(332,452),xy(332,454)]).
midline(r1, [xy(333,451),xy(335,453)]).
midline(r1, [xy(490,286),xy(491,287)]).
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
fillpoint(r1, xy(357,185), 186.0).
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
midline(r3, [xy(399,522),xy(399,507),xy(406,486),xy(389,469),xy(380,455),xy(379,449),xy(384,443),xy(385,424)]).
midline(r3, [xy(407,485),xy(430,475),xy(465,475)]).
midline(r3, [xy(400,523),xy(399,533),xy(406,563),xy(430,574),xy(587,575),xy(603,573),xy(611,569),xy(615,549),xy(615,500),xy(612,483),xy(606,474),xy(564,475)]).
midline(r3, [xy(608,474),xy(613,463),xy(615,448),xy(615,355),xy(596,335),xy(595,324)]).
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
midline(r2, [xy(413,427),xy(429,418),xy(422,408),xy(431,417),xy(440,410),xy(478,400),xy(479,393),xy(470,376),xy(472,376)]).
midline(r2, [xy(478,389),xy(481,393),xy(480,395)]).
midline(r2, [xy(480,400),xy(514,400),xy(530,392),xy(536,378),xy(548,361),xy(545,357),xy(549,360)]).
midline(r2, [xy(515,401),xy(515,499),xy(511,519),xy(499,524),xy(464,525)]).
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
region(r9, '#5a5a5a', 8400, centroid(340,620)).
perimeter(r9, 880).
polygon(r9, [xy(549,630),xy(130,630),xy(130,610),xy(549,610),xy(549,630)]).
midline(r9, [xy(304,619),xy(139,620)]).
midline(r9, [xy(305,620),xy(540,620)]).
fillpoint(r9, xy(139,620), 10.0).
region(r7, '#7fdbff', 2000, centroid(56,584)).
perimeter(r7, 240).
polygon(r7, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r7, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r7, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r7, xy(41,578), 12.0).
fillpoint(r7, xy(58,581), 12.0).
fillpoint(r7, xy(61,598), 12.0).
fillpoint(r7, xy(40,574), 11.0).
fillpoint(r7, xy(45,579), 11.0).
fillpoint(r7, xy(54,580), 11.0).
fillpoint(r7, xy(59,585), 11.0).
fillpoint(r7, xy(60,594), 11.0).
fillpoint(r7, xy(65,599), 11.0).
fillpoint(r7, xy(39,564), 10.0).
fillpoint(r7, xy(71,600), 10.0).
region(r6, '#870c25', 1500, centroid(564,534)).
perimeter(r6, 160).
polygon(r6, [xy(589,550),xy(540,550),xy(540,520),xy(589,520),xy(589,550)]).
midline(r6, [xy(560,535),xy(554,535)]).
midline(r6, [xy(561,534),xy(575,535)]).
fillpoint(r6, xy(554,535), 15.0).
region(r5, '#bebebe', 1000, centroid(564,510)).
perimeter(r5, 140).
polygon(r5, [xy(589,520),xy(540,520),xy(540,500),xy(589,500),xy(589,520)]).
midline(r5, [xy(559,510),xy(549,510)]).
midline(r5, [xy(560,509),xy(580,510)]).
fillpoint(r5, xy(549,510), 10.0).
region(r4, '#ffdc00', 400, centroid(477,342)).
perimeter(r4, 100).
polygon(r4, [xy(489,350),xy(460,350),xy(460,340),xy(479,340),xy(480,330),xy(489,330),xy(489,350)]).
midline(r4, [xy(465,344),xy(464,345)]).
midline(r4, [xy(466,344),xy(483,344),xy(485,334)]).
fillpoint(r4, xy(483,344), 6.0).
fillpoint(r4, xy(485,336), 5.0).
fillpoint(r4, xy(464,345), 5.0).
region(r8, '#7fdbff', 400, centroid(80,560)).
perimeter(r8, 80).
polygon(r8, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r8, [xy(79,559),xy(80,560)]).
fillpoint(r8, xy(79,560), 10.0).
region(r10, '#7fdbff', 400, centroid(570,620)).
perimeter(r10, 80).
polygon(r10, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r10, [xy(569,619),xy(570,620)]).
fillpoint(r10, xy(569,620), 10.0).
region(r11, '#7fdbff', 400, centroid(600,620)).
perimeter(r11, 80).
polygon(r11, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r11, [xy(599,619),xy(600,620)]).
fillpoint(r11, xy(599,620), 10.0).
region(r12, '#2ecc40', 400, centroid(630,620)).
perimeter(r12, 80).
polygon(r12, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r12, [xy(629,619),xy(630,620)]).
fillpoint(r12, xy(629,620), 10.0).
border(r12).

adjacent(r1, r2).
shared_edge(r1, r2, 250).
adjacent(r1, r3).
shared_edge(r1, r3, 550).
adjacent(r1, r4).
shared_edge(r1, r4, 50).
adjacent(r1, r7).
shared_edge(r1, r7, 240).
adjacent(r1, r8).
shared_edge(r1, r8, 80).
adjacent(r1, r9).
shared_edge(r1, r9, 880).
adjacent(r1, r10).
shared_edge(r1, r10, 80).
adjacent(r1, r11).
shared_edge(r1, r11, 80).
adjacent(r1, r12).
shared_edge(r1, r12, 60).
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
encloses(r1, r10).
encloses(r1, r11).
