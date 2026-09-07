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
part_group(g2, [r12,r14,r5]).
group_area(g2, 156700).
part_group(g3, [r11,r13]).
group_area(g3, 1600).
part_group(g4, [r21,r22,r7]).
group_area(g4, 2100).
part_group(g5, [r20]).
group_area(g5, 4300).
part_group(g6, [r6]).
group_area(g6, 1000).
part_group(g7, [r1]).
group_area(g7, 20800).
part_group(g8, [r24,r25,r26,r27,r28,r29]).
group_area(g8, 20800).
part_group(g9, [r23]).
group_area(g9, 10000).
background(r2).
detachable(r12).
detachable(r14).
detachable(r21).
detachable(r22).
detachable(r23).
detachable(r27).
detachable(r28).
object_instance(o1, [r11,r12,r13,r14,r20,r21,r22,r3,r4,r5,r6,r7]).
object_instance(o2, [r1]).
object_instance(o3, [r24,r25,r26,r27,r28,r29]).
object_instance(o4, [r23]).
part_of(r12, r11).
part_of(r14, r13).
part_of(r21, r20).
part_of(r22, r20).
part_of(r23, r2).
part_of(r27, r24).
part_of(r28, r24).
squarish(r12).
squarish(r14).
squarish(r22).
squarish(r23).
squarish(r27).
squarish(r28).
squarish(r29).
squarish(r7).
