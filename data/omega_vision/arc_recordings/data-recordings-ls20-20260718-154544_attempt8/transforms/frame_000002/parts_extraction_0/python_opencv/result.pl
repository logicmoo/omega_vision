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

region(r1, '#aaaaaa', 313400, centroid(346,365)).
perimeter(r1, 4200).
polygon(r1, [xy(0,0),xy(0,639),xy(639,639),xy(639,630),xy(619,629),xy(619,610),xy(639,609),xy(639,0),xy(400,0),xy(400,29),xy(410,30),xy(410,109),xy(400,110),xy(400,149),xy(390,150),xy(390,169),xy(380,170),xy(379,180),xy(370,180),xy(370,199),xy(360,200),xy(360,209),xy(350,210),xy(350,219),xy(340,220),xy(339,230),xy(320,230),xy(320,239),xy(310,240),xy(309,250),xy(290,250),xy(289,260),xy(250,260),xy(249,270),xy(170,270),xy(169,260),xy(130,260),xy(129,250),xy(110,250),xy(109,240),xy(99,239),xy(99,230),xy(80,230),xy(79,220),xy(70,220),xy(69,210),xy(60,210),xy(59,200),xy(49,199),xy(49,180),xy(39,179),xy(39,0),xy(0,0)]).
hole(r1, [xy(589,610),xy(609,609),xy(610,629),xy(590,630),xy(589,610)]).
hole(r1, [xy(559,610),xy(579,609),xy(580,629),xy(560,630),xy(559,610)]).
hole(r1, [xy(129,610),xy(549,609),xy(550,629),xy(130,630),xy(129,610)]).
midline(r1, [xy(19,20),xy(19,199),xy(24,204),xy(24,224),xy(29,229),xy(29,239),xy(34,244),xy(34,254),xy(39,259),xy(39,269),xy(49,279),xy(49,289),xy(54,294),xy(54,304),xy(64,314),xy(64,324),xy(84,344),xy(84,354),xy(169,439),xy(64,545),xy(64,574),xy(124,634),xy(553,634),xy(554,524),xy(464,434),xy(425,434),xy(419,439),xy(170,439),xy(66,543)]).
midline(r1, [xy(464,433),xy(464,425),xy(473,416),xy(474,405),xy(479,400),xy(479,390),xy(488,381),xy(489,370),xy(494,365),xy(494,355),xy(499,350),xy(499,340),xy(504,335),xy(504,315),xy(509,310),xy(509,300),xy(514,295),xy(514,275),xy(519,270),xy(519,230),xy(524,225),xy(524,114),xy(424,14),xy(415,14)]).
midline(r1, [xy(555,525),xy(584,554),xy(584,633),xy(554,634)]).
midline(r1, [xy(423,436),xy(420,439)]).
midline(r1, [xy(584,634),xy(614,633),xy(614,584),xy(585,555)]).
midline(r1, [xy(614,634),xy(634,634)]).
fillpoint(r1, xy(433,403), 197.2).
fillpoint(r1, xy(430,404), 196.7).
fillpoint(r1, xy(426,405), 195.8).
fillpoint(r1, xy(421,406), 194.8).
fillpoint(r1, xy(417,407), 193.9).
fillpoint(r1, xy(412,408), 192.9).
fillpoint(r1, xy(407,409), 192.0).
fillpoint(r1, xy(403,410), 191.0).
fillpoint(r1, xy(398,411), 190.0).
fillpoint(r1, xy(394,412), 189.1).
fillpoint(r1, xy(389,413), 188.1).
fillpoint(r1, xy(384,414), 187.2).
fillpoint(r1, xy(380,415), 186.2).
fillpoint(r1, xy(446,381), 185.3).
fillpoint(r1, xy(375,416), 185.3).
fillpoint(r1, xy(447,377), 184.3).
fillpoint(r1, xy(370,417), 184.3).
fillpoint(r1, xy(366,418), 183.4).
fillpoint(r1, xy(361,419), 182.4).
fillpoint(r1, xy(357,420), 181.5).
fillpoint(r1, xy(352,421), 180.5).
fillpoint(r1, xy(347,422), 179.5).
fillpoint(r1, xy(343,423), 178.6).
fillpoint(r1, xy(338,424), 177.6).
fillpoint(r1, xy(334,425), 176.7).
fillpoint(r1, xy(329,426), 175.7).
fillpoint(r1, xy(324,427), 174.8).
fillpoint(r1, xy(320,428), 173.8).
fillpoint(r1, xy(315,429), 172.9).
fillpoint(r1, xy(311,430), 171.9).
fillpoint(r1, xy(306,431), 170.9).
fillpoint(r1, xy(301,432), 170.0).
fillpoint(r1, xy(297,433), 169.0).
fillpoint(r1, xy(464,347), 168.1).
fillpoint(r1, xy(292,434), 168.1).
fillpoint(r1, xy(271,435), 167.1).
fillpoint(r1, xy(266,436), 166.2).
fillpoint(r1, xy(261,437), 165.2).
fillpoint(r1, xy(257,438), 164.3).
fillpoint(r1, xy(469,337), 163.3).
fillpoint(r1, xy(252,439), 163.3).
fillpoint(r1, xy(470,333), 162.4).
fillpoint(r1, xy(170,440), 162.4).
fillpoint(r1, xy(475,323), 157.6).
fillpoint(r1, xy(476,318), 156.6).
fillpoint(r1, xy(481,308), 151.8).
fillpoint(r1, xy(482,304), 150.9).
fillpoint(r1, xy(483,299), 149.9).
fillpoint(r1, xy(484,294), 149.0).
fillpoint(r1, xy(485,290), 148.0).
fillpoint(r1, xy(487,284), 146.1).
fillpoint(r1, xy(488,279), 145.2).
fillpoint(r1, xy(493,269), 140.4).
fillpoint(r1, xy(494,264), 139.4).
fillpoint(r1, xy(495,260), 138.5).
fillpoint(r1, xy(496,255), 137.5).
fillpoint(r1, xy(497,250), 136.6).
fillpoint(r1, xy(499,244), 134.7).
fillpoint(r1, xy(500,240), 133.7).
fillpoint(r1, xy(501,235), 132.7).
fillpoint(r1, xy(502,230), 131.8).
fillpoint(r1, xy(503,226), 130.8).
fillpoint(r1, xy(504,221), 129.9).
fillpoint(r1, xy(505,217), 128.9).
fillpoint(r1, xy(506,212), 128.0).
fillpoint(r1, xy(507,207), 127.0).
fillpoint(r1, xy(508,203), 126.1).
fillpoint(r1, xy(509,198), 125.1).
fillpoint(r1, xy(510,194), 124.2).
fillpoint(r1, xy(511,189), 123.2).
fillpoint(r1, xy(512,184), 122.2).
fillpoint(r1, xy(513,180), 121.3).
fillpoint(r1, xy(514,175), 120.3).
fillpoint(r1, xy(515,171), 119.4).
fillpoint(r1, xy(516,166), 118.4).
fillpoint(r1, xy(517,161), 117.5).
fillpoint(r1, xy(518,157), 116.5).
fillpoint(r1, xy(519,152), 115.6).
fillpoint(r1, xy(520,139), 114.6).
fillpoint(r1, xy(521,126), 113.6).
fillpoint(r1, xy(522,121), 112.7).
fillpoint(r1, xy(523,117), 111.7).
fillpoint(r1, xy(75,561), 72.6).
fillpoint(r1, xy(74,565), 71.6).
fillpoint(r1, xy(64,293), 62.1).
fillpoint(r1, xy(63,289), 61.1).
fillpoint(r1, xy(58,279), 56.3).
border(r1).
region(r2, '#ffdc00', 28600, centroid(191,58)).
perimeter(r2, 1300).
polygon(r2, [xy(40,179),xy(50,180),xy(50,199),xy(59,199),xy(60,209),xy(69,209),xy(70,219),xy(79,219),xy(80,229),xy(89,229),xy(90,49),xy(339,49),xy(340,99),xy(389,99),xy(389,50),xy(409,49),xy(409,30),xy(399,29),xy(399,0),xy(40,0),xy(40,179)]).
midline(r2, [xy(364,74),xy(363,24),xy(65,24),xy(64,154),xy(69,159),xy(69,179),xy(74,184),xy(74,194),xy(79,199),xy(79,209),xy(84,214),xy(84,224)]).
midline(r2, [xy(398,39),xy(389,39),xy(374,24),xy(364,24)]).
fillpoint(r2, xy(364,32), 31.3).
fillpoint(r2, xy(69,29), 28.6).
fillpoint(r2, xy(73,28), 27.7).
fillpoint(r2, xy(356,28), 27.7).
fillpoint(r2, xy(68,33), 27.7).
fillpoint(r2, xy(78,27), 26.7).
fillpoint(r2, xy(351,27), 26.7).
fillpoint(r2, xy(67,38), 26.7).
fillpoint(r2, xy(83,26), 25.8).
fillpoint(r2, xy(347,26), 25.8).
fillpoint(r2, xy(66,43), 25.8).
fillpoint(r2, xy(87,25), 24.8).
fillpoint(r2, xy(342,25), 24.8).
fillpoint(r2, xy(65,47), 24.8).
fillpoint(r2, xy(91,25), 23.9).
fillpoint(r2, xy(65,106), 23.9).
fillpoint(r2, xy(365,63), 23.9).
fillpoint(r2, xy(67,168), 22.0).
fillpoint(r2, xy(68,173), 21.0).
fillpoint(r2, xy(69,177), 20.1).
fillpoint(r2, xy(69,183), 19.1).
fillpoint(r2, xy(73,193), 16.2).
fillpoint(r2, xy(393,38), 11.5).
fillpoint(r2, xy(78,203), 11.5).
fillpoint(r2, xy(397,39), 10.5).
fillpoint(r2, xy(79,207), 10.5).
border(r2).
region(r3, '#2ecc40', 23700, centroid(161,154)).
perimeter(r3, 1160).
polygon(r3, [xy(90,50),xy(90,229),xy(99,229),xy(100,239),xy(110,240),xy(110,249),xy(129,249),xy(130,259),xy(169,259),xy(170,269),xy(249,269),xy(250,259),xy(289,259),xy(289,250),xy(139,249),xy(140,199),xy(239,199),xy(239,100),xy(190,100),xy(189,50),xy(90,50)]).
hole(r3, [xy(99,60),xy(129,59),xy(130,89),xy(100,90),xy(99,60)]).
midline(r3, [xy(188,149),xy(140,149),xy(139,139),xy(94,94),xy(94,55),xy(134,54),xy(159,79),xy(159,119),xy(140,139),xy(159,120)]).
midline(r3, [xy(284,254),xy(245,254),xy(239,259),xy(179,259),xy(174,254),xy(135,254),xy(134,244),xy(124,234),xy(124,224),xy(119,219),xy(119,209),xy(114,204),xy(114,175),xy(139,149)]).
midline(r3, [xy(240,259),xy(243,256)]).
fillpoint(r3, xy(150,141), 56.3).
fillpoint(r3, xy(155,142), 55.4).
fillpoint(r3, xy(160,143), 54.4).
fillpoint(r3, xy(164,144), 53.5).
fillpoint(r3, xy(169,145), 52.5).
fillpoint(r3, xy(173,146), 51.6).
fillpoint(r3, xy(178,147), 50.6).
fillpoint(r3, xy(183,148), 49.7).
fillpoint(r3, xy(187,149), 48.7).
fillpoint(r3, xy(158,97), 30.6).
fillpoint(r3, xy(159,92), 29.6).
fillpoint(r3, xy(159,84), 28.6).
fillpoint(r3, xy(118,183), 27.7).
fillpoint(r3, xy(117,188), 26.7).
fillpoint(r3, xy(116,193), 25.8).
fillpoint(r3, xy(115,197), 24.8).
fillpoint(r3, xy(115,206), 23.9).
fillpoint(r3, xy(117,218), 22.0).
fillpoint(r3, xy(123,233), 16.2).
region(r10, '#ffdc00', 15000, centroid(248,191)).
perimeter(r10, 700).
polygon(r10, [xy(339,150),xy(290,150),xy(289,100),xy(240,100),xy(240,199),xy(140,200),xy(140,249),xy(289,249),xy(289,200),xy(339,199),xy(339,150)]).
midline(r10, [xy(165,224),xy(263,224),xy(264,125)]).
midline(r10, [xy(265,174),xy(314,174)]).
fillpoint(r10, xy(272,175), 31.3).
fillpoint(r10, xy(260,220), 28.6).
fillpoint(r10, xy(268,166), 27.7).
fillpoint(r10, xy(268,183), 27.7).
fillpoint(r10, xy(261,216), 27.7).
fillpoint(r10, xy(256,221), 27.7).
fillpoint(r10, xy(267,161), 26.7).
fillpoint(r10, xy(267,188), 26.7).
fillpoint(r10, xy(262,211), 26.7).
fillpoint(r10, xy(251,222), 26.7).
fillpoint(r10, xy(266,157), 25.8).
fillpoint(r10, xy(266,193), 25.8).
fillpoint(r10, xy(263,207), 25.8).
fillpoint(r10, xy(247,223), 25.8).
fillpoint(r10, xy(265,152), 24.8).
fillpoint(r10, xy(265,197), 24.8).
fillpoint(r10, xy(264,202), 24.8).
fillpoint(r10, xy(242,224), 24.8).
fillpoint(r10, xy(265,136), 23.9).
fillpoint(r10, xy(291,175), 23.9).
fillpoint(r10, xy(164,225), 23.9).
region(r5, '#2ecc40', 14800, centroid(328,121)).
perimeter(r5, 1020).
polygon(r5, [xy(409,50),xy(390,50),xy(389,100),xy(340,100),xy(339,50),xy(240,50),xy(240,99),xy(289,99),xy(290,149),xy(340,150),xy(340,199),xy(290,200),xy(290,249),xy(309,249),xy(309,240),xy(299,239),xy(300,209),xy(329,209),xy(330,229),xy(339,229),xy(339,220),xy(349,219),xy(349,210),xy(359,209),xy(360,199),xy(369,199),xy(369,180),xy(379,179),xy(380,169),xy(389,169),xy(389,150),xy(399,149),xy(399,110),xy(409,109),xy(409,90),xy(399,89),xy(399,60),xy(409,59),xy(409,50)]).
midline(r5, [xy(265,74),xy(314,74),xy(314,124),xy(364,124),xy(364,144),xy(359,150),xy(359,159),xy(354,165),xy(354,184),xy(349,190),xy(349,199),xy(339,209),xy(334,204),xy(294,205),xy(294,244),xy(304,244)]).
midline(r5, [xy(361,148),xy(364,145)]).
midline(r5, [xy(365,124),xy(375,124),xy(398,101),xy(399,99),xy(394,94),xy(394,55),xy(404,54)]).
midline(r5, [xy(356,163),xy(359,160)]).
midline(r5, [xy(351,188),xy(354,185)]).
midline(r5, [xy(334,224),xy(335,213),xy(349,200)]).
fillpoint(r5, xy(364,132), 31.3).
fillpoint(r5, xy(310,79), 28.6).
fillpoint(r5, xy(319,120), 28.6).
fillpoint(r5, xy(306,78), 27.7).
fillpoint(r5, xy(311,83), 27.7).
fillpoint(r5, xy(318,116), 27.7).
fillpoint(r5, xy(323,121), 27.7).
fillpoint(r5, xy(356,128), 27.7).
fillpoint(r5, xy(301,77), 26.7).
fillpoint(r5, xy(312,88), 26.7).
fillpoint(r5, xy(317,111), 26.7).
fillpoint(r5, xy(328,122), 26.7).
fillpoint(r5, xy(351,127), 26.7).
fillpoint(r5, xy(297,76), 25.8).
fillpoint(r5, xy(313,93), 25.8).
fillpoint(r5, xy(316,107), 25.8).
fillpoint(r5, xy(333,123), 25.8).
fillpoint(r5, xy(347,126), 25.8).
fillpoint(r5, xy(292,75), 24.8).
fillpoint(r5, xy(314,97), 24.8).
fillpoint(r5, xy(315,102), 24.8).
fillpoint(r5, xy(337,124), 24.8).
fillpoint(r5, xy(342,125), 24.8).
fillpoint(r5, xy(264,75), 23.9).
fillpoint(r5, xy(365,151), 23.9).
fillpoint(r5, xy(362,158), 22.0).
fillpoint(r5, xy(356,173), 16.2).
fillpoint(r5, xy(355,177), 15.3).
fillpoint(r5, xy(355,184), 14.3).
fillpoint(r5, xy(351,193), 11.5).
fillpoint(r5, xy(350,197), 10.5).
fillpoint(r5, xy(399,100), 10.0).
fillpoint(r5, xy(349,200), 10.0).
fillpoint(r5, xy(340,209), 10.0).
region(r14, '#5a5a5a', 7600, centroid(360,620)).
perimeter(r14, 800).
polygon(r14, [xy(170,610),xy(170,629),xy(549,629),xy(549,610),xy(170,610)]).
midline(r14, [xy(539,619),xy(180,619)]).
fillpoint(r14, xy(179,620), 9.6).
region(r9, '#870c25', 1500, centroid(214,84)).
perimeter(r9, 160).
polygon(r9, [xy(190,70),xy(190,99),xy(239,99),xy(239,70),xy(190,70)]).
midline(r9, [xy(205,84),xy(224,84)]).
fillpoint(r9, xy(204,85), 14.3).
region(r4, '#bebebe', 1000, centroid(214,60)).
perimeter(r4, 140).
polygon(r4, [xy(190,50),xy(190,69),xy(239,69),xy(239,50),xy(190,50)]).
midline(r4, [xy(200,59),xy(229,59)]).
fillpoint(r4, xy(199,60), 9.6).
region(r6, '#5a5a5a', 800, centroid(114,74)).
perimeter(r6, 160).
polygon(r6, [xy(100,60),xy(100,89),xy(129,89),xy(129,60),xy(100,60)]).
hole(r6, [xy(109,70),xy(119,69),xy(120,79),xy(110,80),xy(109,70)]).
midline(r6, [xy(119,64),xy(104,65),xy(104,84),xy(124,83),xy(124,65),xy(120,64)]).
fillpoint(r6, xy(107,65), 5.7).
fillpoint(r6, xy(124,65), 5.7).
fillpoint(r6, xy(105,84), 5.7).
fillpoint(r6, xy(122,84), 5.7).
fillpoint(r6, xy(111,65), 4.8).
fillpoint(r6, xy(104,75), 4.8).
fillpoint(r6, xy(124,75), 4.8).
fillpoint(r6, xy(111,85), 4.8).
region(r13, '#2ecc40', 800, centroid(150,620)).
perimeter(r13, 120).
polygon(r13, [xy(130,610),xy(130,629),xy(169,629),xy(169,610),xy(130,610)]).
midline(r13, [xy(140,619),xy(159,619)]).
fillpoint(r13, xy(139,620), 9.6).
region(r11, '#5a5a5a', 700, centroid(313,223)).
perimeter(r11, 160).
polygon(r11, [xy(300,210),xy(300,239),xy(319,239),xy(319,230),xy(329,229),xy(329,210),xy(300,210)]).
hole(r11, [xy(309,220),xy(319,219),xy(320,229),xy(310,230),xy(309,220)]).
midline(r11, [xy(319,214),xy(304,215),xy(304,234),xy(315,234),xy(324,225),xy(324,215),xy(320,214)]).
fillpoint(r11, xy(307,215), 5.7).
fillpoint(r11, xy(324,215), 5.7).
fillpoint(r11, xy(305,234), 5.7).
fillpoint(r11, xy(311,215), 4.8).
fillpoint(r11, xy(304,225), 4.8).
fillpoint(r11, xy(325,223), 4.8).
fillpoint(r11, xy(311,235), 4.8).
region(r15, '#7fdbff', 400, centroid(570,620)).
perimeter(r15, 80).
polygon(r15, [xy(560,610),xy(560,629),xy(579,629),xy(579,610),xy(560,610)]).
midline(r15, [xy(569,619)]).
fillpoint(r15, xy(569,620), 9.6).
region(r16, '#7fdbff', 400, centroid(600,620)).
perimeter(r16, 80).
polygon(r16, [xy(590,610),xy(590,629),xy(609,629),xy(609,610),xy(590,610)]).
midline(r16, [xy(599,619)]).
fillpoint(r16, xy(599,620), 9.6).
region(r17, '#7fdbff', 400, centroid(630,620)).
perimeter(r17, 80).
polygon(r17, [xy(620,610),xy(620,629),xy(639,629),xy(639,610),xy(620,610)]).
midline(r17, [xy(629,619)]).
fillpoint(r17, xy(629,620), 9.6).
border(r17).
region(r8, '#2ecc40', 100, centroid(114,74)).
perimeter(r8, 40).
polygon(r8, [xy(110,70),xy(110,79),xy(119,79),xy(119,70),xy(110,70)]).
midline(r8, [xy(114,74)]).
fillpoint(r8, xy(114,75), 4.8).
region(r12, '#2ecc40', 100, centroid(314,224)).
perimeter(r12, 40).
polygon(r12, [xy(310,220),xy(310,229),xy(319,229),xy(319,220),xy(310,220)]).
midline(r12, [xy(314,224)]).
fillpoint(r12, xy(314,225), 4.8).

