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
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(617,483),xy(607,501),xy(570,539),xy(554,541),xy(549,539),xy(522,540),xy(504,539),xy(480,534),xy(456,533),xy(420,525),xy(386,513),xy(380,513),xy(304,483),xy(206,429),xy(190,405),xy(186,403),xy(158,418),xy(156,417),xy(151,422),xy(129,433),xy(88,462),xy(29,520),xy(19,533),xy(14,550),xy(14,569),xy(17,580),xy(14,591),xy(14,609),xy(17,622),xy(30,625),xy(48,625),xy(59,622),xy(59,599),xy(39,579),xy(18,579)]).
midline(r1, [xy(555,542),xy(555,631),xy(549,635),xy(131,635),xy(124,633),xy(108,618),xy(102,622),xy(89,625),xy(60,623)]).
midline(r1, [xy(182,182),xy(179,235),xy(179,308),xy(181,346),xy(188,402)]).
midline(r1, [xy(184,182),xy(240,139),xy(291,191),xy(305,193),xy(308,196),xy(311,195),xy(311,197)]).
midline(r1, [xy(481,533),xy(485,525),xy(486,515),xy(489,512),xy(488,509),xy(490,509)]).
midline(r1, [xy(570,540),xy(586,556),xy(584,558),xy(585,632),xy(579,635),xy(555,633)]).
midline(r1, [xy(313,197),xy(320,197),xy(318,199)]).
midline(r1, [xy(322,199),xy(325,199),xy(324,201)]).
midline(r1, [xy(109,617),xy(110,602),xy(117,585),xy(143,555),xy(160,530),xy(176,496),xy(181,491),xy(179,489),xy(186,478),xy(185,475),xy(190,463),xy(195,457),xy(196,459),xy(192,463),xy(193,470),xy(191,472),xy(189,470)]).
midline(r1, [xy(188,473),xy(188,478),xy(185,481)]).
midline(r1, [xy(181,489),xy(183,489),xy(184,484)]).
midline(r1, [xy(197,458),xy(198,456),xy(196,454),xy(196,456)]).
midline(r1, [xy(196,453),xy(197,442),xy(201,438),xy(204,429)]).
midline(r1, [xy(198,447),xy(198,451)]).
midline(r1, [xy(176,500),xy(178,496)]).
midline(r1, [xy(194,468),xy(194,469)]).
midline(r1, [xy(189,476),xy(190,473)]).
midline(r1, [xy(587,557),xy(615,586),xy(615,632),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(174,504),xy(175,503)]).
midline(r1, [xy(217,432),xy(300,349),xy(298,347),xy(214,431)]).
midline(r1, [xy(184,487),xy(185,486)]).
midline(r1, [xy(241,138),xy(286,110),xy(316,96)]).
midline(r1, [xy(317,94),xy(327,90)]).
midline(r1, [xy(328,88),xy(362,73),xy(364,74)]).
midline(r1, [xy(365,72),xy(378,68)]).
midline(r1, [xy(379,66),xy(402,58),xy(430,88)]).
midline(r1, [xy(404,58),xy(416,56),xy(437,47),xy(468,40),xy(492,39),xy(493,44),xy(495,44)]).
midline(r1, [xy(494,39),xy(520,34),xy(604,35),xy(619,59)]).
midline(r1, [xy(198,454),xy(198,453)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(299,346),xy(304,344),xy(301,348)]).
midline(r1, [xy(306,344),xy(317,340),xy(318,343),xy(321,341),xy(319,340)]).
midline(r1, [xy(321,339),xy(322,341)]).
midline(r1, [xy(432,501),xy(431,502)]).
midline(r1, [xy(452,479),xy(433,500),xy(455,478)]).
midline(r1, [xy(331,202),xy(328,200),xy(328,202)]).
midline(r1, [xy(334,202),xy(332,203),xy(335,203),xy(335,205)]).
midline(r1, [xy(340,332),xy(328,338),xy(326,337),xy(324,339),xy(327,339)]).
midline(r1, [xy(341,331),xy(341,333)]).
fillpoint(r1, xy(188,402), 189.0).
fillpoint(r1, xy(187,394), 188.0).
fillpoint(r1, xy(186,385), 187.0).
fillpoint(r1, xy(185,374), 186.0).
fillpoint(r1, xy(184,367), 185.0).
fillpoint(r1, xy(183,361), 184.0).
fillpoint(r1, xy(201,422), 183.9).
fillpoint(r1, xy(203,425), 183.3).
fillpoint(r1, xy(183,183), 183.1).
fillpoint(r1, xy(182,186), 183.0).
fillpoint(r1, xy(182,353), 183.0).
fillpoint(r1, xy(181,196), 182.0).
fillpoint(r1, xy(181,344), 182.0).
fillpoint(r1, xy(180,208), 181.0).
fillpoint(r1, xy(180,331), 181.0).
fillpoint(r1, xy(179,270), 180.0).
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
border(r1).
region(r3, '#2ecc40', 54300, centroid(496,285)).
perimeter(r3, 1860).
polygon(r3, [xy(539,470),xy(520,470),xy(519,460),xy(490,460),xy(489,450),xy(460,450),xy(460,440),xy(450,440),xy(449,430),xy(430,430),xy(430,420),xy(420,420),xy(420,410),xy(410,410),xy(409,400),xy(400,399),xy(400,380),xy(390,379),xy(390,350),xy(370,349),xy(370,310),xy(360,309),xy(360,230),xy(370,229),xy(370,190),xy(380,189),xy(380,170),xy(390,170),xy(390,200),xy(439,200),xy(440,349),xy(489,350),xy(490,80),xy(499,80),xy(500,90),xy(529,90),xy(530,70),xy(589,70),xy(590,249),xy(540,250),xy(540,299),xy(590,300),xy(590,449),xy(540,450),xy(539,470)]).
hole(r3, [xy(570,189),xy(570,180),xy(579,180),xy(580,170),xy(570,170),xy(569,160),xy(560,160),xy(560,169),xy(550,170),xy(550,179),xy(559,180),xy(560,190),xy(570,189)]).
midline(r3, [xy(558,103),xy(551,121),xy(531,131),xy(499,99),xy(495,93),xy(495,84)]).
midline(r3, [xy(530,132),xy(521,155),xy(519,171),xy(521,194),xy(529,210)]).
midline(r3, [xy(552,122),xy(575,146),xy(579,154),xy(579,160),xy(584,166),xy(585,177),xy(575,203),xy(560,219),xy(545,218),xy(529,212),xy(516,236),xy(514,250),xy(514,298),xy(516,313),xy(523,329),xy(540,349),xy(537,373),xy(531,391),xy(515,400),xy(495,399),xy(493,401),xy(474,393),xy(450,388),xy(427,376),xy(415,359),xy(413,336),xy(406,320),xy(403,318),xy(405,310),xy(402,290),xy(399,283),xy(396,281),xy(393,284),xy(397,284)]).
midline(r3, [xy(495,401),xy(493,403),xy(491,401),xy(488,404),xy(489,407),xy(477,429),xy(480,428)]).
midline(r3, [xy(490,406),xy(492,404)]).
midline(r3, [xy(515,401),xy(514,426),xy(525,445),xy(530,460)]).
midline(r3, [xy(399,282),xy(400,258),xy(390,252),xy(392,256)]).
midline(r3, [xy(399,256),xy(404,234),xy(384,213),xy(380,205),xy(379,199),xy(385,189),xy(385,174)]).
fillpoint(r3, xy(531,391), 59.0).
fillpoint(r3, xy(532,388), 58.0).
fillpoint(r3, xy(536,376), 54.0).
fillpoint(r3, xy(537,372), 53.0).
fillpoint(r3, xy(538,368), 52.0).
fillpoint(r3, xy(539,361), 51.0).
fillpoint(r3, xy(476,394), 45.0).
fillpoint(r3, xy(473,393), 44.0).
fillpoint(r3, xy(465,391), 42.0).
fillpoint(r3, xy(531,130), 41.0).
fillpoint(r3, xy(459,390), 41.0).
fillpoint(r3, xy(399,270), 40.0).
fillpoint(r3, xy(550,122), 39.1).
fillpoint(r3, xy(539,127), 39.1).
fillpoint(r3, xy(528,212), 39.0).
fillpoint(r3, xy(548,123), 38.9).
fillpoint(r3, xy(541,126), 38.9).
fillpoint(r3, xy(546,124), 38.6).
fillpoint(r3, xy(543,125), 38.6).
fillpoint(r3, xy(402,248), 38.0).
fillpoint(r3, xy(402,291), 38.0).
fillpoint(r3, xy(403,244), 37.0).
fillpoint(r3, xy(403,295), 37.0).
fillpoint(r3, xy(404,239), 36.0).
fillpoint(r3, xy(404,301), 36.0).
fillpoint(r3, xy(404,315), 35.0).
fillpoint(r3, xy(437,382), 33.1).
fillpoint(r3, xy(558,103), 32.0).
fillpoint(r3, xy(521,156), 32.0).
fillpoint(r3, xy(521,193), 32.0).
fillpoint(r3, xy(546,218), 32.0).
fillpoint(r3, xy(520,162), 31.0).
fillpoint(r3, xy(520,188), 31.0).
fillpoint(r3, xy(552,219), 31.0).
fillpoint(r3, xy(430,378), 30.4).
fillpoint(r3, xy(519,175), 30.0).
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
midline(r4, [xy(614,111),xy(615,434),xy(590,459),xy(549,460)]).
midline(r4, [xy(615,110),xy(615,105),xy(596,85),xy(595,74)]).
fillpoint(r4, xy(614,270), 25.0).
fillpoint(r4, xy(549,460), 10.0).
fillpoint(r4, xy(590,459), 10.0).
border(r4).
region(r5, '#ffdc00', 14200, centroid(459,211)).
perimeter(r5, 740).
polygon(r5, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,160),xy(399,160),xy(400,150),xy(439,150),xy(440,110),xy(449,110),xy(450,100),xy(459,100),xy(460,90),xy(479,90),xy(480,80),xy(490,80),xy(489,350)]).
midline(r5, [xy(469,318),xy(469,292),xy(463,280),xy(465,273),xy(465,190),xy(462,173),xy(459,169),xy(419,170),xy(417,168),xy(404,175)]).
midline(r5, [xy(470,319),xy(470,330)]).
midline(r5, [xy(460,169),xy(464,158),xy(465,133),xy(463,129),xy(458,126),xy(458,128)]).
midline(r5, [xy(464,129),xy(474,104),xy(484,93),xy(485,84)]).
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
region(r19, '#2ecc40', 4400, centroid(240,620)).
perimeter(r19, 480).
polygon(r19, [xy(349,630),xy(130,630),xy(130,610),xy(349,610),xy(349,630)]).
midline(r19, [xy(279,620),xy(139,620)]).
midline(r19, [xy(280,619),xy(340,620)]).
fillpoint(r19, xy(139,620), 10.0).
region(r20, '#5a5a5a', 4000, centroid(450,620)).
perimeter(r20, 440).
polygon(r20, [xy(549,630),xy(350,630),xy(350,610),xy(549,610),xy(549,630)]).
midline(r20, [xy(510,620),xy(359,620)]).
midline(r20, [xy(511,620),xy(540,620)]).
fillpoint(r20, xy(359,620), 10.0).
region(r17, '#7fdbff', 2000, centroid(64,576)).
perimeter(r17, 240).
polygon(r17, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r17, [xy(51,560),xy(39,560)]).
midline(r17, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r17, xy(58,561), 12.0).
fillpoint(r17, xy(61,578), 12.0).
fillpoint(r17, xy(78,581), 12.0).
fillpoint(r17, xy(54,560), 11.0).
fillpoint(r17, xy(59,565), 11.0).
fillpoint(r17, xy(60,574), 11.0).
fillpoint(r17, xy(65,579), 11.0).
fillpoint(r17, xy(74,580), 11.0).
fillpoint(r17, xy(79,585), 11.0).
fillpoint(r17, xy(39,560), 10.0).
fillpoint(r17, xy(79,596), 10.0).
region(r12, '#870c25', 1500, centroid(564,284)).
perimeter(r12, 160).
polygon(r12, [xy(589,300),xy(540,300),xy(540,270),xy(589,270),xy(589,300)]).
midline(r12, [xy(573,285),xy(554,285)]).
midline(r12, [xy(574,285),xy(575,285)]).
fillpoint(r12, xy(554,285), 15.0).
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
region(r11, '#bebebe', 1000, centroid(564,260)).
perimeter(r11, 140).
polygon(r11, [xy(589,270),xy(540,270),xy(540,250),xy(589,250),xy(589,270)]).
midline(r11, [xy(570,260),xy(549,260)]).
midline(r11, [xy(571,259),xy(580,260)]).
fillpoint(r11, xy(549,260), 10.0).
region(r10, '#0074d9', 500, centroid(414,194)).
perimeter(r10, 120).
polygon(r10, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r10, [xy(411,194),xy(394,195)]).
midline(r10, [xy(412,195),xy(435,195)]).
fillpoint(r10, xy(394,195), 5.0).
region(r13, '#0074d9', 500, centroid(444,324)).
perimeter(r13, 120).
polygon(r13, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r13, [xy(445,311),xy(445,304)]).
midline(r13, [xy(444,312),xy(445,345)]).
fillpoint(r13, xy(444,325), 5.0).
region(r2, '#5a5a5a', 400, centroid(517,82)).
perimeter(r2, 100).
polygon(r2, [xy(529,90),xy(500,90),xy(500,80),xy(519,80),xy(520,70),xy(529,70),xy(529,90)]).
midline(r2, [xy(505,84),xy(504,85)]).
midline(r2, [xy(506,85),xy(523,84),xy(525,74)]).
fillpoint(r2, xy(523,84), 6.0).
fillpoint(r2, xy(525,76), 5.0).
fillpoint(r2, xy(504,85), 5.0).
region(r18, '#7fdbff', 400, centroid(40,600)).
perimeter(r18, 80).
polygon(r18, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r18, [xy(39,599),xy(40,600)]).
fillpoint(r18, xy(39,600), 10.0).
region(r21, '#7fdbff', 400, centroid(570,620)).
perimeter(r21, 80).
polygon(r21, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r21, [xy(569,619),xy(570,620)]).
fillpoint(r21, xy(569,620), 10.0).
region(r22, '#7fdbff', 400, centroid(600,620)).
perimeter(r22, 80).
polygon(r22, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r22, [xy(599,619),xy(600,620)]).
fillpoint(r22, xy(599,620), 10.0).
region(r23, '#2ecc40', 400, centroid(630,620)).
perimeter(r23, 80).
polygon(r23, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r23, [xy(629,619),xy(630,620)]).
fillpoint(r23, xy(629,620), 10.0).
border(r23).

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
adjacent(r1, r17).
shared_edge(r1, r17, 240).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 460).
adjacent(r1, r20).
shared_edge(r1, r20, 420).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 60).
adjacent(r3, r4).
shared_edge(r3, r4, 400).
adjacent(r3, r5).
shared_edge(r3, r5, 430).
adjacent(r3, r10).
shared_edge(r3, r10, 60).
adjacent(r3, r11).
shared_edge(r3, r11, 70).
adjacent(r3, r12).
shared_edge(r3, r12, 80).
adjacent(r3, r13).
shared_edge(r3, r13, 60).
adjacent(r4, r11).
shared_edge(r4, r11, 20).
adjacent(r4, r12).
shared_edge(r4, r12, 30).
adjacent(r5, r6).
shared_edge(r5, r6, 80).
adjacent(r5, r10).
shared_edge(r5, r10, 60).
adjacent(r5, r13).
shared_edge(r5, r13, 60).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r19, r20).
shared_edge(r19, r20, 20).

encloses(r1, r17).
encloses(r1, r18).
encloses(r1, r21).
encloses(r1, r22).
