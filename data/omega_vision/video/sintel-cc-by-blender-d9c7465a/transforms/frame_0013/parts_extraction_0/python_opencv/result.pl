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

region(r1, '#9fa5a5', 310435, centroid(426,181)).
perimeter(r1, 3768).
polygon(r1, [xy(0,0),xy(0,22),xy(3,23),xy(0,24),xy(0,223),xy(2,224),xy(0,227),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(567,362),xy(569,362),xy(567,362)]).
hole(r1, [xy(565,360),xy(567,359),xy(568,361),xy(565,360)]).
hole(r1, [xy(564,358),xy(566,358),xy(564,358)]).
hole(r1, [xy(563,356),xy(565,356),xy(563,356)]).
hole(r1, [xy(562,354),xy(564,354),xy(562,354)]).
hole(r1, [xy(560,343),xy(562,343),xy(560,343)]).
hole(r1, [xy(559,342),xy(561,342),xy(559,342)]).
hole(r1, [xy(553,337),xy(555,337),xy(553,337)]).
hole(r1, [xy(545,335),xy(547,336),xy(545,335)]).
hole(r1, [xy(541,321),xy(543,321),xy(541,321)]).
hole(r1, [xy(412,319),xy(414,319),xy(412,319)]).
hole(r1, [xy(647,318),xy(649,319),xy(647,318)]).
hole(r1, [xy(646,316),xy(648,317),xy(646,316)]).
hole(r1, [xy(645,313),xy(647,314),xy(645,313)]).
hole(r1, [xy(644,312),xy(646,312),xy(644,312)]).
hole(r1, [xy(643,311),xy(645,311),xy(643,311)]).
hole(r1, [xy(597,310),xy(597,315),xy(597,310)]).
hole(r1, [xy(642,309),xy(644,310),xy(642,309)]).
hole(r1, [xy(594,308),xy(597,310),xy(594,308)]).
hole(r1, [xy(593,307),xy(595,307),xy(593,307)]).
hole(r1, [xy(641,306),xy(643,306),xy(641,306)]).
hole(r1, [xy(592,305),xy(594,306),xy(592,305)]).
hole(r1, [xy(591,303),xy(593,304),xy(591,303)]).
hole(r1, [xy(640,301),xy(642,301),xy(640,301)]).
hole(r1, [xy(590,301),xy(592,302),xy(590,301)]).
hole(r1, [xy(589,300),xy(591,300),xy(589,300)]).
hole(r1, [xy(409,299),xy(411,299),xy(409,299)]).
hole(r1, [xy(639,298),xy(641,299),xy(639,298)]).
hole(r1, [xy(588,298),xy(590,298),xy(588,298)]).
hole(r1, [xy(587,297),xy(589,297),xy(587,297)]).
hole(r1, [xy(408,296),xy(410,296),xy(408,296)]).
hole(r1, [xy(586,295),xy(588,295),xy(586,295)]).
hole(r1, [xy(407,295),xy(409,295),xy(407,295)]).
hole(r1, [xy(585,294),xy(587,294),xy(585,294)]).
hole(r1, [xy(584,292),xy(586,293),xy(584,292)]).
hole(r1, [xy(583,291),xy(585,291),xy(583,291)]).
hole(r1, [xy(582,289),xy(584,290),xy(582,289)]).
hole(r1, [xy(636,288),xy(638,288),xy(636,288)]).
hole(r1, [xy(635,286),xy(637,287),xy(635,286)]).
hole(r1, [xy(580,286),xy(583,288),xy(581,289),xy(580,286)]).
hole(r1, [xy(579,285),xy(581,285),xy(579,285)]).
hole(r1, [xy(404,285),xy(406,285),xy(404,285)]).
hole(r1, [xy(634,284),xy(636,284),xy(634,284)]).
hole(r1, [xy(578,283),xy(580,284),xy(578,283)]).
hole(r1, [xy(577,282),xy(579,282),xy(577,282)]).
hole(r1, [xy(403,282),xy(405,283),xy(403,282)]).
hole(r1, [xy(542,281),xy(544,281),xy(542,281)]).
hole(r1, [xy(632,280),xy(635,282),xy(632,280)]).
hole(r1, [xy(543,280),xy(545,280),xy(543,280)]).
hole(r1, [xy(402,280),xy(404,281),xy(402,280)]).
hole(r1, [xy(631,278),xy(633,279),xy(631,278)]).
hole(r1, [xy(576,277),xy(577,282),xy(575,280),xy(576,277)]).
hole(r1, [xy(401,278),xy(403,279),xy(401,278)]).
hole(r1, [xy(574,277),xy(576,277),xy(574,277)]).
hole(r1, [xy(573,276),xy(575,276),xy(573,276)]).
hole(r1, [xy(544,276),xy(546,277),xy(544,276)]).
hole(r1, [xy(400,276),xy(402,276),xy(400,276)]).
hole(r1, [xy(572,274),xy(574,274),xy(572,274)]).
hole(r1, [xy(545,274),xy(547,274),xy(545,274)]).
hole(r1, [xy(399,274),xy(401,275),xy(399,274)]).
hole(r1, [xy(571,273),xy(573,273),xy(571,273)]).
hole(r1, [xy(546,272),xy(548,273),xy(546,272)]).
hole(r1, [xy(629,271),xy(631,271),xy(629,271)]).
hole(r1, [xy(398,271),xy(400,271),xy(398,271)]).
hole(r1, [xy(547,270),xy(549,271),xy(547,270)]).
hole(r1, [xy(569,269),xy(572,271),xy(569,269)]).
hole(r1, [xy(548,269),xy(550,269),xy(548,269)]).
hole(r1, [xy(397,269),xy(399,269),xy(397,269)]).
hole(r1, [xy(628,268),xy(630,269),xy(628,268)]).
hole(r1, [xy(568,267),xy(570,268),xy(568,267)]).
hole(r1, [xy(627,266),xy(629,267),xy(627,266)]).
hole(r1, [xy(567,266),xy(569,266),xy(567,266)]).
hole(r1, [xy(549,266),xy(551,267),xy(549,266)]).
hole(r1, [xy(626,264),xy(628,265),xy(626,264)]).
hole(r1, [xy(566,264),xy(568,265),xy(566,264)]).
hole(r1, [xy(550,264),xy(552,265),xy(550,264)]).
hole(r1, [xy(625,262),xy(627,263),xy(625,262)]).
hole(r1, [xy(565,262),xy(567,263),xy(565,262)]).
hole(r1, [xy(551,262),xy(553,263),xy(551,262)]).
hole(r1, [xy(564,261),xy(566,261),xy(564,261)]).
hole(r1, [xy(624,260),xy(626,261),xy(624,260)]).
hole(r1, [xy(552,260),xy(554,261),xy(552,260)]).
hole(r1, [xy(394,260),xy(396,261),xy(394,260)]).
hole(r1, [xy(623,259),xy(625,259),xy(623,259)]).
hole(r1, [xy(553,258),xy(555,259),xy(553,258)]).
hole(r1, [xy(393,258),xy(395,258),xy(393,258)]).
hole(r1, [xy(622,257),xy(624,258),xy(622,257)]).
hole(r1, [xy(554,257),xy(556,257),xy(554,257)]).
hole(r1, [xy(621,256),xy(623,256),xy(621,256)]).
hole(r1, [xy(392,256),xy(394,256),xy(392,256)]).
hole(r1, [xy(620,254),xy(622,255),xy(620,254)]).
hole(r1, [xy(555,254),xy(557,254),xy(555,254)]).
hole(r1, [xy(619,252),xy(621,253),xy(619,252)]).
hole(r1, [xy(556,252),xy(558,252),xy(556,252)]).
hole(r1, [xy(618,251),xy(620,251),xy(618,251)]).
hole(r1, [xy(390,251),xy(392,251),xy(390,251)]).
hole(r1, [xy(617,249),xy(619,250),xy(617,249)]).
hole(r1, [xy(557,250),xy(562,248),xy(564,251),xy(558,252),xy(557,250)]).
hole(r1, [xy(616,248),xy(618,248),xy(616,248)]).
hole(r1, [xy(389,248),xy(391,248),xy(389,248)]).
hole(r1, [xy(615,246),xy(617,247),xy(615,246)]).
hole(r1, [xy(388,246),xy(390,246),xy(388,246)]).
hole(r1, [xy(614,244),xy(616,245),xy(614,244)]).
hole(r1, [xy(613,242),xy(615,243),xy(613,242)]).
hole(r1, [xy(612,241),xy(614,241),xy(612,241)]).
hole(r1, [xy(611,239),xy(613,240),xy(611,239)]).
hole(r1, [xy(610,237),xy(612,238),xy(610,237)]).
hole(r1, [xy(609,236),xy(611,236),xy(609,236)]).
hole(r1, [xy(384,235),xy(386,235),xy(384,235)]).
hole(r1, [xy(383,233),xy(385,233),xy(383,233)]).
hole(r1, [xy(608,230),xy(609,235),xy(607,233),xy(608,230)]).
hole(r1, [xy(606,227),xy(608,228),xy(606,227)]).
hole(r1, [xy(605,225),xy(607,226),xy(605,225)]).
hole(r1, [xy(604,222),xy(606,222),xy(604,222)]).
hole(r1, [xy(379,222),xy(381,222),xy(379,222)]).
hole(r1, [xy(378,220),xy(380,220),xy(378,220)]).
hole(r1, [xy(603,219),xy(605,220),xy(603,219)]).
hole(r1, [xy(602,217),xy(604,218),xy(602,217)]).
hole(r1, [xy(377,217),xy(379,218),xy(377,217)]).
hole(r1, [xy(376,216),xy(378,216),xy(376,216)]).
hole(r1, [xy(601,215),xy(603,216),xy(601,215)]).
hole(r1, [xy(600,213),xy(602,214),xy(600,213)]).
hole(r1, [xy(599,211),xy(601,212),xy(599,211)]).
hole(r1, [xy(598,210),xy(600,210),xy(598,210)]).
hole(r1, [xy(597,208),xy(599,209),xy(597,208)]).
hole(r1, [xy(596,207),xy(598,207),xy(596,207)]).
hole(r1, [xy(595,205),xy(597,206),xy(595,205)]).
hole(r1, [xy(594,204),xy(596,204),xy(594,204)]).
hole(r1, [xy(593,203),xy(595,203),xy(593,203)]).
hole(r1, [xy(592,202),xy(594,202),xy(592,202)]).
hole(r1, [xy(589,198),xy(593,201),xy(589,198)]).
hole(r1, [xy(588,197),xy(590,197),xy(588,197)]).
hole(r1, [xy(587,196),xy(589,196),xy(587,196)]).
hole(r1, [xy(586,195),xy(588,195),xy(586,195)]).
hole(r1, [xy(585,194),xy(587,194),xy(585,194)]).
hole(r1, [xy(584,193),xy(586,193),xy(584,193)]).
hole(r1, [xy(583,192),xy(585,192),xy(583,192)]).
hole(r1, [xy(581,191),xy(583,191),xy(581,191)]).
hole(r1, [xy(367,189),xy(369,189),xy(367,189)]).
hole(r1, [xy(579,188),xy(582,190),xy(579,188)]).
hole(r1, [xy(366,188),xy(368,188),xy(366,188)]).
hole(r1, [xy(578,187),xy(580,187),xy(578,187)]).
hole(r1, [xy(577,186),xy(579,186),xy(577,186)]).
hole(r1, [xy(365,186),xy(367,186),xy(365,186)]).
hole(r1, [xy(576,185),xy(578,185),xy(576,185)]).
hole(r1, [xy(575,184),xy(577,184),xy(575,184)]).
hole(r1, [xy(364,184),xy(366,184),xy(364,184)]).
hole(r1, [xy(572,182),xy(576,182),xy(572,182)]).
hole(r1, [xy(571,181),xy(573,181),xy(571,181)]).
hole(r1, [xy(569,180),xy(571,180),xy(569,180)]).
hole(r1, [xy(563,179),xy(565,179),xy(563,179)]).
hole(r1, [xy(557,178),xy(559,178),xy(557,178)]).
hole(r1, [xy(535,175),xy(537,175),xy(535,175)]).
hole(r1, [xy(530,175),xy(532,175),xy(530,175)]).
hole(r1, [xy(536,174),xy(538,174),xy(536,174)]).
hole(r1, [xy(522,172),xy(524,171),xy(528,174),xy(526,175),xy(522,172)]).
hole(r1, [xy(520,171),xy(523,171),xy(520,171)]).
hole(r1, [xy(519,170),xy(521,170),xy(519,170)]).
hole(r1, [xy(515,166),xy(520,169),xy(518,170),xy(515,166)]).
hole(r1, [xy(24,166),xy(26,167),xy(24,166)]).
hole(r1, [xy(514,165),xy(516,165),xy(514,165)]).
hole(r1, [xy(25,165),xy(27,165),xy(25,165)]).
hole(r1, [xy(513,164),xy(515,164),xy(513,164)]).
hole(r1, [xy(26,164),xy(28,164),xy(26,164)]).
hole(r1, [xy(512,163),xy(514,163),xy(512,163)]).
hole(r1, [xy(511,162),xy(513,162),xy(511,162)]).
hole(r1, [xy(510,161),xy(512,161),xy(510,161)]).
hole(r1, [xy(509,160),xy(511,160),xy(509,160)]).
hole(r1, [xy(26,160),xy(28,160),xy(26,160)]).
hole(r1, [xy(24,159),xy(26,159),xy(24,159)]).
hole(r1, [xy(505,158),xy(509,159),xy(505,158)]).
hole(r1, [xy(23,158),xy(25,158),xy(23,158)]).
hole(r1, [xy(503,157),xy(505,157),xy(503,157)]).
hole(r1, [xy(443,156),xy(446,156),xy(443,156)]).
hole(r1, [xy(432,156),xy(436,156),xy(432,156)]).
hole(r1, [xy(501,155),xy(503,156),xy(501,155)]).
hole(r1, [xy(445,155),xy(448,155),xy(445,155)]).
hole(r1, [xy(430,154),xy(432,155),xy(430,154)]).
hole(r1, [xy(502,153),xy(504,154),xy(502,153)]).
hole(r1, [xy(503,151),xy(505,152),xy(503,151)]).
hole(r1, [xy(23,150),xy(25,150),xy(23,150)]).
hole(r1, [xy(424,148),xy(427,147),xy(430,150),xy(428,151),xy(424,148)]).
hole(r1, [xy(447,146),xy(447,152),xy(447,146)]).
hole(r1, [xy(421,147),xy(423,147),xy(421,147)]).
hole(r1, [xy(445,145),xy(447,146),xy(445,145)]).
hole(r1, [xy(35,145),xy(37,145),xy(35,145)]).
hole(r1, [xy(36,144),xy(38,144),xy(36,144)]).
hole(r1, [xy(445,141),xy(445,145),xy(445,141)]).
hole(r1, [xy(440,141),xy(442,141),xy(440,141)]).
hole(r1, [xy(439,140),xy(441,140),xy(439,140)]).
hole(r1, [xy(438,139),xy(440,139),xy(438,139)]).
hole(r1, [xy(437,138),xy(439,138),xy(437,138)]).
hole(r1, [xy(436,137),xy(438,137),xy(436,137)]).
hole(r1, [xy(435,135),xy(437,136),xy(435,135)]).
hole(r1, [xy(434,134),xy(436,134),xy(434,134)]).
hole(r1, [xy(582,133),xy(584,133),xy(582,133)]).
hole(r1, [xy(433,133),xy(435,133),xy(433,133)]).
hole(r1, [xy(581,130),xy(583,131),xy(581,130)]).
hole(r1, [xy(33,130),xy(35,130),xy(33,130)]).
hole(r1, [xy(563,126),xy(565,126),xy(563,126)]).
hole(r1, [xy(531,126),xy(534,126),xy(531,126)]).
hole(r1, [xy(562,125),xy(564,125),xy(562,125)]).
hole(r1, [xy(529,125),xy(531,125),xy(529,125)]).
hole(r1, [xy(560,124),xy(563,124),xy(560,124)]).
hole(r1, [xy(525,124),xy(528,124),xy(525,124)]).
hole(r1, [xy(34,124),xy(36,124),xy(34,124)]).
hole(r1, [xy(523,123),xy(526,123),xy(523,123)]).
hole(r1, [xy(432,123),xy(434,123),xy(432,123)]).
hole(r1, [xy(35,123),xy(38,123),xy(35,123)]).
hole(r1, [xy(520,122),xy(523,122),xy(520,122)]).
hole(r1, [xy(519,121),xy(521,121),xy(519,121)]).
hole(r1, [xy(37,121),xy(39,121),xy(37,121)]).
hole(r1, [xy(38,120),xy(40,120),xy(38,120)]).
hole(r1, [xy(40,116),xy(40,120),xy(40,116)]).
hole(r1, [xy(40,116),xy(42,116),xy(40,116)]).
hole(r1, [xy(42,113),xy(44,113),xy(42,113)]).
hole(r1, [xy(43,112),xy(46,112),xy(43,112)]).
hole(r1, [xy(45,111),xy(47,111),xy(45,111)]).
hole(r1, [xy(48,108),xy(49,110),xy(47,111),xy(48,108)]).
hole(r1, [xy(48,108),xy(50,108),xy(48,108)]).
hole(r1, [xy(49,107),xy(51,107),xy(49,107)]).
hole(r1, [xy(50,101),xy(52,101),xy(50,101)]).
hole(r1, [xy(51,100),xy(53,100),xy(51,100)]).
hole(r1, [xy(590,96),xy(590,101),xy(590,96)]).
hole(r1, [xy(53,95),xy(55,95),xy(53,95)]).
hole(r1, [xy(607,94),xy(609,94),xy(607,94)]).
hole(r1, [xy(54,94),xy(56,94),xy(54,94)]).
hole(r1, [xy(55,93),xy(57,93),xy(55,93)]).
hole(r1, [xy(56,92),xy(58,92),xy(56,92)]).
hole(r1, [xy(56,90),xy(58,90),xy(56,90)]).
hole(r1, [xy(55,89),xy(57,89),xy(55,89)]).
hole(r1, [xy(54,88),xy(56,88),xy(54,88)]).
hole(r1, [xy(53,87),xy(55,87),xy(53,87)]).
hole(r1, [xy(51,82),xy(53,82),xy(51,82)]).
hole(r1, [xy(50,81),xy(52,81),xy(50,81)]).
hole(r1, [xy(49,80),xy(51,80),xy(49,80)]).
hole(r1, [xy(48,69),xy(50,69),xy(48,69)]).
hole(r1, [xy(46,68),xy(49,68),xy(46,68)]).
hole(r1, [xy(35,62),xy(37,62),xy(35,62)]).
hole(r1, [xy(29,54),xy(31,54),xy(29,54)]).
hole(r1, [xy(426,44),xy(428,43),xy(429,46),xy(427,47),xy(426,44)]).
hole(r1, [xy(14,34),xy(16,34),xy(14,34)]).
hole(r1, [xy(13,33),xy(15,33),xy(13,33)]).
hole(r1, [xy(12,32),xy(14,32),xy(12,32)]).
hole(r1, [xy(11,31),xy(13,31),xy(11,31)]).
hole(r1, [xy(10,30),xy(12,30),xy(10,30)]).
hole(r1, [xy(9,29),xy(11,29),xy(9,29)]).
hole(r1, [xy(8,28),xy(10,28),xy(8,28)]).
hole(r1, [xy(7,27),xy(9,27),xy(7,27)]).
hole(r1, [xy(6,26),xy(8,26),xy(6,26)]).
hole(r1, [xy(3,25),xy(6,25),xy(3,25)]).
hole(r1, [xy(2,24),xy(4,24),xy(2,24)]).
midline(r1, [xy(11,11),xy(14,12),xy(2,24),xy(2,28),xy(23,49),xy(23,89),xy(18,105),xy(18,137),xy(22,143),xy(12,153),xy(12,180),xy(99,265),xy(70,294),xy(100,265),xy(124,265),xy(145,242),xy(49,146),xy(23,143),xy(13,153)]).
midline(r1, [xy(38,146),xy(36,146),xy(35,145),xy(23,157),xy(24,160),xy(26,159),xy(26,157),xy(26,161),xy(27,162),xy(25,165),xy(27,163),xy(28,164),xy(26,166),xy(28,165)]).
midline(r1, [xy(28,154),xy(35,147)]).
midline(r1, [xy(36,143),xy(38,143),xy(38,144)]).
midline(r1, [xy(28,159),xy(28,161)]).
midline(r1, [xy(3,25),xy(15,12),xy(18,12),xy(39,33),xy(26,44),xy(7,25),xy(6,25),xy(6,27),xy(14,35),xy(16,35)]).
midline(r1, [xy(8,25),xy(16,33)]).
midline(r1, [xy(24,62),xy(35,61),xy(35,63),xy(36,63),xy(37,62),xy(36,61),xy(37,61)]).
midline(r1, [xy(20,104),xy(37,122),xy(39,121),xy(38,120),xy(39,119),xy(40,120),xy(39,122),xy(158,240),xy(156,243),xy(146,243)]).
midline(r1, [xy(158,242),xy(164,240),xy(166,236),xy(47,117),xy(42,114),xy(40,115),xy(41,117),xy(43,114),xy(23,95),xy(21,96)]).
midline(r1, [xy(47,116),xy(45,110),xy(24,89),xy(52,89),xy(53,87),xy(49,81),xy(49,79),xy(51,79),xy(51,80),xy(50,81),xy(52,80),xy(53,83)]).
midline(r1, [xy(47,112),xy(47,111),xy(46,110)]).
midline(r1, [xy(44,114),xy(44,113),xy(42,112)]).
midline(r1, [xy(23,144),xy(23,151),xy(24,151),xy(25,150),xy(24,149),xy(25,149)]).
midline(r1, [xy(30,43),xy(40,33),xy(82,33),xy(136,87),xy(68,88),xy(48,70)]).
midline(r1, [xy(24,54),xy(29,53),xy(29,55),xy(30,55),xy(31,54),xy(30,53),xy(31,53)]).
midline(r1, [xy(53,86),xy(55,86),xy(54,89),xy(56,91),xy(53,94),xy(54,97),xy(50,100),xy(50,102),xy(52,101),xy(51,100)]).
midline(r1, [xy(54,98),xy(53,103),xy(48,107),xy(48,108),xy(49,107),xy(50,109),xy(53,104)]).
midline(r1, [xy(25,44),xy(24,49)]).
midline(r1, [xy(136,88),xy(213,163),xy(213,198),xy(174,237),xy(166,238)]).
midline(r1, [xy(176,236),xy(213,199),xy(305,291),xy(322,291),xy(371,241),xy(384,240),xy(383,232),xy(385,232),xy(386,236)]).
midline(r1, [xy(323,292),xy(343,312),xy(349,311),xy(355,319),xy(358,318),xy(361,321),xy(401,282)]).
midline(r1, [xy(362,322),xy(412,323),xy(413,321),xy(410,318),xy(410,301),xy(407,296),xy(407,294),xy(409,294),xy(409,295),xy(408,296),xy(409,297),xy(410,295)]).
midline(r1, [xy(413,323),xy(439,323),xy(440,321),xy(406,286)]).
midline(r1, [xy(441,322),xy(447,321),xy(474,294),xy(474,244),xy(465,235),xy(459,222),xy(457,221),xy(401,275),xy(359,318),xy(402,277)]).
midline(r1, [xy(458,220),xy(457,217),xy(451,215),xy(451,211),xy(446,207),xy(431,208),xy(409,186),xy(399,186),xy(391,183),xy(317,108),xy(274,108),xy(266,110),xy(214,163),xy(266,111)]).
midline(r1, [xy(432,206),xy(432,153),xy(431,152),xy(427,153),xy(397,183),xy(427,154)]).
midline(r1, [xy(365,158),xy(364,185),xy(367,190),xy(369,189),xy(366,183)]).
midline(r1, [xy(368,187),xy(369,188)]).
midline(r1, [xy(357,147),xy(421,146),xy(421,148),xy(422,148),xy(423,147),xy(422,146),xy(423,146)]).
midline(r1, [xy(440,206),xy(440,150),xy(436,148),xy(432,152),xy(436,149)]).
midline(r1, [xy(437,147),xy(436,143),xy(430,142),xy(385,97),xy(330,96),xy(318,108),xy(328,98)]).
midline(r1, [xy(475,294),xy(489,307),xy(541,306),xy(542,280),xy(545,279),xy(545,280),xy(543,282),xy(545,281)]).
midline(r1, [xy(490,308),xy(532,350),xy(558,350),xy(560,346),xy(559,341),xy(561,341),xy(561,342),xy(560,343),xy(561,344),xy(567,338),xy(555,336),xy(553,336),xy(553,338),xy(555,338)]).
midline(r1, [xy(559,350),xy(564,357),xy(563,360),xy(566,358),xy(564,353)]).
midline(r1, [xy(441,151),xy(446,156),xy(446,206)]).
midline(r1, [xy(446,153),xy(474,152),xy(474,130),xy(476,122),xy(484,115),xy(484,112),xy(482,111),xy(449,144),xy(446,144),xy(445,145),xy(444,145),xy(442,148)]).
midline(r1, [xy(476,128),xy(501,152),xy(503,155),xy(503,159),xy(475,187),xy(474,153)]).
midline(r1, [xy(503,160),xy(476,187)]).
midline(r1, [xy(502,152),xy(505,153),xy(505,158)]).
midline(r1, [xy(482,112),xy(450,144)]).
midline(r1, [xy(485,115),xy(507,137),xy(513,137),xy(522,128),xy(523,121),xy(478,77),xy(475,79),xy(475,88),xy(472,91),xy(395,91),xy(388,94)]).
midline(r1, [xy(433,92),xy(432,124),xy(433,124),xy(434,122)]).
midline(r1, [xy(476,79),xy(477,78)]).
midline(r1, [xy(521,121),xy(519,120)]).
midline(r1, [xy(474,90),xy(479,93),xy(479,99),xy(440,138),xy(438,136),xy(436,137),xy(439,140),xy(437,143),xy(441,142),xy(442,141),xy(438,137)]).
midline(r1, [xy(442,140),xy(441,138),xy(479,100),xy(483,104),xy(484,111)]).
midline(r1, [xy(395,92),xy(433,131),xy(433,134),xy(435,135),xy(436,134),xy(434,132),xy(436,133)]).
midline(r1, [xy(404,275),xy(457,222)]).
midline(r1, [xy(564,361),xy(568,363),xy(591,338),xy(574,337),xy(569,329),xy(569,316),xy(546,306),xy(542,306),xy(541,322),xy(542,322),xy(543,321),xy(542,320),xy(543,320)]).
midline(r1, [xy(592,339),xy(622,338),xy(617,310),xy(597,310),xy(596,311),xy(594,311),xy(567,337)]).
midline(r1, [xy(594,312),xy(573,333)]).
midline(r1, [xy(618,310),xy(614,299),xy(614,290),xy(610,288),xy(610,283),xy(601,273),xy(586,288),xy(583,288),xy(582,289),xy(581,289),xy(559,311),xy(581,290)]).
midline(r1, [xy(623,339),xy(625,341),xy(671,341),xy(750,262),xy(751,217),xy(749,216),xy(650,315),xy(641,315),xy(623,335),xy(640,318),xy(647,318),xy(649,316),xy(649,317)]).
midline(r1, [xy(750,215),xy(748,208),xy(644,310),xy(643,311),xy(643,312),xy(645,313),xy(748,209)]).
midline(r1, [xy(748,207),xy(746,203),xy(646,303),xy(642,301)]).
midline(r1, [xy(651,315),xy(749,217)]).
midline(r1, [xy(601,272),xy(598,267),xy(580,284),xy(555,309),xy(556,309),xy(598,268)]).
midline(r1, [xy(601,274),xy(587,288)]).
midline(r1, [xy(642,303),xy(641,305),xy(636,305),xy(621,321),xy(636,306)]).
midline(r1, [xy(747,202),xy(747,192),xy(744,190),xy(643,291),xy(636,289)]).
midline(r1, [xy(744,191),xy(645,290)]).
midline(r1, [xy(444,147),xy(446,147),xy(448,145),xy(448,146)]).
midline(r1, [xy(506,154),xy(518,144),xy(518,139),xy(514,138)]).
midline(r1, [xy(519,143),xy(524,142),xy(528,146),xy(513,161),xy(511,159),xy(509,159),xy(509,161),xy(511,163),xy(458,216),xy(512,163),xy(514,166),xy(516,165),xy(511,160)]).
midline(r1, [xy(746,204),xy(648,302)]).
midline(r1, [xy(272,110),xy(376,214),xy(376,217),xy(377,217),xy(378,215)]).
midline(r1, [xy(569,337),xy(570,336)]).
midline(r1, [xy(516,164),xy(514,161),xy(529,146),xy(537,146),xy(541,149),xy(523,168),xy(463,227),xy(521,170)]).
midline(r1, [xy(523,169),xy(523,171),xy(464,230),xy(522,173)]).
midline(r1, [xy(745,189),xy(745,178),xy(743,177),xy(632,286)]).
midline(r1, [xy(743,178),xy(638,283)]).
midline(r1, [xy(634,285),xy(636,285)]).
midline(r1, [xy(744,176),xy(744,171),xy(742,170),xy(632,280),xy(622,279),xy(613,288),xy(622,280)]).
midline(r1, [xy(743,169),xy(741,166),xy(635,272),xy(629,270),xy(629,273),xy(622,278),xy(626,275)]).
midline(r1, [xy(742,171),xy(634,279)]).
midline(r1, [xy(636,272),xy(741,167)]).
midline(r1, [xy(630,272),xy(631,272)]).
midline(r1, [xy(478,76),xy(478,72),xy(489,60),xy(450,21),xy(405,21),xy(330,95),xy(403,23)]).
midline(r1, [xy(489,62),xy(526,61),xy(526,123),xy(524,125),xy(525,125)]).
midline(r1, [xy(741,165),xy(741,157),xy(739,155),xy(631,263),xy(627,261),xy(624,262),xy(623,259),xy(625,258),xy(625,259),xy(624,260)]).
midline(r1, [xy(633,262),xy(739,156)]).
midline(r1, [xy(739,154),xy(739,147),xy(737,146),xy(626,258),xy(737,147)]).
midline(r1, [xy(623,262),xy(624,264),xy(591,295),xy(589,296),xy(586,293),xy(585,294),xy(589,300),xy(583,302),xy(570,315),xy(583,303)]).
midline(r1, [xy(587,293),xy(588,294)]).
midline(r1, [xy(608,279),xy(620,267)]).
midline(r1, [xy(739,146),xy(736,141),xy(624,253),xy(616,254),xy(602,269),xy(616,255)]).
midline(r1, [xy(737,140),xy(735,135),xy(619,250),xy(618,252),xy(619,252),xy(735,136)]).
midline(r1, [xy(625,253),xy(736,142)]).
midline(r1, [xy(606,281),xy(592,295)]).
midline(r1, [xy(588,296),xy(591,299),xy(591,300),xy(590,301),xy(589,301),xy(590,305),xy(592,305),xy(594,303),xy(593,302),xy(591,303)]).
midline(r1, [xy(594,302),xy(595,305),xy(571,330),xy(594,308),xy(595,307),xy(595,306)]).
midline(r1, [xy(596,303),xy(610,290)]).
midline(r1, [xy(736,134),xy(733,130),xy(619,244),xy(617,243),xy(615,243),xy(613,244),xy(612,243),xy(613,238),xy(611,239),xy(606,239),xy(591,254),xy(588,250),xy(569,269),xy(565,269),xy(559,275),xy(558,263),xy(553,259),xy(548,261),xy(508,221),xy(502,221),xy(498,225),xy(492,226),xy(475,244),xy(492,227)]).
midline(r1, [xy(614,238),xy(732,120),xy(715,110),xy(711,110),xy(706,105),xy(690,99),xy(639,48),xy(541,48),xy(527,61),xy(544,78),xy(544,108),xy(518,138),xy(529,128)]).
midline(r1, [xy(529,60),xy(539,50)]).
midline(r1, [xy(614,240),xy(613,242)]).
midline(r1, [xy(734,129),xy(734,123),xy(732,122)]).
midline(r1, [xy(606,240),xy(591,255),xy(591,258),xy(575,274),xy(571,272),xy(572,275),xy(560,286),xy(555,275),xy(548,275),xy(543,271),xy(499,226),xy(502,222)]).
midline(r1, [xy(558,277),xy(558,275)]).
midline(r1, [xy(684,94),xy(607,93),xy(607,95),xy(609,95)]).
midline(r1, [xy(565,270),xy(560,275)]).
midline(r1, [xy(577,273),xy(591,259),xy(596,259),xy(596,264),xy(578,281),xy(552,308),xy(596,265),xy(599,266),xy(616,249),xy(616,248),xy(618,246),xy(617,245),xy(614,246),xy(612,244),xy(597,259),xy(609,247)]).
midline(r1, [xy(617,249),xy(618,247)]).
midline(r1, [xy(547,275),xy(546,275),xy(545,274),xy(545,273)]).
midline(r1, [xy(588,249),xy(586,247),xy(570,263),xy(567,263),xy(565,264),xy(563,260),xy(557,260),xy(554,257),xy(555,255),xy(515,217),xy(511,217),xy(508,220),xy(511,218)]).
midline(r1, [xy(571,263),xy(586,248)]).
midline(r1, [xy(556,258),xy(555,253),xy(556,251),xy(557,251),xy(558,252),xy(556,256)]).
midline(r1, [xy(555,274),xy(547,268),xy(542,268)]).
midline(r1, [xy(612,245),xy(613,246)]).
midline(r1, [xy(588,251),xy(571,268)]).
midline(r1, [xy(556,260),xy(554,262),xy(551,261),xy(549,263),xy(549,265),xy(552,266),xy(553,265),xy(551,263),xy(550,263)]).
midline(r1, [xy(621,243),xy(733,131)]).
midline(r1, [xy(565,262),xy(563,258),xy(570,256),xy(583,243),xy(583,230),xy(565,224),xy(560,219),xy(550,219),xy(546,215),xy(540,215),xy(536,211),xy(523,211),xy(519,212),xy(516,216),xy(519,213)]).
midline(r1, [xy(584,242),xy(587,240),xy(587,246)]).
midline(r1, [xy(555,262),xy(554,264)]).
midline(r1, [xy(548,268),xy(550,269)]).
midline(r1, [xy(569,278),xy(560,287),xy(560,292),xy(547,305),xy(560,293)]).
midline(r1, [xy(545,271),xy(550,272)]).
midline(r1, [xy(531,124),xy(531,126)]).
midline(r1, [xy(617,244),xy(618,245)]).
midline(r1, [xy(532,121),xy(544,109),xy(547,111),xy(547,138),xy(557,150),xy(554,153),xy(549,149),xy(542,149),xy(524,167)]).
midline(r1, [xy(557,151),xy(552,156),xy(552,172),xy(550,174),xy(538,173),xy(530,174),xy(530,176),xy(532,176)]).
midline(r1, [xy(553,156),xy(600,156),xy(603,160),xy(579,184),xy(575,183),xy(575,186),xy(547,215),xy(577,184),xy(578,185),xy(577,186),xy(577,187),xy(579,188),xy(580,187),xy(579,185),xy(607,158),xy(584,134)]).
midline(r1, [xy(607,159),xy(620,159),xy(587,192),xy(583,190),xy(581,191),xy(581,192),xy(583,191),xy(584,195),xy(561,219),xy(583,197)]).
midline(r1, [xy(620,160),xy(587,193),xy(585,192)]).
midline(r1, [xy(621,158),xy(631,149),xy(597,115),xy(577,115),xy(576,110),xy(545,79)]).
midline(r1, [xy(631,150),xy(641,149),xy(690,100)]).
midline(r1, [xy(573,273),xy(574,274),xy(572,276),xy(574,278),xy(576,277),xy(574,275),xy(576,276)]).
midline(r1, [xy(713,134),xy(609,235),xy(609,237),xy(610,237),xy(712,135)]).
midline(r1, [xy(649,149),xy(595,202),xy(593,201),xy(572,224),xy(594,202),xy(595,203),xy(594,205),xy(595,205),xy(648,150)]).
midline(r1, [xy(686,152),xy(612,226),xy(607,226),xy(606,227),xy(600,226),xy(588,240),xy(598,230),xy(611,229),xy(722,117)]).
midline(r1, [xy(599,228),xy(600,227)]).
midline(r1, [xy(605,200),xy(604,201)]).
midline(r1, [xy(616,214),xy(608,221),xy(604,221),xy(602,224)]).
midline(r1, [xy(604,223),xy(606,223)]).
midline(r1, [xy(609,221),xy(615,215)]).
midline(r1, [xy(655,142),xy(695,103)]).
midline(r1, [xy(674,155),xy(617,213),xy(717,113)]).
midline(r1, [xy(647,173),xy(606,214),xy(602,212),xy(599,213),xy(598,210),xy(599,209),xy(600,209),xy(599,211)]).
midline(r1, [xy(608,213),xy(710,110)]).
midline(r1, [xy(598,213),xy(599,215),xy(583,229),xy(595,218)]).
midline(r1, [xy(406,232),xy(400,238),xy(395,238),xy(378,221),xy(378,219),xy(380,219),xy(381,223)]).
midline(r1, [xy(402,237),xy(430,209)]).
midline(r1, [xy(394,238),xy(385,240),xy(388,243),xy(388,247),xy(390,252),xy(392,251),xy(390,245)]).
midline(r1, [xy(392,252),xy(392,257),xy(393,259),xy(394,259),xy(395,258),xy(394,255)]).
midline(r1, [xy(694,110),xy(606,199),xy(700,105)]).
midline(r1, [xy(408,278),xy(407,279)]).
midline(r1, [xy(609,268),xy(604,274),xy(610,267),xy(622,257),xy(623,256),xy(622,255),xy(623,255)]).
midline(r1, [xy(655,155),xy(654,156)]).
midline(r1, [xy(440,230),xy(401,268),xy(391,269),xy(350,311),xy(391,270)]).
midline(r1, [xy(403,267),xy(439,231)]).
midline(r1, [xy(572,120),xy(572,129),xy(570,131),xy(563,127)]).
midline(r1, [xy(571,131),xy(570,135),xy(558,147),xy(569,137)]).
midline(r1, [xy(21,138),xy(34,125)]).
midline(r1, [xy(724,123),xy(723,124)]).
midline(r1, [xy(574,300),xy(563,312),xy(584,292)]).
midline(r1, [xy(559,177),xy(552,173),xy(550,175),xy(550,197),xy(537,210),xy(549,199)]).
midline(r1, [xy(559,176),xy(563,180),xy(565,179),xy(565,177),xy(569,181),xy(570,181),xy(571,180),xy(570,179),xy(571,179),xy(571,182),xy(572,182),xy(573,181),xy(573,180)]).
midline(r1, [xy(64,90),xy(59,90),xy(56,87),xy(58,90),xy(54,94),xy(55,95),xy(55,96),xy(58,93),xy(58,91)]).
midline(r1, [xy(65,90),xy(68,89)]).
midline(r1, [xy(626,301),xy(625,302)]).
midline(r1, [xy(454,207),xy(474,188)]).
midline(r1, [xy(410,298),xy(411,298),xy(411,300)]).
midline(r1, [xy(409,277),xy(459,226)]).
midline(r1, [xy(569,266),xy(568,267)]).
midline(r1, [xy(569,265),xy(569,264)]).
midline(r1, [xy(656,154),xy(704,106)]).
midline(r1, [xy(625,265),xy(627,263),xy(629,264),xy(627,266),xy(625,266),xy(626,268),xy(628,268),xy(630,265)]).
midline(r1, [xy(632,294),xy(627,300),xy(633,293),xy(639,292)]).
midline(r1, [xy(585,195),xy(588,198),xy(590,197),xy(587,194),xy(590,196)]).
midline(r1, [xy(559,179),xy(557,179)]).
midline(r1, [xy(601,218),xy(599,216),xy(602,214),xy(604,215),xy(602,217),xy(601,217)]).
midline(r1, [xy(601,219),xy(603,219),xy(605,216)]).
midline(r1, [xy(30,136),xy(29,137)]).
midline(r1, [xy(725,122),xy(728,119)]).
midline(r1, [xy(397,269),xy(398,272),xy(400,271),xy(399,269),xy(400,270)]).
midline(r1, [xy(452,218),xy(451,219)]).
midline(r1, [xy(413,318),xy(412,318),xy(413,320),xy(414,318)]).
midline(r1, [xy(535,176),xy(535,175),xy(536,174),xy(537,175),xy(536,176),xy(538,174)]).
midline(r1, [xy(574,119),xy(573,120)]).
midline(r1, [xy(32,133),xy(33,129),xy(35,129),xy(35,131)]).
midline(r1, [xy(643,305),xy(642,305),xy(641,306),xy(641,307),xy(643,307)]).
midline(r1, [xy(575,118),xy(577,116)]).
midline(r1, [xy(638,288),xy(638,287)]).
midline(r1, [xy(50,68),xy(50,69)]).
midline(r1, [xy(563,124),xy(565,126)]).
fillpoint(r1, xy(192,189), 166.7).
fillpoint(r1, xy(197,173), 164.8).
fillpoint(r1, xy(195,178), 164.8).
fillpoint(r1, xy(194,180), 164.8).
fillpoint(r1, xy(196,176), 164.7).
fillpoint(r1, xy(193,182), 164.7).
fillpoint(r1, xy(717,159), 130.8).
fillpoint(r1, xy(718,155), 129.9).
fillpoint(r1, xy(719,150), 128.9).
fillpoint(r1, xy(720,146), 128.0).
fillpoint(r1, xy(720,169), 128.0).
fillpoint(r1, xy(721,141), 127.0).
fillpoint(r1, xy(721,173), 127.0).
fillpoint(r1, xy(722,136), 126.1).
fillpoint(r1, xy(722,178), 126.1).
fillpoint(r1, xy(723,132), 125.1).
fillpoint(r1, xy(723,182), 125.1).
fillpoint(r1, xy(724,187), 124.2).
fillpoint(r1, xy(725,191), 123.2).
fillpoint(r1, xy(726,196), 122.2).
fillpoint(r1, xy(727,201), 121.3).
fillpoint(r1, xy(728,205), 120.3).
fillpoint(r1, xy(729,210), 119.4).
fillpoint(r1, xy(730,214), 118.4).
fillpoint(r1, xy(731,219), 117.5).
fillpoint(r1, xy(732,224), 116.5).
fillpoint(r1, xy(733,228), 115.6).
fillpoint(r1, xy(734,233), 114.6).
fillpoint(r1, xy(735,238), 113.6).
fillpoint(r1, xy(736,242), 112.7).
fillpoint(r1, xy(737,247), 111.7).
fillpoint(r1, xy(293,107), 103.1).
fillpoint(r1, xy(298,106), 102.2).
fillpoint(r1, xy(302,105), 101.2).
fillpoint(r1, xy(307,104), 100.3).
fillpoint(r1, xy(311,103), 99.3).
fillpoint(r1, xy(316,102), 98.4).
fillpoint(r1, xy(321,101), 97.4).
fillpoint(r1, xy(325,100), 96.5).
fillpoint(r1, xy(330,99), 95.5).
fillpoint(r1, xy(335,98), 94.5).
fillpoint(r1, xy(339,97), 93.6).
fillpoint(r1, xy(344,96), 92.6).
fillpoint(r1, xy(348,95), 91.7).
fillpoint(r1, xy(474,239), 83.1).
fillpoint(r1, xy(473,261), 74.5).
fillpoint(r1, xy(475,286), 67.0).
fillpoint(r1, xy(477,291), 67.0).
fillpoint(r1, xy(478,293), 67.0).
fillpoint(r1, xy(476,288), 66.9).
fillpoint(r1, xy(474,283), 66.7).
fillpoint(r1, xy(487,67), 64.9).
fillpoint(r1, xy(492,66), 64.0).
fillpoint(r1, xy(496,65), 63.0).
fillpoint(r1, xy(501,64), 62.1).
fillpoint(r1, xy(539,64), 61.7).
fillpoint(r1, xy(506,63), 61.1).
fillpoint(r1, xy(536,63), 61.1).
fillpoint(r1, xy(510,62), 60.2).
fillpoint(r1, xy(531,62), 60.2).
fillpoint(r1, xy(476,79), 59.4).
fillpoint(r1, xy(515,61), 59.2).
fillpoint(r1, xy(526,61), 59.2).
fillpoint(r1, xy(520,60), 58.3).
fillpoint(r1, xy(553,56), 54.4).
fillpoint(r1, xy(557,55), 53.5).
fillpoint(r1, xy(562,54), 52.5).
fillpoint(r1, xy(643,54), 52.5).
fillpoint(r1, xy(566,53), 51.6).
fillpoint(r1, xy(639,53), 51.6).
fillpoint(r1, xy(571,52), 50.6).
fillpoint(r1, xy(634,52), 50.6).
fillpoint(r1, xy(576,51), 49.7).
fillpoint(r1, xy(630,51), 49.7).
fillpoint(r1, xy(580,50), 48.7).
fillpoint(r1, xy(625,50), 48.7).
fillpoint(r1, xy(585,49), 47.8).
fillpoint(r1, xy(596,49), 47.8).
fillpoint(r1, xy(620,49), 47.8).
fillpoint(r1, xy(590,48), 46.8).
fillpoint(r1, xy(601,48), 46.8).
fillpoint(r1, xy(616,48), 46.8).
fillpoint(r1, xy(605,47), 45.8).
fillpoint(r1, xy(611,47), 45.8).
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
opencv_morphology(r1, opening_area(310420), closing_area(313267), gradient_area(6265)).
opencv_shape_metrics(r1, contour_area(309627.5), hull_area(309639.0), solidity(0.999963), circularity(0.65359), extent(0.996048), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309627.5).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 5.5).
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
opencv_contour(r1, c9, hole, 4.0).
opencv_contour_hierarchy(r1, c9, next(c10), previous(c8), child(none), parent(c0)).
opencv_contour(r1, c10, hole, 2.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 2.0).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 4.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 4.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 4.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 2.0).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 2.0).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 8.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 4.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 7.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 2.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 2.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 4.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 4.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 2.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 4.0).
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
opencv_contour(r1, c39, hole, 4.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 7.5).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 4.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 2.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 4.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 2.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 7.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 2.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 4.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 4.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 9.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 4.0).
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
opencv_contour(r1, c60, hole, 4.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 2.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 4.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 2.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 2.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 4.0).
opencv_contour_hierarchy(r1, c65, next(c66), previous(c64), child(none), parent(c0)).
opencv_contour(r1, c66, hole, 7.0).
opencv_contour_hierarchy(r1, c66, next(c67), previous(c65), child(none), parent(c0)).
opencv_contour(r1, c67, hole, 2.0).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 2.0).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 4.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 4.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 4.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 4.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 4.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 4.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 4.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 4.0).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 4.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 4.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 2.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 4.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 4.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 4.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 2.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 4.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 2.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 4.0).
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
opencv_contour(r1, c97, hole, 4.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 18.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 2.0).
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
opencv_contour(r1, c106, hole, 4.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 4.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 2.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 2.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 2.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 9.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 4.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 4.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 2.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 2.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 2.0).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 4.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 4.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 4.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 2.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 4.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 4.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 4.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 2.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 4.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 2.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 4.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 2.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 2.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 2.0).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 10.0).
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
opencv_contour(r1, c140, hole, 7.0).
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
opencv_contour(r1, c148, hole, 6.0).
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
opencv_contour(r1, c156, hole, 12.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 4.0).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 2.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 11.5).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 4.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 2.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 2.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 2.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 2.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 2.0).
opencv_contour_hierarchy(r1, c165, next(c166), previous(c164), child(none), parent(c0)).
opencv_contour(r1, c166, hole, 2.0).
opencv_contour_hierarchy(r1, c166, next(c167), previous(c165), child(none), parent(c0)).
opencv_contour(r1, c167, hole, 2.0).
opencv_contour_hierarchy(r1, c167, next(c168), previous(c166), child(none), parent(c0)).
opencv_contour(r1, c168, hole, 2.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 2.0).
opencv_contour_hierarchy(r1, c169, next(c170), previous(c168), child(none), parent(c0)).
opencv_contour(r1, c170, hole, 2.0).
opencv_contour_hierarchy(r1, c170, next(c171), previous(c169), child(none), parent(c0)).
opencv_contour(r1, c171, hole, 7.0).
opencv_contour_hierarchy(r1, c171, next(c172), previous(c170), child(none), parent(c0)).
opencv_contour(r1, c172, hole, 2.0).
opencv_contour_hierarchy(r1, c172, next(c173), previous(c171), child(none), parent(c0)).
opencv_contour(r1, c173, hole, 2.0).
opencv_contour_hierarchy(r1, c173, next(c174), previous(c172), child(none), parent(c0)).
opencv_contour(r1, c174, hole, 4.0).
opencv_contour_hierarchy(r1, c174, next(c175), previous(c173), child(none), parent(c0)).
opencv_contour(r1, c175, hole, 6.0).
opencv_contour_hierarchy(r1, c175, next(c176), previous(c174), child(none), parent(c0)).
opencv_contour(r1, c176, hole, 4.0).
opencv_contour_hierarchy(r1, c176, next(c177), previous(c175), child(none), parent(c0)).
opencv_contour(r1, c177, hole, 4.0).
opencv_contour_hierarchy(r1, c177, next(c178), previous(c176), child(none), parent(c0)).
opencv_contour(r1, c178, hole, 4.0).
opencv_contour_hierarchy(r1, c178, next(c179), previous(c177), child(none), parent(c0)).
opencv_contour(r1, c179, hole, 4.0).
opencv_contour_hierarchy(r1, c179, next(c180), previous(c178), child(none), parent(c0)).
opencv_contour(r1, c180, hole, 4.0).
opencv_contour_hierarchy(r1, c180, next(c181), previous(c179), child(none), parent(c0)).
opencv_contour(r1, c181, hole, 2.0).
opencv_contour_hierarchy(r1, c181, next(c182), previous(c180), child(none), parent(c0)).
opencv_contour(r1, c182, hole, 12.0).
opencv_contour_hierarchy(r1, c182, next(c183), previous(c181), child(none), parent(c0)).
opencv_contour(r1, c183, hole, 10.0).
opencv_contour_hierarchy(r1, c183, next(c184), previous(c182), child(none), parent(c0)).
opencv_contour(r1, c184, hole, 2.0).
opencv_contour_hierarchy(r1, c184, next(c185), previous(c183), child(none), parent(c0)).
opencv_contour(r1, c185, hole, 4.0).
opencv_contour_hierarchy(r1, c185, next(c186), previous(c184), child(none), parent(c0)).
opencv_contour(r1, c186, hole, 2.0).
opencv_contour_hierarchy(r1, c186, next(c187), previous(c185), child(none), parent(c0)).
opencv_contour(r1, c187, hole, 2.0).
opencv_contour_hierarchy(r1, c187, next(c188), previous(c186), child(none), parent(c0)).
opencv_contour(r1, c188, hole, 6.0).
opencv_contour_hierarchy(r1, c188, next(c189), previous(c187), child(none), parent(c0)).
opencv_contour(r1, c189, hole, 2.0).
opencv_contour_hierarchy(r1, c189, next(c190), previous(c188), child(none), parent(c0)).
opencv_contour(r1, c190, hole, 2.0).
opencv_contour_hierarchy(r1, c190, next(c191), previous(c189), child(none), parent(c0)).
opencv_contour(r1, c191, hole, 2.0).
opencv_contour_hierarchy(r1, c191, next(c192), previous(c190), child(none), parent(c0)).
opencv_contour(r1, c192, hole, 2.0).
opencv_contour_hierarchy(r1, c192, next(c193), previous(c191), child(none), parent(c0)).
opencv_contour(r1, c193, hole, 2.0).
opencv_contour_hierarchy(r1, c193, next(c194), previous(c192), child(none), parent(c0)).
opencv_contour(r1, c194, hole, 4.0).
opencv_contour_hierarchy(r1, c194, next(c195), previous(c193), child(none), parent(c0)).
opencv_contour(r1, c195, hole, 2.0).
opencv_contour_hierarchy(r1, c195, next(c196), previous(c194), child(none), parent(c0)).
opencv_contour(r1, c196, hole, 2.0).
opencv_contour_hierarchy(r1, c196, next(c197), previous(c195), child(none), parent(c0)).
opencv_contour(r1, c197, hole, 2.0).
opencv_contour_hierarchy(r1, c197, next(c198), previous(c196), child(none), parent(c0)).
opencv_contour(r1, c198, hole, 4.0).
opencv_contour_hierarchy(r1, c198, next(c199), previous(c197), child(none), parent(c0)).
opencv_contour(r1, c199, hole, 2.0).
opencv_contour_hierarchy(r1, c199, next(c200), previous(c198), child(none), parent(c0)).
opencv_contour(r1, c200, hole, 2.0).
opencv_contour_hierarchy(r1, c200, next(c201), previous(c199), child(none), parent(c0)).
opencv_contour(r1, c201, hole, 4.0).
opencv_contour_hierarchy(r1, c201, next(c202), previous(c200), child(none), parent(c0)).
opencv_contour(r1, c202, hole, 2.0).
opencv_contour_hierarchy(r1, c202, next(c203), previous(c201), child(none), parent(c0)).
opencv_contour(r1, c203, hole, 2.0).
opencv_contour_hierarchy(r1, c203, next(c204), previous(c202), child(none), parent(c0)).
opencv_contour(r1, c204, hole, 4.0).
opencv_contour_hierarchy(r1, c204, next(c205), previous(c203), child(none), parent(c0)).
opencv_contour(r1, c205, hole, 4.0).
opencv_contour_hierarchy(r1, c205, next(c206), previous(c204), child(none), parent(c0)).
opencv_contour(r1, c206, hole, 2.0).
opencv_contour_hierarchy(r1, c206, next(c207), previous(c205), child(none), parent(c0)).
opencv_contour(r1, c207, hole, 4.0).
opencv_contour_hierarchy(r1, c207, next(c208), previous(c206), child(none), parent(c0)).
opencv_contour(r1, c208, hole, 2.0).
opencv_contour_hierarchy(r1, c208, next(c209), previous(c207), child(none), parent(c0)).
opencv_contour(r1, c209, hole, 4.0).
opencv_contour_hierarchy(r1, c209, next(c210), previous(c208), child(none), parent(c0)).
opencv_contour(r1, c210, hole, 4.0).
opencv_contour_hierarchy(r1, c210, next(c211), previous(c209), child(none), parent(c0)).
opencv_contour(r1, c211, hole, 2.0).
opencv_contour_hierarchy(r1, c211, next(c212), previous(c210), child(none), parent(c0)).
opencv_contour(r1, c212, hole, 2.0).
opencv_contour_hierarchy(r1, c212, next(c213), previous(c211), child(none), parent(c0)).
opencv_contour(r1, c213, hole, 2.0).
opencv_contour_hierarchy(r1, c213, next(c214), previous(c212), child(none), parent(c0)).
opencv_contour(r1, c214, hole, 6.0).
opencv_contour_hierarchy(r1, c214, next(c215), previous(c213), child(none), parent(c0)).
opencv_contour(r1, c215, hole, 2.0).
opencv_contour_hierarchy(r1, c215, next(c216), previous(c214), child(none), parent(c0)).
opencv_contour(r1, c216, hole, 2.0).
opencv_contour_hierarchy(r1, c216, next(c217), previous(c215), child(none), parent(c0)).
opencv_contour(r1, c217, hole, 4.0).
opencv_contour_hierarchy(r1, c217, next(c218), previous(c216), child(none), parent(c0)).
opencv_contour(r1, c218, hole, 2.0).
opencv_contour_hierarchy(r1, c218, next(c219), previous(c217), child(none), parent(c0)).
opencv_contour(r1, c219, hole, 5.5).
opencv_contour_hierarchy(r1, c219, next(c220), previous(c218), child(none), parent(c0)).
opencv_contour(r1, c220, hole, 2.0).
opencv_contour_hierarchy(r1, c220, next(c221), previous(c219), child(none), parent(c0)).
opencv_contour(r1, c221, hole, 2.0).
opencv_contour_hierarchy(r1, c221, next(c222), previous(c220), child(none), parent(c0)).
opencv_contour(r1, c222, hole, 2.0).
opencv_contour_hierarchy(r1, c222, next(c223), previous(c221), child(none), parent(c0)).
opencv_contour(r1, c223, hole, 2.0).
opencv_contour_hierarchy(r1, c223, next(c224), previous(c222), child(none), parent(c0)).
opencv_contour(r1, c224, hole, 8.0).
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
opencv_contour(r1, c238, hole, 4.0).
opencv_contour_hierarchy(r1, c238, next(c239), previous(c237), child(none), parent(c0)).
opencv_contour(r1, c239, hole, 2.0).
opencv_contour_hierarchy(r1, c239, next(c240), previous(c238), child(none), parent(c0)).
opencv_contour(r1, c240, hole, 2.0).
opencv_contour_hierarchy(r1, c240, next(c241), previous(c239), child(none), parent(c0)).
opencv_contour(r1, c241, hole, 10.0).
opencv_contour_hierarchy(r1, c241, next(c242), previous(c240), child(none), parent(c0)).
opencv_contour(r1, c242, hole, 2.0).
opencv_contour_hierarchy(r1, c242, next(c243), previous(c241), child(none), parent(c0)).
opencv_contour(r1, c243, hole, 2.0).
opencv_contour_hierarchy(r1, c243, next(c244), previous(c242), child(none), parent(c0)).
opencv_contour(r1, c244, hole, 2.0).
opencv_contour_hierarchy(r1, c244, next(c245), previous(c243), child(none), parent(c0)).
opencv_contour(r1, c245, hole, 2.0).
opencv_contour_hierarchy(r1, c245, next(c246), previous(c244), child(none), parent(c0)).
opencv_contour(r1, c246, hole, 2.0).
opencv_contour_hierarchy(r1, c246, next(c247), previous(c245), child(none), parent(c0)).
opencv_contour(r1, c247, hole, 2.0).
opencv_contour_hierarchy(r1, c247, next(c248), previous(c246), child(none), parent(c0)).
opencv_contour(r1, c248, hole, 2.0).
opencv_contour_hierarchy(r1, c248, next(c249), previous(c247), child(none), parent(c0)).
opencv_contour(r1, c249, hole, 2.0).
opencv_contour_hierarchy(r1, c249, next(c250), previous(c248), child(none), parent(c0)).
opencv_contour(r1, c250, hole, 2.0).
opencv_contour_hierarchy(r1, c250, next(c251), previous(c249), child(none), parent(c0)).
opencv_contour(r1, c251, hole, 4.0).
opencv_contour_hierarchy(r1, c251, next(c252), previous(c250), child(none), parent(c0)).
opencv_contour(r1, c252, hole, 2.0).
opencv_contour_hierarchy(r1, c252, next(none), previous(c251), child(none), parent(c0)).
