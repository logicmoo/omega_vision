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
part_group(g1, [r103]).
group_area(g1, 7).
part_group(g2, [r64]).
group_area(g2, 4).
part_group(g3, [r177]).
group_area(g3, 4).
background(r1).
detachable(r103).
detachable(r177).
detachable(r64).
object_instance(o1, [r103]).
object_instance(o2, [r64]).
object_instance(o3, [r177]).
part_of(r103, r1).
part_of(r177, r1).
part_of(r64, r1).
squarish(r177).
