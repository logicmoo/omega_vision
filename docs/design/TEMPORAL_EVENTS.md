[Back to repository README](../../README.md)

# Temporal Events, Deduction, and Two-Band Induction

Design reference for how the Omega Vision Visual Sequence pipeline reasons about
change **between frames**. This document is the canonical source for the temporal
event taxonomy, the strict deduction-vs-induction lifecycle, the durable
Candidate Rule Store contract, and the LLM-assisted deduction/induction stages.

Status legend used throughout:

- **implemented** — shipped and validated on local `main`.
- **partial** — some supporting evidence exists; the event/rule itself is not
  emitted yet.
- **deferred** — intentionally not implemented; design is fixed but blocked
  until the user resumes it.

> Honesty rule: nothing in this document implies a predicate exists yet. Every
> predicate below whose stage is not `implemented` is a target, not a fact the
> system currently emits.

---

## 1. Vocabulary and levels

Three semantic levels stay strictly distinct and are never silently promoted
across the boundary:

1. **Measurable frame evidence** — deterministic per-frame measurements and
   deterministic pairwise measurements (regions `rN`, OpenCV hypotheses `vN`,
   Prolog candidate groups `wN`, accepted final groups `gN`, geometry, masks,
   pixel deltas, centroids, contours). Implemented for single frames; pairwise
   temporal measurements are **deferred**.
2. **`llm_event_hypothesis(...)`** — a silver-label proposal from a
   vision-capable LLM about what happened between two frames. Advisory only,
   **never** authoritative. Stage: **deferred** (see §7).
3. **`frame_event(...)`** — an event **deduced** by an accepted deterministic
   Prolog detector from measurable evidence. Authoritative. Stage: **deferred**
   (see §5).

Frame-local alias bands already in use (see `FILESYSTEM_RESOURCE_MODEL.md` and
the Video Import ledger):

- `rN` — frame-local regions.
- `vN` — frame-local OpenCV visual hypotheses.
- `wN` — frame-local Prolog grouping candidates.
- `gN` — final accepted current-frame groups.
- `oN` — **deferred** persistent objects (a composition of ≥2 final G groups;
  see §4 and the deferred oN composition contract in `CODEX_TODO.md`).

---

## 2. Event taxonomy

An **event** is a change asserted across an ordered transition (usually the
adjacent pair `Frame(t) -> Frame(t+1)`, occasionally a multi-frame window). A
**state** is a per-frame or per-window predicate that is true without asserting a
change. `stationary` is a **state**, not an event.

Every event carries a subject (a region `rN`, group `gN`, or — once it exists —
object `oN`), optional object(s), before/after evidence, confidence, provenance,
and a deterministic ID (§6). All families below are **deferred** unless marked
otherwise; the taxonomy is the authored target set.

### 2.0 Transition bundles, no-change, and unknown

Every **valid adjacent pair** `Frame(t) -> Frame(t+1)` produces **exactly one**
durable `transition_assessment` bundle. The bundle's `events` list **may be
empty** — the system is never required to emit at least one event per frame or
per pair.

- **Empty / unchanged pair.** With sufficient comparison evidence that nothing
  material changed, the bundle records
  `transition_assessment(PairId, no_material_change, Confidence, Evidence)` with
  `event_count(0)`. `no_material_change` is an **assessment, not an event**, and
  never appears in any taxonomy table below.
- **Unknown / ungradable.** `no_material_change` is distinct from `unknown`:
  `unknown` means the evidence or analysis was **insufficient** to decide, so the
  bundle records `transition_assessment(PairId, unknown, Confidence, Evidence)`.
  Never coerce `unknown` into `no_material_change` or into a taxonomy label.
- **First frame.** The first frame has no predecessor and therefore produces
  **no** transition bundle and **no** adjacent-pair LLM call. Instead it persists
  a distinct durable boundary assessment,
  `frame_assessment(Frame0, initial_observation, no_predecessor, Evidence)` (or a
  normalized equivalent). This is **not** `no_material_change`, **not** a
  transition event, and **not** a positive or negative recurrence example; it may
  anchor induction context/rules that apply at sequence start. Do not fabricate an
  event or an empty transition for it.
- **Scope of the labels.** `no_material_change` is reserved exclusively for
  sufficiently compared frame *pairs*; `unknown` is for insufficient *pair*
  evidence; `initial_observation` is exclusively the first-frame boundary. Never
  substitute one for another.
- **Never force a label.** Neither the LLM (§7) nor a Prolog detector (§5) is
  ever forced to select a taxonomy type; both may return an empty event list plus
  a `no_material_change` or `unknown` assessment.
- **Value as negatives.** Empty / no-change / unknown pairs are valuable negative
  examples and counterexamples for FrameEvidence->Event detector induction and
  Event->Event transition induction (§5), but they **never** satisfy positive
  recurrence counts in a promotion gate (§6.3).

### 2.1 Visibility

| Predicate | Meaning | Notes |
| --- | --- | --- |
| `appeared` | Subject present in `t+1`, absent in `t`, not explained by entry at a border | distinct from `entered` |
| `entered` | Subject appears crossing an image border/edge | border evidence required |
| `missing` | Subject in `t` has no correspondence in `t+1` and no explanation | the honest default for unexplained disappearance |
| `exited` | Projected mask leaves the image bounds | requires projected-motion evidence, not mere absence |
| `reappeared` | A previously `missing`/occluded subject re-corresponds near its predicted continuation | strengthens a prior occlusion account |

