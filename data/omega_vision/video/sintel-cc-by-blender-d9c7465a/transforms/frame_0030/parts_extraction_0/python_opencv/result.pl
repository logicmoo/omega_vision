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

region(r1, '#776a65', 310159, centroid(426,182)).
perimeter(r1, 4124).
polygon(r1, [xy(0,0),xy(0,222),xy(5,223),xy(0,224),xy(0,363),xy(853,363),xy(853,232),xy(851,231),xy(853,230),xy(853,167),xy(847,166),xy(853,165),xy(853,45),xy(848,41),xy(840,41),xy(845,37),xy(853,39),xy(853,0),xy(0,0)]).
hole(r1, [xy(474,356),xy(476,356),xy(474,356)]).
hole(r1, [xy(473,355),xy(475,355),xy(473,355)]).
hole(r1, [xy(472,353),xy(474,353),xy(472,353)]).
hole(r1, [xy(472,349),xy(472,353),xy(472,349)]).
hole(r1, [xy(120,349),xy(122,349),xy(120,349)]).
hole(r1, [xy(469,343),xy(472,347),xy(471,349),xy(468,345),xy(469,343)]).
hole(r1, [xy(467,343),xy(469,343),xy(467,343)]).
hole(r1, [xy(466,341),xy(468,341),xy(466,341)]).
hole(r1, [xy(465,338),xy(467,338),xy(465,338)]).
hole(r1, [xy(464,336),xy(466,336),xy(464,336)]).
hole(r1, [xy(397,336),xy(399,336),xy(397,336)]).
hole(r1, [xy(463,335),xy(465,335),xy(463,335)]).
hole(r1, [xy(388,332),xy(390,332),xy(388,332)]).
hole(r1, [xy(387,331),xy(389,331),xy(387,331)]).
hole(r1, [xy(386,330),xy(388,330),xy(386,330)]).
hole(r1, [xy(385,329),xy(387,329),xy(385,329)]).
hole(r1, [xy(384,328),xy(386,328),xy(384,328)]).
hole(r1, [xy(383,327),xy(385,327),xy(383,327)]).
hole(r1, [xy(457,325),xy(459,325),xy(457,325)]).
hole(r1, [xy(456,322),xy(458,322),xy(456,322)]).
hole(r1, [xy(453,317),xy(455,317),xy(453,317)]).
hole(r1, [xy(435,316),xy(437,316),xy(435,316)]).
hole(r1, [xy(195,316),xy(197,316),xy(195,316)]).
hole(r1, [xy(436,315),xy(438,315),xy(436,315)]).
hole(r1, [xy(193,315),xy(196,315),xy(193,315)]).
hole(r1, [xy(437,314),xy(439,314),xy(437,314)]).
hole(r1, [xy(199,313),xy(199,317),xy(199,313)]).
hole(r1, [xy(191,314),xy(193,314),xy(191,314)]).
hole(r1, [xy(197,313),xy(199,313),xy(197,313)]).
hole(r1, [xy(190,313),xy(192,313),xy(190,313)]).
hole(r1, [xy(451,311),xy(454,314),xy(453,317),xy(450,313),xy(451,311)]).
hole(r1, [xy(438,313),xy(439,311),xy(441,312),xy(438,313)]).
hole(r1, [xy(196,312),xy(198,312),xy(196,312)]).
hole(r1, [xy(188,312),xy(191,312),xy(188,312)]).
hole(r1, [xy(458,311),xy(460,312),xy(458,311)]).
hole(r1, [xy(440,311),xy(442,311),xy(440,311)]).
hole(r1, [xy(186,311),xy(189,311),xy(186,311)]).
hole(r1, [xy(460,310),xy(462,310),xy(460,310)]).
hole(r1, [xy(449,310),xy(451,311),xy(449,310)]).
hole(r1, [xy(441,310),xy(443,310),xy(441,310)]).
hole(r1, [xy(193,310),xy(197,311),xy(193,310)]).
hole(r1, [xy(185,310),xy(187,310),xy(185,310)]).
hole(r1, [xy(448,309),xy(450,309),xy(448,309)]).
hole(r1, [xy(442,309),xy(444,309),xy(442,309)]).
hole(r1, [xy(192,309),xy(194,309),xy(192,309)]).
hole(r1, [xy(447,307),xy(449,308),xy(447,307)]).
hole(r1, [xy(189,307),xy(193,308),xy(189,307)]).
hole(r1, [xy(446,306),xy(448,306),xy(446,306)]).
hole(r1, [xy(188,306),xy(190,306),xy(188,306)]).
hole(r1, [xy(187,305),xy(189,305),xy(187,305)]).
hole(r1, [xy(409,301),xy(402,312),xy(403,306),xy(409,301)]).
hole(r1, [xy(409,301),xy(411,301),xy(409,301)]).
hole(r1, [xy(189,292),xy(193,292),xy(189,292)]).
hole(r1, [xy(192,291),xy(194,291),xy(192,291)]).
hole(r1, [xy(187,291),xy(189,291),xy(187,291)]).
hole(r1, [xy(214,287),xy(216,287),xy(214,287)]).
hole(r1, [xy(191,286),xy(193,287),xy(191,286)]).
hole(r1, [xy(227,275),xy(229,275),xy(227,275)]).
hole(r1, [xy(228,274),xy(230,274),xy(228,274)]).
hole(r1, [xy(230,273),xy(233,273),xy(230,273)]).
hole(r1, [xy(232,272),xy(235,272),xy(232,272)]).
hole(r1, [xy(234,271),xy(237,271),xy(234,271)]).
hole(r1, [xy(236,270),xy(239,270),xy(236,270)]).
hole(r1, [xy(239,269),xy(242,269),xy(239,269)]).
hole(r1, [xy(242,268),xy(245,268),xy(242,268)]).
hole(r1, [xy(248,266),xy(250,266),xy(248,266)]).
hole(r1, [xy(263,259),xy(258,264),xy(254,264),xy(258,260),xy(263,259)]).
hole(r1, [xy(418,256),xy(420,256),xy(418,256)]).
hole(r1, [xy(271,256),xy(268,259),xy(264,258),xy(269,255),xy(271,256)]).
hole(r1, [xy(416,255),xy(419,255),xy(416,255)]).
hole(r1, [xy(272,255),xy(274,255),xy(272,255)]).
hole(r1, [xy(183,255),xy(185,255),xy(183,255)]).
hole(r1, [xy(415,254),xy(417,254),xy(415,254)]).
hole(r1, [xy(276,252),xy(274,255),xy(276,252)]).
hole(r1, [xy(448,252),xy(450,252),xy(448,252)]).
hole(r1, [xy(276,252),xy(279,252),xy(276,252)]).
hole(r1, [xy(409,251),xy(411,251),xy(409,251)]).
hole(r1, [xy(447,250),xy(449,250),xy(447,250)]).
hole(r1, [xy(446,248),xy(448,248),xy(446,248)]).
hole(r1, [xy(281,246),xy(282,250),xy(279,252),xy(281,246)]).
hole(r1, [xy(437,246),xy(439,246),xy(437,246)]).
hole(r1, [xy(279,245),xy(281,245),xy(279,245)]).
hole(r1, [xy(278,244),xy(280,244),xy(278,244)]).
hole(r1, [xy(180,243),xy(182,243),xy(180,243)]).
hole(r1, [xy(358,242),xy(360,242),xy(358,242)]).
hole(r1, [xy(179,241),xy(181,242),xy(179,241)]).
hole(r1, [xy(442,238),xy(444,238),xy(442,238)]).
hole(r1, [xy(275,237),xy(279,242),xy(278,244),xy(274,239),xy(275,237)]).
hole(r1, [xy(345,237),xy(347,237),xy(345,237)]).
hole(r1, [xy(273,237),xy(275,237),xy(273,237)]).
hole(r1, [xy(440,236),xy(442,236),xy(440,236)]).
hole(r1, [xy(439,235),xy(441,235),xy(439,235)]).
hole(r1, [xy(272,235),xy(274,235),xy(272,235)]).
hole(r1, [xy(179,234),xy(179,239),xy(179,234)]).
hole(r1, [xy(93,234),xy(95,234),xy(93,234)]).
hole(r1, [xy(92,233),xy(94,233),xy(92,233)]).
hole(r1, [xy(91,232),xy(93,232),xy(91,232)]).
hole(r1, [xy(184,231),xy(186,231),xy(184,231)]).
hole(r1, [xy(90,231),xy(92,231),xy(90,231)]).
hole(r1, [xy(90,227),xy(90,231),xy(90,227)]).
hole(r1, [xy(334,228),xy(335,226),xy(339,227),xy(334,228)]).
hole(r1, [xy(88,227),xy(90,227),xy(88,227)]).
hole(r1, [xy(338,226),xy(340,224),xy(343,225),xy(338,226)]).
hole(r1, [xy(86,223),xy(88,224),xy(86,223)]).
hole(r1, [xy(17,222),xy(19,222),xy(17,222)]).
hole(r1, [xy(347,221),xy(349,221),xy(347,221)]).
hole(r1, [xy(49,221),xy(54,221),xy(49,221)]).
hole(r1, [xy(23,221),xy(25,222),xy(23,221)]).
hole(r1, [xy(348,220),xy(350,220),xy(348,220)]).
hole(r1, [xy(81,220),xy(83,219),xy(87,222),xy(81,220)]).
hole(r1, [xy(349,219),xy(351,219),xy(349,219)]).
hole(r1, [xy(73,219),xy(82,219),xy(73,219)]).
hole(r1, [xy(350,218),xy(352,218),xy(350,218)]).
hole(r1, [xy(354,213),xy(355,215),xy(352,218),xy(351,216),xy(354,213)]).
hole(r1, [xy(20,213),xy(22,213),xy(20,213)]).
hole(r1, [xy(354,212),xy(356,213),xy(354,212)]).
hole(r1, [xy(355,211),xy(357,211),xy(355,211)]).
hole(r1, [xy(258,211),xy(261,212),xy(259,213),xy(258,211)]).
hole(r1, [xy(171,211),xy(173,211),xy(171,211)]).
hole(r1, [xy(356,209),xy(358,210),xy(356,209)]).
hole(r1, [xy(257,209),xy(259,209),xy(257,209)]).
hole(r1, [xy(357,207),xy(359,208),xy(357,207)]).
hole(r1, [xy(360,203),xy(359,207),xy(360,203)]).
hole(r1, [xy(360,202),xy(362,203),xy(360,202)]).
hole(r1, [xy(170,200),xy(170,204),xy(170,200)]).
hole(r1, [xy(361,200),xy(363,201),xy(361,200)]).
hole(r1, [xy(362,198),xy(364,199),xy(362,198)]).
hole(r1, [xy(363,195),xy(365,196),xy(363,195)]).
hole(r1, [xy(348,195),xy(350,195),xy(348,195)]).
hole(r1, [xy(342,195),xy(344,195),xy(342,195)]).
hole(r1, [xy(366,190),xy(365,194),xy(366,190)]).
hole(r1, [xy(166,190),xy(168,190),xy(166,190)]).
hole(r1, [xy(349,188),xy(352,191),xy(350,195),xy(349,188)]).
hole(r1, [xy(366,188),xy(368,188),xy(366,188)]).
hole(r1, [xy(12,186),xy(14,185),xy(15,187),xy(13,188),xy(12,186)]).
hole(r1, [xy(164,182),xy(166,182),xy(164,182)]).
hole(r1, [xy(368,181),xy(370,181),xy(368,181)]).
hole(r1, [xy(23,180),xy(25,180),xy(23,180)]).
hole(r1, [xy(235,164),xy(237,165),xy(235,164)]).
hole(r1, [xy(197,162),xy(199,162),xy(197,162)]).
hole(r1, [xy(826,156),xy(828,156),xy(826,156)]).
hole(r1, [xy(23,156),xy(25,157),xy(23,156)]).
hole(r1, [xy(816,155),xy(818,155),xy(816,155)]).
hole(r1, [xy(804,155),xy(806,155),xy(804,155)]).
hole(r1, [xy(823,153),xy(848,153),xy(850,157),xy(831,156),xy(830,154),xy(823,153)]).
hole(r1, [xy(369,151),xy(371,152),xy(369,151)]).
hole(r1, [xy(368,149),xy(370,150),xy(368,149)]).
hole(r1, [xy(367,148),xy(369,148),xy(367,148)]).
hole(r1, [xy(808,147),xy(810,147),xy(808,147)]).
hole(r1, [xy(830,144),xy(833,144),xy(830,144)]).
hole(r1, [xy(807,144),xy(809,144),xy(807,144)]).
hole(r1, [xy(828,142),xy(830,142),xy(828,142)]).
hole(r1, [xy(806,142),xy(808,143),xy(806,142)]).
hole(r1, [xy(840,140),xy(842,140),xy(840,140)]).
hole(r1, [xy(798,137),xy(803,149),xy(798,146),xy(798,137)]).
hole(r1, [xy(238,128),xy(240,128),xy(238,128)]).
hole(r1, [xy(793,119),xy(795,119),xy(793,119)]).
hole(r1, [xy(792,113),xy(794,113),xy(792,113)]).
hole(r1, [xy(247,106),xy(248,109),xy(241,124),xy(240,121),xy(247,106)]).
hole(r1, [xy(800,106),xy(802,107),xy(800,106)]).
hole(r1, [xy(831,105),xy(833,106),xy(831,105)]).
hole(r1, [xy(831,103),xy(833,103),xy(831,103)]).
hole(r1, [xy(833,102),xy(835,102),xy(833,102)]).
hole(r1, [xy(255,94),xy(256,97),xy(248,107),xy(248,103),xy(255,94)]).
hole(r1, [xy(262,84),xy(263,86),xy(256,94),xy(256,90),xy(262,84)]).
hole(r1, [xy(264,81),xy(263,85),xy(264,81)]).
hole(r1, [xy(17,80),xy(19,80),xy(17,80)]).
hole(r1, [xy(16,79),xy(18,79),xy(16,79)]).
hole(r1, [xy(834,68),xy(836,67),xy(837,69),xy(835,70),xy(834,68)]).
hole(r1, [xy(289,68),xy(291,68),xy(289,68)]).
hole(r1, [xy(849,67),xy(851,66),xy(852,68),xy(850,69),xy(849,67)]).
hole(r1, [xy(813,69),xy(814,66),xy(816,68),xy(813,69)]).
hole(r1, [xy(292,67),xy(294,67),xy(292,67)]).
hole(r1, [xy(295,66),xy(297,66),xy(295,66)]).
hole(r1, [xy(174,66),xy(176,66),xy(174,66)]).
hole(r1, [xy(41,65),xy(43,65),xy(41,65)]).
hole(r1, [xy(173,64),xy(175,64),xy(173,64)]).
hole(r1, [xy(827,57),xy(828,59),xy(821,66),xy(821,61),xy(827,57)]).
hole(r1, [xy(173,56),xy(173,61),xy(173,56)]).
hole(r1, [xy(785,50),xy(791,51),xy(787,52),xy(785,50)]).
hole(r1, [xy(838,49),xy(840,49),xy(838,49)]).
hole(r1, [xy(794,48),xy(792,51),xy(794,48)]).
hole(r1, [xy(849,47),xy(851,47),xy(849,47)]).
hole(r1, [xy(818,47),xy(822,49),xy(820,50),xy(818,47)]).
hole(r1, [xy(791,47),xy(793,47),xy(791,47)]).
hole(r1, [xy(848,46),xy(850,46),xy(848,46)]).
hole(r1, [xy(817,46),xy(819,46),xy(817,46)]).
hole(r1, [xy(792,46),xy(794,46),xy(792,46)]).
hole(r1, [xy(847,45),xy(849,45),xy(847,45)]).
hole(r1, [xy(839,45),xy(841,45),xy(839,45)]).
hole(r1, [xy(816,45),xy(818,45),xy(816,45)]).
hole(r1, [xy(797,44),xy(798,46),xy(795,49),xy(794,47),xy(797,44)]).
hole(r1, [xy(783,45),xy(785,45),xy(783,45)]).
hole(r1, [xy(81,44),xy(83,44),xy(81,44)]).
hole(r1, [xy(782,43),xy(784,44),xy(782,43)]).
hole(r1, [xy(306,43),xy(308,43),xy(306,43)]).
hole(r1, [xy(789,42),xy(791,42),xy(789,42)]).
hole(r1, [xy(781,42),xy(783,42),xy(781,42)]).
hole(r1, [xy(305,42),xy(307,42),xy(305,42)]).
hole(r1, [xy(812,41),xy(814,40),xy(817,44),xy(812,41)]).
hole(r1, [xy(790,41),xy(792,41),xy(790,41)]).
hole(r1, [xy(304,41),xy(306,41),xy(304,41)]).
hole(r1, [xy(810,40),xy(813,40),xy(810,40)]).
hole(r1, [xy(805,39),xy(807,39),xy(805,39)]).
hole(r1, [xy(801,38),xy(802,41),xy(798,45),xy(797,43),xy(801,38)]).
hole(r1, [xy(780,38),xy(782,38),xy(780,38)]).
hole(r1, [xy(802,35),xy(805,36),xy(803,37),xy(802,35)]).
hole(r1, [xy(834,34),xy(836,34),xy(834,34)]).
hole(r1, [xy(791,34),xy(793,34),xy(791,34)]).
hole(r1, [xy(801,33),xy(803,34),xy(801,33)]).
hole(r1, [xy(792,33),xy(794,33),xy(792,33)]).
hole(r1, [xy(776,33),xy(778,32),xy(781,37),xy(776,33)]).
hole(r1, [xy(833,28),xy(835,28),xy(833,28)]).
hole(r1, [xy(832,27),xy(834,27),xy(832,27)]).
hole(r1, [xy(831,26),xy(833,26),xy(831,26)]).
hole(r1, [xy(773,26),xy(776,27),xy(774,28),xy(773,26)]).
hole(r1, [xy(783,23),xy(785,23),xy(783,23)]).
hole(r1, [xy(782,22),xy(784,22),xy(782,22)]).
hole(r1, [xy(781,21),xy(783,21),xy(781,21)]).
hole(r1, [xy(770,17),xy(774,22),xy(773,26),xy(769,19),xy(770,17)]).
hole(r1, [xy(778,17),xy(782,20),xy(778,17)]).
hole(r1, [xy(777,16),xy(779,16),xy(777,16)]).
hole(r1, [xy(782,14),xy(784,15),xy(782,14)]).
hole(r1, [xy(767,13),xy(776,12),xy(778,15),xy(770,14),xy(769,18),xy(767,13)]).
midline(r1, [xy(754,264),xy(750,265),xy(742,259),xy(690,255),xy(641,207),xy(628,206),xy(485,349),xy(469,349),xy(461,355),xy(445,340),xy(400,337),xy(398,335),xy(396,337),xy(373,335),xy(341,303),xy(337,307),xy(332,307),xy(276,252),xy(275,248),xy(265,246),xy(253,234),xy(233,236),xy(218,222),xy(217,231),xy(209,239),xy(143,239),xy(134,247),xy(130,243),xy(130,189),xy(128,187),xy(92,222),xy(87,222),xy(86,223),xy(84,223),xy(69,238),xy(64,230),xy(64,210),xy(44,190),xy(31,204),xy(16,204),xy(6,194),xy(6,180),xy(13,172),xy(11,169),xy(11,146),xy(76,81),xy(75,79),xy(18,78),xy(16,78),xy(17,81),xy(18,81),xy(19,80),xy(18,79)]).
midline(r1, [xy(399,337),xy(397,337)]).
midline(r1, [xy(127,188),xy(44,269),xy(43,264),xy(14,236),xy(14,206),xy(16,205)]).
midline(r1, [xy(242,236),xy(314,310),xy(306,314),xy(294,314),xy(250,270),xy(248,266),xy(250,262),xy(218,232),xy(209,241),xy(204,262),xy(200,262),xy(180,244)]).
midline(r1, [xy(338,307),xy(341,304)]).
midline(r1, [xy(84,224),xy(70,238)]).
midline(r1, [xy(128,186),xy(126,176),xy(97,147),xy(54,188),xy(45,188),xy(28,171),xy(14,171)]).
midline(r1, [xy(80,163),xy(56,187)]).
midline(r1, [xy(628,207),xy(479,356),xy(473,352),xy(472,353),xy(472,358),xy(466,358),xy(464,355),xy(469,350)]).
midline(r1, [xy(474,354),xy(475,355),xy(473,358)]).
midline(r1, [xy(481,355),xy(485,351)]).
midline(r1, [xy(96,148),xy(82,162),xy(82,219),xy(68,233),xy(81,221)]).
midline(r1, [xy(332,308),xy(325,309),xy(274,258),xy(266,247)]).
midline(r1, [xy(274,256),xy(273,254)]).
midline(r1, [xy(250,265),xy(250,267)]).
midline(r1, [xy(85,229),xy(44,270),xy(44,275),xy(66,297),xy(113,297),xy(133,276),xy(133,273),xy(93,235)]).
midline(r1, [xy(341,302),xy(341,288),xy(308,255),xy(308,221),xy(306,219),xy(282,243),xy(275,247)]).
midline(r1, [xy(306,218),xy(305,209),xy(297,201),xy(273,225),xy(259,227),xy(254,233),xy(259,228)]).
midline(r1, [xy(266,227),xy(272,233),xy(273,238),xy(275,237),xy(274,234)]).
midline(r1, [xy(306,220),xy(283,243)]).
midline(r1, [xy(36,180),xy(23,179),xy(23,181),xy(25,181)]).
midline(r1, [xy(143,240),xy(135,248),xy(134,272)]).
midline(r1, [xy(205,262),xy(207,261),xy(212,266),xy(214,287),xy(210,291),xy(195,291),xy(192,289),xy(186,291),xy(167,291),xy(155,279),xy(150,279),xy(126,303),xy(119,303),xy(114,298)]).
midline(r1, [xy(150,280),xy(127,303),xy(161,337),xy(169,336),xy(170,339),xy(195,338),xy(195,316),xy(197,314),xy(192,312),xy(191,312),xy(189,314),xy(188,313),xy(189,311),xy(188,309),xy(185,309),xy(185,311),xy(186,311),xy(187,310)]).
midline(r1, [xy(188,314),xy(189,316),xy(170,335),xy(188,318)]).
midline(r1, [xy(167,292),xy(179,304),xy(182,304),xy(187,299),xy(201,299),xy(191,310),xy(183,305)]).
midline(r1, [xy(201,301),xy(192,311)]).
midline(r1, [xy(214,276),xy(226,276),xy(228,273),xy(228,274),xy(229,273),xy(230,274),xy(228,276),xy(227,276)]).
midline(r1, [xy(230,275),xy(229,276)]).
midline(r1, [xy(35,201),xy(32,204)]).
midline(r1, [xy(629,205),xy(627,193),xy(616,184),xy(613,161),xy(611,160),xy(460,309),xy(460,311),xy(462,311)]).
midline(r1, [xy(611,161),xy(463,309)]).
midline(r1, [xy(242,256),xy(242,279),xy(233,270),xy(232,272),xy(235,274)]).
midline(r1, [xy(242,280),xy(277,315),xy(275,318),xy(244,318),xy(220,294),xy(217,294),xy(213,289),xy(211,291)]).
midline(r1, [xy(214,288),xy(215,288),xy(216,286)]).
midline(r1, [xy(97,146),xy(98,82),xy(94,78),xy(78,78),xy(65,65),xy(41,64),xy(41,66),xy(43,66)]).
midline(r1, [xy(82,76),xy(81,43),xy(83,43),xy(83,45)]).
midline(r1, [xy(38,197),xy(44,191)]).
midline(r1, [xy(37,200),xy(37,257)]).
midline(r1, [xy(192,290),xy(192,291),xy(194,292)]).
midline(r1, [xy(219,221),xy(219,205),xy(212,200),xy(205,200),xy(203,198),xy(203,169),xy(165,131),xy(102,131),xy(98,128)]).
midline(r1, [xy(197,161),xy(199,161),xy(199,163)]).
midline(r1, [xy(165,132),xy(164,183),xy(165,183),xy(166,181)]).
midline(r1, [xy(274,225),xy(297,202)]).
midline(r1, [xy(92,224),xy(90,227),xy(88,228)]).
midline(r1, [xy(297,200),xy(297,190),xy(304,181),xy(304,167),xy(298,161),xy(286,167),xy(280,167),xy(257,144),xy(220,144),xy(188,112),xy(182,112),xy(175,117),xy(175,68),xy(173,63),xy(175,63),xy(176,67)]).
midline(r1, [xy(175,118),xy(165,130),xy(175,121)]).
midline(r1, [xy(239,142),xy(238,127),xy(240,127),xy(240,129)]).
midline(r1, [xy(305,181),xy(329,205),xy(333,204),xy(347,219),xy(347,222),xy(349,221),xy(348,219),xy(350,217),xy(351,217),xy(352,218),xy(349,224),xy(380,254),xy(378,260),xy(360,243)]).
midline(r1, [xy(352,219),xy(351,220)]).
midline(r1, [xy(379,260),xy(376,264),xy(371,264),xy(347,240),xy(339,229),xy(339,227),xy(338,225),xy(301,188)]).
midline(r1, [xy(347,238),xy(347,236)]).
midline(r1, [xy(378,263),xy(394,278),xy(429,278),xy(431,280),xy(409,300),xy(409,301),xy(411,302)]).
midline(r1, [xy(182,113),xy(177,118)]).
midline(r1, [xy(412,300),xy(432,280),xy(435,281),xy(431,285),xy(431,289),xy(424,296),xy(424,317),xy(421,332),xy(417,336),xy(421,333)]).
midline(r1, [xy(425,296),xy(431,290),xy(443,302),xy(443,307),xy(440,311),xy(443,308),xy(444,309),xy(441,312),xy(444,310)]).
midline(r1, [xy(444,312),xy(445,320),xy(428,338),xy(445,321)]).
midline(r1, [xy(444,303),xy(446,307),xy(447,307),xy(448,305)]).
midline(r1, [xy(298,160),xy(298,157),xy(247,106),xy(210,71),xy(217,43),xy(202,28),xy(144,28),xy(94,77),xy(142,30)]).
midline(r1, [xy(215,56),xy(253,94),xy(256,94),xy(303,141),xy(298,156)]).
midline(r1, [xy(303,142),xy(314,136),xy(220,42),xy(217,42)]).
midline(r1, [xy(314,138),xy(317,136),xy(317,102),xy(319,101),xy(319,94),xy(339,74),xy(305,40),xy(220,41)]).
midline(r1, [xy(306,40),xy(308,42)]).
midline(r1, [xy(317,137),xy(351,171),xy(369,171),xy(358,183),xy(356,199),xy(348,204),xy(335,204),xy(334,202),xy(342,194),xy(344,194),xy(344,195),xy(342,196)]).
midline(r1, [xy(359,183),xy(370,172),xy(370,179),xy(368,180),xy(368,186),xy(366,187),xy(366,189),xy(367,189),xy(368,187)]).
midline(r1, [xy(330,66),xy(295,65),xy(289,67),xy(289,69),xy(297,67)]).
midline(r1, [xy(352,201),xy(349,205),xy(353,213),xy(354,213),xy(355,214),xy(357,213),xy(353,208)]).
midline(r1, [xy(357,214),xy(358,213),xy(356,210)]).
midline(r1, [xy(371,172),xy(386,172),xy(417,203),xy(394,224),xy(367,197),xy(361,197),xy(357,199)]).
midline(r1, [xy(398,223),xy(418,203),xy(422,203),xy(473,151),xy(472,150),xy(370,150),xy(369,151),xy(368,151),xy(320,102)]).
midline(r1, [xy(370,265),xy(360,269),xy(342,288),xy(360,270)]).
midline(r1, [xy(432,285),xy(442,279),xy(418,257)]).
midline(r1, [xy(443,279),xy(447,279),xy(473,252),xy(450,251),xy(448,249),xy(447,249),xy(445,246),xy(437,245),xy(437,247),xy(439,247)]).
midline(r1, [xy(446,249),xy(448,253),xy(449,251)]).
midline(r1, [xy(446,246),xy(449,249)]).
midline(r1, [xy(473,251),xy(486,240),xy(486,237),xy(443,237),xy(440,234),xy(439,234),xy(439,236),xy(442,239),xy(444,239)]).
midline(r1, [xy(367,196),xy(365,194),xy(358,194)]).
midline(r1, [xy(367,147),xy(369,147),xy(369,148),xy(368,149)]).
midline(r1, [xy(441,234),xy(442,235)]).
midline(r1, [xy(315,311),xy(324,310)]).
midline(r1, [xy(844,28),xy(834,18),xy(825,20),xy(819,16),xy(800,16),xy(791,7),xy(760,6),xy(611,155),xy(604,155),xy(602,153),xy(571,153),xy(545,127),xy(497,127),xy(444,74),xy(340,74)]).
midline(r1, [xy(760,7),xy(612,155),xy(612,159)]).
midline(r1, [xy(827,20),xy(830,23),xy(828,35),xy(819,44),xy(808,54),xy(806,53),xy(797,44),xy(795,43),xy(789,41),xy(787,45),xy(784,44),xy(630,201),xy(783,48)]).
midline(r1, [xy(807,52),xy(806,41),xy(803,38),xy(801,38),xy(798,35),xy(792,32),xy(790,25),xy(782,20),xy(781,21),xy(781,22),xy(784,25),xy(781,26),xy(773,16),xy(771,16),xy(769,18),xy(767,18),xy(615,171),xy(767,19)]).
midline(r1, [xy(799,35),xy(802,35),xy(804,33),xy(804,34),xy(820,18)]).
midline(r1, [xy(807,54),xy(808,56),xy(804,58),xy(792,46),xy(791,46),xy(791,73),xy(785,79),xy(772,79),xy(756,95),xy(753,95),xy(642,207),xy(753,96)]).
midline(r1, [xy(809,54),xy(828,36),xy(831,39),xy(831,47),xy(825,53),xy(808,57)]).
midline(r1, [xy(789,44),xy(792,43),xy(794,45),xy(794,47),xy(792,48)]).
midline(r1, [xy(804,59),xy(792,71),xy(803,61)]).
midline(r1, [xy(791,74),xy(786,79),xy(795,88),xy(816,88),xy(815,123),xy(787,123),xy(782,120),xy(757,95),xy(772,80)]).
midline(r1, [xy(816,123),xy(803,138),xy(804,145),xy(806,146),xy(807,144),xy(808,143),xy(809,143),xy(809,144),xy(807,146),xy(808,148),xy(810,147),xy(809,145),xy(810,146)]).
midline(r1, [xy(830,30),xy(834,35),xy(835,35),xy(836,33)]).
midline(r1, [xy(810,148),xy(814,149),xy(814,158),xy(806,166),xy(804,156),xy(804,154),xy(806,154),xy(806,156)]).
midline(r1, [xy(815,149),xy(821,134),xy(821,125),xy(818,124),xy(804,138)]).
midline(r1, [xy(821,124),xy(835,125),xy(842,118),xy(843,97),xy(834,88),xy(817,88)]).
midline(r1, [xy(807,166),xy(813,160)]).
midline(r1, [xy(821,135),xy(828,143),xy(829,143),xy(830,141)]).
midline(r1, [xy(835,90),xy(835,98),xy(831,102),xy(831,104),xy(832,104),xy(833,103),xy(833,102),xy(834,101),xy(835,101),xy(835,102),xy(833,104)]).
midline(r1, [xy(825,86),xy(825,75),xy(818,68),xy(812,57)]).
midline(r1, [xy(836,126),xy(843,133),xy(843,138),xy(840,139),xy(840,141),xy(841,141),xy(842,140),xy(843,142),xy(837,148),xy(827,148),xy(819,141)]).
midline(r1, [xy(838,148),xy(843,143),xy(851,151),xy(851,159),xy(842,162),xy(745,259),xy(842,163)]).
midline(r1, [xy(851,160),xy(850,161)]).
midline(r1, [xy(308,44),xy(307,44),xy(304,41),xy(306,44)]).
midline(r1, [xy(805,166),xy(717,255),xy(805,168)]).
midline(r1, [xy(21,205),xy(20,214),xy(21,214),xy(22,212)]).
midline(r1, [xy(359,213),xy(386,239),xy(386,247),xy(381,253),xy(385,250)]).
midline(r1, [xy(387,238),xy(359,209),xy(356,208)]).
midline(r1, [xy(360,209),xy(358,206),xy(356,206)]).
midline(r1, [xy(68,238),xy(44,263),xy(68,240)]).
midline(r1, [xy(239,254),xy(239,271),xy(238,272),xy(210,245),xy(208,246)]).
midline(r1, [xy(234,270),xy(233,269)]).
midline(r1, [xy(237,273),xy(237,272)]).
midline(r1, [xy(783,20),xy(785,19),xy(780,15),xy(778,15),xy(776,18),xy(779,16)]).
midline(r1, [xy(785,22),xy(785,21)]).
midline(r1, [xy(780,14),xy(780,10),xy(783,8)]).
midline(r1, [xy(121,304),xy(120,350),xy(121,350),xy(122,348)]).
midline(r1, [xy(826,53),xy(831,48),xy(837,51),xy(840,47),xy(839,44),xy(841,44),xy(841,46)]).
midline(r1, [xy(840,48),xy(840,49),xy(838,51),xy(840,54),xy(830,64),xy(829,70),xy(825,74),xy(828,72)]).
midline(r1, [xy(831,64),xy(847,48),xy(847,44),xy(849,44),xy(849,45),xy(848,46),xy(849,48),xy(851,47),xy(850,45),xy(851,46)]).
midline(r1, [xy(841,55),xy(843,57),xy(843,79),xy(835,88),xy(843,80)]).
midline(r1, [xy(844,57),xy(852,65),xy(852,69),xy(844,77),xy(852,70)]).
midline(r1, [xy(189,290),xy(189,291),xy(187,292)]).
midline(r1, [xy(370,180),xy(370,182)]).
midline(r1, [xy(210,72),xy(207,92),xy(188,111),xy(206,94)]).
midline(r1, [xy(276,318),xy(278,316),xy(293,315)]).
midline(r1, [xy(15,222),xy(17,221),xy(17,223),xy(18,223),xy(19,222),xy(18,221),xy(19,221)]).
midline(r1, [xy(279,253),xy(278,250)]).
midline(r1, [xy(728,257),xy(826,159),xy(826,155),xy(828,155),xy(828,157)]).
midline(r1, [xy(730,74),xy(620,185),xy(774,30),xy(781,27)]).
midline(r1, [xy(487,316),xy(475,328),xy(461,328),xy(457,325),xy(456,323),xy(457,320),xy(453,318)]).
midline(r1, [xy(476,328),xy(617,187)]).
midline(r1, [xy(461,329),xy(460,332),xy(452,332),xy(446,339),xy(452,333)]).
midline(r1, [xy(462,332),xy(467,344),xy(469,343),xy(466,336),xy(464,334),xy(466,335)]).
midline(r1, [xy(707,90),xy(706,91)]).
midline(r1, [xy(781,39),xy(780,39)]).
midline(r1, [xy(722,75),xy(721,76)]).
midline(r1, [xy(237,326),xy(222,340),xy(195,340)]).
midline(r1, [xy(224,339),xy(236,327)]).
midline(r1, [xy(438,316),xy(435,315),xy(422,330),xy(437,317)]).
midline(r1, [xy(734,85),xy(628,192),xy(777,42),xy(781,41),xy(781,43),xy(782,43),xy(783,42),xy(782,41),xy(782,38),xy(781,37),xy(786,38),xy(790,35),xy(790,40),xy(792,41)]).
midline(r1, [xy(540,219),xy(446,313)]).
midline(r1, [xy(453,306),xy(449,310)]).
midline(r1, [xy(448,312),xy(452,311),xy(455,305),xy(604,156)]).
midline(r1, [xy(455,309),xy(456,315),xy(454,316),xy(456,316)]).
midline(r1, [xy(517,208),xy(516,209)]).
midline(r1, [xy(158,275),xy(170,264),xy(183,264),xy(183,254),xy(185,254),xy(185,256)]).
midline(r1, [xy(184,264),xy(200,263)]).
midline(r1, [xy(174,219),xy(161,220),xy(144,238),xy(161,221)]).
midline(r1, [xy(175,219),xy(187,219),xy(205,201)]).
midline(r1, [xy(172,217),xy(171,210),xy(173,210),xy(173,212)]).
midline(r1, [xy(267,181),xy(259,188),xy(235,189),xy(220,204),xy(233,191)]).
midline(r1, [xy(241,190),xy(257,206),xy(257,210),xy(258,210),xy(259,209),xy(258,208),xy(259,208)]).
midline(r1, [xy(260,188),xy(266,182)]).
midline(r1, [xy(785,120),xy(792,112),xy(794,112),xy(794,113),xy(792,114)]).
midline(r1, [xy(206,305),xy(196,312),xy(197,313),xy(199,312),xy(197,317)]).
midline(r1, [xy(200,311),xy(205,306)]).
midline(r1, [xy(539,185),xy(571,154)]).
midline(r1, [xy(733,64),xy(732,65)]).
midline(r1, [xy(187,305),xy(189,304),xy(189,305),xy(188,306),xy(189,307),xy(190,305)]).
midline(r1, [xy(344,201),xy(343,202)]).
midline(r1, [xy(196,222),xy(187,230),xy(184,230),xy(184,232),xy(186,232)]).
midline(r1, [xy(188,230),xy(195,223)]).
midline(r1, [xy(383,327),xy(385,326),xy(385,327),xy(383,328),xy(387,331),xy(385,334),xy(388,332),xy(388,333),xy(389,333),xy(390,332),xy(386,327),xy(390,331)]).
midline(r1, [xy(813,32),xy(805,38),xy(805,39),xy(807,40)]).
midline(r1, [xy(809,35),xy(811,33)]).
midline(r1, [xy(813,33),xy(813,40),xy(808,45),xy(812,42)]).
midline(r1, [xy(759,38),xy(758,39)]).
midline(r1, [xy(359,201),xy(361,204),xy(363,203),xy(360,200),xy(360,201)]).
midline(r1, [xy(363,204),xy(364,201),xy(362,199),xy(361,199)]).
midline(r1, [xy(364,202),xy(390,227),xy(388,236)]).
midline(r1, [xy(390,233),xy(409,252),xy(410,252),xy(411,251),xy(410,250),xy(411,250),xy(411,252)]).
midline(r1, [xy(413,252),xy(415,255),xy(416,255),xy(417,254),xy(416,253),xy(417,253)]).
midline(r1, [xy(485,138),xy(496,127)]).
midline(r1, [xy(774,25),xy(773,26),xy(770,26),xy(760,37),xy(770,27)]).
midline(r1, [xy(833,29),xy(830,26),xy(831,25),xy(833,25),xy(833,26),xy(832,27),xy(834,26),xy(835,29)]).
midline(r1, [xy(206,294),xy(202,299),xy(208,293)]).
midline(r1, [xy(278,170),xy(277,171)]).
midline(r1, [xy(279,246),xy(278,246),xy(280,244),xy(281,244),xy(281,246)]).
midline(r1, [xy(212,205),xy(197,221),xy(214,204)]).
midline(r1, [xy(820,24),xy(814,31),xy(824,21)]).
midline(r1, [xy(459,324),xy(457,323),xy(458,321)]).
midline(r1, [xy(458,324),xy(459,325)]).
midline(r1, [xy(794,118),xy(793,118),xy(794,121),xy(795,118)]).
midline(r1, [xy(240,322),xy(244,319)]).
midline(r1, [xy(167,183),xy(166,191),xy(167,191),xy(168,189)]).
midline(r1, [xy(209,301),xy(216,294)]).
midline(r1, [xy(785,45),xy(785,46)]).
midline(r1, [xy(420,255),xy(420,256)]).
midline(r1, [xy(350,196),xy(348,195),xy(348,194),xy(350,195)]).
midline(r1, [xy(347,197),xy(348,196)]).
midline(r1, [xy(191,315),xy(190,314),xy(192,313),xy(193,314),xy(192,315),xy(193,315)]).
midline(r1, [xy(796,21),xy(795,22)]).
midline(r1, [xy(438,313),xy(436,314),xy(439,315)]).
midline(r1, [xy(815,155),xy(817,156),xy(818,154)]).
midline(r1, [xy(391,227),xy(393,224)]).
midline(r1, [xy(182,242),xy(182,243)]).
midline(r1, [xy(794,34),xy(793,34),xy(791,32),xy(791,35),xy(793,35)]).
midline(r1, [xy(799,17),xy(796,20),xy(800,17)]).
midline(r1, [xy(93,231),xy(95,234)]).
midline(r1, [xy(278,169),xy(280,168)]).
midline(r1, [xy(775,25),xy(776,24)]).
midline(r1, [xy(77,78),xy(77,79)]).
midline(r1, [xy(476,356),xy(476,357)]).
fillpoint(r1, xy(601,182), 173.8).
fillpoint(r1, xy(533,137), 131.8).
fillpoint(r1, xy(528,136), 130.8).
fillpoint(r1, xy(524,135), 129.9).
fillpoint(r1, xy(519,134), 128.9).
fillpoint(r1, xy(515,133), 128.0).
fillpoint(r1, xy(510,132), 127.0).
fillpoint(r1, xy(505,131), 126.1).
fillpoint(r1, xy(501,130), 125.1).
fillpoint(r1, xy(496,129), 124.2).
fillpoint(r1, xy(492,128), 123.2).
fillpoint(r1, xy(724,242), 116.5).
fillpoint(r1, xy(728,243), 115.6).
fillpoint(r1, xy(733,244), 114.6).
fillpoint(r1, xy(100,128), 84.2).
fillpoint(r1, xy(426,86), 83.1).
fillpoint(r1, xy(105,121), 83.1).
fillpoint(r1, xy(110,119), 83.0).
fillpoint(r1, xy(107,120), 82.9).
fillpoint(r1, xy(422,85), 82.1).
fillpoint(r1, xy(417,84), 81.2).
fillpoint(r1, xy(413,83), 80.2).
fillpoint(r1, xy(408,82), 79.3).
fillpoint(r1, xy(403,81), 78.3).
fillpoint(r1, xy(399,80), 77.4).
fillpoint(r1, xy(394,79), 76.4).
fillpoint(r1, xy(390,78), 75.4).
fillpoint(r1, xy(385,77), 74.5).
fillpoint(r1, xy(380,76), 73.5).
fillpoint(r1, xy(376,75), 72.6).
fillpoint(r1, xy(371,74), 71.6).
fillpoint(r1, xy(70,294), 66.9).
fillpoint(r1, xy(75,295), 65.9).
fillpoint(r1, xy(80,296), 64.9).
fillpoint(r1, xy(304,140), 64.4).
fillpoint(r1, xy(300,146), 64.4).
fillpoint(r1, xy(305,137), 64.3).
fillpoint(r1, xy(84,297), 64.0).
fillpoint(r1, xy(329,297), 64.0).
fillpoint(r1, xy(307,134), 63.9).
fillpoint(r1, xy(302,143), 63.9).
fillpoint(r1, xy(309,131), 63.4).
fillpoint(r1, xy(311,127), 63.1).
fillpoint(r1, xy(312,125), 63.0).
fillpoint(r1, xy(310,129), 63.0).
fillpoint(r1, xy(296,150), 63.0).
fillpoint(r1, xy(325,298), 63.0).
fillpoint(r1, xy(352,89), 62.6).
fillpoint(r1, xy(125,286), 61.8).
fillpoint(r1, xy(317,300), 61.1).
fillpoint(r1, xy(118,287), 60.5).
fillpoint(r1, xy(111,290), 60.5).
fillpoint(r1, xy(104,293), 60.5).
fillpoint(r1, xy(97,296), 60.5).
fillpoint(r1, xy(120,286), 60.4).
fillpoint(r1, xy(113,289), 60.4).
fillpoint(r1, xy(109,291), 60.4).
fillpoint(r1, xy(106,292), 60.4).
fillpoint(r1, xy(102,294), 60.4).
fillpoint(r1, xy(95,297), 60.4).
fillpoint(r1, xy(116,288), 60.3).
fillpoint(r1, xy(99,295), 60.3).
fillpoint(r1, xy(313,301), 60.2).
fillpoint(r1, xy(310,302), 59.2).
fillpoint(r1, xy(306,303), 58.3).
fillpoint(r1, xy(296,165), 57.3).
fillpoint(r1, xy(301,304), 57.3).
fillpoint(r1, xy(298,305), 56.3).
fillpoint(r1, xy(294,306), 55.4).
fillpoint(r1, xy(289,307), 54.4).
fillpoint(r1, xy(332,107), 54.1).
fillpoint(r1, xy(334,106), 53.9).
fillpoint(r1, xy(330,108), 53.9).
fillpoint(r1, xy(284,308), 53.5).
fillpoint(r1, xy(280,309), 52.5).
fillpoint(r1, xy(275,310), 51.6).
fillpoint(r1, xy(191,112), 50.6).
fillpoint(r1, xy(182,116), 50.6).
fillpoint(r1, xy(271,311), 50.6).
fillpoint(r1, xy(189,113), 50.5).
fillpoint(r1, xy(184,115), 50.5).
fillpoint(r1, xy(177,118), 50.5).
fillpoint(r1, xy(187,114), 50.4).
fillpoint(r1, xy(180,117), 50.4).
fillpoint(r1, xy(223,51), 49.7).
fillpoint(r1, xy(266,312), 49.7).
fillpoint(r1, xy(261,313), 48.7).
fillpoint(r1, xy(124,63), 48.0).
fillpoint(r1, xy(256,314), 47.8).
fillpoint(r1, xy(135,254), 47.2).
fillpoint(r1, xy(126,54), 46.1).
fillpoint(r1, xy(128,49), 46.0).
fillpoint(r1, xy(127,52), 46.0).
fillpoint(r1, xy(125,56), 46.0).
fillpoint(r1, xy(221,61), 46.0).
fillpoint(r1, xy(129,47), 45.8).
fillpoint(r1, xy(234,47), 45.8).
fillpoint(r1, xy(361,289), 45.7).
fillpoint(r1, xy(363,288), 45.6).
fillpoint(r1, xy(238,46), 44.9).
fillpoint(r1, xy(121,193), 44.9).
fillpoint(r1, xy(122,195), 44.8).
fillpoint(r1, xy(124,199), 44.5).
fillpoint(r1, xy(407,204), 44.1).
fillpoint(r1, xy(406,206), 44.0).
fillpoint(r1, xy(243,45), 43.9).
border(r1).
region(r301, '#948067', 8, centroid(78,219)).
perimeter(r301, 18).
polygon(r301, [xy(74,219),xy(81,219),xy(74,219)]).
midline(r301, [xy(81,219),xy(74,219)]).
region(r132, '#565660', 4, centroid(850,68)).
perimeter(r132, 8).
region(r135, '#626267', 4, centroid(836,68)).
perimeter(r135, 8).
region(r119, '#d0c8c1', 4, centroid(173,58)).
perimeter(r119, 10).
polygon(r119, [xy(173,57),xy(173,60),xy(173,57)]).
midline(r119, [xy(173,57),xy(173,60)]).
region(r253, '#edd7bf', 4, centroid(14,186)).
perimeter(r253, 8).

