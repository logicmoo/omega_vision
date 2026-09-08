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
img_size(200, 298).

region(r1, '#010000', 44977, centroid(99,143)).
perimeter(r1, 2082).
polygon(r1, [xy(134,280),xy(180,276),xy(192,270),xy(194,265),xy(189,260),xy(171,254),xy(116,251),xy(116,229),xy(114,228),xy(123,228),xy(128,225),xy(128,215),xy(132,204),xy(136,203),xy(132,187),xy(126,175),xy(126,168),xy(128,167),xy(126,155),xy(124,149),xy(112,136),xy(108,117),xy(116,114),xy(116,108),xy(112,105),xy(112,97),xy(122,43),xy(116,46),xy(113,40),xy(109,44),xy(107,36),xy(102,42),xy(99,34),xy(94,40),xy(91,32),xy(86,38),xy(83,32),xy(78,38),xy(74,32),xy(71,38),xy(67,34),xy(63,38),xy(58,34),xy(58,75),xy(56,74),xy(52,76),xy(52,81),xy(48,87),xy(48,96),xy(52,101),xy(54,107),xy(50,124),xy(59,128),xy(78,128),xy(76,131),xy(86,138),xy(82,149),xy(76,153),xy(74,159),xy(76,163),xy(74,177),xy(68,194),xy(68,199),xy(70,200),xy(70,202),xy(74,209),xy(72,212),xy(72,222),xy(82,225),xy(80,248),xy(76,248),xy(76,251),xy(80,253),xy(71,256),xy(62,267),xy(70,274),xy(83,278),xy(134,280)]).
hole(r1, [xy(48,90),xy(47,88),xy(48,90)]).
midline(r1, [xy(78,130),xy(75,130),xy(63,145),xy(38,160),xy(31,150),xy(25,131),xy(26,109),xy(23,83),xy(29,58),xy(29,29),xy(39,21),xy(49,17),xy(78,15),xy(81,17),xy(81,20),xy(79,27),xy(73,33),xy(63,24),xy(64,18)]).
midline(r1, [xy(109,117),xy(116,123),xy(124,126),xy(115,114),xy(131,97),xy(136,97),xy(122,110)]).
midline(r1, [xy(31,34),xy(60,34),xy(63,26)]).
midline(r1, [xy(80,248),xy(67,236),xy(48,238),xy(36,234),xy(36,216),xy(33,199),xy(37,168),xy(36,161)]).
midline(r1, [xy(37,237),xy(31,255),xy(30,267),xy(51,281),xy(65,270)]).
midline(r1, [xy(54,282),xy(66,286),xy(100,289),xy(154,289),xy(187,286),xy(196,272),xy(197,263),xy(186,244),xy(165,220),xy(155,224),xy(147,232),xy(131,239),xy(127,239),xy(116,228),xy(114,228)]).
midline(r1, [xy(94,39),xy(98,23),xy(103,18),xy(82,16)]).
midline(r1, [xy(87,18),xy(86,37)]).
midline(r1, [xy(165,219),xy(167,214),xy(167,185),xy(164,169),xy(129,172)]).
midline(r1, [xy(109,43),xy(111,36),xy(125,22),xy(104,17)]).
midline(r1, [xy(112,20),xy(106,24),xy(102,41)]).
midline(r1, [xy(104,19),xy(100,23)]).
midline(r1, [xy(108,24),xy(110,22)]).
midline(r1, [xy(126,21),xy(133,23),xy(120,36),xy(116,46)]).
midline(r1, [xy(134,23),xy(151,31),xy(160,39),xy(161,43),xy(156,93),xy(137,96)]).
midline(r1, [xy(28,68),xy(48,88),xy(48,91),xy(27,109)]).
midline(r1, [xy(126,126),xy(142,128),xy(158,123),xy(156,95)]).
midline(r1, [xy(158,125),xy(163,151),xy(163,167)]).
midline(r1, [xy(59,239),xy(69,249)]).
midline(r1, [xy(71,249),xy(74,252),xy(79,253)]).
midline(r1, [xy(81,225),xy(68,235)]).
midline(r1, [xy(82,149),xy(76,142),xy(67,143)]).
midline(r1, [xy(38,240),xy(64,265)]).
midline(r1, [xy(70,34),xy(71,38)]).
midline(r1, [xy(30,59),xy(32,58),xy(33,61),xy(44,64),xy(51,68),xy(52,71),xy(54,70),xy(57,74),xy(56,75),xy(53,72)]).
midline(r1, [xy(70,200),xy(59,210),xy(46,213),xy(43,216),xy(39,215),xy(37,217),xy(41,217)]).
midline(r1, [xy(49,214),xy(48,215)]).
midline(r1, [xy(45,216),xy(46,215)]).
midline(r1, [xy(61,210),xy(62,209)]).
fillpoint(r1, xy(156,94), 43.3).
fillpoint(r1, xy(157,87), 43.0).
fillpoint(r1, xy(157,98), 43.0).
fillpoint(r1, xy(157,124), 42.2).
fillpoint(r1, xy(158,76), 42.0).
fillpoint(r1, xy(158,114), 42.0).
fillpoint(r1, xy(159,65), 41.0).
fillpoint(r1, xy(159,129), 41.0).
fillpoint(r1, xy(160,55), 40.0).
fillpoint(r1, xy(160,133), 40.0).
fillpoint(r1, xy(160,39), 39.2).
fillpoint(r1, xy(161,44), 39.0).
fillpoint(r1, xy(161,139), 39.0).
fillpoint(r1, xy(162,145), 38.0).
fillpoint(r1, xy(37,236), 37.6).
fillpoint(r1, xy(37,167), 37.5).
fillpoint(r1, xy(163,155), 37.0).
fillpoint(r1, xy(36,160), 37.0).
fillpoint(r1, xy(36,171), 37.0).
fillpoint(r1, xy(36,232), 37.0).
fillpoint(r1, xy(163,168), 36.0).
fillpoint(r1, xy(164,170), 36.0).
fillpoint(r1, xy(35,177), 36.0).
fillpoint(r1, xy(36,218), 36.0).
fillpoint(r1, xy(165,175), 35.0).
fillpoint(r1, xy(34,184), 35.0).
fillpoint(r1, xy(34,209), 35.0).
fillpoint(r1, xy(166,181), 34.0).
fillpoint(r1, xy(33,197), 34.0).
fillpoint(r1, xy(166,218), 34.0).
fillpoint(r1, xy(165,220), 34.0).
fillpoint(r1, xy(33,248), 34.0).
fillpoint(r1, xy(167,190), 33.0).
fillpoint(r1, xy(167,213), 33.0).
fillpoint(r1, xy(32,252), 33.0).
fillpoint(r1, xy(31,257), 32.0).
fillpoint(r1, xy(31,267), 31.0).
fillpoint(r1, xy(29,29), 29.3).
fillpoint(r1, xy(29,34), 29.0).
fillpoint(r1, xy(29,48), 29.0).
fillpoint(r1, xy(27,65), 28.0).
fillpoint(r1, xy(26,71), 27.0).
fillpoint(r1, xy(26,135), 27.0).
fillpoint(r1, xy(26,109), 26.4).
fillpoint(r1, xy(25,75), 26.0).
fillpoint(r1, xy(25,107), 26.0).
fillpoint(r1, xy(25,121), 26.0).
fillpoint(r1, xy(24,79), 25.0).
fillpoint(r1, xy(24,101), 25.0).
fillpoint(r1, xy(23,90), 24.0).
fillpoint(r1, xy(131,22), 23.0).
fillpoint(r1, xy(126,21), 22.0).
fillpoint(r1, xy(121,20), 21.0).
fillpoint(r1, xy(116,19), 20.0).
fillpoint(r1, xy(110,18), 19.0).
fillpoint(r1, xy(102,17), 18.0).
fillpoint(r1, xy(60,16), 17.0).
fillpoint(r1, xy(88,16), 17.0).
fillpoint(r1, xy(73,15), 16.0).
fillpoint(r1, xy(129,239), 13.0).
fillpoint(r1, xy(63,285), 13.0).
fillpoint(r1, xy(186,286), 12.0).
fillpoint(r1, xy(68,286), 12.0).
fillpoint(r1, xy(77,287), 11.0).
fillpoint(r1, xy(177,287), 11.0).
border(r1).
region(r11, '#fad123', 4271, centroid(88,84)).
perimeter(r11, 642).
polygon(r11, [xy(100,142),xy(87,142),xy(86,136),xy(78,132),xy(99,128),xy(98,124),xy(83,128),xy(62,128),xy(57,128),xy(52,123),xy(54,110),xy(64,111),xy(57,110),xy(54,106),xy(55,102),xy(71,102),xy(80,108),xy(87,108),xy(94,106),xy(100,97),xy(100,90),xy(95,80),xy(85,76),xy(71,80),xy(67,78),xy(58,76),xy(60,75),xy(59,36),xy(63,40),xy(66,34),xy(71,40),xy(74,34),xy(78,40),xy(83,34),xy(86,40),xy(91,34),xy(94,42),xy(99,36),xy(102,44),xy(107,38),xy(108,44),xy(114,42),xy(116,46),xy(120,46),xy(112,99),xy(110,103),xy(106,105),xy(108,111),xy(110,110),xy(111,114),xy(112,110),xy(114,109),xy(113,116),xy(106,116),xy(110,118),xy(110,137),xy(100,142)]).
midline(r11, [xy(112,52),xy(97,61),xy(82,57),xy(77,58),xy(60,41),xy(59,37)]).
midline(r11, [xy(114,109),xy(113,111),xy(112,110)]).
midline(r11, [xy(58,76),xy(60,76),xy(77,59)]).
midline(r11, [xy(79,132),xy(86,132),xy(92,136),xy(102,134),xy(105,130),xy(104,122),xy(97,115),xy(88,118),xy(73,117),xy(68,120),xy(61,120),xy(54,110)]).
midline(r11, [xy(74,53),xy(74,34)]).
midline(r11, [xy(111,50),xy(113,43)]).
midline(r11, [xy(100,58),xy(103,55),xy(107,39)]).
midline(r11, [xy(66,35),xy(68,47)]).
midline(r11, [xy(99,61),xy(98,63),xy(105,78),xy(106,96),xy(97,114)]).
midline(r11, [xy(101,112),xy(111,115),xy(114,112)]).
midline(r11, [xy(59,106),xy(68,107),xy(73,116)]).
midline(r11, [xy(91,58),xy(95,54),xy(98,40)]).
midline(r11, [xy(82,34),xy(83,56),xy(87,52),xy(90,38)]).
fillpoint(r11, xy(80,58), 19.1).
fillpoint(r11, xy(77,58), 19.0).
fillpoint(r11, xy(84,58), 19.0).
fillpoint(r11, xy(94,60), 18.7).
fillpoint(r11, xy(97,61), 18.7).
fillpoint(r11, xy(90,59), 18.4).
fillpoint(r11, xy(74,118), 11.0).
fillpoint(r11, xy(97,115), 10.0).
fillpoint(r11, xy(84,118), 10.0).
fillpoint(r11, xy(70,119), 10.0).
fillpoint(r11, xy(92,116), 9.4).
fillpoint(r11, xy(90,117), 9.4).
fillpoint(r11, xy(105,79), 9.0).
fillpoint(r11, xy(67,120), 9.0).
fillpoint(r11, xy(60,119), 8.0).
fillpoint(r11, xy(98,135), 7.6).
fillpoint(r11, xy(102,134), 7.3).
fillpoint(r11, xy(92,136), 7.0).
fillpoint(r11, xy(103,121), 6.4).
fillpoint(r11, xy(105,99), 6.1).
fillpoint(r11, xy(106,94), 6.0).
fillpoint(r11, xy(102,103), 5.4).
region(r1023, '#dcd5d2', 1682, centroid(153,266)).
perimeter(r1023, 240).
polygon(r1023, [xy(134,280),xy(108,279),xy(124,275),xy(124,267),xy(120,252),xy(171,254),xy(189,260),xy(194,265),xy(192,270),xy(180,276),xy(134,280)]).
midline(r1023, [xy(120,252),xy(138,266),xy(126,278),xy(109,279)]).
midline(r1023, [xy(139,266),xy(183,266)]).
fillpoint(r1023, xy(144,266), 14.0).
fillpoint(r1023, xy(158,266), 13.0).
fillpoint(r1023, xy(166,266), 12.0).
region(r539, '#e84d28', 1544, centroid(89,176)).
perimeter(r539, 226).
polygon(r539, [xy(101,204),xy(80,204),xy(82,202),xy(70,199),xy(68,192),xy(78,173),xy(84,145),xy(99,144),xy(110,140),xy(102,149),xy(100,158),xy(100,167),xy(104,169),xy(101,204)]).
midline(r539, [xy(110,140),xy(108,143),xy(107,142),xy(91,154),xy(89,165),xy(90,180),xy(87,187),xy(90,193),xy(87,199),xy(83,203),xy(80,203)]).
fillpoint(r539, xy(88,185), 15.2).
fillpoint(r539, xy(87,187), 15.2).
fillpoint(r539, xy(89,183), 14.9).
fillpoint(r539, xy(90,179), 14.0).
fillpoint(r539, xy(90,162), 10.0).
fillpoint(r539, xy(91,155), 9.5).
region(r815, '#0696cd', 893, centroid(104,215)).
perimeter(r815, 222).
polygon(r815, [xy(121,228),xy(97,228),xy(95,220),xy(79,214),xy(72,203),xy(100,204),xy(101,206),xy(117,212),xy(120,212),xy(120,206),xy(131,206),xy(132,208),xy(126,215),xy(126,225),xy(121,228)]).
hole(r815, [xy(100,219),xy(97,206),xy(96,215),xy(100,219)]).
midline(r815, [xy(120,220),xy(109,219),xy(97,204),xy(89,211),xy(78,207)]).
midline(r815, [xy(120,218),xy(125,210)]).
midline(r815, [xy(108,219),xy(105,222),xy(99,223),xy(90,212)]).
midline(r815, [xy(99,204),xy(100,204)]).
fillpoint(r815, xy(109,219), 8.9).
fillpoint(r815, xy(116,220), 8.0).
fillpoint(r815, xy(89,211), 7.6).
fillpoint(r815, xy(81,208), 5.0).
fillpoint(r815, xy(124,211), 5.0).
fillpoint(r815, xy(102,223), 5.0).
fillpoint(r815, xy(97,220), 2.2).
region(r698, '#f2c726', 677, centroid(112,186)).
perimeter(r698, 126).
polygon(r698, [xy(117,210),xy(102,204),xy(106,166),xy(122,167),xy(122,182),xy(117,210)]).
midline(r698, [xy(110,199),xy(114,173)]).
fillpoint(r698, xy(113,179), 8.9).
fillpoint(r698, xy(112,186), 8.5).
fillpoint(r698, xy(111,195), 8.2).
fillpoint(r698, xy(113,174), 8.0).
fillpoint(r698, xy(112,191), 8.0).
fillpoint(r698, xy(111,198), 8.0).
region(r183, '#fbfbf9', 589, centroid(83,93)).
perimeter(r183, 128).
polygon(r183, [xy(86,106),xy(76,104),xy(70,95),xy(72,85),xy(82,78),xy(92,82),xy(98,90),xy(96,100),xy(86,106)]).
hole(r183, [xy(88,94),xy(88,90),xy(84,92),xy(85,94),xy(88,94)]).
midline(r183, [xy(89,86),xy(83,85),xy(78,89),xy(77,95),xy(82,100),xy(88,100),xy(92,97),xy(93,91),xy(90,86)]).
fillpoint(r183, xy(78,89), 7.6).
fillpoint(r183, xy(77,93), 7.6).
fillpoint(r183, xy(78,96), 7.3).
fillpoint(r183, xy(79,98), 7.1).
fillpoint(r183, xy(84,85), 6.3).
fillpoint(r183, xy(83,100), 6.3).
fillpoint(r183, xy(86,100), 6.0).
fillpoint(r183, xy(89,86), 5.1).
fillpoint(r183, xy(91,87), 5.0).
fillpoint(r183, xy(93,93), 5.0).
fillpoint(r183, xy(91,98), 5.0).
fillpoint(r183, xy(92,89), 4.5).
fillpoint(r183, xy(92,96), 4.5).
region(r577, '#ec4f2a', 389, centroid(114,155)).
perimeter(r577, 96).
polygon(r577, [xy(126,166),xy(122,164),xy(102,164),xy(104,152),xy(110,144),xy(116,144),xy(122,150),xy(126,166)]).
midline(r577, [xy(126,165),xy(119,157),xy(113,154)]).
fillpoint(r577, xy(113,154), 9.4).
region(r171, '#fcfcfb', 346, centroid(59,89)).
perimeter(r171, 110).
polygon(r171, [xy(52,100),xy(48,94),xy(52,83),xy(59,78),xy(68,80),xy(70,83),xy(68,90),xy(70,99),xy(54,98),xy(52,100)]).
hole(r171, [xy(62,93),xy(62,90),xy(58,91),xy(59,94),xy(62,93)]).
midline(r171, [xy(69,99),xy(65,96),xy(57,96),xy(53,92),xy(59,84),xy(64,85),xy(65,95)]).
midline(r171, [xy(54,95),xy(52,100)]).
fillpoint(r171, xy(62,84), 5.8).
fillpoint(r171, xy(58,85), 5.4).
fillpoint(r171, xy(64,85), 5.4).
fillpoint(r171, xy(56,86), 5.4).
fillpoint(r171, xy(54,90), 5.1).
fillpoint(r171, xy(54,93), 5.0).
fillpoint(r171, xy(65,96), 3.2).
fillpoint(r171, xy(65,93), 3.0).
fillpoint(r171, xy(60,96), 3.0).
region(r1141, '#089ad4', 343, centroid(107,266)).
perimeter(r1141, 92).
polygon(r1141, [xy(110,272),xy(90,271),xy(99,260),xy(119,260),xy(122,269),xy(110,272)]).
midline(r1141, [xy(90,271),xy(101,266),xy(116,265)]).
fillpoint(r1141, xy(105,266), 7.0).
fillpoint(r1141, xy(115,265), 6.0).
fillpoint(r1141, xy(97,268), 5.0).
region(r690, '#c93c2c', 317, centroid(126,190)).
perimeter(r690, 112).
polygon(r690, [xy(133,204),xy(120,202),xy(122,171),xy(121,164),xy(124,165),xy(124,175),xy(134,192),xy(133,204)]).
midline(r690, [xy(127,197),xy(123,176),xy(124,171),xy(123,170),xy(123,166),xy(122,165),xy(121,165)]).
fillpoint(r690, xy(127,197), 7.0).
fillpoint(r690, xy(127,192), 6.0).
fillpoint(r690, xy(126,187), 5.0).
fillpoint(r690, xy(125,182), 4.0).
fillpoint(r690, xy(124,179), 3.0).
fillpoint(r690, xy(123,174), 2.0).
region(r981, '#efc42b', 262, centroid(108,241)).
perimeter(r981, 68).
polygon(r981, [xy(113,252),xy(102,251),xy(103,230),xy(114,231),xy(113,252)]).
midline(r981, [xy(108,242),xy(109,236)]).
midline(r981, [xy(109,243),xy(109,247)]).
fillpoint(r981, xy(108,242), 6.0).
region(r964, '#efc228', 233, centroid(88,238)).
perimeter(r964, 66).
polygon(r964, [xy(92,248),xy(82,248),xy(82,228),xy(94,228),xy(92,248)]).
midline(r964, [xy(88,243),xy(88,233)]).
fillpoint(r964, xy(88,238), 6.0).
region(r973, '#070806', 175, centroid(99,241)).
perimeter(r973, 140).
polygon(r973, [xy(97,260),xy(97,254),xy(82,255),xy(92,254),xy(98,251),xy(96,248),xy(96,229),xy(115,228),xy(102,230),xy(102,252),xy(98,253),xy(100,257),xy(97,260)]).
midline(r973, [xy(83,255),xy(92,255),xy(93,254),xy(97,254),xy(100,251),xy(98,231),xy(101,229),xy(115,229)]).
midline(r973, [xy(98,255),xy(97,259)]).
fillpoint(r973, xy(98,239), 3.0).
fillpoint(r973, xy(100,251), 2.0).
fillpoint(r973, xy(109,229), 1.0).
fillpoint(r973, xy(87,255), 1.0).
region(r1063, '#0b9ad5', 162, centroid(80,261)).
perimeter(r1063, 66).
polygon(r1063, [xy(87,266),xy(72,266),xy(70,264),xy(77,254),xy(89,256),xy(86,258),xy(87,266)]).
midline(r1063, [xy(70,265),xy(89,256)]).
fillpoint(r1063, xy(81,261), 6.0).
fillpoint(r1063, xy(78,262), 5.0).
region(r893, '#0d96cc', 126, centroid(82,221)).
perimeter(r893, 70).
polygon(r893, [xy(93,226),xy(76,224),xy(74,221),xy(72,212),xy(86,220),xy(92,222),xy(93,226)]).
midline(r893, [xy(73,212),xy(78,220),xy(92,224)]).
fillpoint(r893, xy(77,220), 3.6).
fillpoint(r893, xy(81,221), 3.2).
fillpoint(r893, xy(83,222), 3.0).
fillpoint(r893, xy(87,223), 2.8).
fillpoint(r893, xy(90,224), 2.0).
fillpoint(r893, xy(74,212), 1.0).
region(r1251, '#fbfcfc', 100, centroid(105,275)).
perimeter(r1251, 90).
polygon(r1251, [xy(108,278),xy(89,276),xy(86,273),xy(111,274),xy(124,272),xy(122,274),xy(108,278)]).
midline(r1251, [xy(87,273),xy(92,276),xy(111,276),xy(123,272)]).
fillpoint(r1251, xy(118,274), 2.0).
fillpoint(r1251, xy(90,275), 2.0).
fillpoint(r1251, xy(113,275), 2.0).
fillpoint(r1251, xy(101,276), 2.0).
fillpoint(r1251, xy(121,273), 1.4).
fillpoint(r1251, xy(123,272), 1.0).
fillpoint(r1251, xy(87,274), 1.0).
fillpoint(r1251, xy(110,276), 1.0).
region(r1029, '#fcfcfb', 66, centroid(109,256)).
perimeter(r1029, 54).
polygon(r1029, [xy(109,258),xy(100,256),xy(100,253),xy(118,254),xy(115,258),xy(109,258)]).
midline(r1029, [xy(116,255),xy(108,257),xy(100,253)]).
fillpoint(r1029, xy(102,255), 2.0).
fillpoint(r1029, xy(116,255), 2.0).
fillpoint(r1029, xy(109,256), 2.0).
fillpoint(r1029, xy(100,253), 1.0).
region(r1205, '#f6f7f6', 54, centroid(76,270)).
perimeter(r1205, 52).
polygon(r1205, [xy(85,272),xy(64,269),xy(86,268),xy(85,272)]).
midline(r1205, [xy(86,269),xy(65,269)]).
fillpoint(r1205, xy(80,270), 2.0).
fillpoint(r1205, xy(70,269), 1.4).
fillpoint(r1205, xy(66,269), 1.0).
fillpoint(r1205, xy(72,270), 1.0).
fillpoint(r1205, xy(86,269), 1.0).
region(r1252, '#dad6d5', 54, centroid(78,274)).
perimeter(r1252, 46).
polygon(r1252, [xy(85,278),xy(68,273),xy(84,272),xy(85,278)]).
midline(r1252, [xy(68,273),xy(83,275)]).
fillpoint(r1252, xy(82,274), 2.0).
fillpoint(r1252, xy(72,273), 1.0).
region(r989, '#fcfdfb', 53, centroid(87,252)).
perimeter(r989, 52).
polygon(r989, [xy(94,254),xy(82,254),xy(78,249),xy(86,252),xy(96,250),xy(96,252),xy(94,254)]).
midline(r989, [xy(95,251),xy(90,253),xy(80,251)]).
fillpoint(r989, xy(80,251), 2.0).
fillpoint(r989, xy(84,252), 2.0).
fillpoint(r989, xy(93,252), 2.0).
fillpoint(r989, xy(95,251), 1.4).
fillpoint(r989, xy(87,253), 1.0).

