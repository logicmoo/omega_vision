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
part_group(g1, [r10,r15,r16]).
group_area(g1, 1500).
part_group(g2, [r11,r13,r3,r4,r6]).
group_area(g2, 67100).
part_group(g3, [r12,r5]).
group_area(g3, 1600).
part_group(g4, [r9]).
group_area(g4, 1500).
part_group(g5, [r8]).
group_area(g5, 1000).
part_group(g6, [r14,r17,r2,r7]).
group_area(g6, 49300).
part_group(g7, [r20,r21]).
group_area(g7, 8400).
part_group(g8, [r18]).
group_area(g8, 2000).
part_group(g9, [r19]).
group_area(g9, 400).
part_group(g10, [r22]).
group_area(g10, 400).
part_group(g11, [r23]).
group_area(g11, 400).
part_group(g12, [r24]).
group_area(g12, 400).
background(r1).
detachable(r13).
detachable(r18).
detachable(r19).
detachable(r22).
detachable(r23).
detachable(r6).
object_instance(o1, [r10,r11,r12,r13,r14,r15,r16,r17,r2,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r20,r21]).
object_instance(o3, [r18]).
object_instance(o4, [r19]).
object_instance(o5, [r22]).
object_instance(o6, [r23]).
object_instance(o7, [r24]).
part_of(r13, r12).
part_of(r18, r1).
part_of(r19, r1).
part_of(r22, r1).
part_of(r23, r1).
part_of(r6, r5).
squarish(r13).
squarish(r19).
squarish(r22).
squarish(r23).
squarish(r24).
squarish(r6).
squarish(r9).