`missing` never silently becomes `exited` or `occlusion_started`. Promotion to
`exited` requires the projected mask leaving the frame; promotion to
`occlusion_started` requires projected motion **plus** a visible occluder
overlapping the predicted pixels (§3).

### 2.2 Occlusion

| Predicate | Meaning |
| --- | --- |
| `occlusion_started` | Subject becomes missing/clipped while a visible occluder occupies its predicted pixels |
| `partial_occlusion` | Supported partial area loss with occluder overlap |
| `occlusion_continued` | An established occlusion persists across the next transition |
| `occlusion_ended` | Occluded subject reappears near predicted continuation (pairs with `reappeared`) |

### 2.3 Motion

| Predicate | Meaning |
| --- | --- |
| `moved` | Centroid/displacement beyond a configured threshold |
| `started_moving` | Transition from stationary to moving |
| `stopped` | Transition from moving to stationary |
| `turned` | Heading/orientation of the motion vector changed |
| `accelerated` | Speed increased beyond tolerance |
| `decelerated` | Speed decreased beyond tolerance |

`stationary` is a **state** (no displacement within tolerance), not listed as an
event.

### 2.4 Geometry

| Predicate | Meaning |
| --- | --- |
| `rotated` | Shape orientation changed without deformation |
| `scaled` | Uniform area/size change |
| `deformed` | Non-rigid boundary change |
| `shape_changed` | Canonical shape signature changed (catch-all when the specific transform is not resolved) |

### 2.5 Contact

| Predicate | Meaning |
| --- | --- |
| `attached` | Two subjects become joined under the existing strong-shared-edge / smooth-cutout attachment semantics |
| `detached` | Previously attached subjects separate |
| `contact_started` | Boundaries begin touching without full attachment |
| `contact_ended` | Touching boundaries separate |

### 2.6 Topology

| Predicate | Meaning |
| --- | --- |
| `entered_container` | Subject moves inside an enclosing region/group |
| `left_container` | Subject leaves an enclosure |
| `overlap_started` | Projected masks begin overlapping |
| `overlap_ended` | Overlap ceases |

### 2.7 Grouping

| Predicate | Meaning |
| --- | --- |
| `group_formed` | A new multi-member group is asserted |
| `group_dissolved` | An existing group ceases to exist |
| `split` | One subject/group becomes several |
| `merged` | Several subjects/groups become one |
| `member_added` | A member joins an existing group |
| `member_removed` | A member leaves an existing group |

### 2.8 Appearance

| Predicate | Meaning |
| --- | --- |
| `color_changed` | Dominant/member color changed |
| `area_changed` | Pixel area changed beyond tolerance without a shape transform |
| `hole_opened` | A new cutout/hole appears |
| `hole_closed` | An existing hole fills |

### 2.9 Multi-frame deductions (window > 1)

| Predicate | Meaning |
| --- | --- |
| `co_motion_started` | Two+ subjects begin moving together coherently |
| `co_motion_ended` | Coherent co-motion ceases |
| `collision` | Two subjects meet with a supported contact + motion-change signature |
| `bounce` | Post-collision reversal of motion |
| `following` | One subject tracks another's path with delay |
| `carried` | An attached subject co-moves inside/with a carrier |
| `blocked` | A moving subject stops against another without passing through |

Multi-frame predicates are aggregate deductions over base events; they are still
**deduction** when produced by an authored rule (§3), and become **induction**
targets only when the rule itself is discovered (§3.3).

---

### 2.10 Canonical relation-phase syntax (start / continue / end)

Every **lasting** relation is written with generic phase wrappers rather than
bespoke per-relation event names:

- `start(Relation)` when the relation becomes true;
- `continue(Relation)` while it remains observably true (when an explicit
  per-transition continuation record is useful);
- `end(Relation)` when it ceases.

Rules:

- **Directional relations preserve semantic argument order.** For occlusion the
  order is **occluder first, occluded second**: `occlude(Occluder, Occluded)`.
- **Symmetric relations use a deterministic canonical subject ordering** (e.g.
  sorted identifiers) so the same pair always yields the same term.
- **Instantaneous events stay direct terms** — `bounce(...)`, `split(...)`,
  `merged(...)`, `turned(...)`, or a one-time action — and are **not** wrapped in
  start/continue/end unless they explicitly open a duration. Phase wrappers
  around instantaneous events are invalid.
- **Phase records must reference an active episode/start ID.** An accepted
  `continue`/`end` must link to a live `start`; unmatched or duplicate phase
  records are invalid hypotheses/errors, never silently accepted. Episode IDs
  derive deterministically from relation + subjects + start entry, and
  start/continue/end entries all link that ID (§6.5).
- **Initial-frame relations are baseline state observations**, not fabricated
  starts (§2.0). **Never synthesize an `end`** merely because the sequence
  currently stops (§6.5).
- Apply the wrappers to every lasting relation: `occlude`, `contact`,
  `attached`, `contain`/`inside`, `overlap`, `move`/`co_move`, `blocked`,
  `follow`, movement phases, etc.

