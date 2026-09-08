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
part_group(g1, [r6]).
group_area(g1, 10713).
part_group(g2, [r2057]).
group_area(g2, 4052).
part_group(g3, [r2493]).
group_area(g3, 2316).
part_group(g4, [r2521]).
group_area(g4, 1633).
part_group(g5, [r784]).
group_area(g5, 1616).
part_group(g6, [r949]).
group_area(g6, 826).
part_group(g7, [r4556]).
group_area(g7, 13).
part_group(g8, [r5751]).
group_area(g8, 6).
part_group(g9, [r3741]).
group_area(g9, 4).
part_group(g10, [r5773]).
group_area(g10, 4).
part_group(g11, [r4472]).
group_area(g11, 4).
background(r1).
detachable(r3741).
detachable(r4472).
detachable(r4556).
detachable(r5751).
detachable(r5773).
object_instance(o1, [r6,r784]).
object_instance(o2, [r2057,r2521]).
object_instance(o3, [r2493]).
object_instance(o4, [r949]).
object_instance(o5, [r4556]).
object_instance(o6, [r5751]).
object_instance(o7, [r3741]).
object_instance(o8, [r5773]).
object_instance(o9, [r4472]).
part_of(r3741, r1).
part_of(r4472, r1).
part_of(r4556, r1).
part_of(r5751, r1).
part_of(r5773, r1).
