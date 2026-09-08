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
part_group(g1, [r2801,r3084]).
group_area(g1, 76750).
part_group(g2, [r968]).
group_area(g2, 1479).
part_group(g3, [r2379]).
group_area(g3, 1383).
part_group(g4, [r1611]).
group_area(g4, 15).
part_group(g5, [r1171]).
group_area(g5, 12).
part_group(g6, [r1076]).
group_area(g6, 9).
part_group(g7, [r3622]).
group_area(g7, 8).
part_group(g8, [r1466]).
group_area(g8, 6).
part_group(g9, [r2160]).
group_area(g9, 6).
part_group(g10, [r1820]).
group_area(g10, 6).
part_group(g11, [r886]).
group_area(g11, 5).
part_group(g12, [r186]).
group_area(g12, 5).
background(r1).
background(r2224).
background(r7).
detachable(r1076).
detachable(r1171).
detachable(r1466).
detachable(r1611).
detachable(r1820).
detachable(r186).
detachable(r2160).
detachable(r3622).
detachable(r886).
object_instance(o1, [r2801,r3084]).
object_instance(o2, [r968]).
object_instance(o3, [r2379]).
object_instance(o4, [r1611]).
object_instance(o5, [r1171]).
object_instance(o6, [r1076]).
object_instance(o7, [r3622]).
object_instance(o8, [r1466]).
object_instance(o9, [r2160]).
object_instance(o10, [r1820]).
object_instance(o11, [r886]).
object_instance(o12, [r186]).
part_of(r1076, r1).
part_of(r1171, r1).
part_of(r1466, r1).
part_of(r1611, r1).
part_of(r1820, r1).
part_of(r186, r1).
part_of(r2160, r1).
part_of(r3622, r1).
part_of(r886, r1).
