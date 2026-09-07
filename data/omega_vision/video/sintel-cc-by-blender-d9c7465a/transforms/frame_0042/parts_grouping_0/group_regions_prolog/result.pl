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
part_group(g1, [r1117]).
group_area(g1, 7).
part_group(g2, [r2050]).
group_area(g2, 6).
part_group(g3, [r1932]).
group_area(g3, 6).
part_group(g4, [r1070]).
group_area(g4, 6).
part_group(g5, [r1248]).
group_area(g5, 5).
part_group(g6, [r1114]).
group_area(g6, 5).
part_group(g7, [r1536]).
group_area(g7, 4).
part_group(g8, [r1581]).
group_area(g8, 4).
part_group(g9, [r179]).
group_area(g9, 4).
part_group(g10, [r2047]).
group_area(g10, 4).
background(r1).
detachable(r1070).
detachable(r1114).
detachable(r1117).
detachable(r1248).
detachable(r1536).
detachable(r1581).
detachable(r179).
detachable(r1932).
detachable(r2047).
detachable(r2050).
object_instance(o1, [r1117]).
object_instance(o2, [r2050]).
object_instance(o3, [r1932]).
object_instance(o4, [r1070]).
object_instance(o5, [r1248]).
object_instance(o6, [r1114]).
object_instance(o7, [r1536]).
object_instance(o8, [r1581]).
object_instance(o9, [r179]).
object_instance(o10, [r2047]).
part_of(r1070, r1).
part_of(r1114, r1).
part_of(r1117, r1).
part_of(r1248, r1).
part_of(r1536, r1).
part_of(r1581, r1).
part_of(r179, r1).
part_of(r1932, r1).
part_of(r2047, r1).
part_of(r2050, r1).
squarish(r1536).
squarish(r1581).
squarish(r2050).
