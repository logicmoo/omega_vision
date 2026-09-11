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

from typing import cast

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
    "ctwspzkygu": Sprite(
        pixels=[
            [2, 15, 15, 15, 15, 2],
            [2, 15, 15, 15, 15, 2],
            [2, 15, 15, 15, 15, 2],
            [2, 2, 0, 0, 2, 2],
            [-1, 2, 2, 2, 2, -1],
        ],
        name="ctwspzkygu",
        visible=True,
        collidable=True,
        layer=2,
    ),
    "eoqnvkspoa-pqwme1-1": Sprite(
        pixels=[
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [15, 15, 15, 15, 15, 15, 15, 15, 15, 15],
            [15, 15, 15, 15, 15, 15, 15, 15, 15, 15],
            [15, 15, 15, 15, 15, 15, 15, 15, 15, 15],
            [15, 15, 15, 15, 15, 15, 15, 15, 15, 15],
            [15, 15, 15, 15, 15, 15, 15, 15, 15, 15],
        ],
        name="eoqnvkspoa-pqwme1-1",
        visible=True,
        collidable=True,
    ),
    "eoqnvkspoa-pqwme2-1": Sprite(
        pixels=[
            [15, 15, 15, 15, 15, 15, 15, 15, 15, 12],
            [15, 15, 15, 15, 15, 15, 15, 15, 12, 12],
            [15, 15, 15, 15, 15, 15, 15, 12, 12, 12],
            [15, 15, 15, 15, 15, 15, 12, 12, 12, 12],
            [15, 15, 15, 15, 15, 12, 12, 12, 12, 12],
            [0, 0, 0, 0, 12, 12, 12, 12, 12, 12],
            [0, 0, 0, 12, 12, 12, 12, 12, 12, 12],
            [0, 0, 12, 12, 12, 12, 12, 12, 12, 12],
            [0, 12, 12, 12, 12, 12, 12, 12, 12, 12],
            [12, 12, 12, 12, 12, 12, 12, 12, 12, 12],
        ],
        name="eoqnvkspoa-pqwme2-1",
        visible=True,
        collidable=True,
    ),
    "eoqnvkspoa-pqwme3-1": Sprite(
        pixels=[
            [15, 15, 15, 12, 12, 12, 12, 15, 15, 15],
            [15, 15, 15, 12, 12, 12, 12, 15, 15, 14],
            [15, 15, 15, 12, 12, 12, 12, 15, 14, 14],
            [15, 15, 15, 15, 15, 15, 15, 14, 14, 14],
            [15, 15, 15, 15, 15, 15, 14, 14, 14, 14],
            [15, 15, 15, 15, 15, 14, 14, 14, 14, 14],
            [15, 15, 15, 15, 8, 14, 14, 14, 14, 14],
            [15, 15, 15, 8, 8, 14, 14, 14, 14, 14],
            [15, 15, 8, 8, 8, 14, 14, 14, 14, 14],
            [15, 8, 8, 8, 8, 14, 14, 14, 14, 14],
        ],
        name="eoqnvkspoa-pqwme3-1",
        visible=True,
        collidable=True,
    ),
    "eoqnvkspoa-pqwme4-1": Sprite(
        pixels=[
            [9, 9, 9, 9, 9, 12, 12, 12, 12, 15],
            [9, 9, 9, 9, 9, 12, 12, 12, 15, 15],
            [9, 9, 9, 9, 9, 12, 12, 15, 15, 15],
            [11, 11, 11, 9, 9, 12, 15, 15, 15, 15],
            [11, 11, 11, 9, 9, 15, 15, 15, 15, 15],
            [11, 11, 11, 9, 9, 15, 15, 15, 15, 15],
            [11, 11, 11, 9, 9, 15, 15, 15, 15, 15],
            [9, 9, 9, 9, 9, 15, 15, 15, 15, 15],
            [9, 9, 9, 9, 9, 15, 15, 15, 15, 15],
            [9, 9, 9, 9, 9, 15, 15, 15, 15, 15],
        ],
        name="eoqnvkspoa-pqwme4-1",
        visible=True,
        collidable=True,
    ),
    "eoqnvkspoa-pqwme5-1": Sprite(
        pixels=[
            [14, 9, 9, 8, 8, 8, 8, 9, 9, 12],
            [14, 14, 9, 8, 8, 8, 8, 9, 12, 12],
            [14, 14, 14, 8, 8, 8, 8, 12, 12, 12],
            [14, 14, 14, 14, 9, 9, 12, 12, 12, 12],
            [14, 14, 14, 14, 14, 12, 12, 12, 12, 12],
            [14, 14, 14, 14, 12, 12, 12, 12, 12, 12],
            [14, 14, 14, 12, 12, 12, 12, 12, 12, 12],
            [14, 14, 12, 12, 12, 12, 12, 12, 12, 12],
            [14, 12, 12, 12, 12, 12, 12, 12, 12, 12],
            [12, 12, 12, 12, 12, 12, 12, 12, 12, 12],
        ],
        name="eoqnvkspoa-pqwme5-1",
        visible=True,
        collidable=True,
    ),
    "eoqnvkspoa-pqwme6-1": Sprite(
        pixels=[
            [8, 8, 8, 15, 15, 15, 15, 8, 8, 8],
            [8, 8, 8, 15, 15, 15, 15, 8, 8, 14],
            [8, 8, 8, 15, 15, 15, 15, 8, 14, 14],
            [11, 11, 11, 8, 8, 8, 8, 14, 14, 14],
            [11, 11, 11, 8, 8, 8, 14, 14, 14, 14],
            [11, 11, 11, 8, 8, 14, 14, 14, 14, 14],
            [11, 11, 11, 8, 0, 14, 14, 14, 14, 14],
            [8, 8, 8, 0, 0, 14, 14, 14, 14, 14],
            [8, 8, 0, 0, 0, 14, 14, 14, 14, 14],
            [8, 0, 0, 0, 0, 14, 14, 14, 14, 14],
        ],
        name="eoqnvkspoa-pqwme6-1",
        visible=True,
        collidable=True,
    ),
    "gkyfnkvrty": Sprite(
        pixels=[
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
        ],
        name="gkyfnkvrty",
        visible=True,
        collidable=True,
        layer=-1,
    ),
    "oaoosfneq-laopvne": Sprite(
        pixels=[
            [-1, -1, -1, -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, 2, 2, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, 2, 2, 15, 2, 2, -1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, 2, 2, 15, 15, 15, 2, 2, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, 2, 2, 15, 15, 15, 15, 15, 2, 2, -1, -1, -1, -1, -1, -1],
            [-1, 2, 2, 15, 15, 15, 15, 15, 15, 15, 2, 2, -1, -1, -1, -1, -1],
            [2, 2, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2, 2, -1, -1, -1, -1],
            [-1, -1, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2, 2, -1, -1, -1],
            [-1, -1, -1, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2, 2, -1, -1],
            [-1, -1, -1, -1, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2, 2, -1],
            [-1, -1, -1, -1, -1, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2, 2],
            [-1, -1, -1, -1, -1, -1, 15, 15, 15, 15, 15, 15, 15, 15, 2, 2, -1],
            [-1, -1, -1, -1, -1, -1, -1, 15, 15, 15, 15, 15, 15, 2, 2, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, 15, 15, 15, 15, 2, 2, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, 15, 15, 2, 2, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 2, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, -1, -1, -1, -1, -1, -1],
        ],
        name="oaoosfneq-laopvne",
        visible=True,
        collidable=True,
        layer=2,
    ),
    "oaoosfneq-oaanwen": Sprite(
        pixels=[
            [2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2],
            [2, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2],
            [2, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2],
            [2, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2],
            [2, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2],
            [2, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2],
            [2, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2],
            [2, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
        ],
        name="oaoosfneq-oaanwen",
        visible=True,
        collidable=True,
    ),
    "pqkenviek": Sprite(
        pixels=[
            [4, 4, 4, 4, 4],
            [4, 0, 0, 0, 4],
            [4, 0, 0, 0, 4],
            [4, 0, 0, 0, 4],
            [4, 4, 4, 4, 4],
        ],
        name="pqkenviek",
        visible=True,
        collidable=True,
    ),
    "xytrjjbyib": Sprite(
        pixels=[
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        ],
        name="xytrjjbyib",
        visible=True,
        collidable=True,
    ),
    "ydiwkzjkgl": Sprite(
        pixels=[
            [0, 0, 0, 0, 0],
        ],
        name="ydiwkzjkgl",
        visible=True,
        collidable=True,
    ),
}
levels = [
    # Level 1
    Level(
        sprites=[
            sprites["eoqnvkspoa-pqwme1-1"].clone().set_position(3, 3),
            sprites["gkyfnkvrty"].clone(),
            sprites["oaoosfneq-oaanwen"].clone().set_position(25, 24).set_rotation(180),
            sprites["pqkenviek"].clone().set_position(35, 2),
            sprites["pqkenviek"].clone().set_position(41, 2).color_remap(0, 15),
            sprites["xytrjjbyib"].clone().set_position(27, 34),
            sprites["ydiwkzjkgl"].clone().set_position(41, 7),
        ],
        grid_size=(64, 64),
    ),
    # Level 2
    Level(
        sprites=[
            sprites["eoqnvkspoa-pqwme2-1"].clone().set_position(3, 3),
            sprites["gkyfnkvrty"].clone(),
            sprites["oaoosfneq-oaanwen"].clone().set_position(25, 24).set_rotation(180),
            sprites["pqkenviek"].clone().set_position(32, 2),
            sprites["pqkenviek"].clone().set_position(38, 2).color_remap(0, 15),
            sprites["pqkenviek"].clone().set_position(44, 2).color_remap(0, 12),
            sprites["xytrjjbyib"].clone().set_position(27, 34),
            sprites["ydiwkzjkgl"].clone().set_position(38, 7),
        ],
        grid_size=(64, 64),
    ),
    # Level 3
    Level(
        sprites=[
            sprites["ctwspzkygu"].clone().set_position(29, 18).set_rotation(180),
            sprites["eoqnvkspoa-pqwme3-1"].clone().set_position(3, 3),
            sprites["gkyfnkvrty"].clone(),
            sprites["oaoosfneq-oaanwen"].clone().set_position(25, 24).set_rotation(180),
            sprites["pqkenviek"].clone().set_position(21, 2),
            sprites["pqkenviek"].clone().set_position(27, 2).color_remap(0, 15),
            sprites["pqkenviek"].clone().set_position(33, 2).color_remap(0, 12),
            sprites["pqkenviek"].clone().set_position(39, 2).color_remap(0, 11),
            sprites["pqkenviek"].clone().set_position(45, 2).color_remap(0, 14),
            sprites["pqkenviek"].clone().set_position(51, 2).color_remap(0, 8),
            sprites["pqkenviek"].clone().set_position(57, 2).color_remap(0, 9),
            sprites["xytrjjbyib"].clone().set_position(27, 34),
            sprites["ydiwkzjkgl"].clone().set_position(27, 7),
        ],
        grid_size=(64, 64),
    ),
    # Level 4
    Level(
        sprites=[
            sprites["ctwspzkygu"].clone().set_position(29, 18).set_rotation(180),
            sprites["eoqnvkspoa-pqwme4-1"].clone().set_position(3, 3),
            sprites["gkyfnkvrty"].clone(),
            sprites["oaoosfneq-oaanwen"].clone().set_position(25, 24).set_rotation(180),
            sprites["pqkenviek"].clone().set_position(21, 2),
            sprites["pqkenviek"].clone().set_position(27, 2).color_remap(0, 15),
            sprites["pqkenviek"].clone().set_position(33, 2).color_remap(0, 12),
            sprites["pqkenviek"].clone().set_position(39, 2).color_remap(0, 11),
            sprites["pqkenviek"].clone().set_position(45, 2).color_remap(0, 14),
            sprites["pqkenviek"].clone().set_position(51, 2).color_remap(0, 8),
            sprites["pqkenviek"].clone().set_position(57, 2).color_remap(0, 9),
            sprites["xytrjjbyib"].clone().set_position(27, 34),
            sprites["ydiwkzjkgl"].clone().set_position(27, 7),
        ],
        grid_size=(64, 64),
    ),
    # Level 5
    Level(
        sprites=[
            sprites["ctwspzkygu"].clone().set_position(29, 18).set_rotation(180),
            sprites["eoqnvkspoa-pqwme5-1"].clone().set_position(3, 3),
            sprites["gkyfnkvrty"].clone(),
            sprites["oaoosfneq-oaanwen"].clone().set_position(25, 24).set_rotation(180),
            sprites["pqkenviek"].clone().set_position(21, 2),
            sprites["pqkenviek"].clone().set_position(27, 2).color_remap(0, 15),
            sprites["pqkenviek"].clone().set_position(33, 2).color_remap(0, 12),
            sprites["pqkenviek"].clone().set_position(39, 2).color_remap(0, 11),
            sprites["pqkenviek"].clone().set_position(45, 2).color_remap(0, 14),
            sprites["pqkenviek"].clone().set_position(51, 2).color_remap(0, 8),
            sprites["pqkenviek"].clone().set_position(57, 2).color_remap(0, 9),
            sprites["xytrjjbyib"].clone().set_position(27, 34),
            sprites["ydiwkzjkgl"].clone().set_position(27, 7),
        ],
        grid_size=(64, 64),
    ),
    # Level 6
    Level(
        sprites=[
            sprites["ctwspzkygu"].clone().set_position(29, 18).set_rotation(180),
            sprites["eoqnvkspoa-pqwme6-1"].clone().set_position(3, 3),
            sprites["gkyfnkvrty"].clone(),
            sprites["oaoosfneq-oaanwen"].clone().set_position(25, 24).set_rotation(180),
            sprites["pqkenviek"].clone().set_position(21, 2),
            sprites["pqkenviek"].clone().set_position(27, 2).color_remap(0, 15),
            sprites["pqkenviek"].clone().set_position(33, 2).color_remap(0, 12),
            sprites["pqkenviek"].clone().set_position(39, 2).color_remap(0, 11),
            sprites["pqkenviek"].clone().set_position(45, 2).color_remap(0, 14),
            sprites["pqkenviek"].clone().set_position(51, 2).color_remap(0, 8),
            sprites["pqkenviek"].clone().set_position(57, 2).color_remap(0, 9),
            sprites["xytrjjbyib"].clone().set_position(27, 34),
            sprites["ydiwkzjkgl"].clone().set_position(27, 7),
        ],
        grid_size=(64, 64),
    ),
]
BACKGROUND_COLOR = 5
PADDING_COLOR = 4


