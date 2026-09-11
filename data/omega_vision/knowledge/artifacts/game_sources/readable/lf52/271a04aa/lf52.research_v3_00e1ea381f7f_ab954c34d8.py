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
from typing import (
    Any,
    Callable,
    ClassVar,
    Dict,
    Final,
    Iterator,
    List,
    Optional,
    Set,
    Tuple,
    TypeAlias,
    Union,
    cast,
)

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
from typing_extensions import Literal

sprites = {
    "xnpkcymhua": Sprite(
        pixels=[
            [9],
        ],
        name="xnpkcymhua",
        visible=True,
        collidable=True,
    ),
}
levels = [
    # Level 1
    Level(
        sprites=[
            sprites["xnpkcymhua"].clone().set_position(3, 2),
        ],
        grid_size=(8, 8),
    ),
    # Level 2
    Level(
        sprites=[
            sprites["xnpkcymhua"].clone().set_position(3, 2),
        ],
        grid_size=(8, 8),
    ),
    # Level 3
    Level(
        sprites=[
            sprites["xnpkcymhua"].clone().set_position(3, 2),
        ],
        grid_size=(8, 8),
    ),
    # Level 4
    Level(
        sprites=[
            sprites["xnpkcymhua"].clone().set_position(3, 2),
        ],
        grid_size=(8, 8),
    ),
    # Level 5
    Level(
        sprites=[
            sprites["xnpkcymhua"].clone().set_position(3, 2),
        ],
        grid_size=(8, 8),
    ),
    # Level 6
    Level(
        sprites=[
            sprites["xnpkcymhua"].clone().set_position(3, 2),
        ],
        grid_size=(8, 8),
    ),
    # Level 7
    Level(
        sprites=[
            sprites["xnpkcymhua"].clone().set_position(3, 2),
        ],
        grid_size=(8, 8),
    ),
    # Level 8
    Level(
        sprites=[
            sprites["xnpkcymhua"].clone().set_position(3, 2),
        ],
        grid_size=(8, 8),
    ),
    # Level 9
    Level(
        sprites=[
            sprites["xnpkcymhua"].clone().set_position(3, 2),
        ],
        grid_size=(8, 8),
    ),
    # Level 10
    Level(
        sprites=[
            sprites["xnpkcymhua"].clone().set_position(3, 2),
        ],
        grid_size=(8, 8),
    ),
]

BACKGROUND_COLOR = 0

PADDING_COLOR = 3

lgbyiaitpdiDING_COLOR = 3
ulwnpijnjs = -1
(
    WHITE,
    OFF_WHITE,
    GRAY,
    DARK_GRAY,
    OFF_BLACK,
    BLACK,
    MAGENTA,
    PINK,
    RED,
    BLUE,
    LIGHT_BLUE,
    YELLOW,
    ORANGE,
    MAROON,
    GREEN,
    PURPLE,
) = range(16)
lgbyiaitpdiDING_COLOR = DARK_GRAY
BACKGROUND_COLOR = LIGHT_BLUE
GRAPH_BUILDER = False
STORES_UNDO = True
"."
medcdmmfeh = frozenset(
    {
        "eocrokcvgsq",
        "htoojidbdud",
        "kuhrdwbqiqf",
        "bifnvdxmkdu",
        "yrxvacxlgrf",
        "vwkvvkakmhh",
        "ultqqtpbdxi",
        "nqyzyfvbkff",
        "rxmjztculbk",
        "thjlxkglewl",
        "lrggiefpfpe",
        "ywqrmtfisfd",
        "tnxxzczblvt",
        "ppoluxgtqul",
        "fwmrusyzvre",
        "pjgnbnjpekc",
        "ntaykiuhwea",
        "scvfeiyvnhp",
        "lnmwqhcyjmf",
        "yknqdbfdmws",
        "evxqasxmlqa",
        "nbfourfrhsm",
        "frcuqgcfriu",
        "gmhhfvghrrq",
        "cimmdejoxnr",
        "_cached_world_pos",
        "_cached_world_scale",
        "_cached_world_rotation",
        "_rotation_dirty",
    }
)
gldcxbbxzq = frozenset(
    {
        "aadgkwiaxgf",
        "lcdwwgrtwyx",
        "qqtpajjxlhn",
        "xfyfphklhzp",
        "nqxpvkylltv",
        "usqhgtsijxk",
        "wlblbzaghgm",
        "aufxjsaidrw",
        "fdvqqrgrvcc",
        "qyqblxezmdx",
        "vmoosxtgymj",
        "stfqbqlnehs",
        "diyordzobhf",
        "xzwdyefmgkv",
        "wuomahqexpl",
        "_width",
        "_height",
        "_buffer",
        "_sorted_cache",
        "_frame_recorder",
        "_undo_manager",
        "_pending_undo_capture",
        "_pending_undo_state",
    }
)
zbqccpgndm = (type(None), bool, int, float, str)
ziaradayyo: dict[type, bool] = {}


# Readability v3: class_can_have_extra_snapshot_attributes; dmtppmvryx:232-258
# Cache whether a class or its MRO exposes a dictionary or nonreserved slots; this is a snapshot-eligibility heuristic, not a generic mutability test. [human-source-reviewed]
def dmtppmvryx(cls: type) -> bool:
    """."""
    mchcojmloc = ziaradayyo.get(cls)
    if mchcojmloc is not None:
        return mchcojmloc
    tiivuuazlh = False
    if "__slots__" not in cls.__dict__:
        tiivuuazlh = True
    elif "__dict__" in cls.__dict__.get("__slots__", ()):
        tiivuuazlh = True
    else:
        for awuziztlvh in cls.__mro__:
            if awuziztlvh is object:
                continue
            if "__dict__" in getattr(awuziztlvh, "__slots__", ()):
                tiivuuazlh = True
                break
            predlpiail = getattr(awuziztlvh, "__slots__", None)
            if predlpiail:
                for oypdbltcxt in predlpiail:
                    if oypdbltcxt not in medcdmmfeh and (not oypdbltcxt.startswith("__")):
                        tiivuuazlh = True
                        break
            if tiivuuazlh:
                break
    ziaradayyo[cls] = tiivuuazlh
    return tiivuuazlh


# Readability v3: is_bounded_snapshot_copyable_value; pnyojvxbcf:261-271
# Accept primitive values and bounded recursive containers: depth at most five, lists/tuples below 100 elements, dictionaries below 50 with string/integer keys. [human-source-reviewed]
def pnyojvxbcf(v: Any, ujexvqfwbn: int = 0) -> bool:
    """."""
    if ujexvqfwbn > 5:
        return False
    if v is None or isinstance(v, zbqccpgndm):
        return True
    if isinstance(v, (list, tuple)):
        return len(v) < 100 and all((pnyojvxbcf(x, ujexvqfwbn + 1) for x in v))
    if isinstance(v, dict):
        return len(v) < 50 and all(((isinstance(k, str) or isinstance(k, int)) and pnyojvxbcf(x, ujexvqfwbn + 1) for k, x in v.items()))
    return False


# Readability v3: copy_extra_snapshot_attributes_or_none; jvriajqonx:274-298
# Collect eligible nonreserved dictionary/slot values through the MRO using deepcopy and the bounded predicate; return None when none qualify. [human-source-reviewed]
def jvriajqonx(oxvxqjhpoz: Any, coipojnvqh: frozenset[str]) -> dict[str, Any] | None:
    """."""
    cls = type(oxvxqjhpoz)
    if not dmtppmvryx(cls):
        return None
    result: dict[str, Any] = {}
    temwcgmexo = getattr(oxvxqjhpoz, "__dict__", None)
    if temwcgmexo:
        for k, v in temwcgmexo.items():
            if k not in coipojnvqh and (not k.startswith("__")) and pnyojvxbcf(v):
                result[k] = copy.deepcopy(v)
    vkplnaeklj = set(result.keys())
    for awuziztlvh in cls.__mro__:
        predlpiail = getattr(awuziztlvh, "__slots__", None)
        if predlpiail:
            for oypdbltcxt in predlpiail:
                if oypdbltcxt not in vkplnaeklj and oypdbltcxt not in coipojnvqh and (not oypdbltcxt.startswith("__")):
                    try:
                        v = getattr(oxvxqjhpoz, oypdbltcxt)
                        if pnyojvxbcf(v):
                            result[oypdbltcxt] = copy.deepcopy(v)
                            vkplnaeklj.add(oypdbltcxt)
                    except AttributeError:
                        pass
    return result if result else None


# Readability v3: copy_extra_snapshot_attributes; nzlwcdwbwd:301-303
# Wrap the optional extra-attribute capture with an empty-dictionary result. [human-source-reviewed]
def nzlwcdwbwd(oxvxqjhpoz: Any, coipojnvqh: frozenset[str]) -> dict[str, Any]:
    """."""
    return jvriajqonx(oxvxqjhpoz, coipojnvqh) or {}


qzboeothmv: Final[Literal[0]] = 0
dfpnnpzqul: Final[Literal[1]] = 1
ohqtjhvtyr: Final[Literal[2]] = 2
riokonxaef: Final[Literal[3]] = 3
skdcctcvri: Final[Literal[4]] = 4
syhwgripgz: Final[Literal[5]] = 5
ghgnsncjgm: Final[Literal[6]] = 6
twtsoqfwut: Final[Literal[7]] = 7
xzvgtqsluv: Final[Literal[8]] = 8
bojjcramlj: Final[Literal[9]] = 9
saurzawetd: Final[Literal[10]] = 10
llmnlegnkv: Final[Literal[11]] = 11
bmwtqmgywm: Final[Literal[12]] = 12
fpqeweoyer: Final[Literal[13]] = 13
dcyjhyzcyn: Final[Literal[14]] = 14
oamdwcaytq: TypeAlias = tuple[
    int,
    int,
    int,
    bool,
    int,
    str,
    str | None,
    Any,
    Any,
    int | None,
    tuple[int, ...],
    dict[str, Any] | None,
    float,
    float,
    float,
]


# Readability v3: capture_compact_object_state_without_extras; ijecojavkn:340-360
# Encode object ID, transform/display fields, parent/child IDs and a None extras slot in a fixed-order tuple. [human-source-reviewed]
def ijecojavkn(wjijkpdxjj: Any) -> oamdwcaytq:
    """."""
    qoifrofmiu = wjijkpdxjj.nqyzyfvbkff
    avykuiywon = wjijkpdxjj.rxmjztculbk
    return (
        id(wjijkpdxjj),
        wjijkpdxjj.eocrokcvgsq,
        wjijkpdxjj.htoojidbdud,
        wjijkpdxjj.kuhrdwbqiqf,
        wjijkpdxjj.bifnvdxmkdu,
        wjijkpdxjj.yrxvacxlgrf,
        wjijkpdxjj.vwkvvkakmhh,
        wjijkpdxjj.ultqqtpbdxi,
        wjijkpdxjj.fjhfwhfazwo,
        id(qoifrofmiu) if qoifrofmiu else None,
        tuple((id(awuziztlvh) for awuziztlvh in avykuiywon)) if avykuiywon else (),
        None,
        wjijkpdxjj.tnxxzczblvt,
        wjijkpdxjj.ppoluxgtqul,
        wjijkpdxjj.ntaykiuhwea,
    )


# Readability v3: capture_compact_object_state_with_extras; tmtcgrsexh:363-383
# Encode the same object state tuple but include deep-copied eligible extra attributes. [human-source-reviewed]
def tmtcgrsexh(wjijkpdxjj: Any) -> oamdwcaytq:
    """."""
    qoifrofmiu = wjijkpdxjj.nqyzyfvbkff
    avykuiywon = wjijkpdxjj.rxmjztculbk
    return (
        id(wjijkpdxjj),
        wjijkpdxjj.eocrokcvgsq,
        wjijkpdxjj.htoojidbdud,
        wjijkpdxjj.kuhrdwbqiqf,
        wjijkpdxjj.bifnvdxmkdu,
        wjijkpdxjj.yrxvacxlgrf,
        wjijkpdxjj.vwkvvkakmhh,
        wjijkpdxjj.ultqqtpbdxi,
        wjijkpdxjj.fjhfwhfazwo,
        id(qoifrofmiu) if qoifrofmiu else None,
        tuple((id(awuziztlvh) for awuziztlvh in avykuiywon)) if avykuiywon else (),
        jvriajqonx(wjijkpdxjj, medcdmmfeh),
        wjijkpdxjj.tnxxzczblvt,
        wjijkpdxjj.ppoluxgtqul,
        wjijkpdxjj.ntaykiuhwea,
    )


class fqbzumongtm:
    """."""

    __slots__ = (
        "qoieikxwxnm",
        "x",
        "y",
        "visible",
        "layer",
        "name",
        "ctqmtpaxkpb",
        "qdfhihrdpua",
        "hdbfgdeqyge",
        "lpvkbsuednp",
        "wipeoeccuib",
        "ovftqtqmmxz",
        "nepdducgbdd",
        "sawwyplkacb",
        "dkhseicykgw",
    )

    # Readability v3: structural flow; fqbzumongtm.__init__:407-436
    # Explicit 8-statement structural flow below; 0 conditions, 0 loops, 8 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        qoieikxwxnm: int,
        x: int,
        y: int,
        visible: bool,
        layer: int,
        name: str,
        ctqmtpaxkpb: str | None,
        qdfhihrdpua: Any,
        hdbfgdeqyge: Any,
        lpvkbsuednp: int | None,
        wipeoeccuib: list[int],
        ovftqtqmmxz: dict[str, Any],
        nepdducgbdd: float = 1.0,
        sawwyplkacb: float = 1.0,
        dkhseicykgw: float = 0.0,
    ):
        self.qoieikxwxnm = qoieikxwxnm
        self.x, self.y = (x, y)
        self.visible, self.layer, self.name = (visible, layer, name)
        self.ctqmtpaxkpb, self.qdfhihrdpua, self.hdbfgdeqyge = (
            ctqmtpaxkpb,
            qdfhihrdpua,
            hdbfgdeqyge,
        )
        self.lpvkbsuednp, self.wipeoeccuib = (lpvkbsuednp, wipeoeccuib)
        self.ovftqtqmmxz = ovftqtqmmxz
        self.nepdducgbdd, self.sawwyplkacb = (nepdducgbdd, sawwyplkacb)
        self.dkhseicykgw = dkhseicykgw

    # Readability v3: object_snapshot_from_tuple; fqbzumongtm.kolvbbdfkj:439-457
    # Construct the snapshot object from named tuple-index constants, copying child IDs into a list and normalizing absent extras. [human-source-reviewed]
    @staticmethod
    def kolvbbdfkj(reiiyswsxj: oamdwcaytq) -> "fqbzumongtm":
        """."""
        return fqbzumongtm(
            reiiyswsxj[qzboeothmv],
            reiiyswsxj[dfpnnpzqul],
            reiiyswsxj[ohqtjhvtyr],
            reiiyswsxj[riokonxaef],
            reiiyswsxj[skdcctcvri],
            reiiyswsxj[syhwgripgz],
            reiiyswsxj[ghgnsncjgm],
            reiiyswsxj[twtsoqfwut],
            reiiyswsxj[xzvgtqsluv],
            reiiyswsxj[bojjcramlj],
            list(reiiyswsxj[saurzawetd]),
            reiiyswsxj[llmnlegnkv] or {},
            reiiyswsxj[bmwtqmgywm],
            reiiyswsxj[fpqeweoyer],
            reiiyswsxj[dcyjhyzcyn],
        )

    # Readability v3: clone_object_snapshot; fqbzumongtm.clone:459-476
    # Copy the snapshot record, child list and deep-copy nonempty extra state. [human-source-reviewed]
    def clone(self) -> "fqbzumongtm":
        return fqbzumongtm(
            self.qoieikxwxnm,
            self.x,
            self.y,
            self.visible,
            self.layer,
            self.name,
            self.ctqmtpaxkpb,
            self.qdfhihrdpua,
            self.hdbfgdeqyge,
            self.lpvkbsuednp,
            self.wipeoeccuib.copy(),
            copy.deepcopy(self.ovftqtqmmxz) if self.ovftqtqmmxz else {},
            self.nepdducgbdd,
            self.sawwyplkacb,
            self.dkhseicykgw,
        )


class jqbvbtjxhll:
    """."""

    __slots__ = ("zellzipnnga", "ovftqtqmmxz")

    # Readability v3: structural flow; jqbvbtjxhll.__init__:484-490
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        zellzipnnga: list[int] | tuple[int, ...],
        ovftqtqmmxz: dict[str, Any] | None,
    ):
        self.zellzipnnga = zellzipnnga if isinstance(zellzipnnga, list) else list(zellzipnnga)
        self.ovftqtqmmxz = ovftqtqmmxz or {}

    # Readability v3: return_expression; jqbvbtjxhll.clone:492-496
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def clone(self) -> "jqbvbtjxhll":
        return jqbvbtjxhll(
            self.zellzipnnga.copy(),
            copy.deepcopy(self.ovftqtqmmxz) if self.ovftqtqmmxz else {},
        )


class yghxqtcgwzi:
    """."""

    __slots__ = ("tqxjgwpujsp", "wildpjhjgoj", "rdxjvdouszs", "ncjaqnbrtte")

    # Readability v3: structural flow; yghxqtcgwzi.__init__:504-516
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        tqxjgwpujsp: jqbvbtjxhll,
        styqjcvoad: dict[int, fqbzumongtm] | None = None,
        ncjaqnbrtte: int = 0,
        hqldaesygy: list[np.ndarray] | None = None,
        yjuqsmnkuq: np.ndarray | None = None,
        clpvtfpxzo: dict[int, oamdwcaytq] | None = None,
    ):
        self.tqxjgwpujsp = tqxjgwpujsp
        self.wildpjhjgoj = styqjcvoad
        self.rdxjvdouszs = clpvtfpxzo
        self.ncjaqnbrtte = ncjaqnbrtte

    # Readability v3: structural flow; yghxqtcgwzi.styqjcvoad:519-526
    # Explicit 7-statement structural flow below; 2 conditions, 0 loops, 1 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @property
    def styqjcvoad(self) -> dict[int, fqbzumongtm]:
        """."""
        if self.wildpjhjgoj is not None:
            return self.wildpjhjgoj
        if self.rdxjvdouszs:
            self.wildpjhjgoj = {mrxvgqwxbc: fqbzumongtm.kolvbbdfkj(reiiyswsxj) for mrxvgqwxbc, reiiyswsxj in self.rdxjvdouszs.items()}
            return self.wildpjhjgoj
        return {}

    # Readability v3: update_binding; yghxqtcgwzi.styqjcvoad:529-531
    # Perform self.wildpjhjgoj = value; argument/attribute spellings are preserved. [structural-contract]
    @styqjcvoad.setter
    def styqjcvoad(self, value: dict[int, fqbzumongtm] | None) -> None:
        """."""
        self.wildpjhjgoj = value

    # Readability v3: read_attribute; yghxqtcgwzi.gctandxywo:533-535
    # Return self.styqjcvoad; descriptor behavior is not assumed pure. [structural-contract]
    def gctandxywo(self) -> dict[int, fqbzumongtm]:
        """."""
        return self.styqjcvoad

    # Readability v3: structural flow; yghxqtcgwzi.clone:537-544
    # Explicit 7-statement structural flow below; 2 conditions, 0 loops, 4 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def clone(self) -> "yghxqtcgwzi":
        styqjcvoad = None
        clpvtfpxzo = None
        if self.wildpjhjgoj:
            styqjcvoad = {k: v.clone() for k, v in self.wildpjhjgoj.items()}
        elif self.rdxjvdouszs:
            clpvtfpxzo = self.rdxjvdouszs.copy()
        return yghxqtcgwzi(self.tqxjgwpujsp.clone(), styqjcvoad, self.ncjaqnbrtte, clpvtfpxzo=clpvtfpxzo)

    # Readability v3: return_expression; yghxqtcgwzi.hqldaesygy:547-548
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def hqldaesygy(self) -> list[np.ndarray]:
        return []

    # Readability v3: no_op_body; yghxqtcgwzi.hqldaesygy:551-552
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @hqldaesygy.setter
    def hqldaesygy(self, value: list[np.ndarray] | None) -> None:
        pass

    # Readability v3: return_constant; yghxqtcgwzi.yjuqsmnkuq:555-556
    # Return None. [structural-contract]
    @property
    def yjuqsmnkuq(self) -> np.ndarray | None:
        return None

    # Readability v3: no_op_body; yghxqtcgwzi.yjuqsmnkuq:559-560
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @yjuqsmnkuq.setter
    def yjuqsmnkuq(self, value: np.ndarray | None) -> None:
        pass


class fbnblnicrc:
    """."""

    __slots__ = (
        "oegtnpbqims",
        "enbizandmjr",
        "zrljzydyafw",
        "ainlnxnlazs",
        "uwlsllrgsry",
        "bzmkirnvucp",
        "owwefbkphrw",
        "bkdaabbwdtb",
        "bjfltcjmrms",
        "rebhprmclup",
    )

    # Readability v3: structural flow; fbnblnicrc.__init__:579-589
    # Explicit 10-statement structural flow below; 0 conditions, 0 loops, 10 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, oegtnpbqims: "rjfmjxejeiq"):
        self.oegtnpbqims = oegtnpbqims
        self.enbizandmjr: list[yghxqtcgwzi] = []
        self.zrljzydyafw: yghxqtcgwzi | None = None
        self.ainlnxnlazs: dict[int, "qoljprchpbb"] = {}
        self.uwlsllrgsry = 0
        self.bzmkirnvucp = False
        self.owwefbkphrw = False
        self.bkdaabbwdtb = 5
        self.bjfltcjmrms = 10
        self.rebhprmclup = False

    # Readability v3: return_expression; fbnblnicrc.hozflswfjz:592-593
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def hozflswfjz(self) -> bool:
        return len(self.enbizandmjr) > 0

    # Readability v3: return_expression; fbnblnicrc.yqnbhfrkbv:596-597
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def yqnbhfrkbv(self) -> int:
        return len(self.enbizandmjr)

    # Readability v3: structural flow; fbnblnicrc.zrcijqason:599-605
    # Explicit 6-statement structural flow below; 1 conditions, 1 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zrcijqason(self, wjijkpdxjj: "qoljprchpbb") -> None:
        """."""
        mrxvgqwxbc = id(wjijkpdxjj)
        if mrxvgqwxbc not in self.ainlnxnlazs:
            self.ainlnxnlazs[mrxvgqwxbc] = wjijkpdxjj
        for kgjynspwva in wjijkpdxjj.rxmjztculbk:
            self.zrcijqason(kgjynspwva)

    # Readability v3: structural flow; fbnblnicrc.fosnoteizc:607-626
    # Explicit 19-statement structural flow below; 5 conditions, 0 loops, 9 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def fosnoteizc(self) -> None:
        """."""
        nghaiopkoi = self.ainlnxnlazs
        fovoqraoik: set[int] = set()
        ssavjtvrem = list(self.oegtnpbqims.qqtpajjxlhn)
        xbbyerwqwu = getattr(self.oegtnpbqims, "xzwdyefmgkv", None)
        if xbbyerwqwu:
            ssavjtvrem.append(xbbyerwqwu)
        while ssavjtvrem:
            wjijkpdxjj = ssavjtvrem.pop()
            mrxvgqwxbc = id(wjijkpdxjj)
            if mrxvgqwxbc in fovoqraoik:
                continue
            fovoqraoik.add(mrxvgqwxbc)
            if mrxvgqwxbc not in nghaiopkoi:
                nghaiopkoi[mrxvgqwxbc] = wjijkpdxjj
            avykuiywon = wjijkpdxjj.rxmjztculbk
            if avykuiywon:
                ssavjtvrem.extend(avykuiywon)
        self.rebhprmclup = True

    # Readability v3: return_expression; fbnblnicrc.hpbiefjcos:628-646
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def hpbiefjcos(self, wjijkpdxjj: "qoljprchpbb") -> fqbzumongtm:
        """."""
        return fqbzumongtm(
            id(wjijkpdxjj),
            wjijkpdxjj.eocrokcvgsq,
            wjijkpdxjj.htoojidbdud,
            wjijkpdxjj.kuhrdwbqiqf,
            wjijkpdxjj.bifnvdxmkdu,
            wjijkpdxjj.yrxvacxlgrf,
            wjijkpdxjj.vwkvvkakmhh,
            wjijkpdxjj.ultqqtpbdxi,
            wjijkpdxjj.fjhfwhfazwo,
            id(wjijkpdxjj.nqyzyfvbkff) if wjijkpdxjj.nqyzyfvbkff else None,
            [id(awuziztlvh) for awuziztlvh in wjijkpdxjj.rxmjztculbk],
            nzlwcdwbwd(wjijkpdxjj, medcdmmfeh),
            wjijkpdxjj.tnxxzczblvt,
            wjijkpdxjj.ppoluxgtqul,
            wjijkpdxjj.ntaykiuhwea,
        )

    # Readability v3: structural flow; fbnblnicrc.vsraxtrahc:648-688
    # Explicit 16-statement structural flow below; 5 conditions, 1 loops, 11 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def vsraxtrahc(self) -> yghxqtcgwzi:
        """."""
        if not self.rebhprmclup:
            self.fosnoteizc()
        self.uwlsllrgsry += 1
        nghaiopkoi = self.ainlnxnlazs
        clpvtfpxzo: dict[int, oamdwcaytq] = {}
        for mrxvgqwxbc, wjijkpdxjj in nghaiopkoi.items():
            qoifrofmiu = wjijkpdxjj.nqyzyfvbkff
            avykuiywon = wjijkpdxjj.rxmjztculbk
            jrxnolvcmn = type(wjijkpdxjj)
            tiivuuazlh = dmtppmvryx(jrxnolvcmn)
            clpvtfpxzo[mrxvgqwxbc] = (
                mrxvgqwxbc,
                wjijkpdxjj.eocrokcvgsq,
                wjijkpdxjj.htoojidbdud,
                wjijkpdxjj.kuhrdwbqiqf,
                wjijkpdxjj.bifnvdxmkdu,
                wjijkpdxjj.yrxvacxlgrf,
                wjijkpdxjj.vwkvvkakmhh,
                wjijkpdxjj.ultqqtpbdxi,
                wjijkpdxjj.fjhfwhfazwo,
                id(qoifrofmiu) if qoifrofmiu else None,
                tuple((id(awuziztlvh) for awuziztlvh in avykuiywon)) if avykuiywon else (),
                jvriajqonx(wjijkpdxjj, medcdmmfeh) if tiivuuazlh else None,
                wjijkpdxjj.tnxxzczblvt,
                wjijkpdxjj.ppoluxgtqul,
                wjijkpdxjj.ntaykiuhwea,
            )
        veklzmovrz = type(self.oegtnpbqims)
        pfyorqlflw = dmtppmvryx(veklzmovrz)
        tqxjgwpujsp = jqbvbtjxhll(
            tuple((id(wfjffncuge) for wfjffncuge in self.oegtnpbqims.qqtpajjxlhn)),
            jvriajqonx(self.oegtnpbqims, gldcxbbxzq) if pfyorqlflw else None,
        )
        return yghxqtcgwzi(
            tqxjgwpujsp,
            styqjcvoad=None,
            ncjaqnbrtte=self.uwlsllrgsry,
            clpvtfpxzo=clpvtfpxzo,
        )

    # Readability v3: update_binding; fbnblnicrc.vpanmnowjy:690-691
    # Perform self.zrljzydyafw = self.vsraxtrahc(); argument/attribute spellings are preserved. [structural-contract]
    def vpanmnowjy(self) -> None:
        self.zrljzydyafw = self.vsraxtrahc()

    # Readability v3: structural flow; fbnblnicrc.wnsjgtrhey:693-703
    # Explicit 6-statement structural flow below; 2 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wnsjgtrhey(
        self,
        hqldaesygy: list[np.ndarray] | None = None,
        yjuqsmnkuq: np.ndarray | None = None,
    ) -> None:
        state = self.vsraxtrahc()
        if hqldaesygy:
            state.hqldaesygy = hqldaesygy.copy()
        if yjuqsmnkuq is not None:
            state.yjuqsmnkuq = yjuqsmnkuq
        self.enbizandmjr.append(state)

    # Readability v3: structural flow; fbnblnicrc.fisdhepjwb:705-706
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def fisdhepjwb(self) -> None:
        self.enbizandmjr.clear()

    # Readability v3: structural flow; fbnblnicrc.gnpogoshck:708-731
    # Explicit 22-statement structural flow below; 1 conditions, 1 loops, 16 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gnpogoshck(self, wjijkpdxjj: "qoljprchpbb", state: oamdwcaytq) -> None:
        """."""
        wjijkpdxjj.eocrokcvgsq = state[dfpnnpzqul]
        wjijkpdxjj.htoojidbdud = state[ohqtjhvtyr]
        wjijkpdxjj.kuhrdwbqiqf = state[riokonxaef]
        wjijkpdxjj.bifnvdxmkdu = state[skdcctcvri]
        wjijkpdxjj.yrxvacxlgrf = state[syhwgripgz]
        wjijkpdxjj.vwkvvkakmhh = state[ghgnsncjgm]
        wjijkpdxjj.ultqqtpbdxi = state[twtsoqfwut]
        wjijkpdxjj.fjhfwhfazwo = state[xzvgtqsluv]
        wjijkpdxjj.tnxxzczblvt = state[bmwtqmgywm]
        wjijkpdxjj.ppoluxgtqul = state[fpqeweoyer]
        wjijkpdxjj.ntaykiuhwea = state[dcyjhyzcyn]
        wjijkpdxjj.gmhhfvghrrq = None
        wjijkpdxjj.thjlxkglewl = True
        wjijkpdxjj.fwmrusyzvre = True
        wjijkpdxjj.scvfeiyvnhp = True
        vovcgzkhom = state[llmnlegnkv]
        if vovcgzkhom:
            for k, v in vovcgzkhom.items():
                try:
                    setattr(wjijkpdxjj, k, copy.deepcopy(v))
                except AttributeError:
                    pass

    # Readability v3: structural flow; fbnblnicrc.zeeywakyoz:733-754
    # Explicit 16-statement structural flow below; 1 conditions, 1 loops, 10 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zeeywakyoz(self, wjijkpdxjj: "qoljprchpbb", state: fqbzumongtm) -> None:
        """."""
        wjijkpdxjj.eocrokcvgsq, wjijkpdxjj.htoojidbdud = (state.x, state.y)
        wjijkpdxjj.kuhrdwbqiqf, wjijkpdxjj.bifnvdxmkdu = (state.visible, state.layer)
        wjijkpdxjj.yrxvacxlgrf = state.name
        wjijkpdxjj.vwkvvkakmhh, wjijkpdxjj.ultqqtpbdxi, wjijkpdxjj.fjhfwhfazwo = (
            state.ctqmtpaxkpb,
            state.qdfhihrdpua,
            state.hdbfgdeqyge,
        )
        wjijkpdxjj.tnxxzczblvt, wjijkpdxjj.ppoluxgtqul = (state.nepdducgbdd, state.sawwyplkacb)
        wjijkpdxjj.ntaykiuhwea = state.dkhseicykgw
        wjijkpdxjj.gmhhfvghrrq = None
        wjijkpdxjj.thjlxkglewl = True
        wjijkpdxjj.fwmrusyzvre = True
        wjijkpdxjj.scvfeiyvnhp = True
        if state.ovftqtqmmxz:
            for k, v in state.ovftqtqmmxz.items():
                try:
                    setattr(wjijkpdxjj, k, copy.deepcopy(v))
                except AttributeError:
                    pass

    # Readability v3: structural flow; fbnblnicrc.gflusosdnh:756-774
    # Explicit 18-statement structural flow below; 3 conditions, 4 loops, 7 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gflusosdnh(self, clpvtfpxzo: dict[int, oamdwcaytq], zellzipnnga: list[int]) -> None:
        for wjijkpdxjj in self.ainlnxnlazs.values():
            wjijkpdxjj.rxmjztculbk.clear()
            wjijkpdxjj.nqyzyfvbkff = None
        for state in clpvtfpxzo.values():
            qoieikxwxnm = state[qzboeothmv]
            qoifrofmiu = self.ainlnxnlazs.get(qoieikxwxnm)
            if qoifrofmiu:
                kyierqikcf = state[saurzawetd]
                for leubvyaeqr in kyierqikcf:
                    kgjynspwva = self.ainlnxnlazs.get(leubvyaeqr)
                    if kgjynspwva:
                        kgjynspwva.nqyzyfvbkff = qoifrofmiu
                        qoifrofmiu.rxmjztculbk.append(kgjynspwva)
        self.oegtnpbqims.qqtpajjxlhn.clear()
        for mrxvgqwxbc in zellzipnnga:
            szczqodznv = self.ainlnxnlazs.get(mrxvgqwxbc)
            if szczqodznv:
                self.oegtnpbqims.qqtpajjxlhn.append(szczqodznv)

    # Readability v3: structural flow; fbnblnicrc.bpfyfabtzw:776-794
    # Explicit 18-statement structural flow below; 3 conditions, 4 loops, 6 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def bpfyfabtzw(self, nxqolcwpfv: yghxqtcgwzi) -> None:
        """."""
        for wjijkpdxjj in self.ainlnxnlazs.values():
            wjijkpdxjj.rxmjztculbk.clear()
            wjijkpdxjj.nqyzyfvbkff = None
        styqjcvoad = nxqolcwpfv.gctandxywo()
        for state in styqjcvoad.values():
            qoifrofmiu = self.ainlnxnlazs.get(state.qoieikxwxnm)
            if qoifrofmiu:
                for leubvyaeqr in state.wipeoeccuib:
                    kgjynspwva = self.ainlnxnlazs.get(leubvyaeqr)
                    if kgjynspwva:
                        kgjynspwva.nqyzyfvbkff = qoifrofmiu
                        qoifrofmiu.rxmjztculbk.append(kgjynspwva)
        self.oegtnpbqims.qqtpajjxlhn.clear()
        for mrxvgqwxbc in nxqolcwpfv.tqxjgwpujsp.zellzipnnga:
            szczqodznv = self.ainlnxnlazs.get(mrxvgqwxbc)
            if szczqodznv:
                self.oegtnpbqims.qqtpajjxlhn.append(szczqodznv)

    # Readability v3: structural flow; fbnblnicrc.wihhuhezbc:796-825
    # Explicit 27-statement structural flow below; 6 conditions, 4 loops, 6 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wihhuhezbc(self, nxqolcwpfv: yghxqtcgwzi) -> list[np.ndarray]:
        """."""
        if nxqolcwpfv.rdxjvdouszs:
            for mrxvgqwxbc, eutymumrjt in nxqolcwpfv.rdxjvdouszs.items():
                wjijkpdxjj = self.ainlnxnlazs.get(mrxvgqwxbc)
                if wjijkpdxjj:
                    self.gnpogoshck(wjijkpdxjj, eutymumrjt)
            self.gflusosdnh(nxqolcwpfv.rdxjvdouszs, nxqolcwpfv.tqxjgwpujsp.zellzipnnga)
        else:
            styqjcvoad = nxqolcwpfv.gctandxywo()
            for state in styqjcvoad.values():
                wjijkpdxjj = self.ainlnxnlazs.get(state.qoieikxwxnm)
                if wjijkpdxjj:
                    self.zeeywakyoz(wjijkpdxjj, state)
            self.bpfyfabtzw(nxqolcwpfv)
        if nxqolcwpfv.tqxjgwpujsp.ovftqtqmmxz:
            for k, v in nxqolcwpfv.tqxjgwpujsp.ovftqtqmmxz.items():
                try:
                    setattr(self.oegtnpbqims, k, copy.deepcopy(v))
                except AttributeError:
                    pass
        self.oegtnpbqims.wlblbzaghgm = True
        self.oegtnpbqims.wuomahqexpl = True
        for wjijkpdxjj in self.ainlnxnlazs.values():
            uihtqblsho = getattr(wjijkpdxjj, "_post_undo_restore", None)
            if uihtqblsho:
                uihtqblsho()
        if nxqolcwpfv.yjuqsmnkuq is not None:
            return [nxqolcwpfv.yjuqsmnkuq]
        return []

    # Readability v3: return_expression; fbnblnicrc.sbdrfqyiip:827-829
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def sbdrfqyiip(self, nxqolcwpfv: yghxqtcgwzi) -> list[np.ndarray]:
        """."""
        return self.wihhuhezbc(nxqolcwpfv)

    # Readability v3: structural flow; fbnblnicrc.aphzlzlgni:831-835
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def aphzlzlgni(self) -> list[np.ndarray]:
        """."""
        if not self.hozflswfjz:
            return []
        return self.sbdrfqyiip(self.enbizandmjr.pop())

    # Readability v3: structural flow; fbnblnicrc.jhgacfwhoa:837-843
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jhgacfwhoa(self) -> list[np.ndarray]:
        """."""
        if not self.zrljzydyafw:
            return []
        self.enbizandmjr.clear()
        self.wihhuhezbc(self.zrljzydyafw)
        return []

    # Readability v3: read_attribute; fbnblnicrc.jrewrvnubp:845-846
    # Return self.zrljzydyafw; descriptor behavior is not assumed pure. [structural-contract]
    def jrewrvnubp(self) -> yghxqtcgwzi | None:
        return self.zrljzydyafw

    # Readability v3: return_expression; fbnblnicrc.dvhzidvakv:848-849
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def dvhzidvakv(self) -> yghxqtcgwzi:
        return self.vsraxtrahc()


"."
lxsvwjdhto: dict[int, tuple[float, float]] = {
    0: (0.0, 1.0),
    90: (1.0, 0.0),
    180: (0.0, -1.0),
    270: (-1.0, 0.0),
    360: (0.0, 1.0),
}


# Readability v3: structural flow; crhpjfhkrr:862-874
# Explicit 12-statement structural flow below; 3 conditions, 0 loops, 5 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def crhpjfhkrr(sdxwoafbgo: float) -> tuple[float, float]:
    """."""
    zyfqehjsgv = sdxwoafbgo % 360
    nctyuufudm = int(zyfqehjsgv)
    if nctyuufudm in lxsvwjdhto and abs(zyfqehjsgv - nctyuufudm) < 0.0001:
        return lxsvwjdhto[nctyuufudm]
    if abs(zyfqehjsgv - nctyuufudm) < 0.0001:
        if nctyuufudm not in lxsvwjdhto:
            pyknulcwqk = math.radians(nctyuufudm)
            lxsvwjdhto[nctyuufudm] = (math.sin(pyknulcwqk), math.cos(pyknulcwqk))
        return lxsvwjdhto[nctyuufudm]
    pyknulcwqk = math.radians(zyfqehjsgv)
    return (math.sin(pyknulcwqk), math.cos(pyknulcwqk))


class wwnfrkbzon:
    """."""

    __slots__ = (
        "pixels",
        "wytdtzvcdfy",
        "himwfikanwk",
        "xpqwtepewcw",
        "aadgkwiaxgf",
        "lcdwwgrtwyx",
        "bifnvdxmkdu",
        "yrxvacxlgrf",
    )

    # Readability v3: structural flow; wwnfrkbzon.__init__:891-904
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 8 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        pixels: list[str],
        wytdtzvcdfy: dict[str, int],
        himwfikanwk: dict[str, Any] | None = None,
    ):
        self.pixels = pixels
        self.wytdtzvcdfy = wytdtzvcdfy
        self.himwfikanwk = himwfikanwk or {}
        self.xpqwtepewcw: np.ndarray | None = None
        self.aadgkwiaxgf = max((len(pyknulcwqk) for pyknulcwqk in pixels), default=0)
        self.lcdwwgrtwyx = len(pixels)
        self.bifnvdxmkdu = self.himwfikanwk.get("layer", 0) if isinstance(self.himwfikanwk.get("layer"), int) else 0
        self.yrxvacxlgrf = self.himwfikanwk.get("name", "") if isinstance(self.himwfikanwk.get("name"), str) else ""

    # Readability v3: read_attribute; wwnfrkbzon.hiaiflnslto:907-908
    # Return self.aadgkwiaxgf; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def hiaiflnslto(self) -> int:
        return self.aadgkwiaxgf

    # Readability v3: read_attribute; wwnfrkbzon.jlkfqcwrspr:911-912
    # Return self.lcdwwgrtwyx; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def jlkfqcwrspr(self) -> int:
        return self.lcdwwgrtwyx

    # Readability v3: read_attribute; wwnfrkbzon.layer:915-916
    # Return self.bifnvdxmkdu; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def layer(self) -> int:
        return self.bifnvdxmkdu

    # Readability v3: read_attribute; wwnfrkbzon.name:919-920
    # Return self.yrxvacxlgrf; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def name(self) -> str:
        return self.yrxvacxlgrf

    # Readability v3: structural flow; wwnfrkbzon.sxwqiwdisg:922-931
    # Explicit 9-statement structural flow below; 2 conditions, 2 loops, 3 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sxwqiwdisg(self) -> np.ndarray:
        if self.xpqwtepewcw is not None:
            return self.xpqwtepewcw
        arr = np.full((self.lcdwwgrtwyx, self.aadgkwiaxgf), -1, dtype=np.int8)
        for y, isdpjaoopl in enumerate(self.pixels):
            for x, cgksxdlqwa in enumerate(isdpjaoopl):
                if cgksxdlqwa in self.wytdtzvcdfy:
                    arr[y, x] = self.wytdtzvcdfy[cgksxdlqwa]
        self.xpqwtepewcw = arr
        return arr


# Readability v3: structural flow; daeoulgzfx:934-950
# Explicit 16-statement structural flow below; 4 conditions, 0 loops, 8 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def daeoulgzfx(ioebcmszmx: np.ndarray, ijacxsomkw: float, uaobwaaexz: float) -> np.ndarray:
    """."""
    if ijacxsomkw == 1.0 and uaobwaaexz == 1.0:
        return ioebcmszmx
    fmnlumsqko, jomuwuxwxc = ioebcmszmx.shape
    ax, ay = (abs(ijacxsomkw), abs(uaobwaaexz))
    if ax < 0.001 or ay < 0.001:
        return np.empty((0, 0), dtype=np.int8)
    nw, nh = (max(1, int(jomuwuxwxc * ax)), max(1, int(fmnlumsqko * ay)))
    gxhwbkgoqg = np.clip((np.arange(nw) / ax).astype(np.int32), 0, jomuwuxwxc - 1)
    ctongcxuzg = np.clip((np.arange(nh) / ay).astype(np.int32), 0, fmnlumsqko - 1)
    out = ioebcmszmx[ctongcxuzg[:, None], gxhwbkgoqg]
    if ijacxsomkw < 0:
        out = out[:, ::-1]
    if uaobwaaexz < 0:
        out = out[::-1, :]
    return out


# Readability v3: structural flow; weioftzeor:953-1005
# Explicit 35-statement structural flow below; 7 conditions, 0 loops, 20 writes and 7 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def weioftzeor(ioebcmszmx: np.ndarray, sdxwoafbgo: float, pmnuvkfgph: float, swtdbzfsdj: float) -> tuple[np.ndarray, int, int]:
    """."""
    sdxwoafbgo = sdxwoafbgo % 360
    fmnlumsqko, jomuwuxwxc = ioebcmszmx.shape
    if fmnlumsqko == 0 or jomuwuxwxc == 0:
        return (ioebcmszmx, 0, 0)
    if sdxwoafbgo < 0.001 or sdxwoafbgo > 359.999:
        return (ioebcmszmx, -int(pmnuvkfgph), -int(swtdbzfsdj))
    nctyuufudm = int(sdxwoafbgo + 0.5)
    jxkwuhvdsi = abs(pmnuvkfgph - jomuwuxwxc / 2) < 0.001 and abs(swtdbzfsdj - fmnlumsqko / 2) < 0.001
    if jxkwuhvdsi and abs(sdxwoafbgo - nctyuufudm) < 0.001:
        if nctyuufudm == 90:
            pyknulcwqk = np.rot90(ioebcmszmx, -1)
            return (pyknulcwqk, -pyknulcwqk.shape[1] // 2, -pyknulcwqk.shape[0] // 2)
        if nctyuufudm == 180:
            return (np.rot90(ioebcmszmx, 2), -jomuwuxwxc // 2, -fmnlumsqko // 2)
        if nctyuufudm == 270:
            pyknulcwqk = np.rot90(ioebcmszmx, 1)
            return (pyknulcwqk, -pyknulcwqk.shape[1] // 2, -pyknulcwqk.shape[0] // 2)
    sin_a, cos_a = crhpjfhkrr(sdxwoafbgo)
    tluvpdotrr = [
        (0, 0),
        (jomuwuxwxc - 1, 0),
        (jomuwuxwxc - 1, fmnlumsqko - 1),
        (0, fmnlumsqko - 1),
    ]
    fxodmbhikh = [
        (
            (x - pmnuvkfgph) * cos_a - (y - swtdbzfsdj) * sin_a,
            (x - pmnuvkfgph) * sin_a + (y - swtdbzfsdj) * cos_a,
        )
        for x, y in tluvpdotrr
    ]
    min_x, max_x = (
        min((awuziztlvh[0] for awuziztlvh in fxodmbhikh)),
        max((awuziztlvh[0] for awuziztlvh in fxodmbhikh)),
    )
    min_y, max_y = (
        min((awuziztlvh[1] for awuziztlvh in fxodmbhikh)),
        max((awuziztlvh[1] for awuziztlvh in fxodmbhikh)),
    )
    nw, nh = (int(math.ceil(max_x - min_x)) + 1, int(math.ceil(max_y - min_y)) + 1)
    if nw <= 0 or nh <= 0:
        return (np.empty((0, 0), dtype=np.int8), 0, 0)
    ncx, ncy = (-min_x, -min_y)
    out = np.full((nh, nw), -1, dtype=np.int8)
    yc, xc = np.mgrid[0:nh, 0:nw]
    dx, dy = (xc - ncx, yc - ncy)
    magbshouxt = np.round(dx * cos_a + dy * sin_a + pmnuvkfgph).astype(np.int32)
    teuaxpvnoc = np.round(-dx * sin_a + dy * cos_a + swtdbzfsdj).astype(np.int32)
    imjnzbjpvt = (magbshouxt >= 0) & (magbshouxt < jomuwuxwxc) & (teuaxpvnoc >= 0) & (teuaxpvnoc < fmnlumsqko)
    out[imjnzbjpvt] = ioebcmszmx[teuaxpvnoc[imjnzbjpvt], magbshouxt[imjnzbjpvt]]
    return (out, -int(ncx), -int(ncy))


hgnouhgzsk = int
kjufehtkiz = Callable[[int, int], hgnouhgzsk]
oytnvcwztq = Union[hgnouhgzsk, kjufehtkiz]
eeowhyypeq = Tuple[float, float, float, float, float, float, float]


# Readability v3: structural flow; tjwiyyhktt:1014-1020
# Explicit 3-statement structural flow below; 0 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def tjwiyyhktt(aumhjjikpz: hgnouhgzsk, vuklqlgprr: hgnouhgzsk, size: int = 4) -> kjufehtkiz:
    """."""

    # Readability v3: return_expression; tjwiyyhktt.srpgxeoswu:1017-1018
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def srpgxeoswu(x: int, y: int) -> hgnouhgzsk:
        return aumhjjikpz if (x // size + y // size) % 2 == 0 else vuklqlgprr

    return srpgxeoswu


# Readability v3: structural flow; gcthmcqfbj:1023-1029
# Explicit 3-statement structural flow below; 0 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def gcthmcqfbj(aumhjjikpz: hgnouhgzsk, vuklqlgprr: hgnouhgzsk, size: int = 4) -> kjufehtkiz:
    """."""

    # Readability v3: return_expression; gcthmcqfbj.bxdfvfziei:1026-1027
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def bxdfvfziei(x: int, y: int) -> hgnouhgzsk:
        return aumhjjikpz if y // size % 2 == 0 else vuklqlgprr

    return bxdfvfziei


# Readability v3: structural flow; hyuvseigds:1032-1038
# Explicit 3-statement structural flow below; 0 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def hyuvseigds(aumhjjikpz: hgnouhgzsk, vuklqlgprr: hgnouhgzsk, size: int = 4) -> kjufehtkiz:
    """."""

    # Readability v3: return_expression; hyuvseigds.bxdfvfziei:1035-1036
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def bxdfvfziei(x: int, y: int) -> hgnouhgzsk:
        return aumhjjikpz if x // size % 2 == 0 else vuklqlgprr

    return bxdfvfziei


# Readability v3: structural flow; htuathihzm:1041-1047
# Explicit 3-statement structural flow below; 0 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def htuathihzm(aumhjjikpz: hgnouhgzsk, vuklqlgprr: hgnouhgzsk) -> kjufehtkiz:
    """."""

    # Readability v3: return_expression; htuathihzm.yiiuedghiz:1044-1045
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def yiiuedghiz(x: int, y: int) -> hgnouhgzsk:
        return aumhjjikpz if x % 2 == 0 else vuklqlgprr

    return yiiuedghiz


# Readability v3: structural flow; nudgupxlfw:1050-1056
# Explicit 3-statement structural flow below; 0 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def nudgupxlfw(aumhjjikpz: hgnouhgzsk, vuklqlgprr: hgnouhgzsk) -> kjufehtkiz:
    """."""

    # Readability v3: return_expression; nudgupxlfw.yiiuedghiz:1053-1054
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def yiiuedghiz(x: int, y: int) -> hgnouhgzsk:
        return aumhjjikpz if y % 2 == 0 else vuklqlgprr

    return yiiuedghiz


# Readability v3: structural flow; wihccsqmcp:1059-1065
# Explicit 3-statement structural flow below; 0 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def wihccsqmcp(aumhjjikpz: hgnouhgzsk, vuklqlgprr: hgnouhgzsk, size: int = 4) -> kjufehtkiz:
    """."""

    # Readability v3: return_expression; wihccsqmcp.bxdfvfziei:1062-1063
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def bxdfvfziei(x: int, y: int) -> hgnouhgzsk:
        return aumhjjikpz if (x + y) // size % 2 == 0 else vuklqlgprr

    return bxdfvfziei


# Readability v3: structural flow; lgiajlbpbh:1068-1074
# Explicit 3-statement structural flow below; 0 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def lgiajlbpbh(aumhjjikpz: hgnouhgzsk, vuklqlgprr: hgnouhgzsk, zevwyfsamq: int = 4) -> kjufehtkiz:
    """."""

    # Readability v3: return_expression; lgiajlbpbh.qamzwuxfrm:1071-1072
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def qamzwuxfrm(x: int, y: int) -> hgnouhgzsk:
        return aumhjjikpz if x % zevwyfsamq == 0 and y % zevwyfsamq == 0 else vuklqlgprr

    return qamzwuxfrm


# Readability v3: structural flow; ppinpcbcse:1077-1084
# Explicit 3-statement structural flow below; 0 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def ppinpcbcse(wytdtzvcdfy: List[hgnouhgzsk], ciezwktaud: int = 42) -> kjufehtkiz:
    """."""

    # Readability v3: structural flow; ppinpcbcse.itajrazhof:1080-1082
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def itajrazhof(x: int, y: int) -> hgnouhgzsk:
        fmnlumsqko = (x * 374761393 + y * 668265263 + ciezwktaud ^ ciezwktaud * 1013904223) & 4294967295
        return wytdtzvcdfy[fmnlumsqko % len(wytdtzvcdfy)]

    return itajrazhof


# Readability v3: structural flow; fjvjyhkusr:1087-1106
# Explicit 11-statement structural flow below; 3 conditions, 0 loops, 2 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def fjvjyhkusr(
    jvpmuyciku: Union[hgnouhgzsk, kjufehtkiz, List[kjufehtkiz]],
) -> Callable[[int, int], hgnouhgzsk]:
    """."""
    if isinstance(jvpmuyciku, int):
        awuziztlvh = int(jvpmuyciku)
        return lambda x, y: awuziztlvh
    if callable(jvpmuyciku):
        return jvpmuyciku
    utocfbzyae = list(jvpmuyciku)
    if not utocfbzyae:
        return lambda x, y: 1

    # Readability v3: structural flow; fjvjyhkusr.yablkjemtv:1100-1104
    # Explicit 4-statement structural flow below; 0 conditions, 1 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def yablkjemtv(x: int, y: int) -> hgnouhgzsk:
        v: hgnouhgzsk = utocfbzyae[0](x, y)
        for pyknulcwqk in utocfbzyae[1:]:
            v = pyknulcwqk(x, y)
        return v

    return yablkjemtv


# Readability v3: structural flow; parcmagbct:1109-1126
# Explicit 9-statement structural flow below; 1 conditions, 1 loops, 5 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def parcmagbct(
    arr: np.ndarray,
    nxqjiwemwj: np.ndarray,
    fmaxgakohk: np.ndarray,
    dcxwuvtphx: np.ndarray,
    trbizrzinr: Callable[[int, int], hgnouhgzsk],
    *,
    vlzyyllevh: Optional[int] = None,
) -> None:
    """."""
    if vlzyyllevh is not None:
        arr[nxqjiwemwj] = np.int8(vlzyyllevh)
        return
    otybvaqupl = cast(np.ndarray, np.argwhere(nxqjiwemwj))
    for fvyeqgwdmo, qwmvpwjonm in otybvaqupl:
        x = int(fmaxgakohk[fvyeqgwdmo, qwmvpwjonm])
        y = int(dcxwuvtphx[fvyeqgwdmo, qwmvpwjonm])
        arr[fvyeqgwdmo, qwmvpwjonm] = np.int8(trbizrzinr(x, y))


class hmdctdrffd(ABC):
    """."""

    bifnvdxmkdu: int | None

    # Readability v3: no_op_body; hmdctdrffd.oqnehzryfz:1135-1137
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @abstractmethod
    def oqnehzryfz(self) -> Tuple[int, int, int, int]:
        """."""
        pass

    # Readability v3: no_op_body; hmdctdrffd.zgtvuohlpp:1140-1142
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @abstractmethod
    def zgtvuohlpp(self, x: int, y: int) -> bool:
        """."""
        pass

    # Readability v3: no_op_body; hmdctdrffd.sxwqiwdisg:1145-1146
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @abstractmethod
    def sxwqiwdisg(self) -> np.ndarray:
        pass


class immlnvycgo(hmdctdrffd):
    """."""

    __slots__ = ("chfniqudacb", "rqbcokmadki", "cznripyhdsa", "bifnvdxmkdu", "ovcihmsnrwt")

    # Readability v3: structural flow; immlnvycgo.__init__:1154-1163
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 5 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        chfniqudacb: int,
        jvpmuyciku: Union[hgnouhgzsk, kjufehtkiz, List[kjufehtkiz]] = 1,
    ):
        self.chfniqudacb = chfniqudacb
        self.bifnvdxmkdu = None
        self.rqbcokmadki = fjvjyhkusr(jvpmuyciku)
        self.cznripyhdsa = int(jvpmuyciku) if isinstance(jvpmuyciku, int) else None
        self.ovcihmsnrwt: Optional[np.ndarray] = None

    # Readability v3: return_expression; immlnvycgo.oqnehzryfz:1165-1166
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def oqnehzryfz(self) -> Tuple[int, int, int, int]:
        return (-self.chfniqudacb, -self.chfniqudacb, self.chfniqudacb, self.chfniqudacb)

    # Readability v3: return_expression; immlnvycgo.zgtvuohlpp:1168-1169
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def zgtvuohlpp(self, x: int, y: int) -> bool:
        return x * x + y * y <= self.chfniqudacb * self.chfniqudacb

    # Readability v3: structural flow; immlnvycgo.sxwqiwdisg:1171-1193
    # Explicit 11-statement structural flow below; 1 conditions, 0 loops, 7 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sxwqiwdisg(self) -> np.ndarray:
        if self.ovcihmsnrwt is not None:
            return self.ovcihmsnrwt
        pyknulcwqk = self.chfniqudacb
        size = 2 * pyknulcwqk + 1
        arr = np.full((size, size), -1, dtype=np.int8)
        y, x = np.ogrid[-pyknulcwqk : pyknulcwqk + 1, -pyknulcwqk : pyknulcwqk + 1]
        nxqjiwemwj = x * x + y * y <= pyknulcwqk * pyknulcwqk
        dcxwuvtphx, fmaxgakohk = np.meshgrid(
            np.arange(-pyknulcwqk, pyknulcwqk + 1, dtype=int),
            np.arange(-pyknulcwqk, pyknulcwqk + 1, dtype=int),
            indexing="ij",
        )
        parcmagbct(
            arr,
            nxqjiwemwj,
            fmaxgakohk,
            dcxwuvtphx,
            self.rqbcokmadki,
            vlzyyllevh=self.cznripyhdsa,
        )
        self.ovcihmsnrwt = arr
        return arr


class xpsmcpstdr(hmdctdrffd):
    """."""

    __slots__ = (
        "hiaiflnslto",
        "jlkfqcwrspr",
        "rqbcokmadki",
        "cznripyhdsa",
        "ovcihmsnrwt",
        "bifnvdxmkdu",
    )

    # Readability v3: structural flow; xpsmcpstdr.__init__:1208-1219
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 6 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        hiaiflnslto: int,
        jlkfqcwrspr: int,
        jvpmuyciku: Union[hgnouhgzsk, kjufehtkiz, List[kjufehtkiz]] = 1,
    ):
        self.hiaiflnslto = hiaiflnslto
        self.jlkfqcwrspr = jlkfqcwrspr
        self.rqbcokmadki = fjvjyhkusr(jvpmuyciku)
        self.cznripyhdsa = int(jvpmuyciku) if isinstance(jvpmuyciku, int) else None
        self.ovcihmsnrwt: Optional[np.ndarray] = None
        self.bifnvdxmkdu = None

    # Readability v3: structural flow; xpsmcpstdr.oqnehzryfz:1221-1229
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def oqnehzryfz(self) -> Tuple[int, int, int, int]:
        urdwwcjzvt = self.hiaiflnslto // 2
        wazzxbilrs = self.jlkfqcwrspr // 2
        return (
            -urdwwcjzvt,
            -wazzxbilrs,
            urdwwcjzvt + self.hiaiflnslto % 2,
            wazzxbilrs + self.jlkfqcwrspr % 2,
        )

    # Readability v3: structural flow; xpsmcpstdr.zgtvuohlpp:1231-1234
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zgtvuohlpp(self, x: int, y: int) -> bool:
        urdwwcjzvt = self.hiaiflnslto // 2
        wazzxbilrs = self.jlkfqcwrspr // 2
        return -urdwwcjzvt <= x < urdwwcjzvt + self.hiaiflnslto % 2 and -wazzxbilrs <= y < wazzxbilrs + self.jlkfqcwrspr % 2

    # Readability v3: structural flow; xpsmcpstdr.sxwqiwdisg:1236-1257
    # Explicit 14-statement structural flow below; 1 conditions, 0 loops, 10 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sxwqiwdisg(self) -> np.ndarray:
        if self.ovcihmsnrwt is not None:
            return self.ovcihmsnrwt
        urdwwcjzvt = self.hiaiflnslto // 2
        wazzxbilrs = self.jlkfqcwrspr // 2
        max_x = urdwwcjzvt + self.hiaiflnslto % 2
        max_y = wazzxbilrs + self.jlkfqcwrspr % 2
        mdsaekvfgi = np.arange(-urdwwcjzvt, max_x, dtype=int)
        gsfoybhtor = np.arange(-wazzxbilrs, max_y, dtype=int)
        dcxwuvtphx, fmaxgakohk = np.meshgrid(gsfoybhtor, mdsaekvfgi, indexing="ij")
        arr = np.full((dcxwuvtphx.shape[0], dcxwuvtphx.shape[1]), -1, dtype=np.int8)
        nxqjiwemwj = np.ones_like(arr, dtype=bool)
        parcmagbct(
            arr,
            nxqjiwemwj,
            fmaxgakohk,
            dcxwuvtphx,
            self.rqbcokmadki,
            vlzyyllevh=self.cznripyhdsa,
        )
        self.ovcihmsnrwt = arr
        return arr


class kdguhvvijm(hmdctdrffd):
    """."""

    __slots__ = (
        "eqkshkbdgua",
        "aauuzgmpxyj",
        "kxepbffzqnj",
        "bkilijtlbqw",
        "iyczyafxsxh",
        "rqbcokmadki",
        "cznripyhdsa",
        "ovcihmsnrwt",
        "bifnvdxmkdu",
    )

    # Readability v3: structural flow; kdguhvvijm.__init__:1275-1289
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 6 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        eqkshkbdgua: int,
        aauuzgmpxyj: int,
        kxepbffzqnj: int,
        bkilijtlbqw: int,
        iyczyafxsxh: int = 1,
        jvpmuyciku: Union[hgnouhgzsk, kjufehtkiz, List[kjufehtkiz]] = 1,
    ):
        self.eqkshkbdgua, self.aauuzgmpxyj, self.kxepbffzqnj, self.bkilijtlbqw = (eqkshkbdgua, aauuzgmpxyj, kxepbffzqnj, bkilijtlbqw)
        self.iyczyafxsxh = iyczyafxsxh
        self.rqbcokmadki = fjvjyhkusr(jvpmuyciku)
        self.cznripyhdsa = int(jvpmuyciku) if isinstance(jvpmuyciku, int) else None
        self.ovcihmsnrwt: Optional[np.ndarray] = None
        self.bifnvdxmkdu = None

    # Readability v3: structural flow; kdguhvvijm.oqnehzryfz:1291-1298
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def oqnehzryfz(self) -> Tuple[int, int, int, int]:
        reiiyswsxj = self.iyczyafxsxh // 2
        return (
            min(self.eqkshkbdgua, self.kxepbffzqnj) - reiiyswsxj,
            min(self.aauuzgmpxyj, self.bkilijtlbqw) - reiiyswsxj,
            max(self.eqkshkbdgua, self.kxepbffzqnj) + reiiyswsxj + 1,
            max(self.aauuzgmpxyj, self.bkilijtlbqw) + reiiyswsxj + 1,
        )

    # Readability v3: structural flow; kdguhvvijm.zgtvuohlpp:1300-1311
    # Explicit 10-statement structural flow below; 1 conditions, 0 loops, 8 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zgtvuohlpp(self, x: int, y: int) -> bool:
        dx = self.kxepbffzqnj - self.eqkshkbdgua
        dy = self.bkilijtlbqw - self.aauuzgmpxyj
        socrjtmewm = dx * dx + dy * dy
        if socrjtmewm == 0:
            zloaxgsxgj = math.pow(x - self.eqkshkbdgua, 2) + math.pow(y - self.aauuzgmpxyj, 2)
        else:
            reiiyswsxj = max(0, min(1, ((x - self.eqkshkbdgua) * dx + (y - self.aauuzgmpxyj) * dy) / socrjtmewm))
            xsuncnvtlg = self.eqkshkbdgua + reiiyswsxj * dx
            uzibeyeyjn = self.aauuzgmpxyj + reiiyswsxj * dy
            zloaxgsxgj = math.pow(x - xsuncnvtlg, 2) + math.pow(y - uzibeyeyjn, 2)
        return zloaxgsxgj <= (self.iyczyafxsxh / 2) ** 2

    # Readability v3: structural flow; kdguhvvijm.sxwqiwdisg:1313-1345
    # Explicit 24-statement structural flow below; 2 conditions, 0 loops, 19 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sxwqiwdisg(self) -> np.ndarray:
        if self.ovcihmsnrwt is not None:
            return self.ovcihmsnrwt
        min_x, min_y, max_x, max_y = self.oqnehzryfz()
        mdsaekvfgi = np.arange(min_x, max_x, dtype=int)
        gsfoybhtor = np.arange(min_y, max_y, dtype=int)
        dcxwuvtphx, fmaxgakohk = np.meshgrid(gsfoybhtor, mdsaekvfgi, indexing="ij")
        arr = np.full((dcxwuvtphx.shape[0], dcxwuvtphx.shape[1]), -1, dtype=np.int8)
        dx = self.kxepbffzqnj - self.eqkshkbdgua
        dy = self.bkilijtlbqw - self.aauuzgmpxyj
        socrjtmewm = dx * dx + dy * dy
        pvsmdahkja = fmaxgakohk.astype(np.float64)
        icwqzyemjd = dcxwuvtphx.astype(np.float64)
        if socrjtmewm == 0:
            zloaxgsxgj = (pvsmdahkja - self.eqkshkbdgua) ** 2 + (icwqzyemjd - self.aauuzgmpxyj) ** 2
        else:
            reiiyswsxj = ((pvsmdahkja - self.eqkshkbdgua) * dx + (icwqzyemjd - self.aauuzgmpxyj) * dy) / float(socrjtmewm)
            reiiyswsxj = np.clip(reiiyswsxj, 0.0, 1.0)
            xsuncnvtlg = self.eqkshkbdgua + reiiyswsxj * dx
            uzibeyeyjn = self.aauuzgmpxyj + reiiyswsxj * dy
            zloaxgsxgj = (pvsmdahkja - xsuncnvtlg) ** 2 + (icwqzyemjd - uzibeyeyjn) ** 2
        nidnziytzq = self.iyczyafxsxh / 2.0
        nxqjiwemwj = zloaxgsxgj <= nidnziytzq * nidnziytzq
        parcmagbct(
            arr,
            nxqjiwemwj,
            fmaxgakohk,
            dcxwuvtphx,
            self.rqbcokmadki,
            vlzyyllevh=self.cznripyhdsa,
        )
        self.ovcihmsnrwt = arr
        return arr


class apptzayvru(hmdctdrffd):
    """."""

    __slots__ = (
        "smhvwnvfhfr",
        "chfniqudacb",
        "dkhseicykgw",
        "anithmlexyc",
        "rqbcokmadki",
        "cznripyhdsa",
        "ovcihmsnrwt",
        "bifnvdxmkdu",
    )

    # Readability v3: structural flow; apptzayvru.__init__:1362-1378
    # Explicit 10-statement structural flow below; 2 conditions, 0 loops, 8 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        smhvwnvfhfr: int,
        chfniqudacb: int,
        dkhseicykgw: float = 0.0,
        jvpmuyciku: Union[hgnouhgzsk, kjufehtkiz, List[kjufehtkiz]] = 1,
    ):
        if smhvwnvfhfr < 3:
            raise ValueError("Polygon must have at least 3 smhvwnvfhfr")
        self.smhvwnvfhfr = smhvwnvfhfr
        self.chfniqudacb = chfniqudacb
        self.dkhseicykgw = dkhseicykgw
        self.anithmlexyc = self.xwyefcnhat()
        self.rqbcokmadki = fjvjyhkusr(jvpmuyciku)
        self.cznripyhdsa = int(jvpmuyciku) if isinstance(jvpmuyciku, int) else None
        self.ovcihmsnrwt: Optional[np.ndarray] = None
        self.bifnvdxmkdu = None

    # Readability v3: structural flow; apptzayvru.xwyefcnhat:1380-1385
    # Explicit 5-statement structural flow below; 0 conditions, 1 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def xwyefcnhat(self) -> List[Tuple[float, float]]:
        zpqjimhvbb = []
        for i in range(self.smhvwnvfhfr):
            sdxwoafbgo = 2 * math.pi * i / self.smhvwnvfhfr + self.dkhseicykgw - math.pi / 2
            zpqjimhvbb.append((self.chfniqudacb * math.cos(sdxwoafbgo), self.chfniqudacb * math.sin(sdxwoafbgo)))
        return zpqjimhvbb

    # Readability v3: return_expression; apptzayvru.oqnehzryfz:1387-1388
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def oqnehzryfz(self) -> Tuple[int, int, int, int]:
        return (-self.chfniqudacb, -self.chfniqudacb, self.chfniqudacb, self.chfniqudacb)

    # Readability v3: structural flow; apptzayvru.zgtvuohlpp:1390-1400
    # Explicit 10-statement structural flow below; 1 conditions, 1 loops, 7 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zgtvuohlpp(self, x: int, y: int) -> bool:
        rvzkzdqutc = False
        wfjffncuge = len(self.anithmlexyc)
        kkilotjgmx = wfjffncuge - 1
        for i in range(wfjffncuge):
            gxhwbkgoqg, ctongcxuzg = self.anithmlexyc[i]
            xj, yj = self.anithmlexyc[kkilotjgmx]
            if (ctongcxuzg > y) != (yj > y) and x < (xj - gxhwbkgoqg) * (y - ctongcxuzg) / (yj - ctongcxuzg) + gxhwbkgoqg:
                rvzkzdqutc = not rvzkzdqutc
            kkilotjgmx = i
        return rvzkzdqutc

    # Readability v3: structural flow; apptzayvru.sxwqiwdisg:1402-1426
    # Explicit 14-statement structural flow below; 1 conditions, 2 loops, 8 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sxwqiwdisg(self) -> np.ndarray:
        if self.ovcihmsnrwt is not None:
            return self.ovcihmsnrwt
        pyknulcwqk = self.chfniqudacb
        mdsaekvfgi = np.arange(-pyknulcwqk, pyknulcwqk + 1, dtype=int)
        gsfoybhtor = np.arange(-pyknulcwqk, pyknulcwqk + 1, dtype=int)
        dcxwuvtphx, fmaxgakohk = np.meshgrid(gsfoybhtor, mdsaekvfgi, indexing="ij")
        arr = np.full((2 * pyknulcwqk + 1, 2 * pyknulcwqk + 1), -1, dtype=np.int8)
        nxqjiwemwj = np.zeros_like(arr, dtype=bool)
        for fvyeqgwdmo in range(arr.shape[0]):
            for qwmvpwjonm in range(arr.shape[1]):
                nxqjiwemwj[fvyeqgwdmo, qwmvpwjonm] = self.zgtvuohlpp(
                    int(fmaxgakohk[fvyeqgwdmo, qwmvpwjonm]),
                    int(dcxwuvtphx[fvyeqgwdmo, qwmvpwjonm]),
                )
        parcmagbct(
            arr,
            nxqjiwemwj,
            fmaxgakohk,
            dcxwuvtphx,
            self.rqbcokmadki,
            vlzyyllevh=self.cznripyhdsa,
        )
        self.ovcihmsnrwt = arr
        return arr


class sceitkeboe(hmdctdrffd):
    """."""

    __slots__ = ("fncczojbhmp", "rqbcokmadki", "cznripyhdsa", "ovcihmsnrwt", "bifnvdxmkdu")

    # Readability v3: structural flow; sceitkeboe.__init__:1434-1445
    # Explicit 7-statement structural flow below; 2 conditions, 0 loops, 5 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        zpqjimhvbb: List[Tuple[int, int]],
        jvpmuyciku: Union[hgnouhgzsk, kjufehtkiz, List[kjufehtkiz]] = 1,
    ):
        if len(zpqjimhvbb) < 3:
            raise ValueError("Shape must have at least 3 fncczojbhmp")
        self.zpqjimhvbb = zpqjimhvbb
        self.rqbcokmadki = fjvjyhkusr(jvpmuyciku)
        self.cznripyhdsa = int(jvpmuyciku) if isinstance(jvpmuyciku, int) else None
        self.ovcihmsnrwt: Optional[np.ndarray] = None
        self.bifnvdxmkdu = None

    # Readability v3: structural flow; sceitkeboe.oqnehzryfz:1447-1450
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def oqnehzryfz(self) -> Tuple[int, int, int, int]:
        fmaxgakohk = [v[0] for v in self.zpqjimhvbb]
        dcxwuvtphx = [v[1] for v in self.zpqjimhvbb]
        return (min(fmaxgakohk), min(dcxwuvtphx), max(fmaxgakohk), max(dcxwuvtphx))

    # Readability v3: structural flow; sceitkeboe.zgtvuohlpp:1452-1462
    # Explicit 10-statement structural flow below; 1 conditions, 1 loops, 7 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zgtvuohlpp(self, x: int, y: int) -> bool:
        rvzkzdqutc = False
        wfjffncuge = len(self.zpqjimhvbb)
        kkilotjgmx = wfjffncuge - 1
        for i in range(wfjffncuge):
            gxhwbkgoqg, ctongcxuzg = self.zpqjimhvbb[i]
            xj, yj = self.zpqjimhvbb[kkilotjgmx]
            if (ctongcxuzg > y) != (yj > y) and x < (xj - gxhwbkgoqg) * (y - ctongcxuzg) / (yj - ctongcxuzg) + gxhwbkgoqg:
                rvzkzdqutc = not rvzkzdqutc
            kkilotjgmx = i
        return rvzkzdqutc

    # Readability v3: structural flow; sceitkeboe.sxwqiwdisg:1464-1488
    # Explicit 14-statement structural flow below; 1 conditions, 2 loops, 8 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sxwqiwdisg(self) -> np.ndarray:
        if self.ovcihmsnrwt is not None:
            return self.ovcihmsnrwt
        min_x, min_y, max_x, max_y = self.oqnehzryfz()
        mdsaekvfgi = np.arange(min_x, max_x + 1, dtype=int)
        gsfoybhtor = np.arange(min_y, max_y + 1, dtype=int)
        dcxwuvtphx, fmaxgakohk = np.meshgrid(gsfoybhtor, mdsaekvfgi, indexing="ij")
        arr = np.full((dcxwuvtphx.shape[0], dcxwuvtphx.shape[1]), -1, dtype=np.int8)
        nxqjiwemwj = np.zeros_like(arr, dtype=bool)
        for fvyeqgwdmo in range(arr.shape[0]):
            for qwmvpwjonm in range(arr.shape[1]):
                nxqjiwemwj[fvyeqgwdmo, qwmvpwjonm] = self.zgtvuohlpp(
                    int(fmaxgakohk[fvyeqgwdmo, qwmvpwjonm]),
                    int(dcxwuvtphx[fvyeqgwdmo, qwmvpwjonm]),
                )
        parcmagbct(
            arr,
            nxqjiwemwj,
            fmaxgakohk,
            dcxwuvtphx,
            self.rqbcokmadki,
            vlzyyllevh=self.cznripyhdsa,
        )
        self.ovcihmsnrwt = arr
        return arr


class qoljprchpbb:
    """."""

    __slots__ = (
        "eocrokcvgsq",
        "htoojidbdud",
        "vwkvvkakmhh",
        "ultqqtpbdxi",
        "fjhfwhfazwo",
        "yrxvacxlgrf",
        "kuhrdwbqiqf",
        "nqyzyfvbkff",
        "rxmjztculbk",
        "bifnvdxmkdu",
        "ywqrmtfisfd",
        "tnxxzczblvt",
        "ppoluxgtqul",
        "ntaykiuhwea",
        "yknqdbfdmws",
        "evxqasxmlqa",
        "nbfourfrhsm",
        "frcuqgcfriu",
        "thjlxkglewl",
        "lrggiefpfpe",
        "fwmrusyzvre",
        "pjgnbnjpekc",
        "scvfeiyvnhp",
        "lnmwqhcyjmf",
        "gmhhfvghrrq",
        "cimmdejoxnr",
    )
    vyjcakhduu = False

    # Readability v3: structural flow; qoljprchpbb.__init__:1524-1559
    # Explicit 22-statement structural flow below; 3 conditions, 0 loops, 22 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        klxajkxujf: str | wwnfrkbzon | hmdctdrffd | None = None,
        name: str = "",
        x: int = 0,
        y: int = 0,
        nepdducgbdd: float = 1.0,
        sawwyplkacb: float = 1.0,
        hbkrjpafcf: float = 0.0,
        sahsqexozi: float = 0.0,
        ylgzegyfhj: float = 0.0,
        grvlcahkrf: float = 0.0,
        dkhseicykgw: float = 0.0,
    ):
        self.eocrokcvgsq, self.htoojidbdud = (x, y)
        self.vwkvvkakmhh = klxajkxujf if isinstance(klxajkxujf, str) else None
        self.ultqqtpbdxi = klxajkxujf if isinstance(klxajkxujf, wwnfrkbzon) else None
        self.fjhfwhfazwo = klxajkxujf if isinstance(klxajkxujf, hmdctdrffd) else None
        self.yrxvacxlgrf = name
        self.kuhrdwbqiqf = True
        self.nqyzyfvbkff: qoljprchpbb | None = None
        self.rxmjztculbk: list[qoljprchpbb] = []
        self.bifnvdxmkdu = 0
        self.ywqrmtfisfd: rjfmjxejeiq | None = None
        self.tnxxzczblvt, self.ppoluxgtqul = (nepdducgbdd, sawwyplkacb)
        self.ntaykiuhwea = float(dkhseicykgw) % 360
        self.yknqdbfdmws, self.evxqasxmlqa = (hbkrjpafcf, sahsqexozi)
        self.nbfourfrhsm, self.frcuqgcfriu = (ylgzegyfhj, grvlcahkrf)
        self.thjlxkglewl = True
        self.lrggiefpfpe = (x, y)
        self.fwmrusyzvre = True
        self.pjgnbnjpekc = (nepdducgbdd, sawwyplkacb)
        self.scvfeiyvnhp = True
        self.lnmwqhcyjmf = self.ntaykiuhwea
        self.gmhhfvghrrq: tuple[np.ndarray, int, int] | None = None
        self.cimmdejoxnr: tuple[int, float, float, float, float, float] | None = None

    # Readability v3: read_attribute; qoljprchpbb.name:1562-1563
    # Return self.yrxvacxlgrf; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def name(self) -> str:
        return self.yrxvacxlgrf

    # Readability v3: update_binding; qoljprchpbb.name:1566-1567
    # Perform self.yrxvacxlgrf = v; argument/attribute spellings are preserved. [structural-contract]
    @name.setter
    def name(self, v: str) -> None:
        self.yrxvacxlgrf = v

    # Readability v3: read_attribute; qoljprchpbb.x:1570-1571
    # Return self.eocrokcvgsq; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def x(self) -> int:
        return self.eocrokcvgsq

    # Readability v3: structural flow; qoljprchpbb.x:1574-1576
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @x.setter
    def x(self, v: int) -> None:
        self.eocrokcvgsq = v
        self.ukrszbsfvq()

    # Readability v3: read_attribute; qoljprchpbb.y:1579-1580
    # Return self.htoojidbdud; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def y(self) -> int:
        return self.htoojidbdud

    # Readability v3: structural flow; qoljprchpbb.y:1583-1585
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @y.setter
    def y(self, v: int) -> None:
        self.htoojidbdud = v
        self.ukrszbsfvq()

    # Readability v3: return_expression; qoljprchpbb.cdpcbbnfdp:1588-1589
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def cdpcbbnfdp(self) -> tuple[int, int]:
        return (self.eocrokcvgsq, self.htoojidbdud)

    # Readability v3: structural flow; qoljprchpbb.cdpcbbnfdp:1592-1594
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @cdpcbbnfdp.setter
    def cdpcbbnfdp(self, v: tuple[int, int]) -> None:
        self.eocrokcvgsq, self.htoojidbdud = v
        self.ukrszbsfvq()

    # Readability v3: read_attribute; qoljprchpbb.visible:1597-1598
    # Return self.kuhrdwbqiqf; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def visible(self) -> bool:
        return self.kuhrdwbqiqf

    # Readability v3: structural flow; qoljprchpbb.visible:1601-1606
    # Explicit 5-statement structural flow below; 2 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @visible.setter
    def visible(self, v: bool) -> None:
        if self.kuhrdwbqiqf != v:
            self.kuhrdwbqiqf = v
            tjncrlniyt = self.yswnmusrpq()
            if tjncrlniyt:
                tjncrlniyt.wuomahqexpl = True

    # Readability v3: read_attribute; qoljprchpbb.layer:1609-1610
    # Return self.bifnvdxmkdu; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def layer(self) -> int:
        return self.bifnvdxmkdu

    # Readability v3: structural flow; qoljprchpbb.layer:1613-1619
    # Explicit 6-statement structural flow below; 2 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @layer.setter
    def layer(self, v: int) -> None:
        if self.bifnvdxmkdu != v:
            self.bifnvdxmkdu = v
            tjncrlniyt = self.yswnmusrpq()
            if tjncrlniyt:
                tjncrlniyt.wlblbzaghgm = True
                tjncrlniyt.wuomahqexpl = True

    # Readability v3: read_attribute; qoljprchpbb.nepdducgbdd:1622-1623
    # Return self.tnxxzczblvt; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def nepdducgbdd(self) -> float:
        return self.tnxxzczblvt

    # Readability v3: structural flow; qoljprchpbb.nepdducgbdd:1626-1628
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @nepdducgbdd.setter
    def nepdducgbdd(self, v: float) -> None:
        self.tnxxzczblvt = v
        self.ftnhhwoybs()

    # Readability v3: read_attribute; qoljprchpbb.sawwyplkacb:1631-1632
    # Return self.ppoluxgtqul; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def sawwyplkacb(self) -> float:
        return self.ppoluxgtqul

    # Readability v3: structural flow; qoljprchpbb.sawwyplkacb:1635-1637
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @sawwyplkacb.setter
    def sawwyplkacb(self, v: float) -> None:
        self.ppoluxgtqul = v
        self.ftnhhwoybs()

    # Readability v3: return_expression; qoljprchpbb.scale:1640-1641
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def scale(self) -> tuple[float, float]:
        return (self.tnxxzczblvt, self.ppoluxgtqul)

    # Readability v3: structural flow; qoljprchpbb.scale:1644-1649
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @scale.setter
    def scale(self, v: tuple[float, float] | float) -> None:
        if isinstance(v, (int, float)):
            self.tnxxzczblvt = self.ppoluxgtqul = float(v)
        else:
            self.tnxxzczblvt, self.ppoluxgtqul = v
        self.ftnhhwoybs()

    # Readability v3: read_attribute; qoljprchpbb.dkhseicykgw:1652-1653
    # Return self.ntaykiuhwea; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def dkhseicykgw(self) -> float:
        return self.ntaykiuhwea

    # Readability v3: structural flow; qoljprchpbb.dkhseicykgw:1656-1658
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @dkhseicykgw.setter
    def dkhseicykgw(self, v: float) -> None:
        self.ntaykiuhwea = float(v) % 360
        self.njgacswkfa()

    # Readability v3: read_attribute; qoljprchpbb.hbkrjpafcf:1661-1662
    # Return self.yknqdbfdmws; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def hbkrjpafcf(self) -> float:
        return self.yknqdbfdmws

    # Readability v3: structural flow; qoljprchpbb.hbkrjpafcf:1665-1670
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @hbkrjpafcf.setter
    def hbkrjpafcf(self, v: float) -> None:
        self.yknqdbfdmws = v
        self.gmhhfvghrrq = None
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wuomahqexpl = True

    # Readability v3: read_attribute; qoljprchpbb.sahsqexozi:1673-1674
    # Return self.evxqasxmlqa; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def sahsqexozi(self) -> float:
        return self.evxqasxmlqa

    # Readability v3: structural flow; qoljprchpbb.sahsqexozi:1677-1682
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @sahsqexozi.setter
    def sahsqexozi(self, v: float) -> None:
        self.evxqasxmlqa = v
        self.gmhhfvghrrq = None
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wuomahqexpl = True

    # Readability v3: return_expression; qoljprchpbb.tjfoofltmc:1685-1686
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def tjfoofltmc(self) -> tuple[float, float]:
        return (self.yknqdbfdmws, self.evxqasxmlqa)

    # Readability v3: structural flow; qoljprchpbb.tjfoofltmc:1689-1694
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @tjfoofltmc.setter
    def tjfoofltmc(self, v: tuple[float, float]) -> None:
        self.yknqdbfdmws, self.evxqasxmlqa = v
        self.gmhhfvghrrq = None
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wuomahqexpl = True

    # Readability v3: read_attribute; qoljprchpbb.ylgzegyfhj:1697-1698
    # Return self.nbfourfrhsm; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def ylgzegyfhj(self) -> float:
        return self.nbfourfrhsm

    # Readability v3: structural flow; qoljprchpbb.ylgzegyfhj:1701-1705
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @ylgzegyfhj.setter
    def ylgzegyfhj(self, v: float) -> None:
        self.nbfourfrhsm = v
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wuomahqexpl = True

    # Readability v3: read_attribute; qoljprchpbb.grvlcahkrf:1708-1709
    # Return self.frcuqgcfriu; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def grvlcahkrf(self) -> float:
        return self.frcuqgcfriu

    # Readability v3: structural flow; qoljprchpbb.grvlcahkrf:1712-1716
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @grvlcahkrf.setter
    def grvlcahkrf(self, v: float) -> None:
        self.frcuqgcfriu = v
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wuomahqexpl = True

    # Readability v3: return_expression; qoljprchpbb.hjulbeqzgs:1719-1720
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def hjulbeqzgs(self) -> tuple[float, float]:
        return (self.nbfourfrhsm, self.frcuqgcfriu)

    # Readability v3: structural flow; qoljprchpbb.hjulbeqzgs:1723-1727
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @hjulbeqzgs.setter
    def hjulbeqzgs(self, v: tuple[float, float]) -> None:
        self.nbfourfrhsm, self.frcuqgcfriu = v
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wuomahqexpl = True

    # Readability v3: read_attribute; qoljprchpbb.qoifrofmiu:1730-1731
    # Return self.nqyzyfvbkff; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def qoifrofmiu(self) -> qoljprchpbb | None:
        return self.nqyzyfvbkff

    # Readability v3: return_expression; qoljprchpbb.avykuiywon:1734-1735
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def avykuiywon(self) -> list[qoljprchpbb]:
        return self.rxmjztculbk.copy()

    # Readability v3: read_attribute; qoljprchpbb.ctqmtpaxkpb:1738-1739
    # Return self.vwkvvkakmhh; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def ctqmtpaxkpb(self) -> str | None:
        return self.vwkvvkakmhh

    # Readability v3: read_attribute; qoljprchpbb.shape:1742-1743
    # Return self.fjhfwhfazwo; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def shape(self) -> hmdctdrffd | None:
        return self.fjhfwhfazwo

    # Readability v3: structural flow; qoljprchpbb.ukrszbsfvq:1745-1752
    # Explicit 7-statement structural flow below; 1 conditions, 1 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ukrszbsfvq(self) -> None:
        self.thjlxkglewl = True
        self.gmhhfvghrrq = None
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wuomahqexpl = True
        for awuziztlvh in self.rxmjztculbk:
            awuziztlvh.ukrszbsfvq()

    # Readability v3: structural flow; qoljprchpbb.ftnhhwoybs:1754-1762
    # Explicit 8-statement structural flow below; 1 conditions, 1 loops, 5 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ftnhhwoybs(self) -> None:
        self.fwmrusyzvre = True
        self.thjlxkglewl = True
        self.gmhhfvghrrq = None
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wuomahqexpl = True
        for awuziztlvh in self.rxmjztculbk:
            awuziztlvh.ftnhhwoybs()

    # Readability v3: structural flow; qoljprchpbb.njgacswkfa:1764-1772
    # Explicit 8-statement structural flow below; 1 conditions, 1 loops, 5 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def njgacswkfa(self) -> None:
        self.scvfeiyvnhp = True
        self.thjlxkglewl = True
        self.gmhhfvghrrq = None
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wuomahqexpl = True
        for awuziztlvh in self.rxmjztculbk:
            awuziztlvh.njgacswkfa()

    # Readability v3: structural flow; qoljprchpbb.xjyyzffvmz:1774-1775
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def xjyyzffvmz(self) -> None:
        self.ukrszbsfvq()

    # Readability v3: structural flow; qoljprchpbb.vbuqqpukzf:1777-1778
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def vbuqqpukzf(self) -> None:
        self.njgacswkfa()

    # Readability v3: structural flow; qoljprchpbb.mepgityjcj:1780-1802
    # Explicit 14-statement structural flow below; 3 conditions, 0 loops, 9 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def mepgityjcj(self) -> tuple[int, int]:
        if not self.thjlxkglewl:
            return self.lrggiefpfpe
        if self.nqyzyfvbkff is None:
            self.lrggiefpfpe = (self.eocrokcvgsq, self.htoojidbdud)
        else:
            zbrerjpjoo, rbeioinzyb = self.nqyzyfvbkff.mepgityjcj()
            psx, psy = self.nqyzyfvbkff.fyxfomjvvi()
            ijacxsomkw, uaobwaaexz = (self.eocrokcvgsq * psx, self.htoojidbdud * psy)
            aewfejblid = self.nqyzyfvbkff.czchcklphk()
            if aewfejblid > 0.001:
                sin_a, cos_a = crhpjfhkrr(aewfejblid)
                self.lrggiefpfpe = (
                    int(ijacxsomkw * cos_a - uaobwaaexz * sin_a + zbrerjpjoo),
                    int(ijacxsomkw * sin_a + uaobwaaexz * cos_a + rbeioinzyb),
                )
            else:
                self.lrggiefpfpe = (
                    int(ijacxsomkw + zbrerjpjoo),
                    int(uaobwaaexz + rbeioinzyb),
                )
        self.thjlxkglewl = False
        return self.lrggiefpfpe

    # Readability v3: structural flow; qoljprchpbb.fyxfomjvvi:1804-1813
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 4 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def fyxfomjvvi(self) -> tuple[float, float]:
        if not self.fwmrusyzvre:
            return self.pjgnbnjpekc
        if self.nqyzyfvbkff is None:
            self.pjgnbnjpekc = (self.tnxxzczblvt, self.ppoluxgtqul)
        else:
            zbrerjpjoo, rbeioinzyb = self.nqyzyfvbkff.fyxfomjvvi()
            self.pjgnbnjpekc = (self.tnxxzczblvt * zbrerjpjoo, self.ppoluxgtqul * rbeioinzyb)
        self.fwmrusyzvre = False
        return self.pjgnbnjpekc

    # Readability v3: structural flow; qoljprchpbb.czchcklphk:1815-1823
    # Explicit 7-statement structural flow below; 2 conditions, 0 loops, 3 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def czchcklphk(self) -> float:
        if not self.scvfeiyvnhp:
            return self.lnmwqhcyjmf
        if self.nqyzyfvbkff is None:
            self.lnmwqhcyjmf = self.ntaykiuhwea
        else:
            self.lnmwqhcyjmf = (self.ntaykiuhwea + self.nqyzyfvbkff.czchcklphk()) % 360
        self.scvfeiyvnhp = False
        return self.lnmwqhcyjmf

    # Readability v3: structural flow; qoljprchpbb.set_position:1825-1827
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def set_position(self, x: int, y: int) -> None:
        self.eocrokcvgsq, self.htoojidbdud = (x, y)
        self.ukrszbsfvq()

    # Readability v3: structural flow; qoljprchpbb.hjwbszjrnc:1829-1832
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hjwbszjrnc(self, dx: int, dy: int) -> None:
        self.eocrokcvgsq += dx
        self.htoojidbdud += dy
        self.ukrszbsfvq()

    # Readability v3: structural flow; qoljprchpbb.tsojufjsxj:1834-1847
    # Explicit 12-statement structural flow below; 4 conditions, 0 loops, 8 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def tsojufjsxj(self, klxajkxujf: str | wwnfrkbzon | hmdctdrffd | None) -> None:
        if isinstance(klxajkxujf, str):
            self.vwkvvkakmhh, self.ultqqtpbdxi, self.fjhfwhfazwo = (klxajkxujf, None, None)
        elif isinstance(klxajkxujf, wwnfrkbzon):
            self.vwkvvkakmhh, self.ultqqtpbdxi, self.fjhfwhfazwo = (None, klxajkxujf, None)
        elif isinstance(klxajkxujf, hmdctdrffd):
            self.vwkvvkakmhh, self.ultqqtpbdxi, self.fjhfwhfazwo = (None, None, klxajkxujf)
        else:
            self.vwkvvkakmhh = self.ultqqtpbdxi = self.fjhfwhfazwo = None
        self.gmhhfvghrrq = None
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wlblbzaghgm = True
            tjncrlniyt.wuomahqexpl = True

    # Readability v3: structural flow; qoljprchpbb.oyzpaylqco:1849-1860
    # Explicit 11-statement structural flow below; 2 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def oyzpaylqco(self, kgjynspwva: qoljprchpbb) -> None:
        if kgjynspwva.nqyzyfvbkff:
            kgjynspwva.nqyzyfvbkff.kjcgxeembe(kgjynspwva)
        kgjynspwva.nqyzyfvbkff = self
        self.rxmjztculbk.append(kgjynspwva)
        kgjynspwva.ukrszbsfvq()
        kgjynspwva.ftnhhwoybs()
        kgjynspwva.njgacswkfa()
        tjncrlniyt = self.yswnmusrpq()
        if tjncrlniyt:
            tjncrlniyt.wlblbzaghgm = True
            tjncrlniyt.wuomahqexpl = True

    # Readability v3: structural flow; qoljprchpbb.kjcgxeembe:1862-1871
    # Explicit 9-statement structural flow below; 2 conditions, 0 loops, 4 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def kjcgxeembe(self, kgjynspwva: qoljprchpbb) -> bool:
        if kgjynspwva in self.rxmjztculbk:
            self.rxmjztculbk.remove(kgjynspwva)
            kgjynspwva.nqyzyfvbkff = None
            tjncrlniyt = self.yswnmusrpq()
            if tjncrlniyt:
                tjncrlniyt.wlblbzaghgm = True
                tjncrlniyt.wuomahqexpl = True
            return True
        return False

    # Readability v3: structural flow; qoljprchpbb.qwlkaghtqu:1873-1882
    # Explicit 9-statement structural flow below; 2 conditions, 0 loops, 4 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def qwlkaghtqu(self) -> bool:
        if self.nqyzyfvbkff is None:
            return False
        tjncrlniyt = self.yswnmusrpq()
        self.nqyzyfvbkff.rxmjztculbk.remove(self)
        self.nqyzyfvbkff = None
        if tjncrlniyt:
            tjncrlniyt.wlblbzaghgm = True
            tjncrlniyt.wuomahqexpl = True
        return True

    # Readability v3: structural flow; qoljprchpbb.boylbevrwt:1884-1889
    # Explicit 5-statement structural flow below; 0 conditions, 1 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def boylbevrwt(self) -> list[qoljprchpbb]:
        result = []
        for awuziztlvh in self.rxmjztculbk:
            result.append(awuziztlvh)
            result.extend(awuziztlvh.boylbevrwt())
        return result

    # Readability v3: structural flow; qoljprchpbb.ehdrirtgji:1891-1895
    # Explicit 4-statement structural flow below; 1 conditions, 1 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ehdrirtgji(self, name: str) -> qoljprchpbb | None:
        for awuziztlvh in self.rxmjztculbk:
            if awuziztlvh.yrxvacxlgrf == name:
                return awuziztlvh
        return None

    # Readability v3: structural flow; qoljprchpbb.qswzkbxjoi:1897-1904
    # Explicit 7-statement structural flow below; 2 conditions, 1 loops, 1 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def qswzkbxjoi(self, name: str) -> qoljprchpbb | None:
        for awuziztlvh in self.rxmjztculbk:
            if awuziztlvh.yrxvacxlgrf == name:
                return awuziztlvh
            idtkimnsuo = awuziztlvh.qswzkbxjoi(name)
            if idtkimnsuo:
                return idtkimnsuo
        return None

    # Readability v3: structural flow; qoljprchpbb.yswnmusrpq:1906-1910
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def yswnmusrpq(self) -> rjfmjxejeiq | None:
        wfjffncuge: qoljprchpbb | None = self
        while wfjffncuge is not None and wfjffncuge.nqyzyfvbkff is not None:
            wfjffncuge = wfjffncuge.nqyzyfvbkff
        return getattr(wfjffncuge, "ywqrmtfisfd", None)

    # Readability v3: return_expression; qoljprchpbb.dlxcsfkbtv:1912-1913
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def dlxcsfkbtv(self) -> rjfmjxejeiq | None:
        return self.yswnmusrpq()

    # Readability v3: structural flow; qoljprchpbb.yzcafrbdni:1915-1923
    # Explicit 7-statement structural flow below; 2 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def yzcafrbdni(self, action: "aotzmhqympw", oegtnpbqims: rjfmjxejeiq | None = None) -> None:
        tjncrlniyt = oegtnpbqims or self.yswnmusrpq()
        if tjncrlniyt is None:
            raise RuntimeError("qoljprchpbb not attached to oegtnpbqims")
        pnemsqzivz = tjncrlniyt.ayzwskudho()
        if pnemsqzivz.krmlmnmsivv:
            action.twwsxhbaya(self, czbpfskcya(pnemsqzivz))
        else:
            tjncrlniyt.stfqbqlnehs.append((self, action))


class gplorbkkwz(qoljprchpbb):
    """."""

    __slots__ = ("kqcjdxxpvxv", "mkaoaxcivbx")
    vyjcakhduu = True

    # Readability v3: structural flow; gplorbkkwz.__init__:1932-1942
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        ncyhdwkjkk: int = 64,
        keqmpyoasi: int = 64,
        x: int = 0,
        y: int = 0,
        scale: float = 1.0,
        dkhseicykgw: float = 0.0,
    ):
        super().__init__(None, "camera", x, y, scale, scale, dkhseicykgw=dkhseicykgw)
        self.kqcjdxxpvxv, self.mkaoaxcivbx = (ncyhdwkjkk, keqmpyoasi)

    # Readability v3: read_attribute; gplorbkkwz.ncyhdwkjkk:1945-1946
    # Return self.kqcjdxxpvxv; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def ncyhdwkjkk(self) -> int:
        return self.kqcjdxxpvxv

    # Readability v3: read_attribute; gplorbkkwz.keqmpyoasi:1949-1950
    # Return self.mkaoaxcivbx; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def keqmpyoasi(self) -> int:
        return self.mkaoaxcivbx

    # Readability v3: return_expression; gplorbkkwz.diwytvqncz:1953-1954
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def diwytvqncz(self) -> tuple[int, int]:
        return (self.kqcjdxxpvxv, self.mkaoaxcivbx)

    # Readability v3: structural flow; gplorbkkwz.kjtyouujho:1956-1958
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def kjtyouujho(self) -> tuple[int, int, int, int]:
        tozquqlwpv, mgpjkqwvnw = self.mepgityjcj()
        return (tozquqlwpv, mgpjkqwvnw, tozquqlwpv + self.kqcjdxxpvxv, mgpjkqwvnw + self.mkaoaxcivbx)

    # Readability v3: structural flow; gplorbkkwz.wpcwjuscwx:1960-1962
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wpcwjuscwx(self, x: int, y: int, jomuwuxwxc: int = 1, fmnlumsqko: int = 1) -> bool:
        lll, reiiyswsxj, pyknulcwqk, b = self.kjtyouujho()
        return not (x + jomuwuxwxc <= lll or x >= pyknulcwqk or y + fmnlumsqko <= reiiyswsxj or (y >= b))

    # Readability v3: structural flow; gplorbkkwz.tpsmvxmiks:1964-1976
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 4 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def tpsmvxmiks(self, tozquqlwpv: int, mgpjkqwvnw: int) -> tuple[int, int]:
        pmnuvkfgph, swtdbzfsdj = self.mepgityjcj()
        frazqcucjw, eenisjhtqm = (
            float(tozquqlwpv - pmnuvkfgph),
            float(mgpjkqwvnw - swtdbzfsdj),
        )
        if self.ntaykiuhwea > 0.001:
            s, awuziztlvh = crhpjfhkrr(self.ntaykiuhwea)
            frazqcucjw, eenisjhtqm = (
                frazqcucjw * awuziztlvh - eenisjhtqm * s,
                frazqcucjw * s + eenisjhtqm * awuziztlvh,
            )
        return (int(frazqcucjw * self.tnxxzczblvt), int(eenisjhtqm * self.ppoluxgtqul))

    # Readability v3: structural flow; gplorbkkwz.oaeggewzwp:1978-1989
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 3 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def oaeggewzwp(self, ijacxsomkw: int, uaobwaaexz: int) -> tuple[int, int]:
        pmnuvkfgph, swtdbzfsdj = self.mepgityjcj()
        if self.tnxxzczblvt == 0 or self.ppoluxgtqul == 0:
            return (pmnuvkfgph, swtdbzfsdj)
        ux, uy = (ijacxsomkw / self.tnxxzczblvt, uaobwaaexz / self.ppoluxgtqul)
        if self.ntaykiuhwea > 0.001:
            s, awuziztlvh = crhpjfhkrr(-self.ntaykiuhwea)
            return (
                int(ux * awuziztlvh - uy * s) + pmnuvkfgph,
                int(ux * s + uy * awuziztlvh) + swtdbzfsdj,
            )
        return (int(ux) + pmnuvkfgph, int(uy) + swtdbzfsdj)


class bjwicxpwbxc:
    """."""

    __slots__ = ("oegtnpbqims", "wslpmugjcyi", "krmlmnmsivv")

    # Readability v3: structural flow; bjwicxpwbxc.__init__:1997-2000
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, oegtnpbqims: rjfmjxejeiq):
        self.oegtnpbqims = oegtnpbqims
        self.wslpmugjcyi: list[np.ndarray] = []
        self.krmlmnmsivv = False

    # Readability v3: structural flow; bjwicxpwbxc.ktwtkhqvml:2002-2005
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ktwtkhqvml(self) -> None:
        if not self.krmlmnmsivv:
            self.krmlmnmsivv = True
            self.wslpmugjcyi = []

    # Readability v3: structural flow; bjwicxpwbxc.jonugjfvnl:2007-2010
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jonugjfvnl(self) -> None:
        """."""
        if self.krmlmnmsivv:
            self.wslpmugjcyi.append(self.oegtnpbqims.vclswpkbjs().copy())

    # Readability v3: structural flow; bjwicxpwbxc.render:2012-2020
    # Explicit 8-statement structural flow below; 1 conditions, 0 loops, 3 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def render(self) -> list[np.ndarray]:
        """."""
        if not self.krmlmnmsivv:
            return [self.oegtnpbqims.vclswpkbjs().copy()]
        self.wslpmugjcyi.append(self.oegtnpbqims.vclswpkbjs().copy())
        result = self.wslpmugjcyi
        self.wslpmugjcyi = []
        self.krmlmnmsivv = False
        return result

    # Readability v3: structural flow; bjwicxpwbxc.clear:2022-2024
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def clear(self) -> None:
        self.wslpmugjcyi = []
        self.krmlmnmsivv = False

    # Readability v3: read_attribute; bjwicxpwbxc.blzmmcfnkg:2027-2028
    # Return self.krmlmnmsivv; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def blzmmcfnkg(self) -> bool:
        return self.krmlmnmsivv


class rjfmjxejeiq:
    """."""

    __slots__ = (
        "aadgkwiaxgf",
        "lcdwwgrtwyx",
        "qqtpajjxlhn",
        "xfyfphklhzp",
        "nqxpvkylltv",
        "usqhgtsijxk",
        "wlblbzaghgm",
        "aufxjsaidrw",
        "fdvqqrgrvcc",
        "qyqblxezmdx",
        "vmoosxtgymj",
        "stfqbqlnehs",
        "diyordzobhf",
        "xzwdyefmgkv",
        "iajuzrgttrv",
        "evxflhofing",
        "wuomahqexpl",
    )

    # Readability v3: structural flow; rjfmjxejeiq.__init__:2054-2070
    # Explicit 16-statement structural flow below; 0 conditions, 0 loops, 16 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, hiaiflnslto: int = 64, jlkfqcwrspr: int = 64):
        self.aadgkwiaxgf, self.lcdwwgrtwyx = (hiaiflnslto, jlkfqcwrspr)
        self.qqtpajjxlhn: list[qoljprchpbb] = []
        self.xfyfphklhzp = np.full((jlkfqcwrspr, hiaiflnslto), -1, dtype=np.int8)
        self.nqxpvkylltv: dict[str, wwnfrkbzon] = {}
        self.usqhgtsijxk: list[tuple[int, qoljprchpbb, wwnfrkbzon | hmdctdrffd]] = []
        self.wlblbzaghgm = True
        self.wuomahqexpl = True
        self.aufxjsaidrw: bjwicxpwbxc | None = None
        self.fdvqqrgrvcc: fbnblnicrc | None = None
        self.qyqblxezmdx = False
        self.vmoosxtgymj: yghxqtcgwzi | None = None
        self.stfqbqlnehs: list[tuple[qoljprchpbb, Any]] = []
        self.diyordzobhf = False
        self.xzwdyefmgkv = gplorbkkwz(hiaiflnslto, jlkfqcwrspr)
        self.xzwdyefmgkv.ywqrmtfisfd = self
        self.iajuzrgttrv = self.evxflhofing = False

    # Readability v3: read_attribute; rjfmjxejeiq.hiaiflnslto:2073-2074
    # Return self.aadgkwiaxgf; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def hiaiflnslto(self) -> int:
        return self.aadgkwiaxgf

    # Readability v3: read_attribute; rjfmjxejeiq.jlkfqcwrspr:2077-2078
    # Return self.lcdwwgrtwyx; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def jlkfqcwrspr(self) -> int:
        return self.lcdwwgrtwyx

    # Readability v3: return_expression; rjfmjxejeiq.zonvfmmtiz:2081-2082
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def zonvfmmtiz(self) -> list[qoljprchpbb]:
        return self.qqtpajjxlhn.copy()

    # Readability v3: read_attribute; rjfmjxejeiq.camera:2085-2086
    # Return self.xzwdyefmgkv; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def camera(self) -> gplorbkkwz:
        return self.xzwdyefmgkv

    # Readability v3: update_binding; rjfmjxejeiq.win:2088-2089
    # Perform self.iajuzrgttrv = True; argument/attribute spellings are preserved. [structural-contract]
    def win(self) -> None:
        self.iajuzrgttrv = True

    # Readability v3: update_binding; rjfmjxejeiq.lose:2091-2092
    # Perform self.evxflhofing = True; argument/attribute spellings are preserved. [structural-contract]
    def lose(self) -> None:
        self.evxflhofing = True

    # Readability v3: structural flow; rjfmjxejeiq.hfsufsjsxs:2094-2097
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hfsufsjsxs(self, key: str, ioebcmszmx: wwnfrkbzon) -> None:
        self.nqxpvkylltv[key] = ioebcmszmx
        self.wlblbzaghgm = True
        self.wuomahqexpl = True

    # Readability v3: structural flow; rjfmjxejeiq.olpwrxblfq:2099-2102
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def olpwrxblfq(self, itxrcvetyx: dict[str, wwnfrkbzon]) -> None:
        self.nqxpvkylltv.update(itxrcvetyx)
        self.wlblbzaghgm = True
        self.wuomahqexpl = True

    # Readability v3: return_expression; rjfmjxejeiq.oehwtjswjc:2104-2105
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def oehwtjswjc(self, key: str) -> wwnfrkbzon | None:
        return self.nqxpvkylltv.get(key)

    # Readability v3: structural flow; rjfmjxejeiq.add:2107-2111
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def add(self, wjijkpdxjj: qoljprchpbb) -> None:
        self.qqtpajjxlhn.append(wjijkpdxjj)
        self.wlblbzaghgm = True
        self.wuomahqexpl = True
        wjijkpdxjj.ywqrmtfisfd = self

    # Readability v3: structural flow; rjfmjxejeiq.remove:2113-2119
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 2 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def remove(self, wjijkpdxjj: qoljprchpbb) -> bool:
        if wjijkpdxjj in self.qqtpajjxlhn:
            self.qqtpajjxlhn.remove(wjijkpdxjj)
            self.wlblbzaghgm = True
            self.wuomahqexpl = True
            return True
        return False

    # Readability v3: structural flow; rjfmjxejeiq.clear:2121-2125
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def clear(self) -> None:
        self.qqtpajjxlhn.clear()
        self.usqhgtsijxk.clear()
        self.wlblbzaghgm = True
        self.wuomahqexpl = True

    # Readability v3: structural flow; rjfmjxejeiq.uvtmybvfnx:2127-2134
    # Explicit 7-statement structural flow below; 2 conditions, 1 loops, 1 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def uvtmybvfnx(self, name: str) -> qoljprchpbb | None:
        for wfjffncuge in self.qqtpajjxlhn:
            if wfjffncuge.yrxvacxlgrf == name:
                return wfjffncuge
            idtkimnsuo = wfjffncuge.qswzkbxjoi(name)
            if idtkimnsuo:
                return idtkimnsuo
        return None

    # Readability v3: structural flow; rjfmjxejeiq.luszojnlqu:2136-2154
    # Explicit 18-statement structural flow below; 5 conditions, 0 loops, 7 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def luszojnlqu(self) -> list[tuple[int, qoljprchpbb, wwnfrkbzon | hmdctdrffd]]:
        """."""
        if not self.wlblbzaghgm and self.usqhgtsijxk:
            return self.usqhgtsijxk
        result: list[tuple[int, qoljprchpbb, wwnfrkbzon | hmdctdrffd]] = []
        ssavjtvrem = list(self.qqtpajjxlhn)
        lebqfosqjk = self.nqxpvkylltv
        while ssavjtvrem:
            wjijkpdxjj = ssavjtvrem.pop()
            if not wjijkpdxjj.kuhrdwbqiqf:
                continue
            ioebcmszmx = wjijkpdxjj.ultqqtpbdxi or wjijkpdxjj.fjhfwhfazwo or (lebqfosqjk.get(wjijkpdxjj.vwkvvkakmhh) if wjijkpdxjj.vwkvvkakmhh else None)
            if ioebcmszmx:
                result.append((ioebcmszmx.bifnvdxmkdu or wjijkpdxjj.bifnvdxmkdu, wjijkpdxjj, ioebcmszmx))
            ssavjtvrem.extend(wjijkpdxjj.rxmjztculbk)
        result.sort(key=lambda x: x[0])
        self.usqhgtsijxk = result
        self.wlblbzaghgm = False
        return result

    # Readability v3: structural flow; rjfmjxejeiq.vclswpkbjs:2156-2223
    # Explicit 55-statement structural flow below; 11 conditions, 1 loops, 37 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def vclswpkbjs(self) -> np.ndarray:
        """."""
        if not self.wuomahqexpl:
            return self.xfyfphklhzp
        drfrwguuzv = self.xfyfphklhzp
        drfrwguuzv.fill(BACKGROUND_COLOR)
        xbbyerwqwu = self.xzwdyefmgkv
        pmnuvkfgph, swtdbzfsdj = xbbyerwqwu.mepgityjcj()
        csx, csy = (xbbyerwqwu.tnxxzczblvt, xbbyerwqwu.ppoluxgtqul)
        ongwzffzva = xbbyerwqwu.ntaykiuhwea
        fbgtssgayq = ongwzffzva > 0.001
        if fbgtssgayq:
            cam_sin, cam_cos = crhpjfhkrr(ongwzffzva)
        jomuwuxwxc, fmnlumsqko = (self.aadgkwiaxgf, self.lcdwwgrtwyx)
        for ssnguhllov, wjijkpdxjj, qkigfmzlgw in self.luszojnlqu():
            tozquqlwpv, mgpjkqwvnw = wjijkpdxjj.mepgityjcj()
            nsx, nsy = wjijkpdxjj.fyxfomjvvi()
            jmmmltdxst = wjijkpdxjj.czchcklphk()
            tsx, tsy = (nsx * csx, nsy * csy)
            dgvprthvsm = (jmmmltdxst + ongwzffzva) % 360
            ioebcmszmx = qkigfmzlgw.sxwqiwdisg()
            if ioebcmszmx.size == 0:
                continue
            gxaewosnlt = (
                id(qkigfmzlgw),
                tsx,
                tsy,
                dgvprthvsm,
                wjijkpdxjj.yknqdbfdmws,
                wjijkpdxjj.evxqasxmlqa,
            )
            if wjijkpdxjj.cimmdejoxnr == gxaewosnlt and wjijkpdxjj.gmhhfvghrrq is not None:
                hdyakofsup, mggnmmlywm, ueppkjhsga = wjijkpdxjj.gmhhfvghrrq
            else:
                if tsx != 1.0 or tsy != 1.0:
                    ioebcmszmx = daeoulgzfx(ioebcmszmx, tsx, tsy)
                    if ioebcmszmx.size == 0:
                        continue
                xupgnglsdb, hpfvmsbdcz = ioebcmszmx.shape
                pdpbjcfntf = (1.0 - wjijkpdxjj.yknqdbfdmws if nsx < 0 else wjijkpdxjj.yknqdbfdmws) * hpfvmsbdcz
                fshkbrpvfr = (1.0 - wjijkpdxjj.evxqasxmlqa if nsy < 0 else wjijkpdxjj.evxqasxmlqa) * xupgnglsdb
                ioebcmszmx, mggnmmlywm, ueppkjhsga = weioftzeor(ioebcmszmx, dgvprthvsm, pdpbjcfntf, fshkbrpvfr)
                if ioebcmszmx.size == 0:
                    continue
                hdyakofsup = ioebcmszmx
                wjijkpdxjj.gmhhfvghrrq = (hdyakofsup, mggnmmlywm, ueppkjhsga)
                wjijkpdxjj.cimmdejoxnr = gxaewosnlt
            nxrvtszvkj, xxzgxwxjtx = hdyakofsup.shape
            frazqcucjw, eenisjhtqm = (tozquqlwpv - pmnuvkfgph, mgpjkqwvnw - swtdbzfsdj)
            if fbgtssgayq:
                khiiwinhuj = int((frazqcucjw * cam_cos - eenisjhtqm * cam_sin) * csx)
                ligyuunatl = int((frazqcucjw * cam_sin + eenisjhtqm * cam_cos) * csy)
            else:
                khiiwinhuj, ligyuunatl = (int(frazqcucjw * csx), int(eenisjhtqm * csy))
            khiiwinhuj += int(wjijkpdxjj.nbfourfrhsm * tsx) + mggnmmlywm
            ligyuunatl += int(wjijkpdxjj.frcuqgcfriu * tsy) + ueppkjhsga
            sx0, sy0 = (max(0, -khiiwinhuj), max(0, -ligyuunatl))
            sx1, sy1 = (
                min(xxzgxwxjtx, jomuwuxwxc - khiiwinhuj),
                min(nxrvtszvkj, fmnlumsqko - ligyuunatl),
            )
            if sx0 >= sx1 or sy0 >= sy1:
                continue
            rjzmlezqmp = hdyakofsup[sy0:sy1, sx0:sx1]
            nxqjiwemwj = rjzmlezqmp >= 0
            drfrwguuzv[ligyuunatl + sy0 : ligyuunatl + sy1, khiiwinhuj + sx0 : khiiwinhuj + sx1][nxqjiwemwj] = rjzmlezqmp[nxqjiwemwj]
        self.wuomahqexpl = False
        return drfrwguuzv

    # Readability v3: structural flow; rjfmjxejeiq.rozmjeilxc:2225-2283
    # Explicit 46-statement structural flow below; 15 conditions, 1 loops, 28 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def rozmjeilxc(self, x: int, y: int, dzhvkahuto: bool = True, cntfqbrjca: bool = True) -> list[qoljprchpbb]:
        result: list[qoljprchpbb] = []
        pmnuvkfgph, swtdbzfsdj = self.xzwdyefmgkv.mepgityjcj()
        csx, csy, ongwzffzva = (
            self.xzwdyefmgkv.tnxxzczblvt,
            self.xzwdyefmgkv.ppoluxgtqul,
            self.xzwdyefmgkv.ntaykiuhwea,
        )
        if dzhvkahuto:
            if csx == 0 or csy == 0:
                return result
            ux, uy = (x / csx, y / csy)
            if abs(ongwzffzva) > 0.001:
                sin_a, cos_a = ntrsxdgwaa(-ongwzffzva)
                tozquqlwpv, mgpjkqwvnw = (
                    int(ux * cos_a - uy * sin_a) + pmnuvkfgph,
                    int(ux * sin_a + uy * cos_a) + swtdbzfsdj,
                )
            else:
                tozquqlwpv, mgpjkqwvnw = (int(ux) + pmnuvkfgph, int(uy) + swtdbzfsdj)
        else:
            tozquqlwpv, mgpjkqwvnw = (x, y)
        for ssnguhllov, wjijkpdxjj, qkigfmzlgw in self.ezsfkapyvt():
            nx, ny = wjijkpdxjj.mepgityjcj()
            nsx, nsy = wjijkpdxjj.fyxfomjvvi()
            jmmmltdxst = wjijkpdxjj.czchcklphk()
            ioebcmszmx = qkigfmzlgw.sxwqiwdisg()
            if ioebcmszmx.size == 0:
                continue
            nxrvtszvkj, xxzgxwxjtx = ioebcmszmx.shape
            ax, ay = (abs(nsx), abs(nsy))
            hpfvmsbdcz = int(xxzgxwxjtx * ax) if ax > 0.001 else 0
            xupgnglsdb = int(nxrvtszvkj * ay) if ay > 0.001 else 0
            if hpfvmsbdcz == 0 or xupgnglsdb == 0:
                continue
            frazqcucjw = nx + wjijkpdxjj.nbfourfrhsm * nsx
            eenisjhtqm = ny + wjijkpdxjj.frcuqgcfriu * nsy
            mggnmmlywm = (1.0 - wjijkpdxjj.yknqdbfdmws if nsx < 0 else wjijkpdxjj.yknqdbfdmws) * hpfvmsbdcz
            ueppkjhsga = (1.0 - wjijkpdxjj.evxqasxmlqa if nsy < 0 else wjijkpdxjj.evxqasxmlqa) * xupgnglsdb
            dx, dy = (tozquqlwpv - frazqcucjw, mgpjkqwvnw - eenisjhtqm)
            if abs(jmmmltdxst) > 0.001:
                sin_a, cos_a = ntrsxdgwaa(-jmmmltdxst)
                dx, dy = (dx * cos_a - dy * sin_a, dx * sin_a + dy * cos_a)
            ytootmllvh, xxpzziewyv = (dx + mggnmmlywm, dy + ueppkjhsga)
            if 0 <= ytootmllvh < hpfvmsbdcz and 0 <= xxpzziewyv < xupgnglsdb:
                yemddzwbgl, ljjtcaexdi = (int(ytootmllvh / ax), int(xxpzziewyv / ay))
                if nsx < 0:
                    yemddzwbgl = xxzgxwxjtx - 1 - yemddzwbgl
                if nsy < 0:
                    ljjtcaexdi = nxrvtszvkj - 1 - ljjtcaexdi
                yemddzwbgl, ljjtcaexdi = (
                    max(0, min(yemddzwbgl, xxzgxwxjtx - 1)),
                    max(0, min(ljjtcaexdi, nxrvtszvkj - 1)),
                )
                if cntfqbrjca:
                    result.append(wjijkpdxjj)
                elif ioebcmszmx[ljjtcaexdi, yemddzwbgl] >= 0:
                    result.append(wjijkpdxjj)
        return result

    # Readability v3: structural flow; rjfmjxejeiq.knzdblytku:2285-2347
    # Explicit 42-statement structural flow below; 7 conditions, 1 loops, 31 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def knzdblytku(self) -> list[qoljprchpbb]:
        """."""
        result: list[qoljprchpbb] = []
        xbbyerwqwu = self.xzwdyefmgkv
        cam_x, cam_y = xbbyerwqwu.mepgityjcj()
        csx, csy, ongwzffzva = (
            xbbyerwqwu.tnxxzczblvt,
            xbbyerwqwu.ppoluxgtqul,
            xbbyerwqwu.ntaykiuhwea,
        )
        jomuwuxwxc, fmnlumsqko = (self.aadgkwiaxgf, self.lcdwwgrtwyx)
        for ssnguhllov, wjijkpdxjj, qkigfmzlgw in self.luszojnlqu():
            tozquqlwpv, mgpjkqwvnw = wjijkpdxjj.mepgityjcj()
            nsx, nsy = wjijkpdxjj.fyxfomjvvi()
            jmmmltdxst = wjijkpdxjj.czchcklphk()
            tsx, tsy = (nsx * csx, nsy * csy)
            dgvprthvsm = (jmmmltdxst + ongwzffzva) % 360
            ioebcmszmx = qkigfmzlgw.sxwqiwdisg()
            if ioebcmszmx.size == 0:
                continue
            asx, asy = (abs(tsx), abs(tsy))
            if asx < 0.001 or asy < 0.001:
                continue
            oh, ow = ioebcmszmx.shape
            hpfvmsbdcz, xupgnglsdb = (max(1, int(ow * asx)), max(1, int(oh * asy)))
            pdpbjcfntf = (wjijkpdxjj.yknqdbfdmws if nsx >= 0 else 1.0 - wjijkpdxjj.yknqdbfdmws) * hpfvmsbdcz
            fshkbrpvfr = (wjijkpdxjj.evxqasxmlqa if nsy >= 0 else 1.0 - wjijkpdxjj.evxqasxmlqa) * xupgnglsdb
            if dgvprthvsm > 0.001 and dgvprthvsm < 359.999:
                tluvpdotrr = [
                    (-pdpbjcfntf, -fshkbrpvfr),
                    (hpfvmsbdcz - pdpbjcfntf, -fshkbrpvfr),
                    (hpfvmsbdcz - pdpbjcfntf, xupgnglsdb - fshkbrpvfr),
                    (-pdpbjcfntf, xupgnglsdb - fshkbrpvfr),
                ]
                s, awuziztlvh = crhpjfhkrr(dgvprthvsm)
                fxodmbhikh = [
                    (
                        zbrerjpjoo * awuziztlvh - rbeioinzyb * s,
                        zbrerjpjoo * s + rbeioinzyb * awuziztlvh,
                    )
                    for zbrerjpjoo, rbeioinzyb in tluvpdotrr
                ]
                xxzgxwxjtx = int(math.ceil(max((p[0] for p in fxodmbhikh)) - min((p[0] for p in fxodmbhikh)))) + 1
                nxrvtszvkj = int(math.ceil(max((p[1] for p in fxodmbhikh)) - min((p[1] for p in fxodmbhikh)))) + 1
                mggnmmlywm, ueppkjhsga = (
                    int(min((p[0] for p in fxodmbhikh))),
                    int(min((p[1] for p in fxodmbhikh))),
                )
            else:
                xxzgxwxjtx, nxrvtszvkj = (hpfvmsbdcz, xupgnglsdb)
                mggnmmlywm, ueppkjhsga = (-int(pdpbjcfntf), -int(fshkbrpvfr))
            frazqcucjw, eenisjhtqm = (tozquqlwpv - cam_x, mgpjkqwvnw - cam_y)
            if ongwzffzva > 0.001:
                s, awuziztlvh = crhpjfhkrr(ongwzffzva)
                ijacxsomkw = int((frazqcucjw * awuziztlvh - eenisjhtqm * s) * csx)
                uaobwaaexz = int((frazqcucjw * s + eenisjhtqm * awuziztlvh) * csy)
            else:
                ijacxsomkw, uaobwaaexz = (int(frazqcucjw * csx), int(eenisjhtqm * csy))
            ijacxsomkw += int(wjijkpdxjj.nbfourfrhsm * tsx) + mggnmmlywm
            uaobwaaexz += int(wjijkpdxjj.frcuqgcfriu * tsy) + ueppkjhsga
            if ijacxsomkw < jomuwuxwxc and ijacxsomkw + xxzgxwxjtx > 0 and (uaobwaaexz < fmnlumsqko) and (uaobwaaexz + nxrvtszvkj > 0):
                result.append(wjijkpdxjj)
        return result

    # Readability v3: no_op_body; rjfmjxejeiq.qjwmwkhrml:2349-2350
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def qjwmwkhrml(self) -> None:
        pass

    # Readability v3: no_op_body; rjfmjxejeiq.update:2352-2353
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def update(self, qpeouzqxmz: float) -> None:
        pass

    # Readability v3: no_op_body; rjfmjxejeiq.ggqqlcoyjs:2355-2356
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def ggqqlcoyjs(self, key: str) -> None:
        pass

    # Readability v3: no_op_body; rjfmjxejeiq.jbpredqqah:2358-2359
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def jbpredqqah(self, x: int, y: int, ryizpgytqa: int) -> None:
        pass

    # Readability v3: no_op_body; rjfmjxejeiq.jxavloinxg:2361-2362
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def jxavloinxg(self, x: int, y: int) -> None:
        pass

    # Readability v3: structural flow; rjfmjxejeiq.ayzwskudho:2364-2367
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ayzwskudho(self) -> bjwicxpwbxc:
        if self.aufxjsaidrw is None:
            self.aufxjsaidrw = bjwicxpwbxc(self)
        return self.aufxjsaidrw

    # Readability v3: return_expression; rjfmjxejeiq.slyrwipbou:2369-2370
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def slyrwipbou(self) -> bjwicxpwbxc:
        return self.ayzwskudho()

    # Readability v3: structural flow; rjfmjxejeiq.jonugjfvnl:2372-2374
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jonugjfvnl(self) -> None:
        if self.aufxjsaidrw:
            self.aufxjsaidrw.jonugjfvnl()

    # Readability v3: structural flow; rjfmjxejeiq.bveuppqfzm:2376-2379
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def bveuppqfzm(self) -> None:
        if self.aufxjsaidrw:
            self.aufxjsaidrw.clear()
        self.stfqbqlnehs = []

    # Readability v3: structural flow; rjfmjxejeiq.yzcafrbdni:2381-2382
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def yzcafrbdni(self, action: Any, wjijkpdxjj: qoljprchpbb | None = None) -> None:
        (wjijkpdxjj or self.xzwdyefmgkv).yzcafrbdni(action, self)

    # Readability v3: structural flow; rjfmjxejeiq.wkezunaljt:2384-2385
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wkezunaljt(self, wjijkpdxjj: qoljprchpbb, action: Any) -> None:
        self.stfqbqlnehs.append((wjijkpdxjj, action))

    # Readability v3: structural flow; rjfmjxejeiq.fpcwfjmrxc:2387-2405
    # Explicit 17-statement structural flow below; 5 conditions, 0 loops, 7 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def fpcwfjmrxc(self) -> None:
        if not self.stfqbqlnehs:
            return
        if not GRAPH_BUILDER and STORES_UNDO:
            ngxpanegqy = self.ituunzuozw()
            ngxpanegqy.fosnoteizc()
            if not self.qyqblxezmdx and (not self.diyordzobhf):
                self.vmoosxtgymj = ngxpanegqy.vsraxtrahc()
        pnemsqzivz = self.ayzwskudho()
        pnemsqzivz.ktwtkhqvml()
        ytdvuwudpt = czbpfskcya(pnemsqzivz)
        if len(self.stfqbqlnehs) == 1:
            wfjffncuge, zyfqehjsgv = self.stfqbqlnehs[0]
            zyfqehjsgv.twwsxhbaya(wfjffncuge, ytdvuwudpt)
        else:
            aotzmhqympw.fyvegwoxwv([aotzmhqympw.ikzfriogld(wfjffncuge, zyfqehjsgv) for wfjffncuge, zyfqehjsgv in self.stfqbqlnehs]).twwsxhbaya(self.stfqbqlnehs[0][0], ytdvuwudpt)
        self.stfqbqlnehs = []
        if not GRAPH_BUILDER and STORES_UNDO and (not self.diyordzobhf):
            self.qyqblxezmdx = True

    # Readability v3: structural flow; rjfmjxejeiq.render:2407-2421
    # Explicit 14-statement structural flow below; 3 conditions, 0 loops, 6 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def render(self) -> list[np.ndarray]:
        self.fpcwfjmrxc()
        pnemsqzivz = self.ayzwskudho()
        if pnemsqzivz.krmlmnmsivv:
            wslpmugjcyi = pnemsqzivz.render()
            if self.diyordzobhf and self.fdvqqrgrvcc:
                self.diyordzobhf = False
            elif self.qyqblxezmdx and self.fdvqqrgrvcc and self.vmoosxtgymj:
                self.fdvqqrgrvcc.fosnoteizc()
                self.fdvqqrgrvcc.enbizandmjr.append(self.vmoosxtgymj)
                self.vmoosxtgymj = None
                self.qyqblxezmdx = False
            return wslpmugjcyi
        self.diyordzobhf = False
        return [self.vclswpkbjs().copy()]

    # Readability v3: structural flow; rjfmjxejeiq.ituunzuozw:2423-2426
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ituunzuozw(self) -> fbnblnicrc:
        if self.fdvqqrgrvcc is None:
            self.fdvqqrgrvcc = fbnblnicrc(self)
        return self.fdvqqrgrvcc

    # Readability v3: return_expression; rjfmjxejeiq.qpkllqfgbk:2428-2429
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def qpkllqfgbk(self) -> fbnblnicrc:
        return self.ituunzuozw()

    # Readability v3: structural flow; rjfmjxejeiq.vpanmnowjy:2431-2434
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def vpanmnowjy(self) -> None:
        if not STORES_UNDO:
            return
        self.ituunzuozw().vpanmnowjy()

    # Readability v3: structural flow; rjfmjxejeiq.aeiiavosms:2436-2443
    # Explicit 7-statement structural flow below; 2 conditions, 0 loops, 3 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def aeiiavosms(self, hqldaesygy: list[np.ndarray] | None = None) -> None:
        if GRAPH_BUILDER or not STORES_UNDO:
            return
        ngxpanegqy = self.ituunzuozw()
        ngxpanegqy.fosnoteizc()
        cubgqcyrrh = hqldaesygy[0] if hqldaesygy else None
        ngxpanegqy.wnsjgtrhey(hqldaesygy=hqldaesygy, yjuqsmnkuq=cubgqcyrrh)
        self.diyordzobhf = True

    # Readability v3: structural flow; rjfmjxejeiq.aphzlzlgni:2445-2448
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def aphzlzlgni(self) -> list[np.ndarray]:
        if self.fdvqqrgrvcc is None:
            return [self.vclswpkbjs().copy()]
        return self.fdvqqrgrvcc.aphzlzlgni() or [self.vclswpkbjs().copy()]

    # Readability v3: structural flow; rjfmjxejeiq.jhgacfwhoa:2450-2453
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jhgacfwhoa(self) -> list[np.ndarray]:
        if self.fdvqqrgrvcc is None:
            return [self.vclswpkbjs().copy()]
        return self.fdvqqrgrvcc.jhgacfwhoa() or [self.vclswpkbjs().copy()]

    # Readability v3: structural flow; rjfmjxejeiq.clejbfftth:2455-2460
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def clejbfftth(self, pyojonwemc: bool, wslpmugjcyi: int = 5) -> None:
        ngxpanegqy = self.ituunzuozw()
        ngxpanegqy.bzmkirnvucp, ngxpanegqy.bkdaabbwdtb = (
            pyojonwemc,
            wslpmugjcyi,
        )

    # Readability v3: structural flow; rjfmjxejeiq.eymiowsywc:2462-2467
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def eymiowsywc(self, pyojonwemc: bool, wslpmugjcyi: int = 10) -> None:
        ngxpanegqy = self.ituunzuozw()
        ngxpanegqy.owwefbkphrw, ngxpanegqy.bjfltcjmrms = (
            pyojonwemc,
            wslpmugjcyi,
        )

    # Readability v3: return_expression; rjfmjxejeiq.hozflswfjz:2469-2470
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def hozflswfjz(self) -> bool:
        return self.fdvqqrgrvcc.hozflswfjz if self.fdvqqrgrvcc else False

    # Readability v3: structural flow; rjfmjxejeiq.smmsvksqbl:2472-2474
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def smmsvksqbl(self) -> None:
        if self.fdvqqrgrvcc:
            self.fdvqqrgrvcc.fisdhepjwb()

    # Readability v3: read_attribute; rjfmjxejeiq._width:2477-2478
    # Return self.aadgkwiaxgf; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def _width(self) -> int:
        return self.aadgkwiaxgf

    # Readability v3: read_attribute; rjfmjxejeiq._height:2481-2482
    # Return self.lcdwwgrtwyx; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def _height(self) -> int:
        return self.lcdwwgrtwyx

    # Readability v3: read_attribute; rjfmjxejeiq._buffer:2485-2486
    # Return self.xfyfphklhzp; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def _buffer(self) -> np.ndarray:
        return self.xfyfphklhzp

    # Readability v3: read_attribute; rjfmjxejeiq._frame_recorder:2489-2490
    # Return self.aufxjsaidrw; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def _frame_recorder(self) -> bjwicxpwbxc | None:
        return self.aufxjsaidrw

    # Readability v3: read_attribute; rjfmjxejeiq._undo_manager:2493-2494
    # Return self.fdvqqrgrvcc; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def _undo_manager(self) -> fbnblnicrc | None:
        return self.fdvqqrgrvcc

    # Readability v3: read_attribute; rjfmjxejeiq.giyrmixbmt:2497-2498
    # Return self.stfqbqlnehs; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def giyrmixbmt(self) -> list[tuple[qoljprchpbb, Any]]:
        return self.stfqbqlnehs

    # Readability v3: read_attribute; rjfmjxejeiq.qnqwqrerxi:2501-2502
    # Return self.diyordzobhf; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def qnqwqrerxi(self) -> bool:
        return self.diyordzobhf

    # Readability v3: read_attribute; rjfmjxejeiq._pending_undo_capture:2505-2506
    # Return self.qyqblxezmdx; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def _pending_undo_capture(self) -> bool:
        return self.qyqblxezmdx

    # Readability v3: read_attribute; rjfmjxejeiq._pending_undo_state:2509-2510
    # Return self.vmoosxtgymj; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def _pending_undo_state(self) -> Any:
        return self.vmoosxtgymj

    # Readability v3: read_attribute; rjfmjxejeiq._sorted_cache:2513-2514
    # Return self.usqhgtsijxk; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def _sorted_cache(self) -> list[tuple[int, qoljprchpbb, wwnfrkbzon | hmdctdrffd]]:
        return self.usqhgtsijxk

    # Readability v3: return_expression; rjfmjxejeiq.ezsfkapyvt:2516-2517
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ezsfkapyvt(self) -> list[tuple[int, qoljprchpbb, wwnfrkbzon | hmdctdrffd]]:
        return self.luszojnlqu()


class bifoozynox:
    """."""

    __slots__ = ("llejtjnrsad", "wexhekhwugc", "dyvbxjpszrp")

    # Readability v3: structural flow; bifoozynox.__init__:2525-2528
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, gggapyvyyx: int = 16):
        self.llejtjnrsad = gggapyvyyx
        self.wexhekhwugc: dict[tuple[int, int], set[qoljprchpbb]] = {}
        self.dyvbxjpszrp: dict[qoljprchpbb, set[tuple[int, int]]] = {}

    # Readability v3: return_expression; bifoozynox.cenevdhabz:2530-2531
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def cenevdhabz(self, x: int, y: int) -> tuple[int, int]:
        return (x // self.llejtjnrsad, y // self.llejtjnrsad)

    # Readability v3: structural flow; bifoozynox.ecttwoonfb:2533-2536
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ecttwoonfb(self, x: int, y: int, jomuwuxwxc: int, fmnlumsqko: int) -> list[tuple[int, int]]:
        nohpdlnexz = self.cenevdhabz(x, y)
        arpeqixvuh = self.cenevdhabz(x + jomuwuxwxc - 1, y + fmnlumsqko - 1)
        return [(pmnuvkfgph, swtdbzfsdj) for pmnuvkfgph in range(nohpdlnexz[0], arpeqixvuh[0] + 1) for swtdbzfsdj in range(nohpdlnexz[1], arpeqixvuh[1] + 1)]

    # Readability v3: structural flow; bifoozynox.jqypbbpxom:2538-2542
    # Explicit 4-statement structural flow below; 0 conditions, 1 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jqypbbpxom(self, wjijkpdxjj: qoljprchpbb, x: int, y: int, jomuwuxwxc: int, fmnlumsqko: int) -> None:
        abvcoxnskr = self.ecttwoonfb(x, y, jomuwuxwxc, fmnlumsqko)
        self.dyvbxjpszrp[wjijkpdxjj] = set(abvcoxnskr)
        for awuziztlvh in abvcoxnskr:
            self.wexhekhwugc.setdefault(awuziztlvh, set()).add(wjijkpdxjj)

    # Readability v3: structural flow; bifoozynox.remove:2544-2552
    # Explicit 8-statement structural flow below; 3 conditions, 1 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def remove(self, wjijkpdxjj: qoljprchpbb) -> None:
        if wjijkpdxjj not in self.dyvbxjpszrp:
            return
        for awuziztlvh in self.dyvbxjpszrp[wjijkpdxjj]:
            if awuziztlvh in self.wexhekhwugc:
                self.wexhekhwugc[awuziztlvh].discard(wjijkpdxjj)
                if not self.wexhekhwugc[awuziztlvh]:
                    del self.wexhekhwugc[awuziztlvh]
        del self.dyvbxjpszrp[wjijkpdxjj]

    # Readability v3: structural flow; bifoozynox.update:2554-2556
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def update(self, wjijkpdxjj: qoljprchpbb, x: int, y: int, jomuwuxwxc: int, fmnlumsqko: int) -> None:
        self.remove(wjijkpdxjj)
        self.jqypbbpxom(wjijkpdxjj, x, y, jomuwuxwxc, fmnlumsqko)

    # Readability v3: structural flow; bifoozynox.mooivymkwv:2558-2563
    # Explicit 5-statement structural flow below; 1 conditions, 1 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def mooivymkwv(self, x: int, y: int, jomuwuxwxc: int, fmnlumsqko: int) -> set[qoljprchpbb]:
        pyknulcwqk: set[qoljprchpbb] = set()
        for awuziztlvh in self.ecttwoonfb(x, y, jomuwuxwxc, fmnlumsqko):
            if awuziztlvh in self.wexhekhwugc:
                pyknulcwqk.update(self.wexhekhwugc[awuziztlvh])
        return pyknulcwqk

    # Readability v3: return_expression; bifoozynox.gtirgndunn:2565-2566
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def gtirgndunn(self, x: int, y: int) -> set[qoljprchpbb]:
        return self.wexhekhwugc.get(self.cenevdhabz(x, y), set()).copy()

    # Readability v3: structural flow; bifoozynox.clear:2568-2570
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def clear(self) -> None:
        self.wexhekhwugc.clear()
        self.dyvbxjpszrp.clear()


zvpebidjxm = daeoulgzfx
ntrsxdgwaa = crhpjfhkrr


# Readability v3: return_expression; jhlagapukt:2577-2578
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def jhlagapukt(sdxwoafbgo: float) -> float:
    return sdxwoafbgo % 360


# Readability v3: structural flow; ufltcetykn:2581-2591
# Explicit 5-statement structural flow below; 3 conditions, 0 loops, 3 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def ufltcetykn(
    ioebcmszmx: np.ndarray,
    sdxwoafbgo: float,
    dutexryrky: float | None = None,
    qaoikjgyoi: float | None = None,
) -> tuple[np.ndarray, int, int]:
    """."""
    fmnlumsqko, jomuwuxwxc = ioebcmszmx.shape if ioebcmszmx.size > 0 else (0, 0)
    pmnuvkfgph = dutexryrky if dutexryrky is not None else jomuwuxwxc / 2
    swtdbzfsdj = qaoikjgyoi if qaoikjgyoi is not None else fmnlumsqko / 2
    return weioftzeor(ioebcmszmx, sdxwoafbgo, pmnuvkfgph, swtdbzfsdj)


class jhjdmxfmfk:
    """."""

    __slots__ = ("qvyxmjtakxo", "nvnkmwadrxa", "ukckdirauut", "geovjyfmksy")

    # Readability v3: structural flow; jhjdmxfmfk.__init__:2599-2608
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        eybfspflqx: Callable[[], qoljprchpbb],
        itlzkyrksx: Callable[[qoljprchpbb], None] | None = None,
        xzmowftfdq: int = 100,
    ):
        self.qvyxmjtakxo: list[qoljprchpbb] = []
        self.nvnkmwadrxa = eybfspflqx
        self.ukckdirauut = itlzkyrksx or self.ypsvtztbgg
        self.geovjyfmksy = xzmowftfdq

    # Readability v3: structural flow; jhjdmxfmfk.ypsvtztbgg:2611-2615
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @staticmethod
    def ypsvtztbgg(wfjffncuge: qoljprchpbb) -> None:
        wfjffncuge.set_position(0, 0)
        wfjffncuge.kuhrdwbqiqf = True
        wfjffncuge.rxmjztculbk.clear()
        wfjffncuge.nqyzyfvbkff = None

    # Readability v3: structural flow; jhjdmxfmfk.oezqkqhedv:2617-2622
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def oezqkqhedv(self) -> qoljprchpbb:
        if self.qvyxmjtakxo:
            wfjffncuge = self.qvyxmjtakxo.pop()
            self.ukckdirauut(wfjffncuge)
            return wfjffncuge
        return self.nvnkmwadrxa()

    # Readability v3: structural flow; jhjdmxfmfk.iougfvkgld:2624-2629
    # Explicit 5-statement structural flow below; 2 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def iougfvkgld(self, wfjffncuge: qoljprchpbb) -> None:
        if len(self.qvyxmjtakxo) < self.geovjyfmksy:
            wfjffncuge.kuhrdwbqiqf = False
            if wfjffncuge.nqyzyfvbkff:
                wfjffncuge.nqyzyfvbkff.kjcgxeembe(wfjffncuge)
            self.qvyxmjtakxo.append(wfjffncuge)

    # Readability v3: return_expression; jhjdmxfmfk.dgjpplgcna:2632-2633
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def dgjpplgcna(self) -> int:
        return len(self.qvyxmjtakxo)

    # Readability v3: structural flow; jhjdmxfmfk.wzorsqoyne:2635-2637
    # Explicit 2-statement structural flow below; 0 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wzorsqoyne(self, uajmzoysbh: int) -> None:
        for ssnguhllov in range(min(uajmzoysbh, self.geovjyfmksy - len(self.qvyxmjtakxo))):
            self.qvyxmjtakxo.append(self.nvnkmwadrxa())


"."


class eenkmrlhef(ABC):
    """."""

    tzzunqaalls: ClassVar["zngheqhadqg"]
    fgrurnqtwrf: ClassVar["bkenuuezufj"]
    ornhtmdrzbg: ClassVar["ltqaktmlzfu"]
    qvetfebnovs: ClassVar["ieoyfnduffs"]
    pysnmvgjihb: ClassVar["ayzngwwfdrs"]
    tvnvklimxot: ClassVar["kvcaxeostzr"]
    zfscgpeiape: ClassVar["zjbbgzigapm"]
    bliilljzitv: ClassVar["nxbjmahuptz"]
    evpheskxhhl: ClassVar["krufmkinzgl"]
    pahbbkbtewb: ClassVar["xifiisoxije"]
    wohjgvcysjh: ClassVar["mfurfufvyzt"]
    qwvxaygctwv: ClassVar["cnvtdnnwlnj"]
    goknwtdilzo: ClassVar["mfurfufvyzt"]
    lmsaqhteorx: ClassVar["rvctnyefzrx"]
    gpcsjdknzyn: ClassVar["rrnfeogpdfh"]
    gaesplzkumi: ClassVar["aazbzohkbqc"]
    uizrwizgtbc: ClassVar["beyunfnmqca"]

    # Readability v3: no_op_body; eenkmrlhef.atdawhwcvio:2665-2667
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @abstractmethod
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        """."""
        pass

    # Readability v3: return_expression; eenkmrlhef.__repr__:2669-2670
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def __repr__(self) -> str:
        return f"{self.__class__.__name__}()"


class zngheqhadqg(eenkmrlhef):
    # Readability v3: return_expression; zngheqhadqg.atdawhwcvio:2674-2675
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        return reiiyswsxj


class bkenuuezufj(eenkmrlhef):
    # Readability v3: update_binding; bkenuuezufj.__init__:2679-2680
    # Perform self.wymizrrfba = wymizrrfba; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, wymizrrfba: float = 2.0):
        self.wymizrrfba = wymizrrfba

    # Readability v3: return_expression; bkenuuezufj.atdawhwcvio:2682-2683
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        return math.pow(reiiyswsxj, self.wymizrrfba)


class ltqaktmlzfu(eenkmrlhef):
    wymizrrfba: float

    # Readability v3: update_binding; ltqaktmlzfu.__init__:2689-2690
    # Perform self.wymizrrfba = wymizrrfba; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, wymizrrfba: float = 2.0):
        self.wymizrrfba = wymizrrfba

    # Readability v3: return_expression; ltqaktmlzfu.atdawhwcvio:2692-2693
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        return 1.0 - math.pow(1.0 - reiiyswsxj, self.wymizrrfba)


class ieoyfnduffs(eenkmrlhef):
    wymizrrfba: float

    # Readability v3: update_binding; ieoyfnduffs.__init__:2699-2700
    # Perform self.wymizrrfba = wymizrrfba; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, wymizrrfba: float = 2.0):
        self.wymizrrfba = wymizrrfba

    # Readability v3: structural flow; ieoyfnduffs.atdawhwcvio:2702-2705
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        if reiiyswsxj < 0.5:
            return math.pow(2, self.wymizrrfba - 1) * math.pow(reiiyswsxj, self.wymizrrfba)
        return 1.0 - math.pow(-2 * reiiyswsxj + 2, self.wymizrrfba) / 2


class ayzngwwfdrs(eenkmrlhef):
    # Readability v3: structural flow; ayzngwwfdrs.atdawhwcvio:2709-2719
    # Explicit 10-statement structural flow below; 3 conditions, 0 loops, 3 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        if reiiyswsxj < 1 / 2.75:
            return 7.5625 * reiiyswsxj * reiiyswsxj
        elif reiiyswsxj < 2 / 2.75:
            reiiyswsxj -= 1.5 / 2.75
            return 7.5625 * reiiyswsxj * reiiyswsxj + 0.75
        elif reiiyswsxj < 2.5 / 2.75:
            reiiyswsxj -= 2.25 / 2.75
            return 7.5625 * reiiyswsxj * reiiyswsxj + 0.9375
        reiiyswsxj -= 2.625 / 2.75
        return 7.5625 * reiiyswsxj * reiiyswsxj + 0.984375


class kvcaxeostzr(eenkmrlhef):
    # Readability v3: return_expression; kvcaxeostzr.atdawhwcvio:2723-2724
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        return 1.0 - ayzngwwfdrs().atdawhwcvio(1.0 - reiiyswsxj)


class zjbbgzigapm(eenkmrlhef):
    # Readability v3: structural flow; zjbbgzigapm.atdawhwcvio:2728-2731
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        if reiiyswsxj < 0.5:
            return (1.0 - ayzngwwfdrs().atdawhwcvio(1.0 - 2 * reiiyswsxj)) / 2
        return (1.0 + ayzngwwfdrs().atdawhwcvio(2 * reiiyswsxj - 1.0)) / 2


class nxbjmahuptz(eenkmrlhef):
    # Readability v3: update_binding; nxbjmahuptz.__init__:2735-2736
    # Perform self.pwpxbdszem, self.cibfrfcrfa = (pwpxbdszem, cibfrfcrfa); argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, pwpxbdszem: float = 1.0, cibfrfcrfa: float = 0.3):
        self.pwpxbdszem, self.cibfrfcrfa = (pwpxbdszem, cibfrfcrfa)

    # Readability v3: structural flow; nxbjmahuptz.atdawhwcvio:2738-2742
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        if reiiyswsxj in (0, 1):
            return reiiyswsxj
        s = self.cibfrfcrfa / (2 * math.pi) * math.asin(1.0 / self.pwpxbdszem)
        return self.pwpxbdszem * 2 ** (-10 * reiiyswsxj) * math.sin((reiiyswsxj - s) * (2 * math.pi) / self.cibfrfcrfa) + 1.0


class krufmkinzgl(eenkmrlhef):
    # Readability v3: update_binding; krufmkinzgl.__init__:2746-2747
    # Perform self.pwpxbdszem, self.cibfrfcrfa = (pwpxbdszem, cibfrfcrfa); argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, pwpxbdszem: float = 1.0, cibfrfcrfa: float = 0.3):
        self.pwpxbdszem, self.cibfrfcrfa = (pwpxbdszem, cibfrfcrfa)

    # Readability v3: structural flow; krufmkinzgl.atdawhwcvio:2749-2754
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 2 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        if reiiyswsxj in (0, 1):
            return reiiyswsxj
        s = self.cibfrfcrfa / (2 * math.pi) * math.asin(1.0 / self.pwpxbdszem)
        reiiyswsxj -= 1
        return -(self.pwpxbdszem * 2 ** (10 * reiiyswsxj) * math.sin((reiiyswsxj - s) * (2 * math.pi) / self.cibfrfcrfa))


class xifiisoxije(eenkmrlhef):
    # Readability v3: update_binding; xifiisoxije.__init__:2758-2759
    # Perform self.pwpxbdszem, self.cibfrfcrfa = (pwpxbdszem, cibfrfcrfa); argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, pwpxbdszem: float = 1.0, cibfrfcrfa: float = 0.45):
        self.pwpxbdszem, self.cibfrfcrfa = (pwpxbdszem, cibfrfcrfa)

    # Readability v3: structural flow; xifiisoxije.atdawhwcvio:2761-2770
    # Explicit 9-statement structural flow below; 2 conditions, 0 loops, 4 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        if reiiyswsxj in (0, 1):
            return reiiyswsxj
        s = self.cibfrfcrfa / (2 * math.pi) * math.asin(1.0 / self.pwpxbdszem)
        reiiyswsxj *= 2
        if reiiyswsxj < 1:
            reiiyswsxj -= 1
            return -0.5 * self.pwpxbdszem * 2 ** (10 * reiiyswsxj) * math.sin((reiiyswsxj - s) * (2 * math.pi) / self.cibfrfcrfa)
        reiiyswsxj -= 1
        return self.pwpxbdszem * 2 ** (-10 * reiiyswsxj) * math.sin((reiiyswsxj - s) * (2 * math.pi) / self.cibfrfcrfa) * 0.5 + 1.0


class xdgsvpocdo(eenkmrlhef):
    # Readability v3: update_binding; xdgsvpocdo.__init__:2774-2775
    # Perform self.qiburjkxyp = qiburjkxyp; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, qiburjkxyp: float = 1.70158):
        self.qiburjkxyp = qiburjkxyp

    # Readability v3: return_expression; xdgsvpocdo.atdawhwcvio:2777-2778
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        return reiiyswsxj * reiiyswsxj * ((self.qiburjkxyp + 1) * reiiyswsxj - self.qiburjkxyp)


class cnvtdnnwlnj(eenkmrlhef):
    # Readability v3: update_binding; cnvtdnnwlnj.__init__:2782-2783
    # Perform self.qiburjkxyp = qiburjkxyp; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, qiburjkxyp: float = 1.70158):
        self.qiburjkxyp = qiburjkxyp

    # Readability v3: return_expression; cnvtdnnwlnj.atdawhwcvio:2785-2786
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        return reiiyswsxj * reiiyswsxj * ((self.qiburjkxyp + 1) * reiiyswsxj - self.qiburjkxyp)


class mfurfufvyzt(eenkmrlhef):
    # Readability v3: update_binding; mfurfufvyzt.__init__:2790-2791
    # Perform self.qiburjkxyp = qiburjkxyp; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, qiburjkxyp: float = 1.70158):
        self.qiburjkxyp = qiburjkxyp

    # Readability v3: structural flow; mfurfufvyzt.atdawhwcvio:2793-2795
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        reiiyswsxj -= 1
        return reiiyswsxj * reiiyswsxj * ((self.qiburjkxyp + 1) * reiiyswsxj + self.qiburjkxyp) + 1


class rvctnyefzrx(eenkmrlhef):
    # Readability v3: update_binding; rvctnyefzrx.__init__:2799-2800
    # Perform self.qiburjkxyp = qiburjkxyp * 1.525; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, qiburjkxyp: float = 1.70158):
        self.qiburjkxyp = qiburjkxyp * 1.525

    # Readability v3: structural flow; rvctnyefzrx.atdawhwcvio:2802-2807
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 2 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        reiiyswsxj *= 2
        if reiiyswsxj < 1:
            return 0.5 * (reiiyswsxj * reiiyswsxj * ((self.qiburjkxyp + 1) * reiiyswsxj - self.qiburjkxyp))
        reiiyswsxj -= 2
        return 0.5 * (reiiyswsxj * reiiyswsxj * ((self.qiburjkxyp + 1) * reiiyswsxj + self.qiburjkxyp) + 2)


class rrnfeogpdfh(eenkmrlhef):
    # Readability v3: return_expression; rrnfeogpdfh.atdawhwcvio:2811-2812
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        return math.sin(reiiyswsxj * math.pi / 2)


class aazbzohkbqc(eenkmrlhef):
    # Readability v3: return_expression; aazbzohkbqc.atdawhwcvio:2816-2817
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        return 1 - math.cos(reiiyswsxj * math.pi / 2)


class beyunfnmqca(eenkmrlhef):
    # Readability v3: return_expression; beyunfnmqca.atdawhwcvio:2821-2822
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        return -(math.cos(math.pi * reiiyswsxj) - 1) / 2


class slnxhyhhtx(eenkmrlhef):
    # Readability v3: update_binding; slnxhyhhtx.__init__:2826-2827
    # Perform self.ssrlilihvb = ssrlilihvb; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, ssrlilihvb: int = 4):
        self.ssrlilihvb = ssrlilihvb

    # Readability v3: return_expression; slnxhyhhtx.atdawhwcvio:2829-2830
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def atdawhwcvio(self, reiiyswsxj: float) -> float:
        return math.floor(reiiyswsxj * self.ssrlilihvb) / self.ssrlilihvb


xogemynewd = {
    "tzzunqaalls": zngheqhadqg(),
    "atdawhwcvio": ieoyfnduffs(),
    "fgrurnqtwrf": bkenuuezufj(),
    "ornhtmdrzbg": ltqaktmlzfu(),
    "qvetfebnovs": ieoyfnduffs(),
    "pysnmvgjihb": ayzngwwfdrs(),
    "tvnvklimxot": kvcaxeostzr(),
    "zfscgpeiape": zjbbgzigapm(),
    "bliilljzitv": nxbjmahuptz(),
    "evpheskxhhl": krufmkinzgl(),
    "pahbbkbtewb": xifiisoxije(),
    "wohjgvcysjh": mfurfufvyzt(),
    "qwvxaygctwv": cnvtdnnwlnj(),
    "goknwtdilzo": mfurfufvyzt(),
    "lmsaqhteorx": rvctnyefzrx(),
    "gpcsjdknzyn": rrnfeogpdfh(),
    "gaesplzkumi": aazbzohkbqc(),
    "uizrwizgtbc": beyunfnmqca(),
}
for yrxvacxlgrf, doztfpsvlg in xogemynewd.items():
    setattr(eenkmrlhef, yrxvacxlgrf, doztfpsvlg)


# Readability v3: structural flow; boejvajwof:2857-2865
# Explicit 8-statement structural flow below; 3 conditions, 0 loops, 0 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def boejvajwof(cipiqgzehl: eenkmrlhef | str | None) -> eenkmrlhef:
    """."""
    if cipiqgzehl is None:
        return xogemynewd["tzzunqaalls"]
    if isinstance(cipiqgzehl, eenkmrlhef):
        return cipiqgzehl
    if isinstance(cipiqgzehl, str) and cipiqgzehl in xogemynewd:
        return xogemynewd[cipiqgzehl]
    raise ValueError(f"Unknown action mode: {cipiqgzehl}")


class czbpfskcya:
    """."""

    # Readability v3: update_binding; czbpfskcya.__init__:2871-2872
    # Perform self.wnjgppqcoh = wnjgppqcoh; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, wnjgppqcoh: "bjwicxpwbxc"):
        self.wnjgppqcoh = wnjgppqcoh

    # Readability v3: structural flow; czbpfskcya.acqswsozvg:2874-2875
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def acqswsozvg(self) -> None:
        self.wnjgppqcoh.jonugjfvnl()


class aotzmhqympw(ABC):
    """."""

    # Readability v3: no_op_body; aotzmhqympw.twwsxhbaya:2882-2883
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @abstractmethod
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        pass

    # Readability v3: no_op_body; aotzmhqympw.lrgwpmfmrb:2887-2888
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    @property
    @abstractmethod
    def lrgwpmfmrb(self) -> int:
        pass

    # Readability v3: return_expression; aotzmhqympw.swnkxhbsrg:2891-2896
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def swnkxhbsrg(
        cdpcbbnfdp: tuple[int, int],
        wslpmugjcyi: int = 1,
        cipiqgzehl: eenkmrlhef | str | None = None,
    ) -> "uitjpzqfrzw":
        return uitjpzqfrzw(cdpcbbnfdp, wslpmugjcyi, boejvajwof(cipiqgzehl))

    # Readability v3: return_expression; aotzmhqympw.zgfcidphbz:2899-2904
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def zgfcidphbz(
        delta: tuple[int, int],
        wslpmugjcyi: int = 1,
        cipiqgzehl: eenkmrlhef | str | None = None,
    ) -> "kgcgcgragem":
        return kgcgcgragem(delta, wslpmugjcyi, boejvajwof(cipiqgzehl))

    # Readability v3: structural flow; aotzmhqympw.pghxtumzbu:2907-2913
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @staticmethod
    def pghxtumzbu(
        scale: float | tuple[float, float],
        wslpmugjcyi: int = 1,
        cipiqgzehl: eenkmrlhef | str | None = None,
    ) -> "fonrjascoir":
        s = (float(scale), float(scale)) if isinstance(scale, (int, float)) else (float(scale[0]), float(scale[1]))
        return fonrjascoir(s, wslpmugjcyi, boejvajwof(cipiqgzehl))

    # Readability v3: structural flow; aotzmhqympw.ueowmynnax:2916-2922
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @staticmethod
    def ueowmynnax(
        scale: float | tuple[float, float],
        wslpmugjcyi: int = 1,
        cipiqgzehl: eenkmrlhef | str | None = None,
    ) -> "waepofccxlb":
        s = (float(scale), float(scale)) if isinstance(scale, (int, float)) else (float(scale[0]), float(scale[1]))
        return waepofccxlb(s, wslpmugjcyi, boejvajwof(cipiqgzehl))

    # Readability v3: return_expression; aotzmhqympw.wogpgifzga:2925-2926
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def wogpgifzga(nepdducgbdd: float, wslpmugjcyi: int = 1, cipiqgzehl: eenkmrlhef | str | None = None) -> "pdknumaurvb":
        return pdknumaurvb(nepdducgbdd, wslpmugjcyi, boejvajwof(cipiqgzehl))

    # Readability v3: return_expression; aotzmhqympw.pxpzjteaqs:2929-2930
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def pxpzjteaqs(sawwyplkacb: float, wslpmugjcyi: int = 1, cipiqgzehl: eenkmrlhef | str | None = None) -> "frzfuewrtkm":
        return frzfuewrtkm(sawwyplkacb, wslpmugjcyi, boejvajwof(cipiqgzehl))

    # Readability v3: return_expression; aotzmhqympw.spvczlmazk:2933-2934
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def spvczlmazk(rxkaplmkcy: float, wslpmugjcyi: int = 1, cipiqgzehl: eenkmrlhef | str | None = None) -> "tlqtagnthub":
        return tlqtagnthub(rxkaplmkcy, wslpmugjcyi, boejvajwof(cipiqgzehl))

    # Readability v3: return_expression; aotzmhqympw.kissgczldt:2937-2938
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def kissgczldt(sdxwoafbgo: float, wslpmugjcyi: int = 1, cipiqgzehl: eenkmrlhef | str | None = None) -> "qzdiayqgdqm":
        return qzdiayqgdqm(sdxwoafbgo, wslpmugjcyi, boejvajwof(cipiqgzehl))

    # Readability v3: return_expression; aotzmhqympw.clhrzjisxp:2941-2942
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def clhrzjisxp(sdxwoafbgo: float, wslpmugjcyi: int = 1, cipiqgzehl: eenkmrlhef | str | None = None) -> "jtavlnqhtzl":
        return jtavlnqhtzl(sdxwoafbgo, wslpmugjcyi, boejvajwof(cipiqgzehl))

    # Readability v3: return_expression; aotzmhqympw.eaactxpeky:2945-2946
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def eaactxpeky(wslpmugjcyi: int) -> "tpjdtocmksh":
        return tpjdtocmksh(wslpmugjcyi)

    # Readability v3: return_expression; aotzmhqympw.qseunnyoyf:2949-2950
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def qseunnyoyf() -> "swicgefetor":
        return swicgefetor()

    # Readability v3: return_expression; aotzmhqympw.oebgjhipue:2953-2954
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def oebgjhipue() -> "zzqhaaoyxbt":
        return zzqhaaoyxbt()

    # Readability v3: return_expression; aotzmhqympw.mgbnagauna:2957-2958
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def mgbnagauna(mdqlknnzud: list["aotzmhqympw"]) -> "dnzuunmiwhk":
        return dnzuunmiwhk(mdqlknnzud)

    # Readability v3: return_expression; aotzmhqympw.fyvegwoxwv:2961-2962
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def fyvegwoxwv(mdqlknnzud: list["aotzmhqympw"]) -> "hfqinwohsfc":
        return hfqinwohsfc(mdqlknnzud)

    # Readability v3: return_expression; aotzmhqympw.kntuiexiih:2965-2966
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def kntuiexiih(action: "aotzmhqympw", uajmzoysbh: int) -> "haquthwzuaj":
        return haquthwzuaj(action, uajmzoysbh)

    # Readability v3: return_expression; aotzmhqympw.ikzfriogld:2969-2970
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def ikzfriogld(wjijkpdxjj: "qoljprchpbb", action: "aotzmhqympw") -> "yottxokcskp":
        return yottxokcskp(wjijkpdxjj, action)

    # Readability v3: return_expression; aotzmhqympw.iljawkzodd:2973-2974
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def iljawkzodd(vkeejtwapv: Callable[["qoljprchpbb"], None]) -> "nuxrdetmtnc":
        return nuxrdetmtnc(vkeejtwapv)

    # Readability v3: return_expression; aotzmhqympw.hllqvjnslz:2977-2978
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def hllqvjnslz(ufjswjroxa: Callable[[], Any]) -> "dekpdpkjoqt":
        return dekpdpkjoqt(ufjswjroxa)

    # Readability v3: return_expression; aotzmhqympw.kootrxrwgk:2981-2986
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def kootrxrwgk(
        lebqfosqjk: list[str],
        laguhngehw: int = 1,
        cipiqgzehl: eenkmrlhef | str | None = None,
    ) -> "cilbzaraitz":
        return cilbzaraitz(lebqfosqjk, laguhngehw, boejvajwof(cipiqgzehl))

    # Readability v3: return_expression; aotzmhqympw.oyzpaylqco:2989-2990
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def oyzpaylqco(kgjynspwva: "qoljprchpbb") -> "shwrzrvjzql":
        return shwrzrvjzql(kgjynspwva)

    # Readability v3: return_expression; aotzmhqympw.remove:2993-2994
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @staticmethod
    def remove() -> "bgddakjnggw":
        return bgddakjnggw()


class qsmhdrfzta(aotzmhqympw):
    """."""

    # Readability v3: structural flow; qsmhdrfzta.__init__:3000-3002
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, wslpmugjcyi: int, cipiqgzehl: eenkmrlhef):
        self.wslpmugjcyi = wslpmugjcyi
        self.cipiqgzehl = cipiqgzehl

    # Readability v3: return_expression; qsmhdrfzta.lrgwpmfmrb:3005-3006
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return max(1, self.wslpmugjcyi if not GRAPH_BUILDER else 1)

    # Readability v3: structural flow; qsmhdrfzta.zwnnmfzgio:3008-3010
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def zwnnmfzgio(self, wjijkpdxjj: "qoljprchpbb") -> Any:
        """."""
        raise NotImplementedError

    # Readability v3: structural flow; qsmhdrfzta.xyglliziuq:3012-3014
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def xyglliziuq(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any) -> Any:
        """."""
        raise NotImplementedError

    # Readability v3: structural flow; qsmhdrfzta.hdybpgwfpi:3016-3018
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hdybpgwfpi(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any, uclpklfgpw: Any, reiiyswsxj: float) -> None:
        """."""
        raise NotImplementedError

    # Readability v3: structural flow; qsmhdrfzta.twwsxhbaya:3020-3027
    # Explicit 7-statement structural flow below; 1 conditions, 1 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        ktwtkhqvml = self.zwnnmfzgio(wjijkpdxjj)
        uclpklfgpw = self.xyglliziuq(wjijkpdxjj, ktwtkhqvml)
        for frame in range(self.lrgwpmfmrb):
            if frame > 0:
                lytnusjuva.acqswsozvg()
            reiiyswsxj = self.cipiqgzehl.atdawhwcvio((frame + 1) / self.lrgwpmfmrb)
            self.hdybpgwfpi(wjijkpdxjj, ktwtkhqvml, uclpklfgpw, reiiyswsxj)


class uitjpzqfrzw(qsmhdrfzta):
    # Readability v3: structural flow; uitjpzqfrzw.__init__:3031-3033
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, cdpcbbnfdp: tuple[int, int], wslpmugjcyi: int, cipiqgzehl: eenkmrlhef):
        super().__init__(wslpmugjcyi, cipiqgzehl)
        self.cdpcbbnfdp = cdpcbbnfdp

    # Readability v3: return_expression; uitjpzqfrzw.zwnnmfzgio:3035-3036
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def zwnnmfzgio(self, wjijkpdxjj: "qoljprchpbb") -> tuple[int, int]:
        return (wjijkpdxjj.eocrokcvgsq, wjijkpdxjj.htoojidbdud)

    # Readability v3: read_attribute; uitjpzqfrzw.xyglliziuq:3038-3039
    # Return self.cdpcbbnfdp; descriptor behavior is not assumed pure. [structural-contract]
    def xyglliziuq(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any) -> tuple[int, int]:
        return self.cdpcbbnfdp

    # Readability v3: structural flow; uitjpzqfrzw.hdybpgwfpi:3041-3045
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hdybpgwfpi(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any, uclpklfgpw: Any, reiiyswsxj: float) -> None:
        wjijkpdxjj.set_position(
            int(ktwtkhqvml[0] + (uclpklfgpw[0] - ktwtkhqvml[0]) * reiiyswsxj),
            int(ktwtkhqvml[1] + (uclpklfgpw[1] - ktwtkhqvml[1]) * reiiyswsxj),
        )


class kgcgcgragem(qsmhdrfzta):
    # Readability v3: structural flow; kgcgcgragem.__init__:3049-3051
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, delta: tuple[int, int], wslpmugjcyi: int, cipiqgzehl: eenkmrlhef):
        super().__init__(wslpmugjcyi, cipiqgzehl)
        self.delta = delta

    # Readability v3: return_expression; kgcgcgragem.zwnnmfzgio:3053-3054
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def zwnnmfzgio(self, wjijkpdxjj: "qoljprchpbb") -> tuple[int, int]:
        return (wjijkpdxjj.eocrokcvgsq, wjijkpdxjj.htoojidbdud)

    # Readability v3: return_expression; kgcgcgragem.xyglliziuq:3056-3057
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def xyglliziuq(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any) -> tuple[int, int]:
        return (ktwtkhqvml[0] + self.delta[0], ktwtkhqvml[1] + self.delta[1])

    # Readability v3: structural flow; kgcgcgragem.hdybpgwfpi:3059-3063
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hdybpgwfpi(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any, uclpklfgpw: Any, reiiyswsxj: float) -> None:
        wjijkpdxjj.set_position(
            int(ktwtkhqvml[0] + (uclpklfgpw[0] - ktwtkhqvml[0]) * reiiyswsxj),
            int(ktwtkhqvml[1] + (uclpklfgpw[1] - ktwtkhqvml[1]) * reiiyswsxj),
        )


class fonrjascoir(qsmhdrfzta):
    # Readability v3: structural flow; fonrjascoir.__init__:3067-3069
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, scale: tuple[float, float], wslpmugjcyi: int, cipiqgzehl: eenkmrlhef):
        super().__init__(wslpmugjcyi, cipiqgzehl)
        self.scale = scale

    # Readability v3: return_expression; fonrjascoir.zwnnmfzgio:3071-3072
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def zwnnmfzgio(self, wjijkpdxjj: "qoljprchpbb") -> tuple[float, float]:
        return (wjijkpdxjj.tnxxzczblvt, wjijkpdxjj.ppoluxgtqul)

    # Readability v3: read_attribute; fonrjascoir.xyglliziuq:3074-3075
    # Return self.scale; descriptor behavior is not assumed pure. [structural-contract]
    def xyglliziuq(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any) -> tuple[float, float]:
        return self.scale

    # Readability v3: structural flow; fonrjascoir.hdybpgwfpi:3077-3080
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hdybpgwfpi(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any, uclpklfgpw: Any, reiiyswsxj: float) -> None:
        wjijkpdxjj.tnxxzczblvt = ktwtkhqvml[0] + (uclpklfgpw[0] - ktwtkhqvml[0]) * reiiyswsxj
        wjijkpdxjj.ppoluxgtqul = ktwtkhqvml[1] + (uclpklfgpw[1] - ktwtkhqvml[1]) * reiiyswsxj
        wjijkpdxjj.ftnhhwoybs()


class waepofccxlb(qsmhdrfzta):
    # Readability v3: structural flow; waepofccxlb.__init__:3084-3086
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, factor: tuple[float, float], wslpmugjcyi: int, cipiqgzehl: eenkmrlhef):
        super().__init__(wslpmugjcyi, cipiqgzehl)
        self.factor = factor

    # Readability v3: return_expression; waepofccxlb.zwnnmfzgio:3088-3089
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def zwnnmfzgio(self, wjijkpdxjj: "qoljprchpbb") -> tuple[float, float]:
        return (wjijkpdxjj.tnxxzczblvt, wjijkpdxjj.ppoluxgtqul)

    # Readability v3: return_expression; waepofccxlb.xyglliziuq:3091-3092
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def xyglliziuq(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any) -> tuple[float, float]:
        return (ktwtkhqvml[0] * self.factor[0], ktwtkhqvml[1] * self.factor[1])

    # Readability v3: structural flow; waepofccxlb.hdybpgwfpi:3094-3097
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hdybpgwfpi(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any, uclpklfgpw: Any, reiiyswsxj: float) -> None:
        wjijkpdxjj.tnxxzczblvt = ktwtkhqvml[0] + (uclpklfgpw[0] - ktwtkhqvml[0]) * reiiyswsxj
        wjijkpdxjj.ppoluxgtqul = ktwtkhqvml[1] + (uclpklfgpw[1] - ktwtkhqvml[1]) * reiiyswsxj
        wjijkpdxjj.ftnhhwoybs()


class pdknumaurvb(qsmhdrfzta):
    # Readability v3: structural flow; pdknumaurvb.__init__:3101-3103
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, xgzseehgie: float, wslpmugjcyi: int, cipiqgzehl: eenkmrlhef):
        super().__init__(wslpmugjcyi, cipiqgzehl)
        self.xgzseehgie = xgzseehgie

    # Readability v3: read_attribute; pdknumaurvb.zwnnmfzgio:3105-3106
    # Return wjijkpdxjj.tnxxzczblvt; descriptor behavior is not assumed pure. [structural-contract]
    def zwnnmfzgio(self, wjijkpdxjj: "qoljprchpbb") -> float:
        return wjijkpdxjj.tnxxzczblvt

    # Readability v3: read_attribute; pdknumaurvb.xyglliziuq:3108-3109
    # Return self.xgzseehgie; descriptor behavior is not assumed pure. [structural-contract]
    def xyglliziuq(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any) -> float:
        return self.xgzseehgie

    # Readability v3: structural flow; pdknumaurvb.hdybpgwfpi:3111-3113
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hdybpgwfpi(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any, uclpklfgpw: Any, reiiyswsxj: float) -> None:
        wjijkpdxjj.tnxxzczblvt = ktwtkhqvml + (uclpklfgpw - ktwtkhqvml) * reiiyswsxj
        wjijkpdxjj.ftnhhwoybs()


class frzfuewrtkm(qsmhdrfzta):
    # Readability v3: structural flow; frzfuewrtkm.__init__:3117-3119
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, ngcjkhwdsl: float, wslpmugjcyi: int, cipiqgzehl: eenkmrlhef):
        super().__init__(wslpmugjcyi, cipiqgzehl)
        self.ngcjkhwdsl = ngcjkhwdsl

    # Readability v3: read_attribute; frzfuewrtkm.zwnnmfzgio:3121-3122
    # Return wjijkpdxjj.ppoluxgtqul; descriptor behavior is not assumed pure. [structural-contract]
    def zwnnmfzgio(self, wjijkpdxjj: "qoljprchpbb") -> float:
        return wjijkpdxjj.ppoluxgtqul

    # Readability v3: read_attribute; frzfuewrtkm.xyglliziuq:3124-3125
    # Return self.ngcjkhwdsl; descriptor behavior is not assumed pure. [structural-contract]
    def xyglliziuq(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any) -> float:
        return self.ngcjkhwdsl

    # Readability v3: structural flow; frzfuewrtkm.hdybpgwfpi:3127-3129
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hdybpgwfpi(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any, uclpklfgpw: Any, reiiyswsxj: float) -> None:
        wjijkpdxjj.ppoluxgtqul = ktwtkhqvml + (uclpklfgpw - ktwtkhqvml) * reiiyswsxj
        wjijkpdxjj.ftnhhwoybs()


class tlqtagnthub(qsmhdrfzta):
    # Readability v3: structural flow; tlqtagnthub.__init__:3133-3135
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, rxkaplmkcy: float, wslpmugjcyi: int, cipiqgzehl: eenkmrlhef):
        super().__init__(wslpmugjcyi, cipiqgzehl)
        self.rxkaplmkcy = rxkaplmkcy

    # Readability v3: return_constant; tlqtagnthub.zwnnmfzgio:3137-3138
    # Return 1.0. [structural-contract]
    def zwnnmfzgio(self, wjijkpdxjj: "qoljprchpbb") -> float:
        return 1.0

    # Readability v3: read_attribute; tlqtagnthub.xyglliziuq:3140-3141
    # Return self.rxkaplmkcy; descriptor behavior is not assumed pure. [structural-contract]
    def xyglliziuq(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any) -> float:
        return self.rxkaplmkcy

    # Readability v3: no_op_body; tlqtagnthub.hdybpgwfpi:3143-3144
    # No executable body beyond pass/docstring; implicit None return. [structural-contract]
    def hdybpgwfpi(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any, uclpklfgpw: Any, reiiyswsxj: float) -> None:
        pass


class qzdiayqgdqm(qsmhdrfzta):
    # Readability v3: structural flow; qzdiayqgdqm.__init__:3148-3150
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, sdxwoafbgo: float, wslpmugjcyi: int, cipiqgzehl: eenkmrlhef):
        super().__init__(wslpmugjcyi, cipiqgzehl)
        self.sdxwoafbgo = sdxwoafbgo

    # Readability v3: read_attribute; qzdiayqgdqm.zwnnmfzgio:3152-3153
    # Return wjijkpdxjj.ntaykiuhwea; descriptor behavior is not assumed pure. [structural-contract]
    def zwnnmfzgio(self, wjijkpdxjj: "qoljprchpbb") -> float:
        return wjijkpdxjj.ntaykiuhwea

    # Readability v3: structural flow; qzdiayqgdqm.xyglliziuq:3155-3158
    # Explicit 3-statement structural flow below; 1 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def xyglliziuq(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any) -> float:
        if not isinstance(ktwtkhqvml, float):
            raise ValueError("Unknown Rotation Bug?")
        return ktwtkhqvml + self.sdxwoafbgo

    # Readability v3: structural flow; qzdiayqgdqm.hdybpgwfpi:3160-3164
    # Explicit 4-statement structural flow below; 1 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hdybpgwfpi(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any, uclpklfgpw: Any, reiiyswsxj: float) -> None:
        wjijkpdxjj.ntaykiuhwea = (ktwtkhqvml + (uclpklfgpw - ktwtkhqvml) * reiiyswsxj) % 360.0
        if wjijkpdxjj.ntaykiuhwea < 0:
            wjijkpdxjj.ntaykiuhwea += 360.0
        wjijkpdxjj.vbuqqpukzf()


class jtavlnqhtzl(qsmhdrfzta):
    # Readability v3: structural flow; jtavlnqhtzl.__init__:3168-3170
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, gnzymxsckw: float, wslpmugjcyi: int, cipiqgzehl: eenkmrlhef):
        super().__init__(wslpmugjcyi, cipiqgzehl)
        self.gnzymxsckw = gnzymxsckw

    # Readability v3: read_attribute; jtavlnqhtzl.zwnnmfzgio:3172-3173
    # Return wjijkpdxjj.ntaykiuhwea; descriptor behavior is not assumed pure. [structural-contract]
    def zwnnmfzgio(self, wjijkpdxjj: "qoljprchpbb") -> float:
        return wjijkpdxjj.ntaykiuhwea

    # Readability v3: structural flow; jtavlnqhtzl.xyglliziuq:3175-3186
    # Explicit 11-statement structural flow below; 4 conditions, 0 loops, 5 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def xyglliziuq(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any) -> float:
        if not isinstance(ktwtkhqvml, float):
            raise ValueError("Unknown Rotation Bug?")
        uclpklfgpw = self.gnzymxsckw % 360.0
        if uclpklfgpw < 0:
            uclpklfgpw += 360.0
        ztmiogkkvl = uclpklfgpw - ktwtkhqvml
        if ztmiogkkvl > 180:
            ztmiogkkvl -= 360
        elif ztmiogkkvl < -180:
            ztmiogkkvl += 360
        return ktwtkhqvml + ztmiogkkvl

    # Readability v3: structural flow; jtavlnqhtzl.hdybpgwfpi:3188-3193
    # Explicit 5-statement structural flow below; 1 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hdybpgwfpi(self, wjijkpdxjj: "qoljprchpbb", ktwtkhqvml: Any, uclpklfgpw: Any, reiiyswsxj: float) -> None:
        hcfqlzfwic = (ktwtkhqvml + (uclpklfgpw - ktwtkhqvml) * reiiyswsxj) % 360.0
        if hcfqlzfwic < 0:
            hcfqlzfwic += 360.0
        wjijkpdxjj.ntaykiuhwea = hcfqlzfwic
        wjijkpdxjj.vbuqqpukzf()


class tpjdtocmksh(aotzmhqympw):
    # Readability v3: update_binding; tpjdtocmksh.__init__:3197-3198
    # Perform self.wslpmugjcyi = wslpmugjcyi; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, wslpmugjcyi: int):
        self.wslpmugjcyi = wslpmugjcyi

    # Readability v3: return_expression; tpjdtocmksh.lrgwpmfmrb:3201-3202
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return max(1, self.wslpmugjcyi)

    # Readability v3: structural flow; tpjdtocmksh.twwsxhbaya:3204-3207
    # Explicit 3-statement structural flow below; 1 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        for frame in range(self.lrgwpmfmrb):
            if frame > 0:
                lytnusjuva.acqswsozvg()


class swicgefetor(aotzmhqympw):
    # Readability v3: return_constant; swicgefetor.lrgwpmfmrb:3212-3213
    # Return 1. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return 1

    # Readability v3: update_binding; swicgefetor.twwsxhbaya:3215-3216
    # Perform wjijkpdxjj.visible = False; argument/attribute spellings are preserved. [structural-contract]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        wjijkpdxjj.visible = False


class zzqhaaoyxbt(aotzmhqympw):
    # Readability v3: return_constant; zzqhaaoyxbt.lrgwpmfmrb:3221-3222
    # Return 1. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return 1

    # Readability v3: update_binding; zzqhaaoyxbt.twwsxhbaya:3224-3225
    # Perform wjijkpdxjj.visible = True; argument/attribute spellings are preserved. [structural-contract]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        wjijkpdxjj.visible = True


class bgddakjnggw(aotzmhqympw):
    # Readability v3: return_constant; bgddakjnggw.lrgwpmfmrb:3230-3231
    # Return 1. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return 1

    # Readability v3: structural flow; bgddakjnggw.twwsxhbaya:3233-3237
    # Explicit 4-statement structural flow below; 2 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        if wjijkpdxjj.nqyzyfvbkff:
            wjijkpdxjj.nqyzyfvbkff.kjcgxeembe(wjijkpdxjj)
        elif oegtnpbqims := lytnusjuva.wnjgppqcoh.oegtnpbqims:
            oegtnpbqims.remove(wjijkpdxjj)


class shwrzrvjzql(aotzmhqympw):
    # Readability v3: update_binding; shwrzrvjzql.__init__:3241-3242
    # Perform self.kgjynspwva = kgjynspwva; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, kgjynspwva: "qoljprchpbb"):
        self.kgjynspwva = kgjynspwva

    # Readability v3: return_constant; shwrzrvjzql.lrgwpmfmrb:3245-3246
    # Return 1. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return 1

    # Readability v3: structural flow; shwrzrvjzql.twwsxhbaya:3248-3249
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        wjijkpdxjj.oyzpaylqco(self.kgjynspwva)


class nuxrdetmtnc(aotzmhqympw):
    # Readability v3: update_binding; nuxrdetmtnc.__init__:3253-3254
    # Perform self.vkeejtwapv = vkeejtwapv; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, vkeejtwapv: Callable[["qoljprchpbb"], None]):
        self.vkeejtwapv = vkeejtwapv

    # Readability v3: return_constant; nuxrdetmtnc.lrgwpmfmrb:3257-3258
    # Return 1. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return 1

    # Readability v3: structural flow; nuxrdetmtnc.twwsxhbaya:3260-3261
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        self.vkeejtwapv(wjijkpdxjj)


class dekpdpkjoqt(aotzmhqympw):
    # Readability v3: update_binding; dekpdpkjoqt.__init__:3265-3266
    # Perform self.ufjswjroxa = ufjswjroxa; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, ufjswjroxa: Callable[[], Any]):
        self.ufjswjroxa = ufjswjroxa

    # Readability v3: return_constant; dekpdpkjoqt.lrgwpmfmrb:3269-3270
    # Return 1. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return 1

    # Readability v3: structural flow; dekpdpkjoqt.twwsxhbaya:3272-3273
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        self.ufjswjroxa()


class cilbzaraitz(aotzmhqympw):
    # Readability v3: structural flow; cilbzaraitz.__init__:3277-3280
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, lebqfosqjk: list[str], laguhngehw: int, cipiqgzehl: eenkmrlhef):
        self.lebqfosqjk = lebqfosqjk
        self.laguhngehw = laguhngehw
        self.cipiqgzehl = cipiqgzehl

    # Readability v3: return_expression; cilbzaraitz.lrgwpmfmrb:3283-3284
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return max(1, len(self.lebqfosqjk) * self.laguhngehw)

    # Readability v3: structural flow; cilbzaraitz.twwsxhbaya:3286-3293
    # Explicit 7-statement structural flow below; 2 conditions, 1 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        if not self.lebqfosqjk:
            return
        for frame in range(self.lrgwpmfmrb):
            if frame > 0:
                lytnusjuva.acqswsozvg()
            otybvaqupl = min(frame // self.laguhngehw, len(self.lebqfosqjk) - 1)
            wjijkpdxjj.tsojufjsxj(self.lebqfosqjk[otybvaqupl])


class xecuvhtski(aotzmhqympw):
    """."""

    # Readability v3: structural flow; xecuvhtski.__init__:3299-3302
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 3 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, hjulbeqzgs: tuple[int, int], lebqfosqjk: list[str], laguhngehw: int):
        self.hjulbeqzgs = hjulbeqzgs
        self.lebqfosqjk = lebqfosqjk
        self.laguhngehw = laguhngehw

    # Readability v3: return_expression; xecuvhtski.lrgwpmfmrb:3305-3306
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return max(1, len(self.lebqfosqjk) * self.laguhngehw)

    # Readability v3: structural flow; xecuvhtski.twwsxhbaya:3308-3318
    # Explicit 9-statement structural flow below; 3 conditions, 1 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        if not self.lebqfosqjk:
            return
        for frame in range(self.lrgwpmfmrb):
            if frame > 0:
                lytnusjuva.acqswsozvg()
            otybvaqupl = min(frame // self.laguhngehw, len(self.lebqfosqjk) - 1)
            if hasattr(wjijkpdxjj, "set_offset_image"):
                wjijkpdxjj.set_offset_image(self.hjulbeqzgs, self.lebqfosqjk[otybvaqupl])
            else:
                wjijkpdxjj.tsojufjsxj(self.lebqfosqjk[otybvaqupl])


class dnzuunmiwhk(aotzmhqympw):
    # Readability v3: update_binding; dnzuunmiwhk.__init__:3322-3323
    # Perform self.mdqlknnzud = mdqlknnzud; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, mdqlknnzud: list[aotzmhqympw]):
        self.mdqlknnzud = mdqlknnzud

    # Readability v3: return_expression; dnzuunmiwhk.lrgwpmfmrb:3326-3327
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return sum((zyfqehjsgv.lrgwpmfmrb for zyfqehjsgv in self.mdqlknnzud))

    # Readability v3: structural flow; dnzuunmiwhk.twwsxhbaya:3329-3333
    # Explicit 4-statement structural flow below; 1 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        for i, action in enumerate(self.mdqlknnzud):
            if i > 0:
                lytnusjuva.acqswsozvg()
            action.twwsxhbaya(wjijkpdxjj, lytnusjuva)


class haquthwzuaj(aotzmhqympw):
    # Readability v3: structural flow; haquthwzuaj.__init__:3337-3339
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, action: aotzmhqympw, uajmzoysbh: int):
        self.action = action
        self.uajmzoysbh = uajmzoysbh

    # Readability v3: return_expression; haquthwzuaj.lrgwpmfmrb:3342-3343
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return self.action.lrgwpmfmrb * self.uajmzoysbh

    # Readability v3: structural flow; haquthwzuaj.twwsxhbaya:3345-3349
    # Explicit 4-statement structural flow below; 1 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        for i in range(self.uajmzoysbh):
            if i > 0:
                lytnusjuva.acqswsozvg()
            self.action.twwsxhbaya(wjijkpdxjj, lytnusjuva)


class yottxokcskp(aotzmhqympw):
    # Readability v3: structural flow; yottxokcskp.__init__:3353-3355
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, meiydadonw: "qoljprchpbb", action: aotzmhqympw):
        self.meiydadonw = meiydadonw
        self.action = action

    # Readability v3: read_attribute; yottxokcskp.lrgwpmfmrb:3358-3359
    # Return self.action.lrgwpmfmrb; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return self.action.lrgwpmfmrb

    # Readability v3: structural flow; yottxokcskp.twwsxhbaya:3361-3362
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        self.action.twwsxhbaya(self.meiydadonw, lytnusjuva)


class hfqinwohsfc(aotzmhqympw):
    """."""

    # Readability v3: update_binding; hfqinwohsfc.__init__:3368-3369
    # Perform self.mdqlknnzud = mdqlknnzud; argument/attribute spellings are preserved. [structural-contract]
    def __init__(self, mdqlknnzud: list[aotzmhqympw]):
        self.mdqlknnzud = mdqlknnzud

    # Readability v3: return_expression; hfqinwohsfc.lrgwpmfmrb:3372-3373
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def lrgwpmfmrb(self) -> int:
        return max((zyfqehjsgv.lrgwpmfmrb for zyfqehjsgv in self.mdqlknnzud), default=0)

    # Readability v3: return_expression; hfqinwohsfc.eqkrytmypb:3375-3376
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def eqkrytmypb(self, action: aotzmhqympw, default: "qoljprchpbb") -> "qoljprchpbb":
        return action.meiydadonw if isinstance(action, yottxokcskp) else default

    # Readability v3: return_expression; hfqinwohsfc.xibxzzuysr:3378-3379
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def xibxzzuysr(self, action: aotzmhqympw) -> aotzmhqympw:
        return action.action if isinstance(action, yottxokcskp) else action

    # Readability v3: structural flow; hfqinwohsfc.conezfqepb:3381-3408
    # Explicit 21-statement structural flow below; 7 conditions, 1 loops, 8 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def conezfqepb(self, action: aotzmhqympw, frame: int, ktwtkhqvml: tuple[int, int]) -> tuple[aotzmhqympw | None, int, int, tuple[int, int]]:
        """."""
        if isinstance(action, dnzuunmiwhk):
            ajvuabtaruj, idpkjvoxvm = (0, ktwtkhqvml)
            for aksdldekio in action.mdqlknnzud:
                kwdxfpydbx = aksdldekio.lrgwpmfmrb
                if frame < ajvuabtaruj + kwdxfpydbx:
                    return (aksdldekio, frame - ajvuabtaruj, kwdxfpydbx, idpkjvoxvm)
                ajvuabtaruj += kwdxfpydbx
                if isinstance(aksdldekio, kgcgcgragem):
                    idpkjvoxvm = (
                        idpkjvoxvm[0] + aksdldekio.delta[0],
                        idpkjvoxvm[1] + aksdldekio.delta[1],
                    )
                elif isinstance(aksdldekio, uitjpzqfrzw):
                    idpkjvoxvm = aksdldekio.cdpcbbnfdp
            return (None, 0, 0, idpkjvoxvm)
        if frame >= action.lrgwpmfmrb:
            dsyoierhol = ktwtkhqvml
            if isinstance(action, kgcgcgragem):
                dsyoierhol = (
                    ktwtkhqvml[0] + action.delta[0],
                    ktwtkhqvml[1] + action.delta[1],
                )
            elif isinstance(action, uitjpzqfrzw):
                dsyoierhol = action.cdpcbbnfdp
            return (None, 0, 0, dsyoierhol)
        return (action, frame, action.lrgwpmfmrb, ktwtkhqvml)

    # Readability v3: structural flow; hfqinwohsfc.twwsxhbaya:3410-3567
    # Explicit 121-statement structural flow below; 33 conditions, 8 loops, 68 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def twwsxhbaya(self, wjijkpdxjj: "qoljprchpbb", lytnusjuva: czbpfskcya) -> None:
        fqgdaamrzm = self.lrgwpmfmrb
        if fqgdaamrzm == 0:
            return
        qaifoprbxv: dict["qoljprchpbb", tuple[int, int]] = {}
        wrsoijscdi: dict["qoljprchpbb", tuple[float, float]] = {}
        vtyzpcocsn: dict["qoljprchpbb", float] = {}
        for jzhgixsoidh in self.mdqlknnzud:
            uclpklfgpw = self.eqkrytmypb(jzhgixsoidh, wjijkpdxjj)
            if uclpklfgpw not in qaifoprbxv:
                qaifoprbxv[uclpklfgpw] = (uclpklfgpw.eocrokcvgsq, uclpklfgpw.htoojidbdud)
                wrsoijscdi[uclpklfgpw] = (uclpklfgpw.tnxxzczblvt, uclpklfgpw.ppoluxgtqul)
                vtyzpcocsn[uclpklfgpw] = uclpklfgpw.ntaykiuhwea
        etoqvuxyrp: list[tuple[int, "qoljprchpbb"]] = []
        for vixptjekzrk in range(fqgdaamrzm):
            if vixptjekzrk > 0:
                lytnusjuva.acqswsozvg()
            for crypsjcbtq, thmwhobpts in etoqvuxyrp:
                if crypsjcbtq == vixptjekzrk:
                    if thmwhobpts.nqyzyfvbkff:
                        thmwhobpts.nqyzyfvbkff.kjcgxeembe(thmwhobpts)
                    elif oegtnpbqims := lytnusjuva.wnjgppqcoh.oegtnpbqims:
                        oegtnpbqims.remove(thmwhobpts)
            svrdwozvby: dict["qoljprchpbb", tuple[int, int]] = {wfjffncuge: (0, 0) for wfjffncuge in qaifoprbxv}
            pbcmzzlljs: dict["qoljprchpbb", tuple[float, float]] = {wfjffncuge: wrsoijscdi[wfjffncuge] for wfjffncuge in wrsoijscdi}
            ydnpzvlluj: dict["qoljprchpbb", float] = {wfjffncuge: vtyzpcocsn[wfjffncuge] for wfjffncuge in vtyzpcocsn}
            for jzhgixsoidh in self.mdqlknnzud:
                uclpklfgpw = self.eqkrytmypb(jzhgixsoidh, wjijkpdxjj)
                fihfjosxwc = self.xibxzzuysr(jzhgixsoidh)
                fuukinubuif, kqhaaeliazm = qaifoprbxv[uclpklfgpw]
                seqirgamfml, crdvxfplygs, cztvzwsajdh, ygcvugwobli = self.conezfqepb(fihfjosxwc, vixptjekzrk, (fuukinubuif, kqhaaeliazm))
                if seqirgamfml is None:
                    gvmvjrdlhrf, nivlpgfoykq = (ygcvugwobli[0] - fuukinubuif, ygcvugwobli[1] - kqhaaeliazm)
                    rvzllruhyu = svrdwozvby[uclpklfgpw]
                    svrdwozvby[uclpklfgpw] = (rvzllruhyu[0] + gvmvjrdlhrf, rvzllruhyu[1] + nivlpgfoykq)
                    continue
                reiiyswsxj = (crdvxfplygs + 1) / cztvzwsajdh if cztvzwsajdh > 0 else 1.0
                gjklsvkbpvd, jlabvsegfht = (
                    ygcvugwobli[0] - fuukinubuif,
                    ygcvugwobli[1] - kqhaaeliazm,
                )
                if isinstance(seqirgamfml, kgcgcgragem):
                    ifhmniazpq = seqirgamfml.cipiqgzehl.atdawhwcvio(reiiyswsxj)
                    gvmvjrdlhrf = gjklsvkbpvd + int(seqirgamfml.delta[0] * ifhmniazpq)
                    nivlpgfoykq = jlabvsegfht + int(seqirgamfml.delta[1] * ifhmniazpq)
                    rvzllruhyu = svrdwozvby[uclpklfgpw]
                    svrdwozvby[uclpklfgpw] = (rvzllruhyu[0] + gvmvjrdlhrf, rvzllruhyu[1] + nivlpgfoykq)
                elif isinstance(seqirgamfml, uitjpzqfrzw):
                    ifhmniazpq = seqirgamfml.cipiqgzehl.atdawhwcvio(reiiyswsxj)
                    isx, isy = ygcvugwobli
                    gvmvjrdlhrf = int((seqirgamfml.cdpcbbnfdp[0] - fuukinubuif) * ifhmniazpq + (isx - fuukinubuif) * (1 - ifhmniazpq))
                    nivlpgfoykq = int((seqirgamfml.cdpcbbnfdp[1] - kqhaaeliazm) * ifhmniazpq + (isy - kqhaaeliazm) * (1 - ifhmniazpq))
                    rvzllruhyu = svrdwozvby[uclpklfgpw]
                    svrdwozvby[uclpklfgpw] = (rvzllruhyu[0] + gvmvjrdlhrf, rvzllruhyu[1] + nivlpgfoykq)
                elif isinstance(seqirgamfml, (swicgefetor, zzqhaaoyxbt)):
                    if crdvxfplygs == 0:
                        uclpklfgpw.visible = isinstance(seqirgamfml, zzqhaaoyxbt)
                    rvzllruhyu = svrdwozvby[uclpklfgpw]
                    svrdwozvby[uclpklfgpw] = (
                        rvzllruhyu[0] + gjklsvkbpvd,
                        rvzllruhyu[1] + jlabvsegfht,
                    )
                elif isinstance(
                    seqirgamfml,
                    (
                        tpjdtocmksh,
                        bgddakjnggw,
                        nuxrdetmtnc,
                        dekpdpkjoqt,
                        cilbzaraitz,
                    ),
                ):
                    if crdvxfplygs == 0:
                        if isinstance(seqirgamfml, bgddakjnggw) and (not any((wfjffncuge == uclpklfgpw for ssnguhllov, wfjffncuge in etoqvuxyrp))):
                            etoqvuxyrp.append((vixptjekzrk + 1, uclpklfgpw))
                        elif isinstance(seqirgamfml, nuxrdetmtnc):
                            seqirgamfml.vkeejtwapv(uclpklfgpw)
                        elif isinstance(seqirgamfml, dekpdpkjoqt):
                            seqirgamfml.ufjswjroxa()
                        elif isinstance(seqirgamfml, cilbzaraitz) and seqirgamfml.lebqfosqjk:
                            otybvaqupl = min(
                                crdvxfplygs // seqirgamfml.laguhngehw,
                                len(seqirgamfml.lebqfosqjk) - 1,
                            )
                            uclpklfgpw.tsojufjsxj(seqirgamfml.lebqfosqjk[otybvaqupl])
                    elif isinstance(seqirgamfml, cilbzaraitz) and seqirgamfml.lebqfosqjk:
                        otybvaqupl = min(crdvxfplygs // seqirgamfml.laguhngehw, len(seqirgamfml.lebqfosqjk) - 1)
                        uclpklfgpw.tsojufjsxj(seqirgamfml.lebqfosqjk[otybvaqupl])
                    rvzllruhyu = svrdwozvby[uclpklfgpw]
                    svrdwozvby[uclpklfgpw] = (
                        rvzllruhyu[0] + gjklsvkbpvd,
                        rvzllruhyu[1] + jlabvsegfht,
                    )
                elif isinstance(seqirgamfml, fonrjascoir):
                    ifhmniazpq = seqirgamfml.cipiqgzehl.atdawhwcvio(reiiyswsxj)
                    ijacxsomkw, uaobwaaexz = wrsoijscdi[uclpklfgpw]
                    pbcmzzlljs[uclpklfgpw] = (
                        ijacxsomkw + (seqirgamfml.scale[0] - ijacxsomkw) * ifhmniazpq,
                        uaobwaaexz + (seqirgamfml.scale[1] - uaobwaaexz) * ifhmniazpq,
                    )
                elif isinstance(seqirgamfml, waepofccxlb):
                    ifhmniazpq = seqirgamfml.cipiqgzehl.atdawhwcvio(reiiyswsxj)
                    ijacxsomkw, uaobwaaexz = wrsoijscdi[uclpklfgpw]
                    tx, ty = (
                        ijacxsomkw * seqirgamfml.factor[0],
                        uaobwaaexz * seqirgamfml.factor[1],
                    )
                    pbcmzzlljs[uclpklfgpw] = (
                        ijacxsomkw + (tx - ijacxsomkw) * ifhmniazpq,
                        uaobwaaexz + (ty - uaobwaaexz) * ifhmniazpq,
                    )
                elif isinstance(seqirgamfml, pdknumaurvb):
                    ifhmniazpq = seqirgamfml.cipiqgzehl.atdawhwcvio(reiiyswsxj)
                    ijacxsomkw, uaobwaaexz = wrsoijscdi[uclpklfgpw]
                    pbcmzzlljs[uclpklfgpw] = (
                        ijacxsomkw + (seqirgamfml.xgzseehgie - ijacxsomkw) * ifhmniazpq,
                        uaobwaaexz,
                    )
                elif isinstance(seqirgamfml, frzfuewrtkm):
                    ifhmniazpq = seqirgamfml.cipiqgzehl.atdawhwcvio(reiiyswsxj)
                    ijacxsomkw, uaobwaaexz = wrsoijscdi[uclpklfgpw]
                    pbcmzzlljs[uclpklfgpw] = (
                        ijacxsomkw,
                        uaobwaaexz + (seqirgamfml.ngcjkhwdsl - uaobwaaexz) * ifhmniazpq,
                    )
                elif isinstance(seqirgamfml, qzdiayqgdqm):
                    ifhmniazpq = seqirgamfml.cipiqgzehl.atdawhwcvio(reiiyswsxj)
                    fmwyddjmxg = vtyzpcocsn[uclpklfgpw]
                    hcfqlzfwic = (fmwyddjmxg + seqirgamfml.sdxwoafbgo * ifhmniazpq) % 360.0
                    ydnpzvlluj[uclpklfgpw] = hcfqlzfwic + 360.0 if hcfqlzfwic < 0 else hcfqlzfwic
                elif isinstance(seqirgamfml, jtavlnqhtzl):
                    ifhmniazpq = seqirgamfml.cipiqgzehl.atdawhwcvio(reiiyswsxj)
                    fmwyddjmxg = vtyzpcocsn[uclpklfgpw]
                    dgvprthvsm = seqirgamfml.gnzymxsckw % 360.0
                    if dgvprthvsm < 0:
                        dgvprthvsm += 360.0
                    ztmiogkkvl = dgvprthvsm - fmwyddjmxg
                    if ztmiogkkvl > 180:
                        ztmiogkkvl -= 360
                    elif ztmiogkkvl < -180:
                        ztmiogkkvl += 360
                    hcfqlzfwic = (fmwyddjmxg + ztmiogkkvl * ifhmniazpq) % 360.0
                    ydnpzvlluj[uclpklfgpw] = hcfqlzfwic + 360.0 if hcfqlzfwic < 0 else hcfqlzfwic
            for uclpklfgpw, (gvmvjrdlhrf, nivlpgfoykq) in svrdwozvby.items():
                ijacxsomkw, uaobwaaexz = qaifoprbxv[uclpklfgpw]
                uclpklfgpw.set_position(ijacxsomkw + gvmvjrdlhrf, uaobwaaexz + nivlpgfoykq)
            for uclpklfgpw, (oaoqqhkyrr, bbxnuchvgb) in pbcmzzlljs.items():
                uclpklfgpw.tnxxzczblvt, uclpklfgpw.ppoluxgtqul = (oaoqqhkyrr, bbxnuchvgb)
                uclpklfgpw.ftnhhwoybs()
            for uclpklfgpw, imbluzpmff in ydnpzvlluj.items():
                uclpklfgpw.ntaykiuhwea = imbluzpmff
                uclpklfgpw.vbuqqpukzf()
        for crypsjcbtq, thmwhobpts in etoqvuxyrp:
            if crypsjcbtq >= fqgdaamrzm:
                if thmwhobpts.nqyzyfvbkff:
                    thmwhobpts.nqyzyfvbkff.kjcgxeembe(thmwhobpts)
                elif oegtnpbqims := lytnusjuva.wnjgppqcoh.oegtnpbqims:
                    oegtnpbqims.remove(thmwhobpts)


"."


class eollalrjeg:
    """."""

    __slots__ = ("ojilieuwrah", "vyebgdxovnm", "tuxqgponvlq", "qgfifoygrvi")

    # Readability v3: structural flow; eollalrjeg.__init__:3578-3586
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        ojilieuwrah: list[str],
        vyebgdxovnm: dict[str, list[str]],
        tuxqgponvlq: dict[str, tuple[int, int]] | None = None,
        qgfifoygrvi: dict[str, list[list[str]]] | None = None,
    ):
        self.ojilieuwrah, self.vyebgdxovnm = (ojilieuwrah, vyebgdxovnm)
        self.tuxqgponvlq, self.qgfifoygrvi = (tuxqgponvlq or {}, qgfifoygrvi or {})

    # Readability v3: return_expression; eollalrjeg.tile_size:3589-3590
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def tile_size(self) -> tuple[int, int]:
        return self.tuxqgponvlq.get("tile_size", (8, 8))

    # Readability v3: return_expression; eollalrjeg.hiaiflnslto:3593-3594
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def hiaiflnslto(self) -> int:
        return max((len(isdpjaoopl) for isdpjaoopl in self.ojilieuwrah)) if self.ojilieuwrah else 0

    # Readability v3: return_expression; eollalrjeg.jlkfqcwrspr:3597-3598
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def jlkfqcwrspr(self) -> int:
        return len(self.ojilieuwrah)

    # Readability v3: return_expression; eollalrjeg.image_groups:3601-3602
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def image_groups(self) -> list[list[str]]:
        return self.qgfifoygrvi.get("image_groups", [])


class fbsrjmvxij(wwnfrkbzon):
    """."""

    # Readability v3: structural flow; fbsrjmvxij.__init__:3608-3610
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, aujbzpqexr: np.ndarray, layer: int, name: str):
        super().__init__([], {}, {"layer": layer, "name": name})
        object.__setattr__(self, "xpqwtepewcw", aujbzpqexr)

    # Readability v3: return_expression; fbsrjmvxij.hiaiflnslto:3613-3614
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def hiaiflnslto(self) -> int:
        return self.xpqwtepewcw.shape[1] if self.xpqwtepewcw is not None else 0

    # Readability v3: return_expression; fbsrjmvxij.jlkfqcwrspr:3617-3618
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def jlkfqcwrspr(self) -> int:
        return self.xpqwtepewcw.shape[0] if self.xpqwtepewcw is not None else 0

    # Readability v3: return_expression; fbsrjmvxij.sxwqiwdisg:3620-3621
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def sxwqiwdisg(self) -> np.ndarray:
        return self.xpqwtepewcw if self.xpqwtepewcw is not None else np.zeros((1, 1))


class olmxmdlyhf(qoljprchpbb):
    """."""

    __slots__ = (
        "porbskbertu",
        "igmurzpcaud",
        "uygjwnsqolr",
        "fahmgfzntkd",
        "fcokslsroqg",
        "xvinmttpvyo",
        "xugdrdcyrgu",
        "aecpqxevthw",
        "alpxqefissx",
    )

    # Readability v3: structural flow; olmxmdlyhf.__init__:3639-3656
    # Explicit 8-statement structural flow below; 0 conditions, 0 loops, 7 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        ctqmtpaxkpb: str,
        wsayyqskzq: list[tuple[int, int]] | None = None,
        x: int = 0,
        y: int = 0,
        layer: int = 0,
        name: str = "",
        collidable: bool = True,
    ):
        super().__init__(klxajkxujf=None, name=name, x=0, y=0)
        self.porbskbertu, self.igmurzpcaud = (x, y)
        self.uygjwnsqolr = wsayyqskzq or [(0, 0)]
        self.fahmgfzntkd = ctqmtpaxkpb
        self.fcokslsroqg: nfpetofmbpr | None = None
        self.bifnvdxmkdu, self.xvinmttpvyo = (layer, collidable)
        self.xugdrdcyrgu = self.aecpqxevthw = 0
        self.alpxqefissx: dict[tuple[int, int], str] = {}

    # Readability v3: read_attribute; olmxmdlyhf.grid_x:3659-3660
    # Return self.porbskbertu; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def grid_x(self) -> int:
        return self.porbskbertu

    # Readability v3: read_attribute; olmxmdlyhf.grid_y:3663-3664
    # Return self.igmurzpcaud; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def grid_y(self) -> int:
        return self.igmurzpcaud

    # Readability v3: return_expression; olmxmdlyhf.chahdtpdoz:3667-3668
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def chahdtpdoz(self) -> tuple[int, int]:
        return (self.porbskbertu, self.igmurzpcaud)

    # Readability v3: update_binding; olmxmdlyhf.chahdtpdoz:3671-3672
    # Perform self.porbskbertu, self.igmurzpcaud = value; argument/attribute spellings are preserved. [structural-contract]
    @chahdtpdoz.setter
    def chahdtpdoz(self, value: tuple[int, int]) -> None:
        self.porbskbertu, self.igmurzpcaud = value

    # Readability v3: return_expression; olmxmdlyhf.wsayyqskzq:3675-3676
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def wsayyqskzq(self) -> list[tuple[int, int]]:
        return self.uygjwnsqolr.copy()

    # Readability v3: return_expression; olmxmdlyhf.abvcoxnskr:3679-3680
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def abvcoxnskr(self) -> list[tuple[int, int]]:
        return [(self.porbskbertu + dx, self.igmurzpcaud + dy) for dx, dy in self.uygjwnsqolr]

    # Readability v3: read_attribute; olmxmdlyhf.aunycdiyxf:3683-3684
    # Return self.fahmgfzntkd; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def aunycdiyxf(self) -> str:
        return self.fahmgfzntkd

    # Readability v3: read_attribute; olmxmdlyhf.collidable:3687-3688
    # Return self.xvinmttpvyo; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def collidable(self) -> bool:
        return self.xvinmttpvyo

    # Readability v3: update_binding; olmxmdlyhf.collidable:3691-3692
    # Perform self.xvinmttpvyo = value; argument/attribute spellings are preserved. [structural-contract]
    @collidable.setter
    def collidable(self, value: bool) -> None:
        self.xvinmttpvyo = value

    # Readability v3: read_attribute; olmxmdlyhf.grid:3695-3696
    # Return self.fcokslsroqg; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def grid(self) -> "nfpetofmbpr | None":
        return self.fcokslsroqg

    # Readability v3: return_expression; olmxmdlyhf.jktbdvfmlm:3698-3699
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def jktbdvfmlm(self, jgtjxcaavd: int, klmemmfyab: int) -> bool:
        return (jgtjxcaavd, klmemmfyab) in self.abvcoxnskr

    # Readability v3: return_expression; olmxmdlyhf.yhpnqahowv:3701-3702
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def yhpnqahowv(self, hjulbeqzgs: tuple[int, int]) -> str:
        return self.alpxqefissx.get(hjulbeqzgs, self.fahmgfzntkd)

    # Readability v3: structural flow; olmxmdlyhf.set_offset_image:3704-3710
    # Explicit 6-statement structural flow below; 2 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def set_offset_image(self, hjulbeqzgs: tuple[int, int], ctqmtpaxkpb: str) -> bool:
        if hjulbeqzgs not in self.uygjwnsqolr:
            return False
        self.alpxqefissx[hjulbeqzgs] = ctqmtpaxkpb
        if self.fcokslsroqg is not None:
            self.sfkdvkyyct(self.fcokslsroqg.nqxpvkylltv)
        return True

    # Readability v3: return_expression; olmxmdlyhf.kndirhpriw:3712-3713
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def kndirhpriw(self, hjulbeqzgs: tuple[int, int], rkronagedu: list[str], laguhngehw: int = 1) -> "aotzmhqympw":
        return xecuvhtski(hjulbeqzgs, rkronagedu, laguhngehw)

    # Readability v3: structural flow; olmxmdlyhf.ibkgbfplwp:3715-3721
    # Explicit 6-statement structural flow below; 2 conditions, 0 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ibkgbfplwp(self, hjulbeqzgs: tuple[int, int]) -> bool:
        if hjulbeqzgs not in self.alpxqefissx:
            return False
        del self.alpxqefissx[hjulbeqzgs]
        if self.fcokslsroqg is not None:
            self.sfkdvkyyct(self.fcokslsroqg.nqxpvkylltv)
        return True

    # Readability v3: structural flow; olmxmdlyhf.qligwogtfm:3723-3745
    # Explicit 21-statement structural flow below; 7 conditions, 2 loops, 5 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def qligwogtfm(self, javgdpnzdw: list[tuple[int, int]], jzrbkeygpi: bool = True) -> bool:
        if not javgdpnzdw:
            return False
        if self.fcokslsroqg is not None:
            for dx, dy in javgdpnzdw:
                cell_x, cell_y = (self.porbskbertu + dx, self.igmurzpcaud + dy)
                if not self.fcokslsroqg.bhpcoucvcs(cell_x, cell_y):
                    return False
                if self.xvinmttpvyo:
                    for nbkhciimbw in self.fcokslsroqg.ijpoqzvnjt(cell_x, cell_y):
                        if nbkhciimbw is not self and nbkhciimbw.xvinmttpvyo:
                            return False
        fruwjwxiin = self.abvcoxnskr
        self.uygjwnsqolr = list(javgdpnzdw)
        if jzrbkeygpi:
            kuiddxlgjw = set(javgdpnzdw)
            self.alpxqefissx = {k: v for k, v in self.alpxqefissx.items() if k in kuiddxlgjw}
        else:
            self.alpxqefissx.clear()
        if self.fcokslsroqg is not None:
            self.fcokslsroqg.ievgclzwme(self, fruwjwxiin, self.abvcoxnskr)
            self.sfkdvkyyct(self.fcokslsroqg.nqxpvkylltv)
        return True

    # Readability v3: return_expression; olmxmdlyhf.doxgkaweeo:3747-3748
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def doxgkaweeo(self, dx: int, dy: int) -> tuple[int, int]:
        return (self.porbskbertu + dx, self.igmurzpcaud + dy)

    # Readability v3: structural flow; olmxmdlyhf.ftuygjnvyu:3750-3752
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ftuygjnvyu(self, jgtjxcaavd: int, klmemmfyab: int) -> tuple[int, int] | None:
        hjulbeqzgs = (jgtjxcaavd - self.porbskbertu, klmemmfyab - self.igmurzpcaud)
        return hjulbeqzgs if hjulbeqzgs in self.uygjwnsqolr else None

    # Readability v3: structural flow; olmxmdlyhf.gzsqtegezh:3754-3765
    # Explicit 11-statement structural flow below; 4 conditions, 2 loops, 1 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def gzsqtegezh(self, x: int, y: int, dpkuzjocif: bool = True, renafeldzl: list[str] = []) -> bool:
        if self.fcokslsroqg is None:
            return True
        for dx, dy in self.uygjwnsqolr:
            cell_x, cell_y = (x + dx, y + dy)
            if not self.fcokslsroqg.bhpcoucvcs(cell_x, cell_y):
                return False
            if len(renafeldzl) > 0:
                for nbkhciimbw in self.fcokslsroqg.ijpoqzvnjt(cell_x, cell_y):
                    if nbkhciimbw.yrxvacxlgrf in renafeldzl:
                        return False
        return True

    # Readability v3: structural flow; olmxmdlyhf.dpdfdmsnjo:3767-3794
    # Explicit 11-statement structural flow below; 4 conditions, 0 loops, 3 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def dpdfdmsnjo(
        self,
        ixarzeyaovd: int,
        duxcpbpzzgo: int,
        dcirroxpgx: bool = False,
        zkvoijaril: bool = False,
        renafeldzl: list[str] = [],
        oaapizadlv: int = 3,
        gjifuhvheo: str = "ornhtmdrzbg",
    ) -> bool:
        if not dcirroxpgx and (not self.gzsqtegezh(ixarzeyaovd, duxcpbpzzgo, True, renafeldzl)):
            return False
        fruwjwxiin = self.abvcoxnskr
        self.porbskbertu, self.igmurzpcaud = (ixarzeyaovd, duxcpbpzzgo)
        if self.fcokslsroqg:
            self.fcokslsroqg.ievgclzwme(self, fruwjwxiin, self.abvcoxnskr)
        if zkvoijaril and self.qoifrofmiu is not None:
            self.yzcafrbdni(
                aotzmhqympw.swnkxhbsrg(
                    (ixarzeyaovd * self.xugdrdcyrgu, duxcpbpzzgo * self.aecpqxevthw),
                    oaapizadlv if not GRAPH_BUILDER else 1,
                    gjifuhvheo,
                )
            )
        else:
            self.eocrokcvgsq, self.htoojidbdud = (ixarzeyaovd * self.xugdrdcyrgu, duxcpbpzzgo * self.aecpqxevthw)
        self.xjyyzffvmz()
        return True

    # Readability v3: structural flow; olmxmdlyhf.wgpurpzqmc:3796-3804
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 2 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wgpurpzqmc(self, hnwlnxfeiqi: int, fimufdnxuji: int, dcirroxpgx: bool = False, renafeldzl: list[str] = []) -> bool:
        if not dcirroxpgx and (not self.gzsqtegezh(hnwlnxfeiqi, fimufdnxuji, True, renafeldzl)):
            return False
        fruwjwxiin = self.abvcoxnskr
        self.porbskbertu, self.igmurzpcaud = (hnwlnxfeiqi, fimufdnxuji)
        if self.fcokslsroqg:
            self.fcokslsroqg.ievgclzwme(self, fruwjwxiin, self.abvcoxnskr)
        self.xjyyzffvmz()
        return True

    # Readability v3: return_expression; olmxmdlyhf.xxlsofmxas:3806-3824
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def xxlsofmxas(
        self,
        dyxulvhbtnh: int,
        risorenokpb: int,
        dcirroxpgx: bool = False,
        zkvoijaril: bool = False,
        renafeldzl: list[str] = [],
        oaapizadlv: int = 3,
        gjifuhvheo: str = "ornhtmdrzbg",
    ) -> bool:
        return self.dpdfdmsnjo(
            self.porbskbertu + dyxulvhbtnh,
            self.igmurzpcaud + risorenokpb,
            dcirroxpgx,
            zkvoijaril,
            renafeldzl,
            oaapizadlv=oaapizadlv,
            gjifuhvheo=gjifuhvheo,
        )

    # Readability v3: return_expression; olmxmdlyhf.wiqzvmwqgq:3826-3827
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def wiqzvmwqgq(self, fjwguwuitap: int, zkptwchlynl: int, dcirroxpgx: bool = False, renafeldzl: list[str] = []) -> bool:
        return self.wgpurpzqmc(self.porbskbertu + fjwguwuitap, self.igmurzpcaud + zkptwchlynl, dcirroxpgx, renafeldzl)

    # Readability v3: structural flow; olmxmdlyhf.pneghtfqtt:3829-3837
    # Explicit 8-statement structural flow below; 3 conditions, 0 loops, 3 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def pneghtfqtt(self) -> None:
        if self.xugdrdcyrgu == 0 or self.aecpqxevthw == 0:
            return
        pdiguzgjqsg, dqglnncrvct = (self.eocrokcvgsq // self.xugdrdcyrgu, self.htoojidbdud // self.aecpqxevthw)
        if pdiguzgjqsg != self.porbskbertu or dqglnncrvct != self.igmurzpcaud:
            fruwjwxiin = self.abvcoxnskr
            self.porbskbertu, self.igmurzpcaud = (pdiguzgjqsg, dqglnncrvct)
            if self.fcokslsroqg:
                self.fcokslsroqg.ievgclzwme(self, fruwjwxiin, self.abvcoxnskr)

    # Readability v3: structural flow; olmxmdlyhf.jixaxxwlpc:3839-3851
    # Explicit 12-statement structural flow below; 5 conditions, 2 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jixaxxwlpc(self) -> None:
        if self.fcokslsroqg is None:
            return
        for roiohosytj, uqubdogqju in list(self.fcokslsroqg.idxxrzryctb.items()):
            if self in uqubdogqju:
                uqubdogqju.remove(self)
                if not uqubdogqju:
                    del self.fcokslsroqg.idxxrzryctb[roiohosytj]
        for roiohosytj in self.abvcoxnskr:
            if roiohosytj not in self.fcokslsroqg.idxxrzryctb:
                self.fcokslsroqg.idxxrzryctb[roiohosytj] = []
            if self not in self.fcokslsroqg.idxxrzryctb[roiohosytj]:
                self.fcokslsroqg.idxxrzryctb[roiohosytj].append(self)

    # Readability v3: structural flow; olmxmdlyhf._post_undo_restore:3853-3854
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def _post_undo_restore(self) -> None:
        self.jixaxxwlpc()

    # Readability v3: structural flow; olmxmdlyhf.sfkdvkyyct:3856-3925
    # Explicit 68-statement structural flow below; 17 conditions, 2 loops, 47 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sfkdvkyyct(self, lebqfosqjk: dict[str, wwnfrkbzon]) -> None:
        if not self.uygjwnsqolr:
            return
        lybcyceanl = self.fahmgfzntkd or (next(iter(self.alpxqefissx.values())) if self.alpxqefissx else None)
        ksghjfhsst = lebqfosqjk.get(lybcyceanl) if lybcyceanl else None
        if ksghjfhsst is None:
            return
        if self.fcokslsroqg is not None:
            tile_h, tile_w = self.fcokslsroqg.tile_size
        else:
            nxkwudlkeb = ksghjfhsst.sxwqiwdisg()
            tile_h, tile_w = nxkwudlkeb.shape
        self.xugdrdcyrgu, self.aecpqxevthw = (tile_w, tile_h)
        ixopouodrb = min((dx for dx, dy in self.uygjwnsqolr))
        zzrpczapph = min((dy for dx, dy in self.uygjwnsqolr))
        klpxtewdzn = 0
        nnecdvkscc = 0
        wtftlnycyg = False
        for dx, dy in self.uygjwnsqolr:
            cvrujsdqbh = self.alpxqefissx.get((dx, dy), self.fahmgfzntkd)
            uqhmgevifb = lebqfosqjk.get(cvrujsdqbh) if cvrujsdqbh else None
            if uqhmgevifb is None:
                continue
            vtfmxumsge = uqhmgevifb.sxwqiwdisg()
            actual_h, actual_w = vtfmxumsge.shape
            zbrerjpjoo = (dx - ixopouodrb) * tile_w
            rbeioinzyb = (dy - zzrpczapph) * tile_h
            vbydyionkj = zbrerjpjoo + actual_w
            fyffllefkm = rbeioinzyb + actual_h
            if vbydyionkj > klpxtewdzn:
                klpxtewdzn = vbydyionkj
            if fyffllefkm > nnecdvkscc:
                nnecdvkscc = fyffllefkm
            wtftlnycyg = True
        if not wtftlnycyg:
            return
        hiaiflnslto, jlkfqcwrspr = (klpxtewdzn, nnecdvkscc)
        ypjneaezoc = np.full((jlkfqcwrspr, hiaiflnslto), -1, dtype=np.int8)
        for dx, dy in sorted(self.uygjwnsqolr, key=lambda x: (-x[0], x[1])):
            cvrujsdqbh = self.alpxqefissx.get((dx, dy), self.fahmgfzntkd)
            uqhmgevifb = lebqfosqjk.get(cvrujsdqbh) if cvrujsdqbh else None
            if uqhmgevifb is None:
                continue
            vtfmxumsge = uqhmgevifb.sxwqiwdisg()
            actual_h, actual_w = vtfmxumsge.shape
            zbrerjpjoo = (dx - ixopouodrb) * tile_w
            rbeioinzyb = (dy - zzrpczapph) * tile_h
            end_x = min(actual_w, hiaiflnslto - zbrerjpjoo)
            end_y = min(actual_h, jlkfqcwrspr - rbeioinzyb)
            if end_x <= 0 or end_y <= 0:
                continue
            ucbbajqskx = vtfmxumsge[:end_y, :end_x]
            txqxbfnepp = ypjneaezoc[rbeioinzyb : rbeioinzyb + end_y, zbrerjpjoo : zbrerjpjoo + end_x]
            nxqjiwemwj = ucbbajqskx >= 0
            txqxbfnepp[nxqjiwemwj] = ucbbajqskx[nxqjiwemwj]
        eogxybaqyv = self.fcokslsroqg.bifnvdxmkdu if self.fcokslsroqg is not None else self.bifnvdxmkdu
        if eogxybaqyv == 0 and hasattr(ksghjfhsst, "layer"):
            eogxybaqyv = ksghjfhsst.layer
        xvtfiwnrep = fbsrjmvxij(ypjneaezoc, eogxybaqyv, f"{self.yrxvacxlgrf}_flattened")
        self.ultqqtpbdxi = xvtfiwnrep
        self.bifnvdxmkdu = eogxybaqyv
        oegtnpbqims = self.dlxcsfkbtv()
        if oegtnpbqims is not None:
            oegtnpbqims.wlblbzaghgm = True
        self.eocrokcvgsq = (self.porbskbertu + ixopouodrb) * tile_w
        self.htoojidbdud = (self.igmurzpcaud + zzrpczapph) * tile_h
        self.xjyyzffvmz()
        oegtnpbqims = self.dlxcsfkbtv()
        if oegtnpbqims:
            oegtnpbqims.wlblbzaghgm = True

    # Readability v3: structural flow; olmxmdlyhf.ilxgwuxqnh:3927-3934
    # Explicit 6-statement structural flow below; 1 conditions, 0 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ilxgwuxqnh(self, fqvbprugys: str) -> None:
        """."""
        self.fahmgfzntkd = fqvbprugys
        self.alpxqefissx.clear()
        if self.fcokslsroqg is not None:
            self.sfkdvkyyct(self.fcokslsroqg.nqxpvkylltv)
        else:
            self.xjyyzffvmz()


class nfpetofmbpr(qoljprchpbb):
    """."""

    __slots__ = (
        "xmsykfeaamo",
        "nqxpvkylltv",
        "xugdrdcyrgu",
        "aecpqxevthw",
        "ksfoftduxiu",
        "kfiapdsgfly",
        "kdsncymzyeb",
        "idxxrzryctb",
    )

    # Readability v3: structural flow; nfpetofmbpr.__init__:3951-3965
    # Explicit 7-statement structural flow below; 0 conditions, 0 loops, 5 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(
        self,
        seyngofpjw: eollalrjeg,
        lebqfosqjk: dict[str, wwnfrkbzon],
        vorymigywec: int = 0,
        zyesgbswbzp: int = 0,
        name: str = "",
    ):
        super().__init__(klxajkxujf=None, name=name, x=vorymigywec, y=zyesgbswbzp)
        self.xmsykfeaamo, self.nqxpvkylltv = (seyngofpjw, lebqfosqjk)
        self.xugdrdcyrgu, self.aecpqxevthw = seyngofpjw.tile_size
        self.ksfoftduxiu, self.kfiapdsgfly = (seyngofpjw.hiaiflnslto, seyngofpjw.jlkfqcwrspr)
        self.kdsncymzyeb: list[olmxmdlyhf] = []
        self.idxxrzryctb: dict[tuple[int, int], list[olmxmdlyhf]] = {}
        self.yhmlrjsvnb()

    # Readability v3: structural flow; nfpetofmbpr.ukeadpfggp:3967-3987
    # Explicit 19-statement structural flow below; 7 conditions, 3 loops, 5 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ukeadpfggp(self, diwaubzcrn: list[str] | None = None) -> dict[str, set[tuple[int, int]]]:
        ijmaynffxd: set[tuple[int, int]] = set()
        hgjdjioein: dict[str, set[tuple[int, int]]] | None = None
        if diwaubzcrn is not None:
            hgjdjioein = dict()
        for x in range(self.ksfoftduxiu):
            for y in range(self.kfiapdsgfly):
                if diwaubzcrn is None:
                    if self.ijpoqzvnjt(x, y) != []:
                        ijmaynffxd.add((x, y))
                else:
                    jwwxkfqwki = [i.name for i in self.ijpoqzvnjt(x, y)]
                    for name in jwwxkfqwki:
                        if name in diwaubzcrn:
                            if hgjdjioein is not None:
                                if name not in hgjdjioein:
                                    hgjdjioein[name] = set()
                                hgjdjioein[name].add((x, y))
        if hgjdjioein is not None:
            return hgjdjioein
        return {"all": ijmaynffxd}

    # Readability v3: read_attribute; nfpetofmbpr.layer:3990-3991
    # Return self.bifnvdxmkdu; descriptor behavior is not assumed pure. [structural-contract]
    @property
    def layer(self) -> int:
        return self.bifnvdxmkdu

    # Readability v3: structural flow; nfpetofmbpr.layer:3994-4005
    # Explicit 11-statement structural flow below; 3 conditions, 1 loops, 6 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    @layer.setter
    def layer(self, value: int) -> None:
        if self.bifnvdxmkdu == value:
            return
        self.bifnvdxmkdu = value
        for nbkhciimbw in self.kdsncymzyeb:
            nbkhciimbw.bifnvdxmkdu = value
            ioebcmszmx = nbkhciimbw.ultqqtpbdxi
            if isinstance(ioebcmszmx, fbsrjmvxij):
                ioebcmszmx.himwfikanwk["layer"] = value
        oegtnpbqims = self.dlxcsfkbtv()
        if oegtnpbqims:
            oegtnpbqims.wlblbzaghgm = True

    # Readability v3: return_expression; nfpetofmbpr.tile_size:4008-4009
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def tile_size(self) -> tuple[int, int]:
        return (self.xugdrdcyrgu, self.aecpqxevthw)

    # Readability v3: return_expression; nfpetofmbpr.grid_size:4012-4013
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def grid_size(self) -> tuple[int, int]:
        return (self.ksfoftduxiu, self.kfiapdsgfly)

    # Readability v3: return_expression; nfpetofmbpr.znhqphkpkh:4016-4020
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def znhqphkpkh(self) -> tuple[int, int]:
        return (
            self.ksfoftduxiu * self.xugdrdcyrgu,
            self.kfiapdsgfly * self.aecpqxevthw,
        )

    # Readability v3: return_expression; nfpetofmbpr.xpnsbxlatu:4023-4024
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    @property
    def xpnsbxlatu(self) -> list[olmxmdlyhf]:
        return self.kdsncymzyeb.copy()

    # Readability v3: return_expression; nfpetofmbpr.bhpcoucvcs:4026-4027
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def bhpcoucvcs(self, jgtjxcaavd: int, klmemmfyab: int) -> bool:
        return 0 <= jgtjxcaavd < self.ksfoftduxiu and 0 <= klmemmfyab < self.kfiapdsgfly

    # Readability v3: return_expression; nfpetofmbpr.rqsccxstfp:4029-4030
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def rqsccxstfp(self, jgtjxcaavd: int, klmemmfyab: int) -> tuple[int, int]:
        return (jgtjxcaavd * self.xugdrdcyrgu, klmemmfyab * self.aecpqxevthw)

    # Readability v3: structural flow; nfpetofmbpr.ynrlesqrjv:4032-4037
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ynrlesqrjv(self, jgtjxcaavd: int, klmemmfyab: int) -> tuple[int, int]:
        tozquqlwpv, mgpjkqwvnw = self.mepgityjcj()
        return (
            tozquqlwpv + jgtjxcaavd * self.xugdrdcyrgu,
            mgpjkqwvnw + klmemmfyab * self.aecpqxevthw,
        )

    # Readability v3: return_expression; nfpetofmbpr.vesaetoerk:4039-4040
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def vesaetoerk(self, ytootmllvh: int, xxpzziewyv: int) -> tuple[int, int]:
        return (ytootmllvh // self.xugdrdcyrgu, xxpzziewyv // self.aecpqxevthw)

    # Readability v3: structural flow; nfpetofmbpr.rmsmkyupfm:4042-4047
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def rmsmkyupfm(self, tozquqlwpv: int, mgpjkqwvnw: int) -> tuple[int, int]:
        zbrerjpjoo, rbeioinzyb = self.mepgityjcj()
        return (
            (tozquqlwpv - zbrerjpjoo) // self.xugdrdcyrgu,
            (mgpjkqwvnw - rbeioinzyb) // self.aecpqxevthw,
        )

    # Readability v3: return_expression; nfpetofmbpr.ijpoqzvnjt:4049-4050
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def ijpoqzvnjt(self, jgtjxcaavd: int, klmemmfyab: int) -> list[olmxmdlyhf]:
        return self.idxxrzryctb.get((jgtjxcaavd, klmemmfyab), []).copy()

    # Readability v3: return_expression; nfpetofmbpr.kkyzkqsmbw:4052-4053
    # Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
    def kkyzkqsmbw(self, abvcoxnskr: list[tuple[int, int]]) -> list[olmxmdlyhf]:
        return [nbkhciimbw for nbkhciimbw in self.kdsncymzyeb if set(nbkhciimbw.abvcoxnskr) & set(abvcoxnskr)]

    # Readability v3: structural flow; nfpetofmbpr.yxglxadasa:4055-4059
    # Explicit 4-statement structural flow below; 1 conditions, 1 loops, 0 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def yxglxadasa(self, name: str) -> olmxmdlyhf | None:
        for nbkhciimbw in self.kdsncymzyeb:
            if nbkhciimbw.yrxvacxlgrf == name:
                return nbkhciimbw
        return None

    # Readability v3: structural flow; nfpetofmbpr.iwbpkgrqrq:4061-4084
    # Explicit 23-statement structural flow below; 6 conditions, 3 loops, 6 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def iwbpkgrqrq(self, quyzwdpshw: olmxmdlyhf) -> bool:
        """."""
        for jgtjxcaavd, klmemmfyab in quyzwdpshw.abvcoxnskr:
            if not self.bhpcoucvcs(jgtjxcaavd, klmemmfyab):
                return False
            if quyzwdpshw.xvinmttpvyo:
                for rsiovqaxzu in self.ijpoqzvnjt(jgtjxcaavd, klmemmfyab):
                    if rsiovqaxzu.xvinmttpvyo:
                        return False
        quyzwdpshw.fcokslsroqg = self
        quyzwdpshw.xugdrdcyrgu = self.xugdrdcyrgu
        quyzwdpshw.aecpqxevthw = self.aecpqxevthw
        if self.bifnvdxmkdu != 0:
            quyzwdpshw.bifnvdxmkdu = self.bifnvdxmkdu
        quyzwdpshw.sfkdvkyyct(self.nqxpvkylltv)
        if isinstance(quyzwdpshw.ultqqtpbdxi, fbsrjmvxij):
            quyzwdpshw.ultqqtpbdxi.himwfikanwk["layer"] = quyzwdpshw.bifnvdxmkdu
        self.kdsncymzyeb.append(quyzwdpshw)
        for roiohosytj in quyzwdpshw.abvcoxnskr:
            if roiohosytj not in self.idxxrzryctb:
                self.idxxrzryctb[roiohosytj] = []
            self.idxxrzryctb[roiohosytj].append(quyzwdpshw)
        self.oyzpaylqco(quyzwdpshw)
        return True

    # Readability v3: structural flow; nfpetofmbpr.faretcdgmc:4086-4099
    # Explicit 13-statement structural flow below; 4 conditions, 1 loops, 2 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def faretcdgmc(self, quyzwdpshw: olmxmdlyhf) -> bool:
        if quyzwdpshw not in self.kdsncymzyeb:
            return False
        for roiohosytj in quyzwdpshw.abvcoxnskr:
            if roiohosytj in self.idxxrzryctb:
                uqubdogqju = self.idxxrzryctb[roiohosytj]
                if quyzwdpshw in uqubdogqju:
                    uqubdogqju.remove(quyzwdpshw)
                if not uqubdogqju:
                    del self.idxxrzryctb[roiohosytj]
        self.kjcgxeembe(quyzwdpshw)
        self.kdsncymzyeb.remove(quyzwdpshw)
        quyzwdpshw.fcokslsroqg = None
        return True

    # Readability v3: read_attribute; nfpetofmbpr.flthrcytsd:4101-4102
    # Return quyzwdpshw.abvcoxnskr; descriptor behavior is not assumed pure. [structural-contract]
    def flthrcytsd(self, quyzwdpshw: olmxmdlyhf) -> list[tuple[int, int]]:
        return quyzwdpshw.abvcoxnskr

    # Readability v3: structural flow; nfpetofmbpr.whdmasyorl:4104-4106
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def whdmasyorl(self, diwaubzcrn: str | list[str]) -> list[olmxmdlyhf]:
        opykwwrvpj = {diwaubzcrn} if isinstance(diwaubzcrn, str) else set(diwaubzcrn)
        return [p for p in self.kdsncymzyeb if p.yrxvacxlgrf in opykwwrvpj]

    # Readability v3: structural flow; nfpetofmbpr.ndtvadsrqf:4108-4110
    # Explicit 2-statement structural flow below; 1 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ndtvadsrqf(self, ixdawjzwod: str | list[str]) -> list[olmxmdlyhf]:
        gpbumhygim = {ixdawjzwod} if isinstance(ixdawjzwod, str) else set(ixdawjzwod)
        return [p for p in self.kdsncymzyeb if any((p.yrxvacxlgrf.startswith(prefix) for prefix in gpbumhygim))]

    # Readability v3: structural flow; nfpetofmbpr.ievgclzwme:4112-4128
    # Explicit 11-statement structural flow below; 4 conditions, 2 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ievgclzwme(
        self,
        quyzwdpshw: olmxmdlyhf,
        fruwjwxiin: list[tuple[int, int]],
        uzllowddmh: list[tuple[int, int]],
    ) -> None:
        for roiohosytj in fruwjwxiin:
            if roiohosytj in self.idxxrzryctb:
                uqubdogqju = self.idxxrzryctb[roiohosytj]
                if quyzwdpshw in uqubdogqju:
                    uqubdogqju.remove(quyzwdpshw)
                if not uqubdogqju:
                    del self.idxxrzryctb[roiohosytj]
        for roiohosytj in uzllowddmh:
            if roiohosytj not in self.idxxrzryctb:
                self.idxxrzryctb[roiohosytj] = []
            self.idxxrzryctb[roiohosytj].append(quyzwdpshw)

    # Readability v3: structural flow; nfpetofmbpr._post_undo_restore:4130-4144
    # Explicit 14-statement structural flow below; 2 conditions, 3 loops, 6 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def _post_undo_restore(self) -> None:
        """."""
        mansbohouu = [kgjynspwva for kgjynspwva in self.rxmjztculbk if isinstance(kgjynspwva, olmxmdlyhf)]
        fzcewvhozl = set(mansbohouu)
        for nbkhciimbw in self.kdsncymzyeb:
            if nbkhciimbw not in fzcewvhozl:
                nbkhciimbw.fcokslsroqg = None
        self.kdsncymzyeb = mansbohouu
        self.idxxrzryctb.clear()
        for nbkhciimbw in self.kdsncymzyeb:
            nbkhciimbw.fcokslsroqg = self
            for roiohosytj in nbkhciimbw.abvcoxnskr:
                if roiohosytj not in self.idxxrzryctb:
                    self.idxxrzryctb[roiohosytj] = []
                self.idxxrzryctb[roiohosytj].append(nbkhciimbw)

    # Readability v3: structural flow; nfpetofmbpr.yhmlrjsvnb:4146-4175
    # Explicit 28-statement structural flow below; 5 conditions, 8 loops, 9 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def yhmlrjsvnb(self) -> None:
        """."""
        ojilieuwrah = self.xmsykfeaamo.ojilieuwrah
        vyebgdxovnm = self.xmsykfeaamo.vyebgdxovnm
        image_groups = self.xmsykfeaamo.image_groups
        swovrfwhap: dict[str, int] = {}
        for i, fyvegwoxwv in enumerate(image_groups):
            for key in fyvegwoxwv:
                swovrfwhap[key] = i
        wgqrymrxmn: dict[int, list[tuple[int, int, str]]] = {i: [] for i in range(len(image_groups))}
        ndnlcdwsha: dict[str, list[tuple[int, int]]] = {}
        for klmemmfyab, isdpjaoopl in enumerate(ojilieuwrah):
            for jgtjxcaavd, rjmymfjqri in enumerate(isdpjaoopl):
                if rjmymfjqri not in vyebgdxovnm:
                    continue
                for payqtwcqbi in vyebgdxovnm[rjmymfjqri]:
                    rrqccvdxqj = swovrfwhap.get(payqtwcqbi)
                    if rrqccvdxqj is not None:
                        wgqrymrxmn[rrqccvdxqj].append((jgtjxcaavd, klmemmfyab, payqtwcqbi))
                    else:
                        if payqtwcqbi not in ndnlcdwsha:
                            ndnlcdwsha[payqtwcqbi] = []
                        ndnlcdwsha[payqtwcqbi].append((jgtjxcaavd, klmemmfyab))
        for rrqccvdxqj, abvcoxnskr in wgqrymrxmn.items():
            if abvcoxnskr:
                self.llpujngrtq(rrqccvdxqj, image_groups[rrqccvdxqj], abvcoxnskr)
        for payqtwcqbi, ahrctkmrda in ndnlcdwsha.items():
            if ahrctkmrda:
                for cdpcbbnfdp in ahrctkmrda:
                    self.wnlpwaaniy(payqtwcqbi, [cdpcbbnfdp])

    # Readability v3: structural flow; nfpetofmbpr.llpujngrtq:4177-4239
    # Explicit 49-statement structural flow below; 7 conditions, 3 loops, 34 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def llpujngrtq(
        self,
        rrqccvdxqj: int,
        psswzvvgav: list[str],
        abvcoxnskr: list[tuple[int, int, str]],
    ) -> None:
        """."""
        if not abvcoxnskr:
            return
        ktyfzvrtjg = min((awuziztlvh[0] for awuziztlvh in abvcoxnskr))
        yvjuenjgae = min((awuziztlvh[1] for awuziztlvh in abvcoxnskr))
        gvgwviwkrp = max((awuziztlvh[0] for awuziztlvh in abvcoxnskr))
        ccmtjobxdq = max((awuziztlvh[1] for awuziztlvh in abvcoxnskr))
        hiaiflnslto = (gvgwviwkrp - ktyfzvrtjg + 1) * self.xugdrdcyrgu
        jlkfqcwrspr = (ccmtjobxdq - yvjuenjgae + 1) * self.aecpqxevthw
        ypjneaezoc = np.full((jlkfqcwrspr, hiaiflnslto), -1, dtype=np.int8)
        csvdvxiead = 0
        for key in psswzvvgav:
            if key in self.nqxpvkylltv:
                csvdvxiead = min(csvdvxiead, self.nqxpvkylltv[key].layer)
        for jgtjxcaavd, klmemmfyab, payqtwcqbi in abvcoxnskr:
            if payqtwcqbi not in self.nqxpvkylltv:
                continue
            zbrerjpjoo = (jgtjxcaavd - ktyfzvrtjg) * self.xugdrdcyrgu
            rbeioinzyb = (klmemmfyab - yvjuenjgae) * self.aecpqxevthw
            qkigfmzlgw = self.nqxpvkylltv[payqtwcqbi]
            yslsxvalyq = qkigfmzlgw.sxwqiwdisg()
            img_h, img_w = yslsxvalyq.shape
            end_x = min(img_w, hiaiflnslto - zbrerjpjoo)
            end_y = min(img_h, jlkfqcwrspr - rbeioinzyb)
            if end_x <= 0 or end_y <= 0:
                continue
            ucbbajqskx = yslsxvalyq[:end_y, :end_x]
            txqxbfnepp = ypjneaezoc[rbeioinzyb : rbeioinzyb + end_y, zbrerjpjoo : zbrerjpjoo + end_x]
            nxqjiwemwj = ucbbajqskx >= 0
            txqxbfnepp[nxqjiwemwj] = ucbbajqskx[nxqjiwemwj]
        wsayyqskzq = [(jgtjxcaavd - ktyfzvrtjg, klmemmfyab - yvjuenjgae) for jgtjxcaavd, klmemmfyab, ssnguhllov in abvcoxnskr]
        eogxybaqyv = self.bifnvdxmkdu if self.bifnvdxmkdu != 0 else csvdvxiead
        xvtfiwnrep = fbsrjmvxij(ypjneaezoc, eogxybaqyv, f"bg_group_{rrqccvdxqj}")
        skmfiwaifd = f"{psswzvvgav[0]}" if len(psswzvvgav) == 1 else f"background_group:{'-'.join(psswzvvgav)}"
        ntocdejnme = olmxmdlyhf(
            ctqmtpaxkpb="",
            wsayyqskzq=wsayyqskzq,
            x=ktyfzvrtjg,
            y=yvjuenjgae,
            layer=eogxybaqyv,
            name=skmfiwaifd,
            collidable=False,
        )
        ntocdejnme.fcokslsroqg = self
        ntocdejnme.xugdrdcyrgu = self.xugdrdcyrgu
        ntocdejnme.aecpqxevthw = self.aecpqxevthw
        ntocdejnme.ultqqtpbdxi = xvtfiwnrep
        ntocdejnme.bifnvdxmkdu = eogxybaqyv
        ntocdejnme.eocrokcvgsq = ktyfzvrtjg * self.xugdrdcyrgu
        ntocdejnme.htoojidbdud = yvjuenjgae * self.aecpqxevthw
        self.kdsncymzyeb.append(ntocdejnme)
        self.oyzpaylqco(ntocdejnme)
        for jgtjxcaavd, klmemmfyab in [(jgtjxcaavd, klmemmfyab) for jgtjxcaavd, klmemmfyab, ssnguhllov in abvcoxnskr]:
            umxvaldmrr = (jgtjxcaavd, klmemmfyab)
            if umxvaldmrr not in self.idxxrzryctb:
                self.idxxrzryctb[umxvaldmrr] = []
            self.idxxrzryctb[umxvaldmrr].append(ntocdejnme)

    # Readability v3: structural flow; nfpetofmbpr.wnlpwaaniy:4241-4292
    # Explicit 43-statement structural flow below; 4 conditions, 2 loops, 32 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def wnlpwaaniy(self, payqtwcqbi: str, ahrctkmrda: list[tuple[int, int]]) -> None:
        """."""
        if not ahrctkmrda or payqtwcqbi not in self.nqxpvkylltv:
            return
        qkigfmzlgw = self.nqxpvkylltv[payqtwcqbi]
        ktyfzvrtjg = min((p[0] for p in ahrctkmrda))
        yvjuenjgae = min((p[1] for p in ahrctkmrda))
        gvgwviwkrp = max((p[0] for p in ahrctkmrda))
        ccmtjobxdq = max((p[1] for p in ahrctkmrda))
        hiaiflnslto = (gvgwviwkrp - ktyfzvrtjg + 1) * self.xugdrdcyrgu
        jlkfqcwrspr = (ccmtjobxdq - yvjuenjgae + 1) * self.aecpqxevthw
        ypjneaezoc = np.full((jlkfqcwrspr, hiaiflnslto), -1, dtype=np.int8)
        yslsxvalyq = qkigfmzlgw.sxwqiwdisg()
        img_h, img_w = yslsxvalyq.shape
        layer = qkigfmzlgw.layer
        for jgtjxcaavd, klmemmfyab in ahrctkmrda:
            zbrerjpjoo = (jgtjxcaavd - ktyfzvrtjg) * self.xugdrdcyrgu
            rbeioinzyb = (klmemmfyab - yvjuenjgae) * self.aecpqxevthw
            end_x = min(img_w, hiaiflnslto - zbrerjpjoo)
            end_y = min(img_h, jlkfqcwrspr - rbeioinzyb)
            if end_x <= 0 or end_y <= 0:
                continue
            ucbbajqskx = yslsxvalyq[:end_y, :end_x]
            txqxbfnepp = ypjneaezoc[rbeioinzyb : rbeioinzyb + end_y, zbrerjpjoo : zbrerjpjoo + end_x]
            nxqjiwemwj = ucbbajqskx >= 0
            txqxbfnepp[nxqjiwemwj] = ucbbajqskx[nxqjiwemwj]
        wsayyqskzq = [(jgtjxcaavd - ktyfzvrtjg, klmemmfyab - yvjuenjgae) for jgtjxcaavd, klmemmfyab in ahrctkmrda]
        eogxybaqyv = self.bifnvdxmkdu if self.bifnvdxmkdu != 0 else layer
        xvtfiwnrep = fbsrjmvxij(ypjneaezoc, eogxybaqyv, f"bg_{payqtwcqbi}")
        ntocdejnme = olmxmdlyhf(
            ctqmtpaxkpb="",
            wsayyqskzq=wsayyqskzq,
            x=ktyfzvrtjg,
            y=yvjuenjgae,
            layer=eogxybaqyv,
            name=payqtwcqbi,
            collidable=False,
        )
        ntocdejnme.fcokslsroqg = self
        ntocdejnme.xugdrdcyrgu = self.xugdrdcyrgu
        ntocdejnme.aecpqxevthw = self.aecpqxevthw
        ntocdejnme.ultqqtpbdxi = xvtfiwnrep
        ntocdejnme.bifnvdxmkdu = eogxybaqyv
        ntocdejnme.eocrokcvgsq = ktyfzvrtjg * self.xugdrdcyrgu
        ntocdejnme.htoojidbdud = yvjuenjgae * self.aecpqxevthw
        self.kdsncymzyeb.append(ntocdejnme)
        self.oyzpaylqco(ntocdejnme)
        for jgtjxcaavd, klmemmfyab in ahrctkmrda:
            key = (jgtjxcaavd, klmemmfyab)
            if key not in self.idxxrzryctb:
                self.idxxrzryctb[key] = []
            self.idxxrzryctb[key].append(ntocdejnme)


# Readability v3: return_expression; pqnaniifxw:4295-4296
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def pqnaniifxw() -> list[tuple[int, int]]:
    return [(0, 0)]


# Readability v3: return_expression; hnrwvlgnww:4299-4300
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def hnrwvlgnww() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0)]


# Readability v3: return_expression; ejygpbjzdk:4303-4304
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def ejygpbjzdk() -> list[tuple[int, int]]:
    return [(0, 0), (0, 1)]


# Readability v3: return_expression; ezqxiakuwq:4307-4308
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def ezqxiakuwq() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0), (2, 0)]


# Readability v3: return_expression; xgkbyshekj:4311-4312
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def xgkbyshekj() -> list[tuple[int, int]]:
    return [(0, 0), (0, 1), (1, 1)]


# Readability v3: return_expression; pngxsyfrww:4315-4316
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def pngxsyfrww() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0), (2, 0), (3, 0)]


# Readability v3: return_expression; hrcbsooteg:4319-4320
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def hrcbsooteg() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0), (0, 1), (1, 1)]


# Readability v3: return_expression; eokmjybtyd:4323-4324
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def eokmjybtyd() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0), (2, 0), (1, 1)]


# Readability v3: return_expression; jlhivjfeou:4327-4328
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def jlhivjfeou() -> list[tuple[int, int]]:
    return [(1, 0), (2, 0), (0, 1), (1, 1)]


# Readability v3: return_expression; vrvxxrqrdp:4331-4332
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def vrvxxrqrdp() -> list[tuple[int, int]]:
    return [(0, 0), (1, 0), (1, 1), (2, 1)]


# Readability v3: return_expression; wrthsrutqt:4335-4336
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def wrthsrutqt() -> list[tuple[int, int]]:
    return [(0, 0), (0, 1), (1, 1), (2, 1)]


# Readability v3: return_expression; fskdkqbunk:4339-4340
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def fskdkqbunk() -> list[tuple[int, int]]:
    return [(2, 0), (0, 1), (1, 1), (2, 1)]


# Readability v3: return_expression; dtlhozgnyr:4343-4344
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def dtlhozgnyr(wsayyqskzq: list[tuple[int, int]]) -> list[tuple[int, int]]:
    return [(dy, -dx) for dx, dy in wsayyqskzq]


# Readability v3: return_expression; vkruybvknw:4347-4348
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def vkruybvknw(wsayyqskzq: list[tuple[int, int]]) -> list[tuple[int, int]]:
    return [(-dy, dx) for dx, dy in wsayyqskzq]


# Readability v3: structural flow; thzvcwpexv:4351-4358
# Explicit 4-statement structural flow below; 1 conditions, 0 loops, 1 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def thzvcwpexv(wsayyqskzq: list[tuple[int, int]]) -> list[tuple[int, int]]:
    if not wsayyqskzq:
        return wsayyqskzq
    min_x, min_y = (
        min((dx for dx, dy in wsayyqskzq)),
        min((dy for dx, dy in wsayyqskzq)),
    )
    return [(dx - min_x, dy - min_y) for dx, dy in wsayyqskzq]


# Readability v3: return_expression; znwmkagjwk:4361-4362
# Return the exact expression shown in the flow; no additional game-role inference. [structural-contract]
def znwmkagjwk(liuovpaygl: list[str], rjmymfjqri: str = "x") -> list[tuple[int, int]]:
    return [(x, y) for y, isdpjaoopl in enumerate(liuovpaygl) for x, awuziztlvh in enumerate(isdpjaoopl) if awuziztlvh == rjmymfjqri]


yxfirncjqy = 1
lebqfosqjk = {
    "fozwvlovdui": wwnfrkbzon(
        ["      ", "  oo  ", " oooo ", " oooo ", "  oo  ", "      "],
        {"o": GREEN},
        {"layer": yxfirncjqy, "name": "fozwvlovdui"},
    ),
    "jotnhmftwdg_fozwvlovdui": wwnfrkbzon(
        ["      ", "  oo  ", " oooo ", " oooo ", "  oo  ", "      "],
        {"o": GRAY},
        {"layer": yxfirncjqy, "name": "fozwvlovdui"},
    ),
    "fozwvlovdui_igcydyfanuk": wwnfrkbzon(
        ["      ", "  oo  ", " oooo ", " oooo ", "  oo  ", "      "],
        {"o": GREEN},
        {"layer": yxfirncjqy + 1, "name": "fozwvlovdui"},
    ),
    "fozwvlovdui_1": wwnfrkbzon(
        ["      ", "  o   ", " ooo  ", "  oo  ", "      ", "      "],
        {"o": GREEN},
        {"layer": yxfirncjqy, "name": "fozwvlovdui"},
    ),
    "fozwvlovdui_2": wwnfrkbzon(
        ["      ", "      ", "  oo  ", "  oo  ", "      ", "      "],
        {"o": GREEN},
        {"layer": yxfirncjqy, "name": "fozwvlovdui"},
    ),
    "fozwvlovdui_3": wwnfrkbzon(
        ["      ", "      ", "  o   ", "      ", "      ", "      "],
        {"o": GREEN},
        {"layer": yxfirncjqy, "name": "fozwvlovdui"},
    ),
    "unfozwvlovdui": wwnfrkbzon(
        ["      ", "  oo  ", " oooo ", " oooo ", "  oo  ", "      "],
        {"": GREEN},
        {"layer": yxfirncjqy, "name": "fozwvlovdui"},
    ),
    "fozwvlovdui_red": wwnfrkbzon(
        ["      ", "  oo  ", " oooo ", " oooo ", "  oo  ", "      "],
        {"o": RED},
        {"layer": yxfirncjqy, "name": "fozwvlovdui_red"},
    ),
    "fozwvlovdui_red_igcydyfanuk": wwnfrkbzon(
        ["      ", "  oo  ", " oooo ", " oooo ", "  oo  ", "      "],
        {"o": RED},
        {"layer": yxfirncjqy + 1, "name": "fozwvlovdui_red"},
    ),
    "fozwvlovdui_blue": wwnfrkbzon(
        ["      ", "  oo  ", " oooo ", " oooo ", "  oo  ", "      "],
        {"o": BLUE},
        {"layer": yxfirncjqy, "name": "fozwvlovdui"},
    ),
    "fozwvlovdui_blue_igcydyfanuk": wwnfrkbzon(
        ["      ", "  oo  ", " oooo ", " oooo ", "  oo  ", "      "],
        {"o": BLUE},
        {"layer": yxfirncjqy + 1, "name": "fozwvlovdui_red"},
    ),
    "fozwvlovdui_gray": wwnfrkbzon(
        ["      ", "  oo  ", " oooo ", " oooo ", "  oo  ", "      "],
        {"o": OFF_BLACK},
        {"layer": yxfirncjqy, "name": "fozwvlovdui_gray"},
    ),
    "csrvckunbev": wwnfrkbzon(
        [" xxxx ", "xxooxx", "xoooox", "xoooox", "xxooxx", " xxxx "],
        {"x": DARK_GRAY},
        {"layer": yxfirncjqy, "name": "fozwvlovdui"},
    ),
    "lgbyiaitpdi": wwnfrkbzon(
        ["      ", "  oo  ", " o..o ", " o..o ", "  oo  ", "      "],
        {"x": OFF_WHITE, "o": GRAY},
        {"layer": yxfirncjqy},
    ),
    "lgbyiaitpdi_0": wwnfrkbzon(
        ["      ", "  ..  ", " .oo. ", " .oo. ", "  ..  ", "      "],
        {"x": OFF_WHITE, "o": GRAY},
        {"layer": yxfirncjqy},
    ),
    "jmbixtieild": wwnfrkbzon(
        ["      ", "  oo  ", " o..o ", " o..o ", "  oo  ", "      "],
        {".": OFF_WHITE, "o": GRAY},
        {"layer": 1},
    ),
    "making_jmbixtieild": wwnfrkbzon(
        ["      ", "  ..  ", " .oo. ", " .oo. ", "  ..  ", "      "],
        {".": OFF_WHITE, "o": GRAY},
        {"layer": 1},
    ),
    "hupkpseyuim": wwnfrkbzon(
        ["xxxxxx", "x....x", "x....x", "x....x", "x....x", "xxxxxx"],
        {".": OFF_WHITE, "x": WHITE},
        {"layer": -1, "name": "hupkpseyuim"},
    ),
    "hupkpseyuim2": wwnfrkbzon(
        ["xxxxxx", "x....x", "x....x", "x....x", "x....x", "xxxxxx"],
        {".": ORANGE, "x": YELLOW},
        {"layer": -1, "name": "hupkpseyuim"},
    ),
    "hupkpseyuim_selected": wwnfrkbzon(
        ["      ", " .oo. ", " o..o ", " o..o ", " .oo. ", "      "],
        {".": OFF_WHITE, "o": GRAY, " ": WHITE},
        {"layer": 1},
    ),
    "hupkpseyuim_selected_0": wwnfrkbzon(
        ["      ", " .... ", " .oo. ", " .oo. ", " .... ", "      "],
        {".": OFF_WHITE, "o": GRAY, " ": WHITE},
        {"layer": 1},
    ),
    "hupkpseyuim_selected_1": wwnfrkbzon(
        ["      ", " .... ", " .oo. ", " .oo. ", " .... ", "      "],
        {".": OFF_WHITE, "o": GRAY, " ": WHITE},
        {"layer": 1},
    ),
    "hupkpseyuim_bg": wwnfrkbzon(
        [
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
        ],
        {"x": BLACK},
        {"layer": -2, "name": "hupkpseyuim_bg"},
    ),
    "hupkpseyuim_drop": wwnfrkbzon(
        [
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
            "xxxxxxxx",
        ],
        {"x": BLUE},
        {"layer": -3, "name": "hupkpseyuim_drop"},
    ),
    "dgxfozncuiz": wwnfrkbzon(
        [".xxxx.", ".xwnx.", ".xnnx.", ".xxxx.", ".bbbb......."],
        {"x": PURPLE, "n": PINK, "w": WHITE, "b": BLACK},
        {"name": "dgxfozncuiz"},
    ),
    "dgxfozncuiz_selected": wwnfrkbzon(
        [".nxxn.", ".xnnx.", ".xnnx.", ".xnnx.", ".bbbb."],
        {"x": PINK, "n": PINK, "w": WHITE, "b": BLACK},
        {"name": "dgxfozncuiz"},
    ),
    "dgxfozncuiz_empty": wwnfrkbzon(
        [
            "......",
            "......",
            "......",
            "......",
            "......",
            "......",
            "......",
            ".......",
        ],
        {".": LIGHT_BLUE},
        {"name": "empty_slot"},
    ),
    "qourshpgjvg-3": wwnfrkbzon(
        ["...", ".x.", ".x.", ".x.", "..."],
        {".": LIGHT_BLUE, "x": BLUE},
        {"name": "qourshpgjvg-3"},
    ),
    "qourshpgjvg-2": wwnfrkbzon(
        ["...", "...", ".x.", ".x.", "..."],
        {".": LIGHT_BLUE, "x": BLUE},
        {"name": "qourshpgjvg-2"},
    ),
    "qourshpgjvg-1": wwnfrkbzon(
        ["...", "...", "...", ".x.", "..."],
        {".": LIGHT_BLUE, "x": BLUE},
        {"name": "qourshpgjvg-1"},
    ),
    "qourshpgjvg-0": wwnfrkbzon(
        ["...", "...", "...", "...", "..."],
        {".": LIGHT_BLUE, "x": BLUE},
        {"name": "qourshpgjvg-0"},
    ),
    "kraubslpehi": wwnfrkbzon(
        ["xxxxxx", "xxxxxx", "      ", "      ", "xxxxxx", "xxxxxx"],
        {" ": BLACK},
        {"layer": -2, "name": "qourshpgjvg-2"},
    ),
    "kraubslpehi-up": wwnfrkbzon(
        ["xx  x", "xx  x", "xx  x", "xx  x", "xx  x", "xx  x"],
        {" ": BLACK},
        {"layer": -2, "name": "qourshpgjvg-2"},
    ),
    "kraubslpehi-3": wwnfrkbzon(
        ["xx  xx", "xx  xx", "    xx", "    xx", "xxxxxx", "xxxxxx"],
        {" ": BLACK},
        {"layer": -2, "name": "qourshpgjvg-2"},
    ),
    "kraubslpehi-L": wwnfrkbzon(
        ["xx  xx", "xx  xx", "xx    ", "xx    ", "xxxxxx", "xxxxxx"],
        {" ": BLACK},
        {"layer": -2, "name": "qourshpgjvg-2"},
    ),
    "kraubslpehi->": wwnfrkbzon(
        ["xxxxxx", "xxxxxx", "    x", "    x", "xx  x", "xx  x"],
        {" ": BLACK},
        {"layer": -2, "name": "qourshpgjvg-2"},
    ),
    "kraubslpehi-<": wwnfrkbzon(
        ["xxxxxx", "xxxxxx", "xx    ", "xx    ", "xx  x", "xx  x"],
        {" ": BLACK},
        {"layer": -2, "name": "qourshpgjvg-2"},
    ),
    "kraubslpehi-T": wwnfrkbzon(
        ["xxxxxx", "xxxxxx", "      ", "      ", "xx  xx", "xx  xx"],
        {" ": BLACK},
        {"layer": -2, "name": "qourshpgjvg-2"},
    ),
    "kraubslpehi-t": wwnfrkbzon(
        ["xx  xx", "xx  xx", "      ", "      ", "xxxxxx", "xxxxxx"],
        {" ": BLACK},
        {"layer": -2, "name": "qourshpgjvg-2"},
    ),
    "cwyrzsciwms": wwnfrkbzon(
        [
            " bbbbbbbb ",
            "bbxxxxxxbb ",
            "bxxxxxxxxbg,",
            "bxxbbbbxxbg",
            "bxxbwwbxxbg",
            "bxxbwwbxxbg",
            "bxxbbbbxxbg",
            "bxxxxxxxxbg",
            "bbxxxxxxbbg",
            " bbbxxbbbgg",
            "   bxxbggg",
            "   bxxbg",
            "   bxxbg ",
            "   bxxbg ",
            "   bxxbg ",
        ],
        {"x": PURPLE, ".": PINK, "b": BLACK, "g": BLUE, "w": WHITE},
        {"layer": 10, "name": "qourshpgjvg-2"},
    ),
    "bhdfjlqapap_0": wwnfrkbzon(
        ["", "  bbbb ", " bb  bb", " b    b", " b    b", " bb  bb", "  bbbb "],
        {"b": BLUE},
        {"layer": 11, "name": "qourshpgjvg-2"},
    ),
    "bhdfjlqapap_1": wwnfrkbzon(
        [
            " bbbbbb ",
            "bb    bb",
            "b      b",
            "b      b",
            "b      b",
            "b      b",
            "bb    bb",
            " bbbbbb",
        ],
        {"b": BLUE},
        {"layer": 11, "name": "qourshpgjvg-2"},
    ),
}
kciatvszkc = {
    "grid1": eollalrjeg(
        [
            "",
            ".......",
            ".xx.x..",
            ".....x.",
            "    ...",
            "    .x.",
            "    ...",
            "    ...",
        ],
        {
            "x": ["fozwvlovdui", "hupkpseyuim"],
            "o": ["jmbixtieild", "hupkpseyuim"],
            ".": ["hupkpseyuim"],
            ",": ["hupkpseyuim2", "kraubslpehi"],
            "p": ["dgxfozncuiz"],
            "-": ["kraubslpehi"],
            "|": ["kraubslpehi-up"],
            "L": ["kraubslpehi-L"],
            "3": ["kraubslpehi-3"],
            "<": ["kraubslpehi-<"],
            ">": ["kraubslpehi->"],
        },
        {"tile_size": (6, 6)},
        {
            "image_groups": [
                ["hupkpseyuim"],
                ["kraubslpehi"],
                ["kraubslpehi-up"],
                ["kraubslpehi->"],
                ["kraubslpehi-L"],
                ["kraubslpehi-3"],
            ]
        },
    ),
    "grid2": eollalrjeg(
        [
            "....... ",
            ".xx.x.x->",
            "....... |",
            "        |",
            " <--,---3",
            " |      ",
            " |    ..",
            " L----x.",
        ],
        {
            "x": ["fozwvlovdui", "hupkpseyuim"],
            "o": ["jmbixtieild", "hupkpseyuim"],
            ".": ["hupkpseyuim"],
            ",": ["hupkpseyuim2", "kraubslpehi"],
            "p": ["dgxfozncuiz"],
            "-": ["kraubslpehi"],
            "|": ["kraubslpehi-up"],
            "L": ["kraubslpehi-L"],
            "3": ["kraubslpehi-3"],
            "<": ["kraubslpehi-<"],
            ">": ["kraubslpehi->"],
        },
        {"tile_size": (6, 6)},
        {
            "image_groups": [
                ["hupkpseyuim"],
                ["kraubslpehi"],
                ["kraubslpehi-up"],
                ["kraubslpehi->"],
                ["kraubslpehi-L"],
                ["kraubslpehi-3"],
            ]
        },
    ),
    "grid3": eollalrjeg(
        [
            ".. ..     ..",
            ".x .x-,--x..",
            ".x.x      .xx.",
            "..x.      ..",
            "          .xx.",
            "      <-> ..",
            "      | | x..",
            ".x.x-,3 L-.x",
            "...       ..",
        ],
        {
            "x": ["fozwvlovdui", "hupkpseyuim"],
            "o": ["jmbixtieild", "hupkpseyuim"],
            ".": ["hupkpseyuim"],
            ",": ["hupkpseyuim2", "kraubslpehi"],
            "p": ["dgxfozncuiz"],
            "-": ["kraubslpehi"],
            "|": ["kraubslpehi-up"],
            "L": ["kraubslpehi-L"],
            "3": ["kraubslpehi-3"],
            "<": ["kraubslpehi-<"],
            ">": ["kraubslpehi->"],
        },
        {"tile_size": (6, 6)},
        {
            "image_groups": [
                ["hupkpseyuim"],
                ["kraubslpehi"],
                ["kraubslpehi-up"],
                ["kraubslpehi->"],
                ["kraubslpehi-L"],
                ["kraubslpehi-3"],
            ]
        },
    ),
    "grid4": eollalrjeg(
        [
            "",
            "",
            ".......",
            ".xp.p.x-,---x...x.",
            ".......     .p..p.",
            "            ......",
            "            .p..p.",
            "        <---,..p..",
            "        |",
            "    .x. | ",
            "   .p p.p..",
            "   .----,-.",
            "   .p p....",
            "    .x.",
        ],
        {
            "x": ["fozwvlovdui", "hupkpseyuim"],
            "o": ["jmbixtieild", "hupkpseyuim"],
            ".": ["hupkpseyuim"],
            ",": ["hupkpseyuim2", "kraubslpehi"],
            "p": ["dgxfozncuiz", "hupkpseyuim"],
            "P": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi-up"],
            "-": ["kraubslpehi"],
            "|": ["kraubslpehi-up"],
            "L": ["kraubslpehi-L"],
            "3": ["kraubslpehi-3"],
            "<": ["kraubslpehi-<"],
            ">": ["kraubslpehi->"],
        },
        {"tile_size": (6, 6)},
        {
            "image_groups": [
                ["hupkpseyuim"],
                ["kraubslpehi"],
                ["kraubslpehi-up"],
                ["kraubslpehi->"],
                ["kraubslpehi-L"],
                ["kraubslpehi-3"],
                ["kraubslpehi-T"],
                ["kraubslpehi-t"],
            ]
        },
    ),
    "grid5": eollalrjeg(
        [
            " -,-T-P-      ..p..x",
            "    |        <---T-P>",
            " ...|  <--> .|...|. |",
            " xp.|.x|  Lx.|.p.|..|",
            " ...|  |    .|..p|x.|",
            "    |  |     L---t--3",
            "  <-t--3       .",
            "  |            p",
            "  |           ..x",
        ],
        {
            "x": ["fozwvlovdui", "hupkpseyuim"],
            "o": ["jmbixtieild", "hupkpseyuim"],
            ".": ["hupkpseyuim"],
            ",": ["hupkpseyuim2", "kraubslpehi"],
            "p": ["dgxfozncuiz", "hupkpseyuim"],
            "P": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi"],
            "-": ["kraubslpehi"],
            "|": ["kraubslpehi-up"],
            "L": ["kraubslpehi-L"],
            "3": ["kraubslpehi-3"],
            "<": ["kraubslpehi-<"],
            ">": ["kraubslpehi->"],
            "T": ["kraubslpehi-T"],
            "t": ["kraubslpehi-t"],
        },
        {"tile_size": (6, 6)},
        {"image_groups": [["hupkpseyuim"], ["kraubslpehi"]]},
    ),
    "grid6": eollalrjeg(
        [
            "",
            " ....         ....   ",
            " .r..         .x.........>. ",
            " .x..         p..p     p |x",
            " ....         |  |    .?.|.",
            " ......       |  |    x| |",
            " ......,,-----t--3  ...L-3",
            " x.....             x",
            "   x                .",
        ],
        {
            "x": ["fozwvlovdui", "hupkpseyuim"],
            "o": ["jmbixtieild", "hupkpseyuim"],
            ".": ["hupkpseyuim"],
            ",": ["hupkpseyuim2", "kraubslpehi"],
            "p": ["dgxfozncuiz", "hupkpseyuim"],
            "r": ["fozwvlovdui_red", "hupkpseyuim"],
            "?": ["hupkpseyuim2", "kraubslpehi-up"],
            "P": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi"],
            "-": ["kraubslpehi"],
            "|": ["kraubslpehi-up"],
            "L": ["kraubslpehi-L"],
            "3": ["kraubslpehi-3"],
            "<": ["kraubslpehi-<"],
            ">": ["kraubslpehi->"],
            "T": ["kraubslpehi-T"],
            "t": ["kraubslpehi-t"],
        },
        {"tile_size": (6, 6)},
        {"image_groups": [["hupkpseyuim"], ["kraubslpehi"]]},
    ),
    "grid7": eollalrjeg(
        [
            "                 <--->",
            "x     r    <-->  |   |",
            "p     p    |  ; <tTPTt>",
            "L--T--3  <-t-p. | D D |",
            "   |     |    .   | | ;",
            " <-t-,> <t->  .p.p. | .",
            " |    | |  |  .p.p.   x",
            " p    p L->p           ",
            " .p.p.....3.",
        ],
        {
            "x": ["fozwvlovdui", "hupkpseyuim"],
            "o": ["jmbixtieild", "hupkpseyuim"],
            ".": ["hupkpseyuim"],
            ",": ["hupkpseyuim2", "kraubslpehi"],
            ";": ["hupkpseyuim2", "kraubslpehi-up"],
            "D": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi-up"],
            "p": ["dgxfozncuiz", "hupkpseyuim"],
            "r": ["fozwvlovdui_red", "hupkpseyuim"],
            "?": ["hupkpseyuim2", "kraubslpehi-up"],
            "P": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi"],
            "-": ["kraubslpehi"],
            "|": ["kraubslpehi-up"],
            "L": ["kraubslpehi-L"],
            "3": ["kraubslpehi-3"],
            "<": ["kraubslpehi-<"],
            ">": ["kraubslpehi->"],
            "T": ["kraubslpehi-T"],
            "t": ["kraubslpehi-t"],
        },
        {"tile_size": (6, 6)},
        {"image_groups": [["hupkpseyuim"], ["kraubslpehi"]]},
    ),
    "grid8": eollalrjeg(
        [
            "       ",
            "",
            " ........",
            " xp...p..",
            " ......p.",
            "<-p...p..",
            "|...b....",
            "|...b...x",
            "|       |",
            "L-,>   <3",
            "   |   ;",
            " ......bb",
            " L--P,P-3",
        ],
        {
            "x": ["fozwvlovdui", "hupkpseyuim"],
            "b": ["fozwvlovdui_blue", "hupkpseyuim"],
            "o": ["jmbixtieild", "hupkpseyuim"],
            ".": ["hupkpseyuim"],
            ",": ["hupkpseyuim2", "kraubslpehi"],
            ";": ["hupkpseyuim2", "kraubslpehi-up"],
            "D": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi-up"],
            "p": ["dgxfozncuiz", "hupkpseyuim"],
            "r": ["fozwvlovdui_red", "hupkpseyuim"],
            "?": ["hupkpseyuim2", "kraubslpehi-up"],
            "P": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi"],
            "-": ["kraubslpehi"],
            "|": ["kraubslpehi-up"],
            "L": ["kraubslpehi-L"],
            "3": ["kraubslpehi-3"],
            "<": ["kraubslpehi-<"],
            ">": ["kraubslpehi->"],
            "T": ["kraubslpehi-T"],
            "t": ["kraubslpehi-t"],
        },
        {"tile_size": (6, 6)},
        {"image_groups": [["hupkpseyuim"], ["kraubslpehi"]]},
    ),
    "grid9": eollalrjeg(
        [
            "       ",
            "           x..p.p......",
            "  ..b..    .........bb.",
            "  ...b.    .p.....p.p..",
            "  .....              ..",
            "  ....,--------------..",
            "  xb..   ",
            "  .b..x  ",
        ],
        {
            "x": ["fozwvlovdui", "hupkpseyuim"],
            "b": ["fozwvlovdui_blue", "hupkpseyuim"],
            "o": ["jmbixtieild", "hupkpseyuim"],
            ".": ["hupkpseyuim"],
            ",": ["hupkpseyuim2", "kraubslpehi"],
            ";": ["hupkpseyuim2", "kraubslpehi-up"],
            "D": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi-up"],
            "p": ["dgxfozncuiz", "hupkpseyuim"],
            "r": ["fozwvlovdui_red", "hupkpseyuim"],
            "?": ["hupkpseyuim2", "kraubslpehi-up"],
            "P": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi"],
            "-": ["kraubslpehi"],
            "|": ["kraubslpehi-up"],
            "L": ["kraubslpehi-L"],
            "3": ["kraubslpehi-3"],
            "<": ["kraubslpehi-<"],
            ">": ["kraubslpehi->"],
            "T": ["kraubslpehi-T"],
            "t": ["kraubslpehi-t"],
        },
        {"tile_size": (6, 6)},
        {"image_groups": [["hupkpseyuim"], ["kraubslpehi"]]},
    ),
    "grid10": eollalrjeg(
        [
            "   .x. ",
            "<-T-T-T->",
            "| ; ; ; |",
            "| L-t-3 |",
            "|       |",
            "| ...bb |",
            "L--b... |",
            "  ..b.. |",
            "  b.... |",
            "  ....x 7",
            "        7",
            "        7",
            "        7",
            "        7",
        ],
        {
            "x": ["fozwvlovdui", "hupkpseyuim"],
            "b": ["fozwvlovdui_blue", "hupkpseyuim"],
            "o": ["jmbixtieild", "hupkpseyuim"],
            ".": ["hupkpseyuim"],
            ",": ["hupkpseyuim2", "kraubslpehi"],
            ";": ["hupkpseyuim2", "kraubslpehi-up"],
            "7": ["fozwvlovdui_blue", "hupkpseyuim2", "kraubslpehi-up"],
            "D": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi-up"],
            "p": ["dgxfozncuiz", "hupkpseyuim"],
            "r": ["fozwvlovdui_red", "hupkpseyuim"],
            "?": ["hupkpseyuim2", "kraubslpehi-up"],
            "P": ["dgxfozncuiz", "hupkpseyuim2", "kraubslpehi"],
            "-": ["kraubslpehi"],
            "|": ["kraubslpehi-up"],
            "L": ["kraubslpehi-L"],
            "3": ["kraubslpehi-3"],
            "<": ["kraubslpehi-<"],
            ">": ["kraubslpehi->"],
            "T": ["kraubslpehi-T"],
            "t": ["kraubslpehi-t"],
        },
        {"tile_size": (6, 6)},
        {"image_groups": [["hupkpseyuim"], ["kraubslpehi"]]},
    ),
}
vjafsffahp = [(0, -1), (1, 0), (0, 1), (-1, 0)]
umuwshjrei = Tuple[int, int]
ftlgdbcmhp = Tuple[int, int, int, int]


# Readability v3: structural flow; dvdyayoxvz:5007-5017
# Explicit 10-statement structural flow below; 1 conditions, 2 loops, 6 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def dvdyayoxvz(grid: List[List[int]]) -> List[List[int]]:
    """."""
    fmnlumsqko = len(grid)
    jomuwuxwxc = len(grid[0]) if fmnlumsqko else 0
    wdbdembuji = [[0] * (jomuwuxwxc + 1) for ssnguhllov in range(fmnlumsqko + 1)]
    for y in range(fmnlumsqko):
        hyjytmrjln = 0
        for x in range(jomuwuxwxc):
            hyjytmrjln += grid[y][x]
            wdbdembuji[y + 1][x + 1] = wdbdembuji[y][x + 1] + hyjytmrjln
    return wdbdembuji


# Readability v3: structural flow; fstewfpvkm:5020-5023
# Explicit 3-statement structural flow below; 0 conditions, 0 loops, 1 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def fstewfpvkm(wdbdembuji: List[List[int]], ckrahuwyhg: int, saffxbrqzy: int, eqkshkbdgua: int, aauuzgmpxyj: int) -> int:
    """."""
    xa, ya, xb, yb = (ckrahuwyhg, saffxbrqzy, eqkshkbdgua + 1, aauuzgmpxyj + 1)
    return wdbdembuji[yb][xb] - wdbdembuji[ya][xb] - wdbdembuji[yb][xa] + wdbdembuji[ya][xa]


# Readability v3: structural flow; pnzuyeevuo:5026-5125
# Explicit 74-statement structural flow below; 14 conditions, 12 loops, 31 writes and 5 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def pnzuyeevuo(soxhqoswel: Set[umuwshjrei], *, phrbjuosok: bool = True, zochpgdnqk: bool = True) -> List[ftlgdbcmhp]:
    """."""
    if not soxhqoswel:
        return []
    fmaxgakohk = [x for x, ssnguhllov in soxhqoswel]
    dcxwuvtphx = [y for ssnguhllov, y in soxhqoswel]
    minx, maxx = (min(fmaxgakohk), max(fmaxgakohk))
    miny, maxy = (min(dcxwuvtphx), max(dcxwuvtphx))
    jomuwuxwxc = maxx - minx + 1
    fmnlumsqko = maxy - miny + 1
    grid = [[0] * jomuwuxwxc for ssnguhllov in range(fmnlumsqko)]
    for x, y in soxhqoswel:
        grid[y - miny][x - minx] = 1
    wdbdembuji = dvdyayoxvz(grid)
    aewrtgorrf: List[ftlgdbcmhp] = []
    khvyoqgyyt: List[Set[umuwshjrei]] = []
    for saffxbrqzy in range(fmnlumsqko):
        for aauuzgmpxyj in range(saffxbrqzy, fmnlumsqko):
            for ckrahuwyhg in range(jomuwuxwxc):
                for eqkshkbdgua in range(ckrahuwyhg, jomuwuxwxc):
                    area = (eqkshkbdgua - ckrahuwyhg + 1) * (aauuzgmpxyj - saffxbrqzy + 1)
                    if fstewfpvkm(wdbdembuji, ckrahuwyhg, saffxbrqzy, eqkshkbdgua, aauuzgmpxyj) == area:
                        abvcoxnskr = {(minx + x, miny + y) for y in range(saffxbrqzy, aauuzgmpxyj + 1) for x in range(ckrahuwyhg, eqkshkbdgua + 1)}
                        aewrtgorrf.append((minx + ckrahuwyhg, miny + saffxbrqzy, minx + eqkshkbdgua, miny + aauuzgmpxyj))
                        khvyoqgyyt.append(abvcoxnskr)
    if len(soxhqoswel) == jomuwuxwxc * fmnlumsqko:
        return [(minx, miny, maxx, maxy)]
    tfomxkervo: Dict[umuwshjrei, List[int]] = {reiiyswsxj: [] for reiiyswsxj in soxhqoswel}
    for i, abvcoxnskr in enumerate(khvyoqgyyt):
        for reiiyswsxj in abvcoxnskr:
            if reiiyswsxj in tfomxkervo:
                tfomxkervo[reiiyswsxj].append(i)
    belwakvatc = [True] * len(aewrtgorrf)
    dumycgmeyn = sorted(range(len(aewrtgorrf)), key=lambda i: len(khvyoqgyyt[i]), reverse=True)
    lalnvqfdir: List[Set[umuwshjrei]] = []
    for i in dumycgmeyn:
        xvmbmgnzfy = khvyoqgyyt[i]
        for wfpfxqumet in lalnvqfdir:
            if xvmbmgnzfy.issubset(wfpfxqumet):
                belwakvatc[i] = False
                break
        if belwakvatc[i]:
            lalnvqfdir.append(xvmbmgnzfy)
    if any((not k for k in belwakvatc)):
        jfwdouzrln: List[ftlgdbcmhp] = []
        uzllowddmh: List[Set[umuwshjrei]] = []
        bxvgziuykc = {}
        for gzevzbsqxb, k in enumerate(belwakvatc):
            if k:
                bxvgziuykc[gzevzbsqxb] = len(jfwdouzrln)
                jfwdouzrln.append(aewrtgorrf[gzevzbsqxb])
                uzllowddmh.append(khvyoqgyyt[gzevzbsqxb])
        aewrtgorrf, khvyoqgyyt = (jfwdouzrln, uzllowddmh)
        tfomxkervo = {reiiyswsxj: [] for reiiyswsxj in soxhqoswel}
        for i, abvcoxnskr in enumerate(khvyoqgyyt):
            for reiiyswsxj in abvcoxnskr:
                if reiiyswsxj in tfomxkervo:
                    tfomxkervo[reiiyswsxj].append(i)

    # Readability v3: structural flow; pnzuyeevuo.jwengalvza:5085-5108
    # Explicit 5-statement structural flow below; 0 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jwengalvza() -> List[int] | None:
        kbmqqxzvjy = set(soxhqoswel)
        best: List[int] | None = None

        # Readability v3: structural flow; pnzuyeevuo.jwengalvza.sonequovgs:5089-5105
        # Explicit 16-statement structural flow below; 3 conditions, 1 loops, 5 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
        def sonequovgs(edzscmpzvd: List[int], kbmqqxzvjy: Set[umuwshjrei]) -> None:
            nonlocal best
            if best is not None and len(edzscmpzvd) >= len(best):
                return
            if not kbmqqxzvjy:
                best = edzscmpzvd.copy()
                return
            reiiyswsxj = min(kbmqqxzvjy, key=lambda nokztuohnj: len(tfomxkervo[nokztuohnj]))
            iydeircujg = tfomxkervo[reiiyswsxj]
            if not iydeircujg:
                return
            iydeircujg = sorted(iydeircujg, key=lambda i: len(khvyoqgyyt[i]), reverse=True)
            for xcdykascck in iydeircujg:
                crvgyeqpvw = kbmqqxzvjy - khvyoqgyyt[xcdykascck]
                edzscmpzvd.append(xcdykascck)
                sonequovgs(edzscmpzvd, crvgyeqpvw)
                edzscmpzvd.pop()

        sonequovgs([], kbmqqxzvjy)
        return best

    if phrbjuosok:
        lcfcmsrafc = jwengalvza()
        if lcfcmsrafc is not None:
            return [aewrtgorrf[i] for i in lcfcmsrafc]
        if not zochpgdnqk:
            return []
    kbmqqxzvjy = set(soxhqoswel)
    edzscmpzvd: List[int] = []
    while kbmqqxzvjy:
        jlblwnsqjl = max(range(len(aewrtgorrf)), key=lambda i: len(khvyoqgyyt[i] & kbmqqxzvjy))
        bvoslwsfrl = len(khvyoqgyyt[jlblwnsqjl] & kbmqqxzvjy)
        if bvoslwsfrl == 0:
            break
        edzscmpzvd.append(jlblwnsqjl)
        kbmqqxzvjy -= khvyoqgyyt[jlblwnsqjl]
    return [aewrtgorrf[i] for i in edzscmpzvd]


class equnaohchtj(rjfmjxejeiq):
    yxhdgwykzi: bool
    whtqurkphir: int
    asqvqzpfdi: int
    wpwvsglgmb: "qoljprchpbb"
    zpbguihjnf: list["qoljprchpbb"]
    khosdevozr: dict[str, "qoljprchpbb"]

    # Readability v3: structural flow; equnaohchtj.qjwmwkhrml:5136-5173
    # Explicit 37-statement structural flow below; 5 conditions, 1 loops, 27 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def qjwmwkhrml(self) -> None:
        self.bgapckspryo = True
        self.olpwrxblfq(lebqfosqjk)
        self.yxhdgwykzi = False
        self.asqvqzpfdi = 0
        self.zprorivbkld = 0
        self.ungqgmugwuk = 0
        self.qxjawxfuluj: list["qoljprchpbb"] = []
        self.zvcnglshzcx = False
        yxelopsjjpb = nfpetofmbpr(kciatvszkc[f"grid{self.whtqurkphir}"], lebqfosqjk, name=f"level{self.whtqurkphir}")
        self.add(yxelopsjjpb)
        self.hncnfaqaddg = yxelopsjjpb
        self.hmoyqxzzxl(yxelopsjjpb)
        self.hncnfaqaddg.cdpcbbnfdp = (5, 5)
        self.wpwvsglgmb = qoljprchpbb(klxajkxujf="csrvckunbev")
        zpbguihjnf: list[qoljprchpbb] = []
        for i in range(4):
            zpbguihjnf.append(qoljprchpbb(klxajkxujf="lgbyiaitpdi", name="lgbyiaitpdi"))
        self.zpbguihjnf = zpbguihjnf
        self.dlfslfoamdu = 0
        if self.whtqurkphir == 1:
            self.hncnfaqaddg.cdpcbbnfdp = (10, 5)
        elif self.whtqurkphir == 2:
            self.hncnfaqaddg.cdpcbbnfdp = (6, 8)
        elif self.whtqurkphir == 3:
            self.hncnfaqaddg.cdpcbbnfdp = (5, 5)
        elif self.whtqurkphir == 10:
            self.hncnfaqaddg.cdpcbbnfdp = (5, 3)
        self.khosdevozr = {}
        kgjynspwva = qoljprchpbb(klxajkxujf="fozwvlovdui_igcydyfanuk")
        self.khosdevozr["fozwvlovdui"] = kgjynspwva
        kgjynspwva = qoljprchpbb(klxajkxujf="fozwvlovdui_red_igcydyfanuk")
        self.khosdevozr["fozwvlovdui_red"] = kgjynspwva
        kgjynspwva = qoljprchpbb(klxajkxujf="fozwvlovdui_blue_igcydyfanuk")
        self.khosdevozr["fozwvlovdui_blue"] = kgjynspwva
        self.lzoqlpcwzpu = 0
        if self.whtqurkphir >= 8:
            self.lzoqlpcwzpu = len(self.hncnfaqaddg.ndtvadsrqf("fozwvlovdui_blue"))

    # Readability v3: structural flow; equnaohchtj.hmoyqxzzxl:5175-5223
    # Explicit 24-statement structural flow below; 3 conditions, 3 loops, 15 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hmoyqxzzxl(self, grid: nfpetofmbpr) -> None:
        mxptcecbzj = grid.ukeadpfggp(["hupkpseyuim", "hupkpseyuim2"])
        for yenewhacmf, jqpwstrpkr in mxptcecbzj.items():
            if yenewhacmf == "hupkpseyuim":
                flawipvyqz = pnzuyeevuo(jqpwstrpkr)
            else:
                flawipvyqz = [(x, y, x, y) for x, y in jqpwstrpkr]
            for ckrahuwyhg, saffxbrqzy, eqkshkbdgua, aauuzgmpxyj in flawipvyqz:
                soxhqoswel = grid.ijpoqzvnjt(ckrahuwyhg, saffxbrqzy)
                ckrahuwyhg, saffxbrqzy, eqkshkbdgua, aauuzgmpxyj = (
                    ckrahuwyhg,
                    saffxbrqzy,
                    eqkshkbdgua + 1,
                    aauuzgmpxyj + 1,
                )
                ckrahuwyhg, saffxbrqzy, eqkshkbdgua, aauuzgmpxyj = (
                    ckrahuwyhg * 6,
                    saffxbrqzy * 6,
                    eqkshkbdgua * 6,
                    aauuzgmpxyj * 6,
                )
                ckrahuwyhg, saffxbrqzy, eqkshkbdgua, aauuzgmpxyj = (
                    ckrahuwyhg,
                    saffxbrqzy,
                    eqkshkbdgua + 2,
                    aauuzgmpxyj + 2,
                )
                vyzabubbrm = None
                for reiiyswsxj in soxhqoswel:
                    if reiiyswsxj.name == yenewhacmf:
                        vyzabubbrm = reiiyswsxj
                if vyzabubbrm is None:
                    continue
                pyknulcwqk = xpsmcpstdr(hiaiflnslto=eqkshkbdgua - ckrahuwyhg, jlkfqcwrspr=aauuzgmpxyj - saffxbrqzy, jvpmuyciku=BLACK)
                wfjffncuge = qoljprchpbb(
                    klxajkxujf=pyknulcwqk,
                    x=ckrahuwyhg - vyzabubbrm.cdpcbbnfdp[0] - 1,
                    y=saffxbrqzy - vyzabubbrm.cdpcbbnfdp[1] - 1,
                )
                wfjffncuge.layer = -2
                vyzabubbrm.oyzpaylqco(wfjffncuge)
                pyknulcwqk = xpsmcpstdr(hiaiflnslto=eqkshkbdgua - ckrahuwyhg, jlkfqcwrspr=aauuzgmpxyj - saffxbrqzy, jvpmuyciku=BLUE)
                wfjffncuge = qoljprchpbb(
                    klxajkxujf=pyknulcwqk,
                    x=ckrahuwyhg - vyzabubbrm.cdpcbbnfdp[0],
                    y=saffxbrqzy - vyzabubbrm.cdpcbbnfdp[1],
                )
                wfjffncuge.layer = -3
                vyzabubbrm.oyzpaylqco(wfjffncuge)

    # Readability v3: structural flow; equnaohchtj.sgxkqallyv:5225-5274
    # Explicit 18-statement structural flow below; 4 conditions, 0 loops, 4 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def sgxkqallyv(self) -> None:
        if self.whtqurkphir != 1:
            return
        if self.zvcnglshzcx:
            kyierqikcf = qoljprchpbb(klxajkxujf="bhdfjlqapap_0", x=3, y=52)
            self.add(kyierqikcf)
            kyierqikcf.yzcafrbdni(
                aotzmhqympw.mgbnagauna(
                    [
                        aotzmhqympw.kootrxrwgk(
                            ["bhdfjlqapap_0", "bhdfjlqapap_1", "bhdfjlqapap_0", "bhdfjlqapap_1", "bhdfjlqapap_0"],
                            laguhngehw=3,
                        ),
                        aotzmhqympw.remove(),
                    ]
                )
            )
            return
        if len(self.hncnfaqaddg.whdmasyorl("fozwvlovdui")) == 5:
            nmoulllksy = self.wpwvsglgmb.qoifrofmiu
            if nmoulllksy is None or nmoulllksy.cdpcbbnfdp != (6, 12):
                kyierqikcf = qoljprchpbb(klxajkxujf="bhdfjlqapap_0", x=15, y=16)
                self.add(kyierqikcf)
                kyierqikcf.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.kootrxrwgk(
                                ["bhdfjlqapap_0", "bhdfjlqapap_1", "bhdfjlqapap_0", "bhdfjlqapap_1", "bhdfjlqapap_0"],
                                laguhngehw=3,
                            ),
                            aotzmhqympw.remove(),
                        ]
                    )
                )
            else:
                kyierqikcf = qoljprchpbb(klxajkxujf="bhdfjlqapap_0", x=15 + 6 + 6, y=16)
                self.add(kyierqikcf)
                kyierqikcf.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.kootrxrwgk(
                                ["bhdfjlqapap_0", "bhdfjlqapap_1", "bhdfjlqapap_0", "bhdfjlqapap_1", "bhdfjlqapap_0"],
                                laguhngehw=3,
                            ),
                            aotzmhqympw.remove(),
                        ]
                    )
                )
            return
        self.nymurcqqjv()

    # Readability v3: structural flow; equnaohchtj.tmhxwcojkh:5276-5325
    # Explicit 40-statement structural flow below; 15 conditions, 2 loops, 17 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def tmhxwcojkh(self, dx: int, dy: int) -> None:
        self.asqvqzpfdi += 1
        alnrxbigbf = self.hncnfaqaddg.whdmasyorl("hupkpseyuim2")
        if dx != 0:
            alnrxbigbf = sorted(alnrxbigbf, key=lambda x: x.grid_x, reverse=dx > 0)
        else:
            alnrxbigbf = sorted(alnrxbigbf, key=lambda x: x.grid_y, reverse=dy > 0)
        qifbpmbolw = False
        for ntqyjjmqud in alnrxbigbf:
            wfsqzmhelp = False
            sfqjjdmblv = [i.name for i in self.hncnfaqaddg.ijpoqzvnjt(ntqyjjmqud.grid_x + dx, ntqyjjmqud.grid_y + dy)]
            if "hupkpseyuim2" in sfqjjdmblv:
                pass
            elif any(("kraubslpehi" in wfjffncuge for wfjffncuge in sfqjjdmblv)):
                wfsqzmhelp = True
            nybfuxmyrv = (0, 0)
            if wfsqzmhelp:
                self.nymurcqqjv()
                for i in self.hncnfaqaddg.ijpoqzvnjt(ntqyjjmqud.grid_x, ntqyjjmqud.grid_y):
                    if "kraubslpehi" not in i.name:
                        if "fozwvlovdui" == i.name:
                            if self.whtqurkphir <= 2:
                                pass
                            elif self.whtqurkphir == 3:
                                nybfuxmyrv = (-dx * 8, 0)
                            elif self.whtqurkphir == 4 and i.grid_y >= 11:
                                nybfuxmyrv = (0, 0)
                            elif self.whtqurkphir == 5:
                                nybfuxmyrv = (-dx * 6, 0)
                            elif self.whtqurkphir == 6:
                                nybfuxmyrv = (-dx * 6, 0)
                            elif self.whtqurkphir == 7 or self.whtqurkphir == 10:
                                nybfuxmyrv = (0, 0)
                            elif self.whtqurkphir == 8:
                                nybfuxmyrv = (0, -dy * 6)
                            else:
                                nybfuxmyrv = (-dx * 6, -dy * 6)
                        i.xxlsofmxas(dx, dy, True, True)
            if nybfuxmyrv != (0, 0) and (not qifbpmbolw):
                qifbpmbolw = True
                if self.whtqurkphir != 5 and self.hncnfaqaddg.cdpcbbnfdp[0] >= 5 and (nybfuxmyrv[0] > 0):
                    return
                self.hncnfaqaddg.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.eaactxpeky(2),
                            aotzmhqympw.zgfcidphbz(nybfuxmyrv, wslpmugjcyi=5, cipiqgzehl="ornhtmdrzbg"),
                        ]
                    )
                )

    # Readability v3: structural flow; equnaohchtj.kuexigxyxw:5327-5329
    # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def kuexigxyxw(self) -> None:
        self.pchvqimdvj()
        pass

    # Readability v3: update_binding; equnaohchtj.jhvtnnisdk:5331-5332
    # Perform self.yxhdgwykzi = True; argument/attribute spellings are preserved. [structural-contract]
    def jhvtnnisdk(self) -> None:
        self.yxhdgwykzi = True

    # Readability v3: structural flow; equnaohchtj.dghsidbuet:5334-5351
    # Explicit 17-statement structural flow below; 5 conditions, 1 loops, 3 writes and 4 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def dghsidbuet(self, x: int, y: int) -> None:
        self.asqvqzpfdi += 1
        zonvfmmtiz = self.rozmjeilxc(x, y)
        for wjijkpdxjj in zonvfmmtiz[::-1]:
            if "fozwvlovdui" in wjijkpdxjj.name:
                if isinstance(wjijkpdxjj, olmxmdlyhf):
                    self.xpcuvjyrgu(wjijkpdxjj)
                return
            elif "lgbyiaitpdi" in wjijkpdxjj.name:
                self.cfilhtifcb(wjijkpdxjj)
                return
            elif "cwyrzsciwms" in wjijkpdxjj.name:
                self.zvcnglshzcx = True
                return
        if self.whtqurkphir == 1:
            self.sgxkqallyv()
            return
        self.nymurcqqjv()

    # Readability v3: structural flow; equnaohchtj.xpcuvjyrgu:5353-5367
    # Explicit 13-statement structural flow below; 2 conditions, 1 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def xpcuvjyrgu(self, uywtlohliu: olmxmdlyhf) -> None:
        self.wpwvsglgmb.qwlkaghtqu()
        cwwpwqoyce = 0
        for lgbyiaitpdi, temwcgmexo in zip(self.zpbguihjnf, vjafsffahp):
            dx, dy = temwcgmexo
            lgbyiaitpdi.qwlkaghtqu()
            if self.qikmikecdf(uywtlohliu.chahdtpdoz, temwcgmexo):
                uywtlohliu.oyzpaylqco(lgbyiaitpdi)
                lgbyiaitpdi.cdpcbbnfdp = (dx * 2 * 6, dy * 2 * 6)
                lgbyiaitpdi.yzcafrbdni(aotzmhqympw.kootrxrwgk(["lgbyiaitpdi_0", "lgbyiaitpdi"]))
                cwwpwqoyce += 1
        if cwwpwqoyce != 0:
            uywtlohliu.oyzpaylqco(self.wpwvsglgmb)
        else:
            self.ebslbrugfo(uywtlohliu)

    # Readability v3: structural flow; equnaohchtj.nymurcqqjv:5369-5372
    # Explicit 3-statement structural flow below; 0 conditions, 1 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def nymurcqqjv(self) -> None:
        self.wpwvsglgmb.qwlkaghtqu()
        for lgbyiaitpdi in self.zpbguihjnf:
            lgbyiaitpdi.qwlkaghtqu()

    # Readability v3: structural flow; equnaohchtj.cfilhtifcb:5374-5590
    # Explicit 78-statement structural flow below; 33 conditions, 1 loops, 12 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def cfilhtifcb(self, lgbyiaitpdi: qoljprchpbb) -> None:
        ddaguepwkt = len(self.hncnfaqaddg.ndtvadsrqf("fozwvlovdui"))
        if self.whtqurkphir >= 8:
            ddaguepwkt -= self.lzoqlpcwzpu
        uywtlohliu = self.wpwvsglgmb.qoifrofmiu
        if uywtlohliu is None:
            return
        assert isinstance(uywtlohliu, olmxmdlyhf)
        rexnbjzcle = uywtlohliu.chahdtpdoz
        fldpqdkmge = (
            rexnbjzcle[0] + lgbyiaitpdi.cdpcbbnfdp[0] // 6,
            rexnbjzcle[1] + lgbyiaitpdi.cdpcbbnfdp[1] // 6,
        )
        zuetfdzzjb = (
            (rexnbjzcle[0] + fldpqdkmge[0]) // 2,
            (rexnbjzcle[1] + fldpqdkmge[1]) // 2,
        )
        qcerbdpdcl: olmxmdlyhf | None = None
        for nbkhciimbw in self.hncnfaqaddg.ijpoqzvnjt(zuetfdzzjb[0], zuetfdzzjb[1]):
            if "fozwvlovdui" in nbkhciimbw.name and "blue" not in nbkhciimbw.name:
                qcerbdpdcl = nbkhciimbw
                break
        if qcerbdpdcl is not None and qcerbdpdcl.name == uywtlohliu.name:
            ddaguepwkt -= 1

            # Readability v3: structural flow; equnaohchtj.cfilhtifcb.vtocktojwl:5399-5400
            # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
            def vtocktojwl() -> None:
                self.hncnfaqaddg.faretcdgmc(qcerbdpdcl)

            qcerbdpdcl.yzcafrbdni(
                aotzmhqympw.mgbnagauna(
                    [
                        aotzmhqympw.eaactxpeky(2),
                        aotzmhqympw.pghxtumzbu((0, 0), wslpmugjcyi=4),
                        aotzmhqympw.hllqvjnslz(vtocktojwl),
                    ]
                )
            )
        uywtlohliu.dpdfdmsnjo(
            fldpqdkmge[0],
            fldpqdkmge[1],
            True,
            True,
            oaapizadlv=10,
            gjifuhvheo="qvetfebnovs",
        )
        self.nymurcqqjv()
        if self.whtqurkphir == 1:
            if fldpqdkmge in [(0, 2), (2, 2), (5, 1)]:
                self.pchvqimdvj()
        elif self.whtqurkphir == 2:
            if fldpqdkmge in [(0, 1), (2, 1), (4, 1)]:
                self.pchvqimdvj()
        elif self.whtqurkphir == 3:
            if fldpqdkmge in [(1, 0), (0, 3), (10, 0), (13, 2), (13, 4)]:
                self.pchvqimdvj()
            elif fldpqdkmge == (10, 2) and ddaguepwkt <= 5:
                self.pchvqimdvj()
            elif fldpqdkmge == (10, 4) and ddaguepwkt <= 4:
                self.pchvqimdvj()
        elif self.whtqurkphir == 4:
            if fldpqdkmge == (7, 3):
                self.hncnfaqaddg.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.eaactxpeky(7),
                            aotzmhqympw.zgfcidphbz((-30, 0), wslpmugjcyi=10, cipiqgzehl="qvetfebnovs"),
                        ]
                    )
                )
            elif fldpqdkmge == (12, 7):
                self.hncnfaqaddg.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.eaactxpeky(7),
                            aotzmhqympw.zgfcidphbz((15, -30), wslpmugjcyi=10, cipiqgzehl="qvetfebnovs"),
                        ]
                    )
                )
        elif self.whtqurkphir == 5:
            if fldpqdkmge == (7, 3):
                self.hncnfaqaddg.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.eaactxpeky(7),
                            aotzmhqympw.zgfcidphbz((-18, 0), wslpmugjcyi=10, cipiqgzehl="qvetfebnovs"),
                        ]
                    )
                )
            elif fldpqdkmge == (12, 3):
                self.hncnfaqaddg.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.eaactxpeky(7),
                            aotzmhqympw.zgfcidphbz((-33, 0), wslpmugjcyi=10, cipiqgzehl="qvetfebnovs"),
                        ]
                    )
                )
        elif self.whtqurkphir == 6:
            if fldpqdkmge == (16, 2) and uywtlohliu.name == "fozwvlovdui":
                if self.hncnfaqaddg.whdmasyorl("fozwvlovdui_red")[0].chahdtpdoz == (6, 6):
                    self.pchvqimdvj()
            elif fldpqdkmge == (7, 6) and self.hncnfaqaddg.cdpcbbnfdp == (5, 5):
                self.hncnfaqaddg.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.eaactxpeky(7),
                            aotzmhqympw.zgfcidphbz((-20, 0), wslpmugjcyi=10, cipiqgzehl="qvetfebnovs"),
                        ]
                    )
                )
            elif uywtlohliu.name == "fozwvlovdui" and fldpqdkmge == (18, 2) and (self.hncnfaqaddg.cdpcbbnfdp == (-57, 5)):
                self.hncnfaqaddg.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.eaactxpeky(7),
                            aotzmhqympw.zgfcidphbz((-44, 0), wslpmugjcyi=10, cipiqgzehl="qvetfebnovs"),
                        ]
                    )
                )
        elif self.whtqurkphir == 7:
            if fldpqdkmge == (8, 8) and self.hncnfaqaddg.cdpcbbnfdp == (5, 5):
                self.hncnfaqaddg.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.eaactxpeky(7),
                            aotzmhqympw.zgfcidphbz((-44, 0), wslpmugjcyi=10, cipiqgzehl="qvetfebnovs"),
                        ]
                    )
                )
            elif fldpqdkmge[0] == 16 and self.hncnfaqaddg.cdpcbbnfdp == (-39, 5):
                self.hncnfaqaddg.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.eaactxpeky(7),
                            aotzmhqympw.zgfcidphbz((-40, 0), wslpmugjcyi=10, cipiqgzehl="qvetfebnovs"),
                        ]
                    )
                )
        elif self.whtqurkphir == 9:
            if fldpqdkmge == (6, 5):
                self.hncnfaqaddg.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.eaactxpeky(7),
                            aotzmhqympw.zgfcidphbz((-20, 0), wslpmugjcyi=10, cipiqgzehl="qvetfebnovs"),
                        ]
                    )
                )
        zswzwfaswq: float = 1.4
        if fldpqdkmge[1] == rexnbjzcle[1]:
            uywtlohliu.yzcafrbdni(
                aotzmhqympw.mgbnagauna(
                    [
                        aotzmhqympw.zgfcidphbz((0, -3), wslpmugjcyi=5, cipiqgzehl="qvetfebnovs"),
                        aotzmhqympw.zgfcidphbz((0, 3), wslpmugjcyi=5, cipiqgzehl="ornhtmdrzbg"),
                    ]
                )
            )
            zswzwfaswq = 1.0
        if qcerbdpdcl is not None and qcerbdpdcl.name != uywtlohliu.name and ("fozwvlovdui" in qcerbdpdcl.name):
            kgjynspwva = self.khosdevozr[uywtlohliu.name]
            kgjynspwva.set_position(
                uywtlohliu.cdpcbbnfdp[0] + self.hncnfaqaddg.cdpcbbnfdp[0],
                uywtlohliu.cdpcbbnfdp[1] + self.hncnfaqaddg.cdpcbbnfdp[1],
            )
            self.add(kgjynspwva)

            # Readability v3: structural flow; equnaohchtj.cfilhtifcb.jdwnauvwqe:5541-5542
            # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
            def jdwnauvwqe() -> None:
                uywtlohliu.kjcgxeembe(kgjynspwva)

            kgjynspwva.yzcafrbdni(aotzmhqympw.mgbnagauna([aotzmhqympw.eaactxpeky(9), aotzmhqympw.remove()]))
            if fldpqdkmge[1] == rexnbjzcle[1]:
                kgjynspwva.yzcafrbdni(
                    aotzmhqympw.mgbnagauna(
                        [
                            aotzmhqympw.zgfcidphbz((0, -3), wslpmugjcyi=5, cipiqgzehl="qvetfebnovs"),
                            aotzmhqympw.zgfcidphbz((0, 3), wslpmugjcyi=5, cipiqgzehl="ornhtmdrzbg"),
                        ]
                    )
                )
            kgjynspwva.yzcafrbdni(
                aotzmhqympw.mgbnagauna(
                    [
                        aotzmhqympw.pghxtumzbu((zswzwfaswq, zswzwfaswq), wslpmugjcyi=7, cipiqgzehl="qvetfebnovs"),
                        aotzmhqympw.pghxtumzbu((1, 1), wslpmugjcyi=3),
                    ]
                )
            )
            kgjynspwva.yzcafrbdni(
                aotzmhqympw.swnkxhbsrg(
                    (
                        fldpqdkmge[0] * 6 + self.hncnfaqaddg.cdpcbbnfdp[0],
                        fldpqdkmge[1] * 6 + self.hncnfaqaddg.cdpcbbnfdp[1],
                    ),
                    wslpmugjcyi=10,
                    cipiqgzehl="qvetfebnovs",
                )
            )
        if ddaguepwkt == 1 or (self.whtqurkphir in [6, 7] and ddaguepwkt == 2):
            uywtlohliu.yzcafrbdni(
                aotzmhqympw.mgbnagauna(
                    [
                        aotzmhqympw.pghxtumzbu((zswzwfaswq, zswzwfaswq), wslpmugjcyi=7, cipiqgzehl="qvetfebnovs"),
                        aotzmhqympw.pghxtumzbu((1, 1), wslpmugjcyi=3),
                    ]
                )
            )
            self.tdcblgbfxw(uywtlohliu)
        else:
            uywtlohliu.yzcafrbdni(
                aotzmhqympw.mgbnagauna(
                    [
                        aotzmhqympw.pghxtumzbu((zswzwfaswq, zswzwfaswq), wslpmugjcyi=7, cipiqgzehl="qvetfebnovs"),
                        aotzmhqympw.pghxtumzbu((1, 1), wslpmugjcyi=3),
                    ]
                )
            )

    # Readability v3: structural flow; equnaohchtj.hpczpnjdjq:5592-5605
    # Explicit 3-statement structural flow below; 0 conditions, 1 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def hpczpnjdjq(self) -> None:
        rxeeoxblgz = self.hncnfaqaddg.ndtvadsrqf("fozwvlovdui")
        for uywtlohliu in rxeeoxblgz:
            uywtlohliu.yzcafrbdni(
                aotzmhqympw.mgbnagauna(
                    [
                        aotzmhqympw.eaactxpeky(10),
                        aotzmhqympw.zgfcidphbz((0, -6), wslpmugjcyi=5, cipiqgzehl="ornhtmdrzbg"),
                        aotzmhqympw.zgfcidphbz((0, 6), wslpmugjcyi=5, cipiqgzehl="qvetfebnovs"),
                        aotzmhqympw.zgfcidphbz((0, -4), wslpmugjcyi=3, cipiqgzehl="ornhtmdrzbg"),
                        aotzmhqympw.zgfcidphbz((0, 4), wslpmugjcyi=3, cipiqgzehl="qvetfebnovs"),
                    ]
                )
            )

    # Readability v3: structural flow; equnaohchtj.pchvqimdvj:5607-5628
    # Explicit 5-statement structural flow below; 0 conditions, 1 loops, 1 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def pchvqimdvj(self) -> None:
        rxeeoxblgz = self.hncnfaqaddg.ndtvadsrqf("fozwvlovdui")
        for uywtlohliu in rxeeoxblgz:

            # Readability v3: structural flow; equnaohchtj.pchvqimdvj.lrmrikljhn:5611-5615
            # Explicit 2-statement structural flow below; 0 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
            def lrmrikljhn(idtkimnsuo: olmxmdlyhf) -> Callable[[], None]:
                # Readability v3: structural flow; equnaohchtj.pchvqimdvj.lrmrikljhn.action:5612-5613
                # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
                def action() -> None:
                    idtkimnsuo.set_offset_image((0, 0), "jotnhmftwdg_fozwvlovdui")

                return action

            uywtlohliu.yzcafrbdni(
                aotzmhqympw.mgbnagauna(
                    [
                        aotzmhqympw.eaactxpeky(15),
                        aotzmhqympw.hllqvjnslz(lrmrikljhn(uywtlohliu)),
                        aotzmhqympw.zgfcidphbz((2, 0), wslpmugjcyi=1),
                        aotzmhqympw.zgfcidphbz((-3, 0), wslpmugjcyi=2),
                        aotzmhqympw.zgfcidphbz((1, 0), wslpmugjcyi=1),
                    ]
                )
            )
        self.cncmupctrp()

    # Readability v3: structural flow; equnaohchtj.cncmupctrp:5630-5642
    # Explicit 5-statement structural flow below; 0 conditions, 0 loops, 2 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def cncmupctrp(self) -> None:
        self.zvcnglshzcx = True
        cwyrzsciwms = qoljprchpbb(klxajkxujf="cwyrzsciwms", x=2, y=65)
        self.add(cwyrzsciwms)
        cwyrzsciwms.yzcafrbdni(
            aotzmhqympw.mgbnagauna(
                [
                    aotzmhqympw.eaactxpeky(20),
                    aotzmhqympw.zgfcidphbz((0, -14), wslpmugjcyi=7, cipiqgzehl="pysnmvgjihb"),
                ]
            )
        )
        pass

    # Readability v3: structural flow; equnaohchtj.tdcblgbfxw:5644-5647
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 0 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def tdcblgbfxw(self, eqnskrtnuf: olmxmdlyhf, fzqnqvkpqp: bool = False) -> None:
        self.hpczpnjdjq()
        self.win()
        return

    # Readability v3: can_jump_over_to_landing; equnaohchtj.qikmikecdf:5649-5658
    # Middle occupant and valid two-cell landing, lines 5649-5658 [previous-source-reviewed]
    def qikmikecdf(self, umxyucwnju: tuple[int, int], yvasnbnhaq: tuple[int, int]) -> bool:
        upfdcxzvhg: tuple[int, int] = (
            umxyucwnju[0] + yvasnbnhaq[0],
            umxyucwnju[1] + yvasnbnhaq[1],
        )
        xgegxwzurb: tuple[int, int] = (
            upfdcxzvhg[0] + yvasnbnhaq[0],
            upfdcxzvhg[1] + yvasnbnhaq[1],
        )
        return self.pymqmlkgzs(upfdcxzvhg) and self.posalhhmjq(xgegxwzurb)

    # Readability v3: structural flow; equnaohchtj.pymqmlkgzs:5660-5664
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 3 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def pymqmlkgzs(self, cdpcbbnfdp: tuple[int, int]) -> bool:
        x, y = cdpcbbnfdp
        imzxsgdhpb = [i.name for i in self.hncnfaqaddg.ijpoqzvnjt(x, y)]
        iylxtpbkcv = any((keyword in name for name in imzxsgdhpb for keyword in ("fozwvlovdui", "dgxfozncuiz")))
        return iylxtpbkcv

    # Readability v3: structural flow; equnaohchtj.posalhhmjq:5666-5669
    # Explicit 3-statement structural flow below; 0 conditions, 0 loops, 2 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def posalhhmjq(self, cdpcbbnfdp: tuple[int, int]) -> bool:
        x, y = cdpcbbnfdp
        imzxsgdhpb = [i.name for i in self.hncnfaqaddg.ijpoqzvnjt(x, y)]
        return len(imzxsgdhpb) == 1 and "hupkpseyuim" in imzxsgdhpb[0] or (len(imzxsgdhpb) == 2 and "hupkpseyuim2" in imzxsgdhpb)

    # Readability v3: structural flow; equnaohchtj.ebslbrugfo:5671-5680
    # Explicit 1-statement structural flow below; 0 conditions, 0 loops, 0 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def ebslbrugfo(self, uywtlohliu: qoljprchpbb | olmxmdlyhf) -> None:
        uywtlohliu.yzcafrbdni(
            aotzmhqympw.mgbnagauna(
                [
                    aotzmhqympw.zgfcidphbz((1, 0)),
                    aotzmhqympw.zgfcidphbz((-2, 0)),
                    aotzmhqympw.zgfcidphbz((1, 0)),
                ]
            )
        )


# Readability v3: structural flow; bcvezkazgy:5683-5695
# Explicit 12-statement structural flow below; 2 conditions, 0 loops, 7 writes and 3 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def bcvezkazgy(arr: np.ndarray, jvuweuzgbt: int) -> np.ndarray:
    wfjffncuge: int = 5
    ymxmkqdhvb: list[int] = [0, 1, 2, 3, 4, 5, 5, 0, 1, 2, 3, 4, 5]
    itavsxnbmz = 64 * wfjffncuge
    jvuweuzgbt = max(0, min(itavsxnbmz, jvuweuzgbt))
    if jvuweuzgbt >= itavsxnbmz:
        return arr
    elif jvuweuzgbt >= 64 * 4:
        arr[0, jvuweuzgbt % 64 :] = ymxmkqdhvb[-2]
        return arr
    arr[0, :] = ymxmkqdhvb[jvuweuzgbt // 64]
    arr[0, : jvuweuzgbt % 64] = ymxmkqdhvb[jvuweuzgbt // 64 + 1]
    return arr


# Readability v3: structural flow; vjhacvjubl:5698-5713
# Explicit 10-statement structural flow below; 1 conditions, 1 loops, 7 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
def vjhacvjubl(
    size: Tuple[int, int] = (64, 64),
    supjpskmos: int = 5,
    rrchhtjoth: int = -1,
    wslpmugjcyi: int = 10,
) -> Iterator[np.ndarray]:
    arr = np.full(size, rrchhtjoth, dtype=np.int8)
    itavsxnbmz = np.prod(size)
    yblyshiyho = np.arange(itavsxnbmz)
    np.random.shuffle(yblyshiyho)
    nlasoaihty = itavsxnbmz // wslpmugjcyi
    for step in range(wslpmugjcyi):
        ktwtkhqvml = step * nlasoaihty
        phqwrhfzue = itavsxnbmz if step == wslpmugjcyi - 1 else (step + 1) * nlasoaihty
        arr.ravel()[yblyshiyho[ktwtkhqvml:phqwrhfzue]] = supjpskmos
        yield arr.copy()


class wnrtmoelug(RenderableUserDisplay):
    # Readability v3: structural flow; wnrtmoelug.__init__:5717-5721
    # Explicit 4-statement structural flow below; 0 conditions, 0 loops, 4 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self, oegtnpbqims: "equnaohchtj", cisfibgucg: "Lf52"):
        self.oegtnpbqims = oegtnpbqims
        self.cisfibgucg = cisfibgucg
        self.frames_to_render: list[np.ndarray] = []
        self.special_frames_to_render: list[np.ndarray] = []

    # Readability v3: structural flow; wnrtmoelug.render_interface:5723-5731
    # Explicit 8-statement structural flow below; 2 conditions, 0 loops, 4 writes and 2 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def render_interface(self, frame: np.ndarray) -> np.ndarray:
        if len(self.special_frames_to_render) != 0:
            self.frames_to_render = self.special_frames_to_render + self.frames_to_render
            self.special_frames_to_render = []
        if len(self.frames_to_render) == 0:
            arr = self.oegtnpbqims.vclswpkbjs()
            return bcvezkazgy(arr, self.cisfibgucg.apiwkxksucg)
        arr = self.frames_to_render.pop(0)
        return bcvezkazgy(arr, self.cisfibgucg.apiwkxksucg)


class Lf52(ARCBaseGame):
    # Readability v3: structural flow; Lf52.__init__:5735-5757
    # Explicit 13-statement structural flow below; 1 conditions, 0 loops, 10 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def __init__(self) -> None:
        self.ikhhdzfmarl = equnaohchtj()
        self.ikhhdzfmarl.whtqurkphir = 1
        self.ikhhdzfmarl.qjwmwkhrml()
        self.ikhhdzfmarl.vpanmnowjy()
        self.yrhkoqwmazp = False
        self.xcjqviblhlt = False
        self.apiwkxksucg = 0
        self.btiyglcumku = wnrtmoelug(self.ikhhdzfmarl, self)
        self.foztuzaztfm = [i != -1 for i in vjhacvjubl()]
        self.available_actions: List[int] = [1, 2, 3, 4, 6] + ([7] if STORES_UNDO else [])
        zgznuunusrr = Camera(
            background=BACKGROUND_COLOR,
            letter_box=lgbyiaitpdiDING_COLOR,
            interfaces=[self.btiyglcumku],
        )
        game_id = self.__class__.__name__.lower()
        super().__init__(
            game_id=game_id,
            levels=levels,
            camera=zgznuunusrr,
            available_actions=self.available_actions,
        )

    # Readability v3: structural flow; Lf52.step:5759-5791
    # Explicit 31-statement structural flow below; 9 conditions, 0 loops, 4 writes and 6 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def step(self) -> None:
        if self.xcjqviblhlt:
            if len(self.btiyglcumku.frames_to_render) <= 1:
                self.xcjqviblhlt = False
                if self.ikhhdzfmarl.iajuzrgttrv:
                    self.next_level()
                    self.complete_action()
                    return
                elif self.ikhhdzfmarl.evxflhofing:
                    self.lose()
                    self.complete_action()
                    return
                elif self.ikhhdzfmarl.whtqurkphir == 1 and self.ikhhdzfmarl.asqvqzpfdi >= 64:
                    self.lose()
                    self.complete_action()
                    return
                elif self.ikhhdzfmarl.whtqurkphir >= 6 and self.ikhhdzfmarl.asqvqzpfdi >= 64 * 10:
                    self.lose()
                    self.complete_action()
                    return
                elif self.ikhhdzfmarl.whtqurkphir < 6 and self.ikhhdzfmarl.asqvqzpfdi >= 64 * 5:
                    self.lose()
                    self.complete_action()
                    return
                if self.ikhhdzfmarl.yxhdgwykzi:
                    return
                self.complete_action()
        else:
            self.xcjqviblhlt = True
            self.jxyktkxwle()
            if self.yrhkoqwmazp:
                self.btiyglcumku.frames_to_render = self.ikhhdzfmarl.render()
            self.yrhkoqwmazp = False

    # Readability v3: update_binding; Lf52.stturekyxu:5793-5794
    # Perform self.btiyglcumku.frames_to_render = wslpmugjcyi; argument/attribute spellings are preserved. [structural-contract]
    def stturekyxu(self, wslpmugjcyi: list[np.ndarray]) -> None:
        self.btiyglcumku.frames_to_render = wslpmugjcyi

    # Readability v3: update_binding; Lf52.aqxalxbnig:5796-5797
    # Perform self.btiyglcumku.special_frames_to_render = wslpmugjcyi; argument/attribute spellings are preserved. [structural-contract]
    def aqxalxbnig(self, wslpmugjcyi: list[np.ndarray]) -> None:
        self.btiyglcumku.special_frames_to_render = wslpmugjcyi

    # Readability v3: structural flow; Lf52.jxyktkxwle:5799-5862
    # Explicit 54-statement structural flow below; 2 conditions, 2 loops, 28 writes and 1 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def jxyktkxwle(self) -> None:
        if self.ikhhdzfmarl.yxhdgwykzi:
            self.ikhhdzfmarl.aphzlzlgni()
            self.tcsfuefuuy = self.ikhhdzfmarl.aphzlzlgni()
            self.yrhkoqwmazp = False
            self.ikhhdzfmarl.yxhdgwykzi = False
            self.ikhhdzfmarl.asqvqzpfdi += 20
            self.stturekyxu(self.tcsfuefuuy)
            return
        self.yrhkoqwmazp = True
        dmzyzawoubn = self.action.id
        match dmzyzawoubn:
            case GameAction.ACTION1:
                self.apiwkxksucg += 1
                self.ikhhdzfmarl.aeiiavosms()
                self.ikhhdzfmarl.tmhxwcojkh(0, -1)
            case GameAction.ACTION2:
                self.apiwkxksucg += 1
                self.ikhhdzfmarl.aeiiavosms()
                self.ikhhdzfmarl.tmhxwcojkh(0, 1)
            case GameAction.ACTION3:
                self.apiwkxksucg += 1
                self.ikhhdzfmarl.aeiiavosms()
                self.ikhhdzfmarl.tmhxwcojkh(-1, 0)
            case GameAction.ACTION4:
                self.apiwkxksucg += 1
                self.ikhhdzfmarl.aeiiavosms()
                self.ikhhdzfmarl.tmhxwcojkh(1, 0)
            case GameAction.ACTION5:
                self.apiwkxksucg += 1
                self.ikhhdzfmarl.aeiiavosms()
                self.ikhhdzfmarl.kuexigxyxw()
            case GameAction.ACTION6:
                if self.ikhhdzfmarl.zvcnglshzcx and self.action.data["x"] < 16 and (self.action.data["y"] > 64 - 16):
                    self.apiwkxksucg += 1
                    self.ikhhdzfmarl.zvcnglshzcx = False
                    tcsfuefuuy = []
                    kyierqikcf = self.ikhhdzfmarl.vclswpkbjs()
                    for i in range(10):
                        sqcdwixohd = kyierqikcf.copy()
                        sqcdwixohd[self.foztuzaztfm[i]] = 5
                        tcsfuefuuy.append(sqcdwixohd)
                    self.ikhhdzfmarl.jhgacfwhoa()
                    kyierqikcf = self.ikhhdzfmarl.vclswpkbjs()
                    for i in range(10)[::-1]:
                        sqcdwixohd = kyierqikcf.copy()
                        sqcdwixohd[self.foztuzaztfm[i]] = 5
                        tcsfuefuuy.append(sqcdwixohd)
                    self.tcsfuefuuy = tcsfuefuuy
                    self.aqxalxbnig(self.tcsfuefuuy)
                else:
                    self.apiwkxksucg += 1
                    self.ikhhdzfmarl.aeiiavosms()
                    self.ikhhdzfmarl.dghsidbuet(self.action.data["x"], self.action.data["y"])
            case GameAction.ACTION7:
                self.apiwkxksucg += 1
                self.tcsfuefuuy = self.ikhhdzfmarl.aphzlzlgni()
                self.yrhkoqwmazp = False
                self.stturekyxu(self.tcsfuefuuy)
            case GameAction.RESET:
                self.tcsfuefuuy = self.ikhhdzfmarl.jhgacfwhoa()
                self.yrhkoqwmazp = False
                self.stturekyxu(self.tcsfuefuuy)
                self.apiwkxksucg = 0

    # Readability v3: structural flow; Lf52.on_set_level:5864-5872
    # Explicit 8-statement structural flow below; 1 conditions, 0 loops, 5 writes and 0 return sites. Gameplay-purpose interpretation is not independently assigned. [structural-flow]
    def on_set_level(self, level: Level) -> None:
        self.ikhhdzfmarl = equnaohchtj()
        self.ikhhdzfmarl.whtqurkphir = self._current_level_index + 1
        self.ikhhdzfmarl.qjwmwkhrml()
        if not GRAPH_BUILDER:
            self.ikhhdzfmarl.vpanmnowjy()
        self.btiyglcumku.oegtnpbqims = self.ikhhdzfmarl
        self.btiyglcumku.frames_to_render = []
        self.apiwkxksucg = 0
