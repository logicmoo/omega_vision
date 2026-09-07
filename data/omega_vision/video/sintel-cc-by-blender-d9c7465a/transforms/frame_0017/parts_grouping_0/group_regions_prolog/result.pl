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
part_group(g1, [r418]).
group_area(g1, 274).
part_group(g2, [r326]).
group_area(g2, 262).
part_group(g3, [r84]).
group_area(g3, 15).
part_group(g4, [r217]).
group_area(g4, 7).
part_group(g5, [r193]).
group_area(g5, 5).
part_group(g6, [r98]).
group_area(g6, 4).
part_group(g7, [r971]).
group_area(g7, 4).
part_group(g8, [r269]).
group_area(g8, 4).
background(r1).
detachable(r193).
detachable(r217).
detachable(r269).
detachable(r84).
detachable(r971).
detachable(r98).
object_instance(o1, [r418]).
object_instance(o2, [r326]).
object_instance(o3, [r84]).
object_instance(o4, [r217]).
object_instance(o5, [r193]).
object_instance(o6, [r98]).
object_instance(o7, [r971]).
object_instance(o8, [r269]).
part_of(r193, r1).
part_of(r217, r1).
part_of(r269, r1).
part_of(r84, r1).
part_of(r971, r1).
part_of(r98, r1).
squarish(r98).
