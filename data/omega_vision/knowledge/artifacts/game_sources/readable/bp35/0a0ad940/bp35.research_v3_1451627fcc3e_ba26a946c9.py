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

from __future__ import annotations

import copy
import math
from abc import ABC, abstractmethod
from collections import deque
from typing import Any, Callable, ClassVar, List

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
    "sprite-1": Sprite(
        pixels=[
            [9],
        ],
        name="sprite-1",
        visible=True,
        collidable=True,
    ),
}
levels = [
    # Level 1
    Level(
        sprites=[
            sprites["sprite-1"].clone().set_position(4, 3),
        ],
        grid_size=(8, 8),
    ),
    # Level 2
    Level(
        sprites=[
            sprites["sprite-1"].clone().set_position(4, 3),
        ],
        grid_size=(8, 8),
    ),
    # Level 3
    Level(
        sprites=[
            sprites["sprite-1"].clone().set_position(4, 3),
        ],
        grid_size=(8, 8),
    ),
    # Level 4
    Level(
        sprites=[
            sprites["sprite-1"].clone().set_position(4, 3),
        ],
        grid_size=(8, 8),
    ),
    # Level 5
    Level(
        sprites=[
            sprites["sprite-1"].clone().set_position(4, 3),
        ],
        grid_size=(8, 8),
    ),
    # Level 6
    Level(
        sprites=[
            sprites["sprite-1"].clone().set_position(4, 3),
        ],
        grid_size=(8, 8),
    ),
    # Level 7
    Level(
        sprites=[
            sprites["sprite-1"].clone().set_position(4, 3),
        ],
        grid_size=(8, 8),
    ),
    # Level 8
    Level(
        sprites=[
            sprites["sprite-1"].clone().set_position(4, 3),
        ],
        grid_size=(8, 8),
    ),
    # Level 9
    Level(
        sprites=[
            sprites["sprite-1"].clone().set_position(4, 3),
        ],
        grid_size=(8, 8),
    ),
]

BACKGROUND_COLOR = 0

PADDING_COLOR = 3
"."
mxddxvfqbn = {
    "xrxrxoqbfhw",
    "dshcnskzvyz",
    "tbhsfzetgqx",
    "qqzqnjfcgri",
    "hfzscdtvlfu",
    "udwvbkynpbz",
    "gimrsagplbc",
    "dwzxeajrgkw",
    "esishrsguis",
    "zfrfikzclbp",
    "azoybysqmyj",
    "qkqmaocxqma",
    "admhpzwadps",
    "biowbvmadto",
    "lzwnvwgbsve",
    "cdlrmbsgbdb",
    "qhngsgsqwsa",
    "zhczjjodedx",
    "iuvlzdyadud",
    "dpyrzjjudzu",
    "lrunqaifnhb",
}
vitxqgbeug = {
    "wbemyecbzbc",
    "vrfbpzbjlid",
    "zdfflsbctnz",
    "pjdcytzsmft",
    "kiopdubfvza",
    "luoxctlhdrw",
    "hlfdukibtwe",
    "xcvzlpqlcph",
    "lfqkneessbf",
    "zfckswusepg",
    "yysbupalxff",
    "pevrvnrfxnw",
}


# Readability v3: is_snapshot_copyable_value; qfhykakpqw:161-169
# Recursively accept None, primitive scalars, lists/tuples and dictionaries with copyable keys/values; reject other objects. [human-source-reviewed]
def qfhykakpqw(v: Any) -> bool:
    """."""
    if v is None or isinstance(v, (bool, int, float, str)):
        return True
    if isinstance(v, (list, tuple)):
        return all((qfhykakpqw(x) for x in v))
    if isinstance(v, dict):
        return all((qfhykakpqw(k) and qfhykakpqw(x) for k, x in v.items()))
    return False


# Readability v3: copy_extra_snapshot_attributes; vlpwiiaduq:172-184
# Read __dict__ and inherited __slots__, exclude reserved/dunder names, and deep-copy values accepted by the recursive primitive-container predicate. [human-source-reviewed]
def vlpwiiaduq(fmgtfshuui: Any, rrbgrerqwr: set[str]) -> dict[str, Any]:
    """."""
    result = {}
    for k, v in getattr(fmgtfshuui, "__dict__", {}).items():
        if k not in rrbgrerqwr and (not k.startswith("__")) and qfhykakpqw(v):
            result[k] = copy.deepcopy(v)
    for cls in type(fmgtfshuui).__mro__:
        for xibuqtwjlv in getattr(cls, "__slots__", ()):
            if xibuqtwjlv not in rrbgrerqwr and (not xibuqtwjlv.startswith("__")) and hasattr(fmgtfshuui, xibuqtwjlv):
                v = getattr(fmgtfshuui, xibuqtwjlv)
                if qfhykakpqw(v):
                    result[xibuqtwjlv] = copy.deepcopy(v)
    return result


class iawriokslna:
    """."""

    __slots__ = (
        "fcsukrbkeec",
        "x",
        "y",
        "visible",
        "layer",
        "name",
        "vxgikutplyz",
        "inrqzdeyqds",
        "vzbbctvlzak",
        "axbduooyehz",
        "fsmypqxgucg",
        "aewecigizpx",
        "rzwqvutxbsl",
    )

    # Readability v3: structural flow; iawriokslna.__init__:206-226
    # Explicit 5-statement structural flow below; 0 conditions, 0 loops, 5 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        fcsukrbkeec: int,
        mnaytoipxvj: int,
        y: int,
        visible: bool,
        layer: int,
        name: str,
        vxgikutplyz: str | None,
        inrqzdeyqds: int | None,
        vzbbctvlzak: list[int],
        axbduooyehz: dict[str, Any],
        fsmypqxgucg: float = 1.0,
        aewecigizpx: float = 1.0,
        rzwqvutxbsl: float = 0.0,
    ):
        self.fcsukrbkeec, self.x, self.y = (fcsukrbkeec, mnaytoipxvj, y)
        self.visible, self.layer, self.name = (visible, layer, name)
        self.vxgikutplyz, self.inrqzdeyqds = (vxgikutplyz, inrqzdeyqds)
        self.vzbbctvlzak, self.axbduooyehz = (vzbbctvlzak, axbduooyehz)
        self.fsmypqxgucg, self.aewecigizpx, self.rzwqvutxbsl = (fsmypqxgucg, aewecigizpx, rzwqvutxbsl)

    # Readability v3: return_expression; iawriokslna.clone:228-243
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def clone(self) -> "iawriokslna":
        return iawriokslna(
            self.fcsukrbkeec,
            self.x,
            self.y,
            self.visible,
            self.layer,
            self.name,
            self.vxgikutplyz,
            self.inrqzdeyqds,
            self.vzbbctvlzak.copy(),
            copy.deepcopy(self.axbduooyehz),
            self.fsmypqxgucg,
            self.aewecigizpx,
            self.rzwqvutxbsl,
        )


class skdqqywyywx:
    """."""

    __slots__ = ("qzddpxsvrfr", "axbduooyehz")

    # Readability v3: update_binding; skdqqywyywx.__init__:251-252
    # Perform self.qzddpxsvrfr, self.axbduooyehz = (qzddpxsvrfr, axbduooyehz); argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, qzddpxsvrfr: list[int], axbduooyehz: dict[str, Any]):
        self.qzddpxsvrfr, self.axbduooyehz = (qzddpxsvrfr, axbduooyehz)

    # Readability v3: return_expression; skdqqywyywx.clone:254-255
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def clone(self) -> "skdqqywyywx":
        return skdqqywyywx(self.qzddpxsvrfr.copy(), copy.deepcopy(self.axbduooyehz))


class lunqgvdlhnj:
    """."""

    __slots__ = ("ypnhvygdaqg", "obvfwimxjit", "mxndoukripp", "rfjarwdgvtg")

    # Readability v3: structural flow; lunqgvdlhnj.__init__:263-272
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        ypnhvygdaqg: skdqqywyywx,
        obvfwimxjit: dict[int, iawriokslna],
        mxndoukripp: int = 0,
        rfjarwdgvtg: list[np.ndarray] | None = None,
    ):
        self.ypnhvygdaqg, self.obvfwimxjit = (ypnhvygdaqg, obvfwimxjit)
        self.mxndoukripp = mxndoukripp
        self.rfjarwdgvtg = rfjarwdgvtg if rfjarwdgvtg is not None else []

    # Readability v3: return_expression; lunqgvdlhnj.clone:274-279
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def clone(self) -> "lunqgvdlhnj":
        return lunqgvdlhnj(
            self.ypnhvygdaqg.clone(),
            {k: v.clone() for k, v in self.obvfwimxjit.items()},
            self.mxndoukripp,
        )


class waummvnxwvp:
    """."""

    unoawxnzfx: lunqgvdlhnj | None

    # Readability v3: structural flow; waummvnxwvp.__init__:287-296
    # Explicit 9-statement structural flow below; 0 conditions, 0 loops, 9 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, qivnakklopy: "yodvybvftxa"):
        self.qivnakklopy = qivnakklopy
        self.zogplfgbcbm: list[lunqgvdlhnj] = []
        self.unoawxnzfx: lunqgvdlhnj | None = None
        self.keunykhwkoi: dict[int, "reeyfysuniu"] = {}
        self.pgmziyivhem = 0
        self.hswimgmares = False
        self.sbnuosjwrac = False
        self.rswagfkwslq = 5
        self.qlosujpirkk = 10

    # Readability v3: return_expression; waummvnxwvp.svwxiivzrl:299-300
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def svwxiivzrl(self) -> bool:
        return len(self.zogplfgbcbm) > 0

    # Readability v3: return_expression; waummvnxwvp.lsqshbxiog:303-304
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def lsqshbxiog(self) -> int:
        return len(self.zogplfgbcbm)

    # Readability v3: register_snapshot_object_tree; waummvnxwvp.zdqmxttdle:306-310
    # Index an object by id and recursively register its child list. [human-source-reviewed]
    def zdqmxttdle(self, hikxzgubkh: "reeyfysuniu") -> None:
        """."""
        self.keunykhwkoi[id(hikxzgubkh)] = hikxzgubkh
        for oggaqczbug in hikxzgubkh.esishrsguis:
            self.zdqmxttdle(oggaqczbug)

    # Readability v3: register_scene_snapshot_objects; waummvnxwvp.attzqlefbg:312-317
    # Register every scene root and an optional specially named scene object before capture. [human-source-reviewed]
    def attzqlefbg(self) -> None:
        """."""
        for hikxzgubkh in self.qivnakklopy.zdfflsbctnz:
            self.zdqmxttdle(hikxzgubkh)
        if hasattr(self.qivnakklopy, "pevrvnrfxnw") and self.qivnakklopy.pevrvnrfxnw:
            self.zdqmxttdle(self.qivnakklopy.pevrvnrfxnw)

    # Readability v3: capture_object_snapshot; waummvnxwvp.acnjtsumwm:319-334
    # Capture identity, position, visibility, layer, name, parent/child identities, transform values and copyable extra attributes. [human-source-reviewed]
    def acnjtsumwm(self, hikxzgubkh: "reeyfysuniu") -> iawriokslna:
        return iawriokslna(
            id(hikxzgubkh),
            hikxzgubkh.xrxrxoqbfhw,
            hikxzgubkh.dshcnskzvyz,
            hikxzgubkh.tbhsfzetgqx,
            hikxzgubkh.qqzqnjfcgri,
            hikxzgubkh.hfzscdtvlfu,
            hikxzgubkh.udwvbkynpbz,
            id(hikxzgubkh.dwzxeajrgkw) if hikxzgubkh.dwzxeajrgkw else None,
            [id(wzxzzaivzk) for wzxzzaivzk in hikxzgubkh.esishrsguis],
            vlpwiiaduq(hikxzgubkh, mxddxvfqbn),
            hikxzgubkh.admhpzwadps,
            hikxzgubkh.biowbvmadto,
            hikxzgubkh.qhngsgsqwsa,
        )

    # Readability v3: capture_scene_snapshot; waummvnxwvp.vrguokymel:336-347
    # Refresh object registry, increment snapshot number, and capture root ordering, scene extras and each registered object. [human-source-reviewed]
    def vrguokymel(self) -> lunqgvdlhnj:
        """."""
        self.attzqlefbg()
        self.pgmziyivhem += 1
        return lunqgvdlhnj(
            skdqqywyywx(
                [id(dksomhwxjp) for dksomhwxjp in self.qivnakklopy.zdfflsbctnz],
                vlpwiiaduq(self.qivnakklopy, vitxqgbeug),
            ),
            {qrwlpyjsxx: self.acnjtsumwm(dksomhwxjp) for qrwlpyjsxx, dksomhwxjp in self.keunykhwkoi.items()},
            self.pgmziyivhem,
        )

    # Readability v3: capture_initial_snapshot; waummvnxwvp.jpexoivelf:349-350
    # Store a newly captured scene state separately from undo history. [human-source-reviewed]
    def jpexoivelf(self) -> None:
        self.unoawxnzfx = self.vrguokymel()

    # Readability v3: push_undo_snapshot; waummvnxwvp.dqlasqmxhl:352-356
    # Capture the scene, optionally copy provided frame references into it, and append it to history. [human-source-reviewed]
    def dqlasqmxhl(self, rfjarwdgvtg: list[np.ndarray] | None = None) -> None:
        state = self.vrguokymel()
        if rfjarwdgvtg:
            state.rfjarwdgvtg = rfjarwdgvtg.copy()
        self.zogplfgbcbm.append(state)

    # Readability v3: clear_undo_history; waummvnxwvp.ohvrufqqjd:358-359
    # Clear the history list, not the separately stored initial state. [human-source-reviewed]
    def ohvrufqqjd(self) -> None:
        self.zogplfgbcbm.clear()

    # Readability v3: restore_object_snapshot; waummvnxwvp.lmjmyehxhg:361-374
    # Restore basic and transform fields, refresh derived caches, then restore extra properties via setattr; AttributeError is intentionally ignored by original code. [human-source-reviewed]
    def lmjmyehxhg(self, hikxzgubkh: "reeyfysuniu", state: iawriokslna) -> None:
        hikxzgubkh.xrxrxoqbfhw, hikxzgubkh.dshcnskzvyz = (state.x, state.y)
        hikxzgubkh.tbhsfzetgqx, hikxzgubkh.qqzqnjfcgri = (state.visible, state.layer)
        hikxzgubkh.hfzscdtvlfu, hikxzgubkh.udwvbkynpbz = (state.name, state.vxgikutplyz)
        hikxzgubkh.admhpzwadps, hikxzgubkh.biowbvmadto = (state.fsmypqxgucg, state.aewecigizpx)
        hikxzgubkh.qhngsgsqwsa = state.rzwqvutxbsl
        hikxzgubkh.mrrlbtbxit()
        hikxzgubkh.ohrrcsgwmu()
        hikxzgubkh.gspzwjfope()
        for k, v in state.axbduooyehz.items():
            try:
                setattr(hikxzgubkh, k, copy.deepcopy(v))
            except AttributeError:
                pass

    # Readability v3: restore_snapshot_parent_child_graph; waummvnxwvp.dzoczcspst:376-390
    # Clear current links and reconstruct parent/child relationships and scene roots using preserved object IDs. [human-source-reviewed]
    def dzoczcspst(self, chpvumuvmp: lunqgvdlhnj) -> None:
        """."""
        for hikxzgubkh in self.keunykhwkoi.values():
            hikxzgubkh.esishrsguis.clear()
            hikxzgubkh.dwzxeajrgkw = None
        for state in chpvumuvmp.obvfwimxjit.values():
            if (welhuapdwo := self.keunykhwkoi.get(state.fcsukrbkeec)) is not None:
                for bzanivcixm in state.vzbbctvlzak:
                    if (oggaqczbug := self.keunykhwkoi.get(bzanivcixm)) is not None:
                        oggaqczbug.dwzxeajrgkw = welhuapdwo
                        welhuapdwo.esishrsguis.append(oggaqczbug)
        self.qivnakklopy.zdfflsbctnz.clear()
        for qrwlpyjsxx in chpvumuvmp.ypnhvygdaqg.qzddpxsvrfr:
            if (root := self.keunykhwkoi.get(qrwlpyjsxx)) is not None:
                self.qivnakklopy.zdfflsbctnz.append(root)

    # Readability v3: structural flow; waummvnxwvp.mfwbyhvbpc:392-407
    # Explicit 14-statement structural flow below; 2 conditions, 3 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def mfwbyhvbpc(self, chpvumuvmp: lunqgvdlhnj) -> list[np.ndarray]:
        """."""
        for state in chpvumuvmp.obvfwimxjit.values():
            if hikxzgubkh := self.keunykhwkoi.get(state.fcsukrbkeec):
                self.lmjmyehxhg(hikxzgubkh, state)
        self.dzoczcspst(chpvumuvmp)
        for k, v in chpvumuvmp.ypnhvygdaqg.axbduooyehz.items():
            try:
                setattr(self.qivnakklopy, k, copy.deepcopy(v))
            except AttributeError:
                pass
        self.qivnakklopy.hlfdukibtwe = True
        for hikxzgubkh in self.keunykhwkoi.values():
            if hasattr(hikxzgubkh, "esktperyuto"):
                hikxzgubkh.esktperyuto()
        return []

    # Readability v3: structural flow; waummvnxwvp.axjxiqrkkx:409-443
    # Explicit 22-statement structural flow below; 3 conditions, 2 loops, 12 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def axjxiqrkkx(self, chpvumuvmp: lunqgvdlhnj) -> list[np.ndarray]:
        """."""
        ahrizsjlwz = urzuivpavp.modfqbjsicn
        rznaxtocuu = {
            qrwlpyjsxx: (
                dksomhwxjp.xrxrxoqbfhw,
                dksomhwxjp.dshcnskzvyz,
                dksomhwxjp.admhpzwadps,
                dksomhwxjp.biowbvmadto,
                dksomhwxjp.qhngsgsqwsa,
            )
            for qrwlpyjsxx, dksomhwxjp in self.keunykhwkoi.items()
        }
        yzdtidmrrj = {s.fcsukrbkeec: (s.x, s.y, s.fsmypqxgucg, s.aewecigizpx, s.rzwqvutxbsl) for s in chpvumuvmp.obvfwimxjit.values()}
        gqzoqxubafn = []
        for i in range(self.rswagfkwslq):
            uroxqabltx = ahrizsjlwz.ahrizsjlwz((i + 1) / self.rswagfkwslq)
            for qrwlpyjsxx, hikxzgubkh in self.keunykhwkoi.items():
                if qrwlpyjsxx in rznaxtocuu and qrwlpyjsxx in yzdtidmrrj:
                    wzxzzaivzk, g = (rznaxtocuu[qrwlpyjsxx], yzdtidmrrj[qrwlpyjsxx])
                    hikxzgubkh.xrxrxoqbfhw, hikxzgubkh.dshcnskzvyz = (
                        int(wzxzzaivzk[0] + (g[0] - wzxzzaivzk[0]) * uroxqabltx),
                        int(wzxzzaivzk[1] + (g[1] - wzxzzaivzk[1]) * uroxqabltx),
                    )
                    hikxzgubkh.admhpzwadps = wzxzzaivzk[2] + (g[2] - wzxzzaivzk[2]) * uroxqabltx
                    hikxzgubkh.biowbvmadto = wzxzzaivzk[3] + (g[3] - wzxzzaivzk[3]) * uroxqabltx
                    iuiapwlyhz = g[4] - wzxzzaivzk[4]
                    iuiapwlyhz = iuiapwlyhz - 360 if iuiapwlyhz > 180 else iuiapwlyhz + 360 if iuiapwlyhz < -180 else iuiapwlyhz
                    hikxzgubkh.qhngsgsqwsa = (wzxzzaivzk[4] + iuiapwlyhz * uroxqabltx) % 360.0
                    hikxzgubkh.mrrlbtbxit()
                    hikxzgubkh.ohrrcsgwmu()
                    hikxzgubkh.gspzwjfope()
            gqzoqxubafn.append(self.qivnakklopy.srlqyenmue().copy())
        self.mfwbyhvbpc(chpvumuvmp)
        return gqzoqxubafn

    # Readability v3: structural flow; waummvnxwvp.wbtsymvwjn:445-453
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 1 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wbtsymvwjn(self, chpvumuvmp: lunqgvdlhnj, wlorwsfxko: bool = False) -> list[np.ndarray]:
        """."""
        if not wlorwsfxko:
            return self.mfwbyhvbpc(chpvumuvmp)
        if chpvumuvmp.rfjarwdgvtg:
            result = list(reversed(chpvumuvmp.rfjarwdgvtg))
            self.mfwbyhvbpc(chpvumuvmp)
            return result
        return self.axjxiqrkkx(chpvumuvmp)

    # Readability v3: structural flow; waummvnxwvp.voqmxwktyh:455-461
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def voqmxwktyh(self, chpvumuvmp: lunqgvdlhnj, tegewfaruh: list[np.ndarray] | None = None) -> list[np.ndarray]:
        """."""
        gqzoqxubafn = tegewfaruh or chpvumuvmp.rfjarwdgvtg
        if gqzoqxubafn:
            self.mfwbyhvbpc(chpvumuvmp)
            return list(reversed(gqzoqxubafn))
        return self.axjxiqrkkx(chpvumuvmp)

    # Readability v3: structural flow; waummvnxwvp.svmaaixutx:463-467
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def svmaaixutx(self) -> list[np.ndarray]:
        """."""
        if not self.svwxiivzrl:
            return []
        return self.wbtsymvwjn(self.zogplfgbcbm.pop(), wlorwsfxko=self.hswimgmares)

    # Readability v3: structural flow; waummvnxwvp.eubgwokpez:469-482
    # Explicit 13-statement structural flow below; 3 conditions, 1 loops, 1 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def eubgwokpez(self) -> list[np.ndarray]:
        """."""
        if not self.unoawxnzfx:
            return []
        if self.sbnuosjwrac:
            tegewfaruh = []
            for state in reversed(self.zogplfgbcbm):
                tegewfaruh.extend(state.rfjarwdgvtg)
            self.zogplfgbcbm.clear()
            if tegewfaruh:
                return self.voqmxwktyh(self.unoawxnzfx, tegewfaruh)
        self.zogplfgbcbm.clear()
        self.mfwbyhvbpc(self.unoawxnzfx)
        return []

    # Readability v3: read_attribute; waummvnxwvp.dxodnyehcr:484-485
    # Return self.unoawxnzfx; descriptor behavior is not assumed pure. [structural-contract]
    def dxodnyehcr(self) -> lunqgvdlhnj | None:
        return self.unoawxnzfx

    # Readability v3: return_expression; waummvnxwvp.upvwqfhdda:487-488
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def upvwqfhdda(self) -> lunqgvdlhnj:
        return self.vrguokymel()


"."


class ippccftuhrf:
    """."""

    __slots__ = ("qivnakklopy", "gqzoqxubafn", "liajnvjgzoj")

    # Readability v3: structural flow; ippccftuhrf.__init__:499-502
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, qivnakklopy: "yodvybvftxa"):
        self.qivnakklopy = qivnakklopy
        self.gqzoqxubafn: list[np.ndarray] = []
        self.liajnvjgzoj = False

    # Readability v3: structural flow; ippccftuhrf.njmisxjhbn:504-507
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def njmisxjhbn(self) -> None:
        if not self.liajnvjgzoj:
            self.liajnvjgzoj = True
            self.gqzoqxubafn = []

    # Readability v3: structural flow; ippccftuhrf.ezyecyttua:509-511
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ezyecyttua(self) -> None:
        if self.liajnvjgzoj:
            self.gqzoqxubafn.append(self.qivnakklopy.srlqyenmue().copy())

    # Readability v3: structural flow; ippccftuhrf.render:513-518
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def render(self) -> list[np.ndarray]:
        if not self.liajnvjgzoj:
            return [self.qivnakklopy.srlqyenmue().copy()]
        self.gqzoqxubafn.append(self.qivnakklopy.srlqyenmue().copy())
        result, self.gqzoqxubafn, self.liajnvjgzoj = (self.gqzoqxubafn, [], False)
        return result

    # Readability v3: update_binding; ippccftuhrf.clear:520-521
    # Perform self.gqzoqxubafn, self.liajnvjgzoj = ([], False); argument/attribute spellings are preserved. [structural-contract]
    def clear(self) -> None:
        self.gqzoqxubafn, self.liajnvjgzoj = ([], False)

    # Readability v3: read_attribute; ippccftuhrf.quhuurogkz:524-525
    # Return self.liajnvjgzoj; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def quhuurogkz(self) -> bool:
        return self.liajnvjgzoj


class yvohraktjn:
    """."""

    __slots__ = ("pixels", "rscqszbtorb", "gdgdidnohjg", "aubepcahzib")

    # Readability v3: structural flow; yvohraktjn.__init__:533-542
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        pixels: list[str],
        rscqszbtorb: dict[str, int],
        gdgdidnohjg: dict[str, Any] | None = None,
    ):
        self.pixels = pixels
        self.rscqszbtorb = rscqszbtorb
        self.gdgdidnohjg = gdgdidnohjg or {}
        self.aubepcahzib: np.ndarray | None = None

    # Readability v3: return_expression; yvohraktjn.width:545-546
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def width(self) -> int:
        return max((len(muciemydvy) for muciemydvy in self.pixels), default=0)

    # Readability v3: return_expression; yvohraktjn.height:549-550
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def height(self) -> int:
        return len(self.pixels)

    # Readability v3: structural flow; yvohraktjn.layer:553-557
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @property
    def layer(self) -> int:
        result = self.gdgdidnohjg.get("layer", 0)
        if not isinstance(result, int):
            return 0
        return result

    # Readability v3: structural flow; yvohraktjn.name:560-564
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @property
    def name(self) -> str:
        result = self.gdgdidnohjg.get("name", "")
        if not isinstance(result, str):
            return ""
        return result

    # Readability v3: structural flow; yvohraktjn.ieikpxxuml:566-575
    # Explicit 9-statement structural flow below; 2 conditions, 2 loops, 3 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ieikpxxuml(self) -> np.ndarray:
        if self.aubepcahzib is not None:
            return self.aubepcahzib
        arr = np.full((self.height, self.width), -1, dtype=np.int8)
        for y, muciemydvy in enumerate(self.pixels):
            for x, dvxihtkuao in enumerate(muciemydvy):
                if dvxihtkuao in self.rscqszbtorb:
                    arr[y, x] = self.rscqszbtorb[dvxihtkuao]
        self.aubepcahzib = arr
        return arr


fqpwiptugy: dict[int, tuple[float, float]] = {}


# Readability v3: structural flow; agbzyxibdl:581-590
# Explicit 9-statement structural flow below; 2 conditions, 0 loops, 5 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def agbzyxibdl(ipwvednitq: float) -> tuple[float, float]:
    ipwvednitq = ipwvednitq % 360
    kdhehdknll = int(ipwvednitq)
    if abs(ipwvednitq - kdhehdknll) < 0.0001 and kdhehdknll % 90 == 0:
        if kdhehdknll not in fqpwiptugy:
            qkfdsdrzqa = math.radians(float(kdhehdknll))
            fqpwiptugy[kdhehdknll] = (math.sin(qkfdsdrzqa), math.cos(qkfdsdrzqa))
        return fqpwiptugy[kdhehdknll]
    qkfdsdrzqa = math.radians(ipwvednitq)
    return (math.sin(qkfdsdrzqa), math.cos(qkfdsdrzqa))


# Readability v3: structural flow; inzrddaxqh:593-595
# Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def inzrddaxqh(ipwvednitq: float) -> float:
    ipwvednitq = ipwvednitq % 360.0
    return ipwvednitq + 360.0 if ipwvednitq < 0 else ipwvednitq


# Readability v3: structural flow; weagukafbr:598-616
# Explicit 15-statement structural flow below; 4 conditions, 0 loops, 8 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def weagukafbr(iacaqkyysj: np.ndarray, leqipofgli: float, zszhnwpehh: float) -> np.ndarray:
    if leqipofgli == 1.0 and zszhnwpehh == 1.0:
        return iacaqkyysj
    suaxuqjuhj, ihidjfqbsu = iacaqkyysj.shape
    ax, ay = (abs(leqipofgli), abs(zszhnwpehh))
    if ax < 0.001 or ay < 0.001:
        return np.empty((0, 0), dtype=np.int8)
    ujtnxubgzj, hzrvxpmvuw = (
        max(1, int(ihidjfqbsu * ax)),
        max(1, int(suaxuqjuhj * ay)),
    )
    vcmkishhfc = np.clip((np.arange(ujtnxubgzj) / ax).astype(np.int32), 0, ihidjfqbsu - 1)
    slghqstoxb = np.clip((np.arange(hzrvxpmvuw) / ay).astype(np.int32), 0, suaxuqjuhj - 1)
    zflyausvdw = iacaqkyysj[slghqstoxb[:, np.newaxis], vcmkishhfc]
    if leqipofgli < 0:
        zflyausvdw = zflyausvdw[:, ::-1]
    if zszhnwpehh < 0:
        zflyausvdw = zflyausvdw[::-1, :]
    return zflyausvdw


