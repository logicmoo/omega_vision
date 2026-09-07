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

region(r1, '#707372', 310850, centroid(426,182)).
perimeter(r1, 2450).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(714,120),xy(717,120),xy(714,120)]).
hole(r1, [xy(781,102),xy(783,101),xy(784,103),xy(782,104),xy(781,102)]).
midline(r1, [xy(182,181),xy(534,180),xy(594,242),xy(731,242),xy(784,190),xy(785,172),xy(749,136),xy(749,87),xy(721,59),xy(654,60),xy(535,180),xy(654,61)]).
midline(r1, [xy(816,141),xy(815,142)]).
midline(r1, [xy(784,50),xy(731,50),xy(722,59),xy(729,52)]).
midline(r1, [xy(785,50),xy(802,50),xy(818,66),xy(818,138),xy(816,140),xy(818,139)]).
fillpoint(r1, xy(182,182), 173.8).
fillpoint(r1, xy(618,221), 136.6).
fillpoint(r1, xy(622,222), 135.6).
fillpoint(r1, xy(627,223), 134.7).
fillpoint(r1, xy(632,224), 133.7).
fillpoint(r1, xy(636,225), 132.7).
fillpoint(r1, xy(641,226), 131.8).
fillpoint(r1, xy(645,227), 130.8).
fillpoint(r1, xy(650,228), 129.9).
fillpoint(r1, xy(655,229), 128.9).
fillpoint(r1, xy(659,230), 128.0).
fillpoint(r1, xy(664,231), 127.0).
fillpoint(r1, xy(668,232), 126.1).
fillpoint(r1, xy(673,233), 125.1).
fillpoint(r1, xy(678,234), 124.2).
fillpoint(r1, xy(682,235), 123.2).
fillpoint(r1, xy(687,236), 122.2).
fillpoint(r1, xy(691,237), 121.3).
fillpoint(r1, xy(696,238), 120.3).
fillpoint(r1, xy(701,239), 119.4).
fillpoint(r1, xy(729,239), 119.0).
fillpoint(r1, xy(705,240), 118.4).
fillpoint(r1, xy(726,240), 118.4).
fillpoint(r1, xy(710,241), 117.5).
fillpoint(r1, xy(721,241), 117.5).
fillpoint(r1, xy(716,242), 116.5).
fillpoint(r1, xy(671,69), 66.9).
fillpoint(r1, xy(675,68), 65.9).
fillpoint(r1, xy(680,67), 64.9).
fillpoint(r1, xy(685,66), 64.0).
fillpoint(r1, xy(689,65), 63.0).
fillpoint(r1, xy(694,64), 62.1).
fillpoint(r1, xy(698,63), 61.1).
fillpoint(r1, xy(734,63), 61.1).
fillpoint(r1, xy(703,62), 60.2).
fillpoint(r1, xy(728,62), 60.2).
fillpoint(r1, xy(708,61), 59.2).
fillpoint(r1, xy(724,61), 59.2).
fillpoint(r1, xy(712,60), 58.3).
fillpoint(r1, xy(719,60), 58.3).
fillpoint(r1, xy(742,59), 57.3).
fillpoint(r1, xy(747,58), 56.3).
fillpoint(r1, xy(752,57), 55.4).
fillpoint(r1, xy(756,56), 54.4).
fillpoint(r1, xy(761,55), 53.5).
fillpoint(r1, xy(765,54), 52.5).
fillpoint(r1, xy(799,54), 52.5).
fillpoint(r1, xy(770,53), 51.6).
fillpoint(r1, xy(795,53), 51.6).
fillpoint(r1, xy(775,52), 50.6).
fillpoint(r1, xy(791,52), 50.6).
fillpoint(r1, xy(779,51), 49.7).
fillpoint(r1, xy(786,51), 49.7).
border(r1).
region(r2, '#666663', 4, centroid(782,102)).
perimeter(r2, 8).

adjacent(r1, r2).
shared_edge(r1, r2, 8).

encloses(r1, r2).

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
opencv_component(cc1, [r2]).
opencv_component_area(cc1, 4).
opencv_component_centroid(cc1, centroid(782,102)).
opencv_morphology(r1, opening_area(310846), closing_area(313284), gradient_area(4888)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 4.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 7.0).
opencv_contour_hierarchy(r1, c2, next(none), previous(c1), child(none), parent(c0)).
opencv_watershed_count(r2, 1).
opencv_watershed_segment(r2, ws1, 4, centroid(782,102)).
