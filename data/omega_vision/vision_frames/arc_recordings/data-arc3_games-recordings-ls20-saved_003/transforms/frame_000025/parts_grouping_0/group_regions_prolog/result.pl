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
part_group(g1, [r3,r5]).
group_area(g1, 136900).
part_group(g2, [r4]).
group_area(g2, 800).
part_group(g3, [r10,r7,r8]).
group_area(g3, 2100).
part_group(g4, [r6]).
group_area(g4, 4300).
part_group(g5, [r9]).
group_area(g5, 1000).
part_group(g6, [r1]).
group_area(g6, 20800).
part_group(g7, [r14,r15,r16,r17,r18,r19]).
group_area(g7, 20800).
part_group(g8, [r11,r12,r13]).
group_area(g8, 10000).
background(r2).
detachable(r12).
detachable(r13).
detachable(r17).
detachable(r18).
detachable(r5).
detachable(r7).
detachable(r8).
object_instance(o1, [r10,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r1]).
object_instance(o3, [r14,r15,r16,r17,r18,r19]).
object_instance(o4, [r11,r12,r13]).
part_of(r12, r11).
part_of(r13, r11).
part_of(r17, r14).
part_of(r18, r14).
part_of(r5, r4).
part_of(r7, r6).
part_of(r8, r6).
squarish(r10).
squarish(r13).
squarish(r17).
squarish(r18).
squarish(r19).
squarish(r5).
squarish(r8).
