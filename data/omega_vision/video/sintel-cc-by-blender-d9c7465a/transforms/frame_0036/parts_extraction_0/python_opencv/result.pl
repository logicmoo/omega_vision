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

region(r1, '#726159', 310363, centroid(427,181)).
perimeter(r1, 3918).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(233,0),xy(232,3),xy(231,0),xy(0,0)]).
hole(r1, [xy(84,343),xy(86,343),xy(84,343)]).
hole(r1, [xy(85,339),xy(87,340),xy(85,339)]).
hole(r1, [xy(470,338),xy(472,339),xy(470,338)]).
hole(r1, [xy(86,335),xy(88,336),xy(86,335)]).
hole(r1, [xy(585,333),xy(587,333),xy(585,333)]).
hole(r1, [xy(87,333),xy(89,333),xy(87,333)]).
hole(r1, [xy(583,330),xy(585,330),xy(583,330)]).
hole(r1, [xy(88,330),xy(90,330),xy(88,330)]).
hole(r1, [xy(582,329),xy(584,329),xy(582,329)]).
hole(r1, [xy(581,328),xy(583,328),xy(581,328)]).
hole(r1, [xy(580,327),xy(582,327),xy(580,327)]).
hole(r1, [xy(89,327),xy(91,328),xy(89,327)]).
hole(r1, [xy(579,326),xy(581,326),xy(579,326)]).
hole(r1, [xy(578,325),xy(580,325),xy(578,325)]).
hole(r1, [xy(90,325),xy(92,325),xy(90,325)]).
hole(r1, [xy(576,323),xy(578,322),xy(579,324),xy(576,323)]).
hole(r1, [xy(575,322),xy(577,322),xy(575,322)]).
hole(r1, [xy(91,322),xy(93,323),xy(91,322)]).
hole(r1, [xy(635,321),xy(637,321),xy(635,321)]).
hole(r1, [xy(574,321),xy(576,321),xy(574,321)]).
hole(r1, [xy(92,320),xy(94,320),xy(92,320)]).
hole(r1, [xy(571,319),xy(575,320),xy(571,319)]).
hole(r1, [xy(396,319),xy(398,319),xy(396,319)]).
hole(r1, [xy(570,318),xy(572,318),xy(570,318)]).
hole(r1, [xy(93,318),xy(95,319),xy(93,318)]).
hole(r1, [xy(569,317),xy(571,317),xy(569,317)]).
hole(r1, [xy(393,317),xy(395,317),xy(393,317)]).
hole(r1, [xy(568,316),xy(570,316),xy(568,316)]).
hole(r1, [xy(392,316),xy(394,316),xy(392,316)]).
hole(r1, [xy(94,316),xy(96,317),xy(94,316)]).
hole(r1, [xy(391,315),xy(393,315),xy(391,315)]).
hole(r1, [xy(565,314),xy(569,315),xy(565,314)]).
hole(r1, [xy(390,314),xy(392,314),xy(390,314)]).
hole(r1, [xy(95,314),xy(97,314),xy(95,314)]).
hole(r1, [xy(563,313),xy(566,313),xy(563,313)]).
hole(r1, [xy(389,313),xy(391,313),xy(389,313)]).
hole(r1, [xy(562,312),xy(564,312),xy(562,312)]).
hole(r1, [xy(388,312),xy(390,312),xy(388,312)]).
hole(r1, [xy(96,312),xy(98,312),xy(96,312)]).
hole(r1, [xy(387,311),xy(389,311),xy(387,311)]).
hole(r1, [xy(559,310),xy(563,311),xy(559,310)]).
hole(r1, [xy(386,310),xy(388,310),xy(386,310)]).
hole(r1, [xy(97,310),xy(99,310),xy(97,310)]).
hole(r1, [xy(557,309),xy(560,309),xy(557,309)]).
hole(r1, [xy(385,309),xy(387,309),xy(385,309)]).
hole(r1, [xy(630,308),xy(632,308),xy(630,308)]).
hole(r1, [xy(556,308),xy(558,308),xy(556,308)]).
hole(r1, [xy(454,308),xy(456,308),xy(454,308)]).
hole(r1, [xy(384,308),xy(386,308),xy(384,308)]).
hole(r1, [xy(98,308),xy(100,308),xy(98,308)]).
hole(r1, [xy(554,307),xy(557,307),xy(554,307)]).
hole(r1, [xy(383,307),xy(385,307),xy(383,307)]).
hole(r1, [xy(553,306),xy(555,306),xy(553,306)]).
hole(r1, [xy(382,306),xy(384,306),xy(382,306)]).
hole(r1, [xy(99,306),xy(101,307),xy(99,306)]).
hole(r1, [xy(381,305),xy(383,305),xy(381,305)]).
hole(r1, [xy(549,304),xy(551,304),xy(549,304)]).
hole(r1, [xy(380,304),xy(382,304),xy(380,304)]).
hole(r1, [xy(100,304),xy(102,305),xy(100,304)]).
hole(r1, [xy(547,303),xy(549,303),xy(547,303)]).
hole(r1, [xy(458,303),xy(460,303),xy(458,303)]).
hole(r1, [xy(379,303),xy(381,303),xy(379,303)]).
hole(r1, [xy(545,302),xy(548,302),xy(545,302)]).
hole(r1, [xy(378,302),xy(380,302),xy(378,302)]).
hole(r1, [xy(245,302),xy(247,302),xy(245,302)]).
hole(r1, [xy(543,301),xy(546,301),xy(543,301)]).
hole(r1, [xy(377,301),xy(379,301),xy(377,301)]).
hole(r1, [xy(103,300),xy(102,304),xy(103,300)]).
hole(r1, [xy(542,300),xy(544,300),xy(542,300)]).
hole(r1, [xy(376,300),xy(378,300),xy(376,300)]).
hole(r1, [xy(539,299),xy(542,299),xy(539,299)]).
hole(r1, [xy(375,299),xy(377,299),xy(375,299)]).
hole(r1, [xy(103,299),xy(105,300),xy(103,299)]).
hole(r1, [xy(638,298),xy(640,298),xy(638,298)]).
hole(r1, [xy(538,298),xy(540,298),xy(538,298)]).
hole(r1, [xy(462,298),xy(464,298),xy(462,298)]).
hole(r1, [xy(535,297),xy(538,297),xy(535,297)]).
hole(r1, [xy(463,297),xy(465,297),xy(463,297)]).
hole(r1, [xy(247,296),xy(247,300),xy(247,296)]).
hole(r1, [xy(534,296),xy(536,296),xy(534,296)]).
hole(r1, [xy(106,295),xy(105,299),xy(106,295)]).
hole(r1, [xy(637,295),xy(639,295),xy(637,295)]).
hole(r1, [xy(532,295),xy(534,295),xy(532,295)]).
hole(r1, [xy(247,295),xy(249,295),xy(247,295)]).
hole(r1, [xy(530,294),xy(532,294),xy(530,294)]).
hole(r1, [xy(106,294),xy(108,295),xy(106,294)]).
hole(r1, [xy(527,293),xy(530,293),xy(527,293)]).
hole(r1, [xy(107,293),xy(109,293),xy(107,293)]).
hole(r1, [xy(636,292),xy(638,292),xy(636,292)]).
hole(r1, [xy(525,292),xy(528,292),xy(525,292)]).
hole(r1, [xy(510,292),xy(512,292),xy(510,292)]).
hole(r1, [xy(467,292),xy(469,292),xy(467,292)]).
hole(r1, [xy(523,291),xy(526,291),xy(523,291)]).
hole(r1, [xy(468,291),xy(470,291),xy(468,291)]).
hole(r1, [xy(108,291),xy(110,292),xy(108,291)]).
hole(r1, [xy(635,290),xy(637,290),xy(635,290)]).
hole(r1, [xy(521,290),xy(523,290),xy(521,290)]).
hole(r1, [xy(109,290),xy(111,290),xy(109,290)]).
hole(r1, [xy(519,289),xy(521,289),xy(519,289)]).
hole(r1, [xy(110,289),xy(112,289),xy(110,289)]).
hole(r1, [xy(634,288),xy(636,288),xy(634,288)]).
hole(r1, [xy(614,288),xy(616,288),xy(614,288)]).
hole(r1, [xy(605,288),xy(607,289),xy(605,288)]).
hole(r1, [xy(517,288),xy(519,288),xy(517,288)]).
hole(r1, [xy(249,288),xy(251,289),xy(249,288)]).
hole(r1, [xy(515,287),xy(517,287),xy(515,287)]).
hole(r1, [xy(472,287),xy(474,287),xy(472,287)]).
hole(r1, [xy(111,287),xy(113,288),xy(111,287)]).
hole(r1, [xy(633,286),xy(635,286),xy(633,286)]).
hole(r1, [xy(512,286),xy(515,286),xy(512,286)]).
hole(r1, [xy(112,286),xy(114,286),xy(112,286)]).
hole(r1, [xy(632,285),xy(634,285),xy(632,285)]).
hole(r1, [xy(510,285),xy(513,285),xy(510,285)]).
hole(r1, [xy(631,284),xy(633,284),xy(631,284)]).
hole(r1, [xy(606,284),xy(608,284),xy(606,284)]).
hole(r1, [xy(630,283),xy(632,283),xy(630,283)]).
hole(r1, [xy(629,282),xy(631,282),xy(629,282)]).
hole(r1, [xy(507,282),xy(509,282),xy(507,282)]).
hole(r1, [xy(251,282),xy(253,282),xy(251,282)]).
hole(r1, [xy(116,281),xy(117,283),xy(114,286),xy(113,284),xy(116,281)]).
hole(r1, [xy(506,281),xy(508,281),xy(506,281)]).
hole(r1, [xy(116,281),xy(118,281),xy(116,281)]).
hole(r1, [xy(505,280),xy(507,280),xy(505,280)]).
hole(r1, [xy(117,280),xy(119,280),xy(117,280)]).
hole(r1, [xy(504,279),xy(506,279),xy(504,279)]).
hole(r1, [xy(118,279),xy(120,279),xy(118,279)]).
hole(r1, [xy(626,278),xy(628,278),xy(626,278)]).
hole(r1, [xy(501,278),xy(504,278),xy(501,278)]).
hole(r1, [xy(119,278),xy(121,278),xy(119,278)]).
hole(r1, [xy(625,277),xy(627,277),xy(625,277)]).
hole(r1, [xy(497,277),xy(500,277),xy(497,277)]).
hole(r1, [xy(120,277),xy(122,277),xy(120,277)]).
hole(r1, [xy(624,276),xy(626,276),xy(624,276)]).
hole(r1, [xy(496,276),xy(498,276),xy(496,276)]).
hole(r1, [xy(121,276),xy(123,276),xy(121,276)]).
hole(r1, [xy(495,275),xy(497,275),xy(495,275)]).
hole(r1, [xy(122,275),xy(124,275),xy(122,275)]).
hole(r1, [xy(554,274),xy(556,274),xy(554,274)]).
hole(r1, [xy(493,274),xy(496,274),xy(493,274)]).
hole(r1, [xy(491,274),xy(493,274),xy(491,274)]).
hole(r1, [xy(621,272),xy(623,272),xy(621,272)]).
hole(r1, [xy(484,272),xy(486,272),xy(484,272)]).
hole(r1, [xy(127,271),xy(124,275),xy(127,271)]).
hole(r1, [xy(620,271),xy(622,271),xy(620,271)]).
hole(r1, [xy(556,271),xy(558,271),xy(556,271)]).
hole(r1, [xy(127,271),xy(129,271),xy(127,271)]).
hole(r1, [xy(619,269),xy(621,270),xy(619,269)]).
hole(r1, [xy(557,269),xy(559,269),xy(557,269)]).
hole(r1, [xy(131,268),xy(129,271),xy(131,268)]).
hole(r1, [xy(558,268),xy(560,268),xy(558,268)]).
hole(r1, [xy(131,268),xy(133,268),xy(131,268)]).
hole(r1, [xy(559,266),xy(561,266),xy(559,266)]).
hole(r1, [xy(255,266),xy(257,266),xy(255,266)]).
hole(r1, [xy(135,265),xy(133,268),xy(135,265)]).
hole(r1, [xy(560,265),xy(562,265),xy(560,265)]).
hole(r1, [xy(135,265),xy(138,265),xy(135,265)]).
hole(r1, [xy(608,263),xy(608,281),xy(608,263)]).
hole(r1, [xy(561,264),xy(563,264),xy(561,264)]).
hole(r1, [xy(137,264),xy(139,264),xy(137,264)]).
hole(r1, [xy(615,262),xy(617,263),xy(616,281),xy(614,280),xy(615,262)]).
hole(r1, [xy(562,263),xy(564,263),xy(562,263)]).
hole(r1, [xy(138,263),xy(141,263),xy(138,263)]).
hole(r1, [xy(256,262),xy(258,262),xy(256,262)]).
hole(r1, [xy(140,262),xy(143,262),xy(140,262)]).
hole(r1, [xy(142,261),xy(144,261),xy(142,261)]).
hole(r1, [xy(144,260),xy(146,260),xy(144,260)]).
hole(r1, [xy(567,259),xy(569,259),xy(567,259)]).
hole(r1, [xy(146,259),xy(148,259),xy(146,259)]).
hole(r1, [xy(616,257),xy(619,261),xy(618,263),xy(615,261),xy(616,257)]).
hole(r1, [xy(147,258),xy(150,258),xy(147,258)]).
hole(r1, [xy(149,257),xy(152,257),xy(149,257)]).
hole(r1, [xy(614,256),xy(616,256),xy(614,256)]).
hole(r1, [xy(606,256),xy(608,256),xy(606,256)]).
hole(r1, [xy(151,256),xy(154,256),xy(151,256)]).
hole(r1, [xy(613,255),xy(615,255),xy(613,255)]).
hole(r1, [xy(153,255),xy(156,255),xy(153,255)]).
hole(r1, [xy(612,254),xy(614,254),xy(612,254)]).
hole(r1, [xy(155,254),xy(158,254),xy(155,254)]).
hole(r1, [xy(605,253),xy(607,254),xy(605,253)]).
hole(r1, [xy(157,253),xy(160,253),xy(157,253)]).
hole(r1, [xy(611,252),xy(613,252),xy(611,252)]).
hole(r1, [xy(159,252),xy(162,252),xy(159,252)]).
hole(r1, [xy(161,251),xy(164,251),xy(161,251)]).
hole(r1, [xy(610,250),xy(612,250),xy(610,250)]).
hole(r1, [xy(585,250),xy(587,250),xy(585,250)]).
hole(r1, [xy(609,249),xy(611,249),xy(609,249)]).
hole(r1, [xy(602,249),xy(604,248),xy(606,252),xy(602,249)]).
hole(r1, [xy(260,248),xy(259,256),xy(258,251),xy(260,248)]).
hole(r1, [xy(163,250),xy(169,249),xy(163,250)]).
hole(r1, [xy(608,248),xy(610,248),xy(608,248)]).
hole(r1, [xy(599,248),xy(603,248),xy(599,248)]).
hole(r1, [xy(168,248),xy(171,248),xy(168,248)]).
hole(r1, [xy(606,247),xy(608,247),xy(606,247)]).
hole(r1, [xy(170,247),xy(174,247),xy(170,247)]).
hole(r1, [xy(173,246),xy(176,246),xy(173,246)]).
hole(r1, [xy(175,245),xy(179,245),xy(175,245)]).
hole(r1, [xy(178,244),xy(181,244),xy(178,244)]).
hole(r1, [xy(262,242),xy(262,246),xy(262,242)]).
hole(r1, [xy(180,243),xy(184,243),xy(180,243)]).
hole(r1, [xy(184,242),xy(187,242),xy(184,242)]).
hole(r1, [xy(187,241),xy(190,241),xy(187,241)]).
hole(r1, [xy(262,240),xy(264,241),xy(262,240)]).
hole(r1, [xy(190,240),xy(193,240),xy(190,240)]).
hole(r1, [xy(192,239),xy(196,239),xy(192,239)]).
hole(r1, [xy(196,238),xy(199,238),xy(196,238)]).
hole(r1, [xy(200,237),xy(202,237),xy(200,237)]).
hole(r1, [xy(263,236),xy(265,237),xy(263,236)]).
hole(r1, [xy(203,236),xy(206,236),xy(203,236)]).
hole(r1, [xy(206,235),xy(209,235),xy(206,235)]).
hole(r1, [xy(292,234),xy(294,234),xy(292,234)]).
hole(r1, [xy(210,234),xy(213,234),xy(210,234)]).
hole(r1, [xy(264,233),xy(266,233),xy(264,233)]).
hole(r1, [xy(214,233),xy(217,233),xy(214,233)]).
hole(r1, [xy(218,232),xy(221,232),xy(218,232)]).
hole(r1, [xy(265,231),xy(267,231),xy(265,231)]).
hole(r1, [xy(222,231),xy(224,231),xy(222,231)]).
hole(r1, [xy(226,230),xy(229,230),xy(226,230)]).
hole(r1, [xy(514,229),xy(516,229),xy(514,229)]).
hole(r1, [xy(268,229),xy(270,229),xy(268,229)]).
hole(r1, [xy(229,229),xy(234,228),xy(232,230),xy(229,229)]).
hole(r1, [xy(515,227),xy(517,227),xy(515,227)]).
hole(r1, [xy(427,227),xy(429,227),xy(427,227)]).
hole(r1, [xy(233,227),xy(236,227),xy(233,227)]).
hole(r1, [xy(516,226),xy(518,226),xy(516,226)]).
hole(r1, [xy(425,226),xy(427,226),xy(425,226)]).
hole(r1, [xy(267,226),xy(269,226),xy(267,226)]).
hole(r1, [xy(235,226),xy(237,226),xy(235,226)]).
hole(r1, [xy(422,225),xy(425,225),xy(422,225)]).
hole(r1, [xy(236,225),xy(239,225),xy(236,225)]).
hole(r1, [xy(517,224),xy(519,224),xy(517,224)]).
hole(r1, [xy(238,224),xy(241,224),xy(238,224)]).
hole(r1, [xy(518,223),xy(520,223),xy(518,223)]).
hole(r1, [xy(317,223),xy(319,223),xy(317,223)]).
hole(r1, [xy(241,223),xy(243,223),xy(241,223)]).
hole(r1, [xy(271,221),xy(273,224),xy(270,226),xy(269,223),xy(271,221)]).
hole(r1, [xy(519,221),xy(521,221),xy(519,221)]).
hole(r1, [xy(520,220),xy(522,220),xy(520,220)]).
hole(r1, [xy(315,220),xy(317,220),xy(315,220)]).
hole(r1, [xy(521,218),xy(523,218),xy(521,218)]).
hole(r1, [xy(314,218),xy(316,218),xy(314,218)]).
hole(r1, [xy(522,216),xy(524,217),xy(522,216)]).
hole(r1, [xy(523,215),xy(525,215),xy(523,215)]).
hole(r1, [xy(524,213),xy(526,214),xy(524,213)]).
hole(r1, [xy(525,212),xy(527,212),xy(525,212)]).
hole(r1, [xy(526,210),xy(528,211),xy(526,210)]).
hole(r1, [xy(527,208),xy(529,208),xy(527,208)]).
hole(r1, [xy(528,206),xy(530,207),xy(528,206)]).
hole(r1, [xy(529,204),xy(531,205),xy(529,204)]).
hole(r1, [xy(530,203),xy(532,203),xy(530,203)]).
hole(r1, [xy(531,200),xy(533,201),xy(531,200)]).
hole(r1, [xy(532,199),xy(534,199),xy(532,199)]).
hole(r1, [xy(533,196),xy(535,197),xy(533,196)]).
hole(r1, [xy(534,195),xy(536,195),xy(534,195)]).
hole(r1, [xy(535,192),xy(537,193),xy(535,192)]).
hole(r1, [xy(536,190),xy(538,191),xy(536,190)]).
hole(r1, [xy(537,188),xy(539,189),xy(537,188)]).
hole(r1, [xy(538,186),xy(540,187),xy(538,186)]).
hole(r1, [xy(539,184),xy(541,185),xy(539,184)]).
hole(r1, [xy(541,180),xy(541,184),xy(541,180)]).
hole(r1, [xy(542,177),xy(542,181),xy(542,177)]).
hole(r1, [xy(542,176),xy(544,177),xy(542,176)]).
hole(r1, [xy(543,173),xy(545,174),xy(543,173)]).
hole(r1, [xy(544,170),xy(546,171),xy(544,170)]).
hole(r1, [xy(545,167),xy(547,168),xy(545,167)]).
hole(r1, [xy(546,164),xy(548,164),xy(546,164)]).
hole(r1, [xy(535,132),xy(537,132),xy(535,132)]).
hole(r1, [xy(536,131),xy(538,131),xy(536,131)]).
hole(r1, [xy(319,50),xy(321,50),xy(319,50)]).
hole(r1, [xy(480,23),xy(482,24),xy(480,23)]).
hole(r1, [xy(536,11),xy(538,11),xy(536,11)]).
hole(r1, [xy(485,6),xy(487,6),xy(485,6)]).
midline(r1, [xy(131,267),xy(66,201),xy(62,209),xy(62,219),xy(57,224),xy(56,235),xy(50,251),xy(50,266),xy(45,277),xy(43,291),xy(43,320),xy(61,339),xy(97,337),xy(92,332),xy(85,331),xy(44,291)]).
midline(r1, [xy(46,282),xy(90,326),xy(91,326),xy(92,324)]).
midline(r1, [xy(58,224),xy(62,220),xy(119,277),xy(116,281),xy(123,274),xy(124,275),xy(117,282),xy(124,276)]).
midline(r1, [xy(53,243),xy(55,242),xy(104,291),xy(105,295),xy(106,295),xy(107,296),xy(109,295),xy(105,291)]).
midline(r1, [xy(107,292),xy(109,293),xy(109,296)]).
midline(r1, [xy(88,329),xy(90,329),xy(90,330)]).
midline(r1, [xy(47,275),xy(92,317),xy(92,321),xy(93,319)]).
midline(r1, [xy(94,321),xy(98,320),xy(96,318),xy(93,317)]).
midline(r1, [xy(98,321),xy(116,339),xy(112,343),xy(92,326)]).
midline(r1, [xy(114,342),xy(124,334),xy(102,312),xy(100,312),xy(97,310),xy(95,315),xy(96,315),xy(97,314),xy(96,313),xy(97,311)]).
midline(r1, [xy(97,338),xy(104,345),xy(97,352),xy(73,351),xy(62,340)]).
midline(r1, [xy(84,350),xy(84,342),xy(86,342),xy(86,344)]).
midline(r1, [xy(99,351),xy(110,343)]).
midline(r1, [xy(49,268),xy(51,267),xy(92,308),xy(97,309),xy(99,303),xy(101,303),xy(103,305),xy(102,306),xy(99,305)]).
midline(r1, [xy(103,306),xy(129,333),xy(124,335)]).
midline(r1, [xy(52,249),xy(102,300),xy(104,301),xy(106,300),xy(104,298),xy(103,298)]).
midline(r1, [xy(106,301),xy(135,330),xy(129,334)]).
midline(r1, [xy(98,313),xy(99,312)]).
midline(r1, [xy(134,333),xy(140,330),xy(142,326),xy(111,295)]).
midline(r1, [xy(142,328),xy(147,324),xy(115,292),xy(108,288),xy(56,236)]).
midline(r1, [xy(107,285),xy(113,285),xy(114,286),xy(115,291)]).
midline(r1, [xy(112,291),xy(110,291),xy(109,290),xy(110,288),xy(112,289)]).
midline(r1, [xy(99,307),xy(98,309),xy(100,309)]).
midline(r1, [xy(122,280),xy(160,318),xy(155,324),xy(148,324)]).
midline(r1, [xy(157,323),xy(161,319),xy(170,319),xy(173,316),xy(128,272),xy(64,207)]).
midline(r1, [xy(128,270),xy(129,271)]).
midline(r1, [xy(173,318),xy(179,315),xy(133,268)]).
midline(r1, [xy(179,316),xy(184,315),xy(186,312),xy(139,267)]).
midline(r1, [xy(186,313),xy(193,311),xy(193,303),xy(154,264),xy(154,259),xy(150,255),xy(149,255),xy(149,257),xy(150,258),xy(149,260),xy(147,258),xy(140,260),xy(140,262),xy(141,263),xy(140,265),xy(70,195),xy(66,200)]).
midline(r1, [xy(69,196),xy(68,197)]).
midline(r1, [xy(148,260),xy(146,259),xy(146,260),xy(143,262),xy(142,260)]).
midline(r1, [xy(70,194),xy(74,189),xy(75,182),xy(82,175),xy(83,164),xy(91,150),xy(97,145),xy(97,140),xy(101,137),xy(102,132),xy(112,123),xy(115,114),xy(118,116),xy(129,113),xy(254,112),xy(254,220),xy(251,223),xy(241,222),xy(241,224),xy(243,224)]).
midline(r1, [xy(92,154),xy(178,240),xy(178,244),xy(179,245),xy(179,246),xy(181,245),xy(180,242)]).
midline(r1, [xy(75,189),xy(142,258)]).
midline(r1, [xy(98,146),xy(184,232),xy(184,249),xy(181,246)]).
midline(r1, [xy(185,232),xy(187,234),xy(187,251),xy(184,250)]).
midline(r1, [xy(86,162),xy(168,244),xy(168,248),xy(169,249),xy(169,250),xy(171,249),xy(170,246)]).
midline(r1, [xy(171,250),xy(207,286),xy(207,289),xy(194,303),xy(206,291)]).
midline(r1, [xy(208,286),xy(209,283),xy(176,250),xy(173,246),xy(173,242),xy(89,158)]).
midline(r1, [xy(113,122),xy(206,214),xy(206,242),xy(200,237),xy(201,234),xy(102,136)]).
midline(r1, [xy(206,243),xy(210,245),xy(210,217),xy(207,214)]).
midline(r1, [xy(211,217),xy(214,220),xy(214,248),xy(210,246)]).
midline(r1, [xy(176,248),xy(175,244)]).
midline(r1, [xy(255,112),xy(342,112),xy(343,110),xy(320,87),xy(319,49),xy(321,49),xy(321,51)]).
midline(r1, [xy(343,112),xy(369,111),xy(467,12),xy(485,11),xy(485,5),xy(487,5),xy(487,7)]).
midline(r1, [xy(370,112),xy(376,120),xy(348,148),xy(348,221),xy(318,222),xy(316,221),xy(314,219),xy(314,217),xy(316,217),xy(315,219),xy(317,219),xy(317,220)]).
midline(r1, [xy(188,234),xy(190,236),xy(190,253),xy(187,252)]).
midline(r1, [xy(127,116),xy(234,223),xy(233,227),xy(235,229),xy(237,228),xy(234,225),xy(236,225),xy(238,227),xy(237,229)]).
midline(r1, [xy(239,227),xy(239,225),xy(238,223),xy(130,115)]).
midline(r1, [xy(239,229),xy(246,236),xy(246,241),xy(239,248),xy(224,234),xy(222,231),xy(223,227),xy(215,220)]).
midline(r1, [xy(245,243),xy(230,260),xy(226,260),xy(214,249)]).
midline(r1, [xy(218,224),xy(218,251)]).
midline(r1, [xy(224,232),xy(224,230)]).
midline(r1, [xy(150,260),xy(152,259)]).
midline(r1, [xy(82,176),xy(155,248),xy(155,252),xy(151,255)]).
midline(r1, [xy(153,254),xy(154,258),xy(156,256),xy(155,253),xy(157,251),xy(157,253),xy(158,255),xy(156,257)]).
midline(r1, [xy(158,256),xy(160,254),xy(160,253),xy(158,251),xy(159,250),xy(161,249),xy(161,251),xy(162,252),xy(160,255)]).
midline(r1, [xy(162,254),xy(164,252),xy(163,249)]).
midline(r1, [xy(349,148),xy(376,121),xy(380,124),xy(424,123),xy(474,175),xy(474,223),xy(460,237),xy(460,254),xy(458,256),xy(427,225),xy(425,225),xy(425,227),xy(429,228)]).
midline(r1, [xy(459,256),xy(458,262),xy(438,282),xy(413,282),xy(401,294),xy(354,294),xy(348,288),xy(341,294),xy(331,294),xy(279,242),xy(255,242),xy(250,236),xy(247,236)]).
midline(r1, [xy(448,273),xy(439,282),xy(450,293),xy(464,293),xy(467,291),xy(467,293),xy(468,293),xy(469,292),xy(468,291),xy(469,288),xy(472,286),xy(474,286),xy(474,287),xy(472,288)]).
midline(r1, [xy(255,243),xy(262,247),xy(319,304),xy(315,308),xy(304,309),xy(267,272),xy(242,272),xy(231,261),xy(239,252)]).
midline(r1, [xy(279,241),xy(277,239),xy(254,239)]).
midline(r1, [xy(453,295),xy(455,297),xy(454,309),xy(455,309),xy(456,307)]).
midline(r1, [xy(456,298),xy(459,300),xy(458,304),xy(460,299),xy(463,296),xy(465,297),xy(463,299),xy(462,299)]).
midline(r1, [xy(460,302),xy(468,308),xy(481,308),xy(500,289),xy(501,273),xy(499,272),xy(494,276),xy(491,274),xy(491,273),xy(493,273),xy(493,274)]).
midline(r1, [xy(491,275),xy(465,299)]).
midline(r1, [xy(467,299),xy(489,277)]).
midline(r1, [xy(377,295),xy(375,300),xy(393,318),xy(395,317),xy(377,298),xy(395,316)]).
midline(r1, [xy(277,238),xy(268,229),xy(262,229),xy(254,221),xy(251,224),xy(251,235)]).
midline(r1, [xy(270,230),xy(270,229),xy(267,226),xy(267,225),xy(269,225),xy(269,227),xy(267,227)]).
midline(r1, [xy(482,309),xy(485,312),xy(498,311),xy(498,318),xy(504,325),xy(504,330),xy(483,351),xy(458,351),xy(402,295),xy(413,283)]).
midline(r1, [xy(265,230),xy(264,234),xy(265,232),xy(267,232)]).
midline(r1, [xy(469,293),xy(470,290)]).
midline(r1, [xy(252,273),xy(251,283),xy(252,283),xy(253,282),xy(252,281),xy(253,281)]).
midline(r1, [xy(317,307),xy(331,295)]).
midline(r1, [xy(499,273),xy(496,276),xy(495,276),xy(497,277),xy(498,275)]).
midline(r1, [xy(458,263),xy(451,270)]).
midline(r1, [xy(347,289),xy(342,294)]).
midline(r1, [xy(119,117),xy(229,227),xy(229,237)]).
midline(r1, [xy(256,270),xy(255,267),xy(256,261),xy(258,261),xy(258,263)]).
midline(r1, [xy(257,265),xy(257,267)]).
midline(r1, [xy(348,222),xy(347,234),xy(292,233),xy(292,235),xy(294,235)]).
midline(r1, [xy(348,234),xy(348,287)]).
midline(r1, [xy(202,238),xy(202,236)]).
midline(r1, [xy(484,351),xy(508,329),xy(508,331),xy(513,330),xy(513,332),xy(525,331),xy(527,335),xy(539,336),xy(542,339),xy(549,338),xy(551,342),xy(556,342),xy(573,325),xy(574,321),xy(576,320),xy(574,324)]).
midline(r1, [xy(576,323),xy(577,322),xy(577,319),xy(590,306),xy(586,300),xy(568,316),xy(569,318),xy(550,337),xy(571,319),xy(572,318),xy(570,316),xy(586,301)]).
midline(r1, [xy(587,299),xy(586,294),xy(583,292),xy(562,312),xy(540,336),xy(564,312)]).
midline(r1, [xy(566,311),xy(566,313),xy(543,336),xy(565,315)]).
midline(r1, [xy(583,293),xy(567,309)]).
midline(r1, [xy(584,291),xy(580,285),xy(556,308),xy(532,334),xy(558,308)]).
midline(r1, [xy(580,286),xy(561,305)]).
midline(r1, [xy(560,307),xy(560,309),xy(535,334),xy(559,311)]).
midline(r1, [xy(581,284),xy(570,272),xy(545,299),xy(542,299),xy(514,330),xy(544,300)]).
midline(r1, [xy(570,273),xy(547,296)]).
midline(r1, [xy(571,271),xy(568,267),xy(509,328),xy(509,329),xy(540,298),xy(540,297)]).
midline(r1, [xy(569,266),xy(565,261),xy(562,262),xy(557,268),xy(555,273),xy(552,273),xy(533,294),xy(530,293),xy(530,295),xy(531,295),xy(532,294),xy(531,298),xy(505,325),xy(531,299)]).
midline(r1, [xy(564,262),xy(563,264),xy(562,263),xy(560,265),xy(561,266),xy(558,268),xy(559,269),xy(558,271),xy(556,274),xy(555,275),xy(554,274),xy(554,275)]).
midline(r1, [xy(564,264),xy(559,270)]).
midline(r1, [xy(541,295),xy(568,268)]).
midline(r1, [xy(546,299),xy(545,304),xy(548,304),xy(548,308),xy(526,331),xy(547,310)]).
midline(r1, [xy(557,343),xy(592,344),xy(594,341),xy(583,331)]).
midline(r1, [xy(594,343),xy(601,341),xy(615,326),xy(595,306),xy(590,307)]).
midline(r1, [xy(615,327),xy(637,326),xy(635,321),xy(637,320),xy(637,322)]).
midline(r1, [xy(638,326),xy(645,325),xy(647,321),xy(634,308),xy(630,307),xy(630,309),xy(632,309)]).
midline(r1, [xy(647,323),xy(659,321),xy(664,314),xy(645,295),xy(640,295),xy(635,291),xy(629,283),xy(630,280),xy(623,273),xy(618,271),xy(619,265),xy(616,262),xy(612,262),xy(606,256),xy(606,255),xy(608,255),xy(610,257),xy(612,254),xy(610,252),xy(602,253),xy(584,272)]).
midline(r1, [xy(602,254),xy(587,269)]).
midline(r1, [xy(619,267),xy(736,152),xy(735,140),xy(727,133),xy(612,248),xy(606,246),xy(606,248),xy(608,247),xy(608,249),xy(611,252),xy(612,250),xy(610,248)]).
midline(r1, [xy(621,273),xy(620,272)]).
midline(r1, [xy(636,293),xy(638,299),xy(639,299),xy(640,298),xy(639,297),xy(639,295),xy(638,294)]).
midline(r1, [xy(728,132),xy(727,124),xy(671,124),xy(631,84),xy(566,84),xy(493,11),xy(486,11)]).
midline(r1, [xy(613,251),xy(613,252),xy(612,253),xy(614,253),xy(614,254),xy(613,255),xy(612,255),xy(614,257),xy(615,257),xy(616,256),xy(615,254),xy(616,255)]).
midline(r1, [xy(586,271),xy(591,270),xy(603,284),xy(606,283),xy(607,285),xy(608,283),xy(608,285)]).
midline(r1, [xy(626,275),xy(628,277)]).
midline(r1, [xy(611,262),xy(610,284),xy(614,289),xy(615,289),xy(616,287)]).
midline(r1, [xy(665,315),xy(670,314),xy(736,248)]).
midline(r1, [xy(737,246),xy(737,153)]).
midline(r1, [xy(727,134),xy(614,247)]).
midline(r1, [xy(190,254),xy(193,255),xy(193,240),xy(191,238),xy(192,238)]).
midline(r1, [xy(193,256),xy(196,257),xy(196,231)]).
midline(r1, [xy(196,258),xy(211,273),xy(211,280),xy(209,282),xy(211,281)]).
midline(r1, [xy(537,54),xy(536,10),xy(538,10),xy(538,12)]).
midline(r1, [xy(450,272),xy(484,271),xy(485,273),xy(486,271)]).
midline(r1, [xy(632,306),xy(616,289)]).
midline(r1, [xy(536,290),xy(552,274)]).
midline(r1, [xy(461,237),xy(474,224),xy(493,243),xy(524,244),xy(526,246),xy(501,272),xy(527,246),xy(534,246),xy(538,250),xy(512,276),xy(508,279),xy(504,278),xy(506,283),xy(501,288),xy(505,285)]).
midline(r1, [xy(511,277),xy(508,280),xy(506,279)]).
midline(r1, [xy(194,311),xy(214,331),xy(244,331),xy(245,301),xy(247,301),xy(247,303)]).
midline(r1, [xy(245,331),xy(280,331),xy(284,326),xy(252,294),xy(245,293),xy(220,268),xy(216,268),xy(212,273),xy(216,269)]).
midline(r1, [xy(284,327),xy(288,326),xy(304,310)]).
midline(r1, [xy(247,294),xy(247,296),xy(249,296)]).
midline(r1, [xy(606,257),xy(606,259),xy(601,260),xy(592,270),xy(601,261)]).
midline(r1, [xy(624,275),xy(624,277),xy(626,279),xy(628,279)]).
midline(r1, [xy(317,222),xy(317,224),xy(319,224)]).
midline(r1, [xy(515,149),xy(468,102),xy(463,102),xy(456,109),xy(450,109),xy(437,118),xy(426,122)]).
midline(r1, [xy(516,150),xy(535,170),xy(536,169),xy(623,169),xy(621,172),xy(537,172),xy(536,171)]).
midline(r1, [xy(450,110),xy(534,195),xy(536,194),xy(535,196),xy(538,196),xy(567,224),xy(566,229),xy(536,200),xy(533,198),xy(531,198),xy(446,112)]).
midline(r1, [xy(568,223),xy(568,214),xy(543,189),xy(539,188),xy(537,186),xy(533,186),xy(457,109),xy(463,103)]).
midline(r1, [xy(566,230),xy(566,233),xy(563,235),xy(537,209),xy(530,209),xy(527,206),xy(525,206),xy(438,118),xy(442,114)]).
midline(r1, [xy(527,205),xy(529,205),xy(530,206),xy(532,205),xy(529,202),xy(523,202)]).
midline(r1, [xy(530,202),xy(532,202),xy(532,206)]).
midline(r1, [xy(527,207),xy(527,209),xy(529,209)]).
midline(r1, [xy(565,235),xy(562,248),xy(526,213),xy(433,119)]).
midline(r1, [xy(529,180),xy(541,180),xy(542,181),xy(607,181),xy(574,214),xy(569,214)]).
midline(r1, [xy(608,181),xy(611,180),xy(610,178),xy(543,178),xy(537,173)]).
midline(r1, [xy(541,175),xy(615,175),xy(611,178)]).
midline(r1, [xy(614,178),xy(615,177)]).
midline(r1, [xy(563,248),xy(561,251),xy(522,214),xy(429,121)]).
midline(r1, [xy(525,216),xy(523,215)]).
midline(r1, [xy(537,208),xy(534,205)]).
midline(r1, [xy(525,211),xy(526,211),xy(527,212)]).
midline(r1, [xy(534,200),xy(532,199)]).
midline(r1, [xy(616,175),xy(619,173)]).
midline(r1, [xy(622,172),xy(623,171)]).
midline(r1, [xy(624,169),xy(670,125)]).
midline(r1, [xy(575,214),xy(601,188)]).
midline(r1, [xy(607,183),xy(603,187),xy(603,248),xy(576,275),xy(602,250)]).
midline(r1, [xy(554,262),xy(526,290),xy(525,292),xy(525,295),xy(501,319),xy(525,296)]).
midline(r1, [xy(528,290),xy(527,294)]).
midline(r1, [xy(529,288),xy(561,256),xy(561,252),xy(552,253),xy(549,250),xy(539,250),xy(513,276),xy(513,285),xy(510,291),xy(510,299),xy(499,311),xy(517,294),xy(518,290),xy(515,287),xy(515,286),xy(519,287),xy(519,288),xy(518,289),xy(520,290),xy(521,289),xy(521,283),xy(551,253)]).
midline(r1, [xy(562,252),xy(563,250),xy(585,249),xy(585,251),xy(586,251),xy(587,250),xy(586,249),xy(587,249)]).
midline(r1, [xy(521,288),xy(521,291),xy(522,291),xy(523,290),xy(523,289)]).
midline(r1, [xy(562,255),xy(565,257),xy(565,260),xy(569,258)]).
midline(r1, [xy(512,291),xy(512,293)]).
midline(r1, [xy(521,219),xy(515,226),xy(514,231),xy(504,241),xy(514,232)]).
midline(r1, [xy(520,220),xy(521,221),xy(518,223),xy(519,224),xy(518,225),xy(517,225),xy(516,226),xy(517,227),xy(515,228),xy(516,230)]).
midline(r1, [xy(517,228),xy(522,221),xy(521,217),xy(522,217),xy(523,218),xy(523,219)]).
midline(r1, [xy(556,297),xy(552,303),xy(548,302),xy(549,303),xy(549,305),xy(552,304),xy(553,307),xy(554,307),xy(555,306),xy(554,305),xy(555,305)]).
midline(r1, [xy(554,300),xy(575,278)]).
midline(r1, [xy(539,185),xy(538,185)]).
midline(r1, [xy(538,183),xy(540,183),xy(542,184),xy(540,186),xy(542,186)]).
midline(r1, [xy(548,126),xy(547,96),xy(473,96),xy(469,101),xy(473,97)]).
midline(r1, [xy(537,97),xy(537,129),xy(535,131),xy(535,133),xy(536,133),xy(537,132),xy(536,131),xy(538,130),xy(537,133)]).
midline(r1, [xy(548,127),xy(548,162),xy(546,163),xy(546,165),xy(547,165),xy(548,163)]).
midline(r1, [xy(548,96),xy(554,96),xy(565,84)]).
midline(r1, [xy(634,285),xy(631,281),xy(635,286),xy(634,287),xy(630,283)]).
midline(r1, [xy(534,296),xy(534,294),xy(536,295),xy(536,296),xy(535,297),xy(534,297)]).
midline(r1, [xy(582,326),xy(587,333)]).
midline(r1, [xy(538,190),xy(536,188),xy(535,191),xy(536,191),xy(537,192),xy(541,189)]).
midline(r1, [xy(536,187),xy(537,187)]).
midline(r1, [xy(88,332),xy(88,331)]).
midline(r1, [xy(509,281),xy(508,281),xy(507,282),xy(507,283),xy(509,283)]).
midline(r1, [xy(638,291),xy(636,289),xy(635,289),xy(636,287)]).
midline(r1, [xy(636,291),xy(637,291),xy(638,292)]).
midline(r1, [xy(622,270),xy(623,272)]).
midline(r1, [xy(226,261),xy(223,265)]).
midline(r1, [xy(396,319),xy(398,318),xy(398,319),xy(396,320)]).
fillpoint(r1, xy(708,145), 139.3).
fillpoint(r1, xy(705,144), 138.5).
fillpoint(r1, xy(700,143), 137.5).
fillpoint(r1, xy(695,142), 136.6).
fillpoint(r1, xy(691,141), 135.6).
fillpoint(r1, xy(712,154), 135.6).
fillpoint(r1, xy(686,140), 134.7).
fillpoint(r1, xy(682,139), 133.7).
fillpoint(r1, xy(714,161), 133.7).
fillpoint(r1, xy(677,138), 132.7).
fillpoint(r1, xy(715,164), 132.7).
fillpoint(r1, xy(716,168), 131.8).
fillpoint(r1, xy(717,173), 130.8).
fillpoint(r1, xy(718,178), 129.9).
fillpoint(r1, xy(721,188), 127.0).
fillpoint(r1, xy(133,131), 126.1).
fillpoint(r1, xy(138,130), 125.1).
fillpoint(r1, xy(142,129), 124.2).
fillpoint(r1, xy(147,128), 123.2).
fillpoint(r1, xy(725,198), 123.2).
fillpoint(r1, xy(152,127), 122.2).
fillpoint(r1, xy(726,202), 122.2).
fillpoint(r1, xy(156,126), 121.3).
fillpoint(r1, xy(727,206), 121.3).
fillpoint(r1, xy(161,125), 120.3).
fillpoint(r1, xy(728,211), 120.3).
fillpoint(r1, xy(166,124), 119.4).
fillpoint(r1, xy(729,215), 119.4).
fillpoint(r1, xy(171,123), 118.4).
fillpoint(r1, xy(730,220), 118.4).
fillpoint(r1, xy(176,122), 117.5).
fillpoint(r1, xy(731,225), 117.5).
fillpoint(r1, xy(181,121), 116.5).
fillpoint(r1, xy(732,229), 116.5).
fillpoint(r1, xy(187,120), 115.6).
fillpoint(r1, xy(733,234), 115.6).
fillpoint(r1, xy(193,119), 114.6).
fillpoint(r1, xy(734,238), 114.6).
fillpoint(r1, xy(200,118), 113.6).
fillpoint(r1, xy(735,243), 113.6).
fillpoint(r1, xy(207,117), 112.7).
fillpoint(r1, xy(215,116), 111.7).
fillpoint(r1, xy(222,115), 110.8).
fillpoint(r1, xy(409,115), 110.8).
fillpoint(r1, xy(413,114), 109.8).
fillpoint(r1, xy(418,113), 108.9).
fillpoint(r1, xy(423,112), 107.9).
fillpoint(r1, xy(426,113), 107.8).
fillpoint(r1, xy(428,114), 107.7).
fillpoint(r1, xy(430,115), 107.5).
fillpoint(r1, xy(233,114), 107.4).
fillpoint(r1, xy(235,113), 107.2).
fillpoint(r1, xy(391,129), 104.9).
fillpoint(r1, xy(389,130), 104.8).
fillpoint(r1, xy(384,132), 104.8).
fillpoint(r1, xy(382,133), 104.8).
fillpoint(r1, xy(377,135), 104.8).
fillpoint(r1, xy(393,128), 104.7).
fillpoint(r1, xy(386,131), 104.7).
fillpoint(r1, xy(380,134), 104.7).
fillpoint(r1, xy(250,123), 98.7).
fillpoint(r1, xy(252,124), 98.7).
fillpoint(r1, xy(254,125), 98.6).
fillpoint(r1, xy(277,128), 92.3).
fillpoint(r1, xy(284,131), 92.3).
fillpoint(r1, xy(275,127), 92.2).
fillpoint(r1, xy(286,132), 92.2).
fillpoint(r1, xy(272,126), 92.1).
fillpoint(r1, xy(279,129), 92.1).
fillpoint(r1, xy(282,130), 92.1).
fillpoint(r1, xy(288,133), 92.0).
fillpoint(r1, xy(318,134), 81.0).
fillpoint(r1, xy(589,76), 73.5).
fillpoint(r1, xy(584,75), 72.6).
fillpoint(r1, xy(579,74), 71.6).
fillpoint(r1, xy(575,73), 70.7).
fillpoint(r1, xy(570,72), 69.7).
fillpoint(r1, xy(565,71), 68.8).
fillpoint(r1, xy(66,239), 64.0).
fillpoint(r1, xy(65,242), 63.0).
fillpoint(r1, xy(524,71), 62.7).
fillpoint(r1, xy(517,74), 62.7).
fillpoint(r1, xy(501,81), 62.7).
fillpoint(r1, xy(494,84), 62.7).
fillpoint(r1, xy(522,72), 62.6).
fillpoint(r1, xy(515,75), 62.6).
fillpoint(r1, xy(510,77), 62.6).
fillpoint(r1, xy(508,78), 62.6).
fillpoint(r1, xy(503,80), 62.6).
fillpoint(r1, xy(496,83), 62.6).
fillpoint(r1, xy(492,85), 62.6).
fillpoint(r1, xy(519,73), 62.5).
fillpoint(r1, xy(512,76), 62.5).
fillpoint(r1, xy(506,79), 62.5).
fillpoint(r1, xy(499,82), 62.5).
fillpoint(r1, xy(313,294), 62.2).
fillpoint(r1, xy(314,292), 62.1).
fillpoint(r1, xy(315,290), 62.0).
fillpoint(r1, xy(312,297), 61.9).
fillpoint(r1, xy(63,249), 61.1).
fillpoint(r1, xy(312,300), 61.1).
fillpoint(r1, xy(62,252), 60.2).
fillpoint(r1, xy(61,255), 59.2).
fillpoint(r1, xy(60,259), 58.3).
fillpoint(r1, xy(186,303), 57.7).
fillpoint(r1, xy(59,262), 57.3).
fillpoint(r1, xy(370,241), 57.1).
fillpoint(r1, xy(58,266), 56.3).
fillpoint(r1, xy(180,305), 56.3).
fillpoint(r1, xy(57,270), 55.4).
fillpoint(r1, xy(56,274), 54.4).
fillpoint(r1, xy(55,278), 53.5).
fillpoint(r1, xy(54,283), 52.5).
fillpoint(r1, xy(167,309), 52.5).
fillpoint(r1, xy(53,287), 51.6).
fillpoint(r1, xy(52,292), 50.6).
fillpoint(r1, xy(51,296), 49.7).
fillpoint(r1, xy(50,301), 48.7).
fillpoint(r1, xy(347,261), 48.3).
fillpoint(r1, xy(349,260), 48.2).
fillpoint(r1, xy(345,262), 48.2).
fillpoint(r1, xy(352,259), 48.1).
fillpoint(r1, xy(342,263), 48.1).
fillpoint(r1, xy(49,305), 47.8).
fillpoint(r1, xy(420,274), 47.5).
fillpoint(r1, xy(48,310), 46.8).
fillpoint(r1, xy(416,271), 46.6).
fillpoint(r1, xy(413,269), 46.1).
fillpoint(r1, xy(47,315), 45.8).
fillpoint(r1, xy(410,267), 45.2).
fillpoint(r1, xy(395,260), 45.0).
fillpoint(r1, xy(397,261), 45.0).
fillpoint(r1, xy(402,263), 45.0).
fillpoint(r1, xy(404,264), 45.0).
fillpoint(r1, xy(393,259), 44.9).
fillpoint(r1, xy(400,262), 44.9).
fillpoint(r1, xy(406,265), 44.9).
fillpoint(r1, xy(471,232), 43.1).
fillpoint(r1, xy(430,271), 42.6).
fillpoint(r1, xy(440,263), 39.3).
fillpoint(r1, xy(442,262), 38.9).
fillpoint(r1, xy(448,258), 37.9).
fillpoint(r1, xy(446,259), 37.9).
fillpoint(r1, xy(451,257), 37.8).
fillpoint(r1, xy(457,248), 36.4).
fillpoint(r1, xy(456,251), 36.4).
fillpoint(r1, xy(559,225), 35.6).
fillpoint(r1, xy(503,326), 35.5).
fillpoint(r1, xy(506,327), 35.3).
fillpoint(r1, xy(517,327), 35.3).
border(r1).
region(r198, '#443c49', 36, centroid(616,272)).
perimeter(r198, 40).
polygon(r198, [xy(615,263),xy(616,280),xy(615,263)]).
midline(r198, [xy(615,264),xy(615,279)]).

