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
part_group(g1, [r11,r13,r14,r2,r8]).
group_area(g1, 23100).
part_group(g2, [r4,r5]).
group_area(g2, 10700).
part_group(g3, [r17,r18,r19]).
group_area(g3, 10800).
part_group(g4, [r20]).
group_area(g4, 8400).
part_group(g5, [r15]).
group_area(g5, 500).
part_group(g6, [r21]).
group_area(g6, 400).
part_group(g7, [r22]).
group_area(g7, 400).
part_group(g8, [r23]).
group_area(g8, 400).
part_group(g9, [r16]).
group_area(g9, 100).
background(r1).
background(r3).
detachable(r11).
detachable(r15).
detachable(r16).
detachable(r18).
detachable(r19).
detachable(r20).
detachable(r21).
detachable(r22).
detachable(r8).
object_instance(o1, [r11,r13,r14,r2,r8]).
object_instance(o2, [r4,r5]).
object_instance(o3, [r17,r18,r19]).
object_instance(o4, [r20]).
object_instance(o5, [r15]).
object_instance(o6, [r21]).
object_instance(o7, [r22]).
object_instance(o8, [r23]).
object_instance(o9, [r16]).
part_of(r11, r2).
part_of(r15, r1).
part_of(r16, r1).
part_of(r18, r17).
part_of(r19, r17).
part_of(r20, r1).
part_of(r21, r1).
part_of(r22, r1).
part_of(r8, r2).
squarish(r14).
squarish(r16).
squarish(r19).
squarish(r21).
squarish(r22).
squarish(r23).
squarish(r8).
