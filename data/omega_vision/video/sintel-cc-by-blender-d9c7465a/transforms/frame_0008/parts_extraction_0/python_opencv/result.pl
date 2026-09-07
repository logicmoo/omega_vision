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

region(r1, '#323533', 310725, centroid(426,181)).
perimeter(r1, 2872).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(583,360),xy(585,361),xy(583,360)]).
hole(r1, [xy(584,359),xy(586,359),xy(584,359)]).
hole(r1, [xy(585,357),xy(587,357),xy(585,357)]).
hole(r1, [xy(587,356),xy(589,356),xy(587,356)]).
hole(r1, [xy(588,354),xy(590,354),xy(588,354)]).
hole(r1, [xy(593,317),xy(595,318),xy(593,317)]).
hole(r1, [xy(165,317),xy(168,317),xy(165,317)]).
hole(r1, [xy(594,316),xy(596,316),xy(594,316)]).
hole(r1, [xy(595,315),xy(597,315),xy(595,315)]).
hole(r1, [xy(596,314),xy(599,314),xy(596,314)]).
hole(r1, [xy(407,314),xy(409,314),xy(407,314)]).
hole(r1, [xy(599,313),xy(601,313),xy(599,313)]).
hole(r1, [xy(406,313),xy(408,313),xy(406,313)]).
hole(r1, [xy(601,312),xy(604,312),xy(601,312)]).
hole(r1, [xy(399,311),xy(401,314),xy(398,316),xy(399,311)]).
hole(r1, [xy(604,311),xy(607,311),xy(604,311)]).
hole(r1, [xy(399,311),xy(401,311),xy(399,311)]).
hole(r1, [xy(606,310),xy(609,310),xy(606,310)]).
hole(r1, [xy(400,310),xy(402,310),xy(400,310)]).
hole(r1, [xy(157,310),xy(159,310),xy(157,310)]).
hole(r1, [xy(155,309),xy(158,309),xy(155,309)]).
hole(r1, [xy(397,301),xy(399,302),xy(397,301)]).
hole(r1, [xy(181,299),xy(183,299),xy(181,299)]).
hole(r1, [xy(397,298),xy(399,297),xy(400,299),xy(398,300),xy(397,298)]).
hole(r1, [xy(127,295),xy(129,295),xy(127,295)]).
hole(r1, [xy(605,292),xy(608,294),xy(605,292)]).
hole(r1, [xy(142,290),xy(144,290),xy(142,290)]).
hole(r1, [xy(602,288),xy(606,291),xy(602,288)]).
hole(r1, [xy(601,287),xy(603,287),xy(601,287)]).
hole(r1, [xy(600,286),xy(602,286),xy(600,286)]).
hole(r1, [xy(599,285),xy(601,285),xy(599,285)]).
hole(r1, [xy(598,284),xy(600,284),xy(598,284)]).
hole(r1, [xy(597,283),xy(599,283),xy(597,283)]).
hole(r1, [xy(595,282),xy(598,282),xy(595,282)]).
hole(r1, [xy(593,281),xy(596,281),xy(593,281)]).
hole(r1, [xy(591,280),xy(594,280),xy(591,280)]).
hole(r1, [xy(590,279),xy(592,279),xy(590,279)]).
hole(r1, [xy(588,278),xy(590,278),xy(588,278)]).
hole(r1, [xy(585,277),xy(588,277),xy(585,277)]).
hole(r1, [xy(581,276),xy(584,276),xy(581,276)]).
hole(r1, [xy(579,275),xy(581,275),xy(579,275)]).
hole(r1, [xy(375,256),xy(377,256),xy(375,256)]).
hole(r1, [xy(378,255),xy(380,255),xy(378,255)]).
hole(r1, [xy(377,254),xy(379,254),xy(377,254)]).
hole(r1, [xy(261,106),xy(264,105),xy(265,107),xy(262,108),xy(261,106)]).
hole(r1, [xy(321,94),xy(323,93),xy(324,95),xy(322,96),xy(321,94)]).
hole(r1, [xy(509,75),xy(511,75),xy(509,75)]).
hole(r1, [xy(510,74),xy(512,74),xy(510,74)]).
hole(r1, [xy(511,72),xy(513,72),xy(511,72)]).
hole(r1, [xy(513,71),xy(515,71),xy(513,71)]).
hole(r1, [xy(514,70),xy(516,70),xy(514,70)]).
hole(r1, [xy(515,69),xy(517,69),xy(515,69)]).
hole(r1, [xy(439,69),xy(441,69),xy(439,69)]).
hole(r1, [xy(516,68),xy(518,68),xy(516,68)]).
hole(r1, [xy(517,67),xy(519,67),xy(517,67)]).
hole(r1, [xy(518,66),xy(520,66),xy(518,66)]).
hole(r1, [xy(442,66),xy(444,66),xy(442,66)]).
hole(r1, [xy(519,65),xy(521,65),xy(519,65)]).
hole(r1, [xy(520,64),xy(522,64),xy(520,64)]).
hole(r1, [xy(500,61),xy(502,61),xy(500,61)]).
hole(r1, [xy(446,61),xy(448,61),xy(446,61)]).
hole(r1, [xy(525,60),xy(527,60),xy(525,60)]).
hole(r1, [xy(502,60),xy(504,60),xy(502,60)]).
hole(r1, [xy(447,60),xy(449,60),xy(447,60)]).
hole(r1, [xy(503,59),xy(505,59),xy(503,59)]).
hole(r1, [xy(448,59),xy(450,59),xy(448,59)]).
hole(r1, [xy(527,58),xy(529,58),xy(527,58)]).
hole(r1, [xy(504,58),xy(506,58),xy(504,58)]).
hole(r1, [xy(528,57),xy(530,57),xy(528,57)]).
hole(r1, [xy(506,57),xy(508,57),xy(506,57)]).
hole(r1, [xy(529,56),xy(531,56),xy(529,56)]).
hole(r1, [xy(508,56),xy(510,56),xy(508,56)]).
hole(r1, [xy(530,55),xy(532,55),xy(530,55)]).
hole(r1, [xy(531,54),xy(533,54),xy(531,54)]).
hole(r1, [xy(511,54),xy(513,54),xy(511,54)]).
hole(r1, [xy(514,52),xy(516,52),xy(514,52)]).
hole(r1, [xy(517,50),xy(519,50),xy(517,50)]).
hole(r1, [xy(520,48),xy(522,48),xy(520,48)]).
hole(r1, [xy(525,45),xy(527,45),xy(525,45)]).
hole(r1, [xy(526,44),xy(528,44),xy(526,44)]).
hole(r1, [xy(528,43),xy(530,43),xy(528,43)]).
hole(r1, [xy(531,41),xy(533,41),xy(531,41)]).
hole(r1, [xy(534,39),xy(536,39),xy(534,39)]).
hole(r1, [xy(537,37),xy(539,37),xy(537,37)]).
hole(r1, [xy(545,32),xy(547,32),xy(545,32)]).
hole(r1, [xy(546,31),xy(548,31),xy(546,31)]).
hole(r1, [xy(771,30),xy(773,30),xy(771,30)]).
hole(r1, [xy(770,29),xy(772,29),xy(770,29)]).
hole(r1, [xy(549,29),xy(551,29),xy(549,29)]).
hole(r1, [xy(769,28),xy(771,28),xy(769,28)]).
hole(r1, [xy(552,27),xy(554,27),xy(552,27)]).
hole(r1, [xy(555,25),xy(557,25),xy(555,25)]).
midline(r1, [xy(293,100),xy(293,77),xy(268,52),xy(209,52),xy(131,129),xy(130,177),xy(78,229),xy(78,285),xy(89,296),xy(127,294),xy(127,296),xy(128,296),xy(129,295),xy(128,294),xy(129,294)]).
midline(r1, [xy(90,297),xy(129,336),xy(140,335),xy(143,340),xy(191,340),xy(282,249),xy(282,222),xy(272,212),xy(262,212),xy(258,208),xy(161,208),xy(130,178),xy(79,229)]).
midline(r1, [xy(143,191),xy(142,291),xy(143,291),xy(144,289)]).
midline(r1, [xy(132,129),xy(207,54)]).
midline(r1, [xy(283,249),xy(335,301),xy(411,300),xy(404,308),xy(342,308),xy(336,302)]).
midline(r1, [xy(412,300),xy(462,301),xy(449,314),xy(410,314),xy(406,312),xy(407,315),xy(408,315),xy(409,314),xy(408,313)]).
midline(r1, [xy(405,308),xy(411,302)]).
midline(r1, [xy(343,309),xy(373,339),xy(425,339),xy(448,315)]).
midline(r1, [xy(450,314),xy(462,302)]).
midline(r1, [xy(293,101),xy(293,124),xy(365,196),xy(359,202),xy(303,202),xy(283,222),xy(301,204)]).
midline(r1, [xy(360,202),xy(366,196),xy(378,196),xy(378,252),xy(375,255),xy(375,257),xy(376,257),xy(378,255),xy(377,257)]).
midline(r1, [xy(379,196),xy(425,196),xy(452,169),xy(454,144),xy(461,137),xy(370,46),xy(275,46),xy(269,52),xy(273,48)]).
midline(r1, [xy(453,168),xy(491,206),xy(491,271),xy(463,300),xy(491,272),xy(538,319),xy(552,317),xy(572,339),xy(600,339),xy(601,341),xy(585,356),xy(584,359),xy(586,358),xy(586,361),xy(582,362),xy(541,321)]).
midline(r1, [xy(447,122),xy(446,60),xy(448,58),xy(450,59),xy(447,62),xy(450,60)]).
midline(r1, [xy(440,115),xy(439,68),xy(441,68),xy(441,70)]).
midline(r1, [xy(454,151),xy(579,276),xy(580,276),xy(581,275),xy(580,274),xy(581,274)]).
midline(r1, [xy(461,138),xy(504,136),xy(504,62),xy(502,60),xy(500,60),xy(500,62),xy(502,62)]).
midline(r1, [xy(504,137),xy(510,136),xy(509,74),xy(513,70),xy(513,72),xy(510,76),xy(512,75)]).
midline(r1, [xy(510,137),xy(526,136),xy(525,59),xy(528,56),xy(528,47),xy(526,46),xy(525,45),xy(525,44),xy(528,42),xy(528,46)]).
midline(r1, [xy(513,73),xy(515,71),xy(514,69),xy(520,63),xy(522,63),xy(522,64),xy(515,72)]).
midline(r1, [xy(522,65),xy(517,70)]).
midline(r1, [xy(526,137),xy(547,136),xy(547,34),xy(545,32),xy(545,31),xy(548,30),xy(548,32)]).
midline(r1, [xy(547,137),xy(585,137),xy(584,284),xy(553,317),xy(571,299),xy(586,297),xy(595,288),xy(593,282),xy(594,279),xy(588,277),xy(588,281),xy(572,297)]).
midline(r1, [xy(586,284),xy(588,282)]).
midline(r1, [xy(592,279),xy(590,278)]).
midline(r1, [xy(587,298),xy(591,302),xy(595,301),xy(603,292),xy(607,291),xy(728,170),xy(729,164),xy(725,160),xy(601,284),xy(599,282),xy(598,282),xy(596,284),xy(595,283),xy(596,280),xy(594,274),xy(720,149),xy(720,143),xy(715,138),xy(586,138)]).
midline(r1, [xy(725,159),xy(725,153),xy(721,149)]).
midline(r1, [xy(592,303),xy(599,310),xy(599,318),xy(596,316),xy(580,300)]).
midline(r1, [xy(597,315),xy(596,314),xy(594,315),xy(595,317),xy(597,317)]).
midline(r1, [xy(725,161),xy(601,285),xy(599,283),xy(597,284),xy(601,288),xy(603,287),xy(602,285),xy(603,286)]).
midline(r1, [xy(601,314),xy(601,312)]).
midline(r1, [xy(596,302),xy(669,301),xy(634,337),xy(621,337),xy(600,318)]).
midline(r1, [xy(604,320),xy(604,307),xy(601,304)]).
midline(r1, [xy(669,303),xy(636,336)]).
midline(r1, [xy(607,322),xy(607,311),xy(605,309),xy(606,309)]).
midline(r1, [xy(400,312),xy(399,311),xy(400,309),xy(402,309),xy(402,311)]).
midline(r1, [xy(769,29),xy(769,27),xy(771,27),xy(770,30),xy(772,31),xy(772,80),xy(715,137),xy(772,81)]).
midline(r1, [xy(773,31),xy(773,29)]).
midline(r1, [xy(192,282),xy(162,311),xy(158,309),xy(157,310),xy(160,312),xy(160,315),xy(141,335),xy(159,317)]).
midline(r1, [xy(181,293),xy(164,310)]).
midline(r1, [xy(251,224),xy(193,281),xy(183,292),xy(183,297),xy(181,298),xy(181,300),xy(182,300),xy(183,299),xy(183,298)]).
midline(r1, [xy(194,281),xy(250,225)]).
midline(r1, [xy(730,195),xy(730,169)]).
midline(r1, [xy(730,196),xy(730,240),xy(670,300),xy(730,241)]).
midline(r1, [xy(518,51),xy(514,51),xy(504,57),xy(502,59),xy(504,58),xy(505,59),xy(504,61),xy(506,57),xy(508,56),xy(508,58)]).
midline(r1, [xy(517,49),xy(519,49),xy(519,51)]).
midline(r1, [xy(510,57),xy(513,55)]).
midline(r1, [xy(514,53),xy(516,53)]).
midline(r1, [xy(254,220),xy(262,213)]).
midline(r1, [xy(596,347),xy(590,354),xy(587,356),xy(587,358),xy(589,357)]).
midline(r1, [xy(597,346),xy(602,341),xy(616,341),xy(620,338)]).
midline(r1, [xy(551,28),xy(549,28),xy(549,30),xy(551,30)]).
midline(r1, [xy(535,38),xy(529,42),xy(530,44)]).
midline(r1, [xy(531,42),xy(533,42)]).
midline(r1, [xy(534,40),xy(536,39),xy(537,36),xy(539,36),xy(539,37),xy(537,38)]).
midline(r1, [xy(555,25),xy(552,26),xy(552,28),xy(554,28)]).
midline(r1, [xy(555,24),xy(557,24),xy(557,25),xy(555,26)]).
midline(r1, [xy(531,53),xy(529,55),xy(528,57),xy(529,58),xy(527,61)]).
midline(r1, [xy(529,59),xy(531,56),xy(530,55),xy(532,53),xy(533,53),xy(533,54),xy(531,57)]).
midline(r1, [xy(521,47),xy(520,49),xy(521,49),xy(522,47)]).
midline(r1, [xy(444,66),xy(443,65),xy(442,65),xy(442,68),xy(444,67)]).
midline(r1, [xy(378,253),xy(380,254),xy(380,256)]).
fillpoint(r1, xy(692,161), 154.3).
fillpoint(r1, xy(689,160), 153.8).
fillpoint(r1, xy(685,159), 152.8).
fillpoint(r1, xy(680,158), 151.8).
fillpoint(r1, xy(675,157), 150.9).
fillpoint(r1, xy(671,156), 149.9).
fillpoint(r1, xy(666,155), 149.0).
fillpoint(r1, xy(662,154), 148.0).
fillpoint(r1, xy(657,153), 147.1).
fillpoint(r1, xy(652,152), 146.1).
fillpoint(r1, xy(648,151), 145.2).
fillpoint(r1, xy(643,150), 144.2).
fillpoint(r1, xy(708,190), 139.4).
fillpoint(r1, xy(709,193), 138.5).
fillpoint(r1, xy(710,198), 137.5).
fillpoint(r1, xy(711,203), 136.6).
fillpoint(r1, xy(712,207), 135.6).
fillpoint(r1, xy(713,212), 134.7).
fillpoint(r1, xy(140,150), 134.3).
fillpoint(r1, xy(139,147), 133.7).
fillpoint(r1, xy(714,216), 133.7).
fillpoint(r1, xy(138,142), 132.7).
fillpoint(r1, xy(715,221), 132.7).
fillpoint(r1, xy(137,138), 131.8).
fillpoint(r1, xy(716,226), 131.8).
fillpoint(r1, xy(484,195), 124.8).
fillpoint(r1, xy(270,224), 114.2).
fillpoint(r1, xy(575,162), 110.0).
fillpoint(r1, xy(568,165), 110.0).
fillpoint(r1, xy(552,172), 110.0).
fillpoint(r1, xy(545,175), 110.0).
fillpoint(r1, xy(538,178), 110.0).
fillpoint(r1, xy(522,185), 110.0).
fillpoint(r1, xy(515,188), 110.0).
fillpoint(r1, xy(577,161), 109.9).
fillpoint(r1, xy(573,163), 109.9).
fillpoint(r1, xy(570,164), 109.9).
fillpoint(r1, xy(566,166), 109.9).
fillpoint(r1, xy(561,168), 109.9).
fillpoint(r1, xy(559,169), 109.9).
fillpoint(r1, xy(554,171), 109.9).
fillpoint(r1, xy(547,174), 109.9).
fillpoint(r1, xy(543,176), 109.9).
fillpoint(r1, xy(536,179), 109.9).
fillpoint(r1, xy(531,181), 109.9).
fillpoint(r1, xy(529,182), 109.9).
fillpoint(r1, xy(524,184), 109.9).
fillpoint(r1, xy(520,186), 109.9).
fillpoint(r1, xy(517,187), 109.9).
fillpoint(r1, xy(513,189), 109.9).
fillpoint(r1, xy(563,167), 109.8).
fillpoint(r1, xy(557,170), 109.8).
fillpoint(r1, xy(550,173), 109.8).
fillpoint(r1, xy(540,177), 109.8).
fillpoint(r1, xy(533,180), 109.8).
fillpoint(r1, xy(527,183), 109.8).
fillpoint(r1, xy(222,203), 108.3).
fillpoint(r1, xy(185,187), 108.2).
fillpoint(r1, xy(192,190), 108.2).
fillpoint(r1, xy(199,193), 108.2).
fillpoint(r1, xy(206,196), 108.2).
fillpoint(r1, xy(208,197), 108.2).
fillpoint(r1, xy(213,199), 108.2).
fillpoint(r1, xy(215,200), 108.2).
fillpoint(r1, xy(229,206), 108.2).
fillpoint(r1, xy(231,207), 108.2).
fillpoint(r1, xy(236,209), 108.2).
fillpoint(r1, xy(238,210), 108.2).
fillpoint(r1, xy(245,213), 108.2).
fillpoint(r1, xy(252,216), 108.2).
fillpoint(r1, xy(259,219), 108.2).
fillpoint(r1, xy(187,188), 108.1).
fillpoint(r1, xy(190,189), 108.1).
fillpoint(r1, xy(194,191), 108.1).
fillpoint(r1, xy(197,192), 108.1).
fillpoint(r1, xy(201,194), 108.1).
fillpoint(r1, xy(204,195), 108.1).
fillpoint(r1, xy(210,198), 108.1).
fillpoint(r1, xy(217,201), 108.1).
fillpoint(r1, xy(220,202), 108.1).
fillpoint(r1, xy(224,204), 108.1).
fillpoint(r1, xy(227,205), 108.1).
fillpoint(r1, xy(234,208), 108.1).
fillpoint(r1, xy(240,211), 108.1).
fillpoint(r1, xy(243,212), 108.1).
fillpoint(r1, xy(247,214), 108.1).
fillpoint(r1, xy(250,215), 108.1).
fillpoint(r1, xy(254,217), 108.1).
fillpoint(r1, xy(257,218), 108.1).
fillpoint(r1, xy(270,257), 101.4).
fillpoint(r1, xy(417,165), 101.2).
fillpoint(r1, xy(424,168), 101.2).
fillpoint(r1, xy(403,159), 101.1).
fillpoint(r1, xy(408,161), 101.1).
fillpoint(r1, xy(410,162), 101.1).
fillpoint(r1, xy(415,164), 101.1).
fillpoint(r1, xy(426,169), 101.1).
fillpoint(r1, xy(431,171), 101.1).
fillpoint(r1, xy(433,172), 101.1).
fillpoint(r1, xy(438,174), 101.1).
fillpoint(r1, xy(406,160), 101.0).
fillpoint(r1, xy(412,163), 101.0).
fillpoint(r1, xy(419,166), 101.0).
fillpoint(r1, xy(422,167), 101.0).
fillpoint(r1, xy(429,170), 101.0).
fillpoint(r1, xy(436,173), 101.0).
fillpoint(r1, xy(377,163), 87.3).
fillpoint(r1, xy(370,166), 87.3).
fillpoint(r1, xy(361,170), 87.3).
fillpoint(r1, xy(354,173), 87.3).
fillpoint(r1, xy(347,176), 87.3).
fillpoint(r1, xy(340,179), 87.3).
fillpoint(r1, xy(331,183), 87.3).
fillpoint(r1, xy(324,186), 87.3).
fillpoint(r1, xy(375,164), 87.2).
fillpoint(r1, xy(372,165), 87.2).
fillpoint(r1, xy(368,167), 87.2).
fillpoint(r1, xy(363,169), 87.2).
fillpoint(r1, xy(356,172), 87.2).
fillpoint(r1, xy(352,174), 87.2).
fillpoint(r1, xy(349,175), 87.2).
fillpoint(r1, xy(345,177), 87.2).
fillpoint(r1, xy(338,180), 87.2).
fillpoint(r1, xy(333,182), 87.2).
fillpoint(r1, xy(329,184), 87.2).
fillpoint(r1, xy(326,185), 87.2).
fillpoint(r1, xy(365,168), 87.1).
fillpoint(r1, xy(359,171), 87.1).
fillpoint(r1, xy(342,178), 87.1).
fillpoint(r1, xy(336,181), 87.1).
fillpoint(r1, xy(74,246), 71.6).
fillpoint(r1, xy(73,251), 70.7).
fillpoint(r1, xy(72,255), 69.7).
fillpoint(r1, xy(71,260), 68.8).
fillpoint(r1, xy(70,265), 67.8).
fillpoint(r1, xy(69,269), 66.8).
fillpoint(r1, xy(68,274), 65.9).
fillpoint(r1, xy(67,278), 64.9).
fillpoint(r1, xy(66,283), 64.0).
fillpoint(r1, xy(65,288), 63.0).
fillpoint(r1, xy(376,65), 62.6).
fillpoint(r1, xy(64,292), 62.1).
fillpoint(r1, xy(64,299), 62.1).
fillpoint(r1, xy(377,71), 61.0).
fillpoint(r1, xy(380,78), 61.0).
fillpoint(r1, xy(383,85), 61.0).
fillpoint(r1, xy(386,92), 61.0).
fillpoint(r1, xy(378,73), 60.9).
fillpoint(r1, xy(379,76), 60.9).
fillpoint(r1, xy(381,80), 60.9).
fillpoint(r1, xy(382,83), 60.9).
fillpoint(r1, xy(384,87), 60.9).
fillpoint(r1, xy(385,90), 60.9).
fillpoint(r1, xy(334,301), 60.2).
fillpoint(r1, xy(222,61), 59.2).
fillpoint(r1, xy(227,60), 58.3).
fillpoint(r1, xy(232,59), 57.3).
fillpoint(r1, xy(236,58), 56.3).
fillpoint(r1, xy(241,57), 55.4).
fillpoint(r1, xy(245,56), 54.4).
fillpoint(r1, xy(281,56), 54.4).
fillpoint(r1, xy(250,55), 53.5).
fillpoint(r1, xy(276,55), 53.5).
fillpoint(r1, xy(255,54), 52.5).
fillpoint(r1, xy(272,54), 52.5).
fillpoint(r1, xy(287,54), 52.5).
fillpoint(r1, xy(358,54), 52.5).
fillpoint(r1, xy(259,53), 51.6).
fillpoint(r1, xy(267,53), 51.6).
fillpoint(r1, xy(292,53), 51.6).
fillpoint(r1, xy(354,53), 51.6).
fillpoint(r1, xy(263,53), 50.6).
fillpoint(r1, xy(296,52), 50.6).
fillpoint(r1, xy(349,52), 50.6).
fillpoint(r1, xy(301,51), 49.7).
fillpoint(r1, xy(345,51), 49.7).
fillpoint(r1, xy(305,50), 48.7).
fillpoint(r1, xy(340,50), 48.7).
fillpoint(r1, xy(310,49), 47.8).
fillpoint(r1, xy(335,49), 47.8).
fillpoint(r1, xy(315,48), 46.8).
fillpoint(r1, xy(331,48), 46.8).
fillpoint(r1, xy(319,47), 45.8).
fillpoint(r1, xy(326,47), 45.8).
fillpoint(r1, xy(807,58), 44.9).
fillpoint(r1, xy(808,54), 43.9).
fillpoint(r1, xy(809,49), 43.0).
fillpoint(r1, xy(810,45), 42.0).
border(r1).
region(r48, '#585654', 4, centroid(322,94)).
perimeter(r48, 8).
region(r87, '#848686', 4, centroid(398,298)).
perimeter(r87, 8).

