% group_regions.pl — bbox-FREE symbolic grouping over topological region facts
% from pixels_to_regions.py.  Containment comes from `encloses/2` (one region
% fully surrounds another) and object instances from connected components of
% `adjacent/2` (pixels actually touch).  No bounding boxes are ever used.
%
% Facts consumed:
%   region(Id, Color, Area, centroid(CX,CY)).
%   adjacent(A, B).  shared_edge(A, B, Pixels).
%   encloses(Outer, Inner).  border(Id).  img_size(W, H).
%
% Run: swipl -q -g "consult('group_regions.pl'), consult('REGIONS.pl'), report" -t halt

:- dynamic region/4.
:- dynamic adjacent/2.
:- dynamic shared_edge/3.
:- dynamic encloses/2.
:- dynamic border/1.
:- dynamic img_size/2.
:- dynamic perimeter/2.
:- dynamic polygon/2.
:- dynamic hole/2.
:- dynamic midline/2.

% ---- parts map: the FIRST artifact Prolog produces --------------------------
% Every part as simplified boundary polygons, OUTER edge (silhouette,
% polygon/2) separate from INNER edges (holes, hole/2): part_map/1 lists
% part(Id, Color, Area, Centroid, Outer, Holes), largest first.
part_map(Parts) :-
    findall(Area-part(Id, Color, Area, Centroid, Outer, Holes),
            ( region(Id, Color, Area, Centroid),
              polygon(Id, Outer),
              findall(H, hole(Id, H), Holes) ),
            Keyed),
    sort(1, @>=, Keyed, Sorted),
    findall(P, member(_-P, Sorted), Parts).

part(Id, Color, Area, Centroid) :- region(Id, Color, Area, Centroid).

% ---- background: hugs the edge and is large (bridges unrelated objects) -----
background(Id) :-
    border(Id),
    img_size(W, H),
    region(Id, _, Area, _),
    Area >= 0.10 * W * H.

foreground(Id) :- region(Id, _, _, _), \+ background(Id).

% ---- containment: straight from topology, no boxes -------------------------
part_of(Inner, Outer) :- encloses(Outer, Inner).

group(Outer, Inners) :-
    findall(I, encloses(Outer, I), Inners),
    Inners \== [].

% ---- object instances: connected components of touch adjacency -------------
adj(A, B) :- adjacent(A, B).
adj(A, B) :- adjacent(B, A).
nadj(A, B) :- adj(A, B), \+ background(A), \+ background(B).

% ---- part groups: strong exact-edge attachment ------------------------------
% Two parts belong to one group when they share an exact edge long enough to
% mean "attached" (a hairline lying along a face shares a long boundary), and
% groups chain onward through members that share edges leading away from the
% others (hair -> face -> body). Purely topological; never a box.
strong_edge_min(8).

sedge(A, B, N) :- shared_edge(A, B, N).
sedge(A, B, N) :- shared_edge(B, A, N).

strong_adj(A, B) :-
    sedge(A, B, N),
    strong_edge_min(Min),
    N >= Min,
    \+ background(A),
    \+ background(B).

% ---- squarish: compact tile-like silhouette (bbox-free) ----------------------
% A square's perimeter^2/area is 16; organic silhouettes score far higher.
% Gridded tiles are squarish and are NOT pulled into a group by enclosure.
squarish(Id) :-
    region(Id, _, Area, _),
    Area > 0,
    perimeter(Id, P),
    Q is P * P / Area,
    Q >= 14.0,
    Q =< 18.0.

% ---- attachment ---------------------------------------------------------------
% Parts attach through strong exact edges. Enclosure-based grouping (a
% non-square object inside another joining its group, while remaining
% detachable as its own object) is designed but intentionally NOT enabled
% yet - uncomment the two clauses below to turn it on.
attached(A, B) :- strong_adj(A, B).
% attached(Outer, Inner) :-
%     encloses(Outer, Inner),
%     \+ squarish(Inner),
%     \+ background(Outer).
% attached(Inner, Outer) :-
%     encloses(Outer, Inner),
%     \+ squarish(Inner),
%     \+ background(Outer).