**Legacy mapping.** Prior names map onto these canonical terms in UI, docs, and
legacy adapters rather than keeping duplicate ontologies:
`occlusion_started -> start(occlude(Occluder, Occluded))`,
`occlusion_continued -> continue(occlude(...))`,
`occlusion_ended -> end(occlude(...))`, and similarly for the other lasting
families in §2.2–§2.7.

## 3. G-level occlusion and later oN aggregation

Occlusion is inferred at the **final G level first**, then aggregated to `oN`
objects only after oN composition exists (deferred; see `CODEX_TODO.md`).

1. For a tracked G observation, project its prior mask and centroid with the
   supported motion estimate.
2. Emit a directional
   `occluded_by(Frame, OccludedG, OccluderG, Confidence, Evidence)` candidate
   only when the G becomes missing or substantially clipped **while** another
   visible G occupies its predicted pixels/path with compatible depth/contour
   evidence.
3. Classify honestly: projected mask leaving the image = `exited`; no
   overlapping visible occluder = `missing`/unexplained; supported partial area
   loss with overlap = `partial_occlusion`.
4. Reappearance near the predicted continuation confirms/strengthens the
   account (`occlusion_ended` + `reappeared`) and preserves correspondence.
5. Keep **predictions separate from confirmed observations**; both remain
   replayable.

Once `oN` exists, aggregate member-G evidence to
`object_occluded_by(Frame, OccludedO, OccluderO, Evidence)`. Member groups of the
**same** oN represent **self-occlusion**, not object-object occlusion. Require
frame/mask/motion/overlap/direction provenance and signed contradictions. No
debug image is produced by any of this. Entire section: **deferred**.

---

## 4. oN composition (deferred, summarized)

An `oN` is **not** a one-to-one alias for a final `gN`. It is a higher-level
object composed of **at least two** final G groups. Prolog may infer an oN only
when attributable evidence proves **both**:

1. coherent cross-frame co-motion (compatible displacement/transform, stable
   relative arrangement), and
2. attachment under the existing strong-shared-edge or valid smooth-cutout
   semantics between the groups' member regions.

Co-motion alone is insufficient; attachment alone is insufficient; a lone
persistent G stays a G. Expected future facts: group motion/correspondence,
group attachment, and `object_at(Frame, oN, [G1,G2,...])` with
provenance/confidence. Stage: **deferred**.

---

## 5. Deduction vs induction: the arrow lifecycle

This is the central, nuanced distinction. **Do not call event composition under
an already-authored rule "induction."** Discovering the rule is induction;
applying a known rule is deduction.

### 5.1 Base-event deduction (frame evidence + authored rule -> event)

Applying authored Prolog detector rules to measurable frame evidence to emit a
deduced `frame_event(...)` is **deduction**. Example: an authored rule that maps
"centroid displacement > threshold" to `moved` deduces `moved`.

### 5.2 Two distinct induction problems

There are **two** separate learning (induction) problems. They must not be
conflated:

**(A) FrameEvidence -> Event detector induction** (`event_detector_induction`):
learn a NEW deterministic detector clause mapping measurable frame evidence to an
event type, from repeated labeled pairs plus their symbolic/pixel deltas and
counterexamples. Output: a variable-bearing candidate clause using approved
measurable predicates, with thresholds, context, and scope. This is how the
system learns to deduce base events without an LLM.

**(B) Event -> Event transition induction** (`event_transition_induction`,
historically the queued `event-rule-induction`): learn a NEW generalized
implication `E1 -> E2` from repeated `E1`-then-`E2` episodes plus
counterexamples — anti-unifying `action/contact/context -> later event/effect`,
learning preconditions, delay, probability, exceptions, and scope. This is
genuine temporal induction of the implication itself.

### 5.3 The Event->Event arrow lifecycle

1. **Deduce** base events from frame evidence with known rules (§5.1).
2. **Induce** a candidate transition rule `E1 -> E2` (possibly with context,
   delay, probability, exceptions) from repeated `E1`-then-`E2` episodes and
   counterexamples. This step is induction because the implication is being
   *discovered*.
3. Once **promoted**, observing `E1` and applying that learned rule to predict
   `E2` is **deduction/prediction**.
4. The actual `E2` outcome **confirms or contradicts** the rule and updates its
   confidence.

So `Event -> Event` is temporal **induction** when the implication is
discovered, and **deduction** when an already-known implication is applied.
Composition under an authored rule is deduction; discovering the composition
rule is induction.

### 5.4 Worked examples (labeled)

| Scenario | As a deduction (known rule) | As an induction target (learned) |
| --- | --- | --- |
| Constant motion | apply `moved` detector each pair | learn the displacement threshold/detector (A) |
| Attached co-moving groups | apply attachment + co-motion rules to assert `carried`/oN | learn that `attached + co_motion -> carried` (B) |
| Occlusion continuity | apply projected-mask occlusion rule to emit `occlusion_continued` | learn "`occlusion_started -> reappeared` after N frames" (B) |
| Blocking | apply `blocked` rule when motion stops against another | learn `contact_started -> stopped` for a mover class (B) |
| Bounce | apply authored `collision -> bounce` rule | learn `collision -> bounce` from repeated episodes (B) |
| Push / carry | apply `contact_started -> moved` rule to the pushed subject | learn `contact_started -> pushed/moved` (B) |
| Container hiding | apply `entered_container -> hidden` rule | learn `entered_container -> hidden` (B) |
| Action-caused movement | apply authored `action -> movement` rule | learn `action event -> movement event` (B) |
| Split / merge | apply grouping-delta detector to emit `split`/`merged` | learn the delta detector from labeled pairs (A) |
| Oscillation | apply `turned`/reversal rule over a window | learn the periodic transition rule (B) |
| Transformation | apply `shape_changed` detector | learn a `rotated`/`scaled` detector from deltas (A) |
| Grouping templates | apply current-frame exact/shape-analogy acceptance (implemented for gN) | learn cross-frame grouping templates (deferred) |
| Background behavior | apply exterior-background rule (implemented) | learn background stability rules (deferred) |

