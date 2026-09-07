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

region(r1, '#aaaaaa', 271200, centroid(325,283)).
perimeter(r1, 5560).
polygon(r1, [xy(350,569),xy(350,560),xy(389,560),xy(390,550),xy(409,550),xy(410,540),xy(419,540),xy(420,530),xy(439,530),xy(440,520),xy(449,520),xy(450,510),xy(459,510),xy(460,500),xy(470,499),xy(470,480),xy(479,480),xy(480,470),xy(490,469),xy(490,450),xy(500,449),xy(500,410),xy(510,409),xy(510,330),xy(500,329),xy(500,290),xy(490,289),xy(490,270),xy(480,270),xy(479,260),xy(470,259),xy(470,240),xy(460,240),xy(460,230),xy(450,230),xy(449,220),xy(440,219),xy(439,210),xy(420,210),xy(420,200),xy(410,199),xy(409,190),xy(390,190),xy(389,180),xy(350,180),xy(348,170),xy(270,170),xy(269,180),xy(230,180),xy(229,190),xy(210,190),xy(210,199),xy(200,200),xy(199,210),xy(180,210),xy(180,219),xy(170,220),xy(170,229),xy(160,230),xy(159,240),xy(150,240),xy(150,259),xy(140,260),xy(140,269),xy(130,270),xy(130,289),xy(120,290),xy(120,329),xy(110,330),xy(110,349),xy(110,409),xy(120,410),xy(120,449),xy(130,450),xy(130,469),xy(139,470),xy(140,480),xy(150,480),xy(150,499),xy(159,500),xy(160,509),xy(169,510),xy(170,519),xy(179,520),xy(180,530),xy(199,530),xy(200,539),xy(209,540),xy(210,550),xy(229,550),xy(230,560),xy(269,560),xy(270,570),xy(350,569)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,570),xy(90,569),xy(89,550),xy(70,550),xy(69,570),xy(50,570),xy(49,550),xy(30,550),xy(30,589),xy(49,590),xy(50,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(114,114),xy(85,183),xy(77,214),xy(69,234),xy(60,275),xy(60,296),xy(56,310),xy(54,330),xy(54,406),xy(55,423),xy(60,444),xy(60,464),xy(65,484),xy(31,518),xy(17,537),xy(14,550),xy(14,589),xy(19,606),xy(33,620),xy(50,625),xy(84,625),xy(96,624),xy(109,617),xy(111,598),xy(119,581),xy(118,579),xy(81,580),xy(59,560),xy(59,492)]).
midline(r1, [xy(116,114),xy(148,106)]).
midline(r1, [xy(149,104),xy(198,92),xy(221,91),xy(252,85),xy(345,84),xy(367,85),xy(395,90),xy(388,99),xy(385,117),xy(382,121),xy(377,141),xy(371,151),xy(370,155),xy(372,155)]).
midline(r1, [xy(386,115),xy(386,116)]).
midline(r1, [xy(215,92),xy(230,107),xy(232,105),xy(219,92)]).
midline(r1, [xy(232,103),xy(222,92)]).
midline(r1, [xy(388,108),xy(389,103),xy(401,91),xy(397,90)]).
midline(r1, [xy(61,445),xy(62,442),xy(70,439),xy(70,441)]).
midline(r1, [xy(72,439),xy(76,437),xy(76,439)]).
midline(r1, [xy(109,619),xy(124,633),xy(131,635),xy(553,634),xy(555,629),xy(555,526),xy(547,527),xy(518,544),xy(467,565),xy(440,570),xy(433,575),xy(412,579),xy(399,584),xy(369,584),xy(361,588),xy(349,590),xy(270,590),xy(249,584),xy(231,585),xy(216,583),xy(205,578),xy(195,578),xy(164,566),xy(155,566),xy(141,560),xy(127,533),xy(111,514),xy(103,506),xy(66,485)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,632),xy(579,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(139,560),xy(120,579)]).
midline(r1, [xy(369,583),xy(366,578),xy(368,578)]).
midline(r1, [xy(402,90),xy(390,106)]).
midline(r1, [xy(404,90),xy(393,103)]).
midline(r1, [xy(406,90),xy(464,102),xy(520,121),xy(525,133),xy(524,135),xy(528,140),xy(547,188),xy(568,267),xy(569,286),xy(557,297),xy(546,298),xy(543,300),xy(546,300)]).
midline(r1, [xy(563,293),xy(566,294),xy(565,292)]).
midline(r1, [xy(568,294),xy(569,288)]).
midline(r1, [xy(570,294),xy(575,330),xy(575,409),xy(571,441),xy(569,446),xy(549,439),xy(546,440),xy(537,435),xy(535,436),xy(540,439)]).
midline(r1, [xy(550,299),xy(549,300)]).
midline(r1, [xy(570,290),xy(569,291)]).
midline(r1, [xy(551,442),xy(547,441)]).
midline(r1, [xy(554,524),xy(566,482),xy(569,456),xy(561,448),xy(551,444)]).
midline(r1, [xy(562,447),xy(564,446)]).
midline(r1, [xy(569,454),xy(570,447)]).
midline(r1, [xy(586,556),xy(616,586),xy(614,588),xy(614,633),xy(608,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(78,437),xy(81,437),xy(78,439)]).
midline(r1, [xy(82,436),xy(84,434),xy(84,436)]).
midline(r1, [xy(61,295),xy(61,297)]).
midline(r1, [xy(63,296),xy(68,295),xy(66,298)]).
midline(r1, [xy(70,296),xy(68,299)]).
midline(r1, [xy(70,299),xy(72,300),xy(72,298)]).
midline(r1, [xy(74,300),xy(97,311),xy(99,310),xy(99,312)]).
midline(r1, [xy(86,435),xy(91,431),xy(91,433)]).
midline(r1, [xy(93,433),xy(95,431)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(239,129),xy(240,130)]).
midline(r1, [xy(239,127),xy(234,117),xy(235,114),xy(231,109),xy(232,107),xy(233,109)]).
midline(r1, [xy(180,550),xy(181,549)]).
fillpoint(r1, xy(519,120), 120.4).
fillpoint(r1, xy(524,131), 116.0).
fillpoint(r1, xy(115,115), 115.1).
fillpoint(r1, xy(120,113), 114.0).
fillpoint(r1, xy(499,113), 114.0).
fillpoint(r1, xy(127,111), 112.0).
fillpoint(r1, xy(492,111), 112.0).
fillpoint(r1, xy(131,110), 111.0).
fillpoint(r1, xy(488,110), 111.0).
fillpoint(r1, xy(153,103), 104.0).
fillpoint(r1, xy(466,103), 104.0).
fillpoint(r1, xy(156,102), 103.0).
fillpoint(r1, xy(463,102), 103.0).
fillpoint(r1, xy(160,101), 102.0).
fillpoint(r1, xy(459,101), 102.0).
fillpoint(r1, xy(164,100), 101.0).
fillpoint(r1, xy(455,100), 101.0).
fillpoint(r1, xy(168,99), 100.0).
fillpoint(r1, xy(451,99), 100.0).
fillpoint(r1, xy(173,98), 99.0).
fillpoint(r1, xy(446,98), 99.0).
fillpoint(r1, xy(181,96), 97.0).
fillpoint(r1, xy(438,96), 97.0).
fillpoint(r1, xy(185,95), 96.0).
fillpoint(r1, xy(434,95), 96.0).
fillpoint(r1, xy(544,180), 96.0).
fillpoint(r1, xy(189,94), 95.0).
fillpoint(r1, xy(430,94), 95.0).
fillpoint(r1, xy(545,183), 95.0).
fillpoint(r1, xy(194,93), 94.0).
fillpoint(r1, xy(425,93), 94.0).
fillpoint(r1, xy(546,186), 94.0).
fillpoint(r1, xy(199,92), 93.0).
fillpoint(r1, xy(420,92), 93.0).
fillpoint(r1, xy(547,189), 93.0).
fillpoint(r1, xy(206,91), 92.0).
fillpoint(r1, xy(414,91), 92.0).
fillpoint(r1, xy(215,90), 91.0).
fillpoint(r1, xy(405,90), 91.0).
fillpoint(r1, xy(549,196), 91.0).
fillpoint(r1, xy(230,89), 90.0).
fillpoint(r1, xy(389,89), 90.0).
fillpoint(r1, xy(550,200), 90.0).
fillpoint(r1, xy(235,88), 89.0).
fillpoint(r1, xy(384,88), 89.0).
fillpoint(r1, xy(551,205), 89.0).
fillpoint(r1, xy(240,87), 88.0).
fillpoint(r1, xy(379,87), 88.0).
fillpoint(r1, xy(246,86), 87.0).
fillpoint(r1, xy(373,86), 87.0).
fillpoint(r1, xy(86,181), 87.0).
fillpoint(r1, xy(553,211), 87.0).
fillpoint(r1, xy(255,85), 86.0).
fillpoint(r1, xy(365,85), 86.0).
fillpoint(r1, xy(554,525), 85.1).
fillpoint(r1, xy(271,85), 85.0).
fillpoint(r1, xy(80,199), 81.0).
fillpoint(r1, xy(559,229), 81.0).
fillpoint(r1, xy(559,510), 81.0).
fillpoint(r1, xy(79,203), 80.0).
fillpoint(r1, xy(560,233), 80.0).
fillpoint(r1, xy(560,506), 80.0).
fillpoint(r1, xy(78,207), 79.0).
fillpoint(r1, xy(561,237), 79.0).
fillpoint(r1, xy(561,502), 79.0).
fillpoint(r1, xy(77,212), 78.0).
fillpoint(r1, xy(562,242), 78.0).
fillpoint(r1, xy(562,498), 78.0).
fillpoint(r1, xy(563,247), 77.0).
fillpoint(r1, xy(563,492), 77.0).
fillpoint(r1, xy(565,254), 75.0).
fillpoint(r1, xy(565,485), 75.0).
fillpoint(r1, xy(566,258), 74.0).
fillpoint(r1, xy(566,481), 74.0).
fillpoint(r1, xy(567,263), 73.0).
fillpoint(r1, xy(567,476), 73.0).
fillpoint(r1, xy(568,269), 72.0).
fillpoint(r1, xy(568,471), 72.0).
fillpoint(r1, xy(70,232), 71.0).
fillpoint(r1, xy(569,277), 71.0).
fillpoint(r1, xy(569,463), 71.0).
fillpoint(r1, xy(69,235), 70.0).
fillpoint(r1, xy(569,293), 70.0).
fillpoint(r1, xy(569,447), 70.0).
fillpoint(r1, xy(68,239), 69.0).
fillpoint(r1, xy(571,299), 69.0).
fillpoint(r1, xy(571,440), 69.0).
fillpoint(r1, xy(67,244), 68.0).
fillpoint(r1, xy(572,304), 68.0).
fillpoint(r1, xy(572,435), 68.0).
fillpoint(r1, xy(66,250), 67.0).
fillpoint(r1, xy(573,310), 67.0).
fillpoint(r1, xy(573,430), 67.0).
fillpoint(r1, xy(574,317), 66.0).
fillpoint(r1, xy(574,423), 66.0).
fillpoint(r1, xy(65,485), 65.2).
fillpoint(r1, xy(64,257), 65.0).
fillpoint(r1, xy(574,370), 65.0).
fillpoint(r1, xy(64,482), 65.0).
fillpoint(r1, xy(62,265), 63.0).
fillpoint(r1, xy(62,474), 63.0).
fillpoint(r1, xy(61,270), 62.0).
fillpoint(r1, xy(61,469), 62.0).
fillpoint(r1, xy(60,278), 61.0).
fillpoint(r1, xy(60,462), 61.0).
fillpoint(r1, xy(60,294), 60.0).
fillpoint(r1, xy(60,445), 60.0).
fillpoint(r1, xy(58,302), 59.0).
fillpoint(r1, xy(58,437), 59.0).
fillpoint(r1, xy(57,306), 58.0).
fillpoint(r1, xy(57,433), 58.0).
fillpoint(r1, xy(498,552), 58.0).
fillpoint(r1, xy(56,311), 57.0).
fillpoint(r1, xy(56,428), 57.0).
fillpoint(r1, xy(55,318), 56.0).
fillpoint(r1, xy(55,421), 56.0).
fillpoint(r1, xy(54,370), 55.0).
fillpoint(r1, xy(139,560), 50.0).
fillpoint(r1, xy(135,549), 46.0).
fillpoint(r1, xy(153,565), 45.0).
fillpoint(r1, xy(466,565), 45.0).
fillpoint(r1, xy(156,566), 44.0).
fillpoint(r1, xy(463,566), 44.0).
fillpoint(r1, xy(164,568), 42.0).
fillpoint(r1, xy(455,568), 42.0).
fillpoint(r1, xy(129,537), 41.8).
fillpoint(r1, xy(127,534), 41.2).
fillpoint(r1, xy(170,569), 41.0).
fillpoint(r1, xy(449,569), 41.0).
fillpoint(r1, xy(126,532), 40.8).
fillpoint(r1, xy(119,524), 39.7).
fillpoint(r1, xy(120,525), 39.7).
fillpoint(r1, xy(196,578), 32.0).
fillpoint(r1, xy(423,578), 32.0).
fillpoint(r1, xy(202,579), 31.0).
fillpoint(r1, xy(418,579), 31.0).
border(r1).
region(r3, '#2ecc40', 58100, centroid(312,333)).
perimeter(r3, 2340).
polygon(r3, [xy(189,500),xy(150,500),xy(150,480),xy(140,479),xy(140,450),xy(120,449),xy(120,440),xy(130,439),xy(130,410),xy(110,409),xy(110,330),xy(120,329),xy(120,290),xy(130,289),xy(130,270),xy(139,270),xy(140,260),xy(150,259),xy(150,250),xy(289,250),xy(290,200),xy(339,200),xy(340,170),xy(349,170),xy(350,180),xy(389,180),xy(390,200),xy(419,200),xy(420,210),xy(439,210),xy(440,349),xy(489,350),xy(490,290),xy(500,290),xy(500,329),xy(510,330),xy(510,409),xy(500,410),xy(500,449),xy(390,450),xy(390,350),xy(290,350),xy(289,300),xy(140,300),xy(140,350),xy(240,350),xy(240,449),xy(190,450),xy(189,500)]).
hole(r3, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
hole(r3, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r3, [xy(439,400),xy(419,371),xy(415,358),xy(413,336),xy(407,322),xy(399,310),xy(375,285),xy(345,294),xy(314,273),xy(311,275),xy(169,274),xy(144,284),xy(129,299),xy(130,329),xy(124,344),xy(127,362),xy(139,379),xy(164,390),xy(165,423),xy(150,431),xy(135,443),xy(124,445)]).
midline(r3, [xy(441,399),xy(451,400),xy(477,382),xy(479,385),xy(476,385)]).
midline(r3, [xy(480,386),xy(483,389)]).
midline(r3, [xy(375,284),xy(380,272),xy(383,253),xy(365,225),xy(349,218),xy(333,205),xy(295,205),xy(295,243),xy(307,257),xy(314,272)]).
midline(r3, [xy(384,252),xy(391,245),xy(391,240),xy(381,250)]).
midline(r3, [xy(391,239),xy(392,235),xy(394,235)]).
midline(r3, [xy(394,237),xy(393,240)]).
midline(r3, [xy(385,254),xy(390,249),xy(398,245),xy(398,247)]).
midline(r3, [xy(365,224),xy(364,204),xy(346,185),xy(345,174)]).
midline(r3, [xy(230,440),xy(223,444),xy(210,445),xy(204,443),xy(192,433),xy(165,425),xy(165,458),xy(163,459),xy(167,465),xy(170,480)]).
midline(r3, [xy(230,438),xy(235,429),xy(234,416),xy(224,404),xy(220,393),xy(209,379),xy(185,381),xy(165,390)]).
midline(r3, [xy(195,434),xy(224,405)]).
midline(r3, [xy(478,381),xy(495,363),xy(499,355),xy(500,339),xy(494,329),xy(495,294)]).
fillpoint(r3, xy(375,285), 65.0).
fillpoint(r3, xy(378,277), 62.0).
fillpoint(r3, xy(367,288), 62.0).
fillpoint(r3, xy(379,274), 61.0).
fillpoint(r3, xy(364,289), 61.0).
fillpoint(r3, xy(380,271), 60.0).
fillpoint(r3, xy(361,290), 60.0).
fillpoint(r3, xy(381,267), 59.0).
fillpoint(r3, xy(357,291), 59.0).
fillpoint(r3, xy(382,263), 58.0).
fillpoint(r3, xy(353,292), 58.0).
fillpoint(r3, xy(383,258), 57.0).
fillpoint(r3, xy(348,293), 57.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(165,390), 40.3).
fillpoint(r3, xy(165,425), 35.4).
fillpoint(r3, xy(164,415), 35.0).
fillpoint(r3, xy(143,381), 32.0).
fillpoint(r3, xy(186,381), 32.0).
fillpoint(r3, xy(192,380), 31.0).
fillpoint(r3, xy(201,380), 30.0).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(169,275), 25.0).
fillpoint(r3, xy(164,456), 25.0).
fillpoint(r3, xy(169,473), 21.0).
region(r9, '#ffdc00', 21800, centroid(233,416)).
perimeter(r9, 980).
polygon(r9, [xy(269,560),xy(230,560),xy(229,550),xy(210,550),xy(210,540),xy(200,540),xy(199,530),xy(180,530),xy(180,520),xy(170,520),xy(169,510),xy(160,509),xy(160,500),xy(190,499),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(290,479),xy(270,480),xy(269,560)]).
midline(r9, [xy(182,510),xy(173,505),xy(164,505)]).
midline(r9, [xy(183,510),xy(194,515),xy(227,504),xy(230,497),xy(229,489),xy(264,455),xy(265,350),xy(262,333),xy(259,328),xy(253,326),xy(239,324),xy(164,325)]).
midline(r9, [xy(229,503),xy(230,509),xy(242,525),xy(249,539)]).
fillpoint(r9, xy(229,503), 40.2).
fillpoint(r9, xy(229,494), 40.0).
fillpoint(r9, xy(260,329), 29.7).
fillpoint(r9, xy(258,328), 29.0).
fillpoint(r9, xy(261,331), 29.0).
fillpoint(r9, xy(255,327), 28.0).
fillpoint(r9, xy(262,334), 28.0).
fillpoint(r9, xy(252,326), 27.0).
fillpoint(r9, xy(263,337), 27.0).
fillpoint(r9, xy(248,325), 26.0).
fillpoint(r9, xy(264,342), 26.0).
fillpoint(r9, xy(264,455), 25.7).
fillpoint(r9, xy(164,325), 25.0).
fillpoint(r9, xy(264,400), 25.0).
fillpoint(r9, xy(195,514), 16.0).
fillpoint(r9, xy(184,510), 11.0).
region(r13, '#ffdc00', 14900, centroid(394,465)).
perimeter(r13, 700).
polygon(r13, [xy(389,560),xy(360,559),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,469),xy(480,470),xy(480,479),xy(470,480),xy(470,499),xy(440,500),xy(440,529),xy(420,530),xy(420,539),xy(410,540),xy(409,550),xy(390,550),xy(389,560)]).
midline(r13, [xy(419,479),xy(400,490),xy(364,455),xy(365,384)]).
midline(r13, [xy(420,479),xy(430,475),xy(445,475),xy(457,467),xy(474,460),xy(480,460)]).
midline(r13, [xy(400,491),xy(388,522),xy(379,533),xy(375,545)]).
fillpoint(r13, xy(400,491), 41.0).
fillpoint(r13, xy(421,478), 29.0).
fillpoint(r13, xy(388,521), 29.0).
fillpoint(r13, xy(424,477), 28.0).
fillpoint(r13, xy(427,476), 27.0).
fillpoint(r13, xy(432,475), 26.0).
fillpoint(r13, xy(365,455), 25.7).
fillpoint(r13, xy(365,416), 25.0).
fillpoint(r13, xy(441,475), 25.0).
fillpoint(r13, xy(464,465), 16.0).
fillpoint(r13, xy(375,544), 16.0).
fillpoint(r13, xy(475,460), 11.0).
region(r2, '#ffdc00', 8600, centroid(249,214)).
perimeter(r2, 540).
polygon(r2, [xy(289,250),xy(150,250),xy(150,240),xy(159,240),xy(160,230),xy(169,230),xy(170,220),xy(180,219),xy(180,210),xy(199,210),xy(200,200),xy(239,200),xy(240,180),xy(269,180),xy(270,170),xy(339,170),xy(339,200),xy(290,200),xy(289,250)]).
midline(r2, [xy(218,225),xy(207,229),xy(197,229),xy(175,239),xy(169,239),xy(163,244),xy(154,245)]).
midline(r2, [xy(229,225),xy(222,225),xy(220,223),xy(220,225)]).
midline(r2, [xy(230,225),xy(259,221),xy(263,213),xy(264,204),xy(284,184),xy(325,185)]).
fillpoint(r2, xy(260,220), 29.7).
fillpoint(r2, xy(261,218), 29.0).
fillpoint(r2, xy(258,221), 29.0).
fillpoint(r2, xy(262,215), 28.0).
fillpoint(r2, xy(255,222), 28.0).
fillpoint(r2, xy(263,212), 27.0).
fillpoint(r2, xy(252,223), 27.0).
fillpoint(r2, xy(264,208), 26.0).
fillpoint(r2, xy(248,224), 26.0).
fillpoint(r2, xy(219,225), 25.0).
fillpoint(r2, xy(206,229), 21.0).
fillpoint(r2, xy(196,230), 20.0).
fillpoint(r2, xy(284,185), 16.0).
fillpoint(r2, xy(185,234), 16.0).
fillpoint(r2, xy(291,185), 15.0).
fillpoint(r2, xy(174,239), 11.0).
region(r15, '#2ecc40', 7100, centroid(314,476)).
perimeter(r15, 800).
polygon(r15, [xy(349,570),xy(270,569),xy(270,480),xy(290,479),xy(290,400),xy(340,400),xy(340,479),xy(360,480),xy(360,559),xy(350,559),xy(349,490),xy(280,490),xy(280,559),xy(349,560),xy(349,570)]).
midline(r15, [xy(331,480),xy(314,464),xy(315,424)]).
midline(r15, [xy(314,465),xy(295,483),xy(275,485),xy(275,564),xy(345,565)]).
midline(r15, [xy(346,563),xy(355,554),xy(355,490),xy(353,485),xy(340,485),xy(332,481)]).
fillpoint(r15, xy(314,445), 25.0).
region(r28, '#5a5a5a', 5200, centroid(420,620)).
perimeter(r28, 560).
polygon(r28, [xy(549,630),xy(290,630),xy(290,610),xy(549,610),xy(549,630)]).
midline(r28, [xy(439,620),xy(299,620)]).
midline(r28, [xy(440,619),xy(540,620)]).
fillpoint(r28, xy(299,620), 10.0).
region(r8, '#ffdc00', 4800, centroid(464,292)).
perimeter(r8, 360).
polygon(r8, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,220),xy(449,220),xy(450,229),xy(459,230),xy(460,239),xy(470,240),xy(470,259),xy(479,260),xy(480,269),xy(490,270),xy(489,350)]).
midline(r8, [xy(468,291),xy(468,288),xy(460,280),xy(460,282)]).
midline(r8, [xy(469,292),xy(470,330)]).
midline(r8, [xy(461,279),xy(455,266),xy(455,254),xy(450,245),xy(450,239),xy(445,233),xy(445,224)]).
fillpoint(r8, xy(462,282), 22.2).
fillpoint(r8, xy(467,287), 22.2).
fillpoint(r8, xy(469,293), 21.0).
fillpoint(r8, xy(469,316), 20.0).
fillpoint(r8, xy(455,265), 16.0).
fillpoint(r8, xy(454,256), 15.0).
fillpoint(r8, xy(450,244), 11.0).
region(r21, '#aaaaaa', 4300, centroid(314,524)).
perimeter(r21, 440).
polygon(r21, [xy(349,560),xy(280,559),xy(280,490),xy(350,490),xy(349,560)]).
hole(r21, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(330,519),xy(329,510),xy(320,510),xy(319,520),xy(310,520),xy(309,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(330,539)]).
midline(r21, [xy(339,542),xy(339,525),xy(325,525),xy(314,514),xy(315,502),xy(313,500),xy(300,499),xy(291,501),xy(289,511),xy(290,535),xy(296,545),xy(310,550),xy(328,550),xy(337,548),xy(339,543)]).
midline(r21, [xy(315,500),xy(329,499),xy(338,501),xy(339,523)]).
fillpoint(r21, xy(295,544), 15.8).
fillpoint(r21, xy(292,501), 12.0).
fillpoint(r21, xy(338,501), 12.0).
fillpoint(r21, xy(337,548), 12.0).
fillpoint(r21, xy(295,500), 11.0).
fillpoint(r21, xy(315,500), 11.0).
fillpoint(r21, xy(334,500), 11.0).
fillpoint(r21, xy(290,505), 11.0).
fillpoint(r21, xy(339,505), 11.0).
fillpoint(r21, xy(339,525), 11.0).
fillpoint(r21, xy(290,534), 11.0).
fillpoint(r21, xy(339,544), 11.0).
fillpoint(r21, xy(305,549), 11.0).
fillpoint(r21, xy(334,549), 11.0).
fillpoint(r21, xy(301,500), 10.0).
fillpoint(r21, xy(321,500), 10.0).
fillpoint(r21, xy(289,520), 10.0).
fillpoint(r21, xy(339,515), 10.0).
fillpoint(r21, xy(339,535), 10.0).
fillpoint(r21, xy(311,550), 10.0).
fillpoint(r21, xy(315,513), 5.0).
fillpoint(r21, xy(324,525), 5.0).
region(r27, '#2ecc40', 3200, centroid(210,620)).
perimeter(r27, 360).
polygon(r27, [xy(289,630),xy(130,630),xy(130,610),xy(289,610),xy(289,630)]).
midline(r27, [xy(279,620),xy(139,620)]).
midline(r27, [xy(280,620),xy(280,619)]).
fillpoint(r27, xy(139,620), 10.0).
region(r25, '#7fdbff', 2000, centroid(56,584)).
perimeter(r25, 240).
polygon(r25, [xy(89,610),xy(50,610),xy(50,590),xy(30,589),xy(30,550),xy(49,550),xy(50,569),xy(69,570),xy(70,589),xy(90,590),xy(89,610)]).
midline(r25, [xy(44,579),xy(40,575),xy(40,559)]).
midline(r25, [xy(45,579),xy(58,581),xy(61,598),xy(80,600)]).
fillpoint(r25, xy(41,578), 12.0).
fillpoint(r25, xy(58,581), 12.0).
fillpoint(r25, xy(61,598), 12.0).
fillpoint(r25, xy(40,574), 11.0).
fillpoint(r25, xy(45,579), 11.0).
fillpoint(r25, xy(54,580), 11.0).
fillpoint(r25, xy(59,585), 11.0).
fillpoint(r25, xy(60,594), 11.0).
fillpoint(r25, xy(65,599), 11.0).
fillpoint(r25, xy(39,564), 10.0).
fillpoint(r25, xy(71,600), 10.0).
region(r14, '#870c25', 1500, centroid(314,384)).
perimeter(r14, 160).
polygon(r14, [xy(339,400),xy(290,400),xy(290,370),xy(339,370),xy(339,400)]).
midline(r14, [xy(316,384),xy(304,385)]).
midline(r14, [xy(317,384),xy(325,385)]).
fillpoint(r14, xy(304,385), 15.0).
region(r11, '#bebebe', 1000, centroid(314,360)).
perimeter(r11, 140).
polygon(r11, [xy(339,370),xy(290,370),xy(290,350),xy(339,350),xy(339,370)]).
midline(r11, [xy(310,359),xy(299,360)]).
midline(r11, [xy(311,359),xy(330,360)]).
fillpoint(r11, xy(299,360), 10.0).
region(r6, '#5a5a5a', 800, centroid(314,224)).
perimeter(r6, 160).
polygon(r6, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r6, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r6, [xy(305,227),xy(305,215),xy(324,215),xy(325,220),xy(323,234),xy(306,234),xy(305,228)]).
fillpoint(r6, xy(306,215), 6.0).
fillpoint(r6, xy(324,215), 6.0).
fillpoint(r6, xy(305,234), 6.0).
fillpoint(r6, xy(323,234), 6.0).
fillpoint(r6, xy(311,215), 5.0).
fillpoint(r6, xy(304,225), 5.0).
fillpoint(r6, xy(324,225), 5.0).
fillpoint(r6, xy(311,235), 5.0).
region(r10, '#0074d9', 500, centroid(444,324)).
perimeter(r10, 120).
polygon(r10, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r10, [xy(445,311),xy(445,304)]).
midline(r10, [xy(444,312),xy(445,345)]).
fillpoint(r10, xy(444,325), 5.0).
region(r12, '#0074d9', 500, centroid(364,354)).
perimeter(r12, 120).
polygon(r12, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r12, [xy(359,354),xy(344,355)]).
midline(r12, [xy(360,354),xy(385,355)]).
fillpoint(r12, xy(344,355), 5.0).
region(r23, '#7fdbff', 500, centroid(312,526)).
perimeter(r23, 120).
polygon(r23, [xy(329,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r23, [xy(305,521),xy(305,514)]).
midline(r23, [xy(305,522),xy(305,524),xy(314,525),xy(315,534),xy(325,535)]).
fillpoint(r23, xy(305,524), 6.0).
fillpoint(r23, xy(314,525), 6.0).
fillpoint(r23, xy(315,534), 6.0).
fillpoint(r23, xy(305,516), 5.0).
fillpoint(r23, xy(321,535), 5.0).
region(r4, '#2ecc40', 400, centroid(227,192)).
perimeter(r4, 100).
polygon(r4, [xy(239,200),xy(210,200),xy(210,190),xy(229,190),xy(230,180),xy(239,180),xy(239,200)]).
midline(r4, [xy(221,195),xy(214,195)]).
midline(r4, [xy(222,195),xy(233,194),xy(235,184)]).
fillpoint(r4, xy(233,194), 6.0).
fillpoint(r4, xy(235,186), 5.0).
fillpoint(r4, xy(214,195), 5.0).
region(r26, '#7fdbff', 400, centroid(80,560)).
perimeter(r26, 80).
polygon(r26, [xy(89,570),xy(70,569),xy(70,550),xy(90,550),xy(89,570)]).
midline(r26, [xy(79,559),xy(80,560)]).
fillpoint(r26, xy(79,560), 10.0).
region(r29, '#7fdbff', 400, centroid(570,620)).
perimeter(r29, 80).
polygon(r29, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r29, [xy(569,619),xy(570,620)]).
fillpoint(r29, xy(569,620), 10.0).
region(r30, '#7fdbff', 400, centroid(600,620)).
perimeter(r30, 80).
polygon(r30, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r30, [xy(599,619),xy(600,620)]).
fillpoint(r30, xy(599,620), 10.0).
region(r31, '#2ecc40', 400, centroid(630,620)).
perimeter(r31, 80).
polygon(r31, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r31, [xy(629,619),xy(630,620)]).
fillpoint(r31, xy(629,620), 10.0).
border(r31).
region(r19, '#000000', 300, centroid(218,428)).
perimeter(r19, 80).
polygon(r19, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r19, [xy(215,431),xy(215,435)]).
midline(r19, [xy(215,430),xy(215,425),xy(225,425)]).
fillpoint(r19, xy(216,425), 6.0).
fillpoint(r19, xy(221,425), 5.0).
fillpoint(r19, xy(215,433), 5.0).
region(r7, '#2ecc40', 100, centroid(314,224)).
perimeter(r7, 40).
polygon(r7, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r7, [xy(315,225),xy(315,224)]).
fillpoint(r7, xy(314,225), 5.0).
region(r17, '#000000', 100, centroid(204,414)).
perimeter(r17, 40).
polygon(r17, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r17, [xy(205,415),xy(205,414)]).
fillpoint(r17, xy(204,415), 5.0).
region(r24, '#7fdbff', 100, centroid(324,514)).
perimeter(r24, 40).
polygon(r24, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r24, [xy(325,515),xy(325,514)]).
fillpoint(r24, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 220).
adjacent(r1, r3).
shared_edge(r1, r3, 600).
adjacent(r1, r4).
shared_edge(r1, r4, 50).
adjacent(r1, r8).
shared_edge(r1, r8, 120).
adjacent(r1, r9).
shared_edge(r1, r9, 170).
adjacent(r1, r13).
shared_edge(r1, r13, 200).
adjacent(r1, r15).
shared_edge(r1, r15, 110).
adjacent(r1, r25).
shared_edge(r1, r25, 240).
adjacent(r1, r26).
shared_edge(r1, r26, 80).
adjacent(r1, r27).
shared_edge(r1, r27, 340).
adjacent(r1, r28).
shared_edge(r1, r28, 540).
adjacent(r1, r29).
shared_edge(r1, r29, 80).
adjacent(r1, r30).
shared_edge(r1, r30, 80).
adjacent(r1, r31).
shared_edge(r1, r31, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 270).
adjacent(r2, r4).
shared_edge(r2, r4, 50).
adjacent(r3, r6).
shared_edge(r3, r6, 120).
adjacent(r3, r8).
shared_edge(r3, r8, 180).
adjacent(r3, r9).
shared_edge(r3, r9, 580).
adjacent(r3, r10).
shared_edge(r3, r10, 60).
adjacent(r3, r11).
shared_edge(r3, r11, 50).
adjacent(r3, r12).
shared_edge(r3, r12, 60).
adjacent(r3, r13).
shared_edge(r3, r13, 190).
adjacent(r3, r17).
shared_edge(r3, r17, 40).
adjacent(r3, r19).
shared_edge(r3, r19, 80).
adjacent(r6, r7).
shared_edge(r6, r7, 40).
adjacent(r8, r10).
shared_edge(r8, r10, 60).
adjacent(r9, r11).
shared_edge(r9, r11, 20).
adjacent(r9, r14).
shared_edge(r9, r14, 30).
adjacent(r9, r15).
shared_edge(r9, r15, 180).
adjacent(r11, r12).
shared_edge(r11, r12, 10).
adjacent(r11, r13).
shared_edge(r11, r13, 10).
adjacent(r11, r14).
shared_edge(r11, r14, 50).
adjacent(r12, r13).
shared_edge(r12, r13, 50).
adjacent(r13, r14).
shared_edge(r13, r14, 30).
adjacent(r13, r15).
shared_edge(r13, r15, 180).
adjacent(r14, r15).
shared_edge(r14, r15, 50).
adjacent(r15, r21).
shared_edge(r15, r21, 280).
adjacent(r21, r23).
shared_edge(r21, r23, 120).
adjacent(r21, r24).
shared_edge(r21, r24, 40).
adjacent(r27, r28).
shared_edge(r27, r28, 20).

encloses(r6, r7).
encloses(r3, r17).
encloses(r3, r19).
encloses(r21, r23).
encloses(r21, r24).
encloses(r1, r25).
encloses(r1, r26).
encloses(r1, r29).
encloses(r1, r30).
