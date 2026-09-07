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

region(r1, '#a0a9ad', 18, centroid(3,1)).
polygon(r1, [xy(0,0),xy(0,3),xy(1,2),xy(2,2),xy(3,1),xy(2,0),xy(4,0),xy(4,1),xy(5,0),xy(8,0),xy(0,0)]).
midline(r1, [xy(1,1),xy(2,1)]).
fillpoint(r1, xy(2,1), 2).
fillpoint(r1, xy(1,1), 2).
fillpoint(r1, xy(8,0), 1).
fillpoint(r1, xy(7,0), 1).
fillpoint(r1, xy(6,0), 1).
region(r2, '#b1babe', 54, centroid(6,3)).
polygon(r2, [xy(0,4),xy(0,8),xy(1,7),xy(1,8),xy(2,6),xy(3,6),xy(5,4),xy(7,4),xy(8,3),xy(9,3),xy(10,2),xy(11,2),xy(12,1),xy(11,0),xy(9,0),xy(8,1),xy(5,1),xy(4,2),xy(3,2),xy(2,3),xy(1,3),xy(0,4)]).
midline(r2, [xy(1,4),xy(1,6),xy(5,2),xy(5,3),xy(6,2),xy(6,3),xy(7,2),xy(7,3),xy(9,1),xy(9,2),xy(10,1),xy(11,1)]).
fillpoint(r2, xy(3,4), 3).
fillpoint(r2, xy(11,1), 2).
fillpoint(r2, xy(10,1), 2).
fillpoint(r2, xy(9,2), 2).
fillpoint(r2, xy(9,1), 2).
region(r4, '#bbc5c8', 4, centroid(16,1)).
polygon(r4, [xy(15,1),xy(16,0),xy(16,1),xy(17,0),xy(15,1)]).
fillpoint(r4, xy(17,0), 1).
fillpoint(r4, xy(16,1), 1).
fillpoint(r4, xy(16,0), 1).
fillpoint(r4, xy(15,1), 1).
region(r5, '#c1cbce', 16, centroid(19,1)).
polygon(r5, [xy(14,3),xy(15,2),xy(15,3),xy(17,1),xy(17,2),xy(18,1),xy(18,0),xy(19,0),xy(19,1),xy(20,0),xy(20,1),xy(21,0),xy(24,0),xy(14,3)]).
fillpoint(r5, xy(24,0), 1).
fillpoint(r5, xy(23,0), 1).
fillpoint(r5, xy(22,0), 1).
fillpoint(r5, xy(21,0), 1).
fillpoint(r5, xy(20,1), 1).
region(r6, '#c5cfd2', 14, centroid(23,1)).
polygon(r6, [xy(18,2),xy(20,2),xy(21,1),xy(21,2),xy(22,1),xy(24,1),xy(25,0),xy(26,0),xy(26,1),xy(27,0),xy(18,2)]).
midline(r6, [xy(25,1)]).
fillpoint(r6, xy(25,1), 2).
fillpoint(r6, xy(27,0), 1).
fillpoint(r6, xy(26,1), 1).
fillpoint(r6, xy(26,0), 1).
fillpoint(r6, xy(25,2), 1).
region(r11, '#c1cbce', 14, centroid(33,1)).
polygon(r11, [xy(29,2),xy(30,2),xy(31,1),xy(31,2),xy(33,0),xy(33,1),xy(34,0),xy(34,1),xy(35,0),xy(35,1),xy(36,0),xy(38,0),xy(29,2)]).
fillpoint(r11, xy(38,0), 1).
fillpoint(r11, xy(37,0), 1).
fillpoint(r11, xy(36,0), 1).
fillpoint(r11, xy(35,1), 1).
fillpoint(r11, xy(35,0), 1).
region(r12, '#c5cfd2', 17, centroid(34,2)).
polygon(r12, [xy(28,3),xy(28,4),xy(29,3),xy(31,3),xy(32,2),xy(32,3),xy(33,2),xy(35,2),xy(36,1),xy(36,2),xy(37,1),xy(38,1),xy(39,0),xy(39,1),xy(40,0),xy(28,3)]).
fillpoint(r12, xy(40,0), 1).
fillpoint(r12, xy(39,1), 1).
fillpoint(r12, xy(39,0), 1).
fillpoint(r12, xy(38,1), 1).
fillpoint(r12, xy(37,1), 1).
region(r13, '#c8d2d5', 63, centroid(46,2)).
polygon(r13, [xy(28,5),xy(28,6),xy(29,5),xy(29,4),xy(30,4),xy(30,5),xy(31,4),xy(31,5),xy(33,3),xy(33,4),xy(34,3),xy(36,3),xy(37,2),xy(37,3),xy(38,2),xy(38,3),xy(40,1),xy(40,2),xy(42,2),xy(43,1),xy(42,0),xy(44,0),xy(44,1),xy(45,0),xy(45,1),xy(46,0),xy(46,1),xy(47,0),xy(52,0),xy(52,1),xy(53,0),xy(56,0),xy(56,1),xy(57,0),xy(57,1),xy(58,0),xy(59,0),xy(60,1),xy(59,2),xy(60,2),xy(60,3),xy(61,1),xy(62,1),xy(62,2),xy(64,2),xy(28,5)]).
midline(r13, [xy(41,1),xy(42,1)]).
midline(r13, [xy(58,1),xy(59,1)]).
fillpoint(r13, xy(59,1), 2).
fillpoint(r13, xy(58,1), 2).
fillpoint(r13, xy(42,1), 2).
fillpoint(r13, xy(41,1), 2).
fillpoint(r13, xy(64,2), 1).
region(r14, '#c5cfd2', 5, centroid(62,0)).
polygon(r14, [xy(60,0),xy(63,0),xy(63,1),xy(60,0)]).
fillpoint(r14, xy(63,1), 1).
fillpoint(r14, xy(63,0), 1).
fillpoint(r14, xy(62,0), 1).
fillpoint(r14, xy(61,0), 1).
fillpoint(r14, xy(60,0), 1).
region(r16, '#c5cfd2', 5, centroid(65,1)).
polygon(r16, [xy(65,0),xy(65,2),xy(66,1),xy(66,2),xy(65,0)]).
fillpoint(r16, xy(66,2), 1).
fillpoint(r16, xy(66,1), 1).
fillpoint(r16, xy(65,2), 1).
fillpoint(r16, xy(65,1), 1).
fillpoint(r16, xy(65,0), 1).
region(r19, '#c1cbce', 10, centroid(74,1)).
polygon(r19, [xy(71,0),xy(72,0),xy(72,1),xy(73,0),xy(73,1),xy(74,1),xy(74,2),xy(76,2),xy(76,3),xy(71,0)]).
fillpoint(r19, xy(76,3), 1).
fillpoint(r19, xy(76,2), 1).
fillpoint(r19, xy(75,2), 1).
fillpoint(r19, xy(74,2), 1).
fillpoint(r19, xy(74,1), 1).
region(r20, '#bbc5c8', 30, centroid(81,6)).
polygon(r20, [xy(74,0),xy(75,0),xy(75,1),xy(77,1),xy(77,3),xy(78,2),xy(78,3),xy(79,3),xy(79,4),xy(80,4),xy(80,5),xy(81,5),xy(81,6),xy(82,5),xy(82,8),xy(83,7),xy(83,8),xy(84,8),xy(84,12),xy(85,11),xy(85,12),xy(86,12),xy(74,0)]).
fillpoint(r20, xy(86,12), 1).
fillpoint(r20, xy(85,12), 1).
fillpoint(r20, xy(85,11), 1).
fillpoint(r20, xy(85,9), 1).
fillpoint(r20, xy(84,12), 1).
region(r21, '#b7c1c4', 11, centroid(79,2)).
polygon(r21, [xy(76,0),xy(78,0),xy(78,1),xy(79,1),xy(79,2),xy(80,2),xy(80,3),xy(81,3),xy(81,4),xy(82,4),xy(76,0)]).
fillpoint(r21, xy(82,4), 1).
fillpoint(r21, xy(81,4), 1).
fillpoint(r21, xy(81,3), 1).
fillpoint(r21, xy(80,3), 1).
fillpoint(r21, xy(80,2), 1).
region(r22, '#b1babe', 96, centroid(89,7)).
polygon(r22, [xy(79,0),xy(80,0),xy(80,1),xy(81,0),xy(83,0),xy(84,1),xy(85,1),xy(88,4),xy(90,4),xy(91,5),xy(92,5),xy(93,6),xy(94,6),xy(95,7),xy(95,9),xy(94,10),xy(93,10),xy(92,11),xy(91,11),xy(90,10),xy(91,9),xy(90,8),xy(89,8),xy(87,6),xy(86,6),xy(84,4),xy(83,4),xy(81,2),xy(79,0)]).
midline(r22, [xy(81,1),xy(85,3),xy(86,4)]).
midline(r22, [xy(89,6),xy(90,6),xy(91,7),xy(92,7),xy(92,8),xy(93,8),xy(91,10),xy(92,10),xy(92,12),xy(93,13),xy(94,13),xy(94,15)]).
fillpoint(r22, xy(93,8), 3).
fillpoint(r22, xy(92,8), 3).
fillpoint(r22, xy(92,7), 3).
fillpoint(r22, xy(91,7), 3).
fillpoint(r22, xy(90,6), 3).
region(r23, '#a0a9ad', 48, centroid(91,2)).
polygon(r23, [xy(84,0),xy(86,0),xy(86,1),xy(87,0),xy(95,0),xy(95,4),xy(94,5),xy(93,5),xy(92,4),xy(91,4),xy(90,3),xy(88,3),xy(87,2),xy(84,0)]).
midline(r23, [xy(87,1),xy(88,1),xy(88,2),xy(89,1),xy(89,2),xy(93,2),xy(93,3)]).
fillpoint(r23, xy(93,3), 3).
fillpoint(r23, xy(93,2), 3).
fillpoint(r23, xy(92,2), 3).
fillpoint(r23, xy(91,2), 3).
fillpoint(r23, xy(94,4), 2).
region(r28, '#cbd5d7', 5, centroid(49,1)).
polygon(r28, [xy(47,1),xy(51,1),xy(47,1)]).
fillpoint(r28, xy(51,1), 1).
fillpoint(r28, xy(50,1), 1).
fillpoint(r28, xy(49,1), 1).
fillpoint(r28, xy(48,1), 1).
fillpoint(r28, xy(47,1), 1).
region(r40, '#cbd5d7', 4, centroid(45,2)).
polygon(r40, [xy(43,2),xy(46,2),xy(43,2)]).
fillpoint(r40, xy(46,2), 1).
fillpoint(r40, xy(45,2), 1).
fillpoint(r40, xy(44,2), 1).
fillpoint(r40, xy(43,2), 1).
region(r41, '#cdd7da', 71, centroid(47,4)).
polygon(r41, [xy(31,6),xy(32,6),xy(32,8),xy(34,6),xy(33,5),xy(35,5),xy(35,6),xy(36,5),xy(37,5),xy(38,4),xy(38,5),xy(39,4),xy(39,5),xy(40,4),xy(40,5),xy(42,3),xy(42,4),xy(43,3),xy(43,4),xy(44,3),xy(44,4),xy(45,3),xy(45,4),xy(46,3),xy(46,4),xy(53,4),xy(55,6),xy(56,5),xy(56,6),xy(57,4),xy(57,3),xy(56,2),xy(47,2),xy(31,6)]).
midline(r41, [xy(33,6)]).
midline(r41, [xy(47,3),xy(53,3),xy(55,4)]).
fillpoint(r41, xy(55,4), 3).
fillpoint(r41, xy(56,4), 2).
fillpoint(r41, xy(56,3), 2).
fillpoint(r41, xy(55,5), 2).
fillpoint(r41, xy(55,3), 2).
region(r43, '#cbd5d7', 6, centroid(62,3)).
polygon(r43, [xy(61,2),xy(61,4),xy(62,3),xy(64,3),xy(61,2)]).
fillpoint(r43, xy(64,3), 1).
fillpoint(r43, xy(63,3), 1).
fillpoint(r43, xy(62,3), 1).
fillpoint(r43, xy(61,4), 1).
fillpoint(r43, xy(61,3), 1).
region(r44, '#cdd7da', 38, centroid(66,6)).
polygon(r44, [xy(61,5),xy(62,4),xy(65,4),xy(67,6),xy(67,7),xy(66,8),xy(65,8),xy(63,6),xy(62,6),xy(61,5)]).
midline(r44, [xy(62,5),xy(63,5),xy(65,6)]).
midline(r44, [xy(68,6)]).
fillpoint(r44, xy(65,6), 3).
fillpoint(r44, xy(68,6), 2).
fillpoint(r44, xy(66,7), 2).
fillpoint(r44, xy(66,6), 2).
fillpoint(r44, xy(65,7), 2).
region(r51, '#c8d2d5', 8, centroid(18,4)).
polygon(r51, [xy(16,4),xy(16,5),xy(18,3),xy(18,4),xy(19,3),xy(21,3),xy(16,4)]).
fillpoint(r51, xy(21,3), 1).
fillpoint(r51, xy(20,3), 1).
fillpoint(r51, xy(19,3), 1).
fillpoint(r51, xy(18,4), 1).
fillpoint(r51, xy(18,3), 1).
region(r57, '#c8d2d5', 4, centroid(66,3)).
polygon(r57, [xy(65,3),xy(66,3),xy(66,4),xy(67,3),xy(65,3)]).
fillpoint(r57, xy(67,3), 1).
fillpoint(r57, xy(66,4), 1).
fillpoint(r57, xy(66,3), 1).
fillpoint(r57, xy(65,3), 1).
region(r63, '#b7c1c4', 14, centroid(5,6)).
polygon(r63, [xy(2,7),xy(2,8),xy(3,7),xy(3,8),xy(4,7),xy(4,6),xy(5,5),xy(5,6),xy(6,5),xy(6,6),xy(8,4),xy(8,5),xy(9,4),xy(2,7)]).
fillpoint(r63, xy(9,4), 1).
fillpoint(r63, xy(8,5), 1).
fillpoint(r63, xy(8,4), 1).
fillpoint(r63, xy(7,5), 1).
fillpoint(r63, xy(6,6), 1).
region(r64, '#bbc5c8', 12, centroid(8,6)).
polygon(r64, [xy(4,8),xy(5,7),xy(5,8),xy(7,6),xy(7,7),xy(9,5),xy(9,6),xy(10,5),xy(10,4),xy(11,4),xy(4,8)]).
fillpoint(r64, xy(11,4), 1).
fillpoint(r64, xy(10,5), 1).
fillpoint(r64, xy(10,4), 1).
fillpoint(r64, xy(9,6), 1).
fillpoint(r64, xy(9,5), 1).
region(r65, '#c1cbce', 13, centroid(10,6)).
polygon(r65, [xy(6,8),xy(7,8),xy(8,7),xy(8,8),xy(9,7),xy(9,8),xy(10,7),xy(10,6),xy(11,5),xy(11,6),xy(12,5),xy(12,4),xy(13,4),xy(6,8)]).
fillpoint(r65, xy(13,4), 1).
fillpoint(r65, xy(12,5), 1).
fillpoint(r65, xy(12,4), 1).
fillpoint(r65, xy(11,6), 1).
fillpoint(r65, xy(11,5), 1).
region(r68, '#bbc5c8', 25, centroid(18,8)).
polygon(r68, [xy(15,12),xy(16,12),xy(17,11),xy(17,9),xy(16,8),xy(17,8),xy(18,7),xy(17,6),xy(18,6),xy(20,4),xy(20,6),xy(18,8),xy(18,11),xy(19,10),xy(19,11),xy(15,12)]).
fillpoint(r68, xy(21,7), 1).
fillpoint(r68, xy(21,6), 1).
fillpoint(r68, xy(20,7), 1).
fillpoint(r68, xy(20,6), 1).
fillpoint(r68, xy(20,5), 1).
region(r71, '#535556', 337, centroid(27,27)).
polygon(r71, [xy(19,21),xy(19,23),xy(22,23),xy(23,24),xy(23,32),xy(22,33),xy(22,34),xy(20,36),xy(19,36),xy(19,38),xy(20,38),xy(21,39),xy(21,40),xy(30,40),xy(31,39),xy(31,37),xy(32,36),xy(32,33),xy(33,32),xy(33,30),xy(32,29),xy(32,28),xy(34,26),xy(35,26),xy(36,25),xy(36,21),xy(33,18),xy(34,17),xy(34,15),xy(33,14),xy(32,14),xy(31,13),xy(30,14),xy(29,14),xy(28,15),xy(28,18),xy(27,19),xy(26,19),xy(26,20),xy(25,21),xy(24,20),xy(24,17),xy(23,16),xy(22,17),xy(22,18),xy(20,20),xy(19,21)]).
midline(r71, [xy(21,21),xy(22,20),xy(22,21),xy(23,21),xy(23,22),xy(24,22),xy(24,23)]).
midline(r71, [xy(22,37),xy(26,35),xy(27,34),xy(27,33),xy(28,32),xy(28,30)]).
midline(r71, [xy(23,17),xy(23,18)]).
midline(r71, [xy(27,35)]).
midline(r71, [xy(28,27),xy(29,25),xy(29,23),xy(30,22),xy(30,24)]).
midline(r71, [xy(31,16),xy(31,17)]).
fillpoint(r71, xy(30,24), 7).
fillpoint(r71, xy(30,23), 7).
fillpoint(r71, xy(30,22), 7).
fillpoint(r71, xy(29,25), 7).
fillpoint(r71, xy(29,24), 7).
region(r74, '#cbd5d7', 4, centroid(36,4)).
polygon(r74, [xy(34,4),xy(37,4),xy(34,4)]).
fillpoint(r74, xy(37,4), 1).
fillpoint(r74, xy(36,4), 1).
fillpoint(r74, xy(35,4), 1).
fillpoint(r74, xy(34,4), 1).
region(r76, '#d1dbde', 7, centroid(71,5)).
polygon(r76, [xy(70,4),xy(70,5),xy(71,4),xy(72,5),xy(71,6),xy(73,5),xy(70,4)]).
midline(r76, [xy(71,5)]).
fillpoint(r76, xy(71,5), 2).
fillpoint(r76, xy(73,5), 1).
fillpoint(r76, xy(72,5), 1).
fillpoint(r76, xy(71,6), 1).
fillpoint(r76, xy(71,4), 1).
region(r81, '#c1cbce', 71, centroid(85,15)).
polygon(r81, [xy(77,4),xy(78,4),xy(78,5),xy(79,5),xy(79,7),xy(80,6),xy(81,7),xy(80,8),xy(80,9),xy(81,8),xy(82,9),xy(81,10),xy(82,10),xy(83,9),xy(83,11),xy(82,12),xy(82,13),xy(83,12),xy(83,13),xy(85,13),xy(85,14),xy(86,13),xy(87,14),xy(86,15),xy(86,16),xy(88,18),xy(86,20),xy(82,20),xy(77,4)]).
midline(r81, [xy(80,7),xy(81,9)]).
midline(r81, [xy(86,14),xy(87,15),xy(87,16),xy(88,16),xy(88,17),xy(89,17),xy(89,19),xy(88,20),xy(88,21),xy(86,21)]).
fillpoint(r81, xy(89,19), 3).
fillpoint(r81, xy(88,21), 3).
fillpoint(r81, xy(88,20), 3).
fillpoint(r81, xy(90,19), 2).
fillpoint(r81, xy(90,18), 2).
region(r83, '#c8d2d5', 7, centroid(13,7)).
polygon(r83, [xy(11,8),xy(12,7),xy(12,8),xy(13,7),xy(13,6),xy(14,5),xy(14,6),xy(11,8)]).
fillpoint(r83, xy(14,6), 1).
fillpoint(r83, xy(14,5), 1).
fillpoint(r83, xy(13,7), 1).
fillpoint(r83, xy(13,6), 1).
fillpoint(r83, xy(12,8), 1).
region(r89, '#a0a9ad', 6, centroid(23,8)).
polygon(r89, [xy(23,5),xy(23,10),xy(23,5)]).
fillpoint(r89, xy(23,10), 1).
fillpoint(r89, xy(23,9), 1).
fillpoint(r89, xy(23,8), 1).
fillpoint(r89, xy(23,7), 1).
fillpoint(r89, xy(23,6), 1).
region(r93, '#d1dbde', 56, centroid(41,7)).
polygon(r93, [xy(32,9),xy(32,12),xy(33,11),xy(33,12),xy(34,12),xy(34,10),xy(36,8),xy(35,7),xy(34,7),xy(33,8),xy(32,9)]).
midline(r93, [xy(33,9),xy(33,10),xy(34,9),xy(34,8),xy(35,8),xy(36,7),xy(37,7)]).
midline(r93, [xy(41,6)]).
fillpoint(r93, xy(41,6), 2).
fillpoint(r93, xy(37,7), 2).
fillpoint(r93, xy(36,7), 2).
fillpoint(r93, xy(35,8), 2).
fillpoint(r93, xy(34,9), 2).
region(r94, '#d1dbde', 11, centroid(59,6)).
polygon(r94, [xy(57,5),xy(57,6),xy(58,5),xy(59,5),xy(59,6),xy(60,5),xy(61,6),xy(60,7),xy(57,5)]).
midline(r94, [xy(58,6),xy(60,6)]).
fillpoint(r94, xy(60,6), 2).
fillpoint(r94, xy(58,6), 2).
fillpoint(r94, xy(61,6), 1).
fillpoint(r94, xy(60,7), 1).
fillpoint(r94, xy(60,5), 1).
region(r98, '#c5cfd2', 4, centroid(78,6)).
polygon(r98, [xy(77,5),xy(77,6),xy(78,6),xy(78,7),xy(77,5)]).
fillpoint(r98, xy(78,7), 1).
fillpoint(r98, xy(78,6), 1).
fillpoint(r98, xy(77,6), 1).
fillpoint(r98, xy(77,5), 1).
region(r99, '#b7c1c4', 43, centroid(88,10)).
polygon(r99, [xy(83,5),xy(83,6),xy(84,5),xy(85,6),xy(84,7),xy(85,8),xy(86,7),xy(87,7),xy(89,9),xy(89,10),xy(90,9),xy(90,12),xy(89,13),xy(88,12),xy(87,12),xy(85,10),xy(86,9),xy(83,5)]).
midline(r99, [xy(84,6),xy(86,8),xy(87,8),xy(87,10),xy(89,11),xy(89,12),xy(91,14)]).
fillpoint(r99, xy(87,10), 3).
fillpoint(r99, xy(91,14), 2).
fillpoint(r99, xy(90,13), 2).
fillpoint(r99, xy(89,12), 2).
fillpoint(r99, xy(89,11), 2).
region(r106, '#c1cbce', 7, centroid(27,8)).
polygon(r106, [xy(26,7),xy(26,8),xy(27,7),xy(27,9),xy(28,9),xy(26,7)]).
fillpoint(r106, xy(28,9), 1).
fillpoint(r106, xy(27,9), 1).
fillpoint(r106, xy(27,8), 1).
fillpoint(r106, xy(27,7), 1).
fillpoint(r106, xy(27,6), 1).
region(r107, '#cbd5d7', 4, centroid(29,7)).
polygon(r107, [xy(29,6),xy(29,8),xy(30,6),xy(29,6)]).
fillpoint(r107, xy(30,6), 1).
fillpoint(r107, xy(29,8), 1).
fillpoint(r107, xy(29,7), 1).
fillpoint(r107, xy(29,6), 1).
region(r109, '#d6e0e3', 188, centroid(60,13)).
polygon(r109, [xy(46,7),xy(47,7),xy(47,8),xy(48,9),xy(48,10),xy(49,11),xy(50,10),xy(50,11),xy(51,9),xy(53,9),xy(54,10),xy(54,13),xy(55,14),xy(55,16),xy(56,17),xy(57,17),xy(59,19),xy(59,20),xy(60,20),xy(62,18),xy(65,18),xy(66,19),xy(67,19),xy(68,18),xy(68,19),xy(69,17),xy(71,17),xy(72,16),xy(67,11),xy(66,11),xy(65,10),xy(64,10),xy(61,7),xy(60,8),xy(59,7),xy(59,8),xy(60,9),xy(60,10),xy(59,11),xy(57,9),xy(56,9),xy(54,7),xy(50,7),xy(49,6),xy(48,6),xy(46,7)]).
midline(r109, [xy(49,8),xy(49,10),xy(51,8),xy(54,8),xy(54,9),xy(55,9)]).
midline(r109, [xy(57,12),xy(57,13),xy(58,13),xy(60,15),xy(62,13),xy(64,14),xy(65,14),xy(66,15),xy(67,15)]).
midline(r109, [xy(61,8)]).
midline(r109, [xy(71,16)]).
fillpoint(r109, xy(62,13), 6).
fillpoint(r109, xy(61,14), 6).
fillpoint(r109, xy(60,15), 6).
fillpoint(r109, xy(67,15), 5).
fillpoint(r109, xy(66,15), 5).
region(r110, '#d6e0e3', 6, centroid(73,7)).
polygon(r110, [xy(72,6),xy(72,7),xy(73,6),xy(73,8),xy(74,8),xy(72,6)]).
fillpoint(r110, xy(74,8), 1).
fillpoint(r110, xy(73,8), 1).
fillpoint(r110, xy(73,7), 1).
fillpoint(r110, xy(73,6), 1).
fillpoint(r110, xy(72,7), 1).
region(r122, '#d6e0e3', 41, centroid(39,10)).
polygon(r122, [xy(34,11),xy(36,9),xy(37,9),xy(38,8),xy(41,8),xy(41,10),xy(42,11),xy(40,13),xy(36,13),xy(35,12),xy(34,11)]).
midline(r122, [xy(36,11),xy(37,11),xy(38,10),xy(38,11),xy(39,10),xy(39,11),xy(40,11)]).
fillpoint(r122, xy(40,11), 3).
fillpoint(r122, xy(39,11), 3).
fillpoint(r122, xy(39,10), 3).
fillpoint(r122, xy(38,11), 3).
fillpoint(r122, xy(38,10), 3).
region(r125, '#cdd7da', 4, centroid(58,8)).
polygon(r125, [xy(57,7),xy(57,8),xy(58,8),xy(58,9),xy(57,7)]).
fillpoint(r125, xy(58,9), 1).
fillpoint(r125, xy(58,8), 1).
fillpoint(r125, xy(57,8), 1).
fillpoint(r125, xy(57,7), 1).
region(r126, '#d1dbde', 6, centroid(64,8)).
polygon(r126, [xy(62,7),xy(63,7),xy(63,8),xy(64,8),xy(64,9),xy(65,9),xy(62,7)]).
fillpoint(r126, xy(65,9), 1).
fillpoint(r126, xy(64,9), 1).
fillpoint(r126, xy(64,8), 1).
fillpoint(r126, xy(63,8), 1).
fillpoint(r126, xy(63,7), 1).
region(r127, '#cbd5d7', 5, centroid(68,8)).
polygon(r127, [xy(67,8),xy(68,8),xy(69,7),xy(69,9),xy(67,8)]).
fillpoint(r127, xy(69,9), 1).
fillpoint(r127, xy(69,8), 1).
fillpoint(r127, xy(69,7), 1).
fillpoint(r127, xy(68,8), 1).
fillpoint(r127, xy(67,8), 1).
region(r132, '#b7c1c4', 27, centroid(12,11)).
polygon(r132, [xy(7,14),xy(7,15),xy(9,13),xy(9,14),xy(10,13),xy(10,12),xy(11,11),xy(12,11),xy(15,8),xy(16,9),xy(16,10),xy(14,12),xy(13,12),xy(12,13),xy(11,13),xy(7,14)]).
midline(r132, [xy(11,12),xy(12,12),xy(14,10),xy(14,11),xy(15,10),xy(15,9)]).
fillpoint(r132, xy(15,10), 2).
fillpoint(r132, xy(15,9), 2).
fillpoint(r132, xy(14,11), 2).
fillpoint(r132, xy(14,10), 2).
fillpoint(r132, xy(13,11), 2).
region(r133, '#c1cbce', 4, centroid(20,8)).
polygon(r133, [xy(19,8),xy(19,9),xy(20,8),xy(21,8),xy(19,8)]).
fillpoint(r133, xy(21,8), 1).
fillpoint(r133, xy(20,8), 1).
fillpoint(r133, xy(19,9), 1).
fillpoint(r133, xy(19,8), 1).
region(r135, '#b1babe', 6, centroid(25,11)).
polygon(r135, [xy(25,8),xy(25,13),xy(25,8)]).
fillpoint(r135, xy(25,13), 1).
fillpoint(r135, xy(25,12), 1).
fillpoint(r135, xy(25,11), 1).
fillpoint(r135, xy(25,10), 1).
fillpoint(r135, xy(25,9), 1).
region(r143, '#c8d2d5', 22, centroid(75,12)).
polygon(r143, [xy(70,8),xy(70,9),xy(71,9),xy(71,10),xy(73,10),xy(73,11),xy(75,11),xy(75,14),xy(76,14),xy(76,15),xy(77,13),xy(77,12),xy(76,11),xy(77,11),xy(78,13),xy(79,13),xy(70,8)]).
midline(r143, [xy(76,12),xy(76,13)]).
fillpoint(r143, xy(76,13), 2).
fillpoint(r143, xy(76,12), 2).
fillpoint(r143, xy(79,13), 1).
fillpoint(r143, xy(78,13), 1).
fillpoint(r143, xy(77,13), 1).
region(r147, '#cdd7da', 6, centroid(77,9)).
polygon(r147, [xy(76,8),xy(76,10),xy(77,9),xy(77,10),xy(78,10),xy(76,8)]).
fillpoint(r147, xy(78,10), 1).
fillpoint(r147, xy(77,10), 1).
fillpoint(r147, xy(77,9), 1).
fillpoint(r147, xy(76,10), 1).
fillpoint(r147, xy(76,9), 1).
region(r162, '#d1dbde', 5, centroid(22,11)).
polygon(r162, [xy(22,9),xy(22,13),xy(22,9)]).
fillpoint(r162, xy(22,13), 1).
fillpoint(r162, xy(22,12), 1).
fillpoint(r162, xy(22,11), 1).
fillpoint(r162, xy(22,10), 1).
fillpoint(r162, xy(22,9), 1).
region(r166, '#cdd7da', 6, centroid(44,11)).
polygon(r166, [xy(43,9),xy(43,10),xy(44,10),xy(44,11),xy(45,11),xy(45,12),xy(43,9)]).
fillpoint(r166, xy(45,12), 1).
fillpoint(r166, xy(45,11), 1).
fillpoint(r166, xy(44,11), 1).
fillpoint(r166, xy(44,10), 1).
fillpoint(r166, xy(43,10), 1).
region(r168, '#d1dbde', 6, centroid(47,11)).
polygon(r168, [xy(46,11),xy(46,12),xy(47,11),xy(47,9),xy(48,11),xy(46,11)]).
fillpoint(r168, xy(48,11), 1).
fillpoint(r168, xy(47,11), 1).
fillpoint(r168, xy(47,10), 1).
fillpoint(r168, xy(47,9), 1).
fillpoint(r168, xy(46,12), 1).
region(r182, '#c8d2d5', 4, centroid(21,11)).
polygon(r182, [xy(20,12),xy(21,11),xy(21,12),xy(20,12)]).
fillpoint(r182, xy(21,12), 1).
fillpoint(r182, xy(21,11), 1).
fillpoint(r182, xy(21,10), 1).
fillpoint(r182, xy(20,12), 1).
region(r185, '#c5cfd2', 5, centroid(29,10)).
polygon(r185, [xy(28,10),xy(29,10),xy(29,11),xy(30,10),xy(30,11),xy(28,10)]).
fillpoint(r185, xy(30,11), 1).
fillpoint(r185, xy(30,10), 1).
fillpoint(r185, xy(29,11), 1).
fillpoint(r185, xy(29,10), 1).
fillpoint(r185, xy(28,10), 1).
region(r195, '#c5cfd2', 9, centroid(80,12)).
polygon(r195, [xy(78,12),xy(79,12),xy(80,11),xy(80,10),xy(81,11),xy(80,12),xy(80,13),xy(81,13),xy(82,11),xy(78,12)]).
fillpoint(r195, xy(82,11), 1).
fillpoint(r195, xy(81,13), 1).
fillpoint(r195, xy(81,11), 1).
fillpoint(r195, xy(80,13), 1).
fillpoint(r195, xy(80,12), 1).
region(r202, '#d1dbde', 4, centroid(8,11)).
polygon(r202, [xy(7,11),xy(8,11),xy(8,12),xy(9,11),xy(7,11)]).
fillpoint(r202, xy(9,11), 1).
fillpoint(r202, xy(8,12), 1).
fillpoint(r202, xy(8,11), 1).
fillpoint(r202, xy(7,11), 1).
region(r206, '#cdd7da', 5, centroid(27,12)).
polygon(r206, [xy(27,11),xy(27,13),xy(28,13),xy(28,11),xy(27,11)]).
fillpoint(r206, xy(28,13), 1).
fillpoint(r206, xy(28,11), 1).
fillpoint(r206, xy(27,13), 1).
fillpoint(r206, xy(27,12), 1).
fillpoint(r206, xy(27,11), 1).
region(r212, '#d1dbde', 44, centroid(72,17)).
polygon(r212, [xy(68,20),xy(69,19),xy(69,18),xy(71,18),xy(73,16),xy(69,12),xy(69,11),xy(70,11),xy(71,12),xy(72,12),xy(73,13),xy(73,14),xy(74,15),xy(74,16),xy(75,17),xy(75,18),xy(72,21),xy(70,21),xy(69,20),xy(68,20)]).
midline(r212, [xy(70,12),xy(71,13),xy(72,13),xy(72,14),xy(73,15)]).
midline(r212, [xy(70,19),xy(70,20),xy(72,19),xy(73,18)]).
fillpoint(r212, xy(73,18), 3).
fillpoint(r212, xy(72,19), 3).
fillpoint(r212, xy(74,18), 2).
fillpoint(r212, xy(74,17), 2).
fillpoint(r212, xy(73,19), 2).
region(r219, '#b1babe', 125, centroid(8,26)).
polygon(r219, [xy(0,14),xy(2,14),xy(2,15),xy(1,16),xy(1,17),xy(0,18),xy(0,27),xy(1,28),xy(2,28),xy(3,29),xy(5,29),xy(7,27),xy(7,26),xy(6,25),xy(4,27),xy(2,25),xy(2,24),xy(1,23),xy(0,14)]).
midline(r219, [xy(1,24),xy(1,27),xy(2,26),xy(2,27),xy(3,27),xy(3,28),xy(4,28),xy(5,27),xy(5,28),xy(6,27),xy(6,26)]).
midline(r219, [xy(2,16),xy(3,15),xy(3,14),xy(4,14),xy(4,15),xy(5,14),xy(5,15)]).
midline(r219, [xy(6,29),xy(8,30),xy(10,30),xy(10,31),xy(11,31),xy(11,32),xy(14,32),xy(15,33),xy(16,33),xy(16,34),xy(17,33),xy(19,33)]).
fillpoint(r219, xy(17,33), 3).
fillpoint(r219, xy(16,34), 3).
fillpoint(r219, xy(16,33), 3).
fillpoint(r219, xy(15,33), 3).
fillpoint(r219, xy(14,32), 3).
region(r230, '#cbd5d7', 6, centroid(43,13)).
polygon(r230, [xy(42,13),xy(42,14),xy(44,12),xy(44,13),xy(45,13),xy(42,13)]).
fillpoint(r230, xy(45,13), 1).
fillpoint(r230, xy(44,13), 1).
fillpoint(r230, xy(44,12), 1).
fillpoint(r230, xy(43,13), 1).
fillpoint(r230, xy(42,14), 1).
region(r231, '#cdd7da', 29, centroid(44,15)).
polygon(r231, [xy(40,14),xy(41,14),xy(41,15),xy(40,16),xy(41,17),xy(42,17),xy(43,18),xy(43,19),xy(44,17),xy(46,15),xy(45,14),xy(43,14),xy(42,15),xy(40,14)]).
midline(r231, [xy(41,16),xy(43,16),xy(45,15),xy(46,14)]).
fillpoint(r231, xy(43,16), 3).
fillpoint(r231, xy(46,14), 2).
fillpoint(r231, xy(45,15), 2).
fillpoint(r231, xy(44,16), 2).
fillpoint(r231, xy(44,15), 2).
region(r233, '#cdd7da', 5, centroid(50,13)).
polygon(r233, [xy(49,13),xy(49,14),xy(50,13),xy(50,14),xy(49,13)]).
fillpoint(r233, xy(50,14), 1).
fillpoint(r233, xy(50,13), 1).
fillpoint(r233, xy(50,12), 1).
fillpoint(r233, xy(49,14), 1).
fillpoint(r233, xy(49,13), 1).
region(r234, '#cbd5d7', 8, centroid(52,13)).
polygon(r234, [xy(51,12),xy(51,14),xy(52,14),xy(53,13),xy(52,12),xy(53,12),xy(51,12)]).
midline(r234, [xy(52,13)]).
fillpoint(r234, xy(52,13), 2).
fillpoint(r234, xy(53,13), 1).
fillpoint(r234, xy(53,12), 1).
fillpoint(r234, xy(52,14), 1).
fillpoint(r234, xy(52,12), 1).
region(r246, '#c8d2d5', 49, centroid(14,20)).
polygon(r246, [xy(11,17),xy(11,22),xy(13,24),xy(14,24),xy(15,23),xy(13,21),xy(13,20),xy(12,19),xy(12,18),xy(13,17),xy(12,16),xy(12,15),xy(14,15),xy(14,16),xy(15,16),xy(16,15),xy(15,14),xy(17,14),xy(17,15),xy(18,14),xy(18,13),xy(11,17)]).
midline(r246, [xy(12,17),xy(13,16),xy(15,15)]).
midline(r246, [xy(12,20),xy(12,22),xy(13,22),xy(13,23),xy(14,23),xy(15,24),xy(16,24),xy(17,25)]).
fillpoint(r246, xy(17,25), 2).
fillpoint(r246, xy(16,24), 2).
fillpoint(r246, xy(15,24), 2).
fillpoint(r246, xy(15,15), 2).
fillpoint(r246, xy(14,23), 2).
region(r247, '#cbd5d7', 7, centroid(20,14)).
polygon(r247, [xy(19,13),xy(19,14),xy(20,13),xy(20,14),xy(21,13),xy(21,15),xy(19,13)]).
fillpoint(r247, xy(21,15), 1).
fillpoint(r247, xy(21,14), 1).
fillpoint(r247, xy(21,13), 1).
fillpoint(r247, xy(20,14), 1).
fillpoint(r247, xy(20,13), 1).
region(r253, '#d1dbde', 6, centroid(37,14)).
polygon(r253, [xy(35,13),xy(35,14),xy(39,14),xy(35,13)]).
fillpoint(r253, xy(39,14), 1).
fillpoint(r253, xy(38,14), 1).
fillpoint(r253, xy(37,14), 1).
fillpoint(r253, xy(36,14), 1).
fillpoint(r253, xy(35,14), 1).
region(r257, '#bbc5c8', 5, centroid(88,14)).
polygon(r257, [xy(87,13),xy(88,13),xy(88,14),xy(89,14),xy(89,15),xy(87,13)]).
fillpoint(r257, xy(89,15), 1).
fillpoint(r257, xy(89,14), 1).
fillpoint(r257, xy(88,14), 1).
fillpoint(r257, xy(88,13), 1).
fillpoint(r257, xy(87,13), 1).
region(r271, '#cdd7da', 32, centroid(77,18)).
polygon(r271, [xy(73,21),xy(74,20),xy(74,21),xy(75,21),xy(76,22),xy(79,19),xy(79,18),xy(80,17),xy(78,15),xy(76,17),xy(76,18),xy(75,19),xy(73,21)]).
midline(r271, [xy(76,20),xy(77,19),xy(78,17)]).
fillpoint(r271, xy(78,17), 3).
fillpoint(r271, xy(77,19), 3).
fillpoint(r271, xy(76,20), 3).
fillpoint(r271, xy(79,17), 2).
fillpoint(r271, xy(78,19), 2).
region(r272, '#cbd5d7', 11, centroid(80,17)).
polygon(r272, [xy(79,14),xy(80,14),xy(80,16),xy(81,16),xy(81,17),xy(80,18),xy(80,20),xy(81,19),xy(81,18),xy(79,14)]).
fillpoint(r272, xy(81,19), 1).
fillpoint(r272, xy(81,18), 1).
fillpoint(r272, xy(81,17), 1).
fillpoint(r272, xy(81,16), 1).
fillpoint(r272, xy(80,20), 1).
region(r273, '#c8d2d5', 18, centroid(83,17)).
polygon(r273, [xy(81,14),xy(81,15),xy(82,14),xy(83,14),xy(83,15),xy(82,16),xy(82,19),xy(83,19),xy(84,18),xy(84,16),xy(81,14)]).
midline(r273, [xy(82,15),xy(83,16),xy(83,18)]).
fillpoint(r273, xy(83,18), 2).
fillpoint(r273, xy(83,17), 2).
fillpoint(r273, xy(83,16), 2).
fillpoint(r273, xy(82,15), 2).
fillpoint(r273, xy(84,19), 1).
region(r274, '#c5cfd2', 11, centroid(85,17)).
polygon(r274, [xy(84,14),xy(84,15),xy(85,15),xy(85,19),xy(86,19),xy(87,18),xy(86,17),xy(84,14)]).
midline(r274, [xy(86,18)]).
fillpoint(r274, xy(86,18), 2).
fillpoint(r274, xy(87,18), 1).
fillpoint(r274, xy(86,19), 1).
fillpoint(r274, xy(86,17), 1).
fillpoint(r274, xy(85,19), 1).
region(r275, '#a0a9ad', 4, centroid(0,16)).
polygon(r275, [xy(0,15),xy(0,17),xy(1,15),xy(0,15)]).
fillpoint(r275, xy(1,15), 1).
fillpoint(r275, xy(0,17), 1).
fillpoint(r275, xy(0,16), 1).
fillpoint(r275, xy(0,15), 1).
region(r277, '#c1cbce', 51, centroid(10,22)).
polygon(r277, [xy(6,17),xy(6,20),xy(7,21),xy(7,22),xy(8,22),xy(9,21),xy(9,19),xy(8,18),xy(9,17),xy(8,16),xy(7,16),xy(9,15),xy(9,16),xy(10,15),xy(6,17)]).
midline(r277, [xy(7,17),xy(7,20),xy(8,19),xy(8,21)]).
midline(r277, [xy(8,17)]).
midline(r277, [xy(10,25),xy(10,26),xy(11,26),xy(12,27),xy(13,27)]).
fillpoint(r277, xy(13,27), 2).
fillpoint(r277, xy(12,27), 2).
fillpoint(r277, xy(11,26), 2).
fillpoint(r277, xy(10,26), 2).
fillpoint(r277, xy(10,25), 2).
region(r278, '#c5cfd2', 10, centroid(10,18)).
polygon(r278, [xy(9,18),xy(10,17),xy(10,16),xy(11,15),xy(11,16),xy(10,18),xy(10,22),xy(9,18)]).
fillpoint(r278, xy(11,16), 1).
fillpoint(r278, xy(11,15), 1).
fillpoint(r278, xy(10,22), 1).
fillpoint(r278, xy(10,21), 1).
fillpoint(r278, xy(10,20), 1).
region(r280, '#cdd7da', 25, centroid(17,18)).
polygon(r280, [xy(14,18),xy(14,21),xy(15,21),xy(17,19),xy(17,20),xy(15,18),xy(17,16),xy(18,16),xy(18,18),xy(19,18),xy(19,19),xy(14,18)]).
midline(r280, [xy(15,19),xy(15,20),xy(16,19),xy(16,18),xy(17,17),xy(17,18)]).
fillpoint(r280, xy(17,18), 2).
fillpoint(r280, xy(17,17), 2).
fillpoint(r280, xy(16,19), 2).
fillpoint(r280, xy(16,18), 2).
fillpoint(r280, xy(15,20), 2).
region(r284, '#c8d2d5', 12, centroid(37,17)).
polygon(r284, [xy(35,16),xy(36,15),xy(37,15),xy(38,16),xy(38,17),xy(37,18),xy(36,17),xy(37,19),xy(38,19),xy(35,16)]).
midline(r284, [xy(36,16),xy(37,16),xy(37,17)]).
fillpoint(r284, xy(37,17), 2).
fillpoint(r284, xy(37,16), 2).
fillpoint(r284, xy(36,16), 2).
fillpoint(r284, xy(38,19), 1).
fillpoint(r284, xy(38,17), 1).
region(r285, '#cbd5d7', 18, centroid(40,18)).
polygon(r285, [xy(38,15),xy(39,15),xy(39,17),xy(38,18),xy(39,19),xy(40,19),xy(41,18),xy(40,17),xy(40,15),xy(38,15)]).
midline(r285, [xy(39,18),xy(40,18),xy(41,19)]).
fillpoint(r285, xy(41,19), 2).
fillpoint(r285, xy(40,18), 2).
fillpoint(r285, xy(39,18), 2).
fillpoint(r285, xy(43,20), 1).
fillpoint(r285, xy(42,20), 1).
region(r286, '#d6e0e3', 33, centroid(48,18)).
polygon(r286, [xy(44,19),xy(45,18),xy(45,17),xy(46,17),xy(47,16),xy(47,15),xy(48,15),xy(49,16),xy(51,16),xy(51,17),xy(49,19),xy(49,20),xy(48,21),xy(47,21),xy(45,19),xy(46,21),xy(44,19)]).
midline(r286, [xy(47,18),xy(47,19),xy(48,18),xy(48,17),xy(50,17)]).
fillpoint(r286, xy(48,18), 3).
fillpoint(r286, xy(48,17), 3).
fillpoint(r286, xy(47,19), 3).
fillpoint(r286, xy(47,18), 3).
fillpoint(r286, xy(50,17), 2).
region(r288, '#cdd7da', 23, centroid(53,18)).
polygon(r288, [xy(50,20),xy(51,20),xy(52,19),xy(51,18),xy(52,17),xy(52,16),xy(51,15),xy(52,15),xy(53,16),xy(53,17),xy(52,18),xy(53,19),xy(52,20),xy(54,19),xy(55,18),xy(54,17),xy(54,15),xy(55,17),xy(55,19),xy(58,19),xy(50,20)]).
hole(r288, [xy(53,18),xy(54,18),xy(53,18)]).
fillpoint(r288, xy(58,19), 1).
fillpoint(r288, xy(57,19), 1).
fillpoint(r288, xy(56,19), 1).
fillpoint(r288, xy(55,19), 1).
fillpoint(r288, xy(55,18), 1).
region(r304, '#bbc5c8', 23, centroid(4,21)).
polygon(r304, [xy(3,18),xy(3,22),xy(4,23),xy(4,24),xy(5,24),xy(6,23),xy(6,21),xy(5,20),xy(5,19),xy(4,18),xy(5,17),xy(5,18),xy(3,18)]).
midline(r304, [xy(4,19),xy(4,22),xy(5,21),xy(5,23)]).
fillpoint(r304, xy(5,23), 2).
fillpoint(r304, xy(5,22), 2).
fillpoint(r304, xy(5,21), 2).
fillpoint(r304, xy(4,22), 2).
fillpoint(r304, xy(4,21), 2).
region(r312, '#bbc5c8', 24, centroid(92,21)).
polygon(r312, [xy(89,24),xy(90,23),xy(90,22),xy(91,21),xy(91,20),xy(92,19),xy(92,17),xy(93,17),xy(93,20),xy(94,21),xy(91,24),xy(92,24),xy(89,24)]).
midline(r312, [xy(91,22),xy(91,23),xy(92,22),xy(92,20),xy(93,21)]).
fillpoint(r312, xy(93,21), 2).
fillpoint(r312, xy(92,22), 2).
fillpoint(r312, xy(92,21), 2).
fillpoint(r312, xy(92,20), 2).
fillpoint(r312, xy(91,23), 2).
region(r313, '#b7c1c4', 19, centroid(94,22)).
polygon(r313, [xy(91,25),xy(92,25),xy(93,24),xy(93,23),xy(95,21),xy(94,20),xy(94,17),xy(91,25)]).
midline(r313, [xy(94,23),xy(94,24)]).
fillpoint(r313, xy(94,24), 2).
fillpoint(r313, xy(94,23), 2).
fillpoint(r313, xy(95,25), 1).
fillpoint(r313, xy(95,24), 1).
fillpoint(r313, xy(95,23), 1).
region(r314, '#b7c1c4', 16, centroid(2,22)).
polygon(r314, [xy(1,19),xy(1,22),xy(2,21),xy(2,18),xy(1,19)]).
fillpoint(r314, xy(5,25), 1).
fillpoint(r314, xy(4,26), 1).
fillpoint(r314, xy(4,25), 1).
fillpoint(r314, xy(3,25), 1).
fillpoint(r314, xy(3,24), 1).
region(r342, '#d6e0e3', 10, centroid(54,21)).
polygon(r342, [xy(52,21),xy(53,20),xy(55,20),xy(55,21),xy(54,22),xy(53,22),xy(52,21)]).
midline(r342, [xy(53,21),xy(54,21)]).
fillpoint(r342, xy(54,21), 2).
fillpoint(r342, xy(53,21), 2).
fillpoint(r342, xy(56,20), 1).
fillpoint(r342, xy(55,21), 1).
fillpoint(r342, xy(55,20), 1).
region(r345, '#c5cfd2', 40, centroid(61,23)).
polygon(r345, [xy(54,24),xy(55,23),xy(55,24),xy(56,25),xy(56,26),xy(55,27),xy(57,27),xy(57,28),xy(54,24)]).
midline(r345, [xy(56,23),xy(56,24)]).
midline(r345, [xy(65,22)]).
fillpoint(r345, xy(65,22), 3).
fillpoint(r345, xy(66,22), 2).
fillpoint(r345, xy(65,23), 2).
fillpoint(r345, xy(65,21), 2).
fillpoint(r345, xy(64,22), 2).
region(r356, '#d6e0e3', 8, centroid(43,22)).
polygon(r356, [xy(40,22),xy(43,22),xy(43,23),xy(44,22),xy(44,21),xy(45,22),xy(40,22)]).
fillpoint(r356, xy(45,22), 1).
fillpoint(r356, xy(44,22), 1).
fillpoint(r356, xy(44,21), 1).
fillpoint(r356, xy(43,23), 1).
fillpoint(r356, xy(43,22), 1).
region(r367, '#c1cbce', 5, centroid(79,22)).
polygon(r367, [xy(78,23),xy(79,22),xy(79,23),xy(80,22),xy(80,21),xy(78,23)]).
fillpoint(r367, xy(80,22), 1).
fillpoint(r367, xy(80,21), 1).
fillpoint(r367, xy(79,23), 1).
fillpoint(r367, xy(79,22), 1).
fillpoint(r367, xy(78,23), 1).
region(r368, '#bbc5c8', 64, centroid(79,25)).
polygon(r368, [xy(72,27),xy(72,28),xy(73,29),xy(76,29),xy(77,28),xy(77,27),xy(75,25),xy(74,26),xy(73,26),xy(75,24),xy(76,25),xy(77,25),xy(78,24),xy(78,25),xy(81,22),xy(81,21),xy(84,21),xy(85,22),xy(85,23),xy(84,24),xy(84,25),xy(82,27),xy(80,27),xy(79,26),xy(79,27),xy(72,27)]).
midline(r368, [xy(73,27),xy(73,28),xy(75,27)]).
midline(r368, [xy(80,25),xy(81,24),xy(81,25),xy(82,24),xy(82,23),xy(83,23),xy(82,25)]).
fillpoint(r368, xy(83,23), 3).
fillpoint(r368, xy(82,25), 3).
fillpoint(r368, xy(82,24), 3).
fillpoint(r368, xy(82,23), 3).
fillpoint(r368, xy(81,25), 3).
region(r370, '#d1dbde', 18, centroid(41,24)).
polygon(r370, [xy(38,22),xy(39,22),xy(39,24),xy(40,23),xy(42,23),xy(43,24),xy(42,25),xy(40,25),xy(38,22)]).
midline(r370, [xy(40,24),xy(42,24)]).
fillpoint(r370, xy(42,24), 2).
fillpoint(r370, xy(41,24), 2).
fillpoint(r370, xy(40,24), 2).
fillpoint(r370, xy(45,23), 1).
fillpoint(r370, xy(44,24), 1).
region(r374, '#c8d2d5', 9, centroid(48,23)).
polygon(r374, [xy(45,24),xy(46,24),xy(47,23),xy(47,24),xy(49,22),xy(49,24),xy(50,22),xy(45,24)]).
fillpoint(r374, xy(50,22), 1).
fillpoint(r374, xy(49,24), 1).
fillpoint(r374, xy(49,23), 1).
fillpoint(r374, xy(49,22), 1).
fillpoint(r374, xy(48,23), 1).
region(r387, '#bbc5c8', 4, centroid(8,25)).
polygon(r387, [xy(8,23),xy(8,26),xy(8,23)]).
fillpoint(r387, xy(8,26), 1).
fillpoint(r387, xy(8,25), 1).
fillpoint(r387, xy(8,24), 1).
fillpoint(r387, xy(8,23), 1).
region(r388, '#c5cfd2', 16, centroid(15,26)).
polygon(r388, [xy(11,23),xy(11,24),xy(12,24),xy(12,25),xy(14,25),xy(14,26),xy(15,26),xy(15,27),xy(16,26),xy(16,27),xy(19,27),xy(20,26),xy(20,27),xy(11,23)]).
fillpoint(r388, xy(20,27), 1).
fillpoint(r388, xy(20,26), 1).
fillpoint(r388, xy(19,27), 1).
fillpoint(r388, xy(18,27), 1).
fillpoint(r388, xy(17,27), 1).
region(r394, '#c5cfd2', 14, centroid(48,25)).
polygon(r394, [xy(45,25),xy(45,26),xy(46,25),xy(46,26),xy(47,25),xy(47,26),xy(48,25),xy(48,24),xy(49,25),xy(50,24),xy(50,23),xy(51,24),xy(50,25),xy(50,26),xy(45,25)]).
fillpoint(r394, xy(51,24), 1).
fillpoint(r394, xy(50,26), 1).
fillpoint(r394, xy(50,25), 1).
fillpoint(r394, xy(50,24), 1).
fillpoint(r394, xy(50,23), 1).
region(r400, '#c1cbce', 44, centroid(69,26)).
polygon(r400, [xy(62,29),xy(63,29),xy(64,28),xy(64,29),xy(65,28),xy(65,27),xy(66,26),xy(66,25),xy(67,24),xy(68,24),xy(68,25),xy(66,27),xy(68,27),xy(68,28),xy(70,26),xy(69,25),xy(69,23),xy(73,23),xy(74,24),xy(69,29),xy(70,29),xy(71,28),xy(62,29)]).
hole(r400, [xy(68,26),xy(69,26),xy(68,26)]).
midline(r400, [xy(67,25),xy(69,24),xy(71,25),xy(70,27)]).
midline(r400, [xy(73,24)]).
fillpoint(r400, xy(71,25), 3).
fillpoint(r400, xy(73,24), 2).
fillpoint(r400, xy(72,25), 2).
fillpoint(r400, xy(72,24), 2).
fillpoint(r400, xy(71,26), 2).
region(r404, '#b7c1c4', 18, centroid(86,26)).
polygon(r404, [xy(84,26),xy(84,28),xy(85,29),xy(86,28),xy(86,26),xy(85,25),xy(85,24),xy(86,23),xy(87,24),xy(87,25),xy(88,24),xy(84,26)]).
midline(r404, [xy(85,26),xy(85,28)]).
midline(r404, [xy(86,24),xy(86,25)]).
fillpoint(r404, xy(86,25), 2).
fillpoint(r404, xy(86,24), 2).
fillpoint(r404, xy(85,28), 2).
fillpoint(r404, xy(85,27), 2).
fillpoint(r404, xy(85,26), 2).
region(r413, '#c1cbce', 54, centroid(57,28)).
polygon(r413, [xy(51,28),xy(52,27),xy(52,28),xy(53,27),xy(54,27),xy(55,28),xy(54,29),xy(53,29),xy(55,30),xy(56,30),xy(57,29),xy(56,28),xy(57,26),xy(57,25),xy(58,24),xy(61,24),xy(62,25),xy(60,27),xy(61,28),xy(60,29),xy(59,29),xy(58,28),xy(58,29),xy(57,30),xy(57,31),xy(56,32),xy(55,32),xy(56,33),xy(58,33),xy(59,32),xy(58,31),xy(51,28)]).
midline(r413, [xy(53,28),xy(54,28),xy(55,29),xy(56,29)]).
midline(r413, [xy(57,32),xy(58,32)]).
midline(r413, [xy(59,26),xy(59,28),xy(60,28)]).
midline(r413, [xy(61,25)]).
fillpoint(r413, xy(59,26), 3).
fillpoint(r413, xy(61,25), 2).
fillpoint(r413, xy(60,28), 2).
fillpoint(r413, xy(60,26), 2).
fillpoint(r413, xy(60,25), 2).
region(r425, '#c8d2d5', 4, centroid(52,25)).
polygon(r425, [xy(51,25),xy(52,25),xy(52,26),xy(53,25),xy(51,25)]).
fillpoint(r425, xy(53,25), 1).
fillpoint(r425, xy(52,26), 1).
fillpoint(r425, xy(52,25), 1).
fillpoint(r425, xy(51,25), 1).
region(r430, '#c8d2d5', 5, centroid(64,26)).
polygon(r430, [xy(63,27),xy(64,26),xy(64,27),xy(65,26),xy(65,25),xy(63,27)]).
fillpoint(r430, xy(65,26), 1).
fillpoint(r430, xy(65,25), 1).
fillpoint(r430, xy(64,27), 1).
fillpoint(r430, xy(64,26), 1).
fillpoint(r430, xy(63,27), 1).
region(r431, '#b1babe', 117, centroid(85,33)).
polygon(r431, [xy(70,38),xy(71,38),xy(71,39),xy(72,38),xy(72,39),xy(73,38),xy(73,39),xy(78,39),xy(79,38),xy(83,38),xy(84,37),xy(85,38),xy(86,37),xy(87,37),xy(88,36),xy(89,36),xy(91,34),xy(91,33),xy(89,31),xy(88,31),xy(86,29),xy(87,28),xy(87,26),xy(88,25),xy(90,25),xy(91,26),xy(95,26),xy(95,28),xy(94,29),xy(91,29),xy(90,30),xy(89,32),xy(87,34),xy(86,34),xy(85,35),xy(83,35),xy(82,36),xy(78,36),xy(77,37),xy(74,37),xy(70,38)]).
midline(r431, [xy(74,38),xy(77,38),xy(78,37),xy(78,38),xy(79,37),xy(82,37),xy(83,36),xy(83,37),xy(84,36),xy(85,36),xy(85,37),xy(86,36),xy(86,35),xy(87,35),xy(87,36),xy(89,34)]).
midline(r431, [xy(88,29),xy(89,28),xy(89,27),xy(90,27),xy(90,28),xy(89,29)]).
midline(r431, [xy(92,27),xy(92,28),xy(93,27),xy(93,28),xy(94,27),xy(94,28)]).
fillpoint(r431, xy(90,28), 3).
fillpoint(r431, xy(90,27), 3).
fillpoint(r431, xy(89,34), 3).
fillpoint(r431, xy(89,29), 3).
fillpoint(r431, xy(89,28), 3).
region(r437, '#cdd7da', 4, centroid(42,26)).
polygon(r437, [xy(40,26),xy(43,26),xy(40,26)]).
fillpoint(r437, xy(43,26), 1).
fillpoint(r437, xy(42,26), 1).
fillpoint(r437, xy(41,26), 1).
fillpoint(r437, xy(40,26), 1).
region(r439, '#c8d2d5', 4, centroid(48,27)).
polygon(r439, [xy(47,27),xy(48,26),xy(48,27),xy(49,26),xy(47,27)]).
fillpoint(r439, xy(49,26), 1).
fillpoint(r439, xy(48,27), 1).
fillpoint(r439, xy(48,26), 1).
fillpoint(r439, xy(47,27), 1).
region(r443, '#c1cbce', 60, centroid(75,31)).
polygon(r443, [xy(65,32),xy(65,33),xy(66,33),xy(66,34),xy(67,33),xy(68,33),xy(68,35),xy(69,33),xy(69,32),xy(70,32),xy(70,33),xy(74,33),xy(75,32),xy(78,32),xy(79,31),xy(79,30),xy(78,29),xy(77,29),xy(76,30),xy(73,30),xy(72,31),xy(71,31),xy(65,32)]).
midline(r443, [xy(71,32),xy(72,32),xy(73,31),xy(73,32),xy(74,31),xy(74,32),xy(75,31),xy(76,31),xy(77,30),xy(77,31),xy(78,30),xy(78,31),xy(80,30),xy(81,29),xy(81,30),xy(82,29)]).
fillpoint(r443, xy(82,29), 2).
fillpoint(r443, xy(81,30), 2).
fillpoint(r443, xy(81,29), 2).
fillpoint(r443, xy(80,30), 2).
fillpoint(r443, xy(78,31), 2).
region(r445, '#bbc5c8', 4, centroid(10,28)).
polygon(r445, [xy(9,27),xy(9,28),xy(11,28),xy(9,27)]).
fillpoint(r445, xy(11,28), 1).
fillpoint(r445, xy(10,28), 1).
fillpoint(r445, xy(9,28), 1).
fillpoint(r445, xy(9,27), 1).
region(r452, '#c8d2d5', 4, centroid(41,27)).
polygon(r452, [xy(39,27),xy(42,27),xy(39,27)]).
fillpoint(r452, xy(42,27), 1).
fillpoint(r452, xy(41,27), 1).
fillpoint(r452, xy(40,27), 1).
fillpoint(r452, xy(39,27), 1).
region(r453, '#cbd5d7', 4, centroid(45,27)).
polygon(r453, [xy(43,27),xy(46,27),xy(43,27)]).
fillpoint(r453, xy(46,27), 1).
fillpoint(r453, xy(45,27), 1).
fillpoint(r453, xy(44,27), 1).
fillpoint(r453, xy(43,27), 1).
region(r454, '#cbd5d7', 4, centroid(48,28)).
polygon(r454, [xy(47,28),xy(48,28),xy(49,27),xy(49,28),xy(47,28)]).
fillpoint(r454, xy(49,28), 1).
fillpoint(r454, xy(49,27), 1).
fillpoint(r454, xy(48,28), 1).
fillpoint(r454, xy(47,28), 1).
region(r458, '#a0a9ad', 167, centroid(8,36)).
polygon(r458, [xy(0,28),xy(0,40),xy(18,40),xy(19,39),xy(18,38),xy(18,37),xy(17,36),xy(16,37),xy(14,35),xy(13,35),xy(12,34),xy(11,34),xy(9,32),xy(8,32),xy(7,31),xy(6,31),xy(5,30),xy(3,30),xy(2,29),xy(1,29),xy(0,28)]).
midline(r458, [xy(2,31)]).
midline(r458, [xy(5,35),xy(7,35),xy(7,36),xy(9,36),xy(11,37),xy(14,37),xy(14,38),xy(15,38),xy(17,37),xy(17,39),xy(18,39)]).
fillpoint(r458, xy(5,35), 6).
fillpoint(r458, xy(9,36), 5).
fillpoint(r458, xy(8,36), 5).
fillpoint(r458, xy(7,36), 5).
fillpoint(r458, xy(7,35), 5).
region(r459, '#bbc5c8', 7, centroid(18,29)).
polygon(r459, [xy(15,29),xy(19,29),xy(20,28),xy(20,29),xy(15,29)]).
fillpoint(r459, xy(20,29), 1).
fillpoint(r459, xy(20,28), 1).
fillpoint(r459, xy(19,29), 1).
fillpoint(r459, xy(18,29), 1).
fillpoint(r459, xy(17,29), 1).
region(r461, '#a0a9ad', 5, centroid(22,30)).
polygon(r461, [xy(22,28),xy(22,32),xy(22,28)]).
fillpoint(r461, xy(22,32), 1).
fillpoint(r461, xy(22,31), 1).
fillpoint(r461, xy(22,30), 1).
fillpoint(r461, xy(22,29), 1).
fillpoint(r461, xy(22,28), 1).
region(r466, '#c5cfd2', 5, centroid(40,28)).
polygon(r466, [xy(39,28),xy(39,29),xy(40,28),xy(42,28),xy(39,28)]).
fillpoint(r466, xy(42,28), 1).
fillpoint(r466, xy(41,28), 1).
fillpoint(r466, xy(40,28), 1).
fillpoint(r466, xy(39,29), 1).
fillpoint(r466, xy(39,28), 1).
region(r467, '#c8d2d5', 4, centroid(45,28)).
polygon(r467, [xy(43,28),xy(46,28),xy(43,28)]).
fillpoint(r467, xy(46,28), 1).
fillpoint(r467, xy(45,28), 1).
fillpoint(r467, xy(44,28), 1).
fillpoint(r467, xy(43,28), 1).
region(r474, '#b7c1c4', 4, centroid(13,29)).
polygon(r474, [xy(11,29),xy(14,29),xy(11,29)]).
fillpoint(r474, xy(14,29), 1).
fillpoint(r474, xy(13,29), 1).
fillpoint(r474, xy(12,29), 1).
fillpoint(r474, xy(11,29), 1).
region(r480, '#c1cbce', 21, centroid(43,30)).
polygon(r480, [xy(40,29),xy(40,31),xy(41,32),xy(42,32),xy(43,31),xy(43,30),xy(42,29),xy(41,29),xy(40,29)]).
midline(r480, [xy(41,30),xy(41,31),xy(42,30),xy(42,31)]).
fillpoint(r480, xy(42,31), 2).
fillpoint(r480, xy(42,30), 2).
fillpoint(r480, xy(41,31), 2).
fillpoint(r480, xy(41,30), 2).
fillpoint(r480, xy(48,31), 1).
region(r481, '#c5cfd2', 5, centroid(45,29)).
polygon(r481, [xy(43,29),xy(47,29),xy(43,29)]).
fillpoint(r481, xy(47,29), 1).
fillpoint(r481, xy(46,29), 1).
fillpoint(r481, xy(45,29), 1).
fillpoint(r481, xy(44,29), 1).
fillpoint(r481, xy(43,29), 1).
region(r482, '#c8d2d5', 4, centroid(50,29)).
polygon(r482, [xy(48,29),xy(51,29),xy(48,29)]).
fillpoint(r482, xy(51,29), 1).
fillpoint(r482, xy(50,29), 1).
fillpoint(r482, xy(49,29), 1).
fillpoint(r482, xy(48,29), 1).
region(r484, '#bbc5c8', 13, centroid(61,30)).
polygon(r484, [xy(58,30),xy(59,30),xy(59,31),xy(60,30),xy(60,31),xy(61,31),xy(62,30),xy(61,29),xy(63,30),xy(64,30),xy(64,32),xy(58,30)]).
midline(r484, [xy(61,30)]).
fillpoint(r484, xy(61,30), 2).
fillpoint(r484, xy(64,32), 1).
fillpoint(r484, xy(64,31), 1).
fillpoint(r484, xy(64,30), 1).
fillpoint(r484, xy(63,30), 1).
region(r487, '#c8d2d5', 6, centroid(67,30)).
polygon(r487, [xy(66,30),xy(66,31),xy(67,30),xy(67,31),xy(68,30),xy(68,29),xy(66,30)]).
fillpoint(r487, xy(68,30), 1).
fillpoint(r487, xy(68,29), 1).
fillpoint(r487, xy(67,31), 1).
fillpoint(r487, xy(67,30), 1).
fillpoint(r487, xy(66,31), 1).
region(r488, '#c5cfd2', 11, centroid(69,31)).
polygon(r488, [xy(66,32),xy(67,32),xy(68,31),xy(68,32),xy(69,31),xy(69,30),xy(70,30),xy(70,31),xy(71,30),xy(71,29),xy(72,30),xy(66,32)]).
fillpoint(r488, xy(72,30), 1).
fillpoint(r488, xy(71,30), 1).
fillpoint(r488, xy(71,29), 1).
fillpoint(r488, xy(70,31), 1).
fillpoint(r488, xy(70,30), 1).
region(r491, '#b7c1c4', 8, centroid(18,30)).
polygon(r491, [xy(15,30),xy(18,30),xy(18,31),xy(19,30),xy(19,31),xy(20,30),xy(15,30)]).
fillpoint(r491, xy(20,30), 1).
fillpoint(r491, xy(19,31), 1).
fillpoint(r491, xy(19,30), 1).
fillpoint(r491, xy(18,31), 1).
fillpoint(r491, xy(18,30), 1).
region(r493, '#a0a9ad', 4, centroid(34,31)).
polygon(r493, [xy(34,30),xy(34,32),xy(35,32),xy(34,30)]).
fillpoint(r493, xy(35,32), 1).
fillpoint(r493, xy(34,32), 1).
fillpoint(r493, xy(34,31), 1).
fillpoint(r493, xy(34,30), 1).
region(r496, '#a0a9ad', 4, centroid(37,31)).
polygon(r496, [xy(36,31),xy(37,30),xy(37,31),xy(38,30),xy(36,31)]).
fillpoint(r496, xy(38,30), 1).
fillpoint(r496, xy(37,31), 1).
fillpoint(r496, xy(37,30), 1).
fillpoint(r496, xy(36,31), 1).
region(r500, '#c5cfd2', 6, centroid(54,31)).
polygon(r500, [xy(53,32),xy(54,31),xy(54,30),xy(55,31),xy(54,32),xy(56,31),xy(53,32)]).
fillpoint(r500, xy(56,31), 1).
fillpoint(r500, xy(55,31), 1).
fillpoint(r500, xy(54,32), 1).
fillpoint(r500, xy(54,31), 1).
fillpoint(r500, xy(54,30), 1).
region(r501, '#bbc5c8', 39, centroid(78,33)).
polygon(r501, [xy(69,34),xy(69,35),xy(70,34),xy(70,35),xy(71,34),xy(71,35),xy(72,34),xy(72,35),xy(73,34),xy(73,35),xy(74,34),xy(74,35),xy(75,34),xy(75,33),xy(76,33),xy(76,34),xy(77,33),xy(77,34),xy(79,32),xy(81,32),xy(81,33),xy(80,34),xy(79,34),xy(69,34)]).
midline(r501, [xy(79,33),xy(80,33),xy(82,32),xy(83,32),xy(85,31)]).
fillpoint(r501, xy(85,31), 2).
fillpoint(r501, xy(83,32), 2).
fillpoint(r501, xy(82,32), 2).
fillpoint(r501, xy(80,33), 2).
fillpoint(r501, xy(79,33), 2).
region(r503, '#a0a9ad', 108, centroid(86,37)).
polygon(r503, [xy(64,40),xy(65,39),xy(65,40),xy(66,39),xy(66,40),xy(67,39),xy(67,40),xy(68,39),xy(68,40),xy(69,40),xy(70,39),xy(69,38),xy(70,40),xy(78,40),xy(79,39),xy(79,40),xy(80,39),xy(80,40),xy(81,39),xy(81,40),xy(82,39),xy(82,40),xy(83,39),xy(83,40),xy(84,40),xy(85,39),xy(84,38),xy(85,40),xy(94,40),xy(95,39),xy(95,31),xy(94,30),xy(91,30),xy(90,31),xy(91,32),xy(92,32),xy(93,33),xy(93,34),xy(92,35),xy(91,35),xy(89,37),xy(88,37),xy(87,38),xy(86,38),xy(64,40)]).
midline(r503, [xy(69,39)]).
midline(r503, [xy(84,39),xy(87,39),xy(88,38),xy(88,39),xy(90,38),xy(91,37),xy(91,38),xy(92,37),xy(92,38),xy(93,37),xy(93,38)]).
midline(r503, [xy(91,31),xy(93,31),xy(93,32),xy(94,31),xy(94,34)]).
fillpoint(r503, xy(93,38), 3).
fillpoint(r503, xy(93,37), 3).
fillpoint(r503, xy(93,36), 3).
fillpoint(r503, xy(92,38), 3).
fillpoint(r503, xy(92,37), 3).
region(r506, '#535556', 9, centroid(37,32)).
polygon(r506, [xy(35,33),xy(36,32),xy(36,33),xy(37,32),xy(37,33),xy(38,32),xy(38,31),xy(39,31),xy(39,32),xy(35,33)]).
fillpoint(r506, xy(39,32), 1).
fillpoint(r506, xy(39,31), 1).
fillpoint(r506, xy(38,32), 1).
fillpoint(r506, xy(38,31), 1).
fillpoint(r506, xy(37,33), 1).
region(r510, '#c1cbce', 5, centroid(52,31)).
polygon(r510, [xy(50,31),xy(52,31),xy(52,32),xy(53,31),xy(50,31)]).
fillpoint(r510, xy(53,31), 1).
fillpoint(r510, xy(52,32), 1).
fillpoint(r510, xy(52,31), 1).
fillpoint(r510, xy(51,31), 1).
fillpoint(r510, xy(50,31), 1).
region(r512, '#b7c1c4', 34, centroid(79,35)).
polygon(r512, [xy(70,36),xy(70,37),xy(71,36),xy(71,37),xy(72,36),xy(72,37),xy(73,36),xy(73,37),xy(75,35),xy(75,36),xy(76,35),xy(76,36),xy(77,35),xy(77,36),xy(78,35),xy(78,34),xy(79,35),xy(80,35),xy(81,34),xy(81,35),xy(82,34),xy(82,35),xy(84,33),xy(84,34),xy(85,33),xy(85,34),xy(86,33),xy(86,32),xy(87,31),xy(88,32),xy(87,33),xy(70,36)]).
midline(r512, [xy(87,32)]).
fillpoint(r512, xy(87,32), 2).
fillpoint(r512, xy(88,32), 1).
fillpoint(r512, xy(87,33), 1).
fillpoint(r512, xy(87,31), 1).
fillpoint(r512, xy(86,33), 1).
region(r514, '#b1babe', 4, centroid(43,33)).
polygon(r514, [xy(42,34),xy(43,33),xy(43,34),xy(42,34)]).
fillpoint(r514, xy(43,34), 1).
fillpoint(r514, xy(43,33), 1).
fillpoint(r514, xy(43,32), 1).
fillpoint(r514, xy(42,34), 1).
region(r517, '#535556', 71, centroid(57,36)).
polygon(r517, [xy(44,33),xy(45,33),xy(45,34),xy(46,33),xy(47,33),xy(47,34),xy(48,33),xy(48,34),xy(49,34),xy(50,33),xy(51,34),xy(50,35),xy(51,36),xy(52,35),xy(52,36),xy(53,35),xy(53,36),xy(54,37),xy(56,37),xy(57,36),xy(56,35),xy(55,35),xy(54,34),xy(44,33)]).
midline(r517, [xy(46,34)]).
midline(r517, [xy(49,33),xy(51,35)]).
midline(r517, [xy(54,35),xy(54,36),xy(61,36)]).
midline(r517, [xy(64,38),xy(65,37),xy(67,37)]).
fillpoint(r517, xy(61,36), 3).
fillpoint(r517, xy(67,37), 2).
fillpoint(r517, xy(66,37), 2).
fillpoint(r517, xy(65,37), 2).
fillpoint(r517, xy(64,38), 2).
region(r525, '#a0a9ad', 8, centroid(38,34)).
polygon(r525, [xy(35,34),xy(37,34),xy(38,33),xy(38,34),xy(39,33),xy(39,34),xy(40,33),xy(35,34)]).
fillpoint(r525, xy(40,33), 1).
fillpoint(r525, xy(39,34), 1).
fillpoint(r525, xy(39,33), 1).
fillpoint(r525, xy(38,34), 1).
fillpoint(r525, xy(38,33), 1).
region(r530, '#a0a9ad', 4, centroid(53,34)).
polygon(r530, [xy(52,34),xy(53,33),xy(53,34),xy(54,33),xy(52,34)]).
fillpoint(r530, xy(54,33), 1).
fillpoint(r530, xy(53,34), 1).
fillpoint(r530, xy(53,33), 1).
fillpoint(r530, xy(52,34), 1).
region(r548, '#b7c1c4', 52, centroid(42,37)).
polygon(r548, [xy(33,35),xy(33,38),xy(34,36),xy(34,35),xy(35,36),xy(36,35),xy(36,36),xy(37,36),xy(37,37),xy(38,36),xy(42,36),xy(43,35),xy(43,36),xy(44,37),xy(46,37),xy(47,36),xy(48,36),xy(49,37),xy(49,38),xy(48,39),xy(42,39),xy(41,38),xy(38,38),xy(33,35)]).
midline(r548, [xy(38,37),xy(42,37),xy(42,38),xy(43,37),xy(43,38),xy(46,38),xy(47,37),xy(47,38),xy(48,37),xy(48,38)]).
fillpoint(r548, xy(48,38), 2).
fillpoint(r548, xy(48,37), 2).
fillpoint(r548, xy(47,38), 2).
fillpoint(r548, xy(47,37), 2).
fillpoint(r548, xy(46,38), 2).
region(r550, '#bbc5c8', 6, centroid(40,35)).
polygon(r550, [xy(37,35),xy(42,35),xy(37,35)]).
fillpoint(r550, xy(42,35), 1).
fillpoint(r550, xy(41,35), 1).
fillpoint(r550, xy(40,35), 1).
fillpoint(r550, xy(39,35), 1).
fillpoint(r550, xy(38,35), 1).
region(r563, '#b1babe', 63, centroid(46,39)).
polygon(r563, [xy(32,40),xy(33,39),xy(33,40),xy(37,40),xy(38,39),xy(36,37),xy(34,37),xy(34,38),xy(32,40)]).
midline(r563, [xy(34,39),xy(35,38),xy(35,39),xy(36,38),xy(36,39),xy(37,39)]).
midline(r563, [xy(51,39)]).
midline(r563, [xy(54,39),xy(55,39)]).
fillpoint(r563, xy(55,39), 2).
fillpoint(r563, xy(54,39), 2).
fillpoint(r563, xy(51,39), 2).
fillpoint(r563, xy(37,39), 2).
fillpoint(r563, xy(36,39), 2).
region(r568, '#a0a9ad', 6, centroid(58,38)).
polygon(r568, [xy(56,38),xy(57,37),xy(57,38),xy(60,38),xy(56,38)]).
fillpoint(r568, xy(60,38), 1).
fillpoint(r568, xy(59,38), 1).
fillpoint(r568, xy(58,38), 1).
fillpoint(r568, xy(57,38), 1).
fillpoint(r568, xy(57,37), 1).
adjacent(r1, r2).
shared_edge(r1, r2, 13).
adjacent(r10, r11).
shared_edge(r10, r11, 3).
adjacent(r10, r9).
shared_edge(r10, r9, 1).
adjacent(r100, r65).
shared_edge(r100, r65, 2).
adjacent(r100, r83).
shared_edge(r100, r83, 2).
adjacent(r101, r116).
shared_edge(r101, r116, 1).
adjacent(r101, r68).
shared_edge(r101, r68, 1).
adjacent(r101, r83).
shared_edge(r101, r83, 1).
adjacent(r101, r84).
shared_edge(r101, r84, 1).
adjacent(r102, r68).
shared_edge(r102, r68, 4).
adjacent(r103, r118).
shared_edge(r103, r118, 1).
adjacent(r103, r68).
shared_edge(r103, r68, 1).
adjacent(r103, r88).
shared_edge(r103, r88, 1).
adjacent(r103, r89).
shared_edge(r103, r89, 1).
adjacent(r104, r105).
shared_edge(r104, r105, 1).
adjacent(r104, r106).
shared_edge(r104, r106, 1).
adjacent(r104, r135).
shared_edge(r104, r135, 1).
adjacent(r104, r71).
shared_edge(r104, r71, 2).
adjacent(r104, r72).
shared_edge(r104, r72, 1).
adjacent(r105, r106).
shared_edge(r105, r106, 2).
adjacent(r105, r90).
shared_edge(r105, r90, 1).
adjacent(r106, r119).
shared_edge(r106, r119, 3).
adjacent(r106, r13).
shared_edge(r106, r13, 1).
adjacent(r106, r135).
shared_edge(r106, r135, 1).
adjacent(r106, r136).
shared_edge(r106, r136, 1).
adjacent(r106, r163).
shared_edge(r106, r163, 2).
adjacent(r106, r184).
shared_edge(r106, r184, 1).
adjacent(r106, r185).
shared_edge(r106, r185, 1).
adjacent(r106, r91).
shared_edge(r106, r91, 1).
adjacent(r107, r119).
shared_edge(r107, r119, 2).
adjacent(r107, r120).
shared_edge(r107, r120, 2).
adjacent(r107, r13).
shared_edge(r107, r13, 3).
adjacent(r107, r136).
shared_edge(r107, r136, 2).
adjacent(r107, r41).
shared_edge(r107, r41, 1).
adjacent(r108, r93).
shared_edge(r108, r93, 4).
adjacent(r109, r123).
shared_edge(r109, r123, 2).
adjacent(r109, r125).
shared_edge(r109, r125, 4).
adjacent(r109, r126).
shared_edge(r109, r126, 7).
adjacent(r109, r141).
shared_edge(r109, r141, 2).
adjacent(r109, r142).
shared_edge(r109, r142, 2).
adjacent(r109, r168).
shared_edge(r109, r168, 5).
adjacent(r109, r169).
shared_edge(r109, r169, 5).
adjacent(r109, r188).
shared_edge(r109, r188, 2).
adjacent(r109, r189).
shared_edge(r109, r189, 1).
adjacent(r109, r190).
shared_edge(r109, r190, 2).
adjacent(r109, r191).
shared_edge(r109, r191, 4).
adjacent(r109, r209).
shared_edge(r109, r209, 1).
adjacent(r109, r211).
shared_edge(r109, r211, 1).
adjacent(r109, r212).
shared_edge(r109, r212, 18).
adjacent(r109, r232).
shared_edge(r109, r232, 1).
adjacent(r109, r233).
shared_edge(r109, r233, 1).
adjacent(r109, r234).
shared_edge(r109, r234, 2).
adjacent(r109, r269).
shared_edge(r109, r269, 2).
adjacent(r109, r288).
shared_edge(r109, r288, 6).
adjacent(r109, r323).
shared_edge(r109, r323, 3).
adjacent(r109, r331).
shared_edge(r109, r331, 2).
adjacent(r109, r332).
shared_edge(r109, r332, 1).
adjacent(r109, r333).
shared_edge(r109, r333, 1).
adjacent(r109, r334).
shared_edge(r109, r334, 2).
adjacent(r109, r343).
shared_edge(r109, r343, 1).
adjacent(r109, r344).
shared_edge(r109, r344, 2).
adjacent(r109, r346).
shared_edge(r109, r346, 1).
adjacent(r109, r347).
shared_edge(r109, r347, 1).
adjacent(r109, r360).
shared_edge(r109, r360, 1).
adjacent(r109, r361).
shared_edge(r109, r361, 1).
adjacent(r109, r93).
shared_edge(r109, r93, 12).
adjacent(r109, r94).
shared_edge(r109, r94, 6).
adjacent(r11, r12).
shared_edge(r11, r12, 13).
adjacent(r11, r27).
shared_edge(r11, r27, 3).
adjacent(r11, r39).
shared_edge(r11, r39, 1).
adjacent(r110, r111).
shared_edge(r110, r111, 3).
adjacent(r110, r145).
shared_edge(r110, r145, 2).
adjacent(r110, r146).
shared_edge(r110, r146, 2).
adjacent(r110, r171).
shared_edge(r110, r171, 1).
adjacent(r110, r44).
shared_edge(r110, r44, 1).
adjacent(r110, r76).
shared_edge(r110, r76, 3).
adjacent(r111, r112).
shared_edge(r111, r112, 2).
adjacent(r111, r95).
shared_edge(r111, r95, 1).
adjacent(r112, r113).
shared_edge(r112, r113, 2).
adjacent(r112, r146).
shared_edge(r112, r146, 1).
adjacent(r112, r96).
shared_edge(r112, r96, 1).
adjacent(r113, r128).
shared_edge(r113, r128, 1).
adjacent(r113, r147).
shared_edge(r113, r147, 1).
adjacent(r113, r97).
shared_edge(r113, r97, 1).
adjacent(r113, r98).
shared_edge(r113, r98, 1).
adjacent(r114, r65).
shared_edge(r114, r65, 2).
adjacent(r114, r83).
shared_edge(r114, r83, 2).
adjacent(r115, r116).
shared_edge(r115, r116, 1).
adjacent(r115, r131).
shared_edge(r115, r131, 1).
adjacent(r115, r83).
shared_edge(r115, r83, 2).
adjacent(r116, r117).
shared_edge(r116, r117, 1).
adjacent(r116, r132).
shared_edge(r116, r132, 1).
adjacent(r117, r68).
shared_edge(r117, r68, 5).
adjacent(r118, r134).
shared_edge(r118, r134, 1).
adjacent(r118, r68).
shared_edge(r118, r68, 1).
adjacent(r118, r89).
shared_edge(r118, r89, 1).
adjacent(r119, r13).
shared_edge(r119, r13, 1).
adjacent(r12, r13).
shared_edge(r12, r13, 18).
adjacent(r12, r39).
shared_edge(r12, r39, 1).
adjacent(r12, r54).
shared_edge(r12, r54, 2).
adjacent(r120, r121).
shared_edge(r120, r121, 1).
adjacent(r120, r136).
shared_edge(r120, r136, 1).
adjacent(r121, r137).
shared_edge(r121, r137, 1).
adjacent(r121, r41).
shared_edge(r121, r41, 2).
adjacent(r122, r138).
shared_edge(r122, r138, 2).
adjacent(r122, r165).
shared_edge(r122, r165, 4).
adjacent(r122, r208).
shared_edge(r122, r208, 1).
adjacent(r122, r228).
shared_edge(r122, r228, 2).
adjacent(r122, r231).
shared_edge(r122, r231, 1).
adjacent(r122, r253).
shared_edge(r122, r253, 6).
adjacent(r122, r254).
shared_edge(r122, r254, 2).
adjacent(r122, r93).
shared_edge(r122, r93, 18).
adjacent(r123, r124).
shared_edge(r123, r124, 1).
adjacent(r123, r41).
shared_edge(r123, r41, 1).
adjacent(r124, r125).
shared_edge(r124, r125, 1).
adjacent(r124, r142).
shared_edge(r124, r142, 1).
adjacent(r124, r41).
shared_edge(r124, r41, 1).
adjacent(r125, r142).
shared_edge(r125, r142, 1).
adjacent(r125, r169).
shared_edge(r125, r169, 1).
adjacent(r125, r94).
shared_edge(r125, r94, 3).
adjacent(r126, r44).
shared_edge(r126, r44, 7).
adjacent(r127, r143).
shared_edge(r127, r143, 2).
adjacent(r127, r192).
shared_edge(r127, r192, 1).
adjacent(r127, r44).
shared_edge(r127, r44, 9).
adjacent(r128, r148).
shared_edge(r128, r148, 1).
adjacent(r128, r98).
shared_edge(r128, r98, 2).
adjacent(r129, r156).
shared_edge(r129, r156, 1).
adjacent(r129, r65).
shared_edge(r129, r65, 2).
adjacent(r129, r83).
shared_edge(r129, r83, 1).
adjacent(r13, r14).
shared_edge(r13, r14, 6).
adjacent(r13, r15).
shared_edge(r13, r15, 1).
adjacent(r13, r16).
shared_edge(r13, r16, 1).
adjacent(r13, r28).
shared_edge(r13, r28, 7).
adjacent(r13, r29).
shared_edge(r13, r29, 5).
adjacent(r13, r40).
shared_edge(r13, r40, 5).
adjacent(r13, r41).
shared_edge(r13, r41, 8).
adjacent(r13, r42).
shared_edge(r13, r42, 2).
adjacent(r13, r43).
shared_edge(r13, r43, 7).
adjacent(r13, r55).
shared_edge(r13, r55, 4).
adjacent(r13, r56).
shared_edge(r13, r56, 2).
adjacent(r13, r74).
shared_edge(r13, r74, 5).
adjacent(r13, r91).
shared_edge(r13, r91, 1).
adjacent(r13, r92).
shared_edge(r13, r92, 2).
adjacent(r130, r131).
shared_edge(r130, r131, 1).
adjacent(r130, r159).
shared_edge(r130, r159, 1).
adjacent(r130, r83).
shared_edge(r130, r83, 2).
adjacent(r131, r132).
shared_edge(r131, r132, 2).
adjacent(r132, r159).
shared_edge(r132, r159, 2).
adjacent(r132, r179).
shared_edge(r132, r179, 1).
adjacent(r132, r180).
shared_edge(r132, r180, 2).
adjacent(r132, r203).
shared_edge(r132, r203, 2).
adjacent(r132, r219).
shared_edge(r132, r219, 2).
adjacent(r132, r222).
shared_edge(r132, r222, 2).
adjacent(r132, r241).
shared_edge(r132, r241, 1).
adjacent(r132, r242).
shared_edge(r132, r242, 2).
adjacent(r132, r243).
shared_edge(r132, r243, 3).
adjacent(r132, r258).
shared_edge(r132, r258, 2).
adjacent(r132, r259).
shared_edge(r132, r259, 2).
adjacent(r132, r276).
shared_edge(r132, r276, 2).
adjacent(r132, r277).
shared_edge(r132, r277, 2).
adjacent(r132, r68).
shared_edge(r132, r68, 8).
adjacent(r133, r134).
shared_edge(r133, r134, 1).
adjacent(r133, r160).
shared_edge(r133, r160, 1).
adjacent(r133, r161).
shared_edge(r133, r161, 3).
adjacent(r133, r68).
shared_edge(r133, r68, 5).
adjacent(r134, r162).
shared_edge(r134, r162, 1).
adjacent(r134, r89).
shared_edge(r134, r89, 1).
adjacent(r135, r163).
shared_edge(r135, r163, 1).
adjacent(r135, r183).
shared_edge(r135, r183, 1).
adjacent(r135, r205).
shared_edge(r135, r205, 3).
adjacent(r135, r263).
shared_edge(r135, r263, 1).
adjacent(r135, r71).
shared_edge(r135, r71, 6).
adjacent(r136, r137).
shared_edge(r136, r137, 1).
adjacent(r136, r164).
shared_edge(r136, r164, 1).
adjacent(r136, r185).
shared_edge(r136, r185, 2).
adjacent(r137, r164).
shared_edge(r137, r164, 1).
adjacent(r137, r41).
shared_edge(r137, r41, 1).
adjacent(r138, r139).
shared_edge(r138, r139, 1).
adjacent(r138, r166).
shared_edge(r138, r166, 1).
adjacent(r139, r140).
shared_edge(r139, r140, 2).
adjacent(r139, r166).
shared_edge(r139, r166, 2).
adjacent(r139, r167).
shared_edge(r139, r167, 1).
adjacent(r139, r186).
shared_edge(r139, r186, 1).
adjacent(r139, r93).
shared_edge(r139, r93, 1).
adjacent(r14, r15).
shared_edge(r14, r15, 2).
adjacent(r140, r141).
shared_edge(r140, r141, 1).
adjacent(r140, r93).
shared_edge(r140, r93, 1).
adjacent(r141, r167).
shared_edge(r141, r167, 1).
adjacent(r143, r144).
shared_edge(r143, r144, 2).
adjacent(r143, r147).
shared_edge(r143, r147, 2).
adjacent(r143, r170).
shared_edge(r143, r170, 2).
adjacent(r143, r171).
shared_edge(r143, r171, 1).
adjacent(r143, r192).
shared_edge(r143, r192, 2).
adjacent(r143, r193).
shared_edge(r143, r193, 3).
adjacent(r143, r195).
shared_edge(r143, r195, 4).
adjacent(r143, r213).
shared_edge(r143, r213, 3).
adjacent(r143, r214).
shared_edge(r143, r214, 1).
adjacent(r143, r235).
shared_edge(r143, r235, 1).
adjacent(r143, r236).
shared_edge(r143, r236, 2).
adjacent(r143, r256).
shared_edge(r143, r256, 2).
adjacent(r143, r270).
shared_edge(r143, r270, 3).
adjacent(r143, r271).
shared_edge(r143, r271, 1).
adjacent(r143, r272).
shared_edge(r143, r272, 1).
adjacent(r143, r290).
shared_edge(r143, r290, 2).
adjacent(r143, r301).
shared_edge(r143, r301, 1).
adjacent(r143, r44).
shared_edge(r143, r44, 1).
adjacent(r144, r145).
shared_edge(r144, r145, 1).
adjacent(r144, r44).
shared_edge(r144, r44, 1).
adjacent(r145, r170).
shared_edge(r145, r170, 1).
adjacent(r146, r147).
shared_edge(r146, r147, 2).
adjacent(r146, r171).
shared_edge(r146, r171, 1).
adjacent(r146, r193).
shared_edge(r146, r193, 2).
adjacent(r147, r148).
shared_edge(r147, r148, 2).
adjacent(r147, r149).
shared_edge(r147, r149, 2).
adjacent(r147, r193).
shared_edge(r147, r193, 1).
adjacent(r147, r194).
shared_edge(r147, r194, 1).
adjacent(r147, r214).
shared_edge(r147, r214, 1).
adjacent(r148, r149).
shared_edge(r148, r149, 1).
adjacent(r149, r150).
shared_edge(r149, r150, 2).
adjacent(r149, r98).
shared_edge(r149, r98, 1).
adjacent(r15, r16).
shared_edge(r15, r16, 2).
adjacent(r150, r194).
shared_edge(r150, r194, 1).
adjacent(r150, r81).
shared_edge(r150, r81, 3).
adjacent(r151, r152).
shared_edge(r151, r152, 1).
adjacent(r151, r172).
shared_edge(r151, r172, 2).
adjacent(r151, r2).
shared_edge(r151, r2, 2).
adjacent(r152, r153).
shared_edge(r152, r153, 1).
adjacent(r152, r173).
shared_edge(r152, r173, 2).
adjacent(r152, r63).
shared_edge(r152, r63, 2).
adjacent(r153, r154).
shared_edge(r153, r154, 1).
adjacent(r153, r174).
shared_edge(r153, r174, 1).
adjacent(r153, r175).
shared_edge(r153, r175, 1).
adjacent(r153, r64).
shared_edge(r153, r64, 2).
adjacent(r154, r155).
shared_edge(r154, r155, 1).
adjacent(r154, r176).
shared_edge(r154, r176, 1).
adjacent(r154, r65).
shared_edge(r154, r65, 1).
adjacent(r155, r156).
shared_edge(r155, r156, 1).
adjacent(r155, r177).
shared_edge(r155, r177, 3).
adjacent(r155, r65).
shared_edge(r155, r65, 3).
adjacent(r156, r157).
shared_edge(r156, r157, 1).
adjacent(r156, r178).
shared_edge(r156, r178, 1).
adjacent(r157, r158).
shared_edge(r157, r158, 1).
adjacent(r157, r179).
shared_edge(r157, r179, 1).
adjacent(r157, r83).
shared_edge(r157, r83, 1).
adjacent(r158, r159).
shared_edge(r158, r159, 1).
adjacent(r158, r180).
shared_edge(r158, r180, 1).
adjacent(r158, r83).
shared_edge(r158, r83, 1).
adjacent(r16, r17).
shared_edge(r16, r17, 2).
adjacent(r16, r30).
shared_edge(r16, r30, 2).
adjacent(r16, r57).
shared_edge(r16, r57, 2).
adjacent(r160, r68).
shared_edge(r160, r68, 3).
adjacent(r161, r162).
shared_edge(r161, r162, 1).
adjacent(r161, r181).
shared_edge(r161, r181, 1).
adjacent(r161, r182).
shared_edge(r161, r182, 1).
adjacent(r162, r182).
shared_edge(r162, r182, 3).
adjacent(r162, r204).
shared_edge(r162, r204, 3).
adjacent(r162, r247).
shared_edge(r162, r247, 1).
adjacent(r162, r261).
shared_edge(r162, r261, 1).
adjacent(r162, r89).
shared_edge(r162, r89, 2).
adjacent(r163, r183).
shared_edge(r163, r183, 1).
adjacent(r164, r185).
shared_edge(r164, r185, 1).
adjacent(r164, r207).
shared_edge(r164, r207, 1).
adjacent(r164, r93).
shared_edge(r164, r93, 2).
adjacent(r165, r166).
shared_edge(r165, r166, 2).
adjacent(r166, r168).
shared_edge(r166, r168, 2).
adjacent(r166, r186).
shared_edge(r166, r186, 2).
adjacent(r166, r208).
shared_edge(r166, r208, 2).
adjacent(r166, r230).
shared_edge(r166, r230, 3).
adjacent(r167, r168).
shared_edge(r167, r168, 1).
adjacent(r167, r187).
shared_edge(r167, r187, 1).
adjacent(r168, r187).
shared_edge(r168, r187, 2).
adjacent(r168, r231).
shared_edge(r168, r231, 4).
adjacent(r17, r18).
shared_edge(r17, r18, 1).
adjacent(r17, r30).
shared_edge(r17, r30, 2).
adjacent(r170, r171).
shared_edge(r170, r171, 1).
adjacent(r172, r173).
shared_edge(r172, r173, 1).
adjacent(r172, r196).
shared_edge(r172, r196, 2).
adjacent(r173, r174).
shared_edge(r173, r174, 1).
adjacent(r173, r197).
shared_edge(r173, r197, 1).
adjacent(r173, r198).
shared_edge(r173, r198, 1).
adjacent(r174, r175).
shared_edge(r174, r175, 1).
adjacent(r174, r199).
shared_edge(r174, r199, 1).
adjacent(r175, r176).
shared_edge(r175, r176, 1).
adjacent(r175, r200).
shared_edge(r175, r200, 1).
adjacent(r176, r177).
shared_edge(r176, r177, 1).
adjacent(r176, r201).
shared_edge(r176, r201, 1).
adjacent(r177, r178).
shared_edge(r177, r178, 1).
adjacent(r177, r202).
shared_edge(r177, r202, 3).
adjacent(r178, r179).
shared_edge(r178, r179, 1).
adjacent(r178, r203).
shared_edge(r178, r203, 1).
adjacent(r179, r180).
shared_edge(r179, r180, 1).
adjacent(r18, r19).
shared_edge(r18, r19, 1).
adjacent(r18, r31).
shared_edge(r18, r31, 2).
adjacent(r181, r182).
shared_edge(r181, r182, 3).
adjacent(r181, r68).
shared_edge(r181, r68, 2).
adjacent(r182, r224).
shared_edge(r182, r224, 1).
adjacent(r182, r247).
shared_edge(r182, r247, 2).
adjacent(r183, r184).
shared_edge(r183, r184, 1).
adjacent(r183, r205).
shared_edge(r183, r205, 1).
adjacent(r184, r185).
shared_edge(r184, r185, 1).
adjacent(r184, r206).
shared_edge(r184, r206, 1).
adjacent(r185, r206).
shared_edge(r185, r206, 2).
adjacent(r185, r207).
shared_edge(r185, r207, 1).
adjacent(r185, r226).
shared_edge(r185, r226, 1).
adjacent(r185, r227).
shared_edge(r185, r227, 1).
adjacent(r186, r187).
shared_edge(r186, r187, 1).
adjacent(r188, r189).
shared_edge(r188, r189, 1).
adjacent(r188, r209).
shared_edge(r188, r209, 1).
adjacent(r189, r190).
shared_edge(r189, r190, 1).
adjacent(r189, r210).
shared_edge(r189, r210, 1).
adjacent(r19, r20).
shared_edge(r19, r20, 7).
adjacent(r19, r32).
shared_edge(r19, r32, 2).
adjacent(r19, r46).
shared_edge(r19, r46, 1).
adjacent(r19, r47).
shared_edge(r19, r47, 2).
adjacent(r19, r61).
shared_edge(r19, r61, 1).
adjacent(r19, r62).
shared_edge(r19, r62, 2).
adjacent(r19, r80).
shared_edge(r19, r80, 1).
adjacent(r190, r211).
shared_edge(r190, r211, 1).
adjacent(r191, r192).
shared_edge(r191, r192, 1).
adjacent(r191, r44).
shared_edge(r191, r44, 3).
adjacent(r192, r212).
shared_edge(r192, r212, 2).
adjacent(r194, r195).
shared_edge(r194, r195, 3).
adjacent(r194, r214).
shared_edge(r194, r214, 1).
adjacent(r195, r214).
shared_edge(r195, r214, 1).
adjacent(r195, r237).
shared_edge(r195, r237, 3).
adjacent(r195, r272).
shared_edge(r195, r272, 1).
adjacent(r195, r273).
shared_edge(r195, r273, 1).
adjacent(r195, r81).
shared_edge(r195, r81, 7).
adjacent(r196, r197).
shared_edge(r196, r197, 1).
adjacent(r196, r216).
shared_edge(r196, r216, 2).
adjacent(r197, r198).
shared_edge(r197, r198, 1).
adjacent(r197, r217).
shared_edge(r197, r217, 1).
adjacent(r198, r199).
shared_edge(r198, r199, 1).
adjacent(r198, r217).
shared_edge(r198, r217, 1).
adjacent(r198, r218).
shared_edge(r198, r218, 1).
adjacent(r198, r219).
shared_edge(r198, r219, 1).
adjacent(r199, r200).
shared_edge(r199, r200, 1).
adjacent(r199, r218).
shared_edge(r199, r218, 1).
adjacent(r2, r24).
shared_edge(r2, r24, 2).
adjacent(r2, r3).
shared_edge(r2, r3, 1).
adjacent(r2, r33).
shared_edge(r2, r33, 3).
adjacent(r2, r48).
shared_edge(r2, r48, 3).
adjacent(r2, r63).
shared_edge(r2, r63, 13).
adjacent(r20, r21).
shared_edge(r20, r21, 12).
adjacent(r20, r81).
shared_edge(r20, r81, 19).
adjacent(r20, r99).
shared_edge(r20, r99, 14).
adjacent(r200, r201).
shared_edge(r200, r201, 1).
adjacent(r200, r219).
shared_edge(r200, r219, 1).
adjacent(r201, r202).
shared_edge(r201, r202, 1).
adjacent(r201, r220).
shared_edge(r201, r220, 1).
adjacent(r202, r203).
shared_edge(r202, r203, 1).
adjacent(r202, r221).
shared_edge(r202, r221, 2).
adjacent(r202, r222).
shared_edge(r202, r222, 2).
adjacent(r202, r242).
shared_edge(r202, r242, 1).
adjacent(r204, r262).
shared_edge(r204, r262, 1).
adjacent(r204, r71).
shared_edge(r204, r71, 3).
adjacent(r204, r89).
shared_edge(r204, r89, 1).
adjacent(r205, r206).
shared_edge(r205, r206, 3).
adjacent(r205, r264).
shared_edge(r205, r264, 1).
adjacent(r206, r225).
shared_edge(r206, r225, 3).
adjacent(r206, r248).
shared_edge(r206, r248, 1).
adjacent(r206, r265).
shared_edge(r206, r265, 1).
adjacent(r206, r266).
shared_edge(r206, r266, 1).
adjacent(r207, r227).
shared_edge(r207, r227, 1).
adjacent(r207, r93).
shared_edge(r207, r93, 1).
adjacent(r208, r229).
shared_edge(r208, r229, 1).
adjacent(r209, r210).
shared_edge(r209, r210, 1).
adjacent(r209, r234).
shared_edge(r209, r234, 1).
adjacent(r21, r22).
shared_edge(r21, r22, 9).
adjacent(r210, r211).
shared_edge(r210, r211, 1).
adjacent(r210, r234).
shared_edge(r210, r234, 1).
adjacent(r211, r234).
shared_edge(r211, r234, 1).
adjacent(r212, r213).
shared_edge(r212, r213, 3).
adjacent(r212, r235).
shared_edge(r212, r235, 2).
adjacent(r212, r256).
shared_edge(r212, r256, 3).
adjacent(r212, r271).
shared_edge(r212, r271, 8).
adjacent(r212, r290).
shared_edge(r212, r290, 1).
adjacent(r212, r300).
shared_edge(r212, r300, 2).
adjacent(r212, r347).
shared_edge(r212, r347, 1).
adjacent(r212, r363).
shared_edge(r212, r363, 1).
adjacent(r212, r364).
shared_edge(r212, r364, 2).
adjacent(r212, r381).
shared_edge(r212, r381, 3).
adjacent(r215, r22).
shared_edge(r215, r22, 7).
adjacent(r216, r217).
shared_edge(r216, r217, 1).
adjacent(r216, r238).
shared_edge(r216, r238, 1).
adjacent(r216, r239).
shared_edge(r216, r239, 1).
adjacent(r217, r240).
shared_edge(r217, r240, 1).
adjacent(r218, r219).
shared_edge(r218, r219, 2).
adjacent(r219, r220).
shared_edge(r219, r220, 2).
adjacent(r219, r238).
shared_edge(r219, r238, 1).
adjacent(r219, r239).
shared_edge(r219, r239, 1).
adjacent(r219, r240).
shared_edge(r219, r240, 2).
adjacent(r219, r241).
shared_edge(r219, r241, 1).
adjacent(r219, r275).
shared_edge(r219, r275, 7).
adjacent(r219, r291).
shared_edge(r219, r291, 2).
adjacent(r219, r303).
shared_edge(r219, r303, 2).
adjacent(r219, r304).
shared_edge(r219, r304, 2).
adjacent(r219, r314).
shared_edge(r219, r314, 18).
adjacent(r219, r386).
shared_edge(r219, r386, 1).
adjacent(r219, r387).
shared_edge(r219, r387, 3).
adjacent(r219, r406).
shared_edge(r219, r406, 2).
adjacent(r219, r444).
shared_edge(r219, r444, 5).
adjacent(r219, r445).
shared_edge(r219, r445, 2).
adjacent(r219, r458).
shared_edge(r219, r458, 32).
adjacent(r219, r474).
shared_edge(r219, r474, 5).
adjacent(r219, r491).
shared_edge(r219, r491, 9).
adjacent(r219, r504).
shared_edge(r219, r504, 4).
adjacent(r219, r71).
shared_edge(r219, r71, 2).
adjacent(r22, r23).
shared_edge(r22, r23, 19).
adjacent(r22, r313).
shared_edge(r22, r313, 5).
adjacent(r22, r99).
shared_edge(r22, r99, 25).
adjacent(r220, r221).
shared_edge(r220, r221, 1).
adjacent(r221, r241).
shared_edge(r221, r241, 1).
adjacent(r223, r224).
shared_edge(r223, r224, 1).
adjacent(r223, r246).
shared_edge(r223, r246, 1).
adjacent(r223, r68).
shared_edge(r223, r68, 2).
adjacent(r224, r247).
shared_edge(r224, r247, 1).
adjacent(r224, r68).
shared_edge(r224, r68, 1).
adjacent(r225, r226).
shared_edge(r225, r226, 1).
adjacent(r226, r227).
shared_edge(r226, r227, 1).
adjacent(r226, r248).
shared_edge(r226, r248, 1).
adjacent(r227, r249).
shared_edge(r227, r249, 1).
adjacent(r227, r71).
shared_edge(r227, r71, 1).
adjacent(r227, r93).
shared_edge(r227, r93, 1).
adjacent(r228, r229).
shared_edge(r228, r229, 1).
adjacent(r228, r230).
shared_edge(r228, r230, 1).
adjacent(r229, r230).
shared_edge(r229, r230, 2).
adjacent(r230, r231).
shared_edge(r230, r231, 7).
adjacent(r230, r254).
shared_edge(r230, r254, 1).
adjacent(r231, r232).
shared_edge(r231, r232, 1).
adjacent(r231, r253).
shared_edge(r231, r253, 1).
adjacent(r231, r254).
shared_edge(r231, r254, 1).
adjacent(r231, r255).
shared_edge(r231, r255, 3).
adjacent(r231, r285).
shared_edge(r231, r285, 11).
adjacent(r231, r286).
shared_edge(r231, r286, 5).
adjacent(r231, r299).
shared_edge(r231, r299, 2).
adjacent(r231, r321).
shared_edge(r231, r321, 2).
adjacent(r232, r233).
shared_edge(r232, r233, 2).
adjacent(r233, r234).
shared_edge(r233, r234, 3).
adjacent(r233, r255).
shared_edge(r233, r255, 2).
adjacent(r233, r287).
shared_edge(r233, r287, 2).
adjacent(r234, r268).
shared_edge(r234, r268, 2).
adjacent(r234, r288).
shared_edge(r234, r288, 2).
adjacent(r235, r236).
shared_edge(r235, r236, 1).
adjacent(r236, r256).
shared_edge(r236, r256, 1).
adjacent(r237, r81).
shared_edge(r237, r81, 1).
adjacent(r238, r239).
shared_edge(r238, r239, 1).
adjacent(r239, r240).
shared_edge(r239, r240, 1).
adjacent(r24, r34).
shared_edge(r24, r34, 1).
adjacent(r24, r4).
shared_edge(r24, r4, 1).
adjacent(r241, r242).
shared_edge(r241, r242, 1).
adjacent(r243, r244).
shared_edge(r243, r244, 1).
adjacent(r243, r260).
shared_edge(r243, r260, 2).
adjacent(r244, r245).
shared_edge(r244, r245, 1).
adjacent(r244, r246).
shared_edge(r244, r246, 2).
adjacent(r244, r68).
shared_edge(r244, r68, 2).
adjacent(r245, r246).
shared_edge(r245, r246, 2).
adjacent(r245, r68).
shared_edge(r245, r68, 1).
adjacent(r246, r247).
shared_edge(r246, r247, 2).
adjacent(r246, r259).
shared_edge(r246, r259, 1).
adjacent(r246, r260).
shared_edge(r246, r260, 3).
adjacent(r246, r278).
shared_edge(r246, r278, 9).
adjacent(r246, r279).
shared_edge(r246, r279, 2).
adjacent(r246, r280).
shared_edge(r246, r280, 4).
adjacent(r246, r292).
shared_edge(r246, r292, 2).
adjacent(r246, r305).
shared_edge(r246, r305, 3).
adjacent(r246, r315).
shared_edge(r246, r315, 4).
adjacent(r246, r349).
shared_edge(r246, r349, 3).
adjacent(r246, r388).
shared_edge(r246, r388, 14).
adjacent(r246, r389).
shared_edge(r246, r389, 2).
adjacent(r246, r407).
shared_edge(r246, r407, 2).
adjacent(r246, r419).
shared_edge(r246, r419, 2).
adjacent(r247, r261).
shared_edge(r247, r261, 2).
adjacent(r247, r280).
shared_edge(r247, r280, 3).
adjacent(r247, r294).
shared_edge(r247, r294, 1).
adjacent(r248, r249).
shared_edge(r248, r249, 1).
adjacent(r248, r71).
shared_edge(r248, r71, 1).
adjacent(r249, r71).
shared_edge(r249, r71, 2).
adjacent(r25, r26).
shared_edge(r25, r26, 1).
adjacent(r25, r38).
shared_edge(r25, r38, 1).
adjacent(r25, r6).
shared_edge(r25, r6, 2).
adjacent(r250, r251).
shared_edge(r250, r251, 1).
adjacent(r250, r71).
shared_edge(r250, r71, 2).
adjacent(r250, r93).
shared_edge(r250, r93, 1).
adjacent(r251, r252).
shared_edge(r251, r252, 1).
adjacent(r251, r71).
shared_edge(r251, r71, 1).
adjacent(r251, r93).
shared_edge(r251, r93, 1).
adjacent(r252, r253).
shared_edge(r252, r253, 1).
adjacent(r252, r267).
shared_edge(r252, r267, 1).
adjacent(r252, r93).
shared_edge(r252, r93, 1).
adjacent(r253, r267).
shared_edge(r253, r267, 1).
adjacent(r253, r283).
shared_edge(r253, r283, 1).
adjacent(r253, r284).
shared_edge(r253, r284, 2).
adjacent(r253, r285).
shared_edge(r253, r285, 2).
adjacent(r255, r286).
shared_edge(r255, r286, 1).
adjacent(r257, r81).
shared_edge(r257, r81, 6).
adjacent(r257, r99).
shared_edge(r257, r99, 6).
adjacent(r258, r259).
shared_edge(r258, r259, 1).
adjacent(r258, r277).
shared_edge(r258, r277, 1).
adjacent(r259, r260).
shared_edge(r259, r260, 1).
adjacent(r259, r278).
shared_edge(r259, r278, 1).
adjacent(r26, r27).
shared_edge(r26, r27, 1).
adjacent(r26, r39).
shared_edge(r26, r39, 1).
adjacent(r26, r7).
shared_edge(r26, r7, 1).
adjacent(r261, r262).
shared_edge(r261, r262, 2).
adjacent(r261, r295).
shared_edge(r261, r295, 1).
adjacent(r262, r71).
shared_edge(r262, r71, 3).
adjacent(r263, r264).
shared_edge(r263, r264, 1).
adjacent(r263, r281).
shared_edge(r263, r281, 1).
adjacent(r263, r71).
shared_edge(r263, r71, 1).
adjacent(r264, r265).
shared_edge(r264, r265, 1).
adjacent(r264, r281).
shared_edge(r264, r281, 1).
adjacent(r264, r282).
shared_edge(r264, r282, 1).
adjacent(r264, r297).
shared_edge(r264, r297, 1).
adjacent(r265, r266).
shared_edge(r265, r266, 1).
adjacent(r265, r282).
shared_edge(r265, r282, 1).
adjacent(r266, r71).
shared_edge(r266, r71, 2).
adjacent(r267, r71).
shared_edge(r267, r71, 2).
adjacent(r268, r269).
shared_edge(r268, r269, 1).
adjacent(r268, r289).
shared_edge(r268, r289, 1).
adjacent(r269, r288).
shared_edge(r269, r288, 1).
adjacent(r27, r8).
shared_edge(r27, r8, 1).
adjacent(r27, r9).
shared_edge(r27, r9, 1).
adjacent(r270, r271).
shared_edge(r270, r271, 3).
adjacent(r271, r272).
shared_edge(r271, r272, 10).
adjacent(r271, r301).
shared_edge(r271, r301, 2).
adjacent(r271, r365).
shared_edge(r271, r365, 2).
adjacent(r271, r366).
shared_edge(r271, r366, 1).
adjacent(r271, r382).
shared_edge(r271, r382, 2).
adjacent(r271, r383).
shared_edge(r271, r383, 2).
adjacent(r271, r384).
shared_edge(r271, r384, 2).
adjacent(r271, r403).
shared_edge(r271, r403, 1).
adjacent(r272, r273).
shared_edge(r272, r273, 7).
adjacent(r272, r348).
shared_edge(r272, r348, 2).
adjacent(r272, r367).
shared_edge(r272, r367, 1).
adjacent(r273, r274).
shared_edge(r273, r274, 7).
adjacent(r273, r81).
shared_edge(r273, r81, 5).
adjacent(r274, r81).
shared_edge(r274, r81, 13).
adjacent(r276, r277).
shared_edge(r276, r277, 2).
adjacent(r277, r278).
shared_edge(r277, r278, 12).
adjacent(r277, r291).
shared_edge(r277, r291, 2).
adjacent(r277, r304).
shared_edge(r277, r304, 7).
adjacent(r277, r386).
shared_edge(r277, r386, 1).
adjacent(r277, r387).
shared_edge(r277, r387, 5).
adjacent(r277, r388).
shared_edge(r277, r388, 14).
adjacent(r277, r445).
shared_edge(r277, r445, 5).
adjacent(r277, r459).
shared_edge(r277, r459, 6).
adjacent(r277, r474).
shared_edge(r277, r474, 3).
adjacent(r279, r280).
shared_edge(r279, r280, 2).
adjacent(r28, r41).
shared_edge(r28, r41, 5).
adjacent(r280, r292).
shared_edge(r280, r292, 2).
adjacent(r280, r293).
shared_edge(r280, r293, 2).
adjacent(r280, r305).
shared_edge(r280, r305, 3).
adjacent(r280, r306).
shared_edge(r280, r306, 3).
adjacent(r280, r315).
shared_edge(r280, r315, 2).
adjacent(r280, r316).
shared_edge(r280, r316, 1).
adjacent(r280, r324).
shared_edge(r280, r324, 4).
adjacent(r280, r325).
shared_edge(r280, r325, 1).
adjacent(r280, r335).
shared_edge(r280, r335, 1).
adjacent(r280, r349).
shared_edge(r280, r349, 3).
adjacent(r280, r350).
shared_edge(r280, r350, 1).
adjacent(r281, r296).
shared_edge(r281, r296, 1).
adjacent(r281, r71).
shared_edge(r281, r71, 1).
adjacent(r282, r298).
shared_edge(r282, r298, 1).
adjacent(r282, r71).
shared_edge(r282, r71, 1).
adjacent(r283, r284).
shared_edge(r283, r284, 2).
adjacent(r283, r71).
shared_edge(r283, r71, 1).
adjacent(r284, r285).
shared_edge(r284, r285, 8).
adjacent(r284, r311).
shared_edge(r284, r311, 2).
adjacent(r284, r320).
shared_edge(r284, r320, 2).
adjacent(r284, r328).
shared_edge(r284, r328, 1).
adjacent(r284, r338).
shared_edge(r284, r338, 1).
adjacent(r284, r339).
shared_edge(r284, r339, 1).
adjacent(r284, r71).
shared_edge(r284, r71, 1).
adjacent(r285, r340).
shared_edge(r285, r340, 3).
adjacent(r285, r341).
shared_edge(r285, r341, 1).
adjacent(r285, r355).
shared_edge(r285, r355, 3).
adjacent(r286, r287).
shared_edge(r286, r287, 3).
adjacent(r286, r288).
shared_edge(r286, r288, 6).
adjacent(r286, r299).
shared_edge(r286, r299, 2).
adjacent(r286, r321).
shared_edge(r286, r321, 2).
adjacent(r286, r329).
shared_edge(r286, r329, 2).
adjacent(r286, r341).
shared_edge(r286, r341, 4).
adjacent(r286, r357).
shared_edge(r286, r357, 2).
adjacent(r286, r371).
shared_edge(r286, r371, 1).
adjacent(r286, r372).
shared_edge(r286, r372, 1).
adjacent(r286, r373).
shared_edge(r286, r373, 1).
adjacent(r287, r288).
shared_edge(r287, r288, 1).
adjacent(r288, r289).
shared_edge(r288, r289, 3).
adjacent(r288, r322).
shared_edge(r288, r322, 6).
adjacent(r288, r323).
shared_edge(r288, r323, 3).
adjacent(r288, r329).
shared_edge(r288, r329, 1).
adjacent(r288, r330).
shared_edge(r288, r330, 3).
adjacent(r288, r342).
shared_edge(r288, r342, 6).
adjacent(r288, r343).
shared_edge(r288, r343, 2).
adjacent(r288, r357).
shared_edge(r288, r357, 2).
adjacent(r29, r41).
shared_edge(r29, r41, 3).
adjacent(r290, r300).
shared_edge(r290, r300, 1).
adjacent(r293, r294).
shared_edge(r293, r294, 1).
adjacent(r293, r307).
shared_edge(r293, r307, 1).
adjacent(r294, r295).
shared_edge(r294, r295, 1).
adjacent(r294, r308).
shared_edge(r294, r308, 1).
adjacent(r295, r71).
shared_edge(r295, r71, 2).
adjacent(r296, r297).
shared_edge(r296, r297, 1).
adjacent(r296, r309).
shared_edge(r296, r309, 1).
adjacent(r296, r71).
shared_edge(r296, r71, 1).
adjacent(r297, r298).
shared_edge(r297, r298, 1).
adjacent(r297, r309).
shared_edge(r297, r309, 2).
adjacent(r297, r310).
shared_edge(r297, r310, 2).
adjacent(r297, r71).
shared_edge(r297, r71, 1).
adjacent(r298, r310).
shared_edge(r298, r310, 1).
adjacent(r298, r71).
shared_edge(r298, r71, 1).
adjacent(r3, r4).
shared_edge(r3, r4, 2).
adjacent(r30, r31).
shared_edge(r30, r31, 1).
adjacent(r30, r44).
shared_edge(r30, r44, 2).
adjacent(r30, r57).
shared_edge(r30, r57, 1).
adjacent(r300, r301).
shared_edge(r300, r301, 1).
adjacent(r302, r81).
shared_edge(r302, r81, 3).
adjacent(r302, r99).
shared_edge(r302, r99, 3).
adjacent(r303, r304).
shared_edge(r303, r304, 2).
adjacent(r304, r314).
shared_edge(r304, r314, 10).
adjacent(r304, r386).
shared_edge(r304, r386, 1).
adjacent(r304, r406).
shared_edge(r304, r406, 2).
adjacent(r306, r307).
shared_edge(r306, r307, 1).
adjacent(r307, r308).
shared_edge(r307, r308, 1).
adjacent(r307, r316).
shared_edge(r307, r316, 1).
adjacent(r308, r317).
shared_edge(r308, r317, 1).
adjacent(r308, r71).
shared_edge(r308, r71, 1).
adjacent(r309, r326).
shared_edge(r309, r326, 1).
adjacent(r309, r71).
shared_edge(r309, r71, 2).
adjacent(r31, r32).
shared_edge(r31, r32, 1).
adjacent(r31, r44).
shared_edge(r31, r44, 1).
adjacent(r31, r45).
shared_edge(r31, r45, 1).
adjacent(r310, r71).
shared_edge(r310, r71, 3).
adjacent(r311, r319).
shared_edge(r311, r319, 1).
adjacent(r311, r71).
shared_edge(r311, r71, 1).
adjacent(r312, r313).
shared_edge(r312, r313, 13).
adjacent(r312, r404).
shared_edge(r312, r404, 1).
adjacent(r312, r431).
shared_edge(r312, r431, 2).
adjacent(r312, r81).
shared_edge(r312, r81, 10).
adjacent(r312, r99).
shared_edge(r312, r99, 2).
adjacent(r313, r431).
shared_edge(r313, r431, 6).
adjacent(r316, r317).
shared_edge(r316, r317, 1).
adjacent(r316, r325).
shared_edge(r316, r325, 1).
adjacent(r317, r71).
shared_edge(r317, r71, 2).
adjacent(r318, r319).
shared_edge(r318, r319, 1).
adjacent(r318, r71).
shared_edge(r318, r71, 3).
adjacent(r319, r320).
shared_edge(r319, r320, 1).
adjacent(r319, r327).
shared_edge(r319, r327, 1).
adjacent(r32, r46).
shared_edge(r32, r46, 1).
adjacent(r320, r328).
shared_edge(r320, r328, 1).
adjacent(r324, r335).
shared_edge(r324, r335, 1).
adjacent(r324, r351).
shared_edge(r324, r351, 1).
adjacent(r325, r71).
shared_edge(r325, r71, 2).
adjacent(r326, r336).
shared_edge(r326, r336, 1).
adjacent(r326, r71).
shared_edge(r326, r71, 2).
adjacent(r327, r328).
shared_edge(r327, r328, 1).
adjacent(r327, r71).
shared_edge(r327, r71, 2).
adjacent(r328, r337).
shared_edge(r328, r337, 1).
adjacent(r329, r330).
shared_edge(r329, r330, 1).
adjacent(r33, r34).
shared_edge(r33, r34, 1).
adjacent(r33, r49).
shared_edge(r33, r49, 2).
adjacent(r331, r332).
shared_edge(r331, r332, 1).
adjacent(r331, r345).
shared_edge(r331, r345, 1).
adjacent(r332, r333).
shared_edge(r332, r333, 1).
adjacent(r332, r345).
shared_edge(r332, r345, 1).
adjacent(r333, r334).
shared_edge(r333, r334, 1).
adjacent(r333, r345).
shared_edge(r333, r345, 1).
adjacent(r334, r345).
shared_edge(r334, r345, 1).
adjacent(r335, r71).
shared_edge(r335, r71, 2).
adjacent(r336, r71).
shared_edge(r336, r71, 3).
adjacent(r337, r338).
shared_edge(r337, r338, 1).
adjacent(r337, r71).
shared_edge(r337, r71, 2).
adjacent(r338, r339).
shared_edge(r338, r339, 1).
adjacent(r338, r352).
shared_edge(r338, r352, 1).
adjacent(r338, r369).
shared_edge(r338, r369, 1).
adjacent(r338, r71).
shared_edge(r338, r71, 1).
adjacent(r339, r340).
shared_edge(r339, r340, 1).
adjacent(r339, r352).
shared_edge(r339, r352, 1).
adjacent(r34, r5).
shared_edge(r34, r5, 2).
adjacent(r340, r353).
shared_edge(r340, r353, 1).
adjacent(r340, r354).
shared_edge(r340, r354, 1).
adjacent(r341, r356).
shared_edge(r341, r356, 3).
adjacent(r342, r343).
shared_edge(r342, r343, 1).
adjacent(r342, r357).
shared_edge(r342, r357, 1).
adjacent(r342, r358).
shared_edge(r342, r358, 2).
adjacent(r342, r376).
shared_edge(r342, r376, 2).
adjacent(r342, r377).
shared_edge(r342, r377, 2).
adjacent(r342, r397).
shared_edge(r342, r397, 1).
adjacent(r342, r398).
shared_edge(r342, r398, 1).
adjacent(r343, r359).
shared_edge(r343, r359, 2).
adjacent(r344, r345).
shared_edge(r344, r345, 1).
adjacent(r344, r362).
shared_edge(r344, r362, 1).
adjacent(r345, r346).
shared_edge(r345, r346, 2).
adjacent(r345, r358).
shared_edge(r345, r358, 1).
adjacent(r345, r361).
shared_edge(r345, r361, 1).
adjacent(r345, r362).
shared_edge(r345, r362, 4).
adjacent(r345, r363).
shared_edge(r345, r363, 4).
adjacent(r345, r377).
shared_edge(r345, r377, 2).
adjacent(r345, r378).
shared_edge(r345, r378, 2).
adjacent(r345, r379).
shared_edge(r345, r379, 3).
adjacent(r345, r398).
shared_edge(r345, r398, 2).
adjacent(r345, r399).
shared_edge(r345, r399, 4).
adjacent(r345, r400).
shared_edge(r345, r400, 3).
adjacent(r345, r412).
shared_edge(r345, r412, 1).
adjacent(r345, r413).
shared_edge(r345, r413, 16).
adjacent(r345, r416).
shared_edge(r345, r416, 2).
adjacent(r345, r417).
shared_edge(r345, r417, 2).
adjacent(r345, r426).
shared_edge(r345, r426, 3).
adjacent(r345, r427).
shared_edge(r345, r427, 2).
adjacent(r345, r430).
shared_edge(r345, r430, 1).
adjacent(r346, r347).
shared_edge(r346, r347, 1).
adjacent(r347, r363).
shared_edge(r347, r363, 1).
adjacent(r348, r368).
shared_edge(r348, r368, 1).
adjacent(r348, r81).
shared_edge(r348, r81, 1).
adjacent(r349, r350).
shared_edge(r349, r350, 2).
adjacent(r35, r36).
shared_edge(r35, r36, 1).
adjacent(r35, r52).
shared_edge(r35, r52, 2).
adjacent(r35, r6).
shared_edge(r35, r6, 3).
adjacent(r350, r351).
shared_edge(r350, r351, 2).
adjacent(r350, r389).
shared_edge(r350, r389, 1).
adjacent(r351, r390).
shared_edge(r351, r390, 1).
adjacent(r351, r71).
shared_edge(r351, r71, 2).
adjacent(r352, r353).
shared_edge(r352, r353, 1).
adjacent(r352, r370).
shared_edge(r352, r370, 1).
adjacent(r353, r354).
shared_edge(r353, r354, 1).
adjacent(r353, r370).
shared_edge(r353, r370, 1).
adjacent(r354, r355).
shared_edge(r354, r355, 1).
adjacent(r354, r356).
shared_edge(r354, r356, 1).
adjacent(r355, r356).
shared_edge(r355, r356, 4).
adjacent(r356, r370).
shared_edge(r356, r370, 9).
adjacent(r356, r371).
shared_edge(r356, r371, 1).
adjacent(r357, r374).
shared_edge(r357, r374, 2).
adjacent(r357, r375).
shared_edge(r357, r375, 1).
adjacent(r358, r359).
shared_edge(r358, r359, 1).
adjacent(r359, r360).
shared_edge(r359, r360, 1).
adjacent(r359, r378).
shared_edge(r359, r378, 1).
adjacent(r359, r379).
shared_edge(r359, r379, 1).
adjacent(r36, r53).
shared_edge(r36, r53, 1).
adjacent(r36, r6).
shared_edge(r36, r6, 2).
adjacent(r360, r361).
shared_edge(r360, r361, 1).
adjacent(r360, r379).
shared_edge(r360, r379, 1).
adjacent(r361, r362).
shared_edge(r361, r362, 1).
adjacent(r363, r364).
shared_edge(r363, r364, 1).
adjacent(r363, r380).
shared_edge(r363, r380, 1).
adjacent(r364, r380).
shared_edge(r364, r380, 1).
adjacent(r365, r366).
shared_edge(r365, r366, 1).
adjacent(r365, r385).
shared_edge(r365, r385, 1).
adjacent(r366, r367).
shared_edge(r366, r367, 2).
adjacent(r367, r368).
shared_edge(r367, r368, 6).
adjacent(r367, r385).
shared_edge(r367, r385, 2).
adjacent(r367, r403).
shared_edge(r367, r403, 1).
adjacent(r368, r400).
shared_edge(r368, r400, 8).
adjacent(r368, r402).
shared_edge(r368, r402, 1).
adjacent(r368, r404).
shared_edge(r368, r404, 8).
adjacent(r368, r418).
shared_edge(r368, r418, 4).
adjacent(r368, r443).
shared_edge(r368, r443, 19).
adjacent(r368, r473).
shared_edge(r368, r473, 1).
adjacent(r368, r489).
shared_edge(r368, r489, 2).
adjacent(r368, r81).
shared_edge(r368, r81, 6).
adjacent(r369, r370).
shared_edge(r369, r370, 1).
adjacent(r369, r391).
shared_edge(r369, r391, 1).
adjacent(r369, r71).
shared_edge(r369, r71, 1).
adjacent(r37, r38).
shared_edge(r37, r38, 1).
adjacent(r37, r53).
shared_edge(r37, r53, 1).
adjacent(r37, r54).
shared_edge(r37, r54, 1).
adjacent(r37, r6).
shared_edge(r37, r6, 3).
adjacent(r37, r72).
shared_edge(r37, r72, 1).
adjacent(r37, r73).
shared_edge(r37, r73, 1).
adjacent(r370, r374).
shared_edge(r370, r374, 2).
adjacent(r370, r392).
shared_edge(r370, r392, 3).
adjacent(r370, r393).
shared_edge(r370, r393, 1).
adjacent(r370, r423).
shared_edge(r370, r423, 2).
adjacent(r370, r424).
shared_edge(r370, r424, 2).
adjacent(r370, r437).
shared_edge(r370, r437, 4).
adjacent(r371, r372).
shared_edge(r371, r372, 1).
adjacent(r371, r393).
shared_edge(r371, r393, 1).
adjacent(r372, r373).
shared_edge(r372, r373, 1).
adjacent(r372, r374).
shared_edge(r372, r374, 1).
adjacent(r373, r374).
shared_edge(r373, r374, 2).
adjacent(r374, r375).
shared_edge(r374, r375, 1).
adjacent(r374, r393).
shared_edge(r374, r393, 2).
adjacent(r374, r394).
shared_edge(r374, r394, 10).
adjacent(r375, r376).
shared_edge(r375, r376, 1).
adjacent(r375, r395).
shared_edge(r375, r395, 1).
adjacent(r376, r396).
shared_edge(r376, r396, 1).
adjacent(r378, r379).
shared_edge(r378, r379, 1).
adjacent(r38, r39).
shared_edge(r38, r39, 1).
adjacent(r38, r54).
shared_edge(r38, r54, 1).
adjacent(r380, r381).
shared_edge(r380, r381, 1).
adjacent(r380, r400).
shared_edge(r380, r400, 1).
adjacent(r381, r382).
shared_edge(r381, r382, 1).
adjacent(r381, r400).
shared_edge(r381, r400, 3).
adjacent(r382, r383).
shared_edge(r382, r383, 1).
adjacent(r382, r400).
shared_edge(r382, r400, 1).
adjacent(r382, r401).
shared_edge(r382, r401, 1).
adjacent(r383, r402).
shared_edge(r383, r402, 1).
adjacent(r384, r385).
shared_edge(r384, r385, 1).
adjacent(r384, r403).
shared_edge(r384, r403, 1).
adjacent(r386, r387).
shared_edge(r386, r387, 1).
adjacent(r387, r444).
shared_edge(r387, r444, 1).
adjacent(r388, r420).
shared_edge(r388, r420, 1).
adjacent(r388, r432).
shared_edge(r388, r432, 1).
adjacent(r388, r446).
shared_edge(r388, r446, 1).
adjacent(r388, r459).
shared_edge(r388, r459, 1).
adjacent(r389, r390).
shared_edge(r389, r390, 1).
adjacent(r390, r407).
shared_edge(r390, r407, 1).
adjacent(r390, r71).
shared_edge(r390, r71, 1).
adjacent(r391, r392).
shared_edge(r391, r392, 1).
adjacent(r391, r410).
shared_edge(r391, r410, 1).
adjacent(r391, r71).
shared_edge(r391, r71, 1).
adjacent(r392, r410).
shared_edge(r392, r410, 2).
adjacent(r392, r423).
shared_edge(r392, r423, 1).
adjacent(r392, r435).
shared_edge(r392, r435, 1).
adjacent(r394, r395).
shared_edge(r394, r395, 2).
adjacent(r394, r411).
shared_edge(r394, r411, 1).
adjacent(r394, r424).
shared_edge(r394, r424, 1).
adjacent(r394, r425).
shared_edge(r394, r425, 2).
adjacent(r394, r438).
shared_edge(r394, r438, 1).
adjacent(r394, r439).
shared_edge(r394, r439, 5).
adjacent(r394, r440).
shared_edge(r394, r440, 1).
adjacent(r394, r453).
shared_edge(r394, r453, 2).
adjacent(r394, r455).
shared_edge(r394, r455, 1).
adjacent(r395, r396).
shared_edge(r395, r396, 1).
adjacent(r396, r397).
shared_edge(r396, r397, 1).
adjacent(r396, r411).
shared_edge(r396, r411, 1).
adjacent(r397, r398).
shared_edge(r397, r398, 1).
adjacent(r397, r412).
shared_edge(r397, r412, 1).
adjacent(r399, r414).
shared_edge(r399, r414, 1).
adjacent(r399, r415).
shared_edge(r399, r415, 1).
adjacent(r4, r5).
shared_edge(r4, r5, 5).
adjacent(r40, r41).
shared_edge(r40, r41, 5).
adjacent(r400, r401).
shared_edge(r400, r401, 2).
adjacent(r400, r417).
shared_edge(r400, r417, 2).
adjacent(r400, r430).
shared_edge(r400, r430, 5).
adjacent(r400, r442).
shared_edge(r400, r442, 6).
adjacent(r400, r457).
shared_edge(r400, r457, 1).
adjacent(r400, r469).
shared_edge(r400, r469, 2).
adjacent(r400, r470).
shared_edge(r400, r470, 2).
adjacent(r400, r471).
shared_edge(r400, r471, 2).
adjacent(r400, r472).
shared_edge(r400, r472, 4).
adjacent(r400, r484).
shared_edge(r400, r484, 4).
adjacent(r400, r485).
shared_edge(r400, r485, 2).
adjacent(r400, r487).
shared_edge(r400, r487, 2).
adjacent(r400, r488).
shared_edge(r400, r488, 4).
adjacent(r401, r402).
shared_edge(r401, r402, 1).
adjacent(r402, r403).
shared_edge(r402, r403, 1).
adjacent(r403, r418).
shared_edge(r403, r418, 2).
adjacent(r404, r405).
shared_edge(r404, r405, 2).
adjacent(r404, r431).
shared_edge(r404, r431, 8).
adjacent(r404, r490).
shared_edge(r404, r490, 2).
adjacent(r404, r501).
shared_edge(r404, r501, 1).
adjacent(r404, r81).
shared_edge(r404, r81, 2).
adjacent(r405, r81).
shared_edge(r405, r81, 2).
adjacent(r407, r408).
shared_edge(r407, r408, 1).
adjacent(r408, r409).
shared_edge(r408, r409, 1).
adjacent(r408, r419).
shared_edge(r408, r419, 1).
adjacent(r408, r71).
shared_edge(r408, r71, 1).
adjacent(r409, r420).
shared_edge(r409, r420, 1).
adjacent(r409, r421).
shared_edge(r409, r421, 1).
adjacent(r409, r422).
shared_edge(r409, r422, 1).
adjacent(r409, r71).
shared_edge(r409, r71, 4).
adjacent(r41, r42).
shared_edge(r41, r42, 2).
adjacent(r41, r43).
shared_edge(r41, r43, 1).
adjacent(r41, r55).
shared_edge(r41, r55, 4).
adjacent(r41, r56).
shared_edge(r41, r56, 2).
adjacent(r41, r74).
shared_edge(r41, r74, 5).
adjacent(r41, r92).
shared_edge(r41, r92, 2).
adjacent(r41, r93).
shared_edge(r41, r93, 29).
adjacent(r41, r94).
shared_edge(r41, r94, 6).
adjacent(r410, r434).
shared_edge(r410, r434, 1).
adjacent(r410, r71).
shared_edge(r410, r71, 2).
adjacent(r411, r412).
shared_edge(r411, r412, 1).
adjacent(r411, r425).
shared_edge(r411, r425, 1).
adjacent(r412, r425).
shared_edge(r412, r425, 1).
adjacent(r413, r414).
shared_edge(r413, r414, 2).
adjacent(r413, r425).
shared_edge(r413, r425, 1).
adjacent(r413, r426).
shared_edge(r413, r426, 1).
adjacent(r413, r428).
shared_edge(r413, r428, 2).
adjacent(r413, r430).
shared_edge(r413, r430, 2).
adjacent(r413, r441).
shared_edge(r413, r441, 1).
adjacent(r413, r456).
shared_edge(r413, r456, 2).
adjacent(r413, r457).
shared_edge(r413, r457, 5).
adjacent(r413, r468).
shared_edge(r413, r468, 1).
adjacent(r413, r482).
shared_edge(r413, r482, 1).
adjacent(r413, r483).
shared_edge(r413, r483, 2).
adjacent(r413, r484).
shared_edge(r413, r484, 9).
adjacent(r413, r499).
shared_edge(r413, r499, 1).
adjacent(r413, r500).
shared_edge(r413, r500, 8).
adjacent(r413, r520).
shared_edge(r413, r520, 1).
adjacent(r413, r531).
shared_edge(r413, r531, 2).
adjacent(r413, r532).
shared_edge(r413, r532, 2).
adjacent(r413, r540).
shared_edge(r413, r540, 2).
adjacent(r413, r541).
shared_edge(r413, r541, 1).
adjacent(r414, r415).
shared_edge(r414, r415, 1).
adjacent(r415, r416).
shared_edge(r415, r416, 1).
adjacent(r415, r428).
shared_edge(r415, r428, 1).
adjacent(r416, r429).
shared_edge(r416, r429, 1).
adjacent(r419, r420).
shared_edge(r419, r420, 1).
adjacent(r420, r421).
shared_edge(r420, r421, 1).
adjacent(r421, r422).
shared_edge(r421, r422, 1).
adjacent(r421, r432).
shared_edge(r421, r432, 1).
adjacent(r422, r433).
shared_edge(r422, r433, 1).
adjacent(r422, r71).
shared_edge(r422, r71, 1).
adjacent(r423, r436).
shared_edge(r423, r436, 1).
adjacent(r424, r438).
shared_edge(r424, r438, 1).
adjacent(r425, r426).
shared_edge(r425, r426, 1).
adjacent(r425, r440).
shared_edge(r425, r440, 2).
adjacent(r425, r441).
shared_edge(r425, r441, 2).
adjacent(r426, r427).
shared_edge(r426, r427, 2).
adjacent(r426, r441).
shared_edge(r426, r441, 1).
adjacent(r428, r429).
shared_edge(r428, r429, 1).
adjacent(r429, r430).
shared_edge(r429, r430, 2).
adjacent(r43, r44).
shared_edge(r43, r44, 5).
adjacent(r43, r57).
shared_edge(r43, r57, 1).
adjacent(r430, r457).
shared_edge(r430, r457, 1).
adjacent(r430, r469).
shared_edge(r430, r469, 1).
adjacent(r431, r502).
shared_edge(r431, r502, 2).
adjacent(r431, r503).
shared_edge(r431, r503, 46).
adjacent(r431, r512).
shared_edge(r431, r512, 28).
adjacent(r432, r433).
shared_edge(r432, r433, 1).
adjacent(r432, r446).
shared_edge(r432, r446, 1).
adjacent(r433, r446).
shared_edge(r433, r446, 1).
adjacent(r433, r461).
shared_edge(r433, r461, 1).
adjacent(r433, r71).
shared_edge(r433, r71, 2).
adjacent(r434, r435).
shared_edge(r434, r435, 1).
adjacent(r434, r450).
shared_edge(r434, r450, 1).
adjacent(r434, r71).
shared_edge(r434, r71, 1).
adjacent(r435, r436).
shared_edge(r435, r436, 1).
adjacent(r435, r451).
shared_edge(r435, r451, 1).
adjacent(r436, r437).
shared_edge(r436, r437, 1).
adjacent(r436, r452).
shared_edge(r436, r452, 1).
adjacent(r437, r438).
shared_edge(r437, r438, 1).
adjacent(r437, r452).
shared_edge(r437, r452, 3).
adjacent(r437, r453).
shared_edge(r437, r453, 1).
adjacent(r438, r453).
shared_edge(r438, r453, 1).
adjacent(r439, r453).
shared_edge(r439, r453, 1).
adjacent(r439, r454).
shared_edge(r439, r454, 4).
adjacent(r44, r45).
shared_edge(r44, r45, 1).
adjacent(r44, r57).
shared_edge(r44, r57, 4).
adjacent(r44, r58).
shared_edge(r44, r58, 3).
adjacent(r44, r75).
shared_edge(r44, r75, 4).
adjacent(r44, r76).
shared_edge(r44, r76, 5).
adjacent(r44, r94).
shared_edge(r44, r94, 3).
adjacent(r440, r456).
shared_edge(r440, r456, 1).
adjacent(r443, r473).
shared_edge(r443, r473, 5).
adjacent(r443, r484).
shared_edge(r443, r484, 1).
adjacent(r443, r485).
shared_edge(r443, r485, 1).
adjacent(r443, r488).
shared_edge(r443, r488, 11).
adjacent(r443, r490).
shared_edge(r443, r490, 2).
adjacent(r443, r501).
shared_edge(r443, r501, 22).
adjacent(r443, r536).
shared_edge(r443, r536, 1).
adjacent(r443, r546).
shared_edge(r443, r546, 2).
adjacent(r443, r547).
shared_edge(r443, r547, 3).
adjacent(r443, r554).
shared_edge(r443, r554, 2).
adjacent(r443, r560).
shared_edge(r443, r560, 1).
adjacent(r444, r445).
shared_edge(r444, r445, 2).
adjacent(r445, r474).
shared_edge(r445, r474, 1).
adjacent(r446, r460).
shared_edge(r446, r460, 1).
adjacent(r447, r448).
shared_edge(r447, r448, 1).
adjacent(r447, r463).
shared_edge(r447, r463, 1).
adjacent(r447, r71).
shared_edge(r447, r71, 2).
adjacent(r448, r449).
shared_edge(r448, r449, 1).
adjacent(r448, r464).
shared_edge(r448, r464, 1).
adjacent(r448, r71).
shared_edge(r448, r71, 1).
adjacent(r449, r450).
shared_edge(r449, r450, 1).
adjacent(r449, r464).
shared_edge(r449, r464, 1).
adjacent(r449, r465).
shared_edge(r449, r465, 1).
adjacent(r449, r477).
shared_edge(r449, r477, 1).
adjacent(r449, r71).
shared_edge(r449, r71, 1).
adjacent(r45, r46).
shared_edge(r45, r46, 1).
adjacent(r45, r59).
shared_edge(r45, r59, 1).
adjacent(r450, r451).
shared_edge(r450, r451, 1).
adjacent(r450, r465).
shared_edge(r450, r465, 1).
adjacent(r451, r452).
shared_edge(r451, r452, 1).
adjacent(r451, r465).
shared_edge(r451, r465, 1).
adjacent(r452, r453).
shared_edge(r452, r453, 1).
adjacent(r452, r466).
shared_edge(r452, r466, 4).
adjacent(r453, r467).
shared_edge(r453, r467, 4).
adjacent(r454, r455).
shared_edge(r454, r455, 1).
adjacent(r454, r467).
shared_edge(r454, r467, 1).
adjacent(r454, r468).
shared_edge(r454, r468, 1).
adjacent(r454, r481).
shared_edge(r454, r481, 1).
adjacent(r454, r482).
shared_edge(r454, r482, 2).
adjacent(r455, r456).
shared_edge(r455, r456, 1).
adjacent(r455, r468).
shared_edge(r455, r468, 1).
adjacent(r457, r469).
shared_edge(r457, r469, 1).
adjacent(r458, r573).
shared_edge(r458, r573, 2).
adjacent(r458, r71).
shared_edge(r458, r71, 9).
adjacent(r459, r460).
shared_edge(r459, r460, 2).
adjacent(r459, r474).
shared_edge(r459, r474, 1).
adjacent(r459, r491).
shared_edge(r459, r491, 6).
adjacent(r46, r47).
shared_edge(r46, r47, 1).
adjacent(r46, r59).
shared_edge(r46, r59, 1).
adjacent(r46, r60).
shared_edge(r46, r60, 1).
adjacent(r460, r461).
shared_edge(r460, r461, 2).
adjacent(r460, r492).
shared_edge(r460, r492, 1).
adjacent(r461, r492).
shared_edge(r461, r492, 1).
adjacent(r461, r504).
shared_edge(r461, r504, 2).
adjacent(r461, r71).
shared_edge(r461, r71, 6).
adjacent(r462, r463).
shared_edge(r462, r463, 1).
adjacent(r462, r475).
shared_edge(r462, r475, 1).
adjacent(r462, r71).
shared_edge(r462, r71, 4).
adjacent(r463, r464).
shared_edge(r463, r464, 1).
adjacent(r463, r475).
shared_edge(r463, r475, 1).
adjacent(r464, r476).
shared_edge(r464, r476, 1).
adjacent(r465, r466).
shared_edge(r465, r466, 1).
adjacent(r465, r478).
shared_edge(r465, r478, 1).
adjacent(r465, r479).
shared_edge(r465, r479, 1).
adjacent(r466, r467).
shared_edge(r466, r467, 1).
adjacent(r466, r479).
shared_edge(r466, r479, 1).
adjacent(r466, r480).
shared_edge(r466, r480, 4).
adjacent(r466, r497).
shared_edge(r466, r497, 1).
adjacent(r467, r481).
shared_edge(r467, r481, 4).
adjacent(r468, r482).
shared_edge(r468, r482, 1).
adjacent(r47, r61).
shared_edge(r47, r61, 1).
adjacent(r470, r471).
shared_edge(r470, r471, 1).
adjacent(r470, r486).
shared_edge(r470, r486, 1).
adjacent(r471, r486).
shared_edge(r471, r486, 1).
adjacent(r475, r476).
shared_edge(r475, r476, 1).
adjacent(r475, r493).
shared_edge(r475, r493, 1).
adjacent(r476, r477).
shared_edge(r476, r477, 1).
adjacent(r476, r494).
shared_edge(r476, r494, 1).
adjacent(r477, r478).
shared_edge(r477, r478, 1).
adjacent(r477, r495).
shared_edge(r477, r495, 1).
adjacent(r478, r479).
shared_edge(r478, r479, 1).
adjacent(r478, r496).
shared_edge(r478, r496, 1).
adjacent(r479, r496).
shared_edge(r479, r496, 1).
adjacent(r48, r49).
shared_edge(r48, r49, 1).
adjacent(r48, r64).
shared_edge(r48, r64, 2).
adjacent(r480, r481).
shared_edge(r480, r481, 6).
adjacent(r480, r482).
shared_edge(r480, r482, 1).
adjacent(r480, r497).
shared_edge(r480, r497, 1).
adjacent(r480, r498).
shared_edge(r480, r498, 1).
adjacent(r480, r506).
shared_edge(r480, r506, 1).
adjacent(r480, r507).
shared_edge(r480, r507, 3).
adjacent(r480, r508).
shared_edge(r480, r508, 2).
adjacent(r480, r509).
shared_edge(r480, r509, 1).
adjacent(r480, r513).
shared_edge(r480, r513, 2).
adjacent(r480, r514).
shared_edge(r480, r514, 2).
adjacent(r480, r515).
shared_edge(r480, r515, 1).
adjacent(r480, r516).
shared_edge(r480, r516, 2).
adjacent(r480, r517).
shared_edge(r480, r517, 1).
adjacent(r480, r526).
shared_edge(r480, r526, 1).
adjacent(r480, r527).
shared_edge(r480, r527, 1).
adjacent(r481, r482).
shared_edge(r481, r482, 1).
adjacent(r482, r483).
shared_edge(r482, r483, 1).
adjacent(r482, r498).
shared_edge(r482, r498, 3).
adjacent(r483, r499).
shared_edge(r483, r499, 1).
adjacent(r484, r485).
shared_edge(r484, r485, 2).
adjacent(r484, r511).
shared_edge(r484, r511, 4).
adjacent(r484, r520).
shared_edge(r484, r520, 1).
adjacent(r484, r521).
shared_edge(r484, r521, 1).
adjacent(r484, r522).
shared_edge(r484, r522, 1).
adjacent(r484, r536).
shared_edge(r484, r536, 1).
adjacent(r485, r486).
shared_edge(r485, r486, 1).
adjacent(r485, r487).
shared_edge(r485, r487, 2).
adjacent(r486, r487).
shared_edge(r486, r487, 3).
adjacent(r487, r488).
shared_edge(r487, r488, 5).
adjacent(r488, r489).
shared_edge(r488, r489, 2).
adjacent(r49, r5).
shared_edge(r49, r5, 1).
adjacent(r49, r65).
shared_edge(r49, r65, 2).
adjacent(r491, r492).
shared_edge(r491, r492, 1).
adjacent(r492, r504).
shared_edge(r492, r504, 1).
adjacent(r493, r494).
shared_edge(r493, r494, 1).
adjacent(r493, r505).
shared_edge(r493, r505, 2).
adjacent(r493, r506).
shared_edge(r493, r506, 2).
adjacent(r493, r524).
shared_edge(r493, r524, 1).
adjacent(r493, r71).
shared_edge(r493, r71, 3).
adjacent(r494, r495).
shared_edge(r494, r495, 1).
adjacent(r494, r505).
shared_edge(r494, r505, 1).
adjacent(r495, r496).
shared_edge(r495, r496, 2).
adjacent(r496, r497).
shared_edge(r496, r497, 1).
adjacent(r496, r505).
shared_edge(r496, r505, 1).
adjacent(r496, r506).
shared_edge(r496, r506, 4).
adjacent(r497, r506).
shared_edge(r497, r506, 1).
adjacent(r498, r499).
shared_edge(r498, r499, 1).
adjacent(r498, r509).
shared_edge(r498, r509, 1).
adjacent(r498, r510).
shared_edge(r498, r510, 2).
adjacent(r499, r500).
shared_edge(r499, r500, 1).
adjacent(r499, r510).
shared_edge(r499, r510, 2).
adjacent(r5, r50).
shared_edge(r5, r50, 3).
adjacent(r5, r6).
shared_edge(r5, r6, 10).
adjacent(r5, r66).
shared_edge(r5, r66, 2).
adjacent(r50, r51).
shared_edge(r50, r51, 3).
adjacent(r500, r510).
shared_edge(r500, r510, 3).
adjacent(r500, r530).
shared_edge(r500, r530, 2).
adjacent(r501, r502).
shared_edge(r501, r502, 2).
adjacent(r501, r512).
shared_edge(r501, r512, 24).
adjacent(r501, r561).
shared_edge(r501, r561, 1).
adjacent(r503, r517).
shared_edge(r503, r517, 7).
adjacent(r503, r563).
shared_edge(r503, r563, 1).
adjacent(r503, r570).
shared_edge(r503, r570, 1).
adjacent(r504, r71).
shared_edge(r504, r71, 1).
adjacent(r506, r513).
shared_edge(r506, r513, 1).
adjacent(r506, r524).
shared_edge(r506, r524, 1).
adjacent(r506, r525).
shared_edge(r506, r525, 6).
adjacent(r507, r508).
shared_edge(r507, r508, 1).
adjacent(r507, r515).
shared_edge(r507, r515, 2).
adjacent(r508, r515).
shared_edge(r508, r515, 1).
adjacent(r509, r510).
shared_edge(r509, r510, 1).
adjacent(r509, r517).
shared_edge(r509, r517, 1).
adjacent(r51, r52).
shared_edge(r51, r52, 1).
adjacent(r51, r6).
shared_edge(r51, r6, 4).
adjacent(r51, r66).
shared_edge(r51, r66, 1).
adjacent(r51, r67).
shared_edge(r51, r67, 2).
adjacent(r51, r68).
shared_edge(r51, r68, 2).
adjacent(r51, r69).
shared_edge(r51, r69, 1).
adjacent(r51, r84).
shared_edge(r51, r84, 1).
adjacent(r51, r85).
shared_edge(r51, r85, 2).
adjacent(r51, r86).
shared_edge(r51, r86, 1).
adjacent(r510, r518).
shared_edge(r510, r518, 1).
adjacent(r510, r519).
shared_edge(r510, r519, 2).
adjacent(r510, r529).
shared_edge(r510, r529, 1).
adjacent(r511, r522).
shared_edge(r511, r522, 2).
adjacent(r512, r561).
shared_edge(r512, r561, 1).
adjacent(r512, r570).
shared_edge(r512, r570, 1).
adjacent(r513, r525).
shared_edge(r513, r525, 1).
adjacent(r514, r515).
shared_edge(r514, r515, 1).
adjacent(r514, r517).
shared_edge(r514, r517, 1).
adjacent(r514, r526).
shared_edge(r514, r526, 1).
adjacent(r514, r527).
shared_edge(r514, r527, 2).
adjacent(r514, r539).
shared_edge(r514, r539, 1).
adjacent(r514, r548).
shared_edge(r514, r548, 1).
adjacent(r514, r550).
shared_edge(r514, r550, 1).
adjacent(r515, r517).
shared_edge(r515, r517, 3).
adjacent(r516, r517).
shared_edge(r516, r517, 2).
adjacent(r517, r518).
shared_edge(r517, r518, 2).
adjacent(r517, r528).
shared_edge(r517, r528, 2).
adjacent(r517, r530).
shared_edge(r517, r530, 5).
adjacent(r517, r534).
shared_edge(r517, r534, 1).
adjacent(r517, r539).
shared_edge(r517, r539, 4).
adjacent(r517, r540).
shared_edge(r517, r540, 4).
adjacent(r517, r541).
shared_edge(r517, r541, 1).
adjacent(r517, r542).
shared_edge(r517, r542, 1).
adjacent(r517, r543).
shared_edge(r517, r543, 2).
adjacent(r517, r544).
shared_edge(r517, r544, 2).
adjacent(r517, r551).
shared_edge(r517, r551, 5).
adjacent(r517, r552).
shared_edge(r517, r552, 2).
adjacent(r517, r553).
shared_edge(r517, r553, 2).
adjacent(r517, r554).
shared_edge(r517, r554, 2).
adjacent(r517, r557).
shared_edge(r517, r557, 1).
adjacent(r517, r559).
shared_edge(r517, r559, 2).
adjacent(r517, r560).
shared_edge(r517, r560, 2).
adjacent(r517, r563).
shared_edge(r517, r563, 3).
adjacent(r517, r565).
shared_edge(r517, r565, 1).
adjacent(r517, r566).
shared_edge(r517, r566, 1).
adjacent(r517, r567).
shared_edge(r517, r567, 2).
adjacent(r517, r568).
shared_edge(r517, r568, 8).
adjacent(r517, r569).
shared_edge(r517, r569, 4).
adjacent(r517, r570).
shared_edge(r517, r570, 1).
adjacent(r517, r572).
shared_edge(r517, r572, 3).
adjacent(r518, r519).
shared_edge(r518, r519, 1).
adjacent(r519, r528).
shared_edge(r519, r528, 1).
adjacent(r52, r53).
shared_edge(r52, r53, 1).
adjacent(r52, r69).
shared_edge(r52, r69, 1).
adjacent(r52, r70).
shared_edge(r52, r70, 2).
adjacent(r52, r88).
shared_edge(r52, r88, 1).
adjacent(r520, r521).
shared_edge(r520, r521, 1).
adjacent(r520, r533).
shared_edge(r520, r533, 1).
adjacent(r521, r522).
shared_edge(r521, r522, 1).
adjacent(r521, r534).
shared_edge(r521, r534, 1).
adjacent(r522, r535).
shared_edge(r522, r535, 2).
adjacent(r523, r524).
shared_edge(r523, r524, 1).
adjacent(r523, r537).
shared_edge(r523, r537, 1).
adjacent(r523, r548).
shared_edge(r523, r548, 1).
adjacent(r523, r71).
shared_edge(r523, r71, 3).
adjacent(r524, r537).
shared_edge(r524, r537, 1).
adjacent(r525, r526).
shared_edge(r525, r526, 1).
adjacent(r525, r537).
shared_edge(r525, r537, 1).
adjacent(r525, r538).
shared_edge(r525, r538, 2).
adjacent(r525, r548).
shared_edge(r525, r548, 1).
adjacent(r525, r549).
shared_edge(r525, r549, 1).
adjacent(r525, r550).
shared_edge(r525, r550, 3).
adjacent(r526, r527).
shared_edge(r526, r527, 1).
adjacent(r526, r538).
shared_edge(r526, r538, 1).
adjacent(r526, r550).
shared_edge(r526, r550, 1).
adjacent(r528, r529).
shared_edge(r528, r529, 1).
adjacent(r529, r530).
shared_edge(r529, r530, 2).
adjacent(r53, r71).
shared_edge(r53, r71, 1).
adjacent(r530, r531).
shared_edge(r530, r531, 1).
adjacent(r531, r540).
shared_edge(r531, r540, 1).
adjacent(r532, r533).
shared_edge(r532, r533, 1).
adjacent(r532, r542).
shared_edge(r532, r542, 1).
adjacent(r533, r534).
shared_edge(r533, r534, 1).
adjacent(r533, r543).
shared_edge(r533, r543, 1).
adjacent(r534, r535).
shared_edge(r534, r535, 1).
adjacent(r535, r536).
shared_edge(r535, r536, 1).
adjacent(r535, r544).
shared_edge(r535, r544, 2).
adjacent(r535, r545).
shared_edge(r535, r545, 1).
adjacent(r535, r552).
shared_edge(r535, r552, 1).
adjacent(r536, r545).
shared_edge(r536, r545, 1).
adjacent(r537, r548).
shared_edge(r537, r548, 1).
adjacent(r538, r550).
shared_edge(r538, r550, 1).
adjacent(r539, r548).
shared_edge(r539, r548, 1).
adjacent(r539, r555).
shared_edge(r539, r555, 1).
adjacent(r539, r556).
shared_edge(r539, r556, 1).
adjacent(r54, r73).
shared_edge(r54, r73, 1).
adjacent(r54, r91).
shared_edge(r54, r91, 1).
adjacent(r540, r541).
shared_edge(r540, r541, 1).
adjacent(r541, r542).
shared_edge(r541, r542, 1).
adjacent(r542, r543).
shared_edge(r542, r543, 1).
adjacent(r545, r546).
shared_edge(r545, r546, 1).
adjacent(r545, r553).
shared_edge(r545, r553, 1).
adjacent(r546, r553).
shared_edge(r546, r553, 1).
adjacent(r547, r554).
shared_edge(r547, r554, 1).
adjacent(r548, r549).
shared_edge(r548, r549, 3).
adjacent(r548, r550).
shared_edge(r548, r550, 8).
adjacent(r548, r551).
shared_edge(r548, r551, 2).
adjacent(r548, r555).
shared_edge(r548, r555, 2).
adjacent(r548, r556).
shared_edge(r548, r556, 1).
adjacent(r548, r557).
shared_edge(r548, r557, 2).
adjacent(r548, r558).
shared_edge(r548, r558, 2).
adjacent(r548, r562).
shared_edge(r548, r562, 2).
adjacent(r548, r563).
shared_edge(r548, r563, 24).
adjacent(r548, r564).
shared_edge(r548, r564, 1).
adjacent(r548, r71).
shared_edge(r548, r71, 2).
adjacent(r551, r558).
shared_edge(r551, r558, 1).
adjacent(r552, r553).
shared_edge(r552, r553, 1).
adjacent(r553, r554).
shared_edge(r553, r554, 1).
adjacent(r555, r556).
shared_edge(r555, r556, 1).
adjacent(r556, r557).
shared_edge(r556, r557, 1).
adjacent(r558, r559).
shared_edge(r558, r559, 1).
adjacent(r559, r564).
shared_edge(r559, r564, 1).
adjacent(r560, r561).
shared_edge(r560, r561, 1).
adjacent(r561, r570).
shared_edge(r561, r570, 1).
adjacent(r562, r563).
shared_edge(r562, r563, 2).
adjacent(r562, r71).
shared_edge(r562, r71, 4).
adjacent(r563, r564).
shared_edge(r563, r564, 1).
adjacent(r563, r565).
shared_edge(r563, r565, 1).
adjacent(r563, r568).
shared_edge(r563, r568, 6).
adjacent(r563, r571).
shared_edge(r563, r571, 4).
adjacent(r563, r572).
shared_edge(r563, r572, 3).
adjacent(r563, r71).
shared_edge(r563, r71, 1).
adjacent(r564, r565).
shared_edge(r564, r565, 1).
adjacent(r565, r566).
shared_edge(r565, r566, 1).
adjacent(r566, r567).
shared_edge(r566, r567, 1).
adjacent(r566, r571).
shared_edge(r566, r571, 1).
adjacent(r567, r571).
shared_edge(r567, r571, 1).
adjacent(r57, r75).
shared_edge(r57, r75, 2).
adjacent(r573, r71).
shared_edge(r573, r71, 1).
adjacent(r58, r59).
shared_edge(r58, r59, 1).
adjacent(r59, r60).
shared_edge(r59, r60, 1).
adjacent(r59, r76).
shared_edge(r59, r76, 2).
adjacent(r6, r7).
shared_edge(r6, r7, 1).
adjacent(r60, r61).
shared_edge(r60, r61, 1).
adjacent(r60, r77).
shared_edge(r60, r77, 1).
adjacent(r61, r62).
shared_edge(r61, r62, 1).
adjacent(r61, r77).
shared_edge(r61, r77, 1).
adjacent(r61, r78).
shared_edge(r61, r78, 1).
adjacent(r62, r79).
shared_edge(r62, r79, 1).
adjacent(r63, r64).
shared_edge(r63, r64, 11).
adjacent(r64, r65).
shared_edge(r64, r65, 11).
adjacent(r65, r66).
shared_edge(r65, r66, 1).
adjacent(r65, r82).
shared_edge(r65, r82, 2).
adjacent(r66, r83).
shared_edge(r66, r83, 1).
adjacent(r66, r84).
shared_edge(r66, r84, 1).
adjacent(r67, r68).
shared_edge(r67, r68, 2).
adjacent(r68, r69).
shared_edge(r68, r69, 1).
adjacent(r68, r85).
shared_edge(r68, r85, 1).
adjacent(r68, r86).
shared_edge(r68, r86, 2).
adjacent(r68, r87).
shared_edge(r68, r87, 2).
adjacent(r69, r87).
shared_edge(r69, r87, 1).
adjacent(r7, r8).
shared_edge(r7, r8, 1).
adjacent(r70, r71).
shared_edge(r70, r71, 1).
adjacent(r70, r89).
shared_edge(r70, r89, 1).
adjacent(r71, r72).
shared_edge(r71, r72, 2).
adjacent(r71, r89).
shared_edge(r71, r89, 6).
adjacent(r72, r73).
shared_edge(r72, r73, 1).
adjacent(r72, r90).
shared_edge(r72, r90, 1).
adjacent(r73, r90).
shared_edge(r73, r90, 1).
adjacent(r76, r77).
shared_edge(r76, r77, 3).
adjacent(r76, r95).
shared_edge(r76, r95, 1).
adjacent(r77, r78).
shared_edge(r77, r78, 1).
adjacent(r78, r79).
shared_edge(r78, r79, 1).
adjacent(r78, r95).
shared_edge(r78, r95, 1).
adjacent(r79, r80).
shared_edge(r79, r80, 1).
adjacent(r79, r96).
shared_edge(r79, r96, 1).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r80, r81).
shared_edge(r80, r81, 1).
adjacent(r80, r97).
shared_edge(r80, r97, 1).
adjacent(r81, r98).
shared_edge(r81, r98, 5).
adjacent(r82, r83).
shared_edge(r82, r83, 2).
adjacent(r83, r84).
shared_edge(r83, r84, 1).
adjacent(r85, r86).
shared_edge(r85, r86, 1).
adjacent(r87, r88).
shared_edge(r87, r88, 1).
adjacent(r88, r89).
shared_edge(r88, r89, 1).
adjacent(r90, r91).
shared_edge(r90, r91, 1).
adjacent(r95, r96).
shared_edge(r95, r96, 1).
adjacent(r96, r97).
shared_edge(r96, r97, 1).
adjacent(r97, r98).
shared_edge(r97, r98, 1).
