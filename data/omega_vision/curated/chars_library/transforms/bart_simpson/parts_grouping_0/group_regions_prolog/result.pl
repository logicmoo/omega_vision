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
part_group(g1, [r11]).
group_area(g1, 4271).
part_group(g2, [r1023]).
group_area(g2, 1682).
part_group(g3, [r539,r815]).
group_area(g3, 2437).
part_group(g4, [r690,r698]).
group_area(g4, 994).
part_group(g5, [r183]).
group_area(g5, 589).
part_group(g6, [r577]).
group_area(g6, 389).
part_group(g7, [r171]).
group_area(g7, 346).
part_group(g8, [r1141]).
group_area(g8, 343).
part_group(g9, [r981]).
group_area(g9, 262).
part_group(g10, [r964]).
group_area(g10, 233).
part_group(g11, [r973]).
group_area(g11, 175).
part_group(g12, [r1063]).
group_area(g12, 162).
part_group(g13, [r893]).
group_area(g13, 126).
part_group(g14, [r1251]).
group_area(g14, 100).
part_group(g15, [r1029]).
group_area(g15, 66).
part_group(g16, [r1205]).
group_area(g16, 54).
part_group(g17, [r1252]).
group_area(g17, 54).
part_group(g18, [r989]).
group_area(g18, 53).
background(r1).
object_instance(o1, [r11]).
object_instance(o2, [r1023]).
object_instance(o3, [r539,r577,r690,r698,r815]).
object_instance(o4, [r183]).
object_instance(o5, [r171]).
object_instance(o6, [r1141]).
object_instance(o7, [r981]).
object_instance(o8, [r964]).
object_instance(o9, [r1029,r1063,r973,r989]).
object_instance(o10, [r893]).
object_instance(o11, [r1251]).
object_instance(o12, [r1205]).
object_instance(o13, [r1252]).
squarish(r981).
