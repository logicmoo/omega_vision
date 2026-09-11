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

"""mf02 - Map-Reader Minefield (Sudden Death).

Variant of mf01. Same board: a uniform-gray minefield beside a MAP that mirrors
it row-for-row (green = safe, red = mine). Read the map and follow the safe path
from the blue start tile to the yellow goal.

The difference from mf01 is the failure rule: this is the classic *one mistake
ends it* variant. Stepping onto a single mine detonates and it's immediately
GAME OVER (mf01 instead respawns you at the start and only fails when a move
budget is exhausted).

Actions (ACTION1-4 = grid movement):
  1 = up, 2 = down, 3 = left, 4 = right

Reach the goal -> advance to the next, windier level.
"""

from arcengine import (
    ARCBaseGame,
    Camera,
    GameState,
    Level,
    RenderableUserDisplay,
    Sprite,
)

BACKGROUND_COLOR = 5
PADDING_COLOR = 4

# Palette roles
FIELD_COLOR = 3      # uniform gray field tile ("looks safe")
SAFE_COLOR = 14      # green map tile = safe
MINE_COLOR = 8       # red map tile = mine / detonation
DIVIDER_COLOR = 2    # light-gray separator between field and map
PLAYER_COLOR = 9     # blue
GOAL_COLOR = 11      # yellow

# Fixed field layout within the 16x16 grid.
FIELD_X0 = 1
FIELD_Y0 = 1
GAP = 3  # columns between field and map (divider sits in the middle)


sprites = {
    "player": Sprite(
        pixels=[[PLAYER_COLOR]],
        name="player",
        visible=True,
        collidable=True,
        tags=["player"],
    ),
    "goal": Sprite(
        pixels=[[GOAL_COLOR]],
        name="goal",
        visible=True,
        collidable=False,
        tags=["goal"],
    ),
    "field": Sprite(
        pixels=[[FIELD_COLOR]],
        name="field",
        visible=True,
        collidable=False,
        tags=["field"],
    ),
    "map_safe": Sprite(
        pixels=[[SAFE_COLOR]],
        name="map_safe",
        visible=True,
        collidable=False,
        tags=["maptile"],
    ),
    "map_mine": Sprite(
        pixels=[[MINE_COLOR]],
        name="map_mine",
        visible=True,
        collidable=False,
        tags=["maptile"],
    ),
    "divider": Sprite(
        pixels=[[DIVIDER_COLOR]],
        name="divider",
        visible=True,
        collidable=False,
        tags=["divider"],
    ),
}


