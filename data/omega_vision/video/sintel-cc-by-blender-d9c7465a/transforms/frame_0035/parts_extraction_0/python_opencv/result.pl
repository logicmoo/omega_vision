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

region(r1, '#726159', 310452, centroid(427,181)).
perimeter(r1, 3738).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(228,338),xy(230,338),xy(228,338)]).
hole(r1, [xy(85,338),xy(87,338),xy(85,338)]).
hole(r1, [xy(242,334),xy(242,338),xy(242,334)]).
hole(r1, [xy(86,335),xy(88,335),xy(86,335)]).
hole(r1, [xy(586,334),xy(588,334),xy(586,334)]).
hole(r1, [xy(585,333),xy(587,333),xy(585,333)]).
hole(r1, [xy(584,332),xy(586,332),xy(584,332)]).
hole(r1, [xy(473,332),xy(475,332),xy(473,332)]).
hole(r1, [xy(225,332),xy(227,331),xy(228,333),xy(226,334),xy(225,332)]).
hole(r1, [xy(87,332),xy(89,332),xy(87,332)]).
hole(r1, [xy(583,331),xy(585,331),xy(583,331)]).
hole(r1, [xy(88,329),xy(90,329),xy(88,329)]).
hole(r1, [xy(581,328),xy(583,328),xy(581,328)]).
hole(r1, [xy(580,327),xy(582,327),xy(580,327)]).
hole(r1, [xy(579,326),xy(581,326),xy(579,326)]).
hole(r1, [xy(89,326),xy(91,327),xy(89,326)]).
hole(r1, [xy(578,325),xy(580,325),xy(578,325)]).
hole(r1, [xy(90,324),xy(92,324),xy(90,324)]).
hole(r1, [xy(635,323),xy(637,323),xy(635,323)]).
hole(r1, [xy(576,323),xy(579,324),xy(577,325),xy(576,323)]).
hole(r1, [xy(574,322),xy(577,322),xy(574,322)]).
hole(r1, [xy(573,321),xy(575,321),xy(573,321)]).
hole(r1, [xy(91,321),xy(93,322),xy(91,321)]).
hole(r1, [xy(572,320),xy(574,320),xy(572,320)]).
hole(r1, [xy(571,319),xy(573,319),xy(571,319)]).
hole(r1, [xy(92,319),xy(94,319),xy(92,319)]).
hole(r1, [xy(570,318),xy(572,318),xy(570,318)]).
hole(r1, [xy(568,317),xy(571,317),xy(568,317)]).
hole(r1, [xy(395,317),xy(397,317),xy(395,317)]).
hole(r1, [xy(93,317),xy(95,317),xy(93,317)]).
hole(r1, [xy(567,316),xy(569,316),xy(567,316)]).
hole(r1, [xy(394,316),xy(396,316),xy(394,316)]).
hole(r1, [xy(446,315),xy(448,315),xy(446,315)]).
hole(r1, [xy(564,314),xy(568,315),xy(564,314)]).
hole(r1, [xy(447,314),xy(449,314),xy(447,314)]).
hole(r1, [xy(391,314),xy(393,314),xy(391,314)]).
hole(r1, [xy(94,314),xy(96,315),xy(94,314)]).
hole(r1, [xy(563,313),xy(565,313),xy(563,313)]).
hole(r1, [xy(390,313),xy(392,313),xy(390,313)]).
hole(r1, [xy(561,312),xy(564,312),xy(561,312)]).
hole(r1, [xy(389,312),xy(391,312),xy(389,312)]).
hole(r1, [xy(95,312),xy(97,313),xy(95,312)]).
hole(r1, [xy(388,311),xy(390,311),xy(388,311)]).
hole(r1, [xy(558,310),xy(562,311),xy(558,310)]).
hole(r1, [xy(387,310),xy(389,310),xy(387,310)]).
hole(r1, [xy(96,310),xy(98,311),xy(96,310)]).
hole(r1, [xy(557,309),xy(559,309),xy(557,309)]).
hole(r1, [xy(386,309),xy(388,309),xy(386,309)]).
hole(r1, [xy(555,308),xy(558,308),xy(555,308)]).
hole(r1, [xy(385,308),xy(387,308),xy(385,308)]).
hole(r1, [xy(97,308),xy(99,309),xy(97,308)]).
hole(r1, [xy(553,307),xy(555,307),xy(553,307)]).
hole(r1, [xy(384,307),xy(386,307),xy(384,307)]).
hole(r1, [xy(552,306),xy(554,306),xy(552,306)]).
hole(r1, [xy(383,306),xy(385,306),xy(383,306)]).
hole(r1, [xy(98,306),xy(100,307),xy(98,306)]).
hole(r1, [xy(550,305),xy(552,305),xy(550,305)]).
hole(r1, [xy(455,305),xy(457,305),xy(455,305)]).
hole(r1, [xy(382,305),xy(384,305),xy(382,305)]).
hole(r1, [xy(99,305),xy(101,305),xy(99,305)]).
hole(r1, [xy(548,304),xy(550,304),xy(548,304)]).
hole(r1, [xy(381,304),xy(383,304),xy(381,304)]).
hole(r1, [xy(546,303),xy(548,303),xy(546,303)]).
hole(r1, [xy(380,303),xy(382,303),xy(380,303)]).
hole(r1, [xy(100,303),xy(102,303),xy(100,303)]).
hole(r1, [xy(545,302),xy(547,302),xy(545,302)]).
hole(r1, [xy(379,302),xy(381,302),xy(379,302)]).
hole(r1, [xy(543,301),xy(545,301),xy(543,301)]).
hole(r1, [xy(378,301),xy(380,301),xy(378,301)]).
hole(r1, [xy(101,301),xy(103,302),xy(101,301)]).
hole(r1, [xy(639,300),xy(641,300),xy(639,300)]).
hole(r1, [xy(541,300),xy(543,300),xy(541,300)]).
hole(r1, [xy(459,300),xy(461,300),xy(459,300)]).
hole(r1, [xy(377,300),xy(379,300),xy(377,300)]).
hole(r1, [xy(539,299),xy(541,299),xy(539,299)]).
hole(r1, [xy(376,299),xy(378,299),xy(376,299)]).
hole(r1, [xy(102,299),xy(104,300),xy(102,299)]).
hole(r1, [xy(537,298),xy(539,298),xy(537,298)]).
hole(r1, [xy(103,298),xy(105,298),xy(103,298)]).
hole(r1, [xy(638,297),xy(640,297),xy(638,297)]).
hole(r1, [xy(535,297),xy(537,297),xy(535,297)]).
hole(r1, [xy(533,296),xy(536,296),xy(533,296)]).
hole(r1, [xy(104,296),xy(106,297),xy(104,296)]).
hole(r1, [xy(531,295),xy(533,295),xy(531,295)]).
hole(r1, [xy(463,295),xy(465,295),xy(463,295)]).
hole(r1, [xy(247,295),xy(249,295),xy(247,295)]).
hole(r1, [xy(637,294),xy(639,294),xy(637,294)]).
hole(r1, [xy(529,294),xy(531,294),xy(529,294)]).
hole(r1, [xy(105,294),xy(107,295),xy(105,294)]).
hole(r1, [xy(527,293),xy(529,293),xy(527,293)]).
hole(r1, [xy(106,293),xy(108,293),xy(106,293)]).
hole(r1, [xy(636,292),xy(638,292),xy(636,292)]).
hole(r1, [xy(524,292),xy(527,292),xy(524,292)]).
hole(r1, [xy(510,292),xy(512,292),xy(510,292)]).
hole(r1, [xy(522,291),xy(525,291),xy(522,291)]).
hole(r1, [xy(107,291),xy(109,292),xy(107,291)]).
hole(r1, [xy(635,290),xy(637,290),xy(635,290)]).
hole(r1, [xy(520,290),xy(522,290),xy(520,290)]).
hole(r1, [xy(108,290),xy(110,290),xy(108,290)]).
hole(r1, [xy(606,289),xy(608,289),xy(606,289)]).
hole(r1, [xy(518,289),xy(520,289),xy(518,289)]).
hole(r1, [xy(634,288),xy(636,288),xy(634,288)]).
hole(r1, [xy(516,288),xy(519,288),xy(516,288)]).
hole(r1, [xy(469,288),xy(471,288),xy(469,288)]).
hole(r1, [xy(514,287),xy(516,287),xy(514,287)]).
hole(r1, [xy(470,287),xy(472,287),xy(470,287)]).
hole(r1, [xy(111,286),xy(110,290),xy(111,286)]).
hole(r1, [xy(511,286),xy(514,286),xy(511,286)]).
hole(r1, [xy(111,286),xy(113,286),xy(111,286)]).
hole(r1, [xy(508,284),xy(512,285),xy(508,284)]).
hole(r1, [xy(114,282),xy(113,286),xy(114,282)]).
hole(r1, [xy(507,282),xy(509,282),xy(507,282)]).
hole(r1, [xy(495,282),xy(497,282),xy(495,282)]).
hole(r1, [xy(114,282),xy(116,282),xy(114,282)]).
hole(r1, [xy(628,281),xy(630,281),xy(628,281)]).
hole(r1, [xy(506,281),xy(508,281),xy(506,281)]).
hole(r1, [xy(115,281),xy(117,281),xy(115,281)]).
hole(r1, [xy(627,280),xy(629,280),xy(627,280)]).
hole(r1, [xy(505,280),xy(507,280),xy(505,280)]).
hole(r1, [xy(116,280),xy(118,280),xy(116,280)]).
hole(r1, [xy(503,279),xy(505,279),xy(503,279)]).
hole(r1, [xy(117,279),xy(119,279),xy(117,279)]).
hole(r1, [xy(501,278),xy(504,278),xy(501,278)]).
hole(r1, [xy(497,277),xy(500,277),xy(497,277)]).
hole(r1, [xy(554,276),xy(556,276),xy(554,276)]).
hole(r1, [xy(496,276),xy(498,276),xy(496,276)]).
hole(r1, [xy(122,274),xy(119,279),xy(118,277),xy(122,274)]).
hole(r1, [xy(622,274),xy(625,275),xy(623,276),xy(622,274)]).
hole(r1, [xy(555,274),xy(557,274),xy(555,274)]).
hole(r1, [xy(491,274),xy(495,274),xy(491,274)]).
hole(r1, [xy(122,274),xy(124,274),xy(122,274)]).
hole(r1, [xy(123,273),xy(125,273),xy(123,273)]).
hole(r1, [xy(124,272),xy(126,272),xy(124,272)]).
hole(r1, [xy(125,271),xy(127,271),xy(125,271)]).
hole(r1, [xy(126,270),xy(129,270),xy(126,270)]).
hole(r1, [xy(558,269),xy(560,269),xy(558,269)]).
hole(r1, [xy(128,269),xy(130,269),xy(128,269)]).
hole(r1, [xy(559,268),xy(561,268),xy(559,268)]).
hole(r1, [xy(129,268),xy(131,268),xy(129,268)]).
hole(r1, [xy(130,267),xy(133,267),xy(130,267)]).
hole(r1, [xy(255,266),xy(257,266),xy(255,266)]).
hole(r1, [xy(132,266),xy(134,266),xy(132,266)]).
hole(r1, [xy(133,265),xy(136,265),xy(133,265)]).
hole(r1, [xy(135,264),xy(137,264),xy(135,264)]).
hole(r1, [xy(618,263),xy(620,263),xy(618,263)]).
hole(r1, [xy(136,263),xy(139,263),xy(136,263)]).
hole(r1, [xy(138,262),xy(140,262),xy(138,262)]).
hole(r1, [xy(617,261),xy(619,261),xy(617,261)]).
hole(r1, [xy(140,261),xy(142,261),xy(140,261)]).
hole(r1, [xy(257,260),xy(259,260),xy(257,260)]).
hole(r1, [xy(141,260),xy(144,260),xy(141,260)]).
hole(r1, [xy(143,259),xy(145,259),xy(143,259)]).
hole(r1, [xy(608,257),xy(608,263),xy(608,257)]).
hole(r1, [xy(570,258),xy(572,258),xy(570,258)]).
hole(r1, [xy(145,258),xy(147,258),xy(145,258)]).
hole(r1, [xy(147,257),xy(149,257),xy(147,257)]).
hole(r1, [xy(149,256),xy(151,256),xy(149,256)]).
hole(r1, [xy(606,255),xy(608,256),xy(606,255)]).
hole(r1, [xy(151,255),xy(153,255),xy(151,255)]).
hole(r1, [xy(612,254),xy(614,254),xy(612,254)]).
hole(r1, [xy(152,254),xy(155,254),xy(152,254)]).
hole(r1, [xy(154,253),xy(157,253),xy(154,253)]).
hole(r1, [xy(611,252),xy(613,252),xy(611,252)]).
hole(r1, [xy(156,252),xy(159,252),xy(156,252)]).
hole(r1, [xy(586,251),xy(588,251),xy(586,251)]).
hole(r1, [xy(158,251),xy(161,251),xy(158,251)]).
hole(r1, [xy(161,250),xy(163,250),xy(161,250)]).
hole(r1, [xy(601,249),xy(605,249),xy(607,254),xy(601,249)]).
hole(r1, [xy(259,249),xy(261,250),xy(259,249)]).
hole(r1, [xy(163,249),xy(166,249),xy(163,249)]).
hole(r1, [xy(606,248),xy(608,248),xy(606,248)]).
hole(r1, [xy(165,248),xy(168,248),xy(165,248)]).
hole(r1, [xy(167,247),xy(171,247),xy(167,247)]).
hole(r1, [xy(170,246),xy(173,246),xy(170,246)]).
hole(r1, [xy(331,245),xy(333,245),xy(331,245)]).
hole(r1, [xy(172,245),xy(175,245),xy(172,245)]).
hole(r1, [xy(175,244),xy(178,244),xy(175,244)]).
hole(r1, [xy(177,243),xy(181,243),xy(177,243)]).
hole(r1, [xy(262,242),xy(264,242),xy(262,242)]).
hole(r1, [xy(180,242),xy(184,242),xy(180,242)]).
hole(r1, [xy(183,241),xy(187,241),xy(183,241)]).
hole(r1, [xy(186,240),xy(190,240),xy(186,240)]).
hole(r1, [xy(189,239),xy(193,239),xy(189,239)]).
hole(r1, [xy(192,238),xy(196,238),xy(192,238)]).
hole(r1, [xy(263,237),xy(265,238),xy(263,237)]).
hole(r1, [xy(196,237),xy(199,237),xy(196,237)]).
hole(r1, [xy(199,236),xy(202,236),xy(199,236)]).
hole(r1, [xy(203,235),xy(206,235),xy(203,235)]).
hole(r1, [xy(206,234),xy(210,234),xy(206,234)]).
hole(r1, [xy(265,232),xy(265,236),xy(265,232)]).
hole(r1, [xy(210,233),xy(213,233),xy(210,233)]).
hole(r1, [xy(265,232),xy(267,232),xy(265,232)]).
hole(r1, [xy(214,232),xy(218,232),xy(214,232)]).
hole(r1, [xy(218,231),xy(221,231),xy(218,231)]).
hole(r1, [xy(224,230),xy(226,230),xy(224,230)]).
hole(r1, [xy(227,229),xy(230,229),xy(227,229)]).
hole(r1, [xy(513,228),xy(515,228),xy(513,228)]).
hole(r1, [xy(425,228),xy(427,228),xy(425,228)]).
hole(r1, [xy(231,228),xy(234,228),xy(231,228)]).
hole(r1, [xy(514,227),xy(516,227),xy(514,227)]).
hole(r1, [xy(423,227),xy(425,227),xy(423,227)]).
hole(r1, [xy(267,227),xy(269,227),xy(267,227)]).
hole(r1, [xy(233,227),xy(235,227),xy(233,227)]).
hole(r1, [xy(420,226),xy(423,226),xy(420,226)]).
hole(r1, [xy(318,226),xy(320,226),xy(318,226)]).
hole(r1, [xy(515,225),xy(517,225),xy(515,225)]).
hole(r1, [xy(237,224),xy(235,227),xy(237,224)]).
hole(r1, [xy(516,224),xy(518,224),xy(516,224)]).
hole(r1, [xy(237,224),xy(240,224),xy(237,224)]).
hole(r1, [xy(316,223),xy(318,223),xy(316,223)]).
hole(r1, [xy(239,223),xy(243,223),xy(239,223)]).
hole(r1, [xy(517,222),xy(519,222),xy(517,222)]).
hole(r1, [xy(274,221),xy(270,228),xy(268,226),xy(269,223),xy(274,221)]).
hole(r1, [xy(518,221),xy(520,221),xy(518,221)]).
hole(r1, [xy(315,221),xy(317,221),xy(315,221)]).
hole(r1, [xy(274,221),xy(277,221),xy(274,221)]).
hole(r1, [xy(286,220),xy(288,220),xy(286,220)]).
hole(r1, [xy(264,220),xy(266,220),xy(264,220)]).
hole(r1, [xy(519,219),xy(521,219),xy(519,219)]).
hole(r1, [xy(520,218),xy(522,218),xy(520,218)]).
hole(r1, [xy(313,218),xy(315,218),xy(313,218)]).
hole(r1, [xy(521,216),xy(523,216),xy(521,216)]).
hole(r1, [xy(522,215),xy(524,215),xy(522,215)]).
hole(r1, [xy(311,214),xy(313,214),xy(311,214)]).
hole(r1, [xy(523,212),xy(525,213),xy(523,212)]).
hole(r1, [xy(310,212),xy(312,212),xy(310,212)]).
hole(r1, [xy(524,211),xy(526,211),xy(524,211)]).
hole(r1, [xy(525,209),xy(527,210),xy(525,209)]).
hole(r1, [xy(526,208),xy(528,208),xy(526,208)]).
hole(r1, [xy(527,206),xy(529,206),xy(527,206)]).
hole(r1, [xy(528,204),xy(530,204),xy(528,204)]).
hole(r1, [xy(529,202),xy(531,202),xy(529,202)]).
hole(r1, [xy(530,200),xy(532,201),xy(530,200)]).
hole(r1, [xy(531,198),xy(533,198),xy(531,198)]).
hole(r1, [xy(532,196),xy(534,197),xy(532,196)]).
hole(r1, [xy(533,194),xy(535,194),xy(533,194)]).
hole(r1, [xy(534,192),xy(536,193),xy(534,192)]).
hole(r1, [xy(535,190),xy(537,190),xy(535,190)]).
hole(r1, [xy(536,188),xy(538,188),xy(536,188)]).
hole(r1, [xy(537,185),xy(539,186),xy(537,185)]).
hole(r1, [xy(538,183),xy(540,184),xy(538,183)]).
hole(r1, [xy(539,180),xy(541,181),xy(539,180)]).
hole(r1, [xy(540,178),xy(542,179),xy(540,178)]).
hole(r1, [xy(541,176),xy(543,176),xy(541,176)]).
hole(r1, [xy(542,173),xy(544,173),xy(542,173)]).
hole(r1, [xy(543,170),xy(545,170),xy(543,170)]).
hole(r1, [xy(544,166),xy(546,167),xy(544,166)]).
hole(r1, [xy(545,163),xy(547,163),xy(545,163)]).
hole(r1, [xy(531,134),xy(533,134),xy(531,134)]).
hole(r1, [xy(532,133),xy(534,133),xy(532,133)]).
hole(r1, [xy(533,132),xy(535,132),xy(533,132)]).
hole(r1, [xy(534,131),xy(536,131),xy(534,131)]).
hole(r1, [xy(316,51),xy(318,51),xy(316,51)]).
hole(r1, [xy(473,31),xy(475,31),xy(473,31)]).
hole(r1, [xy(537,8),xy(539,8),xy(537,8)]).
hole(r1, [xy(529,6),xy(531,6),xy(529,6)]).
midline(r1, [xy(158,141),xy(129,112),xy(114,114),xy(114,127),xy(90,151),xy(77,176),xy(77,182),xy(69,193),xy(64,209),xy(60,213),xy(44,282),xy(44,318),xy(70,344),xy(84,344),xy(85,343),xy(85,337),xy(88,328),xy(90,329),xy(88,331),xy(89,332),xy(87,334),xy(88,335),xy(86,337),xy(87,337),xy(87,339)]).
midline(r1, [xy(69,196),xy(137,264),xy(179,310),xy(177,311),xy(67,200)]).
midline(r1, [xy(56,231),xy(112,285),xy(150,324),xy(148,326),xy(141,326),xy(109,296),xy(54,241)]).
midline(r1, [xy(104,289),xy(109,289),xy(110,290),xy(111,295)]).
midline(r1, [xy(53,247),xy(103,295),xy(103,298),xy(105,300),xy(104,301),xy(103,301),xy(102,300),xy(97,301),xy(51,256)]).
midline(r1, [xy(105,301),xy(135,329),xy(132,332),xy(126,332),xy(104,310),xy(98,307),xy(93,309),xy(50,266),xy(48,267)]).
midline(r1, [xy(134,331),xy(141,327)]).
midline(r1, [xy(134,267),xy(133,265)]).
midline(r1, [xy(86,160),xy(170,242),xy(170,246),xy(171,247),xy(171,248),xy(173,247),xy(172,244)]).
midline(r1, [xy(47,274),xy(92,317),xy(92,320),xy(94,319),xy(93,316),xy(95,316),xy(95,317),xy(94,318),xy(97,318),xy(117,338),xy(111,342),xy(94,325),xy(91,323),xy(88,323),xy(46,281)]).
midline(r1, [xy(92,325),xy(90,325)]).
midline(r1, [xy(78,176),xy(80,174),xy(155,249),xy(154,251),xy(155,255),xy(154,256),xy(152,254),xy(151,254),xy(148,256),xy(77,183),xy(73,187)]).
midline(r1, [xy(155,256),xy(157,254),xy(156,250),xy(159,252),xy(157,255)]).
midline(r1, [xy(180,308),xy(181,304),xy(138,262),xy(139,259),xy(72,192),xy(70,193)]).
midline(r1, [xy(179,311),xy(175,315),xy(128,269),xy(128,266),xy(65,205)]).
midline(r1, [xy(177,315),xy(210,348),xy(227,347),xy(228,350),xy(256,350),xy(298,306),xy(285,293),xy(270,293),xy(268,291),xy(256,290),xy(219,291),xy(214,286),xy(210,289),xy(205,289),xy(168,252),xy(165,248),xy(165,245),xy(85,166),xy(81,169)]).
midline(r1, [xy(205,290),xy(183,291),xy(153,262),xy(151,255),xy(151,256),xy(148,258),xy(147,257),xy(143,258),xy(143,259),xy(144,260),xy(145,259),xy(145,258),xy(145,260)]).
midline(r1, [xy(147,259),xy(147,258)]).
midline(r1, [xy(248,292),xy(247,296),xy(248,296),xy(249,295),xy(248,294),xy(249,294)]).
midline(r1, [xy(213,287),xy(211,289)]).
midline(r1, [xy(162,269),xy(161,251),xy(162,244)]).
midline(r1, [xy(114,342),xy(125,332)]).
midline(r1, [xy(108,294),xy(108,293),xy(106,292)]).
midline(r1, [xy(122,113),xy(231,224),xy(231,238),xy(225,234),xy(224,226),xy(219,221),xy(180,194),xy(114,128),xy(91,151)]).
midline(r1, [xy(189,201),xy(189,239),xy(190,240),xy(189,261),xy(174,250),xy(173,248),xy(175,247),xy(175,240),xy(90,155),xy(88,156)]).
midline(r1, [xy(196,206),xy(196,264),xy(190,261)]).
midline(r1, [xy(218,222),xy(218,273),xy(215,276),xy(214,219)]).
midline(r1, [xy(196,265),xy(199,266),xy(199,208)]).
midline(r1, [xy(231,239),xy(240,247),xy(240,250),xy(219,271),xy(239,252)]).
midline(r1, [xy(186,199),xy(186,240),xy(187,241),xy(187,258)]).
midline(r1, [xy(218,274),xy(216,276)]).
midline(r1, [xy(214,276),xy(213,278),xy(199,267)]).
midline(r1, [xy(214,278),xy(214,285)]).
midline(r1, [xy(159,142),xy(237,220),xy(237,224),xy(239,226),xy(240,225),xy(239,222)]).
midline(r1, [xy(240,226),xy(250,236),xy(246,239),xy(235,228)]).
midline(r1, [xy(206,213),xy(206,271)]).
midline(r1, [xy(256,289),xy(255,265),xy(257,265),xy(257,267)]).
midline(r1, [xy(108,296),xy(104,295)]).
midline(r1, [xy(57,226),xy(59,224),xy(115,280),xy(114,282),xy(117,278),xy(119,279),xy(115,283),xy(118,281),xy(156,320),xy(149,326)]).
midline(r1, [xy(184,256),xy(184,242),xy(183,241),xy(183,197)]).
midline(r1, [xy(168,250),xy(167,246)]).
midline(r1, [xy(247,239),xy(241,246),xy(245,243)]).
midline(r1, [xy(203,211),xy(203,269)]).
midline(r1, [xy(193,262),xy(193,239),xy(192,238),xy(192,203)]).
midline(r1, [xy(210,216),xy(210,274)]).
midline(r1, [xy(181,254),xy(181,243),xy(180,242),xy(180,195)]).
midline(r1, [xy(258,265),xy(257,259),xy(259,259),xy(259,261)]).
midline(r1, [xy(61,213),xy(64,210),xy(124,270),xy(122,274),xy(126,270),xy(127,271),xy(123,275),xy(127,272)]).
midline(r1, [xy(127,274),xy(169,316),xy(165,320),xy(157,321),xy(154,324)]).
midline(r1, [xy(167,319),xy(170,316),xy(174,316)]).
midline(r1, [xy(178,252),xy(178,244),xy(176,242),xy(177,242)]).
midline(r1, [xy(298,308),xy(316,307),xy(322,300),xy(264,242)]).
midline(r1, [xy(322,302),xy(328,300),xy(332,294),xy(274,236),xy(251,236),xy(258,244),xy(262,244)]).
midline(r1, [xy(274,235),xy(267,230),xy(265,231),xy(265,232),xy(266,233),xy(267,232),xy(267,231)]).
midline(r1, [xy(332,296),xy(345,292),xy(274,221),xy(273,110),xy(129,111)]).
midline(r1, [xy(256,111),xy(256,214),xy(253,223),xy(253,234)]).
midline(r1, [xy(255,221),xy(263,228),xy(268,226),xy(269,227),xy(267,229)]).
midline(r1, [xy(257,214),xy(264,221),xy(265,221),xy(266,219)]).
midline(r1, [xy(274,110),xy(317,109),xy(316,50),xy(318,50),xy(318,52)]).
midline(r1, [xy(317,110),xy(387,110),xy(389,112),xy(349,152),xy(349,222),xy(319,223),xy(313,218),xy(314,216),xy(312,215),xy(310,213),xy(310,211),xy(312,211),xy(311,213),xy(313,213),xy(314,215)]).
midline(r1, [xy(350,152),xy(390,112),xy(411,111),xy(473,175),xy(473,222),xy(457,239),xy(457,255),xy(455,256),xy(425,226),xy(423,226),xy(423,228),xy(427,229)]).
midline(r1, [xy(457,256),xy(456,262),xy(424,295),xy(353,295),xy(349,291),xy(345,293)]).
midline(r1, [xy(433,286),xy(455,264)]).
midline(r1, [xy(459,237),xy(473,223),xy(492,242),xy(513,242),xy(513,227),xy(521,215),xy(522,214),xy(524,215),xy(516,228)]).
midline(r1, [xy(519,223),xy(520,222)]).
midline(r1, [xy(522,219),xy(521,220)]).
midline(r1, [xy(426,293),xy(430,289)]).
midline(r1, [xy(432,288),xy(469,287),xy(469,289),xy(470,289),xy(471,288),xy(470,286),xy(472,286),xy(471,289)]).
midline(r1, [xy(349,290),xy(349,246),xy(333,244),xy(331,244),xy(331,246),xy(333,246)]).
midline(r1, [xy(349,245),xy(349,223)]).
midline(r1, [xy(523,217),xy(524,216)]).
midline(r1, [xy(517,226),xy(518,225)]).
midline(r1, [xy(514,242),xy(525,242),xy(527,244),xy(453,319),xy(448,319),xy(425,295),xy(463,294),xy(463,296),xy(464,296),xy(465,295),xy(464,294),xy(465,294)]).
midline(r1, [xy(435,305),xy(455,304),xy(455,306),xy(456,306),xy(457,305),xy(456,304),xy(457,304)]).
midline(r1, [xy(498,275),xy(498,276),xy(454,319),xy(466,320),xy(495,291),xy(495,281),xy(497,281),xy(497,283)]).
midline(r1, [xy(467,321),xy(470,324),xy(474,324),xy(473,333),xy(474,333),xy(475,332),xy(474,331),xy(475,331)]).
midline(r1, [xy(475,324),xy(480,323),xy(481,326),xy(486,326),xy(518,294)]).
midline(r1, [xy(430,300),xy(459,299),xy(459,301),xy(460,301),xy(461,300),xy(460,299),xy(461,299)]).
midline(r1, [xy(378,296),xy(376,300),xy(391,315),xy(392,315),xy(393,314),xy(378,298),xy(393,313)]).
midline(r1, [xy(487,327),xy(499,326),xy(501,330),xy(523,330),xy(543,310)]).
midline(r1, [xy(524,331),xy(529,336),xy(532,336),xy(558,310)]).
midline(r1, [xy(533,337),xy(540,336),xy(541,339),xy(546,338),xy(546,340),xy(554,339),xy(557,344),xy(592,344),xy(594,341),xy(581,329)]).
midline(r1, [xy(583,332),xy(586,335)]).
midline(r1, [xy(594,343),xy(601,341),xy(622,320),xy(596,295),xy(573,318),xy(572,317),xy(571,317),xy(570,318),xy(572,321),xy(555,338),xy(573,321),xy(574,323),xy(576,323),xy(578,321),xy(578,322),xy(600,300)]).
midline(r1, [xy(596,294),xy(595,289),xy(585,287),xy(582,284),xy(560,307),xy(582,285)]).
midline(r1, [xy(596,296),xy(572,318)]).
midline(r1, [xy(623,319),xy(636,319),xy(635,324),xy(636,324),xy(637,323),xy(636,322),xy(637,322)]).
midline(r1, [xy(637,319),xy(655,319),xy(656,317),xy(639,300),xy(634,287),xy(627,280),xy(627,279),xy(629,279),xy(630,282)]).
midline(r1, [xy(641,301),xy(639,294),xy(638,293),xy(637,293),xy(638,292),xy(637,291),xy(636,291),xy(637,290),xy(636,289),xy(635,289),xy(636,287)]).
midline(r1, [xy(639,295),xy(640,296)]).
midline(r1, [xy(656,319),xy(671,317),xy(738,250),xy(739,160),xy(730,152),xy(621,261),xy(617,260),xy(618,264),xy(615,269),xy(596,288),xy(615,270)]).
midline(r1, [xy(623,260),xy(730,153)]).
midline(r1, [xy(627,281),xy(628,282)]).
midline(r1, [xy(640,298),xy(641,299)]).
midline(r1, [xy(544,308),xy(544,303),xy(535,298)]).
midline(r1, [xy(731,151),xy(731,141),xy(729,140),xy(616,253),xy(611,251),xy(610,254),xy(607,254),xy(606,255),xy(605,255),xy(580,280),xy(574,279),xy(568,274),xy(547,295),xy(546,301),xy(537,297)]).
midline(r1, [xy(605,257),xy(612,257),xy(612,253),xy(612,254),xy(613,253),xy(614,255)]).
midline(r1, [xy(729,141),xy(618,252)]).
midline(r1, [xy(568,275),xy(548,295)]).
midline(r1, [xy(543,300),xy(545,301),xy(546,304),xy(548,303),xy(547,301),xy(548,305),xy(549,305),xy(550,303),xy(550,306),xy(551,306),xy(552,304),xy(553,308),xy(555,307),xy(554,305),xy(555,306)]).
midline(r1, [xy(730,139),xy(730,129),xy(728,127),xy(606,247),xy(606,249),xy(608,249)]).
midline(r1, [xy(728,126),xy(727,124),xy(670,124),xy(629,83),xy(460,83),xy(454,89),xy(443,93),xy(425,105),xy(416,106),xy(412,111),xy(416,107)]).
midline(r1, [xy(530,81),xy(529,5),xy(531,5),xy(531,7)]).
midline(r1, [xy(443,94),xy(441,97),xy(535,191),xy(536,191),xy(537,190),xy(536,187),xy(538,187),xy(537,189),xy(540,189),xy(569,217),xy(568,226),xy(534,193),xy(531,193),xy(437,98)]).
midline(r1, [xy(728,128),xy(609,247)]).
midline(r1, [xy(547,84),xy(547,161),xy(545,162),xy(545,164),xy(546,164),xy(547,163),xy(547,162)]).
midline(r1, [xy(420,106),xy(525,212),xy(563,247),xy(562,251),xy(558,251),xy(556,249),xy(539,247),xy(536,244),xy(528,244),xy(501,271),xy(500,286),xy(496,290),xy(504,284)]).
midline(r1, [xy(564,246),xy(564,239),xy(532,207),xy(525,204),xy(426,105),xy(429,102)]).
midline(r1, [xy(535,84),xy(535,129),xy(531,133),xy(531,135),xy(532,135),xy(533,134),xy(532,133),xy(535,130),xy(536,131),xy(533,135)]).
midline(r1, [xy(536,132),xy(535,133)]).
midline(r1, [xy(447,92),xy(570,216),xy(574,212),xy(451,91)]).
midline(r1, [xy(538,182),xy(542,182)]).
midline(r1, [xy(575,213),xy(581,207),xy(548,174),xy(538,173),xy(455,90),xy(460,84)]).
midline(r1, [xy(535,195),xy(533,195)]).
midline(r1, [xy(474,81),xy(473,30),xy(475,30),xy(475,32)]).
midline(r1, [xy(568,227),xy(566,231),xy(532,197),xy(529,197),xy(433,100)]).
midline(r1, [xy(582,283),xy(581,280),xy(603,258)]).
midline(r1, [xy(538,81),xy(537,7),xy(539,7),xy(539,9)]).
midline(r1, [xy(617,266),xy(620,263),xy(619,261),xy(620,262)]).
midline(r1, [xy(567,232),xy(564,238),xy(566,237)]).
midline(r1, [xy(582,208),xy(587,207),xy(669,125)]).
midline(r1, [xy(533,199),xy(531,199)]).
midline(r1, [xy(569,273),xy(569,266),xy(565,263),xy(558,268),xy(559,271),xy(554,275),xy(554,277),xy(555,275),xy(557,275)]).
midline(r1, [xy(559,268),xy(560,270),xy(565,264)]).
midline(r1, [xy(559,272),xy(558,273)]).
midline(r1, [xy(566,262),xy(564,257),xy(530,293),xy(527,292),xy(529,297),xy(525,301),xy(524,300),xy(524,292),xy(525,291),xy(525,286),xy(523,285),xy(521,289),xy(519,288),xy(518,289),xy(519,292),xy(520,289)]).
midline(r1, [xy(564,256),xy(563,251),xy(586,250),xy(587,252),xy(588,250)]).
midline(r1, [xy(564,258),xy(533,289)]).
midline(r1, [xy(528,299),xy(526,301)]).
midline(r1, [xy(566,258),xy(570,257),xy(571,259),xy(572,257)]).
midline(r1, [xy(522,289),xy(522,291)]).
midline(r1, [xy(315,220),xy(316,224),xy(317,222)]).
midline(r1, [xy(183,292),xy(183,301),xy(181,303),xy(183,302)]).
midline(r1, [xy(446,315),xy(447,313),xy(449,313),xy(449,314),xy(447,316),xy(449,315)]).
midline(r1, [xy(487,316),xy(510,294),xy(512,283),xy(547,249)]).
midline(r1, [xy(237,326),xy(234,329),xy(234,339),xy(230,343),xy(228,339),xy(228,337),xy(230,337),xy(230,339)]).
midline(r1, [xy(229,343),xy(229,346)]).
midline(r1, [xy(234,340),xy(231,343)]).
midline(r1, [xy(529,205),xy(528,204),xy(526,207),xy(528,207),xy(528,209)]).
midline(r1, [xy(530,205),xy(530,204),xy(529,203),xy(528,203),xy(529,201),xy(530,201),xy(531,202),xy(530,203),xy(531,203)]).
midline(r1, [xy(575,321),xy(575,320)]).
midline(r1, [xy(526,284),xy(525,285)]).
midline(r1, [xy(318,227),xy(318,224),xy(320,225),xy(320,227)]).
midline(r1, [xy(514,287),xy(551,250)]).
midline(r1, [xy(516,286),xy(516,287),xy(511,291),xy(512,293)]).
midline(r1, [xy(513,291),xy(514,290)]).
midline(r1, [xy(98,345),xy(85,345)]).
midline(r1, [xy(99,345),xy(111,343)]).
midline(r1, [xy(586,297),xy(547,337),xy(547,338),xy(594,290)]).
midline(r1, [xy(578,298),xy(562,314),xy(561,313),xy(562,309),xy(584,287)]).
midline(r1, [xy(563,314),xy(564,314),xy(588,289)]).
midline(r1, [xy(561,314),xy(541,335),xy(561,316)]).
midline(r1, [xy(505,321),xy(504,322)]).
midline(r1, [xy(520,306),xy(519,307)]).
midline(r1, [xy(552,258),xy(551,259)]).
midline(r1, [xy(254,308),xy(269,293)]).
midline(r1, [xy(309,220),xy(286,219),xy(286,221),xy(288,221)]).
midline(r1, [xy(310,220),xy(313,220)]).
midline(r1, [xy(584,330),xy(583,328),xy(579,324),xy(583,327)]).
midline(r1, [xy(509,277),xy(508,279),xy(505,278),xy(503,279),xy(507,283),xy(508,283),xy(509,282),xy(507,280),xy(509,281)]).
midline(r1, [xy(531,295),xy(531,293),xy(533,294),xy(533,295),xy(531,296)]).
midline(r1, [xy(607,290),xy(604,290),xy(600,295),xy(604,291)]).
midline(r1, [xy(608,290),xy(608,289),xy(606,288)]).
midline(r1, [xy(102,303),xy(100,301),xy(99,304),xy(101,304),xy(101,308)]).
midline(r1, [xy(97,309),xy(94,311),xy(94,313),xy(97,314),xy(98,313),xy(96,311),xy(95,311)]).
midline(r1, [xy(140,261),xy(142,262)]).
midline(r1, [xy(131,269),xy(130,269),xy(129,268),xy(129,267),xy(130,267),xy(131,268)]).
midline(r1, [xy(515,272),xy(514,273)]).
midline(r1, [xy(588,334),xy(585,331),xy(588,333)]).
midline(r1, [xy(395,315),xy(393,315),xy(395,318),xy(397,317),xy(396,315),xy(397,316)]).
midline(r1, [xy(521,265),xy(539,248)]).
midline(r1, [xy(554,255),xy(558,252)]).
midline(r1, [xy(544,172),xy(543,169),xy(545,169),xy(545,171)]).
midline(r1, [xy(523,302),xy(524,301)]).
midline(r1, [xy(315,217),xy(315,218)]).
midline(r1, [xy(544,174),xy(542,173),xy(541,177),xy(542,177),xy(543,176),xy(542,175),xy(543,175)]).
midline(r1, [xy(99,310),xy(99,312)]).
midline(r1, [xy(163,249),xy(163,251)]).
midline(r1, [xy(225,229),xy(226,231)]).
fillpoint(r1, xy(708,145), 139.4).
fillpoint(r1, xy(702,144), 138.5).
fillpoint(r1, xy(709,148), 138.5).
fillpoint(r1, xy(698,143), 137.5).
fillpoint(r1, xy(693,142), 136.6).
fillpoint(r1, xy(688,141), 135.6).
fillpoint(r1, xy(712,154), 135.6).
fillpoint(r1, xy(684,140), 134.7).
fillpoint(r1, xy(713,159), 134.7).
fillpoint(r1, xy(679,139), 133.7).
fillpoint(r1, xy(675,138), 132.7).
fillpoint(r1, xy(716,168), 131.8).
fillpoint(r1, xy(717,173), 130.8).
fillpoint(r1, xy(718,177), 129.9).
fillpoint(r1, xy(719,182), 128.9).
fillpoint(r1, xy(131,131), 126.1).
fillpoint(r1, xy(722,191), 126.1).
fillpoint(r1, xy(135,130), 125.1).
fillpoint(r1, xy(723,195), 125.1).
fillpoint(r1, xy(140,129), 124.2).
fillpoint(r1, xy(144,128), 123.2).
fillpoint(r1, xy(149,127), 122.2).
fillpoint(r1, xy(726,202), 122.2).
fillpoint(r1, xy(154,126), 121.3).
fillpoint(r1, xy(727,206), 121.3).
fillpoint(r1, xy(158,125), 120.3).
fillpoint(r1, xy(728,211), 120.3).
fillpoint(r1, xy(163,124), 119.4).
fillpoint(r1, xy(729,215), 119.4).
fillpoint(r1, xy(168,123), 118.4).
fillpoint(r1, xy(730,220), 118.4).
fillpoint(r1, xy(173,122), 117.5).
fillpoint(r1, xy(731,224), 117.5).
fillpoint(r1, xy(178,121), 116.5).
fillpoint(r1, xy(732,229), 116.5).
fillpoint(r1, xy(183,120), 115.6).
fillpoint(r1, xy(733,234), 115.6).
fillpoint(r1, xy(189,119), 114.6).
fillpoint(r1, xy(734,238), 114.6).
fillpoint(r1, xy(196,118), 113.6).
fillpoint(r1, xy(735,243), 113.6).
fillpoint(r1, xy(203,117), 112.7).
fillpoint(r1, xy(211,116), 111.7).
fillpoint(r1, xy(219,115), 110.8).
fillpoint(r1, xy(405,117), 110.7).
fillpoint(r1, xy(226,114), 109.8).
fillpoint(r1, xy(391,129), 105.1).
fillpoint(r1, xy(384,132), 105.1).
fillpoint(r1, xy(393,128), 105.0).
fillpoint(r1, xy(386,131), 105.0).
fillpoint(r1, xy(389,130), 104.9).
fillpoint(r1, xy(382,133), 104.9).
fillpoint(r1, xy(424,118), 103.8).
fillpoint(r1, xy(426,119), 103.8).
fillpoint(r1, xy(428,120), 103.7).
fillpoint(r1, xy(247,123), 97.6).
fillpoint(r1, xy(250,124), 97.5).
fillpoint(r1, xy(267,125), 91.4).
fillpoint(r1, xy(269,126), 91.4).
fillpoint(r1, xy(272,127), 90.7).
fillpoint(r1, xy(278,128), 89.6).
fillpoint(r1, xy(280,129), 89.5).
fillpoint(r1, xy(289,130), 86.8).
fillpoint(r1, xy(313,131), 78.1).
fillpoint(r1, xy(315,132), 78.1).
fillpoint(r1, xy(587,76), 73.5).
fillpoint(r1, xy(582,75), 72.6).
fillpoint(r1, xy(577,74), 71.6).
fillpoint(r1, xy(573,73), 70.7).
fillpoint(r1, xy(568,72), 69.7).
fillpoint(r1, xy(563,71), 68.8).
fillpoint(r1, xy(559,70), 67.8).
fillpoint(r1, xy(69,230), 66.8).
fillpoint(r1, xy(523,70), 63.0).
fillpoint(r1, xy(64,244), 62.1).
fillpoint(r1, xy(311,300), 61.1).
fillpoint(r1, xy(531,69), 60.6).
fillpoint(r1, xy(516,76), 60.4).
fillpoint(r1, xy(493,86), 60.4).
fillpoint(r1, xy(514,77), 60.3).
fillpoint(r1, xy(509,79), 60.3).
fillpoint(r1, xy(507,80), 60.3).
fillpoint(r1, xy(502,82), 60.3).
fillpoint(r1, xy(500,83), 60.3).
fillpoint(r1, xy(495,85), 60.3).
fillpoint(r1, xy(511,78), 60.2).
fillpoint(r1, xy(505,81), 60.2).
fillpoint(r1, xy(498,84), 60.2).
fillpoint(r1, xy(491,87), 60.2).
fillpoint(r1, xy(61,254), 59.2).
fillpoint(r1, xy(59,261), 57.3).
fillpoint(r1, xy(178,305), 56.3).
fillpoint(r1, xy(57,268), 55.4).
fillpoint(r1, xy(56,272), 54.4).
fillpoint(r1, xy(183,299), 54.4).
fillpoint(r1, xy(55,277), 53.5).
fillpoint(r1, xy(54,281), 52.5).
fillpoint(r1, xy(165,309), 52.5).
fillpoint(r1, xy(53,286), 51.6).
fillpoint(r1, xy(194,292), 51.4).
fillpoint(r1, xy(191,293), 51.4).
fillpoint(r1, xy(52,290), 50.6).
fillpoint(r1, xy(51,295), 49.7).
fillpoint(r1, xy(50,300), 48.7).
fillpoint(r1, xy(381,250), 48.1).
fillpoint(r1, xy(49,304), 47.8).
fillpoint(r1, xy(48,309), 46.8).
fillpoint(r1, xy(375,232), 46.4).
fillpoint(r1, xy(378,239), 46.4).
fillpoint(r1, xy(373,227), 46.3).
fillpoint(r1, xy(374,230), 46.3).
fillpoint(r1, xy(376,234), 46.3).
fillpoint(r1, xy(377,237), 46.3).
fillpoint(r1, xy(379,241), 46.3).
fillpoint(r1, xy(380,244), 46.3).
fillpoint(r1, xy(420,274), 46.3).
fillpoint(r1, xy(47,314), 45.8).
fillpoint(r1, xy(470,236), 45.3).
fillpoint(r1, xy(415,271), 45.2).
fillpoint(r1, xy(412,269), 44.8).
fillpoint(r1, xy(391,259), 43.9).
fillpoint(r1, xy(393,260), 43.9).
fillpoint(r1, xy(398,262), 43.9).
fillpoint(r1, xy(400,263), 43.9).
fillpoint(r1, xy(405,265), 43.9).
fillpoint(r1, xy(407,266), 43.9).
fillpoint(r1, xy(396,261), 43.8).
fillpoint(r1, xy(402,264), 43.8).
fillpoint(r1, xy(409,267), 43.8).
fillpoint(r1, xy(431,269), 41.2).
fillpoint(r1, xy(461,246), 40.9).
fillpoint(r1, xy(460,249), 40.8).
fillpoint(r1, xy(298,265), 40.3).
fillpoint(r1, xy(437,265), 39.8).
fillpoint(r1, xy(439,264), 39.5).
fillpoint(r1, xy(298,259), 38.3).
fillpoint(r1, xy(297,257), 38.2).
fillpoint(r1, xy(452,256), 37.5).
fillpoint(r1, xy(445,259), 37.5).
fillpoint(r1, xy(450,257), 37.4).
fillpoint(r1, xy(447,258), 37.4).
fillpoint(r1, xy(517,327), 35.3).
fillpoint(r1, xy(355,272), 34.9).
border(r1).
region(r376, '#8d868c', 4, centroid(226,332)).
perimeter(r376, 8).

