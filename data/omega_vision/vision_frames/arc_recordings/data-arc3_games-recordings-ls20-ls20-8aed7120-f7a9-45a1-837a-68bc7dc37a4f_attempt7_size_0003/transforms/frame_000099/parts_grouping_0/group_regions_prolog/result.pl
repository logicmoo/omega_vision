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
part_group(g1, [r12,r2,r3,r7,r8,r9]).
group_area(g1, 33900).
part_group(g2, [r15,r16]).
group_area(g2, 8400).
part_group(g3, [r6]).
group_area(g3, 2600).
part_group(g4, [r13]).
group_area(g4, 2000).
part_group(g5, [r14]).
group_area(g5, 400).
part_group(g6, [r17]).
group_area(g6, 400).
part_group(g7, [r18]).
group_area(g7, 400).
part_group(g8, [r19]).
group_area(g8, 400).
part_group(g9, [r11]).
group_area(g9, 300).
part_group(g10, [r10]).
group_area(g10, 100).
background(r1).
background(r5).
detachable(r10).
detachable(r11).
detachable(r13).
detachable(r14).
detachable(r17).
detachable(r18).
object_instance(o1, [r12,r2,r3,r7,r8,r9]).
object_instance(o2, [r15,r16]).
object_instance(o3, [r6]).
object_instance(o4, [r13]).
object_instance(o5, [r14]).
object_instance(o6, [r17]).
object_instance(o7, [r18]).
object_instance(o8, [r19]).
object_instance(o9, [r11]).
object_instance(o10, [r10]).
part_of(r10, r1).
part_of(r11, r1).
part_of(r13, r1).
part_of(r14, r1).
part_of(r17, r1).
part_of(r18, r1).
squarish(r10).
squarish(r12).
squarish(r14).
squarish(r15).
squarish(r17).
squarish(r18).
squarish(r19).
squarish(r7).
squarish(r9).