---

### 5.5 Worked acceptance scenario: frame 4 -> 5 avatar/star occlusion

This is a documented **acceptance scenario** for the temporal, LLM, and detector
work. Frame 4 -> 5 carries an authoritative exogenous user action `up_arrow`
(`action1`, §6.7). The player-avatar final G moves upward, contacts the star G,
rotates, and occupies/occludes the star's pixels. The rotated avatar now visually
resembles the star/another G, so naive pixel/shape nearest-neighbor matching
would **swap** correspondences.

Required reasoning at the transition:

- **Retain frame-qualified identities** (`g3@frame4`, etc.); never rely on alias
  equality across frames.
- **Action-conditioned motion** predicts the avatar's destination/transform from
  `action1/up`.
- Deduce/record `moved`, `start(contact(...))`, `rotated`, and
  `start(occlude(player1, star1))` (occluder = avatar, occluded = star) when
  overlap/depth evidence supports it.
- **Assign the visible rotated observation to the avatar continuation** using
  action + trajectory + contact/topology evidence, even when its appearance is
  closer to the prior star.
- Permit the star to have **no visible successor** and remain occluded/missing
  rather than assigning the same visible observation to two subjects. Use
  **globally one-to-one** correspondence and retain ambiguity/confidence.
- Only confirm occlusion vs collection/disappearance with sufficient current or
  later evidence (e.g. reappearance closes the occlusion). Do not make one-frame
  LLM language authoritative.

Canonical entries (§2.10, §6.4): frame 5 transition records
`start(occlude(player1, star1))`; frame 6 transition records
`end(occlude(player1, star1))` **only** with measurable loss of projected
overlap/occluder occupancy plus normally star reappearance or other closing
evidence, recording `reappear(star1)` separately if deduced.

Labeling: applying authored motion/contact/occlusion rules here is **deduction**.
Learning "`action(up) + contact -> rotate/occlude`" from repeated analogous
episodes is an **induction target**; one episode is a candidate example only. The
LLM pair deduction receives `action1/up`, both frames, Turtle, and V/W/G facts and
may propose this account; a promoted Prolog detector/correspondence must
ultimately reproduce it from measurable evidence.

Planned regressions: appearance-induced identity swap, action-conditioned
correction, one-to-one assignment, hidden star, rotation, later reappearance vs
permanent collection, and contradiction handling.

## 6. Durable fact shapes, IDs, provenance, promotion

### 6.1 Events

Deduced events are immutable, content-addressed runtime facts:

```
frame_event(EventId, FromFrame, ToFrame, Type, Subjects, Confidence, Evidence)
```

plus typed detail facts as needed. `EventId` is deterministic from input
artifact hashes + normalized event payload + detector version. Events belong to
real filesystem/runtime artifacts under the lifecycle-first `runtime/` layout
and replay idempotently. Predictions are stored separately from confirmations.

### 6.2 Durable Candidate Rule Store (required foundation)

Both induction problems (§5.2 A and B) **must persist every candidate before
evaluation/promotion**. Browser/page state or a transient in-memory RuleStore is
**not sufficient**. Requirements:

- **Location**: generated candidates live under a runtime rule-candidate family
  (`runtime/<candidate-family>/`); promoted authored/effective rules remain a
  distinct design/policy/source resource. Never overwrite or delete candidates
  on rejection/demotion/promotion. Store immutable/versioned records plus an
  append-only evidence/status history.
- **One normalized schema** for Prolog- and LLM-proposed candidates, with at
  least:
  - deterministic candidate ID derived from normalized clause + rule kind +
    scope + schema/inducer version;
  - rule kind: `event_detector` (A) or `event_transition` (B);
  - variable-bearing clause / body / head;
  - scope / context / delay / thresholds / exceptions;
  - source: `prolog_induction` or `llm_proposal`;
  - exact prompt / raw-output artifact refs when applicable;
  - supporting event/pair IDs;
  - contradicting IDs;
  - training and held-out metrics;
  - assumptions / critiques;
  - confidence / probability and its source;
  - lifecycle status: `proposed`, `eligible`, `promoted`, `rejected`,
    `demoted`;
  - parent / derived candidate refs;
  - exact code/data provenance and content hashes.
- **Deduplication**: equivalent normalized candidates deduplicate to one
  identity while accumulating distinct evidence idempotently through a single
  writer / checkpoint path (mirrors the existing single-writer conventions).
- **Promotion**: creates or references a promoted rule but leaves the candidate
  and full history inspectable. Demotion remains possible as contradictions
  arrive; the candidate is never destroyed.