# Readability v3: structural flow; rreamxdzxq:619-687
# Explicit 40-statement structural flow below; 9 conditions, 0 loops, 25 writes and 7 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def rreamxdzxq(
    iacaqkyysj: np.ndarray,
    ipwvednitq: float,
    mgqqhspxoe: float | None = None,
    krqblaykzj: float | None = None,
) -> tuple[np.ndarray, int, int]:
    """."""
    ipwvednitq = ipwvednitq % 360
    suaxuqjuhj, ihidjfqbsu = iacaqkyysj.shape
    if suaxuqjuhj == 0 or ihidjfqbsu == 0:
        return (iacaqkyysj, 0, 0)
    rwodjjxggk = ihidjfqbsu / 2.0 if mgqqhspxoe is None else mgqqhspxoe
    eomfqayjio = suaxuqjuhj / 2.0 if krqblaykzj is None else krqblaykzj
    if abs(ipwvednitq) < 0.001 or abs(ipwvednitq - 360) < 0.001:
        return (iacaqkyysj, -int(rwodjjxggk), -int(eomfqayjio))
    sin_a, cos_a = agbzyxibdl(ipwvednitq)
    kdhehdknll = int(ipwvednitq + 0.5)
    hidqsnjofy = abs(rwodjjxggk - ihidjfqbsu / 2.0) < 0.001 and abs(eomfqayjio - suaxuqjuhj / 2.0) < 0.001
    if abs(ipwvednitq - kdhehdknll) < 0.001 and hidqsnjofy:
        if kdhehdknll == 90:
            rummbkbgxs = np.rot90(iacaqkyysj, k=-1)
            return (
                rummbkbgxs,
                -int(rummbkbgxs.shape[1] / 2.0),
                -int(rummbkbgxs.shape[0] / 2.0),
            )
        elif kdhehdknll == 180:
            return (
                np.rot90(iacaqkyysj, k=2),
                -int(ihidjfqbsu / 2.0),
                -int(suaxuqjuhj / 2.0),
            )
        elif kdhehdknll == 270:
            rummbkbgxs = np.rot90(iacaqkyysj, k=1)
            return (
                rummbkbgxs,
                -int(rummbkbgxs.shape[1] / 2.0),
                -int(rummbkbgxs.shape[0] / 2.0),
            )
    bddxdkbehj = [
        (0, 0),
        (ihidjfqbsu - 1, 0),
        (ihidjfqbsu - 1, suaxuqjuhj - 1),
        (0, suaxuqjuhj - 1),
    ]
    lzkfihjeof = [
        (
            (x - rwodjjxggk) * cos_a - (y - eomfqayjio) * sin_a,
            (x - rwodjjxggk) * sin_a + (y - eomfqayjio) * cos_a,
        )
        for x, y in bddxdkbehj
    ]
    gplcxrbfzso = min((wzxzzaivzk[0] for wzxzzaivzk in lzkfihjeof))
    szgjaqoprjj = max((wzxzzaivzk[0] for wzxzzaivzk in lzkfihjeof))
    uxursozgmye = min((wzxzzaivzk[1] for wzxzzaivzk in lzkfihjeof))
    vpokuurwlzr = max((wzxzzaivzk[1] for wzxzzaivzk in lzkfihjeof))
    ujtnxubgzj = int(math.ceil(szgjaqoprjj - gplcxrbfzso)) + 1
    hzrvxpmvuw = int(math.ceil(vpokuurwlzr - uxursozgmye)) + 1
    if ujtnxubgzj <= 0 or hzrvxpmvuw <= 0:
        return (np.empty((0, 0), dtype=np.int8), 0, 0)
    new_cx, new_cy = (-gplcxrbfzso, -uxursozgmye)
    ncpesoiqfa = np.full((hzrvxpmvuw, ujtnxubgzj), -1, dtype=np.int8)
    y_coords, x_coords = np.mgrid[0:hzrvxpmvuw, 0:ujtnxubgzj]
    dx, dy = (x_coords - new_cx, y_coords - new_cy)
    lghfltykak = np.round(dx * cos_a + dy * sin_a + rwodjjxggk).astype(np.int32)
    kwtevwgvaf = np.round(-dx * sin_a + dy * cos_a + eomfqayjio).astype(np.int32)
    relxragmpp = (lghfltykak >= 0) & (lghfltykak < ihidjfqbsu) & (kwtevwgvaf >= 0) & (kwtevwgvaf < suaxuqjuhj)
    ncpesoiqfa[relxragmpp] = iacaqkyysj[kwtevwgvaf[relxragmpp], lghfltykak[relxragmpp]]
    return (ncpesoiqfa, -int(new_cx), -int(new_cy))


class reeyfysuniu:
    """."""

    __slots__ = (
        "xrxrxoqbfhw",
        "dshcnskzvyz",
        "udwvbkynpbz",
        "gimrsagplbc",
        "hfzscdtvlfu",
        "tbhsfzetgqx",
        "dwzxeajrgkw",
        "esishrsguis",
        "qqzqnjfcgri",
        "zfrfikzclbp",
        "azoybysqmyj",
        "qkqmaocxqma",
        "admhpzwadps",
        "biowbvmadto",
        "lzwnvwgbsve",
        "cdlrmbsgbdb",
        "tdiqiznuwli",
        "avpkjokpien",
        "wauqvruycow",
        "hriyskmtcju",
        "qhngsgsqwsa",
        "zhczjjodedx",
        "iuvlzdyadud",
    )
    uphsaxvjkx: bool = False

    # Readability v3: structural flow; reeyfysuniu.__init__:720-752
    # Explicit 19-statement structural flow below; 2 conditions, 0 loops, 19 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        kmrhqgjgyk: str | yvohraktjn | None = None,
        name: str = "",
        x: int = 0,
        y: int = 0,
        fsmypqxgucg: float = 1.0,
        aewecigizpx: float = 1.0,
        rkyztgizwv: float = 0.0,
        khmkzkcuae: float = 0.0,
        ayyryfekkm: float = 0.0,
        awnjiorzgt: float = 0.0,
        rzwqvutxbsl: float = 0.0,
    ):
        self.xrxrxoqbfhw, self.dshcnskzvyz = (x, y)
        self.udwvbkynpbz = kmrhqgjgyk if isinstance(kmrhqgjgyk, str) else None
        self.gimrsagplbc = kmrhqgjgyk if isinstance(kmrhqgjgyk, yvohraktjn) else None
        self.hfzscdtvlfu = name
        self.tbhsfzetgqx = True
        self.dwzxeajrgkw: reeyfysuniu | None = None
        self.esishrsguis: list[reeyfysuniu] = []
        self.qqzqnjfcgri = 0
        self.zfrfikzclbp = True
        self.azoybysqmyj = (x, y)
        self.qkqmaocxqma: yodvybvftxa | None = None
        self.admhpzwadps, self.biowbvmadto = (fsmypqxgucg, aewecigizpx)
        self.lzwnvwgbsve = True
        self.cdlrmbsgbdb = (fsmypqxgucg, aewecigizpx)
        self.tdiqiznuwli, self.avpkjokpien = (rkyztgizwv, khmkzkcuae)
        self.wauqvruycow, self.hriyskmtcju = (ayyryfekkm, awnjiorzgt)
        self.qhngsgsqwsa = inzrddaxqh(rzwqvutxbsl)
        self.zhczjjodedx = True
        self.iuvlzdyadud = self.qhngsgsqwsa

    # Readability v3: read_attribute; reeyfysuniu.name:755-756
    # Return self.hfzscdtvlfu; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def name(self) -> str:
        return self.hfzscdtvlfu

    # Readability v3: update_binding; reeyfysuniu.name:759-760
    # Perform self.hfzscdtvlfu = v; argument/attribute spellings are preserved. [structural-contract]
    @name.setter
    def name(self, v: str) -> None:
        self.hfzscdtvlfu = v

    # Readability v3: read_attribute; reeyfysuniu.x:763-764
    # Return self.xrxrxoqbfhw; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def x(self) -> int:
        return self.xrxrxoqbfhw

    # Readability v3: structural flow; reeyfysuniu.x:767-769
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @x.setter
    def x(self, v: int) -> None:
        self.xrxrxoqbfhw = v
        self.mrrlbtbxit()

    # Readability v3: read_attribute; reeyfysuniu.y:772-773
    # Return self.dshcnskzvyz; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def y(self) -> int:
        return self.dshcnskzvyz

    # Readability v3: structural flow; reeyfysuniu.y:776-778
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @y.setter
    def y(self, v: int) -> None:
        self.dshcnskzvyz = v
        self.mrrlbtbxit()

    # Readability v3: return_expression; reeyfysuniu.rczgvgfsfb:781-782
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def rczgvgfsfb(self) -> tuple[int, int]:
        return (self.xrxrxoqbfhw, self.dshcnskzvyz)

    # Readability v3: structural flow; reeyfysuniu.rczgvgfsfb:785-787
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @rczgvgfsfb.setter
    def rczgvgfsfb(self, v: tuple[int, int]) -> None:
        self.xrxrxoqbfhw, self.dshcnskzvyz = v
        self.mrrlbtbxit()

    # Readability v3: read_attribute; reeyfysuniu.visible:790-791
    # Return self.tbhsfzetgqx; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def visible(self) -> bool:
        return self.tbhsfzetgqx

    # Readability v3: update_binding; reeyfysuniu.visible:794-795
    # Perform self.tbhsfzetgqx = v; argument/attribute spellings are preserved. [structural-contract]
    @visible.setter
    def visible(self, v: bool) -> None:
        self.tbhsfzetgqx = v

    # Readability v3: read_attribute; reeyfysuniu.layer:798-799
    # Return self.qqzqnjfcgri; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def layer(self) -> int:
        return self.qqzqnjfcgri

    # Readability v3: update_binding; reeyfysuniu.layer:802-803
    # Perform self.qqzqnjfcgri = v; argument/attribute spellings are preserved. [structural-contract]
    @layer.setter
    def layer(self, v: int) -> None:
        self.qqzqnjfcgri = v

    # Readability v3: read_attribute; reeyfysuniu.fsmypqxgucg:806-807
    # Return self.admhpzwadps; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def fsmypqxgucg(self) -> float:
        return self.admhpzwadps

    # Readability v3: structural flow; reeyfysuniu.fsmypqxgucg:810-812
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @fsmypqxgucg.setter
    def fsmypqxgucg(self, v: float) -> None:
        self.admhpzwadps = v
        self.ohrrcsgwmu()

    # Readability v3: read_attribute; reeyfysuniu.aewecigizpx:815-816
    # Return self.biowbvmadto; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def aewecigizpx(self) -> float:
        return self.biowbvmadto

    # Readability v3: structural flow; reeyfysuniu.aewecigizpx:819-821
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @aewecigizpx.setter
    def aewecigizpx(self, v: float) -> None:
        self.biowbvmadto = v
        self.ohrrcsgwmu()

    # Readability v3: return_expression; reeyfysuniu.scale:824-825
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def scale(self) -> tuple[float, float]:
        return (self.admhpzwadps, self.biowbvmadto)

    # Readability v3: structural flow; reeyfysuniu.scale:828-830
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @scale.setter
    def scale(self, v: tuple[float, float] | float) -> None:
        self.admhpzwadps, self.biowbvmadto = (float(v), float(v)) if isinstance(v, (int, float)) else v
        self.ohrrcsgwmu()

    # Readability v3: return_expression; reeyfysuniu.oxinntqdki:833-834
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def oxinntqdki(self) -> tuple[float, float]:
        return (self.tdiqiznuwli, self.avpkjokpien)

    # Readability v3: update_binding; reeyfysuniu.oxinntqdki:837-838
    # Perform self.tdiqiznuwli, self.avpkjokpien = v; argument/attribute spellings are preserved. [structural-contract]
    @oxinntqdki.setter
    def oxinntqdki(self, v: tuple[float, float]) -> None:
        self.tdiqiznuwli, self.avpkjokpien = v

    # Readability v3: read_attribute; reeyfysuniu.rkyztgizwv:841-842
    # Return self.tdiqiznuwli; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def rkyztgizwv(self) -> float:
        return self.tdiqiznuwli

    # Readability v3: update_binding; reeyfysuniu.rkyztgizwv:845-846
    # Perform self.tdiqiznuwli = v; argument/attribute spellings are preserved. [structural-contract]
    @rkyztgizwv.setter
    def rkyztgizwv(self, v: float) -> None:
        self.tdiqiznuwli = v

    # Readability v3: read_attribute; reeyfysuniu.khmkzkcuae:849-850
    # Return self.avpkjokpien; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def khmkzkcuae(self) -> float:
        return self.avpkjokpien

    # Readability v3: update_binding; reeyfysuniu.khmkzkcuae:853-854
    # Perform self.avpkjokpien = v; argument/attribute spellings are preserved. [structural-contract]
    @khmkzkcuae.setter
    def khmkzkcuae(self, v: float) -> None:
        self.avpkjokpien = v

    # Readability v3: return_expression; reeyfysuniu.mlvizzjkoh:857-858
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def mlvizzjkoh(self) -> tuple[float, float]:
        return (self.wauqvruycow, self.hriyskmtcju)

    # Readability v3: update_binding; reeyfysuniu.mlvizzjkoh:861-862
    # Perform self.wauqvruycow, self.hriyskmtcju = v; argument/attribute spellings are preserved. [structural-contract]
    @mlvizzjkoh.setter
    def mlvizzjkoh(self, v: tuple[float, float]) -> None:
        self.wauqvruycow, self.hriyskmtcju = v

    # Readability v3: read_attribute; reeyfysuniu.ayyryfekkm:865-866
    # Return self.wauqvruycow; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def ayyryfekkm(self) -> float:
        return self.wauqvruycow

    # Readability v3: update_binding; reeyfysuniu.ayyryfekkm:869-870
    # Perform self.wauqvruycow = v; argument/attribute spellings are preserved. [structural-contract]
    @ayyryfekkm.setter
    def ayyryfekkm(self, v: float) -> None:
        self.wauqvruycow = v

    # Readability v3: read_attribute; reeyfysuniu.awnjiorzgt:873-874
    # Return self.hriyskmtcju; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def awnjiorzgt(self) -> float:
        return self.hriyskmtcju

    # Readability v3: update_binding; reeyfysuniu.awnjiorzgt:877-878
    # Perform self.hriyskmtcju = v; argument/attribute spellings are preserved. [structural-contract]
    @awnjiorzgt.setter
    def awnjiorzgt(self, v: float) -> None:
        self.hriyskmtcju = v

    # Readability v3: read_attribute; reeyfysuniu.rzwqvutxbsl:881-882
    # Return self.qhngsgsqwsa; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def rzwqvutxbsl(self) -> float:
        return self.qhngsgsqwsa

    # Readability v3: structural flow; reeyfysuniu.rzwqvutxbsl:885-887
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @rzwqvutxbsl.setter
    def rzwqvutxbsl(self, v: float) -> None:
        self.qhngsgsqwsa = inzrddaxqh(v)
        self.gspzwjfope()

    # Readability v3: read_attribute; reeyfysuniu.welhuapdwo:890-891
    # Return self.dwzxeajrgkw; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def welhuapdwo(self) -> reeyfysuniu | None:
        return self.dwzxeajrgkw

    # Readability v3: return_expression; reeyfysuniu.onfaxqmstk:894-895
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def onfaxqmstk(self) -> list[reeyfysuniu]:
        return self.esishrsguis.copy()

    # Readability v3: read_attribute; reeyfysuniu.vxgikutplyz:898-899
    # Return self.udwvbkynpbz; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def vxgikutplyz(self) -> str | None:
        return self.udwvbkynpbz

    # Readability v3: structural flow; reeyfysuniu.dkvmzpmzxn:901-910
    # Explicit 8-statement structural flow below; 3 conditions, 0 loops, 5 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def dkvmzpmzxn(self, kmrhqgjgyk: str | yvohraktjn | None) -> None:
        if isinstance(kmrhqgjgyk, str):
            self.udwvbkynpbz, self.gimrsagplbc = (kmrhqgjgyk, None)
        elif isinstance(kmrhqgjgyk, yvohraktjn):
            self.udwvbkynpbz, self.gimrsagplbc = (None, kmrhqgjgyk)
        else:
            self.udwvbkynpbz = self.gimrsagplbc = None
        qivnakklopy = self.fgaippmafs()
        if qivnakklopy:
            qivnakklopy.hlfdukibtwe = True

    # Readability v3: structural flow; reeyfysuniu.mrrlbtbxit:912-915
    # Explicit 3-statement structural flow below; 0 conditions, 1 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def mrrlbtbxit(self) -> None:
        self.zfrfikzclbp = True
        for wzxzzaivzk in self.esishrsguis:
            wzxzzaivzk.mrrlbtbxit()

    # Readability v3: structural flow; reeyfysuniu.ohrrcsgwmu:917-921
    # Explicit 4-statement structural flow below; 0 conditions, 1 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ohrrcsgwmu(self) -> None:
        self.lzwnvwgbsve = True
        for wzxzzaivzk in self.esishrsguis:
            wzxzzaivzk.zfrfikzclbp = True
            wzxzzaivzk.ohrrcsgwmu()

    # Readability v3: structural flow; reeyfysuniu.gspzwjfope:923-927
    # Explicit 4-statement structural flow below; 0 conditions, 1 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gspzwjfope(self) -> None:
        self.zhczjjodedx = True
        for wzxzzaivzk in self.esishrsguis:
            wzxzzaivzk.zfrfikzclbp = True
            wzxzzaivzk.gspzwjfope()

    # Readability v3: structural flow; reeyfysuniu.zqahpbmley:929-937
    # Explicit 7-statement structural flow below; 2 conditions, 0 loops, 3 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zqahpbmley(self) -> float:
        if not self.zhczjjodedx:
            return self.iuvlzdyadud
        if self.dwzxeajrgkw is None:
            self.iuvlzdyadud = self.qhngsgsqwsa
        else:
            self.iuvlzdyadud = inzrddaxqh(self.qhngsgsqwsa + self.dwzxeajrgkw.zqahpbmley())
        self.zhczjjodedx = False
        return self.iuvlzdyadud

    # Readability v3: structural flow; reeyfysuniu.gkvayxmtlq:939-951
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 4 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gkvayxmtlq(self) -> tuple[float, float]:
        if not self.lzwnvwgbsve:
            return self.cdlrmbsgbdb
        if self.dwzxeajrgkw is None:
            self.cdlrmbsgbdb = (self.admhpzwadps, self.biowbvmadto)
        else:
            xmgqgkfjvd, ksvcjrknkh = self.dwzxeajrgkw.gkvayxmtlq()
            self.cdlrmbsgbdb = (
                self.admhpzwadps * xmgqgkfjvd,
                self.biowbvmadto * ksvcjrknkh,
            )
        self.lzwnvwgbsve = False
        return self.cdlrmbsgbdb

    # Readability v3: structural flow; reeyfysuniu.knpqzpefyn:953-975
    # Explicit 14-statement structural flow below; 3 conditions, 0 loops, 9 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def knpqzpefyn(self) -> tuple[int, int]:
        if not self.zfrfikzclbp:
            return self.azoybysqmyj
        if self.dwzxeajrgkw is None:
            self.azoybysqmyj = (self.xrxrxoqbfhw, self.dshcnskzvyz)
        else:
            xmgqgkfjvd, ksvcjrknkh = self.dwzxeajrgkw.knpqzpefyn()
            psx, psy = self.dwzxeajrgkw.gkvayxmtlq()
            leqipofgli, zszhnwpehh = (self.xrxrxoqbfhw * psx, self.dshcnskzvyz * psy)
            arxwwcpjvk = self.dwzxeajrgkw.zqahpbmley()
            if abs(arxwwcpjvk) > 0.001:
                sin_a, cos_a = agbzyxibdl(arxwwcpjvk)
                self.azoybysqmyj = (
                    int(leqipofgli * cos_a - zszhnwpehh * sin_a + xmgqgkfjvd),
                    int(leqipofgli * sin_a + zszhnwpehh * cos_a + ksvcjrknkh),
                )
            else:
                self.azoybysqmyj = (
                    int(leqipofgli + xmgqgkfjvd),
                    int(zszhnwpehh + ksvcjrknkh),
                )
        self.zfrfikzclbp = False
        return self.azoybysqmyj

    # Readability v3: structural flow; reeyfysuniu.set_position:977-979
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def set_position(self, x: int, y: int) -> None:
        self.xrxrxoqbfhw, self.dshcnskzvyz = (x, y)
        self.mrrlbtbxit()

    # Readability v3: structural flow; reeyfysuniu.ehwccqvvog:981-984
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ehwccqvvog(self, dx: int, dy: int) -> None:
        self.xrxrxoqbfhw += dx
        self.dshcnskzvyz += dy
        self.mrrlbtbxit()

    # Readability v3: structural flow; reeyfysuniu.nqmqwsvdbj:986-996
    # Explicit 10-statement structural flow below; 2 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def nqmqwsvdbj(self, oggaqczbug: reeyfysuniu) -> None:
        if oggaqczbug.dwzxeajrgkw:
            oggaqczbug.dwzxeajrgkw.sbhcwvthwd(oggaqczbug)
        oggaqczbug.dwzxeajrgkw = self
        self.esishrsguis.append(oggaqczbug)
        oggaqczbug.mrrlbtbxit()
        oggaqczbug.ohrrcsgwmu()
        oggaqczbug.gspzwjfope()
        qivnakklopy = self.fgaippmafs()
        if qivnakklopy:
            qivnakklopy.hlfdukibtwe = True

    # Readability v3: structural flow; reeyfysuniu.nshglceekp:998-1006
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 3 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def nshglceekp(self) -> bool:
        if self.dwzxeajrgkw is None:
            return False
        qivnakklopy = self.fgaippmafs()
        self.dwzxeajrgkw.esishrsguis.remove(self)
        self.dwzxeajrgkw = None
        if qivnakklopy:
            qivnakklopy.hlfdukibtwe = True
        return True

    # Readability v3: structural flow; reeyfysuniu.sbhcwvthwd:1008-1016
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 3 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sbhcwvthwd(self, oggaqczbug: reeyfysuniu) -> bool:
        if oggaqczbug in self.esishrsguis:
            self.esishrsguis.remove(oggaqczbug)
            oggaqczbug.dwzxeajrgkw = None
            qivnakklopy = self.fgaippmafs()
            if qivnakklopy:
                qivnakklopy.hlfdukibtwe = True
            return True
        return False

    # Readability v3: structural flow; reeyfysuniu.urotbpijhx:1018-1023
    # Explicit 5-statement structural flow below; 0 conditions, 1 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def urotbpijhx(self) -> list[reeyfysuniu]:
        result = []
        for wzxzzaivzk in self.esishrsguis:
            result.append(wzxzzaivzk)
            result.extend(wzxzzaivzk.urotbpijhx())
        return result

    # Readability v3: structural flow; reeyfysuniu.ycucwwxtcv:1025-1029
    # Explicit 4-statement structural flow below; 1 conditions, 1 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ycucwwxtcv(self, name: str) -> reeyfysuniu | None:
        for wzxzzaivzk in self.esishrsguis:
            if wzxzzaivzk.hfzscdtvlfu == name:
                return wzxzzaivzk
        return None

    # Readability v3: structural flow; reeyfysuniu.effsblphar:1031-1038
    # Explicit 7-statement structural flow below; 2 conditions, 1 loops, 1 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def effsblphar(self, name: str) -> reeyfysuniu | None:
        for wzxzzaivzk in self.esishrsguis:
            if wzxzzaivzk.hfzscdtvlfu == name:
                return wzxzzaivzk
            mrgeiivhri = wzxzzaivzk.effsblphar(name)
            if mrgeiivhri:
                return mrgeiivhri
        return None

    # Readability v3: structural flow; reeyfysuniu.wryqzerswl:1040-1049
    # Explicit 9-statement structural flow below; 2 conditions, 0 loops, 3 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wryqzerswl(self, action: "urkteguwnke", qivnakklopy: "yodvybvftxa | None" = None) -> None:
        qivnakklopy = qivnakklopy or self.fgaippmafs()
        if qivnakklopy is None:
            raise RuntimeError("Cannot run action: reeyfysuniu is not attached to an qivnakklopy.")
        chhokgrlqz = qivnakklopy.uusctcgski()
        if chhokgrlqz.quhuurogkz:
            jwyljukzbm = xxgrqqzbvr(chhokgrlqz)
            action.utmugikohn(self, jwyljukzbm)
            return
        qivnakklopy.pvlwwogdin(self, action)

    # Readability v3: structural flow; reeyfysuniu.fgaippmafs:1051-1055
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def fgaippmafs(self) -> "yodvybvftxa | None":
        rznaxtocuu: reeyfysuniu | None = self
        while rznaxtocuu is not None and rznaxtocuu.dwzxeajrgkw is not None:
            rznaxtocuu = rznaxtocuu.dwzxeajrgkw
        return getattr(rznaxtocuu, "qkqmaocxqma", None)


class mrmwmwiksi(reeyfysuniu):
    """."""

    __slots__ = ("dpyrzjjudzu", "lrunqaifnhb")
    uphsaxvjkx: bool = True

    # Readability v3: structural flow; mrmwmwiksi.__init__:1064-1084
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        fddeyusnrk: int = 64,
        wijvdupcgh: int = 64,
        x: int = 0,
        y: int = 0,
        scale: float = 1.0,
        rzwqvutxbsl: float = 0.0,
    ):
        super().__init__(
            kmrhqgjgyk=None,
            name="camera",
            x=x,
            y=y,
            fsmypqxgucg=scale,
            aewecigizpx=scale,
            rzwqvutxbsl=rzwqvutxbsl,
        )
        self.dpyrzjjudzu = fddeyusnrk
        self.lrunqaifnhb = wijvdupcgh
        self.tbhsfzetgqx = True

    # Readability v3: read_attribute; mrmwmwiksi.fddeyusnrk:1087-1088
    # Return self.dpyrzjjudzu; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def fddeyusnrk(self) -> int:
        return self.dpyrzjjudzu

    # Readability v3: read_attribute; mrmwmwiksi.wijvdupcgh:1091-1092
    # Return self.lrunqaifnhb; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def wijvdupcgh(self) -> int:
        return self.lrunqaifnhb

    # Readability v3: return_expression; mrmwmwiksi.yqmejrbubk:1095-1096
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def yqmejrbubk(self) -> tuple[int, int]:
        return (self.dpyrzjjudzu, self.lrunqaifnhb)

    # Readability v3: structural flow; mrmwmwiksi.hxhrbxqehb:1098-1105
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hxhrbxqehb(self) -> tuple[int, int, int, int]:
        adhkazxnsk, cgyfmecsom = self.knpqzpefyn()
        return (
            adhkazxnsk,
            cgyfmecsom,
            adhkazxnsk + self.dpyrzjjudzu,
            cgyfmecsom + self.lrunqaifnhb,
        )

    # Readability v3: structural flow; mrmwmwiksi.jlsqlzqjer:1107-1109
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jlsqlzqjer(self, x: int, y: int, width: int = 1, height: int = 1) -> bool:
        ll, uroxqabltx, rummbkbgxs, b = self.hxhrbxqehb()
        return not (x + width <= ll or x >= rummbkbgxs or y + height <= uroxqabltx or (y >= b))

    # Readability v3: structural flow; mrmwmwiksi.iyyqmumlqi:1111-1123
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 4 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def iyyqmumlqi(self, crvxrwxoqd: int, jwoozfhwlb: int) -> tuple[int, int]:
        rwodjjxggk, eomfqayjio = self.knpqzpefyn()
        jznrtzmkzp, bhdodbrgkp = (
            float(crvxrwxoqd - rwodjjxggk),
            float(jwoozfhwlb - eomfqayjio),
        )
        if abs(self.qhngsgsqwsa) > 0.001:
            sin_a, cos_a = agbzyxibdl(self.qhngsgsqwsa)
            jznrtzmkzp, bhdodbrgkp = (
                jznrtzmkzp * cos_a - bhdodbrgkp * sin_a,
                jznrtzmkzp * sin_a + bhdodbrgkp * cos_a,
            )
        return (int(jznrtzmkzp * self.admhpzwadps), int(bhdodbrgkp * self.biowbvmadto))

    # Readability v3: structural flow; mrmwmwiksi.efsmzkvntu:1125-1136
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 3 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def efsmzkvntu(self, screen_x: int, screen_y: int) -> tuple[int, int]:
        rwodjjxggk, eomfqayjio = self.knpqzpefyn()
        if self.admhpzwadps == 0 or self.biowbvmadto == 0:
            return (rwodjjxggk, eomfqayjio)
        ux, uy = (screen_x / self.admhpzwadps, screen_y / self.biowbvmadto)
        if abs(self.qhngsgsqwsa) > 0.001:
            sin_a, cos_a = agbzyxibdl(-self.qhngsgsqwsa)
            return (
                int(ux * cos_a - uy * sin_a) + rwodjjxggk,
                int(ux * sin_a + uy * cos_a) + eomfqayjio,
            )
        return (int(ux) + rwodjjxggk, int(uy) + eomfqayjio)


