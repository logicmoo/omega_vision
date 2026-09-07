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

region(r1, '#2e2017', 29, centroid(2,3)).
polygon(r1, [xy(0,0),xy(0,6),xy(1,6),xy(3,4),xy(2,3),xy(3,2),xy(3,1),xy(2,0),xy(1,0),xy(0,0)]).
midline(r1, [xy(1,1),xy(1,5),xy(2,4),xy(2,1)]).
fillpoint(r1, xy(2,4), 2).
fillpoint(r1, xy(2,2), 2).
fillpoint(r1, xy(2,1), 2).
fillpoint(r1, xy(1,5), 2).
fillpoint(r1, xy(1,4), 2).
region(r2, '#3d261a', 20, centroid(7,3)).
polygon(r2, [xy(3,0),xy(4,0),xy(4,1),xy(5,0),xy(6,1),xy(5,2),xy(6,3),xy(7,2),xy(8,3),xy(7,4),xy(8,5),xy(9,4),xy(10,5),xy(9,6),xy(10,6),xy(3,0)]).
midline(r2, [xy(5,1),xy(9,5)]).
fillpoint(r2, xy(9,5), 2).
fillpoint(r2, xy(8,4), 2).
fillpoint(r2, xy(7,3), 2).
fillpoint(r2, xy(6,2), 2).
fillpoint(r2, xy(5,1), 2).
region(r3, '#563b2c', 42, centroid(14,6)).
polygon(r3, [xy(6,0),xy(7,0),xy(7,1),xy(8,0),xy(9,0),xy(9,1),xy(8,2),xy(9,3),xy(10,2),xy(11,3),xy(10,4),xy(11,4),xy(11,6),xy(12,5),xy(12,6),xy(13,6),xy(13,7),xy(15,7),xy(15,8),xy(16,7),xy(16,8),xy(17,8),xy(17,9),xy(18,8),xy(19,8),xy(21,10),xy(20,11),xy(19,11),xy(18,10),xy(6,0)]).
midline(r3, [xy(8,1),xy(10,3)]).
midline(r3, [xy(18,9),xy(19,9),xy(19,10),xy(20,10),xy(21,11)]).
fillpoint(r3, xy(21,11), 2).
fillpoint(r3, xy(20,10), 2).
fillpoint(r3, xy(19,10), 2).
fillpoint(r3, xy(19,9), 2).
fillpoint(r3, xy(18,9), 2).
region(r4, '#6f4323', 13, centroid(12,3)).
polygon(r4, [xy(10,0),xy(10,1),xy(11,0),xy(11,2),xy(12,2),xy(12,4),xy(13,4),xy(13,5),xy(14,5),xy(14,6),xy(15,6),xy(10,0)]).
fillpoint(r4, xy(15,6), 1).
fillpoint(r4, xy(14,6), 1).
fillpoint(r4, xy(14,5), 1).
fillpoint(r4, xy(13,5), 1).
fillpoint(r4, xy(13,4), 1).
region(r6, '#835a46', 9, centroid(14,1)).
polygon(r6, [xy(13,0),xy(13,1),xy(14,0),xy(14,2),xy(15,2),xy(15,3),xy(13,0)]).
fillpoint(r6, xy(16,0), 1).
fillpoint(r6, xy(15,3), 1).
fillpoint(r6, xy(15,2), 1).
fillpoint(r6, xy(15,0), 1).
fillpoint(r6, xy(14,2), 1).
region(r9, '#3d261a', 54, centroid(25,3)).
polygon(r9, [xy(19,0),xy(19,2),xy(20,2),xy(22,4),xy(24,4),xy(25,3),xy(25,2),xy(23,0),xy(20,0),xy(19,0)]).
midline(r9, [xy(20,1),xy(22,2),xy(23,2)]).
midline(r9, [xy(27,3),xy(28,3)]).
midline(r9, [xy(28,7),xy(29,6)]).
fillpoint(r9, xy(23,2), 3).
fillpoint(r9, xy(22,2), 3).
fillpoint(r9, xy(29,6), 2).
fillpoint(r9, xy(28,7), 2).
fillpoint(r9, xy(28,3), 2).
region(r11, '#2a170b', 7, centroid(28,0)).
polygon(r11, [xy(25,0),xy(31,0),xy(25,0)]).
fillpoint(r11, xy(31,0), 1).
fillpoint(r11, xy(30,0), 1).
fillpoint(r11, xy(29,0), 1).
fillpoint(r11, xy(28,0), 1).
fillpoint(r11, xy(27,0), 1).
region(r14, '#563b2c', 5, centroid(36,0)).
polygon(r14, [xy(34,0),xy(38,0),xy(34,0)]).
fillpoint(r14, xy(38,0), 1).
fillpoint(r14, xy(37,0), 1).
fillpoint(r14, xy(36,0), 1).
fillpoint(r14, xy(35,0), 1).
fillpoint(r14, xy(34,0), 1).
region(r16, '#a07664', 13, centroid(41,4)).
polygon(r16, [xy(39,4),xy(39,5),xy(40,5),xy(41,4),xy(40,3),xy(40,0),xy(39,4)]).
midline(r16, [xy(40,4)]).
fillpoint(r16, xy(40,4), 2).
fillpoint(r16, xy(44,5), 1).
fillpoint(r16, xy(43,5), 1).
fillpoint(r16, xy(42,5), 1).
fillpoint(r16, xy(41,5), 1).
region(r17, '#cd9979', 29, centroid(44,2)).
polygon(r17, [xy(41,0),xy(41,3),xy(42,4),xy(43,3),xy(43,4),xy(44,4),xy(45,3),xy(42,0),xy(47,0),xy(47,1),xy(46,2),xy(46,3),xy(45,4),xy(41,0)]).
midline(r17, [xy(42,1),xy(42,3),xy(43,2),xy(43,1),xy(45,1),xy(45,2),xy(46,1)]).
fillpoint(r17, xy(46,1), 2).
fillpoint(r17, xy(45,2), 2).
fillpoint(r17, xy(45,1), 2).
fillpoint(r17, xy(44,1), 2).
fillpoint(r17, xy(43,2), 2).
region(r19, '#3d261a', 36, centroid(56,1)).
polygon(r19, [xy(49,0),xy(49,1),xy(50,1),xy(50,2),xy(54,2),xy(55,1),xy(54,0),xy(51,0),xy(49,0)]).
midline(r19, [xy(51,1),xy(54,1)]).
midline(r19, [xy(60,1),xy(60,2)]).
fillpoint(r19, xy(60,2), 2).
fillpoint(r19, xy(60,1), 2).
fillpoint(r19, xy(54,1), 2).
fillpoint(r19, xy(53,1), 2).
fillpoint(r19, xy(52,1), 2).
region(r24, '#563b2c', 16, centroid(65,2)).
polygon(r24, [xy(63,1),xy(64,0),xy(66,0),xy(66,2),xy(65,3),xy(64,2),xy(65,4),xy(65,5),xy(66,4),xy(66,5),xy(63,1)]).
midline(r24, [xy(64,1),xy(65,1),xy(65,2)]).
fillpoint(r24, xy(65,2), 2).
fillpoint(r24, xy(65,1), 2).
fillpoint(r24, xy(64,1), 2).
fillpoint(r24, xy(66,5), 1).
fillpoint(r24, xy(66,4), 1).
region(r25, '#6f4323', 5, centroid(67,2)).
polygon(r25, [xy(67,0),xy(67,4),xy(67,0)]).
fillpoint(r25, xy(67,4), 1).
fillpoint(r25, xy(67,3), 1).
fillpoint(r25, xy(67,2), 1).
fillpoint(r25, xy(67,1), 1).
fillpoint(r25, xy(67,0), 1).
region(r30, '#6f4323', 173, centroid(85,10)).
polygon(r30, [xy(72,0),xy(72,2),xy(73,2),xy(73,6),xy(74,7),xy(74,8),xy(78,8),xy(79,7),xy(77,5),xy(76,5),xy(74,3),xy(76,3),xy(78,4),xy(79,4),xy(79,5),xy(80,4),xy(81,5),xy(80,6),xy(80,7),xy(79,8),xy(81,7),xy(82,6),xy(82,5),xy(83,5),xy(83,6),xy(85,4),xy(85,6),xy(84,7),xy(84,10),xy(85,10),xy(85,12),xy(83,14),xy(83,16),xy(84,17),xy(83,18),xy(84,18),xy(85,17),xy(85,15),xy(84,14),xy(72,0)]).
hole(r30, [xy(84,15),xy(84,16),xy(84,15)]).
midline(r30, [xy(74,4),xy(75,6),xy(77,6),xy(77,7),xy(78,7),xy(78,5),xy(80,5),xy(81,6)]).
midline(r30, [xy(84,6),xy(85,7)]).
midline(r30, [xy(86,17)]).
midline(r30, [xy(87,2)]).
midline(r30, [xy(88,11),xy(88,13),xy(90,14),xy(92,16)]).
midline(r30, [xy(89,8)]).
fillpoint(r30, xy(88,13), 5).
fillpoint(r30, xy(92,16), 4).
fillpoint(r30, xy(91,15), 4).
fillpoint(r30, xy(90,14), 4).
fillpoint(r30, xy(89,14), 4).
region(r31, '#844622', 142, centroid(87,4)).
polygon(r31, [xy(73,1),xy(74,0),xy(86,0),xy(86,1),xy(85,2),xy(85,3),xy(84,4),xy(81,4),xy(80,3),xy(77,3),xy(76,2),xy(74,2),xy(76,4),xy(77,4),xy(73,1)]).
hole(r31, [xy(89,4),xy(89,5),xy(90,4),xy(90,5),xy(91,5),xy(89,4)]).
midline(r31, [xy(74,1),xy(77,1),xy(77,2),xy(78,1),xy(78,2),xy(79,1),xy(79,2),xy(83,2),xy(85,1)]).
midline(r31, [xy(87,6)]).
midline(r31, [xy(91,1),xy(92,1),xy(92,3),xy(93,3),xy(93,12),xy(94,11),xy(94,13)]).
fillpoint(r31, xy(93,9), 3).
fillpoint(r31, xy(93,8), 3).
fillpoint(r31, xy(93,7), 3).
fillpoint(r31, xy(93,6), 3).
fillpoint(r31, xy(93,4), 3).
region(r32, '#a07664', 11, centroid(17,3)).
polygon(r32, [xy(15,1),xy(16,1),xy(16,3),xy(17,2),xy(18,3),xy(17,4),xy(19,4),xy(19,5),xy(15,1)]).
midline(r32, [xy(17,3)]).
fillpoint(r32, xy(17,3), 2).
fillpoint(r32, xy(19,5), 1).
fillpoint(r32, xy(19,4), 1).
fillpoint(r32, xy(18,4), 1).
fillpoint(r32, xy(18,3), 1).
region(r35, '#2e2017', 4, centroid(27,1)).
polygon(r35, [xy(25,1),xy(28,1),xy(25,1)]).
fillpoint(r35, xy(28,1), 1).
fillpoint(r35, xy(27,1), 1).
fillpoint(r35, xy(26,1), 1).
fillpoint(r35, xy(25,1), 1).
region(r36, '#563b2c', 16, centroid(32,4)).
polygon(r36, [xy(30,2),xy(30,4),xy(31,3),xy(31,6),xy(32,5),xy(33,6),xy(32,7),xy(34,7),xy(30,2)]).
midline(r36, [xy(31,2)]).
midline(r36, [xy(32,6)]).
fillpoint(r36, xy(32,6), 2).
fillpoint(r36, xy(31,2), 2).
fillpoint(r36, xy(34,7), 1).
fillpoint(r36, xy(33,7), 1).
fillpoint(r36, xy(33,6), 1).
region(r39, '#6f4323', 6, centroid(36,1)).
polygon(r39, [xy(34,1),xy(35,1),xy(35,2),xy(36,1),xy(38,1),xy(34,1)]).
fillpoint(r39, xy(38,1), 1).
fillpoint(r39, xy(37,1), 1).
fillpoint(r39, xy(36,1), 1).
fillpoint(r39, xy(35,2), 1).
fillpoint(r39, xy(35,1), 1).
region(r40, '#835a46', 35, centroid(37,4)).
polygon(r40, [xy(33,5),xy(34,4),xy(34,2),xy(35,3),xy(36,2),xy(38,2),xy(39,1),xy(39,3),xy(38,4),xy(38,5),xy(39,6),xy(38,7),xy(36,7),xy(35,6),xy(34,6),xy(33,5)]).
midline(r40, [xy(34,5),xy(36,4),xy(36,5),xy(38,3)]).
midline(r40, [xy(38,6)]).
fillpoint(r40, xy(36,5), 3).
fillpoint(r40, xy(36,4), 3).
fillpoint(r40, xy(38,6), 2).
fillpoint(r40, xy(38,3), 2).
fillpoint(r40, xy(37,6), 2).
region(r41, '#563b2c', 15, centroid(49,3)).
polygon(r41, [xy(47,5),xy(48,4),xy(48,1),xy(50,3),xy(48,5),xy(50,4),xy(51,3),xy(51,4),xy(52,3),xy(52,4),xy(47,5)]).
midline(r41, [xy(49,3)]).
fillpoint(r41, xy(49,3), 2).
fillpoint(r41, xy(52,4), 1).
fillpoint(r41, xy(52,3), 1).
fillpoint(r41, xy(51,4), 1).
fillpoint(r41, xy(51,3), 1).
region(r45, '#cd9979', 13, centroid(71,4)).
polygon(r45, [xy(69,2),xy(69,3),xy(70,4),xy(71,3),xy(71,2),xy(70,1),xy(69,2)]).
midline(r45, [xy(70,2),xy(70,3)]).
fillpoint(r45, xy(70,3), 2).
fillpoint(r45, xy(70,2), 2).
fillpoint(r45, xy(72,7), 1).
fillpoint(r45, xy(72,6), 1).
fillpoint(r45, xy(71,6), 1).
region(r48, '#844622', 9, centroid(15,4)).
polygon(r48, [xy(13,2),xy(13,3),xy(14,3),xy(14,4),xy(15,4),xy(15,5),xy(16,5),xy(16,6),xy(17,6),xy(13,2)]).
fillpoint(r48, xy(17,6), 1).
fillpoint(r48, xy(16,6), 1).
fillpoint(r48, xy(16,5), 1).
fillpoint(r48, xy(15,5), 1).
fillpoint(r48, xy(15,4), 1).
region(r50, '#6f4323', 4, centroid(33,3)).
polygon(r50, [xy(32,4),xy(33,3),xy(33,4),xy(32,4)]).
fillpoint(r50, xy(33,4), 1).
fillpoint(r50, xy(33,3), 1).
fillpoint(r50, xy(33,2), 1).
fillpoint(r50, xy(32,4), 1).
region(r53, '#563b2c', 7, centroid(57,3)).
polygon(r53, [xy(55,3),xy(56,3),xy(57,2),xy(57,3),xy(58,2),xy(58,4),xy(55,3)]).
fillpoint(r53, xy(58,4), 1).
fillpoint(r53, xy(58,3), 1).
fillpoint(r53, xy(58,2), 1).
fillpoint(r53, xy(57,3), 1).
fillpoint(r53, xy(57,2), 1).
region(r63, '#512713', 7, centroid(55,4)).
polygon(r63, [xy(53,3),xy(53,4),xy(54,3),xy(54,4),xy(57,4),xy(53,3)]).
fillpoint(r63, xy(57,4), 1).
fillpoint(r63, xy(56,4), 1).
fillpoint(r63, xy(55,4), 1).
fillpoint(r63, xy(54,4), 1).
fillpoint(r63, xy(54,3), 1).
region(r65, '#512713', 4, centroid(63,4)).
polygon(r65, [xy(62,4),xy(63,4),xy(64,3),xy(64,4),xy(62,4)]).
fillpoint(r65, xy(64,4), 1).
fillpoint(r65, xy(64,3), 1).
fillpoint(r65, xy(63,4), 1).
fillpoint(r65, xy(62,4), 1).
region(r66, '#835a46', 6, centroid(68,5)).
polygon(r66, [xy(67,5),xy(68,4),xy(68,5),xy(69,5),xy(69,6),xy(67,5)]).
fillpoint(r66, xy(69,6), 1).
fillpoint(r66, xy(69,5), 1).
fillpoint(r66, xy(68,5), 1).
fillpoint(r66, xy(68,4), 1).
fillpoint(r66, xy(68,3), 1).
region(r68, '#2a170b', 12, centroid(3,6)).
polygon(r68, [xy(0,7),xy(1,7),xy(2,6),xy(2,7),xy(3,6),xy(3,7),xy(4,7),xy(5,6),xy(4,5),xy(4,4),xy(0,7)]).
midline(r68, [xy(4,6)]).
fillpoint(r68, xy(4,6), 2).
fillpoint(r68, xy(5,7), 1).
fillpoint(r68, xy(5,6), 1).
fillpoint(r68, xy(4,7), 1).
fillpoint(r68, xy(4,5), 1).
region(r71, '#2e2017', 24, centroid(25,6)).
polygon(r71, [xy(21,4),xy(21,5),xy(22,5),xy(22,6),xy(23,5),xy(23,6),xy(25,4),xy(26,4),xy(27,5),xy(25,7),xy(26,7),xy(26,9),xy(25,10),xy(25,11),xy(26,10),xy(21,4)]).
midline(r71, [xy(24,6),xy(25,5),xy(25,6),xy(26,5)]).
fillpoint(r71, xy(26,5), 2).
fillpoint(r71, xy(25,6), 2).
fillpoint(r71, xy(25,5), 2).
fillpoint(r71, xy(24,6), 2).
fillpoint(r71, xy(28,5), 1).
region(r74, '#6f4323', 5, centroid(90,5)).
polygon(r74, [xy(89,4),xy(89,5),xy(90,4),xy(90,5),xy(91,5),xy(89,4)]).
fillpoint(r74, xy(91,5), 1).
fillpoint(r74, xy(90,5), 1).
fillpoint(r74, xy(90,4), 1).
fillpoint(r74, xy(89,5), 1).
fillpoint(r74, xy(89,4), 1).
region(r75, '#1b110d', 134, centroid(7,13)).
polygon(r75, [xy(0,8),xy(0,9),xy(1,8),xy(5,8),xy(6,7),xy(6,6),xy(5,5),xy(6,5),xy(10,9),xy(10,10),xy(9,11),xy(9,14),xy(10,15),xy(10,17),xy(9,18),xy(9,19),xy(8,20),xy(6,18),xy(6,17),xy(7,16),xy(5,14),xy(5,13),xy(4,12),xy(3,12),xy(2,13),xy(3,14),xy(2,15),xy(1,15),xy(0,14),xy(0,11),xy(1,10),xy(0,8)]).
hole(r75, [xy(10,11),xy(10,14),xy(11,12),xy(11,11),xy(10,11)]).
hole(r75, [xy(10,18),xy(10,19),xy(10,18)]).
midline(r75, [xy(1,9),xy(2,11),xy(3,10),xy(6,10),xy(6,11),xy(7,10),xy(7,9)]).
midline(r75, [xy(1,13),xy(1,14),xy(2,14)]).
midline(r75, [xy(7,13),xy(7,14),xy(8,15),xy(8,19)]).
midline(r75, [xy(11,20),xy(11,21),xy(12,20),xy(12,17),xy(13,16),xy(13,18)]).
fillpoint(r75, xy(7,10), 4).
fillpoint(r75, xy(7,9), 4).
fillpoint(r75, xy(6,11), 4).
fillpoint(r75, xy(6,10), 4).
fillpoint(r75, xy(8,17), 3).
region(r77, '#835a46', 4, centroid(18,6)).
polygon(r77, [xy(17,5),xy(18,5),xy(18,6),xy(19,6),xy(17,5)]).
fillpoint(r77, xy(19,6), 1).
fillpoint(r77, xy(18,6), 1).
fillpoint(r77, xy(18,5), 1).
fillpoint(r77, xy(17,5), 1).
region(r82, '#3d261a', 40, centroid(45,8)).
polygon(r82, [xy(38,9),xy(38,10),xy(40,8),xy(41,8),xy(42,7),xy(44,7),xy(44,8),xy(43,9),xy(42,9),xy(41,10),xy(40,10),xy(39,11),xy(38,9)]).
midline(r82, [xy(39,10),xy(40,9),xy(41,9),xy(42,8),xy(43,8)]).
midline(r82, [xy(46,7),xy(48,7)]).
fillpoint(r82, xy(48,7), 2).
fillpoint(r82, xy(47,7), 2).
fillpoint(r82, xy(46,7), 2).
fillpoint(r82, xy(43,8), 2).
fillpoint(r82, xy(42,8), 2).
region(r83, '#2e2017', 89, centroid(64,8)).
polygon(r83, [xy(51,6),xy(52,6),xy(52,7),xy(53,6),xy(53,7),xy(54,6),xy(54,7),xy(58,7),xy(59,8),xy(62,8),xy(63,9),xy(65,9),xy(66,10),xy(67,10),xy(69,12),xy(70,12),xy(72,14),xy(73,13),xy(73,12),xy(74,11),xy(72,9),xy(71,9),xy(69,7),xy(66,7),xy(65,6),xy(62,6),xy(61,5),xy(55,5),xy(51,6)]).
midline(r83, [xy(55,6),xy(59,6),xy(59,7),xy(60,6),xy(60,7),xy(61,6),xy(61,7),xy(63,7),xy(63,8),xy(64,7),xy(64,8),xy(65,7),xy(65,8),xy(66,8),xy(66,9),xy(69,9),xy(69,10),xy(70,10),xy(71,11),xy(72,11),xy(72,13)]).
fillpoint(r83, xy(72,11), 3).
fillpoint(r83, xy(71,11), 3).
fillpoint(r83, xy(70,10), 3).
fillpoint(r83, xy(69,10), 3).
fillpoint(r83, xy(69,9), 3).
region(r96, '#2e2017', 4, centroid(10,8)).
polygon(r96, [xy(9,7),xy(10,7),xy(10,8),xy(11,8),xy(9,7)]).
fillpoint(r96, xy(11,8), 1).
fillpoint(r96, xy(10,8), 1).
fillpoint(r96, xy(10,7), 1).
fillpoint(r96, xy(9,7), 1).
region(r97, '#3d261a', 19, centroid(16,10)).
polygon(r97, [xy(11,7),xy(12,7),xy(12,8),xy(14,8),xy(14,9),xy(15,9),xy(15,10),xy(16,9),xy(17,10),xy(16,11),xy(18,11),xy(18,12),xy(20,12),xy(20,13),xy(21,13),xy(11,7)]).
midline(r97, [xy(16,10)]).
fillpoint(r97, xy(16,10), 2).
fillpoint(r97, xy(21,13), 1).
fillpoint(r97, xy(20,13), 1).
fillpoint(r97, xy(20,12), 1).
fillpoint(r97, xy(19,12), 1).
region(r99, '#835a46', 7, centroid(22,8)).
polygon(r99, [xy(20,7),xy(21,7),xy(21,8),xy(22,8),xy(22,9),xy(23,9),xy(23,10),xy(20,7)]).
fillpoint(r99, xy(23,10), 1).
fillpoint(r99, xy(23,9), 1).
fillpoint(r99, xy(22,9), 1).
fillpoint(r99, xy(22,8), 1).
fillpoint(r99, xy(21,8), 1).
region(r109, '#844622', 11, centroid(81,8)).
polygon(r109, [xy(78,9),xy(79,9),xy(80,8),xy(80,9),xy(81,8),xy(81,9),xy(82,8),xy(82,7),xy(83,7),xy(83,9),xy(78,9)]).
fillpoint(r109, xy(83,9), 1).
fillpoint(r109, xy(83,8), 1).
fillpoint(r109, xy(83,7), 1).
fillpoint(r109, xy(82,8), 1).
fillpoint(r109, xy(82,7), 1).
region(r113, '#563b2c', 8, centroid(29,10)).
polygon(r113, [xy(28,9),xy(28,10),xy(29,10),xy(30,9),xy(29,8),xy(30,10),xy(30,11),xy(28,9)]).
midline(r113, [xy(29,9)]).
fillpoint(r113, xy(29,9), 2).
fillpoint(r113, xy(30,11), 1).
fillpoint(r113, xy(30,10), 1).
fillpoint(r113, xy(30,9), 1).
fillpoint(r113, xy(29,10), 1).
region(r116, '#3d261a', 5, centroid(33,8)).
polygon(r116, [xy(32,8),xy(33,8),xy(33,9),xy(34,8),xy(34,9),xy(32,8)]).
fillpoint(r116, xy(34,9), 1).
fillpoint(r116, xy(34,8), 1).
fillpoint(r116, xy(33,9), 1).
fillpoint(r116, xy(33,8), 1).
fillpoint(r116, xy(32,8), 1).
region(r117, '#563b2c', 4, centroid(36,9)).
polygon(r117, [xy(35,8),xy(35,9),xy(36,8),xy(36,9),xy(35,8)]).
fillpoint(r117, xy(36,9), 1).
fillpoint(r117, xy(36,8), 1).
fillpoint(r117, xy(35,9), 1).
fillpoint(r117, xy(35,8), 1).
region(r121, '#563b2c', 136, centroid(66,21)).
polygon(r121, [xy(44,9),xy(48,9),xy(49,8),xy(49,9),xy(50,8),xy(50,9),xy(51,8),xy(51,9),xy(52,8),xy(53,8),xy(53,9),xy(54,8),xy(54,9),xy(55,8),xy(55,9),xy(60,9),xy(60,10),xy(63,10),xy(63,11),xy(65,11),xy(65,12),xy(66,12),xy(66,13),xy(67,12),xy(67,13),xy(68,13),xy(68,14),xy(69,13),xy(70,14),xy(69,15),xy(70,16),xy(70,17),xy(71,18),xy(71,20),xy(72,21),xy(72,23),xy(71,24),xy(71,26),xy(69,28),xy(69,29),xy(68,30),xy(67,30),xy(66,31),xy(65,31),xy(64,32),xy(62,32),xy(61,33),xy(53,33),xy(44,9)]).
midline(r121, [xy(67,31),xy(68,31),xy(71,28),xy(71,29),xy(72,28),xy(72,27),xy(73,26),xy(73,21),xy(72,20),xy(72,18),xy(71,17),xy(71,16),xy(69,14)]).
midline(r121, [xy(72,17),xy(73,19),xy(73,20),xy(74,21),xy(74,22)]).
fillpoint(r121, xy(73,26), 3).
fillpoint(r121, xy(73,25), 3).
fillpoint(r121, xy(73,24), 3).
fillpoint(r121, xy(72,28), 3).
fillpoint(r121, xy(72,27), 3).
region(r127, '#2e2017', 4, centroid(13,10)).
polygon(r127, [xy(12,9),xy(13,9),xy(13,10),xy(14,10),xy(12,9)]).
fillpoint(r127, xy(14,10), 1).
fillpoint(r127, xy(13,10), 1).
fillpoint(r127, xy(13,9), 1).
fillpoint(r127, xy(12,9), 1).
region(r133, '#835a46', 251, centroid(55,22)).
polygon(r133, [xy(36,20),xy(36,25),xy(37,26),xy(38,25),xy(38,24),xy(37,23),xy(37,21),xy(38,20),xy(37,19),xy(37,15),xy(38,15),xy(41,12),xy(42,12),xy(42,13),xy(38,17),xy(38,19),xy(36,20)]).
hole(r133, [xy(38,21),xy(38,23),xy(39,24),xy(39,25),xy(42,28),xy(51,28),xy(52,27),xy(53,28),xy(59,28),xy(60,29),xy(61,28),xy(63,28),xy(64,27),xy(65,27),xy(66,26),xy(66,27),xy(67,25),xy(67,24),xy(66,23),xy(66,22),xy(65,21),xy(65,19),xy(64,18),xy(64,17),xy(61,14),xy(60,14),xy(59,13),xy(58,13),xy(57,12),xy(44,12),xy(39,17),xy(39,20),xy(38,21)]).
midline(r133, [xy(37,20)]).
midline(r133, [xy(37,24),xy(37,25),xy(40,28)]).
midline(r133, [xy(38,16),xy(41,13)]).
midline(r133, [xy(46,30),xy(54,30),xy(54,31),xy(55,30),xy(55,31),xy(56,30),xy(56,31),xy(57,30),xy(57,31),xy(58,30),xy(58,31),xy(59,30),xy(59,31),xy(60,31),xy(61,30),xy(61,31),xy(62,30),xy(63,30),xy(64,29),xy(64,30),xy(65,29),xy(66,29),xy(68,27),xy(68,26),xy(69,25),xy(69,26)]).
midline(r133, [xy(52,10)]).
midline(r133, [xy(58,11),xy(59,11),xy(60,12),xy(62,12),xy(62,13),xy(64,14),xy(66,16),xy(67,16),xy(67,18),xy(68,18),xy(68,21),xy(69,21),xy(69,23)]).
fillpoint(r133, xy(69,23), 3).
fillpoint(r133, xy(69,22), 3).
fillpoint(r133, xy(69,21), 3).
fillpoint(r133, xy(68,21), 3).
fillpoint(r133, xy(68,20), 3).
region(r148, '#2e2017', 5, centroid(37,11)).
polygon(r148, [xy(36,11),xy(37,10),xy(38,11),xy(37,12),xy(36,11)]).
midline(r148, [xy(37,11)]).
fillpoint(r148, xy(37,11), 2).
fillpoint(r148, xy(38,11), 1).
fillpoint(r148, xy(37,12), 1).
fillpoint(r148, xy(37,10), 1).
fillpoint(r148, xy(36,11), 1).
region(r156, '#6f4323', 4, centroid(80,10)).
polygon(r156, [xy(78,10),xy(81,10),xy(78,10)]).
fillpoint(r156, xy(81,10), 1).
fillpoint(r156, xy(80,10), 1).
fillpoint(r156, xy(79,10), 1).
fillpoint(r156, xy(78,10), 1).
region(r159, '#2a170b', 6, centroid(10,12)).
polygon(r159, [xy(10,11),xy(10,14),xy(11,12),xy(11,11),xy(10,11)]).
fillpoint(r159, xy(11,12), 1).
fillpoint(r159, xy(11,11), 1).
fillpoint(r159, xy(10,14), 1).
fillpoint(r159, xy(10,13), 1).
fillpoint(r159, xy(10,12), 1).
region(r163, '#1b110d', 134, centroid(31,24)).
polygon(r163, [xy(24,14),xy(24,25),xy(25,25),xy(26,26),xy(27,25),xy(27,24),xy(26,23),xy(26,22),xy(27,21),xy(27,20),xy(28,19),xy(28,17),xy(27,16),xy(27,15),xy(28,14),xy(28,13),xy(26,11),xy(25,12),xy(25,13),xy(24,14)]).
midline(r163, [xy(25,21),xy(25,24),xy(26,24),xy(26,25)]).
midline(r163, [xy(26,12),xy(26,14)]).
midline(r163, [xy(26,17),xy(26,21)]).
midline(r163, [xy(31,24),xy(31,25),xy(32,25),xy(32,27),xy(33,28),xy(33,29),xy(34,29),xy(34,30),xy(36,32),xy(37,32),xy(37,33),xy(38,33),xy(38,34),xy(40,34),xy(40,35),xy(41,35),xy(43,37)]).
fillpoint(r163, xy(26,19), 3).
fillpoint(r163, xy(26,18), 3).
fillpoint(r163, xy(26,17), 3).
fillpoint(r163, xy(26,14), 3).
fillpoint(r163, xy(43,37), 2).
region(r171, '#2a170b', 56, centroid(78,16)).
polygon(r171, [xy(74,12),xy(74,15),xy(77,18),xy(77,19),xy(79,19),xy(80,20),xy(81,19),xy(81,17),xy(80,16),xy(80,15),xy(76,11),xy(75,11),xy(74,12)]).
midline(r171, [xy(76,13),xy(78,17),xy(79,17),xy(80,19),xy(81,20)]).
fillpoint(r171, xy(77,15), 4).
fillpoint(r171, xy(79,17), 3).
fillpoint(r171, xy(78,17), 3).
fillpoint(r171, xy(78,16), 3).
fillpoint(r171, xy(78,15), 3).
region(r173, '#512713', 11, centroid(80,12)).
polygon(r173, [xy(78,11),xy(79,11),xy(79,12),xy(80,11),xy(82,11),xy(82,12),xy(81,13),xy(80,13),xy(78,11)]).
midline(r173, [xy(80,12),xy(81,12)]).
fillpoint(r173, xy(81,12), 2).
fillpoint(r173, xy(80,12), 2).
fillpoint(r173, xy(82,12), 1).
fillpoint(r173, xy(82,11), 1).
fillpoint(r173, xy(81,13), 1).
region(r174, '#844622', 5, centroid(83,12)).
polygon(r174, [xy(83,11),xy(83,13),xy(84,12),xy(84,11),xy(83,11)]).
fillpoint(r174, xy(84,12), 1).
fillpoint(r174, xy(84,11), 1).
fillpoint(r174, xy(83,13), 1).
fillpoint(r174, xy(83,12), 1).
fillpoint(r174, xy(83,11), 1).
region(r175, '#0a0603', 454, centroid(17,31)).
polygon(r175, [xy(0,36),xy(0,40),xy(15,40),xy(16,39),xy(16,38),xy(17,37),xy(17,36),xy(16,35),xy(16,34),xy(19,31),xy(20,32),xy(20,34),xy(21,35),xy(21,37),xy(22,38),xy(22,40),xy(33,40),xy(34,39),xy(34,38),xy(35,37),xy(34,36),xy(32,36),xy(31,35),xy(30,35),xy(29,34),xy(27,34),xy(22,29),xy(21,29),xy(18,26),xy(17,27),xy(17,28),xy(16,29),xy(14,29),xy(13,30),xy(13,32),xy(14,33),xy(20,27),xy(19,26),xy(19,23),xy(21,21),xy(21,17),xy(20,16),xy(19,16),xy(17,14),xy(15,14),xy(13,12),xy(12,13),xy(12,15),xy(13,14),xy(15,16),xy(15,18),xy(14,19),xy(14,20),xy(11,23),xy(9,21),xy(8,22),xy(7,22),xy(9,23),xy(9,24),xy(10,25),xy(9,26),xy(9,27),xy(8,28),xy(8,29),xy(4,33),xy(4,34),xy(1,37),xy(0,36)]).
hole(r175, [xy(14,30),xy(14,32),xy(15,31),xy(15,30),xy(16,30),xy(14,30)]).
hole(r175, [xy(18,27),xy(18,28),xy(18,27)]).
midline(r175, [xy(2,38),xy(8,35),xy(9,34),xy(9,33),xy(10,34),xy(9,35),xy(11,35),xy(13,36)]).
midline(r175, [xy(9,22),xy(10,23),xy(10,24)]).
midline(r175, [xy(10,30),xy(11,29),xy(11,28),xy(12,28),xy(13,26),xy(14,25),xy(14,24),xy(15,23),xy(15,25)]).
midline(r175, [xy(13,13),xy(15,15),xy(17,16),xy(18,18),xy(17,19),xy(18,19),xy(17,21),xy(16,22)]).
midline(r175, [xy(15,33),xy(16,32),xy(16,33),xy(17,32),xy(17,31),xy(18,30),xy(17,29),xy(18,31),xy(20,30),xy(21,31),xy(22,31),xy(23,33),xy(23,34),xy(24,34),xy(25,36),xy(27,37),xy(31,37),xy(31,38),xy(32,38),xy(34,37)]).
midline(r175, [xy(37,36),xy(41,38)]).
fillpoint(r175, xy(11,35), 6).
fillpoint(r175, xy(10,35), 6).
fillpoint(r175, xy(10,34), 6).
fillpoint(r175, xy(9,35), 6).
fillpoint(r175, xy(9,34), 6).
region(r176, '#1b110d', 5, centroid(15,13)).
polygon(r176, [xy(14,12),xy(15,12),xy(15,13),xy(17,13),xy(14,12)]).
fillpoint(r176, xy(17,13), 1).
fillpoint(r176, xy(16,13), 1).
fillpoint(r176, xy(15,13), 1).
fillpoint(r176, xy(15,12), 1).
fillpoint(r176, xy(14,12), 1).
region(r178, '#2e2017', 23, centroid(23,19)).
polygon(r178, [xy(22,12),xy(22,13),xy(23,13),xy(23,20),xy(22,21),xy(22,26),xy(23,25),xy(23,21),xy(22,12)]).
fillpoint(r178, xy(24,13), 1).
fillpoint(r178, xy(24,12), 1).
fillpoint(r178, xy(23,25), 1).
fillpoint(r178, xy(23,24), 1).
fillpoint(r178, xy(23,23), 1).
region(r185, '#844622', 7, centroid(36,13)).
polygon(r185, [xy(34,12),xy(35,12),xy(35,13),xy(36,13),xy(36,15),xy(37,14),xy(34,12)]).
fillpoint(r185, xy(37,14), 1).
fillpoint(r185, xy(36,15), 1).
fillpoint(r185, xy(36,14), 1).
fillpoint(r185, xy(36,13), 1).
fillpoint(r185, xy(35,13), 1).
region(r190, '#a07664', 249, centroid(52,21)).
polygon(r190, [xy(38,21),xy(38,23),xy(39,24),xy(39,25),xy(42,28),xy(45,28),xy(46,27),xy(44,25),xy(44,24),xy(43,23),xy(43,18),xy(45,16),xy(45,15),xy(46,14),xy(47,14),xy(48,13),xy(47,12),xy(44,12),xy(39,17),xy(39,20),xy(38,21)]).
hole(r190, [xy(44,18),xy(44,23),xy(45,24),xy(45,25),xy(46,26),xy(49,26),xy(50,25),xy(51,25),xy(52,24),xy(53,24),xy(54,23),xy(55,23),xy(56,22),xy(56,21),xy(57,20),xy(58,20),xy(59,19),xy(59,17),xy(60,16),xy(58,14),xy(48,14),xy(47,15),xy(46,15),xy(46,16),xy(45,17),xy(44,18)]).
midline(r190, [xy(40,21),xy(40,23),xy(41,22),xy(41,17),xy(42,16),xy(42,17),xy(43,16),xy(43,15),xy(44,14),xy(46,13),xy(47,13)]).
midline(r190, [xy(41,23),xy(41,25),xy(42,24),xy(42,26),xy(43,26),xy(45,27)]).
midline(r190, [xy(50,27),xy(51,27),xy(52,26),xy(56,26),xy(58,25),xy(60,26),xy(60,27),xy(61,26),xy(62,26),xy(63,25),xy(63,26),xy(64,25),xy(64,24),xy(65,24),xy(65,25)]).
midline(r190, [xy(58,22),xy(59,21)]).
midline(r190, [xy(61,15),xy(62,16),xy(61,17),xy(63,17),xy(63,18),xy(64,19),xy(64,22),xy(65,22)]).
fillpoint(r190, xy(58,25), 4).
fillpoint(r190, xy(65,25), 3).
fillpoint(r190, xy(65,24), 3).
fillpoint(r190, xy(64,25), 3).
fillpoint(r190, xy(64,24), 3).
region(r193, '#2a170b', 117, centroid(3,23)).
polygon(r193, [xy(0,16),xy(0,32),xy(1,33),xy(2,33),xy(6,29),xy(6,24),xy(5,23),xy(5,22),xy(6,21),xy(6,19),xy(5,18),xy(5,17),xy(6,16),xy(3,13),xy(4,13),xy(3,15),xy(2,16),xy(1,16),xy(0,16)]).
midline(r193, [xy(2,31),xy(3,29),xy(3,24)]).
midline(r193, [xy(3,17),xy(4,16)]).
midline(r193, [xy(3,19),xy(3,21)]).
fillpoint(r193, xy(3,29), 4).
fillpoint(r193, xy(3,28), 4).
fillpoint(r193, xy(3,27), 4).
fillpoint(r193, xy(3,26), 4).
fillpoint(r193, xy(3,25), 4).
region(r196, '#3d261a', 4, centroid(32,14)).
polygon(r196, [xy(31,13),xy(31,14),xy(32,14),xy(32,15),xy(31,13)]).
fillpoint(r196, xy(32,15), 1).
fillpoint(r196, xy(32,14), 1).
fillpoint(r196, xy(31,14), 1).
fillpoint(r196, xy(31,13), 1).
region(r207, '#1b110d', 10, centroid(21,16)).
polygon(r207, [xy(19,15),xy(21,15),xy(22,14),xy(22,20),xy(19,15)]).
fillpoint(r207, xy(22,20), 1).
fillpoint(r207, xy(22,19), 1).
fillpoint(r207, xy(22,18), 1).
fillpoint(r207, xy(22,17), 1).
fillpoint(r207, xy(22,16), 1).
region(r208, '#512713', 5, centroid(34,15)).
polygon(r208, [xy(33,14),xy(33,15),xy(34,15),xy(34,16),xy(35,15),xy(33,14)]).
fillpoint(r208, xy(35,15), 1).
fillpoint(r208, xy(34,16), 1).
fillpoint(r208, xy(34,15), 1).
fillpoint(r208, xy(33,15), 1).
fillpoint(r208, xy(33,14), 1).
region(r212, '#cd9979', 173, centroid(52,19)).
polygon(r212, [xy(44,18),xy(44,23),xy(45,24),xy(45,25),xy(46,26),xy(49,26),xy(50,25),xy(51,25),xy(52,24),xy(53,24),xy(54,23),xy(55,23),xy(56,22),xy(56,21),xy(57,20),xy(58,20),xy(59,19),xy(59,17),xy(60,16),xy(58,14),xy(48,14),xy(47,15),xy(46,15),xy(46,16),xy(45,17),xy(44,18)]).
midline(r212, [xy(49,19),xy(49,21),xy(50,20),xy(50,19),xy(51,19),xy(51,20),xy(52,19),xy(53,19),xy(55,18)]).
midline(r212, [xy(58,16)]).
midline(r212, [xy(61,22)]).
fillpoint(r212, xy(53,19), 6).
fillpoint(r212, xy(52,19), 6).
fillpoint(r212, xy(51,20), 6).
fillpoint(r212, xy(51,19), 6).
fillpoint(r212, xy(50,20), 6).
region(r217, '#0a0603', 33, centroid(29,23)).
polygon(r217, [xy(27,22),xy(27,23),xy(28,24),xy(28,27),xy(29,28),xy(29,29),xy(30,29),xy(31,28),xy(30,27),xy(30,26),xy(29,25),xy(29,22),xy(28,21),xy(28,20),xy(29,19),xy(29,17),xy(28,16),xy(28,15),xy(29,15),xy(29,16),xy(27,22)]).
midline(r217, [xy(28,22),xy(28,23)]).
midline(r217, [xy(29,26),xy(29,27),xy(30,28)]).
fillpoint(r217, xy(30,28), 2).
fillpoint(r217, xy(29,27), 2).
fillpoint(r217, xy(29,26), 2).
fillpoint(r217, xy(28,23), 2).
fillpoint(r217, xy(28,22), 2).
region(r218, '#2a170b', 12, centroid(32,18)).
polygon(r218, [xy(31,15),xy(31,21),xy(32,19),xy(32,18),xy(33,17),xy(32,16),xy(31,15)]).
midline(r218, [xy(32,17)]).
fillpoint(r218, xy(32,17), 2).
fillpoint(r218, xy(33,17), 1).
fillpoint(r218, xy(32,19), 1).
fillpoint(r218, xy(32,18), 1).
fillpoint(r218, xy(32,16), 1).
region(r224, '#6f4323', 12, centroid(35,20)).
polygon(r224, [xy(35,16),xy(36,16),xy(36,18),xy(35,19),xy(35,25),xy(35,16)]).
fillpoint(r224, xy(36,19), 1).
fillpoint(r224, xy(36,18), 1).
fillpoint(r224, xy(36,17), 1).
fillpoint(r224, xy(36,16), 1).
fillpoint(r224, xy(35,25), 1).
region(r233, '#2e2017', 21, centroid(78,21)).
polygon(r233, [xy(75,17),xy(75,18),xy(76,18),xy(76,20),xy(77,20),xy(77,22),xy(78,23),xy(78,24),xy(79,24),xy(80,23),xy(80,21),xy(79,20),xy(78,20),xy(75,17)]).
midline(r233, [xy(78,21),xy(78,22),xy(79,21),xy(79,23)]).
fillpoint(r233, xy(79,23), 2).
fillpoint(r233, xy(79,22), 2).
fillpoint(r233, xy(79,21), 2).
fillpoint(r233, xy(78,22), 2).
fillpoint(r233, xy(78,21), 2).
region(r241, '#512713', 13, centroid(89,19)).
polygon(r241, [xy(87,18),xy(87,19),xy(88,18),xy(89,18),xy(89,19),xy(88,20),xy(89,20),xy(90,19),xy(90,20),xy(93,20),xy(87,18)]).
fillpoint(r241, xy(93,20), 1).
fillpoint(r241, xy(92,20), 1).
fillpoint(r241, xy(91,20), 1).
fillpoint(r241, xy(90,20), 1).
fillpoint(r241, xy(90,19), 1).
region(r242, '#563b2c', 6, centroid(34,22)).
polygon(r242, [xy(34,19),xy(34,24),xy(34,19)]).
fillpoint(r242, xy(34,24), 1).
fillpoint(r242, xy(34,23), 1).
fillpoint(r242, xy(34,22), 1).
fillpoint(r242, xy(34,21), 1).
fillpoint(r242, xy(34,20), 1).
region(r245, '#844622', 24, centroid(84,24)).
polygon(r245, [xy(83,19),xy(83,23),xy(84,24),xy(84,29),xy(85,28),xy(85,22),xy(84,21),xy(86,22),xy(83,19)]).
midline(r245, [xy(84,22),xy(84,23)]).
fillpoint(r245, xy(84,23), 2).
fillpoint(r245, xy(84,22), 2).
fillpoint(r245, xy(86,29), 1).
fillpoint(r245, xy(86,22), 1).
fillpoint(r245, xy(85,29), 1).
region(r257, '#3d261a', 21, centroid(76,26)).
polygon(r257, [xy(74,29),xy(75,28),xy(75,27),xy(76,26),xy(76,21),xy(77,23),xy(77,24),xy(78,25),xy(78,26),xy(75,29),xy(77,28),xy(74,29)]).
midline(r257, [xy(76,27),xy(77,26),xy(77,25)]).
fillpoint(r257, xy(77,26), 2).
fillpoint(r257, xy(77,25), 2).
fillpoint(r257, xy(76,27), 2).
fillpoint(r257, xy(79,25), 1).
fillpoint(r257, xy(78,26), 1).
region(r258, '#cd9979', 12, centroid(87,25)).
polygon(r258, [xy(86,24),xy(86,28),xy(87,27),xy(87,21),xy(86,24)]).
fillpoint(r258, xy(87,27), 1).
fillpoint(r258, xy(87,26), 1).
fillpoint(r258, xy(87,25), 1).
fillpoint(r258, xy(87,24), 1).
fillpoint(r258, xy(87,23), 1).
region(r263, '#512713', 12, centroid(92,23)).
polygon(r263, [xy(89,22),xy(89,23),xy(90,22),xy(91,22),xy(91,23),xy(92,22),xy(92,23),xy(93,23),xy(93,24),xy(94,23),xy(94,21),xy(89,22)]).
fillpoint(r263, xy(94,23), 1).
fillpoint(r263, xy(94,22), 1).
fillpoint(r263, xy(94,21), 1).
fillpoint(r263, xy(93,24), 1).
fillpoint(r263, xy(93,23), 1).
region(r264, '#1b110d', 15, centroid(7,25)).
polygon(r264, [xy(6,22),xy(6,23),xy(7,23),xy(7,29),xy(8,27),xy(8,26),xy(9,25),xy(8,24),xy(8,23),xy(6,22)]).
midline(r264, [xy(8,25)]).
fillpoint(r264, xy(8,25), 2).
fillpoint(r264, xy(9,25), 1).
fillpoint(r264, xy(8,27), 1).
fillpoint(r264, xy(8,26), 1).
fillpoint(r264, xy(8,24), 1).
region(r265, '#1b110d', 18, centroid(22,26)).
polygon(r265, [xy(20,23),xy(20,26),xy(21,25),xy(21,22),xy(20,23)]).
midline(r265, [xy(23,28)]).
fillpoint(r265, xy(23,28), 2).
fillpoint(r265, xy(24,28), 1).
fillpoint(r265, xy(23,29), 1).
fillpoint(r265, xy(23,27), 1).
fillpoint(r265, xy(23,26), 1).
region(r278, '#844622', 87, centroid(78,32)).
polygon(r278, [xy(72,32),xy(72,34),xy(73,35),xy(72,36),xy(73,37),xy(75,37),xy(76,38),xy(81,33),xy(81,36),xy(72,32)]).
midline(r278, [xy(73,36)]).
midline(r278, [xy(76,34),xy(79,31),xy(79,32)]).
midline(r278, [xy(80,29),xy(81,27)]).
fillpoint(r278, xy(77,33), 5).
fillpoint(r278, xy(76,34), 5).
fillpoint(r278, xy(79,32), 4).
fillpoint(r278, xy(79,31), 4).
fillpoint(r278, xy(78,33), 4).
region(r279, '#a07664', 8, centroid(83,27)).
polygon(r279, [xy(83,24),xy(83,30),xy(84,30),xy(83,24)]).
fillpoint(r279, xy(84,30), 1).
fillpoint(r279, xy(83,30), 1).
fillpoint(r279, xy(83,29), 1).
fillpoint(r279, xy(83,28), 1).
fillpoint(r279, xy(83,27), 1).
region(r282, '#512713', 8, centroid(91,26)).
polygon(r282, [xy(90,24),xy(90,27),xy(91,27),xy(92,26),xy(91,25),xy(90,24)]).
midline(r282, [xy(91,26)]).
fillpoint(r282, xy(91,26), 2).
fillpoint(r282, xy(92,26), 1).
fillpoint(r282, xy(91,27), 1).
fillpoint(r282, xy(91,25), 1).
fillpoint(r282, xy(90,27), 1).
region(r283, '#6f4323', 8, centroid(93,25)).
polygon(r283, [xy(91,24),xy(92,24),xy(92,25),xy(93,25),xy(94,24),xy(94,25),xy(95,25),xy(95,26),xy(91,24)]).
fillpoint(r283, xy(95,26), 1).
fillpoint(r283, xy(95,25), 1).
fillpoint(r283, xy(94,25), 1).
fillpoint(r283, xy(94,24), 1).
fillpoint(r283, xy(93,25), 1).
region(r289, '#2e2017', 6, centroid(25,27)).
polygon(r289, [xy(24,26),xy(24,27),xy(25,26),xy(26,27),xy(25,28),xy(24,26)]).
midline(r289, [xy(25,27)]).
fillpoint(r289, xy(25,27), 2).
fillpoint(r289, xy(26,27), 1).
fillpoint(r289, xy(25,28), 1).
fillpoint(r289, xy(25,26), 1).
fillpoint(r289, xy(24,27), 1).
region(r290, '#2a170b', 48, centroid(43,34)).
polygon(r290, [xy(34,26),xy(34,27),xy(35,27),xy(35,28),xy(36,28),xy(36,30),xy(37,29),xy(37,30),xy(38,29),xy(39,30),xy(38,31),xy(39,32),xy(40,31),xy(40,32),xy(41,31),xy(42,32),xy(41,33),xy(42,33),xy(42,34),xy(43,34),xy(43,35),xy(44,34),xy(45,35),xy(44,36),xy(45,37),xy(46,36),xy(46,35),xy(47,37),xy(46,38),xy(47,39),xy(48,38),xy(48,39),xy(49,39),xy(49,40),xy(55,40),xy(34,26)]).
midline(r290, [xy(38,30),xy(39,31),xy(41,32)]).
midline(r290, [xy(44,35),xy(47,38)]).
fillpoint(r290, xy(47,38), 2).
fillpoint(r290, xy(46,37), 2).
fillpoint(r290, xy(45,36), 2).
fillpoint(r290, xy(44,35), 2).
fillpoint(r290, xy(41,32), 2).
region(r303, '#6f4323', 64, centroid(91,34)).
polygon(r303, [xy(87,34),xy(87,39),xy(88,39),xy(88,40),xy(90,40),xy(91,39),xy(89,37),xy(89,34),xy(88,33),xy(89,32),xy(90,33),xy(91,32),xy(91,31),xy(88,28),xy(88,27),xy(89,27),xy(94,32),xy(94,34),xy(93,35),xy(92,34),xy(91,34),xy(90,35),xy(91,36),xy(89,38),xy(87,34)]).
hole(r303, [xy(88,34),xy(88,38),xy(88,34)]).
hole(r303, [xy(91,35),xy(92,35),xy(92,36),xy(91,35)]).
hole(r303, [xy(91,37),xy(91,38),xy(91,37)]).
midline(r303, [xy(89,28),xy(92,31),xy(92,32),xy(90,34),xy(89,33)]).
midline(r303, [xy(89,39),xy(90,39)]).
midline(r303, [xy(90,36)]).
midline(r303, [xy(92,33),xy(93,32),xy(93,34),xy(94,35),xy(93,37)]).
fillpoint(r303, xy(94,35), 2).
fillpoint(r303, xy(93,37), 2).
fillpoint(r303, xy(93,34), 2).
fillpoint(r303, xy(93,33), 2).
fillpoint(r303, xy(93,32), 2).
region(r308, '#3d261a', 20, centroid(28,31)).
polygon(r308, [xy(25,29),xy(25,30),xy(26,31),xy(27,31),xy(28,30),xy(26,28),xy(25,29)]).
midline(r308, [xy(26,29),xy(26,30),xy(27,30)]).
midline(r308, [xy(31,32)]).
fillpoint(r308, xy(31,32), 2).
fillpoint(r308, xy(27,30), 2).
fillpoint(r308, xy(26,30), 2).
fillpoint(r308, xy(26,29), 2).
fillpoint(r308, xy(33,32), 1).
region(r324, '#6f4323', 4, centroid(87,30)).
polygon(r324, [xy(87,29),xy(87,31),xy(88,31),xy(87,29)]).
fillpoint(r324, xy(88,31), 1).
fillpoint(r324, xy(87,31), 1).
fillpoint(r324, xy(87,30), 1).
fillpoint(r324, xy(87,29), 1).
region(r325, '#844622', 6, centroid(89,31)).
polygon(r325, [xy(88,29),xy(88,30),xy(89,30),xy(89,31),xy(90,31),xy(90,32),xy(88,29)]).
fillpoint(r325, xy(90,32), 1).
fillpoint(r325, xy(90,31), 1).
fillpoint(r325, xy(89,31), 1).
fillpoint(r325, xy(89,30), 1).
fillpoint(r325, xy(88,30), 1).
region(r330, '#1b110d', 6, centroid(15,31)).
polygon(r330, [xy(14,30),xy(14,32),xy(15,31),xy(15,30),xy(16,30),xy(14,30)]).
fillpoint(r330, xy(16,30), 1).
fillpoint(r330, xy(15,31), 1).
fillpoint(r330, xy(15,30), 1).
fillpoint(r330, xy(14,32), 1).
fillpoint(r330, xy(14,31), 1).
region(r350, '#cd9979', 9, centroid(83,33)).
polygon(r350, [xy(82,34),xy(82,35),xy(83,34),xy(83,31),xy(84,31),xy(84,32),xy(82,34)]).
fillpoint(r350, xy(84,32), 1).
fillpoint(r350, xy(84,31), 1).
fillpoint(r350, xy(83,35), 1).
fillpoint(r350, xy(83,34), 1).
fillpoint(r350, xy(83,33), 1).
region(r352, '#512713', 4, centroid(95,32)).
polygon(r352, [xy(94,31),xy(95,31),xy(95,33),xy(94,31)]).
fillpoint(r352, xy(95,33), 1).
fillpoint(r352, xy(95,32), 1).
fillpoint(r352, xy(95,31), 1).
fillpoint(r352, xy(94,31), 1).
region(r354, '#1b110d', 31, centroid(19,37)).
polygon(r354, [xy(16,40),xy(17,39),xy(17,38),xy(18,37),xy(18,36),xy(17,35),xy(17,34),xy(19,32),xy(19,34),xy(18,35),xy(19,36),xy(20,35),xy(20,37),xy(21,38),xy(21,39),xy(20,40),xy(17,40),xy(16,40)]).
midline(r354, [xy(18,34)]).
midline(r354, [xy(19,38)]).
fillpoint(r354, xy(19,38), 3).
fillpoint(r354, xy(20,39), 2).
fillpoint(r354, xy(20,38), 2).
fillpoint(r354, xy(19,39), 2).
fillpoint(r354, xy(19,37), 2).
region(r356, '#2e2017', 5, centroid(28,33)).
polygon(r356, [xy(27,32),xy(28,32),xy(28,33),xy(30,33),xy(27,32)]).
fillpoint(r356, xy(30,33), 1).
fillpoint(r356, xy(29,33), 1).
fillpoint(r356, xy(28,33), 1).
fillpoint(r356, xy(28,32), 1).
fillpoint(r356, xy(27,32), 1).
region(r357, '#2e2017', 10, centroid(33,33)).
polygon(r357, [xy(31,34),xy(32,33),xy(32,34),xy(33,33),xy(33,34),xy(34,34),xy(35,33),xy(34,32),xy(35,34),xy(31,34)]).
midline(r357, [xy(34,33)]).
fillpoint(r357, xy(34,33), 2).
fillpoint(r357, xy(35,34), 1).
fillpoint(r357, xy(35,33), 1).
fillpoint(r357, xy(34,34), 1).
fillpoint(r357, xy(34,32), 1).
region(r358, '#2e2017', 8, centroid(45,33)).
polygon(r358, [xy(43,32),xy(43,33),xy(44,32),xy(44,33),xy(45,33),xy(45,34),xy(46,33),xy(46,34),xy(43,32)]).
fillpoint(r358, xy(46,34), 1).
fillpoint(r358, xy(46,33), 1).
fillpoint(r358, xy(45,34), 1).
fillpoint(r358, xy(45,33), 1).
fillpoint(r358, xy(44,33), 1).
region(r360, '#563b2c', 4, centroid(49,32)).
polygon(r360, [xy(47,32),xy(50,32),xy(47,32)]).
fillpoint(r360, xy(50,32), 1).
fillpoint(r360, xy(49,32), 1).
fillpoint(r360, xy(48,32), 1).
fillpoint(r360, xy(47,32), 1).
region(r361, '#6f4323', 31, centroid(71,36)).
polygon(r361, [xy(68,37),xy(69,36),xy(69,32),xy(71,32),xy(71,34),xy(72,35),xy(71,36),xy(72,37),xy(72,38),xy(71,39),xy(70,39),xy(69,38),xy(69,39),xy(68,37)]).
midline(r361, [xy(70,33),xy(70,35),xy(71,35),xy(70,37)]).
fillpoint(r361, xy(70,37), 3).
fillpoint(r361, xy(71,38), 2).
fillpoint(r361, xy(71,37), 2).
fillpoint(r361, xy(71,35), 2).
fillpoint(r361, xy(70,38), 2).
region(r362, '#512713', 47, centroid(82,38)).
polygon(r362, [xy(76,40),xy(77,40),xy(78,39),xy(78,40),xy(80,40),xy(81,39),xy(81,38),xy(79,36),xy(78,37),xy(79,38),xy(80,36),xy(80,35),xy(76,40)]).
midline(r362, [xy(79,37),xy(80,38),xy(79,39),xy(82,39),xy(84,38),xy(84,36),xy(85,35)]).
fillpoint(r362, xy(84,38), 3).
fillpoint(r362, xy(85,39), 2).
fillpoint(r362, xy(85,38), 2).
fillpoint(r362, xy(85,35), 2).
fillpoint(r362, xy(84,39), 2).
region(r366, '#1b110d', 10, centroid(1,34)).
polygon(r366, [xy(0,33),xy(0,35),xy(1,34),xy(2,34),xy(2,35),xy(3,34),xy(3,33),xy(0,33)]).
midline(r366, [xy(1,35)]).
fillpoint(r366, xy(1,35), 2).
fillpoint(r366, xy(3,34), 1).
fillpoint(r366, xy(3,33), 1).
fillpoint(r366, xy(2,35), 1).
fillpoint(r366, xy(2,34), 1).
region(r368, '#3d261a', 30, centroid(50,36)).
polygon(r368, [xy(47,33),xy(47,36),xy(49,34),xy(48,33),xy(51,33),xy(51,34),xy(48,37),xy(49,38),xy(50,37),xy(51,38),xy(50,39),xy(51,39),xy(52,38),xy(52,39),xy(54,39),xy(47,33)]).
midline(r368, [xy(48,34),xy(48,36),xy(50,38)]).
midline(r368, [xy(50,34)]).
fillpoint(r368, xy(50,38), 2).
fillpoint(r368, xy(50,34), 2).
fillpoint(r368, xy(49,37), 2).
fillpoint(r368, xy(48,36), 2).
fillpoint(r368, xy(48,34), 2).
region(r369, '#512713', 124, centroid(61,37)).
polygon(r369, [xy(50,36),xy(51,35),xy(52,35),xy(53,34),xy(63,34),xy(64,33),xy(67,33),xy(67,34),xy(66,35),xy(67,36),xy(67,37),xy(68,36),xy(68,33),xy(50,36)]).
midline(r369, [xy(51,36),xy(55,36),xy(55,37),xy(56,36),xy(56,37),xy(63,37),xy(64,36),xy(64,37),xy(66,38)]).
midline(r369, [xy(66,34)]).
fillpoint(r369, xy(64,37), 4).
fillpoint(r369, xy(64,36), 4).
fillpoint(r369, xy(63,37), 4).
fillpoint(r369, xy(62,37), 4).
fillpoint(r369, xy(61,37), 4).
region(r376, '#844622', 5, centroid(88,36)).
polygon(r376, [xy(88,34),xy(88,38),xy(88,34)]).
fillpoint(r376, xy(88,38), 1).
fillpoint(r376, xy(88,37), 1).
fillpoint(r376, xy(88,36), 1).
fillpoint(r376, xy(88,35), 1).
fillpoint(r376, xy(88,34), 1).
region(r379, '#1b110d', 5, centroid(34,35)).
polygon(r379, [xy(32,35),xy(36,35),xy(32,35)]).
fillpoint(r379, xy(36,35), 1).
fillpoint(r379, xy(35,35), 1).
fillpoint(r379, xy(34,35), 1).
fillpoint(r379, xy(33,35), 1).
fillpoint(r379, xy(32,35), 1).
region(r390, '#1b110d', 5, centroid(36,38)).
polygon(r390, [xy(35,38),xy(35,39),xy(36,38),xy(38,38),xy(35,38)]).
fillpoint(r390, xy(38,38), 1).
fillpoint(r390, xy(37,38), 1).
fillpoint(r390, xy(36,38), 1).
fillpoint(r390, xy(35,39), 1).
fillpoint(r390, xy(35,38), 1).
region(r394, '#3d261a', 7, centroid(94,39)).
polygon(r394, [xy(92,40),xy(93,39),xy(93,40),xy(94,39),xy(94,40),xy(95,39),xy(95,38),xy(92,40)]).
fillpoint(r394, xy(95,39), 1).
fillpoint(r394, xy(95,38), 1).
fillpoint(r394, xy(94,40), 1).
fillpoint(r394, xy(94,39), 1).
fillpoint(r394, xy(93,40), 1).
region(r395, '#2e2017', 7, centroid(38,40)).
polygon(r395, [xy(36,39),xy(37,39),xy(37,40),xy(38,39),xy(38,40),xy(40,40),xy(36,39)]).
fillpoint(r395, xy(40,40), 1).
fillpoint(r395, xy(39,40), 1).
fillpoint(r395, xy(38,40), 1).
fillpoint(r395, xy(38,39), 1).
fillpoint(r395, xy(37,40), 1).
adjacent(r1, r2).
shared_edge(r1, r2, 9).
adjacent(r1, r57).
shared_edge(r1, r57, 4).
adjacent(r1, r68).
shared_edge(r1, r68, 9).
adjacent(r1, r75).
shared_edge(r1, r75, 2).
adjacent(r10, r11).
shared_edge(r10, r11, 1).
adjacent(r10, r9).
shared_edge(r10, r9, 2).
adjacent(r100, r101).
shared_edge(r100, r101, 1).
adjacent(r100, r71).
shared_edge(r100, r71, 1).
adjacent(r100, r99).
shared_edge(r100, r99, 2).
adjacent(r101, r111).
shared_edge(r101, r111, 1).
adjacent(r101, r71).
shared_edge(r101, r71, 2).
adjacent(r102, r117).
shared_edge(r102, r117, 1).
adjacent(r102, r36).
shared_edge(r102, r36, 1).
adjacent(r102, r40).
shared_edge(r102, r40, 2).
adjacent(r103, r104).
shared_edge(r103, r104, 1).
adjacent(r103, r120).
shared_edge(r103, r120, 1).
adjacent(r103, r40).
shared_edge(r103, r40, 2).
adjacent(r104, r105).
shared_edge(r104, r105, 1).
adjacent(r104, r40).
shared_edge(r104, r40, 1).
adjacent(r104, r82).
shared_edge(r104, r82, 1).
adjacent(r105, r40).
shared_edge(r105, r40, 1).
adjacent(r105, r82).
shared_edge(r105, r82, 2).
adjacent(r106, r107).
shared_edge(r106, r107, 1).
adjacent(r106, r83).
shared_edge(r106, r83, 2).
adjacent(r106, r85).
shared_edge(r106, r85, 1).
adjacent(r107, r123).
shared_edge(r107, r123, 1).
adjacent(r107, r45).
shared_edge(r107, r45, 2).
adjacent(r108, r125).
shared_edge(r108, r125, 1).
adjacent(r108, r30).
shared_edge(r108, r30, 2).
adjacent(r108, r45).
shared_edge(r108, r45, 1).
adjacent(r109, r136).
shared_edge(r109, r136, 1).
adjacent(r109, r137).
shared_edge(r109, r137, 3).
adjacent(r109, r156).
shared_edge(r109, r156, 4).
adjacent(r109, r158).
shared_edge(r109, r158, 1).
adjacent(r109, r30).
shared_edge(r109, r30, 11).
adjacent(r11, r12).
shared_edge(r11, r12, 1).
adjacent(r11, r35).
shared_edge(r11, r35, 4).
adjacent(r11, r36).
shared_edge(r11, r36, 1).
adjacent(r11, r9).
shared_edge(r11, r9, 2).
adjacent(r110, r3).
shared_edge(r110, r3, 2).
adjacent(r110, r99).
shared_edge(r110, r99, 2).
adjacent(r111, r112).
shared_edge(r111, r112, 1).
adjacent(r111, r99).
shared_edge(r111, r99, 2).
adjacent(r112, r129).
shared_edge(r112, r129, 2).
adjacent(r112, r71).
shared_edge(r112, r71, 5).
adjacent(r113, r114).
shared_edge(r113, r114, 2).
adjacent(r113, r130).
shared_edge(r113, r130, 1).
adjacent(r113, r142).
shared_edge(r113, r142, 1).
adjacent(r113, r165).
shared_edge(r113, r165, 3).
adjacent(r113, r166).
shared_edge(r113, r166, 1).
adjacent(r113, r182).
shared_edge(r113, r182, 1).
adjacent(r113, r9).
shared_edge(r113, r9, 5).
adjacent(r114, r115).
shared_edge(r114, r115, 1).
adjacent(r114, r9).
shared_edge(r114, r9, 1).
adjacent(r115, r116).
shared_edge(r115, r116, 1).
adjacent(r115, r130).
shared_edge(r115, r130, 1).
adjacent(r115, r9).
shared_edge(r115, r9, 1).
adjacent(r116, r117).
shared_edge(r116, r117, 2).
adjacent(r116, r131).
shared_edge(r116, r131, 2).
adjacent(r116, r144).
shared_edge(r116, r144, 1).
adjacent(r116, r145).
shared_edge(r116, r145, 1).
adjacent(r116, r36).
shared_edge(r116, r36, 3).
adjacent(r117, r118).
shared_edge(r117, r118, 1).
adjacent(r117, r132).
shared_edge(r117, r132, 1).
adjacent(r117, r146).
shared_edge(r117, r146, 1).
adjacent(r117, r147).
shared_edge(r117, r147, 1).
adjacent(r117, r40).
shared_edge(r117, r40, 1).
adjacent(r118, r119).
shared_edge(r118, r119, 1).
adjacent(r118, r132).
shared_edge(r118, r132, 1).
adjacent(r118, r40).
shared_edge(r118, r40, 1).
adjacent(r119, r120).
shared_edge(r119, r120, 1).
adjacent(r119, r40).
shared_edge(r119, r40, 1).
adjacent(r119, r82).
shared_edge(r119, r82, 1).
adjacent(r12, r13).
shared_edge(r12, r13, 1).
adjacent(r12, r37).
shared_edge(r12, r37, 1).
adjacent(r120, r82).
shared_edge(r120, r82, 2).
adjacent(r121, r122).
shared_edge(r121, r122, 4).
adjacent(r121, r133).
shared_edge(r121, r133, 71).
adjacent(r121, r134).
shared_edge(r121, r134, 3).
adjacent(r121, r150).
shared_edge(r121, r150, 1).
adjacent(r121, r151).
shared_edge(r121, r151, 3).
adjacent(r121, r170).
shared_edge(r121, r170, 3).
adjacent(r121, r191).
shared_edge(r121, r191, 2).
adjacent(r121, r202).
shared_edge(r121, r202, 2).
adjacent(r121, r213).
shared_edge(r121, r213, 2).
adjacent(r121, r219).
shared_edge(r121, r219, 2).
adjacent(r121, r225).
shared_edge(r121, r225, 2).
adjacent(r121, r232).
shared_edge(r121, r232, 3).
adjacent(r121, r243).
shared_edge(r121, r243, 3).
adjacent(r121, r257).
shared_edge(r121, r257, 11).
adjacent(r121, r278).
shared_edge(r121, r278, 1).
adjacent(r121, r337).
shared_edge(r121, r337, 1).
adjacent(r121, r349).
shared_edge(r121, r349, 2).
adjacent(r121, r361).
shared_edge(r121, r361, 4).
adjacent(r121, r368).
shared_edge(r121, r368, 1).
adjacent(r121, r369).
shared_edge(r121, r369, 17).
adjacent(r121, r82).
shared_edge(r121, r82, 10).
adjacent(r121, r83).
shared_edge(r121, r83, 8).
adjacent(r122, r83).
shared_edge(r122, r83, 4).
adjacent(r123, r124).
shared_edge(r123, r124, 1).
adjacent(r123, r83).
shared_edge(r123, r83, 2).
adjacent(r124, r125).
shared_edge(r124, r125, 1).
adjacent(r124, r45).
shared_edge(r124, r45, 1).
adjacent(r124, r83).
shared_edge(r124, r83, 1).
adjacent(r125, r30).
shared_edge(r125, r30, 1).
adjacent(r125, r83).
shared_edge(r125, r83, 1).
adjacent(r126, r127).
shared_edge(r126, r127, 1).
adjacent(r126, r75).
shared_edge(r126, r75, 2).
adjacent(r126, r96).
shared_edge(r126, r96, 1).
adjacent(r127, r160).
shared_edge(r127, r160, 1).
adjacent(r127, r75).
shared_edge(r127, r75, 3).
adjacent(r127, r97).
shared_edge(r127, r97, 5).
adjacent(r128, r3).
shared_edge(r128, r3, 2).
adjacent(r128, r99).
shared_edge(r128, r99, 2).
adjacent(r129, r141).
shared_edge(r129, r141, 1).
adjacent(r129, r99).
shared_edge(r129, r99, 1).
adjacent(r13, r14).
shared_edge(r13, r14, 1).
adjacent(r13, r38).
shared_edge(r13, r38, 1).
adjacent(r130, r131).
shared_edge(r130, r131, 1).
adjacent(r130, r142).
shared_edge(r130, r142, 1).
adjacent(r131, r143).
shared_edge(r131, r143, 1).
adjacent(r132, r148).
shared_edge(r132, r148, 1).
adjacent(r132, r82).
shared_edge(r132, r82, 1).
adjacent(r133, r149).
shared_edge(r133, r149, 1).
adjacent(r133, r150).
shared_edge(r133, r150, 2).
adjacent(r133, r168).
shared_edge(r133, r168, 1).
adjacent(r133, r169).
shared_edge(r133, r169, 2).
adjacent(r133, r185).
shared_edge(r133, r185, 2).
adjacent(r133, r189).
shared_edge(r133, r189, 2).
adjacent(r133, r190).
shared_edge(r133, r190, 98).
adjacent(r133, r201).
shared_edge(r133, r201, 2).
adjacent(r133, r211).
shared_edge(r133, r211, 2).
adjacent(r133, r224).
shared_edge(r133, r224, 11).
adjacent(r133, r292).
shared_edge(r133, r292, 2).
adjacent(r133, r300).
shared_edge(r133, r300, 2).
adjacent(r133, r312).
shared_edge(r133, r312, 2).
adjacent(r133, r322).
shared_edge(r133, r322, 2).
adjacent(r133, r335).
shared_edge(r133, r335, 1).
adjacent(r133, r336).
shared_edge(r133, r336, 3).
adjacent(r133, r347).
shared_edge(r133, r347, 1).
adjacent(r133, r348).
shared_edge(r133, r348, 3).
adjacent(r133, r359).
shared_edge(r133, r359, 1).
adjacent(r133, r360).
shared_edge(r133, r360, 5).
adjacent(r133, r368).
shared_edge(r133, r368, 2).
adjacent(r134, r83).
shared_edge(r134, r83, 3).
adjacent(r135, r136).
shared_edge(r135, r136, 1).
adjacent(r135, r152).
shared_edge(r135, r152, 1).
adjacent(r135, r30).
shared_edge(r135, r30, 1).
adjacent(r135, r83).
shared_edge(r135, r83, 1).
adjacent(r136, r153).
shared_edge(r136, r153, 1).
adjacent(r136, r154).
shared_edge(r136, r154, 1).
adjacent(r136, r155).
shared_edge(r136, r155, 1).
adjacent(r136, r30).
shared_edge(r136, r30, 3).
adjacent(r137, r157).
shared_edge(r137, r157, 1).
adjacent(r138, r30).
shared_edge(r138, r30, 4).
adjacent(r139, r75).
shared_edge(r139, r75, 3).
adjacent(r14, r15).
shared_edge(r14, r15, 1).
adjacent(r14, r39).
shared_edge(r14, r39, 5).
adjacent(r140, r3).
shared_edge(r140, r3, 2).
adjacent(r140, r99).
shared_edge(r140, r99, 2).
adjacent(r141, r162).
shared_edge(r141, r162, 1).
adjacent(r141, r71).
shared_edge(r141, r71, 1).
adjacent(r141, r99).
shared_edge(r141, r99, 1).
adjacent(r142, r143).
shared_edge(r142, r143, 1).
adjacent(r142, r166).
shared_edge(r142, r166, 1).
adjacent(r143, r144).
shared_edge(r143, r144, 1).
adjacent(r143, r167).
shared_edge(r143, r167, 1).
adjacent(r144, r145).
shared_edge(r144, r145, 2).
adjacent(r144, r146).
shared_edge(r144, r146, 1).
adjacent(r144, r167).
shared_edge(r144, r167, 1).
adjacent(r144, r184).
shared_edge(r144, r184, 1).
adjacent(r144, r185).
shared_edge(r144, r185, 1).
adjacent(r145, r146).
shared_edge(r145, r146, 1).
adjacent(r146, r147).
shared_edge(r146, r147, 1).
adjacent(r146, r148).
shared_edge(r146, r148, 1).
adjacent(r146, r185).
shared_edge(r146, r185, 1).
adjacent(r147, r148).
shared_edge(r147, r148, 2).
adjacent(r148, r186).
shared_edge(r148, r186, 2).
adjacent(r148, r187).
shared_edge(r148, r187, 2).
adjacent(r148, r200).
shared_edge(r148, r200, 1).
adjacent(r148, r82).
shared_edge(r148, r82, 3).
adjacent(r149, r150).
shared_edge(r149, r150, 1).
adjacent(r149, r169).
shared_edge(r149, r169, 1).
adjacent(r149, r82).
shared_edge(r149, r82, 3).
adjacent(r15, r16).
shared_edge(r15, r16, 1).
adjacent(r15, r40).
shared_edge(r15, r40, 1).
adjacent(r151, r83).
shared_edge(r151, r83, 3).
adjacent(r152, r153).
shared_edge(r152, r153, 1).
adjacent(r152, r83).
shared_edge(r152, r83, 2).
adjacent(r153, r154).
shared_edge(r153, r154, 1).
adjacent(r153, r171).
shared_edge(r153, r171, 1).
adjacent(r154, r155).
shared_edge(r154, r155, 1).
adjacent(r154, r171).
shared_edge(r154, r171, 1).
adjacent(r155, r156).
shared_edge(r155, r156, 1).
adjacent(r155, r172).
shared_edge(r155, r172, 1).
adjacent(r156, r157).
shared_edge(r156, r157, 1).
adjacent(r156, r173).
shared_edge(r156, r173, 4).
adjacent(r157, r158).
shared_edge(r157, r158, 1).
adjacent(r157, r173).
shared_edge(r157, r173, 1).
adjacent(r158, r174).
shared_edge(r158, r174, 1).
adjacent(r158, r30).
shared_edge(r158, r30, 1).
adjacent(r159, r75).
shared_edge(r159, r75, 12).
adjacent(r16, r17).
shared_edge(r16, r17, 9).
adjacent(r16, r40).
shared_edge(r16, r40, 10).
adjacent(r16, r79).
shared_edge(r16, r79, 1).
adjacent(r16, r90).
shared_edge(r16, r90, 1).
adjacent(r16, r91).
shared_edge(r16, r91, 1).
adjacent(r160, r161).
shared_edge(r160, r161, 1).
adjacent(r160, r176).
shared_edge(r160, r176, 1).
adjacent(r160, r75).
shared_edge(r160, r75, 1).
adjacent(r161, r176).
shared_edge(r161, r176, 1).
adjacent(r161, r97).
shared_edge(r161, r97, 2).
adjacent(r162, r178).
shared_edge(r162, r178, 1).
adjacent(r162, r179).
shared_edge(r162, r179, 1).
adjacent(r162, r3).
shared_edge(r162, r3, 1).
adjacent(r162, r71).
shared_edge(r162, r71, 1).
adjacent(r162, r99).
shared_edge(r162, r99, 1).
adjacent(r163, r164).
shared_edge(r163, r164, 2).
adjacent(r163, r175).
shared_edge(r163, r175, 15).
adjacent(r163, r178).
shared_edge(r163, r178, 15).
adjacent(r163, r180).
shared_edge(r163, r180, 2).
adjacent(r163, r181).
shared_edge(r163, r181, 1).
adjacent(r163, r195).
shared_edge(r163, r195, 2).
adjacent(r163, r196).
shared_edge(r163, r196, 1).
adjacent(r163, r217).
shared_edge(r163, r217, 36).
adjacent(r163, r218).
shared_edge(r163, r218, 8).
adjacent(r163, r266).
shared_edge(r163, r266, 1).
adjacent(r163, r270).
shared_edge(r163, r270, 2).
adjacent(r163, r276).
shared_edge(r163, r276, 2).
adjacent(r163, r285).
shared_edge(r163, r285, 1).
adjacent(r163, r289).
shared_edge(r163, r289, 5).
adjacent(r163, r290).
shared_edge(r163, r290, 27).
adjacent(r163, r308).
shared_edge(r163, r308, 1).
adjacent(r163, r309).
shared_edge(r163, r309, 1).
adjacent(r163, r334).
shared_edge(r163, r334, 2).
adjacent(r163, r345).
shared_edge(r163, r345, 1).
adjacent(r163, r357).
shared_edge(r163, r357, 4).
adjacent(r163, r374).
shared_edge(r163, r374, 2).
adjacent(r163, r71).
shared_edge(r163, r71, 3).
adjacent(r164, r165).
shared_edge(r164, r165, 1).
adjacent(r164, r9).
shared_edge(r164, r9, 1).
adjacent(r165, r180).
shared_edge(r165, r180, 1).
adjacent(r165, r181).
shared_edge(r165, r181, 1).
adjacent(r166, r167).
shared_edge(r166, r167, 1).
adjacent(r166, r183).
shared_edge(r166, r183, 1).
adjacent(r167, r183).
shared_edge(r167, r183, 1).
adjacent(r168, r169).
shared_edge(r168, r169, 1).
adjacent(r168, r189).
shared_edge(r168, r189, 1).
adjacent(r168, r82).
shared_edge(r168, r82, 3).
adjacent(r17, r18).
shared_edge(r17, r18, 1).
adjacent(r17, r41).
shared_edge(r17, r41, 1).
adjacent(r17, r51).
shared_edge(r17, r51, 2).
adjacent(r17, r61).
shared_edge(r17, r61, 4).
adjacent(r17, r62).
shared_edge(r17, r62, 1).
adjacent(r17, r72).
shared_edge(r17, r72, 2).
adjacent(r17, r79).
shared_edge(r17, r79, 1).
adjacent(r170, r83).
shared_edge(r170, r83, 3).
adjacent(r171, r172).
shared_edge(r171, r172, 2).
adjacent(r171, r173).
shared_edge(r171, r173, 2).
adjacent(r171, r192).
shared_edge(r171, r192, 2).
adjacent(r171, r214).
shared_edge(r171, r214, 2).
adjacent(r171, r220).
shared_edge(r171, r220, 1).
adjacent(r171, r226).
shared_edge(r171, r226, 2).
adjacent(r171, r227).
shared_edge(r171, r227, 2).
adjacent(r171, r233).
shared_edge(r171, r233, 13).
adjacent(r171, r234).
shared_edge(r171, r234, 1).
adjacent(r171, r239).
shared_edge(r171, r239, 1).
adjacent(r171, r244).
shared_edge(r171, r244, 2).
adjacent(r171, r245).
shared_edge(r171, r245, 3).
adjacent(r171, r271).
shared_edge(r171, r271, 2).
adjacent(r171, r277).
shared_edge(r171, r277, 1).
adjacent(r171, r278).
shared_edge(r171, r278, 1).
adjacent(r171, r287).
shared_edge(r171, r287, 1).
adjacent(r171, r83).
shared_edge(r171, r83, 6).
adjacent(r172, r173).
shared_edge(r172, r173, 1).
adjacent(r173, r174).
shared_edge(r173, r174, 2).
adjacent(r173, r192).
shared_edge(r173, r192, 2).
adjacent(r173, r203).
shared_edge(r173, r203, 2).
adjacent(r173, r214).
shared_edge(r173, r214, 1).
adjacent(r173, r215).
shared_edge(r173, r215, 1).
adjacent(r174, r203).
shared_edge(r174, r203, 1).
adjacent(r174, r30).
shared_edge(r174, r30, 6).
adjacent(r175, r176).
shared_edge(r175, r176, 6).
adjacent(r175, r178).
shared_edge(r175, r178, 1).
adjacent(r175, r204).
shared_edge(r175, r204, 2).
adjacent(r175, r207).
shared_edge(r175, r207, 9).
adjacent(r175, r264).
shared_edge(r175, r264, 14).
adjacent(r175, r265).
shared_edge(r175, r265, 14).
adjacent(r175, r298).
shared_edge(r175, r298, 6).
adjacent(r175, r329).
shared_edge(r175, r329, 2).
adjacent(r175, r330).
shared_edge(r175, r330, 12).
adjacent(r175, r331).
shared_edge(r175, r331, 2).
adjacent(r175, r342).
shared_edge(r175, r342, 2).
adjacent(r175, r343).
shared_edge(r175, r343, 2).
adjacent(r175, r353).
shared_edge(r175, r353, 2).
adjacent(r175, r354).
shared_edge(r175, r354, 26).
adjacent(r175, r355).
shared_edge(r175, r355, 2).
adjacent(r175, r356).
shared_edge(r175, r356, 2).
adjacent(r175, r357).
shared_edge(r175, r357, 1).
adjacent(r175, r366).
shared_edge(r175, r366, 9).
adjacent(r175, r367).
shared_edge(r175, r367, 2).
adjacent(r175, r373).
shared_edge(r175, r373, 2).
adjacent(r175, r379).
shared_edge(r175, r379, 7).
adjacent(r175, r390).
shared_edge(r175, r390, 8).
adjacent(r175, r396).
shared_edge(r175, r396, 1).
adjacent(r175, r397).
shared_edge(r175, r397, 2).
adjacent(r175, r402).
shared_edge(r175, r402, 1).
adjacent(r175, r403).
shared_edge(r175, r403, 1).
adjacent(r175, r404).
shared_edge(r175, r404, 2).
adjacent(r175, r405).
shared_edge(r175, r405, 1).
adjacent(r175, r75).
shared_edge(r175, r75, 29).
adjacent(r176, r177).
shared_edge(r176, r177, 3).
adjacent(r176, r194).
shared_edge(r176, r194, 1).
adjacent(r177, r97).
shared_edge(r177, r97, 3).
adjacent(r178, r179).
shared_edge(r178, r179, 3).
adjacent(r178, r207).
shared_edge(r178, r207, 9).
adjacent(r178, r265).
shared_edge(r178, r265, 8).
adjacent(r178, r3).
shared_edge(r178, r3, 2).
adjacent(r178, r97).
shared_edge(r178, r97, 1).
adjacent(r18, r19).
shared_edge(r18, r19, 1).
adjacent(r18, r41).
shared_edge(r18, r41, 1).
adjacent(r180, r181).
shared_edge(r180, r181, 1).
adjacent(r181, r182).
shared_edge(r181, r182, 1).
adjacent(r182, r183).
shared_edge(r182, r183, 1).
adjacent(r182, r195).
shared_edge(r182, r195, 1).
adjacent(r183, r184).
shared_edge(r183, r184, 1).
adjacent(r183, r196).
shared_edge(r183, r196, 1).
adjacent(r183, r197).
shared_edge(r183, r197, 1).
adjacent(r184, r185).
shared_edge(r184, r185, 1).
adjacent(r184, r198).
shared_edge(r184, r198, 1).
adjacent(r185, r186).
shared_edge(r185, r186, 2).
adjacent(r185, r199).
shared_edge(r185, r199, 2).
adjacent(r185, r200).
shared_edge(r185, r200, 2).
adjacent(r185, r208).
shared_edge(r185, r208, 1).
adjacent(r185, r210).
shared_edge(r185, r210, 2).
adjacent(r185, r211).
shared_edge(r185, r211, 1).
adjacent(r185, r224).
shared_edge(r185, r224, 1).
adjacent(r187, r188).
shared_edge(r187, r188, 1).
adjacent(r187, r200).
shared_edge(r187, r200, 1).
adjacent(r188, r189).
shared_edge(r188, r189, 1).
adjacent(r188, r201).
shared_edge(r188, r201, 1).
adjacent(r188, r82).
shared_edge(r188, r82, 1).
adjacent(r19, r20).
shared_edge(r19, r20, 3).
adjacent(r19, r21).
shared_edge(r19, r21, 3).
adjacent(r19, r22).
shared_edge(r19, r22, 3).
adjacent(r19, r23).
shared_edge(r19, r23, 1).
adjacent(r19, r24).
shared_edge(r19, r24, 1).
adjacent(r19, r41).
shared_edge(r19, r41, 6).
adjacent(r19, r42).
shared_edge(r19, r42, 3).
adjacent(r19, r52).
shared_edge(r19, r52, 3).
adjacent(r19, r53).
shared_edge(r19, r53, 2).
adjacent(r19, r54).
shared_edge(r19, r54, 3).
adjacent(r19, r63).
shared_edge(r19, r63, 2).
adjacent(r19, r64).
shared_edge(r19, r64, 3).
adjacent(r19, r65).
shared_edge(r19, r65, 1).
adjacent(r19, r83).
shared_edge(r19, r83, 2).
adjacent(r190, r212).
shared_edge(r190, r212, 78).
adjacent(r191, r83).
shared_edge(r191, r83, 2).
adjacent(r193, r250).
shared_edge(r193, r250, 1).
adjacent(r193, r264).
shared_edge(r193, r264, 10).
adjacent(r193, r329).
shared_edge(r193, r329, 2).
adjacent(r193, r342).
shared_edge(r193, r342, 2).
adjacent(r193, r353).
shared_edge(r193, r353, 2).
adjacent(r193, r366).
shared_edge(r193, r366, 6).
adjacent(r193, r75).
shared_edge(r193, r75, 22).
adjacent(r194, r204).
shared_edge(r194, r204, 1).
adjacent(r194, r205).
shared_edge(r194, r205, 1).
adjacent(r194, r97).
shared_edge(r194, r97, 3).
adjacent(r195, r196).
shared_edge(r195, r196, 1).
adjacent(r196, r197).
shared_edge(r196, r197, 2).
adjacent(r196, r208).
shared_edge(r196, r208, 2).
adjacent(r196, r218).
shared_edge(r196, r218, 3).
adjacent(r197, r198).
shared_edge(r197, r198, 1).
adjacent(r198, r199).
shared_edge(r198, r199, 1).
adjacent(r198, r208).
shared_edge(r198, r208, 1).
adjacent(r199, r209).
shared_edge(r199, r209, 1).
adjacent(r2, r3).
shared_edge(r2, r3, 12).
adjacent(r2, r76).
shared_edge(r2, r76, 2).
adjacent(r2, r87).
shared_edge(r2, r87, 2).
adjacent(r2, r96).
shared_edge(r2, r96, 2).
adjacent(r200, r201).
shared_edge(r200, r201, 1).
adjacent(r200, r211).
shared_edge(r200, r211, 1).
adjacent(r202, r83).
shared_edge(r202, r83, 2).
adjacent(r203, r216).
shared_edge(r203, r216, 1).
adjacent(r204, r205).
shared_edge(r204, r205, 1).
adjacent(r205, r206).
shared_edge(r205, r206, 1).
adjacent(r205, r207).
shared_edge(r205, r207, 1).
adjacent(r206, r207).
shared_edge(r206, r207, 3).
adjacent(r206, r97).
shared_edge(r206, r97, 2).
adjacent(r208, r209).
shared_edge(r208, r209, 2).
adjacent(r208, r210).
shared_edge(r208, r210, 1).
adjacent(r208, r223).
shared_edge(r208, r223, 2).
adjacent(r208, r224).
shared_edge(r208, r224, 2).
adjacent(r208, r230).
shared_edge(r208, r230, 1).
adjacent(r209, r210).
shared_edge(r209, r210, 1).
adjacent(r213, r83).
shared_edge(r213, r83, 2).
adjacent(r214, r215).
shared_edge(r214, r215, 1).
adjacent(r215, r216).
shared_edge(r215, r216, 1).
adjacent(r215, r220).
shared_edge(r215, r220, 1).
adjacent(r216, r220).
shared_edge(r216, r220, 1).
adjacent(r216, r228).
shared_edge(r216, r228, 1).
adjacent(r216, r30).
shared_edge(r216, r30, 2).
adjacent(r217, r308).
shared_edge(r217, r308, 1).
adjacent(r217, r310).
shared_edge(r217, r310, 2).
adjacent(r217, r321).
shared_edge(r217, r321, 1).
adjacent(r217, r332).
shared_edge(r217, r332, 1).
adjacent(r217, r333).
shared_edge(r217, r333, 1).
adjacent(r218, r223).
shared_edge(r218, r223, 2).
adjacent(r218, r230).
shared_edge(r218, r230, 1).
adjacent(r218, r237).
shared_edge(r218, r237, 3).
adjacent(r218, r251).
shared_edge(r218, r251, 2).
adjacent(r218, r252).
shared_edge(r218, r252, 1).
adjacent(r219, r83).
shared_edge(r219, r83, 2).
adjacent(r220, r227).
shared_edge(r220, r227, 1).
adjacent(r221, r229).
shared_edge(r221, r229, 1).
adjacent(r221, r30).
shared_edge(r221, r30, 3).
adjacent(r222, r75).
shared_edge(r222, r75, 4).
adjacent(r224, r231).
shared_edge(r224, r231, 4).
adjacent(r224, r242).
shared_edge(r224, r242, 6).
adjacent(r224, r285).
shared_edge(r224, r285, 1).
adjacent(r224, r291).
shared_edge(r224, r291, 1).
adjacent(r225, r226).
shared_edge(r225, r226, 1).
adjacent(r225, r83).
shared_edge(r225, r83, 1).
adjacent(r226, r232).
shared_edge(r226, r232, 1).
adjacent(r227, r228).
shared_edge(r227, r228, 1).
adjacent(r228, r234).
shared_edge(r228, r234, 1).
adjacent(r228, r30).
shared_edge(r228, r30, 1).
adjacent(r229, r30).
shared_edge(r229, r30, 3).
adjacent(r23, r24).
shared_edge(r23, r24, 2).
adjacent(r230, r231).
shared_edge(r230, r231, 1).
adjacent(r230, r238).
shared_edge(r230, r238, 1).
adjacent(r231, r238).
shared_edge(r231, r238, 1).
adjacent(r232, r233).
shared_edge(r232, r233, 2).
adjacent(r233, r243).
shared_edge(r233, r243, 3).
adjacent(r233, r257).
shared_edge(r233, r257, 8).
adjacent(r233, r277).
shared_edge(r233, r277, 2).
adjacent(r234, r235).
shared_edge(r234, r235, 1).
adjacent(r234, r239).
shared_edge(r234, r239, 1).
adjacent(r235, r30).
shared_edge(r235, r30, 3).
adjacent(r236, r75).
shared_edge(r236, r75, 6).
adjacent(r237, r238).
shared_edge(r237, r238, 1).
adjacent(r237, r242).
shared_edge(r237, r242, 1).
adjacent(r237, r252).
shared_edge(r237, r252, 1).
adjacent(r238, r242).
shared_edge(r238, r242, 1).
adjacent(r239, r244).
shared_edge(r239, r244, 1).
adjacent(r239, r30).
shared_edge(r239, r30, 1).
adjacent(r24, r25).
shared_edge(r24, r25, 5).
adjacent(r24, r55).
shared_edge(r24, r55, 2).
adjacent(r24, r65).
shared_edge(r24, r65, 3).
adjacent(r24, r66).
shared_edge(r24, r66, 1).
adjacent(r24, r83).
shared_edge(r24, r83, 1).
adjacent(r24, r84).
shared_edge(r24, r84, 1).
adjacent(r24, r93).
shared_edge(r24, r93, 1).
adjacent(r240, r247).
shared_edge(r240, r247, 1).
adjacent(r240, r30).
shared_edge(r240, r30, 3).
adjacent(r241, r248).
shared_edge(r241, r248, 1).
adjacent(r241, r249).
shared_edge(r241, r249, 4).
adjacent(r241, r255).
shared_edge(r241, r255, 2).
adjacent(r241, r256).
shared_edge(r241, r256, 1).
adjacent(r241, r259).
shared_edge(r241, r259, 1).
adjacent(r241, r260).
shared_edge(r241, r260, 1).
adjacent(r241, r261).
shared_edge(r241, r261, 2).
adjacent(r241, r262).
shared_edge(r241, r262, 2).
adjacent(r241, r30).
shared_edge(r241, r30, 10).
adjacent(r242, r252).
shared_edge(r242, r252, 2).
adjacent(r242, r267).
shared_edge(r242, r267, 2).
adjacent(r242, r276).
shared_edge(r242, r276, 1).
adjacent(r242, r285).
shared_edge(r242, r285, 1).
adjacent(r244, r245).
shared_edge(r244, r245, 1).
adjacent(r245, r246).
shared_edge(r245, r246, 1).
adjacent(r245, r248).
shared_edge(r245, r248, 1).
adjacent(r245, r253).
shared_edge(r245, r253, 2).
adjacent(r245, r254).
shared_edge(r245, r254, 2).
adjacent(r245, r258).
shared_edge(r245, r258, 7).
adjacent(r245, r271).
shared_edge(r245, r271, 1).
adjacent(r245, r272).
shared_edge(r245, r272, 2).
adjacent(r245, r279).
shared_edge(r245, r279, 8).
adjacent(r245, r30).
shared_edge(r245, r30, 1).
adjacent(r245, r324).
shared_edge(r245, r324, 1).
adjacent(r245, r339).
shared_edge(r245, r339, 1).
adjacent(r245, r340).
shared_edge(r245, r340, 1).
adjacent(r246, r247).
shared_edge(r246, r247, 1).
adjacent(r246, r253).
shared_edge(r246, r253, 1).
adjacent(r246, r30).
shared_edge(r246, r30, 1).
adjacent(r247, r248).
shared_edge(r247, r248, 1).
adjacent(r247, r254).
shared_edge(r247, r254, 1).
adjacent(r248, r254).
shared_edge(r248, r254, 2).
adjacent(r248, r255).
shared_edge(r248, r255, 1).
adjacent(r248, r258).
shared_edge(r248, r258, 1).
adjacent(r248, r30).
shared_edge(r248, r30, 1).
adjacent(r25, r26).
shared_edge(r25, r26, 1).
adjacent(r25, r43).
shared_edge(r25, r43, 1).
adjacent(r25, r56).
shared_edge(r25, r56, 1).
adjacent(r25, r66).
shared_edge(r25, r66, 3).
adjacent(r250, r75).
shared_edge(r250, r75, 3).
adjacent(r251, r252).
shared_edge(r251, r252, 2).
adjacent(r252, r266).
shared_edge(r252, r266, 1).
adjacent(r252, r267).
shared_edge(r252, r267, 1).
adjacent(r253, r254).
shared_edge(r253, r254, 1).
adjacent(r255, r258).
shared_edge(r255, r258, 1).
adjacent(r256, r263).
shared_edge(r256, r263, 1).
adjacent(r256, r30).
shared_edge(r256, r30, 2).
adjacent(r257, r278).
shared_edge(r257, r278, 1).
adjacent(r257, r286).
shared_edge(r257, r286, 1).
adjacent(r257, r293).
shared_edge(r257, r293, 2).
adjacent(r257, r301).
shared_edge(r257, r301, 2).
adjacent(r257, r313).
shared_edge(r257, r313, 1).
adjacent(r257, r323).
shared_edge(r257, r323, 2).
adjacent(r257, r337).
shared_edge(r257, r337, 1).
adjacent(r257, r338).
shared_edge(r257, r338, 1).
adjacent(r258, r259).
shared_edge(r258, r259, 2).
adjacent(r258, r272).
shared_edge(r258, r272, 2).
adjacent(r258, r273).
shared_edge(r258, r273, 1).
adjacent(r258, r280).
shared_edge(r258, r280, 2).
adjacent(r258, r295).
shared_edge(r258, r295, 1).
adjacent(r258, r303).
shared_edge(r258, r303, 1).
adjacent(r258, r314).
shared_edge(r258, r314, 2).
adjacent(r259, r260).
shared_edge(r259, r260, 1).
adjacent(r259, r263).
shared_edge(r259, r263, 1).
adjacent(r259, r273).
shared_edge(r259, r273, 1).
adjacent(r26, r27).
shared_edge(r26, r27, 1).
adjacent(r26, r43).
shared_edge(r26, r43, 1).
adjacent(r260, r261).
shared_edge(r260, r261, 1).
adjacent(r260, r263).
shared_edge(r260, r263, 1).
adjacent(r261, r262).
shared_edge(r261, r262, 1).
adjacent(r261, r263).
shared_edge(r261, r263, 2).
adjacent(r262, r263).
shared_edge(r262, r263, 2).
adjacent(r262, r268).
shared_edge(r262, r268, 1).
adjacent(r263, r268).
shared_edge(r263, r268, 3).
adjacent(r263, r269).
shared_edge(r263, r269, 1).
adjacent(r263, r273).
shared_edge(r263, r273, 1).
adjacent(r263, r274).
shared_edge(r263, r274, 3).
adjacent(r263, r275).
shared_edge(r263, r275, 1).
adjacent(r263, r281).
shared_edge(r263, r281, 1).
adjacent(r263, r283).
shared_edge(r263, r283, 6).
adjacent(r263, r30).
shared_edge(r263, r30, 1).
adjacent(r265, r289).
shared_edge(r265, r289, 4).
adjacent(r265, r320).
shared_edge(r265, r320, 2).
adjacent(r266, r267).
shared_edge(r266, r267, 1).
adjacent(r266, r270).
shared_edge(r266, r270, 1).
adjacent(r267, r270).
shared_edge(r267, r270, 1).
adjacent(r267, r276).
shared_edge(r267, r276, 1).
adjacent(r269, r275).
shared_edge(r269, r275, 1).
adjacent(r269, r30).
shared_edge(r269, r30, 1).
adjacent(r27, r28).
shared_edge(r27, r28, 1).
adjacent(r27, r44).
shared_edge(r27, r44, 1).
adjacent(r271, r278).
shared_edge(r271, r278, 1).
adjacent(r273, r280).
shared_edge(r273, r280, 1).
adjacent(r274, r282).
shared_edge(r274, r282, 1).
adjacent(r275, r284).
shared_edge(r275, r284, 1).
adjacent(r277, r286).
shared_edge(r277, r286, 1).
adjacent(r278, r279).
shared_edge(r278, r279, 7).
adjacent(r278, r287).
shared_edge(r278, r287, 2).
adjacent(r278, r294).
shared_edge(r278, r294, 2).
adjacent(r278, r302).
shared_edge(r278, r302, 2).
adjacent(r278, r313).
shared_edge(r278, r313, 2).
adjacent(r278, r323).
shared_edge(r278, r323, 2).
adjacent(r278, r337).
shared_edge(r278, r337, 1).
adjacent(r278, r338).
shared_edge(r278, r338, 2).
adjacent(r278, r349).
shared_edge(r278, r349, 2).
adjacent(r278, r350).
shared_edge(r278, r350, 4).
adjacent(r278, r361).
shared_edge(r278, r361, 13).
adjacent(r278, r362).
shared_edge(r278, r362, 8).
adjacent(r278, r370).
shared_edge(r278, r370, 2).
adjacent(r278, r383).
shared_edge(r278, r383, 1).
adjacent(r278, r386).
shared_edge(r278, r386, 1).
adjacent(r278, r391).
shared_edge(r278, r391, 2).
adjacent(r278, r399).
shared_edge(r278, r399, 1).
adjacent(r279, r339).
shared_edge(r279, r339, 1).
adjacent(r279, r350).
shared_edge(r279, r350, 2).
adjacent(r28, r29).
shared_edge(r28, r29, 1).
adjacent(r28, r45).
shared_edge(r28, r45, 1).
adjacent(r280, r281).
shared_edge(r280, r281, 1).
adjacent(r280, r288).
shared_edge(r280, r288, 1).
adjacent(r280, r295).
shared_edge(r280, r295, 1).
adjacent(r281, r282).
shared_edge(r281, r282, 1).
adjacent(r281, r288).
shared_edge(r281, r288, 1).
adjacent(r282, r283).
shared_edge(r282, r283, 4).
adjacent(r282, r288).
shared_edge(r282, r288, 1).
adjacent(r282, r296).
shared_edge(r282, r296, 1).
adjacent(r282, r297).
shared_edge(r282, r297, 1).
adjacent(r282, r303).
shared_edge(r282, r303, 2).
adjacent(r282, r304).
shared_edge(r282, r304, 2).
adjacent(r282, r315).
shared_edge(r282, r315, 1).
adjacent(r283, r284).
shared_edge(r283, r284, 2).
adjacent(r283, r297).
shared_edge(r283, r297, 3).
adjacent(r283, r307).
shared_edge(r283, r307, 1).
adjacent(r285, r290).
shared_edge(r285, r290, 1).
adjacent(r286, r287).
shared_edge(r286, r287, 1).
adjacent(r286, r294).
shared_edge(r286, r294, 1).
adjacent(r288, r296).
shared_edge(r288, r296, 1).
adjacent(r289, r308).
shared_edge(r289, r308, 3).
adjacent(r29, r30).
shared_edge(r29, r30, 1).
adjacent(r29, r46).
shared_edge(r29, r46, 1).
adjacent(r290, r291).
shared_edge(r290, r291, 2).
adjacent(r290, r299).
shared_edge(r290, r299, 2).
adjacent(r290, r311).
shared_edge(r290, r311, 2).
adjacent(r290, r312).
shared_edge(r290, r312, 1).
adjacent(r290, r322).
shared_edge(r290, r322, 2).
adjacent(r290, r335).
shared_edge(r290, r335, 2).
adjacent(r290, r336).
shared_edge(r290, r336, 1).
adjacent(r290, r346).
shared_edge(r290, r346, 2).
adjacent(r290, r358).
shared_edge(r290, r358, 7).
adjacent(r290, r368).
shared_edge(r290, r368, 13).
adjacent(r290, r369).
shared_edge(r290, r369, 1).
adjacent(r290, r405).
shared_edge(r290, r405, 3).
adjacent(r290, r406).
shared_edge(r290, r406, 1).
adjacent(r291, r292).
shared_edge(r291, r292, 1).
adjacent(r292, r299).
shared_edge(r292, r299, 1).
adjacent(r293, r294).
shared_edge(r293, r294, 1).
adjacent(r293, r302).
shared_edge(r293, r302, 1).
adjacent(r295, r296).
shared_edge(r295, r296, 1).
adjacent(r295, r303).
shared_edge(r295, r303, 1).
adjacent(r296, r303).
shared_edge(r296, r303, 1).
adjacent(r297, r305).
shared_edge(r297, r305, 1).
adjacent(r297, r306).
shared_edge(r297, r306, 1).
adjacent(r299, r300).
shared_edge(r299, r300, 1).
adjacent(r3, r4).
shared_edge(r3, r4, 13).
adjacent(r3, r48).
shared_edge(r3, r48, 1).
adjacent(r3, r97).
shared_edge(r3, r97, 17).
adjacent(r3, r98).
shared_edge(r3, r98, 4).
adjacent(r30, r31).
shared_edge(r30, r31, 70).
adjacent(r30, r45).
shared_edge(r30, r45, 2).
adjacent(r30, r46).
shared_edge(r30, r46, 1).
adjacent(r30, r67).
shared_edge(r30, r67, 3).
adjacent(r30, r86).
shared_edge(r30, r86, 1).
adjacent(r30, r95).
shared_edge(r30, r95, 4).
adjacent(r300, r311).
shared_edge(r300, r311, 1).
adjacent(r301, r302).
shared_edge(r301, r302, 1).
adjacent(r301, r313).
shared_edge(r301, r313, 1).
adjacent(r303, r314).
shared_edge(r303, r314, 1).
adjacent(r303, r315).
shared_edge(r303, r315, 2).
adjacent(r303, r325).
shared_edge(r303, r325, 10).
adjacent(r303, r326).
shared_edge(r303, r326, 2).
adjacent(r303, r327).
shared_edge(r303, r327, 2).
adjacent(r303, r352).
shared_edge(r303, r352, 4).
adjacent(r303, r362).
shared_edge(r303, r362, 4).
adjacent(r303, r365).
shared_edge(r303, r365, 2).
adjacent(r303, r372).
shared_edge(r303, r372, 2).
adjacent(r303, r376).
shared_edge(r303, r376, 12).
adjacent(r303, r377).
shared_edge(r303, r377, 2).
adjacent(r303, r382).
shared_edge(r303, r382, 8).
adjacent(r303, r384).
shared_edge(r303, r384, 2).
adjacent(r303, r385).
shared_edge(r303, r385, 2).
adjacent(r303, r388).
shared_edge(r303, r388, 6).
adjacent(r303, r389).
shared_edge(r303, r389, 1).
adjacent(r303, r393).
shared_edge(r303, r393, 2).
adjacent(r303, r394).
shared_edge(r303, r394, 1).
adjacent(r303, r401).
shared_edge(r303, r401, 2).
adjacent(r303, r408).
shared_edge(r303, r408, 2).
adjacent(r303, r409).
shared_edge(r303, r409, 2).
adjacent(r304, r305).
shared_edge(r304, r305, 1).
adjacent(r304, r316).
shared_edge(r304, r316, 1).
adjacent(r305, r306).
shared_edge(r305, r306, 1).
adjacent(r305, r317).
shared_edge(r305, r317, 1).
adjacent(r306, r307).
shared_edge(r306, r307, 1).
adjacent(r306, r318).
shared_edge(r306, r318, 1).
adjacent(r307, r319).
shared_edge(r307, r319, 1).
adjacent(r308, r309).
shared_edge(r308, r309, 2).
adjacent(r308, r320).
shared_edge(r308, r320, 1).
adjacent(r308, r321).
shared_edge(r308, r321, 2).
adjacent(r308, r331).
shared_edge(r308, r331, 1).
adjacent(r308, r332).
shared_edge(r308, r332, 1).
adjacent(r308, r333).
shared_edge(r308, r333, 1).
adjacent(r308, r343).
shared_edge(r308, r343, 2).
adjacent(r308, r344).
shared_edge(r308, r344, 3).
adjacent(r308, r345).
shared_edge(r308, r345, 2).
adjacent(r308, r355).
shared_edge(r308, r355, 1).
adjacent(r308, r356).
shared_edge(r308, r356, 6).
adjacent(r308, r357).
shared_edge(r308, r357, 5).
adjacent(r309, r310).
shared_edge(r309, r310, 1).
adjacent(r31, r47).
shared_edge(r31, r47, 5).
adjacent(r31, r74).
shared_edge(r31, r74, 10).
adjacent(r310, r321).
shared_edge(r310, r321, 1).
adjacent(r311, r312).
shared_edge(r311, r312, 1).
adjacent(r314, r324).
shared_edge(r314, r324, 1).
adjacent(r315, r316).
shared_edge(r315, r316, 1).
adjacent(r316, r317).
shared_edge(r316, r317, 1).
adjacent(r316, r326).
shared_edge(r316, r326, 1).
adjacent(r317, r318).
shared_edge(r317, r318, 1).
adjacent(r317, r327).
shared_edge(r317, r327, 1).
adjacent(r318, r319).
shared_edge(r318, r319, 1).
adjacent(r318, r327).
shared_edge(r318, r327, 1).
adjacent(r319, r328).
shared_edge(r319, r328, 1).
adjacent(r32, r33).
shared_edge(r32, r33, 2).
adjacent(r32, r49).
shared_edge(r32, r49, 2).
adjacent(r32, r58).
shared_edge(r32, r58, 2).
adjacent(r32, r6).
shared_edge(r32, r6, 6).
adjacent(r32, r69).
shared_edge(r32, r69, 2).
adjacent(r32, r70).
shared_edge(r32, r70, 1).
adjacent(r32, r77).
shared_edge(r32, r77, 4).
adjacent(r32, r78).
shared_edge(r32, r78, 1).
adjacent(r320, r331).
shared_edge(r320, r331, 1).
adjacent(r324, r325).
shared_edge(r324, r325, 4).
adjacent(r324, r340).
shared_edge(r324, r340, 1).
adjacent(r324, r351).
shared_edge(r324, r351, 1).
adjacent(r324, r364).
shared_edge(r324, r364, 1).
adjacent(r324, r365).
shared_edge(r324, r365, 1).
adjacent(r326, r327).
shared_edge(r326, r327, 1).
adjacent(r327, r328).
shared_edge(r327, r328, 1).
adjacent(r327, r341).
shared_edge(r327, r341, 2).
adjacent(r328, r341).
shared_edge(r328, r341, 1).
adjacent(r328, r352).
shared_edge(r328, r352, 1).
adjacent(r33, r34).
shared_edge(r33, r34, 1).
adjacent(r33, r7).
shared_edge(r33, r7, 1).
adjacent(r332, r333).
shared_edge(r332, r333, 1).
adjacent(r332, r344).
shared_edge(r332, r344, 1).
adjacent(r333, r334).
shared_edge(r333, r334, 1).
adjacent(r334, r345).
shared_edge(r334, r345, 1).
adjacent(r335, r336).
shared_edge(r335, r336, 1).
adjacent(r336, r346).
shared_edge(r336, r346, 1).
adjacent(r337, r338).
shared_edge(r337, r338, 1).
adjacent(r339, r340).
shared_edge(r339, r340, 1).
adjacent(r339, r350).
shared_edge(r339, r350, 1).
adjacent(r339, r351).
shared_edge(r339, r351, 1).
adjacent(r339, r362).
shared_edge(r339, r362, 1).
adjacent(r34, r49).
shared_edge(r34, r49, 1).
adjacent(r34, r8).
shared_edge(r34, r8, 1).
adjacent(r34, r9).
shared_edge(r34, r9, 1).
adjacent(r340, r351).
shared_edge(r340, r351, 1).
adjacent(r341, r352).
shared_edge(r341, r352, 1).
adjacent(r346, r347).
shared_edge(r346, r347, 1).
adjacent(r347, r348).
shared_edge(r347, r348, 1).
adjacent(r347, r358).
shared_edge(r347, r358, 1).
adjacent(r348, r358).
shared_edge(r348, r358, 1).
adjacent(r348, r359).
shared_edge(r348, r359, 1).
adjacent(r35, r9).
shared_edge(r35, r9, 6).
adjacent(r350, r362).
shared_edge(r350, r362, 3).
adjacent(r350, r370).
shared_edge(r350, r370, 2).
adjacent(r350, r371).
shared_edge(r350, r371, 2).
adjacent(r350, r375).
shared_edge(r350, r375, 1).
adjacent(r350, r383).
shared_edge(r350, r383, 1).
adjacent(r351, r363).
shared_edge(r351, r363, 1).
adjacent(r352, r377).
shared_edge(r352, r377, 1).
adjacent(r354, r378).
shared_edge(r354, r378, 4).
adjacent(r355, r356).
shared_edge(r355, r356, 1).
adjacent(r356, r367).
shared_edge(r356, r367, 2).
adjacent(r356, r373).
shared_edge(r356, r373, 1).
adjacent(r357, r373).
shared_edge(r357, r373, 1).
adjacent(r357, r374).
shared_edge(r357, r374, 1).
adjacent(r357, r379).
shared_edge(r357, r379, 4).
adjacent(r358, r359).
shared_edge(r358, r359, 3).
adjacent(r358, r368).
shared_edge(r358, r368, 2).
adjacent(r359, r360).
shared_edge(r359, r360, 1).
adjacent(r36, r37).
shared_edge(r36, r37, 2).
adjacent(r36, r40).
shared_edge(r36, r40, 4).
adjacent(r36, r50).
shared_edge(r36, r50, 3).
adjacent(r36, r60).
shared_edge(r36, r60, 2).
adjacent(r36, r9).
shared_edge(r36, r9, 10).
adjacent(r360, r368).
shared_edge(r360, r368, 4).
adjacent(r361, r369).
shared_edge(r361, r369, 16).
adjacent(r361, r398).
shared_edge(r361, r398, 1).
adjacent(r362, r363).
shared_edge(r362, r363, 2).
adjacent(r362, r371).
shared_edge(r362, r371, 1).
adjacent(r362, r372).
shared_edge(r362, r372, 1).
adjacent(r362, r375).
shared_edge(r362, r375, 2).
adjacent(r362, r383).
shared_edge(r362, r383, 1).
adjacent(r362, r384).
shared_edge(r362, r384, 4).
adjacent(r362, r386).
shared_edge(r362, r386, 2).
adjacent(r362, r387).
shared_edge(r362, r387, 2).
adjacent(r362, r392).
shared_edge(r362, r392, 3).
adjacent(r362, r398).
shared_edge(r362, r398, 1).
adjacent(r362, r399).
shared_edge(r362, r399, 1).
adjacent(r362, r400).
shared_edge(r362, r400, 2).
adjacent(r362, r407).
shared_edge(r362, r407, 3).
adjacent(r362, r408).
shared_edge(r362, r408, 1).
adjacent(r363, r364).
shared_edge(r363, r364, 1).
adjacent(r364, r365).
shared_edge(r364, r365, 1).
adjacent(r364, r372).
shared_edge(r364, r372, 1).
adjacent(r368, r369).
shared_edge(r368, r369, 14).
adjacent(r368, r380).
shared_edge(r368, r380, 4).
adjacent(r369, r381).
shared_edge(r369, r381, 4).
adjacent(r369, r398).
shared_edge(r369, r398, 2).
adjacent(r369, r406).
shared_edge(r369, r406, 3).
adjacent(r37, r38).
shared_edge(r37, r38, 1).
adjacent(r371, r375).
shared_edge(r371, r375, 1).
adjacent(r374, r379).
shared_edge(r374, r379, 1).
adjacent(r38, r39).
shared_edge(r38, r39, 1).
adjacent(r38, r50).
shared_edge(r38, r50, 1).
adjacent(r383, r387).
shared_edge(r383, r387, 1).
adjacent(r385, r389).
shared_edge(r385, r389, 1).
adjacent(r386, r387).
shared_edge(r386, r387, 1).
adjacent(r389, r394).
shared_edge(r389, r394, 1).
adjacent(r39, r40).
shared_edge(r39, r40, 8).
adjacent(r390, r395).
shared_edge(r390, r395, 4).
adjacent(r391, r392).
shared_edge(r391, r392, 1).
adjacent(r391, r400).
shared_edge(r391, r400, 1).
adjacent(r393, r394).
shared_edge(r393, r394, 2).
adjacent(r394, r401).
shared_edge(r394, r401, 2).
adjacent(r394, r409).
shared_edge(r394, r409, 1).
adjacent(r394, r410).
shared_edge(r394, r410, 2).
adjacent(r395, r396).
shared_edge(r395, r396, 2).
adjacent(r395, r397).
shared_edge(r395, r397, 1).
adjacent(r395, r402).
shared_edge(r395, r402, 2).
adjacent(r395, r403).
shared_edge(r395, r403, 1).
adjacent(r396, r397).
shared_edge(r396, r397, 1).
adjacent(r398, r399).
shared_edge(r398, r399, 1).
adjacent(r399, r400).
shared_edge(r399, r400, 1).
adjacent(r4, r48).
shared_edge(r4, r48, 8).
adjacent(r4, r5).
shared_edge(r4, r5, 3).
adjacent(r40, r50).
shared_edge(r40, r50, 4).
adjacent(r40, r82).
shared_edge(r40, r82, 1).
adjacent(r40, r90).
shared_edge(r40, r90, 1).
adjacent(r403, r404).
shared_edge(r403, r404, 1).
adjacent(r41, r51).
shared_edge(r41, r51, 1).
adjacent(r41, r62).
shared_edge(r41, r62, 3).
adjacent(r41, r63).
shared_edge(r41, r63, 2).
adjacent(r41, r80).
shared_edge(r41, r80, 1).
adjacent(r41, r81).
shared_edge(r41, r81, 2).
adjacent(r41, r82).
shared_edge(r41, r82, 5).
adjacent(r42, r53).
shared_edge(r42, r53, 1).
adjacent(r43, r44).
shared_edge(r43, r44, 1).
adjacent(r43, r56).
shared_edge(r43, r56, 1).
adjacent(r44, r45).
shared_edge(r44, r45, 2).
adjacent(r45, r46).
shared_edge(r45, r46, 2).
adjacent(r45, r56).
shared_edge(r45, r56, 1).
adjacent(r45, r66).
shared_edge(r45, r66, 1).
adjacent(r45, r67).
shared_edge(r45, r67, 2).
adjacent(r45, r73).
shared_edge(r45, r73, 2).
adjacent(r45, r85).
shared_edge(r45, r85, 3).
adjacent(r45, r86).
shared_edge(r45, r86, 2).
adjacent(r48, r6).
shared_edge(r48, r6, 5).
adjacent(r48, r69).
shared_edge(r48, r69, 2).
adjacent(r48, r77).
shared_edge(r48, r77, 3).
adjacent(r48, r98).
shared_edge(r48, r98, 1).
adjacent(r49, r9).
shared_edge(r49, r9, 1).
adjacent(r5, r6).
shared_edge(r5, r6, 2).
adjacent(r50, r60).
shared_edge(r50, r60, 2).
adjacent(r51, r62).
shared_edge(r51, r62, 1).
adjacent(r52, r53).
shared_edge(r52, r53, 3).
adjacent(r53, r63).
shared_edge(r53, r63, 5).
adjacent(r53, r64).
shared_edge(r53, r64, 2).
adjacent(r53, r83).
shared_edge(r53, r83, 1).
adjacent(r54, r55).
shared_edge(r54, r55, 2).
adjacent(r54, r65).
shared_edge(r54, r65, 3).
adjacent(r56, r66).
shared_edge(r56, r66, 1).
adjacent(r58, r59).
shared_edge(r58, r59, 1).
adjacent(r58, r9).
shared_edge(r58, r9, 1).
adjacent(r59, r70).
shared_edge(r59, r70, 1).
adjacent(r59, r9).
shared_edge(r59, r9, 2).
adjacent(r6, r7).
shared_edge(r6, r7, 1).
adjacent(r62, r72).
shared_edge(r62, r72, 1).
adjacent(r63, r82).
shared_edge(r63, r82, 2).
adjacent(r63, r83).
shared_edge(r63, r83, 3).
adjacent(r64, r83).
shared_edge(r64, r83, 1).
adjacent(r65, r84).
shared_edge(r65, r84, 3).
adjacent(r66, r73).
shared_edge(r66, r73, 2).
adjacent(r66, r83).
shared_edge(r66, r83, 1).
adjacent(r66, r85).
shared_edge(r66, r85, 2).
adjacent(r66, r93).
shared_edge(r66, r93, 1).
adjacent(r66, r94).
shared_edge(r66, r94, 2).
adjacent(r67, r86).
shared_edge(r67, r86, 1).
adjacent(r68, r75).
shared_edge(r68, r75, 10).
adjacent(r7, r8).
shared_edge(r7, r8, 1).
adjacent(r70, r71).
shared_edge(r70, r71, 1).
adjacent(r70, r78).
shared_edge(r70, r78, 1).
adjacent(r71, r78).
shared_edge(r71, r78, 1).
adjacent(r71, r89).
shared_edge(r71, r89, 2).
adjacent(r71, r9).
shared_edge(r71, r9, 19).
adjacent(r72, r80).
shared_edge(r72, r80, 1).
adjacent(r75, r76).
shared_edge(r75, r76, 2).
adjacent(r75, r87).
shared_edge(r75, r87, 2).
adjacent(r75, r96).
shared_edge(r75, r96, 4).
adjacent(r77, r88).
shared_edge(r77, r88, 1).
adjacent(r77, r98).
shared_edge(r77, r98, 2).
adjacent(r78, r88).
shared_edge(r78, r88, 1).
adjacent(r79, r80).
shared_edge(r79, r80, 1).
adjacent(r79, r92).
shared_edge(r79, r92, 1).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r80, r82).
shared_edge(r80, r82, 1).
adjacent(r81, r82).
shared_edge(r81, r82, 2).
adjacent(r82, r83).
shared_edge(r82, r83, 8).
adjacent(r82, r90).
shared_edge(r82, r90, 1).
adjacent(r82, r91).
shared_edge(r82, r91, 1).
adjacent(r82, r92).
shared_edge(r82, r92, 2).
adjacent(r83, r84).
shared_edge(r83, r84, 4).
adjacent(r83, r93).
shared_edge(r83, r93, 3).
adjacent(r83, r94).
shared_edge(r83, r94, 1).
adjacent(r88, r89).
shared_edge(r88, r89, 1).
adjacent(r88, r99).
shared_edge(r88, r99, 1).
adjacent(r89, r99).
shared_edge(r89, r99, 1).
adjacent(r90, r91).
shared_edge(r90, r91, 1).
adjacent(r91, r92).
shared_edge(r91, r92, 1).
adjacent(r93, r94).
shared_edge(r93, r94, 1).
adjacent(r96, r97).
shared_edge(r96, r97, 3).
adjacent(r98, r99).
shared_edge(r98, r99, 1).
