% bbox-FREE region facts (topology only).
:- dynamic region/4.
:- dynamic adjacent/2.
:- dynamic shared_edge/3.
:- dynamic encloses/2.
:- dynamic border/1.
:- dynamic img_size/2.
:- dynamic perimeter/2.
:- dynamic polygon/2.
:- dynamic hole/2.
:- dynamic midline/2.
:- dynamic fillpoint/3.
:- discontiguous region/4.
:- discontiguous adjacent/2.
:- discontiguous shared_edge/3.
:- discontiguous encloses/2.
:- discontiguous border/1.
:- discontiguous perimeter/2.
:- discontiguous polygon/2.
:- discontiguous hole/2.
:- discontiguous midline/2.
:- discontiguous fillpoint/3.
img_size(854, 364).

region(r1, '#828483', 310800, centroid(427,181)).
perimeter(r1, 2646).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(107,325),xy(109,325),xy(107,325)]).
hole(r1, [xy(76,324),xy(78,324),xy(76,324)]).
hole(r1, [xy(46,324),xy(50,324),xy(46,324)]).
hole(r1, [xy(75,323),xy(77,323),xy(75,323)]).
hole(r1, [xy(102,322),xy(104,323),xy(102,322)]).
hole(r1, [xy(54,322),xy(56,322),xy(54,322)]).
hole(r1, [xy(49,322),xy(51,322),xy(49,322)]).
hole(r1, [xy(145,321),xy(147,321),xy(145,321)]).
hole(r1, [xy(51,321),xy(53,321),xy(51,321)]).
hole(r1, [xy(144,320),xy(146,320),xy(144,320)]).
hole(r1, [xy(71,320),xy(73,320),xy(71,320)]).
hole(r1, [xy(58,320),xy(60,320),xy(58,320)]).
hole(r1, [xy(52,320),xy(54,320),xy(52,320)]).
hole(r1, [xy(59,319),xy(61,319),xy(59,319)]).
hole(r1, [xy(61,318),xy(63,318),xy(61,318)]).
hole(r1, [xy(63,317),xy(65,317),xy(63,317)]).
hole(r1, [xy(104,314),xy(106,314),xy(104,314)]).
hole(r1, [xy(134,312),xy(136,312),xy(134,312)]).
hole(r1, [xy(105,311),xy(107,312),xy(105,311)]).
hole(r1, [xy(92,309),xy(94,309),xy(92,309)]).
hole(r1, [xy(140,305),xy(142,305),xy(140,305)]).
hole(r1, [xy(114,305),xy(116,305),xy(114,305)]).
hole(r1, [xy(94,304),xy(94,309),xy(94,304)]).
hole(r1, [xy(139,304),xy(141,304),xy(139,304)]).
hole(r1, [xy(113,304),xy(115,304),xy(113,304)]).
hole(r1, [xy(90,304),xy(92,304),xy(90,304)]).
hole(r1, [xy(136,302),xy(138,302),xy(136,302)]).
hole(r1, [xy(135,301),xy(137,301),xy(135,301)]).
hole(r1, [xy(77,301),xy(79,301),xy(77,301)]).
hole(r1, [xy(132,298),xy(134,298),xy(132,298)]).
hole(r1, [xy(80,294),xy(82,294),xy(80,294)]).
hole(r1, [xy(119,292),xy(121,292),xy(119,292)]).
hole(r1, [xy(124,290),xy(126,290),xy(124,290)]).
hole(r1, [xy(240,288),xy(242,288),xy(240,288)]).
hole(r1, [xy(200,286),xy(202,286),xy(200,286)]).
hole(r1, [xy(199,285),xy(201,285),xy(199,285)]).
hole(r1, [xy(196,283),xy(198,283),xy(196,283)]).
hole(r1, [xy(100,276),xy(102,276),xy(100,276)]).
hole(r1, [xy(115,275),xy(117,275),xy(115,275)]).
hole(r1, [xy(223,273),xy(225,273),xy(223,273)]).
hole(r1, [xy(220,270),xy(222,270),xy(220,270)]).
hole(r1, [xy(219,269),xy(221,269),xy(219,269)]).
hole(r1, [xy(218,268),xy(220,268),xy(218,268)]).
hole(r1, [xy(66,268),xy(68,268),xy(66,268)]).
hole(r1, [xy(105,267),xy(107,267),xy(105,267)]).
hole(r1, [xy(26,261),xy(28,261),xy(26,261)]).
hole(r1, [xy(25,259),xy(27,259),xy(25,259)]).
hole(r1, [xy(173,258),xy(175,258),xy(173,258)]).
hole(r1, [xy(171,254),xy(173,254),xy(171,254)]).
midline(r1, [xy(671,181),xy(287,181),xy(264,158),xy(251,156),xy(247,152),xy(153,152),xy(48,256),xy(47,260),xy(28,260),xy(26,258),xy(25,258),xy(25,260),xy(26,262),xy(27,260)]).
midline(r1, [xy(114,191),xy(107,198)]).
midline(r1, [xy(68,237),xy(99,206)]).
midline(r1, [xy(48,260),xy(46,276),xy(23,300),xy(23,339),xy(28,344),xy(69,343),xy(75,336),xy(71,325),xy(71,314),xy(69,312),xy(55,321),xy(53,319),xy(52,319),xy(49,321),xy(49,323),xy(50,323),xy(52,320),xy(53,321),xy(51,323)]).
midline(r1, [xy(102,203),xy(104,201)]).
midline(r1, [xy(101,205),xy(100,277),xy(101,277),xy(102,275)]).
midline(r1, [xy(25,298),xy(47,277),xy(69,299),xy(69,311)]).
midline(r1, [xy(65,240),xy(49,256)]).
midline(r1, [xy(67,239),xy(66,269),xy(67,269),xy(68,267)]).
midline(r1, [xy(48,262),xy(80,295),xy(81,295),xy(82,293)]).
midline(r1, [xy(56,321),xy(55,323),xy(54,321)]).
midline(r1, [xy(82,295),xy(90,305),xy(91,305),xy(92,303)]).
midline(r1, [xy(70,301),xy(77,300),xy(77,302),xy(78,302),xy(79,301),xy(78,300),xy(79,300)]).
midline(r1, [xy(69,313),xy(64,318),xy(63,317),xy(63,318),xy(62,319),xy(61,318),xy(59,319),xy(58,321),xy(61,320)]).
midline(r1, [xy(106,200),xy(105,268),xy(106,268),xy(107,267),xy(106,266),xy(107,266)]).
midline(r1, [xy(151,154),xy(117,188)]).
midline(r1, [xy(75,337),xy(82,343),xy(123,343),xy(128,337),xy(116,325),xy(107,324),xy(107,326),xy(109,326)]).
midline(r1, [xy(116,324),xy(109,317),xy(94,315),xy(76,334),xy(94,316)]).
midline(r1, [xy(104,316),xy(104,313),xy(106,313),xy(106,315)]).
midline(r1, [xy(129,337),xy(133,337),xy(146,324),xy(144,319),xy(146,319),xy(145,321),xy(146,322),xy(156,313),xy(136,311),xy(134,311),xy(134,313),xy(136,313)]).
midline(r1, [xy(156,312),xy(163,307),xy(162,305),xy(143,305),xy(133,297),xy(132,299),xy(136,303),xy(140,306),xy(141,304)]).
midline(r1, [xy(138,301),xy(137,300)]).
midline(r1, [xy(163,305),xy(212,258),xy(211,256),xy(175,256),xy(172,253),xy(171,253),xy(171,255),xy(174,256),xy(173,259),xy(174,259),xy(175,258),xy(174,257),xy(175,257)]).
midline(r1, [xy(198,273),xy(198,281),xy(196,282),xy(196,284),xy(197,284),xy(198,282)]).
midline(r1, [xy(116,190),xy(115,276),xy(116,276),xy(117,275),xy(116,274),xy(117,274)]).
midline(r1, [xy(205,216),xy(117,303),xy(113,303),xy(114,306),xy(115,306),xy(116,304)]).
midline(r1, [xy(118,303),xy(204,217)]).
midline(r1, [xy(271,198),xy(217,252)]).
midline(r1, [xy(220,249),xy(239,230)]).
midline(r1, [xy(219,251),xy(218,269),xy(220,271),xy(221,271),xy(222,270),xy(219,267),xy(222,269)]).
midline(r1, [xy(242,227),xy(270,199)]).
midline(r1, [xy(241,229),xy(240,289),xy(241,289),xy(242,287)]).
midline(r1, [xy(217,190),xy(100,305),xy(99,314)]).
midline(r1, [xy(101,305),xy(119,287)]).
midline(r1, [xy(216,191),xy(121,286),xy(119,291),xy(119,293),xy(120,293),xy(121,292),xy(121,291)]).
midline(r1, [xy(286,182),xy(271,197),xy(287,182)]).
midline(r1, [xy(256,159),xy(255,160)]).
midline(r1, [xy(257,158),xy(256,158)]).
midline(r1, [xy(229,178),xy(228,179)]).
midline(r1, [xy(217,203),xy(262,159)]).
midline(r1, [xy(241,165),xy(250,156)]).
midline(r1, [xy(77,322),xy(75,322),xy(74,327),xy(77,323),xy(78,323),xy(77,325),xy(80,324),xy(91,313),xy(92,308),xy(93,308),xy(94,310)]).
midline(r1, [xy(225,273),xy(222,271),xy(223,274),xy(225,274)]).
midline(r1, [xy(200,284),xy(198,284),xy(200,287),xy(201,287),xy(202,286),xy(201,284),xy(202,285)]).
midline(r1, [xy(72,319),xy(73,319),xy(73,321)]).
fillpoint(r1, xy(672,181), 173.8).
fillpoint(r1, xy(355,168), 161.4).
fillpoint(r1, xy(350,167), 160.4).
fillpoint(r1, xy(346,166), 159.5).
fillpoint(r1, xy(335,160), 153.8).
fillpoint(r1, xy(328,157), 150.9).
fillpoint(r1, xy(324,156), 149.9).
fillpoint(r1, xy(319,155), 149.0).
fillpoint(r1, xy(314,154), 148.0).
fillpoint(r1, xy(310,153), 147.1).
fillpoint(r1, xy(305,152), 146.1).
fillpoint(r1, xy(300,151), 145.2).
fillpoint(r1, xy(296,150), 144.2).
fillpoint(r1, xy(291,149), 143.3).
fillpoint(r1, xy(287,148), 142.3).
fillpoint(r1, xy(282,147), 141.3).
fillpoint(r1, xy(277,146), 140.4).
fillpoint(r1, xy(273,145), 139.4).
fillpoint(r1, xy(268,144), 138.5).
fillpoint(r1, xy(264,143), 137.5).
fillpoint(r1, xy(259,142), 136.6).
fillpoint(r1, xy(254,141), 135.6).
fillpoint(r1, xy(250,140), 134.7).
fillpoint(r1, xy(245,139), 133.7).
fillpoint(r1, xy(241,138), 132.7).
fillpoint(r1, xy(236,137), 131.8).
fillpoint(r1, xy(231,136), 130.8).
fillpoint(r1, xy(212,135), 129.9).
fillpoint(r1, xy(227,135), 129.9).
fillpoint(r1, xy(135,135), 129.0).
fillpoint(r1, xy(137,134), 128.9).
fillpoint(r1, xy(207,134), 128.9).
fillpoint(r1, xy(216,134), 128.9).
fillpoint(r1, xy(222,134), 128.9).
fillpoint(r1, xy(142,133), 128.0).
fillpoint(r1, xy(203,133), 128.0).
fillpoint(r1, xy(146,132), 127.0).
fillpoint(r1, xy(198,132), 127.0).
fillpoint(r1, xy(151,131), 126.1).
fillpoint(r1, xy(194,131), 126.1).
fillpoint(r1, xy(155,130), 125.1).
fillpoint(r1, xy(189,130), 125.1).
fillpoint(r1, xy(160,129), 124.2).
fillpoint(r1, xy(184,129), 124.2).
fillpoint(r1, xy(165,128), 123.2).
fillpoint(r1, xy(180,128), 123.2).
fillpoint(r1, xy(169,127), 122.2).
fillpoint(r1, xy(175,127), 122.2).
border(r1).



