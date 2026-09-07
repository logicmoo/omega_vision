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

region(r1, '#aaaaaa', 309400, centroid(365,310)).
perimeter(r1, 4980).
polygon(r1, [xy(150,519),xy(150,510),xy(189,510),xy(190,500),xy(209,500),xy(210,490),xy(219,490),xy(220,480),xy(239,480),xy(240,470),xy(249,470),xy(250,460),xy(259,460),xy(260,450),xy(270,449),xy(270,430),xy(279,430),xy(280,420),xy(290,419),xy(290,400),xy(300,399),xy(300,360),xy(310,359),xy(310,280),xy(300,279),xy(300,240),xy(290,239),xy(290,220),xy(280,220),xy(280,210),xy(270,209),xy(270,190),xy(260,190),xy(260,180),xy(250,180),xy(250,170),xy(240,169),xy(239,160),xy(220,160),xy(220,150),xy(210,150),xy(209,140),xy(190,140),xy(189,130),xy(150,130),xy(149,120),xy(70,120),xy(69,130),xy(40,130),xy(40,509),xy(69,510),xy(70,520),xy(150,519)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(464,175),xy(450,168),xy(376,242),xy(360,244),xy(350,249),xy(342,250),xy(342,252)]).
midline(r1, [xy(375,240),xy(448,166),xy(413,144),xy(356,114),xy(286,86),xy(221,68),xy(205,65),xy(185,65),xy(164,60),xy(60,60),xy(43,86),xy(27,105),xy(20,122),xy(20,517),xy(27,534),xy(40,550),xy(43,539),xy(50,534),xy(45,539),xy(46,541),xy(41,551),xy(59,578),xy(76,579),xy(92,602),xy(124,633),xy(130,635),xy(545,635),xy(554,633),xy(555,525),xy(467,437),xy(437,458),xy(376,397),xy(370,398),xy(367,395),xy(355,393),xy(349,389),xy(345,390),xy(343,388),xy(344,391)]).
midline(r1, [xy(556,526),xy(585,556),xy(585,625),xy(583,634),xy(561,635),xy(555,633)]).
midline(r1, [xy(347,391),xy(349,391)]).
midline(r1, [xy(290,89),xy(238,141)]).
midline(r1, [xy(287,88),xy(238,138)]).
midline(r1, [xy(48,538),xy(47,540)]).
midline(r1, [xy(449,166),xy(450,167)]).
midline(r1, [xy(78,579),xy(100,569),xy(117,565),xy(162,564),xy(179,560),xy(179,555),xy(181,560)]).
midline(r1, [xy(183,559),xy(203,559),xy(242,550),xy(262,542),xy(287,536),xy(338,515),xy(350,508),xy(292,448),xy(352,508),xy(430,464),xy(432,462),xy(367,397)]).
midline(r1, [xy(371,399),xy(433,461),xy(437,459)]).
midline(r1, [xy(586,556),xy(615,585),xy(615,631),xy(609,635),xy(585,633)]).
midline(r1, [xy(467,436),xy(474,384),xy(475,280),xy(473,244),xy(464,177)]).
midline(r1, [xy(185,66),xy(177,91),xy(174,94),xy(175,96),xy(169,105),xy(171,105)]).
midline(r1, [xy(182,79),xy(181,80)]).
midline(r1, [xy(184,71),xy(184,72)]).
midline(r1, [xy(176,94),xy(176,95)]).
midline(r1, [xy(184,75),xy(182,77)]).
midline(r1, [xy(176,97),xy(174,99)]).
midline(r1, [xy(379,241),xy(450,170)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(382,150),xy(381,151)]).
midline(r1, [xy(332,149),xy(292,191),xy(335,148)]).
midline(r1, [xy(389,143),xy(388,144)]).
midline(r1, [xy(391,141),xy(390,142)]).
midline(r1, [xy(394,136),xy(391,139),xy(395,137)]).
fillpoint(r1, xy(463,176), 176.0).
fillpoint(r1, xy(464,178), 176.0).
fillpoint(r1, xy(465,184), 175.0).
fillpoint(r1, xy(466,190), 174.0).
fillpoint(r1, xy(467,197), 173.0).
fillpoint(r1, xy(467,437), 172.2).
fillpoint(r1, xy(468,207), 172.0).
fillpoint(r1, xy(468,433), 172.0).
fillpoint(r1, xy(469,217), 171.0).
fillpoint(r1, xy(469,422), 171.0).
fillpoint(r1, xy(470,225), 170.0).
fillpoint(r1, xy(470,415), 170.0).
fillpoint(r1, xy(471,231), 169.0).
fillpoint(r1, xy(471,409), 169.0).
fillpoint(r1, xy(472,238), 168.0).
fillpoint(r1, xy(472,401), 168.0).
fillpoint(r1, xy(473,247), 167.0).
fillpoint(r1, xy(473,393), 167.0).
fillpoint(r1, xy(474,259), 166.0).
fillpoint(r1, xy(474,381), 166.0).
fillpoint(r1, xy(474,320), 165.0).
fillpoint(r1, xy(285,86), 87.0).
fillpoint(r1, xy(318,523), 87.0).
fillpoint(r1, xy(278,84), 85.0).
fillpoint(r1, xy(273,83), 84.0).
fillpoint(r1, xy(258,78), 79.0).
fillpoint(r1, xy(255,77), 78.0).
fillpoint(r1, xy(252,76), 77.0).
fillpoint(r1, xy(245,74), 75.0).
fillpoint(r1, xy(241,73), 74.0).
fillpoint(r1, xy(236,72), 73.0).
fillpoint(r1, xy(231,71), 72.0).
fillpoint(r1, xy(227,70), 71.0).
fillpoint(r1, xy(277,539), 71.0).
fillpoint(r1, xy(224,69), 70.0).
fillpoint(r1, xy(274,540), 70.0).
fillpoint(r1, xy(220,68), 69.0).
fillpoint(r1, xy(270,541), 69.0).
fillpoint(r1, xy(215,67), 68.0).
fillpoint(r1, xy(265,542), 68.0).
fillpoint(r1, xy(210,66), 67.0).
fillpoint(r1, xy(260,543), 67.0).
fillpoint(r1, xy(203,65), 66.0).
fillpoint(r1, xy(188,64), 65.0).
fillpoint(r1, xy(174,62), 63.0).
fillpoint(r1, xy(169,61), 62.0).
fillpoint(r1, xy(247,548), 62.0).
fillpoint(r1, xy(162,60), 61.0).
fillpoint(r1, xy(244,549), 61.0).
fillpoint(r1, xy(60,60), 60.8).
fillpoint(r1, xy(60,579), 60.8).
fillpoint(r1, xy(71,60), 60.0).
fillpoint(r1, xy(241,550), 60.0).
fillpoint(r1, xy(71,580), 60.0).
fillpoint(r1, xy(237,551), 59.0).
fillpoint(r1, xy(233,552), 58.0).
fillpoint(r1, xy(228,553), 57.0).
fillpoint(r1, xy(216,556), 54.0).
fillpoint(r1, xy(212,557), 53.0).
fillpoint(r1, xy(208,558), 52.0).
fillpoint(r1, xy(201,559), 51.0).
fillpoint(r1, xy(178,560), 50.0).
fillpoint(r1, xy(101,569), 50.0).
fillpoint(r1, xy(171,562), 48.0).
fillpoint(r1, xy(108,567), 48.0).
fillpoint(r1, xy(166,563), 47.0).
fillpoint(r1, xy(113,566), 47.0).
fillpoint(r1, xy(160,564), 46.0).
fillpoint(r1, xy(119,565), 46.0).
fillpoint(r1, xy(131,565), 45.0).
border(r1).
region(r3, '#2ecc40', 25000, centroid(179,229)).
perimeter(r3, 1220).
polygon(r3, [xy(299,400),xy(290,399),xy(289,300),xy(90,299),xy(90,120),xy(149,120),xy(150,130),xy(189,130),xy(190,140),xy(209,140),xy(210,149),xy(220,150),xy(220,160),xy(240,160),xy(239,200),xy(140,200),xy(140,250),xy(289,250),xy(290,240),xy(300,240),xy(300,279),xy(310,280),xy(310,359),xy(300,360),xy(299,400)]).
midline(r3, [xy(123,153),xy(126,151),xy(125,147),xy(129,143),xy(127,149)]).
midline(r3, [xy(125,154),xy(129,162),xy(117,183),xy(114,200),xy(114,249),xy(118,269),xy(126,273),xy(140,275),xy(275,274),xy(286,285),xy(298,291),xy(300,300),xy(300,350),xy(294,360),xy(295,395)]).
midline(r3, [xy(276,273),xy(293,255),xy(295,244)]).
midline(r3, [xy(130,162),xy(161,165),xy(165,161),xy(163,165)]).
midline(r3, [xy(165,165),xy(180,169),xy(184,168),xy(205,177),xy(220,180)]).
fillpoint(r3, xy(129,162), 39.1).
fillpoint(r3, xy(141,164), 36.0).
fillpoint(r3, xy(151,165), 35.0).
fillpoint(r3, xy(176,168), 32.0).
fillpoint(r3, xy(182,169), 31.0).
fillpoint(r3, xy(119,270), 29.7).
fillpoint(r3, xy(191,171), 29.0).
fillpoint(r3, xy(118,181), 29.0).
fillpoint(r3, xy(118,268), 29.0).
fillpoint(r3, xy(121,271), 29.0).
fillpoint(r3, xy(194,172), 28.0).
fillpoint(r3, xy(117,184), 28.0).
fillpoint(r3, xy(117,265), 28.0).
fillpoint(r3, xy(124,272), 28.0).
fillpoint(r3, xy(116,187), 27.0).
fillpoint(r3, xy(116,262), 27.0).
fillpoint(r3, xy(127,273), 27.0).
fillpoint(r3, xy(115,192), 26.0).
fillpoint(r3, xy(115,258), 26.0).
fillpoint(r3, xy(132,274), 26.0).
fillpoint(r3, xy(114,225), 25.0).
fillpoint(r3, xy(141,275), 25.0).
fillpoint(r3, xy(213,179), 21.0).
fillpoint(r3, xy(297,291), 12.0).
fillpoint(r3, xy(299,295), 11.0).
fillpoint(r3, xy(299,326), 10.0).
region(r2, '#ffdc00', 23500, centroid(75,349)).
perimeter(r2, 1100).
polygon(r2, [xy(149,520),xy(70,520),xy(69,510),xy(40,509),xy(40,130),xy(69,130),xy(70,120),xy(90,120),xy(90,449),xy(139,450),xy(140,499),xy(190,500),xy(189,510),xy(150,510),xy(149,520)]).
midline(r2, [xy(161,504),xy(146,505),xy(140,510),xy(134,509),xy(126,505),xy(104,484),xy(95,485),xy(74,478),xy(66,463),xy(64,447),xy(64,154),xy(75,143),xy(80,129)]).
midline(r2, [xy(162,504),xy(185,505)]).
fillpoint(r2, xy(105,484), 35.0).
fillpoint(r2, xy(87,482), 33.1).
fillpoint(r2, xy(72,477), 33.0).
fillpoint(r2, xy(75,478), 32.6).
fillpoint(r2, xy(84,481), 32.6).
fillpoint(r2, xy(78,479), 32.3).
fillpoint(r2, xy(81,480), 32.3).
fillpoint(r2, xy(68,468), 29.0).
fillpoint(r2, xy(67,465), 28.0).
fillpoint(r2, xy(66,462), 27.0).
fillpoint(r2, xy(65,458), 26.0).
fillpoint(r2, xy(65,301), 25.0).
fillpoint(r2, xy(79,134), 11.0).
fillpoint(r2, xy(135,509), 11.0).
region(r8, '#2ecc40', 15300, centroid(166,405)).
perimeter(r8, 960).
polygon(r8, [xy(189,500),xy(140,500),xy(140,450),xy(90,449),xy(90,350),xy(240,350),xy(240,449),xy(190,450),xy(189,500)]).
hole(r8, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
hole(r8, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
hole(r8, [xy(180,489),xy(179,460),xy(150,460),xy(150,490),xy(180,489)]).
midline(r8, [xy(230,440),xy(223,444),xy(206,444),xy(192,433),xy(165,424),xy(147,433),xy(133,444),xy(100,445),xy(95,443),xy(95,406),xy(119,379),xy(144,381),xy(164,391),xy(185,381),xy(210,379),xy(220,393),xy(224,405),xy(195,434)]).
midline(r8, [xy(230,438),xy(234,433),xy(235,420),xy(233,414),xy(225,405)]).
midline(r8, [xy(165,392),xy(165,423)]).
midline(r8, [xy(184,488),xy(184,493),xy(178,495),xy(150,495),xy(146,494),xy(144,489),xy(145,456),xy(162,434),xy(161,431),xy(165,426),xy(167,434),xy(170,435),xy(173,444),xy(175,444)]).
midline(r8, [xy(185,487),xy(184,456),xy(175,446)]).
fillpoint(r8, xy(165,390), 40.3).
fillpoint(r8, xy(165,424), 35.4).
fillpoint(r8, xy(164,415), 35.0).
fillpoint(r8, xy(143,381), 32.0).
fillpoint(r8, xy(186,381), 32.0).
fillpoint(r8, xy(138,380), 31.0).
fillpoint(r8, xy(192,380), 31.0).
fillpoint(r8, xy(119,380), 30.0).
fillpoint(r8, xy(201,380), 30.0).
fillpoint(r8, xy(224,404), 16.0).
fillpoint(r8, xy(194,434), 16.0).
region(r6, '#ffdc00', 14300, centroid(230,370)).
perimeter(r6, 800).
polygon(r6, [xy(209,500),xy(190,499),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(289,300),xy(290,419),xy(280,420),xy(280,429),xy(270,430),xy(270,449),xy(260,450),xy(260,459),xy(250,460),xy(250,469),xy(240,470),xy(239,480),xy(220,480),xy(220,489),xy(210,490),xy(209,500)]).
midline(r6, [xy(226,324),xy(164,325)]).
midline(r6, [xy(227,325),xy(248,325),xy(261,330),xy(265,350),xy(265,399),xy(255,423),xy(255,435),xy(250,444),xy(250,449),xy(239,460),xy(234,460),xy(225,465),xy(207,467),xy(200,484),xy(200,490)]).
fillpoint(r6, xy(260,329), 29.7).
fillpoint(r6, xy(258,328), 29.0).
fillpoint(r6, xy(261,331), 29.0).
fillpoint(r6, xy(255,327), 28.0).
fillpoint(r6, xy(262,334), 28.0).
fillpoint(r6, xy(252,326), 27.0).
fillpoint(r6, xy(263,337), 27.0).
fillpoint(r6, xy(248,325), 26.0).
fillpoint(r6, xy(264,342), 26.0).
fillpoint(r6, xy(164,325), 25.0).
fillpoint(r6, xy(264,376), 25.0).
fillpoint(r6, xy(207,467), 18.0).
fillpoint(r6, xy(255,424), 16.0).
fillpoint(r6, xy(214,465), 16.0).
fillpoint(r6, xy(205,474), 16.0).
fillpoint(r6, xy(255,433), 15.0).
fillpoint(r6, xy(226,464), 15.0).
fillpoint(r6, xy(250,445), 11.0).
fillpoint(r6, xy(235,460), 11.0).
fillpoint(r6, xy(200,485), 11.0).
fillpoint(r6, xy(249,450), 10.0).
fillpoint(r6, xy(240,459), 10.0).
region(r4, '#ffdc00', 7800, centroid(215,222)).
perimeter(r4, 460).
polygon(r4, [xy(289,250),xy(140,250),xy(140,200),xy(239,200),xy(240,170),xy(249,170),xy(250,179),xy(259,180),xy(260,189),xy(270,190),xy(270,209),xy(279,210),xy(280,220),xy(290,220),xy(289,250)]).
midline(r4, [xy(197,225),xy(164,225)]).
midline(r4, [xy(198,225),xy(238,225),xy(249,222),xy(255,204),xy(250,195),xy(250,189),xy(245,183),xy(245,174)]).
midline(r4, [xy(249,224),xy(275,235)]).
fillpoint(r4, xy(248,224), 26.0).
fillpoint(r4, xy(164,225), 25.0).
fillpoint(r4, xy(254,205), 16.0).
fillpoint(r4, xy(274,234), 16.0).
fillpoint(r4, xy(250,194), 11.0).
region(r19, '#5a5a5a', 6400, centroid(390,620)).
perimeter(r19, 680).
polygon(r19, [xy(549,630),xy(230,630),xy(230,610),xy(549,610),xy(549,630)]).
midline(r19, [xy(404,619),xy(239,620)]).
midline(r19, [xy(405,620),xy(540,620)]).
fillpoint(r19, xy(239,620), 10.0).
region(r18, '#2ecc40', 2000, centroid(180,620)).
perimeter(r18, 240).
polygon(r18, [xy(229,630),xy(130,630),xy(130,610),xy(229,610),xy(229,630)]).
midline(r18, [xy(151,620),xy(139,620)]).
midline(r18, [xy(152,620),xy(220,620)]).
fillpoint(r18, xy(139,620), 10.0).
region(r7, '#870c25', 1500, centroid(114,334)).
perimeter(r7, 160).
polygon(r7, [xy(139,350),xy(90,350),xy(90,320),xy(139,320),xy(139,350)]).
midline(r7, [xy(116,334),xy(104,335)]).
midline(r7, [xy(117,334),xy(125,335)]).
fillpoint(r7, xy(104,335), 15.0).
region(r5, '#bebebe', 1000, centroid(114,310)).
perimeter(r5, 140).
polygon(r5, [xy(139,320),xy(90,320),xy(90,300),xy(139,300),xy(139,320)]).
midline(r5, [xy(110,309),xy(99,310)]).
midline(r5, [xy(111,309),xy(130,310)]).
fillpoint(r5, xy(99,310), 10.0).
region(r16, '#5a5a5a', 800, centroid(164,474)).
perimeter(r16, 160).
polygon(r16, [xy(179,490),xy(150,489),xy(150,460),xy(180,460),xy(179,490)]).
hole(r16, [xy(170,479),xy(169,470),xy(160,470),xy(160,480),xy(170,479)]).
midline(r16, [xy(155,477),xy(155,465),xy(174,465),xy(174,483),xy(169,485),xy(156,484),xy(154,478)]).
fillpoint(r16, xy(156,465), 6.0).
fillpoint(r16, xy(174,465), 6.0).
fillpoint(r16, xy(155,484), 6.0).
fillpoint(r16, xy(173,484), 6.0).
fillpoint(r16, xy(161,465), 5.0).
fillpoint(r16, xy(154,475), 5.0).
fillpoint(r16, xy(174,475), 5.0).
fillpoint(r16, xy(161,485), 5.0).
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
region(r14, '#000000', 300, centroid(218,428)).
perimeter(r14, 80).
polygon(r14, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r14, [xy(215,434),xy(215,435)]).
midline(r14, [xy(215,433),xy(215,425),xy(225,425)]).
fillpoint(r14, xy(216,425), 6.0).
fillpoint(r14, xy(221,425), 5.0).
fillpoint(r14, xy(215,433), 5.0).
region(r11, '#000000', 100, centroid(204,414)).
perimeter(r11, 40).
polygon(r11, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r11, [xy(205,415),xy(205,414)]).
fillpoint(r11, xy(204,415), 5.0).
region(r17, '#2ecc40', 100, centroid(164,474)).
perimeter(r17, 40).
polygon(r17, [xy(169,480),xy(160,479),xy(160,470),xy(170,470),xy(169,480)]).
midline(r17, [xy(165,475),xy(165,474)]).
fillpoint(r17, xy(164,475), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 620).
adjacent(r1, r3).
shared_edge(r1, r3, 400).
adjacent(r1, r4).
shared_edge(r1, r4, 120).
adjacent(r1, r6).
shared_edge(r1, r6, 200).
adjacent(r1, r18).
shared_edge(r1, r18, 220).
adjacent(r1, r19).
shared_edge(r1, r19, 660).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 180).
adjacent(r2, r5).
shared_edge(r2, r5, 20).
adjacent(r2, r7).
shared_edge(r2, r7, 30).
adjacent(r2, r8).
shared_edge(r2, r8, 250).
adjacent(r3, r4).
shared_edge(r3, r4, 340).
adjacent(r3, r5).
shared_edge(r3, r5, 50).
adjacent(r3, r6).
shared_edge(r3, r6, 250).
adjacent(r5, r6).
shared_edge(r5, r6, 20).
adjacent(r5, r7).
shared_edge(r5, r7, 50).
adjacent(r6, r7).
shared_edge(r6, r7, 30).
adjacent(r6, r8).
shared_edge(r6, r8, 300).
adjacent(r7, r8).
shared_edge(r7, r8, 50).
adjacent(r8, r11).
shared_edge(r8, r11, 40).
adjacent(r8, r14).
shared_edge(r8, r14, 80).
adjacent(r8, r16).
shared_edge(r8, r16, 120).
adjacent(r16, r17).
shared_edge(r16, r17, 40).
adjacent(r18, r19).
shared_edge(r18, r19, 20).

encloses(r8, r11).
encloses(r8, r14).
encloses(r16, r17).
encloses(r1, r20).
encloses(r1, r21).
