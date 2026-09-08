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
part_group(g1, [r6292,r6619,r6635]).
group_area(g1, 12807).
part_group(g2, [r5641,r6462]).
group_area(g2, 8922).
part_group(g3, [r671]).
group_area(g3, 5856).
part_group(g4, [r510,r895]).
group_area(g4, 6423).
part_group(g5, [r6604]).
group_area(g5, 5721).
part_group(g6, [r202]).
group_area(g6, 771).
part_group(g7, [r2197]).
group_area(g7, 694).
part_group(g8, [r3717]).
group_area(g8, 612).
part_group(g9, [r177]).
group_area(g9, 7).
part_group(g10, [r2502]).
group_area(g10, 4).
background(r1).
detachable(r177).
detachable(r2502).
object_instance(o1, [r6292,r6604,r6619,r6635]).
object_instance(o2, [r5641,r6462]).
object_instance(o3, [r671]).
object_instance(o4, [r510,r895]).
object_instance(o5, [r202]).
object_instance(o6, [r2197]).
object_instance(o7, [r3717]).
object_instance(o8, [r177]).
object_instance(o9, [r2502]).
part_of(r177, r1).
part_of(r2502, r1).
