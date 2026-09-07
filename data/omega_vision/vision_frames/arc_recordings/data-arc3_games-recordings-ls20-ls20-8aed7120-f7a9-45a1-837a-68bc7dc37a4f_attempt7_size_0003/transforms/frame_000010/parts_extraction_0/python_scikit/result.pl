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

region(r1, '#aaaaaa', 273600, centroid(276,332)).
perimeter(r1, 5240).
polygon(r1, [xy(450,469),xy(450,460),xy(489,460),xy(490,450),xy(509,450),xy(510,440),xy(520,439),xy(520,430),xy(539,430),xy(540,420),xy(549,420),xy(550,410),xy(559,410),xy(560,400),xy(570,399),xy(570,380),xy(579,380),xy(580,370),xy(590,369),xy(590,350),xy(600,349),xy(600,310),xy(610,309),xy(610,230),xy(600,229),xy(600,190),xy(590,189),xy(590,170),xy(580,170),xy(580,160),xy(570,159),xy(570,140),xy(560,140),xy(560,130),xy(550,130),xy(550,120),xy(540,119),xy(539,110),xy(520,110),xy(520,100),xy(510,99),xy(509,90),xy(490,90),xy(489,80),xy(450,80),xy(449,70),xy(406,70),xy(370,70),xy(369,80),xy(330,80),xy(329,90),xy(310,90),xy(310,99),xy(300,100),xy(299,110),xy(280,110),xy(280,119),xy(270,120),xy(270,129),xy(260,130),xy(259,140),xy(250,140),xy(250,159),xy(240,160),xy(239,170),xy(230,170),xy(230,189),xy(220,190),xy(220,229),xy(210,230),xy(210,233),xy(210,309),xy(220,310),xy(220,349),xy(230,350),xy(230,369),xy(239,370),xy(240,379),xy(250,380),xy(250,399),xy(259,400),xy(260,409),xy(269,410),xy(270,419),xy(279,420),xy(280,430),xy(299,430),xy(300,439),xy(309,440),xy(310,450),xy(329,450),xy(330,460),xy(369,460),xy(370,470),xy(450,469)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(619,350),xy(619,327),xy(624,316),xy(625,305),xy(625,231),xy(619,212),xy(619,182),xy(613,169),xy(614,160),xy(606,143),xy(600,114),xy(577,61),xy(553,56),xy(532,47),xy(501,40),xy(476,40),xy(465,36),xy(449,34),xy(370,34),xy(354,36),xy(343,40),xy(318,40),xy(287,47),xy(266,56),xy(241,61),xy(190,82),xy(121,119),xy(115,139),xy(105,210),xy(105,329),xy(115,400),xy(136,473),xy(109,502),xy(84,538),xy(70,569),xy(73,571),xy(76,581),xy(78,581)]).
midline(r1, [xy(251,60),xy(281,90)]).
midline(r1, [xy(129,446),xy(207,368),xy(210,368),xy(130,448)]).
midline(r1, [xy(137,474),xy(220,510),xy(236,513),xy(270,525),xy(313,534),xy(326,534),xy(335,525),xy(338,514),xy(336,510),xy(341,505),xy(344,492),xy(346,492)]).
midline(r1, [xy(328,534),xy(331,534),xy(334,528)]).
midline(r1, [xy(339,512),xy(338,510)]).
midline(r1, [xy(477,41),xy(468,57),xy(470,57)]).
midline(r1, [xy(474,49),xy(475,48)]).
midline(r1, [xy(332,534),xy(347,538),xy(370,540),xy(447,540),xy(486,535),xy(486,524),xy(483,521),xy(475,497),xy(477,495)]).
midline(r1, [xy(484,518),xy(486,514),xy(481,509),xy(481,501),xy(477,497)]).
midline(r1, [xy(486,517),xy(488,520),xy(485,521)]).
midline(r1, [xy(482,506),xy(483,507)]).
midline(r1, [xy(488,535),xy(487,523),xy(489,521),xy(490,526),xy(491,523)]).
midline(r1, [xy(490,531),xy(492,533),xy(490,534)]).
midline(r1, [xy(493,534),xy(497,533),xy(491,527),xy(493,525),xy(500,532),xy(498,534)]).
midline(r1, [xy(565,60),xy(538,87),xy(538,90),xy(568,60)]).
midline(r1, [xy(78,583),xy(90,600),xy(120,630),xy(131,635),xy(548,635),xy(553,634),xy(555,631),xy(554,528),xy(556,526),xy(553,523),xy(523,531),xy(500,534)]).
midline(r1, [xy(555,633),xy(579,635),xy(585,632),xy(585,555),xy(557,527)]).
midline(r1, [xy(554,522),xy(555,519),xy(508,472),xy(557,517),xy(566,496),xy(572,489),xy(581,471),xy(600,425),xy(606,396),xy(613,383),xy(613,370),xy(618,361),xy(619,351)]).
midline(r1, [xy(586,556),xy(615,586),xy(615,632),xy(608,635),xy(585,633)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(113,376),xy(115,374)]).
midline(r1, [xy(141,348),xy(152,345),xy(153,348),xy(155,344),xy(157,345),xy(164,341),xy(161,344)]).
midline(r1, [xy(166,341),xy(170,339),xy(169,342)]).
midline(r1, [xy(172,341),xy(173,338),xy(178,338),xy(197,328),xy(196,331)]).
midline(r1, [xy(133,182),xy(114,161),xy(143,192),xy(154,193),xy(154,195)]).
midline(r1, [xy(156,194),xy(158,196),xy(163,195),xy(162,197)]).
midline(r1, [xy(164,198),xy(166,196),xy(166,198)]).
midline(r1, [xy(168,198),xy(171,198),xy(171,200)]).
midline(r1, [xy(173,200),xy(178,202),xy(177,199)]).
midline(r1, [xy(179,203),xy(180,202)]).
fillpoint(r1, xy(135,474), 136.0).
fillpoint(r1, xy(133,465), 134.0).
fillpoint(r1, xy(132,461), 133.0).
fillpoint(r1, xy(131,457), 132.0).
fillpoint(r1, xy(129,451), 130.0).
fillpoint(r1, xy(128,448), 129.0).
fillpoint(r1, xy(127,445), 128.0).
fillpoint(r1, xy(126,442), 127.0).
fillpoint(r1, xy(125,439), 126.0).
fillpoint(r1, xy(123,432), 124.0).
fillpoint(r1, xy(122,428), 123.0).
fillpoint(r1, xy(121,424), 122.0).
fillpoint(r1, xy(120,420), 121.0).
fillpoint(r1, xy(120,120), 120.8).
fillpoint(r1, xy(119,124), 120.0).
fillpoint(r1, xy(119,415), 120.0).
fillpoint(r1, xy(117,132), 118.0).
fillpoint(r1, xy(117,407), 118.0).
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
region(r3, '#2ecc40', 78700, centroid(429,276)).
perimeter(r3, 2760).
polygon(r3, [xy(339,460),xy(330,460),xy(329,450),xy(310,450),xy(310,440),xy(300,440),xy(300,430),xy(290,429),xy(290,300),xy(210,300),xy(210,250),xy(289,250),xy(290,200),xy(340,199),xy(340,150),xy(290,149),xy(290,110),xy(299,110),xy(300,100),xy(309,100),xy(310,90),xy(329,90),xy(330,80),xy(339,80),xy(340,100),xy(389,100),xy(390,70),xy(400,70),xy(400,90),xy(429,90),xy(430,70),xy(439,70),xy(440,149),xy(390,150),xy(390,199),xy(439,200),xy(440,249),xy(390,250),xy(390,299),xy(439,300),xy(440,350),xy(489,350),xy(490,90),xy(509,90),xy(510,99),xy(519,100),xy(520,110),xy(539,110),xy(540,119),xy(549,120),xy(550,129),xy(559,130),xy(560,139),xy(570,140),xy(570,159),xy(579,160),xy(580,169),xy(590,170),xy(590,369),xy(580,370),xy(579,380),xy(570,380),xy(570,399),xy(560,400),xy(560,409),xy(550,410),xy(550,419),xy(540,420),xy(539,430),xy(520,430),xy(520,439),xy(510,440),xy(509,450),xy(390,450),xy(390,350),xy(340,350),xy(339,460)]).
hole(r3, [xy(330,239),xy(329,210),xy(300,210),xy(300,240),xy(330,239)]).
midline(r3, [xy(439,400),xy(427,385),xy(418,369),xy(411,331),xy(403,326),xy(373,322),xy(350,309),xy(339,298),xy(339,290),xy(320,278),xy(313,271),xy(307,257),xy(295,243),xy(295,205),xy(333,205),xy(345,215),xy(364,225),xy(355,263),xy(339,288)]).
midline(r3, [xy(339,300),xy(322,322),xy(316,336),xy(314,350),xy(314,410),xy(324,435),xy(334,446),xy(335,455)]).
midline(r3, [xy(441,400),xy(479,399),xy(479,405),xy(488,421),xy(487,424),xy(489,424)]).
midline(r3, [xy(481,401),xy(482,407)]).
midline(r3, [xy(316,276),xy(314,274),xy(234,275)]).
midline(r3, [xy(481,399),xy(502,390),xy(504,391)]).
midline(r3, [xy(505,389),xy(515,385)]).
midline(r3, [xy(516,383),xy(525,375)]).
midline(r3, [xy(526,373),xy(540,340),xy(539,202),xy(541,200),xy(533,184),xy(528,160),xy(518,137),xy(507,122),xy(500,105),xy(500,99)]).
midline(r3, [xy(334,87),xy(335,84)]).
midline(r3, [xy(335,88),xy(333,95),xy(324,104),xy(325,121),xy(310,129)]).
midline(r3, [xy(325,122),xy(353,126),xy(364,132),xy(380,125),xy(409,121),xy(412,117),xy(395,93),xy(395,74)]).
midline(r3, [xy(365,133),xy(365,224),xy(415,225)]).
midline(r3, [xy(413,116),xy(433,95),xy(435,74)]).
midline(r3, [xy(519,132),xy(518,133)]).
midline(r3, [xy(555,194),xy(545,198),xy(542,197),xy(542,199)]).
midline(r3, [xy(555,196),xy(561,191),xy(567,190),xy(571,186),xy(571,188)]).
midline(r3, [xy(542,340),xy(542,342),xy(552,342),xy(552,344)]).
midline(r3, [xy(521,130),xy(520,131)]).
midline(r3, [xy(522,127),xy(523,128)]).
fillpoint(r3, xy(339,290), 51.0).
fillpoint(r3, xy(539,270), 50.0).
fillpoint(r3, xy(439,400), 50.0).
fillpoint(r3, xy(535,350), 46.0).
fillpoint(r3, xy(490,395), 46.0).
fillpoint(r3, xy(534,186), 45.0).
fillpoint(r3, xy(533,355), 44.4).
fillpoint(r3, xy(495,393), 44.4).
fillpoint(r3, xy(533,183), 44.0).
fillpoint(r3, xy(532,358), 43.9).
fillpoint(r3, xy(527,371), 43.9).
fillpoint(r3, xy(511,387), 43.9).
fillpoint(r3, xy(498,392), 43.9).
fillpoint(r3, xy(525,374), 43.6).
fillpoint(r3, xy(524,375), 43.6).
fillpoint(r3, xy(515,384), 43.6).
fillpoint(r3, xy(514,385), 43.6).
fillpoint(r3, xy(531,360), 43.4).
fillpoint(r3, xy(528,369), 43.4).
fillpoint(r3, xy(509,388), 43.4).
fillpoint(r3, xy(500,391), 43.4).
fillpoint(r3, xy(530,363), 43.3).
fillpoint(r3, xy(529,366), 43.3).
fillpoint(r3, xy(506,389), 43.3).
fillpoint(r3, xy(503,390), 43.3).
fillpoint(r3, xy(531,175), 42.0).
fillpoint(r3, xy(530,169), 41.0).
fillpoint(r3, xy(365,225), 35.4).
fillpoint(r3, xy(361,236), 32.0).
fillpoint(r3, xy(358,253), 32.0).
fillpoint(r3, xy(365,131), 31.4).
fillpoint(r3, xy(360,241), 31.1).
fillpoint(r3, xy(359,248), 31.1).
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
fillpoint(r3, xy(505,115), 16.0).
fillpoint(r3, xy(324,434), 16.0).
region(r6, '#ffdc00', 15100, centroid(458,204)).
perimeter(r6, 760).
polygon(r6, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,190),xy(390,189),xy(390,150),xy(440,149),xy(440,70),xy(449,70),xy(450,80),xy(490,80),xy(489,350)]).
midline(r6, [xy(469,299),xy(469,292),xy(464,279),xy(465,191),xy(462,173),xy(456,169),xy(409,170)]).
midline(r6, [xy(470,300),xy(470,330)]).
midline(r6, [xy(461,169),xy(465,148),xy(465,106),xy(446,85),xy(445,74)]).
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
midline(r7, [xy(281,127),xy(270,157),xy(275,174),xy(268,181),xy(259,179),xy(262,182),xy(264,181),xy(265,184),xy(267,183),xy(261,219),xy(253,223),xy(244,224),xy(233,235),xy(219,240)]).
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
region(r19, '#ffdc00', 6800, centroid(381,423)).
perimeter(r19, 520).
polygon(r19, [xy(449,470),xy(370,470),xy(369,460),xy(340,459),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(489,460),xy(450,460),xy(449,470)]).
midline(r19, [xy(457,454),xy(446,455),xy(440,460),xy(384,459),xy(364,435)]).
midline(r19, [xy(458,454),xy(485,455)]).
midline(r19, [xy(365,433),xy(365,384)]).
fillpoint(r19, xy(364,410), 25.0).
fillpoint(r19, xy(381,457), 12.0).
fillpoint(r19, xy(385,459), 11.0).
fillpoint(r19, xy(391,460), 10.0).
region(r15, '#ffdc00', 6500, centroid(260,349)).
perimeter(r15, 420).
polygon(r15, [xy(289,430),xy(280,430),xy(280,420),xy(270,420),xy(270,410),xy(260,410),xy(259,400),xy(250,399),xy(250,380),xy(240,379),xy(240,350),xy(220,349),xy(220,310),xy(210,309),xy(210,300),xy(290,300),xy(289,430)]).
midline(r15, [xy(279,409),xy(279,404),xy(269,382),xy(269,372),xy(264,360),xy(264,341),xy(261,331),xy(256,327),xy(245,325),xy(225,306),xy(214,305)]).
midline(r15, [xy(279,410),xy(284,416),xy(285,425)]).
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
region(r21, '#5a5a5a', 4400, centroid(440,620)).
perimeter(r21, 480).
polygon(r21, [xy(549,630),xy(330,630),xy(330,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(479,620),xy(339,620)]).
midline(r21, [xy(480,620),xy(540,620)]).
fillpoint(r21, xy(339,620), 10.0).
region(r20, '#2ecc40', 4000, centroid(230,620)).
perimeter(r20, 440).
polygon(r20, [xy(329,630),xy(130,630),xy(130,610),xy(329,610),xy(329,630)]).
midline(r20, [xy(163,619),xy(139,620)]).
midline(r20, [xy(164,620),xy(320,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r10, '#ffdc00', 2400, centroid(598,270)).
perimeter(r10, 360).
polygon(r10, [xy(599,350),xy(590,349),xy(590,190),xy(600,190),xy(600,229),xy(610,230),xy(610,309),xy(600,310),xy(599,350)]).
midline(r10, [xy(595,207),xy(595,194)]).
midline(r10, [xy(594,208),xy(594,229),xy(600,239),xy(600,300),xy(595,306),xy(595,345)]).
fillpoint(r10, xy(599,270), 10.0).
fillpoint(r10, xy(595,211), 5.0).
fillpoint(r10, xy(595,328), 5.0).
region(r14, '#870c25', 1500, centroid(414,284)).
perimeter(r14, 160).
polygon(r14, [xy(439,300),xy(390,300),xy(390,270),xy(439,270),xy(439,300)]).
midline(r14, [xy(410,285),xy(404,285)]).
midline(r14, [xy(411,285),xy(425,285)]).
fillpoint(r14, xy(404,285), 15.0).
region(r2, '#ffdc00', 1200, centroid(367,87)).
perimeter(r2, 160).
polygon(r2, [xy(389,100),xy(340,100),xy(340,80),xy(369,80),xy(370,70),xy(389,70),xy(389,100)]).
midline(r2, [xy(365,90),xy(349,90)]).
midline(r2, [xy(366,89),xy(377,88),xy(380,79)]).
fillpoint(r2, xy(377,88), 12.0).
fillpoint(r2, xy(379,84), 11.0).
fillpoint(r2, xy(374,89), 11.0).
fillpoint(r2, xy(349,90), 10.0).
region(r13, '#bebebe', 1000, centroid(414,260)).
perimeter(r13, 140).
polygon(r13, [xy(439,270),xy(390,270),xy(390,250),xy(439,250),xy(439,270)]).
midline(r13, [xy(409,260),xy(399,260)]).
midline(r13, [xy(410,259),xy(430,260)]).
fillpoint(r13, xy(399,260), 10.0).
region(r11, '#5a5a5a', 800, centroid(314,224)).
perimeter(r11, 160).
polygon(r11, [xy(329,240),xy(300,239),xy(300,210),xy(330,210),xy(329,240)]).
hole(r11, [xy(320,229),xy(319,220),xy(310,220),xy(310,230),xy(320,229)]).
midline(r11, [xy(324,232),xy(325,220),xy(323,215),xy(305,215),xy(304,221),xy(305,234),xy(324,234)]).
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
midline(r4, [xy(405,82),xy(405,84),xy(411,85),xy(423,84),xy(425,74)]).
fillpoint(r4, xy(405,84), 6.0).
fillpoint(r4, xy(423,84), 6.0).
fillpoint(r4, xy(405,76), 5.0).
fillpoint(r4, xy(425,76), 5.0).
fillpoint(r4, xy(411,85), 5.0).
region(r9, '#0074d9', 500, centroid(414,194)).
perimeter(r9, 120).
polygon(r9, [xy(439,200),xy(390,200),xy(390,190),xy(439,190),xy(439,200)]).
midline(r9, [xy(420,194),xy(394,195)]).
midline(r9, [xy(421,194),xy(435,195)]).
fillpoint(r9, xy(394,195), 5.0).
region(r16, '#0074d9', 500, centroid(444,324)).
perimeter(r16, 120).
polygon(r16, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r16, [xy(445,329),xy(445,304)]).
midline(r16, [xy(444,330),xy(445,345)]).
fillpoint(r16, xy(444,325), 5.0).
region(r18, '#0074d9', 500, centroid(364,354)).
perimeter(r18, 120).
polygon(r18, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r18, [xy(370,354),xy(344,355)]).
midline(r18, [xy(371,354),xy(385,355)]).
fillpoint(r18, xy(344,355), 5.0).
region(r8, '#2ecc40', 400, centroid(232,187)).
perimeter(r8, 100).
polygon(r8, [xy(239,200),xy(220,199),xy(220,190),xy(230,189),xy(230,170),xy(240,170),xy(239,200)]).
midline(r8, [xy(234,190),xy(235,174)]).
midline(r8, [xy(234,191),xy(233,194),xy(224,195)]).
fillpoint(r8, xy(233,194), 6.0).
fillpoint(r8, xy(235,181), 5.0).
fillpoint(r8, xy(224,195), 5.0).
region(r22, '#7fdbff', 400, centroid(570,620)).
perimeter(r22, 80).
polygon(r22, [xy(579,630),xy(560,629),xy(560,610),xy(580,610),xy(579,630)]).
midline(r22, [xy(569,619),xy(570,620)]).
fillpoint(r22, xy(569,620), 10.0).
region(r23, '#7fdbff', 400, centroid(600,620)).
perimeter(r23, 80).
polygon(r23, [xy(609,630),xy(590,629),xy(590,610),xy(610,610),xy(609,630)]).
midline(r23, [xy(599,619),xy(600,620)]).
fillpoint(r23, xy(599,620), 10.0).
region(r24, '#7fdbff', 400, centroid(630,620)).
perimeter(r24, 80).
polygon(r24, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r24, [xy(629,619),xy(630,620)]).
fillpoint(r24, xy(629,620), 10.0).
border(r24).
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
adjacent(r1, r19).
shared_edge(r1, r19, 180).
adjacent(r1, r20).
shared_edge(r1, r20, 420).
adjacent(r1, r21).
shared_edge(r1, r21, 460).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 60).
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
adjacent(r3, r18).
shared_edge(r3, r18, 70).
adjacent(r3, r19).
shared_edge(r3, r19, 290).
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
adjacent(r18, r19).
shared_edge(r18, r19, 50).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r11, r12).
encloses(r1, r22).
encloses(r1, r23).
