:- prolog_load_context(directory, Dir),
   file_directory_name(Dir, Tests), file_directory_name(Tests, Root),
   directory_file_path(Root, prolog, Prolog),
   directory_file_path(Prolog, omega_vision, Omega),
   directory_file_path(Omega, 'event_detectors.pl', Module),
   use_module(Module).
:- use_module(library(plunit)).

:- begin_tests(event_detectors_core).

base(_{mode:authored,motion:[],visibility:[],relations:[],occlusions:[],closedOcclusions:[],
       motionTolerance:0.5,minimumConfidence:0.7,rotationIou:0.99,shapeChangeIou:0.95,
       occlusionFraction:0.2,exitFraction:0.85,continuations:true}).

test(empty_is_not_a_positive_event) :-
    base(Input), omega_event_detectors:authored(Input, Output), assertion(Output.events == []).

test(stationary_is_not_an_event) :-
    base(Base), Motion=_{entity:track,displacement:[0,0],maskIou:1,transforms:[identity],
                       confidence:0.99,reappeared:false,evidence:[measured]},
    Input=Base.put(motion,[Motion]),
    omega_event_detectors:authored(Input, Output), assertion(Output.events == []).

test(relation_start_uses_generic_wrapper) :-
    base(Base), Relation=_{term:_{predicate:contact,args:[a,b]},before:false,after:true,
                          active:false,detector:authored_topology,confidence:1,evidence:[pixels]},
    omega_event_detectors:authored(Base.put(relations,[Relation]), Output),
    [Event]=Output.events, assertion(Event.term.predicate == start),
    assertion(Event.term.args =@= [Relation.term]).

test(unknown_relation_does_not_end_an_episode) :-
    base(Base), Relation=_{term:_{predicate:contact,args:[a,b]},before:true,after:null,
                          active:true,detector:authored_topology,confidence:1,evidence:[pixels]},
    omega_event_detectors:authored(Base.put(relations,[Relation]), Output),
    assertion(Output.events == []).

test(negative_depth_blocks_occlusion) :-
    base(Base), Occlusion=_{occluder:a,occluded:b,confirmed:true,motionSupported:true,
        overlapFraction:1,depthPositive:true,depthContradicted:true,occluderVisible:true,
        active:false,wasVisible:true,confidence:0.95,evidence:[projection]},
    omega_event_detectors:authored(Base.put(occlusions,[Occlusion]), Output),
    assertion(Output.events == []).

test(typed_ast_numeric_replay) :-
    Rule=_{body:[_{predicate:displacement_magnitude,args:[_{var:'X'},_{var:'N'}]},
                 _{predicate:greater_equal,args:[_{var:'N'},2]}],
           head:_{predicate:moved,args:[_{var:'X'}]},exceptions:[]},
    Input=_{facts:[_{predicate:displacement_magnitude,args:[actor,3]}],
            absentFacts:[],completePredicates:[],rules:[_{candidate_id:one,rule:Rule}]},
    omega_event_detectors:learned(Input, Output),
    [Prediction]=Output.predictions, [Term]=Prediction.terms,
    assertion(Term.predicate == moved), assertion(Term.args == [actor]).

test(unknown_exception_is_not_proven_absent) :-
    Rule=_{body:[_{predicate:present,args:[_{var:'X'}]}],
           head:_{predicate:moved,args:[_{var:'X'}]},
           exceptions:[_{predicate:stationary,args:[_{var:'X'}]}]},
    Input=_{facts:[_{predicate:present,args:[actor]}],
            absentFacts:[],completePredicates:[],rules:[_{candidate_id:one,rule:Rule}]},
    omega_event_detectors:learned(Input, Output),
    [Prediction]=Output.predictions, assertion(Prediction.terms == []).

:- end_tests(event_detectors_core).