detachable(Inner) :- encloses(_, Inner).

scluster([], Acc, Sorted) :- sort(Acc, Sorted).
scluster([X|Q], Acc, Out) :-
    ( memberchk(X, Acc)
    -> scluster(Q, Acc, Out)
    ;  findall(Y, (attached(X, Y), \+ memberchk(Y, Acc)), Ns),
       append(Q, Ns, Q1),
       scluster(Q1, [X|Acc], Out)
    ).

part_groups(Groups) :-
    findall(Id, foreground(Id), Ids),
    partition_part_groups(Ids, [], Groups).

partition_part_groups([], _, []).
partition_part_groups([Id|T], Seen, Out) :-
    ( memberchk(Id, Seen)
    -> partition_part_groups(T, Seen, Out)
    ;  scluster([Id], [], Members),
       append(Members, Seen, Seen1),
       Out = [Members|Rest],
       partition_part_groups(T, Seen1, Rest)
    ).

cluster([], Acc, Sorted) :- sort(Acc, Sorted).
cluster([X|Q], Acc, Out) :-
    ( memberchk(X, Acc)
    -> cluster(Q, Acc, Out)
    ;  findall(Y, (nadj(X, Y), \+ memberchk(Y, Acc)), Ns),
       append(Q, Ns, Q1),
       cluster(Q1, [X|Acc], Out)
    ).

objects(Objects) :-
    findall(Id, foreground(Id), Ids),
    partition_objects(Ids, [], Objects).

partition_objects([], _, []).
partition_objects([Id|T], Seen, Objs) :-
    ( memberchk(Id, Seen)
    -> partition_objects(T, Seen, Objs)
    ;  cluster([Id], [], Members),
       append(Members, Seen, Seen1),
       Objs = [Members|Rest],
       partition_objects(T, Seen1, Rest)
    ).

% ---- report ----------------------------------------------------------------
report :-
    aggregate_all(count, region(_,_,_,_), NR),
    aggregate_all(count, encloses(_,_), NE),
    findall(Id, background(Id), Bg), length(Bg, NB),
    objects(Objs), length(Objs, NO),
    part_groups(Groups),
    include([G]>>(length(G, LG), LG >= 2), Groups, RealGroups),
    length(RealGroups, NG),
    format("~n== ~w regions, ~w enclosures, ~w background, ~w objects, ~w part groups ==~n",
           [NR, NE, NB, NO, NG]),
    part_map(Parts), length(Parts, NP),
    aggregate_all(count, midline(_, _), NM),
    format("~n== parts map (~w polygons, outer + holes, ~w midlines, largest first) ==~n", [NP, NM]),
    forall((nth1(I, Parts, part(Id, Col, Area, _, Outer, Holes)), I =< 12),
           ( length(Outer, NPts), length(Holes, NH),
             aggregate_all(count, midline(Id, _), NMid),
             format("  ~w (~w, ~w px): ~w-gon, ~w hole(s), ~w midline(s)~n", [Id, Col, Area, NPts, NH, NMid]) )),
    format("~n== containment groups (encloses) ==~n"),
    forall((group(P, Cs), length(Cs, L), L >= 1),
           ( region(P, Col, _, _), format("  ~w (~w) encloses ~w~n", [P, Col, Cs]) )),
    format("~n== part groups (strong exact-edge attachment) ==~n"),
    forall(member(G, RealGroups),
           ( length(G, LG),
             aggregate_all(sum(A), (member(M, G), region(M, _, A, _)), Area),
             findall(D, (member(D, G), detachable(D)), Ds),
             ( Ds == []
             -> format("  group of ~w parts (~w px): ~w~n", [LG, Area, G])
             ;  format("  group of ~w parts (~w px): ~w  detachable: ~w~n", [LG, Area, G, Ds]) ) )),
    format("~n== object instances (adjacency clusters, foreground) ==~n"),
    forall((member(M, Objs), length(M, L), L >= 3),
           format("  object of ~w regions: ~w~n", [L, M])).
