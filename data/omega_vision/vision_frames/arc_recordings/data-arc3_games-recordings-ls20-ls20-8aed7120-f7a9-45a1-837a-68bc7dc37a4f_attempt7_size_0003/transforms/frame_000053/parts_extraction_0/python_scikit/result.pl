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

region(r1, '#aaaaaa', 280500, centroid(362,268)).
perimeter(r1, 5380).
polygon(r1, [xy(310,599),xy(310,590),xy(319,590),xy(320,580),xy(339,580),xy(340,570),xy(349,570),xy(350,560),xy(359,560),xy(360,550),xy(370,549),xy(370,530),xy(379,530),xy(380,520),xy(390,519),xy(390,500),xy(400,499),xy(400,460),xy(410,459),xy(410,380),xy(400,379),xy(400,340),xy(390,339),xy(390,320),xy(380,320),xy(380,310),xy(370,309),xy(370,290),xy(360,290),xy(360,280),xy(350,280),xy(350,270),xy(340,270),xy(339,260),xy(320,260),xy(320,250),xy(310,250),xy(309,240),xy(290,240),xy(289,230),xy(250,230),xy(249,220),xy(170,220),xy(169,230),xy(130,230),xy(129,240),xy(110,240),xy(109,250),xy(100,250),xy(99,260),xy(80,260),xy(80,269),xy(70,270),xy(70,279),xy(60,280),xy(60,289),xy(50,290),xy(50,309),xy(40,310),xy(40,529),xy(109,530),xy(110,600),xy(310,599)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(70,609),xy(70,590),xy(90,589),xy(89,550),xy(50,550),xy(50,569),xy(30,570),xy(30,589),xy(49,590),xy(50,610),xy(70,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(476,163),xy(433,146),xy(392,135),xy(378,129),xy(319,116),xy(248,109),xy(172,109),xy(115,115),xy(90,148),xy(70,181),xy(61,202),xy(49,220),xy(28,270),xy(19,310),xy(19,529),xy(24,547),xy(15,563),xy(15,596),xy(23,612),xy(33,620),xy(50,625),xy(69,625),xy(89,618),xy(92,615),xy(92,608),xy(99,595),xy(100,550),xy(97,541),xy(89,539),xy(50,539),xy(28,548),xy(25,547)]).
midline(r1, [xy(476,165),xy(494,213),xy(516,297),xy(471,342),xy(464,341),xy(459,346),xy(457,344),xy(450,345),xy(442,350),xy(435,350),xy(433,352),xy(436,352)]).
midline(r1, [xy(104,130),xy(130,156),xy(132,153),xy(107,128)]).
midline(r1, [xy(322,119),xy(287,154),xy(286,159),xy(288,158)]).
midline(r1, [xy(288,161),xy(284,164),xy(284,169),xy(278,183),xy(285,176),xy(285,167),xy(288,163)]).
midline(r1, [xy(287,167),xy(287,169)]).
midline(r1, [xy(286,174),xy(288,172)]).
midline(r1, [xy(461,346),xy(469,343)]).
midline(r1, [xy(473,342),xy(516,299)]).
midline(r1, [xy(475,342),xy(516,301),xy(517,303),xy(525,381),xy(524,480),xy(522,492),xy(504,504),xy(495,513),xy(479,498),xy(471,498),xy(455,491),xy(456,494),xy(462,495),xy(465,500),xy(466,497)]).
midline(r1, [xy(523,493),xy(555,525),xy(555,630),xy(553,634),xy(130,635),xy(124,633),xy(109,619),xy(93,616)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,632),xy(579,635),xy(555,633)]).
midline(r1, [xy(110,619),xy(124,606),xy(132,604),xy(309,605),xy(334,594),xy(352,592),xy(372,582),xy(379,581),xy(386,576),xy(393,575),xy(417,560),xy(441,549),xy(412,518),xy(442,548),xy(484,522),xy(485,520),xy(466,501),xy(468,497)]).
midline(r1, [xy(457,346),xy(435,354)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,632),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(283,180),xy(284,179)]).
midline(r1, [xy(479,500),xy(493,514),xy(490,517),xy(472,499),xy(468,501),xy(471,504),xy(472,501)]).
midline(r1, [xy(489,518),xy(474,503),xy(472,505),xy(486,519)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(339,188),xy(338,189)]).
midline(r1, [xy(359,166),xy(390,135),xy(362,165)]).
midline(r1, [xy(135,170),xy(136,168),xy(131,158),xy(132,156),xy(133,158)]).
midline(r1, [xy(136,171),xy(137,175),xy(135,177),xy(137,180),xy(138,176)]).
midline(r1, [xy(141,186),xy(138,181),xy(140,181)]).
midline(r1, [xy(142,187),xy(140,187)]).
midline(r1, [xy(140,189),xy(141,192),xy(142,189)]).
midline(r1, [xy(143,191),xy(144,193),xy(142,193)]).
midline(r1, [xy(145,194),xy(144,195)]).
fillpoint(r1, xy(475,164), 164.0).
fillpoint(r1, xy(490,201), 150.0).
fillpoint(r1, xy(432,146), 147.0).
fillpoint(r1, xy(493,211), 147.0).
fillpoint(r1, xy(429,145), 146.0).
fillpoint(r1, xy(494,214), 146.0).
fillpoint(r1, xy(426,144), 145.0).
fillpoint(r1, xy(495,218), 145.0).
fillpoint(r1, xy(423,143), 144.0).
fillpoint(r1, xy(496,222), 144.0).
fillpoint(r1, xy(420,142), 143.0).
fillpoint(r1, xy(497,226), 143.0).
fillpoint(r1, xy(410,139), 140.0).
fillpoint(r1, xy(406,138), 139.0).
fillpoint(r1, xy(402,137), 138.0).
fillpoint(r1, xy(503,244), 137.0).
fillpoint(r1, xy(504,247), 136.0).
fillpoint(r1, xy(506,254), 134.0).
fillpoint(r1, xy(507,258), 133.0).
fillpoint(r1, xy(508,262), 132.0).
fillpoint(r1, xy(509,267), 131.0).
fillpoint(r1, xy(377,129), 130.0).
fillpoint(r1, xy(510,272), 130.0).
fillpoint(r1, xy(365,126), 127.0).
fillpoint(r1, xy(513,284), 127.0).
fillpoint(r1, xy(361,125), 126.0).
fillpoint(r1, xy(514,288), 126.0).
fillpoint(r1, xy(356,124), 125.0).
fillpoint(r1, xy(515,293), 125.0).
fillpoint(r1, xy(352,123), 124.0).
fillpoint(r1, xy(516,298), 124.0).
fillpoint(r1, xy(348,122), 123.0).
fillpoint(r1, xy(517,305), 123.0).
fillpoint(r1, xy(344,121), 122.0).
fillpoint(r1, xy(518,312), 122.0).
fillpoint(r1, xy(340,120), 121.0).
fillpoint(r1, xy(519,322), 121.0).
fillpoint(r1, xy(335,119), 120.0).
fillpoint(r1, xy(520,334), 120.0).
fillpoint(r1, xy(330,118), 119.0).
fillpoint(r1, xy(521,339), 119.0).
fillpoint(r1, xy(324,117), 118.0).
fillpoint(r1, xy(522,345), 118.0).
fillpoint(r1, xy(522,492), 117.7).
fillpoint(r1, xy(317,116), 117.0).
fillpoint(r1, xy(523,352), 117.0).
fillpoint(r1, xy(523,487), 117.0).
fillpoint(r1, xy(115,115), 116.0).
fillpoint(r1, xy(307,115), 116.0).
fillpoint(r1, xy(524,362), 116.0).
fillpoint(r1, xy(524,477), 116.0).
fillpoint(r1, xy(125,114), 115.0).
fillpoint(r1, xy(294,114), 115.0).
fillpoint(r1, xy(524,420), 115.0).
fillpoint(r1, xy(130,113), 114.0).
fillpoint(r1, xy(289,113), 114.0).
fillpoint(r1, xy(136,112), 113.0).
fillpoint(r1, xy(284,112), 113.0).
fillpoint(r1, xy(143,111), 112.0).
fillpoint(r1, xy(276,111), 112.0).
fillpoint(r1, xy(153,110), 111.0).
fillpoint(r1, xy(266,110), 111.0).
fillpoint(r1, xy(171,110), 110.0).
fillpoint(r1, xy(44,233), 45.0).
border(r1).
region(r4, '#ffdc00', 50200, centroid(173,455)).
perimeter(r4, 1920).
polygon(r4, [xy(309,600),xy(110,600),xy(110,530),xy(40,529),xy(40,310),xy(50,309),xy(50,290),xy(59,290),xy(60,280),xy(69,280),xy(70,270),xy(80,269),xy(80,260),xy(90,260),xy(90,449),xy(139,450),xy(140,500),xy(189,500),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(290,479),xy(270,480),xy(270,569),xy(340,570),xy(339,580),xy(320,580),xy(320,589),xy(310,590),xy(309,600)]).
midline(r4, [xy(108,498),xy(99,489),xy(81,489),xy(77,485),xy(68,469),xy(64,449),xy(64,330),xy(69,317),xy(69,307),xy(79,285),xy(79,279),xy(84,273),xy(85,264)]).
midline(r4, [xy(109,499),xy(159,550),xy(203,549),xy(216,545),xy(247,576),xy(257,582),xy(270,585),xy(295,585),xy(304,580),xy(310,580),xy(316,575),xy(335,575)]).
midline(r4, [xy(217,544),xy(228,516),xy(229,489),xy(264,455),xy(265,352),xy(263,336),xy(259,328),xy(249,325),xy(164,325)]).
fillpoint(r4, xy(216,546), 54.0).
fillpoint(r4, xy(212,547), 53.0).
fillpoint(r4, xy(208,548), 52.0).
fillpoint(r4, xy(201,549), 51.0).
fillpoint(r4, xy(159,550), 50.0).
fillpoint(r4, xy(225,526), 45.0).
fillpoint(r4, xy(226,523), 44.0).
fillpoint(r4, xy(228,515), 42.0).
fillpoint(r4, xy(81,489), 41.0).
fillpoint(r4, xy(229,509), 41.0).
fillpoint(r4, xy(91,490), 40.0).
fillpoint(r4, xy(229,494), 40.0).
fillpoint(r4, xy(260,329), 29.7).
fillpoint(r4, xy(258,328), 29.0).
fillpoint(r4, xy(261,331), 29.0).
fillpoint(r4, xy(68,468), 29.0).
fillpoint(r4, xy(255,327), 28.0).
fillpoint(r4, xy(262,334), 28.0).
fillpoint(r4, xy(67,465), 28.0).
fillpoint(r4, xy(252,326), 27.0).
fillpoint(r4, xy(263,337), 27.0).
fillpoint(r4, xy(66,462), 27.0).
fillpoint(r4, xy(248,325), 26.0).
fillpoint(r4, xy(264,342), 26.0).
fillpoint(r4, xy(65,458), 26.0).
fillpoint(r4, xy(264,455), 25.7).
fillpoint(r4, xy(164,325), 25.0).
fillpoint(r4, xy(64,389), 25.0).
fillpoint(r4, xy(264,400), 25.0).
fillpoint(r4, xy(69,316), 21.0).
fillpoint(r4, xy(70,307), 20.0).
fillpoint(r4, xy(74,295), 16.0).
fillpoint(r4, xy(264,584), 16.0).
fillpoint(r4, xy(296,584), 15.0).
region(r3, '#2ecc40', 45200, centroid(235,362)).
perimeter(r3, 2740).
polygon(r3, [xy(349,570),xy(270,569),xy(270,480),xy(290,479),xy(289,300),xy(140,300),xy(140,350),xy(240,350),xy(240,399),xy(190,400),xy(189,500),xy(140,500),xy(140,450),xy(90,449),xy(90,260),xy(99,260),xy(100,250),xy(109,250),xy(110,240),xy(129,240),xy(130,230),xy(140,230),xy(140,250),xy(289,250),xy(290,240),xy(309,240),xy(310,249),xy(319,250),xy(320,260),xy(339,260),xy(340,269),xy(349,270),xy(350,279),xy(359,280),xy(360,290),xy(370,290),xy(370,309),xy(379,310),xy(380,320),xy(390,320),xy(390,339),xy(400,340),xy(400,379),xy(410,380),xy(410,449),xy(390,449),xy(390,350),xy(340,350),xy(340,479),xy(360,480),xy(360,559),xy(350,559),xy(349,490),xy(280,490),xy(280,559),xy(349,560),xy(349,570)]).
hole(r3, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
hole(r3, [xy(180,489),xy(179,460),xy(150,460),xy(150,490),xy(180,489)]).
midline(r3, [xy(95,421),xy(94,411),xy(96,404),xy(122,377),xy(116,363),xy(114,348),xy(114,303),xy(117,285),xy(115,281),xy(118,282)]).
midline(r3, [xy(119,280),xy(125,273),xy(124,254),xy(133,245),xy(135,234)]).
midline(r3, [xy(123,377),xy(144,381),xy(156,386),xy(160,411),xy(159,426),xy(133,444),xy(100,445),xy(96,444),xy(94,439),xy(95,422)]).
midline(r3, [xy(159,427),xy(162,432),xy(145,456),xy(145,494),xy(177,495),xy(184,493),xy(184,456),xy(163,433)]).
midline(r3, [xy(157,385),xy(180,375),xy(215,375)]).
midline(r3, [xy(125,275),xy(297,275),xy(300,269),xy(300,249)]).
midline(r3, [xy(299,275),xy(316,287),xy(322,296),xy(328,313),xy(317,333),xy(314,350),xy(315,461),xy(314,465),xy(295,483),xy(275,485),xy(275,564),xy(345,565)]).
midline(r3, [xy(329,313),xy(339,317),xy(348,308),xy(340,318),xy(342,320),xy(375,334),xy(386,344),xy(394,345),xy(394,378),xy(396,385),xy(400,389),xy(400,440)]).
midline(r3, [xy(317,286),xy(321,282),xy(321,278),xy(323,278)]).
midline(r3, [xy(315,465),xy(334,483),xy(354,485),xy(355,552),xy(354,555),xy(346,563)]).
fillpoint(r3, xy(328,312), 39.0).
fillpoint(r3, xy(156,386), 36.1).
fillpoint(r3, xy(322,297), 33.1).
fillpoint(r3, xy(122,377), 33.0).
fillpoint(r3, xy(126,378), 32.0).
fillpoint(r3, xy(143,381), 32.0).
fillpoint(r3, xy(131,379), 31.1).
fillpoint(r3, xy(138,380), 31.1).
fillpoint(r3, xy(159,402), 31.0).
fillpoint(r3, xy(318,290), 30.4).
fillpoint(r3, xy(160,419), 30.0).
fillpoint(r3, xy(124,275), 29.7).
fillpoint(r3, xy(119,280), 29.0).
fillpoint(r3, xy(118,281), 29.0).
fillpoint(r3, xy(318,331), 29.0).
fillpoint(r3, xy(118,368), 29.0).
fillpoint(r3, xy(171,378), 29.0).
fillpoint(r3, xy(161,431), 29.0).
fillpoint(r3, xy(117,284), 28.0).
fillpoint(r3, xy(317,334), 28.0).
fillpoint(r3, xy(117,365), 28.0).
fillpoint(r3, xy(174,377), 28.0).
fillpoint(r3, xy(116,287), 27.0).
fillpoint(r3, xy(316,337), 27.0).
fillpoint(r3, xy(116,362), 27.0).
fillpoint(r3, xy(177,376), 27.0).
fillpoint(r3, xy(298,275), 26.6).
fillpoint(r3, xy(115,292), 26.0).
fillpoint(r3, xy(315,342), 26.0).
fillpoint(r3, xy(115,358), 26.0).
fillpoint(r3, xy(182,375), 26.0).
fillpoint(r3, xy(304,279), 25.6).
fillpoint(r3, xy(305,280), 25.6).
fillpoint(r3, xy(141,275), 25.0).
fillpoint(r3, xy(114,325), 25.0).
fillpoint(r3, xy(315,408), 25.0).
fillpoint(r3, xy(191,375), 25.0).
fillpoint(r3, xy(374,334), 16.0).
fillpoint(r3, xy(399,415), 10.0).
region(r6, '#ffdc00', 8200, centroid(368,440)).
perimeter(r6, 520).
polygon(r6, [xy(369,550),xy(360,549),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,449),xy(410,450),xy(410,459),xy(400,460),xy(400,499),xy(390,500),xy(390,519),xy(380,520),xy(380,529),xy(370,530),xy(369,550)]).
midline(r6, [xy(374,502),xy(375,505),xy(370,514),xy(370,520),xy(365,526),xy(365,545)]).
midline(r6, [xy(375,501),xy(375,493),xy(380,482),xy(379,472),xy(378,468),xy(364,455),xy(365,384)]).
midline(r6, [xy(379,467),xy(396,455),xy(405,455)]).
fillpoint(r6, xy(365,455), 25.7).
fillpoint(r6, xy(365,416), 25.0).
fillpoint(r6, xy(377,467), 22.2).
fillpoint(r6, xy(379,473), 21.0).
fillpoint(r6, xy(379,482), 20.0).
fillpoint(r6, xy(375,494), 16.0).
fillpoint(r6, xy(375,503), 15.0).
fillpoint(r6, xy(370,515), 11.0).
region(r23, '#2ecc40', 6000, centroid(280,620)).
perimeter(r23, 640).
polygon(r23, [xy(429,630),xy(130,630),xy(130,610),xy(429,610),xy(429,630)]).
midline(r23, [xy(345,620),xy(139,620)]).
midline(r23, [xy(346,619),xy(420,620)]).
fillpoint(r23, xy(139,620), 10.0).
region(r16, '#aaaaaa', 4300, centroid(314,524)).
perimeter(r16, 440).
polygon(r16, [xy(349,560),xy(280,559),xy(280,490),xy(350,490),xy(349,560)]).
hole(r16, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(330,519),xy(329,510),xy(320,510),xy(319,520),xy(310,520),xy(309,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(330,539)]).
midline(r16, [xy(339,542),xy(339,525),xy(325,525),xy(315,515),xy(314,515),xy(315,502),xy(313,500),xy(291,501),xy(289,510),xy(290,535),xy(296,545),xy(304,549),xy(329,550),xy(337,548),xy(339,543)]).
midline(r16, [xy(315,500),xy(328,499),xy(338,501),xy(340,510),xy(339,523)]).
fillpoint(r16, xy(295,544), 15.8).
fillpoint(r16, xy(292,501), 12.0).
fillpoint(r16, xy(338,501), 12.0).
fillpoint(r16, xy(337,548), 12.0).
fillpoint(r16, xy(295,500), 11.0).
fillpoint(r16, xy(315,500), 11.0).
fillpoint(r16, xy(334,500), 11.0).
fillpoint(r16, xy(290,505), 11.0).
fillpoint(r16, xy(339,505), 11.0).
fillpoint(r16, xy(339,525), 11.0).
fillpoint(r16, xy(290,534), 11.0).
fillpoint(r16, xy(339,544), 11.0).
fillpoint(r16, xy(305,549), 11.0).
fillpoint(r16, xy(334,549), 11.0).
fillpoint(r16, xy(301,500), 10.0).
fillpoint(r16, xy(321,500), 10.0).
fillpoint(r16, xy(289,520), 10.0).
fillpoint(r16, xy(339,515), 10.0).
fillpoint(r16, xy(339,535), 10.0).
fillpoint(r16, xy(311,550), 10.0).
fillpoint(r16, xy(315,513), 5.0).
fillpoint(r16, xy(324,525), 5.0).
region(r2, '#ffdc00', 3800, centroid(213,236)).
perimeter(r2, 360).
polygon(r2, [xy(289,250),xy(140,250),xy(140,230),xy(169,230),xy(170,220),xy(249,220),xy(250,230),xy(289,230),xy(289,250)]).
midline(r2, [xy(165,240),xy(149,240)]).
midline(r2, [xy(166,240),xy(175,239),xy(184,234),xy(235,234),xy(250,240),xy(280,240)]).
fillpoint(r2, xy(184,235), 15.0).
fillpoint(r2, xy(174,239), 11.0).
fillpoint(r2, xy(245,239), 11.0).
fillpoint(r2, xy(149,240), 10.0).
fillpoint(r2, xy(251,240), 10.0).
region(r24, '#5a5a5a', 2400, centroid(490,620)).
perimeter(r24, 280).
polygon(r24, [xy(549,630),xy(430,630),xy(430,610),xy(549,610),xy(549,630)]).
midline(r24, [xy(484,620),xy(439,620)]).
midline(r24, [xy(485,619),xy(540,620)]).
fillpoint(r24, xy(439,620), 10.0).
region(r12, '#870c25', 1500, centroid(214,434)).
perimeter(r12, 160).
polygon(r12, [xy(239,450),xy(190,450),xy(190,420),xy(239,420),xy(239,450)]).
midline(r12, [xy(223,435),xy(204,435)]).
midline(r12, [xy(224,435),xy(225,435)]).
fillpoint(r12, xy(204,435), 15.0).
region(r19, '#7fdbff', 1200, centroid(73,566)).
perimeter(r19, 160).
polygon(r19, [xy(89,590),xy(70,590),xy(70,570),xy(50,569),xy(50,550),xy(90,550),xy(89,590)]).
midline(r19, [xy(78,563),xy(75,560),xy(59,560)]).
midline(r19, [xy(79,564),xy(80,580)]).
fillpoint(r19, xy(78,561), 12.0).
fillpoint(r19, xy(74,560), 11.0).
fillpoint(r19, xy(79,565), 11.0).
fillpoint(r19, xy(59,560), 10.0).
fillpoint(r19, xy(79,576), 10.0).
region(r7, '#bebebe', 1000, centroid(214,410)).
perimeter(r7, 140).
polygon(r7, [xy(239,420),xy(190,420),xy(190,400),xy(239,400),xy(239,420)]).
midline(r7, [xy(209,410),xy(199,410)]).
midline(r7, [xy(210,409),xy(230,410)]).
fillpoint(r7, xy(199,410), 10.0).
region(r14, '#5a5a5a', 800, centroid(164,474)).
perimeter(r14, 160).
polygon(r14, [xy(179,490),xy(150,489),xy(150,460),xy(180,460),xy(179,490)]).
hole(r14, [xy(170,479),xy(169,470),xy(160,470),xy(160,480),xy(170,479)]).
midline(r14, [xy(174,482),xy(175,471),xy(173,465),xy(155,465),xy(154,474),xy(155,484),xy(174,484)]).
fillpoint(r14, xy(156,465), 6.0).
fillpoint(r14, xy(174,465), 6.0).
fillpoint(r14, xy(155,484), 6.0).
fillpoint(r14, xy(173,484), 6.0).
fillpoint(r14, xy(161,465), 5.0).
fillpoint(r14, xy(154,475), 5.0).
fillpoint(r14, xy(174,475), 5.0).
fillpoint(r14, xy(161,485), 5.0).
region(r5, '#0074d9', 500, centroid(364,354)).
perimeter(r5, 120).
polygon(r5, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r5, [xy(359,354),xy(344,355)]).
midline(r5, [xy(360,355),xy(385,355)]).
fillpoint(r5, xy(344,355), 5.0).
region(r17, '#7fdbff', 500, centroid(312,526)).
perimeter(r17, 120).
polygon(r17, [xy(329,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r17, [xy(305,521),xy(305,514)]).
midline(r17, [xy(305,522),xy(305,524),xy(314,525),xy(315,534),xy(325,535)]).
fillpoint(r17, xy(305,524), 6.0).
fillpoint(r17, xy(314,525), 6.0).
fillpoint(r17, xy(315,534), 6.0).
fillpoint(r17, xy(305,516), 5.0).
fillpoint(r17, xy(321,535), 5.0).
region(r20, '#7fdbff', 400, centroid(40,580)).
perimeter(r20, 80).
polygon(r20, [xy(49,590),xy(30,589),xy(30,570),xy(50,570),xy(49,590)]).
midline(r20, [xy(39,579),xy(40,580)]).
fillpoint(r20, xy(39,580), 10.0).
region(r21, '#aaaaaa', 400, centroid(60,580)).
perimeter(r21, 80).
polygon(r21, [xy(69,590),xy(50,589),xy(50,570),xy(70,570),xy(69,590)]).
midline(r21, [xy(59,579),xy(60,580)]).
fillpoint(r21, xy(59,580), 10.0).
region(r22, '#7fdbff', 400, centroid(60,600)).
perimeter(r22, 80).
polygon(r22, [xy(69,610),xy(50,609),xy(50,590),xy(70,590),xy(69,610)]).
midline(r22, [xy(59,599),xy(60,600)]).
fillpoint(r22, xy(59,600), 10.0).
region(r25, '#7fdbff', 400, centroid(570,620)).
perimeter(r25, 80).
polygon(r25, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r25, [xy(569,619),xy(570,620)]).
fillpoint(r25, xy(569,620), 10.0).
region(r26, '#7fdbff', 400, centroid(600,620)).
perimeter(r26, 80).
polygon(r26, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r26, [xy(599,619),xy(600,620)]).
fillpoint(r26, xy(599,620), 10.0).
region(r27, '#2ecc40', 400, centroid(630,620)).
perimeter(r27, 80).
polygon(r27, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r27, [xy(629,619),xy(630,620)]).
fillpoint(r27, xy(629,620), 10.0).
border(r27).
region(r15, '#2ecc40', 100, centroid(164,474)).
perimeter(r15, 40).
polygon(r15, [xy(169,480),xy(160,479),xy(160,470),xy(170,470),xy(169,480)]).
midline(r15, [xy(165,475),xy(165,474)]).
fillpoint(r15, xy(164,475), 5.0).
region(r18, '#7fdbff', 100, centroid(324,514)).
perimeter(r18, 40).
polygon(r18, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r18, [xy(325,515),xy(325,514)]).
fillpoint(r18, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 180).
adjacent(r1, r3).
shared_edge(r1, r3, 450).
adjacent(r1, r4).
shared_edge(r1, r4, 720).
adjacent(r1, r6).
shared_edge(r1, r6, 150).
adjacent(r1, r19).
shared_edge(r1, r19, 120).
adjacent(r1, r20).
shared_edge(r1, r20, 60).
adjacent(r1, r22).
shared_edge(r1, r22, 60).
adjacent(r1, r23).
shared_edge(r1, r23, 620).
adjacent(r1, r24).
shared_edge(r1, r24, 260).
adjacent(r1, r25).
shared_edge(r1, r25, 80).
adjacent(r1, r26).
shared_edge(r1, r26, 80).
adjacent(r1, r27).
shared_edge(r1, r27, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 180).
adjacent(r3, r4).
shared_edge(r3, r4, 1100).
adjacent(r3, r5).
shared_edge(r3, r5, 70).
adjacent(r3, r6).
shared_edge(r3, r6, 320).
adjacent(r3, r7).
shared_edge(r3, r7, 70).
adjacent(r3, r12).
shared_edge(r3, r12, 30).
adjacent(r3, r14).
shared_edge(r3, r14, 120).
adjacent(r3, r16).
shared_edge(r3, r16, 280).
adjacent(r4, r7).
shared_edge(r4, r7, 20).
adjacent(r4, r12).
shared_edge(r4, r12, 80).
adjacent(r5, r6).
shared_edge(r5, r6, 50).
adjacent(r7, r12).
shared_edge(r7, r12, 50).
adjacent(r14, r15).
shared_edge(r14, r15, 40).
adjacent(r16, r17).
shared_edge(r16, r17, 120).
adjacent(r16, r18).
shared_edge(r16, r18, 40).
adjacent(r19, r21).
shared_edge(r19, r21, 40).
adjacent(r20, r21).
shared_edge(r20, r21, 20).
adjacent(r21, r22).
shared_edge(r21, r22, 20).
adjacent(r23, r24).
shared_edge(r23, r24, 20).

encloses(r14, r15).
encloses(r16, r17).
encloses(r16, r18).
encloses(r1, r25).
encloses(r1, r26).
