# MIT License
#
# Copyright (c) 2026 ARC Prize Foundation
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import Any

import numpy as np
from arcengine import (
    ActionInput,
    ARCBaseGame,
    Camera,
    GameAction,
    Level,
    RenderableUserDisplay,
    Sprite,
)

sprites = {
    "0": Sprite(
        pixels=[
            [10],
        ],
        name="0",
        visible=True,
        collidable=True,
        tags=["0", "zmlxwcvwb"],
        layer=10,
    ),
    "0000ucykrekiwe": Sprite(
        pixels=[
            [-2, -2, 7, -2, -2],
            [-2, 7, -2, 7, -2],
            [7, -2, -2, -2, 7],
            [-2, 7, 7, 7, -2],
        ],
        name="0000ucykrekiwe",
        visible=True,
        collidable=True,
        tags=["rgjznrcin"],
        layer=-1,
    ),
    "1": Sprite(
        pixels=[
            [6, 6],
            [6, 6],
        ],
        name="1",
        visible=True,
        collidable=True,
        tags=["zmlxwcvwb", "1"],
        layer=9,
    ),
    "0001ebagdfaujt": Sprite(
        pixels=[
            [13, -2, 13, -2, 13],
            [-2, 13, -2, 13, -2],
            [13, 13, 13, 13, 13],
            [-2, 13, 13, 13, -2],
        ],
        name="0001ebagdfaujt",
        visible=True,
        collidable=True,
        tags=["rgjznrcin"],
        layer=-1,
    ),
    "2": Sprite(
        pixels=[
            [15, 15, 15],
            [15, 15, 15],
            [15, 15, 15],
        ],
        name="2",
        visible=True,
        collidable=True,
        tags=["2", "zmlxwcvwb"],
    ),
    "0002wjigybqaof": Sprite(
        pixels=[
            [-1, -1, 14, -1, -1],
            [-1, 14, -1, 14, -1],
            [14, -1, 14, -1, 14],
            [-1, 14, -1, 14, -1],
        ],
        name="0002wjigybqaof",
        visible=True,
        collidable=True,
        tags=["rgjznrcin"],
    ),
    "3": Sprite(
        pixels=[
            [11, 11, 11, 11],
            [11, 11, 11, 11],
            [11, 11, 11, 11],
            [11, 11, 11, 11],
        ],
        name="3",
        visible=True,
        collidable=True,
        tags=["3", "zmlxwcvwb"],
    ),
    "0003zdfkbzzqvx": Sprite(
        pixels=[
            [-1, -1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, -1, -1],
            [-1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, -1],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
            [-1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, -1],
            [-1, -1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, -1, -1],
        ],
        name="0003zdfkbzzqvx",
        visible=True,
        collidable=True,
        tags=["xkstxyqbs"],
        layer=-2,
    ),
    "4": Sprite(
        pixels=[
            [12, 12, 12, 12, 12],
            [12, 12, 12, 12, 12],
            [12, 12, 12, 12, 12],
            [12, 12, 12, 12, 12],
            [12, 12, 12, 12, 12],
        ],
        name="4",
        visible=True,
        collidable=True,
        tags=["zmlxwcvwb", "4"],
    ),
    "0004srpvwsidmy": Sprite(
        pixels=[
            [12, 12, 12, 12, 12],
            [12, 12, 12, 12, 12],
            [12, 12, 12, 12, 12],
            [12, 12, 12, 12, 12],
            [12, 12, 12, 12, 12],
        ],
        name="0004srpvwsidmy",
        visible=True,
        collidable=True,
        tags=["rgjznrcin"],
    ),
    "5": Sprite(
        pixels=[
            [8, 8, 8, 8, 8, 8, 8],
            [8, 8, 8, 8, 8, 8, 8],
            [8, 8, 8, 8, 8, 8, 8],
            [8, 8, 8, 8, 8, 8, 8],
            [8, 8, 8, 8, 8, 8, 8],
            [8, 8, 8, 8, 8, 8, 8],
            [8, 8, 8, 8, 8, 8, 8],
        ],
        name="5",
        visible=True,
        collidable=True,
        tags=["zmlxwcvwb", "5"],
    ),
    "0005aqsukaogvw": Sprite(
        pixels=[
            [1, 1, 1, 1, 1],
            [1, 1, 0, 0, 0],
            [1, 1, 1, 1, 1],
            [1, 1, 0, 0, 0],
            [1, 1, 1, 1, 1],
        ],
        name="0005aqsukaogvw",
        visible=True,
        collidable=True,
    ),
    "6": Sprite(
        pixels=[
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
        ],
        name="6",
        visible=True,
        collidable=True,
        tags=["zmlxwcvwb", "6"],
    ),
    "0006japsohcqlw": Sprite(
        pixels=[
            [-1, -1, 10, -1],
            [10, 10, 10, 10],
            [-1, -1, 10, -1],
        ],
        name="0006japsohcqlw",
        visible=True,
        collidable=True,
    ),
    "7": Sprite(
        pixels=[
            [7, 7, 7, 7, 7, 7, 7, 7, 7],
            [7, 7, 7, 7, 7, 7, 7, 7, 7],
            [7, 7, 7, 7, 7, 7, 7, 7, 7],
            [7, 7, 7, 7, 7, 7, 7, 7, 7],
            [7, 7, 7, 7, 7, 7, 7, 7, 7],
            [7, 7, 7, 7, 7, 7, 7, 7, 7],
            [7, 7, 7, 7, 7, 7, 7, 7, 7],
            [7, 7, 7, 7, 7, 7, 7, 7, 7],
            [7, 7, 7, 7, 7, 7, 7, 7, 7],
        ],
        name="7",
        visible=True,
        collidable=True,
        tags=["7", "zmlxwcvwb"],
    ),
    "0007husrwenosq": Sprite(
        pixels=[
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1],
            [0, 0, 0, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
        ],
        name="0007husrwenosq",
        visible=True,
        collidable=True,
    ),
    "8": Sprite(
        pixels=[
            [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
            [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
            [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
            [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
            [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
            [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
            [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
            [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
            [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
            [14, 14, 14, 14, 14, 14, 14, 14, 14, 14],
        ],
        name="8",
        visible=True,
        collidable=True,
        tags=["8", "zmlxwcvwb"],
        layer=2,
    ),
    "0008hngjwqibfi": Sprite(
        pixels=[
            [-1, -1, 9, 9, 9, 9, 9, -1, -1],
            [-1, 9, 9, 9, 9, 9, 9, 9, -1],
            [9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9],
            [-1, 9, 9, 9, 9, 9, 9, 9, -1],
            [-1, -1, 9, 9, 9, 9, 9, -1, -1],
        ],
        name="0008hngjwqibfi",
        visible=True,
        collidable=True,
        tags=["xkstxyqbs"],
        layer=-3,
    ),
    "0009mbvjylwely": Sprite(
        pixels=[
            [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
        ],
        name="0009mbvjylwely",
        visible=True,
        collidable=True,
        layer=-2,
    ),
    "0010adfaghocih": Sprite(
        pixels=[
            [6, 6],
            [6, 6],
        ],
        name="0010adfaghocih",
        visible=True,
        collidable=True,
    ),
    "0011gdcfsxhtwi": Sprite(
        pixels=[
            [10, 6, 15, 11, 12, 8, 9, 7, 14],
        ],
        name="0011gdcfsxhtwi",
        visible=True,
        collidable=True,
    ),
    "0012qpdeinaukn": Sprite(
        pixels=[
            [10, -1, 6, -1, 15, -1, 11, -1, 12, -1, 8],
        ],
        name="0012qpdeinaukn",
        visible=True,
        collidable=True,
    ),
    "0013nddbuhpkbi": Sprite(
        pixels=[
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
        ],
        name="0013nddbuhpkbi",
        visible=True,
        collidable=True,
        layer=-2,
    ),
    "0014mjywekiwam": Sprite(
        pixels=[
            [11, 11, 11, 11],
            [11, 11, 11, 11],
            [11, 11, 11, 11],
            [11, 11, 11, 11],
        ],
        name="0014mjywekiwam",
        visible=True,
        collidable=True,
        tags=["rgjznrcin"],
    ),
    "0015zcgpfmnvss": Sprite(
        pixels=[
            [-1, -1, 9, 9, 9, 9, 9, -1, -1],
            [-1, 9, 9, 9, 9, 9, 9, 9, -1],
            [9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9],
            [-1, 9, 9, 9, 9, 9, 9, 9, -1],
            [-1, -1, 9, 9, 9, 9, 9, -1, -1],
        ],
        name="0015zcgpfmnvss",
        visible=True,
        collidable=True,
        tags=["xkstxyqbs"],
        layer=-3,
    ),
    "0016fnrcxwfvtx": Sprite(
        pixels=[
            [15, 15, 15],
            [15, 15, 15],
            [15, 15, 15],
        ],
        name="0016fnrcxwfvtx",
        visible=True,
        collidable=True,
        tags=["rgjznrcin"],
    ),
    "0017dcrmyjphec": Sprite(
        pixels=[
            [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            [5, 7, 7, 5, 5, 14, 14, 5, 5, 13, 13, 5],
            [5, 7, 7, 5, 5, 14, 14, 5, 5, 13, 13, 5],
            [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
        ],
        name="0017dcrmyjphec",
        visible=True,
        collidable=True,
    ),
    "0018lnncvbueuo": Sprite(
        pixels=[
            [-1, -1, 9, 9, 9, 9, -1, -1],
            [-1, 9, 9, 9, 9, 9, 9, -1],
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
            [-1, 9, 9, 9, 9, 9, 9, -1],
            [-1, -1, 9, 9, 9, 9, -1, -1],
        ],
        name="0018lnncvbueuo",
        visible=True,
        collidable=True,
        layer=-1,
    ),
    "0019oikveatxnp": Sprite(
        pixels=[
            [-1, -1, -1, 0, 0, 0, 0, 0, -1, -1, -1],
            [-1, -1, 0, -1, -1, -1, -1, -1, 0, -1, -1],
            [-1, 0, -1, -1, -1, -1, -1, -1, -1, 0, -1],
            [0, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0],
            [0, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0],
            [0, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0],
            [0, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0],
            [0, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0],
            [-1, 0, -1, -1, -1, -1, -1, -1, -1, 0, -1],
            [-1, -1, 0, -1, -1, -1, -1, -1, 0, -1, -1],
            [-1, -1, -1, 0, 0, 0, 0, 0, -1, -1, -1],
        ],
        name="0019oikveatxnp",
        visible=True,
        collidable=True,
        tags=["ooutlqdaq"],
    ),
    "0020qkplcbivxi": Sprite(
        pixels=[
            [-2, -2, 0, -2],
            [-2, 0, 0, 0],
            [-2, -2, 0, -2],
            [-2, -2, -2, -2],
        ],
        name="0020qkplcbivxi",
        visible=True,
        collidable=True,
        tags=["ooutlqdaq"],
        layer=5,
    ),
    "0021ojxxllwxqr": Sprite(
        pixels=[
            [-1, -1, -1, -1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, -1, -1, -1, -1],
            [4, 4, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 4, 4],
            [4, 4, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 4, 4],
            [-1, -1, -1, -1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, -1, -1, -1, -1],
        ],
        name="0021ojxxllwxqr",
        visible=True,
        collidable=True,
    ),
    "0022xgjoqvpfrf": Sprite(
        pixels=[
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
        ],
        name="0022xgjoqvpfrf",
        visible=True,
        collidable=True,
    ),
    "0023wzvifjzfsl": Sprite(
        pixels=[
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
        ],
        name="0023wzvifjzfsl",
        visible=True,
        collidable=True,
    ),
    "0024ritdjmiele": Sprite(
        pixels=[
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
        ],
        name="0024ritdjmiele",
        visible=True,
        collidable=True,
    ),
    "0025foufrvfdur": Sprite(
        pixels=[
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
        ],
        name="0025foufrvfdur",
        visible=True,
        collidable=True,
    ),
    "0026rogcizlhho": Sprite(
        pixels=[
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4],
        ],
        name="0026rogcizlhho",
        visible=True,
        collidable=True,
    ),
    "0027blsxsorecj": Sprite(
        pixels=[
            [3, 3, 3],
            [3, 3, 3],
            [3, 3, 3],
        ],
        name="0027blsxsorecj",
        visible=True,
        collidable=True,
        layer=-1,
    ),
    "0028hjlrsjwzqg": Sprite(
        pixels=[
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
        ],
        name="0028hjlrsjwzqg",
        visible=True,
        collidable=True,
        layer=-2,
    ),
    "0029obpugmgzgr": Sprite(
        pixels=[
            [0],
        ],
        name="0029obpugmgzgr",
        visible=True,
        collidable=True,
    ),
    "ybnveypak": Sprite(
        pixels=[
            [-2, -2, 7, -2, -2],
            [-2, 7, -2, 7, -2],
            [7, -2, -2, -2, 7],
            [-2, 7, 7, 7, -2],
        ],
        name="ybnveypak",
        visible=True,
        collidable=True,
        tags=["ybnveypak"],
        layer=-1,
    ),
    "ybnveypak2": Sprite(
        pixels=[
            [-1, -1, 14, -1, -1],
            [-1, 14, -1, 14, -1],
            [14, -1, 14, -1, 14],
            [-1, 14, -1, 14, -1],
        ],
        name="ybnveypak2",
        visible=True,
        collidable=True,
        tags=["ybnveypak2"],
        layer=-1,
    ),
    "ybnveypak3": Sprite(
        pixels=[
            [13, -2, 13, -2, 13],
            [-2, 13, -2, 13, -2],
            [13, 13, 13, 13, 13],
            [-2, 13, 13, 13, -2],
        ],
        name="ybnveypak3",
        visible=True,
        collidable=True,
        tags=["ybnveypak3"],
        layer=-1,
    ),
}
levels = [
    # Level 1
    Level(
        sprites=[
            sprites["2"].clone().set_position(3, 58),
            sprites["0008hngjwqibfi"].clone().set_position(44, 11),
            sprites["0009mbvjylwely"].clone(),
            sprites["0016fnrcxwfvtx"].clone().set_position(30, 4),
            sprites["0020qkplcbivxi"].clone().set_position(8, 52),
            sprites["0022xgjoqvpfrf"].clone(),
            sprites["0027blsxsorecj"].clone().set_position(47, 14),
            sprites["0028hjlrsjwzqg"].clone().set_position(6, 15),
        ],
        grid_size=(64, 64),
        data={
            "xkstxyqbs": [2, 1],
            "steps": 32,
        },
    ),
    # Level 2
    Level(
        sprites=[
            sprites["0"].clone().set_position(41, 37),
            sprites["0"].clone().set_position(18, 37),
            sprites["0"].clone().set_position(37, 40),
            sprites["0"].clone().set_position(16, 41),
            sprites["0"].clone().set_position(14, 55),
            sprites["0"].clone().set_position(16, 57),
            sprites["0"].clone().set_position(49, 54),
            sprites["0"].clone().set_position(47, 56),
            sprites["0008hngjwqibfi"].clone().set_position(29, 23),
            sprites["0009mbvjylwely"].clone(),
            sprites["0012qpdeinaukn"].clone().set_position(1, 1).set_scale(2),
            sprites["0014mjywekiwam"].clone().set_position(30, 3),
            sprites["0023wzvifjzfsl"].clone().set_position(16, 0),
        ],
        grid_size=(64, 64),
        data={
            "xkstxyqbs": [3, 1],
            "steps": 32,
        },
    ),
    # Level 3
    Level(
        sprites=[
            sprites["0"].clone().set_position(55, 23),
            sprites["0"].clone().set_position(61, 23),
            sprites["0"].clone().set_position(31, 22),
            sprites["0"].clone().set_position(31, 15),
            sprites["0"].clone().set_position(12, 23),
            sprites["0"].clone().set_position(8, 28),
            sprites["1"].clone().set_position(46, 22),
            sprites["1"].clone().set_position(30, 32),
            sprites["1"].clone().set_position(18, 16),
            sprites["0008hngjwqibfi"].clone().set_position(5, 46),
            sprites["0008hngjwqibfi"].clone().set_position(19, 46),
            sprites["0009mbvjylwely"].clone(),
            sprites["0012qpdeinaukn"].clone().set_position(1, 1).set_scale(2),
            sprites["0014mjywekiwam"].clone().set_position(30, 3),
            sprites["0016fnrcxwfvtx"].clone().set_position(36, 4),
            sprites["0024ritdjmiele"].clone().set_position(16, 0),
        ],
        grid_size=(64, 64),
        data={
            "xkstxyqbs": [[3, 1], [2, 1]],
            "steps": 48,
        },
    ),
    # Level 4
    Level(
        sprites=[
            sprites["0"].clone().set_position(5, 26),
            sprites["0"].clone().set_position(11, 26),
            sprites["0"].clone().set_position(31, 27),
            sprites["0"].clone().set_position(36, 29),
            sprites["0"].clone().set_position(33, 47),
            sprites["0"].clone().set_position(30, 51),
            sprites["0"].clone().set_position(12, 47),
            sprites["0"].clone().set_position(8, 41),
            sprites["0008hngjwqibfi"].clone().set_position(1, 53),
            sprites["0009mbvjylwely"].clone(),
            sprites["0012qpdeinaukn"].clone().set_position(1, 1).set_scale(2),
            sprites["0014mjywekiwam"].clone().set_position(30, 3),
            sprites["0025foufrvfdur"].clone().set_position(16, 0),
            sprites["ybnveypak"].clone().set_position(52, 19),
        ],
        grid_size=(64, 64),
        data={
            "xkstxyqbs": [3, 1],
            "steps": 48,
        },
    ),
    # Level 5
    Level(
        sprites=[
            sprites["0"].clone().set_position(58, 59),
            sprites["0"].clone().set_position(44, 53),
            sprites["0"].clone().set_position(3, 60),
            sprites["0"].clone().set_position(14, 54),
            sprites["1"].clone().set_position(14, 28),
            sprites["1"].clone().set_position(53, 26),
            sprites["1"].clone().set_position(6, 25),
            sprites["1"].clone().set_position(42, 26),
            sprites["0008hngjwqibfi"].clone().set_position(28, 11),
            sprites["0009mbvjylwely"].clone(),
            sprites["0012qpdeinaukn"].clone().set_position(1, 1).set_scale(2),
            sprites["0014mjywekiwam"].clone().set_position(30, 3),
            sprites["0026rogcizlhho"].clone().set_position(16, 0),
            sprites["ybnveypak"].clone().set_position(4, 37),
            sprites["ybnveypak"].clone().set_position(46, 37),
        ],
        grid_size=(64, 64),
        data={
            "xkstxyqbs": [3, 1],
            "steps": 32,
        },
    ),
    # Level 6
    Level(
        sprites=[
            sprites["0000ucykrekiwe"].clone().set_position(36, 3),
            sprites["5"].clone().set_position(33, 32),
            sprites["0008hngjwqibfi"].clone().set_position(2, 12),
            sprites["0008hngjwqibfi"].clone().set_position(52, 53),
            sprites["0009mbvjylwely"].clone(),
            sprites["0012qpdeinaukn"].clone().set_position(1, 1).set_scale(2),
            sprites["0014mjywekiwam"].clone().set_position(30, 3),
            sprites["ybnveypak"].clone().set_position(16, 34),
        ],
        grid_size=(64, 64),
        data={
            "xkstxyqbs": [[3, 1], ["0030xjmmfvfpqm", 1]],
            "steps": 32,
        },
    ),
    # Level 7
    Level(
        sprites=[
            sprites["1"].clone().set_position(9, 25),
            sprites["1"].clone().set_position(20, 35),
            sprites["1"].clone().set_position(6, 35),
            sprites["1"].clone().set_position(30, 37),
            sprites["5"].clone().set_position(51, 46),
            sprites["0008hngjwqibfi"].clone().set_position(19, 13),
            sprites["0008hngjwqibfi"].clone().set_position(40, 18),
            sprites["0009mbvjylwely"].clone(),
            sprites["0012qpdeinaukn"].clone().set_position(1, 1).set_scale(2),
            sprites["0014mjywekiwam"].clone().set_position(30, 3),
            sprites["0014mjywekiwam"].clone().set_position(36, 3),
            sprites["ybnveypak"].clone().set_position(12, 51),
            sprites["ybnveypak"].clone().set_position(52, 56),
        ],
        grid_size=(64, 64),
        data={
            "xkstxyqbs": [3, 2],
            "steps": 32,
        },
    ),
    # Level 8
    Level(
        sprites=[
            sprites["0002wjigybqaof"].clone().set_position(44, 3),
            sprites["3"].clone().set_position(13, 42),
            sprites["3"].clone().set_position(3, 40),
            sprites["0004srpvwsidmy"].clone().set_position(30, 2),
            sprites["0004srpvwsidmy"].clone().set_position(37, 2),
            sprites["5"].clone().set_position(20, 24),
            sprites["0008hngjwqibfi"].clone().set_position(52, 15),
            sprites["0008hngjwqibfi"].clone().set_position(3, 15),
            sprites["0008hngjwqibfi"].clone().set_position(52, 51),
            sprites["0008hngjwqibfi"].clone().set_position(3, 51),
            sprites["0009mbvjylwely"].clone(),
            sprites["0012qpdeinaukn"].clone().set_position(1, 1).set_scale(2),
            sprites["0017dcrmyjphec"].clone().set_position(0, 5),
            sprites["ybnveypak"].clone().set_position(43, 31),
            sprites["ybnveypak"].clone().set_position(29, 53),
            sprites["ybnveypak"].clone().set_position(47, 48),
        ],
        grid_size=(64, 64),
        data={
            "xkstxyqbs": [[4, 2], ["0031xcwudgivus", 1]],
            "steps": 48,
        },
    ),
    # Level 9
    Level(
        sprites=[
            sprites["1"].clone().set_position(18, 46),
            sprites["1"].clone().set_position(23, 52),
            sprites["0001ebagdfaujt"].clone().set_position(42, 3),
            sprites["0004srpvwsidmy"].clone().set_position(30, 2),
            sprites["5"].clone().set_position(35, 48),
            sprites["0008hngjwqibfi"].clone().set_position(7, 37),
            sprites["0008hngjwqibfi"].clone().set_position(49, 51),
            sprites["0008hngjwqibfi"].clone().set_position(7, 51),
            sprites["0009mbvjylwely"].clone(),
            sprites["0012qpdeinaukn"].clone().set_position(1, 1).set_scale(2),
            sprites["0016fnrcxwfvtx"].clone().set_position(37, 4),
            sprites["0017dcrmyjphec"].clone().set_position(0, 5),
            sprites["ybnveypak"].clone().set_position(51, 13),
            sprites["ybnveypak"].clone().set_position(14, 12),
            sprites["ybnveypak"].clone().set_position(15, 22),
            sprites["ybnveypak"].clone().set_position(54, 33),
        ],
        grid_size=(64, 64),
        data={
            "xkstxyqbs": [[4, 1], ["0032qekmtelwqi", 1], [2, 1]],
            "steps": 48,
        },
    ),
]


class cqrtilsbtt(RenderableUserDisplay):
    # Readability v3: structural flow; cqrtilsbtt.__init__:827-831
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, qhtizyoapk: "Su15", ccgddjelir: int):
        self.ccgddjelir = ccgddjelir
        self.current_steps = ccgddjelir
        self.qhtizyoapk = qhtizyoapk
        self.penalty: int = 0

    # Readability v3: update_binding; cqrtilsbtt.eenqiqjzrp:833-834
    # Perform self.current_steps = max(0, min(toqyobvhxn, self.ccgddjelir)); argument/attribute spellings are preserved. [structural-contract]
    def eenqiqjzrp(self, toqyobvhxn: int) -> None:
        self.current_steps = max(0, min(toqyobvhxn, self.ccgddjelir))

    # Readability v3: structural flow; cqrtilsbtt.yijsqthvjp:836-839
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def yijsqthvjp(self) -> bool:
        if self.current_steps > 0:
            self.current_steps -= 1
        return self.current_steps > 0

    # Readability v3: structural flow; cqrtilsbtt.fwlvpsqftm:841-845
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def fwlvpsqftm(self) -> bool:
        if self.current_steps > 0:
            self.current_steps -= 2 + self.penalty * 2
            self.penalty += 1
        return self.current_steps > 0

    # Readability v3: structural flow; cqrtilsbtt.fzacxrogtf:847-849
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def fzacxrogtf(self) -> None:
        self.current_steps = self.ccgddjelir
        self.penalty = 0

    # Readability v3: structural flow; cqrtilsbtt.render_interface:851-856
    # Explicit 5-statement structural flow below; 0 conditions, 0 loops, 4 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def render_interface(self, frame: np.ndarray) -> np.ndarray:
        jgomoaufmn: float = self.current_steps / self.ccgddjelir
        start_y: int = 63
        bqnkerlyqo = int(np.ceil(jgomoaufmn * 64))
        frame[start_y, 0:bqnkerlyqo] = pynrefijae
        return frame


BACKGROUND_COLOR = 5
PADDING_COLOR = 3
zigquexafk: int = -1
pynrefijae: int = 0
krvpnrsbrk: int = 1
orsyjkibvm: int = 2
qonaydbzmh: int = 3
aivrrglqej: int = 4
achiodicac: int = 5
qedddbwazx: int = 6
gmfzfcmzwk: int = 7
yepjhaonen: int = 8
jaigvvwupo: int = 9
ixcfgykcau: int = 10
xepxkjbrxn: int = 11
juhvlkmsnv: int = 12
hsgjxpddyq: int = 13
iwctpsqzhd: int = 14
hnizokhtrr: int = 15
laalrfemee: list[int] = [
    ixcfgykcau,
    qedddbwazx,
    hnizokhtrr,
    xepxkjbrxn,
    juhvlkmsnv,
    yepjhaonen,
    jaigvvwupo,
    gmfzfcmzwk,
    iwctpsqzhd,
]
pqxlzdqwbo: list[str] = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
hlfobwiewm: str = "zmlxwcvwb"
gtjphwocyu: str = "xkstxyqbs"
wklxqtblde: str = ""
hytiizjifk: str = "0030xjmmfvfpqm"
uzyoevbukk: str = "0031xcwudgivus"
wvbbduitdw: str = "0032qekmtelwqi"
ieyrpvflsf: str = "ybnveypak"
fmrxwztzmt: str = "ybnveypak2"
jzfqlydkvt: str = "ybnveypak3"
hhakphrpzr: int = 8
dfqzqaaojo: int = 4
kenolueiiy: int = 4
zutnqpuurv: int = 16
gvvyzrusqq: int = 10
qsqeqpepjy: int = 63


class Su15(ARCBaseGame):
    # Readability v3: structural flow; Su15.__init__:908-958
    # Explicit 46-statement structural flow below; 0 conditions, 0 loops, 45 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self) -> None:
        self.step_counter_ui = cqrtilsbtt(self, 128)
        camera = Camera(
            background=BACKGROUND_COLOR,
            letter_box=PADDING_COLOR,
            interfaces=[self.step_counter_ui],
        )
        self.ojzsjmpic: int = 64
        self.fchredntr: int = 64
        self.lkujttxgs: list[Sprite] = []
        self.fezhhzhih: list[Sprite] = []
        self.powykypsm: list[Sprite] = []
        self.kcuphgwar: dict[Sprite, str] = {}
        self.kqywaxhmsb: dict[Sprite, int] = {}
        self.yxpvimvli: np.ndarray = np.zeros((0, 2), dtype=np.int64)
        self.oxgxfichu: np.ndarray = np.zeros((0,), dtype=np.int64)
        self.kdalkftcb: tuple[int, int] = (0, 0)
        self.xxkedcuzq: list[Sprite] = []
        self.tmfwtfcyv: list[Sprite] = []
        self.xwrhpebfn: int = 0
        self.gdamdvokm: int = dfqzqaaojo
        self.kacsjmxae: int = hhakphrpzr
        self.ikskfqldi: int = kenolueiiy
        self.sqwdaqczb: bool = False
        self.vdgmwvrhd: dict[Sprite, tuple[float, float]] = {}
        self.lphwskxbh: dict[Sprite, tuple[float, float]] = {}
        self.ksuxajatq: set[Sprite] = set()
        self.tsepktxda: dict[Sprite, int] = {}
        self.wqkwfwgny: dict[Sprite, tuple[float, float]] = {}
        self.xydvujvak: dict[Sprite, tuple[float, float]] = {}
        self.lvpppoehd: dict[Sprite, tuple[float, float]] = {}
        self.rmziewkdi: int = 4
        self.dgpsayght: int = 4
        self.ttwugcsth: float = 10.0
        self.idbgnpolc: set[Sprite] = set()
        self.yghzqxumz: dict[Sprite, int] = {}
        self.ppvvgaayv: dict[Sprite, int] = {}
        self.vmgyqpnfu: Sprite | None = None
        self.vxsrkfddz: float = float(self.kacsjmxae)
        self.kqyosprvc: float = float(self.kacsjmxae)
        self.sdrzkrjcp: np.ndarray | None = None
        self.zdoyfxons: np.ndarray | None = None
        self.cmaswhinr: list[Sprite] = []
        self.pbwlyyjqy: dict[Sprite, np.ndarray] = {}
        self.souzbwugw: int = 0
        self.hirfdeznh: int = zutnqpuurv
        self.vsfwpngmx: bool = False
        self.qygchysnh: str = "none"
        self.dsqlbvwaj: list[Any] | None = None
        self.nscnqkkvg: list[list[tuple[str, int, int, int]]] = []
        super().__init__(game_id="su15", levels=levels, camera=camera, available_actions=[6, 7])

    # Readability v3: structural flow; Su15.izzmxojnvq:960-964
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def izzmxojnvq(self) -> None:
        vapqydocml = self.current_level.get_data("steps")
        if vapqydocml:
            self.step_counter_ui.ccgddjelir = vapqydocml
            self.step_counter_ui.fzacxrogtf()

    # Readability v3: structural flow; Su15.on_set_level:966-1041
    # Explicit 74-statement structural flow below; 3 conditions, 6 loops, 55 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def on_set_level(self, level: Level) -> None:
        self.actions: list[ActionInput] = []
        for i in range(16):
            for uwfbekaqks in range(14):
                y = 10 + uwfbekaqks * 4
                self.actions.append(ActionInput(id=GameAction.ACTION6.value, data={"x": i * 4, "y": y}))
        self.izzmxojnvq()
        tgarpfsft = self.current_level.grid_size
        if tgarpfsft is not None:
            self.ojzsjmpic = tgarpfsft[0]
            self.fchredntr = tgarpfsft[1]
        self.dsqlbvwaj = self.current_level.get_data("xkstxyqbs")
        self.qbykqfzrj = self.current_level.get_sprites_by_tag("rgjznrcin")
        self.bicnaxoxq: Sprite | None = None
        bwjkvmuijy = self.current_level.get_sprites_by_tag("ooutlqdaq")
        if self.level_index == 0:
            self.bicnaxoxq = bwjkvmuijy[0]
        self.oicctzexh = False
        self.lkujttxgs = self.current_level.get_sprites_by_tag(hlfobwiewm)
        gztdwgccej: list[Sprite] = self.current_level.get_sprites_by_tag(ieyrpvflsf)
        mvfqadxopc: list[Sprite] = self.current_level.get_sprites_by_tag(fmrxwztzmt)
        ronmgtbgaf: list[Sprite] = self.current_level.get_sprites_by_tag(jzfqlydkvt)
        self.fezhhzhih = []
        self.fezhhzhih.extend(gztdwgccej)
        self.fezhhzhih.extend(mvfqadxopc)
        self.fezhhzhih.extend(ronmgtbgaf)
        self.powykypsm = self.current_level.get_sprites_by_tag(gtjphwocyu)
        self.kcuphgwar = {}
        for anemzlanjq in gztdwgccej:
            self.kcuphgwar[anemzlanjq] = hytiizjifk
        for anemzlanjq in mvfqadxopc:
            self.kcuphgwar[anemzlanjq] = uzyoevbukk
        for anemzlanjq in ronmgtbgaf:
            self.kcuphgwar[anemzlanjq] = wvbbduitdw
        self.kqywaxhmsb.clear()
        for idssvowyh in self.lkujttxgs:
            pkjjooafkc = self.btfgzectsd(idssvowyh)
            self.kqywaxhmsb[idssvowyh] = pkjjooafkc
        self.zmcyxbptrw()
        self.xxkedcuzq = []
        self.tmfwtfcyv = []
        self.vdgmwvrhd = {}
        self.lphwskxbh = {}
        self.kdalkftcb = (0, 0)
        self.xwrhpebfn = 0
        self.vxsrkfddz = float(self.kacsjmxae)
        if self.gdamdvokm > 1:
            self.kqyosprvc = float(self.kacsjmxae) / float(self.gdamdvokm - 1)
        else:
            self.kqyosprvc = float(self.kacsjmxae)
        self.ksuxajatq = set()
        self.tsepktxda = {}
        self.wqkwfwgny = {}
        self.xydvujvak = {}
        self.lvpppoehd = {}
        self.yghzqxumz = {}
        self.ppvvgaayv = {}
        self.idbgnpolc = set()
        self.vmgyqpnfu = sprites["0029obpugmgzgr"].clone()
        self.vmgyqpnfu.pixels = np.full((64, 64), zigquexafk, dtype=np.int64)
        self.current_level.add_sprite(self.vmgyqpnfu)
        vcefodtkwk = self.vmgyqpnfu.pixels
        vqrpxjxvb, kwkzrvive = vcefodtkwk.shape
        gehegqvlkc = np.arange(vqrpxjxvb, dtype=np.float32)
        nmutwuwxtr = np.arange(kwkzrvive, dtype=np.float32)
        self.zdoyfxons, self.sdrzkrjcp = np.meshgrid(gehegqvlkc, nmutwuwxtr, indexing="ij")
        self.jdphqevryx()
        self.cmaswhinr = []
        self.pbwlyyjqy = {}
        self.souzbwugw = 0
        self.vsfwpngmx = False
        self.qygchysnh = "none"
        self.sqwdaqczb = False
        self.gtmjjdjwl = 0
        self.nscnqkkvg = []
        self.hlsimbcfgc()

    # Readability v3: structural flow; Su15.step:1043-1133
    # Explicit 90-statement structural flow below; 23 conditions, 4 loops, 31 writes and 13 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def step(self) -> None:
        if self.vsfwpngmx:
            if self.qygchysnh == "pkqcyfpgc":
                wcgdceupc = 0
                for k in self.qbykqfzrj:
                    nmupxyoavc = k.pixels >= 0
                    k.pixels[nmupxyoavc] = pynrefijae
                    wcgdceupc += 1
                for ucjbljdyjj in self.powykypsm:
                    nmupxyoavc = ucjbljdyjj.pixels >= 0
                    ucjbljdyjj.pixels[nmupxyoavc] = pynrefijae
                self.gtmjjdjwl += 1
                if self.gtmjjdjwl > 10:
                    self.next_level()
                    self.complete_action()
                return
            elif self.qygchysnh == "hquxbykfc":
                rztxdwacar = self.pkrdtzfrth()
                if not self.sqwdaqczb and self.xwrhpebfn >= self.gdamdvokm:
                    self.mdetahtgad()
                    self.sqwdaqczb = True
                    if self.qygchysnh == "ivqtcpakv":
                        return
                if self.cbdhpcilgb():
                    self.jdphqevryx()
                    self.vsfwpngmx = True
                    self.qygchysnh = "pkqcyfpgc"
                    return
                if rztxdwacar:
                    return
                self.vsfwpngmx = False
                self.qygchysnh = "none"
                if not self.xspiwkmfbs():
                    self.oicctzexh = True
                    for k in self.qbykqfzrj:
                        nmupxyoavc = k.pixels >= 0
                        k.pixels[nmupxyoavc] = orsyjkibvm
                    for ucjbljdyjj in self.powykypsm:
                        nmupxyoavc = ucjbljdyjj.pixels >= 0
                        ucjbljdyjj.pixels[nmupxyoavc] = orsyjkibvm
                if self.level_index == 0 and (self.lkujttxgs[0]._x != 3 or self.lkujttxgs[0]._y != 58):
                    if self.bicnaxoxq:
                        self.bicnaxoxq._x = 500
                if self.cbdhpcilgb():
                    self.vsfwpngmx = True
                    self.qygchysnh = "pkqcyfpgc"
                    return
                if len(self.current_level.get_sprites_by_tag("zmlxwcvwb")) == 0:
                    self.lose()
                if not self.step_counter_ui.yijsqthvjp():
                    self.lose()
                self.complete_action()
                return
            if self.qygchysnh == "ivqtcpakv":
                if self.eynzbmjgmr():
                    return
                self.qygchysnh = "none"
                self.vsfwpngmx = False
                self.dvqlynnpid()
                if not self.step_counter_ui.fwlvpsqftm():
                    self.lose()
                    self.complete_action()
                    return
                self.vczehveskr()
                self.complete_action()
                return
            self.vsfwpngmx = False
            self.qygchysnh = "none"
            self.complete_action()
            return
        if self.action.id == GameAction.ACTION6:
            ocsjwrogtp = self.action.data.get("x", 0)
            bmstufadsr = self.action.data.get("y", 0)
            wvckcaajnj = self.camera.display_to_grid(ocsjwrogtp, bmstufadsr)
            if wvckcaajnj is not None:
                grid_x, grid_y = wvckcaajnj
                self.hlsimbcfgc()
                if self.level_index == 0:
                    pvfacacejd = self.current_level.get_sprite_at(grid_x, grid_y, "ooutlqdaq")
                    if pvfacacejd is not None:
                        pvfacacejd._x = 500
                self.axaxyjxqoe(grid_x, grid_y)
                if self.vsfwpngmx:
                    return
            self.complete_action()
            return
        if self.action.id == GameAction.ACTION7:
            self.vczehveskr()
            self.complete_action()
            return
        self.complete_action()

    # Readability v3: structural flow; Su15.axaxyjxqoe:1135-1192
    # Explicit 49-statement structural flow below; 7 conditions, 2 loops, 34 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def axaxyjxqoe(self, grid_x: int, grid_y: int) -> None:
        if grid_y <= gvvyzrusqq - 1 or grid_y >= qsqeqpepjy:
            return
        self.zmcyxbptrw()
        gftsvpxuiq = self.kacsjmxae
        self.ksuxajatq = set()
        self.tsepktxda = {}
        self.wqkwfwgny = {}
        self.xydvujvak = {}
        self.lvpppoehd = {}
        self.yghzqxumz = {}
        self.ppvvgaayv = {}
        self.idbgnpolc = set()
        self.xxkedcuzq = []
        for vqfzoppoqx in self.lkujttxgs:
            if self.kcqeohsztd(grid_x, grid_y, gftsvpxuiq, vqfzoppoqx):
                self.xxkedcuzq.append(vqfzoppoqx)
        self.tmfwtfcyv = []
        self.vdgmwvrhd = {}
        self.lphwskxbh = {}
        if self.fezhhzhih:
            for anemzlanjq in self.fezhhzhih:
                if not self.kcqeohsztd(grid_x, grid_y, gftsvpxuiq, anemzlanjq):
                    continue
                self.tmfwtfcyv.append(anemzlanjq)
                rfugedgvat = self.kcuphgwar.get(anemzlanjq, hytiizjifk)
                bxbzzazmbh = self.dfqhmningy(rfugedgvat)
                if bxbzzazmbh == 1:
                    ybnveypak_center_x, ybnveypak_center_y = self.jdeyppambj(anemzlanjq)
                    yyfwojnham = float(grid_x) - float(ybnveypak_center_x)
                    vbjhtiatba = float(grid_y) - float(ybnveypak_center_y)
                    rkgmfvqbjv = yyfwojnham * yyfwojnham + vbjhtiatba * vbjhtiatba
                    if rkgmfvqbjv > 0.0:
                        rnivijjyic = rkgmfvqbjv**0.5
                        cznadydpzu = yyfwojnham / rnivijjyic
                        iikhmkaafd = vbjhtiatba / rnivijjyic
                    else:
                        cznadydpzu = 0.0
                        iikhmkaafd = 0.0
                    self.vdgmwvrhd[anemzlanjq] = (
                        cznadydpzu,
                        iikhmkaafd,
                    )
                    self.lphwskxbh[anemzlanjq] = (
                        float(anemzlanjq.x),
                        float(anemzlanjq.y),
                    )
        self.kdalkftcb = (grid_x, grid_y)
        self.xwrhpebfn = 0
        self.vxsrkfddz = float(self.kacsjmxae)
        if self.gdamdvokm > 1:
            self.kqyosprvc = float(self.kacsjmxae) / float(self.gdamdvokm - 1)
        else:
            self.kqyosprvc = float(self.kacsjmxae)
        self.sqwdaqczb = False
        self.vsfwpngmx = True
        self.qygchysnh = "hquxbykfc"
        self.rgxlnsrafr()

    # Readability v3: structural flow; Su15.rgxlnsrafr:1194-1215
    # Explicit 21-statement structural flow below; 4 conditions, 0 loops, 13 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def rgxlnsrafr(self) -> None:
        if self.vmgyqpnfu is None:
            return
        if self.vmgyqpnfu.pixels is None:
            return
        if self.sdrzkrjcp is None or self.zdoyfxons is None:
            return
        pixels = self.vmgyqpnfu.pixels
        pixels[:, :] = zigquexafk
        gftsvpxuiq = self.vxsrkfddz
        if gftsvpxuiq <= 0.0:
            return
        japluzaoug, umozkwcyky = self.kdalkftcb
        nqdbgihms = self.sdrzkrjcp - float(japluzaoug)
        osrxilboj = self.zdoyfxons - float(umozkwcyky)
        oxnygnotwd = nqdbgihms * nqdbgihms + osrxilboj * osrxilboj
        zzxrzkzznt = gftsvpxuiq + 0.5
        fxsqdowuki = max(0.0, gftsvpxuiq - 0.5)
        nimbwqhcib = zzxrzkzznt * zzxrzkzznt
        ahgqxgjvku = fxsqdowuki * fxsqdowuki
        enmwfircgg = (oxnygnotwd <= nimbwqhcib) & (oxnygnotwd >= ahgqxgjvku)
        pixels[enmwfircgg] = pynrefijae

    # Readability v3: structural flow; Su15.jdphqevryx:1217-1222
    # Explicit 5-statement structural flow below; 2 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jdphqevryx(self) -> None:
        if self.vmgyqpnfu is None:
            return
        if self.vmgyqpnfu.pixels is None:
            return
        self.vmgyqpnfu.pixels[:, :] = zigquexafk

    # Readability v3: structural flow; Su15.mdetahtgad:1224-1279
    # Explicit 43-statement structural flow below; 8 conditions, 5 loops, 12 writes and 5 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def mdetahtgad(self) -> None:
        self.qzquneuehr()
        if self.qygchysnh == "ivqtcpakv":
            return
        if not self.xxkedcuzq:
            return
        self.zmcyxbptrw()
        ovfvfdmrud = len(self.xxkedcuzq)
        if ovfvfdmrud < 2:
            return
        vqqhofowim = [self.kqywaxhmsb.get(sprite, 0) for sprite in self.xxkedcuzq]
        kqmetscwmn = list(range(ovfvfdmrud))

        # Readability v3: structural flow; Su15.mdetahtgad.gowqbwwsed:1237-1241
        # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
        def gowqbwwsed(index: int) -> int:
            while kqmetscwmn[index] != index:
                kqmetscwmn[index] = kqmetscwmn[kqmetscwmn[index]]
                index = kqmetscwmn[index]
            return index

        # Readability v3: structural flow; Su15.mdetahtgad.qdyhkwlnyx:1243-1248
        # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 3 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
        def qdyhkwlnyx(krrzhdajaz: int, rgulzzwawh: int) -> None:
            qixjotkvyq = gowqbwwsed(krrzhdajaz)
            fxjjzkgcgl = gowqbwwsed(rgulzzwawh)
            if qixjotkvyq == fxjjzkgcgl:
                return
            kqmetscwmn[fxjjzkgcgl] = qixjotkvyq

        for i in range(ovfvfdmrud):
            hspentbnhg = self.xxkedcuzq[i]
            for uwfbekaqks in range(i + 1, ovfvfdmrud):
                mjiosbwmpx = self.xxkedcuzq[uwfbekaqks]
                if not self.nbfpjkxrnp(hspentbnhg, mjiosbwmpx):
                    continue
                rcfypaeddu = vqqhofowim[i]
                qnvvfsoqxc = vqqhofowim[uwfbekaqks]
                if rcfypaeddu != qnvvfsoqxc:
                    self.awbfxdhccd([hspentbnhg, mjiosbwmpx])
                    return
                qdyhkwlnyx(i, uwfbekaqks)
        ypjyzbmprw: dict[int, list[int]] = {}
        for index in range(ovfvfdmrud):
            kyhdycbnus = gowqbwwsed(index)
            if kyhdycbnus not in ypjyzbmprw:
                ypjyzbmprw[kyhdycbnus] = []
            ypjyzbmprw[kyhdycbnus].append(index)
        zgqoekdave: list[list[Sprite]] = []
        for wwzgpunthz in ypjyzbmprw.values():
            if len(wwzgpunthz) < 2:
                continue
            snzvwlrppz: list[Sprite] = []
            for index in wwzgpunthz:
                snzvwlrppz.append(self.xxkedcuzq[index])
            zgqoekdave.append(snzvwlrppz)
        if not zgqoekdave:
            return
        self.nhtlfoopnx(zgqoekdave)
        self.zmcyxbptrw()

    # Readability v3: structural flow; Su15.qzquneuehr:1281-1329
    # Explicit 36-statement structural flow below; 6 conditions, 5 loops, 12 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def qzquneuehr(self) -> None:
        andzintqcy = len(self.fezhhzhih)
        if andzintqcy < 2:
            return
        hhiiqyhjow: list[str] = [self.kcuphgwar.get(anemzlanjq, hytiizjifk) for anemzlanjq in self.fezhhzhih]
        kqmetscwmn = list(range(andzintqcy))

        # Readability v3: structural flow; Su15.qzquneuehr.gowqbwwsed:1288-1292
        # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
        def gowqbwwsed(index: int) -> int:
            while kqmetscwmn[index] != index:
                kqmetscwmn[index] = kqmetscwmn[kqmetscwmn[index]]
                index = kqmetscwmn[index]
            return index

        # Readability v3: structural flow; Su15.qzquneuehr.qdyhkwlnyx:1294-1299
        # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 3 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
        def qdyhkwlnyx(krrzhdajaz: int, rgulzzwawh: int) -> None:
            qixjotkvyq = gowqbwwsed(krrzhdajaz)
            fxjjzkgcgl = gowqbwwsed(rgulzzwawh)
            if qixjotkvyq == fxjjzkgcgl:
                return
            kqmetscwmn[fxjjzkgcgl] = qixjotkvyq

        for i in range(andzintqcy):
            kfsbjqyrrw = self.fezhhzhih[i]
            for uwfbekaqks in range(i + 1, andzintqcy):
                cdvujwxdfn = self.fezhhzhih[uwfbekaqks]
                if not self.nbfpjkxrnp(kfsbjqyrrw, cdvujwxdfn):
                    continue
                gfireydfrc = hhiiqyhjow[i]
                rklaapxvoe = hhiiqyhjow[uwfbekaqks]
                if gfireydfrc != rklaapxvoe:
                    self.awbfxdhccd([kfsbjqyrrw, cdvujwxdfn])
                    return
                qdyhkwlnyx(i, uwfbekaqks)
        ypjyzbmprw: dict[int, list[int]] = {}
        for index in range(andzintqcy):
            kyhdycbnus = gowqbwwsed(index)
            if kyhdycbnus not in ypjyzbmprw:
                ypjyzbmprw[kyhdycbnus] = []
            ypjyzbmprw[kyhdycbnus].append(index)
        zgqoekdave: list[list[Sprite]] = []
        for wwzgpunthz in ypjyzbmprw.values():
            if len(wwzgpunthz) < 2:
                continue
            snzvwlrppz: list[Sprite] = []
            for index in wwzgpunthz:
                snzvwlrppz.append(self.fezhhzhih[index])
            zgqoekdave.append(snzvwlrppz)
        if not zgqoekdave:
            return
        self.lgrcinsiro(zgqoekdave)

    # Readability v3: merge_equal_tier_pieces; Su15.nhtlfoopnx:1331-1407
    # Replace equal-tier clusters with successor or remove max tier, lines 1331-1407 [previous-source-reviewed]
    def nhtlfoopnx(self, zgqoekdave: list[list[Sprite]]) -> None:
        pbfbrrqdff = len(pqxlzdqwbo) - 1

        # Readability v3: structural flow; Su15.nhtlfoopnx.neefixscnn:1334-1348
        # Explicit 14-statement structural flow below; 7 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
        def neefixscnn(sprite: Sprite) -> None:
            if sprite in self.ksuxajatq:
                self.ksuxajatq.discard(sprite)
            if sprite in self.tsepktxda:
                del self.tsepktxda[sprite]
            if sprite in self.wqkwfwgny:
                del self.wqkwfwgny[sprite]
            if sprite in self.xydvujvak:
                del self.xydvujvak[sprite]
            if sprite in self.lvpppoehd:
                del self.lvpppoehd[sprite]
            if sprite in self.ppvvgaayv:
                del self.ppvvgaayv[sprite]
            if sprite in self.idbgnpolc:
                self.idbgnpolc.discard(sprite)

        for snzvwlrppz in zgqoekdave:
            if not snzvwlrppz:
                continue
            pkjjooafkc = self.kqywaxhmsb.get(snzvwlrppz[0], 0)
            if pkjjooafkc >= pbfbrrqdff:
                for sprite in snzvwlrppz:
                    neefixscnn(sprite)
                    self.current_level.remove_sprite(sprite)
                    if sprite in self.lkujttxgs:
                        self.lkujttxgs.remove(sprite)
                    if sprite in self.kqywaxhmsb:
                        del self.kqywaxhmsb[sprite]
                    if sprite in self.xxkedcuzq:
                        self.xxkedcuzq.remove(sprite)
                continue
            pljvvgnzca = pkjjooafkc + 1
            lbwxpvpmok = pqxlzdqwbo[pljvvgnzca]
            qivzbymurt = sprites[lbwxpvpmok]
            qzpprflhhj = qivzbymurt.clone()
            jlkbdcssnx = 0
            lhsprshuve = 0
            for sprite in snzvwlrppz:
                japluzaoug, umozkwcyky = self.jdeyppambj(sprite)
                jlkbdcssnx += japluzaoug
                lhsprshuve += umozkwcyky
            japluzaoug = jlkbdcssnx // len(snzvwlrppz)
            umozkwcyky = lhsprshuve // len(snzvwlrppz)
            if qzpprflhhj.pixels is not None:
                sprite_height, sprite_width = qzpprflhhj.pixels.shape
            else:
                sprite_height, sprite_width = (1, 1)
            lswmtgatho = japluzaoug - sprite_width // 2
            fxxzdqxseh = umozkwcyky - sprite_height // 2
            if lswmtgatho < 0:
                lswmtgatho = 0
            max_x = self.ojzsjmpic - sprite_width
            if lswmtgatho > max_x:
                lswmtgatho = max_x
            if fxxzdqxseh < gvvyzrusqq:
                fxxzdqxseh = gvvyzrusqq
            if fxxzdqxseh > qsqeqpepjy:
                fxxzdqxseh = qsqeqpepjy
            max_y = self.fchredntr - sprite_height
            if fxxzdqxseh > max_y:
                fxxzdqxseh = max_y
            qzpprflhhj.set_position(lswmtgatho, fxxzdqxseh)
            self.current_level.add_sprite(qzpprflhhj)
            self.lkujttxgs.append(qzpprflhhj)
            self.kqywaxhmsb[qzpprflhhj] = pljvvgnzca
            for sprite in snzvwlrppz:
                neefixscnn(sprite)
                self.current_level.remove_sprite(sprite)
                if sprite in self.lkujttxgs:
                    self.lkujttxgs.remove(sprite)
                if sprite in self.kqywaxhmsb:
                    del self.kqywaxhmsb[sprite]
                if sprite in self.xxkedcuzq:
                    self.xxkedcuzq.remove(sprite)

    # Readability v3: structural flow; Su15.lgrcinsiro:1409-1455
    # Explicit 45-statement structural flow below; 9 conditions, 4 loops, 25 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def lgrcinsiro(self, zgqoekdave: list[list[Sprite]]) -> None:
        for snzvwlrppz in zgqoekdave:
            if not snzvwlrppz:
                continue
            qjzanqzagz = snzvwlrppz[0]
            rfugedgvat = self.kcuphgwar.get(qjzanqzagz, hytiizjifk)
            lmxscdggyk = self.caaczjajzu(rfugedgvat)
            if lmxscdggyk is None:
                for anemzlanjq in snzvwlrppz:
                    self.cnbyleshjj(anemzlanjq)
                continue
            trlnaqwkjs = self.rhziiktjfu(lmxscdggyk)
            gnrtfcxhpx = trlnaqwkjs.clone()
            jlkbdcssnx = 0
            lhsprshuve = 0
            for anemzlanjq in snzvwlrppz:
                japluzaoug, umozkwcyky = self.jdeyppambj(anemzlanjq)
                jlkbdcssnx += japluzaoug
                lhsprshuve += umozkwcyky
            japluzaoug = jlkbdcssnx // len(snzvwlrppz)
            umozkwcyky = lhsprshuve // len(snzvwlrppz)
            if gnrtfcxhpx.pixels is not None:
                sprite_height, sprite_width = gnrtfcxhpx.pixels.shape
            else:
                sprite_height, sprite_width = (1, 1)
            lswmtgatho = japluzaoug - sprite_width // 2
            fxxzdqxseh = umozkwcyky - sprite_height // 2
            if lswmtgatho < 0:
                lswmtgatho = 0
            max_x = self.ojzsjmpic - sprite_width
            if lswmtgatho > max_x:
                lswmtgatho = max_x
            if fxxzdqxseh < gvvyzrusqq:
                fxxzdqxseh = gvvyzrusqq
            if fxxzdqxseh > qsqeqpepjy:
                fxxzdqxseh = qsqeqpepjy
            max_y = self.fchredntr - sprite_height
            if fxxzdqxseh > max_y:
                fxxzdqxseh = max_y
            gnrtfcxhpx.set_position(lswmtgatho, fxxzdqxseh)
            self.current_level.add_sprite(gnrtfcxhpx)
            self.fezhhzhih.append(gnrtfcxhpx)
            self.kcuphgwar[gnrtfcxhpx] = lmxscdggyk
            if self.vsfwpngmx and self.qygchysnh == "hquxbykfc":
                self.yghzqxumz[gnrtfcxhpx] = self.gdamdvokm
            for anemzlanjq in snzvwlrppz:
                self.cnbyleshjj(anemzlanjq)

    # Readability v3: structural flow; Su15.awbfxdhccd:1457-1474
    # Explicit 17-statement structural flow below; 2 conditions, 2 loops, 9 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def awbfxdhccd(self, lnzfiekhpm: list[Sprite]) -> None:
        self.jdphqevryx()
        self.cmaswhinr = []
        self.pbwlyyjqy = {}
        for sprite in lnzfiekhpm:
            if sprite.pixels is None:
                continue
            if sprite in self.pbwlyyjqy:
                continue
            self.cmaswhinr.append(sprite)
            self.pbwlyyjqy[sprite] = sprite.pixels.copy()
        for sprite in self.cmaswhinr:
            pixels = sprite.pixels
            nmupxyoavc = pixels > -1
            pixels[nmupxyoavc] = pynrefijae
        self.souzbwugw = 0
        self.vsfwpngmx = True
        self.qygchysnh = "ivqtcpakv"

    # Readability v3: structural flow; Su15.eynzbmjgmr:1476-1495
    # Explicit 18-statement structural flow below; 5 conditions, 1 loops, 7 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def eynzbmjgmr(self) -> bool:
        if not self.cmaswhinr:
            return False
        yxjjutvbki = self.souzbwugw // 2 % 2 == 0
        for sprite in self.cmaswhinr:
            if sprite.pixels is None:
                continue
            pixels = sprite.pixels
            if sprite not in self.pbwlyyjqy:
                continue
            if yxjjutvbki:
                nmupxyoavc = pixels > -1
                pixels[nmupxyoavc] = pynrefijae
            else:
                bfikaltben = self.pbwlyyjqy[sprite]
                pixels[:, :] = bfikaltben
        self.souzbwugw += 1
        if self.souzbwugw < self.hirfdeznh:
            return True
        return False

    # Readability v3: structural flow; Su15.dvqlynnpid:1497-1503
    # Explicit 6-statement structural flow below; 1 conditions, 1 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def dvqlynnpid(self) -> None:
        for sprite, bfikaltben in self.pbwlyyjqy.items():
            if sprite.pixels is None:
                continue
            sprite.pixels[:, :] = bfikaltben
        self.cmaswhinr = []
        self.pbwlyyjqy = {}

    # Readability v3: structural flow; Su15.pkrdtzfrth:1505-1578
    # Explicit 68-statement structural flow below; 19 conditions, 1 loops, 34 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def pkrdtzfrth(self) -> bool:
        japluzaoug, umozkwcyky = self.kdalkftcb
        vnhiibmkoy: list[Sprite] = []
        if self.xxkedcuzq:
            vnhiibmkoy.extend(self.xxkedcuzq)
        if self.tmfwtfcyv:
            vnhiibmkoy.extend(self.tmfwtfcyv)
        msskikgokt = self.knkahdczsl()
        for sprite in vnhiibmkoy:
            if sprite in self.ksuxajatq:
                continue
            if sprite in self.fezhhzhih and msskikgokt:
                continue
            ixodhycija = sprite in self.vdgmwvrhd and sprite in self.lphwskxbh
            if ixodhycija:
                cznadydpzu, iikhmkaafd = self.vdgmwvrhd[sprite]
                hsopfzmdrz, fhrepqlzmy = self.lphwskxbh[sprite]
                wprumcasdq = float(self.ikskfqldi * 0.85)
                hsopfzmdrz += cznadydpzu * wprumcasdq
                fhrepqlzmy += iikhmkaafd * wprumcasdq
                lswmtgatho = int(round(hsopfzmdrz))
                fxxzdqxseh = int(round(fhrepqlzmy))
            else:
                sprite_center_x, sprite_center_y = self.jdeyppambj(sprite)
                dx = japluzaoug - sprite_center_x
                dy = umozkwcyky - sprite_center_y
                ifotaevzvy = 0
                lunqhmdjwn = 0
                if dx > 0:
                    ifotaevzvy = min(self.ikskfqldi, dx)
                elif dx < 0:
                    ifotaevzvy = max(-self.ikskfqldi, dx)
                if dy > 0:
                    lunqhmdjwn = min(self.ikskfqldi, dy)
                elif dy < 0:
                    lunqhmdjwn = max(-self.ikskfqldi, dy)
                lswmtgatho = sprite.x + ifotaevzvy
                fxxzdqxseh = sprite.y + lunqhmdjwn
            if sprite.pixels is not None:
                sprite_height, sprite_width = sprite.pixels.shape
            else:
                sprite_height, sprite_width = (1, 1)
            if lswmtgatho < 0:
                lswmtgatho = 0
            max_x = self.ojzsjmpic - sprite_width
            if lswmtgatho > max_x:
                lswmtgatho = max_x
            if fxxzdqxseh < gvvyzrusqq:
                fxxzdqxseh = gvvyzrusqq
            if fxxzdqxseh > qsqeqpepjy:
                fxxzdqxseh = qsqeqpepjy
            max_y = self.fchredntr - sprite_height
            if fxxzdqxseh > max_y:
                fxxzdqxseh = max_y
            if ixodhycija:
                self.lphwskxbh[sprite] = (
                    float(lswmtgatho),
                    float(fxxzdqxseh),
                )
            sprite.set_position(lswmtgatho, fxxzdqxseh)
        self.sgmsqapcxe()
        if self.qygchysnh != "hquxbykfc":
            self.jdphqevryx()
            return True
        self.xwrhpebfn += 1
        self.vxsrkfddz = max(0.0, self.vxsrkfddz - self.kqyosprvc)
        self.rgxlnsrafr()
        if self.xwrhpebfn < self.gdamdvokm:
            return True
        if self.ksuxajatq:
            self.jdphqevryx()
            return True
        self.jdphqevryx()
        return False

    # Readability v3: structural flow; Su15.sgmsqapcxe:1580-1678
    # Explicit 97-statement structural flow below; 32 conditions, 7 loops, 36 writes and 6 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sgmsqapcxe(self) -> None:
        ygvuhhknqx = self.knkahdczsl()
        if self.ksuxajatq:
            self.luwexfjhwl()
        if self.yghzqxumz:
            wbqkmjcnbs: list[Sprite] = []
            for anemzlanjq, funzeszzzn in self.yghzqxumz.items():
                if funzeszzzn > 0:
                    self.yghzqxumz[anemzlanjq] = funzeszzzn - 1
                if self.yghzqxumz[anemzlanjq] <= 0:
                    wbqkmjcnbs.append(anemzlanjq)
            for anemzlanjq in wbqkmjcnbs:
                del self.yghzqxumz[anemzlanjq]
        if self.xwrhpebfn >= self.gdamdvokm:
            return
        if not self.fezhhzhih:
            return
        if not self.lkujttxgs:
            return
        if ygvuhhknqx:
            return
        nblujelyki = set(self.tmfwtfcyv)
        mdmdopkprx = set(self.yghzqxumz.keys())
        for anemzlanjq in self.fezhhzhih:
            if anemzlanjq in nblujelyki:
                continue
            if anemzlanjq in mdmdopkprx:
                continue
            raurpyopqy = False
            for vqfzoppoqx in self.lkujttxgs:
                if vqfzoppoqx not in self.ksuxajatq:
                    raurpyopqy = True
                    break
            if not raurpyopqy:
                break
            kpyftizzu, cbabrshqb = self.jdeyppambj(anemzlanjq)
            alwfabveaa: Sprite | None = None
            kedldpfgvf: int | None = None
            for vqfzoppoqx in self.lkujttxgs:
                if vqfzoppoqx in self.ksuxajatq:
                    continue
                twvnsfeqq, hambxrjgh = self.jdeyppambj(vqfzoppoqx)
                dx = twvnsfeqq - kpyftizzu
                dy = hambxrjgh - cbabrshqb
                oxnygnotwd = dx * dx + dy * dy
                if kedldpfgvf is None or oxnygnotwd < kedldpfgvf:
                    kedldpfgvf = oxnygnotwd
                    alwfabveaa = vqfzoppoqx
            if alwfabveaa is None:
                continue
            target_center_x, target_center_y = self.jdeyppambj(alwfabveaa)
            rfugedgvat = self.kcuphgwar.get(anemzlanjq, hytiizjifk)
            skbnuhqexk = 2 if rfugedgvat == wvbbduitdw else 1
            wwlsjeavpw = 0
            mzievdmpvu = 0
            if target_center_x > kpyftizzu:
                wwlsjeavpw = skbnuhqexk
            elif target_center_x < kpyftizzu:
                wwlsjeavpw = -skbnuhqexk
            if target_center_y > cbabrshqb:
                mzievdmpvu = skbnuhqexk
            elif target_center_y < cbabrshqb:
                mzievdmpvu = -skbnuhqexk
            lswmtgatho = anemzlanjq.x + wwlsjeavpw
            fxxzdqxseh = anemzlanjq.y + mzievdmpvu
            if anemzlanjq.pixels is not None:
                ybnveypak_height, ybnveypak_width = anemzlanjq.pixels.shape
            else:
                ybnveypak_height, ybnveypak_width = (1, 1)
            if lswmtgatho < 0:
                lswmtgatho = 0
            max_x = self.ojzsjmpic - ybnveypak_width
            if lswmtgatho > max_x:
                lswmtgatho = max_x
            if fxxzdqxseh < gvvyzrusqq:
                fxxzdqxseh = gvvyzrusqq
            if fxxzdqxseh > qsqeqpepjy:
                fxxzdqxseh = qsqeqpepjy
            max_y = self.fchredntr - ybnveypak_height
            if fxxzdqxseh > max_y:
                fxxzdqxseh = max_y
            anemzlanjq.set_position(lswmtgatho, fxxzdqxseh)
        if not self.lkujttxgs:
            return
        for anemzlanjq in self.fezhhzhih:
            if anemzlanjq in mdmdopkprx:
                continue
            if anemzlanjq in nblujelyki:
                continue
            for vqfzoppoqx in self.lkujttxgs:
                if vqfzoppoqx in self.ksuxajatq:
                    continue
                if not self.nbfpjkxrnp(anemzlanjq, vqfzoppoqx):
                    continue
                self.wwvumwkgbn(anemzlanjq, vqfzoppoqx)
        self.zmcyxbptrw()
        self.qzquneuehr()
        if self.qygchysnh == "ivqtcpakv":
            return

    # Readability v3: structural flow; Su15.knkahdczsl:1680-1693
    # Explicit 13-statement structural flow below; 5 conditions, 1 loops, 2 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def knkahdczsl(self) -> bool:
        if not self.ksuxajatq:
            return False
        if self.dgpsayght <= 0:
            return False
        for vqfzoppoqx in self.ksuxajatq:
            if vqfzoppoqx in self.idbgnpolc:
                continue
            neqewdesmz = self.tsepktxda.get(vqfzoppoqx, 0)
            if neqewdesmz >= self.rmziewkdi:
                orolhjloqv = self.rmziewkdi + self.dgpsayght
                if neqewdesmz < orolhjloqv:
                    return True
        return False

    # Readability v3: structural flow; Su15.wwvumwkgbn:1695-1729
    # Explicit 33-statement structural flow below; 6 conditions, 0 loops, 23 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wwvumwkgbn(self, anemzlanjq: Sprite, vqfzoppoqx: Sprite) -> None:
        if vqfzoppoqx not in self.lkujttxgs:
            return
        if vqfzoppoqx in self.ksuxajatq:
            return
        kqywaxhmsb = self.kqywaxhmsb.get(vqfzoppoqx, 0)
        hgdggqongh = kqywaxhmsb <= 0
        if not hgdggqongh:
            tsqyqgiwlh = kqywaxhmsb - 1
            self.ppvvgaayv[vqfzoppoqx] = tsqyqgiwlh
        fruit_center_x, fruit_center_y = self.jdeyppambj(vqfzoppoqx)
        ybnveypak_center_x, ybnveypak_center_y = self.jdeyppambj(anemzlanjq)
        cznadydpzu = float(fruit_center_x - ybnveypak_center_x)
        iikhmkaafd = float(fruit_center_y - ybnveypak_center_y)
        rkgmfvqbjv = cznadydpzu * cznadydpzu + iikhmkaafd * iikhmkaafd
        if rkgmfvqbjv > 0.0:
            rnivijjyic = rkgmfvqbjv**0.5
            cznadydpzu /= rnivijjyic
            iikhmkaafd /= rnivijjyic
        else:
            cznadydpzu = 0.0
            iikhmkaafd = -1.0
        if cznadydpzu == 0.0 and iikhmkaafd == 0.0:
            iikhmkaafd = -1.0
        self.ksuxajatq.add(vqfzoppoqx)
        self.tsepktxda[vqfzoppoqx] = 0
        jhlnuaroik = float(vqfzoppoqx.x)
        tnhddbgxex = float(vqfzoppoqx.y)
        self.wqkwfwgny[vqfzoppoqx] = (jhlnuaroik, tnhddbgxex)
        self.xydvujvak[vqfzoppoqx] = (cznadydpzu, iikhmkaafd)
        self.lvpppoehd[vqfzoppoqx] = (jhlnuaroik, tnhddbgxex)
        if hgdggqongh:
            self.idbgnpolc.add(vqfzoppoqx)
        orolhjloqv = self.rmziewkdi + self.dgpsayght + 1
        self.yghzqxumz[anemzlanjq] = orolhjloqv

    # Readability v3: structural flow; Su15.luwexfjhwl:1731-1831
    # Explicit 97-statement structural flow below; 29 conditions, 2 loops, 45 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def luwexfjhwl(self) -> None:
        if not self.ksuxajatq:
            return
        oalpjmidgc: list[Sprite] = []
        orolhjloqv = self.rmziewkdi + self.dgpsayght
        for vqfzoppoqx in list(self.ksuxajatq):
            if vqfzoppoqx not in self.tsepktxda:
                oalpjmidgc.append(vqfzoppoqx)
                continue
            neqewdesmz = self.tsepktxda[vqfzoppoqx]
            dqwcyxxvbh = self.wqkwfwgny.get(vqfzoppoqx)
            xuubxrwgkw = self.xydvujvak.get(vqfzoppoqx)
            ilndajskvn = self.lvpppoehd.get(vqfzoppoqx)
            if dqwcyxxvbh is None or xuubxrwgkw is None or ilndajskvn is None:
                oalpjmidgc.append(vqfzoppoqx)
                continue
            dfyvbkepij = orolhjloqv
            if vqfzoppoqx in self.idbgnpolc:
                dfyvbkepij = self.rmziewkdi
            jhlnuaroik, tnhddbgxex = dqwcyxxvbh
            cznadydpzu, iikhmkaafd = xuubxrwgkw
            hsopfzmdrz, fhrepqlzmy = ilndajskvn
            if neqewdesmz < self.rmziewkdi:
                qvmgcmqzjo = neqewdesmz % 4
                qbelyscyqo = 0.0
                if qvmgcmqzjo == 1:
                    qbelyscyqo = -1.0
                elif qvmgcmqzjo == 3:
                    qbelyscyqo = 1.0
                hsopfzmdrz = jhlnuaroik
                fhrepqlzmy = tnhddbgxex + qbelyscyqo
                if self.dgpsayght == 0 and neqewdesmz + 1 == self.rmziewkdi and (vqfzoppoqx in self.ppvvgaayv):
                    tsqyqgiwlh = self.ppvvgaayv[vqfzoppoqx]
                    self.kqywaxhmsb[vqfzoppoqx] = tsqyqgiwlh
                    lbwxpvpmok = pqxlzdqwbo[tsqyqgiwlh]
                    trlnaqwkjs = sprites[lbwxpvpmok]
                    if trlnaqwkjs.pixels is not None:
                        vqfzoppoqx.pixels = trlnaqwkjs.pixels.copy()
                    del self.ppvvgaayv[vqfzoppoqx]
            else:
                if vqfzoppoqx in self.ppvvgaayv:
                    tsqyqgiwlh = self.ppvvgaayv[vqfzoppoqx]
                    self.kqywaxhmsb[vqfzoppoqx] = tsqyqgiwlh
                    lbwxpvpmok = pqxlzdqwbo[tsqyqgiwlh]
                    trlnaqwkjs = sprites[lbwxpvpmok]
                    if trlnaqwkjs.pixels is not None:
                        vqfzoppoqx.pixels = trlnaqwkjs.pixels.copy()
                    del self.ppvvgaayv[vqfzoppoqx]
                if self.dgpsayght > 0:
                    xkotgrqwjl = self.ttwugcsth / float(self.dgpsayght)
                else:
                    xkotgrqwjl = self.ttwugcsth
                hsopfzmdrz += cznadydpzu * xkotgrqwjl
                fhrepqlzmy += iikhmkaafd * xkotgrqwjl
                self.lvpppoehd[vqfzoppoqx] = (hsopfzmdrz, fhrepqlzmy)
            lswmtgatho = int(round(hsopfzmdrz))
            fxxzdqxseh = int(round(fhrepqlzmy))
            if vqfzoppoqx.pixels is not None:
                fruit_height, fruit_width = vqfzoppoqx.pixels.shape
            else:
                fruit_height, fruit_width = (1, 1)
            if lswmtgatho < 0:
                lswmtgatho = 0
            max_x = self.ojzsjmpic - fruit_width
            if lswmtgatho > max_x:
                lswmtgatho = max_x
            if fxxzdqxseh < gvvyzrusqq:
                fxxzdqxseh = gvvyzrusqq
            if fxxzdqxseh > qsqeqpepjy:
                fxxzdqxseh = qsqeqpepjy
            max_y = self.fchredntr - fruit_height
            if fxxzdqxseh > max_y:
                fxxzdqxseh = max_y
            vqfzoppoqx.set_position(lswmtgatho, fxxzdqxseh)
            neqewdesmz += 1
            self.tsepktxda[vqfzoppoqx] = neqewdesmz
            if neqewdesmz >= dfyvbkepij:
                oalpjmidgc.append(vqfzoppoqx)
        if not oalpjmidgc:
            return
        for vqfzoppoqx in oalpjmidgc:
            self.ksuxajatq.discard(vqfzoppoqx)
            if vqfzoppoqx in self.tsepktxda:
                del self.tsepktxda[vqfzoppoqx]
            if vqfzoppoqx in self.wqkwfwgny:
                del self.wqkwfwgny[vqfzoppoqx]
            if vqfzoppoqx in self.xydvujvak:
                del self.xydvujvak[vqfzoppoqx]
            if vqfzoppoqx in self.lvpppoehd:
                del self.lvpppoehd[vqfzoppoqx]
            if vqfzoppoqx in self.ppvvgaayv:
                del self.ppvvgaayv[vqfzoppoqx]
            if vqfzoppoqx in self.idbgnpolc:
                self.idbgnpolc.discard(vqfzoppoqx)
                self.current_level.remove_sprite(vqfzoppoqx)
                if vqfzoppoqx in self.lkujttxgs:
                    self.lkujttxgs.remove(vqfzoppoqx)
                if vqfzoppoqx in self.kqywaxhmsb:
                    del self.kqywaxhmsb[vqfzoppoqx]
                if vqfzoppoqx in self.xxkedcuzq:
                    self.xxkedcuzq.remove(vqfzoppoqx)

    # Readability v3: structural flow; Su15.btfgzectsd:1833-1838
    # Explicit 5-statement structural flow below; 1 conditions, 1 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def btfgzectsd(self, sprite: Sprite) -> int:
        for tag in sprite.tags:
            if tag == "zmlxwcvwb":
                continue
            return int(tag)
        return 0

    # Readability v3: structural flow; Su15.zmcyxbptrw:1840-1850
    # Explicit 10-statement structural flow below; 0 conditions, 1 loops, 9 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zmcyxbptrw(self) -> None:
        xihyciztqg = len(self.lkujttxgs)
        pdopxwnypp = np.zeros((xihyciztqg, 2), dtype=np.int64)
        vqqhofowim = np.zeros((xihyciztqg,), dtype=np.int64)
        for i, sprite in enumerate(self.lkujttxgs):
            japluzaoug, umozkwcyky = self.jdeyppambj(sprite)
            pdopxwnypp[i, 0] = japluzaoug
            pdopxwnypp[i, 1] = umozkwcyky
            vqqhofowim[i] = self.kqywaxhmsb.get(sprite, 0)
        self.yxpvimvli = pdopxwnypp
        self.oxgxfichu = vqqhofowim

    # Readability v3: structural flow; Su15.jdeyppambj:1852-1859
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 4 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jdeyppambj(self, sprite: Sprite) -> tuple[int, int]:
        if sprite.pixels is not None:
            sprite_height, sprite_width = sprite.pixels.shape
        else:
            sprite_height, sprite_width = (1, 1)
        japluzaoug = sprite.x + sprite_width // 2
        umozkwcyky = sprite.y + sprite_height // 2
        return (japluzaoug, umozkwcyky)

    # Readability v3: structural flow; Su15.nbfpjkxrnp:1861-1886
    # Explicit 23-statement structural flow below; 6 conditions, 0 loops, 12 writes and 5 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def nbfpjkxrnp(self, hspentbnhg: Sprite, mjiosbwmpx: Sprite) -> bool:
        if hspentbnhg.pixels is not None:
            height_a, width_a = hspentbnhg.pixels.shape
        else:
            height_a, width_a = (1, 1)
        if mjiosbwmpx.pixels is not None:
            height_b, width_b = mjiosbwmpx.pixels.shape
        else:
            height_b, width_b = (1, 1)
        haipnqeehx = hspentbnhg.x
        jgdgcdqygw = hspentbnhg.y
        cuquuajdin = hspentbnhg.x + width_a
        bwxlacesto = hspentbnhg.y + height_a
        ieqvaqcwdc = mjiosbwmpx.x
        rzqkstsufc = mjiosbwmpx.y
        nezsmlbyvn = mjiosbwmpx.x + width_b
        edwmywzozq = mjiosbwmpx.y + height_b
        if cuquuajdin <= ieqvaqcwdc:
            return False
        if nezsmlbyvn <= haipnqeehx:
            return False
        if bwxlacesto <= rzqkstsufc:
            return False
        if edwmywzozq <= jgdgcdqygw:
            return False
        return True

    # Readability v3: structural flow; Su15.kcqeohsztd:1888-1911
    # Explicit 20-statement structural flow below; 5 conditions, 0 loops, 14 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def kcqeohsztd(self, japluzaoug: int, umozkwcyky: int, gftsvpxuiq: int, sprite: Sprite) -> bool:
        if sprite.pixels is not None:
            sprite_height, sprite_width = sprite.pixels.shape
        else:
            sprite_height, sprite_width = (1, 1)
        qxtfiachpk = sprite.x
        harvxppezu = sprite.y
        miktvfoidv = sprite.x + sprite_width
        obxlmjemte = sprite.y + sprite_height
        if japluzaoug < qxtfiachpk:
            wcpnjdkxii = qxtfiachpk
        elif japluzaoug > miktvfoidv - 1:
            wcpnjdkxii = miktvfoidv - 1
        else:
            wcpnjdkxii = japluzaoug
        if umozkwcyky < harvxppezu:
            gvspqqluva = harvxppezu
        elif umozkwcyky > obxlmjemte - 1:
            gvspqqluva = obxlmjemte - 1
        else:
            gvspqqluva = umozkwcyky
        dx = japluzaoug - wcpnjdkxii
        dy = umozkwcyky - gvspqqluva
        return dx * dx + dy * dy <= gftsvpxuiq * gftsvpxuiq

    # Readability v3: structural flow; Su15.dfqhmningy:1913-1920
    # Explicit 7-statement structural flow below; 3 conditions, 0 loops, 0 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def dfqhmningy(self, rfugedgvat: str) -> int:
        if rfugedgvat == hytiizjifk:
            return 1
        if rfugedgvat == uzyoevbukk:
            return 2
        if rfugedgvat == wvbbduitdw:
            return 3
        return 1

    # Readability v3: structural flow; Su15.wkwqpjaqpc:1922-1927
    # Explicit 5-statement structural flow below; 2 conditions, 0 loops, 0 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wkwqpjaqpc(self, level: int) -> str:
        if level <= 1:
            return hytiizjifk
        if level == 2:
            return uzyoevbukk
        return wvbbduitdw

    # Readability v3: structural flow; Su15.caaczjajzu:1929-1934
    # Explicit 5-statement structural flow below; 2 conditions, 0 loops, 0 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def caaczjajzu(self, rfugedgvat: str) -> str | None:
        if rfugedgvat == hytiizjifk:
            return uzyoevbukk
        if rfugedgvat == uzyoevbukk:
            return wvbbduitdw
        return None

    # Readability v3: structural flow; Su15.rhziiktjfu:1936-1943
    # Explicit 7-statement structural flow below; 3 conditions, 0 loops, 0 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def rhziiktjfu(self, rfugedgvat: str) -> Sprite:
        if rfugedgvat == hytiizjifk:
            return sprites[ieyrpvflsf]
        if rfugedgvat == uzyoevbukk:
            return sprites[fmrxwztzmt]
        if rfugedgvat == wvbbduitdw:
            return sprites[jzfqlydkvt]
        return sprites[ieyrpvflsf]

    # Readability v3: structural flow; Su15.cnbyleshjj:1945-1958
    # Explicit 13-statement structural flow below; 6 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def cnbyleshjj(self, anemzlanjq: Sprite) -> None:
        self.current_level.remove_sprite(anemzlanjq)
        if anemzlanjq in self.fezhhzhih:
            self.fezhhzhih.remove(anemzlanjq)
        if anemzlanjq in self.kcuphgwar:
            del self.kcuphgwar[anemzlanjq]
        if anemzlanjq in self.tmfwtfcyv:
            self.tmfwtfcyv.remove(anemzlanjq)
        if anemzlanjq in self.yghzqxumz:
            del self.yghzqxumz[anemzlanjq]
        if anemzlanjq in self.vdgmwvrhd:
            del self.vdgmwvrhd[anemzlanjq]
        if anemzlanjq in self.lphwskxbh:
            del self.lphwskxbh[anemzlanjq]

    # Readability v3: structural flow; Su15.xuiddmbsef:1960-2012
    # Explicit 48-statement structural flow below; 12 conditions, 6 loops, 20 writes and 5 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def xuiddmbsef(self) -> bool:
        if not self.powykypsm:
            return False
        if self.dsqlbvwaj is None:
            return False
        jeachvehyd = self.dsqlbvwaj
        nzyywetyls = jeachvehyd[0]
        dojgglksgz: list[tuple[str, int]]
        if isinstance(nzyywetyls, (list, tuple)):
            dojgglksgz = []
            for tcjvlwirsq, wiucezgggs in jeachvehyd:
                dojgglksgz.append((str(tcjvlwirsq), int(wiucezgggs)))
        else:
            tcjvlwirsq = str(jeachvehyd[0])
            wiucezgggs = int(jeachvehyd[1])
            dojgglksgz = [(tcjvlwirsq, wiucezgggs)]
        yuubfwnqiq: dict[int, int] = {}
        ekjzmwqudr: dict[str, int] = {}
        for vqfzoppoqx in self.lkujttxgs:
            midmuqkgtg = False
            for rjgqffkspv in self.powykypsm:
                if self.nbfpjkxrnp(rjgqffkspv, vqfzoppoqx):
                    midmuqkgtg = True
                    break
            if not midmuqkgtg:
                continue
            vhbnknppud = self.kqywaxhmsb.get(vqfzoppoqx, 0)
            if vhbnknppud in yuubfwnqiq:
                yuubfwnqiq[vhbnknppud] += 1
            else:
                yuubfwnqiq[vhbnknppud] = 1
        for anemzlanjq in self.fezhhzhih:
            midmuqkgtg = False
            for rjgqffkspv in self.powykypsm:
                if self.nbfpjkxrnp(rjgqffkspv, anemzlanjq):
                    midmuqkgtg = True
                    break
            if not midmuqkgtg:
                continue
            rfugedgvat = self.kcuphgwar.get(anemzlanjq, hytiizjifk)
            if rfugedgvat in ekjzmwqudr and ekjzmwqudr is not None:
                ekjzmwqudr[rfugedgvat] += 1
            else:
                ekjzmwqudr[rfugedgvat] = 1
        for mfbbiuqkuu, wiucezgggs in dojgglksgz:
            if mfbbiuqkuu in (hytiizjifk, uzyoevbukk, wvbbduitdw):
                if ekjzmwqudr.get(mfbbiuqkuu, 0) != wiucezgggs:
                    return False
            else:
                vhbnknppud = int(mfbbiuqkuu)
                if yuubfwnqiq.get(vhbnknppud, 0) != wiucezgggs:
                    return False
        return True

    # Readability v3: structural flow; Su15.jnieciwfsv:2014-2031
    # Explicit 16-statement structural flow below; 5 conditions, 0 loops, 6 writes and 5 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jnieciwfsv(self, x: int, y: int, sprite: Sprite) -> bool:
        if sprite.pixels is not None:
            sprite_height, sprite_width = sprite.pixels.shape
        else:
            sprite_height, sprite_width = (1, 1)
        qxtfiachpk = sprite.x
        harvxppezu = sprite.y
        miktvfoidv = sprite.x + sprite_width
        obxlmjemte = sprite.y + sprite_height
        if x < qxtfiachpk:
            return False
        if x >= miktvfoidv:
            return False
        if y < harvxppezu:
            return False
        if y >= obxlmjemte:
            return False
        return True

    # Readability v3: target_center_counts_satisfied; Su15.cbdhpcilgb:2033-2081
    # Count entity centers inside goal areas, lines 2033-2081 [previous-source-reviewed]
    def cbdhpcilgb(self) -> bool:
        if not self.powykypsm:
            return False
        if self.dsqlbvwaj is None:
            return False
        jeachvehyd = self.dsqlbvwaj
        nzyywetyls = jeachvehyd[0]
        dojgglksgz: list[tuple[str, int]]
        if isinstance(nzyywetyls, (list, tuple)):
            dojgglksgz = []
            for tcjvlwirsq, wiucezgggs in jeachvehyd:
                dojgglksgz.append((str(tcjvlwirsq), int(wiucezgggs)))
        else:
            tcjvlwirsq = str(jeachvehyd[0])
            wiucezgggs = int(jeachvehyd[1])
            dojgglksgz = [(tcjvlwirsq, wiucezgggs)]
        yuubfwnqiq: dict[int, int] = {}
        ekjzmwqudr: dict[str, int] = {}
        for vqfzoppoqx in self.lkujttxgs:
            japluzaoug, umozkwcyky = self.jdeyppambj(vqfzoppoqx)
            midmuqkgtg = False
            for rjgqffkspv in self.powykypsm:
                if self.jnieciwfsv(japluzaoug, umozkwcyky, rjgqffkspv):
                    midmuqkgtg = True
                    break
            if not midmuqkgtg:
                continue
            vhbnknppud = self.kqywaxhmsb.get(vqfzoppoqx, 0)
            yuubfwnqiq[vhbnknppud] = yuubfwnqiq.get(vhbnknppud, 0) + 1
        for anemzlanjq in self.fezhhzhih:
            japluzaoug, umozkwcyky = self.jdeyppambj(anemzlanjq)
            midmuqkgtg = False
            for rjgqffkspv in self.powykypsm:
                if self.jnieciwfsv(japluzaoug, umozkwcyky, rjgqffkspv):
                    midmuqkgtg = True
                    break
            if not midmuqkgtg:
                continue
            rfugedgvat = self.kcuphgwar.get(anemzlanjq, hytiizjifk)
            ekjzmwqudr[rfugedgvat] = ekjzmwqudr.get(rfugedgvat, 0) + 1
        for mfbbiuqkuu, wiucezgggs in dojgglksgz:
            if mfbbiuqkuu in (hytiizjifk, uzyoevbukk, wvbbduitdw):
                if ekjzmwqudr.get(mfbbiuqkuu, 0) != wiucezgggs:
                    return False
            else:
                vhbnknppud = int(mfbbiuqkuu)
                if yuubfwnqiq.get(vhbnknppud, 0) != wiucezgggs:
                    return False
        return True

    # Readability v3: structural flow; Su15.hlsimbcfgc:2083-2092
    # Explicit 9-statement structural flow below; 0 conditions, 2 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hlsimbcfgc(self) -> None:
        sxzjltytzx: list[tuple[str, int, int, int]] = []
        for vqfzoppoqx in self.lkujttxgs:
            pkjjooafkc = self.kqywaxhmsb.get(vqfzoppoqx, 0)
            sxzjltytzx.append(("zmlxwcvwb", int(pkjjooafkc), int(vqfzoppoqx.x), int(vqfzoppoqx.y)))
        for anemzlanjq in self.fezhhzhih:
            evxbijhefm = self.kcuphgwar.get(anemzlanjq, hytiizjifk)
            level = self.dfqhmningy(evxbijhefm)
            sxzjltytzx.append(("ybnveypak", int(level), int(anemzlanjq.x), int(anemzlanjq.y)))
        self.nscnqkkvg.append(sxzjltytzx)

    # Readability v3: structural flow; Su15.vczehveskr:2094-2136
    # Explicit 42-statement structural flow below; 6 conditions, 5 loops, 20 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def vczehveskr(self) -> None:
        self.jdphqevryx()
        if not self.nscnqkkvg:
            return
        jjvntbrkkq = self.nscnqkkvg.pop()
        for vqfzoppoqx in list(self.lkujttxgs):
            self.current_level.remove_sprite(vqfzoppoqx)
        self.lkujttxgs = []
        self.kqywaxhmsb = {}
        for anemzlanjq in list(self.fezhhzhih):
            self.cnbyleshjj(anemzlanjq)
        self.fezhhzhih = []
        self.kcuphgwar = {}
        for eqscvnddnt, vornqmlxku, x, y in jjvntbrkkq:
            if eqscvnddnt == "zmlxwcvwb":
                vhbnknppud = vornqmlxku
                if vhbnknppud < 0:
                    vhbnknppud = 0
                if vhbnknppud >= len(pqxlzdqwbo):
                    vhbnknppud = len(pqxlzdqwbo) - 1
                lbwxpvpmok = pqxlzdqwbo[vhbnknppud]
                trlnaqwkjs = sprites[lbwxpvpmok]
                vqfzoppoqx = trlnaqwkjs.clone()
                vqfzoppoqx.set_position(x, y)
                self.current_level.add_sprite(vqfzoppoqx)
                self.lkujttxgs.append(vqfzoppoqx)
                self.kqywaxhmsb[vqfzoppoqx] = vhbnknppud
            elif eqscvnddnt == "ybnveypak":
                bxbzzazmbh = vornqmlxku
                rfugedgvat = self.wkwqpjaqpc(bxbzzazmbh)
                qjzanqzagz = self.rhziiktjfu(rfugedgvat)
                anemzlanjq = qjzanqzagz.clone()
                anemzlanjq.set_position(x, y)
                self.current_level.add_sprite(anemzlanjq)
                self.fezhhzhih.append(anemzlanjq)
                self.kcuphgwar[anemzlanjq] = rfugedgvat
        self.zmcyxbptrw()
        if self.oicctzexh and self.xspiwkmfbs():
            self.oicctzexh = False
            for k in self.qbykqfzrj:
                k.pixels = sprites[k.name].pixels.copy()
            for ucjbljdyjj in self.powykypsm:
                ucjbljdyjj.pixels = sprites[ucjbljdyjj.name].pixels.copy()

    # Readability v3: structural flow; Su15.jrorxxkwlk:2138-2141
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jrorxxkwlk(self, vhbnknppud: int) -> int:
        if vhbnknppud < 0:
            vhbnknppud = 0
        return 1 << vhbnknppud

    # Readability v3: structural flow; Su15.xspiwkmfbs:2143-2172
    # Explicit 28-statement structural flow below; 5 conditions, 3 loops, 14 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def xspiwkmfbs(self) -> bool:
        if self.dsqlbvwaj is None:
            return False
        jeachvehyd = self.dsqlbvwaj
        nzyywetyls = jeachvehyd[0]
        zmnaavrezr: list[tuple[int, int]] = []
        if isinstance(nzyywetyls, (list, tuple)):
            for tcjvlwirsq, wiucezgggs in jeachvehyd:
                mfbbiuqkuu = str(tcjvlwirsq)
                if mfbbiuqkuu in (hytiizjifk, uzyoevbukk, wvbbduitdw):
                    continue
                zmnaavrezr.append((int(mfbbiuqkuu), int(wiucezgggs)))
        else:
            tcjvlwirsq = jeachvehyd[0]
            wiucezgggs = jeachvehyd[1]
            mfbbiuqkuu = str(tcjvlwirsq)
            if mfbbiuqkuu not in (hytiizjifk, uzyoevbukk, wvbbduitdw):
                zmnaavrezr.append((int(mfbbiuqkuu), int(wiucezgggs)))
        if not zmnaavrezr:
            return True
        flwpmitbry: int = 0
        for vhbnknppud, abbcbreupi in zmnaavrezr:
            whnxafslns = self.jrorxxkwlk(vhbnknppud)
            flwpmitbry += whnxafslns * abbcbreupi
        wfvpkzeooz: int = 0
        for vqfzoppoqx in self.lkujttxgs:
            vhbnknppud = self.kqywaxhmsb.get(vqfzoppoqx, 0)
            value = self.jrorxxkwlk(vhbnknppud)
            wfvpkzeooz += value
        return wfvpkzeooz >= flwpmitbry
