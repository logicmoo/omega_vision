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

region(r1, '#000000', 809, centroid(10,22)).
polygon(r1, [xy(0,0),xy(0,40),xy(28,40),xy(29,39),xy(28,38),xy(28,37),xy(25,34),xy(25,33),xy(17,25),xy(16,25),xy(15,24),xy(15,23),xy(13,21),xy(13,14),xy(14,13),xy(15,13),xy(16,12),xy(16,10),xy(17,9),xy(17,8),xy(18,7),xy(18,4),xy(17,3),xy(17,1),xy(16,0),xy(1,0),xy(0,0)]).
midline(r1, [xy(6,15),xy(6,20),xy(7,19),xy(7,13),xy(8,11),xy(8,8),xy(9,8),xy(9,9),xy(11,7)]).
midline(r1, [xy(7,20),xy(7,23),xy(8,23),xy(8,25),xy(10,29),xy(10,30),xy(11,30),xy(15,32),xy(17,32),xy(17,33),xy(18,33)]).
midline(r1, [xy(21,35),xy(25,37)]).
midline(r1, [xy(28,39)]).
fillpoint(r1, xy(11,30), 11).
fillpoint(r1, xy(10,30), 11).
fillpoint(r1, xy(10,29), 11).
fillpoint(r1, xy(13,31), 10).
fillpoint(r1, xy(12,31), 10).
region(r2, '#010100', 80, centroid(17,13)).
polygon(r2, [xy(14,14),xy(14,21),xy(15,21),xy(16,22),xy(16,24),xy(17,24),xy(18,23),xy(17,22),xy(17,14),xy(16,13),xy(17,12),xy(17,10),xy(18,9),xy(18,8),xy(19,7),xy(19,4),xy(18,3),xy(18,0),xy(20,0),xy(20,5),xy(21,6),xy(21,7),xy(20,8),xy(20,9),xy(19,10),xy(19,11),xy(18,12),xy(18,13),xy(14,14)]).
midline(r2, [xy(15,15),xy(15,20),xy(16,19),xy(16,14),xy(17,13),xy(18,11),xy(18,10),xy(19,9),xy(19,8),xy(20,7),xy(20,6)]).
midline(r2, [xy(16,20),xy(16,21),xy(17,23)]).
midline(r2, [xy(19,1),xy(19,3)]).
fillpoint(r2, xy(20,7), 2).
fillpoint(r2, xy(20,6), 2).
fillpoint(r2, xy(19,9), 2).
fillpoint(r2, xy(19,8), 2).
fillpoint(r2, xy(19,3), 2).
region(r3, '#030300', 262, centroid(25,18)).
polygon(r3, [xy(18,14),xy(18,22),xy(19,23),xy(19,25),xy(20,26),xy(23,23),xy(23,22),xy(22,21),xy(22,19),xy(23,18),xy(23,17),xy(24,16),xy(26,16),xy(27,15),xy(28,15),xy(30,13),xy(29,12),xy(29,7),xy(31,5),xy(31,4),xy(30,3),xy(27,6),xy(23,6),xy(21,4),xy(21,0),xy(23,0),xy(23,1),xy(22,2),xy(22,4),xy(21,5),xy(22,6),xy(22,7),xy(21,8),xy(21,9),xy(20,10),xy(20,11),xy(19,12),xy(19,13),xy(18,14)]).
midline(r3, [xy(20,18),xy(20,22),xy(21,22),xy(21,23),xy(20,25),xy(21,26),xy(23,27),xy(24,27),xy(24,28),xy(25,28),xy(25,29),xy(26,28),xy(26,30),xy(27,30),xy(27,33),xy(28,33),xy(28,34),xy(29,34)]).
midline(r3, [xy(21,16),xy(21,18)]).
midline(r3, [xy(22,1)]).
midline(r3, [xy(22,14),xy(23,13),xy(23,12),xy(24,11),xy(24,10),xy(25,10),xy(25,11),xy(24,12),xy(25,12)]).
midline(r3, [xy(27,26)]).
midline(r3, [xy(28,6),xy(29,5),xy(29,6),xy(30,5),xy(30,4)]).
midline(r3, [xy(28,13)]).
midline(r3, [xy(34,33),xy(35,32),xy(35,33)]).
fillpoint(r3, xy(25,12), 5).
fillpoint(r3, xy(25,11), 5).
fillpoint(r3, xy(25,10), 5).
fillpoint(r3, xy(24,12), 5).
fillpoint(r3, xy(24,11), 5).
region(r5, '#060600', 84, centroid(36,5)).
polygon(r5, [xy(24,2),xy(24,4),xy(25,3),xy(25,2),xy(27,0),xy(29,0),xy(29,1),xy(27,3),xy(28,3),xy(31,0),xy(31,1),xy(32,1),xy(32,3),xy(33,2),xy(33,3),xy(34,2),xy(34,3),xy(35,2),xy(35,1),xy(36,1),xy(37,2),xy(35,4),xy(36,4),xy(36,5),xy(37,5),xy(37,6),xy(38,6),xy(38,7),xy(40,5),xy(40,4),xy(42,4),xy(42,6),xy(41,7),xy(40,7),xy(39,8),xy(39,12),xy(38,13),xy(37,13),xy(37,14),xy(39,14),xy(41,12),xy(40,11),xy(41,10),xy(40,9),xy(41,9),xy(24,2)]).
midline(r5, [xy(26,2),xy(27,1),xy(27,2),xy(28,1)]).
midline(r5, [xy(35,3)]).
midline(r5, [xy(39,7),xy(41,5),xy(41,6)]).
midline(r5, [xy(39,13)]).
midline(r5, [xy(40,10)]).
fillpoint(r5, xy(41,6), 2).
fillpoint(r5, xy(41,5), 2).
fillpoint(r5, xy(40,10), 2).
fillpoint(r5, xy(40,6), 2).
fillpoint(r5, xy(39,13), 2).
region(r7, '#090902', 7, centroid(34,0)).
polygon(r7, [xy(32,0),xy(33,0),xy(33,1),xy(34,0),xy(34,1),xy(35,0),xy(36,0),xy(32,0)]).
fillpoint(r7, xy(36,0), 1).
fillpoint(r7, xy(35,0), 1).
fillpoint(r7, xy(34,1), 1).
fillpoint(r7, xy(34,0), 1).
fillpoint(r7, xy(33,1), 1).
region(r10, '#090902', 531, centroid(51,19)).
polygon(r10, [xy(36,22),xy(36,25),xy(37,24),xy(37,23),xy(38,22),xy(37,21),xy(37,19),xy(38,18),xy(37,17),xy(38,16),xy(38,17),xy(39,16),xy(39,15),xy(40,14),xy(41,14),xy(41,15),xy(40,16),xy(39,18),xy(40,19),xy(40,20),xy(41,19),xy(36,22)]).
hole(r10, [xy(43,8),xy(44,8),xy(45,7),xy(46,7),xy(47,8),xy(46,9),xy(47,9),xy(48,8),xy(48,7),xy(49,6),xy(49,7),xy(43,8)]).
hole(r10, [xy(43,11),xy(44,11),xy(43,11)]).
hole(r10, [xy(48,36),xy(49,36),xy(48,36)]).
hole(r10, [xy(54,19),xy(54,20),xy(54,19)]).
hole(r10, [xy(58,31),xy(59,31),xy(58,31)]).
midline(r10, [xy(37,22),xy(38,21),xy(38,19),xy(39,19),xy(39,20)]).
midline(r10, [xy(38,4),xy(39,3)]).
midline(r10, [xy(40,15),xy(42,14),xy(43,13),xy(45,12),xy(46,11),xy(47,11),xy(49,10),xy(50,9),xy(50,10),xy(53,7),xy(53,6),xy(52,5)]).
midline(r10, [xy(43,33),xy(43,34),xy(44,34)]).
midline(r10, [xy(44,1),xy(44,3),xy(45,4),xy(44,6)]).
midline(r10, [xy(44,31),xy(46,30),xy(48,30),xy(48,31),xy(49,30),xy(49,29),xy(50,28),xy(50,29),xy(51,28),xy(51,27),xy(52,26),xy(52,27),xy(53,26),xy(53,25),xy(54,25),xy(59,20)]).
midline(r10, [xy(47,5),xy(47,6)]).
midline(r10, [xy(49,38),xy(50,37),xy(51,37)]).
midline(r10, [xy(50,32),xy(50,33),xy(51,33),xy(51,34),xy(54,34),xy(55,33),xy(57,32),xy(57,33)]).
midline(r10, [xy(53,17)]).
midline(r10, [xy(53,21)]).
midline(r10, [xy(54,36)]).
midline(r10, [xy(55,9),xy(57,10),xy(58,11)]).
midline(r10, [xy(58,16),xy(59,17)]).
midline(r10, [xy(61,29)]).
midline(r10, [xy(63,17)]).
fillpoint(r10, xy(59,17), 7).
fillpoint(r10, xy(58,16), 7).
fillpoint(r10, xy(60,18), 6).
fillpoint(r10, xy(60,17), 6).
fillpoint(r10, xy(59,18), 6).
region(r11, '#050500', 8, centroid(49,1)).
polygon(r11, [xy(48,0),xy(49,0),xy(49,2),xy(48,3),xy(49,3),xy(50,1),xy(50,0),xy(48,0)]).
fillpoint(r11, xy(50,1), 1).
fillpoint(r11, xy(50,0), 1).
fillpoint(r11, xy(49,3), 1).
fillpoint(r11, xy(49,2), 1).
fillpoint(r11, xy(49,1), 1).
region(r16, '#615341', 14, centroid(57,2)).
polygon(r16, [xy(55,2),xy(57,0),xy(57,1),xy(59,3),xy(58,4),xy(57,4),xy(56,3),xy(55,2)]).
midline(r16, [xy(56,2),xy(57,2),xy(57,3),xy(58,3)]).
fillpoint(r16, xy(58,3), 2).
fillpoint(r16, xy(57,3), 2).
fillpoint(r16, xy(57,2), 2).
fillpoint(r16, xy(56,2), 2).
fillpoint(r16, xy(59,4), 1).
region(r18, '#f4deb6', 12, centroid(60,2)).
polygon(r18, [xy(59,0),xy(59,1),xy(60,0),xy(61,0),xy(61,1),xy(60,2),xy(60,4),xy(61,3),xy(61,4),xy(59,0)]).
midline(r18, [xy(60,1)]).
fillpoint(r18, xy(60,1), 2).
fillpoint(r18, xy(61,4), 1).
fillpoint(r18, xy(61,3), 1).
fillpoint(r18, xy(61,2), 1).
fillpoint(r18, xy(61,1), 1).
region(r19, '#b59d7e', 32, centroid(62,5)).
polygon(r19, [xy(58,5),xy(59,5),xy(59,6),xy(60,5),xy(61,5),xy(62,4),xy(62,0),xy(63,0),xy(63,8),xy(62,9),xy(60,7),xy(58,5)]).
midline(r19, [xy(60,6),xy(61,6),xy(61,7),xy(62,6),xy(62,8)]).
fillpoint(r19, xy(62,8), 2).
fillpoint(r19, xy(62,7), 2).
fillpoint(r19, xy(62,6), 2).
fillpoint(r19, xy(62,5), 2).
fillpoint(r19, xy(61,7), 2).
region(r20, '#f4deb6', 103, centroid(75,3)).
polygon(r20, [xy(64,1),xy(64,5),xy(67,5),xy(68,4),xy(67,3),xy(65,3),xy(65,1),xy(66,0),xy(66,1),xy(67,0),xy(69,0),xy(70,1),xy(69,2),xy(67,2),xy(64,1)]).
hole(r20, [xy(65,2),xy(66,2),xy(65,2)]).
hole(r20, [xy(68,3),xy(69,3),xy(69,4),xy(70,4),xy(68,3)]).
hole(r20, [xy(74,4),xy(75,4),xy(74,4)]).
hole(r20, [xy(77,3),xy(77,4),xy(79,4),xy(77,3)]).
hole(r20, [xy(80,3),xy(81,3),xy(81,4),xy(80,3)]).
hole(r20, [xy(83,3),xy(83,4),xy(84,4),xy(83,3)]).
midline(r20, [xy(65,4),xy(67,4)]).
midline(r20, [xy(67,1),xy(69,1)]).
midline(r20, [xy(73,1),xy(74,1),xy(74,2),xy(75,1),xy(75,2),xy(76,2)]).
midline(r20, [xy(76,5)]).
midline(r20, [xy(80,5),xy(82,5)]).
midline(r20, [xy(81,1),xy(82,1),xy(82,2)]).
fillpoint(r20, xy(82,5), 2).
fillpoint(r20, xy(82,2), 2).
fillpoint(r20, xy(82,1), 2).
fillpoint(r20, xy(81,1), 2).
fillpoint(r20, xy(80,5), 2).
region(r24, '#b59d7e', 5, centroid(78,1)).
polygon(r24, [xy(77,1),xy(78,0),xy(78,1),xy(79,0),xy(79,1),xy(77,1)]).
fillpoint(r24, xy(79,1), 1).
fillpoint(r24, xy(79,0), 1).
fillpoint(r24, xy(78,1), 1).
fillpoint(r24, xy(78,0), 1).
fillpoint(r24, xy(77,1), 1).
region(r26, '#f4deb6', 7, centroid(87,1)).
polygon(r26, [xy(86,2),xy(87,1),xy(87,0),xy(88,0),xy(88,1),xy(89,0),xy(86,2)]).
fillpoint(r26, xy(89,0), 1).
fillpoint(r26, xy(88,1), 1).
fillpoint(r26, xy(88,0), 1).
fillpoint(r26, xy(87,2), 1).
fillpoint(r26, xy(87,1), 1).
region(r27, '#b59d7e', 46, centroid(92,4)).
polygon(r27, [xy(88,2),xy(89,1),xy(89,2),xy(90,2),xy(90,5),xy(91,6),xy(91,8),xy(93,6),xy(94,7),xy(94,8),xy(95,7),xy(95,4),xy(91,0),xy(90,0),xy(91,2),xy(92,0),xy(95,0),xy(95,1),xy(94,2),xy(95,2),xy(88,2)]).
hole(r27, [xy(90,1),xy(91,1),xy(90,1)]).
hole(r27, [xy(93,1),xy(94,1),xy(93,1)]).
midline(r27, [xy(92,3),xy(92,5),xy(93,4),xy(94,6)]).
fillpoint(r27, xy(93,4), 3).
fillpoint(r27, xy(92,5), 3).
fillpoint(r27, xy(92,4), 3).
fillpoint(r27, xy(92,3), 3).
fillpoint(r27, xy(94,6), 2).
region(r30, '#060600', 6, centroid(47,2)).
polygon(r30, [xy(46,1),xy(46,2),xy(47,1),xy(47,2),xy(48,1),xy(48,2),xy(46,1)]).
fillpoint(r30, xy(48,2), 1).
fillpoint(r30, xy(48,1), 1).
fillpoint(r30, xy(47,2), 1).
fillpoint(r30, xy(47,1), 1).
fillpoint(r30, xy(46,2), 1).
region(r32, '#b59d7e', 5, centroid(72,2)).
polygon(r32, [xy(71,1),xy(71,2),xy(72,2),xy(72,3),xy(73,3),xy(71,1)]).
fillpoint(r32, xy(73,3), 1).
fillpoint(r32, xy(72,3), 1).
fillpoint(r32, xy(72,2), 1).
fillpoint(r32, xy(71,2), 1).
fillpoint(r32, xy(71,1), 1).
region(r37, '#050500', 12, centroid(25,4)).
polygon(r37, [xy(23,2),xy(23,5),xy(24,5),xy(25,4),xy(25,5),xy(26,4),xy(26,5),xy(27,4),xy(27,5),xy(28,4),xy(23,2)]).
fillpoint(r37, xy(28,4), 1).
fillpoint(r37, xy(27,5), 1).
fillpoint(r37, xy(27,4), 1).
fillpoint(r37, xy(26,5), 1).
fillpoint(r37, xy(26,4), 1).
region(r38, '#050500', 5, centroid(30,2)).
polygon(r38, [xy(29,2),xy(29,3),xy(30,2),xy(31,2),xy(31,3),xy(29,2)]).
fillpoint(r38, xy(31,3), 1).
fillpoint(r38, xy(31,2), 1).
fillpoint(r38, xy(30,2), 1).
fillpoint(r38, xy(29,3), 1).
fillpoint(r38, xy(29,2), 1).
region(r41, '#18130b', 4, centroid(55,3)).
polygon(r41, [xy(54,2),xy(54,3),xy(55,3),xy(55,4),xy(54,2)]).
fillpoint(r41, xy(55,4), 1).
fillpoint(r41, xy(55,3), 1).
fillpoint(r41, xy(54,3), 1).
fillpoint(r41, xy(54,2), 1).
region(r45, '#b59d7e', 4, centroid(69,4)).
polygon(r45, [xy(68,3),xy(69,3),xy(69,4),xy(70,4),xy(68,3)]).
fillpoint(r45, xy(70,4), 1).
fillpoint(r45, xy(69,4), 1).
fillpoint(r45, xy(69,3), 1).
fillpoint(r45, xy(68,3), 1).
region(r46, '#b59d7e', 4, centroid(78,4)).
polygon(r46, [xy(77,3),xy(77,4),xy(79,4),xy(77,3)]).
fillpoint(r46, xy(79,4), 1).
fillpoint(r46, xy(78,4), 1).
fillpoint(r46, xy(77,4), 1).
fillpoint(r46, xy(77,3), 1).
region(r49, '#b59d7e', 7, centroid(86,4)).
polygon(r49, [xy(85,5),xy(85,6),xy(87,4),xy(86,3),xy(87,3),xy(87,5),xy(85,5)]).
fillpoint(r49, xy(87,5), 1).
fillpoint(r49, xy(87,4), 1).
fillpoint(r49, xy(87,3), 1).
fillpoint(r49, xy(86,5), 1).
fillpoint(r49, xy(86,3), 1).
region(r50, '#615341', 5, centroid(89,4)).
polygon(r50, [xy(88,3),xy(88,4),xy(89,3),xy(89,5),xy(88,3)]).
fillpoint(r50, xy(89,5), 1).
fillpoint(r50, xy(89,4), 1).
fillpoint(r50, xy(89,3), 1).
fillpoint(r50, xy(88,4), 1).
fillpoint(r50, xy(88,3), 1).
region(r52, '#050500', 34, centroid(34,7)).
polygon(r52, [xy(30,7),xy(30,8),xy(31,7),xy(31,8),xy(33,6),xy(32,5),xy(32,4),xy(34,4),xy(37,7),xy(37,8),xy(36,9),xy(35,9),xy(34,10),xy(33,9),xy(32,9),xy(30,7)]).
midline(r52, [xy(32,8),xy(34,7),xy(34,8),xy(35,7),xy(33,5),xy(34,5)]).
fillpoint(r52, xy(35,7), 3).
fillpoint(r52, xy(34,8), 3).
fillpoint(r52, xy(34,7), 3).
fillpoint(r52, xy(36,8), 2).
fillpoint(r52, xy(36,7), 2).
region(r58, '#3c3026', 56, centroid(82,8)).
polygon(r58, [xy(72,7),xy(72,8),xy(73,7),xy(79,7),xy(80,8),xy(79,9),xy(73,9),xy(72,7)]).
midline(r58, [xy(73,8),xy(79,8)]).
midline(r58, [xy(85,8),xy(87,8),xy(88,6)]).
midline(r58, [xy(89,9)]).
fillpoint(r58, xy(87,8), 3).
fillpoint(r58, xy(89,9), 2).
fillpoint(r58, xy(88,9), 2).
fillpoint(r58, xy(88,8), 2).
fillpoint(r58, xy(88,7), 2).
region(r59, '#060600', 13, centroid(46,8)).
polygon(r59, [xy(43,8),xy(44,8),xy(45,7),xy(46,7),xy(47,8),xy(46,9),xy(45,9),xy(43,8)]).
midline(r59, [xy(45,8),xy(46,8)]).
fillpoint(r59, xy(46,8), 2).
fillpoint(r59, xy(45,8), 2).
fillpoint(r59, xy(49,7), 1).
fillpoint(r59, xy(49,6), 1).
fillpoint(r59, xy(48,8), 1).
region(r60, '#18130b', 19, centroid(61,11)).
polygon(r60, [xy(57,6),xy(57,7),xy(58,7),xy(58,8),xy(59,8),xy(59,9),xy(60,9),xy(60,10),xy(61,10),xy(61,11),xy(62,11),xy(62,13),xy(63,12),xy(63,13),xy(64,13),xy(64,14),xy(65,14),xy(65,15),xy(57,6)]).
fillpoint(r60, xy(65,15), 1).
fillpoint(r60, xy(65,14), 1).
fillpoint(r60, xy(64,14), 1).
fillpoint(r60, xy(64,13), 1).
fillpoint(r60, xy(63,13), 1).
region(r62, '#615341', 6, centroid(67,6)).
polygon(r62, [xy(64,6),xy(69,6),xy(64,6)]).
fillpoint(r62, xy(69,6), 1).
fillpoint(r62, xy(68,6), 1).
fillpoint(r62, xy(67,6), 1).
fillpoint(r62, xy(66,6), 1).
fillpoint(r62, xy(65,6), 1).
region(r63, '#b59d7e', 6, centroid(73,6)).
polygon(r63, [xy(70,6),xy(75,6),xy(70,6)]).
fillpoint(r63, xy(75,6), 1).
fillpoint(r63, xy(74,6), 1).
fillpoint(r63, xy(73,6), 1).
fillpoint(r63, xy(72,6), 1).
fillpoint(r63, xy(71,6), 1).
region(r68, '#3c3026', 15, centroid(65,8)).
polygon(r68, [xy(63,11),xy(64,10),xy(64,7),xy(65,7),xy(65,8),xy(66,7),xy(66,8),xy(67,7),xy(69,7),xy(69,8),xy(63,11)]).
fillpoint(r68, xy(69,8), 1).
fillpoint(r68, xy(69,7), 1).
fillpoint(r68, xy(68,7), 1).
fillpoint(r68, xy(67,7), 1).
fillpoint(r68, xy(66,8), 1).
region(r73, '#615341', 8, centroid(93,9)).
polygon(r73, [xy(91,9),xy(92,8),xy(92,9),xy(93,8),xy(93,9),xy(95,9),xy(91,9)]).
fillpoint(r73, xy(95,9), 1).
fillpoint(r73, xy(94,9), 1).
fillpoint(r73, xy(93,9), 1).
fillpoint(r73, xy(93,8), 1).
fillpoint(r73, xy(93,7), 1).
region(r76, '#615341', 42, centroid(68,11)).
polygon(r76, [xy(65,9),xy(65,13),xy(66,14),xy(67,13),xy(68,14),xy(67,15),xy(68,15),xy(69,14),xy(69,15),xy(70,13),xy(70,10),xy(68,8),xy(67,8),xy(66,9),xy(65,9)]).
midline(r76, [xy(66,13),xy(67,11),xy(67,10),xy(68,10),xy(68,12)]).
midline(r76, [xy(70,9)]).
fillpoint(r76, xy(68,12), 3).
fillpoint(r76, xy(68,11), 3).
fillpoint(r76, xy(68,10), 3).
fillpoint(r76, xy(67,11), 3).
fillpoint(r76, xy(67,10), 3).
region(r78, '#060600', 8, centroid(31,10)).
polygon(r78, [xy(30,9),xy(30,12),xy(31,10),xy(31,9),xy(32,10),xy(33,10),xy(30,9)]).
fillpoint(r78, xy(33,10), 1).
fillpoint(r78, xy(32,10), 1).
fillpoint(r78, xy(31,10), 1).
fillpoint(r78, xy(31,9), 1).
fillpoint(r78, xy(30,12), 1).
region(r79, '#030300', 34, centroid(34,13)).
polygon(r79, [xy(30,17),xy(31,17),xy(31,18),xy(32,17),xy(32,16),xy(33,15),xy(33,14),xy(31,12),xy(32,12),xy(33,11),xy(34,11),xy(35,10),xy(36,10),xy(37,9),xy(38,9),xy(38,10),xy(35,13),xy(35,14),xy(33,16),xy(33,17),xy(30,17)]).
midline(r79, [xy(33,12),xy(33,13),xy(34,12),xy(34,14),xy(35,12),xy(35,11),xy(36,11),xy(37,10)]).
fillpoint(r79, xy(37,10), 2).
fillpoint(r79, xy(36,11), 2).
fillpoint(r79, xy(35,12), 2).
fillpoint(r79, xy(35,11), 2).
fillpoint(r79, xy(34,14), 2).
region(r83, '#b59d7e', 67, centroid(79,12)).
polygon(r83, [xy(70,14),xy(70,15),xy(71,15),xy(72,14),xy(71,13),xy(71,10),xy(73,10),xy(74,11),xy(73,12),xy(74,13),xy(73,14),xy(73,15),xy(74,15),xy(74,16),xy(73,17),xy(74,17),xy(70,14)]).
midline(r83, [xy(71,14),xy(72,13),xy(72,11),xy(73,11),xy(73,13),xy(75,11)]).
midline(r83, [xy(82,11),xy(83,11)]).
fillpoint(r83, xy(83,11), 2).
fillpoint(r83, xy(82,11), 2).
fillpoint(r83, xy(75,11), 2).
fillpoint(r83, xy(73,13), 2).
fillpoint(r83, xy(73,11), 2).
region(r88, '#3c3026', 4, centroid(94,10)).
polygon(r88, [xy(93,10),xy(94,10),xy(94,11),xy(95,10),xy(93,10)]).
fillpoint(r88, xy(95,10), 1).
fillpoint(r88, xy(94,11), 1).
fillpoint(r88, xy(94,10), 1).
fillpoint(r88, xy(93,10), 1).
region(r92, '#060600', 9, centroid(54,12)).
polygon(r92, [xy(53,11),xy(53,14),xy(55,12),xy(54,11),xy(55,11),xy(53,11)]).
midline(r92, [xy(54,12)]).
fillpoint(r92, xy(54,12), 2).
fillpoint(r92, xy(55,12), 1).
fillpoint(r92, xy(55,11), 1).
fillpoint(r92, xy(54,13), 1).
fillpoint(r92, xy(54,11), 1).
region(r98, '#615341', 33, centroid(87,13)).
polygon(r98, [xy(76,12),xy(79,12),xy(79,13),xy(80,12),xy(80,13),xy(81,12),xy(81,13),xy(90,13),xy(90,14),xy(91,13),xy(92,13),xy(92,14),xy(91,15),xy(93,15),xy(94,14),xy(93,13),xy(95,13),xy(95,14),xy(94,15),xy(95,15),xy(76,12)]).
midline(r98, [xy(91,14)]).
fillpoint(r98, xy(91,14), 2).
fillpoint(r98, xy(95,15), 1).
fillpoint(r98, xy(95,14), 1).
fillpoint(r98, xy(95,13), 1).
fillpoint(r98, xy(94,15), 1).
region(r99, '#050500', 9, centroid(31,15)).
polygon(r99, [xy(29,15),xy(30,15),xy(30,16),xy(31,16),xy(32,15),xy(31,14),xy(31,13),xy(32,14),xy(29,15)]).
midline(r99, [xy(31,15)]).
fillpoint(r99, xy(31,15), 2).
fillpoint(r99, xy(32,15), 1).
fillpoint(r99, xy(32,14), 1).
fillpoint(r99, xy(31,16), 1).
fillpoint(r99, xy(31,14), 1).
region(r101, '#050500', 6, centroid(45,14)).
polygon(r101, [xy(44,14),xy(44,15),xy(45,14),xy(45,15),xy(46,14),xy(46,13),xy(44,14)]).
fillpoint(r101, xy(46,14), 1).
fillpoint(r101, xy(46,13), 1).
fillpoint(r101, xy(45,15), 1).
fillpoint(r101, xy(45,14), 1).
fillpoint(r101, xy(44,15), 1).
region(r102, '#060600', 31, centroid(46,16)).
polygon(r102, [xy(40,17),xy(40,18),xy(41,18),xy(42,17),xy(41,16),xy(42,16),xy(43,15),xy(43,16),xy(44,16),xy(44,18),xy(46,16),xy(47,16),xy(47,17),xy(49,15),xy(49,14),xy(48,13),xy(49,13),xy(50,15),xy(49,16),xy(50,16),xy(51,15),xy(51,16),xy(52,15),xy(40,17)]).
midline(r102, [xy(46,17)]).
fillpoint(r102, xy(46,17), 2).
fillpoint(r102, xy(52,15), 1).
fillpoint(r102, xy(51,16), 1).
fillpoint(r102, xy(51,15), 1).
fillpoint(r102, xy(50,16), 1).
region(r107, '#f4deb6', 133, centroid(84,19)).
polygon(r107, [xy(74,14),xy(75,14),xy(75,16),xy(78,16),xy(80,18),xy(80,19),xy(79,20),xy(79,21),xy(80,22),xy(81,22),xy(83,24),xy(90,24),xy(91,23),xy(91,19),xy(90,18),xy(90,16),xy(89,15),xy(84,15),xy(83,14),xy(76,14),xy(74,14)]).
midline(r107, [xy(76,15),xy(78,15),xy(82,17),xy(83,17),xy(84,19),xy(83,20),xy(84,20),xy(85,19),xy(85,20),xy(86,19),xy(86,20),xy(87,19),xy(87,20)]).
fillpoint(r107, xy(87,20), 5).
fillpoint(r107, xy(87,19), 5).
fillpoint(r107, xy(86,20), 5).
fillpoint(r107, xy(86,19), 5).
fillpoint(r107, xy(85,20), 5).
region(r108, '#b59d7e', 6, centroid(87,14)).
polygon(r108, [xy(84,14),xy(89,14),xy(84,14)]).
fillpoint(r108, xy(89,14), 1).
fillpoint(r108, xy(88,14), 1).
fillpoint(r108, xy(87,14), 1).
fillpoint(r108, xy(86,14), 1).
fillpoint(r108, xy(85,14), 1).
region(r110, '#050500', 81, centroid(30,22)).
polygon(r110, [xy(23,19),xy(23,21),xy(24,22),xy(24,23),xy(25,23),xy(26,24),xy(25,25),xy(26,25),xy(28,23),xy(27,22),xy(27,21),xy(24,18),xy(24,17),xy(25,17),xy(25,18),xy(23,19)]).
hole(r110, [xy(32,24),xy(32,25),xy(33,24),xy(33,25),xy(32,24)]).
midline(r110, [xy(24,19),xy(26,23),xy(27,23),xy(29,24),xy(30,23),xy(30,28),xy(31,28),xy(31,26)]).
midline(r110, [xy(34,18),xy(34,19),xy(35,19)]).
midline(r110, [xy(35,16)]).
fillpoint(r110, xy(25,21), 3).
fillpoint(r110, xy(35,19), 2).
fillpoint(r110, xy(35,16), 2).
fillpoint(r110, xy(34,19), 2).
fillpoint(r110, xy(34,18), 2).
region(r121, '#18130b', 57, centroid(63,23)).
polygon(r121, [xy(56,28),xy(56,30),xy(58,28),xy(57,27),xy(66,18),xy(67,18),xy(67,19),xy(65,21),xy(65,23),xy(62,26),xy(61,26),xy(59,28),xy(56,28)]).
midline(r121, [xy(57,28),xy(59,26),xy(59,27),xy(60,26),xy(60,25),xy(62,24),xy(63,23),xy(64,21),xy(66,19),xy(68,18)]).
fillpoint(r121, xy(63,23), 3).
fillpoint(r121, xy(62,24), 3).
fillpoint(r121, xy(68,18), 2).
fillpoint(r121, xy(66,19), 2).
fillpoint(r121, xy(65,20), 2).
region(r125, '#b59d7e', 23, centroid(93,20)).
polygon(r125, [xy(91,16),xy(91,18),xy(92,17),xy(93,18),xy(92,19),xy(92,23),xy(93,23),xy(94,22),xy(93,21),xy(94,20),xy(93,19),xy(94,18),xy(95,19),xy(95,22),xy(91,16)]).
midline(r125, [xy(92,18),xy(94,19),xy(94,21)]).
fillpoint(r125, xy(94,21), 2).
fillpoint(r125, xy(94,19), 2).
fillpoint(r125, xy(92,18), 2).
fillpoint(r125, xy(95,22), 1).
fillpoint(r125, xy(95,21), 1).
region(r129, '#060600', 28, centroid(29,20)).
polygon(r129, [xy(26,17),xy(26,19),xy(27,19),xy(27,20),xy(28,19),xy(31,19),xy(32,20),xy(33,20),xy(33,21),xy(32,22),xy(31,22),xy(30,21),xy(29,22),xy(28,21),xy(28,22),xy(26,17)]).
midline(r129, [xy(28,20),xy(29,20),xy(29,21),xy(30,20),xy(31,20),xy(31,21),xy(32,21)]).
fillpoint(r129, xy(32,21), 2).
fillpoint(r129, xy(31,21), 2).
fillpoint(r129, xy(31,20), 2).
fillpoint(r129, xy(30,20), 2).
fillpoint(r129, xy(29,21), 2).
region(r135, '#050500', 5, centroid(48,18)).
polygon(r135, [xy(47,18),xy(47,19),xy(48,18),xy(48,17),xy(49,17),xy(47,18)]).
fillpoint(r135, xy(49,17), 1).
fillpoint(r135, xy(48,18), 1).
fillpoint(r135, xy(48,17), 1).
fillpoint(r135, xy(47,19), 1).
fillpoint(r135, xy(47,18), 1).
region(r139, '#3c3026', 5, centroid(77,18)).
polygon(r139, [xy(76,17),xy(76,18),xy(77,18),xy(77,19),xy(78,18),xy(76,17)]).
fillpoint(r139, xy(78,18), 1).
fillpoint(r139, xy(77,19), 1).
fillpoint(r139, xy(77,18), 1).
fillpoint(r139, xy(76,18), 1).
fillpoint(r139, xy(76,17), 1).
region(r153, '#030300', 7, centroid(42,21)).
polygon(r153, [xy(41,22),xy(42,21),xy(42,23),xy(43,21),xy(43,19),xy(41,22)]).
fillpoint(r153, xy(43,21), 1).
fillpoint(r153, xy(43,20), 1).
fillpoint(r153, xy(43,19), 1).
fillpoint(r153, xy(42,23), 1).
fillpoint(r153, xy(42,22), 1).
region(r154, '#050500', 12, centroid(45,21)).
polygon(r154, [xy(43,22),xy(44,21),xy(44,19),xy(45,19),xy(45,20),xy(46,21),xy(45,22),xy(44,22),xy(45,23),xy(46,23),xy(43,22)]).
midline(r154, [xy(45,21)]).
fillpoint(r154, xy(45,21), 2).
fillpoint(r154, xy(46,23), 1).
fillpoint(r154, xy(46,21), 1).
fillpoint(r154, xy(45,23), 1).
fillpoint(r154, xy(45,22), 1).
region(r156, '#060600', 8, centroid(51,20)).
polygon(r156, [xy(49,20),xy(50,20),xy(51,19),xy(52,19),xy(52,20),xy(51,21),xy(51,22),xy(49,20)]).
midline(r156, [xy(51,20)]).
fillpoint(r156, xy(51,20), 2).
fillpoint(r156, xy(52,20), 1).
fillpoint(r156, xy(52,19), 1).
fillpoint(r156, xy(51,22), 1).
fillpoint(r156, xy(51,21), 1).
region(r158, '#090902', 29, centroid(68,22)).
polygon(r158, [xy(64,25),xy(65,24),xy(65,25),xy(66,24),xy(66,21),xy(67,20),xy(68,20),xy(69,19),xy(70,19),xy(71,20),xy(71,21),xy(69,23),xy(67,23),xy(69,24),xy(64,25)]).
midline(r158, [xy(67,21),xy(67,22),xy(69,21)]).
fillpoint(r158, xy(69,21), 3).
fillpoint(r158, xy(70,21), 2).
fillpoint(r158, xy(70,20), 2).
fillpoint(r158, xy(69,22), 2).
fillpoint(r158, xy(69,20), 2).
region(r159, '#060600', 4, centroid(73,20)).
polygon(r159, [xy(72,21),xy(73,20),xy(73,21),xy(72,21)]).
fillpoint(r159, xy(73,21), 1).
fillpoint(r159, xy(73,20), 1).
fillpoint(r159, xy(73,19), 1).
fillpoint(r159, xy(72,21), 1).
region(r160, '#615341', 12, centroid(77,21)).
polygon(r160, [xy(74,20),xy(75,19),xy(75,20),xy(76,19),xy(76,20),xy(77,20),xy(77,21),xy(78,21),xy(78,22),xy(79,22),xy(79,23),xy(80,23),xy(74,20)]).
fillpoint(r160, xy(80,23), 1).
fillpoint(r160, xy(79,23), 1).
fillpoint(r160, xy(79,22), 1).
fillpoint(r160, xy(78,22), 1).
fillpoint(r160, xy(78,21), 1).
region(r171, '#050500', 7, centroid(49,22)).
polygon(r171, [xy(47,22),xy(48,21),xy(48,22),xy(49,21),xy(49,23),xy(50,21),xy(47,22)]).
fillpoint(r171, xy(50,21), 1).
fillpoint(r171, xy(49,23), 1).
fillpoint(r171, xy(49,22), 1).
fillpoint(r171, xy(49,21), 1).
fillpoint(r171, xy(48,22), 1).
region(r174, '#3c3026', 186, centroid(74,33)).
polygon(r174, [xy(65,28),xy(66,27),xy(67,27),xy(68,26),xy(68,28),xy(67,29),xy(68,29),xy(68,33),xy(67,34),xy(67,39),xy(66,40),xy(69,40),xy(70,39),xy(69,38),xy(69,34),xy(71,32),xy(71,27),xy(69,25),xy(69,26),xy(70,25),xy(71,25),xy(72,26),xy(73,26),xy(74,25),xy(74,23),xy(75,23),xy(75,24),xy(76,23),xy(76,21),xy(77,22),xy(75,26),xy(77,26),xy(78,25),xy(81,28),xy(80,29),xy(77,29),xy(76,28),xy(74,28),xy(73,29),xy(73,30),xy(74,31),xy(74,32),xy(75,33),xy(75,34),xy(74,35),xy(75,36),xy(83,36),xy(83,37),xy(84,38),xy(84,39),xy(83,40),xy(70,40),xy(71,38),xy(72,37),xy(72,35),xy(71,34),xy(71,33),xy(65,28)]).
hole(r174, [xy(69,27),xy(69,33),xy(70,32),xy(70,27),xy(69,27)]).
midline(r174, [xy(66,28),xy(67,28)]).
midline(r174, [xy(68,34),xy(68,39),xy(71,39),xy(73,38),xy(74,37),xy(74,38),xy(82,38)]).
midline(r174, [xy(71,26),xy(72,27),xy(72,31),xy(73,31),xy(73,34)]).
midline(r174, [xy(73,27),xy(73,28),xy(74,27),xy(74,26),xy(75,27),xy(78,27),xy(80,28)]).
fillpoint(r174, xy(82,38), 3).
fillpoint(r174, xy(81,38), 3).
fillpoint(r174, xy(80,38), 3).
fillpoint(r174, xy(79,38), 3).
fillpoint(r174, xy(78,38), 3).
region(r175, '#060600', 56, centroid(39,28)).
polygon(r175, [xy(32,27),xy(33,27),xy(33,28),xy(34,27),xy(34,26),xy(35,25),xy(35,22),xy(32,27)]).
midline(r175, [xy(35,26)]).
midline(r175, [xy(38,27),xy(39,27),xy(39,28),xy(40,28),xy(40,31),xy(41,32)]).
midline(r175, [xy(42,28)]).
fillpoint(r175, xy(40,29), 3).
fillpoint(r175, xy(40,28), 3).
fillpoint(r175, xy(39,28), 3).
fillpoint(r175, xy(39,27), 3).
fillpoint(r175, xy(38,27), 3).
region(r188, '#050500', 15, centroid(44,25)).
polygon(r188, [xy(41,23),xy(41,24),xy(43,24),xy(43,27),xy(44,27),xy(45,26),xy(45,25),xy(44,24),xy(46,25),xy(47,25),xy(41,23)]).
midline(r188, [xy(44,25),xy(44,26)]).
fillpoint(r188, xy(44,26), 2).
fillpoint(r188, xy(44,25), 2).
fillpoint(r188, xy(47,25), 1).
fillpoint(r188, xy(46,25), 1).
fillpoint(r188, xy(45,26), 1).
region(r190, '#030300', 5, centroid(47,24)).
polygon(r190, [xy(45,24),xy(46,24),xy(47,23),xy(47,24),xy(48,23),xy(45,24)]).
fillpoint(r190, xy(48,23), 1).
fillpoint(r190, xy(47,24), 1).
fillpoint(r190, xy(47,23), 1).
fillpoint(r190, xy(46,24), 1).
fillpoint(r190, xy(45,24), 1).
region(r195, '#18130b', 4, centroid(73,24)).
polygon(r195, [xy(72,25),xy(73,24),xy(73,25),xy(72,25)]).
fillpoint(r195, xy(73,25), 1).
fillpoint(r195, xy(73,24), 1).
fillpoint(r195, xy(73,23), 1).
fillpoint(r195, xy(72,25), 1).
region(r196, '#615341', 5, centroid(76,24)).
polygon(r196, [xy(75,25),xy(76,25),xy(77,24),xy(77,25),xy(75,25)]).
fillpoint(r196, xy(77,25), 1).
fillpoint(r196, xy(77,24), 1).
fillpoint(r196, xy(77,23), 1).
fillpoint(r196, xy(76,25), 1).
fillpoint(r196, xy(75,25), 1).
region(r201, '#030300', 4, centroid(33,25)).
polygon(r201, [xy(32,24),xy(32,25),xy(33,24),xy(33,25),xy(32,24)]).
fillpoint(r201, xy(33,25), 1).
fillpoint(r201, xy(33,24), 1).
fillpoint(r201, xy(32,25), 1).
fillpoint(r201, xy(32,24), 1).
region(r207, '#b59d7e', 7, centroid(81,26)).
polygon(r207, [xy(80,24),xy(80,25),xy(81,25),xy(81,26),xy(82,26),xy(82,27),xy(83,27),xy(80,24)]).
fillpoint(r207, xy(83,27), 1).
fillpoint(r207, xy(82,27), 1).
fillpoint(r207, xy(82,26), 1).
fillpoint(r207, xy(81,26), 1).
fillpoint(r207, xy(81,25), 1).
region(r211, '#3c3026', 30, centroid(93,27)).
polygon(r211, [xy(88,29),xy(89,29),xy(94,24),xy(95,24),xy(95,27),xy(94,28),xy(93,28),xy(92,29),xy(91,29),xy(90,30),xy(88,29)]).
hole(r211, [xy(93,29),xy(94,29),xy(93,29)]).
midline(r211, [xy(90,29),xy(92,27),xy(92,28),xy(93,27),xy(93,26),xy(94,25),xy(94,27)]).
fillpoint(r211, xy(94,27), 2).
fillpoint(r211, xy(94,26), 2).
fillpoint(r211, xy(94,25), 2).
fillpoint(r211, xy(93,27), 2).
fillpoint(r211, xy(93,26), 2).
region(r217, '#615341', 5, centroid(83,25)).
polygon(r217, [xy(82,25),xy(83,25),xy(83,26),xy(84,25),xy(85,25),xy(82,25)]).
fillpoint(r217, xy(85,25), 1).
fillpoint(r217, xy(84,25), 1).
fillpoint(r217, xy(83,26), 1).
fillpoint(r217, xy(83,25), 1).
fillpoint(r217, xy(82,25), 1).
region(r218, '#b59d7e', 8, centroid(89,25)).
polygon(r218, [xy(86,25),xy(87,25),xy(87,26),xy(88,25),xy(90,25),xy(90,26),xy(91,25),xy(86,25)]).
fillpoint(r218, xy(91,25), 1).
fillpoint(r218, xy(90,26), 1).
fillpoint(r218, xy(90,25), 1).
fillpoint(r218, xy(89,25), 1).
fillpoint(r218, xy(88,25), 1).
region(r226, '#3c3026', 12, centroid(85,28)).
polygon(r226, [xy(84,26),xy(84,29),xy(86,29),xy(87,28),xy(85,26),xy(84,26)]).
midline(r226, [xy(85,27),xy(85,28),xy(86,28)]).
fillpoint(r226, xy(86,28), 2).
fillpoint(r226, xy(85,28), 2).
fillpoint(r226, xy(85,27), 2).
fillpoint(r226, xy(87,28), 1).
fillpoint(r226, xy(86,29), 1).
region(r234, '#615341', 22, centroid(70,32)).
polygon(r234, [xy(69,27),xy(69,33),xy(70,32),xy(70,27),xy(69,27)]).
fillpoint(r234, xy(71,37), 1).
fillpoint(r234, xy(71,36), 1).
fillpoint(r234, xy(71,35), 1).
fillpoint(r234, xy(70,38), 1).
fillpoint(r234, xy(70,37), 1).
region(r240, '#090902', 10, centroid(34,29)).
polygon(r240, [xy(32,30),xy(33,29),xy(33,30),xy(34,30),xy(35,29),xy(34,28),xy(36,28),xy(36,29),xy(32,30)]).
midline(r240, [xy(34,29)]).
fillpoint(r240, xy(34,29), 2).
fillpoint(r240, xy(36,29), 1).
fillpoint(r240, xy(36,28), 1).
fillpoint(r240, xy(35,29), 1).
fillpoint(r240, xy(35,28), 1).
region(r246, '#050500', 6, centroid(37,30)).
polygon(r246, [xy(36,30),xy(36,31),xy(37,30),xy(37,31),xy(38,31),xy(36,30)]).
fillpoint(r246, xy(38,31), 1).
fillpoint(r246, xy(37,31), 1).
fillpoint(r246, xy(37,30), 1).
fillpoint(r246, xy(37,29), 1).
fillpoint(r246, xy(36,31), 1).
region(r250, '#615341', 150, centroid(85,34)).
polygon(r250, [xy(74,29),xy(74,30),xy(75,29),xy(76,29),xy(77,30),xy(82,30),xy(83,31),xy(84,30),xy(86,30),xy(87,31),xy(88,30),xy(89,30),xy(90,31),xy(91,30),xy(92,30),xy(93,31),xy(91,33),xy(91,36),xy(94,39),xy(93,40),xy(88,40),xy(83,35),xy(77,35),xy(76,34),xy(75,35),xy(76,35),xy(76,33),xy(75,32),xy(75,31),xy(74,29)]).
hole(r250, [xy(86,37),xy(87,37),xy(87,38),xy(86,37)]).
midline(r250, [xy(75,30),xy(76,30),xy(77,32),xy(78,32),xy(78,33),xy(79,32),xy(79,33),xy(80,32),xy(80,33),xy(81,32),xy(81,33),xy(82,32),xy(82,33),xy(85,33),xy(85,34),xy(86,33),xy(88,33),xy(88,34),xy(89,36),xy(90,37),xy(90,38),xy(91,38),xy(93,39)]).
midline(r250, [xy(88,39)]).
midline(r250, [xy(91,31),xy(91,32),xy(92,31)]).
fillpoint(r250, xy(88,34), 4).
fillpoint(r250, xy(88,33), 4).
fillpoint(r250, xy(86,33), 4).
fillpoint(r250, xy(85,34), 4).
fillpoint(r250, xy(85,33), 4).
region(r261, '#615341', 5, centroid(67,31)).
polygon(r261, [xy(66,30),xy(67,30),xy(67,33),xy(66,30)]).
fillpoint(r261, xy(67,33), 1).
fillpoint(r261, xy(67,32), 1).
fillpoint(r261, xy(67,31), 1).
fillpoint(r261, xy(67,30), 1).
fillpoint(r261, xy(66,30), 1).
region(r265, '#050500', 5, centroid(30,32)).
polygon(r265, [xy(30,31),xy(30,33),xy(31,32),xy(31,33),xy(30,31)]).
fillpoint(r265, xy(31,33), 1).
fillpoint(r265, xy(31,32), 1).
fillpoint(r265, xy(30,33), 1).
fillpoint(r265, xy(30,32), 1).
fillpoint(r265, xy(30,31), 1).
region(r267, '#050500', 4, centroid(33,31)).
polygon(r267, [xy(32,31),xy(33,31),xy(33,32),xy(34,31),xy(32,31)]).
fillpoint(r267, xy(34,31), 1).
fillpoint(r267, xy(33,32), 1).
fillpoint(r267, xy(33,31), 1).
fillpoint(r267, xy(32,31), 1).
region(r272, '#f4deb6', 20, centroid(63,33)).
polygon(r272, [xy(61,33),xy(63,31),xy(65,31),xy(65,34),xy(63,36),xy(62,35),xy(62,34),xy(61,33)]).
midline(r272, [xy(63,33),xy(63,35)]).
fillpoint(r272, xy(63,33), 3).
fillpoint(r272, xy(64,34), 2).
fillpoint(r272, xy(64,33), 2).
fillpoint(r272, xy(64,32), 2).
fillpoint(r272, xy(63,35), 2).
region(r282, '#3c3026', 17, centroid(93,35)).
polygon(r282, [xy(92,33),xy(92,36),xy(93,37),xy(94,36),xy(94,35),xy(93,34),xy(94,33),xy(94,34),xy(95,33),xy(95,32),xy(92,33)]).
midline(r282, [xy(93,35),xy(93,36)]).
fillpoint(r282, xy(93,36), 2).
fillpoint(r282, xy(93,35), 2).
fillpoint(r282, xy(95,38), 1).
fillpoint(r282, xy(95,33), 1).
fillpoint(r282, xy(95,32), 1).
region(r292, '#090902', 5, centroid(36,35)).
polygon(r292, [xy(35,35),xy(35,36),xy(37,34),xy(37,35),xy(35,35)]).
fillpoint(r292, xy(37,35), 1).
fillpoint(r292, xy(37,34), 1).
fillpoint(r292, xy(36,35), 1).
fillpoint(r292, xy(35,36), 1).
fillpoint(r292, xy(35,35), 1).
region(r294, '#050500', 55, centroid(38,37)).
polygon(r294, [xy(29,36),xy(30,36),xy(30,37),xy(32,35),xy(32,36),xy(33,35),xy(33,37),xy(34,37),xy(34,39),xy(35,39),xy(36,38),xy(35,37),xy(36,37),xy(34,35),xy(29,36)]).
midline(r294, [xy(35,38)]).
midline(r294, [xy(38,39),xy(39,38),xy(39,36),xy(40,38),xy(39,39),xy(42,39),xy(43,38),xy(45,37)]).
fillpoint(r294, xy(45,37), 2).
fillpoint(r294, xy(43,38), 2).
fillpoint(r294, xy(42,39), 2).
fillpoint(r294, xy(41,39), 2).
fillpoint(r294, xy(40,39), 2).
region(r295, '#3c3026', 5, centroid(59,35)).
polygon(r295, [xy(58,34),xy(59,34),xy(59,36),xy(60,34),xy(58,34)]).
fillpoint(r295, xy(60,34), 1).
fillpoint(r295, xy(59,36), 1).
fillpoint(r295, xy(59,35), 1).
fillpoint(r295, xy(59,34), 1).
fillpoint(r295, xy(58,34), 1).
region(r297, '#615341', 19, centroid(65,38)).
polygon(r297, [xy(62,37),xy(63,37),xy(63,39),xy(64,40),xy(65,40),xy(66,39),xy(66,37),xy(65,36),xy(66,35),xy(66,36),xy(62,37)]).
midline(r297, [xy(64,38),xy(64,39),xy(65,38),xy(65,39)]).
fillpoint(r297, xy(65,39), 2).
fillpoint(r297, xy(65,38), 2).
fillpoint(r297, xy(65,37), 2).
fillpoint(r297, xy(64,39), 2).
fillpoint(r297, xy(64,38), 2).
region(r298, '#615341', 4, centroid(95,36)).
polygon(r298, [xy(95,34),xy(95,37),xy(95,34)]).
fillpoint(r298, xy(95,37), 1).
fillpoint(r298, xy(95,36), 1).
fillpoint(r298, xy(95,35), 1).
fillpoint(r298, xy(95,34), 1).
region(r304, '#18130b', 6, centroid(61,37)).
polygon(r304, [xy(60,35),xy(60,37),xy(61,37),xy(61,39),xy(60,35)]).
fillpoint(r304, xy(61,39), 1).
fillpoint(r304, xy(61,38), 1).
fillpoint(r304, xy(61,37), 1).
fillpoint(r304, xy(60,37), 1).
fillpoint(r304, xy(60,36), 1).
region(r308, '#060600', 4, centroid(37,37)).
polygon(r308, [xy(36,36),xy(37,36),xy(37,38),xy(36,36)]).
fillpoint(r308, xy(37,38), 1).
fillpoint(r308, xy(37,37), 1).
fillpoint(r308, xy(37,36), 1).
fillpoint(r308, xy(36,36), 1).
region(r309, '#060600', 6, centroid(42,36)).
polygon(r309, [xy(41,36),xy(41,37),xy(42,36),xy(42,37),xy(43,36),xy(44,36),xy(41,36)]).
fillpoint(r309, xy(44,36), 1).
fillpoint(r309, xy(43,36), 1).
fillpoint(r309, xy(42,37), 1).
fillpoint(r309, xy(42,36), 1).
fillpoint(r309, xy(41,37), 1).
region(r316, '#030300', 16, centroid(33,39)).
polygon(r316, [xy(30,38),xy(31,37),xy(32,37),xy(33,38),xy(33,39),xy(32,40),xy(31,39),xy(31,40),xy(37,40),xy(30,38)]).
midline(r316, [xy(31,38),xy(32,38),xy(32,39)]).
fillpoint(r316, xy(32,39), 2).
fillpoint(r316, xy(32,38), 2).
fillpoint(r316, xy(31,38), 2).
fillpoint(r316, xy(37,40), 1).
fillpoint(r316, xy(36,40), 1).
region(r320, '#615341', 18, centroid(57,39)).
polygon(r320, [xy(53,40),xy(54,39),xy(54,40),xy(55,39),xy(55,38),xy(56,37),xy(56,38),xy(57,37),xy(58,37),xy(58,38),xy(57,39),xy(57,40),xy(58,40),xy(59,39),xy(59,37),xy(53,40)]).
midline(r320, [xy(58,39)]).
fillpoint(r320, xy(58,39), 2).
fillpoint(r320, xy(59,39), 1).
fillpoint(r320, xy(59,38), 1).
fillpoint(r320, xy(59,37), 1).
fillpoint(r320, xy(58,40), 1).
region(r323, '#060600', 13, centroid(47,39)).
polygon(r323, [xy(44,39),xy(44,40),xy(46,38),xy(47,39),xy(46,40),xy(47,40),xy(48,39),xy(48,40),xy(49,40),xy(50,39),xy(50,40),xy(44,39)]).
midline(r323, [xy(46,39)]).
fillpoint(r323, xy(46,39), 2).
fillpoint(r323, xy(50,40), 1).
fillpoint(r323, xy(50,39), 1).
fillpoint(r323, xy(49,40), 1).
fillpoint(r323, xy(48,40), 1).
adjacent(r1, r2).
shared_edge(r1, r2, 37).
adjacent(r1, r219).
shared_edge(r1, r219, 2).
adjacent(r1, r230).
shared_edge(r1, r230, 2).
adjacent(r1, r239).
shared_edge(r1, r239, 2).
adjacent(r1, r244).
shared_edge(r1, r244, 2).
adjacent(r1, r253).
shared_edge(r1, r253, 2).
adjacent(r1, r264).
shared_edge(r1, r264, 2).
adjacent(r1, r274).
shared_edge(r1, r274, 2).
adjacent(r1, r290).
shared_edge(r1, r290, 2).
adjacent(r1, r299).
shared_edge(r1, r299, 2).
adjacent(r1, r3).
shared_edge(r1, r3, 3).
adjacent(r1, r315).
shared_edge(r1, r315, 1).
adjacent(r1, r316).
shared_edge(r1, r316, 1).
adjacent(r1, r322).
shared_edge(r1, r322, 2).
adjacent(r1, r329).
shared_edge(r1, r329, 2).
adjacent(r10, r101).
shared_edge(r10, r101, 5).
adjacent(r10, r102).
shared_edge(r10, r102, 22).
adjacent(r10, r105).
shared_edge(r10, r105, 2).
adjacent(r10, r11).
shared_edge(r10, r11, 4).
adjacent(r10, r110).
shared_edge(r10, r110, 1).
adjacent(r10, r112).
shared_edge(r10, r112, 2).
adjacent(r10, r114).
shared_edge(r10, r114, 1).
adjacent(r10, r119).
shared_edge(r10, r119, 2).
adjacent(r10, r12).
shared_edge(r10, r12, 2).
adjacent(r10, r121).
shared_edge(r10, r121, 40).
adjacent(r10, r13).
shared_edge(r10, r13, 2).
adjacent(r10, r131).
shared_edge(r10, r131, 4).
adjacent(r10, r132).
shared_edge(r10, r132, 3).
adjacent(r10, r135).
shared_edge(r10, r135, 3).
adjacent(r10, r147).
shared_edge(r10, r147, 2).
adjacent(r10, r156).
shared_edge(r10, r156, 12).
adjacent(r10, r157).
shared_edge(r10, r157, 6).
adjacent(r10, r162).
shared_edge(r10, r162, 3).
adjacent(r10, r163).
shared_edge(r10, r163, 2).
adjacent(r10, r165).
shared_edge(r10, r165, 1).
adjacent(r10, r168).
shared_edge(r10, r168, 2).
adjacent(r10, r171).
shared_edge(r10, r171, 1).
adjacent(r10, r174).
shared_edge(r10, r174, 1).
adjacent(r10, r175).
shared_edge(r10, r175, 23).
adjacent(r10, r176).
shared_edge(r10, r176, 2).
adjacent(r10, r188).
shared_edge(r10, r188, 1).
adjacent(r10, r191).
shared_edge(r10, r191, 2).
adjacent(r10, r202).
shared_edge(r10, r202, 3).
adjacent(r10, r221).
shared_edge(r10, r221, 3).
adjacent(r10, r222).
shared_edge(r10, r222, 1).
adjacent(r10, r231).
shared_edge(r10, r231, 2).
adjacent(r10, r232).
shared_edge(r10, r232, 2).
adjacent(r10, r241).
shared_edge(r10, r241, 4).
adjacent(r10, r247).
shared_edge(r10, r247, 2).
adjacent(r10, r248).
shared_edge(r10, r248, 1).
adjacent(r10, r255).
shared_edge(r10, r255, 2).
adjacent(r10, r256).
shared_edge(r10, r256, 2).
adjacent(r10, r257).
shared_edge(r10, r257, 4).
adjacent(r10, r258).
shared_edge(r10, r258, 2).
adjacent(r10, r268).
shared_edge(r10, r268, 3).
adjacent(r10, r269).
shared_edge(r10, r269, 2).
adjacent(r10, r270).
shared_edge(r10, r270, 6).
adjacent(r10, r271).
shared_edge(r10, r271, 1).
adjacent(r10, r278).
shared_edge(r10, r278, 2).
adjacent(r10, r279).
shared_edge(r10, r279, 1).
adjacent(r10, r287).
shared_edge(r10, r287, 4).
adjacent(r10, r288).
shared_edge(r10, r288, 1).
adjacent(r10, r294).
shared_edge(r10, r294, 1).
adjacent(r10, r295).
shared_edge(r10, r295, 3).
adjacent(r10, r30).
shared_edge(r10, r30, 6).
adjacent(r10, r300).
shared_edge(r10, r300, 5).
adjacent(r10, r301).
shared_edge(r10, r301, 2).
adjacent(r10, r302).
shared_edge(r10, r302, 1).
adjacent(r10, r309).
shared_edge(r10, r309, 4).
adjacent(r10, r310).
shared_edge(r10, r310, 6).
adjacent(r10, r311).
shared_edge(r10, r311, 1).
adjacent(r10, r317).
shared_edge(r10, r317, 3).
adjacent(r10, r318).
shared_edge(r10, r318, 3).
adjacent(r10, r319).
shared_edge(r10, r319, 2).
adjacent(r10, r323).
shared_edge(r10, r323, 7).
adjacent(r10, r324).
shared_edge(r10, r324, 1).
adjacent(r10, r325).
shared_edge(r10, r325, 1).
adjacent(r10, r330).
shared_edge(r10, r330, 1).
adjacent(r10, r331).
shared_edge(r10, r331, 1).
adjacent(r10, r40).
shared_edge(r10, r40, 5).
adjacent(r10, r41).
shared_edge(r10, r41, 5).
adjacent(r10, r5).
shared_edge(r10, r5, 43).
adjacent(r10, r53).
shared_edge(r10, r53, 4).
adjacent(r10, r56).
shared_edge(r10, r56, 2).
adjacent(r10, r59).
shared_edge(r10, r59, 22).
adjacent(r10, r60).
shared_edge(r10, r60, 19).
adjacent(r10, r74).
shared_edge(r10, r74, 4).
adjacent(r10, r80).
shared_edge(r10, r80, 2).
adjacent(r10, r91).
shared_edge(r10, r91, 6).
adjacent(r10, r92).
shared_edge(r10, r92, 13).
adjacent(r10, r96).
shared_edge(r10, r96, 4).
adjacent(r100, r111).
shared_edge(r100, r111, 1).
adjacent(r100, r5).
shared_edge(r100, r5, 2).
adjacent(r100, r79).
shared_edge(r100, r79, 3).
adjacent(r101, r102).
shared_edge(r101, r102, 3).
adjacent(r101, r103).
shared_edge(r101, r103, 3).
adjacent(r101, r120).
shared_edge(r101, r120, 1).
adjacent(r102, r103).
shared_edge(r102, r103, 3).
adjacent(r102, r104).
shared_edge(r102, r104, 2).
adjacent(r102, r105).
shared_edge(r102, r105, 1).
adjacent(r102, r113).
shared_edge(r102, r113, 2).
adjacent(r102, r120).
shared_edge(r102, r120, 3).
adjacent(r102, r132).
shared_edge(r102, r132, 1).
adjacent(r102, r133).
shared_edge(r102, r133, 4).
adjacent(r102, r134).
shared_edge(r102, r134, 5).
adjacent(r102, r135).
shared_edge(r102, r135, 5).
adjacent(r102, r146).
shared_edge(r102, r146, 3).
adjacent(r102, r153).
shared_edge(r102, r153, 1).
adjacent(r102, r154).
shared_edge(r102, r154, 1).
adjacent(r102, r155).
shared_edge(r102, r155, 1).
adjacent(r102, r164).
shared_edge(r102, r164, 1).
adjacent(r103, r104).
shared_edge(r103, r104, 1).
adjacent(r103, r113).
shared_edge(r103, r113, 1).
adjacent(r104, r113).
shared_edge(r104, r113, 1).
adjacent(r105, r92).
shared_edge(r105, r92, 1).
adjacent(r106, r76).
shared_edge(r106, r76, 4).
adjacent(r107, r108).
shared_edge(r107, r108, 7).
adjacent(r107, r116).
shared_edge(r107, r116, 2).
adjacent(r107, r125).
shared_edge(r107, r125, 9).
adjacent(r107, r138).
shared_edge(r107, r138, 1).
adjacent(r107, r139).
shared_edge(r107, r139, 1).
adjacent(r107, r140).
shared_edge(r107, r140, 1).
adjacent(r107, r141).
shared_edge(r107, r141, 2).
adjacent(r107, r151).
shared_edge(r107, r151, 4).
adjacent(r107, r160).
shared_edge(r107, r160, 4).
adjacent(r107, r166).
shared_edge(r107, r166, 1).
adjacent(r107, r198).
shared_edge(r107, r198, 2).
adjacent(r107, r209).
shared_edge(r107, r209, 2).
adjacent(r107, r210).
shared_edge(r107, r210, 1).
adjacent(r107, r217).
shared_edge(r107, r217, 3).
adjacent(r107, r218).
shared_edge(r107, r218, 6).
adjacent(r107, r83).
shared_edge(r107, r83, 9).
adjacent(r107, r98).
shared_edge(r107, r98, 5).
adjacent(r108, r98).
shared_edge(r108, r98, 7).
adjacent(r109, r98).
shared_edge(r109, r98, 4).
adjacent(r11, r30).
shared_edge(r11, r30, 4).
adjacent(r11, r40).
shared_edge(r11, r40, 3).
adjacent(r11, r53).
shared_edge(r11, r53, 2).
adjacent(r110, r111).
shared_edge(r110, r111, 2).
adjacent(r110, r119).
shared_edge(r110, r119, 1).
adjacent(r110, r129).
shared_edge(r110, r129, 22).
adjacent(r110, r131).
shared_edge(r110, r131, 4).
adjacent(r110, r162).
shared_edge(r110, r162, 3).
adjacent(r110, r175).
shared_edge(r110, r175, 12).
adjacent(r110, r201).
shared_edge(r110, r201, 8).
adjacent(r110, r240).
shared_edge(r110, r240, 1).
adjacent(r110, r245).
shared_edge(r110, r245, 2).
adjacent(r110, r266).
shared_edge(r110, r266, 1).
adjacent(r110, r3).
shared_edge(r110, r3, 29).
adjacent(r110, r79).
shared_edge(r110, r79, 8).
adjacent(r111, r112).
shared_edge(r111, r112, 1).
adjacent(r112, r119).
shared_edge(r112, r119, 1).
adjacent(r112, r5).
shared_edge(r112, r5, 2).
adjacent(r114, r60).
shared_edge(r114, r60, 1).
adjacent(r114, r76).
shared_edge(r114, r76, 2).
adjacent(r115, r123).
shared_edge(r115, r123, 1).
adjacent(r115, r83).
shared_edge(r115, r83, 3).
adjacent(r116, r98).
shared_edge(r116, r98, 2).
adjacent(r117, r118).
shared_edge(r117, r118, 1).
adjacent(r117, r129).
shared_edge(r117, r129, 2).
adjacent(r117, r3).
shared_edge(r117, r3, 3).
adjacent(r118, r130).
shared_edge(r118, r130, 1).
adjacent(r118, r99).
shared_edge(r118, r99, 2).
adjacent(r12, r13).
shared_edge(r12, r13, 1).
adjacent(r121, r122).
shared_edge(r121, r122, 3).
adjacent(r121, r136).
shared_edge(r121, r136, 2).
adjacent(r121, r137).
shared_edge(r121, r137, 1).
adjacent(r121, r158).
shared_edge(r121, r158, 17).
adjacent(r121, r256).
shared_edge(r121, r256, 1).
adjacent(r121, r76).
shared_edge(r121, r76, 2).
adjacent(r122, r123).
shared_edge(r122, r123, 1).
adjacent(r122, r76).
shared_edge(r122, r76, 1).
adjacent(r122, r83).
shared_edge(r122, r83, 1).
adjacent(r123, r124).
shared_edge(r123, r124, 1).
adjacent(r123, r136).
shared_edge(r123, r136, 1).
adjacent(r123, r137).
shared_edge(r123, r137, 1).
adjacent(r123, r83).
shared_edge(r123, r83, 1).
adjacent(r124, r83).
shared_edge(r124, r83, 3).
adjacent(r125, r126).
shared_edge(r125, r126, 2).
adjacent(r125, r142).
shared_edge(r125, r142, 3).
adjacent(r125, r152).
shared_edge(r125, r152, 2).
adjacent(r125, r167).
shared_edge(r125, r167, 4).
adjacent(r125, r185).
shared_edge(r125, r185, 4).
adjacent(r125, r199).
shared_edge(r125, r199, 3).
adjacent(r125, r210).
shared_edge(r125, r210, 2).
adjacent(r125, r98).
shared_edge(r125, r98, 1).
adjacent(r126, r127).
shared_edge(r126, r127, 1).
adjacent(r126, r98).
shared_edge(r126, r98, 1).
adjacent(r127, r128).
shared_edge(r127, r128, 1).
adjacent(r127, r142).
shared_edge(r127, r142, 1).
adjacent(r127, r98).
shared_edge(r127, r98, 1).
adjacent(r128, r142).
shared_edge(r128, r142, 1).
adjacent(r128, r143).
shared_edge(r128, r143, 1).
adjacent(r128, r98).
shared_edge(r128, r98, 2).
adjacent(r129, r130).
shared_edge(r129, r130, 1).
adjacent(r129, r144).
shared_edge(r129, r144, 6).
adjacent(r129, r145).
shared_edge(r129, r145, 1).
adjacent(r129, r3).
shared_edge(r129, r3, 1).
adjacent(r129, r79).
shared_edge(r129, r79, 1).
adjacent(r13, r14).
shared_edge(r13, r14, 2).
adjacent(r130, r144).
shared_edge(r130, r144, 1).
adjacent(r130, r79).
shared_edge(r130, r79, 1).
adjacent(r134, r153).
shared_edge(r134, r153, 1).
adjacent(r135, r147).
shared_edge(r135, r147, 2).
adjacent(r135, r155).
shared_edge(r135, r155, 1).
adjacent(r135, r165).
shared_edge(r135, r165, 1).
adjacent(r136, r137).
shared_edge(r136, r137, 1).
adjacent(r137, r148).
shared_edge(r137, r148, 1).
adjacent(r137, r158).
shared_edge(r137, r158, 1).
adjacent(r137, r83).
shared_edge(r137, r83, 1).
adjacent(r138, r139).
shared_edge(r138, r139, 1).
adjacent(r138, r150).
shared_edge(r138, r150, 1).
adjacent(r138, r83).
shared_edge(r138, r83, 1).
adjacent(r139, r140).
shared_edge(r139, r140, 2).
adjacent(r139, r141).
shared_edge(r139, r141, 1).
adjacent(r139, r150).
shared_edge(r139, r150, 1).
adjacent(r139, r151).
shared_edge(r139, r151, 1).
adjacent(r139, r160).
shared_edge(r139, r160, 3).
adjacent(r139, r161).
shared_edge(r139, r161, 2).
adjacent(r14, r15).
shared_edge(r14, r15, 1).
adjacent(r14, r31).
shared_edge(r14, r31, 2).
adjacent(r14, r41).
shared_edge(r14, r41, 1).
adjacent(r140, r141).
shared_edge(r140, r141, 1).
adjacent(r142, r143).
shared_edge(r142, r143, 1).
adjacent(r143, r152).
shared_edge(r143, r152, 1).
adjacent(r144, r145).
shared_edge(r144, r145, 1).
adjacent(r145, r79).
shared_edge(r145, r79, 2).
adjacent(r146, r154).
shared_edge(r146, r154, 1).
adjacent(r148, r149).
shared_edge(r148, r149, 1).
adjacent(r148, r159).
shared_edge(r148, r159, 1).
adjacent(r148, r83).
shared_edge(r148, r83, 1).
adjacent(r149, r150).
shared_edge(r149, r150, 1).
adjacent(r149, r159).
shared_edge(r149, r159, 1).
adjacent(r149, r160).
shared_edge(r149, r160, 2).
adjacent(r149, r83).
shared_edge(r149, r83, 1).
adjacent(r15, r16).
shared_edge(r15, r16, 2).
adjacent(r150, r160).
shared_edge(r150, r160, 1).
adjacent(r151, r161).
shared_edge(r151, r161, 1).
adjacent(r153, r154).
shared_edge(r153, r154, 5).
adjacent(r153, r164).
shared_edge(r153, r164, 2).
adjacent(r153, r169).
shared_edge(r153, r169, 2).
adjacent(r153, r177).
shared_edge(r153, r177, 1).
adjacent(r153, r188).
shared_edge(r153, r188, 3).
adjacent(r153, r189).
shared_edge(r153, r189, 1).
adjacent(r154, r155).
shared_edge(r154, r155, 3).
adjacent(r154, r170).
shared_edge(r154, r170, 1).
adjacent(r154, r178).
shared_edge(r154, r178, 3).
adjacent(r154, r189).
shared_edge(r154, r189, 3).
adjacent(r154, r190).
shared_edge(r154, r190, 3).
adjacent(r155, r165).
shared_edge(r155, r165, 1).
adjacent(r156, r171).
shared_edge(r156, r171, 3).
adjacent(r156, r179).
shared_edge(r156, r179, 1).
adjacent(r158, r159).
shared_edge(r158, r159, 4).
adjacent(r158, r174).
shared_edge(r158, r174, 1).
adjacent(r158, r180).
shared_edge(r158, r180, 2).
adjacent(r158, r192).
shared_edge(r158, r192, 2).
adjacent(r158, r203).
shared_edge(r158, r203, 2).
adjacent(r158, r204).
shared_edge(r158, r204, 2).
adjacent(r158, r205).
shared_edge(r158, r205, 1).
adjacent(r158, r213).
shared_edge(r158, r213, 2).
adjacent(r158, r222).
shared_edge(r158, r222, 1).
adjacent(r158, r223).
shared_edge(r158, r223, 1).
adjacent(r159, r160).
shared_edge(r159, r160, 1).
adjacent(r159, r172).
shared_edge(r159, r172, 1).
adjacent(r159, r181).
shared_edge(r159, r181, 1).
adjacent(r159, r182).
shared_edge(r159, r182, 1).
adjacent(r16, r17).
shared_edge(r16, r17, 3).
adjacent(r16, r18).
shared_edge(r16, r18, 2).
adjacent(r16, r19).
shared_edge(r16, r19, 2).
adjacent(r16, r31).
shared_edge(r16, r31, 2).
adjacent(r16, r41).
shared_edge(r16, r41, 3).
adjacent(r16, r42).
shared_edge(r16, r42, 2).
adjacent(r16, r54).
shared_edge(r16, r54, 2).
adjacent(r16, r57).
shared_edge(r16, r57, 1).
adjacent(r160, r166).
shared_edge(r160, r166, 2).
adjacent(r160, r172).
shared_edge(r160, r172, 1).
adjacent(r160, r173).
shared_edge(r160, r173, 1).
adjacent(r160, r174).
shared_edge(r160, r174, 4).
adjacent(r160, r197).
shared_edge(r160, r197, 2).
adjacent(r160, r198).
shared_edge(r160, r198, 1).
adjacent(r160, r206).
shared_edge(r160, r206, 1).
adjacent(r160, r207).
shared_edge(r160, r207, 1).
adjacent(r161, r166).
shared_edge(r161, r166, 1).
adjacent(r163, r164).
shared_edge(r163, r164, 1).
adjacent(r163, r169).
shared_edge(r163, r169, 1).
adjacent(r165, r170).
shared_edge(r165, r170, 1).
adjacent(r168, r169).
shared_edge(r168, r169, 1).
adjacent(r168, r177).
shared_edge(r168, r177, 1).
adjacent(r17, r18).
shared_edge(r17, r18, 2).
adjacent(r170, r171).
shared_edge(r170, r171, 2).
adjacent(r171, r178).
shared_edge(r171, r178, 1).
adjacent(r171, r179).
shared_edge(r171, r179, 2).
adjacent(r171, r190).
shared_edge(r171, r190, 3).
adjacent(r171, r191).
shared_edge(r171, r191, 1).
adjacent(r171, r202).
shared_edge(r171, r202, 1).
adjacent(r172, r173).
shared_edge(r172, r173, 1).
adjacent(r172, r183).
shared_edge(r172, r183, 1).
adjacent(r173, r174).
shared_edge(r173, r174, 1).
adjacent(r173, r184).
shared_edge(r173, r184, 1).
adjacent(r174, r183).
shared_edge(r174, r183, 1).
adjacent(r174, r184).
shared_edge(r174, r184, 2).
adjacent(r174, r193).
shared_edge(r174, r193, 1).
adjacent(r174, r195).
shared_edge(r174, r195, 6).
adjacent(r174, r196).
shared_edge(r174, r196, 10).
adjacent(r174, r205).
shared_edge(r174, r205, 1).
adjacent(r174, r206).
shared_edge(r174, r206, 1).
adjacent(r174, r215).
shared_edge(r174, r215, 2).
adjacent(r174, r216).
shared_edge(r174, r216, 2).
adjacent(r174, r223).
shared_edge(r174, r223, 1).
adjacent(r174, r224).
shared_edge(r174, r224, 2).
adjacent(r174, r225).
shared_edge(r174, r225, 2).
adjacent(r174, r233).
shared_edge(r174, r233, 2).
adjacent(r174, r234).
shared_edge(r174, r234, 30).
adjacent(r174, r235).
shared_edge(r174, r235, 2).
adjacent(r174, r242).
shared_edge(r174, r242, 3).
adjacent(r174, r249).
shared_edge(r174, r249, 2).
adjacent(r174, r250).
shared_edge(r174, r250, 37).
adjacent(r174, r261).
shared_edge(r174, r261, 7).
adjacent(r174, r297).
shared_edge(r174, r297, 8).
adjacent(r175, r186).
shared_edge(r175, r186, 1).
adjacent(r175, r187).
shared_edge(r175, r187, 3).
adjacent(r175, r188).
shared_edge(r175, r188, 7).
adjacent(r175, r220).
shared_edge(r175, r220, 4).
adjacent(r175, r240).
shared_edge(r175, r240, 6).
adjacent(r175, r246).
shared_edge(r175, r246, 5).
adjacent(r175, r277).
shared_edge(r175, r277, 2).
adjacent(r175, r286).
shared_edge(r175, r286, 2).
adjacent(r175, r294).
shared_edge(r175, r294, 1).
adjacent(r176, r177).
shared_edge(r176, r177, 1).
adjacent(r176, r186).
shared_edge(r176, r186, 1).
adjacent(r177, r187).
shared_edge(r177, r187, 1).
adjacent(r179, r191).
shared_edge(r179, r191, 1).
adjacent(r18, r19).
shared_edge(r18, r19, 7).
adjacent(r18, r42).
shared_edge(r18, r42, 2).
adjacent(r180, r181).
shared_edge(r180, r181, 1).
adjacent(r180, r193).
shared_edge(r180, r193, 1).
adjacent(r181, r182).
shared_edge(r181, r182, 1).
adjacent(r181, r194).
shared_edge(r181, r194, 1).
adjacent(r182, r183).
shared_edge(r182, r183, 1).
adjacent(r182, r195).
shared_edge(r182, r195, 1).
adjacent(r183, r184).
shared_edge(r183, r184, 1).
adjacent(r186, r187).
shared_edge(r186, r187, 2).
adjacent(r187, r188).
shared_edge(r187, r188, 2).
adjacent(r188, r189).
shared_edge(r188, r189, 2).
adjacent(r188, r190).
shared_edge(r188, r190, 4).
adjacent(r188, r221).
shared_edge(r188, r221, 3).
adjacent(r188, r231).
shared_edge(r188, r231, 2).
adjacent(r19, r20).
shared_edge(r19, r20, 8).
adjacent(r19, r57).
shared_edge(r19, r57, 1).
adjacent(r19, r61).
shared_edge(r19, r61, 2).
adjacent(r19, r62).
shared_edge(r19, r62, 1).
adjacent(r19, r67).
shared_edge(r19, r67, 2).
adjacent(r19, r68).
shared_edge(r19, r68, 3).
adjacent(r19, r75).
shared_edge(r19, r75, 2).
adjacent(r19, r81).
shared_edge(r19, r81, 2).
adjacent(r19, r82).
shared_edge(r19, r82, 2).
adjacent(r190, r202).
shared_edge(r190, r202, 2).
adjacent(r192, r193).
shared_edge(r192, r193, 1).
adjacent(r192, r205).
shared_edge(r192, r205, 1).
adjacent(r193, r194).
shared_edge(r193, r194, 2).
adjacent(r193, r195).
shared_edge(r193, r195, 2).
adjacent(r193, r205).
shared_edge(r193, r205, 1).
adjacent(r194, r195).
shared_edge(r194, r195, 1).
adjacent(r196, r197).
shared_edge(r196, r197, 1).
adjacent(r196, r206).
shared_edge(r196, r206, 1).
adjacent(r197, r206).
shared_edge(r197, r206, 1).
adjacent(r198, r208).
shared_edge(r198, r208, 1).
adjacent(r199, r211).
shared_edge(r199, r211, 2).
adjacent(r2, r3).
shared_edge(r2, r3, 32).
adjacent(r20, r21).
shared_edge(r20, r21, 2).
adjacent(r20, r23).
shared_edge(r20, r23, 2).
adjacent(r20, r24).
shared_edge(r20, r24, 8).
adjacent(r20, r25).
shared_edge(r20, r25, 1).
adjacent(r20, r32).
shared_edge(r20, r32, 11).
adjacent(r20, r33).
shared_edge(r20, r33, 3).
adjacent(r20, r43).
shared_edge(r20, r43, 6).
adjacent(r20, r44).
shared_edge(r20, r44, 2).
adjacent(r20, r45).
shared_edge(r20, r45, 10).
adjacent(r20, r46).
shared_edge(r20, r46, 10).
adjacent(r20, r47).
shared_edge(r20, r47, 8).
adjacent(r20, r48).
shared_edge(r20, r48, 8).
adjacent(r20, r49).
shared_edge(r20, r49, 7).
adjacent(r20, r55).
shared_edge(r20, r55, 6).
adjacent(r20, r58).
shared_edge(r20, r58, 3).
adjacent(r20, r62).
shared_edge(r20, r62, 6).
adjacent(r20, r63).
shared_edge(r20, r63, 7).
adjacent(r20, r64).
shared_edge(r20, r64, 3).
adjacent(r20, r70).
shared_edge(r20, r70, 1).
adjacent(r20, r71).
shared_edge(r20, r71, 1).
adjacent(r20, r72).
shared_edge(r20, r72, 3).
adjacent(r200, r3).
shared_edge(r200, r3, 4).
adjacent(r203, r204).
shared_edge(r203, r204, 1).
adjacent(r203, r214).
shared_edge(r203, r214, 1).
adjacent(r204, r215).
shared_edge(r204, r215, 1).
adjacent(r206, r207).
shared_edge(r206, r207, 1).
adjacent(r206, r216).
shared_edge(r206, r216, 1).
adjacent(r207, r208).
shared_edge(r207, r208, 2).
adjacent(r207, r216).
shared_edge(r207, r216, 1).
adjacent(r207, r217).
shared_edge(r207, r217, 4).
adjacent(r207, r225).
shared_edge(r207, r225, 2).
adjacent(r207, r226).
shared_edge(r207, r226, 1).
adjacent(r207, r235).
shared_edge(r207, r235, 2).
adjacent(r207, r242).
shared_edge(r207, r242, 2).
adjacent(r208, r209).
shared_edge(r208, r209, 1).
adjacent(r209, r217).
shared_edge(r209, r217, 1).
adjacent(r21, r22).
shared_edge(r21, r22, 1).
adjacent(r210, r211).
shared_edge(r210, r211, 4).
adjacent(r210, r218).
shared_edge(r210, r218, 1).
adjacent(r211, r229).
shared_edge(r211, r229, 2).
adjacent(r211, r238).
shared_edge(r211, r238, 2).
adjacent(r211, r243).
shared_edge(r211, r243, 3).
adjacent(r211, r250).
shared_edge(r211, r250, 11).
adjacent(r211, r251).
shared_edge(r211, r251, 1).
adjacent(r211, r252).
shared_edge(r211, r252, 6).
adjacent(r212, r3).
shared_edge(r212, r3, 4).
adjacent(r213, r214).
shared_edge(r213, r214, 1).
adjacent(r213, r223).
shared_edge(r213, r223, 1).
adjacent(r214, r215).
shared_edge(r214, r215, 1).
adjacent(r214, r224).
shared_edge(r214, r224, 1).
adjacent(r217, r218).
shared_edge(r217, r218, 1).
adjacent(r217, r226).
shared_edge(r217, r226, 3).
adjacent(r218, r227).
shared_edge(r218, r227, 2).
adjacent(r218, r228).
shared_edge(r218, r228, 4).
adjacent(r218, r229).
shared_edge(r218, r229, 2).
adjacent(r218, r236).
shared_edge(r218, r236, 1).
adjacent(r218, r238).
shared_edge(r218, r238, 1).
adjacent(r219, r3).
shared_edge(r219, r3, 2).
adjacent(r22, r23).
shared_edge(r22, r23, 1).
adjacent(r22, r32).
shared_edge(r22, r32, 1).
adjacent(r222, r223).
shared_edge(r222, r223, 1).
adjacent(r222, r232).
shared_edge(r222, r232, 1).
adjacent(r223, r224).
shared_edge(r223, r224, 1).
adjacent(r223, r233).
shared_edge(r223, r233, 1).
adjacent(r226, r227).
shared_edge(r226, r227, 2).
adjacent(r226, r236).
shared_edge(r226, r236, 2).
adjacent(r226, r242).
shared_edge(r226, r242, 2).
adjacent(r226, r243).
shared_edge(r226, r243, 1).
adjacent(r226, r250).
shared_edge(r226, r250, 3).
adjacent(r226, r251).
shared_edge(r226, r251, 2).
adjacent(r228, r237).
shared_edge(r228, r237, 2).
adjacent(r230, r3).
shared_edge(r230, r3, 2).
adjacent(r232, r233).
shared_edge(r232, r233, 1).
adjacent(r236, r237).
shared_edge(r236, r237, 1).
adjacent(r237, r238).
shared_edge(r237, r238, 1).
adjacent(r237, r243).
shared_edge(r237, r243, 2).
adjacent(r239, r3).
shared_edge(r239, r3, 2).
adjacent(r240, r245).
shared_edge(r240, r245, 2).
adjacent(r240, r246).
shared_edge(r240, r246, 2).
adjacent(r240, r254).
shared_edge(r240, r254, 2).
adjacent(r240, r267).
shared_edge(r240, r267, 3).
adjacent(r242, r262).
shared_edge(r242, r262, 1).
adjacent(r244, r3).
shared_edge(r244, r3, 2).
adjacent(r246, r254).
shared_edge(r246, r254, 1).
adjacent(r246, r276).
shared_edge(r246, r276, 1).
adjacent(r246, r3).
shared_edge(r246, r3, 3).
adjacent(r247, r248).
shared_edge(r247, r248, 1).
adjacent(r247, r259).
shared_edge(r247, r259, 1).
adjacent(r248, r249).
shared_edge(r248, r249, 1).
adjacent(r248, r259).
shared_edge(r248, r259, 1).
adjacent(r249, r260).
shared_edge(r249, r260, 1).
adjacent(r25, r26).
shared_edge(r25, r26, 3).
adjacent(r25, r34).
shared_edge(r25, r34, 2).
adjacent(r250, r262).
shared_edge(r250, r262, 3).
adjacent(r250, r263).
shared_edge(r250, r263, 3).
adjacent(r250, r280).
shared_edge(r250, r280, 2).
adjacent(r250, r281).
shared_edge(r250, r281, 1).
adjacent(r250, r282).
shared_edge(r250, r282, 12).
adjacent(r250, r321).
shared_edge(r250, r321, 8).
adjacent(r251, r263).
shared_edge(r251, r263, 1).
adjacent(r253, r3).
shared_edge(r253, r3, 2).
adjacent(r254, r3).
shared_edge(r254, r3, 1).
adjacent(r255, r256).
shared_edge(r255, r256, 1).
adjacent(r255, r269).
shared_edge(r255, r269, 1).
adjacent(r258, r259).
shared_edge(r258, r259, 1).
adjacent(r258, r271).
shared_edge(r258, r271, 1).
adjacent(r259, r260).
shared_edge(r259, r260, 1).
adjacent(r259, r272).
shared_edge(r259, r272, 2).
adjacent(r26, r27).
shared_edge(r26, r27, 5).
adjacent(r26, r44).
shared_edge(r26, r44, 1).
adjacent(r26, r49).
shared_edge(r26, r49, 2).
adjacent(r260, r261).
shared_edge(r260, r261, 1).
adjacent(r260, r272).
shared_edge(r260, r272, 1).
adjacent(r261, r273).
shared_edge(r261, r273, 4).
adjacent(r264, r3).
shared_edge(r264, r3, 2).
adjacent(r265, r266).
shared_edge(r265, r266, 2).
adjacent(r265, r275).
shared_edge(r265, r275, 1).
adjacent(r265, r3).
shared_edge(r265, r3, 7).
adjacent(r266, r267).
shared_edge(r266, r267, 1).
adjacent(r267, r275).
shared_edge(r267, r275, 2).
adjacent(r267, r3).
shared_edge(r267, r3, 4).
adjacent(r268, r269).
shared_edge(r268, r269, 1).
adjacent(r27, r35).
shared_edge(r27, r35, 6).
adjacent(r27, r36).
shared_edge(r27, r36, 6).
adjacent(r27, r50).
shared_edge(r27, r50, 5).
adjacent(r27, r51).
shared_edge(r27, r51, 3).
adjacent(r27, r66).
shared_edge(r27, r66, 4).
adjacent(r27, r73).
shared_edge(r27, r73, 9).
adjacent(r271, r272).
shared_edge(r271, r272, 2).
adjacent(r272, r273).
shared_edge(r272, r273, 3).
adjacent(r272, r279).
shared_edge(r272, r279, 2).
adjacent(r272, r288).
shared_edge(r272, r288, 1).
adjacent(r272, r296).
shared_edge(r272, r296, 2).
adjacent(r272, r297).
shared_edge(r272, r297, 2).
adjacent(r272, r305).
shared_edge(r272, r305, 1).
adjacent(r272, r306).
shared_edge(r272, r306, 2).
adjacent(r272, r313).
shared_edge(r272, r313, 2).
adjacent(r272, r314).
shared_edge(r272, r314, 2).
adjacent(r273, r297).
shared_edge(r273, r297, 1).
adjacent(r274, r3).
shared_edge(r274, r3, 2).
adjacent(r275, r3).
shared_edge(r275, r3, 1).
adjacent(r276, r277).
shared_edge(r276, r277, 1).
adjacent(r276, r284).
shared_edge(r276, r284, 1).
adjacent(r276, r3).
shared_edge(r276, r3, 1).
adjacent(r277, r285).
shared_edge(r277, r285, 1).
adjacent(r278, r279).
shared_edge(r278, r279, 1).
adjacent(r278, r288).
shared_edge(r278, r288, 1).
adjacent(r28, r3).
shared_edge(r28, r3, 3).
adjacent(r28, r5).
shared_edge(r28, r5, 3).
adjacent(r280, r281).
shared_edge(r280, r281, 1).
adjacent(r280, r289).
shared_edge(r280, r289, 1).
adjacent(r281, r282).
shared_edge(r281, r282, 2).
adjacent(r282, r289).
shared_edge(r282, r289, 3).
adjacent(r282, r298).
shared_edge(r282, r298, 6).
adjacent(r283, r284).
shared_edge(r283, r284, 1).
adjacent(r283, r292).
shared_edge(r283, r292, 1).
adjacent(r283, r3).
shared_edge(r283, r3, 2).
adjacent(r284, r285).
shared_edge(r284, r285, 1).
adjacent(r284, r293).
shared_edge(r284, r293, 1).
adjacent(r285, r286).
shared_edge(r285, r286, 1).
adjacent(r285, r294).
shared_edge(r285, r294, 1).
adjacent(r286, r294).
shared_edge(r286, r294, 1).
adjacent(r288, r295).
shared_edge(r288, r295, 1).
adjacent(r29, r5).
shared_edge(r29, r5, 3).
adjacent(r29, r8).
shared_edge(r29, r8, 1).
adjacent(r290, r3).
shared_edge(r290, r3, 2).
adjacent(r291, r292).
shared_edge(r291, r292, 2).
adjacent(r291, r3).
shared_edge(r291, r3, 2).
adjacent(r292, r293).
shared_edge(r292, r293, 2).
adjacent(r292, r294).
shared_edge(r292, r294, 2).
adjacent(r292, r3).
shared_edge(r292, r3, 1).
adjacent(r292, r307).
shared_edge(r292, r307, 1).
adjacent(r292, r308).
shared_edge(r292, r308, 3).
adjacent(r293, r294).
shared_edge(r293, r294, 3).
adjacent(r294, r3).
shared_edge(r294, r3, 8).
adjacent(r294, r300).
shared_edge(r294, r300, 3).
adjacent(r294, r307).
shared_edge(r294, r307, 3).
adjacent(r294, r308).
shared_edge(r294, r308, 7).
adjacent(r294, r309).
shared_edge(r294, r309, 8).
adjacent(r294, r315).
shared_edge(r294, r315, 2).
adjacent(r294, r316).
shared_edge(r294, r316, 13).
adjacent(r294, r317).
shared_edge(r294, r317, 1).
adjacent(r294, r323).
shared_edge(r294, r323, 6).
adjacent(r295, r296).
shared_edge(r295, r296, 1).
adjacent(r295, r303).
shared_edge(r295, r303, 3).
adjacent(r295, r304).
shared_edge(r295, r304, 3).
adjacent(r295, r320).
shared_edge(r295, r320, 1).
adjacent(r296, r305).
shared_edge(r296, r305, 1).
adjacent(r297, r304).
shared_edge(r297, r304, 1).
adjacent(r297, r306).
shared_edge(r297, r306, 2).
adjacent(r297, r313).
shared_edge(r297, r313, 1).
adjacent(r297, r314).
shared_edge(r297, r314, 2).
adjacent(r297, r328).
shared_edge(r297, r328, 3).
adjacent(r297, r341).
shared_edge(r297, r341, 2).
adjacent(r299, r3).
shared_edge(r299, r3, 2).
adjacent(r3, r37).
shared_edge(r3, r37, 13).
adjacent(r3, r38).
shared_edge(r3, r38, 5).
adjacent(r3, r4).
shared_edge(r3, r4, 1).
adjacent(r3, r52).
shared_edge(r3, r52, 9).
adjacent(r3, r78).
shared_edge(r3, r78, 5).
adjacent(r3, r99).
shared_edge(r3, r99, 5).
adjacent(r301, r302).
shared_edge(r301, r302, 1).
adjacent(r301, r311).
shared_edge(r301, r311, 1).
adjacent(r302, r303).
shared_edge(r302, r303, 2).
adjacent(r303, r311).
shared_edge(r303, r311, 1).
adjacent(r303, r320).
shared_edge(r303, r320, 2).
adjacent(r304, r305).
shared_edge(r304, r305, 1).
adjacent(r304, r312).
shared_edge(r304, r312, 2).
adjacent(r304, r320).
shared_edge(r304, r320, 1).
adjacent(r304, r327).
shared_edge(r304, r327, 3).
adjacent(r304, r328).
shared_edge(r304, r328, 2).
adjacent(r304, r339).
shared_edge(r304, r339, 1).
adjacent(r305, r312).
shared_edge(r305, r312, 1).
adjacent(r311, r320).
shared_edge(r311, r320, 1).
adjacent(r312, r313).
shared_edge(r312, r313, 1).
adjacent(r315, r322).
shared_edge(r315, r322, 1).
adjacent(r316, r322).
shared_edge(r316, r322, 1).
adjacent(r316, r329).
shared_edge(r316, r329, 2).
adjacent(r318, r324).
shared_edge(r318, r324, 1).
adjacent(r319, r320).
shared_edge(r319, r320, 2).
adjacent(r320, r325).
shared_edge(r320, r325, 2).
adjacent(r320, r326).
shared_edge(r320, r326, 4).
adjacent(r320, r327).
shared_edge(r320, r327, 2).
adjacent(r320, r332).
shared_edge(r320, r332, 2).
adjacent(r320, r333).
shared_edge(r320, r333, 5).
adjacent(r320, r336).
shared_edge(r320, r336, 1).
adjacent(r320, r337).
shared_edge(r320, r337, 2).
adjacent(r323, r330).
shared_edge(r323, r330, 1).
adjacent(r323, r334).
shared_edge(r323, r334, 3).
adjacent(r323, r335).
shared_edge(r323, r335, 1).
adjacent(r324, r325).
shared_edge(r324, r325, 1).
adjacent(r324, r332).
shared_edge(r324, r332, 1).
adjacent(r327, r338).
shared_edge(r327, r338, 1).
adjacent(r328, r340).
shared_edge(r328, r340, 1).
adjacent(r33, r34).
shared_edge(r33, r34, 1).
adjacent(r330, r331).
shared_edge(r330, r331, 1).
adjacent(r330, r335).
shared_edge(r330, r335, 1).
adjacent(r331, r332).
shared_edge(r331, r332, 1).
adjacent(r331, r336).
shared_edge(r331, r336, 1).
adjacent(r335, r336).
shared_edge(r335, r336, 1).
adjacent(r337, r338).
shared_edge(r337, r338, 1).
adjacent(r338, r339).
shared_edge(r338, r339, 1).
adjacent(r339, r340).
shared_edge(r339, r340, 1).
adjacent(r34, r44).
shared_edge(r34, r44, 1).
adjacent(r340, r341).
shared_edge(r340, r341, 1).
adjacent(r37, r5).
shared_edge(r37, r5, 9).
adjacent(r38, r5).
shared_edge(r38, r5, 7).
adjacent(r39, r5).
shared_edge(r39, r5, 4).
adjacent(r4, r5).
shared_edge(r4, r5, 2).
adjacent(r41, r54).
shared_edge(r41, r54, 1).
adjacent(r49, r50).
shared_edge(r49, r50, 2).
adjacent(r49, r58).
shared_edge(r49, r58, 3).
adjacent(r49, r65).
shared_edge(r49, r65, 2).
adjacent(r5, r52).
shared_edge(r5, r52, 12).
adjacent(r5, r6).
shared_edge(r5, r6, 3).
adjacent(r5, r7).
shared_edge(r5, r7, 8).
adjacent(r5, r79).
shared_edge(r5, r79, 3).
adjacent(r5, r9).
shared_edge(r5, r9, 3).
adjacent(r5, r90).
shared_edge(r5, r90, 3).
adjacent(r5, r95).
shared_edge(r5, r95, 4).
adjacent(r50, r58).
shared_edge(r50, r58, 3).
adjacent(r52, r78).
shared_edge(r52, r78, 6).
adjacent(r52, r79).
shared_edge(r52, r79, 7).
adjacent(r54, r56).
shared_edge(r54, r56, 1).
adjacent(r56, r57).
shared_edge(r56, r57, 1).
adjacent(r57, r60).
shared_edge(r57, r60, 1).
adjacent(r58, r63).
shared_edge(r58, r63, 4).
adjacent(r58, r64).
shared_edge(r58, r64, 1).
adjacent(r58, r65).
shared_edge(r58, r65, 2).
adjacent(r58, r66).
shared_edge(r58, r66, 4).
adjacent(r58, r69).
shared_edge(r58, r69, 1).
adjacent(r58, r70).
shared_edge(r58, r70, 2).
adjacent(r58, r72).
shared_edge(r58, r72, 4).
adjacent(r58, r73).
shared_edge(r58, r73, 1).
adjacent(r58, r76).
shared_edge(r58, r76, 3).
adjacent(r58, r77).
shared_edge(r58, r77, 3).
adjacent(r58, r83).
shared_edge(r58, r83, 12).
adjacent(r58, r84).
shared_edge(r58, r84, 1).
adjacent(r58, r85).
shared_edge(r58, r85, 2).
adjacent(r58, r86).
shared_edge(r58, r86, 4).
adjacent(r58, r87).
shared_edge(r58, r87, 1).
adjacent(r59, r80).
shared_edge(r59, r80, 2).
adjacent(r60, r61).
shared_edge(r60, r61, 2).
adjacent(r60, r67).
shared_edge(r60, r67, 2).
adjacent(r60, r68).
shared_edge(r60, r68, 4).
adjacent(r60, r75).
shared_edge(r60, r75, 2).
adjacent(r60, r76).
shared_edge(r60, r76, 3).
adjacent(r60, r81).
shared_edge(r60, r81, 2).
adjacent(r60, r82).
shared_edge(r60, r82, 2).
adjacent(r62, r63).
shared_edge(r62, r63, 1).
adjacent(r62, r68).
shared_edge(r62, r68, 6).
adjacent(r63, r69).
shared_edge(r63, r69, 2).
adjacent(r68, r69).
shared_edge(r68, r69, 1).
adjacent(r68, r76).
shared_edge(r68, r76, 12).
adjacent(r68, r82).
shared_edge(r68, r82, 2).
adjacent(r69, r76).
shared_edge(r69, r76, 2).
adjacent(r7, r8).
shared_edge(r7, r8, 1).
adjacent(r70, r71).
shared_edge(r70, r71, 1).
adjacent(r71, r72).
shared_edge(r71, r72, 1).
adjacent(r71, r77).
shared_edge(r71, r77, 1).
adjacent(r73, r87).
shared_edge(r73, r87, 2).
adjacent(r73, r88).
shared_edge(r73, r88, 3).
adjacent(r76, r83).
shared_edge(r76, r83, 9).
adjacent(r78, r79).
shared_edge(r78, r79, 2).
adjacent(r78, r89).
shared_edge(r78, r89, 3).
adjacent(r79, r89).
shared_edge(r79, r89, 3).
adjacent(r79, r90).
shared_edge(r79, r90, 3).
adjacent(r79, r99).
shared_edge(r79, r99, 9).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r83, r84).
shared_edge(r83, r84, 3).
adjacent(r83, r85).
shared_edge(r83, r85, 4).
adjacent(r83, r86).
shared_edge(r83, r86, 4).
adjacent(r83, r88).
shared_edge(r83, r88, 1).
adjacent(r83, r93).
shared_edge(r83, r93, 4).
adjacent(r83, r94).
shared_edge(r83, r94, 1).
adjacent(r83, r97).
shared_edge(r83, r97, 4).
adjacent(r83, r98).
shared_edge(r83, r98, 26).
adjacent(r87, r88).
shared_edge(r87, r88, 1).
adjacent(r87, r93).
shared_edge(r87, r93, 2).
adjacent(r88, r93).
shared_edge(r88, r93, 2).
adjacent(r88, r94).
shared_edge(r88, r94, 2).
