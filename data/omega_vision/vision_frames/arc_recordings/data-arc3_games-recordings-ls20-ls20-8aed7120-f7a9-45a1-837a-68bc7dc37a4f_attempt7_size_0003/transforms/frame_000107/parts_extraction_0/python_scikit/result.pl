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

region(r1, '#aaaaaa', 273700, centroid(324,263)).
perimeter(r1, 5540).
polygon(r1, [xy(410,599),xy(410,590),xy(419,590),xy(420,580),xy(439,580),xy(440,570),xy(449,570),xy(450,560),xy(459,560),xy(460,550),xy(470,549),xy(470,530),xy(479,530),xy(480,520),xy(490,519),xy(490,500),xy(500,499),xy(500,460),xy(510,459),xy(510,380),xy(500,379),xy(500,340),xy(490,339),xy(490,320),xy(480,320),xy(480,310),xy(470,309),xy(470,290),xy(460,290),xy(460,280),xy(450,280),xy(450,270),xy(440,269),xy(439,260),xy(420,260),xy(420,250),xy(410,250),xy(409,240),xy(390,240),xy(389,230),xy(350,230),xy(349,220),xy(270,220),xy(269,230),xy(230,230),xy(229,240),xy(210,240),xy(210,249),xy(200,250),xy(199,260),xy(180,260),xy(180,269),xy(170,270),xy(170,279),xy(160,280),xy(160,289),xy(150,290),xy(150,309),xy(140,310),xy(139,320),xy(130,320),xy(130,339),xy(120,340),xy(120,379),xy(110,380),xy(110,429),xy(119,430),xy(120,439),xy(110,440),xy(110,459),xy(120,460),xy(120,499),xy(130,500),xy(130,519),xy(139,520),xy(140,529),xy(150,530),xy(150,549),xy(159,550),xy(160,559),xy(169,560),xy(170,569),xy(180,570),xy(180,580),xy(199,580),xy(200,589),xy(209,590),xy(210,600),xy(410,599)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(420,141),xy(387,172),xy(383,170),xy(386,165),xy(386,157),xy(425,118),xy(419,116),xy(342,109),xy(250,110),xy(223,115),xy(193,117),xy(132,132),xy(106,182),xy(85,233),xy(62,314),xy(59,340),xy(62,341),xy(59,344),xy(54,380),xy(54,429),xy(56,435),xy(54,440),xy(54,459),xy(59,490),xy(23,527),xy(17,537),xy(14,550),xy(14,588),xy(17,602),xy(27,616),xy(43,624),xy(89,625),xy(106,620),xy(109,617),xy(111,598),xy(119,581),xy(118,579),xy(81,580),xy(59,560),xy(60,491)]).
midline(r1, [xy(83,245),xy(127,291)]).
midline(r1, [xy(385,172),xy(380,177),xy(378,191),xy(374,195),xy(375,197),xy(378,194),xy(380,188)]).
midline(r1, [xy(61,344),xy(64,343),xy(61,346)]).
midline(r1, [xy(62,492),xy(64,494),xy(68,490),xy(79,486),xy(77,490),xy(68,492),xy(65,495),xy(68,494)]).
midline(r1, [xy(388,157),xy(426,117)]).
midline(r1, [xy(428,118),xy(387,161),xy(389,162),xy(386,169),xy(435,120),xy(430,118)]).
midline(r1, [xy(436,119),xy(437,121),xy(388,170)]).
midline(r1, [xy(438,120),xy(440,121),xy(421,140)]).
midline(r1, [xy(64,347),xy(67,347),xy(65,344)]).
midline(r1, [xy(67,349),xy(69,348),xy(67,344)]).
midline(r1, [xy(69,344),xy(73,347),xy(70,349)]).
midline(r1, [xy(109,619),xy(124,633),xy(131,635),xy(553,634),xy(555,631),xy(555,542),xy(541,549),xy(508,518)]).
midline(r1, [xy(555,633),xy(560,635),xy(578,635),xy(585,632),xy(584,562),xy(586,556),xy(565,535),xy(555,540)]).
midline(r1, [xy(383,175),xy(380,186)]).
midline(r1, [xy(384,177),xy(384,179)]).
midline(r1, [xy(431,120),xy(390,161)]).
midline(r1, [xy(81,486),xy(81,488)]).
midline(r1, [xy(587,557),xy(615,585),xy(615,630),xy(613,634),xy(607,635),xy(585,633)]).
midline(r1, [xy(386,177),xy(388,173)]).
midline(r1, [xy(67,497),xy(84,512),xy(98,520),xy(103,526),xy(110,517),xy(103,523)]).
midline(r1, [xy(104,527),xy(115,541),xy(121,554),xy(120,559),xy(124,575),xy(120,579)]).
midline(r1, [xy(125,575),xy(133,576),xy(138,580),xy(173,594),xy(185,594),xy(194,599),xy(200,599),xy(210,605),xy(408,605),xy(415,603),xy(419,599),xy(425,599),xy(434,594),xy(446,594),xy(472,582),xy(479,581),xy(486,576),xy(505,569),xy(517,560),xy(540,550)]).
midline(r1, [xy(112,517),xy(111,516)]).
midline(r1, [xy(441,120),xy(502,137),xy(521,173),xy(524,185),xy(528,190),xy(530,199),xy(544,229),xy(566,307),xy(569,341),xy(552,349),xy(550,347),xy(546,351),xy(528,356),xy(524,360)]).
midline(r1, [xy(561,346),xy(563,345)]).
midline(r1, [xy(568,344),xy(570,344),xy(573,358),xy(575,380),xy(574,475),xy(569,496),xy(554,493),xy(543,487),xy(535,487),xy(542,492),xy(544,490),xy(544,494),xy(548,494),xy(546,492)]).
midline(r1, [xy(552,493),xy(550,492)]).
midline(r1, [xy(570,497),xy(565,534)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(57,435),xy(115,435)]).
midline(r1, [xy(233,161),xy(231,158),xy(232,153),xy(198,119),xy(231,150)]).
midline(r1, [xy(234,162),xy(234,170),xy(236,169)]).
midline(r1, [xy(236,172),xy(238,174)]).
midline(r1, [xy(238,176),xy(240,185),xy(250,205),xy(249,207),xy(251,207)]).
midline(r1, [xy(75,351),xy(73,349),xy(73,351)]).
midline(r1, [xy(76,351),xy(78,350),xy(74,348)]).
midline(r1, [xy(78,352),xy(79,353)]).
fillpoint(r1, xy(502,137), 138.0).
fillpoint(r1, xy(132,132), 133.0).
fillpoint(r1, xy(142,129), 130.0).
fillpoint(r1, xy(477,129), 130.0).
fillpoint(r1, xy(154,126), 127.0).
fillpoint(r1, xy(465,126), 127.0).
fillpoint(r1, xy(158,125), 126.0).
fillpoint(r1, xy(461,125), 126.0).
fillpoint(r1, xy(163,124), 125.0).
fillpoint(r1, xy(456,124), 125.0).
fillpoint(r1, xy(167,123), 124.0).
fillpoint(r1, xy(452,123), 124.0).
fillpoint(r1, xy(171,122), 123.0).
fillpoint(r1, xy(448,122), 123.0).
fillpoint(r1, xy(175,121), 122.0).
fillpoint(r1, xy(444,121), 122.0).
fillpoint(r1, xy(179,120), 121.0).
fillpoint(r1, xy(440,120), 121.0).
fillpoint(r1, xy(184,119), 120.0).
fillpoint(r1, xy(435,119), 120.0).
fillpoint(r1, xy(189,118), 119.0).
fillpoint(r1, xy(430,118), 119.0).
fillpoint(r1, xy(195,117), 118.0).
fillpoint(r1, xy(424,117), 118.0).
fillpoint(r1, xy(202,116), 117.0).
fillpoint(r1, xy(417,116), 117.0).
fillpoint(r1, xy(212,115), 116.0).
fillpoint(r1, xy(407,115), 116.0).
fillpoint(r1, xy(524,181), 116.0).
fillpoint(r1, xy(225,114), 115.0).
fillpoint(r1, xy(394,114), 115.0).
fillpoint(r1, xy(230,113), 114.0).
fillpoint(r1, xy(389,113), 114.0).
fillpoint(r1, xy(236,112), 113.0).
fillpoint(r1, xy(384,112), 113.0).
fillpoint(r1, xy(243,111), 112.0).
fillpoint(r1, xy(376,111), 112.0).
fillpoint(r1, xy(253,110), 111.0).
fillpoint(r1, xy(366,110), 111.0).
fillpoint(r1, xy(271,110), 110.0).
fillpoint(r1, xy(544,230), 96.0).
fillpoint(r1, xy(545,233), 95.0).
fillpoint(r1, xy(546,236), 94.0).
fillpoint(r1, xy(547,239), 93.0).
fillpoint(r1, xy(549,246), 91.0).
fillpoint(r1, xy(550,250), 90.0).
fillpoint(r1, xy(551,255), 89.0).
fillpoint(r1, xy(86,231), 87.0).
fillpoint(r1, xy(553,261), 87.0).
fillpoint(r1, xy(80,249), 81.0).
fillpoint(r1, xy(559,279), 81.0).
fillpoint(r1, xy(79,253), 80.0).
fillpoint(r1, xy(560,283), 80.0).
fillpoint(r1, xy(78,257), 79.0).
fillpoint(r1, xy(561,287), 79.0).
fillpoint(r1, xy(77,262), 78.0).
fillpoint(r1, xy(562,292), 78.0).
fillpoint(r1, xy(563,297), 77.0).
fillpoint(r1, xy(565,304), 75.0).
fillpoint(r1, xy(565,535), 75.0).
fillpoint(r1, xy(566,308), 74.0).
fillpoint(r1, xy(566,531), 74.0).
fillpoint(r1, xy(567,313), 73.0).
fillpoint(r1, xy(567,526), 73.0).
fillpoint(r1, xy(568,319), 72.0).
fillpoint(r1, xy(568,521), 72.0).
fillpoint(r1, xy(70,282), 71.0).
fillpoint(r1, xy(569,327), 71.0).
fillpoint(r1, xy(569,513), 71.0).
fillpoint(r1, xy(69,285), 70.0).
fillpoint(r1, xy(569,343), 70.0).
fillpoint(r1, xy(569,497), 70.0).
fillpoint(r1, xy(68,289), 69.0).
fillpoint(r1, xy(571,349), 69.0).
fillpoint(r1, xy(571,490), 69.0).
fillpoint(r1, xy(67,294), 68.0).
fillpoint(r1, xy(572,354), 68.0).
fillpoint(r1, xy(572,485), 68.0).
fillpoint(r1, xy(66,300), 67.0).
fillpoint(r1, xy(573,360), 67.0).
fillpoint(r1, xy(573,480), 67.0).
fillpoint(r1, xy(574,367), 66.0).
fillpoint(r1, xy(574,473), 66.0).
fillpoint(r1, xy(64,307), 65.0).
fillpoint(r1, xy(574,420), 65.0).
fillpoint(r1, xy(62,315), 63.0).
fillpoint(r1, xy(61,320), 62.0).
fillpoint(r1, xy(60,328), 61.0).
fillpoint(r1, xy(60,344), 60.0).
fillpoint(r1, xy(59,491), 59.8).
fillpoint(r1, xy(58,352), 59.0).
fillpoint(r1, xy(58,487), 59.0).
fillpoint(r1, xy(57,356), 58.0).
fillpoint(r1, xy(57,483), 58.0).
fillpoint(r1, xy(56,361), 57.0).
fillpoint(r1, xy(56,478), 57.0).
fillpoint(r1, xy(55,368), 56.0).
fillpoint(r1, xy(55,471), 56.0).
fillpoint(r1, xy(55,435), 55.2).
fillpoint(r1, xy(54,405), 55.0).
fillpoint(r1, xy(54,450), 55.0).
fillpoint(r1, xy(124,575), 35.5).
border(r1).
region(r7, '#ffdc00', 51000, centroid(294,470)).
perimeter(r7, 2200).
polygon(r7, [xy(409,600),xy(210,600),xy(210,590),xy(200,590),xy(199,580),xy(180,580),xy(180,570),xy(170,570),xy(170,560),xy(160,560),xy(160,550),xy(150,549),xy(150,530),xy(140,530),xy(140,520),xy(130,519),xy(130,500),xy(120,499),xy(120,460),xy(110,460),xy(110,450),xy(140,450),xy(140,500),xy(189,500),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,310),xy(149,310),xy(150,300),xy(290,300),xy(290,479),xy(270,480),xy(270,570),xy(360,569),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,549),xy(459,550),xy(460,559),xy(450,560),xy(450,569),xy(440,570),xy(439,580),xy(420,580),xy(420,589),xy(410,590),xy(409,600)]).
midline(r7, [xy(130,459),xy(123,455),xy(114,455)]).
midline(r7, [xy(130,461),xy(129,490),xy(133,494),xy(139,510)]).
midline(r7, [xy(141,510),xy(162,517),xy(172,523),xy(174,526),xy(171,531),xy(175,526)]).
midline(r7, [xy(177,528),xy(201,538),xy(220,537),xy(229,511),xy(229,489),xy(264,455),xy(265,351),xy(260,329),xy(249,325),xy(169,324),xy(163,327)]).
midline(r7, [xy(221,537),xy(233,563),xy(247,576),xy(263,584),xy(359,585),xy(376,580),xy(389,569),xy(400,544),xy(400,490),xy(364,455),xy(365,384)]).
midline(r7, [xy(401,545),xy(422,560),xy(440,560),xy(446,555),xy(455,555)]).
midline(r7, [xy(388,572),xy(388,575),xy(390,575)]).
midline(r7, [xy(401,490),xy(412,482),xy(430,475),xy(465,475)]).
fillpoint(r7, xy(221,536), 48.9).
fillpoint(r7, xy(225,526), 45.0).
fillpoint(r7, xy(226,523), 44.0).
fillpoint(r7, xy(228,515), 42.0).
fillpoint(r7, xy(400,491), 41.0).
fillpoint(r7, xy(229,509), 41.0).
fillpoint(r7, xy(229,494), 40.0).
fillpoint(r7, xy(400,523), 40.0).
fillpoint(r7, xy(260,329), 29.7).
fillpoint(r7, xy(258,328), 29.0).
fillpoint(r7, xy(261,331), 29.0).
fillpoint(r7, xy(421,478), 29.0).
fillpoint(r7, xy(178,528), 29.0).
fillpoint(r7, xy(255,327), 28.0).
fillpoint(r7, xy(262,334), 28.0).
fillpoint(r7, xy(424,477), 28.0).
fillpoint(r7, xy(252,326), 27.0).
fillpoint(r7, xy(263,337), 27.0).
fillpoint(r7, xy(427,476), 27.0).
fillpoint(r7, xy(248,325), 26.0).
fillpoint(r7, xy(264,342), 26.0).
fillpoint(r7, xy(432,475), 26.0).
fillpoint(r7, xy(264,455), 25.7).
fillpoint(r7, xy(365,455), 25.7).
fillpoint(r7, xy(169,325), 25.0).
fillpoint(r7, xy(264,400), 25.0).
fillpoint(r7, xy(365,416), 25.0).
fillpoint(r7, xy(441,475), 25.0).
fillpoint(r7, xy(155,515), 16.0).
fillpoint(r7, xy(264,584), 16.0).
fillpoint(r7, xy(365,584), 16.0).
fillpoint(r7, xy(271,585), 15.0).
region(r3, '#2ecc40', 37800, centroid(367,332)).
perimeter(r3, 1440).
polygon(r3, [xy(499,500),xy(490,499),xy(489,450),xy(390,449),xy(389,350),xy(340,350),xy(340,399),xy(290,400),xy(289,300),xy(150,300),xy(150,290),xy(159,290),xy(160,280),xy(169,280),xy(170,270),xy(180,269),xy(180,260),xy(199,260),xy(200,250),xy(289,250),xy(290,220),xy(300,220),xy(300,240),xy(329,240),xy(330,220),xy(349,220),xy(350,230),xy(389,230),xy(390,240),xy(409,240),xy(410,249),xy(419,250),xy(420,260),xy(440,260),xy(440,349),xy(489,350),xy(490,340),xy(500,340),xy(500,379),xy(510,380),xy(510,459),xy(500,460),xy(499,500)]).
midline(r3, [xy(439,400),xy(419,371),xy(415,359),xy(414,340),xy(407,322),xy(389,299),xy(376,293),xy(365,292),xy(359,289),xy(358,291),xy(345,294),xy(313,274),xy(219,274),xy(211,278),xy(195,280),xy(175,289),xy(169,289),xy(163,294),xy(154,295)]).
midline(r3, [xy(315,274),xy(307,258),xy(295,243),xy(295,224)]).
midline(r3, [xy(219,273),xy(221,273)]).
midline(r3, [xy(344,295),xy(327,314),xy(317,333),xy(314,352),xy(315,375)]).
midline(r3, [xy(441,399),xy(450,400),xy(459,392),xy(490,359),xy(494,353),xy(495,344)]).
midline(r3, [xy(360,288),xy(359,272),xy(355,266),xy(355,261),xy(343,242),xy(340,229)]).
midline(r3, [xy(358,268),xy(357,265)]).
midline(r3, [xy(360,274),xy(362,270),xy(360,268),xy(364,263),xy(365,265),xy(362,268)]).
midline(r3, [xy(453,400),xy(468,407),xy(495,436),xy(499,444),xy(500,450),xy(494,460),xy(495,495)]).
midline(r3, [xy(469,406),xy(474,404),xy(471,408)]).
fillpoint(r3, xy(360,290), 59.2).
fillpoint(r3, xy(357,291), 59.0).
fillpoint(r3, xy(362,291), 59.0).
fillpoint(r3, xy(353,292), 58.0).
fillpoint(r3, xy(366,292), 58.0).
fillpoint(r3, xy(348,293), 57.0).
fillpoint(r3, xy(371,293), 57.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(318,331), 29.0).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(317,334), 28.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(316,337), 27.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(315,342), 26.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(219,275), 25.0).
fillpoint(r3, xy(315,363), 25.0).
fillpoint(r3, xy(206,279), 21.0).
fillpoint(r3, xy(196,280), 20.0).
fillpoint(r3, xy(185,284), 16.0).
region(r9, '#2ecc40', 14600, centroid(174,410)).
perimeter(r9, 780).
polygon(r9, [xy(189,500),xy(140,500),xy(140,450),xy(110,449),xy(110,440),xy(130,439),xy(130,410),xy(110,409),xy(110,380),xy(120,379),xy(120,340),xy(130,339),xy(130,320),xy(140,320),xy(140,350),xy(240,350),xy(240,449),xy(190,450),xy(189,500)]).
hole(r9, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r9, [xy(230,440),xy(223,444),xy(206,444),xy(192,433),xy(164,424),xy(148,432),xy(133,444),xy(114,445)]).
midline(r9, [xy(230,438),xy(235,428),xy(234,416),xy(224,404),xy(220,393),xy(209,379),xy(185,381),xy(164,390),xy(156,386),xy(134,363),xy(129,349),xy(135,339),xy(135,324)]).
midline(r9, [xy(164,391),xy(165,423)]).
midline(r9, [xy(224,405),xy(195,434)]).
midline(r9, [xy(165,426),xy(165,475)]).
midline(r9, [xy(153,385),xy(124,395)]).
fillpoint(r9, xy(165,390), 40.3).
fillpoint(r9, xy(165,425), 35.4).
fillpoint(r9, xy(164,415), 35.0).
fillpoint(r9, xy(186,381), 32.0).
fillpoint(r9, xy(192,380), 31.0).
fillpoint(r9, xy(201,380), 30.0).
fillpoint(r9, xy(165,463), 25.0).
fillpoint(r9, xy(125,394), 16.0).
fillpoint(r9, xy(224,404), 16.0).
fillpoint(r9, xy(194,434), 16.0).
fillpoint(r9, xy(130,354), 11.0).
region(r26, '#5a5a5a', 4800, centroid(430,620)).
perimeter(r26, 520).
polygon(r26, [xy(549,630),xy(310,630),xy(310,610),xy(549,610),xy(549,630)]).
midline(r26, [xy(470,620),xy(319,620)]).
midline(r26, [xy(471,619),xy(540,620)]).
fillpoint(r26, xy(319,620), 10.0).
region(r18, '#2ecc40', 4700, centroid(314,505)).
perimeter(r18, 700).
polygon(r18, [xy(359,570),xy(270,569),xy(270,480),xy(290,479),xy(290,450),xy(339,450),xy(340,479),xy(360,480),xy(359,570)]).
hole(r18, [xy(350,559),xy(349,490),xy(280,490),xy(280,560),xy(350,559)]).
midline(r18, [xy(307,472),xy(293,484),xy(275,485),xy(275,564),xy(353,564),xy(355,558),xy(354,486),xy(336,484),xy(318,469),xy(309,469),xy(308,471)]).
fillpoint(r18, xy(309,470), 20.0).
fillpoint(r18, xy(276,485), 6.0).
fillpoint(r18, xy(354,485), 6.0).
fillpoint(r18, xy(275,564), 6.0).
fillpoint(r18, xy(353,564), 6.0).
fillpoint(r18, xy(281,485), 5.0).
fillpoint(r18, xy(341,485), 5.0).
fillpoint(r18, xy(274,525), 5.0).
fillpoint(r18, xy(354,525), 5.0).
fillpoint(r18, xy(281,565), 5.0).
region(r19, '#aaaaaa', 4300, centroid(314,524)).
perimeter(r19, 440).
polygon(r19, [xy(349,560),xy(280,559),xy(280,490),xy(350,490),xy(349,560)]).
hole(r19, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(330,519),xy(329,510),xy(320,510),xy(319,520),xy(310,520),xy(309,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(330,539)]).
midline(r19, [xy(339,542),xy(339,526),xy(337,524),xy(325,525),xy(314,514),xy(314,515)]).
midline(r19, [xy(315,513),xy(313,500),xy(300,499),xy(291,501),xy(289,529),xy(294,543),xy(310,550),xy(335,549),xy(339,543)]).
midline(r19, [xy(315,500),xy(329,499),xy(338,501),xy(340,511),xy(339,524)]).
fillpoint(r19, xy(295,544), 15.8).
fillpoint(r19, xy(292,501), 12.0).
fillpoint(r19, xy(338,501), 12.0).
fillpoint(r19, xy(337,548), 12.0).
fillpoint(r19, xy(295,500), 11.0).
fillpoint(r19, xy(315,500), 11.0).
fillpoint(r19, xy(334,500), 11.0).
fillpoint(r19, xy(290,505), 11.0).
fillpoint(r19, xy(339,505), 11.0).
fillpoint(r19, xy(339,525), 11.0).
fillpoint(r19, xy(290,534), 11.0).
fillpoint(r19, xy(339,544), 11.0).
fillpoint(r19, xy(305,549), 11.0).
fillpoint(r19, xy(334,549), 11.0).
fillpoint(r19, xy(301,500), 10.0).
fillpoint(r19, xy(321,500), 10.0).
fillpoint(r19, xy(289,520), 10.0).
fillpoint(r19, xy(339,515), 10.0).
fillpoint(r19, xy(339,535), 10.0).
fillpoint(r19, xy(311,550), 10.0).
fillpoint(r19, xy(315,513), 5.0).
fillpoint(r19, xy(324,525), 5.0).
region(r25, '#2ecc40', 3600, centroid(220,620)).
perimeter(r25, 400).
polygon(r25, [xy(309,630),xy(130,630),xy(130,610),xy(309,610),xy(309,630)]).
midline(r25, [xy(290,620),xy(139,620)]).
midline(r25, [xy(291,620),xy(300,620)]).
fillpoint(r25, xy(139,620), 10.0).
region(r6, '#ffdc00', 2300, centroid(463,317)).
perimeter(r6, 260).
polygon(r6, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,270),xy(449,270),xy(450,279),xy(459,280),xy(460,289),xy(470,290),xy(470,309),xy(479,310),xy(480,320),xy(490,320),xy(489,350)]).
midline(r6, [xy(475,334),xy(467,331),xy(460,315),xy(459,299),xy(446,285),xy(445,274)]).
fillpoint(r6, xy(467,332), 18.0).
fillpoint(r6, xy(465,325), 16.0).
fillpoint(r6, xy(474,334), 16.0).
fillpoint(r6, xy(460,314), 11.0).
fillpoint(r6, xy(450,290), 10.0).
fillpoint(r6, xy(459,299), 10.0).
fillpoint(r6, xy(459,305), 10.0).
fillpoint(r6, xy(445,276), 5.0).
region(r20, '#2ecc40', 2000, centroid(460,522)).
perimeter(r20, 200).
polygon(r20, [xy(469,550),xy(440,549),xy(440,500),xy(490,500),xy(490,519),xy(480,520),xy(480,529),xy(470,530),xy(469,550)]).
midline(r20, [xy(468,513),xy(457,517),xy(455,535)]).
midline(r20, [xy(469,513),xy(474,510),xy(480,510)]).
fillpoint(r20, xy(457,517), 18.0).
fillpoint(r20, xy(464,515), 16.0).
fillpoint(r20, xy(455,524), 16.0).
fillpoint(r20, xy(455,533), 15.0).
fillpoint(r20, xy(475,510), 11.0).
region(r23, '#7fdbff', 2000, centroid(56,584)).
perimeter(r23, 240).
polygon(r23, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r23, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r23, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r23, xy(41,578), 12.0).
fillpoint(r23, xy(58,581), 12.0).
fillpoint(r23, xy(61,598), 12.0).
fillpoint(r23, xy(40,574), 11.0).
fillpoint(r23, xy(45,579), 11.0).
fillpoint(r23, xy(54,580), 11.0).
fillpoint(r23, xy(59,585), 11.0).
fillpoint(r23, xy(60,594), 11.0).
fillpoint(r23, xy(65,599), 11.0).
fillpoint(r23, xy(39,564), 10.0).
fillpoint(r23, xy(71,600), 10.0).
region(r2, '#ffdc00', 1600, centroid(257,238)).
perimeter(r2, 220).
polygon(r2, [xy(289,250),xy(210,250),xy(210,240),xy(229,240),xy(230,230),xy(269,230),xy(270,220),xy(289,220),xy(289,250)]).
midline(r2, [xy(271,239),xy(239,239),xy(229,245),xy(214,245)]).
midline(r2, [xy(272,239),xy(278,237),xy(280,229)]).
fillpoint(r2, xy(277,238), 12.0).
fillpoint(r2, xy(279,234), 11.0).
fillpoint(r2, xy(274,239), 11.0).
fillpoint(r2, xy(239,240), 10.0).
fillpoint(r2, xy(214,245), 5.0).
region(r17, '#870c25', 1500, centroid(314,434)).
perimeter(r17, 160).
polygon(r17, [xy(339,450),xy(290,450),xy(290,420),xy(339,420),xy(339,450)]).
midline(r17, [xy(310,435),xy(304,435)]).
midline(r17, [xy(311,434),xy(325,435)]).
fillpoint(r17, xy(304,435), 15.0).
region(r11, '#bebebe', 1000, centroid(314,410)).
perimeter(r11, 140).
polygon(r11, [xy(339,420),xy(290,420),xy(290,400),xy(339,400),xy(339,420)]).
midline(r11, [xy(320,410),xy(299,410)]).
midline(r11, [xy(321,410),xy(330,410)]).
fillpoint(r11, xy(299,410), 10.0).
region(r4, '#5a5a5a', 500, centroid(314,230)).
perimeter(r4, 120).
polygon(r4, [xy(329,240),xy(300,240),xy(300,220),xy(309,220),xy(310,229),xy(319,230),xy(320,220),xy(329,220),xy(329,240)]).
midline(r4, [xy(305,231),xy(305,224)]).
midline(r4, [xy(305,232),xy(305,234),xy(310,235),xy(323,234),xy(325,224)]).
fillpoint(r4, xy(305,234), 6.0).
fillpoint(r4, xy(323,234), 6.0).
fillpoint(r4, xy(305,226), 5.0).
fillpoint(r4, xy(325,226), 5.0).
fillpoint(r4, xy(311,235), 5.0).
region(r8, '#0074d9', 500, centroid(444,324)).
perimeter(r8, 120).
polygon(r8, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r8, [xy(445,317),xy(445,345)]).
midline(r8, [xy(445,316),xy(445,304)]).
fillpoint(r8, xy(444,325), 5.0).
region(r10, '#0074d9', 500, centroid(364,354)).
perimeter(r10, 120).
polygon(r10, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r10, [xy(370,354),xy(344,355)]).
midline(r10, [xy(371,355),xy(385,355)]).
fillpoint(r10, xy(344,355), 5.0).
region(r21, '#7fdbff', 500, centroid(312,526)).
perimeter(r21, 120).
polygon(r21, [xy(329,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r21, [xy(305,521),xy(305,514)]).
midline(r21, [xy(305,522),xy(305,524),xy(314,525),xy(315,534),xy(325,535)]).
fillpoint(r21, xy(305,524), 6.0).
fillpoint(r21, xy(314,525), 6.0).
fillpoint(r21, xy(315,534), 6.0).
fillpoint(r21, xy(305,516), 5.0).
fillpoint(r21, xy(321,535), 5.0).
region(r24, '#7fdbff', 400, centroid(80,560)).
perimeter(r24, 80).
polygon(r24, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r24, [xy(79,559),xy(80,560)]).
fillpoint(r24, xy(79,560), 10.0).
region(r27, '#7fdbff', 400, centroid(570,620)).
perimeter(r27, 80).
polygon(r27, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r27, [xy(569,619),xy(570,620)]).
fillpoint(r27, xy(569,620), 10.0).
region(r28, '#7fdbff', 400, centroid(600,620)).
perimeter(r28, 80).
polygon(r28, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r28, [xy(599,619),xy(600,620)]).
fillpoint(r28, xy(599,620), 10.0).
region(r29, '#2ecc40', 400, centroid(630,620)).
perimeter(r29, 80).
polygon(r29, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r29, [xy(629,619),xy(630,620)]).
fillpoint(r29, xy(629,620), 10.0).
border(r29).
region(r16, '#000000', 300, centroid(218,428)).
perimeter(r16, 80).
polygon(r16, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r16, [xy(215,431),xy(215,425),xy(225,425)]).
midline(r16, [xy(214,432),xy(215,435)]).
fillpoint(r16, xy(216,425), 6.0).
fillpoint(r16, xy(221,425), 5.0).
fillpoint(r16, xy(215,433), 5.0).
region(r13, '#000000', 100, centroid(204,414)).
perimeter(r13, 40).
polygon(r13, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r13, [xy(205,415),xy(205,414)]).
fillpoint(r13, xy(204,415), 5.0).
region(r22, '#7fdbff', 100, centroid(324,514)).
perimeter(r22, 40).
polygon(r22, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r22, [xy(325,515),xy(325,514)]).
fillpoint(r22, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 110).
adjacent(r1, r3).
shared_edge(r1, r3, 480).
adjacent(r1, r4).
shared_edge(r1, r4, 20).
adjacent(r1, r6).
shared_edge(r1, r6, 120).
adjacent(r1, r7).
shared_edge(r1, r7, 580).
adjacent(r1, r9).
shared_edge(r1, r9, 140).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 240).
adjacent(r1, r24).
shared_edge(r1, r24, 80).
adjacent(r1, r25).
shared_edge(r1, r25, 380).
adjacent(r1, r26).
shared_edge(r1, r26, 500).
adjacent(r1, r27).
shared_edge(r1, r27, 80).
adjacent(r1, r28).
shared_edge(r1, r28, 80).
adjacent(r1, r29).
shared_edge(r1, r29, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 110).
adjacent(r3, r4).
shared_edge(r3, r4, 70).
adjacent(r3, r6).
shared_edge(r3, r6, 80).
adjacent(r3, r7).
shared_edge(r3, r7, 520).
adjacent(r3, r8).
shared_edge(r3, r8, 60).
adjacent(r3, r10).
shared_edge(r3, r10, 70).
adjacent(r3, r11).
shared_edge(r3, r11, 50).
adjacent(r6, r8).
shared_edge(r6, r8, 60).
adjacent(r7, r9).
shared_edge(r7, r9, 460).
adjacent(r7, r10).
shared_edge(r7, r10, 50).
adjacent(r7, r11).
shared_edge(r7, r11, 40).
adjacent(r7, r17).
shared_edge(r7, r17, 60).
adjacent(r7, r18).
shared_edge(r7, r18, 370).
adjacent(r7, r20).
shared_edge(r7, r20, 120).
adjacent(r9, r13).
shared_edge(r9, r13, 40).
adjacent(r9, r16).
shared_edge(r9, r16, 80).
adjacent(r11, r17).
shared_edge(r11, r17, 50).
adjacent(r17, r18).
shared_edge(r17, r18, 50).
adjacent(r18, r19).
shared_edge(r18, r19, 280).
adjacent(r19, r21).
shared_edge(r19, r21, 120).
adjacent(r19, r22).
shared_edge(r19, r22, 40).
adjacent(r25, r26).
shared_edge(r25, r26, 20).

encloses(r9, r13).
encloses(r9, r16).
encloses(r19, r21).
encloses(r19, r22).
encloses(r1, r23).
encloses(r1, r24).
encloses(r1, r27).
encloses(r1, r28).
