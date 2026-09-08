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
part_group(g1, [r1501]).
group_area(g1, 2311).
part_group(g2, [r3961]).
group_area(g2, 1748).
part_group(g3, [r2866]).
group_area(g3, 1715).
part_group(g4, [r2761]).
group_area(g4, 1091).
part_group(g5, [r526]).
group_area(g5, 7).
part_group(g6, [r3756]).
group_area(g6, 6).
part_group(g7, [r210]).
group_area(g7, 5).
part_group(g8, [r1442]).
group_area(g8, 4).
background(r1).
detachable(r1442).
detachable(r210).
detachable(r3756).
detachable(r526).
object_instance(o1, [r1501]).
object_instance(o2, [r3961]).
object_instance(o3, [r2866]).
object_instance(o4, [r2761]).
object_instance(o5, [r526]).
object_instance(o6, [r3756]).
object_instance(o7, [r210]).
object_instance(o8, [r1442]).
part_of(r1442, r1).
part_of(r210, r1).
part_of(r3756, r1).
part_of(r526, r1).
