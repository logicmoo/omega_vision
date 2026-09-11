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
    "aidclcbjcv": Sprite(
        pixels=[
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
        ],
        name="aidclcbjcv",
        visible=True,
        collidable=True,
    ),
    "byigobxzpg": Sprite(
        pixels=[
            [12, 12, 12, 12],
            [12, 12, 12, 12],
            [12, 12, 12, 12],
            [12, 12, 12, 12],
        ],
        name="byigobxzpg",
        visible=True,
        collidable=True,
        tags=["kdweefinfi"],
        layer=1,
    ),
    "cwefnfvjhr": Sprite(
        pixels=[
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
            [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
        ],
        name="cwefnfvjhr",
        visible=True,
        collidable=True,
    ),
    "doijajrgdi": Sprite(
        pixels=[
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
        ],
        name="doijajrgdi",
        visible=True,
        collidable=False,
        tags=["fsjjayjoeg"],
    ),
    "geffskzhqq": Sprite(
        pixels=[
            [2, 2, 2, 2],
            [2, 2, 2, 2],
            [2, 2, 2, 2],
            [2, 2, 2, 2],
            [2, 2, 2, 2],
            [2, 2, 2, 2],
            [2, 2, 2, 2],
            [2, 2, 2, 2],
        ],
        name="geffskzhqq",
        visible=True,
        collidable=False,
        tags=["zqxwgacnue"],
    ),
    "ghklglzjuf": Sprite(
        pixels=[
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
        ],
        name="ghklglzjuf",
        visible=True,
        collidable=False,
        tags=["fsjjayjoeg"],
    ),
    "jigtxgzhwt": Sprite(
        pixels=[
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
        ],
        name="jigtxgzhwt",
        visible=True,
        collidable=False,
        tags=["fsjjayjoeg"],
    ),
    "jqzhxgbmtz": Sprite(
        pixels=[
            [15, 15, 15, 15],
            [15, 15, 15, 15],
            [15, 15, 15, 15],
            [15, 15, 15, 15],
        ],
        name="jqzhxgbmtz",
        visible=True,
        collidable=True,
        tags=["ysysltqlke"],
        layer=1,
    ),
    "ktghqrydvd": Sprite(
        pixels=[
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
        ],
        name="ktghqrydvd",
        visible=True,
        collidable=False,
        tags=["fsjjayjoeg"],
    ),
    "ofwegeqknn": Sprite(
        pixels=[
            [9, 9, 9, 9],
            [9, 2, 2, 9],
            [9, 2, 2, 9],
            [9, 2, 2, 9],
            [9, 2, 2, 9],
            [9, 2, 2, 9],
            [9, 2, 2, 9],
            [9, 9, 9, 9],
        ],
        name="ofwegeqknn",
        visible=True,
        collidable=False,
        tags=["fsjjayjoeg"],
    ),
    "ooaamfpvqr": Sprite(
        pixels=[
            [2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2],
        ],
        name="ooaamfpvqr",
        visible=True,
        collidable=False,
        tags=["zqxwgacnue"],
    ),
    "peimznrlqd": Sprite(
        pixels=[
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
        ],
        name="peimznrlqd",
        visible=True,
        collidable=False,
        tags=["fsjjayjoeg"],
    ),
    "pktgsotzmw": Sprite(
        pixels=[
            [4, 4, 4, 4],
            [4, 9, 9, 4],
            [4, 9, 9, 4],
            [4, 4, 4, 4],
        ],
        name="pktgsotzmw",
        visible=True,
        collidable=True,
        tags=["geezpjgiyd"],
        layer=1,
    ),
    "pmargquscu": Sprite(
        pixels=[
            [2, -2, 2, 2],
            [-2, 2, 2, 2],
            [2, 2, 2, -2],
            [2, 2, -2, 2],
        ],
        name="pmargquscu",
        visible=True,
        collidable=False,
        tags=["bnzklblgdk"],
    ),
    "uasmnkbzmm": Sprite(
        pixels=[
            [5, 5, 5, 5],
            [5, 5, 5, 5],
            [5, 5, 5, 5],
            [5, 5, 5, 5],
        ],
        name="uasmnkbzmm",
        visible=True,
        collidable=True,
        tags=["debyzcmtnr"],
    ),
    "vikkhnsrzd": Sprite(
        pixels=[
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9],
            [9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9],
        ],
        name="vikkhnsrzd",
        visible=True,
        collidable=False,
        tags=["fsjjayjoeg"],
    ),
    "wkmuwhjqyo": Sprite(
        pixels=[
            [9, 9, 9, 9, 9, 9, 9, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 2, 2, 2, 2, 2, 2, 9],
            [9, 9, 9, 9, 9, 9, 9, 9],
        ],
        name="wkmuwhjqyo",
        visible=True,
        collidable=False,
        tags=["fsjjayjoeg"],
    ),
    "wppuejnwhl": Sprite(
        pixels=[
            [0, 0, 0, 0],
            [14, 14, 14, 14],
            [14, 14, 14, 14],
            [14, 14, 14, 14],
        ],
        name="wppuejnwhl",
        visible=True,
        collidable=True,
        tags=["wbmdvjhthc"],
        layer=1,
    ),
    "xqaqifquaw": Sprite(
        pixels=[
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
        ],
        name="xqaqifquaw",
        visible=True,
        collidable=False,
        tags=["zqxwgacnue"],
    ),
    "xxmzyqktqy": Sprite(
        pixels=[
            [9, 9, 9, 9],
            [9, 2, 2, 9],
            [9, 2, 2, 9],
            [9, 9, 9, 9],
        ],
        name="xxmzyqktqy",
        visible=True,
        collidable=False,
        tags=["fsjjayjoeg"],
    ),
}
levels = [
    # Level 1
    Level(
        sprites=[
            sprites["jigtxgzhwt"].clone().set_position(28, 28),
            sprites["pktgsotzmw"].clone().set_position(44, 24),
            sprites["pktgsotzmw"].clone().set_position(16, 28),
            sprites["pktgsotzmw"].clone().set_position(32, 36),
            sprites["wppuejnwhl"].clone().set_position(32, 48),
        ],
        grid_size=(64, 64),
        data={
            "StepCounter": 200,
        },
    ),
    # Level 2
    Level(
        sprites=[
            sprites["byigobxzpg"].clone().set_position(24, 36),
            sprites["doijajrgdi"].clone().set_position(12, 28),
            sprites["pktgsotzmw"].clone().set_position(48, 32),
            sprites["pktgsotzmw"].clone().set_position(36, 28),
            sprites["pktgsotzmw"].clone().set_position(40, 20),
            sprites["pktgsotzmw"].clone().set_position(48, 24),
            sprites["pktgsotzmw"].clone().set_position(44, 40),
            sprites["wppuejnwhl"].clone().set_position(12, 8),
        ],
        grid_size=(64, 64),
        data={
            "StepCounter": 70,
        },
    ),
    # Level 3
    Level(
        sprites=[
            sprites["byigobxzpg"].clone().set_position(48, 12),
            sprites["ktghqrydvd"].clone().set_position(52, 24),
            sprites["pktgsotzmw"].clone().set_position(32, 32),
            sprites["pktgsotzmw"].clone().set_position(20, 20),
            sprites["pktgsotzmw"].clone().set_position(12, 44),
            sprites["pktgsotzmw"].clone().set_position(8, 16),
            sprites["pktgsotzmw"].clone().set_position(32, 12),
            sprites["pmargquscu"].clone().set_position(32, 0),
            sprites["pmargquscu"].clone().set_position(32, 4),
            sprites["pmargquscu"].clone().set_position(32, 8),
            sprites["pmargquscu"].clone().set_position(32, 12),
            sprites["pmargquscu"].clone().set_position(32, 16),
            sprites["pmargquscu"].clone().set_position(32, 20),
            sprites["pmargquscu"].clone().set_position(32, 24),
            sprites["pmargquscu"].clone().set_position(32, 28),
            sprites["pmargquscu"].clone().set_position(32, 32),
            sprites["pmargquscu"].clone().set_position(32, 36),
            sprites["pmargquscu"].clone().set_position(32, 40),
            sprites["pmargquscu"].clone().set_position(32, 44),
            sprites["pmargquscu"].clone().set_position(32, 48),
            sprites["pmargquscu"].clone().set_position(32, 52),
            sprites["pmargquscu"].clone().set_position(32, 56),
            sprites["pmargquscu"].clone().set_position(32, 60),
            sprites["wppuejnwhl"].clone().set_position(16, 36),
        ],
        grid_size=(64, 64),
        data={
            "StepCounter": 100,
        },
    ),
    # Level 4
    Level(
        sprites=[
            sprites["byigobxzpg"].clone().set_position(56, 4),
            sprites["byigobxzpg"].clone().set_position(8, 12),
            sprites["byigobxzpg"].clone().set_position(24, 56),
            sprites["ofwegeqknn"].clone().set_position(4, 24),
            sprites["pktgsotzmw"].clone().set_position(32, 36),
            sprites["pktgsotzmw"].clone().set_position(24, 24),
            sprites["pktgsotzmw"].clone().set_position(36, 40),
            sprites["pktgsotzmw"].clone().set_position(24, 40),
            sprites["pktgsotzmw"].clone().set_position(32, 24),
            sprites["pktgsotzmw"].clone().set_position(36, 24),
            sprites["pktgsotzmw"].clone().set_position(24, 4),
            sprites["pmargquscu"].clone().set_position(28, 20),
            sprites["pmargquscu"].clone().set_position(24, 20),
            sprites["pmargquscu"].clone().set_position(20, 20),
            sprites["pmargquscu"].clone().set_position(20, 24),
            sprites["pmargquscu"].clone().set_position(20, 28),
            sprites["pmargquscu"].clone().set_position(20, 32),
            sprites["pmargquscu"].clone().set_position(20, 36),
            sprites["pmargquscu"].clone().set_position(20, 40),
            sprites["pmargquscu"].clone().set_position(20, 44),
            sprites["pmargquscu"].clone().set_position(32, 20),
            sprites["pmargquscu"].clone().set_position(36, 20),
            sprites["pmargquscu"].clone().set_position(40, 20),
            sprites["pmargquscu"].clone().set_position(40, 24),
            sprites["pmargquscu"].clone().set_position(24, 44),
            sprites["pmargquscu"].clone().set_position(28, 44),
            sprites["pmargquscu"].clone().set_position(32, 44),
            sprites["pmargquscu"].clone().set_position(36, 44),
            sprites["pmargquscu"].clone().set_position(40, 44),
            sprites["pmargquscu"].clone().set_position(40, 40),
            sprites["pmargquscu"].clone().set_position(40, 36),
            sprites["pmargquscu"].clone().set_position(40, 32),
            sprites["pmargquscu"].clone().set_position(40, 28),
            sprites["uasmnkbzmm"].clone().set_position(16, 48),
            sprites["uasmnkbzmm"].clone().set_position(12, 52),
            sprites["uasmnkbzmm"].clone().set_position(8, 56),
            sprites["uasmnkbzmm"].clone().set_position(4, 60),
            sprites["uasmnkbzmm"].clone().set_position(44, 48),
            sprites["uasmnkbzmm"].clone().set_position(48, 52),
            sprites["uasmnkbzmm"].clone().set_position(52, 56),
            sprites["uasmnkbzmm"].clone().set_position(56, 60),
            sprites["uasmnkbzmm"].clone().set_position(28, 4),
            sprites["uasmnkbzmm"].clone().set_position(28, 0),
            sprites["uasmnkbzmm"].clone().set_position(28, 8),
            sprites["uasmnkbzmm"].clone().set_position(28, 12),
            sprites["uasmnkbzmm"].clone().set_position(28, 16),
            sprites["wkmuwhjqyo"].clone().set_position(36, 56),
            sprites["wppuejnwhl"].clone().set_position(28, 32),
            sprites["xxmzyqktqy"].clone().set_position(8, 36),
            sprites["xxmzyqktqy"].clone().set_position(52, 28),
            sprites["xxmzyqktqy"].clone().set_position(56, 20),
        ],
        grid_size=(64, 64),
        data={
            "StepCounter": 100,
        },
    ),
    # Level 5
    Level(
        sprites=[
            sprites["byigobxzpg"].clone().set_position(20, 28),
            sprites["ktghqrydvd"].clone().set_position(8, 24),
            sprites["pktgsotzmw"].clone().set_position(52, 48),
            sprites["pktgsotzmw"].clone().set_position(60, 52),
            sprites["pktgsotzmw"].clone().set_position(48, 4),
            sprites["pktgsotzmw"].clone().set_position(56, 8),
            sprites["pktgsotzmw"].clone().set_position(44, 56),
            sprites["pktgsotzmw"].clone().set_position(44, 28),
            sprites["uasmnkbzmm"].clone().set_position(24, 24),
            sprites["uasmnkbzmm"].clone().set_position(28, 24),
            sprites["uasmnkbzmm"].clone().set_position(32, 24),
            sprites["uasmnkbzmm"].clone().set_position(36, 24),
            sprites["uasmnkbzmm"].clone().set_position(36, 20),
            sprites["uasmnkbzmm"].clone().set_position(36, 16),
            sprites["uasmnkbzmm"].clone().set_position(36, 12),
            sprites["uasmnkbzmm"].clone().set_position(36, 8),
            sprites["uasmnkbzmm"].clone().set_position(36, 4),
            sprites["uasmnkbzmm"].clone().set_position(36, 0),
            sprites["uasmnkbzmm"].clone().set_position(36, 60),
            sprites["uasmnkbzmm"].clone().set_position(36, 56),
            sprites["uasmnkbzmm"].clone().set_position(36, 52),
            sprites["uasmnkbzmm"].clone().set_position(36, 48),
            sprites["uasmnkbzmm"].clone().set_position(36, 44),
            sprites["uasmnkbzmm"].clone().set_position(36, 40),
            sprites["uasmnkbzmm"].clone().set_position(36, 36),
            sprites["uasmnkbzmm"].clone().set_position(24, 36),
            sprites["uasmnkbzmm"].clone().set_position(28, 36),
            sprites["uasmnkbzmm"].clone().set_position(32, 36),
            sprites["wppuejnwhl"].clone().set_position(44, 36),
        ],
        grid_size=(64, 64),
        data={
            "StepCounter": 125,
        },
    ),
    # Level 6
    Level(
        sprites=[
            sprites["ghklglzjuf"].clone().set_position(28, 12),
            sprites["jqzhxgbmtz"].clone().set_position(16, 16),
            sprites["ooaamfpvqr"].clone().set_position(52, 24),
            sprites["pktgsotzmw"].clone().set_position(56, 28),
            sprites["pktgsotzmw"].clone().set_position(28, 16),
            sprites["uasmnkbzmm"].clone().set_position(44, 0),
            sprites["uasmnkbzmm"].clone().set_position(44, 4),
            sprites["uasmnkbzmm"].clone().set_position(44, 8),
            sprites["uasmnkbzmm"].clone().set_position(44, 12),
            sprites["uasmnkbzmm"].clone().set_position(44, 16),
            sprites["uasmnkbzmm"].clone().set_position(44, 20),
            sprites["uasmnkbzmm"].clone().set_position(48, 0),
            sprites["uasmnkbzmm"].clone().set_position(48, 4),
            sprites["uasmnkbzmm"].clone().set_position(48, 8),
            sprites["uasmnkbzmm"].clone().set_position(48, 12),
            sprites["uasmnkbzmm"].clone().set_position(48, 16),
            sprites["uasmnkbzmm"].clone().set_position(48, 20),
            sprites["uasmnkbzmm"].clone().set_position(44, 28),
            sprites["uasmnkbzmm"].clone().set_position(44, 32),
            sprites["uasmnkbzmm"].clone().set_position(44, 36),
            sprites["uasmnkbzmm"].clone().set_position(44, 40),
            sprites["uasmnkbzmm"].clone().set_position(44, 44),
            sprites["uasmnkbzmm"].clone().set_position(44, 48),
            sprites["uasmnkbzmm"].clone().set_position(48, 28),
            sprites["uasmnkbzmm"].clone().set_position(48, 32),
            sprites["uasmnkbzmm"].clone().set_position(48, 36),
            sprites["uasmnkbzmm"].clone().set_position(48, 40),
            sprites["uasmnkbzmm"].clone().set_position(48, 44),
            sprites["uasmnkbzmm"].clone().set_position(48, 48),
            sprites["uasmnkbzmm"].clone().set_position(44, 52),
            sprites["uasmnkbzmm"].clone().set_position(44, 56),
            sprites["uasmnkbzmm"].clone().set_position(48, 52),
            sprites["uasmnkbzmm"].clone().set_position(48, 56),
            sprites["uasmnkbzmm"].clone().set_position(44, 60),
            sprites["uasmnkbzmm"].clone().set_position(48, 60),
            sprites["wppuejnwhl"].clone().set_position(20, 52),
        ],
        grid_size=(64, 64),
        data={
            "StepCounter": 75,
        },
    ),
    # Level 7
    Level(
        sprites=[
            sprites["aidclcbjcv"].clone().set_position(0, 44),
            sprites["cwefnfvjhr"].clone(),
            sprites["geffskzhqq"].clone().set_position(48, 28),
            sprites["jqzhxgbmtz"].clone().set_position(40, 32),
            sprites["ofwegeqknn"].clone().set_position(12, 28),
            sprites["pktgsotzmw"].clone().set_position(32, 24),
            sprites["pktgsotzmw"].clone().set_position(28, 32),
            sprites["uasmnkbzmm"].clone().set_position(0, 16),
            sprites["uasmnkbzmm"].clone().set_position(4, 16),
            sprites["uasmnkbzmm"].clone().set_position(8, 16),
            sprites["uasmnkbzmm"].clone().set_position(12, 16),
            sprites["uasmnkbzmm"].clone().set_position(16, 16),
            sprites["uasmnkbzmm"].clone().set_position(20, 16),
            sprites["uasmnkbzmm"].clone().set_position(24, 16),
            sprites["uasmnkbzmm"].clone().set_position(28, 16),
            sprites["uasmnkbzmm"].clone().set_position(32, 16),
            sprites["uasmnkbzmm"].clone().set_position(36, 16),
            sprites["uasmnkbzmm"].clone().set_position(40, 16),
            sprites["uasmnkbzmm"].clone().set_position(44, 16),
            sprites["uasmnkbzmm"].clone().set_position(48, 16),
            sprites["uasmnkbzmm"].clone().set_position(52, 16),
            sprites["uasmnkbzmm"].clone().set_position(56, 16),
            sprites["uasmnkbzmm"].clone().set_position(60, 16),
            sprites["uasmnkbzmm"].clone().set_position(0, 40),
            sprites["uasmnkbzmm"].clone().set_position(4, 40),
            sprites["uasmnkbzmm"].clone().set_position(8, 40),
            sprites["uasmnkbzmm"].clone().set_position(12, 40),
            sprites["uasmnkbzmm"].clone().set_position(16, 40),
            sprites["uasmnkbzmm"].clone().set_position(20, 40),
            sprites["uasmnkbzmm"].clone().set_position(24, 40),
            sprites["uasmnkbzmm"].clone().set_position(28, 40),
            sprites["uasmnkbzmm"].clone().set_position(32, 40),
            sprites["uasmnkbzmm"].clone().set_position(36, 40),
            sprites["uasmnkbzmm"].clone().set_position(40, 40),
            sprites["uasmnkbzmm"].clone().set_position(44, 40),
            sprites["uasmnkbzmm"].clone().set_position(48, 40),
            sprites["uasmnkbzmm"].clone().set_position(52, 40),
            sprites["uasmnkbzmm"].clone().set_position(56, 40),
            sprites["uasmnkbzmm"].clone().set_position(60, 40),
            sprites["wppuejnwhl"].clone().set_position(20, 32),
        ],
        grid_size=(64, 64),
        data={
            "StepCounter": 125,
        },
    ),
    # Level 8
    Level(
        sprites=[
            sprites["byigobxzpg"].clone().set_position(28, 4),
            sprites["byigobxzpg"].clone().set_position(36, 44),
            sprites["jqzhxgbmtz"].clone().set_position(32, 16),
            sprites["jqzhxgbmtz"].clone().set_position(32, 56),
            sprites["peimznrlqd"].clone().set_position(48, 48),
            sprites["pktgsotzmw"].clone().set_position(32, 12),
            sprites["pktgsotzmw"].clone().set_position(28, 8),
            sprites["pktgsotzmw"].clone().set_position(40, 52),
            sprites["pktgsotzmw"].clone().set_position(36, 48),
            sprites["pktgsotzmw"].clone().set_position(28, 52),
            sprites["pktgsotzmw"].clone().set_position(32, 52),
            sprites["pktgsotzmw"].clone().set_position(36, 8),
            sprites["pktgsotzmw"].clone().set_position(24, 12),
            sprites["pktgsotzmw"].clone().set_position(4, 8),
            sprites["pktgsotzmw"].clone().set_position(8, 12),
            sprites["pktgsotzmw"].clone().set_position(8, 8),
            sprites["pktgsotzmw"].clone().set_position(4, 12),
            sprites["pktgsotzmw"].clone().set_position(24, 44),
            sprites["uasmnkbzmm"].clone().set_position(24, 24),
            sprites["uasmnkbzmm"].clone().set_position(28, 24),
            sprites["uasmnkbzmm"].clone().set_position(8, 24),
            sprites["uasmnkbzmm"].clone().set_position(12, 24),
            sprites["uasmnkbzmm"].clone().set_position(0, 24),
            sprites["uasmnkbzmm"].clone().set_position(4, 24),
            sprites["uasmnkbzmm"].clone().set_position(32, 24),
            sprites["uasmnkbzmm"].clone().set_position(36, 24),
            sprites["uasmnkbzmm"].clone().set_position(40, 24),
            sprites["uasmnkbzmm"].clone().set_position(44, 24),
            sprites["uasmnkbzmm"].clone().set_position(48, 24),
            sprites["uasmnkbzmm"].clone().set_position(52, 24),
            sprites["uasmnkbzmm"].clone().set_position(56, 24),
            sprites["uasmnkbzmm"].clone().set_position(60, 24),
            sprites["uasmnkbzmm"].clone().set_position(44, 36),
            sprites["uasmnkbzmm"].clone().set_position(48, 36),
            sprites["uasmnkbzmm"].clone().set_position(52, 36),
            sprites["uasmnkbzmm"].clone().set_position(56, 36),
            sprites["uasmnkbzmm"].clone().set_position(60, 36),
            sprites["uasmnkbzmm"].clone().set_position(0, 36),
            sprites["uasmnkbzmm"].clone().set_position(4, 36),
            sprites["uasmnkbzmm"].clone().set_position(8, 36),
            sprites["uasmnkbzmm"].clone().set_position(12, 36),
            sprites["uasmnkbzmm"].clone().set_position(16, 36),
            sprites["uasmnkbzmm"].clone().set_position(20, 36),
            sprites["uasmnkbzmm"].clone().set_position(24, 36),
            sprites["uasmnkbzmm"].clone().set_position(28, 36),
            sprites["uasmnkbzmm"].clone().set_position(32, 36),
            sprites["vikkhnsrzd"].clone().set_position(44, 8),
            sprites["wppuejnwhl"].clone().set_position(4, 32),
            sprites["xqaqifquaw"].clone().set_position(4, 8),
            sprites["xqaqifquaw"].clone().set_position(12, 48),
        ],
        grid_size=(64, 64),
        data={
            "StepCounter": 150,
        },
    ),
    # Level 9
    Level(
        sprites=[
            sprites["byigobxzpg"].clone().set_position(16, 28),
            sprites["byigobxzpg"].clone().set_position(44, 4),
            sprites["jqzhxgbmtz"].clone().set_position(60, 56),
            sprites["ooaamfpvqr"].clone().set_position(4, 28),
            sprites["peimznrlqd"].clone().set_position(20, 12),
            sprites["pktgsotzmw"].clone().set_position(12, 20),
            sprites["pktgsotzmw"].clone().set_position(8, 28),
            sprites["pktgsotzmw"].clone().set_position(4, 20),
            sprites["pktgsotzmw"].clone().set_position(4, 32),
            sprites["pktgsotzmw"].clone().set_position(56, 32),
            sprites["pktgsotzmw"].clone().set_position(44, 20),
            sprites["pktgsotzmw"].clone().set_position(8, 12),
            sprites["pktgsotzmw"].clone().set_position(48, 28),
            sprites["pktgsotzmw"].clone().set_position(4, 28),
            sprites["pmargquscu"].clone().set_position(52, 12),
            sprites["pmargquscu"].clone().set_position(40, 12),
            sprites["pmargquscu"].clone().set_position(56, 12),
            sprites["pmargquscu"].clone().set_position(60, 12),
            sprites["pmargquscu"].clone().set_position(48, 12),
            sprites["pmargquscu"].clone().set_position(44, 12),
            sprites["uasmnkbzmm"].clone().set_position(40, 40),
            sprites["uasmnkbzmm"].clone().set_position(36, 40),
            sprites["uasmnkbzmm"].clone().set_position(32, 40),
            sprites["uasmnkbzmm"].clone().set_position(56, 40),
            sprites["uasmnkbzmm"].clone().set_position(52, 40),
            sprites["uasmnkbzmm"].clone().set_position(48, 40),
            sprites["uasmnkbzmm"].clone().set_position(44, 40),
            sprites["uasmnkbzmm"].clone().set_position(60, 40),
            sprites["uasmnkbzmm"].clone().set_position(32, 44),
            sprites["uasmnkbzmm"].clone().set_position(32, 48),
            sprites["uasmnkbzmm"].clone().set_position(40, 56),
            sprites["uasmnkbzmm"].clone().set_position(40, 60),
            sprites["uasmnkbzmm"].clone().set_position(48, 44),
            sprites["uasmnkbzmm"].clone().set_position(48, 48),
            sprites["uasmnkbzmm"].clone().set_position(56, 48),
            sprites["uasmnkbzmm"].clone().set_position(56, 52),
            sprites["uasmnkbzmm"].clone().set_position(24, 56),
            sprites["uasmnkbzmm"].clone().set_position(24, 60),
            sprites["uasmnkbzmm"].clone().set_position(24, 52),
            sprites["uasmnkbzmm"].clone().set_position(24, 48),
            sprites["uasmnkbzmm"].clone().set_position(56, 56),
            sprites["uasmnkbzmm"].clone().set_position(56, 60),
            sprites["uasmnkbzmm"].clone().set_position(48, 52),
            sprites["uasmnkbzmm"].clone().set_position(48, 56),
            sprites["uasmnkbzmm"].clone().set_position(40, 48),
            sprites["uasmnkbzmm"].clone().set_position(40, 52),
            sprites["uasmnkbzmm"].clone().set_position(32, 56),
            sprites["uasmnkbzmm"].clone().set_position(32, 52),
            sprites["uasmnkbzmm"].clone().set_position(24, 40),
            sprites["uasmnkbzmm"].clone().set_position(28, 40),
            sprites["uasmnkbzmm"].clone().set_position(16, 40),
            sprites["uasmnkbzmm"].clone().set_position(20, 40),
            sprites["uasmnkbzmm"].clone().set_position(16, 44),
            sprites["uasmnkbzmm"].clone().set_position(16, 48),
            sprites["uasmnkbzmm"].clone().set_position(16, 56),
            sprites["uasmnkbzmm"].clone().set_position(16, 52),
            sprites["uasmnkbzmm"].clone().set_position(36, 0),
            sprites["uasmnkbzmm"].clone().set_position(36, 4),
            sprites["uasmnkbzmm"].clone().set_position(36, 8),
            sprites["uasmnkbzmm"].clone().set_position(36, 16),
            sprites["uasmnkbzmm"].clone().set_position(36, 12),
            sprites["uasmnkbzmm"].clone().set_position(36, 20),
            sprites["uasmnkbzmm"].clone().set_position(36, 24),
            sprites["uasmnkbzmm"].clone().set_position(36, 28),
            sprites["uasmnkbzmm"].clone().set_position(8, 60),
            sprites["uasmnkbzmm"].clone().set_position(8, 56),
            sprites["uasmnkbzmm"].clone().set_position(8, 52),
            sprites["uasmnkbzmm"].clone().set_position(8, 48),
            sprites["uasmnkbzmm"].clone().set_position(8, 44),
            sprites["uasmnkbzmm"].clone().set_position(8, 40),
            sprites["wkmuwhjqyo"].clone().set_position(52, 24),
            sprites["wkmuwhjqyo"].clone().set_position(52, 8),
            sprites["wppuejnwhl"].clone().set_position(32, 32),
        ],
        grid_size=(64, 64),
        data={
            "StepCounter": 70,
        },
    ),
]
BACKGROUND_COLOR = 1
PADDING_COLOR = 0
celomdfhbh = 4
wvrpthjfsv = 4
vlzkmytlgh = 3
hgqlwjikqr = 0
qrmfayeqpo = 5
ansrsmsvzs = 15
lajjveeqzb = 11


