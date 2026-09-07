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

region(r1, '#484b4a', 310691, centroid(427,182)).
perimeter(r1, 2838).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(516,323),xy(518,323),xy(516,323)]).
hole(r1, [xy(460,287),xy(462,287),xy(460,287)]).
hole(r1, [xy(459,286),xy(461,286),xy(459,286)]).
hole(r1, [xy(458,285),xy(460,285),xy(458,285)]).
hole(r1, [xy(539,218),xy(541,218),xy(539,218)]).
hole(r1, [xy(533,217),xy(535,217),xy(533,217)]).
hole(r1, [xy(541,215),xy(543,215),xy(541,215)]).
hole(r1, [xy(521,205),xy(523,205),xy(521,205)]).
hole(r1, [xy(522,204),xy(524,204),xy(522,204)]).
hole(r1, [xy(524,201),xy(526,201),xy(524,201)]).
hole(r1, [xy(525,200),xy(527,200),xy(525,200)]).
hole(r1, [xy(528,196),xy(530,196),xy(528,196)]).
hole(r1, [xy(529,195),xy(531,195),xy(529,195)]).
hole(r1, [xy(530,194),xy(532,194),xy(530,194)]).
hole(r1, [xy(531,193),xy(533,193),xy(531,193)]).
hole(r1, [xy(392,182),xy(395,181),xy(400,185),xy(398,186),xy(392,182)]).
hole(r1, [xy(399,176),xy(401,176),xy(399,176)]).
hole(r1, [xy(403,174),xy(405,175),xy(404,178),xy(401,177),xy(403,174)]).
hole(r1, [xy(397,175),xy(399,175),xy(397,175)]).
hole(r1, [xy(400,174),xy(403,174),xy(400,174)]).
hole(r1, [xy(395,174),xy(397,174),xy(395,174)]).
hole(r1, [xy(397,173),xy(400,173),xy(397,173)]).
hole(r1, [xy(393,173),xy(395,173),xy(393,173)]).
hole(r1, [xy(395,172),xy(398,172),xy(395,172)]).
hole(r1, [xy(393,171),xy(396,171),xy(393,171)]).
hole(r1, [xy(405,170),xy(409,170),xy(405,170)]).
hole(r1, [xy(392,170),xy(394,170),xy(392,170)]).
hole(r1, [xy(390,169),xy(392,169),xy(390,169)]).
hole(r1, [xy(388,168),xy(390,168),xy(388,168)]).
hole(r1, [xy(407,167),xy(409,166),xy(410,169),xy(407,167)]).
hole(r1, [xy(405,166),xy(408,166),xy(405,166)]).
hole(r1, [xy(403,165),xy(406,165),xy(403,165)]).
hole(r1, [xy(400,164),xy(403,164),xy(400,164)]).
hole(r1, [xy(412,163),xy(414,163),xy(412,163)]).
hole(r1, [xy(399,163),xy(401,163),xy(399,163)]).
hole(r1, [xy(405,162),xy(408,161),xy(413,164),xy(410,165),xy(405,162)]).
hole(r1, [xy(396,162),xy(399,162),xy(396,162)]).
hole(r1, [xy(403,161),xy(406,161),xy(403,161)]).
hole(r1, [xy(394,161),xy(397,161),xy(394,161)]).
hole(r1, [xy(420,159),xy(421,161),xy(410,175),xy(410,170),xy(420,159)]).
hole(r1, [xy(412,160),xy(415,159),xy(416,161),xy(414,163),xy(412,160)]).
hole(r1, [xy(401,160),xy(403,160),xy(401,160)]).
hole(r1, [xy(398,159),xy(401,159),xy(398,159)]).
hole(r1, [xy(408,158),xy(411,157),xy(413,159),xy(408,158)]).
hole(r1, [xy(396,158),xy(398,158),xy(396,158)]).
hole(r1, [xy(407,157),xy(409,157),xy(407,157)]).
hole(r1, [xy(394,157),xy(396,157),xy(394,157)]).
hole(r1, [xy(404,156),xy(406,156),xy(404,156)]).
hole(r1, [xy(420,156),xy(418,158),xy(412,156),xy(417,156),xy(418,154),xy(420,156)]).
hole(r1, [xy(409,155),xy(412,155),xy(409,155)]).
hole(r1, [xy(407,154),xy(410,154),xy(407,154)]).
hole(r1, [xy(404,153),xy(407,153),xy(404,153)]).
hole(r1, [xy(421,152),xy(424,152),xy(421,152)]).
hole(r1, [xy(402,152),xy(404,152),xy(402,152)]).
hole(r1, [xy(399,151),xy(402,151),xy(399,151)]).
hole(r1, [xy(362,145),xy(364,145),xy(362,145)]).
hole(r1, [xy(364,142),xy(366,142),xy(364,142)]).
hole(r1, [xy(365,141),xy(367,141),xy(365,141)]).
hole(r1, [xy(366,140),xy(368,140),xy(366,140)]).
midline(r1, [xy(182,181),xy(212,180),xy(303,273),xy(459,274),xy(458,286),xy(460,288),xy(462,287),xy(459,284),xy(462,286)]).
midline(r1, [xy(671,181),xy(605,181),xy(499,75),xy(324,75),xy(301,91),xy(213,180),xy(301,92)]).
midline(r1, [xy(313,82),xy(305,91),xy(361,147),xy(364,141),xy(366,139),xy(368,139),xy(368,140),xy(364,144),xy(364,146)]).
midline(r1, [xy(368,141),xy(366,143)]).
midline(r1, [xy(362,148),xy(384,170),xy(387,170),xy(388,167),xy(390,167),xy(390,168),xy(388,170)]).
midline(r1, [xy(460,274),xy(489,274),xy(492,270),xy(390,170)]).
midline(r1, [xy(493,270),xy(498,268),xy(407,177),xy(407,173),xy(402,169),xy(391,168),xy(393,171),xy(395,169),xy(396,171),xy(394,172),xy(399,174),xy(399,176),xy(400,172),xy(398,172)]).
midline(r1, [xy(399,170),xy(400,171)]).
midline(r1, [xy(412,76),xy(412,142),xy(402,151),xy(402,155),xy(396,156),xy(320,81),xy(324,76)]).
midline(r1, [xy(404,151),xy(404,153)]).
midline(r1, [xy(394,156),xy(394,158),xy(396,157),xy(397,159),xy(397,161),xy(396,162),xy(396,166),xy(395,167),xy(399,165),xy(398,157)]).
midline(r1, [xy(400,164),xy(401,163),xy(401,159),xy(404,156),xy(403,155),xy(406,155),xy(406,156),xy(405,157),xy(404,157)]).
midline(r1, [xy(403,159),xy(403,160),xy(401,162),xy(403,161),xy(402,168),xy(407,167),xy(409,170),xy(408,172),xy(411,166),xy(405,162),xy(406,165)]).
midline(r1, [xy(406,161),xy(407,148),xy(412,143),xy(415,148),xy(407,157),xy(407,159),xy(412,160),xy(412,163),xy(413,162),xy(414,163),xy(412,165),xy(415,163),xy(417,159),xy(412,156),xy(409,157)]).
midline(r1, [xy(412,155),xy(412,153)]).
midline(r1, [xy(412,157),xy(413,159)]).
midline(r1, [xy(413,151),xy(416,149),xy(424,157),xy(418,158)]).
midline(r1, [xy(424,158),xy(525,257),xy(520,263),xy(498,270)]).
midline(r1, [xy(518,264),xy(516,322),xy(516,324),xy(517,324),xy(518,322)]).
midline(r1, [xy(408,166),xy(408,165)]).
midline(r1, [xy(403,172),xy(403,174),xy(400,177),xy(401,177)]).
midline(r1, [xy(522,262),xy(530,257),xy(570,216),xy(541,214),xy(540,217),xy(533,216),xy(533,218),xy(535,218)]).
midline(r1, [xy(570,215),xy(585,202),xy(584,200),xy(525,199),xy(522,204)]).
midline(r1, [xy(525,200),xy(526,201),xy(523,206)]).
midline(r1, [xy(526,202),xy(527,200)]).
midline(r1, [xy(539,218),xy(540,219),xy(543,216)]).
midline(r1, [xy(552,193),xy(531,192),xy(528,195),xy(529,197),xy(530,196),xy(529,195),xy(531,193),xy(532,194),xy(530,197)]).
midline(r1, [xy(533,193),xy(532,195)]).
midline(r1, [xy(553,193),xy(591,193),xy(585,200),xy(591,195)]).
midline(r1, [xy(592,193),xy(605,182)]).
fillpoint(r1, xy(182,182), 173.8).
fillpoint(r1, xy(687,166), 158.8).
fillpoint(r1, xy(688,168), 158.5).
fillpoint(r1, xy(689,173), 157.6).
fillpoint(r1, xy(690,178), 156.6).
fillpoint(r1, xy(691,182), 155.7).
fillpoint(r1, xy(692,187), 154.7).
fillpoint(r1, xy(693,191), 153.8).
fillpoint(r1, xy(694,196), 152.8).
fillpoint(r1, xy(695,201), 151.8).
fillpoint(r1, xy(696,205), 150.9).
fillpoint(r1, xy(277,236), 122.2).
fillpoint(r1, xy(282,237), 121.3).
fillpoint(r1, xy(286,238), 120.3).
fillpoint(r1, xy(291,239), 119.4).
fillpoint(r1, xy(607,112), 107.9).
fillpoint(r1, xy(602,111), 107.0).
fillpoint(r1, xy(597,110), 106.0).
fillpoint(r1, xy(593,109), 105.1).
fillpoint(r1, xy(588,108), 104.1).
fillpoint(r1, xy(584,107), 103.1).
fillpoint(r1, xy(579,106), 102.2).
fillpoint(r1, xy(574,105), 101.2).
fillpoint(r1, xy(322,258), 101.2).
fillpoint(r1, xy(570,104), 100.3).
fillpoint(r1, xy(326,259), 100.3).
fillpoint(r1, xy(565,103), 99.3).
fillpoint(r1, xy(331,260), 99.3).
fillpoint(r1, xy(560,102), 98.4).
fillpoint(r1, xy(335,261), 98.4).
fillpoint(r1, xy(505,102), 98.1).
fillpoint(r1, xy(508,101), 97.4).
fillpoint(r1, xy(556,101), 97.4).
fillpoint(r1, xy(340,262), 97.4).
fillpoint(r1, xy(513,100), 96.5).
fillpoint(r1, xy(551,100), 96.5).
fillpoint(r1, xy(344,263), 96.5).
fillpoint(r1, xy(518,99), 95.5).
fillpoint(r1, xy(547,99), 95.5).
fillpoint(r1, xy(349,264), 95.5).
fillpoint(r1, xy(522,98), 94.5).
fillpoint(r1, xy(542,98), 94.5).
fillpoint(r1, xy(354,265), 94.5).
fillpoint(r1, xy(527,97), 93.6).
fillpoint(r1, xy(537,97), 93.6).
fillpoint(r1, xy(358,266), 93.6).
fillpoint(r1, xy(532,96), 92.6).
fillpoint(r1, xy(363,267), 92.6).
fillpoint(r1, xy(368,268), 91.7).
fillpoint(r1, xy(481,88), 85.0).
fillpoint(r1, xy(477,87), 84.0).
fillpoint(r1, xy(472,86), 83.1).
fillpoint(r1, xy(468,85), 82.1).
fillpoint(r1, xy(463,84), 81.2).
fillpoint(r1, xy(596,279), 81.2).
fillpoint(r1, xy(458,83), 80.2).
fillpoint(r1, xy(592,280), 80.2).
fillpoint(r1, xy(454,82), 79.3).
fillpoint(r1, xy(587,281), 79.3).
fillpoint(r1, xy(313,81), 78.3).
fillpoint(r1, xy(449,81), 78.3).
fillpoint(r1, xy(582,282), 78.3).
fillpoint(r1, xy(318,80), 77.4).
fillpoint(r1, xy(445,80), 77.4).
fillpoint(r1, xy(323,79), 76.4).
fillpoint(r1, xy(440,79), 76.4).
fillpoint(r1, xy(327,78), 75.4).
fillpoint(r1, xy(435,78), 75.4).
fillpoint(r1, xy(332,77), 74.5).
fillpoint(r1, xy(414,77), 74.5).
fillpoint(r1, xy(431,77), 74.5).
fillpoint(r1, xy(337,76), 73.5).
fillpoint(r1, xy(407,76), 73.5).
fillpoint(r1, xy(419,76), 73.5).
fillpoint(r1, xy(426,76), 73.5).
fillpoint(r1, xy(396,76), 73.1).
fillpoint(r1, xy(341,75), 72.6).
fillpoint(r1, xy(393,75), 72.6).
fillpoint(r1, xy(401,75), 72.6).
fillpoint(r1, xy(346,74), 71.6).
fillpoint(r1, xy(389,74), 71.6).
fillpoint(r1, xy(350,73), 70.7).
fillpoint(r1, xy(384,73), 70.7).
fillpoint(r1, xy(355,72), 69.7).
fillpoint(r1, xy(379,72), 69.7).
fillpoint(r1, xy(360,71), 68.8).
fillpoint(r1, xy(375,71), 68.8).
fillpoint(r1, xy(364,70), 67.8).
fillpoint(r1, xy(370,70), 67.8).
fillpoint(r1, xy(460,218), 64.4).
fillpoint(r1, xy(454,221), 63.1).
fillpoint(r1, xy(452,222), 63.1).
fillpoint(r1, xy(456,220), 63.0).
fillpoint(r1, xy(450,223), 62.9).
fillpoint(r1, xy(448,224), 62.8).
fillpoint(r1, xy(429,235), 60.2).
fillpoint(r1, xy(438,231), 60.1).
fillpoint(r1, xy(436,232), 60.1).
fillpoint(r1, xy(431,234), 60.1).
fillpoint(r1, xy(427,236), 60.1).
fillpoint(r1, xy(422,238), 60.1).
fillpoint(r1, xy(420,239), 60.1).
fillpoint(r1, xy(441,230), 60.0).
fillpoint(r1, xy(434,233), 60.0).
fillpoint(r1, xy(424,237), 60.0).
fillpoint(r1, xy(417,240), 60.0).
fillpoint(r1, xy(484,155), 59.5).
fillpoint(r1, xy(481,161), 58.3).
fillpoint(r1, xy(478,167), 57.8).
fillpoint(r1, xy(474,176), 57.8).
fillpoint(r1, xy(471,183), 57.8).
fillpoint(r1, xy(468,190), 57.8).
fillpoint(r1, xy(464,199), 57.8).
fillpoint(r1, xy(477,169), 57.7).
fillpoint(r1, xy(475,174), 57.7).
fillpoint(r1, xy(473,178), 57.7).
fillpoint(r1, xy(472,181), 57.7).
fillpoint(r1, xy(470,185), 57.7).
fillpoint(r1, xy(469,188), 57.7).
fillpoint(r1, xy(467,192), 57.7).
fillpoint(r1, xy(465,197), 57.7).
fillpoint(r1, xy(479,165), 57.6).
fillpoint(r1, xy(476,171), 57.6).
fillpoint(r1, xy(466,195), 57.6).
fillpoint(r1, xy(463,201), 57.6).
fillpoint(r1, xy(511,266), 56.3).
fillpoint(r1, xy(539,275), 54.8).
fillpoint(r1, xy(537,274), 54.7).
fillpoint(r1, xy(521,268), 54.1).
fillpoint(r1, xy(523,269), 54.1).
fillpoint(r1, xy(528,271), 54.1).
fillpoint(r1, xy(530,272), 54.1).
fillpoint(r1, xy(519,267), 54.0).
fillpoint(r1, xy(532,273), 54.0).
fillpoint(r1, xy(526,270), 53.9).
fillpoint(r1, xy(486,243), 51.2).
fillpoint(r1, xy(488,244), 51.2).
fillpoint(r1, xy(493,246), 51.2).
fillpoint(r1, xy(491,245), 51.0).
fillpoint(r1, xy(497,251), 49.3).
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
opencv_morphology(r1, opening_area(310662), closing_area(313241), gradient_area(5331)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 2.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 2.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 2.0).
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
opencv_contour(r1, c12, hole, 2.0).
opencv_contour_hierarchy(r1, c12, next(c13), previous(c11), child(none), parent(c0)).
opencv_contour(r1, c13, hole, 2.0).
opencv_contour_hierarchy(r1, c13, next(c14), previous(c12), child(none), parent(c0)).
opencv_contour(r1, c14, hole, 2.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 2.0).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 20.5).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 2.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 12.5).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 2.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 4.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 2.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 4.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 2.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 4.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 4.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 6.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 2.0).
opencv_contour_hierarchy(r1, c28, next(c29), previous(c27), child(none), parent(c0)).
opencv_contour(r1, c29, hole, 2.0).
opencv_contour_hierarchy(r1, c29, next(c30), previous(c28), child(none), parent(c0)).
opencv_contour(r1, c30, hole, 7.5).
opencv_contour_hierarchy(r1, c30, next(c31), previous(c29), child(none), parent(c0)).
opencv_contour(r1, c31, hole, 4.0).
opencv_contour_hierarchy(r1, c31, next(c32), previous(c30), child(none), parent(c0)).
opencv_contour(r1, c32, hole, 4.0).
opencv_contour_hierarchy(r1, c32, next(c33), previous(c31), child(none), parent(c0)).
opencv_contour(r1, c33, hole, 4.0).
opencv_contour_hierarchy(r1, c33, next(c34), previous(c32), child(none), parent(c0)).
opencv_contour(r1, c34, hole, 2.0).
opencv_contour_hierarchy(r1, c34, next(c35), previous(c33), child(none), parent(c0)).
opencv_contour(r1, c35, hole, 2.0).
opencv_contour_hierarchy(r1, c35, next(c36), previous(c34), child(none), parent(c0)).
opencv_contour(r1, c36, hole, 16.0).
opencv_contour_hierarchy(r1, c36, next(c37), previous(c35), child(none), parent(c0)).
opencv_contour(r1, c37, hole, 4.0).
opencv_contour_hierarchy(r1, c37, next(c38), previous(c36), child(none), parent(c0)).
opencv_contour(r1, c38, hole, 4.0).
opencv_contour_hierarchy(r1, c38, next(c39), previous(c37), child(none), parent(c0)).
opencv_contour(r1, c39, hole, 4.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 56.5).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 10.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 4.0).
opencv_contour_hierarchy(r1, c43, next(c44), previous(c42), child(none), parent(c0)).
opencv_contour(r1, c44, hole, 9.0).
opencv_contour_hierarchy(r1, c44, next(c45), previous(c43), child(none), parent(c0)).
opencv_contour(r1, c45, hole, 2.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 2.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 2.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 2.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 17.5).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 4.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 4.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 4.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 4.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 4.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 2.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 2.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 2.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 2.0).
opencv_contour_hierarchy(r1, c59, next(none), previous(c58), child(none), parent(c0)).
