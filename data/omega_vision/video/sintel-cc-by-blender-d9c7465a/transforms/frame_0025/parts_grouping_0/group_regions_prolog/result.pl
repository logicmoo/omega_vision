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
part_group(g1, [r16]).
group_area(g1, 4).
part_group(g2, [r15]).
group_area(g2, 4).
background(r1).
detachable(r15).
detachable(r16).
object_instance(o1, [r16]).
object_instance(o2, [r15]).
part_of(r15, r1).
part_of(r16, r1).
squarish(r15).
squarish(r16).
