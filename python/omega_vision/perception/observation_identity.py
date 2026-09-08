"""Deterministic identities for frame-local symbolic observations."""
from __future__ import annotations

from hashlib import sha256
from itertools import chain
import json
import math
from typing import Any, Iterable, Mapping

from omega_vision.core.models import deterministic_identifier
from omega_vision.perception.group_acceptance import parse_current_frame_evidence


IDENTITY_VERSION = "observation-identity-v1"


def _canonical_value(value: Any) -> Any:
    if isinstance(value, Mapping):
        return {
            str(key): _canonical_value(item)
            for key, item in sorted(value.items(), key=lambda pair: str(pair[0]))
        }
    if isinstance(value, (list, tuple)):
        return [_canonical_value(item) for item in value]
    if isinstance(value, set):
        return sorted((_canonical_value(item) for item in value), key=_canonical_json)
    if isinstance(value, float):
        if not math.isfinite(value):
            raise ValueError("observation identity cannot contain non-finite numbers")
        return round(value, 9)
    if isinstance(value, (str, int, bool)) or value is None:
        return value
    raise TypeError(f"observation identity cannot contain {type(value).__name__}")


def _canonical_json(value: Any) -> str:
    return json.dumps(
        _canonical_value(value),
        ensure_ascii=False,
        separators=(",", ":"),
        sort_keys=True,
    )


def content_hash(value: bytes | str | Mapping[str, Any] | list[Any]) -> str:
    if isinstance(value, bytes):
        payload = value
    elif isinstance(value, str):
        payload = value.encode("utf-8")
    else:
        payload = _canonical_json(value).encode("utf-8")
    return sha256(payload).hexdigest()


def _point(value: Iterable[Any]) -> tuple[float, float]:
    items = list(value)
    if len(items) < 2:
        raise ValueError("polygon point must contain x and y")
    return round(float(items[0]), 9), round(float(items[1]), 9)


def _canonical_ring(raw: Iterable[Iterable[Any]]) -> list[list[float]]:
    points = [_point(value) for value in raw]
    if len(points) > 1 and points[0] == points[-1]:
        points.pop()
    if not points:
        return []

    def rotations(values: list[tuple[float, float]]) -> Iterable[tuple[tuple[float, float], ...]]:
        for index in range(len(values)):
            yield tuple(values[index:] + values[:index])

    forward = list(points)
    backward = list(reversed(points))
    canonical = min(chain(rotations(forward), rotations(backward)))
    return [[x, y] for x, y in canonical]


def _region_geometry(alias: str, geometry: Mapping[str, Any]) -> dict[str, Any]:
    polygons = geometry.get("polygons")
    if not isinstance(polygons, Mapping):
        return {"outer": [], "holes": []}
    details = polygons.get(alias)
    if details is None and alias.startswith("r"):
        details = polygons.get(alias[1:])
    if not isinstance(details, Mapping):
        return {"outer": [], "holes": []}
    outer = _canonical_ring(details.get("outer") or [])
    holes = sorted(
        (_canonical_ring(hole) for hole in (details.get("holes") or [])),
        key=_canonical_json,
    )
    return {"outer": outer, "holes": holes}


def _region_payload(
    region: Mapping[str, Any],
    geometry: Mapping[str, Any],
) -> dict[str, Any]:
    alias = str(region["id"])
    centroid = region.get("centroid") or [0.0, 0.0]
    return {
        "color": str(region.get("color") or ""),
        "area": round(float(region.get("area") or 0.0), 9),
        "centroid": [round(float(centroid[0]), 9), round(float(centroid[1]), 9)],
        "geometry": _region_geometry(alias, geometry),
    }


