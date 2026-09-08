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
part_group(g1, [r14,r16,r2440,r2631,r3542,r4153,r4858,r4990,r5855]).
group_area(g1, 26305).
part_group(g2, [r2555]).
group_area(g2, 6140).
part_group(g3, [r7945]).
group_area(g3, 5544).
part_group(g4, [r12044]).
group_area(g4, 4690).
part_group(g5, [r4110,r4227,r4307,r5185,r5342]).
group_area(g5, 10858).
part_group(g6, [r6091]).
group_area(g6, 3972).
part_group(g7, [r2805]).
group_area(g7, 3435).
part_group(g8, [r1]).
group_area(g8, 3206).
part_group(g9, [r9092]).
group_area(g9, 2809).
part_group(g10, [r6184]).
group_area(g10, 2648).
part_group(g11, [r577]).
group_area(g11, 2406).
part_group(g12, [r1713]).
group_area(g12, 1850).
part_group(g13, [r5156]).
group_area(g13, 1140).
part_group(g14, [r10669]).
group_area(g14, 1056).
part_group(g15, [r11774]).
group_area(g15, 790).
part_group(g16, [r11280]).
group_area(g16, 775).
part_group(g17, [r4659]).
group_area(g17, 743).
part_group(g18, [r7637,r7772]).
group_area(g18, 1062).
part_group(g19, [r12724]).
group_area(g19, 650).
part_group(g20, [r10652]).
group_area(g20, 290).
part_group(g21, [r7237]).
group_area(g21, 14).
background(r1156).
background(r18).
detachable(r7237).
object_instance(o1, [r14,r16,r2440,r2631,r3542,r4110,r4153,r4227,r4307,r4858,r4990,r5156,r5185,r5342,r577,r5855,r6184,r7945]).
object_instance(o2, [r2555]).
object_instance(o3, [r12044]).
object_instance(o4, [r6091]).
object_instance(o5, [r2805]).
object_instance(o6, [r1]).
object_instance(o7, [r9092]).
object_instance(o8, [r1713]).
object_instance(o9, [r10669]).
object_instance(o10, [r11774]).
object_instance(o11, [r11280]).
object_instance(o12, [r4659]).
object_instance(o13, [r7637,r7772]).
object_instance(o14, [r12724]).
object_instance(o15, [r10652]).
object_instance(o16, [r7237]).
part_of(r7237, r1156).