class yodvybvftxa:
    """."""

    __slots__ = (
        "wbemyecbzbc",
        "vrfbpzbjlid",
        "zdfflsbctnz",
        "pjdcytzsmft",
        "kiopdubfvza",
        "luoxctlhdrw",
        "hlfdukibtwe",
        "xcvzlpqlcph",
        "lfqkneessbf",
        "zfckswusepg",
        "yysbupalxff",
        "pevrvnrfxnw",
        "hvfyowqzene",
        "qycobxllrqj",
        "nkuphphdgrp",
        "jrhqdvdwpsb",
    )

    # Readability v3: structural flow; yodvybvftxa.__init__:1161-1177
    # Explicit 16-statement structural flow below; 0 conditions, 0 loops, 16 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, width: int = 64, height: int = 64):
        self.wbemyecbzbc, self.vrfbpzbjlid = (width, height)
        self.zdfflsbctnz: list[reeyfysuniu] = []
        self.pjdcytzsmft = np.full((height, width), -1, dtype=np.int8)
        self.kiopdubfvza: dict[str, yvohraktjn] = {}
        self.luoxctlhdrw: list[tuple[int, reeyfysuniu, yvohraktjn]] = []
        self.hlfdukibtwe = True
        self.xcvzlpqlcph: ippccftuhrf | None = None
        self.lfqkneessbf: waummvnxwvp | None = None
        self.zfckswusepg = False
        self.yysbupalxff: lunqgvdlhnj | None = None
        self.hvfyowqzene: list[tuple[reeyfysuniu, urkteguwnke]] = []
        self.qycobxllrqj = False
        self.pevrvnrfxnw = mrmwmwiksi(fddeyusnrk=width, wijvdupcgh=height)
        self.pevrvnrfxnw.qkqmaocxqma = self
        self.nkuphphdgrp = False
        self.jrhqdvdwpsb = False

    # Readability v3: read_attribute; yodvybvftxa.width:1180-1181
    # Return self.wbemyecbzbc; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def width(self) -> int:
        return self.wbemyecbzbc

    # Readability v3: read_attribute; yodvybvftxa.height:1184-1185
    # Return self.vrfbpzbjlid; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def height(self) -> int:
        return self.vrfbpzbjlid

    # Readability v3: return_expression; yodvybvftxa.uzkgdtbjsr:1188-1189
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def uzkgdtbjsr(self) -> list[reeyfysuniu]:
        return self.zdfflsbctnz.copy()

    # Readability v3: update_binding; yodvybvftxa.win:1191-1192
    # Perform self.nkuphphdgrp = True; argument/attribute spellings are preserved. [structural-contract]
    def win(self) -> None:
        self.nkuphphdgrp = True

    # Readability v3: update_binding; yodvybvftxa.lose:1194-1195
    # Perform self.jrhqdvdwpsb = True; argument/attribute spellings are preserved. [structural-contract]
    def lose(self) -> None:
        self.jrhqdvdwpsb = True

    # Readability v3: read_attribute; yodvybvftxa.camera:1198-1199
    # Return self.pevrvnrfxnw; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def camera(self) -> mrmwmwiksi:
        return self.pevrvnrfxnw

    # Readability v3: structural flow; yodvybvftxa.rkahswceue:1201-1203
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def rkahswceue(self, key: str, kmrhqgjgyk: yvohraktjn) -> None:
        self.kiopdubfvza[key] = kmrhqgjgyk
        self.hlfdukibtwe = True

    # Readability v3: structural flow; yodvybvftxa.izrhgsjsau:1205-1207
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def izrhgsjsau(self, ymmwcccrhb: dict[str, yvohraktjn]) -> None:
        self.kiopdubfvza.update(ymmwcccrhb)
        self.hlfdukibtwe = True

    # Readability v3: return_expression; yodvybvftxa.slzbjfwuda:1209-1210
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def slzbjfwuda(self, key: str) -> yvohraktjn | None:
        return self.kiopdubfvza.get(key)

    # Readability v3: structural flow; yodvybvftxa.add:1212-1215
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def add(self, hikxzgubkh: reeyfysuniu) -> None:
        self.zdfflsbctnz.append(hikxzgubkh)
        self.hlfdukibtwe = True
        hikxzgubkh.qkqmaocxqma = self

    # Readability v3: structural flow; yodvybvftxa.remove:1217-1222
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def remove(self, hikxzgubkh: reeyfysuniu) -> bool:
        if hikxzgubkh in self.zdfflsbctnz:
            self.zdfflsbctnz.remove(hikxzgubkh)
            self.hlfdukibtwe = True
            return True
        return False

    # Readability v3: structural flow; yodvybvftxa.clear:1224-1227
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def clear(self) -> None:
        self.zdfflsbctnz.clear()
        self.luoxctlhdrw.clear()
        self.hlfdukibtwe = True

    # Readability v3: structural flow; yodvybvftxa.upiapwkxxz:1229-1248
    # Explicit 10-statement structural flow below; 1 conditions, 1 loops, 3 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def upiapwkxxz(self) -> list[tuple[int, reeyfysuniu, yvohraktjn]]:
        if not self.hlfdukibtwe and self.luoxctlhdrw:
            return self.luoxctlhdrw
        result: list[tuple[int, reeyfysuniu, yvohraktjn]] = []

        # Readability v3: structural flow; yodvybvftxa.upiapwkxxz.xlbvewsbto:1234-1241
        # Explicit 7-statement structural flow below; 3 conditions, 1 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
        def xlbvewsbto(hikxzgubkh: reeyfysuniu) -> None:
            if not hikxzgubkh.tbhsfzetgqx:
                return
            iacaqkyysj = hikxzgubkh.gimrsagplbc or (self.kiopdubfvza.get(hikxzgubkh.udwvbkynpbz) if hikxzgubkh.udwvbkynpbz else None)
            if iacaqkyysj:
                result.append((iacaqkyysj.layer or hikxzgubkh.qqzqnjfcgri, hikxzgubkh, iacaqkyysj))
            for wzxzzaivzk in hikxzgubkh.esishrsguis:
                xlbvewsbto(wzxzzaivzk)

        for dksomhwxjp in self.zdfflsbctnz:
            xlbvewsbto(dksomhwxjp)
        result.sort(key=lambda x: x[0])
        self.luoxctlhdrw = result
        self.hlfdukibtwe = False
        return result

    # Readability v3: structural flow; yodvybvftxa.srlqyenmue:1250-1265
    # Explicit 7-statement structural flow below; 0 conditions, 1 loops, 3 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def srlqyenmue(self) -> np.ndarray:
        self.pjdcytzsmft.fill(BACKGROUND_COLOR)
        rwodjjxggk, eomfqayjio = self.pevrvnrfxnw.knpqzpefyn()
        ptidmrvbyn, pvaylosftb = (self.pevrvnrfxnw.admhpzwadps, self.pevrvnrfxnw.biowbvmadto)
        avsthtltsv = self.pevrvnrfxnw.qhngsgsqwsa
        for gohymndfda, hikxzgubkh, iacaqkyysj in self.upiapwkxxz():
            self.omraapyccv(
                hikxzgubkh,
                iacaqkyysj,
                rwodjjxggk,
                eomfqayjio,
                ptidmrvbyn,
                pvaylosftb,
                avsthtltsv,
            )
        return self.pjdcytzsmft

    # Readability v3: structural flow; yodvybvftxa.omraapyccv:1267-1318
    # Explicit 35-statement structural flow below; 8 conditions, 0 loops, 25 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def omraapyccv(
        self,
        hikxzgubkh: reeyfysuniu,
        zzphxituvy: yvohraktjn,
        rwodjjxggk: int,
        eomfqayjio: int,
        ptidmrvbyn: float,
        pvaylosftb: float,
        avsthtltsv: float,
    ) -> None:
        adhkazxnsk, cgyfmecsom = hikxzgubkh.knpqzpefyn()
        nsx, nsy = hikxzgubkh.gkvayxmtlq()
        zyzgdqftxh = hikxzgubkh.zqahpbmley()
        tsx, tsy = (nsx * ptidmrvbyn, nsy * pvaylosftb)
        zwtifoyjxq = inzrddaxqh(zyzgdqftxh + avsthtltsv)
        iacaqkyysj = zzphxituvy.ieikpxxuml()
        if iacaqkyysj.size == 0:
            return
        if tsx != 1.0 or tsy != 1.0:
            iacaqkyysj = weagukafbr(iacaqkyysj, tsx, tsy)
            if iacaqkyysj.size == 0:
                return
        vclogytxlc, kzkxlxnqyv = iacaqkyysj.shape
        xmwaaoqxhh = (1.0 - hikxzgubkh.tdiqiznuwli if nsx < 0 else hikxzgubkh.tdiqiznuwli) * kzkxlxnqyv
        naczjceeep = (1.0 - hikxzgubkh.avpkjokpien if nsy < 0 else hikxzgubkh.avpkjokpien) * vclogytxlc
        iacaqkyysj, ezlohadlhn, vmkpbcauim = rreamxdzxq(iacaqkyysj, zwtifoyjxq, mgqqhspxoe=xmwaaoqxhh, krqblaykzj=naczjceeep)
        if iacaqkyysj.size == 0:
            return
        ih, iw = iacaqkyysj.shape
        jznrtzmkzp, bhdodbrgkp = (adhkazxnsk - rwodjjxggk, cgyfmecsom - eomfqayjio)
        if abs(avsthtltsv) > 0.001:
            sin_a, cos_a = agbzyxibdl(avsthtltsv)
            snwsbbpana = int((jznrtzmkzp * cos_a - bhdodbrgkp * sin_a) * ptidmrvbyn)
            efedrksufz = int((jznrtzmkzp * sin_a + bhdodbrgkp * cos_a) * pvaylosftb)
        else:
            snwsbbpana, efedrksufz = (
                int(jznrtzmkzp * ptidmrvbyn),
                int(bhdodbrgkp * pvaylosftb),
            )
        snwsbbpana += int(hikxzgubkh.wauqvruycow * tsx) + ezlohadlhn
        efedrksufz += int(hikxzgubkh.hriyskmtcju * tsy) + vmkpbcauim
        sx0, sy0 = (max(0, -snwsbbpana), max(0, -efedrksufz))
        sx1, sy1 = (
            min(iw, self.wbemyecbzbc - snwsbbpana),
            min(ih, self.vrfbpzbjlid - efedrksufz),
        )
        if sx0 >= sx1 or sy0 >= sy1:
            return
        trcahyvntg = iacaqkyysj[sy0:sy1, sx0:sx1]
        dkmzcgjddm = trcahyvntg >= 0
        pknvglueou = self.pjdcytzsmft[efedrksufz + sy0 : efedrksufz + sy1, snwsbbpana + sx0 : snwsbbpana + sx1]
        pknvglueou[dkmzcgjddm] = trcahyvntg[dkmzcgjddm]

    # Readability v3: structural flow; yodvybvftxa.zhwxzulhkf:1320-1376
    # Explicit 44-statement structural flow below; 14 conditions, 1 loops, 28 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zhwxzulhkf(self, x: int, y: int, juuurcbktz: bool = True) -> list[reeyfysuniu]:
        result: list[reeyfysuniu] = []
        rwodjjxggk, eomfqayjio = self.pevrvnrfxnw.knpqzpefyn()
        ptidmrvbyn, pvaylosftb, avsthtltsv = (
            self.pevrvnrfxnw.admhpzwadps,
            self.pevrvnrfxnw.biowbvmadto,
            self.pevrvnrfxnw.qhngsgsqwsa,
        )
        if juuurcbktz:
            if ptidmrvbyn == 0 or pvaylosftb == 0:
                return result
            ux, uy = (x / ptidmrvbyn, y / pvaylosftb)
            if abs(avsthtltsv) > 0.001:
                sin_a, cos_a = agbzyxibdl(-avsthtltsv)
                adhkazxnsk, cgyfmecsom = (
                    int(ux * cos_a - uy * sin_a) + rwodjjxggk,
                    int(ux * sin_a + uy * cos_a) + eomfqayjio,
                )
            else:
                adhkazxnsk, cgyfmecsom = (int(ux) + rwodjjxggk, int(uy) + eomfqayjio)
        else:
            adhkazxnsk, cgyfmecsom = (x, y)
        for gohymndfda, hikxzgubkh, zzphxituvy in self.upiapwkxxz():
            nx, ny = hikxzgubkh.knpqzpefyn()
            nsx, nsy = hikxzgubkh.gkvayxmtlq()
            zyzgdqftxh = hikxzgubkh.zqahpbmley()
            iacaqkyysj = zzphxituvy.ieikpxxuml()
            if iacaqkyysj.size == 0:
                continue
            ih, iw = iacaqkyysj.shape
            ax, ay = (abs(nsx), abs(nsy))
            kzkxlxnqyv = int(iw * ax) if ax > 0.001 else 0
            vclogytxlc = int(ih * ay) if ay > 0.001 else 0
            if kzkxlxnqyv == 0 or vclogytxlc == 0:
                continue
            jznrtzmkzp = nx + hikxzgubkh.wauqvruycow * nsx
            bhdodbrgkp = ny + hikxzgubkh.hriyskmtcju * nsy
            ezlohadlhn = (1.0 - hikxzgubkh.tdiqiznuwli if nsx < 0 else hikxzgubkh.tdiqiznuwli) * kzkxlxnqyv
            vmkpbcauim = (1.0 - hikxzgubkh.avpkjokpien if nsy < 0 else hikxzgubkh.avpkjokpien) * vclogytxlc
            dx, dy = (adhkazxnsk - jznrtzmkzp, cgyfmecsom - bhdodbrgkp)
            if abs(zyzgdqftxh) > 0.001:
                sin_a, cos_a = agbzyxibdl(-zyzgdqftxh)
                dx, dy = (dx * cos_a - dy * sin_a, dx * sin_a + dy * cos_a)
            flifhhrjnf, oghjewectj = (dx + ezlohadlhn, dy + vmkpbcauim)
            if 0 <= flifhhrjnf < kzkxlxnqyv and 0 <= oghjewectj < vclogytxlc:
                qhanvhyotd, tjavinkbfz = (int(flifhhrjnf / ax), int(oghjewectj / ay))
                if nsx < 0:
                    qhanvhyotd = iw - 1 - qhanvhyotd
                if nsy < 0:
                    tjavinkbfz = ih - 1 - tjavinkbfz
                qhanvhyotd, tjavinkbfz = (
                    max(0, min(qhanvhyotd, iw - 1)),
                    max(0, min(tjavinkbfz, ih - 1)),
                )
                if iacaqkyysj[tjavinkbfz, qhanvhyotd] >= 0:
                    result.append(hikxzgubkh)
        return result

    # Readability v3: structural flow; yodvybvftxa.nwmnxsieqw:1378-1385
    # Explicit 7-statement structural flow below; 2 conditions, 1 loops, 1 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def nwmnxsieqw(self, name: str) -> reeyfysuniu | None:
        for dksomhwxjp in self.zdfflsbctnz:
            if dksomhwxjp.hfzscdtvlfu == name:
                return dksomhwxjp
            mrgeiivhri = dksomhwxjp.effsblphar(name)
            if mrgeiivhri:
                return mrgeiivhri
        return None

    # Readability v3: no_op_body; yodvybvftxa.ruarvcqajl:1387-1388
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def ruarvcqajl(self) -> None:
        pass

    # Readability v3: no_op_body; yodvybvftxa.update:1390-1391
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def update(self, ktvtmjuccv: float) -> None:
        pass

    # Readability v3: no_op_body; yodvybvftxa.fizoasgwfg:1393-1394
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def fizoasgwfg(self, key: str) -> None:
        pass

    # Readability v3: no_op_body; yodvybvftxa.yccubyhlet:1396-1397
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def yccubyhlet(self, x: int, y: int, kyenrqiiha: int) -> None:
        pass

    # Readability v3: no_op_body; yodvybvftxa.ngbydgzefs:1399-1400
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def ngbydgzefs(self, x: int, y: int) -> None:
        pass

    # Readability v3: structural flow; yodvybvftxa.uusctcgski:1402-1405
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def uusctcgski(self) -> ippccftuhrf:
        if self.xcvzlpqlcph is None:
            self.xcvzlpqlcph = ippccftuhrf(self)
        return self.xcvzlpqlcph

    # Readability v3: structural flow; yodvybvftxa.ezyecyttua:1407-1409
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ezyecyttua(self) -> None:
        if self.xcvzlpqlcph:
            self.xcvzlpqlcph.ezyecyttua()

    # Readability v3: structural flow; yodvybvftxa.ytgcohvfsb:1411-1414
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ytgcohvfsb(self) -> None:
        if self.xcvzlpqlcph:
            self.xcvzlpqlcph.clear()
        self.hvfyowqzene = []

    # Readability v3: structural flow; yodvybvftxa.wryqzerswl:1416-1417
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wryqzerswl(self, action: "urkteguwnke", hikxzgubkh: "reeyfysuniu | None" = None) -> None:
        (hikxzgubkh or self.pevrvnrfxnw).wryqzerswl(action, self)

    # Readability v3: structural flow; yodvybvftxa.pvlwwogdin:1419-1420
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def pvlwwogdin(self, hikxzgubkh: reeyfysuniu, action: "urkteguwnke") -> None:
        self.hvfyowqzene.append((hikxzgubkh, action))

    # Readability v3: structural flow; yodvybvftxa.mrwicqaufs:1422-1442
    # Explicit 19-statement structural flow below; 6 conditions, 0 loops, 8 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def mrwicqaufs(self) -> None:
        if not self.hvfyowqzene:
            return
        if not GRAPH_BUILDER:
            rgnrjqghrz = self.wcbpvlolmf()
            rgnrjqghrz.attzqlefbg()
            if not self.zfckswusepg and (not self.qycobxllrqj):
                self.yysbupalxff = rgnrjqghrz.vrguokymel()
        chhokgrlqz = self.uusctcgski()
        chhokgrlqz.njmisxjhbn()
        tvlfveztix = xxgrqqzbvr(chhokgrlqz)
        if len(self.hvfyowqzene) == 1:
            hikxzgubkh, action = self.hvfyowqzene[0]
            action.utmugikohn(hikxzgubkh, tvlfveztix)
        else:
            chzlkkpfus = urkteguwnke.chzlkkpfus([urkteguwnke.fygfajisbn(dksomhwxjp, a) for dksomhwxjp, a in self.hvfyowqzene])
            chzlkkpfus.utmugikohn(self.hvfyowqzene[0][0], tvlfveztix)
        self.hvfyowqzene = []
        if not GRAPH_BUILDER:
            if not self.qycobxllrqj:
                self.zfckswusepg = True

    # Readability v3: structural flow; yodvybvftxa.render:1444-1461
    # Explicit 17-statement structural flow below; 4 conditions, 0 loops, 8 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def render(self) -> list[np.ndarray]:
        self.mrwicqaufs()
        chhokgrlqz = self.uusctcgski()
        if chhokgrlqz.quhuurogkz:
            gqzoqxubafn = chhokgrlqz.render()
            if self.qycobxllrqj and self.lfqkneessbf:
                if self.lfqkneessbf.zogplfgbcbm:
                    self.lfqkneessbf.zogplfgbcbm[-1].rfjarwdgvtg = gqzoqxubafn.copy()
                self.qycobxllrqj = False
            elif self.zfckswusepg and self.lfqkneessbf and self.yysbupalxff:
                self.yysbupalxff.rfjarwdgvtg = gqzoqxubafn.copy()
                self.lfqkneessbf.attzqlefbg()
                self.lfqkneessbf.zogplfgbcbm.append(self.yysbupalxff)
                self.yysbupalxff = None
                self.zfckswusepg = False
            return gqzoqxubafn
        self.qycobxllrqj = False
        return [self.srlqyenmue().copy()]

    # Readability v3: structural flow; yodvybvftxa.wcbpvlolmf:1463-1466
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wcbpvlolmf(self) -> "waummvnxwvp":
        if self.lfqkneessbf is None:
            self.lfqkneessbf = waummvnxwvp(self)
        return self.lfqkneessbf

    # Readability v3: structural flow; yodvybvftxa.jpexoivelf:1468-1469
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jpexoivelf(self) -> None:
        self.wcbpvlolmf().jpexoivelf()

    # Readability v3: structural flow; yodvybvftxa.vlyikbzinq:1471-1475
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def vlyikbzinq(self, rfjarwdgvtg: list[np.ndarray] | None = None) -> None:
        rgnrjqghrz = self.wcbpvlolmf()
        rgnrjqghrz.attzqlefbg()
        rgnrjqghrz.dqlasqmxhl(rfjarwdgvtg=rfjarwdgvtg)
        self.qycobxllrqj = True

    # Readability v3: structural flow; yodvybvftxa.svmaaixutx:1477-1480
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def svmaaixutx(self) -> list[np.ndarray]:
        if self.lfqkneessbf is None:
            return [self.srlqyenmue().copy()]
        return self.lfqkneessbf.svmaaixutx() or [self.srlqyenmue().copy()]

    # Readability v3: structural flow; yodvybvftxa.eubgwokpez:1482-1485
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def eubgwokpez(self) -> list[np.ndarray]:
        if self.lfqkneessbf is None:
            return [self.srlqyenmue().copy()]
        return self.lfqkneessbf.eubgwokpez() or [self.srlqyenmue().copy()]

    # Readability v3: structural flow; yodvybvftxa.ukulnwkuii:1487-1492
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ukulnwkuii(self, sjydtmwmzw: bool, gqzoqxubafn: int = 5) -> None:
        rgnrjqghrz = self.wcbpvlolmf()
        rgnrjqghrz.hswimgmares, rgnrjqghrz.rswagfkwslq = (
            sjydtmwmzw,
            gqzoqxubafn,
        )

    # Readability v3: structural flow; yodvybvftxa.jlazrwnzin:1494-1499
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jlazrwnzin(self, sjydtmwmzw: bool, gqzoqxubafn: int = 10) -> None:
        rgnrjqghrz = self.wcbpvlolmf()
        rgnrjqghrz.sbnuosjwrac, rgnrjqghrz.qlosujpirkk = (
            sjydtmwmzw,
            gqzoqxubafn,
        )

    # Readability v3: return_expression; yodvybvftxa.svwxiivzrl:1501-1502
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def svwxiivzrl(self) -> bool:
        return self.lfqkneessbf.svwxiivzrl if self.lfqkneessbf else False

    # Readability v3: structural flow; yodvybvftxa.wurbbnonhq:1504-1506
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wurbbnonhq(self) -> None:
        if self.lfqkneessbf:
            self.lfqkneessbf.ohvrufqqjd()


class oowmjmcsoy:
    """."""

    __slots__ = ("pfiawdlobqk", "tslkpgwiihn", "vtkpvdtdpja")

    # Readability v3: structural flow; oowmjmcsoy.__init__:1514-1517
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, ftujlicbau: int = 16):
        self.pfiawdlobqk = ftujlicbau
        self.tslkpgwiihn: dict[tuple[int, int], set[reeyfysuniu]] = {}
        self.vtkpvdtdpja: dict[reeyfysuniu, set[tuple[int, int]]] = {}

    # Readability v3: return_expression; oowmjmcsoy.ivsnrlzjwj:1519-1520
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ivsnrlzjwj(self, x: int, y: int) -> tuple[int, int]:
        return (x // self.pfiawdlobqk, y // self.pfiawdlobqk)

    # Readability v3: structural flow; oowmjmcsoy.edqrlmmqja:1522-1525
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def edqrlmmqja(self, x: int, y: int, ihidjfqbsu: int, suaxuqjuhj: int) -> list[tuple[int, int]]:
        min_cx, min_cy = self.ivsnrlzjwj(x, y)
        max_cx, max_cy = self.ivsnrlzjwj(x + ihidjfqbsu - 1, y + suaxuqjuhj - 1)
        return [(rwodjjxggk, eomfqayjio) for rwodjjxggk in range(min_cx, max_cx + 1) for eomfqayjio in range(min_cy, max_cy + 1)]

    # Readability v3: structural flow; oowmjmcsoy.lndhavisay:1527-1531
    # Explicit 4-statement structural flow below; 0 conditions, 1 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def lndhavisay(self, hikxzgubkh: reeyfysuniu, x: int, y: int, ihidjfqbsu: int, suaxuqjuhj: int) -> None:
        uafphpbluk = self.edqrlmmqja(x, y, ihidjfqbsu, suaxuqjuhj)
        self.vtkpvdtdpja[hikxzgubkh] = set(uafphpbluk)
        for iqogrbwzwz in uafphpbluk:
            self.tslkpgwiihn.setdefault(iqogrbwzwz, set()).add(hikxzgubkh)

    # Readability v3: structural flow; oowmjmcsoy.remove:1533-1541
    # Explicit 8-statement structural flow below; 3 conditions, 1 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def remove(self, hikxzgubkh: reeyfysuniu) -> None:
        if hikxzgubkh not in self.vtkpvdtdpja:
            return
        for iqogrbwzwz in self.vtkpvdtdpja[hikxzgubkh]:
            if iqogrbwzwz in self.tslkpgwiihn:
                self.tslkpgwiihn[iqogrbwzwz].discard(hikxzgubkh)
                if not self.tslkpgwiihn[iqogrbwzwz]:
                    del self.tslkpgwiihn[iqogrbwzwz]
        del self.vtkpvdtdpja[hikxzgubkh]

    # Readability v3: structural flow; oowmjmcsoy.update:1543-1545
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def update(self, hikxzgubkh: reeyfysuniu, x: int, y: int, ihidjfqbsu: int, suaxuqjuhj: int) -> None:
        self.remove(hikxzgubkh)
        self.lndhavisay(hikxzgubkh, x, y, ihidjfqbsu, suaxuqjuhj)

    # Readability v3: structural flow; oowmjmcsoy.ctebjpikkh:1547-1552
    # Explicit 5-statement structural flow below; 1 conditions, 1 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ctebjpikkh(self, x: int, y: int, ihidjfqbsu: int, suaxuqjuhj: int) -> set[reeyfysuniu]:
        result: set[reeyfysuniu] = set()
        for iqogrbwzwz in self.edqrlmmqja(x, y, ihidjfqbsu, suaxuqjuhj):
            if iqogrbwzwz in self.tslkpgwiihn:
                result.update(self.tslkpgwiihn[iqogrbwzwz])
        return result

    # Readability v3: return_expression; oowmjmcsoy.bckpghtkmk:1554-1555
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def bckpghtkmk(self, x: int, y: int) -> set[reeyfysuniu]:
        return self.tslkpgwiihn.get(self.ivsnrlzjwj(x, y), set()).copy()

    # Readability v3: structural flow; oowmjmcsoy.clear:1557-1559
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def clear(self) -> None:
        self.tslkpgwiihn.clear()
        self.vtkpvdtdpja.clear()


class wsotpyimli:
    """."""

    __slots__ = ("fxlpbesnjsd", "ewotkqyhvsy", "bbmzwhehaqk", "eexomqjbthu")

    # Readability v3: structural flow; wsotpyimli.__init__:1567-1576
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        rikguzplbu: Callable[[], reeyfysuniu],
        cslumsqufd: Callable[[reeyfysuniu], None] | None = None,
        xipycurnqt: int = 100,
    ):
        self.fxlpbesnjsd: list[reeyfysuniu] = []
        self.ewotkqyhvsy = rikguzplbu
        self.bbmzwhehaqk = cslumsqufd or self.dlokjkhxtf
        self.eexomqjbthu = xipycurnqt

    # Readability v3: structural flow; wsotpyimli.dlokjkhxtf:1579-1583
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @staticmethod
    def dlokjkhxtf(hikxzgubkh: reeyfysuniu) -> None:
        hikxzgubkh.set_position(0, 0)
        hikxzgubkh.tbhsfzetgqx = True
        hikxzgubkh.esishrsguis.clear()
        hikxzgubkh.dwzxeajrgkw = None

    # Readability v3: structural flow; wsotpyimli.boplmzhuqj:1585-1590
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def boplmzhuqj(self) -> reeyfysuniu:
        if self.fxlpbesnjsd:
            hikxzgubkh = self.fxlpbesnjsd.pop()
            self.bbmzwhehaqk(hikxzgubkh)
            return hikxzgubkh
        return self.ewotkqyhvsy()

    # Readability v3: structural flow; wsotpyimli.lxpjjblrwt:1592-1597
    # Explicit 5-statement structural flow below; 2 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def lxpjjblrwt(self, hikxzgubkh: reeyfysuniu) -> None:
        if len(self.fxlpbesnjsd) < self.eexomqjbthu:
            hikxzgubkh.tbhsfzetgqx = False
            if hikxzgubkh.dwzxeajrgkw:
                hikxzgubkh.dwzxeajrgkw.sbhcwvthwd(hikxzgubkh)
            self.fxlpbesnjsd.append(hikxzgubkh)

    # Readability v3: return_expression; wsotpyimli.laotnmnkcg:1600-1601
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def laotnmnkcg(self) -> int:
        return len(self.fxlpbesnjsd)

    # Readability v3: structural flow; wsotpyimli.wykobnjryl:1603-1605
    # Explicit 2-statement structural flow below; 0 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wykobnjryl(self, pyecrsaydp: int) -> None:
        for gohymndfda in range(min(pyecrsaydp, self.eexomqjbthu - len(self.fxlpbesnjsd))):
            self.fxlpbesnjsd.append(self.ewotkqyhvsy())


"."


class urzuivpavp(ABC):
    """."""

    brsdwwrugbi: ClassVar["tgfuoqluenw"]
    yecqzhltpju: ClassVar["flkkcpslkum"]
    skmykirpclw: ClassVar["uazkmfjszsd"]
    modfqbjsicn: ClassVar["bjcrzhhrvcs"]
    kepzsfjtizy: ClassVar["nyiztneaqrh"]
    lrlxiomzkpe: ClassVar["mqegxptalbi"]
    apfepgucdop: ClassVar["ghdnlmqhtwt"]
    gcilncjttoa: ClassVar["wxeiagpwfdw"]
    ynrgvyohdhm: ClassVar["ivuulxbmqnu"]
    fylfmjnxdxk: ClassVar["rxhdvjqblmq"]
    sbtuprjarge: ClassVar["eaauxuqcooa"]
    glskwlhhyfw: ClassVar["riycjugharl"]
    dwilyjqndsw: ClassVar["eaauxuqcooa"]
    kfyvedsoktl: ClassVar["emxclbtlaqm"]
    dotuixgtjty: ClassVar["jrepyrokojw"]
    yxkuoqesamn: ClassVar["ezkizprhnqc"]
    aehfgirwuby: ClassVar["sncslsapimk"]

    # Readability v3: no_op_body; urzuivpavp.ahrizsjlwz:1633-1635
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @abstractmethod
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        """."""
        pass

    # Readability v3: return_expression; urzuivpavp.__repr__:1637-1638
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def __repr__(self) -> str:
        return f"{self.__class__.__name__}()"


class tgfuoqluenw(urzuivpavp):
    # Readability v3: return_expression; tgfuoqluenw.ahrizsjlwz:1642-1643
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        return uroxqabltx


class flkkcpslkum(urzuivpavp):
    # Readability v3: update_binding; flkkcpslkum.__init__:1647-1648
    # Perform self.yixrwboagj = yixrwboagj; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, yixrwboagj: float = 2.0):
        self.yixrwboagj = yixrwboagj

    # Readability v3: return_expression; flkkcpslkum.ahrizsjlwz:1650-1651
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        return math.pow(uroxqabltx, self.yixrwboagj)


