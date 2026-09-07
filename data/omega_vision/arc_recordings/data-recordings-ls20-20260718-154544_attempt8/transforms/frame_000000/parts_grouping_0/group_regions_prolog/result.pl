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
part_group(g1, [r12,r3,r5]).
group_area(g1, 60600).
part_group(g2, [r11,r4]).
group_area(g2, 1600).
part_group(g3, [r9]).
group_area(g3, 1500).
part_group(g4, [r7]).
group_area(g4, 1000).
part_group(g5, [r13,r2,r6,r8]).
group_area(g5, 52700).
part_group(g6, [r14]).
group_area(g6, 8400).
part_group(g7, [r15]).
group_area(g7, 400).
part_group(g8, [r16]).
group_area(g8, 400).
part_group(g9, [r17]).
group_area(g9, 400).
background(r1).
detachable(r12).
detachable(r14).
detachable(r15).
detachable(r16).
detachable(r5).
object_instance(o1, [r11,r12,r13,r2,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r14]).
object_instance(o3, [r15]).
object_instance(o4, [r16]).
object_instance(o5, [r17]).
part_of(r12, r11).
part_of(r14, r1).
part_of(r15, r1).
part_of(r16, r1).
part_of(r5, r4).
squarish(r12).
squarish(r15).
squarish(r16).
squarish(r17).
squarish(r5).
squarish(r8).
squarish(r9).
