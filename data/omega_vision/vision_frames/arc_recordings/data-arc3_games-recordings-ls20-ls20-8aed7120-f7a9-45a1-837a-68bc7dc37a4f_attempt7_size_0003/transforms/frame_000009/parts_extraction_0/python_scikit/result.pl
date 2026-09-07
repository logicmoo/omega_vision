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
img_size(640, 640).

region(r1, '#aaaaaa', 273600, centroid(299,332)).
perimeter(r1, 5240).
polygon(r1, [xy(400,469),xy(400,460),xy(439,460),xy(440,450),xy(459,450),xy(460,440),xy(469,440),xy(470,430),xy(489,430),xy(490,420),xy(499,420),xy(500,410),xy(509,410),xy(510,400),xy(520,399),xy(520,380),xy(529,380),xy(530,370),xy(540,369),xy(540,350),xy(550,349),xy(550,310),xy(560,309),xy(560,230),xy(550,229),xy(550,190),xy(540,189),xy(540,170),xy(530,170),xy(530,160),xy(520,159),xy(520,140),xy(510,140),xy(510,130),xy(500,130),xy(499,120),xy(490,119),xy(489,110),xy(470,110),xy(470,100),xy(460,100),xy(459,90),xy(440,90),xy(439,80),xy(400,80),xy(399,70),xy(320,70),xy(319,80),xy(280,80),xy(279,90),xy(260,90),xy(260,99),xy(250,100),xy(249,110),xy(230,110),xy(230,119),xy(220,120),xy(220,129),xy(210,130),xy(210,139),xy(200,140),xy(200,159),xy(190,160),xy(190,169),xy(180,170),xy(180,189),xy(170,190),xy(170,229),xy(160,230),xy(160,233),xy(160,309),xy(170,310),xy(170,349),xy(180,350),xy(180,369),xy(189,370),xy(190,379),xy(200,380),xy(200,399),xy(209,400),xy(210,409),xy(219,410),xy(220,419),xy(229,420),xy(230,430),xy(249,430),xy(250,439),xy(259,440),xy(260,450),xy(279,450),xy(280,460),xy(319,460),xy(320,470),xy(400,469)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(594,177),xy(585,146),xy(561,170),xy(585,148)]).
midline(r1, [xy(587,146),xy(577,122),xy(576,110),xy(573,108),xy(541,140),xy(573,110)]).
midline(r1, [xy(575,108),xy(562,75),xy(528,61),xy(503,56),xy(482,47),xy(451,40),xy(427,40),xy(399,34),xy(320,34),xy(304,36),xy(293,40),xy(263,41),xy(230,49),xy(216,56),xy(191,61),xy(140,82),xy(102,102),xy(86,164),xy(85,189),xy(80,213),xy(79,309),xy(81,334),xy(86,353),xy(85,367),xy(89,390),xy(109,462),xy(120,490),xy(101,512),xy(84,538),xy(70,569),xy(73,571)]).
midline(r1, [xy(121,490),xy(171,509),xy(231,449),xy(231,452),xy(172,510)]).
midline(r1, [xy(515,60),xy(488,87),xy(488,90),xy(518,60)]).
midline(r1, [xy(73,573),xy(88,598),xy(119,629),xy(126,634),xy(132,635),xy(549,635),xy(555,632),xy(555,525),xy(540,512),xy(494,526),xy(450,534),xy(437,521),xy(433,520),xy(427,498),xy(421,488),xy(423,488)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,632),xy(579,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(433,514),xy(435,518)]).
midline(r1, [xy(87,174),xy(87,178),xy(89,176)]).
midline(r1, [xy(174,511),xy(250,532),xy(272,534),xy(285,519),xy(284,517),xy(288,513),xy(289,505),xy(296,492),xy(294,489),xy(296,484),xy(302,480),xy(298,484)]).
midline(r1, [xy(288,515),xy(286,517)]).
midline(r1, [xy(297,490),xy(298,486)]).
midline(r1, [xy(542,511),xy(544,507),xy(488,451),xy(486,448),xy(488,448)]).
midline(r1, [xy(437,518),xy(437,520)]).
midline(r1, [xy(87,362),xy(98,349),xy(93,347),xy(87,352)]).
midline(r1, [xy(97,346),xy(100,349),xy(89,360)]).
midline(r1, [xy(101,348),xy(104,347),xy(101,346)]).
midline(r1, [xy(428,501),xy(428,499)]).
midline(r1, [xy(274,534),xy(280,533),xy(281,535),xy(281,527),xy(285,523)]).
midline(r1, [xy(283,535),xy(320,540),xy(415,539),xy(444,534),xy(437,523)]).
midline(r1, [xy(446,534),xy(448,534)]).
midline(r1, [xy(283,530),xy(285,525)]).
midline(r1, [xy(105,346),xy(105,344),xy(103,345)]).
midline(r1, [xy(107,344),xy(115,341),xy(113,344)]).
midline(r1, [xy(117,341),xy(128,338),xy(145,329),xy(145,331)]).
midline(r1, [xy(286,520),xy(286,521)]).
midline(r1, [xy(586,556),xy(615,585),xy(615,632),xy(609,635),xy(585,633)]).
midline(r1, [xy(291,41),xy(294,42),xy(292,44),xy(294,46)]).
midline(r1, [xy(426,494),xy(428,497)]).
midline(r1, [xy(545,506),xy(566,457),xy(565,455),xy(571,445),xy(577,425),xy(577,417),xy(586,397),xy(594,362),xy(594,341),xy(585,334),xy(581,334),xy(569,327),xy(569,329)]).
midline(r1, [xy(585,336),xy(587,338)]).
midline(r1, [xy(595,340),xy(589,336)]).
midline(r1, [xy(87,171),xy(106,190),xy(104,191),xy(91,178),xy(89,180),xy(100,189),xy(101,193),xy(103,192),xy(101,190)]).
midline(r1, [xy(103,194),xy(106,194),xy(107,191),xy(115,195),xy(113,197),xy(107,195)]).
midline(r1, [xy(114,198),xy(116,196),xy(119,199)]).
midline(r1, [xy(121,199),xy(123,201),xy(127,200),xy(126,202)]).
midline(r1, [xy(129,201),xy(132,204),xy(139,205),xy(139,207)]).
midline(r1, [xy(141,207),xy(148,210)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(594,178),xy(595,200),xy(585,205),xy(583,204),xy(572,211),xy(570,210),xy(570,212)]).
midline(r1, [xy(595,202),xy(600,230),xy(600,309),xy(595,337)]).
midline(r1, [xy(112,464),xy(179,397),xy(181,396),xy(181,398)]).
fillpoint(r1, xy(120,490), 120.4).
fillpoint(r1, xy(115,478), 116.0).
fillpoint(r1, xy(131,494), 116.0).
fillpoint(r1, xy(112,470), 113.0).
fillpoint(r1, xy(111,467), 112.0).
fillpoint(r1, xy(110,464), 111.0).
fillpoint(r1, xy(109,461), 110.0).
fillpoint(r1, xy(108,458), 109.0).
fillpoint(r1, xy(107,454), 108.0).
fillpoint(r1, xy(104,442), 105.0).
fillpoint(r1, xy(102,102), 103.0).
fillpoint(r1, xy(99,111), 100.0).
fillpoint(r1, xy(99,428), 100.0).
fillpoint(r1, xy(171,510), 100.0).
fillpoint(r1, xy(542,512), 98.0).
fillpoint(r1, xy(96,121), 97.0).
fillpoint(r1, xy(96,418), 97.0).
fillpoint(r1, xy(181,513), 97.0).
fillpoint(r1, xy(538,513), 97.0).
fillpoint(r1, xy(95,125), 96.0).
fillpoint(r1, xy(95,414), 96.0).
fillpoint(r1, xy(185,514), 96.0).
fillpoint(r1, xy(534,514), 96.0).
fillpoint(r1, xy(94,129), 95.0).
fillpoint(r1, xy(94,410), 95.0).
fillpoint(r1, xy(189,515), 95.0).
fillpoint(r1, xy(530,515), 95.0).
fillpoint(r1, xy(93,134), 94.0).
fillpoint(r1, xy(93,405), 94.0).
fillpoint(r1, xy(194,516), 94.0).
fillpoint(r1, xy(525,516), 94.0).
fillpoint(r1, xy(92,139), 93.0).
fillpoint(r1, xy(92,400), 93.0).
fillpoint(r1, xy(90,146), 91.0).
fillpoint(r1, xy(90,393), 91.0).
fillpoint(r1, xy(89,150), 90.0).
fillpoint(r1, xy(89,389), 90.0).
fillpoint(r1, xy(88,155), 89.0).
fillpoint(r1, xy(88,384), 89.0).
fillpoint(r1, xy(87,160), 88.0).
fillpoint(r1, xy(87,379), 88.0).
fillpoint(r1, xy(86,166), 87.0).
fillpoint(r1, xy(86,373), 87.0).
fillpoint(r1, xy(553,488), 87.0).
fillpoint(r1, xy(214,523), 87.0).
fillpoint(r1, xy(505,523), 87.0).
fillpoint(r1, xy(85,175), 86.0).
fillpoint(r1, xy(85,365), 86.0).
fillpoint(r1, xy(84,191), 85.0).
fillpoint(r1, xy(84,348), 85.0).
fillpoint(r1, xy(221,525), 85.0).
fillpoint(r1, xy(498,525), 85.0).
fillpoint(r1, xy(83,196), 84.0).
fillpoint(r1, xy(83,343), 84.0).
fillpoint(r1, xy(226,526), 84.0).
fillpoint(r1, xy(493,526), 84.0).
fillpoint(r1, xy(82,201), 83.0).
fillpoint(r1, xy(82,338), 83.0).
fillpoint(r1, xy(231,527), 83.0).
fillpoint(r1, xy(488,527), 83.0).
fillpoint(r1, xy(81,207), 82.0).
fillpoint(r1, xy(81,332), 82.0).
fillpoint(r1, xy(80,216), 81.0).
fillpoint(r1, xy(80,324), 81.0).
fillpoint(r1, xy(239,529), 81.0).
fillpoint(r1, xy(480,529), 81.0).
fillpoint(r1, xy(79,270), 80.0).
fillpoint(r1, xy(243,530), 80.0).
fillpoint(r1, xy(476,530), 80.0).
fillpoint(r1, xy(247,531), 79.0).
fillpoint(r1, xy(472,531), 79.0).
fillpoint(r1, xy(252,532), 78.0).
fillpoint(r1, xy(468,532), 78.0).
fillpoint(r1, xy(258,533), 77.0).
fillpoint(r1, xy(462,533), 77.0).
fillpoint(r1, xy(563,76), 76.4).
fillpoint(r1, xy(266,534), 76.0).
fillpoint(r1, xy(454,534), 76.0).
fillpoint(r1, xy(282,535), 75.0).
fillpoint(r1, xy(436,535), 75.0).
fillpoint(r1, xy(288,536), 74.0).
fillpoint(r1, xy(431,536), 74.0).
fillpoint(r1, xy(293,537), 73.0).
fillpoint(r1, xy(426,537), 73.0).
fillpoint(r1, xy(299,538), 72.0).
fillpoint(r1, xy(421,538), 72.0).
fillpoint(r1, xy(307,539), 71.0).
fillpoint(r1, xy(413,539), 71.0).
fillpoint(r1, xy(321,540), 70.0).
fillpoint(r1, xy(575,107), 65.0).
fillpoint(r1, xy(575,432), 65.0).
fillpoint(r1, xy(577,115), 63.0).
fillpoint(r1, xy(577,424), 63.0).
fillpoint(r1, xy(192,61), 62.0).
fillpoint(r1, xy(527,61), 62.0).
fillpoint(r1, xy(578,120), 62.0).
fillpoint(r1, xy(578,419), 62.0).
fillpoint(r1, xy(195,60), 61.0).
fillpoint(r1, xy(524,60), 61.0).
fillpoint(r1, xy(198,59), 60.0).
fillpoint(r1, xy(521,59), 60.0).
fillpoint(r1, xy(202,58), 59.0).
fillpoint(r1, xy(517,58), 59.0).
fillpoint(r1, xy(206,57), 58.0).
fillpoint(r1, xy(513,57), 58.0).
fillpoint(r1, xy(582,131), 58.0).
fillpoint(r1, xy(582,408), 58.0).
fillpoint(r1, xy(211,56), 57.0).
fillpoint(r1, xy(508,56), 57.0).
fillpoint(r1, xy(586,143), 54.0).
fillpoint(r1, xy(586,396), 54.0).
fillpoint(r1, xy(587,147), 53.0).
fillpoint(r1, xy(587,392), 53.0).
fillpoint(r1, xy(588,152), 52.0).
fillpoint(r1, xy(588,388), 52.0).
fillpoint(r1, xy(589,158), 51.0).
fillpoint(r1, xy(589,382), 51.0).
fillpoint(r1, xy(231,49), 50.0).
fillpoint(r1, xy(488,49), 50.0).
fillpoint(r1, xy(590,161), 50.0).
fillpoint(r1, xy(590,378), 50.0).
fillpoint(r1, xy(238,47), 48.0).
fillpoint(r1, xy(481,47), 48.0).
fillpoint(r1, xy(592,168), 48.0).
fillpoint(r1, xy(592,371), 48.0).
fillpoint(r1, xy(243,46), 47.0).
fillpoint(r1, xy(476,46), 47.0).
fillpoint(r1, xy(593,173), 47.0).
fillpoint(r1, xy(593,366), 47.0).
fillpoint(r1, xy(249,45), 46.0).
fillpoint(r1, xy(470,45), 46.0).
fillpoint(r1, xy(594,179), 46.0).
fillpoint(r1, xy(594,360), 46.0).
fillpoint(r1, xy(253,44), 45.0).
fillpoint(r1, xy(466,44), 45.0).
fillpoint(r1, xy(594,197), 45.0).
fillpoint(r1, xy(594,343), 45.0).
fillpoint(r1, xy(256,43), 44.0).
fillpoint(r1, xy(463,43), 44.0).
fillpoint(r1, xy(596,206), 44.0).
fillpoint(r1, xy(596,333), 44.0).
fillpoint(r1, xy(264,41), 42.0).
fillpoint(r1, xy(455,41), 42.0).
fillpoint(r1, xy(598,214), 42.0).
fillpoint(r1, xy(598,325), 42.0).
fillpoint(r1, xy(270,40), 41.0).
fillpoint(r1, xy(449,40), 41.0).
fillpoint(r1, xy(599,220), 41.0).
fillpoint(r1, xy(599,319), 41.0).
fillpoint(r1, xy(294,39), 40.0).
fillpoint(r1, xy(438,39), 40.0).
fillpoint(r1, xy(599,270), 40.0).
fillpoint(r1, xy(301,37), 38.0).
fillpoint(r1, xy(418,37), 38.0).
fillpoint(r1, xy(305,36), 37.0).
fillpoint(r1, xy(414,36), 37.0).
fillpoint(r1, xy(311,35), 36.0).
fillpoint(r1, xy(409,35), 36.0).
fillpoint(r1, xy(321,35), 35.0).
border(r1).
region(r2, '#2ecc40', 68200, centroid(391,276)).
perimeter(r2, 2920).
polygon(r2, [xy(339,470),xy(320,470),xy(319,460),xy(290,459),xy(290,300),xy(160,300),xy(160,250),xy(289,250),xy(290,200),xy(340,199),xy(340,150),xy(290,150),xy(290,100),xy(260,100),xy(260,90),xy(279,90),xy(280,80),xy(319,80),xy(320,70),xy(339,70),xy(340,100),xy(389,100),xy(390,70),xy(399,70),xy(400,90),xy(429,90),xy(430,80),xy(440,80),xy(440,149),xy(390,150),xy(390,199),xy(440,200),xy(440,349),xy(490,349),xy(490,120),xy(499,120),xy(500,129),xy(509,130),xy(510,140),xy(520,140),xy(520,159),xy(529,160),xy(530,169),xy(540,170),xy(540,189),xy(550,190),xy(550,229),xy(560,230),xy(560,309),xy(550,310),xy(550,349),xy(540,350),xy(540,369),xy(530,370),xy(529,380),xy(520,380),xy(520,399),xy(510,400),xy(510,409),xy(500,410),xy(500,419),xy(490,420),xy(489,430),xy(470,430),xy(470,439),xy(460,440),xy(459,450),xy(390,450),xy(390,350),xy(340,350),xy(339,470)]).
hole(r2, [xy(390,299),xy(389,250),xy(340,250),xy(340,300),xy(390,299)]).
hole(r2, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r2, [xy(496,379),xy(493,376),xy(469,388),xy(437,396),xy(427,385),xy(418,369),xy(415,359),xy(414,340),xy(408,325),xy(322,325),xy(316,313),xy(314,290),xy(308,275),xy(184,275)]).
midline(r2, [xy(321,325),xy(316,336),xy(314,351),xy(314,435),xy(325,446),xy(330,460)]).
midline(r2, [xy(308,274),xy(312,267),xy(295,243),xy(295,205),xy(333,205),xy(354,221),xy(356,220),xy(357,222),xy(355,222)]).
midline(r2, [xy(313,266),xy(355,224)]).
midline(r2, [xy(436,397),xy(433,406),xy(429,410),xy(431,412),xy(432,408)]).
midline(r2, [xy(432,413),xy(433,412)]).
midline(r2, [xy(358,221),xy(365,217),xy(364,131),xy(353,126),xy(320,121),xy(315,105),xy(303,94),xy(295,90),xy(289,89),xy(285,93),xy(277,95),xy(264,95)]).
midline(r2, [xy(365,218),xy(376,223),xy(398,225),xy(411,230),xy(415,250),xy(415,299),xy(413,313),xy(408,324)]).
midline(r2, [xy(365,131),xy(376,126),xy(399,124),xy(411,119),xy(412,116),xy(408,109),xy(395,93),xy(395,74)]).
midline(r2, [xy(315,104),xy(325,93),xy(330,79)]).
midline(r2, [xy(413,116),xy(433,95),xy(435,84)]).
midline(r2, [xy(517,191),xy(515,191),xy(505,166),xy(505,154),xy(500,145),xy(500,139),xy(495,133),xy(495,124)]).
midline(r2, [xy(518,190),xy(518,188),xy(516,189)]).
midline(r2, [xy(515,193),xy(516,203),xy(520,212),xy(520,239),xy(526,255),xy(524,259),xy(525,285),xy(520,300),xy(520,327),xy(515,340),xy(516,346),xy(510,359),xy(494,375),xy(499,382)]).
midline(r2, [xy(526,285),xy(533,287),xy(533,289)]).
midline(r2, [xy(517,347),xy(520,350),xy(516,349)]).
midline(r2, [xy(521,328),xy(521,326)]).
midline(r2, [xy(520,352),xy(521,353)]).
fillpoint(r2, xy(437,396), 47.1).
fillpoint(r2, xy(443,394), 45.0).
fillpoint(r2, xy(434,403), 45.0).
fillpoint(r2, xy(446,393), 44.0).
fillpoint(r2, xy(454,391), 42.0).
fillpoint(r2, xy(460,390), 41.0).
fillpoint(r2, xy(524,270), 35.0).
fillpoint(r2, xy(521,243), 32.0).
fillpoint(r2, xy(521,296), 32.0).
fillpoint(r2, xy(365,131), 31.4).
fillpoint(r2, xy(365,218), 31.4).
fillpoint(r2, xy(308,275), 31.4).
fillpoint(r2, xy(321,325), 31.4).
fillpoint(r2, xy(408,325), 31.4).
fillpoint(r2, xy(520,238), 31.0).
fillpoint(r2, xy(520,302), 31.0).
fillpoint(r2, xy(519,220), 30.0).
fillpoint(r2, xy(520,319), 30.0).
fillpoint(r2, xy(319,120), 29.7).
fillpoint(r2, xy(410,120), 29.7).
fillpoint(r2, xy(410,229), 29.7).
fillpoint(r2, xy(491,378), 29.1).
fillpoint(r2, xy(318,118), 29.0).
fillpoint(r2, xy(411,118), 29.0).
fillpoint(r2, xy(321,121), 29.0).
fillpoint(r2, xy(408,121), 29.0).
fillpoint(r2, xy(358,128), 29.0).
fillpoint(r2, xy(371,128), 29.0).
fillpoint(r2, xy(518,208), 29.0).
fillpoint(r2, xy(358,221), 29.0).
fillpoint(r2, xy(371,221), 29.0).
fillpoint(r2, xy(408,228), 29.0).
fillpoint(r2, xy(411,231), 29.0).
fillpoint(r2, xy(311,268), 29.0).
fillpoint(r2, xy(311,281), 29.0).
fillpoint(r2, xy(318,318), 29.0).
fillpoint(r2, xy(411,318), 29.0).
fillpoint(r2, xy(318,331), 29.0).
fillpoint(r2, xy(411,331), 29.0).
fillpoint(r2, xy(518,331), 29.0).
fillpoint(r2, xy(418,368), 29.0).
fillpoint(r2, xy(317,115), 28.0).
fillpoint(r2, xy(324,122), 28.0).
fillpoint(r2, xy(405,122), 28.0).
fillpoint(r2, xy(355,127), 28.0).
fillpoint(r2, xy(374,127), 28.0).
fillpoint(r2, xy(517,205), 28.0).
fillpoint(r2, xy(374,222), 28.0).
fillpoint(r2, xy(405,227), 28.0).
fillpoint(r2, xy(412,234), 28.0).
fillpoint(r2, xy(312,284), 28.0).
fillpoint(r2, xy(317,315), 28.0).
fillpoint(r2, xy(412,315), 28.0).
fillpoint(r2, xy(317,334), 28.0).
fillpoint(r2, xy(412,334), 28.0).
fillpoint(r2, xy(517,334), 28.0).
fillpoint(r2, xy(417,365), 28.0).
fillpoint(r2, xy(316,112), 27.0).
fillpoint(r2, xy(327,123), 27.0).
fillpoint(r2, xy(402,123), 27.0).
fillpoint(r2, xy(352,126), 27.0).
fillpoint(r2, xy(377,126), 27.0).
fillpoint(r2, xy(516,202), 27.0).
fillpoint(r2, xy(377,223), 27.0).
fillpoint(r2, xy(402,226), 27.0).
fillpoint(r2, xy(413,237), 27.0).
fillpoint(r2, xy(313,287), 27.0).
fillpoint(r2, xy(316,312), 27.0).
fillpoint(r2, xy(413,312), 27.0).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(413,337), 27.0).
fillpoint(r2, xy(516,337), 27.0).
fillpoint(r2, xy(416,362), 27.0).
fillpoint(r2, xy(315,108), 26.0).
fillpoint(r2, xy(332,124), 26.0).
fillpoint(r2, xy(398,124), 26.0).
fillpoint(r2, xy(348,125), 26.0).
fillpoint(r2, xy(382,125), 26.0).
fillpoint(r2, xy(515,198), 26.0).
fillpoint(r2, xy(382,224), 26.0).
fillpoint(r2, xy(398,225), 26.0).
fillpoint(r2, xy(414,242), 26.0).
fillpoint(r2, xy(314,292), 26.0).
fillpoint(r2, xy(315,308), 26.0).
fillpoint(r2, xy(414,308), 26.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(414,342), 26.0).
fillpoint(r2, xy(515,342), 26.0).
fillpoint(r2, xy(415,358), 26.0).
fillpoint(r2, xy(364,175), 25.0).
fillpoint(r2, xy(414,275), 25.0).
fillpoint(r2, xy(184,275), 25.0).
fillpoint(r2, xy(341,325), 25.0).
fillpoint(r2, xy(514,350), 25.0).
fillpoint(r2, xy(315,393), 25.0).
fillpoint(r2, xy(509,360), 22.8).
fillpoint(r2, xy(505,165), 16.0).
fillpoint(r2, xy(504,156), 15.0).
region(r5, '#ffdc00', 14000, centroid(458,213)).
perimeter(r5, 720).
polygon(r5, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,150),xy(440,149),xy(440,90),xy(459,90),xy(460,99),xy(470,100),xy(470,110),xy(490,110),xy(489,350)]).
midline(r5, [xy(469,319),xy(470,330)]).
midline(r5, [xy(470,318),xy(469,292),xy(464,279),xy(465,190),xy(462,173),xy(460,170),xy(455,169),xy(409,170)]).
midline(r5, [xy(460,169),xy(464,159),xy(465,134),xy(457,122),xy(450,105),xy(450,99)]).
fillpoint(r5, xy(460,170), 29.0).
fillpoint(r5, xy(462,165), 28.0).
fillpoint(r5, xy(462,174), 28.0).
fillpoint(r5, xy(463,162), 27.0).
fillpoint(r5, xy(463,177), 27.0).
fillpoint(r5, xy(464,158), 26.0).
fillpoint(r5, xy(464,182), 26.0).
fillpoint(r5, xy(465,141), 25.0).
fillpoint(r5, xy(464,236), 25.0).
fillpoint(r5, xy(469,293), 21.0).
fillpoint(r5, xy(409,170), 20.0).
fillpoint(r5, xy(469,316), 20.0).
fillpoint(r5, xy(455,115), 16.0).
fillpoint(r5, xy(450,104), 11.0).
region(r6, '#ffdc00', 13600, centroid(257,189)).
perimeter(r6, 660).
polygon(r6, [xy(289,250),xy(160,249),xy(160,230),xy(170,229),xy(170,200),xy(240,199),xy(240,110),xy(249,110),xy(250,100),xy(290,100),xy(290,150),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r6, [xy(267,123),xy(264,129),xy(264,149),xy(266,163),xy(271,175),xy(265,190),xy(261,219),xy(253,223),xy(238,225),xy(194,224),xy(183,235),xy(169,240)]).
midline(r6, [xy(272,174),xy(315,175)]).
fillpoint(r6, xy(271,175), 31.4).
fillpoint(r6, xy(260,220), 29.7).
fillpoint(r6, xy(268,168), 29.0).
fillpoint(r6, xy(268,181), 29.0).
fillpoint(r6, xy(261,218), 29.0).
fillpoint(r6, xy(258,221), 29.0).
fillpoint(r6, xy(267,165), 28.0).
fillpoint(r6, xy(267,184), 28.0).
fillpoint(r6, xy(262,215), 28.0).
fillpoint(r6, xy(255,222), 28.0).
fillpoint(r6, xy(266,162), 27.0).
fillpoint(r6, xy(266,187), 27.0).
fillpoint(r6, xy(263,212), 27.0).
fillpoint(r6, xy(252,223), 27.0).
fillpoint(r6, xy(265,158), 26.0).
fillpoint(r6, xy(265,192), 26.0).
fillpoint(r6, xy(264,208), 26.0).
fillpoint(r6, xy(248,224), 26.0).
fillpoint(r6, xy(264,139), 25.0).
fillpoint(r6, xy(291,175), 25.0).
fillpoint(r6, xy(194,225), 25.0).
fillpoint(r6, xy(174,239), 11.0).
region(r13, '#ffdc00', 10900, centroid(245,357)).
perimeter(r13, 580).
polygon(r13, [xy(289,460),xy(280,460),xy(279,450),xy(260,450),xy(260,440),xy(250,440),xy(250,430),xy(240,429),xy(240,350),xy(170,350),xy(170,310),xy(160,309),xy(160,300),xy(290,300),xy(289,460)]).
midline(r13, [xy(264,342),xy(259,328),xy(238,324),xy(195,325),xy(175,306),xy(164,305)]).
midline(r13, [xy(264,343),xy(264,409),xy(274,435),xy(284,446),xy(285,455)]).
fillpoint(r13, xy(260,329), 29.7).
fillpoint(r13, xy(258,328), 29.0).
fillpoint(r13, xy(261,331), 29.0).
fillpoint(r13, xy(255,327), 28.0).
fillpoint(r13, xy(262,334), 28.0).
fillpoint(r13, xy(252,326), 27.0).
fillpoint(r13, xy(263,337), 27.0).
fillpoint(r13, xy(248,325), 26.0).
fillpoint(r13, xy(264,342), 26.0).
fillpoint(r13, xy(194,325), 25.0).
fillpoint(r13, xy(264,381), 25.0).
fillpoint(r13, xy(274,434), 16.0).
region(r17, '#ffdc00', 6100, centroid(369,419)).
perimeter(r17, 420).
polygon(r17, [xy(399,470),xy(340,469),xy(340,360),xy(389,360),xy(390,449),xy(440,450),xy(439,460),xy(400,460),xy(399,470)]).
midline(r17, [xy(435,454),xy(400,454),xy(390,460),xy(376,455),xy(364,445)]).
midline(r17, [xy(365,443),xy(365,384)]).
fillpoint(r17, xy(364,415), 25.0).
fillpoint(r17, xy(385,459), 11.0).
region(r19, '#5a5a5a', 4800, centroid(430,620)).
perimeter(r19, 520).
polygon(r19, [xy(549,630),xy(310,630),xy(310,610),xy(549,610),xy(549,630)]).
midline(r19, [xy(481,620),xy(319,620)]).
midline(r19, [xy(482,620),xy(540,620)]).
fillpoint(r19, xy(319,620), 10.0).
region(r7, '#2ecc40', 3800, centroid(214,166)).
perimeter(r7, 320).
polygon(r7, [xy(239,200),xy(170,199),xy(170,190),xy(180,189),xy(180,170),xy(189,170),xy(190,160),xy(200,159),xy(200,140),xy(209,140),xy(210,130),xy(219,130),xy(220,120),xy(229,120),xy(230,110),xy(240,110),xy(239,200)]).
midline(r7, [xy(219,161),xy(229,135),xy(229,129),xy(234,123),xy(235,114)]).
midline(r7, [xy(219,162),xy(218,171),xy(214,177),xy(194,184),xy(183,194),xy(174,195)]).
fillpoint(r7, xy(216,176), 24.0).
fillpoint(r7, xy(219,166), 21.0).
fillpoint(r7, xy(220,157), 20.0).
fillpoint(r7, xy(224,145), 16.0).
fillpoint(r7, xy(195,184), 16.0).
fillpoint(r7, xy(229,134), 11.0).
region(r18, '#2ecc40', 3600, centroid(220,620)).
perimeter(r18, 400).
polygon(r18, [xy(309,630),xy(130,630),xy(130,610),xy(309,610),xy(309,630)]).
midline(r18, [xy(163,619),xy(139,620)]).
midline(r18, [xy(164,620),xy(300,620)]).
fillpoint(r18, xy(139,620), 10.0).
region(r15, '#2ecc40', 3100, centroid(216,380)).
perimeter(r15, 280).
polygon(r15, [xy(239,430),xy(230,430),xy(230,420),xy(220,420),xy(220,410),xy(210,410),xy(209,400),xy(200,399),xy(200,380),xy(190,380),xy(190,370),xy(180,369),xy(180,350),xy(240,350),xy(239,430)]).
midline(r15, [xy(219,370),xy(195,360),xy(189,360)]).
midline(r15, [xy(219,372),xy(219,382),xy(229,404),xy(229,410),xy(234,416),xy(235,425)]).
fillpoint(r15, xy(218,371), 21.0).
fillpoint(r15, xy(219,373), 21.0).
fillpoint(r15, xy(219,382), 20.0).
fillpoint(r15, xy(205,365), 16.0).
fillpoint(r15, xy(224,394), 16.0).
fillpoint(r15, xy(194,360), 11.0).
fillpoint(r15, xy(229,405), 11.0).
region(r3, '#ffdc00', 1500, centroid(364,84)).
perimeter(r3, 160).
polygon(r3, [xy(389,100),xy(340,100),xy(340,70),xy(389,70),xy(389,100)]).
midline(r3, [xy(366,84),xy(354,85)]).
midline(r3, [xy(367,85),xy(375,85)]).
fillpoint(r3, xy(354,85), 15.0).
region(r12, '#870c25', 1500, centroid(364,284)).
perimeter(r12, 160).
polygon(r12, [xy(389,300),xy(340,300),xy(340,270),xy(389,270),xy(389,300)]).
midline(r12, [xy(366,284),xy(354,285)]).
midline(r12, [xy(367,285),xy(375,285)]).
fillpoint(r12, xy(354,285), 15.0).
region(r11, '#bebebe', 1000, centroid(364,260)).
perimeter(r11, 140).
polygon(r11, [xy(389,270),xy(340,270),xy(340,250),xy(389,250),xy(389,270)]).
midline(r11, [xy(351,259),xy(349,260)]).
midline(r11, [xy(352,260),xy(380,260)]).
fillpoint(r11, xy(349,260), 10.0).
region(r9, '#5a5a5a', 800, centroid(314,224)).
perimeter(r9, 160).
polygon(r9, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r9, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r9, [xy(319,214),xy(305,215),xy(305,234),xy(319,235),xy(324,233),xy(325,220),xy(324,216),xy(320,215)]).
fillpoint(r9, xy(306,215), 6.0).
fillpoint(r9, xy(324,215), 6.0).
fillpoint(r9, xy(305,234), 6.0).
fillpoint(r9, xy(323,234), 6.0).
fillpoint(r9, xy(311,215), 5.0).
fillpoint(r9, xy(304,225), 5.0).
fillpoint(r9, xy(324,225), 5.0).
fillpoint(r9, xy(311,235), 5.0).
region(r8, '#0074d9', 500, centroid(414,194)).
perimeter(r8, 120).
polygon(r8, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r8, [xy(409,194),xy(394,195)]).
midline(r8, [xy(410,195),xy(435,195)]).
fillpoint(r8, xy(394,195), 5.0).
region(r14, '#0074d9', 500, centroid(444,324)).
perimeter(r14, 120).
polygon(r14, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r14, [xy(445,311),xy(445,304)]).
midline(r14, [xy(445,312),xy(445,345)]).
fillpoint(r14, xy(444,325), 5.0).
region(r16, '#0074d9', 500, centroid(364,354)).
perimeter(r16, 120).
polygon(r16, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r16, [xy(359,354),xy(344,355)]).
midline(r16, [xy(360,355),xy(385,355)]).
fillpoint(r16, xy(344,355), 5.0).
region(r20, '#7fdbff', 400, centroid(570,620)).
perimeter(r20, 80).
polygon(r20, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r20, [xy(569,619),xy(570,620)]).
fillpoint(r20, xy(569,620), 10.0).
region(r21, '#7fdbff', 400, centroid(600,620)).
perimeter(r21, 80).
polygon(r21, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r21, [xy(599,619),xy(600,620)]).
fillpoint(r21, xy(599,620), 10.0).
region(r22, '#7fdbff', 400, centroid(630,620)).
perimeter(r22, 80).
polygon(r22, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r22, [xy(629,619),xy(630,620)]).
fillpoint(r22, xy(629,620), 10.0).
border(r22).
region(r10, '#2ecc40', 100, centroid(314,224)).
perimeter(r10, 40).
polygon(r10, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r10, [xy(315,225),xy(315,224)]).
fillpoint(r10, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 780).
adjacent(r1, r3).
shared_edge(r1, r3, 50).
adjacent(r1, r5).
shared_edge(r1, r5, 80).
adjacent(r1, r6).
shared_edge(r1, r6, 90).
adjacent(r1, r7).
shared_edge(r1, r7, 160).
adjacent(r1, r13).
shared_edge(r1, r13, 150).
adjacent(r1, r15).
shared_edge(r1, r15, 140).
adjacent(r1, r17).
shared_edge(r1, r17, 120).
adjacent(r1, r18).
shared_edge(r1, r18, 380).
adjacent(r1, r19).
shared_edge(r1, r19, 500).
adjacent(r1, r20).
shared_edge(r1, r20, 80).
adjacent(r1, r21).
shared_edge(r1, r21, 80).
adjacent(r1, r22).
shared_edge(r1, r22, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 110).
adjacent(r2, r5).
shared_edge(r2, r5, 520).
adjacent(r2, r6).
shared_edge(r2, r6, 410).
adjacent(r2, r8).
shared_edge(r2, r8, 60).
adjacent(r2, r9).
shared_edge(r2, r9, 120).
adjacent(r2, r11).
shared_edge(r2, r11, 90).
adjacent(r2, r12).
shared_edge(r2, r12, 110).
adjacent(r2, r13).
shared_edge(r2, r13, 290).
adjacent(r2, r14).
shared_edge(r2, r14, 60).
adjacent(r2, r16).
shared_edge(r2, r16, 70).
adjacent(r2, r17).
shared_edge(r2, r17, 250).
adjacent(r5, r8).
shared_edge(r5, r8, 60).
adjacent(r5, r14).
shared_edge(r5, r14, 60).
adjacent(r6, r7).
shared_edge(r6, r7, 160).
adjacent(r9, r10).
shared_edge(r9, r10, 40).
adjacent(r11, r12).
shared_edge(r11, r12, 50).
adjacent(r13, r15).
shared_edge(r13, r15, 140).
adjacent(r16, r17).
shared_edge(r16, r17, 50).
adjacent(r18, r19).
shared_edge(r18, r19, 20).

encloses(r9, r10).
encloses(r1, r20).
encloses(r1, r21).
