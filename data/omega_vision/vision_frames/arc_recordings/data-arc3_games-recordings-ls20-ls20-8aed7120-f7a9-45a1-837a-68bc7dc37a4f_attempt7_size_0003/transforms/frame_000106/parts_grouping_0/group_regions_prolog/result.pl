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
part_group(g1, [r17,r19]).
group_area(g1, 400).
part_group(g2, [r10,r12]).
group_area(g2, 1000).
part_group(g3, [r15,r3,r4,r7]).
group_area(g3, 65700).
part_group(g4, [r6]).
group_area(g4, 800).
part_group(g5, [r23,r24]).
group_area(g5, 600).
part_group(g6, [r14]).
group_area(g6, 1500).
part_group(g7, [r21]).
group_area(g7, 4300).
part_group(g8, [r11]).
group_area(g8, 1000).
part_group(g9, [r13,r2,r8,r9]).
group_area(g9, 50100).
part_group(g10, [r27,r28]).
group_area(g10, 8400).
part_group(g11, [r25]).
group_area(g11, 2000).
part_group(g12, [r26]).
group_area(g12, 400).
part_group(g13, [r29]).
group_area(g13, 400).
part_group(g14, [r30]).
group_area(g14, 400).
part_group(g15, [r31]).
group_area(g15, 400).
background(r1).
detachable(r17).
detachable(r19).
detachable(r23).
detachable(r24).
detachable(r25).
detachable(r26).
detachable(r29).
detachable(r30).
detachable(r7).
object_instance(o1, [r10,r11,r12,r13,r14,r15,r17,r19,r2,r21,r23,r24,r3,r4,r6,r7,r8,r9]).
object_instance(o2, [r27,r28]).
object_instance(o3, [r25]).
object_instance(o4, [r26]).
object_instance(o5, [r29]).
object_instance(o6, [r30]).
object_instance(o7, [r31]).
part_of(r17, r3).
part_of(r19, r3).
part_of(r23, r21).
part_of(r24, r21).
part_of(r25, r1).
part_of(r26, r1).
part_of(r29, r1).
part_of(r30, r1).
part_of(r7, r6).
squarish(r14).
squarish(r17).
squarish(r24).
squarish(r26).
squarish(r29).
squarish(r30).
squarish(r31).
squarish(r7).
