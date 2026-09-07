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
part_group(g1, [r15,r18]).
group_area(g1, 400).
part_group(g2, [r11]).
group_area(g2, 500).
part_group(g3, [r2,r7]).
group_area(g3, 71900).
part_group(g4, [r6]).
group_area(g4, 800).
part_group(g5, [r9]).
group_area(g5, 1500).
part_group(g6, [r8]).
group_area(g6, 1000).
part_group(g7, [r10,r12,r3,r4]).
group_area(g7, 44700).
part_group(g8, [r21,r22]).
group_area(g8, 8400).
part_group(g9, [r23]).
group_area(g9, 400).
part_group(g10, [r24]).
group_area(g10, 400).
part_group(g11, [r25]).
group_area(g11, 400).
background(r1).
detachable(r15).
detachable(r18).
detachable(r23).
detachable(r24).
detachable(r7).
object_instance(o1, [r10,r11,r12,r15,r18,r2,r3,r4,r6,r7,r8,r9]).
object_instance(o2, [r21,r22]).
object_instance(o3, [r23]).
object_instance(o4, [r24]).
object_instance(o5, [r25]).
part_of(r15, r2).
part_of(r18, r2).
part_of(r23, r1).
part_of(r24, r1).
part_of(r7, r6).
squarish(r15).
squarish(r23).
squarish(r24).
squarish(r25).
squarish(r7).
squarish(r9).
