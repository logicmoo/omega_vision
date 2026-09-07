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
part_group(g1, [r17,r20]).
group_area(g1, 400).
part_group(g2, [r11,r13,r14,r16,r24,r25,r26,r27]).
group_area(g2, 4000).
part_group(g3, [r10,r3,r30]).
group_area(g3, 161800).
part_group(g4, [r29,r9]).
group_area(g4, 1600).
part_group(g5, [r6,r7,r8]).
group_area(g5, 2100).
part_group(g6, [r4]).
group_area(g6, 4300).
part_group(g7, [r5]).
group_area(g7, 1000).
part_group(g8, [r12,r15,r28]).
group_area(g8, 29500).
part_group(g9, [r1]).
group_area(g9, 20800).
part_group(g10, [r33,r34,r35,r36,r37]).
group_area(g10, 20800).
part_group(g11, [r31,r32]).
group_area(g11, 10000).
background(r2).
detachable(r10).
detachable(r17).
detachable(r20).
detachable(r30).
detachable(r32).
detachable(r34).
detachable(r35).
detachable(r36).
detachable(r6).
detachable(r8).
object_instance(o1, [r10,r11,r12,r13,r14,r15,r16,r17,r20,r24,r25,r26,r27,r28,r29,r3,r30,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r1]).
object_instance(o3, [r33,r34,r35,r36,r37]).
object_instance(o4, [r31,r32]).
part_of(r10, r9).
part_of(r17, r3).
part_of(r20, r3).
part_of(r30, r29).
part_of(r32, r31).
part_of(r34, r33).
part_of(r35, r33).
part_of(r36, r33).
part_of(r6, r4).
part_of(r8, r4).
squarish(r10).
squarish(r15).
squarish(r17).
squarish(r28).
squarish(r30).
squarish(r35).
squarish(r36).
squarish(r37).
squarish(r7).
squarish(r8).