class aunldyudeb(RenderableUserDisplay):
    """."""

    # Readability v3: structural flow; aunldyudeb.__init__:369-371
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, qawfmbcuvz: int):
        self.qawfmbcuvz = qawfmbcuvz
        self.current_steps = qawfmbcuvz

    # Readability v3: update_binding; aunldyudeb.pioabixlyc:373-374
    # Perform self.current_steps = max(0, min(nbhestahsv, self.qawfmbcuvz)); argument/attribute spellings are preserved. [structural-contract]
    def pioabixlyc(self, nbhestahsv: int) -> None:
        self.current_steps = max(0, min(nbhestahsv, self.qawfmbcuvz))

    # Readability v3: structural flow; aunldyudeb.render_interface:376-388
    # Explicit 11-statement structural flow below; 2 conditions, 1 loops, 6 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def render_interface(self, frame: np.ndarray) -> np.ndarray:
        if self.qawfmbcuvz == 0:
            return frame
        width = frame.shape[1]
        rzcdwnbqgc = self.current_steps / self.qawfmbcuvz
        pdgjnrkbhu = round(width * rzcdwnbqgc)
        pdgjnrkbhu = min(pdgjnrkbhu, width)
        for x in range(width):
            if x < pdgjnrkbhu:
                frame[63, x] = 4
            else:
                frame[63, x] = 5
        return frame