- **UI / API**: a filesystem-backed list + source-inspector surface so
  candidates can be listed and traced; no mocks.

Stage: **deferred** foundation, to be built before either induction stage runs.

### 6.3 Promotion gate

Default gate reuses the existing recurrence principle: at least **two distinct
real event transitions / independent supporting pairs**, plus configured
confidence and no unresolved contradiction, plus satisfactory deterministic
replay / held-out agreement for detector candidates. A promoted Prolog detector
may then deduce `frame_event` facts without an LLM. LLM labels are retained for
audit and future grading.

### 6.4 Canonical Visual Sequence Event Log

Every Visual Sequence has one **canonical, ordered, append-only Event Log** built
from the first frame onward. It is the authoritative timeline; the UI and
induction stages read from it.

**Entries, in canonical order:**

1. **First entry** — the first-frame boundary assessment
   `frame_assessment(Frame0, initial_observation, no_predecessor, Evidence)` with
   baseline state/entity references. Not a transition, not `no_material_change`.
2. **One transition-assessment entry per subsequent adjacent pair** — exactly one
   `transition_assessment(PairId, Assessment, Confidence, Evidence)` for every
   `Frame(t)->Frame(t+1)`, **even when** `events == []` and the assessment is
   `no_material_change` or `unknown` (§2.0).
3. **Zero or more authoritative event records per pair** — SWI-Prolog-deduced
   `frame_event(...)` records (§6.1) linked to that pair's transition entry.

**Content policy (selected):** the canonical log holds **frame assessments +
Prolog-deduced events only**. LLM hypotheses are stored in a **separate, linked
hypothesis channel/namespace** keyed to the same frame-pair / log entry. The UI
may compare them side by side, but an LLM hypothesis **never** becomes a canonical
log entry unless a **promoted Prolog detector** (§6.3) deduces the same event.

### 6.5 Durable episodes (tracking when things end)

Lasting conditions are modelled as durable **episodes** rather than by rewriting
history:

```
episode_started(EpisodeId, Type, Subjects, Frame, Evidence)
episode_continued(EpisodeId, Frame, Evidence)          % optional, repeatable
episode_ended(EpisodeId, Frame, Outcome/Reason, Evidence)
```

Open/closed state, duration, and active-at-frame queries are **derived** from
these records, never stored as mutable flags. Occlusion start/continue/end,
contact, attachment, movement phases, containment, and other lasting conditions
all use this same contract.

**Never fake an end at the currently last frame.** An episode with no closing
record is reported as `open_at_sequence_end` / `currently_open` until an actual
closing event or an explicit finalization exists. When a later frame is appended
that closes it, the closing `episode_ended` record is appended then — history is
not backdated.

### 6.6 Integrity, ordering, and supersession

- **Deterministic content IDs** for every entry plus a **canonical sequence
  order**; entries carry a previous-entry reference / **hash-chain** (or
  equivalent) for integrity.
- **Single-writer atomic append / checkpoints**; **idempotent replay** so
  re-running yields the same log.
- **Full provenance**: exact frame, artifact, rule, and evidence references per
  entry.
- **Supersession, not mutation.** If an earlier frame, input, or rule changes,
  the affected **suffix** is invalidated/superseded via a new version/generation;
  historical evidence is never mutated in place.
- **Visible rejection** of gaps, forks, out-of-order appends, and mismatched
  predecessors.
- **Queries** expose chronological event-log/timeline views, active episodes,
  start/end links, and source inspection — all from real backend data, no mocks.

Stage: **deferred**. Planned tests: initial entry; empty pair; unknown pair;
episode start/continue/end; still-open tail (`open_at_sequence_end`); a later
appended frame closing an episode; restart/idempotence; stale-suffix
supersession; fork/gap/out-of-order rejection; and LLM-channel separation from
canonical entries.

---

### 6.7 Game user actions (exogenous events)

Game recordings carry per-frame **user-action metadata** associated with a
transition. This is a **canonical, authoritative EXOGENOUS event** — distinct
from deduced visual events and from LLM hypotheses.

```
user_action(ActionEventId, Actor, ActionType, Payload, SourceFrame, TargetFrame, Provenance)
```

- **Direction is resolved, never guessed.** Whether the action on frame N means
  `N -> N+1` or `N-1 -> N` is read from explicit recording metadata / the
  provider contract and normalized to the real source/target pair. Missing or
  ambiguous direction is a **visible unresolvable / unknown-action** condition,
  never a guess.
- **Retain exact + normalized forms.** Store the raw action payload plus the
  normalized symbolic form, timestamp/order, recording source, and content hash.
  Support compound/simultaneous inputs when the source format allows them.
- **Reference, don't duplicate.** Transition/event entries reference the
  `ActionEventId` rather than copying it into unrelated context fields.
- **The transition links** source frame/state + `user_action` -> target
  frame/state + zero or more deduced visual events. This enables induction of
  `ActionEvent/context -> Event/effect` rules (a distinct induction input from
  Event -> Event, §5.2).
- **LLM usage.** The exact action event is included in LLM pair prompts and in
  candidate-rule provenance, but the LLM must **never rewrite** the authoritative
  action.
- **Boundaries.** Non-game Visual Sequences may have **no action channel** and
  must work. Initial/last actions with no recorded counterpart remain explicit
  **unpaired/boundary** records per the declared direction, not fabricated
  transitions. Invalid target references **fail visibly**.

