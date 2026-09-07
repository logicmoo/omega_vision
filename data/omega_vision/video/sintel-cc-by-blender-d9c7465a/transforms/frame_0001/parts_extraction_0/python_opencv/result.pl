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

region(r1, '#80898d', 306355, centroid(427,182)).
perimeter(r1, 5254).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(329,192),xy(331,192),xy(329,192)]).
hole(r1, [xy(245,192),xy(247,192),xy(245,192)]).
hole(r1, [xy(565,191),xy(567,191),xy(565,191)]).
hole(r1, [xy(560,191),xy(562,191),xy(560,191)]).
hole(r1, [xy(448,191),xy(450,191),xy(448,191)]).
hole(r1, [xy(437,191),xy(439,191),xy(437,191)]).
hole(r1, [xy(330,191),xy(332,191),xy(330,191)]).
hole(r1, [xy(246,191),xy(248,191),xy(246,191)]).
hole(r1, [xy(576,190),xy(578,190),xy(576,190)]).
hole(r1, [xy(447,190),xy(449,190),xy(447,190)]).
hole(r1, [xy(320,190),xy(322,190),xy(320,190)]).
hole(r1, [xy(236,190),xy(238,190),xy(236,190)]).
hole(r1, [xy(575,189),xy(577,189),xy(575,189)]).
hole(r1, [xy(446,189),xy(448,189),xy(446,189)]).
hole(r1, [xy(329,189),xy(331,189),xy(329,189)]).
hole(r1, [xy(245,189),xy(247,189),xy(245,189)]).
hole(r1, [xy(574,188),xy(576,188),xy(574,188)]).
hole(r1, [xy(445,188),xy(447,188),xy(445,188)]).
hole(r1, [xy(330,188),xy(332,187),xy(333,189),xy(330,188)]).
hole(r1, [xy(246,188),xy(248,187),xy(249,189),xy(246,188)]).
hole(r1, [xy(577,187),xy(579,187),xy(577,187)]).
hole(r1, [xy(573,187),xy(575,187),xy(573,187)]).
hole(r1, [xy(425,187),xy(427,187),xy(425,187)]).
hole(r1, [xy(576,186),xy(578,186),xy(576,186)]).
hole(r1, [xy(572,186),xy(574,186),xy(572,186)]).
hole(r1, [xy(447,186),xy(449,186),xy(447,186)]).
hole(r1, [xy(444,186),xy(446,186),xy(444,186)]).
hole(r1, [xy(575,185),xy(577,185),xy(575,185)]).
hole(r1, [xy(571,185),xy(573,185),xy(571,185)]).
hole(r1, [xy(446,185),xy(448,185),xy(446,185)]).
hole(r1, [xy(443,185),xy(445,185),xy(443,185)]).
hole(r1, [xy(574,184),xy(576,184),xy(574,184)]).
hole(r1, [xy(445,184),xy(447,184),xy(445,184)]).
hole(r1, [xy(442,184),xy(444,184),xy(442,184)]).
hole(r1, [xy(573,183),xy(575,183),xy(573,183)]).
hole(r1, [xy(570,183),xy(572,183),xy(570,183)]).
hole(r1, [xy(441,183),xy(443,183),xy(441,183)]).
hole(r1, [xy(326,183),xy(328,183),xy(326,183)]).
hole(r1, [xy(572,182),xy(574,182),xy(572,182)]).
hole(r1, [xy(569,182),xy(571,182),xy(569,182)]).
hole(r1, [xy(440,182),xy(442,182),xy(440,182)]).
hole(r1, [xy(320,182),xy(327,182),xy(320,182)]).
hole(r1, [xy(568,181),xy(570,181),xy(568,181)]).
hole(r1, [xy(443,181),xy(445,181),xy(443,181)]).
hole(r1, [xy(439,181),xy(441,181),xy(439,181)]).
hole(r1, [xy(567,180),xy(569,180),xy(567,180)]).
hole(r1, [xy(442,180),xy(444,180),xy(442,180)]).
hole(r1, [xy(326,180),xy(328,180),xy(326,180)]).
hole(r1, [xy(570,179),xy(572,179),xy(570,179)]).
hole(r1, [xy(566,179),xy(568,179),xy(566,179)]).
hole(r1, [xy(441,179),xy(443,179),xy(441,179)]).
hole(r1, [xy(438,179),xy(440,179),xy(438,179)]).
hole(r1, [xy(328,178),xy(330,179),xy(329,185),xy(327,184),xy(328,178)]).
hole(r1, [xy(682,177),xy(689,179),xy(688,182),xy(685,179),xy(682,180),xy(682,182),xy(689,186),xy(689,191),xy(686,193),xy(679,191),xy(680,188),xy(683,191),xy(687,189),xy(679,183),xy(682,177)]).
hole(r1, [xy(665,177),xy(678,178),xy(673,180),xy(673,193),xy(668,192),xy(669,180),xy(665,181),xy(665,177)]).
hole(r1, [xy(648,178),xy(651,177),xy(660,187),xy(660,180),xy(658,178),xy(663,177),xy(663,192),xy(661,193),xy(652,183),xy(652,190),xy(654,192),xy(649,193),xy(650,180),xy(648,178)]).
hole(r1, [xy(637,177),xy(647,178),xy(646,181),xy(641,180),xy(641,183),xy(646,184),xy(645,187),xy(641,186),xy(641,190),xy(647,189),xy(646,193),xy(636,192),xy(638,190),xy(637,177)]).
hole(r1, [xy(628,177),xy(635,178),xy(634,182),xy(631,179),xy(628,180),xy(628,182),xy(635,186),xy(635,191),xy(632,193),xy(625,191),xy(626,188),xy(628,190),xy(633,189),xy(625,183),xy(628,177)]).
hole(r1, [xy(613,177),xy(623,178),xy(622,181),xy(617,180),xy(617,183),xy(622,184),xy(621,187),xy(617,186),xy(617,190),xy(623,189),xy(622,193),xy(613,192),xy(613,177)]).
hole(r1, [xy(599,177),xy(606,177),xy(609,180),xy(607,186),xy(611,193),xy(603,186),xy(602,190),xy(605,192),xy(598,192),xy(599,177)]).
hole(r1, [xy(587,177),xy(594,177),xy(598,180),xy(595,186),xy(591,185),xy(592,193),xy(586,192),xy(588,190),xy(587,177)]).
hole(r1, [xy(569,178),xy(571,178),xy(569,178)]).
hole(r1, [xy(440,178),xy(442,178),xy(440,178)]).
hole(r1, [xy(437,178),xy(439,178),xy(437,178)]).
hole(r1, [xy(189,177),xy(200,178),xy(199,181),xy(193,180),xy(193,184),xy(198,184),xy(197,187),xy(193,186),xy(193,190),xy(199,189),xy(198,193),xy(188,192),xy(190,190),xy(189,177)]).
hole(r1, [xy(158,178),xy(177,177),xy(177,184),xy(183,184),xy(182,178),xy(187,177),xy(188,192),xy(182,192),xy(183,186),xy(177,186),xy(177,191),xy(175,192),xy(173,179),xy(172,181),xy(167,180),xy(168,192),xy(163,193),xy(163,180),xy(159,181),xy(158,178)]).
hole(r1, [xy(568,177),xy(570,177),xy(568,177)]).
hole(r1, [xy(564,177),xy(566,177),xy(564,177)]).
hole(r1, [xy(437,176),xy(436,191),xy(435,177),xy(437,176)]).
hole(r1, [xy(567,176),xy(569,176),xy(567,176)]).
hole(r1, [xy(438,175),xy(440,175),xy(438,175)]).
hole(r1, [xy(437,174),xy(439,174),xy(437,174)]).
hole(r1, [xy(328,174),xy(331,175),xy(329,176),xy(328,174)]).
hole(r1, [xy(577,173),xy(579,173),xy(577,173)]).
hole(r1, [xy(565,173),xy(567,173),xy(565,173)]).
hole(r1, [xy(561,173),xy(563,173),xy(561,173)]).
hole(r1, [xy(436,173),xy(438,173),xy(436,173)]).
hole(r1, [xy(433,173),xy(435,174),xy(433,173)]).
hole(r1, [xy(575,172),xy(577,172),xy(575,172)]).
hole(r1, [xy(564,172),xy(566,172),xy(564,172)]).
hole(r1, [xy(431,172),xy(433,172),xy(431,172)]).
hole(r1, [xy(315,172),xy(317,172),xy(315,172)]).
hole(r1, [xy(237,172),xy(239,172),xy(237,172)]).
hole(r1, [xy(232,172),xy(234,172),xy(232,172)]).
hole(r1, [xy(581,171),xy(583,171),xy(581,171)]).
hole(r1, [xy(563,171),xy(565,171),xy(563,171)]).
hole(r1, [xy(559,171),xy(561,172),xy(559,171)]).
hole(r1, [xy(540,171),xy(552,170),xy(558,176),xy(558,186),xy(553,192),xy(542,193),xy(536,189),xy(534,185),xy(535,176),xy(540,171)]).
hole(r1, [xy(525,170),xy(533,171),xy(531,173),xy(532,193),xy(524,192),xy(526,190),xy(525,170)]).
hole(r1, [xy(504,170),xy(524,171),xy(523,175),xy(515,173),xy(515,190),xy(518,191),xy(517,193),xy(509,192),xy(511,190),xy(511,173),xy(506,173),xy(504,176),xy(504,170)]).
hole(r1, [xy(490,170),xy(502,191),xy(501,193),xy(495,193),xy(493,185),xy(486,185),xy(484,188),xy(485,193),xy(478,192),xy(490,170)]).
hole(r1, [xy(454,171),xy(472,171),xy(477,176),xy(477,187),xy(470,193),xy(456,193),xy(457,173),xy(454,171)]).
hole(r1, [xy(447,170),xy(454,171),xy(452,174),xy(451,193),xy(448,187),xy(449,174),xy(446,172),xy(447,170)]).
hole(r1, [xy(435,171),xy(437,172),xy(435,171)]).
hole(r1, [xy(423,171),xy(429,170),xy(430,172),xy(426,173),xy(423,171)]).
hole(r1, [xy(406,171),xy(415,171),xy(413,173),xy(413,187),xy(416,190),xy(428,189),xy(424,193),xy(412,192),xy(409,188),xy(409,173),xy(406,171)]).
hole(r1, [xy(385,172),xy(399,170),xy(405,176),xy(405,186),xy(400,192),xy(388,193),xy(383,189),xy(381,179),xy(385,172)]).
hole(r1, [xy(332,171),xy(347,171),xy(349,179),xy(346,182),xy(354,192),xy(349,193),xy(343,184),xy(340,183),xy(340,190),xy(343,192),xy(334,193),xy(335,173),xy(332,171)]).
hole(r1, [xy(314,171),xy(316,171),xy(314,171)]).
hole(r1, [xy(291,171),xy(308,171),xy(314,178),xy(313,187),xy(306,193),xy(292,193),xy(293,173),xy(291,171)]).
hole(r1, [xy(268,170),xy(271,170),xy(285,186),xy(285,173),xy(282,171),xy(290,171),xy(288,173),xy(287,193),xy(273,178),xy(273,190),xy(275,192),xy(267,192),xy(270,189),xy(270,174),xy(267,172),xy(268,170)]).
hole(r1, [xy(250,170),xy(265,171),xy(264,176),xy(262,173),xy(255,173),xy(255,180),xy(264,179),xy(263,185),xy(255,183),xy(255,189),xy(263,190),xy(266,187),xy(267,190),xy(264,193),xy(249,192),xy(251,190),xy(250,170)]).
hole(r1, [xy(238,171),xy(240,171),xy(238,171)]).
hole(r1, [xy(359,163),xy(380,164),xy(379,170),xy(376,166),xy(367,167),xy(367,176),xy(378,174),xy(377,182),xy(375,179),xy(367,179),xy(367,189),xy(371,191),xy(370,193),xy(359,192),xy(362,189),xy(362,167),xy(359,163)]).
hole(r1, [xy(206,163),xy(222,163),xy(227,167),xy(227,174),xy(225,176),xy(230,181),xy(230,187),xy(225,192),xy(206,192),xy(209,190),xy(209,166),xy(206,163)]).
midline(r1, [xy(619,188),xy(624,187),xy(623,183),xy(619,181)]).
midline(r1, [xy(653,186),xy(656,191),xy(655,278),xy(180,278),xy(171,276),xy(171,184)]).
midline(r1, [xy(476,276),xy(476,193),xy(482,171),xy(480,85),xy(465,85),xy(461,81),xy(125,81),xy(117,88),xy(89,88),xy(79,97),xy(79,260),xy(81,262),xy(81,274),xy(85,278),xy(171,278)]).
midline(r1, [xy(536,276),xy(536,194),xy(533,188),xy(534,174)]).
midline(r1, [xy(535,172),xy(536,86),xy(481,85)]).
midline(r1, [xy(321,276),xy(321,202),xy(323,195),xy(317,186),xy(317,178),xy(321,171),xy(318,169),xy(314,170),xy(314,172),xy(316,173),xy(318,170)]).
midline(r1, [xy(258,187),xy(267,184),xy(266,177),xy(258,176)]).
midline(r1, [xy(406,276),xy(407,175),xy(404,169),xy(404,148),xy(402,147),xy(384,165),xy(381,172),xy(371,171)]).
midline(r1, [xy(570,276),xy(571,194),xy(566,190),xy(564,192),xy(560,190),xy(560,192),xy(562,192)]).
midline(r1, [xy(565,192),xy(567,192)]).
midline(r1, [xy(521,276),xy(521,185),xy(518,176)]).
midline(r1, [xy(284,183),xy(277,167),xy(276,121),xy(238,158),xy(238,170),xy(232,171),xy(232,173),xy(234,173)]).
midline(r1, [xy(277,121),xy(293,103),xy(292,82)]).
midline(r1, [xy(606,276),xy(605,190)]).
midline(r1, [xy(180,181),xy(180,151),xy(118,89),xy(123,83)]).
midline(r1, [xy(453,276),xy(454,98),xy(452,97),xy(404,147)]).
midline(r1, [xy(439,112),xy(433,118),xy(433,170),xy(431,171),xy(431,174),xy(424,181),xy(419,179),xy(419,132)]).
midline(r1, [xy(683,188),xy(676,186),xy(679,178),xy(678,88),xy(649,88),xy(646,85),xy(536,85)]).
midline(r1, [xy(438,276),xy(438,203),xy(431,196),xy(431,185),xy(425,181),xy(431,175)]).
midline(r1, [xy(274,181),xy(279,194),xy(279,276)]).
midline(r1, [xy(497,86),xy(497,166),xy(500,179),xy(505,181),xy(505,276)]).
midline(r1, [xy(289,276),xy(290,108)]).
midline(r1, [xy(267,130),xy(275,122)]).
midline(r1, [xy(293,104),xy(321,132),xy(321,162),xy(319,168)]).
midline(r1, [xy(596,276),xy(597,188)]).
midline(r1, [xy(598,186),xy(597,141),xy(577,160),xy(576,170),xy(572,178),xy(569,175),xy(566,174),xy(563,171),xy(561,172),xy(560,175),xy(557,172),xy(557,86)]).
midline(r1, [xy(563,170),xy(565,170),xy(567,173)]).
midline(r1, [xy(573,178),xy(572,179),xy(569,176),xy(568,177),xy(563,172),xy(563,173),xy(561,175)]).
midline(r1, [xy(596,142),xy(578,160)]).
midline(r1, [xy(405,145),xy(417,133)]).
midline(r1, [xy(80,97),xy(87,90)]).
midline(r1, [xy(664,89),xy(664,179),xy(663,181),xy(666,184),xy(666,277),xy(656,278)]).
midline(r1, [xy(666,278),xy(676,277),xy(676,187)]).
midline(r1, [xy(431,119),xy(420,130)]).
midline(r1, [xy(239,158),xy(264,133)]).
midline(r1, [xy(441,111),xy(441,173),xy(440,174),xy(438,172),xy(436,173),xy(433,171),xy(433,173)]).
midline(r1, [xy(575,173),xy(576,173),xy(577,172),xy(576,171),xy(577,171),xy(577,174),xy(578,174),xy(579,173),xy(579,171),xy(581,170),xy(581,172),xy(582,172),xy(583,171),xy(582,170),xy(583,170)]).
midline(r1, [xy(442,108),xy(452,98)]).
midline(r1, [xy(572,194),xy(573,188),xy(566,180),xy(564,176),xy(568,178),xy(567,180),xy(568,181),xy(570,179),xy(570,181),xy(569,182),xy(570,183),xy(572,180),xy(572,183),xy(571,184),xy(573,183),xy(573,185),xy(572,186),xy(573,187),xy(575,183),xy(573,181),xy(576,183),xy(575,185),xy(575,187),xy(574,188),xy(576,191),xy(577,191),xy(578,190),xy(576,188),xy(577,184),xy(578,185),xy(577,188),xy(578,189),xy(579,186)]).
midline(r1, [xy(345,276),xy(345,192),xy(341,185)]).
midline(r1, [xy(643,188),xy(648,187),xy(648,183),xy(643,181)]).
midline(r1, [xy(321,174),xy(326,177),xy(326,181),xy(327,181),xy(326,184),xy(321,189),xy(322,191)]).
midline(r1, [xy(323,188),xy(328,183),xy(328,180),xy(327,179)]).
midline(r1, [xy(327,177),xy(332,177),xy(332,184),xy(329,186),xy(329,191),xy(325,193)]).
midline(r1, [xy(330,188),xy(331,189),xy(330,190),xy(329,193),xy(331,193),xy(332,192),xy(331,190),xy(333,190)]).
midline(r1, [xy(334,188),xy(332,185)]).
midline(r1, [xy(624,276),xy(624,188),xy(629,188)]).
midline(r1, [xy(179,276),xy(180,189)]).
midline(r1, [xy(402,148),xy(385,165)]).
midline(r1, [xy(356,276),xy(356,180),xy(354,167),xy(322,133)]).
midline(r1, [xy(490,276),xy(490,190)]).
midline(r1, [xy(435,173),xy(436,174),xy(428,181),xy(433,177)]).
midline(r1, [xy(631,182),xy(636,182),xy(636,104),xy(634,103),xy(598,141)]).
midline(r1, [xy(599,139),xy(608,130)]).
midline(r1, [xy(611,127),xy(623,115)]).
midline(r1, [xy(636,183),xy(635,276)]).
midline(r1, [xy(634,104),xy(626,112)]).
midline(r1, [xy(195,182),xy(199,182),xy(202,185),xy(199,188),xy(195,188)]).
midline(r1, [xy(200,188),xy(203,185),xy(203,276)]).
midline(r1, [xy(204,185),xy(204,172),xy(200,171),xy(181,152)]).
midline(r1, [xy(188,160),xy(188,276)]).
midline(r1, [xy(268,185),xy(267,190),xy(267,276)]).
midline(r1, [xy(625,114),xy(625,176),xy(623,182)]).
midline(r1, [xy(648,182),xy(648,92),xy(646,91),xy(636,103)]).
midline(r1, [xy(637,101),xy(646,92)]).
midline(r1, [xy(380,173),xy(379,183),xy(376,186),xy(372,186),xy(371,183)]).
midline(r1, [xy(379,184),xy(376,187),xy(378,198),xy(378,276)]).
midline(r1, [xy(320,164),xy(322,163),xy(332,173),xy(333,177)]).
midline(r1, [xy(266,132),xy(267,177)]).
midline(r1, [xy(659,184),xy(656,177),xy(656,89)]).
midline(r1, [xy(237,276),xy(237,203),xy(239,199),xy(239,194),xy(236,190),xy(239,178),xy(237,173)]).
midline(r1, [xy(240,178),xy(250,186),xy(250,188),xy(248,190),xy(246,188),xy(245,188),xy(245,191),xy(241,193)]).
midline(r1, [xy(249,190),xy(246,190),xy(245,193),xy(248,192)]).
midline(r1, [xy(238,189),xy(238,191)]).
midline(r1, [xy(685,182),xy(770,183),xy(771,96),xy(764,88),xy(679,88)]).
midline(r1, [xy(610,129),xy(610,176),xy(612,189),xy(612,276)]).
midline(r1, [xy(648,188),xy(648,276)]).
midline(r1, [xy(441,174),xy(438,173),xy(436,175),xy(438,175),xy(437,179),xy(445,188),xy(442,193),xy(441,193),xy(438,190),xy(437,190),xy(437,192),xy(439,192)]).
midline(r1, [xy(443,193),xy(442,198),xy(438,202),xy(441,200)]).
midline(r1, [xy(771,183),xy(770,275),xy(767,278),xy(676,278)]).
midline(r1, [xy(770,276),xy(769,277)]).
midline(r1, [xy(524,86),xy(524,173),xy(525,175),xy(521,179),xy(524,177)]).
midline(r1, [xy(426,183),xy(425,188),xy(426,188),xy(427,187),xy(426,186),xy(427,186)]).
midline(r1, [xy(648,91),xy(649,89)]).
midline(r1, [xy(454,97),xy(464,85)]).
midline(r1, [xy(441,180),xy(439,176),xy(440,178),xy(441,177),xy(442,177),xy(442,178),xy(440,180),xy(444,184),xy(445,181),xy(443,178),xy(445,180)]).
midline(r1, [xy(446,183),xy(445,184),xy(445,185),xy(447,188),xy(446,189),xy(445,189),xy(448,192),xy(450,191),xy(448,189),xy(448,187),xy(449,186),xy(447,183),xy(449,185)]).
midline(r1, [xy(449,189),xy(450,190)]).
midline(r1, [xy(240,170),xy(238,171),xy(239,172),xy(239,173),xy(240,171)]).
midline(r1, [xy(506,181),xy(507,180)]).
fillpoint(r1, xy(751,102), 98.4).
fillpoint(r1, xy(101,101), 97.4).
fillpoint(r1, xy(745,101), 97.4).
fillpoint(r1, xy(105,100), 96.5).
fillpoint(r1, xy(741,100), 96.5).
fillpoint(r1, xy(753,263), 95.6).
fillpoint(r1, xy(110,99), 95.5).
fillpoint(r1, xy(736,99), 95.5).
fillpoint(r1, xy(751,264), 95.5).
fillpoint(r1, xy(99,264), 95.3).
fillpoint(r1, xy(115,98), 94.5).
fillpoint(r1, xy(732,98), 94.5).
fillpoint(r1, xy(103,265), 94.5).
fillpoint(r1, xy(747,265), 94.5).
fillpoint(r1, xy(119,97), 93.6).
fillpoint(r1, xy(727,97), 93.6).
fillpoint(r1, xy(107,266), 93.6).
fillpoint(r1, xy(742,266), 93.6).
fillpoint(r1, xy(124,96), 92.6).
fillpoint(r1, xy(722,96), 92.6).
fillpoint(r1, xy(757,114), 92.6).
fillpoint(r1, xy(757,256), 92.6).
fillpoint(r1, xy(112,267), 92.6).
fillpoint(r1, xy(738,267), 92.6).
fillpoint(r1, xy(129,95), 91.7).
fillpoint(r1, xy(718,95), 91.7).
fillpoint(r1, xy(758,119), 91.7).
fillpoint(r1, xy(758,252), 91.7).
fillpoint(r1, xy(95,257), 91.7).
fillpoint(r1, xy(116,268), 91.7).
fillpoint(r1, xy(733,268), 91.7).
fillpoint(r1, xy(133,94), 90.7).
fillpoint(r1, xy(713,94), 90.7).
fillpoint(r1, xy(759,123), 90.7).
fillpoint(r1, xy(759,247), 90.7).
fillpoint(r1, xy(94,253), 90.7).
fillpoint(r1, xy(121,269), 90.7).
fillpoint(r1, xy(728,269), 90.7).
fillpoint(r1, xy(138,93), 89.8).
fillpoint(r1, xy(709,93), 89.8).
fillpoint(r1, xy(760,128), 89.8).
fillpoint(r1, xy(760,243), 89.8).
fillpoint(r1, xy(93,248), 89.8).
fillpoint(r1, xy(126,270), 89.8).
fillpoint(r1, xy(724,270), 89.8).
fillpoint(r1, xy(142,92), 88.8).
fillpoint(r1, xy(704,92), 88.8).
fillpoint(r1, xy(92,118), 88.8).
fillpoint(r1, xy(761,132), 88.8).
fillpoint(r1, xy(761,238), 88.8).
fillpoint(r1, xy(92,244), 88.8).
fillpoint(r1, xy(130,271), 88.8).
fillpoint(r1, xy(719,271), 88.8).
fillpoint(r1, xy(147,91), 87.9).
fillpoint(r1, xy(699,91), 87.9).
fillpoint(r1, xy(91,122), 87.9).
fillpoint(r1, xy(762,137), 87.9).
fillpoint(r1, xy(762,233), 87.9).
fillpoint(r1, xy(91,239), 87.9).
fillpoint(r1, xy(135,272), 87.9).
fillpoint(r1, xy(714,272), 87.9).
fillpoint(r1, xy(152,90), 86.9).
fillpoint(r1, xy(695,90), 86.9).
fillpoint(r1, xy(90,127), 86.9).
fillpoint(r1, xy(763,142), 86.9).
fillpoint(r1, xy(763,229), 86.9).
fillpoint(r1, xy(90,234), 86.9).
fillpoint(r1, xy(139,273), 86.9).
fillpoint(r1, xy(710,273), 86.9).
fillpoint(r1, xy(156,89), 86.0).
fillpoint(r1, xy(610,89), 86.0).
fillpoint(r1, xy(625,89), 86.0).
fillpoint(r1, xy(655,89), 86.0).
fillpoint(r1, xy(690,89), 86.0).
fillpoint(r1, xy(764,146), 86.0).
fillpoint(r1, xy(764,224), 86.0).
fillpoint(r1, xy(144,274), 86.0).
fillpoint(r1, xy(705,274), 86.0).
fillpoint(r1, xy(89,131), 85.9).
fillpoint(r1, xy(89,230), 85.9).
fillpoint(r1, xy(680,89), 85.8).
fillpoint(r1, xy(636,89), 85.4).
fillpoint(r1, xy(648,89), 85.4).
fillpoint(r1, xy(664,89), 85.4).
fillpoint(r1, xy(175,88), 85.0).
fillpoint(r1, xy(604,88), 85.0).
fillpoint(r1, xy(614,89), 85.0).
fillpoint(r1, xy(629,89), 85.0).
fillpoint(r1, xy(638,89), 85.0).
fillpoint(r1, xy(650,89), 85.0).
fillpoint(r1, xy(660,89), 85.0).
fillpoint(r1, xy(666,89), 85.0).
fillpoint(r1, xy(683,89), 85.0).
fillpoint(r1, xy(88,136), 85.0).
fillpoint(r1, xy(765,151), 85.0).
fillpoint(r1, xy(765,219), 85.0).
fillpoint(r1, xy(88,225), 85.0).
fillpoint(r1, xy(149,275), 85.0).
fillpoint(r1, xy(701,275), 85.0).
fillpoint(r1, xy(180,87), 84.0).
fillpoint(r1, xy(480,87), 84.0).
fillpoint(r1, xy(592,87), 84.0).
fillpoint(r1, xy(87,141), 84.0).
fillpoint(r1, xy(766,155), 84.0).
fillpoint(r1, xy(766,215), 84.0).
fillpoint(r1, xy(87,220), 84.0).
fillpoint(r1, xy(153,276), 84.0).
fillpoint(r1, xy(316,276), 84.0).
fillpoint(r1, xy(696,276), 84.0).
fillpoint(r1, xy(324,87), 83.9).
fillpoint(r1, xy(232,276), 83.9).
fillpoint(r1, xy(379,276), 83.9).
fillpoint(r1, xy(573,276), 83.8).
fillpoint(r1, xy(406,276), 83.5).
fillpoint(r1, xy(432,276), 83.5).
fillpoint(r1, xy(185,86), 83.1).
fillpoint(r1, xy(245,86), 83.1).
fillpoint(r1, xy(277,86), 83.1).
fillpoint(r1, xy(320,86), 83.1).
fillpoint(r1, xy(328,86), 83.1).
fillpoint(r1, xy(419,86), 83.1).
fillpoint(r1, xy(442,86), 83.1).
fillpoint(r1, xy(475,86), 83.1).
fillpoint(r1, xy(485,86), 83.1).
fillpoint(r1, xy(498,86), 83.1).
fillpoint(r1, xy(537,86), 83.1).
fillpoint(r1, xy(569,86), 83.1).
fillpoint(r1, xy(573,86), 83.1).
fillpoint(r1, xy(587,86), 83.1).
fillpoint(r1, xy(571,87), 83.1).
fillpoint(r1, xy(86,145), 83.1).
fillpoint(r1, xy(767,160), 83.1).
fillpoint(r1, xy(767,210), 83.1).
fillpoint(r1, xy(86,216), 83.1).
fillpoint(r1, xy(443,276), 83.1).
fillpoint(r1, xy(580,276), 83.1).
fillpoint(r1, xy(158,277), 83.1).
fillpoint(r1, xy(172,277), 83.1).
fillpoint(r1, xy(228,277), 83.1).
fillpoint(r1, xy(239,277), 83.1).
fillpoint(r1, xy(280,277), 83.1).
fillpoint(r1, xy(311,277), 83.1).
fillpoint(r1, xy(323,277), 83.1).
fillpoint(r1, xy(375,277), 83.1).
fillpoint(r1, xy(383,277), 83.1).
fillpoint(r1, xy(403,277), 83.1).
fillpoint(r1, xy(409,277), 83.1).
fillpoint(r1, xy(429,277), 83.1).
fillpoint(r1, xy(435,277), 83.1).
fillpoint(r1, xy(441,277), 83.1).
fillpoint(r1, xy(445,277), 83.1).
fillpoint(r1, xy(490,277), 83.1).
fillpoint(r1, xy(537,277), 83.1).
fillpoint(r1, xy(557,277), 83.1).
fillpoint(r1, xy(569,277), 83.1).
fillpoint(r1, xy(577,277), 83.1).
fillpoint(r1, xy(582,277), 83.1).
fillpoint(r1, xy(691,277), 83.1).
fillpoint(r1, xy(178,277), 83.0).
fillpoint(r1, xy(564,277), 83.0).
fillpoint(r1, xy(311,86), 82.8).
fillpoint(r1, xy(403,86), 82.8).
fillpoint(r1, xy(556,86), 82.8).
fillpoint(r1, xy(578,86), 82.8).
fillpoint(r1, xy(203,277), 82.8).
fillpoint(r1, xy(475,277), 82.8).
fillpoint(r1, xy(506,277), 82.8).
fillpoint(r1, xy(521,277), 82.8).
fillpoint(r1, xy(657,277), 82.8).
fillpoint(r1, xy(677,277), 82.8).
fillpoint(r1, xy(433,86), 82.4).
fillpoint(r1, xy(346,277), 82.4).
fillpoint(r1, xy(357,277), 82.4).
fillpoint(r1, xy(596,277), 82.4).
fillpoint(r1, xy(666,277), 82.4).
fillpoint(r1, xy(189,85), 82.1).
fillpoint(r1, xy(240,85), 82.1).
fillpoint(r1, xy(261,85), 82.1).
fillpoint(r1, xy(295,85), 82.1).
fillpoint(r1, xy(315,85), 82.1).
fillpoint(r1, xy(337,85), 82.1).
fillpoint(r1, xy(398,85), 82.1).
fillpoint(r1, xy(411,85), 82.1).
fillpoint(r1, xy(427,85), 82.1).
fillpoint(r1, xy(436,85), 82.1).
fillpoint(r1, xy(459,85), 82.1).
fillpoint(r1, xy(491,85), 82.1).
fillpoint(r1, xy(518,85), 82.1).
fillpoint(r1, xy(547,85), 82.1).
fillpoint(r1, xy(562,85), 82.1).
fillpoint(r1, xy(582,85), 82.1).
fillpoint(r1, xy(85,150), 82.1).
fillpoint(r1, xy(768,165), 82.1).
fillpoint(r1, xy(768,206), 82.1).
fillpoint(r1, xy(85,211), 82.1).
fillpoint(r1, xy(165,278), 82.1).
fillpoint(r1, xy(191,278), 82.1).
fillpoint(r1, xy(215,278), 82.1).
fillpoint(r1, xy(260,278), 82.1).
fillpoint(r1, xy(296,278), 82.1).
fillpoint(r1, xy(336,278), 82.1).
fillpoint(r1, xy(351,278), 82.1).
fillpoint(r1, xy(365,278), 82.1).
fillpoint(r1, xy(393,278), 82.1).
fillpoint(r1, xy(419,278), 82.1).
fillpoint(r1, xy(460,278), 82.1).
fillpoint(r1, xy(482,278), 82.1).
fillpoint(r1, xy(498,278), 82.1).
fillpoint(r1, xy(514,278), 82.1).
fillpoint(r1, xy(529,278), 82.1).
fillpoint(r1, xy(547,278), 82.1).
fillpoint(r1, xy(590,278), 82.1).
fillpoint(r1, xy(626,278), 82.1).
fillpoint(r1, xy(662,278), 82.1).
fillpoint(r1, xy(671,278), 82.1).
fillpoint(r1, xy(684,278), 82.1).
fillpoint(r1, xy(194,84), 81.2).
fillpoint(r1, xy(234,84), 81.2).
fillpoint(r1, xy(347,84), 81.2).
fillpoint(r1, xy(391,84), 81.2).
fillpoint(r1, xy(84,154), 81.2).
fillpoint(r1, xy(769,169), 81.2).
fillpoint(r1, xy(769,201), 81.2).
fillpoint(r1, xy(84,207), 81.2).
fillpoint(r1, xy(199,83), 80.2).
fillpoint(r1, xy(230,83), 80.2).
fillpoint(r1, xy(352,83), 80.2).
fillpoint(r1, xy(387,83), 80.2).
fillpoint(r1, xy(83,159), 80.2).
fillpoint(r1, xy(770,174), 80.2).
fillpoint(r1, xy(770,196), 80.2).
fillpoint(r1, xy(83,202), 80.2).
fillpoint(r1, xy(203,82), 79.3).
fillpoint(r1, xy(225,82), 79.3).
fillpoint(r1, xy(356,82), 79.3).
fillpoint(r1, xy(382,82), 79.3).
fillpoint(r1, xy(82,164), 79.3).
fillpoint(r1, xy(771,178), 79.3).
fillpoint(r1, xy(771,180), 79.3).
fillpoint(r1, xy(771,184), 79.3).
fillpoint(r1, xy(771,189), 79.3).
fillpoint(r1, xy(771,192), 79.3).
fillpoint(r1, xy(82,197), 79.3).
fillpoint(r1, xy(207,82), 78.3).
fillpoint(r1, xy(360,82), 78.3).
fillpoint(r1, xy(81,168), 78.3).
fillpoint(r1, xy(81,192), 78.3).
fillpoint(r1, xy(80,173), 77.4).
fillpoint(r1, xy(80,185), 77.4).
fillpoint(r1, xy(79,179), 76.4).
border(r1).
region(r45, '#646d71', 369, centroid(466,182)).
perimeter(r45, 118).
polygon(r45, [xy(456,171),xy(458,172),xy(458,190),xy(456,192),xy(470,192),xy(476,185),xy(476,177),xy(468,171),xy(456,171)]).
hole(r45, [xy(469,190),xy(471,190),xy(469,190)]).
hole(r45, [xy(460,190),xy(462,190),xy(460,190)]).
hole(r45, [xy(472,177),xy(474,177),xy(472,177)]).
hole(r45, [xy(471,175),xy(473,175),xy(471,175)]).
hole(r45, [xy(469,174),xy(472,174),xy(469,174)]).
hole(r45, [xy(467,173),xy(470,173),xy(467,173)]).
midline(r45, [xy(456,171),xy(458,171),xy(463,175),xy(465,184),xy(459,191),xy(461,191),xy(462,189)]).
midline(r45, [xy(466,181),xy(471,177),xy(469,175),xy(469,174),xy(470,173),xy(469,172),xy(466,172),xy(464,175),xy(466,173)]).
midline(r45, [xy(463,187),xy(466,185),xy(469,191),xy(470,191),xy(471,190),xy(470,189),xy(471,189)]).
midline(r45, [xy(470,172),xy(471,173),xy(472,173),xy(471,175),xy(472,177),xy(471,178),xy(473,178),xy(474,177),xy(473,174)]).
fillpoint(r45, xy(466,182), 8.6).
fillpoint(r45, xy(463,176), 5.7).
region(r3, '#2a3235', 253, centroid(217,178)).
perimeter(r3, 206).
polygon(r3, [xy(207,164),xy(210,166),xy(210,190),xy(208,192),xy(223,192),xy(229,186),xy(228,180),xy(223,176),xy(226,168),xy(221,164),xy(207,164)]).
hole(r3, [xy(213,178),xy(223,178),xy(226,181),xy(226,188),xy(223,191),xy(214,191),xy(213,178)]).
hole(r3, [xy(213,166),xy(220,165),xy(224,169),xy(224,174),xy(221,177),xy(215,177),xy(213,175),xy(213,166)]).
midline(r3, [xy(207,164),xy(211,165),xy(211,191),xy(224,191),xy(227,186),xy(227,181),xy(223,177),xy(212,177)]).
midline(r3, [xy(225,178),xy(226,179)]).
midline(r3, [xy(212,165),xy(222,165),xy(225,169),xy(224,175)]).
fillpoint(r3, xy(212,177), 2.3).
fillpoint(r3, xy(211,170), 1.9).
fillpoint(r3, xy(225,170), 1.9).
fillpoint(r3, xy(212,185), 1.9).
fillpoint(r3, xy(227,184), 1.9).
fillpoint(r3, xy(221,165), 1.4).
fillpoint(r3, xy(223,167), 1.4).
fillpoint(r3, xy(223,177), 1.4).
fillpoint(r3, xy(224,178), 1.4).
fillpoint(r3, xy(226,179), 1.4).
region(r137, '#8e969a', 250, centroid(547,181)).
perimeter(r137, 68).
polygon(r137, [xy(542,173),xy(539,176),xy(539,185),xy(544,190),xy(552,189),xy(554,187),xy(553,176),xy(549,173),xy(542,173)]).
midline(r137, [xy(547,182),xy(546,181)]).
fillpoint(r137, xy(547,181), 7.6).
region(r120, '#8d9699', 249, centroid(393,181)).
perimeter(r120, 68).
polygon(r120, [xy(389,173),xy(386,176),xy(386,185),xy(391,190),xy(399,189),xy(401,186),xy(400,176),xy(396,173),xy(389,173)]).
midline(r120, [xy(394,182),xy(393,181)]).
fillpoint(r120, xy(394,181), 7.6).
region(r348, '#4f5559', 6, centroid(324,182)).
perimeter(r348, 14).
polygon(r348, [xy(321,182),xy(326,182),xy(321,182)]).
midline(r348, [xy(326,182),xy(321,182)]).

