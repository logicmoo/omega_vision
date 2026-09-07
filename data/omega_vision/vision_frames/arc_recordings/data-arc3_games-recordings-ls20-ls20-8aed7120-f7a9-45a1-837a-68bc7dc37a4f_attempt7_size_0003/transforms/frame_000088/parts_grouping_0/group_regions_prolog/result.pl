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
group_area(g1, 900).
part_group(g2, [r2]).
group_area(g2, 54100).
part_group(g3, [r11]).
group_area(g3, 1500).
part_group(g4, [r10]).
group_area(g4, 1000).
part_group(g5, [r13,r14,r5,r6]).
group_area(g5, 35900).
part_group(g6, [r18,r19]).
group_area(g6, 8400).
part_group(g7, [r16]).
group_area(g7, 2000).
part_group(g8, [r17]).
group_area(g8, 400).
part_group(g9, [r20]).
group_area(g9, 400).
part_group(g10, [r21]).
group_area(g10, 400).
part_group(g11, [r22]).
group_area(g11, 400).
background(r1).
detachable(r16).
detachable(r17).
detachable(r20).
detachable(r21).
object_instance(o1, [r10,r11,r13,r14,r2,r5,r6,r8,r9]).
object_instance(o2, [r18,r19]).
object_instance(o3, [r16]).
object_instance(o4, [r17]).
object_instance(o5, [r20]).
object_instance(o6, [r21]).
object_instance(o7, [r22]).
part_of(r16, r1).
part_of(r17, r1).
part_of(r20, r1).
part_of(r21, r1).
squarish(r11).
squarish(r17).
squarish(r20).
squarish(r21).
squarish(r22).
