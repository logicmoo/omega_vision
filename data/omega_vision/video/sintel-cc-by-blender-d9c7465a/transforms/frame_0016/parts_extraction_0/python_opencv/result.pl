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

region(r1, '#737472', 310651, centroid(427,181)).
perimeter(r1, 2988).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(616,350),xy(618,350),xy(616,350)]).
hole(r1, [xy(596,340),xy(598,340),xy(596,340)]).
hole(r1, [xy(594,337),xy(597,339),xy(594,337)]).
hole(r1, [xy(591,333),xy(593,333),xy(591,333)]).
hole(r1, [xy(589,331),xy(591,331),xy(589,331)]).
hole(r1, [xy(588,330),xy(590,330),xy(588,330)]).
hole(r1, [xy(587,329),xy(589,329),xy(587,329)]).
hole(r1, [xy(553,317),xy(555,317),xy(553,317)]).
hole(r1, [xy(552,316),xy(554,316),xy(552,316)]).
hole(r1, [xy(551,315),xy(553,315),xy(551,315)]).
hole(r1, [xy(550,314),xy(552,314),xy(550,314)]).
hole(r1, [xy(549,313),xy(551,313),xy(549,313)]).
hole(r1, [xy(548,311),xy(550,311),xy(548,311)]).
hole(r1, [xy(547,310),xy(549,310),xy(547,310)]).
hole(r1, [xy(546,308),xy(548,308),xy(546,308)]).
hole(r1, [xy(543,304),xy(545,304),xy(543,304)]).
hole(r1, [xy(542,303),xy(544,303),xy(542,303)]).
hole(r1, [xy(541,301),xy(543,301),xy(541,301)]).
hole(r1, [xy(537,294),xy(539,294),xy(537,294)]).
hole(r1, [xy(531,277),xy(533,277),xy(531,277)]).
hole(r1, [xy(530,275),xy(532,275),xy(530,275)]).
hole(r1, [xy(529,273),xy(531,273),xy(529,273)]).
hole(r1, [xy(528,271),xy(530,271),xy(528,271)]).
hole(r1, [xy(266,271),xy(268,271),xy(266,271)]).
hole(r1, [xy(267,270),xy(269,270),xy(267,270)]).
hole(r1, [xy(527,269),xy(529,269),xy(527,269)]).
hole(r1, [xy(268,269),xy(270,269),xy(268,269)]).
hole(r1, [xy(269,268),xy(271,268),xy(269,268)]).
hole(r1, [xy(529,261),xy(528,265),xy(529,261)]).
hole(r1, [xy(529,260),xy(531,261),xy(529,260)]).
hole(r1, [xy(530,259),xy(532,259),xy(530,259)]).
hole(r1, [xy(531,257),xy(533,257),xy(531,257)]).
hole(r1, [xy(533,253),xy(533,257),xy(533,253)]).
hole(r1, [xy(533,253),xy(535,253),xy(533,253)]).
hole(r1, [xy(534,251),xy(536,252),xy(534,251)]).
hole(r1, [xy(535,250),xy(537,250),xy(535,250)]).
hole(r1, [xy(536,247),xy(538,248),xy(536,247)]).
hole(r1, [xy(537,246),xy(539,246),xy(537,246)]).
hole(r1, [xy(538,245),xy(540,245),xy(538,245)]).
hole(r1, [xy(539,244),xy(540,242),xy(542,243),xy(539,244)]).
hole(r1, [xy(541,242),xy(543,242),xy(541,242)]).
hole(r1, [xy(200,241),xy(202,241),xy(200,241)]).
hole(r1, [xy(542,240),xy(544,241),xy(542,240)]).
hole(r1, [xy(543,239),xy(545,239),xy(543,239)]).
hole(r1, [xy(199,239),xy(201,239),xy(199,239)]).
hole(r1, [xy(544,238),xy(546,238),xy(544,238)]).
hole(r1, [xy(545,237),xy(547,237),xy(545,237)]).
hole(r1, [xy(546,236),xy(548,236),xy(546,236)]).
hole(r1, [xy(547,234),xy(549,235),xy(547,234)]).
hole(r1, [xy(548,233),xy(550,233),xy(548,233)]).
hole(r1, [xy(549,232),xy(551,232),xy(549,232)]).
hole(r1, [xy(550,230),xy(552,231),xy(550,230)]).
hole(r1, [xy(551,229),xy(553,229),xy(551,229)]).
hole(r1, [xy(552,228),xy(554,228),xy(552,228)]).
hole(r1, [xy(553,226),xy(555,227),xy(553,226)]).
hole(r1, [xy(215,226),xy(217,226),xy(215,226)]).
hole(r1, [xy(217,228),xy(201,240),xy(201,236),xy(213,225),xy(217,228)]).
hole(r1, [xy(216,225),xy(218,225),xy(216,225)]).
hole(r1, [xy(554,224),xy(556,224),xy(554,224)]).
hole(r1, [xy(219,223),xy(221,223),xy(219,223)]).
hole(r1, [xy(555,222),xy(557,222),xy(555,222)]).
hole(r1, [xy(556,220),xy(558,220),xy(556,220)]).
hole(r1, [xy(227,220),xy(229,220),xy(227,220)]).
hole(r1, [xy(220,221),xy(222,219),xy(227,221),xy(225,223),xy(220,221)]).
hole(r1, [xy(225,219),xy(227,219),xy(225,219)]).
hole(r1, [xy(557,218),xy(559,218),xy(557,218)]).
hole(r1, [xy(227,218),xy(229,218),xy(227,218)]).
hole(r1, [xy(229,217),xy(231,217),xy(229,217)]).
hole(r1, [xy(558,216),xy(560,216),xy(558,216)]).
hole(r1, [xy(231,216),xy(233,216),xy(231,216)]).
hole(r1, [xy(233,215),xy(235,215),xy(233,215)]).
hole(r1, [xy(235,214),xy(237,214),xy(235,214)]).
hole(r1, [xy(559,213),xy(561,214),xy(559,213)]).
hole(r1, [xy(237,213),xy(240,213),xy(237,213)]).
hole(r1, [xy(240,212),xy(242,212),xy(240,212)]).
hole(r1, [xy(243,211),xy(245,211),xy(243,211)]).
hole(r1, [xy(560,210),xy(562,211),xy(560,210)]).
hole(r1, [xy(561,207),xy(563,208),xy(561,207)]).
hole(r1, [xy(95,206),xy(97,206),xy(95,206)]).
hole(r1, [xy(562,205),xy(564,205),xy(562,205)]).
hole(r1, [xy(97,204),xy(99,204),xy(97,204)]).
hole(r1, [xy(98,203),xy(100,203),xy(98,203)]).
hole(r1, [xy(565,201),xy(564,205),xy(565,201)]).
hole(r1, [xy(100,201),xy(102,201),xy(100,201)]).
hole(r1, [xy(567,198),xy(566,202),xy(567,198)]).
hole(r1, [xy(567,198),xy(569,198),xy(567,198)]).
hole(r1, [xy(570,194),xy(569,198),xy(570,194)]).
hole(r1, [xy(570,194),xy(572,194),xy(570,194)]).
hole(r1, [xy(571,192),xy(573,193),xy(571,192)]).
hole(r1, [xy(572,190),xy(574,191),xy(572,190)]).
hole(r1, [xy(573,188),xy(575,188),xy(573,188)]).
hole(r1, [xy(574,187),xy(576,187),xy(574,187)]).
hole(r1, [xy(586,122),xy(588,122),xy(586,122)]).
hole(r1, [xy(587,118),xy(589,118),xy(587,118)]).
hole(r1, [xy(588,115),xy(590,115),xy(588,115)]).
hole(r1, [xy(589,112),xy(591,113),xy(589,112)]).
hole(r1, [xy(590,110),xy(592,110),xy(590,110)]).
hole(r1, [xy(591,107),xy(593,108),xy(591,107)]).
hole(r1, [xy(592,104),xy(594,105),xy(592,104)]).
hole(r1, [xy(593,101),xy(595,101),xy(593,101)]).
hole(r1, [xy(594,98),xy(596,99),xy(594,98)]).
midline(r1, [xy(629,135),xy(600,106),xy(586,106),xy(536,56),xy(532,56),xy(493,95),xy(478,95),xy(461,101),xy(447,113),xy(441,113),xy(426,121),xy(417,121),xy(400,131),xy(395,131),xy(382,144),xy(344,106),xy(131,106),xy(128,109),xy(112,109),xy(103,126),xy(100,135),xy(100,201),xy(95,205),xy(95,207),xy(96,207),xy(99,204),xy(98,203)]).
midline(r1, [xy(630,136),xy(711,217),xy(705,222),xy(594,111),xy(591,109),xy(588,109),xy(586,107)]).
midline(r1, [xy(461,102),xy(460,104),xy(562,206),xy(563,204)]).
midline(r1, [xy(564,206),xy(565,209),xy(543,209),xy(448,114),xy(456,105)]).
midline(r1, [xy(429,119),xy(427,121),xy(540,234),xy(541,242),xy(542,241),xy(543,242),xy(542,243),xy(551,242),xy(541,234)]).
midline(r1, [xy(469,99),xy(469,100),xy(568,197),xy(637,267),xy(635,269),xy(633,269),xy(464,101)]).
midline(r1, [xy(551,243),xy(593,285),xy(587,291),xy(583,291),xy(538,247),xy(416,124),xy(417,122)]).
midline(r1, [xy(582,291),xy(579,292),xy(541,254),xy(536,254),xy(534,252),xy(533,252),xy(409,127),xy(411,125)]).
midline(r1, [xy(533,253),xy(535,254)]).
midline(r1, [xy(636,269),xy(644,263),xy(576,195),xy(573,195),xy(476,97)]).
midline(r1, [xy(645,263),xy(648,263),xy(685,224),xy(613,152),xy(549,151),xy(494,96),xy(532,57)]).
midline(r1, [xy(576,152),xy(576,185),xy(574,187)]).
midline(r1, [xy(575,189),xy(576,186)]).
midline(r1, [xy(576,194),xy(574,192),xy(572,191),xy(570,191)]).
midline(r1, [xy(404,128),xy(401,131),xy(527,257),xy(528,261),xy(529,261),xy(530,262),xy(532,261),xy(528,257)]).
midline(r1, [xy(543,210),xy(545,213),xy(567,212),xy(566,209)]).
midline(r1, [xy(546,214),xy(552,220),xy(555,220),xy(554,225),xy(555,225),xy(557,222),xy(556,219),xy(558,215),xy(560,215),xy(560,216),xy(559,217),xy(558,217),xy(559,218),xy(557,221),xy(562,221),xy(616,275),xy(609,282),xy(606,282),xy(439,115)]).
midline(r1, [xy(611,281),xy(617,275),xy(623,275),xy(626,270),xy(568,212)]).
midline(r1, [xy(627,271),xy(633,270)]).
midline(r1, [xy(395,132),xy(382,145),xy(381,210),xy(243,210),xy(240,211),xy(240,213),xy(245,212)]).
midline(r1, [xy(708,222),xy(712,218),xy(724,216),xy(724,128),xy(645,49),xy(544,49),xy(539,53)]).
midline(r1, [xy(434,117),xy(548,233),xy(549,231),xy(550,231),xy(551,232),xy(549,234),xy(551,233),xy(601,283),xy(594,285),xy(589,290)]).
midline(r1, [xy(592,111),xy(590,111)]).
midline(r1, [xy(532,249),xy(537,249),xy(537,250),xy(536,251),xy(541,253)]).
midline(r1, [xy(532,262),xy(533,261),xy(530,257),xy(532,256),xy(533,257),xy(532,258),xy(533,258)]).
midline(r1, [xy(534,261),xy(570,296),xy(565,301),xy(556,302),xy(549,309),xy(547,307),xy(544,307),xy(541,300),xy(543,300),xy(543,301),xy(542,302),xy(544,302),xy(543,304),xy(544,305),xy(545,304),xy(545,303)]).
midline(r1, [xy(556,303),xy(549,310),xy(546,308),xy(547,312),xy(544,314),xy(478,314),xy(383,219),xy(313,288),xy(301,288),xy(230,215),xy(225,219),xy(227,218),xy(227,221),xy(228,221),xy(229,220),xy(230,211),xy(129,110),xy(131,107)]).
midline(r1, [xy(550,310),xy(548,311),xy(549,314),xy(553,318),xy(555,317),xy(550,312),xy(555,316)]).
midline(r1, [xy(545,314),xy(582,351),xy(605,351),xy(606,349),xy(596,341)]).
midline(r1, [xy(607,349),xy(611,349),xy(724,236)]).
midline(r1, [xy(725,234),xy(725,217)]).
midline(r1, [xy(617,344),xy(616,351),xy(617,351),xy(618,349)]).
midline(r1, [xy(382,220),xy(314,288)]).
midline(r1, [xy(538,312),xy(537,293),xy(539,293),xy(539,295)]).
midline(r1, [xy(383,218),xy(383,210)]).
midline(r1, [xy(567,300),xy(578,292)]).
midline(r1, [xy(544,50),xy(542,52),xy(591,101),xy(593,100),xy(593,102),xy(594,102),xy(595,101),xy(594,100),xy(595,100)]).
midline(r1, [xy(686,225),xy(702,225),xy(705,223)]).
midline(r1, [xy(600,105),xy(595,102)]).
midline(r1, [xy(570,193),xy(570,194),xy(571,195),xy(572,195)]).
midline(r1, [xy(586,150),xy(586,121),xy(588,114),xy(590,114),xy(589,119)]).
midline(r1, [xy(107,119),xy(111,116),xy(217,222),xy(215,227),xy(216,227),xy(217,226),xy(216,225),xy(218,223),xy(217,227)]).
midline(r1, [xy(532,312),xy(532,279),xy(527,268),xy(529,268),xy(529,269),xy(528,270),xy(530,270),xy(529,272),xy(531,272),xy(531,273),xy(530,274),xy(532,274),xy(533,278)]).
midline(r1, [xy(563,302),xy(587,326),xy(587,330),xy(589,332),xy(591,331),xy(588,328),xy(591,330)]).
midline(r1, [xy(600,285),xy(605,283)]).
midline(r1, [xy(268,272),xy(265,272),xy(220,227),xy(219,222),xy(221,222),xy(221,224)]).
midline(r1, [xy(268,273),xy(286,292),xy(280,297),xy(266,301),xy(144,301),xy(137,299),xy(100,262),xy(99,205),xy(102,201),xy(101,200),xy(102,200)]).
midline(r1, [xy(283,296),xy(287,292),xy(297,292),xy(301,289)]).
midline(r1, [xy(593,333),xy(591,332),xy(591,334),xy(593,334)]).
midline(r1, [xy(169,271),xy(200,241),xy(199,238),xy(200,238),xy(202,241),xy(200,242)]).
midline(r1, [xy(235,216),xy(232,215),xy(237,213)]).
midline(r1, [xy(233,216),xy(233,217)]).
midline(r1, [xy(551,228),xy(551,229),xy(553,230),xy(554,228),xy(553,227),xy(552,227)]).
midline(r1, [xy(547,235),xy(545,236),xy(548,237)]).
midline(r1, [xy(267,269),xy(269,267),xy(269,268),xy(270,267),xy(271,268),xy(268,271),xy(271,269)]).
midline(r1, [xy(588,123),xy(588,121)]).
midline(r1, [xy(538,245),xy(540,247)]).
midline(r1, [xy(598,340),xy(598,339)]).
midline(r1, [xy(544,238),xy(543,238),xy(543,239),xy(544,240),xy(546,239)]).
midline(r1, [xy(231,218),xy(231,217)]).
fillpoint(r1, xy(398,170), 162.7).
fillpoint(r1, xy(379,157), 150.9).
fillpoint(r1, xy(708,218), 139.4).
fillpoint(r1, xy(709,213), 138.5).
fillpoint(r1, xy(710,209), 137.5).
fillpoint(r1, xy(442,142), 136.6).
fillpoint(r1, xy(711,168), 136.6).
fillpoint(r1, xy(711,204), 136.6).
fillpoint(r1, xy(712,162), 135.6).
fillpoint(r1, xy(712,175), 135.6).
fillpoint(r1, xy(712,199), 135.6).
fillpoint(r1, xy(713,157), 134.7).
fillpoint(r1, xy(713,180), 134.7).
fillpoint(r1, xy(713,195), 134.7).
fillpoint(r1, xy(714,153), 133.7).
fillpoint(r1, xy(714,184), 133.7).
fillpoint(r1, xy(714,190), 133.7).
fillpoint(r1, xy(715,148), 132.7).
fillpoint(r1, xy(716,144), 131.8).
fillpoint(r1, xy(717,139), 130.8).
fillpoint(r1, xy(328,123), 118.4).
fillpoint(r1, xy(323,122), 117.5).
fillpoint(r1, xy(319,121), 116.5).
fillpoint(r1, xy(314,120), 115.6).
fillpoint(r1, xy(309,119), 114.6).
fillpoint(r1, xy(305,118), 113.6).
fillpoint(r1, xy(183,118), 113.2).
fillpoint(r1, xy(180,117), 112.7).
fillpoint(r1, xy(187,117), 112.7).
fillpoint(r1, xy(300,117), 112.7).
fillpoint(r1, xy(176,116), 111.7).
fillpoint(r1, xy(191,116), 111.7).
fillpoint(r1, xy(296,116), 111.7).
fillpoint(r1, xy(171,115), 110.8).
fillpoint(r1, xy(196,115), 110.8).
fillpoint(r1, xy(291,115), 110.8).
fillpoint(r1, xy(166,114), 109.8).
fillpoint(r1, xy(201,114), 109.8).
fillpoint(r1, xy(286,114), 109.8).
fillpoint(r1, xy(162,113), 108.9).
fillpoint(r1, xy(205,113), 108.9).
fillpoint(r1, xy(282,113), 108.9).
fillpoint(r1, xy(157,112), 107.9).
fillpoint(r1, xy(210,112), 107.9).
fillpoint(r1, xy(277,112), 107.9).
fillpoint(r1, xy(153,111), 107.0).
fillpoint(r1, xy(214,111), 107.0).
fillpoint(r1, xy(272,111), 107.0).
fillpoint(r1, xy(148,110), 106.0).
fillpoint(r1, xy(219,110), 106.0).
fillpoint(r1, xy(268,110), 106.0).
fillpoint(r1, xy(143,109), 105.1).
fillpoint(r1, xy(224,109), 105.1).
fillpoint(r1, xy(263,109), 105.1).
fillpoint(r1, xy(139,108), 104.1).
fillpoint(r1, xy(228,108), 104.1).
fillpoint(r1, xy(259,108), 104.1).
fillpoint(r1, xy(134,107), 103.1).
fillpoint(r1, xy(233,107), 103.1).
fillpoint(r1, xy(254,107), 103.1).
fillpoint(r1, xy(129,106), 102.2).
fillpoint(r1, xy(238,106), 102.2).
fillpoint(r1, xy(249,106), 102.2).
fillpoint(r1, xy(125,105), 101.2).
fillpoint(r1, xy(244,105), 101.2).
fillpoint(r1, xy(120,104), 100.3).
fillpoint(r1, xy(116,103), 99.3).
fillpoint(r1, xy(111,102), 98.4).
fillpoint(r1, xy(106,101), 97.4).
fillpoint(r1, xy(102,100), 96.5).
fillpoint(r1, xy(130,278), 82.1).
fillpoint(r1, xy(124,279), 81.2).
fillpoint(r1, xy(120,280), 80.2).
fillpoint(r1, xy(115,281), 79.3).
fillpoint(r1, xy(82,282), 78.3).
fillpoint(r1, xy(111,282), 78.3).
fillpoint(r1, xy(86,283), 77.4).
fillpoint(r1, xy(106,283), 77.4).
fillpoint(r1, xy(91,284), 76.4).
fillpoint(r1, xy(101,284), 76.4).
fillpoint(r1, xy(96,285), 75.4).
fillpoint(r1, xy(152,292), 68.8).
fillpoint(r1, xy(157,293), 67.8).
fillpoint(r1, xy(161,294), 66.9).
fillpoint(r1, xy(166,295), 65.9).
fillpoint(r1, xy(171,296), 64.9).
fillpoint(r1, xy(175,297), 64.0).
fillpoint(r1, xy(180,298), 63.0).
fillpoint(r1, xy(184,299), 62.1).
fillpoint(r1, xy(215,299), 61.2).
fillpoint(r1, xy(189,300), 61.1).
fillpoint(r1, xy(213,300), 61.1).
fillpoint(r1, xy(194,301), 60.2).
fillpoint(r1, xy(209,301), 60.2).
fillpoint(r1, xy(198,302), 59.2).
fillpoint(r1, xy(204,302), 59.2).
fillpoint(r1, xy(157,205), 55.1).
fillpoint(r1, xy(154,212), 55.1).
fillpoint(r1, xy(151,219), 55.1).
fillpoint(r1, xy(150,221), 55.1).
fillpoint(r1, xy(147,228), 55.1).
fillpoint(r1, xy(144,235), 55.1).
fillpoint(r1, xy(158,203), 55.0).
fillpoint(r1, xy(156,207), 55.0).
fillpoint(r1, xy(155,210), 55.0).
fillpoint(r1, xy(153,214), 55.0).
fillpoint(r1, xy(152,217), 55.0).
fillpoint(r1, xy(149,223), 55.0).
fillpoint(r1, xy(148,226), 55.0).
fillpoint(r1, xy(146,230), 55.0).
fillpoint(r1, xy(145,233), 55.0).
fillpoint(r1, xy(143,237), 55.0).
fillpoint(r1, xy(560,56), 54.4).
fillpoint(r1, xy(630,56), 54.4).
fillpoint(r1, xy(565,55), 53.5).
fillpoint(r1, xy(626,55), 53.5).
fillpoint(r1, xy(55,171), 53.5).
fillpoint(r1, xy(55,241), 53.5).
fillpoint(r1, xy(569,54), 52.5).
fillpoint(r1, xy(621,54), 52.5).
fillpoint(r1, xy(54,176), 52.5).
fillpoint(r1, xy(54,237), 52.5).
fillpoint(r1, xy(574,53), 51.6).
fillpoint(r1, xy(617,53), 51.6).
fillpoint(r1, xy(53,180), 51.6).
fillpoint(r1, xy(53,232), 51.6).
fillpoint(r1, xy(232,310), 51.6).
fillpoint(r1, xy(302,310), 51.6).
fillpoint(r1, xy(578,52), 50.6).
fillpoint(r1, xy(612,52), 50.6).
fillpoint(r1, xy(52,185), 50.6).
fillpoint(r1, xy(52,228), 50.6).
fillpoint(r1, xy(237,311), 50.6).
fillpoint(r1, xy(298,311), 50.6).
fillpoint(r1, xy(583,51), 49.7).
fillpoint(r1, xy(607,51), 49.7).
fillpoint(r1, xy(51,189), 49.7).
fillpoint(r1, xy(51,223), 49.7).
fillpoint(r1, xy(241,312), 49.7).
fillpoint(r1, xy(293,312), 49.7).
fillpoint(r1, xy(588,50), 48.7).
fillpoint(r1, xy(603,50), 48.7).
fillpoint(r1, xy(50,194), 48.7).
fillpoint(r1, xy(50,218), 48.7).
fillpoint(r1, xy(246,313), 48.7).
fillpoint(r1, xy(289,313), 48.7).
fillpoint(r1, xy(592,49), 47.8).
fillpoint(r1, xy(598,49), 47.8).
fillpoint(r1, xy(49,199), 47.8).
fillpoint(r1, xy(49,214), 47.8).
fillpoint(r1, xy(250,314), 47.8).
fillpoint(r1, xy(284,314), 47.8).
fillpoint(r1, xy(48,203), 46.8).
fillpoint(r1, xy(48,209), 46.8).
fillpoint(r1, xy(255,315), 46.8).
fillpoint(r1, xy(279,315), 46.8).
fillpoint(r1, xy(260,316), 45.8).
fillpoint(r1, xy(275,316), 45.8).
fillpoint(r1, xy(264,317), 44.9).
fillpoint(r1, xy(270,317), 44.9).
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
opencv_morphology(r1, opening_area(310638), closing_area(313221), gradient_area(5460)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 7.0).
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
opencv_contour(r1, c29, hole, 7.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 4.0).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 2.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 2.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 6.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 2.0).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 4.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 2.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 4.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 2.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 2.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 5.5).
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
opencv_contour(r1, c49, hole, 4.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 2.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 2.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 4.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 4.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 2.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 76.5).
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
opencv_contour(r1, c64, hole, 18.0).
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
opencv_contour(r1, c71, hole, 2.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 4.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 4.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 2.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 2.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 4.0).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 4.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 2.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 2.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 2.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 2.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 7.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 2.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 7.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 2.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 7.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 2.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 4.0).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 4.0).
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
opencv_contour(r1, c96, hole, 4.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 2.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 4.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 4.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 2.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 4.0).
opencv_contour_hierarchy(r1, c101, next(none), previous(c100), child(none), parent(c0)).
