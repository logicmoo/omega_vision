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
part_group(g1, [r729]).
group_area(g1, 17).
part_group(g2, [r817]).
group_area(g2, 12).
part_group(g3, [r256]).
group_area(g3, 6).
part_group(g4, [r194]).
group_area(g4, 6).
part_group(g5, [r149]).
group_area(g5, 6).
part_group(g6, [r766]).
group_area(g6, 6).
part_group(g7, [r709]).
group_area(g7, 5).
part_group(g8, [r418]).
group_area(g8, 4).
part_group(g9, [r451]).
group_area(g9, 4).
part_group(g10, [r549]).
group_area(g10, 4).
part_group(g11, [r779]).
group_area(g11, 4).
part_group(g12, [r843]).
group_area(g12, 4).
part_group(g13, [r346]).
group_area(g13, 4).
background(r1).
detachable(r149).
detachable(r194).
detachable(r256).
detachable(r346).
detachable(r418).
detachable(r451).
detachable(r549).
detachable(r709).
detachable(r729).
detachable(r766).
detachable(r779).
detachable(r817).
detachable(r843).
object_instance(o1, [r729]).
object_instance(o2, [r817]).
object_instance(o3, [r256]).
object_instance(o4, [r194]).
object_instance(o5, [r149]).
object_instance(o6, [r766]).
object_instance(o7, [r709]).
object_instance(o8, [r418]).
object_instance(o9, [r451]).
object_instance(o10, [r549]).
object_instance(o11, [r779]).
object_instance(o12, [r843]).
object_instance(o13, [r346]).
part_of(r149, r1).
part_of(r194, r1).
part_of(r256, r1).
part_of(r346, r1).
part_of(r418, r1).
part_of(r451, r1).
part_of(r549, r1).
part_of(r709, r1).
part_of(r729, r1).
part_of(r766, r1).
part_of(r779, r1).
part_of(r817, r1).
part_of(r843, r1).
squarish(r149).
squarish(r194).
squarish(r418).
squarish(r549).
squarish(r779).
squarish(r843).
