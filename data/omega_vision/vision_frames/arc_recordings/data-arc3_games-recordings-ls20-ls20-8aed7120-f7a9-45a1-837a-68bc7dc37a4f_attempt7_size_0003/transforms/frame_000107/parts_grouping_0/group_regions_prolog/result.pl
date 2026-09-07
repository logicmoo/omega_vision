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
part_group(g1, [r13,r16]).
group_area(g1, 400).
part_group(g2, [r10,r8]).
group_area(g2, 1000).
part_group(g3, [r18,r20,r3,r9]).
group_area(g3, 59100).
part_group(g4, [r4]).
group_area(g4, 500).
part_group(g5, [r21,r22]).
group_area(g5, 600).
part_group(g6, [r17]).
group_area(g6, 1500).
part_group(g7, [r19]).
group_area(g7, 4300).
part_group(g8, [r11]).
group_area(g8, 1000).
part_group(g9, [r2,r6,r7]).
group_area(g9, 54900).
part_group(g10, [r25,r26]).
group_area(g10, 8400).
part_group(g11, [r23]).
group_area(g11, 2000).
part_group(g12, [r24]).
group_area(g12, 400).
part_group(g13, [r27]).
group_area(g13, 400).
part_group(g14, [r28]).
group_area(g14, 400).
part_group(g15, [r29]).
group_area(g15, 400).
background(r1).
detachable(r13).
detachable(r16).
detachable(r21).
detachable(r22).
detachable(r23).
detachable(r24).
detachable(r27).
detachable(r28).
object_instance(o1, [r10,r11,r13,r16,r17,r18,r19,r2,r20,r21,r22,r3,r4,r6,r7,r8,r9]).
object_instance(o2, [r25,r26]).
object_instance(o3, [r23]).
object_instance(o4, [r24]).
object_instance(o5, [r27]).
object_instance(o6, [r28]).
object_instance(o7, [r29]).
part_of(r13, r9).
part_of(r16, r9).
part_of(r21, r19).
part_of(r22, r19).
part_of(r23, r1).
part_of(r24, r1).
part_of(r27, r1).
part_of(r28, r1).
squarish(r13).
squarish(r17).
squarish(r22).
squarish(r24).
squarish(r27).
squarish(r28).
squarish(r29).
