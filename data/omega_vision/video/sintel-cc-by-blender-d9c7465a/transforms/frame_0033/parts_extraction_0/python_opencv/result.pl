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

region(r1, '#6c574c', 310104, centroid(427,181)).
perimeter(r1, 4140).
polygon(r1, [xy(0,0),xy(0,12),xy(16,24),xy(25,25),xy(27,28),xy(35,28),xy(37,30),xy(36,32),xy(34,30),xy(26,30),xy(22,36),xy(23,28),xy(15,26),xy(3,16),xy(0,16),xy(0,363),xy(414,363),xy(415,360),xy(416,363),xy(853,363),xy(853,272),xy(851,274),xy(842,273),xy(850,271),xy(853,267),xy(853,213),xy(851,212),xy(853,211),xy(853,92),xy(850,91),xy(853,90),xy(853,0),xy(385,0),xy(384,2),xy(383,0),xy(340,0),xy(338,5),xy(333,5),xy(331,0),xy(0,0)]).
hole(r1, [xy(210,349),xy(212,350),xy(210,349)]).
hole(r1, [xy(296,348),xy(298,348),xy(296,348)]).
hole(r1, [xy(209,348),xy(211,348),xy(209,348)]).
hole(r1, [xy(298,344),xy(298,348),xy(298,344)]).
hole(r1, [xy(266,345),xy(268,346),xy(266,345)]).
hole(r1, [xy(265,343),xy(267,344),xy(265,343)]).
hole(r1, [xy(160,342),xy(161,345),xy(156,349),xy(156,344),xy(160,342)]).
hole(r1, [xy(264,341),xy(266,342),xy(264,341)]).
hole(r1, [xy(262,338),xy(265,340),xy(262,338)]).
hole(r1, [xy(261,337),xy(263,337),xy(261,337)]).
hole(r1, [xy(206,337),xy(204,341),xy(193,340),xy(188,349),xy(186,349),xy(191,338),xy(206,337)]).
hole(r1, [xy(260,336),xy(262,336),xy(260,336)]).
hole(r1, [xy(206,333),xy(206,337),xy(206,333)]).
hole(r1, [xy(206,332),xy(208,333),xy(206,332)]).
hole(r1, [xy(207,329),xy(209,330),xy(207,329)]).
hole(r1, [xy(209,325),xy(209,329),xy(209,325)]).
hole(r1, [xy(209,324),xy(211,325),xy(209,324)]).
hole(r1, [xy(211,320),xy(211,324),xy(211,320)]).
hole(r1, [xy(211,319),xy(213,320),xy(211,319)]).
hole(r1, [xy(212,317),xy(214,318),xy(212,317)]).
hole(r1, [xy(214,313),xy(214,317),xy(214,313)]).
hole(r1, [xy(216,310),xy(215,314),xy(216,310)]).
hole(r1, [xy(216,309),xy(218,310),xy(216,309)]).
hole(r1, [xy(219,305),xy(218,309),xy(219,305)]).
hole(r1, [xy(219,304),xy(221,305),xy(219,304)]).
hole(r1, [xy(220,303),xy(222,303),xy(220,303)]).
hole(r1, [xy(224,298),xy(225,300),xy(222,303),xy(221,301),xy(224,298)]).
hole(r1, [xy(227,294),xy(228,296),xy(225,299),xy(224,297),xy(227,294)]).
hole(r1, [xy(227,294),xy(229,294),xy(227,294)]).
hole(r1, [xy(230,290),xy(229,294),xy(230,290)]).
hole(r1, [xy(230,290),xy(232,290),xy(230,290)]).
hole(r1, [xy(758,291),xy(760,288),xy(761,290),xy(758,291)]).
hole(r1, [xy(231,289),xy(233,289),xy(231,289)]).
hole(r1, [xy(479,288),xy(481,288),xy(479,288)]).
hole(r1, [xy(232,288),xy(234,288),xy(232,288)]).
hole(r1, [xy(765,287),xy(771,287),xy(765,287)]).
hole(r1, [xy(233,287),xy(235,287),xy(233,287)]).
hole(r1, [xy(770,286),xy(772,286),xy(770,286)]).
hole(r1, [xy(234,286),xy(236,286),xy(234,286)]).
hole(r1, [xy(771,285),xy(775,285),xy(771,285)]).
hole(r1, [xy(752,285),xy(754,285),xy(752,285)]).
hole(r1, [xy(592,285),xy(594,285),xy(592,285)]).
hole(r1, [xy(779,283),xy(783,283),xy(779,283)]).
hole(r1, [xy(441,283),xy(443,283),xy(441,283)]).
hole(r1, [xy(375,283),xy(377,283),xy(375,283)]).
hole(r1, [xy(239,282),xy(236,286),xy(239,282)]).
hole(r1, [xy(753,282),xy(755,283),xy(753,282)]).
hole(r1, [xy(483,282),xy(485,282),xy(483,282)]).
hole(r1, [xy(374,282),xy(376,282),xy(374,282)]).
hole(r1, [xy(435,281),xy(441,282),xy(435,281)]).
hole(r1, [xy(373,281),xy(375,281),xy(373,281)]).
hole(r1, [xy(242,280),xy(240,283),xy(242,280)]).
hole(r1, [xy(372,280),xy(374,280),xy(372,280)]).
hole(r1, [xy(790,278),xy(788,282),xy(790,278)]).
hole(r1, [xy(482,279),xy(484,279),xy(482,279)]).
hole(r1, [xy(432,279),xy(436,280),xy(432,279)]).
hole(r1, [xy(371,279),xy(373,279),xy(371,279)]).
hole(r1, [xy(245,278),xy(243,281),xy(245,278)]).
hole(r1, [xy(756,277),xy(757,280),xy(755,282),xy(756,277)]).
hole(r1, [xy(487,278),xy(489,278),xy(487,278)]).
hole(r1, [xy(483,278),xy(485,278),xy(483,278)]).
hole(r1, [xy(245,278),xy(248,278),xy(245,278)]).
hole(r1, [xy(489,277),xy(491,277),xy(489,277)]).
hole(r1, [xy(247,277),xy(250,277),xy(247,277)]).
hole(r1, [xy(817,276),xy(820,278),xy(818,279),xy(817,276)]).
hole(r1, [xy(756,276),xy(758,277),xy(756,276)]).
hole(r1, [xy(490,276),xy(492,276),xy(490,276)]).
hole(r1, [xy(249,276),xy(252,276),xy(249,276)]).
hole(r1, [xy(818,275),xy(820,275),xy(818,275)]).
hole(r1, [xy(809,275),xy(811,275),xy(809,275)]).
hole(r1, [xy(507,275),xy(509,275),xy(507,275)]).
hole(r1, [xy(427,275),xy(429,274),xy(433,278),xy(431,279),xy(427,275)]).
hole(r1, [xy(251,275),xy(254,275),xy(251,275)]).
hole(r1, [xy(843,274),xy(838,277),xy(831,276),xy(843,274)]).
hole(r1, [xy(757,274),xy(759,274),xy(757,274)]).
hole(r1, [xy(501,274),xy(503,274),xy(501,274)]).
hole(r1, [xy(815,273),xy(814,275),xy(810,274),xy(815,273)]).
hole(r1, [xy(490,273),xy(492,273),xy(490,273)]).
hole(r1, [xy(261,272),xy(256,275),xy(253,274),xy(258,271),xy(261,272)]).
hole(r1, [xy(260,271),xy(263,271),xy(260,271)]).
hole(r1, [xy(820,270),xy(818,273),xy(814,272),xy(820,270)]).
hole(r1, [xy(420,270),xy(422,269),xy(428,274),xy(426,275),xy(420,270)]).
hole(r1, [xy(262,270),xy(267,270),xy(262,270)]).
hole(r1, [xy(266,269),xy(270,269),xy(266,269)]).
hole(r1, [xy(819,268),xy(821,268),xy(819,268)]).
hole(r1, [xy(269,268),xy(274,268),xy(269,268)]).
hole(r1, [xy(273,267),xy(276,267),xy(273,267)]).
hole(r1, [xy(763,263),xy(764,265),xy(760,271),xy(759,268),xy(763,263)]).
hole(r1, [xy(420,262),xy(419,267),xy(421,269),xy(419,270),xy(416,266),xy(420,262)]).
hole(r1, [xy(420,262),xy(422,262),xy(420,262)]).
hole(r1, [xy(421,261),xy(423,261),xy(421,261)]).
hole(r1, [xy(294,261),xy(288,265),xy(281,263),xy(282,261),xy(284,263),xy(294,261)]).
hole(r1, [xy(763,260),xy(765,259),xy(766,261),xy(764,262),xy(763,260)]).
hole(r1, [xy(293,260),xy(295,258),xy(298,259),xy(293,260)]).
hole(r1, [xy(424,257),xy(423,261),xy(424,257)]).
hole(r1, [xy(297,258),xy(302,258),xy(297,258)]).
hole(r1, [xy(765,257),xy(767,257),xy(765,257)]).
hole(r1, [xy(424,257),xy(426,257),xy(424,257)]).
hole(r1, [xy(797,256),xy(799,256),xy(797,256)]).
hole(r1, [xy(425,256),xy(427,256),xy(425,256)]).
hole(r1, [xy(321,255),xy(319,257),xy(306,257),xy(309,255),xy(321,255)]).
hole(r1, [xy(320,254),xy(322,252),xy(329,253),xy(320,254)]).
hole(r1, [xy(768,251),xy(769,254),xy(767,256),xy(768,251)]).
hole(r1, [xy(329,252),xy(333,252),xy(329,252)]).
hole(r1, [xy(768,251),xy(770,251),xy(768,251)]).
hole(r1, [xy(332,251),xy(338,250),xy(336,252),xy(332,251)]).
hole(r1, [xy(831,249),xy(833,249),xy(831,249)]).
hole(r1, [xy(431,247),xy(432,250),xy(427,256),xy(426,254),xy(431,247)]).
hole(r1, [xy(431,246),xy(433,247),xy(431,246)]).
hole(r1, [xy(434,242),xy(433,246),xy(434,242)]).
hole(r1, [xy(434,242),xy(436,242),xy(434,242)]).
hole(r1, [xy(797,241),xy(799,241),xy(797,241)]).
hole(r1, [xy(832,239),xy(831,245),xy(830,241),xy(832,239)]).
hole(r1, [xy(32,240),xy(34,240),xy(32,240)]).
hole(r1, [xy(831,238),xy(833,238),xy(831,238)]).
hole(r1, [xy(774,239),xy(775,237),xy(777,238),xy(774,239)]).
hole(r1, [xy(339,236),xy(341,237),xy(339,236)]).
hole(r1, [xy(338,235),xy(340,235),xy(338,235)]).
hole(r1, [xy(337,233),xy(339,233),xy(337,233)]).
hole(r1, [xy(827,229),xy(829,229),xy(827,229)]).
hole(r1, [xy(823,227),xy(825,227),xy(823,227)]).
hole(r1, [xy(829,226),xy(831,226),xy(829,226)]).
hole(r1, [xy(841,224),xy(843,224),xy(841,224)]).
hole(r1, [xy(807,223),xy(810,223),xy(807,223)]).
hole(r1, [xy(828,222),xy(831,222),xy(828,222)]).
hole(r1, [xy(824,222),xy(829,223),xy(826,224),xy(824,222)]).
hole(r1, [xy(844,221),xy(843,223),xy(838,222),xy(844,221)]).
hole(r1, [xy(798,221),xy(800,221),xy(798,221)]).
hole(r1, [xy(843,220),xy(845,220),xy(843,220)]).
hole(r1, [xy(832,219),xy(833,221),xy(831,222),xy(832,219)]).
hole(r1, [xy(799,220),xy(801,220),xy(799,220)]).
hole(r1, [xy(824,218),xy(826,218),xy(824,218)]).
hole(r1, [xy(842,217),xy(832,219),xy(833,217),xy(842,217)]).
hole(r1, [xy(841,216),xy(845,216),xy(841,216)]).
hole(r1, [xy(844,215),xy(849,214),xy(847,216),xy(844,215)]).
hole(r1, [xy(850,213),xy(852,213),xy(850,213)]).
hole(r1, [xy(809,200),xy(811,201),xy(809,200)]).
hole(r1, [xy(811,196),xy(811,200),xy(811,196)]).
hole(r1, [xy(426,197),xy(428,197),xy(426,197)]).
hole(r1, [xy(811,196),xy(814,196),xy(811,196)]).
hole(r1, [xy(106,196),xy(108,196),xy(106,196)]).
hole(r1, [xy(107,195),xy(109,195),xy(107,195)]).
hole(r1, [xy(360,190),xy(362,190),xy(360,190)]).
hole(r1, [xy(358,188),xy(360,188),xy(358,188)]).
hole(r1, [xy(842,181),xy(844,181),xy(842,181)]).
hole(r1, [xy(302,181),xy(304,181),xy(302,181)]).
hole(r1, [xy(620,136),xy(622,136),xy(620,136)]).
hole(r1, [xy(597,112),xy(599,112),xy(597,112)]).
hole(r1, [xy(591,104),xy(593,104),xy(591,104)]).
hole(r1, [xy(486,101),xy(488,101),xy(486,101)]).
hole(r1, [xy(849,92),xy(851,92),xy(849,92)]).
hole(r1, [xy(323,84),xy(325,84),xy(323,84)]).
hole(r1, [xy(324,83),xy(326,83),xy(324,83)]).
hole(r1, [xy(331,76),xy(333,76),xy(331,76)]).
hole(r1, [xy(332,75),xy(334,75),xy(332,75)]).
hole(r1, [xy(443,67),xy(446,67),xy(443,67)]).
hole(r1, [xy(445,66),xy(447,66),xy(445,66)]).
hole(r1, [xy(442,66),xy(444,66),xy(442,66)]).
hole(r1, [xy(441,65),xy(443,65),xy(441,65)]).
hole(r1, [xy(440,64),xy(442,64),xy(440,64)]).
hole(r1, [xy(433,63),xy(435,63),xy(433,63)]).
hole(r1, [xy(342,63),xy(345,63),xy(342,63)]).
hole(r1, [xy(430,62),xy(433,62),xy(430,62)]).
hole(r1, [xy(424,61),xy(430,61),xy(424,61)]).
hole(r1, [xy(347,60),xy(350,60),xy(347,60)]).
hole(r1, [xy(418,59),xy(424,58),xy(425,60),xy(418,59)]).
hole(r1, [xy(349,59),xy(351,59),xy(349,59)]).
hole(r1, [xy(132,59),xy(134,59),xy(132,59)]).
hole(r1, [xy(548,58),xy(550,58),xy(548,58)]).
hole(r1, [xy(417,58),xy(419,58),xy(417,58)]).
hole(r1, [xy(351,58),xy(354,58),xy(351,58)]).
hole(r1, [xy(538,57),xy(540,57),xy(538,57)]).
hole(r1, [xy(415,57),xy(418,57),xy(415,57)]).
hole(r1, [xy(353,57),xy(355,57),xy(353,57)]).
hole(r1, [xy(540,49),xy(542,49),xy(540,49)]).
hole(r1, [xy(539,48),xy(541,48),xy(539,48)]).
hole(r1, [xy(133,44),xy(135,45),xy(134,59),xy(133,44)]).
hole(r1, [xy(534,43),xy(536,43),xy(534,43)]).
hole(r1, [xy(362,41),xy(364,41),xy(362,41)]).
hole(r1, [xy(363,40),xy(365,40),xy(363,40)]).
hole(r1, [xy(134,37),xy(137,40),xy(135,45),xy(134,37)]).
hole(r1, [xy(37,38),xy(39,39),xy(37,38)]).
hole(r1, [xy(528,37),xy(530,37),xy(528,37)]).
hole(r1, [xy(527,36),xy(529,36),xy(527,36)]).
hole(r1, [xy(367,32),xy(369,32),xy(367,32)]).
hole(r1, [xy(523,31),xy(525,31),xy(523,31)]).
hole(r1, [xy(522,30),xy(524,30),xy(522,30)]).
hole(r1, [xy(521,29),xy(523,29),xy(521,29)]).
hole(r1, [xy(520,28),xy(522,28),xy(520,28)]).
hole(r1, [xy(519,27),xy(521,27),xy(519,27)]).
hole(r1, [xy(518,26),xy(520,26),xy(518,26)]).
hole(r1, [xy(403,17),xy(405,18),xy(403,17)]).
hole(r1, [xy(407,11),xy(408,13),xy(405,17),xy(404,15),xy(407,11)]).
hole(r1, [xy(407,10),xy(409,11),xy(407,10)]).
hole(r1, [xy(408,8),xy(410,9),xy(408,8)]).
midline(r1, [xy(6,6),xy(28,12),xy(51,14),xy(55,19),xy(39,35),xy(33,35),xy(30,42),xy(18,54),xy(10,46),xy(10,36),xy(2,20)]).
midline(r1, [xy(361,23),xy(367,31),xy(327,31),xy(313,34),xy(240,107),xy(234,102),xy(234,97),xy(156,19),xy(113,19),xy(85,46),xy(58,19),xy(41,34)]).
midline(r1, [xy(89,43),xy(85,47),xy(85,86),xy(66,105),xy(18,58),xy(18,55),xy(30,43)]).
midline(r1, [xy(364,32),xy(362,40),xy(363,42),xy(364,41),xy(363,40),xy(364,39),xy(365,39),xy(364,42)]).
midline(r1, [xy(93,40),xy(113,20)]).
midline(r1, [xy(313,35),xy(240,108),xy(240,135),xy(237,146),xy(132,42),xy(92,42)]).
midline(r1, [xy(239,137),xy(254,150),xy(257,149),xy(337,231),xy(338,236),xy(340,235),xy(339,232)]).
midline(r1, [xy(32,37),xy(33,36)]).
midline(r1, [xy(326,33),xy(383,93),xy(384,50),xy(378,44),xy(378,37),xy(376,35),xy(353,56),xy(353,57),xy(355,58)]).
midline(r1, [xy(376,34),xy(375,30),xy(369,30),xy(367,32),xy(368,33),xy(369,32),xy(369,31)]).
midline(r1, [xy(376,36),xy(356,56)]).
midline(r1, [xy(85,87),xy(66,106),xy(66,122),xy(116,174),xy(110,193),xy(106,195),xy(107,197),xy(108,196),xy(107,195)]).
midline(r1, [xy(114,181),xy(249,316),xy(245,319),xy(112,187)]).
midline(r1, [xy(249,317),xy(254,315),xy(256,311),xy(234,289),xy(231,288),xy(230,289),xy(231,291),xy(233,290)]).
midline(r1, [xy(115,176),xy(120,173),xy(232,287),xy(234,285),xy(235,285),xy(236,286),xy(234,288),xy(236,287)]).
midline(r1, [xy(256,313),xy(267,310),xy(128,170),xy(122,172)]).
midline(r1, [xy(128,169),xy(145,168),xy(147,165),xy(158,164),xy(260,267),xy(260,271),xy(261,272),xy(261,273),xy(263,272),xy(262,269)]).
midline(r1, [xy(159,163),xy(176,162),xy(266,254),xy(266,269),xy(267,270),xy(267,276),xy(263,273)]).
midline(r1, [xy(267,277),xy(270,278),xy(270,269),xy(269,268),xy(269,256),xy(267,254)]).
midline(r1, [xy(146,169),xy(248,271),xy(248,274),xy(245,276),xy(245,278),xy(247,280),xy(248,279),xy(247,276),xy(249,274),xy(249,276),xy(250,278),xy(248,280)]).
midline(r1, [xy(250,279),xy(252,277),xy(252,276),xy(250,274),xy(253,273),xy(254,276),xy(252,281),xy(277,306),xy(271,309),xy(133,170)]).
midline(r1, [xy(270,279),xy(274,281),xy(274,268),xy(273,267),xy(273,259),xy(270,256)]).
midline(r1, [xy(274,259),xy(278,263),xy(279,268),xy(315,304),xy(314,306),xy(303,306),xy(300,303),xy(295,303),xy(274,282)]).
midline(r1, [xy(271,310),xy(267,311)]).
midline(r1, [xy(258,149),xy(261,149),xy(322,88),xy(324,82),xy(326,82),xy(326,83),xy(324,85),xy(326,84)]).
midline(r1, [xy(275,309),xy(278,306),xy(291,306),xy(294,303)]).
midline(r1, [xy(315,306),xy(329,305),xy(335,302),xy(193,159),xy(178,161)]).
midline(r1, [xy(193,158),xy(231,155),xy(237,147),xy(333,243),xy(343,243),xy(377,276),xy(376,280),xy(371,278),xy(371,280),xy(376,284),xy(377,283),xy(373,279)]).
midline(r1, [xy(235,153),xy(329,247),xy(329,258),xy(332,261),xy(333,252),xy(330,247)]).
midline(r1, [xy(209,159),xy(297,247),xy(297,258),xy(303,265),xy(304,253),xy(298,247)]).
midline(r1, [xy(304,265),xy(340,301),xy(336,303)]).
midline(r1, [xy(340,302),xy(342,301),xy(351,310),xy(306,355),xy(288,354),xy(282,348),xy(275,355),xy(258,355),xy(254,351),xy(250,351),xy(215,317),xy(214,317),xy(213,316),xy(208,317),xy(107,215),xy(105,216),xy(104,230),xy(96,240),xy(32,239),xy(32,241),xy(34,241)]).
midline(r1, [xy(105,222),xy(208,325),xy(209,325),xy(210,326),xy(212,325),xy(210,323),xy(209,323)]).
midline(r1, [xy(212,326),xy(223,335),xy(220,338),xy(206,337),xy(204,336),xy(102,235),xy(95,242),xy(94,247),xy(79,262),xy(77,285),xy(148,356),xy(164,356),xy(173,351),xy(174,327),xy(95,248),xy(80,262)]).
midline(r1, [xy(217,318),xy(214,313),xy(206,313)]).
midline(r1, [xy(216,336),xy(214,334),xy(207,334),xy(203,331),xy(104,231)]).
midline(r1, [xy(232,335),xy(224,335),xy(222,337)]).
midline(r1, [xy(202,328),xy(208,328),xy(209,329),xy(210,329),xy(209,331),xy(205,331)]).
midline(r1, [xy(210,331),xy(214,333)]).
midline(r1, [xy(282,347),xy(281,330),xy(269,341),xy(267,340),xy(263,341),xy(255,350),xy(260,346)]).
midline(r1, [xy(271,340),xy(280,331)]).
midline(r1, [xy(107,214),xy(107,203),xy(110,194),xy(217,303),xy(218,302),xy(221,302),xy(222,303),xy(221,306),xy(218,305)]).
midline(r1, [xy(222,306),xy(241,323),xy(239,331),xy(217,311),xy(108,203)]).
midline(r1, [xy(240,331),xy(239,337)]).
midline(r1, [xy(282,349),xy(277,354)]).
midline(r1, [xy(224,157),xy(368,302),xy(363,309),xy(352,310),xy(308,354)]).
midline(r1, [xy(368,305),xy(364,309),xy(369,314),xy(376,314),xy(376,316),xy(385,318),xy(427,276)]).
midline(r1, [xy(219,310),xy(217,308),xy(215,308)]).
midline(r1, [xy(377,284),xy(377,290),xy(369,297),xy(333,261)]).
midline(r1, [xy(369,302),xy(376,292)]).
midline(r1, [xy(428,274),xy(435,265),xy(424,255),xy(423,255),xy(383,215),xy(378,228),xy(378,276)]).
midline(r1, [xy(435,264),xy(435,266)]).
midline(r1, [xy(386,319),xy(392,320),xy(432,280)]).
midline(r1, [xy(282,330),xy(282,327),xy(303,307)]).
midline(r1, [xy(383,214),xy(387,196),xy(427,157),xy(428,155),xy(425,152),xy(262,150)]).
midline(r1, [xy(303,151),xy(302,182),xy(303,182),xy(304,180)]).
midline(r1, [xy(428,156),xy(519,156),xy(434,241),xy(435,243),xy(520,157),xy(524,157),xy(540,174),xy(452,262),xy(448,262),xy(434,248),xy(432,248),xy(428,245),xy(386,204)]).
midline(r1, [xy(430,245),xy(432,245),xy(434,247)]).
midline(r1, [xy(359,152),xy(358,189),xy(359,189),xy(360,187)]).
midline(r1, [xy(381,223),xy(420,262),xy(422,260),xy(423,261),xy(421,263),xy(423,262),xy(424,265),xy(421,267),xy(421,269),xy(377,314),xy(420,271)]).
midline(r1, [xy(423,267),xy(425,265),xy(432,265)]).
midline(r1, [xy(453,262),xy(541,174),xy(547,174),xy(588,215),xy(528,275),xy(503,273),xy(493,274),xy(491,272),xy(490,272),xy(488,277),xy(483,277),xy(482,278),xy(483,283),xy(484,283),xy(485,282),xy(483,278)]).
midline(r1, [xy(485,278),xy(485,279)]).
midline(r1, [xy(529,275),xy(589,215),xy(593,214),xy(592,286),xy(593,286),xy(594,284)]).
midline(r1, [xy(437,265),xy(444,265),xy(433,278)]).
midline(r1, [xy(434,276),xy(444,266)]).
midline(r1, [xy(377,282),xy(376,281)]).
midline(r1, [xy(427,158),xy(426,198),xy(427,198),xy(428,196)]).
midline(r1, [xy(393,321),xy(397,321),xy(451,264)]).
midline(r1, [xy(398,322),xy(479,322),xy(480,320),xy(443,284)]).
midline(r1, [xy(481,320),xy(484,320),xy(514,289),xy(481,287),xy(479,287),xy(479,289),xy(481,289)]).
midline(r1, [xy(514,288),xy(527,276)]).
midline(r1, [xy(320,34),xy(383,99),xy(384,93)]).
midline(r1, [xy(384,99),xy(394,110),xy(394,113),xy(358,149),xy(394,114)]).
midline(r1, [xy(174,351),xy(179,356),xy(195,356),xy(200,353),xy(203,347),xy(209,346),xy(209,349),xy(210,349),xy(211,348),xy(210,347),xy(211,347)]).
midline(r1, [xy(201,354),xy(204,357),xy(217,357),xy(236,339)]).
midline(r1, [xy(843,244),xy(842,232),xy(830,231),xy(824,228),xy(823,227),xy(823,226),xy(825,227)]).
midline(r1, [xy(843,245),xy(841,256),xy(833,258),xy(831,250),xy(831,248),xy(833,248),xy(833,250)]).
midline(r1, [xy(835,230),xy(836,223),xy(832,219),xy(826,216),xy(821,211),xy(784,212),xy(691,118),xy(656,118),xy(647,126),xy(640,126),xy(620,135),xy(618,139),xy(613,140),xy(599,154),xy(480,35),xy(468,35),xy(463,30),xy(438,28),xy(414,4),xy(398,6),xy(375,29),xy(388,17)]).
midline(r1, [xy(404,5),xy(406,11),xy(407,11),xy(408,12),xy(410,11),xy(408,9),xy(407,9)]).
midline(r1, [xy(784,213),xy(792,221),xy(792,239),xy(796,243),xy(797,240),xy(799,240),xy(799,241),xy(797,243),xy(799,246),xy(797,253),xy(791,259),xy(788,259),xy(776,247),xy(768,246),xy(648,126),xy(654,120)]).
midline(r1, [xy(524,78),xy(524,33),xy(518,27),xy(518,25),xy(520,25),xy(519,27),xy(520,28),xy(521,27),xy(521,26),xy(522,27),xy(521,29),xy(522,30),xy(523,29),xy(523,28),xy(524,29),xy(523,31),xy(524,32),xy(525,31),xy(525,30)]).
midline(r1, [xy(598,152),xy(597,111),xy(599,111),xy(599,113)]).
midline(r1, [xy(592,146),xy(591,103),xy(593,103),xy(593,105)]).
midline(r1, [xy(613,141),xy(599,155),xy(599,208),xy(594,214),xy(600,209),xy(672,282),xy(754,281),xy(756,283),xy(755,285),xy(752,284),xy(752,287),xy(717,322),xy(712,322),xy(673,283)]).
midline(r1, [xy(535,89),xy(534,42),xy(536,42),xy(536,44)]).
midline(r1, [xy(821,210),xy(821,207),xy(814,200),xy(811,200),xy(810,199),xy(773,199)]).
midline(r1, [xy(545,101),xy(486,100),xy(486,102),xy(488,102)]).
midline(r1, [xy(793,258),xy(801,268),xy(801,281),xy(804,292),xy(822,309),xy(821,313),xy(817,316),xy(785,284),xy(785,279),xy(777,271),xy(774,272),xy(765,263),xy(762,263),xy(632,131)]).
midline(r1, [xy(752,288),xy(718,322),xy(722,327),xy(797,327),xy(798,325),xy(763,290),xy(763,285),xy(761,283),xy(756,285)]).
midline(r1, [xy(799,325),xy(808,324),xy(770,284),xy(764,278),xy(757,278),xy(756,277),xy(755,277),xy(618,140)]).
midline(r1, [xy(772,287),xy(771,285)]).
midline(r1, [xy(808,325),xy(814,323),xy(777,286),xy(777,281),xy(771,275),xy(765,278),xy(761,274),xy(759,273),xy(755,273),xy(620,138),xy(622,137)]).
midline(r1, [xy(761,282),xy(763,280)]).
midline(r1, [xy(410,12),xy(431,31),xy(426,36),xy(404,16),xy(391,16)]).
midline(r1, [xy(825,229),xy(817,233),xy(817,213)]).
midline(r1, [xy(819,234),xy(820,233)]).
midline(r1, [xy(777,270),xy(777,267),xy(766,256),xy(763,256),xy(637,130),xy(638,128)]).
midline(r1, [xy(778,267),xy(787,260)]).
midline(r1, [xy(817,234),xy(806,247),xy(798,249)]).
midline(r1, [xy(817,237),xy(807,247),xy(817,257),xy(828,258),xy(819,267),xy(819,269),xy(820,269),xy(821,268),xy(821,267)]).
midline(r1, [xy(424,37),xy(398,37),xy(385,50),xy(396,39)]).
midline(r1, [xy(394,12),xy(392,14)]).
midline(r1, [xy(429,35),xy(437,29)]).
midline(r1, [xy(529,83),xy(529,39),xy(527,37),xy(527,35),xy(529,35),xy(529,36),xy(528,37),xy(529,38),xy(530,36)]).
midline(r1, [xy(822,265),xy(830,258),xy(826,274),xy(816,274),xy(799,256)]).
midline(r1, [xy(827,268),xy(828,267)]).
midline(r1, [xy(818,275),xy(820,276)]).
midline(r1, [xy(816,275),xy(805,286),xy(815,277)]).
midline(r1, [xy(827,228),xy(829,227),xy(829,223),xy(828,222),xy(829,219),xy(831,222),xy(831,226),xy(829,229)]).
midline(r1, [xy(539,93),xy(538,56),xy(540,56),xy(540,58)]).
midline(r1, [xy(541,56),xy(539,47),xy(541,47),xy(541,48),xy(540,49),xy(541,50),xy(542,48)]).
midline(r1, [xy(821,314),xy(817,320)]).
midline(r1, [xy(833,232),xy(831,237),xy(831,239),xy(832,239),xy(833,238),xy(833,237)]).
midline(r1, [xy(836,222),xy(842,219),xy(842,217),xy(841,216),xy(841,211),xy(830,200),xy(822,207)]).
midline(r1, [xy(829,201),xy(827,203)]).
midline(r1, [xy(842,211),xy(845,216),xy(843,220),xy(844,221),xy(845,220),xy(845,219),xy(845,221)]).
midline(r1, [xy(826,205),xy(825,206)]).
midline(r1, [xy(830,199),xy(833,193),xy(833,175),xy(753,97),xy(712,98),xy(692,118),xy(710,100)]).
midline(r1, [xy(714,99),xy(814,199)]).
midline(r1, [xy(834,181),xy(842,180),xy(843,182),xy(844,180)]).
midline(r1, [xy(833,194),xy(851,214),xy(851,217),xy(847,220),xy(848,225),xy(845,228),xy(843,225)]).
midline(r1, [xy(849,220),xy(850,219)]).
midline(r1, [xy(852,214),xy(851,212)]).
midline(r1, [xy(847,227),xy(844,232)]).
midline(r1, [xy(767,258),xy(765,258)]).
midline(r1, [xy(826,275),xy(826,283),xy(836,295),xy(823,309),xy(836,296)]).
midline(r1, [xy(549,103),xy(548,57),xy(550,57),xy(550,59)]).
midline(r1, [xy(793,221),xy(798,220),xy(799,222),xy(800,221),xy(799,220),xy(799,219),xy(801,219),xy(800,222)]).
midline(r1, [xy(848,93),xy(847,94)]).
midline(r1, [xy(406,98),xy(423,82),xy(424,61),xy(428,56),xy(430,55),xy(430,75),xy(424,81)]).
midline(r1, [xy(426,80),xy(436,71)]).
midline(r1, [xy(437,69),xy(437,65),xy(434,62),xy(433,62),xy(433,64),xy(435,64)]).
midline(r1, [xy(438,64),xy(440,63),xy(440,65),xy(443,67),xy(444,66),xy(441,63),xy(444,63),xy(444,59),xy(468,36)]).
midline(r1, [xy(454,31),xy(431,55),xy(455,31)]).
midline(r1, [xy(95,98),xy(132,62),xy(132,58),xy(133,58),xy(134,60)]).
midline(r1, [xy(442,34),xy(441,35)]).
midline(r1, [xy(803,282),xy(809,274),xy(810,274),xy(811,275),xy(810,276),xy(811,276)]).
midline(r1, [xy(213,321),xy(212,321),xy(210,319),xy(211,317),xy(211,318),xy(214,319),xy(214,321)]).
midline(r1, [xy(215,318),xy(215,319)]).
midline(r1, [xy(243,321),xy(242,323),xy(246,320),xy(260,334),xy(261,338),xy(263,337),xy(261,335),xy(263,336)]).
midline(r1, [xy(770,252),xy(768,251),xy(770,249),xy(770,251)]).
midline(r1, [xy(426,255),xy(424,257),xy(426,258),xy(427,256)]).
midline(r1, [xy(362,189),xy(360,189),xy(360,191),xy(362,191)]).
midline(r1, [xy(443,33),xy(446,30)]).
midline(r1, [xy(263,344),xy(266,345),xy(268,343),xy(267,342),xy(265,343)]).
midline(r1, [xy(268,342),xy(267,341)]).
midline(r1, [xy(503,275),xy(501,275)]).
midline(r1, [xy(216,339),xy(215,340)]).
midline(r1, [xy(491,278),xy(487,279)]).
midline(r1, [xy(839,290),xy(847,282)]).
midline(r1, [xy(848,280),xy(842,273),xy(842,268),xy(832,259)]).
midline(r1, [xy(329,80),xy(332,74),xy(334,74),xy(334,75),xy(332,77),xy(334,76)]).
midline(r1, [xy(507,275),xy(509,276)]).
midline(r1, [xy(296,347),xy(293,353),xy(296,351)]).
midline(r1, [xy(297,347),xy(298,349)]).
midline(r1, [xy(826,217),xy(825,216),xy(824,219),xy(825,217)]).
midline(r1, [xy(851,93),xy(850,93),xy(849,92),xy(849,91),xy(850,91),xy(851,92)]).
midline(r1, [xy(759,275),xy(757,275)]).
midline(r1, [xy(491,275),xy(492,274)]).
midline(r1, [xy(754,285),xy(754,286)]).
midline(r1, [xy(445,65),xy(447,65),xy(447,67)]).
midline(r1, [xy(772,273),xy(773,272)]).
midline(r1, [xy(851,275),xy(852,274)]).
midline(r1, [xy(771,249),xy(772,248)]).
midline(r1, [xy(446,264),xy(447,263)]).
fillpoint(r1, xy(729,116), 111.4).
fillpoint(r1, xy(202,145), 110.5).
fillpoint(r1, xy(735,114), 109.8).
fillpoint(r1, xy(740,113), 108.9).
fillpoint(r1, xy(211,136), 106.4).
fillpoint(r1, xy(220,116), 106.2).
fillpoint(r1, xy(217,123), 106.2).
fillpoint(r1, xy(221,114), 106.1).
fillpoint(r1, xy(216,125), 106.1).
fillpoint(r1, xy(214,130), 106.1).
fillpoint(r1, xy(213,132), 106.1).
fillpoint(r1, xy(222,111), 106.0).
fillpoint(r1, xy(219,118), 106.0).
fillpoint(r1, xy(218,121), 106.0).
fillpoint(r1, xy(215,128), 106.0).
fillpoint(r1, xy(212,134), 106.0).
fillpoint(r1, xy(728,139), 103.3).
fillpoint(r1, xy(727,141), 103.3).
fillpoint(r1, xy(729,137), 103.2).
fillpoint(r1, xy(726,143), 103.2).
fillpoint(r1, xy(673,221), 102.6).
fillpoint(r1, xy(722,151), 102.5).
fillpoint(r1, xy(721,153), 102.5).
fillpoint(r1, xy(723,149), 102.4).
fillpoint(r1, xy(538,187), 96.5).
fillpoint(r1, xy(531,184), 96.4).
fillpoint(r1, xy(536,186), 96.4).
fillpoint(r1, xy(533,185), 96.3).
fillpoint(r1, xy(540,188), 96.3).
fillpoint(r1, xy(543,189), 96.3).
fillpoint(r1, xy(203,182), 95.9).
fillpoint(r1, xy(205,187), 95.9).
fillpoint(r1, xy(206,189), 95.9).
fillpoint(r1, xy(204,185), 95.8).
fillpoint(r1, xy(207,191), 95.8).
fillpoint(r1, xy(705,171), 94.6).
fillpoint(r1, xy(704,173), 94.6).
fillpoint(r1, xy(702,178), 94.6).
fillpoint(r1, xy(701,180), 94.6).
fillpoint(r1, xy(703,175), 94.5).
fillpoint(r1, xy(700,182), 94.5).
fillpoint(r1, xy(699,184), 94.1).
fillpoint(r1, xy(698,186), 94.1).
fillpoint(r1, xy(697,188), 94.1).
fillpoint(r1, xy(696,190), 94.0).
fillpoint(r1, xy(693,197), 93.9).
fillpoint(r1, xy(692,199), 93.9).
fillpoint(r1, xy(694,195), 93.8).
fillpoint(r1, xy(691,201), 93.7).
fillpoint(r1, xy(690,203), 93.7).
fillpoint(r1, xy(561,204), 89.8).
fillpoint(r1, xy(559,203), 89.7).
fillpoint(r1, xy(102,279), 81.2).
fillpoint(r1, xy(148,263), 81.0).
fillpoint(r1, xy(118,276), 81.0).
fillpoint(r1, xy(141,266), 80.9).
fillpoint(r1, xy(139,267), 80.9).
fillpoint(r1, xy(134,269), 80.9).
fillpoint(r1, xy(132,270), 80.9).
fillpoint(r1, xy(127,272), 80.9).
fillpoint(r1, xy(125,273), 80.9).
fillpoint(r1, xy(111,279), 80.9).
fillpoint(r1, xy(150,262), 80.8).
fillpoint(r1, xy(146,264), 80.8).
fillpoint(r1, xy(143,265), 80.8).
fillpoint(r1, xy(136,268), 80.8).
fillpoint(r1, xy(130,271), 80.8).
fillpoint(r1, xy(123,274), 80.8).
fillpoint(r1, xy(120,275), 80.8).
fillpoint(r1, xy(116,277), 80.8).
fillpoint(r1, xy(113,278), 80.8).
fillpoint(r1, xy(152,261), 80.7).
fillpoint(r1, xy(107,280), 80.2).
fillpoint(r1, xy(83,122), 80.1).
fillpoint(r1, xy(177,228), 79.4).
fillpoint(r1, xy(173,234), 78.1).
fillpoint(r1, xy(171,238), 77.6).
fillpoint(r1, xy(159,255), 77.6).
fillpoint(r1, xy(599,207), 76.9).
fillpoint(r1, xy(606,210), 76.9).
fillpoint(r1, xy(608,211), 76.9).
fillpoint(r1, xy(615,214), 76.9).
fillpoint(r1, xy(594,205), 76.8).
fillpoint(r1, xy(597,206), 76.8).
fillpoint(r1, xy(601,208), 76.8).
fillpoint(r1, xy(604,209), 76.8).
fillpoint(r1, xy(610,212), 76.8).
fillpoint(r1, xy(613,213), 76.8).
fillpoint(r1, xy(617,215), 76.8).
fillpoint(r1, xy(620,216), 76.8).
fillpoint(r1, xy(168,242), 76.8).
fillpoint(r1, xy(675,79), 76.4).
fillpoint(r1, xy(166,246), 76.3).
fillpoint(r1, xy(165,248), 76.3).
fillpoint(r1, xy(163,251), 76.3).
fillpoint(r1, xy(670,78), 75.4).
fillpoint(r1, xy(666,77), 74.5).
fillpoint(r1, xy(77,111), 74.5).
fillpoint(r1, xy(390,124), 74.0).
fillpoint(r1, xy(397,127), 74.0).
fillpoint(r1, xy(395,126), 73.9).
fillpoint(r1, xy(399,128), 73.9).
fillpoint(r1, xy(402,129), 73.9).
fillpoint(r1, xy(392,125), 73.8).
fillpoint(r1, xy(661,76), 73.5).
fillpoint(r1, xy(76,106), 73.5).
fillpoint(r1, xy(75,101), 72.6).
fillpoint(r1, xy(109,122), 70.1).
fillpoint(r1, xy(116,125), 70.1).
fillpoint(r1, xy(125,129), 70.1).
fillpoint(r1, xy(132,132), 70.1).
fillpoint(r1, xy(111,123), 70.0).
fillpoint(r1, xy(118,126), 70.0).
fillpoint(r1, xy(123,128), 70.0).
fillpoint(r1, xy(130,131), 70.0).
fillpoint(r1, xy(114,124), 69.9).
fillpoint(r1, xy(121,127), 69.9).
fillpoint(r1, xy(127,130), 69.9).
fillpoint(r1, xy(80,292), 68.8).
fillpoint(r1, xy(75,293), 67.8).
fillpoint(r1, xy(71,294), 66.9).
fillpoint(r1, xy(430,130), 65.2).
fillpoint(r1, xy(432,131), 65.0).
fillpoint(r1, xy(427,129), 64.9).
fillpoint(r1, xy(643,65), 63.0).
fillpoint(r1, xy(62,154), 60.2).
fillpoint(r1, xy(61,159), 59.2).
fillpoint(r1, xy(632,60), 58.3).
fillpoint(r1, xy(457,149), 58.3).
fillpoint(r1, xy(60,163), 58.3).
fillpoint(r1, xy(448,145), 58.2).
fillpoint(r1, xy(450,146), 58.2).
fillpoint(r1, xy(464,152), 58.2).
fillpoint(r1, xy(466,153), 58.2).
fillpoint(r1, xy(452,147), 58.1).
fillpoint(r1, xy(455,148), 58.1).
fillpoint(r1, xy(459,150), 58.1).
fillpoint(r1, xy(462,151), 58.1).
fillpoint(r1, xy(627,59), 57.3).
fillpoint(r1, xy(59,168), 57.3).
fillpoint(r1, xy(353,131), 56.9).
fillpoint(r1, xy(346,134), 56.9).
fillpoint(r1, xy(358,129), 56.8).
fillpoint(r1, xy(355,130), 56.8).
fillpoint(r1, xy(351,132), 56.8).
fillpoint(r1, xy(344,135), 56.8).
fillpoint(r1, xy(339,137), 56.8).
fillpoint(r1, xy(348,133), 56.7).
fillpoint(r1, xy(342,136), 56.7).
fillpoint(r1, xy(623,58), 56.3).
fillpoint(r1, xy(58,172), 56.3).
fillpoint(r1, xy(618,57), 55.4).
fillpoint(r1, xy(57,177), 55.4).
fillpoint(r1, xy(614,56), 54.4).
fillpoint(r1, xy(56,182), 54.4).
fillpoint(r1, xy(609,55), 53.5).
fillpoint(r1, xy(55,186), 53.5).
fillpoint(r1, xy(604,54), 52.5).
fillpoint(r1, xy(54,191), 52.5).
fillpoint(r1, xy(548,309), 52.3).
fillpoint(r1, xy(310,131), 50.7).
fillpoint(r1, xy(317,134), 50.7).
fillpoint(r1, xy(308,130), 50.6).
fillpoint(r1, xy(319,135), 50.6).
fillpoint(r1, xy(305,129), 50.5).
fillpoint(r1, xy(312,132), 50.5).
fillpoint(r1, xy(315,133), 50.5).
fillpoint(r1, xy(322,136), 50.5).
fillpoint(r1, xy(330,306), 50.5).
fillpoint(r1, xy(326,305), 49.7).
fillpoint(r1, xy(543,312), 49.7).
fillpoint(r1, xy(82,57), 49.5).
fillpoint(r1, xy(335,312), 49.0).
fillpoint(r1, xy(334,310), 48.9).
fillpoint(r1, xy(83,54), 48.7).
fillpoint(r1, xy(539,313), 48.7).
fillpoint(r1, xy(84,49), 47.8).
fillpoint(r1, xy(534,314), 47.8).
fillpoint(r1, xy(292,48), 46.8).
fillpoint(r1, xy(530,315), 46.8).
fillpoint(r1, xy(386,228), 46.6).
fillpoint(r1, xy(315,304), 45.8).
fillpoint(r1, xy(525,316), 45.8).
fillpoint(r1, xy(346,317), 44.9).
fillpoint(r1, xy(407,317), 44.9).
fillpoint(r1, xy(520,317), 44.9).
fillpoint(r1, xy(66,209), 44.4).
fillpoint(r1, xy(67,211), 44.4).
fillpoint(r1, xy(70,218), 44.4).
fillpoint(r1, xy(73,225), 44.4).
fillpoint(r1, xy(74,227), 44.4).
fillpoint(r1, xy(68,213), 44.3).
fillpoint(r1, xy(69,216), 44.3).
fillpoint(r1, xy(71,220), 44.3).
fillpoint(r1, xy(72,223), 44.3).
fillpoint(r1, xy(308,303), 43.9).
fillpoint(r1, xy(350,318), 43.9).
fillpoint(r1, xy(402,318), 43.9).
fillpoint(r1, xy(516,318), 43.9).
fillpoint(r1, xy(563,318), 43.9).
fillpoint(r1, xy(624,318), 43.9).
fillpoint(r1, xy(723,318), 43.9).
fillpoint(r1, xy(482,45), 43.1).
fillpoint(r1, xy(483,47), 43.1).
fillpoint(r1, xy(486,54), 43.1).
fillpoint(r1, xy(484,49), 43.0).
fillpoint(r1, xy(485,52), 43.0).
fillpoint(r1, xy(487,56), 43.0).
fillpoint(r1, xy(355,319), 43.0).
fillpoint(r1, xy(398,319), 43.0).
fillpoint(r1, xy(567,319), 43.0).
fillpoint(r1, xy(619,319), 43.0).
fillpoint(r1, xy(807,319), 43.0).
fillpoint(r1, xy(284,218), 42.8).
fillpoint(r1, xy(384,239), 42.7).
fillpoint(r1, xy(551,279), 42.6).
fillpoint(r1, xy(550,281), 42.6).
fillpoint(r1, xy(552,277), 42.5).
fillpoint(r1, xy(549,283), 42.5).
fillpoint(r1, xy(416,317), 42.4).
fillpoint(r1, xy(421,319), 42.4).
fillpoint(r1, xy(418,318), 42.3).
fillpoint(r1, xy(305,43), 42.0).
fillpoint(r1, xy(490,58), 42.0).
fillpoint(r1, xy(359,320), 42.0).
fillpoint(r1, xy(393,320), 42.0).
fillpoint(r1, xy(424,320), 42.0).
fillpoint(r1, xy(508,320), 42.0).
fillpoint(r1, xy(572,320), 42.0).
fillpoint(r1, xy(615,320), 42.0).
fillpoint(r1, xy(801,320), 42.0).
fillpoint(r1, xy(309,42), 41.1).
fillpoint(r1, xy(494,61), 41.1).
fillpoint(r1, xy(364,321), 41.1).
fillpoint(r1, xy(388,321), 41.1).
fillpoint(r1, xy(428,321), 41.1).
fillpoint(r1, xy(455,321), 41.1).
fillpoint(r1, xy(504,321), 41.1).
fillpoint(r1, xy(576,321), 41.1).
fillpoint(r1, xy(610,321), 41.1).
fillpoint(r1, xy(797,321), 41.1).
fillpoint(r1, xy(496,62), 41.0).
fillpoint(r1, xy(290,306), 40.6).
fillpoint(r1, xy(297,303), 40.5).
fillpoint(r1, xy(292,305), 40.5).
fillpoint(r1, xy(295,304), 40.4).
fillpoint(r1, xy(369,322), 40.1).
fillpoint(r1, xy(384,322), 40.1).
fillpoint(r1, xy(433,322), 40.1).
fillpoint(r1, xy(450,322), 40.1).
fillpoint(r1, xy(461,322), 40.1).
fillpoint(r1, xy(499,322), 40.1).
fillpoint(r1, xy(581,322), 40.1).
fillpoint(r1, xy(605,322), 40.1).
fillpoint(r1, xy(733,322), 40.1).
fillpoint(r1, xy(792,322), 40.1).
fillpoint(r1, xy(787,322), 39.3).
fillpoint(r1, xy(285,305), 39.2).
fillpoint(r1, xy(373,323), 39.2).
fillpoint(r1, xy(379,323), 39.2).
fillpoint(r1, xy(438,323), 39.2).
fillpoint(r1, xy(445,323), 39.2).
fillpoint(r1, xy(466,323), 39.2).
fillpoint(r1, xy(495,323), 39.2).
fillpoint(r1, xy(586,323), 39.2).
fillpoint(r1, xy(601,323), 39.2).
fillpoint(r1, xy(738,323), 39.2).
fillpoint(r1, xy(785,323), 39.2).
fillpoint(r1, xy(778,324), 38.2).
fillpoint(r1, xy(470,324), 38.2).
fillpoint(r1, xy(490,324), 38.2).
fillpoint(r1, xy(590,324), 38.2).
fillpoint(r1, xy(596,324), 38.2).
fillpoint(r1, xy(742,324), 38.2).
fillpoint(r1, xy(472,38), 37.2).
fillpoint(r1, xy(300,219), 37.2).
fillpoint(r1, xy(475,325), 37.2).
fillpoint(r1, xy(485,325), 37.2).
fillpoint(r1, xy(747,325), 37.2).
fillpoint(r1, xy(773,325), 37.2).
fillpoint(r1, xy(305,219), 37.0).
fillpoint(r1, xy(303,220), 36.9).
fillpoint(r1, xy(468,37), 36.3).
fillpoint(r1, xy(767,326), 36.3).
fillpoint(r1, xy(480,326), 36.3).
fillpoint(r1, xy(752,326), 36.3).
fillpoint(r1, xy(319,36), 35.3).
fillpoint(r1, xy(463,36), 35.3).
fillpoint(r1, xy(756,327), 35.3).
fillpoint(r1, xy(762,327), 35.3).
fillpoint(r1, xy(458,35), 34.4).
fillpoint(r1, xy(513,79), 33.9).
fillpoint(r1, xy(512,77), 33.8).
fillpoint(r1, xy(514,81), 33.8).
fillpoint(r1, xy(454,34), 33.4).
fillpoint(r1, xy(329,202), 33.3).
fillpoint(r1, xy(466,251), 33.0).
fillpoint(r1, xy(395,191), 32.9).
fillpoint(r1, xy(393,196), 32.9).
fillpoint(r1, xy(394,194), 32.8).
fillpoint(r1, xy(449,33), 32.5).
fillpoint(r1, xy(571,33), 32.5).
fillpoint(r1, xy(325,205), 32.0).
fillpoint(r1, xy(323,206), 32.0).
fillpoint(r1, xy(318,208), 32.0).
fillpoint(r1, xy(316,209), 32.0).
fillpoint(r1, xy(321,207), 31.9).
fillpoint(r1, xy(445,32), 31.5).
fillpoint(r1, xy(439,32), 31.4).
fillpoint(r1, xy(435,31), 30.6).
fillpoint(r1, xy(460,258), 30.5).
fillpoint(r1, xy(260,305), 29.7).
fillpoint(r1, xy(431,30), 29.6).
fillpoint(r1, xy(257,307), 29.3).
fillpoint(r1, xy(388,53), 28.3).
fillpoint(r1, xy(252,310), 28.3).
fillpoint(r1, xy(387,55), 28.2).
fillpoint(r1, xy(390,49), 28.1).
fillpoint(r1, xy(332,182), 28.1).
fillpoint(r1, xy(330,187), 28.1).
fillpoint(r1, xy(391,47), 28.0).
fillpoint(r1, xy(331,185), 28.0).
fillpoint(r1, xy(392,45), 27.9).
fillpoint(r1, xy(389,51), 27.9).
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
opencv_morphology(r1, opening_area(310073), closing_area(313156), gradient_area(6838)).
opencv_shape_metrics(r1, contour_area(309424.5), hull_area(309639.0), solidity(0.999307), circularity(0.585689), extent(0.995395), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309424.5).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 4.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 2.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 6.0).
opencv_contour_hierarchy(r1, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r1, c5, hole, 4.0).
opencv_contour_hierarchy(r1, c5, next(c6), previous(c4), child(none), parent(c0)).
opencv_contour(r1, c6, hole, 4.0).
opencv_contour_hierarchy(r1, c6, next(c7), previous(c5), child(none), parent(c0)).
opencv_contour(r1, c7, hole, 23.0).
opencv_contour_hierarchy(r1, c7, next(c8), previous(c6), child(none), parent(c0)).
opencv_contour(r1, c8, hole, 4.0).
opencv_contour_hierarchy(r1, c8, next(c9), previous(c7), child(none), parent(c0)).
opencv_contour(r1, c9, hole, 7.0).
opencv_contour_hierarchy(r1, c9, next(c10), previous(c8), child(none), parent(c0)).
opencv_contour(r1, c10, hole, 2.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 72.5).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 2.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 6.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 4.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 4.0).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 6.0).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 4.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 6.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 4.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 4.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 6.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 7.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 4.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 7.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 4.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 2.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 10.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 10.0).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 2.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 7.0).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 2.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 8.5).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 2.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 2.0).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 2.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 10.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 2.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 2.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 2.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 6.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 6.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 2.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 2.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 10.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 4.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 2.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 2.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 11.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 2.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 7.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 9.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 2.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 7.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 2.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 7.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 9.0).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 2.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 2.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 4.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 2.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 4.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 7.5).
opencv_contour_hierarchy(r1, c65, next(c66), previous(c64), child(none), parent(c0)).
opencv_contour(r1, c66, hole, 4.0).
opencv_contour_hierarchy(r1, c66, next(c67), previous(c65), child(none), parent(c0)).
opencv_contour(r1, c67, hole, 2.0).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 4.0).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 2.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 2.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 2.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 13.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 4.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 25.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 2.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 2.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 9.5).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 2.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 16.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 4.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 12.5).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 18.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 8.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 6.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 2.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 8.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 4.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 18.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 20.5).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 2.0).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 2.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 29.5).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 7.0).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 9.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 7.0).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 8.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 2.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 2.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 2.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 2.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 30.0).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 17.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 9.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 6.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 2.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 12.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 2.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 20.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 4.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 7.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 2.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 2.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 11.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 2.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 2.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 5.5).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 4.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 2.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 2.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 2.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 2.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 2.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 2.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 4.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 4.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 9.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 11.5).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 2.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 2.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 5.5).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 2.0).
opencv_contour_hierarchy(r1, c131, next(c132), previous(c130), child(none), parent(c0)).
opencv_contour(r1, c132, hole, 2.0).
opencv_contour_hierarchy(r1, c132, next(c133), previous(c131), child(none), parent(c0)).
opencv_contour(r1, c133, hole, 20.5).
opencv_contour_hierarchy(r1, c133, next(c134), previous(c132), child(none), parent(c0)).
opencv_contour(r1, c134, hole, 6.0).
opencv_contour_hierarchy(r1, c134, next(c135), previous(c133), child(none), parent(c0)).
opencv_contour(r1, c135, hole, 9.0).
opencv_contour_hierarchy(r1, c135, next(c136), previous(c134), child(none), parent(c0)).
opencv_contour(r1, c136, hole, 2.0).
opencv_contour_hierarchy(r1, c136, next(c137), previous(c135), child(none), parent(c0)).
opencv_contour(r1, c137, hole, 4.0).
opencv_contour_hierarchy(r1, c137, next(c138), previous(c136), child(none), parent(c0)).
opencv_contour(r1, c138, hole, 6.0).
opencv_contour_hierarchy(r1, c138, next(c139), previous(c137), child(none), parent(c0)).
opencv_contour(r1, c139, hole, 2.0).
opencv_contour_hierarchy(r1, c139, next(c140), previous(c138), child(none), parent(c0)).
opencv_contour(r1, c140, hole, 4.0).
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
opencv_contour(r1, c156, hole, 4.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 2.0).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 2.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 2.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 2.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 2.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 4.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 4.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 10.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 4.0).
opencv_contour_hierarchy(r1, c165, next(c166), previous(c164), child(none), parent(c0)).
opencv_contour(r1, c166, hole, 13.5).
opencv_contour_hierarchy(r1, c166, next(c167), previous(c165), child(none), parent(c0)).
opencv_contour(r1, c167, hole, 2.0).
opencv_contour_hierarchy(r1, c167, next(c168), previous(c166), child(none), parent(c0)).
opencv_contour(r1, c168, hole, 2.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 2.0).
opencv_contour_hierarchy(r1, c169, next(c170), previous(c168), child(none), parent(c0)).
opencv_contour(r1, c170, hole, 2.0).
opencv_contour_hierarchy(r1, c170, next(c171), previous(c169), child(none), parent(c0)).
opencv_contour(r1, c171, hole, 4.0).
opencv_contour_hierarchy(r1, c171, next(c172), previous(c170), child(none), parent(c0)).
opencv_contour(r1, c172, hole, 2.0).
opencv_contour_hierarchy(r1, c172, next(c173), previous(c171), child(none), parent(c0)).
opencv_contour(r1, c173, hole, 4.0).
opencv_contour_hierarchy(r1, c173, next(c174), previous(c172), child(none), parent(c0)).
opencv_contour(r1, c174, hole, 2.0).
opencv_contour_hierarchy(r1, c174, next(c175), previous(c173), child(none), parent(c0)).
opencv_contour(r1, c175, hole, 2.0).
opencv_contour_hierarchy(r1, c175, next(c176), previous(c174), child(none), parent(c0)).
opencv_contour(r1, c176, hole, 2.0).
opencv_contour_hierarchy(r1, c176, next(c177), previous(c175), child(none), parent(c0)).
opencv_contour(r1, c177, hole, 30.5).
opencv_contour_hierarchy(r1, c177, next(c178), previous(c176), child(none), parent(c0)).
opencv_contour(r1, c178, hole, 2.0).
opencv_contour_hierarchy(r1, c178, next(c179), previous(c177), child(none), parent(c0)).
opencv_contour(r1, c179, hole, 2.0).
opencv_contour_hierarchy(r1, c179, next(c180), previous(c178), child(none), parent(c0)).
opencv_contour(r1, c180, hole, 2.0).
opencv_contour_hierarchy(r1, c180, next(c181), previous(c179), child(none), parent(c0)).
opencv_contour(r1, c181, hole, 19.0).
opencv_contour_hierarchy(r1, c181, next(c182), previous(c180), child(none), parent(c0)).
opencv_contour(r1, c182, hole, 4.0).
opencv_contour_hierarchy(r1, c182, next(c183), previous(c181), child(none), parent(c0)).
opencv_contour(r1, c183, hole, 2.0).
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
opencv_contour(r1, c190, hole, 2.0).
opencv_contour_hierarchy(r1, c190, next(c191), previous(c189), child(none), parent(c0)).
opencv_contour(r1, c191, hole, 2.0).
opencv_contour_hierarchy(r1, c191, next(c192), previous(c190), child(none), parent(c0)).
opencv_contour(r1, c192, hole, 4.0).
opencv_contour_hierarchy(r1, c192, next(c193), previous(c191), child(none), parent(c0)).
opencv_contour(r1, c193, hole, 12.0).
opencv_contour_hierarchy(r1, c193, next(c194), previous(c192), child(none), parent(c0)).
opencv_contour(r1, c194, hole, 4.0).
opencv_contour_hierarchy(r1, c194, next(c195), previous(c193), child(none), parent(c0)).
opencv_contour(r1, c195, hole, 4.0).
opencv_contour_hierarchy(r1, c195, next(none), previous(c194), child(none), parent(c0)).