class Mf02UI(RenderableUserDisplay):
    """HUD (level dots + map legend key) and mine-detonation burst.

    Death FX is drawn in final 64x64 frame space using the same letterbox math
    as ``Camera.render`` for a 16x16 logical grid.
    """

    CAMERA_W = 16
    CAMERA_H = 16

    def __init__(self, num_levels: int) -> None:
        self._level_index = 0
        self._num_levels = num_levels
        self._state: GameState | None = None
        self._fail_active = False
        self._fail_k = 0
        self._fail_cx = 32
        self._fail_cy = 32

    def update(
        self,
        *,
        level_index: int | None = None,
        num_levels: int | None = None,
        state: GameState | None = None,
    ) -> None:
        if level_index is not None:
            self._level_index = level_index
        if num_levels is not None:
            self._num_levels = num_levels
        if state is not None:
            self._state = state

    def clear_fail(self) -> None:
        self._fail_active = False
        self._fail_k = 0

    def trigger_fail(self, grid_x: int, grid_y: int) -> None:
        self._fail_cx, self._fail_cy = self._grid_to_frame_pixel(grid_x, grid_y)
        self._fail_active = True

    def set_fail_frame(self, k: int) -> None:
        self._fail_k = max(0, k)

    @classmethod
    def _grid_to_frame_pixel(cls, gx: int, gy: int) -> tuple[int, int]:
        cw, ch = cls.CAMERA_W, cls.CAMERA_H
        scale = min(64 // cw, 64 // ch)
        x_pad = (64 - cw * scale) // 2
        y_pad = (64 - ch * scale) // 2
        return gx * scale + scale // 2 + x_pad, gy * scale + scale // 2 + y_pad

    @staticmethod
    def _plot_px(frame, h: int, w: int, px: int, py: int, color: int) -> None:
        if 0 <= px < w and 0 <= py < h:
            frame[py, px] = color

    @classmethod
    def _chebyshev_ring(
        cls, frame, h: int, w: int, cx: int, cy: int, r: int, color: int
    ) -> None:
        if r <= 0:
            return
        for dy in range(-r, r + 1):
            for dx in range(-r, r + 1):
                if max(abs(dx), abs(dy)) != r:
                    continue
                cls._plot_px(frame, h, w, cx + dx, cy + dy, color)

    @classmethod
    def _draw_plus(cls, frame, h: int, w: int, cx: int, cy: int, arm: int, color: int) -> None:
        cls._plot_px(frame, h, w, cx, cy, color)
        for a in range(1, arm + 1):
            cls._plot_px(frame, h, w, cx - a, cy, color)
            cls._plot_px(frame, h, w, cx + a, cy, color)
            cls._plot_px(frame, h, w, cx, cy - a, color)
            cls._plot_px(frame, h, w, cx, cy + a, color)

    def render_interface(self, frame):
        import numpy as np

        if not isinstance(frame, np.ndarray):
            return frame
        h, w = frame.shape

        # Legend key (top-left padding): green = safe, red = mine.
        self._plot_px(frame, h, w, 1, 1, SAFE_COLOR)
        self._plot_px(frame, h, w, 3, 1, MINE_COLOR)

        # Level progress dots along the top row.
        for i in range(min(self._num_levels, 14)):
            cx = 6 + i * 2
            if cx >= w:
                break
            if i < self._level_index:
                c = SAFE_COLOR
            elif i == self._level_index:
                c = GOAL_COLOR
            else:
                c = 3
            self._plot_px(frame, h, w, cx, 1, c)

        # Win / lose bar.
        if self._state == GameState.WIN:
            for x in range(w):
                self._plot_px(frame, h, w, x, h - 1, SAFE_COLOR)
        elif self._state == GameState.GAME_OVER:
            for x in range(w):
                self._plot_px(frame, h, w, x, h - 1, MINE_COLOR)

        # Mine-detonation burst at the death cell.
        if self._fail_active:
            ph = self._fail_k
            thick = 2 + min(3, ph // 2)
            for t in range(thick):
                for x in range(w):
                    self._plot_px(frame, h, w, x, t, MINE_COLOR)
                    self._plot_px(frame, h, w, x, h - 1 - t, MINE_COLOR)
                for y in range(h):
                    self._plot_px(frame, h, w, t, y, MINE_COLOR)
                    self._plot_px(frame, h, w, w - 1 - t, y, MINE_COLOR)
            for r in range(2, min(12, 3 + ph * 2), 2):
                c = MINE_COLOR if (r // 2) % 2 == 1 else GOAL_COLOR
                self._chebyshev_ring(frame, h, w, self._fail_cx, self._fail_cy, r, c)
            arm = min(3 + ph, 10)
            self._draw_plus(frame, h, w, self._fail_cx, self._fail_cy, arm, MINE_COLOR)
            self._plot_px(frame, h, w, self._fail_cx, self._fail_cy, GOAL_COLOR)

        return frame


# Level specs: (field_width, field_height, safe_path_local, difficulty, map_side).
# ``safe_path_local`` is an orthogonally connected list of (col, row) cells in
# FIELD-LOCAL coordinates, from the start (index 0, bottom) to the goal (last,
# top). Every field cell not on the path is a mine. A straight run is always
# blocked, so the map must be read. ``map_side`` moves the map on later levels
# ("right" default, then "left" and "far-right") so its location isn't a given.
LEVEL_SPECS: list[tuple[int, int, list[tuple[int, int]], int, str]] = [
    (
        3, 7,
        [(1, 6), (1, 5), (0, 5), (0, 4), (0, 3), (1, 3), (1, 2), (2, 2), (2, 1), (2, 0)],
        1, "right",
    ),
    (
        3, 9,
        [
            (1, 8), (1, 7), (2, 7), (2, 6), (2, 5), (1, 5), (1, 4),
            (0, 4), (0, 3), (0, 2), (1, 2), (1, 1), (1, 0),
        ],
        2, "right",
    ),
    (
        4, 11,
        [
            (2, 10), (2, 9), (3, 9), (3, 8), (3, 7), (2, 7), (1, 7), (1, 6),
            (1, 5), (2, 5), (2, 4), (3, 4), (3, 3), (3, 2), (2, 2), (2, 1), (2, 0),
        ],
        3, "right",
    ),
    (
        4, 13,
        [
            (1, 12), (1, 11), (0, 11), (0, 10), (0, 9), (1, 9), (2, 9), (2, 8),
            (2, 7), (3, 7), (3, 6), (3, 5), (2, 5), (2, 4), (1, 4), (1, 3),
            (1, 2), (2, 2), (2, 1), (2, 0),
        ],
        4, "left",
    ),
    (
        7, 5,
        [
            (0, 4), (0, 3), (1, 3), (1, 2), (0, 2), (0, 1), (1, 1), (2, 1),
            (2, 2), (3, 2), (3, 3), (4, 3), (4, 2), (4, 1), (5, 1), (5, 0), (6, 0),
        ],
        5, "sideways",
    ),
]


def make_mf_level(
    field_w: int,
    field_h: int,
    safe_path_local: list[tuple[int, int]],
    difficulty: int,
    map_side: str = "right",
) -> Level:
    fy0 = FIELD_Y0
    # Where the read-only map sits relative to the play field. Later levels move
    # it so the map's location is no longer a given -- you must find it. On the
    # hardest level the map is laid *sideways* (rotated 90 degrees), so you also
    # have to mentally rotate it to read the safe path.
    rotated = map_side == "sideways"
    if map_side == "left":
        mx0 = FIELD_X0
        fx0 = mx0 + field_w + GAP
        divider_col = mx0 + field_w + (GAP // 2)
    elif map_side == "far-right":
        fx0 = FIELD_X0
        mx0 = 16 - field_w
        divider_col = mx0 - 2
    else:  # "right" (default) and "sideways" (rotated map to the right)
        fx0 = FIELD_X0
        mx0 = fx0 + field_w + GAP
        divider_col = fx0 + field_w + (GAP // 2)

    # Map dimensions: a sideways map is the field transposed (H wide x W tall).
    map_h = field_w if rotated else field_h

    safe_local = {(int(x), int(y)) for (x, y) in safe_path_local}
    start_local = safe_path_local[0]
    goal_local = safe_path_local[-1]

    start_abs = (fx0 + start_local[0], fy0 + start_local[1])
    goal_abs = (fx0 + goal_local[0], fy0 + goal_local[1])

    mines_abs: list[tuple[int, int]] = []
    sprite_list: list[Sprite] = []

    # Uniform field tiles on every field cell (drawn first, under player/goal).
    for ly in range(field_h):
        for lx in range(field_w):
            sprite_list.append(
                sprites["field"].clone().set_position(fx0 + lx, fy0 + ly)
            )
            if (lx, ly) not in safe_local:
                mines_abs.append((fx0 + lx, fy0 + ly))

    # Vertical divider between field and map (spans the taller of the two).
    for ly in range(max(field_h, map_h)):
        sprite_list.append(
            sprites["divider"].clone().set_position(divider_col, fy0 + ly)
        )

    # Map panel: a color mirror of the field (green safe / red mine). When
    # ``rotated`` it is drawn 90 degrees clockwise: field (lx, ly) -> map
    # (field_h - 1 - ly, lx).
    for ly in range(field_h):
        for lx in range(field_w):
            key = "map_safe" if (lx, ly) in safe_local else "map_mine"
            if rotated:
                px, py = mx0 + (field_h - 1 - ly), fy0 + lx
            else:
                px, py = mx0 + lx, fy0 + ly
            sprite_list.append(sprites[key].clone().set_position(px, py))

    # Goal then player on top of the field tiles.
    sprite_list.append(sprites["goal"].clone().set_position(*goal_abs))
    sprite_list.append(sprites["player"].clone().set_position(*start_abs))

    return Level(
        sprites=sprite_list,
        grid_size=(16, 16),
        data={
            "difficulty": difficulty,
            "field": [fx0, fy0, field_w, field_h],
            "mines": [[mx, my] for (mx, my) in mines_abs],
            "goal": [goal_abs[0], goal_abs[1]],
        },
    )


levels = [make_mf_level(*spec) for spec in LEVEL_SPECS]


class Mf02(ARCBaseGame):
    """Read the side map to cross a uniform-looking minefield (one mistake = GAME OVER)."""

    DEATH_ANIM_STEPS = 6

    def __init__(self) -> None:
        self._ui = Mf02UI(len(levels))
        super().__init__(
            "mf02",
            levels,
            Camera(0, 0, 16, 16, BACKGROUND_COLOR, PADDING_COLOR, [self._ui]),
            False,
            1,
            [1, 2, 3, 4],
        )
        self._mines: set[tuple[int, int]] = set()
        self._field = (FIELD_X0, FIELD_Y0, 0, 0)
        self._goal = (0, 0)
        self._field_tiles: dict[tuple[int, int], Sprite] = {}
        self._death_ticks = 0

    def on_set_level(self, level: Level) -> None:
        self._player = self.current_level.get_sprites_by_tag("player")[0]

        fx0, fy0, fw, fh = (int(v) for v in self.current_level.get_data("field"))
        self._field = (fx0, fy0, fw, fh)
        self._mines = {
            (int(x), int(y)) for (x, y) in self.current_level.get_data("mines")
        }
        gx, gy = self.current_level.get_data("goal")
        self._goal = (int(gx), int(gy))

        self._field_tiles = {
            (t.x, t.y): t for t in self.current_level.get_sprites_by_tag("field")
        }

        self._death_ticks = 0
        self._ui.clear_fail()
        self._ui.update(
            level_index=self.level_index,
            num_levels=len(levels),
            state=self._state,
        )

    def _in_field(self, x: int, y: int) -> bool:
        fx0, fy0, fw, fh = self._field
        return fx0 <= x < fx0 + fw and fy0 <= y < fy0 + fh

    def step(self) -> None:
        # Drain the multi-frame detonation animation, then lose().
        if self._death_ticks > 0:
            self._death_ticks -= 1
            self._ui.set_fail_frame(Mf02.DEATH_ANIM_STEPS - 1 - self._death_ticks)
            if self._death_ticks == 0:
                self._ui.update(state=GameState.GAME_OVER)
                self.lose()
                self.complete_action()
            return

        dx = dy = 0
        if self.action.id.value == 1:
            dy = -1
        elif self.action.id.value == 2:
            dy = 1
        elif self.action.id.value == 3:
            dx = -1
        elif self.action.id.value == 4:
            dx = 1
        else:
            self.complete_action()
            return

        new_x = self._player.x + dx
        new_y = self._player.y + dy

        # Movement is confined to the minefield (the map is read-only).
        if not self._in_field(new_x, new_y):
            self.complete_action()
            return

        if (new_x, new_y) in self._mines:
            # Detonate: reveal the hit mine on the field, then run the death FX.
            tile = self._field_tiles.get((new_x, new_y))
            if tile is not None:
                tile.color_remap(tile.pixels[0][0], MINE_COLOR)
            self._player.set_position(new_x, new_y)
            self._death_ticks = Mf02.DEATH_ANIM_STEPS - 1
            self._ui.trigger_fail(new_x, new_y)
            self._ui.set_fail_frame(0)
            return

        self._player.set_position(new_x, new_y)

        if (new_x, new_y) == self._goal:
            self.next_level()
            self._ui.update(
                level_index=self.level_index,
                num_levels=len(levels),
                state=self._state,
            )

        self.complete_action()
