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

region(r1, '#626461', 310784, centroid(426,182)).
perimeter(r1, 2670).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(329,349),xy(331,349),xy(329,349)]).
hole(r1, [xy(454,311),xy(456,312),xy(454,311)]).
hole(r1, [xy(709,219),xy(711,219),xy(709,219)]).
hole(r1, [xy(707,216),xy(709,216),xy(707,216)]).
hole(r1, [xy(702,210),xy(704,210),xy(702,210)]).
hole(r1, [xy(701,209),xy(703,209),xy(701,209)]).
hole(r1, [xy(699,206),xy(701,206),xy(699,206)]).
hole(r1, [xy(698,205),xy(700,205),xy(698,205)]).
hole(r1, [xy(675,195),xy(677,195),xy(675,195)]).
hole(r1, [xy(672,187),xy(674,187),xy(672,187)]).
hole(r1, [xy(433,174),xy(435,174),xy(433,174)]).
hole(r1, [xy(432,173),xy(434,173),xy(432,173)]).
hole(r1, [xy(423,171),xy(425,171),xy(423,171)]).
hole(r1, [xy(419,170),xy(421,170),xy(419,170)]).
hole(r1, [xy(409,167),xy(411,167),xy(409,167)]).
hole(r1, [xy(408,166),xy(410,166),xy(408,166)]).
hole(r1, [xy(462,164),xy(464,165),xy(463,169),xy(461,168),xy(462,164)]).
hole(r1, [xy(428,155),xy(429,160),xy(427,162),xy(426,156),xy(428,155)]).
hole(r1, [xy(637,53),xy(639,53),xy(637,53)]).
hole(r1, [xy(635,48),xy(637,48),xy(635,48)]).
hole(r1, [xy(634,46),xy(636,46),xy(634,46)]).
hole(r1, [xy(633,44),xy(635,44),xy(633,44)]).
hole(r1, [xy(632,42),xy(634,42),xy(632,42)]).
hole(r1, [xy(631,40),xy(633,40),xy(631,40)]).
hole(r1, [xy(630,38),xy(632,38),xy(630,38)]).
hole(r1, [xy(629,36),xy(631,36),xy(629,36)]).
hole(r1, [xy(628,35),xy(630,35),xy(628,35)]).
hole(r1, [xy(627,33),xy(629,33),xy(627,33)]).
hole(r1, [xy(625,30),xy(627,30),xy(625,30)]).
hole(r1, [xy(624,28),xy(626,28),xy(624,28)]).
hole(r1, [xy(623,27),xy(625,27),xy(623,27)]).
hole(r1, [xy(622,25),xy(624,25),xy(622,25)]).
hole(r1, [xy(620,22),xy(622,22),xy(620,22)]).
hole(r1, [xy(619,21),xy(621,21),xy(619,21)]).
hole(r1, [xy(617,18),xy(619,18),xy(617,18)]).
hole(r1, [xy(616,17),xy(618,17),xy(616,17)]).
hole(r1, [xy(615,16),xy(617,16),xy(615,16)]).
hole(r1, [xy(614,15),xy(616,15),xy(614,15)]).
hole(r1, [xy(613,14),xy(615,14),xy(613,14)]).
hole(r1, [xy(612,13),xy(614,13),xy(612,13)]).
hole(r1, [xy(611,12),xy(613,12),xy(611,12)]).
hole(r1, [xy(610,11),xy(612,11),xy(610,11)]).
hole(r1, [xy(609,10),xy(611,10),xy(609,10)]).
hole(r1, [xy(608,9),xy(610,9),xy(608,9)]).
hole(r1, [xy(607,8),xy(609,8),xy(607,8)]).
hole(r1, [xy(605,7),xy(607,7),xy(605,7)]).
hole(r1, [xy(604,6),xy(606,6),xy(604,6)]).
hole(r1, [xy(602,5),xy(605,5),xy(602,5)]).
hole(r1, [xy(601,4),xy(603,4),xy(601,4)]).
hole(r1, [xy(600,3),xy(602,3),xy(600,3)]).
hole(r1, [xy(598,2),xy(600,2),xy(598,2)]).
hole(r1, [xy(597,1),xy(599,1),xy(597,1)]).
midline(r1, [xy(182,181),xy(245,180),xy(325,262),xy(330,262),xy(329,350),xy(330,350),xy(331,349),xy(330,348),xy(331,348)]).
midline(r1, [xy(331,262),xy(353,262),xy(378,236),xy(386,236),xy(421,201),xy(422,172),xy(420,171),xy(419,170),xy(419,169),xy(423,170),xy(423,172),xy(424,172),xy(425,171),xy(424,170),xy(425,170)]).
midline(r1, [xy(354,263),xy(429,338),xy(482,337),xy(552,265),xy(527,240),xy(390,240),xy(387,237)]).
midline(r1, [xy(552,267),xy(562,265),xy(642,184),xy(543,85),xy(524,85),xy(521,82),xy(511,82),xy(506,77),xy(349,77),xy(259,167)]).
midline(r1, [xy(642,185),xy(672,184),xy(672,188),xy(673,188),xy(674,187),xy(674,184),xy(719,140)]).
midline(r1, [xy(262,164),xy(347,79)]).
midline(r1, [xy(261,166),xy(408,165),xy(409,168),xy(411,167),xy(409,165),xy(411,166)]).
midline(r1, [xy(674,186),xy(674,188)]).
midline(r1, [xy(720,138),xy(720,133),xy(639,54)]).
midline(r1, [xy(641,53),xy(641,51),xy(639,49),xy(638,49),xy(633,45),xy(627,32),xy(623,28),xy(622,24),xy(619,21),xy(619,20),xy(605,8)]).
midline(r1, [xy(619,22),xy(620,23)]).
midline(r1, [xy(617,19),xy(607,9)]).
midline(r1, [xy(634,47),xy(635,49),xy(637,49)]).
midline(r1, [xy(637,47),xy(635,45),xy(634,45),xy(635,44),xy(632,38),xy(622,22),xy(619,18),xy(606,5),xy(607,7)]).
midline(r1, [xy(632,37),xy(630,34)]).
midline(r1, [xy(622,21),xy(621,20)]).
midline(r1, [xy(609,7),xy(611,6),xy(607,2),xy(597,0),xy(597,2),xy(599,4),xy(522,82),xy(598,6)]).
midline(r1, [xy(627,29),xy(625,26)]).
midline(r1, [xy(619,17),xy(611,8)]).
midline(r1, [xy(599,1),xy(601,5),xy(602,5),xy(603,4),xy(602,3),xy(603,3)]).
midline(r1, [xy(431,191),xy(422,200),xy(434,189),xy(434,176),xy(432,172),xy(434,172),xy(433,174),xy(434,175),xy(435,174),xy(435,173)]).
midline(r1, [xy(688,198),xy(677,187),xy(675,194),xy(675,196),xy(676,196),xy(677,195),xy(676,194),xy(677,194)]).
midline(r1, [xy(689,199),xy(695,205),xy(698,204),xy(699,207),xy(700,207),xy(701,206),xy(699,204),xy(701,205)]).
midline(r1, [xy(466,126),xy(445,147),xy(445,177),xy(435,187),xy(444,179)]).
midline(r1, [xy(446,147),xy(510,83)]).
midline(r1, [xy(703,208),xy(701,207),xy(702,212),xy(704,210),xy(703,209),xy(704,209)]).
midline(r1, [xy(703,213),xy(707,217),xy(708,217),xy(709,216),xy(708,215),xy(709,215)]).
midline(r1, [xy(711,218),xy(709,217),xy(709,220),xy(711,220)]).
fillpoint(r1, xy(182,182), 173.8).
fillpoint(r1, xy(564,235), 123.2).
fillpoint(r1, xy(573,144), 113.3).
fillpoint(r1, xy(564,194), 107.0).
fillpoint(r1, xy(557,124), 106.8).
fillpoint(r1, xy(556,122), 106.6).
fillpoint(r1, xy(558,126), 106.6).
fillpoint(r1, xy(559,129), 106.6).
fillpoint(r1, xy(555,120), 106.5).
fillpoint(r1, xy(552,113), 106.4).
fillpoint(r1, xy(553,115), 106.4).
fillpoint(r1, xy(554,117), 106.4).
fillpoint(r1, xy(570,173), 104.2).
fillpoint(r1, xy(566,182), 104.2).
fillpoint(r1, xy(745,108), 104.1).
fillpoint(r1, xy(572,168), 104.1).
fillpoint(r1, xy(569,175), 104.1).
fillpoint(r1, xy(567,180), 104.1).
fillpoint(r1, xy(571,171), 104.0).
fillpoint(r1, xy(568,178), 104.0).
fillpoint(r1, xy(565,184), 104.0).
fillpoint(r1, xy(334,242), 103.7).
fillpoint(r1, xy(340,245), 103.5).
fillpoint(r1, xy(347,248), 103.5).
fillpoint(r1, xy(338,244), 103.4).
fillpoint(r1, xy(349,249), 103.4).
fillpoint(r1, xy(354,251), 103.4).
fillpoint(r1, xy(356,252), 103.4).
fillpoint(r1, xy(361,254), 103.4).
fillpoint(r1, xy(363,255), 103.4).
fillpoint(r1, xy(342,246), 103.3).
fillpoint(r1, xy(345,247), 103.3).
fillpoint(r1, xy(352,250), 103.3).
fillpoint(r1, xy(358,253), 103.3).
fillpoint(r1, xy(738,107), 103.1).
fillpoint(r1, xy(366,256), 103.1).
fillpoint(r1, xy(734,106), 102.2).
fillpoint(r1, xy(370,257), 102.2).
fillpoint(r1, xy(729,105), 101.2).
fillpoint(r1, xy(748,115), 101.2).
fillpoint(r1, xy(725,104), 100.3).
fillpoint(r1, xy(749,120), 100.3).
fillpoint(r1, xy(609,265), 94.5).
fillpoint(r1, xy(342,97), 93.6).
fillpoint(r1, xy(613,266), 93.6).
fillpoint(r1, xy(346,96), 92.6).
fillpoint(r1, xy(528,96), 92.6).
fillpoint(r1, xy(618,267), 92.6).
fillpoint(r1, xy(351,95), 91.7).
fillpoint(r1, xy(524,95), 91.7).
fillpoint(r1, xy(622,268), 91.7).
fillpoint(r1, xy(355,94), 90.7).
fillpoint(r1, xy(519,94), 90.7).
fillpoint(r1, xy(627,269), 90.7).
fillpoint(r1, xy(360,93), 89.8).
fillpoint(r1, xy(515,93), 89.8).
fillpoint(r1, xy(632,270), 89.8).
fillpoint(r1, xy(510,92), 88.8).
fillpoint(r1, xy(364,91), 87.9).
fillpoint(r1, xy(505,91), 87.9).
fillpoint(r1, xy(369,90), 86.9).
fillpoint(r1, xy(501,90), 86.9).
fillpoint(r1, xy(373,89), 86.0).
fillpoint(r1, xy(496,89), 86.0).
fillpoint(r1, xy(764,145), 86.0).
fillpoint(r1, xy(643,274), 86.0).
fillpoint(r1, xy(378,88), 85.0).
fillpoint(r1, xy(491,88), 85.0).
fillpoint(r1, xy(383,87), 84.0).
fillpoint(r1, xy(487,87), 84.0).
fillpoint(r1, xy(766,152), 84.0).
fillpoint(r1, xy(387,86), 83.1).
fillpoint(r1, xy(482,86), 83.1).
fillpoint(r1, xy(392,85), 82.1).
fillpoint(r1, xy(478,85), 82.1).
fillpoint(r1, xy(397,84), 81.2).
fillpoint(r1, xy(473,84), 81.2).
fillpoint(r1, xy(652,279), 81.2).
fillpoint(r1, xy(769,279), 81.2).
fillpoint(r1, xy(401,83), 80.2).
fillpoint(r1, xy(456,83), 80.2).
fillpoint(r1, xy(468,83), 80.2).
fillpoint(r1, xy(770,163), 80.2).
fillpoint(r1, xy(770,275), 80.2).
fillpoint(r1, xy(656,280), 80.2).
fillpoint(r1, xy(764,280), 80.2).
fillpoint(r1, xy(406,82), 79.3).
fillpoint(r1, xy(450,82), 79.3).
fillpoint(r1, xy(463,82), 79.3).
fillpoint(r1, xy(771,168), 79.3).
fillpoint(r1, xy(771,271), 79.3).
fillpoint(r1, xy(661,281), 79.3).
fillpoint(r1, xy(759,281), 79.3).
fillpoint(r1, xy(410,81), 78.3).
fillpoint(r1, xy(445,81), 78.3).
fillpoint(r1, xy(772,172), 78.3).
fillpoint(r1, xy(772,266), 78.3).
fillpoint(r1, xy(666,282), 78.3).
fillpoint(r1, xy(755,282), 78.3).
fillpoint(r1, xy(412,248), 77.8).
fillpoint(r1, xy(415,80), 77.4).
fillpoint(r1, xy(440,80), 77.4).
fillpoint(r1, xy(773,177), 77.4).
fillpoint(r1, xy(773,261), 77.4).
fillpoint(r1, xy(670,283), 77.4).
fillpoint(r1, xy(750,283), 77.4).
fillpoint(r1, xy(420,79), 76.4).
fillpoint(r1, xy(436,79), 76.4).
fillpoint(r1, xy(774,182), 76.4).
fillpoint(r1, xy(774,257), 76.4).
fillpoint(r1, xy(675,284), 76.4).
fillpoint(r1, xy(745,284), 76.4).
fillpoint(r1, xy(424,78), 75.4).
fillpoint(r1, xy(431,78), 75.4).
fillpoint(r1, xy(775,186), 75.4).
fillpoint(r1, xy(775,252), 75.4).
fillpoint(r1, xy(680,285), 75.4).
fillpoint(r1, xy(741,285), 75.4).
fillpoint(r1, xy(776,191), 74.5).
fillpoint(r1, xy(776,247), 74.5).
fillpoint(r1, xy(684,286), 74.5).
fillpoint(r1, xy(736,286), 74.5).
fillpoint(r1, xy(777,195), 73.5).
fillpoint(r1, xy(777,243), 73.5).
fillpoint(r1, xy(689,287), 73.5).
fillpoint(r1, xy(732,287), 73.5).
fillpoint(r1, xy(426,247), 73.0).
fillpoint(r1, xy(778,200), 72.6).
fillpoint(r1, xy(778,238), 72.6).
fillpoint(r1, xy(693,288), 72.6).
fillpoint(r1, xy(727,288), 72.6).
fillpoint(r1, xy(779,205), 71.6).
fillpoint(r1, xy(779,234), 71.6).
fillpoint(r1, xy(698,289), 71.6).
fillpoint(r1, xy(722,289), 71.6).
fillpoint(r1, xy(667,115), 71.2).
fillpoint(r1, xy(660,118), 71.2).
fillpoint(r1, xy(658,119), 71.2).
fillpoint(r1, xy(653,121), 71.2).
fillpoint(r1, xy(651,122), 71.2).
fillpoint(r1, xy(644,125), 71.2).
fillpoint(r1, xy(672,113), 71.1).
fillpoint(r1, xy(669,114), 71.1).
fillpoint(r1, xy(665,116), 71.1).
fillpoint(r1, xy(662,117), 71.1).
fillpoint(r1, xy(649,123), 71.1).
fillpoint(r1, xy(646,124), 71.1).
fillpoint(r1, xy(642,126), 71.1).
fillpoint(r1, xy(639,127), 71.1).
fillpoint(r1, xy(656,120), 71.0).
fillpoint(r1, xy(780,209), 70.7).
fillpoint(r1, xy(780,229), 70.7).
fillpoint(r1, xy(703,290), 70.7).
fillpoint(r1, xy(718,290), 70.7).
fillpoint(r1, xy(448,241), 69.8).
fillpoint(r1, xy(441,244), 69.8).
fillpoint(r1, xy(781,214), 69.7).
fillpoint(r1, xy(781,224), 69.7).
fillpoint(r1, xy(455,238), 69.7).
fillpoint(r1, xy(450,240), 69.7).
fillpoint(r1, xy(462,241), 69.7).
fillpoint(r1, xy(439,245), 69.7).
fillpoint(r1, xy(707,291), 69.7).
fillpoint(r1, xy(713,291), 69.7).
fillpoint(r1, xy(453,239), 69.6).
fillpoint(r1, xy(457,239), 69.6).
fillpoint(r1, xy(460,240), 69.6).
fillpoint(r1, xy(446,242), 69.6).
fillpoint(r1, xy(443,243), 69.6).
fillpoint(r1, xy(436,246), 69.6).
fillpoint(r1, xy(782,218), 68.8).
fillpoint(r1, xy(782,220), 68.8).
border(r1).
region(r40, '#868888', 8, centroid(462,166)).
perimeter(r40, 12).
polygon(r40, [xy(462,165),xy(463,168),xy(462,165)]).
midline(r40, [xy(462,166),xy(462,167)]).

adjacent(r1, r40).
shared_edge(r1, r40, 12).

encloses(r1, r40).

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
opencv_component(cc1, [r40]).
opencv_component_area(cc1, 8).
opencv_component_centroid(cc1, centroid(462,166)).
opencv_morphology(r1, opening_area(310777), closing_area(313280), gradient_area(5125)).
opencv_shape_metrics(r1, contour_area(309638.0), hull_area(309639.0), solidity(0.999997), circularity(0.657417), extent(0.996082), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309638.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 4.0).
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
opencv_contour(r1, c17, hole, 13.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 17.5).
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
opencv_contour(r1, c47, hole, 2.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 4.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 2.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 2.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 2.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(none), previous(c51), child(none), parent(c0)).
opencv_morphology(r40, opening_area(0), closing_area(12), gradient_area(20)).
opencv_shape_metrics(r40, contour_area(3.0), hull_area(3.0), solidity(1.0), circularity(0.589049), extent(0.375), aspect_ratio(0.5)).
opencv_contour(r40, c0, outer, 3.0).
opencv_contour_hierarchy(r40, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r40, 1).
opencv_watershed_segment(r40, ws1, 8, centroid(462,167)).
