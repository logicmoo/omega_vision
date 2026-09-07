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

region(r1, '#aaaaaa', 271200, centroid(278,330)).
perimeter(r1, 5560).
polygon(r1, [xy(450,469),xy(450,460),xy(489,460),xy(490,450),xy(509,450),xy(510,440),xy(520,439),xy(520,430),xy(539,430),xy(540,420),xy(549,420),xy(550,410),xy(559,410),xy(560,400),xy(570,399),xy(570,380),xy(579,380),xy(580,370),xy(590,369),xy(590,350),xy(600,349),xy(600,310),xy(610,309),xy(610,230),xy(600,229),xy(600,190),xy(590,189),xy(590,170),xy(580,170),xy(580,160),xy(570,159),xy(570,140),xy(560,140),xy(560,130),xy(550,130),xy(550,120),xy(540,119),xy(539,110),xy(520,110),xy(520,100),xy(510,99),xy(509,90),xy(490,90),xy(489,80),xy(450,80),xy(449,70),xy(406,70),xy(370,70),xy(369,80),xy(330,80),xy(329,90),xy(310,90),xy(310,99),xy(300,100),xy(299,110),xy(280,110),xy(280,119),xy(270,120),xy(270,129),xy(260,130),xy(259,140),xy(250,140),xy(250,159),xy(240,160),xy(239,170),xy(230,170),xy(230,189),xy(220,190),xy(220,229),xy(210,230),xy(210,233),xy(210,309),xy(220,310),xy(220,349),xy(230,350),xy(230,369),xy(239,370),xy(240,379),xy(250,380),xy(250,399),xy(259,400),xy(260,409),xy(269,410),xy(270,419),xy(279,420),xy(280,430),xy(299,430),xy(300,439),xy(309,440),xy(310,450),xy(329,450),xy(330,460),xy(369,460),xy(370,470),xy(450,469)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(619,350),xy(618,361),xy(613,370),xy(613,383),xy(606,396),xy(604,408),xy(592,398),xy(588,396),xy(588,398)]).
midline(r1, [xy(604,410),xy(582,469),xy(573,485),xy(538,452),xy(573,487),xy(566,496),xy(552,524),xy(506,534),xy(490,534),xy(487,531),xy(487,535),xy(449,540),xy(370,540),xy(347,538),xy(332,534),xy(313,534),xy(263,523),xy(236,513),xy(230,513),xy(178,493),xy(157,472),xy(141,452),xy(124,437),xy(108,446),xy(82,467),xy(29,520),xy(17,537),xy(14,550),xy(15,576),xy(17,579),xy(14,591),xy(14,606),xy(17,622),xy(30,625),xy(49,625),xy(59,622),xy(59,599),xy(38,579),xy(18,580)]).
midline(r1, [xy(487,530),xy(483,521),xy(484,517),xy(480,512),xy(474,495),xy(476,495)]).
midline(r1, [xy(60,623),xy(88,625),xy(102,622),xy(109,617),xy(110,602),xy(114,590),xy(151,544),xy(178,494)]).
midline(r1, [xy(169,515),xy(168,516)]).
midline(r1, [xy(486,523),xy(485,519)]).
midline(r1, [xy(124,436),xy(112,385),xy(104,309),xy(105,210),xy(110,184),xy(112,154),xy(114,152),xy(119,123),xy(121,119),xy(145,106),xy(144,108),xy(208,170)]).
midline(r1, [xy(114,382),xy(146,348),xy(141,348),xy(113,378)]).
midline(r1, [xy(116,380),xy(147,347)]).
midline(r1, [xy(149,347),xy(154,344),xy(151,348)]).
midline(r1, [xy(109,619),xy(120,630),xy(130,635),xy(549,635),xy(555,631),xy(554,524)]).
midline(r1, [xy(556,526),xy(585,555),xy(585,631),xy(583,634),xy(577,635),xy(560,635),xy(555,633)]).
midline(r1, [xy(146,105),xy(166,96)]).
midline(r1, [xy(167,94),xy(190,82),xy(212,73),xy(214,74)]).
midline(r1, [xy(215,72),xy(228,68)]).
midline(r1, [xy(480,506),xy(481,507)]).
midline(r1, [xy(156,344),xy(164,342),xy(164,344)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,629),xy(613,634),xy(606,635),xy(590,635),xy(585,633)]).
midline(r1, [xy(115,153),xy(153,191),xy(148,191),xy(114,157)]).
midline(r1, [xy(147,192),xy(143,192),xy(113,162)]).
midline(r1, [xy(229,66),xy(252,58),xy(280,88)]).
midline(r1, [xy(254,58),xy(266,56),xy(287,47),xy(318,40),xy(342,39),xy(342,41)]).
midline(r1, [xy(344,39),xy(372,34),xy(449,34),xy(465,36),xy(476,40),xy(477,43),xy(473,47),xy(470,57),xy(474,53),xy(475,47)]).
midline(r1, [xy(477,40),xy(506,41),xy(527,46),xy(528,48),xy(532,47),xy(553,56),xy(578,61),xy(600,114),xy(606,143),xy(611,150),xy(614,160),xy(613,170),xy(619,182),xy(619,211),xy(625,230),xy(625,308),xy(619,327),xy(620,349)]).
midline(r1, [xy(478,44),xy(477,47)]).
midline(r1, [xy(332,533),xy(336,519),xy(335,516),xy(338,513),xy(337,505),xy(340,500),xy(342,502),xy(339,505)]).
midline(r1, [xy(338,515),xy(337,516)]).
midline(r1, [xy(341,506),xy(339,507),xy(339,512)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(166,342),xy(182,335),xy(182,337)]).
midline(r1, [xy(184,335),xy(199,327),xy(199,329)]).
midline(r1, [xy(115,376),xy(141,350)]).
midline(r1, [xy(187,204),xy(180,203),xy(175,199),xy(173,201),xy(169,198),xy(158,196),xy(154,192),xy(155,195)]).
midline(r1, [xy(186,205),xy(192,207)]).
midline(r1, [xy(175,201),xy(177,202)]).
midline(r1, [xy(204,373),xy(203,374)]).
midline(r1, [xy(205,372),xy(206,371)]).
fillpoint(r1, xy(125,438), 125.2).
fillpoint(r1, xy(123,432), 124.0).
fillpoint(r1, xy(122,428), 123.0).
fillpoint(r1, xy(121,424), 122.0).
fillpoint(r1, xy(120,420), 121.0).
fillpoint(r1, xy(120,120), 120.8).
fillpoint(r1, xy(119,124), 120.0).
fillpoint(r1, xy(119,415), 120.0).
fillpoint(r1, xy(154,468), 118.1).
fillpoint(r1, xy(117,132), 118.0).
fillpoint(r1, xy(117,407), 118.0).
fillpoint(r1, xy(159,474), 117.8).
fillpoint(r1, xy(160,475), 117.8).
fillpoint(r1, xy(169,484), 117.4).
fillpoint(r1, xy(170,485), 117.4).
fillpoint(r1, xy(174,489), 117.4).
fillpoint(r1, xy(175,490), 117.4).
fillpoint(r1, xy(116,136), 117.0).
fillpoint(r1, xy(116,403), 117.0).
fillpoint(r1, xy(115,140), 116.0).
fillpoint(r1, xy(115,399), 116.0).
fillpoint(r1, xy(181,494), 116.0).
fillpoint(r1, xy(114,145), 115.0).
fillpoint(r1, xy(114,394), 115.0).
fillpoint(r1, xy(113,150), 114.0).
fillpoint(r1, xy(113,389), 114.0).
fillpoint(r1, xy(112,156), 113.0).
fillpoint(r1, xy(112,384), 113.0).
fillpoint(r1, xy(111,163), 112.0).
fillpoint(r1, xy(111,376), 112.0).
fillpoint(r1, xy(110,173), 111.0).
fillpoint(r1, xy(110,366), 111.0).
fillpoint(r1, xy(109,186), 110.0).
fillpoint(r1, xy(109,353), 110.0).
fillpoint(r1, xy(108,191), 109.0).
fillpoint(r1, xy(108,348), 109.0).
fillpoint(r1, xy(107,197), 108.0).
fillpoint(r1, xy(107,343), 108.0).
fillpoint(r1, xy(106,204), 107.0).
fillpoint(r1, xy(106,336), 107.0).
fillpoint(r1, xy(105,213), 106.0).
fillpoint(r1, xy(105,326), 106.0).
fillpoint(r1, xy(104,270), 105.0).
fillpoint(r1, xy(221,510), 100.0).
fillpoint(r1, xy(231,513), 97.0).
fillpoint(r1, xy(235,514), 96.0).
fillpoint(r1, xy(239,515), 95.0).
fillpoint(r1, xy(244,516), 94.0).
fillpoint(r1, xy(264,523), 87.0).
fillpoint(r1, xy(553,524), 86.1).
fillpoint(r1, xy(271,525), 85.0).
fillpoint(r1, xy(548,525), 85.0).
fillpoint(r1, xy(276,526), 84.0).
fillpoint(r1, xy(543,526), 84.0).
fillpoint(r1, xy(281,527), 83.0).
fillpoint(r1, xy(538,527), 83.0).
fillpoint(r1, xy(289,529), 81.0).
fillpoint(r1, xy(530,529), 81.0).
fillpoint(r1, xy(293,530), 80.0).
fillpoint(r1, xy(526,530), 80.0).
fillpoint(r1, xy(297,531), 79.0).
fillpoint(r1, xy(522,531), 79.0).
fillpoint(r1, xy(302,532), 78.0).
fillpoint(r1, xy(518,532), 78.0).
fillpoint(r1, xy(308,533), 77.0).
fillpoint(r1, xy(512,533), 77.0).
fillpoint(r1, xy(316,534), 76.0).
fillpoint(r1, xy(504,534), 76.0).
fillpoint(r1, xy(332,535), 75.0).
fillpoint(r1, xy(486,535), 75.0).
fillpoint(r1, xy(338,536), 74.0).
fillpoint(r1, xy(481,536), 74.0).
fillpoint(r1, xy(343,537), 73.0).
fillpoint(r1, xy(476,537), 73.0).
fillpoint(r1, xy(349,538), 72.0).
fillpoint(r1, xy(471,538), 72.0).
fillpoint(r1, xy(357,539), 71.0).
fillpoint(r1, xy(463,539), 71.0).
fillpoint(r1, xy(371,540), 70.0).
fillpoint(r1, xy(242,61), 62.0).
fillpoint(r1, xy(578,61), 62.0).
fillpoint(r1, xy(245,60), 61.0).
fillpoint(r1, xy(574,60), 61.0).
fillpoint(r1, xy(248,59), 60.0).
fillpoint(r1, xy(571,59), 60.0).
fillpoint(r1, xy(252,58), 59.0).
fillpoint(r1, xy(567,58), 59.0).
fillpoint(r1, xy(256,57), 58.0).
fillpoint(r1, xy(563,57), 58.0).
fillpoint(r1, xy(582,71), 58.0).
fillpoint(r1, xy(582,468), 58.0).
fillpoint(r1, xy(261,56), 57.0).
fillpoint(r1, xy(558,56), 57.0).
fillpoint(r1, xy(281,49), 50.0).
fillpoint(r1, xy(538,49), 50.0).
fillpoint(r1, xy(288,47), 48.0).
fillpoint(r1, xy(531,47), 48.0).
fillpoint(r1, xy(293,46), 47.0).
fillpoint(r1, xy(526,46), 47.0).
fillpoint(r1, xy(299,45), 46.0).
fillpoint(r1, xy(520,45), 46.0).
fillpoint(r1, xy(303,44), 45.0).
fillpoint(r1, xy(516,44), 45.0).
fillpoint(r1, xy(595,103), 45.0).
fillpoint(r1, xy(595,436), 45.0).
fillpoint(r1, xy(306,43), 44.0).
fillpoint(r1, xy(513,43), 44.0).
fillpoint(r1, xy(314,41), 42.0).
fillpoint(r1, xy(505,41), 42.0).
fillpoint(r1, xy(320,40), 41.0).
fillpoint(r1, xy(499,40), 41.0).
fillpoint(r1, xy(344,39), 40.0).
fillpoint(r1, xy(488,39), 40.0).
fillpoint(r1, xy(351,37), 38.0).
fillpoint(r1, xy(468,37), 38.0).
fillpoint(r1, xy(602,121), 38.0).
fillpoint(r1, xy(602,418), 38.0).
fillpoint(r1, xy(355,36), 37.0).
fillpoint(r1, xy(464,36), 37.0).
fillpoint(r1, xy(603,125), 37.0).
fillpoint(r1, xy(603,414), 37.0).
fillpoint(r1, xy(361,35), 36.0).
fillpoint(r1, xy(459,35), 36.0).
fillpoint(r1, xy(604,131), 36.0).
fillpoint(r1, xy(604,409), 36.0).
fillpoint(r1, xy(371,35), 35.0).
border(r1).
region(r3, '#2ecc40', 78200, centroid(428,276)).
perimeter(r3, 2880).
polygon(r3, [xy(339,460),xy(330,460),xy(329,450),xy(310,450),xy(310,440),xy(300,440),xy(300,430),xy(290,429),xy(290,300),xy(210,300),xy(210,250),xy(289,250),xy(290,200),xy(340,199),xy(340,150),xy(290,149),xy(290,110),xy(299,110),xy(300,100),xy(309,100),xy(310,90),xy(329,90),xy(330,80),xy(339,80),xy(340,100),xy(389,100),xy(390,70),xy(400,70),xy(400,90),xy(429,90),xy(430,70),xy(439,70),xy(440,149),xy(390,150),xy(390,199),xy(439,200),xy(440,249),xy(390,250),xy(390,299),xy(439,300),xy(440,350),xy(489,350),xy(490,90),xy(509,90),xy(510,99),xy(519,100),xy(520,110),xy(539,110),xy(540,119),xy(549,120),xy(550,129),xy(559,130),xy(560,139),xy(570,140),xy(570,159),xy(579,160),xy(580,169),xy(590,170),xy(590,369),xy(580,370),xy(579,380),xy(570,380),xy(570,399),xy(560,400),xy(560,409),xy(550,410),xy(550,419),xy(540,420),xy(539,430),xy(520,430),xy(520,439),xy(510,440),xy(509,450),xy(390,450),xy(390,350),xy(340,350),xy(339,460)]).
hole(r3, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
hole(r3, [xy(570,339),xy(570,330),xy(580,329),xy(580,320),xy(570,320),xy(569,310),xy(560,310),xy(560,319),xy(550,320),xy(550,329),xy(559,330),xy(560,340),xy(570,339)]).
midline(r3, [xy(439,400),xy(427,385),xy(418,369),xy(411,330),xy(403,326),xy(376,323),xy(354,312),xy(339,299),xy(339,290),xy(336,287),xy(313,272),xy(306,256),xy(295,243),xy(295,205),xy(333,205),xy(350,218),xy(359,223),xy(365,223),xy(365,132),xy(353,126),xy(330,124),xy(324,121),xy(324,104),xy(333,95),xy(335,84)]).
midline(r3, [xy(314,275),xy(234,275)]).
midline(r3, [xy(324,122),xy(310,129)]).
midline(r3, [xy(365,131),xy(376,126),xy(399,124),xy(411,119),xy(409,110),xy(395,93),xy(395,74)]).
midline(r3, [xy(412,117),xy(433,95),xy(435,74)]).
midline(r3, [xy(339,301),xy(327,314),xy(319,328),xy(315,340),xy(314,353),xy(315,408),xy(313,410),xy(317,415),xy(324,435),xy(334,446),xy(335,455)]).
midline(r3, [xy(441,400),xy(480,400),xy(515,385)]).
midline(r3, [xy(516,383),xy(525,375)]).
midline(r3, [xy(526,373),xy(529,368),xy(521,344),xy(519,321),xy(524,296),xy(540,264),xy(540,199),xy(533,184),xy(528,160),xy(518,137),xy(507,122),xy(500,105),xy(500,99)]).
midline(r3, [xy(530,368),xy(561,361),xy(573,355),xy(585,329),xy(584,316),xy(579,310),xy(579,304),xy(575,296),xy(552,272),xy(541,264)]).
midline(r3, [xy(535,369),xy(549,381),xy(538,368)]).
midline(r3, [xy(313,268),xy(316,273)]).
midline(r3, [xy(339,288),xy(355,263),xy(365,225),xy(415,225)]).
midline(r3, [xy(483,411),xy(480,405),xy(480,402),xy(482,402)]).
midline(r3, [xy(484,412),xy(484,418),xy(486,418)]).
midline(r3, [xy(546,197),xy(542,197),xy(542,199)]).
midline(r3, [xy(546,199),xy(547,198)]).
midline(r3, [xy(552,382),xy(551,383)]).
fillpoint(r3, xy(339,290), 51.0).
fillpoint(r3, xy(539,232), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(490,395), 46.0).
fillpoint(r3, xy(534,186), 45.0).
fillpoint(r3, xy(495,393), 44.4).
fillpoint(r3, xy(533,183), 44.0).
fillpoint(r3, xy(527,371), 43.9).
fillpoint(r3, xy(511,387), 43.9).
fillpoint(r3, xy(498,392), 43.9).
fillpoint(r3, xy(525,374), 43.6).
fillpoint(r3, xy(524,375), 43.6).
fillpoint(r3, xy(515,384), 43.6).
fillpoint(r3, xy(514,385), 43.6).
fillpoint(r3, xy(528,369), 43.4).
fillpoint(r3, xy(509,388), 43.4).
fillpoint(r3, xy(500,391), 43.4).
fillpoint(r3, xy(506,389), 43.3).
fillpoint(r3, xy(503,390), 43.3).
fillpoint(r3, xy(531,175), 42.0).
fillpoint(r3, xy(530,169), 41.0).
fillpoint(r3, xy(365,225), 35.4).
fillpoint(r3, xy(361,236), 32.0).
fillpoint(r3, xy(358,253), 32.0).
fillpoint(r3, xy(521,306), 32.0).
fillpoint(r3, xy(521,343), 32.0).
fillpoint(r3, xy(365,131), 31.4).
fillpoint(r3, xy(360,241), 31.1).
fillpoint(r3, xy(359,248), 31.1).
fillpoint(r3, xy(520,312), 31.0).
fillpoint(r3, xy(520,338), 31.0).
fillpoint(r3, xy(519,325), 30.0).
fillpoint(r3, xy(410,120), 29.7).
fillpoint(r3, xy(410,329), 29.7).
fillpoint(r3, xy(411,118), 29.0).
fillpoint(r3, xy(408,121), 29.0).
fillpoint(r3, xy(358,128), 29.0).
fillpoint(r3, xy(371,128), 29.0).
fillpoint(r3, xy(518,138), 29.0).
fillpoint(r3, xy(371,321), 29.0).
fillpoint(r3, xy(408,328), 29.0).
fillpoint(r3, xy(318,331), 29.0).
fillpoint(r3, xy(411,331), 29.0).
fillpoint(r3, xy(418,368), 29.0).
fillpoint(r3, xy(405,122), 28.0).
fillpoint(r3, xy(355,127), 28.0).
fillpoint(r3, xy(374,127), 28.0).
fillpoint(r3, xy(374,322), 28.0).
fillpoint(r3, xy(405,327), 28.0).
fillpoint(r3, xy(317,334), 28.0).
fillpoint(r3, xy(412,334), 28.0).
fillpoint(r3, xy(417,365), 28.0).
fillpoint(r3, xy(325,122), 27.5).
fillpoint(r3, xy(327,123), 27.0).
fillpoint(r3, xy(402,123), 27.0).
fillpoint(r3, xy(352,126), 27.0).
fillpoint(r3, xy(377,126), 27.0).
fillpoint(r3, xy(377,323), 27.0).
fillpoint(r3, xy(402,326), 27.0).
fillpoint(r3, xy(316,337), 27.0).
fillpoint(r3, xy(413,337), 27.0).
fillpoint(r3, xy(416,362), 27.0).
fillpoint(r3, xy(332,124), 26.0).
fillpoint(r3, xy(398,124), 26.0).
fillpoint(r3, xy(348,125), 26.0).
fillpoint(r3, xy(382,125), 26.0).
fillpoint(r3, xy(382,324), 26.0).
fillpoint(r3, xy(398,325), 26.0).
fillpoint(r3, xy(315,342), 26.0).
fillpoint(r3, xy(414,342), 26.0).
fillpoint(r3, xy(415,358), 26.0).
fillpoint(r3, xy(364,175), 25.0).
fillpoint(r3, xy(391,225), 25.0).
fillpoint(r3, xy(234,275), 25.0).
fillpoint(r3, xy(314,381), 25.0).
fillpoint(r3, xy(570,356), 17.0).
fillpoint(r3, xy(573,355), 16.5).
fillpoint(r3, xy(505,115), 16.0).
fillpoint(r3, xy(324,434), 16.0).
region(r6, '#ffdc00', 15100, centroid(458,204)).
perimeter(r6, 760).
polygon(r6, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,150),xy(440,149),xy(440,70),xy(449,70),xy(450,80),xy(490,80),xy(489,350)]).
midline(r6, [xy(469,299),xy(468,288),xy(464,280),xy(465,190),xy(462,173),xy(458,169),xy(409,170)]).
midline(r6, [xy(470,300),xy(470,330)]).
midline(r6, [xy(460,169),xy(465,149),xy(465,105),xy(446,85),xy(445,74)]).
fillpoint(r6, xy(460,170), 29.0).
fillpoint(r6, xy(462,165), 28.0).
fillpoint(r6, xy(462,174), 28.0).
fillpoint(r6, xy(463,162), 27.0).
fillpoint(r6, xy(463,177), 27.0).
fillpoint(r6, xy(464,158), 26.0).
fillpoint(r6, xy(464,182), 26.0).
fillpoint(r6, xy(465,126), 25.0).
fillpoint(r6, xy(464,236), 25.0).
fillpoint(r6, xy(469,293), 21.0).
fillpoint(r6, xy(409,170), 20.0).
fillpoint(r6, xy(469,316), 20.0).
region(r7, '#ffdc00', 9600, centroid(274,190)).
perimeter(r7, 540).
polygon(r7, [xy(289,250),xy(210,249),xy(210,230),xy(220,229),xy(220,200),xy(240,199),xy(240,160),xy(250,159),xy(250,140),xy(259,140),xy(260,130),xy(269,130),xy(270,120),xy(280,119),xy(280,110),xy(290,110),xy(290,150),xy(340,150),xy(340,199),xy(290,200),xy(289,250)]).
midline(r7, [xy(281,127),xy(270,157),xy(275,174),xy(267,182),xy(263,180),xy(267,185),xy(264,209),xy(260,220),xy(244,224),xy(233,235),xy(219,240)]).
midline(r7, [xy(282,126),xy(285,114)]).
midline(r7, [xy(276,174),xy(315,175)]).
fillpoint(r7, xy(274,175), 29.7).
fillpoint(r7, xy(260,220), 29.7).
fillpoint(r7, xy(269,180), 29.0).
fillpoint(r7, xy(268,181), 29.0).
fillpoint(r7, xy(261,218), 29.0).
fillpoint(r7, xy(258,221), 29.0).
fillpoint(r7, xy(267,184), 28.0).
fillpoint(r7, xy(262,215), 28.0).
fillpoint(r7, xy(255,222), 28.0).
fillpoint(r7, xy(266,187), 27.0).
fillpoint(r7, xy(263,212), 27.0).
fillpoint(r7, xy(252,223), 27.0).
fillpoint(r7, xy(265,192), 26.0).
fillpoint(r7, xy(264,208), 26.0).
fillpoint(r7, xy(248,224), 26.0).
fillpoint(r7, xy(291,175), 25.0).
fillpoint(r7, xy(274,145), 16.0).
fillpoint(r7, xy(279,134), 11.0).
fillpoint(r7, xy(224,239), 11.0).
region(r22, '#ffdc00', 6800, centroid(381,423)).
perimeter(r22, 520).
polygon(r22, [xy(449,470),xy(370,470),xy(369,460),xy(340,459),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(489,460),xy(450,460),xy(449,470)]).
midline(r22, [xy(427,459),xy(390,460),xy(380,456),xy(375,446),xy(364,435),xy(365,384)]).
midline(r22, [xy(428,460),xy(440,460),xy(450,454),xy(485,455)]).
fillpoint(r22, xy(364,410), 25.0).
fillpoint(r22, xy(381,457), 12.0).
fillpoint(r22, xy(385,459), 11.0).
fillpoint(r22, xy(391,460), 10.0).
region(r15, '#ffdc00', 6500, centroid(260,349)).
perimeter(r15, 420).
polygon(r15, [xy(289,430),xy(280,430),xy(280,420),xy(270,420),xy(270,410),xy(260,410),xy(259,400),xy(250,399),xy(250,380),xy(240,379),xy(240,350),xy(220,349),xy(220,310),xy(210,309),xy(210,300),xy(290,300),xy(289,430)]).
midline(r15, [xy(264,356),xy(259,361),xy(261,361)]).
midline(r15, [xy(264,359),xy(269,372),xy(269,382),xy(279,404),xy(279,410),xy(284,416),xy(285,425)]).
midline(r15, [xy(265,355),xy(264,340),xy(259,328),xy(245,325),xy(225,306),xy(214,305)]).
fillpoint(r15, xy(260,329), 29.7).
fillpoint(r15, xy(258,328), 29.0).
fillpoint(r15, xy(261,331), 29.0).
fillpoint(r15, xy(255,327), 28.0).
fillpoint(r15, xy(262,334), 28.0).
fillpoint(r15, xy(252,326), 27.0).
fillpoint(r15, xy(263,337), 27.0).
fillpoint(r15, xy(248,325), 26.0).
fillpoint(r15, xy(264,342), 26.0).
fillpoint(r15, xy(264,356), 25.0).
fillpoint(r15, xy(269,373), 21.0).
fillpoint(r15, xy(269,382), 20.0).
fillpoint(r15, xy(274,394), 16.0).
fillpoint(r15, xy(279,405), 11.0).
region(r25, '#2ecc40', 5200, centroid(260,620)).
perimeter(r25, 560).
polygon(r25, [xy(389,630),xy(130,630),xy(130,610),xy(389,610),xy(389,630)]).
midline(r25, [xy(279,620),xy(139,620)]).
midline(r25, [xy(280,619),xy(380,620)]).
fillpoint(r25, xy(139,620), 10.0).
region(r26, '#5a5a5a', 3200, centroid(470,620)).
perimeter(r26, 360).
polygon(r26, [xy(549,630),xy(390,630),xy(390,610),xy(549,610),xy(549,630)]).
midline(r26, [xy(539,620),xy(399,620)]).
midline(r26, [xy(540,620),xy(540,619)]).
fillpoint(r26, xy(399,620), 10.0).
region(r10, '#ffdc00', 2400, centroid(598,270)).
perimeter(r10, 360).
polygon(r10, [xy(599,350),xy(590,349),xy(590,190),xy(600,190),xy(600,229),xy(610,230),xy(610,309),xy(600,310),xy(599,350)]).
midline(r10, [xy(595,335),xy(594,311),xy(596,304),xy(600,300),xy(600,239),xy(596,235),xy(594,228),xy(595,194)]).
midline(r10, [xy(594,336),xy(595,345)]).
fillpoint(r10, xy(599,270), 10.0).
fillpoint(r10, xy(595,211), 5.0).
fillpoint(r10, xy(595,328), 5.0).
region(r23, '#7fdbff', 2000, centroid(64,576)).
perimeter(r23, 240).
polygon(r23, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r23, [xy(51,560),xy(39,560)]).
midline(r23, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r23, xy(58,561), 12.0).
fillpoint(r23, xy(61,578), 12.0).
fillpoint(r23, xy(78,581), 12.0).
fillpoint(r23, xy(54,560), 11.0).
fillpoint(r23, xy(59,565), 11.0).
fillpoint(r23, xy(60,574), 11.0).
fillpoint(r23, xy(65,579), 11.0).
fillpoint(r23, xy(74,580), 11.0).
fillpoint(r23, xy(79,585), 11.0).
fillpoint(r23, xy(39,560), 10.0).
fillpoint(r23, xy(79,596), 10.0).
region(r14, '#870c25', 1500, centroid(414,284)).
perimeter(r14, 160).
polygon(r14, [xy(439,300),xy(390,300),xy(390,270),xy(439,270),xy(439,300)]).
midline(r14, [xy(410,285),xy(404,285)]).
midline(r14, [xy(411,285),xy(425,285)]).
fillpoint(r14, xy(404,285), 15.0).
region(r2, '#ffdc00', 1200, centroid(367,87)).
perimeter(r2, 160).
polygon(r2, [xy(389,100),xy(340,100),xy(340,80),xy(369,80),xy(370,70),xy(389,70),xy(389,100)]).
midline(r2, [xy(354,90),xy(349,90)]).
midline(r2, [xy(355,89),xy(375,89),xy(378,87),xy(380,79)]).
fillpoint(r2, xy(377,88), 12.0).
fillpoint(r2, xy(379,84), 11.0).
fillpoint(r2, xy(374,89), 11.0).
fillpoint(r2, xy(349,90), 10.0).
region(r13, '#bebebe', 1000, centroid(414,260)).
perimeter(r13, 140).
polygon(r13, [xy(439,270),xy(390,270),xy(390,250),xy(439,250),xy(439,270)]).
midline(r13, [xy(409,260),xy(399,260)]).
midline(r13, [xy(410,260),xy(430,260)]).
fillpoint(r13, xy(399,260), 10.0).
region(r11, '#5a5a5a', 800, centroid(314,224)).
perimeter(r11, 160).
polygon(r11, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r11, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r11, [xy(319,214),xy(305,215),xy(305,234),xy(319,235),xy(324,233),xy(325,220),xy(324,216),xy(320,215)]).
fillpoint(r11, xy(306,215), 6.0).
fillpoint(r11, xy(324,215), 6.0).
fillpoint(r11, xy(305,234), 6.0).
fillpoint(r11, xy(323,234), 6.0).
fillpoint(r11, xy(311,215), 5.0).
fillpoint(r11, xy(304,225), 5.0).
fillpoint(r11, xy(324,225), 5.0).
fillpoint(r11, xy(311,235), 5.0).
region(r4, '#5a5a5a', 500, centroid(414,80)).
perimeter(r4, 120).
polygon(r4, [xy(429,90),xy(400,90),xy(400,70),xy(409,70),xy(410,79),xy(419,80),xy(420,70),xy(429,70),xy(429,90)]).
midline(r4, [xy(405,81),xy(405,74)]).
midline(r4, [xy(405,82),xy(405,84),xy(410,85),xy(423,84),xy(425,74)]).
fillpoint(r4, xy(405,84), 6.0).
fillpoint(r4, xy(423,84), 6.0).
fillpoint(r4, xy(405,76), 5.0).
fillpoint(r4, xy(425,76), 5.0).
fillpoint(r4, xy(411,85), 5.0).
region(r9, '#0074d9', 500, centroid(414,194)).
perimeter(r9, 120).
polygon(r9, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r9, [xy(409,194),xy(394,195)]).
midline(r9, [xy(410,194),xy(435,195)]).
fillpoint(r9, xy(394,195), 5.0).
region(r16, '#0074d9', 500, centroid(444,324)).
perimeter(r16, 120).
polygon(r16, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r16, [xy(445,326),xy(445,304)]).
midline(r16, [xy(444,327),xy(445,345)]).
fillpoint(r16, xy(444,325), 5.0).
region(r21, '#0074d9', 500, centroid(364,354)).
perimeter(r21, 120).
polygon(r21, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r21, [xy(370,354),xy(344,355)]).
midline(r21, [xy(371,354),xy(385,355)]).
fillpoint(r21, xy(344,355), 5.0).
region(r8, '#2ecc40', 400, centroid(232,187)).
perimeter(r8, 100).
polygon(r8, [xy(239,200),xy(220,199),xy(220,190),xy(230,189),xy(230,170),xy(240,170),xy(239,200)]).
midline(r8, [xy(234,190),xy(235,174)]).
midline(r8, [xy(234,191),xy(233,194),xy(224,195)]).
fillpoint(r8, xy(233,194), 6.0).
fillpoint(r8, xy(235,181), 5.0).
fillpoint(r8, xy(224,195), 5.0).
region(r24, '#7fdbff', 400, centroid(40,600)).
perimeter(r24, 80).
polygon(r24, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r24, [xy(39,599),xy(40,600)]).
fillpoint(r24, xy(39,600), 10.0).
region(r27, '#7fdbff', 400, centroid(570,620)).
perimeter(r27, 80).
polygon(r27, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r27, [xy(569,619),xy(570,620)]).
fillpoint(r27, xy(569,620), 10.0).
region(r28, '#7fdbff', 400, centroid(600,620)).
perimeter(r28, 80).
polygon(r28, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r28, [xy(599,619),xy(600,620)]).
fillpoint(r28, xy(599,620), 10.0).
region(r29, '#2ecc40', 400, centroid(630,620)).
perimeter(r29, 80).
polygon(r29, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r29, [xy(629,619),xy(630,620)]).
fillpoint(r29, xy(629,620), 10.0).
border(r29).
region(r12, '#2ecc40', 100, centroid(314,224)).
perimeter(r12, 40).
polygon(r12, [xy(319,230),xy(310,229),xy(310,220),xy(320,220),xy(319,230)]).
midline(r12, [xy(315,225),xy(315,224)]).
fillpoint(r12, xy(314,225), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 60).
adjacent(r1, r3).
shared_edge(r1, r3, 630).
adjacent(r1, r4).
shared_edge(r1, r4, 20).
adjacent(r1, r6).
shared_edge(r1, r6, 70).
adjacent(r1, r7).
shared_edge(r1, r7, 170).
adjacent(r1, r8).
shared_edge(r1, r8, 50).
adjacent(r1, r10).
shared_edge(r1, r10, 200).
adjacent(r1, r15).
shared_edge(r1, r15, 180).
adjacent(r1, r22).
shared_edge(r1, r22, 180).
adjacent(r1, r23).
shared_edge(r1, r23, 240).
adjacent(r1, r24).
shared_edge(r1, r24, 80).
adjacent(r1, r25).
shared_edge(r1, r25, 540).
adjacent(r1, r26).
shared_edge(r1, r26, 340).
adjacent(r1, r27).
shared_edge(r1, r27, 80).
adjacent(r1, r28).
shared_edge(r1, r28, 80).
adjacent(r1, r29).
shared_edge(r1, r29, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 100).
adjacent(r3, r4).
shared_edge(r3, r4, 70).
adjacent(r3, r6).
shared_edge(r3, r6, 520).
adjacent(r3, r7).
shared_edge(r3, r7, 320).
adjacent(r3, r9).
shared_edge(r3, r9, 60).
adjacent(r3, r10).
shared_edge(r3, r10, 160).
adjacent(r3, r11).
shared_edge(r3, r11, 120).
adjacent(r3, r13).
shared_edge(r3, r13, 70).
adjacent(r3, r14).
shared_edge(r3, r14, 80).
adjacent(r3, r15).
shared_edge(r3, r15, 210).
adjacent(r3, r16).
shared_edge(r3, r16, 60).
adjacent(r3, r21).
shared_edge(r3, r21, 70).
adjacent(r3, r22).
shared_edge(r3, r22, 290).
adjacent(r6, r9).
shared_edge(r6, r9, 60).
adjacent(r6, r13).
shared_edge(r6, r13, 20).
adjacent(r6, r14).
shared_edge(r6, r14, 30).
adjacent(r6, r16).
shared_edge(r6, r16, 60).
adjacent(r7, r8).
shared_edge(r7, r8, 50).
adjacent(r11, r12).
shared_edge(r11, r12, 40).
adjacent(r13, r14).
shared_edge(r13, r14, 50).
adjacent(r21, r22).
shared_edge(r21, r22, 50).
adjacent(r25, r26).
shared_edge(r25, r26, 20).

encloses(r11, r12).
encloses(r1, r23).
encloses(r1, r24).
encloses(r1, r27).
encloses(r1, r28).
