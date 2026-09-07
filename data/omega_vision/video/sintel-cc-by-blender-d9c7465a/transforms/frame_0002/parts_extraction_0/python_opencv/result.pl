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
img_size(854, 364).

region(r1, '#a0a8aa', 310674, centroid(427,181)).
perimeter(r1, 3076).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(630,358),xy(632,358),xy(630,358)]).
hole(r1, [xy(630,353),xy(632,353),xy(630,353)]).
hole(r1, [xy(629,352),xy(631,352),xy(629,352)]).
hole(r1, [xy(628,351),xy(630,351),xy(628,351)]).
hole(r1, [xy(478,351),xy(480,351),xy(478,351)]).
hole(r1, [xy(477,350),xy(479,350),xy(477,350)]).
hole(r1, [xy(627,349),xy(629,349),xy(627,349)]).
hole(r1, [xy(476,349),xy(478,349),xy(476,349)]).
hole(r1, [xy(626,348),xy(628,348),xy(626,348)]).
hole(r1, [xy(475,348),xy(477,348),xy(475,348)]).
hole(r1, [xy(625,347),xy(627,347),xy(625,347)]).
hole(r1, [xy(624,345),xy(626,345),xy(624,345)]).
hole(r1, [xy(623,344),xy(625,344),xy(623,344)]).
hole(r1, [xy(622,343),xy(624,343),xy(622,343)]).
hole(r1, [xy(494,343),xy(496,343),xy(494,343)]).
hole(r1, [xy(621,342),xy(623,342),xy(621,342)]).
hole(r1, [xy(493,342),xy(495,342),xy(493,342)]).
hole(r1, [xy(468,342),xy(470,342),xy(468,342)]).
hole(r1, [xy(492,341),xy(494,341),xy(492,341)]).
hole(r1, [xy(620,340),xy(622,340),xy(620,340)]).
hole(r1, [xy(619,339),xy(621,339),xy(619,339)]).
hole(r1, [xy(489,338),xy(491,338),xy(489,338)]).
hole(r1, [xy(484,335),xy(486,335),xy(484,335)]).
hole(r1, [xy(483,333),xy(485,333),xy(483,333)]).
hole(r1, [xy(481,332),xy(483,332),xy(481,332)]).
hole(r1, [xy(374,315),xy(376,315),xy(374,315)]).
hole(r1, [xy(507,314),xy(509,314),xy(507,314)]).
hole(r1, [xy(373,314),xy(375,314),xy(373,314)]).
hole(r1, [xy(506,313),xy(508,313),xy(506,313)]).
hole(r1, [xy(534,310),xy(536,310),xy(534,310)]).
hole(r1, [xy(533,309),xy(535,309),xy(533,309)]).
hole(r1, [xy(532,308),xy(534,308),xy(532,308)]).
hole(r1, [xy(397,307),xy(399,307),xy(397,307)]).
hole(r1, [xy(528,304),xy(530,303),xy(533,307),xy(528,304)]).
hole(r1, [xy(314,265),xy(316,265),xy(314,265)]).
hole(r1, [xy(313,249),xy(315,249),xy(313,249)]).
hole(r1, [xy(168,242),xy(170,242),xy(168,242)]).
hole(r1, [xy(150,228),xy(152,228),xy(150,228)]).
hole(r1, [xy(151,227),xy(153,227),xy(151,227)]).
hole(r1, [xy(152,226),xy(154,226),xy(152,226)]).
hole(r1, [xy(153,225),xy(155,225),xy(153,225)]).
hole(r1, [xy(154,224),xy(156,224),xy(154,224)]).
hole(r1, [xy(155,221),xy(157,221),xy(155,221)]).
hole(r1, [xy(157,217),xy(159,217),xy(157,217)]).
hole(r1, [xy(146,217),xy(148,217),xy(146,217)]).
hole(r1, [xy(158,216),xy(160,216),xy(158,216)]).
hole(r1, [xy(147,216),xy(149,216),xy(147,216)]).
hole(r1, [xy(173,215),xy(175,215),xy(173,215)]).
hole(r1, [xy(159,215),xy(161,215),xy(159,215)]).
hole(r1, [xy(180,211),xy(182,211),xy(180,211)]).
hole(r1, [xy(181,210),xy(183,210),xy(181,210)]).
hole(r1, [xy(224,209),xy(226,209),xy(224,209)]).
hole(r1, [xy(182,208),xy(186,208),xy(182,208)]).
hole(r1, [xy(21,199),xy(22,202),xy(17,208),xy(16,206),xy(21,199)]).
hole(r1, [xy(212,199),xy(214,199),xy(212,199)]).
hole(r1, [xy(211,198),xy(213,198),xy(211,198)]).
hole(r1, [xy(227,196),xy(230,196),xy(227,196)]).
hole(r1, [xy(207,195),xy(209,195),xy(207,195)]).
hole(r1, [xy(202,195),xy(204,195),xy(202,195)]).
hole(r1, [xy(201,191),xy(203,191),xy(201,191)]).
hole(r1, [xy(176,191),xy(178,191),xy(176,191)]).
hole(r1, [xy(177,190),xy(179,190),xy(177,190)]).
hole(r1, [xy(178,189),xy(180,189),xy(178,189)]).
hole(r1, [xy(13,189),xy(15,189),xy(13,189)]).
hole(r1, [xy(5,188),xy(7,188),xy(5,188)]).
hole(r1, [xy(179,187),xy(181,187),xy(179,187)]).
hole(r1, [xy(167,187),xy(169,187),xy(167,187)]).
hole(r1, [xy(168,186),xy(170,186),xy(168,186)]).
hole(r1, [xy(6,186),xy(8,186),xy(6,186)]).
hole(r1, [xy(213,184),xy(214,189),xy(212,190),xy(211,186),xy(213,184)]).
hole(r1, [xy(169,185),xy(171,185),xy(169,185)]).
hole(r1, [xy(7,184),xy(9,184),xy(7,184)]).
hole(r1, [xy(17,182),xy(19,182),xy(17,182)]).
hole(r1, [xy(8,182),xy(10,183),xy(8,182)]).
hole(r1, [xy(9,181),xy(11,181),xy(9,181)]).
hole(r1, [xy(70,180),xy(72,180),xy(70,180)]).
hole(r1, [xy(71,179),xy(73,179),xy(71,179)]).
hole(r1, [xy(58,179),xy(60,179),xy(58,179)]).
hole(r1, [xy(10,179),xy(12,179),xy(10,179)]).
hole(r1, [xy(72,178),xy(74,178),xy(72,178)]).
hole(r1, [xy(59,178),xy(61,178),xy(59,178)]).
hole(r1, [xy(11,178),xy(13,178),xy(11,178)]).
hole(r1, [xy(60,176),xy(62,176),xy(60,176)]).
hole(r1, [xy(12,176),xy(14,176),xy(12,176)]).
hole(r1, [xy(61,175),xy(63,175),xy(61,175)]).
hole(r1, [xy(16,175),xy(18,175),xy(16,175)]).
hole(r1, [xy(13,175),xy(15,175),xy(13,175)]).
hole(r1, [xy(62,174),xy(64,174),xy(62,174)]).
hole(r1, [xy(75,173),xy(77,173),xy(75,173)]).
hole(r1, [xy(14,173),xy(16,173),xy(14,173)]).
hole(r1, [xy(15,172),xy(17,172),xy(15,172)]).
hole(r1, [xy(194,171),xy(196,171),xy(194,171)]).
hole(r1, [xy(76,171),xy(78,171),xy(76,171)]).
hole(r1, [xy(193,170),xy(195,170),xy(193,170)]).
hole(r1, [xy(116,166),xy(118,166),xy(116,166)]).
hole(r1, [xy(179,164),xy(181,164),xy(179,164)]).
hole(r1, [xy(115,164),xy(117,165),xy(115,164)]).
hole(r1, [xy(181,163),xy(183,163),xy(181,163)]).
hole(r1, [xy(82,163),xy(84,163),xy(82,163)]).
hole(r1, [xy(83,162),xy(85,162),xy(83,162)]).
hole(r1, [xy(159,159),xy(161,159),xy(159,159)]).
hole(r1, [xy(83,153),xy(85,153),xy(83,153)]).
hole(r1, [xy(86,150),xy(88,150),xy(86,150)]).
hole(r1, [xy(87,149),xy(89,149),xy(87,149)]).
hole(r1, [xy(98,148),xy(100,148),xy(98,148)]).
hole(r1, [xy(88,148),xy(90,148),xy(88,148)]).
hole(r1, [xy(90,147),xy(92,147),xy(90,147)]).
hole(r1, [xy(91,146),xy(93,146),xy(91,146)]).
hole(r1, [xy(92,145),xy(94,145),xy(92,145)]).
hole(r1, [xy(82,128),xy(84,128),xy(82,128)]).
hole(r1, [xy(83,127),xy(85,127),xy(83,127)]).
hole(r1, [xy(153,123),xy(155,123),xy(153,123)]).
hole(r1, [xy(85,123),xy(87,123),xy(85,123)]).
hole(r1, [xy(154,122),xy(156,122),xy(154,122)]).
hole(r1, [xy(155,121),xy(157,121),xy(155,121)]).
hole(r1, [xy(86,121),xy(88,122),xy(86,121)]).
hole(r1, [xy(87,120),xy(89,120),xy(87,120)]).
hole(r1, [xy(156,119),xy(158,119),xy(156,119)]).
hole(r1, [xy(135,119),xy(137,119),xy(135,119)]).
hole(r1, [xy(88,119),xy(90,119),xy(88,119)]).
hole(r1, [xy(157,117),xy(159,118),xy(157,117)]).
hole(r1, [xy(158,116),xy(160,116),xy(158,116)]).
hole(r1, [xy(132,116),xy(134,116),xy(132,116)]).
hole(r1, [xy(187,112),xy(190,112),xy(187,112)]).
hole(r1, [xy(91,112),xy(93,112),xy(91,112)]).
hole(r1, [xy(39,112),xy(41,112),xy(39,112)]).
hole(r1, [xy(185,109),xy(187,109),xy(185,109)]).
hole(r1, [xy(41,109),xy(43,109),xy(41,109)]).
hole(r1, [xy(42,108),xy(44,108),xy(42,108)]).
hole(r1, [xy(88,105),xy(90,105),xy(88,105)]).
hole(r1, [xy(44,105),xy(46,105),xy(44,105)]).
hole(r1, [xy(45,104),xy(47,104),xy(45,104)]).
hole(r1, [xy(46,103),xy(48,103),xy(46,103)]).
hole(r1, [xy(48,100),xy(50,100),xy(48,100)]).
hole(r1, [xy(52,93),xy(54,93),xy(52,93)]).
hole(r1, [xy(76,92),xy(78,92),xy(76,92)]).
hole(r1, [xy(53,92),xy(55,92),xy(53,92)]).
hole(r1, [xy(75,89),xy(77,89),xy(75,89)]).
hole(r1, [xy(90,79),xy(92,79),xy(90,79)]).
hole(r1, [xy(94,73),xy(96,73),xy(94,73)]).
hole(r1, [xy(97,69),xy(99,69),xy(97,69)]).
hole(r1, [xy(99,66),xy(101,66),xy(99,66)]).
hole(r1, [xy(149,52),xy(151,52),xy(149,52)]).
hole(r1, [xy(148,51),xy(150,51),xy(148,51)]).
hole(r1, [xy(147,50),xy(149,50),xy(147,50)]).
midline(r1, [xy(642,254),xy(562,333),xy(558,333),xy(534,311)]).
midline(r1, [xy(641,255),xy(621,275)]).
midline(r1, [xy(620,277),xy(619,340),xy(631,354),xy(630,359),xy(631,359),xy(632,357)]).
midline(r1, [xy(632,354),xy(632,353),xy(626,345),xy(622,341),xy(622,340),xy(620,338),xy(622,339)]).
midline(r1, [xy(627,346),xy(629,348)]).
midline(r1, [xy(626,344),xy(623,341)]).
midline(r1, [xy(630,350),xy(632,352)]).
midline(r1, [xy(618,278),xy(563,333)]).
midline(r1, [xy(384,218),xy(379,213),xy(343,249),xy(313,248),xy(313,250),xy(315,250)]).
midline(r1, [xy(344,249),xy(372,221)]).
midline(r1, [xy(385,219),xy(398,232),xy(397,308),xy(398,308),xy(399,307),xy(398,306),xy(399,306)]).
midline(r1, [xy(399,233),xy(469,303),xy(468,343),xy(469,343),xy(470,341)]).
midline(r1, [xy(470,304),xy(476,310),xy(475,349),xy(478,352),xy(480,351),xy(476,347),xy(480,350)]).
midline(r1, [xy(374,220),xy(373,315),xy(375,316),xy(376,315),xy(374,313),xy(376,314)]).
midline(r1, [xy(477,311),xy(480,314),xy(506,312),xy(506,314),xy(508,315),xy(509,314),xy(507,312),xy(509,313)]).
midline(r1, [xy(379,212),xy(379,154),xy(381,151),xy(327,97),xy(311,97),xy(306,92),xy(282,92),xy(245,55),xy(151,55),xy(147,51),xy(147,49),xy(149,49),xy(149,50),xy(148,51),xy(150,50),xy(151,53)]).
midline(r1, [xy(150,55),xy(137,55),xy(128,59),xy(60,61),xy(44,77),xy(44,106),xy(39,111),xy(39,113),xy(40,113),xy(42,110),xy(41,113)]).
midline(r1, [xy(45,77),xy(60,62)]).
midline(r1, [xy(44,93),xy(52,92),xy(53,94),xy(54,93),xy(53,92),xy(53,91),xy(55,91),xy(54,94)]).
midline(r1, [xy(91,62),xy(88,104),xy(88,106),xy(89,106),xy(90,104)]).
midline(r1, [xy(135,57),xy(185,110),xy(186,110),xy(187,109),xy(186,108),xy(187,108)]).
midline(r1, [xy(76,62),xy(75,90),xy(77,93),xy(78,92),xy(77,88)]).
midline(r1, [xy(129,59),xy(171,101),xy(158,116),xy(171,104),xy(173,106),xy(173,128),xy(193,149),xy(191,151),xy(178,151),xy(171,158),xy(162,162),xy(139,139),xy(133,139),xy(122,128),xy(108,142),xy(92,144),xy(68,167),xy(61,160),xy(49,159),xy(48,148),xy(44,144),xy(14,172),xy(9,180),xy(11,180),xy(11,182)]).
midline(r1, [xy(72,164),xy(68,168),xy(67,174),xy(62,173),xy(60,175),xy(58,178),xy(59,180),xy(60,179),xy(59,178),xy(60,177),xy(61,177),xy(60,180)]).
midline(r1, [xy(178,152),xy(172,158),xy(179,165),xy(180,165),xy(181,164),xy(181,162),xy(183,162),xy(183,163),xy(181,165)]).
midline(r1, [xy(81,155),xy(75,161)]).
midline(r1, [xy(193,150),xy(227,148),xy(282,93)]).
midline(r1, [xy(96,144),xy(98,149),xy(99,149),xy(100,147)]).
midline(r1, [xy(74,163),xy(82,162),xy(83,164),xy(84,163),xy(83,162),xy(83,161),xy(85,161),xy(84,164)]).
midline(r1, [xy(44,143),xy(42,140),xy(5,177),xy(5,189),xy(6,189),xy(8,186),xy(7,183),xy(8,183),xy(9,184),xy(8,185),xy(9,185)]).
midline(r1, [xy(6,177),xy(42,141)]).
midline(r1, [xy(7,189),xy(9,191),xy(8,216),xy(77,285),xy(98,285),xy(102,282),xy(102,246),xy(68,212),xy(68,174),xy(75,172),xy(75,174),xy(76,174),xy(77,173),xy(76,170),xy(78,170),xy(78,172)]).
midline(r1, [xy(102,283),xy(107,283),xy(172,218),xy(173,214),xy(175,214),xy(175,215),xy(173,217)]).
midline(r1, [xy(122,127),xy(122,89),xy(118,85),xy(91,111),xy(91,113),xy(92,113),xy(118,86)]).
midline(r1, [xy(93,113),xy(87,119),xy(87,120),xy(88,119),xy(89,120),xy(88,121),xy(89,121),xy(93,115)]).
midline(r1, [xy(118,84),xy(99,64),xy(98,60)]).
midline(r1, [xy(108,284),xy(110,286),xy(168,286),xy(168,241),xy(170,241),xy(170,243)]).
midline(r1, [xy(169,286),xy(262,286),xy(268,280),xy(207,218),xy(207,210),xy(199,202),xy(200,194),xy(166,162),xy(169,159)]).
midline(r1, [xy(180,177),xy(180,185),xy(176,190),xy(177,192),xy(178,191),xy(177,190),xy(179,188),xy(180,188),xy(178,192)]).
midline(r1, [xy(181,188),xy(181,186)]).
midline(r1, [xy(44,145),xy(15,172)]).
midline(r1, [xy(122,129),xy(109,142)]).
midline(r1, [xy(159,158),xy(161,158),xy(161,160)]).
midline(r1, [xy(42,108),xy(43,109),xy(43,110),xy(44,109),xy(46,105),xy(45,104),xy(45,103),xy(48,99),xy(50,99),xy(50,100),xy(46,106)]).
midline(r1, [xy(10,191),xy(13,188),xy(15,188),xy(15,189),xy(13,191)]).
midline(r1, [xy(15,190),xy(20,189),xy(25,184),xy(19,181),xy(17,181),xy(17,183),xy(19,183)]).
midline(r1, [xy(379,214),xy(375,218)]).
midline(r1, [xy(481,315),xy(483,317),xy(483,330),xy(481,331),xy(481,333),xy(482,333),xy(483,332),xy(483,331),xy(483,334),xy(485,336),xy(486,335),xy(485,332)]).
midline(r1, [xy(484,318),xy(490,324),xy(489,339),xy(490,339),xy(491,338),xy(490,337),xy(491,337)]).
midline(r1, [xy(491,325),xy(502,335),xy(558,334)]).
midline(r1, [xy(184,162),xy(194,172),xy(196,171),xy(194,169),xy(196,170)]).
midline(r1, [xy(44,140),xy(43,112)]).
midline(r1, [xy(381,152),xy(685,152),xy(693,160),xy(693,202),xy(642,253),xy(692,204)]).
midline(r1, [xy(225,235),xy(224,208),xy(226,208),xy(226,210)]).
midline(r1, [xy(83,154),xy(84,154),xy(88,150),xy(87,149),xy(88,148),xy(89,149),xy(88,151)]).
midline(r1, [xy(99,65),xy(95,69),xy(94,74),xy(95,74),xy(96,72)]).
midline(r1, [xy(170,167),xy(170,183),xy(167,186),xy(167,188),xy(168,188),xy(169,187),xy(168,186),xy(170,184),xy(171,184),xy(171,185),xy(169,188)]).
midline(r1, [xy(268,281),xy(312,280),xy(326,266),xy(316,264),xy(314,264),xy(314,266),xy(316,266)]).
midline(r1, [xy(326,265),xy(342,251)]).
midline(r1, [xy(175,216),xy(180,213),xy(181,209),xy(183,209),xy(183,210),xy(181,212),xy(183,211)]).
midline(r1, [xy(90,80),xy(91,80),xy(92,78)]).
midline(r1, [xy(25,182),xy(49,160)]).
midline(r1, [xy(123,116),xy(132,115),xy(133,117),xy(134,115)]).
midline(r1, [xy(155,120),xy(153,122),xy(153,125),xy(140,138),xy(153,126)]).
midline(r1, [xy(140,226),xy(122,226),xy(103,246),xy(122,227)]).
midline(r1, [xy(141,226),xy(150,226),xy(150,229),xy(151,229),xy(152,228),xy(151,227),xy(151,226),xy(155,223),xy(155,220),xy(157,216),xy(159,214),xy(161,215),xy(158,218),xy(157,218)]).
midline(r1, [xy(152,229),xy(155,226),xy(157,220)]).
midline(r1, [xy(159,218),xy(161,216)]).
midline(r1, [xy(157,166),xy(150,173),xy(150,194),xy(148,196),xy(116,167)]).
midline(r1, [xy(151,173),xy(161,163)]).
midline(r1, [xy(149,196),xy(148,200),xy(131,218)]).
midline(r1, [xy(147,202),xy(134,215)]).
midline(r1, [xy(133,217),xy(146,216),xy(147,218),xy(148,217),xy(147,216),xy(147,215),xy(149,215),xy(148,218)]).
midline(r1, [xy(237,172),xy(221,187),xy(221,196),xy(214,203),xy(211,199),xy(211,197),xy(213,197),xy(213,198),xy(212,199),xy(213,200),xy(214,198)]).
midline(r1, [xy(236,173),xy(222,187)]).
midline(r1, [xy(220,198),xy(215,203)]).
midline(r1, [xy(213,203),xy(207,208),xy(207,194),xy(209,194),xy(209,196)]).
midline(r1, [xy(213,205),xy(209,209)]).
midline(r1, [xy(61,175),xy(62,174),xy(63,175),xy(62,177),xy(64,174)]).
midline(r1, [xy(295,113),xy(238,171),xy(311,98)]).
midline(r1, [xy(201,190),xy(201,194),xy(203,191),xy(202,190),xy(203,190)]).
midline(r1, [xy(157,120),xy(156,118),xy(157,118),xy(158,120),xy(156,120),xy(154,122),xy(155,123),xy(154,124),xy(157,122)]).
midline(r1, [xy(98,70),xy(97,70)]).
midline(r1, [xy(99,70),xy(101,67)]).
midline(r1, [xy(536,309),xy(533,307),xy(536,310)]).
midline(r1, [xy(73,139),xy(54,158),xy(82,131),xy(82,127),xy(85,125),xy(85,122),xy(86,122),xy(87,123),xy(86,124),xy(87,124)]).
midline(r1, [xy(85,126),xy(85,127),xy(83,129),xy(85,128)]).
midline(r1, [xy(71,181),xy(70,181)]).
midline(r1, [xy(14,177),xy(13,178)]).
midline(r1, [xy(74,177),xy(72,177),xy(70,179),xy(72,178),xy(73,179),xy(72,181),xy(74,178)]).
midline(r1, [xy(202,195),xy(204,194),xy(204,195),xy(202,196)]).
midline(r1, [xy(94,145),xy(93,146),xy(92,145),xy(90,147),xy(90,149),xy(94,146)]).
midline(r1, [xy(134,118),xy(135,120),xy(136,120),xy(137,119),xy(136,118),xy(137,118)]).
midline(r1, [xy(495,344),xy(492,341),xy(491,339),xy(494,340),xy(496,344)]).
midline(r1, [xy(492,342),xy(494,344)]).
midline(r1, [xy(17,173),xy(13,175),xy(14,176),xy(17,176),xy(18,174)]).
midline(r1, [xy(118,165),xy(118,166)]).
fillpoint(r1, xy(672,180), 172.9).
fillpoint(r1, xy(667,179), 171.9).
fillpoint(r1, xy(662,178), 170.9).
fillpoint(r1, xy(658,177), 170.0).
fillpoint(r1, xy(653,176), 169.0).
fillpoint(r1, xy(648,175), 168.1).
fillpoint(r1, xy(644,174), 167.1).
fillpoint(r1, xy(639,173), 166.2).
fillpoint(r1, xy(635,172), 165.2).
fillpoint(r1, xy(630,171), 164.3).
fillpoint(r1, xy(625,170), 163.3).
fillpoint(r1, xy(615,170), 163.2).
fillpoint(r1, xy(611,169), 162.4).
fillpoint(r1, xy(620,169), 162.4).
fillpoint(r1, xy(607,168), 161.4).
fillpoint(r1, xy(602,167), 160.4).
fillpoint(r1, xy(459,166), 159.5).
fillpoint(r1, xy(598,166), 159.5).
fillpoint(r1, xy(454,165), 158.5).
fillpoint(r1, xy(465,165), 158.5).
fillpoint(r1, xy(593,165), 158.5).
fillpoint(r1, xy(450,164), 157.6).
fillpoint(r1, xy(470,164), 157.6).
fillpoint(r1, xy(588,164), 157.6).
fillpoint(r1, xy(445,163), 156.6).
fillpoint(r1, xy(474,163), 156.6).
fillpoint(r1, xy(584,163), 156.6).
fillpoint(r1, xy(440,162), 155.7).
fillpoint(r1, xy(479,162), 155.7).
fillpoint(r1, xy(579,162), 155.7).
fillpoint(r1, xy(483,161), 154.7).
fillpoint(r1, xy(575,161), 154.7).
fillpoint(r1, xy(488,160), 153.8).
fillpoint(r1, xy(570,160), 153.8).
fillpoint(r1, xy(493,159), 152.8).
fillpoint(r1, xy(565,159), 152.8).
fillpoint(r1, xy(497,158), 151.8).
fillpoint(r1, xy(561,158), 151.8).
fillpoint(r1, xy(502,157), 150.9).
fillpoint(r1, xy(556,157), 150.9).
fillpoint(r1, xy(507,156), 149.9).
fillpoint(r1, xy(552,156), 149.9).
fillpoint(r1, xy(512,155), 149.0).
fillpoint(r1, xy(547,155), 149.0).
fillpoint(r1, xy(517,154), 148.0).
fillpoint(r1, xy(542,154), 148.0).
fillpoint(r1, xy(522,153), 147.1).
fillpoint(r1, xy(538,153), 147.1).
fillpoint(r1, xy(526,152), 146.1).
fillpoint(r1, xy(533,152), 146.1).
fillpoint(r1, xy(412,145), 139.4).
fillpoint(r1, xy(407,144), 138.5).
fillpoint(r1, xy(402,143), 137.5).
fillpoint(r1, xy(398,142), 136.6).
fillpoint(r1, xy(393,141), 135.6).
fillpoint(r1, xy(389,140), 134.7).
fillpoint(r1, xy(384,139), 133.7).
fillpoint(r1, xy(379,138), 132.7).
fillpoint(r1, xy(375,137), 131.8).
fillpoint(r1, xy(370,136), 130.8).
fillpoint(r1, xy(366,135), 129.9).
fillpoint(r1, xy(361,134), 128.9).
fillpoint(r1, xy(356,133), 128.0).
fillpoint(r1, xy(352,132), 127.0).
fillpoint(r1, xy(347,131), 126.1).
fillpoint(r1, xy(342,130), 125.1).
fillpoint(r1, xy(338,129), 124.2).
fillpoint(r1, xy(333,128), 123.2).
fillpoint(r1, xy(329,127), 122.2).
fillpoint(r1, xy(306,114), 109.8).
fillpoint(r1, xy(86,277), 82.4).
fillpoint(r1, xy(85,275), 82.1).
fillpoint(r1, xy(84,270), 81.2).
fillpoint(r1, xy(83,266), 80.2).
fillpoint(r1, xy(82,261), 79.3).
fillpoint(r1, xy(241,283), 77.3).
fillpoint(r1, xy(237,284), 76.4).
fillpoint(r1, xy(100,285), 75.4).
fillpoint(r1, xy(233,285), 75.4).
fillpoint(r1, xy(104,286), 74.5).
fillpoint(r1, xy(228,286), 74.5).
fillpoint(r1, xy(109,287), 73.5).
fillpoint(r1, xy(122,293), 67.8).
fillpoint(r1, xy(216,293), 67.8).
fillpoint(r1, xy(127,294), 66.9).
fillpoint(r1, xy(211,294), 66.9).
fillpoint(r1, xy(132,295), 65.9).
fillpoint(r1, xy(207,295), 65.9).
fillpoint(r1, xy(136,296), 64.9).
fillpoint(r1, xy(202,296), 64.9).
fillpoint(r1, xy(141,297), 64.0).
fillpoint(r1, xy(197,297), 64.0).
fillpoint(r1, xy(234,65), 63.0).
fillpoint(r1, xy(145,298), 63.0).
fillpoint(r1, xy(193,298), 63.0).
fillpoint(r1, xy(150,299), 62.1).
fillpoint(r1, xy(188,299), 62.1).
fillpoint(r1, xy(228,63), 61.1).
fillpoint(r1, xy(155,300), 61.1).
fillpoint(r1, xy(184,300), 61.1).
fillpoint(r1, xy(224,62), 60.2).
fillpoint(r1, xy(159,301), 60.2).
fillpoint(r1, xy(179,301), 60.2).
fillpoint(r1, xy(219,61), 59.2).
fillpoint(r1, xy(164,302), 59.2).
fillpoint(r1, xy(174,302), 59.2).
fillpoint(r1, xy(214,60), 58.3).
fillpoint(r1, xy(169,303), 58.3).
fillpoint(r1, xy(210,59), 57.3).
fillpoint(r1, xy(280,307), 54.4).
fillpoint(r1, xy(285,308), 53.5).
fillpoint(r1, xy(289,309), 52.5).
fillpoint(r1, xy(294,310), 51.6).
fillpoint(r1, xy(276,214), 50.8).
fillpoint(r1, xy(273,221), 50.8).
fillpoint(r1, xy(266,237), 50.8).
fillpoint(r1, xy(263,244), 50.8).
fillpoint(r1, xy(275,216), 50.7).
fillpoint(r1, xy(272,223), 50.7).
fillpoint(r1, xy(270,228), 50.7).
fillpoint(r1, xy(269,230), 50.7).
fillpoint(r1, xy(267,235), 50.7).
fillpoint(r1, xy(264,242), 50.7).
fillpoint(r1, xy(274,219), 50.6).
fillpoint(r1, xy(271,226), 50.6).
fillpoint(r1, xy(268,232), 50.6).
fillpoint(r1, xy(265,239), 50.6).
fillpoint(r1, xy(298,311), 50.6).
fillpoint(r1, xy(303,312), 49.7).
fillpoint(r1, xy(308,313), 48.7).
fillpoint(r1, xy(323,313), 48.7).
fillpoint(r1, xy(312,314), 47.8).
fillpoint(r1, xy(318,314), 47.8).
fillpoint(r1, xy(583,312), 46.5).
fillpoint(r1, xy(582,314), 46.5).
fillpoint(r1, xy(47,47), 45.8).
fillpoint(r1, xy(51,46), 44.9).
fillpoint(r1, xy(58,46), 44.9).
fillpoint(r1, xy(105,209), 43.4).
fillpoint(r1, xy(106,207), 43.3).
border(r1).



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
opencv_morphology(r1, opening_area(310669), closing_area(313279), gradient_area(5552)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 2.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 2.0).
opencv_contour_hierarchy(r1, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r1, c5, hole, 2.0).
opencv_contour_hierarchy(r1, c5, next(c6), previous(c4), child(none), parent(c0)).
opencv_contour(r1, c6, hole, 2.0).
opencv_contour_hierarchy(r1, c6, next(c7), previous(c5), child(none), parent(c0)).
opencv_contour(r1, c7, hole, 2.0).
opencv_contour_hierarchy(r1, c7, next(c8), previous(c6), child(none), parent(c0)).
opencv_contour(r1, c8, hole, 2.0).
opencv_contour_hierarchy(r1, c8, next(c9), previous(c7), child(none), parent(c0)).
opencv_contour(r1, c9, hole, 2.0).
opencv_contour_hierarchy(r1, c9, next(c10), previous(c8), child(none), parent(c0)).
opencv_contour(r1, c10, hole, 2.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 2.0).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 2.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 2.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 2.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 2.0).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 2.0).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 2.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 2.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 2.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 2.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 2.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 2.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 2.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 2.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 2.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 2.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 2.0).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 2.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 2.0).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 2.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 2.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 2.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 11.5).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 2.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 2.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 2.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 2.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 2.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 2.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 2.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 2.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 2.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 2.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 2.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 2.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 2.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 2.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 6.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 24.5).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 2.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 2.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 4.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 2.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 2.0).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 2.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 2.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 2.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 2.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 2.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 2.0).
opencv_contour_hierarchy(r1, c65, next(c66), previous(c64), child(none), parent(c0)).
opencv_contour(r1, c66, hole, 2.0).
opencv_contour_hierarchy(r1, c66, next(c67), previous(c65), child(none), parent(c0)).
opencv_contour(r1, c67, hole, 2.0).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 2.0).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 2.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 14.5).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 2.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 2.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 4.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 2.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 2.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 2.0).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 2.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 2.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 2.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 2.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 2.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 2.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 2.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 2.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 2.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 2.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 2.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 2.0).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 2.0).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 2.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 2.0).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 2.0).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 2.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 2.0).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 2.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 4.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 2.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 2.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 2.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 2.0).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 2.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 2.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 2.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 2.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 2.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 2.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 2.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 2.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 2.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 2.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 2.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 2.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 2.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 2.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 4.0).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 2.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 2.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 2.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 2.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 4.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 2.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 2.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 4.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 2.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 2.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 2.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 2.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 2.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 2.0).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 2.0).
opencv_contour_hierarchy(r1, c131, next(c132), previous(c130), child(none), parent(c0)).
opencv_contour(r1, c132, hole, 2.0).
opencv_contour_hierarchy(r1, c132, next(c133), previous(c131), child(none), parent(c0)).
opencv_contour(r1, c133, hole, 2.0).
opencv_contour_hierarchy(r1, c133, next(c134), previous(c132), child(none), parent(c0)).
opencv_contour(r1, c134, hole, 2.0).
opencv_contour_hierarchy(r1, c134, next(c135), previous(c133), child(none), parent(c0)).
opencv_contour(r1, c135, hole, 2.0).
opencv_contour_hierarchy(r1, c135, next(c136), previous(c134), child(none), parent(c0)).
opencv_contour(r1, c136, hole, 2.0).
opencv_contour_hierarchy(r1, c136, next(c137), previous(c135), child(none), parent(c0)).
opencv_contour(r1, c137, hole, 2.0).
opencv_contour_hierarchy(r1, c137, next(c138), previous(c136), child(none), parent(c0)).
opencv_contour(r1, c138, hole, 2.0).
opencv_contour_hierarchy(r1, c138, next(c139), previous(c137), child(none), parent(c0)).
opencv_contour(r1, c139, hole, 2.0).
opencv_contour_hierarchy(r1, c139, next(c140), previous(c138), child(none), parent(c0)).
opencv_contour(r1, c140, hole, 2.0).
opencv_contour_hierarchy(r1, c140, next(c141), previous(c139), child(none), parent(c0)).
opencv_contour(r1, c141, hole, 2.0).
opencv_contour_hierarchy(r1, c141, next(c142), previous(c140), child(none), parent(c0)).
opencv_contour(r1, c142, hole, 2.0).
opencv_contour_hierarchy(r1, c142, next(c143), previous(c141), child(none), parent(c0)).
opencv_contour(r1, c143, hole, 2.0).
opencv_contour_hierarchy(r1, c143, next(c144), previous(c142), child(none), parent(c0)).
opencv_contour(r1, c144, hole, 2.0).
opencv_contour_hierarchy(r1, c144, next(c145), previous(c143), child(none), parent(c0)).
opencv_contour(r1, c145, hole, 2.0).
opencv_contour_hierarchy(r1, c145, next(none), previous(c144), child(none), parent(c0)).
