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
part_group(g1, [r2113]).
group_area(g1, 24139).
part_group(g2, [r11]).
group_area(g2, 8985).
part_group(g3, [r3448]).
group_area(g3, 5400).
part_group(g4, [r4561]).
group_area(g4, 4276).
part_group(g5, [r3035]).
group_area(g5, 3939).
part_group(g6, [r857]).
group_area(g6, 3539).
part_group(g7, [r637]).
group_area(g7, 2642).
part_group(g8, [r5157]).
group_area(g8, 2166).
part_group(g9, [r3965]).
group_area(g9, 1341).
part_group(g10, [r3435]).
group_area(g10, 779).
part_group(g11, [r5113]).
group_area(g11, 628).
part_group(g12, [r1275]).
group_area(g12, 501).
part_group(g13, [r539]).
group_area(g13, 473).
part_group(g14, [r1978]).
group_area(g14, 417).
part_group(g15, [r4085]).
group_area(g15, 22).
part_group(g16, [r4607]).
group_area(g16, 12).
part_group(g17, [r3903]).
group_area(g17, 8).
part_group(g18, [r5155]).
group_area(g18, 6).
part_group(g19, [r4125]).
group_area(g19, 4).
part_group(g20, [r3513]).
group_area(g20, 4).
part_group(g21, [r4043]).
group_area(g21, 4).
part_group(g22, [r4047]).
group_area(g22, 4).
part_group(g23, [r3931]).
group_area(g23, 4).
background(r1).
background(r16).
detachable(r3513).
detachable(r3903).
detachable(r3931).
detachable(r4043).
detachable(r4047).
detachable(r4085).
detachable(r4125).
detachable(r4607).
detachable(r5155).
object_instance(o1, [r2113,r3035]).
object_instance(o2, [r11]).
object_instance(o3, [r3448]).
object_instance(o4, [r4561]).
object_instance(o5, [r857]).
object_instance(o6, [r637]).
object_instance(o7, [r5113,r5157]).
object_instance(o8, [r3965]).
object_instance(o9, [r3435]).
object_instance(o10, [r1275]).
object_instance(o11, [r539]).
object_instance(o12, [r1978]).
object_instance(o13, [r4085]).
object_instance(o14, [r4607]).
object_instance(o15, [r3903]).
object_instance(o16, [r5155]).
object_instance(o17, [r4125]).
object_instance(o18, [r3513]).
object_instance(o19, [r4043]).
object_instance(o20, [r4047]).
object_instance(o21, [r3931]).
part_of(r3513, r1).
part_of(r3903, r16).
part_of(r3931, r16).
part_of(r4043, r16).
part_of(r4047, r16).
part_of(r4085, r16).
part_of(r4125, r16).
part_of(r4607, r16).
part_of(r5155, r16).
squarish(r3513).
squarish(r3931).
squarish(r4043).
squarish(r4047).
