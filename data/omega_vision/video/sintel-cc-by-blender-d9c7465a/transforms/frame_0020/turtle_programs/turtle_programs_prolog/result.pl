% turtle programs by turtle_programs.pl (prolog doer)
:- dynamic turtle_program/3.
:- discontiguous turtle_program/3.
turtle_program(r1, outer, [start(0, 0, 90), forward(363), turn(-90), forward(853), turn(-90), forward(363), turn(-90), forward(853), close]).
turtle_program(r1, hole(1), [start(714, 120, 0), forward(3), turn(-180), forward(3), close]).
turtle_program(r1, hole(2), [start(781, 102, -26.6), forward(2.2), turn(90), forward(2.2), turn(90), forward(2.2), turn(90), forward(2.2), close]).
turtle_program(r1, midline(1), [start(182, 181, -0.2), forward(352), turn(46.1), forward(86.3), turn(-45.9), forward(137), turn(-44.5), forward(74.2), turn(-42.4), forward(18), turn(-48.2), forward(50.9), turn(45), forward(49), turn(-45), forward(39.6), turn(-45.9), forward(67), turn(-44.4), forward(169), turn(-179.8), forward(168.3)]).
turtle_program(r1, midline(2), [start(816, 141, 135), forward(1.4)]).
turtle_program(r1, midline(3), [start(784, 50, 180), forward(53), turn(-45), forward(12.7), turn(180), forward(9.9)]).
turtle_program(r1, midline(4), [start(785, 50, 0), forward(17), turn(45), forward(22.6), turn(45), forward(72), turn(45), forward(2.8), turn(-161.6), forward(2.2)]).
