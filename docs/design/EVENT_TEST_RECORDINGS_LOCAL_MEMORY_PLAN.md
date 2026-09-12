# Event recordings: local-memory detection and induction plan

Status: **plan, not implemented by this document**. Updated 2026-09-12.

This plan covers every one of the 38 existing recordings in
`data\omega_vision\recordings\events_tests`, and proposes additional induction
recordings for pressure plates and pushing objects. It does not change the
recordings, their expected outcomes, saved preferences, running services or rules.

The central idea is simple: **remember what was actually observed, compare the
next observation against that memory, and retain the evidence for any event
claimed**. Memory supplies history; it does not supply an answer from a test label.

## 1. Meaning of local memory

Local means **the current recording's frame history and level STM**, within the
one shared Omega store. It does not mean a workspace-owned store, a new sequence
family, or unrestricted access to all other recordings.

For a case such as `moved`, the relevant layout is:

```text
data\omega_vision\recordings\events_tests\
  moved\
    recording.json
    expected_events.json                 test oracle; not a detector input
    memory_level_1_stm\                  recording-local accepted memory/rules
    0\
      image.png
      state.json
      memory\
        shapes_db.metta
        objects_db.metta
    1\
      image.png
      state.json
      memory\
        shapes_db.metta
        objects_db.metta
        induced_rules.metta              only if an induction proposal exists
        abduced_events.metta             only if a supported abduction ran
```

This is the intended write layout, not a request to pre-create empty databases.
Level `1` comes from these recordings' actual metadata. Existing temporal,
object and event checkpoints and the canonical event log remain in their
existing resolver-controlled locations under `data\omega_vision`; do not invent
an `events_db.metta` or duplicate the canonical log in the Shape/Object databases.

| Memory/evidence source | What it supplies to detection | Boundary |
|---|---|---|
| Previous frame's `shapes_db.metta` | Shape signature, observed mask/contour references, geometric comparisons | A shape match is not proof of object identity. Keep full-resolution evidence references. |
| Previous frame's `objects_db.metta` | Available object observations and stable identity references | Preserve actual G-track versus O identity types. A tracked visual group is not automatically a persistent Object. |
| Validated temporal checkpoint | Correspondences, last observed position, visibility, ambiguity, earlier displacement | Predictions and unobserved geometry remain marked inferred. |
| Event checkpoint and canonical log prefix | Previous motion state, measured relations, active episodes, earlier confirmed events | Read only the validated prefix; do not infer false from missing evidence. |
| Recording's `memory_level_1_stm` | Eligible earlier memory and explicitly accepted rules, with evidence/version references | Apply sequence, level, frame and publication cutoffs. No implicit union with another recording or shared LTM. |
| Current image and acquisition metadata | New measured observations, dimensions, frame order, actual sampling time and any real recorded input | These are current inputs, not historical memory or event labels. |
| Current frame's memory | New observations, proposals and hypotheses produced at this frame | Write after the historical read context is frozen; never use the current write to confirm itself. |

Extra histories proposed below, such as heading windows, membership versions,
plate-state episodes and prediction obligations, need typed producer/reader
contracts. Reuse existing checkpoints where supported. Do not put arbitrary new
payload types into `objects_db.metta` to bypass the pending group/class schemas.

### No answer leakage

The detector must not read `expected_events.json`, `suite.json` case labels,
`authoredObjects`, `authoredAnnotations`, sprite IDs from the generator, or the
recording name to decide an event. Those belong to the evaluator. Runtime entity
IDs are produced independently and aligned with oracle entities only for scoring.

All existing miniature recordings contain only generic `FRAME` advances, not
actual pressure, force or gameplay commands. Their annotated intentions are not
recorded actions. In particular, the `blocked` case cannot prove attempted motion
by reading its oracle's `user_input` annotation.

## 2. Frame-by-frame algorithm

1. Resolve the actual recording and its explicit manifest order. For these cases
   the baseline is numbered frame `0`; there is no extra root `image` frame.
2. At frame `0`, extract visible evidence and establish an initial observation.
   Save its Shape/Object observations where authorized. Record measurable
   relations as initial baselines, not fabricated `start(...)` events. A single
   still frame does not establish stationary velocity or absence before time zero.
3. At each frame `t > 0`, freeze the eligible memory view: the exact predecessor,
   required earlier checkpoints and log prefix, and recording-level STM entries
   published strictly before `t`. Reject stale hashes, ordering gaps and forks.
4. Extract the current image without consulting the oracle. Match observations
   to remembered identities; retain alternative correspondences when ambiguous.
