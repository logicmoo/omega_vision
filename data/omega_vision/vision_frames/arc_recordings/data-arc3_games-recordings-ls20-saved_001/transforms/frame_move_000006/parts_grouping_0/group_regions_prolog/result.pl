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
part_group(g1, [r3,r4,r5,r6,r7,r8,r9]).
group_area(g1, 107100).
part_group(g2, [r1]).
group_area(g2, 20800).
part_group(g3, [r13,r14,r15,r16,r17,r18]).
group_area(g3, 20800).
part_group(g4, [r10,r11,r12]).
group_area(g4, 10000).
background(r2).
detachable(r11).
detachable(r12).
detachable(r16).
detachable(r17).
detachable(r5).
detachable(r6).
detachable(r8).
object_instance(o1, [r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r1]).
object_instance(o3, [r13,r14,r15,r16,r17,r18]).
object_instance(o4, [r10,r11,r12]).
part_of(r11, r10).
part_of(r12, r10).
part_of(r16, r13).
part_of(r17, r13).
part_of(r5, r4).
part_of(r6, r4).
part_of(r8, r3).
squarish(r12).
squarish(r16).
squarish(r17).
squarish(r18).
squarish(r6).
squarish(r9).
