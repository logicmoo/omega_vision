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
part_group(g1, [r301]).
group_area(g1, 8).
part_group(g2, [r132]).
group_area(g2, 4).
part_group(g3, [r135]).
group_area(g3, 4).
part_group(g4, [r119]).
group_area(g4, 4).
part_group(g5, [r253]).
group_area(g5, 4).
background(r1).
detachable(r119).
detachable(r132).
detachable(r135).
detachable(r253).
detachable(r301).
object_instance(o1, [r301]).
object_instance(o2, [r132]).
object_instance(o3, [r135]).
object_instance(o4, [r119]).
object_instance(o5, [r253]).
part_of(r119, r1).
part_of(r132, r1).
part_of(r135, r1).
part_of(r253, r1).
part_of(r301, r1).
squarish(r132).
squarish(r135).
squarish(r253).