5. Measure the relevant differences: displacement, shape transform, appearance,
   topology, visibility, or a multi-frame trajectory/relationship change.
6. Apply accepted detectors to measured evidence plus eligible memory. Produce
   a transition assessment with zero or more events. A complete unchanged pair
   may be `no_material_change`; insufficient evidence remains `unknown`.
7. Update relation episodes using three-valued truth: true, false or unknown.
   `start` needs an established false-to-true transition; `continue` and `end`
   need the same active episode or explicitly supported initial-boundary anchor.
   Unknown does not close an episode. Symmetric subjects are canonically ordered;
   directed roles such as occluder/occluded retain their order.
8. Commit current evidence and the new checkpoint/log bundle with source hashes,
   stable IDs, detector/rule version and evidence-frame references. Write only to
   the selected authorized destination; do not change Save To or Look In.
9. Induction may propose a rule from eligible examples. It does not turn its own
   prediction into evidence. Abduction may explain an observed effect, but its
   assumptions stay separate from detected events.

For a velocity-derived event, use verified acquisition times; the fixtures
provide `state.json` `at_seconds`. Their fixed `recorded_at` is a synthetic
fixture clock and must not be used to calculate velocity. If timing is unavailable,
report per-frame displacement rather than inventing pixels-per-second values.

### Evidence time versus decision time

Record when an interaction was observed separately from when enough evidence
became available to classify it. A collision at frame `1` may only become
supported when recoil is observed at `2`. Do not rewrite frame `1` as though it
already knew frame `2`. Until an explicit retrospective event contract exists,
emit the supported deduction in frame `2` with references to the earlier contact.

## 3. Plan for each existing recording

The frame numbers below describe the current recordings. They identify intended
tests, not a promise that today's detector emits the label. Additional evidence
or versioned warm-up recordings are called out explicitly.

### 3.1 Visibility

| Recording | Local memory required | Detection and earliest evidence | Withhold or distinguish |
|---|---|---|---|
| `appeared` | Frame `0`'s complete empty interior, viewport and visibility coverage | At `1`, establish a new visible observation in the interior and rule out border entry within the observed interval; preserve it at `2` | Does not prove physical creation or absence before frame `0`. Current unmatched-visible handling is not already an `appeared` detector. |
| `entered` | Earlier viewport coverage, clipped silhouette and emerging track history | At `1` observe a strip on the left boundary; `2` and `3` support inward continuity. A conservative entry classification can wait for `2` | Do not read the oracle's off-screen position at `0`. Border first-visibility without motion support remains ambiguous. |
| `missing` | Frame `0`'s actor identity, last visible mask/position and complete current comparison | At `1` fail to find the actor; retain its last-observed record through `2` rather than deleting the identity | No supported exit or occluder explanation; missing is not destruction. |
| `exited` | Positions/masks from `0`, `1`, `2`, viewport bounds and prior velocity | At `3`, projected continuation crosses the right boundary and the actor is no longer visible | Absence alone is insufficient. Preserve the last visible observation and the projection proof. |
| `reappeared` | Frame `0`'s appearance/identity, missing status at `1`, last-position uncertainty | At `2`, independently match the returning observation to the missing track; continue it at `3` | Same color or reused fixture name is not sufficient when several tracks match. Do not retroactively label the gap as proven occlusion. |

### 3.2 Motion and multi-frame response

| Recording | Local memory required | Detection and earliest evidence | Withhold or distinguish |
|---|---|---|---|
| `moved` | Previous matched observation, centroid/mask and transform tolerance | At `1`, measure displacement `(4, 0)` against frame `0` and deduce `moved` | This does not by itself prove movement *started*; prior velocity is unknown. |
| `turned` | Two successive displacements and their times | At `2`, compare `(4, 0)` from `0 -> 1` with `(0, 4)` from `1 -> 2`; retain the downward continuation at `3` | Distinguish path heading from rotation of an asymmetric sprite; ignore heading when speed is below tolerance. |
| `accelerated` | Positions/times at `0`, `1`, `2`, and the previous speed | At `2`, speed increases from 2 to 4 pixels per second | Reject a change caused only by unequal sample intervals, camera motion or identity mismatch. |
| `decelerated` | The same three-frame speed history | At `2`, speed falls from 4 to 2 pixels per second | A smaller displacement is not slower speed without timing evidence. |
| `bounce` | Actor's approach vector, wall geometry/contact at `1`, current outgoing vector | At `2`, detect reversal after contact; `3` supports persistence | Memory must preserve the contact and pre-impact direction. A stop, voluntary turn or contact alone is not a bounce. |
| `collision` | Both approach vectors, shared boundary at `1`, both recoil vectors at `2` | Confirm no earlier than `2`, citing contact at `1` and motion response at `2` | The current oracle targets `1`; that is contact time, not causal confirmation time. Preserve the fixture and plan an explicit timing correction/version. |

