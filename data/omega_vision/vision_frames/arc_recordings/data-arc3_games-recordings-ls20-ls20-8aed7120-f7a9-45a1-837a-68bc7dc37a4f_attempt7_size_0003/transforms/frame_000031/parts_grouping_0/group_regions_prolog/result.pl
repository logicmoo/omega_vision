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
part_group(g1, [r18,r19]).
group_area(g1, 400).
part_group(g2, [r14,r15,r7]).
group_area(g2, 1500).
part_group(g3, [r10,r2]).
group_area(g3, 79700).
part_group(g4, [r9]).
group_area(g4, 800).
part_group(g5, [r12]).
group_area(g5, 1500).
part_group(g6, [r11]).
group_area(g6, 1000).
part_group(g7, [r13,r16,r4,r5,r6,r8]).
group_area(g7, 41200).
part_group(g8, [r20,r21]).
group_area(g8, 8400).
part_group(g9, [r22]).
group_area(g9, 400).
part_group(g10, [r23]).
group_area(g10, 400).
part_group(g11, [r24]).
group_area(g11, 400).
background(r1).
detachable(r10).
detachable(r18).
detachable(r19).
detachable(r22).
detachable(r23).
object_instance(o1, [r10,r11,r12,r13,r14,r15,r16,r18,r19,r2,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r20,r21]).
object_instance(o3, [r22]).
object_instance(o4, [r23]).
object_instance(o5, [r24]).
part_of(r10, r9).
part_of(r18, r2).
part_of(r19, r2).
part_of(r22, r1).
part_of(r23, r1).
squarish(r10).
squarish(r12).
squarish(r18).
squarish(r22).
squarish(r23).
squarish(r24).
