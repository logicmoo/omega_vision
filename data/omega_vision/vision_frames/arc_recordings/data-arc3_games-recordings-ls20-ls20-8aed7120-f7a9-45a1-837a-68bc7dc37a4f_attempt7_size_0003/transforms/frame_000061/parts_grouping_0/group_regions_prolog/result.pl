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
part_group(g2, [r3]).
group_area(g2, 46100).
part_group(g3, [r15,r16]).
group_area(g3, 600).
part_group(g4, [r12]).
group_area(g4, 1500).
part_group(g5, [r14]).
group_area(g5, 4300).
part_group(g6, [r7]).
group_area(g6, 1000).
part_group(g7, [r2,r4,r6]).
group_area(g7, 62200).
part_group(g8, [r19,r20]).
group_area(g8, 8400).
part_group(g9, [r17]).
group_area(g9, 2000).
part_group(g10, [r18]).
group_area(g10, 400).
part_group(g11, [r21]).
group_area(g11, 400).
part_group(g12, [r22]).
group_area(g12, 400).
part_group(g13, [r23]).
group_area(g13, 400).
background(r1).
detachable(r15).
detachable(r16).
detachable(r17).
detachable(r18).
detachable(r21).
detachable(r22).
object_instance(o1, [r12,r14,r15,r16,r2,r3,r4,r5,r6,r7]).
object_instance(o2, [r19,r20]).
object_instance(o3, [r17]).
object_instance(o4, [r18]).
object_instance(o5, [r21]).
object_instance(o6, [r22]).
object_instance(o7, [r23]).
part_of(r15, r14).
part_of(r16, r14).
part_of(r17, r1).
part_of(r18, r1).
part_of(r21, r1).
part_of(r22, r1).
squarish(r12).
squarish(r16).
squarish(r18).
squarish(r19).
squarish(r21).
squarish(r22).
squarish(r23).