### 3.3 Geometry and appearance

| Recording | Local memory required | Detection and earliest evidence | Withhold or distinguish |
|---|---|---|---|
| `rotated` | Previous asymmetric L mask, orientation and matched identity | At `1`, fit the 90-degree rigid transform and verify equal area/color | Shape symmetry can make angle unknowable; do not manufacture a rotation for a symmetric square. |
| `scaled` | Previous contour/mask, center, dimensions and identity | At `1`, fit uniform scaling from 6x6 to 10x10 about the same center | A changed bounding box alone is not enough; partial occlusion and nonuniform stretch must be excluded. |
| `deformed` | Previous contour, area and aspect ratio | At `1`, compare 6x6 with 12x3: area remains 36 but horizontal/vertical scales differ | This is a nonuniform shape change, not uniform scale. Retain measured transform alternatives. |
| `shape_changed` | Previous canonical mask/shape reference and identity | At `1`, the 20-pixel L becomes a 20-pixel cross, with no fitting rigid transform | Do not substitute a new-object explanation unless correspondence is genuinely unresolved. |
| `color_changed` | Prior appearance attached to the observation/identity, separate from the colorless Shape key | At `1`, geometry and placement stay fixed while blue becomes red | Do not change object identity simply because color changed, or make Shape identity color-dependent. |
| `area_changed` | Previous occupied-pixel count, contour and visibility completeness | At `1`, area changes from 64 to 66 via a boundary protrusion | Require exact-resolution measurements/tolerance that retain the two-pixel change. Do not count clipping or uniform scale as this case's intended explanation. |
| `hole_opened` | Previous enclosing contour, interior components and holes | At `1`, one interior hole appears while the outer boundary stays fixed | Exterior background, an overlapping occluder and a break in the outer boundary are different evidence. |
| `hole_closed` | Prior interior-hole record and the same enclosing identity | At `1`, the single hole is filled with the object's appearance | A lost contour, occluded hole or changed crop is not proof of filling. |

### 3.4 Grouping and lineage

These cases require the planned typed membership/lineage layer. Shape similarity,
proximity and `objects_db.metta` alone do not supply that layer.

| Recording | Local memory required | Detection and earliest evidence | Withhold or distinguish |
|---|---|---|---|
| `group_formed` | Independent member identities at `0`, accepted grouping criterion and new membership proposal | Joined geometry at `1` proposes a group; rigid joint motion at `2` supplies additional support | If support only becomes sufficient at `2`, do not backdate confirmation to oracle frame `1`. Group identity must be generated, not copied from `group`. |
| `group_dissolved` | A genuinely established baseline group and its membership revision | At `1`, formerly grouped members separate; `2` confirms independent continuation | The label in frame `0`'s oracle is not an established group. Add independently supported prehistory or keep the claim unavailable. |
| `member_added` | Established group's ID and membership set, plus the independent third track | Compare before/after sets at `1`; joint motion at `2` corroborates the third member joining while group identity remains stable | Requires a prior accepted group, not just two touching shapes. Group and member IDs remain distinct. |
| `member_removed` | Existing three-member membership and surviving subgroup evidence | At `1`, the third member leaves while the other two remain; `2` supports the retained group | Removal is not dissolution or deletion of the departing object's identity. |
| `split` | Source identity/mask at `0`, conservation/locality evidence and a one-to-many correspondence hypothesis | At `1`, propose two children with total area 72; separation at `2` tests the lineage hypothesis | Equal area is supporting evidence, not proof. Rule out occlusion and unrelated appearances; never force one-to-one identity matching. |
| `merged` | Two distinct source identities/masks and a many-to-one hypothesis | At `1`, propose a connected 72-pixel result; persistence at `2` supports it | Touching or one object hiding another must not automatically become a merge. Keep source identities in immutable history. |

### 3.5 Lasting relation episodes

Each row tests start, continuation and end for the same subjects and episode.
Current fixtures usually target frames `1`, `2`, `3`; exceptions and necessary
warm-up evidence are explicit below.

