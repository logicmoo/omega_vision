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
part_group(g1, [r3,r6]).
group_area(g1, 137700).
part_group(g2, [r5,r8,r9]).
group_area(g2, 2100).
part_group(g3, [r7]).
group_area(g3, 3800).
part_group(g4, [r4]).
group_area(g4, 1000).
part_group(g5, [r1]).
group_area(g5, 20800).
part_group(g6, [r16,r17,r18,r19,r20,r21]).
group_area(g6, 20800).
part_group(g7, [r13,r14,r15]).
group_area(g7, 10000).
background(r2).
detachable(r14).
detachable(r15).
detachable(r19).
detachable(r20).
detachable(r8).
detachable(r9).
object_instance(o1, [r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r1]).
object_instance(o3, [r16,r17,r18,r19,r20,r21]).
object_instance(o4, [r13,r14,r15]).
part_of(r14, r13).
part_of(r15, r13).
part_of(r19, r16).
part_of(r20, r16).
part_of(r8, r7).
part_of(r9, r7).
squarish(r15).
squarish(r19).
squarish(r20).
squarish(r21).
squarish(r5).
squarish(r9).