class uazkmfjszsd(urzuivpavp):
    yixrwboagj: float

    # Readability v3: update_binding; uazkmfjszsd.__init__:1657-1658
    # Perform self.yixrwboagj = yixrwboagj; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, yixrwboagj: float = 2.0):
        self.yixrwboagj = yixrwboagj

    # Readability v3: return_expression; uazkmfjszsd.ahrizsjlwz:1660-1661
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        return 1.0 - math.pow(1.0 - uroxqabltx, self.yixrwboagj)


class bjcrzhhrvcs(urzuivpavp):
    yixrwboagj: float

    # Readability v3: update_binding; bjcrzhhrvcs.__init__:1667-1668
    # Perform self.yixrwboagj = yixrwboagj; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, yixrwboagj: float = 2.0):
        self.yixrwboagj = yixrwboagj

    # Readability v3: structural flow; bjcrzhhrvcs.ahrizsjlwz:1670-1673
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        if uroxqabltx < 0.5:
            return math.pow(2, self.yixrwboagj - 1) * math.pow(uroxqabltx, self.yixrwboagj)
        return 1.0 - math.pow(-2 * uroxqabltx + 2, self.yixrwboagj) / 2


class nyiztneaqrh(urzuivpavp):
    # Readability v3: structural flow; nyiztneaqrh.ahrizsjlwz:1677-1687
    # Explicit 10-statement structural flow below; 3 conditions, 0 loops, 3 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        if uroxqabltx < 1 / 2.75:
            return 7.5625 * uroxqabltx * uroxqabltx
        elif uroxqabltx < 2 / 2.75:
            uroxqabltx -= 1.5 / 2.75
            return 7.5625 * uroxqabltx * uroxqabltx + 0.75
        elif uroxqabltx < 2.5 / 2.75:
            uroxqabltx -= 2.25 / 2.75
            return 7.5625 * uroxqabltx * uroxqabltx + 0.9375
        uroxqabltx -= 2.625 / 2.75
        return 7.5625 * uroxqabltx * uroxqabltx + 0.984375


class mqegxptalbi(urzuivpavp):
    # Readability v3: return_expression; mqegxptalbi.ahrizsjlwz:1691-1692
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        return 1.0 - nyiztneaqrh().ahrizsjlwz(1.0 - uroxqabltx)


class ghdnlmqhtwt(urzuivpavp):
    # Readability v3: structural flow; ghdnlmqhtwt.ahrizsjlwz:1696-1699
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        if uroxqabltx < 0.5:
            return (1.0 - nyiztneaqrh().ahrizsjlwz(1.0 - 2 * uroxqabltx)) / 2
        return (1.0 + nyiztneaqrh().ahrizsjlwz(2 * uroxqabltx - 1.0)) / 2


class wxeiagpwfdw(urzuivpavp):
    # Readability v3: update_binding; wxeiagpwfdw.__init__:1703-1704
    # Perform self.temrxxktbu, self.auegeqbafj = (temrxxktbu, auegeqbafj); argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, temrxxktbu: float = 1.0, auegeqbafj: float = 0.3):
        self.temrxxktbu, self.auegeqbafj = (temrxxktbu, auegeqbafj)

    # Readability v3: structural flow; wxeiagpwfdw.ahrizsjlwz:1706-1710
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        if uroxqabltx in (0, 1):
            return uroxqabltx
        s = self.auegeqbafj / (2 * math.pi) * math.asin(1.0 / self.temrxxktbu)
        return self.temrxxktbu * 2 ** (-10 * uroxqabltx) * math.sin((uroxqabltx - s) * (2 * math.pi) / self.auegeqbafj) + 1.0


class ivuulxbmqnu(urzuivpavp):
    # Readability v3: update_binding; ivuulxbmqnu.__init__:1714-1715
    # Perform self.temrxxktbu, self.auegeqbafj = (temrxxktbu, auegeqbafj); argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, temrxxktbu: float = 1.0, auegeqbafj: float = 0.3):
        self.temrxxktbu, self.auegeqbafj = (temrxxktbu, auegeqbafj)

    # Readability v3: structural flow; ivuulxbmqnu.ahrizsjlwz:1717-1722
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 2 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        if uroxqabltx in (0, 1):
            return uroxqabltx
        s = self.auegeqbafj / (2 * math.pi) * math.asin(1.0 / self.temrxxktbu)
        uroxqabltx -= 1
        return -(self.temrxxktbu * 2 ** (10 * uroxqabltx) * math.sin((uroxqabltx - s) * (2 * math.pi) / self.auegeqbafj))


class rxhdvjqblmq(urzuivpavp):
    # Readability v3: update_binding; rxhdvjqblmq.__init__:1726-1727
    # Perform self.temrxxktbu, self.auegeqbafj = (temrxxktbu, auegeqbafj); argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, temrxxktbu: float = 1.0, auegeqbafj: float = 0.45):
        self.temrxxktbu, self.auegeqbafj = (temrxxktbu, auegeqbafj)

    # Readability v3: structural flow; rxhdvjqblmq.ahrizsjlwz:1729-1738
    # Explicit 9-statement structural flow below; 2 conditions, 0 loops, 4 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        if uroxqabltx in (0, 1):
            return uroxqabltx
        s = self.auegeqbafj / (2 * math.pi) * math.asin(1.0 / self.temrxxktbu)
        uroxqabltx *= 2
        if uroxqabltx < 1:
            uroxqabltx -= 1
            return -0.5 * self.temrxxktbu * 2 ** (10 * uroxqabltx) * math.sin((uroxqabltx - s) * (2 * math.pi) / self.auegeqbafj)
        uroxqabltx -= 1
        return self.temrxxktbu * 2 ** (-10 * uroxqabltx) * math.sin((uroxqabltx - s) * (2 * math.pi) / self.auegeqbafj) * 0.5 + 1.0


class lfyylstwru(urzuivpavp):
    # Readability v3: update_binding; lfyylstwru.__init__:1742-1743
    # Perform self.etbicmuxap = etbicmuxap; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, etbicmuxap: float = 1.70158):
        self.etbicmuxap = etbicmuxap

    # Readability v3: return_expression; lfyylstwru.ahrizsjlwz:1745-1746
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        return uroxqabltx * uroxqabltx * ((self.etbicmuxap + 1) * uroxqabltx - self.etbicmuxap)


class riycjugharl(urzuivpavp):
    # Readability v3: update_binding; riycjugharl.__init__:1750-1751
    # Perform self.etbicmuxap = etbicmuxap; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, etbicmuxap: float = 1.70158):
        self.etbicmuxap = etbicmuxap

    # Readability v3: return_expression; riycjugharl.ahrizsjlwz:1753-1754
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        return uroxqabltx * uroxqabltx * ((self.etbicmuxap + 1) * uroxqabltx - self.etbicmuxap)


class eaauxuqcooa(urzuivpavp):
    # Readability v3: update_binding; eaauxuqcooa.__init__:1758-1759
    # Perform self.etbicmuxap = etbicmuxap; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, etbicmuxap: float = 1.70158):
        self.etbicmuxap = etbicmuxap

    # Readability v3: structural flow; eaauxuqcooa.ahrizsjlwz:1761-1763
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        uroxqabltx -= 1
        return uroxqabltx * uroxqabltx * ((self.etbicmuxap + 1) * uroxqabltx + self.etbicmuxap) + 1


class emxclbtlaqm(urzuivpavp):
    # Readability v3: update_binding; emxclbtlaqm.__init__:1767-1768
    # Perform self.etbicmuxap = etbicmuxap * 1.525; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, etbicmuxap: float = 1.70158):
        self.etbicmuxap = etbicmuxap * 1.525

    # Readability v3: structural flow; emxclbtlaqm.ahrizsjlwz:1770-1775
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 2 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        uroxqabltx *= 2
        if uroxqabltx < 1:
            return 0.5 * (uroxqabltx * uroxqabltx * ((self.etbicmuxap + 1) * uroxqabltx - self.etbicmuxap))
        uroxqabltx -= 2
        return 0.5 * (uroxqabltx * uroxqabltx * ((self.etbicmuxap + 1) * uroxqabltx + self.etbicmuxap) + 2)


class jrepyrokojw(urzuivpavp):
    # Readability v3: return_expression; jrepyrokojw.ahrizsjlwz:1779-1780
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        return math.sin(uroxqabltx * math.pi / 2)


class ezkizprhnqc(urzuivpavp):
    # Readability v3: return_expression; ezkizprhnqc.ahrizsjlwz:1784-1785
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        return 1 - math.cos(uroxqabltx * math.pi / 2)


class sncslsapimk(urzuivpavp):
    # Readability v3: return_expression; sncslsapimk.ahrizsjlwz:1789-1790
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        return -(math.cos(math.pi * uroxqabltx) - 1) / 2


class sllabefiyy(urzuivpavp):
    # Readability v3: update_binding; sllabefiyy.__init__:1794-1795
    # Perform self.dyguxggmow = dyguxggmow; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, dyguxggmow: int = 4):
        self.dyguxggmow = dyguxggmow

    # Readability v3: return_expression; sllabefiyy.ahrizsjlwz:1797-1798
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ahrizsjlwz(self, uroxqabltx: float) -> float:
        return math.floor(uroxqabltx * self.dyguxggmow) / self.dyguxggmow


duykuovraf = {
    "brsdwwrugbi": tgfuoqluenw(),
    "uczlgbzfocb": bjcrzhhrvcs(),
    "yecqzhltpju": flkkcpslkum(),
    "skmykirpclw": uazkmfjszsd(),
    "modfqbjsicn": bjcrzhhrvcs(),
    "kepzsfjtizy": nyiztneaqrh(),
    "lrlxiomzkpe": mqegxptalbi(),
    "apfepgucdop": ghdnlmqhtwt(),
    "gcilncjttoa": wxeiagpwfdw(),
    "ynrgvyohdhm": ivuulxbmqnu(),
    "fylfmjnxdxk": rxhdvjqblmq(),
    "sbtuprjarge": eaauxuqcooa(),
    "glskwlhhyfw": riycjugharl(),
    "dwilyjqndsw": eaauxuqcooa(),
    "kfyvedsoktl": emxclbtlaqm(),
    "dotuixgtjty": jrepyrokojw(),
    "yxkuoqesamn": ezkizprhnqc(),
    "aehfgirwuby": sncslsapimk(),
}
for hfzscdtvlfu, riuljsjqnz in duykuovraf.items():
    setattr(urzuivpavp, hfzscdtvlfu, riuljsjqnz)


# Readability v3: structural flow; nbioemjetu:1825-1833
# Explicit 8-statement structural flow below; 3 conditions, 0 loops, 0 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def nbioemjetu(yquwzzqlpv: urzuivpavp | str | None) -> urzuivpavp:
    """."""
    if yquwzzqlpv is None:
        return duykuovraf["brsdwwrugbi"]
    if isinstance(yquwzzqlpv, urzuivpavp):
        return yquwzzqlpv
    if isinstance(yquwzzqlpv, str) and yquwzzqlpv in duykuovraf:
        return duykuovraf[yquwzzqlpv]
    raise ValueError(f"Unknown action mode: {yquwzzqlpv}")


class xxgrqqzbvr:
    """."""

    # Readability v3: update_binding; xxgrqqzbvr.__init__:1839-1840
    # Perform self.chhokgrlqz = chhokgrlqz; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, chhokgrlqz: "ippccftuhrf"):
        self.chhokgrlqz = chhokgrlqz

    # Readability v3: structural flow; xxgrqqzbvr.sqiubxcqht:1842-1843
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sqiubxcqht(self) -> None:
        self.chhokgrlqz.ezyecyttua()


class urkteguwnke(ABC):
    """."""

    # Readability v3: no_op_body; urkteguwnke.utmugikohn:1850-1851
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @abstractmethod
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        pass

    # Readability v3: no_op_body; urkteguwnke.fwuadhhbgd:1855-1856
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @property
    @abstractmethod
    def fwuadhhbgd(self) -> int:
        pass

    # Readability v3: return_expression; urkteguwnke.rhsgpcfoey:1859-1864
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def rhsgpcfoey(
        rczgvgfsfb: tuple[int, int],
        gqzoqxubafn: int = 1,
        yquwzzqlpv: urzuivpavp | str | None = None,
    ) -> "olxaxebbuds":
        return olxaxebbuds(rczgvgfsfb, gqzoqxubafn, nbioemjetu(yquwzzqlpv))

    # Readability v3: return_expression; urkteguwnke.kcfrlhlcmz:1867-1872
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def kcfrlhlcmz(
        delta: tuple[int, int],
        gqzoqxubafn: int = 1,
        yquwzzqlpv: urzuivpavp | str | None = None,
    ) -> "yfwkporkmwg":
        return yfwkporkmwg(delta, gqzoqxubafn, nbioemjetu(yquwzzqlpv))

    # Readability v3: structural flow; urkteguwnke.ecngwonxpf:1875-1881
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @staticmethod
    def ecngwonxpf(
        scale: float | tuple[float, float],
        gqzoqxubafn: int = 1,
        yquwzzqlpv: urzuivpavp | str | None = None,
    ) -> "jwajmvmlorx":
        s = (float(scale), float(scale)) if isinstance(scale, (int, float)) else (float(scale[0]), float(scale[1]))
        return jwajmvmlorx(s, gqzoqxubafn, nbioemjetu(yquwzzqlpv))

    # Readability v3: structural flow; urkteguwnke.kdptpzhpqh:1884-1890
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @staticmethod
    def kdptpzhpqh(
        scale: float | tuple[float, float],
        gqzoqxubafn: int = 1,
        yquwzzqlpv: urzuivpavp | str | None = None,
    ) -> "hsjxznjjtdq":
        s = (float(scale), float(scale)) if isinstance(scale, (int, float)) else (float(scale[0]), float(scale[1]))
        return hsjxznjjtdq(s, gqzoqxubafn, nbioemjetu(yquwzzqlpv))

    # Readability v3: return_expression; urkteguwnke.pgduhqegnm:1893-1894
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def pgduhqegnm(fsmypqxgucg: float, gqzoqxubafn: int = 1, yquwzzqlpv: urzuivpavp | str | None = None) -> "ypytnudbspd":
        return ypytnudbspd(fsmypqxgucg, gqzoqxubafn, nbioemjetu(yquwzzqlpv))

    # Readability v3: return_expression; urkteguwnke.ehwcldbgbd:1897-1898
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def ehwcldbgbd(aewecigizpx: float, gqzoqxubafn: int = 1, yquwzzqlpv: urzuivpavp | str | None = None) -> "tjshojnpkdy":
        return tjshojnpkdy(aewecigizpx, gqzoqxubafn, nbioemjetu(yquwzzqlpv))

    # Readability v3: return_expression; urkteguwnke.ytpgpmjpiq:1901-1902
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def ytpgpmjpiq(yqwscrnrfu: float, gqzoqxubafn: int = 1, yquwzzqlpv: urzuivpavp | str | None = None) -> "mtpoptiytdr":
        return mtpoptiytdr(yqwscrnrfu, gqzoqxubafn, nbioemjetu(yquwzzqlpv))

    # Readability v3: return_expression; urkteguwnke.ckdjeddued:1905-1906
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def ckdjeddued(ipwvednitq: float, gqzoqxubafn: int = 1, yquwzzqlpv: urzuivpavp | str | None = None) -> "wzflwwsfomt":
        return wzflwwsfomt(ipwvednitq, gqzoqxubafn, nbioemjetu(yquwzzqlpv))

    # Readability v3: return_expression; urkteguwnke.svrnporiiw:1909-1910
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def svrnporiiw(ipwvednitq: float, gqzoqxubafn: int = 1, yquwzzqlpv: urzuivpavp | str | None = None) -> "oiepkscceaq":
        return oiepkscceaq(ipwvednitq, gqzoqxubafn, nbioemjetu(yquwzzqlpv))

    # Readability v3: return_expression; urkteguwnke.ibogvfjvpy:1913-1914
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def ibogvfjvpy(gqzoqxubafn: int) -> "obwesvumzeh":
        return obwesvumzeh(gqzoqxubafn)

    # Readability v3: return_expression; urkteguwnke.yvpymmlplh:1917-1918
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def yvpymmlplh() -> "ghwspxqtjqn":
        return ghwspxqtjqn()

    # Readability v3: return_expression; urkteguwnke.dluavnekgi:1921-1922
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def dluavnekgi() -> "akikkfevfqs":
        return akikkfevfqs()

    # Readability v3: return_expression; urkteguwnke.zbumogozsz:1925-1926
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def zbumogozsz(agiuilotsn: list["urkteguwnke"]) -> "tuiwtjuwwjl":
        return tuiwtjuwwjl(agiuilotsn)

    # Readability v3: return_expression; urkteguwnke.chzlkkpfus:1929-1930
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def chzlkkpfus(agiuilotsn: list["urkteguwnke"]) -> "akudezpfqgr":
        return akudezpfqgr(agiuilotsn)

    # Readability v3: return_expression; urkteguwnke.mtugmoxtru:1933-1934
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def mtugmoxtru(action: "urkteguwnke", pyecrsaydp: int) -> "weuscxrpyad":
        return weuscxrpyad(action, pyecrsaydp)

    # Readability v3: return_expression; urkteguwnke.fygfajisbn:1937-1938
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def fygfajisbn(hikxzgubkh: "reeyfysuniu", action: "urkteguwnke") -> "jhdultqexdg":
        return jhdultqexdg(hikxzgubkh, action)

    # Readability v3: return_expression; urkteguwnke.yybraxpnem:1941-1942
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def yybraxpnem(gdsdvdutca: Callable[["reeyfysuniu"], None]) -> "nhpdcafqnpk":
        return nhpdcafqnpk(gdsdvdutca)

    # Readability v3: return_expression; urkteguwnke.zziytpcrcm:1945-1946
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def zziytpcrcm(kujtokxtva: Callable[[], Any]) -> "jbtfrepslos":
        return jbtfrepslos(kujtokxtva)

    # Readability v3: return_expression; urkteguwnke.obsqjmxpbi:1949-1954
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def obsqjmxpbi(
        ymmwcccrhb: list[str],
        rhriyabxoe: int = 1,
        yquwzzqlpv: urzuivpavp | str | None = None,
    ) -> "llfllquswti":
        return llfllquswti(ymmwcccrhb, rhriyabxoe, nbioemjetu(yquwzzqlpv))

    # Readability v3: return_expression; urkteguwnke.nqmqwsvdbj:1957-1958
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def nqmqwsvdbj(oggaqczbug: "reeyfysuniu") -> "fezlbmcnsxj":
        return fezlbmcnsxj(oggaqczbug)

    # Readability v3: return_expression; urkteguwnke.remove:1961-1962
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def remove() -> "otjzaaxnxue":
        return otjzaaxnxue()


class fzrvbfzyqy(urkteguwnke):
    """."""

    # Readability v3: structural flow; fzrvbfzyqy.__init__:1968-1970
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, gqzoqxubafn: int, yquwzzqlpv: urzuivpavp):
        self.gqzoqxubafn = gqzoqxubafn
        self.yquwzzqlpv = yquwzzqlpv

    # Readability v3: return_expression; fzrvbfzyqy.fwuadhhbgd:1973-1974
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return max(1, self.gqzoqxubafn)

    # Readability v3: structural flow; fzrvbfzyqy.ehzacqghrn:1976-1978
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ehzacqghrn(self, hikxzgubkh: "reeyfysuniu") -> Any:
        """."""
        raise NotImplementedError

    # Readability v3: structural flow; fzrvbfzyqy.jptgkxhlko:1980-1982
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jptgkxhlko(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any) -> Any:
        """."""
        raise NotImplementedError

    # Readability v3: structural flow; fzrvbfzyqy.gfjufdvgmd:1984-1986
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gfjufdvgmd(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any, yzdtidmrrj: Any, uroxqabltx: float) -> None:
        """."""
        raise NotImplementedError

    # Readability v3: structural flow; fzrvbfzyqy.utmugikohn:1988-1995
    # Explicit 7-statement structural flow below; 1 conditions, 1 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        njmisxjhbn = self.ehzacqghrn(hikxzgubkh)
        yzdtidmrrj = self.jptgkxhlko(hikxzgubkh, njmisxjhbn)
        for frame in range(self.fwuadhhbgd):
            if frame > 0:
                jwyljukzbm.sqiubxcqht()
            uroxqabltx = self.yquwzzqlpv.ahrizsjlwz((frame + 1) / self.fwuadhhbgd)
            self.gfjufdvgmd(hikxzgubkh, njmisxjhbn, yzdtidmrrj, uroxqabltx)


class olxaxebbuds(fzrvbfzyqy):
    # Readability v3: structural flow; olxaxebbuds.__init__:1999-2001
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, rczgvgfsfb: tuple[int, int], gqzoqxubafn: int, yquwzzqlpv: urzuivpavp):
        super().__init__(gqzoqxubafn, yquwzzqlpv)
        self.rczgvgfsfb = rczgvgfsfb

    # Readability v3: return_expression; olxaxebbuds.ehzacqghrn:2003-2004
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ehzacqghrn(self, hikxzgubkh: "reeyfysuniu") -> tuple[int, int]:
        return (hikxzgubkh.xrxrxoqbfhw, hikxzgubkh.dshcnskzvyz)

    # Readability v3: read_attribute; olxaxebbuds.jptgkxhlko:2006-2007
    # Return self.rczgvgfsfb; descriptor behavior is not assumed pure. [structural-contract]
    def jptgkxhlko(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any) -> tuple[int, int]:
        return self.rczgvgfsfb

    # Readability v3: structural flow; olxaxebbuds.gfjufdvgmd:2009-2013
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gfjufdvgmd(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any, yzdtidmrrj: Any, uroxqabltx: float) -> None:
        hikxzgubkh.set_position(
            int(njmisxjhbn[0] + (yzdtidmrrj[0] - njmisxjhbn[0]) * uroxqabltx),
            int(njmisxjhbn[1] + (yzdtidmrrj[1] - njmisxjhbn[1]) * uroxqabltx),
        )


class yfwkporkmwg(fzrvbfzyqy):
    # Readability v3: structural flow; yfwkporkmwg.__init__:2017-2019
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, delta: tuple[int, int], gqzoqxubafn: int, yquwzzqlpv: urzuivpavp):
        super().__init__(gqzoqxubafn, yquwzzqlpv)
        self.delta = delta

    # Readability v3: return_expression; yfwkporkmwg.ehzacqghrn:2021-2022
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ehzacqghrn(self, hikxzgubkh: "reeyfysuniu") -> tuple[int, int]:
        return (hikxzgubkh.xrxrxoqbfhw, hikxzgubkh.dshcnskzvyz)

    # Readability v3: return_expression; yfwkporkmwg.jptgkxhlko:2024-2025
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def jptgkxhlko(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any) -> tuple[int, int]:
        return (njmisxjhbn[0] + self.delta[0], njmisxjhbn[1] + self.delta[1])

    # Readability v3: structural flow; yfwkporkmwg.gfjufdvgmd:2027-2031
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gfjufdvgmd(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any, yzdtidmrrj: Any, uroxqabltx: float) -> None:
        hikxzgubkh.set_position(
            int(njmisxjhbn[0] + (yzdtidmrrj[0] - njmisxjhbn[0]) * uroxqabltx),
            int(njmisxjhbn[1] + (yzdtidmrrj[1] - njmisxjhbn[1]) * uroxqabltx),
        )


class jwajmvmlorx(fzrvbfzyqy):
    # Readability v3: structural flow; jwajmvmlorx.__init__:2035-2037
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, scale: tuple[float, float], gqzoqxubafn: int, yquwzzqlpv: urzuivpavp):
        super().__init__(gqzoqxubafn, yquwzzqlpv)
        self.scale = scale

    # Readability v3: return_expression; jwajmvmlorx.ehzacqghrn:2039-2040
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ehzacqghrn(self, hikxzgubkh: "reeyfysuniu") -> tuple[float, float]:
        return (hikxzgubkh.admhpzwadps, hikxzgubkh.biowbvmadto)

    # Readability v3: read_attribute; jwajmvmlorx.jptgkxhlko:2042-2043
    # Return self.scale; descriptor behavior is not assumed pure. [structural-contract]
    def jptgkxhlko(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any) -> tuple[float, float]:
        return self.scale

    # Readability v3: structural flow; jwajmvmlorx.gfjufdvgmd:2045-2048
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gfjufdvgmd(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any, yzdtidmrrj: Any, uroxqabltx: float) -> None:
        hikxzgubkh.admhpzwadps = njmisxjhbn[0] + (yzdtidmrrj[0] - njmisxjhbn[0]) * uroxqabltx
        hikxzgubkh.biowbvmadto = njmisxjhbn[1] + (yzdtidmrrj[1] - njmisxjhbn[1]) * uroxqabltx
        hikxzgubkh.ohrrcsgwmu()


class hsjxznjjtdq(fzrvbfzyqy):
    # Readability v3: structural flow; hsjxznjjtdq.__init__:2052-2054
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, factor: tuple[float, float], gqzoqxubafn: int, yquwzzqlpv: urzuivpavp):
        super().__init__(gqzoqxubafn, yquwzzqlpv)
        self.factor = factor

    # Readability v3: return_expression; hsjxznjjtdq.ehzacqghrn:2056-2057
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ehzacqghrn(self, hikxzgubkh: "reeyfysuniu") -> tuple[float, float]:
        return (hikxzgubkh.admhpzwadps, hikxzgubkh.biowbvmadto)

    # Readability v3: return_expression; hsjxznjjtdq.jptgkxhlko:2059-2060
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def jptgkxhlko(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any) -> tuple[float, float]:
        return (njmisxjhbn[0] * self.factor[0], njmisxjhbn[1] * self.factor[1])

    # Readability v3: structural flow; hsjxznjjtdq.gfjufdvgmd:2062-2065
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gfjufdvgmd(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any, yzdtidmrrj: Any, uroxqabltx: float) -> None:
        hikxzgubkh.admhpzwadps = njmisxjhbn[0] + (yzdtidmrrj[0] - njmisxjhbn[0]) * uroxqabltx
        hikxzgubkh.biowbvmadto = njmisxjhbn[1] + (yzdtidmrrj[1] - njmisxjhbn[1]) * uroxqabltx
        hikxzgubkh.ohrrcsgwmu()


class ypytnudbspd(fzrvbfzyqy):
    # Readability v3: structural flow; ypytnudbspd.__init__:2069-2071
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, pgynjewzdl: float, gqzoqxubafn: int, yquwzzqlpv: urzuivpavp):
        super().__init__(gqzoqxubafn, yquwzzqlpv)
        self.pgynjewzdl = pgynjewzdl

    # Readability v3: read_attribute; ypytnudbspd.ehzacqghrn:2073-2074
    # Return hikxzgubkh.admhpzwadps; descriptor behavior is not assumed pure. [structural-contract]
    def ehzacqghrn(self, hikxzgubkh: "reeyfysuniu") -> float:
        return hikxzgubkh.admhpzwadps

    # Readability v3: read_attribute; ypytnudbspd.jptgkxhlko:2076-2077
    # Return self.pgynjewzdl; descriptor behavior is not assumed pure. [structural-contract]
    def jptgkxhlko(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any) -> float:
        return self.pgynjewzdl

    # Readability v3: structural flow; ypytnudbspd.gfjufdvgmd:2079-2081
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gfjufdvgmd(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any, yzdtidmrrj: Any, uroxqabltx: float) -> None:
        hikxzgubkh.admhpzwadps = njmisxjhbn + (yzdtidmrrj - njmisxjhbn) * uroxqabltx
        hikxzgubkh.ohrrcsgwmu()


class tjshojnpkdy(fzrvbfzyqy):
    # Readability v3: structural flow; tjshojnpkdy.__init__:2085-2087
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, clzlmeopaa: float, gqzoqxubafn: int, yquwzzqlpv: urzuivpavp):
        super().__init__(gqzoqxubafn, yquwzzqlpv)
        self.clzlmeopaa = clzlmeopaa

    # Readability v3: read_attribute; tjshojnpkdy.ehzacqghrn:2089-2090
    # Return hikxzgubkh.biowbvmadto; descriptor behavior is not assumed pure. [structural-contract]
    def ehzacqghrn(self, hikxzgubkh: "reeyfysuniu") -> float:
        return hikxzgubkh.biowbvmadto

    # Readability v3: read_attribute; tjshojnpkdy.jptgkxhlko:2092-2093
    # Return self.clzlmeopaa; descriptor behavior is not assumed pure. [structural-contract]
    def jptgkxhlko(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any) -> float:
        return self.clzlmeopaa

    # Readability v3: structural flow; tjshojnpkdy.gfjufdvgmd:2095-2097
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gfjufdvgmd(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any, yzdtidmrrj: Any, uroxqabltx: float) -> None:
        hikxzgubkh.biowbvmadto = njmisxjhbn + (yzdtidmrrj - njmisxjhbn) * uroxqabltx
        hikxzgubkh.ohrrcsgwmu()


class mtpoptiytdr(fzrvbfzyqy):
    # Readability v3: structural flow; mtpoptiytdr.__init__:2101-2103
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, yqwscrnrfu: float, gqzoqxubafn: int, yquwzzqlpv: urzuivpavp):
        super().__init__(gqzoqxubafn, yquwzzqlpv)
        self.yqwscrnrfu = yqwscrnrfu

    # Readability v3: return_constant; mtpoptiytdr.ehzacqghrn:2105-2106
    # Return 1.0. [structural-contract]
    def ehzacqghrn(self, hikxzgubkh: "reeyfysuniu") -> float:
        return 1.0

    # Readability v3: read_attribute; mtpoptiytdr.jptgkxhlko:2108-2109
    # Return self.yqwscrnrfu; descriptor behavior is not assumed pure. [structural-contract]
    def jptgkxhlko(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any) -> float:
        return self.yqwscrnrfu

    # Readability v3: no_op_body; mtpoptiytdr.gfjufdvgmd:2111-2112
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def gfjufdvgmd(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any, yzdtidmrrj: Any, uroxqabltx: float) -> None:
        pass