class etuniyewsy(RenderableUserDisplay):
    """."""

    # Readability v3: structural flow; etuniyewsy.__init__:775-778
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, dbdarsgrbj: int):
        """."""
        self.dbdarsgrbj = dbdarsgrbj
        self.current_steps = dbdarsgrbj

    # Readability v3: update_binding; etuniyewsy.uwwwedmhqv:780-782
    # Perform self.current_steps = max(0, min(yfgynsqzmu, self.dbdarsgrbj)); argument/attribute spellings are preserved. [structural-contract]
    def uwwwedmhqv(self, yfgynsqzmu: int) -> None:
        """."""
        self.current_steps = max(0, min(yfgynsqzmu, self.dbdarsgrbj))

    # Readability v3: structural flow; etuniyewsy.pfakmupgbr:784-788
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def pfakmupgbr(self) -> bool:
        """."""
        if self.current_steps > 0:
            self.current_steps -= 1
        return self.current_steps > 0

    # Readability v3: update_binding; etuniyewsy.ububboesmh:790-792
    # Perform self.current_steps = self.dbdarsgrbj; argument/attribute spellings are preserved. [structural-contract]
    def ububboesmh(self) -> None:
        """."""
        self.current_steps = self.dbdarsgrbj

    # Readability v3: structural flow; etuniyewsy.render_interface:794-805
    # Explicit 10-statement structural flow below; 2 conditions, 1 loops, 4 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def render_interface(self, frame: np.ndarray) -> np.ndarray:
        """."""
        if self.dbdarsgrbj == 0:
            return frame
        icsbqzymhf = self.current_steps / self.dbdarsgrbj
        eagwaqduxs = round(64 * icsbqzymhf)
        for x in range(64):
            if x < eagwaqduxs:
                frame[63, x] = 7
            else:
                frame[63, x] = 4
        return frame


