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
part_group(g1, [r5,r8]).
group_area(g1, 1000).
part_group(g2, [r17,r2,r7]).
group_area(g2, 65200).
part_group(g3, [r16]).
group_area(g3, 700).
part_group(g4, [r14,r15]).
group_area(g4, 600).
part_group(g5, [r12]).
group_area(g5, 1500).
part_group(g6, [r13]).
group_area(g6, 4300).
part_group(g7, [r10]).
group_area(g7, 1000).
part_group(g8, [r3,r4,r6,r9]).
group_area(g8, 49400).
part_group(g9, [r20,r21]).
group_area(g9, 8400).
part_group(g10, [r18]).
group_area(g10, 2000).
part_group(g11, [r19]).
group_area(g11, 400).
part_group(g12, [r22]).
group_area(g12, 400).
part_group(g13, [r23]).
group_area(g13, 400).
part_group(g14, [r24]).
group_area(g14, 400).
background(r1).
detachable(r14).
detachable(r15).
detachable(r17).
detachable(r18).
detachable(r19).
detachable(r22).
detachable(r23).
object_instance(o1, [r10,r12,r13,r14,r15,r16,r17,r2,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r20,r21]).
object_instance(o3, [r18]).
object_instance(o4, [r19]).
object_instance(o5, [r22]).
object_instance(o6, [r23]).
object_instance(o7, [r24]).
part_of(r14, r13).
part_of(r15, r13).
part_of(r17, r16).
part_of(r18, r1).
part_of(r19, r1).
part_of(r22, r1).
part_of(r23, r1).
squarish(r12).
squarish(r15).
squarish(r17).
squarish(r19).
squarish(r22).
squarish(r23).
squarish(r24).
