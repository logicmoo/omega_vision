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
img_size(281, 420).

region(r1, '#f8f8f8', 99936, centroid(139,200)).
perimeter(r1, 3558).
polygon(r1, [xy(152,393),xy(159,390),xy(161,384),xy(186,384),xy(194,378),xy(192,369),xy(182,360),xy(174,356),xy(174,350),xy(168,347),xy(168,319),xy(180,314),xy(180,291),xy(188,278),xy(174,235),xy(178,227),xy(174,217),xy(164,207),xy(162,195),xy(163,192),xy(172,188),xy(175,184),xy(203,182),xy(212,174),xy(208,159),xy(208,144),xy(214,135),xy(214,123),xy(208,115),xy(208,107),xy(204,104),xy(202,105),xy(204,107),xy(205,112),xy(198,108),xy(189,108),xy(179,116),xy(170,110),xy(155,110),xy(144,119),xy(140,126),xy(140,135),xy(144,144),xy(157,152),xy(171,152),xy(183,142),xy(202,142),xy(206,145),xy(206,150),xy(200,154),xy(190,157),xy(198,158),xy(204,155),xy(208,170),xy(208,176),xy(193,182),xy(162,182),xy(149,178),xy(146,176),xy(142,176),xy(140,180),xy(172,184),xy(169,188),xy(160,191),xy(158,202),xy(134,200),xy(124,192),xy(122,194),xy(120,192),xy(122,188),xy(116,194),xy(116,200),xy(108,207),xy(102,216),xy(100,229),xy(102,245),xy(92,262),xy(88,275),xy(88,288),xy(92,289),xy(98,303),xy(98,319),xy(116,324),xy(116,352),xy(110,357),xy(110,364),xy(104,379),xy(104,387),xy(120,392),xy(152,393)]).
hole(r1, [xy(124,175),xy(124,166),xy(120,164),xy(124,164),xy(118,159),xy(118,153),xy(122,148),xy(129,150),xy(130,148),xy(124,145),xy(120,107),xy(110,63),xy(118,66),xy(120,56),xy(127,64),xy(129,52),xy(137,60),xy(141,50),xy(148,58),xy(152,48),xy(159,56),xy(164,46),xy(170,56),xy(176,46),xy(180,56),xy(187,48),xy(192,58),xy(198,50),xy(200,44),xy(192,52),xy(187,44),xy(181,52),xy(176,42),xy(170,50),xy(164,42),xy(159,50),xy(151,44),xy(147,52),xy(141,46),xy(136,56),xy(128,48),xy(126,58),xy(119,52),xy(116,62),xy(109,58),xy(106,58),xy(122,136),xy(122,146),xy(116,153),xy(116,159),xy(124,167),xy(124,175)]).
hole(r1, [xy(124,159),xy(128,156),xy(127,152),xy(122,152),xy(120,155),xy(124,159)]).
hole(r1, [xy(128,166),xy(130,164),xy(129,162),xy(126,164),xy(128,166)]).
hole(r1, [xy(124,183),xy(123,180),xy(124,183)]).
hole(r1, [xy(124,188),xy(124,186),xy(124,188)]).
midline(r1, [xy(130,55),xy(136,75),xy(145,84),xy(144,86),xy(131,80),xy(126,75),xy(120,74),xy(112,64)]).
midline(r1, [xy(169,185),xy(157,187),xy(150,192),xy(134,187),xy(125,191),xy(121,185),xy(113,184),xy(104,177),xy(94,179),xy(80,178),xy(58,173),xy(59,120),xy(53,53),xy(73,38),xy(89,31),xy(121,24),xy(128,25),xy(151,21),xy(155,23),xy(157,21),xy(170,22),xy(170,50)]).
midline(r1, [xy(58,175),xy(51,205),xy(50,236),xy(44,266),xy(44,297),xy(49,317),xy(50,336),xy(55,353),xy(52,367),xy(80,394),xy(89,400),xy(101,404),xy(150,407),xy(171,403),xy(174,401),xy(171,397),xy(173,397)]).
midline(r1, [xy(171,21),xy(182,21),xy(184,23),xy(181,51)]).
midline(r1, [xy(142,87),xy(133,110),xy(131,122),xy(132,139),xy(138,148),xy(139,155),xy(123,150),xy(119,154),xy(120,158),xy(121,157)]).
midline(r1, [xy(121,159),xy(123,162),xy(105,177)]).
midline(r1, [xy(51,327),xy(51,323),xy(57,317),xy(53,325)]).
midline(r1, [xy(123,185),xy(129,179),xy(116,177),xy(113,174),xy(110,175)]).
midline(r1, [xy(176,47),xy(173,79),xy(171,82),xy(165,81),xy(148,84),xy(142,57)]).
midline(r1, [xy(197,148),xy(186,148),xy(177,165),xy(173,167),xy(155,166),xy(145,162),xy(140,156),xy(125,161),xy(125,163),xy(123,165),xy(121,165),xy(113,173)]).
midline(r1, [xy(177,166),xy(184,169),xy(195,169),xy(204,155)]).
midline(r1, [xy(141,24),xy(147,50)]).
midline(r1, [xy(126,58),xy(119,41),xy(107,29)]).
midline(r1, [xy(114,185),xy(121,192),xy(123,191)]).
midline(r1, [xy(136,55),xy(129,26)]).
midline(r1, [xy(59,319),xy(55,323)]).
midline(r1, [xy(116,62),xy(109,48),xy(93,32)]).
midline(r1, [xy(130,182),xy(132,181),xy(133,174),xy(125,167),xy(125,165),xy(127,165),xy(133,173)]).
midline(r1, [xy(135,172),xy(144,162)]).
midline(r1, [xy(132,183),xy(134,186)]).
midline(r1, [xy(175,402),xy(195,401),xy(209,397),xy(226,387),xy(238,376),xy(236,356),xy(228,333),xy(211,336),xy(188,335)]).
midline(r1, [xy(120,57),xy(126,74)]).
midline(r1, [xy(156,24),xy(158,50)]).
midline(r1, [xy(146,85),xy(147,85)]).
midline(r1, [xy(172,82),xy(183,83),xy(187,48)]).
midline(r1, [xy(152,48),xy(158,73),xy(165,80)]).
midline(r1, [xy(193,52),xy(195,45),xy(195,23),xy(185,22)]).
midline(r1, [xy(196,22),xy(206,22),xy(220,26),xy(240,40),xy(240,57),xy(237,72),xy(231,74),xy(228,74),xy(196,42)]).
midline(r1, [xy(201,49),xy(196,44)]).
midline(r1, [xy(199,49),xy(196,46)]).
midline(r1, [xy(237,74),xy(242,88),xy(247,115),xy(247,143),xy(244,155),xy(227,155),xy(220,148),xy(225,155)]).
midline(r1, [xy(226,74),xy(183,85),xy(190,90),xy(194,101),xy(203,109)]).
midline(r1, [xy(123,194),xy(123,193)]).
midline(r1, [xy(245,156),xy(245,188),xy(237,212),xy(228,226),xy(234,269),xy(234,290),xy(230,307),xy(229,332)]).
fillpoint(r1, xy(59,130), 60.0).
fillpoint(r1, xy(58,116), 59.0).
fillpoint(r1, xy(58,141), 59.0).
fillpoint(r1, xy(58,173), 59.0).
fillpoint(r1, xy(57,105), 58.0).
fillpoint(r1, xy(58,156), 58.0).
fillpoint(r1, xy(56,95), 57.0).
fillpoint(r1, xy(56,182), 57.0).
fillpoint(r1, xy(55,85), 56.0).
fillpoint(r1, xy(55,186), 56.0).
fillpoint(r1, xy(54,75), 55.0).
fillpoint(r1, xy(54,191), 55.0).
fillpoint(r1, xy(54,351), 55.0).
fillpoint(r1, xy(55,353), 55.0).
fillpoint(r1, xy(54,356), 55.0).
fillpoint(r1, xy(53,61), 54.0).
fillpoint(r1, xy(53,195), 54.0).
fillpoint(r1, xy(53,362), 54.0).
fillpoint(r1, xy(52,201), 53.0).
fillpoint(r1, xy(52,344), 53.0).
fillpoint(r1, xy(51,207), 52.0).
fillpoint(r1, xy(229,232), 52.0).
fillpoint(r1, xy(229,333), 52.0).
fillpoint(r1, xy(51,340), 52.0).
fillpoint(r1, xy(50,216), 51.0).
fillpoint(r1, xy(230,241), 51.0).
fillpoint(r1, xy(230,326), 51.0).
fillpoint(r1, xy(50,335), 51.0).
fillpoint(r1, xy(230,336), 51.0).
fillpoint(r1, xy(49,234), 50.0).
fillpoint(r1, xy(231,247), 50.0).
fillpoint(r1, xy(230,310), 50.0).
fillpoint(r1, xy(49,323), 50.0).
fillpoint(r1, xy(231,339), 50.0).
fillpoint(r1, xy(48,242), 49.0).
fillpoint(r1, xy(232,254), 49.0).
fillpoint(r1, xy(232,301), 49.0).
fillpoint(r1, xy(48,315), 49.0).
fillpoint(r1, xy(232,342), 49.0).
fillpoint(r1, xy(47,248), 48.0).
fillpoint(r1, xy(233,262), 48.0).
fillpoint(r1, xy(233,296), 48.0).
fillpoint(r1, xy(46,254), 47.0).
fillpoint(r1, xy(234,280), 47.0).
fillpoint(r1, xy(46,308), 47.0).
fillpoint(r1, xy(234,349), 47.0).
fillpoint(r1, xy(45,260), 46.0).
fillpoint(r1, xy(45,303), 46.0).
fillpoint(r1, xy(235,353), 46.0).
fillpoint(r1, xy(44,282), 45.0).
fillpoint(r1, xy(236,357), 45.0).
fillpoint(r1, xy(236,73), 44.4).
fillpoint(r1, xy(237,71), 44.0).
fillpoint(r1, xy(237,363), 44.0).
fillpoint(r1, xy(238,67), 43.0).
fillpoint(r1, xy(238,376), 43.0).
fillpoint(r1, xy(239,61), 42.0).
fillpoint(r1, xy(240,55), 41.0).
fillpoint(r1, xy(240,40), 40.3).
fillpoint(r1, xy(242,89), 39.0).
fillpoint(r1, xy(243,94), 38.0).
fillpoint(r1, xy(243,195), 38.0).
fillpoint(r1, xy(244,100), 37.0).
fillpoint(r1, xy(244,191), 37.0).
fillpoint(r1, xy(244,155), 36.1).
fillpoint(r1, xy(245,105), 36.0).
fillpoint(r1, xy(245,153), 36.0).
fillpoint(r1, xy(245,158), 36.0).
fillpoint(r1, xy(245,187), 36.0).
fillpoint(r1, xy(246,111), 35.0).
fillpoint(r1, xy(246,148), 35.0).
fillpoint(r1, xy(246,173), 35.0).
fillpoint(r1, xy(247,129), 34.0).
fillpoint(r1, xy(93,30), 31.0).
fillpoint(r1, xy(99,29), 30.0).
fillpoint(r1, xy(103,28), 29.0).
fillpoint(r1, xy(107,27), 28.0).
fillpoint(r1, xy(175,83), 27.5).
fillpoint(r1, xy(178,84), 27.2).
fillpoint(r1, xy(168,82), 27.1).
fillpoint(r1, xy(113,26), 27.0).
fillpoint(r1, xy(163,82), 27.0).
fillpoint(r1, xy(172,82), 27.0).
fillpoint(r1, xy(181,83), 27.0).
fillpoint(r1, xy(143,86), 26.7).
fillpoint(r1, xy(146,85), 26.6).
fillpoint(r1, xy(156,83), 26.2).
fillpoint(r1, xy(152,84), 26.2).
fillpoint(r1, xy(118,25), 26.0).
fillpoint(r1, xy(126,24), 25.0).
fillpoint(r1, xy(214,24), 25.0).
fillpoint(r1, xy(200,80), 24.2).
fillpoint(r1, xy(195,81), 24.2).
fillpoint(r1, xy(134,23), 24.0).
fillpoint(r1, xy(210,23), 24.0).
fillpoint(r1, xy(143,22), 23.0).
fillpoint(r1, xy(200,22), 23.0).
fillpoint(r1, xy(155,22), 22.2).
fillpoint(r1, xy(184,22), 22.2).
fillpoint(r1, xy(170,21), 22.0).
fillpoint(r1, xy(202,399), 21.0).
fillpoint(r1, xy(198,400), 20.0).
fillpoint(r1, xy(194,401), 19.0).
fillpoint(r1, xy(179,402), 18.0).
fillpoint(r1, xy(98,403), 17.0).
fillpoint(r1, xy(170,403), 17.0).
fillpoint(r1, xy(102,404), 16.0).
fillpoint(r1, xy(167,404), 16.0).
fillpoint(r1, xy(177,166), 15.8).
fillpoint(r1, xy(170,167), 15.0).
fillpoint(r1, xy(108,405), 15.0).
fillpoint(r1, xy(163,405), 15.0).
border(r1).
region(r1100, '#7d7d7d', 8341, centroid(135,264)).
perimeter(r1100, 1004).
polygon(r1100, [xy(140,356),xy(138,355),xy(138,324),xy(116,324),xy(104,320),xy(102,317),xy(102,303),xy(92,288),xy(94,287),xy(88,286),xy(90,271),xy(92,271),xy(96,259),xy(104,246),xy(104,239),xy(106,237),xy(100,236),xy(100,227),xy(110,208),xy(118,202),xy(123,202),xy(130,206),xy(136,219),xy(138,220),xy(132,206),xy(128,202),xy(118,199),xy(121,194),xy(132,202),xy(162,204),xy(172,246),xy(180,261),xy(184,275),xy(184,280),xy(182,281),xy(184,282),xy(182,285),xy(178,284),xy(180,285),xy(180,289),xy(167,304),xy(146,312),xy(146,350),xy(146,323),xy(138,324),xy(140,356)]).
hole(r1100, [xy(124,296),xy(134,294),xy(140,288),xy(122,295),xy(124,296)]).
hole(r1100, [xy(142,308),xy(144,304),xy(143,290),xy(142,300),xy(140,306),xy(142,308)]).
hole(r1100, [xy(138,236),xy(138,228),xy(138,233),xy(132,234),xy(138,236)]).
hole(r1100, [xy(132,241),xy(132,236),xy(132,241)]).
hole(r1100, [xy(116,297),xy(120,296),xy(114,297),xy(116,297)]).
hole(r1100, [xy(106,234),xy(102,234),xy(106,234)]).
hole(r1100, [xy(132,233),xy(128,233),xy(132,233)]).
hole(r1100, [xy(134,259),xy(134,256),xy(134,259)]).
hole(r1100, [xy(136,280),xy(136,276),xy(136,280)]).
hole(r1100, [xy(134,250),xy(133,248),xy(134,250)]).
hole(r1100, [xy(112,277),xy(112,274),xy(112,277)]).
hole(r1100, [xy(138,223),xy(137,222),xy(138,223)]).
hole(r1100, [xy(112,233),xy(110,233),xy(112,233)]).
hole(r1100, [xy(114,283),xy(113,282),xy(114,283)]).
hole(r1100, [xy(180,282),xy(178,282),xy(180,282)]).
hole(r1100, [xy(176,285),xy(174,285),xy(176,285)]).
hole(r1100, [xy(114,287),xy(114,286),xy(114,287)]).
hole(r1100, [xy(122,297),xy(120,297),xy(122,297)]).
hole(r1100, [xy(120,298),xy(118,298),xy(120,298)]).
midline(r1100, [xy(92,288),xy(93,289),xy(93,291)]).
midline(r1100, [xy(140,355),xy(139,355),xy(138,354),xy(138,317),xy(127,310),xy(114,310),xy(106,299),xy(106,291),xy(103,288),xy(94,288)]).
midline(r1100, [xy(117,312),xy(107,321)]).
midline(r1100, [xy(91,271),xy(97,279),xy(100,278),xy(103,274),xy(102,268),xy(105,262),xy(118,253),xy(110,244),xy(117,244),xy(109,235),xy(103,236),xy(101,234),xy(105,228),xy(102,223)]).
midline(r1100, [xy(116,309),xy(116,299),xy(107,292)]).
midline(r1100, [xy(111,292),xy(118,291),xy(123,286),xy(124,279),xy(122,277),xy(104,282),xy(101,279)]).
midline(r1100, [xy(124,277),xy(125,273),xy(123,270),xy(104,273)]).
midline(r1100, [xy(119,292),xy(120,297),xy(117,297),xy(114,294)]).
midline(r1100, [xy(126,282),xy(132,284),xy(136,290),xy(138,289),xy(134,284)]).
midline(r1100, [xy(126,272),xy(155,271),xy(145,281),xy(137,284)]).
midline(r1100, [xy(149,279),xy(157,271),xy(154,259),xy(123,265),xy(118,255)]).
midline(r1100, [xy(157,260),xy(163,254),xy(172,252),xy(177,255),xy(164,269),xy(158,269)]).
midline(r1100, [xy(165,269),xy(169,271),xy(177,281),xy(177,284),xy(175,284),xy(162,271)]).
midline(r1100, [xy(123,266),xy(123,269)]).
midline(r1100, [xy(157,273),xy(139,290),xy(138,297),xy(130,305),xy(121,298)]).
midline(r1100, [xy(120,256),xy(145,251),xy(148,248),xy(142,245),xy(132,234),xy(118,245),xy(118,250)]).
midline(r1100, [xy(120,247),xy(139,244)]).
midline(r1100, [xy(179,283),xy(182,282),xy(170,271)]).
midline(r1100, [xy(176,274),xy(177,275)]).
midline(r1100, [xy(122,279),xy(109,286),xy(106,289),xy(109,288)]).
midline(r1100, [xy(119,282),xy(118,283)]).
midline(r1100, [xy(103,283),xy(104,287)]).
midline(r1100, [xy(149,250),xy(154,246),xy(154,232),xy(151,224),xy(141,224),xy(138,221),xy(135,221),xy(130,226),xy(120,219),xy(106,228),xy(108,233)]).
midline(r1100, [xy(132,226),xy(140,225)]).
midline(r1100, [xy(141,291),xy(140,294)]).
midline(r1100, [xy(128,302),xy(122,296)]).
midline(r1100, [xy(134,228),xy(136,231),xy(134,233),xy(133,233),xy(126,224)]).
midline(r1100, [xy(137,233),xy(137,232)]).
midline(r1100, [xy(127,309),xy(128,305)]).
midline(r1100, [xy(155,258),xy(153,250)]).
midline(r1100, [xy(120,222),xy(119,243)]).
midline(r1100, [xy(182,285),xy(182,284)]).
midline(r1100, [xy(146,350),xy(146,323),xy(139,316),xy(151,303),xy(159,290),xy(156,277)]).
midline(r1100, [xy(160,290),xy(172,291),xy(177,285)]).
midline(r1100, [xy(152,223),xy(152,218),xy(149,215),xy(131,202),xy(121,197)]).
fillpoint(r1100, xy(157,269), 22.2).
fillpoint(r1100, xy(156,264), 21.0).
fillpoint(r1100, xy(155,261), 20.6).
fillpoint(r1100, xy(154,255), 20.0).
fillpoint(r1100, xy(153,251), 19.6).
fillpoint(r1100, xy(118,255), 15.7).
fillpoint(r1100, xy(159,290), 15.6).
fillpoint(r1100, xy(154,233), 15.1).
fillpoint(r1100, xy(153,229), 15.0).
fillpoint(r1100, xy(120,220), 14.9).
fillpoint(r1100, xy(152,224), 14.6).
fillpoint(r1100, xy(126,310), 13.6).
fillpoint(r1100, xy(151,217), 13.3).
fillpoint(r1100, xy(122,311), 13.0).
fillpoint(r1100, xy(122,263), 12.5).
fillpoint(r1100, xy(124,272), 12.4).
fillpoint(r1100, xy(116,310), 12.2).
fillpoint(r1100, xy(123,268), 12.0).
fillpoint(r1100, xy(124,277), 12.0).
fillpoint(r1100, xy(101,278), 11.0).
fillpoint(r1100, xy(102,274), 10.0).
fillpoint(r1100, xy(103,282), 10.0).
fillpoint(r1100, xy(104,288), 10.0).
fillpoint(r1100, xy(105,291), 9.8).
fillpoint(r1100, xy(104,264), 8.5).
fillpoint(r1100, xy(103,266), 8.5).
fillpoint(r1100, xy(138,316), 8.1).
fillpoint(r1100, xy(107,300), 6.3).
region(r480, '#fbfbfb', 1175, centroid(163,131)).
perimeter(r480, 182).
polygon(r480, [xy(165,150),xy(152,148),xy(146,141),xy(142,133),xy(146,119),xy(157,112),xy(168,112),xy(174,114),xy(182,128),xy(180,141),xy(173,148),xy(165,150)]).
hole(r480, [xy(160,133),xy(162,130),xy(157,128),xy(156,133),xy(160,133)]).
midline(r480, [xy(155,141),xy(150,136),xy(149,129),xy(156,120),xy(166,121),xy(172,129),xy(171,135),xy(167,140),xy(163,142),xy(156,141)]).
fillpoint(r480, xy(172,130), 10.4).
fillpoint(r480, xy(170,125), 10.3).
fillpoint(r480, xy(171,127), 10.3).
fillpoint(r480, xy(171,135), 10.3).
fillpoint(r480, xy(170,137), 9.9).
fillpoint(r480, xy(169,138), 9.9).
fillpoint(r480, xy(162,142), 8.9).
fillpoint(r480, xy(158,120), 8.0).
fillpoint(r480, xy(157,141), 8.0).
fillpoint(r480, xy(155,121), 7.3).
fillpoint(r480, xy(153,122), 7.1).
fillpoint(r480, xy(154,140), 7.1).
fillpoint(r480, xy(149,131), 6.7).
fillpoint(r480, xy(151,125), 6.4).
fillpoint(r480, xy(151,137), 6.4).
fillpoint(r480, xy(150,127), 6.3).
fillpoint(r480, xy(150,135), 6.3).
region(r1859, '#727272', 817, centroid(131,375)).
perimeter(r1859, 182).
polygon(r1859, [xy(151,384),xy(123,384),xy(108,380),xy(110,368),xy(116,364),xy(112,364),xy(112,357),xy(114,362),xy(120,364),xy(139,364),xy(142,368),xy(143,366),xy(156,380),xy(155,384),xy(151,384)]).
hole(r1859, [xy(118,365),xy(116,365),xy(118,365)]).
midline(r1859, [xy(112,357),xy(112,364),xy(118,373),xy(117,374)]).
midline(r1859, [xy(115,365),xy(116,364),xy(115,363),xy(114,363)]).
midline(r1859, [xy(119,374),xy(122,374),xy(123,370),xy(121,366),xy(117,364)]).
midline(r1859, [xy(124,374),xy(126,373),xy(124,371)]).
midline(r1859, [xy(127,374),xy(134,375),xy(137,371),xy(142,366),xy(143,366),xy(143,371),xy(138,376),xy(136,375)]).
midline(r1859, [xy(145,379),xy(140,376),xy(145,371),xy(150,373),xy(149,378),xy(146,379)]).
fillpoint(r1859, xy(127,375), 10.0).
fillpoint(r1859, xy(139,376), 9.0).
fillpoint(r1859, xy(147,379), 6.0).
region(r466, '#fcfcfc', 700, centroid(196,126)).
perimeter(r466, 156).
polygon(r466, [xy(207,142),xy(201,138),xy(182,140),xy(184,126),xy(180,117),xy(183,114),xy(191,110),xy(197,110),xy(208,117),xy(212,125),xy(212,133),xy(207,142)]).
hole(r466, [xy(196,132),xy(198,128),xy(193,126),xy(192,131),xy(196,132)]).
midline(r466, [xy(200,121),xy(197,119),xy(190,120),xy(188,126),xy(190,136),xy(197,136),xy(204,132),xy(204,125),xy(201,121)]).
fillpoint(r466, xy(192,119), 8.1).
fillpoint(r466, xy(195,119), 8.0).
fillpoint(r466, xy(199,120), 7.6).
fillpoint(r466, xy(201,121), 7.6).
fillpoint(r466, xy(204,126), 7.3).
fillpoint(r466, xy(203,124), 7.2).
fillpoint(r466, xy(204,132), 7.1).
fillpoint(r466, xy(204,130), 7.0).
fillpoint(r466, xy(189,136), 5.0).
fillpoint(r466, xy(188,130), 4.0).
fillpoint(r466, xy(194,136), 4.0).
region(r1768, '#c1c1c1', 599, centroid(127,340)).
perimeter(r1768, 104).
polygon(r1768, [xy(132,356),xy(122,356),xy(118,354),xy(118,324),xy(136,325),xy(136,354),xy(132,356)]).
midline(r1768, [xy(127,334),xy(127,347)]).
fillpoint(r1768, xy(127,341), 10.0).
region(r1750, '#c1c1c1', 582, centroid(156,336)).
perimeter(r1750, 102).
polygon(r1750, [xy(161,352),xy(151,352),xy(146,349),xy(146,323),xy(149,320),xy(166,320),xy(166,350),xy(161,352)]).
midline(r1750, [xy(156,342),xy(156,330),xy(152,325),xy(152,327)]).
fillpoint(r1750, xy(156,336), 10.0).
region(r1897, '#717171', 559, centroid(170,369)).
perimeter(r1897, 164).
polygon(r1897, [xy(158,380),xy(156,374),xy(158,370),xy(158,365),xy(155,362),xy(149,362),xy(145,364),xy(142,362),xy(144,360),xy(175,358),xy(190,371),xy(184,376),xy(158,378),xy(158,380)]).
midline(r1897, [xy(180,370),xy(168,369),xy(156,361),xy(149,360),xy(145,361),xy(145,363)]).
midline(r1897, [xy(167,370),xy(159,374),xy(156,377),xy(157,380)]).
midline(r1897, [xy(160,376),xy(158,378)]).
fillpoint(r1897, xy(170,369), 10.0).
region(r1650, '#585858', 406, centroid(164,315)).
perimeter(r1650, 210).
polygon(r1650, [xy(172,352),xy(166,350),xy(166,319),xy(147,322),xy(146,312),xy(157,308),xy(161,310),xy(178,296),xy(178,313),xy(164,317),xy(168,318),xy(168,347),xy(172,352)]).
hole(r1650, [xy(156,311),xy(154,311),xy(156,311)]).
midline(r1650, [xy(172,351),xy(167,347),xy(167,319),xy(166,318),xy(164,318),xy(156,310),xy(153,311),xy(151,316)]).
midline(r1650, [xy(157,309),xy(158,309),xy(162,313),xy(161,314)]).
midline(r1650, [xy(159,315),xy(153,316)]).
midline(r1650, [xy(177,297),xy(172,309),xy(163,313)]).
midline(r1650, [xy(167,350),xy(167,349)]).
fillpoint(r1650, xy(172,309), 5.8).
fillpoint(r1650, xy(171,310), 5.8).
fillpoint(r1650, xy(168,311), 5.4).
fillpoint(r1650, xy(173,307), 5.0).
fillpoint(r1650, xy(166,312), 5.0).
fillpoint(r1650, xy(161,314), 5.0).
fillpoint(r1650, xy(153,316), 5.0).
fillpoint(r1650, xy(160,315), 5.0).
fillpoint(r1650, xy(163,313), 4.5).
region(r2139, '#f4f4f4', 228, centroid(133,388)).
perimeter(r2139, 126).
polygon(r2139, [xy(149,392),xy(127,392),xy(110,388),xy(106,383),xy(122,386),xy(158,385),xy(156,390),xy(149,392)]).
midline(r2139, [xy(109,385),xy(124,389),xy(150,389),xy(156,387)]).
fillpoint(r2139, xy(138,389), 3.0).
fillpoint(r2139, xy(153,388), 2.2).
fillpoint(r2139, xy(118,387), 2.0).
fillpoint(r2139, xy(156,387), 2.0).
fillpoint(r2139, xy(151,389), 2.0).
region(r1840, '#f6f6f6', 143, centroid(127,360)).
perimeter(r1840, 74).
polygon(r1840, [xy(135,364),xy(119,364),xy(114,361),xy(114,357),xy(116,356),xy(121,358),xy(134,358),xy(140,356),xy(140,361),xy(135,364)]).
midline(r1840, [xy(116,359),xy(120,361),xy(137,360)]).
fillpoint(r1840, xy(118,360), 3.0).
fillpoint(r1840, xy(127,361), 3.0).
fillpoint(r1840, xy(116,359), 2.8).
fillpoint(r1840, xy(137,360), 2.8).
region(r1771, '#fdfdfd', 142, centroid(142,338)).
perimeter(r1771, 72).
polygon(r1771, [xy(141,354),xy(140,324),xy(144,324),xy(144,349),xy(141,354)]).
midline(r1771, [xy(141,354),xy(142,326)]).
fillpoint(r1771, xy(142,337), 3.0).
fillpoint(r1771, xy(141,353), 1.0).
region(r2082, '#f3f3f3', 129, centroid(176,380)).
perimeter(r2082, 84).
polygon(r2082, [xy(177,382),xy(160,382),xy(158,380),xy(192,375),xy(190,380),xy(177,382)]).
midline(r2082, [xy(161,381),xy(182,380),xy(190,377)]).
fillpoint(r2082, xy(190,377), 2.0).
fillpoint(r2082, xy(174,380), 2.0).
region(r1781, '#f2f2f2', 127, centroid(158,355)).
perimeter(r1781, 78).
polygon(r1781, [xy(161,358),xy(151,358),xy(144,354),xy(145,352),xy(149,354),xy(164,354),xy(169,350),xy(172,352),xy(170,356),xy(161,358)]).
midline(r1781, [xy(169,350),xy(170,352),xy(163,356),xy(146,354)]).
fillpoint(r1781, xy(156,356), 3.0).
fillpoint(r1781, xy(169,353), 2.2).
fillpoint(r1781, xy(146,354), 2.2).
fillpoint(r1781, xy(168,354), 2.2).
fillpoint(r1781, xy(148,355), 2.2).
fillpoint(r1781, xy(165,355), 2.0).
fillpoint(r1781, xy(169,350), 1.0).
region(r2041, '#131313', 96, centroid(128,383)).
perimeter(r2041, 140).
polygon(r2041, [xy(147,386),xy(116,384),xy(106,382),xy(106,377),xy(109,370),xy(108,380),xy(113,382),xy(123,384),xy(156,384),xy(147,386)]).
midline(r2041, [xy(108,371),xy(106,380),xy(109,382),xy(112,382),xy(113,383),xy(115,383),xy(116,384),xy(122,384),xy(123,385),xy(125,385),xy(126,386),xy(146,386),xy(147,385),xy(156,384)]).
fillpoint(r2041, xy(128,385), 1.0).
region(r1534, '#9d9d9d', 4, centroid(136,278)).
perimeter(r1534, 10).
polygon(r1534, [xy(136,280),xy(136,276),xy(136,280)]).
midline(r1534, [xy(136,277),xy(136,280)]).
fillpoint(r1534, xy(136,279), 1.0).

adjacent(r1, r1100).
shared_edge(r1, r1100, 12).
adjacent(r1, r1650).
shared_edge(r1, r1650, 1).
adjacent(r1, r2041).
shared_edge(r1, r2041, 2).
adjacent(r1100, r1534).
shared_edge(r1100, r1534, 10).
adjacent(r1100, r1650).
shared_edge(r1100, r1650, 16).
adjacent(r1100, r1750).
shared_edge(r1100, r1750, 27).
adjacent(r1100, r1768).
shared_edge(r1100, r1768, 2).
adjacent(r1100, r1771).
shared_edge(r1100, r1771, 3).
adjacent(r1650, r1750).
shared_edge(r1650, r1750, 17).
adjacent(r1650, r1781).
shared_edge(r1650, r1781, 1).
adjacent(r1840, r1859).
shared_edge(r1840, r1859, 2).
adjacent(r1859, r1897).
shared_edge(r1859, r1897, 1).
adjacent(r1859, r2041).
shared_edge(r1859, r2041, 57).
adjacent(r1897, r2082).
shared_edge(r1897, r2082, 19).
adjacent(r2041, r2139).
shared_edge(r2041, r2139, 26).

encloses(r1100, r1534).
