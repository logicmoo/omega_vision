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
part_group(g1, [r10,r14]).
group_area(g1, 400).
part_group(g2, [r16,r2]).
group_area(g2, 38400).
part_group(g3, [r13]).
group_area(g3, 1500).
part_group(g4, [r7]).
group_area(g4, 1000).
part_group(g5, [r3,r6]).
group_area(g5, 4800).
part_group(g6, [r21,r22]).
group_area(g6, 8400).
part_group(g7, [r19]).
group_area(g7, 2000).
part_group(g8, [r17]).
group_area(g8, 400).
part_group(g9, [r20]).
group_area(g9, 400).
part_group(g10, [r23]).
group_area(g10, 400).
part_group(g11, [r24]).
group_area(g11, 400).
part_group(g12, [r25]).
group_area(g12, 400).
part_group(g13, [r18]).
group_area(g13, 100).
background(r1).
background(r4).
detachable(r10).
detachable(r14).
detachable(r17).
detachable(r18).
detachable(r19).
detachable(r20).
detachable(r23).
detachable(r24).
object_instance(o1, [r10,r13,r14,r16,r2,r3,r6,r7]).
object_instance(o2, [r21,r22]).
object_instance(o3, [r19]).
object_instance(o4, [r17]).
object_instance(o5, [r20]).
object_instance(o6, [r23]).
object_instance(o7, [r24]).
object_instance(o8, [r25]).
object_instance(o9, [r18]).
part_of(r10, r2).
part_of(r14, r2).
part_of(r17, r1).
part_of(r18, r1).
part_of(r19, r1).
part_of(r20, r1).
part_of(r23, r1).
part_of(r24, r1).
squarish(r10).
squarish(r13).
squarish(r16).
squarish(r18).
squarish(r20).
squarish(r21).
squarish(r23).
squarish(r24).
squarish(r25).
