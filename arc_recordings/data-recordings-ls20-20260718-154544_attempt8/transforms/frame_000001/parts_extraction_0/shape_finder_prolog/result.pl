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

region(r1, '#aaaaaa', 5896, centroid(54,54)).
polygon(r1, [xy(0,0),xy(0,95),xy(15,95),xy(16,94),xy(16,91),xy(15,90),xy(14,91),xy(14,92),xy(13,93),xy(4,93),xy(3,92),xy(3,91),xy(2,90),xy(2,89),xy(3,88),xy(3,87),xy(5,85),xy(5,83),xy(6,82),xy(6,81),xy(7,80),xy(10,80),xy(11,81),xy(11,82),xy(12,83),xy(12,86),xy(13,86),xy(14,87),xy(14,88),xy(15,89),xy(17,90),xy(19,88),xy(82,88),xy(83,89),xy(84,88),xy(86,88),xy(87,89),xy(87,91),xy(0,0)]).
hole(r1, [xy(3,89),xy(3,90),xy(4,91),xy(4,92),xy(12,92),xy(13,91),xy(13,92),xy(14,90),xy(14,89),xy(11,86),xy(11,83),xy(9,81),xy(7,81),xy(7,82),xy(6,83),xy(6,86),xy(5,87),xy(4,87),xy(4,88),xy(3,89)]).
midline(r1, [xy(1,1),xy(1,33),xy(2,35),xy(2,37),xy(11,55)]).
midline(r1, [xy(1,88),xy(1,91),xy(2,91),xy(2,93),xy(4,94),xy(13,94),xy(14,93),xy(14,94),xy(15,93),xy(15,91),xy(16,90)]).
midline(r1, [xy(2,1)]).
midline(r1, [xy(2,84),xy(2,86),xy(3,85),xy(3,81),xy(6,75)]).
midline(r1, [xy(2,88)]).
midline(r1, [xy(14,59),xy(15,61)]).
midline(r1, [xy(15,94)]).
midline(r1, [xy(17,64),xy(19,68),xy(19,69),xy(20,68),xy(20,69),xy(21,68),xy(21,69),xy(22,68),xy(22,69),xy(23,68),xy(23,69),xy(24,68),xy(24,69),xy(27,69),xy(27,70),xy(28,69),xy(28,70),xy(29,69),xy(29,70),xy(30,69),xy(30,70),xy(31,69),xy(31,70),xy(32,69),xy(32,70),xy(33,69),xy(33,70),xy(34,69),xy(34,70),xy(35,69),xy(35,70),xy(37,69),xy(38,68),xy(38,69),xy(39,68),xy(39,69),xy(40,68),xy(40,69),xy(41,68),xy(41,69),xy(42,68),xy(42,69),xy(44,68),xy(45,67),xy(45,68),xy(47,67),xy(48,66),xy(48,67),xy(50,66),xy(51,65),xy(51,66),xy(65,59),xy(66,58),xy(66,59)]).
midline(r1, [xy(17,85)]).
midline(r1, [xy(18,82)]).
midline(r1, [xy(62,2)]).
midline(r1, [xy(65,4),xy(67,5)]).
midline(r1, [xy(67,56),xy(76,38),xy(76,35),xy(77,34),xy(77,36)]).
midline(r1, [xy(72,10),xy(74,11)]).
midline(r1, [xy(78,28),xy(79,27),xy(79,15),xy(80,15),xy(80,22)]).
midline(r1, [xy(78,30),xy(78,32)]).
midline(r1, [xy(79,28)]).
midline(r1, [xy(83,77)]).
midline(r1, [xy(87,81)]).
midline(r1, [xy(92,86)]).
fillpoint(r1, xy(66,59), 30).
fillpoint(r1, xy(66,58), 30).
fillpoint(r1, xy(65,59), 30).
fillpoint(r1, xy(67,60), 29).
fillpoint(r1, xy(67,59), 29).
region(r2, '#aaaaa9', 38, centroid(5,19)).
polygon(r2, [xy(5,0),xy(5,37),xy(5,0)]).
fillpoint(r2, xy(5,37), 1).
fillpoint(r2, xy(5,36), 1).
fillpoint(r2, xy(5,35), 1).
fillpoint(r2, xy(5,34), 1).
fillpoint(r2, xy(5,33), 1).
region(r7, '#ffdc00', 368, centroid(28,7)).
polygon(r7, [xy(8,2),xy(8,33),xy(9,34),xy(10,33),xy(10,8),xy(12,6),xy(12,5),xy(13,4),xy(50,4),xy(51,5),xy(51,6),xy(52,7),xy(52,13),xy(53,13),xy(54,12),xy(53,11),xy(54,13),xy(55,12),xy(55,8),xy(56,7),xy(56,6),xy(55,5),xy(55,3),xy(54,2),xy(53,2),xy(51,0),xy(10,0),xy(10,1),xy(9,2),xy(8,2)]).
midline(r7, [xy(9,8),xy(9,33)]).
midline(r7, [xy(10,5),xy(10,6)]).
midline(r7, [xy(11,3),xy(13,2),xy(51,2),xy(51,3),xy(52,3),xy(52,4),xy(53,4),xy(53,6),xy(54,6),xy(54,7),xy(53,9),xy(53,10),xy(54,9),xy(54,11)]).
fillpoint(r7, xy(11,3), 4).
fillpoint(r7, xy(54,7), 3).
fillpoint(r7, xy(54,6), 3).
fillpoint(r7, xy(53,6), 3).
fillpoint(r7, xy(53,5), 3).
region(r12, '#aaaaa9', 5, centroid(57,1)).
polygon(r12, [xy(57,0),xy(57,2),xy(58,2),xy(58,0),xy(57,0)]).
fillpoint(r12, xy(58,2), 1).
fillpoint(r12, xy(58,0), 1).
fillpoint(r12, xy(57,2), 1).
fillpoint(r12, xy(57,1), 1).
fillpoint(r12, xy(57,0), 1).
region(r13, '#aaaaab', 34, centroid(4,18)).
polygon(r13, [xy(4,1),xy(4,34),xy(4,1)]).
fillpoint(r13, xy(4,34), 1).
fillpoint(r13, xy(4,33), 1).
fillpoint(r13, xy(4,32), 1).
fillpoint(r13, xy(4,31), 1).
fillpoint(r13, xy(4,30), 1).
region(r20, '#aaaaa9', 32, centroid(3,18)).
polygon(r20, [xy(3,2),xy(3,33),xy(3,2)]).
fillpoint(r20, xy(3,33), 1).
fillpoint(r20, xy(3,32), 1).
fillpoint(r20, xy(3,31), 1).
fillpoint(r20, xy(3,30), 1).
fillpoint(r20, xy(3,29), 1).
region(r21, '#ffdd00', 34, centroid(7,18)).
polygon(r21, [xy(6,2),xy(7,2),xy(7,32),xy(6,33),xy(7,33),xy(6,2)]).
fillpoint(r21, xy(7,33), 1).
fillpoint(r21, xy(7,32), 1).
fillpoint(r21, xy(7,31), 1).
fillpoint(r21, xy(7,30), 1).
fillpoint(r21, xy(7,29), 1).
region(r23, '#fcdc01', 30, centroid(6,18)).
polygon(r23, [xy(6,3),xy(6,32),xy(6,3)]).
fillpoint(r23, xy(6,32), 1).
fillpoint(r23, xy(6,31), 1).
fillpoint(r23, xy(6,30), 1).
fillpoint(r23, xy(6,29), 1).
fillpoint(r23, xy(6,28), 1).
region(r24, '#fcdc01', 4, centroid(56,4)).
polygon(r24, [xy(56,3),xy(56,5),xy(57,3),xy(56,3)]).
fillpoint(r24, xy(57,3), 1).
fillpoint(r24, xy(56,5), 1).
fillpoint(r24, xy(56,4), 1).
fillpoint(r24, xy(56,3), 1).
region(r27, '#aaaaa9', 10, centroid(60,7)).
polygon(r27, [xy(60,3),xy(60,11),xy(61,11),xy(60,3)]).
fillpoint(r27, xy(61,11), 1).
fillpoint(r27, xy(60,11), 1).
fillpoint(r27, xy(60,10), 1).
fillpoint(r27, xy(60,9), 1).
fillpoint(r27, xy(60,8), 1).
region(r29, '#fcdc01', 38, centroid(32,5)).
polygon(r29, [xy(13,5),xy(50,5),xy(13,5)]).
fillpoint(r29, xy(50,5), 1).
fillpoint(r29, xy(49,5), 1).
fillpoint(r29, xy(48,5), 1).
fillpoint(r29, xy(47,5), 1).
fillpoint(r29, xy(46,5), 1).
region(r30, '#ffdd00', 38, centroid(32,6)).
polygon(r30, [xy(13,6),xy(50,6),xy(13,6)]).
fillpoint(r30, xy(50,6), 1).
fillpoint(r30, xy(49,6), 1).
fillpoint(r30, xy(48,6), 1).
fillpoint(r30, xy(47,6), 1).
fillpoint(r30, xy(46,6), 1).
region(r34, '#ffdd00', 32, centroid(12,23)).
polygon(r34, [xy(12,7),xy(12,38),xy(12,7)]).
fillpoint(r34, xy(12,38), 1).
fillpoint(r34, xy(12,37), 1).
fillpoint(r34, xy(12,36), 1).
fillpoint(r34, xy(12,35), 1).
fillpoint(r34, xy(12,34), 1).
region(r36, '#5fc953', 37, centroid(32,7)).
polygon(r36, [xy(14,7),xy(50,7),xy(14,7)]).
fillpoint(r36, xy(50,7), 1).
fillpoint(r36, xy(49,7), 1).
fillpoint(r36, xy(48,7), 1).
fillpoint(r36, xy(47,7), 1).
fillpoint(r36, xy(46,7), 1).
region(r37, '#fcdc01', 14, centroid(53,12)).
polygon(r37, [xy(51,7),xy(51,14),xy(57,14),xy(51,7)]).
fillpoint(r37, xy(57,14), 1).
fillpoint(r37, xy(56,14), 1).
fillpoint(r37, xy(55,14), 1).
fillpoint(r37, xy(54,14), 1).
fillpoint(r37, xy(53,14), 1).
region(r40, '#fcdc01', 36, centroid(11,25)).
polygon(r40, [xy(9,35),xy(9,38),xy(10,38),xy(11,37),xy(11,8),xy(9,35)]).
fillpoint(r40, xy(11,38), 1).
fillpoint(r40, xy(11,37), 1).
fillpoint(r40, xy(11,36), 1).
fillpoint(r40, xy(11,35), 1).
fillpoint(r40, xy(11,34), 1).
region(r41, '#5fc953', 34, centroid(13,25)).
polygon(r41, [xy(13,8),xy(13,41),xy(13,8)]).
fillpoint(r41, xy(13,41), 1).
fillpoint(r41, xy(13,40), 1).
fillpoint(r41, xy(13,39), 1).
fillpoint(r41, xy(13,38), 1).
fillpoint(r41, xy(13,37), 1).
region(r42, '#25cc42', 69, centroid(23,16)).
polygon(r42, [xy(14,8),xy(14,41),xy(14,8)]).
fillpoint(r42, xy(49,8), 1).
fillpoint(r42, xy(48,8), 1).
fillpoint(r42, xy(47,8), 1).
fillpoint(r42, xy(46,8), 1).
fillpoint(r42, xy(45,8), 1).
region(r43, '#2ecc40', 907, centroid(34,26)).
polygon(r43, [xy(15,14),xy(15,42),xy(16,42),xy(17,43),xy(17,44),xy(19,44),xy(20,45),xy(21,44),xy(44,44),xy(45,43),xy(45,44),xy(46,42),xy(47,42),xy(48,41),xy(49,41),xy(50,40),xy(50,39),xy(51,38),xy(52,38),xy(53,37),xy(53,35),xy(54,34),xy(54,33),xy(56,31),xy(56,30),xy(57,29),xy(56,28),xy(56,22),xy(59,19),xy(59,16),xy(58,15),xy(51,15),xy(50,14),xy(50,10),xy(49,9),xy(20,9),xy(20,12),xy(18,14),xy(16,14),xy(15,14)]).
hole(r43, [xy(21,30),xy(21,38),xy(43,38),xy(44,37),xy(44,36),xy(45,35),xy(48,35),xy(49,34),xy(49,32),xy(48,31),xy(47,32),xy(45,32),xy(43,30),xy(44,29),xy(49,29),xy(50,28),xy(50,22),xy(49,21),xy(45,21),xy(44,20),xy(44,16),xy(43,15),xy(27,15),xy(27,21),xy(28,21),xy(29,22),xy(29,23),xy(34,23),xy(35,22),xy(36,23),xy(36,29),xy(35,30),xy(22,30),xy(21,30)]).
midline(r43, [xy(17,31),xy(17,37),xy(18,36),xy(18,29),xy(21,23),xy(21,22),xy(22,23),xy(28,26),xy(30,26),xy(30,27),xy(31,26),xy(31,27),xy(32,26),xy(32,27),xy(33,26)]).
midline(r43, [xy(18,37),xy(18,41),xy(19,40),xy(19,41),xy(20,41),xy(20,42),xy(22,41),xy(22,42),xy(23,41),xy(23,42),xy(24,41),xy(24,42),xy(25,41),xy(25,42),xy(26,41),xy(26,42),xy(27,41),xy(27,42),xy(28,41),xy(28,42),xy(29,41),xy(29,42),xy(30,41),xy(30,42),xy(31,41),xy(31,42),xy(32,41),xy(32,42),xy(33,41),xy(33,42),xy(34,41),xy(34,42),xy(35,41),xy(35,42),xy(36,41),xy(36,42),xy(37,41),xy(37,42),xy(38,41),xy(38,42),xy(39,41),xy(39,42),xy(40,41),xy(40,42),xy(41,41),xy(41,42),xy(42,41),xy(42,42),xy(44,41),xy(46,39),xy(47,39),xy(49,37),xy(49,38),xy(50,37),xy(50,36),xy(51,35),xy(51,36),xy(52,34),xy(52,32),xy(53,32),xy(53,30),xy(54,29),xy(53,27),xy(53,23),xy(54,23),xy(54,27)]).
midline(r43, [xy(20,17),xy(20,20),xy(21,19),xy(21,16),xy(22,14),xy(23,13),xy(23,14),xy(24,13),xy(28,11),xy(28,12),xy(29,11),xy(29,12),xy(30,11),xy(30,12),xy(31,11),xy(31,12),xy(32,11),xy(32,12),xy(33,11),xy(33,12),xy(34,11),xy(34,12),xy(35,11),xy(35,12),xy(36,11),xy(36,12),xy(37,11),xy(37,12),xy(38,11),xy(38,12),xy(39,11),xy(39,12),xy(40,11),xy(40,12),xy(41,11),xy(41,12),xy(42,11),xy(42,12),xy(43,11),xy(43,12),xy(46,12),xy(46,13),xy(47,12),xy(47,14),xy(48,15),xy(48,17),xy(49,16),xy(49,17),xy(50,17),xy(51,18),xy(53,19),xy(54,19),xy(54,20),xy(55,19)]).
midline(r43, [xy(21,20)]).
midline(r43, [xy(56,32)]).
fillpoint(r43, xy(22,23), 7).
fillpoint(r43, xy(21,23), 7).
fillpoint(r43, xy(21,22), 7).
fillpoint(r43, xy(24,24), 6).
fillpoint(r43, xy(23,24), 6).
region(r44, '#fcdc01', 5, centroid(56,10)).
polygon(r44, [xy(56,8),xy(56,12),xy(56,8)]).
fillpoint(r44, xy(56,12), 1).
fillpoint(r44, xy(56,11), 1).
fillpoint(r44, xy(56,10), 1).
fillpoint(r44, xy(56,9), 1).
fillpoint(r44, xy(56,8), 1).
region(r45, '#ffdd00', 6, centroid(57,11)).
polygon(r45, [xy(57,8),xy(57,13),xy(57,8)]).
fillpoint(r45, xy(57,13), 1).
fillpoint(r45, xy(57,12), 1).
fillpoint(r45, xy(57,11), 1).
fillpoint(r45, xy(57,10), 1).
fillpoint(r45, xy(57,9), 1).
region(r46, '#5fc953', 7, centroid(58,11)).
polygon(r46, [xy(58,8),xy(58,14),xy(58,8)]).
fillpoint(r46, xy(58,14), 1).
fillpoint(r46, xy(58,13), 1).
fillpoint(r46, xy(58,12), 1).
fillpoint(r46, xy(58,11), 1).
fillpoint(r46, xy(58,10), 1).
region(r47, '#25cc42', 13, centroid(59,14)).
polygon(r47, [xy(59,8),xy(59,14),xy(60,14),xy(60,19),xy(59,8)]).
fillpoint(r47, xy(60,19), 1).
fillpoint(r47, xy(60,18), 1).
fillpoint(r47, xy(60,17), 1).
fillpoint(r47, xy(60,16), 1).
fillpoint(r47, xy(60,15), 1).
region(r49, '#848280', 13, centroid(16,10)).
polygon(r49, [xy(15,9),xy(15,12),xy(17,12),xy(18,11),xy(18,10),xy(17,9),xy(16,9),xy(16,10),xy(18,9),xy(15,9)]).
hole(r49, [xy(16,11),xy(17,10),xy(17,11),xy(16,11)]).
fillpoint(r49, xy(18,12), 1).
fillpoint(r49, xy(18,11), 1).
fillpoint(r49, xy(18,10), 1).
fillpoint(r49, xy(18,9), 1).
fillpoint(r49, xy(17,12), 1).
region(r50, '#5fc953', 4, centroid(19,11)).
polygon(r50, [xy(19,9),xy(19,12),xy(19,9)]).
fillpoint(r50, xy(19,12), 1).
fillpoint(r50, xy(19,11), 1).
fillpoint(r50, xy(19,10), 1).
fillpoint(r50, xy(19,9), 1).
region(r56, '#acaaab', 10, centroid(62,17)).
polygon(r56, [xy(62,12),xy(62,21),xy(62,12)]).
fillpoint(r56, xy(62,21), 1).
fillpoint(r56, xy(62,20), 1).
fillpoint(r56, xy(62,19), 1).
fillpoint(r56, xy(62,18), 1).
fillpoint(r56, xy(62,17), 1).
region(r57, '#aaaaa9', 12, centroid(63,18)).
polygon(r57, [xy(63,12),xy(63,23),xy(63,12)]).
fillpoint(r57, xy(63,23), 1).
fillpoint(r57, xy(63,22), 1).
fillpoint(r57, xy(63,21), 1).
fillpoint(r57, xy(63,20), 1).
fillpoint(r57, xy(63,19), 1).
region(r58, '#5fc953', 4, centroid(17,13)).
polygon(r58, [xy(15,13),xy(18,13),xy(15,13)]).
fillpoint(r58, xy(18,13), 1).
fillpoint(r58, xy(17,13), 1).
fillpoint(r58, xy(16,13), 1).
fillpoint(r58, xy(15,13), 1).
region(r60, '#5fc953', 8, centroid(61,18)).
polygon(r60, [xy(61,14),xy(61,21),xy(61,14)]).
fillpoint(r60, xy(61,21), 1).
fillpoint(r60, xy(61,20), 1).
fillpoint(r60, xy(61,19), 1).
fillpoint(r60, xy(61,18), 1).
fillpoint(r60, xy(61,17), 1).
region(r61, '#25cc42', 7, centroid(27,18)).
polygon(r61, [xy(27,15),xy(27,21),xy(27,15)]).
fillpoint(r61, xy(27,21), 1).
fillpoint(r61, xy(27,20), 1).
fillpoint(r61, xy(27,19), 1).
fillpoint(r61, xy(27,18), 1).
fillpoint(r61, xy(27,17), 1).
region(r63, '#acaaab', 21, centroid(32,16)).
polygon(r63, [xy(29,15),xy(29,17),xy(34,17),xy(35,16),xy(34,15),xy(30,15),xy(29,15)]).
midline(r63, [xy(30,16),xy(34,16)]).
fillpoint(r63, xy(34,16), 2).
fillpoint(r63, xy(33,16), 2).
fillpoint(r63, xy(32,16), 2).
fillpoint(r63, xy(31,16), 2).
fillpoint(r63, xy(30,16), 2).
region(r64, '#fcdc01', 21, centroid(37,20)).
polygon(r64, [xy(36,15),xy(36,29),xy(36,15)]).
fillpoint(r64, xy(42,15), 1).
fillpoint(r64, xy(41,15), 1).
fillpoint(r64, xy(40,15), 1).
fillpoint(r64, xy(39,15), 1).
fillpoint(r64, xy(38,15), 1).
region(r65, '#5fc953', 7, centroid(43,18)).
polygon(r65, [xy(43,15),xy(43,21),xy(43,15)]).
fillpoint(r65, xy(43,21), 1).
fillpoint(r65, xy(43,20), 1).
fillpoint(r65, xy(43,19), 1).
fillpoint(r65, xy(43,18), 1).
fillpoint(r65, xy(43,17), 1).
region(r66, '#25cc42', 13, centroid(46,19)).
polygon(r66, [xy(44,15),xy(44,21),xy(50,21),xy(44,15)]).
fillpoint(r66, xy(50,21), 1).
fillpoint(r66, xy(49,21), 1).
fillpoint(r66, xy(48,21), 1).
fillpoint(r66, xy(47,21), 1).
fillpoint(r66, xy(46,21), 1).
region(r67, '#ffdd00', 7, centroid(37,19)).
polygon(r67, [xy(37,16),xy(37,22),xy(37,16)]).
fillpoint(r67, xy(37,22), 1).
fillpoint(r67, xy(37,21), 1).
fillpoint(r67, xy(37,20), 1).
fillpoint(r67, xy(37,19), 1).
fillpoint(r67, xy(37,18), 1).
region(r68, '#ffdc00', 172, centroid(37,28)).
polygon(r68, [xy(22,31),xy(22,34),xy(23,33),xy(23,34),xy(39,34),xy(40,33),xy(40,30),xy(41,29),xy(42,29),xy(43,28),xy(46,28),xy(47,27),xy(47,28),xy(48,28),xy(49,27),xy(47,25),xy(43,25),xy(42,24),xy(42,23),xy(40,21),xy(40,17),xy(39,16),xy(38,16),xy(38,22),xy(37,23),xy(37,29),xy(35,31),xy(23,31),xy(24,32),xy(22,31)]).
midline(r68, [xy(24,33),xy(25,32),xy(25,33),xy(26,32),xy(26,33),xy(27,32),xy(27,33),xy(28,32),xy(28,33),xy(29,32),xy(29,33),xy(30,32),xy(30,33),xy(31,32),xy(31,33),xy(32,32),xy(32,33),xy(33,32),xy(33,33),xy(34,32),xy(34,33),xy(36,32),xy(37,31),xy(37,32),xy(38,31),xy(38,30),xy(39,29),xy(40,27),xy(40,25),xy(41,26)]).
midline(r68, [xy(38,32)]).
midline(r68, [xy(39,17),xy(39,23),xy(40,23)]).
midline(r68, [xy(44,26),xy(44,27),xy(45,26),xy(45,27),xy(46,26),xy(46,27),xy(47,26)]).
fillpoint(r68, xy(41,26), 4).
fillpoint(r68, xy(40,27), 4).
fillpoint(r68, xy(40,26), 4).
fillpoint(r68, xy(40,25), 4).
fillpoint(r68, xy(42,27), 3).
region(r69, '#ffdd00', 7, centroid(42,19)).
polygon(r69, [xy(42,16),xy(42,22),xy(42,16)]).
fillpoint(r69, xy(42,22), 1).
fillpoint(r69, xy(42,21), 1).
fillpoint(r69, xy(42,20), 1).
fillpoint(r69, xy(42,19), 1).
fillpoint(r69, xy(42,18), 1).
region(r70, '#fcdc01', 5, centroid(41,19)).
polygon(r70, [xy(41,17),xy(41,21),xy(41,17)]).
fillpoint(r70, xy(41,21), 1).
fillpoint(r70, xy(41,20), 1).
fillpoint(r70, xy(41,19), 1).
fillpoint(r70, xy(41,18), 1).
fillpoint(r70, xy(41,17), 1).
region(r71, '#848280', 39, centroid(32,20)).
polygon(r71, [xy(28,18),xy(28,21),xy(29,22),xy(34,22),xy(35,21),xy(35,19),xy(34,18),xy(29,18),xy(28,18)]).
midline(r71, [xy(30,20),xy(33,20)]).
fillpoint(r71, xy(33,20), 3).
fillpoint(r71, xy(32,20), 3).
fillpoint(r71, xy(31,20), 3).
fillpoint(r71, xy(30,20), 3).
fillpoint(r71, xy(34,21), 2).
region(r74, '#5fc953', 7, centroid(47,22)).
polygon(r74, [xy(44,22),xy(50,22),xy(44,22)]).
fillpoint(r74, xy(50,22), 1).
fillpoint(r74, xy(49,22), 1).
fillpoint(r74, xy(48,22), 1).
fillpoint(r74, xy(47,22), 1).
fillpoint(r74, xy(46,22), 1).
region(r75, '#25cc42', 7, centroid(57,25)).
polygon(r75, [xy(57,22),xy(57,28),xy(57,22)]).
fillpoint(r75, xy(57,28), 1).
fillpoint(r75, xy(57,27), 1).
fillpoint(r75, xy(57,26), 1).
fillpoint(r75, xy(57,25), 1).
fillpoint(r75, xy(57,24), 1).
region(r76, '#5fc953', 7, centroid(58,23)).
polygon(r76, [xy(58,22),xy(58,26),xy(58,22)]).
fillpoint(r76, xy(60,22), 1).
fillpoint(r76, xy(59,22), 1).
fillpoint(r76, xy(58,26), 1).
fillpoint(r76, xy(58,25), 1).
fillpoint(r76, xy(58,24), 1).
region(r79, '#25cc42', 6, centroid(32,23)).
polygon(r79, [xy(29,23),xy(34,23),xy(29,23)]).
fillpoint(r79, xy(34,23), 1).
fillpoint(r79, xy(33,23), 1).
fillpoint(r79, xy(32,23), 1).
fillpoint(r79, xy(31,23), 1).
fillpoint(r79, xy(30,23), 1).
region(r80, '#ffdd00', 7, centroid(46,23)).
polygon(r80, [xy(43,23),xy(49,23),xy(43,23)]).
fillpoint(r80, xy(49,23), 1).
fillpoint(r80, xy(48,23), 1).
fillpoint(r80, xy(47,23), 1).
fillpoint(r80, xy(46,23), 1).
fillpoint(r80, xy(45,23), 1).
region(r84, '#fcdc01', 20, centroid(47,27)).
polygon(r84, [xy(43,24),xy(50,24),xy(50,28),xy(49,29),xy(43,29),xy(43,24)]).
fillpoint(r84, xy(50,29), 1).
fillpoint(r84, xy(50,28), 1).
fillpoint(r84, xy(50,27), 1).
fillpoint(r84, xy(50,26), 1).
fillpoint(r84, xy(50,25), 1).
region(r86, '#aaaaa9', 6, centroid(60,26)).
polygon(r86, [xy(60,24),xy(60,28),xy(60,24)]).
fillpoint(r86, xy(61,24), 1).
fillpoint(r86, xy(60,28), 1).
fillpoint(r86, xy(60,27), 1).
fillpoint(r86, xy(60,26), 1).
fillpoint(r86, xy(60,25), 1).
region(r98, '#fcdc01', 46, centroid(30,33)).
polygon(r98, [xy(21,30),xy(21,35),xy(40,35),xy(41,34),xy(41,30),xy(21,30)]).
fillpoint(r98, xy(42,35), 1).
fillpoint(r98, xy(41,35), 1).
fillpoint(r98, xy(41,34), 1).
fillpoint(r98, xy(41,33), 1).
fillpoint(r98, xy(41,32), 1).
region(r99, '#ffdd00', 5, centroid(42,32)).
polygon(r99, [xy(42,30),xy(42,34),xy(42,30)]).
fillpoint(r99, xy(42,34), 1).
fillpoint(r99, xy(42,33), 1).
fillpoint(r99, xy(42,32), 1).
fillpoint(r99, xy(42,31), 1).
fillpoint(r99, xy(42,30), 1).
region(r100, '#5fc953', 30, centroid(35,36)).
polygon(r100, [xy(21,37),xy(42,37),xy(43,36),xy(43,30),xy(21,37)]).
fillpoint(r100, xy(43,37), 1).
fillpoint(r100, xy(43,36), 1).
fillpoint(r100, xy(43,35), 1).
fillpoint(r100, xy(43,34), 1).
fillpoint(r100, xy(43,33), 1).
region(r105, '#25cc42', 7, centroid(44,34)).
polygon(r105, [xy(44,31),xy(44,37),xy(44,31)]).
fillpoint(r105, xy(44,37), 1).
fillpoint(r105, xy(44,36), 1).
fillpoint(r105, xy(44,35), 1).
fillpoint(r105, xy(44,34), 1).
fillpoint(r105, xy(44,33), 1).
region(r109, '#848280', 13, centroid(46,34)).
polygon(r109, [xy(45,32),xy(45,35),xy(46,34),xy(46,35),xy(47,35),xy(48,34),xy(48,33),xy(47,32),xy(48,32),xy(45,32)]).
hole(r109, [xy(46,33),xy(47,33),xy(47,34),xy(46,33)]).
fillpoint(r109, xy(48,35), 1).
fillpoint(r109, xy(48,34), 1).
fillpoint(r109, xy(48,33), 1).
fillpoint(r109, xy(48,32), 1).
fillpoint(r109, xy(47,35), 1).
region(r114, '#aaaaa9', 6, centroid(57,35)).
polygon(r114, [xy(57,33),xy(57,37),xy(57,33)]).
fillpoint(r114, xy(58,33), 1).
fillpoint(r114, xy(57,37), 1).
fillpoint(r114, xy(57,36), 1).
fillpoint(r114, xy(57,35), 1).
fillpoint(r114, xy(57,34), 1).
region(r120, '#5fc953', 4, centroid(55,35)).
polygon(r120, [xy(55,34),xy(55,36),xy(56,34),xy(55,34)]).
fillpoint(r120, xy(56,34), 1).
fillpoint(r120, xy(55,36), 1).
fillpoint(r120, xy(55,35), 1).
fillpoint(r120, xy(55,34), 1).
region(r123, '#c8bf76', 4, centroid(7,36)).
polygon(r123, [xy(7,35),xy(7,37),xy(8,37),xy(7,35)]).
fillpoint(r123, xy(8,37), 1).
fillpoint(r123, xy(7,37), 1).
fillpoint(r123, xy(7,36), 1).
fillpoint(r123, xy(7,35), 1).
region(r127, '#ffdd00', 21, centroid(32,36)).
polygon(r127, [xy(22,36),xy(42,36),xy(22,36)]).
fillpoint(r127, xy(42,36), 1).
fillpoint(r127, xy(41,36), 1).
fillpoint(r127, xy(40,36), 1).
fillpoint(r127, xy(39,36), 1).
fillpoint(r127, xy(38,36), 1).
region(r133, '#25cc42', 23, centroid(32,38)).
polygon(r133, [xy(21,38),xy(43,38),xy(21,38)]).
fillpoint(r133, xy(43,38), 1).
fillpoint(r133, xy(42,38), 1).
fillpoint(r133, xy(41,38), 1).
fillpoint(r133, xy(40,38), 1).
fillpoint(r133, xy(39,38), 1).
region(r153, '#aaaaa9', 9, centroid(13,43)).
polygon(r153, [xy(10,42),xy(14,42),xy(14,43),xy(13,44),xy(14,44),xy(10,42)]).
fillpoint(r153, xy(14,44), 1).
fillpoint(r153, xy(14,43), 1).
fillpoint(r153, xy(14,42), 1).
fillpoint(r153, xy(13,44), 1).
fillpoint(r153, xy(13,42), 1).
region(r154, '#aaaaa9', 8, centroid(49,43)).
polygon(r154, [xy(48,42),xy(48,44),xy(49,44),xy(49,42),xy(52,42),xy(48,42)]).
fillpoint(r154, xy(52,42), 1).
fillpoint(r154, xy(51,42), 1).
fillpoint(r154, xy(50,42), 1).
fillpoint(r154, xy(49,44), 1).
fillpoint(r154, xy(49,42), 1).
region(r163, '#acaaab', 4, centroid(17,46)).
polygon(r163, [xy(16,46),xy(17,46),xy(18,45),xy(18,46),xy(16,46)]).
fillpoint(r163, xy(18,46), 1).
fillpoint(r163, xy(18,45), 1).
fillpoint(r163, xy(17,46), 1).
fillpoint(r163, xy(16,46), 1).
region(r165, '#fcdc01', 24, centroid(31,45)).
polygon(r165, [xy(21,45),xy(25,45),xy(25,46),xy(26,45),xy(37,45),xy(37,46),xy(38,45),xy(42,45),xy(21,45)]).
fillpoint(r165, xy(42,45), 1).
fillpoint(r165, xy(41,45), 1).
fillpoint(r165, xy(40,45), 1).
fillpoint(r165, xy(39,45), 1).
fillpoint(r165, xy(38,45), 1).
region(r166, '#c8bf76', 7, centroid(41,46)).
polygon(r166, [xy(38,46),xy(42,46),xy(43,45),xy(43,46),xy(38,46)]).
fillpoint(r166, xy(43,46), 1).
fillpoint(r166, xy(43,45), 1).
fillpoint(r166, xy(42,46), 1).
fillpoint(r166, xy(41,46), 1).
fillpoint(r166, xy(40,46), 1).
region(r171, '#c8bf76', 4, centroid(23,46)).
polygon(r171, [xy(21,46),xy(24,46),xy(21,46)]).
fillpoint(r171, xy(24,46), 1).
fillpoint(r171, xy(23,46), 1).
fillpoint(r171, xy(22,46), 1).
fillpoint(r171, xy(21,46), 1).
region(r172, '#ffdd00', 11, centroid(31,46)).
polygon(r172, [xy(26,46),xy(36,46),xy(26,46)]).
fillpoint(r172, xy(36,46), 1).
fillpoint(r172, xy(35,46), 1).
fillpoint(r172, xy(34,46), 1).
fillpoint(r172, xy(33,46), 1).
fillpoint(r172, xy(32,46), 1).
region(r176, '#aaaaab', 4, centroid(23,47)).
polygon(r176, [xy(21,47),xy(24,47),xy(21,47)]).
fillpoint(r176, xy(24,47), 1).
fillpoint(r176, xy(23,47), 1).
fillpoint(r176, xy(22,47), 1).
fillpoint(r176, xy(21,47), 1).
region(r178, '#fcdc01', 11, centroid(31,47)).
polygon(r178, [xy(26,47),xy(36,47),xy(26,47)]).
fillpoint(r178, xy(36,47), 1).
fillpoint(r178, xy(35,47), 1).
fillpoint(r178, xy(34,47), 1).
fillpoint(r178, xy(33,47), 1).
fillpoint(r178, xy(32,47), 1).
region(r180, '#aaaaab', 6, centroid(41,47)).
polygon(r180, [xy(38,47),xy(43,47),xy(38,47)]).
fillpoint(r180, xy(43,47), 1).
fillpoint(r180, xy(42,47), 1).
fillpoint(r180, xy(41,47), 1).
fillpoint(r180, xy(40,47), 1).
fillpoint(r180, xy(39,47), 1).
region(r182, '#aaaaa9', 25, centroid(31,48)).
polygon(r182, [xy(19,48),xy(43,48),xy(19,48)]).
fillpoint(r182, xy(43,48), 1).
fillpoint(r182, xy(42,48), 1).
fillpoint(r182, xy(41,48), 1).
fillpoint(r182, xy(40,48), 1).
fillpoint(r182, xy(39,48), 1).
region(r183, '#aaaaab', 13, centroid(31,49)).
polygon(r183, [xy(25,49),xy(37,49),xy(25,49)]).
fillpoint(r183, xy(37,49), 1).
fillpoint(r183, xy(36,49), 1).
fillpoint(r183, xy(35,49), 1).
fillpoint(r183, xy(34,49), 1).
fillpoint(r183, xy(33,49), 1).
region(r184, '#aaaaa9', 11, centroid(31,50)).
polygon(r184, [xy(26,50),xy(36,50),xy(26,50)]).
fillpoint(r184, xy(36,50), 1).
fillpoint(r184, xy(35,50), 1).
fillpoint(r184, xy(34,50), 1).
fillpoint(r184, xy(33,50), 1).
fillpoint(r184, xy(32,50), 1).
region(r185, '#aaaaa9', 4, centroid(9,81)).
polygon(r185, [xy(7,81),xy(10,81),xy(7,81)]).
fillpoint(r185, xy(10,81), 1).
fillpoint(r185, xy(9,81), 1).
fillpoint(r185, xy(8,81), 1).
fillpoint(r185, xy(7,81), 1).
region(r186, '#acaaab', 64, centroid(9,88)).
polygon(r186, [xy(4,88),xy(4,91),xy(12,91),xy(13,90),xy(13,89),xy(12,88),xy(11,88),xy(10,87),xy(10,83),xy(9,82),xy(7,82),xy(7,87),xy(6,88),xy(5,88),xy(4,88)]).
midline(r186, [xy(5,89),xy(5,90),xy(7,89),xy(8,88),xy(8,89),xy(9,88),xy(9,89),xy(12,89),xy(12,90)]).
midline(r186, [xy(8,83),xy(8,86),xy(9,85),xy(9,83)]).
midline(r186, [xy(9,86)]).
fillpoint(r186, xy(10,89), 3).
fillpoint(r186, xy(9,89), 3).
fillpoint(r186, xy(9,88), 3).
fillpoint(r186, xy(8,89), 3).
fillpoint(r186, xy(8,88), 3).
region(r187, '#aaaaa9', 7, centroid(6,86)).
polygon(r187, [xy(4,87),xy(5,87),xy(6,86),xy(6,83),xy(4,87)]).
fillpoint(r187, xy(6,87), 1).
fillpoint(r187, xy(6,86), 1).
fillpoint(r187, xy(6,85), 1).
fillpoint(r187, xy(6,84), 1).
fillpoint(r187, xy(6,83), 1).
region(r188, '#aaaaa9', 7, centroid(11,86)).
polygon(r188, [xy(11,83),xy(11,87),xy(13,87),xy(11,83)]).
fillpoint(r188, xy(13,87), 1).
fillpoint(r188, xy(12,87), 1).
fillpoint(r188, xy(11,87), 1).
fillpoint(r188, xy(11,86), 1).
fillpoint(r188, xy(11,85), 1).
region(r191, '#aaaaa9', 64, centroid(51,89)).
polygon(r191, [xy(19,89),xy(82,89),xy(19,89)]).
fillpoint(r191, xy(82,89), 1).
fillpoint(r191, xy(81,89), 1).
fillpoint(r191, xy(80,89), 1).
fillpoint(r191, xy(79,89), 1).
fillpoint(r191, xy(78,89), 1).
region(r193, '#aaaaab', 4, centroid(90,89)).
polygon(r193, [xy(88,89),xy(91,89),xy(88,89)]).
fillpoint(r193, xy(91,89), 1).
fillpoint(r193, xy(90,89), 1).
fillpoint(r193, xy(89,89), 1).
fillpoint(r193, xy(88,89), 1).
region(r196, '#acaaab', 64, centroid(51,90)).
polygon(r196, [xy(19,90),xy(82,90),xy(19,90)]).
fillpoint(r196, xy(82,90), 1).
fillpoint(r196, xy(81,90), 1).
fillpoint(r196, xy(80,90), 1).
fillpoint(r196, xy(79,90), 1).
fillpoint(r196, xy(78,90), 1).
region(r197, '#aaaaa9', 4, centroid(85,90)).
polygon(r197, [xy(83,90),xy(86,90),xy(83,90)]).
fillpoint(r197, xy(86,90), 1).
fillpoint(r197, xy(85,90), 1).
fillpoint(r197, xy(84,90), 1).
fillpoint(r197, xy(83,90), 1).
region(r198, '#aaaaa9', 4, centroid(90,90)).
polygon(r198, [xy(88,90),xy(91,90),xy(88,90)]).
fillpoint(r198, xy(91,90), 1).
fillpoint(r198, xy(90,90), 1).
fillpoint(r198, xy(89,90), 1).
fillpoint(r198, xy(88,90), 1).
region(r200, '#aaaaa9', 4, centroid(17,93)).
polygon(r200, [xy(17,91),xy(17,94),xy(17,91)]).
fillpoint(r200, xy(17,94), 1).
fillpoint(r200, xy(17,93), 1).
fillpoint(r200, xy(17,92), 1).
fillpoint(r200, xy(17,91), 1).
region(r201, '#acaaab', 4, centroid(18,93)).
polygon(r201, [xy(18,91),xy(18,94),xy(18,91)]).
fillpoint(r201, xy(18,94), 1).
fillpoint(r201, xy(18,93), 1).
fillpoint(r201, xy(18,92), 1).
fillpoint(r201, xy(18,91), 1).
region(r204, '#848280', 240, centroid(52,93)).
polygon(r204, [xy(22,91),xy(23,91),xy(23,93),xy(22,94),xy(81,94),xy(82,93),xy(82,92),xy(81,91),xy(24,91),xy(22,91)]).
midline(r204, [xy(24,92),xy(24,93),xy(25,92),xy(25,93),xy(26,92),xy(26,93),xy(27,92),xy(27,93),xy(28,92),xy(28,93),xy(29,92),xy(29,93),xy(30,92),xy(30,93),xy(31,92),xy(31,93),xy(32,92),xy(32,93),xy(33,92),xy(33,93),xy(34,92),xy(34,93),xy(35,92),xy(35,93),xy(36,92),xy(36,93),xy(37,92),xy(37,93),xy(38,92),xy(38,93),xy(39,92),xy(39,93),xy(40,92),xy(40,93),xy(41,92),xy(41,93),xy(42,92),xy(42,93),xy(43,92),xy(43,93),xy(44,92),xy(44,93),xy(45,92),xy(45,93),xy(46,92),xy(46,93),xy(47,92),xy(47,93),xy(48,92),xy(48,93),xy(49,92),xy(49,93),xy(50,92),xy(50,93),xy(51,92),xy(51,93),xy(52,92),xy(52,93),xy(53,92),xy(53,93),xy(54,92),xy(54,93),xy(55,92),xy(55,93),xy(56,92),xy(56,93),xy(57,92),xy(57,93),xy(58,92),xy(58,93),xy(59,92),xy(59,93),xy(60,92),xy(60,93),xy(61,92),xy(61,93),xy(62,92),xy(62,93),xy(63,92),xy(63,93),xy(64,92),xy(64,93),xy(65,92),xy(65,93),xy(66,92),xy(66,93),xy(67,92),xy(67,93),xy(68,92),xy(68,93),xy(69,92),xy(69,93),xy(70,92),xy(70,93),xy(71,92),xy(71,93),xy(72,92),xy(72,93),xy(73,92),xy(73,93),xy(74,92),xy(74,93),xy(75,92),xy(75,93),xy(76,92),xy(76,93),xy(77,92),xy(77,93),xy(78,92),xy(78,93),xy(79,92),xy(79,93),xy(80,92),xy(80,93),xy(81,92),xy(81,93)]).
fillpoint(r204, xy(81,93), 2).
fillpoint(r204, xy(81,92), 2).
fillpoint(r204, xy(80,93), 2).
fillpoint(r204, xy(80,92), 2).
fillpoint(r204, xy(79,93), 2).
region(r206, '#acaaab', 4, centroid(83,93)).
polygon(r206, [xy(83,91),xy(83,94),xy(83,91)]).
fillpoint(r206, xy(83,94), 1).
fillpoint(r206, xy(83,93), 1).
fillpoint(r206, xy(83,92), 1).
fillpoint(r206, xy(83,91), 1).
region(r207, '#aaaaab', 12, centroid(85,93)).
polygon(r207, [xy(84,91),xy(84,94),xy(85,94),xy(86,93),xy(86,92),xy(85,91),xy(86,91),xy(84,91)]).
midline(r207, [xy(85,92),xy(85,93)]).
fillpoint(r207, xy(85,93), 2).
fillpoint(r207, xy(85,92), 2).
fillpoint(r207, xy(86,94), 1).
fillpoint(r207, xy(86,93), 1).
fillpoint(r207, xy(86,92), 1).
region(r208, '#aaaaab', 16, centroid(90,93)).
polygon(r208, [xy(88,91),xy(88,94),xy(90,94),xy(91,93),xy(91,92),xy(90,91),xy(91,91),xy(88,91)]).
midline(r208, [xy(89,92),xy(89,93),xy(90,92),xy(90,93)]).
fillpoint(r208, xy(90,93), 2).
fillpoint(r208, xy(90,92), 2).
fillpoint(r208, xy(89,93), 2).
fillpoint(r208, xy(89,92), 2).
fillpoint(r208, xy(91,94), 1).
region(r209, '#aaaaab', 12, centroid(94,93)).
polygon(r209, [xy(93,91),xy(93,94),xy(94,94),xy(95,93),xy(95,92),xy(94,91),xy(95,91),xy(93,91)]).
midline(r209, [xy(94,92),xy(94,93)]).
fillpoint(r209, xy(94,93), 2).
fillpoint(r209, xy(94,92), 2).
fillpoint(r209, xy(95,94), 1).
fillpoint(r209, xy(95,93), 1).
fillpoint(r209, xy(95,92), 1).
region(r210, '#aaaaa9', 10, centroid(9,92)).
polygon(r210, [xy(4,92),xy(13,92),xy(4,92)]).
fillpoint(r210, xy(13,92), 1).
fillpoint(r210, xy(12,92), 1).
fillpoint(r210, xy(11,92), 1).
fillpoint(r210, xy(10,92), 1).
fillpoint(r210, xy(9,92), 1).
region(r212, '#25cc42', 4, centroid(21,93)).
polygon(r212, [xy(20,92),xy(20,93),xy(21,92),xy(21,93),xy(20,92)]).
fillpoint(r212, xy(21,93), 1).
fillpoint(r212, xy(21,92), 1).
fillpoint(r212, xy(20,93), 1).
fillpoint(r212, xy(20,92), 1).
region(r222, '#acaaab', 64, centroid(51,95)).
polygon(r222, [xy(19,95),xy(82,95),xy(19,95)]).
fillpoint(r222, xy(82,95), 1).
fillpoint(r222, xy(81,95), 1).
fillpoint(r222, xy(80,95), 1).
fillpoint(r222, xy(79,95), 1).
fillpoint(r222, xy(78,95), 1).
region(r223, '#aaaaa9', 4, centroid(85,95)).
polygon(r223, [xy(83,95),xy(86,95),xy(83,95)]).
fillpoint(r223, xy(86,95), 1).
fillpoint(r223, xy(85,95), 1).
fillpoint(r223, xy(84,95), 1).
fillpoint(r223, xy(83,95), 1).
region(r224, '#aaaaa9', 4, centroid(90,95)).
polygon(r224, [xy(88,95),xy(91,95),xy(88,95)]).
fillpoint(r224, xy(91,95), 1).
fillpoint(r224, xy(90,95), 1).
fillpoint(r224, xy(89,95), 1).
fillpoint(r224, xy(88,95), 1).
adjacent(r1, r104).
shared_edge(r1, r104, 4).
adjacent(r1, r114).
shared_edge(r1, r114, 4).
adjacent(r1, r115).
shared_edge(r1, r115, 2).
adjacent(r1, r12).
shared_edge(r1, r12, 2).
adjacent(r1, r121).
shared_edge(r1, r121, 2).
adjacent(r1, r13).
shared_edge(r1, r13, 4).
adjacent(r1, r131).
shared_edge(r1, r131, 2).
adjacent(r1, r135).
shared_edge(r1, r135, 2).
adjacent(r1, r136).
shared_edge(r1, r136, 4).
adjacent(r1, r144).
shared_edge(r1, r144, 4).
adjacent(r1, r148).
shared_edge(r1, r148, 2).
adjacent(r1, r152).
shared_edge(r1, r152, 2).
adjacent(r1, r153).
shared_edge(r1, r153, 7).
adjacent(r1, r154).
shared_edge(r1, r154, 6).
adjacent(r1, r155).
shared_edge(r1, r155, 1).
adjacent(r1, r159).
shared_edge(r1, r159, 2).
adjacent(r1, r162).
shared_edge(r1, r162, 2).
adjacent(r1, r163).
shared_edge(r1, r163, 3).
adjacent(r1, r168).
shared_edge(r1, r168, 2).
adjacent(r1, r173).
shared_edge(r1, r173, 3).
adjacent(r1, r174).
shared_edge(r1, r174, 2).
adjacent(r1, r181).
shared_edge(r1, r181, 2).
adjacent(r1, r182).
shared_edge(r1, r182, 14).
adjacent(r1, r183).
shared_edge(r1, r183, 4).
adjacent(r1, r184).
shared_edge(r1, r184, 13).
adjacent(r1, r185).
shared_edge(r1, r185, 6).
adjacent(r1, r186).
shared_edge(r1, r186, 6).
adjacent(r1, r187).
shared_edge(r1, r187, 8).
adjacent(r1, r188).
shared_edge(r1, r188, 8).
adjacent(r1, r189).
shared_edge(r1, r189, 4).
adjacent(r1, r19).
shared_edge(r1, r19, 3).
adjacent(r1, r190).
shared_edge(r1, r190, 4).
adjacent(r1, r191).
shared_edge(r1, r191, 66).
adjacent(r1, r192).
shared_edge(r1, r192, 5).
adjacent(r1, r193).
shared_edge(r1, r193, 6).
adjacent(r1, r194).
shared_edge(r1, r194, 4).
adjacent(r1, r195).
shared_edge(r1, r195, 2).
adjacent(r1, r197).
shared_edge(r1, r197, 2).
adjacent(r1, r198).
shared_edge(r1, r198, 2).
adjacent(r1, r199).
shared_edge(r1, r199, 1).
adjacent(r1, r2).
shared_edge(r1, r2, 5).
adjacent(r1, r20).
shared_edge(r1, r20, 34).
adjacent(r1, r200).
shared_edge(r1, r200, 6).
adjacent(r1, r207).
shared_edge(r1, r207, 1).
adjacent(r1, r208).
shared_edge(r1, r208, 2).
adjacent(r1, r209).
shared_edge(r1, r209, 1).
adjacent(r1, r210).
shared_edge(r1, r210, 12).
adjacent(r1, r214).
shared_edge(r1, r214, 1).
adjacent(r1, r215).
shared_edge(r1, r215, 1).
adjacent(r1, r221).
shared_edge(r1, r221, 1).
adjacent(r1, r26).
shared_edge(r1, r26, 1).
adjacent(r1, r27).
shared_edge(r1, r27, 5).
adjacent(r1, r32).
shared_edge(r1, r32, 1).
adjacent(r1, r33).
shared_edge(r1, r33, 4).
adjacent(r1, r48).
shared_edge(r1, r48, 3).
adjacent(r1, r56).
shared_edge(r1, r56, 1).
adjacent(r1, r57).
shared_edge(r1, r57, 14).
adjacent(r1, r78).
shared_edge(r1, r78, 1).
adjacent(r1, r86).
shared_edge(r1, r86, 1).
adjacent(r1, r88).
shared_edge(r1, r88, 5).
adjacent(r1, r95).
shared_edge(r1, r95, 3).
adjacent(r10, r11).
shared_edge(r10, r11, 1).
adjacent(r10, r16).
shared_edge(r10, r16, 1).
adjacent(r10, r9).
shared_edge(r10, r9, 1).
adjacent(r100, r105).
shared_edge(r100, r105, 7).
adjacent(r100, r126).
shared_edge(r100, r126, 1).
adjacent(r100, r127).
shared_edge(r100, r127, 22).
adjacent(r100, r133).
shared_edge(r100, r133, 23).
adjacent(r100, r43).
shared_edge(r100, r43, 2).
adjacent(r100, r84).
shared_edge(r100, r84, 1).
adjacent(r100, r98).
shared_edge(r100, r98, 1).
adjacent(r100, r99).
shared_edge(r100, r99, 5).
adjacent(r101, r102).
shared_edge(r101, r102, 2).
adjacent(r101, r43).
shared_edge(r101, r43, 4).
adjacent(r102, r103).
shared_edge(r102, r103, 3).
adjacent(r102, r114).
shared_edge(r102, r114, 1).
adjacent(r102, r43).
shared_edge(r102, r43, 1).
adjacent(r102, r96).
shared_edge(r102, r96, 1).
adjacent(r103, r104).
shared_edge(r103, r104, 3).
adjacent(r103, r115).
shared_edge(r103, r115, 1).
adjacent(r103, r94).
shared_edge(r103, r94, 1).
adjacent(r104, r97).
shared_edge(r104, r97, 1).
adjacent(r105, r109).
shared_edge(r105, r109, 4).
adjacent(r105, r43).
shared_edge(r105, r43, 5).
adjacent(r106, r109).
shared_edge(r106, r109, 1).
adjacent(r106, r43).
shared_edge(r106, r43, 3).
adjacent(r107, r43).
shared_edge(r107, r43, 4).
adjacent(r108, r68).
shared_edge(r108, r68, 4).
adjacent(r109, r110).
shared_edge(r109, r110, 3).
adjacent(r109, r111).
shared_edge(r109, r111, 3).
adjacent(r109, r112).
shared_edge(r109, r112, 2).
adjacent(r109, r119).
shared_edge(r109, r119, 3).
adjacent(r109, r43).
shared_edge(r109, r43, 8).
adjacent(r11, r12).
shared_edge(r11, r12, 1).
adjacent(r11, r17).
shared_edge(r11, r17, 1).
adjacent(r110, r43).
shared_edge(r110, r43, 5).
adjacent(r111, r112).
shared_edge(r111, r112, 1).
adjacent(r112, r119).
shared_edge(r112, r119, 1).
adjacent(r113, r120).
shared_edge(r113, r120, 1).
adjacent(r113, r43).
shared_edge(r113, r43, 3).
adjacent(r114, r115).
shared_edge(r114, r115, 1).
adjacent(r114, r120).
shared_edge(r114, r120, 1).
adjacent(r114, r121).
shared_edge(r114, r121, 2).
adjacent(r114, r125).
shared_edge(r114, r125, 3).
adjacent(r114, r43).
shared_edge(r114, r43, 2).
adjacent(r116, r117).
shared_edge(r116, r117, 1).
adjacent(r116, r122).
shared_edge(r116, r122, 1).
adjacent(r116, r2).
shared_edge(r116, r2, 1).
adjacent(r116, r21).
shared_edge(r116, r21, 1).
adjacent(r117, r118).
shared_edge(r117, r118, 1).
adjacent(r117, r123).
shared_edge(r117, r123, 1).
adjacent(r117, r21).
shared_edge(r117, r21, 1).
adjacent(r118, r123).
shared_edge(r118, r123, 3).
adjacent(r118, r40).
shared_edge(r118, r40, 2).
adjacent(r118, r7).
shared_edge(r118, r7, 2).
adjacent(r12, r17).
shared_edge(r12, r17, 1).
adjacent(r12, r18).
shared_edge(r12, r18, 3).
adjacent(r12, r22).
shared_edge(r12, r22, 1).
adjacent(r12, r24).
shared_edge(r12, r24, 1).
adjacent(r12, r25).
shared_edge(r12, r25, 1).
adjacent(r120, r124).
shared_edge(r120, r124, 2).
adjacent(r120, r125).
shared_edge(r120, r125, 3).
adjacent(r120, r130).
shared_edge(r120, r130, 1).
adjacent(r120, r43).
shared_edge(r120, r43, 2).
adjacent(r122, r123).
shared_edge(r122, r123, 3).
adjacent(r122, r131).
shared_edge(r122, r131, 1).
adjacent(r122, r2).
shared_edge(r122, r2, 3).
adjacent(r123, r132).
shared_edge(r123, r132, 2).
adjacent(r123, r40).
shared_edge(r123, r40, 1).
adjacent(r124, r129).
shared_edge(r124, r129, 1).
adjacent(r124, r43).
shared_edge(r124, r43, 3).
adjacent(r125, r130).
shared_edge(r125, r130, 1).
adjacent(r125, r135).
shared_edge(r125, r135, 1).
adjacent(r126, r127).
shared_edge(r126, r127, 1).
adjacent(r126, r43).
shared_edge(r126, r43, 1).
adjacent(r126, r98).
shared_edge(r126, r98, 1).
adjacent(r127, r98).
shared_edge(r127, r98, 21).
adjacent(r128, r40).
shared_edge(r128, r40, 3).
adjacent(r128, r7).
shared_edge(r128, r7, 1).
adjacent(r129, r130).
shared_edge(r129, r130, 1).
adjacent(r129, r134).
shared_edge(r129, r134, 1).
adjacent(r129, r43).
shared_edge(r129, r43, 1).
adjacent(r13, r2).
shared_edge(r13, r2, 34).
adjacent(r13, r20).
shared_edge(r13, r20, 32).
adjacent(r130, r134).
shared_edge(r130, r134, 1).
adjacent(r131, r132).
shared_edge(r131, r132, 1).
adjacent(r132, r136).
shared_edge(r132, r136, 2).
adjacent(r132, r40).
shared_edge(r132, r40, 1).
adjacent(r133, r43).
shared_edge(r133, r43, 25).
adjacent(r134, r135).
shared_edge(r134, r135, 1).
adjacent(r134, r144).
shared_edge(r134, r144, 2).
adjacent(r134, r43).
shared_edge(r134, r43, 1).
adjacent(r136, r137).
shared_edge(r136, r137, 2).
adjacent(r137, r138).
shared_edge(r137, r138, 2).
adjacent(r137, r148).
shared_edge(r137, r148, 1).
adjacent(r137, r40).
shared_edge(r137, r40, 1).
adjacent(r138, r139).
shared_edge(r138, r139, 2).
adjacent(r138, r140).
shared_edge(r138, r140, 1).
adjacent(r138, r149).
shared_edge(r138, r149, 2).
adjacent(r138, r40).
shared_edge(r138, r40, 1).
adjacent(r139, r140).
shared_edge(r139, r140, 1).
adjacent(r139, r40).
shared_edge(r139, r40, 1).
adjacent(r14, r15).
shared_edge(r14, r15, 1).
adjacent(r14, r2).
shared_edge(r14, r2, 1).
adjacent(r14, r21).
shared_edge(r14, r21, 1).
adjacent(r14, r3).
shared_edge(r14, r3, 1).
adjacent(r140, r150).
shared_edge(r140, r150, 1).
adjacent(r140, r34).
shared_edge(r140, r34, 1).
adjacent(r140, r41).
shared_edge(r140, r41, 2).
adjacent(r141, r142).
shared_edge(r141, r142, 1).
adjacent(r141, r145).
shared_edge(r141, r145, 1).
adjacent(r141, r43).
shared_edge(r141, r43, 2).
adjacent(r142, r143).
shared_edge(r142, r143, 1).
adjacent(r142, r146).
shared_edge(r142, r146, 1).
adjacent(r142, r43).
shared_edge(r142, r43, 1).
adjacent(r143, r144).
shared_edge(r143, r144, 1).
adjacent(r143, r147).
shared_edge(r143, r147, 1).
adjacent(r143, r43).
shared_edge(r143, r43, 1).
adjacent(r144, r147).
shared_edge(r144, r147, 1).
adjacent(r145, r146).
shared_edge(r145, r146, 1).
adjacent(r145, r151).
shared_edge(r145, r151, 1).
adjacent(r145, r43).
shared_edge(r145, r43, 1).
adjacent(r146, r147).
shared_edge(r146, r147, 1).
adjacent(r146, r151).
shared_edge(r146, r151, 1).
adjacent(r147, r152).
shared_edge(r147, r152, 1).
adjacent(r148, r149).
shared_edge(r148, r149, 1).
adjacent(r149, r150).
shared_edge(r149, r150, 1).
adjacent(r149, r153).
shared_edge(r149, r153, 2).
adjacent(r15, r21).
shared_edge(r15, r21, 1).
adjacent(r15, r4).
shared_edge(r15, r4, 1).
adjacent(r15, r5).
shared_edge(r15, r5, 1).
adjacent(r150, r153).
shared_edge(r150, r153, 1).
adjacent(r150, r41).
shared_edge(r150, r41, 1).
adjacent(r151, r152).
shared_edge(r151, r152, 1).
adjacent(r151, r154).
shared_edge(r151, r154, 2).
adjacent(r151, r43).
shared_edge(r151, r43, 1).
adjacent(r153, r155).
shared_edge(r153, r155, 5).
adjacent(r153, r156).
shared_edge(r153, r156, 1).
adjacent(r153, r160).
shared_edge(r153, r160, 1).
adjacent(r153, r41).
shared_edge(r153, r41, 1).
adjacent(r153, r42).
shared_edge(r153, r42, 1).
adjacent(r153, r43).
shared_edge(r153, r43, 1).
adjacent(r154, r157).
shared_edge(r154, r157, 1).
adjacent(r154, r158).
shared_edge(r154, r158, 3).
adjacent(r154, r159).
shared_edge(r154, r159, 1).
adjacent(r154, r161).
shared_edge(r154, r161, 1).
adjacent(r154, r43).
shared_edge(r154, r43, 4).
adjacent(r156, r160).
shared_edge(r156, r160, 2).
adjacent(r156, r162).
shared_edge(r156, r162, 1).
adjacent(r156, r43).
shared_edge(r156, r43, 4).
adjacent(r157, r161).
shared_edge(r157, r161, 2).
adjacent(r157, r168).
shared_edge(r157, r168, 1).
adjacent(r157, r43).
shared_edge(r157, r43, 4).
adjacent(r158, r159).
shared_edge(r158, r159, 1).
adjacent(r16, r17).
shared_edge(r16, r17, 1).
adjacent(r16, r22).
shared_edge(r16, r22, 1).
adjacent(r16, r9).
shared_edge(r16, r9, 1).
adjacent(r160, r162).
shared_edge(r160, r162, 1).
adjacent(r161, r168).
shared_edge(r161, r168, 1).
adjacent(r162, r163).
shared_edge(r162, r163, 3).
adjacent(r162, r43).
shared_edge(r162, r43, 1).
adjacent(r163, r164).
shared_edge(r163, r164, 1).
adjacent(r163, r169).
shared_edge(r163, r169, 1).
adjacent(r163, r174).
shared_edge(r163, r174, 1).
adjacent(r163, r43).
shared_edge(r163, r43, 1).
adjacent(r164, r169).
shared_edge(r164, r169, 1).
adjacent(r164, r43).
shared_edge(r164, r43, 2).
adjacent(r165, r166).
shared_edge(r165, r166, 7).
adjacent(r165, r171).
shared_edge(r165, r171, 5).
adjacent(r165, r172).
shared_edge(r165, r172, 13).
adjacent(r165, r177).
shared_edge(r165, r177, 1).
adjacent(r165, r179).
shared_edge(r165, r179, 1).
adjacent(r165, r43).
shared_edge(r165, r43, 23).
adjacent(r166, r167).
shared_edge(r166, r167, 2).
adjacent(r166, r180).
shared_edge(r166, r180, 6).
adjacent(r166, r43).
shared_edge(r166, r43, 1).
adjacent(r167, r168).
shared_edge(r167, r168, 1).
adjacent(r167, r173).
shared_edge(r167, r173, 1).
adjacent(r167, r181).
shared_edge(r167, r181, 1).
adjacent(r167, r43).
shared_edge(r167, r43, 1).
adjacent(r168, r173).
shared_edge(r168, r173, 2).
adjacent(r168, r43).
shared_edge(r168, r43, 1).
adjacent(r169, r170).
shared_edge(r169, r170, 1).
adjacent(r169, r175).
shared_edge(r169, r175, 1).
adjacent(r17, r22).
shared_edge(r17, r22, 1).
adjacent(r170, r171).
shared_edge(r170, r171, 1).
adjacent(r170, r175).
shared_edge(r170, r175, 1).
adjacent(r170, r43).
shared_edge(r170, r43, 1).
adjacent(r171, r176).
shared_edge(r171, r176, 4).
adjacent(r172, r178).
shared_edge(r172, r178, 11).
adjacent(r174, r175).
shared_edge(r174, r175, 1).
adjacent(r175, r176).
shared_edge(r175, r176, 1).
adjacent(r175, r182).
shared_edge(r175, r182, 2).
adjacent(r176, r177).
shared_edge(r176, r177, 1).
adjacent(r176, r182).
shared_edge(r176, r182, 4).
adjacent(r177, r178).
shared_edge(r177, r178, 1).
adjacent(r177, r182).
shared_edge(r177, r182, 1).
adjacent(r178, r179).
shared_edge(r178, r179, 1).
adjacent(r178, r182).
shared_edge(r178, r182, 11).
adjacent(r179, r180).
shared_edge(r179, r180, 1).
adjacent(r179, r182).
shared_edge(r179, r182, 1).
adjacent(r18, r19).
shared_edge(r18, r19, 1).
adjacent(r180, r181).
shared_edge(r180, r181, 1).
adjacent(r180, r182).
shared_edge(r180, r182, 6).
adjacent(r182, r183).
shared_edge(r182, r183, 13).
adjacent(r183, r184).
shared_edge(r183, r184, 11).
adjacent(r185, r186).
shared_edge(r185, r186, 4).
adjacent(r186, r187).
shared_edge(r186, r187, 8).
adjacent(r186, r188).
shared_edge(r186, r188, 8).
adjacent(r186, r189).
shared_edge(r186, r189, 2).
adjacent(r186, r190).
shared_edge(r186, r190, 2).
adjacent(r186, r210).
shared_edge(r186, r210, 10).
adjacent(r191, r196).
shared_edge(r191, r196, 64).
adjacent(r192, r197).
shared_edge(r192, r197, 3).
adjacent(r193, r198).
shared_edge(r193, r198, 4).
adjacent(r194, r199).
shared_edge(r194, r199, 3).
adjacent(r195, r196).
shared_edge(r195, r196, 1).
adjacent(r195, r201).
shared_edge(r195, r201, 1).
adjacent(r196, r197).
shared_edge(r196, r197, 1).
adjacent(r196, r202).
shared_edge(r196, r202, 1).
adjacent(r196, r203).
shared_edge(r196, r203, 2).
adjacent(r196, r204).
shared_edge(r196, r204, 60).
adjacent(r196, r205).
shared_edge(r196, r205, 1).
adjacent(r197, r206).
shared_edge(r197, r206, 1).
adjacent(r197, r207).
shared_edge(r197, r207, 3).
adjacent(r198, r208).
shared_edge(r198, r208, 4).
adjacent(r199, r209).
shared_edge(r199, r209, 3).
adjacent(r2, r21).
shared_edge(r2, r21, 2).
adjacent(r2, r23).
shared_edge(r2, r23, 30).
adjacent(r2, r3).
shared_edge(r2, r3, 1).
adjacent(r200, r201).
shared_edge(r200, r201, 4).
adjacent(r201, r202).
shared_edge(r201, r202, 1).
adjacent(r201, r211).
shared_edge(r201, r211, 2).
adjacent(r201, r216).
shared_edge(r201, r216, 1).
adjacent(r201, r221).
shared_edge(r201, r221, 1).
adjacent(r202, r203).
shared_edge(r202, r203, 1).
adjacent(r202, r211).
shared_edge(r202, r211, 1).
adjacent(r203, r204).
shared_edge(r203, r204, 1).
adjacent(r203, r212).
shared_edge(r203, r212, 2).
adjacent(r204, r205).
shared_edge(r204, r205, 2).
adjacent(r204, r206).
shared_edge(r204, r206, 2).
adjacent(r204, r213).
shared_edge(r204, r213, 4).
adjacent(r204, r217).
shared_edge(r204, r217, 1).
adjacent(r204, r218).
shared_edge(r204, r218, 2).
adjacent(r204, r222).
shared_edge(r204, r222, 60).
adjacent(r205, r206).
shared_edge(r205, r206, 1).
adjacent(r206, r207).
shared_edge(r206, r207, 4).
adjacent(r206, r218).
shared_edge(r206, r218, 1).
adjacent(r206, r223).
shared_edge(r206, r223, 1).
adjacent(r207, r214).
shared_edge(r207, r214, 2).
adjacent(r207, r219).
shared_edge(r207, r219, 1).
adjacent(r207, r223).
shared_edge(r207, r223, 3).
adjacent(r208, r214).
shared_edge(r208, r214, 2).
adjacent(r208, r215).
shared_edge(r208, r215, 2).
adjacent(r208, r219).
shared_edge(r208, r219, 1).
adjacent(r208, r220).
shared_edge(r208, r220, 1).
adjacent(r208, r224).
shared_edge(r208, r224, 4).
adjacent(r209, r215).
shared_edge(r209, r215, 2).
adjacent(r209, r220).
shared_edge(r209, r220, 1).
adjacent(r209, r225).
shared_edge(r209, r225, 3).
adjacent(r21, r23).
shared_edge(r21, r23, 32).
adjacent(r21, r7).
shared_edge(r21, r7, 32).
adjacent(r211, r212).
shared_edge(r211, r212, 2).
adjacent(r211, r216).
shared_edge(r211, r216, 1).
adjacent(r212, r213).
shared_edge(r212, r213, 2).
adjacent(r212, r217).
shared_edge(r212, r217, 2).
adjacent(r214, r219).
shared_edge(r214, r219, 1).
adjacent(r215, r220).
shared_edge(r215, r220, 1).
adjacent(r216, r217).
shared_edge(r216, r217, 1).
adjacent(r216, r222).
shared_edge(r216, r222, 1).
adjacent(r217, r222).
shared_edge(r217, r222, 2).
adjacent(r218, r222).
shared_edge(r218, r222, 1).
adjacent(r219, r223).
shared_edge(r219, r223, 1).
adjacent(r219, r224).
shared_edge(r219, r224, 1).
adjacent(r22, r24).
shared_edge(r22, r24, 1).
adjacent(r22, r7).
shared_edge(r22, r7, 2).
adjacent(r220, r224).
shared_edge(r220, r224, 1).
adjacent(r220, r225).
shared_edge(r220, r225, 1).
adjacent(r221, r222).
shared_edge(r221, r222, 1).
adjacent(r222, r223).
shared_edge(r222, r223, 1).
adjacent(r24, r25).
shared_edge(r24, r25, 1).
adjacent(r24, r28).
shared_edge(r24, r28, 3).
adjacent(r24, r7).
shared_edge(r24, r7, 4).
adjacent(r25, r26).
shared_edge(r25, r26, 3).
adjacent(r25, r28).
shared_edge(r25, r28, 2).
adjacent(r25, r7).
shared_edge(r25, r7, 1).
adjacent(r26, r27).
shared_edge(r26, r27, 3).
adjacent(r26, r31).
shared_edge(r26, r31, 1).
adjacent(r27, r31).
shared_edge(r27, r31, 1).
adjacent(r27, r32).
shared_edge(r27, r32, 2).
adjacent(r27, r39).
shared_edge(r27, r39, 1).
adjacent(r27, r47).
shared_edge(r27, r47, 4).
adjacent(r27, r48).
shared_edge(r27, r48, 4).
adjacent(r27, r55).
shared_edge(r27, r55, 2).
adjacent(r28, r7).
shared_edge(r28, r7, 1).
adjacent(r29, r30).
shared_edge(r29, r30, 38).
adjacent(r29, r7).
shared_edge(r29, r7, 40).
adjacent(r3, r4).
shared_edge(r3, r4, 1).
adjacent(r30, r35).
shared_edge(r30, r35, 1).
adjacent(r30, r36).
shared_edge(r30, r36, 37).
adjacent(r30, r7).
shared_edge(r30, r7, 2).
adjacent(r31, r39).
shared_edge(r31, r39, 1).
adjacent(r31, r7).
shared_edge(r31, r7, 1).
adjacent(r32, r33).
shared_edge(r32, r33, 2).
adjacent(r32, r48).
shared_edge(r32, r48, 1).
adjacent(r34, r35).
shared_edge(r34, r35, 1).
adjacent(r34, r40).
shared_edge(r34, r40, 31).
adjacent(r34, r41).
shared_edge(r34, r41, 31).
adjacent(r34, r7).
shared_edge(r34, r7, 2).
adjacent(r35, r36).
shared_edge(r35, r36, 1).
adjacent(r35, r41).
shared_edge(r35, r41, 1).
adjacent(r36, r37).
shared_edge(r36, r37, 1).
adjacent(r36, r42).
shared_edge(r36, r42, 36).
adjacent(r36, r43).
shared_edge(r36, r43, 1).
adjacent(r37, r43).
shared_edge(r37, r43, 14).
adjacent(r37, r45).
shared_edge(r37, r45, 1).
adjacent(r37, r46).
shared_edge(r37, r46, 1).
adjacent(r37, r7).
shared_edge(r37, r7, 13).
adjacent(r38, r39).
shared_edge(r38, r39, 1).
adjacent(r38, r46).
shared_edge(r38, r46, 1).
adjacent(r38, r7).
shared_edge(r38, r7, 2).
adjacent(r39, r47).
shared_edge(r39, r47, 1).
adjacent(r4, r5).
shared_edge(r4, r5, 1).
adjacent(r40, r7).
shared_edge(r40, r7, 33).
adjacent(r41, r42).
shared_edge(r41, r42, 34).
adjacent(r42, r43).
shared_edge(r42, r43, 59).
adjacent(r42, r49).
shared_edge(r42, r49, 8).
adjacent(r42, r50).
shared_edge(r42, r50, 1).
adjacent(r42, r58).
shared_edge(r42, r58, 1).
adjacent(r43, r46).
shared_edge(r43, r46, 1).
adjacent(r43, r47).
shared_edge(r43, r47, 7).
adjacent(r43, r50).
shared_edge(r43, r50, 5).
adjacent(r43, r58).
shared_edge(r43, r58, 5).
adjacent(r43, r60).
shared_edge(r43, r60, 1).
adjacent(r43, r61).
shared_edge(r43, r61, 9).
adjacent(r43, r62).
shared_edge(r43, r62, 1).
adjacent(r43, r63).
shared_edge(r43, r63, 7).
adjacent(r43, r64).
shared_edge(r43, r64, 14).
adjacent(r43, r65).
shared_edge(r43, r65, 1).
adjacent(r43, r66).
shared_edge(r43, r66, 14).
adjacent(r43, r71).
shared_edge(r43, r71, 3).
adjacent(r43, r72).
shared_edge(r43, r72, 4).
adjacent(r43, r74).
shared_edge(r43, r74, 1).
adjacent(r43, r75).
shared_edge(r43, r75, 9).
adjacent(r43, r79).
shared_edge(r43, r79, 8).
adjacent(r43, r81).
shared_edge(r43, r81, 1).
adjacent(r43, r84).
shared_edge(r43, r84, 13).
adjacent(r43, r92).
shared_edge(r43, r92, 4).
adjacent(r43, r96).
shared_edge(r43, r96, 1).
adjacent(r43, r98).
shared_edge(r43, r98, 21).
adjacent(r44, r45).
shared_edge(r44, r45, 5).
adjacent(r44, r7).
shared_edge(r44, r7, 7).
adjacent(r45, r46).
shared_edge(r45, r46, 6).
adjacent(r45, r7).
shared_edge(r45, r7, 2).
adjacent(r46, r47).
shared_edge(r46, r47, 7).
adjacent(r47, r55).
shared_edge(r47, r55, 1).
adjacent(r47, r59).
shared_edge(r47, r59, 2).
adjacent(r47, r60).
shared_edge(r47, r60, 6).
adjacent(r49, r50).
shared_edge(r49, r50, 4).
adjacent(r49, r51).
shared_edge(r49, r51, 3).
adjacent(r49, r52).
shared_edge(r49, r52, 3).
adjacent(r49, r53).
shared_edge(r49, r53, 2).
adjacent(r49, r58).
shared_edge(r49, r58, 4).
adjacent(r5, r6).
shared_edge(r5, r6, 2).
adjacent(r5, r7).
shared_edge(r5, r7, 1).
adjacent(r51, r53).
shared_edge(r51, r53, 1).
adjacent(r52, r53).
shared_edge(r52, r53, 1).
adjacent(r54, r7).
shared_edge(r54, r7, 4).
adjacent(r55, r56).
shared_edge(r55, r56, 2).
adjacent(r55, r59).
shared_edge(r55, r59, 2).
adjacent(r55, r60).
shared_edge(r55, r60, 1).
adjacent(r56, r57).
shared_edge(r56, r57, 10).
adjacent(r56, r60).
shared_edge(r56, r60, 8).
adjacent(r56, r78).
shared_edge(r56, r78, 1).
adjacent(r57, r78).
shared_edge(r57, r78, 2).
adjacent(r6, r7).
shared_edge(r6, r7, 3).
adjacent(r60, r72).
shared_edge(r60, r72, 1).
adjacent(r60, r77).
shared_edge(r60, r77, 1).
adjacent(r61, r62).
shared_edge(r61, r62, 3).
adjacent(r61, r71).
shared_edge(r61, r71, 4).
adjacent(r62, r63).
shared_edge(r62, r63, 3).
adjacent(r62, r71).
shared_edge(r62, r71, 1).
adjacent(r63, r64).
shared_edge(r63, r64, 3).
adjacent(r63, r71).
shared_edge(r63, r71, 7).
adjacent(r64, r65).
shared_edge(r64, r65, 1).
adjacent(r64, r67).
shared_edge(r64, r67, 8).
adjacent(r64, r68).
shared_edge(r64, r68, 12).
adjacent(r64, r69).
shared_edge(r64, r69, 1).
adjacent(r64, r71).
shared_edge(r64, r71, 5).
adjacent(r65, r66).
shared_edge(r65, r66, 7).
adjacent(r65, r69).
shared_edge(r65, r69, 6).
adjacent(r65, r73).
shared_edge(r65, r73, 1).
adjacent(r66, r74).
shared_edge(r66, r74, 7).
adjacent(r67, r68).
shared_edge(r67, r68, 8).
adjacent(r68, r69).
shared_edge(r68, r69, 3).
adjacent(r68, r70).
shared_edge(r68, r70, 7).
adjacent(r68, r80).
shared_edge(r68, r80, 1).
adjacent(r68, r84).
shared_edge(r68, r84, 20).
adjacent(r68, r89).
shared_edge(r68, r89, 4).
adjacent(r68, r98).
shared_edge(r68, r98, 44).
adjacent(r68, r99).
shared_edge(r68, r99, 1).
adjacent(r69, r70).
shared_edge(r69, r70, 5).
adjacent(r69, r73).
shared_edge(r69, r73, 1).
adjacent(r7, r8).
shared_edge(r7, r8, 3).
adjacent(r7, r9).
shared_edge(r7, r9, 1).
adjacent(r71, r79).
shared_edge(r71, r79, 6).
adjacent(r72, r76).
shared_edge(r72, r76, 3).
adjacent(r73, r74).
shared_edge(r73, r74, 1).
adjacent(r73, r80).
shared_edge(r73, r80, 1).
adjacent(r74, r80).
shared_edge(r74, r80, 6).
adjacent(r74, r81).
shared_edge(r74, r81, 1).
adjacent(r75, r76).
shared_edge(r75, r76, 5).
adjacent(r75, r90).
shared_edge(r75, r90, 1).
adjacent(r75, r93).
shared_edge(r75, r93, 1).
adjacent(r76, r77).
shared_edge(r76, r77, 1).
adjacent(r76, r82).
shared_edge(r76, r82, 2).
adjacent(r76, r83).
shared_edge(r76, r83, 1).
adjacent(r76, r85).
shared_edge(r76, r85, 3).
adjacent(r76, r90).
shared_edge(r76, r90, 1).
adjacent(r77, r78).
shared_edge(r77, r78, 2).
adjacent(r77, r83).
shared_edge(r77, r83, 1).
adjacent(r77, r86).
shared_edge(r77, r86, 1).
adjacent(r8, r9).
shared_edge(r8, r9, 2).
adjacent(r80, r81).
shared_edge(r80, r81, 1).
adjacent(r80, r84).
shared_edge(r80, r84, 7).
adjacent(r81, r84).
shared_edge(r81, r84, 1).
adjacent(r82, r83).
shared_edge(r82, r83, 1).
adjacent(r82, r85).
shared_edge(r82, r85, 1).
adjacent(r83, r86).
shared_edge(r83, r86, 1).
adjacent(r85, r86).
shared_edge(r85, r86, 3).
adjacent(r85, r91).
shared_edge(r85, r91, 1).
adjacent(r86, r87).
shared_edge(r86, r87, 4).
adjacent(r86, r91).
shared_edge(r86, r91, 1).
adjacent(r86, r94).
shared_edge(r86, r94, 1).
adjacent(r86, r95).
shared_edge(r86, r95, 1).
adjacent(r86, r97).
shared_edge(r86, r97, 1).
adjacent(r87, r88).
shared_edge(r87, r88, 3).
adjacent(r87, r95).
shared_edge(r87, r95, 1).
adjacent(r90, r91).
shared_edge(r90, r91, 1).
adjacent(r90, r93).
shared_edge(r90, r93, 1).
adjacent(r91, r94).
shared_edge(r91, r94, 1).
adjacent(r93, r94).
shared_edge(r93, r94, 1).
adjacent(r93, r96).
shared_edge(r93, r96, 1).
adjacent(r94, r96).
shared_edge(r94, r96, 1).
adjacent(r94, r97).
shared_edge(r94, r97, 1).
adjacent(r95, r97).
shared_edge(r95, r97, 1).
adjacent(r98, r99).
shared_edge(r98, r99, 6).