adjacent(r1, r2).
shared_edge(r1, r2, 340).
adjacent(r1, r3).
shared_edge(r1, r3, 260).
adjacent(r1, r5).
shared_edge(r1, r5, 260).
adjacent(r1, r11).
shared_edge(r1, r11, 30).
adjacent(r1, r13).
shared_edge(r1, r13, 100).
adjacent(r1, r14).
shared_edge(r1, r14, 780).
adjacent(r1, r15).
shared_edge(r1, r15, 80).
adjacent(r1, r16).
shared_edge(r1, r16, 80).
adjacent(r1, r17).
shared_edge(r1, r17, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 280).
adjacent(r2, r4).
shared_edge(r2, r4, 50).
adjacent(r2, r5).
shared_edge(r2, r5, 270).
adjacent(r3, r4).
shared_edge(r3, r4, 20).
adjacent(r3, r6).
shared_edge(r3, r6, 120).
adjacent(r3, r9).
shared_edge(r3, r9, 80).
adjacent(r3, r10).
shared_edge(r3, r10, 400).
adjacent(r4, r5).
shared_edge(r4, r5, 20).
adjacent(r4, r9).
shared_edge(r4, r9, 50).
adjacent(r5, r9).
shared_edge(r5, r9, 30).
adjacent(r5, r10).
shared_edge(r5, r10, 300).
adjacent(r5, r11).
shared_edge(r5, r11, 90).
adjacent(r6, r8).
shared_edge(r6, r8, 40).
adjacent(r11, r12).
shared_edge(r11, r12, 40).
adjacent(r13, r14).
shared_edge(r13, r14, 20).

