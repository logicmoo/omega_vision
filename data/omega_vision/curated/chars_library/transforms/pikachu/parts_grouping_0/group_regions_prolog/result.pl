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
part_group(g1, [r2155,r2552]).
group_area(g1, 7130).
part_group(g2, [r1789]).
group_area(g2, 2805).
part_group(g3, [r1019]).
group_area(g3, 1597).
part_group(g4, [r1575]).
group_area(g4, 1329).
part_group(g5, [r2724]).
group_area(g5, 1226).
part_group(g6, [r5414]).
group_area(g6, 5).
background(r1).
detachable(r2552).
detachable(r5414).
object_instance(o1, [r2155,r2552]).
object_instance(o2, [r1789]).
object_instance(o3, [r1019]).
object_instance(o4, [r1575]).
object_instance(o5, [r2724]).
object_instance(o6, [r5414]).
part_of(r2552, r2155).
part_of(r5414, r1).
