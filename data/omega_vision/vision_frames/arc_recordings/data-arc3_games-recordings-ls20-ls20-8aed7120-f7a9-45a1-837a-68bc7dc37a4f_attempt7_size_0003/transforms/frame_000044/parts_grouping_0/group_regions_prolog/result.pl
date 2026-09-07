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
part_group(g1, [r10,r13]).
group_area(g1, 400).
part_group(g2, [r16,r3,r6]).
group_area(g2, 32800).
part_group(g3, [r15]).
group_area(g3, 800).
part_group(g4, [r7]).
group_area(g4, 1500).
part_group(g5, [r5]).
group_area(g5, 1000).
part_group(g6, [r4]).
group_area(g6, 5400).
part_group(g7, [r17,r18]).
group_area(g7, 8400).
part_group(g8, [r19]).
group_area(g8, 400).
part_group(g9, [r20]).
group_area(g9, 400).
part_group(g10, [r21]).
group_area(g10, 400).
background(r1).
background(r2).
detachable(r10).
detachable(r13).
detachable(r16).
detachable(r19).
detachable(r20).
object_instance(o1, [r10,r13,r15,r16,r3,r4,r5,r6,r7]).
object_instance(o2, [r17,r18]).
object_instance(o3, [r19]).
object_instance(o4, [r20]).
object_instance(o5, [r21]).
part_of(r10, r6).
part_of(r13, r6).
part_of(r16, r15).
part_of(r19, r1).
part_of(r20, r1).
squarish(r10).
squarish(r16).
squarish(r19).
squarish(r20).
squarish(r21).
squarish(r7).
