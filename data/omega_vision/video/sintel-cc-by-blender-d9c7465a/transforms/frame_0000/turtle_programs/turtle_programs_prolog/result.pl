% turtle programs by turtle_programs.pl (prolog doer)
:- dynamic turtle_program/3.
:- discontiguous turtle_program/3.
turtle_program(r1, outer, [start(0, 0, 90), forward(363), turn(-90), forward(853), turn(-90), forward(363), turn(-90), forward(853), close]).
turtle_program(r1, midline(1), [start(182, 181, 0), forward(489)]).
