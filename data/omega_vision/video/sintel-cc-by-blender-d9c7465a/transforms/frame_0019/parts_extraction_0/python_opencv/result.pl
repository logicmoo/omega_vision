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

region(r1, '#5e5e5b', 310788, centroid(427,181)).
perimeter(r1, 2702).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(6,290),xy(8,290),xy(6,290)]).
hole(r1, [xy(14,285),xy(16,285),xy(14,285)]).
hole(r1, [xy(19,282),xy(21,282),xy(19,282)]).
hole(r1, [xy(24,279),xy(26,279),xy(24,279)]).
hole(r1, [xy(842,277),xy(844,277),xy(842,277)]).
hole(r1, [xy(840,276),xy(842,276),xy(840,276)]).
hole(r1, [xy(29,276),xy(31,276),xy(29,276)]).
hole(r1, [xy(833,272),xy(835,272),xy(833,272)]).
hole(r1, [xy(39,270),xy(41,270),xy(39,270)]).
hole(r1, [xy(44,267),xy(46,267),xy(44,267)]).
hole(r1, [xy(49,264),xy(51,264),xy(49,264)]).
hole(r1, [xy(54,261),xy(56,261),xy(54,261)]).
hole(r1, [xy(827,260),xy(829,260),xy(827,260)]).
hole(r1, [xy(59,258),xy(61,258),xy(59,258)]).
hole(r1, [xy(824,257),xy(826,257),xy(824,257)]).
hole(r1, [xy(823,256),xy(825,256),xy(823,256)]).
hole(r1, [xy(62,256),xy(64,256),xy(62,256)]).
hole(r1, [xy(64,255),xy(66,255),xy(64,255)]).
hole(r1, [xy(821,254),xy(823,254),xy(821,254)]).
hole(r1, [xy(820,253),xy(822,253),xy(820,253)]).
hole(r1, [xy(67,253),xy(69,253),xy(67,253)]).
hole(r1, [xy(69,252),xy(71,252),xy(69,252)]).
hole(r1, [xy(818,251),xy(820,251),xy(818,251)]).
hole(r1, [xy(817,250),xy(819,250),xy(817,250)]).
hole(r1, [xy(72,250),xy(74,250),xy(72,250)]).
hole(r1, [xy(74,249),xy(76,249),xy(74,249)]).
hole(r1, [xy(814,248),xy(816,248),xy(814,248)]).
hole(r1, [xy(813,247),xy(815,247),xy(813,247)]).
hole(r1, [xy(77,247),xy(79,247),xy(77,247)]).
hole(r1, [xy(79,246),xy(81,246),xy(79,246)]).
hole(r1, [xy(82,244),xy(84,244),xy(82,244)]).
hole(r1, [xy(84,243),xy(86,243),xy(84,243)]).
hole(r1, [xy(85,242),xy(87,242),xy(85,242)]).
hole(r1, [xy(87,241),xy(89,241),xy(87,241)]).
hole(r1, [xy(89,240),xy(91,240),xy(89,240)]).
hole(r1, [xy(92,238),xy(94,238),xy(92,238)]).
hole(r1, [xy(94,237),xy(96,237),xy(94,237)]).
hole(r1, [xy(97,235),xy(99,235),xy(97,235)]).
hole(r1, [xy(99,234),xy(101,234),xy(99,234)]).
hole(r1, [xy(102,232),xy(104,232),xy(102,232)]).
hole(r1, [xy(104,231),xy(106,231),xy(104,231)]).
hole(r1, [xy(109,228),xy(111,228),xy(109,228)]).
hole(r1, [xy(111,227),xy(113,227),xy(111,227)]).
hole(r1, [xy(114,225),xy(116,225),xy(114,225)]).
hole(r1, [xy(121,221),xy(123,221),xy(121,221)]).
hole(r1, [xy(128,217),xy(130,217),xy(128,217)]).
hole(r1, [xy(129,216),xy(132,216),xy(129,216)]).
hole(r1, [xy(131,215),xy(133,215),xy(131,215)]).
hole(r1, [xy(133,214),xy(135,214),xy(133,214)]).
hole(r1, [xy(136,212),xy(138,212),xy(136,212)]).
hole(r1, [xy(138,211),xy(140,211),xy(138,211)]).
hole(r1, [xy(139,210),xy(141,210),xy(139,210)]).
hole(r1, [xy(141,209),xy(143,209),xy(141,209)]).
hole(r1, [xy(142,208),xy(144,208),xy(142,208)]).
hole(r1, [xy(408,188),xy(410,188),xy(408,188)]).
hole(r1, [xy(407,187),xy(409,187),xy(407,187)]).
hole(r1, [xy(263,138),xy(265,138),xy(263,138)]).
hole(r1, [xy(265,137),xy(267,137),xy(265,137)]).
hole(r1, [xy(292,136),xy(294,136),xy(292,136)]).
hole(r1, [xy(267,136),xy(269,136),xy(267,136)]).
hole(r1, [xy(268,135),xy(270,135),xy(268,135)]).
hole(r1, [xy(269,134),xy(272,134),xy(269,134)]).
hole(r1, [xy(271,132),xy(273,133),xy(271,132)]).
hole(r1, [xy(273,131),xy(275,131),xy(273,131)]).
hole(r1, [xy(274,130),xy(276,130),xy(274,130)]).
midline(r1, [xy(67,282),xy(66,276),xy(29,275),xy(29,279),xy(24,278),xy(25,281),xy(19,281),xy(19,285),xy(14,284),xy(14,286),xy(16,286)]).
midline(r1, [xy(21,282),xy(21,283)]).
midline(r1, [xy(31,276),xy(31,277)]).
midline(r1, [xy(67,283),xy(72,290),xy(6,289),xy(6,291),xy(8,291)]).
midline(r1, [xy(67,276),xy(67,257),xy(64,255),xy(59,257),xy(59,261),xy(54,260),xy(54,264),xy(49,263),xy(49,267),xy(44,266),xy(44,270),xy(39,269),xy(39,271),xy(41,271)]).
midline(r1, [xy(64,254),xy(66,253),xy(65,151),xy(107,108),xy(164,108),xy(205,66),xy(336,66),xy(338,68),xy(274,130)]).
midline(r1, [xy(46,268),xy(46,267)]).
midline(r1, [xy(56,262),xy(56,261)]).
midline(r1, [xy(275,132),xy(276,130)]).
midline(r1, [xy(278,129),xy(340,68),xy(407,135),xy(292,135),xy(292,137),xy(294,137)]).
midline(r1, [xy(61,259),xy(64,257)]).
midline(r1, [xy(51,264),xy(51,265)]).
midline(r1, [xy(165,109),xy(187,132),xy(269,131),xy(385,247),xy(244,248),xy(202,206),xy(200,198),xy(199,154),xy(145,207),xy(142,207),xy(131,214),xy(131,215),xy(132,216),xy(133,215),xy(133,214),xy(133,216)]).
midline(r1, [xy(385,248),xy(445,190),xy(444,188),xy(411,188),xy(409,186),xy(407,186),xy(408,189),xy(409,187)]).
midline(r1, [xy(445,188),xy(453,181),xy(407,136)]).
midline(r1, [xy(135,215),xy(135,214),xy(137,213),xy(139,210),xy(140,211),xy(138,213)]).
midline(r1, [xy(200,154),xy(199,144),xy(188,133)]).
midline(r1, [xy(453,182),xy(671,181),xy(738,248),xy(813,246),xy(813,248),xy(815,249),xy(816,248),xy(814,246),xy(816,247)]).
midline(r1, [xy(26,280),xy(26,279)]).
midline(r1, [xy(67,256),xy(66,254),xy(69,251),xy(69,253),xy(67,254)]).
midline(r1, [xy(69,254),xy(72,251)]).
midline(r1, [xy(73,290),xy(204,289),xy(244,249)]).
midline(r1, [xy(140,212),xy(144,208)]).
midline(r1, [xy(146,207),xy(198,155)]).
midline(r1, [xy(74,251),xy(77,248)]).
midline(r1, [xy(79,248),xy(82,245)]).
midline(r1, [xy(84,245),xy(85,241),xy(87,240),xy(87,243),xy(86,244)]).
midline(r1, [xy(739,249),xy(763,273),xy(833,271),xy(833,273),xy(834,273),xy(835,272),xy(834,271),xy(835,271)]).
midline(r1, [xy(764,274),xy(766,276),xy(840,275),xy(840,277),xy(841,277),xy(842,275),xy(842,278),xy(843,278),xy(844,276)]).
midline(r1, [xy(253,149),xy(252,150)]).
midline(r1, [xy(118,225),xy(114,224),xy(107,230),xy(102,231),xy(89,239),xy(88,240),xy(89,240),xy(89,241),xy(88,242),xy(91,241)]).
midline(r1, [xy(108,230),xy(110,229),xy(111,228),xy(111,227),xy(111,229)]).
midline(r1, [xy(113,228),xy(116,226)]).
midline(r1, [xy(92,239),xy(93,239),xy(94,237),xy(94,239)]).
midline(r1, [xy(96,238),xy(96,237),xy(98,236),xy(99,235),xy(99,234),xy(99,236)]).
midline(r1, [xy(101,235),xy(101,234),xy(103,233),xy(104,231),xy(104,233)]).
midline(r1, [xy(106,232),xy(106,231)]).
midline(r1, [xy(265,136),xy(253,148),xy(264,139),xy(265,138),xy(265,137),xy(267,135),xy(267,137),xy(265,139)]).
midline(r1, [xy(267,138),xy(269,136),xy(268,134),xy(270,135),xy(269,137)]).
midline(r1, [xy(819,249),xy(816,249),xy(817,251),xy(819,252),xy(820,250)]).
midline(r1, [xy(823,255),xy(822,255),xy(820,253),xy(822,252),xy(824,255),xy(823,256),xy(823,257),xy(825,258),xy(826,256)]).
midline(r1, [xy(820,254),xy(821,255)]).
midline(r1, [xy(124,221),xy(121,220),xy(118,224),xy(123,222)]).
midline(r1, [xy(826,259),xy(827,261),xy(828,261),xy(829,260),xy(828,259),xy(829,259)]).
midline(r1, [xy(125,220),xy(128,216),xy(129,216),xy(130,218)]).
fillpoint(r1, xy(660,181), 173.8).
fillpoint(r1, xy(315,245), 112.8).
fillpoint(r1, xy(312,246), 112.7).
fillpoint(r1, xy(245,247), 111.7).
fillpoint(r1, xy(308,247), 111.7).
fillpoint(r1, xy(281,247), 111.0).
fillpoint(r1, xy(250,248), 110.8).
fillpoint(r1, xy(279,248), 110.8).
fillpoint(r1, xy(283,248), 110.8).
fillpoint(r1, xy(303,248), 110.8).
fillpoint(r1, xy(254,249), 109.8).
fillpoint(r1, xy(274,249), 109.8).
fillpoint(r1, xy(288,249), 109.8).
fillpoint(r1, xy(298,249), 109.8).
fillpoint(r1, xy(259,250), 108.9).
fillpoint(r1, xy(269,250), 108.9).
fillpoint(r1, xy(293,250), 108.9).
fillpoint(r1, xy(264,251), 107.9).
fillpoint(r1, xy(112,110), 106.0).
fillpoint(r1, xy(117,109), 105.1).
fillpoint(r1, xy(483,109), 105.1).
fillpoint(r1, xy(167,109), 104.5).
fillpoint(r1, xy(122,108), 104.1).
fillpoint(r1, xy(165,108), 104.1).
fillpoint(r1, xy(478,108), 104.1).
fillpoint(r1, xy(126,107), 103.1).
fillpoint(r1, xy(160,107), 103.1).
fillpoint(r1, xy(473,107), 103.1).
fillpoint(r1, xy(131,106), 102.2).
fillpoint(r1, xy(155,106), 102.2).
fillpoint(r1, xy(469,106), 102.2).
fillpoint(r1, xy(136,105), 101.2).
fillpoint(r1, xy(151,105), 101.2).
fillpoint(r1, xy(464,105), 101.2).
fillpoint(r1, xy(140,104), 100.3).
fillpoint(r1, xy(146,104), 100.3).
fillpoint(r1, xy(460,104), 100.3).
fillpoint(r1, xy(455,103), 99.3).
fillpoint(r1, xy(450,102), 98.4).
fillpoint(r1, xy(339,261), 98.4).
fillpoint(r1, xy(479,261), 98.4).
fillpoint(r1, xy(446,101), 97.4).
fillpoint(r1, xy(344,262), 97.4).
fillpoint(r1, xy(474,262), 97.4).
fillpoint(r1, xy(441,100), 96.5).
fillpoint(r1, xy(349,263), 96.5).
fillpoint(r1, xy(470,263), 96.5).
fillpoint(r1, xy(380,99), 95.5).
fillpoint(r1, xy(436,99), 95.5).
fillpoint(r1, xy(378,100), 95.5).
fillpoint(r1, xy(353,264), 95.5).
fillpoint(r1, xy(465,264), 95.5).
fillpoint(r1, xy(384,98), 94.5).
fillpoint(r1, xy(432,98), 94.5).
fillpoint(r1, xy(358,265), 94.5).
fillpoint(r1, xy(461,265), 94.5).
fillpoint(r1, xy(389,97), 93.6).
fillpoint(r1, xy(427,97), 93.6).
fillpoint(r1, xy(362,266), 93.6).
fillpoint(r1, xy(456,266), 93.6).
fillpoint(r1, xy(394,96), 92.6).
fillpoint(r1, xy(423,96), 92.6).
fillpoint(r1, xy(367,267), 92.6).
fillpoint(r1, xy(451,267), 92.6).
fillpoint(r1, xy(398,95), 91.7).
fillpoint(r1, xy(418,95), 91.7).
fillpoint(r1, xy(372,268), 91.7).
fillpoint(r1, xy(447,268), 91.7).
fillpoint(r1, xy(403,94), 90.7).
fillpoint(r1, xy(413,94), 90.7).
fillpoint(r1, xy(376,269), 90.7).
fillpoint(r1, xy(442,269), 90.7).
fillpoint(r1, xy(408,93), 89.8).
fillpoint(r1, xy(381,270), 89.8).
fillpoint(r1, xy(437,270), 89.8).
fillpoint(r1, xy(385,271), 88.8).
fillpoint(r1, xy(433,271), 88.8).
fillpoint(r1, xy(390,272), 87.9).
fillpoint(r1, xy(428,272), 87.9).
fillpoint(r1, xy(395,273), 86.9).
fillpoint(r1, xy(424,273), 86.9).
fillpoint(r1, xy(399,274), 86.0).
fillpoint(r1, xy(419,274), 86.0).
fillpoint(r1, xy(198,275), 85.0).
fillpoint(r1, xy(404,275), 85.0).
fillpoint(r1, xy(414,275), 85.0).
fillpoint(r1, xy(194,276), 84.0).
fillpoint(r1, xy(409,276), 84.0).
fillpoint(r1, xy(187,278), 82.1).
fillpoint(r1, xy(183,279), 81.2).
fillpoint(r1, xy(176,281), 79.3).
fillpoint(r1, xy(210,80), 77.4).
fillpoint(r1, xy(169,283), 77.4).
fillpoint(r1, xy(347,79), 76.4).
fillpoint(r1, xy(166,284), 76.4).
fillpoint(r1, xy(216,78), 75.4).
fillpoint(r1, xy(342,78), 75.4).
fillpoint(r1, xy(162,285), 75.4).
fillpoint(r1, xy(338,77), 74.5).
fillpoint(r1, xy(333,76), 73.5).
fillpoint(r1, xy(155,287), 73.5).
fillpoint(r1, xy(226,75), 72.6).
fillpoint(r1, xy(328,75), 72.6).
fillpoint(r1, xy(75,165), 72.6).
fillpoint(r1, xy(152,288), 72.6).
fillpoint(r1, xy(197,158), 72.3).
fillpoint(r1, xy(210,188), 72.3).
fillpoint(r1, xy(196,156), 72.2).
fillpoint(r1, xy(200,165), 72.2).
fillpoint(r1, xy(201,167), 72.2).
fillpoint(r1, xy(203,172), 72.2).
fillpoint(r1, xy(204,174), 72.2).
fillpoint(r1, xy(206,179), 72.2).
fillpoint(r1, xy(207,181), 72.2).
fillpoint(r1, xy(211,190), 72.2).
fillpoint(r1, xy(198,160), 72.1).
fillpoint(r1, xy(199,163), 72.1).
fillpoint(r1, xy(202,170), 72.1).
fillpoint(r1, xy(205,176), 72.1).
fillpoint(r1, xy(208,183), 72.1).
fillpoint(r1, xy(209,186), 72.1).
fillpoint(r1, xy(231,74), 71.6).
fillpoint(r1, xy(324,74), 71.6).
fillpoint(r1, xy(235,73), 70.7).
fillpoint(r1, xy(319,73), 70.7).
fillpoint(r1, xy(144,290), 70.7).
fillpoint(r1, xy(240,72), 69.7).
fillpoint(r1, xy(315,72), 69.7).
fillpoint(r1, xy(245,71), 68.8).
fillpoint(r1, xy(310,71), 68.8).
fillpoint(r1, xy(71,172), 68.8).
fillpoint(r1, xy(137,292), 68.8).
fillpoint(r1, xy(249,70), 67.8).
fillpoint(r1, xy(305,70), 67.8).
fillpoint(r1, xy(254,69), 66.9).
fillpoint(r1, xy(301,69), 66.9).
fillpoint(r1, xy(130,294), 66.9).
fillpoint(r1, xy(258,68), 65.9).
fillpoint(r1, xy(296,68), 65.9).
fillpoint(r1, xy(127,295), 65.9).
fillpoint(r1, xy(291,68), 65.8).
fillpoint(r1, xy(352,158), 65.5).
fillpoint(r1, xy(349,165), 65.5).
fillpoint(r1, xy(359,142), 65.4).
fillpoint(r1, xy(358,144), 65.4).
fillpoint(r1, xy(356,149), 65.4).
fillpoint(r1, xy(355,151), 65.4).
fillpoint(r1, xy(353,156), 65.4).
fillpoint(r1, xy(348,167), 65.4).
fillpoint(r1, xy(346,172), 65.4).
fillpoint(r1, xy(345,174), 65.4).
fillpoint(r1, xy(343,179), 65.4).
fillpoint(r1, xy(342,181), 65.4).
fillpoint(r1, xy(360,140), 65.3).
fillpoint(r1, xy(357,147), 65.3).
fillpoint(r1, xy(354,153), 65.3).
fillpoint(r1, xy(351,160), 65.3).
fillpoint(r1, xy(350,163), 65.3).
fillpoint(r1, xy(347,170), 65.3).
fillpoint(r1, xy(344,176), 65.3).
fillpoint(r1, xy(341,183), 65.3).
fillpoint(r1, xy(263,67), 64.9).
fillpoint(r1, xy(287,67), 64.9).
fillpoint(r1, xy(123,296), 64.9).
fillpoint(r1, xy(268,66), 64.0).
fillpoint(r1, xy(283,66), 64.0).
fillpoint(r1, xy(120,297), 64.0).
fillpoint(r1, xy(272,65), 63.0).
fillpoint(r1, xy(278,65), 63.0).
fillpoint(r1, xy(774,298), 63.0).
fillpoint(r1, xy(112,299), 62.1).
fillpoint(r1, xy(105,301), 60.2).
fillpoint(r1, xy(102,302), 59.2).
fillpoint(r1, xy(98,303), 58.3).
fillpoint(r1, xy(95,304), 57.3).
fillpoint(r1, xy(88,306), 55.4).
fillpoint(r1, xy(80,308), 53.5).
fillpoint(r1, xy(77,309), 52.5).
fillpoint(r1, xy(73,310), 51.6).
fillpoint(r1, xy(68,311), 50.6).
fillpoint(r1, xy(801,311), 50.6).
fillpoint(r1, xy(63,313), 48.7).
fillpoint(r1, xy(56,315), 46.8).
fillpoint(r1, xy(45,216), 43.9).
fillpoint(r1, xy(46,318), 43.9).
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
opencv_morphology(r1, opening_area(310782), closing_area(313284), gradient_area(5174)).
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
opencv_contour(r1, c62, hole, 4.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 4.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 2.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 2.0).
opencv_contour_hierarchy(r1, c65, next(none), previous(c64), child(none), parent(c0)).
