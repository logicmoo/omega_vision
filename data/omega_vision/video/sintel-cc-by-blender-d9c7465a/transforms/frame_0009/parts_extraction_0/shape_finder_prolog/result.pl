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

region(r1, '#222827', 92, centroid(3,9)).
polygon(r1, [xy(0,0),xy(0,1),xy(1,0),xy(2,0),xy(2,1),xy(1,2),xy(1,3),xy(0,4),xy(0,6),xy(1,6),xy(2,5),xy(3,5),xy(4,4),xy(4,3),xy(3,2),xy(0,0)]).
hole(r1, [xy(2,6),xy(3,6),xy(2,6)]).
midline(r1, [xy(1,1),xy(2,2),xy(2,3),xy(1,4),xy(1,5),xy(3,3),xy(3,4),xy(5,6),xy(4,8),xy(4,9),xy(5,8),xy(5,10),xy(4,11),xy(3,13),xy(2,14),xy(2,15),xy(3,14)]).
midline(r1, [xy(1,9),xy(2,8)]).
fillpoint(r1, xy(5,10), 3).
fillpoint(r1, xy(5,9), 3).
fillpoint(r1, xy(5,8), 3).
fillpoint(r1, xy(4,11), 3).
fillpoint(r1, xy(4,9), 3).
region(r3, '#11110d', 4, centroid(5,1)).
polygon(r3, [xy(4,0),xy(5,0),xy(5,2),xy(4,0)]).
fillpoint(r3, xy(5,2), 1).
fillpoint(r3, xy(5,1), 1).
fillpoint(r3, xy(5,0), 1).
fillpoint(r3, xy(4,0), 1).
region(r4, '#1b1c19', 35, centroid(8,3)).
polygon(r4, [xy(5,3),xy(6,2),xy(6,0),xy(11,0),xy(11,2),xy(9,4),xy(9,5),xy(8,6),xy(6,4),xy(7,6),xy(8,7),xy(5,3)]).
midline(r4, [xy(7,3),xy(8,2),xy(8,3),xy(9,2)]).
midline(r4, [xy(8,5)]).
fillpoint(r4, xy(9,2), 3).
fillpoint(r4, xy(8,3), 3).
fillpoint(r4, xy(8,2), 3).
fillpoint(r4, xy(7,3), 3).
fillpoint(r4, xy(10,2), 2).
region(r5, '#221f1a', 59, centroid(12,8)).
polygon(r5, [xy(8,8),xy(8,9),xy(9,10),xy(9,11),xy(10,10),xy(10,8),xy(9,7),xy(9,6),xy(10,5),xy(10,4),xy(11,4),xy(12,3),xy(12,0),xy(13,0),xy(13,4),xy(14,5),xy(14,7),xy(13,8),xy(12,7),xy(11,7),xy(8,8)]).
midline(r5, [xy(9,8),xy(9,9),xy(10,7),xy(10,6),xy(12,5),xy(13,7),xy(14,8)]).
midline(r5, [xy(10,11)]).
fillpoint(r5, xy(12,5), 3).
fillpoint(r5, xy(14,8), 2).
fillpoint(r5, xy(13,7), 2).
fillpoint(r5, xy(13,6), 2).
fillpoint(r5, xy(13,5), 2).
region(r7, '#222827', 24, centroid(22,2)).
polygon(r7, [xy(15,0),xy(18,0),xy(18,1),xy(19,0),xy(19,1),xy(20,0),xy(21,0),xy(21,1),xy(22,0),xy(22,1),xy(25,1),xy(25,3),xy(26,2),xy(27,3),xy(26,4),xy(28,4),xy(28,5),xy(15,0)]).
midline(r7, [xy(26,3)]).
fillpoint(r7, xy(26,3), 2).
fillpoint(r7, xy(28,5), 1).
fillpoint(r7, xy(28,4), 1).
fillpoint(r7, xy(27,4), 1).
fillpoint(r7, xy(27,3), 1).
region(r9, '#41423e', 21, centroid(29,2)).
polygon(r9, [xy(26,0),xy(26,1),xy(27,0),xy(29,0),xy(29,1),xy(31,3),xy(30,4),xy(29,4),xy(27,2),xy(26,0)]).
midline(r9, [xy(27,1),xy(28,1),xy(28,2),xy(29,2),xy(29,3),xy(30,3)]).
fillpoint(r9, xy(30,3), 2).
fillpoint(r9, xy(29,3), 2).
fillpoint(r9, xy(29,2), 2).
fillpoint(r9, xy(28,2), 2).
fillpoint(r9, xy(28,1), 2).
region(r12, '#32302a', 19, centroid(37,0)).
polygon(r12, [xy(33,0),xy(34,0),xy(34,2),xy(35,1),xy(35,0),xy(36,0),xy(36,1),xy(37,0),xy(37,1),xy(38,0),xy(38,1),xy(39,0),xy(39,1),xy(40,0),xy(41,0),xy(41,1),xy(42,0),xy(43,0),xy(33,0)]).
fillpoint(r12, xy(43,0), 1).
fillpoint(r12, xy(42,0), 1).
fillpoint(r12, xy(41,1), 1).
fillpoint(r12, xy(41,0), 1).
fillpoint(r12, xy(40,0), 1).
region(r13, '#222827', 75, centroid(44,3)).
polygon(r13, [xy(32,4),xy(33,3),xy(33,1),xy(34,3),xy(33,4),xy(34,4),xy(35,5),xy(36,5),xy(37,4),xy(39,4),xy(40,3),xy(39,2),xy(35,2),xy(32,4)]).
midline(r13, [xy(35,3),xy(35,4),xy(36,3),xy(36,4),xy(37,3),xy(39,3),xy(40,2),xy(42,2),xy(44,1),xy(49,1),xy(49,2),xy(50,1),xy(50,2),xy(51,1),xy(51,3),xy(52,3),xy(52,5),xy(53,4)]).
fillpoint(r13, xy(53,4), 2).
fillpoint(r13, xy(52,5), 2).
fillpoint(r13, xy(52,4), 2).
fillpoint(r13, xy(52,3), 2).
fillpoint(r13, xy(51,3), 2).
region(r15, '#32302a', 11, centroid(54,1)).
polygon(r15, [xy(53,0),xy(53,2),xy(54,2),xy(55,1),xy(54,0),xy(55,2),xy(56,1),xy(56,3),xy(53,0)]).
midline(r15, [xy(54,1)]).
fillpoint(r15, xy(54,1), 2).
fillpoint(r15, xy(56,3), 1).
fillpoint(r15, xy(56,2), 1).
fillpoint(r15, xy(56,1), 1).
fillpoint(r15, xy(55,2), 1).
region(r17, '#222827', 19, centroid(59,3)).
polygon(r17, [xy(57,0),xy(57,1),xy(58,0),xy(59,0),xy(59,1),xy(57,3),xy(57,4),xy(58,3),xy(59,3),xy(59,5),xy(60,5),xy(61,4),xy(60,3),xy(61,5),xy(61,6),xy(57,0)]).
midline(r17, [xy(58,1)]).
midline(r17, [xy(60,4)]).
fillpoint(r17, xy(60,4), 2).
fillpoint(r17, xy(58,1), 2).
fillpoint(r17, xy(61,6), 1).
fillpoint(r17, xy(61,5), 1).
fillpoint(r17, xy(61,4), 1).
region(r18, '#32302a', 57, centroid(65,3)).
polygon(r18, [xy(60,0),xy(60,1),xy(61,0),xy(70,0),xy(70,3),xy(69,4),xy(68,4),xy(67,3),xy(64,3),xy(63,4),xy(62,4),xy(61,3),xy(61,2),xy(60,0)]).
midline(r18, [xy(61,1),xy(63,2),xy(65,1),xy(65,2),xy(66,1),xy(66,2),xy(68,2)]).
fillpoint(r18, xy(68,2), 3).
fillpoint(r18, xy(63,2), 3).
fillpoint(r18, xy(69,3), 2).
fillpoint(r18, xy(69,2), 2).
fillpoint(r18, xy(69,1), 2).
region(r20, '#221f1a', 16, centroid(74,3)).
polygon(r20, [xy(72,1),xy(72,5),xy(73,4),xy(73,5),xy(74,4),xy(74,5),xy(75,4),xy(75,5),xy(76,4),xy(77,4),xy(72,1)]).
fillpoint(r20, xy(77,4), 1).
fillpoint(r20, xy(76,4), 1).
fillpoint(r20, xy(75,5), 1).
fillpoint(r20, xy(75,4), 1).
fillpoint(r20, xy(74,5), 1).
region(r21, '#1b1c19', 31, centroid(77,1)).
polygon(r21, [xy(73,3),xy(74,2),xy(74,0),xy(81,0),xy(81,1),xy(80,2),xy(78,2),xy(77,3),xy(74,3),xy(73,3)]).
midline(r21, [xy(75,1),xy(75,2),xy(76,1),xy(76,2),xy(77,1),xy(77,2),xy(78,1),xy(80,1)]).
fillpoint(r21, xy(80,1), 2).
fillpoint(r21, xy(79,1), 2).
fillpoint(r21, xy(78,1), 2).
fillpoint(r21, xy(77,2), 2).
fillpoint(r21, xy(77,1), 2).
region(r24, '#32302a', 14, centroid(84,3)).
polygon(r24, [xy(80,4),xy(81,4),xy(81,5),xy(82,4),xy(82,3),xy(83,3),xy(83,4),xy(84,3),xy(84,2),xy(85,1),xy(85,2),xy(86,1),xy(86,0),xy(87,0),xy(80,4)]).
fillpoint(r24, xy(87,0), 1).
fillpoint(r24, xy(86,1), 1).
fillpoint(r24, xy(86,0), 1).
fillpoint(r24, xy(85,2), 1).
fillpoint(r24, xy(85,1), 1).
region(r26, '#99a6ab', 27, centroid(93,2)).
polygon(r26, [xy(89,0),xy(90,0),xy(90,1),xy(89,2),xy(91,2),xy(92,3),xy(93,3),xy(94,4),xy(95,3),xy(95,1),xy(94,0),xy(91,0),xy(89,0)]).
midline(r26, [xy(91,1),xy(92,1),xy(92,2),xy(93,1),xy(93,2),xy(94,1),xy(94,3)]).
fillpoint(r26, xy(94,3), 2).
fillpoint(r26, xy(94,2), 2).
fillpoint(r26, xy(94,1), 2).
fillpoint(r26, xy(93,2), 2).
fillpoint(r26, xy(93,1), 2).
region(r29, '#32302a', 23, centroid(17,5)).
polygon(r29, [xy(15,1),xy(15,3),xy(16,2),xy(16,1),xy(17,1),xy(16,3),xy(16,5),xy(17,4),xy(18,5),xy(17,6),xy(17,8),xy(18,7),xy(18,6),xy(19,8),xy(18,9),xy(20,8),xy(21,7),xy(21,8),xy(15,1)]).
midline(r29, [xy(17,5)]).
midline(r29, [xy(18,8)]).
fillpoint(r29, xy(18,8), 2).
fillpoint(r29, xy(17,5), 2).
fillpoint(r29, xy(21,8), 1).
fillpoint(r29, xy(21,7), 1).
fillpoint(r29, xy(20,8), 1).
region(r32, '#222827', 31, centroid(68,5)).
polygon(r32, [xy(64,4),xy(64,8),xy(65,7),xy(65,8),xy(66,8),xy(66,6),xy(65,5),xy(65,4),xy(66,4),xy(67,5),xy(67,6),xy(68,5),xy(69,5),xy(69,6),xy(68,7),xy(70,7),xy(71,6),xy(71,5),xy(70,4),xy(71,3),xy(71,1),xy(64,4)]).
midline(r32, [xy(66,5),xy(68,6),xy(70,5),xy(70,6)]).
fillpoint(r32, xy(70,6), 2).
fillpoint(r32, xy(70,5), 2).
fillpoint(r32, xy(68,6), 2).
fillpoint(r32, xy(66,5), 2).
fillpoint(r32, xy(72,6), 1).
region(r39, '#41423e', 71, centroid(24,10)).
polygon(r39, [xy(17,2),xy(17,3),xy(18,3),xy(18,4),xy(19,3),xy(20,4),xy(19,5),xy(19,7),xy(20,7),xy(22,5),xy(21,4),xy(23,5),xy(24,5),xy(24,7),xy(23,8),xy(22,8),xy(21,9),xy(21,11),xy(22,12),xy(24,12),xy(25,13),xy(26,13),xy(29,16),xy(29,17),xy(31,15),xy(30,14),xy(30,13),xy(27,10),xy(25,10),xy(24,9),xy(24,8),xy(25,6),xy(26,6),xy(17,2)]).
midline(r39, [xy(19,4),xy(20,5),xy(20,6),xy(21,5)]).
midline(r39, [xy(23,10),xy(25,11),xy(25,12),xy(27,12),xy(28,13),xy(29,15),xy(30,15)]).
fillpoint(r39, xy(28,13), 3).
fillpoint(r39, xy(27,12), 3).
fillpoint(r39, xy(23,10), 3).
fillpoint(r39, xy(30,15), 2).
fillpoint(r39, xy(29,15), 2).
region(r42, '#221f1a', 4, centroid(22,2)).
polygon(r42, [xy(21,2),xy(22,2),xy(22,3),xy(23,2),xy(21,2)]).
fillpoint(r42, xy(23,2), 1).
fillpoint(r42, xy(22,3), 1).
fillpoint(r42, xy(22,2), 1).
fillpoint(r42, xy(21,2), 1).
region(r54, '#b0bec4', 383, centroid(81,25)).
polygon(r54, [xy(61,29),xy(63,29),xy(63,30),xy(62,31),xy(62,32),xy(63,33),xy(69,33),xy(70,34),xy(70,35),xy(69,36),xy(70,36),xy(72,38),xy(72,39),xy(73,37),xy(79,37),xy(80,36),xy(83,36),xy(84,35),xy(85,35),xy(86,34),xy(85,33),xy(84,33),xy(83,32),xy(83,31),xy(84,30),xy(85,30),xy(86,29),xy(87,29),xy(89,27),xy(90,27),xy(92,25),xy(93,25),xy(95,23),xy(95,18),xy(94,17),xy(93,17),xy(90,20),xy(89,20),xy(88,21),xy(87,21),xy(86,22),xy(84,22),xy(83,23),xy(82,23),xy(81,24),xy(80,24),xy(79,25),xy(78,25),xy(77,26),xy(76,26),xy(75,27),xy(72,27),xy(71,28),xy(65,28),xy(64,29),xy(61,29)]).
midline(r54, [xy(64,31),xy(65,30),xy(65,31),xy(66,30),xy(66,31),xy(67,30),xy(67,31),xy(68,30),xy(68,31),xy(71,31),xy(72,30),xy(74,31),xy(76,31),xy(76,32),xy(77,31),xy(77,32),xy(78,31),xy(78,30),xy(79,30),xy(82,27),xy(82,28),xy(84,26),xy(85,26),xy(87,25),xy(89,23),xy(89,24),xy(90,23),xy(90,24),xy(91,23),xy(91,22),xy(92,21),xy(92,22)]).
midline(r54, [xy(71,35),xy(71,36),xy(72,36),xy(72,37),xy(74,35)]).
midline(r54, [xy(78,32)]).
midline(r54, [xy(81,33),xy(83,34),xy(85,34)]).
midline(r54, [xy(87,5),xy(88,3),xy(89,5),xy(91,5),xy(91,6),xy(92,6),xy(92,7),xy(93,6),xy(93,10),xy(94,10),xy(94,12)]).
midline(r54, [xy(93,19)]).
fillpoint(r54, xy(80,29), 6).
fillpoint(r54, xy(79,30), 6).
fillpoint(r54, xy(78,32), 6).
fillpoint(r54, xy(78,31), 6).
fillpoint(r54, xy(78,30), 6).
region(r59, '#1b1c19', 45, centroid(43,5)).
polygon(r59, [xy(34,6),xy(37,6),xy(37,7),xy(38,7),xy(39,6),xy(38,5),xy(40,5),xy(40,6),xy(42,6),xy(42,8),xy(43,7),xy(43,5),xy(42,4),xy(43,4),xy(44,3),xy(47,3),xy(48,4),xy(48,5),xy(47,6),xy(46,5),xy(44,5),xy(34,6)]).
midline(r59, [xy(38,6)]).
midline(r59, [xy(41,5),xy(42,5),xy(44,4),xy(47,4),xy(47,5),xy(48,6)]).
fillpoint(r59, xy(48,6), 2).
fillpoint(r59, xy(47,5), 2).
fillpoint(r59, xy(47,4), 2).
fillpoint(r59, xy(46,4), 2).
fillpoint(r59, xy(45,4), 2).
region(r61, '#2e2922', 13, centroid(56,5)).
polygon(r61, [xy(54,3),xy(55,3),xy(55,7),xy(56,6),xy(56,8),xy(57,8),xy(54,3)]).
midline(r61, [xy(56,5)]).
fillpoint(r61, xy(56,5), 2).
fillpoint(r61, xy(57,8), 1).
fillpoint(r61, xy(57,5), 1).
fillpoint(r61, xy(56,8), 1).
fillpoint(r61, xy(56,7), 1).
region(r67, '#2e2922', 116, centroid(20,18)).
polygon(r67, [xy(13,17),xy(14,16),xy(14,17),xy(15,17),xy(17,19),xy(17,23),xy(19,21),xy(20,22),xy(20,25),xy(19,26),xy(19,28),xy(20,27),xy(20,26),xy(22,24),xy(21,23),xy(21,22),xy(22,21),xy(23,22),xy(23,24),xy(25,22),xy(25,21),xy(26,20),xy(26,19),xy(24,17),xy(23,17),xy(21,15),xy(20,16),xy(19,16),xy(18,15),xy(18,14),xy(17,13),xy(15,15),xy(13,17)]).
hole(r67, [xy(22,22),xy(22,23),xy(22,22)]).
midline(r67, [xy(16,16),xy(17,16),xy(17,17),xy(18,17),xy(18,18),xy(20,19),xy(21,18),xy(21,19),xy(23,19),xy(23,20),xy(24,19),xy(24,22)]).
midline(r67, [xy(17,14)]).
midline(r67, [xy(18,21)]).
midline(r67, [xy(21,24)]).
fillpoint(r67, xy(21,19), 4).
fillpoint(r67, xy(21,18), 4).
fillpoint(r67, xy(20,19), 4).
fillpoint(r67, xy(24,20), 3).
fillpoint(r67, xy(24,19), 3).
region(r74, '#221f1a', 4, centroid(50,5)).
polygon(r74, [xy(49,4),xy(49,5),xy(50,4),xy(50,5),xy(49,4)]).
fillpoint(r74, xy(50,5), 1).
fillpoint(r74, xy(50,4), 1).
fillpoint(r74, xy(49,5), 1).
fillpoint(r74, xy(49,4), 1).
region(r91, '#41423e', 60, centroid(65,12)).
polygon(r91, [xy(52,18),xy(53,17),xy(53,18),xy(54,17),xy(54,15),xy(55,14),xy(55,13),xy(56,12),xy(56,13),xy(57,14),xy(57,15),xy(55,17),xy(52,18)]).
midline(r91, [xy(55,15),xy(55,16),xy(56,15),xy(56,14)]).
midline(r91, [xy(64,13)]).
fillpoint(r91, xy(64,13), 2).
fillpoint(r91, xy(56,15), 2).
fillpoint(r91, xy(56,14), 2).
fillpoint(r91, xy(55,16), 2).
fillpoint(r91, xy(55,15), 2).
region(r94, '#bccbd1', 357, centroid(73,20)).
polygon(r94, [xy(49,25),xy(50,24),xy(50,23),xy(51,22),xy(51,23),xy(52,24),xy(51,25),xy(50,25),xy(52,26),xy(53,26),xy(54,25),xy(53,24),xy(49,25)]).
hole(r94, [xy(52,25),xy(53,25),xy(52,25)]).
midline(r94, [xy(52,22),xy(52,23)]).
midline(r94, [xy(54,26)]).
midline(r94, [xy(56,23),xy(57,22),xy(57,23),xy(61,23),xy(61,24),xy(62,23),xy(62,24),xy(63,23),xy(63,24),xy(64,24),xy(66,23),xy(66,24),xy(67,23),xy(67,24),xy(68,23),xy(68,24),xy(69,23),xy(69,24),xy(70,23),xy(70,24),xy(71,23),xy(71,24),xy(72,23),xy(72,22),xy(73,22),xy(73,23),xy(74,22),xy(74,23),xy(75,22),xy(75,23),xy(76,22),xy(77,22),xy(81,20),xy(81,21),xy(82,20),xy(83,20),xy(84,19),xy(86,19),xy(88,18),xy(89,17),xy(90,17),xy(91,15),xy(91,14)]).
midline(r94, [xy(85,6),xy(85,7),xy(86,7)]).
midline(r94, [xy(88,10),xy(89,11)]).
fillpoint(r94, xy(64,24), 5).
fillpoint(r94, xy(63,24), 5).
fillpoint(r94, xy(63,23), 5).
fillpoint(r94, xy(62,24), 5).
fillpoint(r94, xy(62,23), 5).
region(r97, '#666d6c', 109, centroid(35,10)).
polygon(r97, [xy(25,7),xy(25,9),xy(28,9),xy(29,10),xy(29,11),xy(31,13),xy(31,14),xy(32,13),xy(37,13),xy(38,12),xy(38,13),xy(39,11),xy(43,11),xy(44,10),xy(43,9),xy(39,9),xy(38,8),xy(35,8),xy(34,7),xy(30,7),xy(29,6),xy(27,6),xy(26,7),xy(25,7)]).
midline(r97, [xy(26,8),xy(27,7),xy(27,8),xy(29,8),xy(30,9),xy(32,10),xy(36,10),xy(36,11),xy(37,10),xy(37,11),xy(38,10),xy(43,10)]).
fillpoint(r97, xy(34,10), 4).
fillpoint(r97, xy(33,10), 4).
fillpoint(r97, xy(32,10), 4).
fillpoint(r97, xy(38,10), 3).
fillpoint(r97, xy(37,11), 3).
region(r100, '#11110d', 13, centroid(45,7)).
polygon(r100, [xy(43,6),xy(44,6),xy(44,7),xy(43,8),xy(45,8),xy(46,7),xy(45,6),xy(46,6),xy(46,8),xy(48,8),xy(43,6)]).
midline(r100, [xy(45,7)]).
fillpoint(r100, xy(45,7), 2).
fillpoint(r100, xy(48,8), 1).
fillpoint(r100, xy(47,8), 1).
fillpoint(r100, xy(46,8), 1).
fillpoint(r100, xy(46,7), 1).
region(r102, '#221f1a', 13, centroid(59,9)).
polygon(r102, [xy(57,10),xy(58,9),xy(58,7),xy(59,6),xy(59,10),xy(58,11),xy(59,11),xy(57,10)]).
midline(r102, [xy(58,10)]).
fillpoint(r102, xy(58,10), 2).
fillpoint(r102, xy(60,6), 1).
fillpoint(r102, xy(59,11), 1).
fillpoint(r102, xy(59,10), 1).
fillpoint(r102, xy(59,9), 1).
region(r115, '#221f1a', 4, centroid(51,8)).
polygon(r115, [xy(50,7),xy(51,7),xy(51,9),xy(50,7)]).
fillpoint(r115, xy(51,9), 1).
fillpoint(r115, xy(51,8), 1).
fillpoint(r115, xy(51,7), 1).
fillpoint(r115, xy(50,7), 1).
region(r116, '#2e2922', 4, centroid(52,8)).
polygon(r116, [xy(52,7),xy(52,9),xy(53,7),xy(52,7)]).
fillpoint(r116, xy(53,7), 1).
fillpoint(r116, xy(52,9), 1).
fillpoint(r116, xy(52,8), 1).
fillpoint(r116, xy(52,7), 1).
region(r126, '#cbd9de', 210, centroid(75,14)).
polygon(r126, [xy(57,17),xy(58,16),xy(64,16),xy(66,14),xy(67,14),xy(68,13),xy(69,13),xy(70,12),xy(71,12),xy(72,11),xy(73,11),xy(74,10),xy(75,10),xy(76,9),xy(78,9),xy(79,8),xy(80,8),xy(81,7),xy(82,7),xy(83,8),xy(84,8),xy(84,10),xy(87,13),xy(87,15),xy(86,16),xy(84,16),xy(83,17),xy(79,17),xy(78,18),xy(72,18),xy(71,19),xy(64,19),xy(63,18),xy(58,18),xy(57,17)]).
midline(r126, [xy(58,17),xy(65,17),xy(66,16),xy(66,17),xy(68,16),xy(69,16),xy(70,15),xy(70,16),xy(71,15),xy(71,16),xy(72,15),xy(72,14),xy(75,14),xy(76,13),xy(76,14),xy(77,13),xy(77,14),xy(78,13),xy(78,14),xy(79,13),xy(79,12),xy(81,12),xy(83,13)]).
fillpoint(r126, xy(81,12), 6).
fillpoint(r126, xy(83,13), 5).
fillpoint(r126, xy(82,13), 5).
fillpoint(r126, xy(82,12), 5).
fillpoint(r126, xy(81,13), 5).
region(r127, '#1b1c19', 26, centroid(13,12)).
polygon(r127, [xy(11,8),xy(11,10),xy(12,11),xy(12,13),xy(14,11),xy(14,10),xy(12,8),xy(11,8)]).
midline(r127, [xy(12,9),xy(12,10),xy(13,10),xy(13,13)]).
fillpoint(r127, xy(13,13), 2).
fillpoint(r127, xy(13,11), 2).
fillpoint(r127, xy(13,10), 2).
fillpoint(r127, xy(12,10), 2).
fillpoint(r127, xy(12,9), 2).
region(r130, '#32302a', 19, centroid(54,11)).
polygon(r130, [xy(52,10),xy(53,9),xy(53,8),xy(56,11),xy(54,13),xy(53,12),xy(53,11),xy(52,10)]).
midline(r130, [xy(53,10),xy(54,10),xy(54,12),xy(55,11)]).
fillpoint(r130, xy(55,11), 2).
fillpoint(r130, xy(54,12), 2).
fillpoint(r130, xy(54,11), 2).
fillpoint(r130, xy(54,10), 2).
fillpoint(r130, xy(53,10), 2).
region(r133, '#32302a', 26, centroid(64,11)).
polygon(r133, [xy(57,12),xy(57,13),xy(59,13),xy(60,12),xy(60,13),xy(62,11),xy(62,12),xy(63,12),xy(64,11),xy(63,10),xy(63,9),xy(64,10),xy(65,10),xy(65,11),xy(67,9),xy(67,10),xy(68,9),xy(68,8),xy(69,8),xy(69,9),xy(70,8),xy(71,8),xy(57,12)]).
midline(r133, [xy(63,11)]).
fillpoint(r133, xy(63,11), 2).
fillpoint(r133, xy(71,8), 1).
fillpoint(r133, xy(70,8), 1).
fillpoint(r133, xy(69,9), 1).
fillpoint(r133, xy(69,8), 1).
region(r146, '#222827', 6, centroid(61,10)).
polygon(r146, [xy(60,10),xy(60,11),xy(61,10),xy(61,11),xy(62,10),xy(62,9),xy(60,10)]).
fillpoint(r146, xy(62,10), 1).
fillpoint(r146, xy(62,9), 1).
fillpoint(r146, xy(61,11), 1).
fillpoint(r146, xy(61,10), 1).
fillpoint(r146, xy(60,11), 1).
region(r151, '#32302a', 39, centroid(24,15)).
polygon(r151, [xy(19,13),xy(19,15),xy(20,15),xy(22,13),xy(20,11),xy(20,12),xy(19,13)]).
midline(r151, [xy(20,13),xy(20,14),xy(21,13),xy(22,14),xy(23,14),xy(23,15),xy(24,14),xy(24,15),xy(25,15),xy(25,16),xy(26,15),xy(26,16),xy(27,16),xy(27,17)]).
fillpoint(r151, xy(27,17), 2).
fillpoint(r151, xy(27,16), 2).
fillpoint(r151, xy(26,16), 2).
fillpoint(r151, xy(26,15), 2).
fillpoint(r151, xy(25,16), 2).
region(r157, '#2e2922', 13, centroid(51,14)).
polygon(r157, [xy(48,14),xy(49,14),xy(50,13),xy(51,14),xy(52,13),xy(52,11),xy(53,13),xy(52,14),xy(52,16),xy(48,14)]).
midline(r157, [xy(50,14)]).
fillpoint(r157, xy(50,14), 2).
fillpoint(r157, xy(53,13), 1).
fillpoint(r157, xy(52,16), 1).
fillpoint(r157, xy(52,15), 1).
fillpoint(r157, xy(52,14), 1).
region(r163, '#41423e', 10, centroid(7,13)).
polygon(r163, [xy(5,13),xy(6,12),xy(6,13),xy(7,12),xy(8,13),xy(7,14),xy(8,14),xy(8,15),xy(9,15),xy(5,13)]).
midline(r163, [xy(7,13)]).
fillpoint(r163, xy(7,13), 2).
fillpoint(r163, xy(9,15), 1).
fillpoint(r163, xy(8,15), 1).
fillpoint(r163, xy(8,14), 1).
fillpoint(r163, xy(8,13), 1).
region(r171, '#221f1a', 8, centroid(47,13)).
polygon(r171, [xy(45,12),xy(45,13),xy(46,12),xy(46,13),xy(47,13),xy(47,14),xy(48,13),xy(49,13),xy(45,12)]).
fillpoint(r171, xy(49,13), 1).
fillpoint(r171, xy(48,13), 1).
fillpoint(r171, xy(47,14), 1).
fillpoint(r171, xy(47,13), 1).
fillpoint(r171, xy(46,13), 1).
region(r182, '#11110d', 220, centroid(36,22)).
polygon(r182, [xy(23,26),xy(23,27),xy(24,27),xy(25,26),xy(24,25),xy(24,24),xy(25,24),xy(26,23),xy(27,23),xy(32,18),xy(32,15),xy(33,15),xy(34,16),xy(36,16),xy(37,15),xy(39,15),xy(40,14),xy(40,13),xy(41,13),xy(42,14),xy(43,14),xy(44,15),xy(41,18),xy(41,21),xy(42,22),xy(43,22),xy(43,23),xy(44,24),xy(43,25),xy(41,25),xy(40,26),xy(42,28),xy(41,29),xy(38,29),xy(37,28),xy(36,28),xy(35,27),xy(34,27),xy(33,28),xy(30,28),xy(29,27),xy(27,27),xy(26,26),xy(23,26)]).
midline(r182, [xy(24,26),xy(25,25),xy(27,25)]).
midline(r182, [xy(30,24),xy(32,23),xy(33,22),xy(33,23),xy(34,22),xy(34,21),xy(38,23)]).
midline(r182, [xy(33,16)]).
midline(r182, [xy(37,19)]).
midline(r182, [xy(38,27),xy(39,27),xy(41,28)]).
midline(r182, [xy(40,16),xy(40,17),xy(41,16),xy(41,15),xy(43,15)]).
midline(r182, [xy(43,24)]).
fillpoint(r182, xy(36,22), 7).
fillpoint(r182, xy(38,23), 6).
fillpoint(r182, xy(37,23), 6).
fillpoint(r182, xy(37,22), 6).
fillpoint(r182, xy(36,23), 6).
region(r183, '#1b1c19', 6, centroid(44,14)).
polygon(r183, [xy(42,13),xy(44,13),xy(44,14),xy(46,14),xy(42,13)]).
fillpoint(r183, xy(46,14), 1).
fillpoint(r183, xy(45,14), 1).
fillpoint(r183, xy(44,14), 1).
fillpoint(r183, xy(44,13), 1).
fillpoint(r183, xy(43,13), 1).
region(r188, '#666d6c', 12, centroid(6,16)).
polygon(r188, [xy(5,14),xy(5,17),xy(6,17),xy(7,16),xy(7,15),xy(8,16),xy(9,16),xy(5,14)]).
midline(r188, [xy(6,15),xy(6,16)]).
fillpoint(r188, xy(6,16), 2).
fillpoint(r188, xy(6,15), 2).
fillpoint(r188, xy(9,16), 1).
fillpoint(r188, xy(8,16), 1).
fillpoint(r188, xy(7,16), 1).
region(r204, '#221f1a', 7, centroid(50,16)).
polygon(r204, [xy(48,16),xy(49,15),xy(49,16),xy(50,16),xy(50,17),xy(51,16),xy(51,15),xy(48,16)]).
fillpoint(r204, xy(51,16), 1).
fillpoint(r204, xy(51,15), 1).
fillpoint(r204, xy(50,17), 1).
fillpoint(r204, xy(50,16), 1).
fillpoint(r204, xy(49,16), 1).
region(r211, '#41423e', 8, centroid(9,17)).
polygon(r211, [xy(7,17),xy(9,17),xy(9,18),xy(10,17),xy(10,18),xy(11,18),xy(7,17)]).
fillpoint(r211, xy(11,18), 1).
fillpoint(r211, xy(10,18), 1).
fillpoint(r211, xy(10,17), 1).
fillpoint(r211, xy(10,16), 1).
fillpoint(r211, xy(9,18), 1).
region(r224, '#2e2922', 5, centroid(49,18)).
polygon(r224, [xy(48,19),xy(49,18),xy(49,17),xy(50,18),xy(49,19),xy(48,19)]).
fillpoint(r224, xy(50,18), 1).
fillpoint(r224, xy(49,19), 1).
fillpoint(r224, xy(49,18), 1).
fillpoint(r224, xy(49,17), 1).
fillpoint(r224, xy(48,19), 1).
region(r231, '#32302a', 16, centroid(7,19)).
polygon(r231, [xy(3,20),xy(4,20),xy(5,19),xy(5,20),xy(6,20),xy(7,19),xy(6,18),xy(8,18),xy(8,19),xy(9,19),xy(9,20),xy(10,19),xy(10,20),xy(11,19),xy(3,20)]).
midline(r231, [xy(6,19)]).
fillpoint(r231, xy(6,19), 2).
fillpoint(r231, xy(11,19), 1).
fillpoint(r231, xy(10,20), 1).
fillpoint(r231, xy(10,19), 1).
fillpoint(r231, xy(9,20), 1).
region(r232, '#32302a', 36, centroid(16,23)).
polygon(r232, [xy(12,18),xy(14,18),xy(14,19),xy(13,20),xy(15,22),xy(15,23),xy(16,22),xy(16,19),xy(15,18),xy(12,18)]).
midline(r232, [xy(14,20),xy(15,19),xy(15,21)]).
midline(r232, [xy(17,25),xy(18,24),xy(18,25)]).
fillpoint(r232, xy(18,25), 2).
fillpoint(r232, xy(18,24), 2).
fillpoint(r232, xy(17,25), 2).
fillpoint(r232, xy(15,21), 2).
fillpoint(r232, xy(15,20), 2).
region(r238, '#2e2922', 4, centroid(44,19)).
polygon(r238, [xy(43,19),xy(44,19),xy(45,18),xy(45,19),xy(43,19)]).
fillpoint(r238, xy(45,19), 1).
fillpoint(r238, xy(45,18), 1).
fillpoint(r238, xy(44,19), 1).
fillpoint(r238, xy(43,19), 1).
region(r239, '#32302a', 4, centroid(47,19)).
polygon(r239, [xy(46,18),xy(46,19),xy(47,18),xy(47,19),xy(46,18)]).
fillpoint(r239, xy(47,19), 1).
fillpoint(r239, xy(47,18), 1).
fillpoint(r239, xy(46,19), 1).
fillpoint(r239, xy(46,18), 1).
region(r250, '#41423e', 13, centroid(49,21)).
polygon(r250, [xy(46,23),xy(47,23),xy(47,24),xy(48,23),xy(48,22),xy(49,21),xy(49,20),xy(50,19),xy(51,19),xy(51,20),xy(49,22),xy(46,23)]).
midline(r250, [xy(50,20)]).
fillpoint(r250, xy(50,20), 2).
fillpoint(r250, xy(51,20), 1).
fillpoint(r250, xy(51,19), 1).
fillpoint(r250, xy(50,21), 1).
fillpoint(r250, xy(50,19), 1).
region(r254, '#32302a', 6, centroid(1,21)).
polygon(r254, [xy(0,20),xy(0,21),xy(1,21),xy(1,22),xy(2,21),xy(2,22),xy(0,20)]).
fillpoint(r254, xy(2,22), 1).
fillpoint(r254, xy(2,21), 1).
fillpoint(r254, xy(1,22), 1).
fillpoint(r254, xy(1,21), 1).
fillpoint(r254, xy(0,21), 1).
region(r255, '#2e2922', 30, centroid(7,23)).
polygon(r255, [xy(4,21),xy(4,28),xy(5,27),xy(5,21),xy(6,21),xy(7,20),xy(7,21),xy(8,20),xy(8,21),xy(10,21),xy(11,20),xy(12,20),xy(12,21),xy(11,22),xy(13,21),xy(4,21)]).
midline(r255, [xy(11,21)]).
fillpoint(r255, xy(11,21), 2).
fillpoint(r255, xy(13,21), 1).
fillpoint(r255, xy(12,21), 1).
fillpoint(r255, xy(12,20), 1).
fillpoint(r255, xy(11,22), 1).
region(r260, '#11110d', 4, centroid(45,21)).
polygon(r260, [xy(44,21),xy(45,20),xy(45,21),xy(46,20),xy(44,21)]).
fillpoint(r260, xy(46,20), 1).
fillpoint(r260, xy(45,21), 1).
fillpoint(r260, xy(45,20), 1).
fillpoint(r260, xy(44,21), 1).
region(r273, '#221f1a', 35, centroid(8,24)).
polygon(r273, [xy(6,22),xy(6,28),xy(7,28),xy(8,27),xy(8,28),xy(9,26),xy(9,25),xy(11,23),xy(10,22),xy(7,22),xy(6,22)]).
midline(r273, [xy(7,26),xy(7,27),xy(8,26),xy(8,24),xy(10,23)]).
fillpoint(r273, xy(8,24), 3).
fillpoint(r273, xy(10,23), 2).
fillpoint(r273, xy(9,24), 2).
fillpoint(r273, xy(9,23), 2).
fillpoint(r273, xy(8,26), 2).
region(r279, '#32302a', 4, centroid(46,22)).
polygon(r279, [xy(45,22),xy(45,23),xy(46,22),xy(47,22),xy(45,22)]).
fillpoint(r279, xy(47,22), 1).
fillpoint(r279, xy(46,22), 1).
fillpoint(r279, xy(45,23), 1).
fillpoint(r279, xy(45,22), 1).
region(r283, '#221f1a', 17, centroid(2,26)).
polygon(r283, [xy(0,25),xy(1,24),xy(2,24),xy(3,23),xy(3,27),xy(2,28),xy(1,27),xy(1,26),xy(3,28),xy(2,29),xy(0,25)]).
midline(r283, [xy(1,25),xy(2,25),xy(2,27)]).
fillpoint(r283, xy(2,27), 2).
fillpoint(r283, xy(2,26), 2).
fillpoint(r283, xy(2,25), 2).
fillpoint(r283, xy(1,25), 2).
fillpoint(r283, xy(3,28), 1).
region(r287, '#1b1c19', 28, centroid(12,27)).
polygon(r287, [xy(9,27),xy(9,28),xy(11,28),xy(12,27),xy(10,25),xy(10,26),xy(11,24),xy(12,24),xy(12,25),xy(13,24),xy(13,25),xy(14,24),xy(14,26),xy(13,27),xy(13,28),xy(11,30),xy(12,30),xy(13,29),xy(14,29),xy(14,27),xy(9,27)]).
hole(r287, [xy(12,26),xy(13,26),xy(12,26)]).
midline(r287, [xy(10,27),xy(11,27),xy(12,28)]).
midline(r287, [xy(11,25)]).
fillpoint(r287, xy(12,28), 2).
fillpoint(r287, xy(11,27), 2).
fillpoint(r287, xy(11,25), 2).
fillpoint(r287, xy(10,27), 2).
fillpoint(r287, xy(14,29), 1).
region(r297, '#1b1c19', 11, centroid(44,26)).
polygon(r297, [xy(41,26),xy(42,26),xy(42,27),xy(43,26),xy(45,26),xy(45,27),xy(46,26),xy(46,28),xy(41,26)]).
fillpoint(r297, xy(46,28), 1).
fillpoint(r297, xy(46,27), 1).
fillpoint(r297, xy(46,26), 1).
fillpoint(r297, xy(46,25), 1).
fillpoint(r297, xy(45,27), 1).
region(r300, '#99a6ab', 180, centroid(88,35)).
polygon(r300, [xy(72,40),xy(73,39),xy(73,38),xy(78,38),xy(78,39),xy(77,40),xy(94,40),xy(95,39),xy(95,26),xy(94,25),xy(93,26),xy(92,26),xy(90,28),xy(89,28),xy(87,30),xy(86,30),xy(85,31),xy(84,31),xy(84,32),xy(85,32),xy(86,33),xy(87,33),xy(88,34),xy(87,35),xy(86,35),xy(85,36),xy(84,36),xy(83,37),xy(80,37),xy(79,38),xy(72,40)]).
midline(r300, [xy(79,39),xy(80,38),xy(80,39),xy(81,38),xy(81,39),xy(82,38),xy(82,39),xy(84,38),xy(85,38),xy(86,37),xy(86,38),xy(90,36),xy(91,35),xy(91,36)]).
midline(r300, [xy(86,31),xy(86,32)]).
midline(r300, [xy(90,32),xy(91,31),xy(91,33)]).
midline(r300, [xy(92,29)]).
midline(r300, [xy(94,26)]).
fillpoint(r300, xy(91,36), 5).
fillpoint(r300, xy(91,35), 5).
fillpoint(r300, xy(91,33), 5).
fillpoint(r300, xy(91,32), 5).
fillpoint(r300, xy(91,31), 5).
region(r303, '#11110d', 8, centroid(15,28)).
polygon(r303, [xy(14,28),xy(15,27),xy(15,26),xy(16,28),xy(15,29),xy(16,29),xy(16,30),xy(14,28)]).
midline(r303, [xy(15,28)]).
fillpoint(r303, xy(15,28), 2).
fillpoint(r303, xy(16,30), 1).
fillpoint(r303, xy(16,29), 1).
fillpoint(r303, xy(16,28), 1).
fillpoint(r303, xy(15,29), 1).
region(r313, '#1b1c19', 11, centroid(25,28)).
polygon(r313, [xy(22,27),xy(22,28),xy(24,28),xy(25,27),xy(25,28),xy(26,27),xy(26,28),xy(29,28),xy(22,27)]).
fillpoint(r313, xy(29,28), 1).
fillpoint(r313, xy(28,28), 1).
fillpoint(r313, xy(27,28), 1).
fillpoint(r313, xy(26,28), 1).
fillpoint(r313, xy(26,27), 1).
region(r314, '#221f1a', 5, centroid(44,28)).
polygon(r314, [xy(43,27),xy(44,27),xy(44,28),xy(45,28),xy(45,29),xy(43,27)]).
fillpoint(r314, xy(45,29), 1).
fillpoint(r314, xy(45,28), 1).
fillpoint(r314, xy(44,28), 1).
fillpoint(r314, xy(44,27), 1).
fillpoint(r314, xy(43,27), 1).
region(r316, '#41423e', 33, centroid(54,30)).
polygon(r316, [xy(47,29),xy(47,30),xy(48,29),xy(48,27),xy(50,27),xy(50,28),xy(49,29),xy(51,29),xy(51,30),xy(52,29),xy(52,30),xy(54,30),xy(54,31),xy(55,31),xy(55,32),xy(56,31),xy(56,32),xy(57,31),xy(57,32),xy(58,31),xy(59,32),xy(58,33),xy(59,33),xy(60,32),xy(60,30),xy(47,29)]).
midline(r316, [xy(49,28)]).
midline(r316, [xy(58,32)]).
fillpoint(r316, xy(58,32), 2).
fillpoint(r316, xy(49,28), 2).
fillpoint(r316, xy(60,33), 1).
fillpoint(r316, xy(60,32), 1).
fillpoint(r316, xy(60,31), 1).
region(r322, '#11110d', 14, centroid(22,30)).
polygon(r322, [xy(19,30),xy(20,29),xy(20,28),xy(21,28),xy(22,29),xy(21,30),xy(22,30),xy(22,31),xy(23,31),xy(23,32),xy(24,32),xy(24,33),xy(19,30)]).
midline(r322, [xy(21,29)]).
fillpoint(r322, xy(21,29), 2).
fillpoint(r322, xy(24,33), 1).
fillpoint(r322, xy(24,32), 1).
fillpoint(r322, xy(23,32), 1).
fillpoint(r322, xy(23,31), 1).
region(r323, '#1b1c19', 40, centroid(37,30)).
polygon(r323, [xy(30,29),xy(31,29),xy(31,30),xy(32,29),xy(32,30),xy(34,28),xy(35,28),xy(36,29),xy(37,29),xy(37,30),xy(35,32),xy(34,32),xy(33,31),xy(30,29)]).
midline(r323, [xy(34,30),xy(35,30),xy(36,32)]).
fillpoint(r323, xy(35,30), 3).
fillpoint(r323, xy(34,30), 3).
fillpoint(r323, xy(36,32), 2).
fillpoint(r323, xy(36,30), 2).
fillpoint(r323, xy(35,31), 2).
region(r325, '#666d6c', 12, centroid(55,29)).
polygon(r325, [xy(51,28),xy(53,28),xy(53,29),xy(55,29),xy(55,30),xy(59,30),xy(59,31),xy(51,28)]).
fillpoint(r325, xy(59,31), 1).
fillpoint(r325, xy(59,30), 1).
fillpoint(r325, xy(58,30), 1).
fillpoint(r325, xy(57,30), 1).
fillpoint(r325, xy(56,30), 1).
region(r330, '#666d6c', 70, centroid(4,34)).
polygon(r330, [xy(0,29),xy(0,36),xy(1,37),xy(1,38),xy(2,39),xy(4,39),xy(5,38),xy(6,38),xy(8,36),xy(8,37),xy(9,35),xy(9,31),xy(8,30),xy(7,30),xy(7,31),xy(6,32),xy(6,33),xy(4,35),xy(2,33),xy(2,32),xy(1,31),xy(1,30),xy(0,29)]).
midline(r330, [xy(1,32),xy(1,33),xy(2,35),xy(2,36),xy(3,36),xy(3,37),xy(4,37),xy(6,35),xy(6,36),xy(7,35),xy(7,32),xy(8,31),xy(8,32)]).
fillpoint(r330, xy(7,35), 3).
fillpoint(r330, xy(7,34), 3).
fillpoint(r330, xy(6,36), 3).
fillpoint(r330, xy(6,35), 3).
fillpoint(r330, xy(5,36), 3).
region(r340, '#221f1a', 68, centroid(34,33)).
polygon(r340, [xy(23,29),xy(25,29),xy(25,30),xy(26,29),xy(26,31),xy(27,29),xy(29,29),xy(29,33),xy(31,35),xy(32,35),xy(34,37),xy(35,37),xy(36,36),xy(36,37),xy(37,35),xy(35,33),xy(34,33),xy(32,31),xy(31,31),xy(30,30),xy(23,29)]).
midline(r340, [xy(30,31),xy(31,33),xy(32,33),xy(34,35),xy(35,35)]).
fillpoint(r340, xy(35,35), 3).
fillpoint(r340, xy(34,35), 3).
fillpoint(r340, xy(33,34), 3).
fillpoint(r340, xy(32,33), 3).
fillpoint(r340, xy(31,33), 3).
region(r351, '#41423e', 8, centroid(15,31)).
polygon(r351, [xy(13,30),xy(13,31),xy(14,30),xy(14,31),xy(15,31),xy(15,32),xy(16,32),xy(16,33),xy(13,30)]).
fillpoint(r351, xy(16,33), 1).
fillpoint(r351, xy(16,32), 1).
fillpoint(r351, xy(15,32), 1).
fillpoint(r351, xy(15,31), 1).
fillpoint(r351, xy(14,31), 1).
region(r357, '#2e2922', 6, centroid(28,31)).
polygon(r357, [xy(27,30),xy(27,31),xy(28,30),xy(28,33),xy(27,30)]).
fillpoint(r357, xy(28,33), 1).
fillpoint(r357, xy(28,32), 1).
fillpoint(r357, xy(28,31), 1).
fillpoint(r357, xy(28,30), 1).
fillpoint(r357, xy(27,31), 1).
region(r359, '#666d6c', 9, centroid(51,31)).
polygon(r359, [xy(48,30),xy(50,30),xy(50,31),xy(53,31),xy(53,32),xy(54,32),xy(48,30)]).
fillpoint(r359, xy(54,32), 1).
fillpoint(r359, xy(53,32), 1).
fillpoint(r359, xy(53,31), 1).
fillpoint(r359, xy(52,31), 1).
fillpoint(r359, xy(51,31), 1).
region(r369, '#1b1c19', 16, centroid(23,33)).
polygon(r369, [xy(19,31),xy(20,31),xy(20,32),xy(21,31),xy(21,32),xy(22,32),xy(22,33),xy(23,33),xy(23,35),xy(25,33),xy(25,34),xy(26,34),xy(26,35),xy(27,35),xy(19,31)]).
fillpoint(r369, xy(27,35), 1).
fillpoint(r369, xy(26,35), 1).
fillpoint(r369, xy(26,34), 1).
fillpoint(r369, xy(25,34), 1).
fillpoint(r369, xy(25,33), 1).
region(r376, '#666d6c', 4, centroid(61,33)).
polygon(r376, [xy(61,31),xy(61,34),xy(61,31)]).
fillpoint(r376, xy(61,34), 1).
fillpoint(r376, xy(61,33), 1).
fillpoint(r376, xy(61,32), 1).
fillpoint(r376, xy(61,31), 1).
region(r380, '#222827', 4, centroid(10,34)).
polygon(r380, [xy(10,32),xy(10,35),xy(10,32)]).
fillpoint(r380, xy(10,35), 1).
fillpoint(r380, xy(10,34), 1).
fillpoint(r380, xy(10,33), 1).
fillpoint(r380, xy(10,32), 1).
region(r382, '#32302a', 11, centroid(13,33)).
polygon(r382, [xy(11,33),xy(11,34),xy(12,33),xy(12,32),xy(13,32),xy(13,34),xy(12,35),xy(13,35),xy(14,34),xy(14,32),xy(11,33)]).
fillpoint(r382, xy(14,34), 1).
fillpoint(r382, xy(14,32), 1).
fillpoint(r382, xy(13,35), 1).
fillpoint(r382, xy(13,34), 1).
fillpoint(r382, xy(13,33), 1).
region(r385, '#11110d', 18, centroid(20,34)).
polygon(r385, [xy(17,34),xy(18,33),xy(18,34),xy(19,35),xy(19,36),xy(20,36),xy(20,37),xy(21,35),xy(22,34),xy(21,33),xy(20,33),xy(19,32),xy(17,34)]).
midline(r385, [xy(19,33),xy(19,34),xy(20,34),xy(20,35),xy(21,34)]).
fillpoint(r385, xy(21,34), 2).
fillpoint(r385, xy(20,35), 2).
fillpoint(r385, xy(20,34), 2).
fillpoint(r385, xy(19,34), 2).
fillpoint(r385, xy(19,33), 2).
region(r388, '#2e2922', 7, centroid(42,32)).
polygon(r388, [xy(40,32),xy(40,33),xy(41,32),xy(45,32),xy(40,32)]).
fillpoint(r388, xy(45,32), 1).
fillpoint(r388, xy(44,32), 1).
fillpoint(r388, xy(43,32), 1).
fillpoint(r388, xy(42,32), 1).
fillpoint(r388, xy(41,32), 1).
region(r390, '#41423e', 35, centroid(50,34)).
polygon(r390, [xy(44,34),xy(45,34),xy(45,35),xy(46,35),xy(46,36),xy(47,34),xy(46,33),xy(47,32),xy(48,32),xy(49,33),xy(48,34),xy(49,34),xy(50,33),xy(50,34),xy(51,34),xy(52,33),xy(51,32),xy(52,32),xy(52,34),xy(54,34),xy(54,35),xy(55,34),xy(55,36),xy(54,37),xy(51,37),xy(52,38),xy(44,34)]).
midline(r390, [xy(46,34),xy(47,33),xy(48,33)]).
midline(r390, [xy(51,33)]).
fillpoint(r390, xy(51,33), 2).
fillpoint(r390, xy(48,33), 2).
fillpoint(r390, xy(47,33), 2).
fillpoint(r390, xy(46,34), 2).
fillpoint(r390, xy(55,37), 1).
region(r398, '#32302a', 5, centroid(43,33)).
polygon(r398, [xy(41,33),xy(45,33),xy(41,33)]).
fillpoint(r398, xy(45,33), 1).
fillpoint(r398, xy(44,33), 1).
fillpoint(r398, xy(43,33), 1).
fillpoint(r398, xy(42,33), 1).
fillpoint(r398, xy(41,33), 1).
region(r402, '#bccbd1', 12, centroid(66,34)).
polygon(r402, [xy(62,33),xy(62,34),xy(63,34),xy(63,35),xy(64,34),xy(68,34),xy(68,35),xy(69,34),xy(69,35),xy(62,33)]).
fillpoint(r402, xy(69,35), 1).
fillpoint(r402, xy(69,34), 1).
fillpoint(r402, xy(68,35), 1).
fillpoint(r402, xy(68,34), 1).
fillpoint(r402, xy(67,34), 1).
region(r406, '#2e2922', 4, centroid(30,35)).
polygon(r406, [xy(29,34),xy(29,35),xy(30,35),xy(30,36),xy(29,34)]).
fillpoint(r406, xy(30,36), 1).
fillpoint(r406, xy(30,35), 1).
fillpoint(r406, xy(29,35), 1).
fillpoint(r406, xy(29,34), 1).
region(r410, '#222827', 29, centroid(60,37)).
polygon(r410, [xy(56,36),xy(56,37),xy(58,35),xy(57,34),xy(60,34),xy(61,35),xy(61,36),xy(60,37),xy(59,37),xy(60,38),xy(60,39),xy(61,38),xy(62,38),xy(63,39),xy(62,40),xy(63,40),xy(64,39),xy(64,40),xy(56,36)]).
midline(r410, [xy(59,35),xy(59,36),xy(60,35),xy(60,36)]).
midline(r410, [xy(61,39),xy(62,39)]).
fillpoint(r410, xy(62,39), 2).
fillpoint(r410, xy(61,39), 2).
fillpoint(r410, xy(60,36), 2).
fillpoint(r410, xy(60,35), 2).
fillpoint(r410, xy(59,36), 2).
region(r414, '#1b1c19', 33, centroid(14,38)).
polygon(r414, [xy(8,40),xy(9,40),xy(10,39),xy(10,38),xy(11,38),xy(13,36),xy(14,36),xy(15,35),xy(16,36),xy(14,38),xy(13,38),xy(11,40),xy(12,40),xy(13,39),xy(13,40),xy(14,40),xy(15,39),xy(15,38),xy(16,39),xy(18,37),xy(17,36),xy(17,35),xy(18,35),xy(18,36),xy(19,37),xy(8,40)]).
midline(r414, [xy(11,39),xy(13,37),xy(14,37),xy(15,36)]).
fillpoint(r414, xy(15,36), 2).
fillpoint(r414, xy(14,37), 2).
fillpoint(r414, xy(13,37), 2).
fillpoint(r414, xy(11,39), 2).
fillpoint(r414, xy(19,37), 1).
region(r421, '#99a6ab', 9, centroid(49,36)).
polygon(r421, [xy(47,35),xy(47,36),xy(48,35),xy(48,36),xy(49,35),xy(49,36),xy(50,35),xy(50,36),xy(51,36),xy(47,35)]).
fillpoint(r421, xy(51,36), 1).
fillpoint(r421, xy(50,36), 1).
fillpoint(r421, xy(50,35), 1).
fillpoint(r421, xy(49,36), 1).
fillpoint(r421, xy(49,35), 1).
region(r422, '#666d6c', 6, centroid(53,36)).
polygon(r422, [xy(51,35),xy(52,35),xy(52,36),xy(53,35),xy(53,36),xy(54,36),xy(51,35)]).
fillpoint(r422, xy(54,36), 1).
fillpoint(r422, xy(53,36), 1).
fillpoint(r422, xy(53,35), 1).
fillpoint(r422, xy(52,36), 1).
fillpoint(r422, xy(52,35), 1).
region(r430, '#1b1c19', 10, centroid(22,38)).
polygon(r430, [xy(21,36),xy(21,39),xy(22,39),xy(23,38),xy(22,37),xy(22,36),xy(21,36)]).
midline(r430, [xy(22,38)]).
fillpoint(r430, xy(22,38), 2).
fillpoint(r430, xy(23,39), 1).
fillpoint(r430, xy(23,38), 1).
fillpoint(r430, xy(22,39), 1).
fillpoint(r430, xy(22,37), 1).
region(r432, '#11110d', 20, centroid(25,38)).
polygon(r432, [xy(23,40),xy(24,39),xy(24,37),xy(25,36),xy(27,36),xy(27,39),xy(26,40),xy(24,40),xy(23,40)]).
midline(r432, [xy(25,37),xy(25,39),xy(26,38),xy(26,39)]).
fillpoint(r432, xy(26,39), 2).
fillpoint(r432, xy(26,38), 2).
fillpoint(r432, xy(26,37), 2).
fillpoint(r432, xy(25,39), 2).
fillpoint(r432, xy(25,38), 2).
region(r433, '#1b1c19', 5, centroid(28,38)).
polygon(r433, [xy(28,36),xy(28,40),xy(28,36)]).
fillpoint(r433, xy(28,40), 1).
fillpoint(r433, xy(28,39), 1).
fillpoint(r433, xy(28,38), 1).
fillpoint(r433, xy(28,37), 1).
fillpoint(r433, xy(28,36), 1).
region(r434, '#221f1a', 12, centroid(30,38)).
polygon(r434, [xy(29,36),xy(29,40),xy(30,40),xy(31,39),xy(31,38),xy(30,37),xy(32,38),xy(29,36)]).
midline(r434, [xy(30,38),xy(30,39)]).
fillpoint(r434, xy(30,39), 2).
fillpoint(r434, xy(30,38), 2).
fillpoint(r434, xy(32,38), 1).
fillpoint(r434, xy(31,39), 1).
fillpoint(r434, xy(31,38), 1).
region(r436, '#2e2922', 9, centroid(32,38)).
polygon(r436, [xy(31,37),xy(32,36),xy(32,37),xy(33,37),xy(33,38),xy(31,40),xy(32,40),xy(33,39),xy(31,37)]).
fillpoint(r436, xy(33,39), 1).
fillpoint(r436, xy(33,38), 1).
fillpoint(r436, xy(33,37), 1).
fillpoint(r436, xy(32,40), 1).
fillpoint(r436, xy(32,39), 1).
region(r437, '#2e2922', 17, centroid(39,37)).
polygon(r437, [xy(35,38),xy(36,38),xy(37,37),xy(37,36),xy(39,36),xy(39,37),xy(38,38),xy(37,38),xy(38,39),xy(40,39),xy(41,38),xy(41,37),xy(40,36),xy(41,36),xy(42,37),xy(35,38)]).
hole(r437, [xy(39,38),xy(40,37),xy(40,38),xy(39,38)]).
fillpoint(r437, xy(42,37), 1).
fillpoint(r437, xy(41,38), 1).
fillpoint(r437, xy(41,37), 1).
fillpoint(r437, xy(41,36), 1).
fillpoint(r437, xy(40,39), 1).
region(r442, '#32302a', 9, centroid(63,37)).
polygon(r442, [xy(61,37),xy(63,37),xy(63,38),xy(64,38),xy(65,37),xy(64,36),xy(65,36),xy(61,37)]).
midline(r442, [xy(64,37)]).
fillpoint(r442, xy(64,37), 2).
fillpoint(r442, xy(65,37), 1).
fillpoint(r442, xy(65,36), 1).
fillpoint(r442, xy(64,38), 1).
fillpoint(r442, xy(64,36), 1).
region(r450, '#41423e', 23, centroid(46,39)).
polygon(r450, [xy(42,38),xy(43,37),xy(44,37),xy(45,38),xy(44,39),xy(43,39),xy(43,40),xy(45,39),xy(46,38),xy(46,39),xy(47,38),xy(47,39),xy(48,39),xy(48,40),xy(49,40),xy(50,39),xy(49,38),xy(50,38),xy(50,40),xy(42,38)]).
midline(r450, [xy(43,38),xy(44,38)]).
midline(r450, [xy(49,39)]).
fillpoint(r450, xy(49,39), 2).
fillpoint(r450, xy(44,38), 2).
fillpoint(r450, xy(43,38), 2).
fillpoint(r450, xy(50,40), 1).
fillpoint(r450, xy(50,39), 1).
region(r454, '#222827', 14, centroid(68,39)).
polygon(r454, [xy(65,38),xy(66,37),xy(67,38),xy(66,39),xy(67,39),xy(68,38),xy(69,38),xy(70,39),xy(69,40),xy(70,40),xy(65,38)]).
midline(r454, [xy(66,38),xy(68,39),xy(69,39)]).
fillpoint(r454, xy(69,39), 2).
fillpoint(r454, xy(68,39), 2).
fillpoint(r454, xy(66,38), 2).
fillpoint(r454, xy(70,40), 1).
fillpoint(r454, xy(70,39), 1).
region(r464, '#221f1a', 6, centroid(19,39)).
polygon(r464, [xy(17,39),xy(18,38),xy(18,39),xy(19,39),xy(20,38),xy(20,39),xy(17,39)]).
fillpoint(r464, xy(20,39), 1).
fillpoint(r464, xy(20,38), 1).
fillpoint(r464, xy(19,39), 1).
fillpoint(r464, xy(18,39), 1).
fillpoint(r464, xy(18,38), 1).
region(r466, '#32302a', 10, centroid(35,39)).
polygon(r466, [xy(33,40),xy(34,39),xy(34,38),xy(35,39),xy(34,40),xy(35,40),xy(36,39),xy(37,39),xy(37,40),xy(38,40),xy(33,40)]).
fillpoint(r466, xy(38,40), 1).
fillpoint(r466, xy(37,40), 1).
fillpoint(r466, xy(37,39), 1).
fillpoint(r466, xy(36,39), 1).
fillpoint(r466, xy(35,40), 1).
region(r471, '#32302a', 6, centroid(54,38)).
polygon(r471, [xy(52,39),xy(53,38),xy(53,39),xy(54,38),xy(56,38),xy(52,39)]).
fillpoint(r471, xy(56,38), 1).
fillpoint(r471, xy(55,38), 1).
fillpoint(r471, xy(54,38), 1).
fillpoint(r471, xy(53,39), 1).
fillpoint(r471, xy(53,38), 1).
region(r472, '#222827', 9, centroid(57,39)).
polygon(r472, [xy(55,40),xy(56,39),xy(56,40),xy(57,40),xy(58,39),xy(57,38),xy(58,38),xy(58,40),xy(55,40)]).
midline(r472, [xy(57,39)]).
fillpoint(r472, xy(57,39), 2).
fillpoint(r472, xy(58,40), 1).
fillpoint(r472, xy(58,39), 1).
fillpoint(r472, xy(58,38), 1).
fillpoint(r472, xy(57,40), 1).
region(r486, '#32302a', 4, centroid(66,40)).
polygon(r486, [xy(65,39),xy(65,40),xy(67,40),xy(65,39)]).
fillpoint(r486, xy(67,40), 1).
fillpoint(r486, xy(66,40), 1).
fillpoint(r486, xy(65,40), 1).
fillpoint(r486, xy(65,39), 1).
region(r488, '#b0bec4', 4, centroid(76,39)).
polygon(r488, [xy(74,39),xy(77,39),xy(74,39)]).
fillpoint(r488, xy(77,39), 1).
fillpoint(r488, xy(76,39), 1).
fillpoint(r488, xy(75,39), 1).
fillpoint(r488, xy(74,39), 1).
region(r501, '#666d6c', 4, centroid(46,40)).
polygon(r501, [xy(44,40),xy(47,40),xy(44,40)]).
fillpoint(r501, xy(47,40), 1).
fillpoint(r501, xy(46,40), 1).
fillpoint(r501, xy(45,40), 1).
fillpoint(r501, xy(44,40), 1).
adjacent(r1, r109).
shared_edge(r1, r109, 6).
adjacent(r1, r110).
shared_edge(r1, r110, 2).
adjacent(r1, r150).
shared_edge(r1, r150, 4).
adjacent(r1, r155).
shared_edge(r1, r155, 3).
adjacent(r1, r161).
shared_edge(r1, r161, 1).
adjacent(r1, r162).
shared_edge(r1, r162, 4).
adjacent(r1, r163).
shared_edge(r1, r163, 4).
adjacent(r1, r187).
shared_edge(r1, r187, 1).
adjacent(r1, r188).
shared_edge(r1, r188, 1).
adjacent(r1, r198).
shared_edge(r1, r198, 2).
adjacent(r1, r199).
shared_edge(r1, r199, 3).
adjacent(r1, r2).
shared_edge(r1, r2, 1).
adjacent(r1, r210).
shared_edge(r1, r210, 4).
adjacent(r1, r215).
shared_edge(r1, r215, 3).
adjacent(r1, r228).
shared_edge(r1, r228, 4).
adjacent(r1, r229).
shared_edge(r1, r229, 1).
adjacent(r1, r231).
shared_edge(r1, r231, 1).
adjacent(r1, r245).
shared_edge(r1, r245, 2).
adjacent(r1, r254).
shared_edge(r1, r254, 4).
adjacent(r1, r27).
shared_edge(r1, r27, 2).
adjacent(r1, r28).
shared_edge(r1, r28, 2).
adjacent(r1, r38).
shared_edge(r1, r38, 4).
adjacent(r1, r4).
shared_edge(r1, r4, 2).
adjacent(r1, r5).
shared_edge(r1, r5, 4).
adjacent(r1, r66).
shared_edge(r1, r66, 2).
adjacent(r1, r81).
shared_edge(r1, r81, 2).
adjacent(r1, r95).
shared_edge(r1, r95, 6).
adjacent(r10, r11).
shared_edge(r10, r11, 2).
adjacent(r10, r31).
shared_edge(r10, r31, 2).
adjacent(r10, r44).
shared_edge(r10, r44, 1).
adjacent(r10, r9).
shared_edge(r10, r9, 1).
adjacent(r100, r137).
shared_edge(r100, r137, 2).
adjacent(r100, r138).
shared_edge(r100, r138, 1).
adjacent(r100, r139).
shared_edge(r100, r139, 1).
adjacent(r100, r140).
shared_edge(r100, r140, 1).
adjacent(r100, r59).
shared_edge(r100, r59, 14).
adjacent(r100, r97).
shared_edge(r100, r97, 1).
adjacent(r101, r102).
shared_edge(r101, r102, 3).
adjacent(r101, r61).
shared_edge(r101, r61, 4).
adjacent(r101, r75).
shared_edge(r101, r75, 1).
adjacent(r102, r118).
shared_edge(r102, r118, 3).
adjacent(r102, r145).
shared_edge(r102, r145, 2).
adjacent(r102, r146).
shared_edge(r102, r146, 2).
adjacent(r102, r152).
shared_edge(r102, r152, 1).
adjacent(r102, r158).
shared_edge(r102, r158, 2).
adjacent(r102, r17).
shared_edge(r102, r17, 3).
adjacent(r102, r175).
shared_edge(r102, r175, 1).
adjacent(r102, r176).
shared_edge(r102, r176, 1).
adjacent(r102, r18).
shared_edge(r102, r18, 1).
adjacent(r102, r61).
shared_edge(r102, r61, 1).
adjacent(r103, r32).
shared_edge(r103, r32, 4).
adjacent(r104, r105).
shared_edge(r104, r105, 1).
adjacent(r104, r123).
shared_edge(r104, r123, 1).
adjacent(r104, r20).
shared_edge(r104, r20, 2).
adjacent(r104, r32).
shared_edge(r104, r32, 1).
adjacent(r104, r91).
shared_edge(r104, r91, 1).
adjacent(r105, r20).
shared_edge(r105, r20, 1).
adjacent(r105, r89).
shared_edge(r105, r89, 1).
adjacent(r105, r91).
shared_edge(r105, r91, 3).
adjacent(r106, r107).
shared_edge(r106, r107, 1).
adjacent(r106, r126).
shared_edge(r106, r126, 1).
adjacent(r106, r24).
shared_edge(r106, r24, 1).
adjacent(r106, r91).
shared_edge(r106, r91, 1).
adjacent(r107, r108).
shared_edge(r107, r108, 1).
adjacent(r107, r126).
shared_edge(r107, r126, 1).
adjacent(r107, r92).
shared_edge(r107, r92, 1).
adjacent(r108, r93).
shared_edge(r108, r93, 1).
adjacent(r108, r94).
shared_edge(r108, r94, 2).
adjacent(r11, r12).
shared_edge(r11, r12, 1).
adjacent(r11, r13).
shared_edge(r11, r13, 1).
adjacent(r11, r45).
shared_edge(r11, r45, 1).
adjacent(r110, r4).
shared_edge(r110, r4, 2).
adjacent(r111, r29).
shared_edge(r111, r29, 1).
adjacent(r111, r39).
shared_edge(r111, r39, 1).
adjacent(r111, r96).
shared_edge(r111, r96, 2).
adjacent(r112, r113).
shared_edge(r112, r113, 1).
adjacent(r112, r59).
shared_edge(r112, r59, 1).
adjacent(r112, r97).
shared_edge(r112, r97, 2).
adjacent(r113, r59).
shared_edge(r113, r59, 2).
adjacent(r113, r97).
shared_edge(r113, r97, 1).
adjacent(r114, r128).
shared_edge(r114, r128, 2).
adjacent(r114, r129).
shared_edge(r114, r129, 1).
adjacent(r114, r59).
shared_edge(r114, r59, 5).
adjacent(r115, r116).
shared_edge(r115, r116, 3).
adjacent(r115, r13).
shared_edge(r115, r13, 2).
adjacent(r115, r142).
shared_edge(r115, r142, 1).
adjacent(r115, r59).
shared_edge(r115, r59, 3).
adjacent(r115, r97).
shared_edge(r115, r97, 1).
adjacent(r116, r117).
shared_edge(r116, r117, 1).
adjacent(r116, r13).
shared_edge(r116, r13, 2).
adjacent(r116, r130).
shared_edge(r116, r130, 4).
adjacent(r117, r131).
shared_edge(r117, r131, 1).
adjacent(r117, r61).
shared_edge(r117, r61, 1).
adjacent(r117, r88).
shared_edge(r117, r88, 1).
adjacent(r118, r18).
shared_edge(r118, r18, 3).
adjacent(r119, r133).
shared_edge(r119, r133, 1).
adjacent(r119, r18).
shared_edge(r119, r18, 3).
adjacent(r119, r32).
shared_edge(r119, r32, 2).
adjacent(r12, r13).
shared_edge(r12, r13, 18).
adjacent(r120, r133).
shared_edge(r120, r133, 2).
adjacent(r120, r32).
shared_edge(r120, r32, 6).
adjacent(r121, r133).
shared_edge(r121, r133, 1).
adjacent(r121, r32).
shared_edge(r121, r32, 3).
adjacent(r122, r123).
shared_edge(r122, r123, 1).
adjacent(r122, r133).
shared_edge(r122, r133, 1).
adjacent(r122, r32).
shared_edge(r122, r32, 2).
adjacent(r123, r32).
shared_edge(r123, r32, 1).
adjacent(r123, r91).
shared_edge(r123, r91, 3).
adjacent(r124, r125).
shared_edge(r124, r125, 1).
adjacent(r124, r126).
shared_edge(r124, r126, 1).
adjacent(r124, r91).
shared_edge(r124, r91, 2).
adjacent(r125, r126).
shared_edge(r125, r126, 2).
adjacent(r125, r91).
shared_edge(r125, r91, 1).
adjacent(r126, r134).
shared_edge(r126, r134, 1).
adjacent(r126, r135).
shared_edge(r126, r135, 1).
adjacent(r126, r136).
shared_edge(r126, r136, 2).
adjacent(r126, r148).
shared_edge(r126, r148, 1).
adjacent(r126, r149).
shared_edge(r126, r149, 2).
adjacent(r126, r153).
shared_edge(r126, r153, 1).
adjacent(r126, r154).
shared_edge(r126, r154, 2).
adjacent(r126, r159).
shared_edge(r126, r159, 1).
adjacent(r126, r160).
shared_edge(r126, r160, 2).
adjacent(r126, r177).
shared_edge(r126, r177, 1).
adjacent(r126, r178).
shared_edge(r126, r178, 2).
adjacent(r126, r185).
shared_edge(r126, r185, 1).
adjacent(r126, r186).
shared_edge(r126, r186, 2).
adjacent(r126, r197).
shared_edge(r126, r197, 2).
adjacent(r126, r205).
shared_edge(r126, r205, 1).
adjacent(r126, r206).
shared_edge(r126, r206, 2).
adjacent(r126, r207).
shared_edge(r126, r207, 1).
adjacent(r126, r208).
shared_edge(r126, r208, 2).
adjacent(r126, r209).
shared_edge(r126, r209, 2).
adjacent(r126, r214).
shared_edge(r126, r214, 2).
adjacent(r126, r227).
shared_edge(r126, r227, 1).
adjacent(r126, r94).
shared_edge(r126, r94, 51).
adjacent(r127, r165).
shared_edge(r127, r165, 4).
adjacent(r127, r180).
shared_edge(r127, r180, 2).
adjacent(r127, r190).
shared_edge(r127, r190, 2).
adjacent(r127, r201).
shared_edge(r127, r201, 2).
adjacent(r127, r212).
shared_edge(r127, r212, 2).
adjacent(r127, r217).
shared_edge(r127, r217, 1).
adjacent(r127, r5).
shared_edge(r127, r5, 23).
adjacent(r128, r129).
shared_edge(r128, r129, 1).
adjacent(r128, r97).
shared_edge(r128, r97, 3).
adjacent(r129, r59).
shared_edge(r129, r59, 1).
adjacent(r129, r97).
shared_edge(r129, r97, 1).
adjacent(r13, r14).
shared_edge(r13, r14, 2).
adjacent(r13, r15).
shared_edge(r13, r15, 3).
adjacent(r13, r45).
shared_edge(r13, r45, 1).
adjacent(r13, r46).
shared_edge(r13, r46, 3).
adjacent(r13, r57).
shared_edge(r13, r57, 2).
adjacent(r13, r58).
shared_edge(r13, r58, 2).
adjacent(r13, r59).
shared_edge(r13, r59, 10).
adjacent(r13, r60).
shared_edge(r13, r60, 2).
adjacent(r13, r61).
shared_edge(r13, r61, 3).
adjacent(r13, r72).
shared_edge(r13, r72, 1).
adjacent(r13, r73).
shared_edge(r13, r73, 2).
adjacent(r13, r74).
shared_edge(r13, r74, 5).
adjacent(r13, r85).
shared_edge(r13, r85, 1).
adjacent(r13, r86).
shared_edge(r13, r86, 3).
adjacent(r13, r87).
shared_edge(r13, r87, 2).
adjacent(r13, r88).
shared_edge(r13, r88, 3).
adjacent(r130, r131).
shared_edge(r130, r131, 2).
adjacent(r130, r143).
shared_edge(r130, r143, 2).
adjacent(r130, r152).
shared_edge(r130, r152, 2).
adjacent(r130, r157).
shared_edge(r130, r157, 9).
adjacent(r130, r158).
shared_edge(r130, r158, 1).
adjacent(r130, r91).
shared_edge(r130, r91, 9).
adjacent(r130, r97).
shared_edge(r130, r97, 1).
adjacent(r131, r132).
shared_edge(r131, r132, 1).
adjacent(r132, r143).
shared_edge(r132, r143, 1).
adjacent(r132, r61).
shared_edge(r132, r61, 2).
adjacent(r133, r146).
shared_edge(r133, r146, 6).
adjacent(r133, r147).
shared_edge(r133, r147, 5).
adjacent(r133, r158).
shared_edge(r133, r158, 1).
adjacent(r133, r175).
shared_edge(r133, r175, 2).
adjacent(r133, r176).
shared_edge(r133, r176, 2).
adjacent(r133, r32).
shared_edge(r133, r32, 2).
adjacent(r133, r91).
shared_edge(r133, r91, 23).
adjacent(r134, r135).
shared_edge(r134, r135, 1).
adjacent(r134, r91).
shared_edge(r134, r91, 2).
adjacent(r135, r136).
shared_edge(r135, r136, 1).
adjacent(r135, r91).
shared_edge(r135, r91, 1).
adjacent(r136, r91).
shared_edge(r136, r91, 1).
adjacent(r137, r138).
shared_edge(r137, r138, 1).
adjacent(r137, r97).
shared_edge(r137, r97, 3).
adjacent(r138, r139).
shared_edge(r138, r139, 1).
adjacent(r138, r97).
shared_edge(r138, r97, 1).
adjacent(r139, r140).
shared_edge(r139, r140, 1).
adjacent(r139, r97).
shared_edge(r139, r97, 1).
adjacent(r14, r15).
shared_edge(r14, r15, 1).
adjacent(r140, r141).
shared_edge(r140, r141, 1).
adjacent(r140, r97).
shared_edge(r140, r97, 1).
adjacent(r141, r142).
shared_edge(r141, r142, 1).
adjacent(r141, r59).
shared_edge(r141, r59, 1).
adjacent(r141, r97).
shared_edge(r141, r97, 1).
adjacent(r142, r59).
shared_edge(r142, r59, 1).
adjacent(r142, r97).
shared_edge(r142, r97, 1).
adjacent(r143, r144).
shared_edge(r143, r144, 1).
adjacent(r144, r145).
shared_edge(r144, r145, 1).
adjacent(r144, r152).
shared_edge(r144, r152, 1).
adjacent(r144, r61).
shared_edge(r144, r61, 1).
adjacent(r145, r61).
shared_edge(r145, r61, 1).
adjacent(r146, r18).
shared_edge(r146, r18, 4).
adjacent(r147, r32).
shared_edge(r147, r32, 3).
adjacent(r148, r149).
shared_edge(r148, r149, 1).
adjacent(r148, r91).
shared_edge(r148, r91, 2).
adjacent(r149, r91).
shared_edge(r149, r91, 1).
adjacent(r15, r16).
shared_edge(r15, r16, 3).
adjacent(r15, r17).
shared_edge(r15, r17, 2).
adjacent(r15, r47).
shared_edge(r15, r47, 1).
adjacent(r15, r61).
shared_edge(r15, r61, 4).
adjacent(r151, r233).
shared_edge(r151, r233, 1).
adjacent(r151, r39).
shared_edge(r151, r39, 16).
adjacent(r151, r67).
shared_edge(r151, r67, 25).
adjacent(r153, r154).
shared_edge(r153, r154, 1).
adjacent(r153, r91).
shared_edge(r153, r91, 2).
adjacent(r154, r91).
shared_edge(r154, r91, 1).
adjacent(r155, r163).
shared_edge(r155, r163, 3).
adjacent(r155, r164).
shared_edge(r155, r164, 1).
adjacent(r155, r5).
shared_edge(r155, r5, 1).
adjacent(r156, r157).
shared_edge(r156, r157, 1).
adjacent(r156, r174).
shared_edge(r156, r174, 1).
adjacent(r156, r97).
shared_edge(r156, r97, 2).
adjacent(r157, r171).
shared_edge(r157, r171, 4).
adjacent(r157, r173).
shared_edge(r157, r173, 1).
adjacent(r157, r174).
shared_edge(r157, r174, 1).
adjacent(r157, r184).
shared_edge(r157, r184, 3).
adjacent(r157, r203).
shared_edge(r157, r203, 1).
adjacent(r157, r204).
shared_edge(r157, r204, 7).
adjacent(r157, r226).
shared_edge(r157, r226, 1).
adjacent(r159, r160).
shared_edge(r159, r160, 1).
adjacent(r159, r91).
shared_edge(r159, r91, 2).
adjacent(r16, r17).
shared_edge(r16, r17, 1).
adjacent(r160, r91).
shared_edge(r160, r91, 1).
adjacent(r161, r162).
shared_edge(r161, r162, 2).
adjacent(r161, r187).
shared_edge(r161, r187, 1).
adjacent(r163, r179).
shared_edge(r163, r179, 3).
adjacent(r163, r188).
shared_edge(r163, r188, 7).
adjacent(r163, r200).
shared_edge(r163, r200, 1).
adjacent(r164, r179).
shared_edge(r164, r179, 1).
adjacent(r164, r5).
shared_edge(r164, r5, 2).
adjacent(r166, r167).
shared_edge(r166, r167, 1).
adjacent(r166, r181).
shared_edge(r166, r181, 1).
adjacent(r166, r97).
shared_edge(r166, r97, 2).
adjacent(r167, r168).
shared_edge(r167, r168, 1).
adjacent(r167, r182).
shared_edge(r167, r182, 1).
adjacent(r167, r97).
shared_edge(r167, r97, 1).
adjacent(r168, r169).
shared_edge(r168, r169, 1).
adjacent(r168, r182).
shared_edge(r168, r182, 1).
adjacent(r168, r97).
shared_edge(r168, r97, 1).
adjacent(r169, r170).
shared_edge(r169, r170, 1).
adjacent(r169, r183).
shared_edge(r169, r183, 2).
adjacent(r169, r97).
shared_edge(r169, r97, 2).
adjacent(r17, r18).
shared_edge(r17, r18, 8).
adjacent(r17, r47).
shared_edge(r17, r47, 3).
adjacent(r17, r48).
shared_edge(r17, r48, 4).
adjacent(r17, r61).
shared_edge(r17, r61, 2).
adjacent(r17, r75).
shared_edge(r17, r75, 4).
adjacent(r170, r171).
shared_edge(r170, r171, 1).
adjacent(r170, r183).
shared_edge(r170, r183, 1).
adjacent(r170, r97).
shared_edge(r170, r97, 1).
adjacent(r171, r172).
shared_edge(r171, r172, 2).
adjacent(r171, r173).
shared_edge(r171, r173, 2).
adjacent(r171, r182).
shared_edge(r171, r182, 1).
adjacent(r171, r183).
shared_edge(r171, r183, 4).
adjacent(r171, r97).
shared_edge(r171, r97, 2).
adjacent(r172, r173).
shared_edge(r172, r173, 1).
adjacent(r172, r97).
shared_edge(r172, r97, 1).
adjacent(r173, r174).
shared_edge(r173, r174, 1).
adjacent(r173, r97).
shared_edge(r173, r97, 3).
adjacent(r174, r184).
shared_edge(r174, r184, 1).
adjacent(r175, r176).
shared_edge(r175, r176, 1).
adjacent(r177, r178).
shared_edge(r177, r178, 1).
adjacent(r177, r91).
shared_edge(r177, r91, 2).
adjacent(r178, r91).
shared_edge(r178, r91, 1).
adjacent(r179, r189).
shared_edge(r179, r189, 1).
adjacent(r179, r5).
shared_edge(r179, r5, 1).
adjacent(r18, r19).
shared_edge(r18, r19, 1).
adjacent(r18, r32).
shared_edge(r18, r32, 14).
adjacent(r18, r48).
shared_edge(r18, r48, 2).
adjacent(r18, r76).
shared_edge(r18, r76, 2).
adjacent(r180, r67).
shared_edge(r180, r67, 2).
adjacent(r181, r182).
shared_edge(r181, r182, 1).
adjacent(r181, r196).
shared_edge(r181, r196, 1).
adjacent(r181, r97).
shared_edge(r181, r97, 1).
adjacent(r182, r183).
shared_edge(r182, r183, 7).
adjacent(r182, r191).
shared_edge(r182, r191, 1).
adjacent(r182, r192).
shared_edge(r182, r192, 1).
adjacent(r182, r194).
shared_edge(r182, r194, 1).
adjacent(r182, r195).
shared_edge(r182, r195, 1).
adjacent(r182, r196).
shared_edge(r182, r196, 2).
adjacent(r182, r202).
shared_edge(r182, r202, 5).
adjacent(r182, r203).
shared_edge(r182, r203, 1).
adjacent(r182, r204).
shared_edge(r182, r204, 1).
adjacent(r182, r213).
shared_edge(r182, r213, 1).
adjacent(r182, r219).
shared_edge(r182, r219, 1).
adjacent(r182, r220).
shared_edge(r182, r220, 3).
adjacent(r182, r221).
shared_edge(r182, r221, 2).
adjacent(r182, r222).
shared_edge(r182, r222, 1).
adjacent(r182, r235).
shared_edge(r182, r235, 2).
adjacent(r182, r236).
shared_edge(r182, r236, 2).
adjacent(r182, r248).
shared_edge(r182, r248, 2).
adjacent(r182, r249).
shared_edge(r182, r249, 1).
adjacent(r182, r256).
shared_edge(r182, r256, 2).
adjacent(r182, r257).
shared_edge(r182, r257, 4).
adjacent(r182, r267).
shared_edge(r182, r267, 2).
adjacent(r182, r276).
shared_edge(r182, r276, 1).
adjacent(r182, r277).
shared_edge(r182, r277, 2).
adjacent(r182, r278).
shared_edge(r182, r278, 3).
adjacent(r182, r284).
shared_edge(r182, r284, 2).
adjacent(r182, r289).
shared_edge(r182, r289, 2).
adjacent(r182, r296).
shared_edge(r182, r296, 2).
adjacent(r182, r297).
shared_edge(r182, r297, 10).
adjacent(r182, r305).
shared_edge(r182, r305, 1).
adjacent(r182, r313).
shared_edge(r182, r313, 11).
adjacent(r182, r323).
shared_edge(r182, r323, 18).
adjacent(r182, r39).
shared_edge(r182, r39, 1).
adjacent(r182, r67).
shared_edge(r182, r67, 2).
adjacent(r185, r186).
shared_edge(r185, r186, 1).
adjacent(r185, r91).
shared_edge(r185, r91, 2).
adjacent(r186, r91).
shared_edge(r186, r91, 1).
adjacent(r187, r198).
shared_edge(r187, r198, 1).
adjacent(r188, r199).
shared_edge(r188, r199, 3).
adjacent(r188, r211).
shared_edge(r188, r211, 5).
adjacent(r188, r230).
shared_edge(r188, r230, 1).
adjacent(r188, r231).
shared_edge(r188, r231, 1).
adjacent(r189, r200).
shared_edge(r189, r200, 1).
adjacent(r189, r5).
shared_edge(r189, r5, 2).
adjacent(r19, r20).
shared_edge(r19, r20, 2).
adjacent(r190, r67).
shared_edge(r190, r67, 2).
adjacent(r191, r192).
shared_edge(r191, r192, 1).
adjacent(r191, r97).
shared_edge(r191, r97, 2).
adjacent(r192, r193).
shared_edge(r192, r193, 1).
adjacent(r192, r97).
shared_edge(r192, r97, 1).
adjacent(r193, r194).
shared_edge(r193, r194, 1).
adjacent(r193, r202).
shared_edge(r193, r202, 3).
adjacent(r193, r97).
shared_edge(r193, r97, 3).
adjacent(r194, r195).
shared_edge(r194, r195, 1).
adjacent(r194, r97).
shared_edge(r194, r97, 1).
adjacent(r195, r196).
shared_edge(r195, r196, 1).
adjacent(r195, r97).
shared_edge(r195, r97, 1).
adjacent(r197, r91).
shared_edge(r197, r91, 2).
adjacent(r199, r215).
shared_edge(r199, r215, 1).
adjacent(r199, r229).
shared_edge(r199, r229, 1).
adjacent(r2, r27).
shared_edge(r2, r27, 1).
adjacent(r2, r3).
shared_edge(r2, r3, 1).
adjacent(r20, r21).
shared_edge(r20, r21, 10).
adjacent(r20, r32).
shared_edge(r20, r32, 6).
adjacent(r20, r77).
shared_edge(r20, r77, 1).
adjacent(r20, r89).
shared_edge(r20, r89, 2).
adjacent(r20, r90).
shared_edge(r20, r90, 1).
adjacent(r200, r211).
shared_edge(r200, r211, 1).
adjacent(r200, r5).
shared_edge(r200, r5, 1).
adjacent(r201, r67).
shared_edge(r201, r67, 2).
adjacent(r203, r204).
shared_edge(r203, r204, 2).
adjacent(r204, r223).
shared_edge(r204, r223, 1).
adjacent(r204, r224).
shared_edge(r204, r224, 3).
adjacent(r204, r225).
shared_edge(r204, r225, 2).
adjacent(r205, r206).
shared_edge(r205, r206, 1).
adjacent(r205, r91).
shared_edge(r205, r91, 2).
adjacent(r206, r207).
shared_edge(r206, r207, 1).
adjacent(r206, r91).
shared_edge(r206, r91, 2).
adjacent(r207, r208).
shared_edge(r207, r208, 1).
adjacent(r207, r91).
shared_edge(r207, r91, 1).
adjacent(r208, r209).
shared_edge(r208, r209, 1).
adjacent(r208, r91).
shared_edge(r208, r91, 2).
adjacent(r209, r91).
shared_edge(r209, r91, 1).
adjacent(r21, r22).
shared_edge(r21, r22, 1).
adjacent(r21, r33).
shared_edge(r21, r33, 2).
adjacent(r21, r49).
shared_edge(r21, r49, 2).
adjacent(r21, r50).
shared_edge(r21, r50, 1).
adjacent(r21, r62).
shared_edge(r21, r62, 4).
adjacent(r211, r216).
shared_edge(r211, r216, 2).
adjacent(r211, r231).
shared_edge(r211, r231, 6).
adjacent(r211, r232).
shared_edge(r211, r232, 1).
adjacent(r211, r5).
shared_edge(r211, r5, 1).
adjacent(r212, r67).
shared_edge(r212, r67, 2).
adjacent(r213, r219).
shared_edge(r213, r219, 1).
adjacent(r213, r39).
shared_edge(r213, r39, 2).
adjacent(r214, r91).
shared_edge(r214, r91, 2).
adjacent(r216, r217).
shared_edge(r216, r217, 1).
adjacent(r216, r5).
shared_edge(r216, r5, 1).
adjacent(r217, r232).
shared_edge(r217, r232, 1).
adjacent(r217, r67).
shared_edge(r217, r67, 1).
adjacent(r218, r219).
shared_edge(r218, r219, 1).
adjacent(r218, r234).
shared_edge(r218, r234, 1).
adjacent(r218, r39).
shared_edge(r218, r39, 2).
adjacent(r219, r235).
shared_edge(r219, r235, 1).
adjacent(r22, r23).
shared_edge(r22, r23, 1).
adjacent(r22, r34).
shared_edge(r22, r34, 1).
adjacent(r220, r221).
shared_edge(r220, r221, 1).
adjacent(r220, r237).
shared_edge(r220, r237, 2).
adjacent(r221, r222).
shared_edge(r221, r222, 1).
adjacent(r221, r238).
shared_edge(r221, r238, 1).
adjacent(r221, r239).
shared_edge(r221, r239, 1).
adjacent(r222, r223).
shared_edge(r222, r223, 1).
adjacent(r222, r239).
shared_edge(r222, r239, 1).
adjacent(r223, r224).
shared_edge(r223, r224, 1).
adjacent(r223, r240).
shared_edge(r223, r240, 1).
adjacent(r224, r239).
shared_edge(r224, r239, 1).
adjacent(r224, r240).
shared_edge(r224, r240, 2).
adjacent(r224, r241).
shared_edge(r224, r241, 1).
adjacent(r224, r250).
shared_edge(r224, r250, 3).
adjacent(r224, r262).
shared_edge(r224, r262, 1).
adjacent(r225, r226).
shared_edge(r225, r226, 1).
adjacent(r225, r241).
shared_edge(r225, r241, 1).
adjacent(r226, r91).
shared_edge(r226, r91, 2).
adjacent(r227, r244).
shared_edge(r227, r244, 1).
adjacent(r227, r91).
shared_edge(r227, r91, 2).
adjacent(r229, r230).
shared_edge(r229, r230, 1).
adjacent(r229, r245).
shared_edge(r229, r245, 1).
adjacent(r23, r24).
shared_edge(r23, r24, 2).
adjacent(r230, r231).
shared_edge(r230, r231, 2).
adjacent(r231, r245).
shared_edge(r231, r245, 3).
adjacent(r231, r246).
shared_edge(r231, r246, 1).
adjacent(r231, r255).
shared_edge(r231, r255, 11).
adjacent(r231, r265).
shared_edge(r231, r265, 1).
adjacent(r232, r246).
shared_edge(r232, r246, 4).
adjacent(r232, r255).
shared_edge(r232, r255, 3).
adjacent(r232, r273).
shared_edge(r232, r273, 1).
adjacent(r232, r274).
shared_edge(r232, r274, 2).
adjacent(r232, r288).
shared_edge(r232, r288, 2).
adjacent(r232, r294).
shared_edge(r232, r294, 1).
adjacent(r232, r303).
shared_edge(r232, r303, 2).
adjacent(r232, r311).
shared_edge(r232, r311, 1).
adjacent(r232, r312).
shared_edge(r232, r312, 3).
adjacent(r232, r338).
shared_edge(r232, r338, 2).
adjacent(r232, r339).
shared_edge(r232, r339, 1).
adjacent(r232, r354).
shared_edge(r232, r354, 1).
adjacent(r232, r67).
shared_edge(r232, r67, 23).
adjacent(r233, r234).
shared_edge(r233, r234, 1).
adjacent(r233, r247).
shared_edge(r233, r247, 1).
adjacent(r233, r39).
shared_edge(r233, r39, 1).
adjacent(r234, r235).
shared_edge(r234, r235, 1).
adjacent(r234, r248).
shared_edge(r234, r248, 1).
adjacent(r236, r237).
shared_edge(r236, r237, 1).
adjacent(r236, r249).
shared_edge(r236, r249, 1).
adjacent(r237, r238).
shared_edge(r237, r238, 3).
adjacent(r238, r239).
shared_edge(r238, r239, 2).
adjacent(r238, r249).
shared_edge(r238, r249, 1).
adjacent(r238, r258).
shared_edge(r238, r258, 1).
adjacent(r238, r259).
shared_edge(r238, r259, 1).
adjacent(r238, r260).
shared_edge(r238, r260, 1).
adjacent(r239, r240).
shared_edge(r239, r240, 1).
adjacent(r239, r260).
shared_edge(r239, r260, 1).
adjacent(r239, r261).
shared_edge(r239, r261, 1).
adjacent(r24, r25).
shared_edge(r24, r25, 1).
adjacent(r24, r34).
shared_edge(r24, r34, 2).
adjacent(r24, r35).
shared_edge(r24, r35, 2).
adjacent(r24, r50).
shared_edge(r24, r50, 1).
adjacent(r24, r51).
shared_edge(r24, r51, 2).
adjacent(r24, r52).
shared_edge(r24, r52, 2).
adjacent(r24, r62).
shared_edge(r24, r62, 1).
adjacent(r24, r63).
shared_edge(r24, r63, 2).
adjacent(r24, r64).
shared_edge(r24, r64, 2).
adjacent(r24, r77).
shared_edge(r24, r77, 1).
adjacent(r24, r78).
shared_edge(r24, r78, 2).
adjacent(r24, r91).
shared_edge(r24, r91, 2).
adjacent(r24, r92).
shared_edge(r24, r92, 2).
adjacent(r24, r93).
shared_edge(r24, r93, 1).
adjacent(r241, r250).
shared_edge(r241, r250, 1).
adjacent(r241, r91).
shared_edge(r241, r91, 1).
adjacent(r242, r243).
shared_edge(r242, r243, 1).
adjacent(r242, r253).
shared_edge(r242, r253, 1).
adjacent(r242, r91).
shared_edge(r242, r91, 2).
adjacent(r243, r244).
shared_edge(r243, r244, 1).
adjacent(r243, r253).
shared_edge(r243, r253, 1).
adjacent(r243, r91).
shared_edge(r243, r91, 1).
adjacent(r244, r94).
shared_edge(r244, r94, 2).
adjacent(r246, r255).
shared_edge(r246, r255, 1).
adjacent(r247, r248).
shared_edge(r247, r248, 1).
adjacent(r247, r256).
shared_edge(r247, r256, 1).
adjacent(r247, r67).
shared_edge(r247, r67, 1).
adjacent(r249, r257).
shared_edge(r249, r257, 1).
adjacent(r25, r26).
shared_edge(r25, r26, 1).
adjacent(r25, r36).
shared_edge(r25, r36, 1).
adjacent(r250, r251).
shared_edge(r250, r251, 1).
adjacent(r250, r262).
shared_edge(r250, r262, 1).
adjacent(r250, r263).
shared_edge(r250, r263, 1).
adjacent(r250, r270).
shared_edge(r250, r270, 2).
adjacent(r250, r271).
shared_edge(r250, r271, 2).
adjacent(r250, r279).
shared_edge(r250, r279, 4).
adjacent(r250, r280).
shared_edge(r250, r280, 2).
adjacent(r250, r285).
shared_edge(r250, r285, 2).
adjacent(r250, r290).
shared_edge(r250, r290, 2).
adjacent(r250, r291).
shared_edge(r250, r291, 2).
adjacent(r250, r298).
shared_edge(r250, r298, 1).
adjacent(r251, r252).
shared_edge(r251, r252, 1).
adjacent(r251, r263).
shared_edge(r251, r263, 1).
adjacent(r251, r91).
shared_edge(r251, r91, 1).
adjacent(r252, r253).
shared_edge(r252, r253, 1).
adjacent(r252, r264).
shared_edge(r252, r264, 1).
adjacent(r252, r91).
shared_edge(r252, r91, 1).
adjacent(r253, r94).
shared_edge(r253, r94, 3).
adjacent(r254, r265).
shared_edge(r254, r265, 2).
adjacent(r254, r272).
shared_edge(r254, r272, 2).
adjacent(r254, r282).
shared_edge(r254, r282, 2).
adjacent(r255, r265).
shared_edge(r255, r265, 2).
adjacent(r255, r273).
shared_edge(r255, r273, 17).
adjacent(r255, r283).
shared_edge(r255, r283, 6).
adjacent(r255, r333).
shared_edge(r255, r333, 2).
adjacent(r255, r334).
shared_edge(r255, r334, 1).
adjacent(r255, r348).
shared_edge(r255, r348, 1).
adjacent(r256, r67).
shared_edge(r256, r67, 1).
adjacent(r257, r258).
shared_edge(r257, r258, 2).
adjacent(r257, r260).
shared_edge(r257, r260, 1).
adjacent(r258, r259).
shared_edge(r258, r259, 1).
adjacent(r259, r260).
shared_edge(r259, r260, 2).
adjacent(r26, r37).
shared_edge(r26, r37, 3).
adjacent(r26, r54).
shared_edge(r26, r54, 11).
adjacent(r260, r261).
shared_edge(r260, r261, 1).
adjacent(r260, r268).
shared_edge(r260, r268, 2).
adjacent(r260, r278).
shared_edge(r260, r278, 1).
adjacent(r260, r279).
shared_edge(r260, r279, 1).
adjacent(r261, r262).
shared_edge(r261, r262, 1).
adjacent(r261, r269).
shared_edge(r261, r269, 1).
adjacent(r262, r270).
shared_edge(r262, r270, 1).
adjacent(r263, r264).
shared_edge(r263, r264, 1).
adjacent(r263, r94).
shared_edge(r263, r94, 1).
adjacent(r264, r94).
shared_edge(r264, r94, 2).
adjacent(r265, r283).
shared_edge(r265, r283, 1).
adjacent(r266, r276).
shared_edge(r266, r276, 1).
adjacent(r266, r67).
shared_edge(r266, r67, 3).
adjacent(r267, r67).
shared_edge(r267, r67, 2).
adjacent(r268, r269).
shared_edge(r268, r269, 1).
adjacent(r268, r279).
shared_edge(r268, r279, 1).
adjacent(r269, r270).
shared_edge(r269, r270, 1).
adjacent(r269, r279).
shared_edge(r269, r279, 1).
adjacent(r27, r28).
shared_edge(r27, r28, 1).
adjacent(r271, r94).
shared_edge(r271, r94, 2).
adjacent(r272, r281).
shared_edge(r272, r281, 1).
adjacent(r273, r274).
shared_edge(r273, r274, 2).
adjacent(r273, r287).
shared_edge(r273, r287, 11).
adjacent(r273, r334).
shared_edge(r273, r334, 1).
adjacent(r273, r335).
shared_edge(r273, r335, 1).
adjacent(r273, r336).
shared_edge(r273, r336, 1).
adjacent(r275, r67).
shared_edge(r275, r67, 6).
adjacent(r276, r277).
shared_edge(r276, r277, 1).
adjacent(r276, r67).
shared_edge(r276, r67, 1).
adjacent(r277, r67).
shared_edge(r277, r67, 1).
adjacent(r278, r279).
shared_edge(r278, r279, 2).
adjacent(r279, r289).
shared_edge(r279, r289, 1).
adjacent(r28, r3).
shared_edge(r28, r3, 3).
adjacent(r280, r94).
shared_edge(r280, r94, 2).
adjacent(r281, r282).
shared_edge(r281, r282, 1).
adjacent(r281, r286).
shared_edge(r281, r286, 1).
adjacent(r282, r283).
shared_edge(r282, r283, 3).
adjacent(r283, r286).
shared_edge(r283, r286, 2).
adjacent(r283, r301).
shared_edge(r283, r301, 3).
adjacent(r283, r321).
shared_edge(r283, r321, 2).
adjacent(r283, r331).
shared_edge(r283, r331, 1).
adjacent(r283, r332).
shared_edge(r283, r332, 2).
adjacent(r283, r346).
shared_edge(r283, r346, 1).
adjacent(r284, r67).
shared_edge(r284, r67, 2).
adjacent(r285, r292).
shared_edge(r285, r292, 1).
adjacent(r285, r94).
shared_edge(r285, r94, 1).
adjacent(r287, r288).
shared_edge(r287, r288, 1).
adjacent(r287, r294).
shared_edge(r287, r294, 1).
adjacent(r287, r302).
shared_edge(r287, r302, 6).
adjacent(r287, r303).
shared_edge(r287, r303, 6).
adjacent(r287, r337).
shared_edge(r287, r337, 5).
adjacent(r287, r350).
shared_edge(r287, r350, 1).
adjacent(r287, r351).
shared_edge(r287, r351, 3).
adjacent(r287, r364).
shared_edge(r287, r364, 1).
adjacent(r287, r365).
shared_edge(r287, r365, 1).
adjacent(r288, r294).
shared_edge(r288, r294, 1).
adjacent(r289, r290).
shared_edge(r289, r290, 1).
adjacent(r29, r39).
shared_edge(r29, r39, 15).
adjacent(r29, r55).
shared_edge(r29, r55, 1).
adjacent(r29, r6).
shared_edge(r29, r6, 2).
adjacent(r29, r67).
shared_edge(r29, r67, 13).
adjacent(r29, r7).
shared_edge(r29, r7, 4).
adjacent(r290, r297).
shared_edge(r290, r297, 1).
adjacent(r291, r292).
shared_edge(r291, r292, 1).
adjacent(r291, r298).
shared_edge(r291, r298, 1).
adjacent(r291, r307).
shared_edge(r291, r307, 1).
adjacent(r291, r94).
shared_edge(r291, r94, 1).
adjacent(r292, r94).
shared_edge(r292, r94, 2).
adjacent(r293, r94).
shared_edge(r293, r94, 4).
adjacent(r294, r303).
shared_edge(r294, r303, 1).
adjacent(r295, r296).
shared_edge(r295, r296, 1).
adjacent(r295, r305).
shared_edge(r295, r305, 1).
adjacent(r295, r67).
shared_edge(r295, r67, 2).
adjacent(r296, r67).
shared_edge(r296, r67, 1).
adjacent(r297, r298).
shared_edge(r297, r298, 1).
adjacent(r297, r306).
shared_edge(r297, r306, 1).
adjacent(r297, r314).
shared_edge(r297, r314, 6).
adjacent(r297, r315).
shared_edge(r297, r315, 1).
adjacent(r297, r324).
shared_edge(r297, r324, 1).
adjacent(r297, r341).
shared_edge(r297, r341, 1).
adjacent(r298, r306).
shared_edge(r298, r306, 1).
adjacent(r299, r94).
shared_edge(r299, r94, 6).
adjacent(r3, r4).
shared_edge(r3, r4, 4).
adjacent(r30, r41).
shared_edge(r30, r41, 1).
adjacent(r30, r7).
shared_edge(r30, r7, 3).
adjacent(r300, r488).
shared_edge(r300, r488, 8).
adjacent(r300, r506).
shared_edge(r300, r506, 1).
adjacent(r300, r507).
shared_edge(r300, r507, 2).
adjacent(r300, r54).
shared_edge(r300, r54, 47).
adjacent(r301, r320).
shared_edge(r301, r320, 1).
adjacent(r303, r311).
shared_edge(r303, r311, 2).
adjacent(r303, r338).
shared_edge(r303, r338, 1).
adjacent(r303, r352).
shared_edge(r303, r352, 2).
adjacent(r303, r353).
shared_edge(r303, r353, 1).
adjacent(r303, r366).
shared_edge(r303, r366, 1).
adjacent(r304, r305).
shared_edge(r304, r305, 1).
adjacent(r304, r67).
shared_edge(r304, r67, 3).
adjacent(r305, r313).
shared_edge(r305, r313, 1).
adjacent(r306, r307).
shared_edge(r306, r307, 1).
adjacent(r306, r315).
shared_edge(r306, r315, 1).
adjacent(r307, r308).
shared_edge(r307, r308, 1).
adjacent(r307, r316).
shared_edge(r307, r316, 1).
adjacent(r308, r309).
shared_edge(r308, r309, 1).
adjacent(r308, r316).
shared_edge(r308, r316, 1).
adjacent(r308, r94).
shared_edge(r308, r94, 1).
adjacent(r309, r310).
shared_edge(r309, r310, 1).
adjacent(r309, r316).
shared_edge(r309, r316, 1).
adjacent(r309, r94).
shared_edge(r309, r94, 1).
adjacent(r31, r9).
shared_edge(r31, r9, 2).
adjacent(r310, r317).
shared_edge(r310, r317, 1).
adjacent(r310, r94).
shared_edge(r310, r94, 2).
adjacent(r311, r312).
shared_edge(r311, r312, 1).
adjacent(r313, r322).
shared_edge(r313, r322, 2).
adjacent(r313, r340).
shared_edge(r313, r340, 7).
adjacent(r313, r67).
shared_edge(r313, r67, 1).
adjacent(r314, r323).
shared_edge(r314, r323, 5).
adjacent(r314, r341).
shared_edge(r314, r341, 1).
adjacent(r315, r316).
shared_edge(r315, r316, 1).
adjacent(r315, r324).
shared_edge(r315, r324, 1).
adjacent(r316, r317).
shared_edge(r316, r317, 1).
adjacent(r316, r324).
shared_edge(r316, r324, 2).
adjacent(r316, r325).
shared_edge(r316, r325, 15).
adjacent(r316, r341).
shared_edge(r316, r341, 1).
adjacent(r316, r345).
shared_edge(r316, r345, 1).
adjacent(r316, r358).
shared_edge(r316, r358, 1).
adjacent(r316, r359).
shared_edge(r316, r359, 11).
adjacent(r316, r360).
shared_edge(r316, r360, 1).
adjacent(r316, r373).
shared_edge(r316, r373, 1).
adjacent(r316, r376).
shared_edge(r316, r376, 3).
adjacent(r316, r399).
shared_edge(r316, r399, 1).
adjacent(r316, r400).
shared_edge(r316, r400, 1).
adjacent(r316, r401).
shared_edge(r316, r401, 2).
adjacent(r316, r410).
shared_edge(r316, r410, 3).
adjacent(r317, r318).
shared_edge(r317, r318, 1).
adjacent(r317, r325).
shared_edge(r317, r325, 2).
adjacent(r317, r94).
shared_edge(r317, r94, 1).
adjacent(r318, r325).
shared_edge(r318, r325, 1).
adjacent(r318, r94).
shared_edge(r318, r94, 2).
adjacent(r319, r328).
shared_edge(r319, r328, 1).
adjacent(r319, r94).
shared_edge(r319, r94, 3).
adjacent(r32, r76).
shared_edge(r32, r76, 2).
adjacent(r320, r321).
shared_edge(r320, r321, 1).
adjacent(r320, r330).
shared_edge(r320, r330, 1).
adjacent(r321, r331).
shared_edge(r321, r331, 1).
adjacent(r322, r339).
shared_edge(r322, r339, 2).
adjacent(r322, r340).
shared_edge(r322, r340, 1).
adjacent(r322, r354).
shared_edge(r322, r354, 1).
adjacent(r322, r355).
shared_edge(r322, r355, 2).
adjacent(r322, r369).
shared_edge(r322, r369, 10).
adjacent(r322, r370).
shared_edge(r322, r370, 2).
adjacent(r322, r371).
shared_edge(r322, r371, 1).
adjacent(r322, r67).
shared_edge(r322, r67, 3).
adjacent(r323, r340).
shared_edge(r323, r340, 30).
adjacent(r323, r358).
shared_edge(r323, r358, 1).
adjacent(r325, r326).
shared_edge(r325, r326, 3).
adjacent(r325, r342).
shared_edge(r325, r342, 3).
adjacent(r325, r343).
shared_edge(r325, r343, 1).
adjacent(r325, r344).
shared_edge(r325, r344, 1).
adjacent(r326, r327).
shared_edge(r326, r327, 1).
adjacent(r326, r94).
shared_edge(r326, r94, 2).
adjacent(r327, r328).
shared_edge(r327, r328, 1).
adjacent(r327, r342).
shared_edge(r327, r342, 2).
adjacent(r327, r94).
shared_edge(r327, r94, 2).
adjacent(r328, r329).
shared_edge(r328, r329, 1).
adjacent(r328, r343).
shared_edge(r328, r343, 1).
adjacent(r328, r344).
shared_edge(r328, r344, 1).
adjacent(r328, r94).
shared_edge(r328, r94, 1).
adjacent(r329, r345).
shared_edge(r329, r345, 1).
adjacent(r329, r94).
shared_edge(r329, r94, 2).
adjacent(r33, r34).
shared_edge(r33, r34, 1).
adjacent(r33, r51).
shared_edge(r33, r51, 1).
adjacent(r330, r331).
shared_edge(r330, r331, 2).
adjacent(r330, r335).
shared_edge(r330, r335, 1).
adjacent(r330, r336).
shared_edge(r330, r336, 1).
adjacent(r330, r337).
shared_edge(r330, r337, 1).
adjacent(r330, r346).
shared_edge(r330, r346, 1).
adjacent(r330, r349).
shared_edge(r330, r349, 1).
adjacent(r330, r350).
shared_edge(r330, r350, 2).
adjacent(r330, r362).
shared_edge(r330, r362, 2).
adjacent(r330, r363).
shared_edge(r330, r363, 2).
adjacent(r330, r377).
shared_edge(r330, r377, 1).
adjacent(r330, r379).
shared_edge(r330, r379, 1).
adjacent(r330, r380).
shared_edge(r330, r380, 4).
adjacent(r330, r393).
shared_edge(r330, r393, 2).
adjacent(r330, r394).
shared_edge(r330, r394, 2).
adjacent(r330, r403).
shared_edge(r330, r403, 3).
adjacent(r330, r427).
shared_edge(r330, r427, 3).
adjacent(r330, r445).
shared_edge(r330, r445, 2).
adjacent(r330, r458).
shared_edge(r330, r458, 1).
adjacent(r330, r459).
shared_edge(r330, r459, 2).
adjacent(r330, r460).
shared_edge(r330, r460, 1).
adjacent(r330, r477).
shared_edge(r330, r477, 2).
adjacent(r330, r478).
shared_edge(r330, r478, 2).
adjacent(r330, r479).
shared_edge(r330, r479, 1).
adjacent(r330, r489).
shared_edge(r330, r489, 3).
adjacent(r332, r333).
shared_edge(r332, r333, 1).
adjacent(r332, r347).
shared_edge(r332, r347, 1).
adjacent(r333, r347).
shared_edge(r333, r347, 2).
adjacent(r333, r348).
shared_edge(r333, r348, 2).
adjacent(r333, r378).
shared_edge(r333, r378, 1).
adjacent(r334, r335).
shared_edge(r334, r335, 1).
adjacent(r334, r349).
shared_edge(r334, r349, 1).
adjacent(r335, r336).
shared_edge(r335, r336, 1).
adjacent(r336, r337).
shared_edge(r336, r337, 1).
adjacent(r337, r350).
shared_edge(r337, r350, 1).
adjacent(r338, r353).
shared_edge(r338, r353, 1).
adjacent(r339, r67).
shared_edge(r339, r67, 1).
adjacent(r340, r355).
shared_edge(r340, r355, 1).
adjacent(r340, r356).
shared_edge(r340, r356, 2).
adjacent(r340, r357).
shared_edge(r340, r357, 8).
adjacent(r340, r371).
shared_edge(r340, r371, 2).
adjacent(r340, r372).
shared_edge(r340, r372, 1).
adjacent(r340, r386).
shared_edge(r340, r386, 1).
adjacent(r340, r388).
shared_edge(r340, r388, 9).
adjacent(r340, r406).
shared_edge(r340, r406, 4).
adjacent(r340, r407).
shared_edge(r340, r407, 2).
adjacent(r340, r419).
shared_edge(r340, r419, 1).
adjacent(r340, r435).
shared_edge(r340, r435, 1).
adjacent(r340, r436).
shared_edge(r340, r436, 4).
adjacent(r340, r437).
shared_edge(r340, r437, 9).
adjacent(r340, r466).
shared_edge(r340, r466, 1).
adjacent(r341, r358).
shared_edge(r341, r358, 1).
adjacent(r342, r343).
shared_edge(r342, r343, 1).
adjacent(r343, r344).
shared_edge(r343, r344, 1).
adjacent(r344, r345).
shared_edge(r344, r345, 1).
adjacent(r345, r54).
shared_edge(r345, r54, 1).
adjacent(r346, r347).
shared_edge(r346, r347, 1).
adjacent(r346, r362).
shared_edge(r346, r362, 1).
adjacent(r347, r362).
shared_edge(r347, r362, 1).
adjacent(r347, r377).
shared_edge(r347, r377, 1).
adjacent(r348, r349).
shared_edge(r348, r349, 1).
adjacent(r348, r363).
shared_edge(r348, r363, 1).
adjacent(r348, r379).
shared_edge(r348, r379, 1).
adjacent(r349, r363).
shared_edge(r349, r363, 1).
adjacent(r35, r36).
shared_edge(r35, r36, 1).
adjacent(r35, r53).
shared_edge(r35, r53, 1).
adjacent(r350, r364).
shared_edge(r350, r364, 1).
adjacent(r350, r380).
shared_edge(r350, r380, 1).
adjacent(r351, r352).
shared_edge(r351, r352, 2).
adjacent(r351, r365).
shared_edge(r351, r365, 1).
adjacent(r351, r366).
shared_edge(r351, r366, 2).
adjacent(r351, r382).
shared_edge(r351, r382, 3).
adjacent(r351, r383).
shared_edge(r351, r383, 2).
adjacent(r351, r395).
shared_edge(r351, r395, 2).
adjacent(r351, r405).
shared_edge(r351, r405, 1).
adjacent(r353, r354).
shared_edge(r353, r354, 1).
adjacent(r353, r367).
shared_edge(r353, r367, 1).
adjacent(r354, r368).
shared_edge(r354, r368, 1).
adjacent(r355, r356).
shared_edge(r355, r356, 1).
adjacent(r356, r370).
shared_edge(r356, r370, 1).
adjacent(r357, r387).
shared_edge(r357, r387, 2).
adjacent(r357, r397).
shared_edge(r357, r397, 2).
adjacent(r358, r372).
shared_edge(r358, r372, 1).
adjacent(r359, r374).
shared_edge(r359, r374, 1).
adjacent(r359, r375).
shared_edge(r359, r375, 2).
adjacent(r359, r390).
shared_edge(r359, r390, 3).
adjacent(r359, r392).
shared_edge(r359, r392, 1).
adjacent(r359, r399).
shared_edge(r359, r399, 2).
adjacent(r36, r37).
shared_edge(r36, r37, 1).
adjacent(r36, r54).
shared_edge(r36, r54, 1).
adjacent(r360, r361).
shared_edge(r360, r361, 1).
adjacent(r360, r376).
shared_edge(r360, r376, 1).
adjacent(r360, r54).
shared_edge(r360, r54, 1).
adjacent(r361, r54).
shared_edge(r361, r54, 3).
adjacent(r364, r365).
shared_edge(r364, r365, 1).
adjacent(r364, r381).
shared_edge(r364, r381, 1).
adjacent(r365, r382).
shared_edge(r365, r382, 1).
adjacent(r366, r367).
shared_edge(r366, r367, 1).
adjacent(r367, r368).
shared_edge(r367, r368, 1).
adjacent(r367, r383).
shared_edge(r367, r383, 1).
adjacent(r368, r369).
shared_edge(r368, r369, 1).
adjacent(r368, r384).
shared_edge(r368, r384, 1).
adjacent(r369, r371).
shared_edge(r369, r371, 1).
adjacent(r369, r385).
shared_edge(r369, r385, 8).
adjacent(r369, r396).
shared_edge(r369, r396, 2).
adjacent(r369, r397).
shared_edge(r369, r397, 2).
adjacent(r369, r416).
shared_edge(r369, r416, 2).
adjacent(r369, r417).
shared_edge(r369, r417, 2).
adjacent(r369, r418).
shared_edge(r369, r418, 1).
adjacent(r369, r431).
shared_edge(r369, r431, 1).
adjacent(r369, r432).
shared_edge(r369, r432, 2).
adjacent(r370, r371).
shared_edge(r370, r371, 1).
adjacent(r371, r386).
shared_edge(r371, r386, 1).
adjacent(r372, r373).
shared_edge(r372, r373, 1).
adjacent(r372, r389).
shared_edge(r372, r389, 1).
adjacent(r373, r374).
shared_edge(r373, r374, 1).
adjacent(r373, r390).
shared_edge(r373, r390, 1).
adjacent(r374, r375).
shared_edge(r374, r375, 1).
adjacent(r374, r390).
shared_edge(r374, r390, 1).
adjacent(r375, r391).
shared_edge(r375, r391, 1).
adjacent(r376, r402).
shared_edge(r376, r402, 2).
adjacent(r376, r410).
shared_edge(r376, r410, 2).
adjacent(r376, r54).
shared_edge(r376, r54, 2).
adjacent(r377, r378).
shared_edge(r377, r378, 1).
adjacent(r377, r393).
shared_edge(r377, r393, 1).
adjacent(r378, r379).
shared_edge(r378, r379, 1).
adjacent(r378, r393).
shared_edge(r378, r393, 1).
adjacent(r378, r394).
shared_edge(r378, r394, 1).
adjacent(r378, r403).
shared_edge(r378, r403, 1).
adjacent(r379, r394).
shared_edge(r379, r394, 1).
adjacent(r380, r381).
shared_edge(r380, r381, 1).
adjacent(r380, r382).
shared_edge(r380, r382, 2).
adjacent(r380, r412).
shared_edge(r380, r412, 1).
adjacent(r380, r428).
shared_edge(r380, r428, 1).
adjacent(r381, r382).
shared_edge(r381, r382, 2).
adjacent(r382, r395).
shared_edge(r382, r395, 4).
adjacent(r382, r404).
shared_edge(r382, r404, 4).
adjacent(r382, r412).
shared_edge(r382, r412, 2).
adjacent(r382, r413).
shared_edge(r382, r413, 2).
adjacent(r382, r414).
shared_edge(r382, r414, 1).
adjacent(r382, r429).
shared_edge(r382, r429, 1).
adjacent(r383, r384).
shared_edge(r383, r384, 1).
adjacent(r383, r385).
shared_edge(r383, r385, 2).
adjacent(r384, r385).
shared_edge(r384, r385, 2).
adjacent(r385, r405).
shared_edge(r385, r405, 1).
adjacent(r385, r414).
shared_edge(r385, r414, 6).
adjacent(r385, r430).
shared_edge(r385, r430, 4).
adjacent(r385, r464).
shared_edge(r385, r464, 1).
adjacent(r386, r387).
shared_edge(r386, r387, 1).
adjacent(r386, r396).
shared_edge(r386, r396, 1).
adjacent(r387, r397).
shared_edge(r387, r397, 1).
adjacent(r388, r389).
shared_edge(r388, r389, 1).
adjacent(r388, r398).
shared_edge(r388, r398, 6).
adjacent(r389, r390).
shared_edge(r389, r390, 2).
adjacent(r39, r40).
shared_edge(r39, r40, 3).
adjacent(r39, r56).
shared_edge(r39, r56, 3).
adjacent(r39, r67).
shared_edge(r39, r67, 1).
adjacent(r39, r68).
shared_edge(r39, r68, 2).
adjacent(r39, r69).
shared_edge(r39, r69, 1).
adjacent(r39, r70).
shared_edge(r39, r70, 1).
adjacent(r39, r82).
shared_edge(r39, r82, 3).
adjacent(r39, r96).
shared_edge(r39, r96, 6).
adjacent(r39, r97).
shared_edge(r39, r97, 18).
adjacent(r390, r391).
shared_edge(r390, r391, 2).
adjacent(r390, r392).
shared_edge(r390, r392, 2).
adjacent(r390, r398).
shared_edge(r390, r398, 3).
adjacent(r390, r399).
shared_edge(r390, r399, 4).
adjacent(r390, r408).
shared_edge(r390, r408, 1).
adjacent(r390, r409).
shared_edge(r390, r409, 2).
adjacent(r390, r410).
shared_edge(r390, r410, 2).
adjacent(r390, r420).
shared_edge(r390, r420, 2).
adjacent(r390, r421).
shared_edge(r390, r421, 7).
adjacent(r390, r422).
shared_edge(r390, r422, 9).
adjacent(r390, r440).
shared_edge(r390, r440, 2).
adjacent(r390, r451).
shared_edge(r390, r451, 1).
adjacent(r390, r452).
shared_edge(r390, r452, 1).
adjacent(r390, r470).
shared_edge(r390, r470, 2).
adjacent(r390, r471).
shared_edge(r390, r471, 5).
adjacent(r391, r392).
shared_edge(r391, r392, 1).
adjacent(r395, r405).
shared_edge(r395, r405, 1).
adjacent(r395, r414).
shared_edge(r395, r414, 1).
adjacent(r396, r397).
shared_edge(r396, r397, 1).
adjacent(r397, r406).
shared_edge(r397, r406, 1).
adjacent(r397, r418).
shared_edge(r397, r418, 1).
adjacent(r398, r407).
shared_edge(r398, r407, 1).
adjacent(r398, r408).
shared_edge(r398, r408, 2).
adjacent(r399, r400).
shared_edge(r399, r400, 1).
adjacent(r4, r5).
shared_edge(r4, r5, 12).
adjacent(r4, r66).
shared_edge(r4, r66, 2).
adjacent(r4, r81).
shared_edge(r4, r81, 2).
adjacent(r40, r41).
shared_edge(r40, r41, 1).
adjacent(r40, r7).
shared_edge(r40, r7, 2).
adjacent(r400, r401).
shared_edge(r400, r401, 1).
adjacent(r400, r409).
shared_edge(r400, r409, 1).
adjacent(r401, r410).
shared_edge(r401, r410, 1).
adjacent(r402, r424).
shared_edge(r402, r424, 2).
adjacent(r402, r425).
shared_edge(r402, r425, 3).
adjacent(r402, r426).
shared_edge(r402, r426, 3).
adjacent(r402, r441).
shared_edge(r402, r441, 1).
adjacent(r402, r444).
shared_edge(r402, r444, 1).
adjacent(r402, r54).
shared_edge(r402, r54, 12).
adjacent(r405, r415).
shared_edge(r405, r415, 1).
adjacent(r406, r418).
shared_edge(r406, r418, 1).
adjacent(r406, r434).
shared_edge(r406, r434, 3).
adjacent(r406, r435).
shared_edge(r406, r435, 1).
adjacent(r407, r408).
shared_edge(r407, r408, 1).
adjacent(r408, r419).
shared_edge(r408, r419, 2).
adjacent(r409, r410).
shared_edge(r409, r410, 2).
adjacent(r409, r423).
shared_edge(r409, r423, 1).
adjacent(r41, r42).
shared_edge(r41, r42, 1).
adjacent(r41, r56).
shared_edge(r41, r56, 1).
adjacent(r410, r423).
shared_edge(r410, r423, 3).
adjacent(r410, r424).
shared_edge(r410, r424, 1).
adjacent(r410, r441).
shared_edge(r410, r441, 1).
adjacent(r410, r442).
shared_edge(r410, r442, 7).
adjacent(r410, r453).
shared_edge(r410, r453, 4).
adjacent(r410, r471).
shared_edge(r410, r471, 1).
adjacent(r410, r473).
shared_edge(r410, r473, 3).
adjacent(r410, r486).
shared_edge(r410, r486, 2).
adjacent(r410, r505).
shared_edge(r410, r505, 2).
adjacent(r411, r54).
shared_edge(r411, r54, 4).
adjacent(r412, r428).
shared_edge(r412, r428, 1).
adjacent(r413, r414).
shared_edge(r413, r414, 2).
adjacent(r414, r415).
shared_edge(r414, r415, 3).
adjacent(r414, r428).
shared_edge(r414, r428, 1).
adjacent(r414, r429).
shared_edge(r414, r429, 2).
adjacent(r414, r446).
shared_edge(r414, r446, 2).
adjacent(r414, r447).
shared_edge(r414, r447, 6).
adjacent(r414, r461).
shared_edge(r414, r461, 1).
adjacent(r414, r462).
shared_edge(r414, r462, 4).
adjacent(r414, r464).
shared_edge(r414, r464, 2).
adjacent(r414, r465).
shared_edge(r414, r465, 1).
adjacent(r414, r481).
shared_edge(r414, r481, 3).
adjacent(r414, r482).
shared_edge(r414, r482, 4).
adjacent(r414, r492).
shared_edge(r414, r492, 1).
adjacent(r414, r493).
shared_edge(r414, r493, 3).
adjacent(r416, r417).
shared_edge(r416, r417, 1).
adjacent(r416, r431).
shared_edge(r416, r431, 1).
adjacent(r417, r432).
shared_edge(r417, r432, 1).
adjacent(r418, r433).
shared_edge(r418, r433, 1).
adjacent(r419, r420).
shared_edge(r419, r420, 1).
adjacent(r419, r438).
shared_edge(r419, r438, 1).
adjacent(r419, r439).
shared_edge(r419, r439, 1).
adjacent(r42, r43).
shared_edge(r42, r43, 3).
adjacent(r42, r56).
shared_edge(r42, r56, 2).
adjacent(r42, r68).
shared_edge(r42, r68, 1).
adjacent(r42, r7).
shared_edge(r42, r7, 3).
adjacent(r420, r439).
shared_edge(r420, r439, 1).
adjacent(r421, r422).
shared_edge(r421, r422, 3).
adjacent(r421, r450).
shared_edge(r421, r450, 1).
adjacent(r421, r452).
shared_edge(r421, r452, 3).
adjacent(r424, r441).
shared_edge(r424, r441, 1).
adjacent(r425, r426).
shared_edge(r425, r426, 1).
adjacent(r425, r442).
shared_edge(r425, r442, 2).
adjacent(r426, r443).
shared_edge(r426, r443, 1).
adjacent(r426, r444).
shared_edge(r426, r444, 1).
adjacent(r427, r428).
shared_edge(r427, r428, 2).
adjacent(r427, r461).
shared_edge(r427, r461, 1).
adjacent(r428, r429).
shared_edge(r428, r429, 1).
adjacent(r428, r446).
shared_edge(r428, r446, 2).
adjacent(r43, r69).
shared_edge(r43, r69, 1).
adjacent(r43, r7).
shared_edge(r43, r7, 3).
adjacent(r43, r70).
shared_edge(r43, r70, 1).
adjacent(r430, r431).
shared_edge(r430, r431, 3).
adjacent(r430, r432).
shared_edge(r430, r432, 3).
adjacent(r430, r464).
shared_edge(r430, r464, 2).
adjacent(r430, r497).
shared_edge(r430, r497, 1).
adjacent(r430, r498).
shared_edge(r430, r498, 1).
adjacent(r431, r432).
shared_edge(r431, r432, 3).
adjacent(r432, r433).
shared_edge(r432, r433, 5).
adjacent(r432, r498).
shared_edge(r432, r498, 1).
adjacent(r433, r434).
shared_edge(r433, r434, 5).
adjacent(r434, r436).
shared_edge(r434, r436, 8).
adjacent(r435, r436).
shared_edge(r435, r436, 2).
adjacent(r436, r466).
shared_edge(r436, r466, 4).
adjacent(r437, r438).
shared_edge(r437, r438, 2).
adjacent(r437, r448).
shared_edge(r437, r448, 4).
adjacent(r437, r449).
shared_edge(r437, r449, 3).
adjacent(r437, r450).
shared_edge(r437, r450, 3).
adjacent(r437, r466).
shared_edge(r437, r466, 6).
adjacent(r437, r467).
shared_edge(r437, r467, 3).
adjacent(r437, r468).
shared_edge(r437, r468, 2).
adjacent(r437, r483).
shared_edge(r437, r483, 2).
adjacent(r437, r500).
shared_edge(r437, r500, 2).
adjacent(r438, r439).
shared_edge(r438, r439, 1).
adjacent(r439, r440).
shared_edge(r439, r440, 1).
adjacent(r439, r450).
shared_edge(r439, r450, 2).
adjacent(r44, r45).
shared_edge(r44, r45, 1).
adjacent(r44, r9).
shared_edge(r44, r9, 2).
adjacent(r440, r451).
shared_edge(r440, r451, 1).
adjacent(r441, r442).
shared_edge(r441, r442, 3).
adjacent(r442, r443).
shared_edge(r442, r443, 1).
adjacent(r442, r454).
shared_edge(r442, r454, 3).
adjacent(r443, r444).
shared_edge(r443, r444, 1).
adjacent(r443, r454).
shared_edge(r443, r454, 1).
adjacent(r444, r455).
shared_edge(r444, r455, 2).
adjacent(r444, r54).
shared_edge(r444, r54, 1).
adjacent(r445, r458).
shared_edge(r445, r458, 1).
adjacent(r447, r463).
shared_edge(r447, r463, 2).
adjacent(r449, r468).
shared_edge(r449, r468, 1).
adjacent(r45, r57).
shared_edge(r45, r57, 1).
adjacent(r450, r451).
shared_edge(r450, r451, 4).
adjacent(r450, r452).
shared_edge(r450, r452, 3).
adjacent(r450, r469).
shared_edge(r450, r469, 3).
adjacent(r450, r470).
shared_edge(r450, r470, 2).
adjacent(r450, r484).
shared_edge(r450, r484, 3).
adjacent(r450, r501).
shared_edge(r450, r501, 6).
adjacent(r450, r502).
shared_edge(r450, r502, 1).
adjacent(r452, r469).
shared_edge(r452, r469, 1).
adjacent(r453, r472).
shared_edge(r453, r472, 2).
adjacent(r454, r455).
shared_edge(r454, r455, 3).
adjacent(r454, r456).
shared_edge(r454, r456, 1).
adjacent(r454, r474).
shared_edge(r454, r474, 2).
adjacent(r454, r486).
shared_edge(r454, r486, 5).
adjacent(r454, r487).
shared_edge(r454, r487, 1).
adjacent(r454, r506).
shared_edge(r454, r506, 1).
adjacent(r455, r456).
shared_edge(r455, r456, 1).
adjacent(r456, r457).
shared_edge(r456, r457, 1).
adjacent(r456, r54).
shared_edge(r456, r54, 1).
adjacent(r457, r474).
shared_edge(r457, r474, 1).
adjacent(r457, r54).
shared_edge(r457, r54, 2).
adjacent(r458, r476).
shared_edge(r458, r476, 1).
adjacent(r459, r460).
shared_edge(r459, r460, 1).
adjacent(r459, r480).
shared_edge(r459, r480, 1).
adjacent(r46, r59).
shared_edge(r46, r59, 1).
adjacent(r460, r461).
shared_edge(r460, r461, 1).
adjacent(r460, r481).
shared_edge(r460, r481, 1).
adjacent(r461, r481).
shared_edge(r461, r481, 1).
adjacent(r463, r464).
shared_edge(r463, r464, 2).
adjacent(r464, r465).
shared_edge(r464, r465, 3).
adjacent(r464, r494).
shared_edge(r464, r494, 1).
adjacent(r464, r495).
shared_edge(r464, r495, 1).
adjacent(r464, r496).
shared_edge(r464, r496, 2).
adjacent(r466, r499).
shared_edge(r466, r499, 3).
adjacent(r466, r500).
shared_edge(r466, r500, 1).
adjacent(r467, r468).
shared_edge(r467, r468, 1).
adjacent(r470, r471).
shared_edge(r470, r471, 1).
adjacent(r470, r502).
shared_edge(r470, r502, 1).
adjacent(r471, r472).
shared_edge(r471, r472, 2).
adjacent(r471, r485).
shared_edge(r471, r485, 3).
adjacent(r471, r503).
shared_edge(r471, r503, 2).
adjacent(r472, r473).
shared_edge(r472, r473, 3).
adjacent(r472, r485).
shared_edge(r472, r485, 2).
adjacent(r472, r504).
shared_edge(r472, r504, 1).
adjacent(r473, r505).
shared_edge(r473, r505, 1).
adjacent(r474, r475).
shared_edge(r474, r475, 1).
adjacent(r475, r487).
shared_edge(r475, r487, 1).
adjacent(r475, r54).
shared_edge(r475, r54, 2).
adjacent(r476, r477).
shared_edge(r476, r477, 2).
adjacent(r476, r489).
shared_edge(r476, r489, 1).
adjacent(r478, r479).
shared_edge(r478, r479, 1).
adjacent(r478, r490).
shared_edge(r478, r490, 1).
adjacent(r479, r480).
shared_edge(r479, r480, 1).
adjacent(r479, r491).
shared_edge(r479, r491, 1).
adjacent(r480, r481).
shared_edge(r480, r481, 1).
adjacent(r480, r492).
shared_edge(r480, r492, 1).
adjacent(r483, r484).
shared_edge(r483, r484, 2).
adjacent(r484, r500).
shared_edge(r484, r500, 1).
adjacent(r485, r504).
shared_edge(r485, r504, 1).
adjacent(r487, r506).
shared_edge(r487, r506, 1).
adjacent(r487, r54).
shared_edge(r487, r54, 1).
adjacent(r488, r507).
shared_edge(r488, r507, 2).
adjacent(r489, r490).
shared_edge(r489, r490, 1).
adjacent(r49, r50).
shared_edge(r49, r50, 1).
adjacent(r49, r63).
shared_edge(r49, r63, 1).
adjacent(r490, r491).
shared_edge(r490, r491, 1).
adjacent(r491, r492).
shared_edge(r491, r492, 1).
adjacent(r493, r494).
shared_edge(r493, r494, 1).
adjacent(r494, r495).
shared_edge(r494, r495, 1).
adjacent(r495, r496).
shared_edge(r495, r496, 1).
adjacent(r496, r497).
shared_edge(r496, r497, 1).
adjacent(r497, r498).
shared_edge(r497, r498, 1).
adjacent(r5, r55).
shared_edge(r5, r55, 3).
adjacent(r5, r6).
shared_edge(r5, r6, 3).
adjacent(r5, r67).
shared_edge(r5, r67, 14).
adjacent(r50, r51).
shared_edge(r50, r51, 1).
adjacent(r502, r503).
shared_edge(r502, r503, 1).
adjacent(r503, r504).
shared_edge(r503, r504, 1).
adjacent(r52, r53).
shared_edge(r52, r53, 1).
adjacent(r52, r65).
shared_edge(r52, r65, 1).
adjacent(r53, r54).
shared_edge(r53, r54, 2).
adjacent(r54, r65).
shared_edge(r54, r65, 1).
adjacent(r54, r80).
shared_edge(r54, r80, 2).
adjacent(r54, r94).
shared_edge(r54, r94, 67).
adjacent(r55, r6).
shared_edge(r55, r6, 1).
adjacent(r55, r67).
shared_edge(r55, r67, 1).
adjacent(r57, r9).
shared_edge(r57, r9, 1).
adjacent(r58, r59).
shared_edge(r58, r59, 2).
adjacent(r59, r60).
shared_edge(r59, r60, 2).
adjacent(r59, r73).
shared_edge(r59, r73, 2).
adjacent(r59, r74).
shared_edge(r59, r74, 3).
adjacent(r59, r86).
shared_edge(r59, r86, 1).
adjacent(r59, r87).
shared_edge(r59, r87, 2).
adjacent(r59, r97).
shared_edge(r59, r97, 4).
adjacent(r59, r99).
shared_edge(r59, r99, 1).
adjacent(r6, r7).
shared_edge(r6, r7, 1).
adjacent(r61, r75).
shared_edge(r61, r75, 1).
adjacent(r61, r88).
shared_edge(r61, r88, 2).
adjacent(r62, r63).
shared_edge(r62, r63, 1).
adjacent(r62, r77).
shared_edge(r62, r77, 2).
adjacent(r64, r65).
shared_edge(r64, r65, 1).
adjacent(r64, r79).
shared_edge(r64, r79, 1).
adjacent(r65, r80).
shared_edge(r65, r80, 1).
adjacent(r68, r69).
shared_edge(r68, r69, 1).
adjacent(r69, r70).
shared_edge(r69, r70, 1).
adjacent(r7, r71).
shared_edge(r7, r71, 2).
adjacent(r7, r8).
shared_edge(r7, r8, 4).
adjacent(r7, r82).
shared_edge(r7, r82, 3).
adjacent(r7, r83).
shared_edge(r7, r83, 1).
adjacent(r7, r9).
shared_edge(r7, r9, 7).
adjacent(r7, r97).
shared_edge(r7, r97, 1).
adjacent(r70, r71).
shared_edge(r70, r71, 1).
adjacent(r71, r82).
shared_edge(r71, r82, 1).
adjacent(r72, r84).
shared_edge(r72, r84, 1).
adjacent(r72, r9).
shared_edge(r72, r9, 2).
adjacent(r77, r90).
shared_edge(r77, r90, 2).
adjacent(r78, r79).
shared_edge(r78, r79, 1).
adjacent(r78, r94).
shared_edge(r78, r94, 1).
adjacent(r79, r80).
shared_edge(r79, r80, 1).
adjacent(r79, r94).
shared_edge(r79, r94, 1).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r82, r97).
shared_edge(r82, r97, 1).
adjacent(r83, r9).
shared_edge(r83, r9, 2).
adjacent(r83, r97).
shared_edge(r83, r97, 1).
adjacent(r84, r85).
shared_edge(r84, r85, 1).
adjacent(r84, r9).
shared_edge(r84, r9, 2).
adjacent(r85, r86).
shared_edge(r85, r86, 1).
adjacent(r85, r98).
shared_edge(r85, r98, 1).
adjacent(r86, r99).
shared_edge(r86, r99, 1).
adjacent(r89, r90).
shared_edge(r89, r90, 1).
adjacent(r9, r97).
shared_edge(r9, r97, 3).
adjacent(r9, r98).
shared_edge(r9, r98, 1).
adjacent(r90, r91).
shared_edge(r90, r91, 4).
adjacent(r92, r93).
shared_edge(r92, r93, 1).
adjacent(r93, r94).
shared_edge(r93, r94, 1).
adjacent(r97, r98).
shared_edge(r97, r98, 1).
adjacent(r97, r99).
shared_edge(r97, r99, 1).
adjacent(r98, r99).
shared_edge(r98, r99, 1).
