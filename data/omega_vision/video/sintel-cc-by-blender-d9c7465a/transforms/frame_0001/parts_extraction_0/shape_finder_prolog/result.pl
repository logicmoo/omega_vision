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

region(r1, '#5d6568', 26, centroid(3,1)).
polygon(r1, [xy(0,0),xy(0,3),xy(2,3),xy(3,2),xy(6,2),xy(7,1),xy(6,0),xy(1,0),xy(0,0)]).
midline(r1, [xy(1,1),xy(1,2),xy(2,1),xy(2,2),xy(3,1),xy(6,1)]).
fillpoint(r1, xy(6,1), 2).
fillpoint(r1, xy(5,1), 2).
fillpoint(r1, xy(4,1), 2).
fillpoint(r1, xy(3,1), 2).
fillpoint(r1, xy(2,2), 2).
region(r2, '#727c7f', 91, centroid(6,5)).
polygon(r2, [xy(0,4),xy(0,13),xy(3,10),xy(4,10),xy(7,7),xy(7,8),xy(8,6),xy(8,5),xy(10,3),xy(8,1),xy(6,3),xy(3,3),xy(2,4),xy(1,4),xy(0,4)]).
midline(r2, [xy(1,11),xy(3,7),xy(3,6),xy(4,6),xy(4,7),xy(8,3)]).
midline(r2, [xy(13,1),xy(14,1)]).
fillpoint(r2, xy(5,6), 4).
fillpoint(r2, xy(4,7), 4).
fillpoint(r2, xy(4,6), 4).
fillpoint(r2, xy(3,7), 4).
fillpoint(r2, xy(3,6), 4).
region(r3, '#5d6568', 6, centroid(11,1)).
polygon(r3, [xy(10,0),xy(10,2),xy(11,1),xy(11,2),xy(10,0)]).
fillpoint(r3, xy(11,2), 1).
fillpoint(r3, xy(11,1), 1).
fillpoint(r3, xy(11,0), 1).
fillpoint(r3, xy(10,2), 1).
fillpoint(r3, xy(10,1), 1).
region(r4, '#7a8487', 85, centroid(9,8)).
polygon(r4, [xy(0,14),xy(3,11),xy(4,11),xy(6,9),xy(7,9),xy(8,8),xy(8,7),xy(9,6),xy(9,5),xy(10,4),xy(12,4),xy(13,3),xy(14,3),xy(15,2),xy(16,2),xy(16,3),xy(15,4),xy(15,5),xy(11,9),xy(9,9),xy(4,14),xy(4,15),xy(3,16),xy(2,16),xy(1,15),xy(0,14)]).
midline(r4, [xy(2,14),xy(5,11),xy(5,12),xy(6,11),xy(6,10),xy(7,10),xy(11,6),xy(11,7),xy(15,3)]).
fillpoint(r4, xy(13,5), 3).
fillpoint(r4, xy(12,6), 3).
fillpoint(r4, xy(11,7), 3).
fillpoint(r4, xy(11,6), 3).
fillpoint(r4, xy(10,7), 3).
region(r5, '#7e888c', 21, centroid(17,4)).
polygon(r5, [xy(14,7),xy(14,8),xy(15,7),xy(15,8),xy(16,7),xy(16,4),xy(17,3),xy(17,6),xy(18,6),xy(14,7)]).
fillpoint(r5, xy(21,0), 1).
fillpoint(r5, xy(20,2), 1).
fillpoint(r5, xy(20,1), 1).
fillpoint(r5, xy(20,0), 1).
fillpoint(r5, xy(19,3), 1).
region(r6, '#818a8f', 79, centroid(13,13)).
polygon(r6, [xy(7,17),xy(7,19),xy(8,20),xy(8,21),xy(9,22),xy(9,23),xy(10,23),xy(11,24),xy(12,23),xy(12,22),xy(11,21),xy(11,20),xy(9,18),xy(9,17),xy(8,16),xy(8,13),xy(9,12),xy(10,12),xy(11,11),xy(11,15),xy(10,16),xy(7,17)]).
midline(r6, [xy(8,17),xy(8,19),xy(9,19),xy(9,21),xy(10,20),xy(10,22),xy(11,22),xy(11,23)]).
midline(r6, [xy(9,13),xy(9,16),xy(10,15),xy(10,13)]).
midline(r6, [xy(15,10),xy(17,8)]).
fillpoint(r6, xy(17,8), 2).
fillpoint(r6, xy(16,9), 2).
fillpoint(r6, xy(15,10), 2).
fillpoint(r6, xy(11,23), 2).
fillpoint(r6, xy(11,22), 2).
region(r7, '#869094', 6, centroid(24,2)).
polygon(r7, [xy(23,0),xy(23,1),xy(24,1),xy(24,4),xy(23,0)]).
fillpoint(r7, xy(24,4), 1).
fillpoint(r7, xy(24,3), 1).
fillpoint(r7, xy(24,2), 1).
fillpoint(r7, xy(24,1), 1).
fillpoint(r7, xy(23,1), 1).
region(r11, '#8d969b', 106, centroid(35,12)).
polygon(r11, [xy(27,0),xy(27,1),xy(28,0),xy(29,1),xy(28,2),xy(28,4),xy(27,5),xy(28,5),xy(28,6),xy(30,6),xy(30,7),xy(29,8),xy(29,9),xy(30,10),xy(31,9),xy(31,7),xy(27,0)]).
midline(r11, [xy(28,1),xy(30,1)]).
midline(r11, [xy(30,8),xy(30,9),xy(32,11),xy(32,12),xy(31,13),xy(32,13),xy(32,17),xy(33,16),xy(33,15),xy(34,16),xy(34,17),xy(35,16),xy(36,17),xy(38,17)]).
midline(r11, [xy(33,11)]).
midline(r11, [xy(42,15),xy(43,16),xy(45,14)]).
fillpoint(r11, xy(45,14), 2).
fillpoint(r11, xy(44,15), 2).
fillpoint(r11, xy(43,16), 2).
fillpoint(r11, xy(42,15), 2).
fillpoint(r11, xy(38,17), 2).
region(r25, '#8b9499', 6, centroid(52,0)).
polygon(r25, [xy(50,0),xy(50,1),xy(51,0),xy(54,0),xy(50,0)]).
fillpoint(r25, xy(54,0), 1).
fillpoint(r25, xy(53,0), 1).
fillpoint(r25, xy(52,0), 1).
fillpoint(r25, xy(51,0), 1).
fillpoint(r25, xy(50,1), 1).
region(r33, '#848d92', 5, centroid(67,0)).
polygon(r33, [xy(65,0),xy(67,0),xy(67,1),xy(68,0),xy(65,0)]).
fillpoint(r33, xy(68,0), 1).
fillpoint(r33, xy(67,1), 1).
fillpoint(r33, xy(67,0), 1).
fillpoint(r33, xy(66,0), 1).
fillpoint(r33, xy(65,0), 1).
region(r34, '#818a8f', 9, centroid(71,1)).
polygon(r34, [xy(69,0),xy(70,0),xy(70,2),xy(71,1),xy(71,2),xy(72,1),xy(72,0),xy(73,1),xy(69,0)]).
fillpoint(r34, xy(73,1), 1).
fillpoint(r34, xy(72,1), 1).
fillpoint(r34, xy(72,0), 1).
fillpoint(r34, xy(71,2), 1).
fillpoint(r34, xy(71,1), 1).
region(r36, '#7e888c', 53, centroid(76,4)).
polygon(r36, [xy(71,3),xy(72,2),xy(73,2),xy(73,3),xy(72,4),xy(72,5),xy(73,5),xy(73,6),xy(74,6),xy(75,5),xy(74,4),xy(75,3),xy(76,3),xy(78,1),xy(77,0),xy(73,0),xy(74,1),xy(71,3)]).
hole(r36, [xy(75,4),xy(76,4),xy(76,5),xy(78,5),xy(75,4)]).
midline(r36, [xy(72,3),xy(74,2),xy(74,3),xy(75,2),xy(75,1),xy(76,1),xy(76,2),xy(77,1),xy(78,2)]).
midline(r36, [xy(74,5)]).
midline(r36, [xy(78,7)]).
fillpoint(r36, xy(78,7), 2).
fillpoint(r36, xy(78,2), 2).
fillpoint(r36, xy(77,1), 2).
fillpoint(r36, xy(76,2), 2).
fillpoint(r36, xy(76,1), 2).
region(r39, '#727c7f', 5, centroid(82,0)).
polygon(r39, [xy(81,0),xy(81,1),xy(82,0),xy(83,0),xy(83,1),xy(81,0)]).
fillpoint(r39, xy(83,1), 1).
fillpoint(r39, xy(83,0), 1).
fillpoint(r39, xy(82,0), 1).
fillpoint(r39, xy(81,1), 1).
fillpoint(r39, xy(81,0), 1).
region(r41, '#727c7f', 73, centroid(91,5)).
polygon(r41, [xy(84,2),xy(85,2),xy(85,3),xy(86,4),xy(86,5),xy(89,2),xy(93,2),xy(94,1),xy(93,0),xy(85,0),xy(86,1),xy(84,2)]).
midline(r41, [xy(87,2),xy(89,1),xy(93,1)]).
midline(r41, [xy(87,5)]).
midline(r41, [xy(93,8),xy(93,11),xy(94,10),xy(94,8)]).
midline(r41, [xy(94,11),xy(94,12)]).
fillpoint(r41, xy(87,2), 3).
fillpoint(r41, xy(94,12), 2).
fillpoint(r41, xy(94,11), 2).
fillpoint(r41, xy(94,10), 2).
fillpoint(r41, xy(94,9), 2).
region(r42, '#5d6568', 27, centroid(93,4)).
polygon(r42, [xy(89,3),xy(90,3),xy(90,5),xy(91,5),xy(92,6),xy(94,6),xy(95,5),xy(95,4),xy(94,3),xy(91,3),xy(89,3)]).
midline(r42, [xy(91,4),xy(92,4),xy(92,5),xy(93,4),xy(93,5),xy(94,4),xy(94,5)]).
fillpoint(r42, xy(94,5), 2).
fillpoint(r42, xy(94,4), 2).
fillpoint(r42, xy(93,5), 2).
fillpoint(r42, xy(93,4), 2).
fillpoint(r42, xy(92,5), 2).
region(r43, '#919a9e', 301, centroid(46,9)).
polygon(r43, [xy(29,3),xy(29,5),xy(30,5),xy(32,7),xy(32,9),xy(34,9),xy(35,10),xy(37,8),xy(38,9),xy(39,9),xy(39,10),xy(40,8),xy(41,9),xy(41,10),xy(42,11),xy(44,11),xy(45,12),xy(46,12),xy(47,13),xy(47,14),xy(45,16),xy(46,16),xy(47,17),xy(48,17),xy(49,18),xy(50,17),xy(51,18),xy(52,17),xy(53,18),xy(54,17),xy(54,18),xy(55,18),xy(55,16),xy(56,15),xy(56,14),xy(59,11),xy(59,10),xy(57,8),xy(57,6),xy(56,5),xy(55,5),xy(54,4),xy(48,4),xy(47,3),xy(46,4),xy(43,4),xy(42,3),xy(40,3),xy(38,1),xy(33,1),xy(32,2),xy(31,2),xy(30,3),xy(29,3)]).
midline(r43, [xy(31,4)]).
midline(r43, [xy(34,5),xy(35,5),xy(35,6),xy(36,5),xy(38,5)]).
midline(r43, [xy(41,6),xy(41,7),xy(42,7),xy(42,8)]).
midline(r43, [xy(42,4)]).
midline(r43, [xy(45,8),xy(47,8),xy(48,9),xy(50,10),xy(51,10),xy(51,11),xy(52,10),xy(52,11),xy(53,10),xy(53,11)]).
midline(r43, [xy(49,15),xy(51,14),xy(53,15)]).
fillpoint(r43, xy(53,11), 7).
fillpoint(r43, xy(53,10), 7).
fillpoint(r43, xy(52,11), 7).
fillpoint(r43, xy(52,10), 7).
fillpoint(r43, xy(51,11), 7).
region(r44, '#8d969b', 18, centroid(43,2)).
polygon(r44, [xy(39,1),xy(40,1),xy(40,2),xy(41,1),xy(41,2),xy(42,1),xy(42,2),xy(43,1),xy(45,1),xy(46,2),xy(45,3),xy(43,3),xy(39,1)]).
midline(r44, [xy(43,2),xy(45,2)]).
fillpoint(r44, xy(45,2), 2).
fillpoint(r44, xy(44,2), 2).
fillpoint(r44, xy(43,2), 2).
fillpoint(r44, xy(46,3), 1).
fillpoint(r44, xy(46,2), 1).
region(r66, '#848d92', 76, centroid(16,15)).
polygon(r66, [xy(10,17),xy(10,18),xy(11,17),xy(11,16),xy(12,15),xy(12,12),xy(15,12),xy(17,10),xy(18,10),xy(19,9),xy(19,8),xy(20,7),xy(20,10),xy(17,13),xy(16,13),xy(15,14),xy(14,14),xy(12,16),xy(13,16),xy(11,18),xy(12,18),xy(12,21),xy(13,20),xy(13,23),xy(12,24),xy(12,27),xy(13,25),xy(14,25),xy(15,24),xy(15,23),xy(14,22),xy(10,17)]).
midline(r66, [xy(13,13),xy(13,14),xy(14,13),xy(15,13),xy(17,11),xy(17,12),xy(19,10)]).
midline(r66, [xy(13,24),xy(14,23),xy(14,24),xy(15,25)]).
midline(r66, [xy(21,5),xy(22,4)]).
fillpoint(r66, xy(22,4), 2).
fillpoint(r66, xy(21,5), 2).
fillpoint(r66, xy(19,10), 2).
fillpoint(r66, xy(18,11), 2).
fillpoint(r66, xy(17,12), 2).
region(r67, '#889196', 10, centroid(25,5)).
polygon(r67, [xy(24,5),xy(24,8),xy(25,7),xy(25,2),xy(24,5)]).
fillpoint(r67, xy(25,7), 1).
fillpoint(r67, xy(25,6), 1).
fillpoint(r67, xy(25,5), 1).
fillpoint(r67, xy(25,4), 1).
fillpoint(r67, xy(25,3), 1).
region(r69, '#8b9499', 5, centroid(27,4)).
polygon(r69, [xy(26,4),xy(26,5),xy(27,4),xy(27,2),xy(26,4)]).
fillpoint(r69, xy(27,4), 1).
fillpoint(r69, xy(27,3), 1).
fillpoint(r69, xy(27,2), 1).
fillpoint(r69, xy(26,5), 1).
fillpoint(r69, xy(26,4), 1).
region(r80, '#5d6568', 22, centroid(65,3)).
polygon(r80, [xy(61,2),xy(61,3),xy(62,2),xy(65,2),xy(66,3),xy(65,4),xy(62,4),xy(61,2)]).
midline(r80, [xy(62,3),xy(65,3)]).
fillpoint(r80, xy(65,3), 2).
fillpoint(r80, xy(64,3), 2).
fillpoint(r80, xy(63,3), 2).
fillpoint(r80, xy(62,3), 2).
fillpoint(r80, xy(70,4), 1).
region(r98, '#5d6568', 10, centroid(83,4)).
polygon(r98, [xy(81,3),xy(82,3),xy(82,4),xy(83,3),xy(83,4),xy(84,3),xy(85,4),xy(84,5),xy(85,5),xy(81,3)]).
midline(r98, [xy(84,4)]).
fillpoint(r98, xy(84,4), 2).
fillpoint(r98, xy(85,5), 1).
fillpoint(r98, xy(85,4), 1).
fillpoint(r98, xy(84,5), 1).
fillpoint(r98, xy(84,3), 1).
region(r105, '#727c7f', 5, centroid(70,5)).
polygon(r105, [xy(68,5),xy(70,5),xy(71,4),xy(71,5),xy(68,5)]).
fillpoint(r105, xy(71,5), 1).
fillpoint(r105, xy(71,4), 1).
fillpoint(r105, xy(70,5), 1).
fillpoint(r105, xy(69,5), 1).
fillpoint(r105, xy(68,5), 1).
region(r107, '#818a8f', 5, centroid(76,5)).
polygon(r107, [xy(75,4),xy(76,4),xy(76,5),xy(78,5),xy(75,4)]).
fillpoint(r107, xy(78,5), 1).
fillpoint(r107, xy(77,5), 1).
fillpoint(r107, xy(76,5), 1).
fillpoint(r107, xy(76,4), 1).
fillpoint(r107, xy(75,4), 1).
region(r111, '#869094', 35, centroid(20,11)).
polygon(r111, [xy(14,15),xy(14,16),xy(16,14),xy(16,15),xy(17,14),xy(17,15),xy(18,14),xy(18,13),xy(19,13),xy(20,12),xy(20,11),xy(21,10),xy(21,8),xy(22,7),xy(22,6),xy(23,5),xy(23,8),xy(24,9),xy(24,10),xy(22,12),xy(21,12),xy(20,13),xy(14,15)]).
midline(r111, [xy(21,11),xy(22,10),xy(22,8),xy(23,9),xy(23,10),xy(22,11)]).
fillpoint(r111, xy(23,10), 2).
fillpoint(r111, xy(23,9), 2).
fillpoint(r111, xy(22,11), 2).
fillpoint(r111, xy(22,10), 2).
fillpoint(r111, xy(22,9), 2).
region(r113, '#8d969b', 92, centroid(61,13)).
polygon(r113, [xy(55,17),xy(56,17),xy(56,18),xy(57,18),xy(58,17),xy(57,16),xy(57,14),xy(59,12),xy(61,12),xy(62,11),xy(60,9),xy(59,9),xy(58,8),xy(58,5),xy(59,6),xy(61,6),xy(61,7),xy(62,8),xy(62,9),xy(63,10),xy(63,11),xy(62,12),xy(62,13),xy(63,14),xy(64,13),xy(65,13),xy(66,12),xy(64,10),xy(64,11),xy(67,14),xy(67,17),xy(66,18),xy(65,17),xy(64,17),xy(63,16),xy(62,17),xy(61,17),xy(60,18),xy(59,18),xy(55,17)]).
hole(r113, [xy(63,12),xy(63,13),xy(64,12),xy(65,12),xy(63,12)]).
midline(r113, [xy(57,17)]).
midline(r113, [xy(59,7),xy(59,8),xy(60,7),xy(60,8),xy(61,8),xy(61,9),xy(62,10)]).
midline(r113, [xy(60,15),xy(65,15),xy(66,17)]).
fillpoint(r113, xy(60,15), 4).
fillpoint(r113, xy(65,15), 3).
fillpoint(r113, xy(64,15), 3).
fillpoint(r113, xy(62,15), 3).
fillpoint(r113, xy(61,15), 3).
region(r123, '#899398', 44, centroid(23,13)).
polygon(r123, [xy(16,16),xy(16,17),xy(17,16),xy(18,16),xy(18,17),xy(19,16),xy(19,17),xy(20,17),xy(21,16),xy(20,15),xy(22,13),xy(24,13),xy(24,15),xy(23,16),xy(22,15),xy(24,16),xy(25,16),xy(16,16)]).
midline(r123, [xy(17,17)]).
midline(r123, [xy(20,16),xy(22,14),xy(23,14),xy(23,15)]).
midline(r123, [xy(26,8)]).
fillpoint(r123, xy(26,8), 2).
fillpoint(r123, xy(23,15), 2).
fillpoint(r123, xy(23,14), 2).
fillpoint(r123, xy(22,14), 2).
fillpoint(r123, xy(21,15), 2).
region(r125, '#8b9499', 52, centroid(68,13)).
polygon(r125, [xy(62,6),xy(62,7),xy(63,6),xy(63,9),xy(64,8),xy(64,9),xy(65,8),xy(66,8),xy(67,9),xy(67,10),xy(66,11),xy(65,10),xy(67,11),xy(67,13),xy(68,13),xy(68,18),xy(69,18),xy(70,17),xy(70,16),xy(71,15),xy(71,14),xy(70,13),xy(69,13),xy(62,6)]).
midline(r125, [xy(65,9),xy(66,9),xy(66,10)]).
midline(r125, [xy(69,14),xy(69,17),xy(70,15),xy(70,14),xy(72,15)]).
fillpoint(r125, xy(72,15), 2).
fillpoint(r125, xy(70,15), 2).
fillpoint(r125, xy(70,14), 2).
fillpoint(r125, xy(69,17), 2).
fillpoint(r125, xy(69,16), 2).
region(r126, '#899398', 49, centroid(72,12)).
polygon(r126, [xy(64,7),xy(65,6),xy(65,7),xy(66,6),xy(66,7),xy(67,7),xy(67,8),xy(68,8),xy(68,12),xy(69,11),xy(69,10),xy(70,9),xy(69,8),xy(71,9),xy(71,11),xy(70,12),xy(69,12),xy(71,13),xy(72,12),xy(72,13),xy(74,13),xy(74,17),xy(75,17),xy(76,18),xy(77,18),xy(78,17),xy(78,16),xy(77,15),xy(77,14),xy(76,13),xy(75,14),xy(64,7)]).
hole(r126, [xy(70,10),xy(70,11),xy(70,10)]).
midline(r126, [xy(69,9)]).
midline(r126, [xy(71,12)]).
midline(r126, [xy(76,14),xy(76,16)]).
fillpoint(r126, xy(76,16), 3).
fillpoint(r126, xy(77,17), 2).
fillpoint(r126, xy(77,16), 2).
fillpoint(r126, xy(76,17), 2).
fillpoint(r126, xy(76,15), 2).
region(r127, '#889196', 4, centroid(68,6)).
polygon(r127, [xy(67,6),xy(68,6),xy(68,7),xy(69,6),xy(67,6)]).
fillpoint(r127, xy(69,6), 1).
fillpoint(r127, xy(68,7), 1).
fillpoint(r127, xy(68,6), 1).
fillpoint(r127, xy(67,6), 1).
region(r128, '#869094', 4, centroid(70,7)).
polygon(r128, [xy(69,7),xy(70,6),xy(70,7),xy(71,7),xy(69,7)]).
fillpoint(r128, xy(71,7), 1).
fillpoint(r128, xy(70,7), 1).
fillpoint(r128, xy(70,6), 1).
fillpoint(r128, xy(69,7), 1).
region(r131, '#818a8f', 218, centroid(64,29)).
polygon(r131, [xy(21,33),xy(21,34),xy(23,34),xy(23,35),xy(25,35),xy(26,34),xy(26,35),xy(27,34),xy(28,34),xy(29,35),xy(28,36),xy(29,36),xy(30,35),xy(30,36),xy(31,35),xy(32,36),xy(31,37),xy(32,37),xy(33,36),xy(34,36),xy(35,37),xy(34,38),xy(33,38),xy(35,39),xy(37,39),xy(38,38),xy(37,37),xy(36,37),xy(21,33)]).
midline(r131, [xy(27,35),xy(28,35)]).
midline(r131, [xy(31,36),xy(33,37),xy(34,37),xy(35,38),xy(37,38),xy(38,39),xy(39,39)]).
midline(r131, [xy(58,39),xy(59,39),xy(61,38),xy(62,38),xy(64,37)]).
midline(r131, [xy(72,34)]).
midline(r131, [xy(77,31),xy(78,31)]).
midline(r131, [xy(80,8),xy(81,7),xy(81,8),xy(82,8),xy(82,9),xy(83,8),xy(83,9),xy(85,13),xy(85,14),xy(86,15),xy(86,16),xy(87,18),xy(87,20),xy(86,21),xy(86,24),xy(84,26),xy(86,25),xy(87,24),xy(87,21),xy(88,19)]).
fillpoint(r131, xy(84,11), 3).
fillpoint(r131, xy(88,19), 2).
fillpoint(r131, xy(87,24), 2).
fillpoint(r131, xy(87,23), 2).
fillpoint(r131, xy(87,21), 2).
region(r132, '#7a8487', 90, centroid(91,16)).
polygon(r132, [xy(84,6),xy(85,6),xy(85,7),xy(86,6),xy(87,7),xy(86,8),xy(88,10),xy(88,11),xy(90,13),xy(90,16),xy(92,18),xy(92,24),xy(91,25),xy(92,26),xy(93,25),xy(94,25),xy(95,24),xy(95,15),xy(91,11),xy(91,9),xy(89,7),xy(88,7),xy(84,6)]).
midline(r132, [xy(86,7),xy(87,8),xy(89,9),xy(89,11),xy(90,11),xy(90,12),xy(91,12),xy(92,14),xy(92,16),xy(93,15),xy(93,24),xy(94,23),xy(94,19)]).
midline(r132, [xy(94,24)]).
fillpoint(r132, xy(93,17), 3).
fillpoint(r132, xy(93,16), 3).
fillpoint(r132, xy(93,15), 3).
fillpoint(r132, xy(92,16), 3).
fillpoint(r132, xy(92,15), 3).
region(r133, '#8b9499', 37, centroid(28,14)).
polygon(r133, [xy(25,14),xy(25,15),xy(27,13),xy(28,13),xy(29,12),xy(28,11),xy(28,7),xy(29,7),xy(25,14)]).
midline(r133, [xy(27,15),xy(28,15),xy(28,16)]).
midline(r133, [xy(29,11)]).
fillpoint(r133, xy(28,16), 3).
fillpoint(r133, xy(28,15), 3).
fillpoint(r133, xy(27,15), 3).
fillpoint(r133, xy(29,16), 2).
fillpoint(r133, xy(29,15), 2).
region(r139, '#869094', 98, centroid(74,23)).
polygon(r139, [xy(58,34),xy(58,35),xy(59,35),xy(60,34),xy(59,33),xy(60,33),xy(61,32),xy(61,33),xy(62,32),xy(62,33),xy(63,32),xy(65,32),xy(66,31),xy(66,32),xy(67,31),xy(67,32),xy(68,31),xy(69,31),xy(70,30),xy(70,29),xy(71,29),xy(72,28),xy(73,28),xy(75,26),xy(76,26),xy(76,27),xy(72,31),xy(70,31),xy(58,34)]).
midline(r139, [xy(59,34)]).
midline(r139, [xy(71,30),xy(72,29),xy(72,30),xy(75,27)]).
midline(r139, [xy(80,20),xy(80,21),xy(81,22),xy(81,24)]).
midline(r139, [xy(81,17),xy(81,19),xy(82,18)]).
fillpoint(r139, xy(82,18), 2).
fillpoint(r139, xy(81,24), 2).
fillpoint(r139, xy(81,23), 2).
fillpoint(r139, xy(81,22), 2).
fillpoint(r139, xy(81,19), 2).
region(r140, '#848d92', 178, centroid(61,29)).
polygon(r140, [xy(22,33),xy(24,33),xy(24,34),xy(25,33),xy(25,34),xy(26,33),xy(27,33),xy(28,32),xy(28,33),xy(29,33),xy(29,34),xy(30,33),xy(30,34),xy(31,33),xy(31,34),xy(32,34),xy(32,35),xy(33,34),xy(33,35),xy(34,34),xy(34,35),xy(35,35),xy(35,36),xy(36,35),xy(36,36),xy(37,35),xy(37,36),xy(38,35),xy(39,36),xy(38,37),xy(39,37),xy(40,36),xy(42,36),xy(43,37),xy(42,38),xy(40,38),xy(22,33)]).
midline(r140, [xy(38,36),xy(40,37),xy(42,37)]).
midline(r140, [xy(62,35),xy(63,34),xy(63,35),xy(64,34),xy(65,34)]).
midline(r140, [xy(74,31),xy(76,29)]).
midline(r140, [xy(81,12),xy(82,13),xy(82,15),xy(83,15),xy(83,16),xy(84,17)]).
midline(r140, [xy(83,21),xy(84,20)]).
fillpoint(r140, xy(84,20), 2).
fillpoint(r140, xy(84,17), 2).
fillpoint(r140, xy(83,21), 2).
fillpoint(r140, xy(83,16), 2).
fillpoint(r140, xy(83,15), 2).
region(r142, '#7e888c', 45, centroid(89,18)).
polygon(r142, [xy(85,8),xy(85,9),xy(86,9),xy(86,10),xy(87,10),xy(87,14),xy(88,15),xy(88,17),xy(89,16),xy(89,13),xy(88,12),xy(85,8)]).
midline(r142, [xy(88,13),xy(88,14)]).
midline(r142, [xy(89,17),xy(90,18),xy(90,21),xy(89,22),xy(90,22),xy(90,24)]).
fillpoint(r142, xy(90,24), 2).
fillpoint(r142, xy(90,23), 2).
fillpoint(r142, xy(90,22), 2).
fillpoint(r142, xy(90,21), 2).
fillpoint(r142, xy(90,20), 2).
region(r143, '#7e888c', 21, centroid(8,12)).
polygon(r143, [xy(5,14),xy(5,15),xy(6,15),xy(7,14),xy(6,13),xy(7,12),xy(7,13),xy(8,12),xy(8,11),xy(9,10),xy(9,11),xy(10,10),xy(10,11),xy(12,9),xy(12,10),xy(13,9),xy(13,10),xy(5,14)]).
midline(r143, [xy(6,14)]).
fillpoint(r143, xy(6,14), 2).
fillpoint(r143, xy(13,10), 1).
fillpoint(r143, xy(13,9), 1).
fillpoint(r143, xy(12,10), 1).
fillpoint(r143, xy(12,9), 1).
region(r144, '#889196', 6, centroid(25,11)).
polygon(r144, [xy(24,11),xy(24,12),xy(25,11),xy(25,9),xy(24,11)]).
fillpoint(r144, xy(25,12), 1).
fillpoint(r144, xy(25,11), 1).
fillpoint(r144, xy(25,10), 1).
fillpoint(r144, xy(25,9), 1).
fillpoint(r144, xy(24,12), 1).
region(r146, '#8d969b', 4, centroid(40,10)).
polygon(r146, [xy(40,9),xy(40,11),xy(41,11),xy(40,9)]).
fillpoint(r146, xy(41,11), 1).
fillpoint(r146, xy(40,11), 1).
fillpoint(r146, xy(40,10), 1).
fillpoint(r146, xy(40,9), 1).
region(r147, '#889196', 19, centroid(75,12)).
polygon(r147, [xy(72,9),xy(72,11),xy(73,10),xy(74,10),xy(75,11),xy(74,12),xy(73,12),xy(75,13),xy(76,12),xy(77,12),xy(77,13),xy(78,12),xy(78,15),xy(72,9)]).
midline(r147, [xy(73,11),xy(74,11),xy(75,12)]).
fillpoint(r147, xy(75,12), 2).
fillpoint(r147, xy(74,11), 2).
fillpoint(r147, xy(73,11), 2).
fillpoint(r147, xy(78,15), 1).
fillpoint(r147, xy(78,14), 1).
region(r153, '#5d6568', 5, centroid(36,12)).
polygon(r153, [xy(35,12),xy(36,11),xy(36,12),xy(37,11),xy(37,12),xy(35,12)]).
fillpoint(r153, xy(37,12), 1).
fillpoint(r153, xy(37,11), 1).
fillpoint(r153, xy(36,12), 1).
fillpoint(r153, xy(36,11), 1).
fillpoint(r153, xy(35,12), 1).
region(r162, '#919a9e', 4, centroid(64,12)).
polygon(r162, [xy(63,12),xy(63,13),xy(64,12),xy(65,12),xy(63,12)]).
fillpoint(r162, xy(65,12), 1).
fillpoint(r162, xy(64,12), 1).
fillpoint(r162, xy(63,13), 1).
fillpoint(r162, xy(63,12), 1).
region(r172, '#889196', 4, centroid(19,15)).
polygon(r172, [xy(18,15),xy(19,14),xy(19,15),xy(20,14),xy(18,15)]).
fillpoint(r172, xy(20,14), 1).
fillpoint(r172, xy(19,15), 1).
fillpoint(r172, xy(19,14), 1).
fillpoint(r172, xy(18,15), 1).
region(r180, '#727c7f', 9, centroid(1,17)).
polygon(r180, [xy(0,15),xy(0,17),xy(1,16),xy(2,17),xy(1,18),xy(3,17),xy(4,17),xy(0,15)]).
midline(r180, [xy(1,17)]).
fillpoint(r180, xy(1,17), 2).
fillpoint(r180, xy(4,17), 1).
fillpoint(r180, xy(3,17), 1).
fillpoint(r180, xy(2,17), 1).
fillpoint(r180, xy(1,18), 1).
region(r181, '#8b9499', 4, centroid(38,15)).
polygon(r181, [xy(36,15),xy(39,15),xy(36,15)]).
fillpoint(r181, xy(39,15), 1).
fillpoint(r181, xy(38,15), 1).
fillpoint(r181, xy(37,15), 1).
fillpoint(r181, xy(36,15), 1).
region(r182, '#889196', 8, centroid(16,18)).
polygon(r182, [xy(14,17),xy(15,16),xy(15,18),xy(16,18),xy(16,20),xy(17,19),xy(14,17)]).
fillpoint(r182, xy(17,19), 1).
fillpoint(r182, xy(16,20), 1).
fillpoint(r182, xy(16,19), 1).
fillpoint(r182, xy(16,18), 1).
fillpoint(r182, xy(15,18), 1).
region(r184, '#8d969b', 5, centroid(71,17)).
polygon(r184, [xy(70,18),xy(71,17),xy(71,18),xy(72,18),xy(70,18)]).
fillpoint(r184, xy(72,18), 1).
fillpoint(r184, xy(71,18), 1).
fillpoint(r184, xy(71,17), 1).
fillpoint(r184, xy(71,16), 1).
fillpoint(r184, xy(70,18), 1).
region(r185, '#889196', 7, centroid(78,18)).
polygon(r185, [xy(77,19),xy(78,18),xy(78,19),xy(79,18),xy(79,16),xy(77,19)]).
fillpoint(r185, xy(79,19), 1).
fillpoint(r185, xy(79,18), 1).
fillpoint(r185, xy(79,17), 1).
fillpoint(r185, xy(79,16), 1).
fillpoint(r185, xy(78,19), 1).
region(r186, '#7e888c', 9, centroid(7,20)).
polygon(r186, [xy(6,17),xy(6,20),xy(7,20),xy(7,22),xy(8,22),xy(8,23),xy(6,17)]).
fillpoint(r186, xy(8,23), 1).
fillpoint(r186, xy(8,22), 1).
fillpoint(r186, xy(7,22), 1).
fillpoint(r186, xy(7,21), 1).
fillpoint(r186, xy(7,20), 1).
region(r187, '#869094', 123, centroid(30,30)).
polygon(r187, [xy(12,17),xy(13,17),xy(13,19),xy(14,18),xy(15,19),xy(14,20),xy(14,21),xy(15,20),xy(16,21),xy(15,22),xy(16,23),xy(16,24),xy(17,24),xy(18,23),xy(19,24),xy(18,25),xy(18,26),xy(19,27),xy(19,28),xy(20,28),xy(20,29),xy(21,29),xy(21,31),xy(22,32),xy(27,32),xy(28,31),xy(28,30),xy(27,29),xy(25,29),xy(21,25),xy(20,25),xy(21,27),xy(22,27),xy(23,28),xy(24,27),xy(12,17)]).
hole(r187, [xy(21,28),xy(22,28),xy(21,28)]).
midline(r187, [xy(14,19),xy(15,21),xy(19,25),xy(19,26),xy(20,26),xy(20,27),xy(21,26)]).
midline(r187, [xy(23,30),xy(26,30),xy(26,31),xy(27,30),xy(27,31)]).
fillpoint(r187, xy(24,30), 3).
fillpoint(r187, xy(23,30), 3).
fillpoint(r187, xy(27,31), 2).
fillpoint(r187, xy(27,30), 2).
fillpoint(r187, xy(26,31), 2).
region(r193, '#5d6568', 23, centroid(1,22)).
polygon(r193, [xy(0,18),xy(0,24),xy(1,25),xy(2,25),xy(3,24),xy(3,22),xy(2,21),xy(2,20),xy(1,19),xy(0,18)]).
midline(r193, [xy(1,20),xy(1,24),xy(2,23),xy(2,24)]).
fillpoint(r193, xy(2,24), 2).
fillpoint(r193, xy(2,23), 2).
fillpoint(r193, xy(2,22), 2).
fillpoint(r193, xy(1,24), 2).
fillpoint(r193, xy(1,23), 2).
region(r194, '#7a8487', 18, centroid(5,21)).
polygon(r194, [xy(2,18),xy(3,18),xy(3,19),xy(4,18),xy(5,19),xy(4,20),xy(4,24),xy(5,22),xy(6,21),xy(5,20),xy(6,22),xy(6,23),xy(7,23),xy(2,18)]).
midline(r194, [xy(4,19),xy(5,21)]).
fillpoint(r194, xy(5,21), 2).
fillpoint(r194, xy(4,19), 2).
fillpoint(r194, xy(7,23), 1).
fillpoint(r194, xy(6,23), 1).
fillpoint(r194, xy(6,22), 1).
region(r199, '#727c7f', 12, centroid(25,20)).
polygon(r199, [xy(23,18),xy(23,21),xy(24,20),xy(24,21),xy(29,21),xy(23,18)]).
fillpoint(r199, xy(29,21), 1).
fillpoint(r199, xy(28,21), 1).
fillpoint(r199, xy(27,21), 1).
fillpoint(r199, xy(26,21), 1).
fillpoint(r199, xy(25,21), 1).
region(r223, '#5d6568', 4, centroid(25,20)).
polygon(r223, [xy(24,19),xy(25,19),xy(25,20),xy(26,20),xy(24,19)]).
fillpoint(r223, xy(26,20), 1).
fillpoint(r223, xy(25,20), 1).
fillpoint(r223, xy(25,19), 1).
fillpoint(r223, xy(24,19), 1).
region(r229, '#727c7f', 16, centroid(35,20)).
polygon(r229, [xy(32,19),xy(32,21),xy(33,20),xy(33,19),xy(36,19),xy(36,20),xy(35,21),xy(36,21),xy(37,20),xy(37,21),xy(38,21),xy(32,19)]).
fillpoint(r229, xy(38,21), 1).
fillpoint(r229, xy(37,21), 1).
fillpoint(r229, xy(37,20), 1).
fillpoint(r229, xy(37,19), 1).
fillpoint(r229, xy(36,21), 1).
region(r234, '#727c7f', 5, centroid(45,20)).
polygon(r234, [xy(44,19),xy(46,19),xy(46,21),xy(44,19)]).
fillpoint(r234, xy(46,21), 1).
fillpoint(r234, xy(46,20), 1).
fillpoint(r234, xy(46,19), 1).
fillpoint(r234, xy(45,19), 1).
fillpoint(r234, xy(44,19), 1).
region(r246, '#727c7f', 7, centroid(59,20)).
polygon(r246, [xy(58,19),xy(59,19),xy(59,21),xy(60,20),xy(60,21),xy(61,21),xy(58,19)]).
fillpoint(r246, xy(61,21), 1).
fillpoint(r246, xy(60,21), 1).
fillpoint(r246, xy(60,20), 1).
fillpoint(r246, xy(59,21), 1).
fillpoint(r246, xy(59,20), 1).
region(r248, '#727c7f', 5, centroid(62,19)).
polygon(r248, [xy(61,19),xy(62,19),xy(62,20),xy(63,19),xy(63,20),xy(61,19)]).
fillpoint(r248, xy(63,20), 1).
fillpoint(r248, xy(63,19), 1).
fillpoint(r248, xy(62,20), 1).
fillpoint(r248, xy(62,19), 1).
fillpoint(r248, xy(61,19), 1).
region(r250, '#7a8487', 4, centroid(65,20)).
polygon(r250, [xy(64,21),xy(65,20),xy(65,21),xy(64,21)]).
fillpoint(r250, xy(65,21), 1).
fillpoint(r250, xy(65,20), 1).
fillpoint(r250, xy(65,19), 1).
fillpoint(r250, xy(64,21), 1).
region(r262, '#727c7f', 5, centroid(20,20)).
polygon(r262, [xy(18,20),xy(20,20),xy(20,21),xy(21,21),xy(18,20)]).
fillpoint(r262, xy(21,21), 1).
fillpoint(r262, xy(20,21), 1).
fillpoint(r262, xy(20,20), 1).
fillpoint(r262, xy(19,20), 1).
fillpoint(r262, xy(18,20), 1).
region(r278, '#727c7f', 5, centroid(51,21)).
polygon(r278, [xy(50,20),xy(50,21),xy(51,20),xy(51,21),xy(52,21),xy(50,20)]).
fillpoint(r278, xy(52,21), 1).
fillpoint(r278, xy(51,21), 1).
fillpoint(r278, xy(51,20), 1).
fillpoint(r278, xy(50,21), 1).
fillpoint(r278, xy(50,20), 1).
region(r289, '#727c7f', 13, centroid(72,20)).
polygon(r289, [xy(68,20),xy(68,21),xy(69,20),xy(69,21),xy(70,20),xy(71,20),xy(71,21),xy(72,20),xy(77,20),xy(68,20)]).
fillpoint(r289, xy(77,20), 1).
fillpoint(r289, xy(76,20), 1).
fillpoint(r289, xy(75,20), 1).
fillpoint(r289, xy(74,20), 1).
fillpoint(r289, xy(73,20), 1).
region(r314, '#889196', 188, centroid(48,29)).
polygon(r314, [xy(18,22),xy(19,22),xy(19,23),xy(20,23),xy(20,24),xy(21,23),xy(21,24),xy(22,24),xy(22,25),xy(23,25),xy(23,26),xy(24,25),xy(24,26),xy(25,27),xy(25,28),xy(27,28),xy(29,30),xy(30,30),xy(31,31),xy(34,31),xy(35,30),xy(34,29),xy(35,28),xy(34,27),xy(33,27),xy(32,28),xy(31,28),xy(30,27),xy(29,27),xy(27,25),xy(26,25),xy(25,24),xy(18,22)]).
midline(r314, [xy(25,25),xy(25,26),xy(26,26),xy(26,27),xy(27,26),xy(27,27),xy(28,27),xy(28,28),xy(29,28),xy(29,29),xy(30,28),xy(30,29),xy(31,29),xy(31,30),xy(32,29),xy(32,30),xy(33,29),xy(33,28),xy(34,28),xy(33,30),xy(34,30),xy(35,31),xy(37,31),xy(37,32),xy(38,31),xy(38,32),xy(40,32),xy(42,33),xy(49,33),xy(50,34),xy(56,34),xy(58,32)]).
midline(r314, [xy(63,30),xy(64,30),xy(65,29),xy(65,30),xy(66,29),xy(68,29)]).
midline(r314, [xy(73,25),xy(73,26)]).
midline(r314, [xy(78,23),xy(78,24)]).
fillpoint(r314, xy(78,24), 2).
fillpoint(r314, xy(78,23), 2).
fillpoint(r314, xy(73,26), 2).
fillpoint(r314, xy(73,25), 2).
fillpoint(r314, xy(68,29), 2).
region(r315, '#899398', 9, centroid(23,23)).
polygon(r315, [xy(20,22),xy(22,22),xy(22,23),xy(23,23),xy(23,24),xy(24,23),xy(24,24),xy(25,23),xy(20,22)]).
fillpoint(r315, xy(25,23), 1).
fillpoint(r315, xy(24,24), 1).
fillpoint(r315, xy(24,23), 1).
fillpoint(r315, xy(23,24), 1).
fillpoint(r315, xy(23,23), 1).
region(r318, '#8b9499', 192, centroid(50,26)).
polygon(r318, [xy(25,22),xy(26,22),xy(26,23),xy(27,23),xy(28,22),xy(28,24),xy(29,24),xy(29,25),xy(31,25),xy(31,26),xy(32,25),xy(32,26),xy(33,25),xy(34,25),xy(36,23),xy(38,23),xy(39,24),xy(40,24),xy(41,25),xy(41,26),xy(40,27),xy(39,26),xy(35,26),xy(25,22)]).
midline(r318, [xy(35,25),xy(36,24),xy(36,25),xy(37,24),xy(37,25),xy(38,24),xy(38,25),xy(40,25),xy(40,26),xy(41,27),xy(41,28),xy(42,28),xy(44,27),xy(44,24),xy(46,26),xy(47,26)]).
midline(r318, [xy(47,23)]).
midline(r318, [xy(50,26),xy(50,29),xy(52,29),xy(53,28),xy(52,26)]).
midline(r318, [xy(55,28),xy(57,28),xy(61,26),xy(63,26),xy(64,25)]).
midline(r318, [xy(67,25),xy(69,23),xy(69,24),xy(70,23)]).
fillpoint(r318, xy(47,26), 4).
fillpoint(r318, xy(46,26), 4).
fillpoint(r318, xy(67,25), 3).
fillpoint(r318, xy(64,25), 3).
fillpoint(r318, xy(63,26), 3).
region(r322, '#8b9499', 6, centroid(32,23)).
polygon(r322, [xy(30,23),xy(32,23),xy(33,22),xy(33,23),xy(34,23),xy(30,23)]).
fillpoint(r322, xy(34,23), 1).
fillpoint(r322, xy(33,23), 1).
fillpoint(r322, xy(33,22), 1).
fillpoint(r322, xy(32,23), 1).
fillpoint(r322, xy(31,23), 1).
region(r330, '#8d969b', 49, centroid(56,24)).
polygon(r330, [xy(48,22),xy(49,22),xy(49,24),xy(50,24),xy(51,23),xy(51,22),xy(52,23),xy(51,24),xy(52,24),xy(54,26),xy(57,26),xy(58,25),xy(58,26),xy(59,24),xy(60,23),xy(59,22),xy(53,22),xy(48,22)]).
midline(r330, [xy(54,24),xy(57,24),xy(59,23)]).
fillpoint(r330, xy(57,24), 3).
fillpoint(r330, xy(56,24), 3).
fillpoint(r330, xy(55,24), 3).
fillpoint(r330, xy(54,24), 3).
fillpoint(r330, xy(59,23), 2).
region(r336, '#8d969b', 4, centroid(67,22)).
polygon(r336, [xy(66,22),xy(66,23),xy(67,22),xy(68,22),xy(66,22)]).
fillpoint(r336, xy(68,22), 1).
fillpoint(r336, xy(67,22), 1).
fillpoint(r336, xy(66,23), 1).
fillpoint(r336, xy(66,22), 1).
region(r338, '#899398', 19, centroid(72,25)).
polygon(r338, [xy(68,27),xy(69,26),xy(69,27),xy(70,27),xy(71,26),xy(70,25),xy(71,24),xy(71,25),xy(72,24),xy(72,22),xy(73,23),xy(74,23),xy(74,24),xy(75,23),xy(75,24),xy(76,23),xy(76,24),xy(68,27)]).
midline(r338, [xy(70,26)]).
fillpoint(r338, xy(70,26), 2).
fillpoint(r338, xy(76,24), 1).
fillpoint(r338, xy(76,23), 1).
fillpoint(r338, xy(75,24), 1).
fillpoint(r338, xy(75,23), 1).
region(r340, '#727c7f', 174, centroid(9,33)).
polygon(r340, [xy(0,25),xy(0,33),xy(2,31),xy(3,31),xy(4,32),xy(4,35),xy(5,36),xy(6,36),xy(7,37),xy(10,37),xy(13,40),xy(21,40),xy(22,39),xy(20,37),xy(19,37),xy(18,36),xy(16,36),xy(15,35),xy(15,34),xy(14,33),xy(13,33),xy(11,31),xy(9,31),xy(8,30),xy(7,30),xy(6,29),xy(6,27),xy(8,25),xy(7,24),xy(6,24),xy(5,23),xy(5,24),xy(4,25),xy(3,25),xy(2,26),xy(1,26),xy(0,25)]).
midline(r340, [xy(1,31)]).
midline(r340, [xy(3,28),xy(4,30),xy(5,30),xy(5,31),xy(6,31),xy(7,33),xy(7,34),xy(8,33),xy(8,34),xy(11,34),xy(11,35),xy(12,35),xy(12,36),xy(13,36),xy(13,37),xy(14,37),xy(16,38),xy(20,38),xy(20,39),xy(21,39)]).
midline(r340, [xy(5,26),xy(7,25)]).
fillpoint(r340, xy(14,37), 4).
fillpoint(r340, xy(13,37), 4).
fillpoint(r340, xy(13,36), 4).
fillpoint(r340, xy(12,36), 4).
fillpoint(r340, xy(12,35), 4).
region(r342, '#8d969b', 4, centroid(40,23)).
polygon(r342, [xy(39,23),xy(41,23),xy(41,24),xy(39,23)]).
fillpoint(r342, xy(41,24), 1).
fillpoint(r342, xy(41,23), 1).
fillpoint(r342, xy(40,23), 1).
fillpoint(r342, xy(39,23), 1).
region(r347, '#8d969b', 5, centroid(32,24)).
polygon(r347, [xy(30,24),xy(34,24),xy(30,24)]).
fillpoint(r347, xy(34,24), 1).
fillpoint(r347, xy(33,24), 1).
fillpoint(r347, xy(32,24), 1).
fillpoint(r347, xy(31,24), 1).
fillpoint(r347, xy(30,24), 1).
region(r348, '#7e888c', 4, centroid(11,27)).
polygon(r348, [xy(11,25),xy(11,28),xy(11,25)]).
fillpoint(r348, xy(11,28), 1).
fillpoint(r348, xy(11,27), 1).
fillpoint(r348, xy(11,26), 1).
fillpoint(r348, xy(11,25), 1).
region(r350, '#5d6568', 8, centroid(8,28)).
polygon(r350, [xy(7,28),xy(7,29),xy(8,29),xy(9,28),xy(8,27),xy(9,26),xy(9,27),xy(7,28)]).
midline(r350, [xy(8,28)]).
fillpoint(r350, xy(8,28), 2).
fillpoint(r350, xy(9,28), 1).
fillpoint(r350, xy(9,27), 1).
fillpoint(r350, xy(9,26), 1).
fillpoint(r350, xy(8,29), 1).
region(r351, '#818a8f', 4, centroid(14,27)).
polygon(r351, [xy(13,26),xy(13,27),xy(14,26),xy(14,27),xy(13,26)]).
fillpoint(r351, xy(14,27), 1).
fillpoint(r351, xy(14,26), 1).
fillpoint(r351, xy(13,27), 1).
fillpoint(r351, xy(13,26), 1).
region(r356, '#7e888c', 36, centroid(81,31)).
polygon(r356, [xy(73,35),xy(76,35),xy(77,34),xy(76,33),xy(78,33),xy(78,34),xy(79,33),xy(79,32),xy(80,32),xy(80,33),xy(82,33),xy(83,32),xy(83,31),xy(82,30),xy(85,27),xy(86,27),xy(86,28),xy(84,30),xy(85,30),xy(73,35)]).
midline(r356, [xy(81,32),xy(82,31),xy(82,32),xy(83,30),xy(85,28)]).
fillpoint(r356, xy(85,28), 2).
fillpoint(r356, xy(84,29), 2).
fillpoint(r356, xy(83,30), 2).
fillpoint(r356, xy(82,32), 2).
fillpoint(r356, xy(82,31), 2).
region(r357, '#7a8487', 77, centroid(79,35)).
polygon(r357, [xy(64,40),xy(65,40),xy(66,39),xy(66,40),xy(67,39),xy(67,40),xy(69,40),xy(70,39),xy(69,38),xy(70,38),xy(71,37),xy(72,37),xy(73,36),xy(76,36),xy(76,37),xy(75,38),xy(73,38),xy(72,39),xy(71,39),xy(64,40)]).
midline(r357, [xy(68,39),xy(69,39),xy(71,38),xy(72,38),xy(73,37),xy(75,37)]).
midline(r357, [xy(79,35),xy(80,35)]).
midline(r357, [xy(83,34),xy(85,32),xy(85,33),xy(86,32),xy(86,31),xy(87,30),xy(87,29),xy(88,29),xy(88,30),xy(87,31)]).
fillpoint(r357, xy(88,30), 2).
fillpoint(r357, xy(88,29), 2).
fillpoint(r357, xy(87,31), 2).
fillpoint(r357, xy(87,30), 2).
fillpoint(r357, xy(87,29), 2).
region(r359, '#727c7f', 131, centroid(86,35)).
polygon(r359, [xy(70,40),xy(72,40),xy(73,39),xy(73,40),xy(74,39),xy(74,40),xy(75,39),xy(75,40),xy(84,40),xy(85,39),xy(86,39),xy(87,38),xy(88,38),xy(89,37),xy(92,37),xy(95,34),xy(95,32),xy(93,30),xy(93,29),xy(92,28),xy(91,29),xy(90,29),xy(90,30),xy(88,32),xy(88,33),xy(87,34),xy(86,34),xy(85,35),xy(84,35),xy(83,36),xy(81,36),xy(80,37),xy(78,37),xy(77,38),xy(76,38),xy(70,40)]).
midline(r359, [xy(76,39),xy(77,39),xy(78,38),xy(78,39),xy(79,38),xy(79,39),xy(81,38),xy(83,38),xy(84,37),xy(84,38),xy(86,36),xy(86,37),xy(88,35),xy(88,36),xy(91,33),xy(91,32),xy(92,32),xy(92,33),xy(91,34),xy(92,34)]).
midline(r359, [xy(92,29)]).
fillpoint(r359, xy(92,34), 4).
fillpoint(r359, xy(92,33), 4).
fillpoint(r359, xy(92,32), 4).
fillpoint(r359, xy(91,34), 4).
fillpoint(r359, xy(91,33), 4).
region(r366, '#899398', 35, centroid(41,29)).
polygon(r366, [xy(35,27),xy(36,27),xy(36,28),xy(35,29),xy(38,29),xy(39,28),xy(38,27),xy(39,27),xy(40,29),xy(39,30),xy(41,30),xy(41,31),xy(42,30),xy(42,31),xy(43,30),xy(43,31),xy(44,30),xy(44,31),xy(45,30),xy(45,31),xy(46,30),xy(46,31),xy(47,30),xy(47,31),xy(48,30),xy(48,31),xy(49,30),xy(49,31),xy(35,27)]).
midline(r366, [xy(37,28),xy(38,28),xy(39,29)]).
fillpoint(r366, xy(39,29), 2).
fillpoint(r366, xy(38,28), 2).
fillpoint(r366, xy(37,28), 2).
fillpoint(r366, xy(49,31), 1).
fillpoint(r366, xy(49,30), 1).
region(r369, '#5d6568', 4, centroid(91,28)).
polygon(r369, [xy(90,27),xy(90,28),xy(91,27),xy(91,28),xy(90,27)]).
fillpoint(r369, xy(91,28), 1).
fillpoint(r369, xy(91,27), 1).
fillpoint(r369, xy(90,28), 1).
fillpoint(r369, xy(90,27), 1).
region(r372, '#7e888c', 17, centroid(17,31)).
polygon(r372, [xy(13,28),xy(14,28),xy(14,29),xy(15,29),xy(15,30),xy(17,30),xy(17,32),xy(18,31),xy(18,29),xy(13,28)]).
fillpoint(r372, xy(20,34), 1).
fillpoint(r372, xy(20,33), 1).
fillpoint(r372, xy(19,33), 1).
fillpoint(r372, xy(18,33), 1).
fillpoint(r372, xy(18,32), 1).
region(r379, '#5d6568', 6, centroid(94,29)).
polygon(r379, [xy(93,28),xy(94,28),xy(94,30),xy(95,29),xy(95,30),xy(93,28)]).
fillpoint(r379, xy(95,30), 1).
fillpoint(r379, xy(95,29), 1).
fillpoint(r379, xy(94,30), 1).
fillpoint(r379, xy(94,29), 1).
fillpoint(r379, xy(94,28), 1).
region(r382, '#7a8487', 62, centroid(20,35)).
polygon(r382, [xy(9,30),xy(10,30),xy(11,29),xy(11,30),xy(12,29),xy(13,29),xy(15,31),xy(14,32),xy(13,32),xy(12,31),xy(9,30)]).
midline(r382, [xy(12,30),xy(13,30),xy(13,31),xy(14,31)]).
midline(r382, [xy(17,34),xy(19,35)]).
midline(r382, [xy(22,37),xy(23,38),xy(24,38),xy(24,39),xy(25,38),xy(25,39),xy(29,39)]).
fillpoint(r382, xy(29,39), 2).
fillpoint(r382, xy(28,39), 2).
fillpoint(r382, xy(27,39), 2).
fillpoint(r382, xy(26,39), 2).
fillpoint(r382, xy(25,39), 2).
region(r385, '#899398', 24, centroid(56,31)).
polygon(r385, [xy(50,32),xy(53,32),xy(54,31),xy(54,30),xy(57,30),xy(57,31),xy(56,32),xy(55,32),xy(54,33),xy(50,32)]).
midline(r385, [xy(54,32),xy(55,31),xy(56,31)]).
fillpoint(r385, xy(56,31), 2).
fillpoint(r385, xy(55,31), 2).
fillpoint(r385, xy(54,32), 2).
fillpoint(r385, xy(62,29), 1).
fillpoint(r385, xy(61,29), 1).
region(r386, '#818a8f', 4, centroid(19,31)).
polygon(r386, [xy(19,30),xy(19,32),xy(20,32),xy(19,30)]).
fillpoint(r386, xy(20,32), 1).
fillpoint(r386, xy(19,32), 1).
fillpoint(r386, xy(19,31), 1).
fillpoint(r386, xy(19,30), 1).
region(r388, '#5d6568', 61, centroid(4,37)).
polygon(r388, [xy(0,34),xy(0,40),xy(10,40),xy(11,39),xy(10,38),xy(7,38),xy(6,37),xy(5,37),xy(3,35),xy(3,33),xy(2,32),xy(1,33),xy(3,32),xy(0,34)]).
midline(r388, [xy(1,34),xy(2,33),xy(2,38),xy(3,37),xy(3,38),xy(6,38),xy(6,39),xy(10,39)]).
fillpoint(r388, xy(4,38), 3).
fillpoint(r388, xy(3,38), 3).
fillpoint(r388, xy(3,37), 3).
fillpoint(r388, xy(2,38), 3).
fillpoint(r388, xy(2,37), 3).
region(r391, '#7e888c', 22, centroid(67,38)).
polygon(r391, [xy(60,40),xy(62,40),xy(63,39),xy(63,40),xy(65,38),xy(65,39),xy(66,38),xy(66,37),xy(67,36),xy(68,36),xy(68,37),xy(69,36),xy(69,37),xy(70,36),xy(70,37),xy(71,36),xy(71,35),xy(72,36),xy(60,40)]).
midline(r391, [xy(67,37)]).
fillpoint(r391, xy(67,37), 2).
fillpoint(r391, xy(72,36), 1).
fillpoint(r391, xy(71,36), 1).
fillpoint(r391, xy(71,35), 1).
fillpoint(r391, xy(70,37), 1).
region(r392, '#5d6568', 33, centroid(91,39)).
polygon(r392, [xy(85,40),xy(86,40),xy(87,39),xy(87,40),xy(88,39),xy(88,40),xy(94,40),xy(95,39),xy(95,37),xy(94,36),xy(92,38),xy(89,38),xy(85,40)]).
midline(r392, [xy(89,39),xy(92,39),xy(93,38),xy(93,39),xy(94,38),xy(94,39)]).
fillpoint(r392, xy(94,39), 2).
fillpoint(r392, xy(94,38), 2).
fillpoint(r392, xy(94,37), 2).
fillpoint(r392, xy(93,39), 2).
fillpoint(r392, xy(93,38), 2).
region(r393, '#7e888c', 22, centroid(30,38)).
polygon(r393, [xy(23,36),xy(26,36),xy(26,37),xy(30,37),xy(30,38),xy(31,38),xy(31,39),xy(32,38),xy(33,39),xy(32,40),xy(33,40),xy(34,39),xy(34,40),xy(37,40),xy(23,36)]).
midline(r393, [xy(32,39)]).
fillpoint(r393, xy(32,39), 2).
fillpoint(r393, xy(37,40), 1).
fillpoint(r393, xy(36,40), 1).
fillpoint(r393, xy(35,40), 1).
fillpoint(r393, xy(34,40), 1).
adjacent(r1, r2).
shared_edge(r1, r2, 12).
adjacent(r10, r11).
shared_edge(r10, r11, 2).
adjacent(r10, r68).
shared_edge(r10, r68, 1).
adjacent(r10, r9).
shared_edge(r10, r9, 2).
adjacent(r100, r101).
shared_edge(r100, r101, 1).
adjacent(r100, r43).
shared_edge(r100, r43, 2).
adjacent(r100, r90).
shared_edge(r100, r90, 1).
adjacent(r100, r91).
shared_edge(r100, r91, 1).
adjacent(r100, r99).
shared_edge(r100, r99, 1).
adjacent(r101, r102).
shared_edge(r101, r102, 1).
adjacent(r101, r113).
shared_edge(r101, r113, 1).
adjacent(r101, r77).
shared_edge(r101, r77, 1).
adjacent(r102, r103).
shared_edge(r102, r103, 1).
adjacent(r102, r114).
shared_edge(r102, r114, 1).
adjacent(r102, r92).
shared_edge(r102, r92, 1).
adjacent(r103, r104).
shared_edge(r103, r104, 1).
adjacent(r103, r115).
shared_edge(r103, r115, 1).
adjacent(r103, r93).
shared_edge(r103, r93, 1).
adjacent(r104, r116).
shared_edge(r104, r116, 1).
adjacent(r104, r80).
shared_edge(r104, r80, 2).
adjacent(r105, r121).
shared_edge(r105, r121, 1).
adjacent(r105, r127).
shared_edge(r105, r127, 2).
adjacent(r105, r128).
shared_edge(r105, r128, 1).
adjacent(r105, r129).
shared_edge(r105, r129, 1).
adjacent(r105, r36).
shared_edge(r105, r36, 3).
adjacent(r105, r80).
shared_edge(r105, r80, 4).
adjacent(r106, r36).
shared_edge(r106, r36, 4).
adjacent(r107, r36).
shared_edge(r107, r36, 12).
adjacent(r108, r109).
shared_edge(r108, r109, 1).
adjacent(r108, r36).
shared_edge(r108, r36, 4).
adjacent(r108, r97).
shared_edge(r108, r97, 1).
adjacent(r109, r36).
shared_edge(r109, r36, 1).
adjacent(r109, r98).
shared_edge(r109, r98, 2).
adjacent(r11, r12).
shared_edge(r11, r12, 3).
adjacent(r11, r124).
shared_edge(r11, r124, 2).
adjacent(r11, r13).
shared_edge(r11, r13, 1).
adjacent(r11, r133).
shared_edge(r11, r133, 19).
adjacent(r11, r152).
shared_edge(r11, r152, 1).
adjacent(r11, r156).
shared_edge(r11, r156, 3).
adjacent(r11, r169).
shared_edge(r11, r169, 1).
adjacent(r11, r171).
shared_edge(r11, r171, 2).
adjacent(r11, r173).
shared_edge(r11, r173, 3).
adjacent(r11, r177).
shared_edge(r11, r177, 1).
adjacent(r11, r178).
shared_edge(r11, r178, 2).
adjacent(r11, r179).
shared_edge(r11, r179, 3).
adjacent(r11, r181).
shared_edge(r11, r181, 6).
adjacent(r11, r191).
shared_edge(r11, r191, 5).
adjacent(r11, r203).
shared_edge(r11, r203, 1).
adjacent(r11, r204).
shared_edge(r11, r204, 3).
adjacent(r11, r205).
shared_edge(r11, r205, 3).
adjacent(r11, r206).
shared_edge(r11, r206, 2).
adjacent(r11, r209).
shared_edge(r11, r209, 2).
adjacent(r11, r210).
shared_edge(r11, r210, 2).
adjacent(r11, r211).
shared_edge(r11, r211, 2).
adjacent(r11, r227).
shared_edge(r11, r227, 1).
adjacent(r11, r228).
shared_edge(r11, r228, 1).
adjacent(r11, r229).
shared_edge(r11, r229, 4).
adjacent(r11, r230).
shared_edge(r11, r230, 1).
adjacent(r11, r234).
shared_edge(r11, r234, 1).
adjacent(r11, r235).
shared_edge(r11, r235, 1).
adjacent(r11, r236).
shared_edge(r11, r236, 1).
adjacent(r11, r43).
shared_edge(r11, r43, 37).
adjacent(r11, r69).
shared_edge(r11, r69, 6).
adjacent(r110, r41).
shared_edge(r110, r41, 4).
adjacent(r111, r123).
shared_edge(r111, r123, 4).
adjacent(r111, r144).
shared_edge(r111, r144, 5).
adjacent(r111, r163).
shared_edge(r111, r163, 2).
adjacent(r111, r172).
shared_edge(r111, r172, 5).
adjacent(r111, r182).
shared_edge(r111, r182, 3).
adjacent(r111, r66).
shared_edge(r111, r66, 22).
adjacent(r111, r67).
shared_edge(r111, r67, 5).
adjacent(r112, r43).
shared_edge(r112, r43, 4).
adjacent(r113, r114).
shared_edge(r113, r114, 2).
adjacent(r113, r115).
shared_edge(r113, r115, 1).
adjacent(r113, r116).
shared_edge(r113, r116, 1).
adjacent(r113, r125).
shared_edge(r113, r125, 19).
adjacent(r113, r162).
shared_edge(r113, r162, 10).
adjacent(r113, r192).
shared_edge(r113, r192, 3).
adjacent(r113, r214).
shared_edge(r113, r214, 3).
adjacent(r113, r215).
shared_edge(r113, r215, 3).
adjacent(r113, r216).
shared_edge(r113, r216, 2).
adjacent(r113, r217).
shared_edge(r113, r217, 3).
adjacent(r113, r244).
shared_edge(r113, r244, 1).
adjacent(r113, r245).
shared_edge(r113, r245, 1).
adjacent(r113, r246).
shared_edge(r113, r246, 1).
adjacent(r113, r247).
shared_edge(r113, r247, 1).
adjacent(r113, r248).
shared_edge(r113, r248, 1).
adjacent(r113, r249).
shared_edge(r113, r249, 1).
adjacent(r113, r251).
shared_edge(r113, r251, 1).
adjacent(r113, r252).
shared_edge(r113, r252, 1).
adjacent(r113, r43).
shared_edge(r113, r43, 26).
adjacent(r114, r115).
shared_edge(r114, r115, 1).
adjacent(r115, r116).
shared_edge(r115, r116, 1).
adjacent(r116, r117).
shared_edge(r116, r117, 1).
adjacent(r117, r118).
shared_edge(r117, r118, 1).
adjacent(r117, r125).
shared_edge(r117, r125, 1).
adjacent(r117, r80).
shared_edge(r117, r80, 1).
adjacent(r118, r119).
shared_edge(r118, r119, 1).
adjacent(r118, r125).
shared_edge(r118, r125, 1).
adjacent(r118, r80).
shared_edge(r118, r80, 1).
adjacent(r119, r120).
shared_edge(r119, r120, 1).
adjacent(r119, r125).
shared_edge(r119, r125, 1).
adjacent(r119, r80).
shared_edge(r119, r80, 1).
adjacent(r120, r121).
shared_edge(r120, r121, 1).
adjacent(r120, r126).
shared_edge(r120, r126, 2).
adjacent(r120, r80).
shared_edge(r120, r80, 2).
adjacent(r121, r127).
shared_edge(r121, r127, 1).
adjacent(r121, r80).
shared_edge(r121, r80, 1).
adjacent(r122, r36).
shared_edge(r122, r36, 2).
adjacent(r122, r98).
shared_edge(r122, r98, 2).
adjacent(r123, r124).
shared_edge(r123, r124, 2).
adjacent(r123, r133).
shared_edge(r123, r133, 16).
adjacent(r123, r144).
shared_edge(r123, r144, 7).
adjacent(r123, r163).
shared_edge(r123, r163, 2).
adjacent(r123, r172).
shared_edge(r123, r172, 5).
adjacent(r123, r182).
shared_edge(r123, r182, 5).
adjacent(r123, r183).
shared_edge(r123, r183, 3).
adjacent(r123, r188).
shared_edge(r123, r188, 2).
adjacent(r123, r190).
shared_edge(r123, r190, 3).
adjacent(r123, r196).
shared_edge(r123, r196, 4).
adjacent(r123, r67).
shared_edge(r123, r67, 4).
adjacent(r123, r69).
shared_edge(r123, r69, 1).
adjacent(r125, r126).
shared_edge(r125, r126, 26).
adjacent(r125, r184).
shared_edge(r125, r184, 9).
adjacent(r125, r253).
shared_edge(r125, r253, 1).
adjacent(r125, r254).
shared_edge(r125, r254, 1).
adjacent(r125, r256).
shared_edge(r125, r256, 1).
adjacent(r125, r257).
shared_edge(r125, r257, 2).
adjacent(r125, r258).
shared_edge(r125, r258, 1).
adjacent(r125, r289).
shared_edge(r125, r289, 1).
adjacent(r126, r127).
shared_edge(r126, r127, 4).
adjacent(r126, r128).
shared_edge(r126, r128, 1).
adjacent(r126, r138).
shared_edge(r126, r138, 3).
adjacent(r126, r147).
shared_edge(r126, r147, 16).
adjacent(r126, r151).
shared_edge(r126, r151, 6).
adjacent(r126, r185).
shared_edge(r126, r185, 5).
adjacent(r126, r259).
shared_edge(r126, r259, 1).
adjacent(r127, r128).
shared_edge(r127, r128, 3).
adjacent(r128, r129).
shared_edge(r128, r129, 2).
adjacent(r128, r134).
shared_edge(r128, r134, 1).
adjacent(r128, r138).
shared_edge(r128, r138, 2).
adjacent(r129, r130).
shared_edge(r129, r130, 1).
adjacent(r13, r14).
shared_edge(r13, r14, 1).
adjacent(r13, r43).
shared_edge(r13, r43, 1).
adjacent(r130, r134).
shared_edge(r130, r134, 1).
adjacent(r130, r36).
shared_edge(r130, r36, 2).
adjacent(r131, r136).
shared_edge(r131, r136, 2).
adjacent(r131, r140).
shared_edge(r131, r140, 111).
adjacent(r131, r142).
shared_edge(r131, r142, 27).
adjacent(r131, r356).
shared_edge(r131, r356, 27).
adjacent(r131, r36).
shared_edge(r131, r36, 9).
adjacent(r131, r372).
shared_edge(r131, r372, 2).
adjacent(r131, r389).
shared_edge(r131, r389, 1).
adjacent(r131, r390).
shared_edge(r131, r390, 3).
adjacent(r131, r391).
shared_edge(r131, r391, 20).
adjacent(r131, r393).
shared_edge(r131, r393, 20).
adjacent(r132, r136).
shared_edge(r132, r136, 2).
adjacent(r132, r142).
shared_edge(r132, r142, 26).
adjacent(r132, r358).
shared_edge(r132, r358, 2).
adjacent(r132, r359).
shared_edge(r132, r359, 5).
adjacent(r132, r36).
shared_edge(r132, r36, 1).
adjacent(r132, r41).
shared_edge(r132, r41, 19).
adjacent(r132, r98).
shared_edge(r132, r98, 2).
adjacent(r133, r190).
shared_edge(r133, r190, 1).
adjacent(r133, r201).
shared_edge(r133, r201, 1).
adjacent(r133, r202).
shared_edge(r133, r202, 2).
adjacent(r133, r203).
shared_edge(r133, r203, 2).
adjacent(r133, r226).
shared_edge(r133, r226, 1).
adjacent(r134, r135).
shared_edge(r134, r135, 1).
adjacent(r134, r139).
shared_edge(r134, r139, 1).
adjacent(r135, r139).
shared_edge(r135, r139, 1).
adjacent(r135, r140).
shared_edge(r135, r140, 2).
adjacent(r135, r36).
shared_edge(r135, r36, 4).
adjacent(r137, r41).
shared_edge(r137, r41, 3).
adjacent(r137, r42).
shared_edge(r137, r42, 1).
adjacent(r138, r139).
shared_edge(r138, r139, 1).
adjacent(r139, r140).
shared_edge(r139, r140, 66).
adjacent(r139, r147).
shared_edge(r139, r147, 14).
adjacent(r139, r185).
shared_edge(r139, r185, 6).
adjacent(r139, r290).
shared_edge(r139, r290, 2).
adjacent(r139, r314).
shared_edge(r139, r314, 37).
adjacent(r14, r15).
shared_edge(r14, r15, 1).
adjacent(r14, r43).
shared_edge(r14, r43, 1).
adjacent(r140, r141).
shared_edge(r140, r141, 2).
adjacent(r140, r187).
shared_edge(r140, r187, 45).
adjacent(r140, r36).
shared_edge(r140, r36, 2).
adjacent(r141, r36).
shared_edge(r141, r36, 2).
adjacent(r142, r357).
shared_edge(r142, r357, 2).
adjacent(r142, r358).
shared_edge(r142, r358, 1).
adjacent(r143, r4).
shared_edge(r143, r4, 19).
adjacent(r143, r6).
shared_edge(r143, r6, 15).
adjacent(r145, r149).
shared_edge(r145, r149, 1).
adjacent(r145, r43).
shared_edge(r145, r43, 3).
adjacent(r146, r155).
shared_edge(r146, r155, 1).
adjacent(r146, r159).
shared_edge(r146, r159, 1).
adjacent(r146, r160).
shared_edge(r146, r160, 1).
adjacent(r146, r43).
shared_edge(r146, r43, 7).
adjacent(r148, r149).
shared_edge(r148, r149, 1).
adjacent(r148, r153).
shared_edge(r148, r153, 1).
adjacent(r148, r43).
shared_edge(r148, r43, 2).
adjacent(r149, r150).
shared_edge(r149, r150, 1).
adjacent(r149, r153).
shared_edge(r149, r153, 1).
adjacent(r15, r16).
shared_edge(r15, r16, 1).
adjacent(r15, r43).
shared_edge(r15, r43, 1).
adjacent(r15, r44).
shared_edge(r15, r44, 2).
adjacent(r150, r154).
shared_edge(r150, r154, 1).
adjacent(r150, r43).
shared_edge(r150, r43, 2).
adjacent(r152, r153).
shared_edge(r152, r153, 2).
adjacent(r152, r43).
shared_edge(r152, r43, 1).
adjacent(r153, r154).
shared_edge(r153, r154, 1).
adjacent(r153, r156).
shared_edge(r153, r156, 1).
adjacent(r153, r157).
shared_edge(r153, r157, 1).
adjacent(r153, r164).
shared_edge(r153, r164, 1).
adjacent(r153, r165).
shared_edge(r153, r165, 1).
adjacent(r153, r166).
shared_edge(r153, r166, 1).
adjacent(r154, r155).
shared_edge(r154, r155, 1).
adjacent(r154, r157).
shared_edge(r154, r157, 1).
adjacent(r155, r158).
shared_edge(r155, r158, 1).
adjacent(r155, r43).
shared_edge(r155, r43, 1).
adjacent(r156, r164).
shared_edge(r156, r164, 1).
adjacent(r156, r173).
shared_edge(r156, r173, 1).
adjacent(r157, r158).
shared_edge(r157, r158, 1).
adjacent(r157, r167).
shared_edge(r157, r167, 1).
adjacent(r158, r159).
shared_edge(r158, r159, 2).
adjacent(r158, r167).
shared_edge(r158, r167, 1).
adjacent(r158, r176).
shared_edge(r158, r176, 1).
adjacent(r159, r160).
shared_edge(r159, r160, 1).
adjacent(r159, r168).
shared_edge(r159, r168, 1).
adjacent(r159, r177).
shared_edge(r159, r177, 1).
adjacent(r16, r17).
shared_edge(r16, r17, 1).
adjacent(r16, r44).
shared_edge(r16, r44, 1).
adjacent(r160, r161).
shared_edge(r160, r161, 1).
adjacent(r160, r168).
shared_edge(r160, r168, 1).
adjacent(r161, r169).
shared_edge(r161, r169, 1).
adjacent(r161, r170).
shared_edge(r161, r170, 1).
adjacent(r161, r171).
shared_edge(r161, r171, 1).
adjacent(r161, r43).
shared_edge(r161, r43, 4).
adjacent(r164, r165).
shared_edge(r164, r165, 1).
adjacent(r164, r173).
shared_edge(r164, r173, 1).
adjacent(r165, r166).
shared_edge(r165, r166, 1).
adjacent(r165, r174).
shared_edge(r165, r174, 1).
adjacent(r166, r167).
shared_edge(r166, r167, 1).
adjacent(r166, r175).
shared_edge(r166, r175, 1).
adjacent(r167, r175).
shared_edge(r167, r175, 1).
adjacent(r167, r176).
shared_edge(r167, r176, 1).
adjacent(r167, r181).
shared_edge(r167, r181, 1).
adjacent(r168, r169).
shared_edge(r168, r169, 1).
adjacent(r168, r178).
shared_edge(r168, r178, 1).
adjacent(r169, r170).
shared_edge(r169, r170, 1).
adjacent(r17, r18).
shared_edge(r17, r18, 1).
adjacent(r17, r44).
shared_edge(r17, r44, 1).
adjacent(r170, r171).
shared_edge(r170, r171, 1).
adjacent(r170, r179).
shared_edge(r170, r179, 1).
adjacent(r173, r174).
shared_edge(r173, r174, 1).
adjacent(r174, r175).
shared_edge(r174, r175, 1).
adjacent(r174, r181).
shared_edge(r174, r181, 1).
adjacent(r175, r181).
shared_edge(r175, r181, 1).
adjacent(r176, r177).
shared_edge(r176, r177, 1).
adjacent(r176, r181).
shared_edge(r176, r181, 1).
adjacent(r177, r178).
shared_edge(r177, r178, 1).
adjacent(r18, r19).
shared_edge(r18, r19, 1).
adjacent(r18, r44).
shared_edge(r18, r44, 1).
adjacent(r180, r193).
shared_edge(r180, r193, 3).
adjacent(r180, r194).
shared_edge(r180, r194, 4).
adjacent(r180, r4).
shared_edge(r180, r4, 8).
adjacent(r182, r187).
shared_edge(r182, r187, 7).
adjacent(r182, r219).
shared_edge(r182, r219, 1).
adjacent(r182, r261).
shared_edge(r182, r261, 2).
adjacent(r183, r189).
shared_edge(r183, r189, 1).
adjacent(r184, r255).
shared_edge(r184, r255, 2).
adjacent(r184, r256).
shared_edge(r184, r256, 1).
adjacent(r185, r259).
shared_edge(r185, r259, 1).
adjacent(r185, r289).
shared_edge(r185, r289, 1).
adjacent(r185, r290).
shared_edge(r185, r290, 1).
adjacent(r186, r194).
shared_edge(r186, r194, 7).
adjacent(r186, r195).
shared_edge(r186, r195, 1).
adjacent(r186, r344).
shared_edge(r186, r344, 1).
adjacent(r186, r4).
shared_edge(r186, r4, 2).
adjacent(r186, r6).
shared_edge(r186, r6, 9).
adjacent(r187, r291).
shared_edge(r187, r291, 2).
adjacent(r187, r314).
shared_edge(r187, r314, 54).
adjacent(r187, r364).
shared_edge(r187, r364, 2).
adjacent(r187, r375).
shared_edge(r187, r375, 1).
adjacent(r187, r376).
shared_edge(r187, r376, 6).
adjacent(r187, r384).
shared_edge(r187, r384, 2).
adjacent(r187, r387).
shared_edge(r187, r387, 3).
adjacent(r187, r389).
shared_edge(r187, r389, 2).
adjacent(r187, r66).
shared_edge(r187, r66, 18).
adjacent(r188, r189).
shared_edge(r188, r189, 1).
adjacent(r188, r197).
shared_edge(r188, r197, 1).
adjacent(r189, r190).
shared_edge(r189, r190, 1).
adjacent(r189, r198).
shared_edge(r189, r198, 1).
adjacent(r19, r20).
shared_edge(r19, r20, 1).
adjacent(r19, r44).
shared_edge(r19, r44, 1).
adjacent(r190, r199).
shared_edge(r190, r199, 2).
adjacent(r190, r200).
shared_edge(r190, r200, 1).
adjacent(r191, r207).
shared_edge(r191, r207, 1).
adjacent(r191, r208).
shared_edge(r191, r208, 1).
adjacent(r191, r209).
shared_edge(r191, r209, 1).
adjacent(r192, r216).
shared_edge(r192, r216, 1).
adjacent(r193, r194).
shared_edge(r193, r194, 3).
adjacent(r193, r218).
shared_edge(r193, r218, 2).
adjacent(r193, r260).
shared_edge(r193, r260, 3).
adjacent(r193, r340).
shared_edge(r193, r340, 6).
adjacent(r194, r195).
shared_edge(r194, r195, 2).
adjacent(r194, r218).
shared_edge(r194, r218, 2).
adjacent(r194, r260).
shared_edge(r194, r260, 3).
adjacent(r194, r340).
shared_edge(r194, r340, 7).
adjacent(r195, r4).
shared_edge(r195, r4, 1).
adjacent(r196, r197).
shared_edge(r196, r197, 1).
adjacent(r196, r219).
shared_edge(r196, r219, 1).
adjacent(r196, r220).
shared_edge(r196, r220, 1).
adjacent(r196, r221).
shared_edge(r196, r221, 1).
adjacent(r197, r198).
shared_edge(r197, r198, 1).
adjacent(r197, r222).
shared_edge(r197, r222, 1).
adjacent(r198, r199).
shared_edge(r198, r199, 2).
adjacent(r198, r222).
shared_edge(r198, r222, 1).
adjacent(r198, r264).
shared_edge(r198, r264, 1).
adjacent(r199, r200).
shared_edge(r199, r200, 1).
adjacent(r199, r223).
shared_edge(r199, r223, 6).
adjacent(r199, r226).
shared_edge(r199, r226, 1).
adjacent(r199, r264).
shared_edge(r199, r264, 2).
adjacent(r199, r265).
shared_edge(r199, r265, 1).
adjacent(r199, r266).
shared_edge(r199, r266, 1).
adjacent(r199, r293).
shared_edge(r199, r293, 1).
adjacent(r199, r316).
shared_edge(r199, r316, 1).
adjacent(r199, r317).
shared_edge(r199, r317, 1).
adjacent(r199, r318).
shared_edge(r199, r318, 3).
adjacent(r199, r319).
shared_edge(r199, r319, 1).
adjacent(r199, r320).
shared_edge(r199, r320, 1).
adjacent(r2, r3).
shared_edge(r2, r3, 8).
adjacent(r2, r4).
shared_edge(r2, r4, 31).
adjacent(r20, r21).
shared_edge(r20, r21, 1).
adjacent(r20, r44).
shared_edge(r20, r44, 1).
adjacent(r200, r201).
shared_edge(r200, r201, 1).
adjacent(r200, r223).
shared_edge(r200, r223, 1).
adjacent(r201, r202).
shared_edge(r201, r202, 1).
adjacent(r201, r224).
shared_edge(r201, r224, 1).
adjacent(r202, r225).
shared_edge(r202, r225, 1).
adjacent(r203, r227).
shared_edge(r203, r227, 1).
adjacent(r204, r229).
shared_edge(r204, r229, 1).
adjacent(r205, r229).
shared_edge(r205, r229, 1).
adjacent(r206, r207).
shared_edge(r206, r207, 1).
adjacent(r206, r231).
shared_edge(r206, r231, 1).
adjacent(r207, r208).
shared_edge(r207, r208, 1).
adjacent(r207, r232).
shared_edge(r207, r232, 1).
adjacent(r208, r209).
shared_edge(r208, r209, 1).
adjacent(r208, r233).
shared_edge(r208, r233, 1).
adjacent(r209, r233).
shared_edge(r209, r233, 1).
adjacent(r209, r234).
shared_edge(r209, r234, 1).
adjacent(r209, r272).
shared_edge(r209, r272, 2).
adjacent(r21, r22).
shared_edge(r21, r22, 1).
adjacent(r21, r45).
shared_edge(r21, r45, 1).
adjacent(r210, r211).
shared_edge(r210, r211, 1).
adjacent(r210, r234).
shared_edge(r210, r234, 1).
adjacent(r211, r234).
shared_edge(r211, r234, 1).
adjacent(r212, r238).
shared_edge(r212, r238, 1).
adjacent(r212, r43).
shared_edge(r212, r43, 3).
adjacent(r213, r240).
shared_edge(r213, r240, 1).
adjacent(r213, r43).
shared_edge(r213, r43, 3).
adjacent(r214, r246).
shared_edge(r214, r246, 1).
adjacent(r215, r248).
shared_edge(r215, r248, 1).
adjacent(r216, r248).
shared_edge(r216, r248, 1).
adjacent(r217, r250).
shared_edge(r217, r250, 1).
adjacent(r219, r220).
shared_edge(r219, r220, 1).
adjacent(r219, r262).
shared_edge(r219, r262, 1).
adjacent(r22, r23).
shared_edge(r22, r23, 1).
adjacent(r22, r46).
shared_edge(r22, r46, 1).
adjacent(r220, r221).
shared_edge(r220, r221, 1).
adjacent(r220, r262).
shared_edge(r220, r262, 1).
adjacent(r221, r222).
shared_edge(r221, r222, 1).
adjacent(r221, r262).
shared_edge(r221, r262, 1).
adjacent(r222, r263).
shared_edge(r222, r263, 1).
adjacent(r223, r224).
shared_edge(r223, r224, 2).
adjacent(r223, r265).
shared_edge(r223, r265, 1).
adjacent(r224, r225).
shared_edge(r224, r225, 1).
adjacent(r225, r226).
shared_edge(r225, r226, 1).
adjacent(r225, r265).
shared_edge(r225, r265, 1).
adjacent(r226, r227).
shared_edge(r226, r227, 1).
adjacent(r226, r265).
shared_edge(r226, r265, 1).
adjacent(r226, r266).
shared_edge(r226, r266, 1).
adjacent(r227, r228).
shared_edge(r227, r228, 1).
adjacent(r227, r266).
shared_edge(r227, r266, 2).
adjacent(r227, r267).
shared_edge(r227, r267, 1).
adjacent(r227, r293).
shared_edge(r227, r293, 1).
adjacent(r228, r229).
shared_edge(r228, r229, 1).
adjacent(r228, r267).
shared_edge(r228, r267, 1).
adjacent(r229, r230).
shared_edge(r229, r230, 3).
adjacent(r229, r267).
shared_edge(r229, r267, 1).
adjacent(r229, r268).
shared_edge(r229, r268, 2).
adjacent(r229, r269).
shared_edge(r229, r269, 3).
adjacent(r229, r294).
shared_edge(r229, r294, 1).
adjacent(r229, r295).
shared_edge(r229, r295, 2).
adjacent(r229, r296).
shared_edge(r229, r296, 1).
adjacent(r229, r321).
shared_edge(r229, r321, 1).
adjacent(r229, r322).
shared_edge(r229, r322, 1).
adjacent(r229, r323).
shared_edge(r229, r323, 1).
adjacent(r229, r324).
shared_edge(r229, r324, 2).
adjacent(r229, r325).
shared_edge(r229, r325, 1).
adjacent(r23, r24).
shared_edge(r23, r24, 1).
adjacent(r23, r47).
shared_edge(r23, r47, 1).
adjacent(r230, r231).
shared_edge(r230, r231, 1).
adjacent(r230, r270).
shared_edge(r230, r270, 1).
adjacent(r231, r232).
shared_edge(r231, r232, 1).
adjacent(r231, r270).
shared_edge(r231, r270, 1).
adjacent(r232, r233).
shared_edge(r232, r233, 1).
adjacent(r232, r271).
shared_edge(r232, r271, 1).
adjacent(r233, r271).
shared_edge(r233, r271, 1).
adjacent(r233, r272).
shared_edge(r233, r272, 1).
adjacent(r233, r297).
shared_edge(r233, r297, 1).
adjacent(r234, r235).
shared_edge(r234, r235, 1).
adjacent(r234, r273).
shared_edge(r234, r273, 1).
adjacent(r234, r274).
shared_edge(r234, r274, 2).
adjacent(r234, r275).
shared_edge(r234, r275, 1).
adjacent(r234, r300).
shared_edge(r234, r300, 1).
adjacent(r234, r301).
shared_edge(r234, r301, 1).
adjacent(r234, r329).
shared_edge(r234, r329, 1).
adjacent(r235, r236).
shared_edge(r235, r236, 1).
adjacent(r235, r275).
shared_edge(r235, r275, 1).
adjacent(r236, r237).
shared_edge(r236, r237, 1).
adjacent(r236, r276).
shared_edge(r236, r276, 1).
adjacent(r237, r238).
shared_edge(r237, r238, 1).
adjacent(r237, r277).
shared_edge(r237, r277, 1).
adjacent(r237, r43).
shared_edge(r237, r43, 1).
adjacent(r238, r239).
shared_edge(r238, r239, 1).
adjacent(r238, r278).
shared_edge(r238, r278, 1).
adjacent(r239, r240).
shared_edge(r239, r240, 1).
adjacent(r239, r278).
shared_edge(r239, r278, 1).
adjacent(r239, r43).
shared_edge(r239, r43, 1).
adjacent(r24, r25).
shared_edge(r24, r25, 1).
adjacent(r24, r48).
shared_edge(r24, r48, 1).
adjacent(r240, r241).
shared_edge(r240, r241, 1).
adjacent(r240, r279).
shared_edge(r240, r279, 1).
adjacent(r241, r242).
shared_edge(r241, r242, 1).
adjacent(r241, r280).
shared_edge(r241, r280, 1).
adjacent(r241, r43).
shared_edge(r241, r43, 1).
adjacent(r242, r243).
shared_edge(r242, r243, 1).
adjacent(r242, r280).
shared_edge(r242, r280, 1).
adjacent(r242, r43).
shared_edge(r242, r43, 1).
adjacent(r243, r244).
shared_edge(r243, r244, 1).
adjacent(r243, r281).
shared_edge(r243, r281, 1).
adjacent(r243, r43).
shared_edge(r243, r43, 1).
adjacent(r244, r245).
shared_edge(r244, r245, 1).
adjacent(r244, r282).
shared_edge(r244, r282, 1).
adjacent(r245, r246).
shared_edge(r245, r246, 1).
adjacent(r245, r283).
shared_edge(r245, r283, 1).
adjacent(r246, r247).
shared_edge(r246, r247, 2).
adjacent(r246, r284).
shared_edge(r246, r284, 2).
adjacent(r246, r285).
shared_edge(r246, r285, 2).
adjacent(r246, r305).
shared_edge(r246, r305, 1).
adjacent(r246, r306).
shared_edge(r246, r306, 1).
adjacent(r246, r330).
shared_edge(r246, r330, 1).
adjacent(r246, r333).
shared_edge(r246, r333, 1).
adjacent(r246, r334).
shared_edge(r246, r334, 1).
adjacent(r247, r248).
shared_edge(r247, r248, 1).
adjacent(r248, r249).
shared_edge(r248, r249, 1).
adjacent(r248, r285).
shared_edge(r248, r285, 2).
adjacent(r248, r286).
shared_edge(r248, r286, 1).
adjacent(r248, r306).
shared_edge(r248, r306, 1).
adjacent(r248, r307).
shared_edge(r248, r307, 1).
adjacent(r249, r250).
shared_edge(r249, r250, 1).
adjacent(r249, r286).
shared_edge(r249, r286, 1).
adjacent(r25, r26).
shared_edge(r25, r26, 1).
adjacent(r25, r48).
shared_edge(r25, r48, 1).
adjacent(r25, r49).
shared_edge(r25, r49, 3).
adjacent(r25, r50).
shared_edge(r25, r50, 1).
adjacent(r25, r51).
shared_edge(r25, r51, 1).
adjacent(r25, r52).
shared_edge(r25, r52, 1).
adjacent(r250, r251).
shared_edge(r250, r251, 1).
adjacent(r250, r286).
shared_edge(r250, r286, 2).
adjacent(r250, r287).
shared_edge(r250, r287, 1).
adjacent(r250, r307).
shared_edge(r250, r307, 1).
adjacent(r250, r308).
shared_edge(r250, r308, 1).
adjacent(r250, r335).
shared_edge(r250, r335, 2).
adjacent(r251, r252).
shared_edge(r251, r252, 1).
adjacent(r251, r287).
shared_edge(r251, r287, 1).
adjacent(r252, r253).
shared_edge(r252, r253, 1).
adjacent(r252, r288).
shared_edge(r252, r288, 1).
adjacent(r253, r254).
shared_edge(r253, r254, 1).
adjacent(r253, r289).
shared_edge(r253, r289, 1).
adjacent(r254, r255).
shared_edge(r254, r255, 1).
adjacent(r254, r289).
shared_edge(r254, r289, 1).
adjacent(r255, r256).
shared_edge(r255, r256, 1).
adjacent(r255, r289).
shared_edge(r255, r289, 2).
adjacent(r256, r289).
shared_edge(r256, r289, 1).
adjacent(r257, r258).
shared_edge(r257, r258, 1).
adjacent(r257, r289).
shared_edge(r257, r289, 1).
adjacent(r258, r259).
shared_edge(r258, r259, 1).
adjacent(r258, r289).
shared_edge(r258, r289, 1).
adjacent(r259, r289).
shared_edge(r259, r289, 1).
adjacent(r26, r27).
shared_edge(r26, r27, 1).
adjacent(r26, r52).
shared_edge(r26, r52, 1).
adjacent(r261, r262).
shared_edge(r261, r262, 1).
adjacent(r261, r291).
shared_edge(r261, r291, 1).
adjacent(r262, r263).
shared_edge(r262, r263, 2).
adjacent(r262, r264).
shared_edge(r262, r264, 1).
adjacent(r262, r292).
shared_edge(r262, r292, 3).
adjacent(r262, r315).
shared_edge(r262, r315, 2).
adjacent(r263, r264).
shared_edge(r263, r264, 1).
adjacent(r264, r315).
shared_edge(r264, r315, 1).
adjacent(r267, r294).
shared_edge(r267, r294, 1).
adjacent(r268, r269).
shared_edge(r268, r269, 1).
adjacent(r268, r295).
shared_edge(r268, r295, 1).
adjacent(r27, r28).
shared_edge(r27, r28, 1).
adjacent(r27, r53).
shared_edge(r27, r53, 2).
adjacent(r27, r54).
shared_edge(r27, r54, 1).
adjacent(r270, r271).
shared_edge(r270, r271, 1).
adjacent(r270, r296).
shared_edge(r270, r296, 1).
adjacent(r271, r297).
shared_edge(r271, r297, 1).
adjacent(r272, r273).
shared_edge(r272, r273, 1).
adjacent(r272, r298).
shared_edge(r272, r298, 2).
adjacent(r272, r299).
shared_edge(r272, r299, 1).
adjacent(r272, r327).
shared_edge(r272, r327, 1).
adjacent(r273, r274).
shared_edge(r273, r274, 1).
adjacent(r273, r299).
shared_edge(r273, r299, 1).
adjacent(r274, r300).
shared_edge(r274, r300, 1).
adjacent(r275, r276).
shared_edge(r275, r276, 1).
adjacent(r275, r301).
shared_edge(r275, r301, 1).
adjacent(r276, r277).
shared_edge(r276, r277, 1).
adjacent(r276, r301).
shared_edge(r276, r301, 1).
adjacent(r277, r278).
shared_edge(r277, r278, 1).
adjacent(r277, r302).
shared_edge(r277, r302, 1).
adjacent(r278, r279).
shared_edge(r278, r279, 2).
adjacent(r278, r302).
shared_edge(r278, r302, 1).
adjacent(r278, r303).
shared_edge(r278, r303, 1).
adjacent(r278, r330).
shared_edge(r278, r330, 1).
adjacent(r278, r331).
shared_edge(r278, r331, 1).
adjacent(r278, r332).
shared_edge(r278, r332, 1).
adjacent(r279, r280).
shared_edge(r279, r280, 1).
adjacent(r28, r29).
shared_edge(r28, r29, 1).
adjacent(r28, r55).
shared_edge(r28, r55, 1).
adjacent(r280, r281).
shared_edge(r280, r281, 1).
adjacent(r280, r303).
shared_edge(r280, r303, 2).
adjacent(r281, r282).
shared_edge(r281, r282, 1).
adjacent(r281, r303).
shared_edge(r281, r303, 1).
adjacent(r282, r283).
shared_edge(r282, r283, 1).
adjacent(r282, r304).
shared_edge(r282, r304, 1).
adjacent(r283, r284).
shared_edge(r283, r284, 1).
adjacent(r283, r304).
shared_edge(r283, r304, 1).
adjacent(r283, r305).
shared_edge(r283, r305, 1).
adjacent(r283, r330).
shared_edge(r283, r330, 1).
adjacent(r284, r305).
shared_edge(r284, r305, 1).
adjacent(r287, r288).
shared_edge(r287, r288, 1).
adjacent(r287, r308).
shared_edge(r287, r308, 1).
adjacent(r288, r289).
shared_edge(r288, r289, 1).
adjacent(r288, r309).
shared_edge(r288, r309, 1).
adjacent(r289, r290).
shared_edge(r289, r290, 1).
adjacent(r289, r309).
shared_edge(r289, r309, 1).
adjacent(r289, r310).
shared_edge(r289, r310, 3).
adjacent(r289, r311).
shared_edge(r289, r311, 4).
adjacent(r289, r312).
shared_edge(r289, r312, 1).
adjacent(r289, r313).
shared_edge(r289, r313, 2).
adjacent(r289, r318).
shared_edge(r289, r318, 1).
adjacent(r289, r336).
shared_edge(r289, r336, 1).
adjacent(r289, r337).
shared_edge(r289, r337, 1).
adjacent(r29, r30).
shared_edge(r29, r30, 1).
adjacent(r29, r56).
shared_edge(r29, r56, 1).
adjacent(r290, r313).
shared_edge(r290, r313, 1).
adjacent(r290, r314).
shared_edge(r290, r314, 1).
adjacent(r291, r292).
shared_edge(r291, r292, 1).
adjacent(r292, r314).
shared_edge(r292, r314, 2).
adjacent(r293, r294).
shared_edge(r293, r294, 1).
adjacent(r293, r320).
shared_edge(r293, r320, 1).
adjacent(r294, r321).
shared_edge(r294, r321, 1).
adjacent(r295, r323).
shared_edge(r295, r323, 1).
adjacent(r296, r297).
shared_edge(r296, r297, 1).
adjacent(r296, r326).
shared_edge(r296, r326, 1).
adjacent(r297, r298).
shared_edge(r297, r298, 1).
adjacent(r297, r326).
shared_edge(r297, r326, 2).
adjacent(r298, r327).
shared_edge(r298, r327, 1).
adjacent(r299, r300).
shared_edge(r299, r300, 1).
adjacent(r299, r318).
shared_edge(r299, r318, 1).
adjacent(r30, r31).
shared_edge(r30, r31, 1).
adjacent(r30, r57).
shared_edge(r30, r57, 1).
adjacent(r300, r328).
shared_edge(r300, r328, 1).
adjacent(r301, r302).
shared_edge(r301, r302, 1).
adjacent(r301, r318).
shared_edge(r301, r318, 1).
adjacent(r301, r330).
shared_edge(r301, r330, 1).
adjacent(r302, r330).
shared_edge(r302, r330, 1).
adjacent(r303, r304).
shared_edge(r303, r304, 1).
adjacent(r303, r330).
shared_edge(r303, r330, 3).
adjacent(r304, r330).
shared_edge(r304, r330, 1).
adjacent(r305, r330).
shared_edge(r305, r330, 1).
adjacent(r306, r307).
shared_edge(r306, r307, 1).
adjacent(r306, r330).
shared_edge(r306, r330, 1).
adjacent(r307, r330).
shared_edge(r307, r330, 1).
adjacent(r308, r309).
shared_edge(r308, r309, 1).
adjacent(r308, r336).
shared_edge(r308, r336, 1).
adjacent(r309, r336).
shared_edge(r309, r336, 1).
adjacent(r31, r32).
shared_edge(r31, r32, 1).
adjacent(r31, r58).
shared_edge(r31, r58, 1).
adjacent(r310, r318).
shared_edge(r310, r318, 1).
adjacent(r311, r312).
shared_edge(r311, r312, 1).
adjacent(r311, r338).
shared_edge(r311, r338, 1).
adjacent(r311, r339).
shared_edge(r311, r339, 2).
adjacent(r312, r313).
shared_edge(r312, r313, 1).
adjacent(r312, r314).
shared_edge(r312, r314, 1).
adjacent(r313, r314).
shared_edge(r313, r314, 2).
adjacent(r314, r315).
shared_edge(r314, r315, 10).
adjacent(r314, r318).
shared_edge(r314, r318, 3).
adjacent(r314, r338).
shared_edge(r314, r338, 18).
adjacent(r314, r339).
shared_edge(r314, r339, 1).
adjacent(r314, r346).
shared_edge(r314, r346, 3).
adjacent(r314, r349).
shared_edge(r314, r349, 2).
adjacent(r314, r353).
shared_edge(r314, r353, 3).
adjacent(r314, r354).
shared_edge(r314, r354, 2).
adjacent(r314, r365).
shared_edge(r314, r365, 4).
adjacent(r314, r366).
shared_edge(r314, r366, 22).
adjacent(r314, r368).
shared_edge(r314, r368, 1).
adjacent(r314, r377).
shared_edge(r314, r377, 2).
adjacent(r314, r385).
shared_edge(r314, r385, 20).
adjacent(r315, r316).
shared_edge(r315, r316, 2).
adjacent(r315, r317).
shared_edge(r315, r317, 1).
adjacent(r315, r318).
shared_edge(r315, r318, 2).
adjacent(r316, r317).
shared_edge(r316, r317, 1).
adjacent(r317, r318).
shared_edge(r317, r318, 1).
adjacent(r318, r319).
shared_edge(r318, r319, 3).
adjacent(r318, r320).
shared_edge(r318, r320, 1).
adjacent(r318, r323).
shared_edge(r318, r323, 2).
adjacent(r318, r324).
shared_edge(r318, r324, 2).
adjacent(r318, r325).
shared_edge(r318, r325, 1).
adjacent(r318, r327).
shared_edge(r318, r327, 3).
adjacent(r318, r328).
shared_edge(r318, r328, 2).
adjacent(r318, r329).
shared_edge(r318, r329, 2).
adjacent(r318, r330).
shared_edge(r318, r330, 25).
adjacent(r318, r335).
shared_edge(r318, r335, 2).
adjacent(r318, r336).
shared_edge(r318, r336, 6).
adjacent(r318, r337).
shared_edge(r318, r337, 2).
adjacent(r318, r338).
shared_edge(r318, r338, 9).
adjacent(r318, r341).
shared_edge(r318, r341, 2).
adjacent(r318, r342).
shared_edge(r318, r342, 7).
adjacent(r318, r346).
shared_edge(r318, r346, 3).
adjacent(r318, r347).
shared_edge(r318, r347, 7).
adjacent(r318, r349).
shared_edge(r318, r349, 2).
adjacent(r318, r353).
shared_edge(r318, r353, 3).
adjacent(r318, r354).
shared_edge(r318, r354, 4).
adjacent(r318, r355).
shared_edge(r318, r355, 4).
adjacent(r318, r365).
shared_edge(r318, r365, 2).
adjacent(r318, r366).
shared_edge(r318, r366, 20).
adjacent(r318, r367).
shared_edge(r318, r367, 4).
adjacent(r318, r368).
shared_edge(r318, r368, 3).
adjacent(r318, r377).
shared_edge(r318, r377, 2).
adjacent(r318, r385).
shared_edge(r318, r385, 16).
adjacent(r32, r33).
shared_edge(r32, r33, 1).
adjacent(r32, r59).
shared_edge(r32, r59, 1).
adjacent(r32, r60).
shared_edge(r32, r60, 1).
adjacent(r320, r321).
shared_edge(r320, r321, 1).
adjacent(r320, r322).
shared_edge(r320, r322, 1).
adjacent(r320, r341).
shared_edge(r320, r341, 1).
adjacent(r321, r322).
shared_edge(r321, r322, 3).
adjacent(r322, r323).
shared_edge(r322, r323, 3).
adjacent(r322, r341).
shared_edge(r322, r341, 1).
adjacent(r322, r347).
shared_edge(r322, r347, 5).
adjacent(r323, r324).
shared_edge(r323, r324, 1).
adjacent(r324, r325).
shared_edge(r324, r325, 1).
adjacent(r325, r326).
shared_edge(r325, r326, 1).
adjacent(r326, r327).
shared_edge(r326, r327, 1).
adjacent(r326, r342).
shared_edge(r326, r342, 3).
adjacent(r328, r329).
shared_edge(r328, r329, 1).
adjacent(r33, r34).
shared_edge(r33, r34, 1).
adjacent(r33, r61).
shared_edge(r33, r61, 3).
adjacent(r33, r62).
shared_edge(r33, r62, 2).
adjacent(r33, r82).
shared_edge(r33, r82, 1).
adjacent(r330, r331).
shared_edge(r330, r331, 2).
adjacent(r330, r332).
shared_edge(r330, r332, 3).
adjacent(r330, r333).
shared_edge(r330, r333, 2).
adjacent(r330, r334).
shared_edge(r330, r334, 2).
adjacent(r330, r335).
shared_edge(r330, r335, 1).
adjacent(r330, r343).
shared_edge(r330, r343, 3).
adjacent(r331, r343).
shared_edge(r331, r343, 1).
adjacent(r333, r334).
shared_edge(r333, r334, 1).
adjacent(r335, r336).
shared_edge(r335, r336, 1).
adjacent(r337, r338).
shared_edge(r337, r338, 1).
adjacent(r338, r339).
shared_edge(r338, r339, 3).
adjacent(r34, r35).
shared_edge(r34, r35, 3).
adjacent(r34, r36).
shared_edge(r34, r36, 7).
adjacent(r34, r63).
shared_edge(r34, r63, 2).
adjacent(r34, r83).
shared_edge(r34, r83, 1).
adjacent(r34, r95).
shared_edge(r34, r95, 1).
adjacent(r340, r344).
shared_edge(r340, r344, 3).
adjacent(r340, r345).
shared_edge(r340, r345, 1).
adjacent(r340, r348).
shared_edge(r340, r348, 2).
adjacent(r340, r350).
shared_edge(r340, r350, 8).
adjacent(r340, r360).
shared_edge(r340, r360, 2).
adjacent(r340, r361).
shared_edge(r340, r361, 1).
adjacent(r340, r382).
shared_edge(r340, r382, 26).
adjacent(r340, r388).
shared_edge(r340, r388, 24).
adjacent(r344, r345).
shared_edge(r344, r345, 1).
adjacent(r344, r6).
shared_edge(r344, r6, 1).
adjacent(r345, r6).
shared_edge(r345, r6, 2).
adjacent(r348, r361).
shared_edge(r348, r361, 1).
adjacent(r348, r370).
shared_edge(r348, r370, 1).
adjacent(r348, r371).
shared_edge(r348, r371, 1).
adjacent(r348, r382).
shared_edge(r348, r382, 1).
adjacent(r348, r6).
shared_edge(r348, r6, 1).
adjacent(r348, r66).
shared_edge(r348, r66, 3).
adjacent(r350, r360).
shared_edge(r350, r360, 2).
adjacent(r350, r361).
shared_edge(r350, r361, 1).
adjacent(r350, r370).
shared_edge(r350, r370, 1).
adjacent(r350, r380).
shared_edge(r350, r380, 2).
adjacent(r351, r362).
shared_edge(r351, r362, 1).
adjacent(r351, r372).
shared_edge(r351, r372, 2).
adjacent(r351, r66).
shared_edge(r351, r66, 5).
adjacent(r352, r362).
shared_edge(r352, r362, 1).
adjacent(r352, r66).
shared_edge(r352, r66, 3).
adjacent(r356, r357).
shared_edge(r356, r357, 25).
adjacent(r357, r358).
shared_edge(r357, r358, 1).
adjacent(r357, r359).
shared_edge(r357, r359, 32).
adjacent(r357, r369).
shared_edge(r357, r369, 1).
adjacent(r357, r378).
shared_edge(r357, r378, 3).
adjacent(r357, r391).
shared_edge(r357, r391, 14).
adjacent(r358, r369).
shared_edge(r358, r369, 2).
adjacent(r359, r369).
shared_edge(r359, r369, 4).
adjacent(r359, r379).
shared_edge(r359, r379, 10).
adjacent(r359, r392).
shared_edge(r359, r392, 17).
adjacent(r36, r37).
shared_edge(r36, r37, 1).
adjacent(r36, r64).
shared_edge(r36, r64, 3).
adjacent(r36, r95).
shared_edge(r36, r95, 1).
adjacent(r36, r96).
shared_edge(r36, r96, 4).
adjacent(r36, r97).
shared_edge(r36, r97, 1).
adjacent(r36, r98).
shared_edge(r36, r98, 1).
adjacent(r361, r370).
shared_edge(r361, r370, 1).
adjacent(r362, r363).
shared_edge(r362, r363, 1).
adjacent(r362, r373).
shared_edge(r362, r373, 1).
adjacent(r362, r374).
shared_edge(r362, r374, 1).
adjacent(r362, r66).
shared_edge(r362, r66, 1).
adjacent(r363, r364).
shared_edge(r363, r364, 1).
adjacent(r363, r374).
shared_edge(r363, r374, 1).
adjacent(r363, r66).
shared_edge(r363, r66, 1).
adjacent(r364, r375).
shared_edge(r364, r375, 1).
adjacent(r369, r378).
shared_edge(r369, r378, 1).
adjacent(r37, r38).
shared_edge(r37, r38, 1).
adjacent(r37, r64).
shared_edge(r37, r64, 1).
adjacent(r370, r381).
shared_edge(r370, r381, 1).
adjacent(r371, r372).
shared_edge(r371, r372, 1).
adjacent(r371, r382).
shared_edge(r371, r382, 1).
adjacent(r371, r66).
shared_edge(r371, r66, 1).
adjacent(r372, r373).
shared_edge(r372, r373, 2).
adjacent(r372, r374).
shared_edge(r372, r374, 2).
adjacent(r372, r375).
shared_edge(r372, r375, 1).
adjacent(r372, r382).
shared_edge(r372, r382, 14).
adjacent(r372, r383).
shared_edge(r372, r383, 2).
adjacent(r372, r384).
shared_edge(r372, r384, 1).
adjacent(r372, r386).
shared_edge(r372, r386, 5).
adjacent(r373, r374).
shared_edge(r373, r374, 1).
adjacent(r374, r375).
shared_edge(r374, r375, 1).
adjacent(r374, r383).
shared_edge(r374, r383, 2).
adjacent(r38, r39).
shared_edge(r38, r39, 1).
adjacent(r38, r64).
shared_edge(r38, r64, 1).
adjacent(r380, r381).
shared_edge(r380, r381, 1).
adjacent(r380, r382).
shared_edge(r380, r382, 1).
adjacent(r381, r382).
shared_edge(r381, r382, 2).
adjacent(r382, r390).
shared_edge(r382, r390, 3).
adjacent(r382, r393).
shared_edge(r382, r393, 14).
adjacent(r384, r386).
shared_edge(r384, r386, 1).
adjacent(r386, r387).
shared_edge(r386, r387, 3).
adjacent(r386, r389).
shared_edge(r386, r389, 1).
adjacent(r39, r40).
shared_edge(r39, r40, 2).
adjacent(r39, r64).
shared_edge(r39, r64, 1).
adjacent(r39, r65).
shared_edge(r39, r65, 3).
adjacent(r39, r84).
shared_edge(r39, r84, 2).
adjacent(r4, r5).
shared_edge(r4, r5, 15).
adjacent(r40, r41).
shared_edge(r40, r41, 5).
adjacent(r41, r42).
shared_edge(r41, r42, 20).
adjacent(r41, r84).
shared_edge(r41, r84, 1).
adjacent(r41, r98).
shared_edge(r41, r98, 5).
adjacent(r43, r44).
shared_edge(r43, r44, 12).
adjacent(r43, r70).
shared_edge(r43, r70, 1).
adjacent(r43, r85).
shared_edge(r43, r85, 2).
adjacent(r43, r86).
shared_edge(r43, r86, 3).
adjacent(r43, r87).
shared_edge(r43, r87, 1).
adjacent(r43, r88).
shared_edge(r43, r88, 1).
adjacent(r43, r89).
shared_edge(r43, r89, 1).
adjacent(r43, r99).
shared_edge(r43, r99, 2).
adjacent(r44, r45).
shared_edge(r44, r45, 2).
adjacent(r44, r70).
shared_edge(r44, r70, 1).
adjacent(r45, r46).
shared_edge(r45, r46, 1).
adjacent(r46, r47).
shared_edge(r46, r47, 1).
adjacent(r46, r70).
shared_edge(r46, r70, 1).
adjacent(r47, r48).
shared_edge(r47, r48, 1).
adjacent(r47, r71).
shared_edge(r47, r71, 1).
adjacent(r48, r71).
shared_edge(r48, r71, 1).
adjacent(r49, r50).
shared_edge(r49, r50, 1).
adjacent(r49, r71).
shared_edge(r49, r71, 1).
adjacent(r49, r72).
shared_edge(r49, r72, 1).
adjacent(r49, r86).
shared_edge(r49, r86, 2).
adjacent(r5, r6).
shared_edge(r5, r6, 19).
adjacent(r50, r51).
shared_edge(r50, r51, 1).
adjacent(r50, r72).
shared_edge(r50, r72, 1).
adjacent(r51, r52).
shared_edge(r51, r52, 1).
adjacent(r51, r73).
shared_edge(r51, r73, 1).
adjacent(r52, r53).
shared_edge(r52, r53, 1).
adjacent(r52, r74).
shared_edge(r52, r74, 2).
adjacent(r53, r54).
shared_edge(r53, r54, 1).
adjacent(r53, r75).
shared_edge(r53, r75, 1).
adjacent(r53, r76).
shared_edge(r53, r76, 1).
adjacent(r54, r55).
shared_edge(r54, r55, 1).
adjacent(r54, r77).
shared_edge(r54, r77, 1).
adjacent(r55, r56).
shared_edge(r55, r56, 1).
adjacent(r55, r78).
shared_edge(r55, r78, 1).
adjacent(r56, r57).
shared_edge(r56, r57, 1).
adjacent(r56, r79).
shared_edge(r56, r79, 1).
adjacent(r57, r58).
shared_edge(r57, r58, 1).
adjacent(r57, r80).
shared_edge(r57, r80, 1).
adjacent(r58, r59).
shared_edge(r58, r59, 1).
adjacent(r58, r80).
shared_edge(r58, r80, 1).
adjacent(r59, r60).
shared_edge(r59, r60, 1).
adjacent(r59, r80).
shared_edge(r59, r80, 1).
adjacent(r6, r66).
shared_edge(r6, r66, 42).
adjacent(r6, r7).
shared_edge(r6, r7, 2).
adjacent(r60, r61).
shared_edge(r60, r61, 1).
adjacent(r60, r80).
shared_edge(r60, r80, 1).
adjacent(r61, r80).
shared_edge(r61, r80, 1).
adjacent(r61, r81).
shared_edge(r61, r81, 1).
adjacent(r62, r63).
shared_edge(r62, r63, 1).
adjacent(r62, r83).
shared_edge(r62, r83, 1).
adjacent(r63, r83).
shared_edge(r63, r83, 1).
adjacent(r64, r84).
shared_edge(r64, r84, 1).
adjacent(r64, r97).
shared_edge(r64, r97, 1).
adjacent(r65, r84).
shared_edge(r65, r84, 1).
adjacent(r66, r7).
shared_edge(r66, r7, 4).
adjacent(r67, r68).
shared_edge(r67, r68, 2).
adjacent(r67, r69).
shared_edge(r67, r69, 2).
adjacent(r67, r7).
shared_edge(r67, r7, 4).
adjacent(r67, r9).
shared_edge(r67, r9, 1).
adjacent(r68, r69).
shared_edge(r68, r69, 3).
adjacent(r7, r8).
shared_edge(r7, r8, 2).
adjacent(r7, r9).
shared_edge(r7, r9, 1).
adjacent(r70, r71).
shared_edge(r70, r71, 1).
adjacent(r71, r85).
shared_edge(r71, r85, 1).
adjacent(r71, r86).
shared_edge(r71, r86, 1).
adjacent(r72, r73).
shared_edge(r72, r73, 1).
adjacent(r72, r87).
shared_edge(r72, r87, 1).
adjacent(r73, r74).
shared_edge(r73, r74, 1).
adjacent(r73, r88).
shared_edge(r73, r88, 1).
adjacent(r74, r75).
shared_edge(r74, r75, 1).
adjacent(r74, r89).
shared_edge(r74, r89, 2).
adjacent(r75, r76).
shared_edge(r75, r76, 1).
adjacent(r75, r90).
shared_edge(r75, r90, 1).
adjacent(r76, r77).
shared_edge(r76, r77, 1).
adjacent(r76, r91).
shared_edge(r76, r91, 1).
adjacent(r77, r78).
shared_edge(r77, r78, 1).
adjacent(r77, r91).
shared_edge(r77, r91, 1).
adjacent(r77, r92).
shared_edge(r77, r92, 1).
adjacent(r78, r79).
shared_edge(r78, r79, 1).
adjacent(r78, r92).
shared_edge(r78, r92, 1).
adjacent(r79, r80).
shared_edge(r79, r80, 1).
adjacent(r79, r93).
shared_edge(r79, r93, 1).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r80, r81).
shared_edge(r80, r81, 2).
adjacent(r80, r83).
shared_edge(r80, r83, 2).
adjacent(r80, r93).
shared_edge(r80, r93, 1).
adjacent(r80, r94).
shared_edge(r80, r94, 3).
adjacent(r80, r95).
shared_edge(r80, r95, 2).
adjacent(r81, r82).
shared_edge(r81, r82, 1).
adjacent(r82, r83).
shared_edge(r82, r83, 1).
adjacent(r82, r94).
shared_edge(r82, r94, 1).
adjacent(r84, r98).
shared_edge(r84, r98, 3).
adjacent(r85, r86).
shared_edge(r85, r86, 1).
adjacent(r86, r87).
shared_edge(r86, r87, 1).
adjacent(r87, r88).
shared_edge(r87, r88, 1).
adjacent(r88, r89).
shared_edge(r88, r89, 1).
adjacent(r89, r90).
shared_edge(r89, r90, 1).
adjacent(r89, r99).
shared_edge(r89, r99, 1).
adjacent(r90, r91).
shared_edge(r90, r91, 1).
adjacent(r92, r93).
shared_edge(r92, r93, 1).
adjacent(r97, r98).
shared_edge(r97, r98, 1).