Planned tests: incoming vs outgoing metadata direction, no-guessing, exact/raw
normalization, compound action, non-game absence, boundary action, LLM prompt
inclusion, and action-to-event induction.

## 7. LLM-assisted deduction and induction stages

These stages introduce LLM reasoning between frames while deterministic
temporal/oN work stays deferred. Each is a separately committed change. All are
currently **deferred/planned**.

### 7.1 `llm_event_deduction_0` — UI label "Deduce events (LLM)"

- Enumerate **adjacent pairs only** for an **ordered** Visual Sequence.
  Single-image or unordered sequences produce **zero** pair TODOs.
- **No call on load or URL/nav restoration.** A confirmed batch action stamps
  one filesystem-backed TODO per pair. The confirmation shows exact pair/call
  count, selected effective vision model/backend, that images leave the app
  boundary, and estimated/known cost fields; supports First N / range limits and
  the existing >800 Visual Sequence safety gate plus a second exact call-count
  confirmation.
- Each idempotent call is keyed by **before + after content hashes + exact
  prompt/schema version + model/backend**. It sends both images plus available
  V/W/G facts/diffs, clearly separating machine facts from the question.
- Persist exact prompt, model, raw response, parsed result, errors,
  latency/usage, and provenance.
- Canonical structured output: a per-pair assessment plus a (possibly **empty**)
  list of event hypotheses. Each hypothesis has a taxonomy type (or explicit
  `unknown`), subjects, before/after evidence, confidence, and natural-language
  rationale. The schema **must** allow `events: []` together with an assessment
  of `no_material_change` (evidence shows nothing material changed) or `unknown`
  (insufficient evidence); the model is **never forced** to pick a taxonomy
  label. Invalid/unknown results remain visible hypotheses/errors — **never
  silently coerced** into `frame_event` or into `no_material_change`. No debug
  image.
- Output predicate: `llm_event_hypothesis(...)` (silver label, never
  authoritative), always accompanied by the pair's `transition_assessment`
  (§2.0).

### 7.2 `llm_event_induction_0` — UI label "Induce rules (LLM)"

- Explicit/manual confirmed action over **at least two** completed consecutive
  pair-hypothesis bundles; disabled until enough completed pair deductions
  exist.
- Asks the LLM to generalize `Event -> Event` / context transition candidates,
  including variables, preconditions, delay, effects, exceptions, scope,
  examples/counterexamples, assumptions, and critiques.
- Persists exact prompt and raw output; normalizes **every valid proposal into
  the Candidate Rule Store (§6.2) before evaluation**.
- It may **never** install/execute raw generated Prolog, create authoritative
  events, or bypass later evidence/held-out promotion gates.

### 7.3 `event_detector_induction_0` (automatic, Prolog)

- Uses repeated LLM-labeled pairs plus their measurable symbolic/pixel deltas
  and counterexamples to propose NEW Prolog detector candidates mapping
  `FrameEvidence -> Event` (problem A). Candidate clauses must use approved
  measurable predicates, variables, context, thresholds, scope, supporting pair
  IDs, contradictions, and held-out results.
- **Never executes arbitrary raw LLM-supplied Prolog as trusted code.**
  Candidates are stored first and only a promoted detector deduces events.

### 7.4 Compare view

The UI compares, per pair, the LLM hypotheses against Prolog deductions with
honest agreement / disagreement / uncovered labels. Before Prolog events exist,
show a pending/unavailable state rather than implying coverage.

### 7.5 Two-band layout (implemented)

The Video Import extraction row uses two independent bands (shipped 2026-09-09):
the **top visual/group band** holds the visual content including the V/W/G tree
and the grouping/turtle overlays; the **bottom text/status band** holds the
per-transform status/controls. The bands are independent horizontal scrollers and
are **not** forcibly aligned or scroll-synchronized. The LLM Deduce/Induce
controls and per-pair compare view (§7.1–§7.4) attach to this same bottom band
when those stages land.

### 7.6 Reused prior art

Reuse effective vision-model selection, the prompt/result cache, the TODO /
pooler, evidence records, the rule store, and the source inspector. The existing
`Induce (LLM)` control is migrated/clarified to state which stage it invokes
rather than duplicated.

---

### 7.7 Canonical-term LLM output contract

Both LLM stages speak the **same canonical term vocabulary** as the Prolog/event
docs (§2.10): phase-wrapped lasting relations such as
`start(occlude(player1, star1))`, `continue(...)`, `end(...)`, or direct
instantaneous terms such as `rotated(player1)` / `bounce(...)`. For the frame
5/6 example the expected form is `start` then `end` of
`occlude(occluder, occluded)`.

- **Never execute or consult arbitrary LLM text as Prolog.** The response is a
  strict structured object containing a typed/allowlisted event AST plus a
  canonical rendered-term field, e.g.
  `{phase:"start", relation:"occlude", arguments:["player1","star1"],
  canonicalTerm:"start(occlude(player1, star1))", confidence:..., evidence:...,
  rationale:...}`.
- **Validation** checks balanced grammar, allowlisted phase/relation/arity,
  argument order/types, and identifiers against the supplied frame
  entity/group table. Reject invented identifiers, code/directives/operators,
  unmatched `end`/`continue`, malformed terms, and phase wrappers around
  instantaneous events. Retain the raw response and the validation errors.
