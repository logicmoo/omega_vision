:- module(omega_event_detectors, [main/0]).
:- use_module(library(http/json)).
:- use_module(library(lists)).

term(P, Args, term{predicate:P,args:Args}).
phase(P, Relation, Term) :- term(P, [Relation], Term).

event(Term, Detector, Confidence, Evidence,
      event{term:Term,detector:Detector,confidence:Confidence,evidence:Evidence}).

motion_event(Input, Event) :-
    member(M, Input.motion), M.reappeared == false,
    M.confidence >= Input.minimumConfidence,
    M.displacement = [DX,DY], Magnitude is sqrt(DX*DX+DY*DY),
    Magnitude > Input.motionTolerance,
    term(moved, [M.entity], T),
    event(T, authored_motion, M.confidence, M.evidence, Event).
motion_event(Input, Event) :-
    member(M, Input.motion), M.reappeared == false,
    M.confidence >= Input.minimumConfidence, M.maskIou >= Input.rotationIou,
    M.transforms = [Transform], memberchk(Transform, [rot90,rot180,rot270]),
    term(rotated, [M.entity], T),
    event(T, authored_geometry, M.confidence, M.evidence, Event).
motion_event(Input, Event) :-
    member(M, Input.motion), M.reappeared == false,
    M.confidence >= Input.minimumConfidence, M.maskIou < Input.shapeChangeIou,
    member(G, Input.geometry), G.entity == M.entity, G.usable == true,
    \+ (G.affineIou >= Input.rotationIou, (G.uniformScale == true; G.nonuniformScale == true)),
    term(shape_changed, [M.entity], T),
    event(T, authored_geometry, M.confidence, M.evidence, Event).

geometry_event(Input, Event) :-
    member(G, Input.geometry), G.usable == true,
    G.confidence >= Input.minimumConfidence,
    geometry_predicate(G, Input, Predicate),
    term(Predicate, [G.entity], T),
    event(T, authored_geometry, G.confidence, G.evidence, Event).
geometry_predicate(G, Input, scaled) :- G.affineIou >= Input.rotationIou, G.uniformScale == true.
geometry_predicate(G, Input, deformed) :-
    G.affineIou >= Input.rotationIou, G.nonuniformScale == true, G.maskIou < 1.
geometry_predicate(G, Input, color_changed) :- G.colorChanged == true, G.maskIou >= Input.rotationIou.
geometry_predicate(G, Input, area_changed) :-
    G.areaDelta =\= 0,
    \+ (G.affineIou >= Input.rotationIou, (G.uniformScale == true; G.nonuniformScale == true)).
geometry_predicate(G, _, hole_opened) :- G.outerShapeUnchanged == true, G.holeDelta > 0, G.colorChanged == false.
geometry_predicate(G, _, hole_closed) :- G.outerShapeUnchanged == true, G.holeDelta < 0, G.colorChanged == false.

derivative_event(Input, Event) :-
    member(D, Input.derivatives), D.confidence >= Input.minimumConfidence,
    derivative_predicate(D, Input, Predicate), term(Predicate, [D.entity], T),
    event(T, authored_derivatives, D.confidence, D.evidence, Event).
derivative_predicate(D, Input, turned) :- number(D.headingDelta), abs(D.headingDelta) > Input.headingTolerance.
derivative_predicate(D, Input, accelerated) :- number(D.speedDelta), D.speedDelta > Input.speedTolerance.
derivative_predicate(D, Input, decelerated) :- number(D.speedDelta), D.speedDelta < -Input.speedTolerance.

response_event(Input, Event) :-
    member(R, Input.responses), R.confidence >= Input.minimumConfidence,
    R.incoming > Input.motionTolerance, R.outgoing < -Input.motionTolerance,
    response_term(R, T),
    event(T, authored_response, R.confidence, R.evidence, Event).
response_term(R, T) :- R.leftReversed == true, R.rightReversed == true, term(collision, R.subjects, T).
response_term(R, T) :- R.leftReversed == true, R.rightStationary == true, R.subjects = [A,_], term(bounce, [A], T).
response_term(R, T) :- R.rightReversed == true, R.leftStationary == true, R.subjects = [_,B], term(bounce, [B], T).

visibility_event(Input, Event) :-
    member(V, Input.visibility), V.ambiguous == false,
    visibility_predicate(V, Input.exitFraction, Predicate),
    term(Predicate, [V.entity], T),
    event(T, authored_visibility, V.confidence, V.evidence, Event).

visibility_predicate(V, _, reappeared) :- V.status == reappeared.
visibility_predicate(V, Threshold, exited) :-
    V.status == exited, V.projectionSupported == true, V.exitFraction >= Threshold,
    V.previousStatus \== exited.
visibility_predicate(V, _, missing) :-
    memberchk(V.status, [missing,possible_occlusion,full_occlusion,partial_occlusion]),
    V.wasVisible == true, V.currentlyVisible == false, V.occlusionConfirmed == false.

relation_event(Input, Event) :-
    member(R, Input.relations),
    ( R.detector == authored_input_response -> Continue = Input.receiptContinuations
    ; Continue = Input.continuations ),
    relation_phase(R, Continue, Phase),
    phase(Phase, R.term, T),
    event(T, R.detector, R.confidence, R.evidence, Event).

relation_phase(R, _, start) :- R.before == false, R.after == true, R.active == false.
relation_phase(R, true, continue) :- R.after == true, R.active == true.
relation_phase(R, _, end) :- R.before == true, R.after == false, R.active == true.

