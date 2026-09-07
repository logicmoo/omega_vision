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

region(r1, '#878a89', 310593, centroid(426,181)).
perimeter(r1, 3252).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(483,334),xy(485,334),xy(483,334)]).
hole(r1, [xy(484,332),xy(486,332),xy(484,332)]).
hole(r1, [xy(485,331),xy(487,331),xy(485,331)]).
hole(r1, [xy(488,326),xy(487,330),xy(488,326)]).
hole(r1, [xy(488,326),xy(490,326),xy(488,326)]).
hole(r1, [xy(489,324),xy(491,324),xy(489,324)]).
hole(r1, [xy(744,301),xy(746,301),xy(744,301)]).
hole(r1, [xy(742,300),xy(744,300),xy(742,300)]).
hole(r1, [xy(740,299),xy(742,299),xy(740,299)]).
hole(r1, [xy(722,291),xy(724,290),xy(740,299),xy(737,300),xy(727,296),xy(722,291)]).
hole(r1, [xy(716,291),xy(718,291),xy(716,291)]).
hole(r1, [xy(720,290),xy(722,290),xy(720,290)]).
hole(r1, [xy(718,289),xy(720,289),xy(718,289)]).
hole(r1, [xy(716,288),xy(718,288),xy(716,288)]).
hole(r1, [xy(714,287),xy(716,287),xy(714,287)]).
hole(r1, [xy(712,286),xy(714,286),xy(712,286)]).
hole(r1, [xy(709,285),xy(712,285),xy(709,285)]).
hole(r1, [xy(708,284),xy(710,284),xy(708,284)]).
hole(r1, [xy(706,283),xy(708,283),xy(706,283)]).
hole(r1, [xy(703,282),xy(706,282),xy(703,282)]).
hole(r1, [xy(489,282),xy(491,283),xy(489,282)]).
hole(r1, [xy(701,281),xy(704,281),xy(701,281)]).
hole(r1, [xy(699,280),xy(702,280),xy(699,280)]).
hole(r1, [xy(488,280),xy(490,281),xy(488,280)]).
hole(r1, [xy(697,279),xy(700,279),xy(697,279)]).
hole(r1, [xy(695,278),xy(698,278),xy(695,278)]).
hole(r1, [xy(487,278),xy(489,278),xy(487,278)]).
hole(r1, [xy(693,277),xy(696,277),xy(693,277)]).
hole(r1, [xy(691,276),xy(693,276),xy(691,276)]).
hole(r1, [xy(486,276),xy(488,277),xy(486,276)]).
hole(r1, [xy(689,275),xy(691,275),xy(689,275)]).
hole(r1, [xy(485,274),xy(487,275),xy(485,274)]).
hole(r1, [xy(484,273),xy(486,273),xy(484,273)]).
hole(r1, [xy(483,271),xy(485,271),xy(483,271)]).
hole(r1, [xy(482,269),xy(484,269),xy(482,269)]).
hole(r1, [xy(481,268),xy(483,268),xy(481,268)]).
hole(r1, [xy(480,266),xy(482,266),xy(480,266)]).
hole(r1, [xy(479,265),xy(481,265),xy(479,265)]).
hole(r1, [xy(674,264),xy(676,264),xy(674,264)]).
hole(r1, [xy(478,263),xy(480,264),xy(478,263)]).
hole(r1, [xy(671,262),xy(673,262),xy(671,262)]).
hole(r1, [xy(477,262),xy(479,262),xy(477,262)]).
hole(r1, [xy(476,260),xy(478,261),xy(476,260)]).
hole(r1, [xy(474,259),xy(476,259),xy(474,259)]).
hole(r1, [xy(658,257),xy(660,257),xy(658,257)]).
hole(r1, [xy(667,255),xy(669,255),xy(667,255)]).
hole(r1, [xy(657,255),xy(659,255),xy(657,255)]).
hole(r1, [xy(471,255),xy(473,255),xy(471,255)]).
hole(r1, [xy(470,254),xy(472,254),xy(470,254)]).
hole(r1, [xy(469,252),xy(471,253),xy(469,252)]).
hole(r1, [xy(468,251),xy(470,251),xy(468,251)]).
hole(r1, [xy(467,250),xy(469,250),xy(467,250)]).
hole(r1, [xy(465,248),xy(467,247),xy(468,249),xy(465,248)]).
hole(r1, [xy(464,247),xy(466,247),xy(464,247)]).
hole(r1, [xy(531,246),xy(536,245),xy(537,247),xy(532,248),xy(531,246)]).
hole(r1, [xy(463,246),xy(465,246),xy(463,246)]).
hole(r1, [xy(461,244),xy(463,243),xy(464,245),xy(461,244)]).
hole(r1, [xy(464,234),xy(466,234),xy(464,234)]).
hole(r1, [xy(572,229),xy(574,229),xy(572,229)]).
hole(r1, [xy(450,228),xy(452,228),xy(450,228)]).
hole(r1, [xy(449,227),xy(451,227),xy(449,227)]).
hole(r1, [xy(77,227),xy(79,227),xy(77,227)]).
hole(r1, [xy(566,226),xy(568,226),xy(566,226)]).
hole(r1, [xy(50,226),xy(52,226),xy(50,226)]).
hole(r1, [xy(565,225),xy(567,225),xy(565,225)]).
hole(r1, [xy(51,225),xy(53,225),xy(51,225)]).
hole(r1, [xy(563,224),xy(565,224),xy(563,224)]).
hole(r1, [xy(561,223),xy(563,223),xy(561,223)]).
hole(r1, [xy(437,223),xy(439,223),xy(437,223)]).
hole(r1, [xy(52,223),xy(54,223),xy(52,223)]).
hole(r1, [xy(559,222),xy(562,222),xy(559,222)]).
hole(r1, [xy(53,222),xy(55,222),xy(53,222)]).
hole(r1, [xy(558,221),xy(560,221),xy(558,221)]).
hole(r1, [xy(556,220),xy(558,220),xy(556,220)]).
hole(r1, [xy(554,219),xy(556,219),xy(554,219)]).
hole(r1, [xy(93,219),xy(95,219),xy(93,219)]).
hole(r1, [xy(4,219),xy(6,219),xy(4,219)]).
hole(r1, [xy(553,218),xy(555,218),xy(553,218)]).
hole(r1, [xy(92,218),xy(94,218),xy(92,218)]).
hole(r1, [xy(5,218),xy(7,218),xy(5,218)]).
hole(r1, [xy(567,217),xy(569,217),xy(567,217)]).
hole(r1, [xy(551,217),xy(553,217),xy(551,217)]).
hole(r1, [xy(427,217),xy(429,217),xy(427,217)]).
hole(r1, [xy(90,217),xy(92,217),xy(90,217)]).
hole(r1, [xy(6,217),xy(8,217),xy(6,217)]).
hole(r1, [xy(565,216),xy(567,216),xy(565,216)]).
hole(r1, [xy(549,216),xy(551,216),xy(549,216)]).
hole(r1, [xy(89,216),xy(91,216),xy(89,216)]).
hole(r1, [xy(547,215),xy(549,215),xy(547,215)]).
hole(r1, [xy(87,215),xy(89,215),xy(87,215)]).
hole(r1, [xy(545,214),xy(548,214),xy(545,214)]).
hole(r1, [xy(86,214),xy(88,214),xy(86,214)]).
hole(r1, [xy(543,213),xy(546,213),xy(543,213)]).
hole(r1, [xy(85,213),xy(87,213),xy(85,213)]).
hole(r1, [xy(541,212),xy(543,212),xy(541,212)]).
hole(r1, [xy(84,212),xy(86,212),xy(84,212)]).
hole(r1, [xy(538,211),xy(540,211),xy(538,211)]).
hole(r1, [xy(83,211),xy(85,211),xy(83,211)]).
hole(r1, [xy(535,210),xy(537,210),xy(535,210)]).
hole(r1, [xy(82,210),xy(84,210),xy(82,210)]).
hole(r1, [xy(549,209),xy(551,209),xy(549,209)]).
hole(r1, [xy(81,209),xy(83,209),xy(81,209)]).
hole(r1, [xy(80,208),xy(82,208),xy(80,208)]).
hole(r1, [xy(79,207),xy(81,207),xy(79,207)]).
hole(r1, [xy(511,206),xy(513,206),xy(511,206)]).
hole(r1, [xy(78,206),xy(80,206),xy(78,206)]).
hole(r1, [xy(77,205),xy(79,205),xy(77,205)]).
hole(r1, [xy(534,203),xy(536,202),xy(537,204),xy(535,205),xy(534,203)]).
hole(r1, [xy(76,203),xy(78,203),xy(76,203)]).
hole(r1, [xy(75,202),xy(77,202),xy(75,202)]).
hole(r1, [xy(74,201),xy(76,201),xy(74,201)]).
hole(r1, [xy(539,200),xy(541,200),xy(539,200)]).
hole(r1, [xy(430,197),xy(432,198),xy(430,197)]).
hole(r1, [xy(507,196),xy(510,196),xy(507,196)]).
hole(r1, [xy(429,196),xy(431,196),xy(429,196)]).
hole(r1, [xy(70,196),xy(72,196),xy(70,196)]).
hole(r1, [xy(428,195),xy(430,195),xy(428,195)]).
hole(r1, [xy(61,195),xy(63,195),xy(61,195)]).
hole(r1, [xy(515,194),xy(519,194),xy(515,194)]).
hole(r1, [xy(505,194),xy(507,194),xy(505,194)]).
hole(r1, [xy(427,194),xy(429,194),xy(427,194)]).
hole(r1, [xy(60,194),xy(62,194),xy(60,194)]).
hole(r1, [xy(426,193),xy(428,193),xy(426,193)]).
hole(r1, [xy(63,193),xy(65,193),xy(63,193)]).
hole(r1, [xy(425,192),xy(427,192),xy(425,192)]).
hole(r1, [xy(59,192),xy(61,193),xy(59,192)]).
hole(r1, [xy(58,191),xy(60,191),xy(58,191)]).
hole(r1, [xy(422,190),xy(425,190),xy(422,190)]).
hole(r1, [xy(158,190),xy(160,190),xy(158,190)]).
hole(r1, [xy(57,190),xy(59,190),xy(57,190)]).
hole(r1, [xy(56,189),xy(58,189),xy(56,189)]).
hole(r1, [xy(55,188),xy(57,188),xy(55,188)]).
hole(r1, [xy(54,187),xy(56,187),xy(54,187)]).
hole(r1, [xy(419,186),xy(421,186),xy(419,186)]).
hole(r1, [xy(53,186),xy(55,186),xy(53,186)]).
hole(r1, [xy(418,185),xy(420,185),xy(418,185)]).
hole(r1, [xy(52,185),xy(54,185),xy(52,185)]).
hole(r1, [xy(114,184),xy(116,184),xy(114,184)]).
hole(r1, [xy(51,184),xy(53,184),xy(51,184)]).
hole(r1, [xy(112,183),xy(114,183),xy(112,183)]).
hole(r1, [xy(43,180),xy(45,180),xy(43,180)]).
hole(r1, [xy(133,179),xy(135,179),xy(133,179)]).
hole(r1, [xy(41,179),xy(43,179),xy(41,179)]).
hole(r1, [xy(132,178),xy(134,178),xy(132,178)]).
hole(r1, [xy(33,178),xy(35,178),xy(33,178)]).
hole(r1, [xy(98,177),xy(100,177),xy(98,177)]).
hole(r1, [xy(242,167),xy(244,167),xy(242,167)]).
hole(r1, [xy(243,166),xy(245,166),xy(243,166)]).
hole(r1, [xy(244,164),xy(246,164),xy(244,164)]).
hole(r1, [xy(247,160),xy(246,164),xy(247,160)]).
hole(r1, [xy(247,160),xy(249,160),xy(247,160)]).
hole(r1, [xy(249,159),xy(250,157),xy(252,158),xy(249,159)]).
hole(r1, [xy(251,155),xy(253,156),xy(251,155)]).
hole(r1, [xy(252,154),xy(254,154),xy(252,154)]).
hole(r1, [xy(255,152),xy(257,153),xy(255,152)]).
hole(r1, [xy(256,151),xy(258,151),xy(256,151)]).
hole(r1, [xy(257,150),xy(261,149),xy(260,151),xy(257,150)]).
hole(r1, [xy(270,145),xy(272,145),xy(270,145)]).
hole(r1, [xy(287,90),xy(289,90),xy(287,90)]).
hole(r1, [xy(288,89),xy(290,89),xy(288,89)]).
hole(r1, [xy(289,88),xy(291,88),xy(289,88)]).
hole(r1, [xy(293,83),xy(294,85),xy(291,88),xy(290,86),xy(293,83)]).
hole(r1, [xy(293,83),xy(295,83),xy(293,83)]).
hole(r1, [xy(294,82),xy(296,82),xy(294,82)]).
hole(r1, [xy(295,80),xy(297,81),xy(295,80)]).
midline(r1, [xy(640,144),xy(568,216),xy(565,215),xy(565,217),xy(566,217),xy(567,216),xy(567,218),xy(568,218),xy(671,114),xy(668,110),xy(658,110),xy(655,107),xy(643,106),xy(636,101),xy(620,101),xy(615,96),xy(391,94),xy(337,40),xy(255,40),xy(246,43),xy(215,74),xy(184,74),xy(174,77),xy(163,81),xy(148,96),xy(95,96),xy(32,159),xy(29,178),xy(29,216),xy(6,216),xy(4,218),xy(5,220),xy(6,219),xy(5,218),xy(6,217),xy(7,218),xy(6,220)]).
midline(r1, [xy(33,159),xy(95,97)]).
midline(r1, [xy(672,113),xy(675,113),xy(699,138),xy(629,208),xy(628,279),xy(625,281),xy(574,230),xy(561,224)]).
midline(r1, [xy(629,229),xy(654,254),xy(657,254),xy(658,258),xy(660,257),xy(658,252),xy(660,252),xy(671,263),xy(672,263),xy(673,262),xy(672,261),xy(673,261)]).
midline(r1, [xy(565,226),xy(566,227)]).
midline(r1, [xy(627,281),xy(626,290),xy(623,293),xy(607,293),xy(544,229),xy(528,229),xy(524,225),xy(514,225),xy(510,221),xy(506,221),xy(500,226),xy(485,220),xy(470,205),xy(453,221),xy(439,221),xy(429,231),xy(427,218),xy(427,216),xy(429,216),xy(429,218)]).
midline(r1, [xy(439,222),xy(439,223),xy(430,231)]).
midline(r1, [xy(29,217),xy(29,223),xy(50,244),xy(50,225),xy(53,221),xy(55,221),xy(53,226)]).
midline(r1, [xy(55,223),xy(54,224)]).
midline(r1, [xy(51,244),xy(77,271),xy(77,226),xy(79,226),xy(79,228)]).
midline(r1, [xy(470,204),xy(471,157),xy(467,154),xy(429,192),xy(425,191),xy(426,194),xy(343,277),xy(337,277),xy(323,263),xy(160,263),xy(153,253),xy(153,185),xy(117,184),xy(114,182),xy(112,182),xy(112,184),xy(116,185)]).
midline(r1, [xy(467,155),xy(429,193),xy(427,192)]).
midline(r1, [xy(572,228),xy(574,229)]).
midline(r1, [xy(471,161),xy(505,195),xy(506,195),xy(507,194),xy(506,193),xy(507,193)]).
midline(r1, [xy(255,41),xy(293,83),xy(295,81),xy(296,82),xy(294,84),xy(296,83),xy(358,145),xy(358,152),xy(342,168),xy(291,118),xy(258,117),xy(216,75),xy(246,44)]).
midline(r1, [xy(357,154),xy(342,169),xy(342,231),xy(339,233),xy(257,152),xy(182,76)]).
midline(r1, [xy(257,150),xy(258,151)]).
midline(r1, [xy(317,145),xy(270,144),xy(270,146),xy(272,146)]).
midline(r1, [xy(30,178),xy(33,177),xy(33,179),xy(34,179),xy(35,178),xy(34,177),xy(35,177)]).
midline(r1, [xy(468,153),xy(471,146),xy(521,97)]).
midline(r1, [xy(471,150),xy(513,192),xy(513,198),xy(522,206),xy(513,217),xy(511,207),xy(511,205),xy(513,205),xy(513,207)]).
midline(r1, [xy(521,210),xy(514,217)]).
midline(r1, [xy(512,217),xy(510,220),xy(512,219)]).
midline(r1, [xy(153,184),xy(152,179),xy(136,179),xy(134,177),xy(100,176),xy(98,176),xy(98,178),xy(100,178)]).
midline(r1, [xy(341,233),xy(337,239),xy(178,77)]).
midline(r1, [xy(254,155),xy(254,153)]).
midline(r1, [xy(254,157),xy(251,157),xy(173,79)]).
midline(r1, [xy(163,82),xy(149,96),xy(153,100),xy(153,179)]).
midline(r1, [xy(465,211),xy(464,235),xy(465,235),xy(466,233)]).
midline(r1, [xy(450,222),xy(449,228),xy(451,229),xy(452,228),xy(450,226),xy(452,227)]).
midline(r1, [xy(78,271),xy(84,278),xy(142,278),xy(147,272),xy(95,220),xy(94,220),xy(88,216),xy(74,202),xy(74,199),xy(70,196),xy(70,195),xy(72,195),xy(72,196)]).
midline(r1, [xy(89,217),xy(90,218)]).
midline(r1, [xy(93,220),xy(92,219)]).
midline(r1, [xy(77,206),xy(87,216)]).
midline(r1, [xy(630,208),xy(700,138),xy(715,138),xy(774,197),xy(774,201),xy(700,277),xy(696,276),xy(695,278),xy(695,280),xy(697,279),xy(698,284),xy(662,320),xy(651,320),xy(625,292)]).
midline(r1, [xy(703,273),xy(774,202),xy(779,207),xy(779,210),xy(706,282),xy(706,286),xy(669,323),xy(665,323),xy(663,320),xy(697,286)]).
midline(r1, [xy(706,287),xy(671,324),xy(685,323),xy(690,329),xy(702,331),xy(770,331),xy(773,327),xy(748,302),xy(742,298),xy(740,298),xy(740,300),xy(742,299),xy(742,301),xy(746,302)]).
midline(r1, [xy(711,279),xy(779,211),xy(782,213),xy(782,219),xy(719,282),xy(718,286),xy(712,285),xy(712,287),xy(713,287),xy(714,286),xy(714,288),xy(716,287),xy(716,292),xy(686,323),xy(715,294)]).
midline(r1, [xy(698,278),xy(698,277)]).
midline(r1, [xy(8,218),xy(8,217)]).
midline(r1, [xy(359,145),xy(362,123),xy(391,95)]).
midline(r1, [xy(363,129),xy(419,187),xy(420,187),xy(421,186),xy(419,184),xy(421,185)]).
midline(r1, [xy(469,206),xy(466,209)]).
midline(r1, [xy(148,272),xy(152,272),xy(160,264)]).
midline(r1, [xy(506,222),xy(475,255),xy(471,253),xy(470,254),xy(471,256),xy(473,255),xy(472,254)]).
midline(r1, [xy(473,256),xy(421,308),xy(414,308),xy(403,304),xy(380,281),xy(348,281),xy(344,277),xy(427,194),xy(429,197),xy(430,197),xy(431,196),xy(429,194),xy(431,195)]).
midline(r1, [xy(470,260),xy(422,308),xy(425,312),xy(428,311),xy(429,314),xy(437,314),xy(477,273),xy(483,271),xy(479,266),xy(479,265),xy(480,264),xy(481,264),xy(481,265),xy(480,266),xy(481,267),xy(482,265)]).
midline(r1, [xy(450,302),xy(465,301),xy(467,305),xy(505,305),xy(506,307),xy(489,323),xy(488,326),xy(489,325),xy(490,325),xy(490,327)]).
midline(r1, [xy(438,315),xy(468,345),xy(506,346),xy(528,323),xy(512,307),xy(507,307),xy(491,325)]).
midline(r1, [xy(528,324),xy(548,305),xy(510,268),xy(509,258),xy(491,275),xy(487,275),xy(485,276),xy(483,272),xy(485,271),xy(482,269),xy(483,268),xy(482,267),xy(483,267),xy(485,270)]).
midline(r1, [xy(485,274),xy(486,272)]).
midline(r1, [xy(522,281),xy(490,281),xy(489,282),xy(485,281),xy(466,301),xy(485,282)]).
midline(r1, [xy(485,267),xy(504,250),xy(505,238),xy(503,237),xy(478,261),xy(429,310),xy(429,311),xy(503,238)]).
midline(r1, [xy(505,237),xy(501,230),xy(477,254)]).
midline(r1, [xy(492,275),xy(508,259)]).
midline(r1, [xy(509,257),xy(509,252),xy(505,249)]).
midline(r1, [xy(549,305),xy(595,305),xy(606,293)]).
midline(r1, [xy(31,169),xy(41,177),xy(41,180),xy(42,180),xy(44,177),xy(43,181),xy(44,181),xy(45,180),xy(45,179)]).
midline(r1, [xy(45,177),xy(58,192),xy(60,191),xy(52,183),xy(60,190)]).
midline(r1, [xy(455,220),xy(463,212)]).
midline(r1, [xy(169,80),xy(335,247),xy(335,251),xy(324,263),xy(335,252)]).
midline(r1, [xy(339,238),xy(337,246)]).
midline(r1, [xy(774,327),xy(796,306),xy(796,240),xy(789,226),xy(783,220),xy(720,282)]).
midline(r1, [xy(154,190),xy(158,189),xy(159,191),xy(160,189)]).
midline(r1, [xy(428,231),xy(380,280),xy(428,233)]).
midline(r1, [xy(543,211),xy(535,209),xy(535,213),xy(525,224),xy(535,214)]).
midline(r1, [xy(541,209),xy(546,203),xy(546,213),xy(545,214),xy(545,216),xy(548,216),xy(549,215),xy(548,214),xy(550,215),xy(549,216),xy(549,217),xy(552,216),xy(550,219),xy(550,223),xy(545,229),xy(550,224)]).
midline(r1, [xy(198,213),xy(197,214)]).
midline(r1, [xy(635,106),xy(542,199),xy(539,199),xy(539,201),xy(541,201)]).
midline(r1, [xy(543,199),xy(638,104)]).
midline(r1, [xy(693,276),xy(691,274),xy(687,274),xy(676,263),xy(673,263),xy(674,265),xy(676,265)]).
midline(r1, [xy(693,277),xy(689,276)]).
midline(r1, [xy(598,160),xy(551,208)]).
midline(r1, [xy(597,161),xy(552,206)]).
midline(r1, [xy(95,219),xy(78,202)]).
midline(r1, [xy(91,216),xy(92,217)]).
midline(r1, [xy(95,218),xy(94,217)]).
midline(r1, [xy(75,202),xy(77,204),xy(78,204),xy(89,215)]).
midline(r1, [xy(586,163),xy(643,107)]).
midline(r1, [xy(489,230),xy(413,306),xy(469,252),xy(495,225)]).
midline(r1, [xy(558,222),xy(552,218),xy(556,212),xy(658,111)]).
midline(r1, [xy(553,219),xy(554,220)]).
midline(r1, [xy(607,114),xy(527,193),xy(526,202),xy(523,205),xy(526,203)]).
midline(r1, [xy(606,115),xy(528,193)]).
midline(r1, [xy(419,292),xy(462,250),xy(463,246),xy(464,245),xy(465,246),xy(463,249)]).
midline(r1, [xy(465,248),xy(466,247),xy(466,244),xy(488,222)]).
midline(r1, [xy(224,187),xy(223,188)]).
midline(r1, [xy(629,128),xy(599,159),xy(650,108)]).
midline(r1, [xy(242,166),xy(224,186),xy(244,167),xy(243,166),xy(244,163),xy(245,163),xy(246,164),xy(244,168)]).
midline(r1, [xy(556,218),xy(558,219),xy(558,221),xy(560,220),xy(559,222)]).
midline(r1, [xy(283,96),xy(282,97)]).
midline(r1, [xy(699,280),xy(699,282),xy(703,283)]).
midline(r1, [xy(704,281),xy(701,277),xy(700,279),xy(701,278),xy(702,280)]).
midline(r1, [xy(62,193),xy(61,193),xy(60,195),xy(62,196),xy(63,195),xy(63,192),xy(65,192),xy(65,193),xy(63,194)]).
midline(r1, [xy(474,258),xy(474,260),xy(475,260),xy(476,258)]).
midline(r1, [xy(543,213),xy(539,212),xy(537,210),xy(538,212)]).
midline(r1, [xy(541,211),xy(541,213)]).
midline(r1, [xy(487,331),xy(486,330),xy(484,331),xy(483,336),xy(476,343),xy(483,337)]).
midline(r1, [xy(485,331),xy(486,332),xy(485,333),xy(484,333),xy(485,334),xy(484,335),xy(485,335)]).
midline(r1, [xy(486,333),xy(487,332)]).
midline(r1, [xy(614,106),xy(619,101)]).
midline(r1, [xy(284,95),xy(287,89),xy(289,87),xy(290,87),xy(291,88),xy(287,92)]).
midline(r1, [xy(291,89),xy(289,91)]).
midline(r1, [xy(69,198),xy(65,195)]).
midline(r1, [xy(70,198),xy(70,197)]).
midline(r1, [xy(720,288),xy(718,287),xy(718,292)]).
midline(r1, [xy(488,277),xy(489,276)]).
midline(r1, [xy(567,224),xy(563,223)]).
midline(r1, [xy(667,255),xy(669,254),xy(669,255),xy(667,256)]).
midline(r1, [xy(708,284),xy(709,282),xy(710,283),xy(710,284),xy(709,285),xy(708,285)]).
midline(r1, [xy(719,290),xy(721,291),xy(722,289)]).
midline(r1, [xy(133,179),xy(134,178)]).
midline(r1, [xy(568,225),xy(568,226)]).
fillpoint(r1, xy(716,137), 131.8).
fillpoint(r1, xy(710,136), 130.8).
fillpoint(r1, xy(706,135), 129.9).
fillpoint(r1, xy(701,134), 128.9).
fillpoint(r1, xy(696,133), 128.0).
fillpoint(r1, xy(692,132), 127.0).
fillpoint(r1, xy(687,131), 126.1).
fillpoint(r1, xy(683,130), 125.1).
fillpoint(r1, xy(678,129), 124.2).
fillpoint(r1, xy(663,128), 123.2).
fillpoint(r1, xy(673,128), 123.2).
fillpoint(r1, xy(658,127), 122.2).
fillpoint(r1, xy(668,127), 122.2).
fillpoint(r1, xy(652,126), 121.3).
fillpoint(r1, xy(647,125), 120.3).
fillpoint(r1, xy(643,124), 119.4).
fillpoint(r1, xy(638,123), 118.4).
fillpoint(r1, xy(634,122), 117.5).
fillpoint(r1, xy(629,121), 116.5).
fillpoint(r1, xy(621,117), 112.7).
fillpoint(r1, xy(617,116), 111.7).
fillpoint(r1, xy(612,115), 110.8).
fillpoint(r1, xy(325,247), 110.8).
fillpoint(r1, xy(608,114), 109.8).
fillpoint(r1, xy(320,249), 109.8).
fillpoint(r1, xy(603,113), 108.9).
fillpoint(r1, xy(315,250), 108.9).
fillpoint(r1, xy(598,112), 107.9).
fillpoint(r1, xy(311,251), 107.9).
fillpoint(r1, xy(594,111), 107.0).
fillpoint(r1, xy(306,252), 107.0).
fillpoint(r1, xy(589,110), 106.0).
fillpoint(r1, xy(301,253), 106.0).
fillpoint(r1, xy(585,109), 105.1).
fillpoint(r1, xy(297,254), 105.1).
fillpoint(r1, xy(580,108), 104.1).
fillpoint(r1, xy(745,181), 104.1).
fillpoint(r1, xy(292,255), 104.1).
fillpoint(r1, xy(575,107), 103.1).
fillpoint(r1, xy(746,185), 103.1).
fillpoint(r1, xy(288,256), 103.1).
fillpoint(r1, xy(571,106), 102.2).
fillpoint(r1, xy(283,257), 102.2).
fillpoint(r1, xy(566,105), 101.2).
fillpoint(r1, xy(278,258), 101.2).
fillpoint(r1, xy(562,104), 100.3).
fillpoint(r1, xy(749,192), 100.3).
fillpoint(r1, xy(274,259), 100.3).
fillpoint(r1, xy(473,104), 99.6).
fillpoint(r1, xy(471,103), 99.3).
fillpoint(r1, xy(476,103), 99.3).
fillpoint(r1, xy(557,103), 99.3).
fillpoint(r1, xy(750,196), 99.3).
fillpoint(r1, xy(269,260), 99.3).
fillpoint(r1, xy(466,102), 98.4).
fillpoint(r1, xy(480,102), 98.4).
fillpoint(r1, xy(552,102), 98.4).
fillpoint(r1, xy(265,261), 98.4).
fillpoint(r1, xy(461,101), 97.4).
fillpoint(r1, xy(485,101), 97.4).
fillpoint(r1, xy(548,101), 97.4).
fillpoint(r1, xy(260,262), 97.4).
fillpoint(r1, xy(228,262), 96.9).
fillpoint(r1, xy(457,100), 96.5).
fillpoint(r1, xy(489,100), 96.5).
fillpoint(r1, xy(536,100), 96.5).
fillpoint(r1, xy(543,100), 96.5).
fillpoint(r1, xy(224,263), 96.5).
fillpoint(r1, xy(231,263), 96.5).
fillpoint(r1, xy(255,263), 96.5).
fillpoint(r1, xy(452,99), 95.5).
fillpoint(r1, xy(494,99), 95.5).
fillpoint(r1, xy(530,99), 95.5).
fillpoint(r1, xy(220,264), 95.5).
fillpoint(r1, xy(236,264), 95.5).
fillpoint(r1, xy(251,264), 95.5).
fillpoint(r1, xy(388,99), 95.0).
fillpoint(r1, xy(391,98), 94.5).
fillpoint(r1, xy(447,98), 94.5).
fillpoint(r1, xy(499,98), 94.5).
fillpoint(r1, xy(526,98), 94.5).
fillpoint(r1, xy(215,265), 94.5).
fillpoint(r1, xy(240,265), 94.5).
fillpoint(r1, xy(246,265), 94.5).
fillpoint(r1, xy(175,98), 93.8).
fillpoint(r1, xy(511,98), 93.8).
fillpoint(r1, xy(173,97), 93.6).
fillpoint(r1, xy(395,97), 93.6).
fillpoint(r1, xy(443,97), 93.6).
fillpoint(r1, xy(503,97), 93.6).
fillpoint(r1, xy(509,97), 93.6).
fillpoint(r1, xy(513,97), 93.6).
fillpoint(r1, xy(521,97), 93.6).
fillpoint(r1, xy(211,266), 93.6).
fillpoint(r1, xy(168,96), 92.6).
fillpoint(r1, xy(400,96), 92.6).
fillpoint(r1, xy(438,96), 92.6).
fillpoint(r1, xy(517,97), 92.6).
fillpoint(r1, xy(206,267), 92.6).
fillpoint(r1, xy(164,95), 91.7).
fillpoint(r1, xy(405,95), 91.7).
fillpoint(r1, xy(434,95), 91.7).
fillpoint(r1, xy(201,268), 91.7).
fillpoint(r1, xy(159,94), 90.7).
fillpoint(r1, xy(409,94), 90.7).
fillpoint(r1, xy(429,94), 90.7).
fillpoint(r1, xy(197,269), 90.7).
fillpoint(r1, xy(155,93), 89.8).
fillpoint(r1, xy(414,93), 89.8).
fillpoint(r1, xy(424,93), 89.8).
fillpoint(r1, xy(192,270), 89.8).
fillpoint(r1, xy(150,92), 88.8).
fillpoint(r1, xy(419,92), 88.8).
fillpoint(r1, xy(187,271), 88.8).
fillpoint(r1, xy(117,92), 88.6).
fillpoint(r1, xy(114,91), 87.9).
fillpoint(r1, xy(121,91), 87.9).
fillpoint(r1, xy(145,91), 87.9).
fillpoint(r1, xy(183,272), 87.9).
fillpoint(r1, xy(109,90), 86.9).
fillpoint(r1, xy(126,90), 86.9).
fillpoint(r1, xy(141,90), 86.9).
fillpoint(r1, xy(178,273), 86.9).
fillpoint(r1, xy(90,90), 86.8).
fillpoint(r1, xy(94,89), 86.0).
fillpoint(r1, xy(104,89), 86.0).
fillpoint(r1, xy(130,89), 86.0).
fillpoint(r1, xy(136,89), 86.0).
fillpoint(r1, xy(174,274), 86.0).
fillpoint(r1, xy(99,88), 85.0).
fillpoint(r1, xy(169,275), 85.0).
fillpoint(r1, xy(200,87), 84.0).
fillpoint(r1, xy(164,276), 84.0).
fillpoint(r1, xy(158,277), 83.1).
fillpoint(r1, xy(370,278), 82.1).
fillpoint(r1, xy(152,279), 81.2).
fillpoint(r1, xy(374,279), 81.2).
fillpoint(r1, xy(354,140), 80.4).
fillpoint(r1, xy(358,132), 80.2).
fillpoint(r1, xy(357,134), 80.2).
fillpoint(r1, xy(148,280), 80.2).
fillpoint(r1, xy(359,130), 80.1).
fillpoint(r1, xy(356,136), 80.1).
fillpoint(r1, xy(143,281), 79.3).
fillpoint(r1, xy(345,165), 79.0).
fillpoint(r1, xy(352,149), 78.9).
fillpoint(r1, xy(351,151), 78.9).
fillpoint(r1, xy(349,156), 78.9).
fillpoint(r1, xy(348,158), 78.9).
fillpoint(r1, xy(342,172), 78.9).
fillpoint(r1, xy(341,174), 78.9).
fillpoint(r1, xy(339,179), 78.9).
fillpoint(r1, xy(338,181), 78.9).
fillpoint(r1, xy(353,147), 78.8).
fillpoint(r1, xy(350,153), 78.8).
fillpoint(r1, xy(347,160), 78.8).
fillpoint(r1, xy(346,163), 78.8).
fillpoint(r1, xy(344,167), 78.8).
fillpoint(r1, xy(343,170), 78.8).
fillpoint(r1, xy(340,177), 78.8).
fillpoint(r1, xy(337,183), 78.8).
fillpoint(r1, xy(139,282), 78.3).
fillpoint(r1, xy(384,282), 78.3).
fillpoint(r1, xy(389,283), 77.4).
fillpoint(r1, xy(132,284), 76.4).
fillpoint(r1, xy(394,284), 76.4).
fillpoint(r1, xy(127,285), 75.4).
fillpoint(r1, xy(398,285), 75.4).
fillpoint(r1, xy(123,286), 74.5).
fillpoint(r1, xy(118,287), 73.5).
fillpoint(r1, xy(113,288), 72.6).
fillpoint(r1, xy(109,289), 71.6).
fillpoint(r1, xy(104,290), 70.7).
fillpoint(r1, xy(100,291), 69.7).
fillpoint(r1, xy(600,291), 69.7).
fillpoint(r1, xy(95,292), 68.8).
fillpoint(r1, xy(595,292), 68.8).
fillpoint(r1, xy(90,293), 67.8).
fillpoint(r1, xy(590,293), 67.8).
fillpoint(r1, xy(71,294), 66.9).
fillpoint(r1, xy(86,294), 66.9).
fillpoint(r1, xy(75,295), 65.9).
fillpoint(r1, xy(81,295), 65.9).
fillpoint(r1, xy(581,296), 64.9).
fillpoint(r1, xy(576,297), 64.0).
fillpoint(r1, xy(571,298), 63.0).
fillpoint(r1, xy(567,299), 62.1).
fillpoint(r1, xy(562,300), 61.1).
fillpoint(r1, xy(791,261), 60.2).
fillpoint(r1, xy(558,301), 60.2).
fillpoint(r1, xy(792,266), 59.2).
fillpoint(r1, xy(553,302), 59.2).
fillpoint(r1, xy(619,302), 59.2).
fillpoint(r1, xy(793,271), 58.3).
fillpoint(r1, xy(548,303), 58.3).
fillpoint(r1, xy(624,303), 58.3).
fillpoint(r1, xy(794,275), 57.3).
fillpoint(r1, xy(544,304), 57.3).
fillpoint(r1, xy(629,304), 57.3).
fillpoint(r1, xy(795,280), 56.3).
fillpoint(r1, xy(633,305), 56.3).
fillpoint(r1, xy(796,284), 55.4).
fillpoint(r1, xy(638,306), 55.4).
fillpoint(r1, xy(797,289), 54.4).
fillpoint(r1, xy(642,307), 54.4).
fillpoint(r1, xy(798,294), 53.5).
fillpoint(r1, xy(647,308), 53.5).
fillpoint(r1, xy(798,308), 53.5).
fillpoint(r1, xy(799,298), 52.5).
fillpoint(r1, xy(799,304), 52.5).
fillpoint(r1, xy(655,312), 49.7).
fillpoint(r1, xy(659,313), 48.7).
fillpoint(r1, xy(663,314), 47.8).
fillpoint(r1, xy(667,315), 46.8).
fillpoint(r1, xy(619,234), 45.9).
fillpoint(r1, xy(618,236), 45.9).
fillpoint(r1, xy(616,241), 45.9).
fillpoint(r1, xy(615,243), 45.9).
fillpoint(r1, xy(613,248), 45.9).
fillpoint(r1, xy(612,250), 45.9).
fillpoint(r1, xy(620,232), 45.8).
fillpoint(r1, xy(617,239), 45.8).
fillpoint(r1, xy(614,245), 45.8).
fillpoint(r1, xy(611,252), 45.8).
fillpoint(r1, xy(671,316), 45.8).
fillpoint(r1, xy(266,46), 44.9).
fillpoint(r1, xy(327,46), 44.9).
fillpoint(r1, xy(676,317), 44.9).
fillpoint(r1, xy(197,169), 44.8).
fillpoint(r1, xy(199,174), 44.8).
fillpoint(r1, xy(200,176), 44.8).
fillpoint(r1, xy(202,181), 44.8).
fillpoint(r1, xy(203,183), 44.8).
fillpoint(r1, xy(205,188), 44.8).
fillpoint(r1, xy(198,172), 44.7).
fillpoint(r1, xy(201,178), 44.7).
fillpoint(r1, xy(204,185), 44.7).
fillpoint(r1, xy(270,45), 43.9).
fillpoint(r1, xy(322,45), 43.9).
fillpoint(r1, xy(680,318), 43.9).
fillpoint(r1, xy(275,44), 43.0).
fillpoint(r1, xy(318,44), 43.0).
fillpoint(r1, xy(684,319), 43.0).
fillpoint(r1, xy(279,43), 42.0).
fillpoint(r1, xy(313,43), 42.0).
fillpoint(r1, xy(284,42), 41.1).
fillpoint(r1, xy(308,42), 41.1).
fillpoint(r1, xy(289,41), 40.1).
fillpoint(r1, xy(304,41), 40.1).
fillpoint(r1, xy(691,322), 40.1).
fillpoint(r1, xy(293,40), 39.2).
fillpoint(r1, xy(299,40), 39.2).
fillpoint(r1, xy(696,323), 39.2).
fillpoint(r1, xy(700,324), 38.2).
fillpoint(r1, xy(705,325), 37.2).
fillpoint(r1, xy(469,197), 36.3).
fillpoint(r1, xy(710,326), 36.3).
fillpoint(r1, xy(714,327), 35.3).
fillpoint(r1, xy(719,328), 34.4).
fillpoint(r1, xy(767,328), 34.4).
fillpoint(r1, xy(724,329), 33.4).
fillpoint(r1, xy(762,329), 33.4).
border(r1).
region(r78, '#818888', 4, centroid(536,204)).
perimeter(r78, 8).

