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

region(r1, '#585d5c', 310478, centroid(426,182)).
perimeter(r1, 3614).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(798,0),xy(797,2),xy(796,0),xy(0,0)]).
hole(r1, [xy(393,362),xy(396,362),xy(393,362)]).
hole(r1, [xy(386,358),xy(388,358),xy(386,358)]).
hole(r1, [xy(385,357),xy(387,357),xy(385,357)]).
hole(r1, [xy(460,283),xy(462,283),xy(460,283)]).
hole(r1, [xy(455,281),xy(457,281),xy(455,281)]).
hole(r1, [xy(443,277),xy(445,277),xy(443,277)]).
hole(r1, [xy(441,276),xy(444,276),xy(441,276)]).
hole(r1, [xy(445,235),xy(448,235),xy(445,235)]).
hole(r1, [xy(441,234),xy(443,234),xy(441,234)]).
hole(r1, [xy(439,233),xy(441,233),xy(439,233)]).
hole(r1, [xy(436,232),xy(438,232),xy(436,232)]).
hole(r1, [xy(436,228),xy(436,232),xy(436,228)]).
hole(r1, [xy(428,225),xy(431,224),xy(436,228),xy(434,229),xy(428,225)]).
hole(r1, [xy(427,224),xy(429,224),xy(427,224)]).
hole(r1, [xy(429,223),xy(431,223),xy(429,223)]).
hole(r1, [xy(430,222),xy(432,222),xy(430,222)]).
hole(r1, [xy(431,221),xy(433,221),xy(431,221)]).
hole(r1, [xy(434,217),xy(435,219),xy(433,220),xy(434,217)]).
hole(r1, [xy(434,217),xy(436,217),xy(434,217)]).
hole(r1, [xy(435,216),xy(437,216),xy(435,216)]).
hole(r1, [xy(436,215),xy(438,215),xy(436,215)]).
hole(r1, [xy(437,213),xy(439,214),xy(437,213)]).
hole(r1, [xy(438,212),xy(440,212),xy(438,212)]).
hole(r1, [xy(439,211),xy(441,211),xy(439,211)]).
hole(r1, [xy(440,210),xy(442,210),xy(440,210)]).
hole(r1, [xy(441,209),xy(443,209),xy(441,209)]).
hole(r1, [xy(442,207),xy(444,207),xy(442,207)]).
hole(r1, [xy(443,206),xy(445,206),xy(443,206)]).
hole(r1, [xy(444,205),xy(446,205),xy(444,205)]).
hole(r1, [xy(445,203),xy(447,204),xy(445,203)]).
hole(r1, [xy(447,202),xy(449,202),xy(447,202)]).
hole(r1, [xy(448,200),xy(450,201),xy(448,200)]).
hole(r1, [xy(449,199),xy(451,199),xy(449,199)]).
hole(r1, [xy(450,198),xy(452,198),xy(450,198)]).
hole(r1, [xy(451,196),xy(453,197),xy(451,196)]).
hole(r1, [xy(452,195),xy(454,195),xy(452,195)]).
hole(r1, [xy(453,194),xy(455,194),xy(453,194)]).
hole(r1, [xy(456,190),xy(457,192),xy(455,193),xy(456,190)]).
hole(r1, [xy(457,189),xy(459,189),xy(457,189)]).
hole(r1, [xy(458,188),xy(460,188),xy(458,188)]).
hole(r1, [xy(459,187),xy(461,187),xy(459,187)]).
hole(r1, [xy(460,186),xy(462,186),xy(460,186)]).
hole(r1, [xy(461,185),xy(463,185),xy(461,185)]).
hole(r1, [xy(464,181),xy(463,185),xy(464,181)]).
hole(r1, [xy(464,181),xy(466,181),xy(464,181)]).
hole(r1, [xy(465,180),xy(467,180),xy(465,180)]).
hole(r1, [xy(466,179),xy(468,179),xy(466,179)]).
hole(r1, [xy(467,178),xy(469,178),xy(467,178)]).
hole(r1, [xy(468,176),xy(470,177),xy(468,176)]).
hole(r1, [xy(469,175),xy(471,175),xy(469,175)]).
hole(r1, [xy(470,174),xy(472,174),xy(470,174)]).
hole(r1, [xy(471,173),xy(473,173),xy(471,173)]).
hole(r1, [xy(472,172),xy(474,172),xy(472,172)]).
hole(r1, [xy(473,171),xy(474,169),xy(476,170),xy(473,171)]).
hole(r1, [xy(475,169),xy(478,169),xy(475,169)]).
hole(r1, [xy(477,168),xy(481,168),xy(477,168)]).
hole(r1, [xy(480,167),xy(482,167),xy(480,167)]).
hole(r1, [xy(482,166),xy(484,166),xy(482,166)]).
hole(r1, [xy(484,165),xy(486,165),xy(484,165)]).
hole(r1, [xy(486,164),xy(488,164),xy(486,164)]).
hole(r1, [xy(487,163),xy(490,163),xy(487,163)]).
hole(r1, [xy(489,162),xy(492,162),xy(489,162)]).
hole(r1, [xy(491,161),xy(493,161),xy(491,161)]).
hole(r1, [xy(493,160),xy(495,160),xy(493,160)]).
hole(r1, [xy(494,159),xy(496,159),xy(494,159)]).
hole(r1, [xy(496,158),xy(498,158),xy(496,158)]).
hole(r1, [xy(498,157),xy(500,157),xy(498,157)]).
hole(r1, [xy(499,156),xy(501,156),xy(499,156)]).
hole(r1, [xy(500,155),xy(503,155),xy(500,155)]).
hole(r1, [xy(502,154),xy(504,154),xy(502,154)]).
hole(r1, [xy(503,153),xy(505,153),xy(503,153)]).
hole(r1, [xy(505,152),xy(507,152),xy(505,152)]).
hole(r1, [xy(506,151),xy(508,151),xy(506,151)]).
hole(r1, [xy(507,150),xy(509,150),xy(507,150)]).
hole(r1, [xy(508,149),xy(511,149),xy(508,149)]).
hole(r1, [xy(510,148),xy(512,148),xy(510,148)]).
hole(r1, [xy(511,147),xy(512,145),xy(514,146),xy(511,147)]).
hole(r1, [xy(513,145),xy(516,145),xy(513,145)]).
hole(r1, [xy(515,144),xy(517,144),xy(515,144)]).
hole(r1, [xy(516,143),xy(518,143),xy(516,143)]).
hole(r1, [xy(517,142),xy(520,142),xy(517,142)]).
hole(r1, [xy(519,141),xy(520,139),xy(522,140),xy(519,141)]).
hole(r1, [xy(564,139),xy(566,139),xy(564,139)]).
hole(r1, [xy(521,139),xy(523,139),xy(521,139)]).
hole(r1, [xy(565,138),xy(568,138),xy(565,138)]).
hole(r1, [xy(522,138),xy(524,138),xy(522,138)]).
hole(r1, [xy(567,137),xy(570,137),xy(567,137)]).
hole(r1, [xy(569,136),xy(572,136),xy(569,136)]).
hole(r1, [xy(571,135),xy(574,135),xy(571,135)]).
hole(r1, [xy(527,134),xy(524,138),xy(527,134)]).
hole(r1, [xy(527,134),xy(529,134),xy(527,134)]).
hole(r1, [xy(576,132),xy(574,135),xy(576,132)]).
hole(r1, [xy(576,132),xy(579,132),xy(576,132)]).
hole(r1, [xy(528,133),xy(530,131),xy(537,133),xy(528,133)]).
hole(r1, [xy(578,131),xy(580,131),xy(578,131)]).
hole(r1, [xy(579,130),xy(582,130),xy(579,130)]).
hole(r1, [xy(584,127),xy(582,130),xy(584,127)]).
hole(r1, [xy(584,127),xy(586,127),xy(584,127)]).
hole(r1, [xy(585,126),xy(588,126),xy(585,126)]).
hole(r1, [xy(587,125),xy(589,125),xy(587,125)]).
hole(r1, [xy(588,124),xy(591,124),xy(588,124)]).
hole(r1, [xy(590,123),xy(592,123),xy(590,123)]).
hole(r1, [xy(591,122),xy(594,122),xy(591,122)]).
hole(r1, [xy(593,121),xy(596,121),xy(593,121)]).
hole(r1, [xy(595,120),xy(597,120),xy(595,120)]).
hole(r1, [xy(599,117),xy(597,120),xy(599,117)]).
hole(r1, [xy(599,117),xy(602,117),xy(599,117)]).
hole(r1, [xy(601,116),xy(604,116),xy(601,116)]).
hole(r1, [xy(603,115),xy(605,115),xy(603,115)]).
hole(r1, [xy(604,114),xy(607,114),xy(604,114)]).
hole(r1, [xy(606,113),xy(609,113),xy(606,113)]).
hole(r1, [xy(611,110),xy(609,113),xy(611,110)]).
hole(r1, [xy(611,110),xy(614,110),xy(611,110)]).
hole(r1, [xy(613,109),xy(616,109),xy(613,109)]).
hole(r1, [xy(615,108),xy(618,108),xy(615,108)]).
hole(r1, [xy(617,107),xy(620,107),xy(617,107)]).
hole(r1, [xy(619,106),xy(621,104),xy(624,105),xy(619,106)]).
hole(r1, [xy(623,104),xy(626,104),xy(623,104)]).
hole(r1, [xy(625,103),xy(628,103),xy(625,103)]).
hole(r1, [xy(627,102),xy(630,102),xy(627,102)]).
hole(r1, [xy(629,101),xy(632,101),xy(629,101)]).
hole(r1, [xy(631,100),xy(634,100),xy(631,100)]).
hole(r1, [xy(633,99),xy(636,99),xy(633,99)]).
hole(r1, [xy(635,98),xy(638,98),xy(635,98)]).
hole(r1, [xy(637,97),xy(640,97),xy(637,97)]).
hole(r1, [xy(640,96),xy(643,96),xy(640,96)]).
hole(r1, [xy(642,95),xy(648,94),xy(642,95)]).
hole(r1, [xy(647,93),xy(650,93),xy(647,93)]).
hole(r1, [xy(649,92),xy(652,92),xy(649,92)]).
hole(r1, [xy(651,91),xy(654,91),xy(651,91)]).
hole(r1, [xy(653,90),xy(656,90),xy(653,90)]).
hole(r1, [xy(655,89),xy(658,89),xy(655,89)]).
hole(r1, [xy(657,88),xy(660,88),xy(657,88)]).
hole(r1, [xy(660,87),xy(663,87),xy(660,87)]).
hole(r1, [xy(662,86),xy(665,86),xy(662,86)]).
hole(r1, [xy(664,85),xy(667,85),xy(664,85)]).
hole(r1, [xy(667,84),xy(669,84),xy(667,84)]).
hole(r1, [xy(669,83),xy(672,83),xy(669,83)]).
hole(r1, [xy(671,82),xy(674,82),xy(671,82)]).
hole(r1, [xy(674,81),xy(676,81),xy(674,81)]).
hole(r1, [xy(675,80),xy(679,80),xy(675,80)]).
hole(r1, [xy(678,79),xy(681,79),xy(678,79)]).
hole(r1, [xy(681,78),xy(683,78),xy(681,78)]).
hole(r1, [xy(683,77),xy(686,77),xy(683,77)]).
hole(r1, [xy(685,76),xy(688,76),xy(685,76)]).
hole(r1, [xy(687,75),xy(690,75),xy(687,75)]).
hole(r1, [xy(689,74),xy(692,74),xy(689,74)]).
hole(r1, [xy(691,73),xy(694,73),xy(691,73)]).
hole(r1, [xy(694,72),xy(697,72),xy(694,72)]).
hole(r1, [xy(696,71),xy(699,71),xy(696,71)]).
hole(r1, [xy(698,70),xy(701,70),xy(698,70)]).
hole(r1, [xy(700,69),xy(703,69),xy(700,69)]).
hole(r1, [xy(702,68),xy(707,67),xy(705,69),xy(702,68)]).
hole(r1, [xy(706,66),xy(709,66),xy(706,66)]).
hole(r1, [xy(709,65),xy(711,65),xy(709,65)]).
hole(r1, [xy(710,64),xy(713,64),xy(710,64)]).
hole(r1, [xy(713,63),xy(716,63),xy(713,63)]).
hole(r1, [xy(715,62),xy(718,62),xy(715,62)]).
hole(r1, [xy(717,61),xy(720,61),xy(717,61)]).
hole(r1, [xy(719,60),xy(722,60),xy(719,60)]).
hole(r1, [xy(721,59),xy(724,59),xy(721,59)]).
hole(r1, [xy(723,58),xy(725,58),xy(723,58)]).
hole(r1, [xy(725,57),xy(727,57),xy(725,57)]).
hole(r1, [xy(727,56),xy(729,56),xy(727,56)]).
hole(r1, [xy(728,55),xy(731,55),xy(728,55)]).
hole(r1, [xy(730,54),xy(733,54),xy(730,54)]).
hole(r1, [xy(732,53),xy(734,53),xy(732,53)]).
hole(r1, [xy(733,52),xy(736,52),xy(733,52)]).
hole(r1, [xy(735,51),xy(738,51),xy(735,51)]).
hole(r1, [xy(737,50),xy(740,50),xy(737,50)]).
hole(r1, [xy(739,49),xy(741,49),xy(739,49)]).
hole(r1, [xy(740,48),xy(743,48),xy(740,48)]).
hole(r1, [xy(742,47),xy(744,47),xy(742,47)]).
hole(r1, [xy(744,46),xy(746,46),xy(744,46)]).
hole(r1, [xy(745,45),xy(748,45),xy(745,45)]).
hole(r1, [xy(747,44),xy(749,44),xy(747,44)]).
hole(r1, [xy(748,43),xy(751,43),xy(748,43)]).
hole(r1, [xy(750,42),xy(752,42),xy(750,42)]).
hole(r1, [xy(751,41),xy(753,41),xy(751,41)]).
hole(r1, [xy(752,40),xy(755,40),xy(752,40)]).
hole(r1, [xy(754,39),xy(756,39),xy(754,39)]).
hole(r1, [xy(758,36),xy(756,39),xy(758,36)]).
hole(r1, [xy(758,36),xy(760,36),xy(758,36)]).
hole(r1, [xy(762,33),xy(760,36),xy(762,33)]).
hole(r1, [xy(762,33),xy(764,33),xy(762,33)]).
hole(r1, [xy(768,28),xy(764,33),xy(768,28)]).
hole(r1, [xy(768,28),xy(770,28),xy(768,28)]).
hole(r1, [xy(769,27),xy(771,27),xy(769,27)]).
hole(r1, [xy(770,26),xy(772,26),xy(770,26)]).
hole(r1, [xy(774,23),xy(772,26),xy(774,23)]).
hole(r1, [xy(774,23),xy(776,23),xy(774,23)]).
hole(r1, [xy(775,22),xy(777,22),xy(775,22)]).
hole(r1, [xy(776,21),xy(777,19),xy(779,20),xy(776,21)]).
hole(r1, [xy(778,19),xy(780,19),xy(778,19)]).
hole(r1, [xy(779,18),xy(781,18),xy(779,18)]).
hole(r1, [xy(780,17),xy(782,17),xy(780,17)]).
hole(r1, [xy(781,16),xy(783,16),xy(781,16)]).
hole(r1, [xy(782,15),xy(784,15),xy(782,15)]).
hole(r1, [xy(783,14),xy(785,14),xy(783,14)]).
hole(r1, [xy(784,13),xy(786,13),xy(784,13)]).
hole(r1, [xy(785,12),xy(787,12),xy(785,12)]).
hole(r1, [xy(786,11),xy(788,11),xy(786,11)]).
hole(r1, [xy(787,10),xy(789,10),xy(787,10)]).
hole(r1, [xy(788,9),xy(790,9),xy(788,9)]).
hole(r1, [xy(789,8),xy(791,8),xy(789,8)]).
hole(r1, [xy(790,7),xy(792,7),xy(790,7)]).
hole(r1, [xy(791,6),xy(793,6),xy(791,6)]).
hole(r1, [xy(792,5),xy(794,5),xy(792,5)]).
hole(r1, [xy(793,4),xy(795,4),xy(793,4)]).
hole(r1, [xy(794,3),xy(796,3),xy(794,3)]).
hole(r1, [xy(795,2),xy(797,2),xy(795,2)]).
midline(r1, [xy(182,181),xy(213,181),xy(385,354),xy(385,358),xy(387,359),xy(388,358),xy(387,356),xy(388,359)]).
midline(r1, [xy(390,359),xy(393,363),xy(395,363),xy(397,361),xy(397,362),xy(438,320),xy(400,319),xy(377,296),xy(361,293),xy(248,180),xy(214,180)]).
midline(r1, [xy(438,319),xy(482,320),xy(484,318),xy(443,278)]).
midline(r1, [xy(484,319),xy(490,317),xy(507,299),xy(463,255),xy(426,255),xy(421,253),xy(378,296),xy(419,255)]).
midline(r1, [xy(508,299),xy(512,299),xy(531,279),xy(469,217),xy(463,217),xy(448,203),xy(347,101),xy(338,107),xy(323,109),xy(318,114),xy(313,115),xy(249,180),xy(313,116)]).
midline(r1, [xy(343,103),xy(339,107),xy(441,208),xy(438,212),xy(444,204),xy(446,205),xy(443,209),xy(439,213),xy(445,210),xy(453,218),xy(448,223),xy(445,223),xy(438,216),xy(435,215),xy(330,108)]).
midline(r1, [xy(449,223),xy(454,218),xy(462,218)]).
midline(r1, [xy(448,201),xy(449,202)]).
midline(r1, [xy(532,279),xy(536,277),xy(356,98),xy(348,101)]).
midline(r1, [xy(352,100),xy(449,199),xy(450,197),xy(451,197),xy(452,198),xy(450,200),xy(452,199),xy(469,216)]).
midline(r1, [xy(438,217),xy(436,217),xy(434,216),xy(434,217),xy(436,218)]).
midline(r1, [xy(490,283),xy(463,283),xy(457,280),xy(455,280),xy(455,282),xy(457,282)]).
midline(r1, [xy(323,110),xy(319,115),xy(427,225),xy(428,225),xy(429,224),xy(428,223),xy(431,220),xy(433,221),xy(430,224),xy(433,222),xy(445,224),xy(441,228),xy(436,228),xy(435,229),xy(434,229),xy(369,294),xy(434,230)]).
midline(r1, [xy(436,214),xy(438,215)]).
midline(r1, [xy(446,206),xy(444,208)]).
midline(r1, [xy(445,225),xy(440,232),xy(438,231),xy(437,231),xy(436,232),xy(436,233),xy(439,233),xy(439,238),xy(425,252),xy(439,239)]).
midline(r1, [xy(460,282),xy(460,284),xy(462,284)]).
midline(r1, [xy(536,279),xy(543,277),xy(545,273),xy(366,95),xy(358,97)]).
midline(r1, [xy(545,275),xy(553,274),xy(558,269),xy(467,178),xy(378,91),xy(370,91),xy(367,95),xy(370,92)]).
midline(r1, [xy(559,269),xy(564,267),xy(472,175),xy(471,175),xy(384,88),xy(379,90)]).
midline(r1, [xy(471,176),xy(470,176),xy(469,175),xy(469,174),xy(472,171),xy(473,171),xy(474,172),xy(472,174),xy(474,173)]).
midline(r1, [xy(565,267),xy(571,267),xy(572,265),xy(475,169),xy(475,165),xy(394,84),xy(387,86)]).
midline(r1, [xy(478,170),xy(477,167)]).
midline(r1, [xy(572,267),xy(580,262),xy(486,166),xy(485,166),xy(483,164),xy(480,167),xy(484,164),xy(483,161),xy(405,83),xy(395,84)]).
midline(r1, [xy(580,263),xy(591,262),xy(593,258),xy(493,158),xy(493,154),xy(420,81),xy(408,81),xy(406,83)]).
midline(r1, [xy(495,161),xy(489,160),xy(489,162),xy(490,164),xy(489,165),xy(487,163),xy(485,164),xy(488,165)]).
midline(r1, [xy(491,161),xy(493,162)]).
midline(r1, [xy(493,159),xy(496,157),xy(497,160),xy(499,155),xy(500,155),xy(501,156),xy(499,158),xy(501,157)]).
midline(r1, [xy(593,260),xy(604,259),xy(608,255),xy(505,152),xy(502,153),xy(503,155),xy(505,153)]).
midline(r1, [xy(512,158),xy(512,150),xy(508,146),xy(502,146),xy(433,77),xy(425,77),xy(423,79)]).
midline(r1, [xy(512,149),xy(512,148),xy(511,147),xy(510,147)]).
midline(r1, [xy(502,147),xy(505,151),xy(507,149),xy(508,149),xy(509,150),xy(507,153),xy(509,151)]).
midline(r1, [xy(467,177),xy(468,177),xy(469,178),xy(469,179),xy(468,180),xy(466,179),xy(464,180),xy(465,182),xy(467,181)]).
midline(r1, [xy(482,168),xy(484,167)]).
midline(r1, [xy(608,256),xy(622,255),xy(624,252),xy(517,147)]).
midline(r1, [xy(624,253),xy(633,252),xy(634,250),xy(521,137),xy(454,69),xy(439,72),xy(434,77),xy(437,74)]).
midline(r1, [xy(635,250),xy(640,250),xy(641,248),xy(527,132),xy(462,67),xy(455,69)]).
midline(r1, [xy(642,249),xy(690,249),xy(693,246),xy(580,134)]).
midline(r1, [xy(694,246),xy(702,246),xy(704,243),xy(584,125),xy(584,121),xy(526,63),xy(516,65),xy(462,66)]).
midline(r1, [xy(517,65),xy(555,104),xy(555,119),xy(552,122),xy(552,157)]).
midline(r1, [xy(553,122),xy(556,120),xy(568,132),xy(567,135),xy(567,137),xy(568,139),xy(567,140),xy(565,138),xy(564,138),xy(564,140),xy(567,141),xy(566,171)]).
midline(r1, [xy(529,134),xy(528,133)]).
midline(r1, [xy(585,121),xy(589,125),xy(590,128)]).
midline(r1, [xy(448,71),xy(447,73),xy(516,140),xy(515,143),xy(517,142),xy(518,143),xy(517,144),xy(520,143),xy(520,142),xy(517,140)]).
midline(r1, [xy(586,128),xy(585,128),xy(584,126)]).
midline(r1, [xy(568,140),xy(570,138),xy(570,137),xy(568,135),xy(569,134),xy(571,133),xy(571,135),xy(572,136),xy(570,139)]).
midline(r1, [xy(704,244),xy(710,241),xy(531,62),xy(527,63)]).
midline(r1, [xy(711,241),xy(722,241),xy(723,239),xy(599,117),xy(601,112),xy(547,58),xy(531,61)]).
midline(r1, [xy(724,239),xy(726,237),xy(607,117),xy(604,114),xy(601,115),xy(601,116),xy(602,117)]).
midline(r1, [xy(726,239),xy(732,234),xy(732,227),xy(614,107),xy(611,110),xy(613,112),xy(614,111),xy(613,108)]).
midline(r1, [xy(614,112),xy(616,111)]).
midline(r1, [xy(605,116),xy(603,115)]).
midline(r1, [xy(594,124),xy(594,122),xy(593,121),xy(593,118),xy(537,60)]).
midline(r1, [xy(592,124),xy(591,124),xy(590,122)]).
midline(r1, [xy(597,127),xy(597,122),xy(594,119),xy(596,119),xy(597,120),xy(597,121)]).
midline(r1, [xy(572,138),xy(574,136),xy(573,133)]).
midline(r1, [xy(556,106),xy(577,127),xy(577,129),xy(579,130),xy(580,132),xy(582,130),xy(578,127)]).
midline(r1, [xy(769,29),xy(768,28),xy(769,25),xy(758,14),xy(751,14),xy(715,26),xy(703,27),xy(698,31),xy(680,31),xy(670,33),xy(667,36),xy(656,36),xy(653,39),xy(637,39),xy(630,42),xy(616,43),xy(612,46),xy(598,46),xy(590,48),xy(586,52),xy(567,52),xy(564,55),xy(553,55),xy(548,58)]).
midline(r1, [xy(701,29),xy(699,32),xy(720,53),xy(720,57),xy(713,61),xy(713,65),xy(712,66),xy(678,33)]).
midline(r1, [xy(715,61),xy(716,64),xy(717,64),xy(718,63),xy(717,60)]).
midline(r1, [xy(623,43),xy(661,82),xy(659,90),xy(656,87),xy(652,89),xy(651,85),xy(613,47),xy(614,45)]).
midline(r1, [xy(553,56),xy(606,111),xy(607,116),xy(609,114),xy(608,111)]).
midline(r1, [xy(653,89),xy(653,90),xy(654,91),xy(653,93),xy(650,90),xy(649,90),xy(647,91),xy(647,93),xy(648,95),xy(650,94),xy(649,91)]).
midline(r1, [xy(728,23),xy(747,44),xy(799,96),xy(797,100),xy(742,47),xy(743,44),xy(723,24)]).
midline(r1, [xy(799,99),xy(795,105),xy(738,48),xy(736,47),xy(717,25)]).
midline(r1, [xy(796,105),xy(791,110),xy(708,27)]).
midline(r1, [xy(737,19),xy(756,39),xy(755,46),xy(750,42),xy(750,39),xy(733,21)]).
midline(r1, [xy(655,88),xy(655,89),xy(656,90),xy(655,96),xy(750,190),xy(750,198),xy(738,210),xy(633,107),xy(632,103),xy(627,100),xy(623,102),xy(623,104),xy(624,106),xy(626,105),xy(625,102)]).
midline(r1, [xy(656,92),xy(658,91)]).
midline(r1, [xy(627,101),xy(628,104),xy(626,106)]).
midline(r1, [xy(643,115),xy(643,96),xy(596,48)]).
midline(r1, [xy(709,64),xy(710,67),xy(708,68),xy(706,66),xy(706,62)]).
midline(r1, [xy(710,68),xy(711,66)]).
midline(r1, [xy(712,68),xy(780,136),xy(780,141),xy(773,147),xy(697,69),xy(694,70),xy(694,74),xy(693,75),xy(690,72),xy(688,73),xy(654,40),xy(656,37)]).
midline(r1, [xy(682,68),xy(681,83),xy(678,79),xy(678,65)]).
midline(r1, [xy(689,73),xy(689,74),xy(690,75),xy(689,77),xy(686,74),xy(685,74),xy(685,76),xy(686,78),xy(688,78)]).
midline(r1, [xy(683,79),xy(683,77)]).
midline(r1, [xy(732,53),xy(734,54)]).
midline(r1, [xy(650,95),xy(652,94)]).
midline(r1, [xy(779,143),xy(768,157),xy(691,80),xy(690,77),xy(692,75)]).
midline(r1, [xy(636,41),xy(674,79),xy(674,86),xy(672,84),xy(671,81),xy(631,42)]).
midline(r1, [xy(676,82),xy(675,80)]).
midline(r1, [xy(668,80),xy(667,83),xy(668,90),xy(667,91),xy(661,85),xy(664,84),xy(665,86),xy(665,88)]).
midline(r1, [xy(675,86),xy(761,172),xy(757,179),xy(668,91)]).
midline(r1, [xy(761,176),xy(751,189),xy(756,185)]).
midline(r1, [xy(730,52),xy(731,56),xy(727,55),xy(721,57),xy(719,59),xy(720,62),xy(718,64)]).
midline(r1, [xy(721,58),xy(722,61),xy(720,65),xy(783,128),xy(781,135),xy(783,134)]).
midline(r1, [xy(800,96),xy(801,91),xy(756,46)]).
midline(r1, [xy(748,16),xy(762,33),xy(808,77),xy(806,82),xy(742,18)]).
midline(r1, [xy(759,35),xy(760,36)]).
midline(r1, [xy(687,74),xy(687,73)]).
midline(r1, [xy(696,70),xy(697,73),xy(699,73)]).
midline(r1, [xy(723,58),xy(724,59),xy(725,58),xy(725,57),xy(725,59)]).
midline(r1, [xy(795,108),xy(787,119),xy(727,58)]).
midline(r1, [xy(670,34),xy(668,36),xy(697,65),xy(697,68),xy(700,67),xy(701,72),xy(703,70),xy(702,67)]).
midline(r1, [xy(651,89),xy(651,90)]).
midline(r1, [xy(741,50),xy(741,49),xy(739,48)]).
midline(r1, [xy(773,153),xy(764,165),xy(682,83)]).
midline(r1, [xy(768,163),xy(764,170)]).
midline(r1, [xy(669,85),xy(669,83)]).
midline(r1, [xy(807,82),xy(801,90),xy(805,87)]).
midline(r1, [xy(640,94),xy(640,98),xy(639,99),xy(636,96),xy(630,99),xy(629,94),xy(587,52),xy(590,49)]).
midline(r1, [xy(635,97),xy(635,98),xy(636,99),xy(635,101),xy(633,99),xy(633,98)]).
midline(r1, [xy(629,99),xy(629,100)]).
midline(r1, [xy(636,101),xy(638,100)]).
midline(r1, [xy(631,99),xy(631,100),xy(633,103),xy(634,101)]).
midline(r1, [xy(749,200),xy(738,211),xy(738,221),xy(733,226),xy(737,223)]).
midline(r1, [xy(809,77),xy(811,68),xy(769,27),xy(770,25),xy(771,25),xy(772,27)]).
midline(r1, [xy(791,116),xy(787,120),xy(787,124),xy(784,127),xy(787,125)]).
midline(r1, [xy(567,53),xy(565,55),xy(614,106),xy(617,105),xy(618,110),xy(620,108),xy(619,105)]).
midline(r1, [xy(628,105),xy(630,104)]).
midline(r1, [xy(815,37),xy(789,11),xy(788,11),xy(785,9),xy(767,9),xy(759,13)]).
midline(r1, [xy(765,11),xy(774,23),xy(776,21),xy(777,22),xy(775,24),xy(777,23),xy(814,60),xy(814,64),xy(811,67),xy(813,66)]).
midline(r1, [xy(816,38),xy(815,60)]).
midline(r1, [xy(745,48),xy(743,46),xy(745,45),xy(746,47)]).
midline(r1, [xy(789,10),xy(788,9),xy(787,9),xy(795,1),xy(795,2),xy(796,1),xy(797,2),xy(790,10),xy(797,3)]).
midline(r1, [xy(459,190),xy(458,190),xy(457,189),xy(457,188),xy(460,189),xy(461,187),xy(459,186),xy(461,184),xy(463,185),xy(462,187),xy(463,186)]).
midline(r1, [xy(751,41),xy(753,43)]).
midline(r1, [xy(786,11),xy(778,18),xy(785,12),xy(786,13),xy(779,20),xy(788,12)]).
midline(r1, [xy(440,234),xy(441,233),xy(441,232),xy(441,235),xy(442,235),xy(443,234),xy(443,233)]).
midline(r1, [xy(455,195),xy(454,196),xy(452,195),xy(453,193),xy(455,193),xy(455,194)]).
midline(r1, [xy(524,138),xy(523,137),xy(521,138),xy(521,139),xy(522,140),xy(524,139)]).
midline(r1, [xy(736,49),xy(735,51),xy(738,53),xy(738,51),xy(736,48)]).
midline(r1, [xy(444,276),xy(445,277)]).
fillpoint(r1, xy(182,182), 173.8).
fillpoint(r1, xy(707,217), 140.2).
fillpoint(r1, xy(701,219), 138.5).
fillpoint(r1, xy(691,222), 135.6).
fillpoint(r1, xy(687,223), 134.7).
fillpoint(r1, xy(678,226), 131.8).
fillpoint(r1, xy(674,227), 130.8).
fillpoint(r1, xy(671,228), 129.9).
fillpoint(r1, xy(668,229), 128.9).
fillpoint(r1, xy(664,230), 128.0).
fillpoint(r1, xy(660,231), 127.0).
fillpoint(r1, xy(337,131), 126.1).
fillpoint(r1, xy(656,232), 126.1).
fillpoint(r1, xy(651,233), 125.1).
fillpoint(r1, xy(646,234), 124.2).
fillpoint(r1, xy(642,235), 123.2).
fillpoint(r1, xy(637,236), 122.2).
fillpoint(r1, xy(633,237), 121.3).
fillpoint(r1, xy(628,238), 120.3).
fillpoint(r1, xy(623,239), 119.4).
fillpoint(r1, xy(619,240), 118.4).
fillpoint(r1, xy(614,241), 117.5).
fillpoint(r1, xy(610,242), 116.5).
fillpoint(r1, xy(605,243), 115.6).
fillpoint(r1, xy(600,244), 114.6).
fillpoint(r1, xy(596,245), 113.6).
fillpoint(r1, xy(591,246), 112.7).
fillpoint(r1, xy(587,247), 111.7).
fillpoint(r1, xy(582,248), 110.8).
fillpoint(r1, xy(577,249), 109.8).
fillpoint(r1, xy(573,250), 108.9).
fillpoint(r1, xy(560,250), 108.1).
fillpoint(r1, xy(562,251), 107.9).
fillpoint(r1, xy(568,251), 107.9).
fillpoint(r1, xy(406,99), 95.5).
fillpoint(r1, xy(411,98), 94.5).
fillpoint(r1, xy(415,97), 93.6).
fillpoint(r1, xy(420,96), 92.6).
fillpoint(r1, xy(423,95), 91.7).
fillpoint(r1, xy(427,94), 90.7).
fillpoint(r1, xy(434,92), 88.8).
fillpoint(r1, xy(440,90), 86.9).
fillpoint(r1, xy(443,89), 86.0).
fillpoint(r1, xy(449,87), 84.0).
fillpoint(r1, xy(454,85), 82.1).
fillpoint(r1, xy(481,76), 73.5).
fillpoint(r1, xy(486,75), 72.6).
fillpoint(r1, xy(490,74), 71.6).
fillpoint(r1, xy(495,73), 70.7).
fillpoint(r1, xy(500,72), 69.7).
fillpoint(r1, xy(504,71), 68.8).
fillpoint(r1, xy(509,70), 67.8).
fillpoint(r1, xy(513,69), 66.9).
fillpoint(r1, xy(550,69), 66.4).
fillpoint(r1, xy(518,68), 65.9).
fillpoint(r1, xy(547,68), 65.9).
fillpoint(r1, xy(553,68), 65.9).
fillpoint(r1, xy(523,67), 64.9).
fillpoint(r1, xy(543,67), 64.9).
fillpoint(r1, xy(557,67), 64.9).
fillpoint(r1, xy(527,66), 64.0).
fillpoint(r1, xy(538,66), 64.0).
fillpoint(r1, xy(560,66), 64.0).
fillpoint(r1, xy(531,66), 63.0).
fillpoint(r1, xy(568,64), 62.1).
fillpoint(r1, xy(572,63), 61.1).
fillpoint(r1, xy(576,62), 60.2).
fillpoint(r1, xy(579,61), 59.2).
fillpoint(r1, xy(584,60), 58.3).
fillpoint(r1, xy(588,59), 57.3).
fillpoint(r1, xy(592,58), 56.3).
fillpoint(r1, xy(596,57), 55.4).
fillpoint(r1, xy(601,56), 54.4).
fillpoint(r1, xy(605,55), 53.5).
fillpoint(r1, xy(610,54), 52.5).
fillpoint(r1, xy(614,53), 51.6).
fillpoint(r1, xy(619,52), 50.6).
fillpoint(r1, xy(623,51), 49.7).
fillpoint(r1, xy(628,50), 48.7).
fillpoint(r1, xy(409,313), 48.7).
fillpoint(r1, xy(632,49), 47.8).
fillpoint(r1, xy(414,314), 47.8).
fillpoint(r1, xy(637,48), 46.8).
fillpoint(r1, xy(418,315), 46.8).
fillpoint(r1, xy(641,47), 45.8).
fillpoint(r1, xy(423,316), 45.8).
fillpoint(r1, xy(646,46), 44.9).
fillpoint(r1, xy(427,317), 44.9).
fillpoint(r1, xy(492,317), 44.9).
fillpoint(r1, xy(650,45), 43.9).
fillpoint(r1, xy(432,318), 43.9).
fillpoint(r1, xy(487,318), 43.9).
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
opencv_morphology(r1, opening_area(310462), closing_area(313276), gradient_area(6014)).
opencv_shape_metrics(r1, contour_area(309635.0), hull_area(309639.0), solidity(0.999987), circularity(0.655885), extent(0.996072), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309635.0).
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
opencv_contour(r1, c6, hole, 2.0).
opencv_contour_hierarchy(r1, c6, next(c7), previous(c5), child(none), parent(c0)).
opencv_contour(r1, c7, hole, 4.0).
opencv_contour_hierarchy(r1, c7, next(c8), previous(c6), child(none), parent(c0)).
opencv_contour(r1, c8, hole, 4.0).
opencv_contour_hierarchy(r1, c8, next(c9), previous(c7), child(none), parent(c0)).
opencv_contour(r1, c9, hole, 2.0).
opencv_contour_hierarchy(r1, c9, next(c10), previous(c8), child(none), parent(c0)).
opencv_contour(r1, c10, hole, 2.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 2.0).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 6.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 17.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 2.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 2.0).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 2.0).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 2.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 5.5).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 2.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 2.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 2.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 4.0).
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
opencv_contour(r1, c35, hole, 4.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 2.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 2.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 5.5).
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
opencv_contour(r1, c44, hole, 7.0).
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
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 5.5).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 4.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 6.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 2.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 2.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 2.0).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 2.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 4.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 4.0).
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
opencv_contour(r1, c69, hole, 4.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 2.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 2.0).
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
opencv_contour(r1, c77, hole, 5.5).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 4.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 2.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 2.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 4.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 5.5).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 2.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 2.0).
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
opencv_contour(r1, c90, hole, 10.0).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 2.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 7.0).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 4.0).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 18.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 2.0).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 4.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 7.0).
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
opencv_contour(r1, c103, hole, 4.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 4.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 2.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 7.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 4.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 4.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 2.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 4.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 4.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 7.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 4.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 4.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 4.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 4.0).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 9.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 4.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 4.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 4.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 4.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 4.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 4.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 4.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 4.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 4.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 11.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 4.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 4.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 4.0).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 4.0).
opencv_contour_hierarchy(r1, c131, next(c132), previous(c130), child(none), parent(c0)).
opencv_contour(r1, c132, hole, 4.0).
opencv_contour_hierarchy(r1, c132, next(c133), previous(c131), child(none), parent(c0)).
opencv_contour(r1, c133, hole, 4.0).
opencv_contour_hierarchy(r1, c133, next(c134), previous(c132), child(none), parent(c0)).
opencv_contour(r1, c134, hole, 4.0).
opencv_contour_hierarchy(r1, c134, next(c135), previous(c133), child(none), parent(c0)).
opencv_contour(r1, c135, hole, 4.0).
opencv_contour_hierarchy(r1, c135, next(c136), previous(c134), child(none), parent(c0)).
opencv_contour(r1, c136, hole, 4.0).
opencv_contour_hierarchy(r1, c136, next(c137), previous(c135), child(none), parent(c0)).
opencv_contour(r1, c137, hole, 2.0).
opencv_contour_hierarchy(r1, c137, next(c138), previous(c136), child(none), parent(c0)).
opencv_contour(r1, c138, hole, 4.0).
opencv_contour_hierarchy(r1, c138, next(c139), previous(c137), child(none), parent(c0)).
opencv_contour(r1, c139, hole, 4.0).
opencv_contour_hierarchy(r1, c139, next(c140), previous(c138), child(none), parent(c0)).
opencv_contour(r1, c140, hole, 2.0).
opencv_contour_hierarchy(r1, c140, next(c141), previous(c139), child(none), parent(c0)).
opencv_contour(r1, c141, hole, 6.0).
opencv_contour_hierarchy(r1, c141, next(c142), previous(c140), child(none), parent(c0)).
opencv_contour(r1, c142, hole, 4.0).
opencv_contour_hierarchy(r1, c142, next(c143), previous(c141), child(none), parent(c0)).
opencv_contour(r1, c143, hole, 2.0).
opencv_contour_hierarchy(r1, c143, next(c144), previous(c142), child(none), parent(c0)).
opencv_contour(r1, c144, hole, 4.0).
opencv_contour_hierarchy(r1, c144, next(c145), previous(c143), child(none), parent(c0)).
opencv_contour(r1, c145, hole, 4.0).
opencv_contour_hierarchy(r1, c145, next(c146), previous(c144), child(none), parent(c0)).
opencv_contour(r1, c146, hole, 4.0).
opencv_contour_hierarchy(r1, c146, next(c147), previous(c145), child(none), parent(c0)).
opencv_contour(r1, c147, hole, 4.0).
opencv_contour_hierarchy(r1, c147, next(c148), previous(c146), child(none), parent(c0)).
opencv_contour(r1, c148, hole, 4.0).
opencv_contour_hierarchy(r1, c148, next(c149), previous(c147), child(none), parent(c0)).
opencv_contour(r1, c149, hole, 4.0).
opencv_contour_hierarchy(r1, c149, next(c150), previous(c148), child(none), parent(c0)).
opencv_contour(r1, c150, hole, 4.0).
opencv_contour_hierarchy(r1, c150, next(c151), previous(c149), child(none), parent(c0)).
opencv_contour(r1, c151, hole, 4.0).
opencv_contour_hierarchy(r1, c151, next(c152), previous(c150), child(none), parent(c0)).
opencv_contour(r1, c152, hole, 4.0).
opencv_contour_hierarchy(r1, c152, next(c153), previous(c151), child(none), parent(c0)).
opencv_contour(r1, c153, hole, 9.0).
opencv_contour_hierarchy(r1, c153, next(c154), previous(c152), child(none), parent(c0)).
opencv_contour(r1, c154, hole, 4.0).
opencv_contour_hierarchy(r1, c154, next(c155), previous(c153), child(none), parent(c0)).
opencv_contour(r1, c155, hole, 2.0).
opencv_contour_hierarchy(r1, c155, next(c156), previous(c154), child(none), parent(c0)).
opencv_contour(r1, c156, hole, 4.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 4.0).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 4.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 4.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 4.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 4.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 2.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 2.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 2.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 4.0).
opencv_contour_hierarchy(r1, c165, next(c166), previous(c164), child(none), parent(c0)).
opencv_contour(r1, c166, hole, 4.0).
opencv_contour_hierarchy(r1, c166, next(c167), previous(c165), child(none), parent(c0)).
opencv_contour(r1, c167, hole, 2.0).
opencv_contour_hierarchy(r1, c167, next(c168), previous(c166), child(none), parent(c0)).
opencv_contour(r1, c168, hole, 4.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 4.0).
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
opencv_contour(r1, c177, hole, 4.0).
opencv_contour_hierarchy(r1, c177, next(c178), previous(c176), child(none), parent(c0)).
opencv_contour(r1, c178, hole, 2.0).
opencv_contour_hierarchy(r1, c178, next(c179), previous(c177), child(none), parent(c0)).
opencv_contour(r1, c179, hole, 2.0).
opencv_contour_hierarchy(r1, c179, next(c180), previous(c178), child(none), parent(c0)).
opencv_contour(r1, c180, hole, 4.0).
opencv_contour_hierarchy(r1, c180, next(c181), previous(c179), child(none), parent(c0)).
opencv_contour(r1, c181, hole, 2.0).
opencv_contour_hierarchy(r1, c181, next(c182), previous(c180), child(none), parent(c0)).
opencv_contour(r1, c182, hole, 7.0).
opencv_contour_hierarchy(r1, c182, next(c183), previous(c181), child(none), parent(c0)).
opencv_contour(r1, c183, hole, 2.0).
opencv_contour_hierarchy(r1, c183, next(c184), previous(c182), child(none), parent(c0)).
opencv_contour(r1, c184, hole, 7.0).
opencv_contour_hierarchy(r1, c184, next(c185), previous(c183), child(none), parent(c0)).
opencv_contour(r1, c185, hole, 2.0).
opencv_contour_hierarchy(r1, c185, next(c186), previous(c184), child(none), parent(c0)).
opencv_contour(r1, c186, hole, 13.0).
opencv_contour_hierarchy(r1, c186, next(c187), previous(c185), child(none), parent(c0)).
opencv_contour(r1, c187, hole, 2.0).
opencv_contour_hierarchy(r1, c187, next(c188), previous(c186), child(none), parent(c0)).
opencv_contour(r1, c188, hole, 2.0).
opencv_contour_hierarchy(r1, c188, next(c189), previous(c187), child(none), parent(c0)).
opencv_contour(r1, c189, hole, 2.0).
opencv_contour_hierarchy(r1, c189, next(c190), previous(c188), child(none), parent(c0)).
opencv_contour(r1, c190, hole, 7.0).
opencv_contour_hierarchy(r1, c190, next(c191), previous(c189), child(none), parent(c0)).
opencv_contour(r1, c191, hole, 2.0).
opencv_contour_hierarchy(r1, c191, next(c192), previous(c190), child(none), parent(c0)).
opencv_contour(r1, c192, hole, 2.0).
opencv_contour_hierarchy(r1, c192, next(c193), previous(c191), child(none), parent(c0)).
opencv_contour(r1, c193, hole, 5.5).
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
opencv_contour(r1, c203, hole, 2.0).
opencv_contour_hierarchy(r1, c203, next(c204), previous(c202), child(none), parent(c0)).
opencv_contour(r1, c204, hole, 2.0).
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
opencv_contour(r1, c211, hole, 2.0).
opencv_contour_hierarchy(r1, c211, next(none), previous(c210), child(none), parent(c0)).
