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

region(r1, '#b2bbbd', 310542, centroid(427,181)).
perimeter(r1, 3280).
polygon(r1, [xy(0,0),xy(0,363),xy(245,363),xy(249,353),xy(251,354),xy(251,363),xy(853,363),xy(853,0),xy(0,0)]).
hole(r1, [xy(545,348),xy(547,348),xy(545,348)]).
hole(r1, [xy(556,332),xy(558,332),xy(556,332)]).
hole(r1, [xy(504,329),xy(506,329),xy(504,329)]).
hole(r1, [xy(509,324),xy(511,324),xy(509,324)]).
hole(r1, [xy(571,315),xy(573,315),xy(571,315)]).
hole(r1, [xy(423,315),xy(425,315),xy(423,315)]).
hole(r1, [xy(447,311),xy(449,311),xy(447,311)]).
hole(r1, [xy(292,311),xy(294,311),xy(292,311)]).
hole(r1, [xy(293,310),xy(295,310),xy(293,310)]).
hole(r1, [xy(561,309),xy(563,309),xy(561,309)]).
hole(r1, [xy(559,308),xy(561,308),xy(559,308)]).
hole(r1, [xy(484,308),xy(486,308),xy(484,308)]).
hole(r1, [xy(294,308),xy(296,308),xy(294,308)]).
hole(r1, [xy(486,307),xy(488,307),xy(486,307)]).
hole(r1, [xy(555,306),xy(557,306),xy(555,306)]).
hole(r1, [xy(487,306),xy(489,306),xy(487,306)]).
hole(r1, [xy(460,306),xy(462,306),xy(460,306)]).
hole(r1, [xy(488,305),xy(490,305),xy(488,305)]).
hole(r1, [xy(400,305),xy(402,305),xy(400,305)]).
hole(r1, [xy(490,304),xy(492,304),xy(490,304)]).
hole(r1, [xy(401,304),xy(403,304),xy(401,304)]).
hole(r1, [xy(402,303),xy(404,303),xy(402,303)]).
hole(r1, [xy(412,302),xy(414,302),xy(412,302)]).
hole(r1, [xy(404,302),xy(406,302),xy(404,302)]).
hole(r1, [xy(492,301),xy(494,301),xy(492,301)]).
hole(r1, [xy(411,301),xy(413,301),xy(411,301)]).
hole(r1, [xy(313,301),xy(315,301),xy(313,301)]).
hole(r1, [xy(392,300),xy(394,300),xy(392,300)]).
hole(r1, [xy(317,300),xy(319,300),xy(317,300)]).
hole(r1, [xy(539,299),xy(541,299),xy(539,299)]).
hole(r1, [xy(390,299),xy(392,299),xy(390,299)]).
hole(r1, [xy(540,298),xy(542,298),xy(540,298)]).
hole(r1, [xy(325,298),xy(327,298),xy(325,298)]).
hole(r1, [xy(320,298),xy(322,298),xy(320,298)]).
hole(r1, [xy(389,297),xy(391,297),xy(389,297)]).
hole(r1, [xy(322,297),xy(326,297),xy(322,297)]).
hole(r1, [xy(388,296),xy(390,296),xy(388,296)]).
hole(r1, [xy(338,294),xy(340,294),xy(338,294)]).
hole(r1, [xy(339,293),xy(341,293),xy(339,293)]).
hole(r1, [xy(350,292),xy(352,292),xy(350,292)]).
hole(r1, [xy(340,292),xy(342,292),xy(340,292)]).
hole(r1, [xy(349,291),xy(351,291),xy(349,291)]).
hole(r1, [xy(298,291),xy(300,291),xy(298,291)]).
hole(r1, [xy(348,290),xy(350,290),xy(348,290)]).
hole(r1, [xy(297,272),xy(299,271),xy(300,273),xy(298,274),xy(297,272)]).
hole(r1, [xy(297,268),xy(300,268),xy(297,268)]).
hole(r1, [xy(299,266),xy(301,267),xy(299,266)]).
hole(r1, [xy(300,265),xy(305,265),xy(300,265)]).
hole(r1, [xy(297,259),xy(297,268),xy(297,259)]).
hole(r1, [xy(295,258),xy(297,259),xy(295,258)]).
hole(r1, [xy(293,257),xy(296,257),xy(293,257)]).
hole(r1, [xy(292,256),xy(293,254),xy(296,255),xy(292,256)]).
hole(r1, [xy(200,254),xy(203,254),xy(200,254)]).
hole(r1, [xy(295,253),xy(297,254),xy(295,253)]).
hole(r1, [xy(296,251),xy(298,252),xy(296,251)]).
hole(r1, [xy(298,247),xy(298,251),xy(298,247)]).
hole(r1, [xy(295,247),xy(297,247),xy(295,247)]).
hole(r1, [xy(308,242),xy(310,242),xy(308,242)]).
hole(r1, [xy(322,239),xy(324,239),xy(322,239)]).
hole(r1, [xy(323,238),xy(326,238),xy(323,238)]).
hole(r1, [xy(328,235),xy(326,238),xy(328,235)]).
hole(r1, [xy(328,235),xy(330,235),xy(328,235)]).
hole(r1, [xy(329,234),xy(331,234),xy(329,234)]).
hole(r1, [xy(332,230),xy(331,234),xy(332,230)]).
hole(r1, [xy(332,230),xy(334,230),xy(332,230)]).
hole(r1, [xy(169,213),xy(172,213),xy(169,213)]).
hole(r1, [xy(168,212),xy(170,212),xy(168,212)]).
hole(r1, [xy(167,211),xy(169,211),xy(167,211)]).
hole(r1, [xy(166,209),xy(168,210),xy(166,209)]).
hole(r1, [xy(165,207),xy(167,207),xy(165,207)]).
hole(r1, [xy(164,191),xy(166,191),xy(164,191)]).
hole(r1, [xy(325,189),xy(327,189),xy(325,189)]).
hole(r1, [xy(165,189),xy(167,189),xy(165,189)]).
hole(r1, [xy(324,187),xy(326,188),xy(324,187)]).
hole(r1, [xy(166,187),xy(168,187),xy(166,187)]).
hole(r1, [xy(167,186),xy(169,186),xy(167,186)]).
hole(r1, [xy(323,185),xy(325,186),xy(323,185)]).
hole(r1, [xy(168,185),xy(170,185),xy(168,185)]).
hole(r1, [xy(322,183),xy(324,183),xy(322,183)]).
hole(r1, [xy(169,183),xy(171,183),xy(169,183)]).
hole(r1, [xy(170,182),xy(172,182),xy(170,182)]).
hole(r1, [xy(321,181),xy(323,182),xy(321,181)]).
hole(r1, [xy(171,181),xy(173,181),xy(171,181)]).
hole(r1, [xy(320,180),xy(322,180),xy(320,180)]).
hole(r1, [xy(172,180),xy(174,180),xy(172,180)]).
hole(r1, [xy(227,179),xy(229,180),xy(227,179)]).
hole(r1, [xy(319,178),xy(321,179),xy(319,178)]).
hole(r1, [xy(229,178),xy(231,178),xy(229,178)]).
hole(r1, [xy(318,177),xy(320,177),xy(318,177)]).
hole(r1, [xy(175,176),xy(174,180),xy(175,176)]).
hole(r1, [xy(222,175),xy(222,183),xy(222,175)]).
hole(r1, [xy(175,176),xy(177,176),xy(175,176)]).
hole(r1, [xy(230,175),xy(232,176),xy(230,175)]).
hole(r1, [xy(178,173),xy(179,175),xy(177,176),xy(178,173)]).
hole(r1, [xy(314,173),xy(316,172),xy(319,176),xy(314,173)]).
hole(r1, [xy(178,173),xy(180,173),xy(178,173)]).
hole(r1, [xy(313,172),xy(315,172),xy(313,172)]).
hole(r1, [xy(179,172),xy(181,172),xy(179,172)]).
hole(r1, [xy(180,171),xy(182,171),xy(180,171)]).
hole(r1, [xy(310,170),xy(314,171),xy(310,170)]).
hole(r1, [xy(230,170),xy(232,170),xy(230,170)]).
hole(r1, [xy(224,169),xy(225,173),xy(223,175),xy(224,169)]).
hole(r1, [xy(181,170),xy(183,170),xy(181,170)]).
hole(r1, [xy(308,169),xy(310,169),xy(308,169)]).
hole(r1, [xy(232,169),xy(234,169),xy(232,169)]).
hole(r1, [xy(182,169),xy(184,169),xy(182,169)]).
hole(r1, [xy(224,168),xy(228,168),xy(224,168)]).
hole(r1, [xy(223,167),xy(225,167),xy(223,167)]).
hole(r1, [xy(190,164),xy(191,167),xy(189,169),xy(190,164)]).
hole(r1, [xy(228,163),xy(228,168),xy(228,163)]).
hole(r1, [xy(190,163),xy(192,164),xy(190,163)]).
hole(r1, [xy(243,161),xy(245,162),xy(244,173),xy(239,167),xy(243,161)]).
hole(r1, [xy(191,162),xy(193,162),xy(191,162)]).
hole(r1, [xy(192,159),xy(194,160),xy(192,159)]).
hole(r1, [xy(193,158),xy(195,158),xy(193,158)]).
hole(r1, [xy(194,156),xy(196,157),xy(194,156)]).
hole(r1, [xy(195,154),xy(197,154),xy(195,154)]).
hole(r1, [xy(196,152),xy(198,152),xy(196,152)]).
hole(r1, [xy(225,150),xy(227,150),xy(225,150)]).
hole(r1, [xy(197,150),xy(199,150),xy(197,150)]).
hole(r1, [xy(224,149),xy(226,149),xy(224,149)]).
hole(r1, [xy(223,148),xy(225,148),xy(223,148)]).
hole(r1, [xy(198,148),xy(200,149),xy(198,148)]).
hole(r1, [xy(221,147),xy(224,147),xy(221,147)]).
hole(r1, [xy(199,146),xy(201,146),xy(199,146)]).
hole(r1, [xy(200,145),xy(202,145),xy(200,145)]).
hole(r1, [xy(247,139),xy(249,139),xy(247,139)]).
hole(r1, [xy(248,137),xy(250,138),xy(248,137)]).
hole(r1, [xy(249,136),xy(251,136),xy(249,136)]).
hole(r1, [xy(252,132),xy(251,136),xy(252,132)]).
hole(r1, [xy(305,131),xy(307,131),xy(305,131)]).
hole(r1, [xy(304,130),xy(306,130),xy(304,130)]).
hole(r1, [xy(254,129),xy(253,133),xy(254,129)]).
hole(r1, [xy(303,129),xy(305,129),xy(303,129)]).
hole(r1, [xy(300,127),xy(302,127),xy(300,127)]).
hole(r1, [xy(256,126),xy(255,130),xy(256,126)]).
hole(r1, [xy(299,126),xy(301,126),xy(299,126)]).
hole(r1, [xy(256,126),xy(258,126),xy(256,126)]).
hole(r1, [xy(298,125),xy(300,125),xy(298,125)]).
hole(r1, [xy(257,125),xy(260,125),xy(257,125)]).
hole(r1, [xy(297,124),xy(299,124),xy(297,124)]).
hole(r1, [xy(259,124),xy(261,124),xy(259,124)]).
hole(r1, [xy(296,123),xy(298,123),xy(296,123)]).
hole(r1, [xy(260,123),xy(263,123),xy(260,123)]).
hole(r1, [xy(263,122),xy(265,122),xy(263,122)]).
hole(r1, [xy(292,121),xy(294,121),xy(292,121)]).
hole(r1, [xy(264,121),xy(266,121),xy(264,121)]).
hole(r1, [xy(290,120),xy(292,120),xy(290,120)]).
hole(r1, [xy(289,119),xy(291,119),xy(289,119)]).
hole(r1, [xy(288,118),xy(290,118),xy(288,118)]).
hole(r1, [xy(224,35),xy(226,36),xy(224,35)]).
hole(r1, [xy(213,34),xy(215,34),xy(213,34)]).
midline(r1, [xy(671,181),xy(514,181),xy(450,117),xy(440,115),xy(417,92),xy(397,84),xy(345,84),xy(322,61),xy(287,61),xy(243,17),xy(207,17),xy(150,73),xy(125,74),xy(120,78),xy(104,83),xy(100,87),xy(89,87),xy(86,91),xy(86,124),xy(83,127),xy(83,280),xy(90,287),xy(94,287),xy(167,214),xy(167,211),xy(168,210),xy(169,210),xy(169,211),xy(168,212),xy(169,213),xy(170,212),xy(170,209),xy(183,195),xy(166,194),xy(164,192),xy(155,193),xy(87,125),xy(84,127)]).
midline(r1, [xy(116,80),xy(195,158),xy(207,171),xy(206,174),xy(196,164),xy(187,161),xy(109,83),xy(111,81)]).
midline(r1, [xy(123,76),xy(121,79),xy(193,151),xy(196,151),xy(195,155),xy(196,155),xy(198,152),xy(197,149),xy(198,149),xy(199,150),xy(198,151),xy(199,151)]).
midline(r1, [xy(165,194),xy(164,190),xy(169,182),xy(173,179),xy(174,180),xy(170,184),xy(169,184),xy(170,185),xy(167,188),xy(166,188),xy(167,189),xy(165,190),xy(166,192)]).
midline(r1, [xy(183,197),xy(188,196),xy(206,218),xy(191,233),xy(180,234),xy(126,288),xy(95,288)]).
midline(r1, [xy(191,34),xy(213,33),xy(213,35),xy(214,35),xy(215,34),xy(214,33),xy(215,33)]).
midline(r1, [xy(187,162),xy(189,164),xy(191,165),xy(193,164),xy(193,165)]).
midline(r1, [xy(192,233),xy(207,218),xy(238,218),xy(247,227),xy(247,299),xy(242,304),xy(198,304),xy(190,309),xy(147,309),xy(127,289),xy(180,235)]).
midline(r1, [xy(541,182),xy(541,296),xy(539,298),xy(539,300),xy(540,300),xy(541,299),xy(540,298),xy(541,297),xy(542,297),xy(541,300)]).
midline(r1, [xy(170,186),xy(168,188)]).
midline(r1, [xy(558,182),xy(558,304),xy(555,305),xy(555,307),xy(556,307),xy(557,306),xy(556,333),xy(557,333),xy(558,331)]).
midline(r1, [xy(89,89),xy(177,176),xy(198,198),xy(198,203)]).
midline(r1, [xy(198,153),xy(209,161),xy(208,171)]).
midline(r1, [xy(174,181),xy(171,184)]).
midline(r1, [xy(199,198),xy(200,190),xy(182,172),xy(179,171),xy(178,172),xy(179,174),xy(181,173)]).
midline(r1, [xy(210,161),xy(211,139),xy(148,74)]).
midline(r1, [xy(212,159),xy(216,159),xy(218,156),xy(227,156),xy(229,153),xy(226,151),xy(223,148),xy(225,151)]).
midline(r1, [xy(229,155),xy(232,153),xy(235,157),xy(234,167),xy(231,169),xy(229,169),xy(226,166),xy(223,166),xy(217,160)]).
midline(r1, [xy(202,131),xy(202,143),xy(200,145)]).
midline(r1, [xy(202,144),xy(201,147)]).
midline(r1, [xy(191,161),xy(193,161),xy(193,162)]).
midline(r1, [xy(247,300),xy(243,304),xy(249,305),xy(284,270),xy(294,259),xy(293,257),xy(296,255),xy(294,253),xy(296,249),xy(264,217),xy(259,217),xy(225,183),xy(223,175),xy(207,174),xy(206,183),xy(200,189),xy(205,185)]).
midline(r1, [xy(265,216),xy(265,212),xy(230,177),xy(226,177)]).
midline(r1, [xy(250,306),xy(257,313),xy(284,312),xy(287,317),xy(288,326),xy(313,302)]).
midline(r1, [xy(296,250),xy(299,251),xy(299,252),xy(298,253),xy(295,252)]).
midline(r1, [xy(299,253),xy(302,255),xy(294,258)]).
midline(r1, [xy(266,212),xy(269,210),xy(237,178),xy(236,171),xy(232,169),xy(231,171),xy(228,172),xy(224,169)]).
midline(r1, [xy(269,211),xy(278,209),xy(278,169),xy(257,148),xy(252,147),xy(252,139),xy(248,135),xy(236,135),xy(236,148),xy(233,152),xy(237,148),xy(241,148),xy(246,143),xy(247,138),xy(248,138),xy(249,139),xy(248,140),xy(249,140)]).
midline(r1, [xy(249,135),xy(250,135),xy(251,136),xy(251,137)]).
midline(r1, [xy(155,194),xy(165,204),xy(165,208),xy(166,208),xy(167,207),xy(166,206),xy(167,206)]).
midline(r1, [xy(259,218),xy(255,219),xy(248,227),xy(255,220)]).
midline(r1, [xy(205,19),xy(192,32)]).
midline(r1, [xy(546,182),xy(545,349),xy(546,349),xy(547,348),xy(546,347),xy(547,347)]).
midline(r1, [xy(104,84),xy(101,87),xy(181,167),xy(180,170),xy(184,168),xy(183,172)]).
midline(r1, [xy(295,246),xy(297,246),xy(297,248)]).
midline(r1, [xy(315,302),xy(317,299),xy(319,299),xy(319,300),xy(318,301),xy(317,301)]).
midline(r1, [xy(294,260),xy(296,260),xy(297,259),xy(301,259),xy(297,269),xy(285,270)]).
midline(r1, [xy(297,270),xy(301,269),xy(299,267)]).
midline(r1, [xy(301,270),xy(302,267),xy(300,265),xy(299,265)]).
midline(r1, [xy(242,149),xy(252,149)]).
midline(r1, [xy(189,35),xy(151,73),xy(169,91),xy(196,90),xy(237,133)]).
midline(r1, [xy(572,182),xy(571,316),xy(572,316),xy(573,315),xy(572,314),xy(573,314)]).
midline(r1, [xy(227,173),xy(227,175)]).
midline(r1, [xy(231,179),xy(229,179)]).
midline(r1, [xy(303,269),xy(314,281),xy(300,296),xy(298,292),xy(298,290),xy(300,290),xy(300,292)]).
midline(r1, [xy(313,283),xy(321,280),xy(333,266),xy(310,243)]).
midline(r1, [xy(333,268),xy(355,267),xy(379,291),xy(353,292),xy(350,289),xy(348,289),xy(347,292),xy(340,291),xy(338,293),xy(339,295),xy(340,294),xy(339,293),xy(340,292),xy(341,293),xy(340,295)]).
midline(r1, [xy(379,292),xy(388,300),xy(360,328),xy(356,328),xy(325,299)]).
midline(r1, [xy(342,293),xy(342,292)]).
midline(r1, [xy(388,301),xy(361,328)]).
midline(r1, [xy(299,296),xy(285,312)]).
midline(r1, [xy(287,311),xy(292,310),xy(293,312),xy(294,311),xy(293,310),xy(294,307),xy(296,307),xy(294,312)]).
midline(r1, [xy(288,309),xy(299,298)]).
midline(r1, [xy(301,296),xy(311,286)]).
midline(r1, [xy(289,327),xy(292,330),xy(356,329)]).
midline(r1, [xy(289,215),xy(278,211)]).
midline(r1, [xy(290,215),xy(292,214),xy(294,218),xy(297,217),xy(312,234),xy(312,241)]).
midline(r1, [xy(313,235),xy(323,235),xy(326,238),xy(325,240),xy(323,238),xy(322,238),xy(322,241),xy(315,248),xy(322,242)]).
midline(r1, [xy(323,240),xy(324,240)]).
midline(r1, [xy(287,142),xy(287,148),xy(283,149),xy(260,128),xy(214,82),xy(201,85),xy(197,90),xy(201,86)]).
midline(r1, [xy(262,127),xy(217,81),xy(214,81)]).
midline(r1, [xy(284,150),xy(284,156),xy(282,157),xy(208,83)]).
midline(r1, [xy(260,123),xy(261,124),xy(261,125)]).
midline(r1, [xy(258,127),xy(257,127),xy(256,125)]).
midline(r1, [xy(217,80),xy(269,79),xy(286,61)]).
midline(r1, [xy(287,149),xy(308,170),xy(309,170),xy(310,168)]).
midline(r1, [xy(204,85),xy(282,161),xy(278,168),xy(281,166)]).
midline(r1, [xy(283,158),xy(283,160)]).
midline(r1, [xy(421,142),xy(420,143)]).
midline(r1, [xy(506,329),xy(504,328),xy(504,330),xy(506,330)]).
midline(r1, [xy(506,328),xy(504,192),xy(404,292),xy(393,299),xy(389,295),xy(388,295),xy(389,299),xy(391,300),xy(392,299),xy(391,298)]).
midline(r1, [xy(424,273),xy(423,316),xy(424,316),xy(425,315),xy(424,314),xy(425,314)]).
midline(r1, [xy(461,236),xy(460,307),xy(461,307),xy(462,305)]).
midline(r1, [xy(413,283),xy(422,274)]).
midline(r1, [xy(494,202),xy(503,193)]).
midline(r1, [xy(425,271),xy(446,250)]).
midline(r1, [xy(491,205),xy(462,234)]).
midline(r1, [xy(398,298),xy(403,293)]).
midline(r1, [xy(449,247),xy(459,237)]).
midline(r1, [xy(410,286),xy(406,290)]).
midline(r1, [xy(405,292),xy(405,300),xy(400,304),xy(401,306),xy(402,305),xy(401,304),xy(402,303),xy(403,304),xy(402,306)]).
midline(r1, [xy(493,204),xy(493,299),xy(491,303),xy(484,307),xy(485,309),xy(488,305),xy(489,306),xy(486,309)]).
midline(r1, [xy(488,308),xy(490,304),xy(491,305),xy(494,301),xy(493,300),xy(494,300)]).
midline(r1, [xy(505,192),xy(514,182)]).
midline(r1, [xy(510,187),xy(509,325),xy(510,325),xy(511,324),xy(510,323),xy(511,323)]).
midline(r1, [xy(412,285),xy(411,302),xy(413,303),xy(414,302),xy(412,300),xy(414,301)]).
midline(r1, [xy(394,299),xy(394,300),xy(393,301),xy(392,300),xy(392,301)]).
midline(r1, [xy(391,296),xy(307,212),xy(302,212),xy(298,217),xy(302,213)]).
midline(r1, [xy(448,249),xy(447,312),xy(448,312),xy(449,311),xy(448,310),xy(449,310)]).
midline(r1, [xy(398,158),xy(349,206),xy(346,206),xy(329,189),xy(326,188),xy(325,189),xy(325,190),xy(327,190)]).
midline(r1, [xy(397,159),xy(350,206)]).
midline(r1, [xy(336,160),xy(407,89)]).
midline(r1, [xy(402,105),xy(323,182),xy(293,213),xy(320,187),xy(324,187),xy(325,186),xy(327,187)]).
midline(r1, [xy(326,182),xy(415,93)]).
midline(r1, [xy(321,185),xy(324,184)]).
midline(r1, [xy(404,151),xy(440,116)]).
midline(r1, [xy(288,119),xy(288,117),xy(290,117),xy(288,121),xy(264,120),xy(263,123),xy(264,123),xy(265,122),xy(264,121)]).
midline(r1, [xy(265,123),xy(266,121)]).
midline(r1, [xy(329,157),xy(328,158)]).
midline(r1, [xy(387,98),xy(330,156),xy(399,87)]).
midline(r1, [xy(315,114),xy(303,127),xy(291,118),xy(291,119),xy(289,121),xy(291,121),xy(292,120),xy(292,122),xy(294,122)]).
midline(r1, [xy(306,124),xy(345,85)]).
midline(r1, [xy(296,122),xy(296,124),xy(300,129),xy(288,142),xy(300,130)]).
midline(r1, [xy(298,123),xy(303,128),xy(303,130),xy(305,132),xy(307,131),xy(304,127),xy(307,130)]).
midline(r1, [xy(443,119),xy(422,141),xy(445,118)]).
midline(r1, [xy(386,115),xy(321,179),xy(288,213),xy(321,181),xy(410,91),xy(411,91)]).
midline(r1, [xy(309,253),xy(306,256),xy(302,256),xy(303,258)]).
midline(r1, [xy(307,256),xy(313,250)]).
midline(r1, [xy(331,234),xy(330,233),xy(328,234),xy(329,236),xy(331,235)]).
midline(r1, [xy(352,293),xy(351,293),xy(349,291),xy(350,293)]).
midline(r1, [xy(350,290),xy(352,292)]).
midline(r1, [xy(323,210),xy(308,211)]).
midline(r1, [xy(324,210),xy(342,210),xy(346,207)]).
midline(r1, [xy(327,298),xy(327,297)]).
midline(r1, [xy(322,297),xy(320,297),xy(320,299),xy(322,299)]).
midline(r1, [xy(224,147),xy(227,150)]).
midline(r1, [xy(406,302),xy(405,301),xy(404,302),xy(404,304),xy(406,303)]).
midline(r1, [xy(560,307),xy(558,308),xy(560,309),xy(561,308),xy(561,307),xy(561,310),xy(562,310),xy(563,309),xy(563,308)]).
fillpoint(r1, xy(675,178), 170.9).
fillpoint(r1, xy(670,177), 170.0).
fillpoint(r1, xy(659,174), 167.1).
fillpoint(r1, xy(655,173), 166.2).
fillpoint(r1, xy(650,172), 165.2).
fillpoint(r1, xy(646,171), 164.3).
fillpoint(r1, xy(641,170), 163.3).
fillpoint(r1, xy(636,169), 162.4).
fillpoint(r1, xy(632,168), 161.4).
fillpoint(r1, xy(627,167), 160.4).
fillpoint(r1, xy(622,166), 159.5).
fillpoint(r1, xy(618,165), 158.5).
fillpoint(r1, xy(613,164), 157.6).
fillpoint(r1, xy(609,163), 156.6).
fillpoint(r1, xy(604,162), 155.7).
fillpoint(r1, xy(599,161), 154.7).
fillpoint(r1, xy(595,160), 153.8).
fillpoint(r1, xy(590,159), 152.8).
fillpoint(r1, xy(586,158), 151.8).
fillpoint(r1, xy(581,157), 150.9).
fillpoint(r1, xy(576,156), 149.9).
fillpoint(r1, xy(572,155), 149.0).
fillpoint(r1, xy(471,155), 148.3).
fillpoint(r1, xy(469,154), 148.0).
fillpoint(r1, xy(474,154), 148.0).
fillpoint(r1, xy(514,154), 148.0).
fillpoint(r1, xy(567,154), 148.0).
fillpoint(r1, xy(479,153), 147.1).
fillpoint(r1, xy(508,153), 147.1).
fillpoint(r1, xy(520,153), 147.1).
fillpoint(r1, xy(563,153), 147.1).
fillpoint(r1, xy(483,152), 146.1).
fillpoint(r1, xy(503,152), 146.1).
fillpoint(r1, xy(524,152), 146.1).
fillpoint(r1, xy(558,152), 146.1).
fillpoint(r1, xy(488,151), 145.2).
fillpoint(r1, xy(498,151), 145.2).
fillpoint(r1, xy(529,151), 145.2).
fillpoint(r1, xy(553,151), 145.2).
fillpoint(r1, xy(493,150), 144.2).
fillpoint(r1, xy(534,150), 144.2).
fillpoint(r1, xy(549,150), 144.2).
fillpoint(r1, xy(538,149), 143.3).
fillpoint(r1, xy(544,149), 143.3).
fillpoint(r1, xy(104,103), 99.3).
fillpoint(r1, xy(99,115), 95.5).
fillpoint(r1, xy(118,98), 94.5).
fillpoint(r1, xy(97,122), 93.6).
fillpoint(r1, xy(96,126), 92.6).
fillpoint(r1, xy(95,131), 91.7).
fillpoint(r1, xy(95,266), 91.7).
fillpoint(r1, xy(96,268), 91.7).
fillpoint(r1, xy(94,135), 90.7).
fillpoint(r1, xy(94,262), 90.7).
fillpoint(r1, xy(93,140), 89.8).
fillpoint(r1, xy(93,257), 89.8).
fillpoint(r1, xy(92,144), 88.8).
fillpoint(r1, xy(92,252), 88.8).
fillpoint(r1, xy(91,149), 87.9).
fillpoint(r1, xy(91,248), 87.9).
fillpoint(r1, xy(90,154), 86.9).
fillpoint(r1, xy(90,243), 86.9).
fillpoint(r1, xy(89,158), 85.9).
fillpoint(r1, xy(89,238), 85.9).
fillpoint(r1, xy(88,163), 85.0).
fillpoint(r1, xy(88,234), 85.0).
fillpoint(r1, xy(87,167), 84.0).
fillpoint(r1, xy(87,229), 84.0).
fillpoint(r1, xy(112,276), 84.0).
fillpoint(r1, xy(86,172), 83.1).
fillpoint(r1, xy(86,225), 83.1).
fillpoint(r1, xy(116,277), 83.1).
fillpoint(r1, xy(85,177), 82.1).
fillpoint(r1, xy(85,220), 82.1).
fillpoint(r1, xy(121,278), 82.1).
fillpoint(r1, xy(145,84), 81.2).
fillpoint(r1, xy(84,181), 81.2).
fillpoint(r1, xy(84,215), 81.2).
fillpoint(r1, xy(126,279), 81.2).
fillpoint(r1, xy(84,200), 81.1).
fillpoint(r1, xy(150,83), 80.2).
fillpoint(r1, xy(83,186), 80.2).
fillpoint(r1, xy(83,196), 80.2).
fillpoint(r1, xy(83,204), 80.2).
fillpoint(r1, xy(83,211), 80.2).
fillpoint(r1, xy(82,191), 79.3).
fillpoint(r1, xy(356,75), 72.6).
fillpoint(r1, xy(344,71), 68.8).
fillpoint(r1, xy(340,70), 67.8).
fillpoint(r1, xy(334,68), 65.9).
fillpoint(r1, xy(329,67), 64.9).
fillpoint(r1, xy(324,66), 64.0).
fillpoint(r1, xy(320,65), 63.0).
fillpoint(r1, xy(315,64), 62.1).
fillpoint(r1, xy(311,63), 61.1).
fillpoint(r1, xy(159,300), 61.1).
fillpoint(r1, xy(306,62), 60.2).
fillpoint(r1, xy(164,301), 60.2).
fillpoint(r1, xy(277,61), 59.2).
fillpoint(r1, xy(301,61), 59.2).
fillpoint(r1, xy(168,302), 59.2).
fillpoint(r1, xy(282,60), 58.3).
fillpoint(r1, xy(297,60), 58.3).
fillpoint(r1, xy(173,303), 58.3).
fillpoint(r1, xy(237,299), 57.5).
fillpoint(r1, xy(235,300), 57.4).
fillpoint(r1, xy(230,302), 57.4).
fillpoint(r1, xy(228,303), 57.4).
fillpoint(r1, xy(286,59), 57.3).
fillpoint(r1, xy(292,59), 57.3).
fillpoint(r1, xy(232,301), 57.3).
fillpoint(r1, xy(177,304), 57.3).
fillpoint(r1, xy(226,304), 57.3).
fillpoint(r1, xy(182,305), 56.3).
fillpoint(r1, xy(221,305), 56.3).
fillpoint(r1, xy(204,88), 55.7).
fillpoint(r1, xy(211,91), 55.7).
fillpoint(r1, xy(202,87), 55.6).
fillpoint(r1, xy(206,89), 55.6).
fillpoint(r1, xy(209,90), 55.6).
fillpoint(r1, xy(187,306), 55.4).
fillpoint(r1, xy(217,306), 55.4).
fillpoint(r1, xy(191,307), 54.4).
fillpoint(r1, xy(212,307), 54.4).
fillpoint(r1, xy(245,285), 53.9).
fillpoint(r1, xy(243,290), 53.9).
fillpoint(r1, xy(246,283), 53.8).
fillpoint(r1, xy(244,287), 53.8).
fillpoint(r1, xy(248,228), 53.7).
fillpoint(r1, xy(196,308), 53.5).
fillpoint(r1, xy(207,308), 53.5).
fillpoint(r1, xy(202,309), 52.5).
fillpoint(r1, xy(228,86), 49.0).
fillpoint(r1, xy(230,85), 48.9).
fillpoint(r1, xy(226,87), 48.9).
fillpoint(r1, xy(253,75), 48.8).
fillpoint(r1, xy(251,76), 48.8).
fillpoint(r1, xy(246,78), 48.8).
fillpoint(r1, xy(244,79), 48.8).
fillpoint(r1, xy(239,81), 48.8).
fillpoint(r1, xy(237,82), 48.8).
fillpoint(r1, xy(258,73), 48.7).
fillpoint(r1, xy(255,74), 48.7).
fillpoint(r1, xy(248,77), 48.7).
fillpoint(r1, xy(242,80), 48.7).
fillpoint(r1, xy(235,83), 48.7).
fillpoint(r1, xy(232,84), 48.7).
fillpoint(r1, xy(247,266), 47.8).
fillpoint(r1, xy(278,206), 46.6).
fillpoint(r1, xy(276,207), 46.5).
fillpoint(r1, xy(271,209), 46.5).
fillpoint(r1, xy(269,210), 46.5).
fillpoint(r1, xy(264,212), 46.5).
fillpoint(r1, xy(273,208), 46.4).
fillpoint(r1, xy(267,211), 46.4).
fillpoint(r1, xy(262,213), 46.1).
fillpoint(r1, xy(248,248), 45.9).
border(r1).
region(r103, '#919290', 7, centroid(222,179)).
perimeter(r103, 16).
polygon(r103, [xy(222,176),xy(222,182),xy(222,176)]).
midline(r103, [xy(222,182),xy(222,176)]).
region(r64, '#959b9b', 4, centroid(228,166)).
perimeter(r64, 10).
polygon(r64, [xy(228,164),xy(228,167),xy(228,164)]).
midline(r64, [xy(228,164),xy(228,167)]).
region(r177, '#858a89', 4, centroid(298,272)).
perimeter(r177, 8).

