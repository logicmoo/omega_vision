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
part_group(g1, [r1170]).
group_area(g1, 345).
part_group(g2, [r152]).
group_area(g2, 320).
part_group(g3, [r323]).
group_area(g3, 24).
part_group(g4, [r1195]).
group_area(g4, 14).
part_group(g5, [r365]).
group_area(g5, 7).
part_group(g6, [r417]).
group_area(g6, 6).
part_group(g7, [r976]).
group_area(g7, 6).
part_group(g8, [r625]).
group_area(g8, 6).
part_group(g9, [r96]).
group_area(g9, 5).
part_group(g10, [r6]).
group_area(g10, 5).
part_group(g11, [r322]).
group_area(g11, 4).
part_group(g12, [r1225]).
group_area(g12, 4).
part_group(g13, [r820]).
group_area(g13, 4).
part_group(g14, [r633]).
group_area(g14, 4).
part_group(g15, [r1179]).
group_area(g15, 4).
part_group(g16, [r1279]).
group_area(g16, 4).
background(r1).
detachable(r1179).
detachable(r1195).
detachable(r1225).
detachable(r1279).
detachable(r322).
detachable(r323).
detachable(r365).
detachable(r417).
detachable(r6).
detachable(r625).
detachable(r633).
detachable(r820).
detachable(r96).
detachable(r976).
object_instance(o1, [r1170]).
object_instance(o2, [r152]).
object_instance(o3, [r323]).
object_instance(o4, [r1195]).
object_instance(o5, [r365]).
object_instance(o6, [r417]).
object_instance(o7, [r976]).
object_instance(o8, [r625]).
object_instance(o9, [r96]).
object_instance(o10, [r6]).
object_instance(o11, [r322]).
object_instance(o12, [r1225]).
object_instance(o13, [r820]).
object_instance(o14, [r633]).
object_instance(o15, [r1179]).
object_instance(o16, [r1279]).
part_of(r1179, r1).
part_of(r1195, r1).
part_of(r1225, r1).
part_of(r1279, r1).
part_of(r322, r1).
part_of(r323, r1).
part_of(r365, r1).
part_of(r417, r1).
part_of(r6, r1).
part_of(r625, r1).
part_of(r633, r1).
part_of(r820, r1).
part_of(r96, r1).
part_of(r976, r1).
squarish(r1179).
squarish(r417).
squarish(r625).
squarish(r820).
squarish(r976).
