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

region(r1, '#1f1009', 310088, centroid(427,182)).
perimeter(r1, 3796).
polygon(r1, [xy(0,0),xy(0,363),xy(141,363),xy(146,357),xy(148,360),xy(145,363),xy(853,363),xy(853,0),xy(359,0),xy(354,4),xy(352,0),xy(0,0)]).
hole(r1, [xy(147,357),xy(148,355),xy(150,356),xy(147,357)]).
hole(r1, [xy(149,355),xy(150,353),xy(152,354),xy(149,355)]).
hole(r1, [xy(151,353),xy(153,353),xy(151,353)]).
hole(r1, [xy(152,352),xy(154,352),xy(152,352)]).
hole(r1, [xy(155,349),xy(156,351),xy(154,352),xy(155,349)]).
hole(r1, [xy(157,347),xy(158,349),xy(156,350),xy(157,347)]).
hole(r1, [xy(157,347),xy(160,347),xy(157,347)]).
hole(r1, [xy(160,345),xy(162,345),xy(160,345)]).
hole(r1, [xy(162,343),xy(164,343),xy(162,343)]).
hole(r1, [xy(164,341),xy(166,341),xy(164,341)]).
hole(r1, [xy(166,339),xy(168,339),xy(166,339)]).
hole(r1, [xy(168,337),xy(170,337),xy(168,337)]).
hole(r1, [xy(170,335),xy(172,335),xy(170,335)]).
hole(r1, [xy(172,333),xy(174,333),xy(172,333)]).
hole(r1, [xy(174,331),xy(176,331),xy(174,331)]).
hole(r1, [xy(176,329),xy(178,329),xy(176,329)]).
hole(r1, [xy(177,328),xy(179,328),xy(177,328)]).
hole(r1, [xy(178,327),xy(180,327),xy(178,327)]).
hole(r1, [xy(179,326),xy(181,326),xy(179,326)]).
hole(r1, [xy(180,325),xy(182,325),xy(180,325)]).
hole(r1, [xy(182,323),xy(184,323),xy(182,323)]).
hole(r1, [xy(184,321),xy(186,321),xy(184,321)]).
hole(r1, [xy(185,320),xy(187,320),xy(185,320)]).
hole(r1, [xy(186,319),xy(188,319),xy(186,319)]).
hole(r1, [xy(188,317),xy(190,317),xy(188,317)]).
hole(r1, [xy(190,315),xy(192,315),xy(190,315)]).
hole(r1, [xy(192,313),xy(194,313),xy(192,313)]).
hole(r1, [xy(194,311),xy(196,311),xy(194,311)]).
hole(r1, [xy(196,309),xy(198,309),xy(196,309)]).
hole(r1, [xy(198,307),xy(200,307),xy(198,307)]).
hole(r1, [xy(200,305),xy(202,305),xy(200,305)]).
hole(r1, [xy(201,303),xy(203,303),xy(201,303)]).
hole(r1, [xy(202,302),xy(204,302),xy(202,302)]).
hole(r1, [xy(203,301),xy(205,301),xy(203,301)]).
hole(r1, [xy(204,300),xy(206,300),xy(204,300)]).
hole(r1, [xy(205,299),xy(206,297),xy(208,298),xy(205,299)]).
hole(r1, [xy(207,297),xy(208,295),xy(210,296),xy(207,297)]).
hole(r1, [xy(209,294),xy(211,293),xy(212,295),xy(210,296),xy(209,294)]).
hole(r1, [xy(213,290),xy(214,293),xy(212,294),xy(213,290)]).
hole(r1, [xy(213,290),xy(215,290),xy(213,290)]).
hole(r1, [xy(214,289),xy(216,289),xy(214,289)]).
hole(r1, [xy(215,288),xy(217,288),xy(215,288)]).
hole(r1, [xy(216,287),xy(218,287),xy(216,287)]).
hole(r1, [xy(217,285),xy(219,285),xy(217,285)]).
hole(r1, [xy(218,284),xy(220,284),xy(218,284)]).
hole(r1, [xy(219,282),xy(221,281),xy(222,283),xy(220,284),xy(219,282)]).
hole(r1, [xy(221,280),xy(223,280),xy(221,280)]).
hole(r1, [xy(222,279),xy(224,279),xy(222,279)]).
hole(r1, [xy(224,276),xy(226,277),xy(224,276)]).
hole(r1, [xy(232,274),xy(235,274),xy(232,274)]).
hole(r1, [xy(225,274),xy(227,274),xy(225,274)]).
hole(r1, [xy(226,273),xy(228,273),xy(226,273)]).
hole(r1, [xy(228,270),xy(230,270),xy(228,270)]).
hole(r1, [xy(231,267),xy(232,269),xy(230,270),xy(231,267)]).
hole(r1, [xy(240,267),xy(242,267),xy(240,267)]).
hole(r1, [xy(231,267),xy(233,267),xy(231,267)]).
hole(r1, [xy(232,266),xy(234,266),xy(232,266)]).
hole(r1, [xy(233,265),xy(236,265),xy(233,265)]).
hole(r1, [xy(235,263),xy(237,263),xy(235,263)]).
hole(r1, [xy(236,262),xy(238,262),xy(236,262)]).
hole(r1, [xy(237,260),xy(239,259),xy(240,261),xy(238,262),xy(237,260)]).
hole(r1, [xy(239,258),xy(241,258),xy(239,258)]).
hole(r1, [xy(241,256),xy(243,256),xy(241,256)]).
hole(r1, [xy(243,255),xy(244,253),xy(246,254),xy(243,255)]).
hole(r1, [xy(247,251),xy(248,253),xy(246,254),xy(247,251)]).
hole(r1, [xy(248,251),xy(250,251),xy(248,251)]).
hole(r1, [xy(250,249),xy(252,249),xy(250,249)]).
hole(r1, [xy(251,248),xy(253,248),xy(251,248)]).
hole(r1, [xy(253,246),xy(255,246),xy(253,246)]).
hole(r1, [xy(256,244),xy(258,244),xy(256,244)]).
hole(r1, [xy(257,243),xy(259,243),xy(257,243)]).
hole(r1, [xy(260,241),xy(262,241),xy(260,241)]).
hole(r1, [xy(261,240),xy(263,240),xy(261,240)]).
hole(r1, [xy(263,238),xy(265,238),xy(263,238)]).
hole(r1, [xy(265,237),xy(267,237),xy(265,237)]).
hole(r1, [xy(268,235),xy(270,235),xy(268,235)]).
hole(r1, [xy(269,234),xy(271,234),xy(269,234)]).
hole(r1, [xy(272,232),xy(274,232),xy(272,232)]).
hole(r1, [xy(281,226),xy(284,226),xy(281,226)]).
hole(r1, [xy(459,224),xy(462,224),xy(459,224)]).
hole(r1, [xy(285,224),xy(287,224),xy(285,224)]).
hole(r1, [xy(457,223),xy(460,223),xy(457,223)]).
hole(r1, [xy(287,223),xy(290,223),xy(287,223)]).
hole(r1, [xy(455,222),xy(458,222),xy(455,222)]).
hole(r1, [xy(450,218),xy(453,217),xy(456,221),xy(454,222),xy(450,218)]).
hole(r1, [xy(448,216),xy(450,215),xy(451,217),xy(448,216)]).
hole(r1, [xy(447,215),xy(449,215),xy(447,215)]).
hole(r1, [xy(446,214),xy(448,214),xy(446,214)]).
hole(r1, [xy(445,213),xy(447,213),xy(445,213)]).
hole(r1, [xy(444,212),xy(446,212),xy(444,212)]).
hole(r1, [xy(441,210),xy(445,211),xy(441,210)]).
hole(r1, [xy(396,210),xy(398,210),xy(396,210)]).
hole(r1, [xy(439,208),xy(441,207),xy(442,209),xy(439,208)]).
hole(r1, [xy(394,208),xy(396,208),xy(394,208)]).
hole(r1, [xy(438,207),xy(440,207),xy(438,207)]).
hole(r1, [xy(393,207),xy(395,207),xy(393,207)]).
hole(r1, [xy(437,206),xy(439,206),xy(437,206)]).
hole(r1, [xy(392,206),xy(394,206),xy(392,206)]).
hole(r1, [xy(391,205),xy(393,205),xy(391,205)]).
hole(r1, [xy(435,204),xy(438,205),xy(436,206),xy(435,204)]).
hole(r1, [xy(390,204),xy(392,204),xy(390,204)]).
hole(r1, [xy(434,203),xy(436,203),xy(434,203)]).
hole(r1, [xy(389,203),xy(391,203),xy(389,203)]).
hole(r1, [xy(388,202),xy(390,202),xy(388,202)]).
hole(r1, [xy(386,199),xy(388,200),xy(386,199)]).
hole(r1, [xy(385,198),xy(387,198),xy(385,198)]).
hole(r1, [xy(381,198),xy(383,199),xy(381,198)]).
hole(r1, [xy(381,193),xy(381,198),xy(381,193)]).
hole(r1, [xy(384,193),xy(386,194),xy(384,193)]).
hole(r1, [xy(427,191),xy(424,195),xy(393,195),xy(394,192),xy(413,189),xy(427,191)]).
hole(r1, [xy(380,188),xy(380,194),xy(380,188)]).
hole(r1, [xy(546,188),xy(548,188),xy(546,188)]).
hole(r1, [xy(528,188),xy(530,187),xy(531,189),xy(529,190),xy(528,188)]).
hole(r1, [xy(518,188),xy(520,189),xy(518,188)]).
hole(r1, [xy(378,184),xy(379,189),xy(377,187),xy(378,184)]).
hole(r1, [xy(377,181),xy(377,185),xy(377,181)]).
hole(r1, [xy(375,180),xy(377,181),xy(375,180)]).
hole(r1, [xy(372,162),xy(374,163),xy(373,169),xy(370,166),xy(372,162)]).
hole(r1, [xy(367,150),xy(369,158),xy(366,156),xy(367,150)]).
hole(r1, [xy(367,149),xy(369,149),xy(367,149)]).
hole(r1, [xy(368,148),xy(370,148),xy(368,148)]).
hole(r1, [xy(359,83),xy(361,83),xy(359,83)]).
hole(r1, [xy(358,82),xy(360,82),xy(358,82)]).
hole(r1, [xy(352,82),xy(354,82),xy(352,82)]).
hole(r1, [xy(357,81),xy(359,81),xy(357,81)]).
hole(r1, [xy(345,81),xy(347,81),xy(345,81)]).
hole(r1, [xy(356,80),xy(358,80),xy(356,80)]).
hole(r1, [xy(355,79),xy(357,79),xy(355,79)]).
hole(r1, [xy(354,78),xy(356,78),xy(354,78)]).
hole(r1, [xy(344,78),xy(346,79),xy(344,78)]).
hole(r1, [xy(353,77),xy(355,77),xy(353,77)]).
hole(r1, [xy(549,75),xy(551,75),xy(549,75)]).
hole(r1, [xy(547,74),xy(549,74),xy(547,74)]).
hole(r1, [xy(442,72),xy(446,76),xy(445,80),xy(440,75),xy(442,72)]).
hole(r1, [xy(352,72),xy(354,75),xy(351,81),xy(349,76),xy(352,72)]).
hole(r1, [xy(341,72),xy(344,71),xy(345,74),xy(341,72)]).
hole(r1, [xy(349,71),xy(352,71),xy(349,71)]).
hole(r1, [xy(409,67),xy(411,69),xy(408,74),xy(408,80),xy(405,77),xy(405,71),xy(409,67)]).
hole(r1, [xy(566,67),xy(568,67),xy(566,67)]).
hole(r1, [xy(408,66),xy(410,66),xy(408,66)]).
hole(r1, [xy(560,63),xy(562,63),xy(560,63)]).
hole(r1, [xy(558,62),xy(560,62),xy(558,62)]).
hole(r1, [xy(548,60),xy(552,62),xy(551,74),xy(548,73),xy(548,60)]).
hole(r1, [xy(545,61),xy(547,61),xy(545,61)]).
hole(r1, [xy(555,60),xy(557,60),xy(555,60)]).
hole(r1, [xy(553,59),xy(555,59),xy(553,59)]).
hole(r1, [xy(541,59),xy(543,59),xy(541,59)]).
hole(r1, [xy(344,55),xy(347,58),xy(347,64),xy(344,62),xy(344,55)]).
hole(r1, [xy(341,55),xy(343,55),xy(341,55)]).
hole(r1, [xy(342,54),xy(344,54),xy(342,54)]).
hole(r1, [xy(340,53),xy(342,63),xy(340,72),xy(334,61),xy(336,60),xy(335,56),xy(340,53)]).
hole(r1, [xy(334,54),xy(336,55),xy(334,54)]).
hole(r1, [xy(343,53),xy(345,53),xy(343,53)]).
hole(r1, [xy(344,52),xy(347,52),xy(344,52)]).
hole(r1, [xy(351,51),xy(353,51),xy(351,51)]).
hole(r1, [xy(329,42),xy(331,42),xy(329,42)]).
hole(r1, [xy(333,38),xy(340,43),xy(337,46),xy(337,53),xy(335,48),xy(334,52),xy(331,49),xy(332,42),xy(330,41),xy(333,38)]).
hole(r1, [xy(346,37),xy(347,42),xy(345,43),xy(346,37)]).
hole(r1, [xy(337,31),xy(339,31),xy(337,31)]).
hole(r1, [xy(347,30),xy(349,30),xy(347,30)]).
hole(r1, [xy(338,29),xy(340,29),xy(338,29)]).
hole(r1, [xy(583,25),xy(585,25),xy(583,25)]).
hole(r1, [xy(580,25),xy(582,25),xy(580,25)]).
hole(r1, [xy(638,24),xy(640,24),xy(638,24)]).
hole(r1, [xy(581,24),xy(583,24),xy(581,24)]).
hole(r1, [xy(637,23),xy(639,23),xy(637,23)]).
hole(r1, [xy(585,21),xy(587,21),xy(585,21)]).
hole(r1, [xy(584,19),xy(585,24),xy(582,23),xy(584,19)]).
hole(r1, [xy(584,18),xy(586,19),xy(584,18)]).
hole(r1, [xy(343,17),xy(344,19),xy(338,23),xy(337,31),xy(334,28),xy(334,20),xy(337,16),xy(343,17)]).
hole(r1, [xy(648,16),xy(650,16),xy(648,16)]).
hole(r1, [xy(599,15),xy(601,15),xy(599,15)]).
hole(r1, [xy(598,13),xy(600,13),xy(598,13)]).
hole(r1, [xy(340,13),xy(342,13),xy(340,13)]).
hole(r1, [xy(597,12),xy(599,12),xy(597,12)]).
hole(r1, [xy(601,11),xy(603,11),xy(601,11)]).
hole(r1, [xy(596,11),xy(598,11),xy(596,11)]).
hole(r1, [xy(600,10),xy(602,10),xy(600,10)]).
hole(r1, [xy(588,10),xy(590,10),xy(588,10)]).
hole(r1, [xy(583,10),xy(585,11),xy(583,10)]).
hole(r1, [xy(345,9),xy(346,11),xy(342,13),xy(345,9)]).
hole(r1, [xy(599,9),xy(601,9),xy(599,9)]).
hole(r1, [xy(352,9),xy(353,7),xy(355,8),xy(352,9)]).
hole(r1, [xy(345,9),xy(346,7),xy(348,8),xy(345,9)]).
hole(r1, [xy(354,7),xy(356,7),xy(354,7)]).
hole(r1, [xy(375,6),xy(377,6),xy(375,6)]).
midline(r1, [xy(72,288),xy(79,266),xy(102,243),xy(102,195),xy(109,181),xy(109,172),xy(115,160),xy(115,152),xy(117,151),xy(122,130),xy(127,126),xy(156,125),xy(245,216),xy(245,253),xy(300,308),xy(293,309),xy(122,138)]).
midline(r1, [xy(106,188),xy(246,328),xy(243,329),xy(105,191)]).
midline(r1, [xy(300,309),xy(315,294),xy(265,244),xy(263,239),xy(261,239),xy(253,245),xy(248,250),xy(249,252),xy(251,248)]).
midline(r1, [xy(257,243),xy(252,250)]).
midline(r1, [xy(261,240),xy(258,245)]).
midline(r1, [xy(109,182),xy(215,286),xy(213,290),xy(218,283),xy(218,284),xy(219,283),xy(220,284),xy(218,286),xy(217,286),xy(218,287),xy(214,291),xy(218,288),xy(253,323),xy(246,329)]).
midline(r1, [xy(75,281),xy(153,359),xy(150,360),xy(74,284)]).
midline(r1, [xy(249,328),xy(254,323),xy(262,323),xy(264,320),xy(223,280),xy(113,170)]).
midline(r1, [xy(119,147),xy(235,264),xy(237,263),xy(236,262),xy(237,261),xy(238,262),xy(237,264),xy(240,268),xy(236,269),xy(233,267),xy(118,151)]).
midline(r1, [xy(240,269),xy(242,267),xy(241,266),xy(242,266)]).
midline(r1, [xy(242,268),xy(285,312),xy(278,319),xy(270,319),xy(227,275)]).
midline(r1, [xy(280,318),xy(286,312),xy(293,310)]).
midline(r1, [xy(229,274),xy(115,161)]).
midline(r1, [xy(149,361),xy(150,361)]).
midline(r1, [xy(262,242),xy(264,239),xy(263,238),xy(263,233),xy(246,216)]).
midline(r1, [xy(78,272),xy(162,356),xy(157,357),xy(78,277)]).
midline(r1, [xy(224,281),xy(222,281),xy(221,280),xy(222,278),xy(224,279)]).
midline(r1, [xy(335,48),xy(335,52),xy(331,53),xy(249,136),xy(245,136),xy(220,111),xy(170,112),xy(157,125),xy(168,114)]).
midline(r1, [xy(176,112),xy(285,222),xy(285,225),xy(286,225),xy(287,224),xy(286,223),xy(287,223)]).
midline(r1, [xy(287,225),xy(353,293),xy(351,295),xy(315,296)]).
midline(r1, [xy(353,294),xy(360,293),xy(365,288),xy(365,281),xy(362,278),xy(362,272),xy(335,245),xy(333,212),xy(330,209),xy(328,184),xy(295,151),xy(273,151),xy(269,147),xy(259,145),xy(250,137),xy(330,56),xy(335,56),xy(336,55),xy(335,53),xy(340,52),xy(343,47),xy(340,34),xy(337,31),xy(337,34),xy(331,34),xy(315,19),xy(310,20),xy(220,110),xy(288,43)]).
midline(r1, [xy(366,287),xy(374,286),xy(376,290),xy(379,289),xy(381,292),xy(391,291),xy(392,294),xy(532,293),xy(548,276),xy(490,218),xy(490,195),xy(487,192),xy(459,221),xy(456,220),xy(455,222),xy(456,226),xy(392,291),xy(455,228)]).
midline(r1, [xy(461,218),xy(486,193)]).
midline(r1, [xy(291,40),xy(310,21)]).
midline(r1, [xy(458,221),xy(457,223),xy(457,225),xy(459,225)]).
midline(r1, [xy(340,33),xy(338,28),xy(340,28),xy(340,31),xy(347,29),xy(347,31),xy(348,31),xy(349,30),xy(348,29),xy(352,29),xy(356,25),xy(346,15),xy(338,13),xy(333,8),xy(323,10),xy(315,18),xy(323,11)]).
midline(r1, [xy(340,12),xy(342,13)]).
midline(r1, [xy(356,26),xy(360,24),xy(340,4),xy(336,6)]).
midline(r1, [xy(341,4),xy(348,3),xy(350,5),xy(350,13)]).
midline(r1, [xy(487,191),xy(484,183),xy(380,289),xy(450,219)]).
midline(r1, [xy(452,216),xy(484,184)]).
midline(r1, [xy(524,251),xy(524,131),xy(503,130),xy(497,121),xy(496,50),xy(480,36),xy(393,34),xy(376,17),xy(375,5),xy(377,5),xy(377,7)]).
midline(r1, [xy(409,35),xy(408,67),xy(409,67),xy(410,65)]).
midline(r1, [xy(524,130),xy(588,130),xy(645,187),xy(546,187),xy(546,189),xy(548,189)]).
midline(r1, [xy(645,188),xy(675,218),xy(617,276),xy(548,277)]).
midline(r1, [xy(618,276),xy(676,218),xy(696,218),xy(701,214),xy(702,172),xy(579,48),xy(576,48),xy(569,41),xy(562,41),xy(551,30),xy(520,30),xy(512,34),xy(497,50),xy(512,35)]).
midline(r1, [xy(596,67),xy(566,66),xy(566,68),xy(568,68)]).
midline(r1, [xy(581,49),xy(582,27),xy(580,25),xy(580,24),xy(582,23),xy(583,24),xy(582,26),xy(584,26),xy(585,25),xy(584,24),xy(585,24)]).
midline(r1, [xy(344,47),xy(368,48),xy(365,51),xy(351,50),xy(351,54),xy(346,54),xy(344,52),xy(341,51),xy(341,57),xy(343,55),xy(342,54),xy(343,53),xy(344,54),xy(343,56)]).
midline(r1, [xy(342,58),xy(345,67),xy(341,70),xy(339,76),xy(269,146),xy(339,77),xy(347,75),xy(347,68),xy(343,70)]).
midline(r1, [xy(347,76),xy(345,80),xy(345,114),xy(329,116),xy(295,150),xy(329,117)]).
midline(r1, [xy(347,67),xy(352,66),xy(368,49)]).
midline(r1, [xy(341,74),xy(340,75)]).
midline(r1, [xy(353,51),xy(353,52)]).
midline(r1, [xy(348,72),xy(354,72),xy(377,49),xy(378,42),xy(376,40),xy(369,47),xy(376,41)]).
midline(r1, [xy(484,182),xy(481,178),xy(447,212),xy(445,211),xy(444,212),xy(445,215),xy(375,286),xy(446,215),xy(447,213),xy(446,212)]).
midline(r1, [xy(481,177),xy(481,172),xy(479,171),xy(367,285),xy(441,211)]).
midline(r1, [xy(480,170),xy(477,167),xy(437,206),xy(365,280),xy(439,208)]).
midline(r1, [xy(441,204),xy(477,168)]).
midline(r1, [xy(443,208),xy(479,172)]).
midline(r1, [xy(481,179),xy(448,212),xy(447,216),xy(448,216),xy(449,215),xy(449,214)]).
midline(r1, [xy(478,166),xy(472,158),xy(409,221),xy(398,211)]).
midline(r1, [xy(435,196),xy(472,159)]).
midline(r1, [xy(433,200),xy(434,204),xy(435,204),xy(436,202)]).
midline(r1, [xy(390,201),xy(392,200),xy(389,196),xy(383,196),xy(381,198),xy(371,197),xy(336,233),xy(371,198)]).
midline(r1, [xy(390,196),xy(388,185),xy(384,188),xy(380,188),xy(379,189),xy(377,189),xy(371,196),xy(380,194),xy(384,190)]).
midline(r1, [xy(383,193),xy(383,195)]).
midline(r1, [xy(392,202),xy(396,207)]).
midline(r1, [xy(389,185),xy(390,182)]).
midline(r1, [xy(377,190),xy(375,192)]).
midline(r1, [xy(387,198),xy(386,199),xy(384,199),xy(384,250),xy(363,272),xy(409,227),xy(409,222),xy(423,208)]).
midline(r1, [xy(387,186),xy(385,188)]).
midline(r1, [xy(428,202),xy(425,205)]).
midline(r1, [xy(472,157),xy(472,144),xy(469,134),xy(430,133),xy(405,116),xy(345,116)]).
midline(r1, [xy(425,128),xy(426,57),xy(447,37)]).
midline(r1, [xy(370,117),xy(370,146),xy(368,148)]).
midline(r1, [xy(369,150),xy(370,147)]).
midline(r1, [xy(470,134),xy(499,134),xy(503,131)]).
midline(r1, [xy(377,114),xy(376,101),xy(361,84)]).
midline(r1, [xy(353,78),xy(355,80),xy(352,81),xy(352,83),xy(354,83)]).
midline(r1, [xy(355,81),xy(359,84)]).
midline(r1, [xy(351,5),xy(356,6),xy(355,8),xy(360,7),xy(387,34),xy(383,39),xy(376,39),xy(360,25)]).
midline(r1, [xy(385,38),xy(392,34)]).
midline(r1, [xy(460,221),xy(460,223)]).
midline(r1, [xy(104,194),xy(240,330),xy(191,331),xy(182,323),xy(160,344),xy(160,346),xy(161,346),xy(178,329),xy(177,328),xy(180,325),xy(181,326),xy(178,330)]).
midline(r1, [xy(240,331),xy(243,330)]).
midline(r1, [xy(182,324),xy(180,328)]).
midline(r1, [xy(347,80),xy(347,82)]).
midline(r1, [xy(219,286),xy(220,285)]).
midline(r1, [xy(162,357),xy(165,355),xy(79,269)]).
midline(r1, [xy(165,356),xy(191,332)]).
midline(r1, [xy(518,32),xy(516,34),xy(541,60),xy(542,60),xy(543,59),xy(542,58),xy(543,58)]).
midline(r1, [xy(543,60),xy(545,62),xy(546,62),xy(547,61),xy(546,60),xy(547,60)]).
midline(r1, [xy(234,266),xy(233,265),xy(232,265),xy(231,267),xy(235,269),xy(231,272),xy(228,270),xy(228,269),xy(229,269),xy(230,270)]).
midline(r1, [xy(228,272),xy(228,271)]).
midline(r1, [xy(235,270),xy(234,271)]).
midline(r1, [xy(264,321),xy(269,320)]).
midline(r1, [xy(102,244),xy(180,321),xy(183,322),xy(205,299),xy(206,300),xy(202,305),xy(184,323)]).
midline(r1, [xy(203,304),xy(206,301)]).
midline(r1, [xy(186,322),xy(188,320)]).
midline(r1, [xy(290,42),xy(329,41),xy(329,43),xy(330,43),xy(331,42),xy(330,41)]).
midline(r1, [xy(153,360),xy(157,358)]).
midline(r1, [xy(397,157),xy(379,174),xy(368,175),xy(334,211),xy(361,185),xy(377,185),xy(380,183),xy(380,184),xy(380,181),xy(377,181),xy(376,182),xy(363,182),xy(362,183)]).
midline(r1, [xy(380,174),xy(396,158)]).
midline(r1, [xy(368,176),xy(364,180)]).
midline(r1, [xy(355,173),xy(354,174)]).
midline(r1, [xy(621,36),xy(606,21),xy(588,21),xy(583,19),xy(580,16),xy(565,16),xy(552,30),xy(565,17)]).
midline(r1, [xy(585,21),xy(587,22)]).
midline(r1, [xy(622,37),xy(638,53),xy(639,26),xy(637,24),xy(637,22),xy(639,22),xy(639,23),xy(638,24),xy(639,25),xy(640,23)]).
midline(r1, [xy(639,53),xy(649,62),xy(648,15),xy(650,15),xy(650,17)]).
midline(r1, [xy(649,63),xy(719,134),xy(719,155),xy(703,172),xy(718,157)]).
midline(r1, [xy(606,20),xy(600,14),xy(599,14),xy(590,5),xy(577,5),xy(568,14),xy(577,6)]).
midline(r1, [xy(596,10),xy(598,11),xy(599,8),xy(601,8),xy(601,9),xy(599,12),xy(600,13),xy(602,9),xy(603,12)]).
midline(r1, [xy(594,10),xy(588,9),xy(588,11),xy(590,11)]).
midline(r1, [xy(601,16),xy(600,16),xy(596,12)]).
midline(r1, [xy(597,14),xy(581,16)]).
midline(r1, [xy(379,99),xy(378,100)]).
midline(r1, [xy(379,98),xy(379,48)]).
midline(r1, [xy(571,53),xy(562,62),xy(553,58),xy(553,60),xy(555,59),xy(555,61),xy(562,64)]).
midline(r1, [xy(564,61),xy(576,49)]).
midline(r1, [xy(401,130),xy(371,160),xy(366,161),xy(356,172),xy(366,162)]).
midline(r1, [xy(373,159),xy(410,121)]).
midline(r1, [xy(551,74),xy(547,73),xy(548,77),xy(501,124),xy(547,79)]).
midline(r1, [xy(396,173),xy(391,179),xy(394,177)]).
midline(r1, [xy(395,175),xy(396,174)]).
midline(r1, [xy(388,174),xy(429,133)]).
midline(r1, [xy(423,131),xy(422,132)]).
midline(r1, [xy(418,150),xy(397,172),xy(434,135)]).
midline(r1, [xy(267,236),xy(264,237),xy(265,237),xy(265,239),xy(267,238)]).
midline(r1, [xy(243,255),xy(241,255),xy(239,257),xy(239,259),xy(241,259)]).
midline(r1, [xy(153,351),xy(151,353),xy(153,354),xy(154,352)]).
midline(r1, [xy(243,257),xy(243,256)]).
midline(r1, [xy(269,233),xy(268,236),xy(270,235),xy(269,234),xy(270,233),xy(271,233),xy(270,236)]).
midline(r1, [xy(549,76),xy(551,76)]).
midline(r1, [xy(273,231),xy(272,233),xy(273,233),xy(274,231)]).
fillpoint(r1, xy(694,160), 152.0).
fillpoint(r1, xy(695,162), 151.8).
fillpoint(r1, xy(696,167), 150.9).
fillpoint(r1, xy(697,171), 149.9).
fillpoint(r1, xy(696,207), 149.9).
fillpoint(r1, xy(698,176), 149.0).
fillpoint(r1, xy(698,200), 149.0).
fillpoint(r1, xy(699,181), 148.0).
fillpoint(r1, xy(699,196), 148.0).
fillpoint(r1, xy(700,185), 147.1).
fillpoint(r1, xy(700,191), 147.1).
fillpoint(r1, xy(147,147), 141.3).
fillpoint(r1, xy(154,144), 138.5).
fillpoint(r1, xy(160,142), 136.6).
fillpoint(r1, xy(169,139), 133.7).
fillpoint(r1, xy(139,165), 133.7).
fillpoint(r1, xy(175,137), 131.8).
fillpoint(r1, xy(183,135), 129.9).
fillpoint(r1, xy(134,177), 128.9).
fillpoint(r1, xy(192,132), 127.0).
fillpoint(r1, xy(132,183), 127.0).
fillpoint(r1, xy(195,131), 126.1).
fillpoint(r1, xy(200,130), 125.1).
fillpoint(r1, xy(130,190), 125.1).
fillpoint(r1, xy(205,129), 124.2).
fillpoint(r1, xy(209,128), 123.2).
fillpoint(r1, xy(214,127), 122.2).
fillpoint(r1, xy(218,126), 121.3).
fillpoint(r1, xy(223,125), 120.3).
fillpoint(r1, xy(228,124), 119.4).
fillpoint(r1, xy(124,206), 119.4).
fillpoint(r1, xy(232,123), 118.4).
fillpoint(r1, xy(237,122), 117.5).
fillpoint(r1, xy(118,222), 113.6).
fillpoint(r1, xy(114,232), 109.8).
fillpoint(r1, xy(108,246), 104.1).
fillpoint(r1, xy(107,249), 103.1).
fillpoint(r1, xy(617,261), 98.4).
fillpoint(r1, xy(612,262), 97.4).
fillpoint(r1, xy(608,263), 96.5).
fillpoint(r1, xy(603,264), 95.5).
fillpoint(r1, xy(599,265), 94.5).
fillpoint(r1, xy(594,266), 93.6).
fillpoint(r1, xy(589,267), 92.6).
fillpoint(r1, xy(585,268), 91.7).
fillpoint(r1, xy(580,269), 90.7).
fillpoint(r1, xy(575,270), 89.8).
fillpoint(r1, xy(571,271), 88.8).
fillpoint(r1, xy(566,272), 87.9).
fillpoint(r1, xy(562,273), 86.9).
fillpoint(r1, xy(557,274), 86.0).
fillpoint(r1, xy(540,274), 85.0).
fillpoint(r1, xy(538,275), 85.0).
fillpoint(r1, xy(542,275), 85.0).
fillpoint(r1, xy(552,275), 85.0).
fillpoint(r1, xy(533,276), 84.0).
fillpoint(r1, xy(547,276), 84.0).
fillpoint(r1, xy(527,276), 83.9).
fillpoint(r1, xy(352,277), 82.5).
fillpoint(r1, xy(355,278), 82.1).
fillpoint(r1, xy(360,279), 81.2).
fillpoint(r1, xy(364,280), 80.2).
fillpoint(r1, xy(369,281), 79.3).
fillpoint(r1, xy(343,282), 78.3).
fillpoint(r1, xy(373,282), 78.3).
fillpoint(r1, xy(517,282), 78.3).
fillpoint(r1, xy(378,283), 77.4).
fillpoint(r1, xy(513,283), 77.4).
fillpoint(r1, xy(335,284), 76.4).
fillpoint(r1, xy(383,284), 76.4).
fillpoint(r1, xy(412,284), 76.4).
fillpoint(r1, xy(508,284), 76.4).
fillpoint(r1, xy(330,285), 75.4).
fillpoint(r1, xy(387,285), 75.4).
fillpoint(r1, xy(407,285), 75.4).
fillpoint(r1, xy(418,285), 75.4).
fillpoint(r1, xy(503,285), 75.4).
fillpoint(r1, xy(392,286), 74.5).
fillpoint(r1, xy(402,286), 74.5).
fillpoint(r1, xy(423,286), 74.5).
fillpoint(r1, xy(499,286), 74.5).
fillpoint(r1, xy(325,287), 73.5).
fillpoint(r1, xy(397,287), 73.5).
fillpoint(r1, xy(427,287), 73.5).
fillpoint(r1, xy(494,287), 73.5).
fillpoint(r1, xy(432,288), 72.6).
fillpoint(r1, xy(489,288), 72.6).
fillpoint(r1, xy(436,289), 71.6).
fillpoint(r1, xy(485,289), 71.6).
fillpoint(r1, xy(315,290), 70.7).
fillpoint(r1, xy(441,290), 70.7).
fillpoint(r1, xy(480,290), 70.7).
fillpoint(r1, xy(446,291), 69.7).
fillpoint(r1, xy(476,291), 69.7).
fillpoint(r1, xy(498,125), 68.9).
fillpoint(r1, xy(310,292), 68.8).
fillpoint(r1, xy(450,292), 68.8).
fillpoint(r1, xy(471,292), 68.8).
fillpoint(r1, xy(455,293), 67.8).
fillpoint(r1, xy(466,293), 67.8).
fillpoint(r1, xy(490,130), 67.3).
fillpoint(r1, xy(488,131), 67.3).
fillpoint(r1, xy(483,133), 67.3).
fillpoint(r1, xy(481,134), 67.3).
fillpoint(r1, xy(476,136), 67.3).
fillpoint(r1, xy(474,137), 67.3).
fillpoint(r1, xy(492,129), 67.2).
fillpoint(r1, xy(485,132), 67.2).
fillpoint(r1, xy(479,135), 67.2).
fillpoint(r1, xy(472,138), 67.2).
fillpoint(r1, xy(469,139), 67.2).
fillpoint(r1, xy(304,294), 66.9).
fillpoint(r1, xy(461,294), 66.9).
fillpoint(r1, xy(301,295), 65.9).
fillpoint(r1, xy(294,298), 63.0).
fillpoint(r1, xy(522,126), 60.3).
fillpoint(r1, xy(524,127), 60.3).
fillpoint(r1, xy(520,125), 60.2).
fillpoint(r1, xy(532,128), 58.1).
fillpoint(r1, xy(534,129), 58.0).
fillpoint(r1, xy(537,130), 57.9).
fillpoint(r1, xy(539,131), 57.7).
fillpoint(r1, xy(428,132), 57.2).
fillpoint(r1, xy(435,135), 57.2).
fillpoint(r1, xy(442,138), 57.2).
fillpoint(r1, xy(426,131), 57.1).
fillpoint(r1, xy(433,134), 57.1).
fillpoint(r1, xy(437,136), 57.1).
fillpoint(r1, xy(430,133), 57.0).
fillpoint(r1, xy(440,137), 57.0).
fillpoint(r1, xy(276,308), 53.5).
fillpoint(r1, xy(490,54), 51.7).
fillpoint(r1, xy(327,190), 49.9).
fillpoint(r1, xy(492,64), 49.8).
fillpoint(r1, xy(495,71), 49.8).
fillpoint(r1, xy(326,188), 49.8).
fillpoint(r1, xy(491,62), 49.7).
fillpoint(r1, xy(493,66), 49.7).
fillpoint(r1, xy(494,69), 49.7).
fillpoint(r1, xy(496,73), 49.7).
fillpoint(r1, xy(497,77), 49.7).
fillpoint(r1, xy(328,193), 49.7).
fillpoint(r1, xy(267,312), 49.7).
fillpoint(r1, xy(329,195), 49.5).
fillpoint(r1, xy(332,203), 49.3).
fillpoint(r1, xy(335,210), 49.3).
fillpoint(r1, xy(338,217), 49.3).
fillpoint(r1, xy(331,201), 49.2).
fillpoint(r1, xy(333,205), 49.2).
fillpoint(r1, xy(334,208), 49.2).
fillpoint(r1, xy(336,212), 49.2).
fillpoint(r1, xy(337,215), 49.2).
fillpoint(r1, xy(339,219), 49.2).
fillpoint(r1, xy(330,198), 49.1).
fillpoint(r1, xy(340,222), 49.1).
fillpoint(r1, xy(262,313), 48.7).
fillpoint(r1, xy(258,314), 47.8).
fillpoint(r1, xy(252,317), 44.9).
fillpoint(r1, xy(475,44), 43.0).
fillpoint(r1, xy(470,42), 41.1).
fillpoint(r1, xy(392,115), 41.0).
fillpoint(r1, xy(390,114), 40.9).
fillpoint(r1, xy(394,116), 40.9).
fillpoint(r1, xy(397,117), 40.8).
fillpoint(r1, xy(466,41), 40.1).
fillpoint(r1, xy(461,40), 39.2).
fillpoint(r1, xy(457,39), 38.2).
fillpoint(r1, xy(237,324), 38.2).
border(r1).
region(r242, '#825f42', 4, centroid(530,188)).
perimeter(r242, 8).