adjacent(r1, r64).
shared_edge(r1, r64, 10).
adjacent(r1, r103).
shared_edge(r1, r103, 16).
adjacent(r1, r177).
shared_edge(r1, r177, 8).

encloses(r1, r64).
encloses(r1, r103).
encloses(r1, r177).

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
opencv_component(cc1, [r64]).
opencv_component_area(cc1, 4).
opencv_component_centroid(cc1, centroid(228,166)).
opencv_component(cc2, [r103]).
opencv_component_area(cc2, 7).
opencv_component_centroid(cc2, centroid(222,179)).
opencv_component(cc3, [r177]).
opencv_component_area(cc3, 4).
opencv_component_centroid(cc3, centroid(298,272)).
opencv_morphology(r1, opening_area(310525), closing_area(313216), gradient_area(5789)).
opencv_shape_metrics(r1, contour_area(309592.5), hull_area(309639.0), solidity(0.99985), circularity(0.648631), extent(0.995935), aspect_ratio(2.346154)).
opencv_contour(r1, c0, outer, 309592.5).
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
opencv_contour(r1, c36, hole, 6.0).
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
opencv_contour(r1, c45, hole, 7.0).
opencv_contour_hierarchy(r1, c45, next(c46), previous(c44), child(none), parent(c0)).
opencv_contour(r1, c46, hole, 4.0).
opencv_contour_hierarchy(r1, c46, next(c47), previous(c45), child(none), parent(c0)).
opencv_contour(r1, c47, hole, 4.0).
opencv_contour_hierarchy(r1, c47, next(c48), previous(c46), child(none), parent(c0)).
opencv_contour(r1, c48, hole, 8.0).
opencv_contour_hierarchy(r1, c48, next(c49), previous(c47), child(none), parent(c0)).
opencv_contour(r1, c49, hole, 16.0).
opencv_contour_hierarchy(r1, c49, next(c50), previous(c48), child(none), parent(c0)).
opencv_contour(r1, c50, hole, 4.0).
opencv_contour_hierarchy(r1, c50, next(c51), previous(c49), child(none), parent(c0)).
opencv_contour(r1, c51, hole, 4.0).
opencv_contour_hierarchy(r1, c51, next(c52), previous(c50), child(none), parent(c0)).
opencv_contour(r1, c52, hole, 7.5).
opencv_contour_hierarchy(r1, c52, next(c53), previous(c51), child(none), parent(c0)).
opencv_contour(r1, c53, hole, 4.0).
opencv_contour_hierarchy(r1, c53, next(c54), previous(c52), child(none), parent(c0)).
opencv_contour(r1, c54, hole, 4.0).
opencv_contour_hierarchy(r1, c54, next(c55), previous(c53), child(none), parent(c0)).
opencv_contour(r1, c55, hole, 4.0).
opencv_contour_hierarchy(r1, c55, next(c56), previous(c54), child(none), parent(c0)).
opencv_contour(r1, c56, hole, 6.0).
opencv_contour_hierarchy(r1, c56, next(c57), previous(c55), child(none), parent(c0)).
opencv_contour(r1, c57, hole, 2.0).
opencv_contour_hierarchy(r1, c57, next(c58), previous(c56), child(none), parent(c0)).
opencv_contour(r1, c58, hole, 2.0).
opencv_contour_hierarchy(r1, c58, next(c59), previous(c57), child(none), parent(c0)).
opencv_contour(r1, c59, hole, 2.0).
opencv_contour_hierarchy(r1, c59, next(c60), previous(c58), child(none), parent(c0)).
opencv_contour(r1, c60, hole, 4.0).
opencv_contour_hierarchy(r1, c60, next(c61), previous(c59), child(none), parent(c0)).
opencv_contour(r1, c61, hole, 7.0).
opencv_contour_hierarchy(r1, c61, next(c62), previous(c60), child(none), parent(c0)).
opencv_contour(r1, c62, hole, 2.0).
opencv_contour_hierarchy(r1, c62, next(c63), previous(c61), child(none), parent(c0)).
opencv_contour(r1, c63, hole, 2.0).
opencv_contour_hierarchy(r1, c63, next(c64), previous(c62), child(none), parent(c0)).
opencv_contour(r1, c64, hole, 7.0).
opencv_contour_hierarchy(r1, c64, next(c65), previous(c63), child(none), parent(c0)).
opencv_contour(r1, c65, hole, 2.0).
opencv_contour_hierarchy(r1, c65, next(c66), previous(c64), child(none), parent(c0)).
opencv_contour(r1, c66, hole, 4.0).
opencv_contour_hierarchy(r1, c66, next(c67), previous(c65), child(none), parent(c0)).
opencv_contour(r1, c67, hole, 2.0).
opencv_contour_hierarchy(r1, c67, next(c68), previous(c66), child(none), parent(c0)).
opencv_contour(r1, c68, hole, 2.0).
opencv_contour_hierarchy(r1, c68, next(c69), previous(c67), child(none), parent(c0)).
opencv_contour(r1, c69, hole, 4.0).
opencv_contour_hierarchy(r1, c69, next(c70), previous(c68), child(none), parent(c0)).
opencv_contour(r1, c70, hole, 2.0).
opencv_contour_hierarchy(r1, c70, next(c71), previous(c69), child(none), parent(c0)).
opencv_contour(r1, c71, hole, 2.0).
opencv_contour_hierarchy(r1, c71, next(c72), previous(c70), child(none), parent(c0)).
opencv_contour(r1, c72, hole, 2.0).
opencv_contour_hierarchy(r1, c72, next(c73), previous(c71), child(none), parent(c0)).
opencv_contour(r1, c73, hole, 2.0).
opencv_contour_hierarchy(r1, c73, next(c74), previous(c72), child(none), parent(c0)).
opencv_contour(r1, c74, hole, 4.0).
opencv_contour_hierarchy(r1, c74, next(c75), previous(c73), child(none), parent(c0)).
opencv_contour(r1, c75, hole, 2.0).
opencv_contour_hierarchy(r1, c75, next(c76), previous(c74), child(none), parent(c0)).
opencv_contour(r1, c76, hole, 2.0).
opencv_contour_hierarchy(r1, c76, next(c77), previous(c75), child(none), parent(c0)).
opencv_contour(r1, c77, hole, 4.0).
opencv_contour_hierarchy(r1, c77, next(c78), previous(c76), child(none), parent(c0)).
opencv_contour(r1, c78, hole, 2.0).
opencv_contour_hierarchy(r1, c78, next(c79), previous(c77), child(none), parent(c0)).
opencv_contour(r1, c79, hole, 2.0).
opencv_contour_hierarchy(r1, c79, next(c80), previous(c78), child(none), parent(c0)).
opencv_contour(r1, c80, hole, 2.0).
opencv_contour_hierarchy(r1, c80, next(c81), previous(c79), child(none), parent(c0)).
opencv_contour(r1, c81, hole, 2.0).
opencv_contour_hierarchy(r1, c81, next(c82), previous(c80), child(none), parent(c0)).
opencv_contour(r1, c82, hole, 4.0).
opencv_contour_hierarchy(r1, c82, next(c83), previous(c81), child(none), parent(c0)).
opencv_contour(r1, c83, hole, 2.0).
opencv_contour_hierarchy(r1, c83, next(c84), previous(c82), child(none), parent(c0)).
opencv_contour(r1, c84, hole, 2.0).
opencv_contour_hierarchy(r1, c84, next(c85), previous(c83), child(none), parent(c0)).
opencv_contour(r1, c85, hole, 2.0).
opencv_contour_hierarchy(r1, c85, next(c86), previous(c84), child(none), parent(c0)).
opencv_contour(r1, c86, hole, 4.0).
opencv_contour_hierarchy(r1, c86, next(c87), previous(c85), child(none), parent(c0)).
opencv_contour(r1, c87, hole, 4.0).
opencv_contour_hierarchy(r1, c87, next(c88), previous(c86), child(none), parent(c0)).
opencv_contour(r1, c88, hole, 2.0).
opencv_contour_hierarchy(r1, c88, next(c89), previous(c87), child(none), parent(c0)).
opencv_contour(r1, c89, hole, 2.0).
opencv_contour_hierarchy(r1, c89, next(c90), previous(c88), child(none), parent(c0)).
opencv_contour(r1, c90, hole, 7.0).
opencv_contour_hierarchy(r1, c90, next(c91), previous(c89), child(none), parent(c0)).
opencv_contour(r1, c91, hole, 14.0).
opencv_contour_hierarchy(r1, c91, next(c92), previous(c90), child(none), parent(c0)).
opencv_contour(r1, c92, hole, 2.0).
opencv_contour_hierarchy(r1, c92, next(c93), previous(c91), child(none), parent(c0)).
opencv_contour(r1, c93, hole, 4.0).
opencv_contour_hierarchy(r1, c93, next(c94), previous(c92), child(none), parent(c0)).
opencv_contour(r1, c94, hole, 5.5).
opencv_contour_hierarchy(r1, c94, next(c95), previous(c93), child(none), parent(c0)).
opencv_contour(r1, c95, hole, 11.5).
opencv_contour_hierarchy(r1, c95, next(c96), previous(c94), child(none), parent(c0)).
opencv_contour(r1, c96, hole, 2.0).
opencv_contour_hierarchy(r1, c96, next(c97), previous(c95), child(none), parent(c0)).
opencv_contour(r1, c97, hole, 2.0).
opencv_contour_hierarchy(r1, c97, next(c98), previous(c96), child(none), parent(c0)).
opencv_contour(r1, c98, hole, 2.0).
opencv_contour_hierarchy(r1, c98, next(c99), previous(c97), child(none), parent(c0)).
opencv_contour(r1, c99, hole, 2.0).
opencv_contour_hierarchy(r1, c99, next(c100), previous(c98), child(none), parent(c0)).
opencv_contour(r1, c100, hole, 7.0).
opencv_contour_hierarchy(r1, c100, next(c101), previous(c99), child(none), parent(c0)).
opencv_contour(r1, c101, hole, 2.0).
opencv_contour_hierarchy(r1, c101, next(c102), previous(c100), child(none), parent(c0)).
opencv_contour(r1, c102, hole, 11.0).
opencv_contour_hierarchy(r1, c102, next(c103), previous(c101), child(none), parent(c0)).
opencv_contour(r1, c103, hole, 2.0).
opencv_contour_hierarchy(r1, c103, next(c104), previous(c102), child(none), parent(c0)).
opencv_contour(r1, c104, hole, 2.0).
opencv_contour_hierarchy(r1, c104, next(c105), previous(c103), child(none), parent(c0)).
opencv_contour(r1, c105, hole, 2.0).
opencv_contour_hierarchy(r1, c105, next(c106), previous(c104), child(none), parent(c0)).
opencv_contour(r1, c106, hole, 2.0).
opencv_contour_hierarchy(r1, c106, next(c107), previous(c105), child(none), parent(c0)).
opencv_contour(r1, c107, hole, 6.0).
opencv_contour_hierarchy(r1, c107, next(c108), previous(c106), child(none), parent(c0)).
opencv_contour(r1, c108, hole, 2.0).
opencv_contour_hierarchy(r1, c108, next(c109), previous(c107), child(none), parent(c0)).
opencv_contour(r1, c109, hole, 9.0).
opencv_contour_hierarchy(r1, c109, next(c110), previous(c108), child(none), parent(c0)).
opencv_contour(r1, c110, hole, 8.0).
opencv_contour_hierarchy(r1, c110, next(c111), previous(c109), child(none), parent(c0)).
opencv_contour(r1, c111, hole, 4.0).
opencv_contour_hierarchy(r1, c111, next(c112), previous(c110), child(none), parent(c0)).
opencv_contour(r1, c112, hole, 42.0).
opencv_contour_hierarchy(r1, c112, next(c113), previous(c111), child(none), parent(c0)).
opencv_contour(r1, c113, hole, 2.0).
opencv_contour_hierarchy(r1, c113, next(c114), previous(c112), child(none), parent(c0)).
opencv_contour(r1, c114, hole, 4.0).
opencv_contour_hierarchy(r1, c114, next(c115), previous(c113), child(none), parent(c0)).
opencv_contour(r1, c115, hole, 2.0).
opencv_contour_hierarchy(r1, c115, next(c116), previous(c114), child(none), parent(c0)).
opencv_contour(r1, c116, hole, 4.0).
opencv_contour_hierarchy(r1, c116, next(c117), previous(c115), child(none), parent(c0)).
opencv_contour(r1, c117, hole, 2.0).
opencv_contour_hierarchy(r1, c117, next(c118), previous(c116), child(none), parent(c0)).
opencv_contour(r1, c118, hole, 2.0).
opencv_contour_hierarchy(r1, c118, next(c119), previous(c117), child(none), parent(c0)).
opencv_contour(r1, c119, hole, 2.0).
opencv_contour_hierarchy(r1, c119, next(c120), previous(c118), child(none), parent(c0)).
opencv_contour(r1, c120, hole, 2.0).
opencv_contour_hierarchy(r1, c120, next(c121), previous(c119), child(none), parent(c0)).
opencv_contour(r1, c121, hole, 2.0).
opencv_contour_hierarchy(r1, c121, next(c122), previous(c120), child(none), parent(c0)).
opencv_contour(r1, c122, hole, 2.0).
opencv_contour_hierarchy(r1, c122, next(c123), previous(c121), child(none), parent(c0)).
opencv_contour(r1, c123, hole, 4.0).
opencv_contour_hierarchy(r1, c123, next(c124), previous(c122), child(none), parent(c0)).
opencv_contour(r1, c124, hole, 4.0).
opencv_contour_hierarchy(r1, c124, next(c125), previous(c123), child(none), parent(c0)).
opencv_contour(r1, c125, hole, 2.0).
opencv_contour_hierarchy(r1, c125, next(c126), previous(c124), child(none), parent(c0)).
opencv_contour(r1, c126, hole, 2.0).
opencv_contour_hierarchy(r1, c126, next(c127), previous(c125), child(none), parent(c0)).
opencv_contour(r1, c127, hole, 2.0).
opencv_contour_hierarchy(r1, c127, next(c128), previous(c126), child(none), parent(c0)).
opencv_contour(r1, c128, hole, 4.0).
opencv_contour_hierarchy(r1, c128, next(c129), previous(c127), child(none), parent(c0)).
opencv_contour(r1, c129, hole, 2.0).
opencv_contour_hierarchy(r1, c129, next(c130), previous(c128), child(none), parent(c0)).
opencv_contour(r1, c130, hole, 7.0).
opencv_contour_hierarchy(r1, c130, next(c131), previous(c129), child(none), parent(c0)).
opencv_contour(r1, c131, hole, 2.0).
opencv_contour_hierarchy(r1, c131, next(c132), previous(c130), child(none), parent(c0)).
opencv_contour(r1, c132, hole, 2.0).
opencv_contour_hierarchy(r1, c132, next(c133), previous(c131), child(none), parent(c0)).
opencv_contour(r1, c133, hole, 7.0).
opencv_contour_hierarchy(r1, c133, next(c134), previous(c132), child(none), parent(c0)).
opencv_contour(r1, c134, hole, 2.0).
opencv_contour_hierarchy(r1, c134, next(c135), previous(c133), child(none), parent(c0)).
opencv_contour(r1, c135, hole, 2.0).
opencv_contour_hierarchy(r1, c135, next(c136), previous(c134), child(none), parent(c0)).
opencv_contour(r1, c136, hole, 7.0).
opencv_contour_hierarchy(r1, c136, next(c137), previous(c135), child(none), parent(c0)).
opencv_contour(r1, c137, hole, 2.0).
opencv_contour_hierarchy(r1, c137, next(c138), previous(c136), child(none), parent(c0)).
opencv_contour(r1, c138, hole, 2.0).
opencv_contour_hierarchy(r1, c138, next(c139), previous(c137), child(none), parent(c0)).
opencv_contour(r1, c139, hole, 2.0).
opencv_contour_hierarchy(r1, c139, next(c140), previous(c138), child(none), parent(c0)).
opencv_contour(r1, c140, hole, 4.0).
opencv_contour_hierarchy(r1, c140, next(c141), previous(c139), child(none), parent(c0)).
opencv_contour(r1, c141, hole, 2.0).
opencv_contour_hierarchy(r1, c141, next(c142), previous(c140), child(none), parent(c0)).
opencv_contour(r1, c142, hole, 2.0).
opencv_contour_hierarchy(r1, c142, next(c143), previous(c141), child(none), parent(c0)).
opencv_contour(r1, c143, hole, 2.0).
opencv_contour_hierarchy(r1, c143, next(c144), previous(c142), child(none), parent(c0)).
opencv_contour(r1, c144, hole, 4.0).
opencv_contour_hierarchy(r1, c144, next(c145), previous(c143), child(none), parent(c0)).
opencv_contour(r1, c145, hole, 2.0).
opencv_contour_hierarchy(r1, c145, next(c146), previous(c144), child(none), parent(c0)).
opencv_contour(r1, c146, hole, 2.0).
opencv_contour_hierarchy(r1, c146, next(c147), previous(c145), child(none), parent(c0)).
opencv_contour(r1, c147, hole, 2.0).
opencv_contour_hierarchy(r1, c147, next(c148), previous(c146), child(none), parent(c0)).
opencv_contour(r1, c148, hole, 2.0).
opencv_contour_hierarchy(r1, c148, next(c149), previous(c147), child(none), parent(c0)).
opencv_contour(r1, c149, hole, 2.0).
opencv_contour_hierarchy(r1, c149, next(c150), previous(c148), child(none), parent(c0)).
opencv_contour(r1, c150, hole, 2.0).
opencv_contour_hierarchy(r1, c150, next(c151), previous(c149), child(none), parent(c0)).
opencv_contour(r1, c151, hole, 4.0).
opencv_contour_hierarchy(r1, c151, next(c152), previous(c150), child(none), parent(c0)).
opencv_contour(r1, c152, hole, 2.0).
opencv_contour_hierarchy(r1, c152, next(none), previous(c151), child(none), parent(c0)).
opencv_morphology(r64, opening_area(0), closing_area(8), gradient_area(14)).
opencv_shape_metrics(r64, contour_area(0.0), hull_area(0.0), solidity(0.0), circularity(0.0), extent(0.0), aspect_ratio(0.25)).
opencv_contour(r64, c0, outer, 0.0).
opencv_contour_hierarchy(r64, c0, next(none), previous(none), child(none), parent(none)).
opencv_morphology(r103, opening_area(0), closing_area(17), gradient_area(23)).
opencv_shape_metrics(r103, contour_area(0.0), hull_area(0.0), solidity(0.0), circularity(0.0), extent(0.0), aspect_ratio(0.142857)).
opencv_contour(r103, c0, outer, 0.0).
opencv_contour_hierarchy(r103, c0, next(none), previous(none), child(none), parent(none)).
opencv_watershed_count(r64, 1).
opencv_watershed_segment(r64, ws1, 4, centroid(228,166)).
opencv_watershed_count(r103, 1).
opencv_watershed_segment(r103, ws1, 7, centroid(222,179)).
opencv_watershed_count(r177, 1).
opencv_watershed_segment(r177, ws1, 4, centroid(298,272)).
