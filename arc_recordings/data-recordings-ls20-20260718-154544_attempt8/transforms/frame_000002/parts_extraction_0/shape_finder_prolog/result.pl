% shape_finder_prolog: outer edges, inner edges, inner medials
:- dynamic region/4.
:- dynamic polygon/2.
:- dynamic hole/2.
:- dynamic midline/2.
:- dynamic fillpoint/3.
:- dynamic adjacent/2.
:- dynamic shared_edge/3.
:- dynamic img_size/2.
img_size(96, 96).

region(r1, '#aaaaaa', 6329, centroid(53,53)).
polygon(r1, [xy(0,0),xy(0,95),xy(15,95),xy(16,94),xy(16,91),xy(15,90),xy(14,91),xy(14,92),xy(13,93),xy(4,93),xy(3,92),xy(3,91),xy(2,90),xy(2,89),xy(3,88),xy(3,87),xy(5,85),xy(5,83),xy(6,82),xy(6,81),xy(7,80),xy(10,80),xy(11,81),xy(11,82),xy(12,83),xy(12,86),xy(13,86),xy(14,87),xy(14,88),xy(15,89),xy(17,90),xy(19,88),xy(82,88),xy(83,89),xy(84,88),xy(86,88),xy(87,89),xy(87,91),xy(0,0)]).
hole(r1, [xy(3,89),xy(3,90),xy(4,91),xy(4,92),xy(12,92),xy(13,91),xy(13,92),xy(14,90),xy(14,89),xy(11,86),xy(11,83),xy(9,81),xy(7,81),xy(7,82),xy(6,83),xy(6,86),xy(5,87),xy(4,87),xy(4,88),xy(3,89)]).
midline(r1, [xy(1,1),xy(1,26),xy(2,28),xy(2,30),xy(3,30),xy(3,32),xy(9,44)]).
midline(r1, [xy(1,88),xy(1,91),xy(2,91),xy(2,93),xy(4,94),xy(13,94),xy(14,93),xy(14,94),xy(15,93),xy(15,91),xy(16,90)]).
midline(r1, [xy(2,84),xy(2,86),xy(3,85),xy(3,81),xy(6,75)]).
midline(r1, [xy(2,88)]).
midline(r1, [xy(11,47)]).
midline(r1, [xy(13,50),xy(15,54)]).
midline(r1, [xy(15,94)]).
midline(r1, [xy(17,85)]).
midline(r1, [xy(18,58),xy(19,60)]).
midline(r1, [xy(18,82)]).
midline(r1, [xy(23,64),xy(23,65),xy(26,65),xy(26,66),xy(27,65),xy(27,66),xy(28,65),xy(28,66),xy(29,65),xy(29,66),xy(30,65),xy(30,66),xy(31,65),xy(31,66),xy(32,65),xy(32,66),xy(33,65),xy(33,66),xy(34,65),xy(34,66),xy(35,65),xy(35,66),xy(36,65),xy(36,66),xy(38,65),xy(39,64),xy(39,65),xy(40,64),xy(40,65),xy(41,64),xy(41,65),xy(42,65),xy(44,64),xy(46,64),xy(48,63),xy(49,62),xy(49,63),xy(63,56),xy(76,30),xy(76,28),xy(77,27),xy(77,28)]).
midline(r1, [xy(66,3)]).
midline(r1, [xy(78,18),xy(78,21),xy(79,20),xy(79,15),xy(80,15)]).
midline(r1, [xy(78,23),xy(78,25)]).
midline(r1, [xy(79,21)]).
midline(r1, [xy(83,77)]).
midline(r1, [xy(87,81)]).
midline(r1, [xy(92,86)]).
fillpoint(r1, xy(63,56), 33).
fillpoint(r1, xy(64,57), 32).
fillpoint(r1, xy(64,56), 32).
fillpoint(r1, xy(64,55), 32).
fillpoint(r1, xy(64,54), 32).
region(r2, '#aaaaa9', 27, centroid(3,13)).
polygon(r2, [xy(3,0),xy(3,26),xy(3,0)]).
fillpoint(r2, xy(3,26), 1).
fillpoint(r2, xy(3,25), 1).
fillpoint(r2, xy(3,24), 1).
fillpoint(r2, xy(3,23), 1).
fillpoint(r2, xy(3,22), 1).
region(r3, '#aaaaab', 27, centroid(4,13)).
polygon(r3, [xy(4,0),xy(4,26),xy(4,0)]).
fillpoint(r3, xy(4,26), 1).
fillpoint(r3, xy(4,25), 1).
fillpoint(r3, xy(4,24), 1).
fillpoint(r3, xy(4,23), 1).
fillpoint(r3, xy(4,22), 1).
region(r4, '#aaaaa9', 30, centroid(5,15)).
polygon(r4, [xy(5,0),xy(5,29),xy(5,0)]).
fillpoint(r4, xy(5,29), 1).
fillpoint(r4, xy(5,28), 1).
fillpoint(r4, xy(5,27), 1).
fillpoint(r4, xy(5,26), 1).
fillpoint(r4, xy(5,25), 1).
region(r5, '#fcdc01', 28, centroid(6,13)).
polygon(r5, [xy(6,0),xy(6,26),xy(7,26),xy(6,0)]).
fillpoint(r5, xy(7,26), 1).
fillpoint(r5, xy(6,26), 1).
fillpoint(r5, xy(6,25), 1).
fillpoint(r5, xy(6,24), 1).
fillpoint(r5, xy(6,23), 1).
region(r6, '#ffdd00', 26, centroid(7,13)).
polygon(r6, [xy(7,0),xy(7,25),xy(7,0)]).
fillpoint(r6, xy(7,25), 1).
fillpoint(r6, xy(7,24), 1).
fillpoint(r6, xy(7,23), 1).
fillpoint(r6, xy(7,22), 1).
fillpoint(r6, xy(7,21), 1).
region(r7, '#ffdc00', 367, centroid(30,5)).
polygon(r7, [xy(8,0),xy(8,26),xy(9,26),xy(10,25),xy(10,8),xy(12,6),xy(12,5),xy(13,4),xy(50,4),xy(51,5),xy(51,6),xy(52,7),xy(52,13),xy(53,13),xy(54,12),xy(53,11),xy(54,13),xy(55,12),xy(55,8),xy(57,6),xy(57,1),xy(56,0),xy(9,0),xy(8,0)]).
midline(r7, [xy(9,8),xy(9,25)]).
midline(r7, [xy(10,5),xy(10,6)]).
midline(r7, [xy(11,3),xy(13,2),xy(50,2),xy(52,3),xy(53,3),xy(53,4),xy(54,3),xy(54,6)]).
midline(r7, [xy(53,9),xy(53,10),xy(54,9),xy(54,11)]).
fillpoint(r7, xy(54,6), 4).
fillpoint(r7, xy(54,5), 4).
fillpoint(r7, xy(54,4), 4).
fillpoint(r7, xy(54,3), 4).
fillpoint(r7, xy(53,4), 4).
region(r8, '#ffdd00', 5, centroid(58,2)).
polygon(r8, [xy(58,0),xy(58,4),xy(58,0)]).
fillpoint(r8, xy(58,4), 1).
fillpoint(r8, xy(58,3), 1).
fillpoint(r8, xy(58,2), 1).
fillpoint(r8, xy(58,1), 1).
fillpoint(r8, xy(58,0), 1).
region(r9, '#fcdc01', 7, centroid(59,3)).
polygon(r9, [xy(58,5),xy(59,4),xy(59,0),xy(58,5)]).
fillpoint(r9, xy(59,5), 1).
fillpoint(r9, xy(59,4), 1).
fillpoint(r9, xy(59,3), 1).
fillpoint(r9, xy(59,2), 1).
fillpoint(r9, xy(59,1), 1).
region(r11, '#aaaaab', 5, centroid(61,2)).
polygon(r11, [xy(60,3),xy(61,2),xy(61,0),xy(60,3)]).
fillpoint(r11, xy(61,3), 1).
fillpoint(r11, xy(61,2), 1).
fillpoint(r11, xy(61,1), 1).
fillpoint(r11, xy(61,0), 1).
fillpoint(r11, xy(60,3), 1).
region(r12, '#aaaaa9', 4, centroid(62,2)).
polygon(r12, [xy(62,0),xy(62,3),xy(62,0)]).
fillpoint(r12, xy(62,3), 1).
fillpoint(r12, xy(62,2), 1).
fillpoint(r12, xy(62,1), 1).
fillpoint(r12, xy(62,0), 1).
region(r13, '#c7bf7a', 4, centroid(61,5)).
polygon(r13, [xy(60,4),xy(61,4),xy(61,6),xy(60,4)]).
fillpoint(r13, xy(61,6), 1).
fillpoint(r13, xy(61,5), 1).
fillpoint(r13, xy(61,4), 1).
fillpoint(r13, xy(60,4), 1).
region(r15, '#aaaaa9', 13, centroid(63,10)).
polygon(r15, [xy(63,4),xy(63,16),xy(63,4)]).
fillpoint(r15, xy(63,16), 1).
fillpoint(r15, xy(63,15), 1).
fillpoint(r15, xy(63,14), 1).
fillpoint(r15, xy(63,13), 1).
fillpoint(r15, xy(63,12), 1).
region(r16, '#fcdc01', 38, centroid(32,5)).
polygon(r16, [xy(13,5),xy(50,5),xy(13,5)]).
fillpoint(r16, xy(50,5), 1).
fillpoint(r16, xy(49,5), 1).
fillpoint(r16, xy(48,5), 1).
fillpoint(r16, xy(47,5), 1).
fillpoint(r16, xy(46,5), 1).
region(r18, '#ffdd00', 38, centroid(32,6)).
polygon(r18, [xy(13,6),xy(50,6),xy(13,6)]).
fillpoint(r18, xy(50,6), 1).
fillpoint(r18, xy(49,6), 1).
fillpoint(r18, xy(48,6), 1).
fillpoint(r18, xy(47,6), 1).
fillpoint(r18, xy(46,6), 1).
region(r21, '#ffdd00', 26, centroid(12,19)).
polygon(r21, [xy(11,31),xy(12,30),xy(12,7),xy(11,31)]).
fillpoint(r21, xy(12,31), 1).
fillpoint(r21, xy(12,30), 1).
fillpoint(r21, xy(12,29), 1).
fillpoint(r21, xy(12,28), 1).
fillpoint(r21, xy(12,27), 1).
region(r23, '#75c464', 14, centroid(21,7)).
polygon(r23, [xy(14,7),xy(27,7),xy(14,7)]).
fillpoint(r23, xy(27,7), 1).
fillpoint(r23, xy(26,7), 1).
fillpoint(r23, xy(25,7), 1).
fillpoint(r23, xy(24,7), 1).
fillpoint(r23, xy(23,7), 1).
region(r24, '#c7bf7a', 8, centroid(32,7)).
polygon(r24, [xy(28,7),xy(35,7),xy(28,7)]).
fillpoint(r24, xy(35,7), 1).
fillpoint(r24, xy(34,7), 1).
fillpoint(r24, xy(33,7), 1).
fillpoint(r24, xy(32,7), 1).
fillpoint(r24, xy(31,7), 1).
region(r25, '#75c464', 15, centroid(43,7)).
polygon(r25, [xy(36,7),xy(50,7),xy(36,7)]).
fillpoint(r25, xy(50,7), 1).
fillpoint(r25, xy(49,7), 1).
fillpoint(r25, xy(48,7), 1).
fillpoint(r25, xy(47,7), 1).
fillpoint(r25, xy(46,7), 1).
region(r26, '#fcdc01', 14, centroid(53,12)).
polygon(r26, [xy(51,7),xy(51,14),xy(57,14),xy(51,7)]).
fillpoint(r26, xy(57,14), 1).
fillpoint(r26, xy(56,14), 1).
fillpoint(r26, xy(55,14), 1).
fillpoint(r26, xy(54,14), 1).
fillpoint(r26, xy(53,14), 1).
region(r27, '#ffdd00', 7, centroid(57,10)).
polygon(r27, [xy(57,7),xy(57,13),xy(57,7)]).
fillpoint(r27, xy(57,13), 1).
fillpoint(r27, xy(57,12), 1).
fillpoint(r27, xy(57,11), 1).
fillpoint(r27, xy(57,10), 1).
fillpoint(r27, xy(57,9), 1).
region(r29, '#75c464', 4, centroid(60,7)).
polygon(r29, [xy(59,7),xy(61,7),xy(61,8),xy(59,7)]).
fillpoint(r29, xy(61,8), 1).
fillpoint(r29, xy(61,7), 1).
fillpoint(r29, xy(60,7), 1).
fillpoint(r29, xy(59,7), 1).
region(r30, '#acaaab', 10, centroid(62,12)).
polygon(r30, [xy(62,7),xy(62,16),xy(62,7)]).
fillpoint(r30, xy(62,16), 1).
fillpoint(r30, xy(62,15), 1).
fillpoint(r30, xy(62,14), 1).
fillpoint(r30, xy(62,13), 1).
fillpoint(r30, xy(62,12), 1).
region(r31, '#fcdc01', 23, centroid(11,19)).
polygon(r31, [xy(11,8),xy(11,30),xy(11,8)]).
fillpoint(r31, xy(11,30), 1).
fillpoint(r31, xy(11,29), 1).
fillpoint(r31, xy(11,28), 1).
fillpoint(r31, xy(11,27), 1).
fillpoint(r31, xy(11,26), 1).
region(r32, '#75c464', 26, centroid(13,21)).
polygon(r32, [xy(13,8),xy(13,33),xy(13,8)]).
fillpoint(r32, xy(13,33), 1).
fillpoint(r32, xy(13,32), 1).
fillpoint(r32, xy(13,31), 1).
fillpoint(r32, xy(13,30), 1).
fillpoint(r32, xy(13,29), 1).
region(r33, '#25cc41', 45, centroid(18,16)).
polygon(r33, [xy(14,8),xy(14,33),xy(14,8)]).
fillpoint(r33, xy(27,14), 1).
fillpoint(r33, xy(27,13), 1).
fillpoint(r33, xy(27,12), 1).
fillpoint(r33, xy(27,11), 1).
fillpoint(r33, xy(27,10), 1).
region(r35, '#acaaab', 14, centroid(32,9)).
polygon(r35, [xy(29,8),xy(29,9),xy(30,8),xy(30,9),xy(31,8),xy(31,9),xy(32,8),xy(32,9),xy(33,8),xy(33,9),xy(34,8),xy(34,9),xy(35,8),xy(35,9),xy(29,8)]).
fillpoint(r35, xy(35,9), 1).
fillpoint(r35, xy(35,8), 1).
fillpoint(r35, xy(34,9), 1).
fillpoint(r35, xy(34,8), 1).
fillpoint(r35, xy(33,9), 1).
region(r36, '#25cc41', 14, centroid(43,8)).
polygon(r36, [xy(36,8),xy(49,8),xy(36,8)]).
fillpoint(r36, xy(49,8), 1).
fillpoint(r36, xy(48,8), 1).
fillpoint(r36, xy(47,8), 1).
fillpoint(r36, xy(46,8), 1).
fillpoint(r36, xy(45,8), 1).
region(r37, '#2ecc40', 250, centroid(49,18)).
polygon(r37, [xy(36,9),xy(36,14),xy(37,14),xy(38,13),xy(37,12),xy(38,14),xy(44,14),xy(45,15),xy(45,20),xy(50,20),xy(51,21),xy(51,29),xy(50,30),xy(44,30),xy(45,31),xy(48,31),xy(49,32),xy(49,33),xy(50,33),xy(51,32),xy(50,31),xy(53,28),xy(53,27),xy(54,26),xy(55,26),xy(56,25),xy(56,23),xy(57,22),xy(57,21),xy(59,19),xy(59,16),xy(58,15),xy(51,15),xy(50,14),xy(50,10),xy(49,9),xy(37,9),xy(36,9)]).
midline(r37, [xy(38,11),xy(39,11),xy(39,12),xy(40,11),xy(40,12),xy(41,11),xy(41,12),xy(42,11),xy(42,12),xy(43,11),xy(43,12),xy(46,12),xy(46,13),xy(47,12),xy(47,14),xy(48,15),xy(48,17),xy(49,16),xy(49,17),xy(50,17),xy(51,18),xy(53,19),xy(54,19),xy(54,20),xy(55,19)]).
midline(r37, [xy(49,31),xy(50,32)]).
midline(r37, [xy(52,27),xy(52,28),xy(53,29)]).
midline(r37, [xy(53,24),xy(53,25),xy(54,24),xy(54,22)]).
fillpoint(r37, xy(55,19), 5).
fillpoint(r37, xy(54,20), 5).
fillpoint(r37, xy(54,19), 5).
fillpoint(r37, xy(53,19), 5).
fillpoint(r37, xy(56,19), 4).
region(r38, '#fcdc01', 5, centroid(56,10)).
polygon(r38, [xy(56,8),xy(56,12),xy(56,8)]).
fillpoint(r38, xy(56,12), 1).
fillpoint(r38, xy(56,11), 1).
fillpoint(r38, xy(56,10), 1).
fillpoint(r38, xy(56,9), 1).
fillpoint(r38, xy(56,8), 1).
region(r39, '#75c464', 7, centroid(58,11)).
polygon(r39, [xy(58,8),xy(58,14),xy(58,8)]).
fillpoint(r39, xy(58,14), 1).
fillpoint(r39, xy(58,13), 1).
fillpoint(r39, xy(58,12), 1).
fillpoint(r39, xy(58,11), 1).
fillpoint(r39, xy(58,10), 1).
region(r40, '#25cc41', 10, centroid(59,11)).
polygon(r40, [xy(59,8),xy(59,14),xy(60,14),xy(60,15),xy(59,8)]).
fillpoint(r40, xy(60,15), 1).
fillpoint(r40, xy(60,14), 1).
fillpoint(r40, xy(60,8), 1).
fillpoint(r40, xy(59,14), 1).
fillpoint(r40, xy(59,13), 1).
region(r41, '#868180', 13, centroid(16,10)).
polygon(r41, [xy(15,9),xy(15,12),xy(17,12),xy(18,11),xy(18,10),xy(17,9),xy(16,9),xy(16,10),xy(18,9),xy(15,9)]).
hole(r41, [xy(16,11),xy(17,10),xy(17,11),xy(16,11)]).
fillpoint(r41, xy(18,12), 1).
fillpoint(r41, xy(18,11), 1).
fillpoint(r41, xy(18,10), 1).
fillpoint(r41, xy(18,9), 1).
fillpoint(r41, xy(17,12), 1).
region(r42, '#2ecc40', 409, centroid(24,22)).
polygon(r42, [xy(15,13),xy(15,35),xy(19,35),xy(20,34),xy(20,30),xy(21,29),xy(32,29),xy(33,28),xy(33,29),xy(34,29),xy(35,28),xy(34,27),xy(35,26),xy(35,18),xy(32,15),xy(27,15),xy(26,14),xy(26,10),xy(25,9),xy(19,9),xy(19,12),xy(18,13),xy(16,13),xy(15,13)]).
midline(r42, [xy(17,31),xy(17,33),xy(18,32),xy(18,29),xy(20,25)]).
midline(r42, [xy(18,33)]).
midline(r42, [xy(22,13)]).
midline(r42, [xy(22,17),xy(23,19),xy(23,21),xy(24,20),xy(24,21),xy(25,21),xy(27,22),xy(28,22)]).
fillpoint(r42, xy(25,21), 9).
fillpoint(r42, xy(24,21), 9).
fillpoint(r42, xy(24,20), 9).
fillpoint(r42, xy(23,21), 9).
fillpoint(r42, xy(23,20), 9).
region(r43, '#868180', 9, centroid(61,11)).
polygon(r43, [xy(60,9),xy(60,12),xy(61,11),xy(61,9),xy(60,9)]).
fillpoint(r43, xy(61,13), 1).
fillpoint(r43, xy(61,12), 1).
fillpoint(r43, xy(61,11), 1).
fillpoint(r43, xy(61,10), 1).
fillpoint(r43, xy(61,9), 1).
region(r45, '#868180', 39, centroid(32,12)).
polygon(r45, [xy(28,11),xy(28,14),xy(34,14),xy(35,13),xy(35,11),xy(34,10),xy(29,10),xy(28,11)]).
midline(r45, [xy(30,12),xy(33,12)]).
fillpoint(r45, xy(33,12), 3).
fillpoint(r45, xy(32,12), 3).
fillpoint(r45, xy(31,12), 3).
fillpoint(r45, xy(30,12), 3).
fillpoint(r45, xy(34,13), 2).
region(r50, '#fcdc01', 21, centroid(37,20)).
polygon(r50, [xy(36,15),xy(36,29),xy(36,15)]).
fillpoint(r50, xy(42,15), 1).
fillpoint(r50, xy(41,15), 1).
fillpoint(r50, xy(40,15), 1).
fillpoint(r50, xy(39,15), 1).
fillpoint(r50, xy(38,15), 1).
region(r51, '#75c464', 7, centroid(43,18)).
polygon(r51, [xy(43,15),xy(43,21),xy(43,15)]).
fillpoint(r51, xy(43,21), 1).
fillpoint(r51, xy(43,20), 1).
fillpoint(r51, xy(43,19), 1).
fillpoint(r51, xy(43,18), 1).
fillpoint(r51, xy(43,17), 1).
region(r52, '#25cc41', 13, centroid(46,19)).
polygon(r52, [xy(44,15),xy(44,21),xy(50,21),xy(44,15)]).
fillpoint(r52, xy(50,21), 1).
fillpoint(r52, xy(49,21), 1).
fillpoint(r52, xy(48,21), 1).
fillpoint(r52, xy(47,21), 1).
fillpoint(r52, xy(46,21), 1).
region(r54, '#ffdc00', 178, centroid(37,28)).
polygon(r54, [xy(22,31),xy(22,34),xy(23,33),xy(23,34),xy(39,34),xy(40,33),xy(40,30),xy(41,29),xy(42,29),xy(43,28),xy(46,28),xy(47,27),xy(47,28),xy(48,28),xy(49,27),xy(47,25),xy(43,25),xy(42,24),xy(42,23),xy(40,21),xy(40,18),xy(38,16),xy(37,16),xy(37,29),xy(35,31),xy(23,31),xy(24,32),xy(22,31)]).
midline(r54, [xy(24,33),xy(25,32),xy(25,33),xy(26,32),xy(26,33),xy(27,32),xy(27,33),xy(28,32),xy(28,33),xy(29,32),xy(29,33),xy(30,32),xy(30,33),xy(31,32),xy(31,33),xy(32,32),xy(32,33),xy(33,32),xy(33,33),xy(34,32),xy(34,33),xy(36,32),xy(37,31),xy(37,32),xy(38,31),xy(38,30),xy(39,29),xy(40,27),xy(40,25),xy(41,26)]).
midline(r54, [xy(38,19),xy(38,20),xy(39,19),xy(39,23),xy(40,23)]).
midline(r54, [xy(38,32)]).
midline(r54, [xy(44,26),xy(44,27),xy(45,26),xy(45,27),xy(46,26),xy(46,27),xy(47,26)]).
fillpoint(r54, xy(41,26), 4).
fillpoint(r54, xy(40,27), 4).
fillpoint(r54, xy(40,26), 4).
fillpoint(r54, xy(40,25), 4).
fillpoint(r54, xy(42,27), 3).
region(r55, '#ffdd00', 7, centroid(42,19)).
polygon(r55, [xy(42,16),xy(42,22),xy(42,16)]).
fillpoint(r55, xy(42,22), 1).
fillpoint(r55, xy(42,21), 1).
fillpoint(r55, xy(42,20), 1).
fillpoint(r55, xy(42,19), 1).
fillpoint(r55, xy(42,18), 1).
region(r59, '#fcdc01', 5, centroid(41,19)).
polygon(r59, [xy(41,17),xy(41,21),xy(41,17)]).
fillpoint(r59, xy(41,21), 1).
fillpoint(r59, xy(41,20), 1).
fillpoint(r59, xy(41,19), 1).
fillpoint(r59, xy(41,18), 1).
fillpoint(r59, xy(41,17), 1).
region(r63, '#aaaaa9', 8, centroid(60,22)).
polygon(r63, [xy(60,18),xy(60,25),xy(60,18)]).
fillpoint(r63, xy(60,25), 1).
fillpoint(r63, xy(60,24), 1).
fillpoint(r63, xy(60,23), 1).
fillpoint(r63, xy(60,22), 1).
fillpoint(r63, xy(60,21), 1).
region(r65, '#acaaab', 4, centroid(61,21)).
polygon(r65, [xy(61,19),xy(61,22),xy(61,19)]).
fillpoint(r65, xy(61,22), 1).
fillpoint(r65, xy(61,21), 1).
fillpoint(r65, xy(61,20), 1).
fillpoint(r65, xy(61,19), 1).
region(r68, '#75c464', 7, centroid(47,22)).
polygon(r68, [xy(44,22),xy(50,22),xy(44,22)]).
fillpoint(r68, xy(50,22), 1).
fillpoint(r68, xy(49,22), 1).
fillpoint(r68, xy(48,22), 1).
fillpoint(r68, xy(47,22), 1).
fillpoint(r68, xy(46,22), 1).
region(r70, '#ffdd00', 7, centroid(46,23)).
polygon(r70, [xy(43,23),xy(49,23),xy(43,23)]).
fillpoint(r70, xy(49,23), 1).
fillpoint(r70, xy(48,23), 1).
fillpoint(r70, xy(47,23), 1).
fillpoint(r70, xy(46,23), 1).
fillpoint(r70, xy(45,23), 1).
region(r75, '#fcdc01', 20, centroid(47,27)).
polygon(r75, [xy(43,24),xy(50,24),xy(50,28),xy(49,29),xy(43,29),xy(43,24)]).
fillpoint(r75, xy(50,29), 1).
fillpoint(r75, xy(50,28), 1).
fillpoint(r75, xy(50,27), 1).
fillpoint(r75, xy(50,26), 1).
fillpoint(r75, xy(50,25), 1).
region(r83, '#fcdc01', 4, centroid(9,28)).
polygon(r83, [xy(8,29),xy(9,28),xy(9,29),xy(8,29)]).
fillpoint(r83, xy(9,29), 1).
fillpoint(r83, xy(9,28), 1).
fillpoint(r83, xy(9,27), 1).
fillpoint(r83, xy(8,29), 1).
region(r88, '#aaaaa9', 4, centroid(57,28)).
polygon(r88, [xy(57,27),xy(57,29),xy(58,27),xy(57,27)]).
fillpoint(r88, xy(58,27), 1).
fillpoint(r88, xy(57,29), 1).
fillpoint(r88, xy(57,28), 1).
fillpoint(r88, xy(57,27), 1).
region(r91, '#aaaaa9', 5, centroid(8,31)).
polygon(r91, [xy(7,30),xy(8,30),xy(8,31),xy(7,32),xy(8,32),xy(7,30)]).
fillpoint(r91, xy(8,32), 1).
fillpoint(r91, xy(8,31), 1).
fillpoint(r91, xy(8,30), 1).
fillpoint(r91, xy(7,32), 1).
fillpoint(r91, xy(7,30), 1).
region(r93, '#fcdc01', 46, centroid(30,33)).
polygon(r93, [xy(21,30),xy(21,35),xy(40,35),xy(41,34),xy(41,30),xy(21,30)]).
fillpoint(r93, xy(42,35), 1).
fillpoint(r93, xy(41,35), 1).
fillpoint(r93, xy(41,34), 1).
fillpoint(r93, xy(41,33), 1).
fillpoint(r93, xy(41,32), 1).
region(r94, '#ffdd00', 5, centroid(42,32)).
polygon(r94, [xy(42,30),xy(42,34),xy(42,30)]).
fillpoint(r94, xy(42,34), 1).
fillpoint(r94, xy(42,33), 1).
fillpoint(r94, xy(42,32), 1).
fillpoint(r94, xy(42,31), 1).
fillpoint(r94, xy(42,30), 1).
region(r95, '#75c464', 33, centroid(35,36)).
polygon(r95, [xy(21,37),xy(42,37),xy(43,36),xy(43,30),xy(21,37)]).
midline(r95, [xy(43,37)]).
fillpoint(r95, xy(43,37), 2).
fillpoint(r95, xy(45,37), 1).
fillpoint(r95, xy(44,37), 1).
fillpoint(r95, xy(43,38), 1).
fillpoint(r95, xy(43,36), 1).
region(r97, '#aaaaa9', 4, centroid(54,31)).
polygon(r97, [xy(54,30),xy(54,32),xy(55,30),xy(54,30)]).
fillpoint(r97, xy(55,30), 1).
fillpoint(r97, xy(54,32), 1).
fillpoint(r97, xy(54,31), 1).
fillpoint(r97, xy(54,30), 1).
region(r103, '#25cc41', 7, centroid(44,34)).
polygon(r103, [xy(44,31),xy(44,36),xy(45,36),xy(44,31)]).
fillpoint(r103, xy(45,36), 1).
fillpoint(r103, xy(44,36), 1).
fillpoint(r103, xy(44,35), 1).
fillpoint(r103, xy(44,34), 1).
fillpoint(r103, xy(44,33), 1).
region(r112, '#868180', 13, centroid(47,33)).
polygon(r112, [xy(45,32),xy(45,35),xy(46,34),xy(46,35),xy(47,35),xy(48,34),xy(48,33),xy(47,32),xy(48,32),xy(49,34),xy(45,32)]).
hole(r112, [xy(46,33),xy(47,33),xy(47,34),xy(46,33)]).
fillpoint(r112, xy(49,34), 1).
fillpoint(r112, xy(48,34), 1).
fillpoint(r112, xy(48,33), 1).
fillpoint(r112, xy(48,32), 1).
fillpoint(r112, xy(47,35), 1).
region(r115, '#aaaaa9', 5, centroid(10,33)).
polygon(r115, [xy(9,33),xy(9,34),xy(10,33),xy(11,33),xy(11,34),xy(9,33)]).
fillpoint(r115, xy(11,34), 1).
fillpoint(r115, xy(11,33), 1).
fillpoint(r115, xy(10,33), 1).
fillpoint(r115, xy(9,34), 1).
fillpoint(r115, xy(9,33), 1).
region(r118, '#aaaaa9', 4, centroid(52,33)).
polygon(r118, [xy(51,33),xy(51,34),xy(52,33),xy(53,33),xy(51,33)]).
fillpoint(r118, xy(53,33), 1).
fillpoint(r118, xy(52,33), 1).
fillpoint(r118, xy(51,34), 1).
fillpoint(r118, xy(51,33), 1).
region(r128, '#aaaaa9', 4, centroid(13,36)).
polygon(r128, [xy(12,36),xy(14,36),xy(14,37),xy(12,36)]).
fillpoint(r128, xy(14,37), 1).
fillpoint(r128, xy(14,36), 1).
fillpoint(r128, xy(13,36), 1).
fillpoint(r128, xy(12,36), 1).
region(r133, '#ffdd00', 21, centroid(32,36)).
polygon(r133, [xy(22,36),xy(42,36),xy(22,36)]).
fillpoint(r133, xy(42,36), 1).
fillpoint(r133, xy(41,36), 1).
fillpoint(r133, xy(40,36), 1).
fillpoint(r133, xy(39,36), 1).
fillpoint(r133, xy(38,36), 1).
region(r136, '#aaaaa9', 4, centroid(49,36)).
polygon(r136, [xy(48,36),xy(48,37),xy(49,36),xy(50,36),xy(48,36)]).
fillpoint(r136, xy(50,36), 1).
fillpoint(r136, xy(49,36), 1).
fillpoint(r136, xy(48,37), 1).
fillpoint(r136, xy(48,36), 1).
region(r144, '#25cc41', 31, centroid(31,38)).
polygon(r144, [xy(21,38),xy(26,38),xy(26,39),xy(27,38),xy(28,38),xy(28,39),xy(29,38),xy(29,39),xy(30,38),xy(30,39),xy(31,38),xy(31,39),xy(32,38),xy(32,39),xy(33,38),xy(33,39),xy(34,38),xy(34,39),xy(35,38),xy(36,38),xy(36,39),xy(37,38),xy(42,38),xy(21,38)]).
fillpoint(r144, xy(42,38), 1).
fillpoint(r144, xy(41,38), 1).
fillpoint(r144, xy(40,38), 1).
fillpoint(r144, xy(39,38), 1).
fillpoint(r144, xy(38,38), 1).
region(r147, '#aaaaa9', 8, centroid(20,39)).
polygon(r147, [xy(16,39),xy(23,39),xy(16,39)]).
fillpoint(r147, xy(23,39), 1).
fillpoint(r147, xy(22,39), 1).
fillpoint(r147, xy(21,39), 1).
fillpoint(r147, xy(20,39), 1).
fillpoint(r147, xy(19,39), 1).
region(r148, '#acaaab', 7, centroid(22,40)).
polygon(r148, [xy(19,40),xy(23,40),xy(24,39),xy(24,40),xy(19,40)]).
fillpoint(r148, xy(24,40), 1).
fillpoint(r148, xy(24,39), 1).
fillpoint(r148, xy(23,40), 1).
fillpoint(r148, xy(22,40), 1).
fillpoint(r148, xy(21,40), 1).
region(r153, '#acaaab', 7, centroid(40,40)).
polygon(r153, [xy(38,39),xy(38,40),xy(43,40),xy(38,39)]).
fillpoint(r153, xy(43,40), 1).
fillpoint(r153, xy(42,40), 1).
fillpoint(r153, xy(41,40), 1).
fillpoint(r153, xy(40,40), 1).
fillpoint(r153, xy(39,40), 1).
region(r154, '#aaaaa9', 8, centroid(43,39)).
polygon(r154, [xy(39,39),xy(46,39),xy(39,39)]).
fillpoint(r154, xy(46,39), 1).
fillpoint(r154, xy(45,39), 1).
fillpoint(r154, xy(44,39), 1).
fillpoint(r154, xy(43,39), 1).
fillpoint(r154, xy(42,39), 1).
region(r156, '#75c464', 11, centroid(31,40)).
polygon(r156, [xy(26,40),xy(36,40),xy(26,40)]).
fillpoint(r156, xy(36,40), 1).
fillpoint(r156, xy(35,40), 1).
fillpoint(r156, xy(34,40), 1).
fillpoint(r156, xy(33,40), 1).
fillpoint(r156, xy(32,40), 1).
region(r160, '#acaaab', 13, centroid(31,41)).
polygon(r160, [xy(25,41),xy(37,41),xy(25,41)]).
fillpoint(r160, xy(37,41), 1).
fillpoint(r160, xy(36,41), 1).
fillpoint(r160, xy(35,41), 1).
fillpoint(r160, xy(34,41), 1).
fillpoint(r160, xy(33,41), 1).
region(r163, '#aaaaa9', 13, centroid(31,42)).
polygon(r163, [xy(25,42),xy(37,42),xy(25,42)]).
fillpoint(r163, xy(37,42), 1).
fillpoint(r163, xy(36,42), 1).
fillpoint(r163, xy(35,42), 1).
fillpoint(r163, xy(34,42), 1).
fillpoint(r163, xy(33,42), 1).
region(r164, '#aaaaa9', 4, centroid(9,81)).
polygon(r164, [xy(7,81),xy(10,81),xy(7,81)]).
fillpoint(r164, xy(10,81), 1).
fillpoint(r164, xy(9,81), 1).
fillpoint(r164, xy(8,81), 1).
fillpoint(r164, xy(7,81), 1).
region(r165, '#acaaab', 64, centroid(9,88)).
polygon(r165, [xy(4,88),xy(4,91),xy(12,91),xy(13,90),xy(13,89),xy(12,88),xy(11,88),xy(10,87),xy(10,83),xy(9,82),xy(7,82),xy(7,87),xy(6,88),xy(5,88),xy(4,88)]).
midline(r165, [xy(5,89),xy(5,90),xy(7,89),xy(8,88),xy(8,89),xy(9,88),xy(9,89),xy(12,89),xy(12,90)]).
midline(r165, [xy(8,83),xy(8,86),xy(9,85),xy(9,83)]).
midline(r165, [xy(9,86)]).
fillpoint(r165, xy(10,89), 3).
fillpoint(r165, xy(9,89), 3).
fillpoint(r165, xy(9,88), 3).
fillpoint(r165, xy(8,89), 3).
fillpoint(r165, xy(8,88), 3).
region(r166, '#aaaaa9', 7, centroid(6,86)).
polygon(r166, [xy(4,87),xy(5,87),xy(6,86),xy(6,83),xy(4,87)]).
fillpoint(r166, xy(6,87), 1).
fillpoint(r166, xy(6,86), 1).
fillpoint(r166, xy(6,85), 1).
fillpoint(r166, xy(6,84), 1).
fillpoint(r166, xy(6,83), 1).
region(r167, '#aaaaa9', 7, centroid(11,86)).
polygon(r167, [xy(11,83),xy(11,87),xy(13,87),xy(11,83)]).
fillpoint(r167, xy(13,87), 1).
fillpoint(r167, xy(12,87), 1).
fillpoint(r167, xy(11,87), 1).
fillpoint(r167, xy(11,86), 1).
fillpoint(r167, xy(11,85), 1).
region(r170, '#aaaaa9', 64, centroid(51,89)).
polygon(r170, [xy(19,89),xy(82,89),xy(19,89)]).
fillpoint(r170, xy(82,89), 1).
fillpoint(r170, xy(81,89), 1).
fillpoint(r170, xy(80,89), 1).
fillpoint(r170, xy(79,89), 1).
fillpoint(r170, xy(78,89), 1).
region(r172, '#aaaaab', 4, centroid(90,89)).
polygon(r172, [xy(88,89),xy(91,89),xy(88,89)]).
fillpoint(r172, xy(91,89), 1).
fillpoint(r172, xy(90,89), 1).
fillpoint(r172, xy(89,89), 1).
fillpoint(r172, xy(88,89), 1).
region(r175, '#acaaab', 64, centroid(51,90)).
polygon(r175, [xy(19,90),xy(82,90),xy(19,90)]).
fillpoint(r175, xy(82,90), 1).
fillpoint(r175, xy(81,90), 1).
fillpoint(r175, xy(80,90), 1).
fillpoint(r175, xy(79,90), 1).
fillpoint(r175, xy(78,90), 1).
region(r176, '#aaaaa9', 4, centroid(85,90)).
polygon(r176, [xy(83,90),xy(86,90),xy(83,90)]).
fillpoint(r176, xy(86,90), 1).
fillpoint(r176, xy(85,90), 1).
fillpoint(r176, xy(84,90), 1).
fillpoint(r176, xy(83,90), 1).
region(r177, '#aaaaa9', 4, centroid(90,90)).
polygon(r177, [xy(88,90),xy(91,90),xy(88,90)]).
fillpoint(r177, xy(91,90), 1).
fillpoint(r177, xy(90,90), 1).
fillpoint(r177, xy(89,90), 1).
fillpoint(r177, xy(88,90), 1).
region(r179, '#aaaaa9', 4, centroid(17,93)).
polygon(r179, [xy(17,91),xy(17,94),xy(17,91)]).
fillpoint(r179, xy(17,94), 1).
fillpoint(r179, xy(17,93), 1).
fillpoint(r179, xy(17,92), 1).
fillpoint(r179, xy(17,91), 1).
region(r180, '#acaaab', 4, centroid(18,93)).
polygon(r180, [xy(18,91),xy(18,94),xy(18,91)]).
fillpoint(r180, xy(18,94), 1).
fillpoint(r180, xy(18,93), 1).
fillpoint(r180, xy(18,92), 1).
fillpoint(r180, xy(18,91), 1).
region(r182, '#75c464', 5, centroid(22,91)).
polygon(r182, [xy(20,91),xy(24,91),xy(20,91)]).
fillpoint(r182, xy(24,91), 1).
fillpoint(r182, xy(23,91), 1).
fillpoint(r182, xy(22,91), 1).
fillpoint(r182, xy(21,91), 1).
fillpoint(r182, xy(20,91), 1).
region(r183, '#868180', 228, centroid(54,93)).
polygon(r183, [xy(25,91),xy(26,91),xy(26,93),xy(25,94),xy(81,94),xy(82,93),xy(82,92),xy(81,91),xy(27,91),xy(25,91)]).
midline(r183, [xy(27,92),xy(27,93),xy(28,92),xy(28,93),xy(29,92),xy(29,93),xy(30,92),xy(30,93),xy(31,92),xy(31,93),xy(32,92),xy(32,93),xy(33,92),xy(33,93),xy(34,92),xy(34,93),xy(35,92),xy(35,93),xy(36,92),xy(36,93),xy(37,92),xy(37,93),xy(38,92),xy(38,93),xy(39,92),xy(39,93),xy(40,92),xy(40,93),xy(41,92),xy(41,93),xy(42,92),xy(42,93),xy(43,92),xy(43,93),xy(44,92),xy(44,93),xy(45,92),xy(45,93),xy(46,92),xy(46,93),xy(47,92),xy(47,93),xy(48,92),xy(48,93),xy(49,92),xy(49,93),xy(50,92),xy(50,93),xy(51,92),xy(51,93),xy(52,92),xy(52,93),xy(53,92),xy(53,93),xy(54,92),xy(54,93),xy(55,92),xy(55,93),xy(56,92),xy(56,93),xy(57,92),xy(57,93),xy(58,92),xy(58,93),xy(59,92),xy(59,93),xy(60,92),xy(60,93),xy(61,92),xy(61,93),xy(62,92),xy(62,93),xy(63,92),xy(63,93),xy(64,92),xy(64,93),xy(65,92),xy(65,93),xy(66,92),xy(66,93),xy(67,92),xy(67,93),xy(68,92),xy(68,93),xy(69,92),xy(69,93),xy(70,92),xy(70,93),xy(71,92),xy(71,93),xy(72,92),xy(72,93),xy(73,92),xy(73,93),xy(74,92),xy(74,93),xy(75,92),xy(75,93),xy(76,92),xy(76,93),xy(77,92),xy(77,93),xy(78,92),xy(78,93),xy(79,92),xy(79,93),xy(80,92),xy(80,93),xy(81,92),xy(81,93)]).
fillpoint(r183, xy(81,93), 2).
fillpoint(r183, xy(81,92), 2).
fillpoint(r183, xy(80,93), 2).
fillpoint(r183, xy(80,92), 2).
fillpoint(r183, xy(79,93), 2).
region(r185, '#acaaab', 4, centroid(83,93)).
polygon(r185, [xy(83,91),xy(83,94),xy(83,91)]).
fillpoint(r185, xy(83,94), 1).
fillpoint(r185, xy(83,93), 1).
fillpoint(r185, xy(83,92), 1).
fillpoint(r185, xy(83,91), 1).
region(r186, '#aaaaab', 12, centroid(85,93)).
polygon(r186, [xy(84,91),xy(84,94),xy(85,94),xy(86,93),xy(86,92),xy(85,91),xy(86,91),xy(84,91)]).
midline(r186, [xy(85,92),xy(85,93)]).
fillpoint(r186, xy(85,93), 2).
fillpoint(r186, xy(85,92), 2).
fillpoint(r186, xy(86,94), 1).
fillpoint(r186, xy(86,93), 1).
fillpoint(r186, xy(86,92), 1).
region(r187, '#aaaaab', 16, centroid(90,93)).
polygon(r187, [xy(88,91),xy(88,94),xy(90,94),xy(91,93),xy(91,92),xy(90,91),xy(91,91),xy(88,91)]).
midline(r187, [xy(89,92),xy(89,93),xy(90,92),xy(90,93)]).
fillpoint(r187, xy(90,93), 2).
fillpoint(r187, xy(90,92), 2).
fillpoint(r187, xy(89,93), 2).
fillpoint(r187, xy(89,92), 2).
fillpoint(r187, xy(91,94), 1).
region(r188, '#aaaaab', 12, centroid(94,93)).
polygon(r188, [xy(93,91),xy(93,94),xy(94,94),xy(95,93),xy(95,92),xy(94,91),xy(95,91),xy(93,91)]).
midline(r188, [xy(94,92),xy(94,93)]).
fillpoint(r188, xy(94,93), 2).
fillpoint(r188, xy(94,92), 2).
fillpoint(r188, xy(95,94), 1).
fillpoint(r188, xy(95,93), 1).
fillpoint(r188, xy(95,92), 1).
region(r189, '#aaaaa9', 10, centroid(9,92)).
polygon(r189, [xy(4,92),xy(13,92),xy(4,92)]).
fillpoint(r189, xy(13,92), 1).
fillpoint(r189, xy(12,92), 1).
fillpoint(r189, xy(11,92), 1).
fillpoint(r189, xy(10,92), 1).
fillpoint(r189, xy(9,92), 1).
region(r191, '#25cc41', 10, centroid(22,93)).
polygon(r191, [xy(20,92),xy(20,93),xy(21,92),xy(21,93),xy(22,92),xy(22,93),xy(23,92),xy(23,93),xy(24,92),xy(24,93),xy(20,92)]).
fillpoint(r191, xy(24,93), 1).
fillpoint(r191, xy(24,92), 1).
fillpoint(r191, xy(23,93), 1).
fillpoint(r191, xy(23,92), 1).
fillpoint(r191, xy(22,93), 1).
region(r196, '#75c464', 5, centroid(22,94)).
polygon(r196, [xy(20,94),xy(24,94),xy(20,94)]).
fillpoint(r196, xy(24,94), 1).
fillpoint(r196, xy(23,94), 1).
fillpoint(r196, xy(22,94), 1).
fillpoint(r196, xy(21,94), 1).
fillpoint(r196, xy(20,94), 1).
region(r201, '#acaaab', 64, centroid(51,95)).
polygon(r201, [xy(19,95),xy(82,95),xy(19,95)]).
fillpoint(r201, xy(82,95), 1).
fillpoint(r201, xy(81,95), 1).
fillpoint(r201, xy(80,95), 1).
fillpoint(r201, xy(79,95), 1).
fillpoint(r201, xy(78,95), 1).
region(r202, '#aaaaa9', 4, centroid(85,95)).
polygon(r202, [xy(83,95),xy(86,95),xy(83,95)]).
fillpoint(r202, xy(86,95), 1).
fillpoint(r202, xy(85,95), 1).
fillpoint(r202, xy(84,95), 1).
fillpoint(r202, xy(83,95), 1).
region(r203, '#aaaaa9', 4, centroid(90,95)).
polygon(r203, [xy(88,95),xy(91,95),xy(88,95)]).
fillpoint(r203, xy(91,95), 1).
fillpoint(r203, xy(90,95), 1).
fillpoint(r203, xy(89,95), 1).
fillpoint(r203, xy(88,95), 1).
adjacent(r1, r107).
shared_edge(r1, r107, 2).
adjacent(r1, r115).
shared_edge(r1, r115, 4).
adjacent(r1, r118).
shared_edge(r1, r118, 3).
adjacent(r1, r12).
shared_edge(r1, r12, 4).
adjacent(r1, r123).
shared_edge(r1, r123, 2).
adjacent(r1, r124).
shared_edge(r1, r124, 3).
adjacent(r1, r125).
shared_edge(r1, r125, 1).
adjacent(r1, r127).
shared_edge(r1, r127, 1).
adjacent(r1, r128).
shared_edge(r1, r128, 5).
adjacent(r1, r136).
shared_edge(r1, r136, 5).
adjacent(r1, r141).
shared_edge(r1, r141, 2).
adjacent(r1, r146).
shared_edge(r1, r146, 2).
adjacent(r1, r147).
shared_edge(r1, r147, 4).
adjacent(r1, r148).
shared_edge(r1, r148, 5).
adjacent(r1, r15).
shared_edge(r1, r15, 15).
adjacent(r1, r153).
shared_edge(r1, r153, 5).
adjacent(r1, r154).
shared_edge(r1, r154, 4).
adjacent(r1, r158).
shared_edge(r1, r158, 3).
adjacent(r1, r159).
shared_edge(r1, r159, 2).
adjacent(r1, r161).
shared_edge(r1, r161, 2).
adjacent(r1, r162).
shared_edge(r1, r162, 3).
adjacent(r1, r163).
shared_edge(r1, r163, 15).
adjacent(r1, r164).
shared_edge(r1, r164, 6).
adjacent(r1, r165).
shared_edge(r1, r165, 6).
adjacent(r1, r166).
shared_edge(r1, r166, 8).
adjacent(r1, r167).
shared_edge(r1, r167, 8).
adjacent(r1, r168).
shared_edge(r1, r168, 4).
adjacent(r1, r169).
shared_edge(r1, r169, 4).
adjacent(r1, r170).
shared_edge(r1, r170, 66).
adjacent(r1, r171).
shared_edge(r1, r171, 5).
adjacent(r1, r172).
shared_edge(r1, r172, 6).
adjacent(r1, r173).
shared_edge(r1, r173, 4).
adjacent(r1, r174).
shared_edge(r1, r174, 2).
adjacent(r1, r176).
shared_edge(r1, r176, 2).
adjacent(r1, r177).
shared_edge(r1, r177, 2).
adjacent(r1, r178).
shared_edge(r1, r178, 1).
adjacent(r1, r179).
shared_edge(r1, r179, 6).
adjacent(r1, r186).
shared_edge(r1, r186, 1).
adjacent(r1, r187).
shared_edge(r1, r187, 2).
adjacent(r1, r188).
shared_edge(r1, r188, 1).
adjacent(r1, r189).
shared_edge(r1, r189, 12).
adjacent(r1, r193).
shared_edge(r1, r193, 1).
adjacent(r1, r194).
shared_edge(r1, r194, 1).
adjacent(r1, r2).
shared_edge(r1, r2, 28).
adjacent(r1, r200).
shared_edge(r1, r200, 1).
adjacent(r1, r3).
shared_edge(r1, r3, 1).
adjacent(r1, r4).
shared_edge(r1, r4, 4).
adjacent(r1, r62).
shared_edge(r1, r62, 2).
adjacent(r1, r63).
shared_edge(r1, r63, 4).
adjacent(r1, r64).
shared_edge(r1, r64, 1).
adjacent(r1, r65).
shared_edge(r1, r65, 5).
adjacent(r1, r79).
shared_edge(r1, r79, 2).
adjacent(r1, r80).
shared_edge(r1, r80, 1).
adjacent(r1, r88).
shared_edge(r1, r88, 5).
adjacent(r1, r91).
shared_edge(r1, r91, 4).
adjacent(r1, r97).
shared_edge(r1, r97, 2).
adjacent(r1, r98).
shared_edge(r1, r98, 2).
adjacent(r1, r99).
shared_edge(r1, r99, 3).
adjacent(r10, r11).
shared_edge(r10, r11, 4).
adjacent(r10, r9).
shared_edge(r10, r9, 3).
adjacent(r100, r91).
shared_edge(r100, r91, 3).
adjacent(r100, r99).
shared_edge(r100, r99, 1).
adjacent(r101, r102).
shared_edge(r101, r102, 1).
adjacent(r101, r108).
shared_edge(r101, r108, 1).
adjacent(r101, r91).
shared_edge(r101, r91, 1).
adjacent(r101, r92).
shared_edge(r101, r92, 1).
adjacent(r102, r109).
shared_edge(r102, r109, 1).
adjacent(r102, r21).
shared_edge(r102, r21, 1).
adjacent(r102, r92).
shared_edge(r102, r92, 1).
adjacent(r103, r112).
shared_edge(r103, r112, 5).
adjacent(r103, r134).
shared_edge(r103, r134, 1).
adjacent(r103, r37).
shared_edge(r103, r37, 2).
adjacent(r103, r95).
shared_edge(r103, r95, 8).
adjacent(r104, r105).
shared_edge(r104, r105, 1).
adjacent(r104, r37).
shared_edge(r104, r37, 3).
adjacent(r105, r106).
shared_edge(r105, r106, 1).
adjacent(r105, r113).
shared_edge(r105, r113, 1).
adjacent(r105, r96).
shared_edge(r105, r96, 1).
adjacent(r106, r114).
shared_edge(r106, r114, 1).
adjacent(r106, r37).
shared_edge(r106, r37, 1).
adjacent(r106, r97).
shared_edge(r106, r97, 1).
adjacent(r107, r97).
shared_edge(r107, r97, 2).
adjacent(r108, r109).
shared_edge(r108, r109, 1).
adjacent(r108, r115).
shared_edge(r108, r115, 1).
adjacent(r108, r91).
shared_edge(r108, r91, 1).
adjacent(r109, r110).
shared_edge(r109, r110, 1).
adjacent(r109, r115).
shared_edge(r109, r115, 1).
adjacent(r11, r12).
shared_edge(r11, r12, 4).
adjacent(r11, r13).
shared_edge(r11, r13, 2).
adjacent(r11, r9).
shared_edge(r11, r9, 1).
adjacent(r110, r115).
shared_edge(r110, r115, 1).
adjacent(r110, r116).
shared_edge(r110, r116, 1).
adjacent(r110, r21).
shared_edge(r110, r21, 2).
adjacent(r110, r32).
shared_edge(r110, r32, 1).
adjacent(r111, r54).
shared_edge(r111, r54, 4).
adjacent(r112, r117).
shared_edge(r112, r117, 8).
adjacent(r112, r122).
shared_edge(r112, r122, 1).
adjacent(r112, r127).
shared_edge(r112, r127, 3).
adjacent(r112, r134).
shared_edge(r112, r134, 1).
adjacent(r112, r135).
shared_edge(r112, r135, 1).
adjacent(r112, r37).
shared_edge(r112, r37, 7).
adjacent(r113, r114).
shared_edge(r113, r114, 1).
adjacent(r113, r118).
shared_edge(r113, r118, 1).
adjacent(r113, r37).
shared_edge(r113, r37, 1).
adjacent(r114, r118).
shared_edge(r114, r118, 1).
adjacent(r114, r97).
shared_edge(r114, r97, 1).
adjacent(r115, r116).
shared_edge(r115, r116, 1).
adjacent(r115, r119).
shared_edge(r115, r119, 3).
adjacent(r115, r120).
shared_edge(r115, r120, 1).
adjacent(r116, r120).
shared_edge(r116, r120, 1).
adjacent(r116, r32).
shared_edge(r116, r32, 1).
adjacent(r118, r122).
shared_edge(r118, r122, 1).
adjacent(r118, r123).
shared_edge(r118, r123, 2).
adjacent(r118, r37).
shared_edge(r118, r37, 2).
adjacent(r119, r124).
shared_edge(r119, r124, 1).
adjacent(r12, r14).
shared_edge(r12, r14, 1).
adjacent(r120, r121).
shared_edge(r120, r121, 1).
adjacent(r120, r125).
shared_edge(r120, r125, 1).
adjacent(r120, r126).
shared_edge(r120, r126, 1).
adjacent(r120, r32).
shared_edge(r120, r32, 1).
adjacent(r121, r126).
shared_edge(r121, r126, 1).
adjacent(r121, r33).
shared_edge(r121, r33, 1).
adjacent(r121, r42).
shared_edge(r121, r42, 1).
adjacent(r122, r127).
shared_edge(r122, r127, 1).
adjacent(r122, r37).
shared_edge(r122, r37, 1).
adjacent(r125, r126).
shared_edge(r125, r126, 1).
adjacent(r125, r128).
shared_edge(r125, r128, 1).
adjacent(r126, r128).
shared_edge(r126, r128, 2).
adjacent(r126, r42).
shared_edge(r126, r42, 1).
adjacent(r127, r136).
shared_edge(r127, r136, 3).
adjacent(r128, r129).
shared_edge(r128, r129, 1).
adjacent(r128, r137).
shared_edge(r128, r137, 1).
adjacent(r129, r130).
shared_edge(r129, r130, 1).
adjacent(r129, r137).
shared_edge(r129, r137, 1).
adjacent(r129, r42).
shared_edge(r129, r42, 1).
adjacent(r13, r14).
shared_edge(r13, r14, 3).
adjacent(r13, r17).
shared_edge(r13, r17, 3).
adjacent(r13, r29).
shared_edge(r13, r29, 1).
adjacent(r13, r9).
shared_edge(r13, r9, 1).
adjacent(r130, r131).
shared_edge(r130, r131, 1).
adjacent(r130, r138).
shared_edge(r130, r138, 1).
adjacent(r130, r42).
shared_edge(r130, r42, 1).
adjacent(r131, r139).
shared_edge(r131, r139, 2).
adjacent(r131, r42).
shared_edge(r131, r42, 5).
adjacent(r132, r133).
shared_edge(r132, r133, 1).
adjacent(r132, r42).
shared_edge(r132, r42, 1).
adjacent(r132, r93).
shared_edge(r132, r93, 1).
adjacent(r132, r95).
shared_edge(r132, r95, 1).
adjacent(r133, r93).
shared_edge(r133, r93, 21).
adjacent(r133, r95).
shared_edge(r133, r95, 22).
adjacent(r134, r135).
shared_edge(r134, r135, 1).
adjacent(r134, r140).
shared_edge(r134, r140, 1).
adjacent(r135, r136).
shared_edge(r135, r136, 2).
adjacent(r135, r140).
shared_edge(r135, r140, 1).
adjacent(r135, r146).
shared_edge(r135, r146, 1).
adjacent(r137, r138).
shared_edge(r137, r138, 1).
adjacent(r137, r141).
shared_edge(r137, r141, 1).
adjacent(r138, r139).
shared_edge(r138, r139, 1).
adjacent(r138, r142).
shared_edge(r138, r142, 1).
adjacent(r139, r142).
shared_edge(r139, r142, 2).
adjacent(r139, r42).
shared_edge(r139, r42, 1).
adjacent(r14, r15).
shared_edge(r14, r15, 3).
adjacent(r14, r30).
shared_edge(r14, r30, 1).
adjacent(r140, r145).
shared_edge(r140, r145, 1).
adjacent(r140, r95).
shared_edge(r140, r95, 1).
adjacent(r141, r142).
shared_edge(r141, r142, 1).
adjacent(r142, r143).
shared_edge(r142, r143, 1).
adjacent(r142, r147).
shared_edge(r142, r147, 3).
adjacent(r143, r147).
shared_edge(r143, r147, 1).
adjacent(r143, r42).
shared_edge(r143, r42, 2).
adjacent(r144, r147).
shared_edge(r144, r147, 3).
adjacent(r144, r148).
shared_edge(r144, r148, 1).
adjacent(r144, r149).
shared_edge(r144, r149, 2).
adjacent(r144, r150).
shared_edge(r144, r150, 3).
adjacent(r144, r151).
shared_edge(r144, r151, 3).
adjacent(r144, r152).
shared_edge(r144, r152, 2).
adjacent(r144, r153).
shared_edge(r144, r153, 1).
adjacent(r144, r154).
shared_edge(r144, r154, 4).
adjacent(r144, r156).
shared_edge(r144, r156, 9).
adjacent(r144, r42).
shared_edge(r144, r42, 1).
adjacent(r144, r95).
shared_edge(r144, r95, 23).
adjacent(r145, r146).
shared_edge(r145, r146, 1).
adjacent(r145, r154).
shared_edge(r145, r154, 3).
adjacent(r145, r95).
shared_edge(r145, r95, 3).
adjacent(r147, r148).
shared_edge(r147, r148, 6).
adjacent(r147, r42).
shared_edge(r147, r42, 1).
adjacent(r148, r149).
shared_edge(r148, r149, 1).
adjacent(r148, r155).
shared_edge(r148, r155, 1).
adjacent(r148, r158).
shared_edge(r148, r158, 1).
adjacent(r148, r159).
shared_edge(r148, r159, 1).
adjacent(r149, r155).
shared_edge(r149, r155, 1).
adjacent(r15, r30).
shared_edge(r15, r30, 10).
adjacent(r150, r156).
shared_edge(r150, r156, 1).
adjacent(r151, r156).
shared_edge(r151, r156, 1).
adjacent(r152, r153).
shared_edge(r152, r153, 1).
adjacent(r152, r157).
shared_edge(r152, r157, 1).
adjacent(r153, r154).
shared_edge(r153, r154, 6).
adjacent(r153, r157).
shared_edge(r153, r157, 1).
adjacent(r153, r161).
shared_edge(r153, r161, 1).
adjacent(r153, r162).
shared_edge(r153, r162, 1).
adjacent(r154, r95).
shared_edge(r154, r95, 1).
adjacent(r155, r156).
shared_edge(r155, r156, 1).
adjacent(r155, r160).
shared_edge(r155, r160, 1).
adjacent(r156, r157).
shared_edge(r156, r157, 1).
adjacent(r156, r160).
shared_edge(r156, r160, 11).
adjacent(r157, r160).
shared_edge(r157, r160, 1).
adjacent(r159, r160).
shared_edge(r159, r160, 1).
adjacent(r16, r18).
shared_edge(r16, r18, 38).
adjacent(r16, r7).
shared_edge(r16, r7, 40).
adjacent(r160, r161).
shared_edge(r160, r161, 1).
adjacent(r160, r163).
shared_edge(r160, r163, 13).
adjacent(r164, r165).
shared_edge(r164, r165, 4).
adjacent(r165, r166).
shared_edge(r165, r166, 8).
adjacent(r165, r167).
shared_edge(r165, r167, 8).
adjacent(r165, r168).
shared_edge(r165, r168, 2).
adjacent(r165, r169).
shared_edge(r165, r169, 2).
adjacent(r165, r189).
shared_edge(r165, r189, 10).
adjacent(r17, r20).
shared_edge(r17, r20, 1).
adjacent(r17, r29).
shared_edge(r17, r29, 1).
adjacent(r17, r9).
shared_edge(r17, r9, 1).
adjacent(r170, r175).
shared_edge(r170, r175, 64).
adjacent(r171, r176).
shared_edge(r171, r176, 3).
adjacent(r172, r177).
shared_edge(r172, r177, 4).
adjacent(r173, r178).
shared_edge(r173, r178, 3).
adjacent(r174, r175).
shared_edge(r174, r175, 1).
adjacent(r174, r180).
shared_edge(r174, r180, 1).
adjacent(r175, r176).
shared_edge(r175, r176, 1).
adjacent(r175, r181).
shared_edge(r175, r181, 1).
adjacent(r175, r182).
shared_edge(r175, r182, 5).
adjacent(r175, r183).
shared_edge(r175, r183, 57).
adjacent(r175, r184).
shared_edge(r175, r184, 1).
adjacent(r176, r185).
shared_edge(r176, r185, 1).
adjacent(r176, r186).
shared_edge(r176, r186, 3).
adjacent(r177, r187).
shared_edge(r177, r187, 4).
adjacent(r178, r188).
shared_edge(r178, r188, 3).
adjacent(r179, r180).
shared_edge(r179, r180, 4).
adjacent(r18, r22).
shared_edge(r18, r22, 1).
adjacent(r18, r23).
shared_edge(r18, r23, 14).
adjacent(r18, r24).
shared_edge(r18, r24, 8).
adjacent(r18, r25).
shared_edge(r18, r25, 15).
adjacent(r18, r7).
shared_edge(r18, r7, 2).
adjacent(r180, r181).
shared_edge(r180, r181, 1).
adjacent(r180, r190).
shared_edge(r180, r190, 2).
adjacent(r180, r195).
shared_edge(r180, r195, 1).
adjacent(r180, r200).
shared_edge(r180, r200, 1).
adjacent(r181, r182).
shared_edge(r181, r182, 1).
adjacent(r181, r190).
shared_edge(r181, r190, 1).
adjacent(r182, r183).
shared_edge(r182, r183, 1).
adjacent(r182, r191).
shared_edge(r182, r191, 5).
adjacent(r183, r184).
shared_edge(r183, r184, 2).
adjacent(r183, r185).
shared_edge(r183, r185, 2).
adjacent(r183, r192).
shared_edge(r183, r192, 4).
adjacent(r183, r196).
shared_edge(r183, r196, 1).
adjacent(r183, r197).
shared_edge(r183, r197, 2).
adjacent(r183, r201).
shared_edge(r183, r201, 57).
adjacent(r184, r185).
shared_edge(r184, r185, 1).
adjacent(r185, r186).
shared_edge(r185, r186, 4).
adjacent(r185, r197).
shared_edge(r185, r197, 1).
adjacent(r185, r202).
shared_edge(r185, r202, 1).
adjacent(r186, r193).
shared_edge(r186, r193, 2).
adjacent(r186, r198).
shared_edge(r186, r198, 1).
adjacent(r186, r202).
shared_edge(r186, r202, 3).
adjacent(r187, r193).
shared_edge(r187, r193, 2).
adjacent(r187, r194).
shared_edge(r187, r194, 2).
adjacent(r187, r198).
shared_edge(r187, r198, 1).
adjacent(r187, r199).
shared_edge(r187, r199, 1).
adjacent(r187, r203).
shared_edge(r187, r203, 4).
adjacent(r188, r194).
shared_edge(r188, r194, 2).
adjacent(r188, r199).
shared_edge(r188, r199, 1).
adjacent(r188, r204).
shared_edge(r188, r204, 3).
adjacent(r19, r20).
shared_edge(r19, r20, 1).
adjacent(r19, r28).
shared_edge(r19, r28, 1).
adjacent(r19, r7).
shared_edge(r19, r7, 1).
adjacent(r19, r9).
shared_edge(r19, r9, 1).
adjacent(r190, r191).
shared_edge(r190, r191, 2).
adjacent(r190, r195).
shared_edge(r190, r195, 1).
adjacent(r191, r192).
shared_edge(r191, r192, 2).
adjacent(r191, r196).
shared_edge(r191, r196, 5).
adjacent(r193, r198).
shared_edge(r193, r198, 1).
adjacent(r194, r199).
shared_edge(r194, r199, 1).
adjacent(r195, r196).
shared_edge(r195, r196, 1).
adjacent(r195, r201).
shared_edge(r195, r201, 1).
adjacent(r196, r201).
shared_edge(r196, r201, 5).
adjacent(r197, r201).
shared_edge(r197, r201, 1).
adjacent(r198, r202).
shared_edge(r198, r202, 1).
adjacent(r198, r203).
shared_edge(r198, r203, 1).
adjacent(r199, r203).
shared_edge(r199, r203, 1).
adjacent(r199, r204).
shared_edge(r199, r204, 1).
adjacent(r2, r3).
shared_edge(r2, r3, 27).
adjacent(r20, r29).
shared_edge(r20, r29, 1).
adjacent(r20, r9).
shared_edge(r20, r9, 1).
adjacent(r200, r201).
shared_edge(r200, r201, 1).
adjacent(r201, r202).
shared_edge(r201, r202, 1).
adjacent(r21, r22).
shared_edge(r21, r22, 1).
adjacent(r21, r31).
shared_edge(r21, r31, 24).
adjacent(r21, r32).
shared_edge(r21, r32, 24).
adjacent(r21, r7).
shared_edge(r21, r7, 2).
adjacent(r22, r23).
shared_edge(r22, r23, 1).
adjacent(r22, r32).
shared_edge(r22, r32, 1).
adjacent(r23, r24).
shared_edge(r23, r24, 1).
adjacent(r23, r33).
shared_edge(r23, r33, 14).
adjacent(r24, r25).
shared_edge(r24, r25, 1).
adjacent(r24, r34).
shared_edge(r24, r34, 1).
adjacent(r24, r35).
shared_edge(r24, r35, 7).
adjacent(r25, r26).
shared_edge(r25, r26, 1).
adjacent(r25, r36).
shared_edge(r25, r36, 14).
adjacent(r25, r37).
shared_edge(r25, r37, 1).
adjacent(r26, r27).
shared_edge(r26, r27, 1).
adjacent(r26, r37).
shared_edge(r26, r37, 14).
adjacent(r26, r39).
shared_edge(r26, r39, 1).
adjacent(r26, r7).
shared_edge(r26, r7, 13).
adjacent(r27, r28).
shared_edge(r27, r28, 1).
adjacent(r27, r38).
shared_edge(r27, r38, 5).
adjacent(r27, r39).
shared_edge(r27, r39, 6).
adjacent(r27, r7).
shared_edge(r27, r7, 3).
adjacent(r28, r29).
shared_edge(r28, r29, 1).
adjacent(r28, r39).
shared_edge(r28, r39, 1).
adjacent(r29, r30).
shared_edge(r29, r30, 2).
adjacent(r29, r40).
shared_edge(r29, r40, 3).
adjacent(r29, r43).
shared_edge(r29, r43, 1).
adjacent(r3, r4).
shared_edge(r3, r4, 27).
adjacent(r30, r43).
shared_edge(r30, r43, 5).
adjacent(r30, r49).
shared_edge(r30, r49, 2).
adjacent(r30, r57).
shared_edge(r30, r57, 1).
adjacent(r30, r62).
shared_edge(r30, r62, 1).
adjacent(r31, r7).
shared_edge(r31, r7, 23).
adjacent(r31, r92).
shared_edge(r31, r92, 1).
adjacent(r32, r33).
shared_edge(r32, r33, 26).
adjacent(r33, r34).
shared_edge(r33, r34, 3).
adjacent(r33, r41).
shared_edge(r33, r41, 8).
adjacent(r33, r42).
shared_edge(r33, r42, 36).
adjacent(r33, r45).
shared_edge(r33, r45, 4).
adjacent(r34, r35).
shared_edge(r34, r35, 2).
adjacent(r34, r45).
shared_edge(r34, r45, 2).
adjacent(r35, r36).
shared_edge(r35, r36, 1).
adjacent(r35, r37).
shared_edge(r35, r37, 1).
adjacent(r35, r45).
shared_edge(r35, r45, 7).
adjacent(r36, r37).
shared_edge(r36, r37, 15).
adjacent(r37, r39).
shared_edge(r37, r39, 1).
adjacent(r37, r40).
shared_edge(r37, r40, 2).
adjacent(r37, r45).
shared_edge(r37, r45, 5).
adjacent(r37, r47).
shared_edge(r37, r47, 4).
adjacent(r37, r50).
shared_edge(r37, r50, 7).
adjacent(r37, r51).
shared_edge(r37, r51, 1).
adjacent(r37, r52).
shared_edge(r37, r52, 14).
adjacent(r37, r56).
shared_edge(r37, r56, 1).
adjacent(r37, r60).
shared_edge(r37, r60, 1).
adjacent(r37, r63).
shared_edge(r37, r63, 4).
adjacent(r37, r66).
shared_edge(r37, r66, 4).
adjacent(r37, r68).
shared_edge(r37, r68, 1).
adjacent(r37, r69).
shared_edge(r37, r69, 2).
adjacent(r37, r71).
shared_edge(r37, r71, 1).
adjacent(r37, r72).
shared_edge(r37, r72, 3).
adjacent(r37, r73).
shared_edge(r37, r73, 1).
adjacent(r37, r75).
shared_edge(r37, r75, 13).
adjacent(r37, r76).
shared_edge(r37, r76, 1).
adjacent(r37, r78).
shared_edge(r37, r78, 1).
adjacent(r37, r85).
shared_edge(r37, r85, 4).
adjacent(r37, r86).
shared_edge(r37, r86, 2).
adjacent(r37, r87).
shared_edge(r37, r87, 1).
adjacent(r37, r95).
shared_edge(r37, r95, 1).
adjacent(r37, r96).
shared_edge(r37, r96, 3).
adjacent(r37, r97).
shared_edge(r37, r97, 2).
adjacent(r38, r7).
shared_edge(r38, r7, 7).
adjacent(r39, r40).
shared_edge(r39, r40, 7).
adjacent(r4, r5).
shared_edge(r4, r5, 27).
adjacent(r4, r80).
shared_edge(r4, r80, 3).
adjacent(r40, r43).
shared_edge(r40, r43, 5).
adjacent(r40, r48).
shared_edge(r40, r48, 2).
adjacent(r40, r49).
shared_edge(r40, r49, 2).
adjacent(r40, r56).
shared_edge(r40, r56, 1).
adjacent(r41, r42).
shared_edge(r41, r42, 8).
adjacent(r41, r44).
shared_edge(r41, r44, 8).
adjacent(r42, r45).
shared_edge(r42, r45, 8).
adjacent(r42, r50).
shared_edge(r42, r50, 15).
adjacent(r42, r53).
shared_edge(r42, r53, 4).
adjacent(r42, r89).
shared_edge(r42, r89, 4).
adjacent(r42, r93).
shared_edge(r42, r93, 21).
adjacent(r42, r95).
shared_edge(r42, r95, 1).
adjacent(r43, r48).
shared_edge(r43, r48, 2).
adjacent(r43, r49).
shared_edge(r43, r49, 1).
adjacent(r46, r7).
shared_edge(r46, r7, 4).
adjacent(r49, r57).
shared_edge(r49, r57, 1).
adjacent(r5, r6).
shared_edge(r5, r6, 27).
adjacent(r5, r7).
shared_edge(r5, r7, 1).
adjacent(r5, r80).
shared_edge(r5, r80, 1).
adjacent(r5, r81).
shared_edge(r5, r81, 1).
adjacent(r50, r51).
shared_edge(r50, r51, 1).
adjacent(r50, r54).
shared_edge(r50, r54, 20).
adjacent(r50, r55).
shared_edge(r50, r55, 1).
adjacent(r51, r52).
shared_edge(r51, r52, 7).
adjacent(r51, r55).
shared_edge(r51, r55, 6).
adjacent(r51, r67).
shared_edge(r51, r67, 1).
adjacent(r52, r68).
shared_edge(r52, r68, 7).
adjacent(r54, r55).
shared_edge(r54, r55, 3).
adjacent(r54, r58).
shared_edge(r54, r58, 4).
adjacent(r54, r59).
shared_edge(r54, r59, 7).
adjacent(r54, r70).
shared_edge(r54, r70, 1).
adjacent(r54, r75).
shared_edge(r54, r75, 20).
adjacent(r54, r84).
shared_edge(r54, r84, 4).
adjacent(r54, r93).
shared_edge(r54, r93, 44).
adjacent(r54, r94).
shared_edge(r54, r94, 1).
adjacent(r55, r59).
shared_edge(r55, r59, 5).
adjacent(r55, r67).
shared_edge(r55, r67, 1).
adjacent(r56, r57).
shared_edge(r56, r57, 1).
adjacent(r56, r60).
shared_edge(r56, r60, 1).
adjacent(r57, r61).
shared_edge(r57, r61, 1).
adjacent(r6, r7).
shared_edge(r6, r7, 26).
adjacent(r60, r61).
shared_edge(r60, r61, 1).
adjacent(r60, r63).
shared_edge(r60, r63, 1).
adjacent(r61, r62).
shared_edge(r61, r62, 1).
adjacent(r61, r64).
shared_edge(r61, r64, 1).
adjacent(r63, r64).
shared_edge(r63, r64, 1).
adjacent(r63, r65).
shared_edge(r63, r65, 4).
adjacent(r63, r69).
shared_edge(r63, r69, 1).
adjacent(r63, r74).
shared_edge(r63, r74, 3).
adjacent(r64, r65).
shared_edge(r64, r65, 1).
adjacent(r67, r68).
shared_edge(r67, r68, 1).
adjacent(r67, r70).
shared_edge(r67, r70, 1).
adjacent(r68, r70).
shared_edge(r68, r70, 6).
adjacent(r68, r71).
shared_edge(r68, r71, 1).
adjacent(r69, r74).
shared_edge(r69, r74, 1).
adjacent(r7, r8).
shared_edge(r7, r8, 5).
adjacent(r7, r82).
shared_edge(r7, r82, 1).
adjacent(r7, r83).
shared_edge(r7, r83, 4).
adjacent(r7, r9).
shared_edge(r7, r9, 1).
adjacent(r7, r92).
shared_edge(r7, r92, 1).
adjacent(r70, r71).
shared_edge(r70, r71, 1).
adjacent(r70, r75).
shared_edge(r70, r75, 7).
adjacent(r71, r75).
shared_edge(r71, r75, 1).
adjacent(r72, r73).
shared_edge(r72, r73, 2).
adjacent(r72, r76).
shared_edge(r72, r76, 1).
adjacent(r73, r74).
shared_edge(r73, r74, 2).
adjacent(r73, r77).
shared_edge(r73, r77, 1).
adjacent(r74, r77).
shared_edge(r74, r77, 1).
adjacent(r74, r79).
shared_edge(r74, r79, 1).
adjacent(r75, r95).
shared_edge(r75, r95, 1).
adjacent(r76, r77).
shared_edge(r76, r77, 1).
adjacent(r76, r78).
shared_edge(r76, r78, 1).
adjacent(r77, r78).
shared_edge(r77, r78, 1).
adjacent(r78, r79).
shared_edge(r78, r79, 1).
adjacent(r78, r88).
shared_edge(r78, r88, 2).
adjacent(r8, r9).
shared_edge(r8, r9, 6).
adjacent(r80, r81).
shared_edge(r80, r81, 3).
adjacent(r81, r82).
shared_edge(r81, r82, 2).
adjacent(r81, r83).
shared_edge(r81, r83, 1).
adjacent(r81, r91).
shared_edge(r81, r91, 1).
adjacent(r82, r83).
shared_edge(r82, r83, 3).
adjacent(r83, r91).
shared_edge(r83, r91, 1).
adjacent(r83, r92).
shared_edge(r83, r92, 1).
adjacent(r85, r86).
shared_edge(r85, r86, 2).
adjacent(r86, r87).
shared_edge(r86, r87, 1).
adjacent(r86, r90).
shared_edge(r86, r90, 2).
adjacent(r86, r97).
shared_edge(r86, r97, 1).
adjacent(r87, r88).
shared_edge(r87, r88, 1).
adjacent(r87, r90).
shared_edge(r87, r90, 1).
adjacent(r88, r90).
shared_edge(r88, r90, 2).
adjacent(r90, r98).
shared_edge(r90, r98, 1).
adjacent(r91, r92).
shared_edge(r91, r92, 1).
adjacent(r93, r94).
shared_edge(r93, r94, 6).
adjacent(r93, r95).
shared_edge(r93, r95, 1).
adjacent(r94, r95).
shared_edge(r94, r95, 5).
adjacent(r97, r98).
shared_edge(r97, r98, 1).
