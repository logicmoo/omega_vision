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
part_group(g1, [r45]).
group_area(g1, 369).
part_group(g2, [r3]).
group_area(g2, 253).
part_group(g3, [r137]).
group_area(g3, 250).
part_group(g4, [r120]).
group_area(g4, 249).
part_group(g5, [r348]).
group_area(g5, 6).
background(r1).
detachable(r348).
object_instance(o1, [r45]).
object_instance(o2, [r3]).
object_instance(o3, [r137]).
object_instance(o4, [r120]).
object_instance(o5, [r348]).
part_of(r348, r1).
