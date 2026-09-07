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
part_group(g1, [r10,r11,r3,r4,r5,r6]).
group_area(g1, 144600).
part_group(g2, [r1]).
group_area(g2, 20800).
part_group(g3, [r15,r16,r17,r18,r19]).
group_area(g3, 20800).
part_group(g4, [r12,r13,r14]).
group_area(g4, 10000).
background(r2).
detachable(r13).
detachable(r14).
detachable(r16).
detachable(r17).
detachable(r18).
detachable(r5).
detachable(r6).
object_instance(o1, [r10,r11,r3,r4,r5,r6]).
object_instance(o2, [r1]).
object_instance(o3, [r15,r16,r17,r18,r19]).
object_instance(o4, [r12,r13,r14]).
part_of(r13, r12).
part_of(r14, r12).
part_of(r16, r15).
part_of(r17, r15).
part_of(r18, r15).
part_of(r5, r4).
part_of(r6, r4).
squarish(r11).
squarish(r14).
squarish(r17).
squarish(r18).
squarish(r19).
squarish(r6).