- **No change / unknown.** Require `events: []` plus a `no_material_change`
  assessment for a sufficiently-compared unchanged pair; use `unknown` for
  insufficient evidence — never an invented event (§2.0).
- **Non-authoritative.** LLM hypotheses remain non-authoritative even when valid.
  The UI shows the canonical term prominently and the natural-language rationale
  secondarily.
- **Induction terms.** `Induce rules (LLM)` uses the same canonical terms in
  normalized candidate antecedent/consequent ASTs (e.g. Event -> Event), with
  variables only in validated rule positions. Candidates are stored (§6.2) and
  **never** executed as raw generated code.

Planned tests: start/continue/end, direct events, no-change, unknown, invented
IDs, wrong argument direction, invalid code, and candidate-rule term
normalization.

## 8. Current vs deferred status summary

| Capability | Stage |
| --- | --- |
| Per-frame measurable evidence (rN/vN/wN/gN, geometry, small marks) | implemented |
| Deterministic observation identities (frame/region/V/W/G) | implemented |
| Two-band visual/text extraction row layout (§7.5) | implemented |
| Canonical relation-phase syntax (start/continue/end) (§2.10) | deferred (design fixed) |
| Pairwise temporal correspondence measurements | deferred |
| G-level projected-motion occlusion | deferred |
| oN composition + object-level occlusion aggregation | deferred |
| `frame_event` deterministic detectors | deferred |
| Canonical Visual Sequence Event Log + episodes (§6.4–§6.6) | deferred |
| Game user-action exogenous events (§6.7) | deferred |
| Durable Candidate Rule Store | deferred (foundation) |
| `llm_event_deduction_0` (Deduce events LLM) | deferred |
| `llm_event_induction_0` (Induce rules LLM) | deferred |
| `event_detector_induction_0` (FrameEvidence->Event) | deferred |
| `event_transition_induction` (Event->Event) | deferred |
| Grouping learning / cross-sequence promotion | deferred |
| Preprocessing step stack (§8.1) | implemented in the takeover workspace; integration recorded in CODEX_TODO.md |

### 8.1 Preprocessing step stack

The Video Import extraction controls provide a compact **ordered stack of
preprocessing step rows** with schema-driven parameter editors, scoped to all
submitted items in the current Visual Sequence. Key points:

The implementation uses `/preprocessing-chain` for atomic per-sequence saves,
`/preprocessing-frames` for paged input references, `/preprocessing-preview` for
the selected frame's draft chain, and `/preprocessing-input` for browser model
inputs. Original and intermediate pixels are preserved. Final variants include
`image_preprocessing_0` provenance, implementation/dependency versions, and
bidirectional pixel-edge coordinate maps. Native source watching runs outside
HTTP workers so unrelated runtime writes cannot stall catalog requests.
Filter skills opt into preprocessing with a deterministic `preprocessing`
metadata contract (`geometry: identity` or `scale`); unsupported geometric
effects remain unavailable rather than claiming an incorrect coordinate map.
Changes mark queued/completed results stale without starting a new run.
The original-image path remains separate from the effective input signature.

- **Unlimited** step count (no maximum, no silent truncation); rows stay
  compact/collapsible and virtualize/scroll as needed.
- Each row has a stable step ID, an implementation selector from a real
  preprocessing registry, enabled/state (when consistent), schema-driven
  parameters, a remove control, and accessible reorder/drag controls. Duplicate
  implementations are allowed when meaningful.
- `Original Pixels` is a selectable/removable **no-op/pass-through**
  implementation, not a fixed anchor or a reset; an **empty stack also resolves
  to original pixels** without needless byte duplication. Other initial registry
  choices include Denoise and experimental `scale_3x_nearest` (deterministic 3x
  nearest-neighbor); the UI is **not** hard-coded to only these.
- Persist the ordered chain + params **per Visual Sequence**; derive deterministic
  chain/step identities from source hash + ordered implementation/version/config;
  cache filesystem-backed intermediate artifacts; and send the **final** variant
  to **both** OpenCV parts extraction and **all** LLM image consumers (same
  variant hash). Downstream TODO dependencies/cache keys include the preprocessing
  implementation/config/version and input hash.
- Changing/reordering/removing a step creates or stales the correct downstream
  lineage **without auto-running work**; Add/Merge/Fresh/explicit LLM starts do
  the work under existing safeguards. Preserve the original input byte-for-byte
  and carry exact coordinate transforms/provenance through every step so
  areas/lengths/centroids/polygons/pixel runs and highlight overlays map back to
  original-image coordinates. The derived input is **not** a debug image.
- **Reuse the existing Video Import Filters registry/library.** Populate every
  step combo from the existing Filters registry and reuse its real filter IDs,
  implementations, parameter schemas/editors, validation, previews,
  materialization, serialization, and saved-chain conventions. Do **not** create
  a parallel preprocessing registry or duplicate denoise/scale code. `Denoise`,
  `scale_3x_nearest`, and future options must be existing registered filters; if a
  needed implementation is absent, add it **once** to the canonical Filters
  registry so Frames & Filters and PREPROCESSING share the same resource. Only
  **deterministic, materializable** filters (those producing a materialized image
  artifact) may feed OpenCV/LLMs; exclude/disable UI-only probes or
  non-materializable filters with an explicit reason.
