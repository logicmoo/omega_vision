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

region(r1, '#a4abad', 57, centroid(6,2)).
polygon(r1, [xy(0,0),xy(0,1),xy(1,0),xy(12,0),xy(12,1),xy(10,3),xy(6,3),xy(5,4),xy(5,5),xy(4,6),xy(2,4),xy(2,3),xy(1,2),xy(0,0)]).
midline(r1, [xy(1,1),xy(3,2),xy(4,2),xy(4,3),xy(5,2),xy(7,1),xy(7,2),xy(8,1),xy(8,2),xy(9,1),xy(9,2),xy(10,1),xy(10,2),xy(11,1)]).
midline(r1, [xy(4,5)]).
fillpoint(r1, xy(5,2), 3).
fillpoint(r1, xy(4,3), 3).
fillpoint(r1, xy(4,2), 3).
fillpoint(r1, xy(3,2), 3).
fillpoint(r1, xy(11,1), 2).
region(r2, '#b0b7b9', 67, centroid(15,3)).
polygon(r2, [xy(5,6),xy(6,5),xy(6,4),xy(10,4),xy(12,2),xy(13,2),xy(15,0),xy(20,0),xy(20,1),xy(19,2),xy(17,2),xy(13,6),xy(6,6),xy(5,6)]).
midline(r2, [xy(7,5),xy(10,5),xy(12,4),xy(13,4),xy(15,2),xy(17,1),xy(19,1)]).
fillpoint(r2, xy(15,2), 3).
fillpoint(r2, xy(14,3), 3).
fillpoint(r2, xy(13,4), 3).
fillpoint(r2, xy(12,4), 3).
fillpoint(r2, xy(19,1), 2).
region(r3, '#b7bebf', 85, centroid(20,4)).
polygon(r3, [xy(6,7),xy(8,7),xy(8,8),xy(7,9),xy(8,10),xy(9,9),xy(11,9),xy(12,8),xy(11,7),xy(9,7),xy(6,7)]).
midline(r3, [xy(8,9),xy(9,8),xy(11,8)]).
midline(r3, [xy(15,6),xy(17,4),xy(17,5),xy(18,4),xy(19,4),xy(20,3),xy(20,4),xy(22,2),xy(22,3),xy(23,3),xy(23,4),xy(25,2),xy(28,2),xy(29,1),xy(29,2),xy(30,1),xy(30,2),xy(31,1)]).
fillpoint(r3, xy(31,1), 2).
fillpoint(r3, xy(30,2), 2).
fillpoint(r3, xy(30,1), 2).
fillpoint(r3, xy(29,2), 2).
fillpoint(r3, xy(29,1), 2).
region(r4, '#bfc6c7', 100, centroid(19,8)).
polygon(r4, [xy(5,15),xy(5,19),xy(6,17),xy(7,17),xy(8,16),xy(8,15),xy(11,12),xy(13,12),xy(16,9),xy(15,8),xy(14,8),xy(13,9),xy(12,9),xy(11,10),xy(9,10),xy(8,11),xy(8,12),xy(6,14),xy(5,15)]).
midline(r4, [xy(6,15),xy(6,16),xy(7,15),xy(7,14),xy(8,13),xy(8,14),xy(9,13),xy(9,11),xy(10,11),xy(10,12),xy(12,10),xy(12,11),xy(13,10),xy(13,11),xy(14,10),xy(14,9),xy(15,9),xy(16,8)]).
midline(r4, [xy(7,16)]).
midline(r4, [xy(25,5)]).
midline(r4, [xy(29,5),xy(31,4),xy(32,3),xy(34,3),xy(36,1)]).
fillpoint(r4, xy(36,1), 2).
fillpoint(r4, xy(35,2), 2).
fillpoint(r4, xy(34,3), 2).
fillpoint(r4, xy(33,3), 2).
fillpoint(r4, xy(32,3), 2).
region(r5, '#c3cbcb', 27, centroid(34,4)).
polygon(r5, [xy(26,6),xy(27,6),xy(27,7),xy(28,6),xy(28,7),xy(29,7),xy(30,6),xy(30,7),xy(31,6),xy(31,7),xy(32,6),xy(32,5),xy(34,5),xy(35,4),xy(35,5),xy(36,4),xy(36,3),xy(37,3),xy(37,4),xy(38,3),xy(38,1),xy(39,0),xy(39,1),xy(40,0),xy(41,0),xy(26,6)]).
fillpoint(r5, xy(41,0), 1).
fillpoint(r5, xy(40,0), 1).
fillpoint(r5, xy(39,1), 1).
fillpoint(r5, xy(39,0), 1).
fillpoint(r5, xy(38,3), 1).
region(r6, '#c7cdce', 175, centroid(70,13)).
polygon(r6, [xy(38,4),xy(39,3),xy(39,2),xy(40,1),xy(40,2),xy(42,0),xy(42,1),xy(43,0),xy(49,0),xy(49,1),xy(50,0),xy(50,1),xy(51,1),xy(51,2),xy(52,1),xy(53,1),xy(54,2),xy(55,2),xy(55,3),xy(56,4),xy(57,3),xy(61,3),xy(62,4),xy(61,5),xy(58,5),xy(57,6),xy(55,6),xy(52,3),xy(38,4)]).
midline(r6, [xy(52,2),xy(53,2),xy(53,3),xy(54,3),xy(54,4),xy(55,4),xy(55,5),xy(56,5),xy(57,4),xy(57,5),xy(58,4),xy(61,4)]).
midline(r6, [xy(76,7)]).
midline(r6, [xy(79,30),xy(82,27),xy(82,28),xy(83,26),xy(84,25),xy(85,25),xy(86,23),xy(86,21),xy(87,20),xy(87,17),xy(86,16),xy(85,14),xy(81,10)]).
midline(r6, [xy(87,21)]).
fillpoint(r6, xy(86,23), 3).
fillpoint(r6, xy(87,23), 2).
fillpoint(r6, xy(87,22), 2).
fillpoint(r6, xy(87,21), 2).
fillpoint(r6, xy(87,20), 2).
region(r7, '#c3cbcb', 182, centroid(78,14)).
polygon(r7, [xy(51,0),xy(54,0),xy(54,1),xy(55,0),xy(55,1),xy(56,0),xy(59,0),xy(60,1),xy(59,2),xy(56,2),xy(56,3),xy(51,0)]).
midline(r7, [xy(56,1),xy(59,1)]).
midline(r7, [xy(62,2),xy(63,2),xy(63,3)]).
midline(r7, [xy(75,34)]).
midline(r7, [xy(77,5),xy(78,6),xy(80,7),xy(81,7),xy(83,9),xy(84,9),xy(84,10),xy(85,10),xy(85,11),xy(86,11),xy(86,12),xy(88,13),xy(89,15),xy(90,16),xy(90,23),xy(85,28),xy(86,28),xy(88,26)]).
midline(r7, [xy(81,31)]).
midline(r7, [xy(91,18),xy(91,20)]).
fillpoint(r7, xy(90,16), 3).
fillpoint(r7, xy(89,15), 3).
fillpoint(r7, xy(88,13), 3).
fillpoint(r7, xy(91,20), 2).
fillpoint(r7, xy(91,19), 2).
region(r8, '#bfc6c7', 174, centroid(84,14)).
polygon(r8, [xy(60,0),xy(64,0),xy(64,1),xy(65,0),xy(66,1),xy(65,2),xy(65,3),xy(68,3),xy(69,2),xy(68,1),xy(67,1),xy(69,3),xy(70,2),xy(70,3),xy(71,2),xy(71,3),xy(72,2),xy(72,3),xy(73,2),xy(73,3),xy(74,2),xy(74,3),xy(75,2),xy(75,3),xy(76,2),xy(76,3),xy(77,2),xy(77,3),xy(78,2),xy(79,3),xy(78,4),xy(79,5),xy(81,5),xy(82,4),xy(81,3),xy(80,3),xy(60,0)]).
midline(r8, [xy(65,1),xy(66,2),xy(68,2)]).
midline(r8, [xy(78,3),xy(79,4),xy(81,4),xy(82,5),xy(83,5),xy(83,6),xy(85,6),xy(85,7),xy(86,7),xy(87,8),xy(88,8),xy(88,9),xy(89,9),xy(89,10),xy(90,10),xy(90,11),xy(91,11),xy(91,12),xy(93,13),xy(93,14),xy(94,16),xy(94,20),xy(93,21),xy(93,23),xy(94,22),xy(94,23)]).
midline(r8, [xy(78,35),xy(82,33)]).
fillpoint(r8, xy(93,14), 3).
fillpoint(r8, xy(93,13), 3).
fillpoint(r8, xy(94,23), 2).
fillpoint(r8, xy(94,22), 2).
fillpoint(r8, xy(94,21), 2).
region(r9, '#b7bebf', 28, centroid(74,1)).
polygon(r9, [xy(66,0),xy(69,0),xy(69,1),xy(70,0),xy(70,1),xy(71,0),xy(71,1),xy(72,0),xy(72,1),xy(73,0),xy(73,1),xy(74,0),xy(74,1),xy(75,0),xy(75,1),xy(76,0),xy(76,1),xy(79,1),xy(79,2),xy(82,2),xy(82,3),xy(83,3),xy(66,0)]).
fillpoint(r9, xy(83,3), 1).
fillpoint(r9, xy(82,3), 1).
fillpoint(r9, xy(82,2), 1).
fillpoint(r9, xy(81,2), 1).
fillpoint(r9, xy(80,2), 1).
region(r10, '#b0b7b9', 43, centroid(87,4)).
polygon(r10, [xy(77,0),xy(80,0),xy(80,1),xy(81,0),xy(81,1),xy(83,1),xy(83,2),xy(84,2),xy(84,3),xy(85,2),xy(85,3),xy(87,1),xy(87,2),xy(88,3),xy(87,4),xy(86,4),xy(88,5),xy(89,4),xy(89,5),xy(90,4),xy(91,4),xy(92,5),xy(91,6),xy(90,6),xy(92,7),xy(93,6),xy(93,7),xy(94,6),xy(95,7),xy(94,8),xy(95,8),xy(95,9),xy(77,0)]).
midline(r10, [xy(86,3),xy(87,3),xy(88,4),xy(90,5),xy(91,5),xy(92,6),xy(94,7)]).
fillpoint(r10, xy(94,7), 2).
fillpoint(r10, xy(92,6), 2).
fillpoint(r10, xy(91,5), 2).
fillpoint(r10, xy(90,5), 2).
fillpoint(r10, xy(88,4), 2).
region(r11, '#a4abad', 48, centroid(91,2)).
polygon(r11, [xy(82,0),xy(84,0),xy(84,1),xy(85,0),xy(85,1),xy(86,0),xy(86,1),xy(87,0),xy(88,0),xy(88,2),xy(89,3),xy(91,3),xy(93,5),xy(94,5),xy(95,4),xy(95,1),xy(94,0),xy(89,0),xy(82,0)]).
midline(r11, [xy(89,1),xy(89,2),xy(90,1),xy(90,2),xy(93,2),xy(93,3)]).
fillpoint(r11, xy(93,3), 3).
fillpoint(r11, xy(93,2), 3).
fillpoint(r11, xy(92,2), 3).
fillpoint(r11, xy(94,4), 2).
fillpoint(r11, xy(94,3), 2).
region(r12, '#cbd2d3', 67, centroid(43,5)).
polygon(r12, [xy(34,10),xy(36,8),xy(36,7),xy(35,6),xy(37,6),xy(38,5),xy(39,5),xy(39,7),xy(38,8),xy(38,9),xy(37,10),xy(36,10),xy(35,11),xy(34,10)]).
midline(r12, [xy(35,10),xy(37,8),xy(37,7),xy(38,6),xy(38,7),xy(37,9)]).
midline(r12, [xy(44,2),xy(46,2),xy(46,3),xy(47,2),xy(47,3),xy(48,2),xy(48,3),xy(49,3),xy(49,4),xy(50,3),xy(51,4)]).
fillpoint(r12, xy(51,4), 2).
fillpoint(r12, xy(50,3), 2).
fillpoint(r12, xy(49,4), 2).
fillpoint(r12, xy(49,3), 2).
fillpoint(r12, xy(48,3), 2).
region(r14, '#3a3d3c', 59, centroid(2,11)).
polygon(r14, [xy(0,3),xy(0,18),xy(1,17),xy(1,18),xy(2,18),xy(2,19),xy(0,3)]).
midline(r14, [xy(1,14),xy(1,16),xy(2,15)]).
midline(r14, [xy(2,9),xy(2,12),xy(3,11),xy(3,9)]).
fillpoint(r14, xy(3,11), 3).
fillpoint(r14, xy(3,10), 3).
fillpoint(r14, xy(3,9), 3).
fillpoint(r14, xy(2,12), 3).
fillpoint(r14, xy(2,11), 3).
region(r16, '#d0d6d7', 23, centroid(42,6)).
polygon(r16, [xy(39,8),xy(39,9),xy(40,8),xy(40,6),xy(41,5),xy(41,6),xy(44,6),xy(44,7),xy(45,5),xy(43,3),xy(42,3),xy(42,4),xy(39,8)]).
midline(r16, [xy(42,5),xy(43,4),xy(43,5),xy(44,5)]).
fillpoint(r16, xy(44,5), 2).
fillpoint(r16, xy(43,5), 2).
fillpoint(r16, xy(43,4), 2).
fillpoint(r16, xy(42,5), 2).
fillpoint(r16, xy(45,5), 1).
region(r22, '#b7bebf', 22, centroid(91,8)).
polygon(r22, [xy(86,5),xy(87,5),xy(87,6),xy(89,6),xy(89,7),xy(90,7),xy(90,8),xy(91,7),xy(92,8),xy(91,9),xy(92,10),xy(93,10),xy(94,9),xy(95,10),xy(94,11),xy(95,11),xy(86,5)]).
midline(r22, [xy(91,8),xy(92,9),xy(93,9),xy(94,10)]).
fillpoint(r22, xy(94,10), 2).
fillpoint(r22, xy(93,9), 2).
fillpoint(r22, xy(92,9), 2).
fillpoint(r22, xy(91,8), 2).
fillpoint(r22, xy(95,11), 1).
region(r24, '#c7cdce', 80, centroid(16,16)).
polygon(r24, [xy(6,20),xy(6,22),xy(7,21),xy(7,22),xy(14,22),xy(14,24),xy(6,20)]).
midline(r24, [xy(8,21),xy(10,20),xy(12,20),xy(14,21)]).
midline(r24, [xy(13,16)]).
fillpoint(r24, xy(12,20), 3).
fillpoint(r24, xy(11,20), 3).
fillpoint(r24, xy(10,20), 3).
fillpoint(r24, xy(14,21), 2).
fillpoint(r24, xy(13,21), 2).
region(r35, '#c3cbcb', 54, centroid(14,13)).
polygon(r35, [xy(6,18),xy(6,19),xy(9,16),xy(9,15),xy(11,13),xy(12,13),xy(12,14),xy(11,15),xy(11,16),xy(7,20),xy(6,18)]).
midline(r35, [xy(7,19),xy(10,16),xy(10,15),xy(11,14)]).
midline(r35, [xy(14,13),xy(15,12),xy(15,13),xy(16,13),xy(16,14)]).
midline(r35, [xy(16,11)]).
fillpoint(r35, xy(16,14), 2).
fillpoint(r35, xy(16,13), 2).
fillpoint(r35, xy(16,11), 2).
fillpoint(r35, xy(15,13), 2).
fillpoint(r35, xy(15,12), 2).
region(r36, '#cbd2d3', 121, centroid(21,20)).
polygon(r36, [xy(12,26),xy(13,26),xy(13,27),xy(14,27),xy(15,28),xy(18,28),xy(19,27),xy(17,25),xy(17,24),xy(15,22),xy(15,24),xy(14,25),xy(12,26)]).
midline(r36, [xy(14,18),xy(15,18),xy(15,19),xy(16,18),xy(16,20)]).
midline(r36, [xy(15,26),xy(16,26),xy(16,24)]).
midline(r36, [xy(18,27)]).
midline(r36, [xy(20,12),xy(22,10)]).
midline(r36, [xy(24,30),xy(26,30),xy(27,29),xy(27,31),xy(28,29)]).
midline(r36, [xy(31,10)]).
fillpoint(r36, xy(16,26), 3).
fillpoint(r36, xy(15,26), 3).
fillpoint(r36, xy(31,10), 2).
fillpoint(r36, xy(28,29), 2).
fillpoint(r36, xy(27,31), 2).
region(r42, '#a4abad', 4, centroid(49,7)).
polygon(r42, [xy(47,7),xy(50,7),xy(47,7)]).
fillpoint(r42, xy(50,7), 1).
fillpoint(r42, xy(49,7), 1).
fillpoint(r42, xy(48,7), 1).
fillpoint(r42, xy(47,7), 1).
region(r52, '#cbd2d3', 153, centroid(78,18)).
polygon(r52, [xy(65,7),xy(65,8),xy(66,7),xy(69,7),xy(69,8),xy(67,10),xy(66,9),xy(68,10),xy(70,8),xy(71,8),xy(72,7),xy(74,7),xy(76,9),xy(77,9),xy(78,10),xy(79,10),xy(84,15),xy(84,16),xy(85,17),xy(85,20),xy(84,21),xy(84,22),xy(83,23),xy(83,24),xy(76,31),xy(74,31),xy(72,29),xy(72,30),xy(73,29),xy(74,29),xy(75,28),xy(75,27),xy(76,27),xy(79,24),xy(79,23),xy(81,21),xy(81,18),xy(80,17),xy(80,15),xy(79,14),xy(76,14),xy(75,13),xy(75,11),xy(73,9),xy(72,9),xy(65,7)]).
midline(r52, [xy(66,8),xy(67,8),xy(67,9),xy(68,8)]).
midline(r52, [xy(72,8),xy(74,8),xy(74,9),xy(75,9),xy(75,10),xy(77,11),xy(77,12),xy(79,12),xy(82,15),xy(82,17),xy(83,17),xy(83,20),xy(82,22),xy(81,23),xy(81,24),xy(76,29),xy(74,30)]).
fillpoint(r52, xy(83,20), 3).
fillpoint(r52, xy(83,19), 3).
fillpoint(r52, xy(83,18), 3).
fillpoint(r52, xy(83,17), 3).
fillpoint(r52, xy(82,22), 3).
region(r59, '#3a3d3c', 194, centroid(58,20)).
polygon(r59, [xy(41,13),xy(41,20),xy(42,21),xy(42,23),xy(43,22),xy(43,18),xy(44,17),xy(44,16),xy(43,15),xy(44,14),xy(42,12),xy(42,10),xy(43,9),xy(44,9),xy(45,8),xy(46,8),xy(46,9),xy(43,12),xy(41,13)]).
hole(r59, [xy(67,30),xy(67,31),xy(67,30)]).
midline(r59, [xy(42,13),xy(42,20)]).
midline(r59, [xy(43,10),xy(43,11),xy(45,9)]).
midline(r59, [xy(43,14),xy(43,17)]).
midline(r59, [xy(57,10),xy(59,11),xy(61,11)]).
midline(r59, [xy(61,20)]).
midline(r59, [xy(64,22),xy(64,23),xy(65,23),xy(65,24),xy(66,25),xy(69,31),xy(68,32),xy(69,32),xy(69,34),xy(70,33),xy(70,37),xy(71,36)]).
midline(r59, [xy(65,30)]).
midline(r59, [xy(70,39)]).
fillpoint(r59, xy(61,11), 4).
fillpoint(r59, xy(62,11), 3).
fillpoint(r59, xy(61,12), 3).
fillpoint(r59, xy(61,10), 3).
fillpoint(r59, xy(60,11), 3).
region(r73, '#d0d6d7', 144, centroid(73,18)).
polygon(r73, [xy(65,13),xy(66,13),xy(66,15),xy(65,16),xy(65,17),xy(66,17),xy(67,16),xy(67,17),xy(68,15),xy(73,15),xy(74,14),xy(74,11),xy(73,10),xy(72,10),xy(71,9),xy(69,9),xy(69,10),xy(68,11),xy(67,11),xy(66,10),xy(66,11),xy(67,12),xy(65,13)]).
hole(r73, [xy(75,21),xy(76,21),xy(76,22),xy(77,21),xy(77,22),xy(78,21),xy(78,22),xy(75,21)]).
midline(r73, [xy(66,16),xy(67,15),xy(68,13),xy(70,12),xy(71,12)]).
midline(r73, [xy(73,21),xy(77,17),xy(77,18),xy(78,18),xy(79,20)]).
midline(r73, [xy(73,25),xy(74,24)]).
midline(r73, [xy(74,15),xy(75,16)]).
midline(r73, [xy(77,24)]).
fillpoint(r73, xy(74,24), 4).
fillpoint(r73, xy(73,25), 4).
fillpoint(r73, xy(71,12), 4).
fillpoint(r73, xy(70,12), 4).
fillpoint(r73, xy(78,18), 3).
region(r75, '#d0d6d7', 122, centroid(27,17)).
polygon(r75, [xy(17,22),xy(17,23),xy(18,24),xy(18,25),xy(21,28),xy(23,28),xy(24,27),xy(23,26),xy(22,26),xy(19,23),xy(19,22),xy(18,21),xy(18,19),xy(19,19),xy(20,18),xy(20,17),xy(21,16),xy(21,13),xy(23,11),xy(26,11),xy(26,12),xy(25,13),xy(24,13),xy(22,15),xy(22,16),xy(21,17),xy(21,19),xy(20,20),xy(20,21),xy(17,22)]).
midline(r75, [xy(18,22),xy(18,23),xy(19,24),xy(19,25),xy(20,25),xy(20,26),xy(21,26),xy(21,27),xy(23,27)]).
midline(r75, [xy(19,20),xy(19,21),xy(20,19)]).
midline(r75, [xy(22,13),xy(22,14),xy(23,13),xy(23,12),xy(25,12),xy(27,11),xy(28,11)]).
midline(r75, [xy(34,13),xy(35,14),xy(36,13),xy(36,15)]).
midline(r75, [xy(38,12)]).
fillpoint(r75, xy(36,15), 3).
fillpoint(r75, xy(36,14), 3).
fillpoint(r75, xy(36,13), 3).
fillpoint(r75, xy(35,14), 3).
fillpoint(r75, xy(34,13), 3).
region(r78, '#23231e', 431, centroid(53,26)).
polygon(r78, [xy(43,23),xy(43,24),xy(44,25),xy(44,26),xy(45,26),xy(46,27),xy(45,28),xy(45,29),xy(46,29),xy(47,30),xy(46,31),xy(47,31),xy(48,32),xy(48,33),xy(47,34),xy(47,38),xy(46,39),xy(46,40),xy(57,40),xy(58,39),xy(58,37),xy(59,36),xy(59,31),xy(61,29),xy(61,28),xy(62,27),xy(63,27),xy(64,28),xy(64,29),xy(65,27),xy(65,26),xy(61,22),xy(60,22),xy(59,23),xy(58,22),xy(58,21),xy(57,20),xy(57,19),xy(55,17),xy(54,17),xy(53,16),xy(55,14),xy(55,16),xy(43,23)]).
hole(r78, [xy(47,14),xy(47,16),xy(48,17),xy(49,17),xy(50,16),xy(48,14),xy(49,14),xy(47,14)]).
midline(r78, [xy(46,12),xy(48,11),xy(48,12),xy(51,12),xy(51,13),xy(52,13),xy(52,15),xy(53,14),xy(53,13),xy(54,13)]).
midline(r78, [xy(46,18),xy(47,20)]).
midline(r78, [xy(47,39)]).
midline(r78, [xy(48,23),xy(48,24),xy(49,24),xy(49,25),xy(51,25),xy(51,26),xy(52,25),xy(52,24),xy(53,23),xy(53,24),xy(54,24),xy(54,25),xy(55,25),xy(55,26),xy(56,26),xy(56,27)]).
midline(r78, [xy(50,28)]).
midline(r78, [xy(51,34),xy(51,36),xy(52,35),xy(52,36),xy(53,36),xy(54,35),xy(54,36),xy(55,35),xy(55,36)]).
midline(r78, [xy(52,18),xy(53,18)]).
midline(r78, [xy(56,32)]).
midline(r78, [xy(60,25),xy(60,26),xy(61,25)]).
midline(r78, [xy(64,26),xy(64,27)]).
fillpoint(r78, xy(56,27), 7).
fillpoint(r78, xy(56,26), 7).
fillpoint(r78, xy(55,26), 7).
fillpoint(r78, xy(55,25), 7).
fillpoint(r78, xy(54,25), 7).
region(r91, '#d6dcda', 150, centroid(27,19)).
polygon(r91, [xy(20,22),xy(20,23),xy(22,25),xy(23,25),xy(24,26),xy(26,26),xy(27,25),xy(29,25),xy(29,27),xy(20,22)]).
midline(r91, [xy(24,22),xy(26,22),xy(26,20),xy(27,19),xy(27,18),xy(28,18),xy(30,17)]).
midline(r91, [xy(33,18),xy(34,19)]).
fillpoint(r91, xy(28,18), 6).
fillpoint(r91, xy(27,19), 6).
fillpoint(r91, xy(27,18), 6).
fillpoint(r91, xy(26,20), 6).
fillpoint(r91, xy(30,17), 5).
region(r92, '#d6dcda', 4, centroid(39,15)).
polygon(r92, [xy(39,13),xy(39,16),xy(39,13)]).
fillpoint(r92, xy(39,16), 1).
fillpoint(r92, xy(39,15), 1).
fillpoint(r92, xy(39,14), 1).
fillpoint(r92, xy(39,13), 1).
region(r100, '#767e7f', 6, centroid(40,17)).
polygon(r100, [xy(40,14),xy(40,19),xy(40,14)]).
fillpoint(r100, xy(40,19), 1).
fillpoint(r100, xy(40,18), 1).
fillpoint(r100, xy(40,17), 1).
fillpoint(r100, xy(40,16), 1).
fillpoint(r100, xy(40,15), 1).
region(r108, '#767e7f', 4, centroid(60,16)).
polygon(r108, [xy(60,14),xy(60,17),xy(60,14)]).
fillpoint(r108, xy(60,17), 1).
fillpoint(r108, xy(60,16), 1).
fillpoint(r108, xy(60,15), 1).
fillpoint(r108, xy(60,14), 1).
region(r111, '#cbd2d3', 5, centroid(64,15)).
polygon(r111, [xy(64,15),xy(64,17),xy(65,15),xy(65,14),xy(64,15)]).
fillpoint(r111, xy(65,15), 1).
fillpoint(r111, xy(65,14), 1).
fillpoint(r111, xy(64,17), 1).
fillpoint(r111, xy(64,16), 1).
fillpoint(r111, xy(64,15), 1).
region(r118, '#cbd2d3', 5, centroid(58,16)).
polygon(r118, [xy(57,16),xy(58,15),xy(58,18),xy(57,16)]).
fillpoint(r118, xy(58,18), 1).
fillpoint(r118, xy(58,17), 1).
fillpoint(r118, xy(58,16), 1).
fillpoint(r118, xy(58,15), 1).
fillpoint(r118, xy(57,16), 1).
region(r130, '#d6dcda', 64, centroid(69,20)).
polygon(r130, [xy(63,18),xy(63,19),xy(64,19),xy(65,18),xy(67,18),xy(68,17),xy(68,16),xy(73,16),xy(74,17),xy(74,18),xy(71,21),xy(72,22),xy(69,25),xy(68,24),xy(68,23),xy(65,20),xy(63,18)]).
midline(r130, [xy(65,19)]).
midline(r130, [xy(68,20),xy(69,19),xy(69,20),xy(70,19),xy(72,18)]).
midline(r130, [xy(69,22),xy(70,22),xy(69,24)]).
fillpoint(r130, xy(70,19), 4).
fillpoint(r130, xy(69,20), 4).
fillpoint(r130, xy(69,19), 4).
fillpoint(r130, xy(68,20), 4).
fillpoint(r130, xy(72,18), 3).
region(r132, '#a4abad', 7, centroid(3,19)).
polygon(r132, [xy(3,17),xy(3,20),xy(4,19),xy(4,20),xy(3,17)]).
fillpoint(r132, xy(4,20), 1).
fillpoint(r132, xy(4,19), 1).
fillpoint(r132, xy(4,18), 1).
fillpoint(r132, xy(3,20), 1).
fillpoint(r132, xy(3,19), 1).
region(r143, '#b7bebf', 8, centroid(38,20)).
polygon(r143, [xy(36,21),xy(37,20),xy(37,21),xy(38,20),xy(38,18),xy(36,21)]).
fillpoint(r143, xy(39,21), 1).
fillpoint(r143, xy(38,21), 1).
fillpoint(r143, xy(38,20), 1).
fillpoint(r143, xy(38,19), 1).
fillpoint(r143, xy(38,18), 1).
region(r156, '#767e7f', 22, centroid(2,23)).
polygon(r156, [xy(0,21),xy(0,25),xy(1,25),xy(2,24),xy(3,24),xy(4,23),xy(4,22),xy(2,20),xy(1,21),xy(0,21)]).
midline(r156, [xy(1,24),xy(2,22)]).
fillpoint(r156, xy(2,22), 3).
fillpoint(r156, xy(3,23), 2).
fillpoint(r156, xy(3,22), 2).
fillpoint(r156, xy(2,23), 2).
fillpoint(r156, xy(2,21), 2).
region(r170, '#cbd2d3', 7, centroid(77,21)).
polygon(r170, [xy(75,21),xy(76,21),xy(76,22),xy(77,21),xy(77,22),xy(78,21),xy(78,22),xy(75,21)]).
fillpoint(r170, xy(78,22), 1).
fillpoint(r170, xy(78,21), 1).
fillpoint(r170, xy(77,22), 1).
fillpoint(r170, xy(77,21), 1).
fillpoint(r170, xy(76,22), 1).
region(r175, '#b0b7b9', 41, centroid(38,26)).
polygon(r175, [xy(34,23),xy(34,24),xy(35,23),xy(35,22),xy(36,22),xy(36,27),xy(35,28),xy(35,30),xy(36,28),xy(37,28),xy(37,29),xy(38,27),xy(38,26),xy(37,25),xy(37,22),xy(34,23)]).
midline(r175, [xy(37,26),xy(37,27),xy(39,26),xy(40,26),xy(40,27),xy(41,29)]).
fillpoint(r175, xy(41,29), 2).
fillpoint(r175, xy(40,27), 2).
fillpoint(r175, xy(40,26), 2).
fillpoint(r175, xy(39,26), 2).
fillpoint(r175, xy(37,27), 2).
region(r176, '#a4abad', 8, centroid(38,23)).
polygon(r176, [xy(37,23),xy(38,22),xy(39,22),xy(39,23),xy(38,24),xy(38,25),xy(39,24),xy(37,23)]).
midline(r176, [xy(38,23)]).
fillpoint(r176, xy(38,23), 2).
fillpoint(r176, xy(39,24), 1).
fillpoint(r176, xy(39,23), 1).
fillpoint(r176, xy(39,22), 1).
fillpoint(r176, xy(38,25), 1).
region(r181, '#c3cbcb', 58, centroid(12,28)).
polygon(r181, [xy(5,25),xy(6,24),xy(6,23),xy(9,23),xy(9,24),xy(7,26),xy(6,26),xy(6,27),xy(7,27),xy(7,29),xy(8,28),xy(8,30),xy(9,30),xy(9,31),xy(10,31),xy(10,32),xy(11,31),xy(11,32),xy(12,31),xy(12,32),xy(13,31),xy(13,30),xy(14,31),xy(14,32),xy(15,31),xy(15,32),xy(17,30),xy(18,31),xy(19,31),xy(19,33),xy(18,34),xy(17,33),xy(16,33),xy(18,35),xy(5,25)]).
midline(r181, [xy(6,25),xy(7,24),xy(7,25),xy(8,24)]).
midline(r181, [xy(16,32),xy(17,31),xy(17,32),xy(18,32),xy(18,33)]).
fillpoint(r181, xy(18,33), 2).
fillpoint(r181, xy(18,32), 2).
fillpoint(r181, xy(17,32), 2).
fillpoint(r181, xy(17,31), 2).
fillpoint(r181, xy(16,32), 2).
region(r183, '#b7bebf', 6, centroid(32,25)).
polygon(r183, [xy(31,25),xy(31,26),xy(32,25),xy(32,24),xy(33,23),xy(33,24),xy(31,25)]).
fillpoint(r183, xy(33,24), 1).
fillpoint(r183, xy(33,23), 1).
fillpoint(r183, xy(32,25), 1).
fillpoint(r183, xy(32,24), 1).
fillpoint(r183, xy(31,26), 1).
region(r192, '#b7bebf', 56, centroid(88,31)).
polygon(r192, [xy(77,37),xy(78,37),xy(79,36),xy(79,37),xy(80,36),xy(80,37),xy(81,37),xy(82,36),xy(81,35),xy(82,35),xy(85,32),xy(86,32),xy(86,33),xy(83,36),xy(85,35),xy(88,32),xy(87,31),xy(89,29),xy(90,29),xy(91,28),xy(91,27),xy(92,26),xy(92,25),xy(94,25),xy(95,24),xy(95,27),xy(94,28),xy(93,28),xy(90,31),xy(89,31),xy(77,37)]).
midline(r192, [xy(81,36),xy(83,35),xy(85,33),xy(87,32),xy(89,30),xy(90,30),xy(92,28),xy(92,27),xy(93,26),xy(93,27),xy(94,26),xy(94,27)]).
fillpoint(r192, xy(94,27), 2).
fillpoint(r192, xy(94,26), 2).
fillpoint(r192, xy(93,27), 2).
fillpoint(r192, xy(93,26), 2).
fillpoint(r192, xy(92,28), 2).
region(r195, '#c7cdce', 58, centroid(16,29)).
polygon(r195, [xy(8,26),xy(8,27),xy(9,28),xy(9,29),xy(10,30),xy(12,30),xy(13,29),xy(13,28),xy(10,25),xy(13,25),xy(8,26)]).
midline(r195, [xy(10,27),xy(11,28)]).
midline(r195, [xy(14,29)]).
midline(r195, [xy(21,32),xy(21,33),xy(22,32),xy(22,33),xy(23,32)]).
fillpoint(r195, xy(11,28), 3).
fillpoint(r195, xy(10,27), 3).
fillpoint(r195, xy(23,32), 2).
fillpoint(r195, xy(22,33), 2).
fillpoint(r195, xy(22,32), 2).
region(r204, '#a4abad', 32, centroid(2,32)).
polygon(r204, [xy(0,26),xy(0,34),xy(1,34),xy(2,35),xy(3,34),xy(3,33),xy(2,32),xy(2,30),xy(1,29),xy(1,26),xy(0,26)]).
midline(r204, [xy(1,30),xy(1,33),xy(2,33),xy(2,34)]).
fillpoint(r204, xy(2,34), 2).
fillpoint(r204, xy(2,33), 2).
fillpoint(r204, xy(1,33), 2).
fillpoint(r204, xy(1,32), 2).
fillpoint(r204, xy(1,31), 2).
region(r205, '#b7bebf', 29, centroid(5,31)).
polygon(r205, [xy(2,26),xy(2,28),xy(3,27),xy(4,27),xy(4,28),xy(3,29),xy(3,31),xy(4,30),xy(4,29),xy(5,31),xy(4,32),xy(4,33),xy(5,32),xy(6,33),xy(5,34),xy(5,35),xy(6,35),xy(7,34),xy(7,35),xy(8,34),xy(8,35),xy(9,35),xy(9,36),xy(2,26)]).
midline(r205, [xy(3,28)]).
midline(r205, [xy(4,31),xy(5,33),xy(6,34)]).
fillpoint(r205, xy(6,34), 2).
fillpoint(r205, xy(5,33), 2).
fillpoint(r205, xy(4,31), 2).
fillpoint(r205, xy(3,28), 2).
fillpoint(r205, xy(9,36), 1).
region(r206, '#bfc6c7', 60, centroid(11,33)).
polygon(r206, [xy(3,26),xy(5,26),xy(5,30),xy(6,29),xy(6,28),xy(7,30),xy(6,31),xy(6,32),xy(7,33),xy(8,33),xy(9,32),xy(10,33),xy(9,34),xy(10,35),xy(10,36),xy(12,36),xy(13,37),xy(15,37),xy(16,38),xy(17,37),xy(17,35),xy(15,33),xy(14,33),xy(13,32),xy(12,33),xy(11,33),xy(3,26)]).
midline(r206, [xy(6,30),xy(7,31),xy(7,32),xy(8,32),xy(10,34),xy(11,34),xy(11,35),xy(13,34),xy(13,35),xy(15,35),xy(16,37)]).
fillpoint(r206, xy(15,35), 3).
fillpoint(r206, xy(14,35), 3).
fillpoint(r206, xy(13,35), 3).
fillpoint(r206, xy(13,34), 3).
fillpoint(r206, xy(16,37), 2).
region(r208, '#b0b7b9', 13, centroid(31,29)).
polygon(r208, [xy(30,30),xy(30,31),xy(31,31),xy(32,30),xy(31,29),xy(31,27),xy(32,26),xy(32,27),xy(33,27),xy(32,29),xy(32,31),xy(30,30)]).
midline(r208, [xy(31,30)]).
fillpoint(r208, xy(31,30), 2).
fillpoint(r208, xy(33,27), 1).
fillpoint(r208, xy(32,31), 1).
fillpoint(r208, xy(32,30), 1).
fillpoint(r208, xy(32,29), 1).
region(r224, '#a4abad', 12, centroid(39,30)).
polygon(r224, [xy(38,28),xy(38,30),xy(39,29),xy(39,28),xy(40,30),xy(39,31),xy(40,32),xy(41,31),xy(42,31),xy(38,28)]).
midline(r224, [xy(39,30),xy(40,31)]).
fillpoint(r224, xy(40,31), 2).
fillpoint(r224, xy(39,30), 2).
fillpoint(r224, xy(42,31), 1).
fillpoint(r224, xy(41,31), 1).
fillpoint(r224, xy(40,32), 1).
region(r231, '#b0b7b9', 58, centroid(89,34)).
polygon(r231, [xy(78,38),xy(81,38),xy(82,37),xy(82,38),xy(83,37),xy(83,38),xy(85,38),xy(86,37),xy(85,36),xy(84,36),xy(86,34),xy(86,35),xy(89,32),xy(90,32),xy(93,29),xy(94,29),xy(95,28),xy(95,31),xy(92,34),xy(91,34),xy(89,36),xy(88,36),xy(87,37),xy(78,38)]).
midline(r231, [xy(84,37),xy(85,37),xy(87,35),xy(87,36),xy(89,34)]).
midline(r231, [xy(92,32),xy(93,31)]).
fillpoint(r231, xy(93,31), 3).
fillpoint(r231, xy(92,32), 3).
fillpoint(r231, xy(89,34), 3).
fillpoint(r231, xy(94,31), 2).
fillpoint(r231, xy(94,30), 2).
region(r235, '#a4abad', 127, centroid(30,37)).
polygon(r235, [xy(16,39),xy(17,39),xy(18,38),xy(18,36),xy(19,36),xy(20,35),xy(20,36),xy(21,36),xy(21,37),xy(18,40),xy(21,40),xy(22,39),xy(21,38),xy(22,40),xy(23,39),xy(23,40),xy(28,40),xy(29,39),xy(29,40),xy(30,38),xy(31,38),xy(33,40),xy(40,40),xy(41,39),xy(41,40),xy(38,37),xy(37,37),xy(36,36),xy(34,36),xy(32,34),xy(32,33),xy(31,32),xy(30,32),xy(28,34),xy(28,35),xy(27,36),xy(25,36),xy(25,37),xy(24,38),xy(16,39)]).
hole(r235, [xy(19,37),xy(19,38),xy(20,37),xy(19,37)]).
midline(r235, [xy(18,39),xy(21,39)]).
midline(r235, [xy(24,39),xy(26,38),xy(27,38),xy(28,37),xy(28,38),xy(29,37),xy(29,36),xy(30,35),xy(30,34),xy(31,35),xy(30,36),xy(32,36),xy(32,37),xy(33,37),xy(33,38),xy(38,38),xy(38,39),xy(39,39),xy(40,38),xy(40,39),xy(41,38)]).
fillpoint(r235, xy(36,38), 3).
fillpoint(r235, xy(35,38), 3).
fillpoint(r235, xy(34,38), 3).
fillpoint(r235, xy(33,38), 3).
fillpoint(r235, xy(33,37), 3).
region(r247, '#b7bebf', 4, centroid(63,31)).
polygon(r247, [xy(62,30),xy(62,31),xy(63,30),xy(63,31),xy(62,30)]).
fillpoint(r247, xy(63,31), 1).
fillpoint(r247, xy(63,30), 1).
fillpoint(r247, xy(62,31), 1).
fillpoint(r247, xy(62,30), 1).
region(r252, '#b0b7b9', 39, centroid(38,34)).
polygon(r252, [xy(33,33),xy(33,34),xy(34,33),xy(35,33),xy(36,32),xy(36,31),xy(37,31),xy(38,32),xy(39,32),xy(39,33),xy(41,35),xy(39,37),xy(38,36),xy(37,36),xy(36,35),xy(34,35),xy(33,33)]).
midline(r252, [xy(34,34),xy(35,34),xy(37,33),xy(37,34),xy(38,34),xy(39,35)]).
fillpoint(r252, xy(39,35), 3).
fillpoint(r252, xy(38,34), 3).
fillpoint(r252, xy(37,34), 3).
fillpoint(r252, xy(37,33), 3).
fillpoint(r252, xy(40,35), 2).
region(r258, '#3a3d3c', 6, centroid(60,34)).
polygon(r258, [xy(60,31),xy(60,36),xy(60,31)]).
fillpoint(r258, xy(60,36), 1).
fillpoint(r258, xy(60,35), 1).
fillpoint(r258, xy(60,34), 1).
fillpoint(r258, xy(60,33), 1).
fillpoint(r258, xy(60,32), 1).
region(r269, '#3a3d3c', 4, centroid(47,33)).
polygon(r269, [xy(46,32),xy(46,33),xy(47,32),xy(47,33),xy(46,32)]).
fillpoint(r269, xy(47,33), 1).
fillpoint(r269, xy(47,32), 1).
fillpoint(r269, xy(46,33), 1).
fillpoint(r269, xy(46,32), 1).
region(r280, '#767e7f', 7, centroid(45,34)).
polygon(r280, [xy(43,33),xy(44,33),xy(44,34),xy(46,34),xy(46,36),xy(43,33)]).
fillpoint(r280, xy(46,36), 1).
fillpoint(r280, xy(46,35), 1).
fillpoint(r280, xy(46,34), 1).
fillpoint(r280, xy(45,34), 1).
fillpoint(r280, xy(44,34), 1).
region(r287, '#a4abad', 89, centroid(86,38)).
polygon(r287, [xy(73,36),xy(73,40),xy(77,40),xy(78,39),xy(77,38),xy(76,38),xy(75,37),xy(74,37),xy(73,36)]).
midline(r287, [xy(74,38),xy(74,39),xy(75,38),xy(75,39),xy(77,39)]).
midline(r287, [xy(86,39),xy(87,39),xy(88,38),xy(88,39),xy(90,38),xy(91,37),xy(91,38),xy(92,37),xy(92,38),xy(93,37),xy(93,38)]).
midline(r287, [xy(94,34)]).
fillpoint(r287, xy(93,38), 3).
fillpoint(r287, xy(93,37), 3).
fillpoint(r287, xy(93,36), 3).
fillpoint(r287, xy(92,38), 3).
fillpoint(r287, xy(92,37), 3).
region(r295, '#b0b7b9', 6, centroid(62,35)).
polygon(r295, [xy(61,34),xy(62,34),xy(62,37),xy(63,36),xy(61,34)]).
fillpoint(r295, xy(63,36), 1).
fillpoint(r295, xy(62,37), 1).
fillpoint(r295, xy(62,36), 1).
fillpoint(r295, xy(62,35), 1).
fillpoint(r295, xy(62,34), 1).
region(r302, '#767e7f', 59, centroid(6,38)).
polygon(r302, [xy(0,35),xy(0,40),xy(3,40),xy(4,39),xy(5,40),xy(11,40),xy(12,39),xy(11,38),xy(8,38),xy(7,37),xy(4,37),xy(3,36),xy(2,36),xy(1,35),xy(0,35)]).
midline(r302, [xy(1,36),xy(2,38),xy(5,38),xy(5,39),xy(6,38),xy(6,39),xy(7,38),xy(7,39),xy(11,39)]).
fillpoint(r302, xy(3,38), 3).
fillpoint(r302, xy(2,38), 3).
fillpoint(r302, xy(11,39), 2).
fillpoint(r302, xy(10,39), 2).
fillpoint(r302, xy(9,39), 2).
region(r305, '#c3cbcb', 5, centroid(22,36)).
polygon(r305, [xy(22,35),xy(22,37),xy(23,37),xy(23,35),xy(22,35)]).
fillpoint(r305, xy(23,37), 1).
fillpoint(r305, xy(23,35), 1).
fillpoint(r305, xy(22,37), 1).
fillpoint(r305, xy(22,36), 1).
fillpoint(r305, xy(22,35), 1).
region(r311, '#767e7f', 6, centroid(65,37)).
polygon(r311, [xy(64,35),xy(64,36),xy(65,36),xy(65,37),xy(66,37),xy(66,38),xy(64,35)]).
fillpoint(r311, xy(66,38), 1).
fillpoint(r311, xy(66,37), 1).
fillpoint(r311, xy(65,37), 1).
fillpoint(r311, xy(65,36), 1).
fillpoint(r311, xy(64,36), 1).
region(r314, '#23231e', 8, centroid(68,38)).
polygon(r314, [xy(68,35),xy(68,40),xy(69,40),xy(69,38),xy(68,35)]).
fillpoint(r314, xy(69,40), 1).
fillpoint(r314, xy(69,38), 1).
fillpoint(r314, xy(68,40), 1).
fillpoint(r314, xy(68,39), 1).
fillpoint(r314, xy(68,38), 1).
region(r321, '#767e7f', 11, centroid(43,39)).
polygon(r321, [xy(42,39),xy(42,40),xy(44,40),xy(45,39),xy(44,38),xy(43,38),xy(44,37),xy(44,36),xy(42,39)]).
midline(r321, [xy(43,39),xy(44,39)]).
fillpoint(r321, xy(44,39), 2).
fillpoint(r321, xy(43,39), 2).
fillpoint(r321, xy(45,39), 1).
fillpoint(r321, xy(44,40), 1).
fillpoint(r321, xy(44,38), 1).
region(r332, '#3a3d3c', 6, centroid(60,38)).
polygon(r332, [xy(59,37),xy(59,39),xy(60,38),xy(60,39),xy(61,39),xy(59,37)]).
fillpoint(r332, xy(61,39), 1).
fillpoint(r332, xy(60,39), 1).
fillpoint(r332, xy(60,38), 1).
fillpoint(r332, xy(59,39), 1).
fillpoint(r332, xy(59,38), 1).
region(r335, '#a4abad', 11, centroid(64,39)).
polygon(r335, [xy(63,37),xy(63,38),xy(64,37),xy(65,38),xy(64,39),xy(64,40),xy(65,40),xy(66,39),xy(66,40),xy(63,37)]).
midline(r335, [xy(64,38),xy(65,39)]).
fillpoint(r335, xy(65,39), 2).
fillpoint(r335, xy(64,38), 2).
fillpoint(r335, xy(66,40), 1).
fillpoint(r335, xy(66,39), 1).
fillpoint(r335, xy(65,40), 1).
region(r345, '#767e7f', 5, centroid(31,40)).
polygon(r345, [xy(30,39),xy(30,40),xy(31,39),xy(31,40),xy(32,40),xy(30,39)]).
fillpoint(r345, xy(32,40), 1).
fillpoint(r345, xy(31,40), 1).
fillpoint(r345, xy(31,39), 1).
fillpoint(r345, xy(30,40), 1).
fillpoint(r345, xy(30,39), 1).
adjacent(r1, r13).
shared_edge(r1, r13, 2).
adjacent(r1, r14).
shared_edge(r1, r14, 1).
adjacent(r1, r15).
shared_edge(r1, r15, 2).
adjacent(r1, r18).
shared_edge(r1, r18, 2).
adjacent(r1, r2).
shared_edge(r1, r2, 17).
adjacent(r1, r23).
shared_edge(r1, r23, 2).
adjacent(r1, r33).
shared_edge(r1, r33, 1).
adjacent(r10, r11).
shared_edge(r10, r11, 23).
adjacent(r10, r17).
shared_edge(r10, r17, 3).
adjacent(r10, r22).
shared_edge(r10, r22, 15).
adjacent(r10, r9).
shared_edge(r10, r9, 11).
adjacent(r100, r136).
shared_edge(r100, r136, 1).
adjacent(r100, r144).
shared_edge(r100, r144, 2).
adjacent(r100, r161).
shared_edge(r100, r161, 1).
adjacent(r100, r59).
shared_edge(r100, r59, 6).
adjacent(r100, r92).
shared_edge(r100, r92, 3).
adjacent(r100, r93).
shared_edge(r100, r93, 1).
adjacent(r101, r102).
shared_edge(r101, r102, 1).
adjacent(r101, r115).
shared_edge(r101, r115, 1).
adjacent(r101, r123).
shared_edge(r101, r123, 1).
adjacent(r101, r78).
shared_edge(r101, r78, 3).
adjacent(r102, r103).
shared_edge(r102, r103, 1).
adjacent(r102, r115).
shared_edge(r102, r115, 1).
adjacent(r102, r78).
shared_edge(r102, r78, 1).
adjacent(r103, r116).
shared_edge(r103, r116, 1).
adjacent(r103, r78).
shared_edge(r103, r78, 2).
adjacent(r104, r105).
shared_edge(r104, r105, 1).
adjacent(r104, r117).
shared_edge(r104, r117, 1).
adjacent(r104, r128).
shared_edge(r104, r128, 1).
adjacent(r104, r78).
shared_edge(r104, r78, 3).
adjacent(r105, r106).
shared_edge(r105, r106, 1).
adjacent(r105, r117).
shared_edge(r105, r117, 1).
adjacent(r105, r59).
shared_edge(r105, r59, 1).
adjacent(r106, r107).
shared_edge(r106, r107, 1).
adjacent(r106, r118).
shared_edge(r106, r118, 1).
adjacent(r106, r94).
shared_edge(r106, r94, 1).
adjacent(r107, r108).
shared_edge(r107, r108, 1).
adjacent(r107, r119).
shared_edge(r107, r119, 1).
adjacent(r107, r59).
shared_edge(r107, r59, 1).
adjacent(r108, r119).
shared_edge(r108, r119, 2).
adjacent(r108, r140).
shared_edge(r108, r140, 1).
adjacent(r108, r146).
shared_edge(r108, r146, 1).
adjacent(r108, r59).
shared_edge(r108, r59, 5).
adjacent(r109, r110).
shared_edge(r109, r110, 1).
adjacent(r109, r121).
shared_edge(r109, r121, 1).
adjacent(r109, r59).
shared_edge(r109, r59, 1).
adjacent(r109, r95).
shared_edge(r109, r95, 1).
adjacent(r110, r111).
shared_edge(r110, r111, 2).
adjacent(r110, r96).
shared_edge(r110, r96, 1).
adjacent(r111, r121).
shared_edge(r111, r121, 1).
adjacent(r111, r129).
shared_edge(r111, r129, 1).
adjacent(r111, r141).
shared_edge(r111, r141, 1).
adjacent(r111, r148).
shared_edge(r111, r148, 1).
adjacent(r111, r73).
shared_edge(r111, r73, 6).
adjacent(r112, r122).
shared_edge(r112, r122, 1).
adjacent(r112, r133).
shared_edge(r112, r133, 1).
adjacent(r112, r14).
shared_edge(r112, r14, 1).
adjacent(r112, r4).
shared_edge(r112, r4, 2).
adjacent(r112, r98).
shared_edge(r112, r98, 1).
adjacent(r113, r114).
shared_edge(r113, r114, 1).
adjacent(r113, r59).
shared_edge(r113, r59, 3).
adjacent(r114, r78).
shared_edge(r114, r78, 3).
adjacent(r115, r116).
shared_edge(r115, r116, 1).
adjacent(r115, r124).
shared_edge(r115, r124, 1).
adjacent(r116, r125).
shared_edge(r116, r125, 1).
adjacent(r116, r78).
shared_edge(r116, r78, 1).
adjacent(r117, r118).
shared_edge(r117, r118, 2).
adjacent(r118, r119).
shared_edge(r118, r119, 2).
adjacent(r118, r128).
shared_edge(r118, r128, 1).
adjacent(r118, r139).
shared_edge(r118, r139, 2).
adjacent(r118, r140).
shared_edge(r118, r140, 2).
adjacent(r118, r145).
shared_edge(r118, r145, 1).
adjacent(r118, r152).
shared_edge(r118, r152, 1).
adjacent(r119, r140).
shared_edge(r119, r140, 1).
adjacent(r12, r16).
shared_edge(r12, r16, 18).
adjacent(r12, r19).
shared_edge(r12, r19, 3).
adjacent(r12, r20).
shared_edge(r12, r20, 4).
adjacent(r12, r21).
shared_edge(r12, r21, 3).
adjacent(r12, r24).
shared_edge(r12, r24, 1).
adjacent(r12, r26).
shared_edge(r12, r26, 1).
adjacent(r12, r27).
shared_edge(r12, r27, 2).
adjacent(r12, r37).
shared_edge(r12, r37, 4).
adjacent(r12, r43).
shared_edge(r12, r43, 1).
adjacent(r12, r5).
shared_edge(r12, r5, 1).
adjacent(r12, r6).
shared_edge(r12, r6, 28).
adjacent(r12, r69).
shared_edge(r12, r69, 2).
adjacent(r12, r75).
shared_edge(r12, r75, 9).
adjacent(r12, r76).
shared_edge(r12, r76, 1).
adjacent(r120, r121).
shared_edge(r120, r121, 1).
adjacent(r120, r129).
shared_edge(r120, r129, 1).
adjacent(r120, r141).
shared_edge(r120, r141, 1).
adjacent(r120, r147).
shared_edge(r120, r147, 1).
adjacent(r120, r59).
shared_edge(r120, r59, 4).
adjacent(r121, r129).
shared_edge(r121, r129, 1).
adjacent(r122, r132).
shared_edge(r122, r132, 1).
adjacent(r122, r14).
shared_edge(r122, r14, 2).
adjacent(r123, r124).
shared_edge(r123, r124, 1).
adjacent(r123, r78).
shared_edge(r123, r78, 2).
adjacent(r124, r125).
shared_edge(r124, r125, 1).
adjacent(r124, r137).
shared_edge(r124, r137, 1).
adjacent(r125, r126).
shared_edge(r125, r126, 1).
adjacent(r125, r138).
shared_edge(r125, r138, 1).
adjacent(r126, r138).
shared_edge(r126, r138, 1).
adjacent(r126, r78).
shared_edge(r126, r78, 4).
adjacent(r127, r78).
shared_edge(r127, r78, 4).
adjacent(r128, r139).
shared_edge(r128, r139, 1).
adjacent(r128, r78).
shared_edge(r128, r78, 3).
adjacent(r129, r141).
shared_edge(r129, r141, 1).
adjacent(r13, r14).
shared_edge(r13, r14, 1).
adjacent(r130, r141).
shared_edge(r130, r141, 1).
adjacent(r130, r147).
shared_edge(r130, r147, 2).
adjacent(r130, r148).
shared_edge(r130, r148, 3).
adjacent(r130, r162).
shared_edge(r130, r162, 1).
adjacent(r130, r163).
shared_edge(r130, r163, 2).
adjacent(r130, r169).
shared_edge(r130, r169, 2).
adjacent(r130, r179).
shared_edge(r130, r179, 2).
adjacent(r130, r184).
shared_edge(r130, r184, 2).
adjacent(r130, r191).
shared_edge(r130, r191, 1).
adjacent(r130, r203).
shared_edge(r130, r203, 2).
adjacent(r130, r213).
shared_edge(r130, r213, 1).
adjacent(r130, r218).
shared_edge(r130, r218, 1).
adjacent(r130, r73).
shared_edge(r130, r73, 30).
adjacent(r131, r132).
shared_edge(r131, r132, 1).
adjacent(r131, r14).
shared_edge(r131, r14, 3).
adjacent(r132, r133).
shared_edge(r132, r133, 2).
adjacent(r132, r14).
shared_edge(r132, r14, 2).
adjacent(r132, r156).
shared_edge(r132, r156, 3).
adjacent(r132, r157).
shared_edge(r132, r157, 1).
adjacent(r132, r4).
shared_edge(r132, r4, 2).
adjacent(r133, r4).
shared_edge(r133, r4, 1).
adjacent(r134, r135).
shared_edge(r134, r135, 1).
adjacent(r134, r142).
shared_edge(r134, r142, 1).
adjacent(r134, r75).
shared_edge(r134, r75, 2).
adjacent(r135, r136).
shared_edge(r135, r136, 1).
adjacent(r135, r143).
shared_edge(r135, r143, 1).
adjacent(r135, r75).
shared_edge(r135, r75, 1).
adjacent(r136, r144).
shared_edge(r136, r144, 1).
adjacent(r136, r92).
shared_edge(r136, r92, 1).
adjacent(r137, r138).
shared_edge(r137, r138, 1).
adjacent(r137, r78).
shared_edge(r137, r78, 2).
adjacent(r138, r78).
shared_edge(r138, r78, 1).
adjacent(r139, r145).
shared_edge(r139, r145, 1).
adjacent(r14, r149).
shared_edge(r14, r149, 3).
adjacent(r14, r15).
shared_edge(r14, r15, 2).
adjacent(r14, r156).
shared_edge(r14, r156, 1).
adjacent(r14, r18).
shared_edge(r14, r18, 2).
adjacent(r14, r23).
shared_edge(r14, r23, 2).
adjacent(r14, r32).
shared_edge(r14, r32, 4).
adjacent(r14, r33).
shared_edge(r14, r33, 2).
adjacent(r14, r53).
shared_edge(r14, r53, 2).
adjacent(r14, r68).
shared_edge(r14, r68, 2).
adjacent(r14, r80).
shared_edge(r14, r80, 1).
adjacent(r14, r84).
shared_edge(r14, r84, 2).
adjacent(r14, r88).
shared_edge(r14, r88, 2).
adjacent(r14, r97).
shared_edge(r14, r97, 3).
adjacent(r140, r146).
shared_edge(r140, r146, 1).
adjacent(r140, r153).
shared_edge(r140, r153, 1).
adjacent(r142, r143).
shared_edge(r142, r143, 1).
adjacent(r142, r150).
shared_edge(r142, r150, 1).
adjacent(r142, r91).
shared_edge(r142, r91, 1).
adjacent(r143, r144).
shared_edge(r143, r144, 2).
adjacent(r143, r150).
shared_edge(r143, r150, 2).
adjacent(r143, r159).
shared_edge(r143, r159, 2).
adjacent(r143, r160).
shared_edge(r143, r160, 2).
adjacent(r143, r166).
shared_edge(r143, r166, 1).
adjacent(r143, r167).
shared_edge(r143, r167, 1).
adjacent(r143, r175).
shared_edge(r143, r175, 2).
adjacent(r143, r176).
shared_edge(r143, r176, 2).
adjacent(r144, r160).
shared_edge(r144, r160, 1).
adjacent(r145, r78).
shared_edge(r145, r78, 2).
adjacent(r146, r154).
shared_edge(r146, r154, 1).
adjacent(r146, r59).
shared_edge(r146, r59, 1).
adjacent(r147, r59).
shared_edge(r147, r59, 3).
adjacent(r149, r155).
shared_edge(r149, r155, 2).
adjacent(r150, r91).
shared_edge(r150, r91, 1).
adjacent(r151, r78).
shared_edge(r151, r78, 4).
adjacent(r152, r153).
shared_edge(r152, r153, 1).
adjacent(r152, r59).
shared_edge(r152, r59, 1).
adjacent(r152, r78).
shared_edge(r152, r78, 1).
adjacent(r153, r154).
shared_edge(r153, r154, 1).
adjacent(r153, r59).
shared_edge(r153, r59, 1).
adjacent(r154, r59).
shared_edge(r154, r59, 2).
adjacent(r155, r156).
shared_edge(r155, r156, 3).
adjacent(r156, r157).
shared_edge(r156, r157, 2).
adjacent(r156, r180).
shared_edge(r156, r180, 1).
adjacent(r156, r185).
shared_edge(r156, r185, 2).
adjacent(r156, r193).
shared_edge(r156, r193, 3).
adjacent(r156, r204).
shared_edge(r156, r204, 2).
adjacent(r157, r180).
shared_edge(r157, r180, 1).
adjacent(r157, r24).
shared_edge(r157, r24, 3).
adjacent(r157, r4).
shared_edge(r157, r4, 1).
adjacent(r158, r165).
shared_edge(r158, r165, 1).
adjacent(r158, r91).
shared_edge(r158, r91, 3).
adjacent(r159, r91).
shared_edge(r159, r91, 2).
adjacent(r16, r25).
shared_edge(r16, r25, 2).
adjacent(r16, r38).
shared_edge(r16, r38, 5).
adjacent(r16, r39).
shared_edge(r16, r39, 2).
adjacent(r16, r40).
shared_edge(r16, r40, 1).
adjacent(r16, r58).
shared_edge(r16, r58, 1).
adjacent(r16, r70).
shared_edge(r16, r70, 1).
adjacent(r16, r76).
shared_edge(r16, r76, 1).
adjacent(r16, r77).
shared_edge(r16, r77, 1).
adjacent(r160, r161).
shared_edge(r160, r161, 1).
adjacent(r161, r167).
shared_edge(r161, r167, 1).
adjacent(r161, r59).
shared_edge(r161, r59, 1).
adjacent(r162, r163).
shared_edge(r162, r163, 1).
adjacent(r162, r59).
shared_edge(r162, r59, 2).
adjacent(r163, r59).
shared_edge(r163, r59, 1).
adjacent(r164, r165).
shared_edge(r164, r165, 1).
adjacent(r164, r171).
shared_edge(r164, r171, 1).
adjacent(r164, r91).
shared_edge(r164, r91, 2).
adjacent(r165, r172).
shared_edge(r165, r172, 1).
adjacent(r165, r91).
shared_edge(r165, r91, 1).
adjacent(r166, r175).
shared_edge(r166, r175, 1).
adjacent(r166, r91).
shared_edge(r166, r91, 2).
adjacent(r167, r168).
shared_edge(r167, r168, 1).
adjacent(r167, r177).
shared_edge(r167, r177, 1).
adjacent(r168, r178).
shared_edge(r168, r178, 1).
adjacent(r168, r59).
shared_edge(r168, r59, 2).
adjacent(r169, r59).
shared_edge(r169, r59, 2).
adjacent(r17, r8).
shared_edge(r17, r8, 3).
adjacent(r170, r73).
shared_edge(r170, r73, 12).
adjacent(r171, r172).
shared_edge(r171, r172, 1).
adjacent(r171, r182).
shared_edge(r171, r182, 1).
adjacent(r171, r187).
shared_edge(r171, r187, 1).
adjacent(r171, r91).
shared_edge(r171, r91, 2).
adjacent(r172, r173).
shared_edge(r172, r173, 1).
adjacent(r172, r182).
shared_edge(r172, r182, 1).
adjacent(r173, r174).
shared_edge(r173, r174, 1).
adjacent(r173, r183).
shared_edge(r173, r183, 1).
adjacent(r173, r91).
shared_edge(r173, r91, 1).
adjacent(r174, r175).
shared_edge(r174, r175, 2).
adjacent(r174, r91).
shared_edge(r174, r91, 1).
adjacent(r175, r176).
shared_edge(r175, r176, 11).
adjacent(r175, r177).
shared_edge(r175, r177, 1).
adjacent(r175, r178).
shared_edge(r175, r178, 1).
adjacent(r175, r183).
shared_edge(r175, r183, 2).
adjacent(r175, r188).
shared_edge(r175, r188, 3).
adjacent(r175, r189).
shared_edge(r175, r189, 2).
adjacent(r175, r198).
shared_edge(r175, r198, 1).
adjacent(r175, r199).
shared_edge(r175, r199, 1).
adjacent(r175, r200).
shared_edge(r175, r200, 2).
adjacent(r175, r210).
shared_edge(r175, r210, 1).
adjacent(r175, r211).
shared_edge(r175, r211, 2).
adjacent(r175, r216).
shared_edge(r175, r216, 2).
adjacent(r175, r223).
shared_edge(r175, r223, 1).
adjacent(r175, r224).
shared_edge(r175, r224, 10).
adjacent(r175, r225).
shared_edge(r175, r225, 2).
adjacent(r175, r235).
shared_edge(r175, r235, 2).
adjacent(r175, r236).
shared_edge(r175, r236, 5).
adjacent(r175, r237).
shared_edge(r175, r237, 1).
adjacent(r175, r243).
shared_edge(r175, r243, 1).
adjacent(r175, r251).
shared_edge(r175, r251, 1).
adjacent(r175, r59).
shared_edge(r175, r59, 1).
adjacent(r176, r177).
shared_edge(r176, r177, 1).
adjacent(r177, r178).
shared_edge(r177, r178, 1).
adjacent(r178, r59).
shared_edge(r178, r59, 1).
adjacent(r179, r59).
shared_edge(r179, r59, 2).
adjacent(r180, r181).
shared_edge(r180, r181, 1).
adjacent(r180, r186).
shared_edge(r180, r186, 1).
adjacent(r181, r186).
shared_edge(r181, r186, 2).
adjacent(r181, r194).
shared_edge(r181, r194, 1).
adjacent(r181, r195).
shared_edge(r181, r195, 31).
adjacent(r181, r206).
shared_edge(r181, r206, 25).
adjacent(r181, r235).
shared_edge(r181, r235, 1).
adjacent(r181, r24).
shared_edge(r181, r24, 10).
adjacent(r181, r289).
shared_edge(r181, r289, 2).
adjacent(r181, r303).
shared_edge(r181, r303, 1).
adjacent(r182, r183).
shared_edge(r182, r183, 2).
adjacent(r183, r187).
shared_edge(r183, r187, 2).
adjacent(r183, r196).
shared_edge(r183, r196, 1).
adjacent(r183, r197).
shared_edge(r183, r197, 2).
adjacent(r183, r207).
shared_edge(r183, r207, 1).
adjacent(r183, r208).
shared_edge(r183, r208, 3).
adjacent(r184, r191).
shared_edge(r184, r191, 1).
adjacent(r184, r59).
shared_edge(r184, r59, 1).
adjacent(r185, r186).
shared_edge(r185, r186, 1).
adjacent(r185, r194).
shared_edge(r185, r194, 1).
adjacent(r187, r91).
shared_edge(r187, r91, 1).
adjacent(r188, r199).
shared_edge(r188, r199, 1).
adjacent(r189, r190).
shared_edge(r189, r190, 1).
adjacent(r189, r200).
shared_edge(r189, r200, 1).
adjacent(r19, r5).
shared_edge(r19, r5, 3).
adjacent(r190, r201).
shared_edge(r190, r201, 1).
adjacent(r190, r59).
shared_edge(r190, r59, 1).
adjacent(r190, r78).
shared_edge(r190, r78, 1).
adjacent(r191, r59).
shared_edge(r191, r59, 2).
adjacent(r192, r231).
shared_edge(r192, r231, 28).
adjacent(r192, r287).
shared_edge(r192, r287, 1).
adjacent(r192, r336).
shared_edge(r192, r336, 1).
adjacent(r192, r8).
shared_edge(r192, r8, 32).
adjacent(r193, r194).
shared_edge(r193, r194, 1).
adjacent(r193, r205).
shared_edge(r193, r205, 1).
adjacent(r193, r206).
shared_edge(r193, r206, 1).
adjacent(r194, r206).
shared_edge(r194, r206, 1).
adjacent(r195, r275).
shared_edge(r195, r275, 3).
adjacent(r195, r276).
shared_edge(r195, r276, 2).
adjacent(r195, r290).
shared_edge(r195, r290, 2).
adjacent(r195, r304).
shared_edge(r195, r304, 1).
adjacent(r195, r305).
shared_edge(r195, r305, 2).
adjacent(r195, r36).
shared_edge(r195, r36, 25).
adjacent(r196, r207).
shared_edge(r196, r207, 1).
adjacent(r196, r91).
shared_edge(r196, r91, 2).
adjacent(r197, r198).
shared_edge(r197, r198, 1).
adjacent(r197, r208).
shared_edge(r197, r208, 2).
adjacent(r197, r209).
shared_edge(r197, r209, 1).
adjacent(r198, r199).
shared_edge(r198, r199, 1).
adjacent(r198, r209).
shared_edge(r198, r209, 1).
adjacent(r199, r210).
shared_edge(r199, r210, 1).
adjacent(r2, r3).
shared_edge(r2, r3, 34).
adjacent(r2, r34).
shared_edge(r2, r34, 1).
adjacent(r20, r26).
shared_edge(r20, r26, 1).
adjacent(r20, r27).
shared_edge(r20, r27, 1).
adjacent(r200, r201).
shared_edge(r200, r201, 1).
adjacent(r201, r202).
shared_edge(r201, r202, 1).
adjacent(r201, r211).
shared_edge(r201, r211, 1).
adjacent(r202, r212).
shared_edge(r202, r212, 1).
adjacent(r202, r78).
shared_edge(r202, r78, 2).
adjacent(r203, r213).
shared_edge(r203, r213, 1).
adjacent(r203, r59).
shared_edge(r203, r59, 1).
adjacent(r204, r205).
shared_edge(r204, r205, 10).
adjacent(r204, r232).
shared_edge(r204, r232, 2).
adjacent(r204, r263).
shared_edge(r204, r263, 2).
adjacent(r204, r288).
shared_edge(r204, r288, 2).
adjacent(r204, r302).
shared_edge(r204, r302, 10).
adjacent(r204, r317).
shared_edge(r204, r317, 1).
adjacent(r205, r206).
shared_edge(r205, r206, 18).
adjacent(r205, r232).
shared_edge(r205, r232, 2).
adjacent(r205, r263).
shared_edge(r205, r263, 2).
adjacent(r205, r288).
shared_edge(r205, r288, 2).
adjacent(r205, r317).
shared_edge(r205, r317, 2).
adjacent(r205, r325).
shared_edge(r205, r325, 1).
adjacent(r206, r235).
shared_edge(r206, r235, 5).
adjacent(r206, r325).
shared_edge(r206, r325, 1).
adjacent(r206, r326).
shared_edge(r206, r326, 1).
adjacent(r206, r327).
shared_edge(r206, r327, 2).
adjacent(r206, r337).
shared_edge(r206, r337, 2).
adjacent(r206, r338).
shared_edge(r206, r338, 2).
adjacent(r207, r214).
shared_edge(r207, r214, 1).
adjacent(r207, r91).
shared_edge(r207, r91, 1).
adjacent(r208, r214).
shared_edge(r208, r214, 2).
adjacent(r208, r215).
shared_edge(r208, r215, 1).
adjacent(r208, r221).
shared_edge(r208, r221, 3).
adjacent(r208, r222).
shared_edge(r208, r222, 1).
adjacent(r208, r233).
shared_edge(r208, r233, 2).
adjacent(r208, r234).
shared_edge(r208, r234, 1).
adjacent(r208, r235).
shared_edge(r208, r235, 5).
adjacent(r208, r242).
shared_edge(r208, r242, 1).
adjacent(r208, r250).
shared_edge(r208, r250, 1).
adjacent(r209, r210).
shared_edge(r209, r210, 1).
adjacent(r209, r215).
shared_edge(r209, r215, 1).
adjacent(r21, r27).
shared_edge(r21, r27, 1).
adjacent(r210, r216).
shared_edge(r210, r216, 1).
adjacent(r211, r212).
shared_edge(r211, r212, 2).
adjacent(r211, r225).
shared_edge(r211, r225, 1).
adjacent(r212, r217).
shared_edge(r212, r217, 1).
adjacent(r212, r226).
shared_edge(r212, r226, 1).
adjacent(r212, r78).
shared_edge(r212, r78, 1).
adjacent(r213, r59).
shared_edge(r213, r59, 2).
adjacent(r214, r220).
shared_edge(r214, r220, 1).
adjacent(r214, r233).
shared_edge(r214, r233, 1).
adjacent(r214, r91).
shared_edge(r214, r91, 1).
adjacent(r215, r216).
shared_edge(r215, r216, 1).
adjacent(r215, r223).
shared_edge(r215, r223, 1).
adjacent(r217, r226).
shared_edge(r217, r226, 1).
adjacent(r217, r238).
shared_edge(r217, r238, 1).
adjacent(r217, r78).
shared_edge(r217, r78, 5).
adjacent(r218, r219).
shared_edge(r218, r219, 1).
adjacent(r218, r230).
shared_edge(r218, r230, 1).
adjacent(r218, r59).
shared_edge(r218, r59, 1).
adjacent(r219, r230).
shared_edge(r219, r230, 1).
adjacent(r219, r240).
shared_edge(r219, r240, 1).
adjacent(r219, r73).
shared_edge(r219, r73, 3).
adjacent(r22, r8).
shared_edge(r22, r8, 17).
adjacent(r220, r36).
shared_edge(r220, r36, 2).
adjacent(r220, r91).
shared_edge(r220, r91, 1).
adjacent(r221, r222).
shared_edge(r221, r222, 1).
adjacent(r222, r223).
shared_edge(r222, r223, 1).
adjacent(r222, r234).
shared_edge(r222, r234, 1).
adjacent(r223, r235).
shared_edge(r223, r235, 1).
adjacent(r224, r236).
shared_edge(r224, r236, 1).
adjacent(r224, r252).
shared_edge(r224, r252, 2).
adjacent(r224, r253).
shared_edge(r224, r253, 2).
adjacent(r224, r254).
shared_edge(r224, r254, 1).
adjacent(r224, r266).
shared_edge(r224, r266, 3).
adjacent(r224, r278).
shared_edge(r224, r278, 1).
adjacent(r225, r226).
shared_edge(r225, r226, 1).
adjacent(r226, r237).
shared_edge(r226, r237, 1).
adjacent(r227, r228).
shared_edge(r227, r228, 1).
adjacent(r227, r239).
shared_edge(r227, r239, 1).
adjacent(r227, r78).
shared_edge(r227, r78, 2).
adjacent(r228, r239).
shared_edge(r228, r239, 1).
adjacent(r228, r247).
shared_edge(r228, r247, 1).
adjacent(r228, r78).
shared_edge(r228, r78, 3).
adjacent(r229, r59).
shared_edge(r229, r59, 4).
adjacent(r230, r59).
shared_edge(r230, r59, 2).
adjacent(r231, r287).
shared_edge(r231, r287, 25).
adjacent(r233, r36).
shared_edge(r233, r36, 1).
adjacent(r234, r235).
shared_edge(r234, r235, 2).
adjacent(r235, r251).
shared_edge(r235, r251, 2).
adjacent(r235, r252).
shared_edge(r235, r252, 19).
adjacent(r235, r265).
shared_edge(r235, r265, 2).
adjacent(r235, r277).
shared_edge(r235, r277, 2).
adjacent(r235, r290).
shared_edge(r235, r290, 1).
adjacent(r235, r292).
shared_edge(r235, r292, 1).
adjacent(r235, r302).
shared_edge(r235, r302, 4).
adjacent(r235, r303).
shared_edge(r235, r303, 2).
adjacent(r235, r304).
shared_edge(r235, r304, 2).
adjacent(r235, r305).
shared_edge(r235, r305, 2).
adjacent(r235, r306).
shared_edge(r235, r306, 4).
adjacent(r235, r319).
shared_edge(r235, r319, 1).
adjacent(r235, r321).
shared_edge(r235, r321, 4).
adjacent(r235, r328).
shared_edge(r235, r328, 8).
adjacent(r235, r329).
shared_edge(r235, r329, 2).
adjacent(r235, r339).
shared_edge(r235, r339, 2).
adjacent(r235, r340).
shared_edge(r235, r340, 2).
adjacent(r235, r345).
shared_edge(r235, r345, 7).
adjacent(r236, r252).
shared_edge(r236, r252, 2).
adjacent(r237, r238).
shared_edge(r237, r238, 1).
adjacent(r237, r243).
shared_edge(r237, r243, 1).
adjacent(r238, r244).
shared_edge(r238, r244, 1).
adjacent(r238, r78).
shared_edge(r238, r78, 1).
adjacent(r239, r247).
shared_edge(r239, r247, 1).
adjacent(r239, r78).
shared_edge(r239, r78, 1).
adjacent(r24, r35).
shared_edge(r24, r35, 39).
adjacent(r24, r36).
shared_edge(r24, r36, 47).
adjacent(r24, r5).
shared_edge(r24, r5, 12).
adjacent(r240, r241).
shared_edge(r240, r241, 1).
adjacent(r240, r249).
shared_edge(r240, r249, 1).
adjacent(r240, r59).
shared_edge(r240, r59, 1).
adjacent(r241, r249).
shared_edge(r241, r249, 1).
adjacent(r241, r261).
shared_edge(r241, r261, 1).
adjacent(r241, r52).
shared_edge(r241, r52, 2).
adjacent(r241, r73).
shared_edge(r241, r73, 1).
adjacent(r242, r250).
shared_edge(r242, r250, 1).
adjacent(r242, r36).
shared_edge(r242, r36, 2).
adjacent(r243, r244).
shared_edge(r243, r244, 1).
adjacent(r243, r254).
shared_edge(r243, r254, 1).
adjacent(r244, r245).
shared_edge(r244, r245, 1).
adjacent(r244, r255).
shared_edge(r244, r255, 1).
adjacent(r245, r256).
shared_edge(r245, r256, 1).
adjacent(r245, r78).
shared_edge(r245, r78, 4).
adjacent(r246, r247).
shared_edge(r246, r247, 1).
adjacent(r246, r259).
shared_edge(r246, r259, 1).
adjacent(r246, r78).
shared_edge(r246, r78, 2).
adjacent(r247, r259).
shared_edge(r247, r259, 1).
adjacent(r247, r260).
shared_edge(r247, r260, 1).
adjacent(r247, r270).
shared_edge(r247, r270, 2).
adjacent(r247, r59).
shared_edge(r247, r59, 1).
adjacent(r248, r59).
shared_edge(r248, r59, 6).
adjacent(r249, r59).
shared_edge(r249, r59, 2).
adjacent(r25, r26).
shared_edge(r25, r26, 1).
adjacent(r25, r40).
shared_edge(r25, r40, 1).
adjacent(r250, r265).
shared_edge(r250, r265, 1).
adjacent(r250, r36).
shared_edge(r250, r36, 1).
adjacent(r251, r252).
shared_edge(r251, r252, 3).
adjacent(r252, r253).
shared_edge(r252, r253, 2).
adjacent(r252, r278).
shared_edge(r252, r278, 2).
adjacent(r252, r293).
shared_edge(r252, r293, 3).
adjacent(r252, r294).
shared_edge(r252, r294, 1).
adjacent(r252, r307).
shared_edge(r252, r307, 1).
adjacent(r252, r320).
shared_edge(r252, r320, 3).
adjacent(r254, r255).
shared_edge(r254, r255, 1).
adjacent(r254, r267).
shared_edge(r254, r267, 1).
adjacent(r255, r256).
shared_edge(r255, r256, 1).
adjacent(r255, r267).
shared_edge(r255, r267, 1).
adjacent(r255, r268).
shared_edge(r255, r268, 1).
adjacent(r255, r280).
shared_edge(r255, r280, 1).
adjacent(r256, r268).
shared_edge(r256, r268, 1).
adjacent(r256, r78).
shared_edge(r256, r78, 1).
adjacent(r257, r78).
shared_edge(r257, r78, 4).
adjacent(r258, r259).
shared_edge(r258, r259, 1).
adjacent(r258, r270).
shared_edge(r258, r270, 1).
adjacent(r258, r281).
shared_edge(r258, r281, 1).
adjacent(r258, r295).
shared_edge(r258, r295, 1).
adjacent(r258, r309).
shared_edge(r258, r309, 2).
adjacent(r258, r333).
shared_edge(r258, r333, 1).
adjacent(r258, r78).
shared_edge(r258, r78, 7).
adjacent(r259, r270).
shared_edge(r259, r270, 1).
adjacent(r26, r27).
shared_edge(r26, r27, 1).
adjacent(r26, r41).
shared_edge(r26, r41, 1).
adjacent(r26, r42).
shared_edge(r26, r42, 1).
adjacent(r260, r271).
shared_edge(r260, r271, 1).
adjacent(r260, r59).
shared_edge(r260, r59, 2).
adjacent(r261, r262).
shared_edge(r261, r262, 1).
adjacent(r261, r274).
shared_edge(r261, r274, 1).
adjacent(r261, r59).
shared_edge(r261, r59, 1).
adjacent(r262, r274).
shared_edge(r262, r274, 1).
adjacent(r262, r286).
shared_edge(r262, r286, 1).
adjacent(r262, r52).
shared_edge(r262, r52, 1).
adjacent(r262, r6).
shared_edge(r262, r6, 2).
adjacent(r264, r265).
shared_edge(r264, r265, 1).
adjacent(r264, r277).
shared_edge(r264, r277, 1).
adjacent(r264, r36).
shared_edge(r264, r36, 2).
adjacent(r266, r267).
shared_edge(r266, r267, 1).
adjacent(r266, r279).
shared_edge(r266, r279, 2).
adjacent(r267, r280).
shared_edge(r267, r280, 1).
adjacent(r268, r269).
shared_edge(r268, r269, 2).
adjacent(r268, r280).
shared_edge(r268, r280, 2).
adjacent(r269, r280).
shared_edge(r269, r280, 1).
adjacent(r269, r78).
shared_edge(r269, r78, 5).
adjacent(r27, r42).
shared_edge(r27, r42, 3).
adjacent(r270, r271).
shared_edge(r270, r271, 1).
adjacent(r270, r281).
shared_edge(r270, r281, 1).
adjacent(r270, r282).
shared_edge(r270, r282, 2).
adjacent(r271, r272).
shared_edge(r271, r272, 1).
adjacent(r271, r283).
shared_edge(r271, r283, 1).
adjacent(r272, r273).
shared_edge(r272, r273, 1).
adjacent(r272, r283).
shared_edge(r272, r283, 1).
adjacent(r272, r59).
shared_edge(r272, r59, 1).
adjacent(r273, r284).
shared_edge(r273, r284, 1).
adjacent(r273, r59).
shared_edge(r273, r59, 2).
adjacent(r274, r59).
shared_edge(r274, r59, 2).
adjacent(r275, r276).
shared_edge(r275, r276, 1).
adjacent(r275, r291).
shared_edge(r275, r291, 1).
adjacent(r275, r305).
shared_edge(r275, r305, 1).
adjacent(r275, r306).
shared_edge(r275, r306, 1).
adjacent(r275, r319).
shared_edge(r275, r319, 1).
adjacent(r276, r291).
shared_edge(r276, r291, 1).
adjacent(r276, r292).
shared_edge(r276, r292, 1).
adjacent(r276, r36).
shared_edge(r276, r36, 1).
adjacent(r277, r36).
shared_edge(r277, r36, 1).
adjacent(r278, r279).
shared_edge(r278, r279, 1).
adjacent(r279, r280).
shared_edge(r279, r280, 1).
adjacent(r279, r293).
shared_edge(r279, r293, 2).
adjacent(r28, r29).
shared_edge(r28, r29, 1).
adjacent(r28, r47).
shared_edge(r28, r47, 1).
adjacent(r28, r6).
shared_edge(r28, r6, 2).
adjacent(r280, r294).
shared_edge(r280, r294, 2).
adjacent(r280, r307).
shared_edge(r280, r307, 1).
adjacent(r280, r308).
shared_edge(r280, r308, 2).
adjacent(r280, r322).
shared_edge(r280, r322, 1).
adjacent(r280, r331).
shared_edge(r280, r331, 1).
adjacent(r280, r78).
shared_edge(r280, r78, 3).
adjacent(r281, r282).
shared_edge(r281, r282, 1).
adjacent(r281, r295).
shared_edge(r281, r295, 1).
adjacent(r282, r283).
shared_edge(r282, r283, 1).
adjacent(r282, r295).
shared_edge(r282, r295, 1).
adjacent(r282, r296).
shared_edge(r282, r296, 1).
adjacent(r283, r284).
shared_edge(r283, r284, 1).
adjacent(r283, r297).
shared_edge(r283, r297, 1).
adjacent(r283, r298).
shared_edge(r283, r298, 1).
adjacent(r284, r285).
shared_edge(r284, r285, 1).
adjacent(r284, r299).
shared_edge(r284, r299, 1).
adjacent(r285, r59).
shared_edge(r285, r59, 3).
adjacent(r286, r300).
shared_edge(r286, r300, 1).
adjacent(r286, r59).
shared_edge(r286, r59, 1).
adjacent(r286, r6).
shared_edge(r286, r6, 1).
adjacent(r287, r316).
shared_edge(r287, r316, 1).
adjacent(r287, r324).
shared_edge(r287, r324, 2).
adjacent(r287, r336).
shared_edge(r287, r336, 2).
adjacent(r287, r351).
shared_edge(r287, r351, 1).
adjacent(r287, r59).
shared_edge(r287, r59, 4).
adjacent(r287, r8).
shared_edge(r287, r8, 1).
adjacent(r289, r290).
shared_edge(r289, r290, 1).
adjacent(r289, r303).
shared_edge(r289, r303, 1).
adjacent(r29, r30).
shared_edge(r29, r30, 1).
adjacent(r29, r48).
shared_edge(r29, r48, 1).
adjacent(r29, r49).
shared_edge(r29, r49, 1).
adjacent(r29, r6).
shared_edge(r29, r6, 2).
adjacent(r291, r292).
shared_edge(r291, r292, 1).
adjacent(r291, r306).
shared_edge(r291, r306, 1).
adjacent(r292, r306).
shared_edge(r292, r306, 2).
adjacent(r292, r36).
shared_edge(r292, r36, 1).
adjacent(r293, r294).
shared_edge(r293, r294, 1).
adjacent(r295, r296).
shared_edge(r295, r296, 1).
adjacent(r295, r309).
shared_edge(r295, r309, 3).
adjacent(r295, r310).
shared_edge(r295, r310, 2).
adjacent(r295, r311).
shared_edge(r295, r311, 1).
adjacent(r295, r334).
shared_edge(r295, r334, 1).
adjacent(r295, r335).
shared_edge(r295, r335, 2).
adjacent(r295, r343).
shared_edge(r295, r343, 1).
adjacent(r296, r297).
shared_edge(r296, r297, 1).
adjacent(r296, r310).
shared_edge(r296, r310, 1).
adjacent(r297, r298).
shared_edge(r297, r298, 1).
adjacent(r297, r311).
shared_edge(r297, r311, 1).
adjacent(r298, r299).
shared_edge(r298, r299, 1).
adjacent(r298, r312).
shared_edge(r298, r312, 1).
adjacent(r299, r313).
shared_edge(r299, r313, 1).
adjacent(r299, r59).
shared_edge(r299, r59, 1).
adjacent(r3, r34).
shared_edge(r3, r34, 1).
adjacent(r3, r4).
shared_edge(r3, r4, 41).
adjacent(r3, r54).
shared_edge(r3, r54, 1).
adjacent(r3, r55).
shared_edge(r3, r55, 3).
adjacent(r3, r68).
shared_edge(r3, r68, 1).
adjacent(r3, r74).
shared_edge(r3, r74, 2).
adjacent(r30, r31).
shared_edge(r30, r31, 1).
adjacent(r30, r49).
shared_edge(r30, r49, 1).
adjacent(r30, r6).
shared_edge(r30, r6, 1).
adjacent(r300, r301).
shared_edge(r300, r301, 1).
adjacent(r300, r315).
shared_edge(r300, r315, 1).
adjacent(r300, r59).
shared_edge(r300, r59, 1).
adjacent(r301, r316).
shared_edge(r301, r316, 1).
adjacent(r301, r6).
shared_edge(r301, r6, 1).
adjacent(r301, r7).
shared_edge(r301, r7, 1).
adjacent(r302, r325).
shared_edge(r302, r325, 4).
adjacent(r302, r326).
shared_edge(r302, r326, 1).
adjacent(r302, r337).
shared_edge(r302, r337, 4).
adjacent(r302, r338).
shared_edge(r302, r338, 1).
adjacent(r302, r347).
shared_edge(r302, r347, 3).
adjacent(r304, r305).
shared_edge(r304, r305, 1).
adjacent(r305, r318).
shared_edge(r305, r318, 3).
adjacent(r305, r329).
shared_edge(r305, r329, 1).
adjacent(r305, r339).
shared_edge(r305, r339, 1).
adjacent(r305, r340).
shared_edge(r305, r340, 1).
adjacent(r307, r308).
shared_edge(r307, r308, 1).
adjacent(r307, r321).
shared_edge(r307, r321, 1).
adjacent(r308, r322).
shared_edge(r308, r322, 1).
adjacent(r309, r334).
shared_edge(r309, r334, 1).
adjacent(r31, r50).
shared_edge(r31, r50, 1).
adjacent(r31, r6).
shared_edge(r31, r6, 2).
adjacent(r310, r311).
shared_edge(r310, r311, 1).
adjacent(r311, r312).
shared_edge(r311, r312, 2).
adjacent(r311, r323).
shared_edge(r311, r323, 2).
adjacent(r311, r335).
shared_edge(r311, r335, 5).
adjacent(r311, r59).
shared_edge(r311, r59, 2).
adjacent(r312, r313).
shared_edge(r312, r313, 1).
adjacent(r313, r323).
shared_edge(r313, r323, 1).
adjacent(r313, r59).
shared_edge(r313, r59, 1).
adjacent(r314, r349).
shared_edge(r314, r349, 1).
adjacent(r314, r59).
shared_edge(r314, r59, 15).
adjacent(r315, r316).
shared_edge(r315, r316, 1).
adjacent(r315, r59).
shared_edge(r315, r59, 2).
adjacent(r316, r7).
shared_edge(r316, r7, 1).
adjacent(r317, r325).
shared_edge(r317, r325, 1).
adjacent(r318, r319).
shared_edge(r318, r319, 1).
adjacent(r319, r329).
shared_edge(r319, r329, 1).
adjacent(r320, r321).
shared_edge(r320, r321, 3).
adjacent(r321, r322).
shared_edge(r321, r322, 1).
adjacent(r321, r330).
shared_edge(r321, r330, 1).
adjacent(r321, r341).
shared_edge(r321, r341, 2).
adjacent(r321, r348).
shared_edge(r321, r348, 2).
adjacent(r321, r78).
shared_edge(r321, r78, 1).
adjacent(r322, r330).
shared_edge(r322, r330, 1).
adjacent(r323, r59).
shared_edge(r323, r59, 1).
adjacent(r324, r7).
shared_edge(r324, r7, 1).
adjacent(r324, r8).
shared_edge(r324, r8, 1).
adjacent(r325, r326).
shared_edge(r325, r326, 1).
adjacent(r326, r327).
shared_edge(r326, r327, 1).
adjacent(r327, r337).
shared_edge(r327, r337, 1).
adjacent(r33, r34).
shared_edge(r33, r34, 1).
adjacent(r330, r331).
shared_edge(r330, r331, 1).
adjacent(r330, r341).
shared_edge(r330, r341, 1).
adjacent(r331, r341).
shared_edge(r331, r341, 1).
adjacent(r331, r78).
shared_edge(r331, r78, 3).
adjacent(r332, r333).
shared_edge(r332, r333, 2).
adjacent(r332, r342).
shared_edge(r332, r342, 2).
adjacent(r332, r78).
shared_edge(r332, r78, 8).
adjacent(r333, r334).
shared_edge(r333, r334, 1).
adjacent(r334, r342).
shared_edge(r334, r342, 1).
adjacent(r335, r343).
shared_edge(r335, r343, 1).
adjacent(r335, r346).
shared_edge(r335, r346, 3).
adjacent(r335, r349).
shared_edge(r335, r349, 1).
adjacent(r335, r59).
shared_edge(r335, r59, 1).
adjacent(r336, r8).
shared_edge(r336, r8, 1).
adjacent(r337, r338).
shared_edge(r337, r338, 1).
adjacent(r339, r340).
shared_edge(r339, r340, 1).
adjacent(r34, r53).
shared_edge(r34, r53, 1).
adjacent(r342, r343).
shared_edge(r342, r343, 1).
adjacent(r343, r78).
shared_edge(r343, r78, 1).
adjacent(r344, r59).
shared_edge(r344, r59, 4).
adjacent(r346, r78).
shared_edge(r346, r78, 2).
adjacent(r348, r78).
shared_edge(r348, r78, 1).
adjacent(r349, r59).
shared_edge(r349, r59, 1).
adjacent(r35, r4).
shared_edge(r35, r4, 33).
adjacent(r350, r351).
shared_edge(r350, r351, 1).
adjacent(r350, r59).
shared_edge(r350, r59, 2).
adjacent(r351, r59).
shared_edge(r351, r59, 1).
adjacent(r36, r37).
shared_edge(r36, r37, 2).
adjacent(r36, r69).
shared_edge(r36, r69, 2).
adjacent(r36, r75).
shared_edge(r36, r75, 53).
adjacent(r38, r39).
shared_edge(r38, r39, 1).
adjacent(r38, r56).
shared_edge(r38, r56, 2).
adjacent(r39, r57).
shared_edge(r39, r57, 1).
adjacent(r4, r5).
shared_edge(r4, r5, 22).
adjacent(r4, r81).
shared_edge(r4, r81, 3).
adjacent(r4, r90).
shared_edge(r4, r90, 2).
adjacent(r4, r99).
shared_edge(r4, r99, 2).
adjacent(r40, r41).
shared_edge(r40, r41, 1).
adjacent(r40, r59).
shared_edge(r40, r59, 1).
adjacent(r41, r42).
shared_edge(r41, r42, 1).
adjacent(r41, r59).
shared_edge(r41, r59, 1).
adjacent(r42, r43).
shared_edge(r42, r43, 1).
adjacent(r42, r59).
shared_edge(r42, r59, 4).
adjacent(r43, r44).
shared_edge(r43, r44, 1).
adjacent(r43, r60).
shared_edge(r43, r60, 1).
adjacent(r44, r45).
shared_edge(r44, r45, 1).
adjacent(r44, r6).
shared_edge(r44, r6, 2).
adjacent(r44, r60).
shared_edge(r44, r60, 1).
adjacent(r44, r61).
shared_edge(r44, r61, 1).
adjacent(r45, r46).
shared_edge(r45, r46, 1).
adjacent(r45, r6).
shared_edge(r45, r6, 2).
adjacent(r45, r62).
shared_edge(r45, r62, 2).
adjacent(r46, r47).
shared_edge(r46, r47, 1).
adjacent(r46, r6).
shared_edge(r46, r6, 2).
adjacent(r46, r63).
shared_edge(r46, r63, 1).
adjacent(r46, r64).
shared_edge(r46, r64, 1).
adjacent(r47, r48).
shared_edge(r47, r48, 1).
adjacent(r47, r65).
shared_edge(r47, r65, 1).
adjacent(r48, r49).
shared_edge(r48, r49, 1).
adjacent(r48, r65).
shared_edge(r48, r65, 1).
adjacent(r49, r50).
shared_edge(r49, r50, 1).
adjacent(r49, r59).
shared_edge(r49, r59, 2).
adjacent(r5, r6).
shared_edge(r5, r6, 9).
adjacent(r50, r51).
shared_edge(r50, r51, 1).
adjacent(r50, r59).
shared_edge(r50, r59, 1).
adjacent(r51, r52).
shared_edge(r51, r52, 1).
adjacent(r51, r6).
shared_edge(r51, r6, 2).
adjacent(r51, r66).
shared_edge(r51, r66, 1).
adjacent(r51, r67).
shared_edge(r51, r67, 1).
adjacent(r52, r6).
shared_edge(r52, r6, 62).
adjacent(r52, r67).
shared_edge(r52, r67, 1).
adjacent(r52, r72).
shared_edge(r52, r72, 2).
adjacent(r52, r73).
shared_edge(r52, r73, 47).
adjacent(r53, r54).
shared_edge(r53, r54, 1).
adjacent(r54, r55).
shared_edge(r54, r55, 1).
adjacent(r54, r68).
shared_edge(r54, r68, 1).
adjacent(r56, r57).
shared_edge(r56, r57, 1).
adjacent(r56, r70).
shared_edge(r56, r70, 1).
adjacent(r57, r58).
shared_edge(r57, r58, 1).
adjacent(r57, r59).
shared_edge(r57, r59, 1).
adjacent(r58, r59).
shared_edge(r58, r59, 2).
adjacent(r59, r60).
shared_edge(r59, r60, 3).
adjacent(r59, r61).
shared_edge(r59, r61, 1).
adjacent(r59, r62).
shared_edge(r59, r62, 2).
adjacent(r59, r63).
shared_edge(r59, r63, 1).
adjacent(r59, r64).
shared_edge(r59, r64, 1).
adjacent(r59, r65).
shared_edge(r59, r65, 3).
adjacent(r59, r66).
shared_edge(r59, r66, 2).
adjacent(r59, r70).
shared_edge(r59, r70, 2).
adjacent(r59, r71).
shared_edge(r59, r71, 3).
adjacent(r59, r77).
shared_edge(r59, r77, 1).
adjacent(r59, r78).
shared_edge(r59, r78, 55).
adjacent(r59, r82).
shared_edge(r59, r82, 3).
adjacent(r59, r83).
shared_edge(r59, r83, 1).
adjacent(r59, r86).
shared_edge(r59, r86, 2).
adjacent(r59, r93).
shared_edge(r59, r93, 1).
adjacent(r59, r94).
shared_edge(r59, r94, 3).
adjacent(r59, r95).
shared_edge(r59, r95, 2).
adjacent(r6, r7).
shared_edge(r6, r7, 89).
adjacent(r60, r61).
shared_edge(r60, r61, 1).
adjacent(r61, r62).
shared_edge(r61, r62, 1).
adjacent(r62, r63).
shared_edge(r62, r63, 1).
adjacent(r63, r64).
shared_edge(r63, r64, 1).
adjacent(r64, r65).
shared_edge(r64, r65, 1).
adjacent(r66, r67).
shared_edge(r66, r67, 1).
adjacent(r67, r71).
shared_edge(r67, r71, 1).
adjacent(r68, r74).
shared_edge(r68, r74, 1).
adjacent(r68, r80).
shared_edge(r68, r80, 1).
adjacent(r7, r8).
shared_edge(r7, r8, 87).
adjacent(r71, r72).
shared_edge(r71, r72, 1).
adjacent(r71, r79).
shared_edge(r71, r79, 1).
adjacent(r72, r79).
shared_edge(r72, r79, 1).
adjacent(r73, r79).
shared_edge(r73, r79, 1).
adjacent(r73, r83).
shared_edge(r73, r83, 2).
adjacent(r73, r87).
shared_edge(r73, r87, 3).
adjacent(r73, r96).
shared_edge(r73, r96, 1).
adjacent(r74, r81).
shared_edge(r74, r81, 1).
adjacent(r75, r76).
shared_edge(r75, r76, 1).
adjacent(r75, r85).
shared_edge(r75, r85, 1).
adjacent(r75, r91).
shared_edge(r75, r91, 48).
adjacent(r75, r92).
shared_edge(r75, r92, 5).
adjacent(r76, r77).
shared_edge(r76, r77, 1).
adjacent(r76, r82).
shared_edge(r76, r82, 1).
adjacent(r76, r85).
shared_edge(r76, r85, 1).
adjacent(r77, r82).
shared_edge(r77, r82, 1).
adjacent(r79, r83).
shared_edge(r79, r83, 1).
adjacent(r8, r9).
shared_edge(r8, r9, 22).
adjacent(r80, r81).
shared_edge(r80, r81, 2).
adjacent(r80, r84).
shared_edge(r80, r84, 1).
adjacent(r80, r90).
shared_edge(r80, r90, 1).
adjacent(r82, r85).
shared_edge(r82, r85, 1).
adjacent(r83, r86).
shared_edge(r83, r86, 1).
adjacent(r83, r87).
shared_edge(r83, r87, 1).
adjacent(r84, r89).
shared_edge(r84, r89, 1).
adjacent(r85, r93).
shared_edge(r85, r93, 1).
adjacent(r86, r96).
shared_edge(r86, r96, 1).
adjacent(r88, r89).
shared_edge(r88, r89, 1).
adjacent(r88, r98).
shared_edge(r88, r98, 1).
adjacent(r89, r90).
shared_edge(r89, r90, 1).
adjacent(r89, r99).
shared_edge(r89, r99, 1).
adjacent(r92, r93).
shared_edge(r92, r93, 1).
adjacent(r95, r96).
shared_edge(r95, r96, 1).
adjacent(r97, r98).
shared_edge(r97, r98, 1).
adjacent(r98, r99).
shared_edge(r98, r99, 1).
