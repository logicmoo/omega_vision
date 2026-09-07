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
part_group(g1, [r15]).
group_area(g1, 500).
part_group(g2, [r14,r17,r3,r4,r5,r8,r9]).
group_area(g2, 56000).
part_group(g3, [r16,r6,r7]).
group_area(g3, 2400).
part_group(g4, [r12]).
group_area(g4, 1500).
part_group(g5, [r11]).
group_area(g5, 1000).
part_group(g6, [r10,r2]).
group_area(g6, 46600).
part_group(g7, [r21,r22]).
group_area(g7, 8400).
part_group(g8, [r19]).
group_area(g8, 2000).
part_group(g9, [r20]).
group_area(g9, 400).
part_group(g10, [r23]).
group_area(g10, 400).
part_group(g11, [r24]).
group_area(g11, 400).
part_group(g12, [r25]).
group_area(g12, 400).
background(r1).
detachable(r17).
detachable(r19).
detachable(r20).
detachable(r23).
detachable(r24).
detachable(r8).
detachable(r9).
object_instance(o1, [r10,r11,r12,r14,r15,r16,r17,r2,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r21,r22]).
object_instance(o3, [r19]).
object_instance(o4, [r20]).
object_instance(o5, [r23]).
object_instance(o6, [r24]).
object_instance(o7, [r25]).
part_of(r17, r16).
part_of(r19, r1).
part_of(r20, r1).
part_of(r23, r1).
part_of(r24, r1).
part_of(r8, r6).
part_of(r9, r7).
squarish(r12).
squarish(r17).
squarish(r20).
squarish(r23).
squarish(r24).
squarish(r25).
squarish(r8).
squarish(r9).
