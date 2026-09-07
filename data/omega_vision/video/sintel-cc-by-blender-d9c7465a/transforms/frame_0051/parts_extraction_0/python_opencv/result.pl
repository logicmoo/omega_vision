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

region(r1, '#4f3a23', 310184, centroid(427,182)).
perimeter(r1, 3390).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(332,0),xy(338,5),xy(337,12),xy(332,11),xy(317,0),xy(0,0)]).
hole(r1, [xy(325,359),xy(322,363),xy(321,361),xy(325,359)]).
hole(r1, [xy(392,344),xy(394,344),xy(392,344)]).
hole(r1, [xy(393,343),xy(395,343),xy(393,343)]).
hole(r1, [xy(404,340),xy(406,340),xy(404,340)]).
hole(r1, [xy(460,326),xy(462,326),xy(460,326)]).
hole(r1, [xy(331,290),xy(334,290),xy(331,290)]).
hole(r1, [xy(333,289),xy(335,289),xy(333,289)]).
hole(r1, [xy(614,287),xy(616,287),xy(614,287)]).
hole(r1, [xy(350,286),xy(352,286),xy(350,286)]).
hole(r1, [xy(253,273),xy(256,273),xy(253,273)]).
hole(r1, [xy(254,267),xy(256,267),xy(254,267)]).
hole(r1, [xy(698,265),xy(700,266),xy(698,265)]).
hole(r1, [xy(556,260),xy(560,259),xy(562,261),xy(560,263),xy(556,260)]).
hole(r1, [xy(253,255),xy(253,259),xy(253,255)]).
hole(r1, [xy(450,249),xy(453,248),xy(459,252),xy(456,253),xy(450,249)]).
hole(r1, [xy(550,248),xy(565,253),xy(562,255),xy(552,251),xy(550,248)]).
hole(r1, [xy(533,244),xy(537,243),xy(540,245),xy(536,246),xy(533,244)]).
hole(r1, [xy(250,244),xy(253,244),xy(250,244)]).
hole(r1, [xy(547,234),xy(549,232),xy(561,238),xy(558,239),xy(547,234)]).
hole(r1, [xy(248,232),xy(248,236),xy(248,232)]).
hole(r1, [xy(530,229),xy(532,229),xy(530,229)]).
hole(r1, [xy(544,220),xy(549,219),xy(557,222),xy(559,225),xy(555,226),xy(544,220)]).
hole(r1, [xy(401,218),xy(404,218),xy(401,218)]).
hole(r1, [xy(400,217),xy(402,217),xy(400,217)]).
hole(r1, [xy(527,216),xy(529,216),xy(527,216)]).
hole(r1, [xy(529,215),xy(533,216),xy(530,217),xy(529,215)]).
hole(r1, [xy(524,215),xy(526,215),xy(524,215)]).
hole(r1, [xy(542,203),xy(545,201),xy(556,207),xy(553,208),xy(542,203)]).
hole(r1, [xy(530,179),xy(533,180),xy(531,181),xy(530,179)]).
hole(r1, [xy(264,178),xy(266,177),xy(267,180),xy(264,178)]).
hole(r1, [xy(261,176),xy(265,177),xy(261,176)]).
hole(r1, [xy(252,176),xy(255,176),xy(252,176)]).
hole(r1, [xy(259,175),xy(261,175),xy(259,175)]).
hole(r1, [xy(254,175),xy(256,175),xy(254,175)]).
hole(r1, [xy(456,167),xy(460,167),xy(456,167)]).
hole(r1, [xy(447,167),xy(449,167),xy(447,167)]).
hole(r1, [xy(422,166),xy(424,167),xy(422,166)]).
hole(r1, [xy(476,163),xy(478,163),xy(476,163)]).
hole(r1, [xy(483,162),xy(486,162),xy(483,162)]).
hole(r1, [xy(471,162),xy(474,162),xy(471,162)]).
hole(r1, [xy(558,162),xy(560,160),xy(567,161),xy(566,163),xy(558,162)]).
hole(r1, [xy(495,160),xy(497,160),xy(495,160)]).
hole(r1, [xy(476,161),xy(477,159),xy(479,160),xy(476,161)]).
hole(r1, [xy(502,158),xy(504,158),xy(502,158)]).
hole(r1, [xy(486,158),xy(488,159),xy(486,158)]).
hole(r1, [xy(489,156),xy(492,156),xy(489,156)]).
hole(r1, [xy(294,150),xy(296,151),xy(294,150)]).
hole(r1, [xy(270,150),xy(272,150),xy(270,150)]).
hole(r1, [xy(268,149),xy(270,149),xy(268,149)]).
hole(r1, [xy(287,148),xy(289,148),xy(287,148)]).
hole(r1, [xy(287,143),xy(287,148),xy(287,143)]).
hole(r1, [xy(284,142),xy(286,143),xy(284,142)]).
hole(r1, [xy(265,144),xy(266,141),xy(272,142),xy(269,145),xy(265,144)]).
hole(r1, [xy(294,104),xy(296,104),xy(294,104)]).
hole(r1, [xy(290,104),xy(293,105),xy(291,106),xy(290,104)]).
hole(r1, [xy(292,102),xy(294,102),xy(292,102)]).
hole(r1, [xy(291,101),xy(293,101),xy(291,101)]).
hole(r1, [xy(288,101),xy(291,103),xy(288,101)]).
hole(r1, [xy(450,100),xy(453,99),xy(454,101),xy(451,102),xy(450,100)]).
hole(r1, [xy(287,100),xy(289,100),xy(287,100)]).
hole(r1, [xy(290,99),xy(292,99),xy(290,99)]).
hole(r1, [xy(286,99),xy(288,99),xy(286,99)]).
hole(r1, [xy(289,98),xy(291,98),xy(289,98)]).
hole(r1, [xy(285,98),xy(287,98),xy(285,98)]).
hole(r1, [xy(288,97),xy(290,97),xy(288,97)]).
hole(r1, [xy(287,96),xy(289,96),xy(287,96)]).
hole(r1, [xy(284,96),xy(286,97),xy(284,96)]).
hole(r1, [xy(286,95),xy(288,95),xy(286,95)]).
hole(r1, [xy(283,95),xy(285,95),xy(283,95)]).
hole(r1, [xy(285,94),xy(287,94),xy(285,94)]).
hole(r1, [xy(455,93),xy(457,92),xy(458,94),xy(456,95),xy(455,93)]).
hole(r1, [xy(282,93),xy(284,93),xy(282,93)]).
hole(r1, [xy(450,92),xy(452,91),xy(454,95),xy(452,96),xy(450,92)]).
hole(r1, [xy(550,87),xy(553,87),xy(550,87)]).
hole(r1, [xy(341,83),xy(343,83),xy(341,83)]).
hole(r1, [xy(561,82),xy(567,81),xy(568,83),xy(562,84),xy(561,82)]).
hole(r1, [xy(349,82),xy(351,82),xy(349,82)]).
hole(r1, [xy(567,80),xy(569,80),xy(567,80)]).
hole(r1, [xy(568,78),xy(570,78),xy(568,78)]).
hole(r1, [xy(567,74),xy(570,73),xy(571,77),xy(567,74)]).
hole(r1, [xy(564,70),xy(566,71),xy(564,70)]).
hole(r1, [xy(563,68),xy(565,69),xy(563,68)]).
hole(r1, [xy(560,64),xy(564,65),xy(561,66),xy(560,64)]).
hole(r1, [xy(297,59),xy(303,58),xy(309,65),xy(307,66),xy(297,59)]).
hole(r1, [xy(471,58),xy(473,58),xy(471,58)]).
hole(r1, [xy(471,51),xy(473,51),xy(471,51)]).
hole(r1, [xy(461,50),xy(463,51),xy(461,50)]).
hole(r1, [xy(467,49),xy(469,49),xy(467,49)]).
hole(r1, [xy(465,48),xy(468,48),xy(465,48)]).
hole(r1, [xy(374,44),xy(377,44),xy(374,44)]).
hole(r1, [xy(349,39),xy(351,39),xy(349,39)]).
hole(r1, [xy(348,38),xy(350,38),xy(348,38)]).
hole(r1, [xy(346,36),xy(349,37),xy(347,38),xy(346,36)]).
hole(r1, [xy(344,32),xy(346,33),xy(344,32)]).
hole(r1, [xy(343,30),xy(345,31),xy(343,30)]).
hole(r1, [xy(342,28),xy(344,29),xy(342,28)]).
hole(r1, [xy(455,25),xy(457,25),xy(455,25)]).
hole(r1, [xy(357,22),xy(376,38),xy(374,44),xy(356,28),xy(357,22)]).
hole(r1, [xy(455,19),xy(457,19),xy(455,19)]).
hole(r1, [xy(333,19),xy(336,19),xy(333,19)]).
hole(r1, [xy(325,13),xy(328,13),xy(325,13)]).
hole(r1, [xy(321,10),xy(323,9),xy(326,12),xy(324,13),xy(321,10)]).
hole(r1, [xy(319,8),xy(322,9),xy(320,10),xy(319,8)]).
midline(r1, [xy(335,1),xy(340,2),xy(348,10),xy(345,20),xy(339,15),xy(331,15),xy(322,6),xy(314,5),xy(290,29),xy(268,29),xy(248,49),xy(233,50),xy(213,70),xy(195,70),xy(176,88),xy(164,88),xy(136,116),xy(129,117),xy(123,124),xy(123,239),xy(183,299),xy(189,298),xy(200,311),xy(246,266),xy(254,265),xy(254,268),xy(255,268),xy(256,267),xy(256,265),xy(261,265),xy(274,252),xy(273,250),xy(237,250),xy(190,298),xy(237,251)]).
midline(r1, [xy(347,19),xy(350,22),xy(350,26),xy(342,30),xy(326,46),xy(322,39),xy(315,39),xy(311,35),xy(295,34),xy(291,29),xy(314,6)]).
midline(r1, [xy(331,16),xy(325,20),xy(325,13),xy(326,12),xy(326,10)]).
midline(r1, [xy(327,21),xy(330,18)]).
midline(r1, [xy(348,29),xy(350,27),xy(351,30),xy(327,52),xy(325,46)]).
midline(r1, [xy(125,122),xy(129,118)]).
midline(r1, [xy(203,312),xy(209,318),xy(277,317),xy(321,363),xy(328,361),xy(361,326),xy(298,325),xy(289,316),xy(278,317)]).
midline(r1, [xy(362,327),xy(370,326),xy(391,305),xy(391,287),xy(352,285),xy(350,285),xy(350,287),xy(352,287)]).
midline(r1, [xy(392,305),xy(394,307),xy(394,341),xy(392,345),xy(393,345),xy(394,344),xy(393,343),xy(394,342),xy(395,342),xy(394,345)]).
midline(r1, [xy(164,89),xy(137,117),xy(225,205),xy(237,205),xy(256,186),xy(258,180),xy(258,176),xy(256,174),xy(254,174),xy(254,175),xy(256,176)]).
midline(r1, [xy(238,206),xy(275,207),xy(279,211),xy(252,239),xy(246,240),xy(238,249),xy(246,241)]).
midline(r1, [xy(253,239),xy(280,212),xy(284,212),xy(298,226),xy(274,250),xy(299,226),xy(310,235),xy(294,251),xy(294,311),xy(290,315),xy(293,313)]).
midline(r1, [xy(295,251),xy(311,235),xy(322,235),xy(333,224),xy(334,219),xy(279,162),xy(270,159),xy(249,160),xy(177,88),xy(193,72)]).
midline(r1, [xy(257,161),xy(257,174),xy(259,176),xy(260,176),xy(261,175),xy(260,174),xy(261,174)]).
midline(r1, [xy(334,223),xy(367,256),xy(333,288),xy(333,289),xy(335,290)]).
midline(r1, [xy(257,185),xy(278,163)]).
midline(r1, [xy(391,286),xy(391,277),xy(368,256),xy(336,288)]).
midline(r1, [xy(340,33),xy(327,46)]).
midline(r1, [xy(342,32),xy(346,31)]).
midline(r1, [xy(348,12),xy(372,11),xy(394,18),xy(418,42),xy(417,43),xy(375,43),xy(374,44),xy(374,104),xy(370,105),xy(341,76),xy(338,67),xy(327,56),xy(327,53),xy(344,36)]).
midline(r1, [xy(347,83),xy(341,82),xy(341,84),xy(343,84)]).
midline(r1, [xy(374,105),xy(390,104),xy(418,134),xy(440,133),xy(440,202),xy(428,192),xy(397,192),xy(358,154),xy(351,161),xy(349,168),xy(349,204),xy(335,218),xy(348,206)]).
midline(r1, [xy(441,167),xy(447,166),xy(447,168),xy(448,168),xy(449,167),xy(448,166),xy(449,166)]).
midline(r1, [xy(440,203),xy(443,208),xy(427,224),xy(427,241),xy(392,276),xy(426,243)]).
midline(r1, [xy(428,224),xy(444,208),xy(491,208),xy(495,203),xy(495,198),xy(466,169),xy(466,160),xy(441,135)]).
midline(r1, [xy(358,155),xy(352,161)]).
midline(r1, [xy(478,180),xy(478,165),xy(475,162),xy(475,160),xy(446,131),xy(441,133)]).
midline(r1, [xy(447,131),xy(462,129),xy(482,151),xy(481,163),xy(479,165),xy(478,163),xy(476,162)]).
midline(r1, [xy(483,151),xy(494,163),xy(496,162),xy(495,159),xy(497,159),xy(496,163)]).
midline(r1, [xy(498,162),xy(509,172),xy(509,180),xy(507,181),xy(483,158)]).
midline(r1, [xy(510,172),xy(511,159),xy(504,157),xy(502,157),xy(502,159),xy(504,159)]).
midline(r1, [xy(511,158),xy(525,145),xy(525,127),xy(527,123),xy(525,121),xy(517,121),xy(504,108),xy(487,125),xy(484,125),xy(454,96),xy(399,96),xy(391,104),xy(397,98)]).
midline(r1, [xy(504,107),xy(504,98),xy(478,72),xy(441,71),xy(418,48),xy(413,53),xy(413,81),xy(399,95),xy(412,83)]).
midline(r1, [xy(525,146),xy(546,166),xy(546,176),xy(552,182),xy(543,191),xy(533,191),xy(525,198),xy(497,198),xy(496,196),xy(507,186)]).
midline(r1, [xy(504,109),xy(489,124)]).
midline(r1, [xy(480,165),xy(481,164)]).
midline(r1, [xy(414,53),xy(418,49)]).
midline(r1, [xy(531,193),xy(526,198),xy(538,209),xy(539,222),xy(529,230),xy(520,230),xy(496,254),xy(495,215),xy(492,209)]).
midline(r1, [xy(520,231),xy(496,255),xy(496,282),xy(504,291),xy(506,298),xy(506,303),xy(501,308),xy(395,307)]).
midline(r1, [xy(534,228),xy(538,224)]).
midline(r1, [xy(540,212),xy(564,214),xy(585,193),xy(577,184),xy(568,182),xy(553,182),xy(544,191)]).
midline(r1, [xy(506,304),xy(502,308),xy(509,313),xy(611,313),xy(614,311),xy(615,308),xy(564,257),xy(558,256),xy(552,256),xy(507,301),xy(552,257)]).
midline(r1, [xy(530,230),xy(538,231),xy(545,241),xy(545,250),xy(505,291),xy(544,252)]).
midline(r1, [xy(546,242),xy(568,244),xy(603,209),xy(604,206),xy(586,192)]).
midline(r1, [xy(604,208),xy(609,207),xy(631,229),xy(631,286),xy(614,286),xy(614,288),xy(616,288)]).
midline(r1, [xy(454,72),xy(454,95)]).
midline(r1, [xy(527,125),xy(588,124),xy(590,121),xy(557,88),xy(557,82),xy(549,74),xy(517,43),xy(511,43),xy(491,23),xy(456,22),xy(435,25),xy(419,41),xy(418,47)]).
midline(r1, [xy(590,123),xy(612,121),xy(570,79),xy(550,74)]).
midline(r1, [xy(570,78),xy(569,77),xy(568,77)]).
midline(r1, [xy(435,26),xy(420,41)]).
midline(r1, [xy(441,25),xy(466,52),xy(468,51),xy(467,49),xy(469,48),xy(468,52)]).
midline(r1, [xy(508,182),xy(508,184)]).
midline(r1, [xy(463,129),xy(481,128),xy(483,126)]).
midline(r1, [xy(631,287),xy(631,296),xy(615,310)]).
midline(r1, [xy(620,308),xy(632,297),xy(650,315),xy(749,314),xy(776,287),xy(776,188),xy(720,132),xy(703,132),xy(607,36),xy(600,36),xy(596,32),xy(527,32),xy(517,42),xy(527,33)]).
midline(r1, [xy(632,229),xy(632,200),xy(660,170),xy(612,122)]).
midline(r1, [xy(660,172),xy(666,170),xy(703,133)]).
midline(r1, [xy(405,309),xy(404,341),xy(405,341),xy(406,339)]).
midline(r1, [xy(510,43),xy(509,84),xy(506,87),xy(477,58),xy(471,57),xy(471,59),xy(473,59)]).
midline(r1, [xy(509,85),xy(506,88),xy(506,97)]).
midline(r1, [xy(348,34),xy(351,31),xy(354,36),xy(353,42),xy(349,40)]).
midline(r1, [xy(354,42),xy(355,50),xy(339,67),xy(355,51)]).
midline(r1, [xy(322,7),xy(322,9),xy(298,33),xy(321,11)]).
midline(r1, [xy(233,51),xy(214,71),xy(262,119),xy(267,118),xy(271,122),xy(291,103),xy(291,101),xy(284,94),xy(283,94),xy(282,92),xy(287,93),xy(287,94),xy(286,95),xy(287,96),xy(285,98),xy(285,100),xy(268,118),xy(286,100),xy(286,99),xy(289,96),xy(288,94),xy(295,87),xy(290,82),xy(279,80),xy(249,50),xy(268,30)]).
midline(r1, [xy(282,94),xy(284,96)]).
midline(r1, [xy(272,123),xy(278,123),xy(278,152),xy(271,159),xy(268,148),xy(272,149),xy(272,151)]).
midline(r1, [xy(272,159),xy(278,153)]).
midline(r1, [xy(279,124),xy(304,124),xy(279,150),xy(305,125),xy(309,127),xy(287,148),xy(287,149),xy(288,149),xy(289,148),xy(289,152),xy(280,162),xy(288,154)]).
midline(r1, [xy(291,147),xy(310,128),xy(316,127),xy(334,108),xy(315,88),xy(295,89)]).
midline(r1, [xy(334,109),xy(338,108),xy(359,128),xy(359,153)]).
midline(r1, [xy(350,168),xy(400,218),xy(401,218),xy(402,216)]).
midline(r1, [xy(496,215),xy(524,214),xy(525,216),xy(526,214),xy(527,217),xy(528,217),xy(529,216),xy(528,215),xy(529,215)]).
midline(r1, [xy(477,57),xy(470,51),xy(473,50),xy(473,52)]).
midline(r1, [xy(461,309),xy(460,327),xy(461,327),xy(462,325)]).
midline(r1, [xy(293,100),xy(290,97),xy(287,100),xy(287,101),xy(288,101),xy(290,99),xy(293,101),xy(292,103),xy(293,103),xy(294,101)]).
midline(r1, [xy(290,96),xy(292,98)]).
midline(r1, [xy(333,29),xy(332,30)]).
midline(r1, [xy(586,209),xy(564,230),xy(541,228),xy(539,231),xy(541,229)]).
midline(r1, [xy(585,210),xy(565,230)]).
midline(r1, [xy(598,39),xy(570,66),xy(560,68),xy(556,73),xy(560,70),xy(568,69),xy(563,76),xy(566,74)]).
midline(r1, [xy(597,40),xy(570,68)]).
midline(r1, [xy(368,107),xy(365,110),xy(365,122),xy(360,127),xy(365,123)]).
midline(r1, [xy(339,24),xy(337,25)]).
midline(r1, [xy(456,20),xy(455,19),xy(455,18),xy(457,18),xy(457,20),xy(455,20)]).
midline(r1, [xy(324,22),xy(325,21)]).
midline(r1, [xy(294,105),xy(294,103),xy(296,103),xy(296,105)]).
midline(r1, [xy(593,201),xy(587,208),xy(595,200)]).
midline(r1, [xy(341,22),xy(343,21)]).
midline(r1, [xy(369,106),xy(369,105)]).
midline(r1, [xy(456,24),xy(456,23)]).
midline(r1, [xy(570,80),xy(568,79),xy(567,80),xy(567,81),xy(569,81)]).
midline(r1, [xy(351,38),xy(349,37),xy(351,39)]).
midline(r1, [xy(350,81),xy(349,81),xy(349,82),xy(350,83),xy(351,82),xy(351,81)]).
midline(r1, [xy(599,37),xy(600,37)]).
fillpoint(r1, xy(717,136), 130.7).
fillpoint(r1, xy(714,135), 129.9).
fillpoint(r1, xy(134,135), 128.9).
fillpoint(r1, xy(709,134), 128.9).
fillpoint(r1, xy(690,134), 128.8).
fillpoint(r1, xy(694,133), 128.0).
fillpoint(r1, xy(704,133), 128.0).
fillpoint(r1, xy(133,139), 128.0).
fillpoint(r1, xy(133,145), 127.4).
fillpoint(r1, xy(699,132), 127.0).
fillpoint(r1, xy(133,143), 127.0).
fillpoint(r1, xy(132,148), 127.0).
fillpoint(r1, xy(131,152), 126.1).
fillpoint(r1, xy(131,199), 125.8).
fillpoint(r1, xy(130,157), 125.1).
fillpoint(r1, xy(130,195), 125.1).
fillpoint(r1, xy(130,203), 125.1).
fillpoint(r1, xy(129,162), 124.1).
fillpoint(r1, xy(129,191), 124.1).
fillpoint(r1, xy(129,207), 124.1).
fillpoint(r1, xy(128,166), 123.2).
fillpoint(r1, xy(128,186), 123.2).
fillpoint(r1, xy(128,212), 123.2).
fillpoint(r1, xy(127,171), 122.2).
fillpoint(r1, xy(127,181), 122.2).
fillpoint(r1, xy(127,216), 122.2).
fillpoint(r1, xy(126,176), 121.3).
fillpoint(r1, xy(126,221), 121.3).
fillpoint(r1, xy(125,226), 120.3).
fillpoint(r1, xy(124,230), 119.4).
fillpoint(r1, xy(124,239), 119.4).
fillpoint(r1, xy(124,234), 118.4).
fillpoint(r1, xy(764,207), 86.0).
fillpoint(r1, xy(765,211), 85.0).
fillpoint(r1, xy(766,216), 84.0).
fillpoint(r1, xy(767,221), 83.1).
fillpoint(r1, xy(768,225), 82.1).
fillpoint(r1, xy(769,230), 81.2).
fillpoint(r1, xy(639,208), 80.6).
fillpoint(r1, xy(638,211), 80.6).
fillpoint(r1, xy(770,235), 80.2).
fillpoint(r1, xy(771,239), 79.3).
fillpoint(r1, xy(772,244), 78.3).
fillpoint(r1, xy(773,248), 77.4).
fillpoint(r1, xy(773,283), 77.4).
fillpoint(r1, xy(774,253), 76.4).
fillpoint(r1, xy(774,278), 76.4).
fillpoint(r1, xy(775,258), 75.4).
fillpoint(r1, xy(775,274), 75.4).
fillpoint(r1, xy(776,262), 74.5).
fillpoint(r1, xy(776,269), 74.5).
fillpoint(r1, xy(326,216), 72.0).
fillpoint(r1, xy(327,213), 71.9).
fillpoint(r1, xy(362,146), 65.6).
fillpoint(r1, xy(355,169), 64.8).
fillpoint(r1, xy(351,177), 64.3).
fillpoint(r1, xy(348,184), 64.3).
fillpoint(r1, xy(345,191), 64.3).
fillpoint(r1, xy(361,154), 64.2).
fillpoint(r1, xy(357,163), 64.2).
fillpoint(r1, xy(352,175), 64.2).
fillpoint(r1, xy(349,182), 64.2).
fillpoint(r1, xy(347,186), 64.2).
fillpoint(r1, xy(344,193), 64.2).
fillpoint(r1, xy(362,152), 64.1).
fillpoint(r1, xy(360,156), 64.1).
fillpoint(r1, xy(358,161), 64.1).
fillpoint(r1, xy(356,165), 64.1).
fillpoint(r1, xy(353,172), 64.1).
fillpoint(r1, xy(350,179), 64.1).
fillpoint(r1, xy(346,189), 64.1).
fillpoint(r1, xy(343,196), 64.1).
fillpoint(r1, xy(359,159), 64.0).
fillpoint(r1, xy(512,300), 59.5).
fillpoint(r1, xy(511,298), 59.4).
fillpoint(r1, xy(513,302), 59.2).
fillpoint(r1, xy(396,116), 58.0).
fillpoint(r1, xy(518,304), 57.3).
fillpoint(r1, xy(523,305), 56.3).
fillpoint(r1, xy(527,306), 55.4).
fillpoint(r1, xy(389,123), 55.2).
fillpoint(r1, xy(384,125), 55.2).
fillpoint(r1, xy(405,277), 55.1).
fillpoint(r1, xy(407,282), 55.1).
fillpoint(r1, xy(387,124), 55.0).
fillpoint(r1, xy(406,280), 55.0).
fillpoint(r1, xy(404,275), 54.8).
fillpoint(r1, xy(532,307), 54.4).
fillpoint(r1, xy(737,307), 54.4).
fillpoint(r1, xy(663,307), 54.1).
fillpoint(r1, xy(536,308), 53.5).
fillpoint(r1, xy(666,308), 53.5).
fillpoint(r1, xy(732,308), 53.5).
fillpoint(r1, xy(541,309), 52.5).
fillpoint(r1, xy(671,309), 52.5).
fillpoint(r1, xy(727,309), 52.5).
fillpoint(r1, xy(414,289), 52.4).
fillpoint(r1, xy(416,290), 52.3).
fillpoint(r1, xy(419,291), 52.3).
fillpoint(r1, xy(421,292), 52.3).
fillpoint(r1, xy(398,97), 51.9).
fillpoint(r1, xy(397,99), 51.9).
fillpoint(r1, xy(546,310), 51.6).
fillpoint(r1, xy(675,310), 51.6).
fillpoint(r1, xy(723,310), 51.6).
fillpoint(r1, xy(506,106), 50.8).
fillpoint(r1, xy(219,311), 50.6).
fillpoint(r1, xy(550,311), 50.6).
fillpoint(r1, xy(571,311), 50.6).
fillpoint(r1, xy(680,311), 50.6).
fillpoint(r1, xy(718,311), 50.6).
fillpoint(r1, xy(401,86), 50.2).
fillpoint(r1, xy(400,88), 50.2).
fillpoint(r1, xy(399,90), 50.1).
fillpoint(r1, xy(288,311), 50.0).
fillpoint(r1, xy(224,312), 49.7).
fillpoint(r1, xy(286,312), 49.7).
fillpoint(r1, xy(555,312), 49.7).
fillpoint(r1, xy(565,312), 49.7).
fillpoint(r1, xy(685,312), 49.7).
fillpoint(r1, xy(714,312), 49.7).
fillpoint(r1, xy(228,313), 48.7).
fillpoint(r1, xy(281,313), 48.7).
fillpoint(r1, xy(560,313), 48.7).
fillpoint(r1, xy(689,313), 48.7).
fillpoint(r1, xy(709,313), 48.7).
fillpoint(r1, xy(233,314), 47.8).
fillpoint(r1, xy(277,314), 47.8).
fillpoint(r1, xy(694,314), 47.8).
fillpoint(r1, xy(704,314), 47.8).
fillpoint(r1, xy(237,315), 46.8).
fillpoint(r1, xy(272,315), 46.8).
fillpoint(r1, xy(699,315), 46.8).
fillpoint(r1, xy(478,211), 46.3).
fillpoint(r1, xy(519,48), 46.1).
fillpoint(r1, xy(505,92), 46.0).
fillpoint(r1, xy(242,316), 45.8).
fillpoint(r1, xy(267,316), 45.8).
fillpoint(r1, xy(417,60), 45.7).
fillpoint(r1, xy(416,62), 45.7).
fillpoint(r1, xy(414,67), 45.7).
fillpoint(r1, xy(413,69), 45.7).
fillpoint(r1, xy(411,74), 45.7).
fillpoint(r1, xy(410,76), 45.7).
fillpoint(r1, xy(475,210), 45.7).
fillpoint(r1, xy(415,65), 45.6).
fillpoint(r1, xy(412,71), 45.6).
fillpoint(r1, xy(518,54), 45.2).
fillpoint(r1, xy(519,52), 45.1).
fillpoint(r1, xy(471,209), 45.1).
fillpoint(r1, xy(247,317), 44.9).
fillpoint(r1, xy(263,317), 44.9).
fillpoint(r1, xy(655,272), 44.4).
fillpoint(r1, xy(656,274), 44.4).
fillpoint(r1, xy(658,279), 44.4).
fillpoint(r1, xy(659,281), 44.4).
fillpoint(r1, xy(299,259), 44.3).
fillpoint(r1, xy(653,267), 44.3).
fillpoint(r1, xy(654,270), 44.3).
fillpoint(r1, xy(657,276), 44.3).
fillpoint(r1, xy(660,283), 44.3).
fillpoint(r1, xy(661,286), 44.3).
fillpoint(r1, xy(251,318), 43.9).
fillpoint(r1, xy(258,318), 43.9).
fillpoint(r1, xy(526,122), 43.8).
fillpoint(r1, xy(528,123), 43.8).
fillpoint(r1, xy(535,126), 43.8).
fillpoint(r1, xy(517,60), 43.7).
fillpoint(r1, xy(516,62), 43.7).
fillpoint(r1, xy(513,69), 43.7).
fillpoint(r1, xy(510,76), 43.7).
fillpoint(r1, xy(507,83), 43.7).
fillpoint(r1, xy(506,85), 43.7).
fillpoint(r1, xy(521,120), 43.7).
fillpoint(r1, xy(524,121), 43.7).
fillpoint(r1, xy(530,124), 43.7).
fillpoint(r1, xy(533,125), 43.7).
fillpoint(r1, xy(515,64), 43.6).
fillpoint(r1, xy(514,67), 43.6).
fillpoint(r1, xy(512,71), 43.6).
fillpoint(r1, xy(511,74), 43.6).
fillpoint(r1, xy(509,78), 43.6).
fillpoint(r1, xy(508,81), 43.6).
fillpoint(r1, xy(372,250), 43.0).
fillpoint(r1, xy(374,251), 43.0).
fillpoint(r1, xy(379,253), 43.0).
fillpoint(r1, xy(381,254), 43.0).
fillpoint(r1, xy(585,319), 43.0).
fillpoint(r1, xy(645,319), 43.0).
fillpoint(r1, xy(377,252), 42.8).
fillpoint(r1, xy(419,47), 42.3).
fillpoint(r1, xy(420,45), 42.2).
fillpoint(r1, xy(418,49), 42.2).
fillpoint(r1, xy(589,320), 42.0).
fillpoint(r1, xy(641,320), 42.0).
fillpoint(r1, xy(443,209), 41.5).
fillpoint(r1, xy(298,268), 41.5).
fillpoint(r1, xy(297,270), 41.4).
fillpoint(r1, xy(304,321), 41.1).
fillpoint(r1, xy(594,321), 41.1).
fillpoint(r1, xy(637,321), 41.1).
fillpoint(r1, xy(295,278), 40.3).
fillpoint(r1, xy(292,285), 40.3).
fillpoint(r1, xy(296,276), 40.2).
fillpoint(r1, xy(291,287), 40.2).
fillpoint(r1, xy(294,280), 40.1).
fillpoint(r1, xy(293,283), 40.1).
fillpoint(r1, xy(308,322), 40.1).
fillpoint(r1, xy(598,322), 40.1).
fillpoint(r1, xy(632,322), 40.1).
fillpoint(r1, xy(455,208), 40.0).
fillpoint(r1, xy(453,207), 39.9).
fillpoint(r1, xy(450,208), 39.6).
fillpoint(r1, xy(490,230), 39.6).
fillpoint(r1, xy(493,237), 39.6).
fillpoint(r1, xy(488,225), 39.5).
fillpoint(r1, xy(489,228), 39.5).
fillpoint(r1, xy(492,235), 39.5).
fillpoint(r1, xy(494,239), 39.5).
fillpoint(r1, xy(491,232), 39.4).
fillpoint(r1, xy(313,323), 39.2).
fillpoint(r1, xy(361,323), 39.2).
fillpoint(r1, xy(603,323), 39.2).
fillpoint(r1, xy(627,323), 39.2).
fillpoint(r1, xy(356,324), 38.2).
fillpoint(r1, xy(608,324), 38.2).
fillpoint(r1, xy(623,324), 38.2).
fillpoint(r1, xy(496,248), 37.9).
fillpoint(r1, xy(347,324), 37.9).
fillpoint(r1, xy(495,246), 37.8).
fillpoint(r1, xy(497,250), 37.8).
fillpoint(r1, xy(564,122), 37.2).
fillpoint(r1, xy(343,325), 37.2).
fillpoint(r1, xy(351,325), 37.2).
fillpoint(r1, xy(612,325), 37.2).
fillpoint(r1, xy(618,325), 37.2).
fillpoint(r1, xy(556,124), 37.0).
fillpoint(r1, xy(558,123), 36.9).
fillpoint(r1, xy(554,125), 36.9).
fillpoint(r1, xy(429,130), 36.8).
fillpoint(r1, xy(436,133), 36.8).
fillpoint(r1, xy(427,129), 36.7).
fillpoint(r1, xy(431,131), 36.7).
fillpoint(r1, xy(434,132), 36.6).
fillpoint(r1, xy(587,37), 36.3).
fillpoint(r1, xy(338,326), 36.3).
fillpoint(r1, xy(376,313), 36.1).
fillpoint(r1, xy(369,316), 36.1).
fillpoint(r1, xy(374,314), 36.0).
fillpoint(r1, xy(371,315), 36.0).
fillpoint(r1, xy(460,289), 35.7).
fillpoint(r1, xy(540,36), 35.3).
fillpoint(r1, xy(583,36), 35.3).
fillpoint(r1, xy(326,324), 34.8).
fillpoint(r1, xy(331,326), 34.8).
fillpoint(r1, xy(329,325), 34.7).
fillpoint(r1, xy(544,35), 34.4).
fillpoint(r1, xy(578,35), 34.4).
fillpoint(r1, xy(549,34), 33.4).
fillpoint(r1, xy(573,34), 33.4).
fillpoint(r1, xy(473,127), 33.1).
fillpoint(r1, xy(475,126), 33.0).
fillpoint(r1, xy(468,129), 33.0).
fillpoint(r1, xy(466,130), 33.0).
fillpoint(r1, xy(471,128), 32.9).
fillpoint(r1, xy(464,131), 32.9).
fillpoint(r1, xy(461,132), 32.9).
border(r1).
region(r192, '#c5aa86', 16, centroid(268,143)).
perimeter(r192, 18).
polygon(r192, [xy(266,142),xy(266,144),xy(271,143),xy(266,142)]).
midline(r192, [xy(268,143),xy(267,143)]).
fillpoint(r192, xy(268,143), 1.9).
region(r166, '#dabc96', 4, centroid(456,94)).
perimeter(r166, 8).