def _group_records(
    *,
    frame_uid: str,
    kind: str,
    groups: Iterable[Mapping[str, Any]],
    region_uids: Mapping[str, str],
) -> list[dict[str, Any]]:
    output: list[dict[str, Any]] = []
    for source_order, group in enumerate(groups):
        alias = str(group.get("id") or "")
        if not alias:
            continue
        member_aliases = [str(member) for member in (group.get("members") or [])]
        unknown = sorted(set(member_aliases) - set(region_uids))
        if unknown:
            raise ValueError(f"{kind} group {alias} references unknown regions: {', '.join(unknown)}")
        members = sorted({region_uids[member] for member in member_aliases})
        uid = deterministic_identifier(
            "group-observation",
            {
                "identity_version": IDENTITY_VERSION,
                "frame_uid": frame_uid,
                "kind": kind,
                "members": members,
            },
        )
        evidence = {
            str(key): value
            for key, value in group.items()
            if key not in {"id", "members", "sourceOrder"}
        }
        output.append({
            "uid": uid,
            "alias": alias,
            "kind": kind,
            "members": members,
            "memberAliases": member_aliases,
            "sourceOrder": int(group.get("sourceOrder", source_order)),
            "evidenceHash": content_hash(evidence),
            "evidence": _canonical_value(evidence),
        })
    return output


def build_observation_bundle(
    *,
    frame_alias: str,
    sequence_id: str,
    frame_order: int | None,
    image_bytes: bytes,
    extraction_text: str,
    grouping_text: str,
    acceptance_text: str,
    geometry: Mapping[str, Any] | None = None,
    visual_groups: Iterable[Mapping[str, Any]] | None = None,
    accepted_groups: Iterable[Mapping[str, Any]] = (),
    frame_key: str | None = None,
    source_artifact_hashes: Mapping[str, str] | None = None,
) -> dict[str, Any]:
    geometry = geometry or {}
    parsed = parse_current_frame_evidence(extraction_text, grouping_text, dict(geometry))
    if visual_groups is not None:
        parsed["visualGroups"] = [dict(group) for group in visual_groups]

    image_digest = content_hash(image_bytes)
    frame_locator: dict[str, Any] = {"sequence_id": sequence_id}
    if frame_order is None:
        frame_locator["source_key"] = frame_key or frame_alias
    else:
        frame_locator["frame_order"] = int(frame_order)
    frame_uid = deterministic_identifier(
        "frame-observation",
        {
            "identity_version": IDENTITY_VERSION,
            "image_hash": image_digest,
            **frame_locator,
        },
    )

    regions: list[dict[str, Any]] = []
    region_uids: dict[str, str] = {}
    seen_region_uids: dict[str, str] = {}
    region_values = sorted(
        parsed["regions"].values(),
        key=lambda value: (
            int(value.get("sourceOrder", 0)),
            str(value.get("id") or ""),
        ),
    )
    for region in region_values:
        alias = str(region["id"])
        payload = _region_payload(region, geometry)
        uid = deterministic_identifier(
            "region-observation",
            {
                "identity_version": IDENTITY_VERSION,
                "frame_uid": frame_uid,
                "region": payload,
            },
        )
        previous = seen_region_uids.get(uid)
        if previous is not None and previous != alias:
            raise ValueError(
                f"indistinguishable region observations {previous} and {alias}; "
                "geometry must disambiguate frame-local regions"
            )
        seen_region_uids[uid] = alias
        region_uids[alias] = uid
        regions.append({
            "uid": uid,
            "alias": alias,
            "sourceOrder": int(region.get("sourceOrder", len(regions))),
            "fingerprint": content_hash(payload),
            **payload,
        })

    visual = _group_records(
        frame_uid=frame_uid,
        kind="visual",
        groups=parsed["visualGroups"],
        region_uids=region_uids,
    )
    symbolic = _group_records(
        frame_uid=frame_uid,
        kind="symbolic",
        groups=parsed["symbolicGroups"],
        region_uids=region_uids,
    )
    final = _group_records(
        frame_uid=frame_uid,
        kind="final",
        groups=accepted_groups,
        region_uids=region_uids,
    )
    artifact_hashes = dict(source_artifact_hashes or {
        "image": image_digest,
        "partsFacts": content_hash(extraction_text),
        "groupingFacts": content_hash(grouping_text),
        "acceptanceFacts": content_hash(acceptance_text),
        "geometry": content_hash(dict(geometry)),
    })
    if artifact_hashes.get("image") != image_digest:
        raise ValueError("source image hash does not match image bytes")
    group_records = [*visual, *symbolic, *final]
    bundle_uid = deterministic_identifier(
        "observation-bundle",
        {
            "identity_version": IDENTITY_VERSION,
            "frame_uid": frame_uid,
            "artifact_hashes": artifact_hashes,
            "region_uids": sorted(record["uid"] for record in regions),
            "group_uids": sorted(record["uid"] for record in group_records),
            "group_evidence_hashes": sorted(
                record["evidenceHash"] for record in group_records
            ),
        },
    )
    return {
        "schemaVersion": 1,
        "identityVersion": IDENTITY_VERSION,
        "bundleUid": bundle_uid,
        "frame": {
            "uid": frame_uid,
            "alias": frame_alias,
            "sequenceId": sequence_id,
            "frameOrder": frame_order,
            "sourceKey": frame_key or frame_alias,
            "imageHash": image_digest,
            "width": geometry.get("width"),
            "height": geometry.get("height"),
        },
        "artifactHashes": artifact_hashes,
        "regions": regions,
        "groups": {
            "visual": visual,
            "symbolic": symbolic,
            "final": final,
        },
        "aliasIndex": {
            "regions": region_uids,
            "visual": {record["alias"]: record["uid"] for record in visual},
            "symbolic": {record["alias"]: record["uid"] for record in symbolic},
            "final": {record["alias"]: record["uid"] for record in final},
        },
    }


