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

region(r1, '#30393a', 414, centroid(7,21)).
polygon(r1, [xy(0,0),xy(0,26),xy(1,27),xy(0,28),xy(0,31),xy(1,32),xy(1,37),xy(3,35),xy(3,34),xy(2,33),xy(3,33),xy(4,32),xy(3,31),xy(3,29),xy(4,28),xy(5,28),xy(6,29),xy(6,30),xy(7,30),xy(8,31),xy(8,32),xy(9,33),xy(9,37),xy(10,38),xy(10,39),xy(11,38),xy(13,40),xy(15,40),xy(16,39),xy(15,38),xy(16,37),xy(16,35),xy(14,33),xy(14,32),xy(13,31),xy(13,27),xy(12,26),xy(12,25),xy(15,22),xy(12,19),xy(12,18),xy(13,17),xy(13,15),xy(14,14),xy(14,13),xy(12,11),xy(11,12),xy(10,12),xy(9,11),xy(10,10),xy(10,9),xy(9,8),xy(8,8),xy(6,6),xy(6,2),xy(5,1),xy(4,2),xy(2,0),xy(1,0),xy(2,2),xy(2,6),xy(3,7),xy(2,8),xy(2,9),xy(3,10),xy(2,11),xy(3,12),xy(3,14),xy(4,15),xy(4,16),xy(5,17),xy(5,18),xy(3,20),xy(3,21),xy(4,22),xy(4,23),xy(3,24),xy(4,25),xy(5,25),xy(6,24),xy(6,20),xy(5,19),xy(8,19),xy(9,20),xy(9,21),xy(10,20),xy(10,15),xy(5,10),xy(5,9),xy(4,8),xy(4,3),xy(0,0)]).
hole(r1, [xy(3,2),xy(3,6),xy(3,2)]).
hole(r1, [xy(3,8),xy(3,9),xy(4,9),xy(4,10),xy(3,11),xy(4,12),xy(4,14),xy(5,15),xy(5,16),xy(6,17),xy(6,18),xy(8,18),xy(9,17),xy(9,15),xy(5,11),xy(3,8)]).
hole(r1, [xy(4,20),xy(4,21),xy(5,20),xy(5,23),xy(4,24),xy(5,24),xy(4,20)]).
midline(r1, [xy(1,1),xy(1,13),xy(2,12),xy(2,19),xy(3,18),xy(3,17)]).
midline(r1, [xy(1,30),xy(1,31),xy(2,30),xy(2,32),xy(3,32)]).
midline(r1, [xy(2,1)]).
midline(r1, [xy(2,7)]).
midline(r1, [xy(2,10)]).
midline(r1, [xy(2,22),xy(2,26),xy(3,26),xy(3,27),xy(2,28)]).
midline(r1, [xy(5,2),xy(5,7),xy(7,9),xy(7,10),xy(8,10),xy(8,12),xy(9,12),xy(9,13),xy(11,14),xy(12,13),xy(12,14),xy(11,16),xy(11,20),xy(12,20),xy(12,22),xy(11,23),xy(11,24),xy(13,22)]).
midline(r1, [xy(7,20),xy(8,20),xy(8,22),xy(9,24),xy(8,26),xy(8,27),xy(9,27),xy(9,28),xy(12,34),xy(12,36),xy(13,35),xy(13,37),xy(15,39),xy(17,39)]).
midline(r1, [xy(12,16),xy(12,17)]).
fillpoint(r1, xy(9,28), 5).
fillpoint(r1, xy(9,27), 5).
fillpoint(r1, xy(8,27), 5).
fillpoint(r1, xy(8,26), 5).
fillpoint(r1, xy(13,37), 4).
region(r3, '#3e4748', 48, centroid(10,5)).
polygon(r3, [xy(6,0),xy(6,1),xy(7,1),xy(7,6),xy(8,6),xy(8,7),xy(9,5),xy(8,4),xy(9,3),xy(8,2),xy(10,0),xy(10,4),xy(11,4),xy(11,5),xy(10,6),xy(10,8),xy(11,7),xy(11,8),xy(12,8),xy(12,9),xy(10,11),xy(11,11),xy(12,10),xy(13,8),xy(13,6),xy(12,5),xy(12,4),xy(13,5),xy(15,5),xy(15,6),xy(14,7),xy(6,0)]).
hole(r3, [xy(11,6),xy(12,6),xy(12,7),xy(11,6)]).
midline(r3, [xy(8,3),xy(9,2)]).
midline(r3, [xy(8,5),xy(10,5)]).
fillpoint(r3, xy(10,5), 2).
fillpoint(r3, xy(9,2), 2).
fillpoint(r3, xy(8,5), 2).
fillpoint(r3, xy(8,3), 2).
fillpoint(r3, xy(15,6), 1).
region(r4, '#515959', 4, centroid(8,0)).
polygon(r4, [xy(7,0),xy(8,0),xy(8,1),xy(9,0),xy(7,0)]).
fillpoint(r4, xy(9,0), 1).
fillpoint(r4, xy(8,1), 1).
fillpoint(r4, xy(8,0), 1).
fillpoint(r4, xy(7,0), 1).
region(r5, '#515959', 48, centroid(17,2)).
polygon(r5, [xy(11,1),xy(11,3),xy(12,3),xy(13,4),xy(15,4),xy(17,2),xy(15,0),xy(12,0),xy(11,1)]).
hole(r5, [xy(17,1),xy(18,1),xy(17,1)]).
midline(r5, [xy(13,2),xy(15,2)]).
midline(r5, [xy(20,1),xy(21,1)]).
fillpoint(r5, xy(15,2), 3).
fillpoint(r5, xy(14,2), 3).
fillpoint(r5, xy(13,2), 3).
fillpoint(r5, xy(21,1), 2).
fillpoint(r5, xy(20,1), 2).
region(r6, '#878f91', 14, centroid(25,1)).
polygon(r6, [xy(23,0),xy(23,1),xy(24,0),xy(24,1),xy(25,0),xy(25,1),xy(26,1),xy(26,4),xy(27,3),xy(27,0),xy(23,0)]).
fillpoint(r6, xy(27,3), 1).
fillpoint(r6, xy(27,2), 1).
fillpoint(r6, xy(27,1), 1).
fillpoint(r6, xy(27,0), 1).
fillpoint(r6, xy(26,4), 1).
region(r9, '#b8c3c7', 38, centroid(32,2)).
polygon(r9, [xy(28,3),xy(29,2),xy(29,0),xy(30,2),xy(32,0),xy(36,0),xy(37,1),xy(36,2),xy(36,3),xy(35,4),xy(34,3),xy(33,3),xy(31,5),xy(30,5),xy(29,4),xy(28,3)]).
midline(r9, [xy(29,3),xy(31,3),xy(32,2),xy(34,1),xy(34,2),xy(35,1),xy(35,3),xy(36,1)]).
fillpoint(r9, xy(32,2), 3).
fillpoint(r9, xy(31,3), 3).
fillpoint(r9, xy(36,1), 2).
fillpoint(r9, xy(35,3), 2).
fillpoint(r9, xy(35,2), 2).
region(r11, '#aeb8bb', 6, centroid(38,2)).
polygon(r11, [xy(37,0),xy(38,0),xy(38,4),xy(37,0)]).
fillpoint(r11, xy(38,4), 1).
fillpoint(r11, xy(38,3), 1).
fillpoint(r11, xy(38,2), 1).
fillpoint(r11, xy(38,1), 1).
fillpoint(r11, xy(38,0), 1).
region(r12, '#878f91', 5, centroid(39,2)).
polygon(r12, [xy(39,0),xy(39,4),xy(39,0)]).
fillpoint(r12, xy(39,4), 1).
fillpoint(r12, xy(39,3), 1).
fillpoint(r12, xy(39,2), 1).
fillpoint(r12, xy(39,1), 1).
fillpoint(r12, xy(39,0), 1).
region(r14, '#c8d2d7', 223, centroid(51,16)).
polygon(r14, [xy(37,16),xy(37,17),xy(38,18),xy(39,17),xy(41,19),xy(40,20),xy(41,21),xy(44,21),xy(45,22),xy(54,22),xy(55,21),xy(54,20),xy(51,20),xy(50,19),xy(49,19),xy(48,18),xy(47,18),xy(42,13),xy(42,12),xy(41,11),xy(42,10),xy(42,9),xy(41,8),xy(41,0),xy(44,0),xy(44,3),xy(43,4),xy(43,5),xy(44,6),xy(44,8),xy(43,9),xy(43,10),xy(42,11),xy(43,13),xy(41,15),xy(38,15),xy(37,16)]).
midline(r14, [xy(38,16),xy(38,17),xy(39,16)]).
midline(r14, [xy(41,20),xy(43,18),xy(42,17),xy(43,17),xy(45,19),xy(47,20),xy(50,20),xy(50,21),xy(54,21)]).
midline(r14, [xy(42,1),xy(42,8),xy(43,7),xy(43,8)]).
midline(r14, [xy(43,1),xy(43,3)]).
midline(r14, [xy(56,16)]).
midline(r14, [xy(57,22),xy(58,21),xy(60,20),xy(60,18),xy(59,17),xy(61,17),xy(61,18)]).
midline(r14, [xy(64,16),xy(64,17)]).
midline(r14, [xy(68,17),xy(70,17)]).
fillpoint(r14, xy(61,18), 4).
fillpoint(r14, xy(61,17), 4).
fillpoint(r14, xy(60,18), 4).
fillpoint(r14, xy(60,17), 4).
fillpoint(r14, xy(59,17), 4).
region(r16, '#9fa8ab', 150, centroid(49,8)).
polygon(r16, [xy(44,11),xy(44,14),xy(45,14),xy(48,17),xy(49,17),xy(50,16),xy(51,16),xy(52,15),xy(52,14),xy(51,13),xy(53,11),xy(53,10),xy(54,9),xy(53,8),xy(55,6),xy(55,4),xy(54,3),xy(54,2),xy(52,0),xy(51,1),xy(50,0),xy(49,1),xy(48,0),xy(45,3),xy(45,10),xy(44,11)]).
hole(r16, [xy(51,2),xy(51,6),xy(51,2)]).
midline(r16, [xy(47,3),xy(47,5),xy(48,4),xy(48,2),xy(50,1),xy(52,1),xy(53,2),xy(53,6),xy(52,7),xy(53,7),xy(54,6),xy(54,4)]).
midline(r16, [xy(48,5),xy(48,7),xy(49,9),xy(49,10),xy(48,11),xy(48,12),xy(49,11)]).
midline(r16, [xy(48,14),xy(49,14)]).
midline(r16, [xy(52,9)]).
fillpoint(r16, xy(49,11), 5).
fillpoint(r16, xy(49,10), 5).
fillpoint(r16, xy(49,9), 5).
fillpoint(r16, xy(48,12), 5).
fillpoint(r16, xy(48,11), 5).
region(r20, '#bac7cd', 89, centroid(61,5)).
polygon(r20, [xy(55,0),xy(55,1),xy(56,0),xy(63,0),xy(63,3),xy(66,6),xy(67,6),xy(69,8),xy(68,9),xy(67,9),xy(66,8),xy(65,8),xy(63,6),xy(62,6),xy(60,8),xy(58,8),xy(57,7),xy(57,5),xy(56,4),xy(56,2),xy(55,0)]).
midline(r20, [xy(56,1)]).
midline(r20, [xy(60,4)]).
midline(r20, [xy(64,5),xy(64,6),xy(65,6),xy(65,7),xy(67,7),xy(67,8),xy(68,8),xy(69,9)]).
fillpoint(r20, xy(60,4), 5).
fillpoint(r20, xy(61,4), 4).
fillpoint(r20, xy(60,5), 4).
fillpoint(r20, xy(60,3), 4).
fillpoint(r20, xy(59,4), 4).
region(r21, '#b8c3c7', 324, centroid(79,14)).
polygon(r21, [xy(64,0),xy(64,3),xy(66,5),xy(67,5),xy(71,9),xy(71,10),xy(78,10),xy(79,9),xy(81,9),xy(82,8),xy(81,7),xy(80,7),xy(79,6),xy(78,6),xy(77,5),xy(75,5),xy(74,4),xy(73,4),xy(72,3),xy(71,3),xy(68,0),xy(65,0),xy(64,0)]).
midline(r21, [xy(65,30),xy(65,31),xy(67,30),xy(68,30),xy(70,29),xy(70,30),xy(71,29),xy(71,30),xy(72,29),xy(72,30),xy(74,29),xy(75,28),xy(80,28),xy(81,27),xy(82,27),xy(84,25),xy(84,26),xy(85,25),xy(85,24),xy(86,23),xy(86,24),xy(89,21),xy(89,14),xy(88,12),xy(86,11),xy(85,10)]).
midline(r21, [xy(66,2),xy(66,3),xy(68,3),xy(71,6),xy(72,6),xy(72,7),xy(76,7),xy(76,8),xy(77,7),xy(77,8),xy(81,8)]).
midline(r21, [xy(83,1),xy(84,1),xy(86,2),xy(87,3),xy(89,4),xy(90,5)]).
midline(r21, [xy(93,7),xy(94,8)]).
fillpoint(r21, xy(74,7), 4).
fillpoint(r21, xy(73,7), 4).
fillpoint(r21, xy(72,7), 4).
fillpoint(r21, xy(72,6), 4).
fillpoint(r21, xy(71,6), 4).
region(r25, '#bfc9ce', 32, centroid(82,4)).
polygon(r25, [xy(73,0),xy(73,1),xy(74,0),xy(74,1),xy(75,1),xy(75,2),xy(76,1),xy(76,2),xy(81,2),xy(81,3),xy(82,2),xy(82,3),xy(83,3),xy(83,4),xy(84,3),xy(84,4),xy(86,4),xy(86,5),xy(87,5),xy(87,6),xy(89,6),xy(89,7),xy(91,7),xy(91,8),xy(92,8),xy(73,0)]).
fillpoint(r25, xy(92,8), 1).
fillpoint(r25, xy(91,8), 1).
fillpoint(r25, xy(91,7), 1).
fillpoint(r25, xy(90,7), 1).
fillpoint(r25, xy(89,7), 1).
region(r27, '#aeb8bb', 34, centroid(91,3)).
polygon(r27, [xy(85,0),xy(87,0),xy(87,1),xy(88,0),xy(90,0),xy(92,2),xy(93,2),xy(95,4),xy(95,5),xy(94,6),xy(93,5),xy(92,5),xy(89,2),xy(88,2),xy(85,0)]).
midline(r27, [xy(88,1),xy(90,1),xy(90,2),xy(91,2),xy(91,3),xy(92,3),xy(92,4),xy(93,3),xy(93,4),xy(94,4),xy(94,5)]).
fillpoint(r27, xy(94,5), 2).
fillpoint(r27, xy(94,4), 2).
fillpoint(r27, xy(93,4), 2).
fillpoint(r27, xy(93,3), 2).
fillpoint(r27, xy(92,4), 2).
region(r28, '#9fa8ab', 12, centroid(94,1)).
polygon(r28, [xy(91,0),xy(92,0),xy(92,1),xy(93,0),xy(93,1),xy(94,0),xy(95,0),xy(95,1),xy(94,2),xy(95,2),xy(95,3),xy(91,0)]).
midline(r28, [xy(94,1)]).
fillpoint(r28, xy(94,1), 2).
fillpoint(r28, xy(95,3), 1).
fillpoint(r28, xy(95,2), 1).
fillpoint(r28, xy(95,1), 1).
fillpoint(r28, xy(95,0), 1).
region(r35, '#bac7cd', 4, centroid(79,1)).
polygon(r35, [xy(77,1),xy(80,1),xy(77,1)]).
fillpoint(r35, xy(80,1), 1).
fillpoint(r35, xy(79,1), 1).
fillpoint(r35, xy(78,1), 1).
fillpoint(r35, xy(77,1), 1).
region(r36, '#3e4748', 5, centroid(3,4)).
polygon(r36, [xy(3,2),xy(3,6),xy(3,2)]).
fillpoint(r36, xy(3,6), 1).
fillpoint(r36, xy(3,5), 1).
fillpoint(r36, xy(3,4), 1).
fillpoint(r36, xy(3,3), 1).
fillpoint(r36, xy(3,2), 1).
region(r38, '#bac7cd', 20, centroid(35,5)).
polygon(r38, [xy(32,5),xy(32,6),xy(33,6),xy(34,7),xy(35,7),xy(35,8),xy(36,6),xy(34,4),xy(33,4),xy(32,5)]).
midline(r38, [xy(33,5),xy(34,5),xy(34,6),xy(35,6),xy(36,5)]).
fillpoint(r38, xy(36,5), 2).
fillpoint(r38, xy(35,6), 2).
fillpoint(r38, xy(34,6), 2).
fillpoint(r38, xy(34,5), 2).
fillpoint(r38, xy(33,5), 2).
region(r39, '#aeb8bb', 5, centroid(40,4)).
polygon(r39, [xy(40,2),xy(40,6),xy(40,2)]).
fillpoint(r39, xy(40,6), 1).
fillpoint(r39, xy(40,5), 1).
fillpoint(r39, xy(40,4), 1).
fillpoint(r39, xy(40,3), 1).
fillpoint(r39, xy(40,2), 1).
region(r45, '#c2cdd2', 13, centroid(78,3)).
polygon(r45, [xy(74,2),xy(74,3),xy(77,3),xy(77,4),xy(78,3),xy(78,4),xy(79,3),xy(80,3),xy(80,4),xy(82,4),xy(74,2)]).
fillpoint(r45, xy(82,4), 1).
fillpoint(r45, xy(81,4), 1).
fillpoint(r45, xy(80,4), 1).
fillpoint(r45, xy(80,3), 1).
fillpoint(r45, xy(79,3), 1).
region(r47, '#30393a', 30, centroid(20,5)).
polygon(r47, [xy(16,5),xy(16,6),xy(23,6),xy(24,5),xy(23,4),xy(19,4),xy(18,3),xy(17,4),xy(16,5)]).
midline(r47, [xy(17,5),xy(18,4),xy(18,5),xy(23,5)]).
fillpoint(r47, xy(23,5), 2).
fillpoint(r47, xy(22,5), 2).
fillpoint(r47, xy(21,5), 2).
fillpoint(r47, xy(20,5), 2).
fillpoint(r47, xy(19,5), 2).
region(r48, '#3e4748', 5, centroid(21,3)).
polygon(r48, [xy(19,3),xy(23,3),xy(19,3)]).
fillpoint(r48, xy(23,3), 1).
fillpoint(r48, xy(22,3), 1).
fillpoint(r48, xy(21,3), 1).
fillpoint(r48, xy(20,3), 1).
fillpoint(r48, xy(19,3), 1).
region(r60, '#3e4748', 24, centroid(25,11)).
polygon(r60, [xy(23,13),xy(23,14),xy(24,13),xy(24,10),xy(25,9),xy(25,5),xy(23,13)]).
midline(r60, [xy(24,14)]).
midline(r60, [xy(25,10),xy(25,11),xy(26,11)]).
fillpoint(r60, xy(26,11), 2).
fillpoint(r60, xy(25,11), 2).
fillpoint(r60, xy(25,10), 2).
fillpoint(r60, xy(24,14), 2).
fillpoint(r60, xy(27,12), 1).
region(r62, '#878f91', 5, centroid(27,6)).
polygon(r62, [xy(26,6),xy(27,5),xy(27,8),xy(26,6)]).
fillpoint(r62, xy(27,8), 1).
fillpoint(r62, xy(27,7), 1).
fillpoint(r62, xy(27,6), 1).
fillpoint(r62, xy(27,5), 1).
fillpoint(r62, xy(26,6), 1).
region(r63, '#9fa8ab', 11, centroid(29,7)).
polygon(r63, [xy(28,5),xy(28,8),xy(29,7),xy(29,6),xy(30,6),xy(31,7),xy(30,8),xy(30,9),xy(28,5)]).
midline(r63, [xy(30,7)]).
fillpoint(r63, xy(30,7), 2).
fillpoint(r63, xy(31,7), 1).
fillpoint(r63, xy(30,9), 1).
fillpoint(r63, xy(30,8), 1).
fillpoint(r63, xy(30,6), 1).
region(r70, '#c8d2d7', 5, centroid(82,5)).
polygon(r70, [xy(80,5),xy(82,5),xy(82,6),xy(83,6),xy(80,5)]).
fillpoint(r70, xy(83,6), 1).
fillpoint(r70, xy(82,6), 1).
fillpoint(r70, xy(82,5), 1).
fillpoint(r70, xy(81,5), 1).
fillpoint(r70, xy(80,5), 1).
region(r71, '#c2cdd2', 6, centroid(85,6)).
polygon(r71, [xy(83,5),xy(84,5),xy(84,6),xy(85,5),xy(85,6),xy(86,6),xy(83,5)]).
fillpoint(r71, xy(86,6), 1).
fillpoint(r71, xy(85,6), 1).
fillpoint(r71, xy(85,5), 1).
fillpoint(r71, xy(84,6), 1).
fillpoint(r71, xy(84,5), 1).
region(r81, '#24221e', 351, centroid(23,26)).
polygon(r81, [xy(13,18),xy(13,19),xy(14,20),xy(15,20),xy(16,19),xy(14,17),xy(14,15),xy(15,14),xy(15,13),xy(14,12),xy(14,10),xy(15,9),xy(15,8),xy(16,7),xy(23,7),xy(23,9),xy(20,12),xy(24,16),xy(24,18),xy(22,20),xy(23,21),xy(24,20),xy(24,19),xy(25,20),xy(25,21),xy(24,22),xy(25,23),xy(25,25),xy(23,27),xy(25,29),xy(25,30),xy(24,31),xy(22,31),xy(19,28),xy(18,28),xy(17,27),xy(17,26),xy(18,25),xy(17,24),xy(14,24),xy(13,25),xy(13,26),xy(14,27),xy(14,31),xy(15,32),xy(15,33),xy(16,34),xy(17,33),xy(17,32),xy(16,31),xy(16,30),xy(19,27),xy(19,26),xy(13,18)]).
hole(r81, [xy(17,30),xy(17,31),xy(18,32),xy(18,35),xy(21,35),xy(22,34),xy(23,34),xy(24,33),xy(23,32),xy(22,32),xy(19,29),xy(18,29),xy(17,30)]).
hole(r81, [xy(18,26),xy(18,27),xy(18,26)]).
midline(r81, [xy(14,18),xy(14,19),xy(15,19)]).
midline(r81, [xy(15,15),xy(15,16),xy(16,14)]).
midline(r81, [xy(15,26),xy(16,28),xy(15,30),xy(15,31),xy(16,32),xy(16,33)]).
midline(r81, [xy(17,10),xy(17,11),xy(18,10),xy(18,11),xy(19,10),xy(21,9)]).
midline(r81, [xy(17,25)]).
midline(r81, [xy(18,37),xy(22,37),xy(24,36),xy(24,37),xy(25,37),xy(25,38),xy(26,38),xy(28,39)]).
midline(r81, [xy(19,13),xy(22,16),xy(22,18),xy(21,19),xy(21,21)]).
midline(r81, [xy(21,24)]).
midline(r81, [xy(21,27),xy(21,28),xy(22,28),xy(22,29),xy(23,29),xy(26,32),xy(28,33),xy(29,34),xy(30,34),xy(34,36),xy(35,36),xy(35,37),xy(37,36)]).
midline(r81, [xy(24,21)]).
midline(r81, [xy(37,39)]).
fillpoint(r81, xy(21,24), 5).
fillpoint(r81, xy(35,37), 4).
fillpoint(r81, xy(35,36), 4).
fillpoint(r81, xy(34,36), 4).
fillpoint(r81, xy(22,25), 4).
region(r83, '#aeb8bb', 6, centroid(33,8)).
polygon(r83, [xy(31,8),xy(32,7),xy(32,8),xy(33,8),xy(33,9),xy(34,9),xy(31,8)]).
fillpoint(r83, xy(34,9), 1).
fillpoint(r83, xy(33,9), 1).
fillpoint(r83, xy(33,8), 1).
fillpoint(r83, xy(32,8), 1).
fillpoint(r83, xy(32,7), 1).
region(r89, '#bfc9ce', 38, centroid(67,10)).
polygon(r89, [xy(60,9),xy(61,9),xy(62,8),xy(62,7),xy(63,7),xy(64,8),xy(63,9),xy(62,9),xy(64,10),xy(64,11),xy(65,12),xy(68,12),xy(69,11),xy(68,10),xy(67,10),xy(66,9),xy(65,9),xy(60,9)]).
midline(r89, [xy(63,8),xy(65,10),xy(65,11),xy(66,10),xy(66,11),xy(68,11)]).
fillpoint(r89, xy(68,11), 2).
fillpoint(r89, xy(67,11), 2).
fillpoint(r89, xy(66,11), 2).
fillpoint(r89, xy(66,10), 2).
fillpoint(r89, xy(65,11), 2).
region(r92, '#c8d2d7', 6, centroid(86,8)).
polygon(r92, [xy(84,7),xy(86,7),xy(86,8),xy(88,8),xy(84,7)]).
fillpoint(r92, xy(88,8), 1).
fillpoint(r92, xy(87,8), 1).
fillpoint(r92, xy(86,8), 1).
fillpoint(r92, xy(86,7), 1).
fillpoint(r92, xy(85,7), 1).
region(r94, '#3e4748', 37, centroid(6,14)).
polygon(r94, [xy(3,8),xy(3,9),xy(4,9),xy(4,10),xy(3,11),xy(4,12),xy(4,14),xy(5,15),xy(5,16),xy(6,16),xy(6,18),xy(7,17),xy(7,18),xy(8,18),xy(9,17),xy(7,15),xy(8,14),xy(5,11),xy(3,8)]).
midline(r94, [xy(4,11),xy(5,12),xy(6,14),xy(8,15),xy(8,17)]).
fillpoint(r94, xy(6,14), 3).
fillpoint(r94, xy(8,17), 2).
fillpoint(r94, xy(8,15), 2).
fillpoint(r94, xy(7,14), 2).
fillpoint(r94, xy(6,15), 2).
region(r100, '#c2cdd2', 252, centroid(70,18)).
polygon(r100, [xy(45,23),xy(54,23),xy(54,24),xy(55,23),xy(55,24),xy(56,23),xy(56,24),xy(57,24),xy(58,23),xy(58,24),xy(59,23),xy(59,24),xy(60,23),xy(60,24),xy(61,23),xy(61,24),xy(62,23),xy(62,24),xy(64,24),xy(65,23),xy(63,21),xy(63,20),xy(64,19),xy(64,20),xy(65,19),xy(65,18),xy(67,18),xy(67,19),xy(66,20),xy(65,20),xy(66,21),xy(68,19),xy(68,20),xy(69,19),xy(71,19),xy(71,21),xy(72,22),xy(71,23),xy(70,23),xy(69,24),xy(67,24),xy(66,23),xy(67,22),xy(68,22),xy(69,21),xy(45,23)]).
hole(r100, [xy(64,21),xy(65,21),xy(65,22),xy(66,22),xy(64,21)]).
hole(r100, [xy(67,21),xy(68,21),xy(67,21)]).
hole(r100, [xy(72,20),xy(72,21),xy(73,20),xy(73,21),xy(72,20)]).
midline(r100, [xy(56,11),xy(57,10),xy(57,11),xy(61,11),xy(61,12),xy(62,11),xy(62,12),xy(63,12),xy(63,13),xy(64,13),xy(65,14),xy(71,14),xy(71,15),xy(72,14),xy(74,15)]).
midline(r100, [xy(63,23),xy(64,23),xy(65,24),xy(66,24),xy(67,23),xy(68,23),xy(69,22),xy(69,23),xy(70,22),xy(70,21),xy(69,20),xy(70,20),xy(71,22)]).
midline(r100, [xy(74,22),xy(76,21),xy(78,22),xy(80,22),xy(81,20),xy(80,18),xy(78,17),xy(77,17),xy(77,18)]).
midline(r100, [xy(79,15)]).
fillpoint(r100, xy(78,17), 5).
fillpoint(r100, xy(77,18), 5).
fillpoint(r100, xy(77,17), 5).
fillpoint(r100, xy(80,18), 4).
fillpoint(r100, xy(79,17), 4).
region(r105, '#515959', 45, centroid(29,15)).
polygon(r105, [xy(25,13),xy(26,13),xy(26,16),xy(27,16),xy(27,18),xy(28,19),xy(28,20),xy(30,18),xy(29,17),xy(29,16),xy(27,14),xy(28,13),xy(28,11),xy(27,10),xy(27,9),xy(28,10),xy(30,10),xy(30,11),xy(29,12),xy(29,14),xy(30,15),xy(31,13),xy(31,10),xy(32,10),xy(25,13)]).
midline(r105, [xy(28,14),xy(29,15),xy(28,16),xy(28,18),xy(29,18),xy(31,19)]).
midline(r105, [xy(29,11)]).
fillpoint(r105, xy(31,19), 2).
fillpoint(r105, xy(29,18), 2).
fillpoint(r105, xy(29,15), 2).
fillpoint(r105, xy(29,11), 2).
fillpoint(r105, xy(28,18), 2).
region(r110, '#bac7cd', 5, centroid(37,10)).
polygon(r110, [xy(36,9),xy(37,9),xy(37,11),xy(38,10),xy(36,9)]).
fillpoint(r110, xy(38,10), 1).
fillpoint(r110, xy(37,11), 1).
fillpoint(r110, xy(37,10), 1).
fillpoint(r110, xy(37,9), 1).
fillpoint(r110, xy(36,9), 1).
region(r119, '#30393a', 6, centroid(22,12)).
polygon(r119, [xy(21,12),xy(22,12),xy(22,13),xy(23,12),xy(23,10),xy(21,12)]).
fillpoint(r119, xy(23,12), 1).
fillpoint(r119, xy(23,11), 1).
fillpoint(r119, xy(23,10), 1).
fillpoint(r119, xy(22,13), 1).
fillpoint(r119, xy(22,12), 1).
region(r120, '#9fa8ab', 5, centroid(34,10)).
polygon(r120, [xy(33,10),xy(34,10),xy(34,11),xy(35,10),xy(35,11),xy(33,10)]).
fillpoint(r120, xy(35,11), 1).
fillpoint(r120, xy(35,10), 1).
fillpoint(r120, xy(34,11), 1).
fillpoint(r120, xy(34,10), 1).
fillpoint(r120, xy(33,10), 1).
region(r122, '#c2cdd2', 21, centroid(39,13)).
polygon(r122, [xy(35,14),xy(35,15),xy(38,12),xy(39,12),xy(40,11),xy(39,10),xy(40,10),xy(41,12),xy(41,13),xy(40,14),xy(38,14),xy(37,15),xy(35,14)]).
midline(r122, [xy(37,14),xy(38,13),xy(39,13),xy(40,12),xy(40,13)]).
fillpoint(r122, xy(40,13), 2).
fillpoint(r122, xy(40,12), 2).
fillpoint(r122, xy(39,13), 2).
fillpoint(r122, xy(38,13), 2).
fillpoint(r122, xy(37,14), 2).
region(r128, '#bfc9ce', 39, centroid(83,16)).
polygon(r128, [xy(79,11),xy(80,10),xy(80,11),xy(81,11),xy(81,12),xy(82,11),xy(83,11),xy(84,12),xy(84,13),xy(83,14),xy(82,13),xy(83,15),xy(83,17),xy(84,18),xy(84,21),xy(82,23),xy(83,23),xy(85,21),xy(85,14),xy(79,11)]).
midline(r128, [xy(82,12),xy(83,12),xy(83,13),xy(84,14),xy(84,17)]).
fillpoint(r128, xy(84,17), 2).
fillpoint(r128, xy(84,16), 2).
fillpoint(r128, xy(84,15), 2).
fillpoint(r128, xy(84,14), 2).
fillpoint(r128, xy(83,13), 2).
region(r130, '#aeb8bb', 233, centroid(82,28)).
polygon(r130, [xy(62,37),xy(62,38),xy(63,39),xy(65,37),xy(71,37),xy(72,36),xy(75,36),xy(76,35),xy(80,35),xy(82,33),xy(83,33),xy(85,31),xy(86,31),xy(87,30),xy(89,30),xy(92,27),xy(93,27),xy(95,25),xy(95,11),xy(94,10),xy(93,10),xy(92,11),xy(91,11),xy(91,13),xy(92,14),xy(92,23),xy(91,24),xy(89,24),xy(88,25),xy(87,25),xy(84,28),xy(83,28),xy(82,29),xy(81,29),xy(80,30),xy(78,30),xy(77,31),xy(75,31),xy(74,32),xy(70,32),xy(69,33),xy(65,33),xy(64,34),xy(63,34),xy(63,36),xy(62,37)]).
midline(r130, [xy(63,37),xy(63,38),xy(64,37),xy(65,35),xy(69,35),xy(70,34),xy(70,35),xy(71,34),xy(71,35),xy(72,34),xy(74,34),xy(75,33),xy(75,34),xy(76,33),xy(77,33),xy(78,32),xy(78,33),xy(79,32),xy(79,33),xy(80,32),xy(80,33),xy(81,32),xy(81,31),xy(82,31),xy(83,30),xy(83,31),xy(86,28),xy(86,29),xy(87,28),xy(87,27),xy(89,27),xy(91,26),xy(93,24),xy(93,25)]).
midline(r130, [xy(93,12),xy(93,22),xy(94,21),xy(94,15)]).
midline(r130, [xy(94,22)]).
fillpoint(r130, xy(89,27), 4).
fillpoint(r130, xy(93,25), 3).
fillpoint(r130, xy(93,24), 3).
fillpoint(r130, xy(93,13), 3).
fillpoint(r130, xy(93,12), 3).
region(r131, '#3e4748', 22, centroid(31,15)).
polygon(r131, [xy(29,13),xy(30,12),xy(30,14),xy(31,14),xy(31,15),xy(30,16),xy(30,17),xy(31,17),xy(32,18),xy(33,17),xy(33,14),xy(32,13),xy(32,11),xy(29,13)]).
midline(r131, [xy(31,16),xy(32,15),xy(32,17)]).
fillpoint(r131, xy(32,17), 2).
fillpoint(r131, xy(32,16), 2).
fillpoint(r131, xy(32,15), 2).
fillpoint(r131, xy(32,14), 2).
fillpoint(r131, xy(31,16), 2).
region(r137, '#bac7cd', 8, centroid(75,11)).
polygon(r137, [xy(71,11),xy(78,11),xy(71,11)]).
fillpoint(r137, xy(78,11), 1).
fillpoint(r137, xy(77,11), 1).
fillpoint(r137, xy(76,11), 1).
fillpoint(r137, xy(75,11), 1).
fillpoint(r137, xy(74,11), 1).
region(r139, '#515959', 4, centroid(34,13)).
polygon(r139, [xy(33,12),xy(33,13),xy(34,12),xy(34,13),xy(33,12)]).
fillpoint(r139, xy(34,13), 1).
fillpoint(r139, xy(34,12), 1).
fillpoint(r139, xy(33,13), 1).
fillpoint(r139, xy(33,12), 1).
region(r145, '#bac7cd', 11, centroid(86,16)).
polygon(r145, [xy(85,12),xy(85,13),xy(86,13),xy(86,21),xy(85,12)]).
fillpoint(r145, xy(86,21), 1).
fillpoint(r145, xy(86,20), 1).
fillpoint(r145, xy(86,19), 1).
fillpoint(r145, xy(86,18), 1).
fillpoint(r145, xy(86,17), 1).
region(r150, '#aeb8bb', 7, centroid(53,15)).
polygon(r150, [xy(52,16),xy(53,15),xy(53,13),xy(54,14),xy(55,14),xy(53,16),xy(52,16)]).
fillpoint(r150, xy(55,14), 1).
fillpoint(r150, xy(54,14), 1).
fillpoint(r150, xy(53,16), 1).
fillpoint(r150, xy(53,15), 1).
fillpoint(r150, xy(53,14), 1).
region(r165, '#3e4748', 12, centroid(17,20)).
polygon(r165, [xy(16,21),xy(16,22),xy(17,22),xy(18,21),xy(17,20),xy(17,16),xy(16,21)]).
midline(r165, [xy(17,21)]).
fillpoint(r165, xy(17,21), 2).
fillpoint(r165, xy(18,21), 1).
fillpoint(r165, xy(18,20), 1).
fillpoint(r165, xy(18,19), 1).
fillpoint(r165, xy(17,22), 1).
region(r171, '#c2cdd2', 15, centroid(37,19)).
polygon(r171, [xy(35,19),xy(36,18),xy(36,16),xy(37,18),xy(38,19),xy(38,20),xy(37,21),xy(36,20),xy(35,19)]).
midline(r171, [xy(36,19),xy(37,19),xy(37,20)]).
fillpoint(r171, xy(37,20), 2).
fillpoint(r171, xy(37,19), 2).
fillpoint(r171, xy(36,19), 2).
fillpoint(r171, xy(40,19), 1).
fillpoint(r171, xy(39,19), 1).
region(r188, '#c2cdd2', 14, centroid(55,19)).
polygon(r188, [xy(51,19),xy(52,18),xy(52,19),xy(53,19),xy(54,18),xy(54,19),xy(55,18),xy(56,18),xy(57,19),xy(56,20),xy(57,20),xy(51,19)]).
midline(r188, [xy(55,19),xy(56,19)]).
fillpoint(r188, xy(56,19), 2).
fillpoint(r188, xy(55,19), 2).
fillpoint(r188, xy(57,20), 1).
fillpoint(r188, xy(57,19), 1).
fillpoint(r188, xy(56,20), 1).
region(r190, '#30393a', 11, centroid(26,22)).
polygon(r190, [xy(25,19),xy(26,19),xy(26,21),xy(25,22),xy(26,23),xy(26,24),xy(27,23),xy(27,24),xy(25,19)]).
midline(r190, [xy(26,22)]).
fillpoint(r190, xy(26,22), 2).
fillpoint(r190, xy(27,24), 1).
fillpoint(r190, xy(27,23), 1).
fillpoint(r190, xy(27,22), 1).
fillpoint(r190, xy(26,24), 1).
region(r191, '#3e4748', 25, centroid(28,24)).
polygon(r191, [xy(26,25),xy(26,27),xy(27,27),xy(27,28),xy(28,26),xy(27,25),xy(28,24),xy(28,22),xy(27,21),xy(27,19),xy(28,21),xy(29,20),xy(29,21),xy(30,20),xy(26,25)]).
midline(r191, [xy(27,26),xy(28,25),xy(29,25)]).
fillpoint(r191, xy(29,25), 2).
fillpoint(r191, xy(28,25), 2).
fillpoint(r191, xy(27,26), 2).
fillpoint(r191, xy(31,25), 1).
fillpoint(r191, xy(30,25), 1).
region(r195, '#3e4748', 8, centroid(5,22)).
polygon(r195, [xy(4,20),xy(4,21),xy(5,20),xy(5,23),xy(4,24),xy(5,24),xy(4,20)]).
fillpoint(r195, xy(5,24), 1).
fillpoint(r195, xy(5,23), 1).
fillpoint(r195, xy(5,22), 1).
fillpoint(r195, xy(5,21), 1).
fillpoint(r195, xy(5,20), 1).
region(r200, '#bfc9ce', 6, centroid(36,21)).
polygon(r200, [xy(34,20),xy(35,20),xy(35,21),xy(36,21),xy(36,22),xy(37,22),xy(34,20)]).
fillpoint(r200, xy(37,22), 1).
fillpoint(r200, xy(36,22), 1).
fillpoint(r200, xy(36,21), 1).
fillpoint(r200, xy(35,21), 1).
fillpoint(r200, xy(35,20), 1).
region(r202, '#c8d2d7', 4, centroid(73,21)).
polygon(r202, [xy(72,20),xy(72,21),xy(73,20),xy(73,21),xy(72,20)]).
fillpoint(r202, xy(73,21), 1).
fillpoint(r202, xy(73,20), 1).
fillpoint(r202, xy(72,21), 1).
fillpoint(r202, xy(72,20), 1).
region(r207, '#bac7cd', 45, centroid(39,25)).
polygon(r207, [xy(32,24),xy(33,24),xy(34,23),xy(33,22),xy(33,21),xy(34,21),xy(36,23),xy(35,24),xy(34,24),xy(36,25),xy(37,24),xy(37,23),xy(38,23),xy(39,24),xy(38,25),xy(38,26),xy(39,27),xy(40,27),xy(41,28),xy(42,28),xy(44,26),xy(44,25),xy(43,24),xy(40,24),xy(32,24)]).
midline(r207, [xy(34,22),xy(36,24),xy(38,24),xy(39,25),xy(39,26),xy(42,26)]).
fillpoint(r207, xy(42,26), 3).
fillpoint(r207, xy(41,26), 3).
fillpoint(r207, xy(43,26), 2).
fillpoint(r207, xy(43,25), 2).
fillpoint(r207, xy(42,27), 2).
region(r211, '#c8d2d7', 4, centroid(65,22)).
polygon(r211, [xy(64,21),xy(65,21),xy(65,22),xy(66,22),xy(64,21)]).
fillpoint(r211, xy(66,22), 1).
fillpoint(r211, xy(65,22), 1).
fillpoint(r211, xy(65,21), 1).
fillpoint(r211, xy(64,21), 1).
region(r221, '#c2cdd2', 4, centroid(43,22)).
polygon(r221, [xy(41,22),xy(44,22),xy(41,22)]).
fillpoint(r221, xy(44,22), 1).
fillpoint(r221, xy(43,22), 1).
fillpoint(r221, xy(42,22), 1).
fillpoint(r221, xy(41,22), 1).
region(r225, '#bfc9ce', 4, centroid(43,23)).
polygon(r225, [xy(41,23),xy(44,23),xy(41,23)]).
fillpoint(r225, xy(44,23), 1).
fillpoint(r225, xy(43,23), 1).
fillpoint(r225, xy(42,23), 1).
fillpoint(r225, xy(41,23), 1).
region(r229, '#bfc9ce', 67, centroid(61,25)).
polygon(r229, [xy(44,27),xy(45,26),xy(45,24),xy(46,24),xy(46,26),xy(45,27),xy(44,27)]).
midline(r229, [xy(53,25)]).
midline(r229, [xy(70,25)]).
fillpoint(r229, xy(70,25), 2).
fillpoint(r229, xy(53,25), 2).
fillpoint(r229, xy(80,24), 1).
fillpoint(r229, xy(79,25), 1).
fillpoint(r229, xy(79,24), 1).
region(r230, '#bac7cd', 7, centroid(81,25)).
polygon(r230, [xy(79,26),xy(80,25),xy(80,26),xy(81,25),xy(81,24),xy(82,24),xy(82,25),xy(79,26)]).
fillpoint(r230, xy(82,25), 1).
fillpoint(r230, xy(82,24), 1).
fillpoint(r230, xy(81,25), 1).
fillpoint(r230, xy(81,24), 1).
fillpoint(r230, xy(80,26), 1).
region(r231, '#878f91', 4, centroid(32,26)).
polygon(r231, [xy(31,26),xy(32,25),xy(32,26),xy(33,26),xy(31,26)]).
fillpoint(r231, xy(33,26), 1).
fillpoint(r231, xy(32,26), 1).
fillpoint(r231, xy(32,25), 1).
fillpoint(r231, xy(31,26), 1).
region(r236, '#bac7cd', 78, centroid(58,28)).
polygon(r236, [xy(46,27),xy(47,26),xy(47,25),xy(51,25),xy(52,26),xy(51,27),xy(50,27),xy(48,29),xy(47,28),xy(47,29),xy(49,29),xy(46,27)]).
hole(r236, [xy(61,29),xy(62,29),xy(61,29)]).
midline(r236, [xy(48,27),xy(50,26),xy(51,26)]).
midline(r236, [xy(55,28),xy(58,28),xy(58,29),xy(59,28),xy(59,29),xy(60,28)]).
midline(r236, [xy(63,28),xy(64,28)]).
fillpoint(r236, xy(48,27), 3).
fillpoint(r236, xy(64,28), 2).
fillpoint(r236, xy(63,28), 2).
fillpoint(r236, xy(60,28), 2).
fillpoint(r236, xy(59,29), 2).
region(r237, '#bac7cd', 4, centroid(77,25)).
polygon(r237, [xy(75,25),xy(78,25),xy(75,25)]).
fillpoint(r237, xy(78,25), 1).
fillpoint(r237, xy(77,25), 1).
fillpoint(r237, xy(76,25), 1).
fillpoint(r237, xy(75,25), 1).
region(r239, '#30393a', 5, centroid(25,27)).
polygon(r239, [xy(24,27),xy(25,26),xy(25,28),xy(26,28),xy(24,27)]).
fillpoint(r239, xy(26,28), 1).
fillpoint(r239, xy(25,28), 1).
fillpoint(r239, xy(25,27), 1).
fillpoint(r239, xy(25,26), 1).
fillpoint(r239, xy(24,27), 1).
region(r240, '#515959', 48, centroid(33,29)).
polygon(r240, [xy(27,29),xy(27,30),xy(28,31),xy(29,31),xy(30,30),xy(30,31),xy(31,31),xy(32,30),xy(31,29),xy(32,29),xy(33,28),xy(32,27),xy(31,27),xy(30,26),xy(30,27),xy(29,28),xy(28,28),xy(27,29)]).
midline(r240, [xy(28,29),xy(28,30),xy(29,29),xy(29,30),xy(30,29),xy(30,28),xy(32,28),xy(34,27),xy(36,28),xy(37,28)]).
fillpoint(r240, xy(37,28), 2).
fillpoint(r240, xy(36,28), 2).
fillpoint(r240, xy(34,27), 2).
fillpoint(r240, xy(32,28), 2).
fillpoint(r240, xy(31,28), 2).
region(r243, '#9fa8ab', 176, centroid(83,35)).
polygon(r243, [xy(63,40),xy(64,39),xy(64,40),xy(81,40),xy(82,39),xy(84,39),xy(85,38),xy(87,38),xy(88,37),xy(90,37),xy(91,36),xy(92,36),xy(95,33),xy(95,28),xy(94,27),xy(93,28),xy(92,28),xy(89,31),xy(87,31),xy(86,32),xy(85,32),xy(83,34),xy(82,34),xy(80,36),xy(76,36),xy(75,37),xy(72,37),xy(71,38),xy(65,38),xy(63,40)]).
midline(r243, [xy(65,39),xy(71,39),xy(72,38),xy(72,39),xy(73,38),xy(73,39),xy(74,38),xy(74,39),xy(76,38),xy(80,38),xy(81,37),xy(81,38),xy(82,37),xy(82,36),xy(84,36),xy(85,35),xy(86,35),xy(87,34),xy(87,35),xy(88,34),xy(89,34),xy(90,33),xy(90,34),xy(91,33),xy(91,32),xy(92,31),xy(92,33)]).
midline(r243, [xy(94,28)]).
fillpoint(r243, xy(92,33), 4).
fillpoint(r243, xy(92,32), 4).
fillpoint(r243, xy(92,31), 4).
fillpoint(r243, xy(91,33), 4).
fillpoint(r243, xy(91,32), 4).
region(r253, '#b8c3c7', 68, centroid(54,32)).
polygon(r253, [xy(47,31),xy(48,30),xy(48,31),xy(50,29),xy(50,28),xy(52,28),xy(53,29),xy(53,32),xy(52,33),xy(51,32),xy(50,33),xy(49,32),xy(48,33),xy(49,33),xy(50,34),xy(51,34),xy(53,33),xy(55,33),xy(55,34),xy(56,35),xy(58,35),xy(59,34),xy(60,34),xy(61,33),xy(59,31),xy(58,31),xy(57,30),xy(56,30),xy(56,32),xy(47,31)]).
midline(r253, [xy(50,31),xy(51,30),xy(52,32)]).
midline(r253, [xy(57,31),xy(57,33),xy(60,33)]).
fillpoint(r253, xy(58,33), 3).
fillpoint(r253, xy(57,33), 3).
fillpoint(r253, xy(51,30), 3).
fillpoint(r253, xy(50,31), 3).
fillpoint(r253, xy(60,33), 2).
region(r254, '#3e4748', 4, centroid(4,30)).
polygon(r254, [xy(4,29),xy(4,31),xy(5,29),xy(4,29)]).
fillpoint(r254, xy(5,29), 1).
fillpoint(r254, xy(4,31), 1).
fillpoint(r254, xy(4,30), 1).
fillpoint(r254, xy(4,29), 1).
region(r255, '#30393a', 7, centroid(18,30)).
polygon(r255, [xy(17,30),xy(17,31),xy(18,30),xy(18,29),xy(19,29),xy(19,30),xy(20,30),xy(17,30)]).
fillpoint(r255, xy(20,30), 1).
fillpoint(r255, xy(19,30), 1).
fillpoint(r255, xy(19,29), 1).
fillpoint(r255, xy(18,30), 1).
fillpoint(r255, xy(18,29), 1).
region(r257, '#3e4748', 4, centroid(34,29)).
polygon(r257, [xy(33,29),xy(34,29),xy(34,30),xy(35,29),xy(33,29)]).
fillpoint(r257, xy(35,29), 1).
fillpoint(r257, xy(34,30), 1).
fillpoint(r257, xy(34,29), 1).
fillpoint(r257, xy(33,29), 1).
region(r262, '#515959', 10, centroid(45,31)).
polygon(r262, [xy(43,30),xy(44,29),xy(45,30),xy(44,31),xy(46,31),xy(46,34),xy(43,30)]).
midline(r262, [xy(44,30)]).
fillpoint(r262, xy(44,30), 2).
fillpoint(r262, xy(46,34), 1).
fillpoint(r262, xy(46,33), 1).
fillpoint(r262, xy(46,32), 1).
fillpoint(r262, xy(46,31), 1).
region(r266, '#515959', 26, centroid(6,35)).
polygon(r266, [xy(5,30),xy(5,38),xy(7,38),xy(8,37),xy(7,36),xy(7,33),xy(6,32),xy(5,30)]).
midline(r266, [xy(6,33),xy(6,37),xy(7,37)]).
fillpoint(r266, xy(7,37), 2).
fillpoint(r266, xy(6,37), 2).
fillpoint(r266, xy(6,36), 2).
fillpoint(r266, xy(6,35), 2).
fillpoint(r266, xy(6,34), 2).
region(r276, '#3e4748', 4, centroid(20,31)).
polygon(r276, [xy(18,31),xy(21,31),xy(18,31)]).
fillpoint(r276, xy(21,31), 1).
fillpoint(r276, xy(20,31), 1).
fillpoint(r276, xy(19,31), 1).
fillpoint(r276, xy(18,31), 1).
region(r283, '#3e4748', 41, centroid(45,37)).
polygon(r283, [xy(41,37),xy(42,36),xy(42,35),xy(43,35),xy(44,34),xy(42,32),xy(43,31),xy(44,32),xy(45,32),xy(45,34),xy(44,35),xy(45,36),xy(45,37),xy(46,37),xy(46,40),xy(44,39),xy(42,37),xy(43,37),xy(42,39),xy(42,40),xy(44,40),xy(41,37)]).
midline(r283, [xy(43,32),xy(44,33),xy(45,35)]).
midline(r283, [xy(43,39)]).
fillpoint(r283, xy(45,35), 2).
fillpoint(r283, xy(44,33), 2).
fillpoint(r283, xy(43,39), 2).
fillpoint(r283, xy(43,32), 2).
fillpoint(r283, xy(51,40), 1).
region(r288, '#3e4748', 8, centroid(0,35)).
polygon(r288, [xy(0,32),xy(0,38),xy(1,38),xy(0,32)]).
fillpoint(r288, xy(1,38), 1).
fillpoint(r288, xy(0,38), 1).
fillpoint(r288, xy(0,37), 1).
fillpoint(r288, xy(0,36), 1).
fillpoint(r288, xy(0,35), 1).
region(r289, '#30393a', 6, centroid(18,34)).
polygon(r289, [xy(18,32),xy(18,35),xy(19,34),xy(19,35),xy(18,32)]).
fillpoint(r289, xy(19,35), 1).
fillpoint(r289, xy(19,34), 1).
fillpoint(r289, xy(18,35), 1).
fillpoint(r289, xy(18,34), 1).
fillpoint(r289, xy(18,33), 1).
region(r290, '#515959', 13, centroid(21,33)).
polygon(r290, [xy(19,32),xy(20,32),xy(20,34),xy(22,34),xy(23,33),xy(22,32),xy(23,32),xy(24,33),xy(19,32)]).
midline(r290, [xy(21,33),xy(22,33)]).
fillpoint(r290, xy(22,33), 2).
fillpoint(r290, xy(21,33), 2).
fillpoint(r290, xy(24,33), 1).
fillpoint(r290, xy(23,33), 1).
fillpoint(r290, xy(23,32), 1).
region(r294, '#24221e', 4, centroid(40,33)).
polygon(r294, [xy(39,32),xy(39,33),xy(40,33),xy(40,34),xy(39,32)]).
fillpoint(r294, xy(40,34), 1).
fillpoint(r294, xy(40,33), 1).
fillpoint(r294, xy(39,33), 1).
fillpoint(r294, xy(39,32), 1).
region(r301, '#3e4748', 6, centroid(4,36)).
polygon(r301, [xy(4,33),xy(4,38),xy(4,33)]).
fillpoint(r301, xy(4,38), 1).
fillpoint(r301, xy(4,37), 1).
fillpoint(r301, xy(4,36), 1).
fillpoint(r301, xy(4,35), 1).
fillpoint(r301, xy(4,34), 1).
region(r302, '#3e4748', 4, centroid(8,35)).
polygon(r302, [xy(8,33),xy(8,36),xy(8,33)]).
fillpoint(r302, xy(8,36), 1).
fillpoint(r302, xy(8,35), 1).
fillpoint(r302, xy(8,34), 1).
fillpoint(r302, xy(8,33), 1).
region(r307, '#30393a', 9, centroid(41,34)).
polygon(r307, [xy(39,35),xy(40,35),xy(41,34),xy(41,33),xy(42,33),xy(42,34),xy(41,35),xy(41,36),xy(43,34),xy(39,35)]).
fillpoint(r307, xy(43,34), 1).
fillpoint(r307, xy(42,34), 1).
fillpoint(r307, xy(42,33), 1).
fillpoint(r307, xy(41,36), 1).
fillpoint(r307, xy(41,35), 1).
region(r309, '#24221e', 4, centroid(2,36)).
polygon(r309, [xy(2,34),xy(2,37),xy(2,34)]).
fillpoint(r309, xy(2,37), 1).
fillpoint(r309, xy(2,36), 1).
fillpoint(r309, xy(2,35), 1).
fillpoint(r309, xy(2,34), 1).
region(r321, '#30393a', 16, centroid(30,38)).
polygon(r321, [xy(27,36),xy(28,35),xy(29,36),xy(28,37),xy(29,37),xy(30,36),xy(30,39),xy(31,39),xy(31,40),xy(32,39),xy(32,40),xy(33,40),xy(27,36)]).
midline(r321, [xy(28,36)]).
fillpoint(r321, xy(28,36), 2).
fillpoint(r321, xy(33,40), 1).
fillpoint(r321, xy(32,40), 1).
fillpoint(r321, xy(32,39), 1).
fillpoint(r321, xy(32,38), 1).
region(r327, '#b8c3c7', 4, centroid(53,35)).
polygon(r327, [xy(52,35),xy(54,35),xy(54,36),xy(52,35)]).
fillpoint(r327, xy(54,36), 1).
fillpoint(r327, xy(54,35), 1).
fillpoint(r327, xy(53,35), 1).
fillpoint(r327, xy(52,35), 1).
region(r328, '#aeb8bb', 14, centroid(57,37)).
polygon(r328, [xy(55,35),xy(55,37),xy(56,36),xy(57,36),xy(57,37),xy(56,38),xy(56,39),xy(57,38),xy(58,38),xy(59,37),xy(58,36),xy(59,38),xy(55,35)]).
midline(r328, [xy(56,37)]).
fillpoint(r328, xy(56,37), 2).
fillpoint(r328, xy(59,38), 1).
fillpoint(r328, xy(59,37), 1).
fillpoint(r328, xy(58,38), 1).
fillpoint(r328, xy(58,36), 1).
region(r332, '#878f91', 43, centroid(91,39)).
polygon(r332, [xy(82,40),xy(84,40),xy(85,39),xy(85,40),xy(86,39),xy(86,40),xy(87,39),xy(87,40),xy(94,40),xy(95,39),xy(95,36),xy(94,35),xy(92,37),xy(91,37),xy(90,38),xy(88,38),xy(82,40)]).
midline(r332, [xy(88,39),xy(90,39),xy(91,38),xy(91,39),xy(93,38),xy(94,36)]).
fillpoint(r332, xy(93,38), 3).
fillpoint(r332, xy(94,39), 2).
fillpoint(r332, xy(94,38), 2).
fillpoint(r332, xy(94,37), 2).
fillpoint(r332, xy(94,36), 2).
region(r333, '#515959', 7, centroid(44,38)).
polygon(r333, [xy(43,36),xy(44,36),xy(44,38),xy(45,38),xy(45,40),xy(43,36)]).
fillpoint(r333, xy(45,40), 1).
fillpoint(r333, xy(45,39), 1).
fillpoint(r333, xy(45,38), 1).
fillpoint(r333, xy(44,38), 1).
fillpoint(r333, xy(44,37), 1).
region(r334, '#515959', 15, centroid(50,37)).
polygon(r334, [xy(46,36),xy(48,36),xy(48,37),xy(49,37),xy(49,38),xy(50,38),xy(50,39),xy(51,38),xy(51,37),xy(50,36),xy(51,36),xy(46,36)]).
fillpoint(r334, xy(52,40), 1).
fillpoint(r334, xy(52,39), 1).
fillpoint(r334, xy(51,39), 1).
fillpoint(r334, xy(51,38), 1).
fillpoint(r334, xy(51,37), 1).
region(r346, '#30393a', 4, centroid(1,39)).
polygon(r346, [xy(0,39),xy(1,39),xy(2,38),xy(2,39),xy(0,39)]).
fillpoint(r346, xy(2,39), 1).
fillpoint(r346, xy(2,38), 1).
fillpoint(r346, xy(1,39), 1).
fillpoint(r346, xy(0,39), 1).
region(r347, '#24221e', 11, centroid(3,40)).
polygon(r347, [xy(0,40),xy(2,40),xy(3,39),xy(3,38),xy(4,39),xy(3,40),xy(7,40),xy(0,40)]).
fillpoint(r347, xy(7,40), 1).
fillpoint(r347, xy(6,40), 1).
fillpoint(r347, xy(5,40), 1).
fillpoint(r347, xy(4,40), 1).
fillpoint(r347, xy(4,39), 1).
region(r351, '#515959', 7, centroid(41,39)).
polygon(r351, [xy(39,38),xy(40,38),xy(40,39),xy(41,38),xy(41,40),xy(42,38),xy(39,38)]).
fillpoint(r351, xy(42,38), 1).
fillpoint(r351, xy(41,40), 1).
fillpoint(r351, xy(41,39), 1).
fillpoint(r351, xy(41,38), 1).
fillpoint(r351, xy(40,39), 1).
region(r363, '#878f91', 4, centroid(59,39)).
polygon(r363, [xy(57,39),xy(60,39),xy(57,39)]).
fillpoint(r363, xy(60,39), 1).
fillpoint(r363, xy(59,39), 1).
fillpoint(r363, xy(58,39), 1).
fillpoint(r363, xy(57,39), 1).
region(r372, '#515959', 6, centroid(60,40)).
polygon(r372, [xy(57,40),xy(62,40),xy(57,40)]).
fillpoint(r372, xy(62,40), 1).
fillpoint(r372, xy(61,40), 1).
fillpoint(r372, xy(60,40), 1).
fillpoint(r372, xy(59,40), 1).
fillpoint(r372, xy(58,40), 1).
adjacent(r1, r165).
shared_edge(r1, r165, 4).
adjacent(r1, r195).
shared_edge(r1, r195, 16).
adjacent(r1, r2).
shared_edge(r1, r2, 5).
adjacent(r1, r203).
shared_edge(r1, r203, 4).
adjacent(r1, r244).
shared_edge(r1, r244, 3).
adjacent(r1, r254).
shared_edge(r1, r254, 7).
adjacent(r1, r266).
shared_edge(r1, r266, 4).
adjacent(r1, r275).
shared_edge(r1, r275, 4).
adjacent(r1, r288).
shared_edge(r1, r288, 8).
adjacent(r1, r3).
shared_edge(r1, r3, 33).
adjacent(r1, r301).
shared_edge(r1, r301, 6).
adjacent(r1, r302).
shared_edge(r1, r302, 5).
adjacent(r1, r309).
shared_edge(r1, r309, 9).
adjacent(r1, r347).
shared_edge(r1, r347, 1).
adjacent(r1, r348).
shared_edge(r1, r348, 2).
adjacent(r1, r349).
shared_edge(r1, r349, 4).
adjacent(r1, r357).
shared_edge(r1, r357, 3).
adjacent(r1, r36).
shared_edge(r1, r36, 12).
adjacent(r1, r366).
shared_edge(r1, r366, 1).
adjacent(r1, r368).
shared_edge(r1, r368, 2).
adjacent(r1, r81).
shared_edge(r1, r81, 53).
adjacent(r1, r94).
shared_edge(r1, r94, 40).
adjacent(r10, r9).
shared_edge(r10, r9, 6).
adjacent(r100, r115).
shared_edge(r100, r115, 2).
adjacent(r100, r126).
shared_edge(r100, r126, 2).
adjacent(r100, r128).
shared_edge(r100, r128, 20).
adjacent(r100, r136).
shared_edge(r100, r136, 1).
adjacent(r100, r14).
shared_edge(r100, r14, 60).
adjacent(r100, r144).
shared_edge(r100, r144, 2).
adjacent(r100, r152).
shared_edge(r100, r152, 1).
adjacent(r100, r153).
shared_edge(r100, r153, 2).
adjacent(r100, r16).
shared_edge(r100, r16, 1).
adjacent(r100, r194).
shared_edge(r100, r194, 4).
adjacent(r100, r20).
shared_edge(r100, r20, 6).
adjacent(r100, r202).
shared_edge(r100, r202, 8).
adjacent(r100, r211).
shared_edge(r100, r211, 10).
adjacent(r100, r212).
shared_edge(r100, r212, 6).
adjacent(r100, r213).
shared_edge(r100, r213, 4).
adjacent(r100, r225).
shared_edge(r100, r225, 1).
adjacent(r100, r229).
shared_edge(r100, r229, 40).
adjacent(r100, r89).
shared_edge(r100, r89, 24).
adjacent(r101, r102).
shared_edge(r101, r102, 1).
adjacent(r101, r21).
shared_edge(r101, r21, 2).
adjacent(r101, r91).
shared_edge(r101, r91, 1).
adjacent(r102, r103).
shared_edge(r102, r103, 1).
adjacent(r102, r21).
shared_edge(r102, r21, 1).
adjacent(r102, r92).
shared_edge(r102, r92, 1).
adjacent(r103, r21).
shared_edge(r103, r21, 1).
adjacent(r103, r92).
shared_edge(r103, r92, 2).
adjacent(r104, r118).
shared_edge(r104, r118, 2).
adjacent(r104, r25).
shared_edge(r104, r25, 3).
adjacent(r104, r92).
shared_edge(r104, r92, 1).
adjacent(r105, r106).
shared_edge(r105, r106, 3).
adjacent(r105, r107).
shared_edge(r105, r107, 1).
adjacent(r105, r108).
shared_edge(r105, r108, 1).
adjacent(r105, r120).
shared_edge(r105, r120, 1).
adjacent(r105, r131).
shared_edge(r105, r131, 22).
adjacent(r105, r146).
shared_edge(r105, r146, 3).
adjacent(r105, r158).
shared_edge(r105, r158, 4).
adjacent(r105, r168).
shared_edge(r105, r168, 1).
adjacent(r105, r176).
shared_edge(r105, r176, 3).
adjacent(r105, r191).
shared_edge(r105, r191, 8).
adjacent(r105, r192).
shared_edge(r105, r192, 1).
adjacent(r105, r198).
shared_edge(r105, r198, 2).
adjacent(r105, r205).
shared_edge(r105, r205, 1).
adjacent(r105, r60).
shared_edge(r105, r60, 11).
adjacent(r105, r62).
shared_edge(r105, r62, 1).
adjacent(r105, r63).
shared_edge(r105, r63, 1).
adjacent(r106, r63).
shared_edge(r106, r63, 2).
adjacent(r106, r95).
shared_edge(r106, r95, 1).
adjacent(r107, r108).
shared_edge(r107, r108, 1).
adjacent(r107, r63).
shared_edge(r107, r63, 1).
adjacent(r107, r83).
shared_edge(r107, r83, 1).
adjacent(r108, r83).
shared_edge(r108, r83, 2).
adjacent(r109, r110).
shared_edge(r109, r110, 1).
adjacent(r109, r120).
shared_edge(r109, r120, 1).
adjacent(r109, r38).
shared_edge(r109, r38, 1).
adjacent(r109, r83).
shared_edge(r109, r83, 1).
adjacent(r11, r12).
shared_edge(r11, r12, 5).
adjacent(r11, r38).
shared_edge(r11, r38, 3).
adjacent(r11, r65).
shared_edge(r11, r65, 1).
adjacent(r11, r9).
shared_edge(r11, r9, 3).
adjacent(r110, r111).
shared_edge(r110, r111, 2).
adjacent(r110, r121).
shared_edge(r110, r121, 2).
adjacent(r110, r122).
shared_edge(r110, r122, 1).
adjacent(r110, r133).
shared_edge(r110, r133, 1).
adjacent(r110, r134).
shared_edge(r110, r134, 2).
adjacent(r110, r141).
shared_edge(r110, r141, 1).
adjacent(r110, r85).
shared_edge(r110, r85, 1).
adjacent(r110, r86).
shared_edge(r110, r86, 1).
adjacent(r111, r112).
shared_edge(r111, r112, 1).
adjacent(r111, r97).
shared_edge(r111, r97, 1).
adjacent(r112, r122).
shared_edge(r112, r122, 1).
adjacent(r112, r98).
shared_edge(r112, r98, 2).
adjacent(r113, r123).
shared_edge(r113, r123, 1).
adjacent(r113, r14).
shared_edge(r113, r14, 2).
adjacent(r113, r98).
shared_edge(r113, r98, 1).
adjacent(r114, r124).
shared_edge(r114, r124, 1).
adjacent(r114, r14).
shared_edge(r114, r14, 2).
adjacent(r114, r16).
shared_edge(r114, r16, 1).
adjacent(r115, r126).
shared_edge(r115, r126, 1).
adjacent(r115, r16).
shared_edge(r115, r16, 3).
adjacent(r116, r117).
shared_edge(r116, r117, 1).
adjacent(r116, r21).
shared_edge(r116, r21, 2).
adjacent(r116, r92).
shared_edge(r116, r92, 1).
adjacent(r117, r118).
shared_edge(r117, r118, 1).
adjacent(r117, r21).
shared_edge(r117, r21, 2).
adjacent(r117, r92).
shared_edge(r117, r92, 2).
adjacent(r118, r21).
shared_edge(r118, r21, 3).
adjacent(r119, r60).
shared_edge(r119, r60, 5).
adjacent(r119, r81).
shared_edge(r119, r81, 9).
adjacent(r12, r13).
shared_edge(r12, r13, 2).
adjacent(r12, r39).
shared_edge(r12, r39, 3).
adjacent(r12, r66).
shared_edge(r12, r66, 1).
adjacent(r120, r121).
shared_edge(r120, r121, 1).
adjacent(r120, r132).
shared_edge(r120, r132, 2).
adjacent(r120, r133).
shared_edge(r120, r133, 1).
adjacent(r120, r139).
shared_edge(r120, r139, 1).
adjacent(r120, r140).
shared_edge(r120, r140, 1).
adjacent(r120, r83).
shared_edge(r120, r83, 2).
adjacent(r121, r133).
shared_edge(r121, r133, 1).
adjacent(r122, r123).
shared_edge(r122, r123, 1).
adjacent(r122, r134).
shared_edge(r122, r134, 4).
adjacent(r122, r14).
shared_edge(r122, r14, 11).
adjacent(r122, r141).
shared_edge(r122, r141, 2).
adjacent(r122, r147).
shared_edge(r122, r147, 1).
adjacent(r122, r148).
shared_edge(r122, r148, 2).
adjacent(r122, r154).
shared_edge(r122, r154, 1).
adjacent(r122, r159).
shared_edge(r122, r159, 1).
adjacent(r122, r160).
shared_edge(r122, r160, 3).
adjacent(r122, r170).
shared_edge(r122, r170, 1).
adjacent(r122, r98).
shared_edge(r122, r98, 1).
adjacent(r123, r14).
shared_edge(r123, r14, 2).
adjacent(r124, r14).
shared_edge(r124, r14, 1).
adjacent(r124, r16).
shared_edge(r124, r16, 2).
adjacent(r125, r126).
shared_edge(r125, r126, 1).
adjacent(r125, r136).
shared_edge(r125, r136, 1).
adjacent(r125, r16).
shared_edge(r125, r16, 2).
adjacent(r127, r128).
shared_edge(r127, r128, 2).
adjacent(r127, r21).
shared_edge(r127, r21, 2).
adjacent(r128, r129).
shared_edge(r128, r129, 4).
adjacent(r128, r137).
shared_edge(r128, r137, 1).
adjacent(r128, r138).
shared_edge(r128, r138, 2).
adjacent(r128, r145).
shared_edge(r128, r145, 11).
adjacent(r128, r21).
shared_edge(r128, r21, 4).
adjacent(r128, r226).
shared_edge(r128, r226, 2).
adjacent(r128, r230).
shared_edge(r128, r230, 2).
adjacent(r129, r21).
shared_edge(r129, r21, 4).
adjacent(r13, r14).
shared_edge(r13, r14, 2).
adjacent(r13, r39).
shared_edge(r13, r39, 1).
adjacent(r130, r21).
shared_edge(r130, r21, 56).
adjacent(r130, r243).
shared_edge(r130, r243, 47).
adjacent(r130, r253).
shared_edge(r130, r253, 4).
adjacent(r130, r331).
shared_edge(r130, r331, 3).
adjacent(r130, r345).
shared_edge(r130, r345, 1).
adjacent(r130, r354).
shared_edge(r130, r354, 1).
adjacent(r130, r364).
shared_edge(r130, r364, 2).
adjacent(r131, r132).
shared_edge(r131, r132, 1).
adjacent(r131, r139).
shared_edge(r131, r139, 3).
adjacent(r131, r154).
shared_edge(r131, r154, 1).
adjacent(r131, r159).
shared_edge(r131, r159, 1).
adjacent(r131, r169).
shared_edge(r131, r169, 1).
adjacent(r131, r177).
shared_edge(r131, r177, 1).
adjacent(r131, r183).
shared_edge(r131, r183, 2).
adjacent(r132, r139).
shared_edge(r132, r139, 1).
adjacent(r133, r140).
shared_edge(r133, r140, 1).
adjacent(r133, r141).
shared_edge(r133, r141, 1).
adjacent(r133, r148).
shared_edge(r133, r148, 1).
adjacent(r135, r14).
shared_edge(r135, r14, 2).
adjacent(r135, r142).
shared_edge(r135, r142, 1).
adjacent(r135, r16).
shared_edge(r135, r16, 1).
adjacent(r136, r143).
shared_edge(r136, r143, 1).
adjacent(r136, r16).
shared_edge(r136, r16, 1).
adjacent(r137, r21).
shared_edge(r137, r21, 8).
adjacent(r137, r89).
shared_edge(r137, r89, 9).
adjacent(r138, r21).
shared_edge(r138, r21, 2).
adjacent(r139, r140).
shared_edge(r139, r140, 1).
adjacent(r139, r147).
shared_edge(r139, r147, 1).
adjacent(r139, r154).
shared_edge(r139, r154, 1).
adjacent(r14, r142).
shared_edge(r14, r142, 2).
adjacent(r14, r15).
shared_edge(r14, r15, 1).
adjacent(r14, r150).
shared_edge(r14, r150, 1).
adjacent(r14, r152).
shared_edge(r14, r152, 1).
adjacent(r14, r155).
shared_edge(r14, r155, 3).
adjacent(r14, r16).
shared_edge(r14, r16, 8).
adjacent(r14, r161).
shared_edge(r14, r161, 2).
adjacent(r14, r163).
shared_edge(r14, r163, 2).
adjacent(r14, r171).
shared_edge(r14, r171, 11).
adjacent(r14, r172).
shared_edge(r14, r172, 2).
adjacent(r14, r173).
shared_edge(r14, r173, 2).
adjacent(r14, r178).
shared_edge(r14, r178, 2).
adjacent(r14, r181).
shared_edge(r14, r181, 1).
adjacent(r14, r185).
shared_edge(r14, r185, 2).
adjacent(r14, r186).
shared_edge(r14, r186, 1).
adjacent(r14, r188).
shared_edge(r14, r188, 16).
adjacent(r14, r201).
shared_edge(r14, r201, 1).
adjacent(r14, r210).
shared_edge(r14, r210, 2).
adjacent(r14, r221).
shared_edge(r14, r221, 5).
adjacent(r14, r31).
shared_edge(r14, r31, 2).
adjacent(r14, r32).
shared_edge(r14, r32, 1).
adjacent(r14, r39).
shared_edge(r14, r39, 5).
adjacent(r14, r40).
shared_edge(r14, r40, 1).
adjacent(r14, r57).
shared_edge(r14, r57, 4).
adjacent(r14, r88).
shared_edge(r14, r88, 1).
adjacent(r14, r98).
shared_edge(r14, r98, 1).
adjacent(r140, r147).
shared_edge(r140, r147, 1).
adjacent(r142, r16).
shared_edge(r142, r16, 1).
adjacent(r143, r144).
shared_edge(r143, r144, 1).
adjacent(r143, r150).
shared_edge(r143, r150, 2).
adjacent(r143, r151).
shared_edge(r143, r151, 1).
adjacent(r143, r16).
shared_edge(r143, r16, 1).
adjacent(r144, r151).
shared_edge(r144, r151, 1).
adjacent(r145, r21).
shared_edge(r145, r21, 13).
adjacent(r146, r60).
shared_edge(r146, r60, 1).
adjacent(r147, r148).
shared_edge(r147, r148, 1).
adjacent(r149, r150).
shared_edge(r149, r150, 1).
adjacent(r149, r16).
shared_edge(r149, r16, 3).
adjacent(r15, r16).
shared_edge(r15, r16, 2).
adjacent(r150, r151).
shared_edge(r150, r151, 1).
adjacent(r150, r16).
shared_edge(r150, r16, 5).
adjacent(r150, r162).
shared_edge(r150, r162, 2).
adjacent(r150, r163).
shared_edge(r150, r163, 1).
adjacent(r150, r173).
shared_edge(r150, r173, 1).
adjacent(r150, r181).
shared_edge(r150, r181, 2).
adjacent(r151, r152).
shared_edge(r151, r152, 1).
adjacent(r152, r153).
shared_edge(r152, r153, 1).
adjacent(r153, r155).
shared_edge(r153, r155, 1).
adjacent(r154, r159).
shared_edge(r154, r159, 1).
adjacent(r156, r157).
shared_edge(r156, r157, 1).
adjacent(r156, r165).
shared_edge(r156, r165, 1).
adjacent(r156, r81).
shared_edge(r156, r81, 2).
adjacent(r157, r166).
shared_edge(r157, r166, 1).
adjacent(r157, r81).
shared_edge(r157, r81, 2).
adjacent(r159, r169).
shared_edge(r159, r169, 1).
adjacent(r16, r161).
shared_edge(r16, r161, 2).
adjacent(r16, r17).
shared_edge(r16, r17, 3).
adjacent(r16, r172).
shared_edge(r16, r172, 2).
adjacent(r16, r178).
shared_edge(r16, r178, 2).
adjacent(r16, r179).
shared_edge(r16, r179, 2).
adjacent(r16, r18).
shared_edge(r16, r18, 3).
adjacent(r16, r180).
shared_edge(r16, r180, 1).
adjacent(r16, r185).
shared_edge(r16, r185, 1).
adjacent(r16, r19).
shared_edge(r16, r19, 1).
adjacent(r16, r20).
shared_edge(r16, r20, 1).
adjacent(r16, r32).
shared_edge(r16, r32, 2).
adjacent(r16, r33).
shared_edge(r16, r33, 2).
adjacent(r16, r40).
shared_edge(r16, r40, 2).
adjacent(r16, r41).
shared_edge(r16, r41, 3).
adjacent(r16, r42).
shared_edge(r16, r42, 1).
adjacent(r16, r49).
shared_edge(r16, r49, 6).
adjacent(r16, r50).
shared_edge(r16, r50, 2).
adjacent(r16, r57).
shared_edge(r16, r57, 2).
adjacent(r16, r67).
shared_edge(r16, r67, 4).
adjacent(r16, r77).
shared_edge(r16, r77, 3).
adjacent(r16, r99).
shared_edge(r16, r99, 4).
adjacent(r160, r171).
shared_edge(r160, r171, 1).
adjacent(r162, r163).
shared_edge(r162, r163, 1).
adjacent(r162, r173).
shared_edge(r162, r173, 1).
adjacent(r164, r94).
shared_edge(r164, r94, 4).
adjacent(r165, r166).
shared_edge(r165, r166, 4).
adjacent(r165, r174).
shared_edge(r165, r174, 2).
adjacent(r165, r196).
shared_edge(r165, r196, 2).
adjacent(r165, r214).
shared_edge(r165, r214, 2).
adjacent(r165, r81).
shared_edge(r165, r81, 5).
adjacent(r166, r167).
shared_edge(r166, r167, 2).
adjacent(r166, r182).
shared_edge(r166, r182, 1).
adjacent(r167, r175).
shared_edge(r167, r175, 1).
adjacent(r167, r182).
shared_edge(r167, r182, 1).
adjacent(r167, r81).
shared_edge(r167, r81, 2).
adjacent(r168, r176).
shared_edge(r168, r176, 2).
adjacent(r168, r60).
shared_edge(r168, r60, 1).
adjacent(r168, r81).
shared_edge(r168, r81, 2).
adjacent(r169, r170).
shared_edge(r169, r170, 1).
adjacent(r169, r177).
shared_edge(r169, r177, 1).
adjacent(r170, r171).
shared_edge(r170, r171, 4).
adjacent(r170, r177).
shared_edge(r170, r177, 1).
adjacent(r170, r184).
shared_edge(r170, r184, 1).
adjacent(r171, r193).
shared_edge(r171, r193, 1).
adjacent(r171, r200).
shared_edge(r171, r200, 5).
adjacent(r171, r201).
shared_edge(r171, r201, 2).
adjacent(r171, r208).
shared_edge(r171, r208, 2).
adjacent(r174, r81).
shared_edge(r174, r81, 4).
adjacent(r175, r81).
shared_edge(r175, r81, 3).
adjacent(r176, r190).
shared_edge(r176, r190, 2).
adjacent(r176, r81).
shared_edge(r176, r81, 1).
adjacent(r177, r184).
shared_edge(r177, r184, 1).
adjacent(r179, r180).
shared_edge(r179, r180, 1).
adjacent(r179, r186).
shared_edge(r179, r186, 1).
adjacent(r180, r181).
shared_edge(r180, r181, 1).
adjacent(r180, r187).
shared_edge(r180, r187, 1).
adjacent(r181, r188).
shared_edge(r181, r188, 1).
adjacent(r181, r189).
shared_edge(r181, r189, 1).
adjacent(r182, r81).
shared_edge(r182, r81, 2).
adjacent(r183, r184).
shared_edge(r183, r184, 1).
adjacent(r183, r192).
shared_edge(r183, r192, 1).
adjacent(r184, r193).
shared_edge(r184, r193, 1).
adjacent(r185, r186).
shared_edge(r185, r186, 1).
adjacent(r186, r187).
shared_edge(r186, r187, 1).
adjacent(r187, r188).
shared_edge(r187, r188, 2).
adjacent(r188, r189).
shared_edge(r188, r189, 3).
adjacent(r19, r20).
shared_edge(r19, r20, 1).
adjacent(r19, r33).
shared_edge(r19, r33, 1).
adjacent(r190, r191).
shared_edge(r190, r191, 9).
adjacent(r190, r81).
shared_edge(r190, r81, 9).
adjacent(r191, r204).
shared_edge(r191, r204, 2).
adjacent(r191, r215).
shared_edge(r191, r215, 4).
adjacent(r191, r227).
shared_edge(r191, r227, 2).
adjacent(r191, r228).
shared_edge(r191, r228, 1).
adjacent(r191, r231).
shared_edge(r191, r231, 2).
adjacent(r191, r239).
shared_edge(r191, r239, 4).
adjacent(r191, r240).
shared_edge(r191, r240, 6).
adjacent(r191, r245).
shared_edge(r191, r245, 3).
adjacent(r191, r81).
shared_edge(r191, r81, 1).
adjacent(r192, r193).
shared_edge(r192, r193, 1).
adjacent(r192, r199).
shared_edge(r192, r199, 1).
adjacent(r193, r200).
shared_edge(r193, r200, 1).
adjacent(r196, r81).
shared_edge(r196, r81, 2).
adjacent(r197, r81).
shared_edge(r197, r81, 4).
adjacent(r198, r199).
shared_edge(r198, r199, 1).
adjacent(r198, r206).
shared_edge(r198, r206, 1).
adjacent(r199, r200).
shared_edge(r199, r200, 1).
adjacent(r199, r207).
shared_edge(r199, r207, 1).
adjacent(r20, r21).
shared_edge(r20, r21, 18).
adjacent(r20, r33).
shared_edge(r20, r33, 1).
adjacent(r20, r42).
shared_edge(r20, r42, 2).
adjacent(r20, r50).
shared_edge(r20, r50, 1).
adjacent(r20, r67).
shared_edge(r20, r67, 4).
adjacent(r20, r89).
shared_edge(r20, r89, 17).
adjacent(r200, r207).
shared_edge(r200, r207, 6).
adjacent(r200, r219).
shared_edge(r200, r219, 1).
adjacent(r201, r209).
shared_edge(r201, r209, 1).
adjacent(r204, r205).
shared_edge(r204, r205, 1).
adjacent(r204, r216).
shared_edge(r204, r216, 1).
adjacent(r205, r206).
shared_edge(r205, r206, 1).
adjacent(r205, r217).
shared_edge(r205, r217, 1).
adjacent(r206, r207).
shared_edge(r206, r207, 1).
adjacent(r206, r218).
shared_edge(r206, r218, 1).
adjacent(r207, r218).
shared_edge(r207, r218, 5).
adjacent(r207, r219).
shared_edge(r207, r219, 1).
adjacent(r207, r223).
shared_edge(r207, r223, 2).
adjacent(r207, r224).
shared_edge(r207, r224, 1).
adjacent(r207, r225).
shared_edge(r207, r225, 4).
adjacent(r207, r228).
shared_edge(r207, r228, 1).
adjacent(r207, r229).
shared_edge(r207, r229, 5).
adjacent(r207, r231).
shared_edge(r207, r231, 1).
adjacent(r207, r232).
shared_edge(r207, r232, 1).
adjacent(r207, r233).
shared_edge(r207, r233, 1).
adjacent(r207, r234).
shared_edge(r207, r234, 2).
adjacent(r207, r235).
shared_edge(r207, r235, 3).
adjacent(r207, r241).
shared_edge(r207, r241, 1).
adjacent(r207, r242).
shared_edge(r207, r242, 1).
adjacent(r207, r246).
shared_edge(r207, r246, 2).
adjacent(r207, r247).
shared_edge(r207, r247, 1).
adjacent(r207, r248).
shared_edge(r207, r248, 2).
adjacent(r207, r249).
shared_edge(r207, r249, 2).
adjacent(r207, r259).
shared_edge(r207, r259, 1).
adjacent(r207, r260).
shared_edge(r207, r260, 1).
adjacent(r208, r209).
shared_edge(r208, r209, 1).
adjacent(r208, r219).
shared_edge(r208, r219, 1).
adjacent(r209, r210).
shared_edge(r209, r210, 1).
adjacent(r209, r219).
shared_edge(r209, r219, 1).
adjacent(r21, r22).
shared_edge(r21, r22, 2).
adjacent(r21, r226).
shared_edge(r21, r226, 2).
adjacent(r21, r230).
shared_edge(r21, r230, 8).
adjacent(r21, r236).
shared_edge(r21, r236, 17).
adjacent(r21, r237).
shared_edge(r21, r237, 4).
adjacent(r21, r25).
shared_edge(r21, r25, 18).
adjacent(r21, r26).
shared_edge(r21, r26, 1).
adjacent(r21, r27).
shared_edge(r21, r27, 19).
adjacent(r21, r274).
shared_edge(r21, r274, 1).
adjacent(r21, r287).
shared_edge(r21, r287, 1).
adjacent(r21, r300).
shared_edge(r21, r300, 2).
adjacent(r21, r34).
shared_edge(r21, r34, 2).
adjacent(r21, r35).
shared_edge(r21, r35, 5).
adjacent(r21, r43).
shared_edge(r21, r43, 2).
adjacent(r21, r44).
shared_edge(r21, r44, 1).
adjacent(r21, r45).
shared_edge(r21, r45, 2).
adjacent(r21, r51).
shared_edge(r21, r51, 2).
adjacent(r21, r52).
shared_edge(r21, r52, 2).
adjacent(r21, r58).
shared_edge(r21, r58, 3).
adjacent(r21, r68).
shared_edge(r21, r68, 2).
adjacent(r21, r69).
shared_edge(r21, r69, 1).
adjacent(r21, r72).
shared_edge(r21, r72, 2).
adjacent(r21, r78).
shared_edge(r21, r78, 2).
adjacent(r21, r79).
shared_edge(r21, r79, 1).
adjacent(r21, r90).
shared_edge(r21, r90, 2).
adjacent(r210, r220).
shared_edge(r210, r220, 1).
adjacent(r214, r81).
shared_edge(r214, r81, 2).
adjacent(r215, r216).
shared_edge(r215, r216, 2).
adjacent(r216, r217).
shared_edge(r216, r217, 1).
adjacent(r216, r222).
shared_edge(r216, r222, 1).
adjacent(r216, r227).
shared_edge(r216, r227, 1).
adjacent(r217, r218).
shared_edge(r217, r218, 1).
adjacent(r217, r222).
shared_edge(r217, r222, 1).
adjacent(r218, r222).
shared_edge(r218, r222, 1).
adjacent(r219, r220).
shared_edge(r219, r220, 1).
adjacent(r219, r223).
shared_edge(r219, r223, 1).
adjacent(r22, r23).
shared_edge(r22, r23, 1).
adjacent(r220, r221).
shared_edge(r220, r221, 1).
adjacent(r220, r224).
shared_edge(r220, r224, 1).
adjacent(r221, r225).
shared_edge(r221, r225, 4).
adjacent(r222, r228).
shared_edge(r222, r228, 1).
adjacent(r223, r224).
shared_edge(r223, r224, 1).
adjacent(r224, r225).
shared_edge(r224, r225, 1).
adjacent(r227, r228).
shared_edge(r227, r228, 1).
adjacent(r229, r230).
shared_edge(r229, r230, 4).
adjacent(r229, r236).
shared_edge(r229, r236, 37).
adjacent(r229, r237).
shared_edge(r229, r237, 6).
adjacent(r229, r250).
shared_edge(r229, r250, 1).
adjacent(r229, r251).
shared_edge(r229, r251, 1).
adjacent(r23, r24).
shared_edge(r23, r24, 2).
adjacent(r23, r34).
shared_edge(r23, r34, 2).
adjacent(r23, r43).
shared_edge(r23, r43, 1).
adjacent(r231, r232).
shared_edge(r231, r232, 2).
adjacent(r231, r240).
shared_edge(r231, r240, 5).
adjacent(r232, r233).
shared_edge(r232, r233, 1).
adjacent(r233, r234).
shared_edge(r233, r234, 1).
adjacent(r233, r240).
shared_edge(r233, r240, 1).
adjacent(r234, r241).
shared_edge(r234, r241, 1).
adjacent(r235, r242).
shared_edge(r235, r242, 1).
adjacent(r236, r252).
shared_edge(r236, r252, 2).
adjacent(r236, r253).
shared_edge(r236, r253, 20).
adjacent(r236, r264).
shared_edge(r236, r264, 1).
adjacent(r236, r265).
shared_edge(r236, r265, 6).
adjacent(r236, r273).
shared_edge(r236, r273, 1).
adjacent(r236, r274).
shared_edge(r236, r274, 2).
adjacent(r236, r284).
shared_edge(r236, r284, 1).
adjacent(r236, r285).
shared_edge(r236, r285, 1).
adjacent(r236, r286).
shared_edge(r236, r286, 1).
adjacent(r236, r287).
shared_edge(r236, r287, 1).
adjacent(r238, r81).
shared_edge(r238, r81, 6).
adjacent(r239, r256).
shared_edge(r239, r256, 1).
adjacent(r239, r81).
shared_edge(r239, r81, 7).
adjacent(r24, r25).
shared_edge(r24, r25, 2).
adjacent(r24, r44).
shared_edge(r24, r44, 1).
adjacent(r240, r241).
shared_edge(r240, r241, 3).
adjacent(r240, r242).
shared_edge(r240, r242, 1).
adjacent(r240, r245).
shared_edge(r240, r245, 1).
adjacent(r240, r246).
shared_edge(r240, r246, 2).
adjacent(r240, r247).
shared_edge(r240, r247, 1).
adjacent(r240, r256).
shared_edge(r240, r256, 2).
adjacent(r240, r257).
shared_edge(r240, r257, 8).
adjacent(r240, r258).
shared_edge(r240, r258, 2).
adjacent(r240, r267).
shared_edge(r240, r267, 4).
adjacent(r240, r268).
shared_edge(r240, r268, 2).
adjacent(r240, r269).
shared_edge(r240, r269, 2).
adjacent(r240, r277).
shared_edge(r240, r277, 2).
adjacent(r240, r278).
shared_edge(r240, r278, 2).
adjacent(r240, r279).
shared_edge(r240, r279, 3).
adjacent(r240, r292).
shared_edge(r240, r292, 3).
adjacent(r240, r293).
shared_edge(r240, r293, 4).
adjacent(r240, r304).
shared_edge(r240, r304, 1).
adjacent(r240, r305).
shared_edge(r240, r305, 1).
adjacent(r240, r81).
shared_edge(r240, r81, 2).
adjacent(r241, r242).
shared_edge(r241, r242, 1).
adjacent(r243, r332).
shared_edge(r243, r332, 20).
adjacent(r243, r372).
shared_edge(r243, r372, 1).
adjacent(r247, r248).
shared_edge(r247, r248, 1).
adjacent(r247, r258).
shared_edge(r247, r258, 1).
adjacent(r248, r258).
shared_edge(r248, r258, 2).
adjacent(r248, r259).
shared_edge(r248, r259, 1).
adjacent(r248, r270).
shared_edge(r248, r270, 1).
adjacent(r248, r281).
shared_edge(r248, r281, 1).
adjacent(r249, r250).
shared_edge(r249, r250, 1).
adjacent(r249, r261).
shared_edge(r249, r261, 1).
adjacent(r25, r26).
shared_edge(r25, r26, 2).
adjacent(r25, r35).
shared_edge(r25, r35, 5).
adjacent(r25, r44).
shared_edge(r25, r44, 1).
adjacent(r25, r45).
shared_edge(r25, r45, 12).
adjacent(r25, r52).
shared_edge(r25, r52, 2).
adjacent(r25, r71).
shared_edge(r25, r71, 6).
adjacent(r25, r72).
shared_edge(r25, r72, 2).
adjacent(r25, r93).
shared_edge(r25, r93, 3).
adjacent(r250, r251).
shared_edge(r250, r251, 1).
adjacent(r250, r262).
shared_edge(r250, r262, 1).
adjacent(r251, r252).
shared_edge(r251, r252, 1).
adjacent(r251, r263).
shared_edge(r251, r263, 1).
adjacent(r252, r264).
shared_edge(r252, r264, 1).
adjacent(r253, r262).
shared_edge(r253, r262, 2).
adjacent(r253, r273).
shared_edge(r253, r273, 2).
adjacent(r253, r284).
shared_edge(r253, r284, 1).
adjacent(r253, r285).
shared_edge(r253, r285, 5).
adjacent(r253, r286).
shared_edge(r253, r286, 3).
adjacent(r253, r297).
shared_edge(r253, r297, 2).
adjacent(r253, r298).
shared_edge(r253, r298, 3).
adjacent(r253, r299).
shared_edge(r253, r299, 2).
adjacent(r253, r300).
shared_edge(r253, r300, 1).
adjacent(r253, r308).
shared_edge(r253, r308, 4).
adjacent(r253, r314).
shared_edge(r253, r314, 1).
adjacent(r253, r315).
shared_edge(r253, r315, 1).
adjacent(r253, r316).
shared_edge(r253, r316, 2).
adjacent(r253, r317).
shared_edge(r253, r317, 5).
adjacent(r253, r325).
shared_edge(r253, r325, 1).
adjacent(r253, r326).
shared_edge(r253, r326, 1).
adjacent(r253, r328).
shared_edge(r253, r328, 5).
adjacent(r253, r329).
shared_edge(r253, r329, 2).
adjacent(r253, r330).
shared_edge(r253, r330, 1).
adjacent(r253, r331).
shared_edge(r253, r331, 2).
adjacent(r254, r266).
shared_edge(r254, r266, 3).
adjacent(r255, r276).
shared_edge(r255, r276, 4).
adjacent(r255, r81).
shared_edge(r255, r81, 10).
adjacent(r256, r81).
shared_edge(r256, r81, 3).
adjacent(r257, r268).
shared_edge(r257, r268, 2).
adjacent(r258, r280).
shared_edge(r258, r280, 1).
adjacent(r259, r260).
shared_edge(r259, r260, 1).
adjacent(r259, r270).
shared_edge(r259, r270, 1).
adjacent(r260, r261).
shared_edge(r260, r261, 1).
adjacent(r260, r271).
shared_edge(r260, r271, 1).
adjacent(r261, r262).
shared_edge(r261, r262, 2).
adjacent(r262, r263).
shared_edge(r262, r263, 2).
adjacent(r262, r271).
shared_edge(r262, r271, 1).
adjacent(r262, r272).
shared_edge(r262, r272, 2).
adjacent(r262, r283).
shared_edge(r262, r283, 8).
adjacent(r262, r297).
shared_edge(r262, r297, 1).
adjacent(r262, r314).
shared_edge(r262, r314, 1).
adjacent(r263, r264).
shared_edge(r263, r264, 1).
adjacent(r264, r272).
shared_edge(r264, r272, 1).
adjacent(r266, r275).
shared_edge(r266, r275, 4).
adjacent(r266, r301).
shared_edge(r266, r301, 6).
adjacent(r266, r302).
shared_edge(r266, r302, 5).
adjacent(r266, r348).
shared_edge(r266, r348, 2).
adjacent(r266, r355).
shared_edge(r266, r355, 2).
adjacent(r266, r356).
shared_edge(r266, r356, 2).
adjacent(r266, r365).
shared_edge(r266, r365, 2).
adjacent(r268, r269).
shared_edge(r268, r269, 1).
adjacent(r268, r278).
shared_edge(r268, r278, 1).
adjacent(r269, r279).
shared_edge(r269, r279, 1).
adjacent(r27, r28).
shared_edge(r27, r28, 9).
adjacent(r270, r271).
shared_edge(r270, r271, 1).
adjacent(r270, r281).
shared_edge(r270, r281, 1).
adjacent(r271, r282).
shared_edge(r271, r282, 1).
adjacent(r272, r273).
shared_edge(r272, r273, 1).
adjacent(r274, r287).
shared_edge(r274, r287, 1).
adjacent(r276, r289).
shared_edge(r276, r289, 1).
adjacent(r276, r290).
shared_edge(r276, r290, 3).
adjacent(r276, r81).
shared_edge(r276, r81, 2).
adjacent(r277, r81).
shared_edge(r277, r81, 2).
adjacent(r278, r279).
shared_edge(r278, r279, 1).
adjacent(r279, r280).
shared_edge(r279, r280, 1).
adjacent(r279, r294).
shared_edge(r279, r294, 1).
adjacent(r279, r306).
shared_edge(r279, r306, 1).
adjacent(r280, r281).
shared_edge(r280, r281, 1).
adjacent(r280, r294).
shared_edge(r280, r294, 1).
adjacent(r281, r282).
shared_edge(r281, r282, 1).
adjacent(r281, r295).
shared_edge(r281, r295, 1).
adjacent(r281, r296).
shared_edge(r281, r296, 1).
adjacent(r282, r283).
shared_edge(r282, r283, 2).
adjacent(r283, r296).
shared_edge(r283, r296, 1).
adjacent(r283, r307).
shared_edge(r283, r307, 9).
adjacent(r283, r322).
shared_edge(r283, r322, 1).
adjacent(r283, r333).
shared_edge(r283, r333, 15).
adjacent(r283, r334).
shared_edge(r283, r334, 12).
adjacent(r283, r340).
shared_edge(r283, r340, 1).
adjacent(r283, r351).
shared_edge(r283, r351, 6).
adjacent(r283, r360).
shared_edge(r283, r360, 5).
adjacent(r284, r285).
shared_edge(r284, r285, 2).
adjacent(r286, r287).
shared_edge(r286, r287, 1).
adjacent(r286, r299).
shared_edge(r286, r299, 1).
adjacent(r287, r299).
shared_edge(r287, r299, 2).
adjacent(r288, r346).
shared_edge(r288, r346, 3).
adjacent(r289, r290).
shared_edge(r289, r290, 2).
adjacent(r289, r303).
shared_edge(r289, r303, 2).
adjacent(r289, r318).
shared_edge(r289, r318, 1).
adjacent(r289, r81).
shared_edge(r289, r81, 6).
adjacent(r29, r5).
shared_edge(r29, r5, 6).
adjacent(r290, r291).
shared_edge(r290, r291, 2).
adjacent(r290, r303).
shared_edge(r290, r303, 2).
adjacent(r290, r310).
shared_edge(r290, r310, 2).
adjacent(r290, r318).
shared_edge(r290, r318, 1).
adjacent(r290, r319).
shared_edge(r290, r319, 1).
adjacent(r290, r81).
shared_edge(r290, r81, 5).
adjacent(r291, r81).
shared_edge(r291, r81, 2).
adjacent(r292, r293).
shared_edge(r292, r293, 1).
adjacent(r292, r81).
shared_edge(r292, r81, 4).
adjacent(r293, r81).
shared_edge(r293, r81, 3).
adjacent(r294, r295).
shared_edge(r294, r295, 2).
adjacent(r294, r306).
shared_edge(r294, r306, 1).
adjacent(r294, r307).
shared_edge(r294, r307, 3).
adjacent(r294, r313).
shared_edge(r294, r313, 2).
adjacent(r295, r296).
shared_edge(r295, r296, 1).
adjacent(r296, r307).
shared_edge(r296, r307, 1).
adjacent(r297, r298).
shared_edge(r297, r298, 1).
adjacent(r299, r300).
shared_edge(r299, r300, 1).
adjacent(r3, r4).
shared_edge(r3, r4, 7).
adjacent(r3, r47).
shared_edge(r3, r47, 2).
adjacent(r3, r5).
shared_edge(r3, r5, 11).
adjacent(r3, r53).
shared_edge(r3, r53, 4).
adjacent(r3, r73).
shared_edge(r3, r73, 8).
adjacent(r3, r74).
shared_edge(r3, r74, 4).
adjacent(r3, r80).
shared_edge(r3, r80, 2).
adjacent(r30, r37).
shared_edge(r30, r37, 1).
adjacent(r30, r6).
shared_edge(r30, r6, 1).
adjacent(r30, r8).
shared_edge(r30, r8, 1).
adjacent(r30, r9).
shared_edge(r30, r9, 1).
adjacent(r301, r347).
shared_edge(r301, r347, 2).
adjacent(r304, r305).
shared_edge(r304, r305, 1).
adjacent(r304, r81).
shared_edge(r304, r81, 2).
adjacent(r305, r306).
shared_edge(r305, r306, 1).
adjacent(r305, r81).
shared_edge(r305, r81, 1).
adjacent(r306, r312).
shared_edge(r306, r312, 1).
adjacent(r307, r313).
shared_edge(r307, r313, 1).
adjacent(r307, r81).
shared_edge(r307, r81, 4).
adjacent(r309, r346).
shared_edge(r309, r346, 1).
adjacent(r31, r32).
shared_edge(r31, r32, 1).
adjacent(r31, r40).
shared_edge(r31, r40, 1).
adjacent(r310, r81).
shared_edge(r310, r81, 2).
adjacent(r311, r320).
shared_edge(r311, r320, 2).
adjacent(r311, r81).
shared_edge(r311, r81, 6).
adjacent(r312, r313).
shared_edge(r312, r313, 1).
adjacent(r312, r81).
shared_edge(r312, r81, 2).
adjacent(r314, r315).
shared_edge(r314, r315, 1).
adjacent(r314, r322).
shared_edge(r314, r322, 1).
adjacent(r315, r316).
shared_edge(r315, r316, 1).
adjacent(r315, r323).
shared_edge(r315, r323, 1).
adjacent(r316, r324).
shared_edge(r316, r324, 1).
adjacent(r317, r327).
shared_edge(r317, r327, 3).
adjacent(r318, r319).
shared_edge(r318, r319, 1).
adjacent(r318, r81).
shared_edge(r318, r81, 1).
adjacent(r319, r81).
shared_edge(r319, r81, 2).
adjacent(r320, r321).
shared_edge(r320, r321, 2).
adjacent(r321, r339).
shared_edge(r321, r339, 4).
adjacent(r321, r81).
shared_edge(r321, r81, 19).
adjacent(r322, r323).
shared_edge(r322, r323, 1).
adjacent(r322, r334).
shared_edge(r322, r334, 1).
adjacent(r323, r324).
shared_edge(r323, r324, 1).
adjacent(r323, r334).
shared_edge(r323, r334, 1).
adjacent(r324, r325).
shared_edge(r324, r325, 1).
adjacent(r324, r335).
shared_edge(r324, r335, 1).
adjacent(r325, r326).
shared_edge(r325, r326, 1).
adjacent(r325, r334).
shared_edge(r325, r334, 1).
adjacent(r326, r327).
shared_edge(r326, r327, 1).
adjacent(r326, r334).
shared_edge(r326, r334, 1).
adjacent(r327, r328).
shared_edge(r327, r328, 2).
adjacent(r327, r336).
shared_edge(r327, r336, 3).
adjacent(r327, r343).
shared_edge(r327, r343, 1).
adjacent(r328, r337).
shared_edge(r328, r337, 2).
adjacent(r328, r343).
shared_edge(r328, r343, 1).
adjacent(r328, r344).
shared_edge(r328, r344, 4).
adjacent(r328, r345).
shared_edge(r328, r345, 1).
adjacent(r328, r353).
shared_edge(r328, r353, 2).
adjacent(r328, r354).
shared_edge(r328, r354, 1).
adjacent(r328, r362).
shared_edge(r328, r362, 1).
adjacent(r328, r363).
shared_edge(r328, r363, 4).
adjacent(r328, r371).
shared_edge(r328, r371, 1).
adjacent(r329, r330).
shared_edge(r329, r330, 1).
adjacent(r329, r337).
shared_edge(r329, r337, 1).
adjacent(r330, r331).
shared_edge(r330, r331, 1).
adjacent(r330, r337).
shared_edge(r330, r337, 1).
adjacent(r331, r338).
shared_edge(r331, r338, 2).
adjacent(r334, r335).
shared_edge(r334, r335, 3).
adjacent(r334, r336).
shared_edge(r334, r336, 1).
adjacent(r334, r341).
shared_edge(r334, r341, 4).
adjacent(r334, r342).
shared_edge(r334, r342, 3).
adjacent(r334, r361).
shared_edge(r334, r361, 2).
adjacent(r336, r342).
shared_edge(r336, r342, 1).
adjacent(r336, r343).
shared_edge(r336, r343, 1).
adjacent(r337, r338).
shared_edge(r337, r338, 1).
adjacent(r337, r345).
shared_edge(r337, r345, 1).
adjacent(r338, r345).
shared_edge(r338, r345, 1).
adjacent(r339, r81).
shared_edge(r339, r81, 2).
adjacent(r340, r351).
shared_edge(r340, r351, 1).
adjacent(r340, r81).
shared_edge(r340, r81, 2).
adjacent(r342, r343).
shared_edge(r342, r343, 2).
adjacent(r343, r352).
shared_edge(r343, r352, 2).
adjacent(r343, r361).
shared_edge(r343, r361, 1).
adjacent(r345, r354).
shared_edge(r345, r354, 2).
adjacent(r346, r347).
shared_edge(r346, r347, 5).
adjacent(r347, r355).
shared_edge(r347, r355, 3).
adjacent(r347, r356).
shared_edge(r347, r356, 1).
adjacent(r347, r365).
shared_edge(r347, r365, 1).
adjacent(r350, r351).
shared_edge(r350, r351, 1).
adjacent(r350, r81).
shared_edge(r350, r81, 3).
adjacent(r351, r359).
shared_edge(r351, r359, 2).
adjacent(r351, r370).
shared_edge(r351, r370, 2).
adjacent(r351, r81).
shared_edge(r351, r81, 1).
adjacent(r352, r353).
shared_edge(r352, r353, 1).
adjacent(r352, r362).
shared_edge(r352, r362, 1).
adjacent(r353, r362).
shared_edge(r353, r362, 1).
adjacent(r354, r363).
shared_edge(r354, r363, 1).
adjacent(r354, r364).
shared_edge(r354, r364, 1).
adjacent(r355, r356).
shared_edge(r355, r356, 1).
adjacent(r357, r367).
shared_edge(r357, r367, 1).
adjacent(r358, r81).
shared_edge(r358, r81, 4).
adjacent(r359, r81).
shared_edge(r359, r81, 2).
adjacent(r361, r362).
shared_edge(r361, r362, 3).
adjacent(r362, r371).
shared_edge(r362, r371, 1).
adjacent(r363, r364).
shared_edge(r363, r364, 1).
adjacent(r363, r372).
shared_edge(r363, r372, 4).
adjacent(r364, r372).
shared_edge(r364, r372, 2).
adjacent(r365, r366).
shared_edge(r365, r366, 1).
adjacent(r366, r367).
shared_edge(r366, r367, 1).
adjacent(r367, r368).
shared_edge(r367, r368, 1).
adjacent(r369, r81).
shared_edge(r369, r81, 3).
adjacent(r37, r6).
shared_edge(r37, r6, 1).
adjacent(r37, r9).
shared_edge(r37, r9, 2).
adjacent(r370, r81).
shared_edge(r370, r81, 1).
adjacent(r371, r372).
shared_edge(r371, r372, 1).
adjacent(r38, r65).
shared_edge(r38, r65, 1).
adjacent(r38, r75).
shared_edge(r38, r75, 1).
adjacent(r38, r76).
shared_edge(r38, r76, 2).
adjacent(r38, r83).
shared_edge(r38, r83, 1).
adjacent(r38, r84).
shared_edge(r38, r84, 2).
adjacent(r38, r85).
shared_edge(r38, r85, 3).
adjacent(r38, r9).
shared_edge(r38, r9, 12).
adjacent(r38, r96).
shared_edge(r38, r96, 2).
adjacent(r39, r66).
shared_edge(r39, r66, 2).
adjacent(r39, r88).
shared_edge(r39, r88, 1).
adjacent(r41, r49).
shared_edge(r41, r49, 1).
adjacent(r42, r50).
shared_edge(r42, r50, 1).
adjacent(r43, r44).
shared_edge(r43, r44, 1).
adjacent(r44, r45).
shared_edge(r44, r45, 1).
adjacent(r44, r51).
shared_edge(r44, r51, 1).
adjacent(r45, r51).
shared_edge(r45, r51, 1).
adjacent(r45, r58).
shared_edge(r45, r58, 3).
adjacent(r45, r59).
shared_edge(r45, r59, 3).
adjacent(r45, r68).
shared_edge(r45, r68, 1).
adjacent(r45, r70).
shared_edge(r45, r70, 3).
adjacent(r46, r47).
shared_edge(r46, r47, 2).
adjacent(r46, r5).
shared_edge(r46, r5, 2).
adjacent(r47, r48).
shared_edge(r47, r48, 6).
adjacent(r47, r5).
shared_edge(r47, r5, 3).
adjacent(r47, r54).
shared_edge(r47, r54, 2).
adjacent(r47, r60).
shared_edge(r47, r60, 6).
adjacent(r47, r81).
shared_edge(r47, r81, 11).
adjacent(r48, r5).
shared_edge(r48, r5, 6).
adjacent(r49, r77).
shared_edge(r49, r77, 1).
adjacent(r5, r54).
shared_edge(r5, r54, 2).
adjacent(r5, r6).
shared_edge(r5, r6, 8).
adjacent(r5, r60).
shared_edge(r5, r60, 1).
adjacent(r55, r56).
shared_edge(r55, r56, 1).
adjacent(r55, r6).
shared_edge(r55, r6, 2).
adjacent(r55, r62).
shared_edge(r55, r62, 1).
adjacent(r56, r63).
shared_edge(r56, r63, 1).
adjacent(r56, r9).
shared_edge(r56, r9, 2).
adjacent(r59, r69).
shared_edge(r59, r69, 1).
adjacent(r6, r61).
shared_edge(r6, r61, 1).
adjacent(r6, r7).
shared_edge(r6, r7, 3).
adjacent(r6, r8).
shared_edge(r6, r8, 1).
adjacent(r6, r9).
shared_edge(r6, r9, 1).
adjacent(r60, r61).
shared_edge(r60, r61, 1).
adjacent(r60, r62).
shared_edge(r60, r62, 1).
adjacent(r60, r81).
shared_edge(r60, r81, 4).
adjacent(r60, r82).
shared_edge(r60, r82, 3).
adjacent(r61, r62).
shared_edge(r61, r62, 2).
adjacent(r62, r63).
shared_edge(r62, r63, 4).
adjacent(r62, r82).
shared_edge(r62, r82, 3).
adjacent(r63, r64).
shared_edge(r63, r64, 2).
adjacent(r63, r75).
shared_edge(r63, r75, 2).
adjacent(r63, r83).
shared_edge(r63, r83, 3).
adjacent(r63, r9).
shared_edge(r63, r9, 1).
adjacent(r63, r95).
shared_edge(r63, r95, 3).
adjacent(r64, r9).
shared_edge(r64, r9, 2).
adjacent(r65, r66).
shared_edge(r65, r66, 2).
adjacent(r65, r76).
shared_edge(r65, r76, 1).
adjacent(r65, r86).
shared_edge(r65, r86, 1).
adjacent(r65, r87).
shared_edge(r65, r87, 1).
adjacent(r65, r97).
shared_edge(r65, r97, 1).
adjacent(r66, r87).
shared_edge(r66, r87, 1).
adjacent(r68, r69).
shared_edge(r68, r69, 1).
adjacent(r69, r70).
shared_edge(r69, r70, 1).
adjacent(r70, r71).
shared_edge(r70, r71, 3).
adjacent(r70, r78).
shared_edge(r70, r78, 1).
adjacent(r70, r79).
shared_edge(r70, r79, 2).
adjacent(r70, r90).
shared_edge(r70, r90, 1).
adjacent(r70, r91).
shared_edge(r70, r91, 1).
adjacent(r71, r92).
shared_edge(r71, r92, 3).
adjacent(r75, r9).
shared_edge(r75, r9, 1).
adjacent(r76, r86).
shared_edge(r76, r86, 1).
adjacent(r78, r79).
shared_edge(r78, r79, 1).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r80, r81).
shared_edge(r80, r81, 2).
adjacent(r83, r84).
shared_edge(r83, r84, 2).
adjacent(r83, r96).
shared_edge(r83, r96, 2).
adjacent(r85, r86).
shared_edge(r85, r86, 2).
adjacent(r86, r97).
shared_edge(r86, r97, 1).
adjacent(r87, r88).
shared_edge(r87, r88, 1).
adjacent(r87, r98).
shared_edge(r87, r98, 1).
adjacent(r88, r98).
shared_edge(r88, r98, 1).
adjacent(r90, r91).
shared_edge(r90, r91, 1).
adjacent(r91, r92).
shared_edge(r91, r92, 1).
adjacent(r92, r93).
shared_edge(r92, r93, 3).
adjacent(r97, r98).
shared_edge(r97, r98, 1).
