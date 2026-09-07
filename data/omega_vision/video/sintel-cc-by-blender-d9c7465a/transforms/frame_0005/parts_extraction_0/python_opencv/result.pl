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

region(r1, '#848d8f', 310802, centroid(427,181)).
perimeter(r1, 2610).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(501,359),xy(503,359),xy(501,359)]).
hole(r1, [xy(502,358),xy(504,358),xy(502,358)]).
hole(r1, [xy(503,357),xy(505,357),xy(503,357)]).
hole(r1, [xy(431,318),xy(433,319),xy(431,318)]).
hole(r1, [xy(432,317),xy(434,317),xy(432,317)]).
hole(r1, [xy(433,316),xy(435,316),xy(433,316)]).
hole(r1, [xy(434,315),xy(436,315),xy(434,315)]).
hole(r1, [xy(435,314),xy(437,314),xy(435,314)]).
hole(r1, [xy(419,307),xy(421,307),xy(419,307)]).
hole(r1, [xy(418,306),xy(420,306),xy(418,306)]).
hole(r1, [xy(417,305),xy(419,305),xy(417,305)]).
hole(r1, [xy(416,294),xy(419,294),xy(416,294)]).
hole(r1, [xy(362,291),xy(364,291),xy(362,291)]).
hole(r1, [xy(361,290),xy(363,290),xy(361,290)]).
hole(r1, [xy(359,288),xy(361,287),xy(362,289),xy(359,288)]).
hole(r1, [xy(358,286),xy(360,287),xy(358,286)]).
hole(r1, [xy(353,280),xy(359,285),xy(353,280)]).
hole(r1, [xy(343,244),xy(346,245),xy(344,246),xy(343,244)]).
hole(r1, [xy(342,243),xy(344,243),xy(342,243)]).
hole(r1, [xy(341,242),xy(343,242),xy(341,242)]).
hole(r1, [xy(339,240),xy(341,239),xy(342,241),xy(339,240)]).
hole(r1, [xy(337,239),xy(340,239),xy(337,239)]).
hole(r1, [xy(336,238),xy(338,238),xy(336,238)]).
hole(r1, [xy(334,237),xy(336,237),xy(334,237)]).
hole(r1, [xy(285,223),xy(287,223),xy(285,223)]).
hole(r1, [xy(269,206),xy(271,206),xy(269,206)]).
hole(r1, [xy(271,197),xy(273,197),xy(271,197)]).
hole(r1, [xy(276,190),xy(277,188),xy(279,189),xy(276,190)]).
hole(r1, [xy(279,185),xy(281,185),xy(279,185)]).
hole(r1, [xy(286,183),xy(288,183),xy(286,183)]).
hole(r1, [xy(288,181),xy(290,181),xy(288,181)]).
hole(r1, [xy(289,180),xy(291,180),xy(289,180)]).
hole(r1, [xy(155,20),xy(157,20),xy(155,20)]).
midline(r1, [xy(671,181),xy(614,181),xy(593,160),xy(578,159),xy(565,146),xy(508,146),xy(497,140),xy(486,140),xy(468,122),xy(464,122),xy(461,119),xy(398,119),xy(376,97),xy(368,94),xy(181,94),xy(157,118),xy(155,21),xy(155,19),xy(157,19),xy(157,21)]).
midline(r1, [xy(158,118),xy(181,95)]).
midline(r1, [xy(156,118),xy(138,137),xy(138,225),xy(189,276),xy(252,275),xy(276,301),xy(283,301),xy(284,304),xy(295,303),xy(312,322),xy(317,324),xy(356,286),xy(360,285),xy(360,287),xy(320,325)]).
midline(r1, [xy(359,289),xy(323,326),xy(381,325),xy(383,329),xy(397,329),xy(418,308),xy(417,304),xy(419,304),xy(419,305),xy(418,306),xy(419,308),xy(421,307),xy(420,305),xy(431,306),xy(577,160)]).
midline(r1, [xy(156,120),xy(139,137)]).
midline(r1, [xy(398,330),xy(409,341),xy(455,341),xy(614,182)]).
midline(r1, [xy(504,293),xy(504,355),xy(501,358),xy(501,360),xy(502,360),xy(503,359),xy(502,358),xy(504,356),xy(505,356),xy(505,357),xy(503,360)]).
midline(r1, [xy(271,198),xy(271,196),xy(273,197),xy(269,205),xy(269,258),xy(253,275),xy(286,243),xy(285,222),xy(287,222),xy(287,224)]).
midline(r1, [xy(271,205),xy(271,207)]).
midline(r1, [xy(391,263),xy(389,266),xy(389,313),xy(387,315),xy(362,292)]).
midline(r1, [xy(391,264),xy(508,147)]).
midline(r1, [xy(389,314),xy(382,324),xy(387,320)]).
midline(r1, [xy(426,220),xy(425,221)]).
midline(r1, [xy(473,152),xy(362,263),xy(335,263),xy(296,303),xy(335,264)]).
midline(r1, [xy(364,262),xy(485,141)]).
midline(r1, [xy(310,274),xy(342,241),xy(343,241),xy(343,242),xy(342,243),xy(343,244),xy(463,123)]).
midline(r1, [xy(325,146),xy(292,179),xy(289,179),xy(286,182),xy(287,184),xy(289,180)]).
midline(r1, [xy(293,179),xy(374,98)]).
midline(r1, [xy(290,182),xy(291,180)]).
midline(r1, [xy(311,211),xy(308,215),xy(308,220),xy(287,241),xy(308,221)]).
midline(r1, [xy(311,210),xy(312,205),xy(398,120)]).
midline(r1, [xy(310,213),xy(312,212),xy(334,234),xy(334,238),xy(335,238),xy(336,236),xy(336,239),xy(337,239),xy(338,237),xy(340,239),xy(280,300),xy(339,241)]).
midline(r1, [xy(302,162),xy(281,184)]).
midline(r1, [xy(301,163),xy(282,182)]).
midline(r1, [xy(438,208),xy(437,209)]).
midline(r1, [xy(317,147),xy(316,148)]).
midline(r1, [xy(496,149),xy(439,207),xy(502,144)]).
midline(r1, [xy(469,280),xy(432,316),xy(435,314),xy(436,315),xy(434,318),xy(470,279),xy(589,161)]).
midline(r1, [xy(336,127),xy(368,96)]).
midline(r1, [xy(364,290),xy(362,289),xy(364,291)]).
fillpoint(r1, xy(672,181), 173.8).
fillpoint(r1, xy(536,172), 165.2).
fillpoint(r1, xy(532,171), 164.3).
fillpoint(r1, xy(527,170), 163.3).
fillpoint(r1, xy(523,169), 162.4).
fillpoint(r1, xy(518,168), 161.4).
fillpoint(r1, xy(513,167), 160.4).
fillpoint(r1, xy(509,166), 159.5).
fillpoint(r1, xy(504,165), 158.5).
fillpoint(r1, xy(499,164), 157.6).
fillpoint(r1, xy(495,163), 156.6).
fillpoint(r1, xy(490,162), 155.7).
fillpoint(r1, xy(486,161), 154.7).
fillpoint(r1, xy(481,160), 153.8).
fillpoint(r1, xy(476,159), 152.8).
fillpoint(r1, xy(472,158), 151.8).
fillpoint(r1, xy(467,157), 150.9).
fillpoint(r1, xy(144,159), 137.7).
fillpoint(r1, xy(143,162), 137.5).
fillpoint(r1, xy(142,167), 136.6).
fillpoint(r1, xy(141,171), 135.6).
fillpoint(r1, xy(436,140), 134.7).
fillpoint(r1, xy(140,176), 134.7).
fillpoint(r1, xy(432,139), 133.7).
fillpoint(r1, xy(139,180), 133.7).
fillpoint(r1, xy(428,138), 132.7).
fillpoint(r1, xy(138,185), 132.7).
fillpoint(r1, xy(138,223), 132.7).
fillpoint(r1, xy(139,225), 132.7).
fillpoint(r1, xy(423,137), 131.8).
fillpoint(r1, xy(137,190), 131.8).
fillpoint(r1, xy(137,218), 131.8).
fillpoint(r1, xy(419,136), 130.8).
fillpoint(r1, xy(136,194), 130.8).
fillpoint(r1, xy(136,214), 130.8).
fillpoint(r1, xy(136,199), 130.7).
fillpoint(r1, xy(414,135), 129.9).
fillpoint(r1, xy(135,203), 129.9).
fillpoint(r1, xy(135,209), 129.9).
fillpoint(r1, xy(410,134), 128.9).
fillpoint(r1, xy(405,133), 128.0).
fillpoint(r1, xy(194,117), 108.4).
fillpoint(r1, xy(201,111), 105.5).
fillpoint(r1, xy(206,108), 104.1).
fillpoint(r1, xy(210,107), 103.1).
fillpoint(r1, xy(215,106), 102.2).
fillpoint(r1, xy(218,105), 101.2).
fillpoint(r1, xy(362,105), 101.2).
fillpoint(r1, xy(223,104), 100.3).
fillpoint(r1, xy(358,104), 100.3).
fillpoint(r1, xy(227,103), 99.3).
fillpoint(r1, xy(353,103), 99.3).
fillpoint(r1, xy(232,102), 98.4).
fillpoint(r1, xy(348,102), 98.4).
fillpoint(r1, xy(236,101), 97.4).
fillpoint(r1, xy(344,101), 97.4).
fillpoint(r1, xy(241,100), 96.5).
fillpoint(r1, xy(339,100), 96.5).
fillpoint(r1, xy(246,99), 95.5).
fillpoint(r1, xy(335,99), 95.5).
fillpoint(r1, xy(250,98), 94.5).
fillpoint(r1, xy(330,98), 94.5).
fillpoint(r1, xy(255,97), 93.6).
fillpoint(r1, xy(325,97), 93.6).
fillpoint(r1, xy(260,96), 92.6).
fillpoint(r1, xy(321,96), 92.6).
fillpoint(r1, xy(264,95), 91.7).
fillpoint(r1, xy(316,95), 91.7).
fillpoint(r1, xy(269,94), 90.7).
fillpoint(r1, xy(312,94), 90.7).
fillpoint(r1, xy(273,93), 89.8).
fillpoint(r1, xy(307,93), 89.8).
fillpoint(r1, xy(278,92), 88.8).
fillpoint(r1, xy(302,92), 88.8).
fillpoint(r1, xy(283,91), 87.9).
fillpoint(r1, xy(298,91), 87.9).
fillpoint(r1, xy(210,272), 87.9).
fillpoint(r1, xy(287,90), 86.9).
fillpoint(r1, xy(293,90), 86.9).
fillpoint(r1, xy(214,273), 86.9).
fillpoint(r1, xy(218,274), 86.0).
fillpoint(r1, xy(232,282), 78.3).
fillpoint(r1, xy(237,283), 77.4).
fillpoint(r1, xy(242,284), 76.4).
fillpoint(r1, xy(246,285), 75.4).
fillpoint(r1, xy(251,286), 74.5).
fillpoint(r1, xy(256,287), 73.5).
fillpoint(r1, xy(260,288), 72.6).
fillpoint(r1, xy(265,289), 71.6).
fillpoint(r1, xy(269,290), 70.7).
fillpoint(r1, xy(274,291), 69.7).
fillpoint(r1, xy(279,292), 68.8).
fillpoint(r1, xy(283,293), 67.8).
fillpoint(r1, xy(288,293), 67.7).
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
opencv_morphology(r1, opening_area(310797), closing_area(313284), gradient_area(5048)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 2.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 4.0).
opencv_contour_hierarchy(r1, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r1, c5, hole, 2.0).
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
opencv_contour(r1, c12, hole, 4.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 2.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 2.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 5.5).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 4.0).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 16.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 5.5).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 2.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 2.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 5.5).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 4.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 2.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 2.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 2.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 2.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 5.5).
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
opencv_contour_hierarchy(r1, c33, next(none), previous(c32), child(none), parent(c0)).
