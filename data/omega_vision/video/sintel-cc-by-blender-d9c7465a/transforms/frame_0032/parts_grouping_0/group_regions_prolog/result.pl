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
part_group(g1, [r635]).
group_area(g1, 5).
part_group(g2, [r1544]).
group_area(g2, 4).
part_group(g3, [r470]).
group_area(g3, 4).
background(r1).
detachable(r1544).
detachable(r470).
detachable(r635).
object_instance(o1, [r635]).
object_instance(o2, [r1544]).
object_instance(o3, [r470]).
part_of(r1544, r1).
part_of(r470, r1).
part_of(r635, r1).
