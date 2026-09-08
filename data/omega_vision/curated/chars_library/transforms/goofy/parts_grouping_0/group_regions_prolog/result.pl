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
part_group(g1, [r3438,r3738,r5383,r7382,r7611,r8569]).
group_area(g1, 135679).
part_group(g2, [r3808]).
group_area(g2, 11775).
part_group(g3, [r12]).
group_area(g3, 2446).
part_group(g4, [r1808]).
group_area(g4, 1522).
part_group(g5, [r3806]).
group_area(g5, 1377).
part_group(g6, [r255]).
group_area(g6, 1327).
part_group(g7, [r2067]).
group_area(g7, 998).
part_group(g8, [r306]).
group_area(g8, 894).
part_group(g9, [r647]).
group_area(g9, 542).
part_group(g10, [r1259]).
group_area(g10, 15).
part_group(g11, [r2970]).
group_area(g11, 10).
part_group(g12, [r2850]).
group_area(g12, 5).
part_group(g13, [r2801]).
group_area(g13, 5).
part_group(g14, [r8579]).
group_area(g14, 4).
part_group(g15, [r6308]).
group_area(g15, 4).
part_group(g16, [r8568]).
group_area(g16, 4).
background(r1).
detachable(r1259).
detachable(r2801).
detachable(r2850).
detachable(r2970).
detachable(r5383).
detachable(r6308).
detachable(r8568).
detachable(r8569).
detachable(r8579).
object_instance(o1, [r3438,r3738,r3806,r5383,r7382,r7611,r8569]).
object_instance(o2, [r3808]).
object_instance(o3, [r12]).
object_instance(o4, [r1808]).
object_instance(o5, [r255]).
object_instance(o6, [r2067]).
object_instance(o7, [r306]).
object_instance(o8, [r647]).
object_instance(o9, [r1259]).
object_instance(o10, [r2970]).
object_instance(o11, [r2850]).
object_instance(o12, [r2801]).
object_instance(o13, [r8579]).
object_instance(o14, [r6308]).
object_instance(o15, [r8568]).
part_of(r1259, r1).
part_of(r2801, r1).
part_of(r2850, r1).
part_of(r2970, r1).
part_of(r5383, r3738).
part_of(r6308, r1).
part_of(r8568, r1).
part_of(r8569, r3438).
part_of(r8579, r1).
squarish(r8579).
