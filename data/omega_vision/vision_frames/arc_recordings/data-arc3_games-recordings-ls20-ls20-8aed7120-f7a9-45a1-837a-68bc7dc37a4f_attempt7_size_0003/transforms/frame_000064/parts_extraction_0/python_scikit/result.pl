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

region(r1, '#aaaaaa', 309000, centroid(366,295)).
perimeter(r1, 5360).
polygon(r1, [xy(0,540),xy(9,540),xy(10,530),xy(109,530),xy(110,569),xy(149,570),xy(150,560),xy(189,560),xy(190,550),xy(209,550),xy(210,540),xy(219,540),xy(220,530),xy(239,530),xy(240,520),xy(249,520),xy(250,510),xy(259,510),xy(260,500),xy(270,499),xy(270,480),xy(279,480),xy(280,470),xy(290,469),xy(290,450),xy(300,449),xy(300,410),xy(310,409),xy(310,330),xy(300,329),xy(300,290),xy(290,289),xy(290,270),xy(280,270),xy(279,260),xy(270,259),xy(270,240),xy(260,240),xy(260,230),xy(250,230),xy(250,220),xy(240,219),xy(239,210),xy(220,210),xy(220,200),xy(210,199),xy(209,190),xy(190,190),xy(189,180),xy(150,180),xy(149,170),xy(70,170),xy(69,180),xy(40,180),xy(40,519),xy(0,520)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(90,549),xy(75,540),xy(32,539),xy(21,541),xy(14,554),xy(14,569),xy(17,580),xy(15,583),xy(14,607),xy(17,622),xy(31,625),xy(59,623),xy(59,599),xy(39,579),xy(18,579)]).
midline(r1, [xy(61,623),xy(70,625),xy(96,624),xy(109,617),xy(113,593),xy(104,583),xy(100,575),xy(99,564),xy(90,551)]).
midline(r1, [xy(114,593),xy(130,589),xy(157,589),xy(168,585),xy(169,582),xy(167,580),xy(169,580)]).
midline(r1, [xy(170,585),xy(199,584),xy(215,578),xy(219,579),xy(233,575),xy(240,570),xy(267,565),xy(328,539),xy(345,528),xy(369,517),xy(409,492),xy(411,490),xy(367,446),xy(352,440),xy(352,442)]).
midline(r1, [xy(109,619),xy(120,630),xy(130,635),xy(553,634),xy(555,630),xy(554,529),xy(556,526),xy(473,443),xy(417,486),xy(379,448),xy(368,445)]).
midline(r1, [xy(473,442),xy(475,409),xy(474,305),xy(466,238),xy(460,211),xy(379,291),xy(371,289),xy(350,298),xy(342,298),xy(332,306),xy(320,310),xy(320,312)]).
midline(r1, [xy(336,304),xy(342,300),xy(342,302)]).
midline(r1, [xy(376,289),xy(459,206),xy(457,203),xy(372,288),xy(457,205)]).
midline(r1, [xy(458,202),xy(454,185),xy(443,178),xy(374,142),xy(300,113),xy(285,110),xy(264,102),xy(215,91),xy(196,91),xy(167,85),xy(84,84),xy(52,120),xy(42,138),xy(27,155),xy(20,172),xy(20,500)]).
midline(r1, [xy(351,299),xy(352,298)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,632),xy(585,555),xy(557,527)]).
midline(r1, [xy(43,139),xy(43,144),xy(45,144)]).
midline(r1, [xy(379,450),xy(415,486),xy(412,489),xy(371,448)]).
midline(r1, [xy(460,210),xy(459,207)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,632),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(347,299),xy(344,301)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(372,292),xy(356,297)]).
midline(r1, [xy(195,92),xy(188,99),xy(188,111),xy(184,114),xy(183,124),xy(177,136),xy(177,142),xy(173,147),xy(178,143)]).
midline(r1, [xy(190,100),xy(198,92)]).
midline(r1, [xy(186,115),xy(191,110)]).
fillpoint(r1, xy(454,185), 185.6).
fillpoint(r1, xy(455,188), 185.0).
fillpoint(r1, xy(456,192), 184.0).
fillpoint(r1, xy(457,197), 183.0).
fillpoint(r1, xy(458,201), 182.0).
fillpoint(r1, xy(459,205), 181.0).
fillpoint(r1, xy(460,209), 180.0).
fillpoint(r1, xy(461,213), 179.0).
fillpoint(r1, xy(462,218), 178.0).
fillpoint(r1, xy(463,223), 177.0).
fillpoint(r1, xy(464,228), 176.0).
fillpoint(r1, xy(465,234), 175.0).
fillpoint(r1, xy(466,240), 174.0).
fillpoint(r1, xy(467,247), 173.0).
fillpoint(r1, xy(468,257), 172.0).
fillpoint(r1, xy(469,267), 171.0).
fillpoint(r1, xy(470,275), 170.0).
fillpoint(r1, xy(471,281), 169.0).
fillpoint(r1, xy(472,288), 168.0).
fillpoint(r1, xy(473,297), 167.0).
fillpoint(r1, xy(473,442), 167.0).
fillpoint(r1, xy(474,309), 166.0).
fillpoint(r1, xy(474,431), 166.0).
fillpoint(r1, xy(474,370), 165.0).
fillpoint(r1, xy(299,113), 114.0).
fillpoint(r1, xy(292,111), 112.0).
fillpoint(r1, xy(288,110), 111.0).
fillpoint(r1, xy(266,103), 104.0).
fillpoint(r1, xy(263,102), 103.0).
fillpoint(r1, xy(259,101), 102.0).
fillpoint(r1, xy(255,100), 101.0).
fillpoint(r1, xy(251,99), 100.0).
fillpoint(r1, xy(246,98), 99.0).
fillpoint(r1, xy(238,96), 97.0).
fillpoint(r1, xy(234,95), 96.0).
fillpoint(r1, xy(230,94), 95.0).
fillpoint(r1, xy(225,93), 94.0).
fillpoint(r1, xy(220,92), 93.0).
fillpoint(r1, xy(214,91), 92.0).
fillpoint(r1, xy(205,90), 91.0).
fillpoint(r1, xy(189,89), 90.0).
fillpoint(r1, xy(184,88), 89.0).
fillpoint(r1, xy(179,87), 88.0).
fillpoint(r1, xy(173,86), 87.0).
fillpoint(r1, xy(165,85), 86.0).
fillpoint(r1, xy(84,85), 85.0).
fillpoint(r1, xy(298,552), 58.0).
border(r1).
region(r2, '#ffdc00', 45800, centroid(147,404)).
perimeter(r2, 2000).
polygon(r2, [xy(0,520),xy(40,519),xy(40,180),xy(69,180),xy(70,170),xy(90,170),xy(90,449),xy(139,450),xy(140,500),xy(189,500),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(290,469),xy(280,470),xy(280,479),xy(270,480),xy(270,499),xy(260,500),xy(260,509),xy(250,510),xy(250,519),xy(240,520),xy(239,530),xy(220,530),xy(220,539),xy(210,540),xy(209,550),xy(190,550),xy(189,560),xy(150,560),xy(149,570),xy(110,570),xy(109,530),xy(10,530),xy(10,539),xy(0,540)]).
midline(r2, [xy(64,447),xy(64,204),xy(75,193),xy(80,179)]).
midline(r2, [xy(64,448),xy(67,466),xy(80,489),xy(45,523),xy(37,525),xy(5,525),xy(5,535)]).
midline(r2, [xy(81,489),xy(100,489),xy(140,530),xy(131,549)]).
midline(r2, [xy(141,530),xy(167,530),xy(181,525),xy(189,525),xy(188,527),xy(192,529)]).
midline(r2, [xy(190,524),xy(200,520)]).
midline(r2, [xy(201,518),xy(217,503),xy(224,486),xy(233,483)]).
midline(r2, [xy(234,481),xy(241,478),xy(260,459),xy(265,448),xy(265,353),xy(262,333),xy(259,328),xy(239,324),xy(164,325)]).
midline(r2, [xy(247,480),xy(245,476),xy(250,481)]).
midline(r2, [xy(219,507),xy(220,508)]).
fillpoint(r2, xy(81,489), 41.0).
fillpoint(r2, xy(91,490), 40.0).
fillpoint(r2, xy(225,485), 35.4).
fillpoint(r2, xy(141,530), 31.0).
fillpoint(r2, xy(168,529), 30.0).
fillpoint(r2, xy(260,329), 29.7).
fillpoint(r2, xy(241,478), 29.1).
fillpoint(r2, xy(218,501), 29.1).
fillpoint(r2, xy(258,328), 29.0).
fillpoint(r2, xy(261,331), 29.0).
fillpoint(r2, xy(68,468), 29.0).
fillpoint(r2, xy(171,528), 29.0).
fillpoint(r2, xy(255,327), 28.0).
fillpoint(r2, xy(262,334), 28.0).
fillpoint(r2, xy(67,465), 28.0).
fillpoint(r2, xy(174,527), 28.0).
fillpoint(r2, xy(252,326), 27.0).
fillpoint(r2, xy(263,337), 27.0).
fillpoint(r2, xy(66,462), 27.0).
fillpoint(r2, xy(177,526), 27.0).
fillpoint(r2, xy(248,325), 26.0).
fillpoint(r2, xy(264,342), 26.0).
fillpoint(r2, xy(65,458), 26.0).
fillpoint(r2, xy(182,525), 26.0).
fillpoint(r2, xy(65,326), 25.0).
fillpoint(r2, xy(164,325), 25.0).
fillpoint(r2, xy(264,400), 25.0).
fillpoint(r2, xy(264,450), 25.0).
fillpoint(r2, xy(190,524), 25.0).
fillpoint(r2, xy(259,460), 22.8).
fillpoint(r2, xy(200,519), 22.8).
fillpoint(r2, xy(79,184), 11.0).
border(r2).
region(r3, '#2ecc40', 19900, centroid(175,274)).
perimeter(r3, 1240).
polygon(r3, [xy(299,450),xy(290,449),xy(289,300),xy(140,300),xy(139,350),xy(90,349),xy(90,170),xy(149,170),xy(150,180),xy(189,180),xy(190,190),xy(210,190),xy(209,200),xy(140,200),xy(140,250),xy(269,250),xy(270,259),xy(279,260),xy(280,269),xy(290,270),xy(290,289),xy(300,290),xy(300,329),xy(310,330),xy(310,409),xy(300,410),xy(299,450)]).
midline(r3, [xy(202,195),xy(186,194),xy(180,189),xy(144,189),xy(135,184),xy(115,195),xy(114,249),xy(116,263),xy(121,274),xy(115,291),xy(115,325)]).
midline(r3, [xy(203,195),xy(205,195)]).
midline(r3, [xy(122,274),xy(248,274),xy(275,284),xy(286,294),xy(294,295),xy(294,328),xy(296,335),xy(300,339),xy(300,400),xy(294,410),xy(295,445)]).
fillpoint(r3, xy(121,275), 31.4).
fillpoint(r3, xy(118,268), 29.0).
fillpoint(r3, xy(118,281), 29.0).
fillpoint(r3, xy(117,265), 28.0).
fillpoint(r3, xy(117,284), 28.0).
fillpoint(r3, xy(116,262), 27.0).
fillpoint(r3, xy(116,287), 27.0).
fillpoint(r3, xy(115,258), 26.0).
fillpoint(r3, xy(115,292), 26.0).
fillpoint(r3, xy(115,195), 25.5).
fillpoint(r3, xy(114,225), 25.0).
fillpoint(r3, xy(141,275), 25.0).
fillpoint(r3, xy(115,313), 25.0).
fillpoint(r3, xy(134,185), 16.0).
fillpoint(r3, xy(274,284), 16.0).
fillpoint(r3, xy(145,189), 11.0).
fillpoint(r3, xy(151,190), 10.0).
fillpoint(r3, xy(299,370), 10.0).
region(r6, '#2ecc40', 13700, centroid(175,415)).
perimeter(r6, 840).
polygon(r6, [xy(189,500),xy(140,500),xy(140,450),xy(90,449),xy(90,400),xy(139,400),xy(140,350),xy(239,350),xy(240,449),xy(190,450),xy(189,500)]).
hole(r6, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
hole(r6, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r6, [xy(230,440),xy(223,444),xy(206,444),xy(192,433),xy(161,424),xy(148,417),xy(133,405),xy(100,404),xy(95,405),xy(94,410),xy(95,444),xy(133,444),xy(148,432),xy(162,425)]).
midline(r6, [xy(230,438),xy(234,433),xy(234,416),xy(224,404),xy(216,387),xy(208,379),xy(185,381),xy(174,386),xy(165,423)]).
midline(r6, [xy(224,405),xy(195,434)]).
midline(r6, [xy(165,426),xy(165,475)]).
fillpoint(r6, xy(175,385), 35.4).
fillpoint(r6, xy(165,425), 35.4).
fillpoint(r6, xy(186,381), 32.0).
fillpoint(r6, xy(171,396), 32.0).
fillpoint(r6, xy(168,413), 32.0).
fillpoint(r6, xy(170,401), 31.1).
fillpoint(r6, xy(169,408), 31.1).
fillpoint(r6, xy(192,380), 31.0).
fillpoint(r6, xy(201,380), 30.0).
fillpoint(r6, xy(165,463), 25.0).
fillpoint(r6, xy(224,404), 16.0).
fillpoint(r6, xy(194,434), 16.0).
fillpoint(r6, xy(229,440), 10.0).
region(r18, '#5a5a5a', 6400, centroid(390,620)).
perimeter(r18, 680).
polygon(r18, [xy(549,630),xy(230,630),xy(230,610),xy(549,610),xy(549,630)]).
midline(r18, [xy(404,619),xy(239,620)]).
midline(r18, [xy(405,620),xy(540,620)]).
fillpoint(r18, xy(239,620), 10.0).
region(r4, '#ffdc00', 5400, centroid(195,227)).
perimeter(r4, 360).
polygon(r4, [xy(269,250),xy(140,250),xy(140,200),xy(219,200),xy(220,210),xy(239,210),xy(240,219),xy(249,220),xy(250,229),xy(259,230),xy(260,239),xy(270,240),xy(269,250)]).
midline(r4, [xy(246,239),xy(222,229),xy(205,227),xy(199,223),xy(197,225),xy(164,225)]).
midline(r4, [xy(247,239),xy(256,244),xy(265,245)]).
fillpoint(r4, xy(164,225), 25.0).
fillpoint(r4, xy(213,229), 21.0).
fillpoint(r4, xy(221,230), 20.0).
fillpoint(r4, xy(234,234), 16.0).
fillpoint(r4, xy(245,239), 11.0).
region(r15, '#7fdbff', 2000, centroid(64,576)).
perimeter(r15, 240).
polygon(r15, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r15, [xy(51,560),xy(39,560)]).
midline(r15, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r15, xy(58,561), 12.0).
fillpoint(r15, xy(61,578), 12.0).
fillpoint(r15, xy(78,581), 12.0).
fillpoint(r15, xy(54,560), 11.0).
fillpoint(r15, xy(59,565), 11.0).
fillpoint(r15, xy(60,574), 11.0).
fillpoint(r15, xy(65,579), 11.0).
fillpoint(r15, xy(74,580), 11.0).
fillpoint(r15, xy(79,585), 11.0).
fillpoint(r15, xy(39,560), 10.0).
fillpoint(r15, xy(79,596), 10.0).
region(r17, '#2ecc40', 2000, centroid(180,620)).
perimeter(r17, 240).
polygon(r17, [xy(229,630),xy(130,630),xy(130,610),xy(229,610),xy(229,630)]).
midline(r17, [xy(151,620),xy(139,620)]).
midline(r17, [xy(152,619),xy(220,620)]).
fillpoint(r17, xy(139,620), 10.0).
region(r7, '#870c25', 1500, centroid(114,384)).
perimeter(r7, 160).
polygon(r7, [xy(139,400),xy(90,400),xy(90,370),xy(139,370),xy(139,400)]).
midline(r7, [xy(122,385),xy(104,385)]).
midline(r7, [xy(123,385),xy(125,385)]).
fillpoint(r7, xy(104,385), 15.0).
region(r5, '#bebebe', 1000, centroid(114,360)).
perimeter(r5, 140).
polygon(r5, [xy(139,370),xy(90,370),xy(90,350),xy(139,350),xy(139,370)]).
midline(r5, [xy(109,360),xy(99,360)]).
midline(r5, [xy(110,359),xy(130,360)]).
fillpoint(r5, xy(99,360), 10.0).
region(r16, '#7fdbff', 400, centroid(40,600)).
perimeter(r16, 80).
polygon(r16, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r16, [xy(39,599),xy(40,600)]).
fillpoint(r16, xy(39,600), 10.0).
region(r19, '#7fdbff', 400, centroid(570,620)).
perimeter(r19, 80).
polygon(r19, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r19, [xy(569,619),xy(570,620)]).
fillpoint(r19, xy(569,620), 10.0).
region(r20, '#7fdbff', 400, centroid(600,620)).
perimeter(r20, 80).
polygon(r20, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r20, [xy(599,619),xy(600,620)]).
fillpoint(r20, xy(599,620), 10.0).
region(r21, '#2ecc40', 400, centroid(630,620)).
perimeter(r21, 80).
polygon(r21, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r21, [xy(629,619),xy(630,620)]).
fillpoint(r21, xy(629,620), 10.0).
border(r21).
region(r13, '#000000', 300, centroid(218,428)).
perimeter(r13, 80).
polygon(r13, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r13, [xy(215,431),xy(215,425),xy(225,425)]).
midline(r13, [xy(214,432),xy(215,435)]).
fillpoint(r13, xy(216,425), 6.0).
fillpoint(r13, xy(221,425), 5.0).
fillpoint(r13, xy(215,433), 5.0).
region(r10, '#000000', 100, centroid(204,414)).
perimeter(r10, 40).
polygon(r10, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r10, [xy(205,415),xy(205,414)]).
fillpoint(r10, xy(204,415), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 900).
adjacent(r1, r3).
shared_edge(r1, r3, 410).
adjacent(r1, r4).
shared_edge(r1, r4, 110).
adjacent(r1, r15).
shared_edge(r1, r15, 240).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 220).
adjacent(r1, r18).
shared_edge(r1, r18, 660).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 530).
adjacent(r2, r5).
shared_edge(r2, r5, 20).
adjacent(r2, r6).
shared_edge(r2, r6, 500).
adjacent(r2, r7).
shared_edge(r2, r7, 30).
adjacent(r3, r4).
shared_edge(r3, r4, 250).
adjacent(r3, r5).
shared_edge(r3, r5, 50).
adjacent(r5, r6).
shared_edge(r5, r6, 20).
adjacent(r5, r7).
shared_edge(r5, r7, 50).
adjacent(r6, r7).
shared_edge(r6, r7, 80).
adjacent(r6, r10).
shared_edge(r6, r10, 40).
adjacent(r6, r13).
shared_edge(r6, r13, 80).
adjacent(r17, r18).
shared_edge(r17, r18, 20).

encloses(r6, r10).
encloses(r6, r13).
encloses(r1, r15).
encloses(r1, r16).
encloses(r1, r19).
encloses(r1, r20).