adjacent(r1, r198).
shared_edge(r1, r198, 40).

encloses(r1, r198).

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
opencv_component(cc1, [r198]).
opencv_component_area(cc1, 36).
opencv_component_centroid(cc1, centroid(616,272)).
opencv_morphology(r1, opening_area(310354), closing_area(313267), gradient_area(6506)).
opencv_shape_metrics(r1, contour_area(309634.0), hull_area(309639.0), solidity(0.999984), circularity(0.655252), extent(0.996069), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309634.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 4.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 4.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 4.0).
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
opencv_contour(r1, c12, hole, 4.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 2.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 2.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 2.0).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 5.5).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 2.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 4.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 2.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 2.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 2.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 7.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 2.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 2.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 4.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 2.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 2.0).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 2.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 4.0).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 2.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 7.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 2.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 2.0).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 4.0).
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
opencv_contour(r1, c41, hole, 7.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 4.0).
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
opencv_contour(r1, c51, hole, 4.0).
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
opencv_contour(r1, c57, hole, 2.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 2.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 4.0).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 2.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 2.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 2.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 4.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 2.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 2.0).
opencv_contour_hierarchy(r1, c65, next(c66), previous(c64), child(none), parent(c0)).
opencv_contour(r1, c66, hole, 4.0).
opencv_contour_hierarchy(r1, c66, next(c67), previous(c65), child(none), parent(c0)).
opencv_contour(r1, c67, hole, 2.0).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 7.0).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 2.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 2.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 4.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 4.0).
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
opencv_contour(r1, c79, hole, 6.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 2.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 7.0).
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
opencv_contour(r1, c87, hole, 4.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 2.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 2.0).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 4.0).
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
opencv_contour(r1, c103, hole, 4.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 2.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 4.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 2.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 2.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 4.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 2.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 4.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 2.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 2.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 4.0).
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
opencv_contour(r1, c120, hole, 10.0).
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
opencv_contour(r1, c126, hole, 2.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 2.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 4.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 2.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 2.0).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 4.0).
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
opencv_contour(r1, c139, hole, 4.0).
opencv_contour_hierarchy(r1, c139, next(c140), previous(c138), child(none), parent(c0)).
opencv_contour(r1, c140, hole, 2.0).
opencv_contour_hierarchy(r1, c140, next(c141), previous(c139), child(none), parent(c0)).
opencv_contour(r1, c141, hole, 2.0).
opencv_contour_hierarchy(r1, c141, next(c142), previous(c140), child(none), parent(c0)).
opencv_contour(r1, c142, hole, 2.0).
opencv_contour_hierarchy(r1, c142, next(c143), previous(c141), child(none), parent(c0)).
opencv_contour(r1, c143, hole, 10.0).
opencv_contour_hierarchy(r1, c143, next(c144), previous(c142), child(none), parent(c0)).
opencv_contour(r1, c144, hole, 2.0).
opencv_contour_hierarchy(r1, c144, next(c145), previous(c143), child(none), parent(c0)).
opencv_contour(r1, c145, hole, 2.0).
opencv_contour_hierarchy(r1, c145, next(c146), previous(c144), child(none), parent(c0)).
opencv_contour(r1, c146, hole, 2.0).
opencv_contour_hierarchy(r1, c146, next(c147), previous(c145), child(none), parent(c0)).
opencv_contour(r1, c147, hole, 4.0).
opencv_contour_hierarchy(r1, c147, next(c148), previous(c146), child(none), parent(c0)).
opencv_contour(r1, c148, hole, 2.0).
opencv_contour_hierarchy(r1, c148, next(c149), previous(c147), child(none), parent(c0)).
opencv_contour(r1, c149, hole, 7.0).
opencv_contour_hierarchy(r1, c149, next(c150), previous(c148), child(none), parent(c0)).
opencv_contour(r1, c150, hole, 2.0).
opencv_contour_hierarchy(r1, c150, next(c151), previous(c149), child(none), parent(c0)).
opencv_contour(r1, c151, hole, 2.0).
opencv_contour_hierarchy(r1, c151, next(c152), previous(c150), child(none), parent(c0)).
opencv_contour(r1, c152, hole, 2.0).
opencv_contour_hierarchy(r1, c152, next(c153), previous(c151), child(none), parent(c0)).
opencv_contour(r1, c153, hole, 2.0).
opencv_contour_hierarchy(r1, c153, next(c154), previous(c152), child(none), parent(c0)).
opencv_contour(r1, c154, hole, 7.0).
opencv_contour_hierarchy(r1, c154, next(c155), previous(c153), child(none), parent(c0)).
opencv_contour(r1, c155, hole, 2.0).
opencv_contour_hierarchy(r1, c155, next(c156), previous(c154), child(none), parent(c0)).
opencv_contour(r1, c156, hole, 4.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 34.0).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 2.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 2.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 55.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 2.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 4.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 2.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 4.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 2.0).
opencv_contour_hierarchy(r1, c165, next(c166), previous(c164), child(none), parent(c0)).
opencv_contour(r1, c166, hole, 2.0).
opencv_contour_hierarchy(r1, c166, next(c167), previous(c165), child(none), parent(c0)).
opencv_contour(r1, c167, hole, 2.0).
opencv_contour_hierarchy(r1, c167, next(c168), previous(c166), child(none), parent(c0)).
opencv_contour(r1, c168, hole, 2.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 15.5).
opencv_contour_hierarchy(r1, c169, next(c170), previous(c168), child(none), parent(c0)).
opencv_contour(r1, c170, hole, 4.0).
opencv_contour_hierarchy(r1, c170, next(c171), previous(c169), child(none), parent(c0)).
opencv_contour(r1, c171, hole, 4.0).
opencv_contour_hierarchy(r1, c171, next(c172), previous(c170), child(none), parent(c0)).
opencv_contour(r1, c172, hole, 2.0).
opencv_contour_hierarchy(r1, c172, next(c173), previous(c171), child(none), parent(c0)).
opencv_contour(r1, c173, hole, 2.0).
opencv_contour_hierarchy(r1, c173, next(c174), previous(c172), child(none), parent(c0)).
opencv_contour(r1, c174, hole, 4.0).
opencv_contour_hierarchy(r1, c174, next(c175), previous(c173), child(none), parent(c0)).
opencv_contour(r1, c175, hole, 2.0).
opencv_contour_hierarchy(r1, c175, next(c176), previous(c174), child(none), parent(c0)).
opencv_contour(r1, c176, hole, 4.0).
opencv_contour_hierarchy(r1, c176, next(c177), previous(c175), child(none), parent(c0)).
opencv_contour(r1, c177, hole, 2.0).
opencv_contour_hierarchy(r1, c177, next(c178), previous(c176), child(none), parent(c0)).
opencv_contour(r1, c178, hole, 4.0).
opencv_contour_hierarchy(r1, c178, next(c179), previous(c177), child(none), parent(c0)).
opencv_contour(r1, c179, hole, 4.0).
opencv_contour_hierarchy(r1, c179, next(c180), previous(c178), child(none), parent(c0)).
opencv_contour(r1, c180, hole, 4.0).
opencv_contour_hierarchy(r1, c180, next(c181), previous(c179), child(none), parent(c0)).
opencv_contour(r1, c181, hole, 2.0).
opencv_contour_hierarchy(r1, c181, next(c182), previous(c180), child(none), parent(c0)).
opencv_contour(r1, c182, hole, 4.0).
opencv_contour_hierarchy(r1, c182, next(c183), previous(c181), child(none), parent(c0)).
opencv_contour(r1, c183, hole, 4.0).
opencv_contour_hierarchy(r1, c183, next(c184), previous(c182), child(none), parent(c0)).
opencv_contour(r1, c184, hole, 2.0).
opencv_contour_hierarchy(r1, c184, next(c185), previous(c183), child(none), parent(c0)).
opencv_contour(r1, c185, hole, 2.0).
opencv_contour_hierarchy(r1, c185, next(c186), previous(c184), child(none), parent(c0)).
opencv_contour(r1, c186, hole, 2.0).
opencv_contour_hierarchy(r1, c186, next(c187), previous(c185), child(none), parent(c0)).
opencv_contour(r1, c187, hole, 10.5).
opencv_contour_hierarchy(r1, c187, next(c188), previous(c186), child(none), parent(c0)).
opencv_contour(r1, c188, hole, 15.0).
opencv_contour_hierarchy(r1, c188, next(c189), previous(c187), child(none), parent(c0)).
opencv_contour(r1, c189, hole, 11.0).
opencv_contour_hierarchy(r1, c189, next(c190), previous(c188), child(none), parent(c0)).
opencv_contour(r1, c190, hole, 2.0).
opencv_contour_hierarchy(r1, c190, next(c191), previous(c189), child(none), parent(c0)).
opencv_contour(r1, c191, hole, 6.0).
opencv_contour_hierarchy(r1, c191, next(c192), previous(c190), child(none), parent(c0)).
opencv_contour(r1, c192, hole, 4.0).
opencv_contour_hierarchy(r1, c192, next(c193), previous(c191), child(none), parent(c0)).
opencv_contour(r1, c193, hole, 2.0).
opencv_contour_hierarchy(r1, c193, next(c194), previous(c192), child(none), parent(c0)).
opencv_contour(r1, c194, hole, 6.0).
opencv_contour_hierarchy(r1, c194, next(c195), previous(c193), child(none), parent(c0)).
opencv_contour(r1, c195, hole, 4.0).
opencv_contour_hierarchy(r1, c195, next(c196), previous(c194), child(none), parent(c0)).
opencv_contour(r1, c196, hole, 6.0).
opencv_contour_hierarchy(r1, c196, next(c197), previous(c195), child(none), parent(c0)).
opencv_contour(r1, c197, hole, 4.0).
opencv_contour_hierarchy(r1, c197, next(c198), previous(c196), child(none), parent(c0)).
opencv_contour(r1, c198, hole, 6.0).
opencv_contour_hierarchy(r1, c198, next(c199), previous(c197), child(none), parent(c0)).
opencv_contour(r1, c199, hole, 6.0).
opencv_contour_hierarchy(r1, c199, next(c200), previous(c198), child(none), parent(c0)).
opencv_contour(r1, c200, hole, 4.0).
opencv_contour_hierarchy(r1, c200, next(c201), previous(c199), child(none), parent(c0)).
opencv_contour(r1, c201, hole, 4.0).
opencv_contour_hierarchy(r1, c201, next(c202), previous(c200), child(none), parent(c0)).
opencv_contour(r1, c202, hole, 4.0).
opencv_contour_hierarchy(r1, c202, next(c203), previous(c201), child(none), parent(c0)).
opencv_contour(r1, c203, hole, 4.0).
opencv_contour_hierarchy(r1, c203, next(c204), previous(c202), child(none), parent(c0)).
opencv_contour(r1, c204, hole, 6.0).
opencv_contour_hierarchy(r1, c204, next(c205), previous(c203), child(none), parent(c0)).
opencv_contour(r1, c205, hole, 4.0).
opencv_contour_hierarchy(r1, c205, next(c206), previous(c204), child(none), parent(c0)).
opencv_contour(r1, c206, hole, 2.0).
opencv_contour_hierarchy(r1, c206, next(c207), previous(c205), child(none), parent(c0)).
opencv_contour(r1, c207, hole, 4.0).
opencv_contour_hierarchy(r1, c207, next(c208), previous(c206), child(none), parent(c0)).
opencv_contour(r1, c208, hole, 4.0).
opencv_contour_hierarchy(r1, c208, next(c209), previous(c207), child(none), parent(c0)).
opencv_contour(r1, c209, hole, 4.0).
opencv_contour_hierarchy(r1, c209, next(c210), previous(c208), child(none), parent(c0)).
opencv_contour(r1, c210, hole, 2.0).
opencv_contour_hierarchy(r1, c210, next(c211), previous(c209), child(none), parent(c0)).
opencv_contour(r1, c211, hole, 4.0).
opencv_contour_hierarchy(r1, c211, next(c212), previous(c210), child(none), parent(c0)).
opencv_contour(r1, c212, hole, 2.0).
opencv_contour_hierarchy(r1, c212, next(c213), previous(c211), child(none), parent(c0)).
opencv_contour(r1, c213, hole, 4.0).
opencv_contour_hierarchy(r1, c213, next(c214), previous(c212), child(none), parent(c0)).
opencv_contour(r1, c214, hole, 4.0).
opencv_contour_hierarchy(r1, c214, next(c215), previous(c213), child(none), parent(c0)).
opencv_contour(r1, c215, hole, 2.0).
opencv_contour_hierarchy(r1, c215, next(c216), previous(c214), child(none), parent(c0)).
opencv_contour(r1, c216, hole, 2.0).
opencv_contour_hierarchy(r1, c216, next(c217), previous(c215), child(none), parent(c0)).
opencv_contour(r1, c217, hole, 4.0).
opencv_contour_hierarchy(r1, c217, next(c218), previous(c216), child(none), parent(c0)).
opencv_contour(r1, c218, hole, 2.0).
opencv_contour_hierarchy(r1, c218, next(c219), previous(c217), child(none), parent(c0)).
opencv_contour(r1, c219, hole, 2.0).
opencv_contour_hierarchy(r1, c219, next(c220), previous(c218), child(none), parent(c0)).
opencv_contour(r1, c220, hole, 9.0).
opencv_contour_hierarchy(r1, c220, next(c221), previous(c219), child(none), parent(c0)).
opencv_contour(r1, c221, hole, 2.0).
opencv_contour_hierarchy(r1, c221, next(c222), previous(c220), child(none), parent(c0)).
opencv_contour(r1, c222, hole, 2.0).
opencv_contour_hierarchy(r1, c222, next(c223), previous(c221), child(none), parent(c0)).
opencv_contour(r1, c223, hole, 4.0).
opencv_contour_hierarchy(r1, c223, next(c224), previous(c222), child(none), parent(c0)).
opencv_contour(r1, c224, hole, 2.0).
opencv_contour_hierarchy(r1, c224, next(c225), previous(c223), child(none), parent(c0)).
opencv_contour(r1, c225, hole, 2.0).
opencv_contour_hierarchy(r1, c225, next(c226), previous(c224), child(none), parent(c0)).
opencv_contour(r1, c226, hole, 2.0).
opencv_contour_hierarchy(r1, c226, next(c227), previous(c225), child(none), parent(c0)).
opencv_contour(r1, c227, hole, 2.0).
opencv_contour_hierarchy(r1, c227, next(c228), previous(c226), child(none), parent(c0)).
opencv_contour(r1, c228, hole, 4.0).
opencv_contour_hierarchy(r1, c228, next(c229), previous(c227), child(none), parent(c0)).
opencv_contour(r1, c229, hole, 4.0).
opencv_contour_hierarchy(r1, c229, next(c230), previous(c228), child(none), parent(c0)).
opencv_contour(r1, c230, hole, 2.0).
opencv_contour_hierarchy(r1, c230, next(c231), previous(c229), child(none), parent(c0)).
opencv_contour(r1, c231, hole, 4.0).
opencv_contour_hierarchy(r1, c231, next(c232), previous(c230), child(none), parent(c0)).
opencv_contour(r1, c232, hole, 2.0).
opencv_contour_hierarchy(r1, c232, next(c233), previous(c231), child(none), parent(c0)).
opencv_contour(r1, c233, hole, 2.0).
opencv_contour_hierarchy(r1, c233, next(c234), previous(c232), child(none), parent(c0)).
opencv_contour(r1, c234, hole, 2.0).
opencv_contour_hierarchy(r1, c234, next(c235), previous(c233), child(none), parent(c0)).
opencv_contour(r1, c235, hole, 13.5).
opencv_contour_hierarchy(r1, c235, next(c236), previous(c234), child(none), parent(c0)).
opencv_contour(r1, c236, hole, 2.0).
opencv_contour_hierarchy(r1, c236, next(c237), previous(c235), child(none), parent(c0)).
opencv_contour(r1, c237, hole, 2.0).
opencv_contour_hierarchy(r1, c237, next(c238), previous(c236), child(none), parent(c0)).
opencv_contour(r1, c238, hole, 2.0).
opencv_contour_hierarchy(r1, c238, next(c239), previous(c237), child(none), parent(c0)).
opencv_contour(r1, c239, hole, 2.0).
opencv_contour_hierarchy(r1, c239, next(c240), previous(c238), child(none), parent(c0)).
opencv_contour(r1, c240, hole, 2.0).
opencv_contour_hierarchy(r1, c240, next(c241), previous(c239), child(none), parent(c0)).
opencv_contour(r1, c241, hole, 4.0).
opencv_contour_hierarchy(r1, c241, next(c242), previous(c240), child(none), parent(c0)).
opencv_contour(r1, c242, hole, 2.0).
opencv_contour_hierarchy(r1, c242, next(c243), previous(c241), child(none), parent(c0)).
opencv_contour(r1, c243, hole, 4.0).
opencv_contour_hierarchy(r1, c243, next(c244), previous(c242), child(none), parent(c0)).
opencv_contour(r1, c244, hole, 2.0).
opencv_contour_hierarchy(r1, c244, next(c245), previous(c243), child(none), parent(c0)).
opencv_contour(r1, c245, hole, 4.0).
opencv_contour_hierarchy(r1, c245, next(c246), previous(c244), child(none), parent(c0)).
opencv_contour(r1, c246, hole, 2.0).
opencv_contour_hierarchy(r1, c246, next(c247), previous(c245), child(none), parent(c0)).
opencv_contour(r1, c247, hole, 4.0).
opencv_contour_hierarchy(r1, c247, next(c248), previous(c246), child(none), parent(c0)).
opencv_contour(r1, c248, hole, 4.0).
opencv_contour_hierarchy(r1, c248, next(c249), previous(c247), child(none), parent(c0)).
opencv_contour(r1, c249, hole, 2.0).
opencv_contour_hierarchy(r1, c249, next(c250), previous(c248), child(none), parent(c0)).
opencv_contour(r1, c250, hole, 4.0).
opencv_contour_hierarchy(r1, c250, next(c251), previous(c249), child(none), parent(c0)).
opencv_contour(r1, c251, hole, 2.0).
opencv_contour_hierarchy(r1, c251, next(c252), previous(c250), child(none), parent(c0)).
opencv_contour(r1, c252, hole, 4.0).
opencv_contour_hierarchy(r1, c252, next(c253), previous(c251), child(none), parent(c0)).
opencv_contour(r1, c253, hole, 2.0).
opencv_contour_hierarchy(r1, c253, next(c254), previous(c252), child(none), parent(c0)).
opencv_contour(r1, c254, hole, 4.0).
opencv_contour_hierarchy(r1, c254, next(c255), previous(c253), child(none), parent(c0)).
opencv_contour(r1, c255, hole, 4.0).
opencv_contour_hierarchy(r1, c255, next(c256), previous(c254), child(none), parent(c0)).
opencv_contour(r1, c256, hole, 4.0).
opencv_contour_hierarchy(r1, c256, next(c257), previous(c255), child(none), parent(c0)).
opencv_contour(r1, c257, hole, 4.0).
opencv_contour_hierarchy(r1, c257, next(c258), previous(c256), child(none), parent(c0)).
opencv_contour(r1, c258, hole, 4.0).
opencv_contour_hierarchy(r1, c258, next(c259), previous(c257), child(none), parent(c0)).
opencv_contour(r1, c259, hole, 6.0).
opencv_contour_hierarchy(r1, c259, next(c260), previous(c258), child(none), parent(c0)).
opencv_contour(r1, c260, hole, 6.0).
opencv_contour_hierarchy(r1, c260, next(c261), previous(c259), child(none), parent(c0)).
opencv_contour(r1, c261, hole, 4.0).
opencv_contour_hierarchy(r1, c261, next(c262), previous(c260), child(none), parent(c0)).
opencv_contour(r1, c262, hole, 4.0).
opencv_contour_hierarchy(r1, c262, next(c263), previous(c261), child(none), parent(c0)).
opencv_contour(r1, c263, hole, 4.0).
opencv_contour_hierarchy(r1, c263, next(c264), previous(c262), child(none), parent(c0)).
opencv_contour(r1, c264, hole, 4.0).
opencv_contour_hierarchy(r1, c264, next(c265), previous(c263), child(none), parent(c0)).
opencv_contour(r1, c265, hole, 2.0).
opencv_contour_hierarchy(r1, c265, next(c266), previous(c264), child(none), parent(c0)).
opencv_contour(r1, c266, hole, 2.0).
opencv_contour_hierarchy(r1, c266, next(c267), previous(c265), child(none), parent(c0)).
opencv_contour(r1, c267, hole, 2.0).
opencv_contour_hierarchy(r1, c267, next(c268), previous(c266), child(none), parent(c0)).
opencv_contour(r1, c268, hole, 2.0).
opencv_contour_hierarchy(r1, c268, next(c269), previous(c267), child(none), parent(c0)).
opencv_contour(r1, c269, hole, 4.0).
opencv_contour_hierarchy(r1, c269, next(c270), previous(c268), child(none), parent(c0)).
opencv_contour(r1, c270, hole, 2.0).
opencv_contour_hierarchy(r1, c270, next(c271), previous(c269), child(none), parent(c0)).
opencv_contour(r1, c271, hole, 2.0).
opencv_contour_hierarchy(r1, c271, next(none), previous(c270), child(none), parent(c0)).
opencv_morphology(r198, opening_area(0), closing_area(68), gradient_area(76)).
opencv_shape_metrics(r198, contour_area(17.0), hull_area(17.0), solidity(1.0), circularity(0.164837), extent(0.472222), aspect_ratio(0.111111)).
opencv_contour(r198, c0, outer, 17.0).
opencv_contour_hierarchy(r198, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r198, 1).
opencv_watershed_segment(r198, ws1, 36, centroid(615,271)).
