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
part_group(g1, [r5]).
group_area(g1, 500).
part_group(g2, [r15,r3]).
group_area(g2, 45300).
part_group(g3, [r14]).
group_area(g3, 800).
part_group(g4, [r17,r18]).
group_area(g4, 600).
part_group(g5, [r12]).
group_area(g5, 1500).
part_group(g6, [r16]).
group_area(g6, 4300).
part_group(g7, [r7]).
group_area(g7, 1000).
part_group(g8, [r2,r4,r6]).
group_area(g8, 62200).
part_group(g9, [r23,r24]).
group_area(g9, 8400).
part_group(g10, [r19,r20,r21,r22]).
group_area(g10, 2400).
part_group(g11, [r25]).
group_area(g11, 400).
part_group(g12, [r26]).
group_area(g12, 400).
part_group(g13, [r27]).
group_area(g13, 400).
background(r1).
detachable(r15).
detachable(r17).
detachable(r18).
detachable(r25).
detachable(r26).
object_instance(o1, [r12,r14,r15,r16,r17,r18,r2,r3,r4,r5,r6,r7]).
object_instance(o2, [r23,r24]).
object_instance(o3, [r19,r20,r21,r22]).
object_instance(o4, [r25]).
object_instance(o5, [r26]).
object_instance(o6, [r27]).
part_of(r15, r14).
part_of(r17, r16).
part_of(r18, r16).
part_of(r25, r1).
part_of(r26, r1).
squarish(r12).
squarish(r15).
squarish(r18).
squarish(r20).
squarish(r21).
squarish(r22).
squarish(r25).
squarish(r26).
squarish(r27).
