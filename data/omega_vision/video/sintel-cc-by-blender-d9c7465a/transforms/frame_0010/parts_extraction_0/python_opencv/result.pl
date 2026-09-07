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

region(r1, '#98a0a1', 310387, centroid(427,182)).
perimeter(r1, 3830).
polygon(r1, [xy(0,0),xy(0,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(366,349),xy(368,349),xy(366,349)]).
hole(r1, [xy(387,344),xy(387,352),xy(387,344)]).
hole(r1, [xy(385,343),xy(387,344),xy(385,343)]).
hole(r1, [xy(384,342),xy(386,342),xy(384,342)]).
hole(r1, [xy(347,341),xy(349,341),xy(347,341)]).
hole(r1, [xy(382,340),xy(385,341),xy(383,342),xy(382,340)]).
hole(r1, [xy(381,339),xy(383,339),xy(381,339)]).
hole(r1, [xy(346,339),xy(348,339),xy(346,339)]).
hole(r1, [xy(380,338),xy(382,338),xy(380,338)]).
hole(r1, [xy(345,338),xy(347,338),xy(345,338)]).
hole(r1, [xy(379,337),xy(381,337),xy(379,337)]).
hole(r1, [xy(344,337),xy(346,337),xy(344,337)]).
hole(r1, [xy(378,336),xy(380,336),xy(378,336)]).
hole(r1, [xy(377,334),xy(379,335),xy(377,334)]).
hole(r1, [xy(323,334),xy(325,334),xy(323,334)]).
hole(r1, [xy(324,333),xy(326,333),xy(324,333)]).
hole(r1, [xy(376,332),xy(378,332),xy(376,332)]).
hole(r1, [xy(359,329),xy(361,329),xy(359,329)]).
hole(r1, [xy(360,328),xy(362,328),xy(360,328)]).
hole(r1, [xy(382,305),xy(384,305),xy(382,305)]).
hole(r1, [xy(386,292),xy(388,292),xy(386,292)]).
hole(r1, [xy(387,291),xy(389,291),xy(387,291)]).
hole(r1, [xy(229,284),xy(231,284),xy(229,284)]).
hole(r1, [xy(228,283),xy(230,283),xy(228,283)]).
hole(r1, [xy(479,261),xy(481,261),xy(479,261)]).
hole(r1, [xy(423,260),xy(426,260),xy(423,260)]).
hole(r1, [xy(416,260),xy(418,260),xy(416,260)]).
hole(r1, [xy(426,258),xy(428,259),xy(426,258)]).
hole(r1, [xy(414,258),xy(416,258),xy(414,258)]).
hole(r1, [xy(427,257),xy(429,257),xy(427,257)]).
hole(r1, [xy(413,257),xy(415,257),xy(413,257)]).
hole(r1, [xy(428,256),xy(430,256),xy(428,256)]).
hole(r1, [xy(412,256),xy(414,256),xy(412,256)]).
hole(r1, [xy(383,237),xy(385,237),xy(383,237)]).
hole(r1, [xy(383,232),xy(385,232),xy(383,232)]).
hole(r1, [xy(435,219),xy(437,219),xy(435,219)]).
hole(r1, [xy(433,218),xy(435,218),xy(433,218)]).
hole(r1, [xy(431,217),xy(433,217),xy(431,217)]).
hole(r1, [xy(428,216),xy(431,216),xy(428,216)]).
hole(r1, [xy(427,215),xy(429,215),xy(427,215)]).
hole(r1, [xy(410,208),xy(412,208),xy(410,208)]).
hole(r1, [xy(383,207),xy(385,207),xy(383,207)]).
hole(r1, [xy(382,204),xy(384,205),xy(382,204)]).
hole(r1, [xy(381,203),xy(383,203),xy(381,203)]).
hole(r1, [xy(330,199),xy(332,199),xy(330,199)]).
hole(r1, [xy(237,199),xy(239,199),xy(237,199)]).
hole(r1, [xy(406,197),xy(408,197),xy(406,197)]).
hole(r1, [xy(331,197),xy(333,197),xy(331,197)]).
hole(r1, [xy(332,196),xy(334,196),xy(332,196)]).
hole(r1, [xy(333,195),xy(335,195),xy(333,195)]).
hole(r1, [xy(334,194),xy(336,194),xy(334,194)]).
hole(r1, [xy(449,185),xy(451,185),xy(449,185)]).
hole(r1, [xy(451,182),xy(453,182),xy(451,182)]).
hole(r1, [xy(428,181),xy(430,181),xy(428,181)]).
hole(r1, [xy(329,180),xy(336,188),xy(336,194),xy(328,182),xy(329,180)]).
hole(r1, [xy(429,180),xy(431,180),xy(429,180)]).
hole(r1, [xy(381,179),xy(380,183),xy(381,179)]).
hole(r1, [xy(381,179),xy(383,179),xy(381,179)]).
hole(r1, [xy(383,178),xy(385,178),xy(383,178)]).
hole(r1, [xy(325,178),xy(327,177),xy(329,180),xy(325,178)]).
hole(r1, [xy(432,176),xy(431,180),xy(432,176)]).
hole(r1, [xy(384,177),xy(386,177),xy(384,177)]).
hole(r1, [xy(432,176),xy(434,176),xy(432,176)]).
hole(r1, [xy(385,176),xy(387,176),xy(385,176)]).
hole(r1, [xy(323,176),xy(325,175),xy(326,177),xy(323,176)]).
hole(r1, [xy(422,175),xy(424,175),xy(422,175)]).
hole(r1, [xy(386,175),xy(388,175),xy(386,175)]).
hole(r1, [xy(322,175),xy(324,175),xy(322,175)]).
hole(r1, [xy(387,174),xy(389,174),xy(387,174)]).
hole(r1, [xy(388,173),xy(390,173),xy(388,173)]).
hole(r1, [xy(402,172),xy(404,172),xy(402,172)]).
hole(r1, [xy(389,171),xy(391,171),xy(389,171)]).
hole(r1, [xy(318,171),xy(323,174),xy(321,175),xy(318,171)]).
hole(r1, [xy(402,170),xy(404,170),xy(402,170)]).
hole(r1, [xy(390,170),xy(393,170),xy(390,170)]).
hole(r1, [xy(392,169),xy(394,169),xy(392,169)]).
hole(r1, [xy(454,168),xy(456,168),xy(454,168)]).
hole(r1, [xy(393,168),xy(396,168),xy(393,168)]).
hole(r1, [xy(316,168),xy(319,170),xy(316,168)]).
hole(r1, [xy(395,167),xy(397,167),xy(395,167)]).
hole(r1, [xy(396,166),xy(398,166),xy(396,166)]).
hole(r1, [xy(465,165),xy(469,165),xy(465,165)]).
hole(r1, [xy(398,165),xy(401,165),xy(398,165)]).
hole(r1, [xy(494,164),xy(496,164),xy(494,164)]).
hole(r1, [xy(400,164),xy(403,164),xy(400,164)]).
hole(r1, [xy(453,163),xy(455,163),xy(453,163)]).
hole(r1, [xy(402,163),xy(404,163),xy(402,163)]).
hole(r1, [xy(460,162),xy(464,161),xy(466,164),xy(460,162)]).
hole(r1, [xy(455,162),xy(457,162),xy(455,162)]).
hole(r1, [xy(459,161),xy(461,161),xy(459,161)]).
hole(r1, [xy(456,161),xy(459,161),xy(456,161)]).
hole(r1, [xy(422,160),xy(424,161),xy(422,160)]).
hole(r1, [xy(431,158),xy(435,158),xy(431,158)]).
hole(r1, [xy(423,157),xy(426,157),xy(423,157)]).
hole(r1, [xy(372,152),xy(374,152),xy(372,152)]).
hole(r1, [xy(365,152),xy(368,152),xy(365,152)]).
hole(r1, [xy(314,152),xy(316,153),xy(314,152)]).
hole(r1, [xy(373,151),xy(375,151),xy(373,151)]).
hole(r1, [xy(207,151),xy(209,151),xy(207,151)]).
hole(r1, [xy(377,150),xy(379,150),xy(377,150)]).
hole(r1, [xy(315,150),xy(317,151),xy(315,150)]).
hole(r1, [xy(316,149),xy(318,149),xy(316,149)]).
hole(r1, [xy(317,148),xy(319,148),xy(317,148)]).
hole(r1, [xy(391,147),xy(388,150),xy(381,149),xy(391,147)]).
hole(r1, [xy(393,146),xy(396,146),xy(393,146)]).
hole(r1, [xy(362,145),xy(361,151),xy(360,147),xy(362,145)]).
hole(r1, [xy(318,147),xy(319,145),xy(321,146),xy(318,147)]).
hole(r1, [xy(320,145),xy(322,145),xy(320,145)]).
hole(r1, [xy(321,144),xy(324,144),xy(321,144)]).
hole(r1, [xy(223,144),xy(225,144),xy(223,144)]).
hole(r1, [xy(395,143),xy(397,143),xy(395,143)]).
hole(r1, [xy(224,143),xy(226,143),xy(224,143)]).
hole(r1, [xy(195,143),xy(197,143),xy(195,143)]).
hole(r1, [xy(225,142),xy(227,142),xy(225,142)]).
hole(r1, [xy(485,141),xy(488,141),xy(485,141)]).
hole(r1, [xy(396,141),xy(398,142),xy(396,141)]).
hole(r1, [xy(226,141),xy(228,141),xy(226,141)]).
hole(r1, [xy(397,140),xy(399,140),xy(397,140)]).
hole(r1, [xy(227,139),xy(229,140),xy(227,139)]).
hole(r1, [xy(374,137),xy(375,142),xy(373,144),xy(374,137)]).
hole(r1, [xy(228,138),xy(230,138),xy(228,138)]).
hole(r1, [xy(229,137),xy(231,137),xy(229,137)]).
hole(r1, [xy(402,135),xy(403,137),xy(399,140),xy(402,135)]).
hole(r1, [xy(402,135),xy(403,133),xy(405,134),xy(402,135)]).
hole(r1, [xy(196,133),xy(198,133),xy(196,133)]).
hole(r1, [xy(195,132),xy(197,132),xy(195,132)]).
hole(r1, [xy(194,130),xy(196,130),xy(194,130)]).
hole(r1, [xy(367,129),xy(369,129),xy(367,129)]).
hole(r1, [xy(334,128),xy(335,130),xy(333,131),xy(334,128)]).
hole(r1, [xy(334,128),xy(335,126),xy(337,127),xy(334,128)]).
hole(r1, [xy(364,126),xy(366,126),xy(364,126)]).
hole(r1, [xy(351,126),xy(353,126),xy(351,126)]).
hole(r1, [xy(336,126),xy(338,126),xy(336,126)]).
hole(r1, [xy(352,125),xy(354,125),xy(352,125)]).
hole(r1, [xy(337,125),xy(339,125),xy(337,125)]).
hole(r1, [xy(467,122),xy(469,122),xy(467,122)]).
hole(r1, [xy(402,122),xy(404,122),xy(402,122)]).
hole(r1, [xy(401,121),xy(403,121),xy(401,121)]).
hole(r1, [xy(192,121),xy(194,121),xy(192,121)]).
hole(r1, [xy(468,120),xy(469,118),xy(471,119),xy(468,120)]).
hole(r1, [xy(399,119),xy(401,118),xy(402,120),xy(400,121),xy(399,119)]).
hole(r1, [xy(394,114),xy(396,114),xy(394,114)]).
hole(r1, [xy(395,108),xy(397,109),xy(395,108)]).
hole(r1, [xy(396,107),xy(398,107),xy(396,107)]).
hole(r1, [xy(471,105),xy(473,105),xy(471,105)]).
hole(r1, [xy(406,105),xy(409,105),xy(406,105)]).
hole(r1, [xy(397,105),xy(399,106),xy(397,105)]).
hole(r1, [xy(408,104),xy(409,102),xy(411,103),xy(408,104)]).
hole(r1, [xy(410,102),xy(412,102),xy(410,102)]).
hole(r1, [xy(418,98),xy(416,101),xy(418,98)]).
hole(r1, [xy(421,92),xy(422,94),xy(419,99),xy(418,96),xy(421,92)]).
hole(r1, [xy(423,89),xy(422,93),xy(423,89)]).
hole(r1, [xy(427,88),xy(428,91),xy(426,92),xy(427,88)]).
hole(r1, [xy(423,89),xy(425,89),xy(423,89)]).
hole(r1, [xy(467,88),xy(469,88),xy(467,88)]).
hole(r1, [xy(424,88),xy(426,88),xy(424,88)]).
hole(r1, [xy(468,87),xy(470,87),xy(468,87)]).
hole(r1, [xy(425,87),xy(427,87),xy(425,87)]).
hole(r1, [xy(469,86),xy(471,86),xy(469,86)]).
hole(r1, [xy(426,86),xy(428,86),xy(426,86)]).
hole(r1, [xy(427,85),xy(429,85),xy(427,85)]).
hole(r1, [xy(402,85),xy(404,85),xy(402,85)]).
hole(r1, [xy(472,82),xy(471,86),xy(472,82)]).
hole(r1, [xy(428,83),xy(430,83),xy(428,83)]).
hole(r1, [xy(270,83),xy(272,83),xy(270,83)]).
hole(r1, [xy(271,82),xy(273,82),xy(271,82)]).
hole(r1, [xy(429,81),xy(431,82),xy(429,81)]).
hole(r1, [xy(272,81),xy(274,81),xy(272,81)]).
hole(r1, [xy(474,79),xy(473,83),xy(474,79)]).
hole(r1, [xy(430,80),xy(432,80),xy(430,80)]).
hole(r1, [xy(273,80),xy(275,80),xy(273,80)]).
hole(r1, [xy(431,77),xy(433,78),xy(431,77)]).
hole(r1, [xy(501,76),xy(503,76),xy(501,76)]).
hole(r1, [xy(478,75),xy(475,80),xy(474,78),xy(478,75)]).
hole(r1, [xy(432,75),xy(434,76),xy(432,75)]).
hole(r1, [xy(433,73),xy(435,74),xy(433,73)]).
hole(r1, [xy(522,71),xy(524,71),xy(522,71)]).
hole(r1, [xy(434,71),xy(436,72),xy(434,71)]).
hole(r1, [xy(524,70),xy(527,70),xy(524,70)]).
hole(r1, [xy(527,69),xy(529,69),xy(527,69)]).
hole(r1, [xy(435,69),xy(437,69),xy(435,69)]).
hole(r1, [xy(528,68),xy(530,68),xy(528,68)]).
hole(r1, [xy(529,67),xy(531,67),xy(529,67)]).
hole(r1, [xy(436,66),xy(438,67),xy(436,66)]).
hole(r1, [xy(530,66),xy(531,64),xy(533,65),xy(530,66)]).
hole(r1, [xy(424,64),xy(426,64),xy(424,64)]).
hole(r1, [xy(392,63),xy(394,63),xy(392,63)]).
hole(r1, [xy(428,62),xy(432,62),xy(428,62)]).
hole(r1, [xy(439,60),xy(438,65),xy(437,62),xy(439,60)]).
hole(r1, [xy(431,61),xy(433,61),xy(431,61)]).
hole(r1, [xy(433,60),xy(435,60),xy(433,60)]).
hole(r1, [xy(279,58),xy(281,58),xy(279,58)]).
hole(r1, [xy(441,57),xy(440,60),xy(434,59),xy(439,56),xy(441,57)]).
hole(r1, [xy(491,46),xy(495,51),xy(494,54),xy(490,48),xy(491,46)]).
hole(r1, [xy(266,38),xy(268,39),xy(266,38)]).
hole(r1, [xy(265,37),xy(267,37),xy(265,37)]).
hole(r1, [xy(488,35),xy(490,47),xy(487,46),xy(488,35)]).
hole(r1, [xy(427,36),xy(429,37),xy(427,36)]).
hole(r1, [xy(488,35),xy(490,35),xy(488,35)]).
hole(r1, [xy(264,35),xy(266,36),xy(264,35)]).
hole(r1, [xy(489,34),xy(491,34),xy(489,34)]).
hole(r1, [xy(263,34),xy(265,34),xy(263,34)]).
hole(r1, [xy(431,32),xy(429,36),xy(428,34),xy(431,32)]).
hole(r1, [xy(490,32),xy(492,33),xy(490,32)]).
hole(r1, [xy(431,32),xy(434,32),xy(431,32)]).
hole(r1, [xy(491,31),xy(493,31),xy(491,31)]).
hole(r1, [xy(433,31),xy(435,31),xy(433,31)]).
hole(r1, [xy(490,30),xy(492,30),xy(490,30)]).
hole(r1, [xy(434,30),xy(437,30),xy(434,30)]).
hole(r1, [xy(436,29),xy(438,29),xy(436,29)]).
hole(r1, [xy(438,28),xy(440,28),xy(438,28)]).
hole(r1, [xy(450,28),xy(455,26),xy(456,30),xy(450,28)]).
hole(r1, [xy(447,27),xy(450,27),xy(447,27)]).
hole(r1, [xy(385,23),xy(387,23),xy(385,23)]).
hole(r1, [xy(492,20),xy(494,20),xy(492,20)]).
hole(r1, [xy(384,20),xy(386,21),xy(384,20)]).
hole(r1, [xy(493,19),xy(495,19),xy(493,19)]).
hole(r1, [xy(494,18),xy(496,18),xy(494,18)]).
hole(r1, [xy(504,17),xy(506,17),xy(504,17)]).
hole(r1, [xy(383,17),xy(385,17),xy(383,17)]).
hole(r1, [xy(505,16),xy(507,16),xy(505,16)]).
hole(r1, [xy(506,15),xy(507,13),xy(509,14),xy(506,15)]).
hole(r1, [xy(382,14),xy(384,14),xy(382,14)]).
hole(r1, [xy(508,13),xy(510,13),xy(508,13)]).
hole(r1, [xy(510,12),xy(512,12),xy(510,12)]).
hole(r1, [xy(441,12),xy(443,12),xy(441,12)]).
hole(r1, [xy(381,11),xy(383,12),xy(381,11)]).
hole(r1, [xy(442,10),xy(444,11),xy(442,10)]).
hole(r1, [xy(380,8),xy(382,9),xy(380,8)]).
hole(r1, [xy(445,6),xy(446,9),xy(444,10),xy(445,6)]).
hole(r1, [xy(378,6),xy(380,7),xy(378,6)]).
hole(r1, [xy(448,5),xy(450,5),xy(448,5)]).
hole(r1, [xy(377,5),xy(379,5),xy(377,5)]).
hole(r1, [xy(449,4),xy(451,4),xy(449,4)]).
hole(r1, [xy(376,4),xy(378,4),xy(376,4)]).
hole(r1, [xy(450,3),xy(452,3),xy(450,3)]).
hole(r1, [xy(375,1),xy(377,1),xy(375,1)]).
midline(r1, [xy(420,141),xy(413,146),xy(402,135),xy(394,128),xy(388,129),xy(385,124),xy(381,124),xy(366,109),xy(355,119),xy(355,123),xy(351,125),xy(351,127),xy(352,127),xy(353,126),xy(352,125)]).
midline(r1, [xy(365,111),xy(364,127),xy(365,127),xy(366,125)]).
midline(r1, [xy(356,119),xy(363,112)]).
midline(r1, [xy(419,142),xy(416,145)]).
midline(r1, [xy(354,125),xy(347,141),xy(334,128),xy(319,128),xy(280,90),xy(216,90),xy(194,70),xy(157,70),xy(114,113),xy(114,249),xy(120,250),xy(223,147),xy(223,143),xy(226,140),xy(228,141),xy(224,145),xy(228,142)]).
midline(r1, [xy(319,129),xy(342,148),xy(342,156),xy(339,159),xy(335,159),xy(321,146),xy(274,98),xy(271,109),xy(271,181),xy(239,213),xy(237,200),xy(237,198),xy(239,198),xy(239,200)]).
midline(r1, [xy(275,97),xy(273,93),xy(228,138),xy(229,137),xy(230,139),xy(273,94)]).
midline(r1, [xy(271,88),xy(270,82),xy(273,79),xy(273,80),xy(274,79),xy(275,80),xy(271,84),xy(275,81)]).
midline(r1, [xy(157,71),xy(115,113)]).
midline(r1, [xy(115,131),xy(193,131),xy(194,129),xy(196,129),xy(195,133),xy(197,134),xy(198,133),xy(196,131),xy(198,132)]).
midline(r1, [xy(275,92),xy(275,93)]).
midline(r1, [xy(348,141),xy(343,147),xy(347,144)]).
midline(r1, [xy(270,183),xy(240,213)]).
midline(r1, [xy(334,159),xy(326,158),xy(319,152),xy(273,106)]).
midline(r1, [xy(350,133),xy(355,129),xy(367,141),xy(364,152),xy(349,167),xy(344,165),xy(328,181),xy(326,181),xy(236,271),xy(219,266),xy(202,251),xy(121,251)]).
midline(r1, [xy(363,154),xy(349,168),xy(358,173),xy(359,215),xy(310,264),xy(304,265),xy(291,278),xy(248,277),xy(237,271),xy(326,182)]).
midline(r1, [xy(366,148),xy(371,147),xy(373,149),xy(372,153),xy(373,153),xy(374,152),xy(373,151),xy(375,150),xy(375,157),xy(380,161),xy(380,164),xy(378,166),xy(366,166),xy(359,173),xy(364,168)]).
midline(r1, [xy(379,166),xy(386,174),xy(381,178),xy(381,179),xy(382,180),xy(389,170),xy(391,171),xy(390,173),xy(383,180)]).
midline(r1, [xy(304,266),xy(292,278),xy(325,311),xy(325,331),xy(323,333),xy(323,335),xy(324,335),xy(325,334),xy(324,333),xy(326,332),xy(325,335)]).
midline(r1, [xy(326,312),xy(344,330),xy(359,328),xy(359,330),xy(360,330),xy(361,329),xy(360,327),xy(362,327),xy(361,330)]).
midline(r1, [xy(229,270),xy(228,284),xy(230,285),xy(231,284),xy(229,282),xy(231,283)]).
midline(r1, [xy(115,121),xy(192,120),xy(193,122),xy(194,120)]).
midline(r1, [xy(390,174),xy(385,179)]).
midline(r1, [xy(389,177),xy(398,186),xy(392,193),xy(369,195),xy(360,205),xy(369,196)]).
midline(r1, [xy(318,152),xy(314,151),xy(272,109)]).
midline(r1, [xy(321,144),xy(322,145)]).
midline(r1, [xy(340,159),xy(342,157),xy(343,159),xy(326,177),xy(325,178),xy(322,177),xy(231,268),xy(322,178)]).
midline(r1, [xy(375,195),xy(381,201),xy(381,204),xy(382,204),xy(383,203),xy(382,202),xy(383,202)]).
midline(r1, [xy(115,151),xy(207,150),xy(207,152),xy(208,152),xy(209,151),xy(208,150),xy(209,150)]).
midline(r1, [xy(359,216),xy(311,264),xy(316,270),xy(360,270),xy(383,247),xy(383,231),xy(385,231),xy(385,233)]).
midline(r1, [xy(319,272),xy(376,329),xy(376,333),xy(377,333),xy(378,331)]).
midline(r1, [xy(361,271),xy(383,292),xy(382,306),xy(383,306),xy(384,304)]).
midline(r1, [xy(384,292),xy(386,291),xy(387,293),xy(388,292),xy(387,291),xy(387,290),xy(389,290),xy(388,293)]).
midline(r1, [xy(375,256),xy(412,255),xy(414,259),xy(415,259),xy(416,258),xy(413,255),xy(416,257)]).
midline(r1, [xy(384,294),xy(387,297),xy(415,297),xy(418,300),xy(382,336),xy(379,335),xy(378,336),xy(379,338),xy(369,348),xy(363,349),xy(345,331),xy(344,338),xy(347,342),xy(349,341),xy(348,339),xy(345,336),xy(348,338)]).
midline(r1, [xy(370,348),xy(380,338),xy(381,340),xy(383,339),xy(380,336)]).
midline(r1, [xy(383,338),xy(419,300),xy(424,300),xy(425,302),xy(383,345),xy(375,352),xy(366,350)]).
midline(r1, [xy(385,343),xy(426,302),xy(437,312),xy(405,344),xy(387,344),xy(386,345),xy(384,345)]).
midline(r1, [xy(382,346),xy(376,352),xy(380,357),xy(394,357),xy(438,312),xy(476,311),xy(425,258),xy(442,241),xy(442,238),xy(408,238),xy(402,232),xy(398,232),xy(385,244),xy(396,234)]).
midline(r1, [xy(403,232),xy(404,228),xy(385,208)]).
midline(r1, [xy(430,255),xy(430,256),xy(428,258),xy(430,257)]).
midline(r1, [xy(443,240),xy(456,238),xy(435,217),xy(431,216),xy(431,218),xy(433,217),xy(433,219),xy(437,220)]).
midline(r1, [xy(456,239),xy(479,262),xy(480,262),xy(481,261),xy(480,260),xy(481,260)]).
midline(r1, [xy(327,176),xy(343,160),xy(344,164)]).
midline(r1, [xy(477,311),xy(504,285),xy(481,262)]).
midline(r1, [xy(504,286),xy(509,285),xy(522,271),xy(448,197),xy(412,196),xy(409,198),xy(407,196),xy(406,196),xy(406,225),xy(404,227),xy(406,226)]).
midline(r1, [xy(408,196),xy(401,187),xy(393,193)]).
midline(r1, [xy(408,198),xy(407,198)]).
midline(r1, [xy(412,197),xy(411,199),xy(427,216),xy(428,216),xy(429,215),xy(428,214),xy(429,214)]).
midline(r1, [xy(523,271),xy(531,264),xy(448,180),xy(448,174),xy(443,169),xy(433,168),xy(413,149),xy(408,152),xy(386,134),xy(378,145),xy(376,151),xy(378,151),xy(379,150),xy(378,149),xy(379,149)]).
midline(r1, [xy(465,196),xy(465,165),xy(476,154),xy(475,150),xy(466,141),xy(449,138),xy(412,103)]).
midline(r1, [xy(412,150),xy(408,156),xy(400,156),xy(385,138),xy(382,140)]).
midline(r1, [xy(409,156),xy(411,158),xy(411,172),xy(415,176),xy(412,181),xy(395,167),xy(396,164),xy(391,159),xy(381,161)]).
midline(r1, [xy(385,160),xy(392,169),xy(410,187),xy(407,192),xy(410,190)]).
midline(r1, [xy(399,156),xy(391,158)]).
midline(r1, [xy(381,142),xy(380,143)]).
midline(r1, [xy(461,141),xy(461,159),xy(459,160),xy(458,163),xy(456,161),xy(453,162),xy(447,169),xy(446,148),xy(454,140)]).
midline(r1, [xy(461,160),xy(461,161),xy(459,163)]).
midline(r1, [xy(428,161),xy(429,134),xy(427,133),xy(420,140),xy(427,134)]).
midline(r1, [xy(531,265),xy(568,264),xy(579,252),xy(494,166),xy(480,153),xy(477,153)]).
midline(r1, [xy(400,143),xy(387,130),xy(386,133)]).
midline(r1, [xy(399,141),xy(399,140),xy(398,139),xy(397,139)]).
midline(r1, [xy(411,187),xy(415,179)]).
midline(r1, [xy(397,144),xy(395,144)]).
midline(r1, [xy(404,173),xy(404,172),xy(402,170),xy(400,162),xy(402,163),xy(407,158)]).
midline(r1, [xy(404,171),xy(404,169)]).
midline(r1, [xy(404,162),xy(404,164)]).
midline(r1, [xy(407,208),xy(410,207),xy(411,209),xy(412,207)]).
midline(r1, [xy(457,163),xy(456,163),xy(455,162),xy(455,163),xy(448,170),xy(448,173),xy(454,167),xy(456,167),xy(456,168),xy(455,169),xy(454,169)]).
midline(r1, [xy(413,148),xy(413,147)]).
midline(r1, [xy(412,101),xy(412,98),xy(401,87),xy(402,85),xy(378,62),xy(357,63),xy(351,65),xy(342,74),xy(332,74),xy(324,68),xy(323,55),xy(283,17),xy(252,17),xy(244,19),xy(194,69),xy(244,20)]).
midline(r1, [xy(250,19),xy(263,32),xy(263,35),xy(264,35),xy(265,34),xy(264,33),xy(265,33)]).
midline(r1, [xy(351,66),xy(343,74),xy(364,95),xy(364,99),xy(336,126),xy(337,125),xy(338,127),xy(364,100),xy(366,101),xy(366,108)]).
midline(r1, [xy(355,65),xy(402,111),xy(400,114),xy(394,113),xy(385,123),xy(396,115)]).
midline(r1, [xy(402,113),xy(403,100),xy(367,63)]).
midline(r1, [xy(404,112),xy(409,111),xy(409,105),xy(407,103),xy(404,103)]).
midline(r1, [xy(409,112),xy(415,119),xy(409,125),xy(406,125),xy(401,121),xy(402,123)]).
midline(r1, [xy(411,124),xy(416,119),xy(419,119),xy(430,130),xy(429,133),xy(438,130)]).
midline(r1, [xy(402,84),xy(404,84),xy(404,85),xy(402,86)]).
midline(r1, [xy(404,86),xy(405,85),xy(443,122),xy(440,128),xy(443,126)]).
midline(r1, [xy(580,252),xy(599,252),xy(633,216),xy(522,105),xy(513,105),xy(503,95),xy(502,78),xy(489,64),xy(473,61),xy(453,43),xy(444,43),xy(435,34)]).
midline(r1, [xy(435,32),xy(435,31),xy(420,16),xy(412,16),xy(406,20),xy(396,10),xy(392,10),xy(386,4),xy(378,3),xy(375,1),xy(375,0),xy(377,1)]).
midline(r1, [xy(420,15),xy(428,15),xy(441,3),xy(448,3),xy(448,6),xy(449,6),xy(450,5),xy(449,4),xy(449,3),xy(452,2),xy(450,6)]).
midline(r1, [xy(429,16),xy(432,19),xy(437,19),xy(441,16),xy(442,18),xy(450,18),xy(450,29),xy(443,36),xy(441,30),xy(438,28),xy(436,28),xy(436,29),xy(438,30)]).
midline(r1, [xy(451,18),xy(458,14),xy(452,6)]).
midline(r1, [xy(442,15),xy(441,11),xy(442,11),xy(443,12),xy(442,13),xy(445,11),xy(442,8),xy(437,8)]).
midline(r1, [xy(375,2),xy(323,54),xy(372,6)]).
midline(r1, [xy(633,218),xy(671,217),xy(673,214),xy(527,69),xy(528,67),xy(512,51),xy(510,53),xy(510,68),xy(501,75)]).
midline(r1, [xy(511,53),xy(512,52)]).
midline(r1, [xy(509,70),xy(503,77)]).
midline(r1, [xy(410,18),xy(407,21),xy(407,34),xy(404,41),xy(387,24)]).
midline(r1, [xy(406,40),xy(392,56),xy(384,57),xy(380,60)]).
midline(r1, [xy(403,46),xy(393,56),xy(401,64),xy(416,50),xy(424,48),xy(432,58),xy(431,61),xy(433,59),xy(433,61),xy(432,62),xy(434,61),xy(430,69),xy(423,71),xy(411,71),xy(404,65)]).
midline(r1, [xy(413,72),xy(420,80),xy(432,79),xy(431,81),xy(434,81),xy(450,96),xy(447,100),xy(432,85),xy(428,83),xy(426,85),xy(421,81)]).
midline(r1, [xy(430,83),xy(428,82)]).
midline(r1, [xy(432,67),xy(434,65),xy(439,65),xy(454,79),xy(454,82),xy(452,83),xy(436,68),xy(431,69)]).
midline(r1, [xy(455,78),xy(456,60),xy(437,60),xy(436,61),xy(434,59)]).
midline(r1, [xy(389,57),xy(392,64),xy(393,65),xy(394,62)]).
midline(r1, [xy(425,48),xy(438,46),xy(428,35),xy(407,35)]).
midline(r1, [xy(450,98),xy(452,100),xy(457,99),xy(458,102),xy(472,102),xy(471,106),xy(472,106),xy(473,105),xy(472,104),xy(473,104)]).
midline(r1, [xy(457,63),xy(474,79),xy(504,110),xy(501,111),xy(472,82),xy(456,67)]).
midline(r1, [xy(504,111),xy(513,106)]).
midline(r1, [xy(406,65),xy(423,65),xy(424,63),xy(426,63),xy(426,64),xy(425,65),xy(424,65)]).
midline(r1, [xy(428,70),xy(433,77),xy(435,76),xy(432,73),xy(432,72),xy(436,73),xy(435,77)]).
midline(r1, [xy(439,46),xy(444,44)]).
midline(r1, [xy(437,70),xy(435,70)]).
midline(r1, [xy(448,101),xy(448,111),xy(444,114),xy(394,66)]).
midline(r1, [xy(447,113),xy(444,122)]).
midline(r1, [xy(501,112),xy(498,113),xy(487,102),xy(473,102)]).
midline(r1, [xy(438,27),xy(440,26),xy(438,20)]).
midline(r1, [xy(440,27),xy(441,29)]).
midline(r1, [xy(453,84),xy(453,87),xy(450,89),xy(437,76)]).
midline(r1, [xy(452,89),xy(451,95)]).
midline(r1, [xy(512,50),xy(513,45),xy(518,39),xy(512,33),xy(492,22),xy(488,35),xy(490,33),xy(491,34),xy(489,36),xy(492,35),xy(498,39),xy(476,60),xy(489,48)]).
midline(r1, [xy(492,46),xy(498,40)]).
midline(r1, [xy(490,31),xy(491,31),xy(492,29),xy(493,32)]).
midline(r1, [xy(518,41),xy(532,40),xy(540,31),xy(518,9),xy(512,6),xy(500,6),xy(487,18),xy(474,18),xy(469,13),xy(459,13)]).
midline(r1, [xy(498,8),xy(488,18),xy(493,21),xy(494,20),xy(493,19),xy(493,18),xy(496,17),xy(494,21)]).
midline(r1, [xy(450,30),xy(443,37),xy(443,40)]).
midline(r1, [xy(540,33),xy(565,32),xy(693,160),xy(693,202),xy(680,215),xy(673,216)]).
midline(r1, [xy(692,204),xy(682,214)]).
midline(r1, [xy(344,166),xy(330,180)]).
midline(r1, [xy(280,89),xy(279,57),xy(281,57),xy(281,59)]).
midline(r1, [xy(115,143),xy(195,142),xy(195,144),xy(196,144),xy(197,143),xy(196,142),xy(197,142)]).
midline(r1, [xy(238,213),xy(202,250),xy(238,215)]).
midline(r1, [xy(424,93),xy(424,90),xy(423,89),xy(423,88),xy(428,84),xy(429,85),xy(425,90),xy(430,85)]).
midline(r1, [xy(265,267),xy(264,268)]).
midline(r1, [xy(323,208),xy(266,266),xy(330,202),xy(331,196),xy(334,193),xy(334,194),xy(335,193),xy(336,194),xy(332,198),xy(331,198),xy(332,200)]).
midline(r1, [xy(336,195),xy(333,198)]).
midline(r1, [xy(317,147),xy(316,148),xy(318,147),xy(319,148),xy(318,150),xy(319,149)]).
midline(r1, [xy(468,50),xy(467,51)]).
midline(r1, [xy(309,178),xy(222,266),xy(316,171),xy(318,171),xy(320,169),xy(320,170),xy(330,160)]).
midline(r1, [xy(336,52),xy(383,4)]).
midline(r1, [xy(380,10),xy(391,11),xy(387,15),xy(382,13),xy(383,16),xy(379,17),xy(328,68),xy(379,18)]).
midline(r1, [xy(389,14),xy(391,12)]).
midline(r1, [xy(463,93),xy(469,85),xy(470,85),xy(471,86),xy(467,90)]).
midline(r1, [xy(471,87),xy(469,89)]).
midline(r1, [xy(422,176),xy(418,174),xy(416,176)]).
midline(r1, [xy(495,166),xy(494,163),xy(496,163),xy(496,165)]).
midline(r1, [xy(489,122),xy(480,130),xy(475,131),xy(467,140),xy(475,132)]).
midline(r1, [xy(488,123),xy(481,130)]).
midline(r1, [xy(227,243),xy(226,244)]).
midline(r1, [xy(285,184),xy(228,242),xy(308,161),xy(322,161),xy(325,158)]).
midline(r1, [xy(422,189),xy(421,190)]).
midline(r1, [xy(384,18),xy(383,18)]).
midline(r1, [xy(385,18),xy(385,16)]).
midline(r1, [xy(449,184),xy(449,186),xy(451,185),xy(451,181),xy(453,181),xy(453,183)]).
midline(r1, [xy(451,186),xy(452,185)]).
midline(r1, [xy(319,74),xy(310,83),xy(290,83),xy(283,91),xy(290,84)]).
midline(r1, [xy(312,82),xy(324,69)]).
midline(r1, [xy(367,128),xy(367,130),xy(368,130),xy(369,129),xy(369,128)]).
midline(r1, [xy(398,167),xy(397,167),xy(396,166),xy(397,165),xy(398,166)]).
midline(r1, [xy(428,180),xy(422,188),xy(430,181),xy(429,180),xy(429,179),xy(430,179),xy(431,180),xy(430,182)]).
midline(r1, [xy(458,59),xy(458,60)]).
midline(r1, [xy(458,58),xy(462,54)]).
midline(r1, [xy(402,127),xy(395,128)]).
midline(r1, [xy(403,127),xy(405,126)]).
midline(r1, [xy(467,121),xy(467,124),xy(454,137),xy(467,125)]).
midline(r1, [xy(503,20),xy(502,21)]).
midline(r1, [xy(517,76),xy(516,77)]).
midline(r1, [xy(417,259),xy(416,261),xy(417,261),xy(418,259)]).
midline(r1, [xy(271,33),xy(270,34)]).
midline(r1, [xy(336,162),xy(335,163)]).
midline(r1, [xy(434,175),xy(432,175),xy(432,176),xy(433,177),xy(434,176),xy(434,177)]).
midline(r1, [xy(419,173),xy(423,169),xy(432,169)]).
midline(r1, [xy(495,115),xy(490,121),xy(497,114)]).
midline(r1, [xy(518,75),xy(522,70),xy(524,70),xy(524,71),xy(522,72)]).
midline(r1, [xy(272,32),xy(284,19)]).
midline(r1, [xy(503,35),xy(502,36)]).
midline(r1, [xy(377,6),xy(376,4),xy(378,6),xy(379,5),xy(379,4)]).
midline(r1, [xy(404,122),xy(402,120),xy(404,121)]).
midline(r1, [xy(470,47),xy(468,49),xy(471,47),xy(471,21),xy(473,19)]).
midline(r1, [xy(435,174),xy(439,170)]).
midline(r1, [xy(504,34),xy(506,32)]).
midline(r1, [xy(529,66),xy(530,70)]).
midline(r1, [xy(530,66),xy(531,67),xy(531,68)]).
midline(r1, [xy(469,121),xy(469,123)]).
midline(r1, [xy(506,18),xy(505,18),xy(504,16),xy(506,15),xy(507,16),xy(506,17),xy(507,17)]).
midline(r1, [xy(422,175),xy(424,174),xy(424,176)]).
midline(r1, [xy(512,13),xy(508,12),xy(508,13),xy(510,14)]).
midline(r1, [xy(510,11),xy(514,10)]).
midline(r1, [xy(503,19),xy(504,19)]).
midline(r1, [xy(336,161),xy(337,161)]).
midline(r1, [xy(384,236),xy(385,236),xy(385,238)]).
fillpoint(r1, xy(670,182), 173.8).
fillpoint(r1, xy(124,239), 118.5).
fillpoint(r1, xy(114,220), 109.8).
fillpoint(r1, xy(113,215), 108.9).
fillpoint(r1, xy(112,211), 107.9).
fillpoint(r1, xy(111,206), 107.0).
fillpoint(r1, xy(110,201), 106.0).
fillpoint(r1, xy(109,197), 105.0).
fillpoint(r1, xy(108,192), 104.1).
fillpoint(r1, xy(107,188), 103.1).
fillpoint(r1, xy(106,183), 102.2).
fillpoint(r1, xy(105,178), 101.2).
fillpoint(r1, xy(104,174), 100.3).
fillpoint(r1, xy(103,169), 99.3).
fillpoint(r1, xy(102,165), 98.4).
fillpoint(r1, xy(101,160), 97.4).
fillpoint(r1, xy(101,100), 96.5).
fillpoint(r1, xy(100,102), 96.5).
fillpoint(r1, xy(100,155), 96.5).
fillpoint(r1, xy(99,107), 95.5).
fillpoint(r1, xy(99,151), 95.5).
fillpoint(r1, xy(99,138), 94.7).
fillpoint(r1, xy(98,111), 94.5).
fillpoint(r1, xy(98,135), 94.5).
fillpoint(r1, xy(98,140), 94.5).
fillpoint(r1, xy(98,146), 94.5).
fillpoint(r1, xy(97,116), 93.6).
fillpoint(r1, xy(97,129), 93.6).
fillpoint(r1, xy(96,121), 92.6).
fillpoint(r1, xy(300,264), 74.9).
fillpoint(r1, xy(146,70), 67.8).
fillpoint(r1, xy(151,69), 66.9).
fillpoint(r1, xy(156,68), 65.9).
fillpoint(r1, xy(328,266), 65.2).
fillpoint(r1, xy(326,265), 65.1).
fillpoint(r1, xy(160,67), 64.9).
fillpoint(r1, xy(165,66), 64.0).
fillpoint(r1, xy(169,65), 63.0).
fillpoint(r1, xy(174,64), 62.1).
fillpoint(r1, xy(212,64), 62.1).
fillpoint(r1, xy(179,63), 61.1).
fillpoint(r1, xy(208,63), 61.1).
fillpoint(r1, xy(183,62), 60.2).
fillpoint(r1, xy(203,62), 60.2).
fillpoint(r1, xy(188,61), 59.2).
fillpoint(r1, xy(198,61), 59.2).
fillpoint(r1, xy(193,60), 58.3).
fillpoint(r1, xy(520,304), 57.3).
fillpoint(r1, xy(335,67), 56.3).
fillpoint(r1, xy(515,305), 56.3).
fillpoint(r1, xy(511,306), 55.4).
fillpoint(r1, xy(283,295), 55.2).
fillpoint(r1, xy(281,300), 55.2).
fillpoint(r1, xy(280,302), 55.2).
fillpoint(r1, xy(279,304), 55.1).
fillpoint(r1, xy(338,57), 55.0).
fillpoint(r1, xy(282,297), 55.0).
fillpoint(r1, xy(337,59), 54.8).
fillpoint(r1, xy(336,62), 54.8).
fillpoint(r1, xy(451,306), 54.7).
fillpoint(r1, xy(449,307), 54.4).
fillpoint(r1, xy(454,307), 54.4).
fillpoint(r1, xy(506,307), 54.4).
fillpoint(r1, xy(444,308), 53.5).
fillpoint(r1, xy(459,308), 53.5).
fillpoint(r1, xy(502,308), 53.5).
fillpoint(r1, xy(440,309), 52.5).
fillpoint(r1, xy(463,309), 52.5).
fillpoint(r1, xy(497,309), 52.5).
fillpoint(r1, xy(435,310), 51.6).
fillpoint(r1, xy(468,310), 51.6).
fillpoint(r1, xy(492,310), 51.6).
fillpoint(r1, xy(473,311), 50.6).
fillpoint(r1, xy(488,311), 50.6).
fillpoint(r1, xy(477,312), 49.7).
fillpoint(r1, xy(483,312), 49.7).
fillpoint(r1, xy(491,214), 49.4).
fillpoint(r1, xy(493,215), 49.3).
fillpoint(r1, xy(269,162), 47.6).
fillpoint(r1, xy(276,130), 46.4).
fillpoint(r1, xy(227,90), 44.9).
fillpoint(r1, xy(271,169), 43.9).
fillpoint(r1, xy(274,176), 43.9).
fillpoint(r1, xy(277,183), 43.9).
fillpoint(r1, xy(278,185), 43.9).
fillpoint(r1, xy(281,192), 43.9).
fillpoint(r1, xy(202,318), 43.9).
fillpoint(r1, xy(258,318), 43.9).
fillpoint(r1, xy(272,171), 43.8).
fillpoint(r1, xy(273,174), 43.8).
fillpoint(r1, xy(275,178), 43.8).
fillpoint(r1, xy(280,190), 43.8).
fillpoint(r1, xy(282,194), 43.8).
fillpoint(r1, xy(283,197), 43.8).
fillpoint(r1, xy(274,141), 43.7).
fillpoint(r1, xy(271,148), 43.7).
fillpoint(r1, xy(276,181), 43.7).
fillpoint(r1, xy(279,187), 43.7).
fillpoint(r1, xy(275,139), 43.6).
fillpoint(r1, xy(273,143), 43.6).
fillpoint(r1, xy(272,146), 43.6).
fillpoint(r1, xy(270,150), 43.6).
border(r1).
region(r418, '#6c7372', 7, centroid(387,348)).
perimeter(r418, 16).
polygon(r418, [xy(387,345),xy(387,351),xy(387,345)]).
midline(r418, [xy(387,351),xy(387,345)]).

adjacent(r1, r418).
shared_edge(r1, r418, 16).

encloses(r1, r418).

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
opencv_component(cc1, [r418]).
opencv_component_area(cc1, 7).
opencv_component_centroid(cc1, centroid(387,348)).
opencv_morphology(r1, opening_area(310364), closing_area(313276), gradient_area(6384)).
opencv_shape_metrics(r1, contour_area(309639.0), hull_area(309639.0), solidity(1.0), circularity(0.657867), extent(0.996085), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309639.0).
opencv_contour_hierarchy(r1, c0, next(none), previous(none), child(c1), parent(none)).
opencv_contour(r1, c1, hole, 2.0).
opencv_contour_hierarchy(r1, c1, next(c2), previous(none), child(none), parent(c0)).
opencv_contour(r1, c2, hole, 14.0).
opencv_contour_hierarchy(r1, c2, next(c3), previous(c1), child(none), parent(c0)).
opencv_contour(r1, c3, hole, 4.0).
opencv_contour_hierarchy(r1, c3, next(c4), previous(c2), child(none), parent(c0)).
opencv_contour(r1, c4, hole, 2.0).
opencv_contour_hierarchy(r1, c4, next(c5), previous(c3), child(none), parent(c0)).
opencv_contour(r1, c5, hole, 2.0).
opencv_contour_hierarchy(r1, c5, next(c6), previous(c4), child(none), parent(c0)).
opencv_contour(r1, c6, hole, 5.5).
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
opencv_contour(r1, c14, hole, 4.0).
opencv_contour_hierarchy(r1, c14, next(c15), previous(c13), child(none), parent(c0)).
opencv_contour(r1, c15, hole, 2.0).
opencv_contour_hierarchy(r1, c15, next(c16), previous(c14), child(none), parent(c0)).
opencv_contour(r1, c16, hole, 2.0).
opencv_contour_hierarchy(r1, c16, next(c17), previous(c15), child(none), parent(c0)).
opencv_contour(r1, c17, hole, 2.0).
opencv_contour_hierarchy(r1, c17, next(c18), previous(c16), child(none), parent(c0)).
opencv_contour(r1, c18, hole, 2.0).
opencv_contour_hierarchy(r1, c18, next(c19), previous(c17), child(none), parent(c0)).
opencv_contour(r1, c19, hole, 2.0).
opencv_contour_hierarchy(r1, c19, next(c20), previous(c18), child(none), parent(c0)).
opencv_contour(r1, c20, hole, 2.0).
opencv_contour_hierarchy(r1, c20, next(c21), previous(c19), child(none), parent(c0)).
opencv_contour(r1, c21, hole, 2.0).
opencv_contour_hierarchy(r1, c21, next(c22), previous(c20), child(none), parent(c0)).
opencv_contour(r1, c22, hole, 2.0).
opencv_contour_hierarchy(r1, c22, next(c23), previous(c21), child(none), parent(c0)).
opencv_contour(r1, c23, hole, 2.0).
opencv_contour_hierarchy(r1, c23, next(c24), previous(c22), child(none), parent(c0)).
opencv_contour(r1, c24, hole, 2.0).
opencv_contour_hierarchy(r1, c24, next(c25), previous(c23), child(none), parent(c0)).
opencv_contour(r1, c25, hole, 2.0).
opencv_contour_hierarchy(r1, c25, next(c26), previous(c24), child(none), parent(c0)).
opencv_contour(r1, c26, hole, 4.0).
opencv_contour_hierarchy(r1, c26, next(c27), previous(c25), child(none), parent(c0)).
opencv_contour(r1, c27, hole, 2.0).
opencv_contour_hierarchy(r1, c27, next(c28), previous(c26), child(none), parent(c0)).
opencv_contour(r1, c28, hole, 4.0).
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
opencv_contour(r1, c39, hole, 4.0).
opencv_contour_hierarchy(r1, c39, next(c40), previous(c38), child(none), parent(c0)).
opencv_contour(r1, c40, hole, 2.0).
opencv_contour_hierarchy(r1, c40, next(c41), previous(c39), child(none), parent(c0)).
opencv_contour(r1, c41, hole, 2.0).
opencv_contour_hierarchy(r1, c41, next(c42), previous(c40), child(none), parent(c0)).
opencv_contour(r1, c42, hole, 2.0).
opencv_contour_hierarchy(r1, c42, next(c43), previous(c41), child(none), parent(c0)).
opencv_contour(r1, c43, hole, 4.0).
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
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 2.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 2.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 2.0).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 2.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 2.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 34.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 2.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 7.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 2.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 2.0).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 10.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 7.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 2.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 2.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 2.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 5.5).
opencv_contour_hierarchy(r1, c65, next(c66), previous(c64), child(none), parent(c0)).
opencv_contour(r1, c66, hole, 2.0).
opencv_contour_hierarchy(r1, c66, next(c67), previous(c65), child(none), parent(c0)).
opencv_contour(r1, c67, hole, 2.0).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 2.0).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 2.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 2.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 2.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 11.5).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 2.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 4.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 2.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 2.0).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 4.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 7.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 2.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 2.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 6.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 4.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 2.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 4.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 2.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 2.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 12.5).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 2.0).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 2.0).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 4.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 4.0).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 6.0).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 4.0).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 2.0).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 4.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 4.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 2.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 2.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 2.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 4.0).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 2.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 2.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 20.5).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 4.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 11.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 5.5).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 2.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 4.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 2.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 2.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 2.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 2.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 2.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 4.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 4.0).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 2.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 2.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 4.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 13.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 2.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 2.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 11.5).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 5.5).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 2.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 2.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 2.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 2.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 5.5).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 5.5).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 2.0).
opencv_contour_hierarchy(r1, c131, next(c132), previous(c130), child(none), parent(c0)).
opencv_contour(r1, c132, hole, 2.0).
opencv_contour_hierarchy(r1, c132, next(c133), previous(c131), child(none), parent(c0)).
opencv_contour(r1, c133, hole, 2.0).
opencv_contour_hierarchy(r1, c133, next(c134), previous(c132), child(none), parent(c0)).
opencv_contour(r1, c134, hole, 2.0).
opencv_contour_hierarchy(r1, c134, next(c135), previous(c133), child(none), parent(c0)).
opencv_contour(r1, c135, hole, 2.0).
opencv_contour_hierarchy(r1, c135, next(c136), previous(c134), child(none), parent(c0)).
opencv_contour(r1, c136, hole, 2.0).
opencv_contour_hierarchy(r1, c136, next(c137), previous(c135), child(none), parent(c0)).
opencv_contour(r1, c137, hole, 2.0).
opencv_contour_hierarchy(r1, c137, next(c138), previous(c136), child(none), parent(c0)).
opencv_contour(r1, c138, hole, 2.0).
opencv_contour_hierarchy(r1, c138, next(c139), previous(c137), child(none), parent(c0)).
opencv_contour(r1, c139, hole, 2.0).
opencv_contour_hierarchy(r1, c139, next(c140), previous(c138), child(none), parent(c0)).
opencv_contour(r1, c140, hole, 5.5).
opencv_contour_hierarchy(r1, c140, next(c141), previous(c139), child(none), parent(c0)).
opencv_contour(r1, c141, hole, 7.0).
opencv_contour_hierarchy(r1, c141, next(c142), previous(c140), child(none), parent(c0)).
opencv_contour(r1, c142, hole, 2.0).
opencv_contour_hierarchy(r1, c142, next(c143), previous(c141), child(none), parent(c0)).
opencv_contour(r1, c143, hole, 4.0).
opencv_contour_hierarchy(r1, c143, next(c144), previous(c142), child(none), parent(c0)).
opencv_contour(r1, c144, hole, 2.0).
opencv_contour_hierarchy(r1, c144, next(c145), previous(c143), child(none), parent(c0)).
opencv_contour(r1, c145, hole, 2.0).
opencv_contour_hierarchy(r1, c145, next(c146), previous(c144), child(none), parent(c0)).
opencv_contour(r1, c146, hole, 4.0).
opencv_contour_hierarchy(r1, c146, next(c147), previous(c145), child(none), parent(c0)).
opencv_contour(r1, c147, hole, 4.0).
opencv_contour_hierarchy(r1, c147, next(c148), previous(c146), child(none), parent(c0)).
opencv_contour(r1, c148, hole, 5.5).
opencv_contour_hierarchy(r1, c148, next(c149), previous(c147), child(none), parent(c0)).
opencv_contour(r1, c149, hole, 2.0).
opencv_contour_hierarchy(r1, c149, next(c150), previous(c148), child(none), parent(c0)).
opencv_contour(r1, c150, hole, 7.0).
opencv_contour_hierarchy(r1, c150, next(c151), previous(c149), child(none), parent(c0)).
opencv_contour(r1, c151, hole, 14.0).
opencv_contour_hierarchy(r1, c151, next(c152), previous(c150), child(none), parent(c0)).
opencv_contour(r1, c152, hole, 7.0).
opencv_contour_hierarchy(r1, c152, next(c153), previous(c151), child(none), parent(c0)).
opencv_contour(r1, c153, hole, 8.5).
opencv_contour_hierarchy(r1, c153, next(c154), previous(c152), child(none), parent(c0)).
opencv_contour(r1, c154, hole, 2.0).
opencv_contour_hierarchy(r1, c154, next(c155), previous(c153), child(none), parent(c0)).
opencv_contour(r1, c155, hole, 2.0).
opencv_contour_hierarchy(r1, c155, next(c156), previous(c154), child(none), parent(c0)).
opencv_contour(r1, c156, hole, 2.0).
opencv_contour_hierarchy(r1, c156, next(c157), previous(c155), child(none), parent(c0)).
opencv_contour(r1, c157, hole, 2.0).
opencv_contour_hierarchy(r1, c157, next(c158), previous(c156), child(none), parent(c0)).
opencv_contour(r1, c158, hole, 2.0).
opencv_contour_hierarchy(r1, c158, next(c159), previous(c157), child(none), parent(c0)).
opencv_contour(r1, c159, hole, 2.0).
opencv_contour_hierarchy(r1, c159, next(c160), previous(c158), child(none), parent(c0)).
opencv_contour(r1, c160, hole, 2.0).
opencv_contour_hierarchy(r1, c160, next(c161), previous(c159), child(none), parent(c0)).
opencv_contour(r1, c161, hole, 2.0).
opencv_contour_hierarchy(r1, c161, next(c162), previous(c160), child(none), parent(c0)).
opencv_contour(r1, c162, hole, 2.0).
opencv_contour_hierarchy(r1, c162, next(c163), previous(c161), child(none), parent(c0)).
opencv_contour(r1, c163, hole, 7.0).
opencv_contour_hierarchy(r1, c163, next(c164), previous(c162), child(none), parent(c0)).
opencv_contour(r1, c164, hole, 2.0).
opencv_contour_hierarchy(r1, c164, next(c165), previous(c163), child(none), parent(c0)).
opencv_contour(r1, c165, hole, 2.0).
opencv_contour_hierarchy(r1, c165, next(c166), previous(c164), child(none), parent(c0)).
opencv_contour(r1, c166, hole, 2.0).
opencv_contour_hierarchy(r1, c166, next(c167), previous(c165), child(none), parent(c0)).
opencv_contour(r1, c167, hole, 4.0).
opencv_contour_hierarchy(r1, c167, next(c168), previous(c166), child(none), parent(c0)).
opencv_contour(r1, c168, hole, 2.0).
opencv_contour_hierarchy(r1, c168, next(c169), previous(c167), child(none), parent(c0)).
opencv_contour(r1, c169, hole, 7.0).
opencv_contour_hierarchy(r1, c169, next(c170), previous(c168), child(none), parent(c0)).
opencv_contour(r1, c170, hole, 2.0).
opencv_contour_hierarchy(r1, c170, next(c171), previous(c169), child(none), parent(c0)).
opencv_contour(r1, c171, hole, 2.0).
opencv_contour_hierarchy(r1, c171, next(c172), previous(c170), child(none), parent(c0)).
opencv_contour(r1, c172, hole, 4.0).
opencv_contour_hierarchy(r1, c172, next(c173), previous(c171), child(none), parent(c0)).
opencv_contour(r1, c173, hole, 2.0).
opencv_contour_hierarchy(r1, c173, next(c174), previous(c172), child(none), parent(c0)).
opencv_contour(r1, c174, hole, 11.5).
opencv_contour_hierarchy(r1, c174, next(c175), previous(c173), child(none), parent(c0)).
opencv_contour(r1, c175, hole, 4.0).
opencv_contour_hierarchy(r1, c175, next(c176), previous(c174), child(none), parent(c0)).
opencv_contour(r1, c176, hole, 4.0).
opencv_contour_hierarchy(r1, c176, next(c177), previous(c175), child(none), parent(c0)).
opencv_contour(r1, c177, hole, 2.0).
opencv_contour_hierarchy(r1, c177, next(c178), previous(c176), child(none), parent(c0)).
opencv_contour(r1, c178, hole, 4.0).
opencv_contour_hierarchy(r1, c178, next(c179), previous(c177), child(none), parent(c0)).
opencv_contour(r1, c179, hole, 4.0).
opencv_contour_hierarchy(r1, c179, next(c180), previous(c178), child(none), parent(c0)).
opencv_contour(r1, c180, hole, 2.0).
opencv_contour_hierarchy(r1, c180, next(c181), previous(c179), child(none), parent(c0)).
opencv_contour(r1, c181, hole, 2.0).
opencv_contour_hierarchy(r1, c181, next(c182), previous(c180), child(none), parent(c0)).
opencv_contour(r1, c182, hole, 2.0).
opencv_contour_hierarchy(r1, c182, next(c183), previous(c181), child(none), parent(c0)).
opencv_contour(r1, c183, hole, 2.0).
opencv_contour_hierarchy(r1, c183, next(c184), previous(c182), child(none), parent(c0)).
opencv_contour(r1, c184, hole, 4.0).
opencv_contour_hierarchy(r1, c184, next(c185), previous(c183), child(none), parent(c0)).
opencv_contour(r1, c185, hole, 5.5).
opencv_contour_hierarchy(r1, c185, next(c186), previous(c184), child(none), parent(c0)).
opencv_contour(r1, c186, hole, 2.0).
opencv_contour_hierarchy(r1, c186, next(c187), previous(c185), child(none), parent(c0)).
opencv_contour(r1, c187, hole, 2.0).
opencv_contour_hierarchy(r1, c187, next(c188), previous(c186), child(none), parent(c0)).
opencv_contour(r1, c188, hole, 6.0).
opencv_contour_hierarchy(r1, c188, next(c189), previous(c187), child(none), parent(c0)).
opencv_contour(r1, c189, hole, 9.0).
opencv_contour_hierarchy(r1, c189, next(c190), previous(c188), child(none), parent(c0)).
opencv_contour(r1, c190, hole, 2.0).
opencv_contour_hierarchy(r1, c190, next(c191), previous(c189), child(none), parent(c0)).
opencv_contour(r1, c191, hole, 2.0).
opencv_contour_hierarchy(r1, c191, next(c192), previous(c190), child(none), parent(c0)).
opencv_contour(r1, c192, hole, 2.0).
opencv_contour_hierarchy(r1, c192, next(c193), previous(c191), child(none), parent(c0)).
opencv_contour(r1, c193, hole, 17.0).
opencv_contour_hierarchy(r1, c193, next(c194), previous(c192), child(none), parent(c0)).
opencv_contour(r1, c194, hole, 17.0).
opencv_contour_hierarchy(r1, c194, next(c195), previous(c193), child(none), parent(c0)).
opencv_contour(r1, c195, hole, 4.0).
opencv_contour_hierarchy(r1, c195, next(c196), previous(c194), child(none), parent(c0)).
opencv_contour(r1, c196, hole, 2.0).
opencv_contour_hierarchy(r1, c196, next(c197), previous(c195), child(none), parent(c0)).
opencv_contour(r1, c197, hole, 25.5).
opencv_contour_hierarchy(r1, c197, next(c198), previous(c196), child(none), parent(c0)).
opencv_contour(r1, c198, hole, 4.0).
opencv_contour_hierarchy(r1, c198, next(c199), previous(c197), child(none), parent(c0)).
opencv_contour(r1, c199, hole, 2.0).
opencv_contour_hierarchy(r1, c199, next(c200), previous(c198), child(none), parent(c0)).
opencv_contour(r1, c200, hole, 4.0).
opencv_contour_hierarchy(r1, c200, next(c201), previous(c199), child(none), parent(c0)).
opencv_contour(r1, c201, hole, 2.0).
opencv_contour_hierarchy(r1, c201, next(c202), previous(c200), child(none), parent(c0)).
opencv_contour(r1, c202, hole, 2.0).
opencv_contour_hierarchy(r1, c202, next(c203), previous(c201), child(none), parent(c0)).
opencv_contour(r1, c203, hole, 8.5).
opencv_contour_hierarchy(r1, c203, next(c204), previous(c202), child(none), parent(c0)).
opencv_contour(r1, c204, hole, 4.0).
opencv_contour_hierarchy(r1, c204, next(c205), previous(c203), child(none), parent(c0)).
opencv_contour(r1, c205, hole, 4.0).
opencv_contour_hierarchy(r1, c205, next(c206), previous(c204), child(none), parent(c0)).
opencv_contour(r1, c206, hole, 2.0).
opencv_contour_hierarchy(r1, c206, next(c207), previous(c205), child(none), parent(c0)).
opencv_contour(r1, c207, hole, 2.0).
opencv_contour_hierarchy(r1, c207, next(c208), previous(c206), child(none), parent(c0)).
opencv_contour(r1, c208, hole, 2.0).
opencv_contour_hierarchy(r1, c208, next(c209), previous(c207), child(none), parent(c0)).
opencv_contour(r1, c209, hole, 4.0).
opencv_contour_hierarchy(r1, c209, next(c210), previous(c208), child(none), parent(c0)).
opencv_contour(r1, c210, hole, 2.0).
opencv_contour_hierarchy(r1, c210, next(c211), previous(c209), child(none), parent(c0)).
opencv_contour(r1, c211, hole, 2.0).
opencv_contour_hierarchy(r1, c211, next(c212), previous(c210), child(none), parent(c0)).
opencv_contour(r1, c212, hole, 18.5).
opencv_contour_hierarchy(r1, c212, next(c213), previous(c211), child(none), parent(c0)).
opencv_contour(r1, c213, hole, 4.0).
opencv_contour_hierarchy(r1, c213, next(c214), previous(c212), child(none), parent(c0)).
opencv_contour(r1, c214, hole, 2.0).
opencv_contour_hierarchy(r1, c214, next(c215), previous(c213), child(none), parent(c0)).
opencv_contour(r1, c215, hole, 2.0).
opencv_contour_hierarchy(r1, c215, next(c216), previous(c214), child(none), parent(c0)).
opencv_contour(r1, c216, hole, 4.0).
opencv_contour_hierarchy(r1, c216, next(c217), previous(c215), child(none), parent(c0)).
opencv_contour(r1, c217, hole, 2.0).
opencv_contour_hierarchy(r1, c217, next(c218), previous(c216), child(none), parent(c0)).
opencv_contour(r1, c218, hole, 2.0).
opencv_contour_hierarchy(r1, c218, next(c219), previous(c217), child(none), parent(c0)).
opencv_contour(r1, c219, hole, 2.0).
opencv_contour_hierarchy(r1, c219, next(c220), previous(c218), child(none), parent(c0)).
opencv_contour(r1, c220, hole, 2.0).
opencv_contour_hierarchy(r1, c220, next(c221), previous(c219), child(none), parent(c0)).
opencv_contour(r1, c221, hole, 2.0).
opencv_contour_hierarchy(r1, c221, next(c222), previous(c220), child(none), parent(c0)).
opencv_contour(r1, c222, hole, 5.5).
opencv_contour_hierarchy(r1, c222, next(c223), previous(c221), child(none), parent(c0)).
opencv_contour(r1, c223, hole, 2.0).
opencv_contour_hierarchy(r1, c223, next(c224), previous(c222), child(none), parent(c0)).
opencv_contour(r1, c224, hole, 2.0).
opencv_contour_hierarchy(r1, c224, next(c225), previous(c223), child(none), parent(c0)).
opencv_contour(r1, c225, hole, 2.0).
opencv_contour_hierarchy(r1, c225, next(c226), previous(c224), child(none), parent(c0)).
opencv_contour(r1, c226, hole, 2.0).
opencv_contour_hierarchy(r1, c226, next(c227), previous(c225), child(none), parent(c0)).
opencv_contour(r1, c227, hole, 4.0).
opencv_contour_hierarchy(r1, c227, next(c228), previous(c226), child(none), parent(c0)).
opencv_contour(r1, c228, hole, 4.0).
opencv_contour_hierarchy(r1, c228, next(c229), previous(c227), child(none), parent(c0)).
opencv_contour(r1, c229, hole, 4.0).
opencv_contour_hierarchy(r1, c229, next(c230), previous(c228), child(none), parent(c0)).
opencv_contour(r1, c230, hole, 7.5).
opencv_contour_hierarchy(r1, c230, next(c231), previous(c229), child(none), parent(c0)).
opencv_contour(r1, c231, hole, 4.0).
opencv_contour_hierarchy(r1, c231, next(c232), previous(c230), child(none), parent(c0)).
opencv_contour(r1, c232, hole, 2.0).
opencv_contour_hierarchy(r1, c232, next(c233), previous(c231), child(none), parent(c0)).
opencv_contour(r1, c233, hole, 2.0).
opencv_contour_hierarchy(r1, c233, next(c234), previous(c232), child(none), parent(c0)).
opencv_contour(r1, c234, hole, 2.0).
opencv_contour_hierarchy(r1, c234, next(c235), previous(c233), child(none), parent(c0)).
opencv_contour(r1, c235, hole, 2.0).
opencv_contour_hierarchy(r1, c235, next(c236), previous(c234), child(none), parent(c0)).
opencv_contour(r1, c236, hole, 2.0).
opencv_contour_hierarchy(r1, c236, next(c237), previous(c235), child(none), parent(c0)).
opencv_contour(r1, c237, hole, 2.0).
opencv_contour_hierarchy(r1, c237, next(none), previous(c236), child(none), parent(c0)).
opencv_morphology(r418, opening_area(0), closing_area(17), gradient_area(23)).
opencv_shape_metrics(r418, contour_area(0.0), hull_area(0.0), solidity(0.0), circularity(0.0), extent(0.0), aspect_ratio(0.142857)).
opencv_contour(r418, c0, outer, 0.0).
opencv_contour_hierarchy(r418, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r418, 1).
opencv_watershed_segment(r418, ws1, 7, centroid(387,348)).
