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

region(r1, '#aaaaaa', 313800, centroid(362,285)).
perimeter(r1, 5280).
polygon(r1, [xy(0,590),xy(10,589),xy(10,530),xy(109,530),xy(110,620),xy(120,619),xy(120,600),xy(209,600),xy(210,590),xy(219,590),xy(220,580),xy(239,580),xy(240,570),xy(249,570),xy(250,560),xy(259,560),xy(260,550),xy(270,549),xy(270,530),xy(280,529),xy(280,490),xy(300,489),xy(300,460),xy(310,459),xy(310,380),xy(300,379),xy(300,340),xy(290,339),xy(290,320),xy(280,320),xy(280,310),xy(270,309),xy(270,290),xy(260,290),xy(260,280),xy(250,280),xy(250,270),xy(240,269),xy(239,260),xy(220,260),xy(220,250),xy(210,250),xy(209,240),xy(190,240),xy(189,230),xy(150,230),xy(149,220),xy(116,220),xy(70,220),xy(69,230),xy(40,230),xy(40,519),xy(0,520)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(50,609),xy(50,590),xy(89,590),xy(90,570),xy(50,570),xy(50,550),xy(30,550),xy(30,609),xy(50,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(90,549),xy(69,550),xy(63,544),xy(49,539),xy(21,541),xy(19,551),xy(19,595),xy(14,608),xy(17,622),xy(23,624),xy(56,624),xy(74,614),xy(85,614),xy(96,625),xy(104,629),xy(117,630),xy(120,628),xy(124,633),xy(132,635),xy(553,634),xy(555,632),xy(555,526),xy(475,445),xy(429,487),xy(379,523),xy(342,487),xy(333,485),xy(328,481),xy(326,482),xy(331,485)]).
midline(r1, [xy(556,526),xy(586,556),xy(584,560),xy(584,633),xy(578,635),xy(555,633)]).
midline(r1, [xy(86,613),xy(95,603),xy(100,589),xy(99,564),xy(90,551)]).
midline(r1, [xy(377,524),xy(349,539),xy(305,569),xy(246,594),xy(234,594),xy(209,605),xy(125,605),xy(124,623),xy(121,627)]).
midline(r1, [xy(475,444),xy(474,355),xy(466,288),xy(459,259),xy(376,342),xy(365,345),xy(356,343),xy(347,348),xy(345,350),xy(347,350)]).
midline(r1, [xy(361,346),xy(362,345)]).
midline(r1, [xy(460,258),xy(458,257),xy(375,340)]).
midline(r1, [xy(459,256),xy(443,197),xy(394,171),xy(333,146),xy(241,120),xy(169,110),xy(109,109),xy(55,166),xy(41,189),xy(27,205),xy(20,222),xy(20,500)]).
midline(r1, [xy(221,119),xy(187,153),xy(188,156),xy(182,171),xy(183,174),xy(179,180),xy(180,184),xy(172,199),xy(176,197)]).
midline(r1, [xy(187,163),xy(186,164)]).
midline(r1, [xy(349,350),xy(356,345),xy(359,346),xy(356,347)]).
midline(r1, [xy(181,183),xy(181,180),xy(183,180)]).
midline(r1, [xy(183,176),xy(182,177)]).
midline(r1, [xy(42,190),xy(50,205),xy(49,207),xy(51,207)]).
midline(r1, [xy(181,185),xy(179,187)]).
midline(r1, [xy(587,557),xy(615,585),xy(615,630),xy(613,634),xy(609,635),xy(585,633)]).
midline(r1, [xy(330,147),xy(328,149)]).
midline(r1, [xy(615,633),xy(635,635)]).
fillpoint(r1, xy(443,197), 197.0).
fillpoint(r1, xy(444,200), 196.0).
fillpoint(r1, xy(445,203), 195.0).
fillpoint(r1, xy(446,206), 194.0).
fillpoint(r1, xy(447,209), 193.0).
fillpoint(r1, xy(448,212), 192.0).
fillpoint(r1, xy(450,219), 190.0).
fillpoint(r1, xy(452,226), 188.0).
fillpoint(r1, xy(453,230), 187.0).
fillpoint(r1, xy(454,234), 186.0).
fillpoint(r1, xy(455,238), 185.0).
fillpoint(r1, xy(456,242), 184.0).
fillpoint(r1, xy(457,247), 183.0).
fillpoint(r1, xy(458,251), 182.0).
fillpoint(r1, xy(459,255), 181.0).
fillpoint(r1, xy(460,259), 180.0).
fillpoint(r1, xy(461,263), 179.0).
fillpoint(r1, xy(462,268), 178.0).
fillpoint(r1, xy(463,273), 177.0).
fillpoint(r1, xy(464,278), 176.0).
fillpoint(r1, xy(465,284), 175.0).
fillpoint(r1, xy(466,290), 174.0).
fillpoint(r1, xy(467,297), 173.0).
fillpoint(r1, xy(468,307), 172.0).
fillpoint(r1, xy(469,317), 171.0).
fillpoint(r1, xy(470,325), 170.0).
fillpoint(r1, xy(471,331), 169.0).
fillpoint(r1, xy(472,338), 168.0).
fillpoint(r1, xy(473,347), 167.0).
fillpoint(r1, xy(474,359), 166.0).
fillpoint(r1, xy(475,413), 165.0).
fillpoint(r1, xy(332,146), 147.0).
fillpoint(r1, xy(329,145), 146.0).
fillpoint(r1, xy(326,144), 145.0).
fillpoint(r1, xy(323,143), 144.0).
fillpoint(r1, xy(320,142), 143.0).
fillpoint(r1, xy(310,139), 140.0).
fillpoint(r1, xy(306,138), 139.0).
fillpoint(r1, xy(302,137), 138.0).
fillpoint(r1, xy(277,129), 130.0).
fillpoint(r1, xy(265,126), 127.0).
fillpoint(r1, xy(261,125), 126.0).
fillpoint(r1, xy(256,124), 125.0).
fillpoint(r1, xy(252,123), 124.0).
fillpoint(r1, xy(248,122), 123.0).
fillpoint(r1, xy(244,121), 122.0).
fillpoint(r1, xy(240,120), 121.0).
fillpoint(r1, xy(235,119), 120.0).
fillpoint(r1, xy(230,118), 119.0).
fillpoint(r1, xy(224,117), 118.0).
fillpoint(r1, xy(217,116), 117.0).
fillpoint(r1, xy(207,115), 116.0).
fillpoint(r1, xy(194,114), 115.0).
fillpoint(r1, xy(189,113), 114.0).
fillpoint(r1, xy(184,112), 113.0).
fillpoint(r1, xy(176,111), 112.0).
fillpoint(r1, xy(166,110), 111.0).
fillpoint(r1, xy(109,110), 110.0).
border(r1).
region(r2, '#ffdc00', 50600, centroid(156,439)).
perimeter(r2, 2100).
polygon(r2, [xy(0,520),xy(40,519),xy(40,230),xy(69,230),xy(70,220),xy(90,220),xy(90,449),xy(139,450),xy(140,500),xy(189,500),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(269,300),xy(270,309),xy(279,310),xy(280,320),xy(290,320),xy(290,479),xy(270,480),xy(270,549),xy(260,550),xy(260,559),xy(250,560),xy(250,569),xy(240,570),xy(239,580),xy(220,580),xy(220,589),xy(210,590),xy(209,600),xy(120,600),xy(120,619),xy(110,620),xy(109,530),xy(10,530),xy(10,589),xy(0,590)]).
midline(r2, [xy(65,322),xy(64,448),xy(68,469),xy(80,489),xy(43,524),xy(5,525),xy(5,585)]).
midline(r2, [xy(81,489),xy(100,489),xy(159,549),xy(116,594),xy(114,600),xy(115,615)]).
midline(r2, [xy(160,550),xy(176,549),xy(178,552),xy(180,550),xy(178,549)]).
midline(r2, [xy(65,321),xy(64,254),xy(75,243),xy(80,229)]).
midline(r2, [xy(181,549),xy(215,535)]).
midline(r2, [xy(216,533),xy(225,525)]).
midline(r2, [xy(226,523),xy(229,511),xy(229,489),xy(264,455),xy(265,342),xy(258,332),xy(249,325),xy(164,325)]).
midline(r2, [xy(249,324),xy(249,321),xy(251,319),xy(251,321)]).
midline(r2, [xy(183,561),xy(180,560),xy(184,564)]).
midline(r2, [xy(184,566),xy(188,571),xy(187,573),xy(189,573)]).
midline(r2, [xy(183,559),xy(179,553),xy(181,551),xy(181,553)]).
midline(r2, [xy(267,340),xy(266,341)]).
fillpoint(r2, xy(159,550), 50.0).
fillpoint(r2, xy(190,545), 46.0).
fillpoint(r2, xy(195,543), 44.4).
fillpoint(r2, xy(211,537), 43.9).
fillpoint(r2, xy(198,542), 43.9).
fillpoint(r2, xy(226,522), 43.6).
fillpoint(r2, xy(225,524), 43.6).
fillpoint(r2, xy(224,525), 43.6).
fillpoint(r2, xy(215,534), 43.6).
fillpoint(r2, xy(214,535), 43.6).
fillpoint(r2, xy(209,538), 43.4).
fillpoint(r2, xy(200,541), 43.4).
fillpoint(r2, xy(206,539), 43.3).
fillpoint(r2, xy(203,540), 43.3).
fillpoint(r2, xy(228,515), 42.0).
fillpoint(r2, xy(81,489), 41.0).
fillpoint(r2, xy(229,509), 41.0).
fillpoint(r2, xy(91,490), 40.0).
fillpoint(r2, xy(229,494), 40.0).
fillpoint(r2, xy(68,468), 29.0).
fillpoint(r2, xy(67,465), 28.0).
fillpoint(r2, xy(66,462), 27.0).
fillpoint(r2, xy(250,326), 26.2).
fillpoint(r2, xy(263,339), 26.2).
fillpoint(r2, xy(248,325), 26.0).
fillpoint(r2, xy(264,342), 26.0).
fillpoint(r2, xy(65,458), 26.0).
fillpoint(r2, xy(264,455), 25.7).
fillpoint(r2, xy(254,329), 25.6).
fillpoint(r2, xy(255,330), 25.6).
fillpoint(r2, xy(257,331), 25.6).
fillpoint(r2, xy(258,332), 25.6).
fillpoint(r2, xy(259,334), 25.6).
fillpoint(r2, xy(260,335), 25.6).
fillpoint(r2, xy(65,351), 25.0).
fillpoint(r2, xy(164,325), 25.0).
fillpoint(r2, xy(264,400), 25.0).
border(r2).
region(r3, '#2ecc40', 25600, centroid(162,346)).
perimeter(r3, 1360).
polygon(r3, [xy(189,500),xy(140,499),xy(140,400),xy(90,399),xy(90,220),xy(139,220),xy(140,250),xy(219,250),xy(220,260),xy(239,260),xy(240,269),xy(249,270),xy(250,279),xy(259,280),xy(260,290),xy(270,290),xy(269,300),xy(140,300),xy(140,350),xy(240,350),xy(240,449),xy(190,450),xy(189,500)]).
hole(r3, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
hole(r3, [xy(180,489),xy(179,460),xy(150,460),xy(150,490),xy(180,489)]).
midline(r3, [xy(230,440),xy(218,445),xy(206,444),xy(192,433),xy(171,427),xy(169,410),xy(173,386),xy(153,376),xy(130,374),xy(118,369),xy(114,349),xy(114,300),xy(116,286),xy(121,274),xy(115,259),xy(115,244)]).
midline(r3, [xy(170,427),xy(145,456),xy(145,494),xy(179,495),xy(184,493),xy(184,456),xy(174,444),xy(168,432)]).
midline(r3, [xy(122,274),xy(195,275),xy(201,269),xy(201,271)]).
midline(r3, [xy(200,274),xy(212,279),xy(220,280),xy(222,278),xy(244,289),xy(250,289),xy(256,294),xy(265,295)]).
midline(r3, [xy(174,385),xy(190,380),xy(210,379),xy(222,397),xy(224,405),xy(195,434)]).
midline(r3, [xy(230,438),xy(234,433),xy(235,421),xy(233,414),xy(225,405)]).
fillpoint(r3, xy(173,386), 36.1).
fillpoint(r3, xy(186,381), 32.0).
fillpoint(r3, xy(121,275), 31.4).
fillpoint(r3, xy(192,380), 31.0).
fillpoint(r3, xy(170,402), 31.0).
fillpoint(r3, xy(170,426), 30.8).
fillpoint(r3, xy(201,380), 30.0).
fillpoint(r3, xy(169,415), 30.0).
fillpoint(r3, xy(119,370), 29.7).
fillpoint(r3, xy(118,268), 29.0).
fillpoint(r3, xy(118,281), 29.0).
fillpoint(r3, xy(118,368), 29.0).
fillpoint(r3, xy(121,371), 29.0).
fillpoint(r3, xy(158,378), 29.0).
fillpoint(r3, xy(168,431), 29.0).
fillpoint(r3, xy(117,265), 28.0).
fillpoint(r3, xy(117,284), 28.0).
fillpoint(r3, xy(117,365), 28.0).
fillpoint(r3, xy(124,372), 28.0).
fillpoint(r3, xy(155,377), 28.0).
fillpoint(r3, xy(116,262), 27.0).
fillpoint(r3, xy(116,287), 27.0).
fillpoint(r3, xy(116,362), 27.0).
fillpoint(r3, xy(127,373), 27.0).
fillpoint(r3, xy(152,376), 27.0).
fillpoint(r3, xy(115,258), 26.0).
fillpoint(r3, xy(115,292), 26.0).
fillpoint(r3, xy(115,358), 26.0).
fillpoint(r3, xy(132,374), 26.0).
fillpoint(r3, xy(148,375), 26.0).
fillpoint(r3, xy(115,246), 25.0).
fillpoint(r3, xy(141,275), 25.0).
fillpoint(r3, xy(114,325), 25.0).
fillpoint(r3, xy(213,279), 21.0).
fillpoint(r3, xy(221,280), 20.0).
fillpoint(r3, xy(234,284), 16.0).
fillpoint(r3, xy(224,404), 16.0).
fillpoint(r3, xy(194,434), 16.0).
fillpoint(r3, xy(245,289), 11.0).
fillpoint(r3, xy(229,440), 10.0).
region(r13, '#2ecc40', 8400, centroid(340,620)).
perimeter(r13, 880).
polygon(r13, [xy(549,630),xy(130,630),xy(130,610),xy(549,610),xy(549,630)]).
midline(r13, [xy(304,619),xy(139,620)]).
midline(r13, [xy(305,619),xy(540,620)]).
fillpoint(r13, xy(139,620), 10.0).
region(r5, '#2ecc40', 2900, centroid(293,434)).
perimeter(r5, 460).
polygon(r5, [xy(279,530),xy(270,529),xy(270,480),xy(290,479),xy(290,340),xy(299,340),xy(300,379),xy(310,380),xy(310,459),xy(300,460),xy(300,489),xy(280,490),xy(279,530)]).
midline(r5, [xy(295,479),xy(294,461),xy(296,454),xy(300,450),xy(300,389),xy(296,385),xy(294,378),xy(295,344)]).
midline(r5, [xy(294,480),xy(293,484),xy(275,485),xy(275,525)]).
fillpoint(r5, xy(299,420), 10.0).
fillpoint(r5, xy(293,484), 6.0).
fillpoint(r5, xy(276,485), 6.0).
fillpoint(r5, xy(295,361), 5.0).
fillpoint(r5, xy(294,470), 5.0).
fillpoint(r5, xy(281,485), 5.0).
fillpoint(r5, xy(275,508), 5.0).
region(r12, '#870c25', 2000, centroid(52,580)).
perimeter(r12, 240).
polygon(r12, [xy(49,610),xy(30,609),xy(30,550),xy(49,550),xy(50,570),xy(90,570),xy(89,590),xy(50,590),xy(49,610)]).
midline(r12, [xy(40,585),xy(43,580),xy(40,575),xy(40,559)]).
midline(r12, [xy(40,586),xy(40,600)]).
midline(r12, [xy(44,580),xy(80,580)]).
fillpoint(r12, xy(42,580), 12.8).
fillpoint(r12, xy(40,574), 11.0).
fillpoint(r12, xy(40,585), 11.0).
fillpoint(r12, xy(39,564), 10.0).
fillpoint(r12, xy(51,580), 10.0).
fillpoint(r12, xy(39,596), 10.0).
region(r8, '#870c25', 1500, centroid(114,434)).
perimeter(r8, 160).
polygon(r8, [xy(139,450),xy(90,450),xy(90,420),xy(139,420),xy(139,450)]).
midline(r8, [xy(116,434),xy(104,435)]).
midline(r8, [xy(117,434),xy(125,435)]).
fillpoint(r8, xy(104,435), 15.0).
region(r4, '#ffdc00', 1300, centroid(168,239)).
perimeter(r4, 200).
polygon(r4, [xy(209,250),xy(140,250),xy(140,220),xy(149,220),xy(150,230),xy(189,230),xy(190,240),xy(209,240),xy(209,250)]).
midline(r4, [xy(149,240),xy(145,233),xy(145,224)]).
midline(r4, [xy(151,239),xy(180,239),xy(186,244),xy(205,245)]).
fillpoint(r4, xy(149,240), 10.0).
fillpoint(r4, xy(145,226), 5.0).
fillpoint(r4, xy(191,245), 5.0).
region(r6, '#bebebe', 1000, centroid(114,410)).
perimeter(r6, 140).
polygon(r6, [xy(139,420),xy(90,420),xy(90,400),xy(139,400),xy(139,420)]).
midline(r6, [xy(109,410),xy(99,410)]).
midline(r6, [xy(110,409),xy(130,410)]).
fillpoint(r6, xy(99,410), 10.0).
region(r10, '#5a5a5a', 800, centroid(164,474)).
perimeter(r10, 160).
polygon(r10, [xy(179,490),xy(150,489),xy(150,460),xy(180,460),xy(179,490)]).
hole(r10, [xy(170,479),xy(169,470),xy(160,470),xy(160,480),xy(170,479)]).
midline(r10, [xy(174,482),xy(175,470),xy(173,465),xy(155,465),xy(154,470),xy(155,484),xy(174,484)]).
fillpoint(r10, xy(156,465), 6.0).
fillpoint(r10, xy(174,465), 6.0).
fillpoint(r10, xy(155,484), 6.0).
fillpoint(r10, xy(173,484), 6.0).
fillpoint(r10, xy(161,465), 5.0).
fillpoint(r10, xy(154,475), 5.0).
fillpoint(r10, xy(174,475), 5.0).
fillpoint(r10, xy(161,485), 5.0).
region(r14, '#7fdbff', 400, centroid(570,620)).
perimeter(r14, 80).
polygon(r14, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r14, [xy(569,619),xy(570,620)]).
fillpoint(r14, xy(569,620), 10.0).
region(r15, '#7fdbff', 400, centroid(600,620)).
perimeter(r15, 80).
polygon(r15, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r15, [xy(599,619),xy(600,620)]).
fillpoint(r15, xy(599,620), 10.0).
region(r16, '#7fdbff', 400, centroid(630,620)).
perimeter(r16, 80).
polygon(r16, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r16, [xy(629,619),xy(630,620)]).
fillpoint(r16, xy(629,620), 10.0).
border(r16).
region(r9, '#000000', 300, centroid(218,428)).
perimeter(r9, 80).
polygon(r9, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r9, [xy(215,434),xy(215,435)]).
midline(r9, [xy(215,433),xy(215,425),xy(225,425)]).
fillpoint(r9, xy(216,425), 6.0).
fillpoint(r9, xy(221,425), 5.0).
fillpoint(r9, xy(215,433), 5.0).
region(r7, '#000000', 100, centroid(204,414)).
perimeter(r7, 40).
polygon(r7, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r7, [xy(205,415),xy(205,414)]).
fillpoint(r7, xy(204,415), 5.0).
region(r11, '#2ecc40', 100, centroid(164,474)).
perimeter(r11, 40).
polygon(r11, [xy(169,480),xy(160,479),xy(160,470),xy(170,470),xy(169,480)]).
midline(r11, [xy(165,475),xy(165,474)]).
fillpoint(r11, xy(164,475), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 960).
adjacent(r1, r3).
shared_edge(r1, r3, 160).
adjacent(r1, r4).
shared_edge(r1, r4, 100).
adjacent(r1, r5).
shared_edge(r1, r5, 250).
adjacent(r1, r12).
shared_edge(r1, r12, 240).
adjacent(r1, r13).
shared_edge(r1, r13, 880).
adjacent(r1, r14).
shared_edge(r1, r14, 80).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 760).
adjacent(r2, r5).
shared_edge(r2, r5, 210).
adjacent(r2, r6).
shared_edge(r2, r6, 20).
adjacent(r2, r8).
shared_edge(r2, r8, 80).
adjacent(r3, r4).
shared_edge(r3, r4, 100).
adjacent(r3, r6).
shared_edge(r3, r6, 70).
adjacent(r3, r7).
shared_edge(r3, r7, 40).
adjacent(r3, r8).
shared_edge(r3, r8, 30).
adjacent(r3, r9).
shared_edge(r3, r9, 80).
adjacent(r3, r10).
shared_edge(r3, r10, 120).
adjacent(r6, r8).
shared_edge(r6, r8, 50).
adjacent(r10, r11).
shared_edge(r10, r11, 40).

encloses(r3, r7).
encloses(r3, r9).
encloses(r10, r11).
encloses(r1, r12).
encloses(r1, r13).
encloses(r1, r14).
encloses(r1, r15).