% OpenCV grouping evidence (advisory; base topology remains authoritative).
:- dynamic opencv_background_candidate/1.
:- discontiguous opencv_background_candidate/1.
:- dynamic opencv_component/2.
:- discontiguous opencv_component/2.
:- dynamic opencv_component_area/2.
:- discontiguous opencv_component_area/2.
:- dynamic opencv_component_centroid/2.
:- discontiguous opencv_component_centroid/2.
:- dynamic opencv_contour/4.
:- discontiguous opencv_contour/4.
:- dynamic opencv_contour_hierarchy/6.
:- discontiguous opencv_contour_hierarchy/6.
:- dynamic opencv_morphology/4.
:- discontiguous opencv_morphology/4.
:- dynamic opencv_shape_metrics/7.
:- discontiguous opencv_shape_metrics/7.
:- dynamic opencv_watershed_count/2.
:- discontiguous opencv_watershed_count/2.
:- dynamic opencv_watershed_segment/4.
:- discontiguous opencv_watershed_segment/4.
opencv_background_candidate(r1).
opencv_morphology(r1, opening_area(310795), closing_area(313284), gradient_area(5112)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 6.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 2.0).
opencv_contour_hierarchy(r1, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r1, c5, hole, 4.0).
opencv_contour_hierarchy(r1, c5, next(c6), previous(c4), child(none), parent(c0)).
opencv_contour(r1, c6, hole, 2.0).
opencv_contour_hierarchy(r1, c6, next(c7), previous(c5), child(none), parent(c0)).
opencv_contour(r1, c7, hole, 2.0).
opencv_contour_hierarchy(r1, c7, next(c8), previous(c6), child(none), parent(c0)).
opencv_contour(r1, c8, hole, 2.0).
opencv_contour_hierarchy(r1, c8, next(c9), previous(c7), child(none), parent(c0)).
opencv_contour(r1, c9, hole, 2.0).
opencv_contour_hierarchy(r1, c9, next(c10), previous(c8), child(none), parent(c0)).
opencv_contour(r1, c10, hole, 2.0).
opencv_contour_hierarchy(r1, c10, next(c11), previous(c9), child(none), parent(c0)).
opencv_contour(r1, c11, hole, 2.0).
opencv_contour_hierarchy(r1, c11, next(c12), previous(c10), child(none), parent(c0)).
opencv_contour(r1, c12, hole, 2.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 2.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 2.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 2.0).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 2.0).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 2.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 2.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 4.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 2.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 2.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 2.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 8.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 2.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 2.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 2.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 2.0).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 2.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 2.0).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 2.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 2.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 2.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 2.0).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 2.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 2.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 2.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 2.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 2.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 2.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 2.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 2.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 2.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 2.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 2.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 2.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 2.0).
opencv_contour_hierarchy(r1, c49, next(none), previous(c48), child(none), parent(c0)).
