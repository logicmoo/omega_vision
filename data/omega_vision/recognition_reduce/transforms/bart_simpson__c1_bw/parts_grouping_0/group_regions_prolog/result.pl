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
part_group(g1, [r1100,r1534,r1650,r1750]).
group_area(g1, 9333).
part_group(g2, [r480]).
group_area(g2, 1175).
part_group(g3, [r1859,r2041,r2139]).
group_area(g3, 1141).
part_group(g4, [r466]).
group_area(g4, 700).
part_group(g5, [r1768]).
group_area(g5, 599).
part_group(g6, [r1897,r2082]).
group_area(g6, 688).
part_group(g7, [r1840]).
group_area(g7, 143).
part_group(g8, [r1771]).
group_area(g8, 142).
part_group(g9, [r1781]).
group_area(g9, 127).
background(r1).
detachable(r1534).
object_instance(o1, [r1100,r1534,r1650,r1750,r1768,r1771,r1781]).
object_instance(o2, [r480]).
object_instance(o3, [r1840,r1859,r1897,r2041,r2082,r2139]).
object_instance(o4, [r466]).
part_of(r1534, r1100).
squarish(r1750).
