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

region(r1, '#090905', 281, centroid(22,9)).
polygon(r1, [xy(0,0),xy(0,2),xy(2,2),xy(3,3),xy(4,3),xy(5,4),xy(6,4),xy(7,5),xy(8,5),xy(9,6),xy(10,6),xy(11,7),xy(12,7),xy(13,8),xy(14,8),xy(15,9),xy(16,9),xy(17,10),xy(18,10),xy(19,11),xy(20,11),xy(21,12),xy(22,12),xy(23,13),xy(24,13),xy(25,14),xy(26,14),xy(27,15),xy(28,15),xy(30,17),xy(31,17),xy(32,18),xy(33,18),xy(34,19),xy(35,19),xy(36,20),xy(37,20),xy(38,21),xy(39,21),xy(40,22),xy(41,21),xy(41,20),xy(37,16),xy(36,16),xy(35,15),xy(34,15),xy(33,14),xy(31,14),xy(30,13),xy(29,13),xy(28,12),xy(27,12),xy(26,11),xy(26,10),xy(27,9),xy(27,8),xy(26,7),xy(25,7),xy(24,6),xy(23,6),xy(22,5),xy(21,5),xy(20,4),xy(19,4),xy(18,3),xy(17,3),xy(16,2),xy(15,2),xy(14,1),xy(13,1),xy(12,0),xy(1,0),xy(0,0)]).
hole(r1, [xy(18,6),xy(19,6),xy(18,6)]).
hole(r1, [xy(20,7),xy(21,7),xy(20,7)]).
hole(r1, [xy(27,10),xy(27,11),xy(29,11),xy(29,12),xy(30,11),xy(30,12),xy(31,12),xy(31,13),xy(32,12),xy(32,13),xy(33,13),xy(27,10)]).
hole(r1, [xy(34,14),xy(36,14),xy(36,15),xy(38,15),xy(38,16),xy(34,14)]).
midline(r1, [xy(1,1),xy(3,1),xy(3,2),xy(7,2),xy(7,3),xy(11,3),xy(11,4),xy(12,3),xy(13,5),xy(13,6),xy(14,6),xy(15,7),xy(16,7),xy(17,8),xy(21,10),xy(23,9),xy(23,10),xy(24,9)]).
midline(r1, [xy(16,3),xy(17,4),xy(16,5),xy(17,5),xy(18,4),xy(22,6)]).
midline(r1, [xy(25,12),xy(27,13),xy(27,14),xy(28,13),xy(28,14),xy(32,16),xy(33,16),xy(34,17),xy(35,17),xy(36,18),xy(37,18),xy(38,19),xy(40,20),xy(40,21)]).
midline(r1, [xy(28,9)]).
midline(r1, [xy(34,12),xy(35,12),xy(39,14)]).
fillpoint(r1, xy(24,9), 4).
fillpoint(r1, xy(23,10), 4).
fillpoint(r1, xy(23,9), 4).
fillpoint(r1, xy(12,3), 4).
fillpoint(r1, xy(11,4), 4).
region(r5, '#525758', 188, centroid(55,2)).
polygon(r5, [xy(16,0),xy(18,0),xy(18,1),xy(19,0),xy(19,1),xy(20,1),xy(20,2),xy(21,1),xy(21,2),xy(22,3),xy(25,3),xy(26,4),xy(27,4),xy(28,3),xy(28,2),xy(29,1),xy(28,0),xy(22,0),xy(16,0)]).
midline(r5, [xy(22,1),xy(22,2),xy(23,1),xy(23,2),xy(24,1),xy(24,2),xy(26,2),xy(28,1)]).
midline(r5, [xy(39,1),xy(42,1)]).
midline(r5, [xy(46,1),xy(53,1)]).
midline(r5, [xy(71,1),xy(72,1),xy(72,2),xy(73,1),xy(73,2),xy(74,1),xy(74,2),xy(75,1),xy(75,2),xy(76,2),xy(76,3),xy(78,3)]).
midline(r5, [xy(90,6)]).
midline(r5, [xy(94,7)]).
fillpoint(r5, xy(26,2), 3).
fillpoint(r5, xy(94,7), 2).
fillpoint(r5, xy(90,6), 2).
fillpoint(r5, xy(78,3), 2).
fillpoint(r5, xy(77,3), 2).
region(r7, '#494d4d', 85, centroid(87,2)).
polygon(r7, [xy(76,0),xy(77,0),xy(77,1),xy(78,0),xy(78,1),xy(79,0),xy(95,0),xy(95,4),xy(94,5),xy(91,5),xy(90,4),xy(88,4),xy(87,3),xy(81,3),xy(80,2),xy(79,2),xy(76,0)]).
midline(r7, [xy(79,1),xy(81,1),xy(81,2),xy(82,1),xy(82,2),xy(83,1),xy(83,2),xy(84,1),xy(84,2),xy(85,1),xy(85,2),xy(86,1),xy(86,2),xy(91,2),xy(91,3),xy(92,2),xy(92,3),xy(93,2),xy(93,3)]).
fillpoint(r7, xy(93,3), 3).
fillpoint(r7, xy(93,2), 3).
fillpoint(r7, xy(92,3), 3).
fillpoint(r7, xy(92,2), 3).
fillpoint(r7, xy(91,3), 3).
region(r11, '#555a5b', 124, centroid(40,4)).
polygon(r11, [xy(26,5),xy(28,5),xy(28,6),xy(29,5),xy(29,6),xy(30,7),xy(31,6),xy(32,7),xy(32,8),xy(33,7),xy(34,8),xy(34,9),xy(35,8),xy(35,7),xy(36,6),xy(37,7),xy(38,6),xy(39,6),xy(40,5),xy(42,5),xy(43,4),xy(42,3),xy(39,3),xy(37,1),xy(36,2),xy(35,1),xy(32,1),xy(31,2),xy(29,2),xy(29,3),xy(30,4),xy(26,5)]).
midline(r11, [xy(30,3),xy(30,6)]).
midline(r11, [xy(33,4),xy(34,4),xy(34,5),xy(35,4),xy(37,4)]).
midline(r11, [xy(40,4),xy(42,4),xy(43,3),xy(45,3)]).
midline(r11, [xy(49,4),xy(50,4),xy(50,5),xy(51,4),xy(51,5),xy(52,4),xy(52,5),xy(54,3),xy(54,4)]).
fillpoint(r11, xy(37,4), 4).
fillpoint(r11, xy(35,4), 4).
fillpoint(r11, xy(34,5), 4).
fillpoint(r11, xy(34,4), 4).
fillpoint(r11, xy(33,4), 4).
region(r12, '#555a5b', 36, centroid(66,2)).
polygon(r12, [xy(58,1),xy(59,1),xy(59,2),xy(60,1),xy(60,2),xy(61,1),xy(63,1),xy(63,2),xy(64,1),xy(64,2),xy(65,1),xy(69,1),xy(71,3),xy(70,4),xy(69,4),xy(68,3),xy(65,3),xy(58,1)]).
midline(r12, [xy(65,2),xy(69,2),xy(69,3),xy(70,3)]).
fillpoint(r12, xy(70,3), 2).
fillpoint(r12, xy(69,3), 2).
fillpoint(r12, xy(69,2), 2).
fillpoint(r12, xy(68,2), 2).
fillpoint(r12, xy(67,2), 2).
region(r16, '#595d5e', 145, centroid(51,7)).
polygon(r16, [xy(35,9),xy(36,8),xy(36,7),xy(37,8),xy(36,9),xy(38,9),xy(39,10),xy(40,9),xy(43,9),xy(44,10),xy(44,11),xy(43,12),xy(44,12),xy(45,10),xy(46,11),xy(48,11),xy(49,10),xy(53,10),xy(54,9),xy(56,9),xy(57,8),xy(57,7),xy(58,6),xy(59,7),xy(60,6),xy(62,6),xy(63,5),xy(62,4),xy(63,3),xy(62,2),xy(61,2),xy(60,3),xy(59,3),xy(58,2),xy(57,3),xy(56,3),xy(56,4),xy(54,6),xy(53,6),xy(52,7),xy(49,7),xy(47,5),xy(43,5),xy(42,6),xy(40,6),xy(39,7),xy(38,7),xy(35,9)]).
midline(r16, [xy(38,8),xy(39,8),xy(39,9),xy(40,8),xy(40,7),xy(41,7),xy(41,8),xy(43,7),xy(44,7),xy(44,8),xy(47,8)]).
midline(r16, [xy(50,8),xy(50,9),xy(51,8),xy(51,9),xy(55,7),xy(58,4),xy(59,5),xy(61,3),xy(61,5),xy(62,5),xy(62,3)]).
fillpoint(r16, xy(47,8), 4).
fillpoint(r16, xy(46,8), 4).
fillpoint(r16, xy(59,5), 3).
fillpoint(r16, xy(58,4), 3).
fillpoint(r16, xy(57,5), 3).
region(r17, '#333330', 33, centroid(7,7)).
polygon(r17, [xy(0,3),xy(0,4),xy(1,4),xy(1,5),xy(2,4),xy(2,5),xy(3,5),xy(3,6),xy(4,5),xy(4,6),xy(5,6),xy(5,7),xy(6,6),xy(7,6),xy(8,7),xy(7,8),xy(6,8),xy(8,9),xy(9,9),xy(10,8),xy(9,7),xy(10,9),xy(11,8),xy(11,9),xy(13,9),xy(13,10),xy(15,10),xy(0,3)]).
midline(r17, [xy(6,7),xy(7,7),xy(8,8),xy(9,8)]).
fillpoint(r17, xy(9,8), 2).
fillpoint(r17, xy(8,8), 2).
fillpoint(r17, xy(7,7), 2).
fillpoint(r17, xy(6,7), 2).
fillpoint(r17, xy(15,10), 1).
region(r29, '#494d4d', 115, centroid(17,15)).
polygon(r29, [xy(0,5),xy(0,7),xy(1,6),xy(2,6),xy(3,7),xy(2,8),xy(1,8),xy(3,9),xy(4,9),xy(5,8),xy(6,9),xy(5,10),xy(6,10),xy(7,9),xy(8,10),xy(7,11),xy(8,11),xy(9,10),xy(12,10),xy(13,11),xy(15,11),xy(16,12),xy(17,12),xy(18,13),xy(19,13),xy(20,14),xy(21,14),xy(21,15),xy(20,16),xy(18,16),xy(17,15),xy(13,15),xy(12,14),xy(11,14),xy(9,12),xy(0,5)]).
midline(r29, [xy(1,7),xy(2,7),xy(3,8),xy(4,8),xy(5,9),xy(11,12),xy(12,12),xy(13,13),xy(17,13),xy(17,14),xy(18,14),xy(18,15),xy(19,14),xy(19,15),xy(20,15),xy(21,16)]).
midline(r29, [xy(33,23),xy(35,24),xy(36,24)]).
fillpoint(r29, xy(15,13), 3).
fillpoint(r29, xy(14,13), 3).
fillpoint(r29, xy(13,13), 3).
fillpoint(r29, xy(12,12), 3).
fillpoint(r29, xy(11,12), 3).
region(r34, '#5d6262', 74, centroid(81,9)).
polygon(r34, [xy(63,6),xy(66,6),xy(67,5),xy(67,6),xy(68,5),xy(68,6),xy(71,6),xy(72,5),xy(72,6),xy(73,5),xy(73,6),xy(74,6),xy(74,7),xy(75,6),xy(75,7),xy(76,6),xy(78,6),xy(79,7),xy(78,8),xy(76,8),xy(63,6)]).
midline(r34, [xy(76,7),xy(78,7)]).
midline(r34, [xy(82,8),xy(83,8),xy(83,9),xy(85,9),xy(87,11),xy(88,11),xy(88,12),xy(89,13),xy(89,15),xy(90,15),xy(90,16)]).
fillpoint(r34, xy(90,16), 2).
fillpoint(r34, xy(90,15), 2).
fillpoint(r34, xy(89,15), 2).
fillpoint(r34, xy(89,14), 2).
fillpoint(r34, xy(89,13), 2).
region(r36, '#595d5e', 4, centroid(76,5)).
polygon(r36, [xy(74,5),xy(77,5),xy(74,5)]).
fillpoint(r36, xy(77,5), 1).
fillpoint(r36, xy(76,5), 1).
fillpoint(r36, xy(75,5), 1).
fillpoint(r36, xy(74,5), 1).
region(r37, '#555a5b', 41, centroid(89,9)).
polygon(r37, [xy(78,5),xy(85,5),xy(85,6),xy(87,6),xy(87,7),xy(88,7),xy(88,8),xy(89,7),xy(89,8),xy(90,8),xy(90,9),xy(91,8),xy(93,8),xy(93,9),xy(94,10),xy(94,12),xy(93,13),xy(92,12),xy(92,11),xy(91,10),xy(78,5)]).
midline(r37, [xy(91,9),xy(92,9),xy(92,10),xy(93,10),xy(93,12)]).
fillpoint(r37, xy(93,12), 2).
fillpoint(r37, xy(93,11), 2).
fillpoint(r37, xy(93,10), 2).
fillpoint(r37, xy(92,10), 2).
fillpoint(r37, xy(92,9), 2).
region(r43, '#595d5e', 52, centroid(90,14)).
polygon(r43, [xy(79,6),xy(84,6),xy(84,7),xy(86,7),xy(86,8),xy(87,8),xy(87,9),xy(89,9),xy(89,10),xy(90,10),xy(90,12),xy(91,11),xy(91,14),xy(92,13),xy(92,16),xy(88,20),xy(89,20),xy(90,19),xy(91,19),xy(91,20),xy(94,20),xy(94,21),xy(95,20),xy(95,21),xy(79,6)]).
midline(r43, [xy(91,18),xy(93,16),xy(93,17),xy(94,17)]).
fillpoint(r43, xy(94,17), 2).
fillpoint(r43, xy(93,17), 2).
fillpoint(r43, xy(93,16), 2).
fillpoint(r43, xy(92,17), 2).
fillpoint(r43, xy(91,18), 2).
region(r52, '#626767', 102, centroid(79,12)).
polygon(r52, [xy(60,8),xy(62,8),xy(63,7),xy(63,8),xy(64,7),xy(64,8),xy(65,7),xy(65,8),xy(66,7),xy(66,8),xy(67,7),xy(67,8),xy(68,7),xy(68,8),xy(69,7),xy(69,8),xy(70,7),xy(70,8),xy(71,7),xy(71,8),xy(72,7),xy(73,7),xy(74,8),xy(73,9),xy(74,9),xy(75,8),xy(75,9),xy(76,9),xy(76,10),xy(77,9),xy(77,10),xy(78,9),xy(78,10),xy(79,9),xy(81,9),xy(83,11),xy(85,11),xy(87,13),xy(87,15),xy(88,16),xy(88,17),xy(86,19),xy(85,18),xy(83,18),xy(82,17),xy(81,17),xy(80,16),xy(79,16),xy(81,15),xy(82,14),xy(82,13),xy(81,12),xy(80,12),xy(79,11),xy(60,8)]).
midline(r52, [xy(72,8),xy(73,8)]).
midline(r52, [xy(79,10),xy(80,10),xy(80,11),xy(81,10),xy(81,11),xy(82,11),xy(82,12),xy(84,13),xy(85,13),xy(84,15),xy(86,16),xy(86,17)]).
midline(r52, [xy(81,16)]).
fillpoint(r52, xy(84,15), 4).
fillpoint(r52, xy(86,17), 3).
fillpoint(r52, xy(86,16), 3).
fillpoint(r52, xy(85,16), 3).
fillpoint(r52, xy(85,15), 3).
region(r53, '#525758', 10, centroid(3,10)).
polygon(r53, [xy(0,8),xy(0,9),xy(2,9),xy(2,10),xy(4,10),xy(4,11),xy(6,11),xy(0,8)]).
fillpoint(r53, xy(6,11), 1).
fillpoint(r53, xy(5,11), 1).
fillpoint(r53, xy(4,11), 1).
fillpoint(r53, xy(4,10), 1).
fillpoint(r53, xy(3,10), 1).
region(r66, '#696e6e', 164, centroid(66,13)).
polygon(r66, [xy(52,15),xy(53,15),xy(54,14),xy(54,13),xy(55,12),xy(56,12),xy(59,9),xy(61,9),xy(61,10),xy(59,12),xy(60,13),xy(62,13),xy(63,12),xy(63,11),xy(62,10),xy(62,9),xy(71,9),xy(72,10),xy(75,10),xy(76,11),xy(78,11),xy(80,13),xy(81,13),xy(81,14),xy(80,15),xy(79,15),xy(78,14),xy(76,14),xy(75,13),xy(72,13),xy(71,14),xy(67,14),xy(66,15),xy(67,16),xy(66,17),xy(64,17),xy(63,18),xy(62,17),xy(59,17),xy(57,15),xy(56,16),xy(55,16),xy(54,15),xy(52,15)]).
hole(r66, [xy(60,12),xy(61,11),xy(61,12),xy(62,11),xy(62,12),xy(60,12)]).
midline(r66, [xy(56,14),xy(57,13),xy(58,13),xy(58,14),xy(59,14),xy(59,15),xy(63,15),xy(66,12),xy(68,11),xy(68,12),xy(69,11),xy(69,12),xy(70,11),xy(70,12),xy(71,11),xy(71,12),xy(73,11),xy(73,12),xy(74,11),xy(74,12),xy(75,11),xy(75,12),xy(76,12),xy(76,13),xy(77,12),xy(77,13),xy(78,12),xy(78,13),xy(79,13),xy(79,14),xy(80,14)]).
midline(r66, [xy(58,11),xy(59,10),xy(59,11),xy(60,10)]).
midline(r66, [xy(63,10)]).
midline(r66, [xy(66,16)]).
fillpoint(r66, xy(66,12), 4).
fillpoint(r66, xy(65,13), 4).
fillpoint(r66, xy(64,14), 4).
fillpoint(r66, xy(63,15), 4).
fillpoint(r66, xy(71,12), 3).
region(r67, '#555a5b', 5, centroid(1,11)).
polygon(r67, [xy(0,10),xy(1,10),xy(1,11),xy(3,11),xy(0,10)]).
fillpoint(r67, xy(3,11), 1).
fillpoint(r67, xy(2,11), 1).
fillpoint(r67, xy(1,11), 1).
fillpoint(r67, xy(1,10), 1).
fillpoint(r67, xy(0,10), 1).
region(r69, '#1b1914', 12, centroid(30,12)).
polygon(r69, [xy(27,10),xy(27,11),xy(29,11),xy(29,12),xy(30,11),xy(30,12),xy(31,12),xy(31,13),xy(32,12),xy(32,13),xy(33,13),xy(27,10)]).
fillpoint(r69, xy(33,13), 1).
fillpoint(r69, xy(32,13), 1).
fillpoint(r69, xy(32,12), 1).
fillpoint(r69, xy(31,13), 1).
fillpoint(r69, xy(31,12), 1).
region(r75, '#5d6262', 7, centroid(41,10)).
polygon(r75, [xy(39,11),xy(40,10),xy(40,11),xy(41,10),xy(43,10),xy(43,11),xy(39,11)]).
fillpoint(r75, xy(43,11), 1).
fillpoint(r75, xy(43,10), 1).
fillpoint(r75, xy(42,10), 1).
fillpoint(r75, xy(41,10), 1).
fillpoint(r75, xy(40,11), 1).
region(r77, '#626767', 25, centroid(51,13)).
polygon(r77, [xy(46,14),xy(47,14),xy(48,13),xy(48,14),xy(49,13),xy(51,13),xy(52,12),xy(53,12),xy(53,13),xy(51,15),xy(49,15),xy(46,14)]).
midline(r77, [xy(49,14),xy(51,14),xy(52,13)]).
fillpoint(r77, xy(52,13), 2).
fillpoint(r77, xy(51,14), 2).
fillpoint(r77, xy(50,14), 2).
fillpoint(r77, xy(49,14), 2).
fillpoint(r77, xy(57,10), 1).
region(r78, '#595d5e', 8, centroid(2,12)).
polygon(r78, [xy(0,11),xy(0,13),xy(1,12),xy(5,12),xy(0,11)]).
fillpoint(r78, xy(5,12), 1).
fillpoint(r78, xy(4,12), 1).
fillpoint(r78, xy(3,12), 1).
fillpoint(r78, xy(2,12), 1).
fillpoint(r78, xy(1,12), 1).
region(r85, '#5d6262', 16, centroid(48,12)).
polygon(r85, [xy(45,11),xy(45,13),xy(46,12),xy(46,13),xy(47,12),xy(47,13),xy(49,11),xy(49,12),xy(50,11),xy(50,12),xy(51,11),xy(51,12),xy(52,11),xy(53,11),xy(45,11)]).
fillpoint(r85, xy(53,11), 1).
fillpoint(r85, xy(52,11), 1).
fillpoint(r85, xy(51,12), 1).
fillpoint(r85, xy(51,11), 1).
fillpoint(r85, xy(50,12), 1).
region(r86, '#707575', 5, centroid(61,12)).
polygon(r86, [xy(60,12),xy(61,11),xy(61,12),xy(62,11),xy(62,12),xy(60,12)]).
fillpoint(r86, xy(62,12), 1).
fillpoint(r86, xy(62,11), 1).
fillpoint(r86, xy(61,12), 1).
fillpoint(r86, xy(61,11), 1).
fillpoint(r86, xy(60,12), 1).
region(r88, '#525758', 6, centroid(9,13)).
polygon(r88, [xy(7,12),xy(8,12),xy(8,13),xy(9,13),xy(9,14),xy(10,14),xy(7,12)]).
fillpoint(r88, xy(10,14), 1).
fillpoint(r88, xy(9,14), 1).
fillpoint(r88, xy(9,13), 1).
fillpoint(r88, xy(8,13), 1).
fillpoint(r88, xy(8,12), 1).
region(r95, '#5d6262', 15, centroid(2,14)).
polygon(r95, [xy(0,14),xy(0,16),xy(2,14),xy(1,13),xy(3,13),xy(3,14),xy(4,13),xy(4,14),xy(5,13),xy(5,14),xy(6,14),xy(0,14)]).
midline(r95, [xy(1,14)]).
fillpoint(r95, xy(1,14), 2).
fillpoint(r95, xy(6,14), 1).
fillpoint(r95, xy(5,14), 1).
fillpoint(r95, xy(5,13), 1).
fillpoint(r95, xy(4,14), 1).
region(r106, '#333330', 49, centroid(32,20)).
polygon(r106, [xy(22,14),xy(22,15),xy(23,14),xy(24,15),xy(23,16),xy(24,16),xy(25,15),xy(26,16),xy(25,17),xy(27,17),xy(27,18),xy(28,17),xy(28,18),xy(30,18),xy(30,19),xy(31,19),xy(31,20),xy(32,19),xy(33,20),xy(32,21),xy(33,21),xy(34,20),xy(35,21),xy(34,22),xy(35,22),xy(36,21),xy(36,22),xy(37,22),xy(37,23),xy(38,22),xy(39,23),xy(38,24),xy(39,25),xy(40,24),xy(41,25),xy(40,26),xy(42,26),xy(42,27),xy(43,27),xy(22,14)]).
midline(r106, [xy(23,15),xy(25,16)]).
midline(r106, [xy(32,20),xy(34,21)]).
midline(r106, [xy(38,23),xy(40,25)]).
fillpoint(r106, xy(40,25), 2).
fillpoint(r106, xy(39,24), 2).
fillpoint(r106, xy(38,23), 2).
fillpoint(r106, xy(34,21), 2).
fillpoint(r106, xy(32,20), 2).
region(r108, '#1b1914', 7, centroid(36,15)).
polygon(r108, [xy(34,14),xy(36,14),xy(36,15),xy(38,15),xy(38,16),xy(34,14)]).
fillpoint(r108, xy(38,16), 1).
fillpoint(r108, xy(38,15), 1).
fillpoint(r108, xy(37,15), 1).
fillpoint(r108, xy(36,15), 1).
fillpoint(r108, xy(36,14), 1).
region(r113, '#626767', 38, centroid(70,17)).
polygon(r113, [xy(64,18),xy(64,19),xy(65,18),xy(65,19),xy(66,18),xy(66,19),xy(67,20),xy(68,20),xy(70,18),xy(70,16),xy(69,15),xy(67,15),xy(68,16),xy(67,17),xy(64,18)]).
midline(r113, [xy(68,18),xy(69,16)]).
fillpoint(r113, xy(68,18), 3).
fillpoint(r113, xy(69,18), 2).
fillpoint(r113, xy(69,17), 2).
fillpoint(r113, xy(69,16), 2).
fillpoint(r113, xy(68,19), 2).
region(r114, '#626767', 35, centroid(2,18)).
polygon(r114, [xy(0,17),xy(0,25),xy(1,24),xy(1,19),xy(3,17),xy(4,17),xy(5,16),xy(4,15),xy(2,15),xy(1,16),xy(0,17)]).
midline(r114, [xy(1,17),xy(1,18),xy(2,17),xy(2,16),xy(4,16)]).
fillpoint(r114, xy(4,16), 2).
fillpoint(r114, xy(3,16), 2).
fillpoint(r114, xy(2,17), 2).
fillpoint(r114, xy(2,16), 2).
fillpoint(r114, xy(1,18), 2).
region(r121, '#333330', 22, centroid(45,17)).
polygon(r121, [xy(41,17),xy(42,16),xy(42,15),xy(43,16),xy(42,17),xy(42,18),xy(43,18),xy(44,19),xy(46,19),xy(47,18),xy(47,17),xy(46,16),xy(44,16),xy(46,15),xy(47,16),xy(48,18),xy(47,19),xy(49,19),xy(49,20),xy(41,17)]).
hole(r121, [xy(43,17),xy(44,17),xy(44,18),xy(45,17),xy(45,18),xy(46,17),xy(46,18),xy(43,17)]).
fillpoint(r121, xy(49,20), 1).
fillpoint(r121, xy(49,19), 1).
fillpoint(r121, xy(48,19), 1).
fillpoint(r121, xy(48,18), 1).
fillpoint(r121, xy(47,19), 1).
region(r130, '#1b1914', 4, centroid(40,17)).
polygon(r130, [xy(40,16),xy(40,18),xy(41,18),xy(40,16)]).
fillpoint(r130, xy(41,18), 1).
fillpoint(r130, xy(40,18), 1).
fillpoint(r130, xy(40,17), 1).
fillpoint(r130, xy(40,16), 1).
region(r132, '#1b1914', 92, centroid(49,22)).
polygon(r132, [xy(41,24),xy(42,23),xy(42,19),xy(43,19),xy(44,20),xy(44,21),xy(43,22),xy(43,24),xy(42,25),xy(43,25),xy(43,26),xy(44,26),xy(44,27),xy(41,24)]).
hole(r132, [xy(52,20),xy(52,21),xy(53,20),xy(53,21),xy(52,20)]).
midline(r132, [xy(42,24)]).
midline(r132, [xy(43,20),xy(43,21)]).
midline(r132, [xy(47,22),xy(48,21),xy(50,22),xy(51,23),xy(53,24),xy(54,22),xy(55,21)]).
midline(r132, [xy(50,18),xy(51,19)]).
fillpoint(r132, xy(53,24), 3).
fillpoint(r132, xy(51,23), 3).
fillpoint(r132, xy(50,22), 3).
fillpoint(r132, xy(55,21), 2).
fillpoint(r132, xy(54,25), 2).
region(r138, '#5d6262', 28, centroid(74,18)).
polygon(r138, [xy(69,20),xy(70,19),xy(70,20),xy(71,21),xy(72,20),xy(72,19),xy(71,18),xy(71,16),xy(72,16),xy(72,18),xy(73,16),xy(78,16),xy(78,17),xy(80,17),xy(80,18),xy(82,18),xy(69,20)]).
midline(r138, [xy(71,19),xy(71,20)]).
fillpoint(r138, xy(71,20), 2).
fillpoint(r138, xy(71,19), 2).
fillpoint(r138, xy(82,18), 1).
fillpoint(r138, xy(81,18), 1).
fillpoint(r138, xy(80,18), 1).
region(r139, '#696e6e', 236, centroid(13,29)).
polygon(r139, [xy(0,26),xy(1,25),xy(1,26),xy(3,26),xy(4,27),xy(3,28),xy(3,31),xy(4,32),xy(5,32),xy(7,34),xy(8,34),xy(9,35),xy(9,36),xy(10,36),xy(11,37),xy(13,37),xy(14,38),xy(18,38),xy(19,37),xy(18,36),xy(16,36),xy(15,35),xy(14,35),xy(12,33),xy(11,33),xy(8,30),xy(8,28),xy(7,27),xy(8,26),xy(8,23),xy(7,22),xy(9,20),xy(10,20),xy(11,19),xy(11,18),xy(10,17),xy(5,17),xy(4,18),xy(3,18),xy(2,19),xy(2,24),xy(0,26)]).
midline(r139, [xy(2,25)]).
midline(r139, [xy(5,20),xy(5,21),xy(6,20),xy(10,18),xy(10,19)]).
midline(r139, [xy(5,23),xy(5,25)]).
midline(r139, [xy(5,28),xy(5,30),xy(6,29),xy(6,31),xy(7,31),xy(7,32),xy(8,32),xy(11,35),xy(12,35),xy(14,36),xy(14,37),xy(15,36),xy(15,37),xy(18,37),xy(20,38),xy(21,38),xy(21,39),xy(22,38),xy(22,39),xy(24,39),xy(25,38),xy(25,39),xy(26,38),xy(26,39),xy(27,38),xy(27,39),xy(28,39),xy(29,38),xy(29,39),xy(30,38),xy(30,39),xy(31,38),xy(31,39),xy(32,38),xy(32,39),xy(33,38),xy(33,39)]).
midline(r139, [xy(13,19),xy(16,19)]).
fillpoint(r139, xy(6,20), 4).
fillpoint(r139, xy(5,25), 4).
fillpoint(r139, xy(5,24), 4).
fillpoint(r139, xy(5,23), 4).
fillpoint(r139, xy(5,21), 4).
region(r140, '#626767', 6, centroid(14,17)).
polygon(r140, [xy(11,17),xy(16,17),xy(11,17)]).
fillpoint(r140, xy(16,17), 1).
fillpoint(r140, xy(15,17), 1).
fillpoint(r140, xy(14,17), 1).
fillpoint(r140, xy(13,17), 1).
fillpoint(r140, xy(12,17), 1).
region(r153, '#595d5e', 8, centroid(74,18)).
polygon(r153, [xy(73,17),xy(73,20),xy(73,17)]).
fillpoint(r153, xy(77,17), 1).
fillpoint(r153, xy(76,17), 1).
fillpoint(r153, xy(75,17), 1).
fillpoint(r153, xy(74,17), 1).
fillpoint(r153, xy(73,20), 1).
region(r168, '#555a5b', 15, centroid(76,19)).
polygon(r168, [xy(74,18),xy(74,20),xy(75,21),xy(76,20),xy(76,19),xy(75,18),xy(78,18),xy(74,18)]).
midline(r168, [xy(75,19),xy(75,20)]).
fillpoint(r168, xy(75,20), 2).
fillpoint(r168, xy(75,19), 2).
fillpoint(r168, xy(78,21), 1).
fillpoint(r168, xy(78,18), 1).
fillpoint(r168, xy(77,21), 1).
region(r175, '#090905', 4, centroid(57,19)).
polygon(r175, [xy(56,19),xy(56,20),xy(57,19),xy(58,19),xy(56,19)]).
fillpoint(r175, xy(58,19), 1).
fillpoint(r175, xy(57,19), 1).
fillpoint(r175, xy(56,20), 1).
fillpoint(r175, xy(56,19), 1).
region(r177, '#333330', 54, centroid(61,24)).
polygon(r177, [xy(55,23),xy(56,22),xy(57,22),xy(58,21),xy(58,23),xy(57,24),xy(56,24),xy(56,25),xy(58,25),xy(58,26),xy(59,26),xy(59,28),xy(60,27),xy(60,25),xy(61,24),xy(61,25),xy(63,23),xy(60,20),xy(59,20),xy(59,21),xy(60,21),xy(63,24),xy(64,23),xy(64,24),xy(65,23),xy(67,23),xy(67,26),xy(65,28),xy(64,28),xy(65,29),xy(68,26),xy(68,24),xy(69,24),xy(55,23)]).
hole(r177, [xy(58,24),xy(59,23),xy(59,22),xy(60,22),xy(61,23),xy(59,25),xy(58,24)]).
midline(r177, [xy(56,23),xy(57,23)]).
fillpoint(r177, xy(57,23), 2).
fillpoint(r177, xy(56,23), 2).
fillpoint(r177, xy(69,24), 1).
fillpoint(r177, xy(68,26), 1).
fillpoint(r177, xy(68,24), 1).
region(r178, '#1b1914', 20, centroid(65,22)).
polygon(r178, [xy(61,20),xy(62,19),xy(63,20),xy(62,21),xy(63,22),xy(64,21),xy(64,22),xy(65,21),xy(65,22),xy(66,21),xy(66,22),xy(68,22),xy(68,23),xy(70,23),xy(70,24),xy(71,24),xy(61,20)]).
midline(r178, [xy(62,20),xy(63,21)]).
fillpoint(r178, xy(63,21), 2).
fillpoint(r178, xy(62,20), 2).
fillpoint(r178, xy(71,24), 1).
fillpoint(r178, xy(70,24), 1).
fillpoint(r178, xy(70,23), 1).
region(r180, '#525758', 11, centroid(79,20)).
polygon(r180, [xy(77,19),xy(77,20),xy(78,19),xy(78,20),xy(79,20),xy(79,21),xy(80,20),xy(80,21),xy(81,20),xy(82,20),xy(82,21),xy(77,19)]).
fillpoint(r180, xy(82,21), 1).
fillpoint(r180, xy(82,20), 1).
fillpoint(r180, xy(81,20), 1).
fillpoint(r180, xy(80,21), 1).
fillpoint(r180, xy(80,20), 1).
region(r183, '#5d6262', 8, centroid(86,20)).
polygon(r183, [xy(84,19),xy(85,19),xy(85,21),xy(87,19),xy(87,20),xy(88,19),xy(84,19)]).
fillpoint(r183, xy(88,19), 1).
fillpoint(r183, xy(87,20), 1).
fillpoint(r183, xy(87,19), 1).
fillpoint(r183, xy(86,20), 1).
fillpoint(r183, xy(85,21), 1).
region(r184, '#5d6262', 4, centroid(94,19)).
polygon(r184, [xy(92,19),xy(95,19),xy(92,19)]).
fillpoint(r184, xy(95,19), 1).
fillpoint(r184, xy(94,19), 1).
fillpoint(r184, xy(93,19), 1).
fillpoint(r184, xy(92,19), 1).
region(r185, '#707575', 281, centroid(20,29)).
polygon(r185, [xy(8,22),xy(9,21),xy(10,21),xy(11,20),xy(12,20),xy(13,21),xy(17,21),xy(18,20),xy(20,20),xy(21,21),xy(22,21),xy(23,22),xy(24,22),xy(24,23),xy(25,24),xy(25,25),xy(27,27),xy(26,28),xy(24,28),xy(23,27),xy(22,27),xy(20,29),xy(21,30),xy(21,31),xy(20,32),xy(20,33),xy(21,34),xy(23,34),xy(24,35),xy(25,35),xy(25,36),xy(24,37),xy(23,37),xy(22,36),xy(19,36),xy(18,35),xy(16,35),xy(15,34),xy(14,34),xy(12,32),xy(11,32),xy(9,30),xy(9,28),xy(8,27),xy(9,26),xy(9,23),xy(8,22)]).
midline(r185, [xy(9,22)]).
midline(r185, [xy(12,23)]).
midline(r185, [xy(14,27),xy(15,27),xy(15,28),xy(18,25),xy(18,26),xy(19,25)]).
midline(r185, [xy(16,30)]).
midline(r185, [xy(19,34),xy(21,35),xy(23,35),xy(23,36),xy(24,36)]).
midline(r185, [xy(22,24),xy(24,26),xy(26,27)]).
midline(r185, [xy(28,36)]).
midline(r185, [xy(32,35),xy(35,35)]).
midline(r185, [xy(36,38),xy(36,39),xy(37,39)]).
fillpoint(r185, xy(16,27), 7).
fillpoint(r185, xy(15,28), 7).
fillpoint(r185, xy(15,27), 7).
fillpoint(r185, xy(14,27), 7).
fillpoint(r185, xy(19,25), 6).
region(r186, '#696e6e', 17, centroid(25,23)).
polygon(r186, [xy(21,20),xy(23,20),xy(23,21),xy(25,21),xy(25,23),xy(26,22),xy(26,25),xy(27,25),xy(27,26),xy(28,26),xy(28,27),xy(29,27),xy(21,20)]).
fillpoint(r186, xy(29,27), 1).
fillpoint(r186, xy(28,27), 1).
fillpoint(r186, xy(28,26), 1).
fillpoint(r186, xy(27,26), 1).
fillpoint(r186, xy(27,25), 1).
region(r191, '#333330', 4, centroid(53,21)).
polygon(r191, [xy(52,20),xy(52,21),xy(53,20),xy(53,21),xy(52,20)]).
fillpoint(r191, xy(53,21), 1).
fillpoint(r191, xy(53,20), 1).
fillpoint(r191, xy(52,21), 1).
fillpoint(r191, xy(52,20), 1).
region(r197, '#555a5b', 8, centroid(90,21)).
polygon(r197, [xy(88,21),xy(89,21),xy(89,22),xy(90,21),xy(90,20),xy(91,21),xy(93,21),xy(88,21)]).
fillpoint(r197, xy(93,21), 1).
fillpoint(r197, xy(92,21), 1).
fillpoint(r197, xy(91,21), 1).
fillpoint(r197, xy(90,21), 1).
fillpoint(r197, xy(90,20), 1).
region(r203, '#090905', 94, centroid(53,30)).
polygon(r203, [xy(44,22),xy(44,25),xy(45,24),xy(46,24),xy(47,25),xy(48,24),xy(48,23),xy(46,21),xy(45,21),xy(45,22),xy(44,22)]).
midline(r203, [xy(45,25),xy(46,25),xy(46,27),xy(48,26),xy(48,27),xy(49,27),xy(50,28),xy(51,28),xy(51,29)]).
midline(r203, [xy(55,32)]).
midline(r203, [xy(58,34),xy(59,34),xy(59,35),xy(60,35),xy(60,36)]).
midline(r203, [xy(63,37),xy(63,38)]).
fillpoint(r203, xy(51,29), 3).
fillpoint(r203, xy(51,28), 3).
fillpoint(r203, xy(50,28), 3).
fillpoint(r203, xy(49,27), 3).
fillpoint(r203, xy(48,27), 3).
region(r222, '#494d4d', 4, centroid(76,22)).
polygon(r222, [xy(74,22),xy(77,22),xy(74,22)]).
fillpoint(r222, xy(77,22), 1).
fillpoint(r222, xy(76,22), 1).
fillpoint(r222, xy(75,22), 1).
fillpoint(r222, xy(74,22), 1).
region(r223, '#333330', 7, centroid(81,22)).
polygon(r223, [xy(78,22),xy(84,22),xy(78,22)]).
fillpoint(r223, xy(84,22), 1).
fillpoint(r223, xy(83,22), 1).
fillpoint(r223, xy(82,22), 1).
fillpoint(r223, xy(81,22), 1).
fillpoint(r223, xy(80,22), 1).
region(r227, '#525758', 10, centroid(93,23)).
polygon(r227, [xy(90,22),xy(92,22),xy(92,23),xy(93,22),xy(94,23),xy(93,24),xy(94,24),xy(95,23),xy(90,22)]).
midline(r227, [xy(93,23)]).
fillpoint(r227, xy(93,23), 2).
fillpoint(r227, xy(95,23), 1).
fillpoint(r227, xy(94,24), 1).
fillpoint(r227, xy(94,23), 1).
fillpoint(r227, xy(93,24), 1).
region(r231, '#525758', 12, centroid(33,25)).
polygon(r231, [xy(31,23),xy(31,25),xy(32,24),xy(32,25),xy(33,25),xy(33,26),xy(34,25),xy(34,26),xy(37,26),xy(31,23)]).
fillpoint(r231, xy(37,26), 1).
fillpoint(r231, xy(36,26), 1).
fillpoint(r231, xy(35,26), 1).
fillpoint(r231, xy(34,26), 1).
fillpoint(r231, xy(34,25), 1).
region(r238, '#1b1914', 5, centroid(73,23)).
polygon(r238, [xy(72,23),xy(73,23),xy(73,24),xy(74,23),xy(75,23),xy(72,23)]).
fillpoint(r238, xy(75,23), 1).
fillpoint(r238, xy(74,23), 1).
fillpoint(r238, xy(73,24), 1).
fillpoint(r238, xy(73,23), 1).
fillpoint(r238, xy(72,23), 1).
region(r239, '#090905', 46, centroid(71,27)).
polygon(r239, [xy(66,30),xy(66,31),xy(67,30),xy(67,29),xy(69,27),xy(69,26),xy(70,25),xy(71,25),xy(72,24),xy(73,25),xy(73,26),xy(70,29),xy(70,30),xy(69,31),xy(68,30),xy(68,33),xy(69,33),xy(70,32),xy(70,33),xy(66,30)]).
midline(r239, [xy(68,29),xy(69,28),xy(69,32)]).
midline(r239, [xy(70,26),xy(70,28),xy(71,27),xy(71,26),xy(72,25),xy(72,26)]).
fillpoint(r239, xy(72,26), 2).
fillpoint(r239, xy(72,25), 2).
fillpoint(r239, xy(71,27), 2).
fillpoint(r239, xy(71,26), 2).
fillpoint(r239, xy(70,28), 2).
region(r240, '#1b1914', 4, centroid(83,23)).
polygon(r240, [xy(81,23),xy(84,23),xy(81,23)]).
fillpoint(r240, xy(84,23), 1).
fillpoint(r240, xy(83,23), 1).
fillpoint(r240, xy(82,23), 1).
fillpoint(r240, xy(81,23), 1).
region(r251, '#333330', 54, centroid(82,27)).
polygon(r251, [xy(74,30),xy(76,28),xy(76,27),xy(77,26),xy(77,25),xy(78,25),xy(78,26),xy(79,25),xy(79,24),xy(80,24),xy(80,25),xy(81,24),xy(82,24),xy(82,25),xy(83,24),xy(83,26),xy(84,26),xy(84,28),xy(85,26),xy(86,26),xy(86,27),xy(87,26),xy(87,25),xy(86,24),xy(84,24),xy(74,30)]).
hole(r251, [xy(84,25),xy(86,25),xy(84,25)]).
midline(r251, [xy(75,30),xy(77,28),xy(77,27),xy(78,27)]).
midline(r251, [xy(88,26),xy(89,26)]).
fillpoint(r251, xy(89,26), 2).
fillpoint(r251, xy(88,26), 2).
fillpoint(r251, xy(78,27), 2).
fillpoint(r251, xy(77,28), 2).
fillpoint(r251, xy(77,27), 2).
region(r260, '#707575', 4, centroid(65,26)).
polygon(r260, [xy(64,26),xy(64,27),xy(65,26),xy(65,25),xy(64,26)]).
fillpoint(r260, xy(65,26), 1).
fillpoint(r260, xy(65,25), 1).
fillpoint(r260, xy(64,27), 1).
fillpoint(r260, xy(64,26), 1).
region(r263, '#1b1914', 13, centroid(74,27)).
polygon(r263, [xy(73,27),xy(75,25),xy(76,25),xy(76,26),xy(73,29),xy(73,30),xy(75,28),xy(73,27)]).
midline(r263, [xy(74,27),xy(75,26)]).
fillpoint(r263, xy(75,26), 2).
fillpoint(r263, xy(74,27), 2).
fillpoint(r263, xy(76,26), 1).
fillpoint(r263, xy(76,25), 1).
fillpoint(r263, xy(75,28), 1).
region(r271, '#333330', 5, centroid(55,28)).
polygon(r271, [xy(54,28),xy(54,29),xy(55,28),xy(55,26),xy(54,28)]).
fillpoint(r271, xy(55,28), 1).
fillpoint(r271, xy(55,27), 1).
fillpoint(r271, xy(55,26), 1).
fillpoint(r271, xy(54,29), 1).
fillpoint(r271, xy(54,28), 1).
region(r272, '#1b1914', 103, centroid(64,33)).
polygon(r272, [xy(54,30),xy(54,31),xy(55,30),xy(55,29),xy(56,28),xy(56,26),xy(57,26),xy(58,27),xy(58,28),xy(59,29),xy(60,28),xy(61,29),xy(61,30),xy(62,29),xy(63,30),xy(62,31),xy(60,32),xy(59,31),xy(58,32),xy(57,31),xy(57,30),xy(56,29),xy(54,30)]).
midline(r272, [xy(57,27),xy(57,29),xy(58,29),xy(58,31),xy(60,29),xy(60,31),xy(61,31),xy(61,32),xy(63,32),xy(63,34)]).
midline(r272, [xy(64,30)]).
midline(r272, [xy(67,34),xy(67,36),xy(68,35),xy(68,36),xy(69,35),xy(70,35)]).
midline(r272, [xy(72,38)]).
fillpoint(r272, xy(63,32), 3).
fillpoint(r272, xy(72,38), 2).
fillpoint(r272, xy(70,35), 2).
fillpoint(r272, xy(69,35), 2).
fillpoint(r272, xy(68,36), 2).
region(r277, '#1b1914', 8, centroid(81,27)).
polygon(r277, [xy(79,26),xy(80,26),xy(80,27),xy(81,27),xy(82,26),xy(82,27),xy(83,27),xy(83,28),xy(79,26)]).
fillpoint(r277, xy(83,28), 1).
fillpoint(r277, xy(83,27), 1).
fillpoint(r277, xy(82,27), 1).
fillpoint(r277, xy(82,26), 1).
fillpoint(r277, xy(81,27), 1).
region(r281, '#090905', 4, centroid(94,27)).
polygon(r281, [xy(93,26),xy(94,26),xy(94,27),xy(95,27),xy(93,26)]).
fillpoint(r281, xy(95,27), 1).
fillpoint(r281, xy(94,27), 1).
fillpoint(r281, xy(94,26), 1).
fillpoint(r281, xy(93,26), 1).
region(r283, '#626767', 71, centroid(7,35)).
polygon(r283, [xy(0,27),xy(0,31),xy(1,32),xy(1,33),xy(3,35),xy(4,35),xy(7,38),xy(8,38),xy(9,37),xy(5,33),xy(4,33),xy(2,31),xy(2,28),xy(1,27),xy(3,27),xy(0,27)]).
midline(r283, [xy(1,28),xy(1,31),xy(2,32),xy(2,33),xy(3,33),xy(3,34),xy(5,34),xy(5,35),xy(6,35),xy(6,36),xy(7,36),xy(7,37),xy(8,37),xy(9,38),xy(10,38),xy(12,39),xy(13,39)]).
fillpoint(r283, xy(13,39), 2).
fillpoint(r283, xy(12,39), 2).
fillpoint(r283, xy(10,38), 2).
fillpoint(r283, xy(9,38), 2).
fillpoint(r283, xy(8,37), 2).
region(r284, '#626767', 4, centroid(32,27)).
polygon(r284, [xy(30,27),xy(33,27),xy(30,27)]).
fillpoint(r284, xy(33,27), 1).
fillpoint(r284, xy(32,27), 1).
fillpoint(r284, xy(31,27), 1).
fillpoint(r284, xy(30,27), 1).
region(r285, '#5d6262', 4, centroid(36,27)).
polygon(r285, [xy(34,27),xy(37,27),xy(34,27)]).
fillpoint(r285, xy(37,27), 1).
fillpoint(r285, xy(36,27), 1).
fillpoint(r285, xy(35,27), 1).
fillpoint(r285, xy(34,27), 1).
region(r292, '#1b1914', 88, centroid(86,33)).
polygon(r292, [xy(81,30),xy(82,29),xy(82,30),xy(83,30),xy(83,31),xy(82,32),xy(81,32),xy(82,33),xy(82,38),xy(83,38),xy(83,39),xy(84,38),xy(84,39),xy(86,37),xy(85,36),xy(83,36),xy(81,30)]).
hole(r292, [xy(83,37),xy(85,37),xy(83,37)]).
hole(r292, [xy(87,31),xy(88,30),xy(88,31),xy(89,31),xy(87,31)]).
midline(r292, [xy(84,33),xy(84,34),xy(87,34),xy(89,33)]).
midline(r292, [xy(85,30),xy(87,28),xy(87,29)]).
midline(r292, [xy(85,39),xy(86,39)]).
fillpoint(r292, xy(87,34), 3).
fillpoint(r292, xy(85,34), 3).
fillpoint(r292, xy(85,30), 3).
fillpoint(r292, xy(84,34), 3).
fillpoint(r292, xy(84,33), 3).
region(r294, '#777b7c', 239, centroid(39,33)).
polygon(r294, [xy(21,29),xy(22,28),xy(23,28),xy(24,29),xy(40,29),xy(41,30),xy(44,30),xy(45,31),xy(46,31),xy(47,32),xy(48,32),xy(49,33),xy(51,33),xy(52,34),xy(53,34),xy(53,35),xy(54,36),xy(55,36),xy(55,37),xy(54,38),xy(52,38),xy(51,39),xy(50,39),xy(49,38),xy(48,39),xy(44,39),xy(43,40),xy(41,38),xy(38,38),xy(37,37),xy(37,35),xy(36,34),xy(36,33),xy(35,32),xy(33,34),xy(32,33),xy(31,34),xy(24,34),xy(23,33),xy(22,33),xy(21,32),xy(21,33),xy(22,31),xy(22,30),xy(21,29)]).
midline(r294, [xy(22,29),xy(23,29),xy(24,31),xy(24,32),xy(25,31),xy(25,32),xy(26,31),xy(26,32),xy(27,31),xy(27,32),xy(28,31),xy(28,32),xy(29,31),xy(29,32),xy(30,31),xy(30,32),xy(31,31),xy(31,32),xy(32,31),xy(33,31),xy(33,32),xy(34,31),xy(36,31),xy(40,33),xy(40,34),xy(41,34),xy(43,35),xy(48,35),xy(48,36),xy(51,36)]).
midline(r294, [xy(22,32)]).
midline(r294, [xy(54,37)]).
fillpoint(r294, xy(43,35), 6).
fillpoint(r294, xy(46,35), 5).
fillpoint(r294, xy(45,35), 5).
fillpoint(r294, xy(44,35), 5).
fillpoint(r294, xy(44,34), 5).
region(r307, '#1b1914', 5, centroid(92,29)).
polygon(r307, [xy(92,28),xy(92,30),xy(93,29),xy(93,28),xy(92,28)]).
fillpoint(r307, xy(93,29), 1).
fillpoint(r307, xy(93,28), 1).
fillpoint(r307, xy(92,30), 1).
fillpoint(r307, xy(92,29), 1).
fillpoint(r307, xy(92,28), 1).
region(r309, '#1b1914', 15, centroid(94,32)).
polygon(r309, [xy(93,31),xy(95,29),xy(95,31),xy(94,32),xy(94,33),xy(95,32),xy(95,34),xy(94,35),xy(94,36),xy(95,35),xy(93,31)]).
midline(r309, [xy(94,31)]).
fillpoint(r309, xy(94,31), 2).
fillpoint(r309, xy(95,35), 1).
fillpoint(r309, xy(95,34), 1).
fillpoint(r309, xy(95,33), 1).
fillpoint(r309, xy(95,32), 1).
region(r319, '#333330', 7, centroid(72,31)).
polygon(r319, [xy(71,32),xy(71,33),xy(72,32),xy(72,29),xy(73,31),xy(71,32)]).
fillpoint(r319, xy(73,31), 1).
fillpoint(r319, xy(72,32), 1).
fillpoint(r319, xy(72,31), 1).
fillpoint(r319, xy(72,30), 1).
fillpoint(r319, xy(72,29), 1).
region(r320, '#1b1914', 6, centroid(78,30)).
polygon(r320, [xy(77,30),xy(77,31),xy(78,30),xy(78,29),xy(79,29),xy(79,30),xy(77,30)]).
fillpoint(r320, xy(79,30), 1).
fillpoint(r320, xy(79,29), 1).
fillpoint(r320, xy(78,30), 1).
fillpoint(r320, xy(78,29), 1).
fillpoint(r320, xy(77,31), 1).
region(r322, '#090905', 37, centroid(91,35)).
polygon(r322, [xy(87,37),xy(87,38),xy(90,38),xy(91,37),xy(92,37),xy(93,36),xy(93,35),xy(94,34),xy(93,33),xy(93,32),xy(90,29),xy(91,29),xy(91,33),xy(88,36),xy(87,37)]).
midline(r322, [xy(88,37),xy(90,36),xy(92,34),xy(92,32)]).
fillpoint(r322, xy(92,34), 3).
fillpoint(r322, xy(91,35), 3).
fillpoint(r322, xy(90,36), 3).
fillpoint(r322, xy(93,34), 2).
fillpoint(r322, xy(92,36), 2).
region(r329, '#090905', 7, centroid(80,31)).
polygon(r329, [xy(78,31),xy(78,32),xy(80,30),xy(80,31),xy(82,31),xy(78,31)]).
fillpoint(r329, xy(82,31), 1).
fillpoint(r329, xy(81,31), 1).
fillpoint(r329, xy(80,31), 1).
fillpoint(r329, xy(80,30), 1).
fillpoint(r329, xy(79,31), 1).
region(r330, '#090905', 4, centroid(88,31)).
polygon(r330, [xy(87,31),xy(88,30),xy(88,31),xy(89,31),xy(87,31)]).
fillpoint(r330, xy(89,31), 1).
fillpoint(r330, xy(88,31), 1).
fillpoint(r330, xy(88,30), 1).
fillpoint(r330, xy(87,31), 1).
region(r337, '#5d6262', 22, centroid(4,37)).
polygon(r337, [xy(0,32),xy(0,34),xy(1,34),xy(1,35),xy(2,35),xy(2,37),xy(3,36),xy(3,37),xy(4,36),xy(4,37),xy(5,37),xy(5,38),xy(6,38),xy(6,39),xy(8,39),xy(8,40),xy(11,40),xy(0,32)]).
fillpoint(r337, xy(11,40), 1).
fillpoint(r337, xy(10,40), 1).
fillpoint(r337, xy(9,40), 1).
fillpoint(r337, xy(8,40), 1).
fillpoint(r337, xy(8,39), 1).
region(r343, '#494d4d', 4, centroid(75,33)).
polygon(r343, [xy(75,32),xy(75,34),xy(76,34),xy(75,32)]).
fillpoint(r343, xy(76,34), 1).
fillpoint(r343, xy(75,34), 1).
fillpoint(r343, xy(75,33), 1).
fillpoint(r343, xy(75,32), 1).
region(r347, '#333330', 21, centroid(79,35)).
polygon(r347, [xy(76,33),xy(77,33),xy(77,34),xy(76,35),xy(77,35),xy(78,34),xy(78,35),xy(79,34),xy(79,35),xy(80,36),xy(80,37),xy(81,36),xy(81,34),xy(80,33),xy(80,32),xy(81,33),xy(76,33)]).
midline(r347, [xy(80,34),xy(80,35)]).
fillpoint(r347, xy(80,35), 2).
fillpoint(r347, xy(80,34), 2).
fillpoint(r347, xy(81,38), 1).
fillpoint(r347, xy(81,37), 1).
fillpoint(r347, xy(81,36), 1).
region(r352, '#333330', 11, centroid(66,37)).
polygon(r352, [xy(65,33),xy(65,37),xy(66,37),xy(66,40),xy(67,39),xy(67,40),xy(65,33)]).
fillpoint(r352, xy(67,40), 1).
fillpoint(r352, xy(67,39), 1).
fillpoint(r352, xy(66,40), 1).
fillpoint(r352, xy(66,39), 1).
fillpoint(r352, xy(66,38), 1).
region(r357, '#595d5e', 5, centroid(0,36)).
polygon(r357, [xy(0,35),xy(0,37),xy(1,36),xy(1,37),xy(0,35)]).
fillpoint(r357, xy(1,37), 1).
fillpoint(r357, xy(1,36), 1).
fillpoint(r357, xy(0,37), 1).
fillpoint(r357, xy(0,36), 1).
fillpoint(r357, xy(0,35), 1).
region(r361, '#333330', 26, centroid(77,38)).
polygon(r361, [xy(72,35),xy(73,35),xy(73,36),xy(74,36),xy(74,38),xy(75,37),xy(76,37),xy(77,38),xy(77,39),xy(76,40),xy(75,39),xy(72,35)]).
midline(r361, [xy(75,38),xy(76,38),xy(76,39)]).
fillpoint(r361, xy(76,39), 2).
fillpoint(r361, xy(76,38), 2).
fillpoint(r361, xy(75,38), 2).
fillpoint(r361, xy(84,40), 1).
fillpoint(r361, xy(83,40), 1).
region(r362, '#1b1914', 13, centroid(77,37)).
polygon(r362, [xy(74,35),xy(75,35),xy(75,36),xy(77,36),xy(77,37),xy(78,36),xy(79,36),xy(79,37),xy(78,38),xy(80,38),xy(74,35)]).
midline(r362, [xy(78,37)]).
fillpoint(r362, xy(78,37), 2).
fillpoint(r362, xy(80,38), 1).
fillpoint(r362, xy(79,38), 1).
fillpoint(r362, xy(79,37), 1).
fillpoint(r362, xy(79,36), 1).
region(r363, '#707575', 29, centroid(53,39)).
polygon(r363, [xy(44,40),xy(48,40),xy(49,39),xy(49,40),xy(51,40),xy(52,39),xy(52,40),xy(53,39),xy(53,40),xy(54,39),xy(54,40),xy(55,39),xy(55,40),xy(56,39),xy(56,40),xy(57,40),xy(58,39),xy(56,37),xy(56,36),xy(58,38),xy(58,40),xy(59,40),xy(44,40)]).
midline(r363, [xy(57,39)]).
fillpoint(r363, xy(57,39), 2).
fillpoint(r363, xy(59,40), 1).
fillpoint(r363, xy(58,40), 1).
fillpoint(r363, xy(58,39), 1).
fillpoint(r363, xy(58,38), 1).
region(r370, '#333330', 8, centroid(70,38)).
polygon(r370, [xy(69,37),xy(69,38),xy(70,37),xy(70,40),xy(71,40),xy(69,37)]).
fillpoint(r370, xy(71,40), 1).
fillpoint(r370, xy(71,37), 1).
fillpoint(r370, xy(70,40), 1).
fillpoint(r370, xy(70,39), 1).
fillpoint(r370, xy(70,38), 1).
region(r373, '#555a5b', 6, centroid(2,39)).
polygon(r373, [xy(0,38),xy(1,38),xy(1,39),xy(2,39),xy(2,40),xy(3,40),xy(0,38)]).
fillpoint(r373, xy(3,40), 1).
fillpoint(r373, xy(2,40), 1).
fillpoint(r373, xy(2,39), 1).
fillpoint(r373, xy(1,39), 1).
fillpoint(r373, xy(1,38), 1).
region(r374, '#595d5e', 10, centroid(4,39)).
polygon(r374, [xy(2,38),xy(3,38),xy(3,39),xy(4,38),xy(5,39),xy(4,40),xy(7,40),xy(2,38)]).
midline(r374, [xy(4,39)]).
fillpoint(r374, xy(4,39), 2).
fillpoint(r374, xy(7,40), 1).
fillpoint(r374, xy(6,40), 1).
fillpoint(r374, xy(5,40), 1).
fillpoint(r374, xy(5,39), 1).
region(r380, '#1b1914', 4, centroid(95,39)).
polygon(r380, [xy(94,38),xy(94,39),xy(95,38),xy(95,39),xy(94,38)]).
fillpoint(r380, xy(95,39), 1).
fillpoint(r380, xy(95,38), 1).
fillpoint(r380, xy(94,39), 1).
fillpoint(r380, xy(94,38), 1).
region(r392, '#333330', 4, centroid(90,40)).
polygon(r392, [xy(88,40),xy(91,40),xy(88,40)]).
fillpoint(r392, xy(91,40), 1).
fillpoint(r392, xy(90,40), 1).
fillpoint(r392, xy(89,40), 1).
fillpoint(r392, xy(88,40), 1).
adjacent(r1, r100).
shared_edge(r1, r100, 2).
adjacent(r1, r101).
shared_edge(r1, r101, 1).
adjacent(r1, r106).
shared_edge(r1, r106, 7).
adjacent(r1, r107).
shared_edge(r1, r107, 2).
adjacent(r1, r108).
shared_edge(r1, r108, 16).
adjacent(r1, r109).
shared_edge(r1, r109, 1).
adjacent(r1, r119).
shared_edge(r1, r119, 2).
adjacent(r1, r120).
shared_edge(r1, r120, 2).
adjacent(r1, r129).
shared_edge(r1, r129, 3).
adjacent(r1, r13).
shared_edge(r1, r13, 2).
adjacent(r1, r130).
shared_edge(r1, r130, 6).
adjacent(r1, r132).
shared_edge(r1, r132, 6).
adjacent(r1, r14).
shared_edge(r1, r14, 1).
adjacent(r1, r144).
shared_edge(r1, r144, 2).
adjacent(r1, r159).
shared_edge(r1, r159, 2).
adjacent(r1, r17).
shared_edge(r1, r17, 6).
adjacent(r1, r174).
shared_edge(r1, r174, 2).
adjacent(r1, r18).
shared_edge(r1, r18, 3).
adjacent(r1, r19).
shared_edge(r1, r19, 2).
adjacent(r1, r190).
shared_edge(r1, r190, 2).
adjacent(r1, r2).
shared_edge(r1, r2, 2).
adjacent(r1, r20).
shared_edge(r1, r20, 1).
adjacent(r1, r202).
shared_edge(r1, r202, 2).
adjacent(r1, r215).
shared_edge(r1, r215, 2).
adjacent(r1, r22).
shared_edge(r1, r22, 3).
adjacent(r1, r23).
shared_edge(r1, r23, 4).
adjacent(r1, r232).
shared_edge(r1, r232, 2).
adjacent(r1, r24).
shared_edge(r1, r24, 2).
adjacent(r1, r25).
shared_edge(r1, r25, 1).
adjacent(r1, r3).
shared_edge(r1, r3, 1).
adjacent(r1, r30).
shared_edge(r1, r30, 3).
adjacent(r1, r31).
shared_edge(r1, r31, 2).
adjacent(r1, r32).
shared_edge(r1, r32, 1).
adjacent(r1, r38).
shared_edge(r1, r38, 2).
adjacent(r1, r39).
shared_edge(r1, r39, 6).
adjacent(r1, r40).
shared_edge(r1, r40, 2).
adjacent(r1, r41).
shared_edge(r1, r41, 1).
adjacent(r1, r44).
shared_edge(r1, r44, 2).
adjacent(r1, r45).
shared_edge(r1, r45, 6).
adjacent(r1, r46).
shared_edge(r1, r46, 2).
adjacent(r1, r47).
shared_edge(r1, r47, 1).
adjacent(r1, r54).
shared_edge(r1, r54, 2).
adjacent(r1, r55).
shared_edge(r1, r55, 2).
adjacent(r1, r56).
shared_edge(r1, r56, 1).
adjacent(r1, r60).
shared_edge(r1, r60, 2).
adjacent(r1, r61).
shared_edge(r1, r61, 2).
adjacent(r1, r62).
shared_edge(r1, r62, 1).
adjacent(r1, r68).
shared_edge(r1, r68, 2).
adjacent(r1, r69).
shared_edge(r1, r69, 22).
adjacent(r1, r70).
shared_edge(r1, r70, 2).
adjacent(r1, r71).
shared_edge(r1, r71, 1).
adjacent(r1, r72).
shared_edge(r1, r72, 1).
adjacent(r1, r79).
shared_edge(r1, r79, 1).
adjacent(r1, r8).
shared_edge(r1, r8, 2).
adjacent(r1, r80).
shared_edge(r1, r80, 2).
adjacent(r1, r81).
shared_edge(r1, r81, 2).
adjacent(r1, r82).
shared_edge(r1, r82, 1).
adjacent(r1, r89).
shared_edge(r1, r89, 1).
adjacent(r1, r9).
shared_edge(r1, r9, 1).
adjacent(r1, r90).
shared_edge(r1, r90, 2).
adjacent(r1, r91).
shared_edge(r1, r91, 2).
adjacent(r1, r92).
shared_edge(r1, r92, 1).
adjacent(r1, r98).
shared_edge(r1, r98, 1).
adjacent(r1, r99).
shared_edge(r1, r99, 2).
adjacent(r10, r13).
shared_edge(r10, r13, 1).
adjacent(r10, r5).
shared_edge(r10, r5, 2).
adjacent(r10, r9).
shared_edge(r10, r9, 1).
adjacent(r100, r101).
shared_edge(r100, r101, 1).
adjacent(r100, r93).
shared_edge(r100, r93, 1).
adjacent(r101, r102).
shared_edge(r101, r102, 1).
adjacent(r101, r94).
shared_edge(r101, r94, 1).
adjacent(r102, r103).
shared_edge(r102, r103, 1).
adjacent(r102, r109).
shared_edge(r102, r109, 1).
adjacent(r102, r94).
shared_edge(r102, r94, 1).
adjacent(r103, r110).
shared_edge(r103, r110, 1).
adjacent(r103, r111).
shared_edge(r103, r111, 1).
adjacent(r103, r16).
shared_edge(r103, r16, 2).
adjacent(r103, r85).
shared_edge(r103, r85, 1).
adjacent(r104, r105).
shared_edge(r104, r105, 1).
adjacent(r104, r115).
shared_edge(r104, r115, 1).
adjacent(r104, r95).
shared_edge(r104, r95, 1).
adjacent(r104, r97).
shared_edge(r104, r97, 1).
adjacent(r105, r115).
shared_edge(r105, r115, 1).
adjacent(r105, r88).
shared_edge(r105, r88, 2).
adjacent(r106, r107).
shared_edge(r106, r107, 2).
adjacent(r106, r119).
shared_edge(r106, r119, 2).
adjacent(r106, r129).
shared_edge(r106, r129, 3).
adjacent(r106, r132).
shared_edge(r106, r132, 7).
adjacent(r106, r144).
shared_edge(r106, r144, 2).
adjacent(r106, r159).
shared_edge(r106, r159, 2).
adjacent(r106, r174).
shared_edge(r106, r174, 2).
adjacent(r106, r190).
shared_edge(r106, r190, 2).
adjacent(r106, r202).
shared_edge(r106, r202, 2).
adjacent(r106, r215).
shared_edge(r106, r215, 2).
adjacent(r106, r232).
shared_edge(r106, r232, 2).
adjacent(r106, r288).
shared_edge(r106, r288, 3).
adjacent(r106, r29).
shared_edge(r106, r29, 31).
adjacent(r106, r297).
shared_edge(r106, r297, 1).
adjacent(r106, r298).
shared_edge(r106, r298, 1).
adjacent(r106, r99).
shared_edge(r106, r99, 1).
adjacent(r109, r110).
shared_edge(r109, r110, 1).
adjacent(r109, r121).
shared_edge(r109, r121, 1).
adjacent(r11, r16).
shared_edge(r11, r16, 37).
adjacent(r11, r33).
shared_edge(r11, r33, 1).
adjacent(r11, r41).
shared_edge(r11, r41, 1).
adjacent(r11, r42).
shared_edge(r11, r42, 2).
adjacent(r11, r47).
shared_edge(r11, r47, 1).
adjacent(r11, r48).
shared_edge(r11, r48, 2).
adjacent(r11, r49).
shared_edge(r11, r49, 3).
adjacent(r11, r5).
shared_edge(r11, r5, 45).
adjacent(r11, r56).
shared_edge(r11, r56, 1).
adjacent(r11, r57).
shared_edge(r11, r57, 1).
adjacent(r11, r58).
shared_edge(r11, r58, 3).
adjacent(r11, r62).
shared_edge(r11, r62, 1).
adjacent(r11, r63).
shared_edge(r11, r63, 1).
adjacent(r11, r71).
shared_edge(r11, r71, 1).
adjacent(r110, r111).
shared_edge(r110, r111, 1).
adjacent(r110, r122).
shared_edge(r110, r122, 1).
adjacent(r111, r112).
shared_edge(r111, r112, 1).
adjacent(r111, r122).
shared_edge(r111, r122, 1).
adjacent(r112, r122).
shared_edge(r112, r122, 1).
adjacent(r112, r77).
shared_edge(r112, r77, 1).
adjacent(r112, r85).
shared_edge(r112, r85, 1).
adjacent(r113, r138).
shared_edge(r113, r138, 15).
adjacent(r113, r179).
shared_edge(r113, r179, 1).
adjacent(r113, r192).
shared_edge(r113, r192, 1).
adjacent(r113, r193).
shared_edge(r113, r193, 1).
adjacent(r113, r194).
shared_edge(r113, r194, 2).
adjacent(r113, r204).
shared_edge(r113, r204, 1).
adjacent(r113, r205).
shared_edge(r113, r205, 1).
adjacent(r113, r66).
shared_edge(r113, r66, 24).
adjacent(r114, r115).
shared_edge(r114, r115, 3).
adjacent(r114, r116).
shared_edge(r114, r116, 1).
adjacent(r114, r125).
shared_edge(r114, r125, 1).
adjacent(r114, r139).
shared_edge(r114, r139, 19).
adjacent(r114, r95).
shared_edge(r114, r95, 9).
adjacent(r115, r116).
shared_edge(r115, r116, 1).
adjacent(r116, r117).
shared_edge(r116, r117, 1).
adjacent(r116, r88).
shared_edge(r116, r88, 1).
adjacent(r117, r118).
shared_edge(r117, r118, 1).
adjacent(r117, r125).
shared_edge(r117, r125, 1).
adjacent(r117, r88).
shared_edge(r117, r88, 1).
adjacent(r118, r125).
shared_edge(r118, r125, 1).
adjacent(r118, r126).
shared_edge(r118, r126, 1).
adjacent(r118, r29).
shared_edge(r118, r29, 3).
adjacent(r12, r16).
shared_edge(r12, r16, 16).
adjacent(r12, r34).
shared_edge(r12, r34, 2).
adjacent(r12, r35).
shared_edge(r12, r35, 3).
adjacent(r12, r36).
shared_edge(r12, r36, 2).
adjacent(r12, r5).
shared_edge(r12, r5, 23).
adjacent(r120, r121).
shared_edge(r120, r121, 1).
adjacent(r120, r131).
shared_edge(r120, r131, 1).
adjacent(r121, r122).
shared_edge(r121, r122, 5).
adjacent(r121, r123).
shared_edge(r121, r123, 2).
adjacent(r121, r130).
shared_edge(r121, r130, 3).
adjacent(r121, r131).
shared_edge(r121, r131, 2).
adjacent(r121, r132).
shared_edge(r121, r132, 17).
adjacent(r121, r145).
shared_edge(r121, r145, 3).
adjacent(r121, r146).
shared_edge(r121, r146, 1).
adjacent(r121, r147).
shared_edge(r121, r147, 2).
adjacent(r121, r148).
shared_edge(r121, r148, 2).
adjacent(r121, r160).
shared_edge(r121, r160, 2).
adjacent(r121, r161).
shared_edge(r121, r161, 2).
adjacent(r121, r77).
shared_edge(r121, r77, 1).
adjacent(r123, r124).
shared_edge(r123, r124, 1).
adjacent(r123, r77).
shared_edge(r123, r77, 1).
adjacent(r124, r132).
shared_edge(r124, r132, 1).
adjacent(r124, r77).
shared_edge(r124, r77, 2).
adjacent(r125, r126).
shared_edge(r125, r126, 1).
adjacent(r125, r139).
shared_edge(r125, r139, 1).
adjacent(r125, r140).
shared_edge(r125, r140, 1).
adjacent(r126, r127).
shared_edge(r126, r127, 1).
adjacent(r126, r140).
shared_edge(r126, r140, 3).
adjacent(r126, r29).
shared_edge(r126, r29, 2).
adjacent(r127, r128).
shared_edge(r127, r128, 1).
adjacent(r127, r140).
shared_edge(r127, r140, 1).
adjacent(r127, r29).
shared_edge(r127, r29, 1).
adjacent(r128, r140).
shared_edge(r128, r140, 1).
adjacent(r128, r141).
shared_edge(r128, r141, 1).
adjacent(r128, r29).
shared_edge(r128, r29, 3).
adjacent(r13, r14).
shared_edge(r13, r14, 1).
adjacent(r130, r131).
shared_edge(r130, r131, 1).
adjacent(r132, r133).
shared_edge(r132, r133, 3).
adjacent(r132, r135).
shared_edge(r132, r135, 1).
adjacent(r132, r149).
shared_edge(r132, r149, 6).
adjacent(r132, r150).
shared_edge(r132, r150, 1).
adjacent(r132, r151).
shared_edge(r132, r151, 1).
adjacent(r132, r152).
shared_edge(r132, r152, 1).
adjacent(r132, r162).
shared_edge(r132, r162, 3).
adjacent(r132, r163).
shared_edge(r132, r163, 1).
adjacent(r132, r175).
shared_edge(r132, r175, 7).
adjacent(r132, r177).
shared_edge(r132, r177, 11).
adjacent(r132, r191).
shared_edge(r132, r191, 8).
adjacent(r132, r203).
shared_edge(r132, r203, 33).
adjacent(r132, r271).
shared_edge(r132, r271, 4).
adjacent(r132, r299).
shared_edge(r132, r299, 1).
adjacent(r133, r134).
shared_edge(r133, r134, 1).
adjacent(r133, r149).
shared_edge(r133, r149, 1).
adjacent(r133, r77).
shared_edge(r133, r77, 3).
adjacent(r134, r135).
shared_edge(r134, r135, 1).
adjacent(r134, r149).
shared_edge(r134, r149, 1).
adjacent(r134, r66).
shared_edge(r134, r66, 1).
adjacent(r135, r136).
shared_edge(r135, r136, 1).
adjacent(r135, r66).
shared_edge(r135, r66, 1).
adjacent(r136, r150).
shared_edge(r136, r150, 1).
adjacent(r136, r66).
shared_edge(r136, r66, 2).
adjacent(r137, r152).
shared_edge(r137, r152, 1).
adjacent(r137, r163).
shared_edge(r137, r163, 1).
adjacent(r137, r66).
shared_edge(r137, r66, 4).
adjacent(r138, r153).
shared_edge(r138, r153, 11).
adjacent(r138, r168).
shared_edge(r138, r168, 1).
adjacent(r138, r169).
shared_edge(r138, r169, 2).
adjacent(r138, r181).
shared_edge(r138, r181, 2).
adjacent(r138, r182).
shared_edge(r138, r182, 1).
adjacent(r138, r206).
shared_edge(r138, r206, 1).
adjacent(r138, r207).
shared_edge(r138, r207, 2).
adjacent(r138, r208).
shared_edge(r138, r208, 1).
adjacent(r138, r219).
shared_edge(r138, r219, 1).
adjacent(r138, r220).
shared_edge(r138, r220, 1).
adjacent(r138, r221).
shared_edge(r138, r221, 1).
adjacent(r138, r52).
shared_edge(r138, r52, 7).
adjacent(r139, r140).
shared_edge(r139, r140, 7).
adjacent(r139, r154).
shared_edge(r139, r154, 4).
adjacent(r139, r155).
shared_edge(r139, r155, 1).
adjacent(r139, r170).
shared_edge(r139, r170, 1).
adjacent(r139, r185).
shared_edge(r139, r185, 71).
adjacent(r139, r283).
shared_edge(r139, r283, 37).
adjacent(r14, r15).
shared_edge(r14, r15, 1).
adjacent(r14, r5).
shared_edge(r14, r5, 1).
adjacent(r140, r141).
shared_edge(r140, r141, 1).
adjacent(r141, r142).
shared_edge(r141, r142, 1).
adjacent(r141, r154).
shared_edge(r141, r154, 2).
adjacent(r141, r29).
shared_edge(r141, r29, 1).
adjacent(r142, r143).
shared_edge(r142, r143, 1).
adjacent(r142, r154).
shared_edge(r142, r154, 1).
adjacent(r142, r29).
shared_edge(r142, r29, 1).
adjacent(r143, r155).
shared_edge(r143, r155, 1).
adjacent(r143, r29).
shared_edge(r143, r29, 2).
adjacent(r145, r146).
shared_edge(r145, r146, 1).
adjacent(r146, r147).
shared_edge(r146, r147, 1).
adjacent(r146, r160).
shared_edge(r146, r160, 1).
adjacent(r147, r148).
shared_edge(r147, r148, 1).
adjacent(r147, r160).
shared_edge(r147, r160, 1).
adjacent(r147, r161).
shared_edge(r147, r161, 1).
adjacent(r148, r161).
shared_edge(r148, r161, 1).
adjacent(r15, r19).
shared_edge(r15, r19, 1).
adjacent(r15, r5).
shared_edge(r15, r5, 2).
adjacent(r150, r151).
shared_edge(r150, r151, 1).
adjacent(r150, r162).
shared_edge(r150, r162, 1).
adjacent(r151, r152).
shared_edge(r151, r152, 1).
adjacent(r151, r66).
shared_edge(r151, r66, 1).
adjacent(r152, r66).
shared_edge(r152, r66, 1).
adjacent(r153, r168).
shared_edge(r153, r168, 7).
adjacent(r154, r155).
shared_edge(r154, r155, 1).
adjacent(r155, r156).
shared_edge(r155, r156, 1).
adjacent(r156, r157).
shared_edge(r156, r157, 1).
adjacent(r156, r170).
shared_edge(r156, r170, 1).
adjacent(r156, r29).
shared_edge(r156, r29, 1).
adjacent(r157, r158).
shared_edge(r157, r158, 1).
adjacent(r157, r170).
shared_edge(r157, r170, 1).
adjacent(r157, r29).
shared_edge(r157, r29, 1).
adjacent(r158, r171).
shared_edge(r158, r171, 1).
adjacent(r158, r29).
shared_edge(r158, r29, 2).
adjacent(r16, r28).
shared_edge(r16, r28, 4).
adjacent(r16, r34).
shared_edge(r16, r34, 8).
adjacent(r16, r50).
shared_edge(r16, r50, 4).
adjacent(r16, r51).
shared_edge(r16, r51, 4).
adjacent(r16, r59).
shared_edge(r16, r59, 2).
adjacent(r16, r64).
shared_edge(r16, r64, 2).
adjacent(r16, r65).
shared_edge(r16, r65, 1).
adjacent(r16, r72).
shared_edge(r16, r72, 1).
adjacent(r16, r73).
shared_edge(r16, r73, 1).
adjacent(r16, r74).
shared_edge(r16, r74, 3).
adjacent(r16, r75).
shared_edge(r16, r75, 9).
adjacent(r16, r76).
shared_edge(r16, r76, 3).
adjacent(r16, r77).
shared_edge(r16, r77, 1).
adjacent(r16, r85).
shared_edge(r16, r85, 13).
adjacent(r16, r94).
shared_edge(r16, r94, 1).
adjacent(r163, r164).
shared_edge(r163, r164, 1).
adjacent(r163, r175).
shared_edge(r163, r175, 2).
adjacent(r163, r66).
shared_edge(r163, r66, 1).
adjacent(r164, r165).
shared_edge(r164, r165, 1).
adjacent(r164, r176).
shared_edge(r164, r176, 1).
adjacent(r164, r66).
shared_edge(r164, r66, 1).
adjacent(r165, r166).
shared_edge(r165, r166, 1).
adjacent(r165, r177).
shared_edge(r165, r177, 1).
adjacent(r165, r66).
shared_edge(r165, r66, 1).
adjacent(r166, r167).
shared_edge(r166, r167, 1).
adjacent(r166, r177).
shared_edge(r166, r177, 1).
adjacent(r166, r66).
shared_edge(r166, r66, 1).
adjacent(r167, r178).
shared_edge(r167, r178, 1).
adjacent(r167, r66).
shared_edge(r167, r66, 2).
adjacent(r168, r169).
shared_edge(r168, r169, 1).
adjacent(r168, r180).
shared_edge(r168, r180, 7).
adjacent(r168, r208).
shared_edge(r168, r208, 2).
adjacent(r168, r222).
shared_edge(r168, r222, 3).
adjacent(r168, r223).
shared_edge(r168, r223, 1).
adjacent(r169, r181).
shared_edge(r169, r181, 1).
adjacent(r17, r18).
shared_edge(r17, r18, 3).
adjacent(r17, r22).
shared_edge(r17, r22, 3).
adjacent(r17, r29).
shared_edge(r17, r29, 22).
adjacent(r17, r30).
shared_edge(r17, r30, 3).
adjacent(r17, r38).
shared_edge(r17, r38, 2).
adjacent(r17, r44).
shared_edge(r17, r44, 2).
adjacent(r17, r54).
shared_edge(r17, r54, 2).
adjacent(r17, r60).
shared_edge(r17, r60, 2).
adjacent(r17, r68).
shared_edge(r17, r68, 1).
adjacent(r170, r171).
shared_edge(r170, r171, 1).
adjacent(r170, r186).
shared_edge(r170, r186, 2).
adjacent(r171, r172).
shared_edge(r171, r172, 1).
adjacent(r171, r186).
shared_edge(r171, r186, 1).
adjacent(r172, r173).
shared_edge(r172, r173, 1).
adjacent(r172, r187).
shared_edge(r172, r187, 1).
adjacent(r172, r29).
shared_edge(r172, r29, 1).
adjacent(r173, r187).
shared_edge(r173, r187, 1).
adjacent(r173, r29).
shared_edge(r173, r29, 2).
adjacent(r175, r176).
shared_edge(r175, r176, 1).
adjacent(r176, r177).
shared_edge(r176, r177, 2).
adjacent(r177, r178).
shared_edge(r177, r178, 16).
adjacent(r177, r216).
shared_edge(r177, r216, 4).
adjacent(r177, r233).
shared_edge(r177, r233, 1).
adjacent(r177, r235).
shared_edge(r177, r235, 2).
adjacent(r177, r236).
shared_edge(r177, r236, 3).
adjacent(r177, r239).
shared_edge(r177, r239, 1).
adjacent(r177, r246).
shared_edge(r177, r246, 3).
adjacent(r177, r247).
shared_edge(r177, r247, 3).
adjacent(r177, r248).
shared_edge(r177, r248, 2).
adjacent(r177, r249).
shared_edge(r177, r249, 4).
adjacent(r177, r257).
shared_edge(r177, r257, 2).
adjacent(r177, r258).
shared_edge(r177, r258, 1).
adjacent(r177, r259).
shared_edge(r177, r259, 1).
adjacent(r177, r260).
shared_edge(r177, r260, 1).
adjacent(r177, r261).
shared_edge(r177, r261, 1).
adjacent(r177, r262).
shared_edge(r177, r262, 4).
adjacent(r177, r272).
shared_edge(r177, r272, 14).
adjacent(r177, r273).
shared_edge(r177, r273, 3).
adjacent(r177, r274).
shared_edge(r177, r274, 1).
adjacent(r177, r276).
shared_edge(r177, r276, 2).
adjacent(r177, r289).
shared_edge(r177, r289, 1).
adjacent(r177, r290).
shared_edge(r177, r290, 2).
adjacent(r177, r291).
shared_edge(r177, r291, 2).
adjacent(r177, r301).
shared_edge(r177, r301, 3).
adjacent(r177, r302).
shared_edge(r177, r302, 2).
adjacent(r177, r317).
shared_edge(r177, r317, 2).
adjacent(r178, r179).
shared_edge(r178, r179, 2).
adjacent(r178, r192).
shared_edge(r178, r192, 2).
adjacent(r178, r193).
shared_edge(r178, r193, 1).
adjacent(r178, r194).
shared_edge(r178, r194, 1).
adjacent(r178, r204).
shared_edge(r178, r204, 2).
adjacent(r178, r205).
shared_edge(r178, r205, 1).
adjacent(r178, r217).
shared_edge(r178, r217, 2).
adjacent(r178, r218).
shared_edge(r178, r218, 1).
adjacent(r178, r237).
shared_edge(r178, r237, 2).
adjacent(r178, r239).
shared_edge(r178, r239, 3).
adjacent(r179, r66).
shared_edge(r179, r66, 1).
adjacent(r180, r181).
shared_edge(r180, r181, 4).
adjacent(r180, r182).
shared_edge(r180, r182, 1).
adjacent(r180, r195).
shared_edge(r180, r195, 2).
adjacent(r180, r209).
shared_edge(r180, r209, 3).
adjacent(r180, r223).
shared_edge(r180, r223, 3).
adjacent(r181, r182).
shared_edge(r181, r182, 1).
adjacent(r182, r183).
shared_edge(r182, r183, 1).
adjacent(r182, r195).
shared_edge(r182, r195, 1).
adjacent(r182, r52).
shared_edge(r182, r52, 1).
adjacent(r183, r196).
shared_edge(r183, r196, 3).
adjacent(r183, r210).
shared_edge(r183, r210, 3).
adjacent(r183, r224).
shared_edge(r183, r224, 1).
adjacent(r183, r43).
shared_edge(r183, r43, 3).
adjacent(r183, r52).
shared_edge(r183, r52, 7).
adjacent(r184, r43).
shared_edge(r184, r43, 9).
adjacent(r185, r186).
shared_edge(r185, r186, 17).
adjacent(r185, r284).
shared_edge(r185, r284, 4).
adjacent(r185, r285).
shared_edge(r185, r285, 4).
adjacent(r185, r294).
shared_edge(r185, r294, 61).
adjacent(r185, r295).
shared_edge(r185, r295, 1).
adjacent(r186, r187).
shared_edge(r186, r187, 3).
adjacent(r186, r198).
shared_edge(r186, r198, 2).
adjacent(r186, r211).
shared_edge(r186, r211, 4).
adjacent(r186, r256).
shared_edge(r186, r256, 2).
adjacent(r186, r268).
shared_edge(r186, r268, 2).
adjacent(r186, r284).
shared_edge(r186, r284, 1).
adjacent(r187, r188).
shared_edge(r187, r188, 1).
adjacent(r188, r189).
shared_edge(r188, r189, 1).
adjacent(r188, r198).
shared_edge(r188, r198, 1).
adjacent(r188, r29).
shared_edge(r188, r29, 1).
adjacent(r189, r199).
shared_edge(r189, r199, 1).
adjacent(r189, r29).
shared_edge(r189, r29, 2).
adjacent(r19, r20).
shared_edge(r19, r20, 1).
adjacent(r192, r193).
shared_edge(r192, r193, 1).
adjacent(r193, r194).
shared_edge(r193, r194, 1).
adjacent(r195, r196).
shared_edge(r195, r196, 2).
adjacent(r195, r223).
shared_edge(r195, r223, 1).
adjacent(r196, r223).
shared_edge(r196, r223, 1).
adjacent(r197, r210).
shared_edge(r197, r210, 1).
adjacent(r197, r226).
shared_edge(r197, r226, 2).
adjacent(r197, r227).
shared_edge(r197, r227, 5).
adjacent(r197, r243).
shared_edge(r197, r243, 1).
adjacent(r197, r43).
shared_edge(r197, r43, 9).
adjacent(r198, r199).
shared_edge(r198, r199, 1).
adjacent(r199, r200).
shared_edge(r199, r200, 1).
adjacent(r199, r211).
shared_edge(r199, r211, 1).
adjacent(r2, r3).
shared_edge(r2, r3, 1).
adjacent(r20, r21).
shared_edge(r20, r21, 1).
adjacent(r20, r5).
shared_edge(r20, r5, 1).
adjacent(r200, r201).
shared_edge(r200, r201, 1).
adjacent(r200, r212).
shared_edge(r200, r212, 1).
adjacent(r200, r29).
shared_edge(r200, r29, 1).
adjacent(r201, r213).
shared_edge(r201, r213, 1).
adjacent(r201, r29).
shared_edge(r201, r29, 2).
adjacent(r203, r271).
shared_edge(r203, r271, 2).
adjacent(r203, r272).
shared_edge(r203, r272, 25).
adjacent(r203, r300).
shared_edge(r203, r300, 2).
adjacent(r203, r314).
shared_edge(r203, r314, 1).
adjacent(r203, r315).
shared_edge(r203, r315, 2).
adjacent(r203, r326).
shared_edge(r203, r326, 1).
adjacent(r203, r327).
shared_edge(r203, r327, 2).
adjacent(r203, r335).
shared_edge(r203, r335, 2).
adjacent(r203, r339).
shared_edge(r203, r339, 1).
adjacent(r203, r340).
shared_edge(r203, r340, 2).
adjacent(r203, r350).
shared_edge(r203, r350, 1).
adjacent(r203, r351).
shared_edge(r203, r351, 2).
adjacent(r203, r352).
shared_edge(r203, r352, 3).
adjacent(r203, r355).
shared_edge(r203, r355, 1).
adjacent(r203, r356).
shared_edge(r203, r356, 2).
adjacent(r203, r360).
shared_edge(r203, r360, 2).
adjacent(r203, r365).
shared_edge(r203, r365, 2).
adjacent(r203, r369).
shared_edge(r203, r369, 2).
adjacent(r203, r376).
shared_edge(r203, r376, 1).
adjacent(r203, r377).
shared_edge(r203, r377, 2).
adjacent(r203, r378).
shared_edge(r203, r378, 3).
adjacent(r203, r385).
shared_edge(r203, r385, 2).
adjacent(r203, r390).
shared_edge(r203, r390, 1).
adjacent(r204, r205).
shared_edge(r204, r205, 1).
adjacent(r205, r206).
shared_edge(r205, r206, 1).
adjacent(r206, r207).
shared_edge(r206, r207, 1).
adjacent(r206, r217).
shared_edge(r206, r217, 1).
adjacent(r207, r218).
shared_edge(r207, r218, 1).
adjacent(r208, r222).
shared_edge(r208, r222, 1).
adjacent(r209, r223).
shared_edge(r209, r223, 1).
adjacent(r21, r24).
shared_edge(r21, r24, 1).
adjacent(r21, r5).
shared_edge(r21, r5, 2).
adjacent(r210, r224).
shared_edge(r210, r224, 1).
adjacent(r210, r225).
shared_edge(r210, r225, 1).
adjacent(r211, r212).
shared_edge(r211, r212, 3).
adjacent(r212, r213).
shared_edge(r212, r213, 1).
adjacent(r212, r229).
shared_edge(r212, r229, 2).
adjacent(r212, r256).
shared_edge(r212, r256, 1).
adjacent(r213, r214).
shared_edge(r213, r214, 1).
adjacent(r213, r229).
shared_edge(r213, r229, 1).
adjacent(r214, r230).
shared_edge(r214, r230, 1).
adjacent(r214, r29).
shared_edge(r214, r29, 2).
adjacent(r216, r233).
shared_edge(r216, r233, 1).
adjacent(r216, r234).
shared_edge(r216, r234, 1).
adjacent(r217, r218).
shared_edge(r217, r218, 1).
adjacent(r218, r219).
shared_edge(r218, r219, 1).
adjacent(r219, r220).
shared_edge(r219, r220, 1).
adjacent(r219, r237).
shared_edge(r219, r237, 1).
adjacent(r220, r221).
shared_edge(r220, r221, 1).
adjacent(r220, r238).
shared_edge(r220, r238, 1).
adjacent(r221, r222).
shared_edge(r221, r222, 1).
adjacent(r221, r238).
shared_edge(r221, r238, 1).
adjacent(r222, r223).
shared_edge(r222, r223, 1).
adjacent(r222, r238).
shared_edge(r222, r238, 2).
adjacent(r222, r239).
shared_edge(r222, r239, 2).
adjacent(r223, r224).
shared_edge(r223, r224, 1).
adjacent(r223, r239).
shared_edge(r223, r239, 3).
adjacent(r223, r240).
shared_edge(r223, r240, 4).
adjacent(r224, r225).
shared_edge(r224, r225, 1).
adjacent(r224, r241).
shared_edge(r224, r241, 2).
adjacent(r225, r226).
shared_edge(r225, r226, 1).
adjacent(r225, r242).
shared_edge(r225, r242, 1).
adjacent(r226, r242).
shared_edge(r226, r242, 1).
adjacent(r227, r228).
shared_edge(r227, r228, 3).
adjacent(r227, r244).
shared_edge(r227, r244, 1).
adjacent(r227, r245).
shared_edge(r227, r245, 2).
adjacent(r227, r254).
shared_edge(r227, r254, 2).
adjacent(r227, r255).
shared_edge(r227, r255, 3).
adjacent(r227, r267).
shared_edge(r227, r267, 1).
adjacent(r228, r43).
shared_edge(r228, r43, 2).
adjacent(r229, r230).
shared_edge(r229, r230, 3).
adjacent(r229, r256).
shared_edge(r229, r256, 1).
adjacent(r229, r268).
shared_edge(r229, r268, 1).
adjacent(r230, r231).
shared_edge(r230, r231, 3).
adjacent(r230, r269).
shared_edge(r230, r269, 1).
adjacent(r231, r270).
shared_edge(r231, r270, 3).
adjacent(r231, r284).
shared_edge(r231, r284, 1).
adjacent(r231, r285).
shared_edge(r231, r285, 4).
adjacent(r231, r29).
shared_edge(r231, r29, 11).
adjacent(r233, r234).
shared_edge(r233, r234, 1).
adjacent(r233, r247).
shared_edge(r233, r247, 1).
adjacent(r234, r235).
shared_edge(r234, r235, 1).
adjacent(r234, r248).
shared_edge(r234, r248, 1).
adjacent(r235, r236).
shared_edge(r235, r236, 1).
adjacent(r237, r238).
shared_edge(r237, r238, 1).
adjacent(r238, r239).
shared_edge(r238, r239, 7).
adjacent(r239, r240).
shared_edge(r239, r240, 1).
adjacent(r239, r250).
shared_edge(r239, r250, 2).
adjacent(r239, r251).
shared_edge(r239, r251, 3).
adjacent(r239, r262).
shared_edge(r239, r262, 2).
adjacent(r239, r263).
shared_edge(r239, r263, 7).
adjacent(r239, r272).
shared_edge(r239, r272, 13).
adjacent(r239, r291).
shared_edge(r239, r291, 2).
adjacent(r239, r302).
shared_edge(r239, r302, 2).
adjacent(r239, r303).
shared_edge(r239, r303, 2).
adjacent(r239, r317).
shared_edge(r239, r317, 2).
adjacent(r239, r318).
shared_edge(r239, r318, 4).
adjacent(r239, r319).
shared_edge(r239, r319, 2).
adjacent(r24, r25).
shared_edge(r24, r25, 1).
adjacent(r240, r241).
shared_edge(r240, r241, 1).
adjacent(r240, r251).
shared_edge(r240, r251, 4).
adjacent(r241, r242).
shared_edge(r241, r242, 1).
adjacent(r241, r251).
shared_edge(r241, r251, 2).
adjacent(r242, r243).
shared_edge(r242, r243, 1).
adjacent(r242, r251).
shared_edge(r242, r251, 3).
adjacent(r242, r252).
shared_edge(r242, r252, 1).
adjacent(r243, r244).
shared_edge(r243, r244, 1).
adjacent(r243, r252).
shared_edge(r243, r252, 1).
adjacent(r244, r245).
shared_edge(r244, r245, 1).
adjacent(r244, r252).
shared_edge(r244, r252, 1).
adjacent(r245, r253).
shared_edge(r245, r253, 1).
adjacent(r246, r247).
shared_edge(r246, r247, 1).
adjacent(r247, r248).
shared_edge(r247, r248, 1).
adjacent(r249, r260).
shared_edge(r249, r260, 1).
adjacent(r249, r261).
shared_edge(r249, r261, 1).
adjacent(r25, r26).
shared_edge(r25, r26, 1).
adjacent(r25, r5).
shared_edge(r25, r5, 1).
adjacent(r250, r251).
shared_edge(r250, r251, 2).
adjacent(r251, r252).
shared_edge(r251, r252, 2).
adjacent(r251, r263).
shared_edge(r251, r263, 9).
adjacent(r251, r264).
shared_edge(r251, r264, 3).
adjacent(r251, r265).
shared_edge(r251, r265, 8).
adjacent(r251, r266).
shared_edge(r251, r266, 1).
adjacent(r251, r277).
shared_edge(r251, r277, 11).
adjacent(r251, r279).
shared_edge(r251, r279, 1).
adjacent(r251, r292).
shared_edge(r251, r292, 14).
adjacent(r251, r293).
shared_edge(r251, r293, 1).
adjacent(r251, r305).
shared_edge(r251, r305, 2).
adjacent(r251, r320).
shared_edge(r251, r320, 7).
adjacent(r251, r329).
shared_edge(r251, r329, 1).
adjacent(r251, r336).
shared_edge(r251, r336, 2).
adjacent(r251, r343).
shared_edge(r251, r343, 1).
adjacent(r251, r344).
shared_edge(r251, r344, 1).
adjacent(r252, r253).
shared_edge(r252, r253, 1).
adjacent(r253, r254).
shared_edge(r253, r254, 1).
adjacent(r253, r266).
shared_edge(r253, r266, 1).
adjacent(r254, r266).
shared_edge(r254, r266, 1).
adjacent(r255, r267).
shared_edge(r255, r267, 1).
adjacent(r255, r281).
shared_edge(r255, r281, 1).
adjacent(r255, r282).
shared_edge(r255, r282, 1).
adjacent(r257, r258).
shared_edge(r257, r258, 1).
adjacent(r257, r274).
shared_edge(r257, r274, 1).
adjacent(r258, r259).
shared_edge(r258, r259, 1).
adjacent(r258, r275).
shared_edge(r258, r275, 1).
adjacent(r259, r260).
shared_edge(r259, r260, 2).
adjacent(r26, r27).
shared_edge(r26, r27, 1).
adjacent(r26, r31).
shared_edge(r26, r31, 1).
adjacent(r26, r5).
shared_edge(r26, r5, 1).
adjacent(r260, r261).
shared_edge(r260, r261, 1).
adjacent(r260, r275).
shared_edge(r260, r275, 1).
adjacent(r260, r276).
shared_edge(r260, r276, 1).
adjacent(r260, r289).
shared_edge(r260, r289, 1).
adjacent(r260, r290).
shared_edge(r260, r290, 2).
adjacent(r261, r276).
shared_edge(r261, r276, 1).
adjacent(r263, r304).
shared_edge(r263, r304, 3).
adjacent(r263, r319).
shared_edge(r263, r319, 3).
adjacent(r264, r278).
shared_edge(r264, r278, 1).
adjacent(r266, r267).
shared_edge(r266, r267, 1).
adjacent(r266, r279).
shared_edge(r266, r279, 1).
adjacent(r266, r280).
shared_edge(r266, r280, 1).
adjacent(r267, r281).
shared_edge(r267, r281, 1).
adjacent(r268, r269).
shared_edge(r268, r269, 1).
adjacent(r269, r270).
shared_edge(r269, r270, 1).
adjacent(r269, r284).
shared_edge(r269, r284, 1).
adjacent(r27, r32).
shared_edge(r27, r32, 1).
adjacent(r27, r33).
shared_edge(r27, r33, 1).
adjacent(r27, r5).
shared_edge(r27, r5, 3).
adjacent(r270, r284).
shared_edge(r270, r284, 2).
adjacent(r271, r272).
shared_edge(r271, r272, 6).
adjacent(r272, r301).
shared_edge(r272, r301, 1).
adjacent(r272, r316).
shared_edge(r272, r316, 3).
adjacent(r272, r319).
shared_edge(r272, r319, 1).
adjacent(r272, r328).
shared_edge(r272, r328, 4).
adjacent(r272, r352).
shared_edge(r272, r352, 14).
adjacent(r272, r353).
shared_edge(r272, r353, 1).
adjacent(r272, r361).
shared_edge(r272, r361, 10).
adjacent(r272, r370).
shared_edge(r272, r370, 14).
adjacent(r272, r386).
shared_edge(r272, r386, 4).
adjacent(r273, r274).
shared_edge(r273, r274, 1).
adjacent(r274, r275).
shared_edge(r274, r275, 1).
adjacent(r275, r289).
shared_edge(r275, r289, 1).
adjacent(r277, r278).
shared_edge(r277, r278, 3).
adjacent(r277, r305).
shared_edge(r277, r305, 3).
adjacent(r277, r321).
shared_edge(r277, r321, 1).
adjacent(r279, r280).
shared_edge(r279, r280, 1).
adjacent(r279, r293).
shared_edge(r279, r293, 1).
adjacent(r280, r281).
shared_edge(r280, r281, 3).
adjacent(r280, r293).
shared_edge(r280, r293, 1).
adjacent(r280, r307).
shared_edge(r280, r307, 2).
adjacent(r281, r282).
shared_edge(r281, r282, 2).
adjacent(r281, r308).
shared_edge(r281, r308, 1).
adjacent(r281, r309).
shared_edge(r281, r309, 1).
adjacent(r283, r337).
shared_edge(r283, r337, 21).
adjacent(r284, r285).
shared_edge(r284, r285, 1).
adjacent(r285, r286).
shared_edge(r285, r286, 1).
adjacent(r286, r287).
shared_edge(r286, r287, 1).
adjacent(r286, r29).
shared_edge(r286, r29, 1).
adjacent(r286, r295).
shared_edge(r286, r295, 1).
adjacent(r287, r288).
shared_edge(r287, r288, 1).
adjacent(r287, r29).
shared_edge(r287, r29, 1).
adjacent(r287, r295).
shared_edge(r287, r295, 1).
adjacent(r288, r295).
shared_edge(r288, r295, 1).
adjacent(r288, r296).
shared_edge(r288, r296, 1).
adjacent(r289, r301).
shared_edge(r289, r301, 1).
adjacent(r29, r53).
shared_edge(r29, r53, 11).
adjacent(r29, r79).
shared_edge(r29, r79, 3).
adjacent(r29, r88).
shared_edge(r29, r88, 7).
adjacent(r29, r89).
shared_edge(r29, r89, 3).
adjacent(r29, r98).
shared_edge(r29, r98, 3).
adjacent(r292, r305).
shared_edge(r292, r305, 1).
adjacent(r292, r306).
shared_edge(r292, r306, 1).
adjacent(r292, r321).
shared_edge(r292, r321, 3).
adjacent(r292, r322).
shared_edge(r292, r322, 23).
adjacent(r292, r329).
shared_edge(r292, r329, 6).
adjacent(r292, r330).
shared_edge(r292, r330, 10).
adjacent(r292, r347).
shared_edge(r292, r347, 8).
adjacent(r292, r348).
shared_edge(r292, r348, 4).
adjacent(r292, r361).
shared_edge(r292, r361, 5).
adjacent(r292, r366).
shared_edge(r292, r366, 4).
adjacent(r292, r371).
shared_edge(r292, r371, 8).
adjacent(r292, r379).
shared_edge(r292, r379, 3).
adjacent(r292, r392).
shared_edge(r292, r392, 5).
adjacent(r293, r306).
shared_edge(r293, r306, 1).
adjacent(r294, r295).
shared_edge(r294, r295, 3).
adjacent(r294, r310).
shared_edge(r294, r310, 3).
adjacent(r294, r311).
shared_edge(r294, r311, 1).
adjacent(r294, r312).
shared_edge(r294, r312, 1).
adjacent(r294, r323).
shared_edge(r294, r323, 2).
adjacent(r294, r324).
shared_edge(r294, r324, 1).
adjacent(r294, r332).
shared_edge(r294, r332, 2).
adjacent(r294, r333).
shared_edge(r294, r333, 1).
adjacent(r294, r338).
shared_edge(r294, r338, 3).
adjacent(r294, r339).
shared_edge(r294, r339, 1).
adjacent(r294, r349).
shared_edge(r294, r349, 2).
adjacent(r294, r350).
shared_edge(r294, r350, 1).
adjacent(r294, r354).
shared_edge(r294, r354, 1).
adjacent(r294, r358).
shared_edge(r294, r358, 3).
adjacent(r294, r363).
shared_edge(r294, r363, 21).
adjacent(r295, r296).
shared_edge(r295, r296, 1).
adjacent(r296, r297).
shared_edge(r296, r297, 1).
adjacent(r296, r310).
shared_edge(r296, r310, 1).
adjacent(r297, r298).
shared_edge(r297, r298, 1).
adjacent(r297, r310).
shared_edge(r297, r310, 1).
adjacent(r298, r299).
shared_edge(r298, r299, 1).
adjacent(r298, r311).
shared_edge(r298, r311, 1).
adjacent(r299, r300).
shared_edge(r299, r300, 1).
adjacent(r299, r312).
shared_edge(r299, r312, 1).
adjacent(r3, r4).
shared_edge(r3, r4, 1).
adjacent(r300, r313).
shared_edge(r300, r313, 1).
adjacent(r301, r316).
shared_edge(r301, r316, 1).
adjacent(r303, r304).
shared_edge(r303, r304, 1).
adjacent(r303, r319).
shared_edge(r303, r319, 1).
adjacent(r306, r307).
shared_edge(r306, r307, 1).
adjacent(r306, r322).
shared_edge(r306, r322, 1).
adjacent(r307, r308).
shared_edge(r307, r308, 2).
adjacent(r307, r322).
shared_edge(r307, r322, 3).
adjacent(r307, r331).
shared_edge(r307, r331, 2).
adjacent(r308, r309).
shared_edge(r308, r309, 3).
adjacent(r309, r322).
shared_edge(r309, r322, 9).
adjacent(r309, r331).
shared_edge(r309, r331, 2).
adjacent(r309, r367).
shared_edge(r309, r367, 3).
adjacent(r31, r32).
shared_edge(r31, r32, 1).
adjacent(r310, r311).
shared_edge(r310, r311, 1).
adjacent(r311, r312).
shared_edge(r311, r312, 1).
adjacent(r312, r313).
shared_edge(r312, r313, 1).
adjacent(r313, r314).
shared_edge(r313, r314, 1).
adjacent(r313, r323).
shared_edge(r313, r323, 1).
adjacent(r314, r315).
shared_edge(r314, r315, 1).
adjacent(r314, r324).
shared_edge(r314, r324, 1).
adjacent(r315, r325).
shared_edge(r315, r325, 1).
adjacent(r318, r319).
shared_edge(r318, r319, 4).
adjacent(r319, r336).
shared_edge(r319, r336, 1).
adjacent(r319, r341).
shared_edge(r319, r341, 2).
adjacent(r319, r353).
shared_edge(r319, r353, 2).
adjacent(r32, r33).
shared_edge(r32, r33, 1).
adjacent(r320, r329).
shared_edge(r320, r329, 4).
adjacent(r320, r345).
shared_edge(r320, r345, 1).
adjacent(r322, r372).
shared_edge(r322, r372, 2).
adjacent(r323, r324).
shared_edge(r323, r324, 1).
adjacent(r324, r325).
shared_edge(r324, r325, 1).
adjacent(r325, r326).
shared_edge(r325, r326, 1).
adjacent(r325, r332).
shared_edge(r325, r332, 1).
adjacent(r326, r327).
shared_edge(r326, r327, 1).
adjacent(r326, r333).
shared_edge(r326, r333, 1).
adjacent(r327, r334).
shared_edge(r327, r334, 1).
adjacent(r329, r345).
shared_edge(r329, r345, 1).
adjacent(r329, r346).
shared_edge(r329, r346, 3).
adjacent(r329, r347).
shared_edge(r329, r347, 1).
adjacent(r33, r40).
shared_edge(r33, r40, 1).
adjacent(r332, r333).
shared_edge(r332, r333, 1).
adjacent(r333, r334).
shared_edge(r333, r334, 1).
adjacent(r334, r335).
shared_edge(r334, r335, 1).
adjacent(r334, r338).
shared_edge(r334, r338, 1).
adjacent(r335, r338).
shared_edge(r335, r338, 1).
adjacent(r336, r342).
shared_edge(r336, r342, 1).
adjacent(r337, r357).
shared_edge(r337, r357, 5).
adjacent(r337, r374).
shared_edge(r337, r374, 9).
adjacent(r338, r339).
shared_edge(r338, r339, 1).
adjacent(r339, r340).
shared_edge(r339, r340, 1).
adjacent(r34, r35).
shared_edge(r34, r35, 5).
adjacent(r34, r36).
shared_edge(r34, r36, 5).
adjacent(r34, r37).
shared_edge(r34, r37, 1).
adjacent(r34, r43).
shared_edge(r34, r43, 29).
adjacent(r34, r52).
shared_edge(r34, r52, 38).
adjacent(r340, r349).
shared_edge(r340, r349, 1).
adjacent(r341, r342).
shared_edge(r341, r342, 2).
adjacent(r341, r353).
shared_edge(r341, r353, 2).
adjacent(r342, r343).
shared_edge(r342, r343, 3).
adjacent(r342, r353).
shared_edge(r342, r353, 1).
adjacent(r342, r362).
shared_edge(r342, r362, 1).
adjacent(r343, r344).
shared_edge(r343, r344, 1).
adjacent(r343, r347).
shared_edge(r343, r347, 4).
adjacent(r343, r362).
shared_edge(r343, r362, 1).
adjacent(r344, r345).
shared_edge(r344, r345, 1).
adjacent(r344, r347).
shared_edge(r344, r347, 1).
adjacent(r345, r347).
shared_edge(r345, r347, 1).
adjacent(r346, r347).
shared_edge(r346, r347, 5).
adjacent(r347, r362).
shared_edge(r347, r362, 9).
adjacent(r347, r387).
shared_edge(r347, r387, 1).
adjacent(r349, r350).
shared_edge(r349, r350, 1).
adjacent(r350, r351).
shared_edge(r350, r351, 1).
adjacent(r351, r354).
shared_edge(r351, r354, 1).
adjacent(r352, r378).
shared_edge(r352, r378, 3).
adjacent(r353, r361).
shared_edge(r353, r361, 2).
adjacent(r354, r355).
shared_edge(r354, r355, 1).
adjacent(r354, r358).
shared_edge(r354, r358, 1).
adjacent(r355, r356).
shared_edge(r355, r356, 1).
adjacent(r355, r358).
shared_edge(r355, r358, 1).
adjacent(r356, r359).
shared_edge(r356, r359, 1).
adjacent(r357, r373).
shared_edge(r357, r373, 2).
adjacent(r358, r359).
shared_edge(r358, r359, 1).
adjacent(r359, r360).
shared_edge(r359, r360, 1).
adjacent(r359, r363).
shared_edge(r359, r363, 1).
adjacent(r36, r37).
shared_edge(r36, r37, 1).
adjacent(r36, r5).
shared_edge(r36, r5, 2).
adjacent(r360, r364).
shared_edge(r360, r364, 1).
adjacent(r361, r362).
shared_edge(r361, r362, 11).
adjacent(r361, r387).
shared_edge(r361, r387, 3).
adjacent(r361, r391).
shared_edge(r361, r391, 3).
adjacent(r363, r364).
shared_edge(r363, r364, 2).
adjacent(r363, r368).
shared_edge(r363, r368, 2).
adjacent(r363, r375).
shared_edge(r363, r375, 1).
adjacent(r363, r382).
shared_edge(r363, r382, 2).
adjacent(r363, r388).
shared_edge(r363, r388, 1).
adjacent(r364, r365).
shared_edge(r364, r365, 1).
adjacent(r365, r368).
shared_edge(r365, r368, 1).
adjacent(r367, r372).
shared_edge(r367, r372, 1).
adjacent(r367, r380).
shared_edge(r367, r380, 2).
adjacent(r368, r369).
shared_edge(r368, r369, 1).
adjacent(r369, r375).
shared_edge(r369, r375, 1).
adjacent(r37, r43).
shared_edge(r37, r43, 28).
adjacent(r37, r5).
shared_edge(r37, r5, 28).
adjacent(r372, r379).
shared_edge(r372, r379, 1).
adjacent(r373, r374).
shared_edge(r373, r374, 5).
adjacent(r373, r381).
shared_edge(r373, r381, 4).
adjacent(r375, r376).
shared_edge(r375, r376, 1).
adjacent(r375, r382).
shared_edge(r375, r382, 1).
adjacent(r376, r377).
shared_edge(r376, r377, 1).
adjacent(r376, r383).
shared_edge(r376, r383, 1).
adjacent(r377, r384).
shared_edge(r377, r384, 1).
adjacent(r379, r380).
shared_edge(r379, r380, 2).
adjacent(r379, r393).
shared_edge(r379, r393, 2).
adjacent(r380, r394).
shared_edge(r380, r394, 2).
adjacent(r382, r383).
shared_edge(r382, r383, 1).
adjacent(r383, r384).
shared_edge(r383, r384, 1).
adjacent(r383, r388).
shared_edge(r383, r388, 1).
adjacent(r384, r385).
shared_edge(r384, r385, 1).
adjacent(r384, r389).
shared_edge(r384, r389, 1).
adjacent(r385, r390).
shared_edge(r385, r390, 1).
adjacent(r388, r389).
shared_edge(r388, r389, 1).
adjacent(r389, r390).
shared_edge(r389, r390, 1).
adjacent(r392, r393).
shared_edge(r392, r393, 1).
adjacent(r393, r394).
shared_edge(r393, r394, 1).
adjacent(r4, r5).
shared_edge(r4, r5, 1).
adjacent(r4, r8).
shared_edge(r4, r8, 1).
adjacent(r40, r41).
shared_edge(r40, r41, 1).
adjacent(r41, r42).
shared_edge(r41, r42, 1).
adjacent(r42, r46).
shared_edge(r42, r46, 1).
adjacent(r46, r47).
shared_edge(r46, r47, 1).
adjacent(r47, r48).
shared_edge(r47, r48, 1).
adjacent(r48, r55).
shared_edge(r48, r55, 1).
adjacent(r49, r57).
shared_edge(r49, r57, 1).
adjacent(r5, r6).
shared_edge(r5, r6, 4).
adjacent(r5, r7).
shared_edge(r5, r7, 27).
adjacent(r5, r9).
shared_edge(r5, r9, 1).
adjacent(r51, r52).
shared_edge(r51, r52, 4).
adjacent(r52, r59).
shared_edge(r52, r59, 1).
adjacent(r52, r66).
shared_edge(r52, r66, 32).
adjacent(r53, r67).
shared_edge(r53, r67, 6).
adjacent(r53, r78).
shared_edge(r53, r78, 2).
adjacent(r53, r87).
shared_edge(r53, r87, 1).
adjacent(r55, r56).
shared_edge(r55, r56, 1).
adjacent(r56, r57).
shared_edge(r56, r57, 1).
adjacent(r57, r61).
shared_edge(r57, r61, 1).
adjacent(r58, r63).
shared_edge(r58, r63, 1).
adjacent(r59, r66).
shared_edge(r59, r66, 1).
adjacent(r61, r62).
shared_edge(r61, r62, 1).
adjacent(r62, r63).
shared_edge(r62, r63, 1).
adjacent(r63, r70).
shared_edge(r63, r70, 1).
adjacent(r64, r65).
shared_edge(r64, r65, 1).
adjacent(r64, r77).
shared_edge(r64, r77, 1).
adjacent(r65, r66).
shared_edge(r65, r66, 2).
adjacent(r66, r77).
shared_edge(r66, r77, 12).
adjacent(r66, r86).
shared_edge(r66, r86, 10).
adjacent(r67, r78).
shared_edge(r67, r78, 5).
adjacent(r68, r79).
shared_edge(r68, r79, 1).
adjacent(r70, r71).
shared_edge(r70, r71, 1).
adjacent(r71, r72).
shared_edge(r71, r72, 1).
adjacent(r72, r73).
shared_edge(r72, r73, 1).
adjacent(r73, r74).
shared_edge(r73, r74, 1).
adjacent(r73, r81).
shared_edge(r73, r81, 1).
adjacent(r74, r82).
shared_edge(r74, r82, 1).
adjacent(r74, r83).
shared_edge(r74, r83, 1).
adjacent(r75, r83).
shared_edge(r75, r83, 1).
adjacent(r75, r84).
shared_edge(r75, r84, 4).
adjacent(r75, r92).
shared_edge(r75, r92, 1).
adjacent(r75, r93).
shared_edge(r75, r93, 1).
adjacent(r76, r77).
shared_edge(r76, r77, 3).
adjacent(r77, r85).
shared_edge(r77, r85, 11).
adjacent(r78, r87).
shared_edge(r78, r87, 1).
adjacent(r78, r95).
shared_edge(r78, r95, 7).
adjacent(r79, r80).
shared_edge(r79, r80, 1).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r80, r89).
shared_edge(r80, r89, 1).
adjacent(r81, r82).
shared_edge(r81, r82, 1).
adjacent(r82, r83).
shared_edge(r82, r83, 1).
adjacent(r83, r91).
shared_edge(r83, r91, 1).
adjacent(r84, r94).
shared_edge(r84, r94, 2).
adjacent(r87, r88).
shared_edge(r87, r88, 1).
adjacent(r87, r96).
shared_edge(r87, r96, 1).
adjacent(r88, r97).
shared_edge(r88, r97, 2).
adjacent(r89, r90).
shared_edge(r89, r90, 1).
adjacent(r90, r98).
shared_edge(r90, r98, 1).
adjacent(r91, r92).
shared_edge(r91, r92, 1).
adjacent(r92, r93).
shared_edge(r92, r93, 1).
adjacent(r93, r94).
shared_edge(r93, r94, 1).
adjacent(r95, r96).
shared_edge(r95, r96, 2).
adjacent(r96, r97).
shared_edge(r96, r97, 1).
adjacent(r98, r99).
shared_edge(r98, r99, 1).
