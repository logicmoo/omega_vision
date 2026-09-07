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

region(r1, '#747676', 310415, centroid(426,181)).
perimeter(r1, 3650).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(712,337),xy(714,337),xy(712,337)]).
hole(r1, [xy(709,333),xy(711,333),xy(709,333)]).
hole(r1, [xy(707,331),xy(709,331),xy(707,331)]).
hole(r1, [xy(705,329),xy(707,329),xy(705,329)]).
hole(r1, [xy(328,318),xy(330,318),xy(328,318)]).
hole(r1, [xy(560,317),xy(562,318),xy(560,317)]).
hole(r1, [xy(331,317),xy(333,317),xy(331,317)]).
hole(r1, [xy(556,314),xy(558,314),xy(556,314)]).
hole(r1, [xy(555,313),xy(557,313),xy(555,313)]).
hole(r1, [xy(553,312),xy(555,312),xy(553,312)]).
hole(r1, [xy(551,311),xy(553,311),xy(551,311)]).
hole(r1, [xy(550,310),xy(552,310),xy(550,310)]).
hole(r1, [xy(548,309),xy(550,309),xy(548,309)]).
hole(r1, [xy(547,308),xy(549,308),xy(547,308)]).
hole(r1, [xy(545,307),xy(547,307),xy(545,307)]).
hole(r1, [xy(544,306),xy(546,306),xy(544,306)]).
hole(r1, [xy(542,305),xy(544,305),xy(542,305)]).
hole(r1, [xy(540,304),xy(542,304),xy(540,304)]).
hole(r1, [xy(539,303),xy(541,303),xy(539,303)]).
hole(r1, [xy(538,302),xy(540,302),xy(538,302)]).
hole(r1, [xy(536,301),xy(539,301),xy(536,301)]).
hole(r1, [xy(535,300),xy(537,300),xy(535,300)]).
hole(r1, [xy(532,298),xy(534,298),xy(532,298)]).
hole(r1, [xy(531,297),xy(533,297),xy(531,297)]).
hole(r1, [xy(530,296),xy(532,296),xy(530,296)]).
hole(r1, [xy(529,295),xy(531,295),xy(529,295)]).
hole(r1, [xy(510,294),xy(512,294),xy(510,294)]).
hole(r1, [xy(527,293),xy(530,294),xy(528,295),xy(527,293)]).
hole(r1, [xy(511,293),xy(513,293),xy(511,293)]).
hole(r1, [xy(526,292),xy(528,292),xy(526,292)]).
hole(r1, [xy(512,292),xy(514,292),xy(512,292)]).
hole(r1, [xy(513,291),xy(515,291),xy(513,291)]).
hole(r1, [xy(525,290),xy(527,291),xy(525,290)]).
hole(r1, [xy(514,290),xy(516,290),xy(514,290)]).
hole(r1, [xy(524,289),xy(526,289),xy(524,289)]).
hole(r1, [xy(515,289),xy(517,289),xy(515,289)]).
hole(r1, [xy(516,288),xy(518,288),xy(516,288)]).
hole(r1, [xy(517,287),xy(519,287),xy(517,287)]).
hole(r1, [xy(523,286),xy(525,287),xy(523,286)]).
hole(r1, [xy(518,286),xy(520,286),xy(518,286)]).
hole(r1, [xy(519,285),xy(521,285),xy(519,285)]).
hole(r1, [xy(520,283),xy(523,283),xy(520,283)]).
hole(r1, [xy(675,260),xy(677,260),xy(675,260)]).
hole(r1, [xy(676,258),xy(678,259),xy(676,258)]).
hole(r1, [xy(677,257),xy(683,256),xy(684,259),xy(677,257)]).
hole(r1, [xy(229,257),xy(232,257),xy(229,257)]).
hole(r1, [xy(664,248),xy(667,252),xy(668,259),xy(666,261),xy(658,259),xy(658,250),xy(664,248)]).
hole(r1, [xy(715,244),xy(717,244),xy(715,244)]).
hole(r1, [xy(696,244),xy(698,244),xy(696,244)]).
hole(r1, [xy(694,243),xy(697,243),xy(694,243)]).
hole(r1, [xy(693,242),xy(695,242),xy(693,242)]).
hole(r1, [xy(303,240),xy(305,240),xy(303,240)]).
hole(r1, [xy(717,237),xy(717,244),xy(717,237)]).
hole(r1, [xy(308,237),xy(310,237),xy(308,237)]).
hole(r1, [xy(310,236),xy(312,236),xy(310,236)]).
hole(r1, [xy(715,234),xy(717,234),xy(715,234)]).
hole(r1, [xy(312,234),xy(314,234),xy(312,234)]).
hole(r1, [xy(313,233),xy(316,233),xy(313,233)]).
hole(r1, [xy(714,232),xy(716,233),xy(714,232)]).
hole(r1, [xy(315,232),xy(317,232),xy(315,232)]).
hole(r1, [xy(718,231),xy(720,231),xy(718,231)]).
hole(r1, [xy(719,230),xy(721,230),xy(719,230)]).
hole(r1, [xy(691,230),xy(693,230),xy(691,230)]).
hole(r1, [xy(319,229),xy(317,232),xy(319,229)]).
hole(r1, [xy(692,229),xy(694,229),xy(692,229)]).
hole(r1, [xy(693,228),xy(695,228),xy(693,228)]).
hole(r1, [xy(320,228),xy(322,228),xy(320,228)]).
hole(r1, [xy(694,227),xy(696,227),xy(694,227)]).
hole(r1, [xy(321,227),xy(323,227),xy(321,227)]).
hole(r1, [xy(708,226),xy(712,226),xy(708,226)]).
hole(r1, [xy(721,224),xy(721,230),xy(721,224)]).
hole(r1, [xy(590,218),xy(592,218),xy(590,218)]).
hole(r1, [xy(158,216),xy(160,216),xy(158,216)]).
hole(r1, [xy(586,214),xy(588,214),xy(586,214)]).
hole(r1, [xy(686,213),xy(689,213),xy(686,213)]).
hole(r1, [xy(727,212),xy(729,212),xy(727,212)]).
hole(r1, [xy(684,212),xy(686,212),xy(684,212)]).
hole(r1, [xy(583,212),xy(585,212),xy(583,212)]).
hole(r1, [xy(728,211),xy(730,211),xy(728,211)]).
hole(r1, [xy(582,211),xy(584,211),xy(582,211)]).
hole(r1, [xy(683,210),xy(685,210),xy(683,210)]).
hole(r1, [xy(683,207),xy(685,207),xy(683,207)]).
hole(r1, [xy(684,206),xy(686,206),xy(684,206)]).
hole(r1, [xy(685,205),xy(687,205),xy(685,205)]).
hole(r1, [xy(792,204),xy(794,204),xy(792,204)]).
hole(r1, [xy(686,204),xy(688,204),xy(686,204)]).
hole(r1, [xy(687,203),xy(689,203),xy(687,203)]).
hole(r1, [xy(785,202),xy(787,202),xy(785,202)]).
hole(r1, [xy(689,202),xy(691,202),xy(689,202)]).
hole(r1, [xy(570,202),xy(572,202),xy(570,202)]).
hole(r1, [xy(784,201),xy(786,201),xy(784,201)]).
hole(r1, [xy(733,201),xy(735,201),xy(733,201)]).
hole(r1, [xy(690,201),xy(692,201),xy(690,201)]).
hole(r1, [xy(569,201),xy(571,201),xy(569,201)]).
hole(r1, [xy(691,200),xy(693,200),xy(691,200)]).
hole(r1, [xy(692,199),xy(695,199),xy(692,199)]).
hole(r1, [xy(566,199),xy(568,199),xy(566,199)]).
hole(r1, [xy(694,198),xy(696,198),xy(694,198)]).
hole(r1, [xy(695,197),xy(698,197),xy(695,197)]).
hole(r1, [xy(783,196),xy(785,196),xy(783,196)]).
hole(r1, [xy(697,196),xy(700,196),xy(697,196)]).
hole(r1, [xy(562,196),xy(564,196),xy(562,196)]).
hole(r1, [xy(699,195),xy(701,195),xy(699,195)]).
hole(r1, [xy(784,194),xy(786,195),xy(784,194)]).
hole(r1, [xy(780,193),xy(780,197),xy(780,193)]).
hole(r1, [xy(701,194),xy(703,194),xy(701,194)]).
hole(r1, [xy(121,194),xy(123,194),xy(121,194)]).
hole(r1, [xy(785,193),xy(787,193),xy(785,193)]).
hole(r1, [xy(778,193),xy(780,193),xy(778,193)]).
hole(r1, [xy(753,192),xy(753,199),xy(753,192)]).
hole(r1, [xy(702,193),xy(705,193),xy(702,193)]).
hole(r1, [xy(777,192),xy(779,192),xy(777,192)]).
hole(r1, [xy(733,192),xy(735,192),xy(733,192)]).
hole(r1, [xy(705,192),xy(707,192),xy(705,192)]).
hole(r1, [xy(556,192),xy(558,192),xy(556,192)]).
hole(r1, [xy(706,191),xy(708,191),xy(706,191)]).
hole(r1, [xy(775,190),xy(778,191),xy(776,192),xy(775,190)]).
hole(r1, [xy(756,189),xy(754,193),xy(753,191),xy(756,189)]).
hole(r1, [xy(707,190),xy(709,190),xy(707,190)]).
hole(r1, [xy(382,190),xy(384,190),xy(382,190)]).
hole(r1, [xy(789,188),xy(790,190),xy(787,193),xy(786,191),xy(789,188)]).
hole(r1, [xy(756,189),xy(760,189),xy(756,189)]).
hole(r1, [xy(708,189),xy(710,189),xy(708,189)]).
hole(r1, [xy(789,188),xy(792,188),xy(789,188)]).
hole(r1, [xy(777,188),xy(779,189),xy(777,188)]).
hole(r1, [xy(709,188),xy(712,188),xy(709,188)]).
hole(r1, [xy(732,187),xy(734,187),xy(732,187)]).
hole(r1, [xy(548,187),xy(550,187),xy(548,187)]).
hole(r1, [xy(731,186),xy(733,186),xy(731,186)]).
hole(r1, [xy(711,187),xy(712,185),xy(714,186),xy(711,187)]).
hole(r1, [xy(729,185),xy(732,185),xy(729,185)]).
hole(r1, [xy(713,185),xy(715,185),xy(713,185)]).
hole(r1, [xy(545,185),xy(547,185),xy(545,185)]).
hole(r1, [xy(727,184),xy(729,184),xy(727,184)]).
hole(r1, [xy(714,184),xy(716,184),xy(714,184)]).
hole(r1, [xy(786,183),xy(788,184),xy(786,183)]).
hole(r1, [xy(724,183),xy(726,183),xy(724,183)]).
hole(r1, [xy(715,183),xy(718,183),xy(715,183)]).
hole(r1, [xy(788,182),xy(790,182),xy(788,182)]).
hole(r1, [xy(789,181),xy(791,181),xy(789,181)]).
hole(r1, [xy(332,175),xy(334,175),xy(332,175)]).
hole(r1, [xy(333,174),xy(335,174),xy(333,174)]).
hole(r1, [xy(334,173),xy(336,173),xy(334,173)]).
hole(r1, [xy(335,172),xy(337,172),xy(335,172)]).
hole(r1, [xy(336,171),xy(338,171),xy(336,171)]).
hole(r1, [xy(501,167),xy(503,167),xy(501,167)]).
hole(r1, [xy(500,166),xy(502,166),xy(500,166)]).
hole(r1, [xy(498,164),xy(500,164),xy(498,164)]).
hole(r1, [xy(497,163),xy(499,163),xy(497,163)]).
hole(r1, [xy(345,163),xy(347,163),xy(345,163)]).
hole(r1, [xy(346,162),xy(348,162),xy(346,162)]).
hole(r1, [xy(330,161),xy(332,161),xy(330,161)]).
hole(r1, [xy(494,159),xy(496,159),xy(494,159)]).
hole(r1, [xy(492,157),xy(494,157),xy(492,157)]).
hole(r1, [xy(752,156),xy(754,156),xy(752,156)]).
hole(r1, [xy(491,156),xy(493,156),xy(491,156)]).
hole(r1, [xy(748,155),xy(751,155),xy(748,155)]).
hole(r1, [xy(745,154),xy(748,154),xy(745,154)]).
hole(r1, [xy(490,154),xy(492,155),xy(490,154)]).
hole(r1, [xy(742,153),xy(745,153),xy(742,153)]).
hole(r1, [xy(489,153),xy(491,153),xy(489,153)]).
hole(r1, [xy(739,152),xy(742,152),xy(739,152)]).
hole(r1, [xy(736,151),xy(739,151),xy(736,151)]).
hole(r1, [xy(488,151),xy(490,152),xy(488,151)]).
hole(r1, [xy(733,150),xy(736,150),xy(733,150)]).
hole(r1, [xy(487,150),xy(489,150),xy(487,150)]).
hole(r1, [xy(730,149),xy(733,149),xy(730,149)]).
hole(r1, [xy(727,148),xy(730,148),xy(727,148)]).
hole(r1, [xy(486,148),xy(488,148),xy(486,148)]).
hole(r1, [xy(725,147),xy(727,147),xy(725,147)]).
hole(r1, [xy(722,146),xy(724,146),xy(722,146)]).
hole(r1, [xy(484,145),xy(486,145),xy(484,145)]).
hole(r1, [xy(483,143),xy(485,143),xy(483,143)]).
hole(r1, [xy(711,140),xy(713,140),xy(711,140)]).
hole(r1, [xy(481,140),xy(483,140),xy(481,140)]).
hole(r1, [xy(480,139),xy(482,139),xy(480,139)]).
hole(r1, [xy(710,138),xy(712,138),xy(710,138)]).
hole(r1, [xy(701,138),xy(703,138),xy(701,138)]).
hole(r1, [xy(709,137),xy(711,137),xy(709,137)]).
hole(r1, [xy(604,137),xy(608,136),xy(609,138),xy(605,139),xy(604,137)]).
hole(r1, [xy(708,136),xy(710,136),xy(708,136)]).
hole(r1, [xy(707,135),xy(709,135),xy(707,135)]).
hole(r1, [xy(702,133),xy(704,135),xy(701,137),xy(702,133)]).
hole(r1, [xy(689,133),xy(691,133),xy(689,133)]).
hole(r1, [xy(538,129),xy(540,129),xy(538,129)]).
hole(r1, [xy(636,126),xy(638,126),xy(636,126)]).
hole(r1, [xy(633,125),xy(635,125),xy(633,125)]).
hole(r1, [xy(631,124),xy(633,124),xy(631,124)]).
hole(r1, [xy(628,123),xy(630,123),xy(628,123)]).
hole(r1, [xy(626,122),xy(629,122),xy(626,122)]).
hole(r1, [xy(624,121),xy(626,121),xy(624,121)]).
hole(r1, [xy(621,120),xy(624,120),xy(621,120)]).
hole(r1, [xy(619,119),xy(621,119),xy(619,119)]).
hole(r1, [xy(616,118),xy(618,118),xy(616,118)]).
hole(r1, [xy(583,113),xy(585,113),xy(583,113)]).
hole(r1, [xy(612,111),xy(614,111),xy(612,111)]).
hole(r1, [xy(256,111),xy(258,111),xy(256,111)]).
hole(r1, [xy(271,110),xy(273,110),xy(271,110)]).
hole(r1, [xy(254,110),xy(256,110),xy(254,110)]).
hole(r1, [xy(247,110),xy(249,110),xy(247,110)]).
hole(r1, [xy(610,109),xy(612,109),xy(610,109)]).
hole(r1, [xy(268,108),xy(270,108),xy(268,108)]).
hole(r1, [xy(583,107),xy(586,107),xy(583,107)]).
hole(r1, [xy(592,106),xy(594,103),xy(597,104),xy(594,107),xy(592,106)]).
hole(r1, [xy(264,103),xy(266,103),xy(264,103)]).
hole(r1, [xy(263,102),xy(265,102),xy(263,102)]).
hole(r1, [xy(262,101),xy(264,101),xy(262,101)]).
hole(r1, [xy(261,100),xy(263,100),xy(261,100)]).
hole(r1, [xy(258,96),xy(260,96),xy(258,96)]).
hole(r1, [xy(250,91),xy(252,91),xy(250,91)]).
hole(r1, [xy(461,90),xy(468,90),xy(461,90)]).
hole(r1, [xy(249,90),xy(251,90),xy(249,90)]).
hole(r1, [xy(248,89),xy(250,89),xy(248,89)]).
hole(r1, [xy(242,83),xy(244,83),xy(242,83)]).
hole(r1, [xy(236,79),xy(238,79),xy(236,79)]).
hole(r1, [xy(230,79),xy(232,79),xy(230,79)]).
hole(r1, [xy(456,78),xy(458,78),xy(456,78)]).
hole(r1, [xy(220,78),xy(222,78),xy(220,78)]).
hole(r1, [xy(221,77),xy(223,77),xy(221,77)]).
hole(r1, [xy(224,75),xy(226,75),xy(224,75)]).
hole(r1, [xy(305,44),xy(307,44),xy(305,44)]).
hole(r1, [xy(306,43),xy(308,43),xy(306,43)]).
hole(r1, [xy(307,41),xy(309,41),xy(307,41)]).
hole(r1, [xy(308,40),xy(310,40),xy(308,40)]).
hole(r1, [xy(309,39),xy(311,39),xy(309,39)]).
hole(r1, [xy(310,38),xy(312,38),xy(310,38)]).
hole(r1, [xy(311,37),xy(313,37),xy(311,37)]).
hole(r1, [xy(312,35),xy(314,35),xy(312,35)]).
hole(r1, [xy(313,34),xy(315,34),xy(313,34)]).
hole(r1, [xy(317,31),xy(319,31),xy(317,31)]).
hole(r1, [xy(435,29),xy(437,29),xy(435,29)]).
hole(r1, [xy(320,29),xy(322,29),xy(320,29)]).
hole(r1, [xy(321,28),xy(323,28),xy(321,28)]).
hole(r1, [xy(322,27),xy(324,27),xy(322,27)]).
hole(r1, [xy(433,26),xy(435,26),xy(433,26)]).
hole(r1, [xy(432,25),xy(434,25),xy(432,25)]).
hole(r1, [xy(431,24),xy(433,24),xy(431,24)]).
hole(r1, [xy(430,23),xy(432,23),xy(430,23)]).
hole(r1, [xy(429,22),xy(431,22),xy(429,22)]).
hole(r1, [xy(428,21),xy(430,21),xy(428,21)]).
hole(r1, [xy(427,20),xy(429,20),xy(427,20)]).
hole(r1, [xy(426,19),xy(428,19),xy(426,19)]).
hole(r1, [xy(425,18),xy(427,18),xy(425,18)]).
hole(r1, [xy(420,14),xy(422,14),xy(420,14)]).
hole(r1, [xy(403,8),xy(405,8),xy(403,8)]).
midline(r1, [xy(251,103),xy(251,93),xy(248,90),xy(248,88),xy(250,88),xy(249,90),xy(250,91),xy(251,90),xy(251,89),xy(252,92)]).
midline(r1, [xy(251,104),xy(251,109),xy(247,109),xy(247,114),xy(203,114),xy(186,128),xy(127,128),xy(115,140),xy(115,248),xy(177,310),xy(285,310),xy(296,297),xy(275,276),xy(275,269),xy(273,267),xy(273,214),xy(187,128),xy(197,118)]).
midline(r1, [xy(116,216),xy(158,215),xy(159,217),xy(160,215)]).
midline(r1, [xy(237,112),xy(236,78),xy(238,78),xy(238,80)]).
midline(r1, [xy(231,112),xy(230,78),xy(232,78),xy(232,80)]).
midline(r1, [xy(201,116),xy(317,232),xy(317,297),xy(297,298)]).
midline(r1, [xy(116,140),xy(127,129)]).
midline(r1, [xy(249,110),xy(249,111)]).
midline(r1, [xy(243,112),xy(242,82),xy(244,82),xy(244,84)]).
midline(r1, [xy(116,194),xy(121,193),xy(121,195),xy(122,195),xy(123,194),xy(122,193),xy(123,193)]).
midline(r1, [xy(317,298),xy(331,297),xy(331,316),xy(328,317),xy(328,319),xy(330,319),xy(332,316),xy(333,316),xy(333,318)]).
midline(r1, [xy(248,114),xy(256,114),xy(254,109),xy(258,110),xy(258,112)]).
midline(r1, [xy(332,297),xy(386,297),xy(420,262),xy(420,256),xy(405,241),xy(404,237),xy(404,191),xy(384,189),xy(382,189),xy(382,191),xy(384,191)]).
midline(r1, [xy(404,190),xy(404,175),xy(389,160),xy(321,227)]).
midline(r1, [xy(322,229),xy(389,161)]).
midline(r1, [xy(420,263),xy(480,322),xy(519,284),xy(521,285),xy(511,295),xy(510,295)]).
midline(r1, [xy(512,295),xy(590,219),xy(590,215),xy(583,210),xy(562,209),xy(548,195),xy(548,187),xy(545,185),xy(545,184),xy(548,184),xy(548,164),xy(538,154),xy(537,107),xy(490,152),xy(405,237),xy(406,237),xy(536,108)]).
midline(r1, [xy(570,208),xy(570,203),xy(566,199),xy(566,198),xy(571,200),xy(571,201),xy(570,202),xy(571,203),xy(572,201)]).
midline(r1, [xy(557,203),xy(556,191),xy(558,191),xy(558,193)]).
midline(r1, [xy(548,186),xy(550,186),xy(550,188)]).
midline(r1, [xy(483,323),xy(485,325),xy(488,324),xy(489,327),xy(492,326),xy(493,329),xy(503,329),xy(531,301)]).
midline(r1, [xy(504,330),xy(506,332),xy(530,331),xy(538,341),xy(585,340),xy(612,313),xy(610,309),xy(610,269),xy(598,257),xy(552,303),xy(550,308),xy(540,301),xy(539,301),xy(538,302),xy(540,305),xy(541,305),xy(542,304),xy(540,302)]).
midline(r1, [xy(598,258),xy(553,303)]).
midline(r1, [xy(613,312),xy(675,311),xy(675,263),xy(672,260),xy(672,256),xy(673,250),xy(681,243),xy(680,232),xy(670,231),xy(632,193),xy(602,194),xy(584,210)]).
midline(r1, [xy(586,211),xy(602,195)]).
midline(r1, [xy(673,256),xy(676,256),xy(679,259),xy(678,261),xy(676,259),xy(675,259),xy(675,262),xy(677,261)]).
midline(r1, [xy(389,159),xy(389,156),xy(347,114),xy(257,114)]).
midline(r1, [xy(331,115),xy(330,162),xy(331,162),xy(332,160)]).
midline(r1, [xy(318,112),xy(317,30),xy(319,30),xy(319,32)]).
midline(r1, [xy(306,112),xy(305,43),xy(313,33),xy(313,34),xy(314,33),xy(315,34),xy(308,44)]).
midline(r1, [xy(315,35),xy(314,36)]).
midline(r1, [xy(313,38),xy(309,42)]).
midline(r1, [xy(337,115),xy(337,169),xy(332,174),xy(332,176),xy(334,175),xy(333,174),xy(337,170),xy(338,171),xy(334,176)]).
midline(r1, [xy(338,172),xy(336,174)]).
midline(r1, [xy(264,112),xy(264,104),xy(259,99),xy(258,95),xy(260,95),xy(260,97)]).
midline(r1, [xy(675,312),xy(707,311),xy(707,327),xy(705,328),xy(705,330),xy(706,330),xy(707,329),xy(707,328)]).
midline(r1, [xy(708,311),xy(736,311),xy(743,302),xy(682,243)]).
midline(r1, [xy(707,265),xy(706,253),xy(696,245)]).
midline(r1, [xy(744,303),xy(777,303),xy(784,295),xy(719,232),xy(716,228),xy(710,230),xy(705,235),xy(701,234),xy(694,227),xy(683,228),xy(680,231)]).
midline(r1, [xy(785,296),xy(787,294),xy(787,264),xy(737,214),xy(737,210),xy(733,206),xy(721,206),xy(707,193)]).
midline(r1, [xy(729,207),xy(727,211),xy(727,213),xy(728,213),xy(729,212),xy(728,211),xy(730,210),xy(729,213)]).
midline(r1, [xy(694,226),xy(696,226),xy(696,228),xy(695,229),xy(694,229),xy(693,228),xy(691,229),xy(691,231),xy(694,230)]).
midline(r1, [xy(710,231),xy(705,236),xy(706,252)]).
midline(r1, [xy(598,256),xy(598,240),xy(593,236),xy(534,296),xy(531,294),xy(529,295),xy(533,299),xy(534,298),xy(531,295)]).
midline(r1, [xy(593,237),xy(536,294)]).
midline(r1, [xy(594,235),xy(592,227),xy(527,291),xy(493,326),xy(527,293),xy(592,228)]).
midline(r1, [xy(592,226),xy(590,224),xy(522,291)]).
midline(r1, [xy(592,224),xy(592,217)]).
midline(r1, [xy(590,225),xy(525,290),xy(524,290)]).
midline(r1, [xy(683,229),xy(682,231),xy(693,243),xy(694,243),xy(695,242),xy(694,241),xy(695,241)]).
midline(r1, [xy(563,208),xy(562,195),xy(564,195),xy(564,197)]).
midline(r1, [xy(221,112),xy(220,77),xy(223,76),xy(223,77),xy(221,79),xy(223,78)]).
midline(r1, [xy(716,227),xy(716,210),xy(701,196),xy(697,194),xy(697,196),xy(698,197),xy(697,199),xy(659,161),xy(655,161),xy(651,165),xy(607,121),xy(590,121),xy(589,102),xy(540,53),xy(530,53),xy(525,57),xy(512,44),xy(421,43),xy(416,45),xy(405,56),xy(403,9),xy(403,7),xy(405,7),xy(405,9)]).
midline(r1, [xy(716,209),xy(721,207)]).
midline(r1, [xy(404,56),xy(348,113),xy(347,160),xy(345,162),xy(345,164),xy(346,164),xy(347,163),xy(346,162),xy(347,161),xy(348,161),xy(347,164)]).
midline(r1, [xy(404,58),xy(349,113)]).
midline(r1, [xy(698,199),xy(707,210),xy(705,212),xy(702,212),xy(695,205),xy(691,205),xy(688,202),xy(682,206),xy(651,175),xy(633,193),xy(646,180)]).
midline(r1, [xy(707,211),xy(713,210)]).
midline(r1, [xy(416,46),xy(406,56)]).
midline(r1, [xy(608,121),xy(611,104),xy(656,59),xy(648,51),xy(540,52)]).
midline(r1, [xy(611,114),xy(616,119),xy(617,117),xy(619,120),xy(620,120),xy(621,119),xy(620,118),xy(621,118)]).
midline(r1, [xy(659,160),xy(662,159),xy(662,151),xy(633,123),xy(629,122),xy(628,124),xy(630,123),xy(631,125),xy(632,125),xy(633,124),xy(633,126),xy(635,126),xy(635,124)]).
midline(r1, [xy(651,174),xy(651,166),xy(655,162)]).
midline(r1, [xy(663,160),xy(670,167),xy(684,163),xy(706,187),xy(708,186),xy(706,190),xy(709,188),xy(710,189),xy(709,192)]).
midline(r1, [xy(674,168),xy(699,194),xy(701,193),xy(702,196),xy(703,195),xy(703,194),xy(702,193)]).
midline(r1, [xy(710,190),xy(712,188),xy(709,186)]).
midline(r1, [xy(651,176),xy(649,178)]).
midline(r1, [xy(690,205),xy(687,203),xy(683,207),xy(683,211),xy(684,213),xy(685,213),xy(686,212),xy(685,209)]).
midline(r1, [xy(656,60),xy(684,60),xy(624,120),xy(624,123),xy(618,129),xy(624,124)]).
midline(r1, [xy(626,120),xy(626,122)]).
midline(r1, [xy(457,45),xy(456,79),xy(457,79),xy(458,77)]).
midline(r1, [xy(530,54),xy(526,58),xy(526,92),xy(497,121),xy(455,123),xy(405,174),xy(455,124)]).
midline(r1, [xy(466,122),xy(480,137),xy(480,140),xy(482,141),xy(483,140),xy(481,138),xy(483,139)]).
midline(r1, [xy(499,120),xy(526,93),xy(537,106)]).
midline(r1, [xy(696,199),xy(695,199),xy(694,197)]).
midline(r1, [xy(589,121),xy(584,125),xy(583,112),xy(585,112),xy(585,114)]).
midline(r1, [xy(589,123),xy(586,126)]).
midline(r1, [xy(421,42),xy(420,13),xy(422,13),xy(422,15)]).
midline(r1, [xy(436,42),xy(435,28),xy(425,18),xy(425,17),xy(427,17),xy(435,25),xy(437,30)]).
midline(r1, [xy(433,27),xy(425,19)]).
midline(r1, [xy(627,118),xy(685,60),xy(689,60),xy(695,67),xy(664,99),xy(664,150)]).
midline(r1, [xy(666,97),xy(696,67),xy(771,67),xy(778,74),xy(778,79),xy(747,110),xy(728,122),xy(717,133),xy(716,139),xy(713,139),xy(708,134),xy(707,134),xy(707,136),xy(711,141),xy(712,141),xy(713,140),xy(712,139)]).
midline(r1, [xy(740,115),xy(738,168),xy(730,165),xy(711,165),xy(702,158),xy(686,162)]).
midline(r1, [xy(736,166),xy(737,117)]).
midline(r1, [xy(733,165),xy(734,119)]).
midline(r1, [xy(702,157),xy(701,137),xy(703,137),xy(703,139)]).
midline(r1, [xy(731,121),xy(730,164)]).
midline(r1, [xy(743,113),xy(742,167),xy(739,168)]).
midline(r1, [xy(692,161),xy(713,182),xy(713,185),xy(714,183),xy(715,183),xy(716,184),xy(714,186),xy(716,185),xy(732,204),xy(733,200),xy(735,200),xy(735,201),xy(734,202),xy(737,201)]).
midline(r1, [xy(717,139),xy(716,147),xy(705,158),xy(715,149)]).
midline(r1, [xy(723,191),xy(725,176),xy(734,168)]).
midline(r1, [xy(665,133),xy(689,132),xy(689,134),xy(690,134),xy(691,133),xy(690,132),xy(691,132)]).
midline(r1, [xy(728,123),xy(718,133)]).
midline(r1, [xy(746,111),xy(745,168),xy(742,169)]).
midline(r1, [xy(745,169),xy(748,169),xy(748,110),xy(778,80),xy(802,103),xy(802,131),xy(767,168),xy(754,157)]).
midline(r1, [xy(768,168),xy(764,172),xy(749,172),xy(748,170)]).
midline(r1, [xy(770,164),xy(802,132),xy(819,149),xy(819,152),xy(789,181)]).
midline(r1, [xy(738,199),xy(738,196),xy(733,192),xy(736,190),xy(732,188)]).
midline(r1, [xy(733,205),xy(733,204)]).
midline(r1, [xy(717,142),xy(722,147),xy(723,145),xy(725,148),xy(726,148),xy(727,147),xy(726,146),xy(727,146)]).
midline(r1, [xy(756,173),xy(756,189),xy(766,198),xy(766,203),xy(753,192),xy(742,191),xy(738,195),xy(742,192)]).
midline(r1, [xy(767,198),xy(769,171),xy(766,171)]).
midline(r1, [xy(770,172),xy(782,184),xy(782,190),xy(779,191),xy(769,181)]).
midline(r1, [xy(776,189),xy(778,191),xy(766,204),xy(766,209),xy(803,246),xy(788,264),xy(803,249)]).
midline(r1, [xy(783,187),xy(788,187),xy(791,181),xy(819,153),xy(822,156),xy(822,219),xy(789,188)]).
midline(r1, [xy(822,220),xy(821,224),xy(814,230),xy(784,201),xy(786,199),xy(783,196),xy(782,191),xy(785,193),xy(786,192),xy(787,193),xy(787,202)]).
midline(r1, [xy(820,226),xy(804,245),xy(814,236)]).
midline(r1, [xy(793,207),xy(792,203),xy(794,203),xy(794,205)]).
midline(r1, [xy(784,202),xy(785,203)]).
midline(r1, [xy(784,195),xy(785,196),xy(785,197)]).
midline(r1, [xy(768,203),xy(779,194),xy(780,192)]).
midline(r1, [xy(584,126),xy(548,163),xy(584,128)]).
midline(r1, [xy(742,190),xy(743,177),xy(748,173)]).
midline(r1, [xy(709,134),xy(712,137)]).
midline(r1, [xy(540,219),xy(457,219),xy(421,256),xy(457,220)]).
midline(r1, [xy(541,219),xy(549,219),xy(551,216),xy(492,158)]).
midline(r1, [xy(498,165),xy(497,164)]).
midline(r1, [xy(551,218),xy(558,216),xy(563,210)]).
midline(r1, [xy(500,167),xy(501,168)]).
midline(r1, [xy(707,332),xy(707,330),xy(709,330),xy(709,331),xy(708,332),xy(709,334),xy(710,334),xy(711,333),xy(710,332),xy(711,332),xy(711,334)]).
midline(r1, [xy(713,333),xy(712,338),xy(713,338),xy(714,336)]).
midline(r1, [xy(611,112),xy(612,108)]).
midline(r1, [xy(612,110),xy(614,110),xy(614,111),xy(612,112)]).
midline(r1, [xy(733,185),xy(734,187)]).
midline(r1, [xy(726,182),xy(725,184),xy(727,183),xy(727,185),xy(728,185),xy(729,184),xy(728,183),xy(729,183)]).
midline(r1, [xy(320,29),xy(322,26),xy(324,26),xy(324,27),xy(321,30),xy(320,30)]).
midline(r1, [xy(324,28),xy(322,30)]).
midline(r1, [xy(686,207),xy(688,205)]).
midline(r1, [xy(494,158),xy(494,157),xy(492,155),xy(494,156)]).
midline(r1, [xy(542,320),xy(541,321)]).
midline(r1, [xy(312,234),xy(303,239),xy(275,268),xy(305,241)]).
midline(r1, [xy(312,233),xy(313,233),xy(314,234),xy(311,237),xy(307,239)]).
midline(r1, [xy(711,239),xy(710,240)]).
midline(r1, [xy(225,76),xy(224,74),xy(226,74),xy(226,76)]).
midline(r1, [xy(263,102),xy(261,100),xy(261,99),xy(263,99),xy(265,101),xy(265,102),xy(264,103),xy(265,104),xy(266,102)]).
midline(r1, [xy(699,214),xy(698,225)]).
midline(r1, [xy(503,167),xy(500,163)]).
midline(r1, [xy(502,165),xy(503,166)]).
midline(r1, [xy(712,249),xy(707,254),xy(715,247),xy(715,243),xy(716,243),xy(717,244),xy(716,245),xy(717,245)]).
midline(r1, [xy(553,311),xy(551,309),xy(549,308),xy(548,309),xy(542,306)]).
midline(r1, [xy(546,306),xy(547,307)]).
midline(r1, [xy(547,309),xy(547,314),xy(542,319),xy(547,315)]).
midline(r1, [xy(551,308),xy(554,311),xy(552,312),xy(549,310),xy(551,312)]).
midline(r1, [xy(553,313),xy(554,313),xy(555,312),xy(555,311),xy(556,312),xy(555,313),xy(556,315),xy(557,315),xy(558,314),xy(557,312),xy(558,313)]).
midline(r1, [xy(544,307),xy(545,308)]).
midline(r1, [xy(638,126),xy(638,125)]).
midline(r1, [xy(712,238),xy(716,233),xy(717,234),xy(715,236)]).
midline(r1, [xy(718,233),xy(718,232)]).
midline(r1, [xy(270,107),xy(268,107),xy(268,109),xy(269,109),xy(270,108),xy(271,112),xy(273,110),xy(272,109),xy(273,109)]).
midline(r1, [xy(689,201),xy(691,199),xy(691,200),xy(692,199),xy(693,200),xy(690,203),xy(693,201)]).
midline(r1, [xy(485,142),xy(483,141),xy(483,144),xy(484,146),xy(486,145),xy(485,143),xy(486,144)]).
midline(r1, [xy(588,215),xy(583,213)]).
midline(r1, [xy(535,299),xy(535,301),xy(536,301),xy(537,300),xy(536,299),xy(537,299)]).
midline(r1, [xy(701,213),xy(700,214)]).
midline(r1, [xy(488,147),xy(486,146),xy(486,149),xy(487,151),xy(488,151),xy(489,150),xy(488,148),xy(489,149)]).
midline(r1, [xy(698,243),xy(698,244)]).
midline(r1, [xy(540,128),xy(540,130)]).
midline(r1, [xy(721,231),xy(720,231),xy(718,229),xy(720,229),xy(721,230)]).
midline(r1, [xy(495,158),xy(496,159)]).
fillpoint(r1, xy(101,101), 97.4).
fillpoint(r1, xy(105,100), 96.5).
fillpoint(r1, xy(110,99), 95.5).
fillpoint(r1, xy(115,98), 94.5).
fillpoint(r1, xy(130,98), 94.5).
fillpoint(r1, xy(119,97), 93.6).
fillpoint(r1, xy(125,97), 93.6).
fillpoint(r1, xy(426,268), 91.7).
fillpoint(r1, xy(421,269), 90.7).
fillpoint(r1, xy(416,270), 89.8).
fillpoint(r1, xy(411,271), 88.8).
fillpoint(r1, xy(407,272), 87.9).
fillpoint(r1, xy(91,272), 87.3).
fillpoint(r1, xy(452,232), 82.8).
fillpoint(r1, xy(447,242), 82.7).
fillpoint(r1, xy(450,235), 82.6).
fillpoint(r1, xy(444,249), 82.6).
fillpoint(r1, xy(449,237), 82.5).
fillpoint(r1, xy(448,240), 82.5).
fillpoint(r1, xy(446,244), 82.5).
fillpoint(r1, xy(445,247), 82.5).
fillpoint(r1, xy(103,278), 82.1).
fillpoint(r1, xy(108,279), 81.2).
fillpoint(r1, xy(377,90), 80.8).
fillpoint(r1, xy(112,280), 80.2).
fillpoint(r1, xy(117,281), 79.3).
fillpoint(r1, xy(772,81), 78.3).
fillpoint(r1, xy(122,282), 78.3).
fillpoint(r1, xy(181,143), 77.5).
fillpoint(r1, xy(126,283), 77.4).
fillpoint(r1, xy(182,145), 77.3).
fillpoint(r1, xy(131,284), 76.4).
fillpoint(r1, xy(223,179), 76.3).
fillpoint(r1, xy(167,134), 75.9).
fillpoint(r1, xy(176,138), 75.9).
fillpoint(r1, xy(169,135), 75.8).
fillpoint(r1, xy(174,137), 75.8).
fillpoint(r1, xy(172,136), 75.7).
fillpoint(r1, xy(760,78), 75.4).
fillpoint(r1, xy(135,285), 75.4).
fillpoint(r1, xy(755,77), 74.5).
fillpoint(r1, xy(140,286), 74.5).
fillpoint(r1, xy(776,286), 74.2).
fillpoint(r1, xy(249,187), 73.9).
fillpoint(r1, xy(236,182), 73.7).
fillpoint(r1, xy(243,185), 73.7).
fillpoint(r1, xy(234,181), 73.6).
fillpoint(r1, xy(238,183), 73.6).
fillpoint(r1, xy(241,184), 73.6).
fillpoint(r1, xy(245,186), 73.6).
fillpoint(r1, xy(750,76), 73.5).
fillpoint(r1, xy(231,180), 73.5).
fillpoint(r1, xy(251,186), 73.5).
fillpoint(r1, xy(777,283), 73.5).
fillpoint(r1, xy(145,287), 73.5).
fillpoint(r1, xy(746,75), 72.6).
fillpoint(r1, xy(778,278), 72.6).
fillpoint(r1, xy(149,288), 72.6).
fillpoint(r1, xy(167,288), 72.1).
fillpoint(r1, xy(741,74), 71.6).
fillpoint(r1, xy(779,274), 71.6).
fillpoint(r1, xy(154,289), 71.6).
fillpoint(r1, xy(164,289), 71.6).
fillpoint(r1, xy(382,264), 71.1).
fillpoint(r1, xy(260,184), 70.8).
fillpoint(r1, xy(258,185), 70.8).
fillpoint(r1, xy(736,73), 70.7).
fillpoint(r1, xy(159,290), 70.7).
fillpoint(r1, xy(401,118), 69.8).
fillpoint(r1, xy(404,125), 69.8).
fillpoint(r1, xy(732,72), 69.7).
fillpoint(r1, xy(399,113), 69.7).
fillpoint(r1, xy(400,116), 69.7).
fillpoint(r1, xy(402,120), 69.7).
fillpoint(r1, xy(403,123), 69.6).
fillpoint(r1, xy(199,161), 69.0).
fillpoint(r1, xy(201,162), 69.0).
fillpoint(r1, xy(206,164), 69.0).
fillpoint(r1, xy(208,165), 69.0).
fillpoint(r1, xy(727,71), 68.8).
fillpoint(r1, xy(71,145), 68.8).
fillpoint(r1, xy(204,163), 68.8).
fillpoint(r1, xy(71,243), 68.8).
fillpoint(r1, xy(723,70), 67.8).
fillpoint(r1, xy(70,150), 67.8).
fillpoint(r1, xy(70,239), 67.8).
fillpoint(r1, xy(672,70), 67.6).
fillpoint(r1, xy(668,69), 66.9).
fillpoint(r1, xy(676,69), 66.9).
fillpoint(r1, xy(718,69), 66.9).
fillpoint(r1, xy(69,154), 66.8).
fillpoint(r1, xy(69,234), 66.8).
fillpoint(r1, xy(680,68), 65.9).
fillpoint(r1, xy(713,68), 65.9).
fillpoint(r1, xy(68,159), 65.9).
fillpoint(r1, xy(68,229), 65.9).
fillpoint(r1, xy(697,68), 65.0).
fillpoint(r1, xy(525,67), 64.9).
fillpoint(r1, xy(685,67), 64.9).
fillpoint(r1, xy(695,67), 64.9).
fillpoint(r1, xy(699,67), 64.9).
fillpoint(r1, xy(707,67), 64.9).
fillpoint(r1, xy(67,164), 64.9).
fillpoint(r1, xy(67,225), 64.9).
fillpoint(r1, xy(345,95), 64.8).
fillpoint(r1, xy(343,96), 64.7).
fillpoint(r1, xy(340,97), 64.7).
fillpoint(r1, xy(529,66), 64.0).
fillpoint(r1, xy(690,66), 64.0).
fillpoint(r1, xy(66,168), 64.0).
fillpoint(r1, xy(66,220), 64.0).
fillpoint(r1, xy(534,65), 63.0).
fillpoint(r1, xy(65,173), 63.0).
fillpoint(r1, xy(65,216), 63.0).
fillpoint(r1, xy(64,177), 62.1).
fillpoint(r1, xy(64,211), 62.1).
fillpoint(r1, xy(653,63), 61.1).
fillpoint(r1, xy(63,182), 61.1).
fillpoint(r1, xy(63,206), 61.1).
fillpoint(r1, xy(542,62), 60.2).
fillpoint(r1, xy(649,62), 60.2).
fillpoint(r1, xy(62,187), 60.2).
fillpoint(r1, xy(62,202), 60.2).
fillpoint(r1, xy(274,301), 59.6).
fillpoint(r1, xy(278,292), 59.4).
fillpoint(r1, xy(275,299), 59.4).
fillpoint(r1, xy(277,294), 59.3).
fillpoint(r1, xy(276,297), 59.3).
fillpoint(r1, xy(547,61), 59.2).
fillpoint(r1, xy(644,61), 59.2).
fillpoint(r1, xy(61,191), 59.2).
fillpoint(r1, xy(61,197), 59.2).
fillpoint(r1, xy(190,302), 59.2).
fillpoint(r1, xy(271,302), 59.2).
fillpoint(r1, xy(607,281), 58.8).
fillpoint(r1, xy(610,288), 58.8).
fillpoint(r1, xy(613,295), 58.8).
fillpoint(r1, xy(604,274), 58.7).
fillpoint(r1, xy(606,279), 58.7).
fillpoint(r1, xy(609,286), 58.7).
fillpoint(r1, xy(611,290), 58.7).
fillpoint(r1, xy(614,297), 58.7).
fillpoint(r1, xy(616,302), 58.7).
fillpoint(r1, xy(605,276), 58.6).
fillpoint(r1, xy(608,283), 58.6).
fillpoint(r1, xy(612,293), 58.6).
fillpoint(r1, xy(615,300), 58.6).
fillpoint(r1, xy(551,60), 58.3).
fillpoint(r1, xy(639,60), 58.3).
fillpoint(r1, xy(195,303), 58.3).
fillpoint(r1, xy(266,303), 58.3).
fillpoint(r1, xy(443,188), 58.1).
fillpoint(r1, xy(442,186), 58.0).
fillpoint(r1, xy(441,184), 57.9).
fillpoint(r1, xy(556,59), 57.3).
fillpoint(r1, xy(635,59), 57.3).
fillpoint(r1, xy(427,153), 57.3).
fillpoint(r1, xy(430,160), 57.3).
fillpoint(r1, xy(431,162), 57.3).
fillpoint(r1, xy(433,167), 57.3).
fillpoint(r1, xy(434,169), 57.3).
fillpoint(r1, xy(437,176), 57.3).
fillpoint(r1, xy(200,304), 57.3).
fillpoint(r1, xy(262,304), 57.3).
fillpoint(r1, xy(623,304), 57.3).
fillpoint(r1, xy(426,151), 57.2).
fillpoint(r1, xy(428,155), 57.2).
fillpoint(r1, xy(429,158), 57.2).
fillpoint(r1, xy(432,164), 57.2).
fillpoint(r1, xy(435,171), 57.2).
fillpoint(r1, xy(436,174), 57.2).
fillpoint(r1, xy(438,178), 57.2).
fillpoint(r1, xy(560,58), 56.3).
fillpoint(r1, xy(630,58), 56.3).
fillpoint(r1, xy(795,116), 56.3).
fillpoint(r1, xy(204,305), 56.3).
fillpoint(r1, xy(257,305), 56.3).
fillpoint(r1, xy(627,305), 56.3).
fillpoint(r1, xy(635,185), 55.7).
fillpoint(r1, xy(565,57), 55.4).
fillpoint(r1, xy(626,57), 55.4).
fillpoint(r1, xy(796,121), 55.4).
fillpoint(r1, xy(209,306), 55.4).
fillpoint(r1, xy(253,306), 55.4).
fillpoint(r1, xy(632,306), 55.4).
fillpoint(r1, xy(570,56), 54.4).
fillpoint(r1, xy(621,56), 54.4).
fillpoint(r1, xy(797,126), 54.4).
fillpoint(r1, xy(213,307), 54.4).
fillpoint(r1, xy(248,307), 54.4).
fillpoint(r1, xy(636,307), 54.4).
fillpoint(r1, xy(574,55), 53.5).
fillpoint(r1, xy(616,55), 53.5).
fillpoint(r1, xy(218,308), 53.5).
fillpoint(r1, xy(243,308), 53.5).
fillpoint(r1, xy(641,308), 53.5).
fillpoint(r1, xy(579,54), 52.5).
fillpoint(r1, xy(610,54), 52.5).
fillpoint(r1, xy(223,309), 52.5).
fillpoint(r1, xy(239,309), 52.5).
fillpoint(r1, xy(646,309), 52.5).
fillpoint(r1, xy(587,271), 52.0).
fillpoint(r1, xy(589,272), 52.0).
fillpoint(r1, xy(585,53), 51.6).
fillpoint(r1, xy(604,53), 51.6).
fillpoint(r1, xy(583,269), 51.6).
fillpoint(r1, xy(227,310), 51.6).
fillpoint(r1, xy(234,310), 51.6).
fillpoint(r1, xy(650,310), 51.6).
fillpoint(r1, xy(580,267), 51.4).
fillpoint(r1, xy(578,266), 51.2).
fillpoint(r1, xy(502,52), 50.6).
fillpoint(r1, xy(591,52), 50.6).
fillpoint(r1, xy(599,52), 50.6).
fillpoint(r1, xy(522,230), 50.6).
fillpoint(r1, xy(655,311), 50.6).
fillpoint(r1, xy(525,231), 50.5).
fillpoint(r1, xy(573,263), 50.4).
fillpoint(r1, xy(571,262), 50.3).
fillpoint(r1, xy(528,233), 49.8).
fillpoint(r1, xy(530,234), 49.8).
fillpoint(r1, xy(498,51), 49.7).
fillpoint(r1, xy(595,52), 49.7).
fillpoint(r1, xy(660,312), 49.7).
fillpoint(r1, xy(533,236), 49.4).
fillpoint(r1, xy(566,259), 49.3).
fillpoint(r1, xy(543,241), 48.8).
fillpoint(r1, xy(541,240), 48.7).
fillpoint(r1, xy(545,242), 48.7).
fillpoint(r1, xy(538,239), 48.6).
fillpoint(r1, xy(653,169), 47.5).
fillpoint(r1, xy(552,247), 46.7).
fillpoint(r1, xy(550,246), 46.6).
fillpoint(r1, xy(636,209), 46.3).
fillpoint(r1, xy(556,249), 46.3).
fillpoint(r1, xy(557,252), 46.1).
fillpoint(r1, xy(636,211), 45.9).
fillpoint(r1, xy(488,45), 43.9).
fillpoint(r1, xy(261,44), 43.0).
fillpoint(r1, xy(483,44), 43.0).
fillpoint(r1, xy(505,105), 42.4).
fillpoint(r1, xy(196,233), 42.4).
fillpoint(r1, xy(193,240), 42.4).
fillpoint(r1, xy(331,273), 42.4).
fillpoint(r1, xy(328,274), 42.4).
fillpoint(r1, xy(321,277), 42.4).
fillpoint(r1, xy(312,281), 42.4).
fillpoint(r1, xy(305,284), 42.4).
fillpoint(r1, xy(715,288), 42.4).
fillpoint(r1, xy(507,100), 42.3).
fillpoint(r1, xy(506,103), 42.3).
fillpoint(r1, xy(197,231), 42.3).
fillpoint(r1, xy(195,235), 42.3).
fillpoint(r1, xy(194,238), 42.3).
fillpoint(r1, xy(192,242), 42.3).
fillpoint(r1, xy(326,275), 42.3).
fillpoint(r1, xy(323,276), 42.3).
fillpoint(r1, xy(319,278), 42.3).
fillpoint(r1, xy(314,280), 42.3).
fillpoint(r1, xy(310,282), 42.3).
fillpoint(r1, xy(307,283), 42.3).
fillpoint(r1, xy(198,228), 42.2).
fillpoint(r1, xy(191,245), 42.2).
fillpoint(r1, xy(317,279), 42.2).
fillpoint(r1, xy(197,43), 42.0).
fillpoint(r1, xy(256,43), 42.0).
fillpoint(r1, xy(479,43), 42.0).
fillpoint(r1, xy(201,42), 41.1).
fillpoint(r1, xy(252,42), 41.1).
fillpoint(r1, xy(474,42), 41.1).
fillpoint(r1, xy(206,41), 40.1).
fillpoint(r1, xy(247,41), 40.1).
fillpoint(r1, xy(267,51), 40.1).
fillpoint(r1, xy(570,154), 39.5).
fillpoint(r1, xy(602,178), 39.4).
fillpoint(r1, xy(604,179), 39.3).
fillpoint(r1, xy(211,40), 39.2).
fillpoint(r1, xy(242,40), 39.2).
fillpoint(r1, xy(628,227), 39.1).
fillpoint(r1, xy(625,234), 39.1).
fillpoint(r1, xy(622,241), 39.1).
fillpoint(r1, xy(629,225), 39.0).
fillpoint(r1, xy(626,232), 39.0).
fillpoint(r1, xy(624,236), 39.0).
fillpoint(r1, xy(621,243), 39.0).
fillpoint(r1, xy(681,299), 39.0).
fillpoint(r1, xy(627,229), 38.9).
fillpoint(r1, xy(623,239), 38.9).
fillpoint(r1, xy(302,134), 38.6).
fillpoint(r1, xy(301,137), 38.6).
fillpoint(r1, xy(298,81), 38.5).
fillpoint(r1, xy(266,245), 38.4).
fillpoint(r1, xy(269,252), 38.4).
fillpoint(r1, xy(265,243), 38.3).
fillpoint(r1, xy(270,254), 38.3).
fillpoint(r1, xy(215,39), 38.2).
fillpoint(r1, xy(237,39), 38.2).
fillpoint(r1, xy(267,247), 38.2).
fillpoint(r1, xy(268,250), 38.2).
fillpoint(r1, xy(487,324), 38.2).
fillpoint(r1, xy(272,58), 38.1).
fillpoint(r1, xy(704,290), 38.1).
fillpoint(r1, xy(699,292), 38.1).
fillpoint(r1, xy(697,293), 38.1).
fillpoint(r1, xy(692,295), 38.1).
fillpoint(r1, xy(690,296), 38.1).
fillpoint(r1, xy(685,298), 38.1).
fillpoint(r1, xy(295,79), 38.0).
fillpoint(r1, xy(701,291), 38.0).
fillpoint(r1, xy(695,294), 38.0).
fillpoint(r1, xy(688,297), 38.0).
fillpoint(r1, xy(220,38), 37.2).
fillpoint(r1, xy(230,38), 37.2).
fillpoint(r1, xy(596,173), 37.2).
fillpoint(r1, xy(492,325), 37.2).
fillpoint(r1, xy(592,171), 36.9).
fillpoint(r1, xy(354,212), 36.8).
fillpoint(r1, xy(577,162), 36.7).
fillpoint(r1, xy(355,214), 36.7).
fillpoint(r1, xy(291,76), 36.6).
fillpoint(r1, xy(352,207), 36.6).
fillpoint(r1, xy(353,210), 36.6).
fillpoint(r1, xy(225,37), 36.3).
fillpoint(r1, xy(586,168), 36.3).
fillpoint(r1, xy(497,326), 36.3).
fillpoint(r1, xy(584,167), 36.1).
fillpoint(r1, xy(278,66), 35.9).
fillpoint(r1, xy(581,165), 35.7).
fillpoint(r1, xy(817,157), 35.3).
fillpoint(r1, xy(501,327), 35.3).
fillpoint(r1, xy(283,70), 34.4).
fillpoint(r1, xy(818,162), 34.4).
fillpoint(r1, xy(506,328), 34.4).
fillpoint(r1, xy(515,328), 34.1).
fillpoint(r1, xy(819,167), 33.4).
fillpoint(r1, xy(819,226), 33.4).
fillpoint(r1, xy(511,329), 33.4).
fillpoint(r1, xy(820,171), 32.5).
fillpoint(r1, xy(820,221), 32.5).
fillpoint(r1, xy(521,330), 32.5).
fillpoint(r1, xy(821,176), 31.5).
fillpoint(r1, xy(821,216), 31.5).
fillpoint(r1, xy(524,331), 31.5).
fillpoint(r1, xy(531,159), 31.0).
fillpoint(r1, xy(821,194), 30.9).
fillpoint(r1, xy(822,183), 30.6).
fillpoint(r1, xy(822,191), 30.6).
fillpoint(r1, xy(822,197), 30.6).
fillpoint(r1, xy(822,212), 30.6).
fillpoint(r1, xy(528,332), 30.6).
fillpoint(r1, xy(823,201), 29.6).
fillpoint(r1, xy(823,207), 29.6).
fillpoint(r1, xy(535,334), 28.6).
fillpoint(r1, xy(510,131), 28.3).
fillpoint(r1, xy(511,133), 28.3).
fillpoint(r1, xy(545,156), 28.1).
fillpoint(r1, xy(540,158), 28.1).
fillpoint(r1, xy(543,157), 28.0).
fillpoint(r1, xy(512,135), 27.9).
fillpoint(r1, xy(450,52), 27.7).
fillpoint(r1, xy(443,55), 27.7).
fillpoint(r1, xy(538,335), 27.7).
fillpoint(r1, xy(455,50), 27.6).
fillpoint(r1, xy(452,51), 27.6).
fillpoint(r1, xy(448,53), 27.6).
fillpoint(r1, xy(445,54), 27.6).
fillpoint(r1, xy(441,56), 27.6).
fillpoint(r1, xy(438,57), 27.6).
fillpoint(r1, xy(514,138), 27.6).
fillpoint(r1, xy(516,142), 27.1).
fillpoint(r1, xy(323,199), 27.1).
fillpoint(r1, xy(332,203), 27.1).
fillpoint(r1, xy(325,200), 27.0).
fillpoint(r1, xy(330,202), 27.0).
fillpoint(r1, xy(328,201), 26.9).
fillpoint(r1, xy(464,118), 26.7).
fillpoint(r1, xy(664,128), 26.6).
fillpoint(r1, xy(663,131), 26.6).
fillpoint(r1, xy(480,112), 26.2).
fillpoint(r1, xy(475,114), 26.2).
fillpoint(r1, xy(473,115), 26.2).
fillpoint(r1, xy(468,117), 26.2).
fillpoint(r1, xy(477,113), 26.1).
fillpoint(r1, xy(471,116), 26.1).
fillpoint(r1, xy(519,146), 26.1).
fillpoint(r1, xy(358,185), 25.9).
fillpoint(r1, xy(349,337), 25.8).
fillpoint(r1, xy(357,187), 25.7).
fillpoint(r1, xy(520,148), 25.6).
fillpoint(r1, xy(315,338), 24.8).
fillpoint(r1, xy(344,338), 24.8).
fillpoint(r1, xy(547,338), 24.8).
fillpoint(r1, xy(576,338), 24.8).
fillpoint(r1, xy(559,115), 24.7).
fillpoint(r1, xy(561,120), 24.7).
fillpoint(r1, xy(562,122), 24.7).
fillpoint(r1, xy(564,127), 24.7).
fillpoint(r1, xy(527,169), 24.7).
fillpoint(r1, xy(524,176), 24.7).
fillpoint(r1, xy(521,183), 24.7).
fillpoint(r1, xy(560,118), 24.6).
fillpoint(r1, xy(563,124), 24.6).
fillpoint(r1, xy(526,171), 24.6).
fillpoint(r1, xy(525,174), 24.6).
fillpoint(r1, xy(523,178), 24.6).
fillpoint(r1, xy(522,181), 24.6).
border(r1).
region(r73, '#7a8082', 8, centroid(606,138)).
perimeter(r73, 12).
polygon(r73, [xy(605,137),xy(608,138),xy(605,137)]).
midline(r73, [xy(607,137),xy(606,137)]).
region(r36, '#938e89', 6, centroid(464,90)).
perimeter(r36, 14).
polygon(r36, [xy(462,90),xy(467,90),xy(462,90)]).
midline(r36, [xy(467,90),xy(462,90)]).

