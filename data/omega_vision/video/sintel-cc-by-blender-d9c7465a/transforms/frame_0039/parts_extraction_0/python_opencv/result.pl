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

region(r1, '#675750', 310483, centroid(427,181)).
perimeter(r1, 3508).
polygon(r1, [xy(0,0),xy(0,363),xy(73,363),xy(76,360),xy(76,363),xy(199,363),xy(200,361),xy(201,363),xy(612,363),xy(613,361),xy(614,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(611,360),xy(613,361),xy(611,360)]).
hole(r1, [xy(518,360),xy(520,360),xy(518,360)]).
hole(r1, [xy(610,359),xy(612,359),xy(610,359)]).
hole(r1, [xy(609,358),xy(611,358),xy(609,358)]).
hole(r1, [xy(200,358),xy(202,358),xy(200,358)]).
hole(r1, [xy(608,356),xy(610,357),xy(608,356)]).
hole(r1, [xy(201,356),xy(203,356),xy(201,356)]).
hole(r1, [xy(607,355),xy(609,355),xy(607,355)]).
hole(r1, [xy(606,354),xy(608,354),xy(606,354)]).
hole(r1, [xy(82,353),xy(83,355),xy(77,361),xy(76,359),xy(82,353)]).
hole(r1, [xy(82,353),xy(84,353),xy(82,353)]).
hole(r1, [xy(605,352),xy(607,352),xy(605,352)]).
hole(r1, [xy(202,352),xy(204,353),xy(202,352)]).
hole(r1, [xy(83,352),xy(85,352),xy(83,352)]).
hole(r1, [xy(84,351),xy(86,351),xy(84,351)]).
hole(r1, [xy(604,350),xy(606,351),xy(604,350)]).
hole(r1, [xy(85,350),xy(87,350),xy(85,350)]).
hole(r1, [xy(603,349),xy(605,349),xy(603,349)]).
hole(r1, [xy(203,349),xy(205,350),xy(203,349)]).
hole(r1, [xy(89,347),xy(87,350),xy(89,347)]).
hole(r1, [xy(602,347),xy(604,347),xy(602,347)]).
hole(r1, [xy(89,347),xy(91,347),xy(89,347)]).
hole(r1, [xy(601,346),xy(603,346),xy(601,346)]).
hole(r1, [xy(204,346),xy(206,347),xy(204,346)]).
hole(r1, [xy(90,346),xy(92,346),xy(90,346)]).
hole(r1, [xy(600,345),xy(602,345),xy(600,345)]).
hole(r1, [xy(91,345),xy(93,345),xy(91,345)]).
hole(r1, [xy(205,344),xy(207,344),xy(205,344)]).
hole(r1, [xy(599,343),xy(601,343),xy(599,343)]).
hole(r1, [xy(95,342),xy(93,345),xy(95,342)]).
hole(r1, [xy(95,342),xy(97,342),xy(95,342)]).
hole(r1, [xy(598,341),xy(600,341),xy(598,341)]).
hole(r1, [xy(597,340),xy(599,340),xy(597,340)]).
hole(r1, [xy(99,339),xy(97,342),xy(99,339)]).
hole(r1, [xy(99,339),xy(101,339),xy(99,339)]).
hole(r1, [xy(596,338),xy(598,338),xy(596,338)]).
hole(r1, [xy(100,338),xy(103,338),xy(100,338)]).
hole(r1, [xy(595,337),xy(597,337),xy(595,337)]).
hole(r1, [xy(207,337),xy(209,338),xy(207,337)]).
hole(r1, [xy(102,337),xy(104,337),xy(102,337)]).
hole(r1, [xy(594,336),xy(596,336),xy(594,336)]).
hole(r1, [xy(103,336),xy(106,336),xy(103,336)]).
hole(r1, [xy(593,335),xy(595,335),xy(593,335)]).
hole(r1, [xy(105,335),xy(107,335),xy(105,335)]).
hole(r1, [xy(592,334),xy(594,334),xy(592,334)]).
hole(r1, [xy(208,334),xy(210,334),xy(208,334)]).
hole(r1, [xy(106,334),xy(109,334),xy(106,334)]).
hole(r1, [xy(591,333),xy(593,333),xy(591,333)]).
hole(r1, [xy(108,333),xy(110,333),xy(108,333)]).
hole(r1, [xy(110,332),xy(112,332),xy(110,332)]).
hole(r1, [xy(111,331),xy(114,331),xy(111,331)]).
hole(r1, [xy(210,329),xy(210,333),xy(210,329)]).
hole(r1, [xy(113,330),xy(115,330),xy(113,330)]).
hole(r1, [xy(586,329),xy(591,329),xy(586,329)]).
hole(r1, [xy(115,329),xy(117,329),xy(115,329)]).
hole(r1, [xy(583,328),xy(587,328),xy(583,328)]).
hole(r1, [xy(517,328),xy(519,328),xy(517,328)]).
hole(r1, [xy(117,328),xy(119,328),xy(117,328)]).
hole(r1, [xy(593,326),xy(597,332),xy(596,335),xy(590,330),xy(593,329),xy(593,326)]).
hole(r1, [xy(581,327),xy(584,327),xy(581,327)]).
hole(r1, [xy(518,327),xy(520,327),xy(518,327)]).
hole(r1, [xy(210,327),xy(212,327),xy(210,327)]).
hole(r1, [xy(118,327),xy(121,327),xy(118,327)]).
hole(r1, [xy(120,326),xy(123,326),xy(120,326)]).
hole(r1, [xy(122,325),xy(124,325),xy(122,325)]).
hole(r1, [xy(211,324),xy(213,325),xy(211,324)]).
hole(r1, [xy(124,324),xy(126,324),xy(124,324)]).
hole(r1, [xy(125,323),xy(128,323),xy(125,323)]).
hole(r1, [xy(214,322),xy(216,322),xy(214,322)]).
hole(r1, [xy(127,322),xy(130,322),xy(127,322)]).
hole(r1, [xy(212,321),xy(214,322),xy(212,321)]).
hole(r1, [xy(129,321),xy(132,321),xy(129,321)]).
hole(r1, [xy(586,320),xy(588,320),xy(586,320)]).
hole(r1, [xy(131,320),xy(134,320),xy(131,320)]).
hole(r1, [xy(133,319),xy(136,319),xy(133,319)]).
hole(r1, [xy(213,318),xy(215,319),xy(213,318)]).
hole(r1, [xy(135,318),xy(138,318),xy(135,318)]).
hole(r1, [xy(137,317),xy(140,317),xy(137,317)]).
hole(r1, [xy(139,316),xy(144,315),xy(142,317),xy(139,316)]).
hole(r1, [xy(144,314),xy(147,314),xy(144,314)]).
hole(r1, [xy(146,313),xy(149,313),xy(146,313)]).
hole(r1, [xy(216,311),xy(215,317),xy(214,313),xy(216,311)]).
hole(r1, [xy(148,312),xy(151,312),xy(148,312)]).
hole(r1, [xy(151,311),xy(154,311),xy(151,311)]).
hole(r1, [xy(153,310),xy(156,310),xy(153,310)]).
hole(r1, [xy(216,309),xy(218,309),xy(216,309)]).
hole(r1, [xy(155,309),xy(158,309),xy(155,309)]).
hole(r1, [xy(158,308),xy(161,308),xy(158,308)]).
hole(r1, [xy(160,307),xy(163,307),xy(160,307)]).
hole(r1, [xy(163,306),xy(166,306),xy(163,306)]).
hole(r1, [xy(218,304),xy(218,308),xy(218,304)]).
hole(r1, [xy(165,305),xy(168,305),xy(165,305)]).
hole(r1, [xy(168,304),xy(171,304),xy(168,304)]).
hole(r1, [xy(218,303),xy(220,304),xy(218,303)]).
hole(r1, [xy(171,303),xy(174,303),xy(171,303)]).
hole(r1, [xy(173,302),xy(176,302),xy(173,302)]).
hole(r1, [xy(176,301),xy(180,301),xy(176,301)]).
hole(r1, [xy(219,300),xy(221,301),xy(219,300)]).
hole(r1, [xy(179,300),xy(182,300),xy(179,300)]).
hole(r1, [xy(222,299),xy(224,299),xy(222,299)]).
hole(r1, [xy(181,299),xy(185,299),xy(181,299)]).
hole(r1, [xy(220,298),xy(222,298),xy(220,298)]).
hole(r1, [xy(223,297),xy(225,297),xy(223,297)]).
hole(r1, [xy(187,296),xy(185,299),xy(187,296)]).
hole(r1, [xy(187,296),xy(189,296),xy(187,296)]).
hole(r1, [xy(221,295),xy(223,296),xy(221,295)]).
hole(r1, [xy(188,295),xy(191,295),xy(188,295)]).
hole(r1, [xy(190,294),xy(192,294),xy(190,294)]).
hole(r1, [xy(194,291),xy(192,294),xy(194,291)]).
hole(r1, [xy(194,291),xy(198,291),xy(194,291)]).
hole(r1, [xy(197,290),xy(200,290),xy(197,290)]).
hole(r1, [xy(205,288),xy(209,288),xy(205,288)]).
hole(r1, [xy(217,286),xy(220,286),xy(217,286)]).
hole(r1, [xy(220,285),xy(223,285),xy(220,285)]).
hole(r1, [xy(234,284),xy(236,284),xy(234,284)]).
hole(r1, [xy(232,284),xy(226,295),xy(223,295),xy(222,293),xy(228,284),xy(232,284)]).
hole(r1, [xy(223,284),xy(226,284),xy(223,284)]).
hole(r1, [xy(237,283),xy(239,283),xy(237,283)]).
hole(r1, [xy(240,282),xy(242,282),xy(240,282)]).
hole(r1, [xy(243,281),xy(245,281),xy(243,281)]).
hole(r1, [xy(246,280),xy(249,280),xy(246,280)]).
hole(r1, [xy(249,279),xy(252,279),xy(249,279)]).
hole(r1, [xy(252,278),xy(254,278),xy(252,278)]).
hole(r1, [xy(260,275),xy(262,275),xy(260,275)]).
hole(r1, [xy(289,258),xy(292,260),xy(289,258)]).
hole(r1, [xy(287,255),xy(290,257),xy(287,255)]).
hole(r1, [xy(286,254),xy(288,254),xy(286,254)]).
hole(r1, [xy(285,252),xy(287,253),xy(285,252)]).
hole(r1, [xy(284,251),xy(286,251),xy(284,251)]).
hole(r1, [xy(283,249),xy(285,250),xy(283,249)]).
hole(r1, [xy(282,248),xy(284,248),xy(282,248)]).
hole(r1, [xy(281,246),xy(283,247),xy(281,246)]).
hole(r1, [xy(280,245),xy(282,245),xy(280,245)]).
hole(r1, [xy(279,243),xy(281,243),xy(279,243)]).
hole(r1, [xy(278,242),xy(280,242),xy(278,242)]).
hole(r1, [xy(470,241),xy(472,241),xy(470,241)]).
hole(r1, [xy(277,240),xy(279,240),xy(277,240)]).
hole(r1, [xy(276,238),xy(278,239),xy(276,238)]).
hole(r1, [xy(275,236),xy(277,237),xy(275,236)]).
hole(r1, [xy(474,235),xy(476,235),xy(474,235)]).
hole(r1, [xy(274,235),xy(276,235),xy(274,235)]).
hole(r1, [xy(273,233),xy(275,233),xy(273,233)]).
hole(r1, [xy(476,232),xy(478,232),xy(476,232)]).
hole(r1, [xy(272,231),xy(274,232),xy(272,231)]).
hole(r1, [xy(477,230),xy(479,231),xy(477,230)]).
hole(r1, [xy(271,230),xy(273,230),xy(271,230)]).
hole(r1, [xy(478,229),xy(480,229),xy(478,229)]).
hole(r1, [xy(270,228),xy(272,228),xy(270,228)]).
hole(r1, [xy(479,227),xy(481,227),xy(479,227)]).
hole(r1, [xy(269,226),xy(271,226),xy(269,226)]).
hole(r1, [xy(480,225),xy(482,226),xy(480,225)]).
hole(r1, [xy(481,224),xy(483,224),xy(481,224)]).
hole(r1, [xy(482,222),xy(484,223),xy(482,222)]).
hole(r1, [xy(483,220),xy(485,221),xy(483,220)]).
hole(r1, [xy(484,218),xy(486,219),xy(484,218)]).
hole(r1, [xy(485,216),xy(487,217),xy(485,216)]).
hole(r1, [xy(486,215),xy(488,215),xy(486,215)]).
hole(r1, [xy(487,213),xy(489,213),xy(487,213)]).
hole(r1, [xy(488,211),xy(490,211),xy(488,211)]).
hole(r1, [xy(489,209),xy(491,209),xy(489,209)]).
hole(r1, [xy(387,209),xy(389,209),xy(387,209)]).
hole(r1, [xy(385,208),xy(388,208),xy(385,208)]).
hole(r1, [xy(490,207),xy(492,207),xy(490,207)]).
hole(r1, [xy(383,207),xy(385,207),xy(383,207)]).
hole(r1, [xy(491,204),xy(493,205),xy(491,204)]).
hole(r1, [xy(492,202),xy(494,203),xy(492,202)]).
hole(r1, [xy(493,200),xy(495,201),xy(493,200)]).
hole(r1, [xy(494,198),xy(496,199),xy(494,198)]).
hole(r1, [xy(495,196),xy(497,197),xy(495,196)]).
hole(r1, [xy(496,194),xy(498,194),xy(496,194)]).
hole(r1, [xy(498,189),xy(498,193),xy(498,189)]).
hole(r1, [xy(498,188),xy(500,189),xy(498,188)]).
hole(r1, [xy(499,186),xy(501,187),xy(499,186)]).
hole(r1, [xy(501,182),xy(501,186),xy(501,182)]).
hole(r1, [xy(501,181),xy(503,181),xy(501,181)]).
hole(r1, [xy(503,174),xy(505,175),xy(503,174)]).
hole(r1, [xy(320,111),xy(322,111),xy(320,111)]).
hole(r1, [xy(321,109),xy(323,109),xy(321,109)]).
hole(r1, [xy(320,108),xy(322,108),xy(320,108)]).
hole(r1, [xy(255,80),xy(257,79),xy(258,81),xy(256,82),xy(255,80)]).
midline(r1, [xy(320,203),xy(283,239),xy(278,239),xy(277,240),xy(278,243),xy(261,259),xy(257,259),xy(253,255),xy(248,255),xy(173,180),xy(156,180),xy(127,151),xy(123,156),xy(123,161),xy(109,175),xy(103,183),xy(103,187),xy(96,194),xy(96,199),xy(91,209),xy(70,244),xy(70,252),xy(64,258),xy(60,270),xy(48,291),xy(43,304),xy(43,310),xy(38,319),xy(38,323),xy(76,360),xy(77,361),xy(77,362),xy(88,358),xy(89,356),xy(44,311),xy(41,313)]).
midline(r1, [xy(50,289),xy(53,287),xy(99,333),xy(99,339),xy(100,338),xy(101,339),xy(100,340),xy(105,340),xy(102,337),xy(100,333)]).
midline(r1, [xy(104,338),xy(103,336)]).
midline(r1, [xy(94,202),xy(96,200),xy(187,291),xy(187,296),xy(188,295),xy(189,296),xy(188,297),xy(192,297),xy(188,291)]).
midline(r1, [xy(97,194),xy(103,188),xy(194,279),xy(194,291),xy(197,294),xy(198,293),xy(198,291),xy(197,290),xy(197,281),xy(195,279)]).
midline(r1, [xy(198,281),xy(203,286),xy(203,292),xy(208,297),xy(205,301),xy(198,294)]).
midline(r1, [xy(209,297),xy(211,296),xy(219,305),xy(228,305),xy(226,301),xy(221,299),xy(215,294),xy(212,296)]).
midline(r1, [xy(218,302),xy(222,302),xy(222,300)]).
midline(r1, [xy(223,302),xy(224,301)]).
midline(r1, [xy(208,300),xy(207,302),xy(214,309),xy(216,308),xy(217,310),xy(218,308)]).
midline(r1, [xy(89,212),xy(92,210),xy(176,294),xy(176,303),xy(175,304),xy(88,217),xy(85,219)]).
midline(r1, [xy(176,304),xy(189,319),xy(185,325),xy(84,223),xy(82,224)]).
midline(r1, [xy(189,322),xy(186,325),xy(205,342),xy(205,345),xy(210,343),xy(214,347),xy(213,348),xy(190,348),xy(178,336),xy(169,337),xy(145,312),xy(144,315),xy(148,317)]).
midline(r1, [xy(214,348),xy(215,351),xy(192,351),xy(190,349)]).
midline(r1, [xy(249,256),xy(249,295),xy(240,288),xy(239,284),xy(234,283),xy(234,285),xy(237,284)]).
midline(r1, [xy(61,266),xy(64,264),xy(121,321),xy(120,324),xy(121,328),xy(120,329),xy(118,327),xy(116,328),xy(60,271),xy(58,273)]).
midline(r1, [xy(72,242),xy(75,239),xy(146,312),xy(148,311),xy(149,313),xy(148,315),xy(151,313),xy(152,306),xy(79,233),xy(76,235)]).
midline(r1, [xy(184,325),xy(181,329),xy(163,311),xy(158,304),xy(80,228)]).
midline(r1, [xy(183,328),xy(177,334),xy(152,309),xy(155,308),xy(155,309),xy(157,312),xy(158,306)]).
midline(r1, [xy(192,298),xy(201,306),xy(201,311),xy(198,314),xy(193,314),xy(182,304),xy(179,300),xy(177,294)]).
midline(r1, [xy(182,302),xy(181,298)]).
midline(r1, [xy(185,305),xy(185,299),xy(184,297),xy(93,206)]).
midline(r1, [xy(200,313),xy(201,318),xy(217,317),xy(238,338),xy(235,340),xy(214,320),xy(202,319)]).
midline(r1, [xy(238,340),xy(244,334),xy(218,310)]).
midline(r1, [xy(203,321),xy(205,324),xy(213,323),xy(214,321)]).
midline(r1, [xy(216,323),xy(214,323)]).
midline(r1, [xy(45,302),xy(47,301),xy(90,344),xy(89,347),xy(91,344),xy(93,345),xy(90,348),xy(93,346)]).
midline(r1, [xy(284,239),xy(319,204)]).
midline(r1, [xy(181,332),xy(178,335)]).
midline(r1, [xy(206,325),xy(210,326),xy(210,328),xy(211,328),xy(212,326)]).
midline(r1, [xy(192,295),xy(191,293)]).
midline(r1, [xy(54,282),xy(107,335),xy(118,348),xy(113,349),xy(105,341)]).
midline(r1, [xy(118,349),xy(122,346),xy(108,333),xy(109,330),xy(57,278),xy(55,279)]).
midline(r1, [xy(237,282),xy(239,281),xy(239,276),xy(227,263),xy(124,162),xy(110,175)]).
midline(r1, [xy(220,259),xy(220,289),xy(215,293),xy(213,291),xy(213,282),xy(109,178),xy(104,183)]).
midline(r1, [xy(218,291),xy(216,294),xy(222,294),xy(223,295),xy(223,296),xy(222,297),xy(220,297)]).
midline(r1, [xy(221,288),xy(223,287),xy(223,261)]).
midline(r1, [xy(224,286),xy(227,284),xy(227,265)]).
midline(r1, [xy(163,309),xy(163,304)]).
midline(r1, [xy(65,258),xy(71,253),xy(132,314),xy(132,317),xy(127,320),xy(127,322),xy(128,323),xy(127,325),xy(125,323),xy(121,324),xy(123,326),xy(124,324),xy(124,326)]).
midline(r1, [xy(128,325),xy(130,323),xy(129,320)]).
midline(r1, [xy(192,352),xy(197,357),xy(200,357),xy(200,359),xy(201,359),xy(202,358),xy(201,355),xy(203,355),xy(202,359)]).
midline(r1, [xy(249,296),xy(274,321),xy(270,325),xy(253,329),xy(229,305)]).
midline(r1, [xy(272,324),xy(275,321),xy(293,321),xy(301,311),xy(270,280),xy(268,274),xy(260,274),xy(259,277),xy(252,277),xy(252,279),xy(254,279)]).
midline(r1, [xy(301,313),xy(342,312),xy(368,285),xy(339,256),xy(338,210),xy(289,258),xy(270,275),xy(262,259),xy(275,246)]).
midline(r1, [xy(271,275),xy(287,259)]).
midline(r1, [xy(260,277),xy(262,276)]).
midline(r1, [xy(171,310),xy(171,301)]).
midline(r1, [xy(93,348),xy(98,354),xy(89,357)]).
midline(r1, [xy(97,356),xy(106,352),xy(96,343),xy(48,294)]).
midline(r1, [xy(96,341),xy(97,342)]).
midline(r1, [xy(106,353),xy(113,350)]).
midline(r1, [xy(368,287),xy(401,286),xy(431,255),xy(431,252),xy(387,210)]).
midline(r1, [xy(337,211),xy(291,257)]).
midline(r1, [xy(168,307),xy(168,298)]).
midline(r1, [xy(402,287),xy(410,295),xy(419,294),xy(419,296),xy(516,295),xy(519,300),xy(519,325),xy(517,327),xy(517,329),xy(518,329),xy(519,328),xy(518,327),xy(520,326),xy(518,359),xy(518,361),xy(519,361),xy(520,359)]).
midline(r1, [xy(520,301),xy(564,345),xy(583,344),xy(583,328),xy(584,327),xy(584,320),xy(586,319),xy(587,321),xy(587,328),xy(586,329),xy(586,345),xy(583,346)]).
midline(r1, [xy(588,321),xy(588,316),xy(591,314),xy(590,241),xy(577,251),xy(506,180),xy(499,179),xy(411,91),xy(400,96),xy(394,102),xy(361,103),xy(297,39),xy(214,40),xy(128,126),xy(127,150)]).
midline(r1, [xy(581,250),xy(589,242)]).
midline(r1, [xy(129,126),xy(214,41)]).
midline(r1, [xy(591,315),xy(591,329),xy(590,330),xy(590,332),xy(597,340),xy(586,346)]).
midline(r1, [xy(400,97),xy(395,103),xy(486,195),xy(496,193),xy(497,195),xy(498,193)]).
midline(r1, [xy(487,196),xy(492,199),xy(491,203),xy(492,203),xy(493,204),xy(495,203),xy(493,201),xy(492,201)]).
midline(r1, [xy(388,104),xy(439,155),xy(437,176),xy(433,185),xy(432,251)]).
midline(r1, [xy(438,167),xy(440,166),xy(484,210),xy(488,210),xy(486,214),xy(488,214),xy(488,217),xy(487,218),xy(485,217),xy(483,217),xy(479,219),xy(436,178)]).
midline(r1, [xy(488,218),xy(486,220),xy(483,219),xy(481,224),xy(532,273),xy(529,276),xy(434,185)]).
midline(r1, [xy(479,226),xy(481,227)]).
midline(r1, [xy(407,93),xy(405,96),xy(497,186),xy(497,189),xy(498,189),xy(499,190),xy(501,189),xy(498,186),xy(498,185),xy(500,185),xy(502,186),xy(501,190)]).
midline(r1, [xy(503,189),xy(569,255),xy(564,259),xy(498,195)]).
midline(r1, [xy(567,258),xy(576,252)]).
midline(r1, [xy(193,315),xy(190,319)]).
midline(r1, [xy(193,318),xy(192,320),xy(206,334),xy(208,333),xy(209,335),xy(210,333)]).
midline(r1, [xy(210,335),xy(224,347),xy(220,351),xy(216,351)]).
midline(r1, [xy(222,350),xy(229,343),xy(212,328)]).
midline(r1, [xy(229,345),xy(235,341)]).
midline(r1, [xy(127,152),xy(125,154)]).
midline(r1, [xy(501,180),xy(501,182),xy(503,182)]).
midline(r1, [xy(591,343),xy(588,347),xy(598,357),xy(603,356),xy(605,360),xy(608,360),xy(609,358),xy(610,357),xy(611,357),xy(611,358),xy(609,360),xy(610,362),xy(615,361),xy(732,244),xy(733,240),xy(731,238),xy(611,360)]).
midline(r1, [xy(731,237),xy(729,232),xy(609,352),xy(606,351),xy(605,352),xy(606,354),xy(604,356)]).
midline(r1, [xy(611,351),xy(729,233)]).
midline(r1, [xy(731,239),xy(613,357)]).
midline(r1, [xy(729,231),xy(729,226),xy(724,222),xy(604,342),xy(601,342),xy(598,338),xy(592,332),xy(598,337)]).
midline(r1, [xy(600,340),xy(599,339)]).
midline(r1, [xy(724,223),xy(606,341)]).
midline(r1, [xy(725,221),xy(724,198),xy(689,163),xy(668,163),xy(592,87),xy(415,87),xy(412,91),xy(415,88)]).
midline(r1, [xy(487,220),xy(485,222),xy(482,221)]).
midline(r1, [xy(130,324),xy(132,322),xy(131,319),xy(133,317),xy(133,319),xy(134,321),xy(132,328),xy(143,339),xy(139,344),xy(130,344),xy(119,333),xy(117,328),xy(117,329),xy(116,330),xy(113,329),xy(113,330),xy(114,331),xy(115,330),xy(115,331)]).
midline(r1, [xy(134,322),xy(136,320),xy(136,319),xy(134,317),xy(135,316),xy(137,315),xy(137,317),xy(138,318),xy(136,321)]).
midline(r1, [xy(138,320),xy(140,318),xy(139,315)]).
midline(r1, [xy(140,344),xy(144,340),xy(166,340),xy(169,338)]).
midline(r1, [xy(338,209),xy(336,205),xy(287,253),xy(269,272),xy(287,255),xy(336,206)]).
midline(r1, [xy(336,204),xy(334,202),xy(285,250),xy(268,268),xy(285,252),xy(334,203)]).
midline(r1, [xy(336,202),xy(333,198),xy(283,247),xy(267,264),xy(283,249),xy(333,199)]).
midline(r1, [xy(335,198),xy(331,191),xy(320,202),xy(331,192)]).
midline(r1, [xy(204,358),xy(209,358),xy(214,352)]).
midline(r1, [xy(205,302),xy(204,304)]).
midline(r1, [xy(244,336),xy(252,330)]).
midline(r1, [xy(122,348),xy(130,345)]).
midline(r1, [xy(331,190),xy(331,181),xy(329,180),xy(277,232),xy(274,232),xy(273,233),xy(274,236),xy(254,254),xy(270,239)]).
midline(r1, [xy(329,181),xy(278,232)]).
midline(r1, [xy(330,179),xy(330,175),xy(311,156),xy(205,156),xy(195,158),xy(174,180),xy(195,159)]).
midline(r1, [xy(203,158),xy(269,224),xy(269,227),xy(271,231),xy(272,231),xy(273,230),xy(271,225)]).
midline(r1, [xy(459,254),xy(420,294),xy(470,244),xy(470,240),xy(472,239),xy(472,242)]).
midline(r1, [xy(611,220),xy(668,164)]).
midline(r1, [xy(477,233),xy(476,231),xy(477,231),xy(478,233)]).
midline(r1, [xy(530,281),xy(517,294),xy(529,283)]).
midline(r1, [xy(530,280),xy(530,277),xy(543,264),xy(494,215),xy(489,214),xy(489,213),xy(488,212),xy(490,211),xy(489,208),xy(490,206),xy(492,206),xy(491,210)]).
midline(r1, [xy(544,265),xy(552,265),xy(556,260),xy(497,200)]).
midline(r1, [xy(495,202),xy(496,202)]).
midline(r1, [xy(556,262),xy(563,260)]).
midline(r1, [xy(321,107),xy(320,107),xy(320,112),xy(322,107),xy(323,108),xy(323,109),xy(322,110),xy(354,110),xy(323,141),xy(323,146),xy(312,155),xy(319,149)]).
midline(r1, [xy(323,148),xy(383,208),xy(384,208),xy(385,207),xy(384,206),xy(385,206)]).
midline(r1, [xy(324,141),xy(354,111)]).
midline(r1, [xy(607,356),xy(606,355),xy(607,355),xy(608,354),xy(607,352),xy(609,354),xy(609,355),xy(608,356)]).
midline(r1, [xy(279,244),xy(278,244),xy(279,240),xy(281,242),xy(280,246),xy(281,246),xy(282,244)]).
midline(r1, [xy(239,282),xy(242,281),xy(242,282),xy(240,284)]).
midline(r1, [xy(242,283),xy(243,280),xy(245,280),xy(245,282)]).
midline(r1, [xy(110,331),xy(111,334),xy(112,333),xy(111,331)]).
midline(r1, [xy(600,342),xy(597,341),xy(603,350),xy(605,349),xy(601,343),xy(604,346)]).
midline(r1, [xy(355,109),xy(361,104)]).
midline(r1, [xy(275,233),xy(276,235),xy(274,238),xy(276,238),xy(277,237),xy(279,238)]).
midline(r1, [xy(479,228),xy(478,228),xy(479,230),xy(481,229)]).
midline(r1, [xy(86,352),xy(85,353),xy(82,352),xy(82,353),xy(84,354)]).
midline(r1, [xy(83,351),xy(85,349),xy(85,350),xy(86,349),xy(87,350),xy(86,351),xy(87,351)]).
midline(r1, [xy(224,299),xy(222,298),xy(224,296),xy(225,296),xy(225,298)]).
midline(r1, [xy(474,236),xy(474,234),xy(476,233),xy(476,235),xy(473,238),xy(474,238)]).
midline(r1, [xy(388,208),xy(389,209)]).
fillpoint(r1, xy(678,180), 168.1).
fillpoint(r1, xy(678,183), 168.1).
fillpoint(r1, xy(679,174), 167.1).
fillpoint(r1, xy(679,176), 167.1).
fillpoint(r1, xy(146,165), 139.9).
fillpoint(r1, xy(145,162), 139.4).
fillpoint(r1, xy(144,158), 138.5).
fillpoint(r1, xy(143,153), 137.5).
fillpoint(r1, xy(142,149), 136.6).
fillpoint(r1, xy(141,144), 135.6).
fillpoint(r1, xy(427,106), 101.5).
fillpoint(r1, xy(425,114), 100.3).
fillpoint(r1, xy(424,116), 100.3).
fillpoint(r1, xy(426,112), 100.2).
fillpoint(r1, xy(423,118), 100.2).
fillpoint(r1, xy(437,101), 97.4).
fillpoint(r1, xy(572,101), 97.4).
fillpoint(r1, xy(441,100), 96.5).
fillpoint(r1, xy(567,100), 96.5).
fillpoint(r1, xy(446,99), 95.5).
fillpoint(r1, xy(562,99), 95.5).
fillpoint(r1, xy(450,98), 94.5).
fillpoint(r1, xy(558,98), 94.5).
fillpoint(r1, xy(455,97), 93.6).
fillpoint(r1, xy(553,97), 93.6).
fillpoint(r1, xy(460,96), 92.6).
fillpoint(r1, xy(549,96), 92.6).
fillpoint(r1, xy(464,95), 91.7).
fillpoint(r1, xy(544,95), 91.7).
fillpoint(r1, xy(469,94), 90.7).
fillpoint(r1, xy(539,94), 90.7).
fillpoint(r1, xy(474,93), 89.8).
fillpoint(r1, xy(535,93), 89.8).
fillpoint(r1, xy(478,92), 88.8).
fillpoint(r1, xy(530,92), 88.8).
fillpoint(r1, xy(483,91), 87.9).
fillpoint(r1, xy(526,91), 87.9).
fillpoint(r1, xy(487,90), 86.9).
fillpoint(r1, xy(521,90), 86.9).
fillpoint(r1, xy(492,89), 86.0).
fillpoint(r1, xy(516,89), 86.0).
fillpoint(r1, xy(497,88), 85.0).
fillpoint(r1, xy(512,88), 85.0).
fillpoint(r1, xy(501,87), 84.0).
fillpoint(r1, xy(507,87), 84.0).
fillpoint(r1, xy(364,281), 78.4).
fillpoint(r1, xy(367,282), 78.3).
fillpoint(r1, xy(407,282), 77.6).
fillpoint(r1, xy(371,283), 77.4).
fillpoint(r1, xy(405,283), 77.4).
fillpoint(r1, xy(376,284), 76.4).
fillpoint(r1, xy(400,284), 76.4).
fillpoint(r1, xy(381,285), 75.4).
fillpoint(r1, xy(396,285), 75.4).
fillpoint(r1, xy(385,286), 74.5).
fillpoint(r1, xy(391,286), 74.5).
fillpoint(r1, xy(260,155), 71.9).
fillpoint(r1, xy(262,154), 71.8).
fillpoint(r1, xy(258,156), 71.8).
fillpoint(r1, xy(264,153), 71.7).
fillpoint(r1, xy(422,292), 68.8).
fillpoint(r1, xy(324,181), 68.1).
fillpoint(r1, xy(427,293), 67.8).
fillpoint(r1, xy(431,294), 66.9).
fillpoint(r1, xy(436,295), 65.9).
fillpoint(r1, xy(292,167), 65.5).
fillpoint(r1, xy(299,170), 65.5).
fillpoint(r1, xy(276,160), 65.4).
fillpoint(r1, xy(278,161), 65.4).
fillpoint(r1, xy(283,163), 65.4).
fillpoint(r1, xy(285,164), 65.4).
fillpoint(r1, xy(290,166), 65.4).
fillpoint(r1, xy(301,171), 65.4).
fillpoint(r1, xy(306,173), 65.4).
fillpoint(r1, xy(308,174), 65.4).
fillpoint(r1, xy(313,176), 65.4).
fillpoint(r1, xy(315,177), 65.4).
fillpoint(r1, xy(274,159), 65.3).
fillpoint(r1, xy(281,162), 65.3).
fillpoint(r1, xy(287,165), 65.3).
fillpoint(r1, xy(294,168), 65.3).
fillpoint(r1, xy(297,169), 65.3).
fillpoint(r1, xy(304,172), 65.3).
fillpoint(r1, xy(310,175), 65.3).
fillpoint(r1, xy(317,178), 65.3).
fillpoint(r1, xy(441,296), 64.9).
fillpoint(r1, xy(445,297), 64.0).
fillpoint(r1, xy(450,298), 63.0).
fillpoint(r1, xy(454,299), 62.1).
fillpoint(r1, xy(459,300), 61.1).
fillpoint(r1, xy(361,62), 60.2).
fillpoint(r1, xy(464,301), 60.2).
fillpoint(r1, xy(356,61), 59.2).
fillpoint(r1, xy(362,155), 58.8).
fillpoint(r1, xy(357,157), 58.8).
fillpoint(r1, xy(355,158), 58.8).
fillpoint(r1, xy(350,160), 58.8).
fillpoint(r1, xy(348,161), 58.8).
fillpoint(r1, xy(343,163), 58.8).
fillpoint(r1, xy(359,156), 58.7).
fillpoint(r1, xy(353,159), 58.7).
fillpoint(r1, xy(346,162), 58.7).
fillpoint(r1, xy(352,60), 58.3).
fillpoint(r1, xy(347,59), 57.3).
fillpoint(r1, xy(329,304), 57.3).
fillpoint(r1, xy(343,58), 56.3).
fillpoint(r1, xy(324,305), 56.3).
fillpoint(r1, xy(326,209), 56.2).
fillpoint(r1, xy(328,213), 56.0).
fillpoint(r1, xy(329,215), 55.7).
fillpoint(r1, xy(338,57), 55.4).
fillpoint(r1, xy(319,306), 55.4).
fillpoint(r1, xy(305,57), 55.3).
fillpoint(r1, xy(330,217), 55.3).
fillpoint(r1, xy(334,225), 55.2).
fillpoint(r1, xy(341,241), 55.2).
fillpoint(r1, xy(335,227), 55.1).
fillpoint(r1, xy(337,232), 55.1).
fillpoint(r1, xy(338,234), 55.1).
fillpoint(r1, xy(340,239), 55.1).
fillpoint(r1, xy(332,220), 55.0).
fillpoint(r1, xy(333,223), 55.0).
fillpoint(r1, xy(336,230), 55.0).
fillpoint(r1, xy(339,236), 55.0).
fillpoint(r1, xy(342,243), 55.0).
fillpoint(r1, xy(343,246), 55.0).
fillpoint(r1, xy(309,56), 54.4).
fillpoint(r1, xy(333,56), 54.4).
fillpoint(r1, xy(315,307), 54.4).
fillpoint(r1, xy(314,55), 53.5).
fillpoint(r1, xy(329,55), 53.5).
fillpoint(r1, xy(310,308), 53.5).
fillpoint(r1, xy(513,274), 53.0).
fillpoint(r1, xy(318,54), 52.5).
fillpoint(r1, xy(324,54), 52.5).
fillpoint(r1, xy(306,309), 52.5).
fillpoint(r1, xy(301,310), 51.6).
fillpoint(r1, xy(502,281), 51.0).
fillpoint(r1, xy(495,284), 51.0).
fillpoint(r1, xy(488,287), 51.0).
fillpoint(r1, xy(504,280), 50.9).
fillpoint(r1, xy(497,283), 50.9).
fillpoint(r1, xy(493,285), 50.9).
fillpoint(r1, xy(486,288), 50.9).
fillpoint(r1, xy(507,279), 50.8).
fillpoint(r1, xy(500,282), 50.8).
fillpoint(r1, xy(490,286), 50.8).
fillpoint(r1, xy(483,289), 50.8).
fillpoint(r1, xy(296,312), 49.7).
fillpoint(r1, xy(292,313), 48.7).
fillpoint(r1, xy(287,314), 47.8).
fillpoint(r1, xy(283,315), 46.8).
fillpoint(r1, xy(436,210), 46.3).
fillpoint(r1, xy(423,240), 46.3).
fillpoint(r1, xy(433,217), 46.2).
fillpoint(r1, xy(432,219), 46.2).
fillpoint(r1, xy(430,224), 46.2).
fillpoint(r1, xy(429,226), 46.2).
fillpoint(r1, xy(427,231), 46.2).
fillpoint(r1, xy(426,233), 46.2).
fillpoint(r1, xy(435,212), 46.1).
fillpoint(r1, xy(434,215), 46.1).
fillpoint(r1, xy(431,222), 46.1).
fillpoint(r1, xy(428,228), 46.1).
fillpoint(r1, xy(425,235), 46.1).
fillpoint(r1, xy(424,238), 46.1).
fillpoint(r1, xy(278,316), 45.8).
fillpoint(r1, xy(226,46), 44.9).
fillpoint(r1, xy(288,46), 44.9).
fillpoint(r1, xy(273,317), 44.9).
fillpoint(r1, xy(230,45), 43.9).
fillpoint(r1, xy(283,45), 43.9).
fillpoint(r1, xy(269,318), 43.9).
fillpoint(r1, xy(235,44), 43.0).
fillpoint(r1, xy(279,44), 43.0).
fillpoint(r1, xy(264,319), 43.0).
border(r1).
region(r2, '#ac7469', 4, centroid(256,80)).
perimeter(r2, 8).

adjacent(r1, r2).
shared_edge(r1, r2, 8).

encloses(r1, r2).

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
opencv_component(cc1, [r2]).
opencv_component_area(cc1, 4).
opencv_component_centroid(cc1, centroid(256,80)).
opencv_morphology(r1, opening_area(310451), closing_area(313239), gradient_area(6031)).
opencv_shape_metrics(r1, contour_area(309626.5), hull_area(309639.0), solidity(0.99996), circularity(0.652075), extent(0.996045), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309626.5).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 4.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 2.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 2.0).
opencv_contour_hierarchy(r1, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r1, c5, hole, 2.0).
opencv_contour_hierarchy(r1, c5, next(c6), previous(c4), child(none), parent(c0)).
opencv_contour(r1, c6, hole, 4.0).
opencv_contour_hierarchy(r1, c6, next(c7), previous(c5), child(none), parent(c0)).
opencv_contour(r1, c7, hole, 2.0).
opencv_contour_hierarchy(r1, c7, next(c8), previous(c6), child(none), parent(c0)).
opencv_contour(r1, c8, hole, 2.0).
opencv_contour_hierarchy(r1, c8, next(c9), previous(c7), child(none), parent(c0)).
opencv_contour(r1, c9, hole, 2.0).
opencv_contour_hierarchy(r1, c9, next(c10), previous(c8), child(none), parent(c0)).
opencv_contour(r1, c10, hole, 19.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 2.0).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 2.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 4.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 2.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 2.0).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 4.0).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 2.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 2.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 4.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 7.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 2.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 2.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 2.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 4.0).
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
opencv_contour(r1, c30, hole, 7.0).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 2.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 2.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 2.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 7.0).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 2.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 2.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 4.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 2.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 4.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 2.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 4.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 2.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 2.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 2.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 4.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 2.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 2.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 2.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 4.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 6.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 8.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 2.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 6.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 2.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 2.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 27.0).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 4.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 2.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 2.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 4.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 4.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 2.0).
opencv_contour_hierarchy(r1, c65, next(c66), previous(c64), child(none), parent(c0)).
opencv_contour(r1, c66, hole, 4.0).
opencv_contour_hierarchy(r1, c66, next(c67), previous(c65), child(none), parent(c0)).
opencv_contour(r1, c67, hole, 2.0).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 4.0).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 2.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 4.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 4.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 4.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 2.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 4.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 4.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 4.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 4.0).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 4.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 9.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 4.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 4.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 11.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 4.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 4.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 4.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 2.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 4.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 4.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 4.0).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 4.0).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 6.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 4.0).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 4.0).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 4.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 4.0).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 4.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 6.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 4.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 4.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 2.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 6.0).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 2.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 2.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 7.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 2.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 4.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 4.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 2.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 7.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 6.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 4.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 6.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 4.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 4.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 2.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 49.5).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 4.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 2.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 2.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 2.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 4.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 4.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 2.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 2.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 7.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 7.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 2.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 4.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 2.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 4.0).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 2.0).
opencv_contour_hierarchy(r1, c131, next(c132), previous(c130), child(none), parent(c0)).
opencv_contour(r1, c132, hole, 4.0).
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
opencv_contour(r1, c138, hole, 4.0).
opencv_contour_hierarchy(r1, c138, next(c139), previous(c137), child(none), parent(c0)).
opencv_contour(r1, c139, hole, 4.0).
opencv_contour_hierarchy(r1, c139, next(c140), previous(c138), child(none), parent(c0)).
opencv_contour(r1, c140, hole, 2.0).
opencv_contour_hierarchy(r1, c140, next(c141), previous(c139), child(none), parent(c0)).
opencv_contour(r1, c141, hole, 2.0).
opencv_contour_hierarchy(r1, c141, next(c142), previous(c140), child(none), parent(c0)).
opencv_contour(r1, c142, hole, 2.0).
opencv_contour_hierarchy(r1, c142, next(c143), previous(c141), child(none), parent(c0)).
opencv_contour(r1, c143, hole, 2.0).
opencv_contour_hierarchy(r1, c143, next(c144), previous(c142), child(none), parent(c0)).
opencv_contour(r1, c144, hole, 4.0).
opencv_contour_hierarchy(r1, c144, next(c145), previous(c143), child(none), parent(c0)).
opencv_contour(r1, c145, hole, 4.0).
opencv_contour_hierarchy(r1, c145, next(c146), previous(c144), child(none), parent(c0)).
opencv_contour(r1, c146, hole, 2.0).
opencv_contour_hierarchy(r1, c146, next(c147), previous(c145), child(none), parent(c0)).
opencv_contour(r1, c147, hole, 2.0).
opencv_contour_hierarchy(r1, c147, next(c148), previous(c146), child(none), parent(c0)).
opencv_contour(r1, c148, hole, 2.0).
opencv_contour_hierarchy(r1, c148, next(c149), previous(c147), child(none), parent(c0)).
opencv_contour(r1, c149, hole, 2.0).
opencv_contour_hierarchy(r1, c149, next(c150), previous(c148), child(none), parent(c0)).
opencv_contour(r1, c150, hole, 2.0).
opencv_contour_hierarchy(r1, c150, next(c151), previous(c149), child(none), parent(c0)).
opencv_contour(r1, c151, hole, 4.0).
opencv_contour_hierarchy(r1, c151, next(c152), previous(c150), child(none), parent(c0)).
opencv_contour(r1, c152, hole, 2.0).
opencv_contour_hierarchy(r1, c152, next(c153), previous(c151), child(none), parent(c0)).
opencv_contour(r1, c153, hole, 4.0).
opencv_contour_hierarchy(r1, c153, next(c154), previous(c152), child(none), parent(c0)).
opencv_contour(r1, c154, hole, 4.0).
opencv_contour_hierarchy(r1, c154, next(c155), previous(c153), child(none), parent(c0)).
opencv_contour(r1, c155, hole, 4.0).
opencv_contour_hierarchy(r1, c155, next(c156), previous(c154), child(none), parent(c0)).
opencv_contour(r1, c156, hole, 4.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 2.0).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 2.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 2.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 2.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 2.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 4.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 2.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 2.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 4.0).
opencv_contour_hierarchy(r1, c165, next(c166), previous(c164), child(none), parent(c0)).
opencv_contour(r1, c166, hole, 4.0).
opencv_contour_hierarchy(r1, c166, next(c167), previous(c165), child(none), parent(c0)).
opencv_contour(r1, c167, hole, 4.0).
opencv_contour_hierarchy(r1, c167, next(c168), previous(c166), child(none), parent(c0)).
opencv_contour(r1, c168, hole, 4.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 4.0).
opencv_contour_hierarchy(r1, c169, next(c170), previous(c168), child(none), parent(c0)).
opencv_contour(r1, c170, hole, 2.0).
opencv_contour_hierarchy(r1, c170, next(c171), previous(c169), child(none), parent(c0)).
opencv_contour(r1, c171, hole, 6.0).
opencv_contour_hierarchy(r1, c171, next(c172), previous(c170), child(none), parent(c0)).
opencv_contour(r1, c172, hole, 4.0).
opencv_contour_hierarchy(r1, c172, next(c173), previous(c171), child(none), parent(c0)).
opencv_contour(r1, c173, hole, 4.0).
opencv_contour_hierarchy(r1, c173, next(c174), previous(c172), child(none), parent(c0)).
opencv_contour(r1, c174, hole, 6.0).
opencv_contour_hierarchy(r1, c174, next(c175), previous(c173), child(none), parent(c0)).
opencv_contour(r1, c175, hole, 2.0).
opencv_contour_hierarchy(r1, c175, next(c176), previous(c174), child(none), parent(c0)).
opencv_contour(r1, c176, hole, 4.0).
opencv_contour_hierarchy(r1, c176, next(c177), previous(c175), child(none), parent(c0)).
opencv_contour(r1, c177, hole, 2.0).
opencv_contour_hierarchy(r1, c177, next(c178), previous(c176), child(none), parent(c0)).
opencv_contour(r1, c178, hole, 2.0).
opencv_contour_hierarchy(r1, c178, next(c179), previous(c177), child(none), parent(c0)).
opencv_contour(r1, c179, hole, 2.0).
opencv_contour_hierarchy(r1, c179, next(c180), previous(c178), child(none), parent(c0)).
opencv_contour(r1, c180, hole, 7.0).
opencv_contour_hierarchy(r1, c180, next(none), previous(c179), child(none), parent(c0)).
opencv_watershed_count(r2, 1).
opencv_watershed_segment(r2, ws1, 4, centroid(256,80)).