adjacent(r1, r11).
shared_edge(r1, r11, 65).
adjacent(r1, r171).
shared_edge(r1, r171, 10).
adjacent(r1, r539).
shared_edge(r1, r539, 5).
adjacent(r1, r577).
shared_edge(r1, r577, 8).
adjacent(r1, r690).
shared_edge(r1, r690, 14).
adjacent(r1, r815).
shared_edge(r1, r815, 12).
adjacent(r1, r893).
shared_edge(r1, r893, 4).
adjacent(r1, r973).
shared_edge(r1, r973, 3).
adjacent(r1, r989).
shared_edge(r1, r989, 1).
adjacent(r1, r1023).
shared_edge(r1, r1023, 191).
adjacent(r1, r1205).
shared_edge(r1, r1205, 1).
adjacent(r1, r1251).
shared_edge(r1, r1251, 3).
adjacent(r1, r1252).
shared_edge(r1, r1252, 23).
adjacent(r539, r698).
shared_edge(r539, r698, 7).
adjacent(r539, r815).
shared_edge(r539, r815, 21).
adjacent(r577, r690).
shared_edge(r577, r690, 1).
adjacent(r690, r698).
shared_edge(r690, r698, 11).
adjacent(r973, r989).
shared_edge(r973, r989, 2).
adjacent(r973, r1029).
shared_edge(r973, r1029, 1).
adjacent(r973, r1063).
shared_edge(r973, r1063, 7).

