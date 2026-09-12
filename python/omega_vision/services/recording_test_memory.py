"""Explicit execution-local memory selection and causal native observation checkpoints."""
from __future__ import annotations

from contextlib import contextmanager
from contextvars import ContextVar
from copy import deepcopy
from pathlib import Path
from typing import Any

from omega_vision.inherited_source_overlay import storage_path
from omega_vision.perception.contextual_memory import RecordingContext
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.perception.observation_identity import content_hash

_BINDING: ContextVar[tuple[Path, str] | None] = ContextVar("recording_test_native_memory", default=None)
SCHEMA = "causal-visual-observation-v1"


@contextmanager
def native_execution(home: Path, sequence_id: str):
    token = _BINDING.set((storage_path(home), sequence_id))
    try:
        yield
    finally:
        _BINDING.reset(token)


def execution_preferences(locations, context) -> dict[str, Any] | None:
    binding = _BINDING.get()
    if binding is None:
        return None
    native, current = locations._native()
    if current is None or (native.root, current.sequence_id) != binding or context.run_id != binding[1]:
        raise PermissionError("Explicit execution memory belongs to a different recording")
    value = {"schemaVersion": 1, "expanded": False}
    for kind in ("shape", "object"):
        destination = native.descriptor(current.stm_area(), kind, current)
        if not destination["capabilities"]["write"]:
            raise PermissionError("The native recording STM is read-only")
        value[kind] = {"saveTo": destination["memoryLocationId"],
                       "lookIn": [destination["memoryLocationId"]] if current.current.order else [],
                       "recentLookIn": []}
    return {**value, "revision": content_hash(value)}


class ObservationMemory:
    """Typed observations, predictions and checkpoint state; never evaluator labels."""
    def __init__(self, context: RecordingContext):
        self.context = context
        self.frame = MeTTaMemoryDatabase(context.root, context.frame_area(), "observation")
        self.stm = MeTTaMemoryDatabase(context.root, context.stm_area(), "observation")

    def _validate(self, entry: dict[str, Any]) -> None:
        if entry.get("entryType") != "visual_observation_checkpoint" or entry.get("observationSchema") != SCHEMA:
            raise ValueError("Unsupported native visual observation schema; no migration is performed")
        causal = entry.get("causal", {})
        index = causal.get("frameOrder")
        if (causal.get("sequenceId") != self.context.sequence_id or type(index) is not int
                or not 0 <= index < len(self.context.moments)
                or causal.get("frameId") != self.context.moments[index].frame_id
                or causal.get("levelId") != self.context.moments[index].level_id):
            raise ValueError("Native visual observation has invalid source causality")
        if entry.get("authoritativeMechanism") is not False:
            raise ValueError("Visual checkpoint must not assert an unobserved mechanism")
        for key in ("sourceBinding", "implementationBinding", "inputPrefixHash", "observer"):
            if not isinstance(entry.get(key), str) or not entry[key]:
                raise ValueError("Native observation lacks source/implementation binding")

    def read(self, *, observer: str, source_binding: str, implementation_binding: str,
             before: int | None = None) -> list[dict[str, Any]]:
        cutoff = self.context.current.order if before is None else before
        if type(cutoff) is not int or not 0 <= cutoff <= self.context.current.order + 1:
            raise PermissionError("Observation lookup exceeds the explicit causal cutoff")
        selected = []
        for entry in self.stm.read():
            self._validate(entry)
            if (entry["observer"] == observer and entry["sourceBinding"] == source_binding
                    and entry["implementationBinding"] == implementation_binding
                    and entry["causal"]["frameOrder"] < cutoff):
                selected.append(entry)
        return sorted(selected, key=lambda item: (item["causal"]["frameOrder"], item["entryUid"]))

    def previous(self, *, observer: str, source_binding: str, implementation_binding: str,
                 expected_prefix_hash: str | None) -> dict[str, Any] | None:
        order = self.context.current.order
        entries = self.read(observer=observer, source_binding=source_binding,
                            implementation_binding=implementation_binding)
        matches = [entry for entry in entries if entry["causal"]["frameOrder"] == order - 1
                   and entry["inputPrefixHash"] == expected_prefix_hash]
        if not order:
            return None
        if len(matches) != 1:
            raise ValueError("A unique verified previous native STM checkpoint is required")
        return deepcopy(matches[0])

    def save(self, *, observer: str, source_binding: str, implementation_binding: str,
             input_prefix_hash: str, source: dict[str, Any], state: dict[str, Any],
             observed: list[dict[str, Any]], predictions: list[dict[str, Any]],
             hypotheses: list[dict[str, Any]], previous_uid: str | None,
             dependencies: list[str]) -> dict[str, Any]:
        value = {
            "entryType": "visual_observation_checkpoint", "observationSchema": SCHEMA,
            "observer": observer, "causal": self.context.causal, "source": source,
            "sourceBinding": source_binding, "implementationBinding": implementation_binding,
            "inputPrefixHash": input_prefix_hash, "previousCheckpointUid": previous_uid,
            "state": state, "observed": observed, "predictions": predictions, "hypotheses": hypotheses,
            "evidenceRefs": sorted(set(dependencies)), "authoritativeMechanism": False,
        }
        self._validate(value)
        frame = self.frame.append(value)
        stm = self.stm.append(value)
        if frame["entryUid"] != stm["entryUid"]:
            raise ValueError("Frame and recording STM checkpoint identities disagree")
        return {
            **stm,
            "memoryRefs": [
                "data/" + db.path.relative_to(self.context.root).as_posix() + "#" + stm["entryUid"]
                for db in (self.frame, self.stm)
            ],
        }