adjacent(r1, r242).
shared_edge(r1, r242, 8).

encloses(r1, r242).

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
opencv_component(cc1, [r242]).
opencv_component_area(cc1, 4).
opencv_component_centroid(cc1, centroid(530,188)).
opencv_morphology(r1, opening_area(310027), closing_area(312902), gradient_area(6501)).
opencv_shape_metrics(r1, contour_area(309603.0), hull_area(309639.0), solidity(0.999884), circularity(0.647648), extent(0.995969), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309603.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 5.5).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 5.5).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 2.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 2.0).
opencv_contour_hierarchy(r1, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r1, c5, hole, 5.5).
opencv_contour_hierarchy(r1, c5, next(c6), previous(c4), child(none), parent(c0)).
opencv_contour(r1, c6, hole, 5.5).
opencv_contour_hierarchy(r1, c6, next(c7), previous(c5), child(none), parent(c0)).
opencv_contour(r1, c7, hole, 4.0).
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
opencv_contour(r1, c36, hole, 5.5).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 5.5).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 7.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 8.5).
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
opencv_contour(r1, c46, hole, 7.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 2.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 2.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 4.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 4.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 2.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 5.5).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 2.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 2.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 2.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 4.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 2.0).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 2.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 7.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 2.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 2.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 5.5).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 5.5).
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
opencv_contour(r1, c79, hole, 4.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 4.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 2.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 4.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 4.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 4.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 16.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 5.5).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 2.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 2.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 2.0).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 2.0).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 7.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 2.0).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 5.5).
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
opencv_contour(r1, c100, hole, 5.5).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 2.0).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 2.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 2.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 2.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 4.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 2.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 4.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 8.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 4.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 154.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 10.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 2.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 7.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 4.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 9.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 6.0).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 4.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 22.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 20.5).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 2.0).
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
opencv_contour(r1, c128, hole, 2.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 2.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 4.0).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 2.0).
opencv_contour_hierarchy(r1, c131, next(c132), previous(c130), child(none), parent(c0)).
opencv_contour(r1, c132, hole, 2.0).
opencv_contour_hierarchy(r1, c132, next(c133), previous(c131), child(none), parent(c0)).
opencv_contour(r1, c133, hole, 2.0).
opencv_contour_hierarchy(r1, c133, next(c134), previous(c132), child(none), parent(c0)).
opencv_contour(r1, c134, hole, 27.0).
opencv_contour_hierarchy(r1, c134, next(c135), previous(c133), child(none), parent(c0)).
opencv_contour(r1, c135, hole, 24.0).
opencv_contour_hierarchy(r1, c135, next(c136), previous(c134), child(none), parent(c0)).
opencv_contour(r1, c136, hole, 9.5).
opencv_contour_hierarchy(r1, c136, next(c137), previous(c135), child(none), parent(c0)).
opencv_contour(r1, c137, hole, 4.0).
opencv_contour_hierarchy(r1, c137, next(c138), previous(c136), child(none), parent(c0)).
opencv_contour(r1, c138, hole, 42.5).
opencv_contour_hierarchy(r1, c138, next(c139), previous(c137), child(none), parent(c0)).
opencv_contour(r1, c139, hole, 2.0).
opencv_contour_hierarchy(r1, c139, next(c140), previous(c138), child(none), parent(c0)).
opencv_contour(r1, c140, hole, 2.0).
opencv_contour_hierarchy(r1, c140, next(c141), previous(c139), child(none), parent(c0)).
opencv_contour(r1, c141, hole, 2.0).
opencv_contour_hierarchy(r1, c141, next(c142), previous(c140), child(none), parent(c0)).
opencv_contour(r1, c142, hole, 2.0).
opencv_contour_hierarchy(r1, c142, next(c143), previous(c141), child(none), parent(c0)).
opencv_contour(r1, c143, hole, 47.0).
opencv_contour_hierarchy(r1, c143, next(c144), previous(c142), child(none), parent(c0)).
opencv_contour(r1, c144, hole, 2.0).
opencv_contour_hierarchy(r1, c144, next(c145), previous(c143), child(none), parent(c0)).
opencv_contour(r1, c145, hole, 2.0).
opencv_contour_hierarchy(r1, c145, next(c146), previous(c144), child(none), parent(c0)).
opencv_contour(r1, c146, hole, 2.0).
opencv_contour_hierarchy(r1, c146, next(c147), previous(c145), child(none), parent(c0)).
opencv_contour(r1, c147, hole, 2.0).
opencv_contour_hierarchy(r1, c147, next(c148), previous(c146), child(none), parent(c0)).
opencv_contour(r1, c148, hole, 26.0).
opencv_contour_hierarchy(r1, c148, next(c149), previous(c147), child(none), parent(c0)).
opencv_contour(r1, c149, hole, 2.0).
opencv_contour_hierarchy(r1, c149, next(c150), previous(c148), child(none), parent(c0)).
opencv_contour(r1, c150, hole, 2.0).
opencv_contour_hierarchy(r1, c150, next(c151), previous(c149), child(none), parent(c0)).
opencv_contour(r1, c151, hole, 88.5).
opencv_contour_hierarchy(r1, c151, next(c152), previous(c150), child(none), parent(c0)).
opencv_contour(r1, c152, hole, 4.0).
opencv_contour_hierarchy(r1, c152, next(c153), previous(c151), child(none), parent(c0)).
opencv_contour(r1, c153, hole, 2.0).
opencv_contour_hierarchy(r1, c153, next(c154), previous(c152), child(none), parent(c0)).
opencv_contour(r1, c154, hole, 4.0).
opencv_contour_hierarchy(r1, c154, next(c155), previous(c153), child(none), parent(c0)).
opencv_contour(r1, c155, hole, 2.0).
opencv_contour_hierarchy(r1, c155, next(c156), previous(c154), child(none), parent(c0)).
opencv_contour(r1, c156, hole, 2.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 86.0).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 12.5).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 2.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 2.0).
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
opencv_contour(r1, c168, hole, 13.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 4.0).
opencv_contour_hierarchy(r1, c169, next(c170), previous(c168), child(none), parent(c0)).
opencv_contour(r1, c170, hole, 74.0).
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
opencv_contour(r1, c180, hole, 4.0).
opencv_contour_hierarchy(r1, c180, next(c181), previous(c179), child(none), parent(c0)).
opencv_contour(r1, c181, hole, 12.5).
opencv_contour_hierarchy(r1, c181, next(c182), previous(c180), child(none), parent(c0)).
opencv_contour(r1, c182, hole, 2.0).
opencv_contour_hierarchy(r1, c182, next(c183), previous(c181), child(none), parent(c0)).
opencv_contour(r1, c183, hole, 5.5).
opencv_contour_hierarchy(r1, c183, next(c184), previous(c182), child(none), parent(c0)).
opencv_contour(r1, c184, hole, 5.5).
opencv_contour_hierarchy(r1, c184, next(c185), previous(c183), child(none), parent(c0)).
opencv_contour(r1, c185, hole, 2.0).
opencv_contour_hierarchy(r1, c185, next(c186), previous(c184), child(none), parent(c0)).
opencv_contour(r1, c186, hole, 2.0).
opencv_contour_hierarchy(r1, c186, next(none), previous(c185), child(none), parent(c0)).
opencv_watershed_count(r242, 1).
opencv_watershed_segment(r242, ws1, 4, centroid(529,188)).
