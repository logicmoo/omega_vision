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
part_group(g2, [r3,r6,r7,r9]).
group_area(g2, 57500).
part_group(g3, [r2,r8]).
group_area(g3, 1200).
part_group(g4, [r11]).
group_area(g4, 1500).
part_group(g5, [r10]).
group_area(g5, 1000).
part_group(g6, [r12,r20,r4,r5]).
group_area(g6, 45400).
part_group(g7, [r22,r23]).
group_area(g7, 8400).
part_group(g8, [r24]).
group_area(g8, 400).
part_group(g9, [r25]).
group_area(g9, 400).
part_group(g10, [r26]).
group_area(g10, 400).
background(r1).
detachable(r15).
detachable(r18).
detachable(r24).
detachable(r25).
detachable(r9).
object_instance(o1, [r10,r11,r12,r15,r18,r2,r20,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r22,r23]).
object_instance(o3, [r24]).
object_instance(o4, [r25]).
object_instance(o5, [r26]).
part_of(r15, r3).
part_of(r18, r3).
part_of(r24, r1).
part_of(r25, r1).
part_of(r9, r8).
squarish(r11).
squarish(r15).
squarish(r24).
squarish(r25).
squarish(r26).
squarish(r9).
