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

region(r1, '#aaaaaa', 289400, centroid(257,272)).
perimeter(r1, 4740).
polygon(r1, [xy(639,260),xy(620,260),xy(620,250),xy(610,250),xy(609,240),xy(590,240),xy(589,230),xy(550,230),xy(549,220),xy(470,220),xy(469,230),xy(430,230),xy(429,240),xy(410,240),xy(410,249),xy(400,250),xy(399,260),xy(380,260),xy(380,269),xy(370,270),xy(370,279),xy(360,280),xy(360,289),xy(350,290),xy(350,309),xy(340,310),xy(340,319),xy(330,320),xy(330,339),xy(320,340),xy(320,379),xy(310,380),xy(310,459),xy(320,460),xy(320,489),xy(350,490),xy(350,549),xy(359,550),xy(360,559),xy(369,560),xy(370,570),xy(380,570),xy(380,580),xy(399,580),xy(400,589),xy(409,590),xy(410,600),xy(609,600),xy(610,590),xy(620,589),xy(620,580),xy(639,580)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(205,216),xy(187,198),xy(175,235),xy(172,256),xy(164,284),xy(156,345),xy(154,408),xy(103,446),xy(29,520),xy(19,533),xy(15,543),xy(15,596),xy(19,606),xy(27,616),xy(37,622),xy(51,625),xy(89,625),xy(102,622),xy(109,617),xy(111,598),xy(119,581),xy(116,579),xy(79,579),xy(60,560),xy(59,560),xy(60,491)]).
midline(r1, [xy(206,217),xy(309,320),xy(307,321),xy(188,202)]).
midline(r1, [xy(310,321),xy(309,322)]).
midline(r1, [xy(155,409),xy(179,454),xy(194,490),xy(186,505),xy(165,534),xy(119,579)]).
midline(r1, [xy(195,490),xy(239,522),xy(273,488),xy(240,523),xy(269,539),xy(285,545),xy(297,537),xy(297,539)]).
midline(r1, [xy(187,197),xy(189,189),xy(203,183)]).
midline(r1, [xy(109,619),xy(124,633),xy(130,635),xy(553,634),xy(555,632),xy(555,608),xy(553,605),xy(410,605),xy(400,599),xy(394,599),xy(385,594),xy(373,594),xy(326,575),xy(305,563),xy(286,546)]).
midline(r1, [xy(555,633),xy(579,635),xy(583,634),xy(585,630),xy(585,608),xy(583,605),xy(561,604),xy(555,606)]).
midline(r1, [xy(204,181),xy(286,146),xy(328,135)]).
midline(r1, [xy(170,266),xy(244,340),xy(241,341),xy(169,269)]).
midline(r1, [xy(169,271),xy(239,341)]).
midline(r1, [xy(244,342),xy(247,341),xy(251,344),xy(254,342),xy(172,261),xy(250,341)]).
midline(r1, [xy(585,606),xy(590,604),xy(614,605),xy(619,599),xy(627,598),xy(630,589)]).
midline(r1, [xy(615,606),xy(615,632),xy(613,634),xy(590,635),xy(585,633)]).
midline(r1, [xy(329,133),xy(393,117),xy(423,115),xy(441,111),xy(530,109),xy(562,143),xy(583,173),xy(574,195),xy(575,198),xy(578,192)]).
midline(r1, [xy(397,119),xy(431,153),xy(434,161),xy(433,166),xy(435,166)]).
midline(r1, [xy(435,168),xy(444,195)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(584,174),xy(606,200),xy(612,213),xy(608,217),xy(613,214),xy(620,223),xy(630,250)]).
midline(r1, [xy(321,284),xy(216,177),xy(330,291)]).
midline(r1, [xy(266,348),xy(258,343),xy(255,343),xy(256,345)]).
midline(r1, [xy(262,345),xy(173,257),xy(255,341)]).
midline(r1, [xy(267,348),xy(271,347),xy(264,345)]).
midline(r1, [xy(271,349),xy(279,353),xy(282,351),xy(284,355)]).
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
fillpoint(r1, xy(155,395), 155.0).
fillpoint(r1, xy(287,146), 147.0).
fillpoint(r1, xy(290,145), 146.0).
fillpoint(r1, xy(293,144), 145.0).
fillpoint(r1, xy(296,143), 144.0).
fillpoint(r1, xy(299,142), 143.0).
fillpoint(r1, xy(309,139), 140.0).
fillpoint(r1, xy(313,138), 139.0).
fillpoint(r1, xy(317,137), 138.0).
fillpoint(r1, xy(342,129), 130.0).
fillpoint(r1, xy(182,462), 128.0).
fillpoint(r1, xy(354,126), 127.0).
fillpoint(r1, xy(358,125), 126.0).
fillpoint(r1, xy(363,124), 125.0).
fillpoint(r1, xy(367,123), 124.0).
fillpoint(r1, xy(187,474), 123.9).
fillpoint(r1, xy(371,122), 123.0).
fillpoint(r1, xy(189,479), 122.6).
fillpoint(r1, xy(375,121), 122.0).
fillpoint(r1, xy(191,484), 121.5).
fillpoint(r1, xy(379,120), 121.0).
fillpoint(r1, xy(192,486), 121.0).
fillpoint(r1, xy(193,489), 120.6).
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
midline(r4, [xy(614,336),xy(615,449),xy(612,466),xy(609,473),xy(605,475),xy(564,475)]).
midline(r4, [xy(608,475),xy(613,486),xy(615,500),xy(614,555),xy(599,570),xy(589,575),xy(430,574),xy(421,567),xy(408,550),xy(406,549),xy(399,558),xy(406,551)]).
midline(r4, [xy(407,548),xy(400,539),xy(398,531),xy(391,535),xy(395,533)]).
midline(r4, [xy(399,531),xy(400,490),xy(364,455),xy(365,384)]).
midline(r4, [xy(615,335),xy(615,284),xy(607,272),xy(600,255),xy(600,249)]).
midline(r4, [xy(401,490),xy(412,482),xy(430,475),xy(465,475)]).
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
region(r3, '#2ecc40', 43100, centroid(465,350)).
perimeter(r3, 1920).
polygon(r3, [xy(359,550),xy(350,549),xy(350,490),xy(320,490),xy(320,460),xy(310,459),xy(310,380),xy(320,379),xy(320,340),xy(330,339),xy(330,320),xy(339,320),xy(340,310),xy(350,309),xy(350,290),xy(359,290),xy(360,280),xy(369,280),xy(370,270),xy(380,269),xy(380,260),xy(399,260),xy(400,250),xy(409,250),xy(410,240),xy(429,240),xy(430,230),xy(439,230),xy(440,349),xy(489,350),xy(490,220),xy(549,220),xy(550,230),xy(589,230),xy(589,450),xy(540,450),xy(539,400),xy(490,400),xy(489,450),xy(390,450),xy(390,350),xy(340,350),xy(340,479),xy(360,480),xy(359,550)]).
hole(r3, [xy(570,289),xy(570,280),xy(580,279),xy(580,270),xy(570,270),xy(569,260),xy(560,260),xy(560,269),xy(550,270),xy(550,279),xy(559,280),xy(560,290),xy(570,289)]).
midline(r3, [xy(329,480),xy(329,454),xy(324,445),xy(324,394),xy(330,379),xy(329,349),xy(344,334),xy(369,325),xy(390,310),xy(398,308),xy(412,333),xy(415,358),xy(419,371),xy(439,400),xy(454,387),xy(468,379),xy(511,370),xy(525,362),xy(540,349),xy(540,335),xy(531,320),xy(520,289),xy(520,260),xy(522,252),xy(527,248),xy(527,250)]).
midline(r3, [xy(331,480),xy(340,485),xy(354,485),xy(355,545)]).
midline(r3, [xy(541,335),xy(551,328),xy(575,303),xy(579,295),xy(579,289),xy(584,283),xy(585,270),xy(574,245),xy(560,244),xy(540,250),xy(529,249)]).
midline(r3, [xy(540,351),xy(552,364),xy(562,383),xy(565,403),xy(565,425)]).
midline(r3, [xy(399,307),xy(400,300),xy(415,279),xy(424,254),xy(434,243),xy(435,234)]).
fillpoint(r3, xy(539,343), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(398,309), 41.7).
fillpoint(r3, xy(522,252), 33.0).
fillpoint(r3, xy(521,256), 32.0).
fillpoint(r3, xy(521,293), 32.0).
fillpoint(r3, xy(520,262), 31.0).
fillpoint(r3, xy(520,288), 31.0).
fillpoint(r3, xy(519,275), 30.0).
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
fillpoint(r3, xy(554,245), 16.0).
fillpoint(r3, xy(424,255), 16.0).
fillpoint(r3, xy(345,334), 16.0).
fillpoint(r3, xy(574,245), 15.8).
fillpoint(r3, xy(561,245), 15.0).
fillpoint(r3, xy(324,420), 15.0).
region(r12, '#2ecc40', 10000, centroid(514,512)).
perimeter(r12, 500).
polygon(r12, [xy(589,550),xy(440,550),xy(440,500),xy(489,500),xy(490,450),xy(539,450),xy(540,499),xy(590,500),xy(589,550)]).
midline(r12, [xy(514,491),xy(515,474)]).
midline(r12, [xy(514,492),xy(515,517),xy(513,519),xy(499,524),xy(464,525)]).
midline(r12, [xy(515,518),xy(530,524),xy(565,525)]).
fillpoint(r12, xy(515,518), 31.4).
fillpoint(r12, xy(508,521), 29.0).
fillpoint(r12, xy(521,521), 29.0).
fillpoint(r12, xy(505,522), 28.0).
fillpoint(r12, xy(524,522), 28.0).
fillpoint(r12, xy(502,523), 27.0).
fillpoint(r12, xy(527,523), 27.0).
fillpoint(r12, xy(498,524), 26.0).
fillpoint(r12, xy(532,524), 26.0).
fillpoint(r12, xy(515,486), 25.0).
fillpoint(r12, xy(464,525), 25.0).
fillpoint(r12, xy(541,525), 25.0).
region(r16, '#5a5a5a', 7200, centroid(370,620)).
perimeter(r16, 760).
polygon(r16, [xy(549,630),xy(190,630),xy(190,610),xy(549,610),xy(549,630)]).
midline(r16, [xy(416,620),xy(199,620)]).
midline(r16, [xy(417,619),xy(540,620)]).
fillpoint(r16, xy(199,620), 10.0).
region(r2, '#ffdc00', 5700, centroid(467,284)).
perimeter(r2, 360).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,230),xy(469,230),xy(470,220),xy(490,220),xy(489,350)]).
midline(r2, [xy(478,237),xy(464,254),xy(464,280),xy(468,288),xy(470,300),xy(470,330)]).
midline(r2, [xy(478,236),xy(480,229)]).
fillpoint(r2, xy(465,267), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(479,234), 11.0).
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
region(r11, '#870c25', 1500, centroid(514,434)).
perimeter(r11, 160).
polygon(r11, [xy(539,450),xy(490,450),xy(490,420),xy(539,420),xy(539,450)]).
midline(r11, [xy(516,434),xy(504,435)]).
midline(r11, [xy(517,434),xy(525,435)]).
fillpoint(r11, xy(504,435), 15.0).
region(r15, '#2ecc40', 1200, centroid(160,620)).
perimeter(r15, 160).
polygon(r15, [xy(189,630),xy(130,630),xy(130,610),xy(189,610),xy(189,630)]).
midline(r15, [xy(149,620),xy(139,620)]).
midline(r15, [xy(150,619),xy(180,620)]).
fillpoint(r15, xy(139,620), 10.0).
region(r10, '#bebebe', 1000, centroid(514,410)).
perimeter(r10, 140).
polygon(r10, [xy(539,420),xy(490,420),xy(490,400),xy(539,400),xy(539,420)]).
midline(r10, [xy(509,410),xy(499,410)]).
midline(r10, [xy(510,410),xy(530,410)]).
fillpoint(r10, xy(499,410), 10.0).
region(r8, '#0074d9', 500, centroid(444,324)).
perimeter(r8, 120).
polygon(r8, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r8, [xy(445,314),xy(445,304)]).
midline(r8, [xy(444,315),xy(445,345)]).
fillpoint(r8, xy(444,325), 5.0).
region(r9, '#0074d9', 500, centroid(364,354)).
perimeter(r9, 120).
polygon(r9, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r9, [xy(359,354),xy(344,355)]).
midline(r9, [xy(360,355),xy(385,355)]).
fillpoint(r9, xy(344,355), 5.0).
region(r14, '#7fdbff', 400, centroid(80,560)).
perimeter(r14, 80).
polygon(r14, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r14, [xy(79,559),xy(80,560)]).
fillpoint(r14, xy(79,560), 10.0).
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

