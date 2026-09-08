% turtle programs by turtle_programs.pl (prolog doer)
:- dynamic turtle_program/3.
:- discontiguous turtle_program/3.
turtle_program(r1, outer, [start(436, 942, -9.5), forward(24.3), turn(-15.7), forward(18.8), turn(14.5), forward(53.9), turn(-7), forward(46.2), turn(-13.3), forward(35), turn(-11), forward(13.5), turn(-21.4), forward(13.4), turn(-26.6), forward(10), turn(-26.6), forward(8.9), turn(-18.4), forward(9.9), turn(-24.1), forward(22.5), turn(-23.6), forward(42), turn(-13.8), forward(28.2), turn(-10.1), forward(17.9), turn(-18.4), forward(5.7), turn(56.3), forward(5.1), turn(123.7), forward(56.6), turn(-6.3), forward(38.4), turn(-10), forward(25.1), turn(-19.1), forward(24.3), turn(-31.3), forward(16.2), turn(-15.8), forward(16.4), turn(-6.6), forward(97.6), turn(44.2), forward(9), turn(9.5), forward(6.1), turn(80.5), forward(7), turn(-26.6), forward(11.2), turn(-54.7), forward(13.2), turn(16), forward(14.3), turn(-24.8), forward(24), turn(12), forward(48.1), turn(-7.6), forward(26.1), turn(91.9), forward(18.1), turn(22.5), forward(45.7), turn(-73.8), forward(2.8), turn(-39.3), forward(20.1), turn(-27.5), forward(16.2), turn(-12.4), forward(56.9), turn(148.8), forward(62.6), turn(-9.1), forward(30.1), turn(-20.4), forward(23.1), turn(-19), forward(9.8), turn(-35.1), forward(11.7), turn(-31), forward(15), turn(-17.1), forward(13.6), turn(-16.6), forward(25.2), turn(-12.6), forward(30.4), turn(-12.1), forward(45.8), turn(33.9), forward(12.1), turn(-30.6), forward(12.2), turn(21.3), forward(10.8), turn(66.2), forward(26.1), turn(23.2), forward(26.6), turn(-22), forward(14.4), turn(-175), forward(12.8), turn(13.6), forward(27.8), turn(-21.3), forward(11.7), turn(27), forward(9.4), turn(-174.6), forward(4.5), turn(157.2), forward(9.2), turn(-40.6), forward(6), turn(21.8), forward(5.4), turn(23.2), forward(8.5), turn(26.6), forward(6.3), turn(176.6), forward(5.4), turn(93.4), forward(3.2), turn(18.4), forward(24), turn(29.7), forward(8.1), turn(106.7), forward(27.6), turn(-136.5), forward(4), turn(143.1), forward(5), turn(4.1), forward(16.6), turn(-34.1), forward(15.2), turn(29.9), forward(15), turn(-86.8), forward(3.6), turn(58.5), forward(14.3), turn(-24.8), forward(13), turn(82.9), forward(8.1), turn(-24.9), forward(9.4), turn(-28.2), forward(16.1), turn(-13), forward(20.9), turn(59.3), forward(4.1), turn(25.3), forward(10.2), turn(-171.3), forward(11.7), turn(28.8), forward(10.6), turn(35.5), forward(20.1), turn(35.5), forward(8.1), turn(-74.7), forward(9.9), turn(-45), forward(8), turn(-38.7), forward(6.4), turn(52.7), forward(4.1), turn(83.1), forward(16.1), turn(-21.2), forward(41.2), turn(-10.4), forward(48.3), turn(10.4), forward(16.5), turn(-4.4), forward(19), turn(-14.2), forward(29.7), turn(-14.4), forward(41), turn(-12.1), forward(35), turn(16.5), forward(16.3), turn(-26.5), forward(27.9), turn(-142), forward(5.8), turn(35.9), forward(23.1), turn(16.8), forward(16.2), turn(27), forward(10.6), turn(19.4), forward(10.8), turn(-79.5), forward(10.2), turn(-18), forward(18.4), turn(-42.2), forward(6.3), turn(-18.4), forward(7), turn(41.6), forward(12), turn(-36.4), forward(11), turn(50.7), forward(74.9), turn(7.5), forward(8.9), turn(17.1), forward(24.3), turn(9.5), forward(45), turn(70.6), forward(36.1), turn(59.7), forward(34.1), turn(-12.8), forward(30.4), turn(-27.4), forward(16), turn(-40.6), forward(9.2), turn(-27.6), forward(10.8), turn(68.2), forward(5), turn(69.4), forward(8.5), turn(-42.9), forward(2.2), turn(36.9), forward(8.9), turn(-21.9), forward(34.7), turn(-14.9), forward(4.5), turn(-35.3), forward(13.2), turn(47.4), forward(51.2), turn(-14.7), forward(39.4), turn(-24), forward(26), turn(-29.2), forward(28.7), turn(-10), forward(28.4), turn(39.3), forward(10), turn(39.1), forward(76.1), turn(-20.7), forward(6.3), turn(22.2), forward(9.2), turn(40.7), forward(13.2), turn(-17.8), forward(8.9), turn(-18.4), forward(9.9), turn(-15.3), forward(8.1), turn(35.5), forward(14.3), turn(-20.2), forward(18.4), turn(-15.3), forward(8.1), turn(-40), forward(11.2), turn(44), forward(7.2), turn(-33.7), forward(7), turn(-49.4), forward(9.2), turn(-18.8), forward(16.2), turn(-15.5), forward(18.1), turn(-9.8), forward(33.1), turn(-11.8), forward(22.8), turn(10.1), forward(22.1), turn(-6.5), forward(29.6), turn(-6.3), forward(38.9), turn(165.5), forward(13), turn(-172), forward(12.1), turn(87.9), forward(2.2), turn(-90), forward(4.5), turn(63.4), forward(5), turn(129.1), forward(8.2), turn(-37.3), forward(6.4), turn(-83.7), forward(2.8), turn(78.7), forward(7.2), turn(-33.7), forward(6), turn(71.6), forward(6.3), turn(-31.8), forward(15.6), turn(-27.3), forward(9.2), turn(23.5), forward(13.6), turn(-36), forward(6), turn(-45), forward(11.3), turn(-26.6), forward(12.6), turn(-7.1), forward(10.2), turn(-11.3), forward(38), close]).
turtle_program(r3438, outer, [start(431, 942, 180), forward(31), turn(9.5), forward(12.2), turn(18.6), forward(17), turn(22.1), forward(7.8), turn(39.8), forward(4), turn(38.7), forward(12.8), turn(-15.5), forward(15.2), turn(31.3), forward(17.2), turn(-43.2), forward(10.2), turn(33.7), forward(17), turn(45), forward(4), turn(-146.3), forward(3.6), turn(-78.7), forward(2.8), turn(63.4), forward(6.3), turn(42.5), forward(10.3), turn(29.1), forward(5), turn(26.6), forward(2.2), turn(126.9), forward(2.2), turn(-119.7), forward(7.2), turn(-17.7), forward(7.3), turn(14.1), forward(43.9), turn(10.5), forward(18.4), turn(-22.2), forward(19), turn(-34.4), forward(7.3), turn(-47.5), forward(8.9), turn(-73.7), forward(19.1), turn(11.1), forward(27.2), turn(-6.1), forward(41.8), turn(40.1), forward(58), turn(17.9), forward(7.3), turn(60), forward(4.1), turn(-53.3), forward(13), turn(114.9), forward(16.3), turn(-20.9), forward(6.7), turn(90), forward(8.9), turn(-60.3), forward(3.6), turn(-122.3), forward(9.8), turn(21), forward(1.4), turn(108.4), forward(2.2), turn(-126.9), forward(4.5), turn(-71.6), forward(2.8), turn(96.3), forward(6.4), turn(77.7), forward(54), turn(37), forward(4.1), turn(-91.9), forward(7.3), turn(15.9), forward(5), turn(63.4), forward(2.2), turn(-108.4), forward(22.6), turn(15.8), forward(28.7), turn(14.3), forward(15.5), turn(20.1), forward(22.1), turn(21.4), forward(17.9), turn(4.1), forward(31.4), turn(10.2), forward(48.9), turn(-168.7), forward(11.4), turn(121.5), forward(9.1), turn(28.1), forward(5.4), turn(21.1), forward(38.2), turn(20.6), forward(13.4), turn(-63.4), forward(3), turn(35), forward(24.4), turn(-35), forward(1), turn(-146.3), forward(21.6), turn(74.7), forward(12.6), turn(40.6), forward(11.7), turn(31), forward(12), turn(26.6), forward(17.9), turn(9.8), forward(47.2), turn(-55.8), forward(36.1), turn(109.4), forward(4), turn(72.5), forward(19.9), turn(-10.5), forward(17), turn(-20.3), forward(12), turn(-71.4), forward(8.1), turn(-64.3), forward(28.1), turn(-13), forward(40.8), turn(-15.6), forward(33.3), turn(-14.7), forward(34), turn(127.9), forward(12.2), turn(48.1), forward(6.4), turn(8), forward(49.5), turn(13.6), forward(48.4), turn(8.4), forward(49.4), turn(-175.5), forward(34.5), turn(-9.7), forward(26.8), turn(-5.8), forward(48.5), turn(-12.6), forward(36.8), turn(81.9), forward(5), turn(69.1), forward(7.3), turn(-150.9), forward(17), turn(45), forward(5), turn(50.2), forward(7.8), turn(80.4), forward(9.2), turn(-17.4), forward(30.5), turn(-13.7), forward(12.2), turn(-119.7), forward(20.2), turn(65.2), forward(4.2), turn(63.4), forward(19), turn(71.6), forward(2), turn(-51.3), forward(6.4), turn(-83.7), forward(2.8), turn(90), forward(11.3), turn(23.2), forward(5.4), turn(34.3), forward(9.2), turn(-42.7), forward(71.7), turn(-2.1), forward(44.9), turn(108.2), forward(4.1), turn(-76), forward(15), turn(-90), forward(3), turn(-33.7), forward(3.6), turn(-45), forward(10.2), turn(127.5), forward(63.8), turn(21.7), forward(18), turn(19.4), forward(14), turn(15.9), forward(7.3), turn(103.8), forward(40.3), turn(-15.1), forward(23.8), turn(-96.3), forward(41.4), turn(4.9), forward(34.9), turn(-23.5), forward(11.2), turn(10.3), forward(13), turn(31.6), forward(15.3), turn(-53.4), forward(5.4), turn(48.4), forward(8.9), turn(32.5), forward(5.8), turn(31), forward(9), turn(-63.4), forward(4.5), turn(-26.6), forward(14), turn(-33.7), forward(7.2), turn(155.7), forward(9.4), turn(-166.6), forward(99.7), turn(-27), forward(6.3), turn(43), forward(25.1), turn(28.6), forward(12), turn(17.1), forward(13.6), turn(11.5), forward(25.1), turn(10), forward(25.6), turn(7.7), forward(60.8), turn(-15.4), forward(11.7), turn(-112.8), forward(7.1), turn(-41.8), forward(21.6), turn(17), forward(20.9), turn(2.1), forward(23.8), turn(14.6), forward(23), turn(14.9), forward(15.5), turn(11.6), forward(13.4), turn(21.8), forward(12), turn(41.6), forward(14), turn(32.3), forward(22.5), turn(28.4), forward(36.7), turn(10.1), forward(42.4), turn(7.4), forward(58.2), turn(-7.8), forward(29.7), turn(13.3), forward(18.1), close]).
turtle_program(r3738, outer, [start(224, 496, -90), forward(5), turn(-45), forward(11.3), turn(76.6), forward(15.3), turn(-117.9), forward(31.1), turn(-30.3), forward(8.9), turn(26.6), forward(13), turn(109.2), forward(24.4), turn(34), forward(15), turn(-22.2), forward(35), turn(11.9), forward(38.2), turn(9.2), forward(22.8), turn(11.3), forward(17.9), turn(11.6), forward(31), turn(-9.8), forward(43), turn(9.4), forward(30.1), turn(1.4), forward(8.2), turn(57.7), forward(30.4), turn(9), forward(26.4), turn(15.5), forward(37.7), turn(5.9), forward(21.8), turn(15.9), forward(17), turn(35.5), forward(8.6), turn(81), forward(4.5), turn(18.4), forward(12.7), turn(23.8), forward(33.2), turn(-68.8), forward(50), turn(-5.2), forward(22.1), turn(-23.4), forward(25.1), turn(-4.5), forward(51.3), turn(-15.7), forward(10.6), turn(-41.2), forward(10), turn(41.6), forward(12), turn(-32.2), forward(12.2), turn(45.5), forward(12.2), turn(21), forward(16.5), close]).
turtle_program(r7611, outer, [start(282, 888, -177.4), forward(44), turn(18), forward(17.1), turn(30.8), forward(6.4), turn(38.7), forward(6), turn(38.7), forward(6.4), turn(-47.4), forward(13.2), turn(38.5), forward(8.1), turn(17.5), forward(17.7), turn(24.3), forward(12.6), turn(-45), forward(11.2), turn(24.8), forward(6.4), turn(21.1), forward(19.9), turn(152.5), forward(14.1), turn(-90), forward(8.5), turn(-168.7), forward(7.2), turn(75.3), forward(24.1), turn(93.4), forward(14.1), turn(-24.4), forward(17.1), turn(83.5), forward(4.1), turn(-157.2), forward(5), turn(53.1), forward(52), turn(-26.6), forward(13.4), turn(-14.4), forward(30.5), turn(41), forward(15), turn(15.9), forward(14.6), turn(105.7), forward(61.1), turn(-17.6), forward(8.2), turn(-52.7), forward(6.4), turn(91.8), forward(5), turn(16.9), forward(35.1), turn(8.7), forward(30.6), turn(6.5), forward(24.1), turn(-7.8), forward(27.7), close]).
turtle_program(r3808, outer, [start(657, 470, 180), forward(21), turn(9.5), forward(12.2), turn(12.3), forward(21.5), turn(16.9), forward(6.4), turn(-83.7), forward(2.8), turn(81), forward(13.6), turn(-14.8), forward(38.6), turn(36.1), forward(29.7), turn(8.1), forward(62.6), turn(-9.2), forward(18), turn(-14.3), forward(13.5), turn(138), forward(8), turn(26.6), forward(13.4), turn(18.4), forward(14.1), turn(-18.4), forward(8.9), turn(22.2), forward(53.2), turn(-116.2), forward(13), turn(-22.6), forward(28), turn(143.1), forward(5), turn(-154.4), forward(5.1), turn(47.3), forward(13.6), turn(110.3), forward(7.2), turn(-29.7), forward(8.9), turn(31.4), forward(18.9), turn(-26.2), forward(49.4), turn(15.7), forward(32.6), turn(17.5), forward(33.1), turn(32.1), forward(16.1), turn(42.3), forward(9.2), turn(18.8), forward(10.8), close]).
turtle_program(r12, outer, [start(412, 74, -146.3), forward(14.4), turn(88.3), forward(9.4), turn(-155.7), forward(10.8), turn(33.7), forward(2), turn(126), forward(13.6), turn(-149.2), forward(7.6), turn(113.2), forward(4), turn(-101.3), forward(5.1), turn(101.3), forward(12), turn(21.8), forward(16.2), turn(23.2), forward(11.3), turn(13.4), forward(15.3), turn(31.6), forward(13), turn(49.4), forward(18.4), turn(43.5), forward(40), turn(67.5), forward(29.7), close]).
turtle_program(r1808, outer, [start(263, 304, 180), forward(7), turn(61.4), forward(12.5), turn(36.7), forward(14.1), turn(15.8), forward(19.7), turn(66), forward(4), turn(-56.3), forward(21.6), turn(11.3), forward(18.4), turn(6.3), forward(12.8), turn(128.7), forward(4), turn(-130.6), forward(18.4), turn(-22.8), forward(4.5), turn(35.9), forward(25.9), turn(173.9), forward(25.2), turn(-33.1), forward(7.6), turn(20.4), forward(29), turn(-13.9), forward(24.2), turn(-11.3), forward(31.6), turn(16.3), forward(15.8), close]).
turtle_program(r3806, outer, [start(576, 476, -129.3), forward(78.9), turn(9.3), forward(95.9), turn(30), forward(2), turn(90), forward(8), turn(47), forward(20.5), turn(11.7), forward(26.9), turn(7.4), forward(49.2), turn(-8.3), forward(44.9), turn(-9.4), forward(24.1), turn(25.7), forward(7.3), close]).
turtle_program(r255, outer, [start(451, 104, 180), forward(16), turn(24), forward(9.8), turn(52), forward(4.1), turn(75.7), forward(14.8), turn(-161.2), forward(6.1), turn(-21.5), forward(11.7), turn(121), forward(6), turn(67.4), forward(13), turn(-161.5), forward(14), turn(67.5), forward(8.9), turn(91.4), forward(18.8), turn(8.1), forward(13.6), turn(17.1), forward(6), turn(42.5), forward(16.3), turn(37.2), forward(11.2), turn(40), forward(8.1), turn(21), forward(14.2), close]).
turtle_program(r2067, outer, [start(396, 238, -172.9), forward(16.1), turn(49.2), forward(7.2), turn(46.2), forward(9.2), turn(50.9), forward(6.7), turn(107.1), forward(6.1), turn(-138.5), forward(9.4), turn(-108), forward(4.1), turn(139.4), forward(2.2), turn(3.4), forward(15.2), turn(29.2), forward(19.1), turn(57.4), forward(6.7), turn(42.5), forward(7.3), turn(32.9), forward(10.6), turn(17.2), forward(19.7), close]).
turtle_program(r306, outer, [start(372, 114, -153.4), forward(8.9), turn(-26.6), forward(10), turn(102.5), forward(9.2), turn(21.2), forward(14.4), turn(-105.3), forward(3.2), turn(-71.6), forward(10), turn(137.4), forward(10), turn(29.7), forward(9.8), turn(33.6), forward(13), turn(32.5), forward(17), turn(56.3), forward(3.6), turn(63.4), forward(24.2), turn(-18.4), forward(20.4), close]).
turtle_program(r7382, outer, [start(432, 792, -172.4), forward(30.3), turn(133.7), forward(25.6), turn(-6.3), forward(22.6), turn(90), forward(8.5), turn(23.2), forward(5.4), turn(51.1), forward(28.7), close]).
turtle_program(r647, outer, [start(414, 128, -153.4), forward(2.2), turn(28.2), forward(20.8), turn(-28.2), forward(8.9), turn(117.1), forward(23.6), turn(81.4), forward(7.1), turn(23.2), forward(10.8), turn(21.8), forward(14), turn(40.6), forward(9.2), close]).
turtle_program(r8569, outer, [start(445, 886, -176.2), forward(15), turn(-180), forward(15), close]).
turtle_program(r1259, outer, [start(352, 164, -90), forward(16), turn(-180), forward(16), close]).
turtle_program(r2970, outer, [start(617, 260, -90), forward(10), turn(-180), forward(10), close]).
turtle_program(r5383, outer, [start(241, 460, -146.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r2850, outer, [start(412, 246, 180), forward(4), turn(180), forward(4), close]).
turtle_program(r2801, outer, [start(595, 244, -168.7), forward(5.1), turn(-180), forward(5.1), close]).
turtle_program(r8579, outer, [start(344, 888, -116.6), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r6308, outer, [start(98, 522, -166), forward(4.1), turn(-180), forward(4.1), close]).
turtle_program(r8568, outer, [start(382, 886, 180), forward(2), turn(146.3), forward(3.6), turn(150.3), forward(2.2), close]).
turtle_program(r1, hole(1), [start(412, 132, -45), forward(14.1), turn(-45), forward(12), turn(-15.9), forward(7.3), turn(37.7), forward(5.4), turn(101.9), forward(14.4), turn(-33.7), forward(15), turn(-20), forward(11.7), turn(-31.4), forward(12.8), turn(-38.7), forward(9), turn(-33.7), forward(7.2), turn(-11.3), forward(14.1), turn(130.2), forward(12), turn(-40.2), forward(5.7), turn(-113.2), forward(5.4), turn(-21.8), forward(15), turn(-26.6), forward(4.5), turn(66.4), forward(7.8), turn(53.5), forward(35.1), turn(-25.1), forward(5.4), turn(-33.2), forward(12.2), turn(-35), forward(13), turn(-20), forward(11.7), turn(-28.4), forward(12), turn(-7.9), forward(10.8), turn(-28.9), forward(24.1), turn(40.2), forward(17), turn(35.5), forward(12.2), turn(-25.5), forward(12.2), turn(-31), forward(9.8), turn(-32.1), forward(14.1), turn(29.9), forward(26.9), turn(-40.2), forward(3.2), turn(-131.3), forward(13.9), turn(-120.3), forward(2), turn(123.7), forward(3.6), turn(19.4), forward(5), turn(36.9), forward(6), turn(30.3), forward(13.9), turn(-120.3), forward(11), turn(15.9), forward(14.6), turn(12.1), forward(17), turn(16.9), forward(15.6), turn(173.2), forward(17.8), turn(-11.6), forward(13.4), turn(-15.9), forward(16.3), turn(-150.8), forward(15.6), turn(50.2), forward(3), turn(132.3), forward(14.9), turn(-19.1), forward(15.2), turn(-113.2), forward(2), turn(-71.6), forward(6.3), turn(23.2), forward(12), turn(62.4), forward(8.2), turn(21), forward(12.2), turn(29.8), forward(18.8), close]).
turtle_program(r1, hole(2), [start(264, 305, -36.9), forward(5), turn(-24.5), forward(12.5), turn(-10.2), forward(31.6), turn(7), forward(23.3), turn(20.5), forward(40.3), turn(10.3), forward(32.4), turn(-70.3), forward(4.1), turn(-129.1), forward(5), turn(53.1), forward(4), turn(128.7), forward(6.4), turn(-38.7), forward(3), turn(-143.1), forward(10), turn(20), forward(62.1), turn(-13.2), forward(29), turn(-11.1), forward(26.1), turn(-15.4), forward(13.6), turn(-23.8), forward(17.1), turn(-43.5), forward(7.8), turn(-49.3), forward(6.1), close]).
turtle_program(r1, hole(3), [start(612, 234, -125.5), forward(17.2), turn(35.5), forward(3), turn(44.5), forward(74.2), turn(178.4), forward(19.1), turn(6.5), forward(27.7), turn(-6.2), forward(21.9), turn(155.3), forward(3.2), turn(-153.4), forward(2.8), turn(-21), forward(9.8), turn(-64.6), forward(18.4), close]).
turtle_program(r1, hole(4), [start(134, 618, -45), forward(82), turn(-180), forward(82), close]).
turtle_program(r1, hole(5), [start(354, 253, -142.1), forward(22.8), turn(18.4), forward(7.2), turn(33.7), forward(7), turn(41.2), forward(10.6), turn(30.4), forward(6.3), turn(16.3), forward(27), turn(-141), forward(5), turn(-45.6), forward(13.2), turn(90.6), forward(7.1), turn(-63.4), forward(3.2), turn(-90), forward(3.2), turn(-71.6), forward(5), turn(123.7), forward(18), turn(-29.4), forward(10.6), turn(-41.2), forward(8), turn(-38.2), forward(17.8), turn(-30.8), forward(13.9), close]).
turtle_program(r1, hole(6), [start(436, 255, -15.3), forward(11.4), turn(-29.7), forward(7.1), turn(-45), forward(17), turn(38.7), forward(12.8), turn(-16.9), forward(10.8), turn(-161.7), forward(24.8), turn(-171.3), forward(10.6), turn(131.2), forward(2), turn(45), forward(11.3), turn(18.4), forward(26.8), turn(-93.7), forward(13.9), turn(-71.1), forward(5.1), close]).
turtle_program(r1, hole(7), [start(376, 210, -32), forward(28.3), turn(-58), forward(15), turn(-26.6), forward(13.4), turn(-97.1), forward(7.2), turn(-56.3), forward(12), turn(141.3), forward(12.8), turn(-51.3), forward(3), turn(-45), forward(4.2), turn(-55.3), forward(11.2), turn(-23.4), forward(14.4), turn(83.1), forward(9.2), turn(79.3), forward(6.4), turn(-173.7), forward(5.7), turn(45), forward(4), close]).
turtle_program(r1, hole(8), [start(398, 283, -128.7), forward(12.8), turn(88.9), forward(7.8), turn(-156.1), forward(7.3), turn(82.3), forward(17.5), turn(-66.4), forward(4), turn(-100.3), forward(11.2), turn(55.3), forward(5.7), turn(-71.6), forward(13.4), turn(-36.9), forward(2.2), turn(-143.1), forward(13.4), turn(60.3), forward(7.2), turn(-33.7), forward(8), turn(160.6), forward(18), turn(-25.6), forward(14.1), close]).
turtle_program(r1, hole(9), [start(482, 233, -104), forward(8.2), turn(32.5), forward(6.3), turn(12.9), forward(26.9), turn(-31.3), forward(12), turn(-39.8), forward(7.8), turn(-16.5), forward(7.2), turn(-52.1), forward(3.2), turn(-135), forward(11.2), turn(53.1), forward(11.2), turn(32.7), forward(36.8), turn(-22.4), forward(7), turn(-63.4), forward(2.2), close]).
turtle_program(r1, hole(10), [start(494, 239, -20.6), forward(8.5), turn(-24.4), forward(14.1), turn(-16.4), forward(12.5), turn(-19.9), forward(13.2), turn(-167.9), forward(22.5), turn(21.4), forward(14.9), turn(21.2), forward(8.9), turn(26.6), forward(8), turn(36.9), forward(5), turn(-165.5), forward(6.4), turn(-58.5), forward(8.1), close]).
turtle_program(r1, hole(11), [start(400, 237, -21.3), forward(19.3), turn(-31.9), forward(10), turn(-18.4), forward(6.3), turn(-58.2), forward(7.8), turn(-23.6), forward(4.5), turn(-26.6), forward(19), turn(-21.8), forward(10.8), turn(-18), forward(15.6), turn(-50.2), forward(10), turn(-45), forward(5.7), turn(-42.1), forward(20), close]).
turtle_program(r1, hole(12), [start(382, 149, -114.8), forward(14.3), turn(-26.6), forward(12.8), turn(-38.7), forward(5), turn(-57.3), forward(16.6), turn(-46.8), forward(4.1), turn(-144.9), forward(13.9), turn(24), forward(4.2), turn(45), forward(5), turn(36.9), forward(10), turn(21.5), forward(15.3), close]).
turtle_program(r1, hole(13), [start(368, 199, -125.5), forward(17.2), turn(19.1), forward(17.7), turn(-174.9), forward(15.3), turn(-24.2), forward(17.2), turn(137.6), forward(14.3), turn(-147.1), forward(2.8), turn(-32.9), forward(14.3), close]).
turtle_program(r1, hole(14), [start(410, 148, -112.8), forward(20.6), turn(-27.4), forward(7.8), turn(-23.9), forward(7.3), turn(-73.5), forward(13), turn(-163.7), forward(10.6), turn(41.2), forward(4), turn(32), forward(9.4), turn(32.8), forward(18.8), close]).
turtle_program(r1, hole(15), [start(60, 503, -135), forward(17), turn(18.4), forward(8.9), turn(26.6), forward(8), turn(40.6), forward(9.2), turn(-67.2), forward(2.2), turn(-112.2), forward(10.6), turn(-41.2), forward(11), turn(-26.6), forward(8.9), turn(-27.9), forward(17.2), close]).
turtle_program(r1, hole(16), [start(542, 241, -43.4), forward(24.8), turn(-173.5), forward(10), turn(160.6), forward(7.2), turn(-167), forward(23.3), turn(61.7), forward(3.2), turn(-142.1), forward(3.6), turn(-70.3), forward(4.1), close]).
turtle_program(r1, hole(17), [start(430, 168, -135), forward(8.5), turn(34.7), forward(22.4), turn(-39.1), forward(9.2), turn(-141.9), forward(5.1), turn(-97.1), forward(3.2), turn(81.9), forward(6.7), turn(14.7), forward(19.4), turn(-38.3), forward(7.8), close]).
turtle_program(r1, hole(18), [start(150, 510, -30.7), forward(37.2), turn(-172.2), forward(28.2), turn(-18.3), forward(10.6), turn(-112.2), forward(2.2), close]).
turtle_program(r1, hole(19), [start(106, 601, -46.4), forward(29), turn(-180), forward(29), close]).
turtle_program(r1, hole(20), [start(520, 184, -121), forward(11.7), turn(-28.1), forward(11.7), turn(-31), forward(6), turn(-159.4), forward(17.1), turn(38.5), forward(11.7), close]).
turtle_program(r1, hole(21), [start(378, 216, -28.6), forward(25.1), turn(-106.4), forward(2.8), turn(-68.2), forward(15.2), turn(-21.8), forward(11.3), turn(-135), forward(2), close]).
turtle_program(r1, hole(22), [start(570, 262, -42), forward(26.9), turn(-159.8), forward(5.4), turn(-18.8), forward(18.4), turn(-35.4), forward(4.1), close]).
turtle_program(r1, hole(23), [start(170, 515, -46.5), forward(26.2), turn(-174.6), forward(21.3), turn(-27), forward(5.4), close]).
turtle_program(r1, hole(24), [start(414, 184, -53.1), forward(10), turn(23.4), forward(8.1), turn(29.7), forward(5), turn(-158.2), forward(5.4), turn(-55.5), forward(10.8), turn(-11.3), forward(8.5), turn(-90), forward(2.8), close]).
turtle_program(r1, hole(25), [start(134, 614, -48.4), forward(24.1), turn(-180), forward(24.1), close]).
turtle_program(r1, hole(26), [start(144, 500, -24), forward(19.7), turn(-165.5), forward(12.2), turn(-22.5), forward(9.4), turn(-121.4), forward(2.2), close]).
turtle_program(r1, hole(27), [start(456, 169, -45), forward(1.4), turn(-137.3), forward(25), turn(-177.7), forward(24), close]).
turtle_program(r1, hole(28), [start(390, 252, -23.6), forward(17.5), turn(-175.7), forward(21.2), turn(-160.7), forward(4), close]).
turtle_program(r1, hole(29), [start(30, 560, -150.3), forward(8.1), turn(24.7), forward(8.6), turn(-27.9), forward(2.2), turn(-151.6), forward(12.2), turn(-39.1), forward(7.3), close]).
turtle_program(r1, hole(30), [start(420, 204, -41.2), forward(10.6), turn(-175.7), forward(5), turn(100.3), forward(4.5), turn(-153.4), forward(4), turn(153.4), forward(4.5), turn(-153.4), forward(8), close]).
turtle_program(r1, hole(31), [start(606, 254, -132), forward(13.5), turn(-39.9), forward(7.1), turn(-180), forward(7.1), turn(39.9), forward(13.5), close]).
turtle_program(r1, hole(32), [start(118, 628, -32.7), forward(16.6), turn(-176.6), forward(18.4), turn(-150.6), forward(2), close]).
turtle_program(r1, hole(33), [start(668, 138, -116.6), forward(17.9), turn(-153.4), forward(5), turn(-36), forward(13.6), close]).
turtle_program(r1, hole(34), [start(586, 185, -55.3), forward(15.8), turn(-180), forward(15.8), close]).
turtle_program(r1, hole(35), [start(616, 268, -129.8), forward(15.6), turn(-180), forward(15.6), close]).
turtle_program(r1, hole(36), [start(228, 514, -130.6), forward(9.2), turn(48.7), forward(7.1), turn(-164.9), forward(7.6), turn(-72), forward(10.6), close]).
turtle_program(r1, hole(37), [start(596, 170, -45), forward(14.1), turn(-180), forward(14.1), close]).
turtle_program(r1, hole(38), [start(256, 555, -26.6), forward(13.4), turn(-176.6), forward(15.2), turn(-156.8), forward(2), close]).
turtle_program(r1, hole(39), [start(350, 880, -14), forward(12.4), turn(-156.5), forward(6.1), turn(-31.3), forward(10.8), turn(-158.2), forward(4), close]).
turtle_program(r1, hole(40), [start(346, 184, -26.6), forward(4.5), turn(-153.4), forward(4), turn(69.4), forward(8.5), turn(-176.1), forward(10.4), close]).
turtle_program(r1, hole(41), [start(604, 227, -138), forward(13.5), turn(-180), forward(13.5), close]).
turtle_program(r1, hole(42), [start(508, 242, -31), forward(11.7), turn(-104), forward(2.8), turn(-71.6), forward(4.5), turn(-29.7), forward(7.2), close]).
turtle_program(r1, hole(43), [start(364, 879, -26.6), forward(13.4), turn(-176.1), forward(13), turn(-67.4), forward(1), close]).
turtle_program(r1, hole(44), [start(466, 197, -131.6), forward(12), turn(-180), forward(12), close]).
turtle_program(r1, hole(45), [start(622, 274, -116.6), forward(13.4), turn(-180), forward(13.4), close]).
turtle_program(r1, hole(46), [start(568, 292, -145), forward(12.2), turn(-165.6), forward(9.2), turn(-49.4), forward(4), close]).
turtle_program(r1, hole(47), [start(96, 613, -52.1), forward(11.4), turn(-158.8), forward(5.8), turn(-40.6), forward(6.3), close]).
turtle_program(r1, hole(48), [start(524, 324, -153.4), forward(11.2), turn(-150.3), forward(3.6), turn(-42.3), forward(8.2), close]).
turtle_program(r1, hole(49), [start(352, 163, -90), forward(15), turn(-180), forward(15), close]).
turtle_program(r1, hole(50), [start(432, 195, -45), forward(2.8), turn(-55.3), forward(11.2), turn(-169.7), forward(13), close]).
turtle_program(r1, hole(51), [start(562, 228, -48.8), forward(10.6), turn(-180), forward(10.6), close]).
turtle_program(r1, hole(52), [start(564, 278, -53.1), forward(10), turn(-180), forward(10), close]).
turtle_program(r1, hole(53), [start(390, 291, -104), forward(8.2), turn(-94.4), forward(3.2), turn(-107.1), forward(8.6), close]).
turtle_program(r1, hole(54), [start(18, 536, -36.9), forward(10), turn(-164.9), forward(5.4), turn(-31.3), forward(5), close]).
turtle_program(r1, hole(55), [start(522, 199, -94.4), forward(13), turn(-180), forward(13), close]).
turtle_program(r1, hole(56), [start(558, 222, -58), forward(9.4), turn(-180), forward(9.4), close]).
turtle_program(r1, hole(57), [start(280, 522, -131.2), forward(10.6), turn(-180), forward(10.6), close]).
turtle_program(r1, hole(58), [start(642, 172, -45), forward(8.5), turn(-180), forward(8.5), close]).
turtle_program(r1, hole(59), [start(614, 198, -45), forward(8.5), turn(-180), forward(8.5), close]).
turtle_program(r1, hole(60), [start(566, 210, -58), forward(9.4), turn(-180), forward(9.4), close]).
turtle_program(r1, hole(61), [start(616, 247, -108.4), forward(9.5), turn(-180), forward(9.5), close]).
turtle_program(r1, hole(62), [start(164, 481, -59), forward(5.8), turn(-150.7), forward(8.1), turn(-136.2), forward(4.1), close]).
turtle_program(r1, hole(63), [start(270, 548, -50.2), forward(7.8), turn(-180), forward(7.8), close]).
turtle_program(r1, hole(64), [start(228, 556, -163.3), forward(10.4), turn(-180), forward(10.4), close]).
turtle_program(r1, hole(65), [start(432, 181, -135), forward(7.1), turn(-149), forward(4.1), turn(-139.4), forward(2.2), turn(108.4), forward(4.2), close]).
turtle_program(r1, hole(66), [start(534, 291, -54.5), forward(8.6), turn(-180), forward(8.6), close]).
turtle_program(r1, hole(67), [start(654, 486, -146.3), forward(3.6), turn(-25.6), forward(7.1), turn(-157.2), forward(5.8), turn(-31), forward(5), close]).
turtle_program(r1, hole(68), [start(276, 540, -69.4), forward(8.5), turn(-180), forward(8.5), close]).
turtle_program(r1, hole(69), [start(112, 630, -26.6), forward(2.2), turn(-159.1), forward(10), turn(-174.3), forward(8), close]).
turtle_program(r1, hole(70), [start(628, 184, -50.2), forward(7.8), turn(-180), forward(7.8), close]).
turtle_program(r1, hole(71), [start(576, 195, -60.3), forward(8.1), turn(-180), forward(8.1), close]).
turtle_program(r1, hole(72), [start(580, 196, -63.4), forward(6.7), turn(-180), forward(6.7), close]).
turtle_program(r1, hole(73), [start(570, 226, -50.2), forward(7.8), turn(-180), forward(7.8), close]).
turtle_program(r1, hole(74), [start(564, 233, -51.3), forward(6.4), turn(-180), forward(6.4), close]).
turtle_program(r1, hole(75), [start(412, 268, -63.4), forward(6.7), turn(-166.8), forward(7.8), turn(-129.8), forward(2), close]).
turtle_program(r1, hole(76), [start(598, 278, -56.3), forward(7.2), turn(-180), forward(7.2), close]).
turtle_program(r1, hole(77), [start(422, 284, -56.3), forward(7.2), turn(-180), forward(7.2), close]).
turtle_program(r1, hole(78), [start(194, 559, -33.7), forward(7.2), turn(-180), forward(7.2), close]).
turtle_program(r1, hole(79), [start(158, 588, -56.3), forward(7.2), turn(-180), forward(7.2), close]).
turtle_program(r1, hole(80), [start(102, 629, -146.3), forward(7.2), turn(-180), forward(7.2), close]).
turtle_program(r1, hole(81), [start(656, 149, -146.3), forward(7.2), turn(-180), forward(7.2), close]).
turtle_program(r1, hole(82), [start(618, 153, -26.6), forward(6.7), turn(-180), forward(6.7), close]).
turtle_program(r1, hole(83), [start(466, 208, -95.7), forward(10), turn(-180), forward(10), close]).
turtle_program(r1, hole(84), [start(508, 248, -71.6), forward(6.3), turn(-180), forward(6.3), close]).
turtle_program(r1, hole(85), [start(548, 250, -153.4), forward(6.7), turn(-180), forward(6.7), close]).
turtle_program(r1, hole(86), [start(618, 260, -95.7), forward(10), turn(-180), forward(10), close]).
turtle_program(r1, hole(87), [start(592, 284, -45), forward(5.7), turn(-180), forward(5.7), close]).
turtle_program(r1, hole(88), [start(210, 483, -153.4), forward(6.7), turn(-180), forward(6.7), close]).
turtle_program(r1, hole(89), [start(134, 563, -74.1), forward(7.3), turn(-180), forward(7.3), close]).
turtle_program(r1, hole(90), [start(382, 116, -53.1), forward(5), turn(-157.8), forward(5.8), turn(-122.5), forward(2.2), close]).
turtle_program(r1, hole(91), [start(602, 161, -59), forward(5.8), turn(-180), forward(5.8), close]).
turtle_program(r1, hole(92), [start(594, 168, -45), forward(5.7), turn(-180), forward(5.7), close]).
turtle_program(r1, hole(93), [start(360, 270, -123.7), forward(7.2), turn(-146.3), forward(3), turn(-53.1), forward(5), close]).
turtle_program(r1, hole(94), [start(396, 297, -146.3), forward(7.2), turn(-180), forward(7.2), close]).
turtle_program(r1, hole(95), [start(590, 308, -45), forward(5.7), turn(-180), forward(5.7), close]).
turtle_program(r1, hole(96), [start(534, 325, -90), forward(4), turn(-71.6), forward(3.2), turn(-139.4), forward(5.8), close]).
turtle_program(r1, hole(97), [start(268, 544, -45), forward(5.7), turn(-180), forward(5.7), close]).
turtle_program(r1, hole(98), [start(374, 887, -108.4), forward(3.2), turn(-116.6), forward(1.4), turn(-90), forward(2.8), close]).
turtle_program(r1, hole(99), [start(604, 282, -90), forward(2), turn(-56.3), forward(3.6), turn(-160.6), forward(5), close]).
turtle_program(r1, hole(100), [start(78, 475, -161.6), forward(6.3), turn(-180), forward(6.3), close]).
turtle_program(r1, hole(101), [start(132, 573, -68.2), forward(5.4), turn(-180), forward(5.4), close]).
turtle_program(r1, hole(102), [start(124, 578, -63.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r1, hole(103), [start(498, 219, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1, hole(104), [start(562, 221, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1, hole(105), [start(504, 248, -63.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r1, hole(106), [start(508, 313, -121), forward(5.8), turn(-180), forward(5.8), close]).
turtle_program(r1, hole(107), [start(550, 368, -143.1), forward(5), turn(-180), forward(5), close]).
turtle_program(r1, hole(108), [start(78, 510, -170.5), forward(6.1), turn(-180), forward(6.1), close]).
turtle_program(r1, hole(109), [start(224, 515, -143.1), forward(5), turn(-180), forward(5), close]).
turtle_program(r1, hole(110), [start(114, 590, -63.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r1, hole(111), [start(152, 594, -53.1), forward(5), turn(-180), forward(5), close]).
turtle_program(r1, hole(112), [start(102, 601, -45), forward(4.2), turn(-180), forward(4.2), close]).
turtle_program(r1, hole(113), [start(380, 881, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1, hole(114), [start(614, 152, -45), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r1, hole(115), [start(480, 174, 180), forward(6), turn(180), forward(6), close]).
turtle_program(r1, hole(116), [start(576, 217, -45), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r1, hole(117), [start(556, 244, -63.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r1, hole(118), [start(216, 551, -170.5), forward(6.1), turn(-180), forward(6.1), close]).
turtle_program(r1, hole(119), [start(350, 883, -45), forward(1.4), turn(-146.3), forward(5.1), turn(-168.7), forward(4), close]).
turtle_program(r1, hole(120), [start(364, 886, -116.6), forward(4.5), turn(-153.4), forward(4), turn(-90), forward(2), close]).
turtle_program(r1, hole(121), [start(392, 109, 180), forward(4), turn(180), forward(4), close]).
turtle_program(r1, hole(122), [start(352, 121, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1, hole(123), [start(344, 133, -90), forward(5), turn(-180), forward(5), close]).
turtle_program(r1, hole(124), [start(342, 154, -90), forward(4), turn(-180), forward(4), close]).
turtle_program(r1, hole(125), [start(608, 159, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1, hole(126), [start(592, 172, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(127), [start(636, 177, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1, hole(128), [start(496, 178, -153.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r1, hole(129), [start(610, 203, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1, hole(130), [start(370, 208, -135), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r1, hole(131), [start(568, 212, -45), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r1, hole(132), [start(566, 216, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(133), [start(492, 218, -45), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r1, hole(134), [start(532, 240, -135), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r1, hole(135), [start(536, 243, -135), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r1, hole(136), [start(412, 246, 180), forward(4), turn(180), forward(4), close]).
turtle_program(r1, hole(137), [start(534, 286, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(138), [start(400, 300, -153.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r1, hole(139), [start(512, 315, -153.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r1, hole(140), [start(568, 343, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1, hole(141), [start(70, 508, -166), forward(4.1), turn(-180), forward(4.1), close]).
turtle_program(r1, hole(142), [start(102, 522, -26.6), forward(2.2), turn(-167.5), forward(4.1), turn(-166), forward(2), close]).
turtle_program(r1, hole(143), [start(208, 552, -26.6), forward(2.2), turn(-167.5), forward(4.1), turn(-166), forward(2), close]).
turtle_program(r1, hole(144), [start(128, 577, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1, hole(145), [start(100, 605, -71.6), forward(3.2), turn(-180), forward(3.2), close]).
turtle_program(r1, hole(146), [start(128, 618, -45), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r1, hole(147), [start(380, 892, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(148), [start(354, 115, -26.6), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(149), [start(342, 172, -90), forward(4), turn(-180), forward(4), close]).
turtle_program(r1, hole(150), [start(566, 272, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(151), [start(510, 317, -123.7), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1, hole(152), [start(64, 505, -166), forward(4.1), turn(-180), forward(4.1), close]).
turtle_program(r1, hole(153), [start(98, 521, 180), forward(4), turn(180), forward(4), close]).
turtle_program(r1, hole(154), [start(202, 554, -26.6), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(155), [start(136, 567, -90), forward(3), turn(-180), forward(3), close]).
turtle_program(r1, hole(156), [start(354, 885, 180), forward(4), turn(180), forward(4), close]).
turtle_program(r1, hole(157), [start(382, 886, -63.4), forward(2.2), turn(-150.3), forward(3.6), turn(-146.3), forward(2), close]).
turtle_program(r1, hole(158), [start(410, 152, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(159), [start(610, 154, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(160), [start(412, 156, -116.6), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(161), [start(608, 156, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(162), [start(612, 156, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(163), [start(590, 175, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(164), [start(588, 178, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(165), [start(586, 181, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(166), [start(584, 184, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(167), [start(582, 187, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(168), [start(584, 188, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(169), [start(418, 189, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1, hole(170), [start(574, 198, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(171), [start(578, 199, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(172), [start(372, 201, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(173), [start(572, 201, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1, hole(174), [start(576, 202, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(175), [start(574, 205, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(176), [start(494, 207, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(177), [start(608, 207, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(178), [start(572, 208, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(179), [start(492, 210, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(180), [start(498, 210, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(181), [start(504, 210, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(182), [start(496, 213, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1, hole(183), [start(564, 213, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1, hole(184), [start(572, 219, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1, hole(185), [start(578, 220, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(186), [start(494, 223, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(187), [start(606, 230, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(188), [start(560, 231, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1, hole(189), [start(608, 233, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(190), [start(562, 236, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(191), [start(532, 237, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(192), [start(560, 239, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(193), [start(408, 243, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(194), [start(540, 246, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(195), [start(358, 254, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(196), [start(560, 256, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(197), [start(562, 258, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(198), [start(568, 263, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(199), [start(430, 265, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(200), [start(618, 271, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(201), [start(564, 275, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(202), [start(622, 285, -108.4), forward(3.2), turn(-180), forward(3.2), close]).
turtle_program(r1, hole(203), [start(596, 285, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1, hole(204), [start(566, 287, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(205), [start(594, 287, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(206), [start(532, 289, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(207), [start(394, 293, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(208), [start(574, 332, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(209), [start(544, 361, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(210), [start(556, 375, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(211), [start(158, 482, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(212), [start(206, 496, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(213), [start(208, 498, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(214), [start(218, 507, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(215), [start(220, 510, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(216), [start(82, 511, 180), forward(4), turn(180), forward(4), close]).
turtle_program(r1, hole(217), [start(86, 512, 180), forward(4), turn(180), forward(4), close]).
turtle_program(r1, hole(218), [start(234, 515, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(219), [start(120, 552, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(220), [start(116, 553, 180), forward(4), turn(180), forward(4), close]).
turtle_program(r1, hole(221), [start(110, 554, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(222), [start(106, 555, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(223), [start(102, 556, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(224), [start(252, 556, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(225), [start(98, 557, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(226), [start(190, 558, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(227), [start(130, 568, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(228), [start(128, 571, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1, hole(229), [start(170, 575, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(230), [start(166, 578, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(231), [start(120, 582, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(232), [start(126, 620, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(233), [start(122, 622, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(234), [start(386, 880, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(235), [start(356, 882, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(236), [start(344, 887, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(237), [start(382, 136, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(238), [start(626, 146, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(239), [start(344, 148, -116.6), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r1, hole(240), [start(622, 148, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(241), [start(456, 187, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(242), [start(530, 235, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(243), [start(556, 247, -135), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1, hole(244), [start(386, 253, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(245), [start(502, 254, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(246), [start(442, 273, -135), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1, hole(247), [start(416, 273, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(248), [start(588, 286, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(249), [start(508, 320, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(250), [start(536, 352, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(251), [start(542, 359, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(252), [start(62, 466, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(253), [start(70, 468, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(254), [start(66, 470, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(255), [start(78, 471, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(256), [start(80, 472, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(257), [start(82, 477, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(258), [start(96, 478, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(259), [start(168, 479, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(260), [start(202, 479, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(261), [start(102, 480, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(262), [start(106, 481, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(263), [start(110, 482, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(264), [start(198, 487, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(265), [start(102, 520, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(266), [start(136, 552, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(267), [start(90, 559, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(268), [start(138, 561, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1, hole(269), [start(34, 561, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(270), [start(38, 562, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r1, hole(271), [start(358, 892, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1, hole(272), [start(382, 895, -135), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r3438, hole(1), [start(460, 520, -150.5), forward(52.8), turn(-56), forward(4.5), turn(-127.8), forward(55.5), close]).
turtle_program(r3438, hole(2), [start(408, 860, -36.9), forward(5), turn(-25.1), forward(17), turn(-46.5), forward(6.3), turn(-105.3), forward(7.2), turn(-24.7), forward(15.3), turn(-31.6), forward(5), turn(-63.4), forward(4.5), close]).
turtle_program(r3438, hole(3), [start(478, 477, -107.7), forward(26.2), turn(-180), forward(26.2), close]).
turtle_program(r3438, hole(4), [start(454, 882, -36.9), forward(10), turn(-26.6), forward(8.9), turn(-166), forward(18.4), close]).
turtle_program(r3438, hole(5), [start(446, 357, -141.3), forward(12.8), turn(-180), forward(12.8), close]).
turtle_program(r3438, hole(6), [start(468, 325, -90), forward(4), turn(-45), forward(7.1), turn(-180), forward(7.1), turn(45), forward(4), close]).
turtle_program(r3438, hole(7), [start(446, 885, 180), forward(16), turn(180), forward(16), close]).
turtle_program(r3438, hole(8), [start(488, 604, -138.8), forward(10.6), turn(-180), forward(10.6), close]).
turtle_program(r3438, hole(9), [start(382, 496, -26.6), forward(6.7), turn(-139.4), forward(4.1), turn(-59), forward(5.7), turn(-135), forward(2), close]).
turtle_program(r3438, hole(10), [start(490, 599, -143.1), forward(10), turn(-180), forward(10), close]).
turtle_program(r3438, hole(11), [start(484, 497, -108.4), forward(9.5), turn(-180), forward(9.5), close]).
turtle_program(r3438, hole(12), [start(484, 639, -140.2), forward(7.8), turn(-180), forward(7.8), close]).
turtle_program(r3438, hole(13), [start(424, 883, -153.4), forward(8.9), turn(-180), forward(8.9), close]).
turtle_program(r3438, hole(14), [start(354, 752, -135), forward(5.7), turn(-149), forward(4.1), turn(-76), forward(3), close]).
turtle_program(r3438, hole(15), [start(422, 834, -153.4), forward(6.7), turn(-180), forward(6.7), close]).
turtle_program(r3438, hole(16), [start(346, 647, -59), forward(5.8), turn(-180), forward(5.8), close]).
turtle_program(r3438, hole(17), [start(402, 896, -146.3), forward(7.2), turn(-180), forward(7.2), close]).
turtle_program(r3438, hole(18), [start(490, 523, -90), forward(5), turn(-180), forward(4), turn(76), forward(4.1), turn(-166), forward(4), close]).
turtle_program(r3438, hole(19), [start(418, 873, -68.2), forward(5.4), turn(-180), forward(5.4), close]).
turtle_program(r3438, hole(20), [start(436, 348, -143.1), forward(5), turn(-180), forward(5), close]).
turtle_program(r3438, hole(21), [start(486, 504, -108.4), forward(6.3), turn(-180), forward(6.3), close]).
turtle_program(r3438, hole(22), [start(460, 583, -161.6), forward(6.3), turn(-180), forward(6.3), close]).
turtle_program(r3438, hole(23), [start(324, 759, -45), forward(4.2), turn(-180), forward(4.2), close]).
turtle_program(r3438, hole(24), [start(414, 445, -111.8), forward(5.4), turn(-180), forward(5.4), close]).
turtle_program(r3438, hole(25), [start(466, 587, -153.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r3438, hole(26), [start(472, 590, -153.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r3438, hole(27), [start(450, 362, -153.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r3438, hole(28), [start(452, 366, -135), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r3438, hole(29), [start(490, 516, -116.6), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r3438, hole(30), [start(354, 586, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(31), [start(350, 591, -71.6), forward(3.2), turn(-180), forward(3.2), close]).
turtle_program(r3438, hole(32), [start(478, 595, -135), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r3438, hole(33), [start(342, 600, -45), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r3438, hole(34), [start(562, 719, -153.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r3438, hole(35), [start(346, 743, -153.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r3438, hole(36), [start(346, 747, -153.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r3438, hole(37), [start(330, 752, -45), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r3438, hole(38), [start(314, 772, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(39), [start(310, 777, -71.6), forward(3.2), turn(-180), forward(3.2), close]).
turtle_program(r3438, hole(40), [start(402, 857, -135), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r3438, hole(41), [start(404, 893, -153.4), forward(4.5), turn(-180), forward(4.5), close]).
turtle_program(r3438, hole(42), [start(448, 578, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(43), [start(414, 832, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(44), [start(426, 340, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(45), [start(430, 343, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(46), [start(480, 484, -116.6), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(47), [start(488, 511, -108.4), forward(3.2), turn(-180), forward(3.2), close]).
turtle_program(r3438, hole(48), [start(474, 592, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(49), [start(346, 595, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r3438, hole(50), [start(340, 603, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r3438, hole(51), [start(492, 603, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(52), [start(338, 607, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r3438, hole(53), [start(490, 607, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(54), [start(470, 609, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(55), [start(334, 613, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r3438, hole(56), [start(564, 723, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(57), [start(342, 726, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(58), [start(342, 730, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(59), [start(418, 736, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(60), [start(340, 741, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(61), [start(350, 750, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(62), [start(330, 761, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r3438, hole(63), [start(320, 765, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r3438, hole(64), [start(324, 767, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r3438, hole(65), [start(320, 772, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(66), [start(314, 779, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r3438, hole(67), [start(424, 812, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(68), [start(422, 815, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r3438, hole(69), [start(420, 818, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(70), [start(418, 823, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r3438, hole(71), [start(416, 826, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r3438, hole(72), [start(410, 834, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(73), [start(408, 837, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r3438, hole(74), [start(406, 878, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(75), [start(604, 883, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r3438, hole(76), [start(392, 894, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r3438, hole(77), [start(410, 897, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(78), [start(384, 924, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(79), [start(478, 480, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r3438, hole(80), [start(480, 487, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r3438, hole(81), [start(406, 494, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r3438, hole(82), [start(412, 494, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r3438, hole(83), [start(408, 496, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r3438, hole(84), [start(486, 507, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r3438, hole(85), [start(444, 576, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r3438, hole(86), [start(454, 580, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r3438, hole(87), [start(414, 829, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r3438, hole(88), [start(400, 853, -135), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r3438, hole(89), [start(418, 876, -116.6), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3438, hole(90), [start(452, 883, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r3438, hole(91), [start(426, 884, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r3738, hole(1), [start(252, 449, -143.1), forward(5), turn(-180), forward(5), close]).
turtle_program(r3738, hole(2), [start(248, 464, -143.1), forward(5), turn(-180), forward(5), close]).
turtle_program(r3738, hole(3), [start(242, 459, -166), forward(4.1), turn(-180), forward(4.1), close]).
turtle_program(r3738, hole(4), [start(248, 445, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3738, hole(5), [start(246, 466, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3738, hole(6), [start(242, 475, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3738, hole(7), [start(244, 486, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3738, hole(8), [start(190, 465, 180), forward(2), turn(180), forward(2), close]).
turtle_program(r7611, hole(1), [start(282, 815, -45), forward(4.2), turn(-180), forward(4.2), close]).
turtle_program(r7611, hole(2), [start(278, 814, -63.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r7611, hole(3), [start(248, 844, -135), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r7611, hole(4), [start(282, 809, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r3808, hole(1), [start(558, 400, -49.4), forward(9.2), turn(-22.2), forward(9.5), turn(-169.1), forward(18.4), close]).
turtle_program(r3808, hole(2), [start(550, 400, -123.7), forward(7.2), turn(-146.3), forward(3), turn(-53.1), forward(5), close]).
turtle_program(r3808, hole(3), [start(592, 407, -51.3), forward(6.4), turn(-65.2), forward(2.2), turn(-130.2), forward(7.6), close]).
turtle_program(r3808, hole(4), [start(556, 401, 180), forward(4), turn(180), forward(4), close]).
turtle_program(r3808, hole(5), [start(590, 410, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r3808, hole(6), [start(564, 419, -153.4), forward(2.2), turn(-180), forward(2.2), close]).
turtle_program(r3808, hole(7), [start(568, 382, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r12, hole(1), [start(404, 30, -53.1), forward(10), turn(-180), forward(10), close]).
turtle_program(r12, hole(2), [start(408, 19, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r12, hole(3), [start(404, 21, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r12, hole(4), [start(414, 21, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r12, hole(5), [start(402, 25, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1808, hole(1), [start(290, 234, -50.2), forward(7.8), turn(-180), forward(7.8), close]).
turtle_program(r1808, hole(2), [start(306, 223, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1808, hole(3), [start(290, 239, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1808, hole(4), [start(284, 241, -71.6), forward(3.2), turn(-180), forward(3.2), close]).
turtle_program(r1808, hole(5), [start(280, 245, -56.3), forward(3.6), turn(-180), forward(3.6), close]).
turtle_program(r1808, hole(6), [start(262, 275, -71.6), forward(3.2), turn(-180), forward(3.2), close]).
turtle_program(r1808, hole(7), [start(286, 243, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1808, hole(8), [start(284, 247, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1808, hole(9), [start(278, 249, -90), forward(1), turn(-180), forward(1), close]).
turtle_program(r1808, hole(10), [start(282, 250, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r1808, hole(11), [start(268, 263, -45), forward(1.4), turn(-180), forward(1.4), close]).
turtle_program(r1808, hole(12), [start(264, 282, -90), forward(2), turn(-180), forward(2), close]).
turtle_program(r2067, hole(1), [start(396, 222, -45), forward(2.8), turn(-180), forward(2.8), close]).
turtle_program(r306, hole(1), [start(364, 77, -36.9), forward(5), turn(-180), forward(5), close]).
turtle_program(r306, hole(2), [start(364, 81, -45), forward(1.4), turn(-153.4), forward(3.2), turn(-161.6), forward(2), close]).
turtle_program(r1, midline(1), [start(392, 72, -135), forward(1.4), turn(-116.6), forward(3.2), turn(34.7), forward(5), turn(-98.1), forward(1.4), turn(90), forward(5.7), turn(-20.6), forward(12.1), turn(-17.3), forward(8.1), turn(37.9), forward(2.8), turn(-50.7), forward(10), turn(27.5), forward(5.4), turn(23.2), forward(7.1), turn(76), forward(5.8), turn(29.3), forward(8.1), turn(-48.9), forward(5.1), turn(-48.2), forward(5), turn(67.8), forward(5.8), turn(14), forward(18.4), turn(-48.4), forward(17), turn(12.1), forward(13.2), turn(3.8), forward(27.7), turn(26.1), forward(6.4), turn(-52.7), forward(4.1), turn(59), forward(2.8), turn(-81.9), forward(35), turn(-6.4), forward(23.3), turn(21.9), forward(74.1), turn(-51.1), forward(39.8), turn(-5), forward(46.1), turn(-6), forward(35.2), turn(-7.9), forward(43), turn(19.4), forward(54.7), turn(34.5), forward(42.8), turn(-8.4), forward(48.8), turn(-10.5), forward(18), turn(-8.7), forward(16.6), turn(-12), forward(13.3), turn(-13), forward(23), turn(-17.1), forward(13.6), turn(54), forward(20), turn(-18.4), forward(15.8), turn(-36.9), forward(6.3), turn(63.4), forward(2.8), turn(-45), forward(11), turn(-24), forward(9.8), turn(-111), forward(26.9), turn(-126.5), forward(20.2)]).
turtle_program(r1, midline(2), [start(392, 70, -38.7), forward(6.4)]).
turtle_program(r1, midline(3), [start(370, 124, 45), forward(1.4), turn(90), forward(9.9), turn(45), forward(1), turn(45), forward(8.5), turn(-153.4), forward(3.2), turn(55.3), forward(5), turn(31.3), forward(5.4), turn(93.4), forward(3.2), turn(-27.5), forward(44.6)]).
turtle_program(r1, midline(4), [start(127, 313, 17.2), forward(30.4), turn(-5), forward(47.1), turn(-4.8), forward(23.2), turn(-7.4), forward(29), turn(-12.5), forward(18.4), turn(-12.7), forward(18.8), turn(-18.9), forward(43.1), turn(-45.9), forward(12), turn(-14), forward(24.7), turn(23.1), forward(25.3), turn(14.1), forward(7.6), turn(19.5), forward(17.7), turn(13.6), forward(21.6), turn(-56.3), forward(7), turn(45), forward(5.7), turn(-103), forward(9.4), turn(-77), forward(2.8), turn(90), forward(4.2), turn(-41.6), forward(17), turn(22), forward(21), turn(19.7), forward(15.6), turn(-45), forward(8), turn(26.6), forward(17.9), turn(17), forward(56.6)]).
turtle_program(r1, midline(5), [start(265, 86, -41.8), forward(25.5), turn(8.1), forward(36.1), turn(11.5), forward(29.2), turn(13.4), forward(13.2), turn(-27.4), forward(32.2), turn(11), forward(18.8), turn(11.2), forward(20.6), turn(17.2), forward(18), turn(16.8), forward(11.7), turn(12.5), forward(13), turn(12.5), forward(19.8), turn(-35), forward(17.3), turn(13.6), forward(17.5), turn(10.9), forward(19.4), turn(10.5), forward(39.6), turn(128.7), forward(9.1), turn(12.1), forward(59.3), turn(9.3), forward(26.9)]).
turtle_program(r1, midline(6), [start(404, 869, -108.4), forward(3.2), turn(-105.3), forward(3.6), turn(60.3), forward(2.2), turn(97.1), forward(3.6)]).
turtle_program(r1, midline(7), [start(16, 519, 47.7), forward(14.9), turn(87.3), forward(1.4), turn(45), forward(1), turn(45), forward(14.1)]).
turtle_program(r1, midline(8), [start(343, 111, -135), forward(14.1)]).
turtle_program(r1, midline(9), [start(388, 96, 128.2), forward(17.8)]).
turtle_program(r1, midline(10), [start(32, 544, -11.3), forward(5.1), turn(-123.7), forward(15.6), turn(175.2), forward(17), turn(94.8), forward(19.8), turn(78.7), forward(3.6), turn(-78.7), forward(14.1), turn(-74.7), forward(8.1), turn(-105.3), forward(41), turn(-135), forward(5)]).
turtle_program(r1, midline(11), [start(356, 188, -45), forward(14.1), turn(-66.8), forward(5.4), turn(-113.2), forward(14.1), turn(96.3), forward(6.4), turn(-96.3), forward(2.8), turn(45), forward(3), turn(-45), forward(2.8)]).
turtle_program(r1, midline(12), [start(350, 131, -45), forward(4.2), turn(-90), forward(5.7), turn(83.7), forward(6.4), turn(-72.3), forward(3.6)]).
turtle_program(r1, midline(13), [start(344, 184, -45), forward(2.8), turn(90), forward(1.4), turn(-108.4), forward(2.2)]).
turtle_program(r1, midline(14), [start(350, 188, 141.3), forward(6.4)]).
turtle_program(r1, midline(15), [start(321, 283, -45), forward(43.8), turn(-90), forward(1.4), turn(-45), forward(1), turn(-45), forward(41)]).
turtle_program(r1, midline(16), [start(353, 252, 0), forward(2), turn(111.8), forward(5.4), turn(34.5), forward(14.4)]).
turtle_program(r1, midline(17), [start(356, 251, -45), forward(12.7), turn(-87), forward(13.5), turn(-38.6), forward(6.1)]).
turtle_program(r1, midline(18), [start(358, 232, -40.9), forward(19.8), turn(-39.6), forward(6.1), turn(-68.5), forward(11.7), turn(-61.9), forward(5.8), turn(97.8), forward(7.6), turn(-40.2), forward(4.5)]).
turtle_program(r1, midline(19), [start(357, 202, -45), forward(9.9), turn(-105.9), forward(10.3)]).
turtle_program(r1, midline(20), [start(240, 107, 45), forward(33.9), turn(135), forward(8), turn(45), forward(28.3)]).
turtle_program(r1, midline(21), [start(265, 131, -14), forward(4.1), turn(-121), forward(35.4)]).
turtle_program(r1, midline(22), [start(353, 116, 26.6), forward(2.2), turn(-116.6), forward(2)]).
turtle_program(r1, midline(23), [start(356, 117, 51.3), forward(6.4), turn(83.7), forward(2.8), turn(90), forward(5.7), turn(-90), forward(2.8), turn(45), forward(1)]).
turtle_program(r1, midline(24), [start(357, 125, -135), forward(4.2), turn(-135), forward(4)]).
turtle_program(r1, midline(25), [start(415, 138, 63.4), forward(2.2), turn(-108.4), forward(8.5), turn(-90), forward(1.4), turn(-37.9), forward(8.1), turn(-52.1), forward(4.2), turn(78.7), forward(3.6), turn(-76.4), forward(17.7), turn(87.7), forward(15.6), turn(-11.3), forward(10.8), turn(-78.7), forward(12.7), turn(77), forward(9.4), turn(-170.8), forward(10.6), turn(-86.2), forward(12.7), turn(90), forward(1.4), turn(90), forward(15.6), turn(90), forward(11.3)]).
turtle_program(r1, midline(26), [start(423, 133, 45), forward(1.4), turn(90), forward(14.1), turn(95.2), forward(7.8), turn(-95.2), forward(18.4), turn(113.2), forward(5.4)]).
turtle_program(r1, midline(27), [start(409, 136, 90), forward(1)]).
turtle_program(r1, midline(28), [start(359, 130, 45), forward(7.1)]).
turtle_program(r1, midline(29), [start(408, 132, -123.7), forward(3.6), turn(-99), forward(17.7), turn(90.7), forward(13.5), turn(-8.2), forward(7.8), turn(76.8), forward(6.7), turn(-48.4), forward(5.4), turn(66.8), forward(5.7), turn(108.4), forward(2.2), turn(-18.4), forward(5.7), turn(108.4), forward(6.7)]).
turtle_program(r1, midline(30), [start(385, 111, -53.1), forward(5), turn(64.4), forward(5.1), turn(78.7), forward(8), turn(129.8), forward(7.8)]).
turtle_program(r1, midline(31), [start(394, 116, 45), forward(15.6), turn(90), forward(17)]).
turtle_program(r1, midline(32), [start(358, 114, 135), forward(1.4)]).
turtle_program(r1, midline(33), [start(396, 197, 0), forward(2), turn(71.6), forward(3.2), turn(86.6), forward(16.2), turn(-16.1), forward(11.4)]).
turtle_program(r1, midline(34), [start(364, 206, -90), forward(3), turn(-56.3), forward(3.6), turn(101.3), forward(5.7), turn(-45), forward(1), turn(45), forward(1.4), turn(-90), forward(2.8), turn(90), forward(7.1), turn(-101.3), forward(3.6), turn(-78.7), forward(7.1), turn(-166), forward(5.8)]).
turtle_program(r1, midline(35), [start(368, 186, -126.9), forward(5), turn(-98.1), forward(11.3), turn(-90), forward(1.4), turn(-90), forward(9.9)]).
turtle_program(r1, midline(36), [start(366, 197, -45), forward(2.8), turn(-90), forward(2.8), turn(90), forward(4.2), turn(153.4), forward(3.2), turn(-126.9), forward(3.2), turn(74.7), forward(3.6), turn(78.7), forward(11.3)]).
turtle_program(r1, midline(37), [start(367, 203, -26.6), forward(2.2), turn(90), forward(2.2), turn(-108.4), forward(2.8), turn(-108.4), forward(2.2)]).
turtle_program(r1, midline(38), [start(269, 132, -33.7), forward(3.6), turn(60.3), forward(2.2), turn(126.9), forward(2.2)]).
turtle_program(r1, midline(39), [start(339, 182, -45), forward(12.7), turn(-63.4), forward(3.2), turn(-109.7), forward(17.8)]).
turtle_program(r1, midline(40), [start(348, 187, 180), forward(2)]).
turtle_program(r1, midline(41), [start(372, 210, -71.6), forward(3.2), turn(-63.4), forward(2.8), turn(-101.3), forward(3.6)]).
turtle_program(r1, midline(42), [start(353, 212, -150.9), forward(10.3)]).
turtle_program(r1, midline(43), [start(366, 181, -90), forward(1)]).
turtle_program(r1, midline(44), [start(388, 184, -107.7), forward(23.1), turn(-62.9), forward(12.2), turn(56.6), forward(9.8), turn(-66), forward(6), turn(26.6), forward(8.9), turn(22.8), forward(9.2), turn(-43.8), forward(71.3)]).
turtle_program(r1, midline(45), [start(348, 146, 108.4), forward(6.3), turn(114.1), forward(16.3)]).
turtle_program(r1, midline(46), [start(382, 161, -34.7), forward(15.8)]).
turtle_program(r1, midline(47), [start(396, 154, 45), forward(2.8), turn(-90), forward(18.4)]).
turtle_program(r1, midline(48), [start(347, 153, 99.5), forward(6.1), turn(43.7), forward(5), turn(36.9), forward(46)]).
turtle_program(r1, midline(49), [start(254, 131, -136.5), forward(27.6)]).
turtle_program(r1, midline(50), [start(375, 434, 150.5), forward(34.5), turn(-19.5), forward(39.7), turn(49.1), forward(11), turn(33.7), forward(3.6), turn(-54.2), forward(8.5), turn(64.2), forward(29), turn(-175.6), forward(26.9), turn(113.6), forward(15.8), turn(-20.7), forward(34.8), turn(61), forward(10.8), turn(-29.4), forward(15.1), turn(50.7), forward(21.9), turn(-51.3), forward(7.1), turn(29.9), forward(16.2), turn(23.2), forward(7.1), turn(-45), forward(6), turn(45), forward(70.7), turn(-90), forward(62.2), turn(69.2), forward(21.9), turn(-50.8), forward(2.2), turn(66.4), forward(7.8), turn(50.2), forward(52)]).
turtle_program(r1, midline(51), [start(197, 491, 135), forward(5.7), turn(84.8), forward(7.8), turn(36.2), forward(4.1)]).
turtle_program(r1, midline(52), [start(231, 504, -135), forward(5.7), turn(-29.1), forward(7.3)]).
turtle_program(r1, midline(53), [start(61, 469, 129.8), forward(7.8), turn(126.2), forward(4.1), turn(-31), forward(35.4)]).
turtle_program(r1, midline(54), [start(83, 474, -46.9), forward(63), turn(-177.4), forward(64.4)]).
turtle_program(r1, midline(55), [start(74, 473, 135), forward(17), turn(85.6), forward(9.2), turn(49.4), forward(3)]).
turtle_program(r1, midline(56), [start(65, 466, -66.8), forward(7.6), turn(21.8), forward(70.7), turn(-57.4), forward(42), turn(-32.6), forward(2.8), turn(-90), forward(4.2)]).
turtle_program(r1, midline(57), [start(56, 465, 104), forward(4.1)]).
turtle_program(r1, midline(58), [start(57, 477, -48.8), forward(10.6)]).
turtle_program(r1, midline(59), [start(75, 471, -46.7), forward(70), turn(-177.7), forward(70)]).
turtle_program(r1, midline(60), [start(177, 482, -153.4), forward(11.2), turn(18.4), forward(49.5), turn(-90.7), forward(54.5), turn(84.4), forward(6.4), turn(-38.7), forward(4)]).
turtle_program(r1, midline(61), [start(175, 484, 153.4), forward(4.5), turn(71.6), forward(52.3), turn(-90.8), forward(48.8), turn(99), forward(5)]).
turtle_program(r1, midline(62), [start(100, 485, 71.6), forward(9.5), turn(40.2), forward(5.4), turn(76.3), forward(14.1), turn(36.9), forward(4.2), turn(-63.4), forward(3.2), turn(45), forward(20.1)]).
turtle_program(r1, midline(63), [start(135, 451, 135), forward(38.2), turn(-13), forward(9.4)]).
turtle_program(r1, midline(64), [start(135, 453, 132.6), forward(34), turn(-25.9), forward(10.4), turn(28.3), forward(7.1)]).
turtle_program(r1, midline(65), [start(90, 476, -45.7), forward(55.9), turn(-70.8), forward(2.2), turn(-109.1), forward(58.7)]).
turtle_program(r1, midline(66), [start(169, 476, -134.3), forward(55.9)]).
turtle_program(r1, midline(67), [start(80, 496, 135), forward(41), turn(90), forward(19.8), turn(-16.4), forward(12.5)]).
turtle_program(r1, midline(68), [start(72, 472, 135), forward(15.6)]).
turtle_program(r1, midline(69), [start(71, 489, -45), forward(17)]).
turtle_program(r1, midline(70), [start(132, 444, 135), forward(43.8), turn(-23.2), forward(5.4)]).
turtle_program(r1, midline(71), [start(69, 471, 132), forward(13.5)]).
turtle_program(r1, midline(72), [start(128, 431, -135), forward(1.4)]).
turtle_program(r1, midline(73), [start(102, 499, 96.3), forward(9.1), turn(30.5), forward(10), turn(23.4), forward(8.1), turn(56.3), forward(2.2), turn(71.6), forward(14.1), turn(-145), forward(43.9), turn(104.4), forward(13)]).
turtle_program(r1, midline(74), [start(101, 511, 45), forward(9.9), turn(116.6), forward(3.2), turn(68.6), forward(7.8)]).
turtle_program(r1, midline(75), [start(53, 527, -45), forward(26.9), turn(-26.6), forward(3.2)]).
turtle_program(r1, midline(76), [start(109, 517, -47.5), forward(16.3), turn(-98.8), forward(10.8), turn(-41.8), forward(7.1)]).
turtle_program(r1, midline(77), [start(109, 519, 49.4), forward(18.4), turn(173.5), forward(19.1)]).
turtle_program(r1, midline(78), [start(121, 505, 39.8), forward(7.8), turn(32.8), forward(16.8), turn(35.8), forward(3.2), turn(45), forward(8.9)]).
turtle_program(r1, midline(79), [start(131, 517, -45), forward(14.1), turn(16.4), forward(25.1), turn(-72.7), forward(5.1), turn(-33.7), forward(4.2), turn(-29.7), forward(11.4), turn(29.7), forward(12.7), turn(29.7), forward(11.4), turn(-119.7), forward(17), turn(-16.4), forward(25.1)]).
turtle_program(r1, midline(80), [start(165, 494, -54.5), forward(8.6), turn(-118.4), forward(8.1), turn(56.3), forward(2.2), turn(-18.4), forward(36.8), turn(71.6), forward(2.2), turn(109.6), forward(36.1)]).
turtle_program(r1, midline(81), [start(136, 461, 63.4), forward(2.2)]).
turtle_program(r1, midline(82), [start(140, 478, 104), forward(8.2), turn(16.9), forward(23.3)]).
turtle_program(r1, midline(83), [start(193, 493, -56.3), forward(3.6)]).
turtle_program(r1, midline(84), [start(70, 469, -45.6), forward(72.8), turn(-60.4), forward(7.3)]).
turtle_program(r1, midline(85), [start(187, 491, 139.8), forward(34.1), turn(-28.9), forward(22.5), turn(85.8), forward(20.9)]).
turtle_program(r1, midline(86), [start(348, 169, -119.7), forward(8.1)]).
turtle_program(r1, midline(87), [start(349, 166, -5.7), forward(10), turn(140.7), forward(19.8)]).
turtle_program(r1, midline(88), [start(350, 176, 63.4), forward(2.2), turn(-108.4), forward(19.8), turn(-71.6), forward(2.2), turn(-90), forward(4.5)]).
turtle_program(r1, midline(89), [start(366, 162, 90), forward(5), turn(45), forward(18.4)]).
turtle_program(r1, midline(90), [start(368, 162, -90), forward(1)]).
turtle_program(r1, midline(91), [start(75, 494, 133.9), forward(37.5)]).
turtle_program(r1, midline(92), [start(67, 470, 132), forward(13.5)]).
turtle_program(r1, midline(93), [start(317, 482, 135), forward(63.6), turn(35), forward(17.3), turn(55), forward(4.2), turn(51.7), forward(17.1)]).
turtle_program(r1, midline(94), [start(264, 530, 42), forward(13.5), turn(74.6), forward(2.2), turn(63.4), forward(1), turn(45), forward(14.1), turn(-45), forward(6)]).
turtle_program(r1, midline(95), [start(276, 520, -136.7), forward(23.3)]).
turtle_program(r1, midline(96), [start(252, 528, 139.4), forward(9.2), turn(89), forward(24.1), turn(-37.1), forward(5.1), turn(33.7), forward(5.7), turn(-45), forward(1), turn(45), forward(1.4), turn(-90), forward(21.2), turn(56.3), forward(5.1), turn(78.7), forward(22), turn(-33.7), forward(7.2)]).
turtle_program(r1, midline(97), [start(200, 514, -45), forward(22.6), turn(98.1), forward(5), turn(78.9), forward(26.9), turn(-87), forward(1.4), turn(-90), forward(24)]).
turtle_program(r1, midline(98), [start(226, 516, 132.9), forward(19.1), turn(70.3), forward(7.6), turn(3.4), forward(2.2), turn(108.4), forward(19.8)]).
turtle_program(r1, midline(99), [start(214, 530, 29.1), forward(10.3), turn(109.5), forward(22.7), turn(84.8), forward(24.8), turn(-65.2), forward(26.9), turn(63.4), forward(12)]).
turtle_program(r1, midline(100), [start(224, 535, 26.6), forward(4.5), turn(108.4), forward(22.6), turn(90), forward(4.2)]).
turtle_program(r1, midline(101), [start(230, 515, -90), forward(4), turn(-135), forward(4.2)]).
turtle_program(r1, midline(102), [start(188, 535, 45), forward(7.1), turn(63.4), forward(3.2), turn(-63.4), forward(2.8), turn(45), forward(11), turn(45), forward(2.8), turn(45), forward(1), turn(45), forward(24)]).
turtle_program(r1, midline(103), [start(194, 541, 46.5), forward(27.6), turn(107), forward(2.2), turn(71.6), forward(22.6)]).
turtle_program(r1, midline(104), [start(212, 563, 116.6), forward(2.2), turn(108.4), forward(14.1), turn(-11.3), forward(7.2)]).
turtle_program(r1, midline(105), [start(201, 557, 39.3), forward(14.2)]).
turtle_program(r1, midline(106), [start(197, 524, 138.4), forward(12)]).
turtle_program(r1, midline(107), [start(252, 530, 45), forward(22.6), turn(90), forward(2.8), turn(88.3), forward(23.3)]).
turtle_program(r1, midline(108), [start(266, 549, -45), forward(5.7), turn(-90), forward(17)]).
turtle_program(r1, midline(109), [start(214, 563, -45), forward(35.4), turn(-123.7), forward(10.2)]).
turtle_program(r1, midline(110), [start(196, 496, -53.1), forward(5)]).
turtle_program(r1, midline(111), [start(207, 551, 33.7), forward(7.2), turn(56.3), forward(3), turn(-136.5), forward(27.6)]).
turtle_program(r1, midline(112), [start(222, 512, -135), forward(4.2)]).
turtle_program(r1, midline(113), [start(221, 508, -45), forward(2.8), turn(-90), forward(4.2)]).
turtle_program(r1, midline(114), [start(14, 565, -45), forward(11.3)]).
turtle_program(r1, midline(115), [start(366, 242, 45), forward(2.8), turn(45), forward(15), turn(45), forward(2.8), turn(49.1), forward(14)]).
turtle_program(r1, midline(116), [start(367, 262, 83.7), forward(18.1), turn(30.3), forward(19.7), turn(61.3), forward(12), turn(14.9), forward(28.4)]).
turtle_program(r1, midline(117), [start(362, 298, 33.7), forward(3.6), turn(-78.7), forward(31.1), turn(-108.4), forward(2.2), turn(-71.6), forward(28.3)]).
turtle_program(r1, midline(118), [start(370, 279, -45), forward(12.7), turn(71.6), forward(2.2), turn(108.4), forward(17)]).
turtle_program(r1, midline(119), [start(370, 275, -45), forward(8.5), turn(-45), forward(2), turn(-45), forward(9.9)]).
turtle_program(r1, midline(120), [start(363, 296, -45), forward(31.1), turn(-108.4), forward(2.2), turn(-71.6), forward(24)]).
turtle_program(r1, midline(121), [start(384, 272, -135), forward(2.8), turn(108.4), forward(2.2), turn(-77.5), forward(8.2), turn(59), forward(1.4), turn(-71.6), forward(2.2), turn(37.9), forward(5.1), turn(-56.3), forward(5.7), turn(90), forward(2.8), turn(-121), forward(12.4)]).
turtle_program(r1, midline(122), [start(384, 262, -45), forward(5.7), turn(-98.1), forward(5)]).
turtle_program(r1, midline(123), [start(389, 258, -125), forward(12.2)]).
turtle_program(r1, midline(124), [start(381, 245, 0), forward(11), turn(-45), forward(2.8), turn(96.3), forward(6.4), turn(-85), forward(3.6), turn(-112.6), forward(7.2)]).
turtle_program(r1, midline(125), [start(389, 246, 45), forward(17), turn(90), forward(1.4), turn(45), forward(2), turn(45), forward(17)]).
turtle_program(r1, midline(126), [start(384, 258, -45), forward(1.4)]).
turtle_program(r1, midline(127), [start(385, 268, -45), forward(11.3), turn(-90), forward(2.8), turn(-94.4), forward(9.2)]).
turtle_program(r1, midline(128), [start(392, 263, 116.6), forward(2.2), turn(-71.6), forward(7.1), turn(63.4), forward(3.2), turn(71.6), forward(5), turn(-45), forward(4.2), turn(71.6), forward(2.2)]).
turtle_program(r1, midline(129), [start(397, 270, -39.8), forward(7.8), turn(-59.7), forward(6.1), turn(54.5), forward(2.8), turn(-90), forward(15.6)]).
turtle_program(r1, midline(130), [start(399, 249, 45), forward(8.5), turn(-108.4), forward(2.2), turn(-71.6), forward(7.1)]).
turtle_program(r1, midline(131), [start(388, 277, -45), forward(2.8)]).
turtle_program(r1, midline(132), [start(394, 259, 0), forward(2)]).
turtle_program(r1, midline(133), [start(406, 251, -128.7), forward(6.4), turn(83.7), forward(1.4), turn(-104), forward(5.8)]).
turtle_program(r1, midline(134), [start(272, 528, 45), forward(8.5), turn(90), forward(2.8), turn(45), forward(2), turn(45), forward(8.5)]).
turtle_program(r1, midline(135), [start(279, 535, 45), forward(41), turn(90), forward(2.8), turn(90), forward(41), turn(-71.6), forward(2.2), turn(-108.4), forward(2.8), turn(90), forward(1.4), turn(45), forward(1), turn(-45), forward(2.8), turn(71.6), forward(2.2), turn(18.4), forward(12.7), turn(-45), forward(2)]).
turtle_program(r1, midline(136), [start(262, 535, 45), forward(11.3), turn(-18.4), forward(2.2), turn(108.4), forward(1.4), turn(-90), forward(1.4), turn(90), forward(2.8), turn(-90), forward(1.4), turn(-90), forward(7.1), turn(158.2), forward(7.6), turn(-169.5), forward(7.2)]).
turtle_program(r1, midline(137), [start(306, 567, -139.2), forward(38.3), turn(-175.8), forward(38.2), turn(71.6), forward(2.2), turn(108.4), forward(33.9), turn(-90), forward(7.1), turn(-166), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-139.4), forward(6.3), turn(148.2), forward(7.8), turn(93.1), forward(39.6), turn(-178), forward(39.6), turn(108.4), forward(2.2), turn(71.6), forward(43.8), turn(-56.3), forward(5.1), turn(56.3), forward(21.2), turn(-71.6), forward(4.5), turn(-108.4), forward(69.3), turn(78.7), forward(3.6), turn(102.5), forward(67.9)]).
turtle_program(r1, midline(138), [start(242, 537, 45), forward(67.9), turn(90), forward(1.4)]).
turtle_program(r1, midline(139), [start(285, 590, 139), forward(30.5), turn(6.7), forward(26.6), turn(123.6), forward(81), turn(-44.3), forward(1.4), turn(-90), forward(38.2), turn(90), forward(22.6)]).
turtle_program(r1, midline(140), [start(263, 551, 45), forward(42.4), turn(71.6), forward(2.2), turn(107.6), forward(46)]).
turtle_program(r1, midline(141), [start(128, 533, 92.9), forward(20), turn(-47.9), forward(2.8), turn(90), forward(8.5), turn(90), forward(7.1), turn(23.2), forward(10.8), turn(-20.9), forward(35.4)]).
turtle_program(r1, midline(142), [start(127, 559, 45), forward(7.1), turn(-71.6), forward(2.2), turn(-108.4), forward(8.5)]).
turtle_program(r1, midline(143), [start(108, 537, -127.6), forward(16.4), turn(-34), forward(3.2)]).
turtle_program(r1, midline(144), [start(98, 522, -26.6), forward(2.2), turn(-94.4), forward(5.8), turn(159.6), forward(6.4), turn(96.3), forward(1.4), turn(-153.4), forward(3.2), turn(63.4), forward(18.4), turn(71.6), forward(2.2), turn(108.4), forward(18.4)]).
turtle_program(r1, midline(145), [start(105, 538, 158.2), forward(10.8), turn(25.4), forward(16), turn(18.2), forward(10.8), turn(-31.3), forward(24.3)]).
turtle_program(r1, midline(146), [start(77, 541, 40.6), forward(18.4), turn(43.7), forward(10), turn(-39.3), forward(15.6), turn(78.7), forward(3.6), turn(99.2), forward(19.1), turn(33.1), forward(8.2), turn(-31), forward(24)]).
turtle_program(r1, midline(147), [start(98, 577, 145), forward(12.2), turn(17.2), forward(26.2), turn(93.7), forward(8.2), turn(12.7), forward(43)]).
turtle_program(r1, midline(148), [start(118, 534, 0), forward(1)]).
turtle_program(r1, midline(149), [start(53, 541, 135), forward(24), turn(-24.4), forward(8.5), turn(24.4), forward(17), turn(96.3), forward(6.4)]).
turtle_program(r1, midline(150), [start(19, 573, -45.9), forward(43.1)]).
turtle_program(r1, midline(151), [start(114, 535, -139.4), forward(18.4)]).
turtle_program(r1, midline(152), [start(111, 536, 135), forward(1.4)]).
turtle_program(r1, midline(153), [start(69, 536, -41.4), forward(22.7)]).
turtle_program(r1, midline(154), [start(82, 587, -18.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-63.4), forward(1.4), turn(-90), forward(2.8), turn(90), forward(1.4), turn(90), forward(4.2), turn(88.5), forward(26.2)]).
turtle_program(r1, midline(155), [start(91, 543, 38.7), forward(12.8)]).
turtle_program(r1, midline(156), [start(87, 585, -18.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-63.4), forward(1.4), turn(-90), forward(2.8), turn(90), forward(1.4), turn(78.7), forward(3.6), turn(-78.7), forward(14.1), turn(108.4), forward(2.2), turn(71.6), forward(12.7), turn(-90), forward(2.8), turn(-97.1), forward(11.4), turn(73.9), forward(5.4), turn(67.2), forward(58), turn(84.6), forward(9.1), turn(-35.7), forward(41.8)]).
turtle_program(r1, midline(157), [start(48, 620, 87.6), forward(24), turn(-16), forward(28.5), turn(-116.6), forward(65.1), turn(18.4), forward(2.2), turn(-52.1), forward(5.1)]).
turtle_program(r1, midline(158), [start(48, 608, -48.8), forward(21.3)]).
turtle_program(r1, midline(159), [start(59, 672, 63.4), forward(20.1), turn(-8.7), forward(29.4), turn(-8.4), forward(60.8), turn(59.8), forward(46.8), turn(-9), forward(48.4), turn(-54), forward(65.8), turn(-13.8), forward(36.7), turn(-13.7), forward(26), turn(-10.3), forward(43.2), turn(-6.7), forward(41), turn(-6), forward(23.2), turn(-45.7), forward(5), turn(-23.5), forward(21.6), turn(25.9), forward(14.2), turn(17), forward(7.2), turn(97.1), forward(2.2), turn(-97.1), forward(3.6), turn(33.7), forward(5), turn(-33.7), forward(3.6), turn(70.6), forward(5), turn(71.6), forward(3.2), turn(102.5), forward(5.8), turn(-69.6), forward(6.4), turn(72.3), forward(3.6)]).
turtle_program(r1, midline(160), [start(128, 758, -28.9), forward(43.4), turn(-7.6), forward(38.6), turn(-98.4), forward(124.5), turn(45), forward(5), turn(139.4), forward(9.2), turn(-94.4), forward(2.8), turn(-45), forward(2), turn(-45), forward(9.9)]).
turtle_program(r1, midline(161), [start(118, 796, 45), forward(79.2), turn(90), forward(2.8), turn(90), forward(77.8)]).
turtle_program(r1, midline(162), [start(173, 855, 14), forward(4.1), turn(-59), forward(2.8), turn(-121), forward(4.1)]).
turtle_program(r1, midline(163), [start(110, 614, 45), forward(12.7), turn(59), forward(4.1), turn(-59), forward(113.1), turn(-108.4), forward(2.2), turn(-71.6), forward(111.7), turn(59), forward(4.1), turn(-51.9), forward(11.4), turn(172.9), forward(12.7), turn(63.4), forward(3.2), turn(-63.1), forward(111)]).
turtle_program(r1, midline(164), [start(199, 708, 116.6), forward(4.5)]).
turtle_program(r1, midline(165), [start(116, 805, 45), forward(67.9), turn(108.4), forward(2.2), turn(71.6), forward(65.1), turn(-178.7), forward(62.2)]).
turtle_program(r1, midline(166), [start(117, 632, -108.4), forward(3.2)]).
turtle_program(r1, midline(167), [start(353, 196, -45), forward(4.2)]).
turtle_program(r1, midline(168), [start(86, 498, 135), forward(43.8)]).
turtle_program(r1, midline(169), [start(274, 92, -153.4), forward(4.5)]).
turtle_program(r1, midline(170), [start(92, 478, -45.7), forward(54.5), turn(90.7), forward(2.8)]).
turtle_program(r1, midline(171), [start(386, 120, 90), forward(3), turn(59), forward(5.8)]).
turtle_program(r1, midline(172), [start(364, 121, 161.6), forward(3.2)]).
turtle_program(r1, midline(173), [start(391, 116, 153.4), forward(2.2)]).
turtle_program(r1, midline(174), [start(68, 486, -47.7), forward(14.9)]).
turtle_program(r1, midline(175), [start(229, 538, 133.2), forward(21.9)]).
turtle_program(r1, midline(176), [start(74, 492, 135), forward(19.8)]).
turtle_program(r1, midline(177), [start(89, 479, 132.5), forward(16.3)]).
turtle_program(r1, midline(178), [start(65, 485, -45), forward(15.6)]).
turtle_program(r1, midline(179), [start(202, 490, -53.1), forward(5), turn(-94.4), forward(13), turn(-50.9), forward(9.5)]).
turtle_program(r1, midline(180), [start(201, 482, -45), forward(4.2), turn(-71.6), forward(2.2), turn(-79.4), forward(7.3)]).
turtle_program(r1, midline(181), [start(202, 486, 123.7), forward(3.6)]).
turtle_program(r1, midline(182), [start(349, 136, 126.9), forward(5)]).
turtle_program(r1, midline(183), [start(231, 507, 153.4), forward(4.5), turn(71.6), forward(4.2)]).
turtle_program(r1, midline(184), [start(366, 169, 108.4), forward(3.2)]).
turtle_program(r1, midline(185), [start(274, 527, 0), forward(48), turn(109.9), forward(38.3)]).
turtle_program(r1, midline(186), [start(197, 498, -51.3), forward(6.4)]).
turtle_program(r1, midline(187), [start(425, 133, 26.6), forward(2.2), turn(108.4), forward(18.4), turn(45), forward(2), turn(-45), forward(17), turn(108.4), forward(2.2)]).
turtle_program(r1, midline(188), [start(428, 134, 45), forward(1.4), turn(90), forward(18.4), turn(90), forward(1.4)]).
turtle_program(r1, midline(189), [start(322, 920, 7.1), forward(8.1), turn(56.3), forward(2.2), turn(-102.7), forward(14.2), turn(22.6), forward(10.4), turn(-16), forward(16.6), turn(-57.3), forward(8), turn(-45), forward(11.3), turn(-85.6), forward(9.2), turn(99.6), forward(5.8)]).
turtle_program(r1, midline(190), [start(331, 920, -45), forward(19.8), turn(-24), forward(13.9)]).
turtle_program(r1, midline(191), [start(367, 902, -20.6), forward(8.5), turn(-32.6), forward(5), turn(-81.9), forward(5.7), turn(-35.5), forward(6.1), turn(-65.8), forward(3.6)]).
turtle_program(r1, midline(192), [start(379, 894, -56.3), forward(3.6), turn(-78.7), forward(4.2), turn(-71.6), forward(4.5)]).
turtle_program(r1, midline(193), [start(379, 896, 26.6), forward(2.2), turn(-90), forward(6.7), turn(-79.7), forward(5)]).
turtle_program(r1, midline(194), [start(332, 924, 37.7), forward(27.8), turn(-19.3), forward(25.3), turn(-16.6), forward(64), turn(-9.3), forward(138.2), turn(-5.8), forward(34.9), turn(-5.9), forward(27.5), turn(-25.9), forward(5.7), turn(-27.9), forward(27.2), turn(-14), forward(37.1), turn(-18.6), forward(37.4), turn(-14.9), forward(33.6), turn(-84.7), forward(87.2), turn(-7.6), forward(63)]).
turtle_program(r1, midline(195), [start(627, 783, -81), forward(19.2), turn(-11.1), forward(53), turn(-14.1), forward(50), turn(-7.7), forward(39.4), turn(36.1), forward(14.3), turn(-20.2), forward(7.1), turn(53.1), forward(12.7), turn(-11.3), forward(21.6), turn(-9.1), forward(26.4), turn(-10.6), forward(20.6), turn(-42.9), forward(33.1), turn(12.2), forward(10.4), turn(-29.3), forward(41.7), turn(-6.2), forward(45.6)]).
turtle_program(r1, midline(196), [start(377, 893, -71.6), forward(3.2)]).
turtle_program(r1, midline(197), [start(80, 476, 132.5), forward(16.3)]).
turtle_program(r1, midline(198), [start(430, 134, 18.4), forward(3.2), turn(116.6), forward(19.8), turn(26.6), forward(6.3), turn(-18.4), forward(15), turn(-94.8), forward(12), turn(58.3), forward(10.4), turn(-16.7), forward(8), turn(-26.6), forward(6.7), turn(-108.4), forward(9.9), turn(-77.5), forward(13)]).
turtle_program(r1, midline(199), [start(410, 168, -26.6), forward(4.5), turn(-36.9), forward(6.7), turn(-17.1), forward(6.1), turn(-43.2), forward(3.6)]).
turtle_program(r1, midline(200), [start(434, 134, 14), forward(4.1), turn(121), forward(26.9)]).
turtle_program(r1, midline(201), [start(439, 134, 0), forward(7), turn(-63.4), forward(2.2), turn(-65.7), forward(34.8)]).
turtle_program(r1, midline(202), [start(413, 169, 45), forward(14.1), turn(81.9), forward(5), turn(53.1), forward(3), turn(45), forward(8.5)]).
turtle_program(r1, midline(203), [start(422, 182, 53.1), forward(5), turn(-98.1), forward(5.7), turn(-45), forward(3), turn(45), forward(4.2), turn(-116.6), forward(6.3), turn(26.6), forward(8.5), turn(-33.7), forward(5.1)]).
turtle_program(r1, midline(204), [start(421, 168, -45), forward(42.4), turn(-81.9), forward(5)]).
turtle_program(r1, midline(205), [start(448, 143, 135), forward(35.4), turn(-153.4), forward(3.2), turn(71.6), forward(5), turn(100.3), forward(2.2), turn(71.6), forward(2.8)]).
turtle_program(r1, midline(206), [start(442, 151, 135), forward(21.2)]).
turtle_program(r1, midline(207), [start(425, 175, 135), forward(1.4), turn(90), forward(9.9)]).
turtle_program(r1, midline(208), [start(430, 170, -56.3), forward(7.2), turn(-154.7), forward(5.8)]).
turtle_program(r1, midline(209), [start(434, 162, -56.3), forward(3.6)]).
turtle_program(r1, midline(210), [start(228, 510, -153.4), forward(4.5), turn(-71.6), forward(1.4), turn(-90), forward(2.8), turn(90), forward(1.4), turn(-90), forward(1.4), turn(-90), forward(1.4)]).
turtle_program(r1, midline(211), [start(134, 446, 90), forward(1), turn(-45), forward(43.8), turn(-45), forward(1)]).
turtle_program(r1, midline(212), [start(390, 143, -164.1), forward(7.3), turn(23.9), forward(7.8), turn(-79.6), forward(15.6), turn(84.8), forward(15.6)]).
turtle_program(r1, midline(213), [start(377, 138, 140.7), forward(14.2)]).
turtle_program(r1, midline(214), [start(379, 136, -126.9), forward(5), turn(-98.1), forward(15.6), turn(-90), forward(1.4), turn(-90), forward(14.1)]).
turtle_program(r1, midline(215), [start(106, 626, 134.4), forward(64.4)]).
turtle_program(r1, midline(216), [start(160, 541, 135), forward(21.2), turn(45), forward(15), turn(-135), forward(8.5), turn(90), forward(1.4), turn(-90), forward(18.4), turn(90), forward(1.4), turn(87.7), forward(17.7), turn(-106.1), forward(2.2), turn(104), forward(9.2), turn(-166.1), forward(8.6), turn(80.5), forward(1.4), turn(45), forward(1), turn(45), forward(9.9), turn(-63.4), forward(3.2), turn(67.8), forward(27.7), turn(168.5), forward(11.4)]).
turtle_program(r1, midline(217), [start(134, 557, 45), forward(2.8), turn(-45), forward(1), turn(90), forward(2), turn(-45), forward(18.4), turn(56.3), forward(5.1), turn(-146.3), forward(4.2), turn(-56.3), forward(5.1), turn(43.8), forward(13), turn(-15.1), forward(16.8)]).
turtle_program(r1, midline(218), [start(158, 563, 45), forward(18.4), turn(45), forward(1), turn(45), forward(1.4), turn(90), forward(18.4)]).
turtle_program(r1, midline(219), [start(136, 554, -43.4), forward(24.8)]).
turtle_program(r1, midline(220), [start(153, 575, 121), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-76), forward(1.4), turn(-90), forward(5.7), turn(90), forward(1.4), turn(74.7), forward(8.1), turn(105.3), forward(32.5), turn(-71.6), forward(6.7), turn(71.6), forward(9.9)]).
turtle_program(r1, midline(221), [start(159, 561, 45), forward(19.8), turn(45), forward(2), turn(45), forward(4.2), turn(71.6), forward(2.2), turn(18.4), forward(17)]).
turtle_program(r1, midline(222), [start(114, 560, 45), forward(5.7), turn(90), forward(2.8), turn(90), forward(9.9), turn(18.4), forward(6.7), turn(-18.4), forward(14.1), turn(172.9), forward(11.4)]).
turtle_program(r1, midline(223), [start(93, 500, 135), forward(5.7)]).
turtle_program(r1, midline(224), [start(201, 702, -134.6), forward(109.6)]).
turtle_program(r1, midline(225), [start(201, 700, -45), forward(1.4), turn(-90), forward(124.5), turn(5.7), forward(14.2), turn(57.7), forward(6.3), turn(-63.4), forward(17), turn(90), forward(2.8), turn(94.8), forward(17), turn(-68.2), forward(3.2), turn(153.4), forward(4.2), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(90), forward(2.8), turn(-90), forward(1.4), turn(-90), forward(4.2), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(83.7), forward(6.4), turn(-83.7), forward(17), turn(90), forward(2.8), turn(90), forward(15.6), turn(90), forward(1.4), turn(-90), forward(1.4), turn(45), forward(1), turn(-135), forward(5.7), turn(-90), forward(18.4), turn(-71.6), forward(2.2)]).
turtle_program(r1, midline(226), [start(119, 584, -18.4), forward(3.2), turn(-116.6), forward(18.4), turn(-78.7), forward(3.6), turn(78.7), forward(12.7), turn(15.9), forward(10.3)]).
turtle_program(r1, midline(227), [start(353, 184, 90), forward(2)]).
turtle_program(r1, midline(228), [start(236, 538, 135), forward(31.1)]).
turtle_program(r1, midline(229), [start(378, 887, -116.6), forward(8.9), turn(-97.1), forward(7.2), turn(47.7), forward(8.2)]).
turtle_program(r1, midline(230), [start(362, 879, -63.4), forward(2.2), turn(-71.6), forward(2.8), turn(-45), forward(3), turn(-33.7), forward(3.6), turn(27.3), forward(9.1), turn(-38.7), forward(2.8)]).
turtle_program(r1, midline(231), [start(363, 875, -15.3), forward(11.4), turn(105.3), forward(1), turn(-45), forward(4.2), turn(78.7), forward(3.6)]).
turtle_program(r1, midline(232), [start(378, 876, -63.4), forward(2.2), turn(-79.7), forward(5)]).
turtle_program(r1, midline(233), [start(379, 884, -52.1), forward(11.4), turn(-82.9), forward(2.8), turn(-59), forward(4.1)]).
turtle_program(r1, midline(234), [start(384, 872, -50.2), forward(7.8), turn(28.4), forward(10.8)]).
turtle_program(r1, midline(235), [start(368, 884, 78.7), forward(5.1), turn(-114.2), forward(8.6)]).
turtle_program(r1, midline(236), [start(357, 36, 42), forward(13.5), turn(-87), forward(2.8), turn(135), forward(2)]).
turtle_program(r1, midline(237), [start(206, 485, -45), forward(5.7), turn(-104), forward(5.8)]).
turtle_program(r1, midline(238), [start(209, 490, -135), forward(4.2)]).
turtle_program(r1, midline(239), [start(381, 140, 135), forward(18.4)]).
turtle_program(r1, midline(240), [start(215, 494, -74.1), forward(7.3), turn(-66.1), forward(7.8)]).
turtle_program(r1, midline(241), [start(361, 240, 132), forward(13.5)]).
turtle_program(r1, midline(242), [start(75, 490, -47.7), forward(14.9)]).
turtle_program(r1, midline(243), [start(197, 484, 123.7), forward(3.6)]).
turtle_program(r1, midline(244), [start(322, 101, 45), forward(33.9), turn(26.6), forward(3.2), turn(-116.6), forward(2.8)]).
turtle_program(r1, midline(245), [start(93, 482, 126), forward(13.6)]).
turtle_program(r1, midline(246), [start(274, 515, -45), forward(46.7)]).
turtle_program(r1, midline(247), [start(191, 559, 146.3), forward(3.6), turn(80.2), forward(26.2)]).
turtle_program(r1, midline(248), [start(189, 562, 45), forward(1.4), turn(-90), forward(4.2), turn(-45), forward(1), turn(45), forward(2.8), turn(93.6), forward(22.7), turn(-104.9), forward(3.6)]).
turtle_program(r1, midline(249), [start(212, 574, 104), forward(4.1), turn(121), forward(24), turn(-90), forward(4.2), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(108.4), forward(4), turn(-135), forward(2.8)]).
turtle_program(r1, midline(250), [start(78, 495, 135), forward(39.6)]).
turtle_program(r1, midline(251), [start(197, 488, -45), forward(4.2)]).
turtle_program(r1, midline(252), [start(78, 471, -46.2), forward(66.5)]).
turtle_program(r1, midline(253), [start(125, 426, 45), forward(1.4)]).
turtle_program(r1, midline(254), [start(201, 554, -135), forward(8.5)]).
turtle_program(r1, midline(255), [start(350, 138, 45), forward(8.5), turn(-45), forward(2), turn(-45), forward(1.4), turn(-90), forward(9.9)]).
turtle_program(r1, midline(256), [start(359, 145, 36.9), forward(10), turn(-81.9), forward(17)]).
turtle_program(r1, midline(257), [start(213, 485, 135), forward(4.2)]).
turtle_program(r1, midline(258), [start(401, 241, -26.6), forward(6.7), turn(37.9), forward(5.1), turn(118.5), forward(7.8), turn(87.1), forward(5)]).
turtle_program(r1, midline(259), [start(404, 245, 56.3), forward(3.6)]).
turtle_program(r1, midline(260), [start(385, 889, -53.1), forward(5), turn(-95.9), forward(5.8)]).
turtle_program(r1, midline(261), [start(203, 494, 119.7), forward(8.1), turn(-164.7), forward(9.9), turn(90), forward(1.4), turn(81), forward(13.6)]).
turtle_program(r1, midline(262), [start(201, 504, -45), forward(14.1)]).
turtle_program(r1, midline(263), [start(208, 494, -45), forward(1.4)]).
turtle_program(r1, midline(264), [start(134, 570, 45), forward(14.1), turn(71.6), forward(2.2), turn(108.4), forward(15.6), turn(-71.6), forward(4.5), turn(68.2), forward(12)]).
turtle_program(r1, midline(265), [start(266, 526, -48.8), forward(10.6)]).
turtle_program(r1, midline(266), [start(424, 199, -90), forward(1), turn(-45), forward(1.4), turn(-90), forward(1.4), turn(90), forward(1.4), turn(45), forward(1), turn(45), forward(5.7), turn(-135), forward(3), turn(45), forward(7.1)]).
turtle_program(r1, midline(267), [start(426, 192, 50.5), forward(22), turn(136.6), forward(16.1), turn(37.9), forward(8.5), turn(-59), forward(4.1), turn(59), forward(4.2), turn(-85.6), forward(9.2), turn(85.6), forward(5.7)]).
turtle_program(r1, midline(268), [start(415, 203, 29.7), forward(8.1)]).
turtle_program(r1, midline(269), [start(419, 200, -45), forward(2.8)]).
turtle_program(r1, midline(270), [start(425, 190, -50.2), forward(15.6), turn(-66.4), forward(2.2), turn(-108.4), forward(4.2)]).
turtle_program(r1, midline(271), [start(402, 206, 166), forward(8.2), turn(-16.9), forward(23.3)]).
turtle_program(r1, midline(272), [start(425, 194, 90), forward(3)]).
turtle_program(r1, midline(273), [start(153, 570, 42.7), forward(17.7), turn(92.3), forward(8.5), turn(-156.8), forward(5.4), turn(163.9), forward(11.4), turn(82.9), forward(15.6), turn(-90), forward(2.8), turn(90), forward(15.6), turn(-78.7), forward(3.6), turn(33.7), forward(3), turn(45), forward(12.7)]).
turtle_program(r1, midline(274), [start(157, 594, 45), forward(1.4), turn(-90), forward(11.3), turn(172.9), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-163.4), forward(8.6)]).
turtle_program(r1, midline(275), [start(221, 650, 122), forward(9.4), turn(103), forward(87.7), turn(-45), forward(3), turn(43.6), forward(29), turn(-88.6), forward(1.4), turn(90), forward(1.4), turn(-63.4), forward(3.2), turn(63.4), forward(33.9)]).
turtle_program(r1, midline(276), [start(141, 585, -132), forward(13.5)]).
turtle_program(r1, midline(277), [start(638, 534, -47), forward(39.6), turn(-28.9), forward(20.6), turn(-77.5), forward(15.7), turn(-22.5), forward(14), turn(-33.1), forward(10.3), turn(-15.9), forward(19.8)]).
turtle_program(r1, midline(278), [start(670, 484, -60.6), forward(18.4), turn(-15.3), forward(12.4), turn(-20.4), forward(36.2), turn(-11.6), forward(35.7), turn(-9.5), forward(58.6), turn(-18.9), forward(59.4), turn(4.7), forward(24.1), turn(-93.4), forward(5.7), turn(90), forward(11.3), turn(-71.6), forward(2.2), turn(67.2), forward(9.2), turn(-74.3), forward(3.6), turn(64.7), forward(5.8), turn(-76), forward(5.7), turn(101.3), forward(3.6), turn(-46.4), forward(23.3), turn(35.1), forward(29.7), turn(-45), forward(1), turn(45), forward(14.1), turn(-21.8), forward(7.6), turn(19.6), forward(36.8), turn(-21), forward(10.8), turn(25.7), forward(16.3), turn(-100.6), forward(5), turn(-81.9), forward(18.4), turn(83.7), forward(6.4), turn(-32.3), forward(9.1), turn(34.3), forward(18.4), turn(24.4), forward(16.6)]).
turtle_program(r1, midline(279), [start(549, 270, 77.5), forward(9.2), turn(25.5), forward(13.3), turn(122), forward(15.6), turn(39.3), forward(10), turn(-39.3), forward(8.5)]).
turtle_program(r1, midline(280), [start(433, 229, 45), forward(9.9), turn(90), forward(2.8), turn(85.6), forward(9.2)]).
turtle_program(r1, midline(281), [start(552, 275, 45), forward(9.9), turn(-66.8), forward(5.4), turn(-110.9), forward(17.7)]).
turtle_program(r1, midline(282), [start(606, 298, -26.6), forward(2.2), turn(-117.9), forward(17.2), turn(9.5), forward(1.4), turn(45), forward(1), turn(-45), forward(15.6), turn(101.3), forward(3.6), turn(-56.3), forward(4), turn(-45), forward(22.6), turn(-78.7), forward(7.2), turn(67.4), forward(14.4), turn(-78.7), forward(21.2)]).
turtle_program(r1, midline(283), [start(436, 186, -54.5), forward(8.6), turn(-80.5), forward(12.7)]).
turtle_program(r1, midline(284), [start(437, 224, 48.4), forward(12), turn(86.6), forward(2.8), turn(90), forward(11.3)]).
turtle_program(r1, midline(285), [start(446, 233, -56.3), forward(3.6), turn(-78.7), forward(12.7)]).
turtle_program(r1, midline(286), [start(551, 247, -135), forward(1.4), turn(-90), forward(24)]).
turtle_program(r1, midline(287), [start(542, 264, -47.5), forward(16.3)]).
turtle_program(r1, midline(288), [start(436, 190, 51.8), forward(17.8)]).
turtle_program(r1, midline(289), [start(565, 281, 116.6), forward(4.5), turn(97.1), forward(3.6)]).
turtle_program(r1, midline(290), [start(599, 292, -135), forward(5.7)]).
turtle_program(r1, midline(291), [start(641, 333, -134.1), forward(47.4), turn(70.7), forward(4.5), turn(-71.6), forward(8.5), turn(-71.6), forward(2.2), turn(62.1), forward(8.6), turn(27.9), forward(2.2), turn(-18.4), forward(12.7), turn(63.4), forward(3.2)]).
turtle_program(r1, midline(292), [start(558, 269, 45), forward(9.9), turn(90), forward(1.4), turn(-90), forward(1.4), turn(-90), forward(2.8), turn(-86.2), forward(10.6)]).
turtle_program(r1, midline(293), [start(550, 245, -143.1), forward(5), turn(-36.9), forward(5), turn(36.9), forward(5), turn(-81.9), forward(1.4), turn(45), forward(2), turn(45), forward(5.7), turn(-90), forward(1.4), turn(90), forward(9.9), turn(45), forward(3), turn(-45), forward(26.9), turn(-71.6), forward(2.2), turn(56.3), forward(8.1), turn(86.8), forward(13.4), turn(-105.3), forward(5.1), turn(33.7), forward(8.5), turn(-60.3), forward(11.4), turn(41.8), forward(8.9), turn(-71.6), forward(21.2), turn(78.7), forward(3.6), turn(-142.1), forward(3.2)]).
turtle_program(r1, midline(294), [start(535, 238, -45), forward(4.2), turn(-78.7), forward(3.6), turn(-101.3), forward(5.7), turn(-161.6), forward(4.5)]).
turtle_program(r1, midline(295), [start(539, 239, -90), forward(3)]).
turtle_program(r1, midline(296), [start(527, 237, 141.3), forward(6.4), turn(128.7), forward(9)]).
turtle_program(r1, midline(297), [start(564, 257, 135), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-98.1), forward(10), turn(-171.9), forward(8.5)]).
turtle_program(r1, midline(298), [start(563, 259, 135), forward(9.9)]).
turtle_program(r1, midline(299), [start(558, 251, -68.2), forward(5.4), turn(-72), forward(7.8), turn(-61.6), forward(5.4)]).
turtle_program(r1, midline(300), [start(520, 227, -138.2), forward(25.5), turn(-86.8), forward(1.4), turn(90), forward(4.2), turn(-45), forward(2), turn(45), forward(2.8), turn(-98.1), forward(10), turn(98.1), forward(14.1), turn(-115), forward(11.7)]).
turtle_program(r1, midline(301), [start(475, 215, 45), forward(15.6), turn(-90), forward(1.4), turn(-45), forward(2), turn(-45), forward(15.6)]).
turtle_program(r1, midline(302), [start(580, 278, 45), forward(11.3), turn(71.6), forward(2.2), turn(101.7), forward(24.2), turn(-83.3), forward(1.4), turn(-90), forward(2.8), turn(90), forward(4.2), turn(-146.3), forward(5.1), turn(146.3), forward(5.7)]).
turtle_program(r1, midline(303), [start(586, 288, 173.7), forward(9.1), turn(65.4), forward(5.8), turn(-99.6), forward(9.2), turn(79.3), forward(6.4), turn(-81.4), forward(17.7), turn(87.7), forward(17), turn(-45), forward(3), turn(45), forward(22.6), turn(-85.2), forward(17), turn(37.5), forward(21), turn(40.6), forward(11.4), turn(-62.9), forward(16.6), turn(58.7), forward(3.6), turn(-31), forward(21), turn(66.7), forward(8.5), turn(-63.1), forward(9.1), turn(38.7), forward(4.2), turn(-66.8), forward(5.4), turn(66.8), forward(15.6), turn(78.7), forward(3.6), turn(46), forward(11.2), turn(-46), forward(3.6), turn(-50.4), forward(10.4)]).
turtle_program(r1, midline(304), [start(475, 274, -126.9), forward(5), turn(-35.5), forward(23.1), turn(-22.8), forward(11), turn(30.7), forward(23.3)]).
turtle_program(r1, midline(305), [start(430, 261, 135), forward(9.9)]).
turtle_program(r1, midline(306), [start(566, 291, 136.8), forward(21.9), turn(87.3), forward(47.4), turn(177), forward(21.3), turn(-14.6), forward(4.5), turn(-71.6), forward(1.4), turn(94.8), forward(17), turn(-92.6), forward(19.1), turn(175.8), forward(19.1), turn(-69.4), forward(2.2), turn(-108.4), forward(19.8)]).
turtle_program(r1, midline(307), [start(535, 285, -135), forward(55.2), turn(-88.6), forward(29), turn(116.9), forward(31.3), turn(-29.6), forward(31.8), turn(64.7), forward(3.2)]).
turtle_program(r1, midline(308), [start(462, 234, -135), forward(11.3), turn(-45), forward(1), turn(45), forward(14.1), turn(-108.4), forward(4.5), turn(-135), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-108.4), forward(4), turn(135), forward(2.8), turn(-90), forward(1.4), turn(71.6), forward(2.2)]).
turtle_program(r1, midline(309), [start(459, 233, -135), forward(8.5), turn(-71.6), forward(2.2), turn(-126.9), forward(2.2), turn(108.4), forward(1.4)]).
turtle_program(r1, midline(310), [start(421, 266, -96.3), forward(9.1)]).
turtle_program(r1, midline(311), [start(514, 274, 45), forward(25.5), turn(135), forward(3), turn(45), forward(22.6)]).
turtle_program(r1, midline(312), [start(434, 270, -51.3), forward(6.4)]).
turtle_program(r1, midline(313), [start(497, 245, -45), forward(2.8), turn(-90), forward(12.7), turn(-90), forward(25.5)]).
turtle_program(r1, midline(314), [start(492, 234, -135), forward(2.8)]).
turtle_program(r1, midline(315), [start(500, 242, 45), forward(7.1), turn(45), forward(2), turn(45), forward(1.4), turn(90), forward(7.1)]).
turtle_program(r1, midline(316), [start(486, 220, -90), forward(1), turn(-45), forward(12.7)]).
turtle_program(r1, midline(317), [start(531, 262, -45), forward(24)]).
turtle_program(r1, midline(318), [start(642, 331, -135), forward(45.3), turn(176.3), forward(43.9), turn(-175.4), forward(46), turn(75.1), forward(5.8), turn(-81.7), forward(14.2), turn(-48.8), forward(6.1), turn(54.5), forward(12.7), turn(-173.7), forward(12.8)]).
turtle_program(r1, midline(319), [start(644, 326, -135), forward(43.8), turn(71.6), forward(4.5)]).
turtle_program(r1, midline(320), [start(607, 287, 135), forward(2.8)]).
turtle_program(r1, midline(321), [start(490, 211, 0), forward(3), turn(104), forward(4.1), turn(66.5), forward(6.1), turn(54.5), forward(11.3)]).
turtle_program(r1, midline(322), [start(494, 211, -26.6), forward(2.2), turn(-119.7), forward(3.6)]).
turtle_program(r1, midline(323), [start(494, 213, 45), forward(4.2), turn(90), forward(2.8), turn(90), forward(2.8), turn(-90), forward(1.4), turn(-90), forward(2.8), turn(101.3), forward(7.2)]).
turtle_program(r1, midline(324), [start(560, 285, 140.2), forward(15.6), turn(90), forward(15.6)]).
turtle_program(r1, midline(325), [start(569, 270, -126.9), forward(5), turn(-26.6), forward(2.2), turn(-116.6), forward(2)]).
turtle_program(r1, midline(326), [start(479, 190, 104), forward(8.2), turn(76), forward(16), turn(45), forward(1.4), turn(-90), forward(7.1)]).
turtle_program(r1, midline(327), [start(461, 196, -45), forward(12.7)]).
turtle_program(r1, midline(328), [start(490, 217, 63.4), forward(2.2)]).
turtle_program(r1, midline(329), [start(493, 222, 45), forward(7.1), turn(96.3), forward(6.4)]).
turtle_program(r1, midline(330), [start(556, 250, -116.6), forward(2.2), turn(-63.4), forward(2)]).
turtle_program(r1, midline(331), [start(555, 240, -33.7), forward(3.6), turn(-56.3), forward(2), turn(-45), forward(8.5), turn(45), forward(1), turn(-45), forward(19.8), turn(-81.9), forward(5), turn(81.9), forward(14.1), turn(-13), forward(9.4), turn(29.7), forward(14.8), turn(-109.4), forward(14.9), turn(-28.2), forward(4.1)]).
turtle_program(r1, midline(332), [start(514, 203, 111.8), forward(5.4), turn(106.9), forward(12.8)]).
turtle_program(r1, midline(333), [start(506, 201, -50.2), forward(7.8)]).
turtle_program(r1, midline(334), [start(512, 209, 123.7), forward(3.6), turn(97.9), forward(12)]).
turtle_program(r1, midline(335), [start(512, 211, 45), forward(18.4), turn(108.4), forward(2.2), turn(71.6), forward(17), turn(-45), forward(1)]).
turtle_program(r1, midline(336), [start(526, 223, -45), forward(1.4), turn(-90), forward(18.4)]).
turtle_program(r1, midline(337), [start(528, 222, -63.4), forward(2.2), turn(-71.6), forward(18.4), turn(-45), forward(1)]).
turtle_program(r1, midline(338), [start(505, 204, 135), forward(1.4)]).
turtle_program(r1, midline(339), [start(512, 191, -63.4), forward(2.2), turn(-98.1), forward(6.3), turn(-58.2), forward(7.8)]).
turtle_program(r1, midline(340), [start(512, 187, -46.4), forward(58), turn(-177.9), forward(60.1)]).
turtle_program(r1, midline(341), [start(533, 292, 46.8), forward(21.9), turn(176.2), forward(20.5), turn(-43), forward(2), turn(-42.3), forward(14.9), turn(76), forward(3.6), turn(-78.7), forward(21.2), turn(71.6), forward(2.2), turn(-71.6), forward(4.2), turn(93.4), forward(12), turn(31.1), forward(27.5)]).
turtle_program(r1, midline(342), [start(550, 308, 45), forward(9.9), turn(62.4), forward(16.8), turn(31), forward(12), turn(51.6), forward(17.3), turn(23.7), forward(18), turn(-26.6), forward(8.1), turn(37.9), forward(7.1)]).
turtle_program(r1, midline(343), [start(528, 334, -84.3), forward(10), turn(-44.4), forward(12.8), turn(-96.3), forward(8.5), turn(84.8), forward(7.8), turn(-84.8), forward(2.8), turn(45), forward(3)]).
turtle_program(r1, midline(344), [start(530, 323, -45), forward(2.8), turn(-45), forward(2), turn(-104), forward(4.1)]).
turtle_program(r1, midline(345), [start(496, 316, -43.5), forward(26.2), turn(-75.9), forward(18.4)]).
turtle_program(r1, midline(346), [start(506, 315, -39.8), forward(15.6), turn(168.5), forward(12.8)]).
turtle_program(r1, midline(347), [start(517, 301, -135), forward(1.4), turn(-90), forward(21.2)]).
turtle_program(r1, midline(348), [start(523, 336, 159.4), forward(8.5), turn(65.6), forward(4.2), turn(66.8), forward(5.4)]).
turtle_program(r1, midline(349), [start(556, 319, 46.8), forward(21.9), turn(99.5), forward(7.2), turn(58.5), forward(14.3), turn(-157.7), forward(19.1), turn(114.4), forward(6.3), turn(63.4), forward(15.6), turn(-128.7), forward(9.1), turn(38.7), forward(8.5), turn(26.6), forward(6.3), turn(63.4), forward(4.2), turn(84.8), forward(15.6)]).
turtle_program(r1, midline(350), [start(560, 350, 45), forward(4.2), turn(71.6), forward(2.2), turn(108.4), forward(18.4)]).
turtle_program(r1, midline(351), [start(558, 314, -18.4), forward(6.3), turn(90), forward(3.2), turn(-120.4), forward(10.6), turn(96.8), forward(13.5), turn(-36.7), forward(5.1), turn(-101.3), forward(3), turn(-47.7), forward(14.9), turn(-68.8), forward(2.2)]).
turtle_program(r1, midline(352), [start(561, 315, 43.2), forward(21.9), turn(103.2), forward(3.6), turn(75.1), forward(22.7), turn(-176.4), forward(24)]).
turtle_program(r1, midline(353), [start(576, 304, -90), forward(14)]).
turtle_program(r1, midline(354), [start(566, 340, 18.4), forward(3.2), turn(116.6), forward(1.4), turn(-90), forward(1.4), turn(45), forward(1), turn(63.4), forward(2.2), turn(71.6), forward(8.5)]).
turtle_program(r1, midline(355), [start(570, 342, -26.6), forward(2.2), turn(-108.4), forward(2.8)]).
turtle_program(r1, midline(356), [start(564, 353, -45), forward(1.4), turn(-45), forward(1), turn(-45), forward(1.4)]).
turtle_program(r1, midline(357), [start(511, 318, 116.6), forward(2.2), turn(108.4), forward(2.8)]).
turtle_program(r1, midline(358), [start(514, 321, 135), forward(2.8), turn(108.4), forward(2.2)]).
turtle_program(r1, midline(359), [start(510, 324, 45), forward(1.4)]).
turtle_program(r1, midline(360), [start(518, 228, 180), forward(1), turn(45), forward(14.1), turn(-21), forward(9.8), turn(21), forward(2.8), turn(90), forward(1.4), turn(71.6), forward(2.2)]).
turtle_program(r1, midline(361), [start(600, 284, 63.4), forward(4.5)]).
turtle_program(r1, midline(362), [start(488, 228, -135), forward(1.4)]).
turtle_program(r1, midline(363), [start(477, 203, -76), forward(4.1)]).
turtle_program(r1, midline(364), [start(442, 235, 135), forward(1.4)]).
turtle_program(r1, midline(365), [start(513, 317, -45), forward(11.3), turn(-59), forward(4.1)]).
turtle_program(r1, midline(366), [start(455, 231, -135), forward(1.4)]).
turtle_program(r1, midline(367), [start(533, 219, 146.3), forward(3.6)]).
turtle_program(r1, midline(368), [start(610, 285, -63.4), forward(6.7), turn(-45), forward(3.2), turn(-26.6), forward(2.8), turn(-53.1), forward(7.1), turn(51.7), forward(58), turn(-99.9), forward(7.2), turn(-83.9), forward(7.8), turn(-148.2), forward(6.3), turn(158.6), forward(7.8), turn(80.4), forward(9.2)]).
turtle_program(r1, midline(369), [start(602, 275, 135), forward(1.4), turn(90), forward(43.8)]).
turtle_program(r1, midline(370), [start(613, 275, -45), forward(7.1), turn(-90), forward(1.4), turn(-45), forward(1), turn(45), forward(5.7), turn(-90), forward(5.7), turn(90), forward(9.9), turn(-45), forward(10), turn(45), forward(39.6), turn(-45), forward(1), turn(45), forward(2.8), turn(-26.6), forward(3.2), turn(26.6), forward(4.2), turn(-45), forward(1), turn(45), forward(19.8), turn(63.4), forward(3.2), turn(-63.4), forward(9.9), turn(-45), forward(7), turn(26.6), forward(11.2)]).
turtle_program(r1, midline(371), [start(570, 247, 90), forward(4), turn(-135), forward(2.8)]).
turtle_program(r1, midline(372), [start(556, 232, -135), forward(4.2)]).
turtle_program(r1, midline(373), [start(552, 144, -71.6), forward(3.2), turn(-74.7), forward(3.6), turn(-78.7), forward(53.7), turn(90), forward(1.4), turn(45), forward(2), turn(-45), forward(1.4), turn(-90), forward(8.5), turn(82.9), forward(22.8), turn(-103.9), forward(9.8), turn(21), forward(7.1), turn(-45), forward(6), turn(-139.1), forward(19.8)]).
turtle_program(r1, midline(374), [start(511, 173, -45), forward(56.6), turn(135), forward(5), turn(-135), forward(2.8)]).
turtle_program(r1, midline(375), [start(501, 173, -45), forward(69.3), turn(-45), forward(3), turn(-90), forward(1), turn(-45), forward(70.7), turn(-45), forward(1)]).
turtle_program(r1, midline(376), [start(498, 174, 149), forward(5.8), turn(57.5), forward(4.5), turn(-71.6), forward(17)]).
turtle_program(r1, midline(377), [start(496, 176, 135), forward(5.7)]).
turtle_program(r1, midline(378), [start(490, 174, -90), forward(1)]).
turtle_program(r1, midline(379), [start(494, 179, 45), forward(1.4), turn(90), forward(7.1), turn(-90), forward(1.4), turn(-84.8), forward(7.8), turn(-95.2), forward(1.4)]).
turtle_program(r1, midline(380), [start(567, 346, 135), forward(1.4)]).
turtle_program(r1, midline(381), [start(474, 267, 90), forward(3)]).
turtle_program(r1, midline(382), [start(562, 356, 129.8), forward(7.8), turn(76.8), forward(4.5), turn(-71.6), forward(8.5), turn(71.6), forward(2.2), turn(-45), forward(3.2), turn(63.4), forward(2.8), turn(31), forward(8.2)]).
turtle_program(r1, midline(383), [start(557, 363, 71.6), forward(3.2), turn(63.4), forward(7.1), turn(83.7), forward(6.4), turn(107.7), forward(7.2), turn(168.7), forward(5.7)]).
turtle_program(r1, midline(384), [start(542, 364, -104), forward(4.1), turn(59), forward(9.9), turn(-59), forward(4.1)]).
turtle_program(r1, midline(385), [start(544, 363, -40.6), forward(9.2), turn(-94.4), forward(2.8), turn(-90), forward(8.5)]).
turtle_program(r1, midline(386), [start(558, 367, 56.3), forward(3.6), turn(78.7), forward(7.1), turn(101.3), forward(3.6)]).
turtle_program(r1, midline(387), [start(555, 376, 21.8), forward(5.4)]).
turtle_program(r1, midline(388), [start(561, 376, -101.3), forward(5.1)]).
turtle_program(r1, midline(389), [start(539, 264, -47.1), forward(19.1)]).
turtle_program(r1, midline(390), [start(557, 254, 126.9), forward(15), turn(-166.7), forward(15.6)]).
turtle_program(r1, midline(391), [start(561, 265, -51.3), forward(12.8), turn(96.3), forward(14.1), turn(90), forward(1.4), turn(86.6), forward(12)]).
turtle_program(r1, midline(392), [start(567, 260, 45), forward(1.4), turn(90), forward(4.2)]).
turtle_program(r1, midline(393), [start(568, 262, 56.3), forward(3.6), turn(78.7), forward(2.8)]).
turtle_program(r1, midline(394), [start(575, 266, 180), forward(4)]).
turtle_program(r1, midline(395), [start(511, 178, 123.7), forward(7.2), turn(101.3), forward(4.2), turn(-45), forward(6)]).
turtle_program(r1, midline(396), [start(507, 185, 90), forward(1)]).
turtle_program(r1, midline(397), [start(555, 234, 123.7), forward(7.2)]).
turtle_program(r1, midline(398), [start(488, 165, -113.7), forward(27.3), turn(-136.9), forward(39.2), turn(70.6), forward(12), turn(-33.7), forward(7.2), turn(60.3), forward(4.5)]).
turtle_program(r1, midline(399), [start(446, 182, 79.4), forward(16.3), turn(-124.4), forward(24), turn(-78.7), forward(3.6)]).
turtle_program(r1, midline(400), [start(450, 194, -45), forward(19.8)]).
turtle_program(r1, midline(401), [start(553, 243, 38.7), forward(6.4)]).
turtle_program(r1, midline(402), [start(490, 189, -135), forward(1.4)]).
turtle_program(r1, midline(403), [start(614, 288, 26.6), forward(2.2), turn(-63.4), forward(5), turn(-90), forward(10), turn(81.9), forward(8.5), turn(-90), forward(1.4), turn(45), forward(1), turn(45), forward(11.3), turn(-141.3), forward(9.1), turn(46.9), forward(9.2), turn(-85.6), forward(8.5), turn(-90), forward(1.4), turn(-90), forward(7.1), turn(90), forward(1.4), turn(90), forward(7.1), turn(-90), forward(1.4), turn(-90), forward(7.1), turn(135), forward(3), turn(-45), forward(2.8), turn(-90), forward(2.8), turn(90), forward(1.4), turn(90), forward(2.8), turn(-108.4), forward(2.2), turn(-71.6), forward(5.7)]).
turtle_program(r1, midline(404), [start(612, 256, -126.9), forward(5), turn(-98.1), forward(4.2), turn(45), forward(1), turn(45), forward(1.4), turn(-99.5), forward(8.6), turn(-170.5), forward(7.1)]).
turtle_program(r1, midline(405), [start(621, 271, -45), forward(12.7), turn(-108.4), forward(2.2)]).
turtle_program(r1, midline(406), [start(631, 261, -38.7), forward(6.4), turn(128.7), forward(2)]).
turtle_program(r1, midline(407), [start(638, 259, -51.3), forward(6.4), turn(29.5), forward(5.4), turn(66.8), forward(2.8), turn(119.1), forward(7.3)]).
turtle_program(r1, midline(408), [start(642, 258, -153.4), forward(2.2)]).
turtle_program(r1, midline(409), [start(620, 288, 42.9), forward(38.2), turn(-176.8), forward(38.9)]).
turtle_program(r1, midline(410), [start(649, 312, -75.3), forward(19.6), turn(-14.7), forward(13), turn(-63.4), forward(4.5), turn(-26.6), forward(34)]).
turtle_program(r1, midline(411), [start(654, 278, -95.6), forward(51.2), turn(-127.9), forward(27.6), turn(62), forward(3.2), turn(-42.9), forward(12.1), turn(33.9), forward(6.1), turn(-54.5), forward(5.7)]).
turtle_program(r1, midline(412), [start(627, 244, -45), forward(28.3), turn(-91), forward(40.3), turn(-44), forward(1), turn(42.5), forward(16.3), turn(3.5), forward(79.2), turn(-91), forward(66.5)]).
turtle_program(r1, midline(413), [start(609, 248, -135), forward(4.2), turn(-87.9), forward(19.1), turn(87.9), forward(25.5), turn(-2.5), forward(16.3), turn(-42.5), forward(1), turn(45), forward(5.7), turn(-45), forward(1), turn(45), forward(21.2), turn(64.7), forward(29.7), turn(-33.7), forward(4.1), turn(30.7), forward(10.4), turn(-16.7), forward(12), turn(-45), forward(2.8), turn(-90), forward(46.7), turn(71.6), forward(2.2), turn(-71.6), forward(2.8), turn(-135), forward(2)]).
turtle_program(r1, midline(414), [start(606, 247, 135), forward(18.4), turn(90), forward(1.4)]).
turtle_program(r1, midline(415), [start(517, 185, -45.8), forward(53), turn(92.6), forward(45.3), turn(-80.5), forward(3.6), turn(-99.7), forward(49.5)]).
turtle_program(r1, midline(416), [start(610, 246, -45), forward(33.9), turn(-92.9), forward(28.3), turn(2.9), forward(33.9), turn(-101.3), forward(3.6), turn(56.3), forward(3), turn(45), forward(43.8), turn(-108.4), forward(2.2), turn(-72.5), forward(44.6), turn(90.9), forward(1.4), turn(45), forward(1), turn(45), forward(39.6)]).
turtle_program(r1, midline(417), [start(556, 144, 45), forward(45.3), turn(-71.6), forward(2.2), turn(-108.4), forward(50.9), turn(177.6), forward(50.2), turn(58.7), forward(5.1), turn(-56.3), forward(15.6), turn(-71.6), forward(2.2), turn(-103.2), forward(15.6), turn(169.6), forward(15.6), turn(5.2), forward(15.6), turn(78.7), forward(3.6), turn(82.9), forward(2.2), turn(18.4), forward(12.7)]).
turtle_program(r1, midline(418), [start(547, 198, 116.6), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(127.9), forward(5.1), turn(-146.3), forward(4.2), turn(18.4), forward(2.2), turn(-105.3), forward(25.5)]).
turtle_program(r1, midline(419), [start(554, 159, 45), forward(39.6), turn(108.4), forward(2.2), turn(71.6), forward(36.8)]).
turtle_program(r1, midline(420), [start(554, 167, 45), forward(35.4), turn(78.7), forward(3.6), turn(101.3), forward(33.9)]).
turtle_program(r1, midline(421), [start(579, 195, 45), forward(1.4), turn(90), forward(1.4), turn(59), forward(4.1), turn(31), forward(31.1)]).
turtle_program(r1, midline(422), [start(552, 178, 47.6), forward(31.1), turn(105.8), forward(2.2), turn(71.6), forward(26.9), turn(-90), forward(1.4), turn(-90), forward(28.3), turn(45), forward(1), turn(45), forward(1.4), turn(90), forward(26.9), turn(-90), forward(1.4), turn(-90), forward(26.9), turn(45), forward(1), turn(45), forward(1.4), turn(86.8), forward(25.5), turn(-176.8), forward(25.5), turn(71.6), forward(2.2), turn(108.4), forward(22.6)]).
turtle_program(r1, midline(423), [start(541, 212, 49.1), forward(19.8), turn(-75.7), forward(2.2), turn(71.6), forward(1.4), turn(45), forward(2), turn(-68.2), forward(5.4), turn(23.2), forward(14.1)]).
turtle_program(r1, midline(424), [start(632, 221, 135), forward(33.9), turn(84.8), forward(7.8), turn(-84.8), forward(11.3), turn(91), forward(38.9), turn(-91), forward(1.4), turn(90), forward(5.7), turn(-101.3), forward(3.6), turn(101.3), forward(21.2), turn(-90), forward(2.8), turn(-94.1), forward(19.8), turn(94.1), forward(1.4), turn(-90), forward(1.4), turn(71.6), forward(2.2), turn(108.4), forward(19.8)]).
turtle_program(r1, midline(425), [start(558, 224, 45), forward(2.8), turn(-71.6), forward(2.2), turn(-100.3), forward(5)]).
turtle_program(r1, midline(426), [start(594, 245, -45), forward(9.9), turn(-88.7), forward(30.4), turn(-8.5), forward(11.4), turn(-37.9), forward(1), turn(-45), forward(2.8), turn(-90), forward(1.4), turn(90), forward(1.4), turn(45), forward(1), turn(-36.9), forward(5)]).
turtle_program(r1, midline(427), [start(594, 233, -137), forward(20.5), turn(-88), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(90), forward(2.8), turn(-90), forward(1.4), turn(78.7), forward(7.2), turn(-78.7), forward(2.8), turn(-90), forward(2.8)]).
turtle_program(r1, midline(428), [start(579, 221, 41.6), forward(12), turn(119.9), forward(3.2), turn(63.4), forward(12.7), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(81.9), forward(5)]).
turtle_program(r1, midline(429), [start(571, 222, 45), forward(5.7), turn(-116.6), forward(3.2)]).
turtle_program(r1, midline(430), [start(607, 243, -56.3), forward(7.2), turn(-105.3), forward(3.2), turn(-63.4), forward(5.7)]).
turtle_program(r1, midline(431), [start(612, 237, -43.3), forward(23.3), turn(-92.5), forward(55.9), turn(-173.6), forward(14.2), turn(65.9), forward(2.2), turn(108.4), forward(15.6), turn(-90), forward(4.2)]).
turtle_program(r1, midline(432), [start(627, 220, 135), forward(21.2), turn(45), forward(1), turn(45), forward(5.7), turn(-45), forward(2), turn(45), forward(1.4), turn(-104), forward(5.8), turn(-166), forward(4.2)]).
turtle_program(r1, midline(433), [start(611, 233, -45), forward(18.4), turn(-90), forward(35.4)]).
turtle_program(r1, midline(434), [start(608, 234, -153.4), forward(2.2), turn(-82.9), forward(7.2)]).
turtle_program(r1, midline(435), [start(606, 235, 135), forward(2.8)]).
turtle_program(r1, midline(436), [start(611, 205, 45), forward(19.8)]).
turtle_program(r1, midline(437), [start(609, 232, -47.3), forward(17.7), turn(-87.7), forward(17), turn(-45), forward(1), turn(43.7), forward(30.4)]).
turtle_program(r1, midline(438), [start(614, 204, 45), forward(22.6)]).
turtle_program(r1, midline(439), [start(579, 218, 180), forward(2), turn(45), forward(9.9)]).
turtle_program(r1, midline(440), [start(574, 217, -135), forward(5.7), turn(-135), forward(2)]).
turtle_program(r1, midline(441), [start(590, 231, -135), forward(1.4)]).
turtle_program(r1, midline(442), [start(521, 311, 90), forward(2)]).
turtle_program(r1, midline(443), [start(553, 359, -135), forward(1.4)]).
turtle_program(r1, midline(444), [start(524, 263, 116.6), forward(2.2), turn(106.7), forward(23.3)]).
turtle_program(r1, midline(445), [start(579, 267, 14), forward(4.1)]).
turtle_program(r1, midline(446), [start(495, 220, 45), forward(7.1), turn(71.6), forward(2.2)]).
turtle_program(r1, midline(447), [start(553, 176, 45), forward(31.1), turn(63.4), forward(3.2), turn(-135), forward(4.5), turn(-126.9), forward(2.2)]).
turtle_program(r1, midline(448), [start(612, 248, -45), forward(36.8), turn(-92.6), forward(31.1)]).
turtle_program(r1, midline(449), [start(599, 281, -134), forward(38.9), turn(89), forward(2.8), turn(90), forward(35.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(45), forward(1)]).
turtle_program(r1, midline(450), [start(490, 177, 135), forward(14.1)]).
turtle_program(r1, midline(451), [start(639, 221, 18.4), forward(3.2)]).
turtle_program(r1, midline(452), [start(574, 336, 135), forward(1.4), turn(45), forward(1)]).
turtle_program(r1, midline(453), [start(71, 492, 140.2), forward(15.6), turn(-5.2), forward(21.2)]).
turtle_program(r1, midline(454), [start(378, 127, -170.5), forward(6.1), turn(-58.9), forward(9.2)]).
turtle_program(r1, midline(455), [start(403, 267, 60.3), forward(8.1), turn(48.2), forward(3.2), turn(55.6), forward(7.3), turn(49.6), forward(7.2), turn(-77.6), forward(36.1), turn(-109.6), forward(2.2), turn(-71.6), forward(24)]).
turtle_program(r1, midline(456), [start(370, 302, 15.9), forward(7.3), turn(27.4), forward(24.8)]).
turtle_program(r1, midline(457), [start(378, 303, -43.3), forward(23.3), turn(-82.3), forward(8.6), turn(80.5), forward(4.2), turn(90), forward(1.4), turn(90), forward(2.8), turn(-90), forward(1.4), turn(-90), forward(4.2), turn(-90), forward(1.4)]).
turtle_program(r1, midline(458), [start(392, 292, 90), forward(1), turn(47.7), forward(14.9)]).
turtle_program(r1, midline(459), [start(408, 273, -45), forward(5.7), turn(63.4), forward(3.2), turn(114.9), forward(24.8), turn(73.2), forward(2.2), turn(100.3), forward(5), turn(-81.9), forward(4.2), turn(-90), forward(2.8), turn(-90), forward(2.8)]).
turtle_program(r1, midline(460), [start(408, 279, 66.8), forward(7.6), turn(82.2), forward(11.7), turn(76), forward(4.2)]).
turtle_program(r1, midline(461), [start(411, 288, 45), forward(8.5), turn(90), forward(7.1), turn(31), forward(4.1), turn(47.7), forward(7.2), turn(-78.7), forward(7.1), turn(90), forward(2.8), turn(-78.7), forward(3.6), turn(78.7), forward(4.2), turn(-90), forward(5.7)]).
turtle_program(r1, midline(462), [start(402, 295, -116.6), forward(2.2), turn(-108.4), forward(7.1)]).
turtle_program(r1, midline(463), [start(390, 301, 161.6), forward(3.2)]).
turtle_program(r1, midline(464), [start(399, 292, 135), forward(4.2), turn(63.4), forward(3.2), turn(-63.4), forward(4.2), turn(-153.4), forward(3.2), turn(126.9), forward(3.2)]).
turtle_program(r1, midline(465), [start(397, 279, 45), forward(4.2)]).
turtle_program(r1, midline(466), [start(420, 192, 156.8), forward(7.6), turn(41.6), forward(3.2), turn(-47.5), forward(10.3)]).
turtle_program(r1, midline(467), [start(410, 197, 45), forward(1.4)]).
turtle_program(r1, midline(468), [start(179, 856, -56.3), forward(3.6), turn(74.7), forward(3.2), turn(90), forward(3.2), turn(-135), forward(2.2), turn(-49.4), forward(4.1), turn(-59), forward(93.3)]).
turtle_program(r1, midline(469), [start(187, 853, 26.6), forward(2.2), turn(108.4), forward(4.2), turn(-108.4), forward(2.2), turn(-71.6), forward(4.2), turn(116.6), forward(3.2), turn(-57.5), forward(4.1), turn(-140.9), forward(5)]).
turtle_program(r1, midline(470), [start(574, 338, 135), forward(1.4)]).
turtle_program(r1, midline(471), [start(561, 237, 53.1), forward(10)]).
turtle_program(r1, midline(472), [start(464, 196, -45), forward(12.7)]).
turtle_program(r1, midline(473), [start(459, 283, 144.5), forward(17.2), turn(80.5), forward(15.6), turn(-8.1), forward(15), turn(-86.3), forward(9.2), turn(38.1), forward(5.1)]).
turtle_program(r1, midline(474), [start(422, 276, 45), forward(12.7), turn(45), forward(2), turn(45), forward(1.4), turn(90), forward(14.1), turn(-90), forward(4.2), turn(-135), forward(4), turn(135), forward(2.8), turn(-82.9), forward(11.4), turn(107.3), forward(8.5)]).
turtle_program(r1, midline(475), [start(444, 293, 153.4), forward(2.2), turn(71.6), forward(14.1)]).
turtle_program(r1, midline(476), [start(423, 272, -90), forward(1)]).
turtle_program(r1, midline(477), [start(434, 281, -63.4), forward(2.2)]).
turtle_program(r1, midline(478), [start(432, 288, 45), forward(9.9), turn(-45), forward(3)]).
turtle_program(r1, midline(479), [start(585, 290, 54.5), forward(8.6), turn(95.3), forward(13.9), turn(-104.7), forward(12.7), turn(-71.6), forward(4.5), turn(-111.8), forward(12)]).
turtle_program(r1, midline(480), [start(585, 302, -26.6), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-71.6), forward(1.4), turn(-90), forward(4.2), turn(90), forward(1.4), turn(90), forward(4.2), turn(-78.7), forward(3.6), turn(78.7), forward(2.8), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-108.4), forward(4), turn(135), forward(4.2), turn(88.5), forward(26.2), turn(-174.9), forward(22.7), turn(104.9), forward(2.2), turn(71.6), forward(19.8), turn(-175.6), forward(18.4), turn(104), forward(2.2), turn(71.6), forward(18.4), turn(-90), forward(4.2), turn(90), forward(17)]).
turtle_program(r1, midline(481), [start(585, 322, 45), forward(14.1), turn(71.6), forward(2.2), turn(108.4), forward(15.6), turn(-90), forward(2.8), turn(90), forward(18.4)]).
turtle_program(r1, midline(482), [start(592, 334, -135), forward(12.7)]).
turtle_program(r1, midline(483), [start(590, 334, 180), forward(3), turn(45), forward(9.9), turn(-45), forward(1), turn(45), forward(17), turn(-90), forward(1.4), turn(-90), forward(17), turn(45), forward(1), turn(-135), forward(1.4), turn(90), forward(1.4), turn(90), forward(5.7), turn(-153.4), forward(6.3), turn(153.4), forward(4.2)]).
turtle_program(r1, midline(484), [start(586, 335, -135), forward(4.2), turn(-90), forward(2.8)]).
turtle_program(r1, midline(485), [start(583, 334, 45), forward(1.4)]).
turtle_program(r1, midline(486), [start(610, 332, -45), forward(2.8), turn(59), forward(4.1), turn(-149), forward(32.5), turn(76), forward(5.8), turn(-76), forward(7.1), turn(78.7), forward(3.6), turn(-73.5), forward(7.8)]).
turtle_program(r1, midline(487), [start(452, 137, -2.3), forward(25), turn(-24.9), forward(81), turn(-41.8), forward(13.9), turn(-71.2), forward(7.8)]).
turtle_program(r1, midline(488), [start(478, 137, 116.6), forward(2.2)]).
turtle_program(r1, midline(489), [start(498, 215, 108.4), forward(3.2), turn(-63.4), forward(1.4), turn(-90), forward(2.8), turn(153.4), forward(3.2), turn(-108.4), forward(4), turn(111.8), forward(5.4)]).
turtle_program(r1, midline(490), [start(538, 232, -104), forward(4.1), turn(-121), forward(9.9)]).
turtle_program(r1, midline(491), [start(538, 227, -104), forward(8.2)]).
turtle_program(r1, midline(492), [start(449, 136, 135), forward(22.6), turn(35.5), forward(6.1), turn(-35.5), forward(11.3)]).
turtle_program(r1, midline(493), [start(544, 265, -47.5), forward(16.3)]).
turtle_program(r1, midline(494), [start(15, 567, -45), forward(12.7)]).
turtle_program(r1, midline(495), [start(568, 314, 45), forward(17)]).
turtle_program(r1, midline(496), [start(522, 266, 153.4), forward(2.2)]).
turtle_program(r1, midline(497), [start(239, 625, 140.7), forward(14.2), turn(84.3), forward(77.8), turn(-90), forward(4.2), turn(90), forward(2.8), turn(-108.4), forward(4.5), turn(-71.6), forward(1.4), turn(-90), forward(2.8), turn(135), forward(4), turn(-146.3), forward(7.2), turn(127.9), forward(3.2), turn(49.4), forward(5.8), turn(-177.3), forward(7.2)]).
turtle_program(r1, midline(498), [start(649, 226, -104), forward(4.1), turn(-31), forward(38.2), turn(45), forward(1), turn(-45), forward(99), turn(90), forward(2.8), turn(-90), forward(4.2), turn(38.7), forward(18.1)]).
turtle_program(r1, midline(499), [start(595, 169, 135), forward(1.4), turn(90.7), forward(61.5)]).
turtle_program(r1, midline(500), [start(552, 119, 45), forward(4.2), turn(90), forward(2.8), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-63.4), forward(1.4), turn(-63.4), forward(3.2), turn(153.4), forward(2.8), turn(-90), forward(1.4), turn(-90), forward(4.2), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(70.7)]).
turtle_program(r1, midline(501), [start(550, 103, 45), forward(4.2), turn(71.6), forward(4.5), turn(-161.6), forward(4.2), turn(90), forward(2.8), turn(90), forward(4.2), turn(-161.6), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-127.9), forward(5.1), turn(146.3), forward(4.2), turn(-90), forward(1.4), turn(-90), forward(5.7), turn(-45), forward(1), turn(-45), forward(79.2), turn(179), forward(80.6), turn(-89), forward(1.4), turn(-45), forward(1), turn(-44), forward(82), turn(179), forward(83.4), turn(90), forward(12.7), turn(-90), forward(1.4), turn(45), forward(2), turn(45), forward(5.7), turn(180), forward(12.7), turn(146.3), forward(5.1), turn(33.7), forward(8.5), turn(180), forward(12.7), turn(116.6), forward(3.2), turn(56.3), forward(11.4), turn(-179.2), forward(12.8)]).
turtle_program(r1, midline(502), [start(553, 131, 45), forward(58), turn(-90), forward(1.4), turn(45), forward(1), turn(45), forward(17), turn(108.4), forward(2.2), turn(71.6), forward(15.6)]).
turtle_program(r1, midline(503), [start(605, 277, 146.3), forward(3.6), turn(78.7), forward(2.8)]).
turtle_program(r1, midline(504), [start(522, 242, 96.3), forward(9.1), turn(128.7), forward(31.1), turn(-166), forward(11.7), turn(121), forward(1), turn(45), forward(11.3), turn(-90), forward(1.4), turn(-90), forward(15.6), turn(-45), forward(1), turn(-45), forward(1.4), turn(-90), forward(2.8), turn(90), forward(1.4), turn(90), forward(2.8), turn(45), forward(1), turn(-47.1), forward(19.1), turn(47.1), forward(4), turn(135), forward(21.2), turn(-90), forward(1.4)]).
turtle_program(r1, midline(505), [start(524, 260, -43.2), forward(21.9), turn(-73.4), forward(2.2), turn(-36.9), forward(4.5), turn(-71.6), forward(1.4), turn(90), forward(1.4), turn(-90), forward(15.6), turn(-174.3), forward(14.2), turn(168.6), forward(14.2)]).
turtle_program(r1, midline(506), [start(507, 236, -53.1), forward(5), turn(-81.9), forward(9.9), turn(59), forward(4.1), turn(57.5), forward(3.2), turn(63.4), forward(12.7), turn(108.4), forward(2.2), turn(71.6), forward(11.3), turn(-116.6), forward(3.2), turn(-63.4), forward(9.9), turn(-90), forward(1.4)]).
turtle_program(r1, midline(507), [start(538, 244, 135), forward(18.4)]).
turtle_program(r1, midline(508), [start(320, 482, 75.1), forward(31), turn(34.6), forward(14.9)]).
turtle_program(r1, midline(509), [start(329, 512, 15.6), forward(26), turn(-10.9), forward(36.1)]).
turtle_program(r1, midline(510), [start(387, 874, 18.4), forward(3.2), turn(-55.3), forward(10)]).
turtle_program(r1, midline(511), [start(402, 298, 135), forward(4.2)]).
turtle_program(r1, midline(512), [start(224, 642, -135), forward(73.5), turn(90), forward(7.1), turn(166), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(139.4), forward(6.3), turn(-153.4), forward(5.7)]).
turtle_program(r1, midline(513), [start(226, 638, 135), forward(2.8)]).
turtle_program(r1, midline(514), [start(130, 578, 45), forward(12.7), turn(108.4), forward(2.2), turn(71.6), forward(12.7), turn(-45), forward(3), turn(45), forward(15.6), turn(-59), forward(4.1), turn(63.8), forward(34.1)]).
turtle_program(r1, midline(515), [start(112, 570, 47.3), forward(17.7), turn(87.7), forward(17), turn(-63.4), forward(3.2), turn(49.4), forward(5.8), turn(-166), forward(7.1), turn(-63.4), forward(3.2), turn(63.4), forward(17), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4)]).
turtle_program(r1, midline(516), [start(127, 582, 126), forward(27.2), turn(-162.9), forward(10), turn(-71.6), forward(3.2), turn(63.4), forward(15.6), turn(174.3), forward(14.2), turn(-57.7), forward(3.2), turn(63.4), forward(11.3), turn(180), forward(26.9), turn(-180), forward(11.3), turn(-63.4), forward(3.2), turn(63.4), forward(14.1), turn(-71.6), forward(2.2), turn(-18.4), forward(14.1), turn(45), forward(1), turn(-45), forward(107.5), turn(-108.4), forward(2.2), turn(-71.6), forward(107.5), turn(2.7), forward(14.9), turn(87.3), forward(8.5), turn(71.6), forward(2.2), turn(-109.4), forward(8.1), turn(37.9), forward(9.9), turn(170.5), forward(8.6), turn(-54), forward(3.2), turn(63.4), forward(4.2), turn(-45), forward(5), turn(-149), forward(11.7), turn(-94.4), forward(2.2), turn(108.4), forward(2.8), turn(108.4), forward(2.2), turn(-153.4), forward(3), turn(68.2), forward(5.4), turn(149.7), forward(11.4), turn(-19.4), forward(9.5), turn(-153.4), forward(7.1), turn(-45), forward(4), turn(45), forward(7.1), turn(-26.6), forward(6.3), turn(116.6), forward(2.8), turn(71.6), forward(4.5), turn(9.7), forward(18.6), turn(-163.1), forward(10), turn(-31.3), forward(10.8), turn(23.2), forward(2.8), turn(116.6), forward(3.2), turn(52.1), forward(21.6), turn(-168.7), forward(12.7), turn(-23.2), forward(10.8)]).
turtle_program(r1, midline(517), [start(122, 605, 50.2), forward(15.6), turn(84.8), forward(1.4), turn(84.8), forward(15.6), turn(-174.8), forward(14.1)]).
turtle_program(r1, midline(518), [start(314, 482, 180), forward(4), turn(-45), forward(48.1), turn(-178.3), forward(46.7), turn(176.5), forward(46.7)]).
turtle_program(r1, midline(519), [start(436, 177, 0), forward(1)]).
turtle_program(r1, midline(520), [start(368, 210, 135), forward(4.2), turn(90), forward(4.2)]).
turtle_program(r1, midline(521), [start(532, 318, -48.4), forward(12), turn(-124.9), forward(17.1)]).
turtle_program(r1, midline(522), [start(541, 309, -45), forward(2.8), turn(-92.5), forward(16.3)]).
turtle_program(r1, midline(523), [start(452, 176, -90), forward(7), turn(-32), forward(18.9)]).
turtle_program(r1, midline(524), [start(447, 159, -116.6), forward(6.7), turn(71.6), forward(2.8), turn(-63.4), forward(3.2)]).
turtle_program(r1, midline(525), [start(575, 283, -126.9), forward(5), turn(-101.9), forward(10.6)]).
turtle_program(r1, midline(526), [start(572, 281, 45), forward(1.4)]).
turtle_program(r1, midline(527), [start(217, 659, -135.9), forward(87.7), turn(-62.5), forward(3.2), turn(63.4), forward(5.7), turn(-90), forward(5.7), turn(-45), forward(4), turn(45), forward(14.1), turn(-90), forward(1.4), turn(45), forward(3), turn(53.1), forward(5), turn(-98.1), forward(2.8), turn(-90), forward(2.8), turn(153.4), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(108.4), forward(4), turn(-143.1), forward(5), turn(-81.9), forward(99), turn(90), forward(1.4), turn(-90), forward(1.4), turn(90), forward(2.8), turn(-108.4), forward(2.2)]).
turtle_program(r1, midline(528), [start(204, 692, 135), forward(1.4)]).
turtle_program(r1, midline(529), [start(212, 528, -45), forward(17)]).
turtle_program(r1, midline(530), [start(212, 583, 90), forward(5), turn(135), forward(36.8), turn(90), forward(1.4)]).
turtle_program(r1, midline(531), [start(213, 589, -137.2), forward(36.8), turn(-69.4), forward(4.5), turn(71.6), forward(2.8), turn(-63.4), forward(3.2), turn(63.4), forward(19.8)]).
turtle_program(r1, midline(532), [start(175, 565, 45), forward(1.4), turn(59), forward(8.2), turn(-25.3), forward(5.1), turn(-123.7), forward(2.8), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(90), forward(2.8), turn(-56.3), forward(5.1), turn(101.3), forward(4), turn(135), forward(2.8), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(63.4), forward(9.5), turn(-153.4), forward(5.7), turn(-90), forward(1.4), turn(71.6), forward(4.5), turn(-71.6), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(90), forward(4.2), turn(90), forward(1.4), turn(90), forward(2.8), turn(-45), forward(8), turn(33.7), forward(7.2), turn(-168.7), forward(8.5), turn(-39.8), forward(11)]).
turtle_program(r1, midline(533), [start(546, 244, 166), forward(4.1), turn(-32.8), forward(21.9), turn(-174.3), forward(21.3)]).
turtle_program(r1, midline(534), [start(234, 507, 135), forward(4.2)]).
turtle_program(r1, midline(535), [start(206, 687, -135), forward(97.6), turn(63.4), forward(3.2), turn(116.6), forward(97.6), turn(-108.4), forward(2.2), turn(-71.6), forward(100.4), turn(90), forward(11.3), turn(-90), forward(1.4), turn(63.4), forward(3.2), turn(53.1), forward(3.2), turn(153.4), forward(1.4), turn(-90), forward(1.4), turn(90), forward(2.8), turn(-90), forward(1.4), turn(82.9), forward(11.4), turn(-172.9), forward(12.7), turn(-45), forward(4)]).
turtle_program(r1, midline(536), [start(472, 218, 110.6), forward(17.1), turn(113), forward(29), turn(175.7), forward(14.2)]).
turtle_program(r1, midline(537), [start(544, 308, 0), forward(1)]).
turtle_program(r1, midline(538), [start(554, 164, 45), forward(36.8), turn(45), forward(1), turn(-121), forward(5.8), turn(76), forward(12.7), turn(45), forward(3), turn(129.3), forward(14.2)]).
turtle_program(r1, midline(539), [start(374, 196, 123.7), forward(3.6), turn(-123.7), forward(5), turn(135), forward(7.1), turn(-90), forward(1.4), turn(-90), forward(7.1)]).
turtle_program(r1, midline(540), [start(165, 853, 0), forward(4), turn(90), forward(2)]).
turtle_program(r1, midline(541), [start(424, 177, 63.4), forward(2.2), turn(-108.4), forward(4.2)]).
turtle_program(r1, midline(542), [start(382, 142, 135), forward(18.4)]).
turtle_program(r1, midline(543), [start(227, 631, -135), forward(66.5), turn(90), forward(9.9), turn(-45), forward(8), turn(108.4), forward(3.2), turn(79.7), forward(7.1), turn(28.7), forward(10), turn(-171.9), forward(11.3), turn(-45), forward(6)]).
turtle_program(r1, midline(544), [start(225, 627, -135), forward(58), turn(90), forward(12.7), turn(-45), forward(4), turn(153.4), forward(4.5), turn(71.6), forward(12.7), turn(180), forward(14.1)]).
turtle_program(r1, midline(545), [start(224, 624, -135), forward(50.9), turn(90), forward(14.1), turn(173.7), forward(12.8), turn(-167.3), forward(12.8), turn(167.3), forward(12.8), turn(-167.3), forward(12.8), turn(167.3), forward(12.8), turn(-167.3), forward(12.8), turn(167.3), forward(12.8), turn(-167.3), forward(12.8), turn(167.3), forward(12.8), turn(-167.3), forward(12.8), turn(167.3), forward(12.8), turn(-167.3), forward(12.8), turn(161.1), forward(13), turn(-167.5), forward(14.1), turn(168.7), forward(14.4), turn(-168.7), forward(12.7)]).
turtle_program(r1, midline(546), [start(223, 621, -135), forward(24), turn(90), forward(11.3), turn(171.9), forward(10), turn(-162.4), forward(8.6)]).
turtle_program(r1, midline(547), [start(221, 617, -135), forward(15.6), turn(90), forward(7.1), turn(166), forward(5.8), turn(-147.5), forward(4.5), turn(143.1), forward(4.5), turn(-135), forward(3.2), turn(126.9), forward(3.2), turn(-63.4), forward(5.7)]).
turtle_program(r1, midline(548), [start(16, 569, -45), forward(33.9)]).
turtle_program(r1, midline(549), [start(648, 316, 153.4), forward(2.2), turn(69.5), forward(39.6), turn(-177), forward(41.7), turn(177), forward(39.6), turn(-88), forward(2.8), turn(-92), forward(41)]).
turtle_program(r1, midline(550), [start(377, 203, 135), forward(4.2)]).
turtle_program(r1, midline(551), [start(376, 206, -45), forward(1.4)]).
turtle_program(r1, midline(552), [start(617, 332, -132.5), forward(32.6), turn(177.5), forward(35.4), turn(-59), forward(4.1), turn(-121), forward(38.2), turn(98.1), forward(5), turn(-98.1), forward(9.9), turn(18.4), forward(8.9)]).
turtle_program(r1, midline(553), [start(599, 305, 45), forward(38.2), turn(90), forward(2.8)]).
turtle_program(r1, midline(554), [start(626, 334, -14), forward(4.1), turn(-119), forward(41), turn(178), forward(42.4), turn(90), forward(2.8)]).
turtle_program(r1, midline(555), [start(632, 335, -21.8), forward(5.4), turn(-113.2), forward(46.7), turn(-71.6), forward(2.2)]).
turtle_program(r1, midline(556), [start(427, 292, -63.4), forward(2.2), turn(-71.6), forward(9.9), turn(171.9), forward(10)]).
turtle_program(r1, midline(557), [start(554, 89, 45), forward(87.7), turn(108.4), forward(2.2), turn(70.6), forward(84.9), turn(-179), forward(83.4), turn(45), forward(3), turn(-50.7), forward(14.2), turn(64.7), forward(4.1), turn(121), forward(15.6), turn(-90), forward(2.8), turn(-95.7), forward(14.2), turn(84.4), forward(3.6), turn(101.3), forward(5.7), turn(-90), forward(12.7), turn(-172.9), forward(11.4), turn(165.7), forward(11.4), turn(-158.8), forward(11.7), turn(166), forward(11.3)]).
turtle_program(r1, midline(558), [start(624, 165, 53.7), forward(18.6), turn(166.5), forward(17), turn(-85.2), forward(5.7), turn(-161.6), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-127.9), forward(5.1), turn(146.3), forward(4.2), turn(-90), forward(1.4), turn(45), forward(1), turn(45), forward(2.8), turn(45), forward(4), turn(45), forward(14.1)]).
turtle_program(r1, midline(559), [start(622, 188, 18.4), forward(3.2), turn(116.6), forward(4.2), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(-90), forward(2.8), turn(-90), forward(1.4), turn(90), forward(4.2), turn(-90), forward(1.4)]).
turtle_program(r1, midline(560), [start(90, 498, 134.1), forward(47.4), turn(-176), forward(25.5)]).
turtle_program(r1, midline(561), [start(523, 248, -90), forward(4), turn(45), forward(8.5), turn(161.6), forward(8.9)]).
turtle_program(r1, midline(562), [start(531, 238, 123.7), forward(7.2)]).
turtle_program(r1, midline(563), [start(467, 181, 45), forward(1.4), turn(90), forward(21.2), turn(-172.4), forward(21.4)]).
turtle_program(r1, midline(564), [start(513, 178, -45), forward(52.3)]).
turtle_program(r1, midline(565), [start(640, 144, -105.9), forward(7.3), turn(-119.1), forward(14.1), turn(45), forward(3), turn(45), forward(89.1), turn(-59), forward(4.1), turn(-19.7), forward(3.6), turn(-101.3), forward(87.7), turn(56.3), forward(5.1), turn(-56.3), forward(32.5), turn(90), forward(4.2), turn(-153.4), forward(3.2), turn(63.4), forward(1.4), turn(90), forward(2.8), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(108.4), forward(4), turn(-143.1), forward(5), turn(-81.9), forward(28.3), turn(90), forward(2.8), turn(-92.5), forward(32.6)]).
turtle_program(r1, midline(566), [start(563, 84, -18.4), forward(3.2), turn(63.9), forward(87)]).
turtle_program(r1, midline(567), [start(661, 196, -135), forward(26.9), turn(71.6), forward(4.5), turn(-71.6), forward(121.6)]).
turtle_program(r1, midline(568), [start(659, 201, 123.7), forward(3.6), turn(101.3), forward(31.1), turn(-26.6), forward(3.2), turn(-63.4), forward(2.8), turn(-63.4), forward(3.2), turn(-143.1), forward(3.2)]).
turtle_program(r1, midline(569), [start(629, 148, 48.4), forward(12), turn(68.2), forward(2.2), turn(111.2), forward(14.9)]).
turtle_program(r1, midline(570), [start(631, 162, -137.5), forward(16.3)]).
turtle_program(r1, midline(571), [start(624, 148, 135), forward(1.4), turn(90.5), forward(88.4)]).
turtle_program(r1, midline(572), [start(624, 150, 47.3), forward(17.7), turn(-105.3), forward(9.4), turn(-37.7), forward(10)]).
turtle_program(r1, midline(573), [start(567, 82, -12.2), forward(37.9), turn(-12.8), forward(16.6), turn(56.3), forward(32.8), turn(15), forward(31.8), turn(26), forward(26.2), turn(17.7), forward(10), turn(28.6), forward(12.5), turn(100), forward(12.8), turn(-80.6), forward(13.5), turn(29.5), forward(9.2), turn(-122.5), forward(12.7), turn(78.7), forward(3.6), turn(101.3), forward(12.7), turn(-104), forward(5.8), turn(-147.5), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-71.6), forward(1.4), turn(-71.6), forward(4.5), turn(161.6), forward(4.2), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(90), forward(2.8), turn(-90), forward(1.4), turn(-90), forward(4.2), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(90), forward(7.1), turn(90), forward(1.4), turn(90), forward(5.7), turn(-63.4), forward(3.2), turn(49.4), forward(5.8), turn(-166), forward(7.1), turn(-63.4), forward(3.2), turn(81.9), forward(4.5), turn(143.1), forward(13.4), turn(-161.6), forward(9.9), turn(-63.4), forward(3.2), turn(126.9), forward(3.2), turn(104), forward(13), turn(-173.8), forward(12.8)]).
turtle_program(r1, midline(574), [start(671, 154, 116.6), forward(2.2), turn(59.9), forward(16), turn(48.6), forward(2.8)]).
turtle_program(r1, midline(575), [start(654, 158, 108.4), forward(6.3), turn(-108.4), forward(3), turn(45), forward(18.4), turn(71.6), forward(2.2), turn(108.4), forward(18.4)]).
turtle_program(r1, midline(576), [start(667, 180, -146.3), forward(7.2), turn(-78.7), forward(12.7), turn(-172.9), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-165.7), forward(11.4), turn(165.7), forward(11.4), turn(-163.4), forward(8.6)]).
turtle_program(r1, midline(577), [start(655, 162, 42.7), forward(17.7), turn(-106.1), forward(6.7), turn(-26.6), forward(11)]).
turtle_program(r1, midline(578), [start(669, 175, 90), forward(1)]).
turtle_program(r1, midline(579), [start(662, 144, -135), forward(17), turn(-20.6), forward(12.1), turn(31.9), forward(14.4), turn(-11.3), forward(52.3)]).
turtle_program(r1, midline(580), [start(639, 136, -90), forward(8)]).
turtle_program(r1, midline(581), [start(664, 189, 135), forward(5.7), turn(-135), forward(2)]).
turtle_program(r1, midline(582), [start(603, 262, -45), forward(1.4)]).
turtle_program(r1, midline(583), [start(208, 672, -135), forward(89.1), turn(-90), forward(5.7), turn(-161.6), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(127.9), forward(5.1), turn(-157.6), forward(7.2), turn(-78.7), forward(90.5), turn(90), forward(7.1), turn(-90), forward(1.4), turn(90), forward(2.8), turn(90), forward(1.4), turn(45), forward(2), turn(33.7), forward(7.2), turn(-168.7), forward(8.5), turn(-63.4), forward(3.2)]).
turtle_program(r1, midline(584), [start(210, 676, 135), forward(4.2), turn(-135), forward(2)]).
turtle_program(r1, midline(585), [start(211, 673, -134.1), forward(87.7), turn(80.9), forward(10)]).
turtle_program(r1, midline(586), [start(646, 201, -135), forward(19.8), turn(90), forward(4.2), turn(153.4), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-108.4), forward(4), turn(135), forward(4.2), turn(-161.6), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-127.9), forward(5.1), turn(146.3), forward(4.2), turn(-71.6), forward(2.2), turn(159.2), forward(34), turn(-87.6), forward(1.4), turn(-90), forward(1.4), turn(90), forward(4.2), turn(-90), forward(1.4), turn(90), forward(4.2), turn(180), forward(8.5), turn(116.6), forward(3.2), turn(52.1), forward(7.2), turn(-178.2), forward(8.6)]).
turtle_program(r1, midline(587), [start(656, 207, 135), forward(1.4)]).
turtle_program(r1, midline(588), [start(170, 622, -135), forward(21.2), turn(-90), forward(4.2), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(108.4), forward(4), turn(-149), forward(5.8), turn(-76), forward(22.6), turn(90), forward(2.8), turn(90), forward(24), turn(80.5), forward(8.6), turn(-170.5), forward(8.5), turn(90), forward(2.8), turn(90), forward(8.5), turn(-170.5), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-161.1), forward(8.6), turn(161.1), forward(8.6), turn(-152.1), forward(4.5)]).
turtle_program(r1, midline(589), [start(213, 669, 135), forward(1.4)]).
turtle_program(r1, midline(590), [start(600, 206, -135), forward(7.1), turn(59), forward(4.1), turn(151.9), forward(4.1), turn(-45), forward(5.8), turn(77.5), forward(3.2), turn(-153.4), forward(2.8)]).
turtle_program(r1, midline(591), [start(219, 514, -45), forward(1.4)]).
turtle_program(r1, midline(592), [start(210, 527, -45), forward(17)]).
turtle_program(r1, midline(593), [start(607, 222, 135), forward(5.7), turn(90), forward(11.3), turn(-90), forward(1.4), turn(90), forward(1.4), turn(-90), forward(7.1), turn(118.3), forward(10.4), turn(-110.2), forward(5), turn(78.9), forward(13.5), turn(104.3), forward(3.6), turn(-119.7), forward(2.2), turn(108.4), forward(1.4), turn(45), forward(2), turn(-45), forward(1.4), turn(90), forward(4.2), turn(59), forward(4.1), turn(102.5), forward(4.5), turn(-161.6), forward(2.8)]).
turtle_program(r1, midline(594), [start(593, 217, -45), forward(4.2), turn(-71.6), forward(2.2), turn(-112.2), forward(10.6)]).
turtle_program(r1, midline(595), [start(599, 220, -135), forward(4.2), turn(71.6), forward(2.2)]).
turtle_program(r1, midline(596), [start(586, 212, -71.6), forward(6.3), turn(-63.4), forward(11.3), turn(171.9), forward(10), turn(-63.4), forward(2.2), turn(-102.7), forward(14.2), turn(171.8), forward(16.3), turn(26.9), forward(8.5)]).
turtle_program(r1, midline(597), [start(580, 206, -26.6), forward(2.2), turn(-94.4), forward(5.8), turn(177.3), forward(7.2)]).
turtle_program(r1, midline(598), [start(390, 880, -63.4), forward(4.5)]).
turtle_program(r1, midline(599), [start(390, 881, 90), forward(3)]).
turtle_program(r1, midline(600), [start(599, 249, -135), forward(2.8), turn(-90), forward(4.2), turn(71.6), forward(2.2), turn(16.5), forward(41), turn(148.3), forward(5.1), turn(36), forward(17.7)]).
turtle_program(r1, midline(601), [start(563, 224, 108.4), forward(3.2), turn(-63.4), forward(1.4), turn(-90), forward(2.8), turn(153.4), forward(3.2), turn(-126.9), forward(3.2), turn(63.4), forward(1.4), turn(90), forward(2.8), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-108.4), forward(4), turn(135), forward(2.8), turn(-161.6), forward(4.5), turn(71.6), forward(19.8), turn(-18.4), forward(2.2), turn(108.4), forward(2.8), turn(90), forward(21.2), turn(-90), forward(1.4), turn(-90), forward(22.6), turn(-90), forward(7.1)]).
turtle_program(r1, midline(602), [start(603, 209, -45), forward(2.8), turn(90), forward(1.4), turn(90), forward(2.8), turn(-90), forward(1.4), turn(45), forward(1), turn(-146.3), forward(3.6), turn(146.3), forward(1), turn(-45), forward(1.4), turn(90), forward(2.8), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-108.4), forward(4), turn(121), forward(5.8), turn(59), forward(7), turn(-45), forward(1.4), turn(-71.6), forward(2.2), turn(-63.4), forward(1), turn(-45), forward(2.8)]).
turtle_program(r1, midline(603), [start(608, 208, 45), forward(14.1), turn(108.4), forward(2.2), turn(71.6), forward(4.2), turn(-90), forward(7.1)]).
turtle_program(r1, midline(604), [start(619, 219, 140.2), forward(15.6), turn(53.8), forward(4.1), turn(31), forward(11.3), turn(-78.7), forward(7.2), turn(-172.9), forward(4.5), turn(127.9), forward(5.1), turn(-160.3), forward(5.8)]).
turtle_program(r1, midline(605), [start(608, 230, -45), forward(11.3)]).
turtle_program(r1, midline(606), [start(614, 219, 135), forward(8.5)]).
turtle_program(r1, midline(607), [start(644, 210, -135), forward(18.4), turn(-90), forward(4.2), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(108.4), forward(4), turn(-149), forward(5.8), turn(-76), forward(19.8), turn(90), forward(2.8), turn(90), forward(21.2), turn(80.5), forward(8.6), turn(-170.5), forward(8.5), turn(90), forward(2.8), turn(90), forward(8.5), turn(-170.5), forward(8.6)]).
turtle_program(r1, midline(608), [start(651, 217, 135), forward(4.2), turn(-135), forward(2)]).
turtle_program(r1, midline(609), [start(612, 271, -161.6), forward(3.2), turn(-135), forward(4.5), turn(-108.4), forward(4.2), turn(-71.6), forward(4.5), turn(161.6), forward(4.2)]).
turtle_program(r1, midline(610), [start(583, 230, -135), forward(7.1), turn(-90), forward(2.8), turn(-90), forward(7.1), turn(-63.4), forward(3.2)]).
turtle_program(r1, midline(611), [start(482, 231, 135), forward(17), turn(-171.9), forward(15), turn(-8.1), forward(4.2), turn(-108.4), forward(2.2)]).
turtle_program(r1, midline(612), [start(486, 230, -135), forward(1.4)]).
turtle_program(r1, midline(613), [start(608, 185, 39.3), forward(14.2)]).
turtle_program(r1, midline(614), [start(206, 480, 135), forward(4.2), turn(-161.6), forward(4.5)]).
turtle_program(r1, midline(615), [start(601, 228, -135), forward(5.7), turn(-90), forward(5.7), turn(-161.6), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(127.9), forward(5.1), turn(-146.3), forward(5.7)]).
turtle_program(r1, midline(616), [start(602, 242, 135), forward(5.7), turn(-166), forward(5.8), turn(151.9), forward(5.8)]).
turtle_program(r1, midline(617), [start(151, 590, -144.5), forward(8.6), turn(-170.5), forward(14.1)]).
turtle_program(r1, midline(618), [start(449, 202, 0), forward(1)]).
turtle_program(r1, midline(619), [start(611, 252, -90), forward(1)]).
turtle_program(r3438, midline(1), [start(400, 404, 54.5), forward(8.6), turn(21.5), forward(12.4), turn(-22.8), forward(5), turn(15.1), forward(10.8), turn(73.1), forward(6.4), turn(-58.5), forward(16.1), turn(-47.3), forward(8.6), turn(-125.5), forward(15), turn(-26.6), forward(8.9)]).
turtle_program(r3438, midline(2), [start(536, 432, -153.4), forward(6.7), turn(-26.6), forward(8), turn(-20.2), forward(20.2), turn(31.5), forward(5.1), turn(-56.3), forward(41), turn(90), forward(2.8), turn(-90), forward(26.9), turn(94.4), forward(9.2), turn(-49.4), forward(9), turn(19.7), forward(14.9), turn(-42.3), forward(13), turn(-16), forward(12.8), turn(38.7), forward(7), turn(-41.6), forward(12), turn(-27.8), forward(8.5), turn(-65.6), forward(8.5), turn(-45), forward(7), turn(101.3), forward(5.1), turn(-31.9), forward(8.5), turn(-24.4), forward(35.4), turn(96.3), forward(19.2), turn(-13.5), forward(11.4), turn(64.2), forward(28.6), turn(-28.8), forward(10.4), turn(-43.6), forward(8.1), turn(-48.2), forward(3.2), turn(-143.1), forward(3.2)]).
turtle_program(r3438, midline(3), [start(443, 473, -45), forward(4.2), turn(-31.6), forward(21.6), turn(-21.8), forward(27.3), turn(-10.6), forward(30.7), turn(-8.4), forward(30.4), turn(-7.8), forward(20.8), turn(-9.8), forward(28.3), turn(-25.3), forward(14.9)]).
turtle_program(r3438, midline(4), [start(429, 375, -45), forward(15.6), turn(-101.3), forward(3.6), turn(-78.7), forward(14.1), turn(-90), forward(1.4), turn(-90), forward(12.7)]).
turtle_program(r3438, midline(5), [start(419, 468, -90), forward(4)]).
turtle_program(r3438, midline(6), [start(432, 475, 135), forward(28.3), turn(45), forward(3), turn(47.5), forward(16.3), turn(-129.9), forward(15.1), turn(31.1), forward(6.4)]).
turtle_program(r3438, midline(7), [start(411, 493, -46.5), forward(26.2)]).
turtle_program(r3438, midline(8), [start(407, 495, 146.3), forward(7.2), turn(47.7), forward(4.1)]).
turtle_program(r3438, midline(9), [start(441, 363, -45), forward(26.9), turn(-95.2), forward(7.8), turn(-19.2), forward(8.5), turn(-39), forward(3.2), turn(48.5), forward(22), turn(-20.6), forward(6.1), turn(30.3), forward(23.4)]).
turtle_program(r3438, midline(10), [start(417, 325, 144.5), forward(8.6), turn(52.6), forward(13.6)]).
turtle_program(r3438, midline(11), [start(399, 500, 45), forward(21.2), turn(-108.4), forward(2.2), turn(-71.6), forward(18.4), turn(90), forward(1.4), turn(90), forward(12.7), turn(-116.6), forward(3.2), turn(-67.2), forward(10.6)]).
turtle_program(r3438, midline(12), [start(441, 365, 63.4), forward(2.2), turn(71.6), forward(15.6), turn(-90), forward(1.4), turn(-87.3), forward(14.9), turn(-47.7), forward(4), turn(42), forward(26.9)]).
turtle_program(r3438, midline(13), [start(500, 437, 90), forward(3), turn(47.5), forward(32.6), turn(-2.5), forward(33.9), turn(98.1), forward(5), turn(85), forward(25.5), turn(176.8), forward(24)]).
turtle_program(r3438, midline(14), [start(415, 516, 80.5), forward(6.1), turn(144.5), forward(29.7)]).
turtle_program(r3438, midline(15), [start(468, 461, -45), forward(41), turn(-63.4), forward(3.2), turn(-116.6), forward(69.3)]).
turtle_program(r3438, midline(16), [start(496, 428, -135), forward(1.4), turn(-88.8), forward(69.3)]).
turtle_program(r3438, midline(17), [start(394, 503, 45), forward(32.5), turn(-121), forward(4.1)]).
turtle_program(r3438, midline(18), [start(437, 334, 135), forward(18.4), turn(86.2), forward(10.6), turn(-86.2), forward(8.5), turn(-158.2), forward(7.6), turn(158.2), forward(7.1), turn(-45), forward(2)]).
turtle_program(r3438, midline(19), [start(416, 339, -126.9), forward(5), turn(36.9), forward(5)]).
turtle_program(r3438, midline(20), [start(414, 348, -45), forward(5.7)]).
turtle_program(r3438, midline(21), [start(425, 348, -42.9), forward(19.1)]).
turtle_program(r3438, midline(22), [start(423, 344, -45), forward(15.6)]).
turtle_program(r3438, midline(23), [start(399, 849, 99.5), forward(6.1), turn(-54.5), forward(1.4), turn(-71.6), forward(2.2), turn(-77.5), forward(4.1)]).
turtle_program(r3438, midline(24), [start(396, 564, 93.9), forward(29.1), turn(131.1), forward(14.1), turn(-28.6), forward(17.7), turn(28.6), forward(12.7), turn(-90), forward(2.8), turn(-99.5), forward(8.6), turn(126), forward(9.5), turn(-26.6), forward(7.1), turn(-10.1), forward(52.4), turn(-14.3), forward(8.5), turn(-39), forward(6.3), turn(45), forward(13.4), turn(-47.1), forward(8.5), turn(-24.4), forward(11.3), turn(-18.4), forward(8.9), turn(-116.6), forward(30), turn(-80.5), forward(12.2)]).
turtle_program(r3438, midline(25), [start(337, 603, 43), forward(20.5), turn(92), forward(2.8), turn(90), forward(21.2)]).
turtle_program(r3438, midline(26), [start(353, 617, -131.2), forward(21.3), turn(86.2), forward(1.4), turn(90), forward(1.4), turn(-45), forward(1), turn(-45), forward(1.4), turn(-90), forward(2.8), turn(90), forward(1.4), turn(90), forward(4.2), turn(90), forward(2.8), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-108.4), forward(4), turn(116.6), forward(4.5)]).
turtle_program(r3438, midline(27), [start(344, 592, 45), forward(28.3), turn(108.4), forward(2.2), turn(71.6), forward(26.9)]).
turtle_program(r3438, midline(28), [start(402, 852, -56.3), forward(10.8), turn(-70.6), forward(5), turn(72.4), forward(8.6), turn(117.9), forward(2.2), turn(71.6), forward(1.4), turn(-90), forward(1.4), turn(-90), forward(2.8), turn(-45), forward(1), turn(-45), forward(2.8), turn(45), forward(1), turn(39.8), forward(7.8), turn(-84.8), forward(1.4), turn(90), forward(2.8), turn(121), forward(4.1), turn(-121), forward(2.8), turn(-78.7), forward(3.6), turn(33.7), forward(2), turn(33.7), forward(7.2), turn(11.3), forward(2.8), turn(108.4), forward(2.2), turn(71.6), forward(1.4), turn(-116.6), forward(3.2), turn(105.3), forward(3.6), turn(74.7), forward(3.2), turn(-126.9), forward(3.2), turn(108.4), forward(3), turn(-139.4), forward(9.2), turn(100.7), forward(6.4), turn(102.1), forward(4.5)]).
turtle_program(r3438, midline(29), [start(416, 826, 63.4), forward(2.2), turn(116.6), forward(2)]).
turtle_program(r3438, midline(30), [start(428, 825, -12.5), forward(18.4), turn(-32.5), forward(4.2), turn(-93), forward(26.9), turn(-108), forward(9.8), turn(-78.4), forward(8.6), turn(122.7), forward(5.4)]).
turtle_program(r3438, midline(31), [start(433, 815, 0), forward(7), turn(-137.7), forward(14.9)]).
turtle_program(r3438, midline(32), [start(445, 817, -166), forward(4.1)]).
turtle_program(r3438, midline(33), [start(435, 387, -47.3), forward(17.7), turn(-87.7), forward(1.4), turn(-90), forward(17)]).
turtle_program(r3438, midline(34), [start(448, 375, 36.9), forward(5), turn(98.1), forward(19.8)]).
turtle_program(r3438, midline(35), [start(452, 448, -45), forward(50.9), turn(-45), forward(2), turn(-27.8), forward(21.5), turn(-107.2), forward(42.4)]).
turtle_program(r3438, midline(36), [start(319, 630, 37.6), forward(16.4), turn(-172.6), forward(17)]).
turtle_program(r3438, midline(37), [start(333, 639, -132.7), forward(17.7)]).
turtle_program(r3438, midline(38), [start(413, 830, 45), forward(1.4), turn(90), forward(1.4)]).
turtle_program(r3438, midline(39), [start(460, 342, -47.5), forward(16.3), turn(-76.2), forward(10.8), turn(-91.8), forward(8.6), turn(80.5), forward(2.8), turn(34.7), forward(11.2), turn(59.7), forward(9.2)]).
turtle_program(r3438, midline(40), [start(472, 327, -81.9), forward(7.1), turn(-53.1), forward(2.8), turn(-45), forward(4), turn(45), forward(8.5), turn(-66.8), forward(5.4)]).
turtle_program(r3438, midline(41), [start(466, 314, -26.6), forward(2.2), turn(79.7), forward(5)]).
turtle_program(r3438, midline(42), [start(413, 509, 45), forward(1.4)]).
turtle_program(r3438, midline(43), [start(304, 781, -53.6), forward(23.6), turn(112.7), forward(5.8), turn(102.5), forward(3.2), turn(63.4), forward(2.8)]).
turtle_program(r3438, midline(44), [start(307, 778, 45), forward(4.2), turn(135), forward(4)]).
turtle_program(r3438, midline(45), [start(310, 783, 45), forward(1.4), turn(116.6), forward(3.2)]).
turtle_program(r3438, midline(46), [start(346, 591, 45), forward(29.7), turn(108.4), forward(2.2)]).
turtle_program(r3438, midline(47), [start(430, 799, -53.1), forward(5), turn(43.7), forward(6.1), turn(47), forward(16.4), turn(-146), forward(6.3), turn(27.9), forward(12.2), turn(-57.5), forward(13.5)]).
turtle_program(r3438, midline(48), [start(432, 798, 48), forward(26.9)]).
turtle_program(r3438, midline(49), [start(452, 818, 0), forward(3), turn(-104), forward(12.4)]).
turtle_program(r3438, midline(50), [start(447, 469, -45), forward(36.8), turn(-116.6), forward(3.2), turn(-63.4), forward(29.7)]).
turtle_program(r3438, midline(51), [start(574, 499, -135), forward(17), turn(-11.9), forward(27.5), turn(-29.4), forward(31.1), turn(-48.7), forward(53.7), turn(90), forward(4.2), turn(-90), forward(50.9), turn(59), forward(8.2), turn(32.8), forward(45.3)]).
turtle_program(r3438, midline(52), [start(422, 539, -137), forward(39.6)]).
turtle_program(r3438, midline(53), [start(420, 541, 180), forward(1)]).
turtle_program(r3438, midline(54), [start(508, 469, -135), forward(2.8), turn(-90), forward(38.2), turn(5.2), forward(15.6), turn(90.3), forward(22)]).
turtle_program(r3438, midline(55), [start(463, 496, -43.5), forward(27.6), turn(-145.9), forward(6.1), turn(-35.5), forward(22.6)]).
turtle_program(r3438, midline(56), [start(507, 466, -135), forward(5.7), turn(-89.2), forward(53)]).
turtle_program(r3438, midline(57), [start(420, 532, -111.8), forward(5.4)]).
turtle_program(r3438, midline(58), [start(433, 541, -44.2), forward(48.8)]).
turtle_program(r3438, midline(59), [start(435, 542, -44.1), forward(47.4), turn(89.1), forward(2.8), turn(-90.7), forward(54.5)]).
turtle_program(r3438, midline(60), [start(508, 476, 108.4), forward(3.2), turn(26.6), forward(48.1), turn(90), forward(1.4)]).
turtle_program(r3438, midline(61), [start(457, 490, -45), forward(29.7), turn(2.6), forward(31.1), turn(-47.6), forward(3), turn(-45), forward(2.8), turn(-90), forward(62.2)]).
turtle_program(r3438, midline(62), [start(540, 437, 74.7), forward(11.4), turn(22.7), forward(23.2)]).
turtle_program(r3438, midline(63), [start(332, 673, 33.7), forward(18), turn(-21.2), forward(27.7), turn(123.3), forward(51.6), turn(-64.2), forward(6.3), turn(-116.6), forward(2.8), turn(-63.4), forward(3.2), turn(63.4), forward(52.3), turn(-108.4), forward(2.2)]).
turtle_program(r3438, midline(64), [start(335, 637, -26.6), forward(2.2), turn(-110.6), forward(19.1)]).
turtle_program(r3438, midline(65), [start(456, 819, 48), forward(13.5), turn(80.6), forward(6.4), turn(53), forward(35), turn(43.4), forward(4.2), turn(-98.1), forward(5), turn(74.9), forward(5.4), turn(-78.1), forward(7.2), turn(56.3), forward(3), turn(-108.4), forward(3.2)]).
turtle_program(r3438, midline(66), [start(465, 832, 45), forward(38.2), turn(14.7), forward(13.9), turn(75.3), forward(2.8), turn(91.5), forward(52.3), turn(-95.9), forward(27.7), turn(60.7), forward(5.1), turn(35.7), forward(20.5), turn(-15), forward(9.4)]).
turtle_program(r3438, midline(67), [start(459, 839, 45), forward(24), turn(27.6), forward(16.8), turn(-27.6), forward(26.9), turn(111.8), forward(7.6), turn(65.2), forward(26.9), turn(3), forward(35.4)]).
turtle_program(r3438, midline(68), [start(501, 891, -18.4), forward(9.5), turn(-114.4), forward(19.1)]).
turtle_program(r3438, midline(69), [start(511, 889, -26.6), forward(4.5), turn(-108.4), forward(21.2)]).
turtle_program(r3438, midline(70), [start(516, 887, -24.2), forward(21.9), turn(7.2), forward(37.6), turn(133.6), forward(2.2), turn(-71.6), forward(29.7), turn(-45), forward(5), turn(-45), forward(4.2), turn(-71.6), forward(4.5), turn(-18.4), forward(26.9), turn(-63.4), forward(6.3)]).
turtle_program(r3438, midline(71), [start(419, 832, -45), forward(2.8)]).
turtle_program(r3438, midline(72), [start(420, 828, 180), forward(2)]).
turtle_program(r3438, midline(73), [start(418, 340, -48), forward(13.5)]).
turtle_program(r3438, midline(74), [start(319, 761, -54), forward(13.6), turn(20.3), forward(10.8), turn(-64.4), forward(7.1), turn(53.1), forward(4.2), turn(108.4), forward(2.2), turn(90), forward(2.2)]).
turtle_program(r3438, midline(75), [start(327, 753, 36.9), forward(5), turn(109.4), forward(3.6), turn(78.7), forward(4.2)]).
turtle_program(r3438, midline(76), [start(332, 756, -26.6), forward(2.2), turn(-108.4), forward(7.1), turn(90), forward(1.4), turn(90), forward(8.5), turn(90), forward(1.4)]).
turtle_program(r3438, midline(77), [start(336, 746, -39.8), forward(7.8), turn(-106.5), forward(3.6), turn(-60.3), forward(2.2)]).
turtle_program(r3438, midline(78), [start(339, 741, 135), forward(2.8)]).
turtle_program(r3438, midline(79), [start(321, 761, 33.7), forward(3.6), turn(90), forward(3.6)]).
turtle_program(r3438, midline(80), [start(324, 766, 45), forward(19.8), turn(116.6), forward(3.2), turn(63.4), forward(18.4)]).
turtle_program(r3438, midline(81), [start(334, 781, 161.6), forward(3.2), turn(63.4), forward(18.4), turn(-101.3), forward(3.6), turn(101.3), forward(2.8), turn(-90), forward(1.4), turn(-90), forward(4.2), turn(90), forward(2.8), turn(90), forward(4.2)]).
turtle_program(r3438, midline(82), [start(342, 743, -45), forward(2.8), turn(-90), forward(1.4), turn(90), forward(4.2), turn(-105.3), forward(8.1)]).
turtle_program(r3438, midline(83), [start(344, 736, 153.4), forward(4.5), turn(71.6), forward(1.4), turn(101.3), forward(3.6)]).
turtle_program(r3438, midline(84), [start(342, 732, -45), forward(2.8), turn(-90), forward(2.8), turn(90), forward(55.2), turn(-116.6), forward(3.2)]).
turtle_program(r3438, midline(85), [start(474, 877, 45), forward(24), turn(108.4), forward(2.2), turn(71.6), forward(58), turn(-90), forward(1.4), turn(-90), forward(56.6), turn(108.4), forward(2.2), turn(71.6), forward(56.6), turn(-114.4), forward(8.5), turn(27.2), forward(14.9), turn(32.8), forward(6.1), turn(54.5), forward(11.3), turn(-81.9), forward(5), turn(81.9), forward(17), turn(59), forward(4.1)]).
turtle_program(r3438, midline(86), [start(417, 866, -90), forward(7), turn(-135), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4), turn(56.3), forward(5.1), turn(-56.3), forward(1.4), turn(90), forward(1.4), turn(-90), forward(1.4)]).
turtle_program(r3438, midline(87), [start(415, 861, 143.1), forward(5), turn(108.4), forward(3.2)]).
turtle_program(r3438, midline(88), [start(428, 876, 135), forward(17), turn(45), forward(1), turn(63.4), forward(4.5), turn(-49.4), forward(12.4), turn(109.7), forward(7.2), turn(146.3), forward(1), turn(-45), forward(8.5)]).
turtle_program(r3438, midline(89), [start(416, 889, 150.3), forward(8.1), turn(70.3), forward(9.2), turn(-85.6), forward(4.2), turn(36.9), forward(7.1), turn(-33.5), forward(12), turn(-48.4), forward(5), turn(-40.6), forward(9.2), turn(92.4), forward(17.8), turn(-65.9), forward(4.1), turn(-40.4), forward(8.6), turn(-82.3), forward(23.3), turn(-99.6), forward(3.6), turn(49.2), forward(8.1), turn(-37.9), forward(9.9)]).
turtle_program(r3438, midline(90), [start(397, 905, -48.4), forward(12), turn(-101.9), forward(8.1), turn(-74.7), forward(2.8), turn(90), forward(1.4)]).
turtle_program(r3438, midline(91), [start(403, 884, 90), forward(2)]).
turtle_program(r3438, midline(92), [start(406, 874, -9.5), forward(6.1), turn(99.5), forward(7)]).
turtle_program(r3438, midline(93), [start(404, 894, -45), forward(2.8)]).
turtle_program(r3438, midline(94), [start(391, 893, 31), forward(5.8), turn(77.5), forward(6.3)]).
turtle_program(r3438, midline(95), [start(384, 932, 0), forward(12), turn(-40.2), forward(17), turn(-106.1), forward(10.8)]).
turtle_program(r3438, midline(96), [start(408, 918, -90), forward(19), turn(-45), forward(2.8), turn(78.7), forward(3.6)]).
turtle_program(r3438, midline(97), [start(402, 896, 130.6), forward(9.2)]).
turtle_program(r3438, midline(98), [start(390, 912, 45), forward(2.8), turn(90), forward(17)]).
turtle_program(r3438, midline(99), [start(393, 913, 26.6), forward(2.2), turn(108.4), forward(18.4)]).
turtle_program(r3438, midline(100), [start(445, 858, 45), forward(55.2), turn(108.4), forward(2.2), turn(71.6), forward(53.7)]).
turtle_program(r3438, midline(101), [start(408, 897, -31), forward(5.8), turn(159.6), forward(6.4)]).
turtle_program(r3438, midline(102), [start(414, 893, -45), forward(25.5)]).
turtle_program(r3438, midline(103), [start(431, 879, 111.8), forward(10.8), turn(23.2), forward(7.1), turn(71.6), forward(4.5)]).
turtle_program(r3438, midline(104), [start(401, 883, 128.7), forward(6.4)]).
turtle_program(r3438, midline(105), [start(332, 783, -171.9), forward(7.1), turn(40.2), forward(12)]).
turtle_program(r3438, midline(106), [start(325, 783, 133), forward(20.5), turn(-61.5), forward(3.2), turn(63.4), forward(2.8), turn(38.3), forward(17.1)]).
turtle_program(r3438, midline(107), [start(313, 800, -45), forward(8.5), turn(-45), forward(3)]).
turtle_program(r3438, midline(108), [start(312, 803, -38.7), forward(12.8), turn(-32.9), forward(3.2), turn(-108.4), forward(2)]).
turtle_program(r3438, midline(109), [start(335, 639, 46.2), forward(67.9), turn(-46.2), forward(3), turn(90), forward(3), turn(45), forward(56.6), turn(-71.6), forward(6.7), turn(71.6), forward(4.2), turn(-33.7), forward(5.1), turn(33.7), forward(7.1), turn(108.4), forward(2.2)]).
turtle_program(r3438, midline(110), [start(425, 369, -47.7), forward(14.9), turn(-91.1), forward(10.6), turn(-86.2), forward(11.3), turn(-90), forward(1.4), turn(-90), forward(9.9), turn(90), forward(1.4), turn(90), forward(9.9)]).
turtle_program(r3438, midline(111), [start(456, 326, 99.5), forward(12.2)]).
turtle_program(r3438, midline(112), [start(453, 378, 36.9), forward(5), turn(98.1), forward(24)]).
turtle_program(r3438, midline(113), [start(458, 380, 11.3), forward(15.3), turn(-74.7), forward(4.5), turn(-34.7), forward(14.1), turn(-18.4), forward(15.7), turn(-26.6), forward(5), turn(-81.9), forward(24), turn(-45), forward(2)]).
turtle_program(r3438, midline(114), [start(447, 365, -43.2), forward(21.9)]).
turtle_program(r3438, midline(115), [start(436, 855, 166.8), forward(17.5)]).
turtle_program(r3438, midline(116), [start(432, 332, 135), forward(12.7)]).
turtle_program(r3438, midline(117), [start(423, 338, -45), forward(9.9)]).
turtle_program(r3438, midline(118), [start(350, 586, 43.9), forward(36.1), turn(117.7), forward(3.2), turn(63.4), forward(33.9), turn(-177.4), forward(31.1), turn(105.8), forward(2.2)]).
turtle_program(r3438, midline(119), [start(377, 611, -130.6), forward(36.9), turn(177.7), forward(38.2)]).
turtle_program(r3438, midline(120), [start(381, 611, 0), forward(17), turn(-100), forward(17.3)]).
turtle_program(r3438, midline(121), [start(498, 433, 45), forward(1.4)]).
turtle_program(r3438, midline(122), [start(417, 831, -45), forward(1.4)]).
turtle_program(r3438, midline(123), [start(489, 413, 63.4), forward(8.9), turn(71.6), forward(28.3), turn(-177), forward(26.9), turn(98.3), forward(3.6)]).
turtle_program(r3438, midline(124), [start(466, 829, -28.8), forward(22.8), turn(-16.2), forward(18.4), turn(-22.4), forward(26), turn(-20.7), forward(30), turn(-136.4), forward(78.5)]).
turtle_program(r3438, midline(125), [start(327, 619, 37.6), forward(16.4), turn(83.4), forward(5.8), turn(-102.5), forward(3.2), turn(116.6), forward(4.2), turn(-161.6), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-71.6), forward(1.4), turn(-90), forward(4.2), turn(161.6), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(143.1), forward(4.5), turn(-143.1), forward(4.5), turn(127.9), forward(5.1), turn(-140), forward(6.4), turn(-96.3), forward(72.1)]).
turtle_program(r3438, midline(126), [start(403, 856, 90), forward(2)]).
turtle_program(r3438, midline(127), [start(505, 462, -128.7), forward(6.4), turn(-99.5), forward(25.5), turn(-176.8), forward(24)]).
turtle_program(r3438, midline(128), [start(481, 899, -135), forward(52.3)]).
turtle_program(r3438, midline(129), [start(323, 782, 166), forward(4.1), turn(59), forward(8.5), turn(-11.3), forward(3.6), turn(-78.7), forward(1.4), turn(-78.7), forward(3.6), turn(-17.7), forward(6.4), turn(114.8), forward(4.5)]).
turtle_program(r3438, midline(130), [start(318, 784, 180), forward(1)]).
turtle_program(r3438, midline(131), [start(420, 836, -45), forward(1.4), turn(45), forward(1), turn(-45), forward(2.8)]).
turtle_program(r3438, midline(132), [start(423, 836, 71.6), forward(3.2)]).
turtle_program(r3438, midline(133), [start(425, 837, -71.6), forward(3.2)]).
turtle_program(r3438, midline(134), [start(581, 864, -14), forward(4.1), turn(60.4), forward(29), turn(107), forward(4.5)]).
turtle_program(r3438, midline(135), [start(586, 862, -18.4), forward(9.5), turn(34.4), forward(7.3), turn(37.2), forward(15), turn(36.9), forward(5), turn(63.4), forward(4.5), turn(71.6), forward(24)]).
turtle_program(r3438, midline(136), [start(392, 682, -33.7), forward(3.6), turn(-102.4), forward(75), turn(79.8), forward(3.6), turn(-78.7), forward(18.4)]).
turtle_program(r3438, midline(137), [start(396, 679, -33.7), forward(21.6), turn(-35.8), forward(8.5), turn(-26.5), forward(29.2), turn(-35.7), forward(24.1)]).
turtle_program(r3438, midline(138), [start(415, 629, -45), forward(63.6), turn(-7.1), forward(11.4), turn(-82.9), forward(1.4), turn(-90), forward(75)]).
turtle_program(r3438, midline(139), [start(409, 622, -45.5), forward(85.6), turn(-71.1), forward(2.2), turn(-108.9), forward(87)]).
turtle_program(r3438, midline(140), [start(469, 563, 129.8), forward(23.4), turn(5.2), forward(60.8), turn(-90), forward(1.4), turn(-90), forward(79.2), turn(-45), forward(1)]).
turtle_program(r3438, midline(141), [start(467, 578, 125.5), forward(8.6), turn(9.5), forward(66.5)]).
turtle_program(r3438, midline(142), [start(467, 581, 90), forward(1), turn(45), forward(32.5)]).
turtle_program(r3438, midline(143), [start(467, 583, 45), forward(1.4), turn(91.5), forward(27.6)]).
turtle_program(r3438, midline(144), [start(417, 665, 31), forward(23.3), turn(-76), forward(66.5), turn(-78.7), forward(10.8), turn(-76), forward(29.7), turn(46.2), forward(2.2), turn(-69.6), forward(41)]).
turtle_program(r3438, midline(145), [start(449, 629, -45), forward(36.8), turn(-101.3), forward(10.8), turn(-78.7), forward(2.8), turn(63.4), forward(6.3), turn(-55.3), forward(5)]).
turtle_program(r3438, midline(146), [start(474, 601, -49.4), forward(9.2), turn(-91.9), forward(6.4), turn(-83.7), forward(9.9), turn(180), forward(5.7)]).
turtle_program(r3438, midline(147), [start(470, 559, -104), forward(4.1), turn(-118.6), forward(34), turn(-3.8), forward(56.6)]).
turtle_program(r3438, midline(148), [start(444, 577, -46.2), forward(34.7), turn(-123.8), forward(17.3), turn(13.2), forward(15.2)]).
turtle_program(r3438, midline(149), [start(460, 552, 135), forward(25.5), turn(-21), forward(9.8), turn(21), forward(50.9)]).
turtle_program(r3438, midline(150), [start(450, 550, 135), forward(19.8), turn(-28.6), forward(17.7), turn(28.6), forward(43.8)]).
turtle_program(r3438, midline(151), [start(467, 573, -63.4), forward(2.2)]).
turtle_program(r3438, midline(152), [start(475, 592, 116.6), forward(6.7), turn(-150.3), forward(7.2), turn(168.7), forward(7.1)]).
turtle_program(r3438, midline(153), [start(463, 597, -45), forward(12.7), turn(-101.3), forward(3.6), turn(-78.7), forward(14.1), turn(-173.7), forward(12.8)]).
turtle_program(r3438, midline(154), [start(606, 883, -63.4), forward(2.2)]).
turtle_program(r3438, midline(155), [start(339, 781, -11.3), forward(5.1), turn(-125.2), forward(26.2), turn(73.1), forward(2.2), turn(-71.6), forward(2.8), turn(90), forward(1.4), turn(78.7), forward(3.6), turn(11.3), forward(28.3), turn(-144.5), forward(12.2), turn(-17.1), forward(11.2), turn(-49.4), forward(4.1)]).
turtle_program(r3438, midline(156), [start(350, 779, 158.2), forward(5.4)]).
turtle_program(r3438, midline(157), [start(350, 781, 38.7), forward(6.4), turn(99.5), forward(25.5), turn(21.3), forward(8.5), turn(25), forward(13)]).
turtle_program(r3438, midline(158), [start(340, 755, -108.4), forward(3.2), turn(63.4), forward(9.9), turn(45), forward(2), turn(126.9), forward(10)]).
turtle_program(r3438, midline(159), [start(343, 758, -45), forward(11.3), turn(-90), forward(2.8), turn(-135), forward(1), turn(45), forward(9.9)]).
turtle_program(r3438, midline(160), [start(356, 784, -31.4), forward(21.1), turn(-20.3), forward(24.2), turn(-55.2), forward(24), turn(-94.9), forward(21.5), turn(15.5), forward(9.1), turn(32.9), forward(4.5), turn(-71.6), forward(2.8)]).
turtle_program(r3438, midline(161), [start(383, 730, -86.9), forward(37.1)]).
turtle_program(r3438, midline(162), [start(352, 741, 135), forward(4.2)]).
turtle_program(r3438, midline(163), [start(361, 740, 135), forward(2.8)]).
turtle_program(r3438, midline(164), [start(407, 497, 0), forward(1), turn(-45), forward(1.4), turn(113.2), forward(5.4)]).
turtle_program(r3438, midline(165), [start(474, 874, -111.3), forward(19.3), turn(-23.7), forward(17)]).
turtle_program(r3438, midline(166), [start(432, 382, -45), forward(17), turn(90), forward(2.8)]).
turtle_program(r3438, midline(167), [start(478, 390, -119.7), forward(8.1)]).
turtle_program(r3438, midline(168), [start(410, 920, -4.1), forward(14), turn(-28.4), forward(13), turn(-94.4), forward(20), turn(73.7), forward(5)]).
turtle_program(r3438, midline(169), [start(436, 913, -4.8), forward(12), turn(-14.7), forward(18), turn(-113.9), forward(24.8), turn(30.8), forward(9.2), turn(-23), forward(8.6), turn(56.1), forward(8.5), turn(114.4), forward(4.2), turn(90), forward(2.8), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(63.4), forward(1.4), turn(90), forward(2.8), turn(-153.4), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-126.9), forward(3.2), turn(126.9), forward(3.2), turn(-108.4), forward(4), turn(104), forward(4.1), turn(31), forward(1.4), turn(90), forward(43.8), turn(-90), forward(1.4), turn(-89), forward(41.7), turn(70.6), forward(2.2), turn(108.4), forward(33.9)]).
turtle_program(r3438, midline(170), [start(466, 906, -33.7), forward(3.6)]).
turtle_program(r3438, midline(171), [start(474, 902, 135), forward(1.4)]).
turtle_program(r3438, midline(172), [start(399, 891, -14), forward(4.1), turn(59), forward(1.4), turn(90), forward(2.8)]).
turtle_program(r3438, midline(173), [start(414, 878, -45), forward(1.4), turn(78.7), forward(3.6), turn(87.3), forward(5.8), turn(-166), forward(7.1), turn(-45), forward(2), turn(-45), forward(8.5), turn(-90), forward(1.4)]).
turtle_program(r3438, midline(174), [start(452, 785, -57.5), forward(13), turn(-77.5), forward(17), turn(33.7), forward(5.1), turn(-97.1), forward(3.2), turn(71.6), forward(5), turn(-34.7), forward(6.3), turn(-33.7), forward(11.4), turn(15.3), forward(9), turn(45), forward(2.8), turn(-90), forward(2.8), turn(47.9), forward(20)]).
turtle_program(r3438, midline(175), [start(426, 752, -45.6), forward(62.9), turn(-89.4), forward(32.5), turn(-11.3), forward(10.8), turn(101.3), forward(65.1), turn(178.7), forward(63.7), turn(-176.1), forward(62.3), turn(177.4), forward(62.2)]).
turtle_program(r3438, midline(176), [start(457, 696, 135), forward(80.6)]).
turtle_program(r3438, midline(177), [start(460, 773, -30.1), forward(22), turn(-14.9), forward(32.5), turn(-84.1), forward(20.6), turn(-9.3), forward(24.1)]).
turtle_program(r3438, midline(178), [start(474, 711, 134.3), forward(55.9)]).
turtle_program(r3438, midline(179), [start(445, 682, -45), forward(59.4), turn(-45), forward(3)]).
turtle_program(r3438, midline(180), [start(447, 757, -45), forward(52.3)]).
turtle_program(r3438, midline(181), [start(413, 752, -46.1), forward(70.7)]).
turtle_program(r3438, midline(182), [start(427, 350, 0), forward(1), turn(-45), forward(18.4), turn(90), forward(1.4), turn(90), forward(18.4), turn(-90), forward(1.4), turn(-90), forward(19.8), turn(169.5), forward(19.4), turn(-169.5), forward(21.2), turn(90), forward(1.4), turn(90), forward(21.2), turn(-90), forward(1.4), turn(-90), forward(22.6), turn(90), forward(1.4), turn(90), forward(22.6), turn(-63.4), forward(3.2), turn(-143.1), forward(3.2), turn(26.6), forward(22.6), turn(90), forward(1.4), turn(90), forward(21.2), turn(-18.4), forward(4.5), turn(-71.6), forward(1.4), turn(-90), forward(25.5), turn(-180), forward(18.4)]).
turtle_program(r3438, midline(183), [start(472, 590, -45), forward(22.6), turn(-84.6), forward(29.8), turn(45.7), forward(37.2)]).
turtle_program(r3438, midline(184), [start(477, 587, 90), forward(3)]).
turtle_program(r3438, midline(185), [start(475, 515, -44.1), forward(43.1), turn(-31.9), forward(4.1)]).
turtle_program(r3438, midline(186), [start(506, 487, 132.1), forward(28.3), turn(11), forward(15)]).
turtle_program(r3438, midline(187), [start(479, 517, 26.6), forward(2.2), turn(-71.6), forward(35.4), turn(-45), forward(2)]).
turtle_program(r3438, midline(188), [start(483, 518, 0), forward(2), turn(-47.6), forward(31.1)]).
turtle_program(r3438, midline(189), [start(361, 614, -161.6), forward(3.2), turn(-108.4), forward(2)]).
turtle_program(r3438, midline(190), [start(349, 619, -141.3), forward(19.2)]).
turtle_program(r3438, midline(191), [start(503, 457, -105.9), forward(7.3), turn(-119.1), forward(59.4)]).
turtle_program(r3438, midline(192), [start(477, 901, -45), forward(2.8)]).
turtle_program(r3438, midline(193), [start(365, 578, 180), forward(2)]).
turtle_program(r3438, midline(194), [start(453, 801, -45), forward(76.4), turn(-74.7), forward(8.1)]).
turtle_program(r3438, midline(195), [start(508, 747, 23.2), forward(7.6), turn(-30.3), forward(8.1), turn(-36.2), forward(49.5), turn(106.8), forward(2.2), turn(71.6), forward(43.8), turn(31), forward(4.1)]).
turtle_program(r3438, midline(196), [start(531, 748, -45), forward(42.4), turn(71.6), forward(2.2), turn(109.4), forward(41.7)]).
turtle_program(r3438, midline(197), [start(563, 720, 63.4), forward(2.2), turn(73.8), forward(36.8)]).
turtle_program(r3438, midline(198), [start(543, 745, -42.3), forward(29.7), turn(-47.7), forward(3)]).
turtle_program(r3438, midline(199), [start(471, 551, -22.8), forward(33.6), turn(-40.7), forward(2.2), turn(-71.6), forward(24), turn(111.8), forward(7.6), turn(-21.8), forward(19.8), turn(-63.4), forward(3.2)]).
turtle_program(r3438, midline(200), [start(502, 540, 57.5), forward(13), turn(32.5), forward(12), turn(40.9), forward(19.8), turn(78.8), forward(8.1)]).
turtle_program(r3438, midline(201), [start(496, 579, 131.2), forward(21.3), turn(120.4), forward(3.2), turn(63.4), forward(18.4)]).
turtle_program(r3438, midline(202), [start(507, 504, 86.4), forward(16), turn(22), forward(15.8)]).
turtle_program(r3438, midline(203), [start(347, 621, -141.8), forward(17.8), turn(-170.9), forward(17.7)]).
turtle_program(r3438, midline(204), [start(441, 753, -45), forward(53.7)]).
turtle_program(r3438, midline(205), [start(421, 878, -33.7), forward(3.6)]).
turtle_program(r3438, midline(206), [start(478, 620, -73.3), forward(10.4), turn(-52.2), forward(8.6), turn(80.5), forward(29.7), turn(90), forward(1.4), turn(90), forward(28.3), turn(-90), forward(1.4), turn(-90), forward(28.3)]).
turtle_program(r3438, midline(207), [start(482, 611, -108.4), forward(6.3), turn(63.4), forward(26.9), turn(90), forward(1.4), turn(90), forward(25.5), turn(-90), forward(1.4), turn(-90), forward(7.1), turn(90), forward(1.4), turn(90), forward(8.5), turn(-90), forward(1.4), turn(-84.8), forward(7.8), turn(-95.2), forward(1.4)]).
turtle_program(r3438, midline(208), [start(490, 601, -45), forward(15.6), turn(-71.6), forward(2.2)]).
turtle_program(r3438, midline(209), [start(501, 592, 132.3), forward(14.9)]).
turtle_program(r3438, midline(210), [start(502, 594, 95.2), forward(11), turn(51.1), forward(3.6), turn(49.6), forward(7.3), turn(-60.9), forward(12.7), turn(-108.4), forward(2.2), turn(-67.8), forward(10.6)]).
turtle_program(r3438, midline(211), [start(496, 608, 145), forward(12.2)]).
turtle_program(r3438, midline(212), [start(490, 615, 0), forward(10), turn(-90), forward(8)]).
turtle_program(r3438, midline(213), [start(501, 616, 140.2), forward(7.8), turn(47.9), forward(14.1)]).
turtle_program(r3438, midline(214), [start(466, 502, -45.8), forward(53), turn(177.6), forward(25.5)]).
turtle_program(r3438, midline(215), [start(488, 641, 133.6), forward(58), turn(-177.2), forward(56.6), turn(177.1), forward(56.6), turn(-177.1), forward(56.6), turn(175.7), forward(56.6), turn(-177.1), forward(56.6)]).
turtle_program(r3438, midline(216), [start(397, 899, -90), forward(4), turn(135), forward(2.8)]).
turtle_program(r3438, midline(217), [start(425, 362, -45), forward(8.5), turn(166), forward(5.8)]).
turtle_program(r3438, midline(218), [start(330, 785, 135), forward(1.4)]).
turtle_program(r3438, midline(219), [start(467, 319, 45), forward(1.4)]).
turtle_program(r3738, midline(1), [start(172, 472, -37.9), forward(11.4), turn(-30.3), forward(5.4), turn(122.7), forward(8.6), turn(80.5), forward(2.8), turn(66.8), forward(5.4)]).
turtle_program(r3738, midline(2), [start(224, 496, -55), forward(12.2), turn(-35), forward(11), turn(20.6), forward(8.5), turn(-58.3), forward(27.8), turn(-82.1), forward(16.1), turn(25.7), forward(14), turn(-40.9), forward(7.1), turn(-90), forward(9.9), turn(108.4), forward(2.2)]).
turtle_program(r3738, midline(3), [start(192, 466, -47.5), forward(16.3)]).
turtle_program(r3738, midline(4), [start(218, 444, -65.2), forward(14.3), turn(17.2), forward(13.5), turn(17), forward(17.5), turn(19.7), forward(10.2), turn(101.3), forward(20), turn(43.5), forward(27.6), turn(74.4), forward(19.2)]).
turtle_program(r3738, midline(5), [start(259, 409, -32), forward(37.7), turn(9.5), forward(31.4), turn(6.3), forward(32.3), turn(9.1), forward(16.1), turn(33.7), forward(35.8), turn(16.3), forward(19.1), turn(28.7), forward(41.1)]).
turtle_program(r3738, midline(6), [start(259, 431, 133.5), forward(26.2), turn(-106.9), forward(2.2), turn(-73.3), forward(23.3)]).
turtle_program(r3738, midline(7), [start(259, 436, 133.2), forward(21.9), turn(-88.2), forward(1.4), turn(-90), forward(19.8)]).
turtle_program(r3738, midline(8), [start(259, 441, 135), forward(18.4), turn(-18.4), forward(6.7), turn(22.2), forward(10.6)]).
turtle_program(r3738, midline(9), [start(259, 443, 108.4), forward(9.5), turn(26.6), forward(7.1), turn(78.7), forward(3.6)]).
turtle_program(r3738, midline(10), [start(243, 470, -149), forward(5.8), turn(106.8), forward(14.9), turn(87.3), forward(1.4), turn(90), forward(8.5)]).
turtle_program(r3738, midline(11), [start(243, 468, -45), forward(4.2), turn(-45), forward(1), turn(45), forward(8.5), turn(126.9), forward(7.1), turn(53.1), forward(4.2), turn(90), forward(4.2)]).
turtle_program(r3738, midline(12), [start(250, 469, 143.1), forward(5), turn(63.4), forward(2.2), turn(-71.6), forward(15.6), turn(-142.1), forward(8.1), turn(57.3), forward(7.8), turn(118.5), forward(5.1), turn(50), forward(6.4)]).
turtle_program(r3738, midline(13), [start(246, 473, 90), forward(5), turn(63.4), forward(4.5)]).
turtle_program(r3738, midline(14), [start(246, 480, 80.5), forward(6.1)]).
turtle_program(r7611, midline(1), [start(430, 794, 156.5), forward(25.1), turn(-27.8), forward(25.6), turn(11.8), forward(29.8), turn(33.6), forward(19.1), turn(52.6), forward(26.2), turn(-32.5), forward(12.4), turn(31), forward(9.9), turn(-66.8), forward(5.4), turn(-23.2), forward(17), turn(121), forward(4.1), turn(-31), forward(18.4), turn(-90), forward(1.4), turn(90), forward(5.7), turn(-45), forward(3), turn(-39.3), forward(14.2), turn(-50.7), forward(18), turn(96.7), forward(17.1), turn(-51.7), forward(11.3), turn(26.6), forward(6.3), turn(-41.8), forward(8.1), turn(-41.1), forward(5.1), turn(-23.4), forward(15.8), turn(-55.3), forward(9), turn(-18.4), forward(12.6), turn(-113.8), forward(29.7)]).
turtle_program(r7611, midline(2), [start(348, 845, 148.4), forward(15.3), turn(17.6), forward(12.4), turn(14), forward(11), turn(15.5), forward(18.7), turn(-31.5), forward(14.6), turn(62.6), forward(24.8)]).
turtle_program(r7611, midline(3), [start(241, 848, 135), forward(14.1)]).
turtle_program(r7611, midline(4), [start(264, 831, -45), forward(14.1), turn(-45), forward(1), turn(-45), forward(7.1), turn(-90), forward(1.4), turn(-90), forward(4.2), turn(83.7), forward(12.8)]).
turtle_program(r7611, midline(5), [start(294, 850, -71.6), forward(6.3), turn(-31), forward(9.2), turn(-32.5), forward(19.8), turn(-33.7), forward(5.1)]).
turtle_program(r7611, midline(6), [start(294, 831, 90), forward(2)]).
turtle_program(r7611, midline(7), [start(311, 818, 45), forward(8.5), turn(91.5), forward(27.6)]).
turtle_program(r7611, midline(8), [start(273, 817, -59), forward(5.8), turn(104), forward(4.2), turn(71.6), forward(2.2), turn(108.4), forward(2.8)]).
turtle_program(r7611, midline(9), [start(260, 865, -27.8), forward(21.5)]).
turtle_program(r7611, midline(10), [start(265, 827, -45), forward(9.9)]).
turtle_program(r7611, midline(11), [start(280, 820, -116.6), forward(2.2)]).
turtle_program(r7611, midline(12), [start(294, 824, -135), forward(22.6), turn(-90), forward(1.4), turn(-90), forward(1.4)]).
turtle_program(r7611, midline(13), [start(280, 809, -33.7), forward(7.2), turn(-56.3), forward(4)]).
turtle_program(r7611, midline(14), [start(283, 809, 90), forward(2), turn(-45), forward(12.7), turn(-142.1), forward(8.1), turn(-37.9), forward(5.7), turn(-71.6), forward(2.2)]).
turtle_program(r7611, midline(15), [start(287, 807, -135), forward(1.4)]).
turtle_program(r7611, midline(16), [start(246, 843, -45), forward(8.5), turn(166), forward(5.8)]).
turtle_program(r3808, midline(1), [start(652, 451, -128.7), forward(12.8), turn(-15.3), forward(13.6), turn(-66.1), forward(22), turn(22.9), forward(8.1), turn(54.4), forward(17.7), turn(-47.3), forward(4), turn(63.4), forward(6.7), turn(-52.1), forward(5.1), turn(92.7), forward(8.2), turn(-61.3), forward(35.4), turn(-42.7), forward(3), turn(41.6), forward(12), turn(-29.1), forward(9.2), turn(42.8), forward(15.8), turn(-49.6), forward(10), turn(39.3), forward(4.2), turn(45), forward(4), turn(38.7), forward(6.4), turn(-75.5), forward(5), turn(-3.7), forward(18.4), turn(-16.7), forward(16.6), turn(-32.7), forward(2)]).
turtle_program(r3808, midline(2), [start(587, 425, -51.3), forward(6.4), turn(-98.9), forward(8.1), turn(105.3), forward(8.5), turn(-90), forward(35.4), turn(59), forward(8.2), turn(31), forward(9.9), turn(21.8), forward(7.6), turn(-111.8), forward(19.8), turn(45), forward(3)]).
turtle_program(r3808, midline(3), [start(581, 368, 56.3), forward(14.4), turn(68.7), forward(12.2), turn(100), forward(12.7), turn(-23.2), forward(5.4)]).
turtle_program(r3808, midline(4), [start(581, 363, -97.1), forward(8.1), turn(-43.1), forward(7.8), turn(-39.8), forward(5)]).
turtle_program(r3808, midline(5), [start(582, 426, 131.2), forward(10.6), turn(82.5), forward(7.2), turn(-20.7), forward(13.3), turn(47.3), forward(8.1), turn(-18.3), forward(13.5), turn(19.4), forward(12.5), turn(28.6), forward(16)]).
turtle_program(r3808, midline(6), [start(538, 392, 41.2), forward(10.6), turn(-86.2), forward(4.2), turn(90), forward(1.4), turn(83.7), forward(12.8)]).
turtle_program(r3808, midline(7), [start(568, 383, 42.5), forward(16.3), turn(65.9), forward(3.2), turn(-65.9), forward(16.3), turn(-172.3), forward(15.6)]).
turtle_program(r3808, midline(8), [start(650, 448, 45), forward(1.4)]).
turtle_program(r3808, midline(9), [start(548, 404, -45), forward(5.7), turn(-71.6), forward(2.2), turn(-108.4), forward(2.8)]).
turtle_program(r3808, midline(10), [start(589, 432, 135), forward(8.5), turn(74.7), forward(8.1)]).
turtle_program(r3808, midline(11), [start(551, 396, -26.6), forward(4.5), turn(105.3), forward(5.1), turn(-150.3), forward(3.2)]).
turtle_program(r3808, midline(12), [start(649, 451, 45), forward(1.4)]).
turtle_program(r3808, midline(13), [start(551, 418, -48.8), forward(10.6), turn(-94.3), forward(10)]).
turtle_program(r3808, midline(14), [start(559, 409, -14), forward(4.1), turn(-116.6), forward(9.2), turn(40.6), forward(1), turn(45), forward(2.8), turn(90), forward(9.9), turn(78.7), forward(3.6)]).
turtle_program(r3808, midline(15), [start(578, 399, 135), forward(1.4), turn(90), forward(18.4), turn(90), forward(1.4)]).
turtle_program(r3808, midline(16), [start(564, 389, 149), forward(5.8)]).
turtle_program(r3808, midline(17), [start(592, 419, 18.4), forward(3.2), turn(116.6), forward(8.5)]).
turtle_program(r3808, midline(18), [start(633, 432, -114.4), forward(12.1), turn(-20.6), forward(9.9), turn(-57.5), forward(18.4), turn(57.5), forward(14.1), turn(-101.3), forward(3.6)]).
turtle_program(r3808, midline(19), [start(602, 418, 170.5), forward(6.1)]).
turtle_program(r3808, midline(20), [start(621, 413, -113.2), forward(15.2), turn(-66.8), forward(22), turn(45), forward(12.7)]).
turtle_program(r3808, midline(21), [start(615, 398, -132.9), forward(19.1), turn(-28.7), forward(12.6)]).
turtle_program(r3808, midline(22), [start(577, 401, 153.4), forward(2.2), turn(71.6), forward(15.6)]).
turtle_program(r3808, midline(23), [start(591, 430, -48), forward(13.5)]).
turtle_program(r3808, midline(24), [start(573, 408, 135), forward(24)]).
turtle_program(r3808, midline(25), [start(520, 356, 45), forward(8.5), turn(29.1), forward(7.3)]).
turtle_program(r3808, midline(26), [start(561, 393, 45), forward(18.4)]).
turtle_program(r3808, midline(27), [start(575, 404, -90), forward(1)]).
turtle_program(r3808, midline(28), [start(578, 351, -98.7), forward(13.2)]).
turtle_program(r3808, midline(29), [start(574, 410, 104.7), forward(19.6)]).
turtle_program(r3808, midline(30), [start(567, 406, 18.4), forward(3.2)]).
turtle_program(r3808, midline(31), [start(607, 419, 135), forward(17)]).
turtle_program(r3808, midline(32), [start(581, 393, -128.7), forward(12.8)]).
turtle_program(r3808, midline(33), [start(603, 444, 180), forward(12), turn(35.5), forward(8.6)]).
turtle_program(r12, midline(1), [start(400, 66, -8.7), forward(13.2), turn(-36.3), forward(7.1), turn(-18.4), forward(8.9), turn(-42.5), forward(7.3), turn(-31.9), forward(28.3), turn(-98.4), forward(3.6), turn(-67.4), forward(3.6), turn(67.4), forward(7.2), turn(-33.7), forward(6), turn(-38.7), forward(6.4), turn(57.1), forward(6.3), turn(45), forward(2.2)]).
turtle_program(r12, midline(2), [start(397, 36, 45), forward(11.3), turn(113.2), forward(5.4)]).
turtle_program(r12, midline(3), [start(395, 63, -43.5), forward(26.2), turn(-93.7), forward(19.1), turn(65.6), forward(3.2)]).
turtle_program(r12, midline(4), [start(411, 44, -140.2), forward(15.6)]).
turtle_program(r12, midline(5), [start(418, 44, -135), forward(21.2)]).
turtle_program(r12, midline(6), [start(406, 44, 0), forward(2)]).
turtle_program(r12, midline(7), [start(439, 64, -140.9), forward(20.6)]).
turtle_program(r12, midline(8), [start(402, 31, 42.9), forward(19.1)]).
turtle_program(r12, midline(9), [start(413, 14, 147.5), forward(13), turn(-23.8), forward(3.6), turn(-97.1), forward(4.5), turn(-135), forward(3.2)]).
turtle_program(r12, midline(10), [start(404, 20, 45), forward(1.4), turn(-45), forward(2), turn(108.4), forward(6.3), turn(-63.4), forward(1.4), turn(-90), forward(4.2), turn(-90), forward(1.4), turn(45), forward(5)]).
turtle_program(r12, midline(11), [start(411, 17, 90), forward(8), turn(45), forward(5.7), turn(180), forward(7.1)]).
turtle_program(r12, midline(12), [start(414, 13, 31), forward(5.8), turn(135), forward(4.1), turn(-31), forward(4.2), turn(-71.6), forward(2.2), turn(-18.4), forward(17), turn(108.4), forward(2.2), turn(71.6), forward(12.7), turn(-90), forward(7.1), turn(-166), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-151.9), forward(5.8), turn(151.9), forward(5.8), turn(-121), forward(2)]).
turtle_program(r12, midline(13), [start(420, 16, 45), forward(9.9), turn(52.1), forward(8.1), turn(125.4), forward(16.3)]).
turtle_program(r1808, midline(1), [start(338, 198, 180), forward(1), turn(-36.9), forward(10), turn(81.9), forward(1.4), turn(-101.3), forward(3.6), turn(42.3), forward(4.1), turn(-27.1), forward(10.6), turn(-48.8), forward(2), turn(76), forward(4.1), turn(-76), forward(3), turn(135), forward(2.8), turn(-90), forward(9.9), turn(63.4), forward(3.2), turn(-60.7), forward(14.9), turn(-7.6), forward(24.8), turn(-16.9), forward(7.6), turn(21.8), forward(4.2), turn(78.7), forward(3.6), turn(-86.8), forward(5), turn(-70.6), forward(3.6), turn(60.3), forward(8.9), turn(-60.3), forward(3.6), turn(67.4), forward(3.6), turn(-47.7), forward(8.2), turn(-31), forward(2.8), turn(-85.6), forward(9.2), turn(-94.4), forward(9.9), turn(-45), forward(1)]).
turtle_program(r1808, midline(2), [start(298, 226, 0), forward(2)]).
turtle_program(r1808, midline(3), [start(303, 224, 63.4), forward(2.2), turn(71.6), forward(2.8), turn(18.4), forward(4.5), turn(71.6), forward(2.8), turn(-93.4), forward(12), turn(93.4), forward(1.4)]).
turtle_program(r1808, midline(4), [start(314, 217, 135), forward(2.8)]).
turtle_program(r1808, midline(5), [start(262, 278, -26.6), forward(2.2), turn(-108.4), forward(5.7), turn(90), forward(2.8), turn(135), forward(2), turn(-45), forward(2.8), turn(-135), forward(3)]).
turtle_program(r1808, midline(6), [start(266, 274, 50.2), forward(7.8), turn(103.2), forward(2.2), turn(63.4), forward(5)]).
turtle_program(r1808, midline(7), [start(270, 282, 123.7), forward(3.6)]).
turtle_program(r1808, midline(8), [start(270, 259, 45), forward(2.8), turn(135), forward(3), turn(-45), forward(1.4), turn(-90), forward(1.4), turn(90), forward(1.4), turn(71.6), forward(2.2)]).
turtle_program(r1808, midline(9), [start(262, 264, 0), forward(2)]).
turtle_program(r1808, midline(10), [start(305, 225, -53.1), forward(5), turn(143.1), forward(2)]).
turtle_program(r1808, midline(11), [start(278, 246, 45), forward(2.8), turn(90), forward(1.4), turn(45), forward(1), turn(45), forward(1.4)]).
turtle_program(r1808, midline(12), [start(273, 252, 33.7), forward(3.6), turn(74.7), forward(3.2), turn(98.1), forward(4.5)]).
turtle_program(r1808, midline(13), [start(273, 259, 18.4), forward(3.2), turn(45), forward(4.5), turn(71.6), forward(5.7), turn(90), forward(5.7), turn(-146.3), forward(5.1), turn(124.5), forward(7.6), turn(-68.2), forward(2.8), turn(-90), forward(5.7), turn(-90), forward(2.8)]).
turtle_program(r1808, midline(14), [start(273, 269, 97.1), forward(8.1)]).
turtle_program(r1808, midline(15), [start(273, 265, -116.6), forward(2.2)]).
turtle_program(r1808, midline(16), [start(277, 253, -123.7), forward(3.6)]).
turtle_program(r1808, midline(17), [start(279, 253, 45), forward(4.2), turn(90), forward(2.8), turn(90), forward(4.2)]).
turtle_program(r1808, midline(18), [start(278, 251, -45), forward(1.4), turn(90), forward(1.4), turn(-45), forward(1), turn(-45), forward(1.4), turn(-90), forward(1.4), turn(63.4), forward(3.2), turn(-63.4), forward(2.8), turn(96.3), forward(6.4), turn(83.7), forward(1.4), turn(98.1), forward(5)]).
turtle_program(r1808, midline(19), [start(283, 246, 45), forward(1.4), turn(45), forward(2), turn(-123.7), forward(3.6), turn(-101.3), forward(2.8)]).
turtle_program(r1808, midline(20), [start(285, 250, 146.3), forward(3.6), turn(-82.9), forward(2.2)]).
turtle_program(r1808, midline(21), [start(286, 242, 45), forward(2.8), turn(71.6), forward(2.2)]).
turtle_program(r1808, midline(22), [start(280, 259, -166), forward(4.1)]).
turtle_program(r1808, midline(23), [start(289, 243, -111.8), forward(5.4)]).
turtle_program(r1808, midline(24), [start(290, 241, -45), forward(1.4), turn(-90), forward(2.8), turn(78.7), forward(3.6), turn(22.6), forward(7.2), turn(155.7), forward(9.4)]).
turtle_program(r3806, midline(1), [start(486, 336, 55.8), forward(30.2), turn(7.7), forward(60.4), turn(-10.9), forward(75.6)]).
turtle_program(r255, midline(1), [start(423, 80, -15.3), forward(11.4), turn(38.5), forward(7.6), turn(111.8), forward(11.3), turn(29.1), forward(7.3), turn(-40.4), forward(7.2)]).
turtle_program(r255, midline(2), [start(425, 97, -3.4), forward(17), turn(-33.5), forward(10), turn(-43.7), forward(6.1), turn(-54.5), forward(5.7), turn(-33.7), forward(5.1)]).
turtle_program(r2067, midline(1), [start(384, 218, 108.4), forward(9.5), turn(-52.1), forward(3.6), turn(-56.3), forward(5), turn(-45), forward(2.8), turn(-45), forward(7), turn(45), forward(5.7), turn(-90), forward(2.8), turn(-45), forward(5)]).
turtle_program(r2067, midline(2), [start(394, 216, -29.7), forward(8.1), turn(74.7), forward(9.9), turn(144.5), forward(12.2), turn(-54.5), forward(4.2), turn(-135), forward(4), turn(135), forward(2.8), turn(-45), forward(1), turn(-45), forward(7.1), turn(123.7), forward(10.2)]).
turtle_program(r2067, midline(3), [start(409, 218, -12.5), forward(9.2), turn(86.6), forward(7.3), turn(84.1), forward(5.4), turn(51.5), forward(8.1), turn(-74.7), forward(7.1), turn(90), forward(7.1), turn(-158.2), forward(7.6)]).
turtle_program(r306, midline(1), [start(354, 110, -36), forward(13.6)]).
turtle_program(r306, midline(2), [start(355, 96, -67.4), forward(13), turn(-32.1), forward(6.1), turn(60.8), forward(6.4), turn(155.2), forward(6.7)]).
turtle_program(r306, midline(3), [start(361, 84, 0), forward(7), turn(-135), forward(7.1), turn(78.7), forward(3.6), turn(122.3), forward(9.8), turn(-84.5), forward(3.2), turn(-110.2), forward(6.4), turn(38.7), forward(3), turn(-45), forward(4.2), turn(116.6), forward(3.2), turn(52.1), forward(3.6), turn(119.7), forward(2.2)]).
turtle_program(r306, midline(4), [start(373, 83, -63.4), forward(6.7), turn(-79.7), forward(5)]).
turtle_program(r306, midline(5), [start(384, 73, 156.8), forward(7.6)]).
turtle_program(r306, midline(6), [start(371, 87, 111), forward(13.9)]).
turtle_program(r7382, midline(1), [start(438, 766, 126.3), forward(18.6), turn(36.8), forward(24)]).
turtle_program(r647, midline(1), [start(414, 122, -95.7), forward(10), turn(-24), forward(8.1), turn(-60.3), forward(17)]).
turtle_program(r8569, midline(1), [start(445, 885, 180), forward(15)]).
turtle_program(r1259, midline(1), [start(352, 163, -90), forward(14)]).
turtle_program(r2970, midline(1), [start(617, 251, 90), forward(9)]).
turtle_program(r5383, midline(1), [start(238, 458, 18.4), forward(3.2)]).
turtle_program(r2850, midline(1), [start(408, 246, 0), forward(4)]).
turtle_program(r2801, midline(1), [start(591, 243, 0), forward(4)]).
turtle_program(r8579, midline(1), [start(343, 886, 90), forward(1)]).
turtle_program(r6308, midline(1), [start(95, 521, 0), forward(3)]).
turtle_program(r8568, midline(1), [start(383, 885, 153.4), forward(2.2)]).
