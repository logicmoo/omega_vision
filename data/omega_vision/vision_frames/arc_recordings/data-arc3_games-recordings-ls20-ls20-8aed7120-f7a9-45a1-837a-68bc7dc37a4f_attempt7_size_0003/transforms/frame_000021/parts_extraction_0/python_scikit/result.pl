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

region(r1, '#aaaaaa', 288600, centroid(253,310)).
perimeter(r1, 4460).
polygon(r1, [xy(639,160),xy(620,160),xy(620,150),xy(610,150),xy(609,140),xy(590,140),xy(589,130),xy(550,130),xy(549,120),xy(470,120),xy(469,130),xy(430,130),xy(429,140),xy(410,140),xy(410,149),xy(400,150),xy(399,160),xy(380,160),xy(380,169),xy(370,170),xy(370,179),xy(360,180),xy(359,190),xy(350,190),xy(350,209),xy(340,210),xy(340,219),xy(330,220),xy(330,239),xy(320,240),xy(320,279),xy(310,280),xy(310,359),xy(320,360),xy(320,399),xy(330,400),xy(330,419),xy(339,420),xy(340,429),xy(350,430),xy(350,449),xy(359,450),xy(360,459),xy(369,460),xy(370,469),xy(379,470),xy(380,480),xy(399,480),xy(400,489),xy(409,490),xy(410,500),xy(429,500),xy(430,510),xy(469,510),xy(470,520),xy(549,520),xy(550,510),xy(589,510),xy(590,500),xy(609,500),xy(610,490),xy(620,489),xy(620,480),xy(639,480)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(577,62),xy(545,59),xy(471,59),xy(455,60),xy(435,65),xy(414,65),xy(373,74),xy(349,83),xy(321,90),xy(263,114),xy(167,167)]).
midline(r1, [xy(167,169),xy(156,245),xy(154,280),xy(155,383),xy(163,446),xy(109,502),xy(90,528),xy(77,552),xy(70,569),xy(78,580),xy(78,584),xy(92,602),xy(119,629),xy(130,635),xy(547,635),xy(553,634),xy(555,631),xy(555,566),xy(553,564),xy(457,564),xy(440,559),xy(410,558),xy(377,550),xy(357,542),xy(332,536),xy(270,510),xy(220,483),xy(164,447)]).
midline(r1, [xy(438,558),xy(442,553),xy(441,550),xy(445,545),xy(447,536),xy(451,528),xy(453,528)]).
midline(r1, [xy(555,564),xy(572,562),xy(580,558),xy(577,553),xy(578,549),xy(568,532),xy(572,534)]).
midline(r1, [xy(174,165),xy(251,241),xy(176,164)]).
midline(r1, [xy(187,460),xy(248,397),xy(239,398),xy(181,456),xy(239,400),xy(184,459),xy(241,400)]).
midline(r1, [xy(244,399),xy(243,400)]).
midline(r1, [xy(253,241),xy(258,246)]).
midline(r1, [xy(576,545),xy(577,546)]).
midline(r1, [xy(435,66),xy(434,68),xy(436,68)]).
midline(r1, [xy(580,560),xy(585,561),xy(585,631),xy(583,634),xy(578,635),xy(555,633)]).
midline(r1, [xy(250,397),xy(255,394),xy(255,396)]).
midline(r1, [xy(268,507),xy(329,447),xy(270,508)]).
midline(r1, [xy(441,556),xy(440,558)]).
midline(r1, [xy(260,246),xy(264,245),xy(265,248),xy(280,253),xy(283,251),xy(282,254),xy(284,255),xy(285,252)]).
midline(r1, [xy(436,70),xy(435,73),xy(439,78),xy(437,82),xy(440,83),xy(440,86),xy(441,84)]).
midline(r1, [xy(437,73),xy(437,72)]).
midline(r1, [xy(442,86),xy(441,87)]).
midline(r1, [xy(577,64),xy(583,73),xy(577,86),xy(579,86)]).
midline(r1, [xy(584,74),xy(602,94),xy(611,112),xy(620,123),xy(630,150)]).
midline(r1, [xy(585,633),xy(590,635),xy(607,635),xy(615,632),xy(614,589),xy(616,586),xy(590,560),xy(586,560)]).
midline(r1, [xy(590,559),xy(602,545),xy(611,529),xy(612,526),xy(608,522),xy(613,525),xy(620,516),xy(630,489)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(581,82),xy(582,87),xy(578,91)]).
midline(r1, [xy(582,89),xy(580,91)]).
midline(r1, [xy(268,393),xy(266,392),xy(263,395),xy(259,393),xy(257,395),xy(259,395)]).
midline(r1, [xy(266,394),xy(265,395)]).
midline(r1, [xy(262,396),xy(259,397)]).
midline(r1, [xy(266,391),xy(270,389),xy(269,392)]).
midline(r1, [xy(347,532),xy(382,497),xy(350,531)]).
midline(r1, [xy(282,388),xy(273,388),xy(275,391),xy(278,390),xy(276,392)]).
midline(r1, [xy(279,389),xy(279,391)]).
midline(r1, [xy(297,380),xy(293,380),xy(283,385),xy(283,387)]).
midline(r1, [xy(291,384),xy(293,382)]).
midline(r1, [xy(287,254),xy(288,255)]).
fillpoint(r1, xy(168,168), 168.2).
fillpoint(r1, xy(167,170), 168.0).
fillpoint(r1, xy(166,175), 167.0).
fillpoint(r1, xy(165,180), 166.0).
fillpoint(r1, xy(164,186), 165.0).
fillpoint(r1, xy(163,192), 164.0).
fillpoint(r1, xy(163,446), 163.9).
fillpoint(r1, xy(162,199), 163.0).
fillpoint(r1, xy(162,441), 163.0).
fillpoint(r1, xy(161,207), 162.0).
fillpoint(r1, xy(161,432), 162.0).
fillpoint(r1, xy(160,219), 161.0).
fillpoint(r1, xy(160,421), 161.0).
fillpoint(r1, xy(159,227), 160.0).
fillpoint(r1, xy(159,413), 160.0).
fillpoint(r1, xy(158,233), 159.0).
fillpoint(r1, xy(158,407), 159.0).
fillpoint(r1, xy(157,239), 158.0).
fillpoint(r1, xy(157,400), 158.0).
fillpoint(r1, xy(156,248), 157.0).
fillpoint(r1, xy(156,392), 157.0).
fillpoint(r1, xy(155,260), 156.0).
fillpoint(r1, xy(155,380), 156.0).
fillpoint(r1, xy(154,320), 155.0).
fillpoint(r1, xy(334,86), 87.0).
fillpoint(r1, xy(301,523), 87.0).
fillpoint(r1, xy(341,84), 85.0).
fillpoint(r1, xy(346,83), 84.0).
fillpoint(r1, xy(361,78), 79.0).
fillpoint(r1, xy(364,77), 78.0).
fillpoint(r1, xy(367,76), 77.0).
fillpoint(r1, xy(374,74), 75.0).
fillpoint(r1, xy(378,73), 74.0).
fillpoint(r1, xy(383,72), 73.0).
fillpoint(r1, xy(388,71), 72.0).
fillpoint(r1, xy(392,70), 71.0).
fillpoint(r1, xy(342,539), 71.0).
fillpoint(r1, xy(395,69), 70.0).
fillpoint(r1, xy(345,540), 70.0).
fillpoint(r1, xy(399,68), 69.0).
fillpoint(r1, xy(349,541), 69.0).
fillpoint(r1, xy(404,67), 68.0).
fillpoint(r1, xy(354,542), 68.0).
fillpoint(r1, xy(410,66), 67.0).
fillpoint(r1, xy(359,543), 67.0).
fillpoint(r1, xy(417,65), 66.0).
fillpoint(r1, xy(437,64), 65.0).
fillpoint(r1, xy(576,63), 63.1).
fillpoint(r1, xy(445,62), 63.0).
fillpoint(r1, xy(574,62), 63.0).
fillpoint(r1, xy(450,61), 62.0).
fillpoint(r1, xy(569,61), 62.0).
fillpoint(r1, xy(372,548), 62.0).
fillpoint(r1, xy(458,60), 61.0).
fillpoint(r1, xy(562,60), 61.0).
fillpoint(r1, xy(375,549), 61.0).
fillpoint(r1, xy(471,60), 60.0).
fillpoint(r1, xy(378,550), 60.0).
fillpoint(r1, xy(382,551), 59.0).
fillpoint(r1, xy(386,552), 58.0).
fillpoint(r1, xy(391,553), 57.0).
fillpoint(r1, xy(403,556), 54.0).
fillpoint(r1, xy(407,557), 53.0).
fillpoint(r1, xy(412,558), 52.0).
fillpoint(r1, xy(418,559), 51.0).
fillpoint(r1, xy(585,560), 50.2).
fillpoint(r1, xy(431,560), 50.0).
fillpoint(r1, xy(578,560), 50.0).
fillpoint(r1, xy(448,562), 48.0).
fillpoint(r1, xy(571,562), 48.0).
fillpoint(r1, xy(453,563), 47.0).
fillpoint(r1, xy(566,563), 47.0).
fillpoint(r1, xy(459,564), 46.0).
fillpoint(r1, xy(559,564), 46.0).
fillpoint(r1, xy(561,564), 46.0).
fillpoint(r1, xy(471,565), 45.0).
border(r1).
region(r3, '#2ecc40', 64700, centroid(471,316)).
perimeter(r3, 2300).
polygon(r3, [xy(549,520),xy(470,520),xy(469,510),xy(440,510),xy(440,500),xy(490,499),xy(490,450),xy(390,450),xy(389,350),xy(340,350),xy(340,419),xy(330,420),xy(330,400),xy(320,399),xy(320,360),xy(310,359),xy(310,280),xy(320,279),xy(320,240),xy(330,239),xy(330,220),xy(339,220),xy(340,210),xy(350,209),xy(350,190),xy(359,190),xy(360,180),xy(369,180),xy(370,170),xy(379,170),xy(380,160),xy(390,160),xy(390,200),xy(440,200),xy(440,349),xy(540,349),xy(540,300),xy(490,299),xy(490,120),xy(549,120),xy(550,130),xy(590,130),xy(590,449),xy(540,450),xy(540,499),xy(589,500),xy(590,509),xy(550,510),xy(549,520)]).
hole(r3, [xy(570,189),xy(570,180),xy(579,180),xy(580,170),xy(570,170),xy(569,160),xy(560,160),xy(560,169),xy(550,170),xy(550,179),xy(559,180),xy(560,190),xy(570,189)]).
midline(r3, [xy(439,400),xy(427,385),xy(418,369),xy(415,359),xy(414,340),xy(406,320),xy(379,289),xy(351,308),xy(338,301),xy(336,302),xy(330,297),xy(330,299)]).
midline(r3, [xy(338,303),xy(337,303)]).
midline(r3, [xy(379,288),xy(380,275),xy(378,273),xy(360,266),xy(358,267),xy(340,257),xy(340,259)]).
midline(r3, [xy(349,308),xy(333,327),xy(324,345),xy(330,360),xy(329,390),xy(335,400),xy(335,415)]).
midline(r3, [xy(380,273),xy(380,266),xy(384,255),xy(379,249),xy(380,244),xy(369,207),xy(379,185),xy(379,179),xy(384,173),xy(385,164)]).
midline(r3, [xy(441,399),xy(503,400),xy(513,402),xy(514,404),xy(526,400),xy(539,400),xy(556,379),xy(563,363),xy(565,349),xy(564,290),xy(556,270),xy(539,250),xy(540,235),xy(531,220),xy(521,194),xy(519,179),xy(520,160),xy(522,152),xy(527,149),xy(540,150),xy(553,145),xy(568,144),xy(575,146),xy(579,154),xy(579,160),xy(585,170),xy(584,183),xy(579,189),xy(579,195),xy(575,203),xy(552,227),xy(541,235)]).
midline(r3, [xy(372,272),xy(373,273)]).
midline(r3, [xy(515,405),xy(514,495),xy(503,505),xy(489,510),xy(479,510),xy(475,506),xy(468,504),xy(444,505)]).
midline(r3, [xy(515,495),xy(526,505),xy(540,510),xy(550,504),xy(585,505)]).
fillpoint(r3, xy(379,289), 60.8).
fillpoint(r3, xy(380,275), 60.0).
fillpoint(r3, xy(381,267), 59.0).
fillpoint(r3, xy(382,263), 58.0).
fillpoint(r3, xy(383,258), 57.0).
fillpoint(r3, xy(515,403), 53.2).
fillpoint(r3, xy(512,402), 53.0).
fillpoint(r3, xy(517,402), 53.0).
fillpoint(r3, xy(508,401), 52.0).
fillpoint(r3, xy(522,401), 52.0).
fillpoint(r3, xy(501,400), 51.0).
fillpoint(r3, xy(528,400), 51.0).
fillpoint(r3, xy(539,243), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(522,152), 33.0).
fillpoint(r3, xy(521,156), 32.0).
fillpoint(r3, xy(521,193), 32.0).
fillpoint(r3, xy(520,162), 31.0).
fillpoint(r3, xy(520,188), 31.0).
fillpoint(r3, xy(519,175), 30.0).
fillpoint(r3, xy(561,281), 29.0).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(561,368), 29.0).
fillpoint(r3, xy(562,284), 28.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(562,365), 28.0).
fillpoint(r3, xy(563,287), 27.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(563,362), 27.0).
fillpoint(r3, xy(564,292), 26.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(564,358), 26.0).
fillpoint(r3, xy(564,325), 25.0).
fillpoint(r3, xy(515,473), 25.0).
fillpoint(r3, xy(554,145), 16.0).
fillpoint(r3, xy(374,195), 16.0).
fillpoint(r3, xy(325,344), 16.0).
fillpoint(r3, xy(574,145), 15.8).
region(r5, '#ffdc00', 19500, centroid(607,339)).
perimeter(r5, 920).
polygon(r5, [xy(639,480),xy(620,480),xy(620,489),xy(610,490),xy(609,500),xy(540,499),xy(540,450),xy(590,449),xy(590,140),xy(609,140),xy(610,149),xy(620,150),xy(620,160),xy(639,160)]).
midline(r5, [xy(614,300),xy(615,184),xy(607,172),xy(600,155),xy(600,149)]).
midline(r5, [xy(614,301),xy(614,455),xy(599,470),xy(589,475),xy(564,475)]).
fillpoint(r5, xy(614,455), 25.7).
fillpoint(r5, xy(615,316), 25.0).
fillpoint(r5, xy(564,475), 25.0).
fillpoint(r5, xy(590,474), 25.0).
fillpoint(r5, xy(600,469), 22.8).
fillpoint(r5, xy(605,165), 16.0).
fillpoint(r5, xy(600,154), 11.0).
border(r5).
region(r2, '#ffdc00', 12600, centroid(458,224)).
perimeter(r2, 660).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,160),xy(399,160),xy(400,150),xy(439,150),xy(440,130),xy(469,130),xy(470,120),xy(490,120),xy(489,350)]).
midline(r2, [xy(465,226),xy(465,190),xy(463,176),xy(459,169),xy(417,169),xy(404,175)]).
midline(r2, [xy(465,227),xy(464,279),xy(469,292),xy(470,330)]).
midline(r2, [xy(461,169),xy(464,154),xy(475,143),xy(480,129)]).
fillpoint(r2, xy(460,170), 29.0).
fillpoint(r2, xy(462,165), 28.0).
fillpoint(r2, xy(462,174), 28.0).
fillpoint(r2, xy(463,162), 27.0).
fillpoint(r2, xy(463,177), 27.0).
fillpoint(r2, xy(464,158), 26.0).
fillpoint(r2, xy(464,182), 26.0).
fillpoint(r2, xy(464,236), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(416,170), 20.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(405,174), 16.0).
fillpoint(r2, xy(479,134), 11.0).
region(r14, '#ffdc00', 9700, centroid(404,442)).
perimeter(r14, 600).
polygon(r14, [xy(439,510),xy(430,510),xy(429,500),xy(410,500),xy(410,490),xy(400,490),xy(399,480),xy(380,480),xy(380,470),xy(370,470),xy(370,460),xy(360,460),xy(360,450),xy(350,449),xy(350,430),xy(340,429),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(439,510)]).
midline(r14, [xy(391,463),xy(380,456),xy(374,445),xy(365,410),xy(358,411),xy(358,413)]).
midline(r14, [xy(392,464),xy(406,465),xy(429,476),xy(434,475),xy(435,505)]).
midline(r14, [xy(364,408),xy(365,384)]).
midline(r14, [xy(436,475),xy(465,475)]).
fillpoint(r14, xy(435,475), 25.5).
fillpoint(r14, xy(365,397), 25.0).
fillpoint(r14, xy(441,475), 25.0).
fillpoint(r14, xy(369,423), 21.0).
fillpoint(r14, xy(369,432), 20.0).
fillpoint(r14, xy(374,444), 16.0).
fillpoint(r14, xy(405,465), 16.0).
fillpoint(r14, xy(398,464), 15.0).
fillpoint(r14, xy(381,458), 12.2).
region(r16, '#5a5a5a', 6400, centroid(390,620)).
perimeter(r16, 680).
polygon(r16, [xy(549,630),xy(230,630),xy(230,610),xy(549,610),xy(549,630)]).
midline(r16, [xy(404,619),xy(239,620)]).
midline(r16, [xy(405,619),xy(540,620)]).
fillpoint(r16, xy(239,620), 10.0).
region(r15, '#2ecc40', 2000, centroid(180,620)).
perimeter(r15, 240).
polygon(r15, [xy(229,630),xy(130,630),xy(130,610),xy(229,610),xy(229,630)]).
midline(r15, [xy(151,620),xy(139,620)]).
midline(r15, [xy(152,619),xy(220,620)]).
fillpoint(r15, xy(139,620), 10.0).
region(r12, '#870c25', 1500, centroid(514,334)).
perimeter(r12, 160).
polygon(r12, [xy(539,350),xy(490,350),xy(490,320),xy(539,320),xy(539,350)]).
midline(r12, [xy(516,334),xy(504,335)]).
midline(r12, [xy(517,335),xy(525,335)]).
fillpoint(r12, xy(504,335), 15.0).
region(r11, '#bebebe', 1000, centroid(514,310)).
perimeter(r11, 140).
polygon(r11, [xy(539,320),xy(490,320),xy(490,300),xy(539,300),xy(539,320)]).
midline(r11, [xy(520,310),xy(499,310)]).
midline(r11, [xy(521,309),xy(530,310)]).
fillpoint(r11, xy(499,310), 10.0).
region(r9, '#0074d9', 500, centroid(414,194)).
perimeter(r9, 120).
polygon(r9, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r9, [xy(411,194),xy(394,195)]).
midline(r9, [xy(412,194),xy(435,195)]).
fillpoint(r9, xy(394,195), 5.0).
region(r10, '#0074d9', 500, centroid(444,324)).
perimeter(r10, 120).
polygon(r10, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r10, [xy(445,311),xy(445,304)]).
midline(r10, [xy(445,312),xy(445,345)]).
fillpoint(r10, xy(444,325), 5.0).
region(r13, '#0074d9', 500, centroid(364,354)).
perimeter(r13, 120).
polygon(r13, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r13, [xy(359,354),xy(344,355)]).
midline(r13, [xy(360,354),xy(385,355)]).
fillpoint(r13, xy(344,355), 5.0).
region(r4, '#2ecc40', 400, centroid(427,142)).
perimeter(r4, 100).
polygon(r4, [xy(439,150),xy(410,150),xy(410,140),xy(429,140),xy(430,130),xy(439,130),xy(439,150)]).
midline(r4, [xy(415,144),xy(414,145)]).
midline(r4, [xy(416,144),xy(433,144),xy(435,134)]).
fillpoint(r4, xy(433,144), 6.0).
fillpoint(r4, xy(435,136), 5.0).
fillpoint(r4, xy(414,145), 5.0).
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
region(r19, '#7fdbff', 400, centroid(630,620)).
perimeter(r19, 80).
polygon(r19, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r19, [xy(629,619),xy(630,620)]).
fillpoint(r19, xy(629,620), 10.0).
border(r19).