| Recording | Local memory required | Detection and intended lifecycle | Withhold or distinguish |
|---|---|---|---|
| `move` | Prior measured stationary/moving state, previous displacement and active motion episode | After a measured stationary warm-up: stationary -> moving starts; further displacement continues; zero displacement ends | Current `0` is a single still image. Add a versioned identical warm-up frame before expecting `start(move)`; do not initialize velocity to zero by assumption. |
| `contact` | Previous boundary-contact truth, stable subject pair and episode | Noncontact at `0`, shared edge at `1`, contact at `2`, separation at `3` | Measured contact does not by itself establish attachment, force or collision. |
| `attached` | Prior disjoint group membership, strong-edge/cutout proof, extraction completeness and policy hash | Proof appears at `1`, remains with joint movement at `2`, disappears on supported separation at `3` | Missing/incomplete proof is unknown, not detach. A policy change requires consistent replay rather than closing the old episode. |
| `overlap` | Remembered independent shapes/poses, observed versus inferred mask distinction and relation episode | Independently supported projected overlap starts at `1`, persists at `2`, ends at `3` | Painted visible masks cannot share the same raster pixel. Reconstruct hidden portions from evidence or keep amodal overlap hypothetical; the oracle masks are forbidden inputs. |
| `co_move` | Prior rigid transforms/velocities for both tracks and co-motion truth | After measured non-co-motion warm-up: common displacement starts, persists, then diverges | Current initial frame cannot establish a previous velocity pair. Version the warm-up; joint motion does not prove attachment. |
| `occlude` | Full actor shape before hiding, velocity from `0 -> 1`, occluder geometry/depth evidence and episode | Full hiding at `2`; partial recovery at `3`; full emergence at `4` is the fixture's intended end | Decide partial-reappearance versus fully-unoccluded episode policy explicitly. Do not close merely because some pixels reappear, nor import generator draw order as depth evidence. |
| `contain` | Enclosure boundary/interior and directional container/contained identity pair | Outside at `0`, enclosed at `1`, still enclosed at `2`, outside at `3` | The hollow interior is not foreground mask overlap. Require a supported enclosed-interior relation, not just overlapping bounding boxes. |
| `inside` | The same enclosure evidence with subject roles reversed | Inverse lifecycle of `contain(container, actor)`: `inside(actor, container)` | Needs an explicit accepted inverse rule or detector. Registration in the term vocabulary alone does not implement it. |
| `blocked` | Prior approach/contact, repeated actual attempted inputs, wall geometry and failed displacement | Intended start/continue/end at `2`, `3`, `4`; wall removal permits motion | Current recording has no real attempted-input trace. Its still-contact interval supports stationary/contact, not this stronger causal claim. New action-bearing fixtures are needed. |
| `follow` | Leader/follower trajectory windows, temporal lag and prior episode | At `2`, two lagged path matches support following; at `3` the follower diverges | One coincident path point at oracle frame `1` is insufficient under the proposed two-match gate. Version the warm-up/timing; parallel motion alone is not following. |
| `carry` | Distinct carrier/load IDs, supported load relation, relative pose and joint motion history | Contact/support candidate at `1`; transported fixed-offset load at `2`; separation at `3` | Without an earlier accepted carrier/load model, classify carry no earlier than `2`. Contact or co-motion alone is insufficient; do not assume force/support from fixture names. |

### 3.6 Negative and ambiguity controls

| Recording | Local memory required | Detection | Required outcome |
|---|---|---|---|
| `no_material_change` | Complete previous observation and identity/geometry/appearance/relationship state | Compare both identical images and all relevant observable state | Empty event list and `no_material_change` for `0 -> 1`; frame `0` remains an initial observation. |
| `unknown` | Both indistinguishable track histories and alternative correspondences through coincidence | Preserve bounce, pass-through and identity-swap alternatives through frames `1` and `2` | Do not choose an identity because the oracle names it. Ambiguous comparisons remain `unknown`; do not learn a positive collision/merge from them. |

## 4. Current capability and fixture gaps

The implementation already has authored paths for `moved`, `rotated`,
`shape_changed`, `missing`, `exited`, `reappeared`, and phased `move`, `co_move`,
`contact`, `overlap`, `contain`, `occlude`, `attached`, subject to their evidence
gates. That is **27 event/phase combinations**, not 27 demonstrated passes on
these recordings. The other registered combinations require detector work.

The older temporal design document contains historical deferred-status text;
current executable modules and the later storage-boundary implementation section
take precedence for implementation status.

Before claiming the 38 recordings are event-detection regressions:

1. Add versioned stationary/non-co-motion warm-up variants for `move` and
   `co_move`. The existing `initial_event_state` has an empty motion history;
   the first motion interval is not proof of a start from rest.
2. Resolve decision-time versus contact-time expectations for `collision`,
   and evidence delay for `group_formed`, `follow` and `carry`.
