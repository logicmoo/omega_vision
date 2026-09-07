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
part_group(g1, [r70]).
group_area(g1, 14).
part_group(g2, [r846]).
group_area(g2, 14).
part_group(g3, [r376]).
group_area(g3, 13).
part_group(g4, [r822]).
group_area(g4, 12).
part_group(g5, [r486]).
group_area(g5, 12).
part_group(g6, [r430]).
group_area(g6, 8).
part_group(g7, [r101]).
group_area(g7, 6).
part_group(g8, [r86]).
group_area(g8, 5).
part_group(g9, [r874]).
group_area(g9, 5).
part_group(g10, [r374]).
group_area(g10, 5).
part_group(g11, [r402]).
group_area(g11, 4).
part_group(g12, [r281]).
group_area(g12, 4).
part_group(g13, [r810]).
group_area(g13, 4).
part_group(g14, [r183]).
group_area(g14, 4).
part_group(g15, [r443]).
group_area(g15, 4).
part_group(g16, [r65]).
group_area(g16, 4).
part_group(g17, [r326]).
group_area(g17, 4).
part_group(g18, [r201]).
group_area(g18, 4).
part_group(g19, [r745]).
group_area(g19, 4).
part_group(g20, [r115]).
group_area(g20, 4).
background(r1).
detachable(r101).
detachable(r115).
detachable(r183).
detachable(r201).
detachable(r281).
detachable(r326).
detachable(r374).
detachable(r376).
detachable(r402).
detachable(r430).
detachable(r443).
detachable(r486).
detachable(r65).
detachable(r70).
detachable(r745).
detachable(r810).
detachable(r822).
detachable(r846).
detachable(r86).
detachable(r874).
object_instance(o1, [r70]).
object_instance(o2, [r846]).
object_instance(o3, [r376]).
object_instance(o4, [r822]).
object_instance(o5, [r486]).
object_instance(o6, [r430]).
object_instance(o7, [r101]).
object_instance(o8, [r86]).
object_instance(o9, [r874]).
object_instance(o10, [r374]).
object_instance(o11, [r402]).
object_instance(o12, [r281]).
object_instance(o13, [r810]).
object_instance(o14, [r183]).
object_instance(o15, [r443]).
object_instance(o16, [r65]).
object_instance(o17, [r326]).
object_instance(o18, [r201]).
object_instance(o19, [r745]).
object_instance(o20, [r115]).
part_of(r101, r1).
part_of(r115, r1).
part_of(r183, r1).
part_of(r201, r1).
part_of(r281, r1).
part_of(r326, r1).
part_of(r374, r1).
part_of(r376, r1).
part_of(r402, r1).
part_of(r430, r1).
part_of(r443, r1).
part_of(r486, r1).
part_of(r65, r1).
part_of(r70, r1).
part_of(r745, r1).
part_of(r810, r1).
part_of(r822, r1).
part_of(r846, r1).
part_of(r86, r1).
part_of(r874, r1).
squarish(r201).
squarish(r65).
squarish(r745).
