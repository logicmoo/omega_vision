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

region(r1, '#aaaaaa', 303200, centroid(259,324)).
perimeter(r1, 4560).
polygon(r1, [xy(639,80),xy(600,80),xy(599,70),xy(520,70),xy(519,80),xy(480,80),xy(479,90),xy(460,90),xy(460,99),xy(450,100),xy(449,110),xy(430,110),xy(430,119),xy(420,120),xy(420,129),xy(410,130),xy(410,139),xy(400,140),xy(400,159),xy(390,160),xy(390,169),xy(380,170),xy(380,189),xy(370,190),xy(370,229),xy(360,230),xy(360,309),xy(370,310),xy(370,349),xy(380,350),xy(380,369),xy(389,370),xy(390,379),xy(400,380),xy(400,399),xy(409,400),xy(410,409),xy(419,410),xy(420,419),xy(430,420),xy(430,430),xy(449,430),xy(450,439),xy(460,440),xy(460,450),xy(479,450),xy(480,460),xy(519,460),xy(520,470),xy(599,470),xy(600,460),xy(639,460)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(617,483),xy(607,501),xy(569,540),xy(504,539),xy(481,535),xy(478,532),xy(476,534),xy(450,532),xy(362,507),xy(304,483),xy(245,452),xy(218,434),xy(186,389),xy(149,411),xy(103,446),xy(29,520),xy(17,537),xy(14,550),xy(14,589),xy(17,602),xy(27,616),xy(37,622),xy(51,625),xy(96,624),xy(109,617),xy(111,598),xy(119,581),xy(115,579),xy(80,580),xy(59,559),xy(59,560)]).
midline(r1, [xy(182,182),xy(179,230),xy(179,309),xy(181,346),xy(187,388)]).
midline(r1, [xy(184,182),xy(242,138),xy(292,191),xy(240,141)]).
midline(r1, [xy(221,439),xy(202,477),xy(170,528),xy(119,579)]).
midline(r1, [xy(216,452),xy(214,454)]).
midline(r1, [xy(570,540),xy(585,555),xy(585,630),xy(583,634),xy(562,635),xy(554,632),xy(549,635),xy(131,635),xy(124,633),xy(109,619)]).
midline(r1, [xy(555,631),xy(554,542)]).
midline(r1, [xy(221,441),xy(220,442)]).
midline(r1, [xy(60,491),xy(60,558)]).
midline(r1, [xy(243,137),xy(286,110),xy(316,96)]).
midline(r1, [xy(317,94),xy(340,82),xy(362,73),xy(364,74)]).
midline(r1, [xy(365,72),xy(378,68)]).
midline(r1, [xy(215,428),xy(296,347),xy(301,345),xy(304,348),xy(305,346),xy(303,345)]).
midline(r1, [xy(305,344),xy(314,341),xy(315,344),xy(309,349),xy(306,348),xy(220,434)]).
midline(r1, [xy(308,350),xy(222,436)]).
midline(r1, [xy(314,347),xy(319,343),xy(316,342)]).
midline(r1, [xy(319,341),xy(325,339),xy(320,344)]).
midline(r1, [xy(293,192),xy(301,190),xy(247,136)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,632),xy(608,635),xy(585,633)]).
midline(r1, [xy(379,66),xy(397,59),xy(416,56),xy(430,49),xy(463,41),xy(493,40),xy(504,36),xy(522,34),xy(604,35),xy(619,59)]).
midline(r1, [xy(326,338),xy(330,336),xy(330,338)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(300,193),xy(302,191),xy(304,194),xy(305,191),xy(310,190),xy(254,132),xy(311,191)]).
midline(r1, [xy(305,194),xy(315,197),xy(317,195),xy(313,191)]).
midline(r1, [xy(318,196),xy(321,197),xy(319,199),xy(316,198)]).
midline(r1, [xy(322,197),xy(324,198),xy(320,200)]).
midline(r1, [xy(323,201),xy(325,199)]).
midline(r1, [xy(326,202),xy(327,201)]).
midline(r1, [xy(475,532),xy(486,519),xy(488,509),xy(493,500),xy(492,498),xy(496,492),xy(495,490),xy(500,484),xy(499,481),xy(501,479),xy(501,482)]).
midline(r1, [xy(485,523),xy(479,531),xy(484,528)]).
midline(r1, [xy(481,533),xy(482,532)]).
midline(r1, [xy(346,331),xy(343,330),xy(333,335),xy(333,337),xy(339,335),xy(339,337)]).
midline(r1, [xy(340,333),xy(341,336)]).
midline(r1, [xy(343,336),xy(345,334)]).
midline(r1, [xy(347,332),xy(346,329),xy(351,326),xy(349,330)]).
fillpoint(r1, xy(187,390), 187.5).
fillpoint(r1, xy(186,385), 187.0).
fillpoint(r1, xy(185,374), 186.0).
fillpoint(r1, xy(184,367), 185.0).
fillpoint(r1, xy(183,361), 184.0).
fillpoint(r1, xy(183,183), 183.1).
fillpoint(r1, xy(182,186), 183.0).
fillpoint(r1, xy(182,353), 183.0).
fillpoint(r1, xy(181,196), 182.0).
fillpoint(r1, xy(181,344), 182.0).
fillpoint(r1, xy(180,208), 181.0).
fillpoint(r1, xy(180,331), 181.0).
fillpoint(r1, xy(179,270), 180.0).
fillpoint(r1, xy(214,428), 174.7).
fillpoint(r1, xy(217,432), 174.1).
fillpoint(r1, xy(219,435), 173.6).
fillpoint(r1, xy(331,494), 116.0).
fillpoint(r1, xy(371,510), 100.0).
fillpoint(r1, xy(381,513), 97.0).
fillpoint(r1, xy(385,514), 96.0).
fillpoint(r1, xy(389,515), 95.0).
fillpoint(r1, xy(394,516), 94.0).
fillpoint(r1, xy(414,523), 87.0).
fillpoint(r1, xy(421,525), 85.0).
fillpoint(r1, xy(426,526), 84.0).
fillpoint(r1, xy(431,527), 83.0).
fillpoint(r1, xy(439,529), 81.0).
fillpoint(r1, xy(443,530), 80.0).
fillpoint(r1, xy(447,531), 79.0).
fillpoint(r1, xy(452,532), 78.0).
fillpoint(r1, xy(458,533), 77.0).
fillpoint(r1, xy(466,534), 76.0).
fillpoint(r1, xy(482,535), 75.0).
fillpoint(r1, xy(488,536), 74.0).
fillpoint(r1, xy(493,537), 73.0).
fillpoint(r1, xy(499,538), 72.0).
fillpoint(r1, xy(507,539), 71.0).
fillpoint(r1, xy(555,540), 70.2).
fillpoint(r1, xy(521,540), 70.0).
fillpoint(r1, xy(561,540), 70.0).
fillpoint(r1, xy(392,61), 62.0).
fillpoint(r1, xy(395,60), 61.0).
fillpoint(r1, xy(398,59), 60.0).
fillpoint(r1, xy(402,58), 59.0).
fillpoint(r1, xy(406,57), 58.0).
fillpoint(r1, xy(411,56), 57.0).
fillpoint(r1, xy(431,49), 50.0).
fillpoint(r1, xy(438,47), 48.0).
fillpoint(r1, xy(443,46), 47.0).
border(r1).
region(r3, '#2ecc40', 54800, centroid(496,284)).
perimeter(r3, 1740).
polygon(r3, [xy(539,470),xy(520,470),xy(519,460),xy(490,460),xy(489,450),xy(460,450),xy(460,440),xy(450,440),xy(449,430),xy(430,430),xy(430,420),xy(420,420),xy(420,410),xy(410,410),xy(409,400),xy(400,399),xy(400,380),xy(390,379),xy(390,350),xy(370,349),xy(370,310),xy(360,309),xy(360,230),xy(370,229),xy(370,190),xy(380,189),xy(380,170),xy(390,170),xy(390,200),xy(439,200),xy(440,349),xy(489,350),xy(490,80),xy(499,80),xy(500,90),xy(529,90),xy(530,70),xy(589,70),xy(590,249),xy(540,250),xy(540,299),xy(590,300),xy(590,449),xy(540,450),xy(539,470)]).
midline(r3, [xy(560,99),xy(549,125),xy(538,138),xy(499,99),xy(495,93),xy(495,84)]).
midline(r3, [xy(540,139),xy(540,200),xy(522,222),xy(516,236),xy(514,252),xy(514,299),xy(516,313),xy(523,329),xy(540,349),xy(539,363),xy(532,389),xy(515,400),xy(489,400),xy(474,393),xy(450,388),xy(426,375),xy(422,381),xy(426,377)]).
midline(r3, [xy(514,401),xy(515,427),xy(527,449),xy(530,460)]).
midline(r3, [xy(498,401),xy(496,403)]).
midline(r3, [xy(428,375),xy(416,359),xy(413,358),xy(411,360),xy(413,360)]).
midline(r3, [xy(415,357),xy(413,336),xy(404,318),xy(404,299),xy(400,283),xy(396,282),xy(388,286),xy(388,288)]).
midline(r3, [xy(396,284),xy(397,284)]).
midline(r3, [xy(400,281),xy(400,258),xy(395,254),xy(397,258)]).
midline(r3, [xy(400,256),xy(404,234),xy(384,213),xy(380,205),xy(379,199),xy(385,189),xy(385,174)]).
fillpoint(r3, xy(531,391), 59.0).
fillpoint(r3, xy(532,388), 58.0).
fillpoint(r3, xy(536,376), 54.0).
fillpoint(r3, xy(537,372), 53.0).
fillpoint(r3, xy(538,368), 52.0).
fillpoint(r3, xy(539,361), 51.0).
fillpoint(r3, xy(540,169), 50.0).
fillpoint(r3, xy(476,394), 45.0).
fillpoint(r3, xy(473,393), 44.0).
fillpoint(r3, xy(465,391), 42.0).
fillpoint(r3, xy(459,390), 41.0).
fillpoint(r3, xy(399,270), 40.0).
fillpoint(r3, xy(402,248), 38.0).
fillpoint(r3, xy(402,291), 38.0).
fillpoint(r3, xy(403,244), 37.0).
fillpoint(r3, xy(403,295), 37.0).
fillpoint(r3, xy(404,239), 36.0).
fillpoint(r3, xy(404,301), 36.0).
fillpoint(r3, xy(404,315), 35.0).
fillpoint(r3, xy(437,382), 33.1).
fillpoint(r3, xy(558,103), 32.0).
fillpoint(r3, xy(430,378), 30.4).
fillpoint(r3, xy(518,231), 29.0).
fillpoint(r3, xy(518,318), 29.0).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(517,234), 28.0).
fillpoint(r3, xy(517,315), 28.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(516,237), 27.0).
fillpoint(r3, xy(516,312), 27.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,360), 26.2).
fillpoint(r3, xy(515,242), 26.0).
fillpoint(r3, xy(515,308), 26.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(419,364), 25.6).
fillpoint(r3, xy(420,365), 25.6).
fillpoint(r3, xy(514,275), 25.0).
region(r4, '#ffdc00', 20200, centroid(612,279)).
perimeter(r4, 1000).
polygon(r4, [xy(639,460),xy(600,460),xy(599,470),xy(540,469),xy(540,450),xy(590,449),xy(590,70),xy(599,70),xy(600,80),xy(639,80)]).
midline(r4, [xy(614,111),xy(614,104),xy(596,85),xy(595,74)]).
midline(r4, [xy(614,112),xy(615,433),xy(590,459),xy(549,460)]).
fillpoint(r4, xy(614,270), 25.0).
fillpoint(r4, xy(549,460), 10.0).
fillpoint(r4, xy(590,459), 10.0).
border(r4).
region(r5, '#ffdc00', 14200, centroid(459,211)).
perimeter(r5, 740).
polygon(r5, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,160),xy(399,160),xy(400,150),xy(439,150),xy(440,110),xy(449,110),xy(450,100),xy(459,100),xy(460,90),xy(479,90),xy(480,80),xy(490,80),xy(489,350)]).
midline(r5, [xy(469,318),xy(469,292),xy(464,280),xy(465,190),xy(462,173),xy(459,169),xy(420,170),xy(417,167),xy(416,170),xy(404,175)]).
midline(r5, [xy(469,319),xy(470,330)]).
midline(r5, [xy(461,169),xy(465,148),xy(465,133),xy(463,130),xy(474,104),xy(484,93),xy(485,84)]).
fillpoint(r5, xy(460,170), 29.0).
fillpoint(r5, xy(462,165), 28.0).
fillpoint(r5, xy(462,174), 28.0).
fillpoint(r5, xy(463,162), 27.0).
fillpoint(r5, xy(463,177), 27.0).
fillpoint(r5, xy(464,158), 26.0).
fillpoint(r5, xy(464,182), 26.0).
fillpoint(r5, xy(464,139), 25.0).
fillpoint(r5, xy(464,236), 25.0).
fillpoint(r5, xy(469,293), 21.0).
fillpoint(r5, xy(416,170), 20.0).
fillpoint(r5, xy(469,316), 20.0).
fillpoint(r5, xy(474,105), 16.0).
fillpoint(r5, xy(405,174), 16.0).
region(r16, '#2ecc40', 5200, centroid(260,620)).
perimeter(r16, 560).
polygon(r16, [xy(389,630),xy(130,630),xy(130,610),xy(389,610),xy(389,630)]).
midline(r16, [xy(279,620),xy(139,620)]).
midline(r16, [xy(280,619),xy(380,620)]).
fillpoint(r16, xy(139,620), 10.0).
region(r17, '#5a5a5a', 3200, centroid(470,620)).
perimeter(r17, 360).
polygon(r17, [xy(549,630),xy(390,630),xy(390,610),xy(549,610),xy(549,630)]).
midline(r17, [xy(444,620),xy(399,620)]).
midline(r17, [xy(445,619),xy(540,620)]).
fillpoint(r17, xy(399,620), 10.0).
region(r14, '#7fdbff', 2000, centroid(56,584)).
perimeter(r14, 240).
polygon(r14, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r14, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r14, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r14, xy(41,578), 12.0).
fillpoint(r14, xy(58,581), 12.0).
fillpoint(r14, xy(61,598), 12.0).
fillpoint(r14, xy(40,574), 11.0).
fillpoint(r14, xy(45,579), 11.0).
fillpoint(r14, xy(54,580), 11.0).
fillpoint(r14, xy(59,585), 11.0).
fillpoint(r14, xy(60,594), 11.0).
fillpoint(r14, xy(65,599), 11.0).
fillpoint(r14, xy(39,564), 10.0).
fillpoint(r14, xy(71,600), 10.0).
region(r9, '#870c25', 1500, centroid(564,284)).
perimeter(r9, 160).
polygon(r9, [xy(589,300),xy(540,300),xy(540,270),xy(589,270),xy(589,300)]).
midline(r9, [xy(566,284),xy(554,285)]).
midline(r9, [xy(567,285),xy(575,285)]).
fillpoint(r9, xy(554,285), 15.0).
region(r6, '#2ecc40', 1000, centroid(424,134)).
perimeter(r6, 160).
polygon(r6, [xy(439,150),xy(400,149),xy(400,140),xy(409,140),xy(410,130),xy(419,130),xy(420,120),xy(429,120),xy(430,110),xy(440,110),xy(439,150)]).
midline(r6, [xy(423,139),xy(419,139),xy(413,144),xy(404,145)]).
midline(r6, [xy(424,139),xy(429,135),xy(429,129),xy(434,123),xy(435,114)]).
fillpoint(r6, xy(427,138), 12.0).
fillpoint(r6, xy(429,134), 11.0).
fillpoint(r6, xy(424,139), 11.0).
fillpoint(r6, xy(435,116), 5.0).
fillpoint(r6, xy(404,145), 5.0).
region(r8, '#bebebe', 1000, centroid(564,260)).
perimeter(r8, 140).
polygon(r8, [xy(589,270),xy(540,270),xy(540,250),xy(589,250),xy(589,270)]).
midline(r8, [xy(570,260),xy(549,260)]).
midline(r8, [xy(571,260),xy(580,260)]).
fillpoint(r8, xy(549,260), 10.0).
region(r7, '#0074d9', 500, centroid(414,194)).
perimeter(r7, 120).
polygon(r7, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r7, [xy(426,195),xy(394,195)]).
midline(r7, [xy(427,195),xy(435,195)]).
fillpoint(r7, xy(394,195), 5.0).
region(r10, '#0074d9', 500, centroid(444,324)).
perimeter(r10, 120).
polygon(r10, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r10, [xy(445,311),xy(445,304)]).
midline(r10, [xy(445,312),xy(445,345)]).
fillpoint(r10, xy(444,325), 5.0).
region(r2, '#5a5a5a', 400, centroid(517,82)).
perimeter(r2, 100).
polygon(r2, [xy(529,90),xy(500,90),xy(500,80),xy(519,80),xy(520,70),xy(529,70),xy(529,90)]).
midline(r2, [xy(511,85),xy(504,85)]).
midline(r2, [xy(512,84),xy(523,84),xy(525,74)]).
fillpoint(r2, xy(523,84), 6.0).
fillpoint(r2, xy(525,76), 5.0).
fillpoint(r2, xy(504,85), 5.0).
region(r15, '#7fdbff', 400, centroid(80,560)).
perimeter(r15, 80).
polygon(r15, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r15, [xy(79,559),xy(80,560)]).
fillpoint(r15, xy(79,560), 10.0).
region(r18, '#7fdbff', 400, centroid(570,620)).
perimeter(r18, 80).
polygon(r18, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r18, [xy(569,619),xy(570,620)]).
fillpoint(r18, xy(569,620), 10.0).
region(r19, '#7fdbff', 400, centroid(600,620)).
perimeter(r19, 80).
polygon(r19, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r19, [xy(599,619),xy(600,620)]).
fillpoint(r19, xy(599,620), 10.0).
region(r20, '#2ecc40', 400, centroid(630,620)).
perimeter(r20, 80).
polygon(r20, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r20, [xy(629,619),xy(630,620)]).
fillpoint(r20, xy(629,620), 10.0).
border(r20).