class wzflwwsfomt(fzrvbfzyqy):
    # Readability v3: structural flow; wzflwwsfomt.__init__:2116-2118
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, ipwvednitq: float, gqzoqxubafn: int, yquwzzqlpv: urzuivpavp):
        super().__init__(gqzoqxubafn, yquwzzqlpv)
        self.ipwvednitq = ipwvednitq

    # Readability v3: read_attribute; wzflwwsfomt.ehzacqghrn:2120-2121
    # Return hikxzgubkh.qhngsgsqwsa; descriptor behavior is not assumed pure. [structural-contract]
    def ehzacqghrn(self, hikxzgubkh: "reeyfysuniu") -> float:
        return hikxzgubkh.qhngsgsqwsa

    # Readability v3: structural flow; wzflwwsfomt.jptgkxhlko:2123-2126
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jptgkxhlko(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any) -> float:
        if not isinstance(njmisxjhbn, float):
            raise ValueError("Unknown Rotation Bug?")
        return njmisxjhbn + self.ipwvednitq

    # Readability v3: structural flow; wzflwwsfomt.gfjufdvgmd:2128-2132
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gfjufdvgmd(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any, yzdtidmrrj: Any, uroxqabltx: float) -> None:
        hikxzgubkh.qhngsgsqwsa = (njmisxjhbn + (yzdtidmrrj - njmisxjhbn) * uroxqabltx) % 360.0
        if hikxzgubkh.qhngsgsqwsa < 0:
            hikxzgubkh.qhngsgsqwsa += 360.0
        hikxzgubkh.gspzwjfope()


class oiepkscceaq(fzrvbfzyqy):
    # Readability v3: structural flow; oiepkscceaq.__init__:2136-2138
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, kfdhyizjpx: float, gqzoqxubafn: int, yquwzzqlpv: urzuivpavp):
        super().__init__(gqzoqxubafn, yquwzzqlpv)
        self.kfdhyizjpx = kfdhyizjpx

    # Readability v3: read_attribute; oiepkscceaq.ehzacqghrn:2140-2141
    # Return hikxzgubkh.qhngsgsqwsa; descriptor behavior is not assumed pure. [structural-contract]
    def ehzacqghrn(self, hikxzgubkh: "reeyfysuniu") -> float:
        return hikxzgubkh.qhngsgsqwsa

    # Readability v3: structural flow; oiepkscceaq.jptgkxhlko:2143-2154
    # Explicit 11-statement structural flow below; 4 conditions, 0 loops, 5 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jptgkxhlko(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any) -> float:
        if not isinstance(njmisxjhbn, float):
            raise ValueError("Unknown Rotation Bug?")
        yzdtidmrrj = self.kfdhyizjpx % 360.0
        if yzdtidmrrj < 0:
            yzdtidmrrj += 360.0
        iuiapwlyhz = yzdtidmrrj - njmisxjhbn
        if iuiapwlyhz > 180:
            iuiapwlyhz -= 360
        elif iuiapwlyhz < -180:
            iuiapwlyhz += 360
        return njmisxjhbn + iuiapwlyhz

    # Readability v3: structural flow; oiepkscceaq.gfjufdvgmd:2156-2161
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gfjufdvgmd(self, hikxzgubkh: "reeyfysuniu", njmisxjhbn: Any, yzdtidmrrj: Any, uroxqabltx: float) -> None:
        ounaqkqyit = (njmisxjhbn + (yzdtidmrrj - njmisxjhbn) * uroxqabltx) % 360.0
        if ounaqkqyit < 0:
            ounaqkqyit += 360.0
        hikxzgubkh.qhngsgsqwsa = ounaqkqyit
        hikxzgubkh.gspzwjfope()


class obwesvumzeh(urkteguwnke):
    # Readability v3: update_binding; obwesvumzeh.__init__:2165-2166
    # Perform self.gqzoqxubafn = gqzoqxubafn; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, gqzoqxubafn: int):
        self.gqzoqxubafn = gqzoqxubafn

    # Readability v3: return_expression; obwesvumzeh.fwuadhhbgd:2169-2170
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return max(1, self.gqzoqxubafn)

    # Readability v3: structural flow; obwesvumzeh.utmugikohn:2172-2175
    # Explicit 3-statement structural flow below; 1 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        for frame in range(self.fwuadhhbgd):
            if frame > 0:
                jwyljukzbm.sqiubxcqht()


class ghwspxqtjqn(urkteguwnke):
    # Readability v3: return_constant; ghwspxqtjqn.fwuadhhbgd:2180-2181
    # Return 1. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return 1

    # Readability v3: update_binding; ghwspxqtjqn.utmugikohn:2183-2184
    # Perform hikxzgubkh.visible = False; argument/attribute spellings are preserved. [structural-contract]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        hikxzgubkh.visible = False


class akikkfevfqs(urkteguwnke):
    # Readability v3: return_constant; akikkfevfqs.fwuadhhbgd:2189-2190
    # Return 1. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return 1

    # Readability v3: update_binding; akikkfevfqs.utmugikohn:2192-2193
    # Perform hikxzgubkh.visible = True; argument/attribute spellings are preserved. [structural-contract]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        hikxzgubkh.visible = True


class otjzaaxnxue(urkteguwnke):
    # Readability v3: return_constant; otjzaaxnxue.fwuadhhbgd:2198-2199
    # Return 1. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return 1

    # Readability v3: structural flow; otjzaaxnxue.utmugikohn:2201-2205
    # Explicit 4-statement structural flow below; 2 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        if hikxzgubkh.dwzxeajrgkw:
            hikxzgubkh.dwzxeajrgkw.sbhcwvthwd(hikxzgubkh)
        elif qivnakklopy := jwyljukzbm.chhokgrlqz.qivnakklopy:
            qivnakklopy.remove(hikxzgubkh)


class fezlbmcnsxj(urkteguwnke):
    # Readability v3: update_binding; fezlbmcnsxj.__init__:2209-2210
    # Perform self.oggaqczbug = oggaqczbug; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, oggaqczbug: "reeyfysuniu"):
        self.oggaqczbug = oggaqczbug

    # Readability v3: return_constant; fezlbmcnsxj.fwuadhhbgd:2213-2214
    # Return 1. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return 1

    # Readability v3: structural flow; fezlbmcnsxj.utmugikohn:2216-2217
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        hikxzgubkh.nqmqwsvdbj(self.oggaqczbug)


class nhpdcafqnpk(urkteguwnke):
    # Readability v3: update_binding; nhpdcafqnpk.__init__:2221-2222
    # Perform self.gdsdvdutca = gdsdvdutca; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, gdsdvdutca: Callable[["reeyfysuniu"], None]):
        self.gdsdvdutca = gdsdvdutca

    # Readability v3: return_constant; nhpdcafqnpk.fwuadhhbgd:2225-2226
    # Return 1. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return 1

    # Readability v3: structural flow; nhpdcafqnpk.utmugikohn:2228-2229
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        self.gdsdvdutca(hikxzgubkh)


class jbtfrepslos(urkteguwnke):
    # Readability v3: update_binding; jbtfrepslos.__init__:2233-2234
    # Perform self.kujtokxtva = kujtokxtva; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, kujtokxtva: Callable[[], Any]):
        self.kujtokxtva = kujtokxtva

    # Readability v3: return_constant; jbtfrepslos.fwuadhhbgd:2237-2238
    # Return 1. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return 1

    # Readability v3: structural flow; jbtfrepslos.utmugikohn:2240-2241
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        self.kujtokxtva()


class llfllquswti(urkteguwnke):
    # Readability v3: structural flow; llfllquswti.__init__:2245-2248
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, ymmwcccrhb: list[str], rhriyabxoe: int, yquwzzqlpv: urzuivpavp):
        self.ymmwcccrhb = ymmwcccrhb
        self.rhriyabxoe = rhriyabxoe
        self.yquwzzqlpv = yquwzzqlpv

    # Readability v3: return_expression; llfllquswti.fwuadhhbgd:2251-2252
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return max(1, len(self.ymmwcccrhb) * self.rhriyabxoe)

    # Readability v3: structural flow; llfllquswti.utmugikohn:2254-2261
    # Explicit 7-statement structural flow below; 2 conditions, 1 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        if not self.ymmwcccrhb:
            return
        for frame in range(self.fwuadhhbgd):
            if frame > 0:
                jwyljukzbm.sqiubxcqht()
            umqavpqueq = min(frame // self.rhriyabxoe, len(self.ymmwcccrhb) - 1)
            hikxzgubkh.dkvmzpmzxn(self.ymmwcccrhb[umqavpqueq])


class ygajlpvwrt(urkteguwnke):
    """."""

    # Readability v3: structural flow; ygajlpvwrt.__init__:2267-2270
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, mlvizzjkoh: tuple[int, int], ymmwcccrhb: list[str], rhriyabxoe: int):
        self.mlvizzjkoh = mlvizzjkoh
        self.ymmwcccrhb = ymmwcccrhb
        self.rhriyabxoe = rhriyabxoe

    # Readability v3: return_expression; ygajlpvwrt.fwuadhhbgd:2273-2274
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return max(1, len(self.ymmwcccrhb) * self.rhriyabxoe)

    # Readability v3: structural flow; ygajlpvwrt.utmugikohn:2276-2286
    # Explicit 9-statement structural flow below; 3 conditions, 1 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        if not self.ymmwcccrhb:
            return
        for frame in range(self.fwuadhhbgd):
            if frame > 0:
                jwyljukzbm.sqiubxcqht()
            umqavpqueq = min(frame // self.rhriyabxoe, len(self.ymmwcccrhb) - 1)
            if hasattr(hikxzgubkh, "set_offset_image"):
                hikxzgubkh.set_offset_image(self.mlvizzjkoh, self.ymmwcccrhb[umqavpqueq])
            else:
                hikxzgubkh.dkvmzpmzxn(self.ymmwcccrhb[umqavpqueq])


class tuiwtjuwwjl(urkteguwnke):
    # Readability v3: update_binding; tuiwtjuwwjl.__init__:2290-2291
    # Perform self.agiuilotsn = agiuilotsn; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, agiuilotsn: list[urkteguwnke]):
        self.agiuilotsn = agiuilotsn

    # Readability v3: return_expression; tuiwtjuwwjl.fwuadhhbgd:2294-2295
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return sum((a.fwuadhhbgd for a in self.agiuilotsn))

    # Readability v3: structural flow; tuiwtjuwwjl.utmugikohn:2297-2301
    # Explicit 4-statement structural flow below; 1 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        for i, action in enumerate(self.agiuilotsn):
            if i > 0:
                jwyljukzbm.sqiubxcqht()
            action.utmugikohn(hikxzgubkh, jwyljukzbm)


class weuscxrpyad(urkteguwnke):
    # Readability v3: structural flow; weuscxrpyad.__init__:2305-2307
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, action: urkteguwnke, pyecrsaydp: int):
        self.action = action
        self.pyecrsaydp = pyecrsaydp

    # Readability v3: return_expression; weuscxrpyad.fwuadhhbgd:2310-2311
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return self.action.fwuadhhbgd * self.pyecrsaydp

    # Readability v3: structural flow; weuscxrpyad.utmugikohn:2313-2317
    # Explicit 4-statement structural flow below; 1 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        for i in range(self.pyecrsaydp):
            if i > 0:
                jwyljukzbm.sqiubxcqht()
            self.action.utmugikohn(hikxzgubkh, jwyljukzbm)


class jhdultqexdg(urkteguwnke):
    # Readability v3: structural flow; jhdultqexdg.__init__:2321-2323
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, xseehcbfcx: "reeyfysuniu", action: urkteguwnke):
        self.xseehcbfcx = xseehcbfcx
        self.action = action

    # Readability v3: read_attribute; jhdultqexdg.fwuadhhbgd:2326-2327
    # Return self.action.fwuadhhbgd; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return self.action.fwuadhhbgd

    # Readability v3: structural flow; jhdultqexdg.utmugikohn:2329-2330
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        self.action.utmugikohn(self.xseehcbfcx, jwyljukzbm)


class akudezpfqgr(urkteguwnke):
    """."""

    # Readability v3: update_binding; akudezpfqgr.__init__:2336-2337
    # Perform self.agiuilotsn = agiuilotsn; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, agiuilotsn: list[urkteguwnke]):
        self.agiuilotsn = agiuilotsn

    # Readability v3: return_expression; akudezpfqgr.fwuadhhbgd:2340-2341
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def fwuadhhbgd(self) -> int:
        return max((a.fwuadhhbgd for a in self.agiuilotsn), default=0)

    # Readability v3: return_expression; akudezpfqgr.rvudupelom:2343-2344
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def rvudupelom(self, action: urkteguwnke, default: "reeyfysuniu") -> "reeyfysuniu":
        return action.xseehcbfcx if isinstance(action, jhdultqexdg) else default

    # Readability v3: return_expression; akudezpfqgr.vcejwjirmw:2346-2347
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def vcejwjirmw(self, action: urkteguwnke) -> urkteguwnke:
        return action.action if isinstance(action, jhdultqexdg) else action

    # Readability v3: structural flow; akudezpfqgr.kzfqnjkjza:2349-2376
    # Explicit 21-statement structural flow below; 7 conditions, 1 loops, 8 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def kzfqnjkjza(self, action: urkteguwnke, frame: int, njmisxjhbn: tuple[int, int]) -> tuple[urkteguwnke | None, int, int, tuple[int, int]]:
        """."""
        if isinstance(action, tuiwtjuwwjl):
            cumulative, qafvpmovqo = (0, njmisxjhbn)
            for ieiykbdyvt in action.agiuilotsn:
                dqxcgimxfp = ieiykbdyvt.fwuadhhbgd
                if frame < cumulative + dqxcgimxfp:
                    return (ieiykbdyvt, frame - cumulative, dqxcgimxfp, qafvpmovqo)
                cumulative += dqxcgimxfp
                if isinstance(ieiykbdyvt, yfwkporkmwg):
                    qafvpmovqo = (
                        qafvpmovqo[0] + ieiykbdyvt.delta[0],
                        qafvpmovqo[1] + ieiykbdyvt.delta[1],
                    )
                elif isinstance(ieiykbdyvt, olxaxebbuds):
                    qafvpmovqo = ieiykbdyvt.rczgvgfsfb
            return (None, 0, 0, qafvpmovqo)
        if frame >= action.fwuadhhbgd:
            onitozyyae = njmisxjhbn
            if isinstance(action, yfwkporkmwg):
                onitozyyae = (
                    njmisxjhbn[0] + action.delta[0],
                    njmisxjhbn[1] + action.delta[1],
                )
            elif isinstance(action, olxaxebbuds):
                onitozyyae = action.rczgvgfsfb
            return (None, 0, 0, onitozyyae)
        return (action, frame, action.fwuadhhbgd, njmisxjhbn)

    # Readability v3: structural flow; akudezpfqgr.utmugikohn:2378-2535
    # Explicit 121-statement structural flow below; 33 conditions, 8 loops, 68 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utmugikohn(self, hikxzgubkh: "reeyfysuniu", jwyljukzbm: xxgrqqzbvr) -> None:
        ybnuplljmj = self.fwuadhhbgd
        if ybnuplljmj == 0:
            return
        xadmofenag: dict["reeyfysuniu", tuple[int, int]] = {}
        vquxggmkcl: dict["reeyfysuniu", tuple[float, float]] = {}
        wnlnwrqojp: dict["reeyfysuniu", float] = {}
        for action in self.agiuilotsn:
            yzdtidmrrj = self.rvudupelom(action, hikxzgubkh)
            if yzdtidmrrj not in xadmofenag:
                xadmofenag[yzdtidmrrj] = (yzdtidmrrj.xrxrxoqbfhw, yzdtidmrrj.dshcnskzvyz)
                vquxggmkcl[yzdtidmrrj] = (yzdtidmrrj.admhpzwadps, yzdtidmrrj.biowbvmadto)
                wnlnwrqojp[yzdtidmrrj] = yzdtidmrrj.qhngsgsqwsa
        hgkxrxdmrv: list[tuple[int, "reeyfysuniu"]] = []
        for frame in range(ybnuplljmj):
            if frame > 0:
                jwyljukzbm.sqiubxcqht()
            for yhalzzlvup, qehjwwweow in hgkxrxdmrv:
                if yhalzzlvup == frame:
                    if qehjwwweow.dwzxeajrgkw:
                        qehjwwweow.dwzxeajrgkw.sbhcwvthwd(qehjwwweow)
                    elif qivnakklopy := jwyljukzbm.chhokgrlqz.qivnakklopy:
                        qivnakklopy.remove(qehjwwweow)
            eagnfpmojd: dict["reeyfysuniu", tuple[int, int]] = {dksomhwxjp: (0, 0) for dksomhwxjp in xadmofenag}
            ktnkueoxyb: dict["reeyfysuniu", tuple[float, float]] = {dksomhwxjp: vquxggmkcl[dksomhwxjp] for dksomhwxjp in vquxggmkcl}
            frqmwtqguh: dict["reeyfysuniu", float] = {dksomhwxjp: wnlnwrqojp[dksomhwxjp] for dksomhwxjp in wnlnwrqojp}
            for action in self.agiuilotsn:
                yzdtidmrrj = self.rvudupelom(action, hikxzgubkh)
                eiqmxrdxfw = self.vcejwjirmw(action)
                start_x, start_y = xadmofenag[yzdtidmrrj]
                active, local_frame, action_frames, action_start = self.kzfqnjkjza(eiqmxrdxfw, frame, (start_x, start_y))
                if active is None:
                    dx, dy = (action_start[0] - start_x, action_start[1] - start_y)
                    nwsjrmsktd = eagnfpmojd[yzdtidmrrj]
                    eagnfpmojd[yzdtidmrrj] = (nwsjrmsktd[0] + dx, nwsjrmsktd[1] + dy)
                    continue
                uroxqabltx = (local_frame + 1) / action_frames if action_frames > 0 else 1.0
                base_dx, base_dy = (
                    action_start[0] - start_x,
                    action_start[1] - start_y,
                )
                if isinstance(active, yfwkporkmwg):
                    qxurvtseyl = active.yquwzzqlpv.ahrizsjlwz(uroxqabltx)
                    dx = base_dx + int(active.delta[0] * qxurvtseyl)
                    dy = base_dy + int(active.delta[1] * qxurvtseyl)
                    nwsjrmsktd = eagnfpmojd[yzdtidmrrj]
                    eagnfpmojd[yzdtidmrrj] = (nwsjrmsktd[0] + dx, nwsjrmsktd[1] + dy)
                elif isinstance(active, olxaxebbuds):
                    qxurvtseyl = active.yquwzzqlpv.ahrizsjlwz(uroxqabltx)
                    isx, isy = action_start
                    dx = int((active.rczgvgfsfb[0] - start_x) * qxurvtseyl + (isx - start_x) * (1 - qxurvtseyl))
                    dy = int((active.rczgvgfsfb[1] - start_y) * qxurvtseyl + (isy - start_y) * (1 - qxurvtseyl))
                    nwsjrmsktd = eagnfpmojd[yzdtidmrrj]
                    eagnfpmojd[yzdtidmrrj] = (nwsjrmsktd[0] + dx, nwsjrmsktd[1] + dy)
                elif isinstance(active, (ghwspxqtjqn, akikkfevfqs)):
                    if local_frame == 0:
                        yzdtidmrrj.visible = isinstance(active, akikkfevfqs)
                    nwsjrmsktd = eagnfpmojd[yzdtidmrrj]
                    eagnfpmojd[yzdtidmrrj] = (
                        nwsjrmsktd[0] + base_dx,
                        nwsjrmsktd[1] + base_dy,
                    )
                elif isinstance(
                    active,
                    (
                        obwesvumzeh,
                        otjzaaxnxue,
                        nhpdcafqnpk,
                        jbtfrepslos,
                        llfllquswti,
                    ),
                ):
                    if local_frame == 0:
                        if isinstance(active, otjzaaxnxue) and (not any((dksomhwxjp == yzdtidmrrj for gohymndfda, dksomhwxjp in hgkxrxdmrv))):
                            hgkxrxdmrv.append((frame + 1, yzdtidmrrj))
                        elif isinstance(active, nhpdcafqnpk):
                            active.gdsdvdutca(yzdtidmrrj)
                        elif isinstance(active, jbtfrepslos):
                            active.kujtokxtva()
                        elif isinstance(active, llfllquswti) and active.ymmwcccrhb:
                            umqavpqueq = min(
                                local_frame // active.rhriyabxoe,
                                len(active.ymmwcccrhb) - 1,
                            )
                            yzdtidmrrj.dkvmzpmzxn(active.ymmwcccrhb[umqavpqueq])
                    elif isinstance(active, llfllquswti) and active.ymmwcccrhb:
                        umqavpqueq = min(local_frame // active.rhriyabxoe, len(active.ymmwcccrhb) - 1)
                        yzdtidmrrj.dkvmzpmzxn(active.ymmwcccrhb[umqavpqueq])
                    nwsjrmsktd = eagnfpmojd[yzdtidmrrj]
                    eagnfpmojd[yzdtidmrrj] = (
                        nwsjrmsktd[0] + base_dx,
                        nwsjrmsktd[1] + base_dy,
                    )
                elif isinstance(active, jwajmvmlorx):
                    qxurvtseyl = active.yquwzzqlpv.ahrizsjlwz(uroxqabltx)
                    leqipofgli, zszhnwpehh = vquxggmkcl[yzdtidmrrj]
                    ktnkueoxyb[yzdtidmrrj] = (
                        leqipofgli + (active.scale[0] - leqipofgli) * qxurvtseyl,
                        zszhnwpehh + (active.scale[1] - zszhnwpehh) * qxurvtseyl,
                    )
                elif isinstance(active, hsjxznjjtdq):
                    qxurvtseyl = active.yquwzzqlpv.ahrizsjlwz(uroxqabltx)
                    leqipofgli, zszhnwpehh = vquxggmkcl[yzdtidmrrj]
                    tx, ty = (
                        leqipofgli * active.factor[0],
                        zszhnwpehh * active.factor[1],
                    )
                    ktnkueoxyb[yzdtidmrrj] = (
                        leqipofgli + (tx - leqipofgli) * qxurvtseyl,
                        zszhnwpehh + (ty - zszhnwpehh) * qxurvtseyl,
                    )
                elif isinstance(active, ypytnudbspd):
                    qxurvtseyl = active.yquwzzqlpv.ahrizsjlwz(uroxqabltx)
                    leqipofgli, zszhnwpehh = vquxggmkcl[yzdtidmrrj]
                    ktnkueoxyb[yzdtidmrrj] = (
                        leqipofgli + (active.pgynjewzdl - leqipofgli) * qxurvtseyl,
                        zszhnwpehh,
                    )
                elif isinstance(active, tjshojnpkdy):
                    qxurvtseyl = active.yquwzzqlpv.ahrizsjlwz(uroxqabltx)
                    leqipofgli, zszhnwpehh = vquxggmkcl[yzdtidmrrj]
                    ktnkueoxyb[yzdtidmrrj] = (
                        leqipofgli,
                        zszhnwpehh + (active.clzlmeopaa - zszhnwpehh) * qxurvtseyl,
                    )
                elif isinstance(active, wzflwwsfomt):
                    qxurvtseyl = active.yquwzzqlpv.ahrizsjlwz(uroxqabltx)
                    yccpznchtg = wnlnwrqojp[yzdtidmrrj]
                    ounaqkqyit = (yccpznchtg + active.ipwvednitq * qxurvtseyl) % 360.0
                    frqmwtqguh[yzdtidmrrj] = ounaqkqyit + 360.0 if ounaqkqyit < 0 else ounaqkqyit
                elif isinstance(active, oiepkscceaq):
                    qxurvtseyl = active.yquwzzqlpv.ahrizsjlwz(uroxqabltx)
                    yccpznchtg = wnlnwrqojp[yzdtidmrrj]
                    zwtifoyjxq = active.kfdhyizjpx % 360.0
                    if zwtifoyjxq < 0:
                        zwtifoyjxq += 360.0
                    iuiapwlyhz = zwtifoyjxq - yccpznchtg
                    if iuiapwlyhz > 180:
                        iuiapwlyhz -= 360
                    elif iuiapwlyhz < -180:
                        iuiapwlyhz += 360
                    ounaqkqyit = (yccpznchtg + iuiapwlyhz * qxurvtseyl) % 360.0
                    frqmwtqguh[yzdtidmrrj] = ounaqkqyit + 360.0 if ounaqkqyit < 0 else ounaqkqyit
            for yzdtidmrrj, (dx, dy) in eagnfpmojd.items():
                leqipofgli, zszhnwpehh = xadmofenag[yzdtidmrrj]
                yzdtidmrrj.set_position(leqipofgli + dx, zszhnwpehh + dy)
            for yzdtidmrrj, (nahhtiuekr, bmkmivfpqi) in ktnkueoxyb.items():
                yzdtidmrrj.admhpzwadps, yzdtidmrrj.biowbvmadto = (nahhtiuekr, bmkmivfpqi)
                yzdtidmrrj.ohrrcsgwmu()
            for yzdtidmrrj, umanlbltdo in frqmwtqguh.items():
                yzdtidmrrj.qhngsgsqwsa = umanlbltdo
                yzdtidmrrj.gspzwjfope()
        for yhalzzlvup, qehjwwweow in hgkxrxdmrv:
            if yhalzzlvup >= ybnuplljmj:
                if qehjwwweow.dwzxeajrgkw:
                    qehjwwweow.dwzxeajrgkw.sbhcwvthwd(qehjwwweow)
                elif qivnakklopy := jwyljukzbm.chhokgrlqz.qivnakklopy:
                    qivnakklopy.remove(qehjwwweow)


"."


class qipeamczaw:
    """."""

    __slots__ = ("mycafmfscyz", "rfbmxxrnrwi", "ymorirjinte", "ismbglrrplx")

    # Readability v3: structural flow; qipeamczaw.__init__:2546-2554
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        mycafmfscyz: list[str],
        rfbmxxrnrwi: dict[str, list[str]],
        ymorirjinte: dict[str, tuple[int, int]] | None = None,
        ismbglrrplx: dict[str, list[list[str]]] | None = None,
    ):
        self.mycafmfscyz, self.rfbmxxrnrwi = (mycafmfscyz, rfbmxxrnrwi)
        self.ymorirjinte, self.ismbglrrplx = (ymorirjinte or {}, ismbglrrplx or {})

    # Readability v3: return_expression; qipeamczaw.qmcjluiioz:2557-2558
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def qmcjluiioz(self) -> tuple[int, int]:
        return self.ymorirjinte.get("vxruyoesvkf", (8, 8))

    # Readability v3: return_expression; qipeamczaw.width:2561-2562
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def width(self) -> int:
        return max((len(muciemydvy) for muciemydvy in self.mycafmfscyz)) if self.mycafmfscyz else 0

    # Readability v3: return_expression; qipeamczaw.height:2565-2566
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def height(self) -> int:
        return len(self.mycafmfscyz)

    # Readability v3: return_expression; qipeamczaw.lcsducsxuc:2569-2570
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def lcsducsxuc(self) -> list[list[str]]:
        return self.ismbglrrplx.get("jibupgvgfzf", [])


class ocarttcsrh(yvohraktjn):
    """."""

    # Readability v3: structural flow; ocarttcsrh.__init__:2576-2578
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, array: np.ndarray, layer: int, name: str):
        super().__init__([], {}, {"layer": layer, "name": name})
        object.__setattr__(self, "aubepcahzib", array)

    # Readability v3: return_expression; ocarttcsrh.width:2581-2582
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def width(self) -> int:
        return self.aubepcahzib.shape[1] if self.aubepcahzib is not None else 0

    # Readability v3: return_expression; ocarttcsrh.height:2585-2586
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def height(self) -> int:
        return self.aubepcahzib.shape[0] if self.aubepcahzib is not None else 0

    # Readability v3: return_expression; ocarttcsrh.ieikpxxuml:2588-2589
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ieikpxxuml(self) -> np.ndarray:
        return self.aubepcahzib if self.aubepcahzib is not None else np.zeros((1, 1))


