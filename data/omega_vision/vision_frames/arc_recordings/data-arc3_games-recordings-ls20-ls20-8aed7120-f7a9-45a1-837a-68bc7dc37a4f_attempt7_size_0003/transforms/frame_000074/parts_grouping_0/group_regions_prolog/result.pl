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
part_group(g1, [r16,r18,r9]).
group_area(g1, 1500).
part_group(g2, [r12,r17,r3,r5,r6]).
group_area(g2, 73100).
part_group(g3, [r11,r4]).
group_area(g3, 1600).
part_group(g4, [r13]).
group_area(g4, 1500).
part_group(g5, [r10]).
group_area(g5, 1000).
part_group(g6, [r15,r19,r2,r8]).
group_area(g6, 47500).
part_group(g7, [r22,r23]).
group_area(g7, 8400).
part_group(g8, [r20]).
group_area(g8, 2000).
part_group(g9, [r21]).
group_area(g9, 400).
part_group(g10, [r24]).
group_area(g10, 400).
part_group(g11, [r25]).
group_area(g11, 400).
part_group(g12, [r26]).
group_area(g12, 400).
background(r1).
detachable(r12).
detachable(r20).
detachable(r21).
detachable(r24).
detachable(r25).
detachable(r5).
object_instance(o1, [r10,r11,r12,r13,r15,r16,r17,r18,r19,r2,r3,r4,r5,r6,r8,r9]).
object_instance(o2, [r22,r23]).
object_instance(o3, [r20]).
object_instance(o4, [r21]).
object_instance(o5, [r24]).
object_instance(o6, [r25]).
object_instance(o7, [r26]).
part_of(r12, r11).
part_of(r20, r1).
part_of(r21, r1).
part_of(r24, r1).
part_of(r25, r1).
part_of(r5, r4).
squarish(r12).
squarish(r13).
squarish(r19).
squarish(r21).
squarish(r24).
squarish(r25).
squarish(r26).
squarish(r5).
