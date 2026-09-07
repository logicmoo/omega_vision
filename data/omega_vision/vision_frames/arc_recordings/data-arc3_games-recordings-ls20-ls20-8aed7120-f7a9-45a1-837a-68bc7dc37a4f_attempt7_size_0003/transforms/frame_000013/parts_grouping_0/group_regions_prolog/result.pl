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
part_group(g1, [r8,r9]).
group_area(g1, 1000).
part_group(g2, [r12,r14,r3]).
group_area(g2, 52300).
part_group(g3, [r13]).
group_area(g3, 800).
part_group(g4, [r11]).
group_area(g4, 1500).
part_group(g5, [r10]).
group_area(g5, 1000).
part_group(g6, [r2]).
group_area(g6, 5700).
part_group(g7, [r15,r16]).
group_area(g7, 8400).
part_group(g8, [r17]).
group_area(g8, 400).
part_group(g9, [r18]).
group_area(g9, 400).
part_group(g10, [r19]).
group_area(g10, 400).
background(r1).
background(r4).
detachable(r14).
detachable(r17).
detachable(r18).
object_instance(o1, [r10,r11,r12,r13,r14,r2,r3,r8,r9]).
object_instance(o2, [r15,r16]).
object_instance(o3, [r17]).
object_instance(o4, [r18]).
object_instance(o5, [r19]).
part_of(r14, r13).
part_of(r17, r1).
part_of(r18, r1).
squarish(r11).
squarish(r14).
squarish(r17).
squarish(r18).
squarish(r19).