- The stack is effectively a **selected reusable filter chain** scoped to all
  submitted items in the current Visual Sequence. Reuse the existing filter-chain
  ordering and parameter data shape rather than defining a new one. Persist
  canonical filter refs/version/config and materialize/cache through the existing
  filter pipeline; the exact final filtered artifact feeds both OpenCV and LLMs.
- **Initial state.** Two visible stack slots appear initially, in order, both
  displaying/selecting `Original Pixels`. `Original Pixels` **is** the
  disabled/no-op/pass-through state — there is **no** separate enabled checkbox,
  and a no-op slot hides/disables its parameters and materializes **no** file. The
  intended experiment is for the user to change slot 1 to registered
  `3x nearest-neighbor` and slot 2 to registered `DeNoise` (producing
  `3x -> DeNoise` order); neither is active by default. Slots remain
  removable/reorderable and users may add unlimited more; removing both yields the
  same original-pixels identity chain. Changing a slot back to `Original Pixels`
  removes its contribution from the effective chain/cache identity while
  preserving only appropriate UI draft parameters per existing form conventions.
- **Per-row actions.** Every step row exposes compact, accessible `+ before`,
  `+ after`, and `remove` actions (icons with labels/tooltips/ARIA, keyboard
  operable). Inserting before/after any row creates a new stable-ID slot at that
  exact position, initially `Original Pixels` (no-op). Removing any row is allowed,
  including either initial row; an empty stack is valid and means original pixels.
  Preserve existing step IDs/config/params when inserting, deleting, or
  reordering — **identity must never be based only on list index**. These edits
  update the draft/effective chain and stale the cache lineage correctly but
  **never auto-run** downstream processing or LLM calls.
- **Collapsed banner.** The expanded editor collapses into ONE compact banner
  that lists the complete ordered chain horizontally as step chips with
  arrow/separator flow, e.g. `Original Pixels -> 3x nearest -> DeNoise(...)`. It
  includes the no-op `Original Pixels` slots (styled muted) so the banner
  truthfully reflects the saved stack, plus concise parameter summaries,
  dirty/error/stale markers, and final-output identity/status. Unlimited chains
  scroll **horizontally** in the banner (no vertical wrap, no silent truncation).
  Clicking the banner/disclosure expands the full editor; clicking a step chip may
  expand and focus that stable step. Collapsed/expanded state persists through the
  existing per-Visual-Sequence UI state conventions, with accessible disclosure
  semantics and keyboard controls. The expanded-only add-before/add-after/remove/
  parameter controls need not crowd the collapsed banner.
- **Preview frame.** A `Preview frame` selector sourced from real items in the
  current Visual Sequence runs the **selected frame alone** through the current
  draft chain to show original vs final-result preview (and optionally the focused
  intermediate step when a chip/row is selected) **without** stamping/running the
  full sequence's TODOs or changing submitted-item selection. It reuses the
  existing Filters preview/materialization engine, caching by frame content hash +
  draft chain identity; cancels/debounces stale preview work when
  frame/params/order change; surfaces errors; and never silently substitutes
  another frame. The preview-frame choice persists per Visual Sequence as **UI
  state, not processing identity**. Very large sequences use lazy/virtualized
  searchable frame selection (no loading all images before previewing). Show the
  exact frame key/source and active chain/step provenance; previews retain
  nearest-neighbor/coordinate/highlight correctness. The collapsed banner may show
  the selected preview frame concisely but stays compact.
- **Disclosure layout.** The horizontal chain banner is the always-visible
  disclosure header. BOTH the full step-stack editor AND the Preview
  frame selector / original-vs-result preview live **underneath** that banner
  inside its collapsible details region. Collapsing the banner hides the editor and
  all preview content, reclaiming vertical space (zero hidden-content layout
  height); nothing preview-related stays visible outside/beside the collapsed
  banner. Preview state/cache is preserved while collapsed unless invalidated by
  source/chain changes. Use one accessible disclosure relationship with correct
  focus return.
- Planned tests also cover: expanded/collapsed visibility of editor + preview,
  focus return, state preservation while collapsed, and zero hidden-content layout
  height.

### 8.2 Planned tests (deferred stages)

When the deferred stages land, each must ship deterministic, mocked-boundary
tests (no live network) covering at least:

- **Unchanged pair** — sufficient evidence, `events: []`,
  `transition_assessment(..., no_material_change, ...)`, `event_count(0)`.
- **Unknown pair** — insufficient evidence yields `unknown`, never coerced to
  `no_material_change` or a taxonomy label.
- **First frame** — no predecessor, so no transition bundle and no adjacent-pair
  LLM call; a distinct `frame_assessment(Frame0, initial_observation,
  no_predecessor, Evidence)` is persisted and is neither a positive nor a negative
  recurrence example.
- **Induction-negative** — no-change/unknown pairs are retained as
  negatives/counterexamples and do **not** count toward positive recurrence in
  detector (§5.2 A) or transition (§5.2 B) promotion gates.
- Pair enumeration (adjacent-only, ordered), no-call-before-confirm, idempotent
  cache key, invalid-schema rejection, and candidate persistence with no
  automatic promotion (§6, §7).

This document is design-only. No predicate here is emitted by the running system
until its row above reads `implemented`.
