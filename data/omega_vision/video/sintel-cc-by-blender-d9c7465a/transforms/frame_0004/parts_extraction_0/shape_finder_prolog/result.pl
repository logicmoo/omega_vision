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

region(r1, '#a0adb3', 19, centroid(2,1)).
polygon(r1, [xy(0,0),xy(0,3),xy(1,3),xy(3,1),xy(2,0),xy(4,0),xy(4,1),xy(5,0),xy(5,1),xy(6,0),xy(7,0),xy(0,0)]).
midline(r1, [xy(1,1),xy(1,2),xy(2,1)]).
fillpoint(r1, xy(2,1), 2).
fillpoint(r1, xy(1,2), 2).
fillpoint(r1, xy(1,1), 2).
fillpoint(r1, xy(7,0), 1).
fillpoint(r1, xy(6,0), 1).
region(r2, '#a8b5bc', 20, centroid(5,2)).
polygon(r2, [xy(0,4),xy(0,5),xy(1,4),xy(1,5),xy(2,4),xy(2,3),xy(3,2),xy(4,2),xy(4,3),xy(6,1),xy(6,2),xy(8,0),xy(8,1),xy(9,0),xy(9,1),xy(10,0),xy(0,4)]).
midline(r2, [xy(3,3)]).
fillpoint(r2, xy(3,3), 2).
fillpoint(r2, xy(10,0), 1).
fillpoint(r2, xy(9,1), 1).
fillpoint(r2, xy(9,0), 1).
fillpoint(r2, xy(8,1), 1).
region(r3, '#b0bec5', 102, centroid(5,10)).
polygon(r3, [xy(0,6),xy(0,25),xy(1,24),xy(1,23),xy(4,20),xy(4,18),xy(5,17),xy(4,16),xy(3,16),xy(1,14),xy(1,6),xy(2,5),xy(2,6),xy(3,5),xy(3,6),xy(4,5),xy(4,4),xy(5,3),xy(6,3),xy(7,2),xy(9,2),xy(11,0),xy(16,0),xy(16,1),xy(15,2),xy(13,2),xy(12,3),xy(10,3),xy(9,4),xy(7,4),xy(6,5),xy(5,5),xy(0,6)]).
midline(r3, [xy(1,15),xy(2,17),xy(2,20),xy(1,22)]).
midline(r3, [xy(4,17)]).
midline(r3, [xy(5,4),xy(6,4),xy(7,3),xy(9,3),xy(11,1),xy(11,2),xy(12,1),xy(12,2),xy(13,1),xy(15,1)]).
fillpoint(r3, xy(2,20), 3).
fillpoint(r3, xy(2,19), 3).
fillpoint(r3, xy(2,18), 3).
fillpoint(r3, xy(2,17), 3).
fillpoint(r3, xy(15,1), 2).
region(r4, '#b6c5cd', 7, centroid(18,1)).
polygon(r4, [xy(16,2),xy(17,1),xy(17,2),xy(18,1),xy(18,0),xy(20,0),xy(16,2)]).
fillpoint(r4, xy(20,0), 1).
fillpoint(r4, xy(19,0), 1).
fillpoint(r4, xy(18,1), 1).
fillpoint(r4, xy(18,0), 1).
fillpoint(r4, xy(17,2), 1).
region(r5, '#bcc8cf', 49, centroid(12,5)).
polygon(r5, [xy(4,8),xy(4,9),xy(5,10),xy(5,11),xy(6,9),xy(7,9),xy(9,7),xy(8,6),xy(7,6),xy(6,7),xy(5,7),xy(4,8)]).
midline(r5, [xy(5,8),xy(5,9),xy(7,7),xy(7,8),xy(8,7),xy(12,5),xy(13,5)]).
fillpoint(r5, xy(13,5), 2).
fillpoint(r5, xy(12,5), 2).
fillpoint(r5, xy(10,6), 2).
fillpoint(r5, xy(8,7), 2).
fillpoint(r5, xy(7,8), 2).
region(r6, '#c0cdd6', 7, centroid(25,0)).
polygon(r6, [xy(23,1),xy(24,1),xy(25,0),xy(25,1),xy(26,0),xy(28,0),xy(23,1)]).
fillpoint(r6, xy(28,0), 1).
fillpoint(r6, xy(27,0), 1).
fillpoint(r6, xy(26,0), 1).
fillpoint(r6, xy(25,1), 1).
fillpoint(r6, xy(25,0), 1).
region(r7, '#c4d2db', 20, centroid(27,1)).
polygon(r7, [xy(21,3),xy(22,3),xy(23,2),xy(23,3),xy(24,2),xy(25,2),xy(26,1),xy(26,2),xy(27,1),xy(27,2),xy(28,1),xy(28,2),xy(29,2),xy(30,1),xy(29,0),xy(31,0),xy(31,1),xy(32,0),xy(21,3)]).
midline(r7, [xy(29,1)]).
fillpoint(r7, xy(29,1), 2).
fillpoint(r7, xy(32,0), 1).
fillpoint(r7, xy(31,1), 1).
fillpoint(r7, xy(31,0), 1).
fillpoint(r7, xy(30,1), 1).
region(r8, '#c8d5dd', 111, centroid(18,15)).
polygon(r8, [xy(9,11),xy(10,11),xy(10,12),xy(11,12),xy(12,11),xy(11,10),xy(12,9),xy(12,10),xy(14,8),xy(14,9),xy(15,8),xy(15,9),xy(16,8),xy(17,8),xy(18,7),xy(18,6),xy(19,5),xy(20,5),xy(20,6),xy(18,8),xy(9,11)]).
midline(r8, [xy(11,11)]).
midline(r8, [xy(11,20),xy(11,21)]).
midline(r8, [xy(14,26),xy(15,26)]).
midline(r8, [xy(18,29)]).
midline(r8, [xy(19,6)]).
midline(r8, [xy(30,3),xy(31,3)]).
fillpoint(r8, xy(31,3), 2).
fillpoint(r8, xy(30,3), 2).
fillpoint(r8, xy(19,6), 2).
fillpoint(r8, xy(18,29), 2).
fillpoint(r8, xy(15,26), 2).
region(r9, '#c4d2db', 7, centroid(39,0)).
polygon(r9, [xy(36,0),xy(42,0),xy(36,0)]).
fillpoint(r9, xy(42,0), 1).
fillpoint(r9, xy(41,0), 1).
fillpoint(r9, xy(40,0), 1).
fillpoint(r9, xy(39,0), 1).
fillpoint(r9, xy(38,0), 1).
region(r10, '#c8d5dd', 11, centroid(41,1)).
polygon(r10, [xy(37,1),xy(42,1),xy(43,0),xy(43,1),xy(44,0),xy(44,1),xy(45,0),xy(37,1)]).
fillpoint(r10, xy(45,0), 1).
fillpoint(r10, xy(44,1), 1).
fillpoint(r10, xy(44,0), 1).
fillpoint(r10, xy(43,1), 1).
fillpoint(r10, xy(43,0), 1).
region(r11, '#cddbe3', 334, centroid(31,17)).
polygon(r11, [xy(12,18),xy(12,19),xy(13,19),xy(14,20),xy(13,21),xy(13,22),xy(14,22),xy(15,21),xy(15,22),xy(16,23),xy(16,25),xy(18,25),xy(20,27),xy(19,28),xy(21,30),xy(22,30),xy(23,29),xy(21,27),xy(22,26),xy(22,25),xy(20,23),xy(20,20),xy(19,19),xy(18,19),xy(17,18),xy(20,15),xy(19,14),xy(17,14),xy(16,13),xy(15,13),xy(13,11),xy(13,10),xy(15,10),xy(15,11),xy(16,10),xy(16,9),xy(17,9),xy(17,10),xy(22,5),xy(24,5),xy(25,4),xy(27,4),xy(28,5),xy(28,6),xy(26,8),xy(25,8),xy(24,9),xy(21,9),xy(20,10),xy(19,10),xy(20,11),xy(12,18)]).
midline(r11, [xy(14,11),xy(15,12)]).
midline(r11, [xy(14,18),xy(16,16),xy(16,15),xy(17,16),xy(16,17),xy(16,19),xy(17,19),xy(17,22),xy(18,21),xy(18,23),xy(20,25)]).
midline(r11, [xy(14,21)]).
midline(r11, [xy(19,9),xy(20,8),xy(20,9),xy(22,7),xy(24,7),xy(25,6),xy(26,6)]).
midline(r11, [xy(19,15)]).
midline(r11, [xy(20,28),xy(21,28),xy(21,29),xy(22,29)]).
midline(r11, [xy(34,3),xy(36,2)]).
midline(r11, [xy(35,31),xy(39,31),xy(40,30),xy(41,30),xy(43,28),xy(43,29)]).
midline(r11, [xy(46,1),xy(49,1),xy(50,2)]).
midline(r11, [xy(49,23),xy(50,22),xy(52,21)]).
midline(r11, [xy(56,3),xy(57,3),xy(57,4)]).
fillpoint(r11, xy(50,22), 3).
fillpoint(r11, xy(49,23), 3).
fillpoint(r11, xy(41,30), 3).
fillpoint(r11, xy(40,30), 3).
fillpoint(r11, xy(39,31), 3).
region(r12, '#c8d5dd', 25, centroid(56,1)).
polygon(r12, [xy(50,0),xy(51,0),xy(51,1),xy(52,0),xy(52,1),xy(53,0),xy(53,1),xy(54,0),xy(54,1),xy(55,0),xy(55,1),xy(56,0),xy(56,1),xy(57,0),xy(57,1),xy(58,0),xy(59,1),xy(58,2),xy(59,3),xy(59,4),xy(60,3),xy(60,1),xy(50,0)]).
midline(r12, [xy(58,1),xy(59,2)]).
fillpoint(r12, xy(59,2), 2).
fillpoint(r12, xy(58,1), 2).
fillpoint(r12, xy(60,3), 1).
fillpoint(r12, xy(60,2), 1).
fillpoint(r12, xy(60,1), 1).
region(r13, '#c4d2db', 7, centroid(61,1)).
polygon(r13, [xy(59,0),xy(61,0),xy(61,3),xy(62,3),xy(59,0)]).
fillpoint(r13, xy(62,3), 1).
fillpoint(r13, xy(61,3), 1).
fillpoint(r13, xy(61,2), 1).
fillpoint(r13, xy(61,1), 1).
fillpoint(r13, xy(61,0), 1).
region(r14, '#c0cdd6', 7, centroid(63,1)).
polygon(r14, [xy(62,0),xy(62,2),xy(63,1),xy(63,2),xy(64,2),xy(62,0)]).
fillpoint(r14, xy(64,2), 1).
fillpoint(r14, xy(63,2), 1).
fillpoint(r14, xy(63,1), 1).
fillpoint(r14, xy(63,0), 1).
fillpoint(r14, xy(62,2), 1).
region(r16, '#c0cdd6', 17, centroid(70,2)).
polygon(r16, [xy(65,0),xy(65,1),xy(69,1),xy(69,2),xy(70,1),xy(70,2),xy(72,2),xy(72,3),xy(73,2),xy(74,3),xy(73,4),xy(74,4),xy(65,0)]).
midline(r16, [xy(73,3)]).
fillpoint(r16, xy(73,3), 2).
fillpoint(r16, xy(74,4), 1).
fillpoint(r16, xy(74,3), 1).
fillpoint(r16, xy(73,4), 1).
fillpoint(r16, xy(73,2), 1).
region(r17, '#bcc8cf', 19, centroid(72,1)).
polygon(r17, [xy(66,0),xy(71,0),xy(71,1),xy(72,0),xy(72,1),xy(73,0),xy(73,1),xy(74,1),xy(74,2),xy(75,1),xy(75,4),xy(76,3),xy(77,3),xy(66,0)]).
fillpoint(r17, xy(77,3), 1).
fillpoint(r17, xy(76,3), 1).
fillpoint(r17, xy(75,4), 1).
fillpoint(r17, xy(75,3), 1).
fillpoint(r17, xy(75,2), 1).
region(r18, '#b6c5cd', 13, centroid(77,1)).
polygon(r18, [xy(74,0),xy(76,0),xy(76,2),xy(77,2),xy(78,1),xy(79,2),xy(78,3),xy(79,3),xy(74,0)]).
midline(r18, [xy(77,1),xy(78,2)]).
fillpoint(r18, xy(78,2), 2).
fillpoint(r18, xy(77,1), 2).
fillpoint(r18, xy(79,3), 1).
fillpoint(r18, xy(79,2), 1).
fillpoint(r18, xy(78,3), 1).
region(r19, '#b0bec5', 15, centroid(81,2)).
polygon(r19, [xy(78,0),xy(79,0),xy(79,1),xy(80,0),xy(81,0),xy(82,1),xy(82,2),xy(81,3),xy(80,2),xy(80,3),xy(82,3),xy(82,4),xy(78,0)]).
midline(r19, [xy(80,1),xy(81,1),xy(81,2)]).
fillpoint(r19, xy(81,2), 2).
fillpoint(r19, xy(81,1), 2).
fillpoint(r19, xy(80,1), 2).
fillpoint(r19, xy(82,4), 1).
fillpoint(r19, xy(82,3), 1).
region(r20, '#a8b5bc', 51, centroid(88,5)).
polygon(r20, [xy(82,0),xy(83,0),xy(83,4),xy(86,4),xy(87,5),xy(88,5),xy(89,4),xy(85,0),xy(84,0),xy(82,0)]).
midline(r20, [xy(85,2),xy(87,3),xy(87,4),xy(88,4),xy(89,5),xy(90,5),xy(94,9),xy(94,10)]).
fillpoint(r20, xy(85,2), 3).
fillpoint(r20, xy(94,10), 2).
fillpoint(r20, xy(94,9), 2).
fillpoint(r20, xy(93,8), 2).
fillpoint(r20, xy(92,7), 2).
region(r21, '#a0adb3', 49, centroid(92,3)).
polygon(r21, [xy(86,0),xy(87,0),xy(87,1),xy(88,0),xy(95,0),xy(95,6),xy(94,7),xy(90,3),xy(89,3),xy(88,2),xy(86,0)]).
midline(r21, [xy(88,1),xy(89,1),xy(89,2),xy(92,2),xy(92,3),xy(93,2),xy(93,4),xy(94,6)]).
fillpoint(r21, xy(93,4), 3).
fillpoint(r21, xy(93,3), 3).
fillpoint(r21, xy(93,2), 3).
fillpoint(r21, xy(92,3), 3).
fillpoint(r21, xy(92,2), 3).
region(r23, '#c4d2db', 17, centroid(68,3)).
polygon(r23, [xy(64,3),xy(65,2),xy(65,3),xy(66,2),xy(66,3),xy(67,2),xy(67,3),xy(68,2),xy(68,3),xy(70,3),xy(70,5),xy(71,5),xy(72,4),xy(71,3),xy(64,3)]).
midline(r23, [xy(71,4)]).
fillpoint(r23, xy(71,4), 2).
fillpoint(r23, xy(72,4), 1).
fillpoint(r23, xy(71,5), 1).
fillpoint(r23, xy(71,3), 1).
fillpoint(r23, xy(70,5), 1).
region(r25, '#c0cdd6', 40, centroid(11,10)).
polygon(r25, [xy(5,12),xy(6,11),xy(6,10),xy(7,10),xy(7,12),xy(6,13),xy(7,13),xy(7,14),xy(8,14),xy(8,15),xy(9,14),xy(10,15),xy(8,17),xy(8,18),xy(9,17),xy(5,12)]).
midline(r25, [xy(6,12)]).
midline(r25, [xy(9,15)]).
fillpoint(r25, xy(9,15), 2).
fillpoint(r25, xy(6,12), 2).
fillpoint(r25, xy(20,3), 1).
fillpoint(r25, xy(19,4), 1).
fillpoint(r25, xy(19,3), 1).
region(r26, '#d3e0e8', 292, centroid(43,14)).
polygon(r26, [xy(22,27),xy(23,27),xy(23,28),xy(24,29),xy(25,29),xy(26,28),xy(24,26),xy(24,25),xy(25,24),xy(26,24),xy(26,25),xy(25,26),xy(27,25),xy(29,25),xy(22,27)]).
midline(r26, [xy(24,27),xy(24,28),xy(25,28)]).
midline(r26, [xy(25,25)]).
midline(r26, [xy(35,9),xy(36,9),xy(36,10),xy(37,9),xy(37,8),xy(38,9)]).
midline(r26, [xy(35,28),xy(36,28),xy(38,27),xy(39,27),xy(42,24),xy(42,25),xy(46,21),xy(46,22),xy(49,19)]).
midline(r26, [xy(40,5),xy(47,5),xy(49,4),xy(50,5),xy(52,6),xy(52,7),xy(53,6),xy(55,5)]).
midline(r26, [xy(43,11),xy(46,11),xy(47,10),xy(47,11),xy(50,11),xy(52,10),xy(54,12),xy(55,14),xy(55,15),xy(54,17),xy(53,18),xy(52,18)]).
fillpoint(r26, xy(52,10), 4).
fillpoint(r26, xy(54,12), 3).
fillpoint(r26, xy(53,11), 3).
fillpoint(r26, xy(53,10), 3).
fillpoint(r26, xy(53,6), 3).
region(r27, '#c8d5dd', 14, centroid(66,4)).
polygon(r27, [xy(62,4),xy(63,3),xy(63,4),xy(64,4),xy(64,5),xy(65,4),xy(65,5),xy(66,4),xy(67,4),xy(67,5),xy(68,4),xy(68,5),xy(69,4),xy(69,5),xy(62,4)]).
fillpoint(r27, xy(69,5), 1).
fillpoint(r27, xy(69,4), 1).
fillpoint(r27, xy(68,5), 1).
fillpoint(r27, xy(68,4), 1).
fillpoint(r27, xy(67,5), 1).
region(r31, '#a0adb3', 4, centroid(78,4)).
polygon(r31, [xy(76,4),xy(79,4),xy(76,4)]).
fillpoint(r31, xy(79,4), 1).
fillpoint(r31, xy(78,4), 1).
fillpoint(r31, xy(77,4), 1).
fillpoint(r31, xy(76,4), 1).
region(r39, '#c4d2db', 5, centroid(66,6)).
polygon(r39, [xy(65,6),xy(66,5),xy(66,6),xy(68,6),xy(65,6)]).
fillpoint(r39, xy(68,6), 1).
fillpoint(r39, xy(67,6), 1).
fillpoint(r39, xy(66,6), 1).
fillpoint(r39, xy(66,5), 1).
fillpoint(r39, xy(65,6), 1).
region(r47, '#a0adb3', 16, centroid(82,7)).
polygon(r47, [xy(80,7),xy(80,8),xy(81,8),xy(81,9),xy(82,9),xy(83,8),xy(82,7),xy(82,5),xy(83,5),xy(83,6),xy(84,5),xy(84,8),xy(83,9),xy(80,7)]).
fillpoint(r47, xy(84,8), 1).
fillpoint(r47, xy(84,7), 1).
fillpoint(r47, xy(84,6), 1).
fillpoint(r47, xy(84,5), 1).
fillpoint(r47, xy(83,9), 1).
region(r48, '#b0bec5', 67, centroid(91,12)).
polygon(r48, [xy(85,5),xy(85,8),xy(87,8),xy(89,10),xy(89,11),xy(90,11),xy(91,12),xy(91,13),xy(92,14),xy(92,18),xy(94,20),xy(95,19),xy(95,13),xy(92,10),xy(92,9),xy(90,7),xy(89,7),xy(88,6),xy(87,6),xy(86,5),xy(85,5)]).
midline(r48, [xy(86,6),xy(86,7),xy(88,7),xy(88,8),xy(90,9),xy(91,11),xy(92,11),xy(93,13),xy(93,18),xy(94,17),xy(94,15)]).
midline(r48, [xy(94,18),xy(94,19)]).
fillpoint(r48, xy(93,13), 3).
fillpoint(r48, xy(90,9), 3).
fillpoint(r48, xy(94,19), 2).
fillpoint(r48, xy(94,18), 2).
fillpoint(r48, xy(94,17), 2).
region(r49, '#b6c5cd', 115, centroid(10,26)).
polygon(r49, [xy(0,26),xy(0,28),xy(1,29),xy(2,28),xy(2,26),xy(1,25),xy(2,24),xy(2,23),xy(3,22),xy(3,24),xy(2,25),xy(0,26)]).
midline(r49, [xy(1,26),xy(1,28),xy(2,29)]).
midline(r49, [xy(2,8),xy(3,10),xy(3,11)]).
midline(r49, [xy(3,14)]).
midline(r49, [xy(6,16)]).
midline(r49, [xy(7,33)]).
midline(r49, [xy(30,39)]).
fillpoint(r49, xy(30,39), 2).
fillpoint(r49, xy(7,33), 2).
fillpoint(r49, xy(6,16), 2).
fillpoint(r49, xy(3,14), 2).
fillpoint(r49, xy(3,11), 2).
region(r50, '#c4d2db', 4, centroid(17,7)).
polygon(r50, [xy(16,6),xy(16,7),xy(17,6),xy(17,7),xy(16,6)]).
fillpoint(r50, xy(17,7), 1).
fillpoint(r50, xy(17,6), 1).
fillpoint(r50, xy(16,7), 1).
fillpoint(r50, xy(16,6), 1).
region(r51, '#cddbe3', 23, centroid(32,8)).
polygon(r51, [xy(26,10),xy(26,11),xy(27,10),xy(27,9),xy(28,8),xy(28,9),xy(29,8),xy(30,8),xy(30,9),xy(31,8),xy(31,7),xy(32,7),xy(32,8),xy(33,7),xy(33,8),xy(34,7),xy(34,8),xy(35,7),xy(35,6),xy(36,6),xy(36,7),xy(37,6),xy(38,6),xy(26,10)]).
fillpoint(r51, xy(38,6), 1).
fillpoint(r51, xy(37,6), 1).
fillpoint(r51, xy(36,7), 1).
fillpoint(r51, xy(36,6), 1).
fillpoint(r51, xy(35,7), 1).
region(r52, '#d7e4ed', 206, centroid(41,18)).
polygon(r52, [xy(26,26),xy(26,27),xy(27,26),xy(27,27),xy(28,26),xy(28,27),xy(30,25),xy(31,26),xy(31,27),xy(30,28),xy(29,28),xy(26,26)]).
midline(r52, [xy(29,27),xy(30,26),xy(30,27),xy(32,26),xy(34,26),xy(35,25),xy(37,24),xy(38,22),xy(38,20),xy(39,20),xy(42,17),xy(43,17),xy(45,16),xy(45,17),xy(46,16),xy(47,16)]).
midline(r52, [xy(37,12),xy(40,12),xy(40,13),xy(41,13)]).
midline(r52, [xy(42,9)]).
midline(r52, [xy(50,15),xy(50,16),xy(51,15),xy(51,16),xy(52,15)]).
fillpoint(r52, xy(43,17), 5).
fillpoint(r52, xy(42,17), 5).
fillpoint(r52, xy(41,18), 5).
fillpoint(r52, xy(40,19), 5).
fillpoint(r52, xy(39,20), 5).
region(r53, '#cddbe3', 6, centroid(56,7)).
polygon(r53, [xy(55,7),xy(55,9),xy(56,7),xy(56,6),xy(57,7),xy(55,7)]).
fillpoint(r53, xy(57,7), 1).
fillpoint(r53, xy(56,7), 1).
fillpoint(r53, xy(56,6), 1).
fillpoint(r53, xy(55,9), 1).
fillpoint(r53, xy(55,8), 1).
region(r57, '#585d5e', 279, centroid(65,18)).
polygon(r57, [xy(58,7),xy(58,10),xy(59,11),xy(59,15),xy(58,16),xy(58,17),xy(59,18),xy(59,19),xy(58,20),xy(58,23),xy(59,24),xy(59,25),xy(58,26),xy(58,27),xy(59,28),xy(60,28),xy(61,27),xy(61,22),xy(62,21),xy(63,21),xy(64,22),xy(64,23),xy(65,24),xy(65,26),xy(67,28),xy(67,30),xy(68,31),xy(68,32),xy(69,33),xy(68,34),xy(68,35),xy(67,36),xy(67,37),xy(68,38),xy(69,38),xy(70,37),xy(70,38),xy(71,36),xy(71,33),xy(70,32),xy(70,31),xy(69,30),xy(69,29),xy(68,28),xy(68,20),xy(70,18),xy(69,17),xy(68,17),xy(67,16),xy(67,15),xy(69,13),xy(70,14),xy(72,12),xy(74,12),xy(75,11),xy(77,11),xy(78,10),xy(78,9),xy(77,8),xy(75,8),xy(73,10),xy(71,10),xy(69,8),xy(67,10),xy(64,10),xy(63,9),xy(63,7),xy(62,6),xy(60,6),xy(59,7),xy(58,7)]).
midline(r57, [xy(59,23),xy(60,23),xy(60,25),xy(59,26),xy(59,27),xy(60,26),xy(60,27)]).
midline(r57, [xy(60,8),xy(61,8),xy(61,10),xy(62,11),xy(63,13),xy(63,15),xy(62,16),xy(62,17),xy(63,16),xy(63,17),xy(64,17),xy(64,18),xy(65,18),xy(65,19)]).
midline(r57, [xy(60,20),xy(60,21),xy(61,20)]).
midline(r57, [xy(64,14),xy(66,13),xy(68,11),xy(68,12),xy(69,11),xy(69,10),xy(70,11),xy(70,12),xy(72,11),xy(73,11),xy(74,10),xy(74,11),xy(75,10),xy(75,9),xy(76,9),xy(76,10),xy(77,9),xy(77,10)]).
midline(r57, [xy(66,22),xy(66,26),xy(67,25),xy(67,27),xy(68,29),xy(68,30),xy(69,31),xy(69,32),xy(70,33),xy(69,34),xy(70,34),xy(69,36)]).
midline(r57, [xy(69,18)]).
fillpoint(r57, xy(65,19), 5).
fillpoint(r57, xy(65,18), 5).
fillpoint(r57, xy(64,18), 5).
fillpoint(r57, xy(64,17), 5).
fillpoint(r57, xy(64,14), 5).
region(r77, '#a0adb3', 10, centroid(72,8)).
polygon(r77, [xy(70,8),xy(71,8),xy(71,9),xy(72,8),xy(72,9),xy(73,9),xy(74,8),xy(73,7),xy(74,7),xy(70,8)]).
midline(r77, [xy(73,8)]).
fillpoint(r77, xy(73,8), 2).
fillpoint(r77, xy(74,8), 1).
fillpoint(r77, xy(74,7), 1).
fillpoint(r77, xy(73,9), 1).
fillpoint(r77, xy(73,7), 1).
region(r92, '#c4d2db', 4, centroid(10,10)).
polygon(r92, [xy(9,10),xy(10,9),xy(10,10),xy(11,9),xy(9,10)]).
fillpoint(r92, xy(11,9), 1).
fillpoint(r92, xy(10,10), 1).
fillpoint(r92, xy(10,9), 1).
fillpoint(r92, xy(9,10), 1).
region(r93, '#d3e0e8', 49, centroid(21,14)).
polygon(r93, [xy(16,11),xy(17,11),xy(17,13),xy(19,13),xy(20,12),xy(18,10),xy(16,11)]).
midline(r93, [xy(18,11),xy(18,12),xy(19,12)]).
midline(r93, [xy(20,17),xy(21,17)]).
midline(r93, [xy(24,11)]).
midline(r93, [xy(24,16)]).
fillpoint(r93, xy(24,16), 2).
fillpoint(r93, xy(24,11), 2).
fillpoint(r93, xy(21,17), 2).
fillpoint(r93, xy(20,17), 2).
fillpoint(r93, xy(19,12), 2).
region(r104, '#b6c5cd', 107, centroid(87,23)).
polygon(r104, [xy(73,31),xy(74,31),xy(74,32),xy(75,31),xy(75,32),xy(76,31),xy(76,32),xy(77,31),xy(77,32),xy(78,31),xy(78,32),xy(79,31),xy(79,32),xy(80,31),xy(84,31),xy(84,32),xy(83,33),xy(80,33),xy(73,31)]).
midline(r104, [xy(80,32),xy(83,32)]).
midline(r104, [xy(86,31),xy(87,30),xy(89,29),xy(93,25),xy(93,26),xy(94,25),xy(94,22)]).
midline(r104, [xy(87,10),xy(88,12),xy(89,13),xy(88,14),xy(90,14),xy(90,15)]).
fillpoint(r104, xy(94,25), 2).
fillpoint(r104, xy(94,24), 2).
fillpoint(r104, xy(94,23), 2).
fillpoint(r104, xy(94,22), 2).
fillpoint(r104, xy(93,26), 2).
region(r108, '#585d5e', 9, centroid(31,11)).
polygon(r108, [xy(29,12),xy(30,11),xy(30,12),xy(31,12),xy(32,11),xy(31,10),xy(32,10),xy(33,11),xy(29,12)]).
midline(r108, [xy(31,11)]).
fillpoint(r108, xy(31,11), 2).
fillpoint(r108, xy(33,11), 1).
fillpoint(r108, xy(32,11), 1).
fillpoint(r108, xy(32,10), 1).
fillpoint(r108, xy(31,12), 1).
region(r114, '#c4d2db', 14, centroid(10,14)).
polygon(r114, [xy(8,11),xy(8,13),xy(9,12),xy(9,13),xy(10,13),xy(10,14),xy(11,13),xy(12,14),xy(10,16),xy(10,17),xy(11,16),xy(8,11)]).
midline(r114, [xy(11,14)]).
fillpoint(r114, xy(11,14), 2).
fillpoint(r114, xy(12,14), 1).
fillpoint(r114, xy(11,16), 1).
fillpoint(r114, xy(11,15), 1).
fillpoint(r114, xy(11,13), 1).
region(r123, '#a0adb3', 6, centroid(78,12)).
polygon(r123, [xy(77,13),xy(78,13),xy(79,12),xy(78,11),xy(79,11),xy(79,13),xy(77,13)]).
fillpoint(r123, xy(79,13), 1).
fillpoint(r123, xy(79,12), 1).
fillpoint(r123, xy(79,11), 1).
fillpoint(r123, xy(78,13), 1).
fillpoint(r123, xy(78,11), 1).
region(r128, '#bcc8cf', 5, centroid(86,12)).
polygon(r128, [xy(85,11),xy(86,11),xy(86,13),xy(87,13),xy(85,11)]).
fillpoint(r128, xy(87,13), 1).
fillpoint(r128, xy(86,13), 1).
fillpoint(r128, xy(86,12), 1).
fillpoint(r128, xy(86,11), 1).
fillpoint(r128, xy(85,11), 1).
region(r129, '#bcc8cf', 5, centroid(5,13)).
polygon(r129, [xy(4,12),xy(4,13),xy(5,13),xy(5,14),xy(6,14),xy(4,12)]).
fillpoint(r129, xy(6,14), 1).
fillpoint(r129, xy(5,14), 1).
fillpoint(r129, xy(5,13), 1).
fillpoint(r129, xy(4,13), 1).
fillpoint(r129, xy(4,12), 1).
region(r137, '#d3e0e8', 5, centroid(35,13)).
polygon(r137, [xy(34,12),xy(35,12),xy(35,14),xy(36,13),xy(34,12)]).
fillpoint(r137, xy(36,13), 1).
fillpoint(r137, xy(35,14), 1).
fillpoint(r137, xy(35,13), 1).
fillpoint(r137, xy(35,12), 1).
fillpoint(r137, xy(34,12), 1).
region(r139, '#a0adb3', 4, centroid(75,13)).
polygon(r139, [xy(74,13),xy(75,12),xy(75,13),xy(76,12),xy(74,13)]).
fillpoint(r139, xy(76,12), 1).
fillpoint(r139, xy(75,13), 1).
fillpoint(r139, xy(75,12), 1).
fillpoint(r139, xy(74,13), 1).
region(r142, '#585d5e', 20, centroid(78,14)).
polygon(r142, [xy(74,14),xy(74,16),xy(75,16),xy(76,15),xy(75,14),xy(76,16),xy(77,15),xy(77,14),xy(79,14),xy(80,13),xy(80,12),xy(81,12),xy(82,13),xy(81,14),xy(80,14),xy(74,14)]).
midline(r142, [xy(75,15)]).
midline(r142, [xy(81,13)]).
fillpoint(r142, xy(81,13), 2).
fillpoint(r142, xy(75,15), 2).
fillpoint(r142, xy(83,13), 1).
fillpoint(r142, xy(82,13), 1).
fillpoint(r142, xy(81,14), 1).
region(r143, '#a0adb3', 4, centroid(83,12)).
polygon(r143, [xy(82,12),xy(84,12),xy(84,13),xy(82,12)]).
fillpoint(r143, xy(84,13), 1).
fillpoint(r143, xy(84,12), 1).
fillpoint(r143, xy(83,12), 1).
fillpoint(r143, xy(82,12), 1).
region(r153, '#d7e4ed', 6, centroid(33,14)).
polygon(r153, [xy(31,14),xy(32,14),xy(33,13),xy(33,14),xy(34,13),xy(34,14),xy(31,14)]).
fillpoint(r153, xy(34,14), 1).
fillpoint(r153, xy(34,13), 1).
fillpoint(r153, xy(33,14), 1).
fillpoint(r153, xy(33,13), 1).
fillpoint(r153, xy(32,14), 1).
region(r196, '#c4d2db', 5, centroid(72,16)).
polygon(r196, [xy(71,16),xy(72,15),xy(72,17),xy(73,17),xy(71,16)]).
fillpoint(r196, xy(73,17), 1).
fillpoint(r196, xy(72,17), 1).
fillpoint(r196, xy(72,16), 1).
fillpoint(r196, xy(72,15), 1).
fillpoint(r196, xy(71,16), 1).
region(r205, '#c0cdd6', 86, centroid(83,24)).
polygon(r205, [xy(70,26),xy(70,28),xy(71,27),xy(72,27),xy(73,26),xy(75,26),xy(75,27),xy(74,28),xy(73,28),xy(70,26)]).
midline(r205, [xy(73,27),xy(74,27)]).
midline(r205, [xy(78,28)]).
midline(r205, [xy(82,28),xy(84,26),xy(84,27),xy(85,26),xy(85,25),xy(86,24),xy(86,26)]).
midline(r205, [xy(84,20)]).
midline(r205, [xy(87,18)]).
midline(r205, [xy(87,21)]).
fillpoint(r205, xy(87,21), 4).
fillpoint(r205, xy(88,21), 3).
fillpoint(r205, xy(87,22), 3).
fillpoint(r205, xy(87,20), 3).
fillpoint(r205, xy(86,22), 3).
region(r213, '#585d5e', 5, centroid(32,17)).
polygon(r213, [xy(31,17),xy(32,16),xy(32,17),xy(33,16),xy(33,17),xy(31,17)]).
fillpoint(r213, xy(33,17), 1).
fillpoint(r213, xy(33,16), 1).
fillpoint(r213, xy(32,17), 1).
fillpoint(r213, xy(32,16), 1).
fillpoint(r213, xy(31,17), 1).
region(r223, '#c0cdd6', 6, centroid(80,17)).
polygon(r223, [xy(78,17),xy(79,16),xy(79,17),xy(82,17),xy(78,17)]).
fillpoint(r223, xy(82,17), 1).
fillpoint(r223, xy(81,17), 1).
fillpoint(r223, xy(80,17), 1).
fillpoint(r223, xy(79,17), 1).
fillpoint(r223, xy(79,16), 1).
region(r229, '#bcc8cf', 62, centroid(84,26)).
polygon(r229, [xy(71,28),xy(71,30),xy(72,29),xy(72,28),xy(73,29),xy(73,30),xy(74,29),xy(74,30),xy(75,30),xy(76,29),xy(75,28),xy(76,30),xy(77,29),xy(77,30),xy(82,30),xy(83,29),xy(83,30),xy(84,29),xy(84,30),xy(85,30),xy(86,29),xy(85,28),xy(86,28),xy(87,27),xy(87,28),xy(88,28),xy(89,27),xy(88,26),xy(88,24),xy(89,23),xy(90,23),xy(91,22),xy(91,21),xy(89,19),xy(89,17),xy(88,16),xy(89,16),xy(71,28)]).
midline(r229, [xy(75,29)]).
midline(r229, [xy(85,29)]).
midline(r229, [xy(88,27),xy(89,25),xy(89,24),xy(90,24),xy(91,23),xy(91,24)]).
fillpoint(r229, xy(91,24), 2).
fillpoint(r229, xy(91,23), 2).
fillpoint(r229, xy(90,24), 2).
fillpoint(r229, xy(89,25), 2).
fillpoint(r229, xy(89,24), 2).
region(r232, '#585d5e', 12, centroid(27,18)).
polygon(r232, [xy(26,17),xy(26,18),xy(27,17),xy(28,17),xy(29,18),xy(28,19),xy(27,19),xy(26,20),xy(27,20),xy(29,19),xy(26,17)]).
midline(r232, [xy(27,18),xy(28,18)]).
fillpoint(r232, xy(28,18), 2).
fillpoint(r232, xy(27,18), 2).
fillpoint(r232, xy(29,19), 1).
fillpoint(r232, xy(29,18), 1).
fillpoint(r232, xy(28,19), 1).
region(r248, '#c4d2db', 57, centroid(13,27)).
polygon(r248, [xy(7,23),xy(8,22),xy(8,21),xy(9,20),xy(8,19),xy(9,18),xy(9,22),xy(8,23),xy(10,23),xy(10,24),xy(11,23),xy(12,24),xy(9,27),xy(9,28),xy(11,28),xy(12,27),xy(11,26),xy(13,24),xy(13,27),xy(12,28),xy(13,29),xy(14,28),xy(15,28),xy(16,27),xy(16,30),xy(15,31),xy(14,30),xy(16,31),xy(16,32),xy(17,32),xy(18,31),xy(18,32),xy(19,31),xy(19,32),xy(24,32),xy(7,23)]).
midline(r248, [xy(10,27),xy(11,27),xy(13,28),xy(14,29),xy(15,29),xy(15,30)]).
midline(r248, [xy(11,24)]).
fillpoint(r248, xy(15,30), 2).
fillpoint(r248, xy(15,29), 2).
fillpoint(r248, xy(14,29), 2).
fillpoint(r248, xy(13,28), 2).
fillpoint(r248, xy(11,27), 2).
region(r261, '#c8d5dd', 30, centroid(76,22)).
polygon(r261, [xy(70,22),xy(71,22),xy(71,23),xy(72,22),xy(72,23),xy(73,22),xy(73,24),xy(75,24),xy(76,23),xy(76,22),xy(77,23),xy(76,24),xy(77,24),xy(78,23),xy(78,24),xy(79,23),xy(79,22),xy(80,21),xy(80,20),xy(79,19),xy(75,19),xy(70,22)]).
fillpoint(r261, xy(80,22), 1).
fillpoint(r261, xy(80,21), 1).
fillpoint(r261, xy(80,20), 1).
fillpoint(r261, xy(80,19), 1).
fillpoint(r261, xy(80,18), 1).
region(r262, '#c4d2db', 54, centroid(79,24)).
polygon(r262, [xy(70,23),xy(70,25),xy(71,24),xy(72,24),xy(73,25),xy(72,26),xy(71,26),xy(70,23)]).
midline(r262, [xy(71,25),xy(72,25)]).
midline(r262, [xy(80,25),xy(81,24),xy(81,25),xy(82,24),xy(82,21)]).
fillpoint(r262, xy(82,24), 3).
fillpoint(r262, xy(82,23), 3).
fillpoint(r262, xy(81,25), 3).
fillpoint(r262, xy(81,24), 3).
fillpoint(r262, xy(80,25), 3).
region(r265, '#c0cdd6', 139, centroid(26,33)).
polygon(r265, [xy(5,24),xy(5,27),xy(7,29),xy(8,28),xy(8,27),xy(10,25),xy(9,24),xy(7,24),xy(6,23),xy(6,22),xy(7,21),xy(7,19),xy(8,20),xy(7,22),xy(5,24)]).
midline(r265, [xy(6,24),xy(7,26),xy(7,28),xy(9,30),xy(12,30),xy(12,31),xy(13,31),xy(14,32)]).
midline(r265, [xy(9,25)]).
midline(r265, [xy(31,36),xy(32,37)]).
midline(r265, [xy(35,39)]).
midline(r265, [xy(39,39),xy(45,39)]).
midline(r265, [xy(48,33),xy(48,34)]).
fillpoint(r265, xy(7,26), 3).
fillpoint(r265, xy(48,34), 2).
fillpoint(r265, xy(48,33), 2).
fillpoint(r265, xy(45,39), 2).
fillpoint(r265, xy(44,39), 2).
region(r274, '#cddbe3', 24, centroid(75,21)).
polygon(r274, [xy(72,19),xy(73,19),xy(73,20),xy(72,21),xy(73,21),xy(74,22),xy(74,23),xy(75,22),xy(75,23),xy(76,21),xy(74,19),xy(76,20),xy(79,20),xy(79,21),xy(78,22),xy(77,22),xy(72,19)]).
midline(r274, [xy(74,20),xy(74,21),xy(78,21)]).
fillpoint(r274, xy(78,21), 2).
fillpoint(r274, xy(77,21), 2).
fillpoint(r274, xy(75,21), 2).
fillpoint(r274, xy(74,21), 2).
fillpoint(r274, xy(74,20), 2).
region(r277, '#d3e0e8', 7, centroid(21,21)).
polygon(r277, [xy(21,20),xy(21,23),xy(22,22),xy(22,20),xy(21,20)]).
fillpoint(r277, xy(22,22), 1).
fillpoint(r277, xy(22,21), 1).
fillpoint(r277, xy(22,20), 1).
fillpoint(r277, xy(21,23), 1).
fillpoint(r277, xy(21,22), 1).
region(r286, '#d3e0e8', 16, centroid(33,23)).
polygon(r286, [xy(30,24),xy(31,23),xy(32,23),xy(32,24),xy(31,25),xy(33,24),xy(34,23),xy(32,21),xy(33,20),xy(34,21),xy(34,24),xy(30,24)]).
midline(r286, [xy(31,24),xy(33,23),xy(33,21)]).
fillpoint(r286, xy(33,23), 2).
fillpoint(r286, xy(33,21), 2).
fillpoint(r286, xy(31,24), 2).
fillpoint(r286, xy(34,24), 1).
fillpoint(r286, xy(34,23), 1).
region(r287, '#c8d5dd', 4, centroid(55,21)).
polygon(r287, [xy(54,21),xy(54,22),xy(55,21),xy(55,20),xy(54,21)]).
fillpoint(r287, xy(55,21), 1).
fillpoint(r287, xy(55,20), 1).
fillpoint(r287, xy(54,22), 1).
fillpoint(r287, xy(54,21), 1).
region(r292, '#a0adb3', 4, centroid(27,21)).
polygon(r292, [xy(25,21),xy(28,21),xy(25,21)]).
fillpoint(r292, xy(28,21), 1).
fillpoint(r292, xy(27,21), 1).
fillpoint(r292, xy(26,21), 1).
fillpoint(r292, xy(25,21), 1).
region(r298, '#bcc8cf', 34, centroid(7,29)).
polygon(r298, [xy(3,25),xy(3,28),xy(4,27),xy(4,23),xy(5,22),xy(5,23),xy(3,25)]).
midline(r298, [xy(4,28),xy(6,30)]).
fillpoint(r298, xy(6,30), 2).
fillpoint(r298, xy(5,29), 2).
fillpoint(r298, xy(4,28), 2).
fillpoint(r298, xy(15,34), 1).
fillpoint(r298, xy(14,34), 1).
region(r301, '#585d5e', 5, centroid(27,22)).
polygon(r301, [xy(25,22),xy(29,22),xy(25,22)]).
fillpoint(r301, xy(29,22), 1).
fillpoint(r301, xy(28,22), 1).
fillpoint(r301, xy(27,22), 1).
fillpoint(r301, xy(26,22), 1).
fillpoint(r301, xy(25,22), 1).
region(r315, '#c8d5dd', 4, centroid(52,24)).
polygon(r315, [xy(51,24),xy(52,23),xy(52,24),xy(53,23),xy(51,24)]).
fillpoint(r315, xy(53,23), 1).
fillpoint(r315, xy(52,24), 1).
fillpoint(r315, xy(52,23), 1).
fillpoint(r315, xy(51,24), 1).
region(r327, '#a0adb3', 20, centroid(62,27)).
polygon(r327, [xy(59,29),xy(60,29),xy(61,28),xy(61,29),xy(62,30),xy(64,28),xy(64,27),xy(62,25),xy(62,27),xy(64,25),xy(64,26),xy(59,29)]).
midline(r327, [xy(62,28),xy(62,29),xy(63,28),xy(63,27)]).
fillpoint(r327, xy(63,28), 2).
fillpoint(r327, xy(63,27), 2).
fillpoint(r327, xy(62,29), 2).
fillpoint(r327, xy(62,28), 2).
fillpoint(r327, xy(64,28), 1).
region(r332, '#c4d2db', 69, centroid(41,33)).
polygon(r332, [xy(26,33),xy(27,32),xy(27,33),xy(28,32),xy(30,32),xy(30,33),xy(31,33),xy(31,34),xy(32,33),xy(32,34),xy(33,33),xy(34,34),xy(33,35),xy(33,36),xy(34,35),xy(35,36),xy(34,37),xy(36,37),xy(36,38),xy(37,37),xy(37,38),xy(38,37),xy(38,38),xy(39,37),xy(40,37),xy(41,36),xy(41,37),xy(42,36),xy(42,37),xy(43,36),xy(43,37),xy(45,37),xy(46,36),xy(46,33),xy(45,32),xy(44,33),xy(44,35),xy(26,33)]).
midline(r332, [xy(33,34),xy(34,36)]).
midline(r332, [xy(44,36),xy(45,35),xy(45,33)]).
midline(r332, [xy(45,36)]).
fillpoint(r332, xy(45,36), 2).
fillpoint(r332, xy(45,35), 2).
fillpoint(r332, xy(45,34), 2).
fillpoint(r332, xy(45,33), 2).
fillpoint(r332, xy(44,36), 2).
region(r335, '#b6c5cd', 62, centroid(53,33)).
polygon(r335, [xy(48,38),xy(48,40),xy(49,40),xy(51,38),xy(50,37),xy(49,37),xy(51,36),xy(52,35),xy(52,34),xy(51,33),xy(51,31),xy(52,30),xy(52,28),xy(55,25),xy(55,32),xy(56,33),xy(56,35),xy(55,36),xy(53,36),xy(52,37),xy(48,38)]).
midline(r335, [xy(49,38),xy(49,39),xy(54,34),xy(53,33),xy(53,28),xy(54,27),xy(54,29)]).
midline(r335, [xy(54,33)]).
fillpoint(r335, xy(54,34), 3).
fillpoint(r335, xy(54,33), 3).
fillpoint(r335, xy(53,33), 3).
fillpoint(r335, xy(53,32), 3).
fillpoint(r335, xy(53,31), 3).
region(r336, '#b0bec5', 76, centroid(57,36)).
polygon(r336, [xy(50,40),xy(51,39),xy(51,40),xy(60,40),xy(61,39),xy(61,38),xy(60,37),xy(60,33),xy(58,31),xy(58,30),xy(56,28),xy(56,25),xy(50,40)]).
midline(r336, [xy(52,39),xy(53,38),xy(53,39),xy(54,38),xy(54,39),xy(56,38),xy(57,37),xy(57,38),xy(58,37),xy(58,33),xy(57,32),xy(57,30),xy(58,32),xy(59,33),xy(59,34)]).
midline(r336, [xy(58,38),xy(59,38)]).
fillpoint(r336, xy(59,38), 3).
fillpoint(r336, xy(58,38), 3).
fillpoint(r336, xy(58,37), 3).
fillpoint(r336, xy(58,36), 3).
fillpoint(r336, xy(57,38), 3).
region(r344, '#c8d5dd', 48, centroid(40,33)).
polygon(r344, [xy(31,32),xy(34,32),xy(34,33),xy(35,33),xy(35,35),xy(36,34),xy(36,33),xy(37,35),xy(36,36),xy(40,36),xy(41,35),xy(42,35),xy(43,34),xy(42,33),xy(40,33),xy(39,34),xy(38,34),xy(31,32)]).
midline(r344, [xy(36,35),xy(39,35),xy(40,34),xy(40,35),xy(41,34),xy(42,34)]).
midline(r344, [xy(46,28)]).
fillpoint(r344, xy(46,28), 2).
fillpoint(r344, xy(42,34), 2).
fillpoint(r344, xy(41,34), 2).
fillpoint(r344, xy(40,35), 2).
fillpoint(r344, xy(40,34), 2).
region(r349, '#b0bec5', 70, centroid(84,32)).
polygon(r349, [xy(72,31),xy(72,33),xy(73,32),xy(73,33),xy(75,33),xy(75,34),xy(76,33),xy(79,33),xy(80,34),xy(78,36),xy(77,35),xy(76,35),xy(72,31)]).
midline(r349, [xy(76,34),xy(78,34),xy(78,35),xy(79,34),xy(81,35),xy(82,35),xy(84,34),xy(85,34),xy(87,33),xy(88,32),xy(88,33),xy(90,31),xy(90,32),xy(91,31),xy(91,30),xy(92,29),xy(92,30),xy(94,28)]).
fillpoint(r349, xy(94,28), 2).
fillpoint(r349, xy(93,29), 2).
fillpoint(r349, xy(92,30), 2).
fillpoint(r349, xy(92,29), 2).
fillpoint(r349, xy(91,31), 2).
region(r355, '#b0bec5', 59, centroid(12,35)).
polygon(r355, [xy(0,29),xy(0,32),xy(2,34),xy(3,34),xy(4,33),xy(1,30),xy(0,29)]).
midline(r355, [xy(1,31),xy(1,32),xy(2,32),xy(2,33),xy(3,33),xy(5,34)]).
midline(r355, [xy(20,37)]).
fillpoint(r355, xy(20,37), 2).
fillpoint(r355, xy(5,34), 2).
fillpoint(r355, xy(3,33), 2).
fillpoint(r355, xy(2,33), 2).
fillpoint(r355, xy(2,32), 2).
region(r357, '#a8b5bc', 51, centroid(63,35)).
polygon(r357, [xy(59,30),xy(59,31),xy(60,30),xy(61,30),xy(62,31),xy(64,29),xy(65,30),xy(64,31),xy(64,32),xy(63,33),xy(63,36),xy(64,37),xy(64,38),xy(65,39),xy(64,40),xy(63,40),xy(62,39),xy(62,38),xy(61,37),xy(61,33),xy(60,32),xy(59,30)]).
midline(r357, [xy(60,31),xy(61,31),xy(61,32),xy(62,32),xy(62,37),xy(63,37),xy(63,39),xy(64,39)]).
midline(r357, [xy(63,31),xy(63,32),xy(64,30)]).
fillpoint(r357, xy(64,39), 2).
fillpoint(r357, xy(64,30), 2).
fillpoint(r357, xy(63,39), 2).
fillpoint(r357, xy(63,38), 2).
fillpoint(r357, xy(63,37), 2).
region(r361, '#a8b5bc', 73, centroid(83,36)).
polygon(r361, [xy(73,34),xy(74,34),xy(74,36),xy(75,35),xy(76,36),xy(74,38),xy(73,38),xy(73,40),xy(76,40),xy(77,39),xy(78,39),xy(79,38),xy(77,36),xy(80,36),xy(81,37),xy(80,38),xy(81,38),xy(82,37),xy(82,38),xy(84,38),xy(85,37),xy(84,36),xy(85,36),xy(86,35),xy(87,35),xy(87,36),xy(88,35),xy(88,36),xy(89,36),xy(90,35),xy(89,34),xy(90,34),xy(94,30),xy(95,30),xy(95,31),xy(91,35),xy(73,34)]).
midline(r361, [xy(74,39),xy(76,38),xy(75,36)]).
midline(r361, [xy(78,38),xy(79,37),xy(80,37)]).
midline(r361, [xy(83,37),xy(84,37),xy(86,36)]).
midline(r361, [xy(89,35),xy(91,34),xy(94,31)]).
fillpoint(r361, xy(76,38), 3).
fillpoint(r361, xy(94,31), 2).
fillpoint(r361, xy(93,32), 2).
fillpoint(r361, xy(92,33), 2).
fillpoint(r361, xy(91,34), 2).
region(r363, '#bcc8cf', 10, centroid(50,34)).
polygon(r363, [xy(49,35),xy(49,36),xy(50,36),xy(51,35),xy(50,34),xy(50,31),xy(49,35)]).
midline(r363, [xy(50,35)]).
fillpoint(r363, xy(50,35), 2).
fillpoint(r363, xy(51,35), 1).
fillpoint(r363, xy(51,34), 1).
fillpoint(r363, xy(50,36), 1).
fillpoint(r363, xy(50,34), 1).
region(r364, '#a0adb3', 44, centroid(68,36)).
polygon(r364, [xy(64,33),xy(64,36),xy(65,37),xy(65,38),xy(66,37),xy(66,36),xy(67,35),xy(67,33),xy(65,31),xy(65,32),xy(64,33)]).
midline(r364, [xy(65,33),xy(65,36),xy(66,35),xy(66,33)]).
midline(r364, [xy(71,39),xy(72,37)]).
fillpoint(r364, xy(72,37), 2).
fillpoint(r364, xy(71,39), 2).
fillpoint(r364, xy(66,35), 2).
fillpoint(r364, xy(66,34), 2).
fillpoint(r364, xy(66,33), 2).
region(r370, '#a8b5bc', 58, centroid(14,38)).
polygon(r370, [xy(0,33),xy(0,35),xy(1,34),xy(1,35),xy(2,35),xy(2,36),xy(3,35),xy(3,36),xy(4,35),xy(4,36),xy(5,36),xy(5,37),xy(6,36),xy(6,37),xy(7,36),xy(7,37),xy(8,37),xy(8,38),xy(9,37),xy(9,38),xy(10,37),xy(10,38),xy(11,37),xy(11,38),xy(15,38),xy(15,39),xy(16,38),xy(16,39),xy(17,38),xy(18,39),xy(17,40),xy(18,40),xy(19,39),xy(19,40),xy(20,39),xy(20,40),xy(21,39),xy(21,40),xy(22,39),xy(22,38),xy(23,38),xy(23,39),xy(24,38),xy(26,38),xy(27,39),xy(26,40),xy(24,40),xy(0,33)]).
midline(r370, [xy(17,39)]).
midline(r370, [xy(24,39),xy(26,39)]).
fillpoint(r370, xy(26,39), 2).
fillpoint(r370, xy(25,39), 2).
fillpoint(r370, xy(24,39), 2).
fillpoint(r370, xy(17,39), 2).
fillpoint(r370, xy(27,40), 1).
region(r371, '#a0adb3', 9, centroid(94,34)).
polygon(r371, [xy(92,35),xy(94,33),xy(94,35),xy(93,36),xy(95,35),xy(95,33),xy(92,35)]).
midline(r371, [xy(93,35)]).
fillpoint(r371, xy(93,35), 2).
fillpoint(r371, xy(95,35), 1).
fillpoint(r371, xy(95,33), 1).
fillpoint(r371, xy(94,35), 1).
fillpoint(r371, xy(94,34), 1).
region(r372, '#bcc8cf', 8, centroid(20,34)).
polygon(r372, [xy(17,35),xy(18,34),xy(18,35),xy(19,34),xy(23,34),xy(17,35)]).
fillpoint(r372, xy(23,34), 1).
fillpoint(r372, xy(22,34), 1).
fillpoint(r372, xy(21,34), 1).
fillpoint(r372, xy(20,34), 1).
fillpoint(r372, xy(19,34), 1).
region(r374, '#bcc8cf', 4, centroid(28,35)).
polygon(r374, [xy(27,35),xy(29,35),xy(29,36),xy(27,35)]).
fillpoint(r374, xy(29,36), 1).
fillpoint(r374, xy(29,35), 1).
fillpoint(r374, xy(28,35), 1).
fillpoint(r374, xy(27,35), 1).
region(r375, '#a0adb3', 47, centroid(6,39)).
polygon(r375, [xy(0,36),xy(0,40),xy(7,40),xy(8,39),xy(7,38),xy(5,38),xy(4,37),xy(2,37),xy(1,36),xy(0,36)]).
midline(r375, [xy(1,37),xy(1,39),xy(2,38),xy(2,39),xy(3,38),xy(3,39),xy(4,38),xy(4,39),xy(7,39)]).
fillpoint(r375, xy(7,39), 2).
fillpoint(r375, xy(6,39), 2).
fillpoint(r375, xy(5,39), 2).
fillpoint(r375, xy(4,39), 2).
fillpoint(r375, xy(4,38), 2).
region(r376, '#a0adb3', 34, centroid(85,39)).
polygon(r376, [xy(77,40),xy(78,40),xy(79,39),xy(79,40),xy(80,39),xy(80,40),xy(81,39),xy(81,40),xy(82,39),xy(82,40),xy(83,39),xy(83,40),xy(84,39),xy(84,40),xy(87,40),xy(88,39),xy(89,39),xy(90,38),xy(89,37),xy(87,37),xy(86,38),xy(85,38),xy(77,40)]).
midline(r376, [xy(85,39),xy(86,39),xy(87,38),xy(87,39),xy(88,38),xy(89,38)]).
fillpoint(r376, xy(89,38), 2).
fillpoint(r376, xy(88,38), 2).
fillpoint(r376, xy(87,39), 2).
fillpoint(r376, xy(87,38), 2).
fillpoint(r376, xy(86,39), 2).
region(r378, '#585d5e', 24, centroid(93,39)).
polygon(r378, [xy(88,40),xy(89,40),xy(90,39),xy(90,40),xy(94,40),xy(95,39),xy(95,37),xy(94,36),xy(92,38),xy(91,38),xy(88,40)]).
midline(r378, [xy(91,39),xy(92,39),xy(93,38),xy(93,39),xy(94,38),xy(94,39)]).
fillpoint(r378, xy(94,39), 2).
fillpoint(r378, xy(94,38), 2).
fillpoint(r378, xy(94,37), 2).
fillpoint(r378, xy(93,39), 2).
fillpoint(r378, xy(93,38), 2).
region(r384, '#bcc8cf', 4, centroid(47,39)).
polygon(r384, [xy(46,40),xy(47,39),xy(47,40),xy(46,40)]).
fillpoint(r384, xy(47,40), 1).
fillpoint(r384, xy(47,39), 1).
fillpoint(r384, xy(47,38), 1).
fillpoint(r384, xy(46,40), 1).
region(r385, '#bcc8cf', 4, centroid(33,40)).
polygon(r385, [xy(32,39),xy(33,39),xy(33,40),xy(34,40),xy(32,39)]).
fillpoint(r385, xy(34,40), 1).
fillpoint(r385, xy(33,40), 1).
fillpoint(r385, xy(33,39), 1).
fillpoint(r385, xy(32,39), 1).
adjacent(r1, r2).
shared_edge(r1, r2, 12).
adjacent(r10, r11).
shared_edge(r10, r11, 12).
adjacent(r10, r9).
shared_edge(r10, r9, 7).
adjacent(r100, r101).
shared_edge(r100, r101, 1).
adjacent(r100, r57).
shared_edge(r100, r57, 1).
adjacent(r100, r88).
shared_edge(r100, r88, 1).
adjacent(r100, r99).
shared_edge(r100, r99, 1).
adjacent(r101, r57).
shared_edge(r101, r57, 2).
adjacent(r101, r72).
shared_edge(r101, r72, 1).
adjacent(r102, r112).
shared_edge(r102, r112, 1).
adjacent(r102, r47).
shared_edge(r102, r47, 2).
adjacent(r102, r57).
shared_edge(r102, r57, 1).
adjacent(r103, r104).
shared_edge(r103, r104, 2).
adjacent(r103, r47).
shared_edge(r103, r47, 2).
adjacent(r104, r113).
shared_edge(r104, r113, 1).
adjacent(r104, r126).
shared_edge(r104, r126, 1).
adjacent(r104, r127).
shared_edge(r104, r127, 1).
adjacent(r104, r128).
shared_edge(r104, r128, 8).
adjacent(r104, r176).
shared_edge(r104, r176, 1).
adjacent(r104, r204).
shared_edge(r104, r204, 1).
adjacent(r104, r205).
shared_edge(r104, r205, 2).
adjacent(r104, r229).
shared_edge(r104, r229, 40).
adjacent(r104, r349).
shared_edge(r104, r349, 33).
adjacent(r104, r47).
shared_edge(r104, r47, 1).
adjacent(r104, r48).
shared_edge(r104, r48, 23).
adjacent(r105, r106).
shared_edge(r105, r106, 1).
adjacent(r105, r117).
shared_edge(r105, r117, 1).
adjacent(r105, r134).
shared_edge(r105, r134, 1).
adjacent(r105, r135).
shared_edge(r105, r135, 1).
adjacent(r105, r51).
shared_edge(r105, r51, 4).
adjacent(r106, r107).
shared_edge(r106, r107, 1).
adjacent(r106, r117).
shared_edge(r106, r117, 1).
adjacent(r106, r94).
shared_edge(r106, r94, 1).
adjacent(r107, r108).
shared_edge(r107, r108, 2).
adjacent(r107, r51).
shared_edge(r107, r51, 1).
adjacent(r108, r109).
shared_edge(r108, r109, 2).
adjacent(r108, r117).
shared_edge(r108, r117, 2).
adjacent(r108, r118).
shared_edge(r108, r118, 1).
adjacent(r108, r135).
shared_edge(r108, r135, 1).
adjacent(r108, r136).
shared_edge(r108, r136, 3).
adjacent(r108, r149).
shared_edge(r108, r149, 1).
adjacent(r108, r150).
shared_edge(r108, r150, 1).
adjacent(r108, r151).
shared_edge(r108, r151, 1).
adjacent(r108, r95).
shared_edge(r108, r95, 1).
adjacent(r108, r96).
shared_edge(r108, r96, 1).
adjacent(r109, r110).
shared_edge(r109, r110, 1).
adjacent(r109, r26).
shared_edge(r109, r26, 1).
adjacent(r11, r115).
shared_edge(r11, r115, 1).
adjacent(r11, r12).
shared_edge(r11, r12, 14).
adjacent(r11, r249).
shared_edge(r11, r249, 1).
adjacent(r11, r26).
shared_edge(r11, r26, 89).
adjacent(r11, r266).
shared_edge(r11, r266, 2).
adjacent(r11, r272).
shared_edge(r11, r272, 1).
adjacent(r11, r276).
shared_edge(r11, r276, 4).
adjacent(r11, r277).
shared_edge(r11, r277, 7).
adjacent(r11, r287).
shared_edge(r11, r287, 7).
adjacent(r11, r288).
shared_edge(r11, r288, 1).
adjacent(r11, r294).
shared_edge(r11, r294, 2).
adjacent(r11, r304).
shared_edge(r11, r304, 1).
adjacent(r11, r315).
shared_edge(r11, r315, 5).
adjacent(r11, r316).
shared_edge(r11, r316, 1).
adjacent(r11, r320).
shared_edge(r11, r320, 2).
adjacent(r11, r330).
shared_edge(r11, r330, 2).
adjacent(r11, r331).
shared_edge(r11, r331, 2).
adjacent(r11, r332).
shared_edge(r11, r332, 2).
adjacent(r11, r339).
shared_edge(r11, r339, 4).
adjacent(r11, r344).
shared_edge(r11, r344, 29).
adjacent(r11, r35).
shared_edge(r11, r35, 1).
adjacent(r11, r362).
shared_edge(r11, r362, 4).
adjacent(r11, r367).
shared_edge(r11, r367, 2).
adjacent(r11, r54).
shared_edge(r11, r54, 1).
adjacent(r11, r55).
shared_edge(r11, r55, 1).
adjacent(r11, r8).
shared_edge(r11, r8, 78).
adjacent(r11, r83).
shared_edge(r11, r83, 2).
adjacent(r11, r9).
shared_edge(r11, r9, 1).
adjacent(r11, r93).
shared_edge(r11, r93, 47).
adjacent(r110, r118).
shared_edge(r110, r118, 1).
adjacent(r110, r26).
shared_edge(r110, r26, 2).
adjacent(r111, r121).
shared_edge(r111, r121, 1).
adjacent(r111, r57).
shared_edge(r111, r57, 1).
adjacent(r111, r84).
shared_edge(r111, r84, 1).
adjacent(r111, r97).
shared_edge(r111, r97, 1).
adjacent(r112, r113).
shared_edge(r112, r113, 1).
adjacent(r112, r124).
shared_edge(r112, r124, 1).
adjacent(r112, r57).
shared_edge(r112, r57, 1).
adjacent(r113, r125).
shared_edge(r113, r125, 1).
adjacent(r113, r126).
shared_edge(r113, r126, 1).
adjacent(r113, r47).
shared_edge(r113, r47, 2).
adjacent(r114, r25).
shared_edge(r114, r25, 12).
adjacent(r114, r8).
shared_edge(r114, r8, 14).
adjacent(r115, r116).
shared_edge(r115, r116, 1).
adjacent(r115, r130).
shared_edge(r115, r130, 1).
adjacent(r115, r93).
shared_edge(r115, r93, 1).
adjacent(r116, r130).
shared_edge(r116, r130, 1).
adjacent(r116, r93).
shared_edge(r116, r93, 2).
adjacent(r118, r119).
shared_edge(r118, r119, 1).
adjacent(r118, r137).
shared_edge(r118, r137, 1).
adjacent(r119, r137).
shared_edge(r119, r137, 1).
adjacent(r119, r26).
shared_edge(r119, r26, 2).
adjacent(r12, r13).
shared_edge(r12, r13, 6).
adjacent(r12, r30).
shared_edge(r12, r30, 2).
adjacent(r12, r35).
shared_edge(r12, r35, 1).
adjacent(r120, r121).
shared_edge(r120, r121, 1).
adjacent(r120, r26).
shared_edge(r120, r26, 2).
adjacent(r120, r84).
shared_edge(r120, r84, 1).
adjacent(r121, r122).
shared_edge(r121, r122, 1).
adjacent(r121, r138).
shared_edge(r121, r138, 1).
adjacent(r121, r155).
shared_edge(r121, r155, 1).
adjacent(r121, r26).
shared_edge(r121, r26, 1).
adjacent(r122, r138).
shared_edge(r122, r138, 1).
adjacent(r122, r57).
shared_edge(r122, r57, 2).
adjacent(r123, r124).
shared_edge(r123, r124, 1).
adjacent(r123, r140).
shared_edge(r123, r140, 1).
adjacent(r123, r141).
shared_edge(r123, r141, 3).
adjacent(r123, r142).
shared_edge(r123, r142, 5).
adjacent(r123, r159).
shared_edge(r123, r159, 1).
adjacent(r123, r57).
shared_edge(r123, r57, 3).
adjacent(r124, r125).
shared_edge(r124, r125, 1).
adjacent(r124, r142).
shared_edge(r124, r142, 1).
adjacent(r125, r126).
shared_edge(r125, r126, 1).
adjacent(r125, r142).
shared_edge(r125, r142, 1).
adjacent(r126, r127).
shared_edge(r126, r127, 1).
adjacent(r126, r143).
shared_edge(r126, r143, 2).
adjacent(r127, r128).
shared_edge(r127, r128, 1).
adjacent(r127, r143).
shared_edge(r127, r143, 1).
adjacent(r128, r144).
shared_edge(r128, r144, 3).
adjacent(r129, r25).
shared_edge(r129, r25, 5).
adjacent(r129, r49).
shared_edge(r129, r49, 7).
adjacent(r13, r14).
shared_edge(r13, r14, 4).
adjacent(r13, r27).
shared_edge(r13, r27, 2).
adjacent(r13, r30).
shared_edge(r13, r30, 1).
adjacent(r130, r131).
shared_edge(r130, r131, 1).
adjacent(r130, r93).
shared_edge(r130, r93, 3).
adjacent(r131, r93).
shared_edge(r131, r93, 3).
adjacent(r132, r133).
shared_edge(r132, r133, 1).
adjacent(r132, r145).
shared_edge(r132, r145, 1).
adjacent(r132, r93).
shared_edge(r132, r93, 2).
adjacent(r133, r134).
shared_edge(r133, r134, 1).
adjacent(r133, r146).
shared_edge(r133, r146, 1).
adjacent(r133, r51).
shared_edge(r133, r51, 1).
adjacent(r134, r135).
shared_edge(r134, r135, 1).
adjacent(r134, r147).
shared_edge(r134, r147, 1).
adjacent(r135, r148).
shared_edge(r135, r148, 1).
adjacent(r136, r137).
shared_edge(r136, r137, 1).
adjacent(r136, r152).
shared_edge(r136, r152, 1).
adjacent(r136, r153).
shared_edge(r136, r153, 1).
adjacent(r137, r153).
shared_edge(r137, r153, 3).
adjacent(r137, r163).
shared_edge(r137, r163, 2).
adjacent(r137, r185).
shared_edge(r137, r185, 1).
adjacent(r137, r52).
shared_edge(r137, r52, 3).
adjacent(r138, r156).
shared_edge(r138, r156, 1).
adjacent(r138, r57).
shared_edge(r138, r57, 1).
adjacent(r139, r140).
shared_edge(r139, r140, 1).
adjacent(r139, r142).
shared_edge(r139, r142, 2).
adjacent(r139, r158).
shared_edge(r139, r158, 1).
adjacent(r139, r159).
shared_edge(r139, r159, 2).
adjacent(r139, r57).
shared_edge(r139, r57, 4).
adjacent(r14, r15).
shared_edge(r14, r15, 3).
adjacent(r14, r23).
shared_edge(r14, r23, 2).
adjacent(r14, r27).
shared_edge(r14, r27, 1).
adjacent(r140, r141).
shared_edge(r140, r141, 1).
adjacent(r140, r57).
shared_edge(r140, r57, 1).
adjacent(r142, r143).
shared_edge(r142, r143, 4).
adjacent(r142, r158).
shared_edge(r142, r158, 1).
adjacent(r142, r172).
shared_edge(r142, r172, 3).
adjacent(r142, r173).
shared_edge(r142, r173, 2).
adjacent(r142, r174).
shared_edge(r142, r174, 1).
adjacent(r142, r197).
shared_edge(r142, r197, 1).
adjacent(r142, r198).
shared_edge(r142, r198, 2).
adjacent(r142, r199).
shared_edge(r142, r199, 1).
adjacent(r142, r200).
shared_edge(r142, r200, 2).
adjacent(r142, r220).
shared_edge(r142, r220, 1).
adjacent(r142, r221).
shared_edge(r142, r221, 2).
adjacent(r142, r241).
shared_edge(r142, r241, 1).
adjacent(r142, r242).
shared_edge(r142, r242, 2).
adjacent(r143, r144).
shared_edge(r143, r144, 2).
adjacent(r143, r175).
shared_edge(r143, r175, 1).
adjacent(r144, r176).
shared_edge(r144, r176, 1).
adjacent(r145, r146).
shared_edge(r145, r146, 1).
adjacent(r145, r160).
shared_edge(r145, r160, 1).
adjacent(r145, r93).
shared_edge(r145, r93, 1).
adjacent(r146, r147).
shared_edge(r146, r147, 1).
adjacent(r146, r160).
shared_edge(r146, r160, 1).
adjacent(r147, r148).
shared_edge(r147, r148, 2).
adjacent(r148, r149).
shared_edge(r148, r149, 1).
adjacent(r148, r160).
shared_edge(r148, r160, 1).
adjacent(r148, r161).
shared_edge(r148, r161, 1).
adjacent(r148, r178).
shared_edge(r148, r178, 2).
adjacent(r149, r150).
shared_edge(r149, r150, 1).
adjacent(r149, r161).
shared_edge(r149, r161, 1).
adjacent(r15, r16).
shared_edge(r15, r16, 2).
adjacent(r150, r151).
shared_edge(r150, r151, 1).
adjacent(r150, r162).
shared_edge(r150, r162, 1).
adjacent(r151, r152).
shared_edge(r151, r152, 1).
adjacent(r151, r153).
shared_edge(r151, r153, 1).
adjacent(r152, r153).
shared_edge(r152, r153, 2).
adjacent(r153, r162).
shared_edge(r153, r162, 1).
adjacent(r153, r181).
shared_edge(r153, r181, 1).
adjacent(r153, r182).
shared_edge(r153, r182, 1).
adjacent(r153, r183).
shared_edge(r153, r183, 1).
adjacent(r153, r184).
shared_edge(r153, r184, 1).
adjacent(r154, r155).
shared_edge(r154, r155, 1).
adjacent(r154, r26).
shared_edge(r154, r26, 3).
adjacent(r155, r156).
shared_edge(r155, r156, 1).
adjacent(r155, r167).
shared_edge(r155, r167, 1).
adjacent(r156, r168).
shared_edge(r156, r168, 1).
adjacent(r156, r57).
shared_edge(r156, r57, 1).
adjacent(r157, r158).
shared_edge(r157, r158, 1).
adjacent(r157, r171).
shared_edge(r157, r171, 1).
adjacent(r157, r57).
shared_edge(r157, r57, 2).
adjacent(r158, r171).
shared_edge(r158, r171, 1).
adjacent(r158, r197).
shared_edge(r158, r197, 1).
adjacent(r158, r57).
shared_edge(r158, r57, 1).
adjacent(r159, r172).
shared_edge(r159, r172, 1).
adjacent(r16, r17).
shared_edge(r16, r17, 14).
adjacent(r16, r23).
shared_edge(r16, r23, 11).
adjacent(r16, r41).
shared_edge(r16, r41, 2).
adjacent(r160, r93).
shared_edge(r160, r93, 3).
adjacent(r161, r162).
shared_edge(r161, r162, 1).
adjacent(r161, r179).
shared_edge(r161, r179, 1).
adjacent(r162, r180).
shared_edge(r162, r180, 1).
adjacent(r163, r164).
shared_edge(r163, r164, 1).
adjacent(r163, r186).
shared_edge(r163, r186, 1).
adjacent(r164, r165).
shared_edge(r164, r165, 1).
adjacent(r164, r187).
shared_edge(r164, r187, 1).
adjacent(r164, r52).
shared_edge(r164, r52, 1).
adjacent(r165, r166).
shared_edge(r165, r166, 1).
adjacent(r165, r188).
shared_edge(r165, r188, 1).
adjacent(r165, r52).
shared_edge(r165, r52, 1).
adjacent(r166, r189).
shared_edge(r166, r189, 1).
adjacent(r166, r52).
shared_edge(r166, r52, 2).
adjacent(r167, r168).
shared_edge(r167, r168, 1).
adjacent(r167, r190).
shared_edge(r167, r190, 1).
adjacent(r167, r26).
shared_edge(r167, r26, 1).
adjacent(r168, r191).
shared_edge(r168, r191, 1).
adjacent(r168, r57).
shared_edge(r168, r57, 1).
adjacent(r169, r193).
shared_edge(r169, r193, 1).
adjacent(r169, r57).
shared_edge(r169, r57, 3).
adjacent(r17, r18).
shared_edge(r17, r18, 8).
adjacent(r17, r31).
shared_edge(r17, r31, 3).
adjacent(r17, r42).
shared_edge(r17, r42, 1).
adjacent(r170, r171).
shared_edge(r170, r171, 1).
adjacent(r170, r195).
shared_edge(r170, r195, 1).
adjacent(r170, r57).
shared_edge(r170, r57, 2).
adjacent(r171, r196).
shared_edge(r171, r196, 1).
adjacent(r173, r174).
shared_edge(r173, r174, 1).
adjacent(r173, r201).
shared_edge(r173, r201, 1).
adjacent(r174, r175).
shared_edge(r174, r175, 1).
adjacent(r174, r202).
shared_edge(r174, r202, 1).
adjacent(r175, r176).
shared_edge(r175, r176, 1).
adjacent(r175, r202).
shared_edge(r175, r202, 1).
adjacent(r175, r203).
shared_edge(r175, r203, 1).
adjacent(r175, r227).
shared_edge(r175, r227, 1).
adjacent(r176, r203).
shared_edge(r176, r203, 1).
adjacent(r177, r25).
shared_edge(r177, r25, 2).
adjacent(r177, r49).
shared_edge(r177, r49, 2).
adjacent(r178, r179).
shared_edge(r178, r179, 1).
adjacent(r178, r208).
shared_edge(r178, r208, 1).
adjacent(r178, r209).
shared_edge(r178, r209, 1).
adjacent(r178, r93).
shared_edge(r178, r93, 1).
adjacent(r179, r180).
shared_edge(r179, r180, 1).
adjacent(r179, r210).
shared_edge(r179, r210, 1).
adjacent(r18, r19).
shared_edge(r18, r19, 6).
adjacent(r18, r31).
shared_edge(r18, r31, 2).
adjacent(r180, r181).
shared_edge(r180, r181, 1).
adjacent(r180, r211).
shared_edge(r180, r211, 1).
adjacent(r181, r182).
shared_edge(r181, r182, 1).
adjacent(r181, r212).
shared_edge(r181, r212, 1).
adjacent(r182, r183).
shared_edge(r182, r183, 1).
adjacent(r182, r213).
shared_edge(r182, r213, 1).
adjacent(r183, r184).
shared_edge(r183, r184, 1).
adjacent(r183, r213).
shared_edge(r183, r213, 1).
adjacent(r184, r185).
shared_edge(r184, r185, 1).
adjacent(r184, r214).
shared_edge(r184, r214, 1).
adjacent(r185, r186).
shared_edge(r185, r186, 1).
adjacent(r185, r215).
shared_edge(r185, r215, 1).
adjacent(r186, r187).
shared_edge(r186, r187, 1).
adjacent(r186, r216).
shared_edge(r186, r216, 1).
adjacent(r187, r188).
shared_edge(r187, r188, 1).
adjacent(r187, r52).
shared_edge(r187, r52, 1).
adjacent(r188, r189).
shared_edge(r188, r189, 1).
adjacent(r188, r52).
shared_edge(r188, r52, 1).
adjacent(r189, r52).
shared_edge(r189, r52, 2).
adjacent(r19, r20).
shared_edge(r19, r20, 6).
adjacent(r19, r32).
shared_edge(r19, r32, 3).
adjacent(r19, r47).
shared_edge(r19, r47, 1).
adjacent(r190, r191).
shared_edge(r190, r191, 1).
adjacent(r190, r218).
shared_edge(r190, r218, 1).
adjacent(r190, r26).
shared_edge(r190, r26, 1).
adjacent(r191, r57).
shared_edge(r191, r57, 2).
adjacent(r192, r193).
shared_edge(r192, r193, 2).
adjacent(r192, r57).
shared_edge(r192, r57, 4).
adjacent(r193, r194).
shared_edge(r193, r194, 1).
adjacent(r193, r219).
shared_edge(r193, r219, 1).
adjacent(r193, r57).
shared_edge(r193, r57, 1).
adjacent(r194, r195).
shared_edge(r194, r195, 1).
adjacent(r194, r219).
shared_edge(r194, r219, 1).
adjacent(r194, r57).
shared_edge(r194, r57, 1).
adjacent(r195, r196).
shared_edge(r195, r196, 2).
adjacent(r196, r197).
shared_edge(r196, r197, 1).
adjacent(r196, r219).
shared_edge(r196, r219, 1).
adjacent(r196, r220).
shared_edge(r196, r220, 2).
adjacent(r196, r240).
shared_edge(r196, r240, 2).
adjacent(r196, r241).
shared_edge(r196, r241, 1).
adjacent(r196, r258).
shared_edge(r196, r258, 2).
adjacent(r197, r220).
shared_edge(r197, r220, 1).
adjacent(r198, r199).
shared_edge(r198, r199, 1).
adjacent(r198, r222).
shared_edge(r198, r222, 1).
adjacent(r199, r200).
shared_edge(r199, r200, 1).
adjacent(r199, r223).
shared_edge(r199, r223, 1).
adjacent(r2, r3).
shared_edge(r2, r3, 17).
adjacent(r20, r21).
shared_edge(r20, r21, 19).
adjacent(r20, r47).
shared_edge(r20, r47, 2).
adjacent(r20, r48).
shared_edge(r20, r48, 19).
adjacent(r200, r201).
shared_edge(r200, r201, 1).
adjacent(r200, r224).
shared_edge(r200, r224, 1).
adjacent(r200, r225).
shared_edge(r200, r225, 1).
adjacent(r201, r202).
shared_edge(r201, r202, 1).
adjacent(r201, r226).
shared_edge(r201, r226, 1).
adjacent(r202, r227).
shared_edge(r202, r227, 1).
adjacent(r203, r204).
shared_edge(r203, r204, 1).
adjacent(r203, r228).
shared_edge(r203, r228, 1).
adjacent(r204, r205).
shared_edge(r204, r205, 2).
adjacent(r205, r228).
shared_edge(r205, r228, 1).
adjacent(r205, r229).
shared_edge(r205, r229, 42).
adjacent(r205, r247).
shared_edge(r205, r247, 3).
adjacent(r205, r262).
shared_edge(r205, r262, 31).
adjacent(r205, r263).
shared_edge(r205, r263, 1).
adjacent(r205, r264).
shared_edge(r205, r264, 2).
adjacent(r205, r343).
shared_edge(r205, r343, 1).
adjacent(r205, r348).
shared_edge(r205, r348, 1).
adjacent(r205, r354).
shared_edge(r205, r354, 1).
adjacent(r205, r358).
shared_edge(r205, r358, 1).
adjacent(r206, r25).
shared_edge(r206, r25, 3).
adjacent(r206, r49).
shared_edge(r206, r49, 1).
adjacent(r207, r208).
shared_edge(r207, r208, 1).
adjacent(r207, r232).
shared_edge(r207, r232, 1).
adjacent(r207, r93).
shared_edge(r207, r93, 2).
adjacent(r208, r209).
shared_edge(r208, r209, 1).
adjacent(r208, r232).
shared_edge(r208, r232, 1).
adjacent(r209, r210).
shared_edge(r209, r210, 1).
adjacent(r209, r232).
shared_edge(r209, r232, 1).
adjacent(r210, r211).
shared_edge(r210, r211, 1).
adjacent(r210, r233).
shared_edge(r210, r233, 1).
adjacent(r211, r212).
shared_edge(r211, r212, 1).
adjacent(r211, r234).
shared_edge(r211, r234, 1).
adjacent(r212, r213).
shared_edge(r212, r213, 2).
adjacent(r213, r214).
shared_edge(r213, r214, 1).
adjacent(r213, r234).
shared_edge(r213, r234, 1).
adjacent(r213, r235).
shared_edge(r213, r235, 1).
adjacent(r213, r252).
shared_edge(r213, r252, 1).
adjacent(r213, r253).
shared_edge(r213, r253, 1).
adjacent(r213, r254).
shared_edge(r213, r254, 1).
adjacent(r214, r215).
shared_edge(r214, r215, 1).
adjacent(r214, r235).
shared_edge(r214, r235, 1).
adjacent(r215, r216).
shared_edge(r215, r216, 1).
adjacent(r215, r236).
shared_edge(r215, r236, 1).
adjacent(r216, r237).
shared_edge(r216, r237, 1).
adjacent(r216, r52).
shared_edge(r216, r52, 1).
adjacent(r217, r218).
shared_edge(r217, r218, 1).
adjacent(r217, r238).
shared_edge(r217, r238, 1).
adjacent(r217, r26).
shared_edge(r217, r26, 4).
adjacent(r218, r238).
shared_edge(r218, r238, 1).
adjacent(r218, r57).
shared_edge(r218, r57, 1).
adjacent(r219, r239).
shared_edge(r219, r239, 1).
adjacent(r22, r5).
shared_edge(r22, r5, 3).
adjacent(r22, r7).
shared_edge(r22, r7, 3).
adjacent(r221, r222).
shared_edge(r221, r222, 1).
adjacent(r221, r243).
shared_edge(r221, r243, 1).
adjacent(r222, r223).
shared_edge(r222, r223, 2).
adjacent(r223, r224).
shared_edge(r223, r224, 2).
adjacent(r223, r225).
shared_edge(r223, r225, 1).
adjacent(r223, r226).
shared_edge(r223, r226, 1).
adjacent(r223, r243).
shared_edge(r223, r243, 1).
adjacent(r223, r244).
shared_edge(r223, r244, 1).
adjacent(r223, r260).
shared_edge(r223, r260, 1).
adjacent(r223, r261).
shared_edge(r223, r261, 2).
adjacent(r223, r262).
shared_edge(r223, r262, 2).
adjacent(r224, r225).
shared_edge(r224, r225, 1).
adjacent(r225, r226).
shared_edge(r225, r226, 1).
adjacent(r226, r227).
shared_edge(r226, r227, 1).
adjacent(r227, r228).
shared_edge(r227, r228, 1).
adjacent(r227, r244).
shared_edge(r227, r244, 1).
adjacent(r227, r245).
shared_edge(r227, r245, 1).
adjacent(r228, r246).
shared_edge(r228, r246, 1).
adjacent(r229, r358).
shared_edge(r229, r358, 1).
adjacent(r229, r359).
shared_edge(r229, r359, 1).
adjacent(r229, r360).
shared_edge(r229, r360, 3).
adjacent(r229, r366).
shared_edge(r229, r366, 1).
adjacent(r23, r27).
shared_edge(r23, r27, 9).
adjacent(r23, r40).
shared_edge(r23, r40, 3).
adjacent(r23, r61).
shared_edge(r23, r61, 1).
adjacent(r230, r25).
shared_edge(r230, r25, 2).
adjacent(r230, r265).
shared_edge(r230, r265, 1).
adjacent(r230, r49).
shared_edge(r230, r49, 3).
adjacent(r231, r232).
shared_edge(r231, r232, 1).
adjacent(r231, r250).
shared_edge(r231, r250, 1).
adjacent(r231, r93).
shared_edge(r231, r93, 2).
adjacent(r232, r233).
shared_edge(r232, r233, 2).
adjacent(r232, r250).
shared_edge(r232, r250, 1).
adjacent(r232, r251).
shared_edge(r232, r251, 1).
adjacent(r232, r268).
shared_edge(r232, r268, 3).
adjacent(r232, r269).
shared_edge(r232, r269, 1).
adjacent(r232, r280).
shared_edge(r232, r280, 1).
adjacent(r232, r281).
shared_edge(r232, r281, 2).
adjacent(r232, r282).
shared_edge(r232, r282, 1).
adjacent(r232, r292).
shared_edge(r232, r292, 2).
adjacent(r233, r234).
shared_edge(r233, r234, 1).
adjacent(r234, r251).
shared_edge(r234, r251, 1).
adjacent(r235, r236).
shared_edge(r235, r236, 1).
adjacent(r235, r255).
shared_edge(r235, r255, 1).
adjacent(r236, r237).
shared_edge(r236, r237, 1).
adjacent(r236, r52).
shared_edge(r236, r52, 1).
adjacent(r237, r52).
shared_edge(r237, r52, 2).
adjacent(r238, r256).
shared_edge(r238, r256, 1).
adjacent(r238, r57).
shared_edge(r238, r57, 1).
adjacent(r239, r240).
shared_edge(r239, r240, 1).
adjacent(r239, r57).
shared_edge(r239, r57, 2).
adjacent(r24, r3).
shared_edge(r24, r3, 3).
adjacent(r24, r5).
shared_edge(r24, r5, 3).
adjacent(r240, r258).
shared_edge(r240, r258, 1).
adjacent(r240, r57).
shared_edge(r240, r57, 2).
adjacent(r241, r242).
shared_edge(r241, r242, 1).
adjacent(r241, r258).
shared_edge(r241, r258, 1).
adjacent(r242, r243).
shared_edge(r242, r243, 1).
adjacent(r242, r259).
shared_edge(r242, r259, 2).
adjacent(r243, r260).
shared_edge(r243, r260, 1).
adjacent(r244, r245).
shared_edge(r244, r245, 1).
adjacent(r244, r262).
shared_edge(r244, r262, 1).
adjacent(r245, r246).
shared_edge(r245, r246, 1).
adjacent(r245, r263).
shared_edge(r245, r263, 1).
adjacent(r246, r247).
shared_edge(r246, r247, 1).
adjacent(r246, r264).
shared_edge(r246, r264, 1).
adjacent(r248, r25).
shared_edge(r248, r25, 3).
adjacent(r248, r265).
shared_edge(r248, r265, 39).
adjacent(r248, r367).
shared_edge(r248, r367, 1).
adjacent(r248, r8).
shared_edge(r248, r8, 39).
adjacent(r249, r250).
shared_edge(r249, r250, 1).
adjacent(r249, r267).
shared_edge(r249, r267, 1).
adjacent(r249, r93).
shared_edge(r249, r93, 1).
adjacent(r25, r29).
shared_edge(r25, r29, 2).
adjacent(r25, r34).
shared_edge(r25, r34, 2).
adjacent(r25, r5).
shared_edge(r25, r5, 25).
adjacent(r25, r50).
shared_edge(r25, r50, 4).
adjacent(r25, r7).
shared_edge(r25, r7, 1).
adjacent(r25, r8).
shared_edge(r25, r8, 3).
adjacent(r25, r82).
shared_edge(r25, r82, 3).
adjacent(r25, r92).
shared_edge(r25, r92, 5).
adjacent(r250, r267).
shared_edge(r250, r267, 1).
adjacent(r250, r268).
shared_edge(r250, r268, 1).
adjacent(r250, r280).
shared_edge(r250, r280, 1).
adjacent(r251, r252).
shared_edge(r251, r252, 1).
adjacent(r251, r269).
shared_edge(r251, r269, 1).
adjacent(r252, r253).
shared_edge(r252, r253, 1).
adjacent(r252, r270).
shared_edge(r252, r270, 1).
adjacent(r253, r254).
shared_edge(r253, r254, 1).
adjacent(r253, r271).
shared_edge(r253, r271, 1).
adjacent(r254, r255).
shared_edge(r254, r255, 1).
adjacent(r254, r52).
shared_edge(r254, r52, 1).
adjacent(r255, r52).
shared_edge(r255, r52, 2).
adjacent(r256, r257).
shared_edge(r256, r257, 1).
adjacent(r256, r26).
shared_edge(r256, r26, 1).
adjacent(r256, r272).
shared_edge(r256, r272, 1).
adjacent(r257, r273).
shared_edge(r257, r273, 1).
adjacent(r257, r57).
shared_edge(r257, r57, 2).
adjacent(r258, r259).
shared_edge(r258, r259, 1).
adjacent(r258, r274).
shared_edge(r258, r274, 3).
adjacent(r259, r260).
shared_edge(r259, r260, 1).
adjacent(r259, r261).
shared_edge(r259, r261, 2).
adjacent(r26, r310).
shared_edge(r26, r310, 1).
adjacent(r26, r311).
shared_edge(r26, r311, 1).
adjacent(r26, r321).
shared_edge(r26, r321, 2).
adjacent(r26, r322).
shared_edge(r26, r322, 4).
adjacent(r26, r330).
shared_edge(r26, r330, 1).
adjacent(r26, r51).
shared_edge(r26, r51, 22).
adjacent(r26, r52).
shared_edge(r26, r52, 107).
adjacent(r26, r53).
shared_edge(r26, r53, 7).
adjacent(r26, r84).
shared_edge(r26, r84, 1).
adjacent(r26, r96).
shared_edge(r26, r96, 1).
adjacent(r260, r261).
shared_edge(r260, r261, 3).
adjacent(r261, r262).
shared_edge(r261, r262, 20).
adjacent(r261, r274).
shared_edge(r261, r274, 22).
adjacent(r261, r296).
shared_edge(r261, r296, 1).
adjacent(r261, r297).
shared_edge(r261, r297, 1).
adjacent(r261, r306).
shared_edge(r261, r306, 1).
adjacent(r262, r263).
shared_edge(r262, r263, 1).
adjacent(r262, r319).
shared_edge(r262, r319, 1).
adjacent(r262, r329).
shared_edge(r262, r329, 2).
adjacent(r263, r264).
shared_edge(r263, r264, 1).
adjacent(r265, r275).
shared_edge(r265, r275, 3).
adjacent(r265, r298).
shared_edge(r265, r298, 25).
adjacent(r265, r332).
shared_edge(r265, r332, 43).
adjacent(r265, r350).
shared_edge(r265, r350, 2).
adjacent(r265, r363).
shared_edge(r265, r363, 8).
adjacent(r265, r367).
shared_edge(r265, r367, 1).
adjacent(r265, r372).
shared_edge(r265, r372, 9).
adjacent(r265, r374).
shared_edge(r265, r374, 5).
adjacent(r265, r379).
shared_edge(r265, r379, 2).
adjacent(r265, r380).
shared_edge(r265, r380, 2).
adjacent(r265, r383).
shared_edge(r265, r383, 2).
adjacent(r265, r384).
shared_edge(r265, r384, 5).
adjacent(r265, r385).
shared_edge(r265, r385, 5).
adjacent(r265, r49).
shared_edge(r265, r49, 5).
adjacent(r266, r267).
shared_edge(r266, r267, 1).
adjacent(r266, r278).
shared_edge(r266, r278, 1).
adjacent(r267, r279).
shared_edge(r267, r279, 1).
adjacent(r269, r270).
shared_edge(r269, r270, 1).
adjacent(r269, r283).
shared_edge(r269, r283, 1).
adjacent(r27, r30).
shared_edge(r27, r30, 1).
adjacent(r27, r37).
shared_edge(r27, r37, 1).
adjacent(r27, r38).
shared_edge(r27, r38, 2).
adjacent(r27, r39).
shared_edge(r27, r39, 6).
adjacent(r27, r59).
shared_edge(r27, r59, 1).
adjacent(r27, r60).
shared_edge(r27, r60, 1).
adjacent(r270, r271).
shared_edge(r270, r271, 1).
adjacent(r270, r284).
shared_edge(r270, r284, 1).
adjacent(r271, r285).
shared_edge(r271, r285, 1).
adjacent(r271, r52).
shared_edge(r271, r52, 1).
adjacent(r272, r273).
shared_edge(r272, r273, 1).
adjacent(r272, r288).
shared_edge(r272, r288, 1).
adjacent(r273, r57).
shared_edge(r273, r57, 2).
adjacent(r274, r291).
shared_edge(r274, r291, 3).
adjacent(r274, r297).
shared_edge(r274, r297, 1).
adjacent(r274, r57).
shared_edge(r274, r57, 1).
adjacent(r275, r49).
shared_edge(r275, r49, 3).
adjacent(r277, r278).
shared_edge(r277, r278, 2).
adjacent(r277, r299).
shared_edge(r277, r299, 1).
adjacent(r277, r307).
shared_edge(r277, r307, 2).
adjacent(r278, r279).
shared_edge(r278, r279, 2).
adjacent(r278, r292).
shared_edge(r278, r292, 1).
adjacent(r278, r299).
shared_edge(r278, r299, 1).
adjacent(r278, r300).
shared_edge(r278, r300, 1).
adjacent(r279, r280).
shared_edge(r279, r280, 1).
adjacent(r28, r3).
shared_edge(r28, r3, 3).
adjacent(r28, r5).
shared_edge(r28, r5, 3).
adjacent(r280, r292).
shared_edge(r280, r292, 1).
adjacent(r281, r282).
shared_edge(r281, r282, 1).
adjacent(r281, r292).
shared_edge(r281, r292, 1).
adjacent(r282, r283).
shared_edge(r282, r283, 1).
adjacent(r282, r293).
shared_edge(r282, r293, 1).
adjacent(r283, r284).
shared_edge(r283, r284, 1).
adjacent(r283, r293).
shared_edge(r283, r293, 1).
adjacent(r284, r285).
shared_edge(r284, r285, 1).
adjacent(r284, r286).
shared_edge(r284, r286, 1).
adjacent(r284, r293).
shared_edge(r284, r293, 1).
adjacent(r284, r303).
shared_edge(r284, r303, 1).
adjacent(r285, r286).
shared_edge(r285, r286, 2).
adjacent(r286, r303).
shared_edge(r286, r303, 4).
adjacent(r286, r314).
shared_edge(r286, r314, 2).
adjacent(r286, r322).
shared_edge(r286, r322, 1).
adjacent(r286, r52).
shared_edge(r286, r52, 14).
adjacent(r287, r304).
shared_edge(r287, r304, 3).
adjacent(r288, r294).
shared_edge(r288, r294, 1).
adjacent(r288, r57).
shared_edge(r288, r57, 1).
adjacent(r289, r290).
shared_edge(r289, r290, 1).
adjacent(r289, r295).
shared_edge(r289, r295, 1).
adjacent(r289, r57).
shared_edge(r289, r57, 2).
adjacent(r29, r8).
shared_edge(r29, r8, 2).
adjacent(r290, r291).
shared_edge(r290, r291, 1).
adjacent(r290, r296).
shared_edge(r290, r296, 1).
adjacent(r290, r297).
shared_edge(r290, r297, 1).
adjacent(r290, r57).
shared_edge(r290, r57, 2).
adjacent(r292, r293).
shared_edge(r292, r293, 1).
adjacent(r292, r301).
shared_edge(r292, r301, 4).
adjacent(r293, r301).
shared_edge(r293, r301, 1).
adjacent(r293, r302).
shared_edge(r293, r302, 1).
adjacent(r294, r316).
shared_edge(r294, r316, 1).
adjacent(r294, r57).
shared_edge(r294, r57, 2).
adjacent(r295, r296).
shared_edge(r295, r296, 1).
adjacent(r295, r306).
shared_edge(r295, r306, 1).
adjacent(r295, r57).
shared_edge(r295, r57, 1).
adjacent(r296, r297).
shared_edge(r296, r297, 1).
adjacent(r298, r49).
shared_edge(r298, r49, 29).
adjacent(r299, r300).
shared_edge(r299, r300, 1).
adjacent(r299, r308).
shared_edge(r299, r308, 1).
adjacent(r3, r33).
shared_edge(r3, r33, 4).
adjacent(r3, r4).
shared_edge(r3, r4, 5).
adjacent(r3, r49).
shared_edge(r3, r49, 37).
adjacent(r3, r5).
shared_edge(r3, r5, 2).
adjacent(r30, r36).
shared_edge(r30, r36, 2).
adjacent(r300, r301).
shared_edge(r300, r301, 1).
adjacent(r300, r309).
shared_edge(r300, r309, 1).
adjacent(r301, r302).
shared_edge(r301, r302, 1).
adjacent(r301, r310).
shared_edge(r301, r310, 1).
adjacent(r301, r311).
shared_edge(r301, r311, 1).
adjacent(r301, r312).
shared_edge(r301, r312, 2).
adjacent(r301, r313).
shared_edge(r301, r313, 1).
adjacent(r302, r303).
shared_edge(r302, r303, 1).
adjacent(r302, r314).
shared_edge(r302, r314, 1).
adjacent(r304, r315).
shared_edge(r304, r315, 1).
adjacent(r304, r316).
shared_edge(r304, r316, 1).
adjacent(r304, r324).
shared_edge(r304, r324, 2).
adjacent(r305, r317).
shared_edge(r305, r317, 1).
adjacent(r305, r318).
shared_edge(r305, r318, 1).
adjacent(r305, r57).
shared_edge(r305, r57, 4).
adjacent(r306, r319).
shared_edge(r306, r319, 1).
adjacent(r306, r57).
shared_edge(r306, r57, 1).
adjacent(r307, r308).
shared_edge(r307, r308, 1).
adjacent(r307, r320).
shared_edge(r307, r320, 1).
adjacent(r308, r309).
shared_edge(r308, r309, 1).
adjacent(r308, r320).
shared_edge(r308, r320, 1).
adjacent(r308, r321).
shared_edge(r308, r321, 1).
adjacent(r308, r330).
shared_edge(r308, r330, 1).
adjacent(r309, r310).
shared_edge(r309, r310, 1).
adjacent(r309, r321).
shared_edge(r309, r321, 1).
adjacent(r31, r32).
shared_edge(r31, r32, 1).
adjacent(r31, r43).
shared_edge(r31, r43, 3).
adjacent(r31, r44).
shared_edge(r31, r44, 1).
adjacent(r310, r311).
shared_edge(r310, r311, 1).
adjacent(r311, r312).
shared_edge(r311, r312, 1).
adjacent(r312, r313).
shared_edge(r312, r313, 1).
adjacent(r312, r322).
shared_edge(r312, r322, 2).
adjacent(r313, r314).
shared_edge(r313, r314, 1).
adjacent(r313, r322).
shared_edge(r313, r322, 1).
adjacent(r315, r323).
shared_edge(r315, r323, 2).
adjacent(r315, r332).
shared_edge(r315, r332, 2).
adjacent(r316, r325).
shared_edge(r316, r325, 2).
adjacent(r316, r57).
shared_edge(r316, r57, 1).
adjacent(r317, r318).
shared_edge(r317, r318, 1).
adjacent(r317, r327).
shared_edge(r317, r327, 1).
adjacent(r317, r57).
shared_edge(r317, r57, 1).
adjacent(r318, r328).
shared_edge(r318, r328, 1).
adjacent(r318, r57).
shared_edge(r318, r57, 1).
adjacent(r319, r329).
shared_edge(r319, r329, 1).
adjacent(r319, r57).
shared_edge(r319, r57, 1).
adjacent(r32, r45).
shared_edge(r32, r45, 1).
adjacent(r32, r46).
shared_edge(r32, r46, 1).
adjacent(r323, r324).
shared_edge(r323, r324, 1).
adjacent(r323, r333).
shared_edge(r323, r333, 1).
adjacent(r324, r325).
shared_edge(r324, r325, 1).
adjacent(r324, r334).
shared_edge(r324, r334, 1).
adjacent(r324, r335).
shared_edge(r324, r335, 1).
adjacent(r325, r326).
shared_edge(r325, r326, 1).
adjacent(r325, r336).
shared_edge(r325, r336, 1).
adjacent(r325, r337).
shared_edge(r325, r337, 1).
adjacent(r326, r337).
shared_edge(r326, r337, 1).
adjacent(r326, r57).
shared_edge(r326, r57, 4).
adjacent(r327, r328).
shared_edge(r327, r328, 2).
adjacent(r327, r338).
shared_edge(r327, r338, 3).
adjacent(r327, r347).
shared_edge(r327, r347, 1).
adjacent(r327, r352).
shared_edge(r327, r352, 1).
adjacent(r327, r356).
shared_edge(r327, r356, 1).
adjacent(r327, r357).
shared_edge(r327, r357, 9).
adjacent(r327, r57).
shared_edge(r327, r57, 12).
adjacent(r328, r338).
shared_edge(r328, r338, 1).
adjacent(r329, r343).
shared_edge(r329, r343, 1).
adjacent(r329, r57).
shared_edge(r329, r57, 2).
adjacent(r33, r5).
shared_edge(r33, r5, 4).
adjacent(r331, r332).
shared_edge(r331, r332, 2).
adjacent(r332, r333).
shared_edge(r332, r333, 1).
adjacent(r332, r339).
shared_edge(r332, r339, 4).
adjacent(r332, r340).
shared_edge(r332, r340, 2).
adjacent(r332, r344).
shared_edge(r332, r344, 35).
adjacent(r332, r345).
shared_edge(r332, r345, 2).
adjacent(r332, r350).
shared_edge(r332, r350, 1).
adjacent(r332, r362).
shared_edge(r332, r362, 2).
adjacent(r332, r367).
shared_edge(r332, r367, 2).
adjacent(r333, r334).
shared_edge(r333, r334, 1).
adjacent(r333, r341).
shared_edge(r333, r341, 1).
adjacent(r334, r335).
shared_edge(r334, r335, 2).
adjacent(r335, r336).
shared_edge(r335, r336, 24).
adjacent(r335, r341).
shared_edge(r335, r341, 2).
adjacent(r335, r346).
shared_edge(r335, r346, 2).
adjacent(r335, r350).
shared_edge(r335, r350, 4).
adjacent(r335, r363).
shared_edge(r335, r363, 10).
adjacent(r335, r380).
shared_edge(r335, r380, 2).
adjacent(r335, r384).
shared_edge(r335, r384, 3).
adjacent(r336, r337).
shared_edge(r336, r337, 1).
adjacent(r336, r342).
shared_edge(r336, r342, 3).
adjacent(r336, r351).
shared_edge(r336, r351, 1).
adjacent(r336, r356).
shared_edge(r336, r356, 2).
adjacent(r336, r357).
shared_edge(r336, r357, 15).
adjacent(r337, r342).
shared_edge(r337, r342, 1).
adjacent(r34, r8).
shared_edge(r34, r8, 2).
adjacent(r340, r341).
shared_edge(r340, r341, 1).
adjacent(r340, r346).
shared_edge(r340, r346, 1).
adjacent(r342, r57).
shared_edge(r342, r57, 2).
adjacent(r343, r348).
shared_edge(r343, r348, 1).
adjacent(r343, r57).
shared_edge(r343, r57, 1).
adjacent(r345, r346).
shared_edge(r345, r346, 1).
adjacent(r345, r350).
shared_edge(r345, r350, 1).
adjacent(r347, r352).
shared_edge(r347, r352, 1).
adjacent(r347, r57).
shared_edge(r347, r57, 2).
adjacent(r348, r354).
shared_edge(r348, r354, 1).
adjacent(r348, r57).
shared_edge(r348, r57, 1).
adjacent(r349, r360).
shared_edge(r349, r360, 1).
adjacent(r349, r361).
shared_edge(r349, r361, 35).
adjacent(r349, r364).
shared_edge(r349, r364, 1).
adjacent(r349, r366).
shared_edge(r349, r366, 1).
adjacent(r349, r369).
shared_edge(r349, r369, 1).
adjacent(r349, r57).
shared_edge(r349, r57, 1).
adjacent(r35, r36).
shared_edge(r35, r36, 1).
adjacent(r35, r56).
shared_edge(r35, r56, 1).
adjacent(r351, r356).
shared_edge(r351, r356, 1).
adjacent(r351, r57).
shared_edge(r351, r57, 2).
adjacent(r352, r353).
shared_edge(r352, r353, 2).
adjacent(r352, r357).
shared_edge(r352, r357, 2).
adjacent(r353, r357).
shared_edge(r353, r357, 1).
adjacent(r353, r57).
shared_edge(r353, r57, 3).
adjacent(r354, r57).
shared_edge(r354, r57, 2).
adjacent(r355, r370).
shared_edge(r355, r370, 38).
adjacent(r355, r49).
shared_edge(r355, r49, 45).
adjacent(r357, r364).
shared_edge(r357, r364, 20).
adjacent(r357, r365).
shared_edge(r357, r365, 1).
adjacent(r357, r57).
shared_edge(r357, r57, 1).
adjacent(r358, r359).
shared_edge(r358, r359, 1).
adjacent(r358, r57).
shared_edge(r358, r57, 1).
adjacent(r359, r57).
shared_edge(r359, r57, 2).
adjacent(r36, r37).
shared_edge(r36, r37, 1).
adjacent(r36, r57).
shared_edge(r36, r57, 2).
adjacent(r361, r364).
shared_edge(r361, r364, 11).
adjacent(r361, r371).
shared_edge(r361, r371, 7).
adjacent(r361, r376).
shared_edge(r361, r376, 20).
adjacent(r364, r368).
shared_edge(r364, r368, 2).
adjacent(r364, r57).
shared_edge(r364, r57, 19).
adjacent(r365, r368).
shared_edge(r365, r368, 1).
adjacent(r365, r57).
shared_edge(r365, r57, 2).
adjacent(r366, r369).
shared_edge(r366, r369, 1).
adjacent(r366, r57).
shared_edge(r366, r57, 1).
adjacent(r368, r57).
shared_edge(r368, r57, 1).
adjacent(r369, r57).
shared_edge(r369, r57, 2).
adjacent(r37, r38).
shared_edge(r37, r38, 1).
adjacent(r37, r57).
shared_edge(r37, r57, 1).
adjacent(r370, r375).
shared_edge(r370, r375, 22).
adjacent(r370, r386).
shared_edge(r370, r386, 4).
adjacent(r371, r373).
shared_edge(r371, r373, 3).
adjacent(r371, r377).
shared_edge(r371, r377, 2).
adjacent(r371, r378).
shared_edge(r371, r378, 4).
adjacent(r372, r49).
shared_edge(r372, r49, 9).
adjacent(r374, r49).
shared_edge(r374, r49, 5).
adjacent(r376, r377).
shared_edge(r376, r377, 1).
adjacent(r376, r378).
shared_edge(r376, r378, 6).
adjacent(r376, r381).
shared_edge(r376, r381, 2).
adjacent(r377, r382).
shared_edge(r377, r382, 1).
adjacent(r378, r381).
shared_edge(r378, r381, 1).
adjacent(r378, r382).
shared_edge(r378, r382, 2).
adjacent(r379, r49).
shared_edge(r379, r49, 2).
adjacent(r38, r58).
shared_edge(r38, r58, 1).
adjacent(r381, r382).
shared_edge(r381, r382, 1).
adjacent(r383, r49).
shared_edge(r383, r49, 2).
adjacent(r385, r49).
shared_edge(r385, r49, 3).
adjacent(r39, r59).
shared_edge(r39, r59, 1).
adjacent(r39, r60).
shared_edge(r39, r60, 1).
adjacent(r39, r71).
shared_edge(r39, r71, 1).
adjacent(r39, r72).
shared_edge(r39, r72, 2).
adjacent(r39, r73).
shared_edge(r39, r73, 1).
adjacent(r4, r5).
shared_edge(r4, r5, 8).
adjacent(r40, r41).
shared_edge(r40, r41, 1).
adjacent(r40, r61).
shared_edge(r40, r61, 1).
adjacent(r40, r62).
shared_edge(r40, r62, 1).
adjacent(r40, r75).
shared_edge(r40, r75, 1).
adjacent(r40, r76).
shared_edge(r40, r76, 1).
adjacent(r41, r42).
shared_edge(r41, r42, 1).
adjacent(r41, r62).
shared_edge(r41, r62, 1).
adjacent(r41, r63).
shared_edge(r41, r63, 1).
adjacent(r42, r43).
shared_edge(r42, r43, 1).
adjacent(r42, r64).
shared_edge(r42, r64, 1).
adjacent(r43, r44).
shared_edge(r43, r44, 1).
adjacent(r43, r65).
shared_edge(r43, r65, 1).
adjacent(r43, r66).
shared_edge(r43, r66, 1).
adjacent(r43, r67).
shared_edge(r43, r67, 1).
adjacent(r44, r45).
shared_edge(r44, r45, 1).
adjacent(r44, r68).
shared_edge(r44, r68, 1).
adjacent(r45, r46).
shared_edge(r45, r46, 1).
adjacent(r45, r69).
shared_edge(r45, r69, 1).
adjacent(r46, r47).
shared_edge(r46, r47, 5).
adjacent(r46, r69).
shared_edge(r46, r69, 1).
adjacent(r47, r48).
shared_edge(r47, r48, 4).
adjacent(r47, r69).
shared_edge(r47, r69, 1).
adjacent(r47, r80).
shared_edge(r47, r80, 2).
adjacent(r47, r81).
shared_edge(r47, r81, 4).
adjacent(r47, r91).
shared_edge(r47, r91, 4).
adjacent(r49, r5).
shared_edge(r49, r5, 10).
adjacent(r5, r6).
shared_edge(r5, r6, 4).
adjacent(r50, r8).
shared_edge(r50, r8, 4).
adjacent(r51, r83).
shared_edge(r51, r83, 2).
adjacent(r51, r93).
shared_edge(r51, r93, 4).
adjacent(r51, r94).
shared_edge(r51, r94, 3).
adjacent(r51, r95).
shared_edge(r51, r95, 2).
adjacent(r51, r96).
shared_edge(r51, r96, 1).
adjacent(r53, r54).
shared_edge(r53, r54, 2).
adjacent(r53, r57).
shared_edge(r53, r57, 1).
adjacent(r53, r84).
shared_edge(r53, r84, 3).
adjacent(r53, r85).
shared_edge(r53, r85, 1).
adjacent(r54, r55).
shared_edge(r54, r55, 1).
adjacent(r55, r56).
shared_edge(r55, r56, 1).
adjacent(r55, r57).
shared_edge(r55, r57, 1).
adjacent(r56, r57).
shared_edge(r56, r57, 2).
adjacent(r57, r58).
shared_edge(r57, r58, 2).
adjacent(r57, r70).
shared_edge(r57, r70, 1).
adjacent(r57, r74).
shared_edge(r57, r74, 1).
adjacent(r57, r77).
shared_edge(r57, r77, 9).
adjacent(r57, r78).
shared_edge(r57, r78, 1).
adjacent(r57, r79).
shared_edge(r57, r79, 2).
adjacent(r57, r80).
shared_edge(r57, r80, 1).
adjacent(r57, r85).
shared_edge(r57, r85, 1).
adjacent(r57, r86).
shared_edge(r57, r86, 1).
adjacent(r57, r89).
shared_edge(r57, r89, 2).
adjacent(r57, r90).
shared_edge(r57, r90, 2).
adjacent(r57, r97).
shared_edge(r57, r97, 1).
adjacent(r57, r98).
shared_edge(r57, r98, 2).
adjacent(r57, r99).
shared_edge(r57, r99, 1).
adjacent(r58, r59).
shared_edge(r58, r59, 1).
adjacent(r59, r70).
shared_edge(r59, r70, 1).
adjacent(r6, r7).
shared_edge(r6, r7, 8).
adjacent(r60, r61).
shared_edge(r60, r61, 1).
adjacent(r60, r74).
shared_edge(r60, r74, 1).
adjacent(r61, r74).
shared_edge(r61, r74, 1).
adjacent(r61, r75).
shared_edge(r61, r75, 1).
adjacent(r61, r77).
shared_edge(r61, r77, 1).
adjacent(r62, r63).
shared_edge(r62, r63, 1).
adjacent(r62, r77).
shared_edge(r62, r77, 1).
adjacent(r63, r64).
shared_edge(r63, r64, 1).
adjacent(r63, r77).
shared_edge(r63, r77, 1).
adjacent(r64, r65).
shared_edge(r64, r65, 1).
adjacent(r64, r78).
shared_edge(r64, r78, 1).
adjacent(r65, r66).
shared_edge(r65, r66, 1).
adjacent(r65, r79).
shared_edge(r65, r79, 1).
adjacent(r66, r67).
shared_edge(r66, r67, 1).
adjacent(r66, r79).
shared_edge(r66, r79, 1).
adjacent(r67, r68).
shared_edge(r67, r68, 1).
adjacent(r67, r79).
shared_edge(r67, r79, 1).
adjacent(r67, r80).
shared_edge(r67, r80, 1).
adjacent(r67, r90).
shared_edge(r67, r90, 1).
adjacent(r68, r69).
shared_edge(r68, r69, 1).
adjacent(r68, r80).
shared_edge(r68, r80, 1).
adjacent(r7, r8).
shared_edge(r7, r8, 16).
adjacent(r70, r71).
shared_edge(r70, r71, 1).
adjacent(r70, r86).
shared_edge(r70, r86, 1).
adjacent(r71, r72).
shared_edge(r71, r72, 1).
adjacent(r71, r87).
shared_edge(r71, r87, 1).
adjacent(r72, r73).
shared_edge(r72, r73, 1).
adjacent(r72, r88).
shared_edge(r72, r88, 2).
adjacent(r72, r89).
shared_edge(r72, r89, 1).
adjacent(r73, r74).
shared_edge(r73, r74, 1).
adjacent(r73, r89).
shared_edge(r73, r89, 1).
adjacent(r75, r76).
shared_edge(r75, r76, 1).
adjacent(r75, r77).
shared_edge(r75, r77, 1).
adjacent(r76, r77).
shared_edge(r76, r77, 2).
adjacent(r77, r78).
shared_edge(r77, r78, 1).
adjacent(r78, r79).
shared_edge(r78, r79, 1).
adjacent(r8, r82).
shared_edge(r8, r82, 3).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r8, r92).
shared_edge(r8, r92, 5).
adjacent(r80, r90).
shared_edge(r80, r90, 1).
adjacent(r84, r85).
shared_edge(r84, r85, 1).
adjacent(r84, r97).
shared_edge(r84, r97, 1).
adjacent(r85, r97).
shared_edge(r85, r97, 1).
adjacent(r86, r87).
shared_edge(r86, r87, 1).
adjacent(r86, r98).
shared_edge(r86, r98, 1).
adjacent(r87, r88).
shared_edge(r87, r88, 1).
adjacent(r87, r99).
shared_edge(r87, r99, 1).
adjacent(r95, r96).
shared_edge(r95, r96, 1).
adjacent(r98, r99).
shared_edge(r98, r99, 1).
