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
part_group(g1, [r13,r18,r19]).
group_area(g1, 1500).
part_group(g2, [r14,r16,r3,r4,r7,r8]).
group_area(g2, 66200).
part_group(g3, [r15,r5,r6]).
group_area(g3, 2400).
part_group(g4, [r11]).
group_area(g4, 1500).
part_group(g5, [r10]).
group_area(g5, 1000).
part_group(g6, [r17,r2,r20,r9]).
group_area(g6, 49300).
part_group(g7, [r23,r24]).
group_area(g7, 8400).
part_group(g8, [r21]).
group_area(g8, 2000).
part_group(g9, [r22]).
group_area(g9, 400).
part_group(g10, [r25]).
group_area(g10, 400).
part_group(g11, [r26]).
group_area(g11, 400).
part_group(g12, [r27]).
group_area(g12, 400).
background(r1).
detachable(r16).
detachable(r21).
detachable(r22).
detachable(r25).
detachable(r26).
detachable(r7).
detachable(r8).
object_instance(o1, [r10,r11,r13,r14,r15,r16,r17,r18,r19,r2,r20,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r23,r24]).
object_instance(o3, [r21]).
object_instance(o4, [r22]).
object_instance(o5, [r25]).
object_instance(o6, [r26]).
object_instance(o7, [r27]).
part_of(r16, r15).
part_of(r21, r1).
part_of(r22, r1).
part_of(r25, r1).
part_of(r26, r1).
part_of(r7, r5).
part_of(r8, r6).
squarish(r11).
squarish(r16).
squarish(r22).
squarish(r25).
squarish(r26).
squarish(r27).
squarish(r7).
squarish(r8).
