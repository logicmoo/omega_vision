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
part_group(g1, [r2362,r312]).
group_area(g1, 20254).
part_group(g2, [r1271]).
group_area(g2, 4407).
part_group(g3, [r3091]).
group_area(g3, 1613).
part_group(g4, [r3705,r3845]).
group_area(g4, 1391).
part_group(g5, [r3170]).
group_area(g5, 1210).
part_group(g6, [r894]).
group_area(g6, 1157).
part_group(g7, [r1011]).
group_area(g7, 912).
part_group(g8, [r3694]).
group_area(g8, 176).
part_group(g9, [r508]).
group_area(g9, 118).
part_group(g10, [r2064]).
group_area(g10, 103).
part_group(g11, [r2196]).
group_area(g11, 97).
background(r1).
object_instance(o1, [r2362,r312,r3170]).
object_instance(o2, [r1271]).
object_instance(o3, [r3091]).
object_instance(o4, [r3705,r3845]).
object_instance(o5, [r894]).
object_instance(o6, [r1011]).
object_instance(o7, [r3694]).
object_instance(o8, [r508]).
object_instance(o9, [r2064]).
object_instance(o10, [r2196]).
