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

region(r1, '#aaaaaa', 288600, centroid(253,329)).
perimeter(r1, 4460).
polygon(r1, [xy(639,110),xy(620,110),xy(620,100),xy(610,100),xy(609,90),xy(590,90),xy(589,80),xy(550,80),xy(549,70),xy(470,70),xy(469,80),xy(430,80),xy(429,90),xy(410,90),xy(410,99),xy(400,100),xy(399,110),xy(380,110),xy(380,119),xy(370,120),xy(370,129),xy(360,130),xy(359,140),xy(350,140),xy(350,159),xy(340,160),xy(340,169),xy(330,170),xy(330,189),xy(320,190),xy(320,229),xy(310,230),xy(310,309),xy(320,310),xy(320,349),xy(330,350),xy(330,369),xy(339,370),xy(340,379),xy(350,380),xy(350,399),xy(359,400),xy(360,409),xy(369,410),xy(370,419),xy(379,420),xy(380,430),xy(399,430),xy(400,439),xy(409,440),xy(410,450),xy(429,450),xy(430,460),xy(469,460),xy(470,470),xy(549,470),xy(550,460),xy(589,460),xy(590,450),xy(609,450),xy(610,440),xy(620,439),xy(620,430),xy(639,430)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(434,39),xy(418,40),xy(390,48),xy(387,47),xy(366,56),xy(341,61),xy(290,82),xy(221,119),xy(185,142),xy(161,161),xy(155,206),xy(154,308),xy(162,392),xy(172,437),xy(130,479),xy(101,512),xy(84,538),xy(70,569),xy(89,599),xy(120,630),xy(131,635),xy(549,635),xy(555,632),xy(555,542),xy(552,539),xy(454,539),xy(427,533),xy(406,533),xy(370,525),xy(312,507),xy(254,483),xy(195,452),xy(173,438)]).
midline(r1, [xy(435,39),xy(442,39),xy(447,50),xy(446,53),xy(448,55),xy(448,52)]).
midline(r1, [xy(554,539),xy(565,539),xy(570,536),xy(582,517),xy(578,506),xy(580,506)]).
midline(r1, [xy(192,140),xy(243,191),xy(245,190),xy(193,138)]).
midline(r1, [xy(321,508),xy(382,447),xy(381,452),xy(324,509)]).
midline(r1, [xy(245,192),xy(256,195),xy(259,193),xy(258,196)]).
midline(r1, [xy(428,532),xy(435,525),xy(434,521),xy(438,515),xy(439,503),xy(442,499),xy(441,503)]).
midline(r1, [xy(434,528),xy(432,533)]).
midline(r1, [xy(169,421),xy(242,348),xy(271,339),xy(271,341)]).
midline(r1, [xy(449,56),xy(450,55)]).
midline(r1, [xy(444,39),xy(470,34),xy(560,35),xy(577,40),xy(570,56),xy(576,50),xy(577,43)]).
midline(r1, [xy(555,633),xy(578,635),xy(585,632),xy(585,556),xy(569,539)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,629),xy(614,633),xy(609,635),xy(585,633)]).
midline(r1, [xy(578,40),xy(599,40),xy(611,62),xy(620,73),xy(630,100)]).
midline(r1, [xy(391,49),xy(413,71)]).
midline(r1, [xy(583,515),xy(606,489),xy(611,477),xy(622,462),xy(630,439)]).
midline(r1, [xy(260,196),xy(262,193),xy(264,194),xy(263,197),xy(267,199),xy(269,197),xy(265,193)]).
midline(r1, [xy(266,196),xy(265,196)]).
midline(r1, [xy(269,199),xy(276,202),xy(279,201),xy(279,203)]).
midline(r1, [xy(281,203),xy(289,207),xy(291,206),xy(291,208)]).
midline(r1, [xy(273,339),xy(277,337),xy(275,340)]).
midline(r1, [xy(279,337),xy(293,330),xy(290,334)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(391,492),xy(390,493)]).
midline(r1, [xy(257,119),xy(308,170)]).
midline(r1, [xy(394,487),xy(410,471),xy(397,486)]).
midline(r1, [xy(297,328),xy(295,330),xy(298,329)]).
fillpoint(r1, xy(171,435), 172.0).
fillpoint(r1, xy(172,437), 172.0).
fillpoint(r1, xy(169,428), 170.0).
fillpoint(r1, xy(168,423), 169.0).
fillpoint(r1, xy(167,419), 168.0).
fillpoint(r1, xy(166,414), 167.0).
fillpoint(r1, xy(165,409), 166.0).
fillpoint(r1, xy(164,404), 165.0).
fillpoint(r1, xy(163,398), 164.0).
fillpoint(r1, xy(162,391), 163.0).
fillpoint(r1, xy(161,382), 162.0).
fillpoint(r1, xy(161,161), 161.6).
fillpoint(r1, xy(160,169), 161.0).
fillpoint(r1, xy(160,371), 161.0).
fillpoint(r1, xy(159,177), 160.0).
fillpoint(r1, xy(159,363), 160.0).
fillpoint(r1, xy(158,183), 159.0).
fillpoint(r1, xy(158,357), 159.0).
fillpoint(r1, xy(157,189), 158.0).
fillpoint(r1, xy(157,350), 158.0).
fillpoint(r1, xy(156,198), 157.0).
fillpoint(r1, xy(156,342), 157.0).
fillpoint(r1, xy(155,210), 156.0).
fillpoint(r1, xy(155,330), 156.0).
fillpoint(r1, xy(154,270), 155.0).
fillpoint(r1, xy(281,494), 116.0).
fillpoint(r1, xy(321,510), 100.0).
fillpoint(r1, xy(331,513), 97.0).
fillpoint(r1, xy(335,514), 96.0).
fillpoint(r1, xy(339,515), 95.0).
fillpoint(r1, xy(344,516), 94.0).
fillpoint(r1, xy(364,523), 87.0).
fillpoint(r1, xy(371,525), 85.0).
fillpoint(r1, xy(376,526), 84.0).
fillpoint(r1, xy(381,527), 83.0).
fillpoint(r1, xy(389,529), 81.0).
fillpoint(r1, xy(393,530), 80.0).
fillpoint(r1, xy(397,531), 79.0).
fillpoint(r1, xy(402,532), 78.0).
fillpoint(r1, xy(408,533), 77.0).
fillpoint(r1, xy(416,534), 76.0).
fillpoint(r1, xy(432,535), 75.0).
fillpoint(r1, xy(438,536), 74.0).
fillpoint(r1, xy(443,537), 73.0).
fillpoint(r1, xy(449,538), 72.0).
fillpoint(r1, xy(568,538), 71.6).
fillpoint(r1, xy(457,539), 71.0).
fillpoint(r1, xy(563,539), 71.0).
fillpoint(r1, xy(471,540), 70.0).
fillpoint(r1, xy(342,61), 62.0).
fillpoint(r1, xy(345,60), 61.0).
fillpoint(r1, xy(348,59), 60.0).
fillpoint(r1, xy(352,58), 59.0).
fillpoint(r1, xy(356,57), 58.0).
fillpoint(r1, xy(361,56), 57.0).
fillpoint(r1, xy(381,49), 50.0).
fillpoint(r1, xy(388,47), 48.0).
fillpoint(r1, xy(393,46), 47.0).
fillpoint(r1, xy(399,45), 46.0).
fillpoint(r1, xy(403,44), 45.0).
fillpoint(r1, xy(406,43), 44.0).
border(r1).
region(r3, '#2ecc40', 69500, centroid(469,278)).
perimeter(r3, 2320).
polygon(r3, [xy(539,470),xy(490,470),xy(489,450),xy(410,450),xy(410,440),xy(400,440),xy(400,430),xy(390,429),xy(390,350),xy(340,350),xy(340,369),xy(330,370),xy(330,350),xy(320,349),xy(320,310),xy(310,309),xy(310,240),xy(330,239),xy(330,210),xy(320,209),xy(320,200),xy(340,199),xy(340,160),xy(350,159),xy(350,140),xy(359,140),xy(360,130),xy(369,130),xy(370,120),xy(380,119),xy(380,110),xy(399,110),xy(400,100),xy(409,100),xy(410,90),xy(429,90),xy(430,80),xy(440,80),xy(440,149),xy(390,150),xy(390,199),xy(440,200),xy(440,350),xy(489,350),xy(490,300),xy(540,299),xy(540,250),xy(490,249),xy(490,70),xy(500,70),xy(500,90),xy(529,90),xy(530,70),xy(549,70),xy(550,80),xy(590,80),xy(590,449),xy(540,450),xy(539,470)]).
hole(r3, [xy(570,339),xy(570,330),xy(580,329),xy(580,320),xy(570,320),xy(569,310),xy(560,310),xy(560,319),xy(550,320),xy(550,329),xy(559,330),xy(560,340),xy(570,339)]).
midline(r3, [xy(524,124),xy(496,95),xy(495,74)]).
midline(r3, [xy(525,125),xy(540,142),xy(539,200),xy(556,220),xy(563,236),xy(565,250),xy(565,284),xy(546,309),xy(536,314),xy(519,329),xy(521,344),xy(528,365),xy(532,390),xy(530,392),xy(514,400),xy(441,400),xy(427,385),xy(418,369),xy(413,336),xy(402,314),xy(377,287),xy(375,282),xy(359,280),xy(357,278),xy(354,280),xy(357,280)]).
midline(r3, [xy(533,390),xy(535,388),xy(535,390)]).
midline(r3, [xy(537,388),xy(548,381),xy(575,353),xy(579,345),xy(579,339),xy(584,333),xy(584,316),xy(579,310),xy(579,304),xy(575,296),xy(565,285)]).
midline(r3, [xy(439,400),xy(434,397),xy(429,398),xy(417,408),xy(415,407),xy(413,409),xy(415,409)]).
midline(r3, [xy(420,407),xy(424,403)]).
midline(r3, [xy(437,402),xy(434,399),xy(432,401),xy(429,400),xy(426,403),xy(431,402)]).
midline(r3, [xy(434,401),xy(433,402)]).
midline(r3, [xy(540,138),xy(555,114),xy(543,92),xy(540,79)]).
midline(r3, [xy(376,281),xy(384,255),xy(367,228),xy(335,206),xy(324,205)]).
midline(r3, [xy(365,224),xy(365,182),xy(363,180),xy(368,171),xy(369,158),xy(374,144),xy(384,134),xy(397,129),xy(407,129),xy(416,126)]).
midline(r3, [xy(377,289),xy(369,300),xy(333,336),xy(335,338),xy(335,365)]).
midline(r3, [xy(514,401),xy(515,445)]).
midline(r3, [xy(417,124),xy(424,104),xy(434,93),xy(435,84)]).
fillpoint(r3, xy(376,282), 63.5).
fillpoint(r3, xy(377,285), 63.0).
fillpoint(r3, xy(378,277), 62.0).
fillpoint(r3, xy(379,274), 61.0).
fillpoint(r3, xy(380,271), 60.0).
fillpoint(r3, xy(381,267), 59.0).
fillpoint(r3, xy(531,391), 59.0).
fillpoint(r3, xy(382,263), 58.0).
fillpoint(r3, xy(383,258), 57.0).
fillpoint(r3, xy(540,169), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(521,343), 32.0).
fillpoint(r3, xy(520,338), 31.0).
fillpoint(r3, xy(561,231), 29.0).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(562,234), 28.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(563,237), 27.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(564,242), 26.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(364,189), 25.0).
fillpoint(r3, xy(565,268), 25.0).
fillpoint(r3, xy(416,126), 24.0).
fillpoint(r3, xy(406,129), 21.0).
fillpoint(r3, xy(369,166), 21.0).
fillpoint(r3, xy(396,130), 20.0).
fillpoint(r3, xy(370,157), 20.0).
fillpoint(r3, xy(389,133), 17.0).
fillpoint(r3, xy(373,149), 17.0).
fillpoint(r3, xy(386,134), 16.5).
fillpoint(r3, xy(374,146), 16.5).
fillpoint(r3, xy(384,135), 16.2).
fillpoint(r3, xy(375,144), 16.2).
fillpoint(r3, xy(424,105), 16.0).
region(r6, '#ffdc00', 17000, centroid(614,270)).
perimeter(r6, 820).
polygon(r6, [xy(639,430),xy(620,430),xy(620,439),xy(610,440),xy(609,450),xy(590,449),xy(590,90),xy(609,90),xy(610,99),xy(620,100),xy(620,110),xy(639,110)]).
midline(r6, [xy(615,229),xy(615,405),xy(607,417),xy(600,434),xy(600,440)]).
midline(r6, [xy(615,228),xy(615,134),xy(607,122),xy(600,105),xy(600,99)]).
fillpoint(r6, xy(614,270), 25.0).
fillpoint(r6, xy(605,115), 16.0).
fillpoint(r6, xy(605,424), 16.0).
fillpoint(r6, xy(600,104), 11.0).
fillpoint(r6, xy(600,435), 11.0).
border(r6).
region(r2, '#ffdc00', 15200, centroid(459,203)).
perimeter(r2, 760).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,150),xy(439,150),xy(440,80),xy(469,80),xy(470,70),xy(490,70),xy(489,350)]).
midline(r2, [xy(469,299),xy(469,292),xy(465,281),xy(458,281),xy(458,283)]).
midline(r2, [xy(469,300),xy(470,330)]).
midline(r2, [xy(465,279),xy(465,190),xy(461,171),xy(459,169),xy(409,170)]).
midline(r2, [xy(460,169),xy(464,159),xy(465,148),xy(464,104),xy(475,93),xy(480,79)]).
fillpoint(r2, xy(460,170), 29.0).
fillpoint(r2, xy(462,165), 28.0).
fillpoint(r2, xy(462,174), 28.0).
fillpoint(r2, xy(463,162), 27.0).
fillpoint(r2, xy(463,177), 27.0).
fillpoint(r2, xy(464,158), 26.0).
fillpoint(r2, xy(464,182), 26.0).
fillpoint(r2, xy(465,126), 25.0).
fillpoint(r2, xy(464,236), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(409,170), 20.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(479,84), 11.0).
region(r21, '#5a5a5a', 5200, centroid(420,620)).
perimeter(r21, 560).
polygon(r21, [xy(549,630),xy(290,630),xy(290,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(450,620),xy(299,620)]).
midline(r21, [xy(451,620),xy(540,620)]).
fillpoint(r21, xy(299,620), 10.0).
region(r20, '#2ecc40', 3200, centroid(210,620)).
perimeter(r20, 360).
polygon(r20, [xy(289,630),xy(130,630),xy(130,610),xy(289,610),xy(289,630)]).
midline(r20, [xy(253,619),xy(139,620)]).
midline(r20, [xy(254,620),xy(280,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r17, '#ffdc00', 2400, centroid(370,387)).
perimeter(r17, 240).
polygon(r17, [xy(389,430),xy(380,430),xy(380,420),xy(370,420),xy(370,410),xy(360,410),xy(359,400),xy(350,399),xy(350,380),xy(340,379),xy(340,360),xy(390,360),xy(389,430)]).
midline(r17, [xy(384,424),xy(385,425)]).
midline(r17, [xy(385,423),xy(384,416),xy(379,410),xy(379,404),xy(369,382),xy(370,380),xy(355,370),xy(349,370)]).
fillpoint(r17, xy(369,381), 20.0).
fillpoint(r17, xy(374,394), 16.0).
fillpoint(r17, xy(354,370), 11.0).
fillpoint(r17, xy(379,405), 11.0).
fillpoint(r17, xy(385,423), 5.0).
region(r11, '#870c25', 1500, centroid(514,284)).
perimeter(r11, 160).
polygon(r11, [xy(539,300),xy(490,300),xy(490,270),xy(539,270),xy(539,300)]).
midline(r11, [xy(516,284),xy(504,285)]).
midline(r11, [xy(517,284),xy(525,285)]).
fillpoint(r11, xy(504,285), 15.0).
region(r10, '#bebebe', 1000, centroid(514,260)).
perimeter(r10, 140).
polygon(r10, [xy(539,270),xy(490,270),xy(490,250),xy(539,250),xy(539,270)]).
midline(r10, [xy(520,260),xy(499,260)]).
midline(r10, [xy(521,259),xy(530,260)]).
fillpoint(r10, xy(499,260), 10.0).
region(r18, '#ffdc00', 800, centroid(464,457)).
perimeter(r18, 160).
polygon(r18, [xy(489,470),xy(470,470),xy(469,460),xy(430,460),xy(430,450),xy(489,450),xy(489,470)]).
midline(r18, [xy(460,454),xy(434,455)]).
midline(r18, [xy(461,455),xy(473,455),xy(480,460)]).
fillpoint(r18, xy(479,460), 10.0).
fillpoint(r18, xy(434,455), 5.0).
region(r19, '#ffdc00', 600, centroid(561,456)).
perimeter(r19, 140).
polygon(r19, [xy(549,470),xy(540,469),xy(540,450),xy(590,450),xy(589,460),xy(550,460),xy(549,470)]).
midline(r19, [xy(570,454),xy(545,455),xy(545,465)]).
midline(r19, [xy(571,455),xy(585,455)]).
fillpoint(r19, xy(546,455), 6.0).
fillpoint(r19, xy(551,455), 5.0).
fillpoint(r19, xy(545,463), 5.0).
region(r4, '#5a5a5a', 500, centroid(514,80)).
perimeter(r4, 120).
polygon(r4, [xy(529,90),xy(500,90),xy(500,70),xy(509,70),xy(510,79),xy(519,80),xy(520,70),xy(529,70),xy(529,90)]).
midline(r4, [xy(505,81),xy(505,74)]).
midline(r4, [xy(505,82),xy(505,84),xy(511,85),xy(523,84),xy(525,74)]).
fillpoint(r4, xy(505,84), 6.0).
fillpoint(r4, xy(523,84), 6.0).
fillpoint(r4, xy(505,76), 5.0).
fillpoint(r4, xy(525,76), 5.0).
fillpoint(r4, xy(511,85), 5.0).
region(r8, '#0074d9', 500, centroid(414,194)).
perimeter(r8, 120).
polygon(r8, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r8, [xy(409,194),xy(394,195)]).
midline(r8, [xy(410,194),xy(435,195)]).
fillpoint(r8, xy(394,195), 5.0).
region(r12, '#0074d9', 500, centroid(444,324)).
perimeter(r12, 120).
polygon(r12, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r12, [xy(445,317),xy(445,304)]).
midline(r12, [xy(445,318),xy(445,345)]).
fillpoint(r12, xy(444,325), 5.0).
region(r16, '#0074d9', 500, centroid(364,354)).
perimeter(r16, 120).
polygon(r16, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r16, [xy(361,354),xy(344,355)]).
midline(r16, [xy(362,355),xy(385,355)]).
fillpoint(r16, xy(344,355), 5.0).
region(r7, '#ffdc00', 400, centroid(332,187)).
perimeter(r7, 100).
polygon(r7, [xy(339,200),xy(320,199),xy(320,190),xy(330,189),xy(330,170),xy(340,170),xy(339,200)]).
midline(r7, [xy(334,190),xy(335,174)]).
midline(r7, [xy(334,191),xy(333,194),xy(324,195)]).
fillpoint(r7, xy(333,194), 6.0).
fillpoint(r7, xy(335,181), 5.0).
fillpoint(r7, xy(324,195), 5.0).
region(r9, '#5a5a5a', 400, centroid(322,227)).
perimeter(r9, 100).
polygon(r9, [xy(329,240),xy(310,239),xy(310,230),xy(320,229),xy(320,210),xy(330,210),xy(329,240)]).
midline(r9, [xy(324,230),xy(323,234),xy(314,235)]).
midline(r9, [xy(325,229),xy(325,214)]).
fillpoint(r9, xy(323,234), 6.0).
fillpoint(r9, xy(325,221), 5.0).
fillpoint(r9, xy(314,235), 5.0).
region(r22, '#7fdbff', 400, centroid(570,620)).
perimeter(r22, 80).
polygon(r22, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r22, [xy(569,619),xy(570,620)]).
fillpoint(r22, xy(569,620), 10.0).
region(r23, '#7fdbff', 400, centroid(600,620)).
perimeter(r23, 80).
polygon(r23, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r23, [xy(599,619),xy(600,620)]).
fillpoint(r23, xy(599,620), 10.0).
region(r24, '#7fdbff', 400, centroid(630,620)).
perimeter(r24, 80).
polygon(r24, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r24, [xy(629,619),xy(630,620)]).
fillpoint(r24, xy(629,620), 10.0).
border(r24).

adjacent(r1, r2).
shared_edge(r1, r2, 60).
adjacent(r1, r3).
shared_edge(r1, r3, 560).
adjacent(r1, r4).
shared_edge(r1, r4, 20).
adjacent(r1, r6).
shared_edge(r1, r6, 140).
adjacent(r1, r7).
shared_edge(r1, r7, 50).
adjacent(r1, r9).
shared_edge(r1, r9, 40).
adjacent(r1, r17).
shared_edge(r1, r17, 110).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 70).
adjacent(r1, r20).
shared_edge(r1, r20, 340).
adjacent(r1, r21).
shared_edge(r1, r21, 540).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 530).
adjacent(r2, r8).
shared_edge(r2, r8, 60).
adjacent(r2, r10).
shared_edge(r2, r10, 20).
adjacent(r2, r11).
shared_edge(r2, r11, 30).
adjacent(r2, r12).
shared_edge(r2, r12, 60).
adjacent(r3, r4).
shared_edge(r3, r4, 70).
adjacent(r3, r6).
shared_edge(r3, r6, 360).
adjacent(r3, r7).
shared_edge(r3, r7, 50).
adjacent(r3, r8).
shared_edge(r3, r8, 60).
adjacent(r3, r9).
shared_edge(r3, r9, 60).
adjacent(r3, r10).
shared_edge(r3, r10, 70).
adjacent(r3, r11).
shared_edge(r3, r11, 80).
adjacent(r3, r12).
shared_edge(r3, r12, 60).
adjacent(r3, r16).
shared_edge(r3, r16, 70).
adjacent(r3, r17).
shared_edge(r3, r17, 80).
adjacent(r3, r18).
shared_edge(r3, r18, 80).
adjacent(r3, r19).
shared_edge(r3, r19, 70).
adjacent(r10, r11).
shared_edge(r10, r11, 50).
adjacent(r16, r17).
shared_edge(r16, r17, 50).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r1, r22).
encloses(r1, r23).
