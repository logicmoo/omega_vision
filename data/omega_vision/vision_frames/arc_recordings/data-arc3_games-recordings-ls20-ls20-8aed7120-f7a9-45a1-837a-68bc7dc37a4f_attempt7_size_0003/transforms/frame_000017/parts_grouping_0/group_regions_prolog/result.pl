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
part_group(g2, [r13,r14]).
group_area(g2, 8400).
part_group(g3, [r6]).
group_area(g3, 2600).
part_group(g4, [r15]).
group_area(g4, 400).
part_group(g5, [r16]).
group_area(g5, 400).
part_group(g6, [r17]).
group_area(g6, 400).
part_group(g7, [r11]).
group_area(g7, 300).
part_group(g8, [r10]).
group_area(g8, 100).
background(r1).
background(r5).
detachable(r10).
detachable(r11).
detachable(r15).
detachable(r16).
object_instance(o1, [r12,r2,r3,r7,r8,r9]).
object_instance(o2, [r13,r14]).
object_instance(o3, [r6]).
object_instance(o4, [r15]).
object_instance(o5, [r16]).
object_instance(o6, [r17]).
object_instance(o7, [r11]).
object_instance(o8, [r10]).
part_of(r10, r1).
part_of(r11, r1).
part_of(r15, r1).
part_of(r16, r1).
squarish(r10).
squarish(r12).
squarish(r13).
squarish(r15).
squarish(r16).
squarish(r17).
squarish(r7).
squarish(r9).