3. Establish grouping baselines from independent prehistory or an explicit
   accepted grouping rule, not labels, for dissolution and membership cases.
4. Add actual input traces for causal `blocked`/push tests. Keep the original
   visual-only `blocked` example as an insufficient-evidence control.
5. Specify partial-visibility episode policy and signed depth requirements for
   occlusion. Treat amodal overlap and enclosed-interior containment separately
   from visible-pixel intersection.
6. Add typed grouping/lineage and any necessary appearance/state measurements
   without weakening term allowlists or conflating objects with shapes.

Preserve the existing files and oracle history. Proposed revisions should be new
named recordings such as `move_warmup_v2`, not silent rewrites, merges, reindexing
or changes to the original expected outcomes.

## 5. Pressure-plate induction tests

These are **new planned recordings**, not part of the existing 38.
Keep the same loadable layout:

```text
data\omega_vision\recordings\events_tests\
  plate_momentary_train_a\0\image.png
  plate_momentary_train_a\1\image.png
  plate_momentary_train_b\0\image.png
  plate_momentary_validation_a\0\image.png
  plate_momentary_test_a\0\image.png
```

Each recording gets the ordinary manifest and a separate evaluator oracle.
Training, validation and test are experiment metadata, not workspace namespaces.
Use several short independently varied recordings rather than treating adjacent
frames or copied directories as independent experiments.

### 5.1 What the student remembers

Remember the actor, plate, door and any crate as independently tracked entities;
plate/door appearance and geometry states; contact/occupancy episodes; actual
attempted actions; measured delays; and pending predicted effects. Keep a table
of candidate relationships supported and contradicted by prior trials.

For example, after repeated valid trials, induction might propose:

> In this mechanism, beginning sustained occupancy of this plate predicts the
> linked door becoming open within the measured response window. Ending occupancy
> predicts closure only for the momentary mechanism.

This is not supplied as a rule beforehand. After explicit approval it is used
for **predictions**. The door is only recorded as observed open when current
visual evidence establishes that state.

### 5.2 Planned plate scenario matrix

| Recording stem | Controlled trial | Memory-dependent rule under test | Essential controls / held-out variation |
|---|---|---|---|
| `plate_momentary` | Approach, stand on plate, hold, step off; repeat independent cycles | Occupancy predicts opening; sustained occupancy maintains it; release predicts closure | Wait without contact; pass nearby; vary actor color, direction, plate location and dwell time; keep the same actual mechanism. |
| `plate_crate_hold` | Push a crate onto the plate, move the actor away, then remove the crate | Plate response depends on the occupying load, not continued actor proximity | Actor alone away from plate; crate nearby but not on it; swap the occupying object's appearance. |
| `plate_unlinked_control` | Intervene on each of two visible plates independently | Learn which plate predicts which door, without hard-coded nearest-door association | Nearer unlinked door/plate, color swaps, actor moving near the door, no intervention. |
| `plate_latched` | Occupy plate to open door, then leave while door remains open | Distinguish latching from momentary behavior using remembered prior activation | A momentary candidate must fail the completed release horizon; keep its earlier support and the counterexample. |
| `plate_toggle` | Distinct rising-edge presses alternate door state; holding causes no repeated toggle | Learn edge-triggered transition conditioned on remembered current door state | Hold without releasing; release/repress; do not fit a rule to absolute frame number or total elapsed time. |
| `plate_delayed` | Occupy/release with a reproducible delay before response | Learn an effect window and maintain pending obligations until it expires | Short clip ending before the horizon is inconclusive, not a negative; vary sample rate using trustworthy timestamps. |
| `plate_two_inputs` | Occupy A alone, B alone, both, neither, and release either | Distinguish conjunctive/alternative requirements from single-plate coincidence | Independent interventions cover the truth table; do not claim arbitrary Boolean-rule synthesis exists today. |
| `plate_timer_confound` | Door opens on a timer in some trials while actor independently passes a plate | Reject the false rule that nearby actor/plate contact always causes opening | Randomize waits and intervention timing; include door opening without a press and presses without door effects. |

Mechanism labels and wiring exist only in the generator/evaluator. The learner
must not receive `momentary`, `latched`, `toggle`, `linkedDoorId` or a plate's
hidden activation flag as measured evidence.

### 5.3 Per-trial temporal protocol

Use a baseline interval, an intervention, an observable response interval, a
hold interval, a release, and a fully observed post-release interval. Vary the
duration and geometry between trials. For every transition save the visible
measurements and actual input receipt, then consult only earlier local memory.

