:- use_module('../../prolog/omega_vision/object_tracking').

:- begin_tests(omega_object_tracking_core).

reset_evidence :-
    retractall(omega_object_tracking:region(_,_,_,_)),
    retractall(omega_object_tracking:final_g(_,_)),
    retractall(omega_object_tracking:measured_motion(_,_,_,_,_,_)),
    retractall(omega_object_tracking:shared_edge(_,_,_)),
    retractall(omega_object_tracking:motion_tolerance(_)),
    assertz(omega_object_tracking:motion_tolerance(0.5)).

two_groups :-
    assertz(omega_object_tracking:region(r1,red,20,centroid(1,1))),
    assertz(omega_object_tracking:region(r2,blue,20,centroid(4,1))),
    assertz(omega_object_tracking:final_g(g1,[r1])),
    assertz(omega_object_tracking:final_g(g2,[r2])).

translation :-
    assertz(omega_object_tracking:measured_motion(g1,2,0,identity,2,0)),
    assertz(omega_object_tracking:measured_motion(g2,2,0,identity,2,0)).

test(single_group_is_not_object, [setup(reset_evidence), cleanup(reset_evidence)]) :-
    assertz(omega_object_tracking:final_g(g1,[r1,r2])),
    composed_groups([]).

test(co_motion_without_attachment, [setup(reset_evidence), cleanup(reset_evidence)]) :-
    two_groups, translation, composed_groups([]).

test(attachment_without_motion, [setup(reset_evidence), cleanup(reset_evidence)]) :-
    two_groups,
    assertz(omega_object_tracking:shared_edge(r1,r2,8)),
    composed_groups([]).

test(weak_edge_is_insufficient, [setup(reset_evidence), cleanup(reset_evidence)]) :-
    two_groups, translation,
    assertz(omega_object_tracking:shared_edge(r1,r2,7)),
    composed_groups([]).

test(co_moving_strong_attachment, [setup(reset_evidence), cleanup(reset_evidence)]) :-
    two_groups, translation,
    assertz(omega_object_tracking:shared_edge(r1,r2,8)),
    composed_groups([[g1,g2]]).

test(common_rigid_rotation, [setup(reset_evidence), cleanup(reset_evidence)]) :-
    two_groups,
    assertz(omega_object_tracking:shared_edge(r1,r2,8)),
    assertz(omega_object_tracking:measured_motion(g1,2,1,rot90,10,10)),
    assertz(omega_object_tracking:measured_motion(g2,1,4,rot90,10,10)),
    composed_groups([[g1,g2]]).

test(inconsistent_rotation_centres, [setup(reset_evidence), cleanup(reset_evidence)]) :-
    two_groups,
    assertz(omega_object_tracking:shared_edge(r1,r2,8)),
    assertz(omega_object_tracking:measured_motion(g1,2,1,rot90,10,10)),
    assertz(omega_object_tracking:measured_motion(g2,1,4,rot90,12,10)),
    composed_groups([]).

:- end_tests(omega_object_tracking_core).
