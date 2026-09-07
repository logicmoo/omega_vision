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

region(r1, '#aaaaaa', 309400, centroid(365,339)).
perimeter(r1, 4980).
polygon(r1, [xy(150,419),xy(150,410),xy(189,410),xy(190,400),xy(209,400),xy(210,390),xy(220,389),xy(220,380),xy(239,380),xy(240,370),xy(249,370),xy(250,360),xy(259,360),xy(260,350),xy(270,349),xy(270,330),xy(279,330),xy(280,320),xy(290,319),xy(290,300),xy(300,299),xy(300,260),xy(310,259),xy(310,180),xy(300,179),xy(300,140),xy(290,139),xy(290,120),xy(280,120),xy(280,110),xy(270,109),xy(270,90),xy(260,90),xy(260,80),xy(250,80),xy(250,70),xy(240,69),xy(239,60),xy(220,60),xy(220,50),xy(210,50),xy(209,40),xy(190,40),xy(189,30),xy(150,30),xy(149,20),xy(70,20),xy(69,30),xy(40,30),xy(40,409),xy(69,410),xy(70,420),xy(150,419)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(20,20),xy(20,417),xy(27,434),xy(42,451),xy(55,473),xy(97,517),xy(84,538),xy(70,569),xy(92,602),xy(120,630),xy(130,635),xy(549,635),xy(555,632),xy(554,529),xy(556,526),xy(450,420),xy(383,455),xy(369,459),xy(366,462),xy(322,480),xy(281,492),xy(208,419),xy(279,492),xy(263,498),xy(217,508),xy(213,508),xy(186,481),xy(177,449),xy(169,434),xy(171,434)]).
midline(r1, [xy(211,508),xy(187,484)]).
midline(r1, [xy(188,487),xy(208,509),xy(193,509),xy(168,514),xy(130,514),xy(98,517)]).
midline(r1, [xy(186,474),xy(187,476)]).
midline(r1, [xy(555,633),xy(578,635),xy(585,632),xy(585,555),xy(557,527)]).
midline(r1, [xy(450,419),xy(458,385),xy(368,295),xy(356,293),xy(335,284),xy(333,286),xy(335,288),xy(340,288)]).
midline(r1, [xy(372,297),xy(458,383),xy(460,380),xy(376,298)]).
midline(r1, [xy(460,378),xy(466,351),xy(474,284),xy(475,183),xy(474,165),xy(457,150),xy(395,102),xy(349,74),xy(332,67),xy(309,53),xy(263,34),xy(232,27),xy(221,21),xy(207,20),xy(189,14),xy(164,15),xy(149,9),xy(71,9),xy(64,10),xy(55,15),xy(33,15),xy(22,20)]).
midline(r1, [xy(398,106),xy(358,146),xy(348,149),xy(345,147),xy(332,154),xy(332,156)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,632),xy(609,635),xy(585,633)]).
midline(r1, [xy(405,112),xy(375,142),xy(369,143),xy(365,141),xy(361,145)]).
midline(r1, [xy(368,144),xy(364,144)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(339,153),xy(345,149),xy(345,151)]).
midline(r1, [xy(349,150),xy(351,149)]).
midline(r1, [xy(300,81),xy(320,61),xy(303,80)]).
midline(r1, [xy(391,119),xy(390,120)]).
midline(r1, [xy(398,112),xy(397,113)]).
midline(r1, [xy(401,109),xy(400,110)]).
fillpoint(r1, xy(450,420), 190.0).
fillpoint(r1, xy(452,413), 188.0).
fillpoint(r1, xy(453,409), 187.0).
fillpoint(r1, xy(454,405), 186.0).
fillpoint(r1, xy(455,401), 185.0).
fillpoint(r1, xy(456,397), 184.0).
fillpoint(r1, xy(457,392), 183.0).
fillpoint(r1, xy(458,388), 182.0).
fillpoint(r1, xy(459,384), 181.0).
fillpoint(r1, xy(460,380), 180.0).
fillpoint(r1, xy(461,376), 179.0).
fillpoint(r1, xy(462,371), 178.0).
fillpoint(r1, xy(463,366), 177.0).
fillpoint(r1, xy(464,361), 176.0).
fillpoint(r1, xy(465,356), 175.0).
fillpoint(r1, xy(466,349), 174.0).
fillpoint(r1, xy(467,342), 173.0).
fillpoint(r1, xy(468,333), 172.0).
fillpoint(r1, xy(469,322), 171.0).
fillpoint(r1, xy(470,315), 170.0).
fillpoint(r1, xy(471,309), 169.0).
fillpoint(r1, xy(472,301), 168.0).
fillpoint(r1, xy(473,293), 167.0).
fillpoint(r1, xy(474,281), 166.0).
fillpoint(r1, xy(474,165), 165.7).
fillpoint(r1, xy(474,220), 165.0).
fillpoint(r1, xy(358,465), 145.0).
fillpoint(r1, xy(321,480), 130.0).
fillpoint(r1, xy(318,481), 129.0).
fillpoint(r1, xy(315,482), 128.0).
fillpoint(r1, xy(312,483), 127.0).
fillpoint(r1, xy(309,484), 126.0).
fillpoint(r1, xy(302,486), 124.0).
fillpoint(r1, xy(298,487), 123.0).
fillpoint(r1, xy(294,488), 122.0).
fillpoint(r1, xy(290,489), 121.0).
fillpoint(r1, xy(269,496), 114.0).
fillpoint(r1, xy(262,498), 112.0).
fillpoint(r1, xy(258,499), 111.0).
fillpoint(r1, xy(253,500), 110.0).
fillpoint(r1, xy(248,501), 109.0).
fillpoint(r1, xy(244,502), 108.0).
fillpoint(r1, xy(232,505), 105.0).
fillpoint(r1, xy(228,506), 104.0).
fillpoint(r1, xy(222,507), 103.0).
fillpoint(r1, xy(215,508), 102.0).
fillpoint(r1, xy(206,509), 101.0).
fillpoint(r1, xy(191,510), 100.0).
fillpoint(r1, xy(186,511), 99.0).
fillpoint(r1, xy(181,512), 98.0).
fillpoint(r1, xy(98,517), 98.0).
fillpoint(r1, xy(174,513), 97.0).
fillpoint(r1, xy(105,516), 97.0).
fillpoint(r1, xy(165,514), 96.0).
fillpoint(r1, xy(114,515), 96.0).
fillpoint(r1, xy(131,515), 95.0).
border(r1).
region(r2, '#ffdc00', 22200, centroid(74,196)).
perimeter(r2, 1140).
polygon(r2, [xy(89,420),xy(70,420),xy(69,410),xy(40,409),xy(40,30),xy(69,30),xy(70,20),xy(149,20),xy(150,30),xy(189,30),xy(190,40),xy(209,40),xy(210,49),xy(90,50),xy(89,420)]).
midline(r2, [xy(77,42),xy(64,54),xy(64,385),xy(75,396),xy(80,410)]).
midline(r2, [xy(78,41),xy(84,34),xy(135,34),xy(144,39),xy(180,39),xy(190,45),xy(205,45)]).
fillpoint(r2, xy(64,220), 25.0).
fillpoint(r2, xy(84,35), 16.0).
fillpoint(r2, xy(91,35), 15.0).
fillpoint(r2, xy(145,39), 11.0).
fillpoint(r2, xy(79,405), 11.0).
fillpoint(r2, xy(151,40), 10.0).
region(r9, '#2ecc40', 22100, centroid(175,318)).
perimeter(r9, 1120).
polygon(r9, [xy(149,420),xy(130,420),xy(129,410),xy(100,410),xy(99,420),xy(90,419),xy(90,250),xy(289,250),xy(290,200),xy(309,200),xy(310,209),xy(300,210),xy(300,239),xy(310,240),xy(310,259),xy(300,260),xy(299,300),xy(140,300),xy(140,350),xy(240,350),xy(239,380),xy(220,380),xy(220,389),xy(210,390),xy(209,400),xy(190,400),xy(189,410),xy(150,410),xy(149,420)]).
midline(r9, [xy(250,274),xy(140,274),xy(119,279),xy(114,301),xy(114,349),xy(116,363),xy(122,377),xy(96,404),xy(95,415)]).
midline(r9, [xy(251,275),xy(275,275)]).
midline(r9, [xy(276,273),xy(300,249),xy(296,245),xy(294,238),xy(294,211),xy(295,205),xy(305,205)]).
midline(r9, [xy(123,377),xy(139,381),xy(167,380),xy(180,375),xy(190,376)]).
midline(r9, [xy(140,382),xy(140,410)]).
midline(r9, [xy(191,374),xy(213,365),xy(225,365)]).
fillpoint(r9, xy(122,377), 33.0).
fillpoint(r9, xy(126,378), 32.0).
fillpoint(r9, xy(131,379), 31.1).
fillpoint(r9, xy(138,380), 31.1).
fillpoint(r9, xy(142,380), 31.0).
fillpoint(r9, xy(168,379), 30.0).
fillpoint(r9, xy(119,279), 29.7).
fillpoint(r9, xy(121,278), 29.0).
fillpoint(r9, xy(118,281), 29.0).
fillpoint(r9, xy(118,368), 29.0).
fillpoint(r9, xy(171,378), 29.0).
fillpoint(r9, xy(124,277), 28.0).
fillpoint(r9, xy(117,284), 28.0).
fillpoint(r9, xy(117,365), 28.0).
fillpoint(r9, xy(174,377), 28.0).
fillpoint(r9, xy(127,276), 27.0).
fillpoint(r9, xy(116,287), 27.0).
fillpoint(r9, xy(116,362), 27.0).
fillpoint(r9, xy(177,376), 27.0).
fillpoint(r9, xy(132,275), 26.0).
fillpoint(r9, xy(115,292), 26.0).
fillpoint(r9, xy(115,358), 26.0).
fillpoint(r9, xy(182,375), 26.0).
fillpoint(r9, xy(141,275), 25.0).
fillpoint(r9, xy(114,325), 25.0).
fillpoint(r9, xy(214,365), 16.0).
fillpoint(r9, xy(221,365), 15.0).
fillpoint(r9, xy(299,250), 10.0).
region(r3, '#2ecc40', 22000, centroid(168,126)).
perimeter(r3, 780).
polygon(r3, [xy(239,200),xy(90,199),xy(90,50),xy(219,50),xy(220,60),xy(239,60),xy(240,69),xy(249,70),xy(250,79),xy(259,80),xy(260,89),xy(270,90),xy(269,100),xy(240,100),xy(239,200)]).
hole(r3, [xy(130,89),xy(129,60),xy(100,60),xy(100,90),xy(130,89)]).
midline(r3, [xy(205,92),xy(192,99),xy(190,98),xy(191,89),xy(200,74),xy(199,71),xy(201,71)]).
midline(r3, [xy(190,99),xy(183,105),xy(133,55),xy(95,55),xy(94,89),xy(99,99),xy(145,144),xy(175,135)]).
midline(r3, [xy(176,133),xy(183,106)]).
midline(r3, [xy(206,92),xy(217,84),xy(217,86)]).
midline(r3, [xy(219,85),xy(235,84),xy(244,89),xy(250,89),xy(256,94),xy(265,95)]).
fillpoint(r3, xy(175,135), 65.0).
fillpoint(r3, xy(178,127), 62.0).
fillpoint(r3, xy(167,138), 62.0).
fillpoint(r3, xy(179,124), 61.0).
fillpoint(r3, xy(164,139), 61.0).
fillpoint(r3, xy(180,121), 60.0).
fillpoint(r3, xy(161,140), 60.0).
fillpoint(r3, xy(181,117), 59.0).
fillpoint(r3, xy(157,141), 59.0).
fillpoint(r3, xy(182,113), 58.0).
fillpoint(r3, xy(153,142), 58.0).
fillpoint(r3, xy(183,108), 57.0).
fillpoint(r3, xy(148,143), 57.0).
region(r6, '#ffdc00', 12900, centroid(237,196)).
perimeter(r6, 640).
polygon(r6, [xy(289,250),xy(140,249),xy(140,200),xy(240,199),xy(240,100),xy(269,100),xy(270,109),xy(279,110),xy(280,119),xy(290,120),xy(290,149),xy(300,150),xy(300,179),xy(310,180),xy(310,199),xy(290,200),xy(289,250)]).
midline(r6, [xy(263,210),xy(259,221),xy(248,224),xy(164,225)]).
midline(r6, [xy(264,209),xy(265,190),xy(270,172),xy(265,159),xy(265,140),xy(255,114)]).
midline(r6, [xy(271,177),xy(289,187),xy(300,190)]).
fillpoint(r6, xy(269,175), 30.0).
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
fillpoint(r6, xy(264,144), 25.0).
fillpoint(r6, xy(164,225), 25.0).
fillpoint(r6, xy(255,115), 16.0).
fillpoint(r6, xy(295,189), 11.0).
region(r12, '#ffdc00', 7300, centroid(211,325)).
perimeter(r12, 440).
polygon(r12, [xy(249,370),xy(240,369),xy(239,350),xy(140,350),xy(140,300),xy(289,300),xy(290,319),xy(280,320),xy(279,330),xy(270,330),xy(270,349),xy(260,350),xy(260,359),xy(250,360),xy(249,370)]).
midline(r12, [xy(201,325),xy(164,325)]).
midline(r12, [xy(202,324),xy(245,325),xy(250,333),xy(250,350),xy(245,356),xy(245,365)]).
midline(r12, [xy(246,324),xy(257,317),xy(274,310),xy(280,310)]).
fillpoint(r12, xy(245,325), 25.5).
fillpoint(r12, xy(164,325), 25.0).
fillpoint(r12, xy(264,315), 16.0).
fillpoint(r12, xy(275,310), 11.0).
region(r16, '#5a5a5a', 7200, centroid(370,620)).
perimeter(r16, 760).
polygon(r16, [xy(549,630),xy(190,630),xy(190,610),xy(549,610),xy(549,630)]).
midline(r16, [xy(364,619),xy(199,620)]).
midline(r16, [xy(365,619),xy(540,620)]).
fillpoint(r16, xy(199,620), 10.0).
region(r11, '#870c25', 1500, centroid(114,234)).
perimeter(r11, 160).
polygon(r11, [xy(139,250),xy(90,250),xy(90,220),xy(139,220),xy(139,250)]).
midline(r11, [xy(110,235),xy(104,235)]).
midline(r11, [xy(111,234),xy(125,235)]).
fillpoint(r11, xy(104,235), 15.0).
region(r15, '#2ecc40', 1200, centroid(160,620)).
perimeter(r15, 160).
polygon(r15, [xy(189,630),xy(130,630),xy(130,610),xy(189,610),xy(189,630)]).
midline(r15, [xy(160,620),xy(139,620)]).
midline(r15, [xy(161,619),xy(180,620)]).
fillpoint(r15, xy(139,620), 10.0).
region(r8, '#bebebe', 1000, centroid(114,210)).
perimeter(r8, 140).
polygon(r8, [xy(139,220),xy(90,220),xy(90,200),xy(139,200),xy(139,220)]).
midline(r8, [xy(109,210),xy(99,210)]).
midline(r8, [xy(110,209),xy(130,210)]).
fillpoint(r8, xy(99,210), 10.0).
region(r4, '#5a5a5a', 800, centroid(114,74)).
perimeter(r4, 160).
polygon(r4, [xy(129,90),xy(100,89),xy(100,60),xy(130,60),xy(129,90)]).
hole(r4, [xy(120,79),xy(119,70),xy(110,70),xy(110,80),xy(120,79)]).
midline(r4, [xy(105,77),xy(105,65),xy(124,65),xy(124,83),xy(119,85),xy(106,84),xy(104,78)]).
fillpoint(r4, xy(106,65), 6.0).
fillpoint(r4, xy(124,65), 6.0).
fillpoint(r4, xy(105,84), 6.0).
fillpoint(r4, xy(123,84), 6.0).
fillpoint(r4, xy(111,65), 5.0).
fillpoint(r4, xy(104,75), 5.0).
fillpoint(r4, xy(124,75), 5.0).
fillpoint(r4, xy(111,85), 5.0).
region(r17, '#7fdbff', 400, centroid(570,620)).
perimeter(r17, 80).
polygon(r17, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r17, [xy(569,619),xy(570,620)]).
fillpoint(r17, xy(569,620), 10.0).
region(r18, '#7fdbff', 400, centroid(600,620)).
perimeter(r18, 80).
polygon(r18, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r18, [xy(599,619),xy(600,620)]).
fillpoint(r18, xy(599,620), 10.0).
region(r19, '#2ecc40', 400, centroid(630,620)).
perimeter(r19, 80).
polygon(r19, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r19, [xy(629,619),xy(630,620)]).
fillpoint(r19, xy(629,620), 10.0).
border(r19).
region(r5, '#2ecc40', 100, centroid(114,74)).
perimeter(r5, 40).
polygon(r5, [xy(119,80),xy(110,79),xy(110,70),xy(120,70),xy(119,80)]).
midline(r5, [xy(115,75),xy(115,74)]).
fillpoint(r5, xy(114,75), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 650).
adjacent(r1, r3).
shared_edge(r1, r3, 110).
adjacent(r1, r6).
shared_edge(r1, r6, 120).
adjacent(r1, r9).
shared_edge(r1, r9, 260).
adjacent(r1, r12).
shared_edge(r1, r12, 120).
adjacent(r1, r15).
shared_edge(r1, r15, 140).
adjacent(r1, r16).
shared_edge(r1, r16, 740).
adjacent(r1, r17).
shared_edge(r1, r17, 80).
adjacent(r1, r18).
shared_edge(r1, r18, 80).
adjacent(r1, r19).
shared_edge(r1, r19, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 270).
adjacent(r2, r8).
shared_edge(r2, r8, 20).
adjacent(r2, r9).
shared_edge(r2, r9, 170).
adjacent(r2, r11).
shared_edge(r2, r11, 30).
adjacent(r3, r4).
shared_edge(r3, r4, 120).
adjacent(r3, r6).
shared_edge(r3, r6, 230).
adjacent(r3, r8).
shared_edge(r3, r8, 50).
adjacent(r4, r5).
shared_edge(r4, r5, 40).
adjacent(r6, r8).
shared_edge(r6, r8, 20).
adjacent(r6, r9).
shared_edge(r6, r9, 220).
adjacent(r6, r11).
shared_edge(r6, r11, 30).
adjacent(r8, r11).
shared_edge(r8, r11, 50).
adjacent(r9, r11).
shared_edge(r9, r11, 50).
adjacent(r9, r12).
shared_edge(r9, r12, 320).
adjacent(r15, r16).
shared_edge(r15, r16, 20).

encloses(r4, r5).
encloses(r1, r17).
encloses(r1, r18).
