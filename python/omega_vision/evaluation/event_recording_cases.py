"""Small authored scenes, not recognizer output or learned memory.

Coordinates are integer pixels on a 64x48 canvas, sampled one second apart.
The oracle names the intended event; incidental events are not forbidden.
Identity, depth, grouping and causal annotations must never be treated as
evidence extracted from the rendered images.
"""

from __future__ import annotations

from dataclasses import dataclass, replace

from omega_vision.perception.event_records import Term

SIZE = (64, 48)
BACKGROUND = (0, 0, 0)
BLUE = (0, 116, 217)
RED = (255, 65, 54)
GREEN = (46, 204, 64)
GRAY = (170, 170, 170)


def rectangle(width: int, height: int) -> tuple[str, ...]:
    return ("1" * width,) * height


def ring(width: int, height: int) -> tuple[str, ...]:
    return ("1" * width, *(("1" + "0" * (width - 2) + "1",) * (height - 2)), "1" * width)


def rotate(mask: tuple[str, ...]) -> tuple[str, ...]:
    return tuple("".join(row) for row in zip(*mask[::-1]))


@dataclass(frozen=True)
class Body:
    entity: str
    x: int
    y: int
    mask: tuple[str, ...] = rectangle(6, 6)
    color: tuple[int, int, int] = BLUE

    def at(self, x: int, y: int | None = None) -> Body:
        return replace(self, x=x, y=self.y if y is None else y)


@dataclass(frozen=True)
class Frame:
    caption: str
    bodies: tuple[Body, ...]
    annotations: tuple[Term, ...] = ()


@dataclass(frozen=True)
class Expected:
    frame: int
    term: Term


@dataclass(frozen=True)
class Case:
    name: str
    description: str
    frames: tuple[Frame, ...]
    expected: tuple[Expected, ...]
    requirements: tuple[str, ...] = ()
    assessment: str | None = None

    @property
    def entity_ids(self) -> tuple[str, ...]:
        def entities(term: Term):
            for arg in term.args:
                if isinstance(arg, Term):
                    yield from entities(arg)
                elif isinstance(arg, str):
                    yield arg

        return tuple(sorted(
            {body.entity for frame in self.frames for body in frame.bodies}
            | {entity for event in self.expected for entity in entities(event.term)}
            | {entity for frame in self.frames for term in frame.annotations for entity in entities(term)}
        ))


def _instant(name: str, description: str, frames: tuple[Frame, ...], *,
             at: int = 1, subjects: tuple[str, ...] = ("actor",),
             requirements: tuple[str, ...] = ()) -> Case:
    return Case(name, description, frames, (Expected(at, Term(name, subjects)),), requirements)


def _relation(name: str, description: str, frames: tuple[Frame, ...], *,
              subjects: tuple[str, ...] = ("actor", "other"),
              start: int = 1, continuing: int = 2, end: int = 3,
              requirements: tuple[str, ...] = ()) -> Case:
    term = Term(name, subjects)
    return Case(name, description, frames, tuple(
        Expected(frame, Term(phase, (term,)))
        for phase, frame in (("start", start), ("continue", continuing), ("end", end))
    ), requirements)