class wjdpciselr(Camera):
    """."""

    # Readability v3: structural flow; wjdpciselr._raw_render:811-831
    # Explicit 20-statement structural flow below; 1 conditions, 1 loops, 16 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def _raw_render(self, sprites: list[Sprite]) -> np.ndarray:
        output = np.full((self._height, self._width), self._background, dtype=np.int8)
        for sprite in sprites:
            sprite_pixels = sprite.pixels
            sprite_height, sprite_width = sprite_pixels.shape
            rel_x = sprite._x - self._x
            rel_y = sprite._y - self._y
            dest_x_start = max(0, rel_x)
            dest_x_end = min(self._width, rel_x + sprite_width)
            dest_y_start = max(0, rel_y)
            dest_y_end = min(self._height, rel_y + sprite_height)
            if dest_x_end <= dest_x_start or dest_y_end <= dest_y_start:
                continue
            sprite_x_start = max(0, -rel_x)
            sprite_x_end = sprite_width - max(0, rel_x + sprite_width - self._width)
            sprite_y_start = max(0, -rel_y)
            sprite_y_end = sprite_height - max(0, rel_y + sprite_height - self._height)
            sprite_region = sprite_pixels[sprite_y_start:sprite_y_end, sprite_x_start:sprite_x_end]
            visible_mask = sprite_region >= 0
            output[dest_y_start:dest_y_end, dest_x_start:dest_x_end][visible_mask] = sprite_region[visible_mask]
        return output


