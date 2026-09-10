"""Omega-only MeTTa candidate journals and explicit, gated STM rule references."""
from __future__ import annotations

from contextlib import contextmanager
from datetime import datetime, timezone
from dataclasses import replace
from typing import Any

from omega_vision.perception._event_journal import IntegrityError, ValidationError, content_id, json_copy, writer_lock
from omega_vision.perception.candidate_rules import CandidateRuleStore, PromotionGates
from omega_vision.perception.candidate_rules import effective_promoted_semantics
from omega_vision.perception.contextual_memory import PROVIDER, ContextUnavailable, RecordingContext
from omega_vision.perception.metta_memory import MeTTaMemoryDatabase
from omega_vision.inherited_source_overlay import storage_path


class ReadOnlyLegacyRuleStore(CandidateRuleStore):
    def __init__(self, root):
        super().__init__(root)
        original = self.journal

        class ReadOnlyJournal:
            def read(self):
                storage_path(root, "runtime", "rule-candidates")
                for path in original.path.glob("*.json"):
                    storage_path(root, *path.relative_to(root).parts)
                return original._read()

            @contextmanager
            def transaction(self):
                yield self.read()

            def append(self, *args, **kwargs):
                raise PermissionError("Historical rule journals are read-only; select a generating frame")

        self.journal = ReadOnlyJournal()

    def list(self, *, kind=None, status=None):
        if status == "promoted" and getattr(self, "context_unavailable", None):
            return []
        return super().list(kind=kind, status=status)

    def effective_semantics(self, *, kinds=None, records=None):
        if getattr(self, "context_unavailable", None):
            return []
        return super().effective_semantics(kinds=kinds, records=records)

    def promote(self, *args, **kwargs):
        raise PermissionError("Historical rule promotion requires an explicit migration policy")


class MeTTaCandidateJournal:
    def __init__(self, context: RecordingContext, origin: RecordingContext):
        self.context = context
        self.origin = origin
        self.database = MeTTaMemoryDatabase(context.root, origin.frame_area(), "induced")

    def read(self):
        output, previous, previous_order = [], None, -1
        for ordinal, entry in enumerate(self.database.read(), 1):
            record, causal = entry.get("transaction"), entry.get("causal")
            if entry.get("entryType") != "rule_journal" or not isinstance(record, dict) or not isinstance(causal, dict):
                raise IntegrityError("Unsupported induced-rule journal schema")
            body = {key: value for key, value in record.items() if key != "id"}
            position = causal.get("frameOrder")
            if (record.get("id") != content_id("transaction", body) or record.get("previous_id") != previous
                    or record.get("revision") != ordinal
                    or type(position) is not int or not 0 <= position < len(self.context.moments)
                    or position < previous_order
                    or causal.get("sequenceId") != self.context.sequence_id
                    or causal.get("frameId") != self.context.moments[position].frame_id):
                raise IntegrityError("Broken induced-rule journal causality or revision chain")
            previous, previous_order = record["id"], position
            if position <= self.context.current.order:
                output.append(record)
        return output

    @contextmanager
    def publication(self):
        directory = self.context.root / "runtime" / "contextual-rule-locks"
        target = directory / ".writer.lock"
        if (storage_path(self.context.root, "runtime", "contextual-rule-locks") != directory
                or storage_path(self.context.root, "runtime", "contextual-rule-locks", ".writer.lock") != target):
            raise PermissionError("Contextual rule lock target was redirected")
        with writer_lock(directory):
            yield

    @contextmanager
    def transaction(self):
        with self.publication(), self.database.transaction():
            entries = self.database.read()
            if entries and entries[-1]["causal"]["frameOrder"] > self.context.current.order:
                raise ValidationError("Cannot append backdated rule history; an explicit replay policy is required")
            yield self.read()

    def append(self, records, payload):
        body = {"revision": len(records) + 1, "previous_id": records[-1]["id"] if records else None,
                "payload": json_copy(payload)}
        record = {**body, "id": content_id("transaction", body)}
        self.database.append({"entryType": "rule_journal", "transaction": record,
                              "causal": self.context.causal}, _locked=True)
        records.append(record)
        return record


