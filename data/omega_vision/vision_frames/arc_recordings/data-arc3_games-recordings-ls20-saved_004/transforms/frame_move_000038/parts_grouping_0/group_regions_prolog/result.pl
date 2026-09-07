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
part_group(g2, [r5]).
group_area(g2, 158800).
part_group(g3, [r14,r15,r7]).
group_area(g3, 2100).
part_group(g4, [r13]).
group_area(g4, 4300).
part_group(g5, [r6]).
group_area(g5, 1000).
part_group(g6, [r1]).
group_area(g6, 20800).
part_group(g7, [r19,r20,r21,r22,r23,r24]).
group_area(g7, 20800).
part_group(g8, [r16,r17,r18]).
group_area(g8, 10000).
background(r2).
detachable(r14).
detachable(r15).
detachable(r17).
detachable(r18).
detachable(r22).
detachable(r23).
object_instance(o1, [r13,r14,r15,r3,r4,r5,r6,r7]).
object_instance(o2, [r1]).
object_instance(o3, [r19,r20,r21,r22,r23,r24]).
object_instance(o4, [r16,r17,r18]).
part_of(r14, r13).
part_of(r15, r13).
part_of(r17, r16).
part_of(r18, r16).
part_of(r22, r19).
part_of(r23, r19).
squarish(r15).
squarish(r18).
squarish(r22).
squarish(r23).
squarish(r24).
squarish(r7).