adjacent(r1, r2).
shared_edge(r1, r2, 60).
adjacent(r1, r3).
shared_edge(r1, r3, 620).
adjacent(r1, r4).
shared_edge(r1, r4, 420).
adjacent(r1, r13).
shared_edge(r1, r13, 240).
adjacent(r1, r14).
shared_edge(r1, r14, 80).
adjacent(r1, r15).
shared_edge(r1, r15, 140).
adjacent(r1, r16).
shared_edge(r1, r16, 740).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 240).
adjacent(r2, r8).
shared_edge(r2, r8, 60).
adjacent(r3, r4).
shared_edge(r3, r4, 660).
adjacent(r3, r8).
shared_edge(r3, r8, 60).
adjacent(r3, r9).
shared_edge(r3, r9, 70).
adjacent(r3, r10).
shared_edge(r3, r10, 90).
adjacent(r3, r11).
shared_edge(r3, r11, 60).
adjacent(r4, r9).
shared_edge(r4, r9, 50).
adjacent(r4, r12).
shared_edge(r4, r12, 450).
adjacent(r10, r11).
shared_edge(r10, r11, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r15, r16).
shared_edge(r15, r16, 20).

encloses(r1, r13).
encloses(r1, r14).
encloses(r1, r17).
encloses(r1, r18).
