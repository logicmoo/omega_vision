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
part_group(g1, [r3,r5,r9]).
group_area(g1, 44200).
part_group(g2, [r4]).
group_area(g2, 800).
part_group(g3, [r11]).
group_area(g3, 1500).
part_group(g4, [r8]).
group_area(g4, 1000).
part_group(g5, [r12,r2,r6]).
group_area(g5, 42400).
part_group(g6, [r15,r16]).
group_area(g6, 8400).
part_group(g7, [r17]).
group_area(g7, 400).
part_group(g8, [r18]).
group_area(g8, 400).
part_group(g9, [r19]).
group_area(g9, 400).
background(r1).
detachable(r17).
detachable(r18).
detachable(r5).
object_instance(o1, [r11,r12,r2,r3,r4,r5,r6,r8,r9]).
object_instance(o2, [r15,r16]).
object_instance(o3, [r17]).
object_instance(o4, [r18]).
object_instance(o5, [r19]).
part_of(r17, r1).
part_of(r18, r1).
part_of(r5, r4).
squarish(r11).
squarish(r17).
squarish(r18).
squarish(r19).
squarish(r5).