# Readability v3: manhattan_distance; hbipqrhvbm:834-835
# Sum absolute coordinate differences. [human-source-reviewed]
def hbipqrhvbm(rfwebuoepa: tuple[int, int], ixzwlkvsbs: tuple[int, int]) -> int:
    return abs(rfwebuoepa[0] - ixzwlkvsbs[0]) + abs(rfwebuoepa[1] - ixzwlkvsbs[1])


# Readability v3: one_grid_step_apart; mdbwmdaxuu:838-839
# Test whether Manhattan distance equals the game's cell spacing. [human-source-reviewed]
def mdbwmdaxuu(rfwebuoepa: tuple[int, int], ixzwlkvsbs: tuple[int, int]) -> bool:
    return hbipqrhvbm(rfwebuoepa, ixzwlkvsbs) == celomdfhbh


# Readability v3: sprite_in_front_of_carrier; vwiozbtqgi:842-850
# Check the neighboring cell in the carrier's rotation-dependent facing direction. [human-source-reviewed]
def vwiozbtqgi(fqdniajpfh: Sprite, sprite: Sprite) -> bool:
    if fqdniajpfh.rotation == 0:
        return fqdniajpfh.x == sprite.x and fqdniajpfh.y - celomdfhbh == sprite.y
    elif fqdniajpfh.rotation == 180:
        return fqdniajpfh.x == sprite.x and fqdniajpfh.y + celomdfhbh == sprite.y
    elif fqdniajpfh.rotation == 90:
        return fqdniajpfh.x + celomdfhbh == sprite.x and fqdniajpfh.y == sprite.y
    else:
        return fqdniajpfh.x - celomdfhbh == sprite.x and fqdniajpfh.y == sprite.y


