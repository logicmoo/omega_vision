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
part_group(g1, [r12]).
group_area(g1, 500).
part_group(g2, [r11,r14,r3,r4,r5,r7]).
group_area(g2, 56900).
part_group(g3, [r13,r6]).
group_area(g3, 1600).
part_group(g4, [r10]).
group_area(g4, 1500).
part_group(g5, [r9]).
group_area(g5, 1000).
part_group(g6, [r2,r8]).
group_area(g6, 46600).
part_group(g7, [r18,r19]).
group_area(g7, 8400).
part_group(g8, [r16]).
group_area(g8, 2000).
part_group(g9, [r17]).
group_area(g9, 400).
part_group(g10, [r20]).
group_area(g10, 400).
part_group(g11, [r21]).
group_area(g11, 400).
part_group(g12, [r22]).
group_area(g12, 400).
background(r1).
detachable(r14).
detachable(r16).
detachable(r17).
detachable(r20).
detachable(r21).
detachable(r7).
object_instance(o1, [r10,r11,r12,r13,r14,r2,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r18,r19]).
object_instance(o3, [r16]).
object_instance(o4, [r17]).
object_instance(o5, [r20]).
object_instance(o6, [r21]).
object_instance(o7, [r22]).
part_of(r14, r13).
part_of(r16, r1).
part_of(r17, r1).
part_of(r20, r1).
part_of(r21, r1).
part_of(r7, r6).
squarish(r10).
squarish(r14).
squarish(r17).
squarish(r18).
squarish(r20).
squarish(r21).
squarish(r22).
squarish(r4).
squarish(r7).