adjacent(r1, r48).
shared_edge(r1, r48, 8).
adjacent(r1, r87).
shared_edge(r1, r87, 8).

encloses(r1, r48).
encloses(r1, r87).

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
opencv_component(cc1, [r48]).
opencv_component_area(cc1, 4).
opencv_component_centroid(cc1, centroid(322,94)).
opencv_component(cc2, [r87]).
opencv_component_area(cc2, 4).
opencv_component_centroid(cc2, centroid(398,298)).
opencv_morphology(r1, opening_area(310720), closing_area(313279), gradient_area(5344)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
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
opencv_contour(r1, c6, hole, 4.0).
opencv_contour_hierarchy(r1, c6, next(c7), previous(c5), child(none), parent(c0)).
opencv_contour(r1, c7, hole, 4.0).
opencv_contour_hierarchy(r1, c7, next(c8), previous(c6), child(none), parent(c0)).
opencv_contour(r1, c8, hole, 2.0).
opencv_contour_hierarchy(r1, c8, next(c9), previous(c7), child(none), parent(c0)).
opencv_contour(r1, c9, hole, 2.0).
opencv_contour_hierarchy(r1, c9, next(c10), previous(c8), child(none), parent(c0)).
opencv_contour(r1, c10, hole, 4.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 2.0).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 2.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 2.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 4.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 11.5).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 4.0).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 2.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 4.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 2.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 2.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 4.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 4.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 2.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 7.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 2.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 7.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 10.0).
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
opencv_contour(r1, c34, hole, 4.0).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 4.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 4.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 2.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 2.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 4.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 4.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 2.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 10.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 7.0).
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
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 2.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 2.0).
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
opencv_contour(r1, c91, hole, 2.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 2.0).
opencv_contour_hierarchy(r1, c92, next(none), previous(c91), child(none), parent(c0)).
opencv_watershed_count(r48, 1).
opencv_watershed_segment(r48, ws1, 4, centroid(322,94)).
opencv_watershed_count(r87, 1).
opencv_watershed_segment(r87, ws1, 4, centroid(398,298)).
