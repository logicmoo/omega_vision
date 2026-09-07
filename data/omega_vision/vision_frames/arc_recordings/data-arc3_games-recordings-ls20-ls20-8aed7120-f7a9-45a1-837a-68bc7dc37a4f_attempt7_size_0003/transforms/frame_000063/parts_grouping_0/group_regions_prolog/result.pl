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
part_group(g1, [r12,r15]).
group_area(g1, 400).
part_group(g2, [r2]).
group_area(g2, 45800).
part_group(g3, [r9]).
group_area(g3, 1500).
part_group(g4, [r6]).
group_area(g4, 1000).
part_group(g5, [r3,r4,r8]).
group_area(g5, 56000).
part_group(g6, [r19,r20]).
group_area(g6, 8400).
part_group(g7, [r17]).
group_area(g7, 2000).
part_group(g8, [r18]).
group_area(g8, 400).
part_group(g9, [r21]).
group_area(g9, 400).
part_group(g10, [r22]).
group_area(g10, 400).
part_group(g11, [r23]).
group_area(g11, 400).
background(r1).
detachable(r12).
detachable(r15).
detachable(r17).
detachable(r18).
detachable(r21).
detachable(r22).
object_instance(o1, [r12,r15,r2,r3,r4,r6,r8,r9]).
object_instance(o2, [r19,r20]).
object_instance(o3, [r17]).
object_instance(o4, [r18]).
object_instance(o5, [r21]).
object_instance(o6, [r22]).
object_instance(o7, [r23]).
part_of(r12, r2).
part_of(r15, r2).
part_of(r17, r1).
part_of(r18, r1).
part_of(r21, r1).
part_of(r22, r1).
squarish(r12).
squarish(r18).
squarish(r21).
squarish(r22).
squarish(r23).
squarish(r9).
