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
part_group(g1, [r5,r7]).
group_area(g1, 1000).
part_group(g2, [r13,r2]).
group_area(g2, 61300).
part_group(g3, [r12]).
group_area(g3, 800).
part_group(g4, [r9]).
group_area(g4, 1500).
part_group(g5, [r8]).
group_area(g5, 1000).
part_group(g6, [r3,r6]).
group_area(g6, 9800).
part_group(g7, [r16,r17]).
group_area(g7, 8400).
part_group(g8, [r14]).
group_area(g8, 2000).
part_group(g9, [r10]).
group_area(g9, 500).
part_group(g10, [r15]).
group_area(g10, 400).
part_group(g11, [r18]).
group_area(g11, 400).
part_group(g12, [r19]).
group_area(g12, 400).
part_group(g13, [r20]).
group_area(g13, 400).
part_group(g14, [r11]).
group_area(g14, 100).
background(r1).
background(r4).
detachable(r10).
detachable(r11).
detachable(r13).
detachable(r14).
detachable(r15).
detachable(r18).
detachable(r19).
object_instance(o1, [r12,r13,r2,r3,r5,r6,r7,r8,r9]).
object_instance(o2, [r16,r17]).
object_instance(o3, [r14]).
object_instance(o4, [r10]).
object_instance(o5, [r15]).
object_instance(o6, [r18]).
object_instance(o7, [r19]).
object_instance(o8, [r20]).
object_instance(o9, [r11]).
part_of(r10, r1).
part_of(r11, r1).
part_of(r13, r12).
part_of(r14, r1).
part_of(r15, r1).
part_of(r18, r1).
part_of(r19, r1).
squarish(r11).
squarish(r13).
squarish(r15).
squarish(r18).
squarish(r19).
squarish(r20).
squarish(r9).
