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
part_group(g1, [r1505,r1975]).
group_area(g1, 8497).
part_group(g2, [r3399]).
group_area(g2, 1612).
part_group(g3, [r1967]).
group_area(g3, 1310).
part_group(g4, [r3906]).
group_area(g4, 1052).
part_group(g5, [r3361]).
group_area(g5, 720).
part_group(g6, [r4679]).
group_area(g6, 6).
part_group(g7, [r4612]).
group_area(g7, 4).
part_group(g8, [r4754]).
group_area(g8, 4).
background(r1).
detachable(r4612).
detachable(r4679).
detachable(r4754).
object_instance(o1, [r1505,r1975]).
object_instance(o2, [r3399]).
object_instance(o3, [r1967]).
object_instance(o4, [r3906]).
object_instance(o5, [r3361]).
object_instance(o6, [r4679]).
object_instance(o7, [r4612]).
object_instance(o8, [r4754]).
part_of(r4612, r1).
part_of(r4679, r1).
part_of(r4754, r1).
