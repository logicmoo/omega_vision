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

region(r1, '#aaaaaa', 273600, centroid(279,263)).
perimeter(r1, 5520).
polygon(r1, [xy(510,599),xy(510,590),xy(519,590),xy(520,580),xy(539,580),xy(540,570),xy(549,570),xy(550,560),xy(559,560),xy(560,550),xy(570,549),xy(570,530),xy(579,530),xy(580,520),xy(590,519),xy(590,500),xy(600,499),xy(600,460),xy(610,459),xy(610,380),xy(600,379),xy(600,340),xy(590,339),xy(590,320),xy(580,320),xy(580,310),xy(570,309),xy(570,290),xy(560,290),xy(560,280),xy(550,280),xy(550,270),xy(540,269),xy(539,260),xy(520,260),xy(520,250),xy(510,250),xy(509,240),xy(490,240),xy(489,230),xy(450,230),xy(449,220),xy(370,220),xy(369,230),xy(330,230),xy(329,240),xy(310,240),xy(310,249),xy(300,250),xy(299,260),xy(280,260),xy(280,269),xy(270,270),xy(270,279),xy(260,280),xy(259,290),xy(250,290),xy(250,309),xy(240,310),xy(240,319),xy(230,320),xy(230,339),xy(220,340),xy(220,379),xy(210,380),xy(210,459),xy(220,460),xy(220,499),xy(230,500),xy(230,519),xy(239,520),xy(240,529),xy(250,530),xy(250,549),xy(259,550),xy(260,559),xy(269,560),xy(270,569),xy(280,570),xy(280,580),xy(299,580),xy(300,589),xy(309,590),xy(310,600),xy(510,599)]).
hole(r1, [xy(550,629),xy(549,610),xy(130,610),xy(130,630),xy(550,629)]).
hole(r1, [xy(90,609),xy(90,570),xy(70,570),xy(69,550),xy(30,550),xy(30,569),xy(50,570),xy(50,589),xy(30,590),xy(30,610),xy(49,610),xy(50,590),xy(69,590),xy(70,610),xy(90,609)]).
hole(r1, [xy(580,629),xy(579,610),xy(560,610),xy(560,630),xy(580,629)]).
hole(r1, [xy(610,629),xy(609,610),xy(590,610),xy(590,630),xy(610,629)]).
hole(r1, [xy(639,610),xy(620,610),xy(620,629),xy(639,630)]).
midline(r1, [xy(624,465),xy(625,381),xy(622,367),xy(618,362),xy(620,360),xy(619,332),xy(614,319),xy(613,306),xy(606,293),xy(602,270),xy(581,218),xy(555,171),xy(507,219),xy(555,173)]).
midline(r1, [xy(624,466),xy(619,477),xy(619,507),xy(613,521),xy(613,533),xy(606,546),xy(602,569),xy(593,575),xy(586,576),xy(584,579),xy(572,582),xy(555,591),xy(546,594),xy(534,594),xy(509,605),xy(310,605),xy(285,594),xy(280,595),xy(267,592),xy(214,569),xy(202,560),xy(180,551),xy(156,536),xy(137,500),xy(104,450),xy(86,463),xy(30,519),xy(19,533),xy(15,543),xy(14,558),xy(17,580),xy(14,590),xy(14,609),xy(17,622),xy(30,625),xy(49,625),xy(60,622),xy(60,600),xy(39,579),xy(18,579)]).
midline(r1, [xy(105,449),xy(104,380),xy(112,304),xy(115,298),xy(114,294),xy(123,256),xy(136,213),xy(159,157),xy(186,146),xy(241,129),xy(293,117),xy(323,115),xy(341,111),xy(449,109),xy(519,116),xy(488,149),xy(487,159),xy(483,168),xy(484,171),xy(472,199),xy(474,199)]).
midline(r1, [xy(115,303),xy(152,340),xy(150,342),xy(114,306)]).
midline(r1, [xy(141,506),xy(148,499),xy(146,497),xy(138,499)]).
midline(r1, [xy(113,312),xy(140,341),xy(149,343)]).
midline(r1, [xy(489,154),xy(523,120),xy(522,117)]).
midline(r1, [xy(144,499),xy(139,504)]).
midline(r1, [xy(521,119),xy(490,150)]).
midline(r1, [xy(481,180),xy(482,184),xy(480,184)]).
midline(r1, [xy(483,182),xy(485,180),xy(483,175)]).
midline(r1, [xy(601,571),xy(615,585),xy(615,632),xy(609,635),xy(585,633),xy(578,635),xy(555,633),xy(548,635),xy(130,635),xy(124,633),xy(108,618),xy(96,624),xy(71,625),xy(61,623)]).
midline(r1, [xy(555,632),xy(555,592)]).
midline(r1, [xy(585,580),xy(585,632)]).
midline(r1, [xy(109,617),xy(110,602),xy(114,590),xy(122,578),xy(140,559),xy(155,537)]).
midline(r1, [xy(479,187),xy(480,186)]).
midline(r1, [xy(298,119),xy(332,153),xy(331,161),xy(333,160)]).
midline(r1, [xy(334,162),xy(333,170),xy(335,168)]).
midline(r1, [xy(116,296),xy(160,340),xy(158,341),xy(115,300),xy(156,341),xy(153,341),xy(152,344),xy(154,345),xy(157,342),xy(160,344),xy(156,345)]).
midline(r1, [xy(160,346),xy(164,346),xy(161,341)]).
midline(r1, [xy(163,343),xy(166,346),xy(164,348)]).
midline(r1, [xy(142,508),xy(151,499),xy(148,497),xy(155,494),xy(152,498)]).
midline(r1, [xy(155,498),xy(159,496),xy(157,495)]).
midline(r1, [xy(159,498),xy(162,496),xy(159,493)]).
midline(r1, [xy(524,120),xy(556,170)]).
midline(r1, [xy(140,500),xy(139,501)]).
midline(r1, [xy(486,163),xy(486,165)]).
midline(r1, [xy(161,493),xy(164,493),xy(164,496),xy(168,493),xy(165,492)]).
midline(r1, [xy(167,491),xy(170,489),xy(170,493),xy(176,487),xy(173,492)]).
midline(r1, [xy(178,489),xy(185,484),xy(190,484),xy(197,478),xy(197,480)]).
midline(r1, [xy(615,633),xy(635,635)]).
midline(r1, [xy(148,212),xy(227,291)]).
midline(r1, [xy(175,351),xy(166,348),xy(172,346),xy(175,349)]).
midline(r1, [xy(177,348),xy(179,350),xy(176,352)]).
midline(r1, [xy(335,172),xy(337,172),xy(338,176),xy(336,179),xy(337,183),xy(340,182),xy(339,178)]).
midline(r1, [xy(339,185),xy(341,183)]).
midline(r1, [xy(341,187),xy(348,201),xy(347,203),xy(349,203)]).
midline(r1, [xy(180,353),xy(180,351),xy(187,354),xy(187,356)]).
midline(r1, [xy(189,356),xy(193,359),xy(195,358),xy(195,360)]).
fillpoint(r1, xy(158,158), 158.4).
fillpoint(r1, xy(187,146), 147.0).
fillpoint(r1, xy(190,145), 146.0).
fillpoint(r1, xy(193,144), 145.0).
fillpoint(r1, xy(144,191), 145.0).
fillpoint(r1, xy(196,143), 144.0).
fillpoint(r1, xy(199,142), 143.0).
fillpoint(r1, xy(209,139), 140.0).
fillpoint(r1, xy(213,138), 139.0).
fillpoint(r1, xy(217,137), 138.0).
fillpoint(r1, xy(136,214), 137.0).
fillpoint(r1, xy(135,217), 136.0).
fillpoint(r1, xy(133,224), 134.0).
fillpoint(r1, xy(132,228), 133.0).
fillpoint(r1, xy(131,232), 132.0).
fillpoint(r1, xy(242,129), 130.0).
fillpoint(r1, xy(129,238), 130.0).
fillpoint(r1, xy(128,241), 129.0).
fillpoint(r1, xy(127,244), 128.0).
fillpoint(r1, xy(254,126), 127.0).
fillpoint(r1, xy(126,247), 127.0).
fillpoint(r1, xy(258,125), 126.0).
fillpoint(r1, xy(125,250), 126.0).
fillpoint(r1, xy(263,124), 125.0).
fillpoint(r1, xy(267,123), 124.0).
fillpoint(r1, xy(123,257), 124.0).
fillpoint(r1, xy(271,122), 123.0).
fillpoint(r1, xy(122,261), 123.0).
fillpoint(r1, xy(275,121), 122.0).
fillpoint(r1, xy(121,265), 122.0).
fillpoint(r1, xy(279,120), 121.0).
fillpoint(r1, xy(120,269), 121.0).
fillpoint(r1, xy(284,119), 120.0).
fillpoint(r1, xy(119,274), 120.0).
fillpoint(r1, xy(289,118), 119.0).
fillpoint(r1, xy(295,117), 118.0).
fillpoint(r1, xy(117,282), 118.0).
fillpoint(r1, xy(522,117), 117.7).
fillpoint(r1, xy(302,116), 117.0).
fillpoint(r1, xy(517,116), 117.0).
fillpoint(r1, xy(116,286), 117.0).
fillpoint(r1, xy(312,115), 116.0).
fillpoint(r1, xy(507,115), 116.0).
fillpoint(r1, xy(115,290), 116.0).
fillpoint(r1, xy(325,114), 115.0).
fillpoint(r1, xy(494,114), 115.0).
fillpoint(r1, xy(114,295), 115.0).
fillpoint(r1, xy(330,113), 114.0).
fillpoint(r1, xy(489,113), 114.0).
fillpoint(r1, xy(113,300), 114.0).
fillpoint(r1, xy(336,112), 113.0).
fillpoint(r1, xy(484,112), 113.0).
fillpoint(r1, xy(112,306), 113.0).
fillpoint(r1, xy(343,111), 112.0).
fillpoint(r1, xy(476,111), 112.0).
fillpoint(r1, xy(111,313), 112.0).
fillpoint(r1, xy(353,110), 111.0).
fillpoint(r1, xy(466,110), 111.0).
fillpoint(r1, xy(110,323), 111.0).
fillpoint(r1, xy(371,110), 110.0).
fillpoint(r1, xy(109,336), 110.0).
fillpoint(r1, xy(108,341), 109.0).
fillpoint(r1, xy(107,347), 108.0).
fillpoint(r1, xy(106,354), 107.0).
fillpoint(r1, xy(105,363), 106.0).
fillpoint(r1, xy(105,416), 105.0).
fillpoint(r1, xy(130,490), 85.6).
fillpoint(r1, xy(132,493), 85.0).
fillpoint(r1, xy(134,496), 84.5).
fillpoint(r1, xy(137,502), 83.1).
fillpoint(r1, xy(145,517), 77.1).
fillpoint(r1, xy(146,519), 76.5).
fillpoint(r1, xy(150,526), 75.0).
fillpoint(r1, xy(151,528), 74.8).
fillpoint(r1, xy(152,530), 74.6).
fillpoint(r1, xy(153,532), 74.4).
fillpoint(r1, xy(154,534), 74.3).
fillpoint(r1, xy(155,535), 74.3).
fillpoint(r1, xy(582,221), 58.0).
fillpoint(r1, xy(595,253), 45.0).
border(r1).
region(r2, '#2ecc40', 62700, centroid(435,376)).
perimeter(r2, 2620).
polygon(r2, [xy(359,570),xy(270,569),xy(270,480),xy(290,479),xy(290,300),xy(250,300),xy(250,290),xy(259,290),xy(260,280),xy(269,280),xy(270,270),xy(280,269),xy(280,260),xy(299,260),xy(300,250),xy(309,250),xy(310,240),xy(329,240),xy(330,230),xy(369,230),xy(370,220),xy(439,220),xy(440,349),xy(489,350),xy(490,240),xy(509,240),xy(510,249),xy(520,250),xy(520,260),xy(539,260),xy(540,269),xy(549,270),xy(550,279),xy(559,280),xy(560,289),xy(570,290),xy(570,309),xy(579,310),xy(580,320),xy(590,320),xy(590,449),xy(540,450),xy(540,499),xy(589,500),xy(590,519),xy(580,520),xy(579,510),xy(550,510),xy(550,539),xy(569,540),xy(569,550),xy(440,550),xy(440,500),xy(489,500),xy(490,450),xy(440,450),xy(440,400),xy(390,399),xy(389,350),xy(340,350),xy(340,479),xy(360,480),xy(359,570)]).
hole(r2, [xy(350,559),xy(349,490),xy(280,490),xy(280,560),xy(350,559)]).
midline(r2, [xy(399,260),xy(395,257),xy(392,247),xy(386,238),xy(388,238)]).
midline(r2, [xy(397,261),xy(384,283),xy(379,289),xy(375,289),xy(368,282),xy(366,283),xy(363,278),xy(361,280),xy(359,278),xy(354,265),xy(355,262),xy(351,258),xy(355,260)]).
midline(r2, [xy(358,270),xy(360,268),xy(357,265),xy(357,267)]).
midline(r2, [xy(357,264),xy(356,263)]).
midline(r2, [xy(368,281),xy(361,274),xy(361,276)]).
midline(r2, [xy(373,289),xy(368,284),xy(363,287),xy(360,281)]).
midline(r2, [xy(361,269),xy(361,272),xy(366,277)]).
midline(r2, [xy(371,289),xy(362,288)]).
midline(r2, [xy(362,290),xy(345,294),xy(340,290),xy(297,280),xy(275,289),xy(269,289),xy(263,294),xy(254,295)]).
midline(r2, [xy(365,287),xy(367,286)]).
midline(r2, [xy(344,295),xy(325,317),xy(315,341),xy(315,464),xy(295,483),xy(275,485),xy(274,559),xy(275,564),xy(280,565),xy(347,565),xy(354,563),xy(354,486),xy(334,483),xy(315,465)]).
midline(r2, [xy(380,290),xy(399,310),xy(411,330),xy(414,340),xy(415,358),xy(419,370),xy(430,374),xy(459,378),xy(475,387),xy(489,400),xy(514,400),xy(531,391),xy(538,369),xy(540,349),xy(533,334),xy(528,310),xy(518,287),xy(507,272),xy(500,255),xy(500,249)]).
midline(r2, [xy(515,401),xy(515,516),xy(513,519),xy(499,524),xy(464,525)]).
midline(r2, [xy(533,322),xy(547,308),xy(550,308),xy(533,325)]).
midline(r2, [xy(515,518),xy(522,521),xy(544,543),xy(565,545)]).
midline(r2, [xy(523,520),xy(527,518),xy(525,521)]).
midline(r2, [xy(529,518),xy(544,506),xy(551,504),xy(584,505),xy(585,515)]).
midline(r2, [xy(545,348),xy(542,347),xy(541,350),xy(543,350)]).
midline(r2, [xy(546,348),xy(557,343),xy(558,346),xy(561,343),xy(559,342)]).
midline(r2, [xy(561,341),xy(562,342)]).
fillpoint(r2, xy(379,289), 60.8).
fillpoint(r2, xy(362,290), 60.0).
fillpoint(r2, xy(357,291), 59.0).
fillpoint(r2, xy(531,391), 59.0).
fillpoint(r2, xy(353,292), 58.0).
fillpoint(r2, xy(532,388), 58.0).
fillpoint(r2, xy(348,293), 57.0).
fillpoint(r2, xy(536,376), 54.0).
fillpoint(r2, xy(537,372), 53.0).
fillpoint(r2, xy(538,368), 52.0).
fillpoint(r2, xy(539,361), 51.0).
fillpoint(r2, xy(534,336), 45.0).
fillpoint(r2, xy(533,333), 44.0).
fillpoint(r2, xy(531,325), 42.0).
fillpoint(r2, xy(530,319), 41.0).
fillpoint(r2, xy(515,518), 31.4).
fillpoint(r2, xy(419,370), 29.7).
fillpoint(r2, xy(518,288), 29.0).
fillpoint(r2, xy(318,331), 29.0).
fillpoint(r2, xy(411,331), 29.0).
fillpoint(r2, xy(418,368), 29.0).
fillpoint(r2, xy(421,371), 29.0).
fillpoint(r2, xy(458,378), 29.0).
fillpoint(r2, xy(508,521), 29.0).
fillpoint(r2, xy(521,521), 29.0).
fillpoint(r2, xy(317,334), 28.0).
fillpoint(r2, xy(412,334), 28.0).
fillpoint(r2, xy(417,365), 28.0).
fillpoint(r2, xy(424,372), 28.0).
fillpoint(r2, xy(455,377), 28.0).
fillpoint(r2, xy(505,522), 28.0).
fillpoint(r2, xy(316,337), 27.0).
fillpoint(r2, xy(413,337), 27.0).
fillpoint(r2, xy(416,362), 27.0).
fillpoint(r2, xy(427,373), 27.0).
fillpoint(r2, xy(452,376), 27.0).
fillpoint(r2, xy(502,523), 27.0).
fillpoint(r2, xy(315,342), 26.0).
fillpoint(r2, xy(414,342), 26.0).
fillpoint(r2, xy(415,358), 26.0).
fillpoint(r2, xy(432,374), 26.0).
fillpoint(r2, xy(448,375), 26.0).
fillpoint(r2, xy(498,524), 26.0).
fillpoint(r2, xy(315,408), 25.0).
fillpoint(r2, xy(514,475), 25.0).
fillpoint(r2, xy(464,525), 25.0).
fillpoint(r2, xy(505,265), 16.0).
fillpoint(r2, xy(285,284), 16.0).
region(r9, '#ffdc00', 26300, centroid(410,511)).
perimeter(r9, 1180).
polygon(r9, [xy(509,600),xy(310,600),xy(310,590),xy(300,590),xy(299,580),xy(280,579),xy(280,570),xy(360,569),xy(360,480),xy(340,479),xy(340,360),xy(390,360),xy(390,450),xy(490,450),xy(490,499),xy(440,500),xy(440,549),xy(560,550),xy(560,559),xy(550,560),xy(550,569),xy(540,570),xy(539,580),xy(520,580),xy(520,589),xy(510,590),xy(509,600)]).
midline(r9, [xy(444,575),xy(423,572),xy(410,566),xy(400,558),xy(400,490),xy(364,455),xy(365,384)]).
midline(r9, [xy(400,559),xy(376,580),xy(359,585),xy(324,585),xy(315,580),xy(309,580),xy(303,575),xy(284,575)]).
midline(r9, [xy(401,490),xy(410,483),xy(430,475),xy(465,475)]).
midline(r9, [xy(445,574),xy(488,575),xy(513,565),xy(525,565),xy(534,560),xy(540,560),xy(546,555),xy(555,555)]).
fillpoint(r9, xy(400,491), 41.0).
fillpoint(r9, xy(400,559), 41.0).
fillpoint(r9, xy(399,525), 40.0).
fillpoint(r9, xy(421,478), 29.0).
fillpoint(r9, xy(421,571), 29.0).
fillpoint(r9, xy(424,477), 28.0).
fillpoint(r9, xy(424,572), 28.0).
fillpoint(r9, xy(427,476), 27.0).
fillpoint(r9, xy(427,573), 27.0).
fillpoint(r9, xy(432,475), 26.0).
fillpoint(r9, xy(432,574), 26.0).
fillpoint(r9, xy(365,455), 25.7).
fillpoint(r9, xy(365,416), 25.0).
fillpoint(r9, xy(441,475), 25.0).
fillpoint(r9, xy(441,575), 25.0).
fillpoint(r9, xy(514,565), 16.0).
fillpoint(r9, xy(365,584), 16.0).
fillpoint(r9, xy(526,564), 15.0).
fillpoint(r9, xy(358,584), 15.0).
fillpoint(r9, xy(535,560), 11.0).
fillpoint(r9, xy(314,580), 11.0).
region(r4, '#ffdc00', 12600, centroid(259,417)).
perimeter(r4, 720).
polygon(r4, [xy(269,560),xy(260,560),xy(260,550),xy(250,549),xy(250,530),xy(240,530),xy(239,520),xy(230,519),xy(230,500),xy(220,499),xy(220,460),xy(210,460),xy(210,450),xy(240,449),xy(240,350),xy(220,349),xy(220,340),xy(230,339),xy(230,320),xy(239,320),xy(240,310),xy(250,309),xy(250,300),xy(289,300),xy(290,479),xy(270,480),xy(269,560)]).
midline(r4, [xy(267,323),xy(261,335),xy(244,334),xy(235,343),xy(224,345)]).
midline(r4, [xy(262,335),xy(265,350),xy(264,455),xy(245,474),xy(225,456),xy(214,455)]).
midline(r4, [xy(245,475),xy(245,478),xy(240,480),xy(240,482)]).
midline(r4, [xy(245,480),xy(249,492),xy(249,501),xy(259,524),xy(259,540),xy(264,546),xy(265,555)]).
fillpoint(r4, xy(262,335), 27.5).
fillpoint(r4, xy(263,337), 27.0).
fillpoint(r4, xy(264,342), 26.0).
fillpoint(r4, xy(264,455), 25.7).
fillpoint(r4, xy(245,474), 25.7).
fillpoint(r4, xy(264,400), 25.0).
fillpoint(r4, xy(249,493), 21.0).
fillpoint(r4, xy(249,502), 20.0).
fillpoint(r4, xy(254,514), 16.0).
fillpoint(r4, xy(259,525), 11.0).
fillpoint(r4, xy(259,536), 10.0).
region(r21, '#5a5a5a', 6400, centroid(390,620)).
perimeter(r21, 680).
polygon(r21, [xy(549,630),xy(230,630),xy(230,610),xy(549,610),xy(549,630)]).
midline(r21, [xy(339,620),xy(239,620)]).
midline(r21, [xy(340,619),xy(540,620)]).
fillpoint(r21, xy(239,620), 10.0).
region(r3, '#ffdc00', 5600, centroid(466,285)).
perimeter(r3, 360).
polygon(r3, [xy(489,350),xy(450,349),xy(450,300),xy(440,299),xy(440,220),xy(449,220),xy(450,230),xy(490,230),xy(489,350)]).
midline(r3, [xy(468,291),xy(465,281),xy(462,279),xy(462,281)]).
midline(r3, [xy(469,292),xy(470,330)]).
midline(r3, [xy(465,279),xy(463,278),xy(465,275),xy(465,256),xy(446,235),xy(445,224)]).
fillpoint(r3, xy(465,267), 25.0).
fillpoint(r3, xy(469,293), 21.0).
fillpoint(r3, xy(469,316), 20.0).
region(r6, '#ffdc00', 4900, centroid(581,448)).
perimeter(r6, 460).
polygon(r6, [xy(599,500),xy(540,499),xy(540,450),xy(590,449),xy(590,340),xy(600,340),xy(600,379),xy(610,380),xy(610,459),xy(600,460),xy(599,500)]).
midline(r6, [xy(600,391),xy(594,379),xy(595,344)]).
midline(r6, [xy(600,392),xy(600,449),xy(575,474),xy(564,475)]).
fillpoint(r6, xy(564,475), 25.0).
fillpoint(r6, xy(599,419), 10.0).
fillpoint(r6, xy(599,450), 10.0).
region(r13, '#aaaaaa', 4300, centroid(314,524)).
perimeter(r13, 440).
polygon(r13, [xy(349,560),xy(280,559),xy(280,490),xy(350,490),xy(349,560)]).
hole(r13, [xy(330,539),xy(330,530),xy(320,529),xy(320,520),xy(330,519),xy(329,510),xy(320,510),xy(319,520),xy(310,520),xy(309,510),xy(300,510),xy(300,529),xy(309,530),xy(310,540),xy(330,539)]).
midline(r13, [xy(339,542),xy(339,525),xy(326,525),xy(314,515)]).
midline(r13, [xy(339,523),xy(339,504),xy(335,500),xy(294,500),xy(291,501),xy(289,510),xy(290,535),xy(296,545),xy(304,549),xy(327,550),xy(337,548),xy(339,543)]).
midline(r13, [xy(315,513),xy(314,502)]).
fillpoint(r13, xy(295,544), 15.8).
fillpoint(r13, xy(292,501), 12.0).
fillpoint(r13, xy(338,501), 12.0).
fillpoint(r13, xy(337,548), 12.0).
fillpoint(r13, xy(295,500), 11.0).
fillpoint(r13, xy(315,500), 11.0).
fillpoint(r13, xy(334,500), 11.0).
fillpoint(r13, xy(290,505), 11.0).
fillpoint(r13, xy(339,505), 11.0).
fillpoint(r13, xy(339,525), 11.0).
fillpoint(r13, xy(290,534), 11.0).
fillpoint(r13, xy(339,544), 11.0).
fillpoint(r13, xy(305,549), 11.0).
fillpoint(r13, xy(334,549), 11.0).
fillpoint(r13, xy(301,500), 10.0).
fillpoint(r13, xy(321,500), 10.0).
fillpoint(r13, xy(289,520), 10.0).
fillpoint(r13, xy(339,515), 10.0).
fillpoint(r13, xy(339,535), 10.0).
fillpoint(r13, xy(311,550), 10.0).
fillpoint(r13, xy(315,513), 5.0).
fillpoint(r13, xy(324,525), 5.0).
region(r7, '#2ecc40', 2400, centroid(227,400)).
perimeter(r7, 300).
polygon(r7, [xy(239,450),xy(210,449),xy(210,440),xy(219,440),xy(220,430),xy(230,429),xy(229,420),xy(210,419),xy(210,380),xy(220,379),xy(220,350),xy(240,350),xy(239,450)]).
midline(r7, [xy(230,440),xy(223,444),xy(214,445)]).
midline(r7, [xy(230,438),xy(234,433),xy(235,420),xy(233,414),xy(224,405)]).
midline(r7, [xy(225,403),xy(224,394),xy(229,385),xy(230,359)]).
fillpoint(r7, xy(225,399), 15.0).
fillpoint(r7, xy(229,384), 11.0).
fillpoint(r7, xy(229,369), 10.0).
fillpoint(r7, xy(229,440), 10.0).
fillpoint(r7, xy(234,425), 5.0).
fillpoint(r7, xy(214,445), 5.0).
region(r18, '#7fdbff', 2000, centroid(64,576)).
perimeter(r18, 240).
polygon(r18, [xy(89,610),xy(70,610),xy(70,590),xy(50,590),xy(50,570),xy(30,569),xy(30,550),xy(69,550),xy(70,569),xy(90,570),xy(89,610)]).
midline(r18, [xy(51,560),xy(39,560)]).
midline(r18, [xy(52,560),xy(58,561),xy(61,578),xy(78,581),xy(80,600)]).
fillpoint(r18, xy(58,561), 12.0).
fillpoint(r18, xy(61,578), 12.0).
fillpoint(r18, xy(78,581), 12.0).
fillpoint(r18, xy(54,560), 11.0).
fillpoint(r18, xy(59,565), 11.0).
fillpoint(r18, xy(60,574), 11.0).
fillpoint(r18, xy(65,579), 11.0).
fillpoint(r18, xy(74,580), 11.0).
fillpoint(r18, xy(79,585), 11.0).
fillpoint(r18, xy(39,560), 10.0).
fillpoint(r18, xy(79,596), 10.0).
region(r20, '#2ecc40', 2000, centroid(180,620)).
perimeter(r20, 240).
polygon(r20, [xy(229,630),xy(130,630),xy(130,610),xy(229,610),xy(229,630)]).
midline(r20, [xy(151,620),xy(139,620)]).
midline(r20, [xy(152,619),xy(220,620)]).
fillpoint(r20, xy(139,620), 10.0).
region(r12, '#870c25', 1500, centroid(414,434)).
perimeter(r12, 160).
polygon(r12, [xy(439,450),xy(390,450),xy(390,420),xy(439,420),xy(439,450)]).
midline(r12, [xy(422,435),xy(404,435)]).
midline(r12, [xy(423,435),xy(425,435)]).
fillpoint(r12, xy(404,435), 15.0).
region(r10, '#bebebe', 1000, centroid(414,410)).
perimeter(r10, 140).
polygon(r10, [xy(439,420),xy(390,420),xy(390,400),xy(439,400),xy(439,420)]).
midline(r10, [xy(420,410),xy(399,410)]).
midline(r10, [xy(421,409),xy(430,410)]).
fillpoint(r10, xy(399,410), 10.0).
region(r16, '#5a5a5a', 700, centroid(563,523)).
perimeter(r16, 160).
polygon(r16, [xy(569,540),xy(550,539),xy(550,510),xy(580,510),xy(579,530),xy(570,530),xy(569,520),xy(560,520),xy(560,529),xy(570,530),xy(569,540)]).
midline(r16, [xy(555,533),xy(555,515),xy(574,515),xy(575,523),xy(565,534),xy(555,534)]).
fillpoint(r16, xy(556,515), 6.0).
fillpoint(r16, xy(574,515), 6.0).
fillpoint(r16, xy(555,534), 6.0).
fillpoint(r16, xy(561,515), 5.0).
fillpoint(r16, xy(554,525), 5.0).
fillpoint(r16, xy(575,523), 5.0).
fillpoint(r16, xy(561,535), 5.0).
region(r5, '#0074d9', 500, centroid(444,324)).
perimeter(r5, 120).
polygon(r5, [xy(449,350),xy(440,349),xy(440,300),xy(450,300),xy(449,350)]).
midline(r5, [xy(445,317),xy(445,304)]).
midline(r5, [xy(444,318),xy(445,345)]).
fillpoint(r5, xy(444,325), 5.0).
region(r8, '#0074d9', 500, centroid(364,354)).
perimeter(r8, 120).
polygon(r8, [xy(389,360),xy(340,360),xy(340,350),xy(389,350),xy(389,360)]).
midline(r8, [xy(359,354),xy(344,355)]).
midline(r8, [xy(360,355),xy(385,355)]).
fillpoint(r8, xy(344,355), 5.0).
region(r14, '#7fdbff', 500, centroid(312,526)).
perimeter(r14, 120).
polygon(r14, [xy(329,540),xy(310,540),xy(310,530),xy(300,529),xy(300,510),xy(309,510),xy(310,519),xy(319,520),xy(320,529),xy(330,530),xy(329,540)]).
midline(r14, [xy(305,521),xy(305,514)]).
midline(r14, [xy(305,522),xy(305,524),xy(314,525),xy(315,534),xy(325,535)]).
fillpoint(r14, xy(305,524), 6.0).
fillpoint(r14, xy(314,525), 6.0).
fillpoint(r14, xy(315,534), 6.0).
fillpoint(r14, xy(305,516), 5.0).
fillpoint(r14, xy(321,535), 5.0).
region(r19, '#7fdbff', 400, centroid(40,600)).
perimeter(r19, 80).
polygon(r19, [xy(49,610),xy(30,609),xy(30,590),xy(50,590),xy(49,610)]).
midline(r19, [xy(39,599),xy(40,600)]).
fillpoint(r19, xy(39,600), 10.0).
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
region(r24, '#2ecc40', 400, centroid(630,620)).
perimeter(r24, 80).
polygon(r24, [xy(639,630),xy(620,629),xy(620,610),xy(639,610)]).
midline(r24, [xy(629,619),xy(630,620)]).
fillpoint(r24, xy(629,620), 10.0).
border(r24).
region(r15, '#7fdbff', 100, centroid(324,514)).
perimeter(r15, 40).
polygon(r15, [xy(329,520),xy(320,519),xy(320,510),xy(330,510),xy(329,520)]).
midline(r15, [xy(325,515),xy(325,514)]).
fillpoint(r15, xy(324,515), 5.0).
region(r17, '#2ecc40', 100, centroid(564,524)).
perimeter(r17, 40).
polygon(r17, [xy(569,530),xy(560,529),xy(560,520),xy(570,520),xy(569,530)]).
midline(r17, [xy(565,525),xy(565,524)]).
fillpoint(r17, xy(564,525), 5.0).

