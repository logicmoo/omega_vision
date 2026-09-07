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

region(r1, '#929594', 310721, centroid(426,181)).
perimeter(r1, 2932).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(779,356),xy(782,356),xy(779,356)]).
hole(r1, [xy(781,355),xy(783,355),xy(781,355)]).
hole(r1, [xy(782,354),xy(784,354),xy(782,354)]).
hole(r1, [xy(758,330),xy(760,330),xy(758,330)]).
hole(r1, [xy(756,328),xy(758,329),xy(756,328)]).
hole(r1, [xy(754,327),xy(756,327),xy(754,327)]).
hole(r1, [xy(753,321),xy(755,321),xy(753,321)]).
hole(r1, [xy(754,320),xy(756,320),xy(754,320)]).
hole(r1, [xy(758,317),xy(760,317),xy(758,317)]).
hole(r1, [xy(762,314),xy(764,314),xy(762,314)]).
hole(r1, [xy(764,313),xy(766,313),xy(764,313)]).
hole(r1, [xy(765,312),xy(767,312),xy(765,312)]).
hole(r1, [xy(766,311),xy(768,311),xy(766,311)]).
hole(r1, [xy(775,305),xy(777,305),xy(775,305)]).
hole(r1, [xy(779,302),xy(781,302),xy(779,302)]).
hole(r1, [xy(837,301),xy(839,301),xy(837,301)]).
hole(r1, [xy(780,301),xy(782,301),xy(780,301)]).
hole(r1, [xy(838,300),xy(840,300),xy(838,300)]).
hole(r1, [xy(781,300),xy(783,300),xy(781,300)]).
hole(r1, [xy(782,299),xy(784,299),xy(782,299)]).
hole(r1, [xy(783,298),xy(785,298),xy(783,298)]).
hole(r1, [xy(784,297),xy(786,297),xy(784,297)]).
hole(r1, [xy(812,296),xy(814,296),xy(812,296)]).
hole(r1, [xy(785,296),xy(787,296),xy(785,296)]).
hole(r1, [xy(811,295),xy(813,295),xy(811,295)]).
hole(r1, [xy(786,295),xy(788,295),xy(786,295)]).
hole(r1, [xy(809,294),xy(812,294),xy(809,294)]).
hole(r1, [xy(787,294),xy(789,294),xy(787,294)]).
hole(r1, [xy(788,293),xy(790,293),xy(788,293)]).
hole(r1, [xy(789,292),xy(792,292),xy(789,292)]).
hole(r1, [xy(802,291),xy(804,291),xy(802,291)]).
hole(r1, [xy(791,291),xy(793,291),xy(791,291)]).
hole(r1, [xy(372,263),xy(374,263),xy(372,263)]).
hole(r1, [xy(371,259),xy(373,259),xy(371,259)]).
hole(r1, [xy(367,257),xy(369,257),xy(367,257)]).
hole(r1, [xy(363,249),xy(365,250),xy(363,249)]).
hole(r1, [xy(359,247),xy(361,247),xy(359,247)]).
hole(r1, [xy(358,246),xy(360,246),xy(358,246)]).
hole(r1, [xy(339,246),xy(341,246),xy(339,246)]).
hole(r1, [xy(357,245),xy(359,245),xy(357,245)]).
hole(r1, [xy(328,243),xy(331,243),xy(328,243)]).
hole(r1, [xy(327,242),xy(329,242),xy(327,242)]).
hole(r1, [xy(758,241),xy(760,241),xy(758,241)]).
hole(r1, [xy(755,240),xy(757,240),xy(755,240)]).
hole(r1, [xy(751,239),xy(753,239),xy(751,239)]).
hole(r1, [xy(414,239),xy(416,239),xy(414,239)]).
hole(r1, [xy(747,238),xy(750,238),xy(747,238)]).
hole(r1, [xy(744,237),xy(747,237),xy(744,237)]).
hole(r1, [xy(741,236),xy(744,236),xy(741,236)]).
hole(r1, [xy(325,236),xy(329,237),xy(325,236)]).
hole(r1, [xy(738,235),xy(741,235),xy(738,235)]).
hole(r1, [xy(324,235),xy(326,235),xy(324,235)]).
hole(r1, [xy(731,233),xy(733,233),xy(731,233)]).
hole(r1, [xy(727,232),xy(730,232),xy(727,232)]).
hole(r1, [xy(725,231),xy(727,231),xy(725,231)]).
hole(r1, [xy(722,230),xy(724,230),xy(722,230)]).
hole(r1, [xy(317,230),xy(319,230),xy(317,230)]).
hole(r1, [xy(702,221),xy(704,221),xy(702,221)]).
hole(r1, [xy(284,219),xy(286,219),xy(284,219)]).
hole(r1, [xy(700,218),xy(702,218),xy(700,218)]).
hole(r1, [xy(699,217),xy(701,217),xy(699,217)]).
hole(r1, [xy(698,216),xy(700,216),xy(698,216)]).
hole(r1, [xy(692,216),xy(694,216),xy(692,216)]).
hole(r1, [xy(689,216),xy(692,217),xy(690,218),xy(689,216)]).
hole(r1, [xy(353,213),xy(355,213),xy(353,213)]).
hole(r1, [xy(347,207),xy(349,207),xy(347,207)]).
hole(r1, [xy(333,207),xy(335,207),xy(333,207)]).
hole(r1, [xy(214,191),xy(216,191),xy(214,191)]).
hole(r1, [xy(187,191),xy(189,191),xy(187,191)]).
hole(r1, [xy(213,190),xy(215,190),xy(213,190)]).
hole(r1, [xy(211,189),xy(214,189),xy(211,189)]).
hole(r1, [xy(210,188),xy(212,188),xy(210,188)]).
hole(r1, [xy(626,187),xy(628,187),xy(626,187)]).
hole(r1, [xy(625,186),xy(627,186),xy(625,186)]).
hole(r1, [xy(209,186),xy(211,187),xy(209,186)]).
hole(r1, [xy(624,184),xy(626,184),xy(624,184)]).
hole(r1, [xy(207,184),xy(209,184),xy(207,184)]).
hole(r1, [xy(206,183),xy(208,183),xy(206,183)]).
hole(r1, [xy(205,182),xy(207,182),xy(205,182)]).
hole(r1, [xy(204,181),xy(206,181),xy(204,181)]).
hole(r1, [xy(203,180),xy(205,180),xy(203,180)]).
hole(r1, [xy(202,179),xy(204,179),xy(202,179)]).
hole(r1, [xy(124,178),xy(126,178),xy(124,178)]).
hole(r1, [xy(200,176),xy(202,176),xy(200,176)]).
hole(r1, [xy(126,176),xy(128,176),xy(126,176)]).
hole(r1, [xy(251,174),xy(253,174),xy(251,174)]).
hole(r1, [xy(188,167),xy(190,167),xy(188,167)]).
hole(r1, [xy(210,166),xy(212,166),xy(210,166)]).
hole(r1, [xy(187,166),xy(189,166),xy(187,166)]).
hole(r1, [xy(229,165),xy(231,165),xy(229,165)]).
hole(r1, [xy(209,165),xy(211,165),xy(209,165)]).
hole(r1, [xy(186,165),xy(188,165),xy(186,165)]).
hole(r1, [xy(614,164),xy(616,164),xy(614,164)]).
hole(r1, [xy(208,164),xy(210,164),xy(208,164)]).
hole(r1, [xy(185,164),xy(187,164),xy(185,164)]).
hole(r1, [xy(151,164),xy(153,164),xy(151,164)]).
hole(r1, [xy(613,163),xy(615,163),xy(613,163)]).
hole(r1, [xy(184,163),xy(186,163),xy(184,163)]).
hole(r1, [xy(183,162),xy(185,162),xy(183,162)]).
hole(r1, [xy(154,162),xy(156,162),xy(154,162)]).
hole(r1, [xy(182,161),xy(184,161),xy(182,161)]).
hole(r1, [xy(155,161),xy(157,161),xy(155,161)]).
hole(r1, [xy(179,157),xy(181,157),xy(179,157)]).
hole(r1, [xy(175,157),xy(177,157),xy(175,157)]).
hole(r1, [xy(437,155),xy(438,157),xy(435,159),xy(437,155)]).
hole(r1, [xy(178,156),xy(180,156),xy(178,156)]).
hole(r1, [xy(168,156),xy(170,156),xy(168,156)]).
hole(r1, [xy(437,155),xy(439,155),xy(437,155)]).
hole(r1, [xy(177,155),xy(179,155),xy(177,155)]).
hole(r1, [xy(176,154),xy(178,154),xy(176,154)]).
hole(r1, [xy(439,153),xy(441,153),xy(439,153)]).
hole(r1, [xy(441,150),xy(443,150),xy(441,150)]).
hole(r1, [xy(442,149),xy(444,149),xy(442,149)]).
midline(r1, [xy(293,100),xy(231,164)]).
midline(r1, [xy(232,162),xy(298,96),xy(298,93),xy(121,93),xy(105,103),xy(104,258),xy(121,275),xy(240,275),xy(263,300),xy(267,299),xy(269,303),xy(304,302),xy(307,307),xy(412,307),xy(414,305),xy(372,263),xy(367,257),xy(367,256),xy(369,257)]).
midline(r1, [xy(299,93),xy(299,95)]).
midline(r1, [xy(121,94),xy(118,97),xy(176,153),xy(175,158),xy(177,157),xy(177,155),xy(177,158)]).
midline(r1, [xy(105,178),xy(124,177),xy(125,179),xy(126,178),xy(126,175),xy(128,175),xy(128,176),xy(127,177),xy(126,177)]).
midline(r1, [xy(209,94),xy(208,165),xy(210,167),xy(211,167),xy(212,166),xy(209,163),xy(212,165)]).
midline(r1, [xy(414,306),xy(423,305),xy(466,260),xy(410,204),xy(390,204),xy(382,197),xy(349,230),xy(347,245),xy(339,245),xy(339,247),xy(341,247)]).
midline(r1, [xy(347,246),xy(347,259),xy(305,301),xy(346,261)]).
midline(r1, [xy(382,198),xy(350,230)]).
midline(r1, [xy(105,191),xy(187,190),xy(187,192),xy(188,192),xy(189,191),xy(188,190),xy(189,190)]).
midline(r1, [xy(467,261),xy(539,261),xy(562,239),xy(563,125),xy(517,79),xy(511,78),xy(356,78),xy(324,110),xy(308,94),xy(301,94)]).
midline(r1, [xy(563,238),xy(616,290),xy(656,289),xy(663,298),xy(674,298),xy(733,239),xy(731,233),xy(733,232),xy(733,234)]).
midline(r1, [xy(675,299),xy(693,298),xy(739,346),xy(764,345),xy(777,360),xy(783,360),xy(814,330),xy(813,327),xy(808,325),xy(788,325),xy(773,307),xy(766,304),xy(744,282),xy(707,284),xy(694,298),xy(707,285)]).
midline(r1, [xy(720,284),xy(753,317),xy(751,323),xy(754,328),xy(755,328),xy(756,326)]).
midline(r1, [xy(356,79),xy(324,111),xy(324,124),xy(274,174),xy(251,173),xy(251,175),xy(253,175)]).
midline(r1, [xy(741,281),xy(741,225),xy(739,224),xy(734,232)]).
midline(r1, [xy(736,228),xy(739,225)]).
midline(r1, [xy(815,329),xy(820,328),xy(829,319),xy(830,313),xy(812,297)]).
midline(r1, [xy(113,98),xy(111,100),xy(168,157),xy(169,157),xy(170,155)]).
midline(r1, [xy(105,164),xy(151,163),xy(151,165),xy(152,165),xy(155,160),xy(157,161),xy(155,163),xy(154,163)]).
midline(r1, [xy(156,163),xy(157,162)]).
midline(r1, [xy(374,264),xy(374,262)]).
midline(r1, [xy(348,237),xy(359,248),xy(361,247),xy(358,244),xy(361,246)]).
midline(r1, [xy(564,163),xy(613,162),xy(614,165),xy(615,165),xy(616,164),xy(614,162),xy(616,163)]).
midline(r1, [xy(108,101),xy(106,103)]).
midline(r1, [xy(564,185),xy(623,185),xy(624,183),xy(626,183),xy(625,187),xy(627,188),xy(628,187),xy(626,185),xy(628,186)]).
midline(r1, [xy(744,281),xy(744,223),xy(742,223)]).
midline(r1, [xy(444,239),xy(414,238),xy(414,240),xy(416,240)]).
midline(r1, [xy(383,196),xy(381,188),xy(357,212),xy(353,212),xy(353,214),xy(355,213),xy(355,215),xy(330,240),xy(323,243),xy(268,299),xy(323,244)]).
midline(r1, [xy(332,239),xy(355,216)]).
midline(r1, [xy(358,212),xy(381,189)]).
midline(r1, [xy(759,298),xy(758,318),xy(759,318),xy(760,316)]).
midline(r1, [xy(381,187),xy(381,181),xy(325,125),xy(275,174)]).
midline(r1, [xy(334,135),xy(333,208),xy(334,208),xy(335,207),xy(334,206),xy(335,206)]).
midline(r1, [xy(348,149),xy(347,208),xy(348,208),xy(349,207),xy(348,206),xy(349,206)]).
midline(r1, [xy(329,241),xy(329,242),xy(328,243),xy(327,242),xy(327,243)]).
midline(r1, [xy(231,166),xy(231,167),xy(210,188),xy(210,189),xy(126,273),xy(126,274),xy(212,188),xy(231,168)]).
midline(r1, [xy(766,305),xy(766,310),xy(762,313),xy(762,315),xy(763,315),xy(764,313),xy(767,310),xy(768,311),xy(764,315)]).
midline(r1, [xy(768,312),xy(766,314)]).
midline(r1, [xy(761,205),xy(745,221)]).
midline(r1, [xy(439,154),xy(437,154),xy(437,155),xy(439,156)]).
midline(r1, [xy(776,190),xy(747,220),xy(746,283),xy(763,266),xy(775,265),xy(779,260),xy(762,242),xy(757,239),xy(751,238),xy(751,240),xy(753,240)]).
midline(r1, [xy(779,261),xy(799,243),xy(799,285),xy(794,290),xy(791,290),xy(791,291),xy(793,292)]).
midline(r1, [xy(763,204),xy(791,176),xy(791,169),xy(771,149),xy(710,210),xy(709,219),xy(703,220),xy(701,219),xy(697,215),xy(692,215),xy(692,217),xy(694,217)]).
midline(r1, [xy(700,219),xy(698,217)]).
midline(r1, [xy(711,210),xy(771,150)]).
midline(r1, [xy(795,290),xy(800,287),xy(800,301),xy(784,317),xy(799,303)]).
midline(r1, [xy(702,220),xy(702,222),xy(704,222)]).
midline(r1, [xy(771,148),xy(771,134),xy(745,108),xy(580,108),xy(564,125),xy(580,109)]).
midline(r1, [xy(792,176),xy(801,185),xy(800,243),xy(802,242),xy(832,272),xy(832,312)]).
midline(r1, [xy(833,301),xy(837,300),xy(837,302),xy(838,302),xy(839,301),xy(838,299),xy(840,299),xy(839,302)]).
midline(r1, [xy(698,215),xy(700,215),xy(702,218)]).
midline(r1, [xy(760,242),xy(755,241)]).
midline(r1, [xy(758,242),xy(757,241)]).
midline(r1, [xy(760,330),xy(759,329),xy(758,329),xy(758,331),xy(761,331),xy(770,340),xy(766,344)]).
midline(r1, [xy(769,342),xy(774,340),xy(788,326)]).
midline(r1, [xy(683,263),xy(682,264)]).
midline(r1, [xy(270,215),xy(270,185),xy(273,176)]).
midline(r1, [xy(270,216),xy(270,241),xy(267,243),xy(214,192)]).
midline(r1, [xy(271,219),xy(284,218),xy(285,220),xy(286,218)]).
midline(r1, [xy(269,243),xy(268,247),xy(241,274),xy(267,249)]).
midline(r1, [xy(271,185),xy(317,231),xy(318,231),xy(319,230),xy(318,229),xy(319,229)]).
midline(r1, [xy(319,231),xy(324,236),xy(325,236),xy(326,234)]).
midline(r1, [xy(183,160),xy(179,158)]).
midline(r1, [xy(182,158),xy(177,153),xy(181,156)]).
midline(r1, [xy(182,160),xy(182,162),xy(188,168),xy(190,167),xy(184,160),xy(200,174),xy(200,177),xy(201,177),xy(202,175)]).
midline(r1, [xy(478,113),xy(441,149),xy(439,152),xy(439,153),xy(440,154),xy(443,150),xy(442,149)]).
midline(r1, [xy(443,151),xy(512,80)]).
midline(r1, [xy(205,183),xy(202,180),xy(202,177),xy(204,178),xy(203,180),xy(204,181),xy(206,180),xy(205,182),xy(207,185),xy(208,185),xy(209,184),xy(207,181),xy(209,183)]).
midline(r1, [xy(724,231),xy(723,231),xy(720,229),xy(710,219),xy(709,236),xy(683,262),xy(709,237)]).
midline(r1, [xy(722,229),xy(724,229),xy(725,232),xy(726,232),xy(727,231),xy(726,230),xy(727,230)]).
midline(r1, [xy(793,344),xy(781,354),xy(781,355),xy(783,356),xy(810,328)]).
midline(r1, [xy(813,294),xy(814,296)]).
midline(r1, [xy(779,301),xy(774,306),xy(777,306)]).
midline(r1, [xy(778,304),xy(781,302),xy(780,300),xy(788,292),xy(790,293),xy(781,303)]).
midline(r1, [xy(790,294),xy(783,301)]).
midline(r1, [xy(756,321),xy(755,321),xy(754,320),xy(753,321),xy(753,322),xy(755,322)]).
midline(r1, [xy(754,319),xy(756,319),xy(756,320)]).
midline(r1, [xy(804,291),xy(803,290),xy(801,291),xy(804,292)]).
midline(r1, [xy(216,191),xy(214,189),xy(216,190)]).
midline(r1, [xy(373,259),xy(371,258),xy(371,259),xy(373,260)]).
fillpoint(r1, xy(531,245), 113.2).
fillpoint(r1, xy(737,116), 111.2).
fillpoint(r1, xy(734,115), 110.8).
fillpoint(r1, xy(527,230), 110.7).
fillpoint(r1, xy(528,232), 110.7).
fillpoint(r1, xy(530,237), 110.7).
fillpoint(r1, xy(526,228), 110.6).
fillpoint(r1, xy(529,234), 110.6).
fillpoint(r1, xy(730,114), 109.8).
fillpoint(r1, xy(725,113), 108.9).
fillpoint(r1, xy(721,112), 107.9).
fillpoint(r1, xy(716,111), 107.0).
fillpoint(r1, xy(711,110), 106.0).
fillpoint(r1, xy(707,109), 105.1).
fillpoint(r1, xy(702,108), 104.1).
fillpoint(r1, xy(532,106), 101.9).
fillpoint(r1, xy(328,104), 100.3).
fillpoint(r1, xy(339,104), 100.3).
fillpoint(r1, xy(343,104), 100.3).
fillpoint(r1, xy(353,104), 100.3).
fillpoint(r1, xy(341,105), 100.3).
fillpoint(r1, xy(334,103), 99.3).
fillpoint(r1, xy(348,103), 99.3).
fillpoint(r1, xy(560,261), 98.4).
fillpoint(r1, xy(320,101), 97.4).
fillpoint(r1, xy(564,262), 97.4).
fillpoint(r1, xy(315,100), 96.5).
fillpoint(r1, xy(569,263), 96.5).
fillpoint(r1, xy(310,99), 95.5).
fillpoint(r1, xy(573,264), 95.5).
fillpoint(r1, xy(306,98), 94.5).
fillpoint(r1, xy(578,265), 94.5).
fillpoint(r1, xy(98,265), 94.3).
fillpoint(r1, xy(301,97), 93.6).
fillpoint(r1, xy(101,266), 93.6).
fillpoint(r1, xy(583,266), 93.6).
fillpoint(r1, xy(297,96), 92.6).
fillpoint(r1, xy(106,267), 92.6).
fillpoint(r1, xy(587,267), 92.6).
fillpoint(r1, xy(292,95), 91.7).
fillpoint(r1, xy(549,95), 91.7).
fillpoint(r1, xy(679,95), 91.7).
fillpoint(r1, xy(111,268), 91.7).
fillpoint(r1, xy(142,268), 91.7).
fillpoint(r1, xy(592,268), 91.7).
fillpoint(r1, xy(287,94), 90.7).
fillpoint(r1, xy(554,94), 90.7).
fillpoint(r1, xy(675,94), 90.7).
fillpoint(r1, xy(115,269), 90.7).
fillpoint(r1, xy(135,269), 90.7).
fillpoint(r1, xy(148,269), 90.7).
fillpoint(r1, xy(597,269), 90.7).
fillpoint(r1, xy(95,93), 89.8).
fillpoint(r1, xy(283,93), 89.8).
fillpoint(r1, xy(558,93), 89.8).
fillpoint(r1, xy(670,93), 89.8).
fillpoint(r1, xy(120,270), 89.8).
fillpoint(r1, xy(130,270), 89.8).
fillpoint(r1, xy(153,270), 89.8).
fillpoint(r1, xy(601,270), 89.8).
fillpoint(r1, xy(100,92), 88.8).
fillpoint(r1, xy(278,92), 88.8).
fillpoint(r1, xy(563,92), 88.8).
fillpoint(r1, xy(666,92), 88.8).
fillpoint(r1, xy(125,271), 88.8).
fillpoint(r1, xy(158,271), 88.8).
fillpoint(r1, xy(606,271), 88.8).
fillpoint(r1, xy(105,91), 87.9).
fillpoint(r1, xy(274,91), 87.9).
fillpoint(r1, xy(567,91), 87.9).
fillpoint(r1, xy(661,91), 87.9).
fillpoint(r1, xy(162,272), 87.9).
fillpoint(r1, xy(610,272), 87.9).
fillpoint(r1, xy(109,90), 86.9).
fillpoint(r1, xy(269,90), 86.9).
fillpoint(r1, xy(572,90), 86.9).
fillpoint(r1, xy(656,90), 86.9).
fillpoint(r1, xy(167,273), 86.9).
fillpoint(r1, xy(615,273), 86.9).
fillpoint(r1, xy(114,89), 86.0).
fillpoint(r1, xy(264,89), 86.0).
fillpoint(r1, xy(577,89), 86.0).
fillpoint(r1, xy(652,89), 86.0).
fillpoint(r1, xy(171,274), 86.0).
fillpoint(r1, xy(620,274), 86.0).
fillpoint(r1, xy(119,88), 85.0).
fillpoint(r1, xy(260,88), 85.0).
fillpoint(r1, xy(581,88), 85.0).
fillpoint(r1, xy(647,88), 85.0).
fillpoint(r1, xy(176,275), 85.0).
fillpoint(r1, xy(202,275), 85.0).
fillpoint(r1, xy(624,275), 85.0).
fillpoint(r1, xy(531,150), 84.5).
fillpoint(r1, xy(529,155), 84.5).
fillpoint(r1, xy(528,157), 84.5).
fillpoint(r1, xy(526,162), 84.5).
fillpoint(r1, xy(530,153), 84.4).
fillpoint(r1, xy(527,159), 84.4).
fillpoint(r1, xy(123,87), 84.0).
fillpoint(r1, xy(255,87), 84.0).
fillpoint(r1, xy(383,87), 84.0).
fillpoint(r1, xy(503,87), 84.0).
fillpoint(r1, xy(586,87), 84.0).
fillpoint(r1, xy(642,87), 84.0).
fillpoint(r1, xy(181,276), 84.0).
fillpoint(r1, xy(196,276), 84.0).
fillpoint(r1, xy(208,276), 84.0).
fillpoint(r1, xy(222,276), 83.8).
fillpoint(r1, xy(251,87), 83.2).
fillpoint(r1, xy(128,86), 83.1).
fillpoint(r1, xy(249,86), 83.1).
fillpoint(r1, xy(387,86), 83.1).
fillpoint(r1, xy(499,86), 83.1).
fillpoint(r1, xy(590,86), 83.1).
fillpoint(r1, xy(638,86), 83.1).
fillpoint(r1, xy(185,277), 83.1).
fillpoint(r1, xy(191,277), 83.1).
fillpoint(r1, xy(212,277), 83.1).
fillpoint(r1, xy(218,277), 83.1).
fillpoint(r1, xy(132,85), 82.1).
fillpoint(r1, xy(245,85), 82.1).
fillpoint(r1, xy(392,85), 82.1).
fillpoint(r1, xy(495,85), 82.1).
fillpoint(r1, xy(595,85), 82.1).
fillpoint(r1, xy(633,85), 82.1).
fillpoint(r1, xy(632,278), 82.1).
fillpoint(r1, xy(137,84), 81.2).
fillpoint(r1, xy(240,84), 81.2).
fillpoint(r1, xy(396,84), 81.2).
fillpoint(r1, xy(490,84), 81.2).
fillpoint(r1, xy(600,84), 81.2).
fillpoint(r1, xy(629,84), 81.2).
fillpoint(r1, xy(227,279), 81.2).
fillpoint(r1, xy(636,279), 81.2).
fillpoint(r1, xy(221,84), 81.1).
fillpoint(r1, xy(142,83), 80.2).
fillpoint(r1, xy(217,83), 80.2).
fillpoint(r1, xy(225,83), 80.2).
fillpoint(r1, xy(235,83), 80.2).
fillpoint(r1, xy(401,83), 80.2).
fillpoint(r1, xy(485,83), 80.2).
fillpoint(r1, xy(604,83), 80.2).
fillpoint(r1, xy(624,83), 80.2).
fillpoint(r1, xy(231,280), 80.2).
fillpoint(r1, xy(641,280), 80.2).
fillpoint(r1, xy(146,82), 79.3).
fillpoint(r1, xy(205,82), 79.3).
fillpoint(r1, xy(212,82), 79.3).
fillpoint(r1, xy(230,82), 79.3).
fillpoint(r1, xy(406,82), 79.3).
fillpoint(r1, xy(481,82), 79.3).
fillpoint(r1, xy(609,82), 79.3).
fillpoint(r1, xy(619,82), 79.3).
fillpoint(r1, xy(236,281), 79.3).
fillpoint(r1, xy(646,281), 79.3).
fillpoint(r1, xy(151,81), 78.3).
fillpoint(r1, xy(199,81), 78.3).
fillpoint(r1, xy(410,81), 78.3).
fillpoint(r1, xy(476,81), 78.3).
fillpoint(r1, xy(614,81), 78.3).
fillpoint(r1, xy(241,282), 78.3).
fillpoint(r1, xy(650,282), 78.3).
fillpoint(r1, xy(156,80), 77.4).
fillpoint(r1, xy(194,80), 77.4).
fillpoint(r1, xy(415,80), 77.4).
fillpoint(r1, xy(471,80), 77.4).
fillpoint(r1, xy(245,283), 77.4).
fillpoint(r1, xy(655,283), 77.4).
fillpoint(r1, xy(162,79), 76.4).
fillpoint(r1, xy(189,79), 76.4).
fillpoint(r1, xy(419,79), 76.4).
fillpoint(r1, xy(467,79), 76.4).
fillpoint(r1, xy(250,284), 76.4).
fillpoint(r1, xy(660,284), 76.4).
fillpoint(r1, xy(166,78), 75.4).
fillpoint(r1, xy(185,78), 75.4).
fillpoint(r1, xy(424,78), 75.4).
fillpoint(r1, xy(462,78), 75.4).
fillpoint(r1, xy(255,285), 75.4).
fillpoint(r1, xy(664,285), 75.4).
fillpoint(r1, xy(171,78), 75.1).
fillpoint(r1, xy(174,77), 74.5).
fillpoint(r1, xy(180,77), 74.5).
fillpoint(r1, xy(429,77), 74.5).
fillpoint(r1, xy(458,77), 74.5).
fillpoint(r1, xy(259,286), 74.5).
fillpoint(r1, xy(669,286), 74.5).
fillpoint(r1, xy(433,76), 73.5).
fillpoint(r1, xy(453,76), 73.5).
fillpoint(r1, xy(264,287), 73.5).
fillpoint(r1, xy(673,287), 73.5).
fillpoint(r1, xy(438,75), 72.6).
fillpoint(r1, xy(448,75), 72.6).
fillpoint(r1, xy(268,288), 72.6).
fillpoint(r1, xy(678,288), 72.6).
fillpoint(r1, xy(443,74), 71.6).
fillpoint(r1, xy(74,125), 71.6).
fillpoint(r1, xy(273,289), 71.6).
fillpoint(r1, xy(683,289), 71.6).
fillpoint(r1, xy(687,290), 70.7).
fillpoint(r1, xy(692,290), 70.1).
fillpoint(r1, xy(72,131), 69.7).
fillpoint(r1, xy(72,225), 69.7).
fillpoint(r1, xy(464,291), 69.7).
fillpoint(r1, xy(71,136), 68.8).
fillpoint(r1, xy(71,220), 68.8).
fillpoint(r1, xy(460,292), 68.8).
fillpoint(r1, xy(70,141), 67.8).
fillpoint(r1, xy(70,216), 67.8).
fillpoint(r1, xy(455,293), 67.8).
fillpoint(r1, xy(285,294), 66.9).
fillpoint(r1, xy(450,294), 66.9).
fillpoint(r1, xy(69,145), 66.8).
fillpoint(r1, xy(69,211), 66.8).
fillpoint(r1, xy(68,150), 65.9).
fillpoint(r1, xy(68,206), 65.9).
fillpoint(r1, xy(289,295), 65.9).
fillpoint(r1, xy(446,295), 65.9).
fillpoint(r1, xy(67,154), 64.9).
fillpoint(r1, xy(67,202), 64.9).
fillpoint(r1, xy(294,296), 64.9).
fillpoint(r1, xy(441,296), 64.9).
fillpoint(r1, xy(66,159), 64.0).
fillpoint(r1, xy(66,197), 64.0).
fillpoint(r1, xy(299,297), 64.0).
fillpoint(r1, xy(437,297), 64.0).
fillpoint(r1, xy(65,164), 63.0).
fillpoint(r1, xy(65,193), 63.0).
fillpoint(r1, xy(303,298), 63.0).
fillpoint(r1, xy(432,298), 63.0).
fillpoint(r1, xy(64,168), 62.1).
fillpoint(r1, xy(64,188), 62.1).
fillpoint(r1, xy(308,299), 62.1).
fillpoint(r1, xy(427,299), 62.1).
fillpoint(r1, xy(63,173), 61.1).
fillpoint(r1, xy(63,183), 61.1).
fillpoint(r1, xy(312,300), 61.1).
fillpoint(r1, xy(423,300), 61.1).
fillpoint(r1, xy(62,178), 60.2).
fillpoint(r1, xy(317,301), 60.2).
fillpoint(r1, xy(322,302), 59.2).
fillpoint(r1, xy(326,303), 58.3).
fillpoint(r1, xy(330,304), 57.3).
fillpoint(r1, xy(333,305), 56.3).
fillpoint(r1, xy(413,305), 56.3).
fillpoint(r1, xy(338,306), 55.4).
fillpoint(r1, xy(408,306), 55.4).
fillpoint(r1, xy(343,307), 54.4).
fillpoint(r1, xy(404,307), 54.4).
fillpoint(r1, xy(347,308), 53.5).
fillpoint(r1, xy(399,308), 53.5).
fillpoint(r1, xy(799,206), 52.5).
fillpoint(r1, xy(352,309), 52.5).
fillpoint(r1, xy(395,309), 52.5).
fillpoint(r1, xy(386,170), 51.6).
fillpoint(r1, xy(387,172), 51.6).
fillpoint(r1, xy(800,211), 51.6).
fillpoint(r1, xy(356,310), 51.6).
fillpoint(r1, xy(390,310), 51.6).
fillpoint(r1, xy(388,174), 51.3).
fillpoint(r1, xy(801,215), 50.6).
fillpoint(r1, xy(361,311), 50.6).
fillpoint(r1, xy(385,311), 50.6).
fillpoint(r1, xy(393,182), 50.1).
fillpoint(r1, xy(396,189), 50.1).
fillpoint(r1, xy(392,180), 50.0).
fillpoint(r1, xy(397,191), 50.0).
fillpoint(r1, xy(394,184), 49.9).
fillpoint(r1, xy(395,187), 49.9).
fillpoint(r1, xy(398,194), 49.9).
fillpoint(r1, xy(802,220), 49.7).
fillpoint(r1, xy(366,312), 49.7).
fillpoint(r1, xy(381,312), 49.7).
fillpoint(r1, xy(803,224), 48.7).
fillpoint(r1, xy(370,313), 48.7).
fillpoint(r1, xy(376,313), 48.7).
fillpoint(r1, xy(804,229), 47.8).
fillpoint(r1, xy(805,234), 46.8).
fillpoint(r1, xy(299,177), 45.9).
fillpoint(r1, xy(806,238), 45.8).
fillpoint(r1, xy(806,244), 45.8).
fillpoint(r1, xy(417,195), 42.8).
fillpoint(r1, xy(424,198), 42.8).
fillpoint(r1, xy(426,199), 42.8).
fillpoint(r1, xy(433,202), 42.8).
fillpoint(r1, xy(419,196), 42.7).
fillpoint(r1, xy(431,201), 42.7).
fillpoint(r1, xy(422,197), 42.6).
fillpoint(r1, xy(428,200), 42.6).
fillpoint(r1, xy(246,214), 39.1).
fillpoint(r1, xy(245,217), 39.0).
fillpoint(r1, xy(660,198), 36.1).
fillpoint(r1, xy(657,205), 36.1).
fillpoint(r1, xy(663,191), 36.0).
fillpoint(r1, xy(661,196), 36.0).
fillpoint(r1, xy(656,207), 36.0).
fillpoint(r1, xy(654,212), 36.0).
fillpoint(r1, xy(662,193), 35.9).
fillpoint(r1, xy(659,200), 35.9).
fillpoint(r1, xy(658,203), 35.9).
fillpoint(r1, xy(655,210), 35.9).
fillpoint(r1, xy(388,218), 34.5).
fillpoint(r1, xy(389,216), 34.4).
fillpoint(r1, xy(387,220), 34.4).
fillpoint(r1, xy(386,222), 34.3).
fillpoint(r1, xy(805,328), 33.9).
fillpoint(r1, xy(808,329), 33.4).
fillpoint(r1, xy(819,329), 33.4).
fillpoint(r1, xy(813,330), 32.5).
fillpoint(r1, xy(764,272), 31.5).
fillpoint(r1, xy(780,264), 30.7).
fillpoint(r1, xy(771,268), 30.7).
fillpoint(r1, xy(769,269), 30.7).
fillpoint(r1, xy(778,265), 30.6).
fillpoint(r1, xy(773,267), 30.6).
fillpoint(r1, xy(776,266), 30.5).
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
opencv_morphology(r1, opening_area(310715), closing_area(313284), gradient_area(5393)).
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
opencv_contour(r1, c5, hole, 4.0).
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
opencv_contour(r1, c27, hole, 4.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 2.0).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 2.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 4.0).
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
opencv_contour(r1, c41, hole, 4.0).
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
opencv_contour(r1, c48, hole, 4.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 4.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 7.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 4.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 4.0).
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
opencv_contour(r1, c64, hole, 5.5).
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
opencv_contour(r1, c75, hole, 4.0).
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
opencv_contour(r1, c105, hole, 8.5).
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
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 2.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 2.0).
opencv_contour_hierarchy(r1, c113, next(none), previous(c112), child(none), parent(c0)).
