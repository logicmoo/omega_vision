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

region(r1, '#192227', 310815, centroid(426,182)).
perimeter(r1, 2600).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(776,63),xy(778,63),xy(776,63)]).
hole(r1, [xy(777,62),xy(779,62),xy(777,62)]).
hole(r1, [xy(778,61),xy(780,61),xy(778,61)]).
hole(r1, [xy(779,60),xy(781,60),xy(779,60)]).
hole(r1, [xy(780,59),xy(782,59),xy(780,59)]).
hole(r1, [xy(781,58),xy(783,58),xy(781,58)]).
hole(r1, [xy(782,57),xy(784,57),xy(782,57)]).
hole(r1, [xy(785,53),xy(787,53),xy(785,53)]).
hole(r1, [xy(787,50),xy(789,50),xy(787,50)]).
hole(r1, [xy(789,48),xy(791,48),xy(789,48)]).
hole(r1, [xy(792,44),xy(794,44),xy(792,44)]).
hole(r1, [xy(793,43),xy(795,43),xy(793,43)]).
hole(r1, [xy(794,42),xy(796,42),xy(794,42)]).
hole(r1, [xy(799,36),xy(801,36),xy(799,36)]).
hole(r1, [xy(800,35),xy(802,35),xy(800,35)]).
hole(r1, [xy(801,34),xy(803,34),xy(801,34)]).
hole(r1, [xy(802,33),xy(804,33),xy(802,33)]).
hole(r1, [xy(804,31),xy(806,31),xy(804,31)]).
hole(r1, [xy(805,30),xy(807,30),xy(805,30)]).
hole(r1, [xy(806,29),xy(808,29),xy(806,29)]).
hole(r1, [xy(807,28),xy(809,28),xy(807,28)]).
hole(r1, [xy(808,27),xy(810,27),xy(808,27)]).
hole(r1, [xy(810,25),xy(812,25),xy(810,25)]).
hole(r1, [xy(812,23),xy(814,23),xy(812,23)]).
hole(r1, [xy(813,22),xy(815,22),xy(813,22)]).
hole(r1, [xy(814,21),xy(816,21),xy(814,21)]).
hole(r1, [xy(815,20),xy(817,20),xy(815,20)]).
hole(r1, [xy(816,19),xy(818,19),xy(816,19)]).
hole(r1, [xy(817,18),xy(819,18),xy(817,18)]).
hole(r1, [xy(818,17),xy(820,17),xy(818,17)]).
hole(r1, [xy(823,12),xy(825,12),xy(823,12)]).
hole(r1, [xy(825,10),xy(827,10),xy(825,10)]).
hole(r1, [xy(826,9),xy(828,9),xy(826,9)]).
hole(r1, [xy(827,8),xy(829,8),xy(827,8)]).
hole(r1, [xy(828,7),xy(830,7),xy(828,7)]).
hole(r1, [xy(829,6),xy(831,6),xy(829,6)]).
hole(r1, [xy(830,5),xy(832,5),xy(830,5)]).
hole(r1, [xy(831,4),xy(833,4),xy(831,4)]).
hole(r1, [xy(832,3),xy(834,3),xy(832,3)]).
hole(r1, [xy(833,2),xy(835,2),xy(833,2)]).
hole(r1, [xy(834,1),xy(836,1),xy(834,1)]).
midline(r1, [xy(182,181),xy(672,181),xy(777,76),xy(776,62),xy(782,56),xy(784,56),xy(784,57),xy(777,64),xy(778,64),xy(786,56),xy(785,52),xy(789,47),xy(791,47),xy(791,48),xy(787,54)]).
midline(r1, [xy(791,49),xy(793,47),xy(792,43),xy(794,41),xy(796,41),xy(796,42),xy(793,45),xy(796,43)]).
midline(r1, [xy(831,4),xy(823,11),xy(824,28),xy(801,51),xy(799,35),xy(818,16),xy(820,17),xy(804,34)]).
midline(r1, [xy(810,28),xy(806,32)]).
midline(r1, [xy(825,13),xy(827,10),xy(826,9),xy(830,5),xy(831,6),xy(827,11)]).
midline(r1, [xy(829,9),xy(833,4),xy(832,3),xy(831,3),xy(834,0),xy(836,0),xy(836,1),xy(833,5)]).
midline(r1, [xy(836,2),xy(835,3)]).
midline(r1, [xy(802,51),xy(824,29)]).
midline(r1, [xy(800,51),xy(778,74),xy(800,53)]).
midline(r1, [xy(814,24),xy(820,18)]).
fillpoint(r1, xy(182,182), 173.8).
fillpoint(r1, xy(659,188), 168.1).
fillpoint(r1, xy(664,189), 167.1).
fillpoint(r1, xy(668,190), 166.2).
fillpoint(r1, xy(673,191), 165.2).
fillpoint(r1, xy(677,192), 164.3).
fillpoint(r1, xy(682,193), 163.3).
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
opencv_morphology(r1, opening_area(310808), closing_area(313284), gradient_area(5012)).
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
opencv_contour_hierarchy(r1, c41, next(none), previous(c40), child(none), parent(c0)).
