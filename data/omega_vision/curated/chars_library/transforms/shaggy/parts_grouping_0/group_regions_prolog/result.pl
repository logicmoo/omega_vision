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
part_group(g1, [r1]).
group_area(g1, 25208).
part_group(g2, [r1668]).
group_area(g2, 4822).
part_group(g3, [r2277]).
group_area(g3, 4221).
part_group(g4, [r9027]).
group_area(g4, 3559).
part_group(g5, [r651]).
group_area(g5, 2622).
part_group(g6, [r8163]).
group_area(g6, 1051).
part_group(g7, [r6684]).
group_area(g7, 907).
part_group(g8, [r3441]).
group_area(g8, 812).
part_group(g9, [r6304]).
group_area(g9, 721).
part_group(g10, [r4140]).
group_area(g10, 715).
part_group(g11, [r7713]).
group_area(g11, 619).
part_group(g12, [r12915]).
group_area(g12, 529).
part_group(g13, [r596]).
group_area(g13, 527).
part_group(g14, [r581]).
group_area(g14, 497).
part_group(g15, [r973]).
group_area(g15, 438).
part_group(g16, [r15034]).
group_area(g16, 411).
part_group(g17, [r5617]).
group_area(g17, 408).
part_group(g18, [r6226]).
group_area(g18, 383).
part_group(g19, [r10825]).
group_area(g19, 37).
part_group(g20, [r7247]).
group_area(g20, 8).
part_group(g21, [r6183]).
group_area(g21, 6).
part_group(g22, [r7015]).
group_area(g22, 6).
part_group(g23, [r11844]).
group_area(g23, 4).
background(r4).
detachable(r10825).
detachable(r11844).
detachable(r6183).
detachable(r7015).
detachable(r7247).
object_instance(o1, [r1]).
object_instance(o2, [r1668]).
object_instance(o3, [r2277]).
object_instance(o4, [r9027]).
object_instance(o5, [r651]).
object_instance(o6, [r8163]).
object_instance(o7, [r6684]).
object_instance(o8, [r3441]).
object_instance(o9, [r6304]).
object_instance(o10, [r4140]).
object_instance(o11, [r7713]).
object_instance(o12, [r12915]).
object_instance(o13, [r596]).
object_instance(o14, [r581]).
object_instance(o15, [r973]).
object_instance(o16, [r15034]).
object_instance(o17, [r5617]).
object_instance(o18, [r6226]).
object_instance(o19, [r10825]).
object_instance(o20, [r7247]).
object_instance(o21, [r6183]).
object_instance(o22, [r7015]).
object_instance(o23, [r11844]).
part_of(r10825, r4).
part_of(r11844, r4).
part_of(r6183, r4).
part_of(r7015, r4).
part_of(r7247, r4).