The learning result must record the intervention identity, affected entity,
source example IDs, positive cases, explicit negatives, delay window, uncertainty,
and mechanism scope. A failed release rule must not erase an otherwise supported
press rule; retain separate candidates.

## 6. Pushing-object induction tests

These also become ordinary recordings, for example
`events_tests\push_free_train_a\0`, `\1`, etc. The controlled simulator records
the action actually issued, such as a directional move, and renders the resulting
observation. It must not stamp an outcome such as `PUSH_SUCCESS` as an input.

### 6.1 What the student remembers

Remember actor/crate identities and shapes, previous positions, contact side,
input direction, displacement vectors, obstacle geometry, empty destination
evidence, and whether motion continued after contact ended. Keep learned
affordances attached to evidence and mechanism scope, not hard-coded sprite IDs.

The principal candidate is:

> Directional action into a contacted movable object predicts displacement of
> that object in the action direction when the destination is observably free.

That is a hypothesis to learn and test. Absence of a detected wall is not proof
of a free destination when that area was occluded or not inspected.

### 6.2 Planned pushing scenario matrix

| Recording stem | Controlled trial | Memory-dependent rule under test | Essential controls / held-out variation |
|---|---|---|---|
| `push_free` | Actor approaches, contacts a crate, then advances into it across multiple steps | Contact plus action predicts crate movement in the same direction | Move without contact; move away; pause; vary crate/actor appearance and location. |
| `push_directions` | Repeat from left, right, above and below | Generalize direction relative to contact geometry rather than fixed screen coordinates | Held-out direction/orientation, different start positions; not every directional command moves every crate. |
| `push_wall_blocked` | Push crate against a wall; repeat attempt; remove obstacle and try again | Learn an observable blockage exception to the free-push rule | No force-through-wall; unknown destination remains ungraded; wall removal restores the positive case. |
| `push_immovable` | Try visibly similar but behaviorally different objects | Learn evidence-backed movable/immovable affordances rather than using color as a label | Recolor or relocate objects; retain counterexamples and ambiguity instead of inventing hidden mass facts. |
| `push_chain` | Push two touching crates with a free space beyond, then with a blocked far end | Learn multi-object displacement and the downstream-obstacle condition | Independently observe all destinations; do not invent recursive propagation or infinite lookahead support. |
| `push_release` | Push then move the actor away; crate stops in a non-inertial mechanism | Distinguish push from attachment, carry and autonomous co-motion | Temporary contact must not permanently merge identities or assert an attachment episode. |
| `push_inertial` | In a separate mechanism, crate continues after release and later slows | Learn the need for velocity/history context, not the unconditional stop-on-release rule | Same visible initial geometry as release case; different observed dynamics; no oracle mechanism tag as input. |
| `push_onto_plate` | Push crate onto a plate, leave it there, then push it off | Compose independently supported push and plate-response predictions | Actor approaches without moving crate; crate misses plate; actor leaves while crate remains; preserve intermediate crate/plate/door evidence. |

For `push_onto_plate`, retain the chain explicitly:

```text
actual directional input
  -> independently measured actor/crate contact and crate displacement
  -> independently measured plate occupancy / visible plate-state change
  -> predicted door response from an eligible learned rule
  -> confirmed door-state change only after its observation
```

Neither an expected push nor a predicted door opening may become an intermediate
observed fact used to confirm the next rule.

## 7. Learning protocol and representation work

### 7.1 Keep the learning tasks separate

| Task | Input available to the learner | Output |
|---|---|---|
| Frame evidence -> event detector induction | Measured frame/pair features and independently sourced training labels | Candidate detector; only an approved, scoped detector can deduce confirmed events from current evidence. |
| Event -> subsequent event induction | Earlier confirmed events, measured context and later observed effects | Candidate transition rule with a delay; replay produces predictions, not observed events. |
| Action -> effect induction | Actual issued-input receipts, pre-action context and independently observed effects | Candidate action-effect rule; action is not proof of successful movement or plate activation. |
| Abduction | Observed effect plus an earlier accepted transition/action-effect rule | Grounded possible antecedents and explicit assumptions, never a synthetic observation. |

The existing transition inducer supports typed event/action anti-unification and
context binding. Do not advertise general hidden-state, arbitrary conjunctive
mechanism learning, force reasoning or unrestricted recursive push-chain learning
as already implemented.

### 7.2 Required representations before strong domain claims

Current event vocabulary has generic terms such as `moved`, `color_changed`,
`shape_changed`, `contact`, `blocked`, `user_input`, and phase wrappers. It does
not currently define typed `plate_pressed`, `door_open`, `push_success`, force,
mass or a plate-to-door wiring predicate.

