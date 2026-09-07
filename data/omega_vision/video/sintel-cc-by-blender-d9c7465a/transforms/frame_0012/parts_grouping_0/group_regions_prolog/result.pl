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
part_group(g1, [r71]).
group_area(g1, 8).
part_group(g2, [r33]).
group_area(g2, 4).
part_group(g3, [r243]).
group_area(g3, 4).
part_group(g4, [r213]).
group_area(g4, 4).
part_group(g5, [r24]).
group_area(g5, 4).
part_group(g6, [r253]).
group_area(g6, 4).
background(r1).
detachable(r213).
detachable(r24).
detachable(r243).
detachable(r253).
detachable(r33).
detachable(r71).
object_instance(o1, [r71]).
object_instance(o2, [r33]).
object_instance(o3, [r243]).
object_instance(o4, [r213]).
object_instance(o5, [r24]).
object_instance(o6, [r253]).
part_of(r213, r1).
part_of(r24, r1).
part_of(r243, r1).
part_of(r253, r1).
part_of(r33, r1).
part_of(r71, r1).
squarish(r24).
squarish(r33).
squarish(r71).
