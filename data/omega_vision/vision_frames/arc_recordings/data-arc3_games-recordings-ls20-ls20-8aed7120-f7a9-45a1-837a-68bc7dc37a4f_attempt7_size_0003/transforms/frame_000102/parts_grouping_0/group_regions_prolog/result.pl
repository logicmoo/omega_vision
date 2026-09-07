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
part_group(g1, [r10,r5]).
group_area(g1, 1000).
part_group(g2, [r2]).
group_area(g2, 61600).
part_group(g3, [r12]).
group_area(g3, 1500).
part_group(g4, [r11]).
group_area(g4, 1000).
part_group(g5, [r3,r7]).
group_area(g5, 9800).
part_group(g6, [r17,r18]).
group_area(g6, 8400).
part_group(g7, [r15]).
group_area(g7, 2000).
part_group(g8, [r13]).
group_area(g8, 500).
part_group(g9, [r16]).
group_area(g9, 400).
part_group(g10, [r19]).
group_area(g10, 400).
part_group(g11, [r20]).
group_area(g11, 400).
part_group(g12, [r21]).
group_area(g12, 400).
part_group(g13, [r14]).
group_area(g13, 100).
background(r1).
background(r4).
detachable(r13).
detachable(r14).
detachable(r15).
detachable(r16).
detachable(r19).
detachable(r20).
object_instance(o1, [r10,r11,r12,r2,r3,r5,r7]).
object_instance(o2, [r17,r18]).
object_instance(o3, [r15]).
object_instance(o4, [r13]).
object_instance(o5, [r16]).
object_instance(o6, [r19]).
object_instance(o7, [r20]).
object_instance(o8, [r21]).
object_instance(o9, [r14]).
part_of(r13, r1).
part_of(r14, r1).
part_of(r15, r1).
part_of(r16, r1).
part_of(r19, r1).
part_of(r20, r1).
squarish(r12).
squarish(r14).
squarish(r16).
squarish(r19).
squarish(r20).
squarish(r21).