Use two explicit levels of test:

1. **Existing-vocabulary baseline:** learn only the generic visible change that
   can actually be measured, such as contact followed by a door track's
   `shape_changed`. Do not call that a full open/closed or pressure-plate model.
2. **Planned domain-semantic tests:** specify and implement typed observed
   plate/door states and transitions, roles/affordances, occupancy and signed
   destination-clearance evidence, with schema/measurement/rule-validator tests.
   Only then claim release, toggle, mechanism-specific push or open/close rules.

The generic detector feature set also needs explicit supported producers for
any new state, action-context and numeric measurement. Adding a predicate name
to a prompt or allowlist is not sufficient.

Event-transition induction currently begins at a delay of one transition;
action-effect induction can use zero delay. Plate and door changes rendered in
the same adjacent pair therefore need either a justified finer sampling schedule
or an explicitly designed same-pair event rule path. Do not shift timestamps
just to make a candidate pass.

### 7.3 Training, validation, final tests and publication

1. For each applicable stem, generate independently varied `train_a`, `train_b`
   and explicit training-control recordings; reserve `validation_a` and
   `test_a` plus their controls before learning. Also vary identities, object
   placement and waits so copying a trace or memorizing time cannot pass.
2. Only training examples influence rule generation and thresholds. Independent
   labels may train supervised detector induction; they are never runtime facts.
   Action/effect learning uses observed outcomes, not a supplied mechanism rule.
3. Freeze candidate versions before validation. The current promotion gates
   require at least two independent positive pairs, two distinct sequences,
   one held-out pair, confidence at least 0.8 and zero allowed counterexamples.
   These are minimum gates, not a substitute for the scenario controls.
4. Require exact intended outcomes on every complete positive/negative
   deterministic trial, zero unsupported causal claims, correct arguments and
   response window, and explicit pending/unknown outcomes where appropriate.
   Report inconclusive counts separately; excluding hard cases is not a pass.
5. Store unapproved candidates in the generating frame's
   `memory\induced_rules.metta`, with all independent source references. Keep the
   existing canonical candidate/evaluation history; do not create a parallel
   authority or relabel a candidate's own deductions as independent labels.
6. Evaluation may explicitly select examples from multiple shared recordings.
   This is an authorized experiment input set, not automatic merging of their
   STM. Repeated frames and duplicate recording contents do not count as
   independent evidence.
7. Approval remains explicit. Publish to the generating recording's actual
   `memory_level_1_stm` in the existing role-appropriate representation, not to
   game-wide memory or LTM. A rule published at order `p` may affect eligible
   later orders, not `p` itself or preceding frames.
8. Evaluate a frozen candidate against held-out facts through the explicit
   evaluation path; do not secretly install it in the held-out recording's STM.
   Test live local reuse in a later probe interval of the publication recording.
   Cross-recording deployment remains a separately authorized binding capability,
   not an implicit read of somebody else's local memory.
9. Final test recordings must not tune the candidate or approve it. A discovered
   counterexample creates a versioned follow-up evaluation/refinement task while
   preserving the original frozen test result and rule history.

### 7.4 Abduction controls

Add later probes in which the door visibly changes but the plate occupant is
hidden, or a crate changes position while the actor is unobserved. An eligible
learned rule may generate hypotheses such as an unobserved plate occupation or
push, grounded in known entities. Alternative timer/autonomous causes remain
possible. Store hypotheses separately in the current frame's
`memory\abduced_events.metta`; do not count them as successful event detection,
training positives, independent confirmations or approved rules.

Nowhere remains browser RAM only. Current persistent abduction cannot run there;
an unsupported-context result is required, not a server-side payload copy.

## 8. Implementation order and acceptance

| Step | Work | Completion criterion |
|---|---|---|
| 1. Causal replay harness | Run the real extractor, correspondence, event and log stages in explicit frame order, exposing memory read/write receipts | Cold replay and resume from a valid predecessor agree; altered evidence/config invalidates the affected suffix; no oracle read occurs. |
| 2. Existing event baselines | Exercise implemented detectors on the miniature recordings with honest supported/unsupported outcomes | Each of the 38 cases has an explicit result; expected label coverage is not mistaken for detector coverage. |
| 3. Fixture sufficiency | Add non-destructive warm-up/timing/action-bearing variants for the gaps in section 4 | Start states, temporal evidence and causal actions are actually available at the claimed decision time. |
| 4. Missing measurements/detectors | Implement motion derivatives, appearance/topology distinctions and typed grouping/lineage as separately reviewable work | Each new detector has positive, negative, ambiguous and causal-cutoff cases, with real producer-to-reader wiring. |
| 5. Plate and push recordings | Add the 16 planned scenario stems with training/validation/test variations as ordinary recordings | All appear in the existing recording selector, have real input receipts when needed, and preserve existing examples/history. |
| 6. Induction and controlled reuse | Run candidate generation, independent evaluation, explicit approval and later local-memory probes | Controls reject overbroad rules; unseen trials show actual generalization; scope and publication boundaries hold. |
| 7. Composition and abduction | Exercise push-onto-plate and hidden-cause probes | Predicted/assumed links never masquerade as observed intermediate facts. |

