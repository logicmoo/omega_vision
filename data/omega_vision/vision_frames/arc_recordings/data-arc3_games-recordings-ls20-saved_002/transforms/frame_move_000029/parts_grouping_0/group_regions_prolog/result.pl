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
part_group(g1, [r10,r13,r3]).
group_area(g1, 136400).
part_group(g2, [r12]).
group_area(g2, 800).
part_group(g3, [r14,r5,r6]).
group_area(g3, 2100).
part_group(g4, [r4]).
group_area(g4, 4300).
part_group(g5, [r11]).
group_area(g5, 1000).
part_group(g6, [r1]).
group_area(g6, 20800).
part_group(g7, [r18,r19,r20,r21,r22,r23]).
group_area(g7, 20800).
part_group(g8, [r15,r16,r17]).
group_area(g8, 10000).
background(r2).
detachable(r13).
detachable(r16).
detachable(r17).
detachable(r21).
detachable(r22).
detachable(r5).
detachable(r6).
object_instance(o1, [r10,r11,r12,r13,r14,r3,r4,r5,r6]).
object_instance(o2, [r1]).
object_instance(o3, [r18,r19,r20,r21,r22,r23]).
object_instance(o4, [r15,r16,r17]).
part_of(r13, r12).
part_of(r16, r15).
part_of(r17, r15).
part_of(r21, r18).
part_of(r22, r18).
part_of(r5, r4).
part_of(r6, r4).
squarish(r13).
squarish(r14).
squarish(r17).
squarish(r21).
squarish(r22).
squarish(r23).
squarish(r6).
