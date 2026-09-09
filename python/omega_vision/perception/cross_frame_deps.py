"""Cross-frame dependency resolver for the Video Import transform pipeline.

A transform ``dependsOn`` entry normally names another step *in the same frame*
as ``transformation/doer``. This module adds a PREFIX grammar so a step can
depend on a step in a *different* frame of the same ordered Visual Sequence,
which is the infrastructure the future adjacent-pair LLM/event stages need
(deterministic temporal/event work itself stays deferred).

Selected grammar (prefix before an ``@``; the part after ``@`` is the ordinary
``transformation/doer`` output key):

    transformation/doer                      same frame (unchanged, no ``@``)
    frame[-1]@transformation/doer            relative: the immediately prior frame
    frame[-2]@transformation/doer            relative: two frames back
    frame[+2]@transformation/doer            relative: two frames forward
                                             (an explicit sign means RELATIVE)
    frame[42]@transformation/doer            exact frame key "42" (unsigned =
                                             exact key, NOT an ordinal offset)
    frame[foo]@transformation/doer           exact named frame key (frame dirs
                                             may be free-form)

There are no ``previous_frame@``/``next_frame@`` word aliases: use ``frame[-1]``
and ``frame[+1]``.

Resolution rules:

* Relative selectors (``frame[+-N]``) require an ordered sequence and anchor to
  the current frame's ``frameOrder``. Out-of-range targets (e.g. ``frame[-1]`` on
  the first frame) are reported explicitly as unresolvable rather than silently
  dropped or run.
* Exact-key selectors (``frame[key]``) resolve for ordered OR unordered
  sequences, by matching a frame id, and never depend on ordinal position.
* Resolution is confined to a single Visual Sequence.

Staleness is deterministic and content-addressed: a dependent records the target
result *revision* (a content hash of the produced ``result.pl`` plus producer
metadata) it consumed; it is stale when the target's current revision differs,
when the resolved frame changes under a catalog/order edit, or when the target is
no longer resolvable. Wall-clock mtime is auxiliary only.
"""

from __future__ import annotations

import hashlib
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterable, Mapping, Sequence

__all__ = [
    "SameFrame",
    "RelativeFrame",
    "ExactFrame",
    "ParsedDependency",
    "ResolvedDependency",
    "parse_dependency",
    "resolve_dependency",
    "detect_dependency_cycles",
    "output_revision",
    "is_dependency_stale",
    "plan_pair_dependencies",
]

# frame[...] selector body: an explicitly signed integer is a relative offset;
# an unsigned integer or a free-form name is an exact frame key.
_FRAME_SELECTOR = re.compile(r"^frame\[(?P<body>[^\[\]]+)\]$")
_SIGNED_INT = re.compile(r"^[+-]\d+$")
_UNSIGNED_INT = re.compile(r"^\d+$")
_NAMED_KEY = re.compile(r"^[A-Za-z0-9_\-]+$")
_OUTPUT_KEY = re.compile(r"^[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+$")


class DependencyGrammarError(ValueError):
    """Raised when a dependsOn selector does not match the accepted grammar."""


@dataclass(frozen=True)
class SameFrame:
    """The dependency is in the current frame (default, no ``@``)."""


@dataclass(frozen=True)
class RelativeFrame:
    """Relative to the current frame's ordinal position (requires ordering)."""

    offset: int


@dataclass(frozen=True)
class ExactFrame:
    """An exact frame key (frame id / directory name), position-independent."""

    key: str


FrameSelector = SameFrame | RelativeFrame | ExactFrame


@dataclass(frozen=True)
class ParsedDependency:
    raw: str
    selector: FrameSelector
    output: str  # "transformation/doer"

    @property
    def is_cross_frame(self) -> bool:
        return not isinstance(self.selector, SameFrame)


@dataclass(frozen=True)
class ResolvedDependency:
    raw: str
    output: str
    resolved: bool
    frame_id: str | None = None
    frame_order: int | None = None
    reason: str = ""
    extra: Mapping[str, object] = field(default_factory=dict)


def parse_dependency(dep: str) -> ParsedDependency:
    """Parse one ``dependsOn`` selector string into a structured form.

    Raises :class:`DependencyGrammarError` for malformed selectors so invalid
    references surface loudly instead of silently resolving to the wrong frame.
    """
    if not isinstance(dep, str) or not dep.strip():
        raise DependencyGrammarError(f"empty dependency selector: {dep!r}")
    text = dep.strip()
    prefix, sep, output = text.partition("@")
    if not sep:
        # No prefix: same-frame dependency; the whole string is the output key.
        output = prefix
        selector: FrameSelector = SameFrame()
    else:
        selector = _parse_prefix(prefix, dep)
    if not _OUTPUT_KEY.match(output):
        raise DependencyGrammarError(
            f"dependency output must be 'transformation/doer': {dep!r}"
        )
    return ParsedDependency(raw=text, selector=selector, output=output)


