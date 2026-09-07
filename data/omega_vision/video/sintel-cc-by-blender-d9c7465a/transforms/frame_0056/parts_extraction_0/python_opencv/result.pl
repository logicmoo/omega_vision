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

region(r1, '#898273', 310699, centroid(426,181)).
perimeter(r1, 2970).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(366,281),xy(367,283),xy(365,284),xy(366,281)]).
hole(r1, [xy(366,281),xy(368,281),xy(366,281)]).
hole(r1, [xy(367,280),xy(369,280),xy(367,280)]).
hole(r1, [xy(368,279),xy(370,279),xy(368,279)]).
hole(r1, [xy(331,279),xy(333,279),xy(331,279)]).
hole(r1, [xy(332,278),xy(334,278),xy(332,278)]).
hole(r1, [xy(333,277),xy(335,277),xy(333,277)]).
hole(r1, [xy(371,274),xy(372,277),xy(370,279),xy(371,274)]).
hole(r1, [xy(334,275),xy(336,275),xy(334,275)]).
hole(r1, [xy(371,274),xy(373,274),xy(371,274)]).
hole(r1, [xy(372,273),xy(374,273),xy(372,273)]).
hole(r1, [xy(373,272),xy(375,272),xy(373,272)]).
hole(r1, [xy(336,271),xy(336,275),xy(336,271)]).
hole(r1, [xy(384,270),xy(386,270),xy(384,270)]).
hole(r1, [xy(392,267),xy(393,271),xy(390,274),xy(389,272),xy(392,267)]).
hole(r1, [xy(338,268),xy(340,268),xy(338,268)]).
hole(r1, [xy(390,267),xy(392,267),xy(390,267)]).
hole(r1, [xy(480,265),xy(482,265),xy(480,265)]).
hole(r1, [xy(477,264),xy(479,264),xy(477,264)]).
hole(r1, [xy(479,262),xy(481,262),xy(479,262)]).
hole(r1, [xy(388,262),xy(391,264),xy(389,265),xy(388,262)]).
hole(r1, [xy(381,262),xy(383,262),xy(381,262)]).
hole(r1, [xy(377,262),xy(379,262),xy(377,262)]).
hole(r1, [xy(478,261),xy(480,261),xy(478,261)]).
hole(r1, [xy(378,261),xy(380,261),xy(378,261)]).
hole(r1, [xy(389,260),xy(391,260),xy(389,260)]).
hole(r1, [xy(387,258),xy(389,258),xy(387,258)]).
hole(r1, [xy(381,256),xy(380,260),xy(381,256)]).
hole(r1, [xy(381,256),xy(383,256),xy(381,256)]).
hole(r1, [xy(384,251),xy(383,256),xy(382,253),xy(384,251)]).
hole(r1, [xy(392,250),xy(394,250),xy(392,250)]).
hole(r1, [xy(384,250),xy(386,251),xy(384,250)]).
hole(r1, [xy(385,249),xy(387,249),xy(385,249)]).
hole(r1, [xy(513,248),xy(515,248),xy(513,248)]).
hole(r1, [xy(393,248),xy(395,248),xy(393,248)]).
hole(r1, [xy(386,247),xy(388,248),xy(386,247)]).
hole(r1, [xy(510,246),xy(512,246),xy(510,246)]).
hole(r1, [xy(387,246),xy(389,246),xy(387,246)]).
hole(r1, [xy(509,245),xy(511,245),xy(509,245)]).
hole(r1, [xy(508,244),xy(510,244),xy(508,244)]).
hole(r1, [xy(506,243),xy(508,243),xy(506,243)]).
hole(r1, [xy(505,242),xy(507,242),xy(505,242)]).
hole(r1, [xy(504,241),xy(506,241),xy(504,241)]).
hole(r1, [xy(503,240),xy(505,240),xy(503,240)]).
hole(r1, [xy(501,239),xy(503,239),xy(501,239)]).
hole(r1, [xy(500,238),xy(502,238),xy(500,238)]).
hole(r1, [xy(498,237),xy(501,237),xy(498,237)]).
hole(r1, [xy(497,236),xy(499,236),xy(497,236)]).
hole(r1, [xy(496,235),xy(498,235),xy(496,235)]).
hole(r1, [xy(494,234),xy(497,234),xy(494,234)]).
hole(r1, [xy(493,233),xy(495,233),xy(493,233)]).
hole(r1, [xy(515,232),xy(517,232),xy(515,232)]).
hole(r1, [xy(492,232),xy(494,232),xy(492,232)]).
hole(r1, [xy(514,231),xy(516,231),xy(514,231)]).
hole(r1, [xy(489,231),xy(493,231),xy(489,231)]).
hole(r1, [xy(385,231),xy(389,231),xy(385,231)]).
hole(r1, [xy(513,230),xy(515,230),xy(513,230)]).
hole(r1, [xy(488,230),xy(490,230),xy(488,230)]).
hole(r1, [xy(512,229),xy(514,229),xy(512,229)]).
hole(r1, [xy(487,229),xy(489,229),xy(487,229)]).
hole(r1, [xy(384,229),xy(386,230),xy(384,229)]).
hole(r1, [xy(511,228),xy(513,228),xy(511,228)]).
hole(r1, [xy(486,228),xy(488,228),xy(486,228)]).
hole(r1, [xy(388,228),xy(390,228),xy(388,228)]).
hole(r1, [xy(510,227),xy(512,227),xy(510,227)]).
hole(r1, [xy(485,227),xy(487,227),xy(485,227)]).
hole(r1, [xy(389,227),xy(391,227),xy(389,227)]).
hole(r1, [xy(509,226),xy(511,226),xy(509,226)]).
hole(r1, [xy(390,226),xy(392,226),xy(390,226)]).
hole(r1, [xy(508,225),xy(510,225),xy(508,225)]).
hole(r1, [xy(484,225),xy(486,226),xy(484,225)]).
hole(r1, [xy(483,224),xy(485,224),xy(483,224)]).
hole(r1, [xy(503,219),xy(505,219),xy(503,219)]).
hole(r1, [xy(502,218),xy(504,218),xy(502,218)]).
hole(r1, [xy(515,210),xy(517,210),xy(515,210)]).
hole(r1, [xy(514,209),xy(516,209),xy(514,209)]).
hole(r1, [xy(513,208),xy(515,208),xy(513,208)]).
hole(r1, [xy(510,206),xy(514,207),xy(510,206)]).
hole(r1, [xy(516,205),xy(518,205),xy(516,205)]).
hole(r1, [xy(509,205),xy(511,205),xy(509,205)]).
hole(r1, [xy(515,203),xy(517,203),xy(515,203)]).
hole(r1, [xy(514,201),xy(516,201),xy(514,201)]).
hole(r1, [xy(509,191),xy(511,192),xy(509,191)]).
hole(r1, [xy(507,188),xy(510,190),xy(507,188)]).
hole(r1, [xy(506,187),xy(508,187),xy(506,187)]).
hole(r1, [xy(505,186),xy(507,186),xy(505,186)]).
hole(r1, [xy(504,184),xy(506,184),xy(504,184)]).
hole(r1, [xy(503,183),xy(505,183),xy(503,183)]).
hole(r1, [xy(500,181),xy(504,182),xy(500,181)]).
hole(r1, [xy(483,181),xy(485,181),xy(483,181)]).
hole(r1, [xy(499,180),xy(501,180),xy(499,180)]).
hole(r1, [xy(498,179),xy(500,179),xy(498,179)]).
hole(r1, [xy(429,179),xy(431,179),xy(429,179)]).
hole(r1, [xy(497,178),xy(499,178),xy(497,178)]).
hole(r1, [xy(496,177),xy(498,177),xy(496,177)]).
hole(r1, [xy(491,175),xy(493,175),xy(491,175)]).
hole(r1, [xy(447,175),xy(449,175),xy(447,175)]).
hole(r1, [xy(489,174),xy(491,174),xy(489,174)]).
hole(r1, [xy(488,173),xy(490,173),xy(488,173)]).
hole(r1, [xy(487,172),xy(489,172),xy(487,172)]).
hole(r1, [xy(550,171),xy(552,171),xy(550,171)]).
hole(r1, [xy(559,166),xy(561,166),xy(559,166)]).
hole(r1, [xy(458,80),xy(460,80),xy(458,80)]).
hole(r1, [xy(457,79),xy(459,79),xy(457,79)]).
hole(r1, [xy(396,79),xy(398,79),xy(396,79)]).
hole(r1, [xy(456,78),xy(458,78),xy(456,78)]).
hole(r1, [xy(454,76),xy(456,76),xy(454,76)]).
hole(r1, [xy(399,76),xy(401,76),xy(399,76)]).
hole(r1, [xy(452,75),xy(454,75),xy(452,75)]).
hole(r1, [xy(449,73),xy(451,73),xy(449,73)]).
hole(r1, [xy(438,68),xy(440,68),xy(438,68)]).
midline(r1, [xy(400,312),xy(352,266),xy(351,287),xy(320,318),xy(289,317),xy(167,195),xy(168,166),xy(198,136),xy(243,136),xy(249,129),xy(254,127),xy(385,258),xy(384,261),xy(378,260),xy(377,263),xy(378,263),xy(379,262),xy(378,261)]).
midline(r1, [xy(353,265),xy(354,254),xy(352,253),xy(338,267),xy(338,269),xy(339,269),xy(340,267)]).
midline(r1, [xy(244,137),xy(355,248),xy(354,253),xy(356,252),xy(370,266),xy(377,267),xy(371,273),xy(371,274),xy(373,272),xy(374,273),xy(372,275),xy(378,268),xy(380,261),xy(381,263),xy(383,263)]).
midline(r1, [xy(368,282),xy(367,282),xy(366,280),xy(368,278),xy(368,279),xy(370,280)]).
midline(r1, [xy(341,265),xy(352,254)]).
midline(r1, [xy(379,269),xy(380,282),xy(416,318),xy(413,321),xy(409,321),xy(401,313)]).
midline(r1, [xy(415,320),xy(417,318),xy(437,318),xy(455,300),xy(446,291),xy(441,275),xy(438,272),xy(438,223),xy(436,222),xy(392,266),xy(381,271)]).
midline(r1, [xy(386,269),xy(386,270),xy(385,271),xy(384,271)]).
midline(r1, [xy(436,223),xy(390,267),xy(390,268)]).
midline(r1, [xy(438,222),xy(435,216),xy(404,247),xy(391,240),xy(379,239),xy(373,241),xy(258,126),xy(255,127)]).
midline(r1, [xy(377,241),xy(383,251),xy(384,251),xy(385,252),xy(387,251),xy(383,247)]).
midline(r1, [xy(385,248),xy(387,249),xy(387,252)]).
midline(r1, [xy(389,251),xy(392,253),xy(393,247),xy(395,247),xy(395,248),xy(394,249),xy(393,249),xy(394,250),xy(393,251),xy(402,248)]).
midline(r1, [xy(393,253),xy(390,257),xy(387,257),xy(386,258),xy(387,259),xy(388,259),xy(389,258),xy(389,261),xy(390,261),xy(391,260),xy(390,258),xy(393,255)]).
midline(r1, [xy(435,217),xy(405,247)]).
midline(r1, [xy(385,238),xy(385,231),xy(386,230),xy(386,228),xy(388,227),xy(389,229),xy(390,228),xy(389,227),xy(389,226),xy(434,182),xy(434,174),xy(374,114),xy(270,114),xy(259,125),xy(268,116)]).
midline(r1, [xy(390,229),xy(392,225)]).
midline(r1, [xy(435,183),xy(437,216)]).
midline(r1, [xy(430,171),xy(429,180),xy(430,180),xy(431,179),xy(430,178),xy(431,178)]).
midline(r1, [xy(435,174),xy(483,222),xy(483,225),xy(484,225),xy(485,224),xy(484,223),xy(485,223)]).
midline(r1, [xy(350,289),xy(321,318),xy(325,323),xy(407,323),xy(408,321)]).
midline(r1, [xy(455,301),xy(480,299),xy(480,266),xy(478,265),xy(477,264),xy(477,263),xy(478,260),xy(480,260),xy(480,261),xy(478,263),xy(480,265),xy(481,261)]).
midline(r1, [xy(482,264),xy(482,266)]).
midline(r1, [xy(480,300),xy(560,300),xy(562,297),xy(515,249),xy(514,249),xy(511,247),xy(500,238),xy(501,240)]).
midline(r1, [xy(508,245),xy(510,247)]).
midline(r1, [xy(562,298),xy(568,296),xy(578,285),xy(522,229),xy(516,230),xy(510,224),xy(508,224),xy(497,234),xy(446,287),xy(498,237)]).
midline(r1, [xy(506,227),xy(500,233)]).
midline(r1, [xy(578,286),xy(588,285),xy(665,208),xy(664,206),xy(519,206),xy(514,202),xy(513,199),xy(507,199),xy(493,209),xy(486,204),xy(480,204),xy(450,174),xy(448,173),xy(447,176),xy(449,175),xy(448,174)]).
midline(r1, [xy(515,204),xy(516,206),xy(514,207),xy(513,208),xy(513,209),xy(515,211),xy(516,211),xy(517,210),xy(515,208),xy(517,209)]).
midline(r1, [xy(448,172),xy(388,112),xy(377,112),xy(375,114)]).
midline(r1, [xy(507,200),xy(506,202),xy(509,206),xy(510,206),xy(511,205),xy(510,204),xy(511,204)]).
midline(r1, [xy(503,241),xy(506,244)]).
midline(r1, [xy(518,204),xy(514,199)]).
midline(r1, [xy(665,206),xy(668,206),xy(681,193),xy(681,190),xy(510,190),xy(492,207),xy(507,192)]).
midline(r1, [xy(518,206),xy(517,206)]).
midline(r1, [xy(458,181),xy(483,180),xy(483,182),xy(484,182),xy(485,181),xy(484,180),xy(485,180)]).
midline(r1, [xy(501,203),xy(495,209),xy(498,212),xy(498,217),xy(488,227),xy(487,226),xy(485,227),xy(486,230),xy(442,274),xy(487,230),xy(487,229),xy(488,228),xy(487,227)]).
midline(r1, [xy(682,190),xy(680,171),xy(550,170),xy(550,172),xy(552,172)]).
midline(r1, [xy(681,171),xy(604,94),xy(598,94),xy(594,90),xy(413,90),xy(398,102),xy(396,80),xy(396,78),xy(398,78),xy(398,80)]).
midline(r1, [xy(439,88),xy(438,67),xy(440,67),xy(440,69)]).
midline(r1, [xy(413,91),xy(410,95),xy(489,175),xy(490,175),xy(491,174),xy(489,171),xy(492,174),xy(491,175),xy(491,176),xy(492,176),xy(493,175),xy(493,174),xy(493,176)]).
midline(r1, [xy(675,166),xy(559,165),xy(559,167),xy(561,167)]).
midline(r1, [xy(405,96),xy(399,102)]).
midline(r1, [xy(458,88),xy(458,81),xy(456,78),xy(450,74),xy(449,73),xy(449,72),xy(456,75),xy(458,77),xy(457,79),xy(459,78),xy(460,81)]).
midline(r1, [xy(397,102),xy(389,111),xy(397,104)]).
midline(r1, [xy(447,279),xy(492,235),xy(492,232),xy(493,231),xy(494,231),xy(493,234),xy(495,233),xy(495,230),xy(504,221),xy(501,218),xy(498,218),xy(489,227),xy(489,229),xy(488,231),xy(489,231),xy(490,229)]).
midline(r1, [xy(505,220),xy(504,220),xy(502,218),xy(502,217),xy(509,220),xy(512,225),xy(511,226),xy(510,225),xy(508,226),xy(515,233),xy(516,233),xy(517,232),xy(512,227)]).
midline(r1, [xy(517,230),xy(517,231)]).
midline(r1, [xy(577,114),xy(507,184),xy(504,182),xy(503,183),xy(504,186),xy(486,203),xy(502,188)]).
midline(r1, [xy(509,183),xy(597,95)]).
midline(r1, [xy(505,183),xy(506,184),xy(505,187),xy(507,188),xy(508,187),xy(506,185),xy(508,186)]).
midline(r1, [xy(511,244),xy(502,237),xy(503,239)]).
midline(r1, [xy(510,244),xy(515,248)]).
midline(r1, [xy(508,243),xy(505,240)]).
midline(r1, [xy(312,300),xy(331,282),xy(331,278),xy(334,274),xy(336,275),xy(334,276),xy(335,277),xy(332,280),xy(335,278)]).
midline(r1, [xy(499,181),xy(495,176),xy(498,176),xy(497,178),xy(498,179),xy(499,178),xy(499,177),xy(500,178),xy(499,180),xy(500,181),xy(501,180),xy(501,179)]).
midline(r1, [xy(390,244),xy(389,245)]).
midline(r1, [xy(401,75),xy(399,75),xy(399,78),xy(401,77)]).
midline(r1, [xy(391,243),xy(392,242)]).
fillpoint(r1, xy(182,182), 173.8).
fillpoint(r1, xy(230,157), 150.9).
fillpoint(r1, xy(235,156), 149.9).
fillpoint(r1, xy(239,155), 149.0).
fillpoint(r1, xy(698,208), 149.0).
fillpoint(r1, xy(244,154), 148.0).
fillpoint(r1, xy(699,204), 148.0).
fillpoint(r1, xy(249,153), 147.1).
fillpoint(r1, xy(700,199), 147.1).
fillpoint(r1, xy(253,152), 146.1).
fillpoint(r1, xy(701,194), 146.1).
fillpoint(r1, xy(258,151), 145.2).
fillpoint(r1, xy(702,190), 145.2).
fillpoint(r1, xy(262,150), 144.2).
fillpoint(r1, xy(703,185), 144.2).
fillpoint(r1, xy(267,149), 143.3).
fillpoint(r1, xy(704,150), 143.3).
fillpoint(r1, xy(704,181), 143.3).
fillpoint(r1, xy(271,148), 142.3).
fillpoint(r1, xy(705,156), 142.3).
fillpoint(r1, xy(705,176), 142.3).
fillpoint(r1, xy(706,161), 141.3).
fillpoint(r1, xy(706,171), 141.3).
fillpoint(r1, xy(707,165), 140.4).
fillpoint(r1, xy(707,167), 140.4).
fillpoint(r1, xy(639,248), 110.8).
fillpoint(r1, xy(635,249), 109.8).
fillpoint(r1, xy(628,251), 107.9).
fillpoint(r1, xy(627,97), 93.6).
fillpoint(r1, xy(623,96), 92.6).
fillpoint(r1, xy(618,95), 91.7).
fillpoint(r1, xy(614,94), 90.7).
fillpoint(r1, xy(609,93), 89.8).
fillpoint(r1, xy(605,92), 88.8).
fillpoint(r1, xy(600,91), 87.9).
fillpoint(r1, xy(595,90), 86.9).
fillpoint(r1, xy(591,89), 86.0).
fillpoint(r1, xy(586,88), 85.0).
fillpoint(r1, xy(582,87), 84.0).
fillpoint(r1, xy(577,86), 83.1).
fillpoint(r1, xy(544,86), 83.0).
fillpoint(r1, xy(548,85), 82.1).
fillpoint(r1, xy(572,85), 82.1).
fillpoint(r1, xy(553,84), 81.2).
fillpoint(r1, xy(568,84), 81.2).
fillpoint(r1, xy(557,83), 80.2).
fillpoint(r1, xy(563,83), 80.2).
fillpoint(r1, xy(556,297), 64.0).
fillpoint(r1, xy(552,298), 63.0).
fillpoint(r1, xy(547,299), 62.1).
fillpoint(r1, xy(542,300), 61.1).
fillpoint(r1, xy(538,301), 60.2).
fillpoint(r1, xy(533,302), 59.2).
fillpoint(r1, xy(529,303), 58.3).
fillpoint(r1, xy(437,305), 56.1).
fillpoint(r1, xy(441,306), 55.4).
fillpoint(r1, xy(425,124), 54.6).
fillpoint(r1, xy(402,134), 54.6).
fillpoint(r1, xy(423,125), 54.5).
fillpoint(r1, xy(418,127), 54.5).
fillpoint(r1, xy(416,128), 54.5).
fillpoint(r1, xy(411,130), 54.5).
fillpoint(r1, xy(409,131), 54.5).
fillpoint(r1, xy(404,133), 54.5).
fillpoint(r1, xy(420,126), 54.4).
fillpoint(r1, xy(414,129), 54.4).
fillpoint(r1, xy(407,132), 54.4).
fillpoint(r1, xy(400,135), 54.4).
fillpoint(r1, xy(445,307), 54.4).
fillpoint(r1, xy(516,307), 54.4).
fillpoint(r1, xy(427,123), 54.3).
fillpoint(r1, xy(450,308), 53.5).
fillpoint(r1, xy(512,308), 53.5).
fillpoint(r1, xy(432,124), 53.2).
fillpoint(r1, xy(434,125), 53.2).
fillpoint(r1, xy(454,309), 52.5).
fillpoint(r1, xy(507,309), 52.5).
fillpoint(r1, xy(459,310), 51.6).
fillpoint(r1, xy(503,310), 51.6).
fillpoint(r1, xy(425,311), 50.6).
fillpoint(r1, xy(464,311), 50.6).
fillpoint(r1, xy(498,311), 50.6).
fillpoint(r1, xy(485,121), 49.9).
fillpoint(r1, xy(478,124), 49.9).
fillpoint(r1, xy(476,125), 49.9).
fillpoint(r1, xy(471,127), 49.9).
fillpoint(r1, xy(469,128), 49.9).
fillpoint(r1, xy(487,120), 49.8).
fillpoint(r1, xy(483,122), 49.8).
fillpoint(r1, xy(480,123), 49.8).
fillpoint(r1, xy(467,129), 49.8).
fillpoint(r1, xy(474,126), 49.7).
fillpoint(r1, xy(421,312), 49.7).
fillpoint(r1, xy(468,312), 49.7).
fillpoint(r1, xy(493,312), 49.7).
fillpoint(r1, xy(416,313), 48.7).
fillpoint(r1, xy(473,313), 48.7).
fillpoint(r1, xy(489,313), 48.7).
fillpoint(r1, xy(439,236), 47.9).
fillpoint(r1, xy(438,234), 47.8).
fillpoint(r1, xy(412,314), 47.8).
fillpoint(r1, xy(478,314), 47.8).
fillpoint(r1, xy(484,314), 47.8).
fillpoint(r1, xy(450,126), 47.6).
fillpoint(r1, xy(457,129), 47.6).
fillpoint(r1, xy(452,127), 47.5).
fillpoint(r1, xy(455,128), 47.5).
fillpoint(r1, xy(302,315), 46.8).
fillpoint(r1, xy(407,315), 46.8).
fillpoint(r1, xy(306,316), 45.8).
fillpoint(r1, xy(402,316), 45.8).
fillpoint(r1, xy(437,223), 44.9).
fillpoint(r1, xy(311,317), 44.9).
fillpoint(r1, xy(398,317), 44.9).
fillpoint(r1, xy(488,45), 43.9).
fillpoint(r1, xy(315,318), 43.9).
fillpoint(r1, xy(393,318), 43.9).
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
opencv_morphology(r1, opening_area(310694), closing_area(313284), gradient_area(5409)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 5.5).
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
opencv_contour(r1, c8, hole, 9.0).
opencv_contour_hierarchy(r1, c8, next(c9), previous(c7), child(none), parent(c0)).
opencv_contour(r1, c9, hole, 2.0).
opencv_contour_hierarchy(r1, c9, next(c10), previous(c8), child(none), parent(c0)).
opencv_contour(r1, c10, hole, 2.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 2.0).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 2.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 6.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 2.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 15.0).
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
opencv_contour(r1, c21, hole, 7.5).
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
opencv_contour(r1, c28, hole, 7.0).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 2.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 9.0).
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
opencv_contour(r1, c36, hole, 4.0).
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
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 2.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 2.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 2.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 4.0).
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
opencv_contour(r1, c55, hole, 6.0).
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
opencv_contour(r1, c78, hole, 7.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 2.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 2.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 2.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 2.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 4.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 7.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 2.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 2.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 2.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 2.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 7.0).
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
opencv_contour(r1, c108, hole, 2.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 2.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 2.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 2.0).
opencv_contour_hierarchy(r1, c111, next(none), previous(c110), child(none), parent(c0)).
