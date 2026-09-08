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
part_group(g1, [r1781,r1878,r2358,r2476]).
group_area(g1, 4635).
part_group(g2, [r15,r462]).
group_area(g2, 2665).
part_group(g3, [r858]).
group_area(g3, 1384).
part_group(g4, [r2452]).
group_area(g4, 883).
part_group(g5, [r3111]).
group_area(g5, 401).
part_group(g6, [r3103]).
group_area(g6, 288).
part_group(g7, [r975]).
group_area(g7, 225).
part_group(g8, [r3452,r3505]).
group_area(g8, 304).
part_group(g9, [r3602]).
group_area(g9, 200).
part_group(g10, [r3239]).
group_area(g10, 196).
part_group(g11, [r995]).
group_area(g11, 147).
part_group(g12, [r3201]).
group_area(g12, 138).
part_group(g13, [r3134]).
group_area(g13, 136).
part_group(g14, [r3195]).
group_area(g14, 120).
part_group(g15, [r292]).
group_area(g15, 98).
part_group(g16, [r3544]).
group_area(g16, 98).
part_group(g17, [r3281]).
group_area(g17, 97).
part_group(g18, [r3693]).
group_area(g18, 5).
part_group(g19, [r2906]).
group_area(g19, 4).
background(r1).
detachable(r2906).
detachable(r3693).
object_instance(o1, [r1781,r1878,r2358,r2476]).
object_instance(o2, [r15,r462]).
object_instance(o3, [r858]).
object_instance(o4, [r2452]).
object_instance(o5, [r3111]).
object_instance(o6, [r3103,r3239,r3452,r3505]).
object_instance(o7, [r975]).
object_instance(o8, [r3602]).
object_instance(o9, [r995]).
object_instance(o10, [r3201]).
object_instance(o11, [r3134,r3195]).
object_instance(o12, [r292]).
object_instance(o13, [r3544]).
object_instance(o14, [r3281]).
object_instance(o15, [r3693]).
object_instance(o16, [r2906]).
part_of(r2906, r1).
part_of(r3693, r1).