class Cd82(ARCBaseGame):
    # Readability v3: structural flow; Cd82.__init__:392-445
    # Explicit 26-statement structural flow below; 0 conditions, 0 loops, 25 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self) -> None:
        self.nicoqsvlg = [
            ("horizontal", 25, 24, 180, 0, 1),
            ("diagonal", 33, 21, 0, -1, 1),
            ("horizontal", 38, 32, 270, -1, 0),
            ("diagonal", 33, 40, 90, -1, -1),
            ("horizontal", 25, 45, 0, 0, -1),
            ("diagonal", 14, 40, 180, 1, -1),
            ("horizontal", 17, 32, 90, 1, 0),
            ("diagonal", 14, 21, 270, 1, 1),
        ]
        self.nfhykrqjp = {
            0: (0, 1),
            1: (0, 2),
            2: (1, 2),
            3: (2, 2),
            4: (2, 1),
            5: (2, 0),
            6: (1, 0),
            7: (0, 0),
        }
        self.fbnqejrbl = {v: k for k, v in self.nfhykrqjp.items()}
        self.xwmfgtlso = 0
        self.knqmgavuh = 15
        self.lqrdkjrsl = 1
        self.edjesyzxk = False
        self.fbdgdkqzm = 0
        self.mqivutapf = 1
        self.errfuhupi = 0
        self.qsiruivbj = (0, 0)
        self.aalpkuosy = False
        self.yfobpcuef = False
        self.wbcnpqkvw = 0
        self.hcmkqabzb = 1
        self.bjgtofqhv: Sprite | None = None
        self.iswxsbrge: int | None = None
        self.frnnxdfwb = (0, 0)
        self.fgtugjktu = False
        self.yxjfgsdkm = False
        self.iewrsdwok = 100
        self.qzgkhffci = aunldyudeb(qawfmbcuvz=self.iewrsdwok)
        self.iieoxmyyd = 0
        self.qnjvedxjm = False
        rwskkxfwa = Camera(
            background=BACKGROUND_COLOR,
            letter_box=PADDING_COLOR,
            interfaces=[self.qzgkhffci],
        )
        super().__init__(
            game_id="cd82",
            levels=levels,
            camera=rwskkxfwa,
            available_actions=[1, 2, 3, 4, 5, 6],
        )

    # Readability v3: structural flow; Cd82.on_set_level:447-463
    # Explicit 16-statement structural flow below; 0 conditions, 0 loops, 14 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def on_set_level(self, level: Level) -> None:
        self.xwmfgtlso = 0
        self.knqmgavuh = 15
        self.edjesyzxk = False
        self.aalpkuosy = False
        self.yfobpcuef = False
        self.wbcnpqkvw = 0
        self.hcmkqabzb = 1
        self.bjgtofqhv = None
        self.iswxsbrge = None
        self.frnnxdfwb = (0, 0)
        self.fgtugjktu = False
        self.yxjfgsdkm = any((s.name == "ctwspzkygu" for s in level.get_sprites()))
        self.gpfahgizbk()
        self.iieoxmyyd = 0
        self.qnjvedxjm = False
        self.qzgkhffci.pioabixlyc(self.iewrsdwok)

    # Readability v3: rebuild_active_stamp_controls; Cd82.gpfahgizbk:465-472
    # Remove example/stamp-control sprites selected by exact names or prefixes, then recreate the active orientation frame and optional smaller stamp. [human-source-reviewed]
    def gpfahgizbk(self) -> None:
        """."""
        level = self.current_level
        ypremvnbbm = [s for s in level.get_sprites() if s.name.startswith("oaoosfneq-") or s.name.startswith("ExampleDiagonal") or s.name == "ctwspzkygu"]
        for sprite in ypremvnbbm:
            level.remove_sprite(sprite)
        self.elltphoitr()
        self.eanmnpxtyi()

    # Readability v3: create_active_orientation_frame; Cd82.elltphoitr:474-485
    # Select horizontal or diagonal prototype from the current eight-position entry, set position/rotation/current paint color and expose it as ActiveBasket on layer two. [human-source-reviewed]
    def elltphoitr(self) -> None:
        """."""
        bobcaullj, dzwpmelfn, hmdoihmvu, owiigowji, _, _ = self.nicoqsvlg[self.xwmfgtlso]
        if bobcaullj == "horizontal":
            zlobzrjfkb = sprites["oaoosfneq-oaanwen"].clone()
        else:
            zlobzrjfkb = sprites["oaoosfneq-laopvne"].clone()
        zlobzrjfkb.set_position(dzwpmelfn, hmdoihmvu).set_rotation(owiigowji)
        zlobzrjfkb.color_remap(15, self.knqmgavuh)
        zlobzrjfkb.set_name("ActiveBasket")
        zlobzrjfkb.set_layer(2)
        self.current_level.add_sprite(zlobzrjfkb)

    # Readability v3: replace_active_frame; Cd82.azhynfjdiz:487-493
    # Remove existing ActiveBasket instances and rebuild the active frame and optional narrow stamp control. [human-source-reviewed]
    def azhynfjdiz(self) -> None:
        """."""
        ssikwukgjc = self.current_level.get_sprites_by_name("ActiveBasket")
        for zlobzrjfkb in ssikwukgjc:
            self.current_level.remove_sprite(zlobzrjfkb)
        self.elltphoitr()
        self.eanmnpxtyi()

    # Readability v3: create_cardinal_narrow_stamp; Cd82.eanmnpxtyi:495-518
    # When the level enables this feature, remove its old control and create one only at cardinal indexes 0/2/4/6 with orientation-specific offset. [human-source-reviewed]
    def eanmnpxtyi(self) -> None:
        """."""
        if not self.yxjfgsdkm:
            return
        wmyzhxyqbd = self.current_level.get_sprites_by_name("ctwspzkygu")
        for rocioxdxkc in wmyzhxyqbd:
            self.current_level.remove_sprite(rocioxdxkc)
        if self.xwmfgtlso not in [0, 2, 4, 6]:
            return
        wtkhwwfjfa: dict[int, dict[str, int | tuple[int, int]]] = {
            0: {"offset": (4, -6), "rotation": 180},
            2: {"offset": (10, 4), "rotation": 270},
            4: {"offset": (4, 10), "rotation": 0},
            6: {"offset": (-6, 4), "rotation": 90},
        }
        wgiqvsevea = wtkhwwfjfa[self.xwmfgtlso]
        _, yelyowpnp, dzhdlpimn, _, _, _ = self.nicoqsvlg[self.xwmfgtlso]
        rocioxdxkc = sprites["ctwspzkygu"].clone()
        rotation = cast(int, wgiqvsevea["rotation"])
        qfzycifkiw = cast(tuple[int, int], wgiqvsevea["offset"])
        rocioxdxkc.set_rotation(rotation)
        rocioxdxkc.set_position(yelyowpnp + qfzycifkiw[0], dzhdlpimn + qfzycifkiw[1])
        rocioxdxkc.color_remap(15, self.knqmgavuh)
        self.current_level.add_sprite(rocioxdxkc)

    # Readability v3: find_cardinal_stamp_control; Cd82.oaouwdxbxc:520-529
    # Map a cardinal index to an exact rotation and return the first matching named control, or None. [human-source-reviewed]
    def oaouwdxbxc(self, tfgpscozlj: int) -> Sprite | None:
        """."""
        zunhfnctfk = {0: 180, 2: 270, 4: 0, 6: 90}
        if tfgpscozlj not in zunhfnctfk:
            return None
        xpumvjsuga = zunhfnctfk[tfgpscozlj]
        for cpteddxof in self.current_level.get_sprites():
            if cpteddxof.name == "ctwspzkygu" and cpteddxof.rotation == xpumvjsuga:
                return cpteddxof
        return None

    # Readability v3: move_selection_on_eight_position_ring; Cd82.nqhfiooufi:531-549
    # Map the selected ring position to a three-by-three coordinate, clamp the requested cardinal step, reject the center and map valid edge coordinates back to selection index. [human-source-reviewed]
    def nqhfiooufi(self, geaclnfpnn: int) -> None:
        """."""
        dfsddohkn, miipdppxi = self.nfhykrqjp[self.xwmfgtlso]
        if geaclnfpnn == 1:
            wdtucaweg, tivucwuqw = (max(0, dfsddohkn - 1), miipdppxi)
        elif geaclnfpnn == 2:
            wdtucaweg, tivucwuqw = (min(2, dfsddohkn + 1), miipdppxi)
        elif geaclnfpnn == 3:
            wdtucaweg, tivucwuqw = (dfsddohkn, max(0, miipdppxi - 1))
        elif geaclnfpnn == 4:
            wdtucaweg, tivucwuqw = (dfsddohkn, min(2, miipdppxi + 1))
        else:
            return
        if (wdtucaweg, tivucwuqw) == (1, 1):
            return
        jfwczrxztz = self.fbnqejrbl.get((wdtucaweg, tivucwuqw))
        if jfwczrxztz is not None and jfwczrxztz != self.xwmfgtlso:
            self.xwmfgtlso = jfwczrxztz
            self.azhynfjdiz()

    # Readability v3: handle_palette_or_stamp_click; Cd82.qbiojckwxl:551-572
    # Convert display coordinates, look up the hit sprite, then start a cardinal narrow stamp or read a palette swatch's center pixel and rebuild the colored frame. [human-source-reviewed]
    def qbiojckwxl(self, x: int, y: int) -> None:
        """."""
        jchtkpjfaz = self.camera.display_to_grid(x, y)
        if jchtkpjfaz is None:
            return
        jfurayglq, inncdamfa = jchtkpjfaz
        ulkusczvz = self.current_level.get_sprite_at(jfurayglq, inncdamfa, ignore_collidable=True)
        if ulkusczvz is None:
            return
        if ulkusczvz.name == "ctwspzkygu":
            plxbvljqlr = {180: 0, 270: 2, 0: 4, 90: 6}
            tfgpscozlj = plxbvljqlr.get(ulkusczvz.rotation)
            if tfgpscozlj is not None:
                self.gfjfyvajah(tfgpscozlj)
            return
        if ulkusczvz.name.startswith("pqkenviek"):
            jkgdqvdwx = ulkusczvz.pixels[2, 2]
            self.knqmgavuh = int(jkgdqvdwx)
            vrtfzbxwzx = self.current_level.get_sprites_by_name("ydiwkzjkgl")
            if vrtfzbxwzx:
                vrtfzbxwzx[0].set_position(ulkusczvz.x, ulkusczvz.y + 5)
            self.azhynfjdiz()

    # Readability v3: start_narrow_stamp_animation; Cd82.gfjfyvajah:574-585
    # Retain the selected narrow-stamp control, original position and cardinal index; reset outward/return phase and one-shot paint latch. [human-source-reviewed]
    def gfjfyvajah(self, tfgpscozlj: int) -> None:
        """."""
        rocioxdxkc = self.oaouwdxbxc(tfgpscozlj)
        if not rocioxdxkc:
            return
        self.yfobpcuef = True
        self.wbcnpqkvw = 0
        self.hcmkqabzb = 1
        self.bjgtofqhv = rocioxdxkc
        self.iswxsbrge = tfgpscozlj
        self.frnnxdfwb = (rocioxdxkc.x, rocioxdxkc.y)
        self.fgtugjktu = False

    # Readability v3: advance_narrow_stamp_animation; Cd82.jgclfnjrnk:587-611
    # Move two pixels per tick for seven outward ticks, paint once, then return to the saved origin, compare the target and complete the action. [human-source-reviewed]
    def jgclfnjrnk(self) -> None:
        """."""
        if not self.bjgtofqhv or self.iswxsbrge is None:
            self.yfobpcuef = False
            self.complete_action()
            return
        azzmpqldgu = {0: (0, 2), 2: (-2, 0), 4: (0, -2), 6: (2, 0)}
        yaprnpujy, xdtjhsgbq = azzmpqldgu[self.iswxsbrge]
        if self.hcmkqabzb == 1:
            self.bjgtofqhv.move(yaprnpujy, xdtjhsgbq)
            self.wbcnpqkvw += 1
            if self.wbcnpqkvw >= 7:
                if not self.fgtugjktu:
                    self.coublenfir()
                    self.fgtugjktu = True
                self.hcmkqabzb = -1
        else:
            self.bjgtofqhv.move(-yaprnpujy, -xdtjhsgbq)
            self.wbcnpqkvw -= 1
            if self.wbcnpqkvw <= 0:
                self.bjgtofqhv.set_position(*self.frnnxdfwb)
                self.bjgtofqhv = None
                self.yfobpcuef = False
                self.wvrremwltt()
                self.complete_action()

    # Readability v3: paint_cardinal_edge_patch; Cd82.coublenfir:613-628
    # Copy the ten-by-ten canvas and fill the selected 3-by-4 or 4-by-3 edge patch with current color; replace the canvas pixels. [human-source-reviewed]
    def coublenfir(self) -> None:
        """."""
        notymrgpnm = self.current_level.get_sprites_by_name("xytrjjbyib")
        if not notymrgpnm:
            return
        qfcfbdgtpk = notymrgpnm[0]
        puemgovuw = qfcfbdgtpk.pixels.copy()
        if self.iswxsbrge == 0:
            puemgovuw[0:3, 3:7] = self.knqmgavuh
        elif self.iswxsbrge == 4:
            puemgovuw[7:10, 3:7] = self.knqmgavuh
        elif self.iswxsbrge == 6:
            puemgovuw[3:7, 0:3] = self.knqmgavuh
        elif self.iswxsbrge == 2:
            puemgovuw[3:7, 7:10] = self.knqmgavuh
        qfcfbdgtpk.pixels = puemgovuw

    # Readability v3: dispatch_stamp_edit_and_animation; Cd82.step:630-671
    # Update budget from total action count and lose at its cap; pending broad/narrow animations take priority, otherwise dispatch ring movement, broad stamp or palette/control click. [human-source-reviewed]
    def step(self) -> None:
        self.qzgkhffci.pioabixlyc(self.iewrsdwok - self._action_count)
        if self._action_count >= self.iewrsdwok:
            self.lose()
            self.complete_action()
            return
        if self.edjesyzxk:
            self.hhjooisvrs()
            return
        if self.yfobpcuef:
            self.jgclfnjrnk()
            return
        action = self.action.id
        if action == GameAction.ACTION1:
            self.nqhfiooufi(1)
            self.iieoxmyyd += 1
            self.complete_action()
        elif action == GameAction.ACTION2:
            self.nqhfiooufi(2)
            self.iieoxmyyd += 1
            self.complete_action()
        elif action == GameAction.ACTION3:
            self.nqhfiooufi(3)
            self.iieoxmyyd += 1
            self.complete_action()
        elif action == GameAction.ACTION4:
            self.nqhfiooufi(4)
            self.iieoxmyyd += 1
            self.complete_action()
        elif action == GameAction.ACTION5:
            self.nlvliaznao()
            self.iieoxmyyd = 0
            self.qnjvedxjm = False
        elif action == GameAction.ACTION6:
            data = self.action.data
            if "x" in data and "y" in data:
                self.qbiojckwxl(data["x"], data["y"])
                self.qnjvedxjm = True
            if not self.yfobpcuef:
                self.complete_action()
        else:
            self.complete_action()

    # Readability v3: start_broad_stamp_animation; Cd82.nlvliaznao:673-681
    # Save the active frame origin and initialize seven outward ticks, return phase and a one-shot paint latch. [human-source-reviewed]
    def nlvliaznao(self) -> None:
        """."""
        fmlnncybz, sbyehouke, ukfstuctm, _, _, _ = self.nicoqsvlg[self.xwmfgtlso]
        self.qsiruivbj = (sbyehouke, ukfstuctm)
        self.edjesyzxk = True
        self.fbdgdkqzm = 0
        self.mqivutapf = 1
        self.errfuhupi = 7
        self.aalpkuosy = False

    # Readability v3: advance_broad_stamp_animation; Cd82.hhjooisvrs:683-707
    # Translate the active frame by its configured vector, apply the broad mask once at the far endpoint, return it to the saved origin, then test completion. [human-source-reviewed]
    def hhjooisvrs(self) -> None:
        """."""
        ssikwukgjc = self.current_level.get_sprites_by_name("ActiveBasket")
        if not ssikwukgjc:
            self.edjesyzxk = False
            self.complete_action()
            return
        zlobzrjfkb = ssikwukgjc[0]
        _, _, _, _, dx, dy = self.nicoqsvlg[self.xwmfgtlso]
        if self.mqivutapf == 1:
            zlobzrjfkb.move(dx, dy)
            self.fbdgdkqzm += 1
            if self.fbdgdkqzm >= self.errfuhupi:
                if not self.aalpkuosy:
                    self.rtjwayrycq()
                    self.aalpkuosy = True
                self.mqivutapf = -1
        else:
            zlobzrjfkb.move(-dx, -dy)
            self.fbdgdkqzm -= 1
            if self.fbdgdkqzm <= 0:
                zlobzrjfkb.set_position(*self.qsiruivbj)
                self.edjesyzxk = False
                self.wvrremwltt()
                self.complete_action()

    # Readability v3: paint_half_plane_or_diagonal_wedge; Cd82.rtjwayrycq:709-738
    # Copy the canvas and paint a horizontal/vertical half or one of four inclusive triangular masks according to the selected configuration. [human-source-reviewed]
    def rtjwayrycq(self) -> None:
        """."""
        notymrgpnm = self.current_level.get_sprites_by_name("xytrjjbyib")
        if not notymrgpnm:
            return
        qfcfbdgtpk = notymrgpnm[0]
        ggepgwyqh, _, _, paixblnzu, _, _ = self.nicoqsvlg[self.xwmfgtlso]
        hzmesgtof = qfcfbdgtpk.pixels.copy()
        if ggepgwyqh == "horizontal":
            if paixblnzu == 180:
                hzmesgtof[0:5, :] = self.knqmgavuh
            elif paixblnzu == 0:
                hzmesgtof[5:10, :] = self.knqmgavuh
            elif paixblnzu == 90:
                hzmesgtof[:, 0:5] = self.knqmgavuh
            elif paixblnzu == 270:
                hzmesgtof[:, 5:10] = self.knqmgavuh
        elif paixblnzu == 180:
            for i in range(10):
                hzmesgtof[i, 0 : i + 1] = self.knqmgavuh
        elif paixblnzu == 90:
            for i in range(10):
                hzmesgtof[i, 9 - i : 10] = self.knqmgavuh
        elif paixblnzu == 0:
            for i in range(10):
                hzmesgtof[i, i:10] = self.knqmgavuh
        elif paixblnzu == 270:
            for i in range(10):
                hzmesgtof[i, 0 : 10 - i] = self.knqmgavuh
        qfcfbdgtpk.pixels = hzmesgtof

    # Readability v3: compare_target_excluding_two_diagonals; Cd82.wvrremwltt:740-753
    # Compare the editable and first reference pixel arrays only where neither principal diagonal applies; advance when those masked arrays are equal. [human-source-reviewed]
    def wvrremwltt(self) -> None:
        """."""
        notymrgpnm = self.current_level.get_sprites_by_name("xytrjjbyib")
        vstazxqstp = [s for s in self.current_level.get_sprites() if s.name.startswith("eoqnvkspoa-")]
        if not notymrgpnm or not vstazxqstp:
            return
        optphfbnep = notymrgpnm[0].pixels
        pvdfcqjxfe = vstazxqstp[0].pixels
        poqpfcjieu = np.ones((10, 10), dtype=bool)
        for i in range(10):
            poqpfcjieu[i, i] = False
            poqpfcjieu[i, 9 - i] = False
        if np.array_equal(optphfbnep[poqpfcjieu], pvdfcqjxfe[poqpfcjieu]):
            self.next_level()

    # Readability v3: enumerate_palette_click_inputs; Cd82.yrfgxhebei:755-764
    # Convert palette centers through camera scale/offset into ActionInput click records. Producing these records does not execute them. [human-source-reviewed]
    def yrfgxhebei(self) -> list[ActionInput]:
        """."""
        cpgfdkamq: list[ActionInput] = []
        xcfjrqbpi, ckknfjcwy, cuwwlpnls = self.camera._calculate_scale_and_offset()
        for vxhkdmnyb in self.current_level.get_sprites():
            if vxhkdmnyb.name.startswith("pqkenviek"):
                lmyqevssm = (vxhkdmnyb.x + 2) * xcfjrqbpi + ckknfjcwy
                pbunevequ = (vxhkdmnyb.y + 2) * xcfjrqbpi + cuwwlpnls
                cpgfdkamq.append(ActionInput(id=GameAction.ACTION6, data={"x": lmyqevssm, "y": pbunevequ}))
        return cpgfdkamq

    # Readability v3: enumerate_current_narrow_stamp_click; Cd82.bmwcxxvjum:766-777
    # For a cardinal selection with a matching narrow-stamp control, return its center as one display-coordinate click input. [human-source-reviewed]
    def bmwcxxvjum(self) -> list[ActionInput]:
        """."""
        rzneqbwdm: list[ActionInput] = []
        if self.xwmfgtlso not in [0, 2, 4, 6]:
            return rzneqbwdm
        rocioxdxkc = self.oaouwdxbxc(self.xwmfgtlso)
        if rocioxdxkc:
            vvmeylbgu, ckpwdwwar, cunpqzsus = self.camera._calculate_scale_and_offset()
            ezctonbxe = (rocioxdxkc.x + rocioxdxkc.width // 2) * vvmeylbgu + ckpwdwwar
            mgsmztxze = (rocioxdxkc.y + rocioxdxkc.height // 2) * vvmeylbgu + cunpqzsus
            rzneqbwdm.append(ActionInput(id=GameAction.ACTION6, data={"x": ezctonbxe, "y": mgsmztxze}))
        return rzneqbwdm
