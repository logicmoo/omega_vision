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
part_group(g1, [r1148]).
group_area(g1, 13).
part_group(g2, [r989]).
group_area(g2, 7).
part_group(g3, [r381]).
group_area(g3, 7).
part_group(g4, [r489]).
group_area(g4, 6).
part_group(g5, [r815]).
group_area(g5, 6).
part_group(g6, [r241]).
group_area(g6, 6).
part_group(g7, [r19]).
group_area(g7, 6).
part_group(g8, [r153]).
group_area(g8, 6).
part_group(g9, [r1882]).
group_area(g9, 4).
part_group(g10, [r1397]).
group_area(g10, 4).
part_group(g11, [r1562]).
group_area(g11, 4).
part_group(g12, [r507]).
group_area(g12, 4).
background(r1).
detachable(r1148).
detachable(r1397).
detachable(r153).
detachable(r1562).
detachable(r1882).
detachable(r19).
detachable(r241).
detachable(r381).
detachable(r489).
detachable(r507).
detachable(r815).
detachable(r989).
object_instance(o1, [r1148]).
object_instance(o2, [r989]).
object_instance(o3, [r381]).
object_instance(o4, [r489]).
object_instance(o5, [r815]).
object_instance(o6, [r241]).
object_instance(o7, [r19]).
object_instance(o8, [r153]).
object_instance(o9, [r1882]).
object_instance(o10, [r1397]).
object_instance(o11, [r1562]).
object_instance(o12, [r507]).
part_of(r1148, r1).
part_of(r1397, r1).
part_of(r153, r1).
part_of(r1562, r1).
part_of(r1882, r1).
part_of(r19, r1).
part_of(r241, r1).
part_of(r381, r1).
part_of(r489, r1).
part_of(r507, r1).
part_of(r815, r1).
part_of(r989, r1).
squarish(r1882).
squarish(r507).
squarish(r815).