def event_cases() -> tuple[Case, ...]:
    actor = Body("actor", 12, 20)
    other = Body("other", 36, 20, color=RED)
    third = Body("third", 44, 32, color=GREEN)
    wall = Body("wall", 36, 8, rectangle(4, 32), GRAY)
    identity = ("Stable identity is an authored oracle; the tracker must establish its own correspondence.",)
    cases = [
        _instant("appeared", "An object becomes visible in the interior, not at a border.", (
            Frame("Empty interior.", ()),
            Frame("Blue object first observed well inside the viewport.", (actor,)),
            Frame("Object remains visible.", (actor,)),
        ), requirements=("No prehistory explains the appearance; do not infer creation or entry.",)),
        _instant("entered", "An object crosses the left viewport boundary.", (
            Frame("Actor outside the left boundary.", (actor.at(-8),)),
            Frame("First visible strip crosses the left edge.", (actor.at(-4),)),
            Frame("Actor becomes fully visible.", (actor.at(2),)),
            Frame("Actor continues inward.", (actor.at(8),)),
        ), requirements=("Border-crossing history is required; first visibility alone is not entry.",)),
        _instant("missing", "A previously visible interior object cannot be found.", (
            Frame("Both objects visible.", (actor, other)),
            Frame("Blue object missing; no nearby occluder or supported exit.", (other,)),
            Frame("Still missing, not evidence of destruction.", (other,)),
        ), requirements=("Missing does not imply destroyed, exited or occluded.",)),
        _instant("exited", "A moving object leaves through the right boundary.", tuple(
            Frame(caption, (actor.at(x),)) for x, caption in (
                (48, "Inside, moving right."), (54, "Approaching right edge."),
                (60, "Partly outside."), (66, "Fully outside, matching prior velocity."),
            )
        ), at=3, requirements=("Project the previous motion across the viewport boundary.",)),
        _instant("reappeared", "The same observed object returns after a brief gap.", (
            Frame("Actor visible at its reference position.", (actor, other)),
            Frame("Actor temporarily not observed.", (other,)),
            Frame("Actor reobserved with the same appearance and nearby position.", (actor, other)),
            Frame("Reidentified actor remains visible.", (actor, other)),
        ), at=2, requirements=identity + ("Reidentification must be supported, not assumed from a reused label.",)),
        _instant("moved", "One translation, with no intended shape or color change.", (
            Frame("Actor at reference position.", (actor,)),
            Frame("Actor translated four pixels right.", (actor.at(16),)),
        ), requirements=identity),
        _instant("turned", "Motion heading changes from rightward to downward.", (
            Frame("Start.", (actor,)), Frame("Move right.", (actor.at(16),)),
            Frame("Turn downward; this is a path turn, not sprite rotation.", (actor.at(16, 24),)),
            Frame("Continue downward.", (actor.at(16, 28),)),
        ), at=2, requirements=("Compare two consecutive displacement vectors at equal time intervals.",)),
        _instant("accelerated", "Rightward speed increases from two to four pixels per second.", (
            Frame("Start.", (actor,)), Frame("Two pixels in one second.", (actor.at(14),)),
            Frame("Four pixels in the next second.", (actor.at(18),)),
        ), at=2, requirements=("Use the one-second sample interval, not displacement alone.",)),
        _instant("decelerated", "Rightward speed decreases from four to two pixels per second.", (
            Frame("Start.", (actor,)), Frame("Four pixels in one second.", (actor.at(16),)),
            Frame("Two pixels in the next second.", (actor.at(18),)),
        ), at=2, requirements=("Use the one-second sample interval, not displacement alone.",)),
    ]

    elbow = ("110000", "110000", "110000", "110000", "111111", "111111")
    cross = ("001100", "001100", "111111", "111111", "001100", "001100")
    solid = replace(actor, mask=rectangle(8, 8))
    hollow = replace(solid, mask=ring(8, 8))
    cases.extend([
        _instant("rotated", "An asymmetric L rotates 90 degrees clockwise in place.", (
            Frame("Reference L.", (replace(actor, mask=elbow),)),
            Frame("L rotated clockwise; same pixel area and color.", (replace(actor, mask=rotate(elbow)),)),
        ), requirements=identity),
        _instant("scaled", "A square grows uniformly about its center.", (
            Frame("6 by 6 square.", (actor,)),
            Frame("10 by 10 square, same center and color.", (replace(actor, x=10, y=18, mask=rectangle(10, 10)),)),
        ), requirements=identity + ("Uniform scale is distinct from arbitrary area or shape change.",)),
        _instant("deformed", "A square stretches horizontally and compresses vertically.", (
            Frame("6 by 6 square, area 36.", (actor,)),
            Frame("12 by 3 rectangle, area still 36; nonuniform deformation.", (
                replace(actor, x=9, y=21, mask=rectangle(12, 3)),
            )),
        ), requirements=identity),
        _instant("shape_changed", "An equal-area L becomes a cross, not a rigid rotation.", (
            Frame("L with 20 pixels.", (replace(actor, mask=elbow),)),
            Frame("Cross with 20 pixels.", (replace(actor, mask=cross),)),
        ), requirements=identity),
        _instant("color_changed", "Only the object's color changes.", (
            Frame("Blue square.", (actor,)),
            Frame("Same square and position, now red.", (replace(actor, color=RED),)),
        ), requirements=identity),
        _instant("area_changed", "One centered boundary protrusion increases occupied area.", (
            Frame("8 by 8 square, area 64.", (solid,)),
            Frame("Two extra boundary pixels, not uniform scaling.", (
                replace(solid, mask=("111111110",) * 3 + ("111111111",) * 2 + ("111111110",) * 3),
            )),
        ), requirements=identity),
        _instant("hole_opened", "An interior empty region opens in a solid object.", (
            Frame("Solid square.", (solid,)),
            Frame("One enclosed hole; exterior bounding box unchanged.", (hollow,)),
        ), requirements=("Track the enclosing object; distinguish a hole from external background.",)),
        _instant("hole_closed", "An object's enclosed hole is filled.", (
            Frame("One enclosed hole.", (hollow,)),
            Frame("Hole filled; exterior bounding box unchanged.", (solid,)),
        ), requirements=("Track the enclosing object; count interior holes, not bounding-box size.",)),
        _instant("bounce", "A moving object contacts a wall then reverses direction.", (
            Frame("Approach wall.", (actor.at(24), wall)),
            Frame("Contact wall.", (actor.at(30), wall)),
            Frame("Reverse away from wall.", (actor.at(24), wall)),
            Frame("Continue away.", (actor.at(18), wall)),
        ), at=2, requirements=("Bounce needs post-contact velocity reversal; contact alone is insufficient.",)),
        _instant("collision", "Two approaching objects contact, then recoil.", (
            Frame("Approaching.", (actor.at(16), other.at(32))),
            Frame("Edge contact.", (actor.at(21), other.at(27))),
            Frame("Both recoil.", (actor.at(16), other.at(32))),
        ), subjects=("actor", "other"), requirements=("Contact plus motion response supports the authored collision scenario.",)),
    ])

    members = (Term("group_member", ("actor", "group")), Term("group_member", ("other", "group")))
    cases.extend([
        _instant("group_formed", "Two independent pieces form a coherent moving assembly.", (
            Frame("Independent pieces.", (actor.at(10), other.at(34))),
            Frame("Pieces join into the authored assembly.", (actor.at(20), other.at(26)), members),
            Frame("Assembly translates together.", (actor.at(24), other.at(30)), members),
        ), subjects=("group",), requirements=("Group identity/membership is annotated intent, not implied by proximity alone.",)),
        _instant("group_dissolved", "An existing assembly separates into independent pieces.", (
            Frame("Existing assembly.", (actor.at(20), other.at(26)), members),
            Frame("Pieces separate; the annotated assembly ends.", (actor.at(12), other.at(34))),
            Frame("Pieces continue independently.", (actor.at(8), other.at(38))),
        ), subjects=("group",), requirements=("A prior group must already be established.",)),
        _instant("member_added", "A third piece joins an existing two-member assembly.", (
            Frame("Existing assembly and independent third piece.", (actor.at(16), other.at(22), third), members),
            Frame("Third piece joins.", (actor.at(16), other.at(22), third.at(28, 20)),
                  members + (Term("group_member", ("third", "group")),)),
            Frame("All three move as a group.", (actor.at(20), other.at(26), third.at(32, 20)),
                  members + (Term("group_member", ("third", "group")),)),
        ), subjects=("third", "group"), requirements=("Member and group IDs must remain distinct; membership needs independent support.",)),
        _instant("member_removed", "One member leaves while a two-member assembly survives.", (
            Frame("Three-member assembly.", (actor.at(16), other.at(22), third.at(28, 20)),
                  members + (Term("group_member", ("third", "group")),)),
            Frame("Third member leaves.", (actor.at(16), other.at(22), third.at(38, 28)), members),
            Frame("Remaining pair continues together.", (actor.at(20), other.at(26), third.at(42, 32)), members),
        ), subjects=("third", "group"), requirements=("Removal is not dissolution: two members still form the group.",)),
    ])

    parent = Body("parent", 20, 20, rectangle(12, 6))
    child_a = Body("child_a", 18, 20)
    child_b = Body("child_b", 28, 20)
    cases.extend([
        _instant("split", "One connected body separates into two equal-area children.", (
            Frame("One connected body, area 72.", (parent,)),
            Frame("Two separate children, total area 72.", (child_a, child_b)),
            Frame("Children move farther apart.", (child_a.at(14), child_b.at(32))),
        ), subjects=("parent", "child_a", "child_b"),
                 requirements=("One-to-many lineage is authored ground truth, not mere lost/new matches.",)),
        _instant("merged", "Two separate bodies fuse into one connected result.", (
            Frame("Two separate sources.", (child_a, child_b)),
            Frame("One connected result, same total area.", (parent,)),
            Frame("Merged result persists.", (parent,)),
        ), subjects=("child_a", "child_b", "parent"),
                 requirements=("Many-to-one lineage is authored ground truth, not an occlusion.",)),
    ])

    cases.extend([
        _relation("move", "Movement begins, continues, then stops.", (
            Frame("At rest.", (actor,)), Frame("Starts moving.", (actor.at(16),)),
            Frame("Continues moving.", (actor.at(20),)), Frame("Stops.", (actor.at(20),)),
        ), subjects=("actor",)),
        _relation("contact", "Two bodies touch, remain touching, then separate.", (
            Frame("Gap between bodies.", (actor.at(16), other.at(28))),
            Frame("Shared boundary, no overlapping pixels.", (actor.at(22), other.at(28))),
            Frame("Contact persists.", (actor.at(22), other.at(28))),
            Frame("Separate again.", (actor.at(16), other.at(28))),
        ), requirements=("Shared boundary supports contact, not automatically attachment or collision.",)),
        _relation("attached", "Two long edges join into an assembly, hold, then detach.", (
            Frame("Two bars separated.", (
                replace(actor, x=16, y=14, mask=rectangle(4, 14)),
                replace(other, x=28, y=14, mask=rectangle(4, 14)),
            )),
            Frame("Long shared edge joins the bars.", (
                replace(actor, x=24, y=14, mask=rectangle(4, 14)),
                replace(other, x=28, y=14, mask=rectangle(4, 14)),
            )),
            Frame("Attached assembly moves rigidly.", (
                replace(actor, x=28, y=14, mask=rectangle(4, 14)),
                replace(other, x=32, y=14, mask=rectangle(4, 14)),
            )),
            Frame("Bars separate.", (
                replace(actor, x=20, y=14, mask=rectangle(4, 14)),
                replace(other, x=36, y=14, mask=rectangle(4, 14)),
            )),
        ), requirements=("Requires sealed attachment proof, disjoint members and complete same-policy extraction, not contact alone.",)),
        _relation("overlap", "Two outlined shapes geometrically overlap then separate.", (
            Frame("Two distinct outlines apart.", (
                replace(actor, x=14, y=14, mask=ring(12, 12)),
                replace(other, x=36, y=20, mask=ring(12, 12)),
            )),
            Frame("Outlines cross; both identities remain visible.", (
                replace(actor, x=28, y=14, mask=ring(12, 12)),
                replace(other, x=36, y=20, mask=ring(12, 12)),
            )),
            Frame("Overlap persists.", (
                replace(actor, x=28, y=14, mask=ring(12, 12)),
                replace(other, x=36, y=20, mask=ring(12, 12)),
            )),
            Frame("Outlines separate.", (
                replace(actor, x=14, y=14, mask=ring(12, 12)),
                replace(other, x=36, y=20, mask=ring(12, 12)),
            )),
        ), requirements=("Raster compositing hides crossing pixels; amodal overlap is oracle truth, not a detector mask.",)),
        _relation("co_move", "Separated objects move together then their velocities diverge.", (
            Frame("Separated independent objects.", (actor, other)),
            Frame("Both move four pixels right.", (actor.at(16), other.at(40))),
            Frame("Same shared displacement again.", (actor.at(20), other.at(44))),
            Frame("Blue continues, red stops.", (actor.at(24), other.at(44))),
        ), requirements=("Co-motion does not imply physical attachment or shared object identity.",)),
    ])

    occluder = Body("occluder", 24, 10, rectangle(8, 28), GRAY)
    cases.append(_relation("occlude", "Actor travels behind an opaque foreground strip and emerges.", (
        Frame("Actor approaching a visible foreground strip.", (actor.at(10), occluder)),
        Frame("Rightward motion established.", (actor.at(17), occluder)),
        Frame("Actor fully hidden behind the strip.", (actor.at(24), occluder)),
        Frame("Actor still partly hidden.", (actor.at(31), occluder)),
        Frame("Actor reappears beyond the strip.", (actor.at(38), occluder)),
    ), subjects=("occluder", "actor"), start=2, continuing=3, end=4,
        requirements=("Positive depth, predicted motion and identity evidence must justify occlusion; draw order is oracle-only.",)))

    container = Body("container", 26, 8, ring(24, 32), RED)
    containment_frames = (
        Frame("Actor outside the container.", (actor.at(10), container)),
        Frame("Actor fully inside the enclosed interior.", (actor.at(32), container)),
        Frame("Actor remains inside.", (actor.at(32), container)),
        Frame("Actor outside again.", (actor.at(10), container)),
    )
    for name, subjects in (("contain", ("container", "actor")), ("inside", ("actor", "container"))):
        cases.append(_relation(name, "Enclosure starts, persists, and ends.", containment_frames,
                               subjects=subjects, requirements=(
                                   "Contain(container, actor) and inside(actor, container) are inverse directed relations.",
                                   "Use enclosed-interior geometry; black interior pixels are not foreground mask overlap.",
                               )))
    cases.append(_relation("blocked", "A wall prevents an intended rightward move until the wall is removed.", (
        Frame("Actor approaches wall.", (actor.at(24), wall)),
        Frame("Actor reaches wall.", (actor.at(30), wall)),
        Frame("Rightward attempt cannot move actor through wall.", (actor.at(30), wall),
              (Term("user_input", ("actor", "right")),)),
        Frame("Another rightward attempt is blocked.", (actor.at(30), wall),
              (Term("user_input", ("actor", "right")),)),
        Frame("Wall removed; rightward motion resumes.", (actor.at(36),),
              (Term("user_input", ("actor", "right")),)),
    ), subjects=("actor", "wall"), start=2, continuing=3, end=4, requirements=(
        "Blocked is a causal scenario: intention/attempt evidence is required in addition to stationary contact.",
        "Authored input is separate oracle metadata, not injected into recording FRAME actions.",
    )))
    cases.append(_relation("follow", "Blue follows the red leader around a corner, then takes a different path.", (
        Frame("Leader ahead, follower behind.", (actor.at(12, 12), other.at(20, 12))),
        Frame("Follower visits leader's previous point.", (actor.at(20, 12), other.at(28, 12))),
        Frame("Follower continues along leader's path.", (actor.at(28, 12), other.at(28, 20))),
        Frame("Follower diverges right instead of following downward.", (actor.at(36, 12), other.at(28, 28))),
    ), requirements=("Directed lagged path evidence is required; similar simultaneous velocity is only co-motion.",)))
    carrier = Body("carrier", 20, 28, rectangle(16, 4), RED)
    cargo = Body("cargo", 24, 10, rectangle(6, 6), BLUE)
    cases.append(_relation("carry", "A platform picks up, transports, then leaves its load.", (
        Frame("Cargo above a separate platform.", (carrier, cargo)),
        Frame("Cargo placed on supporting platform.", (carrier, cargo.at(24, 22))),
        Frame("Carrier transports cargo at fixed relative offset.", (carrier.at(26), cargo.at(30, 22))),
        Frame("Cargo stays; platform moves away.", (carrier.at(40), cargo.at(30, 22))),
    ), subjects=("carrier", "cargo"), requirements=(
        "Carrying requires a supported carrier/load relation and joint motion, not co-motion alone.",
    )))
    cases.extend([
        Case("no_material_change", "Negative control: identical complete observations.", (
            Frame("Static reference.", (actor, other)),
            Frame("Exactly the same pixels.", (actor, other)),
        ), (), ("A complete comparison is required before asserting no material change.",), "no_material_change"),
        Case("unknown", "Ambiguity control: identical-looking objects meet and identity is unresolved.", (
            Frame("Two indistinguishable objects.", (actor.at(18), replace(other, x=36, color=BLUE))),
            Frame("Objects coincide; pixels cannot establish individual identity.", (
                actor.at(27), replace(other, x=27, color=BLUE),
            )),
            Frame("Separate symmetrically; bounce versus pass-through remains ambiguous.", (
                actor.at(36), replace(other, x=18, color=BLUE),
            )),
        ), (), ("Do not convert ambiguous correspondence into a claimed collision, merge or identity swap.",), "unknown"),
    ])
    return tuple(cases)