adjacent(r1, r36).
shared_edge(r1, r36, 14).
adjacent(r1, r73).
shared_edge(r1, r73, 12).

encloses(r1, r36).
encloses(r1, r73).

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
opencv_component(cc1, [r36]).
opencv_component_area(cc1, 6).
opencv_component_centroid(cc1, centroid(464,90)).
opencv_component(cc2, [r73]).
opencv_component_area(cc2, 8).
opencv_component_centroid(cc2, centroid(606,138)).
opencv_morphology(r1, opening_area(310402), closing_area(313191), gradient_area(6209)).
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
opencv_contour(r1, c6, hole, 4.0).
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
opencv_contour(r1, c21, hole, 4.0).
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
opencv_contour(r1, c28, hole, 5.5).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 2.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 2.0).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 2.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 2.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 4.0).
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
opencv_contour(r1, c44, hole, 4.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 15.5).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 4.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 111.0).
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
opencv_contour(r1, c53, hole, 12.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 2.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 2.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 2.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 4.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 4.0).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 2.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 2.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 2.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 2.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 7.0).
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
opencv_contour(r1, c70, hole, 6.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 10.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 2.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 2.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 4.0).
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
opencv_contour(r1, c96, hole, 4.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 2.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 2.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 4.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 2.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 4.0).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 2.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 2.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 4.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 6.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 2.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 2.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 2.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 2.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 12.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 4.0).
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
opencv_contour(r1, c117, hole, 5.5).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 8.5).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 2.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 2.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 10.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 6.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 2.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 4.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 4.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 4.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 2.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 2.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 2.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 5.5).
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
opencv_contour(r1, c136, hole, 4.0).
opencv_contour_hierarchy(r1, c136, next(c137), previous(c135), child(none), parent(c0)).
opencv_contour(r1, c137, hole, 2.0).
opencv_contour_hierarchy(r1, c137, next(c138), previous(c136), child(none), parent(c0)).
opencv_contour(r1, c138, hole, 4.0).
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
opencv_contour(r1, c150, hole, 2.0).
opencv_contour_hierarchy(r1, c150, next(c151), previous(c149), child(none), parent(c0)).
opencv_contour(r1, c151, hole, 2.0).
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
opencv_contour(r1, c158, hole, 4.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 4.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 4.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 2.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 4.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 4.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 4.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 4.0).
opencv_contour_hierarchy(r1, c165, next(c166), previous(c164), child(none), parent(c0)).
opencv_contour(r1, c166, hole, 2.0).
opencv_contour_hierarchy(r1, c166, next(c167), previous(c165), child(none), parent(c0)).
opencv_contour(r1, c167, hole, 4.0).
opencv_contour_hierarchy(r1, c167, next(c168), previous(c166), child(none), parent(c0)).
opencv_contour(r1, c168, hole, 4.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 2.0).
opencv_contour_hierarchy(r1, c169, next(c170), previous(c168), child(none), parent(c0)).
opencv_contour(r1, c170, hole, 2.0).
opencv_contour_hierarchy(r1, c170, next(c171), previous(c169), child(none), parent(c0)).
opencv_contour(r1, c171, hole, 2.0).
opencv_contour_hierarchy(r1, c171, next(c172), previous(c170), child(none), parent(c0)).
opencv_contour(r1, c172, hole, 2.0).
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
opencv_contour(r1, c178, hole, 2.0).
opencv_contour_hierarchy(r1, c178, next(c179), previous(c177), child(none), parent(c0)).
opencv_contour(r1, c179, hole, 2.0).
opencv_contour_hierarchy(r1, c179, next(c180), previous(c178), child(none), parent(c0)).
opencv_contour(r1, c180, hole, 13.0).
opencv_contour_hierarchy(r1, c180, next(c181), previous(c179), child(none), parent(c0)).
opencv_contour(r1, c181, hole, 2.0).
opencv_contour_hierarchy(r1, c181, next(c182), previous(c180), child(none), parent(c0)).
opencv_contour(r1, c182, hole, 2.0).
opencv_contour_hierarchy(r1, c182, next(c183), previous(c181), child(none), parent(c0)).
opencv_contour(r1, c183, hole, 8.5).
opencv_contour_hierarchy(r1, c183, next(c184), previous(c182), child(none), parent(c0)).
opencv_contour(r1, c184, hole, 2.0).
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
opencv_contour(r1, c190, hole, 4.0).
opencv_contour_hierarchy(r1, c190, next(c191), previous(c189), child(none), parent(c0)).
opencv_contour(r1, c191, hole, 2.0).
opencv_contour_hierarchy(r1, c191, next(c192), previous(c190), child(none), parent(c0)).
opencv_contour(r1, c192, hole, 4.0).
opencv_contour_hierarchy(r1, c192, next(c193), previous(c191), child(none), parent(c0)).
opencv_contour(r1, c193, hole, 2.0).
opencv_contour_hierarchy(r1, c193, next(c194), previous(c192), child(none), parent(c0)).
opencv_contour(r1, c194, hole, 2.0).
opencv_contour_hierarchy(r1, c194, next(c195), previous(c193), child(none), parent(c0)).
opencv_contour(r1, c195, hole, 2.0).
opencv_contour_hierarchy(r1, c195, next(c196), previous(c194), child(none), parent(c0)).
opencv_contour(r1, c196, hole, 2.0).
opencv_contour_hierarchy(r1, c196, next(c197), previous(c195), child(none), parent(c0)).
opencv_contour(r1, c197, hole, 2.0).
opencv_contour_hierarchy(r1, c197, next(c198), previous(c196), child(none), parent(c0)).
opencv_contour(r1, c198, hole, 2.0).
opencv_contour_hierarchy(r1, c198, next(c199), previous(c197), child(none), parent(c0)).
opencv_contour(r1, c199, hole, 2.0).
opencv_contour_hierarchy(r1, c199, next(c200), previous(c198), child(none), parent(c0)).
opencv_contour(r1, c200, hole, 2.0).
opencv_contour_hierarchy(r1, c200, next(c201), previous(c199), child(none), parent(c0)).
opencv_contour(r1, c201, hole, 2.0).
opencv_contour_hierarchy(r1, c201, next(c202), previous(c200), child(none), parent(c0)).
opencv_contour(r1, c202, hole, 2.0).
opencv_contour_hierarchy(r1, c202, next(c203), previous(c201), child(none), parent(c0)).
opencv_contour(r1, c203, hole, 4.0).
opencv_contour_hierarchy(r1, c203, next(c204), previous(c202), child(none), parent(c0)).
opencv_contour(r1, c204, hole, 13.0).
opencv_contour_hierarchy(r1, c204, next(c205), previous(c203), child(none), parent(c0)).
opencv_contour(r1, c205, hole, 2.0).
opencv_contour_hierarchy(r1, c205, next(c206), previous(c204), child(none), parent(c0)).
opencv_contour(r1, c206, hole, 2.0).
opencv_contour_hierarchy(r1, c206, next(c207), previous(c205), child(none), parent(c0)).
opencv_contour(r1, c207, hole, 2.0).
opencv_contour_hierarchy(r1, c207, next(c208), previous(c206), child(none), parent(c0)).
opencv_contour(r1, c208, hole, 2.0).
opencv_contour_hierarchy(r1, c208, next(c209), previous(c207), child(none), parent(c0)).
opencv_contour(r1, c209, hole, 2.0).
opencv_contour_hierarchy(r1, c209, next(c210), previous(c208), child(none), parent(c0)).
opencv_contour(r1, c210, hole, 2.0).
opencv_contour_hierarchy(r1, c210, next(c211), previous(c209), child(none), parent(c0)).
opencv_contour(r1, c211, hole, 12.0).
opencv_contour_hierarchy(r1, c211, next(c212), previous(c210), child(none), parent(c0)).
opencv_contour(r1, c212, hole, 2.0).
opencv_contour_hierarchy(r1, c212, next(c213), previous(c211), child(none), parent(c0)).
opencv_contour(r1, c213, hole, 2.0).
opencv_contour_hierarchy(r1, c213, next(c214), previous(c212), child(none), parent(c0)).
opencv_contour(r1, c214, hole, 2.0).
opencv_contour_hierarchy(r1, c214, next(c215), previous(c213), child(none), parent(c0)).
opencv_contour(r1, c215, hole, 2.0).
opencv_contour_hierarchy(r1, c215, next(c216), previous(c214), child(none), parent(c0)).
opencv_contour(r1, c216, hole, 2.0).
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
opencv_contour(r1, c225, hole, 2.0).
opencv_contour_hierarchy(r1, c225, next(c226), previous(c224), child(none), parent(c0)).
opencv_contour(r1, c226, hole, 2.0).
opencv_contour_hierarchy(r1, c226, next(c227), previous(c225), child(none), parent(c0)).
opencv_contour(r1, c227, hole, 2.0).
opencv_contour_hierarchy(r1, c227, next(c228), previous(c226), child(none), parent(c0)).
opencv_contour(r1, c228, hole, 2.0).
opencv_contour_hierarchy(r1, c228, next(c229), previous(c227), child(none), parent(c0)).
opencv_contour(r1, c229, hole, 2.0).
opencv_contour_hierarchy(r1, c229, next(c230), previous(c228), child(none), parent(c0)).
opencv_contour(r1, c230, hole, 2.0).
opencv_contour_hierarchy(r1, c230, next(c231), previous(c229), child(none), parent(c0)).
opencv_contour(r1, c231, hole, 2.0).
opencv_contour_hierarchy(r1, c231, next(c232), previous(c230), child(none), parent(c0)).
opencv_contour(r1, c232, hole, 2.0).
opencv_contour_hierarchy(r1, c232, next(c233), previous(c231), child(none), parent(c0)).
opencv_contour(r1, c233, hole, 2.0).
opencv_contour_hierarchy(r1, c233, next(c234), previous(c232), child(none), parent(c0)).
opencv_contour(r1, c234, hole, 2.0).
opencv_contour_hierarchy(r1, c234, next(c235), previous(c233), child(none), parent(c0)).
opencv_contour(r1, c235, hole, 2.0).
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
opencv_contour(r1, c241, hole, 2.0).
opencv_contour_hierarchy(r1, c241, next(c242), previous(c240), child(none), parent(c0)).
opencv_contour(r1, c242, hole, 2.0).
opencv_contour_hierarchy(r1, c242, next(c243), previous(c241), child(none), parent(c0)).
opencv_contour(r1, c243, hole, 2.0).
opencv_contour_hierarchy(r1, c243, next(c244), previous(c242), child(none), parent(c0)).
opencv_contour(r1, c244, hole, 2.0).
opencv_contour_hierarchy(r1, c244, next(c245), previous(c243), child(none), parent(c0)).
opencv_contour(r1, c245, hole, 2.0).
opencv_contour_hierarchy(r1, c245, next(none), previous(c244), child(none), parent(c0)).
opencv_morphology(r36, opening_area(0), closing_area(14), gradient_area(20)).
opencv_shape_metrics(r36, contour_area(0.0), hull_area(0.0), solidity(0.0), circularity(0.0), extent(0.0), aspect_ratio(6.0)).
opencv_contour(r36, c0, outer, 0.0).
opencv_contour_hierarchy(r36, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r73, opening_area(0), closing_area(12), gradient_area(20)).
opencv_shape_metrics(r73, contour_area(3.0), hull_area(3.0), solidity(1.0), circularity(0.589049), extent(0.375), aspect_ratio(2.0)).
opencv_contour(r73, c0, outer, 3.0).
opencv_contour_hierarchy(r73, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r36, 1).
opencv_watershed_segment(r36, ws1, 6, centroid(464,90)).
opencv_watershed_count(r73, 1).
opencv_watershed_segment(r73, ws1, 8, centroid(607,137)).
