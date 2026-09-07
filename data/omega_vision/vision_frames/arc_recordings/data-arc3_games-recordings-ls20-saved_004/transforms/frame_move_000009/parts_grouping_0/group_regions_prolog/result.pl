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
part_group(g1, [r3,r4]).
group_area(g1, 1000).
part_group(g2, [r14,r16,r5,r7,r8]).
group_area(g2, 156700).
part_group(g3, [r13,r15]).
group_area(g3, 1600).
part_group(g4, [r23,r24,r9]).
group_area(g4, 2100).
part_group(g5, [r22]).
group_area(g5, 4300).
part_group(g6, [r6]).
group_area(g6, 1000).
part_group(g7, [r1]).
group_area(g7, 20800).
part_group(g8, [r26,r27,r28,r29,r30,r31]).
group_area(g8, 20800).
part_group(g9, [r25]).
group_area(g9, 10000).
background(r2).
detachable(r14).
detachable(r16).
detachable(r23).
detachable(r24).
detachable(r25).
detachable(r29).
detachable(r30).
object_instance(o1, [r13,r14,r15,r16,r22,r23,r24,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r1]).
object_instance(o3, [r26,r27,r28,r29,r30,r31]).
object_instance(o4, [r25]).
part_of(r14, r13).
part_of(r16, r15).
part_of(r23, r22).
part_of(r24, r22).
part_of(r25, r2).
part_of(r29, r26).
part_of(r30, r26).
squarish(r14).
squarish(r16).
squarish(r24).
squarish(r25).
squarish(r29).
squarish(r30).
squarish(r31).
squarish(r7).
squarish(r9).
