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
part_group(g1, [r16,r3,r6,r8]).
group_area(g1, 135600).
part_group(g2, [r15,r5]).
group_area(g2, 1600).
part_group(g3, [r10,r11,r7]).
group_area(g3, 2100).
part_group(g4, [r9]).
group_area(g4, 4300).
part_group(g5, [r4]).
group_area(g5, 1000).
part_group(g6, [r1]).
group_area(g6, 20800).
part_group(g7, [r20,r21,r22,r23,r24,r25]).
group_area(g7, 20800).
part_group(g8, [r17,r18,r19]).
group_area(g8, 10000).
background(r2).
detachable(r10).
detachable(r11).
detachable(r16).
detachable(r18).
detachable(r19).
detachable(r23).
detachable(r24).
detachable(r6).
object_instance(o1, [r10,r11,r15,r16,r3,r4,r5,r6,r7,r8,r9]).
object_instance(o2, [r1]).
object_instance(o3, [r20,r21,r22,r23,r24,r25]).
object_instance(o4, [r17,r18,r19]).
part_of(r10, r9).
part_of(r11, r9).
part_of(r16, r15).
part_of(r18, r17).
part_of(r19, r17).
part_of(r23, r20).
part_of(r24, r20).
part_of(r6, r5).
squarish(r11).
squarish(r16).
squarish(r19).
squarish(r23).
squarish(r24).
squarish(r25).
squarish(r6).
squarish(r7).
