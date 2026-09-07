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
part_group(g1, [r7,r9]).
group_area(g1, 400).
part_group(g2, [r11,r3]).
group_area(g2, 25700).
part_group(g3, [r10]).
group_area(g3, 800).
part_group(g4, [r8]).
group_area(g4, 1500).
part_group(g5, [r6]).
group_area(g5, 1000).
part_group(g6, [r4]).
group_area(g6, 1300).
part_group(g7, [r13]).
group_area(g7, 8400).
part_group(g8, [r5]).
group_area(g8, 2900).
part_group(g9, [r12]).
group_area(g9, 2000).
part_group(g10, [r14]).
group_area(g10, 400).
part_group(g11, [r15]).
group_area(g11, 400).
part_group(g12, [r16]).
group_area(g12, 400).
background(r1).
background(r2).
detachable(r11).
detachable(r12).
detachable(r13).
detachable(r14).
detachable(r15).
detachable(r7).
detachable(r9).
object_instance(o1, [r10,r11,r3,r4,r6,r7,r8,r9]).
object_instance(o2, [r13]).
object_instance(o3, [r5]).
object_instance(o4, [r12]).
object_instance(o5, [r14]).
object_instance(o6, [r15]).
object_instance(o7, [r16]).
part_of(r11, r10).
part_of(r12, r1).
part_of(r13, r1).
part_of(r14, r1).
part_of(r15, r1).
part_of(r7, r3).
part_of(r9, r3).
squarish(r11).
squarish(r14).
squarish(r15).
squarish(r16).
squarish(r7).
squarish(r8).