class ogtmlfjejir(reeyfysuniu):
    """."""

    __slots__ = (
        "iwotaufbqdz",
        "vuhpwbvhoal",
        "ypsmynreigg",
        "vkbyphizhkt",
        "hilopxwoqvn",
        "tawtpwifoyc",
        "unxmkbpkzwj",
        "ltlyhlyvapv",
        "vyicipsdbdd",
    )

    # Readability v3: structural flow; ogtmlfjejir.__init__:2607-2624
    # Explicit 8-statement structural flow below; 0 conditions, 0 loops, 7 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        vxgikutplyz: str,
        hrlzbohbpn: list[tuple[int, int]] | None = None,
        x: int = 0,
        y: int = 0,
        layer: int = 0,
        name: str = "",
        collidable: bool = True,
    ):
        super().__init__(kmrhqgjgyk=None, name=name, x=0, y=0)
        self.iwotaufbqdz, self.vuhpwbvhoal = (x, y)
        self.ypsmynreigg = hrlzbohbpn or [(0, 0)]
        self.vkbyphizhkt = vxgikutplyz
        self.hilopxwoqvn: klmsuijofik | None = None
        self.qqzqnjfcgri, self.tawtpwifoyc = (layer, collidable)
        self.unxmkbpkzwj = self.ltlyhlyvapv = 0
        self.vyicipsdbdd: dict[tuple[int, int], str] = {}

    # Readability v3: read_attribute; ogtmlfjejir.grid_x:2627-2628
    # Return self.iwotaufbqdz; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def grid_x(self) -> int:
        return self.iwotaufbqdz

    # Readability v3: read_attribute; ogtmlfjejir.grid_y:2631-2632
    # Return self.vuhpwbvhoal; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def grid_y(self) -> int:
        return self.vuhpwbvhoal

    # Readability v3: return_expression; ogtmlfjejir.qumspquyus:2635-2636
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def qumspquyus(self) -> tuple[int, int]:
        return (self.iwotaufbqdz, self.vuhpwbvhoal)

    # Readability v3: structural flow; ogtmlfjejir.qumspquyus:2639-2640
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @qumspquyus.setter
    def qumspquyus(self, value: tuple[int, int]) -> None:
        self.uehpvffenq(value[0], value[1])

    # Readability v3: return_expression; ogtmlfjejir.hrlzbohbpn:2643-2644
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def hrlzbohbpn(self) -> list[tuple[int, int]]:
        return self.ypsmynreigg.copy()

    # Readability v3: return_expression; ogtmlfjejir.uafphpbluk:2647-2648
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def uafphpbluk(self) -> list[tuple[int, int]]:
        return [(self.iwotaufbqdz + dx, self.vuhpwbvhoal + dy) for dx, dy in self.ypsmynreigg]

    # Readability v3: read_attribute; ogtmlfjejir.flrpnczugo:2651-2652
    # Return self.vkbyphizhkt; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def flrpnczugo(self) -> str:
        return self.vkbyphizhkt

    # Readability v3: read_attribute; ogtmlfjejir.collidable:2655-2656
    # Return self.tawtpwifoyc; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def collidable(self) -> bool:
        return self.tawtpwifoyc

    # Readability v3: update_binding; ogtmlfjejir.collidable:2659-2660
    # Perform self.tawtpwifoyc = value; argument/attribute spellings are preserved. [structural-contract]
    @collidable.setter
    def collidable(self, value: bool) -> None:
        self.tawtpwifoyc = value

    # Readability v3: read_attribute; ogtmlfjejir.hdnrlfmyrj:2663-2664
    # Return self.hilopxwoqvn; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def hdnrlfmyrj(self) -> "klmsuijofik | None":
        return self.hilopxwoqvn

    # Readability v3: return_expression; ogtmlfjejir.xrntqbnwzt:2666-2667
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def xrntqbnwzt(self, tfdqpnauaa: int, ehzrtqfolt: int) -> bool:
        return (tfdqpnauaa, ehzrtqfolt) in self.uafphpbluk

    # Readability v3: return_expression; ogtmlfjejir.cezamrmvrg:2669-2670
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def cezamrmvrg(self, mlvizzjkoh: tuple[int, int]) -> str:
        return self.vyicipsdbdd.get(mlvizzjkoh, self.vkbyphizhkt)

    # Readability v3: structural flow; ogtmlfjejir.set_offset_image:2672-2678
    # Explicit 6-statement structural flow below; 2 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def set_offset_image(self, mlvizzjkoh: tuple[int, int], vxgikutplyz: str) -> bool:
        if mlvizzjkoh not in self.ypsmynreigg:
            return False
        self.vyicipsdbdd[mlvizzjkoh] = vxgikutplyz
        if self.hilopxwoqvn is not None:
            self.ajbncqttkm(self.hilopxwoqvn.kiopdubfvza)
        return True

    # Readability v3: return_expression; ogtmlfjejir.hfaehnxuhf:2680-2681
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def hfaehnxuhf(self, mlvizzjkoh: tuple[int, int], irkzsmvpar: list[str], rhriyabxoe: int = 1) -> "urkteguwnke":
        return ygajlpvwrt(mlvizzjkoh, irkzsmvpar, rhriyabxoe)

    # Readability v3: structural flow; ogtmlfjejir.wlnjhkyftv:2683-2689
    # Explicit 6-statement structural flow below; 2 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wlnjhkyftv(self, mlvizzjkoh: tuple[int, int]) -> bool:
        if mlvizzjkoh not in self.vyicipsdbdd:
            return False
        del self.vyicipsdbdd[mlvizzjkoh]
        if self.hilopxwoqvn is not None:
            self.ajbncqttkm(self.hilopxwoqvn.kiopdubfvza)
        return True

    # Readability v3: structural flow; ogtmlfjejir.fqmfvssiow:2691-2713
    # Explicit 21-statement structural flow below; 7 conditions, 2 loops, 5 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def fqmfvssiow(self, ndhfxmfuxm: list[tuple[int, int]], prdmedreqy: bool = True) -> bool:
        if not ndhfxmfuxm:
            return False
        if self.hilopxwoqvn is not None:
            for dx, dy in ndhfxmfuxm:
                cell_x, cell_y = (self.iwotaufbqdz + dx, self.vuhpwbvhoal + dy)
                if not self.hilopxwoqvn.escrhytfpz(cell_x, cell_y):
                    return False
                if self.tawtpwifoyc:
                    for knvlfntsrc in self.hilopxwoqvn.jhzcxkveiw(cell_x, cell_y):
                        if knvlfntsrc is not self and knvlfntsrc.tawtpwifoyc:
                            return False
        htbzmneixh = self.uafphpbluk
        self.ypsmynreigg = list(ndhfxmfuxm)
        if prdmedreqy:
            pdsqgomvxe = set(ndhfxmfuxm)
            self.vyicipsdbdd = {k: v for k, v in self.vyicipsdbdd.items() if k in pdsqgomvxe}
        else:
            self.vyicipsdbdd.clear()
        if self.hilopxwoqvn is not None:
            self.hilopxwoqvn.fkkiquagjt(self, htbzmneixh, self.uafphpbluk)
            self.ajbncqttkm(self.hilopxwoqvn.kiopdubfvza)
        return True

    # Readability v3: return_expression; ogtmlfjejir.rermlfpoos:2715-2716
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def rermlfpoos(self, dx: int, dy: int) -> tuple[int, int]:
        return (self.iwotaufbqdz + dx, self.vuhpwbvhoal + dy)

    # Readability v3: structural flow; ogtmlfjejir.hxqzlrzqzu:2718-2720
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hxqzlrzqzu(self, tfdqpnauaa: int, ehzrtqfolt: int) -> tuple[int, int] | None:
        mlvizzjkoh = (tfdqpnauaa - self.iwotaufbqdz, ehzrtqfolt - self.vuhpwbvhoal)
        return mlvizzjkoh if mlvizzjkoh in self.ypsmynreigg else None

    # Readability v3: structural flow; ogtmlfjejir.vtmmfhkzdl:2722-2733
    # Explicit 11-statement structural flow below; 4 conditions, 2 loops, 1 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def vtmmfhkzdl(self, x: int, y: int, dfovhmusxj: bool = True, dzmcchdaat: list[str] = []) -> bool:
        if self.hilopxwoqvn is None:
            return True
        for dx, dy in self.ypsmynreigg:
            cell_x, cell_y = (x + dx, y + dy)
            if not self.hilopxwoqvn.escrhytfpz(cell_x, cell_y):
                return False
            if len(dzmcchdaat) > 0:
                for knvlfntsrc in self.hilopxwoqvn.jhzcxkveiw(cell_x, cell_y):
                    if knvlfntsrc.hfzscdtvlfu in dzmcchdaat:
                        return False
        return True

    # Readability v3: structural flow; ogtmlfjejir.uehpvffenq:2735-2760
    # Explicit 11-statement structural flow below; 3 conditions, 0 loops, 3 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def uehpvffenq(
        self,
        x: int,
        y: int,
        jzjvthbjzd: bool = False,
        wlorwsfxko: bool = False,
        dzmcchdaat: list[str] = [],
    ) -> bool:
        if not jzjvthbjzd and (not self.vtmmfhkzdl(x, y, True, dzmcchdaat)):
            return False
        htbzmneixh = self.uafphpbluk
        self.iwotaufbqdz, self.vuhpwbvhoal = (x, y)
        if self.hilopxwoqvn:
            self.hilopxwoqvn.fkkiquagjt(self, htbzmneixh, self.uafphpbluk)
        if wlorwsfxko and self.welhuapdwo is not None:
            self.wryqzerswl(
                urkteguwnke.rhsgpcfoey(
                    (x * self.unxmkbpkzwj, y * self.ltlyhlyvapv),
                    5,
                    urzuivpavp.skmykirpclw,
                )
            )
        else:
            self.xrxrxoqbfhw, self.dshcnskzvyz = (x * self.unxmkbpkzwj, y * self.ltlyhlyvapv)
        self.mrrlbtbxit()
        return True

    # Readability v3: structural flow; ogtmlfjejir.ywotvcjnrc:2762-2770
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 2 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ywotvcjnrc(self, x: int, y: int, jzjvthbjzd: bool = False, dzmcchdaat: list[str] = []) -> bool:
        if not jzjvthbjzd and (not self.vtmmfhkzdl(x, y, True, dzmcchdaat)):
            return False
        htbzmneixh = self.uafphpbluk
        self.iwotaufbqdz, self.vuhpwbvhoal = (x, y)
        if self.hilopxwoqvn:
            self.hilopxwoqvn.fkkiquagjt(self, htbzmneixh, self.uafphpbluk)
        self.mrrlbtbxit()
        return True

    # Readability v3: return_expression; ogtmlfjejir.wehgztmmdj:2772-2780
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def wehgztmmdj(
        self,
        dx: int,
        dy: int,
        jzjvthbjzd: bool = False,
        wlorwsfxko: bool = False,
        dzmcchdaat: list[str] = [],
    ) -> bool:
        return self.uehpvffenq(self.iwotaufbqdz + dx, self.vuhpwbvhoal + dy, jzjvthbjzd, wlorwsfxko, dzmcchdaat)

    # Readability v3: return_expression; ogtmlfjejir.ubtuiotxcd:2782-2783
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ubtuiotxcd(self, dx: int, dy: int, jzjvthbjzd: bool = False, dzmcchdaat: list[str] = []) -> bool:
        return self.ywotvcjnrc(self.iwotaufbqdz + dx, self.vuhpwbvhoal + dy, jzjvthbjzd, dzmcchdaat)

    # Readability v3: structural flow; ogtmlfjejir.utfvfcngkj:2785-2793
    # Explicit 8-statement structural flow below; 3 conditions, 0 loops, 3 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def utfvfcngkj(self) -> None:
        if self.unxmkbpkzwj == 0 or self.ltlyhlyvapv == 0:
            return
        new_gx, new_gy = (self.xrxrxoqbfhw // self.unxmkbpkzwj, self.dshcnskzvyz // self.ltlyhlyvapv)
        if new_gx != self.iwotaufbqdz or new_gy != self.vuhpwbvhoal:
            htbzmneixh = self.uafphpbluk
            self.iwotaufbqdz, self.vuhpwbvhoal = (new_gx, new_gy)
            if self.hilopxwoqvn:
                self.hilopxwoqvn.fkkiquagjt(self, htbzmneixh, self.uafphpbluk)

    # Readability v3: structural flow; ogtmlfjejir.gijxrelfht:2795-2807
    # Explicit 12-statement structural flow below; 5 conditions, 2 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gijxrelfht(self) -> None:
        if self.hilopxwoqvn is None:
            return
        for iqogrbwzwz, weynwhuzfv in list(self.hilopxwoqvn.muocdhlsktl.items()):
            if self in weynwhuzfv:
                weynwhuzfv.remove(self)
                if not weynwhuzfv:
                    del self.hilopxwoqvn.muocdhlsktl[iqogrbwzwz]
        for iqogrbwzwz in self.uafphpbluk:
            if iqogrbwzwz not in self.hilopxwoqvn.muocdhlsktl:
                self.hilopxwoqvn.muocdhlsktl[iqogrbwzwz] = []
            if self not in self.hilopxwoqvn.muocdhlsktl[iqogrbwzwz]:
                self.hilopxwoqvn.muocdhlsktl[iqogrbwzwz].append(self)

    # Readability v3: structural flow; ogtmlfjejir.esktperyuto:2809-2815
    # Explicit 6-statement structural flow below; 2 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def esktperyuto(self) -> None:
        if self.hilopxwoqvn is not None and self not in self.hilopxwoqvn.esishrsguis:
            self.hilopxwoqvn = None
            return
        self.gijxrelfht()
        if self.hilopxwoqvn is not None:
            self.ajbncqttkm(self.hilopxwoqvn.kiopdubfvza)

    # Readability v3: structural flow; ogtmlfjejir.ajbncqttkm:2817-2883
    # Explicit 61-statement structural flow below; 15 conditions, 2 loops, 42 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ajbncqttkm(self, ymmwcccrhb: dict[str, yvohraktjn]) -> None:
        if not self.ypsmynreigg:
            return
        lyarducndx = self.vkbyphizhkt or (next(iter(self.vyicipsdbdd.values())) if self.vyicipsdbdd else None)
        giuxuhskdi = ymmwcccrhb.get(lyarducndx) if lyarducndx else None
        if giuxuhskdi is None:
            return
        if self.hilopxwoqvn is not None:
            tile_h, tile_w = self.hilopxwoqvn.qmcjluiioz
        else:
            nywcoztgmc = giuxuhskdi.ieikpxxuml()
            tile_h, tile_w = nywcoztgmc.shape
        self.unxmkbpkzwj, self.ltlyhlyvapv = (tile_w, tile_h)
        lqlldqmobx = min((dx for dx, dy in self.ypsmynreigg))
        quiufaixou = min((dy for dx, dy in self.ypsmynreigg))
        jeylrftwcl = 0
        vwhinxvmtp = 0
        bpxnziufpj = False
        for dx, dy in self.ypsmynreigg:
            owgkijkkfk = self.vyicipsdbdd.get((dx, dy), self.vkbyphizhkt)
            ofnfjqlmjb = ymmwcccrhb.get(owgkijkkfk) if owgkijkkfk else None
            if ofnfjqlmjb is None:
                continue
            yxcvyaxosm = ofnfjqlmjb.ieikpxxuml()
            actual_h, actual_w = yxcvyaxosm.shape
            xmgqgkfjvd = (dx - lqlldqmobx) * tile_w
            ksvcjrknkh = (dy - quiufaixou) * tile_h
            wwtdhotwwu = xmgqgkfjvd + actual_w
            qthjghyabc = ksvcjrknkh + actual_h
            if wwtdhotwwu > jeylrftwcl:
                jeylrftwcl = wwtdhotwwu
            if qthjghyabc > vwhinxvmtp:
                vwhinxvmtp = qthjghyabc
            bpxnziufpj = True
        if not bpxnziufpj:
            return
        width, height = (jeylrftwcl, vwhinxvmtp)
        qsrfazgqzi = np.full((height, width), -1, dtype=np.int8)
        for dx, dy in sorted(self.ypsmynreigg, key=lambda x: (-x[0], x[1])):
            owgkijkkfk = self.vyicipsdbdd.get((dx, dy), self.vkbyphizhkt)
            ofnfjqlmjb = ymmwcccrhb.get(owgkijkkfk) if owgkijkkfk else None
            if ofnfjqlmjb is None:
                continue
            yxcvyaxosm = ofnfjqlmjb.ieikpxxuml()
            actual_h, actual_w = yxcvyaxosm.shape
            xmgqgkfjvd = (dx - lqlldqmobx) * tile_w
            ksvcjrknkh = (dy - quiufaixou) * tile_h
            end_x = min(actual_w, width - xmgqgkfjvd)
            end_y = min(actual_h, height - ksvcjrknkh)
            if end_x <= 0 or end_y <= 0:
                continue
            hbrnqosnpp = yxcvyaxosm[:end_y, :end_x]
            eouzaxebsi = qsrfazgqzi[ksvcjrknkh : ksvcjrknkh + end_y, xmgqgkfjvd : xmgqgkfjvd + end_x]
            dkmzcgjddm = hbrnqosnpp >= 0
            eouzaxebsi[dkmzcgjddm] = hbrnqosnpp[dkmzcgjddm]
        tozjfnvkei = ocarttcsrh(
            qsrfazgqzi,
            giuxuhskdi.layer if hasattr(giuxuhskdi, "layer") else self.qqzqnjfcgri,
            f"{self.hfzscdtvlfu}_flattened",
        )
        self.gimrsagplbc, self.qqzqnjfcgri = (tozjfnvkei, tozjfnvkei.layer)
        self.xrxrxoqbfhw = (self.iwotaufbqdz + lqlldqmobx) * tile_w
        self.dshcnskzvyz = (self.vuhpwbvhoal + quiufaixou) * tile_h
        self.mrrlbtbxit()
        qivnakklopy = self.fgaippmafs()
        if qivnakklopy:
            qivnakklopy.hlfdukibtwe = True


class klmsuijofik(reeyfysuniu):
    """."""

    __slots__ = (
        "iizrktmmpmf",
        "kiopdubfvza",
        "unxmkbpkzwj",
        "ltlyhlyvapv",
        "jarhqzdpkgb",
        "qtlqpdlnjso",
        "yppbwwgbrca",
        "muocdhlsktl",
    )

    # Readability v3: structural flow; klmsuijofik.__init__:2900-2914
    # Explicit 7-statement structural flow below; 0 conditions, 0 loops, 5 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        dkaopcaqrm: qipeamczaw,
        ymmwcccrhb: dict[str, yvohraktjn],
        x: int = 0,
        y: int = 0,
        name: str = "",
    ):
        super().__init__(kmrhqgjgyk=None, name=name, x=x, y=y)
        self.iizrktmmpmf, self.kiopdubfvza = (dkaopcaqrm, ymmwcccrhb)
        self.unxmkbpkzwj, self.ltlyhlyvapv = dkaopcaqrm.qmcjluiioz
        self.jarhqzdpkgb, self.qtlqpdlnjso = (dkaopcaqrm.width, dkaopcaqrm.height)
        self.yppbwwgbrca: list[ogtmlfjejir] = []
        self.muocdhlsktl: dict[tuple[int, int], list[ogtmlfjejir]] = {}
        self.satosvvjtu()

    # Readability v3: return_expression; klmsuijofik.qmcjluiioz:2917-2918
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def qmcjluiioz(self) -> tuple[int, int]:
        return (self.unxmkbpkzwj, self.ltlyhlyvapv)

    # Readability v3: return_expression; klmsuijofik.grid_size:2921-2922
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def grid_size(self) -> tuple[int, int]:
        return (self.jarhqzdpkgb, self.qtlqpdlnjso)

    # Readability v3: return_expression; klmsuijofik.kffhplqrzc:2925-2929
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def kffhplqrzc(self) -> tuple[int, int]:
        return (
            self.jarhqzdpkgb * self.unxmkbpkzwj,
            self.qtlqpdlnjso * self.ltlyhlyvapv,
        )

    # Readability v3: return_expression; klmsuijofik.ugywcmguyv:2932-2933
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def ugywcmguyv(self) -> list[ogtmlfjejir]:
        return self.yppbwwgbrca.copy()

    # Readability v3: return_expression; klmsuijofik.escrhytfpz:2935-2936
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def escrhytfpz(self, tfdqpnauaa: int, ehzrtqfolt: int) -> bool:
        return 0 <= tfdqpnauaa < self.jarhqzdpkgb and 0 <= ehzrtqfolt < self.qtlqpdlnjso

    # Readability v3: return_expression; klmsuijofik.uwfchohztf:2938-2939
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def uwfchohztf(self, tfdqpnauaa: int, ehzrtqfolt: int) -> tuple[int, int]:
        return (tfdqpnauaa * self.unxmkbpkzwj, ehzrtqfolt * self.ltlyhlyvapv)

    # Readability v3: structural flow; klmsuijofik.aekrauykil:2941-2946
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def aekrauykil(self, tfdqpnauaa: int, ehzrtqfolt: int) -> tuple[int, int]:
        adhkazxnsk, cgyfmecsom = self.knpqzpefyn()
        return (
            adhkazxnsk + tfdqpnauaa * self.unxmkbpkzwj,
            cgyfmecsom + ehzrtqfolt * self.ltlyhlyvapv,
        )

    # Readability v3: return_expression; klmsuijofik.mctjogsobm:2948-2949
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def mctjogsobm(self, flifhhrjnf: int, oghjewectj: int) -> tuple[int, int]:
        return (flifhhrjnf // self.unxmkbpkzwj, oghjewectj // self.ltlyhlyvapv)

    # Readability v3: structural flow; klmsuijofik.hyntnfvpgl:2951-2956
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hyntnfvpgl(self, adhkazxnsk: int, cgyfmecsom: int) -> tuple[int, int]:
        xmgqgkfjvd, ksvcjrknkh = self.knpqzpefyn()
        return (
            (adhkazxnsk - xmgqgkfjvd) // self.unxmkbpkzwj,
            (cgyfmecsom - ksvcjrknkh) // self.ltlyhlyvapv,
        )

    # Readability v3: return_expression; klmsuijofik.jhzcxkveiw:2958-2959
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def jhzcxkveiw(self, tfdqpnauaa: int, ehzrtqfolt: int) -> list[ogtmlfjejir]:
        return self.muocdhlsktl.get((tfdqpnauaa, ehzrtqfolt), []).copy()

    # Readability v3: return_expression; klmsuijofik.hwvdjcshny:2961-2962
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def hwvdjcshny(self, uafphpbluk: list[tuple[int, int]]) -> list[ogtmlfjejir]:
        return [knvlfntsrc for knvlfntsrc in self.yppbwwgbrca if set(knvlfntsrc.uafphpbluk) & set(uafphpbluk)]

    # Readability v3: structural flow; klmsuijofik.jyiihxdddr:2964-2968
    # Explicit 4-statement structural flow below; 1 conditions, 1 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jyiihxdddr(self, name: str) -> ogtmlfjejir | None:
        for knvlfntsrc in self.yppbwwgbrca:
            if knvlfntsrc.hfzscdtvlfu == name:
                return knvlfntsrc
        return None

    # Readability v3: structural flow; klmsuijofik.slaslqzwus:2970-2991
    # Explicit 18-statement structural flow below; 5 conditions, 3 loops, 3 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def slaslqzwus(self, knnkmdtpar: ogtmlfjejir, jzjvthbjzd: bool = True) -> bool:
        if not jzjvthbjzd:
            for tfdqpnauaa, ehzrtqfolt in knnkmdtpar.uafphpbluk:
                if not self.escrhytfpz(tfdqpnauaa, ehzrtqfolt):
                    return False
                if knnkmdtpar.tawtpwifoyc:
                    for xamvsnhmfx in self.jhzcxkveiw(tfdqpnauaa, ehzrtqfolt):
                        if xamvsnhmfx.tawtpwifoyc:
                            return False
        knnkmdtpar.hilopxwoqvn = self
        knnkmdtpar.unxmkbpkzwj, knnkmdtpar.ltlyhlyvapv = (
            self.unxmkbpkzwj,
            self.ltlyhlyvapv,
        )
        knnkmdtpar.ajbncqttkm(self.kiopdubfvza)
        self.yppbwwgbrca.append(knnkmdtpar)
        for iqogrbwzwz in knnkmdtpar.uafphpbluk:
            if iqogrbwzwz not in self.muocdhlsktl:
                self.muocdhlsktl[iqogrbwzwz] = []
            self.muocdhlsktl[iqogrbwzwz].append(knnkmdtpar)
        self.nqmqwsvdbj(knnkmdtpar)
        return True

    # Readability v3: structural flow; klmsuijofik.curvanlgjj:2993-3006
    # Explicit 13-statement structural flow below; 4 conditions, 1 loops, 2 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def curvanlgjj(self, knnkmdtpar: ogtmlfjejir) -> bool:
        if knnkmdtpar not in self.yppbwwgbrca:
            return False
        for iqogrbwzwz in knnkmdtpar.uafphpbluk:
            if iqogrbwzwz in self.muocdhlsktl:
                weynwhuzfv = self.muocdhlsktl[iqogrbwzwz]
                if knnkmdtpar in weynwhuzfv:
                    weynwhuzfv.remove(knnkmdtpar)
                if not weynwhuzfv:
                    del self.muocdhlsktl[iqogrbwzwz]
        self.sbhcwvthwd(knnkmdtpar)
        self.yppbwwgbrca.remove(knnkmdtpar)
        knnkmdtpar.hilopxwoqvn = None
        return True

    # Readability v3: read_attribute; klmsuijofik.lghjaofszt:3008-3009
    # Return knnkmdtpar.uafphpbluk; descriptor behavior is not assumed pure. [structural-contract]
    def lghjaofszt(self, knnkmdtpar: ogtmlfjejir) -> list[tuple[int, int]]:
        return knnkmdtpar.uafphpbluk

    # Readability v3: structural flow; klmsuijofik.nqybsxhxoy:3011-3058
    # Explicit 21-statement structural flow below; 8 conditions, 3 loops, 6 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def nqybsxhxoy(
        self,
        tfdqpnauaa: int,
        ehzrtqfolt: int,
        wjhktyviqv: str | list[str] | None = None,
        jvjoqrobnh: int = -1,
        aywrugyzqv: bool = False,
    ) -> list[ogtmlfjejir]:
        ojvrdstlwc = None if wjhktyviqv is None else {wjhktyviqv} if isinstance(wjhktyviqv, str) else set(wjhktyviqv)

        # Readability v3: return_expression; klmsuijofik.nqybsxhxoy.kvopzbcqlw:3021-3022
        # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
        def kvopzbcqlw(knvlfntsrc: "ogtmlfjejir") -> bool:
            return ojvrdstlwc is None or knvlfntsrc.hfzscdtvlfu in ojvrdstlwc

        capqroidgm = self.muocdhlsktl.get((tfdqpnauaa, ehzrtqfolt), [])
        if not capqroidgm:
            return []
        ldhfqdxodk = [(-1, -1), (0, -1), (1, -1), (-1, 0), (1, 0), (-1, 1), (0, 1), (1, 1)] if aywrugyzqv else [(0, -1), (0, 1), (-1, 0), (1, 0)]
        result, visited_polys, queued_cells = ([], set(), set())
        tprcgarxyo: deque[tuple[int, int, int]] = deque()

        # Readability v3: structural flow; klmsuijofik.nqybsxhxoy.iywtkgmtdb:3031-3045
        # Explicit 8-statement structural flow below; 2 conditions, 1 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
        def iywtkgmtdb(knvlfntsrc: "ogtmlfjejir") -> None:
            if id(knvlfntsrc) in visited_polys:
                return
            visited_polys.add(id(knvlfntsrc))
            result.append(knvlfntsrc)
            for iqogrbwzwz in knvlfntsrc.uafphpbluk:
                if iqogrbwzwz not in queued_cells:
                    queued_cells.add(iqogrbwzwz)
                    tprcgarxyo.append(
                        (
                            iqogrbwzwz[0],
                            iqogrbwzwz[1],
                            abs(iqogrbwzwz[0] - tfdqpnauaa) + abs(iqogrbwzwz[1] - ehzrtqfolt),
                        )
                    )

        for knvlfntsrc in capqroidgm:
            if kvopzbcqlw(knvlfntsrc):
                iywtkgmtdb(knvlfntsrc)
        while tprcgarxyo:
            rwodjjxggk, eomfqayjio, dist = tprcgarxyo.popleft()
            if jvjoqrobnh >= 0 and dist >= jvjoqrobnh:
                continue
            for dx, dy in ldhfqdxodk:
                for knvlfntsrc in self.muocdhlsktl.get((rwodjjxggk + dx, eomfqayjio + dy), []):
                    if kvopzbcqlw(knvlfntsrc):
                        iywtkgmtdb(knvlfntsrc)
        return result

    # Readability v3: structural flow; klmsuijofik.wwkbcxznzg:3060-3062
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wwkbcxznzg(self, wjhktyviqv: str | list[str]) -> list[ogtmlfjejir]:
        ojvrdstlwc = {wjhktyviqv} if isinstance(wjhktyviqv, str) else set(wjhktyviqv)
        return [p for p in self.yppbwwgbrca if p.hfzscdtvlfu in ojvrdstlwc]

    # Readability v3: structural flow; klmsuijofik.fkkiquagjt:3064-3080
    # Explicit 11-statement structural flow below; 4 conditions, 2 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def fkkiquagjt(
        self,
        knnkmdtpar: ogtmlfjejir,
        htbzmneixh: list[tuple[int, int]],
        rnbteqhnrx: list[tuple[int, int]],
    ) -> None:
        for iqogrbwzwz in htbzmneixh:
            if iqogrbwzwz in self.muocdhlsktl:
                weynwhuzfv = self.muocdhlsktl[iqogrbwzwz]
                if knnkmdtpar in weynwhuzfv:
                    weynwhuzfv.remove(knnkmdtpar)
                if not weynwhuzfv:
                    del self.muocdhlsktl[iqogrbwzwz]
        for iqogrbwzwz in rnbteqhnrx:
            if iqogrbwzwz not in self.muocdhlsktl:
                self.muocdhlsktl[iqogrbwzwz] = []
            self.muocdhlsktl[iqogrbwzwz].append(knnkmdtpar)

    # Readability v3: structural flow; klmsuijofik.esktperyuto:3082-3096
    # Explicit 14-statement structural flow below; 2 conditions, 3 loops, 6 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def esktperyuto(self) -> None:
        """."""
        tvmqicdyka = [oggaqczbug for oggaqczbug in self.esishrsguis if isinstance(oggaqczbug, ogtmlfjejir)]
        agfskyqner = set(tvmqicdyka)
        for knvlfntsrc in self.yppbwwgbrca:
            if knvlfntsrc not in agfskyqner:
                knvlfntsrc.hilopxwoqvn = None
        self.yppbwwgbrca = tvmqicdyka
        self.muocdhlsktl.clear()
        for knvlfntsrc in self.yppbwwgbrca:
            knvlfntsrc.hilopxwoqvn = self
            for iqogrbwzwz in knvlfntsrc.uafphpbluk:
                if iqogrbwzwz not in self.muocdhlsktl:
                    self.muocdhlsktl[iqogrbwzwz] = []
                self.muocdhlsktl[iqogrbwzwz].append(knvlfntsrc)

    # Readability v3: structural flow; klmsuijofik.satosvvjtu:3098-3142
    # Explicit 28-statement structural flow below; 4 conditions, 6 loops, 12 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def satosvvjtu(self) -> None:
        mycafmfscyz, rfbmxxrnrwi, lcsducsxuc = (
            self.iizrktmmpmf.mycafmfscyz,
            self.iizrktmmpmf.rfbmxxrnrwi,
            self.iizrktmmpmf.lcsducsxuc,
        )
        safsgkyfni = {key: i for i, chzlkkpfus in enumerate(lcsducsxuc) for key in chzlkkpfus}
        dzneuxbbex: dict[int, list[tuple[int, int, str]]] = {i: [] for i in range(len(lcsducsxuc))}
        jwsxbiklfm: dict[str, list[tuple[int, int]]] = {}
        for ehzrtqfolt, muciemydvy in enumerate(mycafmfscyz):
            for tfdqpnauaa, dvxihtkuao in enumerate(muciemydvy):
                if dvxihtkuao not in rfbmxxrnrwi:
                    continue
                for wohbwjqfhj in rfbmxxrnrwi[dvxihtkuao]:
                    nytzzntxfo = safsgkyfni.get(wohbwjqfhj)
                    if nytzzntxfo is not None:
                        dzneuxbbex[nytzzntxfo].append((tfdqpnauaa, ehzrtqfolt, wohbwjqfhj))
                    else:
                        jwsxbiklfm.setdefault(wohbwjqfhj, []).append((tfdqpnauaa, ehzrtqfolt))

        # Readability v3: structural flow; klmsuijofik.satosvvjtu.xzqfqjamhd:3118-3127
        # Explicit 7-statement structural flow below; 1 conditions, 0 loops, 4 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
        def xzqfqjamhd(
            ngfvpazrfa: list[tuple[int, int]],
        ) -> tuple[list[tuple[int, int]], tuple[int, int]]:
            if not ngfvpazrfa:
                return ([], (0, 0))
            min_x = min((x for x, gohymndfda in ngfvpazrfa))
            min_y = min((y for gohymndfda, y in ngfvpazrfa))
            mlvizzjkoh = (min_x, min_y)
            normalized = [(x - min_x, y - min_y) for x, y in ngfvpazrfa]
            return (normalized, mlvizzjkoh)

        for nytzzntxfo, uafphpbluk in dzneuxbbex.items():
            if uafphpbluk:
                mjlwevklgy = uafphpbluk[0][2]
                hrlzbohbpn, mlvizzjkoh = xzqfqjamhd([(i[0], i[1]) for i in uafphpbluk])
                knvlfntsrc = ogtmlfjejir(mjlwevklgy, hrlzbohbpn, name=mjlwevklgy)
                knvlfntsrc.qumspquyus = mlvizzjkoh
                self.slaslqzwus(knvlfntsrc)
        for wohbwjqfhj, zbldkpwajq in jwsxbiklfm.items():
            if zbldkpwajq:
                for rczgvgfsfb in zbldkpwajq:
                    hrlzbohbpn, mlvizzjkoh = xzqfqjamhd([rczgvgfsfb])
                    knvlfntsrc = ogtmlfjejir(wohbwjqfhj, hrlzbohbpn, name=wohbwjqfhj)
                    knvlfntsrc.qumspquyus = mlvizzjkoh
                    self.slaslqzwus(knvlfntsrc)