adjacent(r1, r78).
shared_edge(r1, r78, 8).

encloses(r1, r78).

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
opencv_component(cc1, [r78]).
opencv_component_area(cc1, 4).
opencv_component_centroid(cc1, centroid(536,204)).
opencv_morphology(r1, opening_area(310586), closing_area(313260), gradient_area(5755)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 2.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 7.0).
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
opencv_contour(r1, c10, hole, 59.5).
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
opencv_contour(r1, c17, hole, 4.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 2.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 2.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 4.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 4.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 4.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 4.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 4.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 4.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 4.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 4.0).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 2.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 4.0).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 2.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 4.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 2.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 2.0).
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
opencv_contour(r1, c40, hole, 4.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 4.0).
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
opencv_contour(r1, c50, hole, 4.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 2.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 5.5).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 16.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 2.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 5.5).
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
opencv_contour(r1, c70, hole, 2.0).
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
opencv_contour(r1, c91, hole, 4.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 2.0).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 4.0).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 2.0).
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
opencv_contour(r1, c108, hole, 7.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 2.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 2.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 2.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 2.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 4.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 4.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 2.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 2.0).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 2.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 2.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 6.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 2.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 2.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 2.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 2.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 2.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 2.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 4.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 2.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 4.0).
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
opencv_contour_hierarchy(r1, c145, next(c146), previous(c144), child(none), parent(c0)).
opencv_contour(r1, c146, hole, 2.0).
opencv_contour_hierarchy(r1, c146, next(c147), previous(c145), child(none), parent(c0)).
opencv_contour(r1, c147, hole, 2.0).
opencv_contour_hierarchy(r1, c147, next(c148), previous(c146), child(none), parent(c0)).
opencv_contour(r1, c148, hole, 2.0).
opencv_contour_hierarchy(r1, c148, next(c149), previous(c147), child(none), parent(c0)).
opencv_contour(r1, c149, hole, 2.0).
opencv_contour_hierarchy(r1, c149, next(c150), previous(c148), child(none), parent(c0)).
opencv_contour(r1, c150, hole, 7.0).
opencv_contour_hierarchy(r1, c150, next(c151), previous(c149), child(none), parent(c0)).
opencv_contour(r1, c151, hole, 2.0).
opencv_contour_hierarchy(r1, c151, next(c152), previous(c150), child(none), parent(c0)).
opencv_contour(r1, c152, hole, 5.5).
opencv_contour_hierarchy(r1, c152, next(c153), previous(c151), child(none), parent(c0)).
opencv_contour(r1, c153, hole, 4.0).
opencv_contour_hierarchy(r1, c153, next(c154), previous(c152), child(none), parent(c0)).
opencv_contour(r1, c154, hole, 2.0).
opencv_contour_hierarchy(r1, c154, next(c155), previous(c153), child(none), parent(c0)).
opencv_contour(r1, c155, hole, 4.0).
opencv_contour_hierarchy(r1, c155, next(c156), previous(c154), child(none), parent(c0)).
opencv_contour(r1, c156, hole, 2.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 7.5).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 2.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 2.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 2.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 2.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 10.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 2.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 2.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 4.0).
opencv_contour_hierarchy(r1, c165, next(none), previous(c164), child(none), parent(c0)).
opencv_watershed_count(r78, 1).
opencv_watershed_segment(r78, ws1, 4, centroid(535,203)).
