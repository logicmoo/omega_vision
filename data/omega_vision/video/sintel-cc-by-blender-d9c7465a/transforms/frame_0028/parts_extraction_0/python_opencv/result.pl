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

region(r1, '#312b21', 310258, centroid(426,181)).
perimeter(r1, 3622).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(648,0),xy(647,4),xy(642,3),xy(640,0),xy(0,0)]).
hole(r1, [xy(556,328),xy(561,330),xy(557,331),xy(556,328)]).
hole(r1, [xy(563,327),xy(565,327),xy(563,327)]).
hole(r1, [xy(564,326),xy(566,326),xy(564,326)]).
hole(r1, [xy(555,326),xy(557,327),xy(555,326)]).
hole(r1, [xy(502,323),xy(504,323),xy(502,323)]).
hole(r1, [xy(503,322),xy(506,322),xy(503,322)]).
hole(r1, [xy(505,321),xy(508,321),xy(505,321)]).
hole(r1, [xy(507,320),xy(509,320),xy(507,320)]).
hole(r1, [xy(508,319),xy(510,319),xy(508,319)]).
hole(r1, [xy(509,318),xy(511,318),xy(509,318)]).
hole(r1, [xy(580,317),xy(568,326),xy(566,325),xy(576,317),xy(580,317)]).
hole(r1, [xy(510,317),xy(513,317),xy(510,317)]).
hole(r1, [xy(553,315),xy(554,320),xy(552,319),xy(553,315)]).
hole(r1, [xy(512,316),xy(514,316),xy(512,316)]).
hole(r1, [xy(583,313),xy(580,317),xy(583,313)]).
hole(r1, [xy(551,314),xy(553,315),xy(551,314)]).
hole(r1, [xy(584,312),xy(587,312),xy(584,312)]).
hole(r1, [xy(587,310),xy(590,310),xy(587,310)]).
hole(r1, [xy(523,308),xy(525,308),xy(523,308)]).
hole(r1, [xy(525,304),xy(525,308),xy(525,304)]).
hole(r1, [xy(523,304),xy(525,304),xy(523,304)]).
hole(r1, [xy(541,299),xy(546,303),xy(552,312),xy(551,314),xy(541,302),xy(541,299)]).
hole(r1, [xy(562,270),xy(563,272),xy(558,280),xy(538,296),xy(541,299),xy(536,299),xy(535,296),xy(551,283),xy(562,270)]).
hole(r1, [xy(787,266),xy(792,265),xy(793,269),xy(788,270),xy(787,266)]).
hole(r1, [xy(736,264),xy(745,263),xy(746,272),xy(741,272),xy(736,267),xy(736,264)]).
hole(r1, [xy(784,251),xy(786,251),xy(784,251)]).
hole(r1, [xy(742,222),xy(744,222),xy(742,222)]).
hole(r1, [xy(740,221),xy(743,221),xy(740,221)]).
hole(r1, [xy(739,220),xy(741,220),xy(739,220)]).
hole(r1, [xy(715,219),xy(717,219),xy(715,219)]).
hole(r1, [xy(737,218),xy(739,217),xy(740,219),xy(738,220),xy(737,218)]).
hole(r1, [xy(713,218),xy(716,218),xy(713,218)]).
hole(r1, [xy(735,217),xy(738,217),xy(735,217)]).
hole(r1, [xy(692,212),xy(693,214),xy(691,215),xy(692,212)]).
hole(r1, [xy(728,212),xy(730,211),xy(736,216),xy(734,217),xy(728,212)]).
hole(r1, [xy(692,212),xy(694,212),xy(692,212)]).
hole(r1, [xy(704,211),xy(706,210),xy(714,217),xy(712,218),xy(704,211)]).
hole(r1, [xy(723,208),xy(725,207),xy(729,211),xy(727,212),xy(723,208)]).
hole(r1, [xy(700,208),xy(702,207),xy(705,210),xy(703,211),xy(700,208)]).
hole(r1, [xy(695,207),xy(696,210),xy(694,212),xy(695,207)]).
hole(r1, [xy(655,208),xy(657,208),xy(655,208)]).
hole(r1, [xy(699,207),xy(701,207),xy(699,207)]).
hole(r1, [xy(698,206),xy(700,206),xy(698,206)]).
hole(r1, [xy(657,206),xy(659,207),xy(657,206)]).
hole(r1, [xy(718,204),xy(720,203),xy(724,207),xy(722,208),xy(718,204)]).
hole(r1, [xy(714,201),xy(716,200),xy(719,203),xy(717,204),xy(714,201)]).
hole(r1, [xy(713,200),xy(715,200),xy(713,200)]).
hole(r1, [xy(708,196),xy(710,195),xy(714,199),xy(712,200),xy(708,196)]).
hole(r1, [xy(705,193),xy(707,192),xy(709,195),xy(705,193)]).
hole(r1, [xy(701,190),xy(703,189),xy(706,192),xy(704,193),xy(701,190)]).
hole(r1, [xy(697,187),xy(699,186),xy(702,189),xy(700,190),xy(697,187)]).
hole(r1, [xy(698,183),xy(700,183),xy(698,183)]).
hole(r1, [xy(661,182),xy(663,182),xy(661,182)]).
hole(r1, [xy(660,181),xy(662,181),xy(660,181)]).
hole(r1, [xy(658,178),xy(660,177),xy(661,180),xy(659,181),xy(658,178)]).
hole(r1, [xy(701,175),xy(701,179),xy(701,175)]).
hole(r1, [xy(664,176),xy(666,176),xy(664,176)]).
hole(r1, [xy(651,160),xy(653,160),xy(651,160)]).
hole(r1, [xy(656,158),xy(658,158),xy(656,158)]).
hole(r1, [xy(699,154),xy(702,155),xy(700,156),xy(699,154)]).
hole(r1, [xy(667,152),xy(668,154),xy(665,156),xy(667,152)]).
hole(r1, [xy(697,152),xy(699,151),xy(700,153),xy(698,154),xy(697,152)]).
hole(r1, [xy(656,151),xy(655,154),xy(648,158),xy(648,160),xy(652,161),xy(647,162),xy(645,157),xy(656,151)]).
hole(r1, [xy(692,151),xy(698,151),xy(692,151)]).
hole(r1, [xy(685,150),xy(688,151),xy(686,152),xy(685,150)]).
hole(r1, [xy(677,149),xy(679,149),xy(677,149)]).
hole(r1, [xy(678,148),xy(684,147),xy(686,149),xy(678,148)]).
hole(r1, [xy(635,147),xy(636,145),xy(640,146),xy(635,147)]).
hole(r1, [xy(639,145),xy(641,145),xy(639,145)]).
hole(r1, [xy(631,143),xy(633,142),xy(636,145),xy(634,146),xy(631,143)]).
hole(r1, [xy(665,138),xy(667,146),xy(657,152),xy(657,150),xy(664,146),xy(665,138)]).
hole(r1, [xy(663,138),xy(665,138),xy(663,138)]).
hole(r1, [xy(662,137),xy(664,137),xy(662,137)]).
hole(r1, [xy(561,96),xy(563,96),xy(561,96)]).
hole(r1, [xy(550,83),xy(557,92),xy(556,94),xy(549,85),xy(550,83)]).
hole(r1, [xy(548,83),xy(550,83),xy(548,83)]).
hole(r1, [xy(547,82),xy(549,82),xy(547,82)]).
hole(r1, [xy(545,81),xy(548,81),xy(545,81)]).
hole(r1, [xy(544,80),xy(546,80),xy(544,80)]).
hole(r1, [xy(543,79),xy(545,79),xy(543,79)]).
hole(r1, [xy(542,78),xy(544,78),xy(542,78)]).
hole(r1, [xy(541,77),xy(543,77),xy(541,77)]).
hole(r1, [xy(540,74),xy(542,74),xy(540,74)]).
hole(r1, [xy(539,73),xy(541,73),xy(539,73)]).
hole(r1, [xy(537,70),xy(540,71),xy(538,72),xy(537,70)]).
hole(r1, [xy(530,67),xy(532,67),xy(530,67)]).
hole(r1, [xy(737,64),xy(739,64),xy(737,64)]).
hole(r1, [xy(527,64),xy(530,66),xy(527,64)]).
hole(r1, [xy(704,63),xy(706,63),xy(704,63)]).
hole(r1, [xy(526,62),xy(528,63),xy(526,62)]).
hole(r1, [xy(755,61),xy(757,61),xy(755,61)]).
hole(r1, [xy(665,61),xy(683,62),xy(672,63),xy(665,61)]).
hole(r1, [xy(525,61),xy(527,61),xy(525,61)]).
hole(r1, [xy(756,60),xy(758,60),xy(756,60)]).
hole(r1, [xy(653,60),xy(656,60),xy(653,60)]).
hole(r1, [xy(524,58),xy(526,58),xy(524,58)]).
hole(r1, [xy(763,57),xy(764,55),xy(766,56),xy(763,57)]).
hole(r1, [xy(765,55),xy(767,53),xy(770,54),xy(765,55)]).
hole(r1, [xy(769,53),xy(771,53),xy(769,53)]).
hole(r1, [xy(519,53),xy(521,52),xy(525,57),xy(519,53)]).
hole(r1, [xy(771,52),xy(773,52),xy(771,52)]).
hole(r1, [xy(516,51),xy(520,52),xy(516,51)]).
hole(r1, [xy(514,50),xy(517,50),xy(514,50)]).
hole(r1, [xy(776,49),xy(778,49),xy(776,49)]).
hole(r1, [xy(513,49),xy(515,49),xy(513,49)]).
hole(r1, [xy(783,41),xy(784,47),xy(779,49),xy(778,47),xy(782,46),xy(781,42),xy(783,41)]).
hole(r1, [xy(780,30),xy(782,30),xy(780,30)]).
midline(r1, [xy(182,181),xy(324,180),xy(482,340),xy(489,339),xy(490,342),xy(526,342),xy(528,339),xy(508,319),xy(506,318),xy(505,319),xy(505,321),xy(506,323),xy(505,324),xy(503,322),xy(502,322),xy(502,326),xy(490,339),xy(502,327)]).
midline(r1, [xy(506,317),xy(351,161),xy(343,161),xy(325,180),xy(343,162)]).
midline(r1, [xy(506,319),xy(508,321),xy(510,320),xy(509,317),xy(510,317),xy(511,318),xy(511,319)]).
midline(r1, [xy(503,324),xy(504,324)]).
midline(r1, [xy(528,341),xy(531,338),xy(528,324),xy(520,316),xy(519,312),xy(512,315),xy(512,316),xy(513,317),xy(514,316),xy(514,317)]).
midline(r1, [xy(516,315),xy(518,313)]).
midline(r1, [xy(519,311),xy(519,307),xy(403,191),xy(397,187),xy(382,184),xy(356,158),xy(352,160)]).
midline(r1, [xy(519,306),xy(522,306),xy(523,303),xy(525,303),xy(524,307)]).
midline(r1, [xy(530,341),xy(535,340),xy(540,347),xy(578,346),xy(579,344),xy(565,330),xy(563,327),xy(562,323),xy(556,328),xy(548,327),xy(536,340),xy(548,328)]).
midline(r1, [xy(561,324),xy(558,327)]).
midline(r1, [xy(580,344),xy(589,344),xy(601,341),xy(602,339),xy(579,316),xy(566,302),xy(555,313),xy(552,313),xy(550,314),xy(532,333),xy(548,317)]).
midline(r1, [xy(566,301),xy(565,298),xy(544,296),xy(533,307),xy(530,300),xy(416,186),xy(408,186),xy(404,191),xy(408,187)]).
midline(r1, [xy(563,306),xy(556,313)]).
midline(r1, [xy(540,301),xy(533,308),xy(535,317),xy(529,324),xy(535,318)]).
midline(r1, [xy(567,299),xy(574,293),xy(581,291),xy(613,258),xy(610,250),xy(610,222),xy(604,216),xy(592,216),xy(584,209),xy(569,207),xy(544,182),xy(471,182),xy(462,186),xy(443,184),xy(438,179),xy(429,182),xy(420,181),xy(417,185),xy(420,182)]).
midline(r1, [xy(571,299),xy(608,337),xy(603,340)]).
midline(r1, [xy(573,296),xy(612,336),xy(608,339)]).
midline(r1, [xy(613,337),xy(617,336),xy(662,291),xy(640,265),xy(639,258),xy(613,259)]).
midline(r1, [xy(562,322),xy(560,320),xy(557,323),xy(551,323),xy(549,326),xy(551,324)]).
midline(r1, [xy(561,319),xy(565,305)]).
midline(r1, [xy(559,322),xy(560,321)]).
midline(r1, [xy(550,316),xy(554,315)]).
midline(r1, [xy(508,25),xy(487,27),xy(357,158),xy(487,28)]).
midline(r1, [xy(509,25),xy(544,26),xy(520,52),xy(388,184),xy(519,54)]).
midline(r1, [xy(495,26),xy(513,46),xy(513,50),xy(515,49),xy(514,48),xy(517,48),xy(517,50),xy(384,183),xy(516,52)]).
midline(r1, [xy(521,50),xy(545,26),xy(552,27),xy(555,31),xy(528,58),xy(525,57),xy(524,58),xy(525,62),xy(521,63),xy(398,186),xy(521,64)]).
midline(r1, [xy(530,57),xy(556,31),xy(559,32),xy(527,64),xy(525,64)]).
midline(r1, [xy(529,63),xy(560,32),xy(564,34),xy(533,66),xy(530,66),xy(532,71),xy(423,180),xy(531,73)]).
midline(r1, [xy(534,66),xy(565,35),xy(575,35),xy(579,40),xy(545,74),xy(543,75),xy(540,72),xy(539,72),xy(541,77),xy(439,179),xy(538,80)]).
midline(r1, [xy(541,72),xy(542,73)]).
midline(r1, [xy(546,74),xy(580,40),xy(588,40),xy(589,42),xy(448,183),xy(549,84),xy(590,42),xy(597,43),xy(605,52),xy(605,93),xy(602,96),xy(561,95),xy(561,97),xy(563,97)]).
midline(r1, [xy(603,96),xy(606,94),xy(613,101),xy(629,100),xy(649,122),xy(649,130),xy(636,145),xy(573,207),xy(634,147)]).
midline(r1, [xy(637,143),xy(650,131),xy(647,140),xy(639,144),xy(639,145),xy(641,146)]).
midline(r1, [xy(644,143),xy(643,144)]).
midline(r1, [xy(650,123),xy(662,135),xy(663,139),xy(664,139),xy(665,138),xy(663,136),xy(665,137)]).
midline(r1, [xy(630,100),xy(660,71),xy(661,32),xy(627,31),xy(606,52),xy(625,33)]).
midline(r1, [xy(633,101),xy(705,101),xy(708,104),xy(673,140),xy(672,150),xy(664,151),xy(660,155),xy(647,141),xy(644,149),xy(585,208),xy(640,153)]).
midline(r1, [xy(644,150),xy(643,151)]).
midline(r1, [xy(662,155),xy(659,159),xy(657,157),xy(655,160),xy(651,159),xy(651,160),xy(652,161),xy(653,160),xy(653,161)]).
midline(r1, [xy(674,140),xy(709,105),xy(724,105),xy(727,103),xy(723,98),xy(723,64),xy(706,62),xy(704,62),xy(704,64),xy(706,64)]).
midline(r1, [xy(661,31),xy(713,30),xy(723,39),xy(724,64),xy(737,63),xy(737,65),xy(738,65),xy(739,64),xy(738,61),xy(755,60),xy(755,62),xy(756,62),xy(757,61),xy(756,59),xy(758,59),xy(757,62)]).
midline(r1, [xy(728,102),xy(732,104),xy(689,147),xy(688,147),xy(685,150),xy(684,150),xy(676,158),xy(673,150)]).
midline(r1, [xy(684,151),xy(676,159),xy(683,169),xy(679,174),xy(671,166),xy(661,166),xy(658,160),xy(656,160)]).
midline(r1, [xy(687,149),xy(688,148)]).
midline(r1, [xy(690,147),xy(690,158),xy(683,165),xy(690,159)]).
midline(r1, [xy(696,140),xy(691,145)]).
midline(r1, [xy(526,58),xy(527,60),xy(527,61),xy(526,62)]).
midline(r1, [xy(823,265),xy(823,235),xy(799,211),xy(766,245),xy(766,290),xy(792,316),xy(790,318),xy(697,318),xy(688,315),xy(663,290),xy(721,234),xy(721,227),xy(713,219),xy(714,215),xy(717,212),xy(710,205),xy(704,201),xy(688,198),xy(679,189),xy(675,193),xy(661,183)]).
midline(r1, [xy(715,241),xy(760,242),xy(761,240),xy(742,223)]).
midline(r1, [xy(707,204),xy(705,210),xy(700,215),xy(698,212),xy(698,205),xy(699,201)]).
midline(r1, [xy(704,212),xy(701,215)]).
midline(r1, [xy(677,193),xy(675,196),xy(675,222),xy(640,257),xy(674,224)]).
midline(r1, [xy(676,196),xy(693,213),xy(698,217),xy(699,215)]).
midline(r1, [xy(679,188),xy(678,176),xy(664,175),xy(664,177),xy(666,177)]).
midline(r1, [xy(785,227),xy(784,252),xy(785,252),xy(786,250)]).
midline(r1, [xy(823,266),xy(823,299),xy(806,316),xy(792,317)]).
midline(r1, [xy(807,316),xy(822,301)]).
midline(r1, [xy(699,217),xy(699,225),xy(650,274),xy(699,226)]).
midline(r1, [xy(799,210),xy(797,208),xy(765,240),xy(762,240)]).
midline(r1, [xy(711,207),xy(712,208)]).
midline(r1, [xy(799,212),xy(786,225)]).
midline(r1, [xy(717,213),xy(716,210)]).
midline(r1, [xy(679,176),xy(688,164),xy(698,154),xy(701,153),xy(746,108),xy(746,104),xy(733,104),xy(698,139),xy(698,151),xy(691,157),xy(696,153)]).
midline(r1, [xy(747,107),xy(750,106),xy(767,123),xy(724,166),xy(689,166)]).
midline(r1, [xy(708,206),xy(706,208)]).
midline(r1, [xy(685,171),xy(698,184),xy(699,182),xy(705,183),xy(702,189),xy(693,198),xy(701,191)]).
midline(r1, [xy(703,187),xy(705,185)]).
midline(r1, [xy(725,166),xy(768,123),xy(771,125),xy(706,190),xy(706,192),xy(699,199),xy(705,194)]).
midline(r1, [xy(707,190),xy(772,125),xy(777,126),xy(709,194),xy(709,195),xy(704,200),xy(708,197)]).
midline(r1, [xy(710,194),xy(778,126),xy(783,127),xy(783,130),xy(713,200),xy(784,131),xy(785,135),xy(719,201),xy(719,203),xy(714,208),xy(718,205)]).
midline(r1, [xy(720,201),xy(785,136),xy(788,140),xy(724,205),xy(724,207),xy(719,212),xy(722,218),xy(722,226)]).
midline(r1, [xy(723,209),xy(721,211)]).
midline(r1, [xy(783,228),xy(768,243)]).
midline(r1, [xy(797,209),xy(766,240)]).
midline(r1, [xy(725,205),xy(788,142),xy(790,145),xy(790,148),xy(729,209),xy(729,211),xy(723,217),xy(728,213)]).
midline(r1, [xy(706,183),xy(723,167)]).
midline(r1, [xy(730,209),xy(791,149),xy(794,157),xy(738,215)]).
midline(r1, [xy(739,213),xy(794,158),xy(796,163),xy(739,220),xy(721,240),xy(796,164),xy(798,165),xy(798,207)]).
midline(r1, [xy(755,23),xy(751,26),xy(734,28),xy(724,39),xy(734,29)]).
midline(r1, [xy(739,28),xy(765,55),xy(809,99),xy(784,127),xy(809,102)]).
midline(r1, [xy(756,23),xy(762,20),xy(781,20),xy(780,31),xy(781,31),xy(782,29)]).
midline(r1, [xy(810,99),xy(811,91),xy(772,50),xy(769,52),xy(769,53),xy(770,54),xy(772,51),xy(773,52),xy(771,54)]).
midline(r1, [xy(772,49),xy(752,27),xy(754,24)]).
midline(r1, [xy(782,20),xy(804,20),xy(818,34),xy(818,82),xy(811,90),xy(816,86)]).
midline(r1, [xy(584,141),xy(544,181),xy(593,133),xy(594,103),xy(600,97)]).
midline(r1, [xy(679,149),xy(677,148),xy(675,151),xy(679,150)]).
midline(r1, [xy(700,208),xy(699,208)]).
midline(r1, [xy(647,173),xy(626,194)]).
midline(r1, [xy(628,193),xy(671,192)]).
midline(r1, [xy(646,174),xy(629,191)]).
midline(r1, [xy(634,230),xy(633,231)]).
midline(r1, [xy(656,207),xy(634,229),xy(656,209),xy(657,208),xy(657,207)]).
midline(r1, [xy(542,78),xy(544,81),xy(545,81),xy(546,80),xy(542,75),xy(546,79)]).
midline(r1, [xy(564,325),xy(566,325),xy(566,327)]).
midline(r1, [xy(660,167),xy(649,171)]).
midline(r1, [xy(659,169),xy(661,167)]).
midline(r1, [xy(716,220),xy(715,219),xy(716,218),xy(717,218),xy(717,220)]).
midline(r1, [xy(663,181),xy(661,180),xy(663,182)]).
midline(r1, [xy(775,50),xy(776,48),xy(778,48),xy(778,50)]).
midline(r1, [xy(701,207),xy(699,205),xy(701,206)]).
midline(r1, [xy(743,221),xy(744,222)]).
fillpoint(r1, xy(182,182), 173.8).
fillpoint(r1, xy(773,135), 77.0).
fillpoint(r1, xy(774,138), 76.4).
fillpoint(r1, xy(664,284), 75.9).
fillpoint(r1, xy(775,143), 75.4).
fillpoint(r1, xy(661,285), 75.4).
fillpoint(r1, xy(578,199), 75.3).
fillpoint(r1, xy(580,200), 74.9).
fillpoint(r1, xy(776,148), 74.5).
fillpoint(r1, xy(657,286), 74.5).
fillpoint(r1, xy(777,152), 73.5).
fillpoint(r1, xy(787,173), 64.0).
fillpoint(r1, xy(634,264), 62.6).
fillpoint(r1, xy(625,260), 62.5).
fillpoint(r1, xy(627,261), 62.5).
fillpoint(r1, xy(632,263), 62.5).
fillpoint(r1, xy(623,259), 62.4).
fillpoint(r1, xy(629,262), 62.4).
fillpoint(r1, xy(789,178), 62.1).
fillpoint(r1, xy(790,182), 61.1).
fillpoint(r1, xy(791,187), 60.2).
fillpoint(r1, xy(792,192), 59.2).
fillpoint(r1, xy(607,235), 57.9).
fillpoint(r1, xy(608,237), 57.9).
fillpoint(r1, xy(610,242), 57.9).
fillpoint(r1, xy(611,244), 57.9).
fillpoint(r1, xy(605,230), 57.8).
fillpoint(r1, xy(606,233), 57.8).
fillpoint(r1, xy(612,246), 57.8).
fillpoint(r1, xy(613,249), 57.8).
fillpoint(r1, xy(609,239), 57.7).
fillpoint(r1, xy(597,55), 53.5).
fillpoint(r1, xy(599,56), 53.5).
fillpoint(r1, xy(706,310), 51.6).
fillpoint(r1, xy(605,71), 51.4).
fillpoint(r1, xy(608,78), 51.4).
fillpoint(r1, xy(611,85), 51.4).
fillpoint(r1, xy(601,62), 51.3).
fillpoint(r1, xy(602,64), 51.3).
fillpoint(r1, xy(604,69), 51.3).
fillpoint(r1, xy(607,76), 51.3).
fillpoint(r1, xy(609,80), 51.3).
fillpoint(r1, xy(612,87), 51.3).
fillpoint(r1, xy(614,92), 51.3).
fillpoint(r1, xy(615,94), 51.3).
fillpoint(r1, xy(603,66), 51.2).
fillpoint(r1, xy(606,73), 51.2).
fillpoint(r1, xy(610,83), 51.2).
fillpoint(r1, xy(613,90), 51.2).
fillpoint(r1, xy(616,96), 51.2).
fillpoint(r1, xy(737,117), 50.7).
fillpoint(r1, xy(710,311), 50.6).
fillpoint(r1, xy(721,109), 50.0).
fillpoint(r1, xy(728,112), 50.0).
fillpoint(r1, xy(730,113), 50.0).
fillpoint(r1, xy(723,110), 49.9).
fillpoint(r1, xy(726,111), 49.9).
fillpoint(r1, xy(732,114), 49.8).
fillpoint(r1, xy(715,312), 49.7).
fillpoint(r1, xy(719,313), 48.7).
fillpoint(r1, xy(770,313), 48.7).
fillpoint(r1, xy(724,314), 47.8).
fillpoint(r1, xy(764,314), 47.8).
fillpoint(r1, xy(776,314), 47.8).
fillpoint(r1, xy(804,314), 47.8).
fillpoint(r1, xy(729,315), 46.8).
fillpoint(r1, xy(760,315), 46.8).
fillpoint(r1, xy(781,315), 46.8).
fillpoint(r1, xy(800,315), 46.8).
fillpoint(r1, xy(733,316), 45.8).
fillpoint(r1, xy(755,316), 45.8).
fillpoint(r1, xy(785,316), 45.8).
fillpoint(r1, xy(795,316), 45.8).
fillpoint(r1, xy(789,317), 44.9).
fillpoint(r1, xy(738,317), 44.9).
fillpoint(r1, xy(750,317), 44.9).
fillpoint(r1, xy(633,97), 43.9).
fillpoint(r1, xy(638,99), 43.9).
fillpoint(r1, xy(693,104), 43.9).
fillpoint(r1, xy(744,318), 43.9).
fillpoint(r1, xy(635,98), 43.8).
fillpoint(r1, xy(696,105), 43.8).
fillpoint(r1, xy(701,107), 43.7).
fillpoint(r1, xy(699,106), 43.6).
fillpoint(r1, xy(703,108), 43.6).
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
opencv_morphology(r1, opening_area(310237), closing_area(313150), gradient_area(6234)).
opencv_shape_metrics(r1, contour_area(309613.0), hull_area(309639.0), solidity(0.999916), circularity(0.654763), extent(0.996001), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309613.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 13.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 2.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 4.0).
opencv_contour_hierarchy(r1, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r1, c5, hole, 2.0).
opencv_contour_hierarchy(r1, c5, next(c6), previous(c4), child(none), parent(c0)).
opencv_contour(r1, c6, hole, 4.0).
opencv_contour_hierarchy(r1, c6, next(c7), previous(c5), child(none), parent(c0)).
opencv_contour(r1, c7, hole, 4.0).
opencv_contour_hierarchy(r1, c7, next(c8), previous(c6), child(none), parent(c0)).
opencv_contour(r1, c8, hole, 2.0).
opencv_contour_hierarchy(r1, c8, next(c9), previous(c7), child(none), parent(c0)).
opencv_contour(r1, c9, hole, 2.0).
opencv_contour_hierarchy(r1, c9, next(c10), previous(c8), child(none), parent(c0)).
opencv_contour(r1, c10, hole, 2.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 34.0).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 4.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 10.5).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 2.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 10.0).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 4.0).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 4.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 4.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 2.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 6.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 2.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 42.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 108.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 28.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 77.0).
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
opencv_contour(r1, c31, hole, 7.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 4.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 4.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 5.5).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 18.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 2.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 24.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 13.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 10.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 9.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 4.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 13.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 10.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 2.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 13.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 8.5).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 10.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 10.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 10.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 6.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 2.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 2.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 2.0).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 5.5).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 8.5).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 7.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 45.5).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 10.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 5.5).
opencv_contour_hierarchy(r1, c65, next(c66), previous(c64), child(none), parent(c0)).
opencv_contour(r1, c66, hole, 2.0).
opencv_contour_hierarchy(r1, c66, next(c67), previous(c65), child(none), parent(c0)).
opencv_contour(r1, c67, hole, 15.0).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 9.5).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 2.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 10.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 44.5).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 2.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 2.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 26.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 2.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 2.0).
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
opencv_contour(r1, c83, hole, 2.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 2.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 5.5).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 2.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 2.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 7.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 2.0).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 4.0).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 2.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 35.0).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 2.0).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 2.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 4.0).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 2.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 5.5).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 9.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 2.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 14.5).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 2.0).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 7.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 4.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 2.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 2.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 22.5).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 2.0).
opencv_contour_hierarchy(r1, c107, next(none), previous(c106), child(none), parent(c0)).