# Readability v3: return_expression; rsazrqsrdc:3145-3146
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def rsazrqsrdc() -> list[tuple[int, int]]:
    return [(0, 0)]


# Readability v3: return_expression; qvyuqqyhsg:3149-3150
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def qvyuqqyhsg() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0)]


# Readability v3: return_expression; cpggsveopu:3153-3154
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def cpggsveopu() -> list[tuple[int, int]]:
    return [(0, 0), (0, 1)]


# Readability v3: return_expression; encxuqcqbi:3157-3158
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def encxuqcqbi() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0), (2, 0)]


# Readability v3: return_expression; toapsgbeqv:3161-3162
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def toapsgbeqv() -> list[tuple[int, int]]:
    return [(0, 0), (0, 1), (1, 1)]


# Readability v3: return_expression; prnhqemrau:3165-3166
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def prnhqemrau() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0), (2, 0), (3, 0)]


# Readability v3: return_expression; mllqyflwxz:3169-3170
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def mllqyflwxz() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0), (0, 1), (1, 1)]


# Readability v3: return_expression; mqejcjmozr:3173-3174
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def mqejcjmozr() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0), (2, 0), (1, 1)]


# Readability v3: return_expression; aqkbgdwfxo:3177-3178
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def aqkbgdwfxo() -> list[tuple[int, int]]:
    return [(1, 0), (2, 0), (0, 1), (1, 1)]


# Readability v3: return_expression; bckhkodkgo:3181-3182
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def bckhkodkgo() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0), (1, 1), (2, 1)]


# Readability v3: return_expression; mxilurufyh:3185-3186
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def mxilurufyh() -> list[tuple[int, int]]:
    return [(0, 0), (0, 1), (1, 1), (2, 1)]


# Readability v3: return_expression; ayfuevhhmn:3189-3190
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def ayfuevhhmn() -> list[tuple[int, int]]:
    return [(2, 0), (0, 1), (1, 1), (2, 1)]


# Readability v3: return_expression; zhztuaixsi:3193-3194
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def zhztuaixsi(hrlzbohbpn: list[tuple[int, int]]) -> list[tuple[int, int]]:
    return [(dy, -dx) for dx, dy in hrlzbohbpn]


# Readability v3: return_expression; xaekcgbrgm:3197-3198
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def xaekcgbrgm(hrlzbohbpn: list[tuple[int, int]]) -> list[tuple[int, int]]:
    return [(-dy, dx) for dx, dy in hrlzbohbpn]


# Readability v3: structural flow; ystljobzqk:3201-3208
# Explicit 4-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def ystljobzqk(hrlzbohbpn: list[tuple[int, int]]) -> list[tuple[int, int]]:
    if not hrlzbohbpn:
        return hrlzbohbpn
    min_x, min_y = (
        min((dx for dx, dy in hrlzbohbpn)),
        min((dy for dx, dy in hrlzbohbpn)),
    )
    return [(dx - min_x, dy - min_y) for dx, dy in hrlzbohbpn]


# Readability v3: return_expression; nixsubqape:3211-3212
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def nixsubqape(uqsdkhdjpf: list[str], dvxihtkuao: str = "x") -> list[tuple[int, int]]:
    return [(x, y) for y, muciemydvy in enumerate(uqsdkhdjpf) for x, wzxzzaivzk in enumerate(muciemydvy) if wzxzzaivzk == dvxihtkuao]


juncjzxjlh = -1
(
    jptccilwmwb,
    ukuxzpvwbbu,
    hkcbifurafa,
    mxsayyrckip,
    jbcokmcidsu,
    nplbvxmrmhi,
    zeqbstdurps,
    jxvlozlzspz,
    vxglugsbmzk,
    qtzthuktsgl,
    jltzfsatusf,
    natvcboyxnk,
    hvjhuuithlv,
    zjcxzxeiygz,
    qpnittddyjx,
    ebbemwaevan,
) = range(16)
ymmwcccrhb = {
    "qclfkhjnaac": yvohraktjn(
        [".......", ".oxxxo.", ".xxxxx.", ".xxxxx.", ".xxxxx.", ".oxxxo.", "......."],
        {"x": qpnittddyjx, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "qclfkhjnaac"},
    ),
    "fijhgcrvsfx": yvohraktjn(
        ["       ", " ..... ", " .xxx. ", " .xxx. ", " .xxx. ", " ..... ", "       "],
        {"x": qpnittddyjx, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "qclfkhjnaac"},
    ),
    "ucflxtuuxln": yvohraktjn(
        ["       ", "       ", "  ...  ", "  .x.  ", "  ...  ", "       ", "       "],
        {"x": qpnittddyjx, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "qclfkhjnaac"},
    ),
    "xqapkpdjuet": yvohraktjn(
        ["       ", "       ", "       ", "   .   ", "       ", "       ", "       "],
        {"x": qpnittddyjx, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "qclfkhjnaac"},
    ),
    "lrpkmzabbfa": yvohraktjn(
        [".......", ".oxxxo.", ".xxxxx.", ".xxxxx.", ".xxxxx.", ".oxxxo.", "......."],
        {"x": vxglugsbmzk, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "lrpkmzabbfa"},
    ),
    "ebjoowkheai": yvohraktjn(
        ["       ", " ..... ", " .xxx. ", " .xxx. ", " .xxx. ", " ..... ", "       "],
        {"x": vxglugsbmzk, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "lrpkmzabbfa"},
    ),
    "gnqvqkdqlpt": yvohraktjn(
        ["       ", "       ", "  ...  ", "  .x.  ", "  ...  ", "       ", "       "],
        {"x": vxglugsbmzk, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "lrpkmzabbfa"},
    ),
    "ippnakjmssl": yvohraktjn(
        ["       ", "       ", "       ", "   .   ", "       ", "       ", "       "],
        {"x": vxglugsbmzk, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "lrpkmzabbfa"},
    ),
    "yuuqpmlxorv": yvohraktjn(
        [".......", ".oxxxo.", ".xxxxx.", ".xxxxx.", ".xxxxx.", ".oxxxo.", "......."],
        {"x": hvjhuuithlv, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 9, "name": "yuuqpmlxorv"},
    ),
    "oonshderxef": yvohraktjn(
        [".......", "..xxx..", ".xoxox.", ".xxoxx.", ".xoxox.", "..xxx..", "......."],
        {"o": hvjhuuithlv},
        {"layer": 9, "name": "oonshderxef"},
    ),
    "txjcfisalqu": yvohraktjn(
        ["       ", " o...o ", " .xxx. ", " .xxx. ", " .xxx. ", " o...o ", "       "],
        {"x": hvjhuuithlv, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "yuuqpmlxorv"},
    ),
    "cvkgqlojfnh": yvohraktjn(
        ["       ", " o   o ", "  ...  ", "  .x.  ", "  ...  ", " o   o ", "       "],
        {"x": hvjhuuithlv, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "yuuqpmlxorv"},
    ),
    "ltorejwifje": yvohraktjn(
        ["       ", " o   o ", "       ", "   .   ", "       ", " o   o ", "       "],
        {"x": hvjhuuithlv, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "yuuqpmlxorv"},
    ),
    "xcjjwqfzjfe": yvohraktjn(
        ["xxxxxxx", "xxoxxxx", "xxxxxxx", "xxxxxxx", "xoxxxxx", "xxxxoxx", "xxxxxxx"],
        {"x": nplbvxmrmhi, "o": mxsayyrckip},
        {"layer": 10, "name": "xcjjwqfzjfe"},
    ),
    "etlsaqqtjvn": yvohraktjn(
        [".......", ".oxxxo.", ".xxxxx.", ".xxxxx.", ".xxxxx.", ".oxxxo.", "......."],
        {"x": ebbemwaevan, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "etlsaqqtjvn"},
    ),
    "wpulgmixnbz": yvohraktjn(
        ["       ", " ..... ", " .xxx. ", " .xxx. ", " .xxx. ", " ..... ", "       "],
        {"x": ebbemwaevan, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "etlsaqqtjvn"},
    ),
    "hihodtibubm": yvohraktjn(
        ["       ", "       ", "  ...  ", "  .x.  ", "  ...  ", "       ", "       "],
        {"x": ebbemwaevan, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "etlsaqqtjvn"},
    ),
    "yxaxjsryovv": yvohraktjn(
        ["       ", "       ", "       ", "   .   ", "       ", "       ", "       "],
        {"x": ebbemwaevan, "o": mxsayyrckip, ".": nplbvxmrmhi},
        {"layer": 10, "name": "etlsaqqtjvn"},
    ),
    "player_right": yvohraktjn(
        ["  ... ", " ..x..", " .xxr.", " .xxr.", " ..x..", "  ... ", "       "],
        {"x": qtzthuktsgl, "o": mxsayyrckip, ".": nplbvxmrmhi, "r": natvcboyxnk},
        {"layer": 11, "name": "player_right"},
    ),
    "player_left": yvohraktjn(
        ["  ... ", " ..x..", " .rxx.", " .rxx.", " ..x..", "  ... ", "       "],
        {"x": qtzthuktsgl, "o": mxsayyrckip, ".": nplbvxmrmhi, "r": natvcboyxnk},
        {"layer": 11, "name": "player_left"},
    ),
    "player_right_0": yvohraktjn(
        ["      ", "   .  ", "  .x. ", "  .x. ", "   .  ", "      ", "       "],
        {"x": qtzthuktsgl, "o": mxsayyrckip, ".": nplbvxmrmhi, "r": natvcboyxnk},
        {"layer": 11, "name": "player_right"},
    ),
    "player_right_1": yvohraktjn(
        ["      ", "      ", "   .  ", "   .  ", "      ", "      ", "       "],
        {"x": qtzthuktsgl, "o": mxsayyrckip, ".": nplbvxmrmhi, "r": natvcboyxnk},
        {"layer": 11, "name": "player_right"},
    ),
    "player_right_2": yvohraktjn(
        ["      ", "      ", "      ", "      ", "      ", "      ", "       "],
        {"x": qtzthuktsgl, "o": mxsayyrckip, ".": nplbvxmrmhi, "r": natvcboyxnk},
        {"layer": 11, "name": "player_right"},
    ),
    "player_left_0": yvohraktjn(
        ["      ", "   .  ", "  .x. ", "  .x. ", "   .  ", "      ", "       "],
        {"x": qtzthuktsgl, "o": mxsayyrckip, ".": nplbvxmrmhi, "r": natvcboyxnk},
        {"layer": 11, "name": "player_left"},
    ),
    "player_left_1": yvohraktjn(
        ["      ", "      ", "      ", "      ", "      ", "      ", "       "],
        {"x": qtzthuktsgl, "o": mxsayyrckip, ".": nplbvxmrmhi, "r": natvcboyxnk},
        {"layer": 11, "name": "player_left"},
    ),
    "ubhhgljbnpu": yvohraktjn(
        [" ooooo", " oxrxo", " o...o", " o...o", " o...o", " o...o", "       "][::-1],
        {"x": natvcboyxnk, "o": nplbvxmrmhi, ".": ebbemwaevan, "r": jptccilwmwb},
        {"layer": 10, "name": "ubhhgljbnpu"},
    ),
    "hzusueifitk": yvohraktjn(
        [" ooooo", " oxrxo", " o...o", " o...o", " o...o", " o...o", "       "],
        {"x": natvcboyxnk, "o": nplbvxmrmhi, ".": ebbemwaevan, "r": jptccilwmwb},
        {"layer": 10, "name": "ubhhgljbnpu"},
    ),
    "aknlbboysnc": yvohraktjn(
        [".ooooo", "..oo.o", "......", " .... ", "      ", "      ", "      "][::-1],
        {"o": ebbemwaevan, ".": nplbvxmrmhi},
        {"layer": 12, "name": "aknlbboysnc"},
    ),
    "jcyhkseuorf": yvohraktjn(
        ["oooo.o", "o.oooo", "o.o.oo", "o.o.oo", "o.oooo", "oooo.o", "oooo.o"][::-1],
        {"o": ebbemwaevan, ".": nplbvxmrmhi},
        {"layer": 12, "name": "aknlbboysnc"},
    ),
    "fjlzdjxhant": yvohraktjn(
        ["  ... ", " ..x..", " .xxx.", " ..x..", "  ... ", "      ", "      "],
        {"x": jxvlozlzspz, "o": mxsayyrckip, ".": nplbvxmrmhi, "r": natvcboyxnk},
        {"layer": 9, "name": "fjlzdjxhant"},
    ),
}
tjdtolkmxo = {
    "grid1": qipeamczaw(
        [
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "mmmmmmmmmmm",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo n     oo",
            "ooooooo ooo",
            "oo       oo",
            "oo       oo",
            "oooooxxxxoo",
            "ooooo    oo",
            "ooxxx    oo",
            "ooxxx    oo",
            "ooxxxoooooo",
            "oo       oo",
            "oo       oo",
            "oo  xxx  oo",
            "oo       oo",
            "oo       oo",
            "oooooxxxooo",
            "oo       oo",
            "oo +     oo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
        ][::-1],
        {
            "x": ["qclfkhjnaac"],
            "o": ["xcjjwqfzjfe"],
            "n": ["player_right"],
            "v": ["ubhhgljbnpu"],
            "m": ["aknlbboysnc"],
            "w": ["jcyhkseuorf"],
            "+": ["fjlzdjxhant"],
        },
        {"vxruyoesvkf": (6, 6)},
        {"jibupgvgfzf": [["xcjjwqfzjfe"], ["aknlbboysnc"], ["jcyhkseuorf"]]},
    ),
    "grid2": qipeamczaw(
        [
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "mmmmmmmmmmm",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo n     oo",
            "ooxxxxxxxoo",
            "ooxxxxxxxoo",
            "oo   o   oo",
            "oo   o   oo",
            "oovvvo   oo",
            "oooooo   oo",
            "ooxxxx   oo",
            "ooxxxx   oo",
            "ooxoooxxxoo",
            "oo       oo",
            "oo       oo",
            "oo    vvvoo",
            "oooooxooooo",
            "oooooxooooo",
            "oo       oo",
            "oo      voo",
            "ooxxxoooooo",
            "oo       oo",
            "oov vvvvvoo",
            "oooxooooooo",
            "oooxxxxxxoo",
            "oooxooooxoo",
            "oooxooooxoo",
            "oo       oo",
            "oovvv    oo",
            "ooooo    oo",
            "oo     xxoo",
            "ooxxxxxxxoo",
            "oo       oo",
            "oo   +vvvoo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
        ][::-1],
        {
            "x": ["qclfkhjnaac"],
            "o": ["xcjjwqfzjfe"],
            "n": ["player_right"],
            "v": ["ubhhgljbnpu"],
            "m": ["aknlbboysnc"],
            "w": ["jcyhkseuorf"],
            "+": ["fjlzdjxhant"],
        },
        {"vxruyoesvkf": (6, 6)},
        {"jibupgvgfzf": [["xcjjwqfzjfe"], ["aknlbboysnc"], ["jcyhkseuorf"], ["ubhhgljbnpu"]]},
    ),
    "grid3": qipeamczaw(
        [
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "wwwwwwwwwww",
            "mmmmmmmmmmm",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo   1   oo",
            "oo n 1   oo",
            "ooooooxxxoo",
            "oo       oo",
            "oo       oo",
            "oo       oo",
            "oo 222ooooo",
            "oo       oo",
            "oo vvvv  oo",
            "oo oooo  oo",
            "oo       oo",
            "ooo  11  oo",
            "ooooo22  oo",
            "ooooovv  oo",
            "ooooooo  oo",
            "oo       oo",
            "oo       oo",
            "oo11222oooo",
            "oo     oooo",
            "oo  vvvoooo",
            "oo  ooooooo",
            "oo   1   oo",
            "oo   1 + oo",
            "oo1111111oo",
            "oo       oo",
            "oovvvvvvvoo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
        ][::-1],
        {
            "x": ["qclfkhjnaac"],
            "1": ["yuuqpmlxorv"],
            "2": ["oonshderxef"],
            "o": ["xcjjwqfzjfe"],
            "n": ["player_right"],
            "v": ["ubhhgljbnpu"],
            "m": ["aknlbboysnc"],
            "w": ["jcyhkseuorf"],
            "+": ["fjlzdjxhant"],
        },
        {"vxruyoesvkf": (6, 6)},
        {"jibupgvgfzf": [["xcjjwqfzjfe"], ["aknlbboysnc"], ["jcyhkseuorf"], ["ubhhgljbnpu"]]},
    ),
    "grid4": qipeamczaw(
        [
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "oooogoooooo",
            "ooooooooooo",
            "oo       oo",
            "oo       oo",
            "oo  +    oo",
            "oo       oo",
            "oovv vv  oo",
            "oooooooxxoo",
            "ooogogoxxoo",
            "ooooooo  oo",
            "oo    o  oo",
            "oo       oo",
            "oo   xxxxoo",
            "oo       oo",
            "ooxxooooooo",
            "oo       oo",
            "oo       oo",
            "oovvn    oo",
            "oooooo   oo",
            "ooooooo  oo",
            "oooooooo oo",
            "oo       oo",
            "oo       oo",
            "ooooooooooo",
            "ooooogooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
        ][::-1],
        {
            "x": ["qclfkhjnaac"],
            "g": ["lrpkmzabbfa"],
            "1": ["yuuqpmlxorv"],
            "2": ["oonshderxef"],
            "o": ["xcjjwqfzjfe"],
            "n": ["player_right"],
            "v": ["ubhhgljbnpu"],
            "m": ["aknlbboysnc"],
            "w": ["jcyhkseuorf"],
            "+": ["fjlzdjxhant"],
            "u": ["hzusueifitk"],
        },
        {"vxruyoesvkf": (6, 6)},
        {
            "jibupgvgfzf": [
                ["xcjjwqfzjfe"],
                ["aknlbboysnc"],
                ["jcyhkseuorf"],
                ["ubhhgljbnpu"],
                ["hzusueifitk"],
            ]
        },
    ),
    "grid5": qipeamczaw(
        [
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "oooooooogoo",
            "ooouuoooooo",
            "ooo  oooooo",
            "oooxxoooooo",
            "ooo  oooooo",
            "ooo     ooo",
            "oo        o",
            "oo        o",
            "oo 22oooxxo",
            "oo vvoxx  o",
            "oo ooo    o",
            "oo ooo  vvo",
            "oo      ooo",
            "ooooooxxooo",
            "oooooo  ooo",
            "oouuuu  ooo",
            "oo      ooo",
            "oo n    g o",
            "ooooooooo o",
            "ooooooooo o",
            "oooo   xxxo",
            "oooo   xxxo",
            "oooo + vvvo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
        ][::-1],
        {
            "x": ["qclfkhjnaac"],
            "g": ["lrpkmzabbfa"],
            "1": ["yuuqpmlxorv"],
            "2": ["oonshderxef"],
            "o": ["xcjjwqfzjfe"],
            "n": ["player_right"],
            "v": ["ubhhgljbnpu"],
            "u": ["hzusueifitk"],
            "m": ["aknlbboysnc"],
            "w": ["jcyhkseuorf"],
            "+": ["fjlzdjxhant"],
        },
        {"vxruyoesvkf": (6, 6)},
        {
            "jibupgvgfzf": [
                ["xcjjwqfzjfe"],
                ["aknlbboysnc"],
                ["jcyhkseuorf"],
                ["ubhhgljbnpu"],
                ["hzusueifitk"],
            ]
        },
    ),
    "grid6": qipeamczaw(
        [
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "o + g    oo",
            "o   o    oo",
            "oooooooo oo",
            "oooooooo oo",
            "oooooooo oo",
            "oouuuuuu oo",
            "oo    22 oo",
            "oo       oo",
            "oo n     oo",
            "oooooogoooo",
            "oo       oo",
            "oo222ooo oo",
            "oo     o oo",
            "oovvv    oo",
            "oooooo oooo",
            "oooooo oooo",
            "oouuuu   oo",
            "oo       oo",
            "oo2222122oo",
            "oo       oo",
            "oo       oo",
            "oooo vvvvoo",
            "oooo oooooo",
            "oooo     oo",
            "ooooooo  oo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "oooooooogoo",
            "ooooooooooo",
        ][::-1],
        {
            "x": ["qclfkhjnaac"],
            "g": ["lrpkmzabbfa"],
            "1": ["yuuqpmlxorv"],
            "2": ["oonshderxef"],
            "o": ["xcjjwqfzjfe"],
            "n": ["player_right"],
            "v": ["ubhhgljbnpu"],
            "u": ["hzusueifitk"],
            "m": ["aknlbboysnc"],
            "w": ["jcyhkseuorf"],
            "+": ["fjlzdjxhant"],
        },
        {"vxruyoesvkf": (6, 6)},
        {
            "jibupgvgfzf": [
                ["xcjjwqfzjfe"],
                ["aknlbboysnc"],
                ["jcyhkseuorf"],
                ["ubhhgljbnpu"],
                ["hzusueifitk"],
            ]
        },
    ),
    "grid7": qipeamczaw(
        [
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "go   oooooo",
            "go   oo   o",
            "go + oo o o",
            "go      u o",
            "go        o",
            "gooooooo  o",
            "go    2o  o",
            "go        o",
            "go n  2o  o",
            "gooooooo  o",
            "go u222u  o",
            "go  222   o",
            "go  222   o",
            "go o222 o o",
            "go o222 o o",
            "go oooooo o",
            "go 2 u uo o",
            "go 2 1 2o o",
            "go 22 12o o",
            "go 2v v2o o",
            "goooooo2  o",
            "goooooo2  o",
            "goooooo2o o",
            "ooooooo2ovo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
        ][::-1],
        {
            "x": ["qclfkhjnaac"],
            "g": ["lrpkmzabbfa"],
            "1": ["yuuqpmlxorv"],
            "2": ["oonshderxef"],
            "o": ["xcjjwqfzjfe"],
            "n": ["player_right"],
            "v": ["ubhhgljbnpu"],
            "u": ["hzusueifitk"],
            "m": ["aknlbboysnc"],
            "w": ["jcyhkseuorf"],
            "+": ["fjlzdjxhant"],
        },
        {"vxruyoesvkf": (6, 6)},
        {
            "jibupgvgfzf": [
                ["xcjjwqfzjfe"],
                ["aknlbboysnc"],
                ["jcyhkseuorf"],
                ["ubhhgljbnpu"],
                ["hzusueifitk"],
            ]
        },
    ),
    "grid8": qipeamczaw(
        [
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "o         o",
            "o         o",
            "o  n      o",
            "ooooo   ooo",
            "o         o",
            "o y       o",
            "o         o",
            "ovvvvvvv  o",
            "oooooooo  o",
            "o      1  o",
            "o      oooo",
            "o         o",
            "o111111111o",
            "o         o",
            "o      oooo",
            "o      o +o",
            "o  y   o1oo",
            "o         o",
            "o         o",
            "o         o",
            "o         o",
            "o         o",
            "o         o",
            "o         o",
            "ov       vo",
            "oov     voo",
            "ooov   vooo",
            "oooo   oooo",
            "oooovvvoooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooogooooo",
            "ooooooooooo",
            "ooooooooooo",
        ][::-1],
        {
            "x": ["qclfkhjnaac"],
            "y": ["etlsaqqtjvn"],
            "g": ["lrpkmzabbfa"],
            "1": ["yuuqpmlxorv"],
            "2": ["oonshderxef"],
            "o": ["xcjjwqfzjfe"],
            "n": ["player_right"],
            "v": ["ubhhgljbnpu"],
            "u": ["hzusueifitk"],
            "m": ["aknlbboysnc"],
            "w": ["jcyhkseuorf"],
            "+": ["fjlzdjxhant"],
        },
        {"vxruyoesvkf": (6, 6)},
        {
            "jibupgvgfzf": [
                ["xcjjwqfzjfe"],
                ["aknlbboysnc"],
                ["jcyhkseuorf"],
                ["ubhhgljbnpu"],
                ["hzusueifitk"],
            ]
        },
    ),
    "grid9": qipeamczaw(
        [
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "  + ooooooo",
            "    ooooooo",
            " oooooooooo",
            " o        o",
            " o        o",
            "go n      o",
            " oooo   ooo",
            "go        o",
            " o        o",
            " o    y   o",
            " o        o",
            " o        o",
            " o        o",
            " o   vvvvvo",
            " oxxxoooooo",
            "go   ouuuuo",
            " o   o    o",
            " o   o    o",
            " o   o  o o",
            "go      o o",
            " o      o o",
            "govvvvvvo o",
            " oooooooo o",
            " ouuuuuuu o",
            " o        o",
            "go11111111o",
            " o        o",
            " o  x     o",
            " o        o",
            " o        o",
            " o        o",
            " o        o",
            " x     y  o",
            " o        o",
            "oovvvvvvvvo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ogggggggggo",
            "ooooooooooo",
        ][::-1],
        {
            "x": ["qclfkhjnaac"],
            "y": ["etlsaqqtjvn"],
            "g": ["lrpkmzabbfa"],
            "1": ["yuuqpmlxorv"],
            "2": ["oonshderxef"],
            "o": ["xcjjwqfzjfe"],
            "n": ["player_right"],
            "v": ["ubhhgljbnpu"],
            "u": ["hzusueifitk"],
            "m": ["aknlbboysnc"],
            "w": ["jcyhkseuorf"],
            "+": ["fjlzdjxhant"],
        },
        {"vxruyoesvkf": (6, 6)},
        {
            "jibupgvgfzf": [
                ["xcjjwqfzjfe"],
                ["aknlbboysnc"],
                ["jcyhkseuorf"],
                ["ubhhgljbnpu"],
                ["hzusueifitk"],
            ]
        },
    ),
    "grid10": qipeamczaw(
        [
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ogggggggggo",
            "ooooooooooo",
            "ooooogooooo",
            "ooooooooooo",
            "          o",
            "n o       o",
            "o o       o",
            "  ovv   vvo",
            "  ooo   ooo",
            " oo       o",
            "  o       o",
            "  o  vvv  o",
            "o o  ooo  o",
            "  o       o",
            "  o       o",
            " oo       o",
            "  o       o",
            "  ovvvvv  o",
            "o oooooo  o",
            "  ouuuuu  o",
            "  o       o",
            " oo       o",
            "  o   vvvvo",
            "  o   ooooo",
            "o o   uuuuo",
            "  o       o",
            "  o       o",
            " oo    y  o",
            "  o       o",
            "ooovvvv vvo",
            "ooooooo1ooo",
            "oooo    ooo",
            "oooo +  ooo",
            "ooooooooooo",
            "ogggggggggo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
            "ooooooooooo",
        ][::-1],
        {
            "x": ["qclfkhjnaac"],
            "y": ["etlsaqqtjvn"],
            "g": ["lrpkmzabbfa"],
            "1": ["yuuqpmlxorv"],
            "2": ["oonshderxef"],
            "o": ["xcjjwqfzjfe"],
            "n": ["player_right"],
            "v": ["ubhhgljbnpu"],
            "u": ["hzusueifitk"],
            "m": ["aknlbboysnc"],
            "w": ["jcyhkseuorf"],
            "+": ["fjlzdjxhant"],
        },
        {"vxruyoesvkf": (6, 6)},
        {
            "jibupgvgfzf": [
                ["xcjjwqfzjfe"],
                ["aknlbboysnc"],
                ["jcyhkseuorf"],
                ["ubhhgljbnpu"],
                ["hzusueifitk"],
            ]
        },
    ),
}