occlusion_event(Input, Event) :-
    member(O, Input.occlusions),
    O.confirmed == true, O.motionSupported == true,
    O.overlapFraction >= Input.occlusionFraction, O.depthPositive == true,
    O.depthContradicted == false, O.occluderVisible == true,
    term(occlude, [O.occluder,O.occluded], Relation),
    ( O.active == true -> Phase = continue
    ; O.wasVisible == true -> Phase = start
    ),
    ( Phase == continue -> Input.continuations == true ; true ),
    phase(Phase, Relation, T),
    event(T, authored_occlusion, O.confidence, O.evidence, Event).
occlusion_event(Input, Event) :-
    member(O, Input.closedOcclusions), O.active == true,
    O.reappeared == true, O.depthContradicted == false,
    term(occlude, [O.occluder,O.occluded], Relation), phase(end, Relation, T),
    event(T, authored_occlusion, O.confidence, O.evidence, Event).

authored(Input, Output) :-
    findall(Event,
            (motion_event(Input, Event); visibility_event(Input, Event);
             relation_event(Input, Event); occlusion_event(Input, Event)),
            RawBase),
    findall(Event, (geometry_event(Input, Event); derivative_event(Input, Event); response_event(Input, Event)),
            RawMeasured),
    append(RawBase, RawMeasured, Raw),
    sort(Raw, Events),
    Output = _{events:Events}.

% Model predicates are inert node/2 data. They are never constructed as callable
% goals, asserted as clauses, or dispatched through call/1.
ast(Obj, Env0, Env, node(P, Args)) :-
    P = Obj.predicate, ast_args(Obj.args, Env0, Env, Args).
ast_args([], Env, Env, []).
ast_args([Arg|Rest], Env0, Env, [Value|Values]) :-
    ast_arg(Arg, Env0, Env1, Value), ast_args(Rest, Env1, Env, Values).
ast_arg(Arg, Env0, Env, Value) :-
    is_dict(Arg), !,
    ( get_dict(var, Arg, Name) ->
        ( memberchk(Name=Existing, Env0) -> Value=Existing, Env=Env0
        ; Env=[Name=Value|Env0]
        )
    ; ast(Arg, Env0, Env, Value)
    ).
ast_arg(Value, Env, Env, Value).
asts([], Env, Env, []).
asts([Obj|Rest], Env0, Env, [Node|Nodes]) :-
    ast(Obj, Env0, Env1, Node), asts(Rest, Env1, Env, Nodes).

comparison(node(P, _)) :- memberchk(P, [greater_than,greater_equal,less_than,less_equal,equal]).
numeric_constraint(node(greater_than,[A,B])) :- number(A), number(B), A > B.
numeric_constraint(node(greater_equal,[A,B])) :- number(A), number(B), A >= B.
numeric_constraint(node(less_than,[A,B])) :- number(A), number(B), A < B.
numeric_constraint(node(less_equal,[A,B])) :- number(A), number(B), A =< B.
numeric_constraint(node(equal,[A,B])) :- number(A), number(B), A =:= B.

prove([], _).
prove([Node|Rest], Facts) :-
    ( comparison(Node) -> numeric_constraint(Node) ; member(Node, Facts) ),
    prove(Rest, Facts).
excluded([], _, _, _).
excluded([Node|Rest], Facts, Absent, Complete) :-
    ground(Node),
    ( comparison(Node) -> \+ numeric_constraint(Node)
    ; Node=node(P,_), (memberchk(Node, Absent);memberchk(P, Complete)),
      \+ memberchk(Node, Facts)
    ),
    excluded(Rest, Facts, Absent, Complete).

node_json(node(P, Args), Obj) :-
    maplist(arg_json, Args, JsonArgs), term(P, JsonArgs, Obj).
arg_json(node(P, Args), Obj) :- !, node_json(node(P, Args), Obj).
arg_json(Arg, Arg) :- atomic(Arg).

rule_solution(Rule, Facts, Absent, Complete, Json) :-
    asts(Rule.body, [], Env1, Body),
    ast(Rule.head, Env1, Env2, Head),
    asts(Rule.exceptions, Env2, _, Exceptions),
    partition(comparison, Body, Constraints, Positive),
    append(Positive, Constraints, Ordered),
    prove(Ordered, Facts), excluded(Exceptions, Facts, Absent, Complete),
    ground(Head), node_json(Head, Json).

evaluate_rule(Facts, Absent, Complete, Candidate, Output) :-
    findall(Term, rule_solution(Candidate.rule, Facts, Absent, Complete, Term), Raw),
    sort(Raw, Terms), Output=_{candidate_id:Candidate.candidate_id,terms:Terms}.

learned(Input, Output) :-
    asts(Input.facts, [], _, Facts), asts(Input.absentFacts, [], _, Absent),
    maplist(evaluate_rule(Facts, Absent, Input.completePredicates), Input.rules, Predictions),
    Output=_{predictions:Predictions}.

main :-
    json_read_dict(current_input, Input, [value_string_as(atom)]),
    ( Input.mode == authored -> authored(Input, Output)
    ; Input.mode == rules -> learned(Input, Output)
    ; throw(error(domain_error(event_detector_mode, Input.mode), _))
    ),
    json_write_dict(current_output, Output, [width(0)]), nl.
