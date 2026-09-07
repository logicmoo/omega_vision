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
img_size(274, 420).

region(r1, '#f6f6f6', 76895, centroid(141,200)).
perimeter(r1, 4474).
polygon(r1, [xy(92,409),xy(98,406),xy(96,395),xy(84,373),xy(90,358),xy(98,328),xy(105,336),xy(109,336),xy(118,328),xy(122,338),xy(122,360),xy(116,374),xy(110,378),xy(107,388),xy(108,382),xy(113,378),xy(113,382),xy(124,384),xy(132,372),xy(142,366),xy(151,364),xy(152,369),xy(157,370),xy(160,373),xy(143,374),xy(136,382),xy(136,386),xy(149,388),xy(157,380),xy(162,380),xy(172,393),xy(166,378),xy(152,366),xy(158,351),xy(156,331),xy(170,331),xy(164,312),xy(172,314),xy(176,306),xy(180,308),xy(186,308),xy(188,296),xy(164,247),xy(156,215),xy(154,194),xy(160,189),xy(162,176),xy(178,176),xy(190,186),xy(201,186),xy(207,182),xy(223,184),xy(230,180),xy(232,176),xy(232,169),xy(226,161),xy(226,142),xy(236,135),xy(239,128),xy(250,127),xy(242,126),xy(242,124),xy(256,118),xy(268,110),xy(266,102),xy(254,87),xy(264,58),xy(261,56),xy(234,48),xy(232,30),xy(228,20),xy(221,20),xy(197,30),xy(181,12),xy(173,8),xy(152,30),xy(129,26),xy(121,26),xy(120,28),xy(121,30),xy(129,28),xy(152,34),xy(174,12),xy(196,32),xy(226,22),xy(232,38),xy(232,50),xy(260,59),xy(252,88),xy(266,108),xy(254,116),xy(241,122),xy(240,116),xy(246,111),xy(240,112),xy(234,104),xy(239,96),xy(234,102),xy(221,98),xy(220,88),xy(216,98),xy(206,98),xy(202,94),xy(206,91),xy(206,84),xy(192,78),xy(198,52),xy(194,48),xy(189,48),xy(184,51),xy(180,66),xy(172,64),xy(158,68),xy(152,79),xy(122,106),xy(103,128),xy(86,116),xy(104,95),xy(94,68),xy(120,58),xy(118,56),xy(93,64),xy(90,70),xy(102,94),xy(88,107),xy(84,116),xy(102,131),xy(86,162),xy(78,187),xy(70,197),xy(48,244),xy(30,271),xy(6,301),xy(6,304),xy(26,302),xy(30,315),xy(33,320),xy(48,314),xy(58,329),xy(58,339),xy(50,364),xy(42,380),xy(34,385),xy(32,396),xy(38,402),xy(54,408),xy(64,410),xy(92,409)]).
hole(r1, [xy(180,404),xy(184,402),xy(178,400),xy(184,400),xy(185,398),xy(176,396),xy(176,402),xy(172,400),xy(174,404),xy(180,404)]).
hole(r1, [xy(122,398),xy(112,396),xy(106,390),xy(108,394),xy(122,398)]).
hole(r1, [xy(168,400),xy(171,396),xy(164,400),xy(168,400)]).
hole(r1, [xy(132,400),xy(122,399),xy(132,400)]).
hole(r1, [xy(164,401),xy(160,401),xy(164,401)]).
hole(r1, [xy(190,401),xy(186,401),xy(190,401)]).
hole(r1, [xy(170,403),xy(170,402),xy(170,403)]).
hole(r1, [xy(190,404),xy(190,402),xy(190,404)]).
midline(r1, [xy(102,113),xy(115,98),xy(119,80),xy(130,74),xy(137,67),xy(142,54),xy(128,44),xy(109,42),xy(88,32),xy(69,36),xy(47,47),xy(45,58),xy(45,79),xy(47,85),xy(42,102),xy(42,128),xy(46,141),xy(23,240),xy(2,303),xy(3,307),xy(15,318),xy(19,334),xy(27,346),xy(25,359),xy(17,379),xy(15,396),xy(16,403),xy(29,409),xy(65,415),xy(92,415),xy(103,412),xy(109,407),xy(102,397),xy(99,384),xy(100,377),xy(98,373),xy(105,362),xy(108,351),xy(101,341),xy(98,328)]).
midline(r1, [xy(101,378),xy(111,388),xy(108,390),xy(102,387)]).
midline(r1, [xy(112,388),xy(113,386),xy(100,373)]).
midline(r1, [xy(129,47),xy(119,58)]).
midline(r1, [xy(157,331),xy(182,357),xy(166,363),xy(159,363),xy(148,369),xy(141,371),xy(132,379),xy(126,392),xy(118,391),xy(114,388)]).
midline(r1, [xy(114,390),xy(105,399)]).
midline(r1, [xy(129,391),xy(132,393),xy(130,397),xy(125,402),xy(124,407),xy(122,409),xy(110,407),xy(123,393),xy(126,394),xy(116,407)]).
midline(r1, [xy(151,368),xy(147,373),xy(145,371)]).
midline(r1, [xy(133,393),xy(139,396),xy(145,402),xy(145,405),xy(135,410),xy(123,409)]).
midline(r1, [xy(151,370),xy(156,371),xy(163,364),xy(158,371),xy(159,373)]).
midline(r1, [xy(146,402),xy(159,391),xy(166,403),xy(163,411),xy(152,409),xy(146,405)]).
midline(r1, [xy(165,411),xy(170,412),xy(172,410),xy(172,402),xy(169,400),xy(161,392)]).
midline(r1, [xy(167,403),xy(169,401)]).
midline(r1, [xy(103,395),xy(107,391)]).
midline(r1, [xy(113,378),xy(111,382),xy(112,383)]).
midline(r1, [xy(176,401),xy(173,398),xy(172,399),xy(169,398),xy(170,397),xy(169,394),xy(165,394)]).
midline(r1, [xy(173,397),xy(171,395)]).
midline(r1, [xy(173,395),xy(210,358),xy(183,357)]).
midline(r1, [xy(211,357),xy(217,354),xy(183,320),xy(176,306)]).
midline(r1, [xy(242,126),xy(252,123),xy(261,129),xy(269,116),xy(271,104),xy(264,86),xy(269,62),xy(268,54),xy(252,32),xy(252,21),xy(241,13),xy(228,9),xy(200,13),xy(178,4),xy(171,4),xy(147,14),xy(114,13),xy(100,20),xy(88,31)]).
midline(r1, [xy(160,371),xy(165,364)]).
midline(r1, [xy(167,364),xy(168,363)]).
midline(r1, [xy(173,411),xy(183,412),xy(185,409),xy(185,402),xy(183,400),xy(178,400)]).
midline(r1, [xy(185,400),xy(223,363),xy(218,355),xy(229,324),xy(231,297),xy(229,277),xy(219,237),xy(236,219),xy(249,196),xy(253,182),xy(253,163),xy(249,154),xy(253,147),xy(246,140),xy(254,146),xy(262,130)]).
midline(r1, [xy(186,409),xy(188,405),xy(186,402)]).
midline(r1, [xy(108,403),xy(117,394),xy(117,392),xy(116,391),xy(106,401)]).
midline(r1, [xy(102,131),xy(63,140),xy(47,141)]).
midline(r1, [xy(243,118),xy(252,112),xy(254,106),xy(236,81),xy(235,74),xy(221,68),xy(217,64),xy(215,47),xy(213,45),xy(182,36),xy(175,36),xy(163,49),xy(143,53)]).
midline(r1, [xy(167,48),xy(180,66)]).
midline(r1, [xy(189,402),xy(225,367),xy(223,364)]).
midline(r1, [xy(225,369),xy(228,374),xy(213,397),xy(200,409),xy(193,412),xy(185,411)]).
midline(r1, [xy(226,379),xy(229,375)]).
midline(r1, [xy(190,329),xy(183,323),xy(169,318),xy(164,312)]).
midline(r1, [xy(220,69),xy(213,86),xy(213,91),xy(207,95),xy(203,94)]).
midline(r1, [xy(170,391),xy(169,393)]).
midline(r1, [xy(117,336),xy(109,350)]).
fillpoint(r1, xy(219,354), 55.0).
fillpoint(r1, xy(220,238), 54.0).
fillpoint(r1, xy(220,350), 54.0).
fillpoint(r1, xy(221,243), 53.0).
fillpoint(r1, xy(222,247), 52.0).
fillpoint(r1, xy(223,251), 51.0).
fillpoint(r1, xy(224,255), 50.0).
fillpoint(r1, xy(225,259), 49.0).
fillpoint(r1, xy(225,337), 49.0).
fillpoint(r1, xy(47,47), 48.0).
fillpoint(r1, xy(226,264), 48.0).
fillpoint(r1, xy(226,334), 48.0).
fillpoint(r1, xy(46,53), 47.0).
fillpoint(r1, xy(46,85), 47.0).
fillpoint(r1, xy(227,268), 47.0).
fillpoint(r1, xy(227,331), 47.0).
fillpoint(r1, xy(45,69), 46.0).
fillpoint(r1, xy(45,89), 46.0).
fillpoint(r1, xy(45,141), 46.0).
fillpoint(r1, xy(228,273), 46.0).
fillpoint(r1, xy(228,327), 46.0).
fillpoint(r1, xy(44,93), 45.0).
fillpoint(r1, xy(44,137), 45.0).
fillpoint(r1, xy(44,145), 45.0).
fillpoint(r1, xy(229,279), 45.0).
fillpoint(r1, xy(229,323), 45.0).
fillpoint(r1, xy(43,98), 44.0).
fillpoint(r1, xy(43,133), 44.0).
fillpoint(r1, xy(43,151), 44.0).
fillpoint(r1, xy(230,285), 44.0).
fillpoint(r1, xy(230,317), 44.0).
fillpoint(r1, xy(42,104), 43.0).
fillpoint(r1, xy(42,127), 43.0).
fillpoint(r1, xy(42,156), 43.0).
fillpoint(r1, xy(231,301), 43.0).
fillpoint(r1, xy(42,115), 42.0).
fillpoint(r1, xy(41,162), 42.0).
fillpoint(r1, xy(40,167), 41.0).
fillpoint(r1, xy(38,174), 39.0).
fillpoint(r1, xy(37,178), 38.0).
fillpoint(r1, xy(70,36), 37.0).
fillpoint(r1, xy(36,182), 37.0).
fillpoint(r1, xy(73,35), 36.0).
fillpoint(r1, xy(35,186), 36.0).
fillpoint(r1, xy(76,34), 35.0).
fillpoint(r1, xy(34,191), 35.0).
fillpoint(r1, xy(81,33), 34.0).
fillpoint(r1, xy(33,196), 34.0).
fillpoint(r1, xy(86,32), 33.0).
fillpoint(r1, xy(32,200), 33.0).
fillpoint(r1, xy(31,204), 32.0).
fillpoint(r1, xy(30,209), 31.0).
fillpoint(r1, xy(29,213), 30.0).
fillpoint(r1, xy(28,218), 29.0).
fillpoint(r1, xy(27,222), 28.0).
fillpoint(r1, xy(27,347), 27.9).
fillpoint(r1, xy(26,226), 27.0).
fillpoint(r1, xy(26,351), 27.0).
fillpoint(r1, xy(25,230), 26.0).
fillpoint(r1, xy(25,356), 26.0).
fillpoint(r1, xy(24,234), 25.0).
fillpoint(r1, xy(24,361), 25.0).
fillpoint(r1, xy(23,238), 24.0).
fillpoint(r1, xy(250,154), 23.4).
fillpoint(r1, xy(251,156), 23.0).
fillpoint(r1, xy(252,159), 22.0).
fillpoint(r1, xy(252,186), 22.0).
fillpoint(r1, xy(21,245), 22.0).
fillpoint(r1, xy(252,21), 21.8).
fillpoint(r1, xy(141,53), 21.5).
fillpoint(r1, xy(218,66), 21.3).
fillpoint(r1, xy(220,67), 21.3).
fillpoint(r1, xy(253,27), 21.0).
fillpoint(r1, xy(253,173), 21.0).
fillpoint(r1, xy(235,73), 20.6).
fillpoint(r1, xy(230,71), 20.1).
fillpoint(r1, xy(216,61), 20.0).
fillpoint(r1, xy(19,252), 20.0).
fillpoint(r1, xy(19,373), 20.0).
fillpoint(r1, xy(228,70), 19.9).
fillpoint(r1, xy(120,80), 19.8).
fillpoint(r1, xy(123,78), 19.1).
fillpoint(r1, xy(166,47), 19.0).
fillpoint(r1, xy(18,255), 19.0).
fillpoint(r1, xy(18,376), 19.0).
fillpoint(r1, xy(168,44), 18.4).
fillpoint(r1, xy(164,48), 18.4).
fillpoint(r1, xy(138,63), 18.4).
fillpoint(r1, xy(137,66), 18.4).
fillpoint(r1, xy(136,68), 18.4).
fillpoint(r1, xy(214,45), 18.2).
fillpoint(r1, xy(215,49), 18.0).
fillpoint(r1, xy(162,49), 18.0).
fillpoint(r1, xy(215,51), 18.0).
fillpoint(r1, xy(17,380), 18.0).
fillpoint(r1, xy(174,36), 17.8).
fillpoint(r1, xy(171,40), 17.8).
fillpoint(r1, xy(170,41), 17.8).
fillpoint(r1, xy(128,75), 17.8).
fillpoint(r1, xy(173,38), 17.7).
fillpoint(r1, xy(132,72), 17.7).
fillpoint(r1, xy(131,73), 17.7).
fillpoint(r1, xy(158,50), 17.1).
fillpoint(r1, xy(154,51), 17.1).
fillpoint(r1, xy(16,325), 17.0).
fillpoint(r1, xy(16,386), 17.0).
fillpoint(r1, xy(16,403), 17.0).
fillpoint(r1, xy(130,45), 16.4).
fillpoint(r1, xy(128,44), 16.1).
fillpoint(r1, xy(15,321), 16.0).
fillpoint(r1, xy(16,394), 16.0).
fillpoint(r1, xy(106,358), 15.2).
fillpoint(r1, xy(107,354), 15.1).
fillpoint(r1, xy(105,360), 15.1).
fillpoint(r1, xy(112,14), 15.0).
fillpoint(r1, xy(146,14), 14.9).
fillpoint(r1, xy(108,351), 14.9).
fillpoint(r1, xy(104,363), 14.9).
fillpoint(r1, xy(145,405), 14.9).
fillpoint(r1, xy(115,13), 14.0).
fillpoint(r1, xy(138,13), 14.0).
fillpoint(r1, xy(120,43), 14.0).
fillpoint(r1, xy(201,13), 13.9).
border(r1).
region(r2362, '#757575', 14819, centroid(103,270)).
perimeter(r2362, 928).
polygon(r2362, [xy(108,334),xy(96,320),xy(82,332),xy(74,316),xy(61,326),xy(58,326),xy(50,310),xy(33,316),xy(26,300),xy(14,304),xy(7,304),xy(6,301),xy(18,292),xy(42,259),xy(76,192),xy(78,198),xy(89,204),xy(92,204),xy(118,210),xy(146,210),xy(147,212),xy(148,210),xy(152,211),xy(148,205),xy(150,194),xy(152,198),xy(160,243),xy(184,292),xy(186,304),xy(180,306),xy(176,302),xy(172,295),xy(173,288),xy(170,299),xy(164,300),xy(162,295),xy(162,286),xy(156,282),xy(158,285),xy(156,290),xy(160,301),xy(160,304),xy(168,331),xy(156,330),xy(155,332),xy(155,326),xy(144,322),xy(132,334),xy(120,322),xy(108,334)]).
hole(r2362, [xy(160,310),xy(160,308),xy(160,310)]).
midline(r2362, [xy(168,328),xy(167,331),xy(160,325),xy(154,328)]).
midline(r2362, [xy(167,325),xy(164,322),xy(159,322),xy(144,305),xy(133,299),xy(107,273),xy(102,265),xy(44,291),xy(31,291),xy(10,301)]).
midline(r2362, [xy(147,306),xy(158,306),xy(161,309),xy(161,311),xy(155,317)]).
midline(r2362, [xy(44,292),xy(39,298),xy(41,298)]).
midline(r2362, [xy(163,327),xy(165,325)]).
midline(r2362, [xy(146,210),xy(142,219),xy(134,227),xy(135,229),xy(136,227)]).
midline(r2362, [xy(142,221),xy(119,253),xy(112,260),xy(104,264),xy(77,210),xy(75,202),xy(76,192)]).
midline(r2362, [xy(141,225),xy(153,212),xy(150,196)]).
midline(r2362, [xy(155,331),xy(155,330)]).
midline(r2362, [xy(69,282),xy(60,324)]).
midline(r2362, [xy(159,323),xy(160,324)]).
midline(r2362, [xy(116,258),xy(147,264),xy(160,271),xy(165,277),xy(158,285),xy(142,290),xy(139,289),xy(132,296),xy(139,291),xy(134,298)]).
midline(r2362, [xy(166,278),xy(169,281),xy(166,293)]).
midline(r2362, [xy(170,282),xy(176,286),xy(181,300)]).
midline(r2362, [xy(88,220),xy(89,219)]).
fillpoint(r2362, xy(103,264), 56.0).
region(r312, '#c7c7c7', 5435, centroid(129,142)).
perimeter(r312, 766).
polygon(r312, [xy(143,210),xy(120,210),xy(87,202),xy(80,196),xy(82,180),xy(96,146),xy(122,110),xy(154,80),xy(156,73),xy(162,68),xy(168,70),xy(172,75),xy(172,82),xy(168,86),xy(162,85),xy(164,78),xy(160,78),xy(160,85),xy(162,88),xy(181,86),xy(184,81),xy(182,67),xy(186,53),xy(193,50),xy(194,61),xy(190,79),xy(195,82),xy(201,82),xy(204,89),xy(200,92),xy(190,92),xy(182,98),xy(178,98),xy(179,92),xy(173,98),xy(165,100),xy(152,113),xy(130,144),xy(118,173),xy(117,188),xy(119,184),xy(124,190),xy(131,190),xy(136,194),xy(146,193),xy(146,209),xy(143,210)]).
midline(r312, [xy(199,87),xy(195,88),xy(188,85),xy(187,68),xy(190,58)]).
midline(r312, [xy(188,87),xy(184,90),xy(176,90),xy(170,94),xy(154,96),xy(157,77),xy(165,73),xy(169,80),xy(166,84),xy(163,82)]).
midline(r312, [xy(119,186),xy(120,190),xy(116,198),xy(109,196),xy(99,187),xy(104,165),xy(121,133),xy(143,105),xy(153,96)]).
midline(r312, [xy(118,198),xy(139,203)]).
fillpoint(r312, xy(99,186), 18.0).
fillpoint(r312, xy(100,180), 17.0).
fillpoint(r312, xy(101,175), 16.1).
fillpoint(r312, xy(102,172), 15.8).
fillpoint(r312, xy(104,166), 15.5).
fillpoint(r312, xy(103,169), 15.5).
fillpoint(r312, xy(107,159), 15.2).
fillpoint(r312, xy(106,161), 15.2).
fillpoint(r312, xy(105,164), 15.2).
fillpoint(r312, xy(108,157), 14.9).
fillpoint(r312, xy(110,153), 14.8).
fillpoint(r312, xy(109,155), 14.8).
fillpoint(r312, xy(111,151), 14.6).
fillpoint(r312, xy(114,145), 14.4).
fillpoint(r312, xy(117,140), 14.3).
fillpoint(r312, xy(116,142), 14.3).
fillpoint(r312, xy(115,143), 14.3).
fillpoint(r312, xy(113,147), 14.3).
fillpoint(r312, xy(112,149), 14.3).
fillpoint(r312, xy(120,135), 14.2).
fillpoint(r312, xy(118,138), 14.2).
fillpoint(r312, xy(122,132), 14.1).
fillpoint(r312, xy(125,128), 13.9).
fillpoint(r312, xy(124,129), 13.9).
fillpoint(r312, xy(128,124), 13.6).
fillpoint(r312, xy(127,125), 13.6).
fillpoint(r312, xy(134,116), 13.5).
fillpoint(r312, xy(131,120), 13.5).
fillpoint(r312, xy(130,121), 13.5).
fillpoint(r312, xy(129,122), 13.5).
fillpoint(r312, xy(142,107), 12.5).
fillpoint(r312, xy(141,108), 12.5).
fillpoint(r312, xy(153,96), 12.0).
fillpoint(r312, xy(152,97), 12.0).
fillpoint(r312, xy(151,98), 12.0).
fillpoint(r312, xy(146,102), 12.0).
fillpoint(r312, xy(110,196), 11.4).
fillpoint(r312, xy(112,197), 11.2).
fillpoint(r312, xy(116,198), 11.0).
fillpoint(r312, xy(119,199), 11.0).
fillpoint(r312, xy(125,200), 11.0).
fillpoint(r312, xy(128,201), 10.0).
fillpoint(r312, xy(131,202), 9.0).
fillpoint(r312, xy(137,203), 8.0).
fillpoint(r312, xy(188,87), 6.3).
fillpoint(r312, xy(191,87), 6.0).
fillpoint(r312, xy(168,94), 6.0).
fillpoint(r312, xy(185,89), 5.7).
fillpoint(r312, xy(190,59), 5.0).
fillpoint(r312, xy(164,73), 5.0).
fillpoint(r312, xy(166,74), 5.0).
fillpoint(r312, xy(199,87), 5.0).
region(r1271, '#c7c7c7', 4407, centroid(176,154)).
perimeter(r1271, 504).
polygon(r1271, [xy(199,184),xy(192,184),xy(181,174),xy(158,174),xy(147,180),xy(137,178),xy(132,174),xy(128,174),xy(122,167),xy(136,141),xy(156,114),xy(160,122),xy(171,132),xy(190,132),xy(201,128),xy(217,134),xy(220,139),xy(216,148),xy(199,146),xy(197,148),xy(215,150),xy(224,143),xy(224,164),xy(222,165),xy(230,171),xy(228,177),xy(223,180),xy(204,180),xy(199,184)]).
hole(r1271, [xy(198,179),xy(202,174),xy(212,175),xy(205,172),xy(195,172),xy(192,177),xy(195,180),xy(198,179)]).
midline(r1271, [xy(156,114),xy(155,138),xy(158,150),xy(143,162),xy(123,167)]).
midline(r1271, [xy(223,143),xy(221,151),xy(211,162),xy(205,160),xy(186,160),xy(177,153),xy(159,151)]).
midline(r1271, [xy(178,152),xy(189,141),xy(199,137),xy(213,141)]).
midline(r1271, [xy(186,161),xy(189,177),xy(193,181),xy(199,181),xy(204,177),xy(214,177),xy(219,172),xy(212,163)]).
midline(r1271, [xy(224,164),xy(216,160)]).
fillpoint(r1271, xy(158,151), 23.7).
fillpoint(r1271, xy(161,152), 23.0).
fillpoint(r1271, xy(167,153), 22.0).
fillpoint(r1271, xy(175,154), 21.0).
fillpoint(r1271, xy(210,161), 12.0).
fillpoint(r1271, xy(203,161), 11.0).
fillpoint(r1271, xy(202,138), 8.2).
fillpoint(r1271, xy(199,137), 8.1).
fillpoint(r1271, xy(205,139), 8.1).
fillpoint(r1271, xy(197,138), 8.0).
fillpoint(r1271, xy(208,140), 8.0).
fillpoint(r1271, xy(220,173), 8.0).
fillpoint(r1271, xy(216,169), 7.8).
fillpoint(r1271, xy(217,170), 7.8).
fillpoint(r1271, xy(218,171), 7.8).
fillpoint(r1271, xy(194,139), 7.6).
fillpoint(r1271, xy(213,141), 7.0).
region(r3091, '#c7c7c7', 1613, centroid(71,352)).
perimeter(r3091, 262).
polygon(r3091, [xy(48,388),xy(42,384),xy(56,359),xy(60,341),xy(60,328),xy(73,320),xy(80,333),xy(83,334),xy(94,324),xy(94,333),xy(92,345),xy(82,372),xy(66,372),xy(58,376),xy(48,388)]).
midline(r3091, [xy(70,333),xy(75,348),xy(73,354),xy(47,383)]).
midline(r3091, [xy(76,348),xy(88,337),xy(94,325)]).
fillpoint(r3091, xy(74,349), 15.3).
fillpoint(r3091, xy(73,352), 15.1).
fillpoint(r3091, xy(72,356), 14.9).
fillpoint(r3091, xy(71,358), 14.9).
fillpoint(r3091, xy(70,336), 10.0).
fillpoint(r3091, xy(89,335), 5.0).
fillpoint(r3091, xy(54,374), 5.0).
fillpoint(r3091, xy(53,375), 5.0).
fillpoint(r3091, xy(51,378), 4.2).
fillpoint(r3091, xy(50,379), 4.2).
region(r3705, '#676767', 1216, centroid(67,395)).
perimeter(r3705, 308).
polygon(r3705, [xy(90,410),xy(64,410),xy(48,404),xy(34,395),xy(34,390),xy(38,386),xy(49,390),xy(61,378),xy(68,374),xy(79,374),xy(90,384),xy(85,382),xy(70,382),xy(62,387),xy(64,388),xy(62,392),xy(72,396),xy(76,392),xy(90,390),xy(96,399),xy(96,405),xy(90,410)]).
hole(r3705, [xy(60,393),xy(60,392),xy(60,393)]).
midline(r3705, [xy(95,396),xy(91,401),xy(85,401),xy(76,392),xy(74,395),xy(78,401),xy(66,402),xy(40,393)]).
midline(r3705, [xy(79,402),xy(83,400)]).
midline(r3705, [xy(93,401),xy(96,405)]).
midline(r3705, [xy(62,399),xy(61,392),xy(57,388),xy(53,395)]).
midline(r3705, [xy(57,387),xy(59,385),xy(62,391)]).
midline(r3705, [xy(63,389),xy(64,387),xy(60,384),xy(69,378),xy(78,378),xy(88,382),xy(89,384)]).
midline(r3705, [xy(92,408),xy(85,402)]).
fillpoint(r3705, xy(84,400), 10.0).
fillpoint(r3705, xy(53,397), 8.1).
fillpoint(r3705, xy(77,402), 8.0).
fillpoint(r3705, xy(64,401), 7.6).
fillpoint(r3705, xy(67,402), 7.6).
fillpoint(r3705, xy(59,400), 7.1).
fillpoint(r3705, xy(61,400), 7.1).
fillpoint(r3705, xy(71,403), 7.0).
fillpoint(r3705, xy(42,394), 5.7).
fillpoint(r3705, xy(40,393), 5.4).
fillpoint(r3705, xy(56,389), 5.0).
fillpoint(r3705, xy(59,385), 4.5).
fillpoint(r3705, xy(58,386), 4.5).
fillpoint(r3705, xy(62,382), 4.2).
fillpoint(r3705, xy(61,383), 4.2).
fillpoint(r3705, xy(65,380), 4.1).
fillpoint(r3705, xy(64,381), 4.1).
fillpoint(r3705, xy(74,378), 4.0).
fillpoint(r3705, xy(67,379), 4.0).
region(r3170, '#c7c7c7', 1210, centroid(138,350)).
perimeter(r3170, 226).
polygon(r3170, [xy(122,382),xy(116,379),xy(124,358),xy(124,335),xy(120,326),xy(134,336),xy(146,324),xy(154,329),xy(156,334),xy(156,349),xy(152,360),xy(150,364),xy(142,364),xy(132,370),xy(122,382)]).
midline(r3170, [xy(146,338),xy(139,350),xy(129,340),xy(123,328),xy(120,326)]).
midline(r3170, [xy(116,379),xy(122,376),xy(139,351)]).
fillpoint(r3170, xy(139,350), 14.9).
fillpoint(r3170, xy(126,369), 5.0).
fillpoint(r3170, xy(122,375), 4.0).
region(r894, '#fdfdfd', 1157, centroid(184,113)).
perimeter(r894, 198).
polygon(r894, [xy(187,130),xy(177,130),xy(165,124),xy(158,111),xy(167,102),xy(181,102),xy(192,94),xy(199,94),xy(206,104),xy(206,114),xy(198,126),xy(187,130)]).
hole(r894, [xy(186,114),xy(188,108),xy(182,106),xy(180,112),xy(186,114)]).
midline(r894, [xy(197,112),xy(192,120),xy(184,123),xy(175,120),xy(170,114),xy(178,105),xy(190,102),xy(196,104),xy(197,111)]).
fillpoint(r894, xy(171,115), 10.4).
fillpoint(r894, xy(172,117), 10.0).
fillpoint(r894, xy(176,120), 9.2).
fillpoint(r894, xy(197,109), 9.0).
fillpoint(r894, xy(178,121), 8.9).
fillpoint(r894, xy(180,122), 8.9).
fillpoint(r894, xy(195,103), 8.6).
fillpoint(r894, xy(196,105), 8.5).
fillpoint(r894, xy(196,114), 8.5).
fillpoint(r894, xy(195,116), 8.5).
fillpoint(r894, xy(194,118), 8.5).
fillpoint(r894, xy(190,121), 8.1).
fillpoint(r894, xy(187,122), 8.1).
fillpoint(r894, xy(185,122), 8.0).
fillpoint(r894, xy(182,104), 3.0).
region(r1011, '#fdfdfd', 912, centroid(221,118)).
perimeter(r1011, 184).
polygon(r1011, [xy(225,140),xy(222,139),xy(219,132),xy(202,126),xy(206,119),xy(208,102),xy(210,100),xy(225,100),xy(232,104),xy(236,111),xy(236,128),xy(225,140)]).
hole(r1011, [xy(230,125),xy(230,120),xy(228,118),xy(224,118),xy(222,123),xy(225,126),xy(230,125)]).
midline(r1011, [xy(202,126),xy(214,121),xy(223,130),xy(229,131),xy(234,125),xy(234,118),xy(229,111),xy(217,110),xy(215,120)]).
fillpoint(r1011, xy(218,110), 10.8).
fillpoint(r1011, xy(214,122), 8.5).
fillpoint(r1011, xy(215,119), 8.2).
fillpoint(r1011, xy(227,131), 6.0).
fillpoint(r1011, xy(233,116), 5.0).
fillpoint(r1011, xy(221,128), 5.0).
fillpoint(r1011, xy(222,129), 5.0).
fillpoint(r1011, xy(234,121), 4.0).
fillpoint(r1011, xy(233,126), 3.6).
region(r3694, '#c8c8c8', 176, centroid(149,379)).
perimeter(r3694, 74).
polygon(r3694, [xy(147,386),xy(138,384),xy(144,376),xy(158,374),xy(160,376),xy(161,378),xy(153,380),xy(147,386)]).
midline(r3694, [xy(145,382),xy(151,377),xy(158,376),xy(161,378)]).
fillpoint(r3694, xy(148,379), 5.0).
fillpoint(r3694, xy(145,381), 5.0).
fillpoint(r3694, xy(152,377), 4.0).
fillpoint(r3694, xy(156,376), 3.0).
region(r3845, '#c8c8c8', 175, centroid(74,387)).
perimeter(r3845, 78).
polygon(r3845, [xy(72,394),xy(62,392),xy(69,384),xy(83,382),xy(88,385),xy(77,390),xy(72,394)]).
midline(r3845, [xy(86,385),xy(81,384),xy(71,389)]).
fillpoint(r3845, xy(71,389), 5.0).
fillpoint(r3845, xy(74,387), 4.2).
fillpoint(r3845, xy(76,386), 4.1).
fillpoint(r3845, xy(78,385), 4.0).
fillpoint(r3845, xy(86,385), 2.0).
region(r508, '#c9c9c9', 118, centroid(178,75)).
perimeter(r508, 60).
polygon(r508, [xy(177,84),xy(174,84),xy(176,77),xy(171,68),xy(179,68),xy(182,74),xy(182,81),xy(177,84)]).
midline(r508, [xy(178,81),xy(178,72),xy(171,68)]).
fillpoint(r508, xy(178,74), 4.0).
fillpoint(r508, xy(179,77), 4.0).
fillpoint(r508, xy(177,71), 3.2).
fillpoint(r508, xy(175,70), 2.8).
fillpoint(r508, xy(171,68), 1.0).
region(r2064, '#fcfcfc', 103, centroid(128,181)).
perimeter(r2064, 44).
polygon(r2064, [xy(131,186),xy(125,186),xy(122,184),xy(122,179),xy(126,176),xy(130,176),xy(134,179),xy(134,184),xy(131,186)]).
midline(r2064, [xy(128,181)]).
fillpoint(r2064, xy(128,181), 5.7).
region(r2196, '#fbfbfb', 97, centroid(140,186)).
perimeter(r2196, 46).
polygon(r2196, [xy(142,192),xy(136,192),xy(134,188),xy(138,180),xy(146,184),xy(146,188),xy(142,192)]).
midline(r2196, [xy(140,187),xy(141,186)]).
fillpoint(r2196, xy(141,186), 5.0).
fillpoint(r2196, xy(140,187), 5.0).

adjacent(r1, r2362).
shared_edge(r1, r2362, 9).
adjacent(r1, r3694).
shared_edge(r1, r3694, 4).
adjacent(r1, r3705).
shared_edge(r1, r3705, 32).
adjacent(r312, r2362).
shared_edge(r312, r2362, 36).
adjacent(r2362, r3170).
shared_edge(r2362, r3170, 1).
adjacent(r3705, r3845).
shared_edge(r3705, r3845, 13).

