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

region(r1, '#aaaaaa', 278700, centroid(365,287)).
perimeter(r1, 5680).
polygon(r1, [xy(250,569),xy(250,560),xy(280,559),xy(280,490),xy(349,490),xy(350,509),xy(359,510),xy(360,500),xy(370,499),xy(370,480),xy(379,480),xy(380,470),xy(390,469),xy(390,450),xy(400,449),xy(400,410),xy(410,409),xy(410,330),xy(400,329),xy(400,290),xy(390,289),xy(390,270),xy(380,270),xy(379,260),xy(370,259),xy(370,240),xy(360,240),xy(360,230),xy(350,230),xy(350,220),xy(340,219),xy(339,210),xy(320,210),xy(320,200),xy(310,199),xy(309,190),xy(290,190),xy(289,180),xy(250,180),xy(249,170),xy(170,170),xy(169,180),xy(130,180),xy(129,190),xy(110,190),xy(110,199),xy(100,200),xy(99,210),xy(80,210),xy(80,219),xy(70,220),xy(70,229),xy(60,230),xy(60,239),xy(50,240),xy(50,259),xy(40,260),xy(40,479),xy(50,480),xy(50,499),xy(59,500),xy(60,509),xy(69,510),xy(70,519),xy(79,520),xy(80,530),xy(109,530),xy(110,549),xy(129,550),xy(130,560),xy(169,560),xy(170,570),xy(250,569)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(320,539),xy(320,520),xy(329,520),xy(330,510),xy(320,510),xy(320,519),xy(310,520),xy(310,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(320,539)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(183,85),xy(152,85),xy(122,91),xy(112,90),xy(93,93),xy(49,170),xy(28,220),xy(25,231),xy(26,238),xy(21,248),xy(19,261),xy(19,475),xy(22,494),xy(25,500),xy(28,499),xy(25,502),xy(25,508),xy(29,521),xy(19,533),xy(15,543),xy(14,569),xy(17,579),xy(14,591),xy(14,608),xy(17,622),xy(23,624),xy(49,625),xy(60,622),xy(60,600),xy(40,580),xy(38,579),xy(18,580)]).
midline(r1, [xy(55,164),xy(81,188),xy(56,162)]).
midline(r1, [xy(30,520),xy(65,534),xy(90,549),xy(111,570),xy(118,584),xy(112,595),xy(109,617),xy(106,620),xy(89,625),xy(61,623)]).
midline(r1, [xy(184,85),xy(249,84),xy(297,90),xy(287,103),xy(288,108),xy(283,120),xy(284,123),xy(280,128),xy(277,141),xy(271,151),xy(274,150)]).
midline(r1, [xy(289,107),xy(305,91),xy(299,90)]).
midline(r1, [xy(286,118),xy(286,124),xy(283,125)]).
midline(r1, [xy(287,121),xy(314,92),xy(306,90)]).
midline(r1, [xy(315,91),xy(290,118)]).
midline(r1, [xy(119,584),xy(150,584),xy(158,588),xy(171,590),xy(249,590),xy(261,588),xy(271,583),xy(279,585),xy(299,581),xy(311,574),xy(297,552),xy(289,529),xy(291,501),xy(301,499),xy(313,500),xy(315,503),xy(314,515),xy(315,515),xy(334,534),xy(342,538),xy(363,559),xy(358,564),xy(339,572),xy(319,575),xy(312,574)]).
midline(r1, [xy(315,500),xy(329,499),xy(338,501),xy(340,515),xy(354,544),xy(367,558),xy(363,561)]).
midline(r1, [xy(109,619),xy(124,633),xy(130,635),xy(553,634),xy(555,631),xy(554,529),xy(556,526),xy(478,448),xy(465,447),xy(461,443),xy(453,442),xy(446,438),xy(443,439),xy(437,435),xy(440,438)]).
midline(r1, [xy(517,485),xy(480,448)]).
midline(r1, [xy(469,448),xy(511,490),xy(469,517),xy(462,519),xy(418,544),xy(387,556),xy(368,559)]).
midline(r1, [xy(448,441),xy(443,442),xy(440,440)]).
midline(r1, [xy(555,633),xy(560,635),xy(578,635),xy(585,632),xy(585,555),xy(557,527)]).
midline(r1, [xy(464,448),xy(461,445),xy(451,446),xy(448,443)]).
midline(r1, [xy(278,140),xy(280,134),xy(284,132),xy(283,129),xy(285,127),xy(285,129)]).
midline(r1, [xy(120,92),xy(130,102),xy(131,100),xy(123,92)]).
midline(r1, [xy(131,103),xy(135,114),xy(133,121),xy(136,124),xy(136,120)]).
midline(r1, [xy(137,125),xy(137,128),xy(139,128)]).
midline(r1, [xy(139,130),xy(140,136),xy(142,136)]).
midline(r1, [xy(586,556),xy(616,586),xy(614,590),xy(615,632),xy(609,635),xy(585,633)]).
midline(r1, [xy(478,450),xy(515,487),xy(512,490)]).
midline(r1, [xy(81,190),xy(82,189)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(317,92),xy(364,102),xy(385,110),xy(400,113),xy(490,149),xy(491,158),xy(506,203),xy(515,245),xy(465,295),xy(455,296),xy(449,300),xy(444,298),xy(437,304),xy(423,307),xy(421,311),xy(426,308)]).
midline(r1, [xy(468,294),xy(480,291),xy(517,254),xy(515,246)]).
midline(r1, [xy(442,302),xy(446,301)]).
midline(r1, [xy(517,256),xy(525,330),xy(524,430),xy(517,483)]).
midline(r1, [xy(145,146),xy(141,139),xy(143,139)]).
midline(r1, [xy(145,147),xy(149,153),xy(148,155),xy(150,155)]).
fillpoint(r1, xy(489,150), 150.0).
fillpoint(r1, xy(493,161), 147.0).
fillpoint(r1, xy(494,164), 146.0).
fillpoint(r1, xy(495,168), 145.0).
fillpoint(r1, xy(496,172), 144.0).
fillpoint(r1, xy(497,176), 143.0).
fillpoint(r1, xy(503,194), 137.0).
fillpoint(r1, xy(504,197), 136.0).
fillpoint(r1, xy(506,204), 134.0).
fillpoint(r1, xy(507,208), 133.0).
fillpoint(r1, xy(508,212), 132.0).
fillpoint(r1, xy(509,217), 131.0).
fillpoint(r1, xy(510,222), 130.0).
fillpoint(r1, xy(513,234), 127.0).
fillpoint(r1, xy(514,238), 126.0).
fillpoint(r1, xy(515,243), 125.0).
fillpoint(r1, xy(516,248), 124.0).
fillpoint(r1, xy(517,255), 123.0).
fillpoint(r1, xy(517,486), 123.0).
fillpoint(r1, xy(518,262), 122.0).
fillpoint(r1, xy(518,477), 122.0).
fillpoint(r1, xy(519,272), 121.0).
fillpoint(r1, xy(519,467), 121.0).
fillpoint(r1, xy(520,284), 120.0).
fillpoint(r1, xy(520,455), 120.0).
fillpoint(r1, xy(521,289), 119.0).
fillpoint(r1, xy(521,450), 119.0).
fillpoint(r1, xy(522,295), 118.0).
fillpoint(r1, xy(522,444), 118.0).
fillpoint(r1, xy(523,302), 117.0).
fillpoint(r1, xy(523,437), 117.0).
fillpoint(r1, xy(524,312), 116.0).
fillpoint(r1, xy(524,427), 116.0).
fillpoint(r1, xy(524,370), 115.0).
fillpoint(r1, xy(399,113), 114.0).
fillpoint(r1, xy(392,111), 112.0).
fillpoint(r1, xy(388,110), 111.0).
fillpoint(r1, xy(366,103), 104.0).
fillpoint(r1, xy(363,102), 103.0).
fillpoint(r1, xy(359,101), 102.0).
fillpoint(r1, xy(355,100), 101.0).
fillpoint(r1, xy(351,99), 100.0).
fillpoint(r1, xy(346,98), 99.0).
fillpoint(r1, xy(338,96), 97.0).
fillpoint(r1, xy(334,95), 96.0).
fillpoint(r1, xy(330,94), 95.0).
fillpoint(r1, xy(94,93), 94.0).
fillpoint(r1, xy(325,93), 94.0).
fillpoint(r1, xy(99,92), 93.0).
fillpoint(r1, xy(320,92), 93.0).
fillpoint(r1, xy(106,91), 92.0).
fillpoint(r1, xy(314,91), 92.0).
fillpoint(r1, xy(115,90), 91.0).
fillpoint(r1, xy(305,90), 91.0).
fillpoint(r1, xy(130,89), 90.0).
fillpoint(r1, xy(289,89), 90.0).
fillpoint(r1, xy(135,88), 89.0).
fillpoint(r1, xy(284,88), 89.0).
fillpoint(r1, xy(140,87), 88.0).
fillpoint(r1, xy(279,87), 88.0).
fillpoint(r1, xy(146,86), 87.0).
fillpoint(r1, xy(273,86), 87.0).
fillpoint(r1, xy(155,85), 86.0).
fillpoint(r1, xy(265,85), 86.0).
fillpoint(r1, xy(171,85), 85.0).
fillpoint(r1, xy(398,552), 58.0).
fillpoint(r1, xy(386,556), 54.0).
fillpoint(r1, xy(382,557), 53.0).
fillpoint(r1, xy(378,558), 52.0).
fillpoint(r1, xy(371,559), 51.0).
fillpoint(r1, xy(44,183), 45.0).
fillpoint(r1, xy(338,572), 38.0).
border(r1).
region(r2, '#2ecc40', 54100, centroid(234,337)).
perimeter(r2, 2980).
polygon(r2, [xy(279,560),xy(270,559),xy(270,480),xy(290,479),xy(289,300),xy(140,300),xy(140,349),xy(189,350),xy(190,399),xy(240,400),xy(240,449),xy(190,450),xy(189,500),xy(140,500),xy(140,450),xy(90,449),xy(90,210),xy(99,210),xy(100,200),xy(109,200),xy(110,190),xy(129,190),xy(130,180),xy(169,180),xy(170,170),xy(240,170),xy(239,200),xy(140,200),xy(140,250),xy(289,250),xy(290,200),xy(319,200),xy(319,210),xy(300,210),xy(300,239),xy(329,240),xy(330,210),xy(339,210),xy(340,219),xy(349,220),xy(350,229),xy(359,230),xy(360,239),xy(370,240),xy(370,259),xy(379,260),xy(380,269),xy(390,270),xy(390,289),xy(400,290),xy(400,329),xy(410,330),xy(410,409),xy(400,410),xy(400,449),xy(390,449),xy(390,350),xy(340,350),xy(340,479),xy(360,480),xy(360,509),xy(350,509),xy(349,490),xy(280,490),xy(279,560)]).
hole(r2, [xy(130,439),xy(129,410),xy(100,410),xy(100,440),xy(130,439)]).
hole(r2, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r2, [xy(230,440),xy(223,444),xy(206,444),xy(194,434),xy(164,423),xy(129,445),xy(100,445),xy(96,444),xy(94,439),xy(95,406),xy(122,377),xy(116,363),xy(114,349),xy(115,291),xy(121,275),xy(115,259),xy(114,229),xy(124,204),xy(139,189),xy(169,190),xy(184,184),xy(225,185)]).
midline(r2, [xy(122,274),xy(315,275),xy(308,259),xy(296,245),xy(294,239),xy(295,205),xy(315,205)]).
midline(r2, [xy(316,276),xy(331,284),xy(344,262),xy(345,244),xy(340,235),xy(340,229),xy(335,223),xy(335,214)]).
midline(r2, [xy(230,438),xy(234,433),xy(235,422),xy(234,416),xy(229,409),xy(219,410),xy(213,405),xy(200,404),xy(194,406),xy(177,418),xy(171,424),xy(177,420)]).
midline(r2, [xy(195,434),xy(218,411)]).
midline(r2, [xy(332,285),xy(340,300),xy(323,320),xy(316,336),xy(314,350),xy(315,462),xy(295,483),xy(275,485),xy(275,555)]).
midline(r2, [xy(341,300),xy(350,305),xy(367,288),xy(351,306),xy(365,315),xy(369,312),xy(369,314)]).
midline(r2, [xy(371,312),xy(373,310),xy(373,312)]).
midline(r2, [xy(366,316),xy(386,335),xy(398,341),xy(399,344),xy(400,400),xy(396,404),xy(394,411),xy(395,445)]).
midline(r2, [xy(164,422),xy(155,386),xy(144,381),xy(123,377)]).
midline(r2, [xy(315,465),xy(334,483),xy(354,485),xy(355,505)]).
midline(r2, [xy(165,426),xy(165,475)]).
fillpoint(r2, xy(339,299), 50.0).
fillpoint(r2, xy(154,385), 35.4).
fillpoint(r2, xy(165,425), 35.4).
fillpoint(r2, xy(122,377), 33.0).
fillpoint(r2, xy(126,378), 32.0).
fillpoint(r2, xy(143,381), 32.0).
fillpoint(r2, xy(158,396), 32.0).
fillpoint(r2, xy(161,413), 32.0).
fillpoint(r2, xy(121,275), 31.4).
fillpoint(r2, xy(131,379), 31.1).
fillpoint(r2, xy(138,380), 31.1).
fillpoint(r2, xy(159,401), 31.1).
fillpoint(r2, xy(160,408), 31.1).
fillpoint(r2, xy(118,268), 29.0).
fillpoint(r2, xy(118,281), 29.0).
fillpoint(r2, xy(318,331), 29.0).
fillpoint(r2, xy(118,368), 29.0).
fillpoint(r2, xy(117,265), 28.0).
fillpoint(r2, xy(117,284), 28.0).
fillpoint(r2, xy(317,334), 28.0).
fillpoint(r2, xy(117,365), 28.0).
fillpoint(r2, xy(116,262), 27.0).
fillpoint(r2, xy(116,287), 27.0).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(116,362), 27.0).
fillpoint(r2, xy(115,258), 26.0).
fillpoint(r2, xy(115,292), 26.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(115,358), 26.0).
fillpoint(r2, xy(114,239), 25.0).
fillpoint(r2, xy(141,275), 25.0).
fillpoint(r2, xy(114,325), 25.0).
fillpoint(r2, xy(315,408), 25.0).
fillpoint(r2, xy(165,463), 25.0).
fillpoint(r2, xy(124,205), 16.0).
fillpoint(r2, xy(194,434), 16.0).
fillpoint(r2, xy(183,185), 15.0).
region(r4, '#ffdc00', 44200, centroid(164,421)).
perimeter(r4, 1820).
polygon(r4, [xy(249,570),xy(170,570),xy(169,560),xy(130,560),xy(129,550),xy(110,549),xy(109,530),xy(80,530),xy(80,520),xy(70,520),xy(70,510),xy(60,510),xy(60,500),xy(50,499),xy(50,480),xy(40,479),xy(40,260),xy(50,259),xy(50,240),xy(59,240),xy(60,230),xy(69,230),xy(70,220),xy(79,220),xy(80,210),xy(90,210),xy(90,449),xy(139,450),xy(140,500),xy(189,500),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(290,479),xy(270,480),xy(270,559),xy(250,560),xy(249,570)]).
midline(r4, [xy(256,463),xy(229,489),xy(227,522),xy(220,528),xy(195,535),xy(179,530),xy(152,530),xy(135,525),xy(99,487),xy(81,479),xy(65,459),xy(64,280),xy(69,267),xy(69,259),xy(67,257),xy(72,252),xy(79,235),xy(79,229),xy(84,223),xy(85,214)]).
midline(r4, [xy(151,531),xy(148,537),xy(151,536)]).
midline(r4, [xy(100,489),xy(101,488)]).
midline(r4, [xy(257,462),xy(264,455),xy(265,449),xy(265,350),xy(261,330),xy(249,325),xy(236,324),xy(164,325)]).
midline(r4, [xy(220,529),xy(221,533),xy(222,530)]).
midline(r4, [xy(222,534),xy(224,532)]).
midline(r4, [xy(225,535),xy(224,536)]).
midline(r4, [xy(228,523),xy(232,524),xy(232,526)]).
midline(r4, [xy(103,499),xy(102,502),xy(105,499),xy(103,497),xy(106,498)]).
fillpoint(r4, xy(226,523), 44.0).
fillpoint(r4, xy(228,515), 42.0).
fillpoint(r4, xy(229,509), 41.0).
fillpoint(r4, xy(229,494), 40.0).
fillpoint(r4, xy(101,488), 38.8).
fillpoint(r4, xy(208,532), 38.0).
fillpoint(r4, xy(204,533), 37.0).
fillpoint(r4, xy(199,534), 36.0).
fillpoint(r4, xy(87,482), 33.1).
fillpoint(r4, xy(183,531), 32.0).
fillpoint(r4, xy(178,530), 31.0).
fillpoint(r4, xy(80,478), 30.4).
fillpoint(r4, xy(168,529), 30.0).
fillpoint(r4, xy(260,329), 29.7).
fillpoint(r4, xy(258,328), 29.0).
fillpoint(r4, xy(261,331), 29.0).
fillpoint(r4, xy(148,528), 29.0).
fillpoint(r4, xy(255,327), 28.0).
fillpoint(r4, xy(262,334), 28.0).
fillpoint(r4, xy(145,527), 28.0).
fillpoint(r4, xy(252,326), 27.0).
fillpoint(r4, xy(263,337), 27.0).
fillpoint(r4, xy(142,526), 27.0).
fillpoint(r4, xy(66,460), 26.2).
fillpoint(r4, xy(137,525), 26.2).
fillpoint(r4, xy(248,325), 26.0).
fillpoint(r4, xy(264,342), 26.0).
fillpoint(r4, xy(65,458), 26.0).
fillpoint(r4, xy(264,455), 25.7).
fillpoint(r4, xy(134,524), 25.7).
fillpoint(r4, xy(69,464), 25.6).
fillpoint(r4, xy(70,465), 25.6).
fillpoint(r4, xy(64,364), 25.0).
fillpoint(r4, xy(164,325), 25.0).
fillpoint(r4, xy(264,400), 25.0).
fillpoint(r4, xy(69,266), 21.0).
fillpoint(r4, xy(70,257), 20.0).
fillpoint(r4, xy(74,245), 16.0).
fillpoint(r4, xy(79,234), 11.0).
region(r3, '#ffdc00', 8800, centroid(222,219)).
perimeter(r3, 500).
polygon(r3, [xy(289,250),xy(140,250),xy(140,200),xy(239,200),xy(240,170),xy(249,170),xy(250,180),xy(289,180),xy(290,190),xy(310,190),xy(309,200),xy(290,200),xy(289,250)]).
midline(r3, [xy(253,193),xy(245,183),xy(245,174)]).
midline(r3, [xy(254,194),xy(264,204),xy(263,213),xy(259,221),xy(239,225),xy(164,225)]).
midline(r3, [xy(265,204),xy(276,193),xy(276,195)]).
midline(r3, [xy(278,194),xy(305,195)]).
fillpoint(r3, xy(260,220), 29.7).
fillpoint(r3, xy(261,218), 29.0).
fillpoint(r3, xy(258,221), 29.0).
fillpoint(r3, xy(262,215), 28.0).
fillpoint(r3, xy(255,222), 28.0).
fillpoint(r3, xy(263,212), 27.0).
fillpoint(r3, xy(252,223), 27.0).
fillpoint(r3, xy(264,208), 26.0).
fillpoint(r3, xy(248,224), 26.0).
fillpoint(r3, xy(164,225), 25.0).
region(r23, '#5a5a5a', 7200, centroid(370,620)).
perimeter(r23, 760).
polygon(r23, [xy(549,630),xy(190,630),xy(190,610),xy(549,610),xy(549,630)]).
midline(r23, [xy(405,620),xy(199,620)]).
midline(r23, [xy(406,620),xy(540,620)]).
fillpoint(r23, xy(199,620), 10.0).
region(r9, '#ffdc00', 6100, centroid(364,421)).
perimeter(r9, 380).
polygon(r9, [xy(369,500),xy(360,499),xy(359,480),xy(340,479),xy(340,360),xy(390,360),xy(390,469),xy(380,470),xy(379,480),xy(370,480),xy(369,500)]).
midline(r9, [xy(364,449),xy(365,384)]).
midline(r9, [xy(365,450),xy(360,459),xy(365,465),xy(365,495)]).
fillpoint(r9, xy(365,417), 25.0).
region(r20, '#7fdbff', 2000, centroid(64,576)).
perimeter(r20, 240).
polygon(r20, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r20, [xy(51,560),xy(39,560)]).
midline(r20, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r20, xy(58,561), 12.0).
fillpoint(r20, xy(61,578), 12.0).
fillpoint(r20, xy(78,581), 12.0).
fillpoint(r20, xy(54,560), 11.0).
fillpoint(r20, xy(59,565), 11.0).
fillpoint(r20, xy(60,574), 11.0).
fillpoint(r20, xy(65,579), 11.0).
fillpoint(r20, xy(74,580), 11.0).
fillpoint(r20, xy(79,585), 11.0).
fillpoint(r20, xy(39,560), 10.0).
fillpoint(r20, xy(79,596), 10.0).
region(r10, '#870c25', 1500, centroid(214,384)).
perimeter(r10, 160).
polygon(r10, [xy(239,400),xy(190,400),xy(190,370),xy(239,370),xy(239,400)]).
midline(r10, [xy(214,384),xy(204,385)]).
midline(r10, [xy(215,385),xy(225,385)]).
fillpoint(r10, xy(204,385), 15.0).
region(r22, '#2ecc40', 1200, centroid(160,620)).
perimeter(r22, 160).
polygon(r22, [xy(189,630),xy(130,630),xy(130,610),xy(189,610),xy(189,630)]).
midline(r22, [xy(149,620),xy(139,620)]).
midline(r22, [xy(150,620),xy(180,620)]).
fillpoint(r22, xy(139,620), 10.0).
region(r7, '#bebebe', 1000, centroid(214,360)).
perimeter(r7, 140).
polygon(r7, [xy(239,370),xy(190,370),xy(190,350),xy(239,350),xy(239,370)]).
midline(r7, [xy(209,360),xy(199,360)]).
midline(r7, [xy(210,360),xy(230,360)]).
fillpoint(r7, xy(199,360), 10.0).
region(r5, '#5a5a5a', 800, centroid(314,224)).
perimeter(r5, 160).
polygon(r5, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r5, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r5, [xy(319,214),xy(305,215),xy(305,234),xy(317,235),xy(324,233),xy(324,216),xy(320,215)]).
fillpoint(r5, xy(306,215), 6.0).
fillpoint(r5, xy(324,215), 6.0).
fillpoint(r5, xy(305,234), 6.0).
fillpoint(r5, xy(323,234), 6.0).
fillpoint(r5, xy(311,215), 5.0).
fillpoint(r5, xy(304,225), 5.0).
fillpoint(r5, xy(324,225), 5.0).
fillpoint(r5, xy(311,235), 5.0).
region(r8, '#0074d9', 500, centroid(364,354)).
perimeter(r8, 120).
polygon(r8, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r8, [xy(361,354),xy(344,355)]).
midline(r8, [xy(362,355),xy(385,355)]).
fillpoint(r8, xy(344,355), 5.0).
region(r18, '#7fdbff', 400, centroid(310,524)).
perimeter(r18, 100).
polygon(r18, [xy(319,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(320,520),xy(319,540)]).
midline(r18, [xy(305,521),xy(305,514)]).
midline(r18, [xy(305,522),xy(305,524),xy(314,525),xy(315,535)]).
fillpoint(r18, xy(305,524), 6.0).
fillpoint(r18, xy(314,525), 6.0).
fillpoint(r18, xy(305,516), 5.0).
fillpoint(r18, xy(315,533), 5.0).
region(r21, '#7fdbff', 400, centroid(40,600)).
perimeter(r21, 80).
polygon(r21, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r21, [xy(39,599),xy(40,600)]).
fillpoint(r21, xy(39,600), 10.0).
region(r24, '#7fdbff', 400, centroid(570,620)).
perimeter(r24, 80).
polygon(r24, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r24, [xy(569,619),xy(570,620)]).
fillpoint(r24, xy(569,620), 10.0).
region(r25, '#7fdbff', 400, centroid(600,620)).
perimeter(r25, 80).
polygon(r25, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r25, [xy(599,619),xy(600,620)]).
fillpoint(r25, xy(599,620), 10.0).
region(r26, '#2ecc40', 400, centroid(630,620)).
perimeter(r26, 80).
polygon(r26, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r26, [xy(629,619),xy(630,620)]).
fillpoint(r26, xy(629,620), 10.0).
border(r26).
region(r16, '#000000', 300, centroid(218,428)).
perimeter(r16, 80).
polygon(r16, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r16, [xy(215,431),xy(215,425),xy(225,425)]).
midline(r16, [xy(214,432),xy(215,435)]).
fillpoint(r16, xy(216,425), 6.0).
fillpoint(r16, xy(221,425), 5.0).
fillpoint(r16, xy(215,433), 5.0).
region(r6, '#2ecc40', 100, centroid(314,224)).
perimeter(r6, 40).
polygon(r6, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r6, [xy(315,225),xy(315,224)]).
fillpoint(r6, xy(314,225), 5.0).
region(r13, '#000000', 100, centroid(204,414)).
perimeter(r13, 40).
polygon(r13, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r13, [xy(205,415),xy(205,414)]).
fillpoint(r13, xy(204,415), 5.0).
region(r19, '#7fdbff', 100, centroid(324,514)).
perimeter(r19, 40).
polygon(r19, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r19, [xy(325,515),xy(325,514)]).
fillpoint(r19, xy(324,515), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 740).
adjacent(r1, r3).
shared_edge(r1, r3, 100).
adjacent(r1, r4).
shared_edge(r1, r4, 650).
adjacent(r1, r5).
shared_edge(r1, r5, 10).
adjacent(r1, r9).
shared_edge(r1, r9, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 100).
adjacent(r1, r19).
shared_edge(r1, r19, 40).
adjacent(r1, r20).
shared_edge(r1, r20, 240).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 140).
adjacent(r1, r23).
shared_edge(r1, r23, 740).
adjacent(r1, r24).
shared_edge(r1, r24, 80).
adjacent(r1, r25).
shared_edge(r1, r25, 80).
adjacent(r1, r26).
shared_edge(r1, r26, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 400).
adjacent(r2, r4).
shared_edge(r2, r4, 1070).
adjacent(r2, r5).
shared_edge(r2, r5, 110).
adjacent(r2, r7).
shared_edge(r2, r7, 20).
adjacent(r2, r8).
shared_edge(r2, r8, 70).
adjacent(r2, r9).
shared_edge(r2, r9, 250).
adjacent(r2, r10).
shared_edge(r2, r10, 80).
adjacent(r2, r13).
shared_edge(r2, r13, 40).
adjacent(r2, r16).
shared_edge(r2, r16, 80).
adjacent(r4, r7).
shared_edge(r4, r7, 70).
adjacent(r4, r10).
shared_edge(r4, r10, 30).
adjacent(r5, r6).
shared_edge(r5, r6, 40).
adjacent(r7, r10).
shared_edge(r7, r10, 50).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r22, r23).
shared_edge(r22, r23, 20).

encloses(r5, r6).
encloses(r2, r13).
encloses(r2, r16).
encloses(r1, r18).
encloses(r1, r19).
encloses(r1, r20).
encloses(r1, r21).
encloses(r1, r24).
encloses(r1, r25).
