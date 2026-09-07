% part_groups by group_regions.pl (prolog doer)
:- dynamic part_group/2.
:- discontiguous part_group/2.
:- dynamic group_area/2.
:- discontiguous group_area/2.
:- dynamic background/1.
:- discontiguous background/1.
:- dynamic detachable/1.
:- discontiguous detachable/1.
:- dynamic object_instance/2.
:- discontiguous object_instance/2.
:- dynamic part_of/2.
:- discontiguous part_of/2.
:- dynamic squarish/1.
:- discontiguous squarish/1.
part_group(g1, [r121]).
group_area(g1, 14).
part_group(g2, [r15]).
group_area(g2, 10).
part_group(g3, [r52]).
group_area(g3, 8).
part_group(g4, [r552]).
group_area(g4, 6).
part_group(g5, [r623]).
group_area(g5, 6).
part_group(g6, [r188]).
group_area(g6, 6).
part_group(g7, [r53]).
group_area(g7, 6).
part_group(g8, [r57]).
group_area(g8, 6).
part_group(g9, [r124]).
group_area(g9, 6).
part_group(g10, [r607]).
group_area(g10, 5).
part_group(g11, [r24]).
group_area(g11, 4).
part_group(g12, [r155]).
group_area(g12, 4).
background(r1).
detachable(r121).
detachable(r124).
detachable(r15).
detachable(r155).
detachable(r188).
detachable(r24).
detachable(r52).
detachable(r53).
detachable(r552).
detachable(r57).
detachable(r607).
detachable(r623).
object_instance(o1, [r121]).
object_instance(o2, [r15]).
object_instance(o3, [r52]).
object_instance(o4, [r552]).
object_instance(o5, [r623]).
object_instance(o6, [r188]).
object_instance(o7, [r53]).
object_instance(o8, [r57]).
object_instance(o9, [r124]).
object_instance(o10, [r607]).
object_instance(o11, [r24]).
object_instance(o12, [r155]).
part_of(r121, r1).
part_of(r124, r1).
part_of(r15, r1).
part_of(r155, r1).
part_of(r188, r1).
part_of(r24, r1).
part_of(r52, r1).
part_of(r53, r1).
part_of(r552, r1).
part_of(r57, r1).
part_of(r607, r1).
part_of(r623, r1).
squarish(r53).
squarish(r57).