adjacent(r1, r2).
shared_edge(r1, r2, 540).
adjacent(r1, r3).
shared_edge(r1, r3, 70).
adjacent(r1, r4).
shared_edge(r1, r4, 250).
adjacent(r1, r6).
shared_edge(r1, r6, 200).
adjacent(r1, r7).
shared_edge(r1, r7, 90).
adjacent(r1, r9).
shared_edge(r1, r9, 360).
adjacent(r1, r16).
shared_edge(r1, r16, 30).
adjacent(r1, r18).
shared_edge(r1, r18, 240).
adjacent(r1, r19).
shared_edge(r1, r19, 80).
adjacent(r1, r20).
shared_edge(r1, r20, 220).
adjacent(r1, r21).
shared_edge(r1, r21, 660).
adjacent(r1, r22).
shared_edge(r1, r22, 80).
adjacent(r1, r23).
shared_edge(r1, r23, 80).
adjacent(r1, r24).
shared_edge(r1, r24, 60).
adjacent(r2, r3).
shared_edge(r2, r3, 230).
adjacent(r2, r4).
shared_edge(r2, r4, 320).
adjacent(r2, r5).
shared_edge(r2, r5, 60).
adjacent(r2, r6).
shared_edge(r2, r6, 260).
adjacent(r2, r8).
shared_edge(r2, r8, 70).
adjacent(r2, r9).
shared_edge(r2, r9, 670).
adjacent(r2, r10).
shared_edge(r2, r10, 70).
adjacent(r2, r12).
shared_edge(r2, r12, 30).
adjacent(r2, r13).
shared_edge(r2, r13, 280).
adjacent(r2, r16).
shared_edge(r2, r16, 90).
adjacent(r3, r5).
shared_edge(r3, r5, 60).
adjacent(r4, r7).
shared_edge(r4, r7, 150).
adjacent(r8, r9).
shared_edge(r8, r9, 50).
adjacent(r9, r10).
shared_edge(r9, r10, 20).
adjacent(r9, r12).
shared_edge(r9, r12, 80).
adjacent(r10, r12).
shared_edge(r10, r12, 50).
adjacent(r13, r14).
shared_edge(r13, r14, 120).
adjacent(r13, r15).
shared_edge(r13, r15, 40).
adjacent(r16, r17).
shared_edge(r16, r17, 40).
adjacent(r20, r21).
shared_edge(r20, r21, 20).

encloses(r13, r14).
encloses(r13, r15).
encloses(r16, r17).
encloses(r1, r18).
encloses(r1, r19).
encloses(r1, r22).
encloses(r1, r23).