def _prolog_atom(value: Any) -> str:
    return "'" + str(value).replace("\\", "\\\\").replace("'", "''") + "'"


def _prolog_number(value: Any) -> str:
    number = float(value)
    return str(int(number)) if number.is_integer() else f"{number:.9f}".rstrip("0").rstrip(".")


def _prolog_list(values: Iterable[Any]) -> str:
    return "[" + ",".join(_prolog_atom(value) for value in values) + "]"


def render_observation_facts(bundle: Mapping[str, Any]) -> str:
    frame = bundle["frame"]
    lines = [
        "% deterministic frame-local observation identities",
        f"observation_identity_version({_prolog_atom(bundle['identityVersion'])}).",
        (
            f"observation_bundle({_prolog_atom(bundle['bundleUid'])}, "
            f"{_prolog_atom(frame['uid'])})."
        ),
        (
            f"frame_observation({_prolog_atom(frame['uid'])}, "
            f"{_prolog_atom(frame['sequenceId'])}, "
            f"{_prolog_atom(frame['alias'])}, "
            f"{'none' if frame['frameOrder'] is None else int(frame['frameOrder'])}, "
            f"{_prolog_atom(frame['imageHash'])})."
        ),
    ]
    for role, digest in bundle["artifactHashes"].items():
        lines.append(
            f"observation_source_hash({_prolog_atom(bundle['bundleUid'])}, "
            f"{_prolog_atom(role)}, {_prolog_atom(digest)})."
        )
    for region in bundle["regions"]:
        centroid = region["centroid"]
        lines.append(
            f"region_observation({_prolog_atom(region['uid'])}, "
            f"{_prolog_atom(frame['uid'])}, {_prolog_atom(region['alias'])}, "
            f"{_prolog_atom(region['color'])}, {_prolog_number(region['area'])}, "
            f"centroid({_prolog_number(centroid[0])},{_prolog_number(centroid[1])}), "
            f"{_prolog_atom(region['fingerprint'])})."
        )
    for kind in ("visual", "symbolic", "final"):
        for group in bundle["groups"][kind]:
            lines.append(
                f"group_observation({_prolog_atom(group['uid'])}, "
                f"{_prolog_atom(frame['uid'])}, {kind}, "
                f"{_prolog_atom(group['alias'])}, {_prolog_list(group['members'])}, "
                f"{_prolog_atom(group['evidenceHash'])})."
            )
    return "\n".join(lines) + "\n"
