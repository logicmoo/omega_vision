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

region(r1, '#553828', 310825, centroid(426,181)).
perimeter(r1, 2514).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(739,320),xy(741,319),xy(742,321),xy(740,322),xy(739,320)]).
hole(r1, [xy(741,318),xy(743,317),xy(744,319),xy(742,320),xy(741,318)]).
hole(r1, [xy(743,316),xy(745,315),xy(746,317),xy(744,318),xy(743,316)]).
hole(r1, [xy(748,298),xy(750,299),xy(748,298)]).
hole(r1, [xy(750,296),xy(752,297),xy(750,296)]).
hole(r1, [xy(751,294),xy(753,295),xy(751,294)]).
hole(r1, [xy(777,248),xy(779,247),xy(780,249),xy(778,250),xy(777,248)]).
hole(r1, [xy(783,234),xy(785,235),xy(783,234)]).
hole(r1, [xy(784,210),xy(786,211),xy(784,210)]).
hole(r1, [xy(780,182),xy(782,183),xy(780,182)]).
hole(r1, [xy(779,180),xy(781,181),xy(779,180)]).
hole(r1, [xy(778,178),xy(780,178),xy(778,178)]).
midline(r1, [xy(182,181),xy(558,180),xy(718,342),xy(762,342),xy(763,341),xy(581,159),xy(559,180),xy(578,161)]).
midline(r1, [xy(763,342),xy(766,340),xy(584,158),xy(582,159)]).
midline(r1, [xy(766,341),xy(777,331),xy(753,307),xy(740,307),xy(590,157),xy(585,158)]).
midline(r1, [xy(777,332),xy(782,331),xy(784,328),xy(755,299),xy(752,299),xy(603,149),xy(598,149),xy(591,157),xy(598,150)]).
midline(r1, [xy(750,295),xy(753,296),xy(755,298)]).
midline(r1, [xy(784,329),xy(788,328),xy(802,314)]).
midline(r1, [xy(749,297),xy(750,298)]).
midline(r1, [xy(803,312),xy(803,300),xy(775,272),xy(755,272),xy(630,147),xy(604,148)]).
midline(r1, [xy(811,291),xy(803,299),xy(816,287),xy(816,272),xy(785,241),xy(777,241),xy(752,215),xy(748,215),xy(655,123),xy(630,146),xy(652,125)]).
midline(r1, [xy(716,182),xy(780,182),xy(781,181),xy(809,181),xy(794,197),xy(770,197),xy(753,215),xy(770,198)]).
midline(r1, [xy(809,183),xy(796,196)]).
midline(r1, [xy(761,223),xy(818,223),xy(819,176),xy(816,174),xy(810,181),xy(816,175)]).
midline(r1, [xy(817,173),xy(817,144),xy(763,90),xy(687,91),xy(656,123),xy(687,92)]).
midline(r1, [xy(694,91),xy(778,175),xy(778,179),xy(779,179),xy(780,177)]).
midline(r1, [xy(819,223),xy(818,271)]).
fillpoint(r1, xy(182,182), 173.8).
fillpoint(r1, xy(707,104), 100.3).
fillpoint(r1, xy(712,103), 99.3).
fillpoint(r1, xy(716,102), 98.4).
fillpoint(r1, xy(721,101), 97.4).
fillpoint(r1, xy(725,100), 96.5).
fillpoint(r1, xy(730,99), 95.5).
fillpoint(r1, xy(735,98), 94.5).
fillpoint(r1, xy(739,97), 93.6).
fillpoint(r1, xy(744,96), 92.6).
fillpoint(r1, xy(749,95), 91.7).
fillpoint(r1, xy(753,94), 90.7).
fillpoint(r1, xy(758,93), 89.8).
fillpoint(r1, xy(800,310), 51.6).
fillpoint(r1, xy(801,305), 50.6).
fillpoint(r1, xy(802,300), 49.7).
fillpoint(r1, xy(802,291), 49.0).
fillpoint(r1, xy(803,293), 48.7).
fillpoint(r1, xy(803,296), 48.7).
border(r1).
region(r16, '#b26026', 4, centroid(740,320)).
perimeter(r16, 8).
region(r15, '#b6642a', 4, centroid(742,318)).
perimeter(r15, 8).

adjacent(r1, r15).
shared_edge(r1, r15, 8).
adjacent(r1, r16).
shared_edge(r1, r16, 8).

encloses(r1, r15).
encloses(r1, r16).

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
opencv_component(cc1, [r15,r16]).
opencv_component_area(cc1, 8).
opencv_component_centroid(cc1, centroid(742,320)).
opencv_morphology(r1, opening_area(310815), closing_area(313284), gradient_area(4969)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 7.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 7.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 7.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 4.0).
opencv_contour_hierarchy(r1, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r1, c5, hole, 4.0).
opencv_contour_hierarchy(r1, c5, next(c6), previous(c4), child(none), parent(c0)).
opencv_contour(r1, c6, hole, 4.0).
opencv_contour_hierarchy(r1, c6, next(c7), previous(c5), child(none), parent(c0)).
opencv_contour(r1, c7, hole, 7.0).
opencv_contour_hierarchy(r1, c7, next(c8), previous(c6), child(none), parent(c0)).
opencv_contour(r1, c8, hole, 4.0).
opencv_contour_hierarchy(r1, c8, next(c9), previous(c7), child(none), parent(c0)).
opencv_contour(r1, c9, hole, 4.0).
opencv_contour_hierarchy(r1, c9, next(c10), previous(c8), child(none), parent(c0)).
opencv_contour(r1, c10, hole, 4.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 4.0).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 2.0).
opencv_contour_hierarchy(r1, c12, next(none), previous(c11), child(none), parent(c0)).
opencv_watershed_count(r15, 1).
opencv_watershed_segment(r15, ws1, 4, centroid(742,318)).
opencv_watershed_count(r16, 1).
opencv_watershed_segment(r16, ws1, 4, centroid(740,320)).
