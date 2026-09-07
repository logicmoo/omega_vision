% shape_finder_prolog: outer edges, inner edges, inner medials
:- dynamic region/4.
:- dynamic polygon/2.
:- dynamic hole/2.
:- dynamic midline/2.
:- dynamic fillpoint/3.
:- dynamic adjacent/2.
:- dynamic shared_edge/3.
:- dynamic img_size/2.
img_size(96, 41).

region(r1, '#000000', 3936, centroid(48,20)).
polygon(r1, [xy(0,0),xy(0,40),xy(94,40),xy(95,39),xy(95,1),xy(94,0),xy(1,0),xy(0,0)]).
midline(r1, [xy(20,20),xy(75,20)]).
fillpoint(r1, xy(75,20), 21).
fillpoint(r1, xy(74,20), 21).
fillpoint(r1, xy(73,20), 21).
fillpoint(r1, xy(72,20), 21).
fillpoint(r1, xy(71,20), 21).
