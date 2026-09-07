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

region(r1, '#515e60', 160, centroid(9,5)).
polygon(r1, [xy(0,0),xy(0,7),xy(3,7),xy(4,6),xy(5,7),xy(8,7),xy(9,8),xy(9,9),xy(10,9),xy(11,10),xy(12,10),xy(14,12),xy(16,12),xy(16,13),xy(17,11),xy(15,9),xy(15,5),xy(14,4),xy(14,2),xy(15,1),xy(14,0),xy(1,0),xy(0,0)]).
midline(r1, [xy(3,3),xy(3,4),xy(4,3),xy(5,3),xy(5,4),xy(6,3),xy(6,4),xy(7,3),xy(7,4),xy(10,4),xy(10,5),xy(11,5),xy(11,6)]).
midline(r1, [xy(13,9),xy(14,10),xy(16,11)]).
midline(r1, [xy(14,1),xy(16,1)]).
fillpoint(r1, xy(11,6), 5).
fillpoint(r1, xy(11,5), 5).
fillpoint(r1, xy(10,5), 5).
fillpoint(r1, xy(10,4), 5).
fillpoint(r1, xy(9,4), 5).
region(r2, '#3b4241', 151, centroid(22,6)).
polygon(r2, [xy(15,2),xy(15,4),xy(16,3),xy(17,4),xy(16,5),xy(16,9),xy(18,7),xy(19,8),xy(17,10),xy(18,11),xy(19,10),xy(20,10),xy(21,11),xy(22,11),xy(23,12),xy(23,15),xy(24,15),xy(25,14),xy(25,13),xy(28,10),xy(28,11),xy(29,9),xy(28,8),xy(28,7),xy(27,6),xy(28,5),xy(28,4),xy(24,0),xy(18,0),xy(18,3),xy(15,2)]).
midline(r2, [xy(16,4)]).
midline(r2, [xy(17,7),xy(17,9),xy(18,10),xy(19,9)]).
midline(r2, [xy(21,5),xy(22,5),xy(22,6),xy(23,5),xy(23,7),xy(24,9),xy(25,9)]).
midline(r2, [xy(24,13),xy(24,14)]).
fillpoint(r2, xy(23,7), 6).
fillpoint(r2, xy(23,5), 6).
fillpoint(r2, xy(22,6), 6).
fillpoint(r2, xy(22,5), 6).
fillpoint(r2, xy(21,5), 6).
region(r5, '#b8bfc1', 6, centroid(29,0)).
polygon(r5, [xy(27,0),xy(29,0),xy(29,1),xy(30,0),xy(30,1),xy(27,0)]).
fillpoint(r5, xy(30,1), 1).
fillpoint(r5, xy(30,0), 1).
fillpoint(r5, xy(29,1), 1).
fillpoint(r5, xy(29,0), 1).
fillpoint(r5, xy(28,0), 1).
region(r6, '#c1c7c8', 28, centroid(35,1)).
polygon(r6, [xy(29,2),xy(30,2),xy(30,3),xy(31,2),xy(31,0),xy(32,0),xy(32,1),xy(33,0),xy(33,1),xy(34,0),xy(34,1),xy(35,0),xy(35,1),xy(36,0),xy(36,1),xy(37,0),xy(37,1),xy(38,0),xy(38,1),xy(39,0),xy(39,1),xy(40,1),xy(41,0),xy(42,1),xy(41,2),xy(29,2)]).
midline(r6, [xy(41,1)]).
fillpoint(r6, xy(41,1), 2).
fillpoint(r6, xy(42,1), 1).
fillpoint(r6, xy(41,2), 1).
fillpoint(r6, xy(41,0), 1).
fillpoint(r6, xy(40,1), 1).
region(r12, '#c1c7c8', 7, centroid(47,0)).
polygon(r12, [xy(46,0),xy(46,1),xy(47,0),xy(47,1),xy(48,0),xy(48,1),xy(49,0),xy(46,0)]).
fillpoint(r12, xy(49,0), 1).
fillpoint(r12, xy(48,1), 1).
fillpoint(r12, xy(48,0), 1).
fillpoint(r12, xy(47,1), 1).
fillpoint(r12, xy(47,0), 1).
region(r14, '#3b4241', 246, centroid(45,18)).
polygon(r14, [xy(36,17),xy(37,17),xy(38,16),xy(38,15),xy(39,16),xy(39,17),xy(37,19),xy(38,20),xy(38,22),xy(37,23),xy(37,27),xy(36,28),xy(36,30),xy(37,31),xy(37,38),xy(38,38),xy(38,33),xy(39,32),xy(39,31),xy(40,30),xy(41,31),xy(41,38),xy(42,38),xy(42,39),xy(36,17)]).
midline(r14, [xy(38,17),xy(39,19),xy(39,21),xy(40,21),xy(39,23),xy(39,26),xy(40,25),xy(40,23)]).
midline(r14, [xy(38,30),xy(38,32)]).
midline(r14, [xy(39,28),xy(40,26)]).
midline(r14, [xy(41,19)]).
midline(r14, [xy(41,30)]).
midline(r14, [xy(46,5),xy(46,6),xy(47,5)]).
midline(r14, [xy(46,16),xy(46,17),xy(48,15),xy(48,12),xy(49,11),xy(49,16)]).
midline(r14, [xy(50,8),xy(50,9),xy(51,8),xy(51,9)]).
midline(r14, [xy(51,5),xy(52,4),xy(52,6)]).
midline(r14, [xy(52,1),xy(52,2),xy(53,1),xy(53,2)]).
fillpoint(r14, xy(39,28), 4).
fillpoint(r14, xy(52,6), 3).
fillpoint(r14, xy(52,5), 3).
fillpoint(r14, xy(52,4), 3).
fillpoint(r14, xy(51,5), 3).
region(r22, '#b8bfc1', 4, centroid(63,0)).
polygon(r22, [xy(62,0),xy(62,1),xy(63,0),xy(64,0),xy(62,0)]).
fillpoint(r22, xy(64,0), 1).
fillpoint(r22, xy(63,0), 1).
fillpoint(r22, xy(62,1), 1).
fillpoint(r22, xy(62,0), 1).
region(r23, '#c1c7c8', 138, centroid(81,8)).
polygon(r23, [xy(62,2),xy(62,3),xy(63,2),xy(63,1),xy(64,1),xy(64,2),xy(66,2),xy(67,3),xy(71,3),xy(72,4),xy(74,4),xy(76,6),xy(77,6),xy(78,7),xy(80,7),xy(81,8),xy(82,8),xy(83,9),xy(85,9),xy(86,10),xy(86,11),xy(87,12),xy(88,12),xy(89,13),xy(90,13),xy(93,16),xy(93,18),xy(92,19),xy(94,19),xy(95,18),xy(95,14),xy(93,12),xy(92,12),xy(91,11),xy(91,10),xy(89,8),xy(88,8),xy(87,7),xy(84,7),xy(83,6),xy(82,6),xy(81,5),xy(80,5),xy(78,3),xy(76,3),xy(75,2),xy(74,2),xy(73,1),xy(68,1),xy(67,0),xy(65,0),xy(62,2)]).
midline(r23, [xy(65,1),xy(67,1),xy(67,2),xy(72,2),xy(72,3),xy(73,2),xy(73,3),xy(75,3),xy(75,4),xy(76,4),xy(76,5),xy(78,5),xy(80,6),xy(81,6),xy(81,7),xy(83,7),xy(83,8),xy(85,8),xy(87,9),xy(88,10),xy(89,10),xy(89,11),xy(91,12),xy(91,13),xy(93,14),xy(94,16),xy(94,18)]).
fillpoint(r23, xy(93,14), 3).
fillpoint(r23, xy(89,11), 3).
fillpoint(r23, xy(89,10), 3).
fillpoint(r23, xy(88,10), 3).
fillpoint(r23, xy(87,9), 3).
region(r24, '#b8bfc1', 78, centroid(85,5)).
polygon(r24, [xy(68,0),xy(74,0),xy(74,1),xy(75,0),xy(75,1),xy(76,0),xy(77,1),xy(76,2),xy(77,2),xy(78,1),xy(78,2),xy(79,2),xy(79,3),xy(80,2),xy(81,3),xy(80,4),xy(81,4),xy(82,3),xy(83,4),xy(82,5),xy(83,5),xy(84,4),xy(88,4),xy(89,5),xy(90,5),xy(91,6),xy(92,6),xy(94,8),xy(95,8),xy(95,11),xy(94,12),xy(89,7),xy(88,7),xy(87,6),xy(84,6),xy(68,0)]).
midline(r24, [xy(76,1)]).
midline(r24, [xy(80,3),xy(84,5),xy(88,5),xy(88,6),xy(90,6),xy(90,7),xy(92,8),xy(93,9),xy(94,11)]).
fillpoint(r24, xy(93,9), 3).
fillpoint(r24, xy(92,8), 3).
fillpoint(r24, xy(94,11), 2).
fillpoint(r24, xy(94,10), 2).
fillpoint(r24, xy(94,9), 2).
region(r25, '#a8afb1', 58, centroid(87,3)).
polygon(r25, [xy(77,0),xy(79,0),xy(79,1),xy(80,0),xy(80,1),xy(81,0),xy(85,0),xy(86,1),xy(88,1),xy(89,2),xy(88,3),xy(83,3),xy(82,2),xy(81,2),xy(77,0)]).
midline(r25, [xy(81,1),xy(83,1),xy(83,2),xy(84,1),xy(84,2),xy(85,1),xy(85,2),xy(88,2),xy(89,3),xy(91,3),xy(91,4),xy(93,4),xy(93,5),xy(94,5),xy(94,6)]).
fillpoint(r25, xy(94,6), 2).
fillpoint(r25, xy(94,5), 2).
fillpoint(r25, xy(93,5), 2).
fillpoint(r25, xy(93,4), 2).
fillpoint(r25, xy(92,4), 2).
region(r26, '#999fa1', 20, centroid(91,1)).
polygon(r26, [xy(86,0),xy(89,0),xy(89,1),xy(90,0),xy(90,1),xy(91,0),xy(91,1),xy(92,0),xy(93,0),xy(94,1),xy(93,2),xy(92,2),xy(94,3),xy(95,2),xy(95,3),xy(86,0)]).
midline(r26, [xy(92,1),xy(93,1),xy(94,2)]).
fillpoint(r26, xy(94,2), 2).
fillpoint(r26, xy(93,1), 2).
fillpoint(r26, xy(92,1), 2).
fillpoint(r26, xy(95,3), 1).
fillpoint(r26, xy(95,2), 1).
region(r40, '#cdd3d4', 67, centroid(37,5)).
polygon(r40, [xy(32,2),xy(32,3),xy(33,2),xy(40,2),xy(41,3),xy(42,2),xy(42,5),xy(43,6),xy(42,7),xy(41,7),xy(40,6),xy(39,6),xy(38,7),xy(34,7),xy(33,8),xy(32,7),xy(32,5),xy(33,4),xy(32,2)]).
midline(r40, [xy(33,3),xy(34,5),xy(35,4),xy(35,5),xy(36,4),xy(36,5),xy(37,4),xy(37,5),xy(38,4),xy(38,5),xy(39,4),xy(40,4),xy(41,6),xy(42,6)]).
midline(r40, [xy(33,7)]).
fillpoint(r40, xy(40,4), 3).
fillpoint(r40, xy(39,4), 3).
fillpoint(r40, xy(38,5), 3).
fillpoint(r40, xy(38,4), 3).
fillpoint(r40, xy(37,5), 3).
region(r49, '#515e60', 9, centroid(58,5)).
polygon(r49, [xy(57,6),xy(58,6),xy(58,7),xy(59,6),xy(59,3),xy(58,2),xy(59,2),xy(57,6)]).
fillpoint(r49, xy(59,6), 1).
fillpoint(r49, xy(59,5), 1).
fillpoint(r49, xy(59,4), 1).
fillpoint(r49, xy(59,3), 1).
fillpoint(r49, xy(59,2), 1).
region(r51, '#cdd3d4', 191, centroid(77,10)).
polygon(r51, [xy(61,2),xy(61,5),xy(63,3),xy(66,3),xy(67,4),xy(71,4),xy(72,5),xy(74,5),xy(76,7),xy(77,7),xy(78,8),xy(80,8),xy(81,9),xy(82,9),xy(83,10),xy(85,10),xy(85,11),xy(87,13),xy(88,13),xy(89,14),xy(90,14),xy(92,16),xy(92,18),xy(91,19),xy(89,19),xy(87,17),xy(86,17),xy(85,16),xy(81,16),xy(78,13),xy(76,13),xy(72,9),xy(67,9),xy(65,7),xy(64,7),xy(63,6),xy(62,6),xy(61,2)]).
midline(r51, [xy(62,5),xy(66,5),xy(66,6),xy(67,6),xy(67,7),xy(68,6),xy(68,7),xy(69,6),xy(69,7),xy(70,6),xy(70,7),xy(71,6),xy(71,7),xy(72,7),xy(74,8),xy(76,10),xy(77,10),xy(79,11),xy(80,11),xy(80,12),xy(81,12),xy(81,13),xy(82,12),xy(82,13),xy(84,13),xy(86,14),xy(86,15),xy(88,15),xy(88,16),xy(89,16),xy(89,17),xy(90,16),xy(90,17)]).
fillpoint(r51, xy(84,13), 4).
fillpoint(r51, xy(83,13), 4).
fillpoint(r51, xy(82,13), 4).
fillpoint(r51, xy(82,12), 4).
fillpoint(r51, xy(81,13), 4).
region(r69, '#515e60', 4, centroid(44,5)).
polygon(r69, [xy(44,4),xy(44,6),xy(45,4),xy(44,4)]).
fillpoint(r69, xy(45,4), 1).
fillpoint(r69, xy(44,6), 1).
fillpoint(r69, xy(44,5), 1).
fillpoint(r69, xy(44,4), 1).
region(r80, '#515e60', 4, centroid(30,7)).
polygon(r80, [xy(29,7),xy(29,8),xy(30,7),xy(30,6),xy(29,7)]).
fillpoint(r80, xy(30,7), 1).
fillpoint(r80, xy(30,6), 1).
fillpoint(r80, xy(29,8), 1).
fillpoint(r80, xy(29,7), 1).
region(r86, '#d8dedf', 331, centroid(70,17)).
polygon(r86, [xy(56,10),xy(56,15),xy(57,16),xy(57,17),xy(60,17),xy(61,16),xy(61,17),xy(62,15),xy(61,14),xy(61,12),xy(62,11),xy(64,11),xy(65,12),xy(67,12),xy(68,13),xy(66,15),xy(66,21),xy(65,22),xy(65,23),xy(63,25),xy(65,27),xy(65,28),xy(66,28),xy(67,29),xy(68,28),xy(69,28),xy(70,27),xy(71,27),xy(72,26),xy(73,26),xy(74,25),xy(75,25),xy(76,24),xy(77,24),xy(78,23),xy(79,23),xy(82,20),xy(86,20),xy(87,19),xy(85,17),xy(81,17),xy(78,14),xy(76,14),xy(72,10),xy(67,10),xy(65,8),xy(64,8),xy(63,7),xy(62,7),xy(61,6),xy(60,7),xy(60,8),xy(58,10),xy(57,10),xy(56,10)]).
midline(r86, [xy(58,12),xy(58,15),xy(59,14),xy(59,11),xy(60,10),xy(60,11),xy(61,10),xy(61,9),xy(63,9),xy(61,7)]).
midline(r86, [xy(59,15),xy(60,15)]).
midline(r86, [xy(65,10),xy(69,12)]).
midline(r86, [xy(67,25),xy(68,24),xy(69,24),xy(70,22),xy(71,22)]).
midline(r86, [xy(72,16),xy(73,18),xy(73,19),xy(79,19)]).
midline(r86, [xy(83,18),xy(83,19),xy(84,18),xy(84,19),xy(85,18),xy(85,19),xy(86,19)]).
fillpoint(r86, xy(73,19), 8).
fillpoint(r86, xy(73,18), 8).
fillpoint(r86, xy(75,19), 7).
fillpoint(r86, xy(74,19), 7).
fillpoint(r86, xy(74,18), 7).
region(r87, '#687577', 99, centroid(7,12)).
polygon(r87, [xy(0,8),xy(0,14),xy(1,15),xy(2,15),xy(3,14),xy(4,14),xy(5,13),xy(9,13),xy(10,14),xy(11,14),xy(12,15),xy(15,15),xy(16,14),xy(15,13),xy(14,13),xy(12,11),xy(11,11),xy(10,10),xy(9,10),xy(7,8),xy(5,8),xy(4,7),xy(3,8),xy(1,8),xy(0,8)]).
midline(r87, [xy(2,13),xy(3,11),xy(4,10),xy(4,11),xy(6,10),xy(6,11),xy(7,10),xy(7,11),xy(8,11),xy(14,14),xy(15,14)]).
fillpoint(r87, xy(4,11), 4).
fillpoint(r87, xy(4,10), 4).
fillpoint(r87, xy(3,11), 4).
fillpoint(r87, xy(12,13), 3).
fillpoint(r87, xy(10,12), 3).
region(r89, '#d8dedf', 46, centroid(37,10)).
polygon(r89, [xy(32,11),xy(32,12),xy(33,11),xy(33,9),xy(34,8),xy(38,8),xy(39,7),xy(40,7),xy(41,8),xy(39,10),xy(39,12),xy(38,13),xy(37,12),xy(34,12),xy(32,11)]).
midline(r89, [xy(35,10),xy(37,10),xy(38,12)]).
midline(r89, [xy(39,8),xy(39,9),xy(40,8)]).
fillpoint(r89, xy(37,10), 3).
fillpoint(r89, xy(36,10), 3).
fillpoint(r89, xy(35,10), 3).
fillpoint(r89, xy(40,8), 2).
fillpoint(r89, xy(39,9), 2).
region(r98, '#e0e4e3', 18, centroid(42,11)).
polygon(r98, [xy(40,10),xy(40,12),xy(42,14),xy(43,13),xy(43,11),xy(42,10),xy(41,10),xy(43,8),xy(43,10),xy(40,10)]).
midline(r98, [xy(41,11),xy(41,12),xy(42,11),xy(42,13)]).
fillpoint(r98, xy(42,13), 2).
fillpoint(r98, xy(42,12), 2).
fillpoint(r98, xy(42,11), 2).
fillpoint(r98, xy(41,12), 2).
fillpoint(r98, xy(41,11), 2).
region(r101, '#e0e4e3', 4, centroid(47,9)).
polygon(r101, [xy(46,9),xy(46,10),xy(47,9),xy(47,8),xy(46,9)]).
fillpoint(r101, xy(47,9), 1).
fillpoint(r101, xy(47,8), 1).
fillpoint(r101, xy(46,10), 1).
fillpoint(r101, xy(46,9), 1).
region(r110, '#b8bfc1', 4, centroid(31,11)).
polygon(r110, [xy(31,9),xy(31,12),xy(31,9)]).
fillpoint(r110, xy(31,12), 1).
fillpoint(r110, xy(31,11), 1).
fillpoint(r110, xy(31,10), 1).
fillpoint(r110, xy(31,9), 1).
region(r114, '#e0e4e3', 41, centroid(54,17)).
polygon(r114, [xy(52,22),xy(52,27),xy(53,26),xy(53,28),xy(52,22)]).
midline(r114, [xy(53,24),xy(53,25)]).
midline(r114, [xy(54,13)]).
fillpoint(r114, xy(54,13), 2).
fillpoint(r114, xy(53,25), 2).
fillpoint(r114, xy(53,24), 2).
fillpoint(r114, xy(58,9), 1).
fillpoint(r114, xy(57,9), 1).
region(r121, '#515e60', 10, centroid(20,12)).
polygon(r121, [xy(18,12),xy(18,13),xy(19,12),xy(19,11),xy(20,11),xy(20,12),xy(22,12),xy(22,14),xy(18,12)]).
fillpoint(r121, xy(22,14), 1).
fillpoint(r121, xy(22,13), 1).
fillpoint(r121, xy(22,12), 1).
fillpoint(r121, xy(21,12), 1).
fillpoint(r121, xy(20,12), 1).
region(r128, '#687577', 5, centroid(29,12)).
polygon(r128, [xy(27,12),xy(29,12),xy(29,13),xy(30,13),xy(27,12)]).
fillpoint(r128, xy(30,13), 1).
fillpoint(r128, xy(29,13), 1).
fillpoint(r128, xy(29,12), 1).
fillpoint(r128, xy(28,12), 1).
fillpoint(r128, xy(27,12), 1).
region(r130, '#e0e4e3', 45, centroid(33,17)).
polygon(r130, [xy(30,16),xy(30,19),xy(31,19),xy(32,20),xy(33,20),xy(34,19),xy(34,16),xy(35,15),xy(34,14),xy(34,13),xy(33,12),xy(32,13),xy(32,14),xy(31,15),xy(30,16)]).
midline(r130, [xy(32,16),xy(32,18),xy(35,21)]).
midline(r130, [xy(33,13),xy(33,15)]).
fillpoint(r130, xy(33,15), 3).
fillpoint(r130, xy(32,18), 3).
fillpoint(r130, xy(32,17), 3).
fillpoint(r130, xy(32,16), 3).
fillpoint(r130, xy(35,21), 2).
region(r134, '#e0e4e3', 68, centroid(63,18)).
polygon(r134, [xy(57,18),xy(58,18),xy(58,19),xy(59,18),xy(61,18),xy(62,17),xy(62,16),xy(63,15),xy(62,14),xy(62,12),xy(64,12),xy(65,13),xy(66,13),xy(66,14),xy(65,15),xy(65,21),xy(64,22),xy(64,23),xy(63,24),xy(62,24),xy(59,21),xy(59,20),xy(57,18)]).
midline(r134, [xy(59,19)]).
midline(r134, [xy(62,20),xy(62,21)]).
midline(r134, [xy(63,16),xy(64,16),xy(63,18)]).
midline(r134, [xy(64,14)]).
fillpoint(r134, xy(62,21), 4).
fillpoint(r134, xy(62,20), 4).
fillpoint(r134, xy(64,14), 3).
fillpoint(r134, xy(63,21), 3).
fillpoint(r134, xy(63,20), 3).
region(r142, '#838d90', 170, centroid(10,20)).
polygon(r142, [xy(0,15),xy(0,20),xy(1,20),xy(2,19),xy(6,19),xy(7,20),xy(7,25),xy(8,25),xy(8,26),xy(7,27),xy(6,27),xy(8,29),xy(10,29),xy(11,30),xy(12,29),xy(12,28),xy(13,27),xy(11,25),xy(10,25),xy(9,24),xy(10,22),xy(11,21),xy(12,22),xy(11,23),xy(12,24),xy(13,23),xy(13,22),xy(14,21),xy(15,21),xy(16,20),xy(17,20),xy(18,19),xy(18,18),xy(19,17),xy(19,16),xy(18,15),xy(17,16),xy(12,16),xy(11,15),xy(10,15),xy(9,14),xy(5,14),xy(4,15),xy(3,15),xy(2,16),xy(1,16),xy(0,15)]).
hole(r142, [xy(9,25),xy(9,26),xy(9,25)]).
midline(r142, [xy(1,17),xy(1,19),xy(3,17),xy(4,17),xy(5,16),xy(5,17),xy(7,17),xy(9,18),xy(11,18),xy(12,19),xy(13,19),xy(15,18),xy(15,19),xy(18,16),xy(18,17)]).
midline(r142, [xy(8,23),xy(8,24),xy(9,23),xy(10,23),xy(10,24),xy(11,24),xy(12,23)]).
midline(r142, [xy(8,27),xy(8,28),xy(9,28),xy(11,27),xy(11,29)]).
midline(r142, [xy(9,21)]).
fillpoint(r142, xy(9,18), 5).
fillpoint(r142, xy(13,19), 4).
fillpoint(r142, xy(12,19), 4).
fillpoint(r142, xy(11,18), 4).
fillpoint(r142, xy(10,19), 4).
region(r192, '#b8bfc1', 7, centroid(26,17)).
polygon(r192, [xy(24,17),xy(27,17),xy(27,18),xy(28,17),xy(28,18),xy(24,17)]).
fillpoint(r192, xy(28,18), 1).
fillpoint(r192, xy(28,17), 1).
fillpoint(r192, xy(27,18), 1).
fillpoint(r192, xy(27,17), 1).
fillpoint(r192, xy(26,17), 1).
region(r200, '#8f999c', 220, centroid(12,30)).
polygon(r200, [xy(0,21),xy(0,25),xy(1,25),xy(2,26),xy(2,30),xy(3,30),xy(5,32),xy(5,33),xy(6,34),xy(7,34),xy(8,35),xy(9,35),xy(11,37),xy(13,37),xy(14,36),xy(13,35),xy(12,35),xy(11,34),xy(12,33),xy(13,33),xy(14,34),xy(16,34),xy(17,33),xy(17,32),xy(18,31),xy(17,30),xy(17,29),xy(16,28),xy(16,27),xy(14,25),xy(14,22),xy(15,22),xy(16,21),xy(17,21),xy(19,19),xy(19,18),xy(20,20),xy(20,21),xy(18,23),xy(18,24),xy(17,25),xy(16,25),xy(15,24),xy(14,26),xy(14,27),xy(13,28),xy(13,29),xy(14,30),xy(13,31),xy(11,31),xy(10,30),xy(8,30),xy(5,27),xy(6,26),xy(6,21),xy(5,20),xy(2,20),xy(1,21),xy(0,21)]).
hole(r200, [xy(12,34),xy(13,34),xy(12,34)]).
midline(r200, [xy(3,23),xy(3,24),xy(4,26),xy(4,29),xy(5,29),xy(5,30),xy(6,30),xy(6,31),xy(7,31),xy(7,32),xy(8,32),xy(8,33),xy(9,32),xy(9,33),xy(10,32),xy(10,35),xy(11,35),xy(11,36),xy(13,36)]).
midline(r200, [xy(12,32),xy(14,32),xy(15,31),xy(15,32),xy(16,31),xy(15,29),xy(15,27)]).
midline(r200, [xy(16,23),xy(18,21),xy(18,22),xy(19,21),xy(19,20)]).
midline(r200, [xy(16,37),xy(17,37)]).
midline(r200, [xy(20,39),xy(24,39)]).
fillpoint(r200, xy(3,24), 4).
fillpoint(r200, xy(3,23), 4).
fillpoint(r200, xy(16,31), 3).
fillpoint(r200, xy(16,23), 3).
fillpoint(r200, xy(15,32), 3).
region(r205, '#a8afb1', 17, centroid(25,20)).
polygon(r205, [xy(22,21),xy(23,20),xy(23,21),xy(25,21),xy(26,20),xy(26,21),xy(24,19),xy(24,18),xy(26,18),xy(27,19),xy(28,19),xy(22,21)]).
midline(r205, [xy(24,20),xy(25,19),xy(25,20),xy(26,19)]).
fillpoint(r205, xy(26,19), 2).
fillpoint(r205, xy(25,20), 2).
fillpoint(r205, xy(25,19), 2).
fillpoint(r205, xy(24,20), 2).
fillpoint(r205, xy(28,19), 1).
region(r246, '#c1c7c8', 89, centroid(83,27)).
polygon(r246, [xy(71,32),xy(73,32),xy(74,31),xy(75,31),xy(76,30),xy(77,30),xy(78,29),xy(79,29),xy(84,24),xy(85,24),xy(86,23),xy(86,22),xy(87,21),xy(88,21),xy(89,20),xy(90,20),xy(90,23),xy(89,24),xy(89,25),xy(86,28),xy(85,28),xy(83,30),xy(82,30),xy(81,31),xy(80,31),xy(78,33),xy(74,33),xy(71,32)]).
midline(r246, [xy(74,32),xy(75,32),xy(76,31),xy(76,32),xy(78,31)]).
midline(r246, [xy(81,29),xy(83,27),xy(83,28),xy(84,27),xy(84,26),xy(85,26),xy(86,25),xy(86,26),xy(87,25),xy(87,24),xy(88,23),xy(89,21)]).
fillpoint(r246, xy(88,23), 3).
fillpoint(r246, xy(87,25), 3).
fillpoint(r246, xy(87,24), 3).
fillpoint(r246, xy(86,26), 3).
fillpoint(r246, xy(86,25), 3).
region(r247, '#b8bfc1', 42, centroid(93,24)).
polygon(r247, [xy(89,26),xy(90,25),xy(90,24),xy(91,23),xy(91,21),xy(92,20),xy(95,20),xy(95,25),xy(92,28),xy(91,27),xy(90,27),xy(89,26)]).
midline(r247, [xy(90,26),xy(92,24),xy(92,26),xy(93,25),xy(93,22)]).
fillpoint(r247, xy(93,25), 3).
fillpoint(r247, xy(93,24), 3).
fillpoint(r247, xy(93,23), 3).
fillpoint(r247, xy(93,22), 3).
fillpoint(r247, xy(92,26), 3).
region(r248, '#999fa1', 45, centroid(20,26)).
polygon(r248, [xy(17,26),xy(17,28),xy(18,29),xy(18,30),xy(19,31),xy(22,28),xy(22,27),xy(23,26),xy(22,25),xy(22,22),xy(21,21),xy(19,23),xy(19,25),xy(18,26),xy(17,26)]).
midline(r248, [xy(19,27),xy(19,28),xy(20,27),xy(20,26),xy(21,26),xy(20,24),xy(20,23),xy(21,22),xy(21,24)]).
midline(r248, [xy(19,30),xy(20,28)]).
fillpoint(r248, xy(21,26), 3).
fillpoint(r248, xy(20,28), 3).
fillpoint(r248, xy(20,27), 3).
fillpoint(r248, xy(20,26), 3).
fillpoint(r248, xy(19,28), 3).
region(r261, '#999fa1', 6, centroid(51,23)).
polygon(r261, [xy(50,24),xy(51,23),xy(51,21),xy(50,24)]).
fillpoint(r261, xy(51,25), 1).
fillpoint(r261, xy(51,24), 1).
fillpoint(r261, xy(51,23), 1).
fillpoint(r261, xy(51,22), 1).
fillpoint(r261, xy(51,21), 1).
region(r265, '#cdd3d4', 79, centroid(77,26)).
polygon(r265, [xy(67,30),xy(68,29),xy(68,30),xy(69,29),xy(69,30),xy(70,31),xy(73,31),xy(74,30),xy(75,30),xy(76,29),xy(77,29),xy(78,28),xy(79,28),xy(85,22),xy(84,21),xy(82,21),xy(79,24),xy(78,24),xy(77,25),xy(76,25),xy(75,26),xy(74,26),xy(73,27),xy(72,27),xy(71,28),xy(70,28),xy(67,30)]).
midline(r265, [xy(70,29),xy(70,30),xy(72,29),xy(73,29),xy(74,28),xy(75,28),xy(76,27),xy(77,27),xy(78,26),xy(79,26),xy(82,23),xy(84,22)]).
fillpoint(r265, xy(82,23), 3).
fillpoint(r265, xy(81,24), 3).
fillpoint(r265, xy(80,25), 3).
fillpoint(r265, xy(79,26), 3).
fillpoint(r265, xy(78,26), 3).
region(r270, '#515e60', 14, centroid(26,24)).
polygon(r270, [xy(24,24),xy(24,25),xy(25,24),xy(25,23),xy(26,23),xy(27,24),xy(26,25),xy(27,25),xy(28,24),xy(28,22),xy(24,24)]).
midline(r270, [xy(26,24)]).
fillpoint(r270, xy(26,24), 2).
fillpoint(r270, xy(28,26), 1).
fillpoint(r270, xy(28,25), 1).
fillpoint(r270, xy(28,24), 1).
fillpoint(r270, xy(28,23), 1).
region(r272, '#838d90', 6, centroid(32,23)).
polygon(r272, [xy(30,23),xy(31,22),xy(31,23),xy(34,23),xy(30,23)]).
fillpoint(r272, xy(34,23), 1).
fillpoint(r272, xy(33,23), 1).
fillpoint(r272, xy(32,23), 1).
fillpoint(r272, xy(31,23), 1).
fillpoint(r272, xy(31,22), 1).
region(r284, '#8f999c', 4, centroid(55,23)).
polygon(r284, [xy(55,22),xy(55,24),xy(56,24),xy(55,22)]).
fillpoint(r284, xy(56,24), 1).
fillpoint(r284, xy(55,24), 1).
fillpoint(r284, xy(55,23), 1).
fillpoint(r284, xy(55,22), 1).
region(r286, '#c1c7c8', 4, centroid(57,23)).
polygon(r286, [xy(57,22),xy(57,24),xy(58,23),xy(57,22)]).
fillpoint(r286, xy(58,23), 1).
fillpoint(r286, xy(57,24), 1).
fillpoint(r286, xy(57,23), 1).
fillpoint(r286, xy(57,22), 1).
region(r298, '#b8bfc1', 9, centroid(59,25)).
polygon(r298, [xy(57,25),xy(59,23),xy(59,25),xy(58,26),xy(60,25),xy(61,25),xy(57,25)]).
midline(r298, [xy(58,25)]).
fillpoint(r298, xy(58,25), 2).
fillpoint(r298, xy(61,25), 1).
fillpoint(r298, xy(60,25), 1).
fillpoint(r298, xy(59,25), 1).
fillpoint(r298, xy(59,24), 1).
region(r304, '#515e60', 19, centroid(34,26)).
polygon(r304, [xy(31,25),xy(32,24),xy(33,25),xy(32,26),xy(32,27),xy(33,28),xy(35,28),xy(36,27),xy(35,26),xy(35,25),xy(34,24),xy(31,25)]).
midline(r304, [xy(32,25),xy(33,26),xy(33,27),xy(34,26),xy(34,27),xy(35,27)]).
fillpoint(r304, xy(35,27), 2).
fillpoint(r304, xy(34,27), 2).
fillpoint(r304, xy(34,26), 2).
fillpoint(r304, xy(34,25), 2).
fillpoint(r304, xy(33,27), 2).
region(r309, '#b8bfc1', 24, centroid(46,30)).
polygon(r309, [xy(44,24),xy(44,29),xy(45,29),xy(45,30),xy(44,31),xy(44,32),xy(46,32),xy(47,31),xy(46,30),xy(47,32),xy(48,31),xy(48,33),xy(49,33),xy(49,34),xy(44,24)]).
midline(r309, [xy(45,31),xy(46,31)]).
fillpoint(r309, xy(46,31), 2).
fillpoint(r309, xy(45,31), 2).
fillpoint(r309, xy(49,34), 1).
fillpoint(r309, xy(49,33), 1).
fillpoint(r309, xy(48,33), 1).
region(r327, '#838d90', 103, centroid(6,36)).
polygon(r327, [xy(0,26),xy(0,37),xy(1,37),xy(2,38),xy(3,38),xy(5,40),xy(15,40),xy(16,39),xy(15,38),xy(11,38),xy(9,36),xy(8,36),xy(7,35),xy(6,35),xy(4,33),xy(4,32),xy(3,31),xy(2,31),xy(1,30),xy(1,26),xy(0,26)]).
midline(r327, [xy(1,31),xy(3,35),xy(5,37),xy(7,37),xy(7,38),xy(9,38),xy(11,39),xy(15,39)]).
fillpoint(r327, xy(5,37), 4).
fillpoint(r327, xy(4,36), 4).
fillpoint(r327, xy(3,35), 4).
fillpoint(r327, xy(9,38), 3).
fillpoint(r327, xy(8,38), 3).
region(r330, '#3b4241', 28, centroid(30,31)).
polygon(r330, [xy(26,26),xy(26,28),xy(27,28),xy(27,29),xy(28,29),xy(28,31),xy(29,30),xy(30,31),xy(29,32),xy(30,32),xy(30,33),xy(31,33),xy(32,32),xy(31,31),xy(34,31),xy(34,32),xy(32,34),xy(33,34),xy(34,33),xy(34,34),xy(26,26)]).
midline(r330, [xy(29,31)]).
midline(r330, [xy(33,32)]).
fillpoint(r330, xy(33,32), 2).
fillpoint(r330, xy(29,31), 2).
fillpoint(r330, xy(34,34), 1).
fillpoint(r330, xy(34,33), 1).
fillpoint(r330, xy(34,32), 1).
region(r333, '#a8afb1', 7, centroid(51,29)).
polygon(r333, [xy(51,26),xy(51,32),xy(51,26)]).
fillpoint(r333, xy(51,32), 1).
fillpoint(r333, xy(51,31), 1).
fillpoint(r333, xy(51,30), 1).
fillpoint(r333, xy(51,29), 1).
fillpoint(r333, xy(51,28), 1).
region(r335, '#8f999c', 6, centroid(56,28)).
polygon(r335, [xy(55,27),xy(55,28),xy(56,27),xy(56,29),xy(55,27)]).
fillpoint(r335, xy(56,29), 1).
fillpoint(r335, xy(56,28), 1).
fillpoint(r335, xy(56,27), 1).
fillpoint(r335, xy(56,26), 1).
fillpoint(r335, xy(55,28), 1).
region(r337, '#a8afb1', 4, centroid(59,27)).
polygon(r337, [xy(58,27),xy(59,26),xy(59,28),xy(58,27)]).
fillpoint(r337, xy(59,28), 1).
fillpoint(r337, xy(59,27), 1).
fillpoint(r337, xy(59,26), 1).
fillpoint(r337, xy(58,27), 1).
region(r342, '#a8afb1', 134, centroid(74,35)).
polygon(r342, [xy(56,38),xy(57,37),xy(57,38),xy(58,37),xy(58,38),xy(59,38),xy(60,37),xy(59,36),xy(59,33),xy(56,38)]).
midline(r342, [xy(59,37),xy(60,38),xy(62,38),xy(63,37),xy(63,38),xy(64,37),xy(64,36),xy(70,36),xy(71,35),xy(71,36),xy(78,36)]).
midline(r342, [xy(90,29),xy(90,30),xy(91,29)]).
midline(r342, [xy(94,28),xy(94,29)]).
fillpoint(r342, xy(74,36), 3).
fillpoint(r342, xy(73,36), 3).
fillpoint(r342, xy(72,36), 3).
fillpoint(r342, xy(71,36), 3).
fillpoint(r342, xy(71,35), 3).
region(r343, '#8f999c', 10, centroid(23,29)).
polygon(r343, [xy(21,30),xy(22,29),xy(22,32),xy(21,30)]).
fillpoint(r343, xy(24,29), 1).
fillpoint(r343, xy(24,28), 1).
fillpoint(r343, xy(23,29), 1).
fillpoint(r343, xy(23,28), 1).
fillpoint(r343, xy(23,27), 1).
region(r355, '#838d90', 4, centroid(57,28)).
polygon(r355, [xy(57,27),xy(57,29),xy(58,29),xy(57,27)]).
fillpoint(r355, xy(58,29), 1).
fillpoint(r355, xy(57,29), 1).
fillpoint(r355, xy(57,28), 1).
fillpoint(r355, xy(57,27), 1).
region(r360, '#b8bfc1', 40, centroid(83,32)).
polygon(r360, [xy(75,34),xy(79,34),xy(80,33),xy(80,32),xy(81,32),xy(82,31),xy(83,31),xy(85,29),xy(86,29),xy(88,27),xy(88,29),xy(85,32),xy(85,33),xy(84,34),xy(80,34),xy(75,34)]).
midline(r360, [xy(81,33),xy(82,32),xy(82,33),xy(83,32),xy(83,33),xy(84,32),xy(84,31),xy(85,30),xy(85,31),xy(87,29)]).
midline(r360, [xy(84,33)]).
fillpoint(r360, xy(87,29), 2).
fillpoint(r360, xy(86,30), 2).
fillpoint(r360, xy(85,31), 2).
fillpoint(r360, xy(85,30), 2).
fillpoint(r360, xy(84,33), 2).
region(r368, '#d8dedf', 7, centroid(52,30)).
polygon(r368, [xy(52,28),xy(52,33),xy(52,28)]).
fillpoint(r368, xy(53,29), 1).
fillpoint(r368, xy(52,33), 1).
fillpoint(r368, xy(52,32), 1).
fillpoint(r368, xy(52,31), 1).
fillpoint(r368, xy(52,30), 1).
region(r375, '#515e60', 5, centroid(30,30)).
polygon(r375, [xy(29,29),xy(30,29),xy(30,30),xy(32,30),xy(29,29)]).
fillpoint(r375, xy(32,30), 1).
fillpoint(r375, xy(31,30), 1).
fillpoint(r375, xy(30,30), 1).
fillpoint(r375, xy(30,29), 1).
fillpoint(r375, xy(29,29), 1).
region(r378, '#838d90', 4, centroid(34,30)).
polygon(r378, [xy(33,30),xy(34,29),xy(34,30),xy(35,30),xy(33,30)]).
fillpoint(r378, xy(35,30), 1).
fillpoint(r378, xy(34,30), 1).
fillpoint(r378, xy(34,29), 1).
fillpoint(r378, xy(33,30), 1).
region(r385, '#838d90', 17, centroid(55,32)).
polygon(r385, [xy(54,29),xy(54,34),xy(56,32),xy(55,31),xy(55,29),xy(54,29)]).
midline(r385, [xy(55,32)]).
fillpoint(r385, xy(55,32), 2).
fillpoint(r385, xy(58,33), 1).
fillpoint(r385, xy(58,32), 1).
fillpoint(r385, xy(57,32), 1).
fillpoint(r385, xy(56,34), 1).
region(r390, '#b8bfc1', 47, centroid(64,33)).
polygon(r390, [xy(60,32),xy(60,36),xy(61,36),xy(62,35),xy(62,36),xy(63,34),xy(65,34),xy(66,33),xy(67,33),xy(68,34),xy(69,33),xy(69,32),xy(68,31),xy(66,31),xy(64,29),xy(63,30),xy(62,30),xy(62,31),xy(61,32),xy(60,32)]).
midline(r390, [xy(61,35),xy(62,33),xy(64,31),xy(64,32),xy(68,32),xy(68,33)]).
fillpoint(r390, xy(65,32), 3).
fillpoint(r390, xy(64,32), 3).
fillpoint(r390, xy(64,31), 3).
fillpoint(r390, xy(63,32), 3).
fillpoint(r390, xy(62,33), 3).
region(r393, '#999fa1', 182, centroid(46,38)).
polygon(r393, [xy(14,35),xy(18,35),xy(18,36),xy(19,37),xy(24,37),xy(25,38),xy(26,38),xy(27,39),xy(29,39),xy(30,40),xy(34,40),xy(35,39),xy(35,38),xy(34,37),xy(31,37),xy(30,36),xy(27,36),xy(26,35),xy(25,35),xy(24,34),xy(24,33),xy(23,32),xy(22,33),xy(21,33),xy(20,34),xy(19,34),xy(14,35)]).
midline(r393, [xy(19,35),xy(19,36),xy(21,35),xy(23,35),xy(23,33)]).
midline(r393, [xy(25,36),xy(25,37),xy(26,36),xy(26,37),xy(27,37),xy(27,38),xy(28,37),xy(28,38),xy(32,38),xy(32,39),xy(33,38),xy(33,39),xy(34,38),xy(34,39)]).
midline(r393, [xy(46,39),xy(48,39)]).
midline(r393, [xy(55,39)]).
midline(r393, [xy(79,38),xy(82,38),xy(83,37),xy(85,37)]).
fillpoint(r393, xy(30,38), 3).
fillpoint(r393, xy(23,35), 3).
fillpoint(r393, xy(22,35), 3).
fillpoint(r393, xy(21,35), 3).
fillpoint(r393, xy(85,37), 2).
region(r402, '#b8bfc1', 4, centroid(53,32)).
polygon(r402, [xy(53,30),xy(53,33),xy(53,30)]).
fillpoint(r402, xy(53,33), 1).
fillpoint(r402, xy(53,32), 1).
fillpoint(r402, xy(53,31), 1).
fillpoint(r402, xy(53,30), 1).
region(r408, '#999fa1', 35, centroid(91,33)).
polygon(r408, [xy(87,33),xy(87,34),xy(89,32),xy(89,31),xy(90,32),xy(92,30),xy(93,30),xy(94,31),xy(95,31),xy(95,32),xy(93,34),xy(92,34),xy(91,35),xy(88,35),xy(87,33)]).
midline(r408, [xy(88,34),xy(89,33),xy(89,34),xy(91,33),xy(92,32),xy(93,32)]).
fillpoint(r408, xy(93,32), 3).
fillpoint(r408, xy(92,32), 3).
fillpoint(r408, xy(91,33), 3).
fillpoint(r408, xy(94,32), 2).
fillpoint(r408, xy(93,33), 2).
region(r410, '#838d90', 7, centroid(19,32)).
polygon(r410, [xy(18,32),xy(18,33),xy(19,32),xy(19,33),xy(21,31),xy(21,32),xy(18,32)]).
fillpoint(r410, xy(21,32), 1).
fillpoint(r410, xy(21,31), 1).
fillpoint(r410, xy(20,32), 1).
fillpoint(r410, xy(19,33), 1).
fillpoint(r410, xy(19,32), 1).
region(r412, '#515e60', 8, centroid(36,34)).
polygon(r412, [xy(35,31),xy(35,34),xy(36,33),xy(36,36),xy(35,31)]).
fillpoint(r412, xy(36,36), 1).
fillpoint(r412, xy(36,35), 1).
fillpoint(r412, xy(36,34), 1).
fillpoint(r412, xy(36,33), 1).
fillpoint(r412, xy(35,34), 1).
region(r414, '#515e60', 4, centroid(40,32)).
polygon(r414, [xy(39,33),xy(40,32),xy(40,33),xy(39,33)]).
fillpoint(r414, xy(40,33), 1).
fillpoint(r414, xy(40,32), 1).
fillpoint(r414, xy(40,31), 1).
fillpoint(r414, xy(39,33), 1).
region(r428, '#a8afb1', 10, centroid(27,34)).
polygon(r428, [xy(25,33),xy(25,34),xy(26,33),xy(26,34),xy(27,34),xy(27,35),xy(28,34),xy(28,35),xy(30,35),xy(25,33)]).
fillpoint(r428, xy(30,35), 1).
fillpoint(r428, xy(29,35), 1).
fillpoint(r428, xy(28,35), 1).
fillpoint(r428, xy(28,34), 1).
fillpoint(r428, xy(27,35), 1).
region(r434, '#a8afb1', 29, centroid(48,36)).
polygon(r434, [xy(44,33),xy(46,33),xy(46,34),xy(47,33),xy(48,34),xy(45,37),xy(48,37),xy(49,36),xy(49,35),xy(50,37),xy(49,38),xy(50,38),xy(51,37),xy(51,38),xy(52,37),xy(52,38),xy(54,38),xy(44,33)]).
midline(r434, [xy(47,34),xy(48,35),xy(47,36),xy(48,36),xy(49,37)]).
fillpoint(r434, xy(49,37), 2).
fillpoint(r434, xy(48,36), 2).
fillpoint(r434, xy(48,35), 2).
fillpoint(r434, xy(47,36), 2).
fillpoint(r434, xy(47,34), 2).
region(r437, '#687577', 10, centroid(56,35)).
polygon(r437, [xy(54,35),xy(55,34),xy(56,35),xy(55,36),xy(55,37),xy(57,35),xy(57,33),xy(54,35)]).
midline(r437, [xy(55,35)]).
fillpoint(r437, xy(55,35), 2).
fillpoint(r437, xy(57,35), 1).
fillpoint(r437, xy(57,34), 1).
fillpoint(r437, xy(57,33), 1).
fillpoint(r437, xy(56,36), 1).
region(r449, '#8f999c', 43, centroid(87,38)).
polygon(r449, [xy(75,40),xy(82,40),xy(83,39),xy(83,40),xy(84,39),xy(84,40),xy(85,39),xy(85,40),xy(86,40),xy(87,39),xy(86,38),xy(88,36),xy(88,37),xy(89,36),xy(90,36),xy(90,37),xy(88,39),xy(90,38),xy(91,37),xy(91,36),xy(92,35),xy(93,35),xy(94,34),xy(95,34),xy(95,35),xy(93,37),xy(92,37),xy(75,40)]).
midline(r449, [xy(86,39),xy(87,38),xy(88,38)]).
midline(r449, [xy(92,36),xy(93,36),xy(94,35)]).
fillpoint(r449, xy(94,35), 2).
fillpoint(r449, xy(93,36), 2).
fillpoint(r449, xy(92,36), 2).
fillpoint(r449, xy(88,38), 2).
fillpoint(r449, xy(87,38), 2).
region(r482, '#838d90', 23, centroid(92,39)).
polygon(r482, [xy(87,40),xy(88,40),xy(89,39),xy(89,40),xy(90,39),xy(90,40),xy(94,40),xy(95,39),xy(95,38),xy(94,37),xy(93,38),xy(91,38),xy(87,40)]).
midline(r482, [xy(91,39),xy(93,39),xy(94,38),xy(94,39)]).
fillpoint(r482, xy(94,39), 2).
fillpoint(r482, xy(94,38), 2).
fillpoint(r482, xy(93,39), 2).
fillpoint(r482, xy(92,39), 2).
fillpoint(r482, xy(91,39), 2).
region(r483, '#687577', 11, centroid(2,39)).
polygon(r483, [xy(0,38),xy(0,40),xy(1,40),xy(2,39),xy(1,38),xy(2,40),xy(3,39),xy(3,40),xy(4,40),xy(0,38)]).
midline(r483, [xy(1,39)]).
fillpoint(r483, xy(1,39), 2).
fillpoint(r483, xy(4,40), 1).
fillpoint(r483, xy(3,40), 1).
fillpoint(r483, xy(3,39), 1).
fillpoint(r483, xy(2,40), 1).
adjacent(r1, r127).
shared_edge(r1, r127, 3).
adjacent(r1, r2).
shared_edge(r1, r2, 22).
adjacent(r1, r87).
shared_edge(r1, r87, 25).
adjacent(r10, r11).
shared_edge(r10, r11, 1).
adjacent(r10, r32).
shared_edge(r10, r32, 1).
adjacent(r10, r9).
shared_edge(r10, r9, 1).
adjacent(r100, r101).
shared_edge(r100, r101, 2).
adjacent(r100, r14).
shared_edge(r100, r14, 2).
adjacent(r101, r102).
shared_edge(r101, r102, 1).
adjacent(r101, r111).
shared_edge(r101, r111, 2).
adjacent(r101, r112).
shared_edge(r101, r112, 1).
adjacent(r101, r118).
shared_edge(r101, r118, 2).
adjacent(r101, r125).
shared_edge(r101, r125, 1).
adjacent(r101, r92).
shared_edge(r101, r92, 1).
adjacent(r102, r112).
shared_edge(r102, r112, 1).
adjacent(r102, r14).
shared_edge(r102, r14, 1).
adjacent(r102, r93).
shared_edge(r102, r93, 1).
adjacent(r103, r104).
shared_edge(r103, r104, 1).
adjacent(r103, r113).
shared_edge(r103, r113, 1).
adjacent(r103, r14).
shared_edge(r103, r14, 2).
adjacent(r104, r105).
shared_edge(r104, r105, 1).
adjacent(r104, r114).
shared_edge(r104, r114, 2).
adjacent(r104, r14).
shared_edge(r104, r14, 2).
adjacent(r105, r106).
shared_edge(r105, r106, 1).
adjacent(r105, r114).
shared_edge(r105, r114, 1).
adjacent(r105, r14).
shared_edge(r105, r14, 1).
adjacent(r106, r107).
shared_edge(r106, r107, 1).
adjacent(r106, r114).
shared_edge(r106, r114, 1).
adjacent(r106, r14).
shared_edge(r106, r14, 1).
adjacent(r107, r108).
shared_edge(r107, r108, 1).
adjacent(r107, r114).
shared_edge(r107, r114, 1).
adjacent(r107, r49).
shared_edge(r107, r49, 1).
adjacent(r108, r86).
shared_edge(r108, r86, 2).
adjacent(r108, r94).
shared_edge(r108, r94, 1).
adjacent(r109, r110).
shared_edge(r109, r110, 1).
adjacent(r109, r116).
shared_edge(r109, r116, 1).
adjacent(r109, r2).
shared_edge(r109, r2, 1).
adjacent(r109, r96).
shared_edge(r109, r96, 1).
adjacent(r11, r12).
shared_edge(r11, r12, 2).
adjacent(r11, r32).
shared_edge(r11, r32, 1).
adjacent(r11, r42).
shared_edge(r11, r42, 1).
adjacent(r110, r116).
shared_edge(r110, r116, 2).
adjacent(r110, r129).
shared_edge(r110, r129, 1).
adjacent(r110, r138).
shared_edge(r110, r138, 1).
adjacent(r110, r40).
shared_edge(r110, r40, 2).
adjacent(r110, r89).
shared_edge(r110, r89, 2).
adjacent(r110, r97).
shared_edge(r110, r97, 1).
adjacent(r111, r117).
shared_edge(r111, r117, 2).
adjacent(r111, r124).
shared_edge(r111, r124, 1).
adjacent(r111, r14).
shared_edge(r111, r14, 1).
adjacent(r111, r98).
shared_edge(r111, r98, 1).
adjacent(r111, r99).
shared_edge(r111, r99, 1).
adjacent(r112, r14).
shared_edge(r112, r14, 2).
adjacent(r113, r114).
shared_edge(r113, r114, 2).
adjacent(r113, r14).
shared_edge(r113, r14, 1).
adjacent(r114, r119).
shared_edge(r114, r119, 1).
adjacent(r114, r120).
shared_edge(r114, r120, 4).
adjacent(r114, r126).
shared_edge(r114, r126, 1).
adjacent(r114, r133).
shared_edge(r114, r133, 3).
adjacent(r114, r141).
shared_edge(r114, r141, 1).
adjacent(r114, r155).
shared_edge(r114, r155, 1).
adjacent(r114, r170).
shared_edge(r114, r170, 2).
adjacent(r114, r171).
shared_edge(r114, r171, 3).
adjacent(r114, r186).
shared_edge(r114, r186, 2).
adjacent(r114, r187).
shared_edge(r114, r187, 1).
adjacent(r114, r198).
shared_edge(r114, r198, 1).
adjacent(r114, r212).
shared_edge(r114, r212, 1).
adjacent(r114, r213).
shared_edge(r114, r213, 2).
adjacent(r114, r223).
shared_edge(r114, r223, 1).
adjacent(r114, r240).
shared_edge(r114, r240, 1).
adjacent(r114, r241).
shared_edge(r114, r241, 2).
adjacent(r114, r261).
shared_edge(r114, r261, 4).
adjacent(r114, r262).
shared_edge(r114, r262, 2).
adjacent(r114, r283).
shared_edge(r114, r283, 1).
adjacent(r114, r284).
shared_edge(r114, r284, 1).
adjacent(r114, r297).
shared_edge(r114, r297, 2).
adjacent(r114, r325).
shared_edge(r114, r325, 1).
adjacent(r114, r333).
shared_edge(r114, r333, 2).
adjacent(r114, r334).
shared_edge(r114, r334, 2).
adjacent(r114, r354).
shared_edge(r114, r354, 2).
adjacent(r114, r368).
shared_edge(r114, r368, 3).
adjacent(r114, r86).
shared_edge(r114, r86, 10).
adjacent(r115, r116).
shared_edge(r115, r116, 1).
adjacent(r115, r122).
shared_edge(r115, r122, 1).
adjacent(r115, r2).
shared_edge(r115, r2, 2).
adjacent(r116, r122).
shared_edge(r116, r122, 1).
adjacent(r116, r129).
shared_edge(r116, r129, 1).
adjacent(r117, r123).
shared_edge(r117, r123, 1).
adjacent(r117, r98).
shared_edge(r117, r98, 1).
adjacent(r118, r14).
shared_edge(r118, r14, 2).
adjacent(r119, r126).
shared_edge(r119, r126, 1).
adjacent(r119, r14).
shared_edge(r119, r14, 2).
adjacent(r12, r13).
shared_edge(r12, r13, 1).
adjacent(r12, r33).
shared_edge(r12, r33, 2).
adjacent(r12, r43).
shared_edge(r12, r43, 1).
adjacent(r12, r44).
shared_edge(r12, r44, 2).
adjacent(r121, r127).
shared_edge(r121, r127, 2).
adjacent(r121, r135).
shared_edge(r121, r135, 2).
adjacent(r121, r143).
shared_edge(r121, r143, 1).
adjacent(r121, r157).
shared_edge(r121, r157, 1).
adjacent(r121, r2).
shared_edge(r121, r2, 10).
adjacent(r121, r87).
shared_edge(r121, r87, 4).
adjacent(r122, r128).
shared_edge(r122, r128, 1).
adjacent(r122, r2).
shared_edge(r122, r2, 1).
adjacent(r123, r124).
shared_edge(r123, r124, 1).
adjacent(r123, r131).
shared_edge(r123, r131, 1).
adjacent(r123, r98).
shared_edge(r123, r98, 1).
adjacent(r124, r125).
shared_edge(r124, r125, 1).
adjacent(r124, r14).
shared_edge(r124, r14, 1).
adjacent(r125, r14).
shared_edge(r125, r14, 2).
adjacent(r126, r132).
shared_edge(r126, r132, 1).
adjacent(r126, r14).
shared_edge(r126, r14, 1).
adjacent(r127, r87).
shared_edge(r127, r87, 1).
adjacent(r128, r129).
shared_edge(r128, r129, 2).
adjacent(r128, r137).
shared_edge(r128, r137, 3).
adjacent(r128, r138).
shared_edge(r128, r138, 1).
adjacent(r128, r145).
shared_edge(r128, r145, 2).
adjacent(r128, r2).
shared_edge(r128, r2, 3).
adjacent(r13, r14).
shared_edge(r13, r14, 1).
adjacent(r13, r34).
shared_edge(r13, r34, 1).
adjacent(r130, r138).
shared_edge(r130, r138, 1).
adjacent(r130, r146).
shared_edge(r130, r146, 2).
adjacent(r130, r147).
shared_edge(r130, r147, 4).
adjacent(r130, r148).
shared_edge(r130, r148, 2).
adjacent(r130, r163).
shared_edge(r130, r163, 2).
adjacent(r130, r164).
shared_edge(r130, r164, 1).
adjacent(r130, r177).
shared_edge(r130, r177, 1).
adjacent(r130, r178).
shared_edge(r130, r178, 2).
adjacent(r130, r179).
shared_edge(r130, r179, 1).
adjacent(r130, r193).
shared_edge(r130, r193, 2).
adjacent(r130, r194).
shared_edge(r130, r194, 1).
adjacent(r130, r206).
shared_edge(r130, r206, 1).
adjacent(r130, r216).
shared_edge(r130, r216, 1).
adjacent(r130, r217).
shared_edge(r130, r217, 2).
adjacent(r130, r231).
shared_edge(r130, r231, 1).
adjacent(r130, r232).
shared_edge(r130, r232, 2).
adjacent(r130, r233).
shared_edge(r130, r233, 2).
adjacent(r130, r252).
shared_edge(r130, r252, 1).
adjacent(r130, r253).
shared_edge(r130, r253, 2).
adjacent(r130, r254).
shared_edge(r130, r254, 1).
adjacent(r130, r275).
shared_edge(r130, r275, 2).
adjacent(r130, r276).
shared_edge(r130, r276, 2).
adjacent(r130, r292).
shared_edge(r130, r292, 1).
adjacent(r130, r89).
shared_edge(r130, r89, 9).
adjacent(r131, r139).
shared_edge(r131, r139, 1).
adjacent(r131, r14).
shared_edge(r131, r14, 1).
adjacent(r131, r98).
shared_edge(r131, r98, 1).
adjacent(r132, r133).
shared_edge(r132, r133, 1).
adjacent(r132, r14).
shared_edge(r132, r14, 1).
adjacent(r132, r141).
shared_edge(r132, r141, 1).
adjacent(r134, r215).
shared_edge(r134, r215, 1).
adjacent(r134, r226).
shared_edge(r134, r226, 2).
adjacent(r134, r244).
shared_edge(r134, r244, 2).
adjacent(r134, r264).
shared_edge(r134, r264, 1).
adjacent(r134, r288).
shared_edge(r134, r288, 2).
adjacent(r134, r298).
shared_edge(r134, r298, 1).
adjacent(r134, r299).
shared_edge(r134, r299, 2).
adjacent(r134, r313).
shared_edge(r134, r313, 2).
adjacent(r134, r340).
shared_edge(r134, r340, 1).
adjacent(r134, r86).
shared_edge(r134, r86, 38).
adjacent(r135, r143).
shared_edge(r135, r143, 1).
adjacent(r135, r87).
shared_edge(r135, r87, 1).
adjacent(r136, r137).
shared_edge(r136, r137, 1).
adjacent(r136, r2).
shared_edge(r136, r2, 3).
adjacent(r137, r144).
shared_edge(r137, r144, 2).
adjacent(r137, r160).
shared_edge(r137, r160, 1).
adjacent(r137, r2).
shared_edge(r137, r2, 1).
adjacent(r138, r146).
shared_edge(r138, r146, 1).
adjacent(r139, r140).
shared_edge(r139, r140, 1).
adjacent(r139, r153).
shared_edge(r139, r153, 1).
adjacent(r139, r98).
shared_edge(r139, r98, 1).
adjacent(r14, r140).
shared_edge(r14, r140, 2).
adjacent(r14, r141).
shared_edge(r14, r141, 1).
adjacent(r14, r149).
shared_edge(r14, r149, 1).
adjacent(r14, r15).
shared_edge(r14, r15, 2).
adjacent(r14, r154).
shared_edge(r14, r154, 1).
adjacent(r14, r155).
shared_edge(r14, r155, 1).
adjacent(r14, r164).
shared_edge(r14, r164, 1).
adjacent(r14, r165).
shared_edge(r14, r165, 2).
adjacent(r14, r169).
shared_edge(r14, r169, 2).
adjacent(r14, r170).
shared_edge(r14, r170, 2).
adjacent(r14, r179).
shared_edge(r14, r179, 1).
adjacent(r14, r180).
shared_edge(r14, r180, 2).
adjacent(r14, r181).
shared_edge(r14, r181, 1).
adjacent(r14, r184).
shared_edge(r14, r184, 1).
adjacent(r14, r185).
shared_edge(r14, r185, 2).
adjacent(r14, r194).
shared_edge(r14, r194, 1).
adjacent(r14, r195).
shared_edge(r14, r195, 2).
adjacent(r14, r196).
shared_edge(r14, r196, 1).
adjacent(r14, r197).
shared_edge(r14, r197, 2).
adjacent(r14, r198).
shared_edge(r14, r198, 1).
adjacent(r14, r207).
shared_edge(r14, r207, 4).
adjacent(r14, r208).
shared_edge(r14, r208, 4).
adjacent(r14, r209).
shared_edge(r14, r209, 3).
adjacent(r14, r210).
shared_edge(r14, r210, 3).
adjacent(r14, r211).
shared_edge(r14, r211, 2).
adjacent(r14, r218).
shared_edge(r14, r218, 1).
adjacent(r14, r219).
shared_edge(r14, r219, 2).
adjacent(r14, r221).
shared_edge(r14, r221, 1).
adjacent(r14, r222).
shared_edge(r14, r222, 1).
adjacent(r14, r234).
shared_edge(r14, r234, 2).
adjacent(r14, r235).
shared_edge(r14, r235, 2).
adjacent(r14, r237).
shared_edge(r14, r237, 2).
adjacent(r14, r238).
shared_edge(r14, r238, 3).
adjacent(r14, r239).
shared_edge(r14, r239, 2).
adjacent(r14, r254).
shared_edge(r14, r254, 1).
adjacent(r14, r255).
shared_edge(r14, r255, 1).
adjacent(r14, r258).
shared_edge(r14, r258, 1).
adjacent(r14, r259).
shared_edge(r14, r259, 1).
adjacent(r14, r277).
shared_edge(r14, r277, 2).
adjacent(r14, r278).
shared_edge(r14, r278, 2).
adjacent(r14, r280).
shared_edge(r14, r280, 1).
adjacent(r14, r281).
shared_edge(r14, r281, 2).
adjacent(r14, r292).
shared_edge(r14, r292, 1).
adjacent(r14, r293).
shared_edge(r14, r293, 1).
adjacent(r14, r295).
shared_edge(r14, r295, 2).
adjacent(r14, r304).
shared_edge(r14, r304, 3).
adjacent(r14, r307).
shared_edge(r14, r307, 1).
adjacent(r14, r308).
shared_edge(r14, r308, 1).
adjacent(r14, r310).
shared_edge(r14, r310, 3).
adjacent(r14, r311).
shared_edge(r14, r311, 2).
adjacent(r14, r321).
shared_edge(r14, r321, 2).
adjacent(r14, r322).
shared_edge(r14, r322, 2).
adjacent(r14, r323).
shared_edge(r14, r323, 2).
adjacent(r14, r34).
shared_edge(r14, r34, 1).
adjacent(r14, r349).
shared_edge(r14, r349, 3).
adjacent(r14, r350).
shared_edge(r14, r350, 2).
adjacent(r14, r351).
shared_edge(r14, r351, 2).
adjacent(r14, r367).
shared_edge(r14, r367, 1).
adjacent(r14, r378).
shared_edge(r14, r378, 1).
adjacent(r14, r379).
shared_edge(r14, r379, 1).
adjacent(r14, r381).
shared_edge(r14, r381, 1).
adjacent(r14, r393).
shared_edge(r14, r393, 1).
adjacent(r14, r397).
shared_edge(r14, r397, 1).
adjacent(r14, r412).
shared_edge(r14, r412, 4).
adjacent(r14, r413).
shared_edge(r14, r413, 3).
adjacent(r14, r414).
shared_edge(r14, r414, 8).
adjacent(r14, r415).
shared_edge(r14, r415, 1).
adjacent(r14, r423).
shared_edge(r14, r423, 1).
adjacent(r14, r433).
shared_edge(r14, r433, 3).
adjacent(r14, r442).
shared_edge(r14, r442, 2).
adjacent(r14, r45).
shared_edge(r14, r45, 1).
adjacent(r14, r454).
shared_edge(r14, r454, 1).
adjacent(r14, r455).
shared_edge(r14, r455, 1).
adjacent(r14, r46).
shared_edge(r14, r46, 1).
adjacent(r14, r465).
shared_edge(r14, r465, 1).
adjacent(r14, r466).
shared_edge(r14, r466, 1).
adjacent(r14, r467).
shared_edge(r14, r467, 4).
adjacent(r14, r474).
shared_edge(r14, r474, 1).
adjacent(r14, r475).
shared_edge(r14, r475, 3).
adjacent(r14, r476).
shared_edge(r14, r476, 2).
adjacent(r14, r484).
shared_edge(r14, r484, 1).
adjacent(r14, r485).
shared_edge(r14, r485, 1).
adjacent(r14, r486).
shared_edge(r14, r486, 1).
adjacent(r14, r489).
shared_edge(r14, r489, 2).
adjacent(r14, r49).
shared_edge(r14, r49, 2).
adjacent(r14, r491).
shared_edge(r14, r491, 2).
adjacent(r14, r492).
shared_edge(r14, r492, 1).
adjacent(r14, r56).
shared_edge(r14, r56, 1).
adjacent(r14, r57).
shared_edge(r14, r57, 2).
adjacent(r14, r58).
shared_edge(r14, r58, 3).
adjacent(r14, r59).
shared_edge(r14, r59, 1).
adjacent(r14, r60).
shared_edge(r14, r60, 1).
adjacent(r14, r69).
shared_edge(r14, r69, 4).
adjacent(r14, r75).
shared_edge(r14, r75, 1).
adjacent(r14, r82).
shared_edge(r14, r82, 6).
adjacent(r14, r83).
shared_edge(r14, r83, 2).
adjacent(r14, r84).
shared_edge(r14, r84, 1).
adjacent(r14, r91).
shared_edge(r14, r91, 1).
adjacent(r14, r92).
shared_edge(r14, r92, 2).
adjacent(r14, r99).
shared_edge(r14, r99, 1).
adjacent(r140, r154).
shared_edge(r140, r154, 1).
adjacent(r141, r155).
shared_edge(r141, r155, 1).
adjacent(r142, r156).
shared_edge(r142, r156, 1).
adjacent(r142, r172).
shared_edge(r142, r172, 3).
adjacent(r142, r200).
shared_edge(r142, r200, 51).
adjacent(r142, r266).
shared_edge(r142, r266, 4).
adjacent(r142, r314).
shared_edge(r142, r314, 6).
adjacent(r142, r315).
shared_edge(r142, r315, 4).
adjacent(r142, r87).
shared_edge(r142, r87, 27).
adjacent(r143, r156).
shared_edge(r143, r156, 1).
adjacent(r143, r87).
shared_edge(r143, r87, 1).
adjacent(r144, r145).
shared_edge(r144, r145, 1).
adjacent(r144, r161).
shared_edge(r144, r161, 1).
adjacent(r145, r146).
shared_edge(r145, r146, 1).
adjacent(r145, r162).
shared_edge(r145, r162, 1).
adjacent(r145, r163).
shared_edge(r145, r163, 1).
adjacent(r148, r149).
shared_edge(r148, r149, 1).
adjacent(r148, r164).
shared_edge(r148, r164, 1).
adjacent(r149, r150).
shared_edge(r149, r150, 1).
adjacent(r149, r165).
shared_edge(r149, r165, 1).
adjacent(r149, r89).
shared_edge(r149, r89, 2).
adjacent(r15, r16).
shared_edge(r15, r16, 2).
adjacent(r15, r46).
shared_edge(r15, r46, 1).
adjacent(r150, r151).
shared_edge(r150, r151, 1).
adjacent(r150, r166).
shared_edge(r150, r166, 1).
adjacent(r150, r89).
shared_edge(r150, r89, 1).
adjacent(r151, r167).
shared_edge(r151, r167, 1).
adjacent(r151, r98).
shared_edge(r151, r98, 2).
adjacent(r152, r153).
shared_edge(r152, r153, 2).
adjacent(r152, r98).
shared_edge(r152, r98, 2).
adjacent(r153, r154).
shared_edge(r153, r154, 1).
adjacent(r153, r168).
shared_edge(r153, r168, 1).
adjacent(r153, r169).
shared_edge(r153, r169, 1).
adjacent(r153, r184).
shared_edge(r153, r184, 1).
adjacent(r153, r185).
shared_edge(r153, r185, 1).
adjacent(r154, r169).
shared_edge(r154, r169, 1).
adjacent(r155, r170).
shared_edge(r155, r170, 1).
adjacent(r156, r157).
shared_edge(r156, r157, 1).
adjacent(r156, r172).
shared_edge(r156, r172, 1).
adjacent(r157, r173).
shared_edge(r157, r173, 1).
adjacent(r157, r2).
shared_edge(r157, r2, 1).
adjacent(r158, r159).
shared_edge(r158, r159, 1).
adjacent(r158, r174).
shared_edge(r158, r174, 1).
adjacent(r158, r2).
shared_edge(r158, r2, 2).
adjacent(r159, r160).
shared_edge(r159, r160, 1).
adjacent(r159, r175).
shared_edge(r159, r175, 1).
adjacent(r159, r2).
shared_edge(r159, r2, 1).
adjacent(r16, r17).
shared_edge(r16, r17, 1).
adjacent(r16, r35).
shared_edge(r16, r35, 1).
adjacent(r16, r47).
shared_edge(r16, r47, 1).
adjacent(r160, r161).
shared_edge(r160, r161, 1).
adjacent(r160, r176).
shared_edge(r160, r176, 1).
adjacent(r161, r162).
shared_edge(r161, r162, 1).
adjacent(r161, r176).
shared_edge(r161, r176, 1).
adjacent(r162, r163).
shared_edge(r162, r163, 1).
adjacent(r162, r177).
shared_edge(r162, r177, 1).
adjacent(r164, r180).
shared_edge(r164, r180, 1).
adjacent(r165, r166).
shared_edge(r165, r166, 1).
adjacent(r166, r167).
shared_edge(r166, r167, 1).
adjacent(r166, r181).
shared_edge(r166, r181, 1).
adjacent(r167, r168).
shared_edge(r167, r168, 1).
adjacent(r167, r182).
shared_edge(r167, r182, 1).
adjacent(r168, r183).
shared_edge(r168, r183, 1).
adjacent(r168, r98).
shared_edge(r168, r98, 1).
adjacent(r17, r18).
shared_edge(r17, r18, 1).
adjacent(r17, r35).
shared_edge(r17, r35, 1).
adjacent(r170, r198).
shared_edge(r170, r198, 1).
adjacent(r171, r186).
shared_edge(r171, r186, 1).
adjacent(r172, r173).
shared_edge(r172, r173, 1).
adjacent(r172, r189).
shared_edge(r172, r189, 2).
adjacent(r172, r201).
shared_edge(r172, r201, 1).
adjacent(r173, r174).
shared_edge(r173, r174, 1).
adjacent(r173, r190).
shared_edge(r173, r190, 1).
adjacent(r173, r191).
shared_edge(r173, r191, 1).
adjacent(r173, r192).
shared_edge(r173, r192, 1).
adjacent(r173, r2).
shared_edge(r173, r2, 2).
adjacent(r174, r175).
shared_edge(r174, r175, 1).
adjacent(r174, r192).
shared_edge(r174, r192, 1).
adjacent(r175, r176).
shared_edge(r175, r176, 1).
adjacent(r175, r192).
shared_edge(r175, r192, 1).
adjacent(r176, r177).
shared_edge(r176, r177, 1).
adjacent(r176, r192).
shared_edge(r176, r192, 2).
adjacent(r177, r193).
shared_edge(r177, r193, 1).
adjacent(r178, r179).
shared_edge(r178, r179, 1).
adjacent(r178, r194).
shared_edge(r178, r194, 1).
adjacent(r179, r180).
shared_edge(r179, r180, 1).
adjacent(r18, r19).
shared_edge(r18, r19, 1).
adjacent(r18, r36).
shared_edge(r18, r36, 1).
adjacent(r181, r182).
shared_edge(r181, r182, 1).
adjacent(r181, r195).
shared_edge(r181, r195, 1).
adjacent(r182, r183).
shared_edge(r182, r183, 1).
adjacent(r182, r196).
shared_edge(r182, r196, 1).
adjacent(r183, r184).
shared_edge(r183, r184, 1).
adjacent(r183, r197).
shared_edge(r183, r197, 1).
adjacent(r184, r185).
shared_edge(r184, r185, 1).
adjacent(r186, r187).
shared_edge(r186, r187, 1).
adjacent(r186, r199).
shared_edge(r186, r199, 1).
adjacent(r186, r213).
shared_edge(r186, r213, 1).
adjacent(r187, r188).
shared_edge(r187, r188, 1).
adjacent(r187, r199).
shared_edge(r187, r199, 1).
adjacent(r188, r199).
shared_edge(r188, r199, 1).
adjacent(r188, r215).
shared_edge(r188, r215, 1).
adjacent(r188, r86).
shared_edge(r188, r86, 3).
adjacent(r189, r190).
shared_edge(r189, r190, 1).
adjacent(r189, r202).
shared_edge(r189, r202, 1).
adjacent(r19, r20).
shared_edge(r19, r20, 1).
adjacent(r19, r36).
shared_edge(r19, r36, 1).
adjacent(r190, r191).
shared_edge(r190, r191, 1).
adjacent(r190, r203).
shared_edge(r190, r203, 1).
adjacent(r191, r192).
shared_edge(r191, r192, 1).
adjacent(r191, r204).
shared_edge(r191, r204, 1).
adjacent(r192, r193).
shared_edge(r192, r193, 2).
adjacent(r192, r205).
shared_edge(r192, r205, 6).
adjacent(r193, r216).
shared_edge(r193, r216, 1).
adjacent(r194, r206).
shared_edge(r194, r206, 1).
adjacent(r195, r196).
shared_edge(r195, r196, 1).
adjacent(r196, r197).
shared_edge(r196, r197, 1).
adjacent(r198, r212).
shared_edge(r198, r212, 1).
adjacent(r199, r214).
shared_edge(r199, r214, 1).
adjacent(r2, r28).
shared_edge(r2, r28, 2).
adjacent(r2, r3).
shared_edge(r2, r3, 2).
adjacent(r2, r38).
shared_edge(r2, r38, 2).
adjacent(r2, r52).
shared_edge(r2, r52, 2).
adjacent(r2, r64).
shared_edge(r2, r64, 2).
adjacent(r2, r72).
shared_edge(r2, r72, 1).
adjacent(r2, r79).
shared_edge(r2, r79, 4).
adjacent(r2, r80).
shared_edge(r2, r80, 5).
adjacent(r2, r95).
shared_edge(r2, r95, 4).
adjacent(r20, r21).
shared_edge(r20, r21, 1).
adjacent(r20, r37).
shared_edge(r20, r37, 1).
adjacent(r200, r201).
shared_edge(r200, r201, 3).
adjacent(r200, r227).
shared_edge(r200, r227, 1).
adjacent(r200, r248).
shared_edge(r200, r248, 17).
adjacent(r200, r316).
shared_edge(r200, r316, 4).
adjacent(r200, r327).
shared_edge(r200, r327, 35).
adjacent(r200, r393).
shared_edge(r200, r393, 28).
adjacent(r200, r410).
shared_edge(r200, r410, 4).
adjacent(r200, r439).
shared_edge(r200, r439, 6).
adjacent(r201, r202).
shared_edge(r201, r202, 2).
adjacent(r202, r203).
shared_edge(r202, r203, 2).
adjacent(r202, r204).
shared_edge(r202, r204, 1).
adjacent(r202, r227).
shared_edge(r202, r227, 1).
adjacent(r202, r228).
shared_edge(r202, r228, 1).
adjacent(r203, r204).
shared_edge(r203, r204, 1).
adjacent(r204, r205).
shared_edge(r204, r205, 3).
adjacent(r205, r216).
shared_edge(r205, r216, 1).
adjacent(r205, r228).
shared_edge(r205, r228, 2).
adjacent(r205, r229).
shared_edge(r205, r229, 4).
adjacent(r205, r248).
shared_edge(r205, r248, 4).
adjacent(r205, r267).
shared_edge(r205, r267, 1).
adjacent(r205, r268).
shared_edge(r205, r268, 1).
adjacent(r206, r207).
shared_edge(r206, r207, 1).
adjacent(r206, r217).
shared_edge(r206, r217, 1).
adjacent(r207, r218).
shared_edge(r207, r218, 1).
adjacent(r208, r220).
shared_edge(r208, r220, 1).
adjacent(r208, r221).
shared_edge(r208, r221, 1).
adjacent(r209, r210).
shared_edge(r209, r210, 2).
adjacent(r209, r238).
shared_edge(r209, r238, 1).
adjacent(r21, r22).
shared_edge(r21, r22, 2).
adjacent(r21, r37).
shared_edge(r21, r37, 1).
adjacent(r21, r51).
shared_edge(r21, r51, 1).
adjacent(r210, r238).
shared_edge(r210, r238, 1).
adjacent(r211, r212).
shared_edge(r211, r212, 1).
adjacent(r211, r222).
shared_edge(r211, r222, 1).
adjacent(r212, r223).
shared_edge(r212, r223, 1).
adjacent(r213, r214).
shared_edge(r213, r214, 1).
adjacent(r213, r224).
shared_edge(r213, r224, 1).
adjacent(r213, r241).
shared_edge(r213, r241, 1).
adjacent(r214, r215).
shared_edge(r214, r215, 1).
adjacent(r214, r224).
shared_edge(r214, r224, 1).
adjacent(r215, r225).
shared_edge(r215, r225, 1).
adjacent(r216, r230).
shared_edge(r216, r230, 1).
adjacent(r217, r218).
shared_edge(r217, r218, 1).
adjacent(r218, r233).
shared_edge(r218, r233, 1).
adjacent(r219, r220).
shared_edge(r219, r220, 1).
adjacent(r219, r236).
shared_edge(r219, r236, 1).
adjacent(r22, r23).
shared_edge(r22, r23, 5).
adjacent(r220, r221).
shared_edge(r220, r221, 1).
adjacent(r220, r236).
shared_edge(r220, r236, 1).
adjacent(r220, r237).
shared_edge(r220, r237, 1).
adjacent(r220, r257).
shared_edge(r220, r257, 1).
adjacent(r221, r237).
shared_edge(r221, r237, 1).
adjacent(r222, r223).
shared_edge(r222, r223, 1).
adjacent(r222, r239).
shared_edge(r222, r239, 1).
adjacent(r222, r240).
shared_edge(r222, r240, 1).
adjacent(r222, r261).
shared_edge(r222, r261, 1).
adjacent(r223, r240).
shared_edge(r223, r240, 1).
adjacent(r224, r225).
shared_edge(r224, r225, 1).
adjacent(r224, r242).
shared_edge(r224, r242, 1).
adjacent(r225, r226).
shared_edge(r225, r226, 1).
adjacent(r225, r243).
shared_edge(r225, r243, 1).
adjacent(r226, r243).
shared_edge(r226, r243, 1).
adjacent(r227, r228).
shared_edge(r227, r228, 1).
adjacent(r227, r248).
shared_edge(r227, r248, 1).
adjacent(r229, r230).
shared_edge(r229, r230, 1).
adjacent(r229, r249).
shared_edge(r229, r249, 2).
adjacent(r229, r269).
shared_edge(r229, r269, 1).
adjacent(r23, r24).
shared_edge(r23, r24, 42).
adjacent(r23, r247).
shared_edge(r23, r247, 4).
adjacent(r23, r51).
shared_edge(r23, r51, 52).
adjacent(r230, r231).
shared_edge(r230, r231, 1).
adjacent(r230, r250).
shared_edge(r230, r250, 1).
adjacent(r231, r232).
shared_edge(r231, r232, 1).
adjacent(r231, r250).
shared_edge(r231, r250, 1).
adjacent(r232, r251).
shared_edge(r232, r251, 1).
adjacent(r233, r234).
shared_edge(r233, r234, 1).
adjacent(r234, r254).
shared_edge(r234, r254, 1).
adjacent(r235, r236).
shared_edge(r235, r236, 1).
adjacent(r235, r255).
shared_edge(r235, r255, 1).
adjacent(r236, r256).
shared_edge(r236, r256, 1).
adjacent(r237, r257).
shared_edge(r237, r257, 1).
adjacent(r237, r280).
shared_edge(r237, r280, 1).
adjacent(r238, r258).
shared_edge(r238, r258, 1).
adjacent(r239, r260).
shared_edge(r239, r260, 1).
adjacent(r24, r25).
shared_edge(r24, r25, 27).
adjacent(r240, r262).
shared_edge(r240, r262, 1).
adjacent(r241, r242).
shared_edge(r241, r242, 2).
adjacent(r241, r283).
shared_edge(r241, r283, 1).
adjacent(r242, r243).
shared_edge(r242, r243, 2).
adjacent(r242, r284).
shared_edge(r242, r284, 1).
adjacent(r243, r244).
shared_edge(r243, r244, 1).
adjacent(r243, r263).
shared_edge(r243, r263, 2).
adjacent(r243, r285).
shared_edge(r243, r285, 1).
adjacent(r244, r264).
shared_edge(r244, r264, 1).
adjacent(r245, r246).
shared_edge(r245, r246, 3).
adjacent(r245, r86).
shared_edge(r245, r86, 3).
adjacent(r246, r247).
shared_edge(r246, r247, 10).
adjacent(r246, r265).
shared_edge(r246, r265, 27).
adjacent(r246, r342).
shared_edge(r246, r342, 2).
adjacent(r246, r360).
shared_edge(r246, r360, 21).
adjacent(r246, r390).
shared_edge(r246, r390, 1).
adjacent(r246, r438).
shared_edge(r246, r438, 3).
adjacent(r246, r51).
shared_edge(r246, r51, 3).
adjacent(r247, r342).
shared_edge(r247, r342, 12).
adjacent(r248, r267).
shared_edge(r248, r267, 1).
adjacent(r248, r289).
shared_edge(r248, r289, 3).
adjacent(r248, r300).
shared_edge(r248, r300, 1).
adjacent(r248, r317).
shared_edge(r248, r317, 2).
adjacent(r248, r328).
shared_edge(r248, r328, 1).
adjacent(r248, r343).
shared_edge(r248, r343, 7).
adjacent(r248, r409).
shared_edge(r248, r409, 2).
adjacent(r248, r410).
shared_edge(r248, r410, 1).
adjacent(r249, r250).
shared_edge(r249, r250, 1).
adjacent(r249, r270).
shared_edge(r249, r270, 1).
adjacent(r25, r26).
shared_edge(r25, r26, 14).
adjacent(r250, r251).
shared_edge(r250, r251, 1).
adjacent(r250, r271).
shared_edge(r250, r271, 2).
adjacent(r250, r272).
shared_edge(r250, r272, 2).
adjacent(r251, r252).
shared_edge(r251, r252, 1).
adjacent(r251, r272).
shared_edge(r251, r272, 1).
adjacent(r252, r253).
shared_edge(r252, r253, 1).
adjacent(r252, r273).
shared_edge(r252, r273, 1).
adjacent(r253, r274).
shared_edge(r253, r274, 1).
adjacent(r254, r277).
shared_edge(r254, r277, 1).
adjacent(r255, r256).
shared_edge(r255, r256, 1).
adjacent(r255, r278).
shared_edge(r255, r278, 1).
adjacent(r256, r257).
shared_edge(r256, r257, 1).
adjacent(r256, r279).
shared_edge(r256, r279, 1).
adjacent(r257, r279).
shared_edge(r257, r279, 1).
adjacent(r258, r259).
shared_edge(r258, r259, 1).
adjacent(r258, r281).
shared_edge(r258, r281, 1).
adjacent(r259, r260).
shared_edge(r259, r260, 1).
adjacent(r259, r282).
shared_edge(r259, r282, 1).
adjacent(r26, r27).
shared_edge(r26, r27, 4).
adjacent(r260, r261).
shared_edge(r260, r261, 2).
adjacent(r260, r282).
shared_edge(r260, r282, 1).
adjacent(r260, r296).
shared_edge(r260, r296, 1).
adjacent(r261, r262).
shared_edge(r261, r262, 1).
adjacent(r261, r296).
shared_edge(r261, r296, 3).
adjacent(r261, r324).
shared_edge(r261, r324, 2).
adjacent(r261, r333).
shared_edge(r261, r333, 1).
adjacent(r263, r264).
shared_edge(r263, r264, 1).
adjacent(r263, r286).
shared_edge(r263, r286, 1).
adjacent(r264, r287).
shared_edge(r264, r287, 1).
adjacent(r265, r390).
shared_edge(r265, r390, 3).
adjacent(r265, r407).
shared_edge(r265, r407, 1).
adjacent(r265, r418).
shared_edge(r265, r418, 2).
adjacent(r265, r86).
shared_edge(r265, r86, 29).
adjacent(r267, r268).
shared_edge(r267, r268, 1).
adjacent(r267, r270).
shared_edge(r267, r270, 1).
adjacent(r268, r269).
shared_edge(r268, r269, 1).
adjacent(r268, r270).
shared_edge(r268, r270, 1).
adjacent(r269, r270).
shared_edge(r269, r270, 1).
adjacent(r269, r290).
shared_edge(r269, r290, 1).
adjacent(r270, r271).
shared_edge(r270, r271, 1).
adjacent(r270, r289).
shared_edge(r270, r289, 2).
adjacent(r270, r290).
shared_edge(r270, r290, 3).
adjacent(r270, r291).
shared_edge(r270, r291, 1).
adjacent(r270, r300).
shared_edge(r270, r300, 1).
adjacent(r270, r301).
shared_edge(r270, r301, 1).
adjacent(r270, r317).
shared_edge(r270, r317, 1).
adjacent(r270, r318).
shared_edge(r270, r318, 3).
adjacent(r270, r319).
shared_edge(r270, r319, 2).
adjacent(r270, r328).
shared_edge(r270, r328, 1).
adjacent(r270, r330).
shared_edge(r270, r330, 3).
adjacent(r270, r346).
shared_edge(r270, r346, 1).
adjacent(r271, r291).
shared_edge(r271, r291, 1).
adjacent(r272, r273).
shared_edge(r272, r273, 2).
adjacent(r272, r274).
shared_edge(r272, r274, 1).
adjacent(r272, r275).
shared_edge(r272, r275, 1).
adjacent(r272, r291).
shared_edge(r272, r291, 1).
adjacent(r272, r292).
shared_edge(r272, r292, 1).
adjacent(r272, r302).
shared_edge(r272, r302, 1).
adjacent(r272, r303).
shared_edge(r272, r303, 1).
adjacent(r272, r304).
shared_edge(r272, r304, 2).
adjacent(r272, r305).
shared_edge(r272, r305, 1).
adjacent(r273, r274).
shared_edge(r273, r274, 1).
adjacent(r274, r275).
shared_edge(r274, r275, 1).
adjacent(r276, r277).
shared_edge(r276, r277, 1).
adjacent(r276, r292).
shared_edge(r276, r292, 1).
adjacent(r278, r279).
shared_edge(r278, r279, 1).
adjacent(r279, r280).
shared_edge(r279, r280, 1).
adjacent(r279, r293).
shared_edge(r279, r293, 1).
adjacent(r279, r294).
shared_edge(r279, r294, 1).
adjacent(r28, r29).
shared_edge(r28, r29, 1).
adjacent(r28, r4).
shared_edge(r28, r4, 1).
adjacent(r280, r294).
shared_edge(r280, r294, 1).
adjacent(r281, r282).
shared_edge(r281, r282, 1).
adjacent(r281, r296).
shared_edge(r281, r296, 1).
adjacent(r281, r311).
shared_edge(r281, r311, 1).
adjacent(r282, r296).
shared_edge(r282, r296, 1).
adjacent(r283, r284).
shared_edge(r283, r284, 1).
adjacent(r283, r297).
shared_edge(r283, r297, 1).
adjacent(r284, r285).
shared_edge(r284, r285, 3).
adjacent(r284, r286).
shared_edge(r284, r286, 1).
adjacent(r284, r297).
shared_edge(r284, r297, 1).
adjacent(r284, r325).
shared_edge(r284, r325, 1).
adjacent(r284, r326).
shared_edge(r284, r326, 1).
adjacent(r285, r286).
shared_edge(r285, r286, 2).
adjacent(r286, r287).
shared_edge(r286, r287, 2).
adjacent(r286, r298).
shared_edge(r286, r298, 4).
adjacent(r287, r288).
shared_edge(r287, r288, 1).
adjacent(r288, r298).
shared_edge(r288, r298, 1).
adjacent(r289, r300).
shared_edge(r289, r300, 1).
adjacent(r29, r30).
shared_edge(r29, r30, 1).
adjacent(r29, r38).
shared_edge(r29, r38, 1).
adjacent(r29, r5).
shared_edge(r29, r5, 1).
adjacent(r291, r301).
shared_edge(r291, r301, 1).
adjacent(r292, r306).
shared_edge(r292, r306, 1).
adjacent(r292, r307).
shared_edge(r292, r307, 1).
adjacent(r293, r294).
shared_edge(r293, r294, 1).
adjacent(r293, r308).
shared_edge(r293, r308, 1).
adjacent(r294, r295).
shared_edge(r294, r295, 1).
adjacent(r294, r309).
shared_edge(r294, r309, 3).
adjacent(r294, r310).
shared_edge(r294, r310, 1).
adjacent(r295, r310).
shared_edge(r295, r310, 1).
adjacent(r296, r311).
shared_edge(r296, r311, 1).
adjacent(r296, r323).
shared_edge(r296, r323, 1).
adjacent(r298, r299).
shared_edge(r298, r299, 1).
adjacent(r298, r312).
shared_edge(r298, r312, 2).
adjacent(r298, r313).
shared_edge(r298, r313, 1).
adjacent(r298, r326).
shared_edge(r298, r326, 1).
adjacent(r298, r336).
shared_edge(r298, r336, 2).
adjacent(r298, r337).
shared_edge(r298, r337, 3).
adjacent(r298, r338).
shared_edge(r298, r338, 1).
adjacent(r298, r339).
shared_edge(r298, r339, 1).
adjacent(r299, r312).
shared_edge(r299, r312, 1).
adjacent(r3, r4).
shared_edge(r3, r4, 1).
adjacent(r30, r39).
shared_edge(r30, r39, 1).
adjacent(r30, r5).
shared_edge(r30, r5, 2).
adjacent(r300, r317).
shared_edge(r300, r317, 1).
adjacent(r301, r302).
shared_edge(r301, r302, 1).
adjacent(r301, r319).
shared_edge(r301, r319, 1).
adjacent(r302, r303).
shared_edge(r302, r303, 1).
adjacent(r302, r320).
shared_edge(r302, r320, 1).
adjacent(r303, r304).
shared_edge(r303, r304, 2).
adjacent(r304, r305).
shared_edge(r304, r305, 3).
adjacent(r304, r306).
shared_edge(r304, r306, 2).
adjacent(r304, r320).
shared_edge(r304, r320, 1).
adjacent(r304, r321).
shared_edge(r304, r321, 3).
adjacent(r304, r331).
shared_edge(r304, r331, 3).
adjacent(r304, r366).
shared_edge(r304, r366, 2).
adjacent(r304, r377).
shared_edge(r304, r377, 1).
adjacent(r304, r378).
shared_edge(r304, r378, 1).
adjacent(r304, r379).
shared_edge(r304, r379, 1).
adjacent(r306, r307).
shared_edge(r306, r307, 1).
adjacent(r307, r321).
shared_edge(r307, r321, 1).
adjacent(r308, r309).
shared_edge(r308, r309, 1).
adjacent(r308, r322).
shared_edge(r308, r322, 1).
adjacent(r309, r310).
shared_edge(r309, r310, 1).
adjacent(r309, r322).
shared_edge(r309, r322, 2).
adjacent(r309, r332).
shared_edge(r309, r332, 5).
adjacent(r309, r349).
shared_edge(r309, r349, 3).
adjacent(r309, r380).
shared_edge(r309, r380, 2).
adjacent(r309, r382).
shared_edge(r309, r382, 1).
adjacent(r309, r398).
shared_edge(r309, r398, 3).
adjacent(r309, r399).
shared_edge(r309, r399, 3).
adjacent(r309, r400).
shared_edge(r309, r400, 1).
adjacent(r309, r415).
shared_edge(r309, r415, 1).
adjacent(r309, r416).
shared_edge(r309, r416, 1).
adjacent(r309, r423).
shared_edge(r309, r423, 1).
adjacent(r309, r424).
shared_edge(r309, r424, 2).
adjacent(r309, r434).
shared_edge(r309, r434, 8).
adjacent(r309, r435).
shared_edge(r309, r435, 1).
adjacent(r309, r444).
shared_edge(r309, r444, 1).
adjacent(r31, r32).
shared_edge(r31, r32, 1).
adjacent(r31, r41).
shared_edge(r31, r41, 1).
adjacent(r31, r6).
shared_edge(r31, r6, 1).
adjacent(r31, r9).
shared_edge(r31, r9, 1).
adjacent(r310, r332).
shared_edge(r310, r332, 1).
adjacent(r310, r350).
shared_edge(r310, r350, 1).
adjacent(r312, r313).
shared_edge(r312, r313, 1).
adjacent(r318, r329).
shared_edge(r318, r329, 1).
adjacent(r319, r320).
shared_edge(r319, r320, 2).
adjacent(r319, r347).
shared_edge(r319, r347, 1).
adjacent(r32, r41).
shared_edge(r32, r41, 1).
adjacent(r320, r331).
shared_edge(r320, r331, 1).
adjacent(r320, r348).
shared_edge(r320, r348, 1).
adjacent(r322, r349).
shared_edge(r322, r349, 1).
adjacent(r323, r324).
shared_edge(r323, r324, 2).
adjacent(r323, r333).
shared_edge(r323, r333, 1).
adjacent(r323, r352).
shared_edge(r323, r352, 1).
adjacent(r323, r353).
shared_edge(r323, r353, 1).
adjacent(r325, r326).
shared_edge(r325, r326, 1).
adjacent(r325, r334).
shared_edge(r325, r334, 1).
adjacent(r325, r335).
shared_edge(r325, r335, 2).
adjacent(r326, r335).
shared_edge(r326, r335, 1).
adjacent(r327, r483).
shared_edge(r327, r483, 8).
adjacent(r328, r329).
shared_edge(r328, r329, 1).
adjacent(r328, r344).
shared_edge(r328, r344, 1).
adjacent(r329, r330).
shared_edge(r329, r330, 2).
adjacent(r329, r344).
shared_edge(r329, r344, 1).
adjacent(r329, r361).
shared_edge(r329, r361, 1).
adjacent(r33, r34).
shared_edge(r33, r34, 1).
adjacent(r33, r44).
shared_edge(r33, r44, 1).
adjacent(r330, r345).
shared_edge(r330, r345, 3).
adjacent(r330, r361).
shared_edge(r330, r361, 1).
adjacent(r330, r362).
shared_edge(r330, r362, 2).
adjacent(r330, r374).
shared_edge(r330, r374, 2).
adjacent(r330, r375).
shared_edge(r330, r375, 6).
adjacent(r330, r378).
shared_edge(r330, r378, 2).
adjacent(r330, r396).
shared_edge(r330, r396, 3).
adjacent(r330, r412).
shared_edge(r330, r412, 4).
adjacent(r330, r421).
shared_edge(r330, r421, 2).
adjacent(r330, r422).
shared_edge(r330, r422, 4).
adjacent(r330, r431).
shared_edge(r330, r431, 2).
adjacent(r330, r432).
shared_edge(r330, r432, 4).
adjacent(r330, r441).
shared_edge(r330, r441, 3).
adjacent(r330, r451).
shared_edge(r330, r451, 1).
adjacent(r330, r452).
shared_edge(r330, r452, 2).
adjacent(r331, r348).
shared_edge(r331, r348, 1).
adjacent(r331, r365).
shared_edge(r331, r365, 1).
adjacent(r332, r350).
shared_edge(r332, r350, 2).
adjacent(r333, r353).
shared_edge(r333, r353, 2).
adjacent(r333, r368).
shared_edge(r333, r368, 5).
adjacent(r333, r384).
shared_edge(r333, r384, 1).
adjacent(r333, r401).
shared_edge(r333, r401, 2).
adjacent(r333, r425).
shared_edge(r333, r425, 1).
adjacent(r333, r436).
shared_edge(r333, r436, 1).
adjacent(r334, r354).
shared_edge(r334, r354, 1).
adjacent(r335, r336).
shared_edge(r335, r336, 1).
adjacent(r335, r354).
shared_edge(r335, r354, 2).
adjacent(r335, r355).
shared_edge(r335, r355, 3).
adjacent(r335, r385).
shared_edge(r335, r385, 2).
adjacent(r335, r403).
shared_edge(r335, r403, 1).
adjacent(r336, r355).
shared_edge(r336, r355, 1).
adjacent(r337, r338).
shared_edge(r337, r338, 1).
adjacent(r337, r355).
shared_edge(r337, r355, 1).
adjacent(r337, r356).
shared_edge(r337, r356, 1).
adjacent(r337, r369).
shared_edge(r337, r369, 2).
adjacent(r337, r370).
shared_edge(r337, r370, 1).
adjacent(r337, r386).
shared_edge(r337, r386, 1).
adjacent(r338, r339).
shared_edge(r338, r339, 1).
adjacent(r338, r356).
shared_edge(r338, r356, 1).
adjacent(r339, r340).
shared_edge(r339, r340, 1).
adjacent(r339, r356).
shared_edge(r339, r356, 1).
adjacent(r339, r357).
shared_edge(r339, r357, 2).
adjacent(r339, r370).
shared_edge(r339, r370, 1).
adjacent(r339, r388).
shared_edge(r339, r388, 1).
adjacent(r34, r45).
shared_edge(r34, r45, 1).
adjacent(r340, r341).
shared_edge(r340, r341, 1).
adjacent(r340, r357).
shared_edge(r340, r357, 1).
adjacent(r341, r358).
shared_edge(r341, r358, 1).
adjacent(r341, r86).
shared_edge(r341, r86, 2).
adjacent(r342, r360).
shared_edge(r342, r360, 23).
adjacent(r342, r385).
shared_edge(r342, r385, 1).
adjacent(r342, r390).
shared_edge(r342, r390, 21).
adjacent(r342, r393).
shared_edge(r342, r393, 38).
adjacent(r342, r408).
shared_edge(r342, r408, 19).
adjacent(r342, r426).
shared_edge(r342, r426, 1).
adjacent(r342, r438).
shared_edge(r342, r438, 3).
adjacent(r342, r448).
shared_edge(r342, r448, 1).
adjacent(r342, r462).
shared_edge(r342, r462, 3).
adjacent(r342, r472).
shared_edge(r342, r472, 1).
adjacent(r342, r480).
shared_edge(r342, r480, 2).
adjacent(r343, r344).
shared_edge(r343, r344, 2).
adjacent(r343, r361).
shared_edge(r343, r361, 1).
adjacent(r343, r373).
shared_edge(r343, r373, 1).
adjacent(r343, r393).
shared_edge(r343, r393, 6).
adjacent(r343, r410).
shared_edge(r343, r410, 3).
adjacent(r345, r346).
shared_edge(r345, r346, 1).
adjacent(r346, r347).
shared_edge(r346, r347, 1).
adjacent(r346, r362).
shared_edge(r346, r362, 1).
adjacent(r347, r348).
shared_edge(r347, r348, 1).
adjacent(r347, r363).
shared_edge(r347, r363, 1).
adjacent(r348, r364).
shared_edge(r348, r364, 1).
adjacent(r349, r397).
shared_edge(r349, r397, 1).
adjacent(r35, r36).
shared_edge(r35, r36, 1).
adjacent(r35, r48).
shared_edge(r35, r48, 1).
adjacent(r350, r380).
shared_edge(r350, r380, 1).
adjacent(r351, r352).
shared_edge(r351, r352, 1).
adjacent(r351, r367).
shared_edge(r351, r367, 1).
adjacent(r352, r353).
shared_edge(r352, r353, 2).
adjacent(r353, r367).
shared_edge(r353, r367, 1).
adjacent(r353, r383).
shared_edge(r353, r383, 1).
adjacent(r353, r384).
shared_edge(r353, r384, 1).
adjacent(r354, r385).
shared_edge(r354, r385, 1).
adjacent(r355, r369).
shared_edge(r355, r369, 2).
adjacent(r355, r386).
shared_edge(r355, r386, 1).
adjacent(r355, r404).
shared_edge(r355, r404, 1).
adjacent(r355, r405).
shared_edge(r355, r405, 1).
adjacent(r356, r370).
shared_edge(r356, r370, 1).
adjacent(r357, r358).
shared_edge(r357, r358, 1).
adjacent(r357, r371).
shared_edge(r357, r371, 1).
adjacent(r357, r389).
shared_edge(r357, r389, 1).
adjacent(r358, r359).
shared_edge(r358, r359, 1).
adjacent(r358, r371).
shared_edge(r358, r371, 1).
adjacent(r359, r372).
shared_edge(r359, r372, 1).
adjacent(r359, r86).
shared_edge(r359, r86, 2).
adjacent(r36, r37).
shared_edge(r36, r37, 1).
adjacent(r36, r49).
shared_edge(r36, r49, 2).
adjacent(r361, r373).
shared_edge(r361, r373, 1).
adjacent(r362, r363).
shared_edge(r362, r363, 1).
adjacent(r363, r364).
shared_edge(r363, r364, 1).
adjacent(r363, r375).
shared_edge(r363, r375, 1).
adjacent(r364, r365).
shared_edge(r364, r365, 1).
adjacent(r364, r375).
shared_edge(r364, r375, 1).
adjacent(r365, r366).
shared_edge(r365, r366, 1).
adjacent(r365, r376).
shared_edge(r365, r376, 1).
adjacent(r366, r377).
shared_edge(r366, r377, 1).
adjacent(r367, r382).
shared_edge(r367, r382, 1).
adjacent(r368, r385).
shared_edge(r368, r385, 1).
adjacent(r368, r402).
shared_edge(r368, r402, 5).
adjacent(r368, r436).
shared_edge(r368, r436, 1).
adjacent(r368, r446).
shared_edge(r368, r446, 1).
adjacent(r37, r50).
shared_edge(r37, r50, 1).
adjacent(r370, r387).
shared_edge(r370, r387, 1).
adjacent(r371, r372).
shared_edge(r371, r372, 1).
adjacent(r371, r389).
shared_edge(r371, r389, 1).
adjacent(r372, r390).
shared_edge(r372, r390, 1).
adjacent(r372, r86).
shared_edge(r372, r86, 1).
adjacent(r373, r374).
shared_edge(r373, r374, 1).
adjacent(r373, r394).
shared_edge(r373, r394, 1).
adjacent(r374, r395).
shared_edge(r374, r395, 1).
adjacent(r375, r376).
shared_edge(r375, r376, 2).
adjacent(r375, r377).
shared_edge(r375, r377, 1).
adjacent(r375, r378).
shared_edge(r375, r378, 1).
adjacent(r376, r377).
shared_edge(r376, r377, 1).
adjacent(r377, r378).
shared_edge(r377, r378, 2).
adjacent(r378, r379).
shared_edge(r378, r379, 2).
adjacent(r378, r412).
shared_edge(r378, r412, 1).
adjacent(r38, r39).
shared_edge(r38, r39, 1).
adjacent(r380, r381).
shared_edge(r380, r381, 1).
adjacent(r381, r382).
shared_edge(r381, r382, 1).
adjacent(r381, r399).
shared_edge(r381, r399, 1).
adjacent(r382, r383).
shared_edge(r382, r383, 1).
adjacent(r383, r384).
shared_edge(r383, r384, 1).
adjacent(r383, r400).
shared_edge(r383, r400, 1).
adjacent(r384, r401).
shared_edge(r384, r401, 1).
adjacent(r385, r402).
shared_edge(r385, r402, 4).
adjacent(r385, r403).
shared_edge(r385, r403, 3).
adjacent(r385, r404).
shared_edge(r385, r404, 1).
adjacent(r385, r405).
shared_edge(r385, r405, 1).
adjacent(r385, r426).
shared_edge(r385, r426, 1).
adjacent(r385, r437).
shared_edge(r385, r437, 9).
adjacent(r385, r447).
shared_edge(r385, r447, 1).
adjacent(r385, r448).
shared_edge(r385, r448, 1).
adjacent(r386, r387).
shared_edge(r386, r387, 1).
adjacent(r386, r406).
shared_edge(r386, r406, 1).
adjacent(r387, r388).
shared_edge(r387, r388, 2).
adjacent(r387, r390).
shared_edge(r387, r390, 1).
adjacent(r387, r406).
shared_edge(r387, r406, 1).
adjacent(r387, r417).
shared_edge(r387, r417, 2).
adjacent(r388, r389).
shared_edge(r388, r389, 1).
adjacent(r389, r390).
shared_edge(r389, r390, 3).
adjacent(r39, r52).
shared_edge(r39, r52, 1).
adjacent(r39, r6).
shared_edge(r39, r6, 1).
adjacent(r390, r391).
shared_edge(r390, r391, 2).
adjacent(r390, r407).
shared_edge(r390, r407, 2).
adjacent(r390, r417).
shared_edge(r390, r417, 3).
adjacent(r390, r418).
shared_edge(r390, r418, 2).
adjacent(r390, r426).
shared_edge(r390, r426, 1).
adjacent(r391, r392).
shared_edge(r391, r392, 1).
adjacent(r391, r86).
shared_edge(r391, r86, 1).
adjacent(r392, r407).
shared_edge(r392, r407, 1).
adjacent(r392, r86).
shared_edge(r392, r86, 2).
adjacent(r393, r394).
shared_edge(r393, r394, 2).
adjacent(r393, r410).
shared_edge(r393, r410, 2).
adjacent(r393, r411).
shared_edge(r393, r411, 3).
adjacent(r393, r419).
shared_edge(r393, r419, 1).
adjacent(r393, r427).
shared_edge(r393, r427, 2).
adjacent(r393, r428).
shared_edge(r393, r428, 10).
adjacent(r393, r434).
shared_edge(r393, r434, 12).
adjacent(r393, r437).
shared_edge(r393, r437, 1).
adjacent(r393, r449).
shared_edge(r393, r449, 17).
adjacent(r393, r452).
shared_edge(r393, r452, 1).
adjacent(r393, r463).
shared_edge(r393, r463, 5).
adjacent(r393, r464).
shared_edge(r393, r464, 1).
adjacent(r393, r473).
shared_edge(r393, r473, 2).
adjacent(r393, r476).
shared_edge(r393, r476, 1).
adjacent(r393, r484).
shared_edge(r393, r484, 1).
adjacent(r393, r487).
shared_edge(r393, r487, 3).
adjacent(r393, r488).
shared_edge(r393, r488, 2).
adjacent(r393, r489).
shared_edge(r393, r489, 2).
adjacent(r393, r490).
shared_edge(r393, r490, 2).
adjacent(r393, r491).
shared_edge(r393, r491, 2).
adjacent(r393, r492).
shared_edge(r393, r492, 1).
adjacent(r393, r493).
shared_edge(r393, r493, 4).
adjacent(r393, r494).
shared_edge(r393, r494, 2).
adjacent(r394, r395).
shared_edge(r394, r395, 2).
adjacent(r394, r411).
shared_edge(r394, r411, 1).
adjacent(r395, r396).
shared_edge(r395, r396, 2).
adjacent(r395, r419).
shared_edge(r395, r419, 1).
adjacent(r396, r420).
shared_edge(r396, r420, 1).
adjacent(r397, r398).
shared_edge(r397, r398, 1).
adjacent(r397, r415).
shared_edge(r397, r415, 1).
adjacent(r4, r5).
shared_edge(r4, r5, 1).
adjacent(r40, r41).
shared_edge(r40, r41, 1).
adjacent(r40, r54).
shared_edge(r40, r54, 1).
adjacent(r40, r6).
shared_edge(r40, r6, 15).
adjacent(r40, r67).
shared_edge(r40, r67, 3).
adjacent(r40, r68).
shared_edge(r40, r68, 1).
adjacent(r40, r69).
shared_edge(r40, r69, 1).
adjacent(r40, r73).
shared_edge(r40, r73, 1).
adjacent(r40, r74).
shared_edge(r40, r74, 2).
adjacent(r40, r81).
shared_edge(r40, r81, 1).
adjacent(r40, r88).
shared_edge(r40, r88, 1).
adjacent(r40, r89).
shared_edge(r40, r89, 16).
adjacent(r40, r90).
shared_edge(r40, r90, 2).
adjacent(r40, r97).
shared_edge(r40, r97, 1).
adjacent(r400, r401).
shared_edge(r400, r401, 1).
adjacent(r400, r416).
shared_edge(r400, r416, 1).
adjacent(r401, r416).
shared_edge(r401, r416, 1).
adjacent(r401, r425).
shared_edge(r401, r425, 1).
adjacent(r402, r447).
shared_edge(r402, r447, 1).
adjacent(r403, r404).
shared_edge(r403, r404, 2).
adjacent(r404, r405).
shared_edge(r404, r405, 2).
adjacent(r405, r406).
shared_edge(r405, r406, 2).
adjacent(r406, r417).
shared_edge(r406, r417, 1).
adjacent(r406, r426).
shared_edge(r406, r426, 1).
adjacent(r408, r449).
shared_edge(r408, r449, 10).
adjacent(r409, r410).
shared_edge(r409, r410, 2).
adjacent(r41, r42).
shared_edge(r41, r42, 1).
adjacent(r41, r54).
shared_edge(r41, r54, 1).
adjacent(r41, r55).
shared_edge(r41, r55, 1).
adjacent(r410, r427).
shared_edge(r410, r427, 2).
adjacent(r412, r413).
shared_edge(r412, r413, 3).
adjacent(r412, r453).
shared_edge(r412, r453, 2).
adjacent(r412, r464).
shared_edge(r412, r464, 1).
adjacent(r412, r474).
shared_edge(r412, r474, 1).
adjacent(r414, r442).
shared_edge(r414, r442, 2).
adjacent(r415, r423).
shared_edge(r415, r423, 1).
adjacent(r416, r424).
shared_edge(r416, r424, 1).
adjacent(r419, r420).
shared_edge(r419, r420, 1).
adjacent(r419, r428).
shared_edge(r419, r428, 1).
adjacent(r42, r43).
shared_edge(r42, r43, 1).
adjacent(r42, r55).
shared_edge(r42, r55, 1).
adjacent(r420, r421).
shared_edge(r420, r421, 1).
adjacent(r420, r429).
shared_edge(r420, r429, 1).
adjacent(r421, r430).
shared_edge(r421, r430, 1).
adjacent(r423, r433).
shared_edge(r423, r433, 1).
adjacent(r424, r425).
shared_edge(r424, r425, 1).
adjacent(r425, r435).
shared_edge(r425, r435, 1).
adjacent(r428, r429).
shared_edge(r428, r429, 2).
adjacent(r428, r430).
shared_edge(r428, r430, 1).
adjacent(r428, r440).
shared_edge(r428, r440, 2).
adjacent(r428, r441).
shared_edge(r428, r441, 1).
adjacent(r428, r450).
shared_edge(r428, r450, 1).
adjacent(r429, r430).
shared_edge(r429, r430, 1).
adjacent(r43, r44).
shared_edge(r43, r44, 1).
adjacent(r43, r56).
shared_edge(r43, r56, 1).
adjacent(r430, r431).
shared_edge(r430, r431, 1).
adjacent(r431, r440).
shared_edge(r431, r440, 1).
adjacent(r433, r434).
shared_edge(r433, r434, 1).
adjacent(r433, r443).
shared_edge(r433, r443, 1).
adjacent(r433, r456).
shared_edge(r433, r456, 1).
adjacent(r433, r468).
shared_edge(r433, r468, 1).
adjacent(r434, r443).
shared_edge(r434, r443, 3).
adjacent(r434, r458).
shared_edge(r434, r458, 3).
adjacent(r434, r459).
shared_edge(r434, r459, 5).
adjacent(r434, r461).
shared_edge(r434, r461, 1).
adjacent(r434, r470).
shared_edge(r434, r470, 2).
adjacent(r434, r471).
shared_edge(r434, r471, 2).
adjacent(r434, r478).
shared_edge(r434, r478, 1).
adjacent(r434, r479).
shared_edge(r434, r479, 2).
adjacent(r435, r436).
shared_edge(r435, r436, 1).
adjacent(r435, r444).
shared_edge(r435, r444, 1).
adjacent(r436, r445).
shared_edge(r436, r445, 1).
adjacent(r437, r447).
shared_edge(r437, r447, 1).
adjacent(r437, r448).
shared_edge(r437, r448, 1).
adjacent(r437, r462).
shared_edge(r437, r462, 1).
adjacent(r437, r471).
shared_edge(r437, r471, 3).
adjacent(r437, r472).
shared_edge(r437, r472, 2).
adjacent(r437, r480).
shared_edge(r437, r480, 2).
adjacent(r44, r45).
shared_edge(r44, r45, 1).
adjacent(r44, r57).
shared_edge(r44, r57, 2).
adjacent(r44, r58).
shared_edge(r44, r58, 1).
adjacent(r440, r441).
shared_edge(r440, r441, 1).
adjacent(r441, r450).
shared_edge(r441, r450, 1).
adjacent(r442, r454).
shared_edge(r442, r454, 1).
adjacent(r442, r455).
shared_edge(r442, r455, 1).
adjacent(r443, r456).
shared_edge(r443, r456, 1).
adjacent(r443, r457).
shared_edge(r443, r457, 1).
adjacent(r444, r445).
shared_edge(r444, r445, 1).
adjacent(r444, r459).
shared_edge(r444, r459, 1).
adjacent(r445, r446).
shared_edge(r445, r446, 1).
adjacent(r445, r460).
shared_edge(r445, r460, 1).
adjacent(r446, r447).
shared_edge(r446, r447, 1).
adjacent(r446, r461).
shared_edge(r446, r461, 1).
adjacent(r447, r461).
shared_edge(r447, r461, 1).
adjacent(r447, r471).
shared_edge(r447, r471, 1).
adjacent(r448, r462).
shared_edge(r448, r462, 1).
adjacent(r449, r481).
shared_edge(r449, r481, 4).
adjacent(r449, r482).
shared_edge(r449, r482, 13).
adjacent(r449, r494).
shared_edge(r449, r494, 1).
adjacent(r45, r58).
shared_edge(r45, r58, 1).
adjacent(r450, r451).
shared_edge(r450, r451, 1).
adjacent(r450, r463).
shared_edge(r450, r463, 1).
adjacent(r451, r452).
shared_edge(r451, r452, 1).
adjacent(r451, r463).
shared_edge(r451, r463, 1).
adjacent(r452, r453).
shared_edge(r452, r453, 1).
adjacent(r452, r463).
shared_edge(r452, r463, 1).
adjacent(r453, r464).
shared_edge(r453, r464, 1).
adjacent(r454, r455).
shared_edge(r454, r455, 1).
adjacent(r454, r465).
shared_edge(r454, r465, 1).
adjacent(r455, r466).
shared_edge(r455, r466, 1).
adjacent(r456, r457).
shared_edge(r456, r457, 1).
adjacent(r456, r469).
shared_edge(r456, r469, 1).
adjacent(r457, r458).
shared_edge(r457, r458, 1).
adjacent(r457, r470).
shared_edge(r457, r470, 1).
adjacent(r459, r460).
shared_edge(r459, r460, 2).
adjacent(r46, r47).
shared_edge(r46, r47, 1).
adjacent(r46, r59).
shared_edge(r46, r59, 1).
adjacent(r460, r461).
shared_edge(r460, r461, 1).
adjacent(r462, r472).
shared_edge(r462, r472, 1).
adjacent(r464, r473).
shared_edge(r464, r473, 1).
adjacent(r465, r466).
shared_edge(r465, r466, 1).
adjacent(r465, r475).
shared_edge(r465, r475, 1).
adjacent(r465, r476).
shared_edge(r465, r476, 1).
adjacent(r465, r485).
shared_edge(r465, r485, 1).
adjacent(r466, r476).
shared_edge(r466, r476, 1).
adjacent(r467, r468).
shared_edge(r467, r468, 1).
adjacent(r467, r477).
shared_edge(r467, r477, 1).
adjacent(r468, r469).
shared_edge(r468, r469, 1).
adjacent(r468, r477).
shared_edge(r468, r477, 1).
adjacent(r469, r470).
shared_edge(r469, r470, 1).
adjacent(r469, r478).
shared_edge(r469, r478, 1).
adjacent(r47, r48).
shared_edge(r47, r48, 1).
adjacent(r47, r60).
shared_edge(r47, r60, 1).
adjacent(r471, r479).
shared_edge(r471, r479, 2).
adjacent(r473, r474).
shared_edge(r473, r474, 1).
adjacent(r474, r484).
shared_edge(r474, r484, 1).
adjacent(r476, r485).
shared_edge(r476, r485, 1).
adjacent(r477, r478).
shared_edge(r477, r478, 1).
adjacent(r477, r486).
shared_edge(r477, r486, 1).
adjacent(r478, r487).
shared_edge(r478, r487, 1).
adjacent(r48, r49).
shared_edge(r48, r49, 1).
adjacent(r48, r61).
shared_edge(r48, r61, 1).
adjacent(r484, r488).
shared_edge(r484, r488, 1).
adjacent(r485, r490).
shared_edge(r485, r490, 1).
adjacent(r486, r487).
shared_edge(r486, r487, 1).
adjacent(r486, r492).
shared_edge(r486, r492, 1).
adjacent(r487, r492).
shared_edge(r487, r492, 1).
adjacent(r488, r489).
shared_edge(r488, r489, 1).
adjacent(r489, r490).
shared_edge(r489, r490, 1).
adjacent(r49, r50).
shared_edge(r49, r50, 1).
adjacent(r49, r62).
shared_edge(r49, r62, 5).
adjacent(r49, r63).
shared_edge(r49, r63, 1).
adjacent(r49, r71).
shared_edge(r49, r71, 1).
adjacent(r49, r77).
shared_edge(r49, r77, 1).
adjacent(r49, r78).
shared_edge(r49, r78, 1).
adjacent(r49, r84).
shared_edge(r49, r84, 1).
adjacent(r49, r85).
shared_edge(r49, r85, 1).
adjacent(r49, r94).
shared_edge(r49, r94, 2).
adjacent(r493, r494).
shared_edge(r493, r494, 1).
adjacent(r5, r6).
shared_edge(r5, r6, 4).
adjacent(r50, r51).
shared_edge(r50, r51, 1).
adjacent(r50, r63).
shared_edge(r50, r63, 1).
adjacent(r51, r63).
shared_edge(r51, r63, 1).
adjacent(r51, r71).
shared_edge(r51, r71, 1).
adjacent(r51, r78).
shared_edge(r51, r78, 1).
adjacent(r51, r86).
shared_edge(r51, r86, 42).
adjacent(r52, r53).
shared_edge(r52, r53, 1).
adjacent(r53, r6).
shared_edge(r53, r6, 2).
adjacent(r53, r64).
shared_edge(r53, r64, 1).
adjacent(r54, r55).
shared_edge(r54, r55, 1).
adjacent(r54, r68).
shared_edge(r54, r68, 1).
adjacent(r55, r56).
shared_edge(r55, r56, 1).
adjacent(r55, r69).
shared_edge(r55, r69, 2).
adjacent(r56, r57).
shared_edge(r56, r57, 1).
adjacent(r57, r58).
shared_edge(r57, r58, 1).
adjacent(r59, r60).
shared_edge(r59, r60, 2).
adjacent(r6, r65).
shared_edge(r6, r65, 1).
adjacent(r6, r66).
shared_edge(r6, r66, 1).
adjacent(r6, r7).
shared_edge(r6, r7, 3).
adjacent(r6, r8).
shared_edge(r6, r8, 2).
adjacent(r60, r61).
shared_edge(r60, r61, 1).
adjacent(r60, r70).
shared_edge(r60, r70, 1).
adjacent(r60, r75).
shared_edge(r60, r75, 1).
adjacent(r60, r76).
shared_edge(r60, r76, 1).
adjacent(r61, r62).
shared_edge(r61, r62, 1).
adjacent(r61, r70).
shared_edge(r61, r70, 1).
adjacent(r62, r70).
shared_edge(r62, r70, 1).
adjacent(r62, r77).
shared_edge(r62, r77, 1).
adjacent(r63, r71).
shared_edge(r63, r71, 1).
adjacent(r64, r65).
shared_edge(r64, r65, 1).
adjacent(r65, r66).
shared_edge(r65, r66, 1).
adjacent(r65, r72).
shared_edge(r65, r72, 1).
adjacent(r66, r67).
shared_edge(r66, r67, 1).
adjacent(r66, r73).
shared_edge(r66, r73, 1).
adjacent(r68, r69).
shared_edge(r68, r69, 1).
adjacent(r68, r74).
shared_edge(r68, r74, 1).
adjacent(r69, r74).
shared_edge(r69, r74, 1).
adjacent(r69, r91).
shared_edge(r69, r91, 1).
adjacent(r70, r77).
shared_edge(r70, r77, 1).
adjacent(r71, r78).
shared_edge(r71, r78, 1).
adjacent(r72, r73).
shared_edge(r72, r73, 1).
adjacent(r72, r80).
shared_edge(r72, r80, 1).
adjacent(r73, r81).
shared_edge(r73, r81, 1).
adjacent(r75, r76).
shared_edge(r75, r76, 1).
adjacent(r75, r83).
shared_edge(r75, r83, 1).
adjacent(r76, r77).
shared_edge(r76, r77, 1).
adjacent(r76, r84).
shared_edge(r76, r84, 1).
adjacent(r78, r85).
shared_edge(r78, r85, 1).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r80, r81).
shared_edge(r80, r81, 1).
adjacent(r80, r88).
shared_edge(r80, r88, 1).
adjacent(r80, r96).
shared_edge(r80, r96, 2).
adjacent(r81, r88).
shared_edge(r81, r88, 1).
adjacent(r82, r93).
shared_edge(r82, r93, 2).
adjacent(r83, r84).
shared_edge(r83, r84, 1).
adjacent(r85, r86).
shared_edge(r85, r86, 2).
adjacent(r86, r94).
shared_edge(r86, r94, 1).
adjacent(r88, r97).
shared_edge(r88, r97, 1).
adjacent(r89, r98).
shared_edge(r89, r98, 10).
adjacent(r90, r91).
shared_edge(r90, r91, 1).
adjacent(r90, r98).
shared_edge(r90, r98, 1).
adjacent(r91, r99).
shared_edge(r91, r99, 1).
adjacent(r92, r93).
shared_edge(r92, r93, 1).
adjacent(r96, r97).
shared_edge(r96, r97, 1).
adjacent(r98, r99).
shared_edge(r98, r99, 1).
