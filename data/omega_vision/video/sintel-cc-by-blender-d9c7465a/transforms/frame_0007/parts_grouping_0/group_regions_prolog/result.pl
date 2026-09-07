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
part_group(g1, [r162]).
group_area(g1, 6).
part_group(g2, [r156]).
group_area(g2, 6).
part_group(g3, [r208]).
group_area(g3, 4).
background(r1).
detachable(r156).
detachable(r162).
detachable(r208).
object_instance(o1, [r162]).
object_instance(o2, [r156]).
object_instance(o3, [r208]).
part_of(r156, r1).
part_of(r162, r1).
part_of(r208, r1).