def _parse_prefix(prefix: str, dep: str) -> FrameSelector:
    prefix = prefix.strip()
    match = _FRAME_SELECTOR.match(prefix)
    if not match:
        raise DependencyGrammarError(
            f"frame selector must be 'frame[<-N|+N|key>]@transformation/doer': {dep!r}"
        )
    body = match.group("body").strip()
    if _SIGNED_INT.match(body):
        offset = int(body)
        if offset == 0:
            # frame[+0]/frame[-0] would alias the current frame; reject as a
            # likely mistake so relative selectors are always genuinely cross-frame.
            raise DependencyGrammarError(
                f"relative frame offset must be non-zero: {dep!r}"
            )
        return RelativeFrame(offset)
    if _UNSIGNED_INT.match(body):
        return ExactFrame(body)  # unsigned integer == exact frame key
    if _NAMED_KEY.match(body):
        return ExactFrame(body)
    raise DependencyGrammarError(f"invalid frame key {body!r} in {dep!r}")


def resolve_dependency(
    parsed: ParsedDependency,
    *,
    current_frame_id: str,
    current_frame_order: int | None,
    ordered: bool,
    frame_ids_in_order: Sequence[str],
    frame_id_set: Iterable[str] | None = None,
) -> ResolvedDependency:
    """Resolve a parsed dependency against the current Visual Sequence catalog.

    ``frame_ids_in_order`` is the ordered list of frame ids for the sequence (used
    for relative selectors); ``frame_id_set`` may be supplied for exact-key lookup
    in unordered sequences (defaults to ``frame_ids_in_order``).
    """
    known = set(frame_id_set) if frame_id_set is not None else set(frame_ids_in_order)
    selector = parsed.selector

    if isinstance(selector, SameFrame):
        return ResolvedDependency(
            raw=parsed.raw, output=parsed.output, resolved=True,
            frame_id=current_frame_id, frame_order=current_frame_order,
            reason="same-frame",
        )

    if isinstance(selector, ExactFrame):
        if selector.key not in known:
            return ResolvedDependency(
                raw=parsed.raw, output=parsed.output, resolved=False,
                reason=f"unknown-frame-key:{selector.key}",
            )
        order = None
        if selector.key in frame_ids_in_order:
            order = list(frame_ids_in_order).index(selector.key)
        return ResolvedDependency(
            raw=parsed.raw, output=parsed.output, resolved=True,
            frame_id=selector.key, frame_order=order, reason="exact-key",
        )

    # RelativeFrame
    if not ordered:
        return ResolvedDependency(
            raw=parsed.raw, output=parsed.output, resolved=False,
            reason="unordered-relative",
        )
    if current_frame_order is None or current_frame_id not in frame_ids_in_order:
        return ResolvedDependency(
            raw=parsed.raw, output=parsed.output, resolved=False,
            reason="anchor-not-in-sequence",
        )
    # Anchor on the catalog position of the current frame id (authoritative),
    # not a possibly-stale persisted ordinal.
    anchor = list(frame_ids_in_order).index(current_frame_id)
    target = anchor + selector.offset
    if target < 0 or target >= len(frame_ids_in_order):
        return ResolvedDependency(
            raw=parsed.raw, output=parsed.output, resolved=False,
            reason="out-of-range",
        )
    return ResolvedDependency(
        raw=parsed.raw, output=parsed.output, resolved=True,
        frame_id=frame_ids_in_order[target], frame_order=target,
        reason="relative",
    )


