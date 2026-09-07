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
part_group(g2, [r10,r13,r15,r5]).
group_area(g2, 156700).
part_group(g3, [r14,r9]).
group_area(g3, 1600).
part_group(g4, [r12,r22,r23]).
group_area(g4, 2100).
part_group(g5, [r21]).
group_area(g5, 4300).
part_group(g6, [r11]).
group_area(g6, 1000).
part_group(g7, [r1]).
group_area(g7, 20800).
part_group(g8, [r25,r26,r27,r28,r29,r30]).
group_area(g8, 20800).
part_group(g9, [r24]).
group_area(g9, 10000).
background(r2).
detachable(r10).
detachable(r15).
detachable(r22).
detachable(r23).
detachable(r24).
detachable(r28).
detachable(r29).
object_instance(o1, [r10,r11,r12,r13,r14,r15,r21,r22,r23,r3,r4,r5,r9]).
object_instance(o2, [r1]).
object_instance(o3, [r25,r26,r27,r28,r29,r30]).
object_instance(o4, [r24]).
part_of(r10, r9).
part_of(r15, r14).
part_of(r22, r21).
part_of(r23, r21).
part_of(r24, r2).
part_of(r28, r25).
part_of(r29, r25).
squarish(r10).
squarish(r12).
squarish(r15).
squarish(r23).
squarish(r24).
squarish(r28).
squarish(r29).
squarish(r30).