adjacent(r1, r376).
shared_edge(r1, r376, 8).

encloses(r1, r376).

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
opencv_component(cc1, [r376]).
opencv_component_area(cc1, 4).
opencv_component_centroid(cc1, centroid(226,332)).
opencv_morphology(r1, opening_area(310446), closing_area(313266), gradient_area(6289)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 6.0).
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
opencv_contour(r1, c9, hole, 7.0).
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
opencv_contour(r1, c20, hole, 5.5).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 4.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 2.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 4.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 2.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 2.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 2.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 4.0).
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
opencv_contour(r1, c39, hole, 2.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 4.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 4.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 7.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 2.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 4.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 2.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 2.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 4.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 2.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 4.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 2.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 4.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 2.0).
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
opencv_contour(r1, c70, hole, 4.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 2.0).
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
opencv_contour(r1, c77, hole, 4.0).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 2.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 2.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 2.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 2.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 4.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 4.0).
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
opencv_contour(r1, c89, hole, 4.0).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 2.0).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 2.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 2.0).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 4.0).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 2.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 4.0).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 4.0).
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
opencv_contour(r1, c103, hole, 4.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 2.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 2.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 2.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 7.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 4.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 2.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 7.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 7.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 2.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 2.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 2.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 2.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 2.0).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 2.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 2.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 2.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 2.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 2.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 2.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 4.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 4.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 2.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 2.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 11.5).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 5.5).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 2.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 6.0).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 2.0).
opencv_contour_hierarchy(r1, c131, next(c132), previous(c130), child(none), parent(c0)).
opencv_contour(r1, c132, hole, 2.0).
opencv_contour_hierarchy(r1, c132, next(c133), previous(c131), child(none), parent(c0)).
opencv_contour(r1, c133, hole, 2.0).
opencv_contour_hierarchy(r1, c133, next(c134), previous(c132), child(none), parent(c0)).
opencv_contour(r1, c134, hole, 2.0).
opencv_contour_hierarchy(r1, c134, next(c135), previous(c133), child(none), parent(c0)).
opencv_contour(r1, c135, hole, 4.0).
opencv_contour_hierarchy(r1, c135, next(c136), previous(c134), child(none), parent(c0)).
opencv_contour(r1, c136, hole, 2.0).
opencv_contour_hierarchy(r1, c136, next(c137), previous(c135), child(none), parent(c0)).
opencv_contour(r1, c137, hole, 2.0).
opencv_contour_hierarchy(r1, c137, next(c138), previous(c136), child(none), parent(c0)).
opencv_contour(r1, c138, hole, 2.0).
opencv_contour_hierarchy(r1, c138, next(c139), previous(c137), child(none), parent(c0)).
opencv_contour(r1, c139, hole, 2.0).
opencv_contour_hierarchy(r1, c139, next(c140), previous(c138), child(none), parent(c0)).
opencv_contour(r1, c140, hole, 4.0).
opencv_contour_hierarchy(r1, c140, next(c141), previous(c139), child(none), parent(c0)).
opencv_contour(r1, c141, hole, 2.0).
opencv_contour_hierarchy(r1, c141, next(c142), previous(c140), child(none), parent(c0)).
opencv_contour(r1, c142, hole, 2.0).
opencv_contour_hierarchy(r1, c142, next(c143), previous(c141), child(none), parent(c0)).
opencv_contour(r1, c143, hole, 4.0).
opencv_contour_hierarchy(r1, c143, next(c144), previous(c142), child(none), parent(c0)).
opencv_contour(r1, c144, hole, 2.0).
opencv_contour_hierarchy(r1, c144, next(c145), previous(c143), child(none), parent(c0)).
opencv_contour(r1, c145, hole, 2.0).
opencv_contour_hierarchy(r1, c145, next(c146), previous(c144), child(none), parent(c0)).
opencv_contour(r1, c146, hole, 4.0).
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
opencv_contour(r1, c153, hole, 10.0).
opencv_contour_hierarchy(r1, c153, next(c154), previous(c152), child(none), parent(c0)).
opencv_contour(r1, c154, hole, 2.0).
opencv_contour_hierarchy(r1, c154, next(c155), previous(c153), child(none), parent(c0)).
opencv_contour(r1, c155, hole, 2.0).
opencv_contour_hierarchy(r1, c155, next(c156), previous(c154), child(none), parent(c0)).
opencv_contour(r1, c156, hole, 2.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 2.0).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 4.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 2.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 2.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 4.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 4.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 2.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 4.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 2.0).
opencv_contour_hierarchy(r1, c165, next(c166), previous(c164), child(none), parent(c0)).
opencv_contour(r1, c166, hole, 4.0).
opencv_contour_hierarchy(r1, c166, next(c167), previous(c165), child(none), parent(c0)).
opencv_contour(r1, c167, hole, 2.0).
opencv_contour_hierarchy(r1, c167, next(c168), previous(c166), child(none), parent(c0)).
opencv_contour(r1, c168, hole, 19.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 4.0).
opencv_contour_hierarchy(r1, c169, next(c170), previous(c168), child(none), parent(c0)).
opencv_contour(r1, c170, hole, 4.0).
opencv_contour_hierarchy(r1, c170, next(c171), previous(c169), child(none), parent(c0)).
opencv_contour(r1, c171, hole, 2.0).
opencv_contour_hierarchy(r1, c171, next(c172), previous(c170), child(none), parent(c0)).
opencv_contour(r1, c172, hole, 4.0).
opencv_contour_hierarchy(r1, c172, next(c173), previous(c171), child(none), parent(c0)).
opencv_contour(r1, c173, hole, 6.0).
opencv_contour_hierarchy(r1, c173, next(c174), previous(c172), child(none), parent(c0)).
opencv_contour(r1, c174, hole, 4.0).
opencv_contour_hierarchy(r1, c174, next(c175), previous(c173), child(none), parent(c0)).
opencv_contour(r1, c175, hole, 2.0).
opencv_contour_hierarchy(r1, c175, next(c176), previous(c174), child(none), parent(c0)).
opencv_contour(r1, c176, hole, 4.0).
opencv_contour_hierarchy(r1, c176, next(c177), previous(c175), child(none), parent(c0)).
opencv_contour(r1, c177, hole, 4.0).
opencv_contour_hierarchy(r1, c177, next(c178), previous(c176), child(none), parent(c0)).
opencv_contour(r1, c178, hole, 6.0).
opencv_contour_hierarchy(r1, c178, next(c179), previous(c177), child(none), parent(c0)).
opencv_contour(r1, c179, hole, 2.0).
opencv_contour_hierarchy(r1, c179, next(c180), previous(c178), child(none), parent(c0)).
opencv_contour(r1, c180, hole, 6.0).
opencv_contour_hierarchy(r1, c180, next(c181), previous(c179), child(none), parent(c0)).
opencv_contour(r1, c181, hole, 6.0).
opencv_contour_hierarchy(r1, c181, next(c182), previous(c180), child(none), parent(c0)).
opencv_contour(r1, c182, hole, 6.0).
opencv_contour_hierarchy(r1, c182, next(c183), previous(c181), child(none), parent(c0)).
opencv_contour(r1, c183, hole, 6.0).
opencv_contour_hierarchy(r1, c183, next(c184), previous(c182), child(none), parent(c0)).
opencv_contour(r1, c184, hole, 6.0).
opencv_contour_hierarchy(r1, c184, next(c185), previous(c183), child(none), parent(c0)).
opencv_contour(r1, c185, hole, 4.0).
opencv_contour_hierarchy(r1, c185, next(c186), previous(c184), child(none), parent(c0)).
opencv_contour(r1, c186, hole, 4.0).
opencv_contour_hierarchy(r1, c186, next(c187), previous(c185), child(none), parent(c0)).
opencv_contour(r1, c187, hole, 4.0).
opencv_contour_hierarchy(r1, c187, next(c188), previous(c186), child(none), parent(c0)).
opencv_contour(r1, c188, hole, 4.0).
opencv_contour_hierarchy(r1, c188, next(c189), previous(c187), child(none), parent(c0)).
opencv_contour(r1, c189, hole, 6.0).
opencv_contour_hierarchy(r1, c189, next(c190), previous(c188), child(none), parent(c0)).
opencv_contour(r1, c190, hole, 6.0).
opencv_contour_hierarchy(r1, c190, next(c191), previous(c189), child(none), parent(c0)).
opencv_contour(r1, c191, hole, 4.0).
opencv_contour_hierarchy(r1, c191, next(c192), previous(c190), child(none), parent(c0)).
opencv_contour(r1, c192, hole, 2.0).
opencv_contour_hierarchy(r1, c192, next(c193), previous(c191), child(none), parent(c0)).
opencv_contour(r1, c193, hole, 6.0).
opencv_contour_hierarchy(r1, c193, next(c194), previous(c192), child(none), parent(c0)).
opencv_contour(r1, c194, hole, 4.0).
opencv_contour_hierarchy(r1, c194, next(c195), previous(c193), child(none), parent(c0)).
opencv_contour(r1, c195, hole, 2.0).
opencv_contour_hierarchy(r1, c195, next(c196), previous(c194), child(none), parent(c0)).
opencv_contour(r1, c196, hole, 4.0).
opencv_contour_hierarchy(r1, c196, next(c197), previous(c195), child(none), parent(c0)).
opencv_contour(r1, c197, hole, 2.0).
opencv_contour_hierarchy(r1, c197, next(c198), previous(c196), child(none), parent(c0)).
opencv_contour(r1, c198, hole, 2.0).
opencv_contour_hierarchy(r1, c198, next(c199), previous(c197), child(none), parent(c0)).
opencv_contour(r1, c199, hole, 4.0).
opencv_contour_hierarchy(r1, c199, next(c200), previous(c198), child(none), parent(c0)).
opencv_contour(r1, c200, hole, 2.0).
opencv_contour_hierarchy(r1, c200, next(c201), previous(c199), child(none), parent(c0)).
opencv_contour(r1, c201, hole, 2.0).
opencv_contour_hierarchy(r1, c201, next(c202), previous(c200), child(none), parent(c0)).
opencv_contour(r1, c202, hole, 2.0).
opencv_contour_hierarchy(r1, c202, next(c203), previous(c201), child(none), parent(c0)).
opencv_contour(r1, c203, hole, 2.0).
opencv_contour_hierarchy(r1, c203, next(c204), previous(c202), child(none), parent(c0)).
opencv_contour(r1, c204, hole, 4.0).
opencv_contour_hierarchy(r1, c204, next(c205), previous(c203), child(none), parent(c0)).
opencv_contour(r1, c205, hole, 2.0).
opencv_contour_hierarchy(r1, c205, next(c206), previous(c204), child(none), parent(c0)).
opencv_contour(r1, c206, hole, 2.0).
opencv_contour_hierarchy(r1, c206, next(c207), previous(c205), child(none), parent(c0)).
opencv_contour(r1, c207, hole, 7.0).
opencv_contour_hierarchy(r1, c207, next(c208), previous(c206), child(none), parent(c0)).
opencv_contour(r1, c208, hole, 2.0).
opencv_contour_hierarchy(r1, c208, next(c209), previous(c207), child(none), parent(c0)).
opencv_contour(r1, c209, hole, 4.0).
opencv_contour_hierarchy(r1, c209, next(c210), previous(c208), child(none), parent(c0)).
opencv_contour(r1, c210, hole, 2.0).
opencv_contour_hierarchy(r1, c210, next(c211), previous(c209), child(none), parent(c0)).
opencv_contour(r1, c211, hole, 6.0).
opencv_contour_hierarchy(r1, c211, next(c212), previous(c210), child(none), parent(c0)).
opencv_contour(r1, c212, hole, 2.0).
opencv_contour_hierarchy(r1, c212, next(c213), previous(c211), child(none), parent(c0)).
opencv_contour(r1, c213, hole, 24.5).
opencv_contour_hierarchy(r1, c213, next(c214), previous(c212), child(none), parent(c0)).
opencv_contour(r1, c214, hole, 2.0).
opencv_contour_hierarchy(r1, c214, next(c215), previous(c213), child(none), parent(c0)).
opencv_contour(r1, c215, hole, 2.0).
opencv_contour_hierarchy(r1, c215, next(c216), previous(c214), child(none), parent(c0)).
opencv_contour(r1, c216, hole, 4.0).
opencv_contour_hierarchy(r1, c216, next(c217), previous(c215), child(none), parent(c0)).
opencv_contour(r1, c217, hole, 2.0).
opencv_contour_hierarchy(r1, c217, next(c218), previous(c216), child(none), parent(c0)).
opencv_contour(r1, c218, hole, 2.0).
opencv_contour_hierarchy(r1, c218, next(c219), previous(c217), child(none), parent(c0)).
opencv_contour(r1, c219, hole, 2.0).
opencv_contour_hierarchy(r1, c219, next(c220), previous(c218), child(none), parent(c0)).
opencv_contour(r1, c220, hole, 2.0).
opencv_contour_hierarchy(r1, c220, next(c221), previous(c219), child(none), parent(c0)).
opencv_contour(r1, c221, hole, 2.0).
opencv_contour_hierarchy(r1, c221, next(c222), previous(c220), child(none), parent(c0)).
opencv_contour(r1, c222, hole, 2.0).
opencv_contour_hierarchy(r1, c222, next(c223), previous(c221), child(none), parent(c0)).
opencv_contour(r1, c223, hole, 2.0).
opencv_contour_hierarchy(r1, c223, next(c224), previous(c222), child(none), parent(c0)).
opencv_contour(r1, c224, hole, 2.0).
opencv_contour_hierarchy(r1, c224, next(c225), previous(c223), child(none), parent(c0)).
opencv_contour(r1, c225, hole, 4.0).
opencv_contour_hierarchy(r1, c225, next(c226), previous(c224), child(none), parent(c0)).
opencv_contour(r1, c226, hole, 2.0).
opencv_contour_hierarchy(r1, c226, next(c227), previous(c225), child(none), parent(c0)).
opencv_contour(r1, c227, hole, 2.0).
opencv_contour_hierarchy(r1, c227, next(c228), previous(c226), child(none), parent(c0)).
opencv_contour(r1, c228, hole, 4.0).
opencv_contour_hierarchy(r1, c228, next(c229), previous(c227), child(none), parent(c0)).
opencv_contour(r1, c229, hole, 2.0).
opencv_contour_hierarchy(r1, c229, next(c230), previous(c228), child(none), parent(c0)).
opencv_contour(r1, c230, hole, 2.0).
opencv_contour_hierarchy(r1, c230, next(c231), previous(c229), child(none), parent(c0)).
opencv_contour(r1, c231, hole, 2.0).
opencv_contour_hierarchy(r1, c231, next(c232), previous(c230), child(none), parent(c0)).
opencv_contour(r1, c232, hole, 2.0).
opencv_contour_hierarchy(r1, c232, next(c233), previous(c231), child(none), parent(c0)).
opencv_contour(r1, c233, hole, 4.0).
opencv_contour_hierarchy(r1, c233, next(c234), previous(c232), child(none), parent(c0)).
opencv_contour(r1, c234, hole, 2.0).
opencv_contour_hierarchy(r1, c234, next(c235), previous(c233), child(none), parent(c0)).
opencv_contour(r1, c235, hole, 4.0).
opencv_contour_hierarchy(r1, c235, next(c236), previous(c234), child(none), parent(c0)).
opencv_contour(r1, c236, hole, 2.0).
opencv_contour_hierarchy(r1, c236, next(c237), previous(c235), child(none), parent(c0)).
opencv_contour(r1, c237, hole, 4.0).
opencv_contour_hierarchy(r1, c237, next(c238), previous(c236), child(none), parent(c0)).
opencv_contour(r1, c238, hole, 2.0).
opencv_contour_hierarchy(r1, c238, next(c239), previous(c237), child(none), parent(c0)).
opencv_contour(r1, c239, hole, 2.0).
opencv_contour_hierarchy(r1, c239, next(c240), previous(c238), child(none), parent(c0)).
opencv_contour(r1, c240, hole, 4.0).
opencv_contour_hierarchy(r1, c240, next(c241), previous(c239), child(none), parent(c0)).
opencv_contour(r1, c241, hole, 4.0).
opencv_contour_hierarchy(r1, c241, next(c242), previous(c240), child(none), parent(c0)).
opencv_contour(r1, c242, hole, 4.0).
opencv_contour_hierarchy(r1, c242, next(c243), previous(c241), child(none), parent(c0)).
opencv_contour(r1, c243, hole, 4.0).
opencv_contour_hierarchy(r1, c243, next(c244), previous(c242), child(none), parent(c0)).
opencv_contour(r1, c244, hole, 2.0).
opencv_contour_hierarchy(r1, c244, next(c245), previous(c243), child(none), parent(c0)).
opencv_contour(r1, c245, hole, 2.0).
opencv_contour_hierarchy(r1, c245, next(c246), previous(c244), child(none), parent(c0)).
opencv_contour(r1, c246, hole, 2.0).
opencv_contour_hierarchy(r1, c246, next(c247), previous(c245), child(none), parent(c0)).
opencv_contour(r1, c247, hole, 4.0).
opencv_contour_hierarchy(r1, c247, next(c248), previous(c246), child(none), parent(c0)).
opencv_contour(r1, c248, hole, 2.0).
opencv_contour_hierarchy(r1, c248, next(c249), previous(c247), child(none), parent(c0)).
opencv_contour(r1, c249, hole, 2.0).
opencv_contour_hierarchy(r1, c249, next(c250), previous(c248), child(none), parent(c0)).
opencv_contour(r1, c250, hole, 2.0).
opencv_contour_hierarchy(r1, c250, next(c251), previous(c249), child(none), parent(c0)).
opencv_contour(r1, c251, hole, 2.0).
opencv_contour_hierarchy(r1, c251, next(c252), previous(c250), child(none), parent(c0)).
opencv_contour(r1, c252, hole, 2.0).
opencv_contour_hierarchy(r1, c252, next(c253), previous(c251), child(none), parent(c0)).
opencv_contour(r1, c253, hole, 2.0).
opencv_contour_hierarchy(r1, c253, next(c254), previous(c252), child(none), parent(c0)).
opencv_contour(r1, c254, hole, 2.0).
opencv_contour_hierarchy(r1, c254, next(c255), previous(c253), child(none), parent(c0)).
opencv_contour(r1, c255, hole, 2.0).
opencv_contour_hierarchy(r1, c255, next(c256), previous(c254), child(none), parent(c0)).
opencv_contour(r1, c256, hole, 2.0).
opencv_contour_hierarchy(r1, c256, next(none), previous(c255), child(none), parent(c0)).
opencv_watershed_count(r376, 1).
opencv_watershed_segment(r376, ws1, 4, centroid(226,332)).