class uakietkqfso(yodvybvftxa):
    qswcochjodb: int
    twdpowducb: ogtmlfjejir
    ybmkdxbdko: bool
    wjidupyeoa: int
    vivnprldht: bool
    hdnrlfmyrj: klmsuijofik

    # Readability v3: structural flow; uakietkqfso.ruarvcqajl:4040-4050
    # Explicit 10-statement structural flow below; 0 conditions, 0 loops, 8 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ruarvcqajl(self) -> None:
        self.izrhgsjsau(ymmwcccrhb)
        self.ybmkdxbdko = True
        self.wjidupyeoa = 0
        self.vivnprldht = True
        hdnrlfmyrj = klmsuijofik(tjdtolkmxo[f"grid{self.qswcochjodb}"], ymmwcccrhb, name=f"level{self.qswcochjodb}")
        self.add(hdnrlfmyrj)
        self.hdnrlfmyrj = hdnrlfmyrj
        twdpowducb = self.hdnrlfmyrj.wwkbcxznzg("player_right")[0]
        self.twdpowducb = twdpowducb
        self.camera.rczgvgfsfb = (0, self.twdpowducb.grid_y * 6 - 31 - 5)

    # Readability v3: structural flow; uakietkqfso.mylefxfaev:4052-4075
    # Explicit 9-statement structural flow below; 2 conditions, 0 loops, 2 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def mylefxfaev(self) -> bool:
        if self.qswcochjodb > 3:
            return False
        if self.wjidupyeoa % 2 == 0:
            twmanpvduc = self.hdnrlfmyrj.wwkbcxznzg("aknlbboysnc")[0]
            mtbptkmjcw = self.hdnrlfmyrj.wwkbcxznzg("jcyhkseuorf")[0]
            twmanpvduc.wryqzerswl(
                urkteguwnke.zbumogozsz(
                    [
                        urkteguwnke.kcfrlhlcmz((0, -6), gqzoqxubafn=3),
                        urkteguwnke.zziytpcrcm(lambda: twmanpvduc.ubtuiotxcd(0, -1, True)),
                    ]
                )
            )
            mtbptkmjcw.wryqzerswl(
                urkteguwnke.zbumogozsz(
                    [
                        urkteguwnke.kcfrlhlcmz((0, -6), gqzoqxubafn=3),
                        urkteguwnke.zziytpcrcm(lambda: mtbptkmjcw.ubtuiotxcd(0, -1, True)),
                    ]
                )
            )
            return self.twdpowducb.qumspquyus[1] == twmanpvduc.qumspquyus[1]
        return False

    # Readability v3: structural flow; uakietkqfso.oreuzgjmdx:4077-4084
    # Explicit 7-statement structural flow below; 2 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def oreuzgjmdx(self, dx: int, dy: int) -> None:
        twthiyrdyu = dx > 0
        if twthiyrdyu != self.ybmkdxbdko:
            self.ybmkdxbdko = twthiyrdyu
            dwwshhedmq = f"player_{('right' if self.ybmkdxbdko else 'left')}"
            self.twdpowducb.set_offset_image((0, 0), dwwshhedmq)
        self.pywlvyklps(twthiyrdyu)
        pass

    # Readability v3: structural flow; uakietkqfso.pywlvyklps:4086-4209
    # Explicit 37-statement structural flow below; 13 conditions, 0 loops, 20 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def pywlvyklps(self, wwtdhotwwu: bool) -> None:
        self.wjidupyeoa += 1
        twdpowducb = self.twdpowducb
        dx = 1 if wwtdhotwwu else -1
        eylagpkfjn = (twdpowducb.qumspquyus[0] + dx, twdpowducb.qumspquyus[1])
        if eylagpkfjn[0] < 0:
            eylagpkfjn = (0, eylagpkfjn[1])
            kylnomcxty = ["xcjjwqfzjfe"]
        else:
            kylnomcxty = [i.name for i in self.hdnrlfmyrj.jhzcxkveiw(eylagpkfjn[0], eylagpkfjn[1])]
        if kylnomcxty == ["fjlzdjxhant"]:
            twdpowducb.uehpvffenq(eylagpkfjn[0], eylagpkfjn[1], False, True)
            self.wryqzerswl(urkteguwnke.zbumogozsz([urkteguwnke.ibogvfjvpy(10), urkteguwnke.zziytpcrcm(lambda: self.win())]))
            return
        if kylnomcxty == [] or kylnomcxty == ["oonshderxef"] or kylnomcxty == ["aknlbboysnc"] or (set(kylnomcxty) == {"aknlbboysnc", "oonshderxef"}):
            wkpljpfhtg, fallen_position, landed_on_gem, landed_on_spike = self.fsvnqdbzrp(eylagpkfjn)
            if wkpljpfhtg == 0:
                dgdqcysrwm = self.mylefxfaev()
                twdpowducb.ywotvcjnrc(eylagpkfjn[0], eylagpkfjn[1], False)
                twdpowducb.wryqzerswl(
                    urkteguwnke.rhsgpcfoey(
                        (eylagpkfjn[0] * 6, eylagpkfjn[1] * 6),
                        gqzoqxubafn=5,
                        yquwzzqlpv="skmykirpclw",
                    )
                )
                if dgdqcysrwm:
                    self.lose()
            else:
                twdpowducb.ywotvcjnrc(fallen_position[0], fallen_position[1], False)
                tprcybckbl = -5 if self.vivnprldht else 5
                bwojwnhqia = self.camera.rczgvgfsfb[1]
                sfazolancz = fallen_position[1] * 6 - 31 + tprcybckbl
                eaayxwmagh = min(20, abs((sfazolancz - bwojwnhqia) // 6) * 3)
                iwuohihxyl = min(20, 3 * wkpljpfhtg)
                bnbrbvsrvw = []
                if landed_on_spike:
                    otrvzlaiaa = ogtmlfjejir(
                        "player_right_0",
                        x=fallen_position[0],
                        y=fallen_position[1],
                        name="player",
                    )
                    uizhuofjzk = ogtmlfjejir(
                        "player_right_1",
                        x=fallen_position[0],
                        y=fallen_position[1],
                        name="player",
                    )
                    ylcjflzhgu = ogtmlfjejir(
                        "player_right_2",
                        x=fallen_position[0],
                        y=fallen_position[1],
                        name="player",
                    )
                    bnbrbvsrvw = [
                        urkteguwnke.zziytpcrcm(lambda: self.hdnrlfmyrj.curvanlgjj(twdpowducb)),
                        urkteguwnke.zziytpcrcm(lambda: self.hdnrlfmyrj.slaslqzwus(otrvzlaiaa)),
                        urkteguwnke.ibogvfjvpy(1),
                        urkteguwnke.zziytpcrcm(lambda: self.hdnrlfmyrj.curvanlgjj(otrvzlaiaa)),
                        urkteguwnke.zziytpcrcm(lambda: self.hdnrlfmyrj.slaslqzwus(uizhuofjzk)),
                        urkteguwnke.ibogvfjvpy(1),
                        urkteguwnke.zziytpcrcm(lambda: self.hdnrlfmyrj.curvanlgjj(uizhuofjzk)),
                        urkteguwnke.zziytpcrcm(lambda: self.hdnrlfmyrj.slaslqzwus(ylcjflzhgu)),
                        urkteguwnke.ibogvfjvpy(1),
                        urkteguwnke.zziytpcrcm(lambda: self.hdnrlfmyrj.curvanlgjj(ylcjflzhgu)),
                    ]
                self.wryqzerswl(
                    urkteguwnke.zbumogozsz(
                        [
                            urkteguwnke.fygfajisbn(
                                twdpowducb,
                                urkteguwnke.zbumogozsz(
                                    [
                                        urkteguwnke.rhsgpcfoey(
                                            (eylagpkfjn[0] * 6, eylagpkfjn[1] * 6),
                                            gqzoqxubafn=5,
                                            yquwzzqlpv="skmykirpclw",
                                        ),
                                        urkteguwnke.rhsgpcfoey(
                                            (
                                                fallen_position[0] * 6,
                                                fallen_position[1] * 6,
                                            ),
                                            gqzoqxubafn=iwuohihxyl,
                                            yquwzzqlpv="brsdwwrugbi",
                                        ),
                                    ]
                                    + bnbrbvsrvw
                                ),
                            ),
                            urkteguwnke.fygfajisbn(
                                self.camera,
                                urkteguwnke.zbumogozsz(
                                    [
                                        urkteguwnke.rhsgpcfoey(
                                            (
                                                0,
                                                fallen_position[1] * 6 - 31 + tprcybckbl,
                                            ),
                                            gqzoqxubafn=eaayxwmagh,
                                            yquwzzqlpv="brsdwwrugbi",
                                        ),
                                        urkteguwnke.ibogvfjvpy(5 if landed_on_gem else 0),
                                        urkteguwnke.zziytpcrcm(lambda: (self.win() if landed_on_gem else self.lose() if landed_on_spike else None)),
                                    ]
                                ),
                            ),
                        ]
                    )
                )
        else:
            dgdqcysrwm = self.mylefxfaev()
            twdpowducb.wryqzerswl(
                urkteguwnke.zbumogozsz(
                    [
                        urkteguwnke.kcfrlhlcmz((-1 * (1 if wwtdhotwwu else -1), 0), gqzoqxubafn=1),
                        urkteguwnke.kcfrlhlcmz((2 * (1 if wwtdhotwwu else -1), 0), gqzoqxubafn=1),
                        urkteguwnke.kcfrlhlcmz((-1 * (1 if wwtdhotwwu else -1), 0), gqzoqxubafn=1),
                    ]
                )
            )
            if dgdqcysrwm:
                self.lose()

    # Readability v3: find_fall_destination; uakietkqfso.fsvnqdbzrp:4211-4226
    # Scan gravity direction until support, goal or spikes, lines 4211-4226 [previous-source-reviewed]
    def fsvnqdbzrp(self, eylagpkfjn: tuple[int, int]) -> tuple[int, tuple[int, int], bool, bool]:
        dy = -1 if self.vivnprldht else 1
        wkpljpfhtg = 0
        udsicoryza = eylagpkfjn
        eylagpkfjn = (eylagpkfjn[0], eylagpkfjn[1] + dy)
        kylnomcxty = [i.name for i in self.hdnrlfmyrj.jhzcxkveiw(eylagpkfjn[0], eylagpkfjn[1])]
        while kylnomcxty == [] or kylnomcxty == ["oonshderxef"] or kylnomcxty == ["aknlbboysnc"] or (set(kylnomcxty) == {"aknlbboysnc", "oonshderxef"}):
            udsicoryza = eylagpkfjn
            eylagpkfjn = (eylagpkfjn[0], eylagpkfjn[1] + dy)
            kylnomcxty = [i.name for i in self.hdnrlfmyrj.jhzcxkveiw(eylagpkfjn[0], eylagpkfjn[1])]
            wkpljpfhtg += 1
        if kylnomcxty == ["fjlzdjxhant"]:
            return (wkpljpfhtg + 1, eylagpkfjn, True, False)
        if kylnomcxty == ["ubhhgljbnpu"] or kylnomcxty == ["hzusueifitk"]:
            return (wkpljpfhtg + 1, udsicoryza, False, True)
        return (wkpljpfhtg, udsicoryza, False, False)

    # Readability v3: no_op_body; uakietkqfso.uatdugrwtx:4228-4229
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def uatdugrwtx(self) -> None:
        pass

    # Readability v3: structural flow; uakietkqfso.pbsitubcfd:4231-4287
    # Explicit 30-statement structural flow below; 9 conditions, 0 loops, 14 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def pbsitubcfd(self, kojxiszwpx: tuple[int, int], qssroarxob: bool = False) -> urkteguwnke:
        vkgcawckds = self.twdpowducb.qumspquyus
        dy = -1 if self.vivnprldht else 1
        tprcybckbl = -5 if self.vivnprldht else 5
        eylagpkfjn = (vkgcawckds[0], vkgcawckds[1] + dy)
        if not qssroarxob:
            if kojxiszwpx != eylagpkfjn:
                return urkteguwnke.zziytpcrcm(lambda: None)
        dkmzzihsmh = [i.name for i in self.hdnrlfmyrj.jhzcxkveiw(eylagpkfjn[0], eylagpkfjn[1])]
        if "xcjjwqfzjfe" in dkmzzihsmh or (qssroarxob and ("lrpkmzabbfa" in dkmzzihsmh or "yuuqpmlxorv" in dkmzzihsmh or "qclfkhjnaac" in dkmzzihsmh or ("etlsaqqtjvn" in dkmzzihsmh))):
            return urkteguwnke.fygfajisbn(
                self.camera,
                urkteguwnke.zbumogozsz(
                    [
                        urkteguwnke.rhsgpcfoey(
                            (0, vkgcawckds[1] * 6 - 31 + tprcybckbl),
                            gqzoqxubafn=6,
                            yquwzzqlpv="brsdwwrugbi",
                        )
                    ]
                ),
            )
        wkpljpfhtg, fallen_position, landed_on_gem, landed_on_spike = self.fsvnqdbzrp(eylagpkfjn)
        wkpljpfhtg += 1
        self.twdpowducb.ywotvcjnrc(fallen_position[0], fallen_position[1], False)
        if landed_on_gem:
            self.win()
        elif landed_on_spike:
            self.lose()
        bwojwnhqia = self.camera.rczgvgfsfb[1]
        sfazolancz = fallen_position[1] * 6 - 31 + tprcybckbl
        eaayxwmagh = min(20, abs((sfazolancz - bwojwnhqia) // 6) * 3)
        cdsvinpulh: list[urkteguwnke] = [
            urkteguwnke.rhsgpcfoey(
                (0, fallen_position[1] * 6 - 31 + tprcybckbl),
                gqzoqxubafn=eaayxwmagh,
                yquwzzqlpv="brsdwwrugbi",
            )
        ]
        iwuohihxyl = min(20, 3 * wkpljpfhtg)
        fsvpawoecd: list[urkteguwnke] = [
            urkteguwnke.rhsgpcfoey(
                (fallen_position[0] * 6, fallen_position[1] * 6),
                gqzoqxubafn=iwuohihxyl,
                yquwzzqlpv="brsdwwrugbi",
            )
        ]
        if landed_on_gem:
            cdsvinpulh.append(urkteguwnke.ibogvfjvpy(5))
        elif landed_on_spike:
            givdkcwbif = urkteguwnke.fygfajisbn(
                self.twdpowducb,
                self.twdpowducb.hfaehnxuhf((0, 0), ["player_left_0", "player_left_1", "player_left_2"]),
            )
            fsvpawoecd.append(givdkcwbif)
        fsvpawoecd.append(urkteguwnke.fygfajisbn(self.camera, urkteguwnke.zbumogozsz(cdsvinpulh)))
        return urkteguwnke.zbumogozsz(fsvpawoecd)

    # Readability v3: structural flow; uakietkqfso.gwfodrkvzx:4289-4401
    # Explicit 33-statement structural flow below; 6 conditions, 1 loops, 16 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gwfodrkvzx(self, x: int, y: int) -> None:
        self.wjidupyeoa += 1
        kojxiszwpx = self.hdnrlfmyrj.hyntnfvpgl(x, y + self.camera.rczgvgfsfb[1])
        ugywcmguyv = self.hdnrlfmyrj.jhzcxkveiw(kojxiszwpx[0], kojxiszwpx[1])
        etipfuvgsl = [i.name for i in ugywcmguyv]
        if etipfuvgsl == ["qclfkhjnaac"]:
            knvlfntsrc = ugywcmguyv[0]
            knvlfntsrc.wryqzerswl(
                urkteguwnke.zbumogozsz(
                    [
                        knvlfntsrc.hfaehnxuhf((0, 0), ["fijhgcrvsfx", "ucflxtuuxln", "xqapkpdjuet"]),
                        urkteguwnke.zziytpcrcm(lambda: self.hdnrlfmyrj.curvanlgjj(knvlfntsrc)),
                        urkteguwnke.fygfajisbn(self.twdpowducb, self.pbsitubcfd(kojxiszwpx)),
                    ]
                )
            )
        elif etipfuvgsl == ["etlsaqqtjvn"]:
            knvlfntsrc = ugywcmguyv[0]
            hslpsqofmc = []
            for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                lchdfkjfyo = knvlfntsrc.grid_x + dx
                gxuwmnjdmh = knvlfntsrc.grid_y + dy
                if self.hdnrlfmyrj.jhzcxkveiw(lchdfkjfyo, gxuwmnjdmh) == []:
                    sfwygehfog = ogtmlfjejir(
                        vxgikutplyz="yxaxjsryovv",
                        x=lchdfkjfyo,
                        y=gxuwmnjdmh,
                        name="etlsaqqtjvn",
                    )
                    self.hdnrlfmyrj.slaslqzwus(sfwygehfog)
                    hslpsqofmc.append(sfwygehfog)

            # Readability v3: structural flow; uakietkqfso.gwfodrkvzx.vtxzvpvawg:4321-4323
            # Explicit 2-statement structural flow below; 0 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
            def vtxzvpvawg() -> None:
                for sfwygehfog in hslpsqofmc:
                    sfwygehfog.set_offset_image((0, 0), "hihodtibubm")

            # Readability v3: structural flow; uakietkqfso.gwfodrkvzx.ywyxibnhor:4325-4327
            # Explicit 2-statement structural flow below; 0 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
            def ywyxibnhor() -> None:
                for sfwygehfog in hslpsqofmc:
                    sfwygehfog.set_offset_image((0, 0), "etlsaqqtjvn")

            knvlfntsrc.wryqzerswl(
                urkteguwnke.zbumogozsz(
                    [
                        urkteguwnke.obsqjmxpbi(["wpulgmixnbz", "hihodtibubm", "yxaxjsryovv"]),
                        urkteguwnke.zziytpcrcm(lambda: self.hdnrlfmyrj.curvanlgjj(knvlfntsrc)),
                        urkteguwnke.zziytpcrcm(vtxzvpvawg),
                        urkteguwnke.fygfajisbn(self.twdpowducb, self.pbsitubcfd(kojxiszwpx)),
                        urkteguwnke.zziytpcrcm(ywyxibnhor),
                    ]
                )
            )
        elif etipfuvgsl == ["yuuqpmlxorv"]:
            knvlfntsrc = ugywcmguyv[0]
            sfwygehfog = ogtmlfjejir(
                "oonshderxef",
                x=knvlfntsrc.grid_x,
                y=knvlfntsrc.grid_y,
                name="oonshderxef",
            )
            knvlfntsrc.wryqzerswl(
                urkteguwnke.zbumogozsz(
                    [
                        knvlfntsrc.hfaehnxuhf(
                            (0, 0),
                            ["txjcfisalqu", "cvkgqlojfnh", "ltorejwifje", "oonshderxef"],
                        ),
                        urkteguwnke.zziytpcrcm(
                            lambda: (
                                self.hdnrlfmyrj.slaslqzwus(sfwygehfog),
                                self.hdnrlfmyrj.curvanlgjj(knvlfntsrc),
                            )
                        ),
                        urkteguwnke.fygfajisbn(self.twdpowducb, self.pbsitubcfd(kojxiszwpx)),
                    ]
                )
            )
        elif etipfuvgsl == ["oonshderxef"]:
            knvlfntsrc = ugywcmguyv[0]
            sfwygehfog = ogtmlfjejir("yuuqpmlxorv", x=knvlfntsrc.grid_x, y=knvlfntsrc.grid_y, name="yuuqpmlxorv")
            knvlfntsrc.wryqzerswl(
                urkteguwnke.zbumogozsz(
                    [
                        knvlfntsrc.hfaehnxuhf(
                            (0, 0),
                            ["ltorejwifje", "cvkgqlojfnh", "txjcfisalqu", "yuuqpmlxorv"],
                        ),
                        urkteguwnke.zziytpcrcm(
                            lambda: (
                                self.hdnrlfmyrj.slaslqzwus(sfwygehfog),
                                self.hdnrlfmyrj.curvanlgjj(knvlfntsrc),
                            )
                        ),
                        urkteguwnke.fygfajisbn(self.twdpowducb, self.pbsitubcfd(kojxiszwpx)),
                    ]
                )
            )
        elif etipfuvgsl == ["lrpkmzabbfa"]:
            self.vivnprldht = not self.vivnprldht
            knvlfntsrc = ugywcmguyv[0]
            knvlfntsrc.wryqzerswl(
                urkteguwnke.zbumogozsz(
                    [
                        knvlfntsrc.hfaehnxuhf((0, 0), ["ebjoowkheai", "gnqvqkdqlpt", "ippnakjmssl"]),
                        urkteguwnke.zziytpcrcm(lambda: self.hdnrlfmyrj.curvanlgjj(knvlfntsrc)),
                        urkteguwnke.fygfajisbn(
                            self.twdpowducb,
                            self.pbsitubcfd(kojxiszwpx, qssroarxob=True),
                        ),
                    ]
                )
            )
        else:
            return


class qmjscfjptx(RenderableUserDisplay):
    # Readability v3: structural flow; qmjscfjptx.__init__:4405-4408
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, qivnakklopy: "uakietkqfso", amejbmnfkv: "Bp35"):
        self.qivnakklopy = qivnakklopy
        self.amejbmnfkv = amejbmnfkv
        self.frames_to_render: list[np.ndarray] = []

    # Readability v3: structural flow; qmjscfjptx.render_interface:4410-4460
    # Explicit 47-statement structural flow below; 13 conditions, 0 loops, 26 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def render_interface(self, frame: np.ndarray) -> np.ndarray:
        if self.qivnakklopy.qswcochjodb == 10:
            if len(self.frames_to_render) == 0:
                vhbkelmajj = self.qivnakklopy.srlqyenmue()
            else:
                vhbkelmajj = self.frames_to_render.pop(0)
            vhbkelmajj[63, :] = jptccilwmwb
            agiuilotsn = self.amejbmnfkv.hbqwwgceeqp
            nnxmqorgpw = min(agiuilotsn, 64)
            vhbkelmajj[63, :nnxmqorgpw] = jxvlozlzspz
            if agiuilotsn > 64:
                yxfjvlbyds = min(agiuilotsn - 64, 64)
                vhbkelmajj[63, :yxfjvlbyds] = ebbemwaevan
            if agiuilotsn > 128:
                rviyuwyley = min(agiuilotsn - 128, 64)
                vhbkelmajj[63, :rviyuwyley] = nplbvxmrmhi
            if agiuilotsn >= 192:
                self.qivnakklopy.lose()
            return vhbkelmajj
        elif self.qivnakklopy.qswcochjodb <= 6:
            if len(self.frames_to_render) == 0:
                vhbkelmajj = self.qivnakklopy.srlqyenmue()
                vhbkelmajj[63, :] = jptccilwmwb
                agiuilotsn = self.amejbmnfkv.hbqwwgceeqp
                vhbkelmajj[63, :agiuilotsn] = ebbemwaevan
                if self.amejbmnfkv.hbqwwgceeqp == 64:
                    self.qivnakklopy.lose()
                return vhbkelmajj
            vhbkelmajj = self.frames_to_render.pop(0)
            if self.qivnakklopy.qswcochjodb > 0:
                vhbkelmajj[63, :] = jptccilwmwb
                agiuilotsn = self.amejbmnfkv.hbqwwgceeqp
                vhbkelmajj[63, :agiuilotsn] = ebbemwaevan
                if self.amejbmnfkv.hbqwwgceeqp == 64:
                    self.qivnakklopy.lose()
            return vhbkelmajj
        else:
            if len(self.frames_to_render) == 0:
                vhbkelmajj = self.qivnakklopy.srlqyenmue()
            else:
                vhbkelmajj = self.frames_to_render.pop(0)
            vhbkelmajj[63, :] = jptccilwmwb
            agiuilotsn = self.amejbmnfkv.hbqwwgceeqp
            nnxmqorgpw = min(agiuilotsn, 64)
            vhbkelmajj[63, :nnxmqorgpw] = jxvlozlzspz
            if agiuilotsn > 64:
                yxfjvlbyds = agiuilotsn - 64
                vhbkelmajj[63, :yxfjvlbyds] = ebbemwaevan
            if agiuilotsn == 128:
                self.qivnakklopy.lose()
            return vhbkelmajj


BACKGROUND_COLOR = jltzfsatusf
PADDING_COLOR = mxsayyrckip
GRAPH_BUILDER = False


class Bp35(ARCBaseGame):
    # Readability v3: structural flow; Bp35.__init__:4469-4491
    # Explicit 13-statement structural flow below; 1 conditions, 0 loops, 9 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self) -> None:
        self.oztjzzyqoek = uakietkqfso()
        self.oztjzzyqoek.qswcochjodb = 1
        self.oztjzzyqoek.ruarvcqajl()
        if not GRAPH_BUILDER:
            self.oztjzzyqoek.jpexoivelf()
        self.krqzxbshzqn = False
        self.heywwwvrogx = False
        self.hbqwwgceeqp = 0
        self.tehvqeiqsdu = qmjscfjptx(self.oztjzzyqoek, self)
        self.available_actions: List[int] = [3, 4, 6, 7]
        camera = Camera(
            background=BACKGROUND_COLOR,
            letter_box=PADDING_COLOR,
            interfaces=[self.tehvqeiqsdu],
        )
        game_id = self.__class__.__name__.lower()
        super().__init__(
            game_id=game_id,
            levels=levels,
            camera=camera,
            available_actions=self.available_actions,
        )

    # Readability v3: structural flow; Bp35.step:4493-4507
    # Explicit 13-statement structural flow below; 5 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def step(self) -> None:
        if self.heywwwvrogx:
            if len(self.tehvqeiqsdu.frames_to_render) <= 1:
                self.heywwwvrogx = False
                if self.oztjzzyqoek.nkuphphdgrp:
                    self.next_level()
                elif self.oztjzzyqoek.jrhqdvdwpsb:
                    self.lose()
                self.complete_action()
        else:
            self.heywwwvrogx = True
            self.urzvqcxbsz()
            if self.krqzxbshzqn:
                self.tehvqeiqsdu.frames_to_render = self.oztjzzyqoek.render()
            self.krqzxbshzqn = False

    # Readability v3: update_binding; Bp35.xpyxviqlfj:4509-4510
    # Perform self.tehvqeiqsdu.frames_to_render = gqzoqxubafn; argument/attribute spellings are preserved. [structural-contract]
    def xpyxviqlfj(self, gqzoqxubafn: list[np.ndarray]) -> None:
        self.tehvqeiqsdu.frames_to_render = gqzoqxubafn

    # Readability v3: structural flow; Bp35.urzvqcxbsz:4512-4555
    # Explicit 35-statement structural flow below; 6 conditions, 0 loops, 14 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def urzvqcxbsz(self) -> None:
        self.krqzxbshzqn = True
        action_id = self.action.id
        match action_id:
            case GameAction.ACTION1:
                if not GRAPH_BUILDER:
                    self.oztjzzyqoek.vlyikbzinq()
                self.oztjzzyqoek.oreuzgjmdx(0, -1)
                self.hbqwwgceeqp += 1
            case GameAction.ACTION2:
                if not GRAPH_BUILDER:
                    self.oztjzzyqoek.vlyikbzinq()
                self.oztjzzyqoek.oreuzgjmdx(0, 1)
                self.hbqwwgceeqp += 1
            case GameAction.ACTION3:
                if not GRAPH_BUILDER:
                    self.oztjzzyqoek.vlyikbzinq()
                self.oztjzzyqoek.oreuzgjmdx(-1, 0)
                self.hbqwwgceeqp += 1
            case GameAction.ACTION4:
                if not GRAPH_BUILDER:
                    self.oztjzzyqoek.vlyikbzinq()
                self.oztjzzyqoek.oreuzgjmdx(1, 0)
                self.hbqwwgceeqp += 1
            case GameAction.ACTION5:
                if not GRAPH_BUILDER:
                    self.oztjzzyqoek.vlyikbzinq()
                self.oztjzzyqoek.uatdugrwtx()
                self.hbqwwgceeqp += 1
            case GameAction.ACTION6:
                if not GRAPH_BUILDER:
                    self.oztjzzyqoek.vlyikbzinq()
                self.oztjzzyqoek.gwfodrkvzx(self.action.data["x"], self.action.data["y"])
                self.hbqwwgceeqp += 1
            case GameAction.ACTION7:
                self.pending_frames = self.oztjzzyqoek.svmaaixutx()
                self.krqzxbshzqn = False
                self.xpyxviqlfj(self.pending_frames)
                self.hbqwwgceeqp += 1
            case GameAction.RESET:
                self.pending_frames = self.oztjzzyqoek.eubgwokpez()
                self.krqzxbshzqn = False
                self.xpyxviqlfj(self.pending_frames)
                self.hbqwwgceeqp = 0

    # Readability v3: structural flow; Bp35.on_set_level:4557-4565
    # Explicit 8-statement structural flow below; 1 conditions, 0 loops, 5 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def on_set_level(self, level: Level) -> None:
        self.oztjzzyqoek = uakietkqfso()
        self.oztjzzyqoek.qswcochjodb = self._current_level_index + 1
        self.oztjzzyqoek.ruarvcqajl()
        if not GRAPH_BUILDER:
            self.oztjzzyqoek.jpexoivelf()
        self.tehvqeiqsdu.qivnakklopy = self.oztjzzyqoek
        self.tehvqeiqsdu.frames_to_render = []
        self.hbqwwgceeqp = 0