adjacent(r1, r119).
shared_edge(r1, r119, 10).
adjacent(r1, r132).
shared_edge(r1, r132, 8).
adjacent(r1, r135).
shared_edge(r1, r135, 8).
adjacent(r1, r253).
shared_edge(r1, r253, 8).
adjacent(r1, r301).
shared_edge(r1, r301, 18).

encloses(r1, r119).
encloses(r1, r132).
encloses(r1, r135).
encloses(r1, r253).
encloses(r1, r301).

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
opencv_component(cc1, [r119]).
opencv_component_area(cc1, 4).
opencv_component_centroid(cc1, centroid(173,58)).
opencv_component(cc2, [r132]).
opencv_component_area(cc2, 4).
opencv_component_centroid(cc2, centroid(850,68)).
opencv_component(cc3, [r135]).
opencv_component_area(cc3, 4).
opencv_component_centroid(cc3, centroid(836,68)).
opencv_component(cc4, [r253]).
opencv_component_area(cc4, 4).
opencv_component_centroid(cc4, centroid(14,186)).
opencv_component(cc5, [r301]).
opencv_component_area(cc5, 8).
opencv_component_centroid(cc5, centroid(78,219)).
opencv_morphology(r1, opening_area(310137), closing_area(313170), gradient_area(6811)).
opencv_shape_metrics(r1, contour_area(309560.5), hull_area(309639.0), solidity(0.999746), circularity(0.631201), extent(0.995832), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309560.5).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 2.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 6.0).
opencv_contour_hierarchy(r1, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r1, c5, hole, 2.0).
opencv_contour_hierarchy(r1, c5, next(c6), previous(c4), child(none), parent(c0)).
opencv_contour(r1, c6, hole, 12.0).
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
opencv_contour(r1, c25, hole, 4.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 2.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 6.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 2.0).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 2.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 2.0).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 12.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 5.5).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 2.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 4.0).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 4.0).
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
opencv_contour(r1, c41, hole, 7.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 2.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 2.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 4.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 7.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 2.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 2.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 2.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 29.5).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 6.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
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
opencv_contour(r1, c60, hole, 4.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 4.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 4.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 4.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 4.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 4.0).
opencv_contour_hierarchy(r1, c65, next(c66), previous(c64), child(none), parent(c0)).
opencv_contour(r1, c66, hole, 2.0).
opencv_contour_hierarchy(r1, c66, next(c67), previous(c65), child(none), parent(c0)).
opencv_contour(r1, c67, hole, 23.5).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 2.0).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 15.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 4.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 2.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 2.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 7.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 2.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 4.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 2.0).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 2.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 2.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 12.5).
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
opencv_contour(r1, c86, hole, 4.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 2.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 15.0).
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
opencv_contour(r1, c94, hole, 8.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 2.0).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 2.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 2.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 2.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 2.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 6.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 9.5).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 2.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 9.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 4.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 2.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 2.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 8.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 4.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 2.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 12.5).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 2.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 16.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 2.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 10.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 2.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 4.0).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 2.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 5.5).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 2.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 4.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 2.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 4.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 7.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 4.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 6.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 4.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 4.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 4.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 2.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 2.0).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 7.0).
opencv_contour_hierarchy(r1, c131, next(c132), previous(c130), child(none), parent(c0)).
opencv_contour(r1, c132, hole, 2.0).
opencv_contour_hierarchy(r1, c132, next(c133), previous(c131), child(none), parent(c0)).
opencv_contour(r1, c133, hole, 16.0).
opencv_contour_hierarchy(r1, c133, next(c134), previous(c132), child(none), parent(c0)).
opencv_contour(r1, c134, hole, 2.0).
opencv_contour_hierarchy(r1, c134, next(c135), previous(c133), child(none), parent(c0)).
opencv_contour(r1, c135, hole, 7.0).
opencv_contour_hierarchy(r1, c135, next(c136), previous(c134), child(none), parent(c0)).
opencv_contour(r1, c136, hole, 2.0).
opencv_contour_hierarchy(r1, c136, next(c137), previous(c135), child(none), parent(c0)).
opencv_contour(r1, c137, hole, 2.0).
opencv_contour_hierarchy(r1, c137, next(c138), previous(c136), child(none), parent(c0)).
opencv_contour(r1, c138, hole, 2.0).
opencv_contour_hierarchy(r1, c138, next(c139), previous(c137), child(none), parent(c0)).
opencv_contour(r1, c139, hole, 4.0).
opencv_contour_hierarchy(r1, c139, next(c140), previous(c138), child(none), parent(c0)).
opencv_contour(r1, c140, hole, 2.0).
opencv_contour_hierarchy(r1, c140, next(c141), previous(c139), child(none), parent(c0)).
opencv_contour(r1, c141, hole, 2.0).
opencv_contour_hierarchy(r1, c141, next(c142), previous(c140), child(none), parent(c0)).
opencv_contour(r1, c142, hole, 4.0).
opencv_contour_hierarchy(r1, c142, next(c143), previous(c141), child(none), parent(c0)).
opencv_contour(r1, c143, hole, 2.0).
opencv_contour_hierarchy(r1, c143, next(c144), previous(c142), child(none), parent(c0)).
opencv_contour(r1, c144, hole, 2.0).
opencv_contour_hierarchy(r1, c144, next(c145), previous(c143), child(none), parent(c0)).
opencv_contour(r1, c145, hole, 78.5).
opencv_contour_hierarchy(r1, c145, next(c146), previous(c144), child(none), parent(c0)).
opencv_contour(r1, c146, hole, 4.0).
opencv_contour_hierarchy(r1, c146, next(c147), previous(c145), child(none), parent(c0)).
opencv_contour(r1, c147, hole, 4.0).
opencv_contour_hierarchy(r1, c147, next(c148), previous(c146), child(none), parent(c0)).
opencv_contour(r1, c148, hole, 2.0).
opencv_contour_hierarchy(r1, c148, next(c149), previous(c147), child(none), parent(c0)).
opencv_contour(r1, c149, hole, 2.0).
opencv_contour_hierarchy(r1, c149, next(c150), previous(c148), child(none), parent(c0)).
opencv_contour(r1, c150, hole, 4.0).
opencv_contour_hierarchy(r1, c150, next(c151), previous(c149), child(none), parent(c0)).
opencv_contour(r1, c151, hole, 2.0).
opencv_contour_hierarchy(r1, c151, next(c152), previous(c150), child(none), parent(c0)).
opencv_contour(r1, c152, hole, 2.0).
opencv_contour_hierarchy(r1, c152, next(c153), previous(c151), child(none), parent(c0)).
opencv_contour(r1, c153, hole, 4.0).
opencv_contour_hierarchy(r1, c153, next(c154), previous(c152), child(none), parent(c0)).
opencv_contour(r1, c154, hole, 2.0).
opencv_contour_hierarchy(r1, c154, next(c155), previous(c153), child(none), parent(c0)).
opencv_contour(r1, c155, hole, 28.5).
opencv_contour_hierarchy(r1, c155, next(c156), previous(c154), child(none), parent(c0)).
opencv_contour(r1, c156, hole, 2.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 2.0).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 2.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 42.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 4.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 4.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 2.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 2.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 32.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 25.5).
opencv_contour_hierarchy(r1, c165, next(c166), previous(c164), child(none), parent(c0)).
opencv_contour(r1, c166, hole, 7.0).
opencv_contour_hierarchy(r1, c166, next(c167), previous(c165), child(none), parent(c0)).
opencv_contour(r1, c167, hole, 2.0).
opencv_contour_hierarchy(r1, c167, next(c168), previous(c166), child(none), parent(c0)).
opencv_contour(r1, c168, hole, 2.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 7.0).
opencv_contour_hierarchy(r1, c169, next(c170), previous(c168), child(none), parent(c0)).
opencv_contour(r1, c170, hole, 2.0).
opencv_contour_hierarchy(r1, c170, next(c171), previous(c169), child(none), parent(c0)).
opencv_contour(r1, c171, hole, 7.0).
opencv_contour_hierarchy(r1, c171, next(c172), previous(c170), child(none), parent(c0)).
opencv_contour(r1, c172, hole, 7.0).
opencv_contour_hierarchy(r1, c172, next(c173), previous(c171), child(none), parent(c0)).
opencv_contour(r1, c173, hole, 2.0).
opencv_contour_hierarchy(r1, c173, next(c174), previous(c172), child(none), parent(c0)).
opencv_contour(r1, c174, hole, 2.0).
opencv_contour_hierarchy(r1, c174, next(c175), previous(c173), child(none), parent(c0)).
opencv_contour(r1, c175, hole, 2.0).
opencv_contour_hierarchy(r1, c175, next(c176), previous(c174), child(none), parent(c0)).
opencv_contour(r1, c176, hole, 2.0).
opencv_contour_hierarchy(r1, c176, next(c177), previous(c175), child(none), parent(c0)).
opencv_contour(r1, c177, hole, 2.0).
opencv_contour_hierarchy(r1, c177, next(c178), previous(c176), child(none), parent(c0)).
opencv_contour(r1, c178, hole, 35.5).
opencv_contour_hierarchy(r1, c178, next(c179), previous(c177), child(none), parent(c0)).
opencv_contour(r1, c179, hole, 8.0).
opencv_contour_hierarchy(r1, c179, next(c180), previous(c178), child(none), parent(c0)).
opencv_contour(r1, c180, hole, 11.0).
opencv_contour_hierarchy(r1, c180, next(c181), previous(c179), child(none), parent(c0)).
opencv_contour(r1, c181, hole, 2.0).
opencv_contour_hierarchy(r1, c181, next(c182), previous(c180), child(none), parent(c0)).
opencv_contour(r1, c182, hole, 7.0).
opencv_contour_hierarchy(r1, c182, next(c183), previous(c181), child(none), parent(c0)).
opencv_contour(r1, c183, hole, 2.0).
opencv_contour_hierarchy(r1, c183, next(c184), previous(c182), child(none), parent(c0)).
opencv_contour(r1, c184, hole, 8.5).
opencv_contour_hierarchy(r1, c184, next(c185), previous(c183), child(none), parent(c0)).
opencv_contour(r1, c185, hole, 2.0).
opencv_contour_hierarchy(r1, c185, next(c186), previous(c184), child(none), parent(c0)).
opencv_contour(r1, c186, hole, 2.0).
opencv_contour_hierarchy(r1, c186, next(c187), previous(c185), child(none), parent(c0)).
opencv_contour(r1, c187, hole, 2.0).
opencv_contour_hierarchy(r1, c187, next(c188), previous(c186), child(none), parent(c0)).
opencv_contour(r1, c188, hole, 2.0).
opencv_contour_hierarchy(r1, c188, next(c189), previous(c187), child(none), parent(c0)).
opencv_contour(r1, c189, hole, 2.0).
opencv_contour_hierarchy(r1, c189, next(c190), previous(c188), child(none), parent(c0)).
opencv_contour(r1, c190, hole, 2.0).
opencv_contour_hierarchy(r1, c190, next(c191), previous(c189), child(none), parent(c0)).
opencv_contour(r1, c191, hole, 2.0).
opencv_contour_hierarchy(r1, c191, next(c192), previous(c190), child(none), parent(c0)).
opencv_contour(r1, c192, hole, 10.0).
opencv_contour_hierarchy(r1, c192, next(c193), previous(c191), child(none), parent(c0)).
opencv_contour(r1, c193, hole, 2.0).
opencv_contour_hierarchy(r1, c193, next(c194), previous(c192), child(none), parent(c0)).
opencv_contour(r1, c194, hole, 2.0).
opencv_contour_hierarchy(r1, c194, next(c195), previous(c193), child(none), parent(c0)).
opencv_contour(r1, c195, hole, 4.0).
opencv_contour_hierarchy(r1, c195, next(c196), previous(c194), child(none), parent(c0)).
opencv_contour(r1, c196, hole, 2.0).
opencv_contour_hierarchy(r1, c196, next(c197), previous(c195), child(none), parent(c0)).
opencv_contour(r1, c197, hole, 2.0).
opencv_contour_hierarchy(r1, c197, next(c198), previous(c196), child(none), parent(c0)).
opencv_contour(r1, c198, hole, 2.0).
opencv_contour_hierarchy(r1, c198, next(c199), previous(c197), child(none), parent(c0)).
opencv_contour(r1, c199, hole, 2.0).
opencv_contour_hierarchy(r1, c199, next(c200), previous(c198), child(none), parent(c0)).
opencv_contour(r1, c200, hole, 11.5).
opencv_contour_hierarchy(r1, c200, next(c201), previous(c199), child(none), parent(c0)).
opencv_contour(r1, c201, hole, 2.0).
opencv_contour_hierarchy(r1, c201, next(c202), previous(c200), child(none), parent(c0)).
opencv_contour(r1, c202, hole, 2.0).
opencv_contour_hierarchy(r1, c202, next(c203), previous(c201), child(none), parent(c0)).
opencv_contour(r1, c203, hole, 4.0).
opencv_contour_hierarchy(r1, c203, next(c204), previous(c202), child(none), parent(c0)).
opencv_contour(r1, c204, hole, 2.0).
opencv_contour_hierarchy(r1, c204, next(c205), previous(c203), child(none), parent(c0)).
opencv_contour(r1, c205, hole, 15.0).
opencv_contour_hierarchy(r1, c205, next(c206), previous(c204), child(none), parent(c0)).
opencv_contour(r1, c206, hole, 2.0).
opencv_contour_hierarchy(r1, c206, next(c207), previous(c205), child(none), parent(c0)).
opencv_contour(r1, c207, hole, 5.5).
opencv_contour_hierarchy(r1, c207, next(c208), previous(c206), child(none), parent(c0)).
opencv_contour(r1, c208, hole, 2.0).
opencv_contour_hierarchy(r1, c208, next(c209), previous(c207), child(none), parent(c0)).
opencv_contour(r1, c209, hole, 2.0).
opencv_contour_hierarchy(r1, c209, next(c210), previous(c208), child(none), parent(c0)).
opencv_contour(r1, c210, hole, 4.0).
opencv_contour_hierarchy(r1, c210, next(c211), previous(c209), child(none), parent(c0)).
opencv_contour(r1, c211, hole, 2.0).
opencv_contour_hierarchy(r1, c211, next(c212), previous(c210), child(none), parent(c0)).
opencv_contour(r1, c212, hole, 13.5).
opencv_contour_hierarchy(r1, c212, next(c213), previous(c211), child(none), parent(c0)).
opencv_contour(r1, c213, hole, 2.0).
opencv_contour_hierarchy(r1, c213, next(c214), previous(c212), child(none), parent(c0)).
opencv_contour(r1, c214, hole, 2.0).
opencv_contour_hierarchy(r1, c214, next(c215), previous(c213), child(none), parent(c0)).
opencv_contour(r1, c215, hole, 2.0).
opencv_contour_hierarchy(r1, c215, next(c216), previous(c214), child(none), parent(c0)).
opencv_contour(r1, c216, hole, 5.5).
opencv_contour_hierarchy(r1, c216, next(c217), previous(c215), child(none), parent(c0)).
opencv_contour(r1, c217, hole, 2.0).
opencv_contour_hierarchy(r1, c217, next(c218), previous(c216), child(none), parent(c0)).
opencv_contour(r1, c218, hole, 2.0).
opencv_contour_hierarchy(r1, c218, next(c219), previous(c217), child(none), parent(c0)).
opencv_contour(r1, c219, hole, 2.0).
opencv_contour_hierarchy(r1, c219, next(c220), previous(c218), child(none), parent(c0)).
opencv_contour(r1, c220, hole, 20.0).
opencv_contour_hierarchy(r1, c220, next(c221), previous(c219), child(none), parent(c0)).
opencv_contour(r1, c221, hole, 10.0).
opencv_contour_hierarchy(r1, c221, next(c222), previous(c220), child(none), parent(c0)).
opencv_contour(r1, c222, hole, 2.0).
opencv_contour_hierarchy(r1, c222, next(c223), previous(c221), child(none), parent(c0)).
opencv_contour(r1, c223, hole, 4.0).
opencv_contour_hierarchy(r1, c223, next(c224), previous(c222), child(none), parent(c0)).
opencv_contour(r1, c224, hole, 32.5).
opencv_contour_hierarchy(r1, c224, next(none), previous(c223), child(none), parent(c0)).
opencv_morphology(r119, opening_area(0), closing_area(8), gradient_area(14)).
opencv_shape_metrics(r119, contour_area(0.0), hull_area(0.0), solidity(0.0), circularity(0.0), extent(0.0), aspect_ratio(0.25)).
opencv_contour(r119, c0, outer, 0.0).
opencv_contour_hierarchy(r119, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r301, opening_area(0), closing_area(20), gradient_area(26)).
opencv_shape_metrics(r301, contour_area(0.0), hull_area(0.0), solidity(0.0), circularity(0.0), extent(0.0), aspect_ratio(8.0)).
opencv_contour(r301, c0, outer, 0.0).
opencv_contour_hierarchy(r301, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r119, 1).
opencv_watershed_segment(r119, ws1, 4, centroid(173,59)).
opencv_watershed_count(r132, 1).
opencv_watershed_segment(r132, ws1, 4, centroid(850,67)).
opencv_watershed_count(r135, 1).
opencv_watershed_segment(r135, ws1, 4, centroid(835,68)).
opencv_watershed_count(r253, 1).
opencv_watershed_segment(r253, ws1, 4, centroid(13,186)).
opencv_watershed_count(r301, 1).
opencv_watershed_segment(r301, ws1, 8, centroid(78,219)).