adjacent(r1, r2).
shared_edge(r1, r2, 40).
adjacent(r1, r3).
shared_edge(r1, r3, 530).
adjacent(r1, r4).
shared_edge(r1, r4, 170).
adjacent(r1, r5).
shared_edge(r1, r5, 110).
adjacent(r1, r6).
shared_edge(r1, r6, 80).
adjacent(r1, r14).
shared_edge(r1, r14, 240).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 540).
adjacent(r1, r17).
shared_edge(r1, r17, 340).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 60).
adjacent(r3, r4).
shared_edge(r3, r4, 400).
adjacent(r3, r5).
shared_edge(r3, r5, 430).
adjacent(r3, r7).
shared_edge(r3, r7, 60).
adjacent(r3, r8).
shared_edge(r3, r8, 70).
adjacent(r3, r9).
shared_edge(r3, r9, 80).
adjacent(r3, r10).
shared_edge(r3, r10, 60).
adjacent(r4, r8).
shared_edge(r4, r8, 20).
adjacent(r4, r9).
shared_edge(r4, r9, 30).
adjacent(r5, r6).
shared_edge(r5, r6, 80).
adjacent(r5, r7).
shared_edge(r5, r7, 60).
adjacent(r5, r10).
shared_edge(r5, r10, 60).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r16, r17).
shared_edge(r16, r17, 20).

encloses(r1, r14).
encloses(r1, r15).
encloses(r1, r18).
encloses(r1, r19).