def detect_dependency_cycles(
    pipeline: Sequence[Mapping[str, object]],
    *,
    frame_ids_in_order: Sequence[str],
    ordered: bool,
    frame_id_set: Iterable[str] | None = None,
) -> list[list[str]]:
    """Return dependency cycles across the resolved cross-frame graph.

    Nodes are ``"<frame_id>::<transformation>/<doer>"``. A non-empty result means
    the pipeline is invalid and must be rejected before stamping. Same-frame
    self-dependencies are reported as trivial one-node cycles.
    """
    known = set(frame_id_set) if frame_id_set is not None else set(frame_ids_in_order)
    steps = [
        f"{spec['transformation']}/{spec['doer']}"
        for spec in pipeline
        if spec.get("transformation") and spec.get("doer")
    ]
    step_set = set(steps)
    adjacency: dict[str, set[str]] = {}
    frames = list(frame_ids_in_order) or list(known)

    def node(frame_id: str, output: str) -> str:
        return f"{frame_id}::{output}"

    for order, frame_id in enumerate(frames):
        for spec in pipeline:
            if not spec.get("transformation") or not spec.get("doer"):
                continue
            source = node(frame_id, f"{spec['transformation']}/{spec['doer']}")
            edges = adjacency.setdefault(source, set())
            for dep in spec.get("dependsOn") or []:
                parsed = parse_dependency(str(dep))
                res = resolve_dependency(
                    parsed,
                    current_frame_id=frame_id,
                    current_frame_order=order,
                    ordered=ordered,
                    frame_ids_in_order=frames,
                    frame_id_set=known,
                )
                if not res.resolved or res.frame_id is None:
                    continue  # unresolvable deps cannot participate in a cycle
                if res.output not in step_set:
                    continue  # dep on an unknown step is a separate validation concern
                edges.add(node(res.frame_id, res.output))

    cycles: list[list[str]] = []
    WHITE, GRAY, BLACK = 0, 1, 2
    color: dict[str, int] = {}
    stack: list[str] = []

    def visit(u: str) -> None:
        color[u] = GRAY
        stack.append(u)
        for v in sorted(adjacency.get(u, ())):
            if color.get(v, WHITE) == GRAY:
                if v in stack:
                    cycles.append(stack[stack.index(v):] + [v])
            elif color.get(v, WHITE) == WHITE:
                visit(v)
        stack.pop()
        color[u] = BLACK

    for start in sorted(adjacency):
        if color.get(start, WHITE) == WHITE:
            visit(start)
    return cycles


def output_revision(
    result_path: Path | None,
    *,
    producer: str = "",
    schema: str = "",
    extra: str = "",
) -> str:
    """Deterministic content-addressed revision for a step output.

    Combines the produced ``result.pl`` bytes (when present) with producer/schema
    identifiers so a re-run that changes behavior yields a new revision even if the
    result text is identical.
    """
    hasher = hashlib.sha256()
    if result_path is not None:
        try:
            hasher.update(result_path.read_bytes())
        except OSError:
            hasher.update(b"\x00missing-result")
    else:
        hasher.update(b"\x00no-result")
    hasher.update(b"\x1f")
    hasher.update(producer.encode("utf-8"))
    hasher.update(b"\x1f")
    hasher.update(schema.encode("utf-8"))
    hasher.update(b"\x1f")
    hasher.update(extra.encode("utf-8"))
    return hasher.hexdigest()[:16]


def is_dependency_stale(
    persisted: Mapping[str, object] | None,
    current: ResolvedDependency,
    *,
    consumed_revision: str | None,
    current_revision: str | None,
) -> tuple[bool, str]:
    """Deterministic staleness for one resolved cross-frame dependency.

    Returns ``(stale, reason)``. Stale when the dependency is no longer
    resolvable, when the resolved frame changed vs the persisted resolution (a
    catalog/order edit), or when the target's current revision differs from the
    revision the dependent recorded consuming.
    """
    if not current.resolved:
        return True, f"unresolvable:{current.reason}"
    if persisted is not None:
        prev_frame = persisted.get("frameId")
        if prev_frame is not None and prev_frame != current.frame_id:
            return True, "resolved-frame-changed"
    if current_revision is None:
        return True, "target-missing"
    if consumed_revision is None:
        return True, "no-consumed-revision"
    if consumed_revision != current_revision:
        return True, "revision-changed"
    return False, "current"


def plan_pair_dependencies(
    frame_ids_in_order: Sequence[str],
    *,
    output: str = "turtle_programs/turtle_programs_prolog",
) -> list[dict[str, object]]:
    """First adjacent-pair consumer plan (LLM event deduction is itself deferred).

    Each frame ``N`` (destination/current) yields a pair rooted at ``N`` that
    depends on its own ``output`` and on ``previous_frame@output``. Frame 0 has no
    predecessor and therefore produces NO pair (not a permanently blocked task).
    """
    plans: list[dict[str, object]] = []
    for order, frame_id in enumerate(frame_ids_in_order):
        if order == 0:
            continue  # boundary: first frame has no previous pair
        plans.append({
            "frameId": frame_id,
            "frameOrder": order,
            "previousFrameId": frame_ids_in_order[order - 1],
            "dependsOn": [output, f"frame[-1]@{output}"],
        })
    return plans
