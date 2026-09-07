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
part_group(g1, [r202]).
group_area(g1, 9).
part_group(g2, [r374]).
group_area(g2, 5).
part_group(g3, [r206]).
group_area(g3, 4).
part_group(g4, [r82]).
group_area(g4, 4).
background(r1).
detachable(r202).
detachable(r206).
detachable(r374).
detachable(r82).
object_instance(o1, [r202]).
object_instance(o2, [r374]).
object_instance(o3, [r206]).
object_instance(o4, [r82]).
part_of(r202, r1).
part_of(r206, r1).
part_of(r374, r1).
part_of(r82, r1).
