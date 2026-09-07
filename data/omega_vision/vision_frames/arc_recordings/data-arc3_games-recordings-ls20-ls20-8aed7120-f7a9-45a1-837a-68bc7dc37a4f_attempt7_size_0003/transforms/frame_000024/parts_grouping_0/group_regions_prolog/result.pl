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
part_group(g1, [r12,r16,r8]).
group_area(g1, 1500).
part_group(g2, [r3]).
group_area(g2, 69500).
part_group(g3, [r4,r9]).
group_area(g3, 900).
part_group(g4, [r11]).
group_area(g4, 1500).
part_group(g5, [r10]).
group_area(g5, 1000).
part_group(g6, [r17,r18,r19,r2,r6,r7]).
group_area(g6, 36400).
part_group(g7, [r20,r21]).
group_area(g7, 8400).
part_group(g8, [r22]).
group_area(g8, 400).
part_group(g9, [r23]).
group_area(g9, 400).
part_group(g10, [r24]).
group_area(g10, 400).
background(r1).
detachable(r22).
detachable(r23).
object_instance(o1, [r10,r11,r12,r16,r17,r18,r19,r2,r3,r4,r6,r7,r8,r9]).
object_instance(o2, [r20,r21]).
object_instance(o3, [r22]).
object_instance(o4, [r23]).
object_instance(o5, [r24]).
part_of(r22, r1).
part_of(r23, r1).
squarish(r11).
squarish(r22).
squarish(r23).
squarish(r24).