adjacent(r1, r166).
shared_edge(r1, r166, 8).
adjacent(r1, r192).
shared_edge(r1, r192, 18).

encloses(r1, r166).
encloses(r1, r192).

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
opencv_component(cc1, [r166]).
opencv_component_area(cc1, 4).
opencv_component_centroid(cc1, centroid(456,94)).
opencv_component(cc2, [r192]).
opencv_component_area(cc2, 16).
opencv_component_centroid(cc2, centroid(268,143)).
opencv_morphology(r1, opening_area(310163), closing_area(312872), gradient_area(6067)).
opencv_shape_metrics(r1, contour_area(309506.5), hull_area(309639.0), solidity(0.999572), circularity(0.643726), extent(0.995659), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309506.5).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 10.5).
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
opencv_contour(r1, c10, hole, 4.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 2.0).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 4.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 14.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 6.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 25.5).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 42.5).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 14.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 4.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 40.5).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 6.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 2.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 52.5).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 4.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 2.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 2.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 7.5).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 42.5).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 5.5).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 7.5).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 7.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 4.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 2.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 2.0).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 6.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 2.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 4.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 2.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 4.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 4.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 23.5).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 5.5).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 2.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 4.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 4.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 4.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 2.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 2.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 2.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 8.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 4.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 23.5).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 5.5).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 2.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 2.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 7.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 10.0).
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
opencv_contour(r1, c67, hole, 4.0).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 2.0).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 2.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 2.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 7.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 14.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 4.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 2.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 15.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 2.0).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 2.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 2.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 12.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 4.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 4.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 7.5).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 44.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 2.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 2.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 4.0).
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
opencv_contour(r1, c93, hole, 5.5).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 4.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 4.0).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 4.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 2.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 164.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 2.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 4.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 4.0).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 10.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 5.5).
opencv_contour_hierarchy(r1, c103, next(none), previous(c102), child(none), parent(c0)).
opencv_morphology(r192, opening_area(11), closing_area(23), gradient_area(30)).
opencv_shape_metrics(r192, contour_area(8.5), hull_area(9.0), solidity(0.944444), circularity(0.593606), extent(0.472222), aspect_ratio(2.0)).
opencv_contour(r192, c0, outer, 8.5).
opencv_contour_hierarchy(r192, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r166, 1).
opencv_watershed_segment(r166, ws1, 4, centroid(456,93)).
opencv_watershed_count(r192, 1).
opencv_watershed_segment(r192, ws1, 4, centroid(268,143)).
