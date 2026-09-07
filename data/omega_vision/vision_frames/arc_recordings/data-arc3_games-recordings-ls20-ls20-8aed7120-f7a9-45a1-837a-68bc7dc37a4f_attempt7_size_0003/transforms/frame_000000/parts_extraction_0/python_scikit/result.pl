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

region(r1, '#aaaaaa', 282400, centroid(361,369)).
perimeter(r1, 4680).
polygon(r1, [xy(100,0),xy(99,10),xy(80,10),xy(80,19),xy(70,20),xy(70,29),xy(60,30),xy(60,39),xy(50,40),xy(50,59),xy(40,60),xy(40,279),xy(50,280),xy(50,299),xy(59,300),xy(60,309),xy(69,310),xy(70,320),xy(80,320),xy(80,330),xy(99,330),xy(100,339),xy(109,340),xy(110,350),xy(129,350),xy(130,360),xy(169,360),xy(170,370),xy(249,370),xy(250,360),xy(289,360),xy(290,350),xy(309,350),xy(310,340),xy(319,340),xy(320,330),xy(339,330),xy(340,320),xy(349,320),xy(350,310),xy(359,310),xy(360,300),xy(370,299),xy(370,280),xy(379,280),xy(380,270),xy(390,269),xy(390,250),xy(400,249),xy(400,210),xy(410,209),xy(410,130),xy(400,129),xy(400,90),xy(390,89),xy(390,70),xy(380,70),xy(379,60),xy(370,59),xy(370,40),xy(360,40),xy(360,30),xy(350,30),xy(350,20),xy(340,20),xy(339,10),xy(320,10),xy(320,0)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(475,77),xy(459,64),xy(428,45),xy(404,35),xy(389,24),xy(355,10),xy(349,10),xy(343,5),xy(324,5)]).
midline(r1, [xy(476,77),xy(478,80),xy(464,94),xy(457,92),xy(448,99),xy(442,99),xy(438,103),xy(420,110),xy(420,112)]).
midline(r1, [xy(435,105),xy(434,105)]).
midline(r1, [xy(465,95),xy(479,80)]).
midline(r1, [xy(463,95),xy(450,99)]).
midline(r1, [xy(457,94),xy(456,95)]).
midline(r1, [xy(440,103),xy(445,101)]).
midline(r1, [xy(470,93),xy(481,82),xy(482,84),xy(474,91)]).
midline(r1, [xy(483,84),xy(485,86),xy(476,92)]).
midline(r1, [xy(486,87),xy(524,115),xy(525,209),xy(517,284),xy(479,248),xy(468,248),xy(464,244),xy(456,243),xy(440,236),xy(438,237),xy(440,238)]).
midline(r1, [xy(517,286),xy(515,287),xy(478,250)]).
midline(r1, [xy(464,246),xy(461,245)]).
midline(r1, [xy(516,288),xy(508,328),xy(494,376),xy(470,439),xy(442,451),xy(381,470),xy(342,479),xy(284,423),xy(283,414),xy(279,408),xy(280,405),xy(268,382),xy(270,382)]).
midline(r1, [xy(282,411),xy(281,406)]).
midline(r1, [xy(277,397),xy(282,402),xy(281,404)]).
midline(r1, [xy(284,425),xy(339,478),xy(338,480),xy(287,430),xy(288,440),xy(328,480),xy(327,482),xy(248,490),xy(172,490),xy(126,486),xy(90,441),xy(71,410),xy(61,387),xy(49,369),xy(28,319),xy(19,279),xy(20,52),xy(25,39),xy(26,26),xy(64,10),xy(70,10),xy(76,5),xy(95,5)]).
midline(r1, [xy(124,486),xy(109,502),xy(90,528),xy(70,569),xy(91,601),xy(126,634),xy(553,634),xy(555,630),xy(554,529),xy(556,526),xy(470,440)]).
midline(r1, [xy(329,481),xy(333,480),xy(289,436)]).
midline(r1, [xy(284,417),xy(286,422)]).
midline(r1, [xy(334,480),xy(335,480)]).
midline(r1, [xy(555,633),xy(560,635),xy(579,635),xy(585,631),xy(584,558),xy(586,556),xy(557,527)]).
midline(r1, [xy(587,557),xy(616,586),xy(614,592),xy(615,631),xy(613,634),xy(607,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(122,447),xy(121,448)]).
midline(r1, [xy(74,407),xy(110,371),xy(77,406)]).
midline(r1, [xy(135,422),xy(132,435),xy(122,445),xy(131,438)]).
midline(r1, [xy(136,421),xy(135,416),xy(137,414),xy(137,417)]).
midline(r1, [xy(57,372),xy(81,348),xy(60,371)]).
midline(r1, [xy(414,69),xy(413,70)]).
midline(r1, [xy(425,56),xy(415,68),xy(428,55)]).
fillpoint(r1, xy(469,440), 170.0).
fillpoint(r1, xy(441,451), 159.0).
fillpoint(r1, xy(423,457), 153.0).
fillpoint(r1, xy(416,459), 151.0).
fillpoint(r1, xy(490,388), 150.0).
fillpoint(r1, xy(493,378), 147.0).
fillpoint(r1, xy(402,463), 147.0).
fillpoint(r1, xy(494,375), 146.0).
fillpoint(r1, xy(399,464), 146.0).
fillpoint(r1, xy(495,371), 145.0).
fillpoint(r1, xy(396,465), 145.0).
fillpoint(r1, xy(496,367), 144.0).
fillpoint(r1, xy(393,466), 144.0).
fillpoint(r1, xy(497,363), 143.0).
fillpoint(r1, xy(390,467), 143.0).
fillpoint(r1, xy(380,470), 140.0).
fillpoint(r1, xy(376,471), 139.0).
fillpoint(r1, xy(372,472), 138.0).
fillpoint(r1, xy(503,345), 137.0).
fillpoint(r1, xy(368,473), 137.0).
fillpoint(r1, xy(504,342), 136.0).
fillpoint(r1, xy(363,474), 136.0).
fillpoint(r1, xy(506,335), 134.0).
fillpoint(r1, xy(355,476), 134.0).
fillpoint(r1, xy(507,331), 133.0).
fillpoint(r1, xy(351,477), 133.0).
fillpoint(r1, xy(508,327), 132.0).
fillpoint(r1, xy(347,478), 132.0).
fillpoint(r1, xy(509,322), 131.0).
fillpoint(r1, xy(342,479), 131.0).
fillpoint(r1, xy(510,318), 130.0).
fillpoint(r1, xy(338,480), 130.0).
fillpoint(r1, xy(332,481), 129.0).
fillpoint(r1, xy(326,482), 128.0).
fillpoint(r1, xy(513,305), 127.0).
fillpoint(r1, xy(318,483), 127.0).
fillpoint(r1, xy(514,301), 126.0).
fillpoint(r1, xy(308,484), 126.0).
fillpoint(r1, xy(515,296), 125.0).
fillpoint(r1, xy(296,485), 125.0).
fillpoint(r1, xy(124,485), 124.8).
fillpoint(r1, xy(516,291), 124.0).
fillpoint(r1, xy(291,486), 124.0).
fillpoint(r1, xy(517,285), 123.0).
fillpoint(r1, xy(135,487), 123.0).
fillpoint(r1, xy(285,487), 123.0).
fillpoint(r1, xy(518,277), 122.0).
fillpoint(r1, xy(142,488), 122.0).
fillpoint(r1, xy(277,488), 122.0).
fillpoint(r1, xy(519,267), 121.0).
fillpoint(r1, xy(152,489), 121.0).
fillpoint(r1, xy(267,489), 121.0).
fillpoint(r1, xy(520,255), 120.0).
fillpoint(r1, xy(171,490), 120.0).
fillpoint(r1, xy(521,250), 119.0).
fillpoint(r1, xy(522,244), 118.0).
fillpoint(r1, xy(523,237), 117.0).
fillpoint(r1, xy(524,115), 116.0).
fillpoint(r1, xy(524,227), 116.0).
fillpoint(r1, xy(524,170), 115.0).
fillpoint(r1, xy(44,356), 45.0).
border(r1).
region(r3, '#2ecc40', 60400, centroid(234,190)).
perimeter(r3, 2580).
polygon(r3, [xy(239,370),xy(170,370),xy(169,360),xy(130,360),xy(129,350),xy(110,350),xy(109,340),xy(100,340),xy(99,330),xy(90,329),xy(90,50),xy(339,50),xy(340,100),xy(389,100),xy(390,90),xy(400,90),xy(400,129),xy(410,130),xy(410,149),xy(390,150),xy(390,199),xy(410,200),xy(410,209),xy(400,210),xy(400,249),xy(390,250),xy(390,269),xy(380,270),xy(380,279),xy(370,280),xy(370,299),xy(360,300),xy(360,309),xy(350,310),xy(350,319),xy(340,320),xy(339,330),xy(320,330),xy(320,339),xy(310,340),xy(309,350),xy(290,350),xy(289,300),xy(140,300),xy(140,350),xy(239,350),xy(239,370)]).
hole(r3, [xy(290,249),xy(290,200),xy(339,200),xy(340,150),xy(290,150),xy(289,100),xy(240,100),xy(240,149),xy(190,150),xy(190,199),xy(140,200),xy(140,250),xy(290,249)]).
hole(r3, [xy(130,89),xy(129,60),xy(100,60),xy(100,90),xy(130,89)]).
hole(r3, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r3, [xy(284,275),xy(121,274),xy(116,263),xy(114,247),xy(115,190),xy(123,170),xy(140,150),xy(140,140),xy(96,95),xy(94,88),xy(95,55),xy(129,54),xy(135,56),xy(178,98),xy(179,100),xy(140,139)]).
midline(r3, [xy(285,274),xy(315,274),xy(307,258),xy(295,243),xy(295,205),xy(333,205),xy(351,219),xy(356,220),xy(356,222)]).
midline(r3, [xy(121,275),xy(115,290),xy(114,310),xy(124,335),xy(134,346),xy(135,354),xy(169,354),xy(179,360),xy(230,360)]).
midline(r3, [xy(180,100),xy(190,100),xy(207,85),xy(230,75),xy(289,74),xy(310,79),xy(319,120),xy(330,124),xy(349,125),xy(365,131),xy(365,224),xy(358,222)]).
midline(r3, [xy(366,130),xy(371,128),xy(393,105),xy(395,94)]).
midline(r3, [xy(373,128),xy(389,137),xy(400,140)]).
midline(r3, [xy(316,275),xy(324,280),xy(322,292),xy(318,302),xy(307,317),xy(300,334),xy(300,340)]).
midline(r3, [xy(325,279),xy(329,279)]).
midline(r3, [xy(330,277),xy(338,272),xy(355,254),xy(361,243),xy(360,240),xy(364,226)]).
midline(r3, [xy(366,225),xy(369,223),xy(370,225),xy(368,226)]).
midline(r3, [xy(371,225),xy(370,222),xy(377,218),xy(373,223)]).
midline(r3, [xy(379,218),xy(394,206),xy(405,205)]).
midline(r3, [xy(340,272),xy(347,281)]).
fillpoint(r3, xy(179,100), 51.0).
fillpoint(r3, xy(140,139), 51.0).
fillpoint(r3, xy(324,279), 40.0).
fillpoint(r3, xy(364,225), 35.0).
fillpoint(r3, xy(361,236), 32.0).
fillpoint(r3, xy(365,131), 31.4).
fillpoint(r3, xy(121,275), 31.4).
fillpoint(r3, xy(360,241), 31.1).
fillpoint(r3, xy(359,247), 31.0).
fillpoint(r3, xy(358,249), 30.4).
fillpoint(r3, xy(356,252), 30.0).
fillpoint(r3, xy(310,79), 29.7).
fillpoint(r3, xy(319,120), 29.7).
fillpoint(r3, xy(355,254), 29.7).
fillpoint(r3, xy(354,255), 29.7).
fillpoint(r3, xy(221,78), 29.0).
fillpoint(r3, xy(308,78), 29.0).
fillpoint(r3, xy(311,81), 29.0).
fillpoint(r3, xy(318,118), 29.0).
fillpoint(r3, xy(321,121), 29.0).
fillpoint(r3, xy(358,128), 29.0).
fillpoint(r3, xy(371,128), 29.0).
fillpoint(r3, xy(118,181), 29.0).
fillpoint(r3, xy(118,268), 29.0).
fillpoint(r3, xy(118,281), 29.0).
fillpoint(r3, xy(318,301), 29.0).
fillpoint(r3, xy(224,77), 28.0).
fillpoint(r3, xy(305,77), 28.0).
fillpoint(r3, xy(312,84), 28.0).
fillpoint(r3, xy(317,115), 28.0).
fillpoint(r3, xy(324,122), 28.0).
fillpoint(r3, xy(355,127), 28.0).
fillpoint(r3, xy(117,184), 28.0).
fillpoint(r3, xy(117,265), 28.0).
fillpoint(r3, xy(117,284), 28.0).
fillpoint(r3, xy(227,76), 27.0).
fillpoint(r3, xy(302,76), 27.0).
fillpoint(r3, xy(313,87), 27.0).
fillpoint(r3, xy(316,112), 27.0).
fillpoint(r3, xy(327,123), 27.0).
fillpoint(r3, xy(352,126), 27.0).
fillpoint(r3, xy(116,187), 27.0).
fillpoint(r3, xy(116,262), 27.0).
fillpoint(r3, xy(116,287), 27.0).
fillpoint(r3, xy(232,75), 26.0).
fillpoint(r3, xy(298,75), 26.0).
fillpoint(r3, xy(314,92), 26.0).
fillpoint(r3, xy(315,108), 26.0).
fillpoint(r3, xy(332,124), 26.0).
fillpoint(r3, xy(348,125), 26.0).
fillpoint(r3, xy(115,192), 26.0).
fillpoint(r3, xy(115,258), 26.0).
fillpoint(r3, xy(115,292), 26.0).
fillpoint(r3, xy(241,75), 25.0).
fillpoint(r3, xy(364,175), 25.0).
fillpoint(r3, xy(114,225), 25.0).
fillpoint(r3, xy(141,275), 25.0).
fillpoint(r3, xy(114,306), 25.0).
fillpoint(r3, xy(305,324), 16.0).
fillpoint(r3, xy(124,334), 16.0).
region(r2, '#ffdc00', 28800, centroid(157,98)).
perimeter(r2, 1460).
polygon(r2, [xy(320,0),xy(320,10),xy(339,10),xy(340,19),xy(349,20),xy(350,29),xy(359,30),xy(360,40),xy(370,40),xy(370,59),xy(379,60),xy(380,70),xy(390,70),xy(389,100),xy(340,100),xy(339,50),xy(90,50),xy(90,329),xy(80,330),xy(80,320),xy(70,320),xy(70,310),xy(60,310),xy(60,300),xy(50,299),xy(50,280),xy(40,279),xy(40,60),xy(50,59),xy(50,40),xy(59,40),xy(60,30),xy(69,30),xy(70,20),xy(79,20),xy(80,10),xy(99,10),xy(100,0)]).
midline(r2, [xy(360,79),xy(355,66),xy(355,54),xy(346,40),xy(322,29),xy(312,29),xy(300,24),xy(123,25),xy(119,23),xy(111,28),xy(98,29),xy(84,34),xy(74,44),xy(64,80),xy(64,260),xy(68,268),xy(70,284),xy(79,304),xy(79,310),xy(84,316),xy(85,325)]).
midline(r2, [xy(362,79),xy(375,85)]).
fillpoint(r2, xy(119,25), 25.0).
fillpoint(r2, xy(64,170), 25.0).
fillpoint(r2, xy(106,29), 21.0).
fillpoint(r2, xy(313,29), 21.0).
fillpoint(r2, xy(69,66), 21.0).
fillpoint(r2, xy(361,78), 21.0).
fillpoint(r2, xy(69,273), 21.0).
fillpoint(r2, xy(96,30), 20.0).
fillpoint(r2, xy(321,30), 20.0).
fillpoint(r2, xy(70,57), 20.0).
fillpoint(r2, xy(69,282), 20.0).
fillpoint(r2, xy(89,33), 17.0).
fillpoint(r2, xy(73,49), 17.0).
fillpoint(r2, xy(86,34), 16.5).
fillpoint(r2, xy(74,46), 16.5).
fillpoint(r2, xy(84,35), 16.2).
fillpoint(r2, xy(75,44), 16.2).
fillpoint(r2, xy(334,34), 16.0).
fillpoint(r2, xy(355,65), 16.0).
fillpoint(r2, xy(374,84), 16.0).
fillpoint(r2, xy(74,294), 16.0).
fillpoint(r2, xy(354,56), 15.0).
fillpoint(r2, xy(348,41), 12.2).
fillpoint(r2, xy(79,305), 11.0).
border(r2).
region(r6, '#ffdc00', 15000, centroid(248,191)).
perimeter(r6, 700).
polygon(r6, [xy(289,250),xy(140,249),xy(140,200),xy(240,199),xy(240,100),xy(289,100),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r6, [xy(263,210),xy(265,190),xy(271,175),xy(265,158),xy(265,124)]).
midline(r6, [xy(263,211),xy(259,221),xy(248,224),xy(164,225)]).
midline(r6, [xy(272,175),xy(315,175)]).
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
fillpoint(r6, xy(164,225), 25.0).
region(r14, '#5a5a5a', 8400, centroid(340,620)).
perimeter(r14, 880).
polygon(r14, [xy(549,630),xy(130,630),xy(130,610),xy(549,610),xy(549,630)]).
midline(r14, [xy(356,620),xy(139,620)]).
midline(r14, [xy(357,620),xy(540,620)]).
fillpoint(r14, xy(139,620), 10.0).
region(r13, '#ffdc00', 8100, centroid(218,327)).
perimeter(r13, 440).
polygon(r13, [xy(249,370),xy(240,369),xy(239,350),xy(140,350),xy(140,300),xy(289,300),xy(290,359),xy(250,360),xy(249,370)]).
midline(r13, [xy(212,325),xy(164,325)]).
midline(r13, [xy(213,324),xy(249,325),xy(261,330),xy(263,333),xy(245,356),xy(245,365)]).
fillpoint(r13, xy(260,329), 29.7).
fillpoint(r13, xy(258,328), 29.0).
fillpoint(r13, xy(261,331), 29.0).
fillpoint(r13, xy(255,327), 28.0).
fillpoint(r13, xy(252,326), 27.0).
fillpoint(r13, xy(248,325), 26.0).
fillpoint(r13, xy(164,325), 25.0).
region(r9, '#870c25', 1500, centroid(214,184)).
perimeter(r9, 160).
polygon(r9, [xy(239,200),xy(190,200),xy(190,170),xy(239,170),xy(239,200)]).
midline(r9, [xy(225,185),xy(204,185)]).
fillpoint(r9, xy(204,185), 15.0).
region(r7, '#bebebe', 1000, centroid(214,160)).
perimeter(r7, 140).
polygon(r7, [xy(239,170),xy(190,170),xy(190,150),xy(239,150),xy(239,170)]).
midline(r7, [xy(210,159),xy(199,160)]).
midline(r7, [xy(211,160),xy(230,160)]).
fillpoint(r7, xy(199,160), 10.0).
region(r4, '#5a5a5a', 800, centroid(114,74)).
perimeter(r4, 160).
polygon(r4, [xy(129,90),xy(100,89),xy(100,60),xy(130,60),xy(129,90)]).
hole(r4, [xy(120,79),xy(119,70),xy(110,70),xy(110,80),xy(120,79)]).
midline(r4, [xy(105,77),xy(105,65),xy(124,65),xy(125,74),xy(124,83),xy(119,85),xy(106,84),xy(105,78)]).
fillpoint(r4, xy(106,65), 6.0).
fillpoint(r4, xy(124,65), 6.0).
fillpoint(r4, xy(105,84), 6.0).
fillpoint(r4, xy(123,84), 6.0).
fillpoint(r4, xy(111,65), 5.0).
fillpoint(r4, xy(104,75), 5.0).
fillpoint(r4, xy(124,75), 5.0).
fillpoint(r4, xy(111,85), 5.0).
region(r8, '#ffdc00', 800, centroid(400,170)).
perimeter(r8, 120).
polygon(r8, [xy(409,190),xy(390,189),xy(390,150),xy(410,150),xy(409,190)]).
midline(r8, [xy(399,160),xy(400,159)]).
midline(r8, [xy(400,161),xy(400,180)]).
fillpoint(r8, xy(399,170), 10.0).
region(r11, '#5a5a5a', 800, centroid(314,224)).
perimeter(r11, 160).
polygon(r11, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r11, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r11, [xy(319,214),xy(305,215),xy(305,234),xy(319,235),xy(324,233),xy(324,216),xy(320,215)]).
fillpoint(r11, xy(306,215), 6.0).
fillpoint(r11, xy(324,215), 6.0).
fillpoint(r11, xy(305,234), 6.0).
fillpoint(r11, xy(323,234), 6.0).
fillpoint(r11, xy(311,215), 5.0).
fillpoint(r11, xy(304,225), 5.0).
fillpoint(r11, xy(324,225), 5.0).
fillpoint(r11, xy(311,235), 5.0).
region(r15, '#7fdbff', 400, centroid(570,620)).
perimeter(r15, 80).
polygon(r15, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r15, [xy(569,619),xy(570,620)]).
fillpoint(r15, xy(569,620), 10.0).
region(r16, '#7fdbff', 400, centroid(600,620)).
perimeter(r16, 80).
polygon(r16, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r16, [xy(599,619),xy(600,620)]).
fillpoint(r16, xy(599,620), 10.0).
region(r17, '#7fdbff', 400, centroid(630,620)).
perimeter(r17, 80).
polygon(r17, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r17, [xy(629,619),xy(630,620)]).
fillpoint(r17, xy(629,620), 10.0).
border(r17).
region(r5, '#2ecc40', 100, centroid(114,74)).
perimeter(r5, 40).
polygon(r5, [xy(119,80),xy(110,79),xy(110,70),xy(120,70),xy(119,80)]).
midline(r5, [xy(115,75),xy(115,74)]).
fillpoint(r5, xy(114,75), 5.0).
region(r12, '#2ecc40', 100, centroid(314,224)).
perimeter(r12, 40).
polygon(r12, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r12, [xy(315,225),xy(315,224)]).
fillpoint(r12, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 600).
adjacent(r1, r3).
shared_edge(r1, r3, 540).
adjacent(r1, r8).
shared_edge(r1, r8, 40).
adjacent(r1, r13).
shared_edge(r1, r13, 70).
adjacent(r1, r14).
shared_edge(r1, r14, 880).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 640).
adjacent(r3, r4).
shared_edge(r3, r4, 120).
adjacent(r3, r6).
shared_edge(r3, r6, 600).
adjacent(r3, r7).
shared_edge(r3, r7, 70).
adjacent(r3, r8).
shared_edge(r3, r8, 60).
adjacent(r3, r9).
shared_edge(r3, r9, 30).
adjacent(r3, r11).
shared_edge(r3, r11, 120).
adjacent(r3, r13).
shared_edge(r3, r13, 370).
adjacent(r4, r5).
shared_edge(r4, r5, 40).
adjacent(r6, r7).
shared_edge(r6, r7, 20).
adjacent(r6, r9).
shared_edge(r6, r9, 80).
adjacent(r7, r9).
shared_edge(r7, r9, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 40).

encloses(r4, r5).
encloses(r11, r12).
encloses(r1, r14).
encloses(r1, r15).
encloses(r1, r16).
