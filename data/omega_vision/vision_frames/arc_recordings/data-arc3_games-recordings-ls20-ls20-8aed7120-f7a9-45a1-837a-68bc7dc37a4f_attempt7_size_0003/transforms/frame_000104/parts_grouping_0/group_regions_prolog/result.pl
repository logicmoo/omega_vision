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
part_group(g1, [r12,r14,r5]).
group_area(g1, 1500).
part_group(g2, [r13,r2,r6,r9]).
group_area(g2, 74100).
part_group(g3, [r8]).
group_area(g3, 800).
part_group(g4, [r17]).
group_area(g4, 1500).
part_group(g5, [r15]).
group_area(g5, 1000).
part_group(g6, [r10,r11,r16,r19,r3,r4,r7]).
group_area(g6, 43500).
part_group(g7, [r24,r25]).
group_area(g7, 8400).
part_group(g8, [r22]).
group_area(g8, 2000).
part_group(g9, [r20]).
group_area(g9, 500).
part_group(g10, [r23]).
group_area(g10, 400).
part_group(g11, [r26]).
group_area(g11, 400).
part_group(g12, [r27]).
group_area(g12, 400).
part_group(g13, [r28]).
group_area(g13, 400).
part_group(g14, [r21]).
group_area(g14, 100).
background(r1).
detachable(r20).
detachable(r21).
detachable(r22).
detachable(r23).
detachable(r26).
detachable(r27).
detachable(r9).
object_instance(o1, [r10,r11,r12,r13,r14,r15,r16,r17,r19,r2,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r24,r25]).
object_instance(o3, [r22]).
object_instance(o4, [r20]).
object_instance(o5, [r23]).
object_instance(o6, [r26]).
object_instance(o7, [r27]).
object_instance(o8, [r28]).
object_instance(o9, [r21]).
part_of(r20, r1).
part_of(r21, r1).
part_of(r22, r1).
part_of(r23, r1).
part_of(r26, r1).
part_of(r27, r1).
part_of(r9, r8).
squarish(r17).
squarish(r21).
squarish(r23).
squarish(r26).
squarish(r27).
squarish(r28).
squarish(r9).
