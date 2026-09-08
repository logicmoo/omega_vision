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
part_group(g1, [r10,r2132,r2648,r3,r3398,r4925,r5108,r5853,r6952,r7096,r8]).
group_area(g1, 91407).
part_group(g2, [r201]).
group_area(g2, 6384).
part_group(g3, [r118,r13]).
group_area(g3, 4802).
part_group(g4, [r7907]).
group_area(g4, 2061).
part_group(g5, [r2333]).
group_area(g5, 1604).
part_group(g6, [r1420]).
group_area(g6, 390).
background(r1).
background(r4).
object_instance(o1, [r10,r118,r13,r201,r2132,r2333,r2648,r3,r3398,r4925,r5108,r5853,r6952,r7096,r8]).
object_instance(o2, [r7907]).
object_instance(o3, [r1420]).