adjacent(r1, r3).
shared_edge(r1, r3, 76).
adjacent(r1, r45).
shared_edge(r1, r45, 60).
adjacent(r1, r348).
shared_edge(r1, r348, 14).

encloses(r1, r348).

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
opencv_component(cc1, [r3]).
opencv_component_area(cc1, 253).
opencv_component_centroid(cc1, centroid(217,178)).
opencv_component(cc2, [r45]).
opencv_component_area(cc2, 369).
opencv_component_centroid(cc2, centroid(466,182)).
opencv_component(cc3, [r120]).
opencv_component_area(cc3, 249).
opencv_component_centroid(cc3, centroid(393,181)).
opencv_component(cc4, [r137]).
opencv_component_area(cc4, 250).
opencv_component_centroid(cc4, centroid(547,181)).
opencv_component(cc5, [r348]).
opencv_component_area(cc5, 6).
opencv_component_centroid(cc5, centroid(324,182)).
opencv_morphology(r1, opening_area(306237), closing_area(309577), gradient_area(9164)).
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
opencv_contour(r1, c19, hole, 5.5).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 5.5).
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
opencv_contour(r1, c40, hole, 2.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 12.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
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
opencv_contour(r1, c50, hole, 2.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 2.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 15.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 92.5).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 95.5).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 131.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 109.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 97.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 118.5).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 136.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 111.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 2.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 2.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 2.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 109.5).
opencv_contour_hierarchy(r1, c65, next(c66), previous(c64), child(none), parent(c0)).
opencv_contour(r1, c66, hole, 230.0).
opencv_contour_hierarchy(r1, c66, next(c67), previous(c65), child(none), parent(c0)).
opencv_contour(r1, c67, hole, 2.0).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 2.0).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 29.5).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 2.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 2.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 5.5).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 2.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 2.0).
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
opencv_contour(r1, c85, hole, 2.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 2.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 4.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 458.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 133.5).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 165.5).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 218.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 432.5).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 79.5).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 4.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 14.5).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 141.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 466.5).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 289.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 2.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 439.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 242.5).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 215.5).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 2.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 278.5).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 568.5).
opencv_contour_hierarchy(r1, c105, next(none), previous(c104), child(none), parent(c0)).
opencv_morphology(r3, opening_area(198), closing_area(287), gradient_area(330)).
opencv_shape_metrics(r3, contour_area(453.0), hull_area(545.5), solidity(0.830431), circularity(0.589305), extent(0.67916), aspect_ratio(0.793103)).
opencv_contour(r3, c0, outer, 453.0).
opencv_contour_hierarchy(r3, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r3, c1, hole, 167.5).
opencv_contour_hierarchy(r3, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r3, c2, hole, 117.0).
opencv_contour_hierarchy(r3, c2, next(none), previous(c1), child(none), parent(c0)).
opencv_morphology(r45, opening_area(352), closing_area(409), gradient_area(175)).
opencv_shape_metrics(r45, contour_area(340.5), hull_area(381.5), solidity(0.892529), circularity(0.717701), extent(0.737013), aspect_ratio(0.954545)).
opencv_contour(r45, c0, outer, 340.5).
opencv_contour_hierarchy(r45, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r45, c1, hole, 2.0).
opencv_contour_hierarchy(r45, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r45, c2, hole, 2.0).
opencv_contour_hierarchy(r45, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r45, c3, hole, 2.0).
opencv_contour_hierarchy(r45, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r45, c4, hole, 2.0).
opencv_contour_hierarchy(r45, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r45, c5, hole, 4.0).
opencv_contour_hierarchy(r45, c5, next(c6), previous(c4), child(none), parent(c0)).
opencv_contour(r45, c6, hole, 4.0).
opencv_contour_hierarchy(r45, c6, next(none), previous(c5), child(none), parent(c0)).
opencv_morphology(r120, opening_area(249), closing_area(275), gradient_area(104)).
opencv_shape_metrics(r120, contour_area(223.0), hull_area(226.5), solidity(0.984547), circularity(0.900041), extent(0.774306), aspect_ratio(0.888889)).
opencv_contour(r120, c0, outer, 223.0).
opencv_contour_hierarchy(r120, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r137, opening_area(250), closing_area(277), gradient_area(104)).
opencv_shape_metrics(r137, contour_area(224.0), hull_area(227.0), solidity(0.986784), circularity(0.904077), extent(0.777778), aspect_ratio(0.888889)).
opencv_contour(r137, c0, outer, 224.0).
opencv_contour_hierarchy(r137, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r348, opening_area(0), closing_area(14), gradient_area(20)).
opencv_shape_metrics(r348, contour_area(0.0), hull_area(0.0), solidity(0.0), circularity(0.0), extent(0.0), aspect_ratio(6.0)).
opencv_contour(r348, c0, outer, 0.0).
opencv_contour_hierarchy(r348, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r3, 2).
opencv_watershed_segment(r3, ws1, 72, centroid(214,176)).
opencv_watershed_segment(r3, ws2, 20, centroid(227,182)).
opencv_watershed_count(r45, 2).
opencv_watershed_segment(r45, ws1, 266, centroid(466,181)).
opencv_watershed_segment(r45, ws2, 2, centroid(466,191)).
opencv_watershed_count(r120, 1).
opencv_watershed_segment(r120, ws1, 204, centroid(394,181)).
opencv_watershed_count(r137, 1).
opencv_watershed_segment(r137, ws1, 204, centroid(547,181)).
opencv_watershed_count(r348, 1).
opencv_watershed_segment(r348, ws1, 6, centroid(323,182)).
