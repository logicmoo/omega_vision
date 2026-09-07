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
part_group(g1, [r3,r7]).
group_area(g1, 89200).
part_group(g2, [r5,r6,r9]).
group_area(g2, 2100).
part_group(g3, [r4]).
group_area(g3, 4300).
part_group(g4, [r8]).
group_area(g4, 1000).
part_group(g5, [r10]).
group_area(g5, 10000).
part_group(g6, [r1]).
group_area(g6, 20800).
part_group(g7, [r17,r18,r19,r20,r21,r22]).
group_area(g7, 20800).
part_group(g8, [r14,r15,r16]).
group_area(g8, 10000).
background(r2).
detachable(r10).
detachable(r15).
detachable(r16).
detachable(r20).
detachable(r21).
detachable(r5).
detachable(r6).
object_instance(o1, [r10,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r1]).
object_instance(o3, [r17,r18,r19,r20,r21,r22]).
object_instance(o4, [r14,r15,r16]).
part_of(r10, r7).
part_of(r15, r14).
part_of(r16, r14).
part_of(r20, r17).
part_of(r21, r17).
part_of(r5, r4).
part_of(r6, r4).
squarish(r16).
squarish(r20).
squarish(r21).
squarish(r22).
squarish(r6).
squarish(r9).