Cross-cutting acceptance requirements:

- Remove access to the predecessor/window in a controlled test: multi-frame
  classification must become unavailable or less certain, not magically produce
  the same answer. The exact memory/evidence source used must be visible.
- Alter a future frame or future rule approval: earlier deductions remain
  unchanged. Jumping to a frame requires its validated prefix or explicit replay.
- Switching workspaces exposes the same recordings and immutable identities;
  it must not reset, clone or repartition memory.
- Re-run identical inputs without duplicate memory versions, event episodes,
  support counts or promotions. Never erase stored history to obtain a clean run.
- Use explicitly isolated temporary repository fixtures for cold-memory tests.
  Do not clear the user's live memory or the `events_tests` recordings.
- Every reader/writer/cache/lock stays within the shared resolver's authorized
  path. Inspector area selection never changes Save To/Look In.
- Preserve the rich inspector and show the frame, prior memory, evidence,
  rule version, predicted effects and separate assumptions needed to understand
  a result. Do not present an unsupported target as a passed detection.

## 9. Implementation references

Read these rather than introducing a parallel event or memory subsystem:

- `python\omega_vision\evaluation\event_recording_cases.py`
- `python\omega_vision\evaluation\event_recordings.py`
- `python\omega_vision\perception\contextual_memory.py`
- `python\omega_vision\perception\metta_memory.py`
- `python\omega_vision\perception\temporal_correspondence.py`
- `python\omega_vision\perception\event_records.py`
- `python\omega_vision\perception\event_deduction.py`
- `python\omega_vision\perception\event_induction.py`
- `python\omega_vision\perception\candidate_rules.py`
- `python\omega_vision\perception\event_abduction.py`
- `python\omega_vision\services\video_import_semantics.py`
- `python\omega_vision\services\video_import_abduction.py`
- `prolog\omega_vision\event_detectors.pl`
- `tests\omega_vision_api\test_event_recordings.py`
- `tests\omega_vision\test_authored_event_deduction.py`
- `tests\omega_vision\test_event_induction_algorithms.py`
- [Storage and memory contract](OMEGA_STORAGE_BOUNDARY.md)
- [Temporal-event design and syntax](TEMPORAL_EVENTS.md)

## 10. Mandatory contract for future kickoffs and handoffs

Relay these requirements verbatim to every active helper/descendant:

1. ONE shared physical Omega Vision data root: <repository>\data\omega_vision. All our data, memory, rules, events, executions, preferences, cache, logs and locks must be descendants. No sibling repo\data\recordings/runtime/knowledge/etc and no workspace-root Omega data writes.
2. ALL Visual Sequences are under ONLY omega_vision\recordings or omega_vision\curated. Retain curated spelling. importables is staging, not a sequence family. No new standalone video/arc_recordings/recognition_* sequence roots.
3. Workspaces DO NOT divide data physically OR logically. No omega_vision\workspaces\<id> namespace, workspace-specific catalogs/ownership filters or cache namespaces that divide the shared data. Workspace provenance/editor configuration is metadata only. Same assets and stable identities are visible across workspace switches. Game/level/run areas may organize the shared store.
4. Inspector gets real authorized areas from this shared root; area selection must not change Save To/Look In. Read-only saved-area browsing must not depend on unrelated sequence enumeration; sequence-specific actions still require valid context.
5. Nowhere stays current-browser-RAM-only; never persist/cache its payloads or relabel full payload copies as audit.
6. Preserve existing files/history. NO automatic migration, merge, rename or deletion of legacy data. Inventory incompatibilities and show unavailable historical settings honestly rather than silently substituting destinations.
7. Enforce these through shared resolver/writer helpers AND regression coverage: path containment for each writer/cache, two-workspace shared visibility/identity, only two canonical sequence families for new saves, no out-of-root/hidden-workspace fallback. Reject unsafe paths; do not weaken access checks. Do not declare compliant based only on changed labels.
