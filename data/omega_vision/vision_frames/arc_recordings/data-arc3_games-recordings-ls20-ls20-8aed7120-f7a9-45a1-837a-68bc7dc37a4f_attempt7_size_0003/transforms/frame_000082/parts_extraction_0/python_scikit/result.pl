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

region(r1, '#aaaaaa', 271200, centroid(301,353)).
perimeter(r1, 5560).
polygon(r1, [xy(400,419),xy(400,410),xy(439,410),xy(440,400),xy(459,400),xy(460,390),xy(470,389),xy(470,380),xy(489,380),xy(490,370),xy(499,370),xy(500,360),xy(510,359),xy(510,350),xy(520,349),xy(520,330),xy(529,330),xy(530,320),xy(540,319),xy(540,300),xy(550,299),xy(550,260),xy(560,259),xy(560,180),xy(550,179),xy(550,140),xy(540,139),xy(540,120),xy(530,120),xy(530,110),xy(520,109),xy(520,90),xy(510,90),xy(510,80),xy(500,80),xy(500,70),xy(490,70),xy(489,60),xy(470,60),xy(470,50),xy(460,50),xy(459,40),xy(440,40),xy(439,30),xy(400,30),xy(399,20),xy(333,20),xy(320,20),xy(319,30),xy(280,30),xy(279,40),xy(260,40),xy(260,49),xy(250,50),xy(249,60),xy(230,60),xy(230,69),xy(220,70),xy(220,79),xy(210,80),xy(210,89),xy(200,90),xy(200,109),xy(190,110),xy(190,119),xy(180,120),xy(180,139),xy(170,140),xy(170,179),xy(160,180),xy(160,233),xy(160,259),xy(170,260),xy(170,299),xy(180,300),xy(180,319),xy(189,320),xy(190,330),xy(200,330),xy(200,349),xy(209,350),xy(210,359),xy(219,360),xy(220,369),xy(230,370),xy(230,380),xy(249,380),xy(250,389),xy(259,390),xy(260,400),xy(279,400),xy(280,410),xy(319,410),xy(320,420),xy(400,419)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(577,62),xy(513,34),xy(492,30),xy(471,21),xy(457,20),xy(446,15),xy(414,15),xy(399,9),xy(321,9),xy(314,10),xy(305,15),xy(273,15),xy(262,20),xy(248,21),xy(225,31),xy(220,30),xy(206,34),xy(160,53),xy(91,91),xy(86,114),xy(87,120),xy(85,122),xy(86,138),xy(80,163),xy(79,258),xy(81,284),xy(86,301),xy(86,325),xy(96,369),xy(99,377),xy(160,318),xy(100,378),xy(109,412),xy(120,439),xy(82,467),xy(29,520),xy(19,533),xy(15,543),xy(14,568),xy(17,579),xy(14,591),xy(14,608),xy(17,622),xy(32,625),xy(48,625),xy(60,622),xy(60,600),xy(39,579),xy(18,580)]).
midline(r1, [xy(87,303),xy(91,299),xy(87,300)]).
midline(r1, [xy(87,139),xy(91,140),xy(87,136)]).
midline(r1, [xy(222,32),xy(230,40),xy(231,37),xy(226,32)]).
midline(r1, [xy(92,141),xy(97,140),xy(87,128)]).
midline(r1, [xy(92,298),xy(95,298),xy(87,308)]).
midline(r1, [xy(89,306),xy(97,296),xy(106,295),xy(117,290),xy(121,291),xy(124,288),xy(123,291)]).
midline(r1, [xy(126,288),xy(129,286),xy(129,288)]).
midline(r1, [xy(61,623),xy(88,625),xy(102,622),xy(109,617),xy(110,602),xy(117,585),xy(150,546),xy(169,514),xy(168,512),xy(179,490),xy(120,440)]).
midline(r1, [xy(151,545),xy(153,542)]).
midline(r1, [xy(180,489),xy(190,493),xy(263,418)]).
midline(r1, [xy(192,493),xy(236,505),xy(259,508),xy(281,486),xy(286,469),xy(285,466),xy(291,451),xy(290,448),xy(293,445),xy(292,448)]).
midline(r1, [xy(292,452),xy(291,453)]).
midline(r1, [xy(289,461),xy(288,463)]).
midline(r1, [xy(260,509),xy(276,509),xy(293,513),xy(322,515),xy(399,515),xy(455,509),xy(438,490),xy(436,482),xy(438,480),xy(435,477),xy(431,459),xy(421,438),xy(423,438)]).
midline(r1, [xy(438,482),xy(463,507),xy(457,509)]).
midline(r1, [xy(287,466),xy(288,465)]).
midline(r1, [xy(291,456),xy(290,457)]).
midline(r1, [xy(167,518),xy(168,517)]).
midline(r1, [xy(437,477),xy(438,478)]).
midline(r1, [xy(159,471),xy(232,400),xy(160,473)]).
midline(r1, [xy(109,619),xy(124,633),xy(130,635),xy(553,634),xy(555,631),xy(555,526),xy(524,494),xy(464,508)]).
midline(r1, [xy(556,526),xy(585,556),xy(585,632),xy(575,635),xy(555,633)]).
midline(r1, [xy(117,78),xy(158,121),xy(115,79)]).
midline(r1, [xy(159,122),xy(160,121)]).
midline(r1, [xy(586,556),xy(616,586),xy(614,590),xy(614,633),xy(608,635),xy(585,633)]).
midline(r1, [xy(172,510),xy(170,512)]).
midline(r1, [xy(525,493),xy(544,458),xy(488,402),xy(544,456),xy(571,395),xy(577,375),xy(577,367),xy(582,359),xy(592,322),xy(594,288),xy(599,271),xy(600,256),xy(599,168),xy(595,152),xy(589,150),xy(585,154)]).
midline(r1, [xy(587,154),xy(589,152)]).
midline(r1, [xy(594,150),xy(594,127),xy(586,92),xy(577,72),xy(577,64)]).
midline(r1, [xy(87,125),xy(105,143),xy(103,144),xy(89,130)]).
midline(r1, [xy(101,144),xy(98,141),xy(98,143)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(101,136),xy(88,121),xy(107,140),xy(106,143),xy(113,147),xy(108,141)]).
midline(r1, [xy(114,148),xy(116,146),xy(113,143)]).
midline(r1, [xy(123,150),xy(120,147),xy(117,147),xy(117,149)]).
midline(r1, [xy(121,150),xy(120,149)]).
midline(r1, [xy(122,147),xy(126,150),xy(124,151)]).
midline(r1, [xy(127,150),xy(126,152)]).
midline(r1, [xy(129,152),xy(132,152),xy(132,154)]).
midline(r1, [xy(149,278),xy(143,283),xy(134,284),xy(131,287),xy(136,286)]).
midline(r1, [xy(233,41),xy(232,42)]).
midline(r1, [xy(152,277),xy(151,278)]).
fillpoint(r1, xy(120,440), 121.0).
fillpoint(r1, xy(179,489), 121.0).
fillpoint(r1, xy(128,446), 119.6).
fillpoint(r1, xy(171,483), 119.6).
fillpoint(r1, xy(131,448), 119.0).
fillpoint(r1, xy(167,480), 119.0).
fillpoint(r1, xy(163,477), 118.7).
fillpoint(r1, xy(138,454), 118.1).
fillpoint(r1, xy(149,464), 117.4).
fillpoint(r1, xy(150,465), 117.4).
fillpoint(r1, xy(115,428), 116.0).
fillpoint(r1, xy(524,494), 115.1).
fillpoint(r1, xy(200,496), 114.0).
fillpoint(r1, xy(519,496), 114.0).
fillpoint(r1, xy(112,420), 113.0).
fillpoint(r1, xy(111,417), 112.0).
fillpoint(r1, xy(207,498), 112.0).
fillpoint(r1, xy(512,498), 112.0).
fillpoint(r1, xy(110,414), 111.0).
fillpoint(r1, xy(211,499), 111.0).
fillpoint(r1, xy(508,499), 111.0).
fillpoint(r1, xy(109,411), 110.0).
fillpoint(r1, xy(216,500), 110.0).
fillpoint(r1, xy(503,500), 110.0).
fillpoint(r1, xy(108,408), 109.0).
fillpoint(r1, xy(221,501), 109.0).
fillpoint(r1, xy(498,501), 109.0).
fillpoint(r1, xy(107,404), 108.0).
fillpoint(r1, xy(225,502), 108.0).
fillpoint(r1, xy(494,502), 108.0).
fillpoint(r1, xy(104,392), 105.0).
fillpoint(r1, xy(237,505), 105.0).
fillpoint(r1, xy(482,505), 105.0).
fillpoint(r1, xy(242,506), 104.0).
fillpoint(r1, xy(478,506), 104.0).
fillpoint(r1, xy(248,507), 103.0).
fillpoint(r1, xy(472,507), 103.0).
fillpoint(r1, xy(254,508), 102.0).
fillpoint(r1, xy(465,508), 102.0).
fillpoint(r1, xy(263,509), 101.0).
fillpoint(r1, xy(456,509), 101.0).
fillpoint(r1, xy(99,378), 100.0).
fillpoint(r1, xy(278,510), 100.0).
fillpoint(r1, xy(441,510), 100.0).
fillpoint(r1, xy(283,511), 99.0).
fillpoint(r1, xy(436,511), 99.0).
fillpoint(r1, xy(289,512), 98.0).
fillpoint(r1, xy(431,512), 98.0).
fillpoint(r1, xy(96,368), 97.0).
fillpoint(r1, xy(295,513), 97.0).
fillpoint(r1, xy(424,513), 97.0).
fillpoint(r1, xy(95,364), 96.0).
fillpoint(r1, xy(304,514), 96.0).
fillpoint(r1, xy(415,514), 96.0).
fillpoint(r1, xy(94,360), 95.0).
fillpoint(r1, xy(321,515), 95.0).
fillpoint(r1, xy(93,355), 94.0).
fillpoint(r1, xy(92,350), 93.0).
fillpoint(r1, xy(92,91), 92.0).
fillpoint(r1, xy(90,96), 91.0).
fillpoint(r1, xy(90,343), 91.0).
fillpoint(r1, xy(89,100), 90.0).
fillpoint(r1, xy(89,339), 90.0).
fillpoint(r1, xy(88,105), 89.0).
fillpoint(r1, xy(88,334), 89.0).
fillpoint(r1, xy(87,110), 88.0).
fillpoint(r1, xy(87,329), 88.0).
fillpoint(r1, xy(86,116), 87.0).
fillpoint(r1, xy(86,323), 87.0).
fillpoint(r1, xy(553,438), 87.0).
fillpoint(r1, xy(85,125), 86.0).
fillpoint(r1, xy(85,315), 86.0).
fillpoint(r1, xy(84,141), 85.0).
fillpoint(r1, xy(84,298), 85.0).
fillpoint(r1, xy(83,146), 84.0).
fillpoint(r1, xy(83,293), 84.0).
fillpoint(r1, xy(82,151), 83.0).
fillpoint(r1, xy(82,288), 83.0).
fillpoint(r1, xy(81,157), 82.0).
fillpoint(r1, xy(81,282), 82.0).
fillpoint(r1, xy(80,166), 81.0).
fillpoint(r1, xy(80,274), 81.0).
fillpoint(r1, xy(79,220), 80.0).
fillpoint(r1, xy(575,382), 65.0).
fillpoint(r1, xy(576,63), 63.1).
fillpoint(r1, xy(577,65), 63.0).
fillpoint(r1, xy(577,374), 63.0).
fillpoint(r1, xy(578,70), 62.0).
fillpoint(r1, xy(578,369), 62.0).
fillpoint(r1, xy(582,81), 58.0).
fillpoint(r1, xy(582,358), 58.0).
fillpoint(r1, xy(586,93), 54.0).
fillpoint(r1, xy(586,346), 54.0).
fillpoint(r1, xy(587,97), 53.0).
fillpoint(r1, xy(587,342), 53.0).
fillpoint(r1, xy(588,102), 52.0).
fillpoint(r1, xy(588,338), 52.0).
fillpoint(r1, xy(589,108), 51.0).
fillpoint(r1, xy(589,332), 51.0).
fillpoint(r1, xy(590,111), 50.0).
fillpoint(r1, xy(590,328), 50.0).
fillpoint(r1, xy(592,118), 48.0).
fillpoint(r1, xy(592,321), 48.0).
fillpoint(r1, xy(593,123), 47.0).
fillpoint(r1, xy(593,316), 47.0).
fillpoint(r1, xy(594,129), 46.0).
fillpoint(r1, xy(594,310), 46.0).
fillpoint(r1, xy(183,44), 45.0).
fillpoint(r1, xy(536,44), 45.0).
fillpoint(r1, xy(594,147), 45.0).
fillpoint(r1, xy(594,293), 45.0).
fillpoint(r1, xy(596,156), 44.0).
fillpoint(r1, xy(596,283), 44.0).
fillpoint(r1, xy(598,164), 42.0).
fillpoint(r1, xy(598,275), 42.0).
fillpoint(r1, xy(599,170), 41.0).
fillpoint(r1, xy(599,269), 41.0).
fillpoint(r1, xy(599,220), 40.0).
fillpoint(r1, xy(216,31), 32.0).
fillpoint(r1, xy(503,31), 32.0).
fillpoint(r1, xy(222,30), 31.0).
fillpoint(r1, xy(498,30), 31.0).
border(r1).
region(r4, '#2ecc40', 48400, centroid(400,279)).
perimeter(r4, 2160).
polygon(r4, [xy(399,420),xy(390,419),xy(389,350),xy(340,350),xy(339,420),xy(320,420),xy(319,410),xy(290,410),xy(290,300),xy(170,300),xy(170,260),xy(160,260),xy(160,250),xy(289,250),xy(290,200),xy(339,200),xy(340,250),xy(389,250),xy(390,200),xy(439,200),xy(440,349),xy(489,350),xy(490,70),xy(499,70),xy(500,89),xy(519,90),xy(520,109),xy(529,110),xy(530,120),xy(540,120),xy(540,139),xy(550,140),xy(550,179),xy(560,180),xy(560,259),xy(550,260),xy(550,299),xy(540,300),xy(540,319),xy(530,320),xy(529,330),xy(520,330),xy(520,349),xy(510,350),xy(510,359),xy(500,360),xy(499,370),xy(490,370),xy(489,380),xy(470,380),xy(470,389),xy(460,390),xy(459,400),xy(440,400),xy(439,410),xy(400,410),xy(399,420)]).
hole(r4, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r4, [xy(263,275),xy(197,275),xy(175,256),xy(164,255)]).
midline(r4, [xy(264,274),xy(312,275),xy(314,273),xy(306,257),xy(295,243),xy(294,210),xy(295,205),xy(300,204),xy(334,205),xy(334,243),xy(324,255),xy(315,272)]).
midline(r4, [xy(500,349),xy(489,360),xy(484,360),xy(475,365),xy(463,365),xy(438,375),xy(421,374),xy(415,359),xy(414,341),xy(410,328),xy(402,314),xy(389,299),xy(340,300),xy(315,274)]).
midline(r4, [xy(390,298),xy(402,285),xy(412,266),xy(415,246),xy(415,224)]).
midline(r4, [xy(500,348),xy(505,335),xy(505,323),xy(515,299),xy(516,286),xy(520,277),xy(519,260),xy(521,245),xy(525,235),xy(524,211),xy(526,205),xy(520,189),xy(520,162),xy(515,148),xy(516,140),xy(505,116),xy(505,105),xy(495,93),xy(495,74)]).
midline(r4, [xy(517,142),xy(520,139),xy(517,139)]).
midline(r4, [xy(521,278),xy(521,276)]).
midline(r4, [xy(527,204),xy(537,198),xy(536,201)]).
midline(r4, [xy(526,234),xy(530,237),xy(532,236),xy(530,234)]).
midline(r4, [xy(421,375),xy(418,382),xy(396,404),xy(395,415)]).
midline(r4, [xy(418,384),xy(419,383)]).
midline(r4, [xy(339,301),xy(322,322),xy(316,336),xy(314,351),xy(314,385),xy(325,396),xy(330,410)]).
midline(r4, [xy(521,138),xy(522,137)]).
midline(r4, [xy(532,238),xy(533,239)]).
fillpoint(r4, xy(339,299), 50.0).
fillpoint(r4, xy(341,300), 50.0).
fillpoint(r4, xy(524,220), 35.0).
fillpoint(r4, xy(521,193), 32.0).
fillpoint(r4, xy(521,246), 32.0).
fillpoint(r4, xy(421,375), 31.4).
fillpoint(r4, xy(520,188), 31.0).
fillpoint(r4, xy(520,252), 31.0).
fillpoint(r4, xy(519,170), 30.0).
fillpoint(r4, xy(520,269), 30.0).
fillpoint(r4, xy(518,158), 29.0).
fillpoint(r4, xy(411,268), 29.0).
fillpoint(r4, xy(518,281), 29.0).
fillpoint(r4, xy(318,331), 29.0).
fillpoint(r4, xy(411,331), 29.0).
fillpoint(r4, xy(418,368), 29.0).
fillpoint(r4, xy(418,381), 29.0).
fillpoint(r4, xy(517,155), 28.0).
fillpoint(r4, xy(412,265), 28.0).
fillpoint(r4, xy(517,284), 28.0).
fillpoint(r4, xy(317,334), 28.0).
fillpoint(r4, xy(412,334), 28.0).
fillpoint(r4, xy(417,365), 28.0).
fillpoint(r4, xy(516,152), 27.0).
fillpoint(r4, xy(413,262), 27.0).
fillpoint(r4, xy(516,287), 27.0).
fillpoint(r4, xy(316,337), 27.0).
fillpoint(r4, xy(413,337), 27.0).
fillpoint(r4, xy(416,362), 27.0).
fillpoint(r4, xy(515,148), 26.0).
fillpoint(r4, xy(414,258), 26.0).
fillpoint(r4, xy(515,292), 26.0).
fillpoint(r4, xy(315,342), 26.0).
fillpoint(r4, xy(414,342), 26.0).
fillpoint(r4, xy(415,358), 26.0).
fillpoint(r4, xy(415,236), 25.0).
fillpoint(r4, xy(194,275), 25.0).
fillpoint(r4, xy(315,368), 25.0).
fillpoint(r4, xy(505,115), 16.0).
fillpoint(r4, xy(505,324), 16.0).
fillpoint(r4, xy(464,365), 16.0).
fillpoint(r4, xy(505,106), 15.0).
fillpoint(r4, xy(505,333), 15.0).
fillpoint(r4, xy(476,364), 15.0).
region(r3, '#2ecc40', 24900, centroid(308,121)).
perimeter(r3, 1160).
polygon(r3, [xy(389,200),xy(340,199),xy(340,150),xy(290,150),xy(289,100),xy(240,100),xy(239,200),xy(160,200),xy(160,180),xy(170,179),xy(170,140),xy(180,139),xy(180,120),xy(189,120),xy(190,110),xy(200,109),xy(200,90),xy(209,90),xy(210,80),xy(219,80),xy(220,70),xy(229,70),xy(230,60),xy(249,60),xy(250,50),xy(339,50),xy(340,100),xy(389,100),xy(390,50),xy(439,50),xy(440,149),xy(390,150),xy(389,200)]).
midline(r3, [xy(362,130),xy(353,126),xy(330,124),xy(319,120),xy(315,108),xy(313,86),xy(306,77),xy(288,74),xy(269,74),xy(257,79),xy(247,79),xy(234,84),xy(224,94),xy(219,107),xy(218,121),xy(208,144),xy(209,149),xy(204,165),xy(183,185),xy(169,190)]).
midline(r3, [xy(363,130),xy(364,132),xy(376,126),xy(398,124),xy(410,120),xy(414,109),xy(415,74)]).
midline(r3, [xy(365,133),xy(365,175)]).
fillpoint(r3, xy(205,164), 35.0).
fillpoint(r3, xy(208,153), 32.0).
fillpoint(r3, xy(365,131), 31.4).
fillpoint(r3, xy(209,148), 31.0).
fillpoint(r3, xy(310,79), 29.7).
fillpoint(r3, xy(319,120), 29.7).
fillpoint(r3, xy(410,120), 29.7).
fillpoint(r3, xy(308,78), 29.0).
fillpoint(r3, xy(311,81), 29.0).
fillpoint(r3, xy(318,118), 29.0).
fillpoint(r3, xy(411,118), 29.0).
fillpoint(r3, xy(321,121), 29.0).
fillpoint(r3, xy(408,121), 29.0).
fillpoint(r3, xy(358,128), 29.0).
fillpoint(r3, xy(371,128), 29.0).
fillpoint(r3, xy(211,138), 29.0).
fillpoint(r3, xy(305,77), 28.0).
fillpoint(r3, xy(312,84), 28.0).
fillpoint(r3, xy(317,115), 28.0).
fillpoint(r3, xy(412,115), 28.0).
fillpoint(r3, xy(324,122), 28.0).
fillpoint(r3, xy(405,122), 28.0).
fillpoint(r3, xy(355,127), 28.0).
fillpoint(r3, xy(374,127), 28.0).
fillpoint(r3, xy(212,135), 28.0).
fillpoint(r3, xy(302,76), 27.0).
fillpoint(r3, xy(313,87), 27.0).
fillpoint(r3, xy(316,112), 27.0).
fillpoint(r3, xy(413,112), 27.0).
fillpoint(r3, xy(327,123), 27.0).
fillpoint(r3, xy(402,123), 27.0).
fillpoint(r3, xy(352,126), 27.0).
fillpoint(r3, xy(377,126), 27.0).
fillpoint(r3, xy(298,75), 26.0).
fillpoint(r3, xy(314,92), 26.0).
fillpoint(r3, xy(315,108), 26.0).
fillpoint(r3, xy(414,108), 26.0).
fillpoint(r3, xy(332,124), 26.0).
fillpoint(r3, xy(398,124), 26.0).
fillpoint(r3, xy(348,125), 26.0).
fillpoint(r3, xy(382,125), 26.0).
fillpoint(r3, xy(269,75), 25.0).
fillpoint(r3, xy(415,86), 25.0).
fillpoint(r3, xy(365,163), 25.0).
fillpoint(r3, xy(256,79), 21.0).
fillpoint(r3, xy(219,116), 21.0).
fillpoint(r3, xy(246,80), 20.0).
fillpoint(r3, xy(220,107), 20.0).
fillpoint(r3, xy(239,83), 17.0).
fillpoint(r3, xy(223,99), 17.0).
fillpoint(r3, xy(236,84), 16.5).
fillpoint(r3, xy(224,96), 16.5).
fillpoint(r3, xy(234,85), 16.2).
fillpoint(r3, xy(225,94), 16.2).
fillpoint(r3, xy(174,189), 11.0).
region(r2, '#ffdc00', 23200, centroid(430,151)).
perimeter(r2, 1320).
polygon(r2, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,150),xy(440,149),xy(440,50),xy(390,50),xy(390,99),xy(340,100),xy(339,50),xy(260,50),xy(260,40),xy(279,40),xy(280,30),xy(319,30),xy(320,20),xy(399,20),xy(400,30),xy(439,30),xy(440,40),xy(459,40),xy(460,49),xy(470,50),xy(470,60),xy(490,60),xy(489,350)]).
midline(r2, [xy(433,42),xy(430,39),xy(400,40),xy(385,34),xy(364,45),xy(352,37),xy(334,34),xy(325,39),xy(289,39),xy(283,44),xy(264,45)]).
midline(r2, [xy(434,43),xy(450,49),xy(450,55),xy(457,72),xy(465,84),xy(464,158),xy(459,170),xy(409,170)]).
midline(r2, [xy(460,170),xy(465,190),xy(464,280),xy(469,292),xy(470,330)]).
midline(r2, [xy(365,46),xy(365,75)]).
fillpoint(r2, xy(460,170), 29.0).
fillpoint(r2, xy(462,165), 28.0).
fillpoint(r2, xy(462,174), 28.0).
fillpoint(r2, xy(463,162), 27.0).
fillpoint(r2, xy(463,177), 27.0).
fillpoint(r2, xy(464,158), 26.0).
fillpoint(r2, xy(464,182), 26.0).
fillpoint(r2, xy(365,45), 25.5).
fillpoint(r2, xy(365,63), 25.0).
fillpoint(r2, xy(465,116), 25.0).
fillpoint(r2, xy(464,236), 25.0).
fillpoint(r2, xy(469,293), 21.0).
fillpoint(r2, xy(409,170), 20.0).
fillpoint(r2, xy(469,316), 20.0).
fillpoint(r2, xy(345,35), 16.0).
fillpoint(r2, xy(384,35), 16.0).
fillpoint(r2, xy(455,65), 16.0).
fillpoint(r2, xy(333,35), 15.0).
fillpoint(r2, xy(324,39), 11.0).
fillpoint(r2, xy(395,39), 11.0).
fillpoint(r2, xy(450,54), 11.0).
fillpoint(r2, xy(289,40), 10.0).
fillpoint(r2, xy(401,40), 10.0).
region(r6, '#ffdc00', 14000, centroid(255,189)).
perimeter(r6, 660).
polygon(r6, [xy(289,250),xy(160,249),xy(160,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r6, [xy(264,206),xy(265,190),xy(271,175),xy(265,158),xy(265,124)]).
midline(r6, [xy(272,175),xy(315,175)]).
midline(r6, [xy(264,207),xy(261,219),xy(249,224),xy(184,225)]).
fillpoint(r6, xy(271,175), 31.4).
fillpoint(r6, xy(260,220), 29.7).
fillpoint(r6, xy(268,168), 29.0).
fillpoint(r6, xy(268,181), 29.0).
fillpoint(r6, xy(261,218), 29.0).
fillpoint(r6, xy(258,221), 29.0).
fillpoint(r6, xy(267,165), 28.0).
fillpoint(r6, xy(267,184), 28.0).
fillpoint(r6, xy(262,215), 28.0).
fillpoint(r6, xy(255,222), 28.0).
fillpoint(r6, xy(266,162), 27.0).
fillpoint(r6, xy(266,187), 27.0).
fillpoint(r6, xy(263,212), 27.0).
fillpoint(r6, xy(252,223), 27.0).
fillpoint(r6, xy(265,158), 26.0).
fillpoint(r6, xy(265,192), 26.0).
fillpoint(r6, xy(264,208), 26.0).
fillpoint(r6, xy(248,224), 26.0).
fillpoint(r6, xy(265,136), 25.0).
fillpoint(r6, xy(291,175), 25.0).
fillpoint(r6, xy(184,225), 25.0).
region(r12, '#ffdc00', 7300, centroid(248,339)).
perimeter(r12, 440).
polygon(r12, [xy(289,410),xy(280,410),xy(279,400),xy(260,400),xy(260,390),xy(250,390),xy(250,380),xy(240,379),xy(239,350),xy(200,349),xy(200,330),xy(190,330),xy(190,320),xy(180,319),xy(180,300),xy(290,300),xy(289,410)]).
midline(r12, [xy(274,383),xy(264,359),xy(264,341),xy(259,328),xy(239,324),xy(224,325),xy(212,317),xy(195,310),xy(189,310)]).
midline(r12, [xy(274,384),xy(283,394),xy(285,405)]).
fillpoint(r12, xy(260,329), 29.7).
fillpoint(r12, xy(258,328), 29.0).
fillpoint(r12, xy(261,331), 29.0).
fillpoint(r12, xy(255,327), 28.0).
fillpoint(r12, xy(262,334), 28.0).
fillpoint(r12, xy(252,326), 27.0).
fillpoint(r12, xy(263,337), 27.0).
fillpoint(r12, xy(248,325), 26.0).
fillpoint(r12, xy(264,342), 26.0).
fillpoint(r12, xy(224,325), 25.0).
fillpoint(r12, xy(264,356), 25.0).
fillpoint(r12, xy(205,315), 16.0).
fillpoint(r12, xy(274,384), 16.0).
fillpoint(r12, xy(194,310), 11.0).
region(r20, '#5a5a5a', 6800, centroid(380,620)).
perimeter(r20, 720).
polygon(r20, [xy(549,630),xy(210,630),xy(210,610),xy(549,610),xy(549,630)]).
midline(r20, [xy(425,620),xy(219,620)]).
midline(r20, [xy(426,620),xy(540,620)]).
fillpoint(r20, xy(219,620), 10.0).
region(r16, '#ffdc00', 3000, centroid(364,390)).
perimeter(r16, 220).
polygon(r16, [xy(389,420),xy(340,419),xy(340,360),xy(390,360),xy(389,420)]).
midline(r16, [xy(364,388),xy(365,395)]).
midline(r16, [xy(365,387),xy(365,384)]).
fillpoint(r16, xy(364,390), 25.0).
region(r17, '#7fdbff', 2000, centroid(64,576)).
perimeter(r17, 240).
polygon(r17, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r17, [xy(51,560),xy(39,560)]).
midline(r17, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r17, xy(58,561), 12.0).
fillpoint(r17, xy(61,578), 12.0).
fillpoint(r17, xy(78,581), 12.0).
fillpoint(r17, xy(54,560), 11.0).
fillpoint(r17, xy(59,565), 11.0).
fillpoint(r17, xy(60,574), 11.0).
fillpoint(r17, xy(65,579), 11.0).
fillpoint(r17, xy(74,580), 11.0).
fillpoint(r17, xy(79,585), 11.0).
fillpoint(r17, xy(39,560), 10.0).
fillpoint(r17, xy(79,596), 10.0).
region(r19, '#2ecc40', 1600, centroid(170,620)).
perimeter(r19, 200).
polygon(r19, [xy(209,630),xy(130,630),xy(130,610),xy(209,610),xy(209,630)]).
midline(r19, [xy(151,620),xy(139,620)]).
midline(r19, [xy(152,620),xy(200,620)]).
fillpoint(r19, xy(139,620), 10.0).
region(r11, '#870c25', 1500, centroid(364,234)).
perimeter(r11, 160).
polygon(r11, [xy(389,250),xy(340,250),xy(340,220),xy(389,220),xy(389,250)]).
midline(r11, [xy(360,235),xy(354,235)]).
midline(r11, [xy(361,235),xy(375,235)]).
fillpoint(r11, xy(354,235), 15.0).
region(r8, '#bebebe', 1000, centroid(364,210)).
perimeter(r8, 140).
polygon(r8, [xy(389,220),xy(340,220),xy(340,200),xy(389,200),xy(389,220)]).
midline(r8, [xy(359,210),xy(349,210)]).
midline(r8, [xy(360,209),xy(380,210)]).
fillpoint(r8, xy(349,210), 10.0).
region(r9, '#5a5a5a', 800, centroid(314,224)).
perimeter(r9, 160).
polygon(r9, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r9, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r9, [xy(319,214),xy(305,215),xy(305,234),xy(319,235),xy(324,233),xy(324,216),xy(320,215)]).
fillpoint(r9, xy(306,215), 6.0).
fillpoint(r9, xy(324,215), 6.0).
fillpoint(r9, xy(305,234), 6.0).
fillpoint(r9, xy(323,234), 6.0).
fillpoint(r9, xy(311,215), 5.0).
fillpoint(r9, xy(304,225), 5.0).
fillpoint(r9, xy(324,225), 5.0).
fillpoint(r9, xy(311,235), 5.0).
region(r14, '#2ecc40', 600, centroid(228,361)).
perimeter(r14, 120).
polygon(r14, [xy(239,380),xy(230,380),xy(230,370),xy(220,370),xy(220,360),xy(210,359),xy(210,350),xy(240,350),xy(239,380)]).
midline(r14, [xy(230,359),xy(223,355),xy(214,355)]).
midline(r14, [xy(230,361),xy(234,366),xy(235,375)]).
fillpoint(r14, xy(229,360), 10.0).
fillpoint(r14, xy(214,355), 5.0).
fillpoint(r14, xy(235,373), 5.0).
region(r7, '#0074d9', 500, centroid(414,194)).
perimeter(r7, 120).
polygon(r7, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r7, [xy(409,194),xy(394,195)]).
midline(r7, [xy(410,194),xy(435,195)]).
fillpoint(r7, xy(394,195), 5.0).
region(r13, '#0074d9', 500, centroid(444,324)).
perimeter(r13, 120).
polygon(r13, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r13, [xy(445,311),xy(445,304)]).
midline(r13, [xy(445,312),xy(445,345)]).
fillpoint(r13, xy(444,325), 5.0).
region(r15, '#0074d9', 500, centroid(364,354)).
perimeter(r15, 120).
polygon(r15, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r15, [xy(359,354),xy(344,355)]).
midline(r15, [xy(360,355),xy(385,355)]).
fillpoint(r15, xy(344,355), 5.0).
region(r18, '#7fdbff', 400, centroid(40,600)).
perimeter(r18, 80).
polygon(r18, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r18, [xy(39,599),xy(40,600)]).
fillpoint(r18, xy(39,600), 10.0).
region(r21, '#7fdbff', 400, centroid(570,620)).
perimeter(r21, 80).
polygon(r21, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r21, [xy(569,619),xy(570,620)]).
fillpoint(r21, xy(569,620), 10.0).
region(r22, '#7fdbff', 400, centroid(600,620)).
perimeter(r22, 80).
polygon(r22, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r22, [xy(599,619),xy(600,620)]).
fillpoint(r22, xy(599,620), 10.0).
region(r23, '#2ecc40', 400, centroid(630,620)).
perimeter(r23, 80).
polygon(r23, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r23, [xy(629,619),xy(630,620)]).
fillpoint(r23, xy(629,620), 10.0).
border(r23).
region(r10, '#2ecc40', 100, centroid(314,224)).
perimeter(r10, 40).
polygon(r10, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r10, [xy(315,225),xy(315,224)]).
fillpoint(r10, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 310).
adjacent(r1, r3).
shared_edge(r1, r3, 250).
adjacent(r1, r4).
shared_edge(r1, r4, 700).
adjacent(r1, r6).
shared_edge(r1, r6, 50).
adjacent(r1, r12).
shared_edge(r1, r12, 160).
adjacent(r1, r14).
shared_edge(r1, r14, 60).
adjacent(r1, r16).
shared_edge(r1, r16, 50).
adjacent(r1, r17).
shared_edge(r1, r17, 240).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 180).
adjacent(r1, r20).
shared_edge(r1, r20, 700).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 470).
adjacent(r2, r4).
shared_edge(r2, r4, 420).
adjacent(r2, r7).
shared_edge(r2, r7, 60).
adjacent(r2, r13).
shared_edge(r2, r13, 60).
adjacent(r3, r6).
shared_edge(r3, r6, 380).
adjacent(r3, r7).
shared_edge(r3, r7, 10).
adjacent(r3, r8).
shared_edge(r3, r8, 50).
adjacent(r4, r6).
shared_edge(r4, r6, 230).
adjacent(r4, r7).
shared_edge(r4, r7, 50).
adjacent(r4, r8).
shared_edge(r4, r8, 40).
adjacent(r4, r9).
shared_edge(r4, r9, 120).
adjacent(r4, r11).
shared_edge(r4, r11, 110).
adjacent(r4, r12).
shared_edge(r4, r12, 220).
adjacent(r4, r13).
shared_edge(r4, r13, 60).
adjacent(r4, r15).
shared_edge(r4, r15, 70).
adjacent(r4, r16).
shared_edge(r4, r16, 120).
adjacent(r8, r11).
shared_edge(r8, r11, 50).
adjacent(r9, r10).
shared_edge(r9, r10, 40).
adjacent(r12, r14).
shared_edge(r12, r14, 60).
adjacent(r15, r16).
shared_edge(r15, r16, 50).
adjacent(r19, r20).
shared_edge(r19, r20, 20).

encloses(r9, r10).
encloses(r1, r17).
encloses(r1, r18).
encloses(r1, r21).
encloses(r1, r22).
