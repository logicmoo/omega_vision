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

region(r1, '#aaaaaa', 273600, centroid(345,332)).
perimeter(r1, 5240).
polygon(r1, [xy(300,469),xy(300,460),xy(339,460),xy(340,450),xy(359,450),xy(360,440),xy(369,440),xy(370,430),xy(389,430),xy(390,420),xy(399,420),xy(400,410),xy(409,410),xy(410,400),xy(420,399),xy(420,380),xy(429,380),xy(430,370),xy(440,369),xy(440,350),xy(450,349),xy(450,310),xy(460,309),xy(460,230),xy(450,229),xy(450,190),xy(440,189),xy(440,170),xy(430,170),xy(430,160),xy(420,159),xy(420,140),xy(410,140),xy(410,130),xy(400,130),xy(399,120),xy(390,119),xy(389,110),xy(370,110),xy(370,100),xy(360,99),xy(359,90),xy(340,90),xy(339,80),xy(300,80),xy(300,70),xy(290,70),xy(220,70),xy(219,80),xy(180,80),xy(179,90),xy(160,90),xy(160,99),xy(150,100),xy(149,110),xy(130,110),xy(130,119),xy(120,120),xy(120,129),xy(110,130),xy(110,139),xy(100,140),xy(100,159),xy(90,160),xy(90,169),xy(80,170),xy(80,189),xy(70,190),xy(70,229),xy(60,230),xy(60,291),xy(60,309),xy(70,310),xy(70,349),xy(80,350),xy(80,369),xy(89,370),xy(90,379),xy(100,380),xy(100,399),xy(109,400),xy(110,409),xy(119,410),xy(120,419),xy(130,420),xy(130,430),xy(149,430),xy(150,439),xy(159,440),xy(160,450),xy(179,450),xy(180,460),xy(219,460),xy(220,470),xy(300,469)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(68,571),xy(72,567),xy(84,538),xy(96,520),xy(77,487),xy(62,447),xy(57,439),xy(36,365),xy(35,334),xy(31,324),xy(29,308),xy(29,230),xy(31,215),xy(35,205),xy(35,179),xy(42,156),xy(43,145),xy(50,130),xy(57,100),xy(68,74),xy(70,70),xy(78,68)]).
midline(r1, [xy(97,520),xy(156,533),xy(172,534),xy(184,520),xy(184,514),xy(190,508),xy(193,495),xy(195,495)]).
midline(r1, [xy(174,534),xy(180,534),xy(183,531),xy(183,523),xy(189,511)]).
midline(r1, [xy(181,535),xy(222,540),xy(299,540),xy(336,535),xy(338,533),xy(331,510),xy(323,488),xy(316,478),xy(318,478)]).
midline(r1, [xy(325,490),xy(324,489)]).
midline(r1, [xy(330,505),xy(331,506)]).
midline(r1, [xy(79,66),xy(97,59),xy(116,56),xy(130,49),xy(163,41),xy(192,40),xy(221,34),xy(310,35),xy(327,40),xy(321,54),xy(330,39),xy(351,40),xy(377,46),xy(378,48),xy(389,49),xy(403,56),xy(422,59),xy(450,70),xy(455,74),xy(457,73),xy(479,82),xy(530,109),xy(542,158),xy(506,194),xy(494,198),xy(492,200),xy(496,199),xy(496,201)]).
midline(r1, [xy(510,192),xy(542,160)]).
midline(r1, [xy(512,193),xy(543,163)]).
midline(r1, [xy(516,192),xy(515,195),xy(505,196)]).
midline(r1, [xy(518,194),xy(525,192),xy(544,173),xy(543,165)]).
midline(r1, [xy(498,198),xy(498,200)]).
midline(r1, [xy(327,48),xy(326,49)]).
midline(r1, [xy(502,197),xy(500,199)]).
midline(r1, [xy(338,535),xy(363,533),xy(399,525),xy(408,521),xy(358,469),xy(409,522)]).
midline(r1, [xy(544,175),xy(550,230),xy(550,306),xy(544,363),xy(526,347),xy(523,348),xy(515,344),xy(506,343),xy(476,330),xy(478,333)]).
midline(r1, [xy(544,365),xy(526,349)]).
midline(r1, [xy(544,367),xy(531,429),xy(527,436),xy(528,438),xy(514,482),xy(457,507),xy(411,521)]).
midline(r1, [xy(499,341),xy(507,344)]).
midline(r1, [xy(514,484),xy(555,525),xy(555,632),xy(553,634),xy(132,635),xy(120,630),xy(91,601),xy(82,587),xy(69,573),xy(71,571),xy(74,573),xy(71,573)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,632),xy(577,635),xy(555,633)]).
midline(r1, [xy(74,575),xy(79,582)]).
midline(r1, [xy(586,556),xy(615,585),xy(615,627),xy(614,633),xy(609,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(486,337),xy(485,336)]).
midline(r1, [xy(36,205),xy(41,208),xy(43,207),xy(43,209)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(43,155),xy(57,171)]).
midline(r1, [xy(515,346),xy(516,347)]).
midline(r1, [xy(45,209),xy(49,210),xy(49,212)]).
midline(r1, [xy(156,62),xy(161,67)]).
fillpoint(r1, xy(513,483), 126.1).
fillpoint(r1, xy(520,464), 120.0).
fillpoint(r1, xy(522,457), 118.0).
fillpoint(r1, xy(523,453), 117.0).
fillpoint(r1, xy(524,449), 116.0).
fillpoint(r1, xy(488,494), 116.0).
fillpoint(r1, xy(527,440), 113.0).
fillpoint(r1, xy(528,437), 112.0).
fillpoint(r1, xy(529,434), 111.0).
fillpoint(r1, xy(530,431), 110.0).
fillpoint(r1, xy(530,109), 109.6).
fillpoint(r1, xy(531,111), 109.0).
fillpoint(r1, xy(531,428), 109.0).
fillpoint(r1, xy(532,115), 108.0).
fillpoint(r1, xy(532,424), 108.0).
fillpoint(r1, xy(535,127), 105.0).
fillpoint(r1, xy(535,412), 105.0).
fillpoint(r1, xy(536,132), 104.0).
fillpoint(r1, xy(536,408), 104.0).
fillpoint(r1, xy(537,136), 103.0).
fillpoint(r1, xy(537,403), 103.0).
fillpoint(r1, xy(538,140), 102.0).
fillpoint(r1, xy(538,399), 102.0).
fillpoint(r1, xy(539,144), 101.0).
fillpoint(r1, xy(539,395), 101.0).
fillpoint(r1, xy(540,148), 100.0).
fillpoint(r1, xy(540,391), 100.0).
fillpoint(r1, xy(448,510), 100.0).
fillpoint(r1, xy(541,153), 99.0).
fillpoint(r1, xy(541,386), 99.0).
fillpoint(r1, xy(542,159), 98.0).
fillpoint(r1, xy(542,381), 98.0).
fillpoint(r1, xy(543,165), 97.0).
fillpoint(r1, xy(543,374), 97.0).
fillpoint(r1, xy(438,513), 97.0).
fillpoint(r1, xy(544,174), 96.0).
fillpoint(r1, xy(544,365), 96.0).
fillpoint(r1, xy(434,514), 96.0).
fillpoint(r1, xy(95,520), 96.0).
fillpoint(r1, xy(545,189), 95.0).
fillpoint(r1, xy(545,350), 95.0).
fillpoint(r1, xy(430,515), 95.0).
fillpoint(r1, xy(546,194), 94.0).
fillpoint(r1, xy(546,345), 94.0).
fillpoint(r1, xy(425,516), 94.0).
fillpoint(r1, xy(547,199), 93.0).
fillpoint(r1, xy(547,340), 93.0).
fillpoint(r1, xy(548,206), 92.0).
fillpoint(r1, xy(548,334), 92.0).
fillpoint(r1, xy(549,215), 91.0).
fillpoint(r1, xy(549,325), 91.0).
fillpoint(r1, xy(549,270), 90.0).
fillpoint(r1, xy(405,523), 87.0).
fillpoint(r1, xy(398,525), 85.0).
fillpoint(r1, xy(393,526), 84.0).
fillpoint(r1, xy(131,527), 83.0).
fillpoint(r1, xy(388,527), 83.0).
fillpoint(r1, xy(139,529), 81.0).
fillpoint(r1, xy(380,529), 81.0).
fillpoint(r1, xy(143,530), 80.0).
fillpoint(r1, xy(376,530), 80.0).
fillpoint(r1, xy(147,531), 79.0).
fillpoint(r1, xy(372,531), 79.0).
fillpoint(r1, xy(152,532), 78.0).
fillpoint(r1, xy(368,532), 78.0).
fillpoint(r1, xy(158,533), 77.0).
fillpoint(r1, xy(362,533), 77.0).
fillpoint(r1, xy(166,534), 76.0).
fillpoint(r1, xy(354,534), 76.0).
fillpoint(r1, xy(182,535), 75.0).
fillpoint(r1, xy(336,535), 75.0).
fillpoint(r1, xy(188,536), 74.0).
fillpoint(r1, xy(331,536), 74.0).
fillpoint(r1, xy(193,537), 73.0).
fillpoint(r1, xy(326,537), 73.0).
fillpoint(r1, xy(199,538), 72.0).
fillpoint(r1, xy(321,538), 72.0).
fillpoint(r1, xy(207,539), 71.0).
fillpoint(r1, xy(313,539), 71.0).
fillpoint(r1, xy(70,70), 70.7).
fillpoint(r1, xy(221,540), 70.0).
fillpoint(r1, xy(92,61), 62.0).
fillpoint(r1, xy(427,61), 62.0).
fillpoint(r1, xy(95,60), 61.0).
fillpoint(r1, xy(424,60), 61.0).
fillpoint(r1, xy(98,59), 60.0).
fillpoint(r1, xy(421,59), 60.0).
fillpoint(r1, xy(102,58), 59.0).
fillpoint(r1, xy(417,58), 59.0).
fillpoint(r1, xy(106,57), 58.0).
fillpoint(r1, xy(413,57), 58.0).
fillpoint(r1, xy(57,101), 58.0).
fillpoint(r1, xy(57,438), 58.0).
fillpoint(r1, xy(111,56), 57.0).
fillpoint(r1, xy(408,56), 57.0).
fillpoint(r1, xy(53,113), 54.0).
fillpoint(r1, xy(53,426), 54.0).
fillpoint(r1, xy(52,117), 53.0).
fillpoint(r1, xy(52,422), 53.0).
fillpoint(r1, xy(51,122), 52.0).
fillpoint(r1, xy(51,418), 52.0).
fillpoint(r1, xy(50,128), 51.0).
fillpoint(r1, xy(50,412), 51.0).
fillpoint(r1, xy(131,49), 50.0).
fillpoint(r1, xy(388,49), 50.0).
fillpoint(r1, xy(138,47), 48.0).
fillpoint(r1, xy(381,47), 48.0).
fillpoint(r1, xy(143,46), 47.0).
fillpoint(r1, xy(376,46), 47.0).
fillpoint(r1, xy(149,45), 46.0).
fillpoint(r1, xy(370,45), 46.0).
fillpoint(r1, xy(153,44), 45.0).
fillpoint(r1, xy(366,44), 45.0).
fillpoint(r1, xy(44,143), 45.0).
fillpoint(r1, xy(44,396), 45.0).
fillpoint(r1, xy(156,43), 44.0).
fillpoint(r1, xy(363,43), 44.0).
fillpoint(r1, xy(43,146), 44.0).
fillpoint(r1, xy(43,393), 44.0).
fillpoint(r1, xy(164,41), 42.0).
fillpoint(r1, xy(355,41), 42.0).
fillpoint(r1, xy(41,154), 42.0).
fillpoint(r1, xy(41,385), 42.0).
fillpoint(r1, xy(170,40), 41.0).
fillpoint(r1, xy(349,40), 41.0).
fillpoint(r1, xy(40,160), 41.0).
fillpoint(r1, xy(40,379), 41.0).
fillpoint(r1, xy(194,39), 40.0).
fillpoint(r1, xy(338,39), 40.0).
fillpoint(r1, xy(201,37), 38.0).
fillpoint(r1, xy(318,37), 38.0).
fillpoint(r1, xy(37,171), 38.0).
fillpoint(r1, xy(37,368), 38.0).
fillpoint(r1, xy(205,36), 37.0).
fillpoint(r1, xy(314,36), 37.0).
fillpoint(r1, xy(36,175), 37.0).
fillpoint(r1, xy(36,364), 37.0).
fillpoint(r1, xy(211,35), 36.0).
fillpoint(r1, xy(309,35), 36.0).
fillpoint(r1, xy(35,181), 36.0).
fillpoint(r1, xy(35,359), 36.0).
fillpoint(r1, xy(221,35), 35.0).
fillpoint(r1, xy(35,198), 35.0).
fillpoint(r1, xy(34,341), 35.0).
fillpoint(r1, xy(31,216), 32.0).
fillpoint(r1, xy(31,323), 32.0).
border(r1).
region(r2, '#2ecc40', 79600, centroid(260,262)).
perimeter(r2, 3160).
polygon(r2, [xy(299,470),xy(290,469),xy(290,200),xy(339,200),xy(340,150),xy(290,150),xy(289,100),xy(240,100),xy(239,200),xy(140,200),xy(140,250),xy(240,250),xy(239,300),xy(140,300),xy(140,350),xy(240,350),xy(240,449),xy(190,450),xy(190,459),xy(180,460),xy(179,450),xy(160,450),xy(160,440),xy(150,440),xy(149,430),xy(130,430),xy(130,410),xy(110,410),xy(110,400),xy(100,399),xy(100,380),xy(90,379),xy(90,160),xy(100,159),xy(100,140),xy(109,140),xy(110,130),xy(119,130),xy(120,120),xy(130,119),xy(130,110),xy(149,110),xy(150,100),xy(159,100),xy(160,90),xy(179,90),xy(180,80),xy(219,80),xy(220,70),xy(299,70),xy(300,80),xy(339,80),xy(340,100),xy(369,100),xy(370,110),xy(389,110),xy(390,119),xy(399,120),xy(400,129),xy(409,130),xy(410,140),xy(420,140),xy(419,150),xy(390,150),xy(390,199),xy(440,200),xy(440,369),xy(430,370),xy(429,380),xy(420,380),xy(420,399),xy(410,400),xy(410,409),xy(400,410),xy(399,420),xy(390,420),xy(390,350),xy(340,350),xy(340,459),xy(300,460),xy(299,470)]).
hole(r2, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
hole(r2, [xy(220,439),xy(220,430),xy(230,429),xy(230,420),xy(210,420),xy(210,410),xy(200,410),xy(200,419),xy(210,420),xy(210,439),xy(220,439)]).
midline(r2, [xy(230,440),xy(223,444),xy(210,445),xy(204,443),xy(194,434),xy(181,429),xy(172,417),xy(164,395),xy(165,391),xy(153,384),xy(131,379),xy(114,359),xy(114,301),xy(116,286),xy(121,274),xy(116,263),xy(114,249),xy(114,201),xy(117,184),xy(111,179),xy(117,182),xy(140,160),xy(142,161),xy(155,155),xy(167,153),xy(168,151),xy(172,152),xy(187,146),xy(195,129),xy(178,112),xy(179,109),xy(196,128)]).
midline(r2, [xy(184,432),xy(185,455)]).
midline(r2, [xy(165,390),xy(185,381),xy(200,379),xy(210,379),xy(216,387),xy(224,405),xy(195,434)]).
midline(r2, [xy(225,405),xy(233,414),xy(235,420),xy(234,433),xy(230,438)]).
midline(r2, [xy(122,275),xy(215,275)]).
midline(r2, [xy(198,126),xy(203,116),xy(234,84),xy(285,84),xy(303,94),xy(315,104),xy(319,120),xy(330,124),xy(349,125),xy(365,137),xy(365,222),xy(363,224),xy(350,218),xy(333,205),xy(295,205),xy(294,235),xy(296,245),xy(345,294),xy(327,314),xy(316,336),xy(314,350),xy(315,433),xy(296,454),xy(295,465)]).
midline(r2, [xy(366,136),xy(369,133),xy(369,135)]).
midline(r2, [xy(371,134),xy(385,134),xy(394,139),xy(400,139),xy(406,144),xy(415,145)]).
midline(r2, [xy(346,293),xy(362,290),xy(375,284),xy(402,314),xy(411,330),xy(415,350),xy(405,373),xy(405,385),xy(400,394),xy(400,400),xy(395,406),xy(395,415)]).
midline(r2, [xy(376,283),xy(384,255),xy(373,240),xy(365,224)]).
fillpoint(r2, xy(375,285), 65.0).
fillpoint(r2, xy(378,277), 62.0).
fillpoint(r2, xy(367,288), 62.0).
fillpoint(r2, xy(379,274), 61.0).
fillpoint(r2, xy(364,289), 61.0).
fillpoint(r2, xy(380,271), 60.0).
fillpoint(r2, xy(361,290), 60.0).
fillpoint(r2, xy(381,267), 59.0).
fillpoint(r2, xy(357,291), 59.0).
fillpoint(r2, xy(382,263), 58.0).
fillpoint(r2, xy(353,292), 58.0).
fillpoint(r2, xy(383,258), 57.0).
fillpoint(r2, xy(348,293), 57.0).
fillpoint(r2, xy(186,147), 53.0).
fillpoint(r2, xy(178,150), 50.0).
fillpoint(r2, xy(171,152), 48.0).
fillpoint(r2, xy(166,153), 47.0).
fillpoint(r2, xy(160,154), 46.0).
fillpoint(r2, xy(156,155), 45.0).
fillpoint(r2, xy(165,390), 40.3).
fillpoint(r2, xy(143,381), 32.0).
fillpoint(r2, xy(186,381), 32.0).
fillpoint(r2, xy(121,275), 31.4).
fillpoint(r2, xy(138,380), 31.1).
fillpoint(r2, xy(132,379), 31.0).
fillpoint(r2, xy(192,380), 31.0).
fillpoint(r2, xy(130,378), 30.4).
fillpoint(r2, xy(201,380), 30.0).
fillpoint(r2, xy(319,120), 29.7).
fillpoint(r2, xy(318,118), 29.0).
fillpoint(r2, xy(321,121), 29.0).
fillpoint(r2, xy(119,180), 29.0).
fillpoint(r2, xy(118,181), 29.0).
fillpoint(r2, xy(118,268), 29.0).
fillpoint(r2, xy(118,281), 29.0).
fillpoint(r2, xy(318,331), 29.0).
fillpoint(r2, xy(411,331), 29.0).
fillpoint(r2, xy(171,411), 29.0).
fillpoint(r2, xy(365,137), 28.2).
fillpoint(r2, xy(317,115), 28.0).
fillpoint(r2, xy(324,122), 28.0).
fillpoint(r2, xy(117,184), 28.0).
fillpoint(r2, xy(117,265), 28.0).
fillpoint(r2, xy(117,284), 28.0).
fillpoint(r2, xy(317,334), 28.0).
fillpoint(r2, xy(412,334), 28.0).
fillpoint(r2, xy(172,414), 28.0).
fillpoint(r2, xy(316,112), 27.0).
fillpoint(r2, xy(327,123), 27.0).
fillpoint(r2, xy(116,187), 27.0).
fillpoint(r2, xy(116,262), 27.0).
fillpoint(r2, xy(116,287), 27.0).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(413,337), 27.0).
fillpoint(r2, xy(350,126), 26.2).
fillpoint(r2, xy(116,360), 26.2).
fillpoint(r2, xy(315,108), 26.0).
fillpoint(r2, xy(332,124), 26.0).
fillpoint(r2, xy(348,125), 26.0).
fillpoint(r2, xy(115,192), 26.0).
fillpoint(r2, xy(115,258), 26.0).
fillpoint(r2, xy(115,292), 26.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(414,342), 26.0).
fillpoint(r2, xy(115,358), 26.0).
fillpoint(r2, xy(354,129), 25.6).
fillpoint(r2, xy(355,130), 25.6).
fillpoint(r2, xy(119,364), 25.6).
fillpoint(r2, xy(120,365), 25.6).
fillpoint(r2, xy(364,175), 25.0).
fillpoint(r2, xy(114,225), 25.0).
fillpoint(r2, xy(141,275), 25.0).
fillpoint(r2, xy(114,325), 25.0).
fillpoint(r2, xy(315,393), 25.0).
region(r4, '#ffdc00', 15000, centroid(248,191)).
perimeter(r4, 700).
polygon(r4, [xy(289,250),xy(140,249),xy(140,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r4, [xy(263,210),xy(260,220),xy(249,224),xy(164,225)]).
midline(r4, [xy(264,209),xy(266,186),xy(271,175),xy(265,158),xy(265,124)]).
midline(r4, [xy(272,175),xy(315,175)]).
fillpoint(r4, xy(271,175), 31.4).
fillpoint(r4, xy(260,220), 29.7).
fillpoint(r4, xy(268,168), 29.0).
fillpoint(r4, xy(268,181), 29.0).
fillpoint(r4, xy(261,218), 29.0).
fillpoint(r4, xy(258,221), 29.0).
fillpoint(r4, xy(267,165), 28.0).
fillpoint(r4, xy(267,184), 28.0).
fillpoint(r4, xy(262,215), 28.0).
fillpoint(r4, xy(255,222), 28.0).
fillpoint(r4, xy(266,162), 27.0).
fillpoint(r4, xy(266,187), 27.0).
fillpoint(r4, xy(263,212), 27.0).
fillpoint(r4, xy(252,223), 27.0).
fillpoint(r4, xy(265,158), 26.0).
fillpoint(r4, xy(265,192), 26.0).
fillpoint(r4, xy(264,208), 26.0).
fillpoint(r4, xy(248,224), 26.0).
fillpoint(r4, xy(265,136), 25.0).
fillpoint(r4, xy(291,175), 25.0).
fillpoint(r4, xy(164,225), 25.0).
region(r13, '#ffdc00', 14200, centroid(236,367)).
perimeter(r13, 740).
polygon(r13, [xy(289,470),xy(220,470),xy(219,460),xy(190,459),xy(190,450),xy(240,449),xy(240,350),xy(140,350),xy(140,300),xy(290,300),xy(289,470)]).
midline(r13, [xy(265,407),xy(265,444),xy(253,455),xy(237,460),xy(229,460),xy(223,455),xy(194,455)]).
midline(r13, [xy(265,406),xy(265,351),xy(263,336),xy(259,328),xy(237,324),xy(164,325)]).
fillpoint(r13, xy(260,329), 29.7).
fillpoint(r13, xy(258,328), 29.0).
fillpoint(r13, xy(261,331), 29.0).
fillpoint(r13, xy(255,327), 28.0).
fillpoint(r13, xy(262,334), 28.0).
fillpoint(r13, xy(252,326), 27.0).
fillpoint(r13, xy(263,337), 27.0).
fillpoint(r13, xy(248,325), 26.0).
fillpoint(r13, xy(264,342), 26.0).
fillpoint(r13, xy(164,325), 25.0).
fillpoint(r13, xy(265,398), 25.0).
fillpoint(r13, xy(244,459), 11.0).
fillpoint(r13, xy(229,460), 10.0).
region(r20, '#2ecc40', 6000, centroid(280,620)).
perimeter(r20, 640).
polygon(r20, [xy(429,630),xy(130,630),xy(130,610),xy(429,610),xy(429,630)]).
midline(r20, [xy(345,620),xy(139,620)]).
midline(r20, [xy(346,620),xy(420,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r6, '#ffdc00', 4400, centroid(77,270)).
perimeter(r6, 460).
polygon(r6, [xy(89,370),xy(80,369),xy(80,350),xy(70,349),xy(70,310),xy(60,309),xy(60,230),xy(70,229),xy(70,190),xy(80,189),xy(80,170),xy(90,170),xy(89,370)]).
midline(r6, [xy(84,192),xy(85,174)]).
midline(r6, [xy(84,193),xy(79,199),xy(80,229),xy(74,244),xy(74,295),xy(79,304),xy(79,340),xy(84,346),xy(85,365)]).
fillpoint(r6, xy(74,270), 15.0).
fillpoint(r6, xy(79,234), 11.0).
fillpoint(r6, xy(79,305), 11.0).
fillpoint(r6, xy(79,214), 10.0).
fillpoint(r6, xy(79,326), 10.0).
fillpoint(r6, xy(85,181), 5.0).
fillpoint(r6, xy(85,358), 5.0).
region(r16, '#ffdc00', 4000, centroid(363,400)).
perimeter(r16, 280).
polygon(r16, [xy(359,450),xy(340,449),xy(340,360),xy(389,360),xy(390,429),xy(370,430),xy(370,439),xy(360,440),xy(359,450)]).
midline(r16, [xy(364,394),xy(365,384)]).
midline(r16, [xy(365,395),xy(365,405),xy(357,417),xy(350,434),xy(350,440)]).
fillpoint(r16, xy(364,395), 25.0).
fillpoint(r16, xy(355,424), 16.0).
fillpoint(r16, xy(350,435), 11.0).
region(r21, '#5a5a5a', 2400, centroid(490,620)).
perimeter(r21, 280).
polygon(r21, [xy(549,630),xy(430,630),xy(430,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(441,619),xy(439,620)]).
midline(r21, [xy(442,620),xy(540,620)]).
fillpoint(r21, xy(439,620), 10.0).
region(r8, '#ffdc00', 1900, centroid(449,255)).
perimeter(r8, 280).
polygon(r8, [xy(459,310),xy(450,310),xy(450,300),xy(440,299),xy(440,190),xy(450,190),xy(450,229),xy(460,230),xy(459,310)]).
midline(r8, [xy(449,290),xy(450,239),xy(444,229),xy(445,194)]).
midline(r8, [xy(450,291),xy(454,296),xy(455,305)]).
fillpoint(r8, xy(449,265), 10.0).
fillpoint(r8, xy(445,211), 5.0).
fillpoint(r8, xy(455,303), 5.0).
region(r5, '#ffdc00', 1700, centroid(412,172)).
perimeter(r5, 180).
polygon(r5, [xy(439,190),xy(390,190),xy(390,150),xy(419,150),xy(420,159),xy(429,160),xy(430,169),xy(440,170),xy(439,190)]).
midline(r5, [xy(424,179),xy(408,172),xy(405,164)]).
midline(r5, [xy(425,179),xy(430,180)]).
fillpoint(r5, xy(407,172), 18.0).
fillpoint(r5, xy(405,165), 16.0).
fillpoint(r5, xy(414,174), 16.0).
fillpoint(r5, xy(425,179), 11.0).
region(r12, '#870c25', 1500, centroid(264,284)).
perimeter(r12, 160).
polygon(r12, [xy(289,300),xy(240,300),xy(240,270),xy(289,270),xy(289,300)]).
midline(r12, [xy(266,284),xy(254,285)]).
midline(r12, [xy(267,285),xy(275,285)]).
fillpoint(r12, xy(254,285), 15.0).
region(r11, '#bebebe', 1000, centroid(264,260)).
perimeter(r11, 140).
polygon(r11, [xy(289,270),xy(240,270),xy(240,250),xy(289,250),xy(289,270)]).
midline(r11, [xy(259,260),xy(249,260)]).
midline(r11, [xy(260,259),xy(280,260)]).
fillpoint(r11, xy(249,260), 10.0).
region(r9, '#5a5a5a', 800, centroid(314,224)).
perimeter(r9, 160).
polygon(r9, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r9, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r9, [xy(319,214),xy(305,215),xy(305,234),xy(318,235),xy(324,233),xy(325,220),xy(324,216),xy(320,215)]).
fillpoint(r9, xy(306,215), 6.0).
fillpoint(r9, xy(324,215), 6.0).
fillpoint(r9, xy(305,234), 6.0).
fillpoint(r9, xy(323,234), 6.0).
fillpoint(r9, xy(311,215), 5.0).
fillpoint(r9, xy(304,225), 5.0).
fillpoint(r9, xy(324,225), 5.0).
fillpoint(r9, xy(311,235), 5.0).
region(r7, '#0074d9', 500, centroid(414,194)).
perimeter(r7, 120).
polygon(r7, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r7, [xy(408,195),xy(394,195)]).
midline(r7, [xy(409,195),xy(435,195)]).
fillpoint(r7, xy(394,195), 5.0).
region(r14, '#0074d9', 500, centroid(444,324)).
perimeter(r14, 120).
polygon(r14, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r14, [xy(445,317),xy(445,304)]).
midline(r14, [xy(445,318),xy(445,345)]).
fillpoint(r14, xy(444,325), 5.0).
region(r15, '#0074d9', 500, centroid(364,354)).
perimeter(r15, 120).
polygon(r15, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r15, [xy(359,354),xy(344,355)]).
midline(r15, [xy(360,355),xy(385,355)]).
fillpoint(r15, xy(344,355), 5.0).
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
region(r19, '#000000', 300, centroid(218,428)).
perimeter(r19, 80).
polygon(r19, [xy(219,440),xy(210,439),xy(210,420),xy(229,420),xy(230,429),xy(220,430),xy(219,440)]).
midline(r19, [xy(214,434),xy(215,435)]).
midline(r19, [xy(215,433),xy(215,425),xy(225,425)]).
fillpoint(r19, xy(216,425), 6.0).
fillpoint(r19, xy(221,425), 5.0).
fillpoint(r19, xy(215,433), 5.0).
region(r10, '#2ecc40', 100, centroid(314,224)).
perimeter(r10, 40).
polygon(r10, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r10, [xy(315,225),xy(315,224)]).
fillpoint(r10, xy(314,225), 5.0).
region(r18, '#000000', 100, centroid(204,414)).
perimeter(r18, 40).
polygon(r18, [xy(209,420),xy(200,419),xy(200,410),xy(210,410),xy(209,420)]).
midline(r18, [xy(205,415),xy(205,414)]).
fillpoint(r18, xy(204,415), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 840).
adjacent(r1, r5).
shared_edge(r1, r5, 60).
adjacent(r1, r6).
shared_edge(r1, r6, 260).
adjacent(r1, r8).
shared_edge(r1, r8, 150).
adjacent(r1, r13).
shared_edge(r1, r13, 110).
adjacent(r1, r14).
shared_edge(r1, r14, 50).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 620).
adjacent(r1, r21).
shared_edge(r1, r21, 260).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 60).
adjacent(r2, r4).
shared_edge(r2, r4, 650).
adjacent(r2, r5).
shared_edge(r2, r5, 70).
adjacent(r2, r6).
shared_edge(r2, r6, 200).
adjacent(r2, r7).
shared_edge(r2, r7, 60).
adjacent(r2, r8).
shared_edge(r2, r8, 100).
adjacent(r2, r9).
shared_edge(r2, r9, 120).
adjacent(r2, r11).
shared_edge(r2, r11, 40).
adjacent(r2, r12).
shared_edge(r2, r12, 60).
adjacent(r2, r13).
shared_edge(r2, r13, 580).
adjacent(r2, r14).
shared_edge(r2, r14, 50).
adjacent(r2, r15).
shared_edge(r2, r15, 70).
adjacent(r2, r16).
shared_edge(r2, r16, 150).
adjacent(r2, r18).
shared_edge(r2, r18, 40).
adjacent(r2, r19).
shared_edge(r2, r19, 80).
adjacent(r4, r11).
shared_edge(r4, r11, 50).
adjacent(r5, r7).
shared_edge(r5, r7, 50).
adjacent(r7, r8).
shared_edge(r7, r8, 10).
adjacent(r8, r14).
shared_edge(r8, r14, 20).
adjacent(r9, r10).
shared_edge(r9, r10, 40).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r12, r13).
shared_edge(r12, r13, 50).
adjacent(r15, r16).
shared_edge(r15, r16, 50).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r9, r10).
encloses(r2, r18).
encloses(r2, r19).
encloses(r1, r22).
encloses(r1, r23).