encloses(r6, r8).
encloses(r11, r12).
encloses(r1, r15).
encloses(r1, r16).

% OpenCV grouping evidence (advisory; base topology remains authoritative).
:- dynamic opencv_background_candidate/1.
:- discontiguous opencv_background_candidate/1.
:- dynamic opencv_component/2.
:- discontiguous opencv_component/2.
:- dynamic opencv_component_area/2.
:- discontiguous opencv_component_area/2.
:- dynamic opencv_component_centroid/2.
:- discontiguous opencv_component_centroid/2.
:- dynamic opencv_contour/4.
:- discontiguous opencv_contour/4.
:- dynamic opencv_contour_hierarchy/6.
:- discontiguous opencv_contour_hierarchy/6.
:- dynamic opencv_morphology/4.
:- discontiguous opencv_morphology/4.
:- dynamic opencv_shape_metrics/7.
:- discontiguous opencv_shape_metrics/7.
:- dynamic opencv_watershed_count/2.
:- discontiguous opencv_watershed_count/2.
:- dynamic opencv_watershed_segment/4.
:- discontiguous opencv_watershed_segment/4.
opencv_background_candidate(r1).
opencv_component(cc1, [r2,r3,r4,r5,r6,r8,r9,r10,r11,r12]).
opencv_component_area(cc1, 86300).
opencv_component_centroid(cc1, centroid(217,121)).
opencv_component(cc2, [r13,r14]).
opencv_component_area(cc2, 8400).
opencv_component_centroid(cc2, centroid(340,620)).
opencv_component(cc3, [r15]).
opencv_component_area(cc3, 400).
opencv_component_centroid(cc3, centroid(570,620)).
opencv_component(cc4, [r16]).
opencv_component_area(cc4, 400).
opencv_component_centroid(cc4, centroid(600,620)).
opencv_component(cc5, [r17]).
opencv_component_area(cc5, 400).
opencv_component_centroid(cc5, centroid(630,620)).
opencv_morphology(r1, opening_area(313372), closing_area(315604), gradient_area(8336)).
opencv_shape_metrics(r1, contour_area(321033.0), hull_area(408321.0), solidity(0.786227), circularity(0.408661), extent(0.783772), aspect_ratio(1.0)).
opencv_contour(r1, c0, outer, 321033.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 439.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 439.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 8839.0).
opencv_contour_hierarchy(r1, c3, next(none), previous(c2), child(none), parent(c0)).
opencv_morphology(r2, opening_area(28588), closing_area(29170), gradient_area(2580)).
opencv_shape_metrics(r2, contour_area(27955.0), hull_area(60901.0), solidity(0.459024), circularity(0.210672), extent(0.328496), aspect_ratio(1.608696)).
opencv_contour(r2, c0, outer, 27955.0).
opencv_contour_hierarchy(r2, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r3, opening_area(23688), closing_area(24074), gradient_area(2296)).
opencv_shape_metrics(r3, contour_area(24085.0), hull_area(34781.0), solidity(0.692476), circularity(0.284561), extent(0.547386), aspect_ratio(0.909091)).
opencv_contour(r3, c0, outer, 24085.0).
opencv_contour_hierarchy(r3, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r3, c1, hole, 959.0).
opencv_contour_hierarchy(r3, c1, next(none), previous(none), child(none), parent(c0)).
opencv_morphology(r4, opening_area(996), closing_area(1132), gradient_area(276)).
opencv_shape_metrics(r4, contour_area(931.0), hull_area(931.0), solidity(1.0), circularity(0.632531), extent(0.931), aspect_ratio(2.5)).
opencv_contour(r4, c0, outer, 931.0).
opencv_contour_hierarchy(r4, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r5, opening_area(14779), closing_area(15025), gradient_area(2002)).
opencv_shape_metrics(r5, contour_area(14299.5), hull_area(25131.0), solidity(0.568998), circularity(0.177541), extent(0.420574), aspect_ratio(0.85)).
opencv_contour(r5, c0, outer, 14299.5).
opencv_contour_hierarchy(r5, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r6, opening_area(796), closing_area(916), gradient_area(312)).
opencv_shape_metrics(r6, contour_area(841.0), hull_area(841.0), solidity(1.0), circularity(0.785398), extent(0.934444), aspect_ratio(1.0)).
opencv_contour(r6, c0, outer, 841.0).
opencv_contour_hierarchy(r6, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r6, c1, hole, 119.0).
opencv_contour_hierarchy(r6, c1, next(none), previous(none), child(none), parent(c0)).
opencv_morphology(r8, opening_area(96), closing_area(132), gradient_area(76)).
opencv_shape_metrics(r8, contour_area(81.0), hull_area(81.0), solidity(1.0), circularity(0.785398), extent(0.81), aspect_ratio(1.0)).
opencv_contour(r8, c0, outer, 81.0).
opencv_contour_hierarchy(r8, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r9, opening_area(1496), closing_area(1652), gradient_area(316)).
opencv_shape_metrics(r9, contour_area(1421.0), hull_area(1421.0), solidity(1.0), circularity(0.733761), extent(0.947333), aspect_ratio(1.666667)).
opencv_contour(r9, c0, outer, 1421.0).
opencv_contour_hierarchy(r9, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r10, opening_area(14993), closing_area(15295), gradient_area(1390)).
opencv_shape_metrics(r10, contour_area(14652.5), hull_area(22151.0), solidity(0.661483), circularity(0.382031), extent(0.488417), aspect_ratio(1.333333)).
opencv_contour(r10, c0, outer, 14652.5).
opencv_contour_hierarchy(r10, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r11, opening_area(693), closing_area(797), gradient_area(308)).
opencv_shape_metrics(r11, contour_area(741.5), hull_area(791.0), solidity(0.937421), circularity(0.699524), extent(0.823889), aspect_ratio(1.0)).
opencv_contour(r11, c0, outer, 741.5).
opencv_contour_hierarchy(r11, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r11, c1, hole, 119.0).
opencv_contour_hierarchy(r11, c1, next(none), previous(none), child(none), parent(c0)).
opencv_morphology(r12, opening_area(96), closing_area(132), gradient_area(76)).
opencv_shape_metrics(r12, contour_area(81.0), hull_area(81.0), solidity(1.0), circularity(0.785398), extent(0.81), aspect_ratio(1.0)).
opencv_contour(r12, c0, outer, 81.0).
opencv_contour_hierarchy(r12, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r13, opening_area(796), closing_area(912), gradient_area(236)).
opencv_shape_metrics(r13, contour_area(741.0), hull_area(741.0), solidity(1.0), circularity(0.69201), extent(0.92625), aspect_ratio(2.0)).
opencv_contour(r13, c0, outer, 741.0).
opencv_contour_hierarchy(r13, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r14, opening_area(7596), closing_area(8392), gradient_area(1596)).
opencv_shape_metrics(r14, contour_area(7201.0), hull_area(7201.0), solidity(1.0), circularity(0.142816), extent(0.9475), aspect_ratio(19.0)).
opencv_contour(r14, c0, outer, 7201.0).
opencv_contour_hierarchy(r14, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r15, opening_area(396), closing_area(472), gradient_area(156)).
opencv_shape_metrics(r15, contour_area(361.0), hull_area(361.0), solidity(1.0), circularity(0.785398), extent(0.9025), aspect_ratio(1.0)).
opencv_contour(r15, c0, outer, 361.0).
opencv_contour_hierarchy(r15, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r16, opening_area(396), closing_area(472), gradient_area(156)).
opencv_shape_metrics(r16, contour_area(361.0), hull_area(361.0), solidity(1.0), circularity(0.785398), extent(0.9025), aspect_ratio(1.0)).
opencv_contour(r16, c0, outer, 361.0).
opencv_contour_hierarchy(r16, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r17, opening_area(396), closing_area(472), gradient_area(156)).
opencv_shape_metrics(r17, contour_area(361.0), hull_area(361.0), solidity(1.0), circularity(0.785398), extent(0.9025), aspect_ratio(1.0)).
opencv_contour(r17, c0, outer, 361.0).
opencv_contour_hierarchy(r17, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r2, 1).
opencv_watershed_segment(r2, ws1, 27312, centroid(191,57)).
opencv_watershed_count(r3, 2).
opencv_watershed_segment(r3, ws1, 1671, centroid(152,61)).
opencv_watershed_segment(r3, ws2, 20814, centroid(162,161)).
opencv_watershed_count(r4, 1).
opencv_watershed_segment(r4, ws1, 864, centroid(214,60)).
opencv_watershed_count(r5, 1).
opencv_watershed_segment(r5, ws1, 13801, centroid(328,120)).
opencv_watershed_count(r6, 1).
opencv_watershed_segment(r6, ws1, 644, centroid(114,74)).
opencv_watershed_count(r8, 1).
opencv_watershed_segment(r8, ws1, 64, centroid(114,74)).
opencv_watershed_count(r9, 1).
opencv_watershed_segment(r9, ws1, 1344, centroid(214,84)).
opencv_watershed_count(r10, 1).
opencv_watershed_segment(r10, ws1, 14307, centroid(248,191)).
opencv_watershed_count(r11, 1).
opencv_watershed_segment(r11, ws1, 547, centroid(313,223)).
opencv_watershed_count(r12, 1).
opencv_watershed_segment(r12, ws1, 64, centroid(314,224)).
opencv_watershed_count(r13, 1).
opencv_watershed_segment(r13, ws1, 684, centroid(150,620)).
opencv_watershed_count(r14, 1).
opencv_watershed_segment(r14, ws1, 6804, centroid(360,620)).
opencv_watershed_count(r15, 1).
opencv_watershed_segment(r15, ws1, 324, centroid(570,620)).
opencv_watershed_count(r16, 1).
opencv_watershed_segment(r16, ws1, 324, centroid(600,620)).
opencv_watershed_count(r17, 1).
opencv_watershed_segment(r17, ws1, 324, centroid(630,620)).
