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

region(r1, '#f3d0a5', 12, centroid(0,5)).
polygon(r1, [xy(0,0),xy(0,10),xy(0,0)]).
fillpoint(r1, xy(1,3), 1).
fillpoint(r1, xy(0,10), 1).
fillpoint(r1, xy(0,9), 1).
fillpoint(r1, xy(0,8), 1).
fillpoint(r1, xy(0,7), 1).
region(r4, '#0c0e11', 314, centroid(13,11)).
polygon(r4, [xy(3,0),xy(3,1),xy(4,0),xy(12,0),xy(12,1),xy(13,2),xy(15,2),xy(16,3),xy(17,3),xy(18,4),xy(19,3),xy(21,3),xy(21,7),xy(20,8),xy(20,9),xy(19,10),xy(20,11),xy(21,11),xy(21,15),xy(19,17),xy(19,18),xy(21,20),xy(19,22),xy(18,21),xy(18,20),xy(17,19),xy(17,18),xy(16,17),xy(15,17),xy(12,14),xy(9,14),xy(7,12),xy(6,13),xy(5,12),xy(5,8),xy(4,7),xy(4,5),xy(5,4),xy(5,3),xy(4,2),xy(3,0)]).
hole(r4, [xy(7,9),xy(7,10),xy(7,9)]).
hole(r4, [xy(7,13),xy(7,15),xy(7,13)]).
midline(r4, [xy(4,1),xy(6,2)]).
midline(r4, [xy(5,5),xy(5,6)]).
midline(r4, [xy(6,11),xy(6,12)]).
midline(r4, [xy(7,20)]).
midline(r4, [xy(8,24),xy(8,26)]).
midline(r4, [xy(10,5),xy(11,5),xy(11,6),xy(12,6),xy(13,8),xy(14,8),xy(14,11),xy(15,11),xy(15,12),xy(16,12),xy(17,14)]).
midline(r4, [xy(10,11)]).
midline(r4, [xy(17,7),xy(19,5)]).
midline(r4, [xy(18,18),xy(18,19),xy(19,19),xy(19,21),xy(20,20),xy(21,21)]).
fillpoint(r4, xy(14,9), 7).
fillpoint(r4, xy(14,8), 7).
fillpoint(r4, xy(13,8), 7).
fillpoint(r4, xy(16,12), 6).
fillpoint(r4, xy(15,12), 6).
region(r6, '#5b4c3d', 8, centroid(16,1)).
polygon(r6, [xy(14,0),xy(15,0),xy(15,1),xy(16,0),xy(16,1),xy(17,0),xy(17,1),xy(18,1),xy(14,0)]).
fillpoint(r6, xy(18,1), 1).
fillpoint(r6, xy(17,1), 1).
fillpoint(r6, xy(17,0), 1).
fillpoint(r6, xy(16,1), 1).
fillpoint(r6, xy(16,0), 1).
region(r8, '#2e2b25', 9, centroid(21,1)).
polygon(r8, [xy(19,0),xy(20,0),xy(20,2),xy(21,2),xy(22,1),xy(21,0),xy(22,0),xy(19,0)]).
midline(r8, [xy(21,1)]).
fillpoint(r8, xy(21,1), 2).
fillpoint(r8, xy(22,1), 1).
fillpoint(r8, xy(22,0), 1).
fillpoint(r8, xy(21,2), 1).
fillpoint(r8, xy(21,0), 1).
region(r10, '#8c513b', 138, centroid(28,7)).
polygon(r10, [xy(23,7),xy(23,8),xy(24,9),xy(24,16),xy(25,14),xy(26,15),xy(26,18),xy(28,16),xy(27,15),xy(27,13),xy(26,12),xy(26,11),xy(27,10),xy(28,11),xy(28,12),xy(29,14),xy(29,16),xy(28,17),xy(29,17),xy(29,18),xy(23,7)]).
hole(r10, [xy(27,11),xy(27,12),xy(27,11)]).
midline(r10, [xy(24,7),xy(24,8),xy(25,8),xy(25,13),xy(26,13),xy(26,14),xy(27,14),xy(28,13),xy(28,15),xy(29,13),xy(29,10),xy(28,9),xy(28,8),xy(29,7),xy(27,5),xy(27,2),xy(25,1)]).
midline(r10, [xy(25,6)]).
midline(r10, [xy(26,9),xy(26,10)]).
midline(r10, [xy(29,1),xy(29,2)]).
midline(r10, [xy(29,8),xy(29,9),xy(31,7),xy(31,6),xy(32,4),xy(33,3),xy(33,2),xy(34,1),xy(34,2)]).
fillpoint(r10, xy(29,10), 3).
fillpoint(r10, xy(29,9), 3).
fillpoint(r10, xy(29,8), 3).
fillpoint(r10, xy(29,7), 3).
fillpoint(r10, xy(28,9), 3).
region(r12, '#97704e', 8, centroid(31,2)).
polygon(r12, [xy(30,3),xy(30,5),xy(31,3),xy(31,1),xy(32,0),xy(32,1),xy(30,3)]).
fillpoint(r12, xy(32,1), 1).
fillpoint(r12, xy(32,0), 1).
fillpoint(r12, xy(31,3), 1).
fillpoint(r12, xy(31,2), 1).
fillpoint(r12, xy(31,1), 1).
region(r13, '#664131', 5, centroid(36,1)).
polygon(r13, [xy(36,1),xy(36,3),xy(37,1),xy(37,0),xy(36,1)]).
fillpoint(r13, xy(37,1), 1).
fillpoint(r13, xy(37,0), 1).
fillpoint(r13, xy(36,3), 1).
fillpoint(r13, xy(36,2), 1).
fillpoint(r13, xy(36,1), 1).
region(r14, '#8c513b', 65, centroid(41,4)).
polygon(r14, [xy(35,5),xy(35,7),xy(37,5),xy(36,4),xy(37,3),xy(37,2),xy(38,1),xy(38,0),xy(42,0),xy(42,1),xy(40,3),xy(38,3),xy(37,4),xy(39,6),xy(39,7),xy(38,8),xy(40,10),xy(41,9),xy(41,10),xy(42,8),xy(43,7),xy(40,4),xy(40,5),xy(42,5),xy(43,4),xy(43,3),xy(44,2),xy(44,1),xy(45,0),xy(46,0),xy(46,1),xy(44,3),xy(43,5),xy(44,5),xy(35,5)]).
midline(r14, [xy(36,5)]).
midline(r14, [xy(38,2),xy(39,1),xy(39,2),xy(40,1),xy(40,2),xy(41,1)]).
midline(r14, [xy(40,8),xy(41,7)]).
midline(r14, [xy(45,1)]).
fillpoint(r14, xy(41,7), 3).
fillpoint(r14, xy(40,8), 3).
fillpoint(r14, xy(45,1), 2).
fillpoint(r14, xy(42,7), 2).
fillpoint(r14, xy(41,8), 2).
region(r15, '#664131', 9, centroid(42,2)).
polygon(r15, [xy(41,3),xy(41,4),xy(42,3),xy(42,2),xy(43,1),xy(43,0),xy(44,0),xy(42,4),xy(41,3)]).
fillpoint(r15, xy(44,0), 1).
fillpoint(r15, xy(43,2), 1).
fillpoint(r15, xy(43,1), 1).
fillpoint(r15, xy(43,0), 1).
fillpoint(r15, xy(42,4), 1).
region(r20, '#664131', 7, centroid(55,0)).
polygon(r20, [xy(53,0),xy(55,0),xy(55,1),xy(56,0),xy(56,1),xy(57,0),xy(53,0)]).
fillpoint(r20, xy(57,0), 1).
fillpoint(r20, xy(56,1), 1).
fillpoint(r20, xy(56,0), 1).
fillpoint(r20, xy(55,1), 1).
fillpoint(r20, xy(55,0), 1).
region(r21, '#8c513b', 5, centroid(59,1)).
polygon(r21, [xy(58,0),xy(59,0),xy(59,1),xy(60,1),xy(60,2),xy(58,0)]).
fillpoint(r21, xy(60,2), 1).
fillpoint(r21, xy(60,1), 1).
fillpoint(r21, xy(59,1), 1).
fillpoint(r21, xy(59,0), 1).
fillpoint(r21, xy(58,0), 1).
region(r23, '#523228', 101, centroid(57,6)).
polygon(r23, [xy(49,11),xy(49,12),xy(50,11),xy(50,9),xy(51,8),xy(51,9),xy(52,8),xy(52,9),xy(53,9),xy(53,10),xy(52,11),xy(54,11),xy(55,10),xy(54,9),xy(55,8),xy(55,7),xy(54,6),xy(54,5),xy(53,4),xy(53,1),xy(54,1),xy(55,2),xy(56,2),xy(57,1),xy(61,5),xy(62,4),xy(62,1),xy(61,0),xy(63,0),xy(63,7),xy(62,8),xy(62,9),xy(61,10),xy(60,9),xy(59,10),xy(58,9),xy(58,7),xy(57,6),xy(56,7),xy(55,9),xy(55,11),xy(56,11),xy(56,12),xy(49,11)]).
hole(r23, [xy(51,10),xy(52,10),xy(51,10)]).
midline(r23, [xy(54,2),xy(55,4),xy(56,4),xy(56,5),xy(57,4),xy(57,3),xy(58,4),xy(58,5),xy(59,5),xy(59,6),xy(60,6),xy(60,7),xy(61,7),xy(59,9),xy(61,9)]).
midline(r23, [xy(54,10)]).
midline(r23, [xy(62,5)]).
fillpoint(r23, xy(61,7), 3).
fillpoint(r23, xy(60,7), 3).
fillpoint(r23, xy(60,6), 3).
fillpoint(r23, xy(59,6), 3).
fillpoint(r23, xy(59,5), 3).
region(r26, '#7f654a', 48, centroid(72,4)).
polygon(r26, [xy(64,1),xy(66,1),xy(67,0),xy(68,1),xy(65,4),xy(65,5),xy(67,3),xy(68,3),xy(69,2),xy(69,3),xy(70,2),xy(70,1),xy(69,0),xy(64,1)]).
midline(r26, [xy(67,1),xy(69,1)]).
midline(r26, [xy(72,3),xy(73,3),xy(73,4)]).
midline(r26, [xy(76,7)]).
fillpoint(r26, xy(76,7), 2).
fillpoint(r26, xy(73,4), 2).
fillpoint(r26, xy(73,3), 2).
fillpoint(r26, xy(72,3), 2).
fillpoint(r26, xy(69,1), 2).
region(r28, '#97704e', 4, centroid(71,1)).
polygon(r28, [xy(70,0),xy(71,0),xy(71,2),xy(70,0)]).
fillpoint(r28, xy(71,2), 1).
fillpoint(r28, xy(71,1), 1).
fillpoint(r28, xy(71,0), 1).
fillpoint(r28, xy(70,0), 1).
region(r30, '#97704e', 7, centroid(74,1)).
polygon(r30, [xy(73,0),xy(74,0),xy(74,2),xy(75,1),xy(75,0),xy(76,0),xy(73,0)]).
fillpoint(r30, xy(76,0), 1).
fillpoint(r30, xy(75,1), 1).
fillpoint(r30, xy(75,0), 1).
fillpoint(r30, xy(74,2), 1).
fillpoint(r30, xy(74,1), 1).
region(r32, '#97704e', 81, centroid(82,4)).
polygon(r32, [xy(75,3),xy(75,5),xy(79,5),xy(80,6),xy(80,7),xy(81,6),xy(81,7),xy(82,7),xy(82,8),xy(83,8),xy(84,7),xy(84,8),xy(85,7),xy(86,7),xy(87,6),xy(87,7),xy(88,6),xy(89,7),xy(87,9),xy(85,9),xy(85,10),xy(75,3)]).
midline(r32, [xy(76,3),xy(76,4),xy(78,3),xy(79,3),xy(80,4),xy(81,3),xy(81,4),xy(82,3),xy(82,2),xy(83,2)]).
midline(r32, [xy(85,8),xy(87,8)]).
fillpoint(r32, xy(83,2), 3).
fillpoint(r32, xy(82,3), 3).
fillpoint(r32, xy(82,2), 3).
fillpoint(r32, xy(81,4), 3).
fillpoint(r32, xy(81,3), 3).
region(r34, '#7f654a', 55, centroid(89,3)).
polygon(r34, [xy(82,6),xy(84,4),xy(84,6),xy(83,7),xy(85,6),xy(86,5),xy(86,6),xy(87,5),xy(87,3),xy(86,2),xy(86,1),xy(85,0),xy(88,0),xy(88,5),xy(89,5),xy(89,6),xy(90,5),xy(90,6),xy(91,5),xy(91,6),xy(92,5),xy(92,4),xy(91,3),xy(90,3),xy(92,1),xy(92,0),xy(94,0),xy(94,1),xy(93,2),xy(94,2),xy(95,1),xy(95,4),xy(94,5),xy(93,5),xy(94,6),xy(95,6),xy(82,6)]).
midline(r34, [xy(83,6)]).
midline(r34, [xy(87,1),xy(87,2)]).
midline(r34, [xy(92,3),xy(93,3),xy(93,4),xy(94,3),xy(94,4)]).
fillpoint(r34, xy(94,4), 2).
fillpoint(r34, xy(94,3), 2).
fillpoint(r34, xy(93,4), 2).
fillpoint(r34, xy(93,3), 2).
fillpoint(r34, xy(92,3), 2).
region(r35, '#74553f', 7, centroid(90,1)).
polygon(r35, [xy(89,0),xy(89,2),xy(91,0),xy(91,2),xy(89,0)]).
fillpoint(r35, xy(91,2), 1).
fillpoint(r35, xy(91,1), 1).
fillpoint(r35, xy(91,0), 1).
fillpoint(r35, xy(90,1), 1).
fillpoint(r35, xy(89,2), 1).
region(r39, '#483f33', 4, centroid(18,2)).
polygon(r39, [xy(17,2),xy(18,2),xy(19,1),xy(19,2),xy(17,2)]).
fillpoint(r39, xy(19,2), 1).
fillpoint(r39, xy(19,1), 1).
fillpoint(r39, xy(18,2), 1).
fillpoint(r39, xy(17,2), 1).
region(r44, '#664131', 13, centroid(53,5)).
polygon(r44, [xy(52,1),xy(52,7),xy(53,6),xy(53,5),xy(54,7),xy(53,8),xy(54,8),xy(52,1)]).
midline(r44, [xy(53,7)]).
fillpoint(r44, xy(53,7), 2).
fillpoint(r44, xy(54,8), 1).
fillpoint(r44, xy(54,7), 1).
fillpoint(r44, xy(53,8), 1).
fillpoint(r44, xy(53,6), 1).
region(r50, '#2e2b25', 8, centroid(3,4)).
polygon(r50, [xy(3,2),xy(3,7),xy(3,2)]).
fillpoint(r50, xy(4,4), 1).
fillpoint(r50, xy(4,3), 1).
fillpoint(r50, xy(3,7), 1).
fillpoint(r50, xy(3,6), 1).
fillpoint(r50, xy(3,5), 1).
region(r54, '#664131', 8, centroid(23,4)).
polygon(r54, [xy(22,4),xy(23,4),xy(23,6),xy(24,5),xy(24,2),xy(22,4)]).
fillpoint(r54, xy(24,5), 1).
fillpoint(r54, xy(24,4), 1).
fillpoint(r54, xy(24,3), 1).
fillpoint(r54, xy(24,2), 1).
fillpoint(r54, xy(23,6), 1).
region(r60, '#8c513b', 6, centroid(51,4)).
polygon(r60, [xy(50,3),xy(51,2),xy(51,6),xy(50,3)]).
fillpoint(r60, xy(51,6), 1).
fillpoint(r60, xy(51,5), 1).
fillpoint(r60, xy(51,4), 1).
fillpoint(r60, xy(51,3), 1).
fillpoint(r60, xy(51,2), 1).
region(r62, '#74553f', 7, centroid(65,3)).
polygon(r62, [xy(64,2),xy(64,5),xy(65,3),xy(65,2),xy(66,2),xy(64,2)]).
fillpoint(r62, xy(66,2), 1).
fillpoint(r62, xy(65,3), 1).
fillpoint(r62, xy(65,2), 1).
fillpoint(r62, xy(64,5), 1).
fillpoint(r62, xy(64,4), 1).
region(r75, '#97704e', 5, centroid(89,4)).
polygon(r75, [xy(88,4),xy(89,3),xy(89,4),xy(91,4),xy(88,4)]).
fillpoint(r75, xy(91,4), 1).
fillpoint(r75, xy(90,4), 1).
fillpoint(r75, xy(89,4), 1).
fillpoint(r75, xy(89,3), 1).
fillpoint(r75, xy(88,4), 1).
region(r76, '#d2a379', 5, centroid(1,6)).
polygon(r76, [xy(1,4),xy(1,8),xy(1,4)]).
fillpoint(r76, xy(1,8), 1).
fillpoint(r76, xy(1,7), 1).
fillpoint(r76, xy(1,6), 1).
fillpoint(r76, xy(1,5), 1).
fillpoint(r76, xy(1,4), 1).
region(r78, '#664131', 21, centroid(33,8)).
polygon(r78, [xy(32,8),xy(32,11),xy(33,11),xy(34,10),xy(34,9),xy(33,8),xy(33,5),xy(34,4),xy(34,7),xy(32,8)]).
midline(r78, [xy(33,9),xy(33,10)]).
fillpoint(r78, xy(33,10), 2).
fillpoint(r78, xy(33,9), 2).
fillpoint(r78, xy(35,12), 1).
fillpoint(r78, xy(35,4), 1).
fillpoint(r78, xy(34,12), 1).
region(r79, '#664131', 11, centroid(37,6)).
polygon(r79, [xy(35,8),xy(36,7),xy(36,8),xy(37,7),xy(37,6),xy(38,5),xy(38,4),xy(39,4),xy(39,5),xy(38,6),xy(38,7),xy(35,8)]).
fillpoint(r79, xy(39,5), 1).
fillpoint(r79, xy(39,4), 1).
fillpoint(r79, xy(38,7), 1).
fillpoint(r79, xy(38,6), 1).
fillpoint(r79, xy(38,5), 1).
region(r85, '#97704e', 6, centroid(50,6)).
polygon(r85, [xy(49,4),xy(50,4),xy(50,6),xy(49,7),xy(50,7),xy(49,4)]).
fillpoint(r85, xy(50,7), 1).
fillpoint(r85, xy(50,6), 1).
fillpoint(r85, xy(50,5), 1).
fillpoint(r85, xy(50,4), 1).
fillpoint(r85, xy(49,7), 1).
region(r88, '#97704e', 7, centroid(70,5)).
polygon(r88, [xy(69,4),xy(69,5),xy(70,4),xy(70,5),xy(72,5),xy(72,6),xy(69,4)]).
fillpoint(r88, xy(72,6), 1).
fillpoint(r88, xy(72,5), 1).
fillpoint(r88, xy(71,5), 1).
fillpoint(r88, xy(70,5), 1).
fillpoint(r88, xy(70,4), 1).
region(r90, '#5b4c3d', 48, centroid(2,16)).
polygon(r90, [xy(0,17),xy(0,23),xy(1,22),xy(1,23),xy(2,21),xy(2,20),xy(4,18),xy(4,15),xy(2,13),xy(2,5),xy(0,17)]).
midline(r90, [xy(1,20),xy(1,21)]).
midline(r90, [xy(2,17),xy(2,18)]).
midline(r90, [xy(3,15)]).
fillpoint(r90, xy(2,18), 3).
fillpoint(r90, xy(2,17), 3).
fillpoint(r90, xy(3,18), 2).
fillpoint(r90, xy(3,17), 2).
fillpoint(r90, xy(3,16), 2).
region(r93, '#97704e', 12, centroid(46,7)).
polygon(r93, [xy(43,6),xy(44,6),xy(44,8),xy(45,7),xy(45,6),xy(46,6),xy(47,5),xy(47,8),xy(48,8),xy(43,6)]).
fillpoint(r93, xy(48,8), 1).
fillpoint(r93, xy(47,8), 1).
fillpoint(r93, xy(47,7), 1).
fillpoint(r93, xy(47,6), 1).
fillpoint(r93, xy(47,5), 1).
region(r94, '#d2a379', 5, centroid(48,6)).
polygon(r94, [xy(48,5),xy(48,7),xy(49,6),xy(49,5),xy(48,5)]).
fillpoint(r94, xy(49,6), 1).
fillpoint(r94, xy(49,5), 1).
fillpoint(r94, xy(48,7), 1).
fillpoint(r94, xy(48,6), 1).
fillpoint(r94, xy(48,5), 1).
region(r96, '#7f654a', 9, centroid(69,6)).
polygon(r96, [xy(67,5),xy(67,6),xy(68,5),xy(68,6),xy(70,6),xy(70,7),xy(71,6),xy(71,7),xy(67,5)]).
fillpoint(r96, xy(71,7), 1).
fillpoint(r96, xy(71,6), 1).
fillpoint(r96, xy(70,7), 1).
fillpoint(r96, xy(70,6), 1).
fillpoint(r96, xy(69,6), 1).
region(r101, '#74553f', 7, centroid(67,7)).
polygon(r101, [xy(65,6),xy(65,7),xy(66,6),xy(66,7),xy(69,7),xy(65,6)]).
fillpoint(r101, xy(69,7), 1).
fillpoint(r101, xy(68,7), 1).
fillpoint(r101, xy(67,7), 1).
fillpoint(r101, xy(66,7), 1).
fillpoint(r101, xy(66,6), 1).
region(r105, '#d2a379', 195, centroid(37,24)).
polygon(r105, [xy(27,31),xy(31,31),xy(31,33),xy(32,33),xy(33,32),xy(32,31),xy(33,30),xy(33,29),xy(32,28),xy(32,27),xy(31,26),xy(31,24),xy(30,23),xy(32,21),xy(32,15),xy(33,15),xy(33,18),xy(34,19),xy(33,20),xy(33,21),xy(34,22),xy(35,22),xy(36,21),xy(36,20),xy(35,19),xy(36,18),xy(36,16),xy(35,15),xy(36,15),xy(37,16),xy(40,16),xy(40,18),xy(39,19),xy(40,20),xy(40,21),xy(41,22),xy(41,23),xy(40,24),xy(39,23),xy(36,23),xy(34,25),xy(34,27),xy(33,28),xy(34,30),xy(35,31),xy(34,32),xy(35,33),xy(36,32),xy(36,36),xy(34,38),xy(34,40),xy(35,39),xy(35,40),xy(36,38),xy(36,37),xy(38,35),xy(37,34),xy(39,34),xy(39,35),xy(40,35),xy(41,34),xy(39,32),xy(38,32),xy(37,31),xy(37,29),xy(39,27),xy(39,28),xy(40,27),xy(42,27),xy(43,26),xy(43,25),xy(42,24),xy(43,24),xy(44,26),xy(27,31)]).
hole(r105, [xy(34,16),xy(34,18),xy(35,17),xy(35,18),xy(34,16)]).
hole(r105, [xy(34,20),xy(34,21),xy(35,20),xy(35,21),xy(34,20)]).
hole(r105, [xy(34,28),xy(34,29),xy(35,30),xy(36,29),xy(36,31),xy(34,28)]).
hole(r105, [xy(37,32),xy(37,33),xy(39,33),xy(37,32)]).
midline(r105, [xy(32,23),xy(33,23),xy(33,24),xy(32,26),xy(33,26),xy(33,27)]).
midline(r105, [xy(32,32),xy(33,31),xy(34,31),xy(35,32)]).
midline(r105, [xy(33,19)]).
midline(r105, [xy(35,23),xy(38,20),xy(37,19),xy(38,18)]).
midline(r105, [xy(35,38)]).
midline(r105, [xy(37,35)]).
midline(r105, [xy(38,21),xy(40,22),xy(40,23)]).
midline(r105, [xy(39,30),xy(40,32),xy(40,34)]).
midline(r105, [xy(42,14)]).
midline(r105, [xy(44,10)]).
fillpoint(r105, xy(39,30), 3).
fillpoint(r105, xy(38,21), 3).
fillpoint(r105, xy(38,20), 3).
fillpoint(r105, xy(38,18), 3).
fillpoint(r105, xy(37,19), 3).
region(r107, '#2e2b25', 5, centroid(56,8)).
polygon(r107, [xy(56,8),xy(56,10),xy(57,8),xy(57,7),xy(56,8)]).
fillpoint(r107, xy(57,8), 1).
fillpoint(r107, xy(57,7), 1).
fillpoint(r107, xy(56,10), 1).
fillpoint(r107, xy(56,9), 1).
fillpoint(r107, xy(56,8), 1).
region(r112, '#97704e', 5, centroid(94,7)).
polygon(r112, [xy(93,7),xy(94,7),xy(94,8),xy(95,7),xy(95,8),xy(93,7)]).
fillpoint(r112, xy(95,8), 1).
fillpoint(r112, xy(95,7), 1).
fillpoint(r112, xy(94,8), 1).
fillpoint(r112, xy(94,7), 1).
fillpoint(r112, xy(93,7), 1).
region(r114, '#2e2b25', 5, centroid(4,10)).
polygon(r114, [xy(4,8),xy(4,12),xy(4,8)]).
fillpoint(r114, xy(4,12), 1).
fillpoint(r114, xy(4,11), 1).
fillpoint(r114, xy(4,10), 1).
fillpoint(r114, xy(4,9), 1).
fillpoint(r114, xy(4,8), 1).
region(r116, '#664131', 41, centroid(25,18)).
polygon(r116, [xy(22,8),xy(22,9),xy(23,9),xy(23,16),xy(22,17),xy(23,18),xy(25,16),xy(25,18),xy(24,19),xy(24,24),xy(25,22),xy(26,21),xy(26,20),xy(25,19),xy(27,17),xy(27,19),xy(28,20),xy(28,21),xy(27,22),xy(27,23),xy(22,8)]).
midline(r116, [xy(23,17),xy(24,18),xy(25,20),xy(25,21),xy(27,20),xy(27,21)]).
fillpoint(r116, xy(27,21), 2).
fillpoint(r116, xy(27,20), 2).
fillpoint(r116, xy(25,21), 2).
fillpoint(r116, xy(25,20), 2).
fillpoint(r116, xy(24,18), 2).
region(r122, '#5b4c3d', 70, centroid(69,12)).
polygon(r122, [xy(63,9),xy(63,11),xy(64,12),xy(65,12),xy(65,13),xy(64,14),xy(63,14),xy(63,15),xy(65,14),xy(66,13),xy(66,11),xy(69,11),xy(71,9),xy(70,8),xy(64,8),xy(63,9)]).
midline(r122, [xy(65,10),xy(67,9),xy(67,10),xy(68,9),xy(68,10),xy(69,9),xy(69,10),xy(70,9),xy(71,10),xy(72,10),xy(72,13)]).
midline(r122, [xy(71,17),xy(72,16)]).
fillpoint(r122, xy(65,10), 3).
fillpoint(r122, xy(72,16), 2).
fillpoint(r122, xy(72,13), 2).
fillpoint(r122, xy(72,12), 2).
fillpoint(r122, xy(72,11), 2).
region(r125, '#97704e', 22, centroid(80,11)).
polygon(r125, [xy(77,8),xy(77,12),xy(79,10),xy(79,9),xy(78,8),xy(80,9),xy(79,11),xy(80,11),xy(80,12),xy(81,12),xy(81,13),xy(82,12),xy(82,13),xy(83,12),xy(83,13),xy(84,13),xy(77,8)]).
midline(r125, [xy(78,9),xy(78,10)]).
fillpoint(r125, xy(78,10), 2).
fillpoint(r125, xy(78,9), 2).
fillpoint(r125, xy(84,13), 1).
fillpoint(r125, xy(83,13), 1).
fillpoint(r125, xy(83,12), 1).
region(r127, '#7f654a', 9, centroid(91,9)).
polygon(r127, [xy(88,9),xy(89,9),xy(89,10),xy(90,9),xy(90,10),xy(91,9),xy(92,9),xy(93,8),xy(93,9),xy(88,9)]).
fillpoint(r127, xy(93,9), 1).
fillpoint(r127, xy(93,8), 1).
fillpoint(r127, xy(92,9), 1).
fillpoint(r127, xy(91,9), 1).
fillpoint(r127, xy(90,10), 1).
region(r131, '#523228', 4, centroid(35,10)).
polygon(r131, [xy(35,9),xy(35,11),xy(36,9),xy(35,9)]).
fillpoint(r131, xy(36,9), 1).
fillpoint(r131, xy(35,11), 1).
fillpoint(r131, xy(35,10), 1).
fillpoint(r131, xy(35,9), 1).
region(r133, '#97704e', 7, centroid(42,11)).
polygon(r133, [xy(41,11),xy(41,13),xy(42,11),xy(42,9),xy(43,9),xy(41,11)]).
fillpoint(r133, xy(43,9), 1).
fillpoint(r133, xy(42,11), 1).
fillpoint(r133, xy(42,10), 1).
fillpoint(r133, xy(42,9), 1).
fillpoint(r133, xy(41,13), 1).
region(r134, '#97704e', 5, centroid(46,11)).
polygon(r134, [xy(46,9),xy(46,13),xy(46,9)]).
fillpoint(r134, xy(46,13), 1).
fillpoint(r134, xy(46,12), 1).
fillpoint(r134, xy(46,11), 1).
fillpoint(r134, xy(46,10), 1).
fillpoint(r134, xy(46,9), 1).
region(r137, '#664131', 12, centroid(48,13)).
polygon(r137, [xy(47,11),xy(48,10),xy(48,18),xy(47,11)]).
fillpoint(r137, xy(49,10), 1).
fillpoint(r137, xy(49,9), 1).
fillpoint(r137, xy(48,18), 1).
fillpoint(r137, xy(48,17), 1).
fillpoint(r137, xy(48,16), 1).
region(r138, '#0c0e11', 140, centroid(59,25)).
polygon(r138, [xy(53,27),xy(54,26),xy(54,25),xy(55,24),xy(55,23),xy(56,22),xy(56,21),xy(57,20),xy(57,15),xy(56,14),xy(56,13),xy(57,12),xy(57,9),xy(58,11),xy(59,12),xy(60,11),xy(60,12),xy(61,13),xy(61,22),xy(60,23),xy(59,23),xy(58,22),xy(56,24),xy(56,26),xy(54,28),xy(54,29),xy(55,28),xy(55,31),xy(53,27)]).
midline(r138, [xy(54,27),xy(55,26),xy(55,25),xy(56,23),xy(57,22),xy(57,21),xy(59,19),xy(59,15),xy(58,14),xy(58,13),xy(59,14)]).
midline(r138, [xy(59,20),xy(59,21)]).
midline(r138, [xy(60,38),xy(61,37),xy(61,38),xy(63,38)]).
fillpoint(r138, xy(63,38), 3).
fillpoint(r138, xy(62,38), 3).
fillpoint(r138, xy(61,38), 3).
fillpoint(r138, xy(61,37), 3).
fillpoint(r138, xy(60,38), 3).
region(r139, '#664131', 5, centroid(74,10)).
polygon(r139, [xy(74,9),xy(74,11),xy(75,11),xy(75,9),xy(74,9)]).
fillpoint(r139, xy(75,11), 1).
fillpoint(r139, xy(75,9), 1).
fillpoint(r139, xy(74,11), 1).
fillpoint(r139, xy(74,10), 1).
fillpoint(r139, xy(74,9), 1).
region(r140, '#74553f', 4, centroid(76,11)).
polygon(r140, [xy(76,9),xy(76,12),xy(76,9)]).
fillpoint(r140, xy(76,12), 1).
fillpoint(r140, xy(76,11), 1).
fillpoint(r140, xy(76,10), 1).
fillpoint(r140, xy(76,9), 1).
region(r141, '#7f654a', 16, centroid(83,10)).
polygon(r141, [xy(80,10),xy(81,9),xy(82,10),xy(81,11),xy(83,11),xy(84,10),xy(83,9),xy(84,9),xy(85,11),xy(86,10),xy(86,11),xy(80,10)]).
midline(r141, [xy(81,10),xy(83,10),xy(84,11)]).
fillpoint(r141, xy(84,11), 2).
fillpoint(r141, xy(83,10), 2).
fillpoint(r141, xy(81,10), 2).
fillpoint(r141, xy(86,11), 1).
fillpoint(r141, xy(86,10), 1).
region(r143, '#74553f', 18, centroid(90,12)).
polygon(r143, [xy(86,14),xy(87,14),xy(88,13),xy(88,14),xy(89,13),xy(89,14),xy(90,13),xy(90,12),xy(89,11),xy(90,11),xy(91,10),xy(92,10),xy(92,11),xy(94,9),xy(94,10),xy(86,14)]).
midline(r143, [xy(91,11)]).
fillpoint(r143, xy(91,11), 2).
fillpoint(r143, xy(94,10), 1).
fillpoint(r143, xy(94,9), 1).
fillpoint(r143, xy(93,10), 1).
fillpoint(r143, xy(92,11), 1).
region(r147, '#2e2b25', 4, centroid(37,11)).
polygon(r147, [xy(36,10),xy(36,11),xy(37,11),xy(37,12),xy(36,10)]).
fillpoint(r147, xy(37,12), 1).
fillpoint(r147, xy(37,11), 1).
fillpoint(r147, xy(36,11), 1).
fillpoint(r147, xy(36,10), 1).
region(r148, '#523228', 7, centroid(38,11)).
polygon(r148, [xy(37,10),xy(38,10),xy(38,12),xy(37,13),xy(38,13),xy(39,11),xy(37,10)]).
fillpoint(r148, xy(39,11), 1).
fillpoint(r148, xy(38,13), 1).
fillpoint(r148, xy(38,12), 1).
fillpoint(r148, xy(38,11), 1).
fillpoint(r148, xy(38,10), 1).
region(r156, '#d2a379', 5, centroid(0,13)).
polygon(r156, [xy(0,11),xy(0,15),xy(0,11)]).
fillpoint(r156, xy(0,15), 1).
fillpoint(r156, xy(0,14), 1).
fillpoint(r156, xy(0,13), 1).
fillpoint(r156, xy(0,12), 1).
fillpoint(r156, xy(0,11), 1).
region(r161, '#483f33', 127, centroid(72,20)).
polygon(r161, [xy(62,15),xy(62,18),xy(63,19),xy(64,19),xy(67,16),xy(68,17),xy(68,20),xy(67,21),xy(66,21),xy(65,20),xy(64,21),xy(65,21),xy(66,19),xy(68,21),xy(69,21),xy(70,20),xy(69,19),xy(69,16),xy(71,14),xy(69,12),xy(66,12),xy(67,13),xy(65,15),xy(64,15),xy(63,16),xy(62,15)]).
hole(r161, [xy(66,18),xy(67,17),xy(67,19),xy(66,20),xy(67,20),xy(66,18)]).
midline(r161, [xy(64,17),xy(65,19)]).
midline(r161, [xy(66,15),xy(66,16),xy(68,14),xy(68,15),xy(69,14)]).
midline(r161, [xy(69,20)]).
midline(r161, [xy(76,19),xy(77,19),xy(77,22),xy(78,24),xy(77,25),xy(77,26),xy(78,25)]).
midline(r161, [xy(77,28)]).
fillpoint(r161, xy(78,25), 3).
fillpoint(r161, xy(78,24), 3).
fillpoint(r161, xy(77,26), 3).
fillpoint(r161, xy(77,25), 3).
fillpoint(r161, xy(77,22), 3).
region(r162, '#97704e', 4, centroid(86,12)).
polygon(r162, [xy(85,12),xy(86,12),xy(87,11),xy(87,12),xy(85,12)]).
fillpoint(r162, xy(87,12), 1).
fillpoint(r162, xy(87,11), 1).
fillpoint(r162, xy(86,12), 1).
fillpoint(r162, xy(85,12), 1).
region(r165, '#7f654a', 4, centroid(1,14)).
polygon(r165, [xy(1,12),xy(1,15),xy(1,12)]).
fillpoint(r165, xy(1,15), 1).
fillpoint(r165, xy(1,14), 1).
fillpoint(r165, xy(1,13), 1).
fillpoint(r165, xy(1,12), 1).
region(r166, '#523228', 5, centroid(22,14)).
polygon(r166, [xy(22,12),xy(22,16),xy(22,12)]).
fillpoint(r166, xy(22,16), 1).
fillpoint(r166, xy(22,15), 1).
fillpoint(r166, xy(22,14), 1).
fillpoint(r166, xy(22,13), 1).
fillpoint(r166, xy(22,12), 1).
region(r167, '#664131', 10, centroid(31,15)).
polygon(r167, [xy(30,14),xy(30,19),xy(30,14)]).
fillpoint(r167, xy(32,13), 1).
fillpoint(r167, xy(31,14), 1).
fillpoint(r167, xy(31,13), 1).
fillpoint(r167, xy(31,12), 1).
fillpoint(r167, xy(30,19), 1).
region(r170, '#664131', 4, centroid(39,13)).
polygon(r170, [xy(39,12),xy(39,14),xy(40,13),xy(39,12)]).
fillpoint(r170, xy(40,13), 1).
fillpoint(r170, xy(39,14), 1).
fillpoint(r170, xy(39,13), 1).
fillpoint(r170, xy(39,12), 1).
region(r172, '#f3d0a5', 35, centroid(43,18)).
polygon(r172, [xy(40,19),xy(41,18),xy(41,17),xy(44,14),xy(44,12),xy(40,19)]).
midline(r172, [xy(42,17),xy(43,16),xy(43,17),xy(42,19),xy(43,19),xy(43,20)]).
fillpoint(r172, xy(43,20), 3).
fillpoint(r172, xy(43,19), 3).
fillpoint(r172, xy(42,19), 3).
fillpoint(r172, xy(44,21), 2).
fillpoint(r172, xy(44,20), 2).
region(r174, '#0c0e11', 14, centroid(52,13)).
polygon(r174, [xy(50,12),xy(50,13),xy(51,12),xy(51,13),xy(52,13),xy(52,14),xy(51,15),xy(52,15),xy(53,14),xy(53,13),xy(54,12),xy(54,13),xy(55,12),xy(50,12)]).
fillpoint(r174, xy(55,12), 1).
fillpoint(r174, xy(54,13), 1).
fillpoint(r174, xy(54,12), 1).
fillpoint(r174, xy(53,15), 1).
fillpoint(r174, xy(53,14), 1).
region(r177, '#523228', 5, centroid(75,13)).
polygon(r177, [xy(74,12),xy(75,12),xy(75,15),xy(74,12)]).
fillpoint(r177, xy(75,15), 1).
fillpoint(r177, xy(75,14), 1).
fillpoint(r177, xy(75,13), 1).
fillpoint(r177, xy(75,12), 1).
fillpoint(r177, xy(74,12), 1).
region(r178, '#7f654a', 15, centroid(79,14)).
polygon(r178, [xy(77,13),xy(77,15),xy(78,15),xy(80,13),xy(79,12),xy(78,12),xy(80,14),xy(83,14),xy(77,13)]).
midline(r178, [xy(78,13),xy(78,14),xy(79,13)]).
fillpoint(r178, xy(79,13), 2).
fillpoint(r178, xy(78,14), 2).
fillpoint(r178, xy(78,13), 2).
fillpoint(r178, xy(83,14), 1).
fillpoint(r178, xy(82,14), 1).
region(r180, '#2e2b25', 27, centroid(93,19)).
polygon(r180, [xy(92,13),xy(92,15),xy(93,14),xy(93,12),xy(92,13)]).
midline(r180, [xy(93,24)]).
fillpoint(r180, xy(93,24), 2).
fillpoint(r180, xy(94,25), 1).
fillpoint(r180, xy(94,24), 1).
fillpoint(r180, xy(94,23), 1).
fillpoint(r180, xy(94,22), 1).
region(r181, '#483f33', 15, centroid(95,16)).
polygon(r181, [xy(94,12),xy(94,16),xy(95,15),xy(95,12),xy(94,12)]).
fillpoint(r181, xy(95,21), 1).
fillpoint(r181, xy(95,20), 1).
fillpoint(r181, xy(95,19), 1).
fillpoint(r181, xy(95,18), 1).
fillpoint(r181, xy(95,17), 1).
region(r187, '#8c513b', 6, centroid(47,15)).
polygon(r187, [xy(46,14),xy(46,16),xy(47,15),xy(47,13),xy(46,14)]).
fillpoint(r187, xy(47,15), 1).
fillpoint(r187, xy(47,14), 1).
fillpoint(r187, xy(47,13), 1).
fillpoint(r187, xy(46,16), 1).
fillpoint(r187, xy(46,15), 1).
region(r188, '#2e2b25', 7, centroid(50,14)).
polygon(r188, [xy(49,13),xy(49,16),xy(50,15),xy(50,14),xy(51,14),xy(49,13)]).
fillpoint(r188, xy(51,14), 1).
fillpoint(r188, xy(50,15), 1).
fillpoint(r188, xy(50,14), 1).
fillpoint(r188, xy(49,16), 1).
fillpoint(r188, xy(49,15), 1).
region(r195, '#2e2b25', 5, centroid(5,16)).
polygon(r195, [xy(5,14),xy(5,18),xy(5,14)]).
fillpoint(r195, xy(5,18), 1).
fillpoint(r195, xy(5,17), 1).
fillpoint(r195, xy(5,16), 1).
fillpoint(r195, xy(5,15), 1).
fillpoint(r195, xy(5,14), 1).
region(r196, '#97704e', 10, centroid(36,14)).
polygon(r196, [xy(32,14),xy(37,14),xy(37,15),xy(40,15),xy(32,14)]).
fillpoint(r196, xy(40,15), 1).
fillpoint(r196, xy(39,15), 1).
fillpoint(r196, xy(38,15), 1).
fillpoint(r196, xy(37,15), 1).
fillpoint(r196, xy(37,14), 1).
region(r206, '#2e2b25', 12, centroid(10,18)).
polygon(r206, [xy(9,15),xy(9,23),xy(9,15)]).
fillpoint(r206, xy(12,15), 1).
fillpoint(r206, xy(11,15), 1).
fillpoint(r206, xy(10,15), 1).
fillpoint(r206, xy(9,23), 1).
fillpoint(r206, xy(9,22), 1).
region(r208, '#523228', 25, centroid(51,19)).
polygon(r208, [xy(48,23),xy(48,24),xy(49,23),xy(49,22),xy(50,21),xy(50,20),xy(49,19),xy(49,17),xy(51,19),xy(52,18),xy(52,17),xy(53,16),xy(53,17),xy(54,16),xy(54,17),xy(55,16),xy(55,15),xy(48,23)]).
midline(r208, [xy(50,19),xy(51,20)]).
fillpoint(r208, xy(51,20), 2).
fillpoint(r208, xy(50,19), 2).
fillpoint(r208, xy(55,16), 1).
fillpoint(r208, xy(55,15), 1).
fillpoint(r208, xy(54,17), 1).
region(r215, '#5b4c3d', 13, centroid(89,16)).
polygon(r215, [xy(86,15),xy(86,16),xy(87,16),xy(87,17),xy(88,17),xy(89,16),xy(88,15),xy(89,17),xy(90,16),xy(90,17),xy(92,17),xy(86,15)]).
midline(r215, [xy(88,16)]).
fillpoint(r215, xy(88,16), 2).
fillpoint(r215, xy(92,17), 1).
fillpoint(r215, xy(91,17), 1).
fillpoint(r215, xy(90,17), 1).
fillpoint(r215, xy(90,16), 1).
region(r219, '#5b4c3d', 7, centroid(10,19)).
polygon(r219, [xy(10,16),xy(10,22),xy(10,16)]).
fillpoint(r219, xy(10,22), 1).
fillpoint(r219, xy(10,21), 1).
fillpoint(r219, xy(10,20), 1).
fillpoint(r219, xy(10,19), 1).
fillpoint(r219, xy(10,18), 1).
region(r220, '#74553f', 41, centroid(12,24)).
polygon(r220, [xy(11,16),xy(11,19),xy(12,19),xy(13,18),xy(14,19),xy(13,20),xy(13,22),xy(12,23),xy(11,23),xy(11,31),xy(12,29),xy(13,28),xy(13,26),xy(14,25),xy(14,21),xy(11,16)]).
midline(r220, [xy(12,18),xy(13,19)]).
midline(r220, [xy(12,24),xy(12,28)]).
midline(r220, [xy(13,23),xy(13,25)]).
fillpoint(r220, xy(13,25), 2).
fillpoint(r220, xy(13,24), 2).
fillpoint(r220, xy(13,23), 2).
fillpoint(r220, xy(13,19), 2).
fillpoint(r220, xy(12,28), 2).
region(r223, '#97704e', 11, centroid(30,20)).
polygon(r223, [xy(29,20),xy(29,22),xy(30,21),xy(30,22),xy(31,21),xy(31,16),xy(29,20)]).
fillpoint(r223, xy(31,21), 1).
fillpoint(r223, xy(31,20), 1).
fillpoint(r223, xy(31,19), 1).
fillpoint(r223, xy(31,18), 1).
fillpoint(r223, xy(31,17), 1).
region(r224, '#f3d0a5', 6, centroid(35,17)).
polygon(r224, [xy(34,16),xy(34,18),xy(35,17),xy(35,18),xy(34,16)]).
fillpoint(r224, xy(35,18), 1).
fillpoint(r224, xy(35,17), 1).
fillpoint(r224, xy(35,16), 1).
fillpoint(r224, xy(34,18), 1).
fillpoint(r224, xy(34,17), 1).
region(r227, '#2e2b25', 5, centroid(51,17)).
polygon(r227, [xy(50,17),xy(51,16),xy(51,18),xy(52,16),xy(50,17)]).
fillpoint(r227, xy(52,16), 1).
fillpoint(r227, xy(51,18), 1).
fillpoint(r227, xy(51,17), 1).
fillpoint(r227, xy(51,16), 1).
fillpoint(r227, xy(50,17), 1).
region(r229, '#2e2b25', 7, centroid(74,17)).
polygon(r229, [xy(74,16),xy(74,19),xy(75,18),xy(75,16),xy(74,16)]).
fillpoint(r229, xy(75,18), 1).
fillpoint(r229, xy(75,17), 1).
fillpoint(r229, xy(75,16), 1).
fillpoint(r229, xy(74,19), 1).
fillpoint(r229, xy(74,18), 1).
region(r233, '#483f33', 359, centroid(82,31)).
polygon(r233, [xy(63,30),xy(63,31),xy(64,30),xy(71,30),xy(71,31),xy(72,32),xy(71,33),xy(71,34),xy(70,35),xy(71,36),xy(72,35),xy(72,34),xy(73,33),xy(73,32),xy(74,33),xy(75,33),xy(76,32),xy(77,32),xy(78,31),xy(78,30),xy(80,30),xy(80,33),xy(79,34),xy(78,33),xy(76,35),xy(75,35),xy(74,36),xy(75,37),xy(80,37),xy(81,36),xy(80,35),xy(77,35),xy(63,30)]).
hole(r233, [xy(75,36),xy(80,36),xy(75,36)]).
hole(r233, [xy(82,35),xy(86,35),xy(82,35)]).
hole(r233, [xy(84,19),xy(85,18),xy(85,19),xy(84,19)]).
midline(r233, [xy(64,31),xy(65,31),xy(65,32),xy(66,31),xy(66,32),xy(69,32),xy(69,33),xy(70,32)]).
midline(r233, [xy(68,35),xy(69,35),xy(69,37),xy(70,37),xy(70,38),xy(71,38),xy(72,37),xy(72,38),xy(73,37),xy(73,38),xy(76,38),xy(76,39),xy(77,38),xy(77,39),xy(78,38),xy(78,39),xy(79,38),xy(79,39),xy(80,38),xy(80,39),xy(81,38),xy(81,39)]).
midline(r233, [xy(73,34),xy(73,35),xy(74,34),xy(74,35),xy(76,33),xy(76,34),xy(79,31),xy(79,33)]).
midline(r233, [xy(82,17),xy(82,21),xy(83,20),xy(83,18)]).
midline(r233, [xy(85,37),xy(85,38),xy(86,37)]).
midline(r233, [xy(87,20),xy(89,19),xy(90,19),xy(90,20),xy(91,19),xy(91,21),xy(90,22),xy(90,23),xy(91,22)]).
midline(r233, [xy(88,34),xy(89,35),xy(90,37),xy(92,37),xy(92,38),xy(93,37),xy(93,38)]).
midline(r233, [xy(89,29),xy(89,30)]).
midline(r233, [xy(90,25),xy(90,27)]).
fillpoint(r233, xy(89,30), 5).
fillpoint(r233, xy(89,29), 5).
fillpoint(r233, xy(90,37), 4).
fillpoint(r233, xy(90,30), 4).
fillpoint(r233, xy(90,29), 4).
region(r245, '#5b4c3d', 6, centroid(67,19)).
polygon(r245, [xy(66,18),xy(67,17),xy(67,19),xy(66,20),xy(67,20),xy(66,18)]).
fillpoint(r245, xy(67,20), 1).
fillpoint(r245, xy(67,19), 1).
fillpoint(r245, xy(67,18), 1).
fillpoint(r245, xy(67,17), 1).
fillpoint(r245, xy(66,20), 1).
region(r247, '#2e2b25', 24, centroid(82,21)).
polygon(r247, [xy(78,17),xy(78,18),xy(79,18),xy(80,17),xy(80,19),xy(79,20),xy(79,21),xy(80,20),xy(80,23),xy(82,23),xy(83,22),xy(83,23),xy(84,22),xy(84,21),xy(85,21),xy(84,23),xy(88,23),xy(78,17)]).
fillpoint(r247, xy(88,23), 1).
fillpoint(r247, xy(87,23), 1).
fillpoint(r247, xy(86,23), 1).
fillpoint(r247, xy(85,23), 1).
fillpoint(r247, xy(85,21), 1).
region(r256, '#664131', 22, centroid(51,22)).
polygon(r256, [xy(46,24),xy(46,25),xy(47,24),xy(47,25),xy(48,25),xy(48,26),xy(49,25),xy(49,24),xy(50,23),xy(50,24),xy(51,23),xy(51,22),xy(52,21),xy(52,22),xy(53,21),xy(53,18),xy(54,18),xy(54,20),xy(46,24)]).
fillpoint(r256, xy(54,20), 1).
fillpoint(r256, xy(54,19), 1).
fillpoint(r256, xy(54,18), 1).
fillpoint(r256, xy(53,21), 1).
fillpoint(r256, xy(53,20), 1).
region(r259, '#5b4c3d', 7, centroid(15,21)).
polygon(r259, [xy(14,20),xy(15,19),xy(15,24),xy(14,20)]).
fillpoint(r259, xy(15,24), 1).
fillpoint(r259, xy(15,23), 1).
fillpoint(r259, xy(15,22), 1).
fillpoint(r259, xy(15,21), 1).
fillpoint(r259, xy(15,20), 1).
region(r269, '#74553f', 37, centroid(2,27)).
polygon(r269, [xy(0,24),xy(0,26),xy(1,27),xy(0,28),xy(0,34),xy(1,33),xy(1,30),xy(3,28),xy(3,27),xy(2,26),xy(2,25),xy(1,24),xy(2,23),xy(2,22),xy(3,21),xy(3,20),xy(4,20),xy(4,21),xy(3,22),xy(4,22),xy(2,24),xy(0,24)]).
midline(r269, [xy(1,25),xy(1,26),xy(2,27),xy(1,28),xy(1,29),xy(2,28)]).
fillpoint(r269, xy(2,28), 2).
fillpoint(r269, xy(2,27), 2).
fillpoint(r269, xy(1,29), 2).
fillpoint(r269, xy(1,28), 2).
fillpoint(r269, xy(1,26), 2).
region(r270, '#7f654a', 6, centroid(12,21)).
polygon(r270, [xy(11,20),xy(11,22),xy(12,21),xy(12,22),xy(11,20)]).
fillpoint(r270, xy(12,22), 1).
fillpoint(r270, xy(12,21), 1).
fillpoint(r270, xy(12,20), 1).
fillpoint(r270, xy(11,22), 1).
fillpoint(r270, xy(11,21), 1).
region(r274, '#f3d0a5', 4, centroid(35,21)).
polygon(r274, [xy(34,20),xy(34,21),xy(35,20),xy(35,21),xy(34,20)]).
fillpoint(r274, xy(35,21), 1).
fillpoint(r274, xy(35,20), 1).
fillpoint(r274, xy(34,21), 1).
fillpoint(r274, xy(34,20), 1).
region(r276, '#97704e', 4, centroid(47,21)).
polygon(r276, [xy(46,22),xy(47,21),xy(47,22),xy(46,22)]).
fillpoint(r276, xy(47,22), 1).
fillpoint(r276, xy(47,21), 1).
fillpoint(r276, xy(47,20), 1).
fillpoint(r276, xy(46,22), 1).
region(r283, '#5b4c3d', 7, centroid(5,24)).
polygon(r283, [xy(5,21),xy(5,27),xy(5,21)]).
fillpoint(r283, xy(5,27), 1).
fillpoint(r283, xy(5,26), 1).
fillpoint(r283, xy(5,25), 1).
fillpoint(r283, xy(5,24), 1).
fillpoint(r283, xy(5,23), 1).
region(r284, '#2e2b25', 44, centroid(8,31)).
polygon(r284, [xy(6,21),xy(6,29),xy(7,28),xy(8,28),xy(8,29),xy(7,30),xy(8,30),xy(8,31),xy(7,32),xy(7,37),xy(8,37),xy(10,35),xy(10,32),xy(9,31),xy(10,30),xy(10,26),xy(6,21)]).
midline(r284, [xy(7,29)]).
midline(r284, [xy(8,32),xy(8,36),xy(9,35),xy(9,32)]).
fillpoint(r284, xy(9,35), 2).
fillpoint(r284, xy(9,34), 2).
fillpoint(r284, xy(9,33), 2).
fillpoint(r284, xy(9,32), 2).
fillpoint(r284, xy(8,36), 2).
region(r287, '#2e2b25', 93, centroid(69,25)).
polygon(r287, [xy(62,21),xy(62,27),xy(64,25),xy(64,26),xy(65,26),xy(65,27),xy(64,28),xy(63,28),xy(63,29),xy(64,29),xy(65,28),xy(65,29),xy(67,29),xy(68,28),xy(66,26),xy(66,27),xy(68,25),xy(67,24),xy(66,24),xy(64,22),xy(63,22),xy(63,23),xy(65,22),xy(74,22),xy(75,23),xy(75,24),xy(74,25),xy(74,27),xy(72,29),xy(68,29),xy(62,21)]).
hole(r287, [xy(63,24),xy(63,25),xy(64,24),xy(64,23),xy(63,24)]).
hole(r287, [xy(63,27),xy(64,27),xy(63,27)]).
hole(r287, [xy(65,25),xy(67,25),xy(65,25)]).
hole(r287, [xy(66,28),xy(67,28),xy(66,28)]).
midline(r287, [xy(66,23),xy(67,23),xy(69,24),xy(70,26),xy(71,25),xy(71,26),xy(73,24)]).
fillpoint(r287, xy(71,26), 4).
fillpoint(r287, xy(71,25), 4).
fillpoint(r287, xy(70,26), 4).
fillpoint(r287, xy(73,24), 3).
fillpoint(r287, xy(72,27), 3).
region(r291, '#2e2b25', 5, centroid(23,24)).
polygon(r291, [xy(22,24),xy(23,23),xy(23,25),xy(22,24)]).
fillpoint(r291, xy(23,25), 1).
fillpoint(r291, xy(23,24), 1).
fillpoint(r291, xy(23,23), 1).
fillpoint(r291, xy(23,22), 1).
fillpoint(r291, xy(22,24), 1).
region(r292, '#523228', 4, centroid(26,23)).
polygon(r292, [xy(25,23),xy(25,24),xy(26,23),xy(26,22),xy(25,23)]).
fillpoint(r292, xy(26,23), 1).
fillpoint(r292, xy(26,22), 1).
fillpoint(r292, xy(25,24), 1).
fillpoint(r292, xy(25,23), 1).
region(r297, '#8c513b', 6, centroid(53,24)).
polygon(r297, [xy(52,25),xy(53,24),xy(53,23),xy(54,22),xy(54,23),xy(53,25),xy(52,25)]).
fillpoint(r297, xy(54,23), 1).
fillpoint(r297, xy(54,22), 1).
fillpoint(r297, xy(53,25), 1).
fillpoint(r297, xy(53,24), 1).
fillpoint(r297, xy(53,23), 1).
region(r299, '#5b4c3d', 4, centroid(95,24)).
polygon(r299, [xy(95,22),xy(95,25),xy(95,22)]).
fillpoint(r299, xy(95,25), 1).
fillpoint(r299, xy(95,24), 1).
fillpoint(r299, xy(95,23), 1).
fillpoint(r299, xy(95,22), 1).
region(r300, '#7f654a', 8, centroid(4,25)).
polygon(r300, [xy(3,23),xy(3,26),xy(4,25),xy(4,23),xy(3,23)]).
fillpoint(r300, xy(4,26), 1).
fillpoint(r300, xy(4,25), 1).
fillpoint(r300, xy(4,24), 1).
fillpoint(r300, xy(4,23), 1).
fillpoint(r300, xy(3,26), 1).
region(r302, '#2e2b25', 14, centroid(16,28)).
polygon(r302, [xy(16,23),xy(16,32),xy(17,31),xy(17,28),xy(16,23)]).
fillpoint(r302, xy(17,31), 1).
fillpoint(r302, xy(17,30), 1).
fillpoint(r302, xy(17,29), 1).
fillpoint(r302, xy(17,28), 1).
fillpoint(r302, xy(16,32), 1).
region(r312, '#483f33', 4, centroid(64,24)).
polygon(r312, [xy(63,24),xy(63,25),xy(64,24),xy(64,23),xy(63,24)]).
fillpoint(r312, xy(64,24), 1).
fillpoint(r312, xy(64,23), 1).
fillpoint(r312, xy(63,25), 1).
fillpoint(r312, xy(63,24), 1).
region(r314, '#2e2b25', 4, centroid(18,26)).
polygon(r314, [xy(18,24),xy(18,27),xy(18,24)]).
fillpoint(r314, xy(18,27), 1).
fillpoint(r314, xy(18,26), 1).
fillpoint(r314, xy(18,25), 1).
fillpoint(r314, xy(18,24), 1).
region(r315, '#5b4c3d', 25, centroid(21,27)).
polygon(r315, [xy(19,25),xy(19,29),xy(23,29),xy(24,28),xy(20,24),xy(19,25)]).
midline(r315, [xy(20,25),xy(21,27),xy(23,28)]).
fillpoint(r315, xy(21,27), 3).
fillpoint(r315, xy(23,28), 2).
fillpoint(r315, xy(22,28), 2).
fillpoint(r315, xy(22,27), 2).
fillpoint(r315, xy(21,28), 2).
region(r317, '#2e2b25', 8, centroid(25,26)).
polygon(r317, [xy(24,26),xy(26,24),xy(26,26),xy(25,27),xy(26,27),xy(24,26)]).
midline(r317, [xy(25,26)]).
fillpoint(r317, xy(25,26), 2).
fillpoint(r317, xy(26,27), 1).
fillpoint(r317, xy(26,26), 1).
fillpoint(r317, xy(26,25), 1).
fillpoint(r317, xy(26,24), 1).
region(r318, '#523228', 6, centroid(27,26)).
polygon(r318, [xy(26,28),xy(27,27),xy(27,24),xy(26,28)]).
fillpoint(r318, xy(27,28), 1).
fillpoint(r318, xy(27,27), 1).
fillpoint(r318, xy(27,26), 1).
fillpoint(r318, xy(27,25), 1).
fillpoint(r318, xy(27,24), 1).
region(r319, '#664131', 19, centroid(29,27)).
polygon(r319, [xy(27,29),xy(28,28),xy(28,24),xy(29,24),xy(29,25),xy(30,26),xy(30,27),xy(31,28),xy(30,29),xy(29,29),xy(28,30),xy(27,29)]).
midline(r319, [xy(28,29),xy(29,28),xy(29,26),xy(30,28)]).
fillpoint(r319, xy(30,28), 2).
fillpoint(r319, xy(29,28), 2).
fillpoint(r319, xy(29,27), 2).
fillpoint(r319, xy(29,26), 2).
fillpoint(r319, xy(28,29), 2).
region(r321, '#f3d0a5', 34, centroid(37,27)).
polygon(r321, [xy(34,28),xy(34,29),xy(35,30),xy(36,29),xy(36,31),xy(34,28)]).
midline(r321, [xy(35,28),xy(35,29),xy(36,28),xy(37,26),xy(39,25)]).
fillpoint(r321, xy(37,26), 3).
fillpoint(r321, xy(39,25), 2).
fillpoint(r321, xy(38,26), 2).
fillpoint(r321, xy(38,25), 2).
fillpoint(r321, xy(37,27), 2).
region(r326, '#483f33', 4, centroid(58,25)).
polygon(r326, [xy(57,25),xy(58,24),xy(58,26),xy(57,25)]).
fillpoint(r326, xy(58,26), 1).
fillpoint(r326, xy(58,25), 1).
fillpoint(r326, xy(58,24), 1).
fillpoint(r326, xy(57,25), 1).
region(r327, '#2e2b25', 6, centroid(59,26)).
polygon(r327, [xy(58,27),xy(59,26),xy(59,27),xy(60,26),xy(60,24),xy(58,27)]).
fillpoint(r327, xy(60,26), 1).
fillpoint(r327, xy(60,25), 1).
fillpoint(r327, xy(60,24), 1).
fillpoint(r327, xy(59,27), 1).
fillpoint(r327, xy(59,26), 1).
region(r328, '#5b4c3d', 46, centroid(83,28)).
polygon(r328, [xy(81,24),xy(81,34),xy(82,33),xy(83,33),xy(84,32),xy(84,31),xy(83,30),xy(82,30),xy(84,28),xy(83,27),xy(82,27),xy(84,29),xy(84,30),xy(81,24)]).
hole(r328, [xy(82,28),xy(82,29),xy(83,28),xy(83,29),xy(82,28)]).
midline(r328, [xy(82,25),xy(82,26),xy(84,26)]).
midline(r328, [xy(82,31),xy(82,32),xy(83,31),xy(83,32)]).
fillpoint(r328, xy(84,26), 3).
fillpoint(r328, xy(85,26), 2).
fillpoint(r328, xy(84,27), 2).
fillpoint(r328, xy(84,25), 2).
fillpoint(r328, xy(83,32), 2).
region(r329, '#483f33', 14, centroid(15,31)).
polygon(r329, [xy(15,25),xy(15,34),xy(16,33),xy(16,34),xy(17,33),xy(17,32),xy(15,25)]).
fillpoint(r329, xy(17,33), 1).
fillpoint(r329, xy(17,32), 1).
fillpoint(r329, xy(16,34), 1).
fillpoint(r329, xy(16,33), 1).
fillpoint(r329, xy(15,34), 1).
region(r332, '#74553f', 10, centroid(49,27)).
polygon(r332, [xy(48,27),xy(48,29),xy(49,27),xy(49,26),xy(50,25),xy(51,25),xy(51,26),xy(50,27),xy(48,27)]).
midline(r332, [xy(50,26)]).
fillpoint(r332, xy(50,26), 2).
fillpoint(r332, xy(51,26), 1).
fillpoint(r332, xy(51,25), 1).
fillpoint(r332, xy(50,27), 1).
fillpoint(r332, xy(50,25), 1).
region(r334, '#5b4c3d', 10, centroid(14,31)).
polygon(r334, [xy(14,26),xy(14,35),xy(14,26)]).
fillpoint(r334, xy(14,35), 1).
fillpoint(r334, xy(14,34), 1).
fillpoint(r334, xy(14,33), 1).
fillpoint(r334, xy(14,32), 1).
fillpoint(r334, xy(14,31), 1).
region(r340, '#5b4c3d', 40, centroid(57,34)).
polygon(r340, [xy(55,35),xy(55,40),xy(56,40),xy(57,39),xy(57,36),xy(56,35),xy(56,30),xy(57,29),xy(57,26),xy(55,35)]).
hole(r340, [xy(56,36),xy(56,39),xy(56,36)]).
midline(r340, [xy(57,30),xy(57,35),xy(58,34),xy(58,31)]).
fillpoint(r340, xy(58,34), 2).
fillpoint(r340, xy(58,33), 2).
fillpoint(r340, xy(58,32), 2).
fillpoint(r340, xy(58,31), 2).
fillpoint(r340, xy(57,35), 2).
region(r349, '#8c513b', 4, centroid(50,28)).
polygon(r349, [xy(49,28),xy(50,28),xy(51,27),xy(51,28),xy(49,28)]).
fillpoint(r349, xy(51,28), 1).
fillpoint(r349, xy(51,27), 1).
fillpoint(r349, xy(50,28), 1).
fillpoint(r349, xy(49,28), 1).
region(r354, '#2e2b25', 4, centroid(79,28)).
polygon(r354, [xy(78,29),xy(79,28),xy(79,29),xy(78,29)]).
fillpoint(r354, xy(79,29), 1).
fillpoint(r354, xy(79,28), 1).
fillpoint(r354, xy(79,27), 1).
fillpoint(r354, xy(78,29), 1).
region(r355, '#2e2b25', 10, centroid(94,31)).
polygon(r355, [xy(94,27),xy(94,35),xy(95,35),xy(94,27)]).
fillpoint(r355, xy(95,35), 1).
fillpoint(r355, xy(94,35), 1).
fillpoint(r355, xy(94,34), 1).
fillpoint(r355, xy(94,33), 1).
fillpoint(r355, xy(94,32), 1).
region(r356, '#483f33', 8, centroid(95,31)).
polygon(r356, [xy(95,27),xy(95,34),xy(95,27)]).
fillpoint(r356, xy(95,34), 1).
fillpoint(r356, xy(95,33), 1).
fillpoint(r356, xy(95,32), 1).
fillpoint(r356, xy(95,31), 1).
fillpoint(r356, xy(95,30), 1).
region(r357, '#7f654a', 58, centroid(3,35)).
polygon(r357, [xy(0,35),xy(0,40),xy(4,40),xy(5,39),xy(4,38),xy(5,37),xy(5,31),xy(3,29),xy(2,30),xy(2,33),xy(1,34),xy(0,35)]).
midline(r357, [xy(2,35),xy(2,38),xy(3,37),xy(3,30),xy(4,31),xy(4,32)]).
midline(r357, [xy(4,39)]).
fillpoint(r357, xy(3,37), 3).
fillpoint(r357, xy(3,36), 3).
fillpoint(r357, xy(3,35), 3).
fillpoint(r357, xy(3,34), 3).
fillpoint(r357, xy(2,38), 3).
region(r363, '#523228', 5, centroid(45,28)).
polygon(r363, [xy(44,28),xy(45,28),xy(45,29),xy(46,28),xy(46,29),xy(44,28)]).
fillpoint(r363, xy(46,29), 1).
fillpoint(r363, xy(46,28), 1).
fillpoint(r363, xy(45,29), 1).
fillpoint(r363, xy(45,28), 1).
fillpoint(r363, xy(44,28), 1).
region(r366, '#2e2b25', 7, centroid(54,30)).
polygon(r366, [xy(53,28),xy(53,30),xy(54,30),xy(54,32),xy(55,32),xy(53,28)]).
fillpoint(r366, xy(55,32), 1).
fillpoint(r366, xy(54,32), 1).
fillpoint(r366, xy(54,31), 1).
fillpoint(r366, xy(54,30), 1).
fillpoint(r366, xy(53,30), 1).
region(r367, '#483f33', 8, centroid(59,30)).
polygon(r367, [xy(58,28),xy(58,29),xy(59,28),xy(59,29),xy(60,29),xy(60,32),xy(58,28)]).
fillpoint(r367, xy(60,32), 1).
fillpoint(r367, xy(60,31), 1).
fillpoint(r367, xy(60,30), 1).
fillpoint(r367, xy(60,29), 1).
fillpoint(r367, xy(59,29), 1).
region(r371, '#483f33', 4, centroid(83,29)).
polygon(r371, [xy(82,28),xy(82,29),xy(83,28),xy(83,29),xy(82,28)]).
fillpoint(r371, xy(83,29), 1).
fillpoint(r371, xy(83,28), 1).
fillpoint(r371, xy(82,29), 1).
fillpoint(r371, xy(82,28), 1).
region(r372, '#74553f', 12, centroid(21,30)).
polygon(r372, [xy(19,30),xy(19,31),xy(20,30),xy(21,30),xy(21,31),xy(22,30),xy(23,30),xy(24,29),xy(24,31),xy(19,30)]).
midline(r372, [xy(20,31)]).
fillpoint(r372, xy(20,31), 2).
fillpoint(r372, xy(24,31), 1).
fillpoint(r372, xy(24,30), 1).
fillpoint(r372, xy(24,29), 1).
fillpoint(r372, xy(23,30), 1).
region(r374, '#97704e', 5, centroid(26,30)).
polygon(r374, [xy(25,30),xy(25,31),xy(26,30),xy(26,31),xy(25,30)]).
fillpoint(r374, xy(26,31), 1).
fillpoint(r374, xy(26,30), 1).
fillpoint(r374, xy(26,29), 1).
fillpoint(r374, xy(25,31), 1).
fillpoint(r374, xy(25,30), 1).
region(r378, '#8c513b', 4, centroid(44,30)).
polygon(r378, [xy(43,30),xy(43,31),xy(44,30),xy(44,29),xy(43,30)]).
fillpoint(r378, xy(44,30), 1).
fillpoint(r378, xy(44,29), 1).
fillpoint(r378, xy(43,31), 1).
fillpoint(r378, xy(43,30), 1).
region(r385, '#7f654a', 11, centroid(12,32)).
polygon(r385, [xy(12,30),xy(12,35),xy(13,34),xy(13,30),xy(12,30)]).
fillpoint(r385, xy(13,34), 1).
fillpoint(r385, xy(13,33), 1).
fillpoint(r385, xy(13,32), 1).
fillpoint(r385, xy(13,31), 1).
fillpoint(r385, xy(13,30), 1).
region(r391, '#97704e', 8, centroid(42,32)).
polygon(r391, [xy(41,31),xy(42,30),xy(42,34),xy(43,33),xy(43,32),xy(41,31)]).
fillpoint(r391, xy(43,33), 1).
fillpoint(r391, xy(43,32), 1).
fillpoint(r391, xy(42,34), 1).
fillpoint(r391, xy(42,33), 1).
fillpoint(r391, xy(42,32), 1).
region(r392, '#74553f', 34, centroid(43,35)).
polygon(r392, [xy(38,38),xy(38,40),xy(39,38),xy(39,37),xy(40,37),xy(40,38),xy(42,36),xy(42,37),xy(43,38),xy(43,39),xy(44,38),xy(44,36),xy(43,35),xy(44,34),xy(44,31),xy(45,30),xy(47,30),xy(47,31),xy(45,33),xy(45,35),xy(38,38)]).
midline(r392, [xy(43,36),xy(43,37),xy(44,35)]).
midline(r392, [xy(45,31),xy(45,32),xy(46,31)]).
fillpoint(r392, xy(46,31), 2).
fillpoint(r392, xy(45,32), 2).
fillpoint(r392, xy(45,31), 2).
fillpoint(r392, xy(44,35), 2).
fillpoint(r392, xy(43,37), 2).
region(r394, '#74553f', 5, centroid(50,30)).
polygon(r394, [xy(49,31),xy(50,30),xy(50,31),xy(51,30),xy(52,30),xy(49,31)]).
fillpoint(r394, xy(52,30), 1).
fillpoint(r394, xy(51,30), 1).
fillpoint(r394, xy(50,31), 1).
fillpoint(r394, xy(50,30), 1).
fillpoint(r394, xy(49,31), 1).
region(r396, '#5b4c3d', 14, centroid(75,31)).
polygon(r396, [xy(72,30),xy(72,31),xy(73,30),xy(73,31),xy(74,30),xy(76,30),xy(76,31),xy(75,32),xy(74,32),xy(72,30)]).
midline(r396, [xy(74,31),xy(75,31)]).
fillpoint(r396, xy(75,31), 2).
fillpoint(r396, xy(74,31), 2).
fillpoint(r396, xy(77,31), 1).
fillpoint(r396, xy(77,30), 1).
fillpoint(r396, xy(76,31), 1).
region(r400, '#7f654a', 4, centroid(48,32)).
polygon(r400, [xy(47,32),xy(48,31),xy(48,32),xy(49,32),xy(47,32)]).
fillpoint(r400, xy(49,32), 1).
fillpoint(r400, xy(48,32), 1).
fillpoint(r400, xy(48,31), 1).
fillpoint(r400, xy(47,32), 1).
region(r401, '#97704e', 19, centroid(50,34)).
polygon(r401, [xy(47,33),xy(47,34),xy(48,33),xy(48,34),xy(51,31),xy(51,35),xy(50,36),xy(49,35),xy(51,36),xy(51,37),xy(47,33)]).
midline(r401, [xy(49,34),xy(50,33),xy(50,35)]).
fillpoint(r401, xy(50,35), 2).
fillpoint(r401, xy(50,34), 2).
fillpoint(r401, xy(50,33), 2).
fillpoint(r401, xy(49,34), 2).
fillpoint(r401, xy(51,37), 1).
region(r402, '#7f654a', 12, centroid(53,36)).
polygon(r402, [xy(52,31),xy(52,38),xy(53,38),xy(53,39),xy(54,38),xy(54,39),xy(52,31)]).
fillpoint(r402, xy(54,39), 1).
fillpoint(r402, xy(54,38), 1).
fillpoint(r402, xy(53,39), 1).
fillpoint(r402, xy(53,38), 1).
fillpoint(r402, xy(52,38), 1).
region(r404, '#5b4c3d', 5, centroid(11,34)).
polygon(r404, [xy(11,32),xy(11,36),xy(11,32)]).
fillpoint(r404, xy(11,36), 1).
fillpoint(r404, xy(11,35), 1).
fillpoint(r404, xy(11,34), 1).
fillpoint(r404, xy(11,33), 1).
fillpoint(r404, xy(11,32), 1).
region(r409, '#f3d0a5', 149, centroid(24,37)).
polygon(r409, [xy(9,40),xy(10,39),xy(10,40),xy(17,40),xy(18,39),xy(18,40),xy(19,38),xy(19,37),xy(20,36),xy(21,37),xy(22,36),xy(22,37),xy(23,35),xy(23,34),xy(22,33),xy(21,33),xy(20,34),xy(19,34),xy(18,35),xy(17,35),xy(16,36),xy(15,36),xy(14,37),xy(13,37),xy(12,38),xy(11,38),xy(9,40)]).
midline(r409, [xy(11,39),xy(12,39),xy(13,38),xy(13,39),xy(15,38),xy(16,38),xy(17,37),xy(17,38),xy(19,36),xy(19,35),xy(21,35)]).
midline(r409, [xy(25,33)]).
midline(r409, [xy(27,37),xy(29,36)]).
midline(r409, [xy(32,36),xy(32,37),xy(33,36),xy(33,35)]).
midline(r409, [xy(32,39)]).
fillpoint(r409, xy(29,36), 5).
fillpoint(r409, xy(30,36), 4).
fillpoint(r409, xy(29,37), 4).
fillpoint(r409, xy(29,35), 4).
fillpoint(r409, xy(28,37), 4).
region(r410, '#f3d0a5', 4, centroid(38,33)).
polygon(r410, [xy(37,32),xy(37,33),xy(39,33),xy(37,32)]).
fillpoint(r410, xy(39,33), 1).
fillpoint(r410, xy(38,33), 1).
fillpoint(r410, xy(37,33), 1).
fillpoint(r410, xy(37,32), 1).
region(r412, '#2e2b25', 10, centroid(64,34)).
polygon(r412, [xy(62,35),xy(63,34),xy(63,32),xy(64,33),xy(64,34),xy(63,35),xy(65,34),xy(67,34),xy(62,35)]).
fillpoint(r412, xy(67,34), 1).
fillpoint(r412, xy(66,34), 1).
fillpoint(r412, xy(65,34), 1).
fillpoint(r412, xy(64,34), 1).
fillpoint(r412, xy(64,33), 1).
region(r413, '#5b4c3d', 5, centroid(6,35)).
polygon(r413, [xy(6,33),xy(6,37),xy(6,33)]).
fillpoint(r413, xy(6,37), 1).
fillpoint(r413, xy(6,36), 1).
fillpoint(r413, xy(6,35), 1).
fillpoint(r413, xy(6,34), 1).
fillpoint(r413, xy(6,33), 1).
region(r416, '#74553f', 8, centroid(53,35)).
polygon(r416, [xy(53,33),xy(53,37),xy(54,36),xy(54,37),xy(53,33)]).
fillpoint(r416, xy(54,37), 1).
fillpoint(r416, xy(54,36), 1).
fillpoint(r416, xy(54,35), 1).
fillpoint(r416, xy(53,37), 1).
fillpoint(r416, xy(53,36), 1).
region(r420, '#5b4c3d', 5, centroid(92,34)).
polygon(r420, [xy(91,33),xy(91,34),xy(92,33),xy(92,34),xy(93,34),xy(91,33)]).
fillpoint(r420, xy(93,34), 1).
fillpoint(r420, xy(92,34), 1).
fillpoint(r420, xy(92,33), 1).
fillpoint(r420, xy(91,34), 1).
fillpoint(r420, xy(91,33), 1).
region(r423, '#d2a379', 18, centroid(22,38)).
polygon(r423, [xy(19,39),xy(19,40),xy(20,40),xy(21,39),xy(20,38),xy(20,37),xy(21,38),xy(22,38),xy(23,37),xy(23,36),xy(24,35),xy(24,36),xy(23,38),xy(23,39),xy(22,40),xy(19,39)]).
midline(r423, [xy(20,39),xy(22,39)]).
fillpoint(r423, xy(22,39), 2).
fillpoint(r423, xy(20,39), 2).
fillpoint(r423, xy(24,36), 1).
fillpoint(r423, xy(24,35), 1).
fillpoint(r423, xy(24,34), 1).
region(r432, '#523228', 11, centroid(46,38)).
polygon(r432, [xy(45,40),xy(46,39),xy(46,35),xy(48,37),xy(47,38),xy(46,40),xy(45,40)]).
midline(r432, [xy(47,37)]).
fillpoint(r432, xy(47,37), 2).
fillpoint(r432, xy(48,37), 1).
fillpoint(r432, xy(47,38), 1).
fillpoint(r432, xy(47,36), 1).
fillpoint(r432, xy(46,40), 1).
region(r437, '#2e2b25', 5, centroid(84,35)).
polygon(r437, [xy(82,35),xy(86,35),xy(82,35)]).
fillpoint(r437, xy(86,35), 1).
fillpoint(r437, xy(85,35), 1).
fillpoint(r437, xy(84,35), 1).
fillpoint(r437, xy(83,35), 1).
fillpoint(r437, xy(82,35), 1).
region(r446, '#664131', 16, centroid(42,39)).
polygon(r446, [xy(39,39),xy(39,40),xy(41,38),xy(42,38),xy(42,39),xy(41,40),xy(43,40),xy(44,39),xy(44,40),xy(45,39),xy(45,36),xy(39,39)]).
midline(r446, [xy(41,39)]).
fillpoint(r446, xy(41,39), 2).
fillpoint(r446, xy(45,39), 1).
fillpoint(r446, xy(45,38), 1).
fillpoint(r446, xy(45,37), 1).
fillpoint(r446, xy(45,36), 1).
region(r449, '#483f33', 4, centroid(56,38)).
polygon(r449, [xy(56,36),xy(56,39),xy(56,36)]).
fillpoint(r449, xy(56,39), 1).
fillpoint(r449, xy(56,38), 1).
fillpoint(r449, xy(56,37), 1).
fillpoint(r449, xy(56,36), 1).
region(r454, '#7f654a', 4, centroid(66,37)).
polygon(r454, [xy(66,36),xy(66,38),xy(67,38),xy(66,36)]).
fillpoint(r454, xy(67,38), 1).
fillpoint(r454, xy(66,38), 1).
fillpoint(r454, xy(66,37), 1).
fillpoint(r454, xy(66,36), 1).
region(r456, '#5b4c3d', 6, centroid(78,36)).
polygon(r456, [xy(75,36),xy(80,36),xy(75,36)]).
fillpoint(r456, xy(80,36), 1).
fillpoint(r456, xy(79,36), 1).
fillpoint(r456, xy(78,36), 1).
fillpoint(r456, xy(77,36), 1).
fillpoint(r456, xy(76,36), 1).
region(r468, '#483f33', 4, centroid(7,39)).
polygon(r468, [xy(7,38),xy(7,40),xy(8,38),xy(7,38)]).
fillpoint(r468, xy(8,38), 1).
fillpoint(r468, xy(7,40), 1).
fillpoint(r468, xy(7,39), 1).
fillpoint(r468, xy(7,38), 1).
region(r471, '#2e2b25', 10, centroid(49,39)).
polygon(r471, [xy(47,39),xy(47,40),xy(48,40),xy(49,39),xy(48,38),xy(49,40),xy(50,39),xy(50,40),xy(51,40),xy(47,39)]).
midline(r471, [xy(48,39)]).
fillpoint(r471, xy(48,39), 2).
fillpoint(r471, xy(51,40), 1).
fillpoint(r471, xy(50,40), 1).
fillpoint(r471, xy(50,39), 1).
fillpoint(r471, xy(49,40), 1).
region(r485, '#5b4c3d', 5, centroid(86,39)).
polygon(r485, [xy(85,40),xy(86,39),xy(86,40),xy(87,39),xy(88,39),xy(85,40)]).
fillpoint(r485, xy(88,39), 1).
fillpoint(r485, xy(87,39), 1).
fillpoint(r485, xy(86,40), 1).
fillpoint(r485, xy(86,39), 1).
fillpoint(r485, xy(85,40), 1).
adjacent(r1, r128).
shared_edge(r1, r128, 2).
adjacent(r1, r156).
shared_edge(r1, r156, 1).
adjacent(r1, r2).
shared_edge(r1, r2, 4).
adjacent(r1, r49).
shared_edge(r1, r49, 1).
adjacent(r1, r76).
shared_edge(r1, r76, 6).
adjacent(r10, r104).
shared_edge(r10, r104, 4).
adjacent(r10, r11).
shared_edge(r10, r11, 3).
adjacent(r10, r116).
shared_edge(r10, r116, 24).
adjacent(r10, r12).
shared_edge(r10, r12, 17).
adjacent(r10, r13).
shared_edge(r10, r13, 5).
adjacent(r10, r157).
shared_edge(r10, r157, 6).
adjacent(r10, r167).
shared_edge(r10, r167, 9).
adjacent(r10, r254).
shared_edge(r10, r254, 2).
adjacent(r10, r262).
shared_edge(r10, r262, 1).
adjacent(r10, r263).
shared_edge(r10, r263, 1).
adjacent(r10, r54).
shared_edge(r10, r54, 8).
adjacent(r10, r78).
shared_edge(r10, r78, 12).
adjacent(r10, r9).
shared_edge(r10, r9, 2).
adjacent(r10, r91).
shared_edge(r10, r91, 1).
adjacent(r100, r101).
shared_edge(r100, r101, 2).
adjacent(r100, r122).
shared_edge(r100, r122, 1).
adjacent(r100, r23).
shared_edge(r100, r23, 2).
adjacent(r100, r62).
shared_edge(r100, r62, 1).
adjacent(r101, r122).
shared_edge(r101, r122, 5).
adjacent(r101, r26).
shared_edge(r101, r26, 1).
adjacent(r101, r95).
shared_edge(r101, r95, 1).
adjacent(r101, r96).
shared_edge(r101, r96, 5).
adjacent(r102, r111).
shared_edge(r102, r111, 1).
adjacent(r102, r112).
shared_edge(r102, r112, 1).
adjacent(r102, r34).
shared_edge(r102, r34, 4).
adjacent(r103, r4).
shared_edge(r103, r4, 4).
adjacent(r105, r133).
shared_edge(r105, r133, 8).
adjacent(r105, r134).
shared_edge(r105, r134, 6).
adjacent(r105, r172).
shared_edge(r105, r172, 26).
adjacent(r105, r187).
shared_edge(r105, r187, 3).
adjacent(r105, r196).
shared_edge(r105, r196, 11).
adjacent(r105, r198).
shared_edge(r105, r198, 1).
adjacent(r105, r207).
shared_edge(r105, r207, 1).
adjacent(r105, r223).
shared_edge(r105, r223, 9).
adjacent(r105, r224).
shared_edge(r105, r224, 10).
adjacent(r105, r241).
shared_edge(r105, r241, 2).
adjacent(r105, r274).
shared_edge(r105, r274, 8).
adjacent(r105, r305).
shared_edge(r105, r305, 1).
adjacent(r105, r306).
shared_edge(r105, r306, 3).
adjacent(r105, r319).
shared_edge(r105, r319, 3).
adjacent(r105, r320).
shared_edge(r105, r320, 3).
adjacent(r105, r321).
shared_edge(r105, r321, 34).
adjacent(r105, r322).
shared_edge(r105, r322, 3).
adjacent(r105, r336).
shared_edge(r105, r336, 1).
adjacent(r105, r346).
shared_edge(r105, r346, 2).
adjacent(r105, r347).
shared_edge(r105, r347, 3).
adjacent(r105, r360).
shared_edge(r105, r360, 3).
adjacent(r105, r361).
shared_edge(r105, r361, 2).
adjacent(r105, r362).
shared_edge(r105, r362, 2).
adjacent(r105, r374).
shared_edge(r105, r374, 1).
adjacent(r105, r376).
shared_edge(r105, r376, 2).
adjacent(r105, r377).
shared_edge(r105, r377, 1).
adjacent(r105, r386).
shared_edge(r105, r386, 1).
adjacent(r105, r387).
shared_edge(r105, r387, 1).
adjacent(r105, r388).
shared_edge(r105, r388, 1).
adjacent(r105, r389).
shared_edge(r105, r389, 1).
adjacent(r105, r390).
shared_edge(r105, r390, 2).
adjacent(r105, r391).
shared_edge(r105, r391, 8).
adjacent(r105, r409).
shared_edge(r105, r409, 22).
adjacent(r105, r410).
shared_edge(r105, r410, 10).
adjacent(r105, r430).
shared_edge(r105, r430, 2).
adjacent(r105, r442).
shared_edge(r105, r442, 2).
adjacent(r105, r443).
shared_edge(r105, r443, 1).
adjacent(r105, r444).
shared_edge(r105, r444, 1).
adjacent(r105, r460).
shared_edge(r105, r460, 3).
adjacent(r105, r477).
shared_edge(r105, r477, 3).
adjacent(r105, r93).
shared_edge(r105, r93, 7).
adjacent(r106, r23).
shared_edge(r106, r23, 1).
adjacent(r106, r44).
shared_edge(r106, r44, 1).
adjacent(r106, r60).
shared_edge(r106, r60, 1).
adjacent(r106, r85).
shared_edge(r106, r85, 1).
adjacent(r107, r138).
shared_edge(r107, r138, 3).
adjacent(r107, r23).
shared_edge(r107, r23, 9).
adjacent(r108, r122).
shared_edge(r108, r122, 3).
adjacent(r108, r123).
shared_edge(r108, r123, 1).
adjacent(r108, r26).
shared_edge(r108, r26, 1).
adjacent(r108, r88).
shared_edge(r108, r88, 1).
adjacent(r108, r96).
shared_edge(r108, r96, 2).
adjacent(r109, r124).
shared_edge(r109, r124, 1).
adjacent(r109, r26).
shared_edge(r109, r26, 3).
adjacent(r110, r32).
shared_edge(r110, r32, 4).
adjacent(r111, r112).
shared_edge(r111, r112, 1).
adjacent(r111, r32).
shared_edge(r111, r32, 2).
adjacent(r112, r127).
shared_edge(r112, r127, 2).
adjacent(r112, r143).
shared_edge(r112, r143, 1).
adjacent(r112, r144).
shared_edge(r112, r144, 1).
adjacent(r112, r34).
shared_edge(r112, r34, 2).
adjacent(r113, r114).
shared_edge(r113, r114, 1).
adjacent(r113, r50).
shared_edge(r113, r50, 1).
adjacent(r113, r90).
shared_edge(r113, r90, 2).
adjacent(r114, r182).
shared_edge(r114, r182, 1).
adjacent(r114, r4).
shared_edge(r114, r4, 6).
adjacent(r114, r90).
shared_edge(r114, r90, 4).
adjacent(r115, r116).
shared_edge(r115, r116, 1).
adjacent(r115, r130).
shared_edge(r115, r130, 1).
adjacent(r115, r4).
shared_edge(r115, r4, 2).
adjacent(r116, r130).
shared_edge(r116, r130, 1).
adjacent(r116, r146).
shared_edge(r116, r146, 3).
adjacent(r116, r166).
shared_edge(r116, r166, 6).
adjacent(r116, r223).
shared_edge(r116, r223, 2).
adjacent(r116, r240).
shared_edge(r116, r240, 1).
adjacent(r116, r253).
shared_edge(r116, r253, 2).
adjacent(r116, r254).
shared_edge(r116, r254, 3).
adjacent(r116, r261).
shared_edge(r116, r261, 4).
adjacent(r116, r262).
shared_edge(r116, r262, 3).
adjacent(r116, r291).
shared_edge(r116, r291, 3).
adjacent(r116, r292).
shared_edge(r116, r292, 7).
adjacent(r116, r293).
shared_edge(r116, r293, 3).
adjacent(r116, r318).
shared_edge(r116, r318, 1).
adjacent(r116, r331).
shared_edge(r116, r331, 1).
adjacent(r116, r91).
shared_edge(r116, r91, 1).
adjacent(r117, r78).
shared_edge(r117, r78, 3).
adjacent(r117, r79).
shared_edge(r117, r79, 1).
adjacent(r118, r132).
shared_edge(r118, r132, 1).
adjacent(r118, r14).
shared_edge(r118, r14, 1).
adjacent(r118, r79).
shared_edge(r118, r79, 2).
adjacent(r119, r120).
shared_edge(r119, r120, 1).
adjacent(r119, r137).
shared_edge(r119, r137, 1).
adjacent(r119, r85).
shared_edge(r119, r85, 1).
adjacent(r119, r93).
shared_edge(r119, r93, 1).
adjacent(r120, r23).
shared_edge(r120, r23, 2).
adjacent(r120, r85).
shared_edge(r120, r85, 1).
adjacent(r121, r122).
shared_edge(r121, r122, 2).
adjacent(r121, r23).
shared_edge(r121, r23, 2).
adjacent(r122, r123).
shared_edge(r122, r123, 1).
adjacent(r122, r139).
shared_edge(r122, r139, 3).
adjacent(r122, r161).
shared_edge(r122, r161, 36).
adjacent(r122, r176).
shared_edge(r122, r176, 6).
adjacent(r122, r177).
shared_edge(r122, r177, 1).
adjacent(r122, r190).
shared_edge(r122, r190, 1).
adjacent(r122, r191).
shared_edge(r122, r191, 3).
adjacent(r122, r229).
shared_edge(r122, r229, 4).
adjacent(r122, r23).
shared_edge(r122, r23, 3).
adjacent(r122, r96).
shared_edge(r122, r96, 1).
adjacent(r123, r124).
shared_edge(r123, r124, 1).
adjacent(r123, r26).
shared_edge(r123, r26, 1).
adjacent(r124, r139).
shared_edge(r124, r139, 2).
adjacent(r124, r26).
shared_edge(r124, r26, 2).
adjacent(r125, r140).
shared_edge(r125, r140, 4).
adjacent(r125, r141).
shared_edge(r125, r141, 10).
adjacent(r125, r178).
shared_edge(r125, r178, 10).
adjacent(r125, r193).
shared_edge(r125, r193, 1).
adjacent(r125, r202).
shared_edge(r125, r202, 1).
adjacent(r125, r26).
shared_edge(r125, r26, 6).
adjacent(r126, r141).
shared_edge(r126, r141, 1).
adjacent(r126, r26).
shared_edge(r126, r26, 1).
adjacent(r126, r32).
shared_edge(r126, r32, 2).
adjacent(r127, r143).
shared_edge(r127, r143, 7).
adjacent(r127, r155).
shared_edge(r127, r155, 2).
adjacent(r127, r32).
shared_edge(r127, r32, 7).
adjacent(r128, r156).
shared_edge(r128, r156, 1).
adjacent(r128, r165).
shared_edge(r128, r165, 1).
adjacent(r128, r76).
shared_edge(r128, r76, 1).
adjacent(r128, r90).
shared_edge(r128, r90, 3).
adjacent(r129, r4).
shared_edge(r129, r4, 6).
adjacent(r13, r14).
shared_edge(r13, r14, 6).
adjacent(r130, r145).
shared_edge(r130, r145, 1).
adjacent(r130, r146).
shared_edge(r130, r146, 1).
adjacent(r130, r4).
shared_edge(r130, r4, 2).
adjacent(r131, r132).
shared_edge(r131, r132, 1).
adjacent(r131, r147).
shared_edge(r131, r147, 3).
adjacent(r131, r78).
shared_edge(r131, r78, 4).
adjacent(r131, r79).
shared_edge(r131, r79, 2).
adjacent(r132, r14).
shared_edge(r132, r14, 2).
adjacent(r132, r148).
shared_edge(r132, r148, 2).
adjacent(r133, r14).
shared_edge(r133, r14, 5).
adjacent(r133, r158).
shared_edge(r133, r158, 1).
adjacent(r133, r170).
shared_edge(r133, r170, 1).
adjacent(r133, r171).
shared_edge(r133, r171, 1).
adjacent(r134, r135).
shared_edge(r134, r135, 1).
adjacent(r134, r137).
shared_edge(r134, r137, 1).
adjacent(r134, r150).
shared_edge(r134, r150, 1).
adjacent(r134, r173).
shared_edge(r134, r173, 1).
adjacent(r134, r187).
shared_edge(r134, r187, 2).
adjacent(r135, r136).
shared_edge(r135, r136, 1).
adjacent(r135, r150).
shared_edge(r135, r150, 1).
adjacent(r135, r93).
shared_edge(r135, r93, 1).
adjacent(r136, r137).
shared_edge(r136, r137, 2).
adjacent(r136, r93).
shared_edge(r136, r93, 1).
adjacent(r137, r150).
shared_edge(r137, r150, 2).
adjacent(r137, r173).
shared_edge(r137, r173, 2).
adjacent(r137, r187).
shared_edge(r137, r187, 3).
adjacent(r137, r188).
shared_edge(r137, r188, 4).
adjacent(r137, r208).
shared_edge(r137, r208, 2).
adjacent(r137, r225).
shared_edge(r137, r225, 1).
adjacent(r137, r23).
shared_edge(r137, r23, 5).
adjacent(r137, r242).
shared_edge(r137, r242, 1).
adjacent(r137, r255).
shared_edge(r137, r255, 1).
adjacent(r137, r265).
shared_edge(r137, r265, 1).
adjacent(r138, r152).
shared_edge(r138, r152, 2).
adjacent(r138, r153).
shared_edge(r138, r153, 1).
adjacent(r138, r159).
shared_edge(r138, r159, 3).
adjacent(r138, r160).
shared_edge(r138, r160, 3).
adjacent(r138, r161).
shared_edge(r138, r161, 4).
adjacent(r138, r189).
shared_edge(r138, r189, 1).
adjacent(r138, r190).
shared_edge(r138, r190, 2).
adjacent(r138, r200).
shared_edge(r138, r200, 1).
adjacent(r138, r209).
shared_edge(r138, r209, 2).
adjacent(r138, r228).
shared_edge(r138, r228, 1).
adjacent(r138, r23).
shared_edge(r138, r23, 4).
adjacent(r138, r244).
shared_edge(r138, r244, 2).
adjacent(r138, r267).
shared_edge(r138, r267, 1).
adjacent(r138, r268).
shared_edge(r138, r268, 1).
adjacent(r138, r279).
shared_edge(r138, r279, 2).
adjacent(r138, r280).
shared_edge(r138, r280, 1).
adjacent(r138, r286).
shared_edge(r138, r286, 1).
adjacent(r138, r287).
shared_edge(r138, r287, 10).
adjacent(r138, r297).
shared_edge(r138, r297, 2).
adjacent(r138, r298).
shared_edge(r138, r298, 2).
adjacent(r138, r311).
shared_edge(r138, r311, 3).
adjacent(r138, r324).
shared_edge(r138, r324, 2).
adjacent(r138, r325).
shared_edge(r138, r325, 2).
adjacent(r138, r326).
shared_edge(r138, r326, 3).
adjacent(r138, r327).
shared_edge(r138, r327, 7).
adjacent(r138, r339).
shared_edge(r138, r339, 2).
adjacent(r138, r340).
shared_edge(r138, r340, 6).
adjacent(r138, r350).
shared_edge(r138, r350, 1).
adjacent(r138, r351).
shared_edge(r138, r351, 3).
adjacent(r138, r352).
shared_edge(r138, r352, 1).
adjacent(r138, r366).
shared_edge(r138, r366, 7).
adjacent(r138, r367).
shared_edge(r138, r367, 4).
adjacent(r138, r368).
shared_edge(r138, r368, 1).
adjacent(r138, r381).
shared_edge(r138, r381, 1).
adjacent(r138, r395).
shared_edge(r138, r395, 4).
adjacent(r138, r412).
shared_edge(r138, r412, 7).
adjacent(r138, r418).
shared_edge(r138, r418, 2).
adjacent(r138, r435).
shared_edge(r138, r435, 2).
adjacent(r138, r450).
shared_edge(r138, r450, 1).
adjacent(r138, r451).
shared_edge(r138, r451, 2).
adjacent(r138, r452).
shared_edge(r138, r452, 2).
adjacent(r138, r454).
shared_edge(r138, r454, 1).
adjacent(r138, r464).
shared_edge(r138, r464, 2).
adjacent(r138, r481).
shared_edge(r138, r481, 2).
adjacent(r138, r491).
shared_edge(r138, r491, 2).
adjacent(r138, r492).
shared_edge(r138, r492, 1).
adjacent(r139, r140).
shared_edge(r139, r140, 2).
adjacent(r139, r154).
shared_edge(r139, r154, 3).
adjacent(r139, r177).
shared_edge(r139, r177, 2).
adjacent(r14, r149).
shared_edge(r14, r149, 2).
adjacent(r14, r15).
shared_edge(r14, r15, 16).
adjacent(r14, r158).
shared_edge(r14, r158, 1).
adjacent(r14, r16).
shared_edge(r14, r16, 1).
adjacent(r14, r40).
shared_edge(r14, r40, 1).
adjacent(r14, r55).
shared_edge(r14, r55, 2).
adjacent(r14, r56).
shared_edge(r14, r56, 1).
adjacent(r14, r68).
shared_edge(r14, r68, 2).
adjacent(r14, r78).
shared_edge(r14, r78, 5).
adjacent(r14, r79).
shared_edge(r14, r79, 15).
adjacent(r14, r80).
shared_edge(r14, r80, 3).
adjacent(r14, r92).
shared_edge(r14, r92, 1).
adjacent(r14, r93).
shared_edge(r14, r93, 6).
adjacent(r140, r154).
shared_edge(r140, r154, 1).
adjacent(r140, r177).
shared_edge(r140, r177, 1).
adjacent(r140, r192).
shared_edge(r140, r192, 1).
adjacent(r140, r26).
shared_edge(r140, r26, 1).
adjacent(r141, r142).
shared_edge(r141, r142, 3).
adjacent(r141, r155).
shared_edge(r141, r155, 1).
adjacent(r141, r162).
shared_edge(r141, r162, 4).
adjacent(r141, r32).
shared_edge(r141, r32, 7).
adjacent(r142, r32).
shared_edge(r142, r32, 1).
adjacent(r143, r144).
shared_edge(r143, r144, 2).
adjacent(r143, r163).
shared_edge(r143, r163, 5).
adjacent(r143, r164).
shared_edge(r143, r164, 3).
adjacent(r143, r179).
shared_edge(r143, r179, 2).
adjacent(r143, r193).
shared_edge(r143, r193, 3).
adjacent(r143, r194).
shared_edge(r143, r194, 2).
adjacent(r143, r203).
shared_edge(r143, r203, 1).
adjacent(r143, r204).
shared_edge(r143, r204, 2).
adjacent(r143, r215).
shared_edge(r143, r215, 2).
adjacent(r143, r216).
shared_edge(r143, r216, 1).
adjacent(r143, r217).
shared_edge(r143, r217, 1).
adjacent(r144, r164).
shared_edge(r144, r164, 1).
adjacent(r145, r4).
shared_edge(r145, r4, 3).
adjacent(r146, r166).
shared_edge(r146, r166, 1).
adjacent(r146, r4).
shared_edge(r146, r4, 1).
adjacent(r147, r148).
shared_edge(r147, r148, 5).
adjacent(r147, r169).
shared_edge(r147, r169, 2).
adjacent(r148, r149).
shared_edge(r148, r149, 2).
adjacent(r148, r158).
shared_edge(r148, r158, 1).
adjacent(r148, r170).
shared_edge(r148, r170, 3).
adjacent(r148, r186).
shared_edge(r148, r186, 1).
adjacent(r148, r196).
shared_edge(r148, r196, 1).
adjacent(r148, r197).
shared_edge(r148, r197, 1).
adjacent(r151, r23).
shared_edge(r151, r23, 6).
adjacent(r152, r23).
shared_edge(r152, r23, 2).
adjacent(r153, r23).
shared_edge(r153, r23, 3).
adjacent(r155, r162).
shared_edge(r155, r162, 1).
adjacent(r155, r163).
shared_edge(r155, r163, 1).
adjacent(r155, r32).
shared_edge(r155, r32, 1).
adjacent(r156, r165).
shared_edge(r156, r165, 4).
adjacent(r156, r218).
shared_edge(r156, r218, 1).
adjacent(r158, r171).
shared_edge(r158, r171, 1).
adjacent(r159, r23).
shared_edge(r159, r23, 1).
adjacent(r16, r17).
shared_edge(r16, r17, 1).
adjacent(r16, r40).
shared_edge(r16, r40, 1).
adjacent(r160, r23).
shared_edge(r160, r23, 3).
adjacent(r161, r177).
shared_edge(r161, r177, 1).
adjacent(r161, r178).
shared_edge(r161, r178, 1).
adjacent(r161, r190).
shared_edge(r161, r190, 1).
adjacent(r161, r201).
shared_edge(r161, r201, 1).
adjacent(r161, r229).
shared_edge(r161, r229, 6).
adjacent(r161, r230).
shared_edge(r161, r230, 1).
adjacent(r161, r245).
shared_edge(r161, r245, 14).
adjacent(r161, r246).
shared_edge(r161, r246, 2).
adjacent(r161, r247).
shared_edge(r161, r247, 11).
adjacent(r161, r268).
shared_edge(r161, r268, 2).
adjacent(r161, r281).
shared_edge(r161, r281, 5).
adjacent(r161, r282).
shared_edge(r161, r282, 4).
adjacent(r161, r287).
shared_edge(r161, r287, 19).
adjacent(r161, r288).
shared_edge(r161, r288, 5).
adjacent(r161, r328).
shared_edge(r161, r328, 5).
adjacent(r161, r354).
shared_edge(r161, r354, 7).
adjacent(r161, r370).
shared_edge(r161, r370, 3).
adjacent(r161, r383).
shared_edge(r161, r383, 1).
adjacent(r161, r396).
shared_edge(r161, r396, 3).
adjacent(r162, r163).
shared_edge(r162, r163, 2).
adjacent(r162, r193).
shared_edge(r162, r193, 3).
adjacent(r164, r180).
shared_edge(r164, r180, 1).
adjacent(r164, r181).
shared_edge(r164, r181, 2).
adjacent(r165, r90).
shared_edge(r165, r90, 5).
adjacent(r166, r4).
shared_edge(r166, r4, 5).
adjacent(r167, r168).
shared_edge(r167, r168, 2).
adjacent(r167, r184).
shared_edge(r167, r184, 1).
adjacent(r167, r196).
shared_edge(r167, r196, 2).
adjacent(r167, r207).
shared_edge(r167, r207, 2).
adjacent(r167, r223).
shared_edge(r167, r223, 4).
adjacent(r167, r263).
shared_edge(r167, r263, 1).
adjacent(r167, r273).
shared_edge(r167, r273, 1).
adjacent(r168, r184).
shared_edge(r168, r184, 1).
adjacent(r168, r78).
shared_edge(r168, r78, 3).
adjacent(r169, r186).
shared_edge(r169, r186, 1).
adjacent(r169, r78).
shared_edge(r169, r78, 1).
adjacent(r17, r18).
shared_edge(r17, r18, 1).
adjacent(r17, r41).
shared_edge(r17, r41, 1).
adjacent(r17, r42).
shared_edge(r17, r42, 1).
adjacent(r170, r171).
shared_edge(r170, r171, 2).
adjacent(r170, r196).
shared_edge(r170, r196, 1).
adjacent(r170, r197).
shared_edge(r170, r197, 1).
adjacent(r170, r198).
shared_edge(r170, r198, 2).
adjacent(r172, r241).
shared_edge(r172, r241, 1).
adjacent(r172, r275).
shared_edge(r172, r275, 2).
adjacent(r172, r294).
shared_edge(r172, r294, 2).
adjacent(r172, r306).
shared_edge(r172, r306, 2).
adjacent(r172, r307).
shared_edge(r172, r307, 1).
adjacent(r173, r187).
shared_edge(r173, r187, 1).
adjacent(r174, r175).
shared_edge(r174, r175, 4).
adjacent(r174, r188).
shared_edge(r174, r188, 6).
adjacent(r174, r189).
shared_edge(r174, r189, 2).
adjacent(r174, r199).
shared_edge(r174, r199, 3).
adjacent(r174, r208).
shared_edge(r174, r208, 1).
adjacent(r174, r227).
shared_edge(r174, r227, 2).
adjacent(r174, r23).
shared_edge(r174, r23, 6).
adjacent(r175, r23).
shared_edge(r175, r23, 2).
adjacent(r176, r190).
shared_edge(r176, r190, 1).
adjacent(r176, r23).
shared_edge(r176, r23, 1).
adjacent(r177, r191).
shared_edge(r177, r191, 4).
adjacent(r177, r192).
shared_edge(r177, r192, 1).
adjacent(r177, r201).
shared_edge(r177, r201, 1).
adjacent(r177, r229).
shared_edge(r177, r229, 1).
adjacent(r178, r192).
shared_edge(r178, r192, 1).
adjacent(r178, r201).
shared_edge(r178, r201, 1).
adjacent(r178, r202).
shared_edge(r178, r202, 1).
adjacent(r178, r210).
shared_edge(r178, r210, 2).
adjacent(r178, r211).
shared_edge(r178, r211, 2).
adjacent(r178, r212).
shared_edge(r178, r212, 1).
adjacent(r178, r213).
shared_edge(r178, r213, 1).
adjacent(r178, r230).
shared_edge(r178, r230, 1).
adjacent(r178, r231).
shared_edge(r178, r231, 1).
adjacent(r179, r180).
shared_edge(r179, r180, 2).
adjacent(r18, r19).
shared_edge(r18, r19, 1).
adjacent(r18, r43).
shared_edge(r18, r43, 1).
adjacent(r180, r181).
shared_edge(r180, r181, 11).
adjacent(r180, r194).
shared_edge(r180, r194, 1).
adjacent(r180, r205).
shared_edge(r180, r205, 2).
adjacent(r180, r215).
shared_edge(r180, r215, 1).
adjacent(r180, r233).
shared_edge(r180, r233, 8).
adjacent(r180, r236).
shared_edge(r180, r236, 2).
adjacent(r180, r299).
shared_edge(r180, r299, 4).
adjacent(r180, r313).
shared_edge(r180, r313, 2).
adjacent(r180, r341).
shared_edge(r180, r341, 1).
adjacent(r180, r342).
shared_edge(r180, r342, 1).
adjacent(r181, r299).
shared_edge(r181, r299, 1).
adjacent(r182, r195).
shared_edge(r182, r195, 1).
adjacent(r182, r4).
shared_edge(r182, r4, 1).
adjacent(r182, r90).
shared_edge(r182, r90, 3).
adjacent(r183, r4).
shared_edge(r183, r4, 8).
adjacent(r184, r185).
shared_edge(r184, r185, 1).
adjacent(r184, r196).
shared_edge(r184, r196, 2).
adjacent(r184, r78).
shared_edge(r184, r78, 1).
adjacent(r185, r186).
shared_edge(r185, r186, 1).
adjacent(r185, r196).
shared_edge(r185, r196, 1).
adjacent(r185, r78).
shared_edge(r185, r78, 1).
adjacent(r186, r196).
shared_edge(r186, r196, 1).
adjacent(r187, r225).
shared_edge(r187, r225, 2).
adjacent(r187, r241).
shared_edge(r187, r241, 1).
adjacent(r188, r208).
shared_edge(r188, r208, 1).
adjacent(r188, r226).
shared_edge(r188, r226, 2).
adjacent(r188, r23).
shared_edge(r188, r23, 1).
adjacent(r189, r200).
shared_edge(r189, r200, 1).
adjacent(r19, r20).
shared_edge(r19, r20, 1).
adjacent(r19, r44).
shared_edge(r19, r44, 1).
adjacent(r190, r23).
shared_edge(r190, r23, 1).
adjacent(r191, r229).
shared_edge(r191, r229, 1).
adjacent(r192, r201).
shared_edge(r192, r201, 1).
adjacent(r193, r203).
shared_edge(r193, r203, 1).
adjacent(r194, r205).
shared_edge(r194, r205, 1).
adjacent(r195, r258).
shared_edge(r195, r258, 1).
adjacent(r195, r4).
shared_edge(r195, r4, 6).
adjacent(r195, r90).
shared_edge(r195, r90, 4).
adjacent(r196, r197).
shared_edge(r196, r197, 2).
adjacent(r196, r198).
shared_edge(r196, r198, 1).
adjacent(r199, r200).
shared_edge(r199, r200, 1).
adjacent(r199, r208).
shared_edge(r199, r208, 2).
adjacent(r2, r3).
shared_edge(r2, r3, 1).
adjacent(r2, r38).
shared_edge(r2, r38, 1).
adjacent(r2, r49).
shared_edge(r2, r49, 1).
adjacent(r20, r21).
shared_edge(r20, r21, 1).
adjacent(r20, r23).
shared_edge(r20, r23, 7).
adjacent(r200, r208).
shared_edge(r200, r208, 1).
adjacent(r202, r203).
shared_edge(r202, r203, 1).
adjacent(r202, r213).
shared_edge(r202, r213, 1).
adjacent(r203, r214).
shared_edge(r203, r214, 1).
adjacent(r204, r205).
shared_edge(r204, r205, 2).
adjacent(r205, r215).
shared_edge(r205, r215, 1).
adjacent(r205, r217).
shared_edge(r205, r217, 1).
adjacent(r205, r235).
shared_edge(r205, r235, 1).
adjacent(r206, r219).
shared_edge(r206, r219, 8).
adjacent(r206, r220).
shared_edge(r206, r220, 1).
adjacent(r206, r221).
shared_edge(r206, r221, 1).
adjacent(r206, r301).
shared_edge(r206, r301, 1).
adjacent(r206, r4).
shared_edge(r206, r4, 15).
adjacent(r207, r223).
shared_edge(r207, r223, 1).
adjacent(r208, r209).
shared_edge(r208, r209, 1).
adjacent(r208, r227).
shared_edge(r208, r227, 8).
adjacent(r208, r228).
shared_edge(r208, r228, 1).
adjacent(r208, r243).
shared_edge(r208, r243, 2).
adjacent(r208, r256).
shared_edge(r208, r256, 15).
adjacent(r208, r265).
shared_edge(r208, r265, 1).
adjacent(r208, r277).
shared_edge(r208, r277, 4).
adjacent(r208, r295).
shared_edge(r208, r295, 2).
adjacent(r208, r309).
shared_edge(r208, r309, 1).
adjacent(r209, r228).
shared_edge(r209, r228, 1).
adjacent(r21, r22).
shared_edge(r21, r22, 2).
adjacent(r21, r45).
shared_edge(r21, r45, 2).
adjacent(r21, r46).
shared_edge(r21, r46, 2).
adjacent(r21, r61).
shared_edge(r21, r61, 2).
adjacent(r21, r73).
shared_edge(r21, r73, 1).
adjacent(r210, r211).
shared_edge(r210, r211, 1).
adjacent(r210, r232).
shared_edge(r210, r232, 1).
adjacent(r211, r212).
shared_edge(r211, r212, 1).
adjacent(r211, r233).
shared_edge(r211, r233, 2).
adjacent(r212, r213).
shared_edge(r212, r213, 1).
adjacent(r212, r233).
shared_edge(r212, r233, 1).
adjacent(r213, r214).
shared_edge(r213, r214, 1).
adjacent(r213, r234).
shared_edge(r213, r234, 2).
adjacent(r214, r215).
shared_edge(r214, r215, 1).
adjacent(r214, r233).
shared_edge(r214, r233, 1).
adjacent(r215, r216).
shared_edge(r215, r216, 3).
adjacent(r215, r217).
shared_edge(r215, r217, 2).
adjacent(r215, r233).
shared_edge(r215, r233, 9).
adjacent(r215, r235).
shared_edge(r215, r235, 2).
adjacent(r215, r236).
shared_edge(r215, r236, 1).
adjacent(r218, r90).
shared_edge(r218, r90, 2).
adjacent(r219, r220).
shared_edge(r219, r220, 4).
adjacent(r219, r270).
shared_edge(r219, r270, 3).
adjacent(r219, r301).
shared_edge(r219, r301, 1).
adjacent(r22, r23).
shared_edge(r22, r23, 1).
adjacent(r220, r221).
shared_edge(r220, r221, 2).
adjacent(r220, r237).
shared_edge(r220, r237, 2).
adjacent(r220, r250).
shared_edge(r220, r250, 2).
adjacent(r220, r259).
shared_edge(r220, r259, 8).
adjacent(r220, r270).
shared_edge(r220, r270, 7).
adjacent(r220, r284).
shared_edge(r220, r284, 6).
adjacent(r220, r301).
shared_edge(r220, r301, 3).
adjacent(r220, r329).
shared_edge(r220, r329, 1).
adjacent(r220, r334).
shared_edge(r220, r334, 5).
adjacent(r220, r385).
shared_edge(r220, r385, 4).
adjacent(r220, r404).
shared_edge(r220, r404, 1).
adjacent(r221, r222).
shared_edge(r221, r222, 1).
adjacent(r222, r237).
shared_edge(r222, r237, 1).
adjacent(r222, r4).
shared_edge(r222, r4, 2).
adjacent(r223, r263).
shared_edge(r223, r263, 1).
adjacent(r223, r273).
shared_edge(r223, r273, 3).
adjacent(r223, r293).
shared_edge(r223, r293, 1).
adjacent(r223, r305).
shared_edge(r223, r305, 1).
adjacent(r225, r242).
shared_edge(r225, r242, 1).
adjacent(r226, r227).
shared_edge(r226, r227, 2).
adjacent(r228, r244).
shared_edge(r228, r244, 1).
adjacent(r23, r24).
shared_edge(r23, r24, 1).
adjacent(r23, r26).
shared_edge(r23, r26, 1).
adjacent(r23, r44).
shared_edge(r23, r44, 14).
adjacent(r23, r45).
shared_edge(r23, r45, 2).
adjacent(r23, r46).
shared_edge(r23, r46, 3).
adjacent(r23, r61).
shared_edge(r23, r61, 2).
adjacent(r23, r62).
shared_edge(r23, r62, 4).
adjacent(r23, r73).
shared_edge(r23, r73, 2).
adjacent(r23, r74).
shared_edge(r23, r74, 1).
adjacent(r23, r86).
shared_edge(r23, r86, 3).
adjacent(r230, r231).
shared_edge(r230, r231, 1).
adjacent(r230, r246).
shared_edge(r230, r246, 1).
adjacent(r231, r232).
shared_edge(r231, r232, 1).
adjacent(r231, r247).
shared_edge(r231, r247, 1).
adjacent(r232, r233).
shared_edge(r232, r233, 1).
adjacent(r232, r248).
shared_edge(r232, r248, 1).
adjacent(r233, r234).
shared_edge(r233, r234, 6).
adjacent(r233, r247).
shared_edge(r233, r247, 26).
adjacent(r233, r257).
shared_edge(r233, r257, 8).
adjacent(r233, r287).
shared_edge(r233, r287, 9).
adjacent(r233, r289).
shared_edge(r233, r289, 4).
adjacent(r233, r313).
shared_edge(r233, r313, 2).
adjacent(r233, r328).
shared_edge(r233, r328, 30).
adjacent(r233, r341).
shared_edge(r233, r341, 2).
adjacent(r233, r354).
shared_edge(r233, r354, 2).
adjacent(r233, r355).
shared_edge(r233, r355, 10).
adjacent(r233, r383).
shared_edge(r233, r383, 1).
adjacent(r233, r395).
shared_edge(r233, r395, 2).
adjacent(r233, r396).
shared_edge(r233, r396, 12).
adjacent(r233, r412).
shared_edge(r233, r412, 13).
adjacent(r233, r419).
shared_edge(r233, r419, 4).
adjacent(r233, r420).
shared_edge(r233, r420, 9).
adjacent(r233, r426).
shared_edge(r233, r426, 4).
adjacent(r233, r436).
shared_edge(r233, r436, 4).
adjacent(r233, r437).
shared_edge(r233, r437, 12).
adjacent(r233, r452).
shared_edge(r233, r452, 1).
adjacent(r233, r453).
shared_edge(r233, r453, 1).
adjacent(r233, r454).
shared_edge(r233, r454, 4).
adjacent(r233, r455).
shared_edge(r233, r455, 3).
adjacent(r233, r456).
shared_edge(r233, r456, 14).
adjacent(r233, r457).
shared_edge(r233, r457, 4).
adjacent(r233, r465).
shared_edge(r233, r465, 3).
adjacent(r233, r474).
shared_edge(r233, r474, 2).
adjacent(r233, r483).
shared_edge(r233, r483, 2).
adjacent(r233, r484).
shared_edge(r233, r484, 4).
adjacent(r233, r485).
shared_edge(r233, r485, 9).
adjacent(r233, r493).
shared_edge(r233, r493, 1).
adjacent(r235, r236).
shared_edge(r235, r236, 1).
adjacent(r237, r238).
shared_edge(r237, r238, 1).
adjacent(r238, r250).
shared_edge(r238, r250, 1).
adjacent(r238, r4).
shared_edge(r238, r4, 2).
adjacent(r239, r240).
shared_edge(r239, r240, 2).
adjacent(r239, r4).
shared_edge(r239, r4, 4).
adjacent(r24, r25).
shared_edge(r24, r25, 1).
adjacent(r24, r26).
shared_edge(r24, r26, 1).
adjacent(r240, r253).
shared_edge(r240, r253, 1).
adjacent(r240, r260).
shared_edge(r240, r260, 1).
adjacent(r240, r4).
shared_edge(r240, r4, 1).
adjacent(r241, r242).
shared_edge(r241, r242, 1).
adjacent(r241, r255).
shared_edge(r241, r255, 1).
adjacent(r241, r264).
shared_edge(r241, r264, 1).
adjacent(r241, r275).
shared_edge(r241, r275, 1).
adjacent(r242, r255).
shared_edge(r242, r255, 1).
adjacent(r243, r244).
shared_edge(r243, r244, 2).
adjacent(r244, r256).
shared_edge(r244, r256, 1).
adjacent(r244, r266).
shared_edge(r244, r266, 1).
adjacent(r244, r267).
shared_edge(r244, r267, 1).
adjacent(r246, r247).
shared_edge(r246, r247, 1).
adjacent(r247, r248).
shared_edge(r247, r248, 3).
adjacent(r247, r328).
shared_edge(r247, r328, 4).
adjacent(r249, r4).
shared_edge(r249, r4, 4).
adjacent(r25, r26).
shared_edge(r25, r26, 3).
adjacent(r250, r251).
shared_edge(r250, r251, 1).
adjacent(r251, r252).
shared_edge(r251, r252, 1).
adjacent(r251, r259).
shared_edge(r251, r259, 1).
adjacent(r251, r4).
shared_edge(r251, r4, 1).
adjacent(r252, r259).
shared_edge(r252, r259, 1).
adjacent(r252, r271).
shared_edge(r252, r271, 1).
adjacent(r252, r4).
shared_edge(r252, r4, 3).
adjacent(r253, r260).
shared_edge(r253, r260, 1).
adjacent(r254, r263).
shared_edge(r254, r263, 1).
adjacent(r255, r264).
shared_edge(r255, r264, 1).
adjacent(r256, r266).
shared_edge(r256, r266, 1).
adjacent(r256, r278).
shared_edge(r256, r278, 1).
adjacent(r256, r285).
shared_edge(r256, r285, 2).
adjacent(r256, r296).
shared_edge(r256, r296, 2).
adjacent(r256, r309).
shared_edge(r256, r309, 2).
adjacent(r256, r310).
shared_edge(r256, r310, 3).
adjacent(r256, r323).
shared_edge(r256, r323, 2).
adjacent(r256, r332).
shared_edge(r256, r332, 6).
adjacent(r256, r337).
shared_edge(r256, r337, 3).
adjacent(r258, r269).
shared_edge(r258, r269, 1).
adjacent(r258, r283).
shared_edge(r258, r283, 1).
adjacent(r258, r4).
shared_edge(r258, r4, 2).
adjacent(r258, r90).
shared_edge(r258, r90, 1).
adjacent(r259, r271).
shared_edge(r259, r271, 3).
adjacent(r259, r302).
shared_edge(r259, r302, 2).
adjacent(r259, r329).
shared_edge(r259, r329, 1).
adjacent(r26, r27).
shared_edge(r26, r27, 3).
adjacent(r26, r28).
shared_edge(r26, r28, 6).
adjacent(r26, r30).
shared_edge(r26, r30, 4).
adjacent(r26, r32).
shared_edge(r26, r32, 10).
adjacent(r26, r47).
shared_edge(r26, r47, 2).
adjacent(r26, r62).
shared_edge(r26, r62, 9).
adjacent(r26, r63).
shared_edge(r26, r63, 4).
adjacent(r26, r87).
shared_edge(r26, r87, 3).
adjacent(r26, r88).
shared_edge(r26, r88, 7).
adjacent(r26, r95).
shared_edge(r26, r95, 2).
adjacent(r26, r97).
shared_edge(r26, r97, 3).
adjacent(r260, r261).
shared_edge(r260, r261, 2).
adjacent(r260, r4).
shared_edge(r260, r4, 4).
adjacent(r261, r291).
shared_edge(r261, r291, 1).
adjacent(r261, r4).
shared_edge(r261, r4, 1).
adjacent(r264, r265).
shared_edge(r264, r265, 1).
adjacent(r264, r276).
shared_edge(r264, r276, 1).
adjacent(r265, r276).
shared_edge(r265, r276, 2).
adjacent(r265, r277).
shared_edge(r265, r277, 2).
adjacent(r265, r295).
shared_edge(r265, r295, 1).
adjacent(r266, r267).
shared_edge(r266, r267, 1).
adjacent(r266, r278).
shared_edge(r266, r278, 1).
adjacent(r267, r279).
shared_edge(r267, r279, 1).
adjacent(r268, r280).
shared_edge(r268, r280, 1).
adjacent(r269, r283).
shared_edge(r269, r283, 3).
adjacent(r269, r300).
shared_edge(r269, r300, 8).
adjacent(r269, r344).
shared_edge(r269, r344, 3).
adjacent(r269, r357).
shared_edge(r269, r357, 12).
adjacent(r269, r90).
shared_edge(r269, r90, 9).
adjacent(r271, r272).
shared_edge(r271, r272, 3).
adjacent(r271, r302).
shared_edge(r271, r302, 1).
adjacent(r272, r4).
shared_edge(r272, r4, 5).
adjacent(r275, r276).
shared_edge(r275, r276, 3).
adjacent(r276, r294).
shared_edge(r276, r294, 1).
adjacent(r276, r295).
shared_edge(r276, r295, 1).
adjacent(r276, r309).
shared_edge(r276, r309, 2).
adjacent(r278, r279).
shared_edge(r278, r279, 1).
adjacent(r278, r286).
shared_edge(r278, r286, 1).
adjacent(r28, r29).
shared_edge(r28, r29, 1).
adjacent(r28, r47).
shared_edge(r28, r47, 1).
adjacent(r280, r281).
shared_edge(r280, r281, 1).
adjacent(r280, r287).
shared_edge(r280, r287, 1).
adjacent(r283, r284).
shared_edge(r283, r284, 7).
adjacent(r283, r300).
shared_edge(r283, r300, 4).
adjacent(r283, r358).
shared_edge(r283, r358, 1).
adjacent(r284, r301).
shared_edge(r284, r301, 1).
adjacent(r284, r358).
shared_edge(r284, r358, 2).
adjacent(r284, r384).
shared_edge(r284, r384, 3).
adjacent(r284, r397).
shared_edge(r284, r397, 3).
adjacent(r284, r4).
shared_edge(r284, r4, 19).
adjacent(r284, r404).
shared_edge(r284, r404, 4).
adjacent(r284, r413).
shared_edge(r284, r413, 5).
adjacent(r284, r438).
shared_edge(r284, r438, 4).
adjacent(r284, r468).
shared_edge(r284, r468, 2).
adjacent(r285, r286).
shared_edge(r285, r286, 1).
adjacent(r285, r297).
shared_edge(r285, r297, 1).
adjacent(r286, r298).
shared_edge(r286, r298, 1).
adjacent(r287, r288).
shared_edge(r287, r288, 3).
adjacent(r287, r312).
shared_edge(r287, r312, 10).
adjacent(r287, r333).
shared_edge(r287, r333, 8).
adjacent(r287, r353).
shared_edge(r287, r353, 6).
adjacent(r287, r369).
shared_edge(r287, r369, 6).
adjacent(r287, r370).
shared_edge(r287, r370, 1).
adjacent(r287, r382).
shared_edge(r287, r382, 3).
adjacent(r287, r396).
shared_edge(r287, r396, 2).
adjacent(r29, r30).
shared_edge(r29, r30, 1).
adjacent(r29, r47).
shared_edge(r29, r47, 1).
adjacent(r290, r303).
shared_edge(r290, r303, 1).
adjacent(r290, r4).
shared_edge(r290, r4, 3).
adjacent(r291, r316).
shared_edge(r291, r316, 1).
adjacent(r291, r330).
shared_edge(r291, r330, 2).
adjacent(r291, r331).
shared_edge(r291, r331, 1).
adjacent(r291, r335).
shared_edge(r291, r335, 1).
adjacent(r291, r4).
shared_edge(r291, r4, 3).
adjacent(r292, r317).
shared_edge(r292, r317, 3).
adjacent(r293, r305).
shared_edge(r293, r305, 1).
adjacent(r293, r319).
shared_edge(r293, r319, 1).
adjacent(r294, r308).
shared_edge(r294, r308, 1).
adjacent(r296, r297).
shared_edge(r296, r297, 2).
adjacent(r297, r298).
shared_edge(r297, r298, 1).
adjacent(r297, r310).
shared_edge(r297, r310, 3).
adjacent(r297, r324).
shared_edge(r297, r324, 2).
adjacent(r297, r332).
shared_edge(r297, r332, 1).
adjacent(r297, r338).
shared_edge(r297, r338, 1).
adjacent(r297, r339).
shared_edge(r297, r339, 1).
adjacent(r299, r343).
shared_edge(r299, r343, 1).
adjacent(r3, r38).
shared_edge(r3, r38, 1).
adjacent(r3, r4).
shared_edge(r3, r4, 1).
adjacent(r30, r31).
shared_edge(r30, r31, 3).
adjacent(r30, r64).
shared_edge(r30, r64, 2).
adjacent(r301, r4).
shared_edge(r301, r4, 2).
adjacent(r302, r329).
shared_edge(r302, r329, 11).
adjacent(r302, r359).
shared_edge(r302, r359, 3).
adjacent(r302, r398).
shared_edge(r302, r398, 1).
adjacent(r302, r4).
shared_edge(r302, r4, 6).
adjacent(r303, r304).
shared_edge(r303, r304, 1).
adjacent(r303, r314).
shared_edge(r303, r314, 1).
adjacent(r303, r315).
shared_edge(r303, r315, 3).
adjacent(r303, r4).
shared_edge(r303, r4, 2).
adjacent(r304, r316).
shared_edge(r304, r316, 1).
adjacent(r304, r4).
shared_edge(r304, r4, 2).
adjacent(r305, r319).
shared_edge(r305, r319, 1).
adjacent(r306, r307).
shared_edge(r306, r307, 1).
adjacent(r307, r308).
shared_edge(r307, r308, 1).
adjacent(r307, r322).
shared_edge(r307, r322, 1).
adjacent(r308, r309).
shared_edge(r308, r309, 1).
adjacent(r308, r323).
shared_edge(r308, r323, 1).
adjacent(r31, r32).
shared_edge(r31, r32, 4).
adjacent(r311, r326).
shared_edge(r311, r326, 1).
adjacent(r314, r315).
shared_edge(r314, r315, 3).
adjacent(r314, r359).
shared_edge(r314, r359, 1).
adjacent(r314, r4).
shared_edge(r314, r4, 5).
adjacent(r315, r316).
shared_edge(r315, r316, 2).
adjacent(r315, r317).
shared_edge(r315, r317, 1).
adjacent(r315, r318).
shared_edge(r315, r318, 1).
adjacent(r315, r330).
shared_edge(r315, r330, 2).
adjacent(r315, r335).
shared_edge(r315, r335, 2).
adjacent(r315, r345).
shared_edge(r315, r345, 2).
adjacent(r315, r359).
shared_edge(r315, r359, 2).
adjacent(r315, r372).
shared_edge(r315, r372, 7).
adjacent(r315, r373).
shared_edge(r315, r373, 1).
adjacent(r317, r318).
shared_edge(r317, r318, 5).
adjacent(r317, r331).
shared_edge(r317, r331, 2).
adjacent(r317, r335).
shared_edge(r317, r335, 1).
adjacent(r317, r345).
shared_edge(r317, r345, 2).
adjacent(r318, r319).
shared_edge(r318, r319, 6).
adjacent(r318, r374).
shared_edge(r318, r374, 1).
adjacent(r319, r320).
shared_edge(r319, r320, 3).
adjacent(r319, r346).
shared_edge(r319, r346, 2).
adjacent(r319, r374).
shared_edge(r319, r374, 1).
adjacent(r319, r375).
shared_edge(r319, r375, 2).
adjacent(r319, r386).
shared_edge(r319, r386, 2).
adjacent(r319, r387).
shared_edge(r319, r387, 2).
adjacent(r319, r388).
shared_edge(r319, r388, 1).
adjacent(r32, r33).
shared_edge(r32, r33, 6).
adjacent(r32, r34).
shared_edge(r32, r34, 28).
adjacent(r32, r64).
shared_edge(r32, r64, 2).
adjacent(r32, r89).
shared_edge(r32, r89, 2).
adjacent(r32, r97).
shared_edge(r32, r97, 1).
adjacent(r322, r323).
shared_edge(r322, r323, 2).
adjacent(r323, r336).
shared_edge(r323, r336, 1).
adjacent(r325, r326).
shared_edge(r325, r326, 2).
adjacent(r326, r327).
shared_edge(r326, r327, 2).
adjacent(r326, r340).
shared_edge(r326, r340, 2).
adjacent(r327, r340).
shared_edge(r327, r340, 1).
adjacent(r327, r352).
shared_edge(r327, r352, 2).
adjacent(r327, r367).
shared_edge(r327, r367, 2).
adjacent(r328, r371).
shared_edge(r328, r371, 8).
adjacent(r328, r383).
shared_edge(r328, r383, 1).
adjacent(r329, r334).
shared_edge(r329, r334, 9).
adjacent(r329, r405).
shared_edge(r329, r405, 2).
adjacent(r329, r421).
shared_edge(r329, r421, 2).
adjacent(r329, r428).
shared_edge(r329, r428, 1).
adjacent(r329, r429).
shared_edge(r329, r429, 1).
adjacent(r332, r338).
shared_edge(r332, r338, 1).
adjacent(r332, r348).
shared_edge(r332, r348, 1).
adjacent(r332, r349).
shared_edge(r332, r349, 5).
adjacent(r332, r364).
shared_edge(r332, r364, 2).
adjacent(r332, r379).
shared_edge(r332, r379, 1).
adjacent(r332, r393).
shared_edge(r332, r393, 1).
adjacent(r334, r385).
shared_edge(r334, r385, 5).
adjacent(r334, r427).
shared_edge(r334, r427, 1).
adjacent(r334, r428).
shared_edge(r334, r428, 1).
adjacent(r334, r441).
shared_edge(r334, r441, 1).
adjacent(r336, r337).
shared_edge(r336, r337, 1).
adjacent(r336, r348).
shared_edge(r336, r348, 1).
adjacent(r337, r348).
shared_edge(r337, r348, 2).
adjacent(r338, r339).
shared_edge(r338, r339, 1).
adjacent(r338, r350).
shared_edge(r338, r350, 1).
adjacent(r34, r35).
shared_edge(r34, r35, 7).
adjacent(r34, r37).
shared_edge(r34, r37, 2).
adjacent(r34, r48).
shared_edge(r34, r48, 4).
adjacent(r34, r65).
shared_edge(r34, r65, 1).
adjacent(r34, r66).
shared_edge(r34, r66, 3).
adjacent(r34, r75).
shared_edge(r34, r75, 11).
adjacent(r34, r89).
shared_edge(r34, r89, 1).
adjacent(r34, r98).
shared_edge(r34, r98, 3).
adjacent(r34, r99).
shared_edge(r34, r99, 3).
adjacent(r340, r351).
shared_edge(r340, r351, 2).
adjacent(r340, r366).
shared_edge(r340, r366, 1).
adjacent(r340, r367).
shared_edge(r340, r367, 7).
adjacent(r340, r381).
shared_edge(r340, r381, 2).
adjacent(r340, r402).
shared_edge(r340, r402, 2).
adjacent(r340, r416).
shared_edge(r340, r416, 3).
adjacent(r340, r417).
shared_edge(r340, r417, 3).
adjacent(r340, r418).
shared_edge(r340, r418, 2).
adjacent(r340, r435).
shared_edge(r340, r435, 1).
adjacent(r340, r449).
shared_edge(r340, r449, 10).
adjacent(r340, r450).
shared_edge(r340, r450, 2).
adjacent(r340, r451).
shared_edge(r340, r451, 1).
adjacent(r340, r490).
shared_edge(r340, r490, 1).
adjacent(r340, r491).
shared_edge(r340, r491, 1).
adjacent(r341, r342).
shared_edge(r341, r342, 1).
adjacent(r342, r343).
shared_edge(r342, r343, 1).
adjacent(r342, r355).
shared_edge(r342, r355, 1).
adjacent(r343, r356).
shared_edge(r343, r356, 1).
adjacent(r347, r348).
shared_edge(r347, r348, 1).
adjacent(r347, r362).
shared_edge(r347, r362, 1).
adjacent(r347, r363).
shared_edge(r347, r363, 1).
adjacent(r348, r363).
shared_edge(r348, r363, 2).
adjacent(r348, r364).
shared_edge(r348, r364, 1).
adjacent(r349, r350).
shared_edge(r349, r350, 1).
adjacent(r349, r365).
shared_edge(r349, r365, 1).
adjacent(r349, r379).
shared_edge(r349, r379, 2).
adjacent(r349, r380).
shared_edge(r349, r380, 1).
adjacent(r35, r36).
shared_edge(r35, r36, 3).
adjacent(r35, r65).
shared_edge(r35, r65, 3).
adjacent(r35, r75).
shared_edge(r35, r75, 1).
adjacent(r350, r365).
shared_edge(r350, r365, 1).
adjacent(r351, r381).
shared_edge(r351, r381, 1).
adjacent(r352, r368).
shared_edge(r352, r368, 1).
adjacent(r354, r383).
shared_edge(r354, r383, 1).
adjacent(r355, r356).
shared_edge(r355, r356, 9).
adjacent(r355, r420).
shared_edge(r355, r420, 1).
adjacent(r357, r358).
shared_edge(r357, r358, 4).
adjacent(r357, r384).
shared_edge(r357, r384, 2).
adjacent(r357, r413).
shared_edge(r357, r413, 5).
adjacent(r357, r466).
shared_edge(r357, r466, 3).
adjacent(r357, r467).
shared_edge(r357, r467, 2).
adjacent(r358, r384).
shared_edge(r358, r384, 1).
adjacent(r359, r372).
shared_edge(r359, r372, 1).
adjacent(r359, r398).
shared_edge(r359, r398, 1).
adjacent(r360, r361).
shared_edge(r360, r361, 1).
adjacent(r361, r362).
shared_edge(r361, r362, 1).
adjacent(r362, r363).
shared_edge(r362, r363, 1).
adjacent(r362, r377).
shared_edge(r362, r377, 1).
adjacent(r363, r364).
shared_edge(r363, r364, 2).
adjacent(r363, r378).
shared_edge(r363, r378, 2).
adjacent(r363, r392).
shared_edge(r363, r392, 2).
adjacent(r364, r392).
shared_edge(r364, r392, 1).
adjacent(r365, r366).
shared_edge(r365, r366, 2).
adjacent(r365, r380).
shared_edge(r365, r380, 1).
adjacent(r365, r394).
shared_edge(r365, r394, 1).
adjacent(r366, r394).
shared_edge(r366, r394, 1).
adjacent(r366, r403).
shared_edge(r366, r403, 2).
adjacent(r366, r411).
shared_edge(r366, r411, 1).
adjacent(r366, r417).
shared_edge(r366, r417, 2).
adjacent(r367, r368).
shared_edge(r367, r368, 2).
adjacent(r367, r418).
shared_edge(r367, r418, 1).
adjacent(r372, r373).
shared_edge(r372, r373, 1).
adjacent(r372, r374).
shared_edge(r372, r374, 2).
adjacent(r372, r398).
shared_edge(r372, r398, 1).
adjacent(r372, r399).
shared_edge(r372, r399, 4).
adjacent(r372, r406).
shared_edge(r372, r406, 2).
adjacent(r372, r407).
shared_edge(r372, r407, 2).
adjacent(r372, r409).
shared_edge(r372, r409, 1).
adjacent(r372, r414).
shared_edge(r372, r414, 1).
adjacent(r373, r374).
shared_edge(r373, r374, 2).
adjacent(r374, r386).
shared_edge(r374, r386, 1).
adjacent(r374, r409).
shared_edge(r374, r409, 2).
adjacent(r375, r376).
shared_edge(r375, r376, 1).
adjacent(r375, r389).
shared_edge(r375, r389, 1).
adjacent(r376, r390).
shared_edge(r376, r390, 1).
adjacent(r377, r378).
shared_edge(r377, r378, 2).
adjacent(r378, r391).
shared_edge(r378, r391, 3).
adjacent(r378, r392).
shared_edge(r378, r392, 3).
adjacent(r379, r380).
shared_edge(r379, r380, 1).
adjacent(r379, r393).
shared_edge(r379, r393, 1).
adjacent(r379, r394).
shared_edge(r379, r394, 3).
adjacent(r38, r4).
shared_edge(r38, r4, 1).
adjacent(r38, r49).
shared_edge(r38, r49, 1).
adjacent(r380, r394).
shared_edge(r380, r394, 1).
adjacent(r382, r396).
shared_edge(r382, r396, 1).
adjacent(r384, r397).
shared_edge(r384, r397, 1).
adjacent(r384, r413).
shared_edge(r384, r413, 1).
adjacent(r385, r404).
shared_edge(r385, r404, 4).
adjacent(r385, r427).
shared_edge(r385, r427, 2).
adjacent(r385, r439).
shared_edge(r385, r439, 1).
adjacent(r387, r388).
shared_edge(r387, r388, 1).
adjacent(r388, r389).
shared_edge(r388, r389, 1).
adjacent(r389, r390).
shared_edge(r389, r390, 1).
adjacent(r39, r4).
shared_edge(r39, r4, 2).
adjacent(r39, r51).
shared_edge(r39, r51, 1).
adjacent(r39, r6).
shared_edge(r39, r6, 3).
adjacent(r39, r67).
shared_edge(r39, r67, 1).
adjacent(r39, r8).
shared_edge(r39, r8, 3).
adjacent(r391, r392).
shared_edge(r391, r392, 2).
adjacent(r391, r424).
shared_edge(r391, r424, 2).
adjacent(r391, r431).
shared_edge(r391, r431, 1).
adjacent(r392, r393).
shared_edge(r392, r393, 1).
adjacent(r392, r400).
shared_edge(r392, r400, 3).
adjacent(r392, r415).
shared_edge(r392, r415, 3).
adjacent(r392, r424).
shared_edge(r392, r424, 2).
adjacent(r392, r431).
shared_edge(r392, r431, 2).
adjacent(r392, r432).
shared_edge(r392, r432, 1).
adjacent(r392, r443).
shared_edge(r392, r443, 1).
adjacent(r392, r444).
shared_edge(r392, r444, 1).
adjacent(r392, r445).
shared_edge(r392, r445, 2).
adjacent(r392, r446).
shared_edge(r392, r446, 16).
adjacent(r392, r460).
shared_edge(r392, r460, 1).
adjacent(r392, r461).
shared_edge(r392, r461, 2).
adjacent(r392, r478).
shared_edge(r392, r478, 2).
adjacent(r393, r400).
shared_edge(r393, r400, 1).
adjacent(r394, r400).
shared_edge(r394, r400, 2).
adjacent(r394, r401).
shared_edge(r394, r401, 3).
adjacent(r394, r402).
shared_edge(r394, r402, 1).
adjacent(r398, r405).
shared_edge(r398, r405, 1).
adjacent(r399, r408).
shared_edge(r399, r408, 2).
adjacent(r4, r5).
shared_edge(r4, r5, 4).
adjacent(r4, r50).
shared_edge(r4, r50, 9).
adjacent(r4, r51).
shared_edge(r4, r51, 2).
adjacent(r4, r52).
shared_edge(r4, r52, 1).
adjacent(r4, r54).
shared_edge(r4, r54, 1).
adjacent(r4, r6).
shared_edge(r4, r6, 1).
adjacent(r4, r67).
shared_edge(r4, r67, 3).
adjacent(r4, r8).
shared_edge(r4, r8, 2).
adjacent(r4, r91).
shared_edge(r4, r91, 3).
adjacent(r40, r41).
shared_edge(r40, r41, 1).
adjacent(r40, r57).
shared_edge(r40, r57, 1).
adjacent(r400, r401).
shared_edge(r400, r401, 4).
adjacent(r401, r402).
shared_edge(r401, r402, 7).
adjacent(r401, r415).
shared_edge(r401, r415, 2).
adjacent(r401, r433).
shared_edge(r401, r433, 1).
adjacent(r401, r434).
shared_edge(r401, r434, 2).
adjacent(r401, r448).
shared_edge(r401, r448, 2).
adjacent(r401, r463).
shared_edge(r401, r463, 2).
adjacent(r401, r473).
shared_edge(r401, r473, 1).
adjacent(r402, r403).
shared_edge(r402, r403, 1).
adjacent(r402, r411).
shared_edge(r402, r411, 1).
adjacent(r402, r416).
shared_edge(r402, r416, 7).
adjacent(r402, r473).
shared_edge(r402, r473, 1).
adjacent(r402, r480).
shared_edge(r402, r480, 2).
adjacent(r402, r490).
shared_edge(r402, r490, 2).
adjacent(r403, r411).
shared_edge(r403, r411, 1).
adjacent(r404, r438).
shared_edge(r404, r438, 1).
adjacent(r404, r439).
shared_edge(r404, r439, 1).
adjacent(r404, r458).
shared_edge(r404, r458, 1).
adjacent(r405, r406).
shared_edge(r405, r406, 2).
adjacent(r405, r422).
shared_edge(r405, r422, 1).
adjacent(r406, r409).
shared_edge(r406, r409, 1).
adjacent(r406, r414).
shared_edge(r406, r414, 1).
adjacent(r407, r408).
shared_edge(r407, r408, 1).
adjacent(r407, r409).
shared_edge(r407, r409, 1).
adjacent(r408, r409).
shared_edge(r408, r409, 3).
adjacent(r409, r414).
shared_edge(r409, r414, 2).
adjacent(r409, r421).
shared_edge(r409, r421, 1).
adjacent(r409, r422).
shared_edge(r409, r422, 2).
adjacent(r409, r423).
shared_edge(r409, r423, 24).
adjacent(r409, r428).
shared_edge(r409, r428, 1).
adjacent(r409, r429).
shared_edge(r409, r429, 2).
adjacent(r409, r440).
shared_edge(r409, r440, 1).
adjacent(r409, r441).
shared_edge(r409, r441, 2).
adjacent(r409, r458).
shared_edge(r409, r458, 1).
adjacent(r409, r459).
shared_edge(r409, r459, 2).
adjacent(r409, r470).
shared_edge(r409, r470, 2).
adjacent(r409, r476).
shared_edge(r409, r476, 2).
adjacent(r409, r486).
shared_edge(r409, r486, 1).
adjacent(r409, r488).
shared_edge(r409, r488, 4).
adjacent(r41, r42).
shared_edge(r41, r42, 1).
adjacent(r41, r58).
shared_edge(r41, r58, 1).
adjacent(r411, r416).
shared_edge(r411, r416, 1).
adjacent(r413, r467).
shared_edge(r413, r467, 1).
adjacent(r415, r432).
shared_edge(r415, r432, 1).
adjacent(r416, r417).
shared_edge(r416, r417, 1).
adjacent(r416, r425).
shared_edge(r416, r425, 2).
adjacent(r417, r425).
shared_edge(r417, r425, 2).
adjacent(r418, r435).
shared_edge(r418, r435, 1).
adjacent(r42, r43).
shared_edge(r42, r43, 1).
adjacent(r42, r59).
shared_edge(r42, r59, 1).
adjacent(r421, r422).
shared_edge(r421, r422, 1).
adjacent(r423, r487).
shared_edge(r423, r487, 3).
adjacent(r427, r440).
shared_edge(r427, r440, 1).
adjacent(r428, r429).
shared_edge(r428, r429, 1).
adjacent(r43, r44).
shared_edge(r43, r44, 1).
adjacent(r43, r60).
shared_edge(r43, r60, 1).
adjacent(r430, r431).
shared_edge(r430, r431, 1).
adjacent(r430, r445).
shared_edge(r430, r445, 1).
adjacent(r432, r433).
shared_edge(r432, r433, 2).
adjacent(r432, r446).
shared_edge(r432, r446, 6).
adjacent(r432, r447).
shared_edge(r432, r447, 2).
adjacent(r432, r462).
shared_edge(r432, r462, 1).
adjacent(r432, r471).
shared_edge(r432, r471, 5).
adjacent(r433, r434).
shared_edge(r433, r434, 1).
adjacent(r434, r447).
shared_edge(r434, r447, 1).
adjacent(r438, r458).
shared_edge(r438, r458, 1).
adjacent(r438, r469).
shared_edge(r438, r469, 1).
adjacent(r438, r470).
shared_edge(r438, r470, 1).
adjacent(r439, r440).
shared_edge(r439, r440, 1).
adjacent(r439, r459).
shared_edge(r439, r459, 1).
adjacent(r44, r60).
shared_edge(r44, r60, 5).
adjacent(r440, r441).
shared_edge(r440, r441, 1).
adjacent(r442, r443).
shared_edge(r442, r443, 1).
adjacent(r442, r461).
shared_edge(r442, r461, 1).
adjacent(r443, r444).
shared_edge(r443, r444, 1).
adjacent(r444, r445).
shared_edge(r444, r445, 1).
adjacent(r446, r489).
shared_edge(r446, r489, 3).
adjacent(r447, r448).
shared_edge(r447, r448, 1).
adjacent(r448, r462).
shared_edge(r448, r462, 1).
adjacent(r450, r451).
shared_edge(r450, r451, 1).
adjacent(r452, r453).
shared_edge(r452, r453, 1).
adjacent(r453, r454).
shared_edge(r453, r454, 1).
adjacent(r453, r464).
shared_edge(r453, r464, 1).
adjacent(r454, r455).
shared_edge(r454, r455, 1).
adjacent(r454, r464).
shared_edge(r454, r464, 1).
adjacent(r454, r481).
shared_edge(r454, r481, 1).
adjacent(r454, r482).
shared_edge(r454, r482, 1).
adjacent(r458, r459).
shared_edge(r458, r459, 1).
adjacent(r46, r74).
shared_edge(r46, r74, 1).
adjacent(r460, r461).
shared_edge(r460, r461, 1).
adjacent(r460, r478).
shared_edge(r460, r478, 1).
adjacent(r462, r463).
shared_edge(r462, r463, 1).
adjacent(r462, r472).
shared_edge(r462, r472, 1).
adjacent(r463, r472).
shared_edge(r463, r472, 1).
adjacent(r465, r474).
shared_edge(r465, r474, 1).
adjacent(r466, r467).
shared_edge(r466, r467, 1).
adjacent(r467, r468).
shared_edge(r467, r468, 3).
adjacent(r468, r469).
shared_edge(r468, r469, 1).
adjacent(r468, r475).
shared_edge(r468, r475, 2).
adjacent(r468, r486).
shared_edge(r468, r486, 1).
adjacent(r469, r470).
shared_edge(r469, r470, 1).
adjacent(r469, r476).
shared_edge(r469, r476, 1).
adjacent(r471, r472).
shared_edge(r471, r472, 3).
adjacent(r471, r479).
shared_edge(r471, r479, 2).
adjacent(r471, r490).
shared_edge(r471, r490, 1).
adjacent(r472, r473).
shared_edge(r472, r473, 1).
adjacent(r473, r479).
shared_edge(r473, r479, 1).
adjacent(r474, r484).
shared_edge(r474, r484, 1).
adjacent(r475, r476).
shared_edge(r475, r476, 1).
adjacent(r475, r486).
shared_edge(r475, r486, 1).
adjacent(r477, r478).
shared_edge(r477, r478, 2).
adjacent(r479, r480).
shared_edge(r479, r480, 1).
adjacent(r480, r490).
shared_edge(r480, r490, 1).
adjacent(r481, r482).
shared_edge(r481, r482, 1).
adjacent(r482, r483).
shared_edge(r482, r483, 1).
adjacent(r482, r492).
shared_edge(r482, r492, 1).
adjacent(r483, r493).
shared_edge(r483, r493, 1).
adjacent(r484, r494).
shared_edge(r484, r494, 2).
adjacent(r485, r494).
shared_edge(r485, r494, 1).
adjacent(r49, r50).
shared_edge(r49, r50, 2).
adjacent(r49, r77).
shared_edge(r49, r77, 1).
adjacent(r492, r493).
shared_edge(r492, r493, 1).
adjacent(r5, r6).
shared_edge(r5, r6, 3).
adjacent(r50, r77).
shared_edge(r50, r77, 1).
adjacent(r50, r90).
shared_edge(r50, r90, 3).
adjacent(r51, r6).
shared_edge(r51, r6, 1).
adjacent(r52, r53).
shared_edge(r52, r53, 2).
adjacent(r52, r54).
shared_edge(r52, r54, 1).
adjacent(r52, r8).
shared_edge(r52, r8, 2).
adjacent(r53, r54).
shared_edge(r53, r54, 3).
adjacent(r53, r9).
shared_edge(r53, r9, 1).
adjacent(r54, r91).
shared_edge(r54, r91, 3).
adjacent(r55, r56).
shared_edge(r55, r56, 1).
adjacent(r55, r69).
shared_edge(r55, r69, 1).
adjacent(r56, r57).
shared_edge(r56, r57, 1).
adjacent(r56, r70).
shared_edge(r56, r70, 1).
adjacent(r57, r58).
shared_edge(r57, r58, 1).
adjacent(r57, r71).
shared_edge(r57, r71, 1).
adjacent(r58, r59).
shared_edge(r58, r59, 1).
adjacent(r58, r72).
shared_edge(r58, r72, 1).
adjacent(r59, r60).
shared_edge(r59, r60, 2).
adjacent(r6, r7).
shared_edge(r6, r7, 2).
adjacent(r60, r72).
shared_edge(r60, r72, 1).
adjacent(r60, r85).
shared_edge(r60, r85, 4).
adjacent(r68, r69).
shared_edge(r68, r69, 1).
adjacent(r68, r81).
shared_edge(r68, r81, 1).
adjacent(r69, r70).
shared_edge(r69, r70, 1).
adjacent(r69, r82).
shared_edge(r69, r82, 1).
adjacent(r7, r8).
shared_edge(r7, r8, 1).
adjacent(r70, r71).
shared_edge(r70, r71, 1).
adjacent(r70, r83).
shared_edge(r70, r83, 1).
adjacent(r71, r72).
shared_edge(r71, r72, 1).
adjacent(r71, r84).
shared_edge(r71, r84, 1).
adjacent(r72, r85).
shared_edge(r72, r85, 1).
adjacent(r73, r74).
shared_edge(r73, r74, 1).
adjacent(r74, r86).
shared_edge(r74, r86, 1).
adjacent(r76, r77).
shared_edge(r76, r77, 1).
adjacent(r76, r90).
shared_edge(r76, r90, 4).
adjacent(r77, r90).
shared_edge(r77, r90, 1).
adjacent(r8, r9).
shared_edge(r8, r9, 2).
adjacent(r80, r81).
shared_edge(r80, r81, 1).
adjacent(r81, r82).
shared_edge(r81, r82, 1).
adjacent(r81, r92).
shared_edge(r81, r92, 1).
adjacent(r82, r83).
shared_edge(r82, r83, 1).
adjacent(r82, r92).
shared_edge(r82, r92, 1).
adjacent(r83, r84).
shared_edge(r83, r84, 1).
adjacent(r83, r93).
shared_edge(r83, r93, 1).
adjacent(r84, r85).
shared_edge(r84, r85, 1).
adjacent(r84, r94).
shared_edge(r84, r94, 1).
adjacent(r85, r94).
shared_edge(r85, r94, 5).
adjacent(r87, r88).
shared_edge(r87, r88, 1).
adjacent(r87, r96).
shared_edge(r87, r96, 2).
adjacent(r88, r96).
shared_edge(r88, r96, 5).
adjacent(r89, r98).
shared_edge(r89, r98, 1).
adjacent(r92, r93).
shared_edge(r92, r93, 3).
adjacent(r93, r94).
shared_edge(r93, r94, 4).
adjacent(r95, r96).
shared_edge(r95, r96, 1).
