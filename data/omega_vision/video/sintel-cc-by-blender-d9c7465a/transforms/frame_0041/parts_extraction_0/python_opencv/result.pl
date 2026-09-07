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

region(r1, '#6c5549', 310514, centroid(427,181)).
perimeter(r1, 3480).
polygon(r1, [xy(0,0),xy(0,363),xy(71,363),xy(73,361),xy(74,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(611,361),xy(613,361),xy(611,361)]).
hole(r1, [xy(73,361),xy(75,361),xy(73,361)]).
hole(r1, [xy(610,360),xy(612,360),xy(610,360)]).
hole(r1, [xy(74,360),xy(76,360),xy(74,360)]).
hole(r1, [xy(609,359),xy(611,359),xy(609,359)]).
hole(r1, [xy(75,359),xy(77,359),xy(75,359)]).
hole(r1, [xy(197,358),xy(199,358),xy(197,358)]).
hole(r1, [xy(76,358),xy(78,358),xy(76,358)]).
hole(r1, [xy(608,357),xy(610,357),xy(608,357)]).
hole(r1, [xy(77,357),xy(79,357),xy(77,357)]).
hole(r1, [xy(607,356),xy(609,356),xy(607,356)]).
hole(r1, [xy(78,356),xy(80,356),xy(78,356)]).
hole(r1, [xy(606,355),xy(608,355),xy(606,355)]).
hole(r1, [xy(79,355),xy(81,355),xy(79,355)]).
hole(r1, [xy(605,354),xy(607,354),xy(605,354)]).
hole(r1, [xy(198,354),xy(200,355),xy(198,354)]).
hole(r1, [xy(80,354),xy(82,354),xy(80,354)]).
hole(r1, [xy(604,353),xy(606,353),xy(604,353)]).
hole(r1, [xy(597,353),xy(599,353),xy(597,353)]).
hole(r1, [xy(81,353),xy(83,353),xy(81,353)]).
hole(r1, [xy(596,352),xy(598,352),xy(596,352)]).
hole(r1, [xy(595,351),xy(597,351),xy(595,351)]).
hole(r1, [xy(199,351),xy(201,352),xy(199,351)]).
hole(r1, [xy(85,350),xy(83,353),xy(85,350)]).
hole(r1, [xy(593,350),xy(595,350),xy(593,350)]).
hole(r1, [xy(85,350),xy(87,350),xy(85,350)]).
hole(r1, [xy(86,349),xy(88,349),xy(86,349)]).
hole(r1, [xy(600,348),xy(602,348),xy(600,348)]).
hole(r1, [xy(200,348),xy(202,349),xy(200,348)]).
hole(r1, [xy(87,348),xy(89,348),xy(87,348)]).
hole(r1, [xy(599,346),xy(602,346),xy(599,346)]).
hole(r1, [xy(201,346),xy(203,346),xy(201,346)]).
hole(r1, [xy(91,345),xy(89,348),xy(91,345)]).
hole(r1, [xy(598,345),xy(600,345),xy(598,345)]).
hole(r1, [xy(91,345),xy(93,345),xy(91,345)]).
hole(r1, [xy(597,343),xy(599,343),xy(597,343)]).
hole(r1, [xy(202,343),xy(204,343),xy(202,343)]).
hole(r1, [xy(95,342),xy(93,345),xy(95,342)]).
hole(r1, [xy(98,340),xy(96,343),xy(98,340)]).
hole(r1, [xy(98,340),xy(100,340),xy(98,340)]).
hole(r1, [xy(597,338),xy(599,341),xy(597,343),xy(595,340),xy(597,338)]).
hole(r1, [xy(594,339),xy(596,339),xy(594,339)]).
hole(r1, [xy(203,339),xy(205,339),xy(203,339)]).
hole(r1, [xy(99,339),xy(102,339),xy(99,339)]).
hole(r1, [xy(101,338),xy(104,338),xy(101,338)]).
hole(r1, [xy(593,337),xy(595,337),xy(593,337)]).
hole(r1, [xy(103,337),xy(105,337),xy(103,337)]).
hole(r1, [xy(592,336),xy(594,336),xy(592,336)]).
hole(r1, [xy(204,336),xy(206,336),xy(204,336)]).
hole(r1, [xy(104,336),xy(107,336),xy(104,336)]).
hole(r1, [xy(591,335),xy(593,335),xy(591,335)]).
hole(r1, [xy(106,335),xy(108,335),xy(106,335)]).
hole(r1, [xy(593,334),xy(595,334),xy(593,334)]).
hole(r1, [xy(590,334),xy(592,334),xy(590,334)]).
hole(r1, [xy(107,334),xy(110,334),xy(107,334)]).
hole(r1, [xy(589,333),xy(591,333),xy(589,333)]).
hole(r1, [xy(109,333),xy(112,333),xy(109,333)]).
hole(r1, [xy(588,332),xy(590,332),xy(588,332)]).
hole(r1, [xy(111,332),xy(113,332),xy(111,332)]).
hole(r1, [xy(590,331),xy(592,331),xy(590,331)]).
hole(r1, [xy(586,331),xy(588,331),xy(586,331)]).
hole(r1, [xy(205,331),xy(207,331),xy(205,331)]).
hole(r1, [xy(113,331),xy(115,331),xy(113,331)]).
hole(r1, [xy(592,330),xy(594,330),xy(592,330)]).
hole(r1, [xy(589,330),xy(591,330),xy(589,330)]).
hole(r1, [xy(114,330),xy(117,330),xy(114,330)]).
hole(r1, [xy(588,329),xy(590,329),xy(588,329)]).
hole(r1, [xy(116,329),xy(119,329),xy(116,329)]).
hole(r1, [xy(586,328),xy(588,328),xy(586,328)]).
hole(r1, [xy(206,328),xy(208,329),xy(206,328)]).
hole(r1, [xy(118,328),xy(121,328),xy(118,328)]).
hole(r1, [xy(590,327),xy(592,327),xy(590,327)]).
hole(r1, [xy(585,327),xy(587,327),xy(585,327)]).
hole(r1, [xy(120,327),xy(122,327),xy(120,327)]).
hole(r1, [xy(589,326),xy(591,326),xy(589,326)]).
hole(r1, [xy(580,326),xy(585,326),xy(580,326)]).
hole(r1, [xy(121,326),xy(124,326),xy(121,326)]).
hole(r1, [xy(578,325),xy(581,325),xy(578,325)]).
hole(r1, [xy(506,325),xy(508,325),xy(506,325)]).
hole(r1, [xy(207,325),xy(209,326),xy(207,325)]).
hole(r1, [xy(123,325),xy(126,325),xy(123,325)]).
hole(r1, [xy(575,324),xy(578,324),xy(575,324)]).
hole(r1, [xy(507,324),xy(509,324),xy(507,324)]).
hole(r1, [xy(125,324),xy(128,324),xy(125,324)]).
hole(r1, [xy(509,323),xy(511,323),xy(509,323)]).
hole(r1, [xy(127,323),xy(130,323),xy(127,323)]).
hole(r1, [xy(208,322),xy(210,322),xy(208,322)]).
hole(r1, [xy(129,322),xy(132,322),xy(129,322)]).
hole(r1, [xy(131,321),xy(134,321),xy(131,321)]).
hole(r1, [xy(209,320),xy(211,320),xy(209,320)]).
hole(r1, [xy(133,320),xy(136,320),xy(133,320)]).
hole(r1, [xy(582,319),xy(584,319),xy(582,319)]).
hole(r1, [xy(135,319),xy(138,319),xy(135,319)]).
hole(r1, [xy(137,318),xy(140,318),xy(137,318)]).
hole(r1, [xy(139,317),xy(142,317),xy(139,317)]).
hole(r1, [xy(210,316),xy(212,317),xy(210,316)]).
hole(r1, [xy(141,316),xy(144,316),xy(141,316)]).
hole(r1, [xy(143,315),xy(146,315),xy(143,315)]).
hole(r1, [xy(146,314),xy(149,314),xy(146,314)]).
hole(r1, [xy(211,313),xy(213,313),xy(211,313)]).
hole(r1, [xy(148,313),xy(151,313),xy(148,313)]).
hole(r1, [xy(150,312),xy(153,312),xy(150,312)]).
hole(r1, [xy(152,311),xy(156,311),xy(152,311)]).
hole(r1, [xy(155,310),xy(158,310),xy(155,310)]).
hole(r1, [xy(157,309),xy(160,309),xy(157,309)]).
hole(r1, [xy(213,307),xy(213,312),xy(213,307)]).
hole(r1, [xy(159,308),xy(163,308),xy(159,308)]).
hole(r1, [xy(162,307),xy(165,307),xy(162,307)]).
hole(r1, [xy(213,306),xy(215,307),xy(213,306)]).
hole(r1, [xy(165,306),xy(168,306),xy(165,306)]).
hole(r1, [xy(216,305),xy(218,305),xy(216,305)]).
hole(r1, [xy(167,305),xy(170,305),xy(167,305)]).
hole(r1, [xy(170,304),xy(173,304),xy(170,304)]).
hole(r1, [xy(215,302),xy(215,306),xy(215,302)]).
hole(r1, [xy(173,303),xy(176,303),xy(173,303)]).
hole(r1, [xy(217,302),xy(219,302),xy(217,302)]).
hole(r1, [xy(175,302),xy(178,302),xy(175,302)]).
hole(r1, [xy(178,301),xy(181,301),xy(178,301)]).
hole(r1, [xy(215,300),xy(217,301),xy(215,300)]).
hole(r1, [xy(180,300),xy(183,300),xy(180,300)]).
hole(r1, [xy(182,299),xy(184,299),xy(182,299)]).
hole(r1, [xy(183,298),xy(185,298),xy(183,298)]).
hole(r1, [xy(184,297),xy(187,297),xy(184,297)]).
hole(r1, [xy(186,296),xy(188,296),xy(186,296)]).
hole(r1, [xy(187,295),xy(190,295),xy(187,295)]).
hole(r1, [xy(189,294),xy(192,294),xy(189,294)]).
hole(r1, [xy(191,293),xy(194,293),xy(191,293)]).
hole(r1, [xy(193,292),xy(196,292),xy(193,292)]).
hole(r1, [xy(201,290),xy(205,290),xy(201,290)]).
hole(r1, [xy(213,288),xy(216,288),xy(213,288)]).
hole(r1, [xy(228,286),xy(220,300),xy(217,300),xy(216,298),xy(221,289),xy(228,286)]).
hole(r1, [xy(215,287),xy(219,287),xy(215,287)]).
hole(r1, [xy(229,286),xy(231,286),xy(229,286)]).
hole(r1, [xy(219,286),xy(222,286),xy(219,286)]).
hole(r1, [xy(232,285),xy(234,285),xy(232,285)]).
hole(r1, [xy(238,283),xy(241,283),xy(238,283)]).
hole(r1, [xy(240,282),xy(243,282),xy(240,282)]).
hole(r1, [xy(243,281),xy(246,281),xy(243,281)]).
hole(r1, [xy(246,280),xy(249,280),xy(246,280)]).
hole(r1, [xy(249,279),xy(251,279),xy(249,279)]).
hole(r1, [xy(252,278),xy(254,278),xy(252,278)]).
hole(r1, [xy(289,264),xy(291,264),xy(289,264)]).
hole(r1, [xy(288,263),xy(290,263),xy(288,263)]).
hole(r1, [xy(287,261),xy(289,262),xy(287,261)]).
hole(r1, [xy(286,260),xy(288,260),xy(286,260)]).
hole(r1, [xy(285,259),xy(287,259),xy(285,259)]).
hole(r1, [xy(284,257),xy(286,257),xy(284,257)]).
hole(r1, [xy(283,256),xy(285,256),xy(283,256)]).
hole(r1, [xy(282,254),xy(284,254),xy(282,254)]).
hole(r1, [xy(469,252),xy(471,252),xy(469,252)]).
hole(r1, [xy(281,252),xy(283,253),xy(281,252)]).
hole(r1, [xy(280,251),xy(282,251),xy(280,251)]).
hole(r1, [xy(279,249),xy(281,249),xy(279,249)]).
hole(r1, [xy(278,248),xy(280,248),xy(278,248)]).
hole(r1, [xy(277,246),xy(279,246),xy(277,246)]).
hole(r1, [xy(276,244),xy(278,244),xy(276,244)]).
hole(r1, [xy(275,242),xy(277,243),xy(275,242)]).
hole(r1, [xy(274,241),xy(276,241),xy(274,241)]).
hole(r1, [xy(273,239),xy(275,239),xy(273,239)]).
hole(r1, [xy(479,238),xy(481,238),xy(479,238)]).
hole(r1, [xy(272,237),xy(274,237),xy(272,237)]).
hole(r1, [xy(271,236),xy(273,236),xy(271,236)]).
hole(r1, [xy(481,235),xy(483,235),xy(481,235)]).
hole(r1, [xy(482,234),xy(484,234),xy(482,234)]).
hole(r1, [xy(483,232),xy(485,233),xy(483,232)]).
hole(r1, [xy(269,232),xy(271,232),xy(269,232)]).
hole(r1, [xy(484,231),xy(486,231),xy(484,231)]).
hole(r1, [xy(268,230),xy(270,230),xy(268,230)]).
hole(r1, [xy(485,229),xy(487,229),xy(485,229)]).
hole(r1, [xy(486,227),xy(488,228),xy(486,227)]).
hole(r1, [xy(487,226),xy(489,226),xy(487,226)]).
hole(r1, [xy(488,224),xy(490,225),xy(488,224)]).
hole(r1, [xy(489,222),xy(491,222),xy(489,222)]).
hole(r1, [xy(490,221),xy(492,221),xy(490,221)]).
hole(r1, [xy(491,218),xy(493,219),xy(491,218)]).
hole(r1, [xy(492,217),xy(494,217),xy(492,217)]).
hole(r1, [xy(386,216),xy(388,216),xy(386,216)]).
hole(r1, [xy(493,215),xy(495,215),xy(493,215)]).
hole(r1, [xy(384,215),xy(386,215),xy(384,215)]).
hole(r1, [xy(382,214),xy(384,214),xy(382,214)]).
hole(r1, [xy(494,213),xy(496,213),xy(494,213)]).
hole(r1, [xy(495,211),xy(497,211),xy(495,211)]).
hole(r1, [xy(496,209),xy(498,209),xy(496,209)]).
hole(r1, [xy(497,206),xy(499,207),xy(497,206)]).
hole(r1, [xy(498,205),xy(500,205),xy(498,205)]).
hole(r1, [xy(499,202),xy(501,203),xy(499,202)]).
hole(r1, [xy(500,200),xy(502,201),xy(500,200)]).
hole(r1, [xy(501,198),xy(503,198),xy(501,198)]).
hole(r1, [xy(502,195),xy(504,196),xy(502,195)]).
hole(r1, [xy(503,193),xy(505,193),xy(503,193)]).
hole(r1, [xy(504,190),xy(506,191),xy(504,190)]).
hole(r1, [xy(505,188),xy(507,189),xy(505,188)]).
hole(r1, [xy(317,112),xy(319,113),xy(317,112)]).
hole(r1, [xy(318,111),xy(320,111),xy(318,111)]).
hole(r1, [xy(319,109),xy(321,110),xy(319,109)]).
midline(r1, [xy(420,141),xy(409,130),xy(406,132),xy(402,152),xy(401,192),xy(319,110),xy(264,56),xy(260,56),xy(195,121),xy(151,123),xy(138,136),xy(137,143),xy(121,159),xy(119,166),xy(98,192),xy(93,207),xy(72,242),xy(72,253),xy(62,263),xy(41,309),xy(41,320),xy(77,356),xy(73,361),xy(81,352),xy(83,353),xy(74,362),xy(83,354)]).
midline(r1, [xy(99,192),xy(101,190),xy(199,288),xy(199,294),xy(204,300),xy(197,305),xy(94,203)]).
midline(r1, [xy(188,297),xy(187,297),xy(186,295)]).
midline(r1, [xy(197,306),xy(195,311),xy(180,297),xy(93,208),xy(90,211)]).
midline(r1, [xy(121,162),xy(240,281),xy(241,284),xy(243,283),xy(243,249),xy(138,144),xy(122,159)]).
midline(r1, [xy(74,240),xy(77,237),xy(148,308),xy(146,316),xy(145,317),xy(142,314),xy(141,314),xy(133,318),xy(132,313),xy(73,254),xy(63,263)]).
midline(r1, [xy(197,310),xy(208,323),xy(209,323),xy(210,322),xy(209,319),xy(211,319),xy(210,323)]).
midline(r1, [xy(402,192),xy(401,196),xy(386,211),xy(362,187),xy(346,183),xy(341,178),xy(253,178),xy(196,121),xy(260,57)]).
midline(r1, [xy(244,249),xy(246,251),xy(246,287),xy(243,284)]).
midline(r1, [xy(409,129),xy(409,117),xy(414,93),xy(375,54),xy(264,55)]).
midline(r1, [xy(415,94),xy(601,94),xy(669,162),xy(583,248),xy(574,255),xy(571,255),xy(509,193),xy(501,192),xy(413,104)]).
midline(r1, [xy(575,255),xy(576,254)]).
midline(r1, [xy(59,271),xy(62,269),xy(117,324),xy(116,327),xy(117,331),xy(116,332),xy(114,330),xy(110,330),xy(109,331),xy(109,333),xy(110,334),xy(109,336),xy(54,282)]).
midline(r1, [xy(110,331),xy(112,333),xy(113,332),xy(113,331),xy(113,333)]).
midline(r1, [xy(411,113),xy(497,199),xy(501,197),xy(501,199),xy(502,199),xy(503,198),xy(502,197),xy(503,197)]).
midline(r1, [xy(503,199),xy(565,259),xy(563,261),xy(561,261),xy(502,202),xy(498,200)]).
midline(r1, [xy(564,261),xy(571,256)]).
midline(r1, [xy(561,262),xy(558,262),xy(502,206),xy(499,204),xy(497,204),xy(410,117)]).
midline(r1, [xy(500,206),xy(498,205)]).
midline(r1, [xy(110,336),xy(119,347),xy(115,349),xy(53,287),xy(49,291)]).
midline(r1, [xy(98,333),xy(98,340),xy(99,339),xy(100,340),xy(99,341),xy(102,340),xy(101,338),xy(101,336)]).
midline(r1, [xy(105,338),xy(105,337),xy(103,336)]).
midline(r1, [xy(509,192),xy(507,190),xy(504,189),xy(414,99)]).
midline(r1, [xy(247,251),xy(257,261),xy(264,260),xy(264,271),xy(267,273),xy(267,276),xy(252,277),xy(249,278),xy(249,280),xy(254,279)]).
midline(r1, [xy(267,277),xy(267,282),xy(297,312),xy(288,322),xy(280,322),xy(246,288)]).
midline(r1, [xy(56,278),xy(58,276),xy(110,329)]).
midline(r1, [xy(102,341),xy(111,350),xy(106,353),xy(48,294)]).
midline(r1, [xy(105,353),xy(101,354),xy(92,346),xy(46,299)]).
midline(r1, [xy(93,345),xy(92,344)]).
midline(r1, [xy(115,350),xy(110,352)]).
midline(r1, [xy(135,318),xy(135,319),xy(136,320),xy(135,322),xy(131,319),xy(123,323),xy(123,325),xy(124,326),xy(123,328),xy(121,326),xy(117,327),xy(119,329),xy(117,335),xy(127,345),xy(119,349)]).
midline(r1, [xy(127,322),xy(127,323),xy(128,324),xy(127,326),xy(125,324),xy(125,323)]).
midline(r1, [xy(122,328),xy(120,327)]).
midline(r1, [xy(133,319),xy(132,318)]).
midline(r1, [xy(136,322),xy(138,320),xy(137,317)]).
midline(r1, [xy(126,347),xy(128,345),xy(137,345),xy(142,340),xy(134,330),xy(134,324),xy(131,321),xy(131,320)]).
midline(r1, [xy(134,322),xy(134,323)]).
midline(r1, [xy(138,321),xy(140,319),xy(139,316)]).
midline(r1, [xy(140,320),xy(142,318),xy(141,315)]).
midline(r1, [xy(408,131),xy(407,132)]).
midline(r1, [xy(108,336),xy(107,336),xy(106,334)]).
midline(r1, [xy(406,140),xy(489,223),xy(490,223),xy(491,222),xy(490,220),xy(492,220),xy(491,223)]).
midline(r1, [xy(86,218),xy(89,216),xy(170,297),xy(170,306),xy(169,307),xy(85,223),xy(82,225)]).
midline(r1, [xy(170,307),xy(173,310),xy(173,299),xy(171,297)]).
midline(r1, [xy(78,232),xy(81,230),xy(156,305),xy(155,308),xy(155,310),xy(156,312),xy(158,311),xy(158,310),xy(156,308),xy(159,307),xy(159,308),xy(160,309),xy(159,314),xy(177,331),xy(174,337),xy(148,313),xy(150,310),xy(150,312),xy(152,315),xy(153,314),xy(153,312),xy(151,310),xy(152,310)]).
midline(r1, [xy(172,338),xy(143,339)]).
midline(r1, [xy(81,358),xy(93,356),xy(87,351)]).
midline(r1, [xy(582,249),xy(578,253),xy(578,328),xy(562,344),xy(557,344),xy(510,297),xy(417,296),xy(386,265),xy(340,311),xy(337,311),xy(289,265)]).
midline(r1, [xy(578,329),xy(564,345),xy(578,345),xy(588,334),xy(586,331),xy(585,326),xy(587,326),xy(587,327),xy(586,328),xy(587,330),xy(589,325),xy(591,325),xy(590,329),xy(588,330),xy(588,332),xy(589,331),xy(590,331),xy(588,335)]).
midline(r1, [xy(592,326),xy(591,330),xy(593,329),xy(590,335),xy(594,340),xy(596,339),xy(595,337),xy(592,334),xy(593,331),xy(593,334),xy(594,333),xy(595,333),xy(595,336)]).
midline(r1, [xy(421,142),xy(491,212),xy(494,212),xy(492,216),xy(494,216),xy(494,218)]).
midline(r1, [xy(495,216),xy(495,215),xy(494,214),xy(496,213),xy(495,210),xy(496,208),xy(498,208),xy(497,212)]).
midline(r1, [xy(290,321),xy(298,313),xy(336,312)]).
midline(r1, [xy(165,304),xy(165,308),xy(164,309),xy(162,307),xy(162,301)]).
midline(r1, [xy(165,309),xy(181,327),xy(178,331),xy(185,327),xy(186,324),xy(173,311)]).
midline(r1, [xy(386,264),xy(386,217),xy(383,215),xy(382,213),xy(385,214),xy(401,197)]).
midline(r1, [xy(320,112),xy(318,111)]).
midline(r1, [xy(386,266),xy(342,310)]).
midline(r1, [xy(43,307),xy(45,306),xy(86,348),xy(88,347),xy(89,348),xy(88,349),xy(89,349)]).
midline(r1, [xy(139,136),xy(151,124)]).
midline(r1, [xy(493,222),xy(542,270),xy(536,274),xy(488,227),xy(405,144)]).
midline(r1, [xy(540,273),xy(550,264),xy(500,214),xy(496,214)]).
midline(r1, [xy(535,274),xy(532,275),xy(487,230),xy(483,229),xy(404,150)]).
midline(r1, [xy(485,228),xy(487,229)]).
midline(r1, [xy(487,225),xy(488,225),xy(489,226)]).
midline(r1, [xy(96,199),xy(98,198),xy(190,290),xy(189,294),xy(191,297),xy(192,296),xy(191,291),xy(193,291),xy(194,295)]).
midline(r1, [xy(129,321),xy(130,324),xy(128,326)]).
midline(r1, [xy(130,325),xy(132,324)]).
midline(r1, [xy(110,176),xy(120,167),xy(219,266),xy(219,288),xy(217,290),xy(216,289),xy(215,286),xy(109,181),xy(102,187)]).
midline(r1, [xy(220,266),xy(224,270),xy(224,284),xy(218,290)]).
midline(r1, [xy(209,282),xy(210,296),xy(201,305),xy(209,313),xy(211,312),xy(211,314),xy(212,314),xy(213,313),xy(212,312),xy(213,312)]).
midline(r1, [xy(209,299),xy(216,299),xy(217,300),xy(217,301),xy(216,302),xy(208,302),xy(206,300)]).
midline(r1, [xy(213,314),xy(237,337),xy(234,340),xy(230,340),xy(217,327),xy(186,327),xy(196,338),xy(203,338),xy(204,341),xy(202,342),xy(201,347),xy(202,347),xy(203,346),xy(204,342)]).
midline(r1, [xy(235,340),xy(245,331),xy(220,306),xy(217,304),xy(215,306),xy(214,305),xy(210,305),xy(208,303)]).
midline(r1, [xy(217,326),xy(212,322)]).
midline(r1, [xy(245,332),xy(252,331),xy(267,323),xy(231,287)]).
midline(r1, [xy(268,323),xy(279,323)]).
midline(r1, [xy(218,306),xy(215,308),xy(212,307)]).
midline(r1, [xy(594,331),xy(594,328),xy(718,206),xy(719,191),xy(690,162),xy(670,162),xy(584,248),xy(584,317),xy(581,320),xy(581,325),xy(579,327),xy(580,327)]).
midline(r1, [xy(584,318),xy(584,319),xy(582,320)]).
midline(r1, [xy(719,205),xy(725,211),xy(726,217),xy(601,342),xy(598,342),xy(597,343),xy(600,350),xy(593,349),xy(592,353),xy(586,353),xy(579,346)]).
midline(r1, [xy(602,342),xy(726,218),xy(727,237),xy(610,354),xy(606,352),xy(600,354),xy(597,351),xy(596,352),xy(594,351),xy(595,350)]).
midline(r1, [xy(727,238),xy(612,353)]).
midline(r1, [xy(595,352),xy(599,354)]).
midline(r1, [xy(599,352),xy(600,351)]).
midline(r1, [xy(94,355),xy(100,355)]).
midline(r1, [xy(142,319),xy(144,318)]).
midline(r1, [xy(551,264),xy(558,263)]).
midline(r1, [xy(176,336),xy(175,338),xy(187,351),xy(212,350),xy(210,353),xy(188,352)]).
midline(r1, [xy(213,350),xy(218,345),xy(212,339),xy(204,337),xy(205,330),xy(207,330),xy(207,332)]).
midline(r1, [xy(205,340),xy(206,335)]).
midline(r1, [xy(212,352),xy(211,353)]).
midline(r1, [xy(219,346),xy(224,346),xy(230,341)]).
midline(r1, [xy(189,354),xy(194,359),xy(199,357),xy(199,358),xy(198,359),xy(197,359)]).
midline(r1, [xy(199,359),xy(204,359),xy(208,355)]).
midline(r1, [xy(194,311),xy(192,313),xy(179,299),xy(177,304),xy(174,301),xy(175,301)]).
midline(r1, [xy(178,304),xy(190,318),xy(187,324),xy(190,321)]).
midline(r1, [xy(180,299),xy(180,298)]).
midline(r1, [xy(193,314),xy(192,317)]).
midline(r1, [xy(124,328),xy(126,327)]).
midline(r1, [xy(225,272),xy(233,280),xy(232,285),xy(234,284),xy(234,286)]).
midline(r1, [xy(163,122),xy(268,228),xy(269,233),xy(270,233),xy(271,232),xy(270,229)]).
midline(r1, [xy(271,233),xy(271,237),xy(274,242),xy(276,241),xy(274,236)]).
midline(r1, [xy(466,257),xy(428,295),xy(469,255),xy(469,251),xy(470,249),xy(478,242),xy(479,237),xy(481,234),xy(482,233),xy(482,234),xy(483,233),xy(484,234),xy(481,239)]).
midline(r1, [xy(483,236),xy(484,235)]).
midline(r1, [xy(268,272),xy(283,258),xy(282,255),xy(283,253),xy(285,255),xy(285,256),xy(283,259)]).
midline(r1, [xy(323,221),xy(286,256),xy(285,260),xy(287,261),xy(288,260),xy(286,258),xy(288,259)]).
midline(r1, [xy(322,222),xy(289,255)]).
midline(r1, [xy(522,286),xy(510,298),xy(510,321),xy(507,324)]).
midline(r1, [xy(508,326),xy(509,325),xy(509,323),xy(510,322),xy(511,322),xy(511,324)]).
midline(r1, [xy(521,287),xy(512,296)]).
midline(r1, [xy(288,240),xy(282,246),xy(277,243),xy(276,245),xy(278,248),xy(265,259),xy(274,251)]).
midline(r1, [xy(284,245),xy(345,183)]).
midline(r1, [xy(278,245),xy(280,247),xy(280,248),xy(279,249),xy(278,249),xy(280,252),xy(282,251),xy(281,248)]).
midline(r1, [xy(607,356),xy(611,362),xy(613,361),xy(606,353)]).
midline(r1, [xy(611,358),xy(613,360)]).
midline(r1, [xy(609,355),xy(610,356)]).
midline(r1, [xy(349,195),xy(348,196)]).
midline(r1, [xy(471,253),xy(471,251)]).
midline(r1, [xy(218,304),xy(217,302),xy(218,301),xy(219,301),xy(219,303)]).
midline(r1, [xy(528,279),xy(531,276)]).
midline(r1, [xy(486,231),xy(487,231)]).
midline(r1, [xy(350,194),xy(356,188)]).
midline(r1, [xy(600,344),xy(600,345)]).
midline(r1, [xy(183,298),xy(185,300)]).
midline(r1, [xy(215,292),xy(211,294)]).
midline(r1, [xy(505,193),xy(503,194)]).
midline(r1, [xy(601,347),xy(602,349)]).
midline(r1, [xy(388,215),xy(386,214),xy(386,216),xy(387,217),xy(388,216),xy(388,217)]).
midline(r1, [xy(290,263),xy(291,264)]).
midline(r1, [xy(215,291),xy(216,291)]).
fillpoint(r1, xy(677,176), 168.3).
fillpoint(r1, xy(678,178), 168.1).
fillpoint(r1, xy(679,183), 167.1).
fillpoint(r1, xy(680,187), 166.2).
fillpoint(r1, xy(151,151), 145.2).
fillpoint(r1, xy(150,156), 144.2).
fillpoint(r1, xy(149,160), 143.3).
fillpoint(r1, xy(179,134), 128.9).
fillpoint(r1, xy(183,133), 128.0).
fillpoint(r1, xy(188,132), 127.0).
fillpoint(r1, xy(192,131), 126.1).
fillpoint(r1, xy(431,110), 105.6).
fillpoint(r1, xy(434,109), 105.1).
fillpoint(r1, xy(578,109), 105.1).
fillpoint(r1, xy(426,119), 104.9).
fillpoint(r1, xy(428,114), 104.8).
fillpoint(r1, xy(425,121), 104.8).
fillpoint(r1, xy(427,117), 104.7).
fillpoint(r1, xy(439,108), 104.1).
fillpoint(r1, xy(574,108), 104.1).
fillpoint(r1, xy(443,107), 103.1).
fillpoint(r1, xy(569,107), 103.1).
fillpoint(r1, xy(448,106), 102.2).
fillpoint(r1, xy(564,106), 102.2).
fillpoint(r1, xy(452,105), 101.2).
fillpoint(r1, xy(560,105), 101.2).
fillpoint(r1, xy(457,104), 100.3).
fillpoint(r1, xy(555,104), 100.3).
fillpoint(r1, xy(462,103), 99.3).
fillpoint(r1, xy(551,103), 99.3).
fillpoint(r1, xy(466,102), 98.4).
fillpoint(r1, xy(546,102), 98.4).
fillpoint(r1, xy(471,101), 97.4).
fillpoint(r1, xy(541,101), 97.4).
fillpoint(r1, xy(476,100), 96.5).
fillpoint(r1, xy(537,100), 96.5).
fillpoint(r1, xy(480,99), 95.5).
fillpoint(r1, xy(532,99), 95.5).
fillpoint(r1, xy(485,98), 94.5).
fillpoint(r1, xy(528,98), 94.5).
fillpoint(r1, xy(489,97), 93.6).
fillpoint(r1, xy(523,97), 93.6).
fillpoint(r1, xy(494,96), 92.6).
fillpoint(r1, xy(518,96), 92.6).
fillpoint(r1, xy(499,95), 91.7).
fillpoint(r1, xy(514,95), 91.7).
fillpoint(r1, xy(503,94), 90.7).
fillpoint(r1, xy(509,94), 90.7).
fillpoint(r1, xy(361,284), 75.7).
fillpoint(r1, xy(363,285), 75.4).
fillpoint(r1, xy(368,286), 74.5).
fillpoint(r1, xy(406,286), 74.5).
fillpoint(r1, xy(373,287), 73.5).
fillpoint(r1, xy(402,287), 73.5).
fillpoint(r1, xy(377,288), 72.6).
fillpoint(r1, xy(397,288), 72.6).
fillpoint(r1, xy(382,289), 71.6).
fillpoint(r1, xy(392,289), 71.6).
fillpoint(r1, xy(387,290), 70.7).
fillpoint(r1, xy(323,184), 69.7).
fillpoint(r1, xy(274,163), 66.0).
fillpoint(r1, xy(283,167), 66.0).
fillpoint(r1, xy(290,170), 66.0).
fillpoint(r1, xy(297,173), 66.0).
fillpoint(r1, xy(304,176), 66.0).
fillpoint(r1, xy(313,180), 66.0).
fillpoint(r1, xy(272,162), 65.9).
fillpoint(r1, xy(276,164), 65.9).
fillpoint(r1, xy(281,166), 65.9).
fillpoint(r1, xy(288,169), 65.9).
fillpoint(r1, xy(292,171), 65.9).
fillpoint(r1, xy(295,172), 65.9).
fillpoint(r1, xy(299,174), 65.9).
fillpoint(r1, xy(306,177), 65.9).
fillpoint(r1, xy(311,179), 65.9).
fillpoint(r1, xy(315,181), 65.9).
fillpoint(r1, xy(279,165), 65.8).
fillpoint(r1, xy(285,168), 65.8).
fillpoint(r1, xy(302,175), 65.8).
fillpoint(r1, xy(308,178), 65.8).
fillpoint(r1, xy(365,156), 62.6).
fillpoint(r1, xy(428,299), 62.1).
fillpoint(r1, xy(354,162), 61.7).
fillpoint(r1, xy(347,165), 61.7).
fillpoint(r1, xy(361,159), 61.6).
fillpoint(r1, xy(356,161), 61.6).
fillpoint(r1, xy(345,166), 61.6).
fillpoint(r1, xy(340,168), 61.6).
fillpoint(r1, xy(359,160), 61.5).
fillpoint(r1, xy(352,163), 61.5).
fillpoint(r1, xy(349,164), 61.5).
fillpoint(r1, xy(342,167), 61.5).
fillpoint(r1, xy(278,63), 61.1).
fillpoint(r1, xy(362,63), 61.1).
fillpoint(r1, xy(433,300), 61.1).
fillpoint(r1, xy(283,62), 60.2).
fillpoint(r1, xy(358,62), 60.2).
fillpoint(r1, xy(437,301), 60.2).
fillpoint(r1, xy(287,61), 59.2).
fillpoint(r1, xy(353,61), 59.2).
fillpoint(r1, xy(442,302), 59.2).
fillpoint(r1, xy(292,60), 58.3).
fillpoint(r1, xy(348,60), 58.3).
fillpoint(r1, xy(446,303), 58.3).
fillpoint(r1, xy(296,59), 57.3).
fillpoint(r1, xy(344,59), 57.3).
fillpoint(r1, xy(451,304), 57.3).
fillpoint(r1, xy(301,58), 56.3).
fillpoint(r1, xy(339,58), 56.3).
fillpoint(r1, xy(456,305), 56.3).
fillpoint(r1, xy(325,215), 55.8).
fillpoint(r1, xy(327,219), 55.6).
fillpoint(r1, xy(306,57), 55.4).
fillpoint(r1, xy(335,57), 55.4).
fillpoint(r1, xy(328,306), 55.4).
fillpoint(r1, xy(329,222), 54.9).
fillpoint(r1, xy(333,231), 54.7).
fillpoint(r1, xy(334,233), 54.7).
fillpoint(r1, xy(336,238), 54.7).
fillpoint(r1, xy(337,240), 54.7).
fillpoint(r1, xy(339,245), 54.7).
fillpoint(r1, xy(340,247), 54.7).
fillpoint(r1, xy(331,226), 54.6).
fillpoint(r1, xy(332,229), 54.6).
fillpoint(r1, xy(335,236), 54.6).
fillpoint(r1, xy(338,242), 54.6).
fillpoint(r1, xy(341,249), 54.6).
fillpoint(r1, xy(342,252), 54.6).
fillpoint(r1, xy(310,56), 54.4).
fillpoint(r1, xy(330,56), 54.4).
fillpoint(r1, xy(323,307), 54.4).
fillpoint(r1, xy(315,55), 53.5).
fillpoint(r1, xy(325,55), 53.5).
fillpoint(r1, xy(318,308), 53.5).
fillpoint(r1, xy(320,54), 52.5).
fillpoint(r1, xy(314,309), 52.5).
fillpoint(r1, xy(309,310), 51.6).
fillpoint(r1, xy(305,311), 50.6).
fillpoint(r1, xy(300,312), 49.7).
fillpoint(r1, xy(295,313), 48.7).
fillpoint(r1, xy(289,314), 47.8).
fillpoint(r1, xy(435,219), 47.1).
fillpoint(r1, xy(432,226), 47.1).
fillpoint(r1, xy(425,242), 47.1).
fillpoint(r1, xy(422,249), 47.1).
fillpoint(r1, xy(434,221), 47.0).
fillpoint(r1, xy(431,228), 47.0).
fillpoint(r1, xy(429,233), 47.0).
fillpoint(r1, xy(428,235), 47.0).
fillpoint(r1, xy(426,240), 47.0).
fillpoint(r1, xy(423,247), 47.0).
fillpoint(r1, xy(433,224), 46.9).
fillpoint(r1, xy(430,231), 46.9).
fillpoint(r1, xy(427,237), 46.9).
fillpoint(r1, xy(424,244), 46.9).
fillpoint(r1, xy(281,315), 46.8).
fillpoint(r1, xy(277,316), 45.8).
fillpoint(r1, xy(272,317), 44.9).
fillpoint(r1, xy(268,318), 43.9).
fillpoint(r1, xy(263,319), 43.0).
fillpoint(r1, xy(498,284), 42.2).
fillpoint(r1, xy(482,291), 42.2).
fillpoint(r1, xy(496,285), 42.1).
fillpoint(r1, xy(491,287), 42.1).
fillpoint(r1, xy(489,288), 42.1).
fillpoint(r1, xy(484,290), 42.1).
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
opencv_morphology(r1, opening_area(310497), closing_area(313241), gradient_area(5981)).
opencv_shape_metrics(r1, contour_area(309633.5), hull_area(309639.0), solidity(0.999982), circularity(0.655751), extent(0.996067), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309633.5).
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
opencv_contour(r1, c16, hole, 4.0).
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
opencv_contour(r1, c23, hole, 4.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 7.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 2.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 2.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 2.0).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 4.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 2.0).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 4.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 2.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 7.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 2.0).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 2.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 2.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 2.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 7.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 7.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 2.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 10.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 4.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 4.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 2.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 2.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 2.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 2.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 4.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 2.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 4.0).
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
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 2.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 2.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 2.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 8.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 4.0).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 4.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 2.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 4.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 4.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 4.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 2.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 4.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 2.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 4.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 2.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 4.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 4.0).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 2.0).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 4.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 2.0).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 4.0).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 4.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 4.0).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 4.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 4.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 4.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 4.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 2.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 4.0).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 4.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 6.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 4.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 4.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 8.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 6.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 4.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 4.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 4.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 2.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 4.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 4.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 6.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 4.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 2.0).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 4.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 4.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 4.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 4.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 2.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 2.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 4.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 2.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 4.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 4.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 4.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 4.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 6.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 4.0).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 57.5).
opencv_contour_hierarchy(r1, c131, next(c132), previous(c130), child(none), parent(c0)).
opencv_contour(r1, c132, hole, 6.0).
opencv_contour_hierarchy(r1, c132, next(c133), previous(c131), child(none), parent(c0)).
opencv_contour(r1, c133, hole, 2.0).
opencv_contour_hierarchy(r1, c133, next(c134), previous(c132), child(none), parent(c0)).
opencv_contour(r1, c134, hole, 4.0).
opencv_contour_hierarchy(r1, c134, next(c135), previous(c133), child(none), parent(c0)).
opencv_contour(r1, c135, hole, 2.0).
opencv_contour_hierarchy(r1, c135, next(c136), previous(c134), child(none), parent(c0)).
opencv_contour(r1, c136, hole, 4.0).
opencv_contour_hierarchy(r1, c136, next(c137), previous(c135), child(none), parent(c0)).
opencv_contour(r1, c137, hole, 4.0).
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
opencv_contour(r1, c145, hole, 2.0).
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
opencv_contour(r1, c153, hole, 2.0).
opencv_contour_hierarchy(r1, c153, next(c154), previous(c152), child(none), parent(c0)).
opencv_contour(r1, c154, hole, 2.0).
opencv_contour_hierarchy(r1, c154, next(c155), previous(c153), child(none), parent(c0)).
opencv_contour(r1, c155, hole, 2.0).
opencv_contour_hierarchy(r1, c155, next(c156), previous(c154), child(none), parent(c0)).
opencv_contour(r1, c156, hole, 2.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 4.0).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 2.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 2.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 2.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 2.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 2.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 2.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 2.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 4.0).
opencv_contour_hierarchy(r1, c165, next(c166), previous(c164), child(none), parent(c0)).
opencv_contour(r1, c166, hole, 2.0).
opencv_contour_hierarchy(r1, c166, next(c167), previous(c165), child(none), parent(c0)).
opencv_contour(r1, c167, hole, 2.0).
opencv_contour_hierarchy(r1, c167, next(c168), previous(c166), child(none), parent(c0)).
opencv_contour(r1, c168, hole, 2.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 2.0).
opencv_contour_hierarchy(r1, c169, next(c170), previous(c168), child(none), parent(c0)).
opencv_contour(r1, c170, hole, 4.0).
opencv_contour_hierarchy(r1, c170, next(c171), previous(c169), child(none), parent(c0)).
opencv_contour(r1, c171, hole, 2.0).
opencv_contour_hierarchy(r1, c171, next(c172), previous(c170), child(none), parent(c0)).
opencv_contour(r1, c172, hole, 4.0).
opencv_contour_hierarchy(r1, c172, next(c173), previous(c171), child(none), parent(c0)).
opencv_contour(r1, c173, hole, 2.0).
opencv_contour_hierarchy(r1, c173, next(c174), previous(c172), child(none), parent(c0)).
opencv_contour(r1, c174, hole, 2.0).
opencv_contour_hierarchy(r1, c174, next(c175), previous(c173), child(none), parent(c0)).
opencv_contour(r1, c175, hole, 4.0).
opencv_contour_hierarchy(r1, c175, next(c176), previous(c174), child(none), parent(c0)).
opencv_contour(r1, c176, hole, 2.0).
opencv_contour_hierarchy(r1, c176, next(c177), previous(c175), child(none), parent(c0)).
opencv_contour(r1, c177, hole, 2.0).
opencv_contour_hierarchy(r1, c177, next(c178), previous(c176), child(none), parent(c0)).
opencv_contour(r1, c178, hole, 2.0).
opencv_contour_hierarchy(r1, c178, next(c179), previous(c177), child(none), parent(c0)).
opencv_contour(r1, c179, hole, 2.0).
opencv_contour_hierarchy(r1, c179, next(c180), previous(c178), child(none), parent(c0)).
opencv_contour(r1, c180, hole, 2.0).
opencv_contour_hierarchy(r1, c180, next(c181), previous(c179), child(none), parent(c0)).
opencv_contour(r1, c181, hole, 2.0).
opencv_contour_hierarchy(r1, c181, next(c182), previous(c180), child(none), parent(c0)).
opencv_contour(r1, c182, hole, 2.0).
opencv_contour_hierarchy(r1, c182, next(c183), previous(c181), child(none), parent(c0)).
opencv_contour(r1, c183, hole, 2.0).
opencv_contour_hierarchy(r1, c183, next(c184), previous(c182), child(none), parent(c0)).
opencv_contour(r1, c184, hole, 4.0).
opencv_contour_hierarchy(r1, c184, next(c185), previous(c183), child(none), parent(c0)).
opencv_contour(r1, c185, hole, 2.0).
opencv_contour_hierarchy(r1, c185, next(c186), previous(c184), child(none), parent(c0)).
opencv_contour(r1, c186, hole, 4.0).
opencv_contour_hierarchy(r1, c186, next(c187), previous(c185), child(none), parent(c0)).
opencv_contour(r1, c187, hole, 4.0).
opencv_contour_hierarchy(r1, c187, next(c188), previous(c186), child(none), parent(c0)).
opencv_contour(r1, c188, hole, 2.0).
opencv_contour_hierarchy(r1, c188, next(c189), previous(c187), child(none), parent(c0)).
opencv_contour(r1, c189, hole, 4.0).
opencv_contour_hierarchy(r1, c189, next(c190), previous(c188), child(none), parent(c0)).
opencv_contour(r1, c190, hole, 2.0).
opencv_contour_hierarchy(r1, c190, next(c191), previous(c189), child(none), parent(c0)).
opencv_contour(r1, c191, hole, 4.0).
opencv_contour_hierarchy(r1, c191, next(c192), previous(c190), child(none), parent(c0)).
opencv_contour(r1, c192, hole, 4.0).
opencv_contour_hierarchy(r1, c192, next(c193), previous(c191), child(none), parent(c0)).
opencv_contour(r1, c193, hole, 4.0).
opencv_contour_hierarchy(r1, c193, next(c194), previous(c192), child(none), parent(c0)).
opencv_contour(r1, c194, hole, 2.0).
opencv_contour_hierarchy(r1, c194, next(c195), previous(c193), child(none), parent(c0)).
opencv_contour(r1, c195, hole, 4.0).
opencv_contour_hierarchy(r1, c195, next(none), previous(c194), child(none), parent(c0)).