adjacent(r1, r2).
shared_edge(r1, r2, 90).
adjacent(r1, r3).
shared_edge(r1, r3, 670).
adjacent(r1, r4).
shared_edge(r1, r4, 50).
adjacent(r1, r5).
shared_edge(r1, r5, 140).
adjacent(r1, r14).
shared_edge(r1, r14, 190).
adjacent(r1, r15).
shared_edge(r1, r15, 220).
adjacent(r1, r16).
shared_edge(r1, r16, 660).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 350).
adjacent(r2, r4).
shared_edge(r2, r4, 50).
adjacent(r2, r9).
shared_edge(r2, r9, 60).
adjacent(r2, r10).
shared_edge(r2, r10, 60).
adjacent(r2, r11).
shared_edge(r2, r11, 20).
adjacent(r2, r12).
shared_edge(r2, r12, 30).
adjacent(r3, r5).
shared_edge(r3, r5, 460).
adjacent(r3, r9).
shared_edge(r3, r9, 60).
adjacent(r3, r10).
shared_edge(r3, r10, 60).
adjacent(r3, r11).
shared_edge(r3, r11, 70).
adjacent(r3, r12).
shared_edge(r3, r12, 80).
adjacent(r3, r13).
shared_edge(r3, r13, 70).
adjacent(r3, r14).
shared_edge(r3, r14, 360).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r13, r14).
shared_edge(r13, r14, 50).
adjacent(r15, r16).
shared_edge(r15, r16, 20).

encloses(r1, r17).
encloses(r1, r18).