# Readability v3: recolor_four_pixel_border; uxricavavq:853-857
# Write the supplied color to the outer rows and columns of a four-by-four sprite. [human-source-reviewed]
def uxricavavq(sprite: Sprite, clhazarisu: int) -> None:
    sprite.pixels[:, 0] = clhazarisu
    sprite.pixels[:, 3] = clhazarisu
    sprite.pixels[0, :] = clhazarisu
    sprite.pixels[3, :] = clhazarisu


# Readability v3: cardinal_displacement_rotation; pjedoipwee:860-867
# Convert up/right/down/left displacement to 0/90/180/270 degrees, with the code's ordered tests. [human-source-reviewed]
def pjedoipwee(dx: int, dy: int) -> int:
    if dy < 0:
        return 0
    elif dx > 0:
        return 90
    elif dy > 0:
        return 180
    return 270


# Readability v3: point_in_sprite_rectangle; anojofkynf:870-871
# Test a half-open sprite bounding rectangle. [human-source-reviewed]
def anojofkynf(v: tuple[int, int], sprite: Sprite) -> bool:
    return v[0] >= sprite.x and v[0] < sprite.x + sprite.width and (v[1] >= sprite.y) and (v[1] < sprite.y + sprite.height)


class Wa30(ARCBaseGame):
    kuncbnslnm: etuniyewsy
    nsevyuople: dict[Sprite, Sprite]
    zmqreragji: dict[Sprite, Sprite]
    pkbufziase: set[tuple[int, int]]
    wyzquhjerd: set[tuple[int, int]]
    lqctaojiby: set[tuple[int, int]]
    qthdiggudy: set[tuple[int, int]]
    lkvghqfwan: set[tuple[int, int]]
    uuorgjazmj: set[tuple[int, int]]

    # Readability v3: structural flow; Wa30.__init__:885-897
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self) -> None:
        self.kuncbnslnm = etuniyewsy(0)
        sfahrdviv = Camera(
            background=BACKGROUND_COLOR,
            letter_box=PADDING_COLOR,
            interfaces=[self.kuncbnslnm],
        )
        super().__init__(
            game_id="wa30",
            levels=levels,
            camera=sfahrdviv,
            available_actions=[1, 2, 3, 4, 5],
        )

    # Readability v3: structural flow; Wa30.on_set_level:899-932
    # Explicit 33-statement structural flow below; 1 conditions, 9 loops, 12 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def on_set_level(self, level: Level) -> None:
        self.xcuqvqnmiu()
        self.nsevyuople = dict()
        self.zmqreragji = dict()
        self.pkbufziase = set()
        self.wyzquhjerd = set()
        self.lqctaojiby = set()
        self.qthdiggudy = set()
        self.lkvghqfwan = set()
        self.uuorgjazmj = set()
        xdatcqhbr = self.current_level.get_sprites()
        for wunpnzavk in xdatcqhbr:
            if wunpnzavk.is_collidable:
                self.pkbufziase.add((wunpnzavk.x, wunpnzavk.y))
        for i in range(0, 64, celomdfhbh):
            self.pkbufziase.add((-celomdfhbh, i))
            self.pkbufziase.add((64, i))
            self.pkbufziase.add((i, -celomdfhbh))
            self.pkbufziase.add((i, 64))
        qiitczxxug = self.current_level.get_sprites_by_tag("fsjjayjoeg")
        for yotccnlopr in qiitczxxug:
            for i in range(yotccnlopr.height):
                for iiffofdbmb in range(yotccnlopr.width):
                    self.wyzquhjerd.add((yotccnlopr.x + iiffofdbmb, yotccnlopr.y + i))
        djpjnippwv = self.current_level.get_sprites_by_tag("zqxwgacnue")
        for tsrsytlfgb in djpjnippwv:
            for i in range(tsrsytlfgb.height):
                for iiffofdbmb in range(tsrsytlfgb.width):
                    self.lqctaojiby.add((tsrsytlfgb.x + iiffofdbmb, tsrsytlfgb.y + i))
        gflnevqmdv = self.current_level.get_sprites_by_tag("bnzklblgdk")
        for adxrpmucwx in gflnevqmdv:
            self.qthdiggudy.add((adxrpmucwx.x, adxrpmucwx.y))
        self.vyltpasvhc()
        self.lgirylubbp()

    # Readability v3: structural flow; Wa30.vyltpasvhc:934-947
    # Explicit 8-statement structural flow below; 1 conditions, 2 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def vyltpasvhc(self) -> None:
        """."""
        self.lkvghqfwan = set()
        fyfxmnwzhp = self.current_level.get_sprites_by_tag("geezpjgiyd")
        for ijudbtgsll in fyfxmnwzhp:
            if ijudbtgsll not in self.zmqreragji and (not self.shbxbhnhjc((ijudbtgsll.x, ijudbtgsll.y))):
                qrcmkiozlr = [
                    (ijudbtgsll.x - celomdfhbh, ijudbtgsll.y),
                    (ijudbtgsll.x + celomdfhbh, ijudbtgsll.y),
                    (ijudbtgsll.x, ijudbtgsll.y - celomdfhbh),
                    (ijudbtgsll.x, ijudbtgsll.y + celomdfhbh),
                ]
                for v in qrcmkiozlr:
                    self.lkvghqfwan.add(v)

    # Readability v3: structural flow; Wa30.lgirylubbp:949-962
    # Explicit 8-statement structural flow below; 1 conditions, 2 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def lgirylubbp(self) -> None:
        """."""
        self.uuorgjazmj = set()
        fyfxmnwzhp = self.current_level.get_sprites_by_tag("geezpjgiyd")
        for ijudbtgsll in fyfxmnwzhp:
            if not self.jrrltylxpp(ijudbtgsll) and (not self.ahzqkfjpsc((ijudbtgsll.x, ijudbtgsll.y))):
                qrcmkiozlr = [
                    (ijudbtgsll.x - celomdfhbh, ijudbtgsll.y),
                    (ijudbtgsll.x + celomdfhbh, ijudbtgsll.y),
                    (ijudbtgsll.x, ijudbtgsll.y - celomdfhbh),
                    (ijudbtgsll.x, ijudbtgsll.y + celomdfhbh),
                ]
                for v in qrcmkiozlr:
                    self.uuorgjazmj.add(v)

    # Readability v3: structural flow; Wa30.xcuqvqnmiu:964-968
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def xcuqvqnmiu(self) -> None:
        """."""
        drogceccgh = self.current_level.get_data("StepCounter")
        self.kuncbnslnm.dbdarsgrbj = drogceccgh
        self.kuncbnslnm.ububboesmh()

    # Readability v3: move_carrier_with_optional_cargo; Wa30.wqwsvmhhzj:970-985
    # For an attached payload, preserve its relative offset and update both occupancy positions only if the pair fits. Otherwise move an unladen carrier to an allowed site. [human-source-reviewed]
    def wqwsvmhhzj(self, fqdniajpfh: Sprite, x: int, y: int) -> None:
        if fqdniajpfh in self.nsevyuople:
            tkrlgpoppf = self.nsevyuople[fqdniajpfh]
            if self.fuykgiiwit(fqdniajpfh, tkrlgpoppf, (x, y)):
                dx, dy = (tkrlgpoppf.x - fqdniajpfh.x, tkrlgpoppf.y - fqdniajpfh.y)
                self.pkbufziase.remove((fqdniajpfh.x, fqdniajpfh.y))
                self.pkbufziase.remove((tkrlgpoppf.x, tkrlgpoppf.y))
                fqdniajpfh.set_position(x, y)
                tkrlgpoppf.set_position(x + dx, y + dy)
                self.pkbufziase.add((fqdniajpfh.x, fqdniajpfh.y))
                self.pkbufziase.add((tkrlgpoppf.x, tkrlgpoppf.y))
                self.lgirylubbp()
        elif self.kblzhbvysd((x, y)):
            self.pkbufziase.remove((fqdniajpfh.x, fqdniajpfh.y))
            fqdniajpfh.set_position(x, y)
            self.pkbufziase.add((fqdniajpfh.x, fqdniajpfh.y))

    # Readability v3: face_and_step_carrier; Wa30.qnmfimgpwc:987-991
    # Rotate an unladen carrier toward the requested displacement, then attempt translation; laden carriers retain orientation. [human-source-reviewed]
    def qnmfimgpwc(self, fqdniajpfh: Sprite, dx: int, dy: int) -> None:
        if fqdniajpfh not in self.nsevyuople:
            rotation = pjedoipwee(dx, dy)
            fqdniajpfh.set_rotation(rotation)
        self.wqwsvmhhzj(fqdniajpfh, fqdniajpfh.x + dx, fqdniajpfh.y + dy)

    # Readability v3: unladen_destination_is_clear; Wa30.kblzhbvysd:993-994
    # Require a coordinate to be absent from occupied positions and the additional prohibited-position set. [human-source-reviewed]
    def kblzhbvysd(self, v: tuple[int, int]) -> bool:
        return v not in self.pkbufziase and v not in self.qthdiggudy

    # Readability v3: carrier_payload_destination_is_clear; Wa30.fuykgiiwit:996-1001
    # Check the proposed carrier and offset payload cells, allowing them to occupy each other's old positions but respecting additional carrier restrictions. [human-source-reviewed]
    def fuykgiiwit(self, fqdniajpfh: Sprite, tkrlgpoppf: Sprite, v: tuple[int, int]) -> bool:
        dx = tkrlgpoppf.x - fqdniajpfh.x
        dy = tkrlgpoppf.y - fqdniajpfh.y
        tsvynrmpmm = (v[0] + dx, v[1] + dy)
        vouzrxjshl = (v not in self.pkbufziase or v == (tkrlgpoppf.x, tkrlgpoppf.y)) and v not in self.qthdiggudy and (tsvynrmpmm not in self.pkbufziase or tsvynrmpmm == (fqdniajpfh.x, fqdniajpfh.y))
        return vouzrxjshl

    # Readability v3: return_expression; Wa30.shbxbhnhjc:1003-1004
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def shbxbhnhjc(self, v: tuple[int, int]) -> bool:
        return v in self.wyzquhjerd

    # Readability v3: return_expression; Wa30.ahzqkfjpsc:1006-1007
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahzqkfjpsc(self, v: tuple[int, int]) -> bool:
        return v in self.lqctaojiby

    # Readability v3: breadth_first_route_to_available_cargo_neighbor; Wa30.czrprbohhe:1009-1029
    # Search four-neighbor paths from a carrier until a precomputed eligible cargo-adjacent position is reached. [human-source-reviewed]
    def czrprbohhe(self, fqdniajpfh: Sprite) -> list[tuple[int, int]] | None:
        kpiyvjksem = (fqdniajpfh.x, fqdniajpfh.y)
        qkmekaxaqf = set()
        qkmekaxaqf.add(kpiyvjksem)
        mbkpalarob = [[kpiyvjksem]]
        while mbkpalarob:
            sfivrisylh = mbkpalarob.pop(0)
            omhkabyvpg = sfivrisylh[-1]
            if omhkabyvpg in self.lkvghqfwan:
                return sfivrisylh
            qrcmkiozlr = [
                (omhkabyvpg[0] - celomdfhbh, omhkabyvpg[1]),
                (omhkabyvpg[0] + celomdfhbh, omhkabyvpg[1]),
                (omhkabyvpg[0], omhkabyvpg[1] - celomdfhbh),
                (omhkabyvpg[0], omhkabyvpg[1] + celomdfhbh),
            ]
            for yweobqdxhg in qrcmkiozlr:
                if yweobqdxhg not in qkmekaxaqf and self.kblzhbvysd(yweobqdxhg):
                    qkmekaxaqf.add(yweobqdxhg)
                    mbkpalarob.append(sfivrisylh + [yweobqdxhg])
        return None

    # Readability v3: structural flow; Wa30.cyjrduhzmz:1031-1054
    # Explicit 18-statement structural flow below; 3 conditions, 1 loops, 9 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def cyjrduhzmz(self, fqdniajpfh: Sprite) -> list[tuple[int, int]] | None:
        kpiyvjksem = (fqdniajpfh.x, fqdniajpfh.y)
        qkmekaxaqf = set()
        qkmekaxaqf.add(kpiyvjksem)
        mbkpalarob = [[kpiyvjksem]]
        tkrlgpoppf = self.nsevyuople[fqdniajpfh]
        dx = tkrlgpoppf.x - fqdniajpfh.x
        dy = tkrlgpoppf.y - fqdniajpfh.y
        while mbkpalarob:
            sfivrisylh = mbkpalarob.pop(0)
            omhkabyvpg = sfivrisylh[-1]
            if self.shbxbhnhjc((omhkabyvpg[0] + dx, omhkabyvpg[1] + dy)):
                return sfivrisylh
            qrcmkiozlr = [
                (omhkabyvpg[0] - celomdfhbh, omhkabyvpg[1]),
                (omhkabyvpg[0] + celomdfhbh, omhkabyvpg[1]),
                (omhkabyvpg[0], omhkabyvpg[1] - celomdfhbh),
                (omhkabyvpg[0], omhkabyvpg[1] + celomdfhbh),
            ]
            for yweobqdxhg in qrcmkiozlr:
                if yweobqdxhg not in qkmekaxaqf and self.fuykgiiwit(fqdniajpfh, tkrlgpoppf, yweobqdxhg):
                    qkmekaxaqf.add(yweobqdxhg)
                    mbkpalarob.append(sfivrisylh + [yweobqdxhg])
        return None

    # Readability v3: structural flow; Wa30.zauouvdhta:1056-1076
    # Explicit 15-statement structural flow below; 3 conditions, 1 loops, 6 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zauouvdhta(self, fqdniajpfh: Sprite) -> list[tuple[int, int]] | None:
        kpiyvjksem = (fqdniajpfh.x, fqdniajpfh.y)
        qkmekaxaqf = set()
        qkmekaxaqf.add(kpiyvjksem)
        mbkpalarob = [[kpiyvjksem]]
        while mbkpalarob:
            sfivrisylh = mbkpalarob.pop(0)
            omhkabyvpg = sfivrisylh[-1]
            if omhkabyvpg in self.uuorgjazmj:
                return sfivrisylh
            qrcmkiozlr = [
                (omhkabyvpg[0] - celomdfhbh, omhkabyvpg[1]),
                (omhkabyvpg[0] + celomdfhbh, omhkabyvpg[1]),
                (omhkabyvpg[0], omhkabyvpg[1] - celomdfhbh),
                (omhkabyvpg[0], omhkabyvpg[1] + celomdfhbh),
            ]
            for yweobqdxhg in qrcmkiozlr:
                if yweobqdxhg not in qkmekaxaqf and self.kblzhbvysd(yweobqdxhg):
                    qkmekaxaqf.add(yweobqdxhg)
                    mbkpalarob.append(sfivrisylh + [yweobqdxhg])
        return None

    # Readability v3: structural flow; Wa30.egqayvffim:1078-1101
    # Explicit 18-statement structural flow below; 3 conditions, 1 loops, 9 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def egqayvffim(self, fqdniajpfh: Sprite) -> list[tuple[int, int]] | None:
        kpiyvjksem = (fqdniajpfh.x, fqdniajpfh.y)
        qkmekaxaqf = set()
        qkmekaxaqf.add(kpiyvjksem)
        mbkpalarob = [[kpiyvjksem]]
        tkrlgpoppf = self.nsevyuople[fqdniajpfh]
        dx = tkrlgpoppf.x - fqdniajpfh.x
        dy = tkrlgpoppf.y - fqdniajpfh.y
        while mbkpalarob:
            sfivrisylh = mbkpalarob.pop(0)
            omhkabyvpg = sfivrisylh[-1]
            if self.ahzqkfjpsc((omhkabyvpg[0] + dx, omhkabyvpg[1] + dy)):
                return sfivrisylh
            qrcmkiozlr = [
                (omhkabyvpg[0] - celomdfhbh, omhkabyvpg[1]),
                (omhkabyvpg[0] + celomdfhbh, omhkabyvpg[1]),
                (omhkabyvpg[0], omhkabyvpg[1] - celomdfhbh),
                (omhkabyvpg[0], omhkabyvpg[1] + celomdfhbh),
            ]
            for yweobqdxhg in qrcmkiozlr:
                if yweobqdxhg not in qkmekaxaqf and self.fuykgiiwit(fqdniajpfh, tkrlgpoppf, yweobqdxhg):
                    qkmekaxaqf.add(yweobqdxhg)
                    mbkpalarob.append(sfivrisylh + [yweobqdxhg])
        return None

    # Readability v3: structural flow; Wa30.xpcvspllwr:1103-1109
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def xpcvspllwr(self, fqdniajpfh: Sprite, sprite: Sprite) -> None:
        if sprite in self.zmqreragji:
            self.kqrtstlzkg(self.zmqreragji[sprite])
        self.nsevyuople[fqdniajpfh] = sprite
        self.zmqreragji[sprite] = fqdniajpfh
        self.vyltpasvhc()
        self.lgirylubbp()

    # Readability v3: structural flow; Wa30.kqrtstlzkg:1111-1117
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def kqrtstlzkg(self, fqdniajpfh: Sprite) -> None:
        if fqdniajpfh in self.nsevyuople:
            sprite = self.nsevyuople[fqdniajpfh]
            del self.zmqreragji[sprite]
            del self.nsevyuople[fqdniajpfh]
            self.vyltpasvhc()
            self.lgirylubbp()

    # Readability v3: structural flow; Wa30.zzppkjnqgk:1119-1140
    # Explicit 18-statement structural flow below; 5 conditions, 2 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zzppkjnqgk(self) -> None:
        xfkkaooadb = self.current_level.get_sprites_by_tag("wbmdvjhthc")
        fyfxmnwzhp = self.current_level.get_sprites_by_tag("geezpjgiyd")
        for ijudbtgsll in fyfxmnwzhp:
            if ijudbtgsll in self.zmqreragji:
                fqdniajpfh = self.zmqreragji[ijudbtgsll]
                if fqdniajpfh in xfkkaooadb:
                    uxricavavq(ijudbtgsll, hgqlwjikqr)
                elif any([vwiozbtqgi(olxydpaqfn, ijudbtgsll) for olxydpaqfn in xfkkaooadb]):
                    uxricavavq(ijudbtgsll, vlzkmytlgh)
                else:
                    uxricavavq(ijudbtgsll, qrmfayeqpo)
            elif any([vwiozbtqgi(olxydpaqfn, ijudbtgsll) for olxydpaqfn in xfkkaooadb]):
                uxricavavq(ijudbtgsll, vlzkmytlgh)
            else:
                uxricavavq(ijudbtgsll, wvrpthjfsv)
        zyjsukrrpd = self.current_level.get_sprites_by_tag("ysysltqlke")
        for kkkwtxdnov in zyjsukrrpd:
            if any([vwiozbtqgi(olxydpaqfn, kkkwtxdnov) for olxydpaqfn in xfkkaooadb]):
                uxricavavq(kkkwtxdnov, lajjveeqzb)
            else:
                uxricavavq(kkkwtxdnov, ansrsmsvzs)

    # Readability v3: structural flow; Wa30.ynmgxjqkgh:1142-1163
    # Explicit 19-statement structural flow below; 5 conditions, 2 loops, 7 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ynmgxjqkgh(self) -> None:
        makxrwhhlc = self.current_level.get_sprites_by_tag("kdweefinfi")
        for dhptvmzfpx in makxrwhhlc:
            if dhptvmzfpx in self.nsevyuople:
                tkrlgpoppf = self.nsevyuople[dhptvmzfpx]
                if self.shbxbhnhjc((tkrlgpoppf.x, tkrlgpoppf.y)):
                    self.kqrtstlzkg(dhptvmzfpx)
                else:
                    sfivrisylh = self.cyjrduhzmz(dhptvmzfpx)
                    if sfivrisylh and len(sfivrisylh) > 1:
                        czvpytgvaw = sfivrisylh[1]
                        self.wqwsvmhhzj(dhptvmzfpx, czvpytgvaw[0], czvpytgvaw[1])
            else:
                fyfxmnwzhp = self.current_level.get_sprites_by_tag("geezpjgiyd")
                for ijudbtgsll in fyfxmnwzhp:
                    if mdbwmdaxuu((dhptvmzfpx.x, dhptvmzfpx.y), (ijudbtgsll.x, ijudbtgsll.y)) and ijudbtgsll not in self.zmqreragji and (not self.shbxbhnhjc((ijudbtgsll.x, ijudbtgsll.y))):
                        self.xpcvspllwr(dhptvmzfpx, ijudbtgsll)
                        return
                sfivrisylh = self.czrprbohhe(dhptvmzfpx)
                if sfivrisylh:
                    czvpytgvaw = sfivrisylh[1]
                    self.wqwsvmhhzj(dhptvmzfpx, czvpytgvaw[0], czvpytgvaw[1])

    # Readability v3: structural flow; Wa30.jrrltylxpp:1165-1169
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jrrltylxpp(self, sprite: Sprite) -> bool:
        if sprite in self.zmqreragji:
            fqdniajpfh = self.zmqreragji[sprite]
            return "ysysltqlke" in fqdniajpfh.tags
        return False

    # Readability v3: structural flow; Wa30.aoeyzovteg:1171-1192
    # Explicit 19-statement structural flow below; 5 conditions, 2 loops, 7 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def aoeyzovteg(self) -> None:
        zyjsukrrpd = self.current_level.get_sprites_by_tag("ysysltqlke")
        for kkkwtxdnov in zyjsukrrpd:
            if kkkwtxdnov in self.nsevyuople:
                tkrlgpoppf = self.nsevyuople[kkkwtxdnov]
                if self.ahzqkfjpsc((tkrlgpoppf.x, tkrlgpoppf.y)):
                    self.kqrtstlzkg(kkkwtxdnov)
                else:
                    sfivrisylh = self.egqayvffim(kkkwtxdnov)
                    if sfivrisylh and len(sfivrisylh) > 1:
                        czvpytgvaw = sfivrisylh[1]
                        self.wqwsvmhhzj(kkkwtxdnov, czvpytgvaw[0], czvpytgvaw[1])
            else:
                fyfxmnwzhp = self.current_level.get_sprites_by_tag("geezpjgiyd")
                for ijudbtgsll in fyfxmnwzhp:
                    if mdbwmdaxuu((kkkwtxdnov.x, kkkwtxdnov.y), (ijudbtgsll.x, ijudbtgsll.y)) and (not self.jrrltylxpp(ijudbtgsll)) and (not self.ahzqkfjpsc((ijudbtgsll.x, ijudbtgsll.y))):
                        self.xpcvspllwr(kkkwtxdnov, ijudbtgsll)
                        return
                sfivrisylh = self.zauouvdhta(kkkwtxdnov)
                if sfivrisylh:
                    czvpytgvaw = sfivrisylh[1]
                    self.wqwsvmhhzj(kkkwtxdnov, czvpytgvaw[0], czvpytgvaw[1])

    # Readability v3: structural flow; Wa30.ymzfopzgbq:1194-1196
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ymzfopzgbq(self) -> bool:
        fyfxmnwzhp = self.current_level.get_sprites_by_tag("geezpjgiyd")
        return all([self.shbxbhnhjc((ijudbtgsll.x, ijudbtgsll.y)) and ijudbtgsll not in self.zmqreragji for ijudbtgsll in fyfxmnwzhp])

    # Readability v3: structural flow; Wa30.dhrikuybfo:1198-1201
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def dhrikuybfo(self) -> None:
        self.ynmgxjqkgh()
        self.aoeyzovteg()
        self.zzppkjnqgk()

    # Readability v3: structural flow; Wa30.yygfcvqoyx:1203-1246
    # Explicit 42-statement structural flow below; 8 conditions, 2 loops, 11 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def yygfcvqoyx(self, action: ActionInput) -> None:
        olxydpaqfn = self.current_level.get_sprites_by_tag("wbmdvjhthc")[0]
        if action.id == GameAction.ACTION1:
            self.kuncbnslnm.pfakmupgbr()
            dx = 0
            dy = -celomdfhbh
            self.qnmfimgpwc(olxydpaqfn, dx, dy)
            self.dhrikuybfo()
        elif action.id == GameAction.ACTION2:
            self.kuncbnslnm.pfakmupgbr()
            dx = 0
            dy = celomdfhbh
            self.qnmfimgpwc(olxydpaqfn, dx, dy)
            self.dhrikuybfo()
        elif action.id == GameAction.ACTION3:
            self.kuncbnslnm.pfakmupgbr()
            dx = -celomdfhbh
            dy = 0
            self.qnmfimgpwc(olxydpaqfn, dx, dy)
            self.dhrikuybfo()
        elif action.id == GameAction.ACTION4:
            self.kuncbnslnm.pfakmupgbr()
            dx = celomdfhbh
            dy = 0
            self.qnmfimgpwc(olxydpaqfn, dx, dy)
            self.dhrikuybfo()
        elif action.id == GameAction.ACTION5:
            self.kuncbnslnm.pfakmupgbr()
            if olxydpaqfn in self.nsevyuople:
                self.kqrtstlzkg(olxydpaqfn)
            else:
                fyfxmnwzhp = self.current_level.get_sprites_by_tag("geezpjgiyd")
                for ijudbtgsll in fyfxmnwzhp:
                    if vwiozbtqgi(olxydpaqfn, ijudbtgsll):
                        self.xpcvspllwr(olxydpaqfn, ijudbtgsll)
                        break
                zyjsukrrpd = self.current_level.get_sprites_by_tag("ysysltqlke")
                for kkkwtxdnov in zyjsukrrpd:
                    if vwiozbtqgi(olxydpaqfn, kkkwtxdnov):
                        self.kqrtstlzkg(kkkwtxdnov)
                        self.pkbufziase.remove((kkkwtxdnov.x, kkkwtxdnov.y))
                        self.current_level.remove_sprite(kkkwtxdnov)
                        break
            self.dhrikuybfo()

    # Readability v3: structural flow; Wa30.step:1248-1254
    # Explicit 6-statement structural flow below; 2 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def step(self) -> None:
        self.yygfcvqoyx(self.action)
        if self.ymzfopzgbq():
            self.next_level()
        elif not self.kuncbnslnm.current_steps:
            self.lose()
        self.complete_action()
