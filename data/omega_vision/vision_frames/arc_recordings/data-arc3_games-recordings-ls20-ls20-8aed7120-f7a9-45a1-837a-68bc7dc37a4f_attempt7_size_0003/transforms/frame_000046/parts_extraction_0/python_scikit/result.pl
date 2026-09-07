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

region(r1, '#aaaaaa', 309400, centroid(365,295)).
perimeter(r1, 5280).
polygon(r1, [xy(0,540),xy(9,540),xy(10,530),xy(109,530),xy(110,569),xy(149,570),xy(150,560),xy(189,560),xy(190,550),xy(209,550),xy(210,540),xy(219,540),xy(220,530),xy(239,530),xy(240,520),xy(249,520),xy(250,510),xy(259,510),xy(260,500),xy(270,499),xy(270,480),xy(279,480),xy(280,470),xy(290,469),xy(290,450),xy(300,449),xy(300,410),xy(310,409),xy(310,330),xy(300,329),xy(300,290),xy(290,289),xy(290,270),xy(280,270),xy(279,260),xy(270,259),xy(270,240),xy(260,240),xy(260,230),xy(250,230),xy(250,220),xy(240,219),xy(239,210),xy(220,210),xy(220,200),xy(210,199),xy(209,190),xy(190,190),xy(189,180),xy(150,180),xy(149,170),xy(70,170),xy(69,180),xy(40,180),xy(40,519),xy(0,520)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,590),xy(70,589),xy(70,550),xy(50,550),xy(50,589),xy(30,590),xy(30,609),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(473,296),xy(465,232),xy(461,212),xy(456,205),xy(367,294),xy(347,299),xy(337,304),xy(335,303),xy(335,305)]).
midline(r1, [xy(473,297),xy(475,409),xy(473,442),xy(470,445),xy(417,485),xy(380,448),xy(366,446),xy(352,440),xy(348,441),xy(323,429),xy(331,437)]).
midline(r1, [xy(372,448),xy(412,490),xy(369,517),xy(345,528),xy(318,544),xy(267,565),xy(240,570),xy(224,578),xy(214,578),xy(199,584),xy(169,584),xy(157,589),xy(133,589),xy(113,593),xy(89,570),xy(90,550),xy(83,544),xy(68,539),xy(50,539),xy(36,544),xy(27,552),xy(24,560),xy(25,565),xy(15,583),xy(14,608),xy(17,622),xy(30,625),xy(96,624),xy(109,617),xy(110,602),xy(113,594)]).
midline(r1, [xy(414,488),xy(415,486),xy(379,450)]).
midline(r1, [xy(333,436),xy(338,438)]).
midline(r1, [xy(367,447),xy(361,445)]).
midline(r1, [xy(473,443),xy(556,526),xy(554,528),xy(555,632),xy(553,634),xy(130,635),xy(124,633),xy(109,619)]).
midline(r1, [xy(555,633),xy(573,635),xy(585,632),xy(585,555),xy(557,527)]).
midline(r1, [xy(459,206),xy(454,185),xy(443,178),xy(374,142),xy(300,113),xy(285,110),xy(264,102),xy(226,93),xy(217,93),xy(215,91),xy(198,91),xy(167,85),xy(84,84),xy(52,120),xy(43,136),xy(27,155),xy(20,172),xy(20,500)]).
midline(r1, [xy(205,92),xy(188,109),xy(186,107),xy(188,101),xy(197,92)]).
midline(r1, [xy(186,109),xy(181,130),xy(174,144),xy(175,146),xy(176,144)]).
midline(r1, [xy(182,128),xy(182,129)]).
midline(r1, [xy(188,110),xy(188,115),xy(186,116)]).
midline(r1, [xy(188,117),xy(188,124),xy(185,127),xy(184,121)]).
midline(r1, [xy(178,139),xy(182,131)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,631),xy(613,634),xy(608,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(417,486),xy(416,487)]).
midline(r1, [xy(190,120),xy(216,94)]).
midline(r1, [xy(370,293),xy(456,207),xy(372,293)]).
midline(r1, [xy(376,291),xy(458,209)]).
midline(r1, [xy(182,134),xy(220,94)]).
midline(r1, [xy(615,633),xy(635,635)]).
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
midline(r2, [xy(64,447),xy(67,466),xy(80,489),xy(45,523),xy(39,525),xy(5,525),xy(5,535)]).
midline(r2, [xy(81,489),xy(100,489),xy(140,530),xy(131,549)]).
midline(r2, [xy(141,530),xy(162,529),xy(164,531),xy(166,529),xy(165,532),xy(169,537),xy(168,531)]).
midline(r2, [xy(168,529),xy(181,525),xy(189,526)]).
midline(r2, [xy(65,446),xy(64,204),xy(75,193),xy(80,179)]).
midline(r2, [xy(190,524),xy(200,520)]).
midline(r2, [xy(201,518),xy(216,504)]).
midline(r2, [xy(217,502),xy(224,486),xy(233,483)]).
midline(r2, [xy(171,537),xy(169,539),xy(173,541)]).
midline(r2, [xy(234,481),xy(241,478),xy(260,459),xy(265,449),xy(265,351),xy(261,330),xy(253,326),xy(238,324),xy(164,325)]).
midline(r2, [xy(247,480),xy(245,476),xy(250,481)]).
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
midline(r3, [xy(140,274),xy(123,275),xy(120,273),xy(116,263),xy(114,249),xy(115,195),xy(135,184),xy(150,190),xy(180,189),xy(186,194),xy(205,195)]).
midline(r3, [xy(141,275),xy(244,275),xy(249,274),xy(252,267),xy(252,270)]).
midline(r3, [xy(250,275),xy(275,284),xy(286,294),xy(294,295),xy(294,329),xy(300,339),xy(300,400),xy(294,410),xy(295,445)]).
midline(r3, [xy(121,275),xy(115,291),xy(115,325)]).
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
region(r6, '#2ecc40', 12800, centroid(176,411)).
perimeter(r6, 960).
polygon(r6, [xy(189,500),xy(140,500),xy(140,450),xy(90,449),xy(90,400),xy(139,400),xy(140,350),xy(239,350),xy(240,449),xy(190,450),xy(189,500)]).
hole(r6, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
hole(r6, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
hole(r6, [xy(180,489),xy(179,460),xy(150,460),xy(150,490),xy(180,489)]).
midline(r6, [xy(230,440),xy(219,445),xy(206,444),xy(194,434),xy(155,421),xy(135,406),xy(128,404),xy(95,405),xy(95,444),xy(133,444),xy(153,428),xy(153,430)]).
midline(r6, [xy(155,429),xy(163,425),xy(164,428),xy(156,443),xy(145,456),xy(144,489),xy(145,494),xy(150,495),xy(183,494),xy(185,489),xy(184,456),xy(164,429)]).
midline(r6, [xy(165,427),xy(168,431)]).
midline(r6, [xy(230,438),xy(234,433),xy(234,416),xy(224,404),xy(220,393),xy(209,379),xy(190,380),xy(176,384),xy(171,395),xy(165,423)]).
midline(r6, [xy(224,405),xy(195,434)]).
fillpoint(r6, xy(175,385), 35.4).
fillpoint(r6, xy(165,424), 35.4).
fillpoint(r6, xy(186,381), 32.0).
fillpoint(r6, xy(171,396), 32.0).
fillpoint(r6, xy(168,413), 32.0).
fillpoint(r6, xy(170,401), 31.1).
fillpoint(r6, xy(169,408), 31.1).
fillpoint(r6, xy(192,380), 31.0).
fillpoint(r6, xy(201,380), 30.0).
fillpoint(r6, xy(224,404), 16.0).
fillpoint(r6, xy(194,434), 16.0).
fillpoint(r6, xy(229,440), 10.0).
region(r4, '#ffdc00', 5400, centroid(195,227)).
perimeter(r4, 360).
polygon(r4, [xy(269,250),xy(140,250),xy(140,200),xy(219,200),xy(220,210),xy(239,210),xy(240,219),xy(249,220),xy(250,229),xy(259,230),xy(260,239),xy(270,240),xy(269,250)]).
midline(r4, [xy(246,239),xy(222,229),xy(212,229),xy(199,224),xy(164,225)]).
midline(r4, [xy(247,239),xy(256,244),xy(265,245)]).
fillpoint(r4, xy(164,225), 25.0).
fillpoint(r4, xy(213,229), 21.0).
fillpoint(r4, xy(221,230), 20.0).
fillpoint(r4, xy(234,234), 16.0).
fillpoint(r4, xy(245,239), 11.0).
region(r19, '#5a5a5a', 5200, centroid(420,620)).
perimeter(r19, 560).
polygon(r19, [xy(549,630),xy(290,630),xy(290,610),xy(549,610),xy(549,630)]).
midline(r19, [xy(439,620),xy(299,620)]).
midline(r19, [xy(440,620),xy(540,620)]).
fillpoint(r19, xy(299,620), 10.0).
region(r18, '#2ecc40', 3200, centroid(210,620)).
perimeter(r18, 360).
polygon(r18, [xy(289,630),xy(130,630),xy(130,610),xy(289,610),xy(289,630)]).
midline(r18, [xy(184,620),xy(139,620)]).
midline(r18, [xy(185,619),xy(280,620)]).
fillpoint(r18, xy(139,620), 10.0).
region(r17, '#870c25', 2000, centroid(60,588)).
perimeter(r17, 240).
polygon(r17, [xy(89,610),xy(30,609),xy(30,590),xy(50,589),xy(50,550),xy(70,550),xy(70,589),xy(90,590),xy(89,610)]).
midline(r17, [xy(60,572),xy(60,559)]).
midline(r17, [xy(59,573),xy(60,595),xy(55,599),xy(39,600)]).
midline(r17, [xy(60,597),xy(80,600)]).
fillpoint(r17, xy(60,597), 12.8).
fillpoint(r17, xy(54,599), 11.0).
fillpoint(r17, xy(65,599), 11.0).
fillpoint(r17, xy(59,574), 10.0).
fillpoint(r17, xy(39,600), 10.0).
fillpoint(r17, xy(71,600), 10.0).
region(r7, '#870c25', 1500, centroid(114,384)).
perimeter(r7, 160).
polygon(r7, [xy(139,400),xy(90,400),xy(90,370),xy(139,370),xy(139,400)]).
midline(r7, [xy(112,385),xy(104,385)]).
midline(r7, [xy(113,385),xy(125,385)]).
fillpoint(r7, xy(104,385), 15.0).
region(r5, '#bebebe', 1000, centroid(114,360)).
perimeter(r5, 140).
polygon(r5, [xy(139,370),xy(90,370),xy(90,350),xy(139,350),xy(139,370)]).
midline(r5, [xy(109,360),xy(99,360)]).
midline(r5, [xy(110,359),xy(130,360)]).
fillpoint(r5, xy(99,360), 10.0).
region(r15, '#5a5a5a', 800, centroid(164,474)).
perimeter(r15, 160).
polygon(r15, [xy(179,490),xy(150,489),xy(150,460),xy(180,460),xy(179,490)]).
hole(r15, [xy(170,479),xy(169,470),xy(160,470),xy(160,480),xy(170,479)]).
midline(r15, [xy(155,477),xy(155,465),xy(174,465),xy(175,470),xy(173,484),xy(156,484),xy(155,478)]).
fillpoint(r15, xy(156,465), 6.0).
fillpoint(r15, xy(174,465), 6.0).
fillpoint(r15, xy(155,484), 6.0).
fillpoint(r15, xy(173,484), 6.0).
fillpoint(r15, xy(161,465), 5.0).
fillpoint(r15, xy(154,475), 5.0).
fillpoint(r15, xy(174,475), 5.0).
fillpoint(r15, xy(161,485), 5.0).
region(r20, '#7fdbff', 400, centroid(570,620)).
perimeter(r20, 80).
polygon(r20, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r20, [xy(569,619),xy(570,620)]).
fillpoint(r20, xy(569,620), 10.0).
region(r21, '#7fdbff', 400, centroid(600,620)).
perimeter(r21, 80).
polygon(r21, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r21, [xy(599,619),xy(600,620)]).
fillpoint(r21, xy(599,620), 10.0).
region(r22, '#2ecc40', 400, centroid(630,620)).
perimeter(r22, 80).
polygon(r22, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r22, [xy(629,619),xy(630,620)]).
fillpoint(r22, xy(629,620), 10.0).
border(r22).
region(r13, '#000000', 300, centroid(218,428)).
perimeter(r13, 80).
polygon(r13, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r13, [xy(215,434),xy(215,425),xy(225,425)]).
midline(r13, [xy(214,435),xy(215,435)]).
fillpoint(r13, xy(216,425), 6.0).
fillpoint(r13, xy(221,425), 5.0).
fillpoint(r13, xy(215,433), 5.0).
region(r10, '#000000', 100, centroid(204,414)).
perimeter(r10, 40).
polygon(r10, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r10, [xy(205,415),xy(205,414)]).
fillpoint(r10, xy(204,415), 5.0).
region(r16, '#2ecc40', 100, centroid(164,474)).
perimeter(r16, 40).
polygon(r16, [xy(169,480),xy(160,479),xy(160,470),xy(170,470),xy(169,480)]).
midline(r16, [xy(165,475),xy(165,474)]).
fillpoint(r16, xy(164,475), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 900).
adjacent(r1, r3).
shared_edge(r1, r3, 410).
adjacent(r1, r4).
shared_edge(r1, r4, 110).
adjacent(r1, r17).
shared_edge(r1, r17, 240).
adjacent(r1, r18).
shared_edge(r1, r18, 340).
adjacent(r1, r19).
shared_edge(r1, r19, 540).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 60).
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
adjacent(r6, r15).
shared_edge(r6, r15, 120).
adjacent(r15, r16).
shared_edge(r15, r16, 40).
adjacent(r18, r19).
shared_edge(r18, r19, 20).

encloses(r6, r10).
encloses(r6, r13).
encloses(r15, r16).
encloses(r1, r17).
encloses(r1, r20).
encloses(r1, r21).
