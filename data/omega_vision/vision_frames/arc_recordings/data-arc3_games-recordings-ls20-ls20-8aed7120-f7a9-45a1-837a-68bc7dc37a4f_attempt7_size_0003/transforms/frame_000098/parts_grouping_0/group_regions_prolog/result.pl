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
part_group(g1, [r2,r3,r4,r5,r6]).
group_area(g1, 69200).
part_group(g2, [r9]).
group_area(g2, 8400).
part_group(g3, [r7]).
group_area(g3, 2000).
part_group(g4, [r8]).
group_area(g4, 400).
part_group(g5, [r10]).
group_area(g5, 400).
part_group(g6, [r11]).
group_area(g6, 400).
part_group(g7, [r12]).
group_area(g7, 400).
background(r1).
detachable(r10).
detachable(r11).
detachable(r7).
detachable(r8).
detachable(r9).
object_instance(o1, [r2,r3,r4,r5,r6]).
object_instance(o2, [r9]).
object_instance(o3, [r7]).
object_instance(o4, [r8]).
object_instance(o5, [r10]).
object_instance(o6, [r11]).
object_instance(o7, [r12]).
part_of(r10, r1).
part_of(r11, r1).
part_of(r7, r1).
part_of(r8, r1).
part_of(r9, r1).
squarish(r10).
squarish(r11).
squarish(r12).
squarish(r6).
squarish(r8).
