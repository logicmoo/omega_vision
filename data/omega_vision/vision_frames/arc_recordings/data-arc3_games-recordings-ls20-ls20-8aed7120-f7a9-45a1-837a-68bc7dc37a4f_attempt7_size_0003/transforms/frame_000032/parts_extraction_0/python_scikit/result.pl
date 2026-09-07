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

region(r1, '#aaaaaa', 278200, centroid(363,331)).
perimeter(r1, 5200).
polygon(r1, [xy(250,469),xy(250,460),xy(289,460),xy(290,450),xy(309,450),xy(310,440),xy(319,440),xy(320,430),xy(339,430),xy(340,420),xy(349,420),xy(350,410),xy(359,410),xy(360,400),xy(370,399),xy(370,380),xy(379,380),xy(380,370),xy(390,369),xy(390,350),xy(400,349),xy(400,310),xy(410,309),xy(410,230),xy(400,229),xy(400,190),xy(390,189),xy(390,170),xy(380,170),xy(380,160),xy(370,159),xy(370,140),xy(360,140),xy(360,130),xy(350,130),xy(350,120),xy(340,120),xy(339,110),xy(320,110),xy(320,100),xy(310,100),xy(309,90),xy(290,90),xy(289,80),xy(250,80),xy(249,70),xy(174,70),xy(170,70),xy(169,80),xy(130,80),xy(129,90),xy(110,90),xy(110,99),xy(100,100),xy(99,110),xy(80,110),xy(80,119),xy(70,120),xy(70,129),xy(60,130),xy(59,140),xy(50,140),xy(50,159),xy(40,160),xy(40,379),xy(50,380),xy(50,399),xy(59,400),xy(60,409),xy(69,410),xy(70,419),xy(80,420),xy(80,430),xy(119,430),xy(120,439),xy(110,440),xy(110,449),xy(129,450),xy(130,460),xy(169,460),xy(170,470),xy(250,469)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(512,127),xy(449,92),xy(388,65),xy(372,59),xy(353,56),xy(332,47),xy(301,40),xy(277,40),xy(249,34),xy(170,34),xy(142,40),xy(113,41),xy(80,49),xy(66,56),xy(57,57),xy(49,70),xy(27,123),xy(19,160),xy(19,378),xy(21,391),xy(26,400),xy(26,413),xy(33,426)]).
midline(r1, [xy(512,129),xy(516,148),xy(471,193),xy(462,194),xy(460,192),xy(452,199),xy(448,197),xy(443,202)]).
midline(r1, [xy(516,150),xy(475,191),xy(517,153),xy(525,231),xy(524,330),xy(519,357),xy(517,386),xy(477,348),xy(453,342),xy(446,338),xy(443,339),xy(435,334),xy(435,336)]).
midline(r1, [xy(469,348),xy(468,347)]).
midline(r1, [xy(466,347),xy(464,346)]).
midline(r1, [xy(454,343),xy(459,346),xy(461,345)]).
midline(r1, [xy(472,348),xy(515,391),xy(516,388)]).
midline(r1, [xy(516,392),xy(506,436),xy(496,466),xy(465,483),xy(439,494),xy(434,494),xy(407,507),xy(356,523),xy(306,534),xy(278,506),xy(277,498),xy(270,486),xy(271,484),xy(272,486)]).
midline(r1, [xy(279,509),xy(283,513),xy(281,515),xy(285,527),xy(289,523),xy(284,514)]).
midline(r1, [xy(497,467),xy(556,526),xy(554,531),xy(555,630),xy(553,634),xy(131,635),xy(119,629),xy(92,602),xy(70,569),xy(87,535),xy(53,476),xy(33,428)]).
midline(r1, [xy(286,516),xy(303,533),xy(300,534),xy(290,524)]).
midline(r1, [xy(298,534),xy(289,527),xy(286,531),xy(287,535),xy(249,540),xy(170,540),xy(147,538),xy(129,533),xy(127,535),xy(88,535)]).
midline(r1, [xy(132,533),xy(130,532)]).
midline(r1, [xy(294,534),xy(289,529)]).
midline(r1, [xy(289,535),xy(292,534)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,631),xy(584,560),xy(586,556),xy(557,527)]).
midline(r1, [xy(133,531),xy(133,524),xy(136,521),xy(137,511),xy(140,508),xy(137,505),xy(142,498),xy(142,503),xy(140,502)]).
midline(r1, [xy(139,505),xy(141,505)]).
midline(r1, [xy(135,525),xy(135,524)]).
midline(r1, [xy(139,511),xy(139,512)]).
midline(r1, [xy(461,195),xy(457,196)]).
midline(r1, [xy(446,201),xy(449,200)]).
midline(r1, [xy(587,557),xy(615,585),xy(615,632),xy(606,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(143,41),xy(146,51)]).
midline(r1, [xy(277,41),xy(268,57),xy(270,57)]).
midline(r1, [xy(58,482),xy(99,440),xy(106,435),xy(115,435)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(92,51),xy(91,48),xy(111,68)]).
fillpoint(r1, xy(496,466), 143.6).
fillpoint(r1, xy(497,463), 143.0).
fillpoint(r1, xy(503,445), 137.0).
fillpoint(r1, xy(504,442), 136.0).
fillpoint(r1, xy(506,435), 134.0).
fillpoint(r1, xy(507,431), 133.0).
fillpoint(r1, xy(508,427), 132.0).
fillpoint(r1, xy(509,422), 131.0).
fillpoint(r1, xy(510,418), 130.0).
fillpoint(r1, xy(511,128), 128.0).
fillpoint(r1, xy(513,134), 127.0).
fillpoint(r1, xy(513,405), 127.0).
fillpoint(r1, xy(514,138), 126.0).
fillpoint(r1, xy(514,401), 126.0).
fillpoint(r1, xy(515,143), 125.0).
fillpoint(r1, xy(515,396), 125.0).
fillpoint(r1, xy(516,148), 124.0).
fillpoint(r1, xy(516,391), 124.0).
fillpoint(r1, xy(517,155), 123.0).
fillpoint(r1, xy(517,385), 123.0).
fillpoint(r1, xy(518,162), 122.0).
fillpoint(r1, xy(518,377), 122.0).
fillpoint(r1, xy(519,172), 121.0).
fillpoint(r1, xy(519,367), 121.0).
fillpoint(r1, xy(520,184), 120.0).
fillpoint(r1, xy(520,355), 120.0).
fillpoint(r1, xy(521,189), 119.0).
fillpoint(r1, xy(521,350), 119.0).
fillpoint(r1, xy(522,195), 118.0).
fillpoint(r1, xy(522,344), 118.0).
fillpoint(r1, xy(523,202), 117.0).
fillpoint(r1, xy(523,337), 117.0).
fillpoint(r1, xy(524,212), 116.0).
fillpoint(r1, xy(524,327), 116.0).
fillpoint(r1, xy(438,494), 116.0).
fillpoint(r1, xy(524,270), 115.0).
fillpoint(r1, xy(398,510), 100.0).
fillpoint(r1, xy(388,513), 97.0).
fillpoint(r1, xy(384,514), 96.0).
fillpoint(r1, xy(380,515), 95.0).
fillpoint(r1, xy(375,516), 94.0).
fillpoint(r1, xy(355,523), 87.0).
fillpoint(r1, xy(86,535), 87.0).
fillpoint(r1, xy(348,525), 85.0).
fillpoint(r1, xy(343,526), 84.0).
fillpoint(r1, xy(338,527), 83.0).
fillpoint(r1, xy(330,529), 81.0).
fillpoint(r1, xy(326,530), 80.0).
fillpoint(r1, xy(322,531), 79.0).
fillpoint(r1, xy(318,532), 78.0).
fillpoint(r1, xy(312,533), 77.0).
fillpoint(r1, xy(304,534), 76.0).
fillpoint(r1, xy(132,535), 75.0).
fillpoint(r1, xy(286,535), 75.0).
fillpoint(r1, xy(138,536), 74.0).
fillpoint(r1, xy(281,536), 74.0).
fillpoint(r1, xy(143,537), 73.0).
fillpoint(r1, xy(276,537), 73.0).
fillpoint(r1, xy(149,538), 72.0).
fillpoint(r1, xy(271,538), 72.0).
fillpoint(r1, xy(157,539), 71.0).
fillpoint(r1, xy(263,539), 71.0).
fillpoint(r1, xy(171,540), 70.0).
fillpoint(r1, xy(377,61), 62.0).
fillpoint(r1, xy(374,60), 61.0).
fillpoint(r1, xy(371,59), 60.0).
fillpoint(r1, xy(367,58), 59.0).
fillpoint(r1, xy(363,57), 58.0).
fillpoint(r1, xy(57,57), 57.8).
fillpoint(r1, xy(61,56), 57.0).
fillpoint(r1, xy(358,56), 57.0).
fillpoint(r1, xy(81,49), 50.0).
fillpoint(r1, xy(338,49), 50.0).
fillpoint(r1, xy(88,47), 48.0).
fillpoint(r1, xy(331,47), 48.0).
fillpoint(r1, xy(93,46), 47.0).
fillpoint(r1, xy(326,46), 47.0).
fillpoint(r1, xy(99,45), 46.0).
fillpoint(r1, xy(320,45), 46.0).
fillpoint(r1, xy(103,44), 45.0).
fillpoint(r1, xy(316,44), 45.0).
fillpoint(r1, xy(44,83), 45.0).
fillpoint(r1, xy(44,456), 45.0).
fillpoint(r1, xy(106,43), 44.0).
fillpoint(r1, xy(313,43), 44.0).
fillpoint(r1, xy(114,41), 42.0).
fillpoint(r1, xy(305,41), 42.0).
fillpoint(r1, xy(120,40), 41.0).
fillpoint(r1, xy(299,40), 41.0).
fillpoint(r1, xy(144,39), 40.0).
fillpoint(r1, xy(288,39), 40.0).
fillpoint(r1, xy(151,37), 38.0).
fillpoint(r1, xy(268,37), 38.0).
fillpoint(r1, xy(155,36), 37.0).
fillpoint(r1, xy(264,36), 37.0).
fillpoint(r1, xy(161,35), 36.0).
fillpoint(r1, xy(259,35), 36.0).
border(r1).
region(r2, '#2ecc40', 71800, centroid(230,261)).
perimeter(r2, 2960).
polygon(r2, [xy(189,470),xy(180,470),xy(179,460),xy(140,460),xy(139,450),xy(110,450),xy(110,440),xy(130,439),xy(129,410),xy(100,410),xy(100,429),xy(90,429),xy(90,110),xy(99,110),xy(100,100),xy(109,100),xy(110,90),xy(129,90),xy(130,80),xy(169,80),xy(170,70),xy(249,70),xy(250,80),xy(289,80),xy(290,90),xy(309,90),xy(310,99),xy(319,100),xy(320,110),xy(339,110),xy(340,119),xy(349,120),xy(350,129),xy(359,130),xy(360,140),xy(370,140),xy(370,159),xy(379,160),xy(380,169),xy(390,170),xy(390,199),xy(400,200),xy(400,229),xy(410,230),xy(410,309),xy(400,310),xy(399,350),xy(340,350),xy(340,429),xy(320,430),xy(320,439),xy(310,440),xy(309,450),xy(290,450),xy(290,300),xy(240,300),xy(240,250),xy(289,250),xy(290,200),xy(340,199),xy(340,150),xy(290,150),xy(289,100),xy(240,100),xy(240,199),xy(140,200),xy(140,249),xy(190,250),xy(190,299),xy(140,300),xy(140,349),xy(240,350),xy(240,449),xy(190,450),xy(189,470)]).
hole(r2, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
hole(r2, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r2, [xy(230,440),xy(223,444),xy(206,444),xy(192,433),xy(165,424),xy(154,430),xy(152,429),xy(133,444),xy(114,445)]).
midline(r2, [xy(165,423),xy(165,391),xy(153,384),xy(123,377),xy(118,369),xy(115,358),xy(114,300),xy(116,286),xy(121,275),xy(116,263),xy(114,248),xy(115,190),xy(123,170),xy(143,146),xy(129,136),xy(123,135),xy(118,131),xy(119,134)]).
midline(r2, [xy(138,141),xy(140,140),xy(137,137),xy(134,138)]).
midline(r2, [xy(140,142),xy(141,140)]).
midline(r2, [xy(137,139),xy(136,140)]).
midline(r2, [xy(165,390),xy(185,381),xy(200,379),xy(210,379),xy(216,387),xy(224,405),xy(195,434)]).
midline(r2, [xy(225,405),xy(233,414),xy(235,421),xy(234,433),xy(230,438)]).
midline(r2, [xy(300,99),xy(286,94),xy(280,89),xy(250,90),xy(235,84),xy(217,93),xy(199,110),xy(196,109),xy(196,104),xy(199,107)]).
midline(r2, [xy(198,111),xy(179,139),xy(164,140),xy(161,134),xy(163,128),xy(157,123),xy(151,108),xy(154,109)]).
midline(r2, [xy(163,126),xy(158,120)]).
midline(r2, [xy(162,140),xy(145,144),xy(143,142),xy(144,145)]).
midline(r2, [xy(310,129),xy(300,101)]).
midline(r2, [xy(312,129),xy(322,129),xy(348,141),xy(355,154),xy(355,166),xy(365,190),xy(365,221),xy(362,224),xy(353,220),xy(333,205),xy(295,205),xy(295,243),xy(306,256),xy(315,273),xy(313,275),xy(264,275)]).
midline(r2, [xy(122,274),xy(165,275)]).
midline(r2, [xy(122,377),xy(96,404),xy(94,413),xy(95,425)]).
midline(r2, [xy(311,410),xy(300,434),xy(300,440)]).
midline(r2, [xy(312,409),xy(315,405),xy(314,351),xy(316,336),xy(327,314),xy(345,294),xy(316,274),xy(316,276)]).
midline(r2, [xy(346,294),xy(360,279),xy(366,264),xy(368,257),xy(364,229),xy(364,225),xy(368,224),xy(366,228)]).
midline(r2, [xy(361,280),xy(364,278),xy(366,282)]).
midline(r2, [xy(368,260),xy(369,258)]).
midline(r2, [xy(369,256),xy(375,254),xy(371,258)]).
midline(r2, [xy(377,254),xy(379,252),xy(379,254)]).
midline(r2, [xy(369,225),xy(371,223)]).
midline(r2, [xy(376,220),xy(379,217),xy(379,219)]).
midline(r2, [xy(368,281),xy(371,280),xy(374,282),xy(370,282)]).
midline(r2, [xy(173,441),xy(165,426)]).
midline(r2, [xy(173,442),xy(183,454),xy(185,465)]).
midline(r2, [xy(163,134),xy(164,135)]).
midline(r2, [xy(374,284),xy(376,283),xy(375,285)]).
midline(r2, [xy(377,286),xy(383,287),xy(383,289)]).
fillpoint(r2, xy(179,139), 60.8).
fillpoint(r2, xy(162,140), 60.0).
fillpoint(r2, xy(157,141), 59.0).
fillpoint(r2, xy(153,142), 58.0).
fillpoint(r2, xy(148,143), 57.0).
fillpoint(r2, xy(346,293), 56.6).
fillpoint(r2, xy(365,266), 45.0).
fillpoint(r2, xy(366,263), 44.0).
fillpoint(r2, xy(165,390), 40.3).
fillpoint(r2, xy(365,238), 36.0).
fillpoint(r2, xy(165,424), 35.4).
fillpoint(r2, xy(365,226), 35.0).
fillpoint(r2, xy(164,415), 35.0).
fillpoint(r2, xy(122,377), 33.0).
fillpoint(r2, xy(126,378), 32.0).
fillpoint(r2, xy(143,381), 32.0).
fillpoint(r2, xy(186,381), 32.0).
fillpoint(r2, xy(121,275), 31.4).
fillpoint(r2, xy(131,379), 31.1).
fillpoint(r2, xy(138,380), 31.1).
fillpoint(r2, xy(192,380), 31.0).
fillpoint(r2, xy(201,380), 30.0).
fillpoint(r2, xy(118,181), 29.0).
fillpoint(r2, xy(118,268), 29.0).
fillpoint(r2, xy(118,281), 29.0).
fillpoint(r2, xy(318,331), 29.0).
fillpoint(r2, xy(118,368), 29.0).
fillpoint(r2, xy(117,184), 28.0).
fillpoint(r2, xy(117,265), 28.0).
fillpoint(r2, xy(117,284), 28.0).
fillpoint(r2, xy(317,334), 28.0).
fillpoint(r2, xy(117,365), 28.0).
fillpoint(r2, xy(116,187), 27.0).
fillpoint(r2, xy(116,262), 27.0).
fillpoint(r2, xy(116,287), 27.0).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(116,362), 27.0).
fillpoint(r2, xy(115,192), 26.0).
fillpoint(r2, xy(115,258), 26.0).
fillpoint(r2, xy(115,292), 26.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(115,358), 26.0).
fillpoint(r2, xy(364,194), 25.0).
fillpoint(r2, xy(114,225), 25.0).
fillpoint(r2, xy(141,275), 25.0).
fillpoint(r2, xy(264,275), 25.0).
fillpoint(r2, xy(114,325), 25.0).
fillpoint(r2, xy(315,378), 25.0).
fillpoint(r2, xy(311,128), 21.0).
fillpoint(r2, xy(313,129), 21.0).
fillpoint(r2, xy(321,130), 20.0).
fillpoint(r2, xy(234,85), 16.0).
fillpoint(r2, xy(305,115), 16.0).
fillpoint(r2, xy(334,134), 16.0).
fillpoint(r2, xy(355,165), 16.0).
fillpoint(r2, xy(224,404), 16.0).
fillpoint(r2, xy(305,424), 16.0).
fillpoint(r2, xy(194,434), 16.0).
region(r3, '#ffdc00', 15000, centroid(248,191)).
perimeter(r3, 700).
polygon(r3, [xy(289,250),xy(140,249),xy(140,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r3, [xy(263,210),xy(260,220),xy(248,224),xy(164,225)]).
midline(r3, [xy(264,209),xy(265,190),xy(271,175),xy(265,158),xy(265,124)]).
midline(r3, [xy(272,174),xy(315,175)]).
fillpoint(r3, xy(271,175), 31.4).
fillpoint(r3, xy(260,220), 29.7).
fillpoint(r3, xy(268,168), 29.0).
fillpoint(r3, xy(268,181), 29.0).
fillpoint(r3, xy(261,218), 29.0).
fillpoint(r3, xy(258,221), 29.0).
fillpoint(r3, xy(267,165), 28.0).
fillpoint(r3, xy(267,184), 28.0).
fillpoint(r3, xy(262,215), 28.0).
fillpoint(r3, xy(255,222), 28.0).
fillpoint(r3, xy(266,162), 27.0).
fillpoint(r3, xy(266,187), 27.0).
fillpoint(r3, xy(263,212), 27.0).
fillpoint(r3, xy(252,223), 27.0).
fillpoint(r3, xy(265,158), 26.0).
fillpoint(r3, xy(265,192), 26.0).
fillpoint(r3, xy(264,208), 26.0).
fillpoint(r3, xy(248,224), 26.0).
fillpoint(r3, xy(265,136), 25.0).
fillpoint(r3, xy(291,175), 25.0).
fillpoint(r3, xy(164,225), 25.0).
region(r10, '#ffdc00', 14100, centroid(234,366)).
perimeter(r10, 740).
polygon(r10, [xy(249,470),xy(190,469),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(290,459),xy(250,460),xy(249,470)]).
midline(r10, [xy(214,460),xy(199,460)]).
midline(r10, [xy(215,460),xy(240,460)]).
midline(r10, [xy(241,458),xy(265,434),xy(265,352),xy(264,340),xy(260,329),xy(239,324),xy(164,325)]).
fillpoint(r10, xy(260,329), 29.7).
fillpoint(r10, xy(258,328), 29.0).
fillpoint(r10, xy(261,331), 29.0).
fillpoint(r10, xy(255,327), 28.0).
fillpoint(r10, xy(262,334), 28.0).
fillpoint(r10, xy(252,326), 27.0).
fillpoint(r10, xy(263,337), 27.0).
fillpoint(r10, xy(248,325), 26.0).
fillpoint(r10, xy(264,342), 26.0).
fillpoint(r10, xy(164,325), 25.0).
fillpoint(r10, xy(265,393), 25.0).
fillpoint(r10, xy(199,460), 10.0).
fillpoint(r10, xy(240,459), 10.0).
region(r4, '#ffdc00', 13800, centroid(66,270)).
perimeter(r4, 740).
polygon(r4, [xy(89,430),xy(80,430),xy(80,420),xy(70,420),xy(70,410),xy(60,410),xy(59,400),xy(50,399),xy(50,380),xy(40,379),xy(40,160),xy(50,159),xy(50,140),xy(60,139),xy(60,130),xy(70,129),xy(70,120),xy(80,119),xy(80,110),xy(90,110),xy(89,430)]).
midline(r4, [xy(65,249),xy(65,184),xy(61,179),xy(64,179),xy(67,174),xy(69,158),xy(79,135),xy(79,129),xy(84,123),xy(85,114)]).
midline(r4, [xy(65,250),xy(64,359),xy(69,372),xy(69,381),xy(79,404),xy(79,410),xy(84,416),xy(85,425)]).
midline(r4, [xy(65,180),xy(64,181)]).
fillpoint(r4, xy(64,270), 25.0).
fillpoint(r4, xy(69,166), 21.0).
fillpoint(r4, xy(69,373), 21.0).
fillpoint(r4, xy(70,157), 20.0).
fillpoint(r4, xy(69,382), 20.0).
fillpoint(r4, xy(74,145), 16.0).
fillpoint(r4, xy(74,394), 16.0).
fillpoint(r4, xy(79,134), 11.0).
fillpoint(r4, xy(79,405), 11.0).
region(r21, '#2ecc40', 6400, centroid(290,620)).
perimeter(r21, 680).
polygon(r21, [xy(449,630),xy(130,630),xy(130,610),xy(449,610),xy(449,630)]).
midline(r21, [xy(304,619),xy(139,620)]).
midline(r21, [xy(305,620),xy(440,620)]).
fillpoint(r21, xy(139,620), 10.0).
region(r22, '#5a5a5a', 2000, centroid(500,620)).
perimeter(r22, 240).
polygon(r22, [xy(549,630),xy(450,630),xy(450,610),xy(549,610),xy(549,630)]).
midline(r22, [xy(505,619),xy(459,620)]).
midline(r22, [xy(506,619),xy(540,620)]).
fillpoint(r22, xy(459,620), 10.0).
region(r12, '#ffdc00', 1800, centroid(357,382)).
perimeter(r12, 220).
polygon(r12, [xy(349,420),xy(340,419),xy(340,360),xy(389,360),xy(390,369),xy(380,370),xy(379,380),xy(370,380),xy(370,399),xy(360,400),xy(360,409),xy(350,410),xy(349,420)]).
midline(r12, [xy(354,380),xy(355,385),xy(350,394),xy(350,400),xy(345,406),xy(345,415)]).
midline(r12, [xy(355,379),xy(355,375),xy(364,370),xy(370,370),xy(376,365),xy(385,365)]).
fillpoint(r12, xy(355,375), 15.8).
fillpoint(r12, xy(355,383), 15.0).
fillpoint(r12, xy(365,370), 11.0).
fillpoint(r12, xy(350,395), 11.0).
fillpoint(r12, xy(381,365), 5.0).
fillpoint(r12, xy(345,413), 5.0).
region(r9, '#870c25', 1500, centroid(214,284)).
perimeter(r9, 160).
polygon(r9, [xy(239,300),xy(190,300),xy(190,270),xy(239,270),xy(239,300)]).
midline(r9, [xy(216,284),xy(204,285)]).
midline(r9, [xy(217,284),xy(225,285)]).
fillpoint(r9, xy(204,285), 15.0).
region(r8, '#bebebe', 1000, centroid(214,260)).
perimeter(r8, 140).
polygon(r8, [xy(239,270),xy(190,270),xy(190,250),xy(239,250),xy(239,270)]).
midline(r8, [xy(209,260),xy(199,260)]).
midline(r8, [xy(210,259),xy(230,260)]).
fillpoint(r8, xy(199,260), 10.0).
region(r6, '#5a5a5a', 800, centroid(314,224)).
perimeter(r6, 160).
polygon(r6, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r6, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r6, [xy(319,214),xy(305,215),xy(305,234),xy(319,235),xy(324,233),xy(325,220),xy(324,216),xy(320,215)]).
fillpoint(r6, xy(306,215), 6.0).
fillpoint(r6, xy(324,215), 6.0).
fillpoint(r6, xy(305,234), 6.0).
fillpoint(r6, xy(323,234), 6.0).
fillpoint(r6, xy(311,215), 5.0).
fillpoint(r6, xy(304,225), 5.0).
fillpoint(r6, xy(324,225), 5.0).
fillpoint(r6, xy(311,235), 5.0).
region(r11, '#0074d9', 500, centroid(364,354)).
perimeter(r11, 120).
polygon(r11, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r11, [xy(359,354),xy(344,355)]).
midline(r11, [xy(360,354),xy(385,355)]).
fillpoint(r11, xy(344,355), 5.0).
region(r23, '#7fdbff', 400, centroid(570,620)).
perimeter(r23, 80).
polygon(r23, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r23, [xy(569,619),xy(570,620)]).
fillpoint(r23, xy(569,620), 10.0).
region(r24, '#7fdbff', 400, centroid(600,620)).
perimeter(r24, 80).
polygon(r24, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r24, [xy(599,619),xy(600,620)]).
fillpoint(r24, xy(599,620), 10.0).
region(r25, '#7fdbff', 400, centroid(630,620)).
perimeter(r25, 80).
polygon(r25, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r25, [xy(629,619),xy(630,620)]).
fillpoint(r25, xy(629,620), 10.0).
border(r25).
region(r18, '#000000', 300, centroid(218,428)).
perimeter(r18, 80).
polygon(r18, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r18, [xy(214,434),xy(215,435)]).
midline(r18, [xy(215,433),xy(215,425),xy(225,425)]).
fillpoint(r18, xy(216,425), 6.0).
fillpoint(r18, xy(221,425), 5.0).
fillpoint(r18, xy(215,433), 5.0).
region(r7, '#2ecc40', 100, centroid(314,224)).
perimeter(r7, 40).
polygon(r7, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r7, [xy(315,225),xy(315,224)]).
fillpoint(r7, xy(314,225), 5.0).
region(r15, '#000000', 100, centroid(204,414)).
perimeter(r15, 40).
polygon(r15, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r15, [xy(205,415),xy(205,414)]).
fillpoint(r15, xy(204,415), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 810).
adjacent(r1, r4).
shared_edge(r1, r4, 420).
adjacent(r1, r10).
shared_edge(r1, r10, 120).
adjacent(r1, r11).
shared_edge(r1, r11, 10).
adjacent(r1, r12).
shared_edge(r1, r12, 110).
adjacent(r1, r21).
shared_edge(r1, r21, 660).
adjacent(r1, r22).
shared_edge(r1, r22, 220).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 80).
adjacent(r1, r25).
shared_edge(r1, r25, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 650).
adjacent(r2, r4).
shared_edge(r2, r4, 320).
adjacent(r2, r6).
shared_edge(r2, r6, 120).
adjacent(r2, r8).
shared_edge(r2, r8, 40).
adjacent(r2, r9).
shared_edge(r2, r9, 60).
adjacent(r2, r10).
shared_edge(r2, r10, 570).
adjacent(r2, r11).
shared_edge(r2, r11, 60).
adjacent(r2, r12).
shared_edge(r2, r12, 60).
adjacent(r2, r15).
shared_edge(r2, r15, 40).
adjacent(r2, r18).
shared_edge(r2, r18, 80).
adjacent(r3, r8).
shared_edge(r3, r8, 50).
adjacent(r6, r7).
shared_edge(r6, r7, 40).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r9, r10).
shared_edge(r9, r10, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r21, r22).
shared_edge(r21, r22, 20).

encloses(r6, r7).
encloses(r2, r15).
encloses(r2, r18).
encloses(r1, r23).
encloses(r1, r24).
