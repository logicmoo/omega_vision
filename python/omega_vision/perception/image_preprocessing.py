"""Per-Visual-Sequence image preprocessing chain model.

A *preprocessing chain* is an ordered list of steps applied to every submitted
item of a Visual Sequence before OpenCV extraction and LLM image consumers see
it. Each step selects an entry from the EXISTING Video Import Filters registry
(there is no parallel registry); the special :data:`ORIGINAL_PIXELS_ID` is a
removable no-op / pass-through that materializes nothing. An empty stack — or a
stack of only ``Original Pixels`` steps — resolves to the original pixels.

This module is pure (no I/O, no heavy imports): it defines the chain schema,
validation against a supplied registry, the content-addressed chain signature
used for cache/lineage identity, and the cumulative coordinate transform so
downstream geometry maps back to original-image coordinates. Materialization
itself reuses the existing filter pipeline in the API layer.
"""

from __future__ import annotations

import hashlib
import json
import uuid
from typing import Any, Callable, Iterable, Mapping, Sequence

__all__ = [
    "ORIGINAL_PIXELS_ID",
    "SCHEMA_VERSION",
    "default_chain",
    "normalize_chain",
    "is_noop_step",
    "effective_steps",
    "is_effectively_original",
    "validate_chain",
    "chain_signature",
    "cumulative_scale",
]

# Removable no-op / pass-through selection. Not a fixed anchor and not a reset.
ORIGINAL_PIXELS_ID = "select:original"
SCHEMA_VERSION = 1


def _new_step_id() -> str:
    return f"pp-{uuid.uuid4().hex[:12]}"


def default_chain() -> list[dict[str, Any]]:
    """The initial chain: two visible, stable-ID ``Original Pixels`` no-op rows.

    Fixed ids so the default is deterministic; the user changes slot 1 to e.g.
    ``scale_3x_nearest`` and slot 2 to a DeNoise filter for the intended 3x->DeNoise
    experiment, but both are no-ops by default.
    """
    return [
        {"stepId": "pp-original-1", "entryId": ORIGINAL_PIXELS_ID, "params": {}},
        {"stepId": "pp-original-2", "entryId": ORIGINAL_PIXELS_ID, "params": {}},
    ]


def normalize_chain(
    raw: Any, *, id_factory: Callable[[], str] = _new_step_id, strict: bool = False,
) -> list[dict[str, Any]]:
    """Coerce arbitrary input into a well-formed chain.

    Preserves caller-supplied stable ``stepId`` values (so identity survives
    insert/delete/reorder) and generates one only when missing. Unknown fields are
    dropped; params default to an empty dict. A non-list input yields the default
    chain."""
    if not isinstance(raw, list):
        if strict:
            raise ValueError("steps must be an array (an empty array is allowed)")
        return default_chain()
    steps: list[dict[str, Any]] = []
    seen_ids: set[str] = set()
    for item in raw:
        if not isinstance(item, dict):
            if strict:
                raise ValueError("each preprocessing step must be an object")
            continue
        if strict:
            if not isinstance(item.get("entryId"), str) or not item["entryId"].strip():
                raise ValueError("each preprocessing step needs an entryId")
            if not isinstance(item.get("params", {}), dict):
                raise ValueError("step params must be an object")
            json.dumps(item.get("params", {}), allow_nan=False)
        entry_id = str(item.get("entryId") or ORIGINAL_PIXELS_ID)
        step_id = str(item.get("stepId") or "").strip() or id_factory()
        if step_id in seen_ids:
            # Regenerate for a duplicated/collided id, guaranteeing forward
            # progress even when id_factory is deterministic (e.g. in tests) by
            # falling back to a numeric suffix once a fresh factory value also
            # collides.
            base = id_factory()
            candidate = base
            suffix = 1
            while candidate in seen_ids:
                candidate = f"{base}-{suffix}"
                suffix += 1
            step_id = candidate
        seen_ids.add(step_id)
        params = item.get("params")
        steps.append({
            "stepId": step_id,
            "entryId": entry_id,
            "params": params if isinstance(params, dict) else {},
        })
    return steps


def is_noop_step(step: Mapping[str, Any]) -> bool:
    return str(step.get("entryId") or ORIGINAL_PIXELS_ID) == ORIGINAL_PIXELS_ID


def effective_steps(chain: Sequence[Mapping[str, Any]]) -> list[dict[str, Any]]:
    """The materializable steps (no-op / Original Pixels rows removed)."""
    return [dict(step) for step in chain if not is_noop_step(step)]


def is_effectively_original(chain: Sequence[Mapping[str, Any]]) -> bool:
    """True when the chain resolves to the original pixels (empty or all no-op)."""
    return not effective_steps(chain)


def validate_chain(
    chain: Sequence[Mapping[str, Any]],
    *,
    valid_entry_ids: Iterable[str],
    materializable_entry_ids: Iterable[str],
) -> list[str]:
    """Return human-readable errors for steps that reference unknown or
    non-materializable filters. ``Original Pixels`` steps are always valid."""
    valid = set(valid_entry_ids)
    materializable = set(materializable_entry_ids)
    errors: list[str] = []
    for index, step in enumerate(chain):
        if is_noop_step(step):
            continue
        entry_id = str(step.get("entryId"))
        if entry_id not in valid:
            errors.append(f"step {index} ({entry_id}): not a registered filter")
        elif entry_id not in materializable:
            errors.append(f"step {index} ({entry_id}): filter is not deterministic/materializable")
    return errors


def _canonical_step(step: Mapping[str, Any]) -> dict[str, Any]:
    return {"entryId": str(step.get("entryId")), "params": step.get("params") or {}}


def chain_signature(
    source_signature: str,
    chain: Sequence[Mapping[str, Any]],
    *,
    registry_versions: Mapping[str, str] | None = None,
    schema_version: int = SCHEMA_VERSION,
) -> str:
    """Deterministic content-addressed identity for the final variant.

    Combines the source image signature with the ORDERED effective steps
    (entryId + params + optional per-filter version). An effectively-original chain
    returns ``"original:<source_signature>"`` so the variant is the source itself.
    """
    steps = effective_steps(chain)
    if not steps:
        return f"original:{source_signature}"
    versions = registry_versions or {}
    hasher = hashlib.sha256()
    hasher.update(f"v{schema_version}\x1f{source_signature}".encode("utf-8"))
    for step in steps:
        canonical = _canonical_step(step)
        hasher.update(b"\x1e")
        hasher.update(json.dumps(canonical, sort_keys=True, ensure_ascii=False).encode("utf-8"))
        hasher.update(b"\x1f")
        hasher.update(str(versions.get(canonical["entryId"], "")).encode("utf-8"))
    return f"chain:{hasher.hexdigest()[:24]}"


def cumulative_scale(
    chain: Sequence[Mapping[str, Any]],
    scale_of: Callable[[str, Mapping[str, Any]], float],
) -> float:
    """Net linear scale factor applied by the chain, so geometry produced on the
    preprocessed variant can be mapped back to original-image coordinates.

    ``scale_of(entry_id, params)`` returns the per-step linear scale (1.0 for
    non-geometric filters). No-op steps contribute 1.0.
    """
    scale = 1.0
    for step in effective_steps(chain):
        scale *= float(scale_of(str(step.get("entryId")), step.get("params") or {}))
    return scale
