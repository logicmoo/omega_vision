:- module(omega_object_tracking, [main/0, composed_groups/1]).
:- use_module(library(http/json)).
:- use_module(library(lists)).
:- include('group_regions.pl').

:- dynamic final_g/2, measured_motion/6, motion_tolerance/1.

% The existing grouping rules own attachment, including their foreground,
% minimum exact edge, interior-probe, and smooth-cutout requirements.
attachment_witness(A, B, _{kind:strong_edge, regions:[R,S], sharedPixels:N}) :-
    final_g(A, AR), final_g(B, BR), A @< B,
    member(R, AR), member(S, BR), R \== S,
    strong_adj(R, S), sedge(R, S, N).
attachment_witness(A, B, _{kind:smooth_cutout, regions:[R,S]}) :-
    final_g(A, AR), final_g(B, BR), A @< B,
    member(R, AR), member(S, BR), R \== S,
    ( nonbg_cutout(R, S) ; nonbg_cutout(S, R) ).
attachment_witness(A, B, _{kind:shared_smooth_cutout, regions:[R,S], background:Bg}) :-
    final_g(A, AR), final_g(B, BR), A @< B,
    member(R, AR), member(S, BR), R \== S,
    background(Bg), foreground(R), foreground(S),
    in_smooth_cutout(R, Bg, Ring), in_smooth_cutout(S, Bg, Ring).

disjoint_groups(A, B) :-
    final_g(A, AR), final_g(B, BR),
    \+ (member(R, AR), memberchk(R, BR)).

co_moving(A, B) :-
    measured_motion(A, AX, AY, identity, _, _),
    measured_motion(B, BX, BY, identity, _, _),
    motion_tolerance(T),
    AX*AX + AY*AY > T*T, BX*BX + BY*BY > T*T,
    abs(AX-BX) =< T, abs(AY-BY) =< T.
co_moving(A, B) :-
    measured_motion(A, _, _, Transform, AKX, AKY),
    measured_motion(B, _, _, Transform, BKX, BKY),
    memberchk(Transform, [rot90, rot180, rot270, flip_h, flip_v, transpose, anti_transpose]),
    motion_tolerance(T), abs(AKX-BKX) =< T, abs(AKY-BKY) =< T.

composition_edge(A, B) :-
    disjoint_groups(A, B), co_moving(A, B),
    ( attachment_witness(A, B, _) ; attachment_witness(B, A, _) ).

g_component([], Seen, Members) :- sort(Seen, Members).
g_component([G|Queue], Seen, Members) :-
    ( memberchk(G, Seen) -> g_component(Queue, Seen, Members)
    ; findall(N, composition_edge(G, N), Neighbors),
      append(Queue, Neighbors, Next), g_component(Next, [G|Seen], Members)
    ).

valid_composition(Members) :-
    length(Members, Count), Count >= 2,
    forall((member(A, Members), member(B, Members), A @< B),
           (disjoint_groups(A, B), co_moving(A, B))).

composed_groups(Groups) :-
    findall(Members,
            (final_g(G, _), g_component([G], [], Members), valid_composition(Members)),
            Raw),
    sort(Raw, Groups).

assert_region(R) :-
    R.centroid = [X,Y],
    assertz(region(R.id, R.color, R.area, centroid(X,Y))),
    forall(member(RawRing, R.holes),
           (maplist(xy_point, RawRing, Ring), assertz(hole(R.id, Ring)))).

xy_point([X,Y], xy(X,Y)).
assert_edge([A,B,N]) :- assertz(shared_edge(A,B,N)).
assert_adj([A,B]) :- assertz(adjacent(A,B)).
assert_enclosure([A,B]) :- assertz(encloses(A,B)).
assert_border(R) :- assertz(border(R)).
assert_probe([R,X,Y,D]) :- assertz(fillpoint(R,xy(X,Y),D)).
assert_group(G) :- assertz(final_g(G.uid,G.members)).
assert_motion(M) :-
    M.displacement = [DX,DY], M.key = [KX,KY],
    assertz(measured_motion(M.uid,DX,DY,M.transform,KX,KY)).

main :-
    json_read_dict(current_input, Input, [value_string_as(atom)]),
    assertz(img_size(Input.width, Input.height)),
    assertz(motion_tolerance(Input.tolerance)),
    maplist(assert_region, Input.regions),
    maplist(assert_edge, Input.sharedEdges),
    maplist(assert_adj, Input.adjacent),
    maplist(assert_enclosure, Input.encloses),
    maplist(assert_border, Input.borders),
    maplist(assert_probe, Input.fillpoints),
    maplist(assert_group, Input.groups),
    maplist(assert_motion, Input.motion),
    composed_groups(Components),
    findall(_{groups:[A,B], witness:Witness},
            attachment_witness(A,B,Witness), RawLinks),
    sort(RawLinks, Links),
    json_write_dict(current_output, _{components:Components, attachments:Links}, [width(0)]),
    nl.
