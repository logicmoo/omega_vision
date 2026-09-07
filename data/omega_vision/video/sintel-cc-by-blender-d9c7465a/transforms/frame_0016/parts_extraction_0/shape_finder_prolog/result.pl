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

region(r1, '#827d74', 4, centroid(1,0)).
polygon(r1, [xy(0,0),xy(0,1),xy(1,0),xy(2,0),xy(0,0)]).
fillpoint(r1, xy(2,0), 1).
fillpoint(r1, xy(1,0), 1).
fillpoint(r1, xy(0,1), 1).
fillpoint(r1, xy(0,0), 1).
region(r2, '#969da1', 104, centroid(7,3)).
polygon(r2, [xy(0,2),xy(0,10),xy(2,8),xy(3,8),xy(4,7),xy(4,8),xy(5,6),xy(7,6),xy(9,4),xy(10,4),xy(11,3),xy(12,3),xy(13,2),xy(14,2),xy(15,1),xy(14,0),xy(3,0),xy(2,1),xy(1,1),xy(0,2)]).
midline(r2, [xy(1,8)]).
midline(r2, [xy(3,3),xy(3,5),xy(4,4),xy(4,3),xy(7,3),xy(9,2),xy(10,2),xy(12,1),xy(12,2),xy(13,1),xy(14,1)]).
fillpoint(r2, xy(7,3), 4).
fillpoint(r2, xy(6,3), 4).
fillpoint(r2, xy(5,3), 4).
fillpoint(r2, xy(4,4), 4).
fillpoint(r2, xy(4,3), 4).
region(r3, '#a3abaf', 178, centroid(12,8)).
polygon(r3, [xy(0,11),xy(0,22),xy(1,22),xy(2,21),xy(2,17),xy(5,14),xy(5,13),xy(8,10),xy(9,10),xy(10,9),xy(11,9),xy(13,7),xy(14,7),xy(16,5),xy(18,5),xy(19,4),xy(20,4),xy(22,2),xy(26,2),xy(27,1),xy(26,0),xy(20,0),xy(18,2),xy(15,2),xy(14,3),xy(13,3),xy(12,4),xy(11,4),xy(10,5),xy(9,5),xy(7,7),xy(5,7),xy(5,8),xy(4,9),xy(2,9),xy(1,10),xy(0,11)]).
midline(r3, [xy(1,17),xy(1,21)]).
midline(r3, [xy(2,14),xy(2,15),xy(3,14),xy(3,12),xy(5,10),xy(5,11),xy(6,10),xy(6,9),xy(7,9),xy(9,7),xy(9,8),xy(11,6),xy(11,7),xy(13,5),xy(14,5),xy(15,4),xy(17,3),xy(17,4),xy(18,3),xy(18,4),xy(20,2),xy(22,1),xy(26,1)]).
fillpoint(r3, xy(3,12), 4).
fillpoint(r3, xy(20,2), 3).
fillpoint(r3, xy(15,4), 3).
fillpoint(r3, xy(14,5), 3).
fillpoint(r3, xy(13,5), 3).
region(r5, '#685f52', 136, centroid(50,5)).
polygon(r5, [xy(36,1),xy(36,3),xy(37,1),xy(37,0),xy(38,0),xy(38,1),xy(39,0),xy(40,0),xy(40,1),xy(39,2),xy(39,3),xy(38,4),xy(39,4),xy(40,5),xy(41,5),xy(42,4),xy(40,2),xy(41,0),xy(47,0),xy(47,2),xy(48,2),xy(49,3),xy(50,3),xy(51,4),xy(52,3),xy(52,4),xy(54,4),xy(54,5),xy(55,4),xy(55,5),xy(56,4),xy(56,5),xy(57,5),xy(57,6),xy(58,5),xy(59,6),xy(56,9),xy(53,9),xy(52,8),xy(50,8),xy(49,7),xy(47,7),xy(46,6),xy(45,6),xy(44,5),xy(43,5),xy(42,6),xy(43,6),xy(44,7),xy(46,7),xy(48,8),xy(48,9),xy(47,10),xy(49,10),xy(50,11),xy(50,12),xy(51,11),xy(53,11),xy(54,10),xy(54,11),xy(56,11),xy(56,12),xy(57,11),xy(36,1)]).
hole(r5, [xy(41,1),xy(41,2),xy(42,1),xy(46,1),xy(46,2),xy(47,3),xy(48,3),xy(49,4),xy(50,4),xy(51,5),xy(53,5),xy(54,6),xy(56,6),xy(57,7),xy(56,8),xy(53,8),xy(52,7),xy(50,7),xy(49,6),xy(47,6),xy(46,5),xy(45,5),xy(44,4),xy(43,4),xy(42,3),xy(41,1)]).
midline(r5, [xy(39,1),xy(40,3),xy(40,4),xy(41,4),xy(42,5),xy(44,6)]).
midline(r5, [xy(48,1),xy(49,1),xy(49,2),xy(51,2)]).
midline(r5, [xy(49,8),xy(49,9),xy(50,9),xy(50,10),xy(51,9),xy(51,10),xy(52,9),xy(52,10),xy(53,10)]).
midline(r5, [xy(57,1)]).
midline(r5, [xy(58,6),xy(59,7)]).
fillpoint(r5, xy(51,2), 3).
fillpoint(r5, xy(59,7), 2).
fillpoint(r5, xy(58,6), 2).
fillpoint(r5, xy(57,1), 2).
fillpoint(r5, xy(53,10), 2).
region(r6, '#827d74', 4, centroid(55,0)).
polygon(r6, [xy(53,0),xy(56,0),xy(53,0)]).
fillpoint(r6, xy(56,0), 1).
fillpoint(r6, xy(55,0), 1).
fillpoint(r6, xy(54,0), 1).
fillpoint(r6, xy(53,0), 1).
region(r7, '#4b443a', 49, centroid(60,4)).
polygon(r7, [xy(53,3),xy(54,3),xy(55,2),xy(55,3),xy(56,2),xy(56,3),xy(57,3),xy(57,4),xy(58,4),xy(60,6),xy(61,6),xy(62,5),xy(59,2),xy(60,2),xy(61,1),xy(61,2),xy(62,1),xy(62,0),xy(63,0),xy(63,1),xy(64,0),xy(65,0),xy(65,1),xy(66,1),xy(66,3),xy(53,3)]).
midline(r7, [xy(58,3),xy(59,3),xy(59,4),xy(60,4),xy(60,5),xy(61,5)]).
fillpoint(r7, xy(61,5), 2).
fillpoint(r7, xy(60,5), 2).
fillpoint(r7, xy(60,4), 2).
fillpoint(r7, xy(59,4), 2).
fillpoint(r7, xy(59,3), 2).
region(r10, '#a3abaf', 298, centroid(84,20)).
polygon(r10, [xy(68,0),xy(68,2),xy(69,2),xy(69,5),xy(71,5),xy(72,6),xy(73,6),xy(74,7),xy(75,7),xy(76,8),xy(78,8),xy(79,9),xy(80,9),xy(81,10),xy(82,10),xy(85,13),xy(85,15),xy(86,16),xy(87,16),xy(88,17),xy(88,18),xy(90,20),xy(90,23),xy(89,24),xy(89,25),xy(86,28),xy(86,29),xy(85,30),xy(84,30),xy(84,31),xy(81,34),xy(80,34),xy(79,35),xy(77,35),xy(75,37),xy(74,37),xy(73,38),xy(71,38),xy(70,39),xy(71,40),xy(75,40),xy(76,39),xy(77,39),xy(78,38),xy(79,38),xy(80,37),xy(81,37),xy(82,36),xy(83,36),xy(85,34),xy(86,34),xy(90,30),xy(90,29),xy(93,26),xy(93,25),xy(95,23),xy(95,18),xy(94,17),xy(94,15),xy(92,13),xy(92,12),xy(91,11),xy(90,11),xy(88,9),xy(87,9),xy(86,8),xy(85,8),xy(83,6),xy(81,6),xy(80,5),xy(78,5),xy(77,4),xy(75,4),xy(74,3),xy(72,3),xy(71,2),xy(70,2),xy(68,0)]).
midline(r10, [xy(70,3),xy(70,4),xy(71,3),xy(71,4),xy(72,4),xy(72,5),xy(74,5),xy(76,6),xy(77,6),xy(79,7),xy(80,7),xy(81,8),xy(83,8),xy(83,9),xy(84,9),xy(84,10),xy(86,11),xy(87,12),xy(88,12),xy(89,14),xy(90,15),xy(91,17),xy(91,18),xy(92,18),xy(92,23),xy(91,24),xy(91,25),xy(88,28),xy(88,29),xy(83,34),xy(81,35),xy(80,35),xy(79,36),xy(79,37),xy(80,36),xy(81,36)]).
midline(r10, [xy(71,39),xy(73,39),xy(74,38),xy(74,39),xy(75,38),xy(75,39),xy(77,37)]).
midline(r10, [xy(86,32),xy(88,30),xy(89,28),xy(91,26),xy(92,24),xy(93,23),xy(93,21)]).
fillpoint(r10, xy(90,15), 5).
fillpoint(r10, xy(89,14), 5).
fillpoint(r10, xy(92,19), 4).
fillpoint(r10, xy(92,18), 4).
fillpoint(r10, xy(91,18), 4).
region(r11, '#969da1', 172, centroid(86,5)).
polygon(r11, [xy(69,0),xy(69,1),xy(70,0),xy(70,1),xy(71,0),xy(71,1),xy(72,0),xy(87,0),xy(88,1),xy(89,1),xy(90,2),xy(91,2),xy(92,3),xy(93,3),xy(94,4),xy(95,4),xy(95,13),xy(94,14),xy(93,13),xy(93,12),xy(91,10),xy(90,10),xy(88,8),xy(87,8),xy(86,7),xy(85,7),xy(83,5),xy(81,5),xy(80,4),xy(78,4),xy(77,3),xy(75,3),xy(74,2),xy(72,2),xy(69,0)]).
midline(r11, [xy(72,1),xy(75,1),xy(75,2),xy(76,1),xy(76,2),xy(81,2),xy(81,3),xy(82,2),xy(82,3),xy(85,3),xy(85,4),xy(87,4),xy(89,5),xy(90,6),xy(91,6),xy(94,12),xy(94,13)]).
fillpoint(r11, xy(91,6), 5).
fillpoint(r11, xy(90,6), 5).
fillpoint(r11, xy(89,5), 5).
fillpoint(r11, xy(87,4), 5).
fillpoint(r11, xy(92,8), 4).
region(r12, '#827d74', 20, centroid(93,1)).
polygon(r12, [xy(88,0),xy(90,0),xy(90,1),xy(91,0),xy(91,1),xy(92,0),xy(95,0),xy(95,2),xy(94,3),xy(93,2),xy(92,2),xy(88,0)]).
midline(r12, [xy(92,1),xy(94,1),xy(94,2)]).
fillpoint(r12, xy(94,2), 2).
fillpoint(r12, xy(94,1), 2).
fillpoint(r12, xy(93,1), 2).
fillpoint(r12, xy(92,1), 2).
fillpoint(r12, xy(95,3), 1).
region(r15, '#827d74', 58, centroid(48,5)).
polygon(r15, [xy(41,1),xy(41,2),xy(42,1),xy(46,1),xy(46,2),xy(47,3),xy(48,3),xy(49,4),xy(50,4),xy(51,5),xy(53,5),xy(54,6),xy(56,6),xy(57,7),xy(56,8),xy(53,8),xy(52,7),xy(50,7),xy(49,6),xy(47,6),xy(46,5),xy(45,5),xy(44,4),xy(43,4),xy(42,3),xy(41,1)]).
midline(r15, [xy(42,2),xy(43,2),xy(43,3),xy(45,3),xy(47,4),xy(47,5),xy(48,4),xy(48,5),xy(50,5),xy(50,6),xy(53,6),xy(53,7),xy(56,7)]).
fillpoint(r15, xy(45,3), 3).
fillpoint(r15, xy(56,7), 2).
fillpoint(r15, xy(55,7), 2).
fillpoint(r15, xy(54,7), 2).
fillpoint(r15, xy(53,7), 2).
region(r16, '#3a342c', 57, centroid(63,8)).
polygon(r16, [xy(57,13),xy(62,13),xy(63,12),xy(61,10),xy(58,10),xy(57,13)]).
midline(r16, [xy(62,3),xy(63,3),xy(64,2),xy(64,4),xy(65,4),xy(65,5),xy(64,6),xy(64,9),xy(63,10),xy(63,11),xy(65,9),xy(65,6)]).
fillpoint(r16, xy(65,9), 2).
fillpoint(r16, xy(65,8), 2).
fillpoint(r16, xy(65,7), 2).
fillpoint(r16, xy(65,6), 2).
fillpoint(r16, xy(65,5), 2).
region(r18, '#aab2b7', 114, centroid(17,9)).
polygon(r18, [xy(3,17),xy(3,21),xy(5,21),xy(6,20),xy(5,19),xy(5,18),xy(7,16),xy(7,15),xy(6,14),xy(4,16),xy(3,17)]).
midline(r18, [xy(4,17),xy(4,20),xy(5,20)]).
midline(r18, [xy(5,16),xy(5,17),xy(6,16),xy(6,15),xy(7,14),xy(7,13),xy(8,12),xy(8,13),xy(10,11),xy(11,11),xy(13,9),xy(14,9),xy(16,7),xy(18,7),xy(19,6),xy(20,6),xy(22,4),xy(22,5),xy(23,4),xy(23,5),xy(24,4),xy(24,5),xy(25,4),xy(26,4),xy(27,3),xy(27,4),xy(28,3),xy(28,4),xy(29,3),xy(29,4),xy(30,3),xy(30,4),xy(31,3)]).
fillpoint(r18, xy(31,3), 2).
fillpoint(r18, xy(30,4), 2).
fillpoint(r18, xy(30,3), 2).
fillpoint(r18, xy(29,4), 2).
fillpoint(r18, xy(29,3), 2).
region(r19, '#827d74', 13, centroid(37,4)).
polygon(r19, [xy(35,2),xy(35,4),xy(36,4),xy(36,5),xy(37,4),xy(37,2),xy(38,2),xy(38,3),xy(37,5),xy(39,5),xy(35,2)]).
fillpoint(r19, xy(39,5), 1).
fillpoint(r19, xy(38,5), 1).
fillpoint(r19, xy(38,3), 1).
fillpoint(r19, xy(38,2), 1).
fillpoint(r19, xy(37,5), 1).
region(r24, '#685f52', 4, centroid(67,6)).
polygon(r24, [xy(67,4),xy(67,7),xy(67,4)]).
fillpoint(r24, xy(67,7), 1).
fillpoint(r24, xy(67,6), 1).
fillpoint(r24, xy(67,5), 1).
fillpoint(r24, xy(67,4), 1).
region(r27, '#685f52', 4, centroid(34,6)).
polygon(r27, [xy(34,5),xy(34,7),xy(35,5),xy(34,5)]).
fillpoint(r27, xy(35,5), 1).
fillpoint(r27, xy(34,7), 1).
fillpoint(r27, xy(34,6), 1).
fillpoint(r27, xy(34,5), 1).
region(r28, '#afb7bc', 74, centroid(17,11)).
polygon(r28, [xy(6,18),xy(6,19),xy(7,20),xy(6,21),xy(7,21),xy(8,20),xy(8,18),xy(7,17),xy(8,16),xy(8,15),xy(10,13),xy(11,13),xy(11,14),xy(8,17),xy(6,18)]).
midline(r28, [xy(7,18),xy(7,19)]).
midline(r28, [xy(9,15),xy(10,14),xy(12,13),xy(13,12),xy(15,11),xy(16,10),xy(17,10),xy(21,8),xy(23,8),xy(25,7),xy(27,7)]).
fillpoint(r28, xy(27,7), 2).
fillpoint(r28, xy(26,7), 2).
fillpoint(r28, xy(25,7), 2).
fillpoint(r28, xy(23,8), 2).
fillpoint(r28, xy(22,8), 2).
region(r35, '#827d74', 12, centroid(44,8)).
polygon(r35, [xy(40,6),xy(41,6),xy(41,7),xy(43,7),xy(43,8),xy(46,8),xy(46,9),xy(47,8),xy(47,9),xy(40,6)]).
fillpoint(r35, xy(47,9), 1).
fillpoint(r35, xy(47,8), 1).
fillpoint(r35, xy(46,9), 1).
fillpoint(r35, xy(46,8), 1).
fillpoint(r35, xy(45,8), 1).
region(r37, '#aab2b7', 182, centroid(80,21)).
polygon(r37, [xy(68,37),xy(69,37),xy(69,38),xy(70,38),xy(71,37),xy(70,36),xy(71,36),xy(72,35),xy(73,35),xy(74,34),xy(75,34),xy(76,33),xy(77,33),xy(77,34),xy(75,36),xy(74,36),xy(73,37),xy(72,37),xy(68,37)]).
midline(r37, [xy(70,37),xy(72,36),xy(73,36),xy(74,35),xy(75,35),xy(76,34),xy(78,33),xy(79,32),xy(79,33),xy(81,31),xy(82,29),xy(83,28),xy(83,29),xy(84,28),xy(84,27),xy(85,27),xy(87,23),xy(87,21),xy(84,18),xy(84,17),xy(83,16),xy(82,14),xy(78,10),xy(76,10),xy(75,9),xy(74,9),xy(73,8),xy(73,9),xy(71,8)]).
midline(r37, [xy(75,10)]).
midline(r37, [xy(78,11)]).
midline(r37, [xy(82,13)]).
midline(r37, [xy(85,18),xy(87,20)]).
fillpoint(r37, xy(87,23), 3).
fillpoint(r37, xy(87,22), 3).
fillpoint(r37, xy(87,21), 3).
fillpoint(r37, xy(87,20), 3).
fillpoint(r37, xy(86,25), 3).
region(r38, '#b4bcc1', 101, centroid(19,13)).
polygon(r38, [xy(9,17),xy(9,21),xy(10,20),xy(11,20),xy(12,19),xy(12,18),xy(15,15),xy(17,15),xy(18,14),xy(20,14),xy(21,13),xy(26,13),xy(27,12),xy(28,12),xy(30,10),xy(30,9),xy(29,8),xy(28,8),xy(27,9),xy(24,9),xy(23,10),xy(20,10),xy(19,11),xy(18,11),xy(17,12),xy(16,12),xy(15,13),xy(14,13),xy(12,15),xy(11,15),xy(10,16),xy(9,17)]).
midline(r38, [xy(10,19),xy(11,19),xy(11,17),xy(13,15),xy(13,16),xy(14,15),xy(14,14),xy(15,14),xy(16,13),xy(16,14),xy(17,13),xy(17,14),xy(18,13),xy(18,12),xy(20,12),xy(22,11),xy(22,12),xy(24,11),xy(26,11),xy(28,10),xy(30,8)]).
fillpoint(r38, xy(28,10), 3).
fillpoint(r38, xy(26,11), 3).
fillpoint(r38, xy(25,11), 3).
fillpoint(r38, xy(24,11), 3).
fillpoint(r38, xy(20,12), 3).
region(r40, '#28221a', 14, centroid(36,10)).
polygon(r40, [xy(34,12),xy(35,11),xy(35,8),xy(36,7),xy(36,10),xy(35,12),xy(35,14),xy(34,12)]).
fillpoint(r40, xy(38,7), 1).
fillpoint(r40, xy(37,7), 1).
fillpoint(r40, xy(36,10), 1).
fillpoint(r40, xy(36,9), 1).
fillpoint(r40, xy(36,8), 1).
region(r44, '#110c06', 431, centroid(42,28)).
polygon(r44, [xy(29,26),xy(29,34),xy(30,34),xy(30,35),xy(31,35),xy(31,38),xy(32,39),xy(32,40),xy(43,40),xy(44,39),xy(44,38),xy(45,37),xy(45,36),xy(44,35),xy(45,34),xy(45,33),xy(44,32),xy(43,32),xy(42,31),xy(43,30),xy(44,30),xy(45,29),xy(45,28),xy(42,25),xy(41,26),xy(40,25),xy(38,27),xy(37,27),xy(36,26),xy(34,26),xy(33,25),xy(33,28),xy(31,26),xy(30,26),xy(30,29),xy(29,26)]).
hole(r44, [xy(35,34),xy(35,35),xy(36,34),xy(36,36),xy(35,34)]).
hole(r44, [xy(39,27),xy(39,28),xy(39,27)]).
hole(r44, [xy(43,31),xy(44,31),xy(45,30),xy(46,30),xy(47,31),xy(46,32),xy(47,32),xy(48,31),xy(49,31),xy(43,31)]).
hole(r44, [xy(45,35),xy(46,35),xy(45,35)]).
midline(r44, [xy(33,36),xy(33,38),xy(34,37),xy(34,38),xy(37,38),xy(41,36),xy(41,34),xy(38,31),xy(38,32),xy(41,29),xy(41,30),xy(42,29),xy(42,27),xy(43,28)]).
midline(r44, [xy(34,25)]).
midline(r44, [xy(35,32)]).
midline(r44, [xy(37,24),xy(38,23),xy(38,24)]).
midline(r44, [xy(37,28)]).
midline(r44, [xy(38,9)]).
midline(r44, [xy(39,12),xy(41,14)]).
midline(r44, [xy(39,21)]).
midline(r44, [xy(40,17)]).
midline(r44, [xy(41,24),xy(41,25)]).
midline(r44, [xy(45,13)]).
midline(r44, [xy(47,28),xy(47,29),xy(50,29),xy(51,30),xy(53,34),xy(53,38),xy(54,37),xy(54,38),xy(55,38),xy(56,37),xy(56,38),xy(57,38)]).
midline(r44, [xy(47,36),xy(48,34)]).
fillpoint(r44, xy(41,14), 6).
fillpoint(r44, xy(42,14), 5).
fillpoint(r44, xy(41,36), 5).
fillpoint(r44, xy(41,34), 5).
fillpoint(r44, xy(41,15), 5).
region(r52, '#685f52', 12, centroid(33,13)).
polygon(r52, [xy(32,15),xy(32,16),xy(33,15),xy(33,9),xy(34,9),xy(32,15)]).
fillpoint(r52, xy(34,16), 1).
fillpoint(r52, xy(34,15), 1).
fillpoint(r52, xy(34,9), 1).
fillpoint(r52, xy(33,15), 1).
fillpoint(r52, xy(33,14), 1).
region(r64, '#afb7bc', 133, centroid(76,22)).
polygon(r64, [xy(66,35),xy(67,35),xy(68,34),xy(70,34),xy(70,35),xy(69,36),xy(68,36),xy(66,35)]).
midline(r64, [xy(68,35),xy(69,35),xy(73,33),xy(75,31),xy(75,32),xy(77,30),xy(77,31),xy(80,28),xy(80,26),xy(81,25),xy(81,26),xy(82,25),xy(82,22),xy(81,21),xy(82,21),xy(83,22),xy(83,24)]).
midline(r64, [xy(69,12),xy(70,11),xy(70,12),xy(73,12),xy(73,13),xy(74,12),xy(74,13),xy(75,13),xy(75,14),xy(76,13),xy(76,14),xy(77,13),xy(77,14),xy(78,14),xy(78,15),xy(79,15),xy(79,17),xy(80,17),xy(80,19)]).
fillpoint(r64, xy(80,19), 3).
fillpoint(r64, xy(83,24), 2).
fillpoint(r64, xy(83,23), 2).
fillpoint(r64, xy(83,22), 2).
fillpoint(r64, xy(82,25), 2).
region(r65, '#bac2c6', 159, centroid(23,18)).
polygon(r65, [xy(10,21),xy(13,21),xy(14,20),xy(13,19),xy(13,18),xy(15,16),xy(17,16),xy(18,15),xy(20,15),xy(21,14),xy(26,14),xy(27,13),xy(28,13),xy(30,11),xy(30,17),xy(31,18),xy(31,20),xy(30,21),xy(29,21),xy(28,22),xy(27,22),xy(26,23),xy(20,23),xy(19,22),xy(18,22),xy(17,21),xy(15,21),xy(14,22),xy(10,21)]).
midline(r65, [xy(14,21),xy(15,19),xy(15,18),xy(16,18),xy(16,19),xy(18,18),xy(18,19),xy(20,19),xy(21,18),xy(21,19),xy(22,18),xy(22,19),xy(23,18),xy(23,19),xy(24,18),xy(24,19),xy(25,18),xy(25,19),xy(26,18),xy(26,19),xy(27,18),xy(27,16)]).
midline(r65, [xy(29,13)]).
fillpoint(r65, xy(27,18), 5).
fillpoint(r65, xy(26,19), 5).
fillpoint(r65, xy(26,18), 5).
fillpoint(r65, xy(25,19), 5).
fillpoint(r65, xy(25,18), 5).
region(r67, '#827d74', 4, centroid(32,13)).
polygon(r67, [xy(32,11),xy(32,14),xy(32,11)]).
fillpoint(r67, xy(32,14), 1).
fillpoint(r67, xy(32,13), 1).
fillpoint(r67, xy(32,12), 1).
fillpoint(r67, xy(32,11), 1).
region(r71, '#4b443a', 6, centroid(60,12)).
polygon(r71, [xy(58,11),xy(60,11),xy(60,12),xy(62,12),xy(58,11)]).
fillpoint(r71, xy(62,12), 1).
fillpoint(r71, xy(61,12), 1).
fillpoint(r71, xy(60,12), 1).
fillpoint(r71, xy(60,11), 1).
fillpoint(r71, xy(59,11), 1).
region(r76, '#4b443a', 5, centroid(53,12)).
polygon(r76, [xy(51,12),xy(55,12),xy(51,12)]).
fillpoint(r76, xy(55,12), 1).
fillpoint(r76, xy(54,12), 1).
fillpoint(r76, xy(53,12), 1).
fillpoint(r76, xy(52,12), 1).
fillpoint(r76, xy(51,12), 1).
region(r79, '#4b443a', 4, centroid(64,13)).
polygon(r79, [xy(64,12),xy(64,14),xy(65,13),xy(64,12)]).
fillpoint(r79, xy(65,13), 1).
fillpoint(r79, xy(64,14), 1).
fillpoint(r79, xy(64,13), 1).
fillpoint(r79, xy(64,12), 1).
region(r84, '#3a342c', 4, centroid(49,14)).
polygon(r84, [xy(48,14),xy(49,13),xy(49,14),xy(50,13),xy(48,14)]).
fillpoint(r84, xy(50,13), 1).
fillpoint(r84, xy(49,14), 1).
fillpoint(r84, xy(49,13), 1).
fillpoint(r84, xy(48,14), 1).
region(r85, '#28221a', 10, centroid(51,15)).
polygon(r85, [xy(50,14),xy(50,17),xy(51,15),xy(52,14),xy(51,13),xy(52,13),xy(52,15),xy(50,14)]).
midline(r85, [xy(51,14)]).
fillpoint(r85, xy(51,14), 2).
fillpoint(r85, xy(52,15), 1).
fillpoint(r85, xy(52,14), 1).
fillpoint(r85, xy(52,13), 1).
fillpoint(r85, xy(51,15), 1).
region(r86, '#110c06', 61, centroid(55,17)).
polygon(r86, [xy(51,16),xy(51,18),xy(52,19),xy(52,20),xy(54,22),xy(55,22),xy(56,21),xy(56,22),xy(57,20),xy(57,19),xy(58,18),xy(57,17),xy(57,16),xy(58,15),xy(57,14),xy(54,14),xy(53,13),xy(53,15),xy(52,16),xy(51,16)]).
midline(r86, [xy(54,17),xy(54,18),xy(55,18),xy(54,20),xy(55,20)]).
midline(r86, [xy(57,15)]).
fillpoint(r86, xy(55,18), 4).
fillpoint(r86, xy(54,18), 4).
fillpoint(r86, xy(54,17), 4).
fillpoint(r86, xy(56,18), 3).
fillpoint(r86, xy(55,20), 3).
region(r90, '#b4bcc1', 218, centroid(71,24)).
polygon(r90, [xy(60,31),xy(61,30),xy(61,29),xy(63,27),xy(63,26),xy(64,28),xy(65,29),xy(68,29),xy(71,26),xy(71,25),xy(70,24),xy(70,20),xy(66,16),xy(67,16),xy(68,15),xy(68,14),xy(70,14),xy(71,13),xy(73,15),xy(74,15),xy(75,16),xy(77,16),xy(77,19),xy(80,22),xy(80,24),xy(78,26),xy(78,27),xy(76,29),xy(75,29),xy(74,30),xy(73,30),xy(70,33),xy(68,33),xy(67,34),xy(66,34),xy(65,35),xy(61,31),xy(62,33),xy(60,31)]).
midline(r90, [xy(63,29),xy(64,31),xy(65,32),xy(67,31),xy(67,32),xy(68,31),xy(70,30),xy(73,27),xy(74,27)]).
midline(r90, [xy(71,17),xy(74,20),xy(75,22),xy(75,24)]).
fillpoint(r90, xy(75,24), 6).
fillpoint(r90, xy(75,23), 6).
fillpoint(r90, xy(75,22), 6).
fillpoint(r90, xy(76,24), 5).
fillpoint(r90, xy(76,23), 5).
region(r91, '#b4bcc1', 4, centroid(31,16)).
polygon(r91, [xy(31,14),xy(31,17),xy(31,14)]).
fillpoint(r91, xy(31,17), 1).
fillpoint(r91, xy(31,16), 1).
fillpoint(r91, xy(31,15), 1).
fillpoint(r91, xy(31,14), 1).
region(r94, '#28221a', 92, centroid(56,25)).
polygon(r94, [xy(47,26),xy(48,26),xy(48,27),xy(49,27),xy(50,26),xy(49,25),xy(50,25),xy(53,22),xy(54,23),xy(56,23),xy(57,22),xy(57,21),xy(58,21),xy(59,20),xy(59,22),xy(56,25),xy(56,29),xy(57,30),xy(57,33),xy(56,34),xy(55,34),xy(54,33),xy(54,28),xy(53,27),xy(51,27),xy(47,26)]).
midline(r94, [xy(49,26)]).
midline(r94, [xy(52,25),xy(53,24),xy(53,25),xy(54,25),xy(54,26),xy(55,28),xy(55,33),xy(56,32),xy(56,30)]).
midline(r94, [xy(56,24),xy(58,22)]).
midline(r94, [xy(56,33)]).
midline(r94, [xy(59,17),xy(60,17),xy(60,18)]).
fillpoint(r94, xy(54,26), 3).
fillpoint(r94, xy(54,25), 3).
fillpoint(r94, xy(53,25), 3).
fillpoint(r94, xy(53,24), 3).
fillpoint(r94, xy(52,25), 3).
region(r103, '#3a342c', 13, centroid(63,18)).
polygon(r103, [xy(62,17),xy(62,20),xy(63,19),xy(63,18),xy(64,17),xy(63,16),xy(64,15),xy(64,16),xy(62,17)]).
midline(r103, [xy(63,17)]).
fillpoint(r103, xy(63,17), 2).
fillpoint(r103, xy(64,17), 1).
fillpoint(r103, xy(64,16), 1).
fillpoint(r103, xy(64,15), 1).
fillpoint(r103, xy(63,21), 1).
region(r106, '#4b443a', 6, centroid(34,17)).
polygon(r106, [xy(32,17),xy(33,16),xy(33,17),xy(34,17),xy(35,16),xy(35,17),xy(32,17)]).
fillpoint(r106, xy(35,17), 1).
fillpoint(r106, xy(35,16), 1).
fillpoint(r106, xy(34,17), 1).
fillpoint(r106, xy(33,17), 1).
fillpoint(r106, xy(33,16), 1).
region(r108, '#685f52', 22, centroid(46,19)).
polygon(r108, [xy(43,19),xy(43,20),xy(46,17),xy(46,19),xy(44,21),xy(46,20),xy(48,20),xy(48,21),xy(49,20),xy(49,16),xy(47,16),xy(47,17),xy(43,19)]).
midline(r108, [xy(44,20),xy(45,19)]).
fillpoint(r108, xy(45,19), 2).
fillpoint(r108, xy(44,20), 2).
fillpoint(r108, xy(49,20), 1).
fillpoint(r108, xy(49,19), 1).
fillpoint(r108, xy(49,18), 1).
region(r109, '#827d74', 6, centroid(48,18)).
polygon(r109, [xy(47,18),xy(47,19),xy(48,18),xy(48,16),xy(47,18)]).
fillpoint(r109, xy(48,19), 1).
fillpoint(r109, xy(48,18), 1).
fillpoint(r109, xy(48,17), 1).
fillpoint(r109, xy(48,16), 1).
fillpoint(r109, xy(47,19), 1).
region(r111, '#3a342c', 6, centroid(35,18)).
polygon(r111, [xy(33,18),xy(34,18),xy(34,19),xy(36,17),xy(36,18),xy(33,18)]).
fillpoint(r111, xy(36,18), 1).
fillpoint(r111, xy(36,17), 1).
fillpoint(r111, xy(35,18), 1).
fillpoint(r111, xy(34,19), 1).
fillpoint(r111, xy(34,18), 1).
region(r114, '#bac2c6', 57, centroid(67,24)).
polygon(r114, [xy(63,24),xy(63,25),xy(64,24),xy(64,22),xy(65,21),xy(65,20),xy(66,19),xy(66,17),xy(68,19),xy(67,20),xy(69,20),xy(69,24),xy(70,25),xy(70,26),xy(68,28),xy(65,28),xy(64,27),xy(64,26),xy(65,25),xy(63,24)]).
midline(r114, [xy(66,20),xy(66,24),xy(67,23),xy(67,25),xy(66,26),xy(67,26),xy(68,25),xy(68,26)]).
midline(r114, [xy(68,20)]).
fillpoint(r114, xy(68,26), 3).
fillpoint(r114, xy(68,25), 3).
fillpoint(r114, xy(67,26), 3).
fillpoint(r114, xy(67,25), 3).
fillpoint(r114, xy(67,24), 3).
region(r116, '#28221a', 59, centroid(33,26)).
polygon(r116, [xy(29,25),xy(30,24),xy(30,25),xy(31,24),xy(31,25),xy(32,25),xy(32,26),xy(31,27),xy(31,31),xy(30,32),xy(30,33),xy(31,34),xy(32,34),xy(33,33),xy(33,32),xy(34,31),xy(34,30),xy(32,28),xy(32,27),xy(34,27),xy(34,28),xy(35,27),xy(35,29),xy(36,27),xy(29,25)]).
midline(r116, [xy(31,32),xy(31,33),xy(32,32),xy(32,29),xy(33,30),xy(33,31),xy(32,33)]).
midline(r116, [xy(32,24),xy(33,23),xy(34,21),xy(35,20)]).
midline(r116, [xy(34,29)]).
fillpoint(r116, xy(35,20), 2).
fillpoint(r116, xy(34,29), 2).
fillpoint(r116, xy(34,21), 2).
fillpoint(r116, xy(33,31), 2).
fillpoint(r116, xy(33,30), 2).
region(r133, '#827d74', 11, centroid(45,22)).
polygon(r133, [xy(43,21),xy(43,22),xy(44,22),xy(44,24),xy(46,24),xy(45,22),xy(45,21),xy(47,21),xy(43,21)]).
fillpoint(r133, xy(47,21), 1).
fillpoint(r133, xy(46,24), 1).
fillpoint(r133, xy(46,21), 1).
fillpoint(r133, xy(45,24), 1).
fillpoint(r133, xy(45,22), 1).
region(r134, '#4b443a', 5, centroid(49,23)).
polygon(r134, [xy(49,21),xy(49,23),xy(50,23),xy(50,24),xy(49,21)]).
fillpoint(r134, xy(50,24), 1).
fillpoint(r134, xy(50,23), 1).
fillpoint(r134, xy(49,23), 1).
fillpoint(r134, xy(49,22), 1).
fillpoint(r134, xy(49,21), 1).
region(r135, '#3a342c', 6, centroid(51,22)).
polygon(r135, [xy(50,21),xy(50,22),xy(51,21),xy(52,22),xy(51,23),xy(50,21)]).
midline(r135, [xy(51,22)]).
fillpoint(r135, xy(51,22), 2).
fillpoint(r135, xy(52,22), 1).
fillpoint(r135, xy(51,23), 1).
fillpoint(r135, xy(51,21), 1).
fillpoint(r135, xy(50,22), 1).
region(r137, '#3a342c', 27, centroid(59,26)).
polygon(r137, [xy(57,25),xy(57,29),xy(58,29),xy(58,34),xy(57,25)]).
midline(r137, [xy(58,25),xy(59,24)]).
midline(r137, [xy(58,27),xy(58,28)]).
fillpoint(r137, xy(59,24), 2).
fillpoint(r137, xy(58,28), 2).
fillpoint(r137, xy(58,27), 2).
fillpoint(r137, xy(58,25), 2).
fillpoint(r137, xy(61,22), 1).
region(r138, '#4b443a', 7, centroid(61,23)).
polygon(r138, [xy(60,25),xy(61,24),xy(61,23),xy(62,22),xy(62,23),xy(61,25),xy(60,25)]).
fillpoint(r138, xy(62,23), 1).
fillpoint(r138, xy(62,22), 1).
fillpoint(r138, xy(62,21), 1).
fillpoint(r138, xy(61,25), 1).
fillpoint(r138, xy(61,24), 1).
region(r150, '#969da1', 5, centroid(46,23)).
polygon(r150, [xy(45,23),xy(46,22),xy(46,23),xy(47,22),xy(47,23),xy(45,23)]).
fillpoint(r150, xy(47,23), 1).
fillpoint(r150, xy(47,22), 1).
fillpoint(r150, xy(46,23), 1).
fillpoint(r150, xy(46,22), 1).
fillpoint(r150, xy(45,23), 1).
region(r153, '#827d74', 11, centroid(5,23)).
polygon(r153, [xy(0,23),xy(8,23),xy(8,24),xy(9,23),xy(0,23)]).
fillpoint(r153, xy(9,23), 1).
fillpoint(r153, xy(8,24), 1).
fillpoint(r153, xy(8,23), 1).
fillpoint(r153, xy(7,23), 1).
fillpoint(r153, xy(6,23), 1).
region(r154, '#685f52', 35, centroid(11,30)).
polygon(r154, [xy(9,24),xy(10,23),xy(10,35),xy(11,35),xy(11,37),xy(12,37),xy(9,24)]).
midline(r154, [xy(11,27),xy(11,28)]).
midline(r154, [xy(11,32),xy(11,34)]).
fillpoint(r154, xy(11,34), 2).
fillpoint(r154, xy(11,33), 2).
fillpoint(r154, xy(11,32), 2).
fillpoint(r154, xy(11,28), 2).
fillpoint(r154, xy(11,27), 2).
region(r155, '#827d74', 6, centroid(12,24)).
polygon(r155, [xy(11,23),xy(11,24),xy(12,24),xy(12,26),xy(13,24),xy(11,23)]).
fillpoint(r155, xy(13,24), 1).
fillpoint(r155, xy(12,26), 1).
fillpoint(r155, xy(12,25), 1).
fillpoint(r155, xy(12,24), 1).
fillpoint(r155, xy(11,24), 1).
region(r160, '#685f52', 17, centroid(20,25)).
polygon(r160, [xy(16,25),xy(17,24),xy(17,25),xy(18,25),xy(19,24),xy(18,23),xy(19,25),xy(22,25),xy(22,26),xy(23,25),xy(24,26),xy(23,27),xy(25,26),xy(16,25)]).
midline(r160, [xy(18,24)]).
midline(r160, [xy(23,26)]).
fillpoint(r160, xy(23,26), 2).
fillpoint(r160, xy(18,24), 2).
fillpoint(r160, xy(25,26), 1).
fillpoint(r160, xy(24,26), 1).
fillpoint(r160, xy(23,27), 1).
region(r171, '#685f52', 13, centroid(5,24)).
polygon(r171, [xy(0,24),xy(5,24),xy(5,25),xy(6,24),xy(6,25),xy(7,24),xy(8,25),xy(7,26),xy(0,24)]).
midline(r171, [xy(7,25)]).
fillpoint(r171, xy(7,25), 2).
fillpoint(r171, xy(8,25), 1).
fillpoint(r171, xy(7,26), 1).
fillpoint(r171, xy(7,24), 1).
fillpoint(r171, xy(6,25), 1).
region(r175, '#969da1', 5, centroid(23,24)).
polygon(r175, [xy(21,24),xy(25,24),xy(21,24)]).
fillpoint(r175, xy(25,24), 1).
fillpoint(r175, xy(24,24), 1).
fillpoint(r175, xy(23,24), 1).
fillpoint(r175, xy(22,24), 1).
fillpoint(r175, xy(21,24), 1).
region(r183, '#969da1', 132, centroid(89,35)).
polygon(r183, [xy(76,40),xy(77,40),xy(78,39),xy(78,40),xy(79,39),xy(79,40),xy(90,40),xy(92,38),xy(93,38),xy(95,36),xy(95,27),xy(94,26),xy(91,29),xy(91,30),xy(86,35),xy(85,35),xy(83,37),xy(82,37),xy(81,38),xy(80,38),xy(76,40)]).
midline(r183, [xy(80,39),xy(81,39),xy(82,38),xy(82,39),xy(84,38),xy(85,37),xy(85,38),xy(89,36),xy(90,35),xy(90,36),xy(91,35),xy(91,34),xy(93,30),xy(93,29),xy(94,27)]).
fillpoint(r183, xy(91,35), 5).
fillpoint(r183, xy(91,34), 5).
fillpoint(r183, xy(90,36), 5).
fillpoint(r183, xy(90,35), 5).
fillpoint(r183, xy(89,36), 5).
region(r184, '#4b443a', 11, centroid(3,26)).
polygon(r184, [xy(0,25),xy(0,26),xy(1,25),xy(4,25),xy(4,26),xy(6,26),xy(6,27),xy(7,27),xy(0,25)]).
fillpoint(r184, xy(7,27), 1).
fillpoint(r184, xy(6,27), 1).
fillpoint(r184, xy(6,26), 1).
fillpoint(r184, xy(5,26), 1).
fillpoint(r184, xy(4,26), 1).
region(r188, '#4b443a', 50, centroid(21,29)).
polygon(r188, [xy(14,30),xy(15,29),xy(15,30),xy(16,29),xy(16,28),xy(17,27),xy(15,25),xy(15,26),xy(21,26),xy(22,27),xy(20,29),xy(17,29),xy(14,30)]).
midline(r188, [xy(17,28),xy(18,27),xy(18,28),xy(19,27),xy(19,28),xy(20,27),xy(20,28),xy(21,27)]).
midline(r188, [xy(24,28),xy(25,28)]).
fillpoint(r188, xy(25,28), 2).
fillpoint(r188, xy(24,28), 2).
fillpoint(r188, xy(21,27), 2).
fillpoint(r188, xy(20,28), 2).
fillpoint(r188, xy(20,27), 2).
region(r190, '#685f52', 8, centroid(27,27)).
polygon(r190, [xy(26,25),xy(27,25),xy(27,30),xy(26,25)]).
fillpoint(r190, xy(28,25), 1).
fillpoint(r190, xy(27,30), 1).
fillpoint(r190, xy(27,29), 1).
fillpoint(r190, xy(27,28), 1).
fillpoint(r190, xy(27,27), 1).
region(r197, '#3a342c', 88, centroid(5,32)).
polygon(r197, [xy(0,27),xy(0,36),xy(2,34),xy(2,33),xy(1,32),xy(1,28),xy(2,27),xy(1,26),xy(3,26),xy(3,27),xy(5,27),xy(5,30),xy(3,32),xy(4,34),xy(3,35),xy(3,36),xy(2,37),xy(3,38),xy(4,37),xy(4,36),xy(6,34),xy(5,33),xy(6,32),xy(5,31),xy(6,29),xy(6,28),xy(7,28),xy(7,29),xy(8,28),xy(8,27),xy(9,26),xy(9,30),xy(8,31),xy(8,32),xy(7,33),xy(6,35),xy(7,36),xy(7,38),xy(8,37),xy(9,38),xy(8,39),xy(9,39),xy(9,40),xy(0,27)]).
hole(r197, [xy(2,28),xy(2,32),xy(4,30),xy(4,29),xy(3,28),xy(4,28),xy(2,28)]).
hole(r197, [xy(6,30),xy(6,31),xy(7,30),xy(7,32),xy(8,30),xy(8,29),xy(6,30)]).
midline(r197, [xy(1,27)]).
midline(r197, [xy(1,33),xy(1,34),xy(3,33),xy(3,34),xy(4,33),xy(4,32),xy(5,32),xy(7,34),xy(7,35),xy(8,34),xy(8,33)]).
midline(r197, [xy(3,37),xy(4,35)]).
midline(r197, [xy(8,38)]).
fillpoint(r197, xy(8,38), 2).
fillpoint(r197, xy(8,34), 2).
fillpoint(r197, xy(8,33), 2).
fillpoint(r197, xy(7,35), 2).
fillpoint(r197, xy(7,34), 2).
region(r208, '#bac2c6', 4, centroid(62,27)).
polygon(r208, [xy(61,27),xy(61,28),xy(62,27),xy(62,26),xy(61,27)]).
fillpoint(r208, xy(62,27), 1).
fillpoint(r208, xy(62,26), 1).
fillpoint(r208, xy(61,28), 1).
fillpoint(r208, xy(61,27), 1).
region(r209, '#3a342c', 87, centroid(19,32)).
polygon(r209, [xy(13,27),xy(14,27),xy(14,28),xy(13,29),xy(13,37),xy(14,35),xy(15,36),xy(17,34),xy(19,36),xy(19,37),xy(20,36),xy(20,34),xy(21,33),xy(21,31),xy(20,30),xy(16,30),xy(15,31),xy(14,31),xy(14,29),xy(15,28),xy(15,27),xy(16,27),xy(13,27)]).
midline(r209, [xy(15,33),xy(15,34),xy(16,33),xy(16,32),xy(18,32),xy(18,33),xy(19,32),xy(19,35)]).
midline(r209, [xy(25,32),xy(25,34),xy(26,34)]).
fillpoint(r209, xy(19,33), 3).
fillpoint(r209, xy(19,32), 3).
fillpoint(r209, xy(18,33), 3).
fillpoint(r209, xy(18,32), 3).
fillpoint(r209, xy(17,32), 3).
region(r210, '#28221a', 5, centroid(28,29)).
polygon(r210, [xy(28,27),xy(28,31),xy(28,27)]).
fillpoint(r210, xy(28,31), 1).
fillpoint(r210, xy(28,30), 1).
fillpoint(r210, xy(28,29), 1).
fillpoint(r210, xy(28,28), 1).
fillpoint(r210, xy(28,27), 1).
region(r214, '#28221a', 11, centroid(3,29)).
polygon(r214, [xy(2,28),xy(2,31),xy(3,31),xy(4,30),xy(4,29),xy(3,28),xy(4,28),xy(2,28)]).
midline(r214, [xy(3,29),xy(3,30)]).
fillpoint(r214, xy(3,30), 2).
fillpoint(r214, xy(3,29), 2).
fillpoint(r214, xy(4,30), 1).
fillpoint(r214, xy(4,29), 1).
fillpoint(r214, xy(4,28), 1).
region(r220, '#4b443a', 5, centroid(7,31)).
polygon(r220, [xy(6,30),xy(6,31),xy(7,30),xy(7,32),xy(6,30)]).
fillpoint(r220, xy(7,32), 1).
fillpoint(r220, xy(7,31), 1).
fillpoint(r220, xy(7,30), 1).
fillpoint(r220, xy(6,31), 1).
fillpoint(r220, xy(6,30), 1).
region(r222, '#28221a', 27, centroid(25,36)).
polygon(r222, [xy(22,30),xy(22,33),xy(23,33),xy(23,36),xy(24,35),xy(24,38),xy(25,37),xy(25,38),xy(26,38),xy(27,39),xy(27,40),xy(28,40),xy(29,39),xy(28,38),xy(28,37),xy(27,36),xy(26,36),xy(22,30)]).
midline(r222, [xy(26,37),xy(27,37),xy(27,38),xy(28,39)]).
fillpoint(r222, xy(28,39), 2).
fillpoint(r222, xy(27,38), 2).
fillpoint(r222, xy(27,37), 2).
fillpoint(r222, xy(26,37), 2).
fillpoint(r222, xy(29,39), 1).
region(r224, '#28221a', 12, centroid(46,31)).
polygon(r224, [xy(43,31),xy(44,31),xy(45,30),xy(46,30),xy(47,31),xy(46,32),xy(47,32),xy(48,31),xy(49,31),xy(43,31)]).
midline(r224, [xy(45,31),xy(46,31)]).
fillpoint(r224, xy(46,31), 2).
fillpoint(r224, xy(45,31), 2).
fillpoint(r224, xy(49,31), 1).
fillpoint(r224, xy(48,31), 1).
fillpoint(r224, xy(47,32), 1).
region(r233, '#28221a', 27, centroid(48,38)).
polygon(r233, [xy(45,38),xy(45,40),xy(49,40),xy(50,39),xy(50,37),xy(49,36),xy(47,38),xy(46,38),xy(45,38)]).
midline(r233, [xy(46,39),xy(47,39),xy(48,38),xy(48,39),xy(49,38),xy(49,37),xy(50,36)]).
midline(r233, [xy(49,39)]).
fillpoint(r233, xy(50,36), 2).
fillpoint(r233, xy(49,39), 2).
fillpoint(r233, xy(49,38), 2).
fillpoint(r233, xy(49,37), 2).
fillpoint(r233, xy(48,39), 2).
region(r236, '#4b443a', 5, centroid(22,35)).
polygon(r236, [xy(21,34),xy(21,35),xy(22,35),xy(22,37),xy(21,34)]).
fillpoint(r236, xy(22,37), 1).
fillpoint(r236, xy(22,36), 1).
fillpoint(r236, xy(22,35), 1).
fillpoint(r236, xy(21,35), 1).
fillpoint(r236, xy(21,34), 1).
region(r238, '#28221a', 5, centroid(36,35)).
polygon(r238, [xy(35,34),xy(35,35),xy(36,34),xy(36,36),xy(35,34)]).
fillpoint(r238, xy(36,36), 1).
fillpoint(r238, xy(36,35), 1).
fillpoint(r238, xy(36,34), 1).
fillpoint(r238, xy(35,35), 1).
fillpoint(r238, xy(35,34), 1).
region(r243, '#28221a', 30, centroid(4,38)).
polygon(r243, [xy(0,37),xy(0,40),xy(1,39),xy(1,40),xy(2,40),xy(3,39),xy(1,37),xy(1,36),xy(2,35),xy(2,36),xy(0,37)]).
midline(r243, [xy(2,39)]).
midline(r243, [xy(5,39),xy(6,39)]).
fillpoint(r243, xy(6,39), 2).
fillpoint(r243, xy(5,39), 2).
fillpoint(r243, xy(2,39), 2).
fillpoint(r243, xy(8,40), 1).
fillpoint(r243, xy(7,40), 1).
region(r245, '#28221a', 35, centroid(17,38)).
polygon(r245, [xy(14,36),xy(14,40),xy(20,40),xy(21,39),xy(21,38),xy(20,37),xy(19,38),xy(18,37),xy(18,36),xy(17,35),xy(15,37),xy(14,36)]).
midline(r245, [xy(16,38),xy(17,38),xy(17,36)]).
midline(r245, [xy(19,39),xy(20,38),xy(20,39)]).
fillpoint(r245, xy(17,38), 3).
fillpoint(r245, xy(16,38), 3).
fillpoint(r245, xy(20,39), 2).
fillpoint(r245, xy(20,38), 2).
fillpoint(r245, xy(19,39), 2).
region(r256, '#3a342c', 6, centroid(29,37)).
polygon(r256, [xy(28,36),xy(29,36),xy(29,38),xy(30,38),xy(30,39),xy(28,36)]).
fillpoint(r256, xy(30,39), 1).
fillpoint(r256, xy(30,38), 1).
fillpoint(r256, xy(29,38), 1).
fillpoint(r256, xy(29,37), 1).
fillpoint(r256, xy(29,36), 1).
region(r266, '#3a342c', 9, centroid(23,39)).
polygon(r266, [xy(22,38),xy(22,40),xy(23,40),xy(24,39),xy(23,38),xy(23,37),xy(22,38)]).
midline(r266, [xy(23,39)]).
fillpoint(r266, xy(23,39), 2).
fillpoint(r266, xy(24,40), 1).
fillpoint(r266, xy(24,39), 1).
fillpoint(r266, xy(23,40), 1).
fillpoint(r266, xy(23,38), 1).
region(r275, '#4b443a', 8, centroid(12,39)).
polygon(r275, [xy(11,38),xy(12,38),xy(12,39),xy(11,40),xy(12,40),xy(13,39),xy(13,40),xy(11,38)]).
fillpoint(r275, xy(13,40), 1).
fillpoint(r275, xy(13,39), 1).
fillpoint(r275, xy(13,38), 1).
fillpoint(r275, xy(12,40), 1).
fillpoint(r275, xy(12,39), 1).
region(r276, '#3a342c', 7, centroid(62,39)).
polygon(r276, [xy(61,38),xy(61,39),xy(62,38),xy(62,39),xy(63,39),xy(63,40),xy(64,40),xy(61,38)]).
fillpoint(r276, xy(64,40), 1).
fillpoint(r276, xy(63,40), 1).
fillpoint(r276, xy(63,39), 1).
fillpoint(r276, xy(62,39), 1).
fillpoint(r276, xy(62,38), 1).
region(r279, '#4b443a', 4, centroid(65,39)).
polygon(r279, [xy(64,39),xy(65,38),xy(65,40),xy(64,39)]).
fillpoint(r279, xy(65,40), 1).
fillpoint(r279, xy(65,39), 1).
fillpoint(r279, xy(65,38), 1).
fillpoint(r279, xy(64,39), 1).
region(r280, '#3a342c', 4, centroid(66,39)).
polygon(r280, [xy(66,38),xy(66,40),xy(67,40),xy(66,38)]).
fillpoint(r280, xy(67,40), 1).
fillpoint(r280, xy(66,40), 1).
fillpoint(r280, xy(66,39), 1).
fillpoint(r280, xy(66,38), 1).
region(r283, '#827d74', 11, centroid(93,39)).
polygon(r283, [xy(91,40),xy(92,39),xy(92,40),xy(93,39),xy(93,40),xy(94,40),xy(95,39),xy(94,38),xy(95,38),xy(95,40),xy(91,40)]).
midline(r283, [xy(94,39)]).
fillpoint(r283, xy(94,39), 2).
fillpoint(r283, xy(95,40), 1).
fillpoint(r283, xy(95,39), 1).
fillpoint(r283, xy(95,38), 1).
fillpoint(r283, xy(94,40), 1).
adjacent(r1, r2).
shared_edge(r1, r2, 5).
adjacent(r10, r11).
shared_edge(r10, r11, 45).
adjacent(r10, r17).
shared_edge(r10, r17, 2).
adjacent(r10, r183).
shared_edge(r10, r183, 37).
adjacent(r10, r21).
shared_edge(r10, r21, 4).
adjacent(r10, r288).
shared_edge(r10, r288, 1).
adjacent(r10, r294).
shared_edge(r10, r294, 2).
adjacent(r10, r37).
shared_edge(r10, r37, 74).
adjacent(r10, r9).
shared_edge(r10, r9, 1).
adjacent(r100, r101).
shared_edge(r100, r101, 1).
adjacent(r100, r108).
shared_edge(r100, r108, 1).
adjacent(r100, r44).
shared_edge(r100, r44, 1).
adjacent(r100, r93).
shared_edge(r100, r93, 1).
adjacent(r101, r102).
shared_edge(r101, r102, 1).
adjacent(r101, r109).
shared_edge(r101, r109, 1).
adjacent(r101, r84).
shared_edge(r101, r84, 1).
adjacent(r102, r108).
shared_edge(r102, r108, 1).
adjacent(r102, r84).
shared_edge(r102, r84, 1).
adjacent(r102, r85).
shared_edge(r102, r85, 1).
adjacent(r103, r104).
shared_edge(r103, r104, 1).
adjacent(r103, r110).
shared_edge(r103, r110, 1).
adjacent(r103, r113).
shared_edge(r103, r113, 1).
adjacent(r103, r120).
shared_edge(r103, r120, 3).
adjacent(r103, r130).
shared_edge(r103, r130, 1).
adjacent(r103, r138).
shared_edge(r103, r138, 2).
adjacent(r103, r139).
shared_edge(r103, r139, 1).
adjacent(r103, r152).
shared_edge(r103, r152, 1).
adjacent(r103, r79).
shared_edge(r103, r79, 1).
adjacent(r103, r94).
shared_edge(r103, r94, 8).
adjacent(r104, r105).
shared_edge(r104, r105, 1).
adjacent(r104, r110).
shared_edge(r104, r110, 1).
adjacent(r104, r95).
shared_edge(r104, r95, 1).
adjacent(r105, r90).
shared_edge(r105, r90, 1).
adjacent(r105, r96).
shared_edge(r105, r96, 1).
adjacent(r105, r97).
shared_edge(r105, r97, 1).
adjacent(r106, r111).
shared_edge(r106, r111, 4).
adjacent(r106, r115).
shared_edge(r106, r115, 1).
adjacent(r106, r52).
shared_edge(r106, r52, 6).
adjacent(r106, r91).
shared_edge(r106, r91, 1).
adjacent(r106, r98).
shared_edge(r106, r98, 1).
adjacent(r106, r99).
shared_edge(r106, r99, 1).
adjacent(r107, r108).
shared_edge(r107, r108, 2).
adjacent(r107, r44).
shared_edge(r107, r44, 2).
adjacent(r108, r109).
shared_edge(r108, r109, 11).
adjacent(r108, r112).
shared_edge(r108, r112, 2).
adjacent(r108, r117).
shared_edge(r108, r117, 1).
adjacent(r108, r118).
shared_edge(r108, r118, 2).
adjacent(r108, r119).
shared_edge(r108, r119, 1).
adjacent(r108, r122).
shared_edge(r108, r122, 1).
adjacent(r108, r123).
shared_edge(r108, r123, 2).
adjacent(r108, r129).
shared_edge(r108, r129, 1).
adjacent(r108, r133).
shared_edge(r108, r133, 8).
adjacent(r108, r134).
shared_edge(r108, r134, 2).
adjacent(r108, r151).
shared_edge(r108, r151, 1).
adjacent(r108, r85).
shared_edge(r108, r85, 2).
adjacent(r11, r12).
shared_edge(r11, r12, 12).
adjacent(r110, r113).
shared_edge(r110, r113, 1).
adjacent(r110, r90).
shared_edge(r110, r90, 1).
adjacent(r111, r115).
shared_edge(r111, r115, 1).
adjacent(r111, r116).
shared_edge(r111, r116, 7).
adjacent(r111, r44).
shared_edge(r111, r44, 1).
adjacent(r111, r99).
shared_edge(r111, r99, 1).
adjacent(r112, r44).
shared_edge(r112, r44, 2).
adjacent(r113, r114).
shared_edge(r113, r114, 1).
adjacent(r113, r121).
shared_edge(r113, r121, 1).
adjacent(r114, r121).
shared_edge(r114, r121, 1).
adjacent(r114, r127).
shared_edge(r114, r127, 2).
adjacent(r114, r130).
shared_edge(r114, r130, 1).
adjacent(r114, r139).
shared_edge(r114, r139, 2).
adjacent(r114, r152).
shared_edge(r114, r152, 1).
adjacent(r114, r170).
shared_edge(r114, r170, 2).
adjacent(r114, r182).
shared_edge(r114, r182, 1).
adjacent(r114, r195).
shared_edge(r114, r195, 1).
adjacent(r114, r196).
shared_edge(r114, r196, 4).
adjacent(r114, r90).
shared_edge(r114, r90, 30).
adjacent(r115, r116).
shared_edge(r115, r116, 1).
adjacent(r115, r128).
shared_edge(r115, r128, 1).
adjacent(r115, r65).
shared_edge(r115, r65, 2).
adjacent(r116, r128).
shared_edge(r116, r128, 2).
adjacent(r116, r149).
shared_edge(r116, r149, 2).
adjacent(r116, r165).
shared_edge(r116, r165, 1).
adjacent(r116, r166).
shared_edge(r116, r166, 2).
adjacent(r116, r177).
shared_edge(r116, r177, 2).
adjacent(r116, r190).
shared_edge(r116, r190, 1).
adjacent(r116, r223).
shared_edge(r116, r223, 3).
adjacent(r116, r44).
shared_edge(r116, r44, 49).
adjacent(r117, r118).
shared_edge(r117, r118, 1).
adjacent(r117, r44).
shared_edge(r117, r44, 2).
adjacent(r118, r44).
shared_edge(r118, r44, 1).
adjacent(r119, r123).
shared_edge(r119, r123, 1).
adjacent(r119, r85).
shared_edge(r119, r85, 1).
adjacent(r119, r86).
shared_edge(r119, r86, 1).
adjacent(r120, r121).
shared_edge(r120, r121, 1).
adjacent(r120, r127).
shared_edge(r120, r127, 1).
adjacent(r120, r130).
shared_edge(r120, r130, 1).
adjacent(r121, r127).
shared_edge(r121, r127, 1).
adjacent(r122, r129).
shared_edge(r122, r129, 1).
adjacent(r122, r44).
shared_edge(r122, r44, 2).
adjacent(r123, r124).
shared_edge(r123, r124, 2).
adjacent(r123, r135).
shared_edge(r123, r135, 1).
adjacent(r124, r135).
shared_edge(r124, r135, 1).
adjacent(r124, r86).
shared_edge(r124, r86, 3).
adjacent(r125, r126).
shared_edge(r125, r126, 1).
adjacent(r125, r86).
shared_edge(r125, r86, 3).
adjacent(r126, r94).
shared_edge(r126, r94, 3).
adjacent(r128, r131).
shared_edge(r128, r131, 1).
adjacent(r128, r149).
shared_edge(r128, r149, 1).
adjacent(r128, r65).
shared_edge(r128, r65, 1).
adjacent(r129, r132).
shared_edge(r129, r132, 1).
adjacent(r129, r44).
shared_edge(r129, r44, 1).
adjacent(r13, r14).
shared_edge(r13, r14, 1).
adjacent(r13, r19).
shared_edge(r13, r19, 1).
adjacent(r13, r20).
shared_edge(r13, r20, 1).
adjacent(r13, r3).
shared_edge(r13, r3, 3).
adjacent(r130, r139).
shared_edge(r130, r139, 1).
adjacent(r131, r148).
shared_edge(r131, r148, 1).
adjacent(r131, r65).
shared_edge(r131, r65, 2).
adjacent(r132, r133).
shared_edge(r132, r133, 2).
adjacent(r132, r167).
shared_edge(r132, r167, 1).
adjacent(r132, r44).
shared_edge(r132, r44, 2).
adjacent(r133, r150).
shared_edge(r133, r150, 7).
adjacent(r133, r168).
shared_edge(r133, r168, 2).
adjacent(r133, r178).
shared_edge(r133, r178, 1).
adjacent(r133, r179).
shared_edge(r133, r179, 1).
adjacent(r133, r192).
shared_edge(r133, r192, 3).
adjacent(r134, r135).
shared_edge(r134, r135, 4).
adjacent(r134, r151).
shared_edge(r134, r151, 1).
adjacent(r134, r169).
shared_edge(r134, r169, 1).
adjacent(r134, r181).
shared_edge(r134, r181, 2).
adjacent(r134, r94).
shared_edge(r134, r94, 2).
adjacent(r135, r136).
shared_edge(r135, r136, 2).
adjacent(r135, r94).
shared_edge(r135, r94, 4).
adjacent(r136, r86).
shared_edge(r136, r86, 2).
adjacent(r137, r138).
shared_edge(r137, r138, 7).
adjacent(r137, r205).
shared_edge(r137, r205, 3).
adjacent(r137, r213).
shared_edge(r137, r213, 1).
adjacent(r137, r216).
shared_edge(r137, r216, 1).
adjacent(r137, r218).
shared_edge(r137, r218, 2).
adjacent(r137, r225).
shared_edge(r137, r225, 1).
adjacent(r137, r226).
shared_edge(r137, r226, 1).
adjacent(r137, r230).
shared_edge(r137, r230, 2).
adjacent(r137, r239).
shared_edge(r137, r239, 1).
adjacent(r137, r248).
shared_edge(r137, r248, 1).
adjacent(r137, r44).
shared_edge(r137, r44, 1).
adjacent(r137, r94).
shared_edge(r137, r94, 19).
adjacent(r138, r152).
shared_edge(r138, r152, 1).
adjacent(r138, r170).
shared_edge(r138, r170, 1).
adjacent(r138, r182).
shared_edge(r138, r182, 2).
adjacent(r138, r195).
shared_edge(r138, r195, 1).
adjacent(r138, r206).
shared_edge(r138, r206, 1).
adjacent(r138, r207).
shared_edge(r138, r207, 1).
adjacent(r14, r19).
shared_edge(r14, r19, 1).
adjacent(r14, r3).
shared_edge(r14, r3, 1).
adjacent(r14, r5).
shared_edge(r14, r5, 1).
adjacent(r140, r141).
shared_edge(r140, r141, 1).
adjacent(r140, r153).
shared_edge(r140, r153, 1).
adjacent(r140, r3).
shared_edge(r140, r3, 1).
adjacent(r140, r38).
shared_edge(r140, r38, 1).
adjacent(r141, r142).
shared_edge(r141, r142, 1).
adjacent(r141, r154).
shared_edge(r141, r154, 1).
adjacent(r141, r155).
shared_edge(r141, r155, 1).
adjacent(r141, r65).
shared_edge(r141, r65, 2).
adjacent(r142, r143).
shared_edge(r142, r143, 1).
adjacent(r142, r156).
shared_edge(r142, r156, 1).
adjacent(r142, r65).
shared_edge(r142, r65, 1).
adjacent(r143, r156).
shared_edge(r143, r156, 1).
adjacent(r143, r65).
shared_edge(r143, r65, 2).
adjacent(r144, r145).
shared_edge(r144, r145, 1).
adjacent(r144, r158).
shared_edge(r144, r158, 2).
adjacent(r144, r65).
shared_edge(r144, r65, 3).
adjacent(r145, r159).
shared_edge(r145, r159, 1).
adjacent(r145, r65).
shared_edge(r145, r65, 2).
adjacent(r146, r147).
shared_edge(r146, r147, 1).
adjacent(r146, r164).
shared_edge(r146, r164, 1).
adjacent(r146, r65).
shared_edge(r146, r65, 2).
adjacent(r147, r148).
shared_edge(r147, r148, 1).
adjacent(r147, r165).
shared_edge(r147, r165, 1).
adjacent(r147, r65).
shared_edge(r147, r65, 1).
adjacent(r148, r149).
shared_edge(r148, r149, 1).
adjacent(r148, r166).
shared_edge(r148, r166, 1).
adjacent(r15, r5).
shared_edge(r15, r5, 50).
adjacent(r150, r151).
shared_edge(r150, r151, 1).
adjacent(r150, r169).
shared_edge(r150, r169, 1).
adjacent(r150, r179).
shared_edge(r150, r179, 1).
adjacent(r151, r169).
shared_edge(r151, r169, 1).
adjacent(r152, r170).
shared_edge(r152, r170, 1).
adjacent(r153, r154).
shared_edge(r153, r154, 3).
adjacent(r153, r171).
shared_edge(r153, r171, 10).
adjacent(r153, r3).
shared_edge(r153, r3, 9).
adjacent(r154, r155).
shared_edge(r154, r155, 6).
adjacent(r154, r185).
shared_edge(r154, r185, 2).
adjacent(r154, r197).
shared_edge(r154, r197, 10).
adjacent(r154, r209).
shared_edge(r154, r209, 8).
adjacent(r154, r215).
shared_edge(r154, r215, 1).
adjacent(r154, r221).
shared_edge(r154, r221, 4).
adjacent(r154, r244).
shared_edge(r154, r244, 4).
adjacent(r154, r255).
shared_edge(r154, r255, 2).
adjacent(r154, r265).
shared_edge(r154, r265, 1).
adjacent(r154, r275).
shared_edge(r154, r275, 2).
adjacent(r155, r156).
shared_edge(r155, r156, 3).
adjacent(r155, r172).
shared_edge(r155, r172, 1).
adjacent(r155, r186).
shared_edge(r155, r186, 2).
adjacent(r155, r199).
shared_edge(r155, r199, 1).
adjacent(r156, r157).
shared_edge(r156, r157, 1).
adjacent(r157, r158).
shared_edge(r157, r158, 1).
adjacent(r157, r172).
shared_edge(r157, r172, 1).
adjacent(r157, r65).
shared_edge(r157, r65, 1).
adjacent(r158, r159).
shared_edge(r158, r159, 1).
adjacent(r158, r172).
shared_edge(r158, r172, 1).
adjacent(r158, r173).
shared_edge(r158, r173, 2).
adjacent(r158, r188).
shared_edge(r158, r188, 1).
adjacent(r159, r160).
shared_edge(r159, r160, 2).
adjacent(r16, r24).
shared_edge(r16, r24, 4).
adjacent(r16, r48).
shared_edge(r16, r48, 1).
adjacent(r16, r56).
shared_edge(r16, r56, 1).
adjacent(r16, r62).
shared_edge(r16, r62, 2).
adjacent(r16, r7).
shared_edge(r16, r7, 28).
adjacent(r16, r71).
shared_edge(r16, r71, 10).
adjacent(r16, r72).
shared_edge(r16, r72, 1).
adjacent(r16, r77).
shared_edge(r16, r77, 1).
adjacent(r16, r78).
shared_edge(r16, r78, 2).
adjacent(r16, r79).
shared_edge(r16, r79, 6).
adjacent(r16, r80).
shared_edge(r16, r80, 1).
adjacent(r16, r86).
shared_edge(r16, r86, 5).
adjacent(r16, r87).
shared_edge(r16, r87, 1).
adjacent(r16, r94).
shared_edge(r16, r94, 3).
adjacent(r160, r161).
shared_edge(r160, r161, 2).
adjacent(r160, r173).
shared_edge(r160, r173, 2).
adjacent(r160, r174).
shared_edge(r160, r174, 2).
adjacent(r160, r175).
shared_edge(r160, r175, 3).
adjacent(r160, r188).
shared_edge(r160, r188, 15).
adjacent(r160, r189).
shared_edge(r160, r189, 3).
adjacent(r160, r65).
shared_edge(r160, r65, 1).
adjacent(r161, r65).
shared_edge(r161, r65, 2).
adjacent(r162, r163).
shared_edge(r162, r163, 1).
adjacent(r162, r176).
shared_edge(r162, r176, 1).
adjacent(r162, r65).
shared_edge(r162, r65, 2).
adjacent(r163, r164).
shared_edge(r163, r164, 1).
adjacent(r163, r176).
shared_edge(r163, r176, 1).
adjacent(r163, r65).
shared_edge(r163, r65, 1).
adjacent(r164, r165).
shared_edge(r164, r165, 1).
adjacent(r164, r177).
shared_edge(r164, r177, 1).
adjacent(r165, r166).
shared_edge(r165, r166, 1).
adjacent(r167, r168).
shared_edge(r167, r168, 1).
adjacent(r167, r44).
shared_edge(r167, r44, 2).
adjacent(r168, r178).
shared_edge(r168, r178, 1).
adjacent(r169, r180).
shared_edge(r169, r180, 1).
adjacent(r17, r21).
shared_edge(r17, r21, 1).
adjacent(r17, r24).
shared_edge(r17, r24, 1).
adjacent(r17, r7).
shared_edge(r17, r7, 3).
adjacent(r17, r9).
shared_edge(r17, r9, 1).
adjacent(r171, r184).
shared_edge(r171, r184, 10).
adjacent(r171, r185).
shared_edge(r171, r185, 1).
adjacent(r171, r198).
shared_edge(r171, r198, 2).
adjacent(r172, r187).
shared_edge(r172, r187, 1).
adjacent(r174, r175).
shared_edge(r174, r175, 1).
adjacent(r174, r65).
shared_edge(r174, r65, 1).
adjacent(r175, r176).
shared_edge(r175, r176, 1).
adjacent(r175, r189).
shared_edge(r175, r189, 2).
adjacent(r175, r65).
shared_edge(r175, r65, 5).
adjacent(r176, r177).
shared_edge(r176, r177, 1).
adjacent(r176, r190).
shared_edge(r176, r190, 3).
adjacent(r176, r65).
shared_edge(r176, r65, 1).
adjacent(r178, r191).
shared_edge(r178, r191, 1).
adjacent(r178, r44).
shared_edge(r178, r44, 1).
adjacent(r179, r180).
shared_edge(r179, r180, 1).
adjacent(r179, r193).
shared_edge(r179, r193, 1).
adjacent(r18, r20).
shared_edge(r18, r20, 1).
adjacent(r18, r22).
shared_edge(r18, r22, 3).
adjacent(r18, r23).
shared_edge(r18, r23, 1).
adjacent(r18, r25).
shared_edge(r18, r25, 1).
adjacent(r18, r26).
shared_edge(r18, r26, 1).
adjacent(r18, r28).
shared_edge(r18, r28, 44).
adjacent(r18, r3).
shared_edge(r18, r3, 55).
adjacent(r180, r181).
shared_edge(r180, r181, 1).
adjacent(r180, r194).
shared_edge(r180, r194, 1).
adjacent(r181, r94).
shared_edge(r181, r94, 1).
adjacent(r182, r195).
shared_edge(r182, r195, 1).
adjacent(r183, r283).
shared_edge(r183, r283, 8).
adjacent(r184, r197).
shared_edge(r184, r197, 12).
adjacent(r185, r197).
shared_edge(r185, r197, 1).
adjacent(r186, r187).
shared_edge(r186, r187, 1).
adjacent(r186, r199).
shared_edge(r186, r199, 1).
adjacent(r187, r188).
shared_edge(r187, r188, 1).
adjacent(r187, r200).
shared_edge(r187, r200, 1).
adjacent(r188, r190).
shared_edge(r188, r190, 7).
adjacent(r188, r200).
shared_edge(r188, r200, 1).
adjacent(r188, r209).
shared_edge(r188, r209, 36).
adjacent(r188, r210).
shared_edge(r188, r210, 1).
adjacent(r188, r228).
shared_edge(r188, r228, 2).
adjacent(r188, r246).
shared_edge(r188, r246, 1).
adjacent(r188, r256).
shared_edge(r188, r256, 1).
adjacent(r188, r44).
shared_edge(r188, r44, 2).
adjacent(r189, r190).
shared_edge(r189, r190, 1).
adjacent(r19, r20).
shared_edge(r19, r20, 1).
adjacent(r19, r23).
shared_edge(r19, r23, 1).
adjacent(r19, r27).
shared_edge(r19, r27, 2).
adjacent(r19, r32).
shared_edge(r19, r32, 1).
adjacent(r19, r33).
shared_edge(r19, r33, 1).
adjacent(r19, r34).
shared_edge(r19, r34, 2).
adjacent(r19, r5).
shared_edge(r19, r5, 14).
adjacent(r190, r201).
shared_edge(r190, r201, 2).
adjacent(r190, r210).
shared_edge(r190, r210, 4).
adjacent(r191, r192).
shared_edge(r191, r192, 1).
adjacent(r191, r44).
shared_edge(r191, r44, 2).
adjacent(r192, r193).
shared_edge(r192, r193, 1).
adjacent(r192, r203).
shared_edge(r192, r203, 1).
adjacent(r192, r204).
shared_edge(r192, r204, 2).
adjacent(r193, r194).
shared_edge(r193, r194, 1).
adjacent(r193, r94).
shared_edge(r193, r94, 1).
adjacent(r194, r94).
shared_edge(r194, r94, 2).
adjacent(r195, r208).
shared_edge(r195, r208, 1).
adjacent(r197, r198).
shared_edge(r197, r198, 2).
adjacent(r197, r214).
shared_edge(r197, r214, 13).
adjacent(r197, r217).
shared_edge(r197, r217, 5).
adjacent(r197, r220).
shared_edge(r197, r220, 9).
adjacent(r197, r227).
shared_edge(r197, r227, 3).
adjacent(r197, r235).
shared_edge(r197, r235, 4).
adjacent(r197, r243).
shared_edge(r197, r243, 25).
adjacent(r197, r253).
shared_edge(r197, r253, 3).
adjacent(r197, r254).
shared_edge(r197, r254, 3).
adjacent(r197, r274).
shared_edge(r197, r274, 3).
adjacent(r199, r200).
shared_edge(r199, r200, 1).
adjacent(r199, r209).
shared_edge(r199, r209, 1).
adjacent(r2, r3).
shared_edge(r2, r3, 31).
adjacent(r20, r23).
shared_edge(r20, r23, 1).
adjacent(r200, r209).
shared_edge(r200, r209, 1).
adjacent(r201, r210).
shared_edge(r201, r210, 1).
adjacent(r201, r44).
shared_edge(r201, r44, 1).
adjacent(r202, r44).
shared_edge(r202, r44, 4).
adjacent(r203, r204).
shared_edge(r203, r204, 1).
adjacent(r203, r44).
shared_edge(r203, r44, 2).
adjacent(r204, r212).
shared_edge(r204, r212, 2).
adjacent(r204, r94).
shared_edge(r204, r94, 1).
adjacent(r205, r206).
shared_edge(r205, r206, 1).
adjacent(r206, r207).
shared_edge(r206, r207, 1).
adjacent(r206, r213).
shared_edge(r206, r213, 1).
adjacent(r207, r208).
shared_edge(r207, r208, 2).
adjacent(r208, r213).
shared_edge(r208, r213, 1).
adjacent(r208, r216).
shared_edge(r208, r216, 1).
adjacent(r208, r90).
shared_edge(r208, r90, 5).
adjacent(r209, r215).
shared_edge(r209, r215, 3).
adjacent(r209, r222).
shared_edge(r209, r222, 18).
adjacent(r209, r236).
shared_edge(r209, r236, 6).
adjacent(r209, r244).
shared_edge(r209, r244, 2).
adjacent(r209, r245).
shared_edge(r209, r245, 18).
adjacent(r209, r275).
shared_edge(r209, r275, 1).
adjacent(r21, r24).
shared_edge(r21, r24, 2).
adjacent(r21, r36).
shared_edge(r21, r36, 1).
adjacent(r210, r228).
shared_edge(r210, r228, 1).
adjacent(r210, r44).
shared_edge(r210, r44, 5).
adjacent(r211, r44).
shared_edge(r211, r44, 6).
adjacent(r212, r44).
shared_edge(r212, r44, 4).
adjacent(r213, r216).
shared_edge(r213, r216, 1).
adjacent(r214, r227).
shared_edge(r214, r227, 1).
adjacent(r216, r219).
shared_edge(r216, r219, 1).
adjacent(r217, r220).
shared_edge(r217, r220, 1).
adjacent(r218, r219).
shared_edge(r218, r219, 1).
adjacent(r218, r225).
shared_edge(r218, r225, 1).
adjacent(r219, r225).
shared_edge(r219, r225, 1).
adjacent(r219, r90).
shared_edge(r219, r90, 3).
adjacent(r22, r25).
shared_edge(r22, r25, 1).
adjacent(r222, r236).
shared_edge(r222, r236, 2).
adjacent(r222, r237).
shared_edge(r222, r237, 2).
adjacent(r222, r256).
shared_edge(r222, r256, 6).
adjacent(r222, r266).
shared_edge(r222, r266, 4).
adjacent(r222, r285).
shared_edge(r222, r285, 4).
adjacent(r222, r290).
shared_edge(r222, r290, 2).
adjacent(r223, r44).
shared_edge(r223, r44, 3).
adjacent(r224, r44).
shared_edge(r224, r44, 20).
adjacent(r225, r226).
shared_edge(r225, r226, 1).
adjacent(r226, r230).
shared_edge(r226, r230, 1).
adjacent(r226, r90).
shared_edge(r226, r90, 1).
adjacent(r228, r44).
shared_edge(r228, r44, 1).
adjacent(r229, r44).
shared_edge(r229, r44, 4).
adjacent(r23, r27).
shared_edge(r23, r27, 1).
adjacent(r230, r231).
shared_edge(r230, r231, 1).
adjacent(r230, r234).
shared_edge(r230, r234, 1).
adjacent(r230, r239).
shared_edge(r230, r239, 1).
adjacent(r231, r232).
shared_edge(r231, r232, 1).
adjacent(r231, r234).
shared_edge(r231, r234, 1).
adjacent(r231, r90).
shared_edge(r231, r90, 1).
adjacent(r232, r234).
shared_edge(r232, r234, 1).
adjacent(r232, r240).
shared_edge(r232, r240, 1).
adjacent(r232, r90).
shared_edge(r232, r90, 3).
adjacent(r233, r44).
shared_edge(r233, r44, 25).
adjacent(r234, r239).
shared_edge(r234, r239, 1).
adjacent(r236, r237).
shared_edge(r236, r237, 2).
adjacent(r236, r266).
shared_edge(r236, r266, 2).
adjacent(r238, r44).
shared_edge(r238, r44, 10).
adjacent(r239, r240).
shared_edge(r239, r240, 1).
adjacent(r239, r249).
shared_edge(r239, r249, 2).
adjacent(r239, r250).
shared_edge(r239, r250, 1).
adjacent(r239, r258).
shared_edge(r239, r258, 1).
adjacent(r24, r36).
shared_edge(r24, r36, 2).
adjacent(r24, r48).
shared_edge(r24, r48, 1).
adjacent(r240, r241).
shared_edge(r240, r241, 1).
adjacent(r240, r250).
shared_edge(r240, r250, 1).
adjacent(r241, r242).
shared_edge(r241, r242, 1).
adjacent(r241, r251).
shared_edge(r241, r251, 1).
adjacent(r241, r90).
shared_edge(r241, r90, 1).
adjacent(r242, r252).
shared_edge(r242, r252, 1).
adjacent(r242, r90).
shared_edge(r242, r90, 2).
adjacent(r243, r273).
shared_edge(r243, r273, 4).
adjacent(r245, r266).
shared_edge(r245, r266, 3).
adjacent(r245, r275).
shared_edge(r245, r275, 3).
adjacent(r246, r256).
shared_edge(r246, r256, 1).
adjacent(r246, r44).
shared_edge(r246, r44, 2).
adjacent(r247, r44).
shared_edge(r247, r44, 6).
adjacent(r248, r249).
shared_edge(r248, r249, 2).
adjacent(r248, r258).
shared_edge(r248, r258, 1).
adjacent(r248, r44).
shared_edge(r248, r44, 4).
adjacent(r25, r26).
shared_edge(r25, r26, 1).
adjacent(r25, r29).
shared_edge(r25, r29, 1).
adjacent(r250, r251).
shared_edge(r250, r251, 1).
adjacent(r250, r259).
shared_edge(r250, r259, 1).
adjacent(r251, r252).
shared_edge(r251, r252, 1).
adjacent(r251, r260).
shared_edge(r251, r260, 1).
adjacent(r252, r261).
shared_edge(r252, r261, 2).
adjacent(r252, r90).
shared_edge(r252, r90, 2).
adjacent(r253, r254).
shared_edge(r253, r254, 1).
adjacent(r254, r255).
shared_edge(r254, r255, 1).
adjacent(r254, r265).
shared_edge(r254, r265, 1).
adjacent(r255, r265).
shared_edge(r255, r265, 1).
adjacent(r256, r257).
shared_edge(r256, r257, 3).
adjacent(r256, r286).
shared_edge(r256, r286, 1).
adjacent(r256, r291).
shared_edge(r256, r291, 1).
adjacent(r256, r44).
shared_edge(r256, r44, 1).
adjacent(r257, r44).
shared_edge(r257, r44, 3).
adjacent(r258, r259).
shared_edge(r258, r259, 1).
adjacent(r258, r267).
shared_edge(r258, r267, 1).
adjacent(r259, r260).
shared_edge(r259, r260, 2).
adjacent(r259, r267).
shared_edge(r259, r267, 1).
adjacent(r259, r268).
shared_edge(r259, r268, 1).
adjacent(r259, r276).
shared_edge(r259, r276, 2).
adjacent(r26, r27).
shared_edge(r26, r27, 1).
adjacent(r26, r30).
shared_edge(r26, r30, 1).
adjacent(r260, r261).
shared_edge(r260, r261, 1).
adjacent(r261, r262).
shared_edge(r261, r262, 1).
adjacent(r261, r268).
shared_edge(r261, r268, 1).
adjacent(r261, r269).
shared_edge(r261, r269, 1).
adjacent(r262, r263).
shared_edge(r262, r263, 1).
adjacent(r262, r270).
shared_edge(r262, r270, 1).
adjacent(r262, r90).
shared_edge(r262, r90, 1).
adjacent(r263, r264).
shared_edge(r263, r264, 1).
adjacent(r263, r271).
shared_edge(r263, r271, 1).
adjacent(r263, r64).
shared_edge(r263, r64, 1).
adjacent(r264, r272).
shared_edge(r264, r272, 1).
adjacent(r264, r64).
shared_edge(r264, r64, 2).
adjacent(r265, r274).
shared_edge(r265, r274, 1).
adjacent(r266, r285).
shared_edge(r266, r285, 1).
adjacent(r266, r289).
shared_edge(r266, r289, 1).
adjacent(r267, r276).
shared_edge(r267, r276, 2).
adjacent(r267, r44).
shared_edge(r267, r44, 4).
adjacent(r268, r269).
shared_edge(r268, r269, 1).
adjacent(r268, r277).
shared_edge(r268, r277, 1).
adjacent(r269, r270).
shared_edge(r269, r270, 1).
adjacent(r269, r278).
shared_edge(r269, r278, 1).
adjacent(r27, r30).
shared_edge(r27, r30, 2).
adjacent(r27, r31).
shared_edge(r27, r31, 2).
adjacent(r27, r39).
shared_edge(r27, r39, 1).
adjacent(r27, r43).
shared_edge(r27, r43, 1).
adjacent(r270, r271).
shared_edge(r270, r271, 1).
adjacent(r270, r279).
shared_edge(r270, r279, 1).
adjacent(r271, r272).
shared_edge(r271, r272, 1).
adjacent(r271, r280).
shared_edge(r271, r280, 1).
adjacent(r272, r281).
shared_edge(r272, r281, 1).
adjacent(r272, r37).
shared_edge(r272, r37, 1).
adjacent(r274, r275).
shared_edge(r274, r275, 2).
adjacent(r274, r284).
shared_edge(r274, r284, 1).
adjacent(r275, r284).
shared_edge(r275, r284, 3).
adjacent(r276, r277).
shared_edge(r276, r277, 2).
adjacent(r276, r279).
shared_edge(r276, r279, 3).
adjacent(r276, r293).
shared_edge(r276, r293, 3).
adjacent(r277, r278).
shared_edge(r277, r278, 1).
adjacent(r278, r279).
shared_edge(r278, r279, 2).
adjacent(r279, r280).
shared_edge(r279, r280, 3).
adjacent(r28, r29).
shared_edge(r28, r29, 2).
adjacent(r28, r3).
shared_edge(r28, r3, 3).
adjacent(r28, r38).
shared_edge(r28, r38, 39).
adjacent(r280, r281).
shared_edge(r280, r281, 1).
adjacent(r280, r287).
shared_edge(r280, r287, 2).
adjacent(r280, r294).
shared_edge(r280, r294, 1).
adjacent(r281, r282).
shared_edge(r281, r282, 1).
adjacent(r281, r287).
shared_edge(r281, r287, 1).
adjacent(r282, r288).
shared_edge(r282, r288, 1).
adjacent(r282, r37).
shared_edge(r282, r37, 2).
adjacent(r285, r289).
shared_edge(r285, r289, 2).
adjacent(r286, r292).
shared_edge(r286, r292, 1).
adjacent(r286, r44).
shared_edge(r286, r44, 2).
adjacent(r287, r288).
shared_edge(r287, r288, 1).
adjacent(r288, r294).
shared_edge(r288, r294, 2).
adjacent(r288, r37).
shared_edge(r288, r37, 1).
adjacent(r29, r30).
shared_edge(r29, r30, 2).
adjacent(r29, r38).
shared_edge(r29, r38, 1).
adjacent(r290, r291).
shared_edge(r290, r291, 1).
adjacent(r291, r292).
shared_edge(r291, r292, 1).
adjacent(r292, r44).
shared_edge(r292, r44, 1).
adjacent(r293, r44).
shared_edge(r293, r44, 1).
adjacent(r3, r4).
shared_edge(r3, r4, 1).
adjacent(r30, r38).
shared_edge(r30, r38, 1).
adjacent(r30, r43).
shared_edge(r30, r43, 1).
adjacent(r30, r52).
shared_edge(r30, r52, 1).
adjacent(r31, r32).
shared_edge(r31, r32, 1).
adjacent(r31, r39).
shared_edge(r31, r39, 1).
adjacent(r32, r33).
shared_edge(r32, r33, 1).
adjacent(r32, r40).
shared_edge(r32, r40, 1).
adjacent(r33, r34).
shared_edge(r33, r34, 1).
adjacent(r33, r40).
shared_edge(r33, r40, 1).
adjacent(r34, r35).
shared_edge(r34, r35, 1).
adjacent(r34, r40).
shared_edge(r34, r40, 1).
adjacent(r34, r41).
shared_edge(r34, r41, 1).
adjacent(r35, r42).
shared_edge(r35, r42, 2).
adjacent(r35, r46).
shared_edge(r35, r46, 1).
adjacent(r35, r47).
shared_edge(r35, r47, 2).
adjacent(r35, r5).
shared_edge(r35, r5, 13).
adjacent(r35, r54).
shared_edge(r35, r54, 1).
adjacent(r35, r55).
shared_edge(r35, r55, 3).
adjacent(r35, r61).
shared_edge(r35, r61, 1).
adjacent(r36, r37).
shared_edge(r36, r37, 2).
adjacent(r36, r49).
shared_edge(r36, r49, 1).
adjacent(r37, r49).
shared_edge(r37, r49, 3).
adjacent(r37, r64).
shared_edge(r37, r64, 61).
adjacent(r38, r50).
shared_edge(r38, r50, 3).
adjacent(r38, r51).
shared_edge(r38, r51, 1).
adjacent(r38, r65).
shared_edge(r38, r65, 34).
adjacent(r39, r40).
shared_edge(r39, r40, 2).
adjacent(r4, r5).
shared_edge(r4, r5, 2).
adjacent(r40, r41).
shared_edge(r40, r41, 1).
adjacent(r40, r43).
shared_edge(r40, r43, 1).
adjacent(r40, r44).
shared_edge(r40, r44, 10).
adjacent(r40, r52).
shared_edge(r40, r52, 2).
adjacent(r40, r58).
shared_edge(r40, r58, 1).
adjacent(r40, r68).
shared_edge(r40, r68, 2).
adjacent(r40, r82).
shared_edge(r40, r82, 2).
adjacent(r40, r92).
shared_edge(r40, r92, 1).
adjacent(r40, r98).
shared_edge(r40, r98, 1).
adjacent(r41, r42).
shared_edge(r41, r42, 1).
adjacent(r41, r45).
shared_edge(r41, r45, 1).
adjacent(r42, r45).
shared_edge(r42, r45, 1).
adjacent(r43, r52).
shared_edge(r43, r52, 1).
adjacent(r44, r45).
shared_edge(r44, r45, 5).
adjacent(r44, r46).
shared_edge(r44, r46, 1).
adjacent(r44, r53).
shared_edge(r44, r53, 2).
adjacent(r44, r54).
shared_edge(r44, r54, 1).
adjacent(r44, r59).
shared_edge(r44, r59, 2).
adjacent(r44, r60).
shared_edge(r44, r60, 1).
adjacent(r44, r61).
shared_edge(r44, r61, 1).
adjacent(r44, r69).
shared_edge(r44, r69, 1).
adjacent(r44, r74).
shared_edge(r44, r74, 2).
adjacent(r44, r83).
shared_edge(r44, r83, 1).
adjacent(r44, r93).
shared_edge(r44, r93, 2).
adjacent(r44, r94).
shared_edge(r44, r94, 24).
adjacent(r44, r99).
shared_edge(r44, r99, 3).
adjacent(r45, r46).
shared_edge(r45, r46, 1).
adjacent(r46, r47).
shared_edge(r46, r47, 1).
adjacent(r47, r53).
shared_edge(r47, r53, 1).
adjacent(r48, r49).
shared_edge(r48, r49, 1).
adjacent(r48, r56).
shared_edge(r48, r56, 1).
adjacent(r49, r56).
shared_edge(r49, r56, 1).
adjacent(r49, r63).
shared_edge(r49, r63, 1).
adjacent(r49, r64).
shared_edge(r49, r64, 1).
adjacent(r5, r6).
shared_edge(r5, r6, 6).
adjacent(r5, r61).
shared_edge(r5, r61, 1).
adjacent(r5, r69).
shared_edge(r5, r69, 1).
adjacent(r5, r7).
shared_edge(r5, r7, 41).
adjacent(r5, r70).
shared_edge(r5, r70, 4).
adjacent(r5, r71).
shared_edge(r5, r71, 1).
adjacent(r5, r76).
shared_edge(r5, r76, 7).
adjacent(r5, r77).
shared_edge(r5, r77, 2).
adjacent(r5, r84).
shared_edge(r5, r84, 1).
adjacent(r5, r87).
shared_edge(r5, r87, 1).
adjacent(r50, r51).
shared_edge(r50, r51, 1).
adjacent(r50, r57).
shared_edge(r50, r57, 1).
adjacent(r50, r66).
shared_edge(r50, r66, 1).
adjacent(r51, r52).
shared_edge(r51, r52, 1).
adjacent(r51, r57).
shared_edge(r51, r57, 1).
adjacent(r52, r57).
shared_edge(r52, r57, 1).
adjacent(r52, r58).
shared_edge(r52, r58, 2).
adjacent(r52, r67).
shared_edge(r52, r67, 5).
adjacent(r52, r68).
shared_edge(r52, r68, 1).
adjacent(r52, r82).
shared_edge(r52, r82, 1).
adjacent(r52, r91).
shared_edge(r52, r91, 2).
adjacent(r52, r92).
shared_edge(r52, r92, 2).
adjacent(r52, r98).
shared_edge(r52, r98, 1).
adjacent(r53, r54).
shared_edge(r53, r54, 1).
adjacent(r54, r55).
shared_edge(r54, r55, 1).
adjacent(r55, r59).
shared_edge(r55, r59, 1).
adjacent(r55, r60).
shared_edge(r55, r60, 1).
adjacent(r56, r63).
shared_edge(r56, r63, 1).
adjacent(r57, r67).
shared_edge(r57, r67, 1).
adjacent(r58, r68).
shared_edge(r58, r68, 1).
adjacent(r59, r60).
shared_edge(r59, r60, 1).
adjacent(r60, r61).
shared_edge(r60, r61, 1).
adjacent(r62, r63).
shared_edge(r62, r63, 1).
adjacent(r62, r72).
shared_edge(r62, r72, 1).
adjacent(r63, r64).
shared_edge(r63, r64, 1).
adjacent(r64, r72).
shared_edge(r64, r72, 1).
adjacent(r64, r81).
shared_edge(r64, r81, 2).
adjacent(r64, r89).
shared_edge(r64, r89, 1).
adjacent(r64, r90).
shared_edge(r64, r90, 52).
adjacent(r65, r66).
shared_edge(r65, r66, 1).
adjacent(r65, r73).
shared_edge(r65, r73, 2).
adjacent(r65, r91).
shared_edge(r65, r91, 5).
adjacent(r66, r67).
shared_edge(r66, r67, 1).
adjacent(r66, r73).
shared_edge(r66, r73, 1).
adjacent(r67, r73).
shared_edge(r67, r73, 2).
adjacent(r67, r91).
shared_edge(r67, r91, 1).
adjacent(r69, r70).
shared_edge(r69, r70, 1).
adjacent(r69, r74).
shared_edge(r69, r74, 1).
adjacent(r7, r8).
shared_edge(r7, r8, 2).
adjacent(r70, r75).
shared_edge(r70, r75, 2).
adjacent(r70, r84).
shared_edge(r70, r84, 1).
adjacent(r71, r78).
shared_edge(r71, r78, 3).
adjacent(r72, r80).
shared_edge(r72, r80, 1).
adjacent(r73, r91).
shared_edge(r73, r91, 1).
adjacent(r74, r75).
shared_edge(r74, r75, 1).
adjacent(r75, r83).
shared_edge(r75, r83, 1).
adjacent(r76, r85).
shared_edge(r76, r85, 2).
adjacent(r76, r86).
shared_edge(r76, r86, 1).
adjacent(r76, r87).
shared_edge(r76, r87, 2).
adjacent(r77, r78).
shared_edge(r77, r78, 1).
adjacent(r79, r88).
shared_edge(r79, r88, 1).
adjacent(r79, r95).
shared_edge(r79, r95, 2).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r80, r81).
shared_edge(r80, r81, 1).
adjacent(r80, r88).
shared_edge(r80, r88, 1).
adjacent(r81, r89).
shared_edge(r81, r89, 1).
adjacent(r82, r92).
shared_edge(r82, r92, 1).
adjacent(r83, r84).
shared_edge(r83, r84, 2).
adjacent(r84, r85).
shared_edge(r84, r85, 3).
adjacent(r84, r93).
shared_edge(r84, r93, 1).
adjacent(r85, r86).
shared_edge(r85, r86, 7).
adjacent(r86, r87).
shared_edge(r86, r87, 4).
adjacent(r86, r94).
shared_edge(r86, r94, 20).
adjacent(r88, r89).
shared_edge(r88, r89, 1).
adjacent(r88, r96).
shared_edge(r88, r96, 1).
adjacent(r89, r97).
shared_edge(r89, r97, 1).
adjacent(r90, r97).
shared_edge(r90, r97, 3).
adjacent(r95, r96).
shared_edge(r95, r96, 1).
adjacent(r96, r97).
shared_edge(r96, r97, 1).
adjacent(r98, r99).
shared_edge(r98, r99, 1).
