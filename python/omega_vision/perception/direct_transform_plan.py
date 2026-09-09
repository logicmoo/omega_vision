"""Pure, bounded dependency planning for explicit transform calls."""

from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Mapping, Sequence

from omega_vision.perception.cross_frame_deps import parse_dependency, resolve_dependency


@dataclass(frozen=True)
class DirectNode:
    frame_id: str
    output: str
    dependencies: tuple[tuple[str, str], ...]
    blocked: tuple[str, ...]


def plan_direct_call(
    output: str,
    specs: Mapping[str, Mapping[str, Any]],
    frame_ids: Sequence[str],
    selected_ids: Sequence[str],
    *,
    ordered: bool,
) -> list[DirectNode]:
    """Topological order with shared dependencies once and no work beyond scope."""
    if output not in specs:
        raise ValueError(f"Unknown registered transformation: {output}")
    positions = {frame_id: index for index, frame_id in enumerate(frame_ids)}
    if len(positions) != len(frame_ids):
        raise ValueError("Visual Sequence frame IDs are not unique")
    allowed = set(selected_ids)
    states: dict[tuple[str, str], int] = {}
    nodes: dict[tuple[str, str], DirectNode] = {}
    result: list[DirectNode] = []
    for frame_id in selected_ids:
        if frame_id not in positions:
            raise ValueError(f"Unknown selected frame: {frame_id}")
        if (positions[frame_id] == 0 and specs[output].get("skipFirstFrame")) or (specs[output].get("orderedOnly") and not ordered):
            continue
        stack = [((frame_id, output), False)]
        while stack:
            key, leaving = stack.pop()
            if leaving:
                states[key] = 2
                result.append(nodes[key])
                continue
            if states.get(key) == 2:
                continue
            if states.get(key) == 1:
                raise ValueError(f"Dependency cycle at {key[0]}: {key[1]}")
            if key[1] not in specs:
                raise ValueError(f"Dependency is not registered: {key[1]}")
            dependencies: list[tuple[str, str]] = []
            blocked: list[str] = []
            spec = specs[key[1]]
            selectors = (spec.get("firstFrameDependsOn", spec.get("dependsOn", []))
                         if positions[key[0]] == 0 else spec.get("dependsOn", []))
            if positions[key[0]] == 0 and spec.get("skipFirstFrame"):
                blocked.append(f"{key[1]}: initial frame has no predecessor")
                selectors = []
            if spec.get("orderedOnly") and not ordered:
                blocked.append(f"{key[1]}: requires an ordered Visual Sequence")
                selectors = []
            for selector in selectors:
                parsed = parse_dependency(selector)
                resolved = resolve_dependency(
                    parsed, current_frame_id=key[0], current_frame_order=positions[key[0]],
                    ordered=ordered, frame_ids_in_order=frame_ids, frame_id_set=positions,
                )
                if not resolved.resolved or resolved.frame_id is None:
                    blocked.append(f"{selector}: {resolved.reason}")
                elif resolved.frame_id not in allowed:
                    blocked.append(f"{selector}: outside First N selection")
                else:
                    dependencies.append((resolved.frame_id, resolved.output))
            states[key] = 1
            nodes[key] = DirectNode(key[0], key[1], tuple(dependencies), tuple(blocked))
            stack.append((key, True))
            stack.extend((dependency, False) for dependency in reversed(dependencies))
    return result
