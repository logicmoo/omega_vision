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
midline(r1, [xy(577,62),xy(513,34),xy(499,30),xy(495,31),xy(471,21),xy(457,20),xy(446,15),xy(414,15),xy(399,9),xy(321,9),xy(314,10),xy(305,15),xy(273,15),xy(262,20),xy(248,21),xy(224,31),xy(220,30),xy(206,34),xy(160,53),xy(91,91),xy(85,122),xy(86,137),xy(80,163),xy(80,276),xy(86,302),xy(86,325),xy(94,361),xy(108,409),xy(120,439),xy(85,464),xy(23,527),xy(15,543),xy(14,569),xy(17,580),xy(14,591),xy(14,609),xy(17,622),xy(30,625),xy(49,625),xy(60,622),xy(60,600),xy(40,580),xy(18,579)]).
midline(r1, [xy(148,61),xy(179,91),xy(150,60)]).
midline(r1, [xy(87,308),xy(94,299),xy(90,298),xy(87,301)]).
midline(r1, [xy(89,306),xy(97,298)]).
midline(r1, [xy(61,623),xy(89,625),xy(102,622),xy(109,617),xy(110,602),xy(114,590),xy(152,542),xy(166,519),xy(179,490),xy(120,440)]).
midline(r1, [xy(180,489),xy(206,498),xy(248,507),xy(287,467),xy(286,465),xy(289,462),xy(293,447),xy(299,436),xy(298,434),xy(300,434)]).
midline(r1, [xy(99,296),xy(103,295),xy(104,297),xy(87,314)]).
midline(r1, [xy(104,294),xy(108,297),xy(108,293),xy(114,292),xy(115,294),xy(110,296)]).
midline(r1, [xy(116,294),xy(115,291)]).
midline(r1, [xy(87,135),xy(92,140),xy(90,141),xy(87,138)]).
midline(r1, [xy(250,507),xy(255,508),xy(282,481),xy(282,475),xy(286,470)]).
midline(r1, [xy(257,508),xy(283,482)]).
midline(r1, [xy(285,474),xy(283,478)]).
midline(r1, [xy(109,619),xy(124,633),xy(131,635),xy(553,634),xy(555,632),xy(555,525),xy(524,494),xy(472,507),xy(432,467),xy(430,456),xy(424,445),xy(426,445)]).
midline(r1, [xy(556,526),xy(585,556),xy(585,632),xy(576,635),xy(555,633)]).
midline(r1, [xy(470,507),xy(436,476),xy(435,472)]).
midline(r1, [xy(468,507),xy(464,508),xy(437,481),xy(438,489),xy(457,506),xy(456,509),xy(397,515),xy(320,515),xy(259,508)]).
midline(r1, [xy(462,508),xy(458,507)]).
midline(r1, [xy(437,477),xy(435,477)]).
midline(r1, [xy(437,479),xy(437,480)]).
midline(r1, [xy(586,556),xy(615,585),xy(615,632),xy(608,635),xy(585,633)]).
midline(r1, [xy(525,493),xy(544,458),xy(488,402),xy(544,456),xy(546,454),xy(575,382),xy(541,348),xy(538,346),xy(538,348)]).
midline(r1, [xy(575,380),xy(577,367),xy(582,359),xy(586,344),xy(561,319),xy(587,341),xy(594,312),xy(595,291),xy(587,285),xy(567,277),xy(571,281),xy(576,282),xy(577,285),xy(580,284),xy(582,286)]).
midline(r1, [xy(93,141),xy(101,144),xy(109,142),xy(109,146),xy(111,144),xy(113,147),xy(113,145)]).
midline(r1, [xy(577,64),xy(577,72),xy(583,83),xy(592,117),xy(595,149),xy(585,152),xy(576,159),xy(570,160),xy(570,162)]).
midline(r1, [xy(595,151),xy(600,182),xy(600,259),xy(594,289)]).
midline(r1, [xy(584,155),xy(585,154)]).
midline(r1, [xy(587,154),xy(591,152)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(115,147),xy(117,146),xy(118,149),xy(121,146),xy(121,150),xy(123,148),xy(125,151),xy(125,149)]).
midline(r1, [xy(126,152),xy(147,159),xy(147,161)]).
midline(r1, [xy(181,91),xy(182,92)]).
midline(r1, [xy(118,290),xy(118,292),xy(119,290)]).
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
region(r6, '#2ecc40', 48300, centroid(399,279)).
perimeter(r6, 2180).
polygon(r6, [xy(399,420),xy(390,419),xy(389,350),xy(340,350),xy(339,420),xy(320,420),xy(319,410),xy(290,410),xy(290,300),xy(170,300),xy(170,260),xy(160,260),xy(160,250),xy(289,250),xy(290,200),xy(339,200),xy(340,250),xy(389,250),xy(390,200),xy(439,200),xy(440,349),xy(489,350),xy(490,70),xy(499,70),xy(500,89),xy(519,90),xy(520,109),xy(529,110),xy(530,120),xy(540,120),xy(540,139),xy(550,140),xy(550,179),xy(560,180),xy(560,219),xy(550,220),xy(550,229),xy(560,230),xy(560,259),xy(550,260),xy(550,299),xy(540,300),xy(540,319),xy(530,320),xy(529,330),xy(520,330),xy(520,349),xy(510,350),xy(510,359),xy(500,360),xy(499,370),xy(490,370),xy(489,380),xy(470,380),xy(470,389),xy(460,390),xy(459,400),xy(440,400),xy(439,410),xy(400,410),xy(399,420)]).
hole(r6, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r6, [xy(534,244),xy(524,245),xy(520,239),xy(520,210),xy(524,200),xy(520,189),xy(520,162),xy(516,153),xy(515,139),xy(505,116),xy(505,105),xy(495,93),xy(495,74)]).
midline(r6, [xy(521,245),xy(520,277),xy(515,290),xy(515,299),xy(505,323),xy(505,335),xy(500,344),xy(500,349),xy(489,360),xy(484,360),xy(475,365),xy(463,365),xy(440,375),xy(420,373),xy(416,363),xy(414,340),xy(410,328),xy(402,314),xy(388,299),xy(340,300),xy(312,274),xy(197,275),xy(175,256),xy(164,255)]).
midline(r6, [xy(315,274),xy(294,239),xy(295,205),xy(334,205),xy(334,243),xy(321,258),xy(322,260),xy(315,271)]).
midline(r6, [xy(535,245),xy(545,245)]).
midline(r6, [xy(421,375),xy(418,381),xy(396,404),xy(395,415)]).
midline(r6, [xy(339,301),xy(323,320),xy(316,336),xy(314,350),xy(314,385),xy(325,396),xy(330,410)]).
midline(r6, [xy(389,299),xy(402,285),xy(412,266),xy(415,248),xy(415,224)]).
midline(r6, [xy(525,200),xy(538,199),xy(537,201)]).
midline(r6, [xy(540,201),xy(539,202)]).
fillpoint(r6, xy(339,299), 50.0).
fillpoint(r6, xy(341,300), 50.0).
fillpoint(r6, xy(523,200), 33.6).
fillpoint(r6, xy(521,193), 32.0).
fillpoint(r6, xy(521,206), 32.0).
fillpoint(r6, xy(521,245), 32.0).
fillpoint(r6, xy(421,375), 31.4).
fillpoint(r6, xy(520,188), 31.0).
fillpoint(r6, xy(520,212), 31.0).
fillpoint(r6, xy(520,238), 31.0).
fillpoint(r6, xy(520,252), 31.0).
fillpoint(r6, xy(519,170), 30.0).
fillpoint(r6, xy(519,225), 30.0).
fillpoint(r6, xy(520,269), 30.0).
fillpoint(r6, xy(518,158), 29.0).
fillpoint(r6, xy(411,268), 29.0).
fillpoint(r6, xy(518,281), 29.0).
fillpoint(r6, xy(318,331), 29.0).
fillpoint(r6, xy(411,331), 29.0).
fillpoint(r6, xy(418,368), 29.0).
fillpoint(r6, xy(418,381), 29.0).
fillpoint(r6, xy(517,155), 28.0).
fillpoint(r6, xy(412,265), 28.0).
fillpoint(r6, xy(517,284), 28.0).
fillpoint(r6, xy(317,334), 28.0).
fillpoint(r6, xy(412,334), 28.0).
fillpoint(r6, xy(417,365), 28.0).
fillpoint(r6, xy(516,152), 27.0).
fillpoint(r6, xy(413,262), 27.0).
fillpoint(r6, xy(516,287), 27.0).
fillpoint(r6, xy(316,337), 27.0).
fillpoint(r6, xy(413,337), 27.0).
fillpoint(r6, xy(416,362), 27.0).
fillpoint(r6, xy(515,148), 26.0).
fillpoint(r6, xy(414,258), 26.0).
fillpoint(r6, xy(515,292), 26.0).
fillpoint(r6, xy(315,342), 26.0).
fillpoint(r6, xy(414,342), 26.0).
fillpoint(r6, xy(415,358), 26.0).
fillpoint(r6, xy(415,236), 25.0).
fillpoint(r6, xy(194,275), 25.0).
fillpoint(r6, xy(315,368), 25.0).
fillpoint(r6, xy(505,115), 16.0).
fillpoint(r6, xy(505,324), 16.0).
fillpoint(r6, xy(464,365), 16.0).
fillpoint(r6, xy(505,106), 15.0).
fillpoint(r6, xy(505,333), 15.0).
fillpoint(r6, xy(476,364), 15.0).
region(r3, '#2ecc40', 24000, centroid(304,123)).
perimeter(r3, 1280).
polygon(r3, [xy(389,200),xy(340,199),xy(340,150),xy(290,150),xy(289,100),xy(240,100),xy(239,200),xy(160,200),xy(160,180),xy(170,179),xy(170,140),xy(180,139),xy(180,120),xy(189,120),xy(190,110),xy(200,109),xy(200,90),xy(209,90),xy(210,80),xy(219,80),xy(220,70),xy(229,70),xy(230,60),xy(249,60),xy(250,50),xy(339,50),xy(340,100),xy(389,100),xy(390,50),xy(439,50),xy(440,149),xy(390,150),xy(389,200)]).
hole(r3, [xy(430,89),xy(429,60),xy(400,60),xy(400,90),xy(430,89)]).
midline(r3, [xy(362,130),xy(349,125),xy(330,124),xy(320,121),xy(315,109),xy(314,90),xy(310,79),xy(299,75),xy(277,75),xy(269,71),xy(269,74),xy(264,77),xy(247,79),xy(234,84),xy(224,94),xy(219,107),xy(218,121),xy(209,143),xy(202,138),xy(200,139),xy(208,147),xy(209,145)]).
midline(r3, [xy(209,148),xy(205,163),xy(200,162),xy(200,164)]).
midline(r3, [xy(205,165),xy(183,185),xy(169,190)]).
midline(r3, [xy(363,130),xy(365,131),xy(365,175)]).
midline(r3, [xy(366,130),xy(381,125),xy(399,124),xy(411,119),xy(408,109),xy(395,93),xy(395,55),xy(434,55),xy(434,93),xy(413,116),xy(409,110)]).
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
fillpoint(r3, xy(324,122), 28.0).
fillpoint(r3, xy(405,122), 28.0).
fillpoint(r3, xy(355,127), 28.0).
fillpoint(r3, xy(374,127), 28.0).
fillpoint(r3, xy(212,135), 28.0).
fillpoint(r3, xy(302,76), 27.0).
fillpoint(r3, xy(313,87), 27.0).
fillpoint(r3, xy(316,112), 27.0).
fillpoint(r3, xy(327,123), 27.0).
fillpoint(r3, xy(402,123), 27.0).
fillpoint(r3, xy(352,126), 27.0).
fillpoint(r3, xy(377,126), 27.0).
fillpoint(r3, xy(298,75), 26.0).
fillpoint(r3, xy(314,92), 26.0).
fillpoint(r3, xy(315,108), 26.0).
fillpoint(r3, xy(332,124), 26.0).
fillpoint(r3, xy(398,124), 26.0).
fillpoint(r3, xy(348,125), 26.0).
fillpoint(r3, xy(382,125), 26.0).
fillpoint(r3, xy(269,75), 25.0).
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
midline(r2, [xy(465,236),xy(465,276),xy(460,280),xy(462,280)]).
midline(r2, [xy(465,235),xy(465,191),xy(461,171),xy(458,169),xy(409,170)]).
midline(r2, [xy(464,279),xy(470,300),xy(470,330)]).
midline(r2, [xy(461,169),xy(465,149),xy(465,84),xy(457,72),xy(450,55),xy(450,50),xy(445,46),xy(436,44),xy(430,39),xy(402,40),xy(394,39),xy(385,34),xy(365,45),xy(352,37),xy(338,34),xy(319,40),xy(289,39),xy(279,45),xy(264,45)]).
midline(r2, [xy(364,46),xy(365,75)]).
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
region(r8, '#ffdc00', 14000, centroid(255,189)).
perimeter(r8, 660).
polygon(r8, [xy(289,250),xy(160,249),xy(160,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r8, [xy(264,142),xy(265,124)]).
midline(r8, [xy(264,143),xy(265,159),xy(271,175),xy(265,190),xy(264,209),xy(261,218),xy(256,222),xy(248,224),xy(184,225)]).
midline(r8, [xy(272,174),xy(315,175)]).
fillpoint(r8, xy(271,175), 31.4).
fillpoint(r8, xy(260,220), 29.7).
fillpoint(r8, xy(268,168), 29.0).
fillpoint(r8, xy(268,181), 29.0).
fillpoint(r8, xy(261,218), 29.0).
fillpoint(r8, xy(258,221), 29.0).
fillpoint(r8, xy(267,165), 28.0).
fillpoint(r8, xy(267,184), 28.0).
fillpoint(r8, xy(262,215), 28.0).
fillpoint(r8, xy(255,222), 28.0).
fillpoint(r8, xy(266,162), 27.0).
fillpoint(r8, xy(266,187), 27.0).
fillpoint(r8, xy(263,212), 27.0).
fillpoint(r8, xy(252,223), 27.0).
fillpoint(r8, xy(265,158), 26.0).
fillpoint(r8, xy(265,192), 26.0).
fillpoint(r8, xy(264,208), 26.0).
fillpoint(r8, xy(248,224), 26.0).
fillpoint(r8, xy(265,136), 25.0).
fillpoint(r8, xy(291,175), 25.0).
fillpoint(r8, xy(184,225), 25.0).
region(r15, '#ffdc00', 7300, centroid(248,339)).
perimeter(r15, 440).
polygon(r15, [xy(289,410),xy(280,410),xy(279,400),xy(260,400),xy(260,390),xy(250,390),xy(250,380),xy(240,379),xy(239,350),xy(200,349),xy(200,330),xy(190,330),xy(190,320),xy(180,319),xy(180,300),xy(290,300),xy(289,410)]).
midline(r15, [xy(274,383),xy(263,360),xy(265,357),xy(264,341),xy(259,328),xy(239,324),xy(224,325),xy(212,317),xy(195,310),xy(189,310)]).
midline(r15, [xy(283,395),xy(274,385)]).
midline(r15, [xy(284,396),xy(285,405)]).
fillpoint(r15, xy(260,329), 29.7).
fillpoint(r15, xy(258,328), 29.0).
fillpoint(r15, xy(261,331), 29.0).
fillpoint(r15, xy(255,327), 28.0).
fillpoint(r15, xy(262,334), 28.0).
fillpoint(r15, xy(252,326), 27.0).
fillpoint(r15, xy(263,337), 27.0).
fillpoint(r15, xy(248,325), 26.0).
fillpoint(r15, xy(264,342), 26.0).
fillpoint(r15, xy(224,325), 25.0).
fillpoint(r15, xy(264,356), 25.0).
fillpoint(r15, xy(205,315), 16.0).
fillpoint(r15, xy(274,384), 16.0).
fillpoint(r15, xy(194,310), 11.0).
region(r22, '#2ecc40', 6000, centroid(280,620)).
perimeter(r22, 640).
polygon(r22, [xy(429,630),xy(130,630),xy(130,610),xy(429,610),xy(429,630)]).
midline(r22, [xy(356,620),xy(139,620)]).
midline(r22, [xy(357,619),xy(420,620)]).
fillpoint(r22, xy(139,620), 10.0).
region(r19, '#ffdc00', 3000, centroid(364,390)).
perimeter(r19, 220).
polygon(r19, [xy(389,420),xy(340,419),xy(340,360),xy(390,360),xy(389,420)]).
midline(r19, [xy(364,394),xy(365,384)]).
midline(r19, [xy(365,395),xy(364,395)]).
fillpoint(r19, xy(364,390), 25.0).
region(r23, '#5a5a5a', 2400, centroid(490,620)).
perimeter(r23, 280).
polygon(r23, [xy(549,630),xy(430,630),xy(430,610),xy(549,610),xy(549,630)]).
midline(r23, [xy(451,620),xy(439,620)]).
midline(r23, [xy(452,620),xy(540,620)]).
fillpoint(r23, xy(439,620), 10.0).
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
region(r13, '#870c25', 1500, centroid(364,234)).
perimeter(r13, 160).
polygon(r13, [xy(389,250),xy(340,250),xy(340,220),xy(389,220),xy(389,250)]).
midline(r13, [xy(362,235),xy(354,235)]).
midline(r13, [xy(363,234),xy(375,235)]).
fillpoint(r13, xy(354,235), 15.0).
region(r10, '#bebebe', 1000, centroid(364,210)).
perimeter(r10, 140).
polygon(r10, [xy(389,220),xy(340,220),xy(340,200),xy(389,200),xy(389,220)]).
midline(r10, [xy(359,210),xy(349,210)]).
midline(r10, [xy(360,209),xy(380,210)]).
fillpoint(r10, xy(349,210), 10.0).
region(r4, '#5a5a5a', 800, centroid(414,74)).
perimeter(r4, 160).
polygon(r4, [xy(429,90),xy(400,89),xy(400,60),xy(430,60),xy(429,90)]).
hole(r4, [xy(420,79),xy(419,70),xy(410,70),xy(410,80),xy(420,79)]).
midline(r4, [xy(419,64),xy(405,65),xy(405,84),xy(419,85),xy(424,83),xy(424,66),xy(420,65)]).
fillpoint(r4, xy(406,65), 6.0).
fillpoint(r4, xy(424,65), 6.0).
fillpoint(r4, xy(405,84), 6.0).
fillpoint(r4, xy(423,84), 6.0).
fillpoint(r4, xy(411,65), 5.0).
fillpoint(r4, xy(404,75), 5.0).
fillpoint(r4, xy(424,75), 5.0).
fillpoint(r4, xy(411,85), 5.0).
region(r11, '#5a5a5a', 800, centroid(314,224)).
perimeter(r11, 160).
polygon(r11, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r11, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r11, [xy(319,214),xy(305,215),xy(305,234),xy(318,235),xy(324,233),xy(325,220),xy(324,216),xy(320,215)]).
fillpoint(r11, xy(306,215), 6.0).
fillpoint(r11, xy(324,215), 6.0).
fillpoint(r11, xy(305,234), 6.0).
fillpoint(r11, xy(323,234), 6.0).
fillpoint(r11, xy(311,215), 5.0).
fillpoint(r11, xy(304,225), 5.0).
fillpoint(r11, xy(324,225), 5.0).
fillpoint(r11, xy(311,235), 5.0).
region(r17, '#2ecc40', 600, centroid(228,361)).
perimeter(r17, 120).
polygon(r17, [xy(239,380),xy(230,380),xy(230,370),xy(220,370),xy(220,360),xy(210,359),xy(210,350),xy(240,350),xy(239,380)]).
midline(r17, [xy(230,359),xy(223,355),xy(214,355)]).
midline(r17, [xy(230,361),xy(234,366),xy(235,375)]).
fillpoint(r17, xy(229,360), 10.0).
fillpoint(r17, xy(214,355), 5.0).
fillpoint(r17, xy(235,373), 5.0).
region(r9, '#0074d9', 500, centroid(414,194)).
perimeter(r9, 120).
polygon(r9, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r9, [xy(411,194),xy(394,195)]).
midline(r9, [xy(412,194),xy(435,195)]).
fillpoint(r9, xy(394,195), 5.0).
region(r16, '#0074d9', 500, centroid(444,324)).
perimeter(r16, 120).
polygon(r16, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r16, [xy(445,317),xy(445,345)]).
midline(r16, [xy(445,316),xy(445,304)]).
fillpoint(r16, xy(444,325), 5.0).
region(r18, '#0074d9', 500, centroid(364,354)).
perimeter(r18, 120).
polygon(r18, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r18, [xy(370,354),xy(344,355)]).
midline(r18, [xy(371,354),xy(385,355)]).
fillpoint(r18, xy(344,355), 5.0).
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
region(r5, '#2ecc40', 100, centroid(414,74)).
perimeter(r5, 40).
polygon(r5, [xy(419,80),xy(410,79),xy(410,70),xy(420,70),xy(419,80)]).
midline(r5, [xy(415,75),xy(415,74)]).
fillpoint(r5, xy(414,75), 5.0).
region(r12, '#2ecc40', 100, centroid(314,224)).
perimeter(r12, 40).
polygon(r12, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r12, [xy(315,225),xy(315,224)]).
fillpoint(r12, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 310).
adjacent(r1, r3).
shared_edge(r1, r3, 250).
adjacent(r1, r6).
shared_edge(r1, r6, 690).
adjacent(r1, r8).
shared_edge(r1, r8, 50).
adjacent(r1, r15).
shared_edge(r1, r15, 160).
adjacent(r1, r17).
shared_edge(r1, r17, 60).
adjacent(r1, r19).
shared_edge(r1, r19, 50).
adjacent(r1, r20).
shared_edge(r1, r20, 240).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 620).
adjacent(r1, r23).
shared_edge(r1, r23, 260).
adjacent(r1, r24).
shared_edge(r1, r24, 80).
adjacent(r1, r25).
shared_edge(r1, r25, 80).
adjacent(r1, r26).
shared_edge(r1, r26, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 470).
adjacent(r2, r6).
shared_edge(r2, r6, 420).
adjacent(r2, r9).
shared_edge(r2, r9, 60).
adjacent(r2, r16).
shared_edge(r2, r16, 60).
adjacent(r3, r4).
shared_edge(r3, r4, 120).
adjacent(r3, r8).
shared_edge(r3, r8, 380).
adjacent(r3, r9).
shared_edge(r3, r9, 10).
adjacent(r3, r10).
shared_edge(r3, r10, 50).
adjacent(r4, r5).
shared_edge(r4, r5, 40).
adjacent(r6, r8).
shared_edge(r6, r8, 230).
adjacent(r6, r9).
shared_edge(r6, r9, 50).
adjacent(r6, r10).
shared_edge(r6, r10, 40).
adjacent(r6, r11).
shared_edge(r6, r11, 120).
adjacent(r6, r13).
shared_edge(r6, r13, 110).
adjacent(r6, r15).
shared_edge(r6, r15, 220).
adjacent(r6, r16).
shared_edge(r6, r16, 60).
adjacent(r6, r18).
shared_edge(r6, r18, 70).
adjacent(r6, r19).
shared_edge(r6, r19, 120).
adjacent(r10, r13).
shared_edge(r10, r13, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 40).
adjacent(r15, r17).
shared_edge(r15, r17, 60).
adjacent(r18, r19).
shared_edge(r18, r19, 50).
adjacent(r22, r23).
shared_edge(r22, r23, 20).

encloses(r4, r5).
encloses(r11, r12).
encloses(r1, r20).
encloses(r1, r21).
encloses(r1, r24).
encloses(r1, r25).
