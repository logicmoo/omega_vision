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
part_group(g1, [r3,r4]).
group_area(g1, 1000).
part_group(g2, [r12,r5]).
group_area(g2, 157500).
part_group(g3, [r11]).
group_area(g3, 800).
part_group(g4, [r10,r19,r20]).
group_area(g4, 2100).
part_group(g5, [r18]).
group_area(g5, 4300).
part_group(g6, [r9]).
group_area(g6, 1000).
part_group(g7, [r1]).
group_area(g7, 20800).
part_group(g8, [r22,r23,r24,r25,r26,r27]).
group_area(g8, 20800).
part_group(g9, [r21]).
group_area(g9, 10000).
background(r2).
detachable(r12).
detachable(r19).
detachable(r20).
detachable(r21).
detachable(r25).
detachable(r26).
object_instance(o1, [r10,r11,r12,r18,r19,r20,r3,r4,r5,r9]).
object_instance(o2, [r1]).
object_instance(o3, [r22,r23,r24,r25,r26,r27]).
object_instance(o4, [r21]).
part_of(r12, r11).
part_of(r19, r18).
part_of(r20, r18).
part_of(r21, r2).
part_of(r25, r22).
part_of(r26, r22).
squarish(r10).
squarish(r12).
squarish(r20).
squarish(r21).
squarish(r23).
squarish(r25).
squarish(r26).
squarish(r27).