class ContextualRuleStore(CandidateRuleStore):
    """Reuse normalization/evaluation gates, without global JSON candidate writes."""
    def __init__(self, context: RecordingContext, *, origin: RecordingContext | None = None):
        self.context = context
        self.origin = origin or context
        if (self.origin.sequence_id != context.sequence_id or self.origin.root != context.root
                or self.origin.current.order > context.current.order):
            raise PermissionError("Proposal origin must be an earlier/current frame of this recording")
        self.workspace_root = context.root
        directory = context.root / "runtime" / "grouping-promotion-locks"
        for target in (directory, directory / ".writer.lock"):
            if storage_path(context.root, *target.relative_to(context.root).parts) != target:
                raise PermissionError("Grouping rule lock target was redirected")
        self.path = self.origin.frame_area()
        self.journal = MeTTaCandidateJournal(context, self.origin)

    def create(self, rule, **kwargs):
        if self.context.current.order != self.origin.current.order:
            raise ValidationError("New proposals must remain at their generating frame")
        kwargs["provenance"] = {**kwargs["provenance"], "memoryGeneration": self.context.causal}
        return super().create(rule, **kwargs)

    def list(self, *, kind=None, status=None):
        if status == "promoted":
            return [item for item in self.published_candidates() if kind is None or item["kind"] == kind]
        return super().list(kind=kind, status=status)

    def effective_semantics(self, *, kinds=None, records=None):
        return effective_promoted_semantics(self.published_candidates(), kinds=kinds)

    def for_temporal_frame(self, frame):
        if (frame.provider_id != PROVIDER or frame.sequence_id != self.context.sequence_id
                or type(frame.order) is not int or not 0 <= frame.order < len(self.context.moments)):
            raise PermissionError("Deduction frame does not belong to this explicit recording context")
        return ContextualRuleStore(replace(self.context, current=self.context.moments[frame.order]))

    def promote(self, candidate_id: str, *, gates: PromotionGates,
                manual_approval_by: str | None = None, role: str = "deduction"):
        if role != "deduction":
            raise ContextUnavailable("unsupported_induction_ast",
                                     "No authored/accepted learning-procedure AST is registered")
        target = MeTTaMemoryDatabase(self.context.root, self.context.stm_area(), role)
        with self.journal.transaction() as records:
            candidate, evaluation = self._evaluate_locked(records, candidate_id, gates, manual_approval_by)
            if not evaluation["eligible"]:
                raise ValidationError("promotion blocked: " + ", ".join(evaluation["reasons"]))
            reference = {
                "entryType": "accepted_rule_reference", "candidateId": candidate_id,
                "candidateVersion": candidate["version"], "evaluationId": evaluation["evaluation_id"],
                "origin": {"providerRef": PROVIDER, "sequenceId": self.origin.sequence_id,
                           "frameId": self.origin.current.frame_id,
                           "path": "data/" + self.journal.database.path.relative_to(self.context.root).as_posix()},
                "generatedAt": self.origin.causal, "promotedAt": self.context.causal,
                "activation": "requires_current_candidate_status_promoted_and_causal_cutoff",
            }
            published = target.append(reference)
            binding = "data/" + target.path.relative_to(self.context.root).as_posix() + "#" + published["entryUid"]
            if candidate["status"] != "promoted" or candidate.get("promoted_rule_ref") != binding:
                self.journal.append(records, {
                    "operation": "promote", "candidate_id": candidate_id, "status": "promoted",
                    "at": datetime.now(timezone.utc).isoformat(),
                    "evaluation_id": evaluation["evaluation_id"],
                    "rule_ref": binding,
                    "manual_approval_by": manual_approval_by,
                })
            return json_copy(self._get(records, candidate_id))

    def published_candidates(self) -> list[dict[str, Any]]:
        database = MeTTaMemoryDatabase(self.context.root, self.context.stm_area(), "deduction")
        selected = {}
        from omega_vision.perception.contextual_memory import recording_context
        for entry in database.read():
            if entry.get("entryType") != "accepted_rule_reference":
                raise IntegrityError("Unsupported deduction-rule reference schema")
            promotion = entry.get("promotedAt", {})
            index = promotion.get("frameOrder")
            if (type(index) is not int or not 0 <= index < len(self.context.moments)
                    or promotion.get("sequenceId") != self.context.sequence_id
                    or promotion.get("frameId") != self.context.moments[index].frame_id
                    or promotion.get("levelId") != self.context.moments[index].level_id
                    or promotion.get("levelId") != self.context.current.level_id):
                raise IntegrityError("Published rule has invalid recording/level causality")
            if index >= self.context.current.order:
                continue
            origin = entry.get("origin", {})
            if origin.get("providerRef") != PROVIDER or origin.get("sequenceId") != self.context.sequence_id:
                raise PermissionError("Published rule points outside its authorized recording")
            source = recording_context(self.context.root, self.context.directory, origin.get("frameId"))
            store = ContextualRuleStore(self.context, origin=source)
            expected = "data/" + store.journal.database.path.relative_to(self.context.root).as_posix()
            if origin.get("path") != expected:
                raise PermissionError("Published rule source path disagrees with its registered origin")
            candidate = store.get(entry["candidateId"])
            binding = "data/" + database.path.relative_to(self.context.root).as_posix() + "#" + entry["entryUid"]
            if candidate["status"] != "promoted" or candidate["version"] != entry["candidateVersion"]:
                continue
            for event in reversed(candidate["history"]):
                # A different scoped promotion preserves approvals, but an
                # intervening invalidation must not resurrect an older binding.
                if event.get("status") not in {None, "promoted"}:
                    break
                if (event["operation"] == "promote" and event.get("rule_ref") == binding
                        and event.get("evaluation_id") == entry["evaluationId"]):
                    selected[candidate["candidate_id"]] = {**candidate, "promoted_rule_ref": binding}
                    break
        return list(selected.values())
