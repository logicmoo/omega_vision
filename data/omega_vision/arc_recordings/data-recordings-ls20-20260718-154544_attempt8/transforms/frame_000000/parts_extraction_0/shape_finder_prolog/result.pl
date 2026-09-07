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

region(r1, '#aaaaaa', 5542, centroid(56,54)).
polygon(r1, [xy(0,0),xy(0,95),xy(16,95),xy(17,94),xy(16,93),xy(16,92),xy(18,90),xy(18,89),xy(19,88),xy(82,88),xy(83,89),xy(84,88),xy(86,88),xy(87,89),xy(87,91),xy(0,0)]).
hole(r1, [xy(3,89),xy(3,90),xy(4,91),xy(4,92),xy(12,92),xy(13,91),xy(13,92),xy(14,90),xy(14,89),xy(11,86),xy(11,83),xy(9,81),xy(7,81),xy(7,82),xy(6,83),xy(6,86),xy(5,87),xy(4,87),xy(4,88),xy(3,89)]).
midline(r1, [xy(1,9),xy(1,41),xy(2,43),xy(2,45),xy(3,45),xy(3,47),xy(9,59)]).
midline(r1, [xy(1,88),xy(1,91),xy(2,91),xy(2,93),xy(4,94),xy(13,94),xy(14,93),xy(14,94),xy(15,93),xy(15,91),xy(16,90),xy(16,91),xy(17,90)]).
midline(r1, [xy(2,5),xy(2,7),xy(3,5),xy(3,3),xy(7,1)]).
midline(r1, [xy(2,84),xy(2,86),xy(3,85),xy(3,81),xy(6,75)]).
midline(r1, [xy(2,88)]).
midline(r1, [xy(11,62)]).
midline(r1, [xy(13,65),xy(15,69),xy(15,70),xy(17,71),xy(18,71),xy(18,72),xy(23,72),xy(25,73),xy(37,73),xy(38,72),xy(38,73),xy(39,72),xy(39,73),xy(40,72),xy(40,73),xy(41,72),xy(41,73),xy(43,72),xy(44,71),xy(44,72),xy(45,71),xy(45,72),xy(49,70),xy(50,70),xy(68,61),xy(76,45),xy(76,43),xy(77,42),xy(77,43)]).
midline(r1, [xy(15,94),xy(16,94)]).
midline(r1, [xy(17,85)]).
midline(r1, [xy(18,82)]).
midline(r1, [xy(55,1),xy(59,3)]).
midline(r1, [xy(62,5)]).
midline(r1, [xy(65,7),xy(69,9)]).
midline(r1, [xy(73,12)]).
midline(r1, [xy(78,16),xy(78,17),xy(79,16),xy(79,30),xy(80,29),xy(80,20)]).
midline(r1, [xy(78,33),xy(78,36),xy(79,35),xy(79,32),xy(80,30)]).
midline(r1, [xy(78,38),xy(78,40)]).
midline(r1, [xy(79,36)]).
midline(r1, [xy(83,77)]).
midline(r1, [xy(87,81)]).
midline(r1, [xy(92,86)]).
fillpoint(r1, xy(68,61), 28).
fillpoint(r1, xy(69,62), 27).
fillpoint(r1, xy(69,61), 27).
fillpoint(r1, xy(69,60), 27).
fillpoint(r1, xy(69,59), 27).
region(r5, '#fedc00', 451, centroid(24,13)).
polygon(r5, [xy(6,9),xy(6,41),xy(7,41),xy(8,40),xy(8,10),xy(7,9),xy(8,9),xy(9,8),xy(9,7),xy(8,6),xy(10,6),xy(12,4),xy(11,3),xy(14,3),xy(15,2),xy(15,0),xy(16,2),xy(17,1),xy(17,0),xy(45,0),xy(45,1),xy(46,2),xy(47,1),xy(47,2),xy(48,3),xy(50,3),xy(50,4),xy(49,5),xy(13,5),xy(11,7),xy(11,43),xy(10,44),xy(9,43),xy(8,44),xy(9,44),xy(9,42),xy(8,41),xy(6,9)]).
hole(r5, [xy(7,10),xy(7,40),xy(7,10)]).
midline(r5, [xy(9,9),xy(9,41),xy(10,40),xy(10,7),xy(13,4),xy(14,4),xy(15,3),xy(15,4),xy(17,3),xy(18,2),xy(18,3),xy(19,2),xy(19,3),xy(20,2),xy(20,3),xy(21,2),xy(21,3),xy(22,2),xy(22,3),xy(23,2),xy(23,3),xy(24,2),xy(24,3),xy(25,2),xy(25,3),xy(26,2),xy(26,3),xy(27,2),xy(27,3),xy(28,2),xy(28,3),xy(29,2),xy(29,3),xy(30,2),xy(30,3),xy(31,2),xy(31,3),xy(32,2),xy(32,3),xy(33,2),xy(33,3),xy(34,2),xy(34,3),xy(35,2),xy(35,3),xy(36,2),xy(36,3),xy(37,2),xy(37,3),xy(38,2),xy(38,3),xy(39,2),xy(39,3),xy(40,2),xy(40,3),xy(41,2),xy(41,3),xy(42,2),xy(42,3),xy(43,2),xy(43,3),xy(44,2),xy(44,3),xy(47,3),xy(47,4),xy(49,4)]).
midline(r5, [xy(10,41),xy(10,43)]).
midline(r5, [xy(52,7),xy(52,9),xy(53,9),xy(53,12),xy(54,12)]).
fillpoint(r5, xy(54,12), 3).
fillpoint(r5, xy(53,12), 3).
fillpoint(r5, xy(53,11), 3).
fillpoint(r5, xy(45,3), 3).
fillpoint(r5, xy(44,3), 3).
region(r11, '#aaaaa9', 5, centroid(10,2)).
polygon(r11, [xy(9,1),xy(9,2),xy(10,2),xy(11,1),xy(11,2),xy(9,1)]).
fillpoint(r11, xy(11,2), 1).
fillpoint(r11, xy(11,1), 1).
fillpoint(r11, xy(10,2), 1).
fillpoint(r11, xy(9,2), 1).
fillpoint(r11, xy(9,1), 1).
region(r15, '#aaaaa9', 5, centroid(52,2)).
polygon(r15, [xy(51,1),xy(51,2),xy(52,2),xy(53,1),xy(53,2),xy(51,1)]).
fillpoint(r15, xy(53,2), 1).
fillpoint(r15, xy(53,1), 1).
fillpoint(r15, xy(52,2), 1).
fillpoint(r15, xy(51,2), 1).
fillpoint(r15, xy(51,1), 1).
region(r19, '#aaaaa9', 5, centroid(8,4)).
polygon(r19, [xy(7,3),xy(8,3),xy(8,4),xy(7,5),xy(8,5),xy(7,3)]).
fillpoint(r19, xy(8,5), 1).
fillpoint(r19, xy(8,4), 1).
fillpoint(r19, xy(8,3), 1).
fillpoint(r19, xy(7,5), 1).
fillpoint(r19, xy(7,3), 1).
region(r24, '#aaaaa9', 5, centroid(54,4)).
polygon(r24, [xy(54,3),xy(54,5),xy(55,5),xy(55,3),xy(54,3)]).
fillpoint(r24, xy(55,5), 1).
fillpoint(r24, xy(55,3), 1).
fillpoint(r24, xy(54,5), 1).
fillpoint(r24, xy(54,4), 1).
fillpoint(r24, xy(54,3), 1).
region(r37, '#aaaaa9', 39, centroid(5,25)).
polygon(r37, [xy(5,6),xy(5,44),xy(5,6)]).
fillpoint(r37, xy(5,44), 1).
fillpoint(r37, xy(5,43), 1).
fillpoint(r37, xy(5,42), 1).
fillpoint(r37, xy(5,41), 1).
fillpoint(r37, xy(5,40), 1).
region(r40, '#ffde00', 38, centroid(32,6)).
polygon(r40, [xy(13,6),xy(50,6),xy(13,6)]).
fillpoint(r40, xy(50,6), 1).
fillpoint(r40, xy(49,6), 1).
fillpoint(r40, xy(48,6), 1).
fillpoint(r40, xy(47,6), 1).
fillpoint(r40, xy(46,6), 1).
region(r43, '#aaaaa9', 4, centroid(57,7)).
polygon(r43, [xy(57,6),xy(57,8),xy(58,8),xy(57,6)]).
fillpoint(r43, xy(58,8), 1).
fillpoint(r43, xy(57,8), 1).
fillpoint(r43, xy(57,7), 1).
fillpoint(r43, xy(57,6), 1).
region(r45, '#ffde00', 41, centroid(12,27)).
polygon(r45, [xy(11,46),xy(12,45),xy(12,7),xy(11,46)]).
fillpoint(r45, xy(12,46), 1).
fillpoint(r45, xy(12,45), 1).
fillpoint(r45, xy(12,44), 1).
fillpoint(r45, xy(12,43), 1).
fillpoint(r45, xy(12,42), 1).
region(r47, '#90c568', 37, centroid(32,7)).
polygon(r47, [xy(14,7),xy(50,7),xy(14,7)]).
fillpoint(r47, xy(50,7), 1).
fillpoint(r47, xy(49,7), 1).
fillpoint(r47, xy(48,7), 1).
fillpoint(r47, xy(47,7), 1).
fillpoint(r47, xy(46,7), 1).
region(r49, '#90c568', 43, centroid(13,29)).
polygon(r49, [xy(13,8),xy(13,49),xy(14,49),xy(13,8)]).
fillpoint(r49, xy(14,49), 1).
fillpoint(r49, xy(13,49), 1).
fillpoint(r49, xy(13,48), 1).
fillpoint(r49, xy(13,47), 1).
fillpoint(r49, xy(13,46), 1).
region(r50, '#24cc42', 76, centroid(22,19)).
polygon(r50, [xy(14,8),xy(14,48),xy(14,8)]).
fillpoint(r50, xy(49,8), 1).
fillpoint(r50, xy(48,8), 1).
fillpoint(r50, xy(47,8), 1).
fillpoint(r50, xy(46,8), 1).
fillpoint(r50, xy(45,8), 1).
region(r52, '#aaaaa9', 33, centroid(3,25)).
polygon(r52, [xy(3,9),xy(3,41),xy(3,9)]).
fillpoint(r52, xy(3,41), 1).
fillpoint(r52, xy(3,40), 1).
fillpoint(r52, xy(3,39), 1).
fillpoint(r52, xy(3,38), 1).
fillpoint(r52, xy(3,37), 1).
region(r53, '#aaaaab', 33, centroid(4,25)).
polygon(r53, [xy(4,9),xy(4,41),xy(4,9)]).
fillpoint(r53, xy(4,41), 1).
fillpoint(r53, xy(4,40), 1).
fillpoint(r53, xy(4,39), 1).
fillpoint(r53, xy(4,38), 1).
fillpoint(r53, xy(4,37), 1).
region(r54, '#868282', 13, centroid(16,10)).
polygon(r54, [xy(15,9),xy(15,12),xy(17,12),xy(18,11),xy(18,10),xy(17,9),xy(16,9),xy(16,10),xy(18,9),xy(15,9)]).
hole(r54, [xy(16,11),xy(17,10),xy(17,11),xy(16,11)]).
fillpoint(r54, xy(18,12), 1).
fillpoint(r54, xy(18,11), 1).
fillpoint(r54, xy(18,10), 1).
fillpoint(r54, xy(18,9), 1).
fillpoint(r54, xy(17,12), 1).
region(r55, '#33cc3f', 9, centroid(18,12)).
polygon(r55, [xy(15,13),xy(18,13),xy(19,12),xy(19,9),xy(15,13)]).
fillpoint(r55, xy(19,13), 1).
fillpoint(r55, xy(19,12), 1).
fillpoint(r55, xy(19,11), 1).
fillpoint(r55, xy(19,10), 1).
fillpoint(r55, xy(19,9), 1).
region(r56, '#2ecc40', 825, centroid(35,27)).
polygon(r56, [xy(15,14),xy(16,14),xy(16,49),xy(18,49),xy(19,48),xy(19,45),xy(21,43),xy(43,43),xy(44,44),xy(45,44),xy(46,45),xy(46,49),xy(47,48),xy(47,49),xy(48,47),xy(49,47),xy(50,46),xy(51,46),xy(51,47),xy(52,45),xy(52,44),xy(53,43),xy(53,42),xy(54,41),xy(55,41),xy(56,40),xy(56,38),xy(57,37),xy(57,36),xy(58,35),xy(58,31),xy(56,29),xy(56,28),xy(55,27),xy(55,23),xy(58,20),xy(58,17),xy(57,16),xy(51,16),xy(49,14),xy(49,11),xy(48,10),xy(21,10),xy(20,9),xy(20,13),xy(19,14),xy(17,14),xy(15,14)]).
hole(r56, [xy(20,30),xy(20,37),xy(21,38),xy(21,39),xy(42,39),xy(45,36),xy(46,36),xy(47,35),xy(48,36),xy(49,35),xy(49,31),xy(51,29),xy(51,22),xy(49,20),xy(46,20),xy(45,19),xy(45,16),xy(43,14),xy(36,14),xy(35,15),xy(35,20),xy(34,21),xy(33,20),xy(32,21),xy(30,21),xy(29,20),xy(29,21),xy(27,23),xy(27,28),xy(26,29),xy(21,29),xy(20,30)]).
midline(r56, [xy(17,31),xy(17,36),xy(18,35),xy(18,29),xy(22,21),xy(22,20),xy(23,18),xy(23,17),xy(24,17),xy(30,14),xy(30,16),xy(31,14),xy(37,11),xy(37,12),xy(38,11),xy(38,12),xy(39,11),xy(39,12),xy(40,11),xy(40,12),xy(41,11),xy(41,12),xy(42,11),xy(42,12),xy(46,12),xy(46,13),xy(47,12),xy(47,14),xy(48,15),xy(48,17),xy(49,16),xy(49,17),xy(50,17),xy(51,18),xy(53,19),xy(54,19),xy(54,21),xy(55,20),xy(55,19)]).
midline(r56, [xy(17,46),xy(17,48),xy(18,47),xy(18,44),xy(19,42),xy(19,41),xy(18,39),xy(18,36)]).
midline(r56, [xy(18,48)]).
midline(r56, [xy(22,41),xy(22,42),xy(23,41),xy(23,42),xy(24,41),xy(24,42),xy(25,41),xy(25,42),xy(26,41),xy(26,42),xy(27,41),xy(27,42),xy(28,41),xy(28,42),xy(29,41),xy(29,42),xy(30,41),xy(30,42),xy(31,41),xy(31,42),xy(32,41),xy(32,42),xy(33,41),xy(33,42),xy(34,41),xy(34,42),xy(35,41),xy(35,42),xy(36,41),xy(36,42),xy(37,41),xy(37,42),xy(38,41),xy(38,42),xy(39,41),xy(39,42),xy(40,41),xy(40,42),xy(41,41),xy(41,42)]).
midline(r56, [xy(44,41)]).
midline(r56, [xy(47,41),xy(48,42),xy(51,39),xy(52,37),xy(53,36),xy(53,37),xy(54,35),xy(54,31)]).
midline(r56, [xy(47,47)]).
midline(r56, [xy(53,24),xy(53,26),xy(54,25),xy(54,28)]).
fillpoint(r56, xy(24,17), 8).
fillpoint(r56, xy(23,18), 8).
fillpoint(r56, xy(23,17), 8).
fillpoint(r56, xy(26,16), 7).
fillpoint(r56, xy(25,17), 7).
region(r57, '#33cc3f', 28, centroid(35,9)).
polygon(r57, [xy(21,9),xy(48,9),xy(21,9)]).
fillpoint(r57, xy(48,9), 1).
fillpoint(r57, xy(47,9), 1).
fillpoint(r57, xy(46,9), 1).
fillpoint(r57, xy(45,9), 1).
fillpoint(r57, xy(44,9), 1).
region(r58, '#33cc3f', 6, centroid(50,12)).
polygon(r58, [xy(50,9),xy(50,14),xy(50,9)]).
fillpoint(r58, xy(50,14), 1).
fillpoint(r58, xy(50,13), 1).
fillpoint(r58, xy(50,12), 1).
fillpoint(r58, xy(50,11), 1).
fillpoint(r58, xy(50,10), 1).
region(r61, '#ffde00', 31, centroid(7,25)).
polygon(r61, [xy(7,10),xy(7,40),xy(7,10)]).
fillpoint(r61, xy(7,40), 1).
fillpoint(r61, xy(7,39), 1).
fillpoint(r61, xy(7,38), 1).
fillpoint(r61, xy(7,37), 1).
fillpoint(r61, xy(7,36), 1).
region(r64, '#ccc16e', 5, centroid(58,11)).
polygon(r64, [xy(57,10),xy(58,10),xy(58,13),xy(57,10)]).
fillpoint(r64, xy(58,13), 1).
fillpoint(r64, xy(58,12), 1).
fillpoint(r64, xy(58,11), 1).
fillpoint(r64, xy(58,10), 1).
fillpoint(r64, xy(57,10), 1).
region(r66, '#aaaaa9', 8, centroid(60,14)).
polygon(r66, [xy(60,10),xy(60,17),xy(60,10)]).
fillpoint(r66, xy(60,17), 1).
fillpoint(r66, xy(60,16), 1).
fillpoint(r66, xy(60,15), 1).
fillpoint(r66, xy(60,14), 1).
fillpoint(r66, xy(60,13), 1).
region(r72, '#acaaab', 4, centroid(61,15)).
polygon(r72, [xy(61,13),xy(61,16),xy(61,13)]).
fillpoint(r72, xy(61,16), 1).
fillpoint(r72, xy(61,15), 1).
fillpoint(r72, xy(61,14), 1).
fillpoint(r72, xy(61,13), 1).
region(r73, '#33cc3f', 8, centroid(40,14)).
polygon(r73, [xy(36,14),xy(43,14),xy(36,14)]).
fillpoint(r73, xy(43,14), 1).
fillpoint(r73, xy(42,14), 1).
fillpoint(r73, xy(41,14), 1).
fillpoint(r73, xy(40,14), 1).
fillpoint(r73, xy(39,14), 1).
region(r76, '#33cc3f', 39, centroid(15,34)).
polygon(r76, [xy(15,15),xy(15,50),xy(18,50),xy(15,15)]).
fillpoint(r76, xy(18,50), 1).
fillpoint(r76, xy(17,50), 1).
fillpoint(r76, xy(16,50), 1).
fillpoint(r76, xy(15,50), 1).
fillpoint(r76, xy(15,49), 1).
region(r77, '#33cc3f', 7, centroid(35,18)).
polygon(r77, [xy(35,15),xy(35,21),xy(35,15)]).
fillpoint(r77, xy(35,21), 1).
fillpoint(r77, xy(35,20), 1).
fillpoint(r77, xy(35,19), 1).
fillpoint(r77, xy(35,18), 1).
fillpoint(r77, xy(35,17), 1).
region(r78, '#fedc00', 260, centroid(37,28)).
polygon(r78, [xy(21,30),xy(21,36),xy(22,35),xy(40,35),xy(41,34),xy(41,30),xy(42,29),xy(49,29),xy(50,28),xy(50,25),xy(49,24),xy(43,24),xy(41,22),xy(41,18),xy(42,17),xy(40,15),xy(36,15),xy(36,29),xy(35,30),xy(22,30),xy(21,30)]).
hole(r78, [xy(28,31),xy(35,31),xy(28,31)]).
hole(r78, [xy(37,22),xy(37,29),xy(37,22)]).
midline(r78, [xy(23,32),xy(23,33),xy(24,32),xy(24,33),xy(25,32),xy(25,33),xy(26,32),xy(26,33),xy(29,33),xy(29,34),xy(30,33),xy(30,34),xy(31,33),xy(31,34),xy(32,33),xy(32,34),xy(33,33),xy(33,34),xy(34,33),xy(34,34),xy(38,32),xy(36,30)]).
midline(r78, [xy(38,17),xy(38,20),xy(39,19),xy(39,17),xy(40,17)]).
midline(r78, [xy(39,20),xy(39,21),xy(41,25),xy(41,27),xy(42,26),xy(44,26),xy(44,27),xy(45,26),xy(45,27),xy(46,26),xy(46,27),xy(47,26),xy(47,27),xy(48,26),xy(48,27)]).
midline(r78, [xy(39,30),xy(40,29)]).
fillpoint(r78, xy(42,26), 4).
fillpoint(r78, xy(41,27), 4).
fillpoint(r78, xy(41,26), 4).
fillpoint(r78, xy(41,25), 4).
fillpoint(r78, xy(38,32), 4).
region(r79, '#90c568', 7, centroid(43,18)).
polygon(r79, [xy(43,15),xy(43,21),xy(43,15)]).
fillpoint(r79, xy(43,21), 1).
fillpoint(r79, xy(43,20), 1).
fillpoint(r79, xy(43,19), 1).
fillpoint(r79, xy(43,18), 1).
fillpoint(r79, xy(43,17), 1).
region(r80, '#24cc42', 13, centroid(46,19)).
polygon(r80, [xy(44,15),xy(44,21),xy(50,21),xy(44,15)]).
fillpoint(r80, xy(50,21), 1).
fillpoint(r80, xy(49,21), 1).
fillpoint(r80, xy(48,21), 1).
fillpoint(r80, xy(47,21), 1).
fillpoint(r80, xy(46,21), 1).
region(r81, '#33cc3f', 11, centroid(46,19)).
polygon(r81, [xy(45,15),xy(45,20),xy(50,20),xy(45,15)]).
fillpoint(r81, xy(50,20), 1).
fillpoint(r81, xy(49,20), 1).
fillpoint(r81, xy(48,20), 1).
fillpoint(r81, xy(47,20), 1).
fillpoint(r81, xy(46,20), 1).
region(r82, '#33cc3f', 14, centroid(56,16)).
polygon(r82, [xy(51,15),xy(59,15),xy(59,20),xy(51,15)]).
fillpoint(r82, xy(59,20), 1).
fillpoint(r82, xy(59,19), 1).
fillpoint(r82, xy(59,18), 1).
fillpoint(r82, xy(59,17), 1).
fillpoint(r82, xy(59,16), 1).
region(r85, '#ffde00', 5, centroid(42,20)).
polygon(r85, [xy(42,18),xy(42,22),xy(42,18)]).
fillpoint(r85, xy(42,22), 1).
fillpoint(r85, xy(42,21), 1).
fillpoint(r85, xy(42,20), 1).
fillpoint(r85, xy(42,19), 1).
fillpoint(r85, xy(42,18), 1).
region(r91, '#acaaab', 4, centroid(62,21)).
polygon(r91, [xy(62,19),xy(62,22),xy(62,19)]).
fillpoint(r91, xy(62,22), 1).
fillpoint(r91, xy(62,21), 1).
fillpoint(r91, xy(62,20), 1).
fillpoint(r91, xy(62,19), 1).
region(r92, '#aaaaa9', 10, centroid(63,24)).
polygon(r92, [xy(63,19),xy(63,28),xy(63,19)]).
fillpoint(r92, xy(63,28), 1).
fillpoint(r92, xy(63,27), 1).
fillpoint(r92, xy(63,26), 1).
fillpoint(r92, xy(63,25), 1).
fillpoint(r92, xy(63,24), 1).
region(r95, '#24cc42', 4, centroid(59,21)).
polygon(r95, [xy(58,21),xy(59,21),xy(60,20),xy(60,21),xy(58,21)]).
fillpoint(r95, xy(60,21), 1).
fillpoint(r95, xy(60,20), 1).
fillpoint(r95, xy(59,21), 1).
fillpoint(r95, xy(58,21), 1).
region(r96, '#90c568', 5, centroid(60,21)).
polygon(r96, [xy(59,22),xy(60,22),xy(61,21),xy(61,22),xy(59,22)]).
fillpoint(r96, xy(61,22), 1).
fillpoint(r96, xy(61,21), 1).
fillpoint(r96, xy(61,20), 1).
fillpoint(r96, xy(60,22), 1).
fillpoint(r96, xy(59,22), 1).
region(r97, '#24cc42', 6, centroid(32,21)).
polygon(r97, [xy(29,21),xy(34,21),xy(29,21)]).
fillpoint(r97, xy(34,21), 1).
fillpoint(r97, xy(33,21), 1).
fillpoint(r97, xy(32,21), 1).
fillpoint(r97, xy(31,21), 1).
fillpoint(r97, xy(30,21), 1).
region(r99, '#90c568', 7, centroid(32,22)).
polygon(r99, [xy(29,22),xy(35,22),xy(29,22)]).
fillpoint(r99, xy(35,22), 1).
fillpoint(r99, xy(34,22), 1).
fillpoint(r99, xy(33,22), 1).
fillpoint(r99, xy(32,22), 1).
fillpoint(r99, xy(31,22), 1).
region(r100, '#ffde00', 8, centroid(37,26)).
polygon(r100, [xy(37,22),xy(37,29),xy(37,22)]).
fillpoint(r100, xy(37,29), 1).
fillpoint(r100, xy(37,28), 1).
fillpoint(r100, xy(37,27), 1).
fillpoint(r100, xy(37,26), 1).
fillpoint(r100, xy(37,25), 1).
region(r102, '#90c568', 7, centroid(47,22)).
polygon(r102, [xy(44,22),xy(50,22),xy(44,22)]).
fillpoint(r102, xy(50,22), 1).
fillpoint(r102, xy(49,22), 1).
fillpoint(r102, xy(48,22), 1).
fillpoint(r102, xy(47,22), 1).
fillpoint(r102, xy(46,22), 1).
region(r103, '#33cc3f', 8, centroid(51,26)).
polygon(r103, [xy(51,22),xy(51,29),xy(51,22)]).
fillpoint(r103, xy(51,29), 1).
fillpoint(r103, xy(51,28), 1).
fillpoint(r103, xy(51,27), 1).
fillpoint(r103, xy(51,26), 1).
fillpoint(r103, xy(51,25), 1).
region(r104, '#24cc42', 7, centroid(57,25)).
polygon(r104, [xy(57,22),xy(57,28),xy(57,22)]).
fillpoint(r104, xy(57,28), 1).
fillpoint(r104, xy(57,27), 1).
fillpoint(r104, xy(57,26), 1).
fillpoint(r104, xy(57,25), 1).
fillpoint(r104, xy(57,24), 1).
region(r106, '#24cc42', 6, centroid(27,26)).
polygon(r106, [xy(27,23),xy(27,28),xy(27,23)]).
fillpoint(r106, xy(27,28), 1).
fillpoint(r106, xy(27,27), 1).
fillpoint(r106, xy(27,26), 1).
fillpoint(r106, xy(27,25), 1).
fillpoint(r106, xy(27,24), 1).
region(r108, '#acaaab', 14, centroid(32,24)).
polygon(r108, [xy(29,23),xy(29,24),xy(30,23),xy(30,24),xy(31,23),xy(31,24),xy(32,23),xy(32,24),xy(33,23),xy(33,24),xy(34,23),xy(34,24),xy(35,23),xy(35,24),xy(29,23)]).
fillpoint(r108, xy(35,24), 1).
fillpoint(r108, xy(35,23), 1).
fillpoint(r108, xy(34,24), 1).
fillpoint(r108, xy(34,23), 1).
fillpoint(r108, xy(33,24), 1).
region(r109, '#ffde00', 7, centroid(46,23)).
polygon(r109, [xy(43,23),xy(49,23),xy(43,23)]).
fillpoint(r109, xy(49,23), 1).
fillpoint(r109, xy(48,23), 1).
fillpoint(r109, xy(47,23), 1).
fillpoint(r109, xy(46,23), 1).
fillpoint(r109, xy(45,23), 1).
region(r110, '#33cc3f', 5, centroid(56,25)).
polygon(r110, [xy(56,23),xy(56,27),xy(56,23)]).
fillpoint(r110, xy(56,27), 1).
fillpoint(r110, xy(56,26), 1).
fillpoint(r110, xy(56,25), 1).
fillpoint(r110, xy(56,24), 1).
fillpoint(r110, xy(56,23), 1).
region(r111, '#90c568', 5, centroid(58,25)).
polygon(r111, [xy(58,23),xy(58,27),xy(58,23)]).
fillpoint(r111, xy(58,27), 1).
fillpoint(r111, xy(58,26), 1).
fillpoint(r111, xy(58,25), 1).
fillpoint(r111, xy(58,24), 1).
fillpoint(r111, xy(58,23), 1).
region(r112, '#ffde00', 4, centroid(60,24)).
polygon(r112, [xy(59,23),xy(60,23),xy(60,25),xy(59,23)]).
fillpoint(r112, xy(60,25), 1).
fillpoint(r112, xy(60,24), 1).
fillpoint(r112, xy(60,23), 1).
fillpoint(r112, xy(59,23), 1).
region(r113, '#ccc16e', 5, centroid(61,25)).
polygon(r113, [xy(61,23),xy(61,27),xy(61,23)]).
fillpoint(r113, xy(61,27), 1).
fillpoint(r113, xy(61,26), 1).
fillpoint(r113, xy(61,25), 1).
fillpoint(r113, xy(61,24), 1).
fillpoint(r113, xy(61,23), 1).
region(r114, '#aaaaab', 5, centroid(62,25)).
polygon(r114, [xy(62,23),xy(62,27),xy(62,23)]).
fillpoint(r114, xy(62,27), 1).
fillpoint(r114, xy(62,26), 1).
fillpoint(r114, xy(62,25), 1).
fillpoint(r114, xy(62,24), 1).
fillpoint(r114, xy(62,23), 1).
region(r115, '#fedc00', 4, centroid(59,25)).
polygon(r115, [xy(59,24),xy(59,26),xy(60,26),xy(59,24)]).
fillpoint(r115, xy(60,26), 1).
fillpoint(r115, xy(59,26), 1).
fillpoint(r115, xy(59,25), 1).
fillpoint(r115, xy(59,24), 1).
region(r116, '#868282', 40, centroid(32,27)).
polygon(r116, [xy(28,25),xy(28,29),xy(34,29),xy(35,28),xy(35,26),xy(34,25),xy(29,25),xy(28,25)]).
midline(r116, [xy(30,27),xy(33,27)]).
fillpoint(r116, xy(33,27), 3).
fillpoint(r116, xy(32,27), 3).
fillpoint(r116, xy(31,27), 3).
fillpoint(r116, xy(30,27), 3).
fillpoint(r116, xy(34,28), 2).
region(r119, '#868282', 4, centroid(60,29)).
polygon(r119, [xy(59,28),xy(59,29),xy(61,29),xy(59,28)]).
fillpoint(r119, xy(61,29), 1).
fillpoint(r119, xy(60,29), 1).
fillpoint(r119, xy(59,29), 1).
fillpoint(r119, xy(59,28), 1).
region(r122, '#acaaab', 4, centroid(62,30)).
polygon(r122, [xy(62,28),xy(62,31),xy(62,28)]).
fillpoint(r122, xy(62,31), 1).
fillpoint(r122, xy(62,30), 1).
fillpoint(r122, xy(62,29), 1).
fillpoint(r122, xy(62,28), 1).
region(r123, '#33cc3f', 7, centroid(24,29)).
polygon(r123, [xy(21,29),xy(27,29),xy(21,29)]).
fillpoint(r123, xy(27,29), 1).
fillpoint(r123, xy(26,29), 1).
fillpoint(r123, xy(25,29), 1).
fillpoint(r123, xy(24,29), 1).
fillpoint(r123, xy(23,29), 1).
region(r127, '#33cc3f', 8, centroid(20,34)).
polygon(r127, [xy(20,30),xy(20,37),xy(20,30)]).
fillpoint(r127, xy(20,37), 1).
fillpoint(r127, xy(20,36), 1).
fillpoint(r127, xy(20,35), 1).
fillpoint(r127, xy(20,34), 1).
fillpoint(r127, xy(20,33), 1).
region(r128, '#ffde00', 5, centroid(42,32)).
polygon(r128, [xy(42,30),xy(42,34),xy(42,30)]).
fillpoint(r128, xy(42,34), 1).
fillpoint(r128, xy(42,33), 1).
fillpoint(r128, xy(42,32), 1).
fillpoint(r128, xy(42,31), 1).
fillpoint(r128, xy(42,30), 1).
region(r129, '#90c568', 7, centroid(43,33)).
polygon(r129, [xy(43,30),xy(43,36),xy(43,30)]).
fillpoint(r129, xy(43,36), 1).
fillpoint(r129, xy(43,35), 1).
fillpoint(r129, xy(43,34), 1).
fillpoint(r129, xy(43,33), 1).
fillpoint(r129, xy(43,32), 1).
region(r131, '#33cc3f', 15, centroid(48,31)).
polygon(r131, [xy(45,30),xy(45,31),xy(46,30),xy(46,31),xy(47,30),xy(47,31),xy(48,30),xy(48,31),xy(49,30),xy(49,35),xy(45,30)]).
fillpoint(r131, xy(50,30), 1).
fillpoint(r131, xy(49,35), 1).
fillpoint(r131, xy(49,34), 1).
fillpoint(r131, xy(49,33), 1).
fillpoint(r131, xy(49,32), 1).
region(r135, '#ffde00', 8, centroid(32,31)).
polygon(r135, [xy(28,31),xy(35,31),xy(28,31)]).
fillpoint(r135, xy(35,31), 1).
fillpoint(r135, xy(34,31), 1).
fillpoint(r135, xy(33,31), 1).
fillpoint(r135, xy(32,31), 1).
fillpoint(r135, xy(31,31), 1).
region(r136, '#24cc42', 7, centroid(44,34)).
polygon(r136, [xy(44,31),xy(44,37),xy(44,31)]).
fillpoint(r136, xy(44,37), 1).
fillpoint(r136, xy(44,36), 1).
fillpoint(r136, xy(44,35), 1).
fillpoint(r136, xy(44,34), 1).
fillpoint(r136, xy(44,33), 1).
region(r137, '#33cc3f', 5, centroid(59,33)).
polygon(r137, [xy(59,31),xy(59,35),xy(59,31)]).
fillpoint(r137, xy(59,35), 1).
fillpoint(r137, xy(59,34), 1).
fillpoint(r137, xy(59,33), 1).
fillpoint(r137, xy(59,32), 1).
fillpoint(r137, xy(59,31), 1).
region(r140, '#868282', 13, centroid(46,34)).
polygon(r140, [xy(45,32),xy(45,35),xy(46,34),xy(46,35),xy(47,35),xy(48,34),xy(48,33),xy(47,32),xy(48,32),xy(45,32)]).
hole(r140, [xy(46,33),xy(47,33),xy(47,34),xy(46,33)]).
fillpoint(r140, xy(48,35), 1).
fillpoint(r140, xy(48,34), 1).
fillpoint(r140, xy(48,33), 1).
fillpoint(r140, xy(48,32), 1).
fillpoint(r140, xy(47,35), 1).
region(r146, '#aaaaa9', 8, centroid(60,37)).
polygon(r146, [xy(60,33),xy(60,40),xy(60,33)]).
fillpoint(r146, xy(60,40), 1).
fillpoint(r146, xy(60,39), 1).
fillpoint(r146, xy(60,38), 1).
fillpoint(r146, xy(60,37), 1).
fillpoint(r146, xy(60,36), 1).
region(r149, '#acaaab', 4, centroid(61,36)).
polygon(r149, [xy(61,34),xy(61,37),xy(61,34)]).
fillpoint(r149, xy(61,37), 1).
fillpoint(r149, xy(61,36), 1).
fillpoint(r149, xy(61,35), 1).
fillpoint(r149, xy(61,34), 1).
region(r150, '#ffde00', 21, centroid(32,36)).
polygon(r150, [xy(22,36),xy(42,36),xy(22,36)]).
fillpoint(r150, xy(42,36), 1).
fillpoint(r150, xy(41,36), 1).
fillpoint(r150, xy(40,36), 1).
fillpoint(r150, xy(39,36), 1).
fillpoint(r150, xy(38,36), 1).
region(r155, '#90c568', 22, centroid(32,37)).
polygon(r155, [xy(21,37),xy(42,37),xy(21,37)]).
fillpoint(r155, xy(42,37), 1).
fillpoint(r155, xy(41,37), 1).
fillpoint(r155, xy(40,37), 1).
fillpoint(r155, xy(39,37), 1).
fillpoint(r155, xy(38,37), 1).
region(r159, '#24cc42', 23, centroid(32,38)).
polygon(r159, [xy(21,38),xy(43,38),xy(21,38)]).
fillpoint(r159, xy(43,38), 1).
fillpoint(r159, xy(42,38), 1).
fillpoint(r159, xy(41,38), 1).
fillpoint(r159, xy(40,38), 1).
fillpoint(r159, xy(39,38), 1).
region(r163, '#33cc3f', 22, centroid(32,39)).
polygon(r163, [xy(21,39),xy(42,39),xy(21,39)]).
fillpoint(r163, xy(42,39), 1).
fillpoint(r163, xy(41,39), 1).
fillpoint(r163, xy(40,39), 1).
fillpoint(r163, xy(39,39), 1).
fillpoint(r163, xy(38,39), 1).
region(r175, '#aaaaa9', 4, centroid(57,43)).
polygon(r175, [xy(57,42),xy(57,44),xy(58,42),xy(57,42)]).
fillpoint(r175, xy(58,42), 1).
fillpoint(r175, xy(57,44), 1).
fillpoint(r175, xy(57,43), 1).
fillpoint(r175, xy(57,42), 1).
region(r177, '#33cc3f', 23, centroid(32,44)).
polygon(r177, [xy(21,44),xy(43,44),xy(21,44)]).
fillpoint(r177, xy(43,44), 1).
fillpoint(r177, xy(42,44), 1).
fillpoint(r177, xy(41,44), 1).
fillpoint(r177, xy(40,44), 1).
fillpoint(r177, xy(39,44), 1).
region(r180, '#aaaaa9', 5, centroid(8,46)).
polygon(r180, [xy(7,45),xy(8,45),xy(8,46),xy(7,47),xy(8,47),xy(7,45)]).
fillpoint(r180, xy(8,47), 1).
fillpoint(r180, xy(8,46), 1).
fillpoint(r180, xy(8,45), 1).
fillpoint(r180, xy(7,47), 1).
fillpoint(r180, xy(7,45), 1).
region(r182, '#33cc3f', 7, centroid(20,48)).
polygon(r182, [xy(20,45),xy(20,51),xy(20,45)]).
fillpoint(r182, xy(20,51), 1).
fillpoint(r182, xy(20,50), 1).
fillpoint(r182, xy(20,49), 1).
fillpoint(r182, xy(20,48), 1).
fillpoint(r182, xy(20,47), 1).
region(r183, '#fedc00', 145, centroid(32,48)).
polygon(r183, [xy(21,45),xy(21,51),xy(22,50),xy(35,50),xy(36,51),xy(36,53),xy(37,52),xy(37,53),xy(40,53),xy(41,52),xy(40,51),xy(38,51),xy(21,45)]).
hole(r183, [xy(38,52),xy(40,52),xy(38,52)]).
midline(r183, [xy(23,47),xy(23,48),xy(24,47),xy(24,48),xy(25,47),xy(25,48),xy(26,47),xy(26,48),xy(27,47),xy(27,48),xy(28,47),xy(28,48),xy(29,47),xy(29,48),xy(30,47),xy(30,48),xy(31,47),xy(31,48),xy(32,47),xy(32,48),xy(33,47),xy(33,48),xy(34,47),xy(34,48),xy(37,48),xy(37,49),xy(38,48),xy(40,47)]).
fillpoint(r183, xy(38,48), 4).
fillpoint(r183, xy(37,49), 4).
fillpoint(r183, xy(37,48), 4).
fillpoint(r183, xy(36,48), 4).
fillpoint(r183, xy(40,47), 3).
region(r184, '#90c568', 7, centroid(43,48)).
polygon(r184, [xy(43,45),xy(43,51),xy(43,45)]).
fillpoint(r184, xy(43,51), 1).
fillpoint(r184, xy(43,50), 1).
fillpoint(r184, xy(43,49), 1).
fillpoint(r184, xy(43,48), 1).
fillpoint(r184, xy(43,47), 1).
region(r185, '#24cc42', 8, centroid(44,48)).
polygon(r185, [xy(44,45),xy(44,51),xy(45,51),xy(44,45)]).
fillpoint(r185, xy(45,51), 1).
fillpoint(r185, xy(44,51), 1).
fillpoint(r185, xy(44,50), 1).
fillpoint(r185, xy(44,49), 1).
fillpoint(r185, xy(44,48), 1).
region(r186, '#33cc3f', 8, centroid(45,48)).
polygon(r186, [xy(45,45),xy(45,50),xy(47,50),xy(45,45)]).
fillpoint(r186, xy(47,50), 1).
fillpoint(r186, xy(46,50), 1).
fillpoint(r186, xy(45,50), 1).
fillpoint(r186, xy(45,49), 1).
fillpoint(r186, xy(45,48), 1).
region(r187, '#aaaaa9', 4, centroid(54,46)).
polygon(r187, [xy(54,45),xy(54,47),xy(55,45),xy(54,45)]).
fillpoint(r187, xy(55,45), 1).
fillpoint(r187, xy(54,47), 1).
fillpoint(r187, xy(54,46), 1).
fillpoint(r187, xy(54,45), 1).
region(r203, '#aaaaa9', 5, centroid(10,48)).
polygon(r203, [xy(9,48),xy(9,49),xy(10,48),xy(11,48),xy(11,49),xy(9,48)]).
fillpoint(r203, xy(11,49), 1).
fillpoint(r203, xy(11,48), 1).
fillpoint(r203, xy(10,48), 1).
fillpoint(r203, xy(9,49), 1).
fillpoint(r203, xy(9,48), 1).
region(r205, '#ffde00', 5, centroid(42,50)).
polygon(r205, [xy(42,48),xy(42,52),xy(42,48)]).
fillpoint(r205, xy(42,52), 1).
fillpoint(r205, xy(42,51), 1).
fillpoint(r205, xy(42,50), 1).
fillpoint(r205, xy(42,49), 1).
fillpoint(r205, xy(42,48), 1).
region(r208, '#aaaaa9', 4, centroid(52,48)).
polygon(r208, [xy(51,48),xy(51,49),xy(52,48),xy(53,48),xy(51,48)]).
fillpoint(r208, xy(53,48), 1).
fillpoint(r208, xy(52,48), 1).
fillpoint(r208, xy(51,49), 1).
fillpoint(r208, xy(51,48), 1).
region(r217, '#aaaaa9', 4, centroid(13,51)).
polygon(r217, [xy(12,51),xy(14,51),xy(14,52),xy(12,51)]).
fillpoint(r217, xy(14,52), 1).
fillpoint(r217, xy(14,51), 1).
fillpoint(r217, xy(13,51), 1).
fillpoint(r217, xy(12,51), 1).
region(r221, '#ffde00', 14, centroid(29,51)).
polygon(r221, [xy(22,51),xy(35,51),xy(22,51)]).
fillpoint(r221, xy(35,51), 1).
fillpoint(r221, xy(34,51), 1).
fillpoint(r221, xy(33,51), 1).
fillpoint(r221, xy(32,51), 1).
fillpoint(r221, xy(31,51), 1).
region(r224, '#aaaaa9', 4, centroid(49,51)).
polygon(r224, [xy(48,51),xy(48,52),xy(49,51),xy(50,51),xy(48,51)]).
fillpoint(r224, xy(50,51), 1).
fillpoint(r224, xy(49,51), 1).
fillpoint(r224, xy(48,52), 1).
fillpoint(r224, xy(48,51), 1).
region(r230, '#90c568', 15, centroid(28,52)).
polygon(r230, [xy(21,52),xy(35,52),xy(21,52)]).
fillpoint(r230, xy(35,52), 1).
fillpoint(r230, xy(34,52), 1).
fillpoint(r230, xy(33,52), 1).
fillpoint(r230, xy(32,52), 1).
fillpoint(r230, xy(31,52), 1).
region(r239, '#24cc42', 16, centroid(28,53)).
polygon(r239, [xy(21,53),xy(26,53),xy(26,54),xy(27,53),xy(34,53),xy(34,54),xy(21,53)]).
fillpoint(r239, xy(34,54), 1).
fillpoint(r239, xy(34,53), 1).
fillpoint(r239, xy(33,53), 1).
fillpoint(r239, xy(32,53), 1).
fillpoint(r239, xy(31,53), 1).
region(r243, '#aaaaa9', 8, centroid(20,54)).
polygon(r243, [xy(16,54),xy(23,54),xy(16,54)]).
fillpoint(r243, xy(23,54), 1).
fillpoint(r243, xy(22,54), 1).
fillpoint(r243, xy(21,54), 1).
fillpoint(r243, xy(20,54), 1).
fillpoint(r243, xy(19,54), 1).
region(r244, '#acaaab', 7, centroid(22,55)).
polygon(r244, [xy(19,55),xy(23,55),xy(24,54),xy(24,55),xy(19,55)]).
fillpoint(r244, xy(24,55), 1).
fillpoint(r244, xy(24,54), 1).
fillpoint(r244, xy(23,55), 1).
fillpoint(r244, xy(22,55), 1).
fillpoint(r244, xy(21,55), 1).
region(r246, '#2ecc40', 7, centroid(30,54)).
polygon(r246, [xy(27,54),xy(33,54),xy(27,54)]).
fillpoint(r246, xy(33,54), 1).
fillpoint(r246, xy(32,54), 1).
fillpoint(r246, xy(31,54), 1).
fillpoint(r246, xy(30,54), 1).
fillpoint(r246, xy(29,54), 1).
region(r250, '#aaaaab', 7, centroid(40,55)).
polygon(r250, [xy(38,54),xy(38,55),xy(43,55),xy(38,54)]).
fillpoint(r250, xy(43,55), 1).
fillpoint(r250, xy(42,55), 1).
fillpoint(r250, xy(41,55), 1).
fillpoint(r250, xy(40,55), 1).
fillpoint(r250, xy(39,55), 1).
region(r251, '#aaaaa9', 8, centroid(43,54)).
polygon(r251, [xy(39,54),xy(46,54),xy(39,54)]).
fillpoint(r251, xy(46,54), 1).
fillpoint(r251, xy(45,54), 1).
fillpoint(r251, xy(44,54), 1).
fillpoint(r251, xy(43,54), 1).
fillpoint(r251, xy(42,54), 1).
region(r253, '#90c568', 10, centroid(31,55)).
polygon(r253, [xy(26,55),xy(35,55),xy(26,55)]).
fillpoint(r253, xy(35,55), 1).
fillpoint(r253, xy(34,55), 1).
fillpoint(r253, xy(33,55), 1).
fillpoint(r253, xy(32,55), 1).
fillpoint(r253, xy(31,55), 1).
region(r256, '#acaaab', 11, centroid(30,56)).
polygon(r256, [xy(25,56),xy(35,56),xy(25,56)]).
fillpoint(r256, xy(35,56), 1).
fillpoint(r256, xy(34,56), 1).
fillpoint(r256, xy(33,56), 1).
fillpoint(r256, xy(32,56), 1).
fillpoint(r256, xy(31,56), 1).
region(r258, '#aaaaa9', 5, centroid(40,56)).
polygon(r258, [xy(38,56),xy(42,56),xy(38,56)]).
fillpoint(r258, xy(42,56), 1).
fillpoint(r258, xy(41,56), 1).
fillpoint(r258, xy(40,56), 1).
fillpoint(r258, xy(39,56), 1).
fillpoint(r258, xy(38,56), 1).
region(r259, '#aaaaa9', 13, centroid(31,57)).
polygon(r259, [xy(25,57),xy(37,57),xy(25,57)]).
fillpoint(r259, xy(37,57), 1).
fillpoint(r259, xy(36,57), 1).
fillpoint(r259, xy(35,57), 1).
fillpoint(r259, xy(34,57), 1).
fillpoint(r259, xy(33,57), 1).
region(r260, '#aaaaa9', 4, centroid(9,81)).
polygon(r260, [xy(7,81),xy(10,81),xy(7,81)]).
fillpoint(r260, xy(10,81), 1).
fillpoint(r260, xy(9,81), 1).
fillpoint(r260, xy(8,81), 1).
fillpoint(r260, xy(7,81), 1).
region(r261, '#acaaab', 64, centroid(9,88)).
polygon(r261, [xy(4,88),xy(4,91),xy(12,91),xy(13,90),xy(13,89),xy(12,88),xy(11,88),xy(10,87),xy(10,83),xy(9,82),xy(7,82),xy(7,87),xy(6,88),xy(5,88),xy(4,88)]).
midline(r261, [xy(5,89),xy(5,90),xy(7,89),xy(8,88),xy(8,89),xy(9,88),xy(9,89),xy(12,89),xy(12,90)]).
midline(r261, [xy(8,83),xy(8,86),xy(9,85),xy(9,83)]).
midline(r261, [xy(9,86)]).
fillpoint(r261, xy(10,89), 3).
fillpoint(r261, xy(9,89), 3).
fillpoint(r261, xy(9,88), 3).
fillpoint(r261, xy(8,89), 3).
fillpoint(r261, xy(8,88), 3).
region(r262, '#aaaaa9', 7, centroid(6,86)).
polygon(r262, [xy(4,87),xy(5,87),xy(6,86),xy(6,83),xy(4,87)]).
fillpoint(r262, xy(6,87), 1).
fillpoint(r262, xy(6,86), 1).
fillpoint(r262, xy(6,85), 1).
fillpoint(r262, xy(6,84), 1).
fillpoint(r262, xy(6,83), 1).
region(r263, '#aaaaa9', 7, centroid(11,86)).
polygon(r263, [xy(11,83),xy(11,87),xy(13,87),xy(11,83)]).
fillpoint(r263, xy(13,87), 1).
fillpoint(r263, xy(12,87), 1).
fillpoint(r263, xy(11,87), 1).
fillpoint(r263, xy(11,86), 1).
fillpoint(r263, xy(11,85), 1).
region(r266, '#aaaaa9', 64, centroid(51,89)).
polygon(r266, [xy(19,89),xy(82,89),xy(19,89)]).
fillpoint(r266, xy(82,89), 1).
fillpoint(r266, xy(81,89), 1).
fillpoint(r266, xy(80,89), 1).
fillpoint(r266, xy(79,89), 1).
fillpoint(r266, xy(78,89), 1).
region(r268, '#aaaaab', 4, centroid(90,89)).
polygon(r268, [xy(88,89),xy(91,89),xy(88,89)]).
fillpoint(r268, xy(91,89), 1).
fillpoint(r268, xy(90,89), 1).
fillpoint(r268, xy(89,89), 1).
fillpoint(r268, xy(88,89), 1).
region(r270, '#acaaab', 64, centroid(51,90)).
polygon(r270, [xy(19,90),xy(82,90),xy(19,90)]).
fillpoint(r270, xy(82,90), 1).
fillpoint(r270, xy(81,90), 1).
fillpoint(r270, xy(80,90), 1).
fillpoint(r270, xy(79,90), 1).
fillpoint(r270, xy(78,90), 1).
region(r271, '#aaaaa9', 4, centroid(85,90)).
polygon(r271, [xy(83,90),xy(86,90),xy(83,90)]).
fillpoint(r271, xy(86,90), 1).
fillpoint(r271, xy(85,90), 1).
fillpoint(r271, xy(84,90), 1).
fillpoint(r271, xy(83,90), 1).
region(r272, '#aaaaa9', 4, centroid(90,90)).
polygon(r272, [xy(88,90),xy(91,90),xy(88,90)]).
fillpoint(r272, xy(91,90), 1).
fillpoint(r272, xy(90,90), 1).
fillpoint(r272, xy(89,90), 1).
fillpoint(r272, xy(88,90), 1).
region(r274, '#acaaab', 4, centroid(18,93)).
polygon(r274, [xy(18,91),xy(18,94),xy(18,91)]).
fillpoint(r274, xy(18,94), 1).
fillpoint(r274, xy(18,93), 1).
fillpoint(r274, xy(18,92), 1).
fillpoint(r274, xy(18,91), 1).
region(r275, '#868282', 256, centroid(51,93)).
polygon(r275, [xy(19,91),xy(19,94),xy(81,94),xy(82,93),xy(82,92),xy(81,91),xy(20,91),xy(19,91)]).
midline(r275, [xy(20,92),xy(20,93),xy(21,92),xy(21,93),xy(22,92),xy(22,93),xy(23,92),xy(23,93),xy(24,92),xy(24,93),xy(25,92),xy(25,93),xy(26,92),xy(26,93),xy(27,92),xy(27,93),xy(28,92),xy(28,93),xy(29,92),xy(29,93),xy(30,92),xy(30,93),xy(31,92),xy(31,93),xy(32,92),xy(32,93),xy(33,92),xy(33,93),xy(34,92),xy(34,93),xy(35,92),xy(35,93),xy(36,92),xy(36,93),xy(37,92),xy(37,93),xy(38,92),xy(38,93),xy(39,92),xy(39,93),xy(40,92),xy(40,93),xy(41,92),xy(41,93),xy(42,92),xy(42,93),xy(43,92),xy(43,93),xy(44,92),xy(44,93),xy(45,92),xy(45,93),xy(46,92),xy(46,93),xy(47,92),xy(47,93),xy(48,92),xy(48,93),xy(49,92),xy(49,93),xy(50,92),xy(50,93),xy(51,92),xy(51,93),xy(52,92),xy(52,93),xy(53,92),xy(53,93),xy(54,92),xy(54,93),xy(55,92),xy(55,93),xy(56,92),xy(56,93),xy(57,92),xy(57,93),xy(58,92),xy(58,93),xy(59,92),xy(59,93),xy(60,92),xy(60,93),xy(61,92),xy(61,93),xy(62,92),xy(62,93),xy(63,92),xy(63,93),xy(64,92),xy(64,93),xy(65,92),xy(65,93),xy(66,92),xy(66,93),xy(67,92),xy(67,93),xy(68,92),xy(68,93),xy(69,92),xy(69,93),xy(70,92),xy(70,93),xy(71,92),xy(71,93),xy(72,92),xy(72,93),xy(73,92),xy(73,93),xy(74,92),xy(74,93),xy(75,92),xy(75,93),xy(76,92),xy(76,93),xy(77,92),xy(77,93),xy(78,92),xy(78,93),xy(79,92),xy(79,93),xy(80,92),xy(80,93),xy(81,92),xy(81,93)]).
fillpoint(r275, xy(81,93), 2).
fillpoint(r275, xy(81,92), 2).
fillpoint(r275, xy(80,93), 2).
fillpoint(r275, xy(80,92), 2).
fillpoint(r275, xy(79,93), 2).
region(r276, '#acaaab', 4, centroid(83,93)).
polygon(r276, [xy(83,91),xy(83,94),xy(83,91)]).
fillpoint(r276, xy(83,94), 1).
fillpoint(r276, xy(83,93), 1).
fillpoint(r276, xy(83,92), 1).
fillpoint(r276, xy(83,91), 1).
region(r277, '#aaaaab', 12, centroid(85,93)).
polygon(r277, [xy(84,91),xy(84,94),xy(85,94),xy(86,93),xy(86,92),xy(85,91),xy(86,91),xy(84,91)]).
midline(r277, [xy(85,92),xy(85,93)]).
fillpoint(r277, xy(85,93), 2).
fillpoint(r277, xy(85,92), 2).
fillpoint(r277, xy(86,94), 1).
fillpoint(r277, xy(86,93), 1).
fillpoint(r277, xy(86,92), 1).
region(r278, '#aaaaab', 16, centroid(90,93)).
polygon(r278, [xy(88,91),xy(88,94),xy(90,94),xy(91,93),xy(91,92),xy(90,91),xy(91,91),xy(88,91)]).
midline(r278, [xy(89,92),xy(89,93),xy(90,92),xy(90,93)]).
fillpoint(r278, xy(90,93), 2).
fillpoint(r278, xy(90,92), 2).
fillpoint(r278, xy(89,93), 2).
fillpoint(r278, xy(89,92), 2).
fillpoint(r278, xy(91,94), 1).
region(r279, '#aaaaab', 12, centroid(94,93)).
polygon(r279, [xy(93,91),xy(93,94),xy(94,94),xy(95,93),xy(95,92),xy(94,91),xy(95,91),xy(93,91)]).
midline(r279, [xy(94,92),xy(94,93)]).
fillpoint(r279, xy(94,93), 2).
fillpoint(r279, xy(94,92), 2).
fillpoint(r279, xy(95,94), 1).
fillpoint(r279, xy(95,93), 1).
fillpoint(r279, xy(95,92), 1).
region(r280, '#aaaaa9', 10, centroid(9,92)).
polygon(r280, [xy(4,92),xy(13,92),xy(4,92)]).
fillpoint(r280, xy(13,92), 1).
fillpoint(r280, xy(12,92), 1).
fillpoint(r280, xy(11,92), 1).
fillpoint(r280, xy(10,92), 1).
fillpoint(r280, xy(9,92), 1).
region(r286, '#acaaab', 64, centroid(51,95)).
polygon(r286, [xy(19,95),xy(82,95),xy(19,95)]).
fillpoint(r286, xy(82,95), 1).
fillpoint(r286, xy(81,95), 1).
fillpoint(r286, xy(80,95), 1).
fillpoint(r286, xy(79,95), 1).
fillpoint(r286, xy(78,95), 1).
region(r287, '#aaaaa9', 4, centroid(85,95)).
polygon(r287, [xy(83,95),xy(86,95),xy(83,95)]).
fillpoint(r287, xy(86,95), 1).
fillpoint(r287, xy(85,95), 1).
fillpoint(r287, xy(84,95), 1).
fillpoint(r287, xy(83,95), 1).
region(r288, '#aaaaa9', 4, centroid(90,95)).
polygon(r288, [xy(88,95),xy(91,95),xy(88,95)]).
fillpoint(r288, xy(91,95), 1).
fillpoint(r288, xy(90,95), 1).
fillpoint(r288, xy(89,95), 1).
fillpoint(r288, xy(88,95), 1).
adjacent(r1, r10).
shared_edge(r1, r10, 1).
adjacent(r1, r11).
shared_edge(r1, r11, 3).
adjacent(r1, r126).
shared_edge(r1, r126, 1).
adjacent(r1, r134).
shared_edge(r1, r134, 3).
adjacent(r1, r143).
shared_edge(r1, r143, 2).
adjacent(r1, r146).
shared_edge(r1, r146, 4).
adjacent(r1, r147).
shared_edge(r1, r147, 1).
adjacent(r1, r149).
shared_edge(r1, r149, 5).
adjacent(r1, r15).
shared_edge(r1, r15, 3).
adjacent(r1, r168).
shared_edge(r1, r168, 2).
adjacent(r1, r169).
shared_edge(r1, r169, 1).
adjacent(r1, r175).
shared_edge(r1, r175, 5).
adjacent(r1, r180).
shared_edge(r1, r180, 4).
adjacent(r1, r187).
shared_edge(r1, r187, 2).
adjacent(r1, r188).
shared_edge(r1, r188, 2).
adjacent(r1, r189).
shared_edge(r1, r189, 3).
adjacent(r1, r19).
shared_edge(r1, r19, 4).
adjacent(r1, r196).
shared_edge(r1, r196, 2).
adjacent(r1, r2).
shared_edge(r1, r2, 1).
adjacent(r1, r203).
shared_edge(r1, r203, 4).
adjacent(r1, r208).
shared_edge(r1, r208, 3).
adjacent(r1, r212).
shared_edge(r1, r212, 2).
adjacent(r1, r213).
shared_edge(r1, r213, 3).
adjacent(r1, r214).
shared_edge(r1, r214, 1).
adjacent(r1, r216).
shared_edge(r1, r216, 1).
adjacent(r1, r217).
shared_edge(r1, r217, 5).
adjacent(r1, r224).
shared_edge(r1, r224, 5).
adjacent(r1, r236).
shared_edge(r1, r236, 2).
adjacent(r1, r24).
shared_edge(r1, r24, 4).
adjacent(r1, r242).
shared_edge(r1, r242, 2).
adjacent(r1, r243).
shared_edge(r1, r243, 4).
adjacent(r1, r244).
shared_edge(r1, r244, 5).
adjacent(r1, r25).
shared_edge(r1, r25, 3).
adjacent(r1, r250).
shared_edge(r1, r250, 2).
adjacent(r1, r251).
shared_edge(r1, r251, 4).
adjacent(r1, r254).
shared_edge(r1, r254, 3).
adjacent(r1, r255).
shared_edge(r1, r255, 2).
adjacent(r1, r258).
shared_edge(r1, r258, 6).
adjacent(r1, r259).
shared_edge(r1, r259, 15).
adjacent(r1, r260).
shared_edge(r1, r260, 6).
adjacent(r1, r261).
shared_edge(r1, r261, 6).
adjacent(r1, r262).
shared_edge(r1, r262, 8).
adjacent(r1, r263).
shared_edge(r1, r263, 8).
adjacent(r1, r264).
shared_edge(r1, r264, 4).
adjacent(r1, r265).
shared_edge(r1, r265, 4).
adjacent(r1, r266).
shared_edge(r1, r266, 66).
adjacent(r1, r267).
shared_edge(r1, r267, 5).
adjacent(r1, r268).
shared_edge(r1, r268, 6).
adjacent(r1, r269).
shared_edge(r1, r269, 4).
adjacent(r1, r270).
shared_edge(r1, r270, 1).
adjacent(r1, r271).
shared_edge(r1, r271, 2).
adjacent(r1, r272).
shared_edge(r1, r272, 2).
adjacent(r1, r273).
shared_edge(r1, r273, 1).
adjacent(r1, r274).
shared_edge(r1, r274, 4).
adjacent(r1, r277).
shared_edge(r1, r277, 1).
adjacent(r1, r278).
shared_edge(r1, r278, 2).
adjacent(r1, r279).
shared_edge(r1, r279, 1).
adjacent(r1, r280).
shared_edge(r1, r280, 12).
adjacent(r1, r281).
shared_edge(r1, r281, 4).
adjacent(r1, r282).
shared_edge(r1, r282, 1).
adjacent(r1, r283).
shared_edge(r1, r283, 1).
adjacent(r1, r286).
shared_edge(r1, r286, 1).
adjacent(r1, r34).
shared_edge(r1, r34, 3).
adjacent(r1, r37).
shared_edge(r1, r37, 8).
adjacent(r1, r38).
shared_edge(r1, r38, 1).
adjacent(r1, r42).
shared_edge(r1, r42, 1).
adjacent(r1, r43).
shared_edge(r1, r43, 5).
adjacent(r1, r52).
shared_edge(r1, r52, 35).
adjacent(r1, r53).
shared_edge(r1, r53, 2).
adjacent(r1, r60).
shared_edge(r1, r60, 2).
adjacent(r1, r66).
shared_edge(r1, r66, 4).
adjacent(r1, r72).
shared_edge(r1, r72, 5).
adjacent(r1, r84).
shared_edge(r1, r84, 1).
adjacent(r1, r88).
shared_edge(r1, r88, 2).
adjacent(r1, r92).
shared_edge(r1, r92, 11).
adjacent(r10, r16).
shared_edge(r10, r16, 1).
adjacent(r10, r9).
shared_edge(r10, r9, 1).
adjacent(r100, r78).
shared_edge(r100, r78, 18).
adjacent(r101, r102).
shared_edge(r101, r102, 1).
adjacent(r101, r109).
shared_edge(r101, r109, 1).
adjacent(r101, r79).
shared_edge(r101, r79, 1).
adjacent(r101, r85).
shared_edge(r101, r85, 1).
adjacent(r102, r103).
shared_edge(r102, r103, 1).
adjacent(r102, r109).
shared_edge(r102, r109, 6).
adjacent(r102, r78).
shared_edge(r102, r78, 1).
adjacent(r102, r80).
shared_edge(r102, r80, 7).
adjacent(r103, r56).
shared_edge(r103, r56, 10).
adjacent(r103, r78).
shared_edge(r103, r78, 7).
adjacent(r104, r105).
shared_edge(r104, r105, 1).
adjacent(r104, r110).
shared_edge(r104, r110, 5).
adjacent(r104, r111).
shared_edge(r104, r111, 5).
adjacent(r104, r118).
shared_edge(r104, r118, 1).
adjacent(r104, r124).
shared_edge(r104, r124, 1).
adjacent(r104, r56).
shared_edge(r104, r56, 3).
adjacent(r105, r111).
shared_edge(r105, r111, 1).
adjacent(r105, r95).
shared_edge(r105, r95, 1).
adjacent(r105, r96).
shared_edge(r105, r96, 1).
adjacent(r106, r107).
shared_edge(r106, r107, 2).
adjacent(r106, r116).
shared_edge(r106, r116, 4).
adjacent(r106, r123).
shared_edge(r106, r123, 1).
adjacent(r106, r56).
shared_edge(r106, r56, 7).
adjacent(r107, r108).
shared_edge(r107, r108, 2).
adjacent(r107, r116).
shared_edge(r107, r116, 1).
adjacent(r107, r98).
shared_edge(r107, r98, 1).
adjacent(r108, r116).
shared_edge(r108, r116, 7).
adjacent(r108, r78).
shared_edge(r108, r78, 2).
adjacent(r108, r99).
shared_edge(r108, r99, 7).
adjacent(r109, r78).
shared_edge(r109, r78, 9).
adjacent(r11, r12).
shared_edge(r11, r12, 3).
adjacent(r11, r13).
shared_edge(r11, r13, 1).
adjacent(r11, r17).
shared_edge(r11, r17, 1).
adjacent(r11, r20).
shared_edge(r11, r20, 1).
adjacent(r11, r21).
shared_edge(r11, r21, 1).
adjacent(r11, r3).
shared_edge(r11, r3, 1).
adjacent(r11, r5).
shared_edge(r11, r5, 1).
adjacent(r110, r56).
shared_edge(r110, r56, 7).
adjacent(r111, r112).
shared_edge(r111, r112, 1).
adjacent(r111, r115).
shared_edge(r111, r115, 3).
adjacent(r111, r117).
shared_edge(r111, r117, 1).
adjacent(r111, r118).
shared_edge(r111, r118, 1).
adjacent(r112, r113).
shared_edge(r112, r113, 3).
adjacent(r112, r115).
shared_edge(r112, r115, 4).
adjacent(r112, r96).
shared_edge(r112, r96, 2).
adjacent(r113, r114).
shared_edge(r113, r114, 5).
adjacent(r113, r115).
shared_edge(r113, r115, 1).
adjacent(r113, r117).
shared_edge(r113, r117, 1).
adjacent(r113, r121).
shared_edge(r113, r121, 1).
adjacent(r113, r96).
shared_edge(r113, r96, 1).
adjacent(r114, r122).
shared_edge(r114, r122, 1).
adjacent(r114, r91).
shared_edge(r114, r91, 1).
adjacent(r114, r92).
shared_edge(r114, r92, 5).
adjacent(r115, r117).
shared_edge(r115, r117, 2).
adjacent(r116, r123).
shared_edge(r116, r123, 1).
adjacent(r116, r78).
shared_edge(r116, r78, 13).
adjacent(r117, r119).
shared_edge(r117, r119, 1).
adjacent(r117, r120).
shared_edge(r117, r120, 1).
adjacent(r118, r119).
shared_edge(r118, r119, 1).
adjacent(r118, r125).
shared_edge(r118, r125, 1).
adjacent(r119, r120).
shared_edge(r119, r120, 2).
adjacent(r119, r121).
shared_edge(r119, r121, 1).
adjacent(r119, r122).
shared_edge(r119, r122, 1).
adjacent(r119, r125).
shared_edge(r119, r125, 1).
adjacent(r119, r132).
shared_edge(r119, r132, 1).
adjacent(r119, r133).
shared_edge(r119, r133, 1).
adjacent(r119, r56).
shared_edge(r119, r56, 1).
adjacent(r12, r2).
shared_edge(r12, r2, 1).
adjacent(r120, r121).
shared_edge(r120, r121, 1).
adjacent(r121, r122).
shared_edge(r121, r122, 1).
adjacent(r122, r126).
shared_edge(r122, r126, 1).
adjacent(r122, r133).
shared_edge(r122, r133, 1).
adjacent(r122, r134).
shared_edge(r122, r134, 2).
adjacent(r122, r139).
shared_edge(r122, r139, 1).
adjacent(r122, r143).
shared_edge(r122, r143, 1).
adjacent(r122, r92).
shared_edge(r122, r92, 1).
adjacent(r123, r56).
shared_edge(r123, r56, 7).
adjacent(r123, r78).
shared_edge(r123, r78, 7).
adjacent(r124, r125).
shared_edge(r124, r125, 1).
adjacent(r124, r56).
shared_edge(r124, r56, 2).
adjacent(r125, r56).
shared_edge(r125, r56, 1).
adjacent(r126, r134).
shared_edge(r126, r134, 1).
adjacent(r126, r92).
shared_edge(r126, r92, 1).
adjacent(r127, r155).
shared_edge(r127, r155, 1).
adjacent(r127, r56).
shared_edge(r127, r56, 10).
adjacent(r127, r78).
shared_edge(r127, r78, 7).
adjacent(r128, r129).
shared_edge(r128, r129, 5).
adjacent(r128, r78).
shared_edge(r128, r78, 7).
adjacent(r129, r130).
shared_edge(r129, r130, 1).
adjacent(r129, r136).
shared_edge(r129, r136, 6).
adjacent(r129, r150).
shared_edge(r129, r150, 1).
adjacent(r129, r156).
shared_edge(r129, r156, 1).
adjacent(r129, r78).
shared_edge(r129, r78, 2).
adjacent(r13, r17).
shared_edge(r13, r17, 3).
adjacent(r13, r4).
shared_edge(r13, r4, 3).
adjacent(r13, r5).
shared_edge(r13, r5, 1).
adjacent(r130, r131).
shared_edge(r130, r131, 1).
adjacent(r130, r136).
shared_edge(r130, r136, 1).
adjacent(r130, r78).
shared_edge(r130, r78, 1).
adjacent(r131, r136).
shared_edge(r131, r136, 1).
adjacent(r131, r140).
shared_edge(r131, r140, 8).
adjacent(r131, r56).
shared_edge(r131, r56, 8).
adjacent(r131, r78).
shared_edge(r131, r78, 6).
adjacent(r132, r133).
shared_edge(r132, r133, 1).
adjacent(r132, r138).
shared_edge(r132, r138, 1).
adjacent(r132, r56).
shared_edge(r132, r56, 1).
adjacent(r133, r139).
shared_edge(r133, r139, 1).
adjacent(r135, r78).
shared_edge(r135, r78, 18).
adjacent(r136, r140).
shared_edge(r136, r140, 4).
adjacent(r136, r151).
shared_edge(r136, r151, 1).
adjacent(r136, r156).
shared_edge(r136, r156, 1).
adjacent(r136, r56).
shared_edge(r136, r56, 2).
adjacent(r137, r138).
shared_edge(r137, r138, 1).
adjacent(r137, r141).
shared_edge(r137, r141, 1).
adjacent(r137, r146).
shared_edge(r137, r146, 3).
adjacent(r137, r154).
shared_edge(r137, r154, 1).
adjacent(r137, r56).
shared_edge(r137, r56, 6).
adjacent(r138, r139).
shared_edge(r138, r139, 1).
adjacent(r138, r141).
shared_edge(r138, r141, 1).
adjacent(r139, r142).
shared_edge(r139, r142, 1).
adjacent(r14, r15).
shared_edge(r14, r15, 1).
adjacent(r14, r18).
shared_edge(r14, r18, 3).
adjacent(r14, r5).
shared_edge(r14, r5, 1).
adjacent(r14, r8).
shared_edge(r14, r8, 3).
adjacent(r140, r144).
shared_edge(r140, r144, 3).
adjacent(r140, r145).
shared_edge(r140, r145, 2).
adjacent(r140, r148).
shared_edge(r140, r148, 3).
adjacent(r140, r151).
shared_edge(r140, r151, 2).
adjacent(r140, r152).
shared_edge(r140, r152, 1).
adjacent(r140, r56).
shared_edge(r140, r56, 1).
adjacent(r141, r142).
shared_edge(r141, r142, 1).
adjacent(r141, r146).
shared_edge(r141, r146, 1).
adjacent(r142, r143).
shared_edge(r142, r143, 1).
adjacent(r142, r147).
shared_edge(r142, r147, 1).
adjacent(r144, r145).
shared_edge(r144, r145, 1).
adjacent(r145, r148).
shared_edge(r145, r148, 1).
adjacent(r146, r147).
shared_edge(r146, r147, 1).
adjacent(r146, r149).
shared_edge(r146, r149, 4).
adjacent(r146, r154).
shared_edge(r146, r154, 1).
adjacent(r146, r158).
shared_edge(r146, r158, 1).
adjacent(r146, r162).
shared_edge(r146, r162, 3).
adjacent(r147, r149).
shared_edge(r147, r149, 1).
adjacent(r15, r16).
shared_edge(r15, r16, 3).
adjacent(r15, r18).
shared_edge(r15, r18, 1).
adjacent(r15, r22).
shared_edge(r15, r22, 1).
adjacent(r15, r23).
shared_edge(r15, r23, 1).
adjacent(r15, r5).
shared_edge(r15, r5, 1).
adjacent(r15, r9).
shared_edge(r15, r9, 1).
adjacent(r150, r155).
shared_edge(r150, r155, 21).
adjacent(r150, r78).
shared_edge(r150, r78, 22).
adjacent(r151, r56).
shared_edge(r151, r56, 3).
adjacent(r152, r56).
shared_edge(r152, r56, 3).
adjacent(r153, r154).
shared_edge(r153, r154, 1).
adjacent(r153, r157).
shared_edge(r153, r157, 1).
adjacent(r153, r56).
shared_edge(r153, r56, 2).
adjacent(r154, r158).
shared_edge(r154, r158, 1).
adjacent(r155, r156).
shared_edge(r155, r156, 1).
adjacent(r155, r159).
shared_edge(r155, r159, 22).
adjacent(r155, r78).
shared_edge(r155, r78, 1).
adjacent(r156, r159).
shared_edge(r156, r159, 1).
adjacent(r157, r158).
shared_edge(r157, r158, 1).
adjacent(r157, r161).
shared_edge(r157, r161, 1).
adjacent(r157, r56).
shared_edge(r157, r56, 1).
adjacent(r158, r162).
shared_edge(r158, r162, 1).
adjacent(r159, r163).
shared_edge(r159, r163, 22).
adjacent(r159, r56).
shared_edge(r159, r56, 3).
adjacent(r160, r161).
shared_edge(r160, r161, 2).
adjacent(r160, r164).
shared_edge(r160, r164, 1).
adjacent(r160, r56).
shared_edge(r160, r56, 3).
adjacent(r161, r162).
shared_edge(r161, r162, 2).
adjacent(r161, r165).
shared_edge(r161, r165, 1).
adjacent(r162, r165).
shared_edge(r162, r165, 1).
adjacent(r162, r168).
shared_edge(r162, r168, 1).
adjacent(r163, r56).
shared_edge(r163, r56, 24).
adjacent(r164, r165).
shared_edge(r164, r165, 1).
adjacent(r164, r167).
shared_edge(r164, r167, 1).
adjacent(r164, r56).
shared_edge(r164, r56, 1).
adjacent(r165, r167).
shared_edge(r165, r167, 1).
adjacent(r166, r167).
shared_edge(r166, r167, 1).
adjacent(r166, r174).
shared_edge(r166, r174, 1).
adjacent(r166, r56).
shared_edge(r166, r56, 2).
adjacent(r167, r168).
shared_edge(r167, r168, 1).
adjacent(r167, r175).
shared_edge(r167, r175, 2).
adjacent(r169, r170).
shared_edge(r169, r170, 3).
adjacent(r169, r37).
shared_edge(r169, r37, 3).
adjacent(r169, r5).
shared_edge(r169, r5, 1).
adjacent(r17, r5).
shared_edge(r17, r5, 4).
adjacent(r170, r171).
shared_edge(r170, r171, 2).
adjacent(r170, r180).
shared_edge(r170, r180, 1).
adjacent(r170, r5).
shared_edge(r170, r5, 2).
adjacent(r171, r5).
shared_edge(r171, r5, 4).
adjacent(r172, r173).
shared_edge(r172, r173, 2).
adjacent(r172, r179).
shared_edge(r172, r179, 1).
adjacent(r172, r56).
shared_edge(r172, r56, 3).
adjacent(r173, r174).
shared_edge(r173, r174, 1).
adjacent(r173, r176).
shared_edge(r173, r176, 2).
adjacent(r173, r179).
shared_edge(r173, r179, 1).
adjacent(r173, r187).
shared_edge(r173, r187, 1).
adjacent(r173, r56).
shared_edge(r173, r56, 1).
adjacent(r174, r175).
shared_edge(r174, r175, 1).
adjacent(r174, r176).
shared_edge(r174, r176, 1).
adjacent(r175, r176).
shared_edge(r175, r176, 2).
adjacent(r176, r188).
shared_edge(r176, r188, 1).
adjacent(r177, r183).
shared_edge(r177, r183, 22).
adjacent(r177, r184).
shared_edge(r177, r184, 1).
adjacent(r177, r56).
shared_edge(r177, r56, 25).
adjacent(r178, r179).
shared_edge(r178, r179, 1).
adjacent(r178, r56).
shared_edge(r178, r56, 3).
adjacent(r179, r187).
shared_edge(r179, r187, 1).
adjacent(r18, r5).
shared_edge(r18, r5, 4).
adjacent(r180, r181).
shared_edge(r180, r181, 1).
adjacent(r180, r190).
shared_edge(r180, r190, 3).
adjacent(r180, r191).
shared_edge(r180, r191, 1).
adjacent(r180, r197).
shared_edge(r180, r197, 1).
adjacent(r180, r5).
shared_edge(r180, r5, 1).
adjacent(r181, r191).
shared_edge(r181, r191, 1).
adjacent(r181, r192).
shared_edge(r181, r192, 1).
adjacent(r181, r5).
shared_edge(r181, r5, 3).
adjacent(r182, r183).
shared_edge(r182, r183, 7).
adjacent(r182, r220).
shared_edge(r182, r220, 1).
adjacent(r182, r229).
shared_edge(r182, r229, 1).
adjacent(r182, r56).
shared_edge(r182, r56, 7).
adjacent(r183, r184).
shared_edge(r183, r184, 2).
adjacent(r183, r193).
shared_edge(r183, r193, 3).
adjacent(r183, r205).
shared_edge(r183, r205, 7).
adjacent(r183, r221).
shared_edge(r183, r221, 16).
adjacent(r183, r230).
shared_edge(r183, r230, 2).
adjacent(r183, r231).
shared_edge(r183, r231, 8).
adjacent(r183, r232).
shared_edge(r183, r232, 1).
adjacent(r183, r240).
shared_edge(r183, r240, 1).
adjacent(r183, r248).
shared_edge(r183, r248, 1).
adjacent(r183, r249).
shared_edge(r183, r249, 1).
adjacent(r183, r250).
shared_edge(r183, r250, 1).
adjacent(r183, r251).
shared_edge(r183, r251, 4).
adjacent(r184, r185).
shared_edge(r184, r185, 7).
adjacent(r184, r193).
shared_edge(r184, r193, 1).
adjacent(r184, r205).
shared_edge(r184, r205, 4).
adjacent(r184, r232).
shared_edge(r184, r232, 1).
adjacent(r185, r186).
shared_edge(r185, r186, 7).
adjacent(r185, r222).
shared_edge(r185, r222, 1).
adjacent(r185, r233).
shared_edge(r185, r233, 2).
adjacent(r185, r56).
shared_edge(r185, r56, 1).
adjacent(r186, r216).
shared_edge(r186, r216, 1).
adjacent(r186, r222).
shared_edge(r186, r222, 1).
adjacent(r186, r223).
shared_edge(r186, r223, 1).
adjacent(r186, r56).
shared_edge(r186, r56, 8).
adjacent(r187, r188).
shared_edge(r187, r188, 1).
adjacent(r187, r195).
shared_edge(r187, r195, 1).
adjacent(r187, r196).
shared_edge(r187, r196, 2).
adjacent(r187, r202).
shared_edge(r187, r202, 1).
adjacent(r187, r56).
shared_edge(r187, r56, 1).
adjacent(r189, r190).
shared_edge(r189, r190, 1).
adjacent(r19, r20).
shared_edge(r19, r20, 1).
adjacent(r19, r26).
shared_edge(r19, r26, 3).
adjacent(r19, r27).
shared_edge(r19, r27, 1).
adjacent(r19, r35).
shared_edge(r19, r35, 1).
adjacent(r19, r39).
shared_edge(r19, r39, 1).
adjacent(r19, r5).
shared_edge(r19, r5, 1).
adjacent(r191, r192).
shared_edge(r191, r192, 1).
adjacent(r191, r197).
shared_edge(r191, r197, 1).
adjacent(r192, r198).
shared_edge(r192, r198, 1).
adjacent(r192, r45).
shared_edge(r192, r45, 1).
adjacent(r194, r195).
shared_edge(r194, r195, 1).
adjacent(r194, r201).
shared_edge(r194, r201, 1).
adjacent(r194, r56).
shared_edge(r194, r56, 2).
adjacent(r195, r202).
shared_edge(r195, r202, 1).
adjacent(r195, r56).
shared_edge(r195, r56, 1).
adjacent(r197, r198).
shared_edge(r197, r198, 1).
adjacent(r197, r203).
shared_edge(r197, r203, 1).
adjacent(r198, r199).
shared_edge(r198, r199, 1).
adjacent(r198, r203).
shared_edge(r198, r203, 1).
adjacent(r199, r203).
shared_edge(r199, r203, 1).
adjacent(r199, r204).
shared_edge(r199, r204, 1).
adjacent(r199, r45).
shared_edge(r199, r45, 2).
adjacent(r199, r49).
shared_edge(r199, r49, 1).
adjacent(r2, r3).
shared_edge(r2, r3, 1).
adjacent(r20, r21).
shared_edge(r20, r21, 1).
adjacent(r20, r27).
shared_edge(r20, r27, 1).
adjacent(r200, r207).
shared_edge(r200, r207, 1).
adjacent(r200, r56).
shared_edge(r200, r56, 3).
adjacent(r201, r202).
shared_edge(r201, r202, 1).
adjacent(r201, r208).
shared_edge(r201, r208, 1).
adjacent(r201, r56).
shared_edge(r201, r56, 1).
adjacent(r202, r208).
shared_edge(r202, r208, 1).
adjacent(r203, r204).
shared_edge(r203, r204, 1).
adjacent(r203, r209).
shared_edge(r203, r209, 3).
adjacent(r203, r210).
shared_edge(r203, r210, 1).
adjacent(r204, r210).
shared_edge(r204, r210, 1).
adjacent(r204, r49).
shared_edge(r204, r49, 1).
adjacent(r205, r232).
shared_edge(r205, r232, 1).
adjacent(r206, r207).
shared_edge(r206, r207, 1).
adjacent(r206, r211).
shared_edge(r206, r211, 2).
adjacent(r206, r56).
shared_edge(r206, r56, 3).
adjacent(r207, r208).
shared_edge(r207, r208, 1).
adjacent(r207, r211).
shared_edge(r207, r211, 1).
adjacent(r208, r211).
shared_edge(r208, r211, 1).
adjacent(r208, r212).
shared_edge(r208, r212, 2).
adjacent(r208, r56).
shared_edge(r208, r56, 1).
adjacent(r209, r213).
shared_edge(r209, r213, 1).
adjacent(r21, r28).
shared_edge(r21, r28, 1).
adjacent(r21, r5).
shared_edge(r21, r5, 1).
adjacent(r210, r214).
shared_edge(r210, r214, 1).
adjacent(r210, r49).
shared_edge(r210, r49, 1).
adjacent(r211, r216).
shared_edge(r211, r216, 3).
adjacent(r211, r56).
shared_edge(r211, r56, 1).
adjacent(r214, r215).
shared_edge(r214, r215, 1).
adjacent(r214, r217).
shared_edge(r214, r217, 1).
adjacent(r215, r217).
shared_edge(r215, r217, 2).
adjacent(r215, r49).
shared_edge(r215, r49, 2).
adjacent(r215, r76).
shared_edge(r215, r76, 1).
adjacent(r216, r224).
shared_edge(r216, r224, 3).
adjacent(r217, r218).
shared_edge(r217, r218, 1).
adjacent(r217, r225).
shared_edge(r217, r225, 1).
adjacent(r218, r219).
shared_edge(r218, r219, 1).
adjacent(r218, r225).
shared_edge(r218, r225, 1).
adjacent(r218, r76).
shared_edge(r218, r76, 1).
adjacent(r219, r220).
shared_edge(r219, r220, 1).
adjacent(r219, r226).
shared_edge(r219, r226, 1).
adjacent(r219, r76).
shared_edge(r219, r76, 1).
adjacent(r22, r23).
shared_edge(r22, r23, 1).
adjacent(r22, r31).
shared_edge(r22, r31, 1).
adjacent(r22, r5).
shared_edge(r22, r5, 1).
adjacent(r220, r227).
shared_edge(r220, r227, 2).
adjacent(r220, r228).
shared_edge(r220, r228, 1).
adjacent(r220, r56).
shared_edge(r220, r56, 1).
adjacent(r220, r76).
shared_edge(r220, r76, 2).
adjacent(r221, r230).
shared_edge(r221, r230, 14).
adjacent(r222, r223).
shared_edge(r222, r223, 1).
adjacent(r222, r234).
shared_edge(r222, r234, 1).
adjacent(r223, r224).
shared_edge(r223, r224, 1).
adjacent(r223, r235).
shared_edge(r223, r235, 1).
adjacent(r224, r235).
shared_edge(r224, r235, 1).
adjacent(r225, r226).
shared_edge(r225, r226, 1).
adjacent(r225, r236).
shared_edge(r225, r236, 1).
adjacent(r226, r227).
shared_edge(r226, r227, 1).
adjacent(r226, r237).
shared_edge(r226, r237, 1).
adjacent(r227, r228).
shared_edge(r227, r228, 1).
adjacent(r227, r237).
shared_edge(r227, r237, 2).
adjacent(r228, r229).
shared_edge(r228, r229, 1).
adjacent(r228, r238).
shared_edge(r228, r238, 1).
adjacent(r229, r230).
shared_edge(r229, r230, 1).
adjacent(r229, r238).
shared_edge(r229, r238, 1).
adjacent(r229, r239).
shared_edge(r229, r239, 1).
adjacent(r229, r243).
shared_edge(r229, r243, 1).
adjacent(r23, r24).
shared_edge(r23, r24, 1).
adjacent(r23, r32).
shared_edge(r23, r32, 1).
adjacent(r230, r239).
shared_edge(r230, r239, 14).
adjacent(r230, r240).
shared_edge(r230, r240, 1).
adjacent(r232, r233).
shared_edge(r232, r233, 1).
adjacent(r232, r241).
shared_edge(r232, r241, 1).
adjacent(r232, r251).
shared_edge(r232, r251, 1).
adjacent(r233, r234).
shared_edge(r233, r234, 1).
adjacent(r233, r241).
shared_edge(r233, r241, 2).
adjacent(r234, r235).
shared_edge(r234, r235, 1).
adjacent(r234, r241).
shared_edge(r234, r241, 1).
adjacent(r235, r242).
shared_edge(r235, r242, 1).
adjacent(r236, r237).
shared_edge(r236, r237, 1).
adjacent(r237, r238).
shared_edge(r237, r238, 1).
adjacent(r237, r243).
shared_edge(r237, r243, 3).
adjacent(r238, r243).
shared_edge(r238, r243, 1).
adjacent(r239, r240).
shared_edge(r239, r240, 1).
adjacent(r239, r243).
shared_edge(r239, r243, 3).
adjacent(r239, r244).
shared_edge(r239, r244, 1).
adjacent(r239, r245).
shared_edge(r239, r245, 2).
adjacent(r239, r246).
shared_edge(r239, r246, 9).
adjacent(r239, r247).
shared_edge(r239, r247, 1).
adjacent(r239, r253).
shared_edge(r239, r253, 2).
adjacent(r24, r32).
shared_edge(r24, r32, 1).
adjacent(r24, r33).
shared_edge(r24, r33, 3).
adjacent(r24, r36).
shared_edge(r24, r36, 1).
adjacent(r24, r41).
shared_edge(r24, r41, 1).
adjacent(r24, r5).
shared_edge(r24, r5, 1).
adjacent(r240, r247).
shared_edge(r240, r247, 1).
adjacent(r241, r242).
shared_edge(r241, r242, 1).
adjacent(r241, r251).
shared_edge(r241, r251, 3).
adjacent(r243, r244).
shared_edge(r243, r244, 6).
adjacent(r244, r245).
shared_edge(r244, r245, 1).
adjacent(r244, r252).
shared_edge(r244, r252, 1).
adjacent(r244, r254).
shared_edge(r244, r254, 1).
adjacent(r244, r255).
shared_edge(r244, r255, 1).
adjacent(r245, r252).
shared_edge(r245, r252, 1).
adjacent(r246, r253).
shared_edge(r246, r253, 7).
adjacent(r247, r248).
shared_edge(r247, r248, 1).
adjacent(r247, r253).
shared_edge(r247, r253, 1).
adjacent(r248, r249).
shared_edge(r248, r249, 2).
adjacent(r249, r250).
shared_edge(r249, r250, 2).
adjacent(r249, r253).
shared_edge(r249, r253, 1).
adjacent(r249, r257).
shared_edge(r249, r257, 2).
adjacent(r25, r26).
shared_edge(r25, r26, 1).
adjacent(r250, r251).
shared_edge(r250, r251, 6).
adjacent(r250, r258).
shared_edge(r250, r258, 5).
adjacent(r252, r253).
shared_edge(r252, r253, 1).
adjacent(r252, r256).
shared_edge(r252, r256, 1).
adjacent(r253, r256).
shared_edge(r253, r256, 10).
adjacent(r255, r256).
shared_edge(r255, r256, 1).
adjacent(r256, r257).
shared_edge(r256, r257, 1).
adjacent(r256, r259).
shared_edge(r256, r259, 11).
adjacent(r257, r258).
shared_edge(r257, r258, 1).
adjacent(r257, r259).
shared_edge(r257, r259, 2).
adjacent(r260, r261).
shared_edge(r260, r261, 4).
adjacent(r261, r262).
shared_edge(r261, r262, 8).
adjacent(r261, r263).
shared_edge(r261, r263, 8).
adjacent(r261, r264).
shared_edge(r261, r264, 2).
adjacent(r261, r265).
shared_edge(r261, r265, 2).
adjacent(r261, r280).
shared_edge(r261, r280, 10).
adjacent(r266, r270).
shared_edge(r266, r270, 64).
adjacent(r267, r271).
shared_edge(r267, r271, 3).
adjacent(r268, r272).
shared_edge(r268, r272, 4).
adjacent(r269, r273).
shared_edge(r269, r273, 3).
adjacent(r27, r28).
shared_edge(r27, r28, 1).
adjacent(r27, r35).
shared_edge(r27, r35, 1).
adjacent(r270, r271).
shared_edge(r270, r271, 1).
adjacent(r270, r275).
shared_edge(r270, r275, 64).
adjacent(r271, r276).
shared_edge(r271, r276, 1).
adjacent(r271, r277).
shared_edge(r271, r277, 3).
adjacent(r272, r278).
shared_edge(r272, r278, 4).
adjacent(r273, r279).
shared_edge(r273, r279, 3).
adjacent(r274, r275).
shared_edge(r274, r275, 4).
adjacent(r274, r281).
shared_edge(r274, r281, 2).
adjacent(r275, r276).
shared_edge(r275, r276, 4).
adjacent(r275, r286).
shared_edge(r275, r286, 64).
adjacent(r276, r277).
shared_edge(r276, r277, 4).
adjacent(r276, r287).
shared_edge(r276, r287, 1).
adjacent(r277, r282).
shared_edge(r277, r282, 2).
adjacent(r277, r284).
shared_edge(r277, r284, 1).
adjacent(r277, r287).
shared_edge(r277, r287, 3).
adjacent(r278, r282).
shared_edge(r278, r282, 2).
adjacent(r278, r283).
shared_edge(r278, r283, 2).
adjacent(r278, r284).
shared_edge(r278, r284, 1).
adjacent(r278, r285).
shared_edge(r278, r285, 1).
adjacent(r278, r288).
shared_edge(r278, r288, 4).
adjacent(r279, r283).
shared_edge(r279, r283, 2).
adjacent(r279, r285).
shared_edge(r279, r285, 1).
adjacent(r279, r289).
shared_edge(r279, r289, 3).
adjacent(r28, r29).
shared_edge(r28, r29, 1).
adjacent(r28, r35).
shared_edge(r28, r35, 1).
adjacent(r282, r284).
shared_edge(r282, r284, 1).
adjacent(r283, r285).
shared_edge(r283, r285, 1).
adjacent(r284, r287).
shared_edge(r284, r287, 1).
adjacent(r284, r288).
shared_edge(r284, r288, 1).
adjacent(r285, r288).
shared_edge(r285, r288, 1).
adjacent(r285, r289).
shared_edge(r285, r289, 1).
adjacent(r286, r287).
shared_edge(r286, r287, 1).
adjacent(r29, r5).
shared_edge(r29, r5, 3).
adjacent(r3, r4).
shared_edge(r3, r4, 1).
adjacent(r30, r31).
shared_edge(r30, r31, 1).
adjacent(r30, r5).
shared_edge(r30, r5, 3).
adjacent(r31, r32).
shared_edge(r31, r32, 1).
adjacent(r31, r36).
shared_edge(r31, r36, 1).
adjacent(r32, r36).
shared_edge(r32, r36, 1).
adjacent(r33, r34).
shared_edge(r33, r34, 1).
adjacent(r35, r5).
shared_edge(r35, r5, 3).
adjacent(r36, r5).
shared_edge(r36, r5, 3).
adjacent(r37, r38).
shared_edge(r37, r38, 3).
adjacent(r37, r5).
shared_edge(r37, r5, 33).
adjacent(r37, r53).
shared_edge(r37, r53, 33).
adjacent(r38, r39).
shared_edge(r38, r39, 3).
adjacent(r38, r5).
shared_edge(r38, r5, 1).
adjacent(r39, r44).
shared_edge(r39, r44, 2).
adjacent(r39, r5).
shared_edge(r39, r5, 2).
adjacent(r4, r5).
shared_edge(r4, r5, 1).
adjacent(r40, r46).
shared_edge(r40, r46, 1).
adjacent(r40, r47).
shared_edge(r40, r47, 37).
adjacent(r40, r5).
shared_edge(r40, r5, 40).
adjacent(r41, r42).
shared_edge(r41, r42, 3).
adjacent(r41, r48).
shared_edge(r41, r48, 2).
adjacent(r41, r5).
shared_edge(r41, r5, 2).
adjacent(r42, r43).
shared_edge(r42, r43, 3).
adjacent(r42, r5).
shared_edge(r42, r5, 1).
adjacent(r43, r59).
shared_edge(r43, r59, 2).
adjacent(r44, r5).
shared_edge(r44, r5, 4).
adjacent(r45, r46).
shared_edge(r45, r46, 1).
adjacent(r45, r49).
shared_edge(r45, r49, 39).
adjacent(r45, r5).
shared_edge(r45, r5, 41).
adjacent(r46, r47).
shared_edge(r46, r47, 1).
adjacent(r46, r49).
shared_edge(r46, r49, 1).
adjacent(r47, r5).
shared_edge(r47, r5, 1).
adjacent(r47, r50).
shared_edge(r47, r50, 36).
adjacent(r47, r51).
shared_edge(r47, r51, 1).
adjacent(r48, r5).
shared_edge(r48, r5, 4).
adjacent(r49, r50).
shared_edge(r49, r50, 42).
adjacent(r49, r76).
shared_edge(r49, r76, 1).
adjacent(r5, r51).
shared_edge(r5, r51, 1).
adjacent(r5, r58).
shared_edge(r5, r58, 6).
adjacent(r5, r59).
shared_edge(r5, r59, 1).
adjacent(r5, r6).
shared_edge(r5, r6, 5).
adjacent(r5, r61).
shared_edge(r5, r61, 64).
adjacent(r5, r63).
shared_edge(r5, r63, 4).
adjacent(r5, r64).
shared_edge(r5, r64, 1).
adjacent(r5, r69).
shared_edge(r5, r69, 4).
adjacent(r5, r7).
shared_edge(r5, r7, 5).
adjacent(r5, r74).
shared_edge(r5, r74, 1).
adjacent(r5, r8).
shared_edge(r5, r8, 1).
adjacent(r5, r82).
shared_edge(r5, r82, 7).
adjacent(r50, r51).
shared_edge(r50, r51, 1).
adjacent(r50, r54).
shared_edge(r50, r54, 8).
adjacent(r50, r55).
shared_edge(r50, r55, 2).
adjacent(r50, r56).
shared_edge(r50, r56, 3).
adjacent(r50, r57).
shared_edge(r50, r57, 28).
adjacent(r50, r76).
shared_edge(r50, r76, 34).
adjacent(r51, r58).
shared_edge(r51, r58, 1).
adjacent(r52, r53).
shared_edge(r52, r53, 33).
adjacent(r54, r55).
shared_edge(r54, r55, 8).
adjacent(r54, r62).
shared_edge(r54, r62, 3).
adjacent(r54, r67).
shared_edge(r54, r67, 3).
adjacent(r54, r68).
shared_edge(r54, r68, 2).
adjacent(r55, r56).
shared_edge(r55, r56, 10).
adjacent(r56, r57).
shared_edge(r56, r57, 30).
adjacent(r56, r58).
shared_edge(r56, r58, 7).
adjacent(r56, r73).
shared_edge(r56, r73, 10).
adjacent(r56, r76).
shared_edge(r56, r76, 40).
adjacent(r56, r77).
shared_edge(r56, r77, 7).
adjacent(r56, r80).
shared_edge(r56, r80, 2).
adjacent(r56, r81).
shared_edge(r56, r81, 12).
adjacent(r56, r82).
shared_edge(r56, r82, 14).
adjacent(r56, r93).
shared_edge(r56, r93, 3).
adjacent(r56, r94).
shared_edge(r56, r94, 3).
adjacent(r56, r95).
shared_edge(r56, r95, 2).
adjacent(r56, r97).
shared_edge(r56, r97, 5).
adjacent(r56, r98).
shared_edge(r56, r98, 2).
adjacent(r59, r60).
shared_edge(r59, r60, 1).
adjacent(r59, r64).
shared_edge(r59, r64, 2).
adjacent(r60, r65).
shared_edge(r60, r65, 1).
adjacent(r62, r68).
shared_edge(r62, r68, 1).
adjacent(r64, r65).
shared_edge(r64, r65, 2).
adjacent(r64, r69).
shared_edge(r64, r69, 4).
adjacent(r64, r70).
shared_edge(r64, r70, 1).
adjacent(r64, r71).
shared_edge(r64, r71, 1).
adjacent(r64, r74).
shared_edge(r64, r74, 1).
adjacent(r65, r66).
shared_edge(r65, r66, 2).
adjacent(r65, r70).
shared_edge(r65, r70, 1).
adjacent(r66, r70).
shared_edge(r66, r70, 1).
adjacent(r66, r71).
shared_edge(r66, r71, 1).
adjacent(r66, r72).
shared_edge(r66, r72, 4).
adjacent(r66, r75).
shared_edge(r66, r75, 1).
adjacent(r66, r82).
shared_edge(r66, r82, 3).
adjacent(r66, r84).
shared_edge(r66, r84, 1).
adjacent(r66, r86).
shared_edge(r66, r86, 1).
adjacent(r67, r68).
shared_edge(r67, r68, 1).
adjacent(r70, r71).
shared_edge(r70, r71, 1).
adjacent(r71, r75).
shared_edge(r71, r75, 1).
adjacent(r72, r84).
shared_edge(r72, r84, 1).
adjacent(r73, r78).
shared_edge(r73, r78, 7).
adjacent(r73, r79).
shared_edge(r73, r79, 1).
adjacent(r74, r75).
shared_edge(r74, r75, 1).
adjacent(r74, r82).
shared_edge(r74, r82, 1).
adjacent(r75, r82).
shared_edge(r75, r82, 1).
adjacent(r77, r78).
shared_edge(r77, r78, 7).
adjacent(r77, r97).
shared_edge(r77, r97, 1).
adjacent(r77, r99).
shared_edge(r77, r99, 1).
adjacent(r78, r79).
shared_edge(r78, r79, 2).
adjacent(r78, r83).
shared_edge(r78, r83, 3).
adjacent(r78, r85).
shared_edge(r78, r85, 7).
adjacent(r78, r99).
shared_edge(r78, r99, 1).
adjacent(r79, r80).
shared_edge(r79, r80, 7).
adjacent(r79, r83).
shared_edge(r79, r83, 1).
adjacent(r79, r85).
shared_edge(r79, r85, 4).
adjacent(r8, r9).
shared_edge(r8, r9, 1).
adjacent(r80, r81).
shared_edge(r80, r81, 12).
adjacent(r82, r86).
shared_edge(r82, r86, 1).
adjacent(r82, r89).
shared_edge(r82, r89, 1).
adjacent(r82, r95).
shared_edge(r82, r95, 2).
adjacent(r84, r87).
shared_edge(r84, r87, 1).
adjacent(r86, r87).
shared_edge(r86, r87, 1).
adjacent(r86, r89).
shared_edge(r86, r89, 1).
adjacent(r87, r88).
shared_edge(r87, r88, 1).
adjacent(r87, r90).
shared_edge(r87, r90, 1).
adjacent(r88, r91).
shared_edge(r88, r91, 1).
adjacent(r89, r90).
shared_edge(r89, r90, 1).
adjacent(r89, r95).
shared_edge(r89, r95, 1).
adjacent(r90, r91).
shared_edge(r90, r91, 1).
adjacent(r90, r96).
shared_edge(r90, r96, 1).
adjacent(r91, r92).
shared_edge(r91, r92, 4).
adjacent(r91, r96).
shared_edge(r91, r96, 3).
adjacent(r93, r97).
shared_edge(r93, r97, 1).
adjacent(r94, r97).
shared_edge(r94, r97, 1).
adjacent(r95, r96).
shared_edge(r95, r96, 4).
adjacent(r97, r99).
shared_edge(r97, r99, 6).
adjacent(r98, r99).
shared_edge(r98, r99, 1).
