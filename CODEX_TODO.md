[Back to repository README](README.md)

# Codex TODO and Recovery Ledger

This file is the durable implementation and recovery ledger for Codex work in
this repository. It is intentionally separate from `AGENTS.md`: `AGENTS.md`
defines stable constraints, while this file records current state, pending
work, validation evidence, and safe recovery instructions.

Codex owns updating this ledger at meaningful implementation, validation, and
handoff checkpoints. Contributors may add tasks, correct stale facts, and mark
accepted work complete. Never place credentials, tokens, or secret `.env`
values here.

## Current Git workflow - local main only (2026-09-10)

All work must stay in the user's existing local checkout:
`C:\snet\PeTTa\repos\symbolic_ml_workbench`, on `main`. Authorized commits go
directly to that local primary branch (`master` only where it is the primary
branch). Never create or use feature/code branches, agent-owned checkouts, or
additional worktrees. Do not switch this checkout away from `main`, create PRs,
or push remotely as part of this workflow.

This user instruction supersedes older feature-branch, PR, and worktree
directions in this ledger and `AGENTS.md`. Historical checkout/branch references
below are evidence only, not instructions to reuse, recreate, or delete them.
Preserve all existing edits, files, history, and paused-work boundaries.

The obsolete Systems feature-branch PR task has been removed. Its branch is
absent locally and on origin; `main` already contains the Systems catalog
(`a979d4a7d`) and dedicated configuration/execution UI (`1b058b010`) commits.
No merge or branch deletion was performed for this cleanup, and no branch was
recreated. This documentation-only task does not resume paused implementation,
research, or services.

## ARC game vocabulary - shared task plan (paused by user)

Owner: **ARC game vocabulary**, project session
`abbe3d4a-4d8e-47ce-884c-4772fbd65056`.
The user explicitly stopped this session's research and selected this file as
the shared planning place. This section consolidates this session's task list;
it does not take ownership of other agents' implementation or launcher work.
**Do not resume research, implementation, or deferred follow-ups without the
user's instruction.** Completed milestones below are not a claim that all game
semantics or every later recognition-document revision are understood.

### Remaining work and explicit limits

| Task | Status | Scope and recovery instruction |
|---|---|---|
| Explaining recognition-role shapes (`recognition-shape-appearance`) | Paused; source inspection started, answer not delivered | Answer the interrupted question, "and what shapes look that way", with a human-readable appearance table covering the nine new roles and five refinements. Distinguish actual rendered shapes, logical footprints, hidden state and relational configurations. Reuse the source findings below; do not restart the full catalog review. |
| Reconciling the expanded recognition document | Deferred; a full new audit is not authorized by this plan | The updated attachment contains 108 broad roles and five refinement groups across 276 game rows. Comparison and explanation of the additions are complete, but this revision is NOT a fully source-corrected replacement for the accepted first-document audit. If requested, carry forward accepted corrections and review changed claims using exact installed versions. |
| Publishing older-guide corrections | Deferred; preserve accepted reports | `Game_Object_Recognition.guide_followups.md` records 16 corrections/qualifications discovered during the first document audit. They have been flagged, not silently applied to the accepted guides. Any authorized revision must be versioned and retain existing citations. |
| Fully explaining the remaining obfuscated semantics | Unresolved limits; no active work | The 31 partial/opaque versions now have v3 role/flow annotations, not full semantic deobfuscation. Use `readability_obstacles_v3.csv` for exact per-version gaps. Of 1,761 named functions, 226 have grounded roles, 27 have tentative counterpart proposals and 1,508 have structural-only contracts/flows. No identifier renames were applied in v3; do not treat unsafe renaming or unknown meanings as solved. Do not redo the 251 already-readable versions. |
| Comparing original/copy gameplay behavior | Not performed; outside current authorization | Syntax, AST, token/byte preservation and static flow coverage do not constitute behavioral comparison. No game/engine/model execution is permitted merely to close this limitation. |

### Completed milestones

| Task ID | Completed work | Result and boundary |
|---|---|---|
| `all-game-guides` | Writing all installed-game guides | Accepted player-guide tables cover the confirmed 276 distinct IDs and account for 282 installed versions, with human controls, goals, visible entities, hidden mechanics and source-specific limits. This is the established inventory snapshot, not a new scan or a claim that every configured external root is covered. |
| `readable-copies` | Deriving traceable readable sources | All 282 versions have traceable initial copies/manifests: 251 already-readable byte-identical copies, 14 partial transformations and 17 opaque/annotated copies. Coverage-complete does not mean fully deobfuscated. |
| `vocabulary-table` | Completing the evidenced vocabulary table | Accepted 163-term table: 138 retained from the reviewed 140-term draft, with five corrections and two withheld terms, plus 25 supported distinctions. Keep the distinction between rendered entities and hidden mechanics. |
| `final-coverage` | Auditing coverage and handing off | Delivered the complete guide/vocabulary tables and ontology analysis. No pending guide rows or unavailable source files in that accepted snapshot; residual semantic and visual limits remain explicitly recorded. |
| `deeper-source-roles` | Explaining the 31 partial/opaque versions | Published immutable v3 comment-only derivatives for 31 versions / 25 IDs: 226 grounded method roles, 129 state roles, 1,711 keyed asset/data entries and indexing of 1,761 named functions plus 82 lambdas. Original symbols, APIs and existing citations remain intact. |
| `deeper-source-validation` | Validating improved derivative coverage | Original-byte reconstruction, AST preservation, idempotence and all 16,489 structural statement records/branch contexts were accounted for. Exact per-version obstacles and confidence labels were delivered; no behavioral equivalence was claimed. |
| `recognition-document-review` | Reconciling the first uploaded recognition document | Reviewed all 99 original families, 276 game rows, 1,711 mappings, seven cautions and six additional-version distinctions. The corrected document has 100 qualified concepts, 1,644 positive mappings and 386 audit records. Archive/snapshot provenance asserted by the attachment was not certified. |
| `recognition-document-export` | Delivering the corrected document and audit | Corrected Markdown/CSV, family/assignment/source tables, audit and validation artifacts were accepted and opened by the coordinator. Original attachment and previously accepted reports remain unchanged. |
| Updated-list comparison | Comparing the second attachment | Identified nine new broad roles, five refinement groups, four modified old families and 14 changed game rows; 262 rows were unchanged. This was a difference review, not a renewed full factual audit. |
| New-classification explanation | Explaining the updated role names | Answered the user's question about the nine additions and five refinements, including that fields, representations, relationships and collections are not automatically physical objects. The follow-up about appearance was interrupted. |

### Resume information for the interrupted appearance table

The nine new roles are circuit probe/voltage readout (KV01/KV04), timing target
window (SG01), guard detection region (SC01/ST01), visibility region/fog boundary
(FG01), suction field/center/ring (SU15), paired content-swap regions (JW01),
connected paint blob (GP04), fruit collision/merge group (SU15), and pending
command queue (DL01).

The five refinements are directional push-blast front (KA59), return-address/
suspended-call marker (SB26), routine/instruction/target-tape cursors (SB26),
hollow frame/crossbars/interior (RE86), and generated reflection instance (AR25).

Existing static findings to preserve, not a completed appearance answer:

- Under `python\workbench_api_server\environment_files`, ST01
  `63be02fb\st01.py:210-229` constructs an up-to-three-cell-wide,
  seven-cell-deep strip, not a widening triangular cone. Its overlay is drawn at
  lines 81-93; bounds and the particular wall-scan behavior can truncate it.
  SC01's detection region is not separately drawn.
- FG01 uses Chebyshev distance for a square logical visibility footprint;
  it is not a drawn circular fog object. SG01
  `63be02fb\sg01.py:74-95` draws a one-pixel-high interval strip and a blue
  one-pixel cursor below it. DL01 `63be02fb\dl01.py:21-64` uses two-pixel
  directional marks and one-pixel empty slots, not full arrowhead artwork.
- SU15 `1944f8ab\su15.py:1194-1215` draws a pixelated circular annulus using
  squared distance and radius +/- 0.5. A collision/merge group is a configuration
  of pieces, not evidence of a separately drawn enclosing shape.
- SB26 `7fbdac44\sb26.py` has literal hollow-square prototypes for the return
  marker (line 261, 6x6), instruction cursor (line 321, 6x6) and tape cursor
  (line 37, 8x8). The routine cursor uses corner brackets (line 127);
  lines 1119-1146 adjust frame width and preserve bracket gaps.
- KA59 `38d34dbb\ka59.py` blast prototypes at lines 98/115/138 are opaque
  3x3 patches in larger transparent masks; lines 629/649/675 use 6x3, 6x6
  and 6x9 patches. They are not circular fireball artwork. The staged
  action/position/rotation path is at lines 41335-41379.
- KV01 `v1\kv01.py:90-119` encodes readings as colored pixels, not printed
  fractions or a physical probe. Reuse accepted source legends for KV04,
  JW01's paired rectangle outlines, GP04's connected painted-cell shapes,
  RE86's hollow frames/crossbars and AR25's reflected silhouettes. Verify any
  more specific artwork assertion before presenting it as fact.

### Artifact register and protected inputs

Existing reports remain at this local handoff base; the shared task status is
now in **this file**, rather than only in the session-private task database:

`C:\Users\dougl\.copilot\session-state\67557b60-4469-4dd3-ba92-bdf7d065e537\files`

| Artifact set | Files relative to the handoff base |
|---|---|
| Accepted inventory and guides | `game_source_register.json`; `installed_game_guides.md`, `.csv`, `.json` |
| Accepted vocabulary and ontology | `cross_game_vocabulary.md`, `.csv`, `.json`; `ontology_analysis.md` |
| Initial source-copy coverage | `readable_coverage_manifest.json` |
| Improved v3 readability | `readability_report_v3.md`; `readability_manifest_v3.json`; `readability_aliases_v3.csv`; `readability_obstacles_v3.csv`; `readability_functions_v3.json`; `readability_scope_supplement_v3.json`; `readability_validation_v3.json` |
| Accepted first-document correction | `Game_Object_Recognition.corrected.md`, `.csv`; `Game_Object_Recognition.audit.md`, `.csv`, `.json`; `Game_Object_Recognition.families.csv`; `Game_Object_Recognition.assignments.csv`; `Game_Object_Recognition.sources.csv`; `Game_Object_Recognition.validation.json` |
| Unapplied guide follow-ups | `Game_Object_Recognition.guide_followups.md` |

The original attachment remains unchanged at
`C:\Users\dougl\.copilot\workspaces\43cddb84-4e12-4a03-b6df-f72ca97033ab\attachments\b5558fbd-13c6-4e15-8d3a-6f7593c0a0ca-Game_Object_Recognition.md`;
its exact hash is retained in the accepted audit artifacts.
The updated attachment remains unchanged at
`C:\Users\dougl\.copilot\workspaces\abbe3d4a-4d8e-47ce-884c-4772fbd65056\attachments\17c96956-38a5-4d75-b7d0-1f9bdd5b0aec-Game_Object_Recognition.md`
(SHA256 `618aeebdb2b12ee0aef579dedb59ba8f2ba572d03116da9498c48e4316fe354c`).
Do not assume similarly named later repository uploads are identical inputs.

Derived sources stay only under
`data\omega_vision\knowledge\artifacts\game_sources\readable\<game-id>\<version>`.
Preserve all installed originals, metadata, accepted reports and v3 derivatives.
Research is static-source-only: no games, engine imports, models, live APIs,
servers, visible windows, new helpers, runtime/schema changes or Git operations.
The current user authorization is limited to this shared planning-file update.
If UI context is later relevant, use `workspace=arc3_random_player` without
altering other URL state; it is not a data partition.
Retain R/S/G/O/A/C distinctions, recursive Object parts, A with one or more
members, and the separation of observed evidence from inferred hidden structure.
No automatic ingestion of documentary roles into recognition classes/rules.

## Current recovery state

### TODO follow-through accepted batch (2026-09-12)

The user asked to take care of this ledger's remaining work. Continue in the
existing local `main` checkout. The completed recording/fog slice is committed
as `9a5044512`; the older statement below that no commit existed is historical.
Do not resume the separately paused ARC vocabulary research or deferred LS20
duplication cleanup, and do not publish live STM into LTM merely to demonstrate
the new command.

Completed file-scoped implementation in this batch:

- Coordinator: enabled the four already registered, single-frame FIRST_PASS
  stages through the confirmed row plan/commit route. The implementation uses
  exact stage IDs, not broad runner-module authorization. Recording-backed
  calls discover frame identity/order without reading other observation payloads;
  legacy provenance-ordered sources keep their existing ordering behavior.
  The first-pass/parent/resolver batch passed 77 cases. Final focused first-pass
  coverage passed 18 cases, including rejection of injected cross-frame or
  non-first-pass dependencies before runtime memory lookup. Service activation
  and live row-plan acceptance are complete.
- `recording-tests-backend`: explicit typed STM-to-LTM discovery, revision-bound
  planning and confirmed publication. Source/history and causal provenance stay
  intact, Nowhere is not a persistent publication source, and the four look-at
  contracts gain no implicit LTM reads. No live publication is authorized.
- `causal-event-detectors`: grounded hidden-motion/occlusion observer and scoring
  integration. Normal reappearance versus constant-speed mismatch must retain
  fast-unseen-travel/acceleration and teleport hypotheses as alternatives.
  Evaluator labels, hidden positions and claimed actor roles are not observations.
  The three preserved composition/visibility leaf files remain unregistered.
- The four Super Control / Resource Source editor tasks are implemented and
  browser-accepted below. `arc-sequence-player` also completed the explicitly
  opened STM-to-LTM publication UI and its small memory-host integration,
  against the typed backend contract. No live publication is authorized.

Helpers report only to the coordinator, not to each other. The coordinator owns
all Git, ledger and service activation. Finish the atomic implementations before
one coordinated activation; do not repeat live runs while source hashes change.
Remaining unsupported producer/causal claims must remain explicit rather than
being checked off because fixtures or isolated leaf tests exist.

The user resolved the plugin-reload policy: keep restarts explicit. The current
announced launcher already uses the explicit restart supervisor with
`uvicorn.run(..., reload=False)`, so no new watcher or automatic restart was
introduced. Documentation and the older unchecked follow-up are reconciled.

The first-pass row work is now accepted against the actual shared fog selection:
all four roots produce read-only plans for actual frame `0`, one support frame
and zero model calls. The browser's colored row picker selected OpenCV and showed
the same initial-observation plan; no row execution or pooler retargeting was
needed for this live check.

Explicit publication is implemented at `/workbench/memory/publications` with
`options`, `plan`, and `commit`, plus the memory-host panel. Only native Shapes,
Objects and already-approved deduction-rule references have typed publication
support. Plans bind source/destination revisions, selected immutable entry IDs,
cutoff, approval and implementation. Commit appends one atomic native batch,
preserves STM/history and adds no evidence, confidence or automatic activation.
Physical version addresses remain destination-specific; logical identities and
original references are retained. Unsupported observation/hypothesis/group
publication and cross-recording inference eligibility remain explicit.
Actual browser options used `arc3_random_player` and the unchanged shared source:
no automatic request before opening, no publication, no LTM creation, and no
selection/preference mutation. A second real workspace returned identical
source identities. Isolated publication/hidden-model coverage passed 69 cases;
66 focused publication/memory-host frontend cases passed.

Generic selected-recording Start/Step/Stop/background-run/history/report controls
are now wired into Sanity Tests and non-fog Demo/Test, not left as an unused
render callback. Native confirmation gates new observation work; Stop never
requires renewed consent to write more memory or a successful status refresh.
Reading history does not execute, learn or promote. The existing pole run loaded
read-only in the browser with honest historical status and conditional-evidence
labels after source revisions changed. Specialized fog controls remain separate.

Hidden-motion acceptance revealed two blockers, now corrected.
Run `01213007-62f6-4bf5-885f-5fa2ece00167` finished 16 pole
frames under the initial grader. Run `7b4cb42e-bc31-44ef-a329-61b77c43b1b8` stopped
at 30/44 frames when Windows denied atomic replacement of the memory-catalog
dirty marker. Its partial history remains intact. The cache fix now serializes
writers per shared store and retries only replace-time WinError 5/32/33 within
10 attempts; persistent errors still surface and unsafe paths remain rejected.
It passed 100 focused cases including the prior 53 publication regressions;
the coordinator also reran all 36 Windows cache cases successfully.

Independent review also found that the initial hidden-motion grader trusted
self-reported hidden-pixel counts and did not check projected coordinates or
evaluator hash/time alignment. The corrections independently check claimed
pixels, recompute projections from bound earlier observations/times, and verify
evaluator identity/order/hash/time against the frozen receipts and actual PNGs.
The owner reported 97 passing cases; independent re-review reproduced rejection
of the fabricated hidden pixels, `[999,999]` projections, substituted evaluator
hashes and shifted timestamps, with the normal baseline still passing.
No further high-confidence issue was found in that correction.
Fresh live runs followed final activation of instance
`3baf08ac5a804d0683c636f968875508`:

- `d58b64c0-d8d2-4374-9df3-cf72ef61a341`: 16/16 pole-occlusion frames, completed
  and passed at revision 33.
- `ba131823-3167-4f01-8dab-c4d30fb2bbcc`: 44/44 delayed portal-contrast frames,
  completed and passed at revision 89; 230 conditional-model/visibility checks.
  Frame 13 is constant-speed-consistent. Frame 23 observes displacement `[43,0]`
  against `[10,0]` projected from earlier evidence and reports model mismatch.
  Unseen acceleration/fast motion, teleportation, and identity mismatch/another
  unobserved cause remain three unresolved, non-authoritative alternatives.
  Physical cause, identity across the gap, and the hidden path are not established.
- `a1b8c410-eff4-4f05-a197-cf92104f3b97`: the actual generic UI created a step
  cursor, processed frame 0, then stopped at 1/16 after native-memory consent
  was unchecked. Stop succeeded without renewed permission to observe.

The fresh jobs ran concurrently under the corrected shared Windows writer.
The generic UI loaded the completed pole run and its actual frozen report.
Shared selection remained unchanged and no LTM publication was performed.
Earlier partial/error runs and historical grades are retained, not repaired or
relabeled as current. Screenshots are retained in session artifacts.

This batch does not finish every historical TODO. Independent actor-binding and
accepted composition producers, remaining plate/push/stairs mechanism scoring,
domain-specific induction/acceptance contracts, cross-recording LTM ordering,
learned simulation, and specialization-priority policies remain open. Paused ARC
vocabulary work and deferred recording cleanup remain paused. Only reviewed
source/docs/tests belong in the local-main commit; runtime data and the three
unregistered composition/visibility files stay untouched.

### Executable tests and Visual Sequences page (2026-09-12, fog case complete)

**Current priority:** the user chose the fog-of-war/spotlight test as the first
end-to-end case. The shared selection was explicitly changed, with revision
checking, to `recordings/events_tests/spotlight_scene_train_a` (35 frames).
No game or test execution was started by that selection. The first end-to-end
fog case is now complete: current-frame versus native accumulated-known-scene
display, causal frame/STM persistence, explicit stepping/autoplay and honest
scoring. Broader mechanism/producer gaps below remain separate unfinished work.

The user chose **prerecorded positions**, not arbitrary free directional play,
then requested two variants using the same frames: movement and clicking.
Created `spotlight_action_modes_move` and `spotlight_action_modes_click`, each
with the exact same 35 RGBA images as `spotlight_scene_train_a`. The first has
actual RIGHT/LEFT/DOWN receipts along the existing serpentine waypoint grid;
the second has CLICK x/y receipts for the same positions. Frame zero has no
input in either. Step means the next recorded push and resulting observation;
backward frame inspection is not a physical LEFT action. The learner cannot
infer the input interface from identical images.

The additive `fog_action_tests.json` indexes `spotlight_action_modes`; its own
online document is `documentation/spotlight_action_modes.md`. Both evaluator
files share a visual fingerprint and explicitly deny independent visual-trial
status. The paired copies must not inflate independent promotion support.
Three focused regressions passed and 146 files were added without changing
existing records. Backend registration now includes the fixed fog index and
explicit spotlight observer/scoring mappings. Both 35-frame action variants
passed isolated native runs with identical reconstructed pixels/fingerprints;
these are not live acceptance. The public contrast policy rejects `learn:true`
before writes and makes these duplicate visual traces ineligible for promotion.
Current/next recorded inputs expose queued/executed status separately from
outcome evidence. Published IDs are `spotlight_action_modes_move` and
`spotlight_action_modes_click`; earlier shortened draft names were not published.

Fog UI implementation is ready: the combined middle-board view has explicit
native-STM confirmation, Start/Step/Stop/report controls, current/next recorded
actions and coordinates, and separate current-observation versus native-memory
display. It never synthesizes reconstruction from evaluator data. Integration
uses the bound native-checkpoint endpoint
`GET /workbench/recognition/recording-tests/runs/{id}/frames/{frameId}` with the
actual workspace and Visual Sequence query parameters. Ordinary frozen observer
results intentionally omit internal checkpoint state and are not a raster API.
The frontend checks the returned run/source/checkpoint, coverage, write
references and exact earlier read receipt before rendering `rememberedScene`.
Missing or mismatched native output remains unavailable, never reconstructed
from client history or substituted from grading. The service and native-image
adapter were activated for the completed live scan described below.
The UI covers both paired action IDs and preserves the distinction between
timeline inspection and executing a recorded input. No live run was started
while the implementation/version binding remained in flight.

Later display/control refinements are implemented: the complete intrinsic
viewport is fit with preserved aspect ratio and a visible border, and the real
pixel dimensions are shown. Checkerboard is confined to that viewport, not the
surrounding letterbox, for both source PNGs and native-memory canvases.
Actual fog display reports 48x32 pixels and its full rectangle fits the board.
Explicit Play/Pause/Replay frames and paced Play/Pause test controls are
separate; native autoplay requires a confirmed, explicitly created run and
awaits each revision-bound step. Both pause on hidden/suspended contexts,
source changes, errors and completion. Documentation/boilerplate below the board
was removed; only compact input/status information remains near controls.
The right-hand Documentation panel retains the selected test's full content.

Process/doer selectors now use the existing colored combobox. Scope groups are
ordered Single frame, Single frame + STM, Two frames, Two frames + STM, based
only on registered `inputContract.frameInputCount` and `usesSTM`. Unannotated
stages remain explicitly scope-not-declared rather than inferred from their
names. Deduction/induction/abduction result categories are separate tags.
Four focused picker tests plus navigation coverage and TypeScript passed.

The user requested explicit `VALIDATE_MUST_BE_KNOWN` on the native memory image
to prevent answer leakage. Added the read-only
`perception/native_memory_validation.py`: exact observed prefix, source hashes,
fixed-camera RGBA visibility, known-black distinction, and full required-pixel
coverage. It rejects invented known pixels even if their guessed values happen
to be right, wrong values, future/foreign/missing evidence and contradictory
static observations. It never fills memory, calls an observer or reads an
evaluator/teacher image. Six focused regressions passed.

The first actual native fog run, `bd868fd8-f282-4f06-a365-245d58e663bf`, completed
frame 0 through the real registered native observer and persisted frame/STM
memory: **58 known / 1,478 unknown pixels**. The new validation correctly failed
full coverage without modifying memory. Its actual RGBA image and small proof
report are preserved at
`data\omega_vision\runtime\executions\recording-tests\bd868fd8-f282-4f06-a365-245d58e663bf\validation\frame-000000.png`
and `.json`. Frame 1 was safely rejected as stale because an implementation
file changed during active helper work. Do not weaken that guard, reuse the
stale run as a fresh execution, or use it as proof of full fog completion.

**Final current-version live case:** `e37131be-414e-41b4-ba67-ba09005a3125`, revision 71,
processed all 35 frames of `spotlight_scene_train_a` and scored `passed` for the
selected clip. In the authorized diagnostic window, the unchecked native-memory
confirmation was explicitly checked, Start created the run, and Step observed
frame 0. The actual memory image showed 58 known / 1,478 unknown and the explicit
assertion failed as incomplete. Native Play then advanced the rest of the scan
sequentially while the window was genuinely visible and stopped at completion.
The final native image contained 1,536 known / 0 unknown pixels and the explicit
assertion passed as complete and justified. A historical frame-0 assertion after
completion still failed at 58 / 1,478; run revision and native frame/STM file
hashes were unchanged by that assertion. No game, learning, LTM promotion, saved
memory-preference change or source-selection change was needed.

The earlier completed run `5c49a382-773e-461d-a131-a042bad26521` was subsequently
marked stale when the final FIRST_PASS registry metadata changed implementation
hashes. It remains preserved as historical output. The final run above was
created after the last backend activation and after all backend helpers became
idle; both initial and final assertions report `currentImplementationMatches:true`.
Its final validation proof ID is
`e62c44a31fec41d88f19770ec5bdc16176dec20f4e655c6b8eef971349c9985c`.
The service's final active instance is `6e7f474b274f446dad39533c4bad2036`.

The UI calls the separate read-only
`POST /workbench/recognition/recording-tests/runs/{id}/frames/{frameId}/validate`
with `workspaceId`, `visualSequenceId`, `action:"VALIDATE_MUST_BE_KNOWN"`,
`expectedRevision`, `expectedSourceHash` and `expectedNativeCheckpointUid`.
It never sends pixels, gold images or a simulated input. Outcome, not `complete`
alone, controls the displayed result. Failed invalid/unsupported claims are not
repaired. Assertions are browser-held results, not saved server payload/audit
copies; source/checkpoint/prefix and validator hashes remain in the proof.

Historical image/assertion reads now name the frozen producing implementation
and explicitly do not establish execution eligibility. Old v1 missing read
receipts are marked unavailable, not synthesized. The UI displays a historical
warning and withholds Step/Play when producer mismatch is reported; backend
Step continues to reject stale runs. The old v1 baseline above stays preserved.

Desktop/narrow captures are `fog-native-complete-desktop.png` and
`fog-native-complete-narrow.png` in session artifacts. Both actual 48x32
rectangles fit their viewports; documentation remains in the right panel on the
desktop layout. Hidden-page autoplay was also observed refusing to advance.
Foregrounding only the authorized Chrome window made it genuinely visible;
no visibility override was used. These results do not claim a full-family pass
or live acceptance of the two action-contrast variants.

Recognition rows now have a registry-backed colored picker and explicit
Plan / Confirm & call / status / Stop controls. They pass only the actual
`unitId` as `frameId`, never a display ID, index, `moves`, or a sequence-wide
`firstN`. Missing unit identities disable execution. Both requests bind the same
source/frame/stage and flush preprocessing first; source changes discard stale
plans and interrupted calls are not retried automatically. LLM stages retain
their existing rich confirmation flow. The helper reported 33 focused frontend
checks and a build; parent native-image/playback coverage passed separately.
This row UI is code-ready, not yet live-accepted. Opening its picker explicitly
discovers `semantic/execution/read` eligibility and intersects those actual stage
IDs with the registry; mount does not discover or execute. FIRST_PASS stages
declare their real single-frame/no-STM scope but are not yet permitted confirmed
row roots, so they are disabled with an explicit reason. The seven new parent
and resolver roots are eligible. No fallback or authorization expansion was added.

Final focused coverage: 30 Python fog/validation/action-fixture regressions,
133 frontend sequence/picker/row/fog/navigation regressions, and the active
frontend build passed. Existing warnings were retained. The scoped local-main
commit excludes tracked runtime/preferences/selection data and the three
unregistered composition/visibility leaf files; no push or PR is authorized.
Broader actor-binding, accepted composition criteria, domain-specific scoring,
explicit STM-to-LTM transfer and learned simulation remain unfinished.

The user explicitly authorized the seven remaining implementation tasks:
executable/scored tests, real frame/STM integration, causal fixture corrections,
missing detectors/representations, controlled induction with explicit promotion,
competing hidden-motion explanations, and a scoped local-main commit.
Do not treat those tasks as completed merely because the input recordings exist.
The separately deferred LS20 duplication cleanup is not resumed.

Subsequent user clarifications define the active UI scope:

- `view=arc3Play` must list **all shared Visual Sequences** under Recordings,
  independent of game availability or a loaded game. The old list waited behind
  a savepoint scan and silently retained zero on errors.
- **Load** means read-only frame-by-frame playback; it must not try to create an
  `events_tests` ARC engine instance. Actual game replay/resume remain separate
  explicit capabilities. An existing live session is not destroyed to view data.
- Game Player, Test/Demo and Sprite View are peers of **Inputs and Extractions**
  in the per-sequence tab row shown in the user's screenshot. They are not a new
  top-level page-tab row. A provisional top-level change was removed.
- Split intake from consumption: Video Import creates Visual Sequences;
  a dedicated **Visual Sequences** page selects a sequence and exposes the
  peer views. Reuse the current rich extraction/recognition editors, preserve
  old links, selected identity and unrelated URL/editor state.
- The Game Player implementation now uses the shared catalog independently,
  explicit loading/errors, a bounded paged image player and no automatic game
  actions. Actual `arc3_random_player` acceptance showed Recordings (807), loaded
  and advanced the selected `rotated` recording, and confirmed no game sessions.
  Native browser fetch needed a receiver-safe wrapper; its regression is covered.
  Explicitly read-only legacy catalog entries remain browsable, not writable.
- The dedicated `view=visualSequences` route is implemented, reusing the rich
  editor with its source selection and old-link compatibility. The user's final
  tab order is **Inputs, Extractions, Demo/Test, Game Player, Sprite View**.
  Demo/Test content is scoped to the selected sequence. Its controls are hidden
  until **Add controls** is clicked; hiding/showing controls does not start work.
  Standalone Sanity Tests retains its existing default controls.
- Actual browser acceptance verified the dedicated page, peer order, source
  preservation, scoped `rotated` docs, and Add/Hide controls. The 52 frontend
  player/navigation regressions and build passed before the final opt-in
  adjustment; 27 targeted tests and TypeScript passed after it. Screenshots are
  `arc3-all-sequences-player.png` and `visual-sequences-peer-tabs.png` in the
  session artifacts. Only the separately authorized temporary browser navigated.
- Review found and fixed two UI integration issues: entering the stored-frame
  view now synchronously invalidates pending live-replay intent and guards the
  timer/step path, so hidden live controls cannot leave automatic game actions
  running. The sequence-scoped Demo/Test Sprite action now stays on the dedicated
  `visualSequences` surface at `nav=sprites`; standalone legacy navigation remains
  compatible. All 38 focused regressions and TypeScript passed after these fixes.
- The user's later refinement supersedes the five-tab arrangement above:
  **combine Game Player with Demo/Test**, using the ARC3 Player's **middle board
  area**, not its B1/B2 and recordings side panels. Demo/Test remains immediately
  after Extractions and supports stepping without a game. Its controls remain
  opt-in through Add controls. Old `nav=game-player` must stay a compatible alias.
  Put the selected test's documentation in the **existing right-hand
  Documentation panel**, not a new peer Docs tab. This final combined-view
  refinement and the first fog execution are being completed by the UI/backend
  owners; do not claim the earlier standalone layout is the final requested UI.

#### Catalog HTTP 500 and independent selected-source recovery

The user supplied a screenshot of catalog HTTP 500 blocking even selected
`rotated`. Cold discovery profiling took about 37 seconds, exceeding the old
shared writer lock's 30-second wait. Catalog metadata now avoids per-frame
provenance scans where recording order is already established, computes
writability once per entry, permits fresh atomic reads without waiting behind
an explicit rebuild, and uses a bounded catalog-build wait with an explicit
retryable 503 rather than an unexplained 500 if busy.

Added read-only `visual-sequences/resolve` for one exact authorized source. It
rejects unsafe, redirected, retired, missing or unregistered sources and never
depends on the full catalog. Frontend selected-source validation and activation
are now independent of catalog success; no fallback source is invented, and
source retry/error is separate from list retry/error. Twenty-five Python and
fourteen frontend regressions and a build passed. Activated through the existing
supervisor after no active games/demos: the then-selected `push_chain_train_a`
resolved 16 frames in 0.084 seconds while a forced complete scan returned all 807
entries in 35.945 seconds. Vite and selection were preserved during activation.

Added nine non-destructive causal-history recordings under `events_tests`,
indexed separately by `causal_event_tests.json`: measured-motion warm-ups for
move/co_move, later collision/group-formation decision times, observable
prehistory for dissolution/member changes, and confirmed follow/carry episodes.
They have 44 frames and their own online docs/evaluator expectations. The three
focused fixture regressions passed; the 116 files were published additively.
Original shorter recordings/oracles remain unchanged. Grouping baselines still
require independent detector evidence; the added annotations cannot approve a
group or turn a prediction into a fact.

File ownership while implementation is active: `recording-tests-backend` owns
scored execution API/native runner and consumer integration; `causal-event-detectors`
owns the temporal/event core and Prolog detector module; `arc-sequence-player`
owns the dedicated sequence route/profile adaptation and its player component.
The coordinator alone owns shared Git staging/commit and service activation.
No final commit for these seven tasks has been made yet.

#### Confirmed first-pass and reasoning-stage contracts

The user confirmed a per-frame first pass followed by parent stage
`two_frame_x_duction`, with **separate deduction, induction and abduction
implementations**. They explicitly requested that it be callable on a Recognition
row, not merely described in documentation or offered only as a whole-sequence
toolbar command. Calls bind the row's actual execution unit and its validated
predecessor. Frame zero has no predecessor; no duplicate/self pair is invented.
Existing leaf stage identities and persisted histories must remain compatible.

The user also confirmed these four "look at" configurations as **separate stages**:

| Exact requested stage | Allowed evidence |
|---|---|
| `resolve_objects_via_one_frame_and_stm` | Here + eligible earlier recording-level STM |
| `resolve_objects_via_two_frames_and_stm` | Here + immediate predecessor + eligible earlier recording-level STM |
| `resolve_objects_via_two_frames` | Here + immediate predecessor only |
| `resolve_objects_via_one_frame` | Here only |

Evidence scope and reasoning method are independent axes. Non-STM stages must
not silently consume older history through a cumulative checkpoint. STM-enabled
stages enforce frame/publication cutoffs and preserve source identity; selecting
a stage does not rewrite Save To/Look In. Object correspondence can compare
overlapping/shared Shapes, Groups and part structure after alignment, but shared
appearance is evidence of similarity rather than proof of the same Object.
Keep identical-looking instances distinct and hidden parts hypothetical.

Upward level STM -> LTM publication requires a **separate explicit call** with
selected source, destination and records/rules. Never run it automatically after
a frame, level change, induction pass or look-at stage. Preserve STM/history and
provenance; do not silently add LTM to the four evidence configurations. This
architectural decision did not authorize an actual transfer of live memory.

#### Later learned-simulation direction

The user described an eventual Demo/Test mode that generates controls and can
make inferred objects move: an executable learned world model, not only recorded
playback. This is future work, not permission to run arbitrary generated code
or treat it as already implemented. Generating/running it must be explicit.
Recorded frames remain immutable evidence; generated trajectories/frames remain
predictions and cannot become independent confirmation or training labels for
the rules that produced them.

### Additional visual-memory scenarios (2026-09-12, delivered)

The user requested these additions as ordinary recordings with their own online
Sanity Tests documentation, continuing the same `events_tests` layout:

| Test family | Accepted behavior and evidence boundary |
|---|---|
| `color_band_cycle` | Clicking anywhere on the colored target advances through the visibly ordered side band. The user explicitly selected wrapping from the last color to the first. Vary click positions and palette order; outside/side-band clicks are controls. Predict from visible pixels and earlier observed transitions, not a hidden palette/index or an oracle's next-color answer. |
| `spotlight_scene` | A moving spotlight exposes pieces of a static scene. Accumulate observed pixels until coverage is complete; retain earlier observations after the light moves away. Unseen areas stay unknown, including distinguishing unknown from genuinely observed black. Partial scans/revisits must not claim full reconstruction. |
| `occlusion_pole` | A moving asymmetric object passes behind a slender vertical pole, including exactly four consecutive completely hidden frames, partial entry/exit, and reappearance consistent with its observed speed. Remembered/predicted hidden positions are not observed pixels. |
| `occlusion_large_object` | The same kind of temporal identity test behind an occluder substantially larger than the actor, again with an exactly four-frame fully hidden interval justified by the measured speed and geometry. |
| `teleporter` | Use distinctive paired line gates. Include a two-phase contrast: normal four-frame occlusion fitting remembered speed, followed by a remote/too-fast reappearance that violates that constant-speed expectation. Retain unseen acceleration/fast travel and teleportation as alternatives; visible lines and learned portal associations support the latter but do not prove it from one jump. Include no-entry/decorative-line controls. |
| `stairs_gravity` | An object descends stairs whose treads vary between two and three cells, with right-arrow input only. Gravity acts when support is lost; no down command or fixed click-count trajectory. End at a visible right-hand barrier, then record at least three further RIGHT attempts without movement. Distinguish blocked-right from a no-input pause using prior action response, visible obstruction and current evidence. |

The six recording families and their individual online documents are published.
New fixtures use additive
`visual_memory_tests.json` and `action_mechanism_tests.json` catalog supplements;
the original `tests.json`, previously delivered recordings and documentation are
not rewritten. The reader now aggregates only those three explicitly registered
index filenames, validates duplicate IDs/references across them, and rejects
corrupt or redirected supplements instead of silently falling back. Twelve
focused catalog/shared-read regressions passed.

The active test index now exposes 60 documented tests and 168 recording links.
These six additions account for 32 current clips / 778 frames: color band 6/70,
spotlight 6/154, pole occlusion 4/64, large-object occlusion 4/48, teleporter
6/236 and stairs/gravity 6/206. Six earlier outline-portal recordings remain
preserved and loadable as history; current test references use the striped
`_lines_v2` recordings. Prior portal index/doc versions were archived before
the explicitly requested refinements. Existing recording inputs were not
renamed, migrated or overwritten.

Executable constrained baselines are `ColorBandMemory` (pixel-derived band and
target, frozen before-click predictions, observed step evidence),
`SpotlightMemory` (observation-only RGBA accumulation, including known black),
and `PortalAssociationMemory` (conditional destinations from earlier witnessed
gate associations). They are not full Workbench semantic-stage integration or
automatic test passes. Execution status remains `not_run`; no memory/rule
promotion or tracker-lifetime/access weakening is implied.

The sequential contrast is
`teleporter_train_delayed_lines_v2`: phase 1 hides the actor completely at
frames 7-10 and matches the prior +8 px/s; phase 2 reappears at frame 23 with
+43 px displacement versus +10 px expected. The first supported conclusion is
constant-speed model mismatch; unseen acceleration/fast travel and teleportation
remain competing explanations. The per-test doc and evaluator-only
`observer_assessment.json` make the decision-time boundary explicit.
`stairs_gravity_train_a` ends with identical visible frames 37-40 but actual
RIGHT attempts at 38-40, with the barrier and ground support still visible.
The no-input pause/fall control is explicitly different evidence.

All 71 combined visual-memory/mechanism/catalog regressions passed; independent
focused review found no significant issues. Activated the additive catalog
through the existing API supervisor with no active games/demo playback; Vite
remained running. Actual `arc3_random_player` frontend API parsers loaded all six
documents, 32 current clips and 778 frames, and representative frame PNGs were
served through the normal asset route. The user's then-current
`recordings/events_tests/push_inertial_test_control_a` selection was preserved.
No user browser navigation or Workbench recognition/learning job was started.

### Per-test online documentation and recordings (2026-09-12)

The user clarified that the memory plan belongs in each test's online
documentation and that pressure-plate/pushing tests need actual recordings.
They explicitly chose individual entries on Sanity Tests with documentation
and recording controls, rather than a standalone plan or Help-only integration.

- Added a file-backed Recording-based tests section to the active Sanity Tests
  page, preserving the existing demo cards and run controls. Each test expands
  to its own rich Markdown documentation, recording choices, real frame preview,
  previous/next/scrubber controls, and explicit Load recording in Sprite View.
  Search and group filters cover Events, Pressure plates and Pushing.
- Published 54 test entries: 38 original event tests plus eight pressure-plate
  and eight pushing families. There are 136 recordings / 2,216 frames, including
  98 new induction clips with independently varied training, controls,
  validation and final-test examples. The original 321 fixture files remain
  unchanged. All recording inputs remain under
  `data\omega_vision\recordings\events_tests`; documents are real saved files in
  its `documentation` directory and `tests.json` indexes the test entries.
- Added read-only `/workbench/recognition/recording-tests` list/detail routes.
  They validate workspace context without partitioning data, enforce fixed
  shared-root resources and numbered recording paths, and report unavailable or
  corrupt inputs. They never run a detector, learner or generator on GET.
- The new test entries remain **Not run**, not automatically passed. Opening
  docs, switching a test's preview recording and stepping frames do not change
  shared selection or execute recognition/training. Loading explicitly uses
  the existing revisioned shared selection and canonical Sprite View routing.
  The new input fixtures do not implement the remaining domain detectors or
  prove learned-rule accuracy.
- Backend focused coverage passed 79 cases and 28 documentation-refinement
  checks; frontend coverage passed 36 cases, with 14 rerun after the final
  cached-catalog load adjustment, and the active frontend build completed.
  Independent generator review found no significant issues.
- Activated the API through the existing supervisor after confirming no active
  game sessions or demo playback; Vite remained running. Live APIs resolve all
  54 online documents and 136 recording references. The user's then-current
  shared source, `recordings/events_tests/color_changed`, was preserved.
- User authorized a separate temporary Chrome window. Actual
  `workspace=arc3_random_player` acceptance exercised pressure-plate docs,
  training/control recording selection, pushing frames, search, narrow/desktop
  scrolling and the Load recording control. The load used the already-selected
  `color_changed` source to avoid replacing the user's selection; only the
  temporary tab navigated to Sprite View. No test run or training was started.
  The existing Sprite View initialization issued its ordinary memory-setup and
  page-state requests; those are not a claim of zero application writes.
- Acceptance found and corrected an inaccurate generated paragraph describing
  positive induction clips as no-intervention controls. The generator now gives
  variant-specific descriptions tied to actual trace activity. Corrected 16
  induction Markdown documents and 98 `evaluation.json` descriptions only,
  after verifying all 4,760 generated baseline files. The exact 114 previous
  versions are preserved at
  `data\omega_vision\runtime\documentation-repairs\20260912-clip-descriptions-v1`.
  Other 4,646 files, including images/states/manifests and the original 38
  examples, retained their bytes and timestamps. All 39 repair-focused tests
  passed; ordinary generation remained idempotent with zero new files.
- The real frontend API parsers loaded all 54 documents, 136 recordings and
  2,216 frames from the running API. The corrected online plate documentation
  distinguishes positive occupation/release trials from no-occupation controls.
  Screenshots are retained in the session artifacts as
  `recording-tests-plate-desktop.png` and `recording-tests-push-narrow.png`.
  This completes the documentation/recording delivery, not implementation or
  successful execution of the remaining induction/detection mechanisms.

### Local-memory detection and induction plan (2026-09-12)

The user requested a plan for how each miniature recording uses local memory to
detect its event, plus pressure-plate and pushing-object induction tests.
Saved the plan in
[Event recordings: local-memory detection and induction](docs/design/EVENT_TEST_RECORDINGS_LOCAL_MEMORY_PLAN.md).

The document covers all 38 existing cases individually, their necessary
predecessor/window/episode memory, event timing, ambiguity and implementation
gaps. It identifies insufficient initial motion history, delayed collision/carry/
following evidence, oracle-only attempted inputs, and pending grouping/lineage
contracts rather than pretending the fixture labels are working detections.
Existing recordings and expected files are preserved; proposed corrections are
versioned additions, not automatic replacements.

It also specifies eight pressure-plate and eight pushing induction scenario
families, including momentary/latching/toggle/delayed plates, causal controls,
free/directional/blocked/chain pushing and pushing a crate onto a plate.
Training, independent validation, frozen final tests, signed negative evidence,
explicit approval, later recording-local STM reuse and separate abduction are
planned. New domain predicates/measurements and stronger mechanism-learning
capabilities are explicitly identified as work, not assumed available.

This checkpoint is documentation only: no new induction recordings, detectors,
memory payloads, learned rules or preferences were created by the planning task.
The immediately preceding user-authorized API restart completed through the
existing supervisor; Vite remained running and all 38 event recordings remained
available. No further service restart or browser navigation was performed.

### Miniature event recordings (2026-09-12)

Created the user's requested loadable examples at
`data\omega_vision\recordings\events_tests\<event_type>\<frame_number>`.
There are 38 ordinary recordings with 122 RGB 64x48 frames: one example for each
of the 25 registered instantaneous event types, one complete start/continue/end
lifecycle for each of the 11 lasting relations, and no-material-change/unknown
controls. This covers the current 58 event/phase vocabulary targets, not every
possible real-world event or a claim that every target has a working detector.

Each recording has `recording.json`, numbered `0\image.png`, `1\image.png`, etc.,
matching `state.json` files, and a separate `expected_events.json`. All moments,
including the baseline, are explicitly numbered; no duplicate root preview frame
is added. `events_tests\suite.json` indexes the examples. The oracle includes
frame pairs, expected terms, stable fixture entity names, pixel hashes, timing,
scene annotations and evidence requirements. Grouping/lineage argument conventions
are explicitly fixture-local, not a new runtime schema. Expectations and causal,
depth or identity annotations are never injected as detections, accepted rules
or memory. Recognition has not been run on these examples.

The reproducible creator is
`python -m omega_vision.evaluation.event_recordings` from this checkout.
It uses shared path/lock/catalog helpers, reuses identical existing inputs, and
refuses differing existing files or redirected destinations without overwriting.
Generated recordings are local data under the existing ignore policy; the source
cases and creator preserve the dataset definition for future regression tests.
No existing recording, shared selection, preference or service was changed.

The 14 focused regressions cover vocabulary/phase coverage, visible pixel changes,
ordinary recording loaders, frame ordering, two-workspace shared identities,
oracle separation, idempotence, existing-file preservation and write containment.
Live `workspace=arc3_random_player` catalog, recording directory and import lists
all expose the 38 cases; each initial frame loads through recording-context.
The shared selection stayed `recordings/ls20/20260718-154544`. The user's active
page was not navigated. Broader detector implementation and the previously
deferred recording-duplication cleanup remain outside this dataset task.

### Completed memory implementation checkpoint (2026-09-12)

This checkpoint supersedes the incomplete-status notes below, while preserving
their incident history. Work remains in the user's existing local `main`.

- Fixed recording/level default selection: current-frame locations remain
  explicitly selectable, but cannot be frozen as defaults shared with other
  frames. The defaults cache now contains only context-stable native choices.
  Saved user preferences are not rewritten or silently retargeted.
- Traced the unexpected preferences PUT to Memory Setup's disclosure handler,
  which previously called Save. Disclosure now edits a draft only; explicit Save
  retains conflict handling, duplicate-write protection and stale-response guards.
- The native multi-frame active integration suite passed all 24 cases after
  the default fix. Shared selector, inspector and reasoning frontend coverage
  passed 135 cases and the active frontend builds.
- Existing root-initial observations are implemented as the pipeline's
  existing `image` unit (`transforms/image/memory`), gated by explicit step-zero
  state. Numbered moves and old data stay in place; current/previous context
  must match the same execution order.
- User expressly authorized repairing only the stale `_2` directory references
  in the selected unsuffixed recording's `recording.json`. Original manifest:
  `data/omega_vision/runtime/recording-manifest-repairs/ls20-20260718-154544-b8336ea2d6ee448fb134c6399c12984a/recording.json`,
  SHA-256 `16FCD28A918DF1A5364080E1C606D6B765380282C118E36FA069FBA2F3559E56`.
  Only `level_directory` and the 13 `moves[].directory` references were changed.
  No images, actions, timestamps, geometry, source recording or duplication were
  merged/deleted/rewritten. The deferred duplication task is still deferred.
- `OMEGA_STORAGE_BOUNDARY.md` now documents the implemented bounded abduction
  stage and `abduced_events.metta`, scoped induction review, shared selection,
  explicit preference Save and remaining unsupported domains. No claim is made
  that Nowhere abduction, arbitrary learning-procedure ASTs, richer group/class/A
  schemas or unspecified hierarchy/LTM policies have been implemented.
- Completed real-dispatcher abduction first/repeat runs against extended
  canonical logs. Immutable prefix receipts are authenticated against journal
  history and current prefix evidence instead of requiring the latest whole
  snapshot. Changed evidence is still rejected. Nowhere/missing preferences
  make abduction unavailable for execution, not the entire execution inspector.
- Focused combined Python coverage passed 277 cases; the full active integration
  suite passed 24, additional prefix/repeat-abduction coverage passed 21, final
  context/default coverage passed 83, and the final Demos observation suite
  passed 6. Frontend memory/selector coverage passed 135 and the build completed.
  The final focused review reported no significant remaining issue.
- Activated via the existing visible API supervisor only after the live API
  reported no game sessions or active demo. Vite and the deferred duplicate
  data were not restarted or altered. Actual LS20 context returns 14 moments:
  `image` at order 0, move `0` at order 1, through move `12` at order 13.
- The browser tool's shared profile was occupied, so the user authorized a
  separate temporary Chrome profile; no existing browser was terminated.
  Actual `workspace=arc3_random_player` inspector and Demos tabs showed the
  same canonical selection, enabled frame/source controls, and no automatic
  run/import or preference PUT. Opening Memory Setup created only a draft;
  selecting Previous Moment on the initial image returned `no_predecessor`
  without changing Save To/Look In. Screenshots are retained in session
  artifacts as `memory-final-inspector.png` and `memory-final-demos.png`.
- This is the completion checkpoint for the scoped local-main source commit.
  It does not claim completion of the deferred design domains or the separate
  recording-duplication cleanup.

### Obsolete ARC sequence roots retired (2026-09-11)

At the user's request, remove active defaults, catalogue families and path
rewrites for `arc_recordings` / `arc3_recordings` and nested variants.
These names remain only in retirement guards, unavailable-storage inventory,
negative regression fixtures and historical documentation/provenance.
Demos and Phase 3 now resolve the shared selected source; previews no longer
scan an obsolete directory or choose the longest unrelated recording.
Cross-window selection reflection replaces stale sequence URL parameters while
preserving the rest of the URL and without importing/running anything.
No recording data or historical provenance was deleted or rewritten.
The previously observed page-state JSON was already absent when checked;
do not recreate or replace it merely to remove a historical reference.
The focused retirement suite passed 80 Python cases and 29 Node cases, and the
active frontend builds. At the final activation check neither port 8000 nor
5173 had a listener and no API launcher process was found. No closed service
was restarted. The cleanup is saved in this checkout and takes effect on the
next authorized startup; it is not a claim of live acceptance or completion of
the separately pending memory-default integration issue.

### Live selector/source recovery checkpoint (2026-09-10)

The user independently moved/restored the unsuffixed source and then explicitly
approved `recordings/ls20/20260718-154544` as the shared default everywhere.
The live catalog reports 14 frames, Level 1, writable canonical storage; the
old `arc_recordings/data-recordings-ls20-20260718-154544` directory is absent.
The shared preference was saved at version 1 under
`data\omega_vision\preferences\visual_sequence_selection.json`. No recording
files were changed for this default update. The earlier duplication/copy
checkpoint below remains historical evidence, not permission to resume merging.

The user approved API-only activation. The visible supervisor restarted the
API without restarting Vite or requesting a pooler change. The new selection
route now serves the real nonempty catalog (622 choices at the recovery check).
Demos source synchronization now carries the expected shared revision, and
source-sensitive Run/Play/Seek commands validate that binding. The corrected
live WebSocket acknowledged the canonical unsuffixed source and its revision
without a Run command; a freshly loaded Demos page had its Run control enabled.
Older page instances can retain the earlier missing-argument/waiting state
until reloaded. Source/result snapshots and preview cache keys are bound to
the same captured sequence, preventing cross-window relabelling.

Memory implementation remains in progress, not complete: the expanded native
integration tests exposed frame-local default destinations being frozen into
recording/level preferences. That cross-frame default issue still needs repair.
The abduction stage, causal API integration, shared selector UI and related
changes are uncommitted. Do not claim the whole memory workflow is finished.

### Memory implementation resumed explicitly (2026-09-10, 20:55 +08:00)

The user requested implementing the memory workflow now, including deduction,
induction, and event abduction. Parent continues option-A native memory API
wiring and shared selection/context endpoints. Bounded helpers
`memory-abduction-engine` and `memory-selection-ui` own only their explicit
core/adapter/test and frontend-selector allowlists in this same local checkout;
parent alone owns staging/commits and service lifecycle. No helper may touch
the deferred recording duplication or operator data.
The visible inspector selector, Demos, and other Visual Sequence pickers must
share one persisted selection across all browser windows. The confirmed
legacy unsuffixed default remains read-only until the user resolves migration.
Abductive explanations must be separate grounded hypotheses with assumptions,
evidence, scope, and rule provenance, never auto-approved observed facts.
This resumption does not authorize finishing the partial recording copy,
stopping its active pooler, or silently discarding API sessions.

### Recording duplication deferred by user (2026-09-10)

The user will resolve the recording duplication later. Stop this migration:
do not continue copying, overwrite more files, delete sources, or pause/restart
the pooler to finish it without renewed authorization.

The user had explicitly authorized copying
`recordings/ls20/20260718-154544_2` into `recordings/ls20/20260718-154544`,
preferring the `_2` geometry and archiving the destination's prior geometry.
All 14 `_2` frames matched the selected legacy sequence pixel-for-pixel.
The copy then stopped on a checksum mismatch at `7/todos.json`: the active
transformation pooler is writing the `_2` recording (control command `run`).
At the last read the destination contained 23 files, and `recording.json` had
NOT been copied. This is a partial copy, not a completed migration or a new
validated default. Do not refresh/relabel it as a complete recording.

The original destination geometry was backed up and hash-verified at
`data\omega_vision\runtime\recording-merges\ls20-20260718-154544-52ee3189ad724b61aef7acec421ef44f\before\transforms\image\parts_extraction_0\python_opencv\geometry.json`
(SHA-256 `1AC40039DE2886F7F96375FA18B7DEC7C23BF27A86F9795B348B7210E34E06CC`).
Neither `_2` nor the legacy `arc_recordings` source was deleted or modified by
the copy operation. The pooler, API, and Vite were not stopped. Its active
writes prevent claiming that the source stayed unchanged during copying.

### Shared Visual Sequence selection confirmed (2026-09-10)

All Visual Sequence combo boxes must share one selection across Recognition,
Objects, Demos, the Shape/Object memory inspector, and all open Workbench browser
tabs/windows. Do not partition that selection by workspace or give the inspector
an independent first-available default.

The user selected and confirmed the exact 14-frame browsing default
`arc_recordings/data-recordings-ls20-20260718-154544` (provider reference
`data/arc_recordings/data-recordings-ls20-20260718-154544`), WITHOUT `_2`.
The shared catalog reports this historical sequence as read-only and requiring
explicit migration for writes. The user explicitly accepted it as the shared
browsing default. Do not substitute `recordings/ls20/20260718-154544_2`, copy or
migrate the recording, or bypass contextual-memory/write restrictions.
Unavailable recording/frame context must remain explicit.

Selection changes must not start imports, recognition, models, or demo
computation. Preserve unrelated page/subview state and independent memory
Save To / Look In choices. Cross-tab/window synchronization and Demos/inspector
selector integration remain pending implementation; identifying the default
is not evidence that those controls already synchronize.

### Recognition Help explanations (2026-09-10)

At the user's follow-up request, both explanations now live in
`docs/design/OMEGA_STORAGE_BOUNDARY.md` beside the explicit game/level/recording/
frame memory tree, not in `docs/VIDEO_IMPORT.md`. Video Import Help retains a
link rather than a duplicate. The existing right-side Help panel selects
`Recognition & Memory` for the Recognition subview and Demos; other Video
Import subviews retain their own help. Both the general switch/door comparison
and the visual-system split preserve frame-local causality, proposal/approval
distinctions, the agreed MeTTa layout, and the status that event abduction is
still being designed. This does not mark the pending memory API wiring or
Demos selector integration complete.

### Memory layout reaffirmed (2026-09-10, 20:21 +08:00)

The user confirmed retaining the earlier memory design, not replacing it with
the intervening `memory_frame`/directory sketch. Under the shared
`data\omega_vision\recordings\<gameId>` root, keep `memory_game_all`,
`memory_level_<n>_ltm`, `<recordingId>\memory_level_<n>_stm`, and
`<recordingId>\<frameId>\memory`. Memory areas retain the documented MeTTa
database files, including `shapes_db.metta` and `objects_db.metta`, with separate
group/class databases as specified in `docs/design/OMEGA_STORAGE_BOUNDARY.md`.
Keep frame-local induced proposals, explicit promotion to that recording's
level STM, strict-previous reads, and no automatic onward promotion or LTM copy.
Do not implement `memory_frame`, singular `shape_db`/`object_db` directories,
or a new `prev_frame_induction` directory based on the superseded sketch.
No memory paths, files, or historical data were changed by this confirmation.

### Resumed TODO implementation (2026-09-10)

The user requested resuming this TODO list after the local-main ledger cleanup.
Coordinator `c75fc682-11e5-4e13-a872-13e563d8b48f` is continuing the existing
visible CMD launcher correction first, in the user's local `main` checkout.
Source changes and focused non-service checks are resumed; service starts,
visible diagnostic windows, data repair/migration, and deferred research audits
remain outside this step. Preserve the existing inspector, research, runtime,
and other uncommitted edits. Earlier all-stopped notes below are historical
for this resumed source task, not permission to restart anything.

The user then explicitly required visible pre-execution commands in batch and
plugin launchers, selecting visible CMD windows for every Workbench-controlled
plugin process launch, even when a saved policy requests a hidden window.
The briefly supplied `openworld_dr` path was withdrawn; work remains here on
local `main`. No files in that other repository were changed.

**Launcher source checkpoint:** completed the existing CMD wrapper integration.
Startup-policy launches, submitted managed commands, and managed-service
start/reconciliation now share the visible, command-first console boundary.
Disabled/already-running services remain untouched; saved policies are not
rewritten. Existing service logs and protocol stdout behavior are preserved,
and in-process plugins stay in the API console. External plugin-owned
repositories and launch scripts were not modified.

API/Vite batch entrypoints display safely formatted host/port command lines
before credential/application bootstrap, then the actual resolved Python
command and argument values immediately before execution. Display templates
substitute only explicit placeholders, preserving literal `--env` names.
CMD bootstrap paths travel through one environment expansion rather than
incorrectly escaped nested command-line quotes; original child argv and
caller environment are preserved by the existing private payload boundary.

Focused source/mocked coverage passed 26 cases; the expanded suite passed
66 cases with one real-child diagnostic deliberately deselected. Native
launcher coverage used inert executables, copied scripts, and
`CREATE_NO_WINDOW`, not services or visible diagnostic windows. The default
pytest scratch directory was inaccessible; the successful runs used fresh
task-owned scratch directories without modifying its permissions.
The earlier `/describe` receipt still has no captured exit code, and its old
panel is now closed. Source integration is complete; live visible-window and
user-context menu/inspector acceptance remain pending explicit launch
authorization. No services, game sessions, reimports, or data repairs were
started to complete this checkpoint.

### Shared planning handoff - all work stopped (2026-09-10)

The user selected this file as the shared planning place. All implementation,
tests, browser acceptance and process launches are paused. Helpers have been
told to stop; preserve every existing edit and artifact. The tasks below
supersede older pending-status and running-process notes, not their evidence.
Do not restart or resume anything automatically.

**Runtime:** the hidden API had exited and the owned hidden Vite copy was
stopped at the user's explicit request. The last check found no owned listeners
on 8000/5173 and no surviving known API/Vite process trees. Visible terminals,
unrelated processes and disk data were not removed. Future authorized launches
must use visible Windows Command Prompt/DOS boxes, with a readable first line
showing the actual Python/service command and port, never hidden copies.

| Pending task | Current state and next authorized-work boundary |
|---|---|
| Visible CMD launch correction | Partial uncommitted changes select `cmd.exe`, keep Workbench API/web visible and add service/port text. Final test updates were blocked when plan mode began. Finish and validate only after renewed implementation authorization; do not launch services automatically. |
| Launcher output receipt | A later read of existing `omega-launcher-check` recovered command-first `/describe` help output. Earlier reads had failed. No exit code was captured; reconcile this evidence without another diagnostic launch. |
| Menu/combined-page acceptance | Source committed in `396ef78185eb4e9741837ce9d617b40aa33e9e35`: family/per-item visibility, recovery, preserved drafts, combined Video Import/Frames, contextual Temporal canvas, default-workspace preference and explicit-only game actions. Final acceptance remains incomplete; use `workspace=arc3_random_player`, never substitute another menu. |
| Fixed contextual inspector | Backend committed in `ef8b32c073021c17332fe98afeb3b70bd14271bd`; host, six inspector files, tests and explicit frame-ID mapping remain uncommitted. Final source checks/build passed before stopping. Complete exact allowlist integration and read-only acceptance after authorization. |
| Unexpected preferences write | Read-only inspector acceptance observed one `PUT /semantic/memory/preferences` without an intentional Save. Identify the exact trigger before claiming no-mutation acceptance; preserve evidence and do not mask it by changing user settings. |
| Native reference example | Exact reference/cutoff behavior is model-covered; a genuine native attributed live sample is absent. Do not migrate outside-root records or fabricate a sample. |
| Contextual hierarchy and LTM policy | Movie/Chapter ordering needs authoritative hierarchy metadata; additional LTM participation is unspecified. Keep unavailable results explicit, never infer folder/timestamp order or include current/future children. |
| Scoped rule gaps | Induction-procedure AST/acceptance and cross-area immutable parent references for new cross-frame deployment remain undefined. Preserve existing proposal history, gates and current-recording level-STM promotion. |
| New typed domains | Group/class producers/readers and recursive/A rich payload renderers remain planned. Preserve Shape-group versus Object-group membership, separate class identities, recursive Objects-as-parts, attributed Shapes and observed/inferred distinctions. Do not invent A storage or runtime entities. |
| Display vocabulary | Uppercase stable markers and capitalized names are display-only; never rewrite IDs, paths or raw MeTTa/Prolog. Research uploads are not approved runtime schemas. |

**Known evidence:** invalid Operations raw JSON survived hide/reveal without
saving; the Temporal canvas followed its actual context without URL/scroll
changes; corrected frame mapping uses manifest `unitId` (`0_image` -> `0`),
not transient display order. Read-only acceptance saw no new import/session/game
actions after the safety fixes, but the preferences PUT prevents a clean final
inspector claim.

**Committed safety/implementation checkpoints:** `dd6d6ebfe` rejects unconfirmed
recording replacement; `de867627e` and `6a2d71877` contain launcher diagnostics;
`37433ad99` established shared storage/inspection; `d902a99c3` implemented the
combobox option-list cache. Preserve the earlier recording-regeneration incident
and uncertain output-loss baseline; no automatic repair, reimport, rollback,
migration or cleanup is authorized.

**Ownership:** main coordinator owns this ledger, Git, servers and host seams.
Frontend owner `a067a06c-0bc4-44cc-b40a-ced2b38ea46b`, backend
`omega-storage-boundary`, and launcher/pool/read-only acceptance helpers are
paused. Their exact earlier allowlists remain the handoff of record. No helper
should create a competing plan. No PR, remote push, new branch/worktree or
implementation resumption was requested by this planning handoff.

- Launcher activation bypass / visible-output gap (2026-09-10): the user
  reported three blank consoles after API activation. The activation command
  was raw `.venv\Scripts\python.exe ...run_api_server.py --host 127.0.0.1
  --port 8000 *> contextual-memory-activated-api.log` through the detached
  PowerShell tool, bypassing both the announced BAT and console wrapper.
  Read-only ancestry: tool PowerShell 40676/conhost 832 -> PowerShell
  32248/conhost 69696 -> Python 56660 -> 53236 -> 93708 -> API 13452,
  created around epoch milliseconds 1789024074942-1789024075899.
  These processes survived the user's closing the blank windows. This does not
  establish ownership of all three closed windows; other-parent 97096 console
  processes were explicitly not attributed or touched.
  Source corrections now provide command-first headers/titles in all 14 BAT/CMD
  entrypoints, pre-Python project shell announcements for visible services,
  private JSON argv transport with original-environment restoration, direct
  raw-API console diagnostics before slow imports, and PID/parent/launcher/spawn
  attribution in new receipts. A required visible bootstrap refuses to start
  its child if its first command could not reach its attached console.
  No service was restarted to test these corrections. Thirteen source/mocked
  checks and two static inventory checks passed; the previous 104 native/stub
  checks do NOT validate the bypassed activation or prove the new visible path.
  Two explicitly authorized diagnostic attempts used terminal canvas provider
  `connection:stdio-ba5b7e0c-eaf5-4356-bec1-7d75a4b243cb`, canvas type `terminal`:
  first instance `omega-launcher-check`, title `Omega launcher check — no services`,
  command `cmd.exe /d /c "C:\snet\PeTTa\repos\symbolic_ml_workbench\python\workbench_api_server\scripts\run_api_server.bat" /describe`;
  second instance `omega-launcher-retained`, title
  `Omega launcher check — retained output, no services`, same command with
  `/d /q /k` instead of `/d /c`. Both open calls returned the specified instance
  and input. For each, `read_terminal_output` with
  `{"mode":"full","max_chars":12000}` twice returned
  `Terminal not found or not running`. No cause, visible first line or exit
  code was established. The second instance received `send_terminal_input`
  `{"input":"exit","append_newline":true}`, returning `{"sent":true}`; this
  acknowledgement alone is not proof of shell execution.
  No third launch or tool-internals workaround was attempted. The final
  read-only process check found no matching cmd `/describe` or Python
  `run_api_server.py --help` survivor; API 13452 and Vite 74704 still listened
  on 8000/5173. Existing services/data remained untouched. Visible diagnostic
  acceptance stays explicitly incomplete; unrelated safe work need not wait.
  Final source/mocked/documentation run: 35 passed, one real-child diagnostic
  test deliberately deselected (no further visible/native attempts), and one
  unrelated repository-wide Markdown failure because the newly uploaded
  `Game_Object_Recognition (1).md` lacks a README backlink. The user's uploaded
  original was preserved; it was not edited to satisfy an unrelated assertion.

- Controlled activation (2026-09-10): the user explicitly accepted loss of the
  API's in-memory sessions. Rediscovered owned worker 75664 / supervisor 34316
  immediately before stopping their owned shell; Vite was not restarted.
  New API worker 13452 is healthy and initially reports zero game sessions.
  The recorded LS20 manifest and pooler-control SHA-256 values are unchanged.
  No game session was recreated, recording re-imported, data migrated or
  historical output repaired by the activation. Config-only area GET returns
  all 15 fixed/context/session/legacy choices with unloaded counts; warmed
  response was 107ms (the first request during startup/context work was 11.188s).
  Clean user-context UI acceptance is now in progress on isolated page 3;
  user page 1 and its URL remain untouched.

- Existing-app UI visibility/navigation candidate (validated source; final live
  acceptance pending): two independent family switches and per-item controls
  use the real menu/workflow/plugin registry; common Settings remains reachable.
  Hidden visited editors retain state with suspended effects. Invalid raw JSON
  in a real Operations document survived hide/reveal exactly without a save.
  Intake and Frames/Filters are combined on Video Import, retaining the rich
  controls, selector/Refresh and Preprocessing placement. One Temporal canvas
  opens after the actual Recognition context without changing URL or scroll;
  opening used only the existing read-only execution-read transport.
  Acceptance identified and corrected delayed Activity-disconnect writes,
  stale legacy navigation overriding explicit menu switches, and unintended
  game-link import/session restoration. All URL restoration is now read-only;
  actual Import/Load/Start/Watch actions remain explicit. Deferred workflow
  initialization no longer replaces retained children on reveal.
  Missing workspace selects ARC3 Random Player; explicit `default` redirection
  is governed by the default-checked Settings preference, without navigating
  current drafts when toggled. Other invalid explicit workspaces remain errors.
  The frozen UI slice passes 89 Node tests, TypeScript/production build and
  66 navigation source-contract tests. Inspector-foundation additions are a
  separate slice. Final clean no-mutation browser acceptance is still held for
  authorized API activation; prior successful partial checks do not substitute
  for that final pass.

- UI navigation/import safety incident (2026-09-10; acceptance held): an
  ordinary restored Video Import URL emitted unrequested
  `POST /workbench/arc3-play/import-recording` and `/sessions` (both 201).
  The frontend owner traced this to Arc3PlayPage treating any `?game=` link as
  an instruction to import/resume, including the always-mounted embedded player.
  URL restoration is now being made read-only in both embedded and standalone
  players; actual imports/starts/replays require explicit user actions.
  The former backend `_purge_prior_import` recursively deleted recording
  directories matching `imported_from` and removed matching savepoint entries.
  Read-only evidence for `data/omega_vision/recordings/ls20/20260718-154544_attempt8`:
  manifest SHA256 `E0913CB17A94E6157D3BAE71020A325DCAB684C87EC516F16358D7F503A5959E`,
  regenerated `started_at`/`updated_at` around `2026-09-10T05:01:01Z`,
  imported from `data/importables/release-runs/ls20/20260718-154544`;
  91 moves/direct child frame directories and zero immediate `todos.json`.
  A later 92-frame read DOES NOT prove prior generated outputs survived.
  Earlier `verify_main_semantic.json` records successful event-log writes and
  reused stages, but already had null TODO hashes; absence of TODOs alone is
  not evidence of their loss. No complete immediate pre-incident file baseline
  is available, so no total loss count or exact causal attribution is claimed.
  Current read-only session inventory included LS20 IDs
  `bacf907b70ef4ab1a3d0600c6722e595` (`saved_576`) and
  `bf3e481744e1416699217315c4392de6` (`saved_584`); unrelated sessions remain
  untouched and not attributed to this incident.
  Main now has a narrow backend guard: repeated-source imports/movelist imports
  reject with 409 without deleting history; the existing safe suffix policy for
  different-source filename collisions remains, with atomic new-directory
  claims protecting racing collisions. Ninety focused temporary-directory
  tests pass, including byte-identical metadata/frames/todos/results/memory on
  rejection. No real recording was re-imported, repaired, rolled back or deleted
  to validate the fix. Live acceptance waits for controlled activation of the
  safety fix; pending MeTTa-memory changes must not be silently bundled into it.
  The isolated safety commit is `dd6d6ebfe0408fc5b74517ca3a19052e5603e0fb`;
  frontend and memory work remain separate. UI acceptance uses the actual
  `arc3_random_player` menu and preserves user page 1. The frontend follow-up also
  owns missing-workspace ARC3 defaults and the default-checked Settings control
  for explicit `workspace=default` redirection; no backend/data partition change.

- Contextual memory follow-up (Shape/Object foundation validated; activation pending):
  [the current memory design](docs/design/OMEGA_STORAGE_BOUNDARY.md#contextual-memory-design-and-implementation-boundary)
  records six always-ready semantic areas, strict previous-child exclusion,
  real shape/object DBs, separate shape-group/object-group DBs and corresponding
  group-class DBs, plus `obj_classes_db.metta`; per-recording/per-level STM, shared
  game-level LTM and per-frame memory. Scene reads only its recording-level
  STM before the current frame. No expiry/copy/migration or guessed ordering.
  Scoped deduction procedures, induction procedures and induced proposals are
  distinct; proposed rule DBs are co-located, with unapproved proposals normally
  in the originating move/frame area and explicit promotions in the current
  recording's per-level STM, retaining origin and generation/promotion order.
  Rule co-location is recorded as design,
  not completed implementation or authorization to move existing source/history.
  The earlier eleven physical choices are compatibility extras, not substitutes
  for the six primary contextual views. Frontend visibility/combined-page/
  Temporal work is a separate finalized child slice awaiting owned live review.
  Backend compatibility failures have been resolved: 244 focused tests passed
  with one Windows privilege skip, then 92 review-fix checks and nine immutable
  multi-level publication-history checks. All 14 frozen source/test hashes match
  `.codex/contextual-memory-receipt.json`. Final targeted re-review is clear.
  Live restart is coordinated, not automatic: API PID 75664 currently retains
  unrelated WA30 session `3c8819ab456f4330a60a41f0cfd7b6eb` at
  `data/recordings/wa30/saved_003` as well as the two recorded LS20 sessions.
  No active Video Import jobs were returned, but that does not authorize
  discarding another game's in-memory session.

- Windows startup diagnostics (2026-09-10): audited all 14 tracked first-party
  BAT/CMD launchers, with no dependency/cache/external-project script edits.
  Inventory: root `run_workbench.bat`; `python/arc_cli_debugger/cli/interactive_runner.bat`
  and `webui/run_webui.bat`; API script launchers `run_api_server`, `run_demo`,
  `run_vite_server`, `run_channel_relay`, `run_clawrouter`, `run_omniroute`,
  `run_meet_bridge`; and `scripts/setup_windows.bat`, `build_api_docs.bat`,
  `install_vb_cable.bat`, `codex_commit.cmd`.
  Each prints path/purpose/cwd before bootstrap, then resolved Python commands
  and safe options before invocation. Handoffs/probe redirections are visible.
  Secret setup output remains withheld with a generic failure warning; no
  environment dump/global command echo. Arbitrary forwarded arguments remain
  unchanged in execution but are withheld in batch diagnostics; py.exe and its
  version selector are shown without another discovery invocation.
  Added native Python diagnostics for startup policy, managed submissions/waits,
  API supervisor workers, plugin registration and detached task-pool/mailbox
  boundaries. Declared service/plugin descriptions, configured ports/URLs and
  log paths are shown, not invented endpoints. Visible service workers use one
  owned waiting console wrapper, with the banner sent directly to `CONOUT$`
  before spawning their one child; stderr fallback preserves headless callers
  and stdout protocols. Hidden worker flags/logs, scheduling and cancellation
  remain unchanged; in-process tasks are identified as such.
  Credentials/URL userinfo/tokens and complete Cookie/Authorization headers are
  redacted from new diagnostics/process receipts; execution argv is untouched.
  Independent review caught and corrected Cookie-tail leakage and inherited
  stderr bypassing a new visible console.
  No first-party BAT/CMD generator exists beyond these files; external
  `plugins/codex_cli` generates `launch_codex.bat` in its own Git checkout.
  External EMULLM/Coplex and sibling mailbox launchers are likewise not edited;
  their available metadata is printed at the owned boundary.
  Safe validation uses native inert executable stubs in copied launchers,
  mocked spawns and a bounded inert child: no actual services/installations,
  external secret scripts, process kills or runtime-data mutations for acceptance.
  Final launcher/service/pool/protocol/documentation validation: 104 passed.
  Actual CMD stub cases cover all 14 entrypoints, path spaces, ampersands,
  parentheses/exclamations, forwarded arguments, failure exit codes and quiet
  secret setup. Visible-console device output is checked before the mocked
  child spawn; an inert real child preserves protocol stdout and exit code 37.
  Parallel visibility/Frames/Temporal and contextual-inspector work belongs to
  the frontend child and later backend increments, not this launcher commit.

- Visual Sequence COMBO OPTION LIST cache (2026-09-10, explicit bounded scope):
  implemented a dedicated shared
  `data/omega_vision/.cache/visual-sequence-list/choices.json`, plus tiny dirty
  marker and OS-owned rebuild lock. It stores only existing option IDs,
  labels/groups, exact counts, ordering/selection metadata and legacy read-only
  flags. No images, manifests, preprocessing variants or generated outputs are
  cached here. Clean/restarted hits read JSON and the dirty marker directly:
  no frame-folder enumeration, recursive signature or watcher startup.
  Managed captures/imports, source images, recording/reduction metadata and
  create/delete/rename operations invalidate before/after mutation. Previews,
  runtime receipts, detached captures and read-only calls stay clean.
  Explicit Refresh and five-minute expiry cover external edits. Rebuilds are
  serialized/atomic, concurrent refreshes coalesce, and a dirty token arriving
  during or after publication is never cleared by the publisher.
  Client options/ETags are shared across workspaces; caller authorization remains
  per request. Malformed paths/counts are rejected and late ordinary responses
  cannot overwrite refreshed choices. Selected resources still use the existing
  current resolver and execution/large-list confirmation checks.
  Validation: 144 final focused API/cache/writer/boundary/documentation tests,
  17 frontend cache/history/800-versus-801 tests, and production build pass. A broader API
  pass had 406 passes and three fixture failures; the missing mock option count
  and two old out-of-root fixture paths were corrected, then their tests passed
  in the focused follow-up. No production path guard was weakened.
  Actual main measurements at 587 options: isolated rebuild 10.1275s, clean
  disk hit 0.0394s, second workspace with enumeration forbidden 0.0463s.
  Restarted main API HTTP: explicit rebuild 10.5464s; warm 200 0.0921s;
  second workspace 0.0576s; conditional 304 0.0565s, identical ETag/counts.
  Final real restart reused the published list from disk (595 then-current
  options, unchanged ETag): first request including startup/context work 4.4509s,
  next warm request 0.1022s. Current owned API PID is 75664, handle
  `option-list-final-api`; existing Vite PID 74704 remains on 5173.
  Cache-directory/file/lock redirects are rejected even when they point at other
  data inside the shared root; no cache writer can overwrite semantic records.
  Real browser combo shows the actual choices without new catalog/frame/job
  requests on open/reopen. Under the running app's load, initial cached browser
  request took 2.689s, explicit browser refresh 20.581s, and a measured repaint
  on reopening took 2.172s with zero option-network requests; this change does
  not claim to fix broader app rendering/queue latency.
  The actual 26,228-image choice still prompts before loading; cancelling kept
  the LS20 URL and issued no frame/job requests. Refresh remains beside the
  selector; exactly one rich Preprocessing section is 10px below it. Screenshot
  captured inline. Existing user page 1 is untouched.
  This reopens ONLY the formerly skipped option-list work. Broader Visual
  Sequence/image/manifest/output caching remains outside scope. No migration,
  data cleanup, dependency installation, new branch/worktree or remote push.

- Integrated shared-root and inspector acceptance (2026-09-10): the canonical
  storage gate PASSED after correction and independent targeted re-review of
  descendant transform output containment, canonical recognition executable IDs,
  and alias-stable memory scopes/preferences. This supersedes the intermediate
  blocked/readiness checkpoints below. The active frontend now preserves the
  rich recognition matrix at `curated/recognition_reduce` and derives fallback
  source paths from the selected catalog entry, not a legacy hard-coded root.
  Final frontend bundle: 50 focused tests and production build pass.
  Backend review regressions: 91 pass; alias/imported-memory checks: 15 pass;
  cache checks: 7 pass; review/document-link follow-up: 21 pass.
  Remaining Python suite: 1,285 passed; the new Markdown backlink failure was
  corrected and rerun. The only outstanding suite failure is the pre-existing
  installed Codex plugin's two UI pages versus the test's one-page expectation;
  no unrelated plugin code or assertion was changed.
  Restarted only the owned main API; current listener PID is 98228, handle
  `shared-root-main-api`. Vite 5173 remains the existing main checkout process.
  Actual HTTP acceptance across `arc3_random_player` and `default`: identical
  nine areas, 534 Shape versions in each of two areas and 382/386 Object versions
  in two areas, all identical across workspaces. Preferences remained unchanged.
  Cold setup was 30.488s, warm second-workspace setup 0.123s; record reads
  0.3-1.0s. Historical workspace stores and sibling recognition data are explicitly
  unavailable/migration-required, not silently empty or auto-migrated.
  Isolated browser page 3 exercised real area selection, shape geometry,
  Zoom/Fit and both scroll axes, read-only CodeMirror JSON/MeTTa, filter empty/
  restore, automatic Object kind and separate legacy constituents. Nowhere is
  empty for both kinds; explicit reset and reload clear area/detail selection.
  Instrumented browsing/reset issued only memory setup/read calls, no preference,
  copy, extraction or model writes. Desktop and 900px screenshots are attached
  to this conversation; browser tooling denied filesystem screenshot paths.
  User page 1 and its LS20 Frames URL were preserved. The real LS20 recording
  remains a writable canonical `recordings/ls20/20260718-154544_attempt8` entry;
  its old `arc_recordings` entry is explicitly read-only.
  Exact attributed multi-group reference resolution is implemented/model-covered
  but not live-demonstrated: currently available root stores contain legacy
  unattributed objects; the old native 16-shape/one-object store is outside the
  root and remains untouched/unavailable. No fabricated or migrated data was used.
  No PR, push, new branch/worktree, or protected runtime-file staging.

- Canonical Omega boundary (2026-09-10, validated backend checkpoint): backend
  storage routing now separates the actual workspace configuration root from
  the single Omega data home. New sequence writes require recordings/curated;
  legacy readers report read-only/migration-required state. Automatic frame,
  ARC layout and LLM-step migrations are disabled. See
  `docs/design/OMEGA_STORAGE_BOUNDARY.md`. Shared provider/storage identities
  now preserve the same memory, preferences, catalog caches, sequence identities
  and execution visibility across editor workspaces; creating workspace remains
  provenance. Browser memory is page-bound, not workspace-bound. Canonical
  workspace asset reads never fall back to shadowing legacy workspace data.
  Validation: 390 passed, 1 skipped (Windows symlink privileges), 9 existing
  deprecation warnings across Omega API, memory/cache, and relevant workbench
  asset/resource regressions. Log: `.codex/omega-boundary-final.log`.
  An additional 100 concurrent cache-publication rounds passed after fixing
  Windows extended-path-prefix normalization without weakening containment.
  No live
  data migration, Git commit, branch operation or server lifecycle action was
  performed for this change. Parallel frontend/runtime edits remain untouched.

- Omega Vision storage decision (2026-09-10): the user selected **"A only"**
  (one shared store) and clarified **"workspaces will not divide data"**.
  The authoritative seven-requirement contract is now in
  [AGENTS.md: Mandatory Omega Vision shared-storage contract](AGENTS.md#mandatory-omega-vision-shared-storage-contract-2026-09-10),
  superseding older conflicting Omega overlay/per-workspace instructions.
  It must be relayed verbatim to active descendants and future handoffs.
  All Omega Vision physical data belongs below `data/omega_vision`, including
  memory, preferences, semantic events/rules/executions, caches, locks and logs.
  Workspace switches must expose the same catalog and stable data identities;
  workspace provenance/configuration is metadata, not a physical or logical
  data partition. No `workspaces/<workspaceId>` namespace is authorized.
  Visual Sequences have exactly two canonical families: `recordings` (including
  video and non-game captures) and `curated` (image collections). `importables`
  is staging, not a sequence family. No new top-level `video`, `arc_recordings`
  or `recognition_*` sequence family. Game/level/run identity remains meaningful.
  Existing files stay untouched: no automatic migration, consolidation, rename
  or deletion. Legacy destinations must be reported unavailable/migration-needed,
  never silently replaced with defaults; preserve explicit legacy read-only
  references. This does not change unrelated workbench resource inheritance.
  Containment and configured-cache authorization remain mandatory; stale
  workspace/root-grant cache identities must not survive the change.
  Implementation and two-workspace/new-write regressions are in progress.
  User stop-gate: downstream feature edits, integration and data-producing
  acceptance are paused until the canonical-path audit passes. Backend
  corrections have one owner. A concrete remaining frontend blocker is the
  inspector's workspace-dependent record/area identity and reference matching
  (`ShapeObjectInspector.model.ts`, `ShapeObjectInspectorBrowser.tsx`, and their
  model tests). Workspace must remain provenance only; provider/location/kind/
  record/revision matching remains exact. The parent authorized the inspector
  owner to correct only those owned adapters/tests in parallel with the disjoint
  backend corrections as part of this gate. Both owners received that exact
  callback contract; no broader guard removal or historical record migration.
  Do not mark the overall gate passed while workspace ownership predicates
  remain or cross-workspace identity/reference regressions are unverified.
  Frontend identity correction now passes 39 focused tests and TypeScript:
  inspector area/record/exact-reference identities ignore workspace provenance
  while retaining strict provider/location/kind/record/revision matching.
  Memory Setup tree IDs and its existing source-reference guard follow the same
  rule. Nowhere transport owns one snapshot/error/mutation queue per browser
  page, shared across workspace requests; distinct pages remain isolated,
  reset rejects retired replies, and read-only responses cannot replace state.
  Caller workspace is retained only as request/configuration metadata.
  The physical-path and backend root/provider/session validation gate remains
  OPEN WORK; no downstream acceptance or integration has resumed.
  Snapshot v2 now binds the server-derived root/provider and browser-page token,
  not workspace; unbound v1 snapshots require an explicit reset/reload.
  Backend authority/round-trip checks: 33 pass; broader follow-up: 96 pass,
  one Windows privilege skip. The exact physical writer table and backend
  allowlist are in [OMEGA_STORAGE_BOUNDARY.md](docs/design/OMEGA_STORAGE_BOUNDARY.md).
  Independent gate review identified three remaining corrections: descendant
  transform output junctions must be checked before claim/runner writes;
  canonical curated recognition IDs must match execution targets; equivalent
  logical `data/omega_vision/...` aliases must not split memory scopes/preferences.
  These are assigned to the sole backend owner; restart/live acceptance waits
  for their focused regression evidence, not another user approval.
- Inspector host integration: workspace-only authorized catalog/read requests
  now run without a selected or validated Visual Sequence. Sequence-specific
  preferences and copies stay gated; independent refresh and browser-RAM reset
  remain available. The additive inspector retains the existing rich source,
  records/history and copy surfaces. Focused frontend tests/build pass; actual
  browser acceptance is underway. The six inspector files remain child-owned.

- Memory-location metadata JSON cache (2026-09-10, post-reboot): implemented on
  current main without replaying backups. `.cache/memory-catalog/*.json` contains
  only authorized location metadata/counts/revisions/errors; Nowhere locations
  and session counts are added only to each live response. No records, shapes,
  object payloads, checkpoints or browser snapshots enter this cache.
  Clean catalog/default-preference reads reuse disk metadata without a tree
  signature walk. Dirty tokens surround managed memory saves/copies, persistent
  object/grouping checkpoint publication, and grouping promotion. Scope/mount/
  capability metadata is part of cache identity; selected paths and capabilities
  are reconstructed and checked at actual access. Explicit Memory Setup Refresh
  and five-minute expiry handle external edits/deletes. Atomic publication retains
  concurrent dirty signals and retries a rebuild invalidated while running.
  Corrupt entries log a rebuild diagnostic; access failures surface as errors,
  not a stale success. Defaults remain current-provider/current-scope selections.
  Focused core/cache/first-plan validation: 52 pass, one permission skip; full
  API partition: 306 pass; frontend memory/transport tests: 21 pass and build
  passes. Completed full main suite: 1,643 passed, one permission skip, and one
  unrelated local-plugin failure: `test_every_plugin_publishes_an_admin_link_the_scanner_reads_from_disk`
  expects one Codex plugin UI page while the installed plugin exposes two.
  No unrelated plugin implementation or assertion was changed.
  Real main data: isolated cold rebuild 21.992s, warm new-instance read 0.050s,
  preference reads 0.002-0.008s, plan preparation 1.100s. Actual HTTP setup
  rebuild 200/40.465s, direct warm 200/0.452s, Vite warm 200/0.511s; safe
  First-N-2 run preparation 200/1.531s, seven real locations, no catalog errors,
  unchanged preferences, zero model calls. Actual main LOG repeat completed
  16/16 (14 dependency reuses, two writes), with protected TODO/control hashes
  unchanged. Broader Visual Sequence caching remains skipped.
  A separately coordinated Shape/Object inspector child owns only its new
  component/model/test/style files; they are excluded from this cache commit.

### Reboot checkpoint — paused at user request (2026-09-10)

- Main implementation HEAD before this ledger checkpoint:
  `e4b4b160405e8f1354c4cdb5001a559ed275ba7c`.
  Source/test implementation is committed and clean. Core semantic foundation:
  `a8738230a`; active semantic/browser-memory integration: `7a7cc86fe`;
  scoped memory-default/discovery fix: `e4b4b1604`. All remain local/unpushed.
  UI-only commits `db1ee1cb5`, `6bb531de4`, and `3693ea106` preserve removal of
  Completion/Export, Refresh beside the sequence combo, Preprocessing directly
  below it, and safe Objects source context.
- The last main live run completed successfully: actual canonical LS20
  `data/recordings/ls20/20260718-154544_attempt8`, First N 2, event_log_0/canonical,
  job `7544aadec61f470397eaabbe18fb56b8`, 16/16 steps (10 writes, 6 reuses),
  zero model calls. The inspected TODO/control hashes stayed unchanged.
  Receipt: session files `verify_main_semantic.json`.
- Last validation: full candidate suite 1,612 passed / 11 expected skips;
  45 frontend tests/build and 14 authored SWI tests passed. Main integration
  passed 47 focused tests/build; final memory-default fix passed 42 tests with
  one symlink-privilege skip. Candidate live checks exercised browser-only
  Nowhere receipts/reset, repeated log execution without history loss, durable
  grouping, and distinct unpromoted deployment creation.
- **Next authorized task, NOT implemented:** a simple persistent JSON cache for
  MEMORY LOCATION CATALOG METADATA, reused when clean. Mark dirty on relevant
  memory writes/deletes/promotions and root/scope configuration changes; allow
  explicit refresh/periodic expiry for external edits. Publish atomically and
  retain invalidations arriving during rebuild. Do not do a full signature/tree
  walk to test a clean cache. Never cache full learned payloads or Nowhere data.
  Selected-resource permission/containment checks remain mandatory. This is
  memory-discovery caching only; broader Visual Sequence caching stays skipped.
- The user also authorized Sprite View attention, without specifying a redesign.
  Continue its existing Shape/Object Memory controls/navigation after the cache
  task; do not invent unrelated UI changes.
- Reboot snapshot directory:
  `C:\Users\dougl\.copilot\session-state\624aa1a5-4c13-425c-9e1d-a651f9915222\files\reboot-checkpoint-20260910`.
  It includes scoped binary diffs, source manifests/copies for relevant untracked
  candidate files, status/HEAD receipts, and a portable local-commit bundle.
  Earlier recovery snapshots remain intact. The existing parent candidate
  worktree is `C:\snet\PeTTa\repos\coplilot_storage\copilot-worktrees\symbolic_ml_workbench\teamspoon-reimagined-journey`;
  its uncommitted semantic source is also preserved, not discarded.
- Dirty main files are live `pooler.lock`, `pooler_control.json`,
  `pooler_status.json`, `video_import/page_state.json`, the existing temporary
  page-state file, and generated workspace knowledge artifacts. Do not reset,
  delete, stash, stage, or normalize them.
- After login: read AGENTS.md then this checkpoint; verify main HEAD/status and
  consult the snapshot. Rediscover listeners and command lines on 8000/5173
  (main) and 8001/5175 (candidate); **do not reuse old PIDs**. If main servers
  are absent, start `.venv\Scripts\python.exe python\workbench_api_server\scripts\run_api_server.py --host 127.0.0.1 --port 8000`;
  start Vite with WORKBENCH_WEB_HOST=127.0.0.1, WORKBENCH_WEB_PORT=5173,
  WORKBENCH_API_TARGET=http://127.0.0.1:8000 and
  `npm.cmd --prefix frontend\apps\workbench run dev`, detached.
  Preserve the current user URL/state. No further tests, agents, server starts,
  restarts, or process killing were requested before logout.

- Recovered semantic integration (2026-09-10): recovered the CURRENT parent
  worktree at c2dbc8b00, not its older recovery archive; retained hash-verified
  snapshots including every untracked source/test file before changes. The
  inference/evidence/memory foundations are committed on main as a8738230a.
  Active adapters and UI now wire temporal correspondence, authored multi-group
  attached/co-moving objects, event deduction/logging, deterministic and optional
  confirmed LLM induction/deduction, typed candidate evaluation/promotion, grouping
  learning/deployment, and Shape/Object Memory Setup without replacing rich views.
  Broader Visual Sequence caching remains explicitly excluded.
  Nowhere is browser RAM only: request-local snapshot processing, no server
  leases/global payload cache, and no full learned objects/checkpoints in new
  Nowhere run artifacts. Those artifacts hold hashes/receipts. Reset drops the
  browser state. Limits are shown before execution: 128 frames, 16 MiB snapshots,
  1,024 retained outputs; overflow and offline Nowhere requests fail explicitly,
  never truncate or fall back to disk.
  Guarded proposals remain intact. A distinct deployment AST requires its own
  attributed creation, independent evaluation and explicit promotion; runtime
  revisions fingerprint effective semantics rather than proposal receipt churn.
  Real CV producers attest only justified attachment coverage, and consumers
  require the complete original object seal. Implementation-bound cache revisions
  refresh stale producer/temporal prefixes instead of resealing cached objects.
  Internal per-frame log runs verify unchanged prefixes and retain the existing
  canonical tail; changed inputs and public replay truncation still require
  explicit expected-generation supersession.
  Complete candidate Python suite: 1,612 passed, 11 expected optional/permission
  skips in two disjoint full-suite partitions (304 API + 1,308 remaining).
  Frontend build and 45 Node tests passed; authored event/object SWI modules
  passed seven tests each. Subsequent frontend-only checkpoint-picker additions
  passed their focused Node suite/build.
  Mounted candidate acceptance used the real 92-frame imported LS20 source:
  repaired producer/event execution 14/14; Nowhere log execution and repeat
  16/16, retaining generation 3 and all 41 canonical entries; 16 session shapes
  and one object were readable only in browser memory and reset cleared them.
  Both object output files contained only checkpointHash/resultHash/schemaVersion/
  storage. A dense grouping snapshot hit the advertised size limit explicitly;
  with the original durable destinations restored, grouping completed 12/12.
  The active UI created a DISTINCT proposed deployment from completed checkpoint
  frame_000001 with zero inherited evidence/evaluations; its original proposal
  retained its guard and neither was promoted. No model calls were made.
  The two inspected TODO files and pooler-control hash stayed unchanged.
  Temporary memory preferences and First N were restored. Main restart/acceptance
  follows the adapter commit; no PRs, pushes, new branches or worktrees.

- Video Import UI placement update (2026-09-09): removed the entire rendered
  Completion / Export section and its dangling legacy focus target; old Finish
  routes return to Sources without recreating it. Refresh Visual Sequences is
  retained beside the shared sequence combo (not as a standalone top button).
  The existing rich Preprocessing surface is rendered once immediately beneath
  that selector in Recognition, Objects, and Frames. Initial catalog loading,
  internal revalidation, error retry, saved-chain state and backend APIs are
  unchanged. The exact scoped delta was also applied to the recovered semantic
  candidate, preserving its unfinished additions so later integration cannot
  restore the removed section. Local UI contracts: 26 pass; Node
  navigation/history/catalog tests: 19 pass; frontend build passes.
  Live Recognition placement was observed on the retained LS20 sequence after
  the catalog resolved: exactly one Refresh button beside the combo; exactly one
  computed-visible Preprocessing surface 10px below the selector; Completion /
  Export absent. The existing disclosure expanded and, after its existing load
  retry handled a transient 404, restored pp-original-1/2 unchanged as Saved.
  Clicking the relocated Refresh issued the actual
  /visual-sequences?workspaceId=arc3_random_player&refresh=true request.
  Subsequent refresh/reload and other-subview acceptance remain delayed by the
  existing catalog scan; do not claim every cold reload is fast or that this
  increment fixed catalog latency. MainThread is in normal asyncio polling.
  No caching redesign, preference mutation, or unvalidated selector fallback
  was introduced; the original Recognition URL was restored.
  Follow-up context guard: committing a real Visual Sequence also exits the
  legacy Objects live-display mode. If the user explicitly selects live objects,
  sequence-scoped preprocessing, direct calls and TODO stamping cannot operate
  against a different previously selected recording. The semantic candidate
  applies the same guard to its semantic panel. Main and candidate UI contracts
  (26 each) and builds pass.

- Main-runtime blocker identified after integration (2026-09-09): the exact
  preprocessing feature is on local main as `8ac0b2b12`, but main HTTP acceptance
  remained blocked. Two samples of the actual API process showed its event loop
  synchronously resolving the full workspace inside `pipeline_ws.push_loop`'s
  page-state mtime poll. The neighboring operations were already offloaded.
  The follow-up moves the complete path/stat operation off-loop and retains
  the canonical page-state path for both stat and state reads until the
  subscription changes workspace,
  rather than re-resolving the graph every 600ms for every connected tab.
  It does not change source identity, extend HTTP timeouts, close user tabs, or
  silently serve an unvalidated catalog. The exact fix `4dd3aaf02` was integrated
  on local main as `a7cf57390`; only the owned API on port 8000 was restarted,
  leaving Vite on 5173 and the parent's 8001/5175 servers untouched.
  Actual main HTTP acceptance then succeeded: direct catalog cold 200 in
  41.991s, direct warm 200 in 7.041s, proxied catalog 200 in 6.669s; direct chain
  200 in 0.262s and proxied chain 200 in 0.114s. Initial startup health exceeded
  10s; settled health was 200 in 0.004s. Cold catalog latency remains slow and is
  distinct from the resolved event-loop blockage.
  The retained Recognition URL (arc3_random_player, ls20,
  20260718-154544_attempt8, nav=extractions) was reloaded without changing its
  selection. The real catalog resolved 92 frames. Computed visibility and a
  viewport screenshot confirmed exactly one Preprocessing section: 44.38px
  collapsed, 261.21px expanded. The disclosure worked and displayed Saved with
  pp-original-1/pp-original-2 both selecting Original Pixels; the chain API
  returned errors=[], effectivelyOriginal=true, revision=original:.
  No chain preference changes, LLM calls, or extraction runs were made.

- Direct-call/control increment (2026-09-09): two independent registered
  process/doer + Call slots now start direct, interruptible backend executions
  with durable run records, First N scope, dependency DAG validation, current
  dependency reuse, canonical claims, and plan-bound large/LLM confirmation.
  No TODO stamping, result adoption, or pooler retargeting occurs. Direct outputs
  appear through read-only metadata discovery, including current errors and
  staleness. The old Parts Extractor and Reduce All controls are removed; First N
  remains, and Add/Merge/Fresh controls share the pooler row. Parent live
  acceptance ran real OpenCV and Turtle calls on one of the actual 92 LS20
  inputs; both completed, while hashes of todos.json and pooler_control.json
  stayed unchanged. Focused direct/pipeline tests and the frontend build pass.
  Main integration applied only `7a4c479c8` as `4f7312c6e`, preserving both
  factual recovery histories when this ledger alone conflicted. Source files
  applied cleanly; temporal/event/memory implementation remains separate.
  Local direct-plan/API/UI regressions passed 37 tests and the frontend build
  passed. Only owned main API/Vite processes were restarted.
  On the retained 92-frame LS20 Recognition selection, computed visibility and
  a viewport screenshot confirmed exactly two enabled Call slots, each with
  eight real registered pairs, First N retained, the old extractor/Reduce All
  controls absent, and one shared Add/Fresh/pooler row.
  A real proxy API call to parts_extraction_0/python_opencv with firstN=1
  completed 1/1 steps (job 3ed11d13d2a34fd3bd7c0a02872a60d4); the first unit's
  todos.json remained absent and pooler_control.json's hash was unchanged.
  The durable run status returned HTTP 200 in 0.026s. Registry direct/proxy
  returned 200 (4.208s startup / 0.209s warm); chain returned 200 in 0.856s.
  Catalog latency remains a separate limitation: bounded 20s catalog probes
  timed out, although the retained page eventually resolved and displayed the
  real controls. An actual process stack showed catalog workers waiting on
  the cache lock/source signature scan while MainThread was in asyncio polling.
  No caching/feature code was changed for that limitation. No model calls,
  TODO stamping, pooler retargeting, or test-only UI preference changes were
  performed; the retained UI First N value was 1 and was not changed here.
  All commits remain local/unpushed; runtime files and recovery artifacts were
  preserved, and no follow-on implementation was started.

- Remaining-task authorization (2026-09-09): the user explicitly said to skip
  task 1 (broader Visual Sequence caching) and do every other remaining task,
  confirming that previously deferred temporal correspondence, persistent
  attached/co-moving objects, and adaptive grouping are resumed too. This
  supersedes their older paused/deferred markers below. Caching stays deferred,
  not completed; its performance-only dependency must not block the other work.
  Implementation proceeds here in coherent increments: direct process/doer
  calls and control cleanup, event/rule persistence and LLM stages, resumed
  temporal/object/grouping evidence, promotion, memory browsing, and integrated
  regression coverage. Independent core work may run in this same workspace;
  the existing main session remains integration-only. Preserve all runtime
  data and prior commits. No new PRs, pushes, branches, or worktrees.

- Preprocessing is live on local main (2026-09-09): exact feature commit
  `8ac0b2b120af7ea5dc1a838213319097ce449d07` and event-loop fix
  `a7cf57390c389251360d75e23875614283c0635d` are integrated and unpushed.
  Main's ledger-only acceptance receipt is `d052d42a7e40a1503b743d8f14476288e60ebdd8`.
  This supersedes the earlier pending-integration checkpoints below.
  Two actual-process samples identified synchronous workspace resolution in
  the WebSocket heartbeat; path/stat work is now off-loop and the canonical
  path is reused for state reads until the subscription changes workspace.
  Following the API-only restart, the retained main Recognition URL resolved
  the real LS20 level-7 sequence with 92 frames. Exactly one visible Preprocessing
  section expanded successfully from 44.38px to 261.21px, showed Saved, retained
  pp-original-1/2 as Original Pixels, and exposed the row controls and Preview.
  Direct/proxied chain HTTP returned 200 in 262ms/114ms. Catalog HTTP also
  returned 200, but remains slow: 41.99s cold, 7.04s warm, 6.67s through Vite.
  That remaining latency belongs to the broader Visual Sequence caching task,
  not an unresolved preprocessing integration blocker.
  Parent final suite: 1222 passed, 10 optional-plugin skips. Main ran 39 focused
  tests after the fix; its previous feature integration also passed the build
  and client tests. No PR, push, runtime cleanup, chain preference mutation,
  LLM/extraction run, or parent-baseline import was part of main integration.

- Preprocessing chain completion (2026-09-09, parent takeover): the child stopped
  writing at `9de4e1b29` and preserved its ten local commits, recovery bundle, and
  paused cache patch. The parent imported only the source baseline as `706bec23d`;
  runtime files were not reset or included. The follow-up now provides strict,
  atomic per-sequence saves (including an empty chain), stable unbounded rows,
  context-safe autosave and history restoration, a horizontal collapsible banner,
  and a paged sequence-specific frame picker. Preview and extraction share
  content-addressed intermediate/final pixels with alpha, implementation
  fingerprints, and inverse coordinate lineage. Browser/headless LLM inputs,
  paired reduction, outline verification, cutouts, and the offline pooler use
  the same effective input. Changed inputs/dependencies and legacy results are
  explicitly stale; editing the chain does not start an extraction run.
  Catalog watching no longer advances a potentially non-yielding filesystem
  generator on an HTTP worker, and generated variants never become new inputs.
  Live parent-workspace acceptance on the real 92-frame imported LS20 sequence
  covered 640x640 -> 1920x1920 preview, 3x + DeNoise, add/remove/reorder/parameters,
  a 45px collapsed banner, per-sequence isolation, Back/Forward, and saved-ID
  restoration after reload. API/UI ports here are 8001/5175, not the main app.
  The parent reports the final feature suite passed 1221 tests with 10
  optional-plugin skips, and the final WebSocket-fix suite passed 1222 with
  the same 10 skips. The feature-only commit `67b41b56d` was integrated on
  local main as `8ac0b2b12`; the baseline-import commit was never picked.
  Local integration validation passed 71 focused Python tests, 14 Node
  URL/history/catalog/load-guard tests, and the frontend build; the subsequent
  WebSocket-fix integration passed 39 focused Python regressions.
  Main restart/live acceptance is recorded above. Every prior local commit,
  runtime file, and recovery artifact was preserved. All new commits remain
  local and unpushed; no PRs or follow-on backlog work were performed.

- Python CI repair (2026-09-08): the workflow installs SWI-Prolog and the
  documented `.[test]` extra covers every package imported during collection.
  Suite startup pins ARC resource selectors to the current checkout before
  `arc_agi` can load package-local development paths. Optional mailbox and web
  collaboration tests skip when their independent plugin checkouts are absent.
  The ARC CLI model catalog again contains the OpenRouter models/profiles used
  by workflow extensions, and provider HTTP failures retain their upstream
  status and diagnostic body. Stale active-UI contracts were reconciled;
  missing JSON datatype, router dependency backlinks, and visual-diff fixtures
  were restored; every runnable script uses the shared runtime resolver; and
  all 115 direct workbench-server filesystem calls now pass through the shared
  provider without translating operational JSON into MeTTa. Local validation
  is clean: 1056 Python tests pass with 10 expected optional-plugin skips, and
  the production frontend build passes. PR #3 GitHub Actions also passes with
  1052 tests and 14 expected platform/optional-plugin skips.

- TODO terminology normalization (2026-09-08): planning, delivery, architecture,
  API documentation, runtime messages, UI labels, tests, and historical path
  maps now use TODO terminology exclusively. Canonical documents are
  `TODO_DELIVERABLES.md`, `TODO_PHASE_ARCHITECTURE.md`,
  `docs/design/TODO_VISION_AND_WORKBENCH.md`, and `_todo.txt`; the matching
  regression module is `tests/omega_vision/test_omega_vision_todo_forms.py`.

- ARC data layout flattened (2026-09-07): recordings, importables, and curated
  moved out of `arc3_games/` to the data-home roots — canonical writes now
  target `data/recordings/<game>/`, `data/importables/`, and `data/curated/`
  (repo store: `data/omega_vision/{recordings,importables,curated}`); the
  `arc3_games/` directory is gone. `_migrate_arc3_games_root` migrates
  legacy `Recordings/`, `arc3_games/recordings`, `arc3_games/importables`,
  and `arc3_games/curated`
  (case-only renames handled on Windows) and rewrites persisted
  `data/arc3_games/...` path strings; readers keep legacy fallbacks.
  Committed repo data was git-mv'd and its JSON references rewritten.
  Recording step subdirs are now free-form: any direct child dir holding an
  input `image.png` is a step (`0/ 1/ 2/` or `foo/ bar/`; numeric first, then
  named alphabetically), and nested processing output such as
  `<step>/detect_edges_0/scikit_python/` is never treated as a step
  (`_recording_step_dirs` in video_import_api, `_raw_base_frames` in
  recognition_demos). Twin modules `omega_vision/services/arc3_play.py` and
  `workbench_api_server/arc3_play_api.py` stay byte-identical except the
  `_REPO_ROOT parents[...]` line. Known pre-existing failures unrelated to
  this change: 3 `test_video_import_ui.py` layout tests, the
  `VisualImageDiffPage.tsx` TS7006 build errors and local full-suite collection
  errors from a leaked `ARC3_RUNTIME_HOME` (both reproduce on the base tree).

- Parts-extractor comparison controls (updated 2026-09-08): the Recognition extraction
  view has one persisted global `parts_extraction_0` selector that applies to
  every input row and now exposes only OpenCV. The slower scikit and pure-Prolog
  shape implementations remain available only for explicit legacy/contract
  use; both are absent from the reduction selector, default templates,
  automatic downstream fallbacks, and newly stamped todos. Add/Merge also
  removes stale `python_scikit`, `scikit_python`, and `shape_finder_prolog`
  todo entries and retargets their downstream dependencies to OpenCV.
  Todo stamping is split into **Add/Merge todos** (preserves current steps and
  results) and **Fresh todos** (replaces the queue and removes only the current
  template's outputs before recomputation). A persisted First-N limit scopes
  either action for quick previews; zero means the complete set. The API rejects
  a fresh reset while any selected output is actively claimed. Exact legacy
  four-step, three-extractor, and two-extractor workspace templates migrate to
  the active OpenCV-only extraction default without changing user-customized
  templates. Focused OpenCV-only Video Import tests (19) and the production
  frontend build passed; all 87 existing runtime todo files were migrated and
  stale Prolog-extractor claims were removed.

- OpenCV grouping evidence and background cutouts (2026-09-08): the sole
  automatic extractor now appends advisory connected-component, contour
  hierarchy, morphology, shape-metric, and watershed facts to every
  `parts_extraction_0/python_opencv/result.pl`. Extraction metadata and the
  Recognition UI expose component, contour, and watershed counts. All 87
  existing OpenCV outputs were regenerated with the extended fact contract.
  Authoritative grouping remains in `group_regions.pl`: in addition to the
  large border-connected exterior, a region is now background when it has the
  exterior's color, fills another region's cutout, and that cutout owner
  touches the exterior. Such regions are excluded from foreground groups,
  object instances, and detachable parts without altering geometric
  `part_of/2` containment. The rule identifies the intended enclosed
  background in 16 active recording steps and the root image; all 69 existing
  grouping outputs were regenerated. Cutout attachment now requires both
  endpoints to remain foreground, so only the yellow filler matching a yellow
  exterior becomes background while differently colored items in the same
  cutout remain grouped foreground objects. Six focused grouping tests, two OpenCV
  fact-contract/SWI-Prolog tests, and the production frontend build pass.

- OpenCV symbolic Clause Explorer (updated 2026-09-08): every completed OpenCV
  extraction can open all of its real generated `.pl` pipeline artifacts below
  the reduction row. Sources load through the existing workspace asset route
  into horizontally scrollable tabs; a failed source keeps its tab and exposes
  a retryable partial-load warning instead of disappearing. The reusable
  predicate/arity explorer provides independently expandable predicates,
  argument partitions for large predicates, a 30-child root cap, paging,
  filtering, file/alphabetical ordering, current-file scoping, matching clauses,
  and exact clause-to-source navigation. The source pane reuses the shared
  CodeMirror-backed `ResourceSourceEditor`, including real Prolog fold ranges,
  read-only filesystem reload/download controls, horizontal source scrolling,
  and exact-line selection after cross-source tab changes. Explorer file
  controls use a dedicated compact 34px, non-wrapping row: generated read-only
  sources expose only applicable Open, Reload, and Download actions, while the
  original stacked rich-editor controls remain unchanged elsewhere. Exact
  Prolog, generated MeTTa, and structured JSON remain synchronized read-only
  views. Video Import now owns recording selection in the `recording` query
  parameter without rebuilding the rest of the URL. Valid URL recordings
  auto-import after catalog validation, page-state-selected recordings
  canonicalize missing parameters, back/forward and reload restore the selected
  source, and invalid IDs remain visible with an explicit error instead of
  silently falling back.
  Live acceptance against `data/recordings/ls20/20260718-154544/2/image` indexed
  672 clauses in 30 predicates from four real files and revealed
  `background(r7).` at `group_regions_prolog/result.pl:29`. The same output
  contains only the yellow exterior-color fillers `r2` and `r7` as background;
  differently colored red and blue cutout members remain foreground. Live URL
  acceptance also restored `data/recordings/ls20/20260718-154544_attempt8`
  across reload and browser history, preserved workspace/view/subview/gen
  parameters through inspector Sync, rejected an unavailable recording in
  place, and opened frame 86's real four-source explorer with its one-row
  Open/Reload/Download toolbar. Validation: 23 focused grouping/Video Import
  tests, 10 executable parser/folding tests, and 3 executable recording-URL
  tests pass, `git diff --check` is clean, and the production frontend build
  passes.
  The repository-wide run reached 1072 passes with one unrelated local-plugin
  failure: the existing plugin scanner test assumes one UI page, while the
  separately checked-out `codex_cli` plugin currently publishes two.

- Visual Sequence URL/shell and OpenCV vN experiment (2026-09-09): the active
  selector now resolves one filesystem catalog for standalone images,
  collections, movie frames, and game recordings. Game-backed URLs use stable
  `game=<game>&recording=<sequence>` segments; non-game sources retain a
  namespaced catalog ID in `recording=`. Safe `nav=` paths restore Recognition
  tabs, rows, and the Prolog inspector without replaying actions. Sequences over
  800 images require an explicit modal confirmation before URL selection,
  manifest loading, rendering, or TODO controls target them. Video Import now
  has six steps: Sources, Frames & Filters, Games, Objects, Sprite View, and
  Recognition. The original Sprite Viewer has one canonical render in step 5;
  former Finish and Advanced controls remain exactly once as collapsed
  Completion / Export and Advanced Controls sections. Legacy routes canonicalize
  to those destinations while preserving workspace and Visual Sequence state.
  Local commits are `d7b33d533`, `8d86259c7`, `df3b2508d`, `6f2149cfd`,
  `b2ec3581a`, `a92b741ba`, `2169b0d2d`, `0a90064a3`, and `79d96590f`;
  nothing was pushed by this session.
  OpenCV extraction now persists deterministic frame-local
  `vision_group(vN, connected_component, Members, Evidence)` hypotheses from
  its existing component, contour-hierarchy, and watershed evidence. The UI
  presents vN and Prolog wN as independent peer rows ordered only for display
  by shared-member overlap; there are no inferred v-w links and no oN claims.
  New `group_regions.pl` outputs use wN consistently in `part_group/2` and
  `group_area/2`. Legacy gN files remain byte-truthful in the source inspector
  while their derived API/UI group IDs normalize to wN. A real LS20 scratch
  transform under `vn-real-ls20/parts_grouping_0/group_regions_prolog/`
  produced six wN groups and six wN areas with no gN aliases; the live legacy
  source retained SHA-256
  `C982BD017CF9285568156B6C66082A378356805F8556A50252DFBD31F8E3CB50`.
  When a vN and wN have
  identical member sets, the UI coalesces them into one
  dual-labeled display node using the wN color; both underlying claims remain
  independent. Legacy extraction results derive the same vN peers read-only from their
  persisted `opencv_component/*` evidence, so no runtime files were rewritten.
  Live verification used
  `data/omega_vision/arc_recordings/data-recordings-ls20-20260718-154544_attempt8/`
  and showed frame 0 with `v1` over 11 regions beside legacy-source groups
  displayed as `w5`, `w1`, `w2`, `w3`, and `w4`, followed by four singleton
  v/w neighborhoods.
  The exact source artifacts are
  `transforms/frame_000000/parts_extraction_0/python_opencv/result.pl` and
  `transforms/frame_000000/parts_grouping_0/group_regions_prolog/result.pl`
  under that Visual Sequence directory.
  A separately generated real-LS20 evidence sample produced four vN facts under
  the session artifact `vn-real-ls20/parts_extraction_0/python_opencv/` with no
  additional `debug_image.png`. Existing `parts_debug_0` and debug-image
  behavior remain unchanged.
  The current-frame `group_acceptance_0/group_acceptance_prolog` stage now
  produces final gN groups. Python/OpenCV writes replayable measurements to
  `acceptance_input.pl`; SWI-Prolog is the sole acceptance authority and emits
  `accepted_group/2`, `group_acceptance/3`, evidence, and rejections. Its fixed
  order is exact V/W consensus, A `symbolic_shape_analogy` using only
  current-frame exact templates, C `pixel_shape_fallback` only after A fails,
  then D `singleton_remainder` for every uncovered foreground region.
  Background regions never receive gN and the Prolog pass verifies exclusive
  complete foreground coverage. Overlapping/background exact-template
  candidates and unmatched wN candidates emit explicit rejection provenance
  rather than disappearing. Named defaults are symbolic geometry tolerance
  0.18, pixel-shape threshold 0.82, unique-best margin 0.03, and color-mass
  tolerance 0.12. The editable built-in pipeline inserts this stage between wN
  grouping and Turtle generation; only exact historical built-in templates
  migrate, while customized templates remain unchanged.
  The compact persisted group-layer selector offers V, W, G, and W+V+G.
  Single-layer views keep exact-equality aliases on their anchor row; all-layer
  view interleaves independent facts and may combine exact V/W/G memberships.
  G is honestly pending when the acceptance stage has no output.
  Final validation passed 65 focused Python/API regressions, 5 executable
  V/W/G tree-model tests, `git diff --check`, and the frontend production build.
  Real LS20 scratch validation under
  `vn-real-ls20/group_acceptance_0/group_acceptance_prolog/` produced eight
  final groups covering all 16 foreground regions: three exact consensus, one
  symbolic analogy, zero pixel fallbacks, and four singleton remainders, with
  one background region excluded and no debug image.
  The new `observation_identity_0/content_hash` transform assigns deterministic
  content-derived frame, region, V, W, and final-G observation IDs after
  acceptance. Local rN/vN/wN/gN aliases remain truthful provenance but are
  excluded from semantic identity, so alias renumbering does not change an
  observation UID. Each unit persists deterministic `observations.json` and
  Prolog observation facts with exact source artifact hashes; replay writes the
  same bytes and creates no debug image. Exact prior built-in pipeline templates
  migrate to the new stage while customized templates remain authoritative.
  Focused validation passed 61 observation/group/API/UI regressions and the
  frontend production build. A real LS20 scratch frame produced one frame,
  17 region, 4 V, 6 W, and 8 final-G observations (36 total) with byte-stable
  replay and no oN facts.
  A real LS20 correction now preserves small coherent high-contrast marks
  before the ordinary area gate discards them. In frame 000000 the raw
  gradient component was already exact but its 200 pixels fell below the
  640x640 ordinary floor of 327; the existing single-neighbor enclosure
  exception did not apply because the mark borders green, yellow, and exterior
  gray. The general recovery rule requires a configurable 16-pixel floor,
  non-border connected pixels, high contrast against every immediate neighbor,
  a substantially larger non-background host with strong shared-edge contact,
  compact/thick geometry, and near-complete contact with retained structure.
  It records exact pixel runs and uses unsimplified contours without changing
  the raw label mask. OpenCV mirrors Prolog's set-valued exterior-background
  rule, so no qualifying border background can act as a host.
  Exterior-background enclosures, isolated speckles, and one-pixel lines remain
  rejected.
  The real `#0074d9` mark is now `region(r10, '#0074d9', 200,
  centroid(400,194))`, appears in v1, becomes `part_group(w1,[r10])`, is
  covered by `accepted_group(g14,[r10])`, and receives stable region
  observation ID `region-observation-586ae2161192723ba132be64`. Scratch
  end-to-end output created no debug image. Focused validation passed 86
  extraction/group/acceptance/observation/API/UI regressions and the frontend
  production build.
  Region highlighting now uses those real persisted extraction geometries.
  The prior tree hover changed only a button class, group rows had no hover
  handler, the input image had no overlay, and the grouping SVG filtered only
  pinned turtle strokes. The manifest now exposes `geometryPath` plus a file
  revision; the active row loads it on demand through a bounded no-store cache
  and retries unavailable entries on interaction. A shared SVG layer renders
  legacy polygon/hole geometry and exact small-feature pixel runs directly over
  the 150x150 actual input, grouping, and turtle previews with matching
  aspect-ratio-preserving viewBoxes and no pointer interception.
  rN hover is temporary, click pins/unpins, and V/W/G hover or click uses the
  canonical union of member rN IDs, so exact-equality aliases share one
  selection. Pinned highlights survive hover leave; stale frame/sequence IDs
  are removed, and missing geometry reports an explicit unavailable state.
  Focused validation passed 57 API/UI regressions, 12 executable highlight/group
  model tests, `git diff --check`, and the frontend production build. Live LS20
  frame 000000 showed r13, r14, and r15 individually across all three previews,
  a four-member w5 union, exact 150px image/overlay alignment, pinned restoration
  after hover leave, and collapsed-row lazy loading.
  `group_acceptance_0` and `observation_identity_0` remain real pipeline/API
  stages and inspector sources but no longer consume separate large horizontal
  cards. Each frame description now shows two compact lines directly beneath
  Refresh. Completed lines use real final-G/mode and stable-observation counts;
  missing legacy, queued/dependency-blocked, running, error, and stale-extractor
  states remain explicit without fabricated zeroes. Result-bearing lines retain
  doer, duration, source, completion, and summary provenance in their tooltip
  and open the real `.pl` result through the existing inspector. The full
  transform list still drives readiness, progress, and source tabs; only the two
  non-visual cards are filtered from the horizontal strip. Focused validation
  passed 59 API/UI regressions, 16 executable status/highlight/group model
  tests, `git diff --check`, and the frontend production build. Live legacy
  LS20 frame 000000 showed both honest `not available` lines under Refresh,
  while the remaining extraction/debug/grouping/turtle cards moved together
  with no acceptance or observation card.
  The built-in `parts_debug_0/python_pil` stage now runs and displays last,
  immediately after `turtle_programs`. In both tracked built-in templates
  (default and arc3_random_player) it has priority 50 and explicitly depends on
  `parts_extraction_0/python_opencv` and `turtle_programs/turtle_programs_prolog`
  so concurrent pooler workers cannot render it before Turtle; a dependency-gated
  worker leaves it pending and a later pass runs it once Turtle's meta.json
  exists. Only exact historical built-in templates migrate (including the exact
  typed legacy default that previously placed debug at priority 20); customized
  pipelines and legacy completed outputs are untouched. The horizontal visual
  strip sorts the single debug card last so Turtle and the debug overlay sit
  adjacent at identical 150px previews sharing the region-highlight overlay, and
  a running/error transform now shows an explicit state instead of a silent gap.
  Validation passed 65 API/pipeline regressions including a two-worker ordering
  test, 16 executable model tests, and the frontend build.
  Final-G temporal correspondence, Prolog frame events, and event-backed rule
  induction remain paused at this clean post-UID boundary for inspection. oN
  tracking, grouping learning, cross-sequence promotion, and expanded Object
  Memory remain deliberately deferred.

- Split visual/text bands (2026-09-09): each Video Import extraction row's
  transform strip is now two independent bands inside
  `.video-import-transform-bands`. The top `.video-import-transform-visualband`
  holds the visual/group content only — the input image, the V/W/G peer-group
  tree, the grouping/turtle SVG overlays (with their visual-coupled controls),
  and any debug/thumbnail images. The bottom `.video-import-transform-textband`
  is a separate horizontal scroll container holding per-transform status chips
  (name · doer · timing, honest stats/notes, started/error/waiting/missing
  states, and the stale re-derive control); each chip opens the real source
  inspector. The bands scroll independently and are never height- or
  scroll-aligned. Legacy in-cell `transform-stats`/`transform-note`/inline
  inspect buttons were removed from the visual cells; the compact
  `G acceptance`/`Observation IDs` lines stay under Refresh unchanged, and the
  debug card remains last. Text-band content derives from a new pure
  `TransformTextBandModel.summarizeTransformCell` covered by
  `TransformTextBandModel.test.mjs` (registered as `npm run
  test:video-import-transform`). Live-verified on ls20 20260718-154544 frame 0
  (independent visual 958px vs text 1055px scroll widths over a 636px viewport,
  inspector opens from a text chip); tsc build clean and `git diff --check`
  clean.

- Cross-frame dependency resolver (2026-09-09): transform `dependsOn` entries may
  now target another frame of the same ordered Visual Sequence using a prefix
  grammar — same-frame `transformation/doer` (unchanged); relative
  `frame[-1]@…`/`frame[+2]@…` (explicit sign = relative, requires ordered);
  exact `frame[42]@…` / `frame[foo]@…` (unsigned/named = exact frame key, works
  ordered or unordered). No `previous_frame@`/`next_frame@` aliases. The pure
  resolver lives in `python/omega_vision/perception/cross_frame_deps.py`
  (grammar, resolution, cycle detection over the resolved cross-frame graph,
  deterministic content-addressed `output_revision`, revision-based staleness,
  and a first-consumer adjacent-pair plan that omits frame 0). Stamp-time
  resolution against the full catalog is persisted per todo as `dependsOnResolved`
  (original selector + resolved frame id) so a catalog/order edit stales the
  stamped resolution instead of silently retargeting; `run_transform_step`
  readiness requires the exact resolved target's `meta.json`, records
  `consumedDeps` revisions, and reruns when a cross-frame target's revision or
  frame changed; `write_unit_todos` re-marks such completed steps stale/pending;
  the reduce endpoint validates grammar and rejects dependency cycles (HTTP 400);
  the pooler passes the persisted resolution through. Same-frame pipelines are
  unaffected (backward compatible). Deterministic temporal/event/oN stages that
  will consume this stay deferred. Validation: 35 resolver unit tests, 3 pipeline
  integration tests (readiness/out-of-range/persist+staleness), the existing
  two-worker ordering test, and the full omega_vision + omega_vision_api suites
  (394 passed).

- Queued Visual Sequence caching (2026-09-09, deferred; after the cross-frame
  resolver, before the LLM pair stages): canonical term is Visual Sequences
  (legacy recordings/image-sets are adapters only). Browser persists the
  provider-backed catalog, per-sequence manifest/frame metadata, current
  selection, and already-accessed thumbnails/assets across reload/restart via a
  bounded IndexedDB/Cache API layer (not large localStorage), stale-while-
  revalidate with honest cached/revalidating/stale markers, conditional requests,
  atomic replace on backend revision/ETag change, bounded LRU/size with explicit
  clear/refresh, and no eager caching of every frame in 4,782/6,091-frame
  sequences. Backend adds a persistent provider/revision cache for
  catalog/manifest enumeration across API restarts (runtime/cache location,
  excluded from git), keyed by workspace/provider identity, canonical
  VisualSequenceId/ref, schema version, and filesystem/catalog revision/content
  signatures, with atomic writes, concurrency-safe dedupe, ETag/Last-Modified
  contracts, and no caching of credentials or success-shaped errors. Legacy
  `/image-sets` and recording APIs share the same canonical cache entries;
  `game=`/`recording=` resolution, the >800 confirmation, nav restoration, and
  preprocessing selections work from cache but never bypass safety or select
  stale/deleted content; offline shows read-only cached data while
  mutations/processing require live validation. Tests per the coordinator spec.

- Queued Sprite View memory scope (2026-09-09, deferred until memory data exists;
  after Visual Sequence caching). Shape Memory and Object Memory are separate
  surfaces; EACH has two independent controls. `Save to` is a single-select
  destination for NEW writes only (This Run default, Level Shared, Game Shared,
  Global Shared, Nowhere); `Nowhere` is explicit ephemeral/session-only and warns
  reload loses it; changing Save to never moves/promotes existing records and
  lists only valid writable destinations (browse-only disabled with an exact
  reason, no silent fallback). Shape and Object `Save to` values are SEPARATELY
  persisted: a save/collection routes newly learned shape records only to Shape
  Save to and object records only to Object Save to, changing one never
  changes/defaults/migrates the other, both active destinations are shown clearly
  with separate capability/error handling, and object-to-shape references stay
  provider/scope-aware rather than assuming co-location (independent-destination
  tests included). `Look in` is a hierarchical MULTI-SELECT CHECKLIST
  (reads only; never affects Save to/writes) over a dynamic, searchable Memory
  Location Catalog covering every populated accessible Shape/Object store across
  providers/workspaces (provider/workspace -> game -> level -> run/Visual Sequence
  -> memory area), showing only locations with records (plus the ephemeral session
  store) with record counts, memory kinds, last revision, scope badge, concise
  labels (full paths in tooltips). `Effective` is a preset that checks the current
  hierarchy's This Run + Level Shared + Game Shared + Global Shared in precedence
  This Run -> Level -> Game -> Global (not an opaque store); provide tri-state
  parent checkboxes, Select effective/all visible, Clear, search, counts, recent
  selections, and a compact collapsed summary. `Look in: Nowhere` is always
  available per surface (the one exception to populated-only filtering; shown even
  at count 0), labeled ephemeral with lifetime/reset status, cleared on
  reload/restart, never restored from cache or auto-promoted, excluded from
  Effective unless explicitly checked, with an explicit Promote/Save Copy to a
  writable scope that preserves provenance. Shape and Object selectors are fully
  independent and may point to different locations. Merge/deduplicate displayed
  records by stable concept identity while retaining every selected source badge,
  conflict, and provenance; more-specific overlays may override presentation but
  never erase inherited records/history; object identities are run-namespaced so
  promoted concepts never claim two run-local oN IDs are the same individual;
  promotion copies/references evidence into a new scoped version preserving the
  source and is separate from changing Save to. Backend enumerates/indexes real
  provider-backed memory locations with stable `memoryLocationId`,
  providerRef/workspace/context IDs, scope kind, supported memory kinds,
  revision/content signature, and read/write capabilities; enforces access control
  and provider boundaries (never expose inaccessible paths, no silent fallback),
  updates the index atomically on write/promote/remove, reuses the
  caching/revalidation patterns, and avoids client-side recursive filesystem
  scans. Persist stable memoryLocationIds (not raw paths) in UI/workspace state;
  URL/nav restoration encodes multiple stable IDs without triggering writes;
  filtering/search must not clear hidden checked locations; virtualize large
  catalogs; handle unavailable/deleted/permission-lost checked locations visibly.
  No mocks. Eventual tests: independent Shape/Object checksets, effective preset
  expansion, defaults, multi-workspace/provider selection, tri-state parents,
  search-hidden selections, Nowhere combination/empty visibility/reload loss and
  no cache persistence, dedup/conflicts, remote Effective ancestry, unavailable
  write/read-only, permission loss, revision refresh, no automatic migration,
  promotion provenance, run-local oN namespace safety, URL restoration, duplicate
  labels/stable IDs, and no path leakage. All memory destination/browse controls
  live in a collapsible `Memory Setup` section whose disclosure state is
  remembered in UI/workspace state (default collapsed on first use); the collapsed
  banner truthfully summarizes both independent configs without exposing full
  controls (e.g. `Shape: Save to This Run · Look in 4 locations`; `Object: Save to
  Game Shared · Look in Effective + Nowhere`) plus dirty/error/unavailable
  indicators and compact record/location counts, action-required errors stay
  visible in the banner, expanding reveals the separate Shape/Object Save-to combos
  and Look-in checklists, collapsing removes detail from layout height while
  preserving selections/search/check state, and disclosure/focus is accessible
  (tests: default/remembered state, summaries, independent values, hidden layout
  height, dirty/errors, and state preservation).

- Deferred oN composition contract (2026-09-09): an oN is not a persistent
  one-to-one alias for a final gN. It is a higher-level object composed of at
  least two final G groups. When this work is explicitly resumed, Prolog may
  infer an oN only when attributable evidence proves both (1) coherent
  cross-frame co-motion with compatible displacement/transform and stable
  relative arrangement, and (2) attachment under the existing symbolic
  attachment semantics: a strong shared edge or a valid smooth cutout relation
  between the groups' member regions. Co-motion alone is insufficient,
  attachment alone is insufficient, and a lone persistent G remains a G rather
  than becoming an O. Reuse the existing attachment rules; do not substitute
  generic bounding-box proximity or containment. Expected future evidence may
  include group motion/correspondence facts, group attachment facts, and
  `object_at(Frame, oN, [G1,G2,...])` with provenance and confidence. This is a
  recorded design constraint only; UID, temporal, oN, and learning
  implementation remains blocked until the user explicitly resumes it.

- Deferred final-G occlusion contract (2026-09-09): infer
  movement-based occlusion at the final G level first and aggregate it to oN
  only after oN composition exists. For a tracked G observation, project its
  prior mask and centroid with the supported motion estimate. A directional
  `occluded_by(Frame, OccludedG, OccluderG, Confidence, Evidence)` candidate or
  fact requires the G to become missing or substantially clipped while another
  visible G occupies its predicted pixels or path with compatible depth/contour
  evidence. Do not treat every disappearance as occlusion: classify a projected
  mask leaving the image as exited, no overlapping visible occluder as
  missing/unexplained, and supported partial area loss as partial occlusion.
  Reappearance near the predicted continuation confirms or strengthens the
  account and preserves correspondence. Keep predictions separate from
  confirmed observations so both remain replayable. When oN exists, aggregate
  member-G evidence to
  `object_occluded_by(Frame, OccludedO, OccluderO, Evidence)`; member groups of
  the same oN represent self-occlusion, not object-object occlusion. Require
  source frame, mask, motion, overlap, and direction provenance, record signed
  contradictions, and create no debug image. Eventual regressions must cover
  full and partial occlusion, exit, unexplained missing, reappearance,
  wrong-direction overlap, self-occlusion, and object aggregation. This remains
  blocked design work until the user explicitly resumes temporal/object
  implementation.

- Temporal events design doc (2026-09-09): `docs/design/TEMPORAL_EVENTS.md` is
  the canonical design reference for cross-frame reasoning. It captures the full
  event taxonomy (visibility/occlusion/motion/geometry/contact/topology/grouping/
  appearance/multi-frame), event-vs-state distinctions, the transition-bundle
  ontology (one `transition_assessment` per adjacent pair; `no_material_change`
  vs `unknown`; first-frame `frame_assessment(initial_observation, no_predecessor)`),
  canonical `start/continue/end` relation-phase syntax with occluder-first order
  and legacy `occlusion_*` mapping, the strict deduction/induction lifecycle and
  the two distinct induction problems (FrameEvidence->Event detector vs
  Event->Event transition), the durable Candidate Rule Store, the canonical
  append-only Visual Sequence Event Log + durable episodes, game user-action
  exogenous events, the LLM canonical-term output contract, the frame 4->5
  avatar/star occlusion acceptance scenario, and honest current/deferred status.
  Documentation only; no predicate is emitted until its status row reads
  implemented.

- Heavy skill-discovery cold-import fix (2026-09-09): opening Video Import (any
  subview) fetches `/filters` in a `[workspaceId]` effect
  (VideoImportPage.tsx:2451), which calls `_discover_skills` (video_import_api.py)
  and loaded every skill module top level. `colormap_gradients.py` imported
  matplotlib and built its colormap list from `matplotlib.colormaps` at module
  load, so ENUMERATION alone triggered a multi-second matplotlib cold import — the
  dev-proxy 502/timeout — even though the colormap effect is INVOKED only on
  explicit selection. Root-cause audit: scikit-image was already function-local in
  `skimage_effects.py` (and the sole `python/` skimage import at
  pixels_to_regions.py:254 is function-local); there are zero matplotlib imports
  under `python/`; and colormap is in no template/TODO/_SEQUENCE_TRANSFORMS. Fix:
  `colormap_gradients.py` now uses a static 91-name colormap list for
  SKILL.paramChoices and imports numpy+matplotlib lazily inside `apply()`;
  `pilgram_filter.py` likewise (static style list + lazy import with a clear
  not-installed error). Added a lightweight `_registered_transform_composites()`
  + `GET /transform-composites` endpoint that enumerates only the in-memory
  `_SEQUENCE_TRANSFORMS` registry (no skill discovery/heavy imports) for the future
  direct-runner combos. Tests
  (`tests/omega_vision_api/test_skill_discovery_cold_import.py`) block
  skimage+matplotlib imports and prove discovery, `/filters`-shaped enumeration,
  the catalog, and composite enumeration all work with the colormap/pilgram/skimage
  skills non-broken and under a cold-load time budget; colormap `apply()` still
  works (91 cmaps) and pilgram reports a clear error. Full omega_vision +
  omega_vision_api suites: 403 passed. Follow-up: once discovery was fast enough to
  reach it, `list_filters` line 5268 revealed a pre-existing 500 —
  `_skills_dir(root).relative_to(root)` raised ValueError for workspaces
  (arc3_random_player) whose skills dir resolves to the shared/inherited data home
  outside the workspace root; fixed to the overlay-safe `_data_rel_of(root, ...)`
  used by the neighboring lines, with a regression test. `/filters` now returns
  200 (~1.7s, 248 filters) with no heavy imports.

- Darken Slight Gradients filter (2026-09-09): new first-class Video Import
  Filters skill `data/omega_vision/video_import/filter_skills/darken_light_gradients.py`
  (id `skill:darken_light_gradients`), NumPy+Pillow only (no scikit-image/matplotlib),
  so it is visible/selectable in Frames & Filters and automatically available to the
  future Preprocessing stack through the same registry + `/filter` materialization
  and provenance. One deterministic, non-cascading pass reads an immutable snapshot:
  each non-transparent pixel adopts the exact RGBA of its darkest 8-neighbour that is
  strictly darker but only slightly (`maxLightnessDelta`, default 16 on 0..255) and
  colour-similar (`maxChromaDelta`, default 32 max per-channel RGB delta) so real
  colour edges never bleed; edges use in-bounds neighbours only; alpha preserved;
  repeat as another stack step for more passes. Fixed an int16 overflow in the luma
  helper (255*587 > int16) that corrupted output. Tests
  (`tests/omega_vision_api/test_darken_light_gradients_filter.py`, 10): flat-unchanged,
  all eight directions, threshold boundary inclusive/exclusive, darkest-qualifying,
  colour-edge rejection, alpha/transparent, no intra-pass cascade, tiny/edge,
  determinism, and registry discovery + resolver materialization.

- Preprocessing filter registry foundation (2026-09-09): first increment of the
  deferred Preprocessing Setup. Added `scale_3x_nearest` as a canonical built-in
  filter (`_BUILTIN_FILTERS` + `_apply_prepass_filter` + `_resolve_transform`):
  deterministic 3x nearest-neighbor upscale where every source pixel becomes an
  exact 3x3 block, reusing the existing `/filter` + `_resolve_chain` materialization
  and provenance. DeNoise already exists via the `skimage_effects` skill
  (`denoise_tv_light/strong/paint`) and is reused, not duplicated. Tested
  (`tests/omega_vision_api/test_preprocessing_filters.py`): registry membership +
  deterministic flag, 3x per-pixel block exactness with original preserved,
  transform determinism, and DeNoise presence. Remaining Preprocessing Setup work
  stays deferred and is a large multi-commit follow-up: the backend
  `image_preprocessing_0` chain lineage producing a single content-addressed
  variant consumed by both OpenCV extraction and every LLM image consumer;
  per-Visual-Sequence chain persistence; and the frontend `PREPROCESSING · ALL
  INPUTS` collapsible banner + ordered step-stack editor (two Original Pixels
  no-op rows, Add Before/After/Remove/reorder, unlimited/duplicates, stable IDs)
  + lazy Preview frame selector (Original vs Final, no full-run side effects). See
  the deferred step-stack entry below and TEMPORAL_EVENTS.md §8.1.

- Queued Recognition control/runtime tasks (2026-09-09, deferred, each its own
  focused commit after Preprocessing Setup, in this order):
  1. Move `Add todos` (current Add/Merge behavior; compact label + tooltip that it
     merges/preserves) and warning-styled `Fresh todos` onto the SAME logical
     horizontal row as the pooler status / Workers / Pause / Stop (TODO actions
     adjacent, before the pooler block); no semantic/confirmation/claim changes;
     row may wrap responsively but stays grouped; tests at normal/narrow widths.
  2. Remove ONLY the visible `PARTS EXTRACTOR · ALL INPUTS` selector and the
     `Reduce all N · all impls` button from Recognition; KEEP `First N` (persisted,
     0 = all, still scopes Add/Fresh). Canonical extractor stays OpenCV in
     pipeline/templates; do NOT remove OpenCV transform support or legacy backend
     API compatibility; no hidden selector may drift to a non-OpenCV value; no
     empty layout gaps. Tests: extractor label/control absent, Reduce All absent,
     First N present/functional (0 and nonzero), Add/Fresh scope correctly, legacy
     APIs untouched, no duplicate actions.
  3. Generic direct transform runner: TWO INDEPENDENT combo+Call slots (not
     cascading WHAT/BY WHO). Each combo lists the COMPLETE set of registered
     composite `transformation/doer` pairs (canonical registry key/label +
     availability metadata; no string-concat guesswork, no duplicate registry);
     both combos expose the same full list independently (no cross-filtering); the
     same composite may be chosen in both; selections persist separately per Visual
     Sequence as UI state; each slot has one adjacent Call. Each Call executes only
     its own selected composite plus its unmet dependsOn DAG (including persisted
     cross-frame selectors like frame[-1]@x/y) in deterministic topological order
     through the canonical transform executor — direct, scoped by First N (0 = all),
     NOT stamping TODOs and NOT entering the pool. Reuse the same single-writer /
     output locks / result-path + meta contracts (no races with pool or the other
     slot; active-claim conflicts shown, never overwritten); respect
     current-output skip / force / staleness / content revisions; per-unit failure
     isolation with visible blocking; Stop/cancel + rolling per-unit/dependency
     status per slot. Confirm before large/expensive calls: preserve the >800
     Visual Sequence gate, show exact First N unit count + expanded dependency
     step/call count, and for any LLM dependency/doer show model/backend + exact
     call count/cost and require confirmation; URL/nav reload never invokes Call.
     Combos + Call live compactly on the pooler control area; do not restore the
     removed extractor/Reduce-All controls. Tests: two full identical independent
     option sets, independent selection/state, adjacent Call per slot, same-pair
     selection, independent invocation/progress, no cross-filtering, First N
     0/nonzero, inline + frame[-1] dependencies, deterministic DAG/fan-in/cycle
     rejection, no TODO/pool-claim creation, active-claim conflict, result/meta
     parity with the pool, current-output skip/stale rerun, failure isolation,
     cancel, LLM/large confirmation, no navigation auto-call, and legacy doers.
     UI is intentionally minimal — essentially `[process/by-who combo] [Call]
     [process/by-who combo] [Call]`, no WHAT/BY WHO labels, no cascading fields,
     no setup panel, and no visible dependency editor; dependency expansion / First
     N / locks / confirmations / progress / error / cancel stay underneath and are
     surfaced compactly via the button/tooltip/status line. Each slot is ready
     whenever its selected pair is available.

- Deferred preprocessing step stack (2026-09-09): the Video Import extraction
  controls will gain a compact, unlimited, ordered stack of preprocessing step
  rows scoped to all submitted items in the current Visual Sequence. It is a
  selected reusable **filter chain** that reuses the EXISTING Video Import Filters
  registry/library — real filter IDs, parameter schemas/editors, validation,
  previews, materialization, serialization, and saved-chain conventions — never a
  parallel registry. `Original Pixels` is a removable no-op/pass-through and an
  empty stack resolves to original pixels without byte duplication; `Denoise`,
  `scale_3x_nearest`, and future options must be existing registered filters
  (add once to the canonical registry if absent). Only deterministic,
  materializable filters may feed OpenCV parts extraction and all LLM image
  consumers, which receive the identical final variant hash. Persist the ordered
  chain+params per Visual Sequence; derive deterministic chain/step identities
  from source hash + ordered implementation/version/config; cache filesystem
  intermediates; changing/reordering/removing a step stales the correct downstream
  lineage without auto-running work; preserve the original bytes and exact
  coordinate transforms/provenance so highlights map back to original coordinates.
  Not a debug image. Blocked until the user resumes; see
  `docs/design/TEMPORAL_EVENTS.md` §8.2. Eventual tests: registry parity with
  Frames & Filters, parameter reuse, unsupported-filter gating, empty/no-op,
  removable Original, unlimited chains, duplicates, reorder identity, cache reuse,
  chain. Initial state shows two `Original Pixels` slots (the no-op state; no
  separate enable checkbox; no-op slots materialize nothing), with the intended
  experiment being slot 1 -> `3x nearest-neighbor` and slot 2 -> `DeNoise`
  (`3x -> DeNoise`), neither active by default. Each row exposes accessible
  `+ before`/`+ after`/`remove` actions; insert/delete/reorder preserve stable
  step IDs/params (identity never index-based), an empty stack is valid
  (original pixels), and edits stale cache lineage without auto-running work. The
  expanded editor collapses into one compact banner listing the ordered chain as
  horizontally scrolling step chips (`Original Pixels -> 3x nearest -> DeNoise`),
  including muted no-op chips, param summaries, and dirty/error/stale/output
  status; clicking expands the full editor or focuses a stable step. A per-sequence
  `Preview frame` selector runs the selected frame alone through the draft chain
  (original vs final, optional focused step) via the existing Filters preview
  engine, cached by frame hash + draft chain identity, with no full-sequence run;
  it is UI state, not processing identity, and uses lazy/virtualized selection for
  large sequences. The banner is the always-visible disclosure header; both the
  step-stack editor and the preview selector/preview live inside its collapsible
  region, so collapsing reclaims all vertical space while preserving preview
  state/cache unless invalidated.

- Dominant color-mass grouping (2026-09-07): `group_regions.pl` now isolates a
  color occupying at least two-thirds of an attached group's area and ten
  percent of the input image. It then recomputes attachment components among
  the remaining members without traversing through the removed mass, preventing
  a large solid region from bridging unrelated details into one group. Two
  focused SWI-Prolog regression tests pass, the production frontend build
  passes, and grouping outputs were regenerated for the active image plus steps
  0-20. Local full-suite collection remains affected by the existing stale
  `ARC3_RUNTIME_HOME` configuration and unavailable `scikit-image` in the
  system Python environment.

- Video Import now resolves the workspace's inherited effective model through
  `model-selection?include_models=false` before the full Model Policy registry
  finishes enumerating. The inherited model stays first and selected in Member
  Extraction and Turtle controls, while late discovery merges additional
  choices without overriding a user's manual pick. Its image collections now
  have distinct names: User Pick Gallery, Extracted Frame Gallery, Filter
  Effect Gallery, Processed Output Gallery, Processing Trail Gallery, and
  Extracted Member Gallery. Frame extraction and cursor grabs open and scroll
  to the Extracted Frame Gallery. Member processing is split into two
  independently started sibling top-level stack sections with no tabs:
  **Scene Objects Textual Description** persists the description, raw output,
  and object inventory, then stops for review; **Scene Object Visuals** remains
  disabled until that text exists, then gives each targeted call the saved text
  plus current image and extracts one object against the progressively reduced
  scene. The textual-description prompt is persisted and editable with
  `{{goal}}` and `{{alreadyExtracted}}` placeholders. Its labeled model selector
  is directly above the prompt and its input-image-gated Call LLM button is
  directly below. All prompts are complete before execution: restored
  description rows render a finished fallback, and visual-extraction prompts
  are precomputed as soon as text is parsed. No prompt-preparation placeholders
  remain. Plain and markdown-fenced JSON text output is detected and
  pretty-printed by default, with the exact raw model response retained in a
  nested disclosure. The two surfaces expose exact rendered prompts, raw text
  output, per-call statuses, and each transparent output image.
  Processing Trail levels may be marked for inspection, but those marks no
  longer select scene-object model inputs. Textual description and all
  downstream prompt workflows start from Extracted Frame Gallery input images
  directly. Visual extraction records each progressively reduced or
  parent-cutout per-call input and shows the exact image path beside its prompt.
  The earlier no-description failure was
  traced to the nonexistent `/player/asset` model-input URL (the real route is
  `/asset`) before any model invocation occurred. A second issue allowed
  `copilot-headless-2` despite its explicit `vision: false`; image selectors now
  exclude text-only models and show unavailable inherited vision models as
  disabled. The configured SingularityNET backend was enabled because the
  workspace override already selected its Gemma vision model and `SNET_API_KEY`
  is present. An earlier live call with `frame_0065.png` returned a valid
  scene description and four-object JSON inventory in 27.5 seconds.
  Member count parameters were removed: the textual-description pass inventories
  every distinct thing it reports and Scene Object Visuals processes that list.
  The model combo now fills in precedence order from the effective selection,
  workspace models, included-workspace models, and shared inherited models
  before merging slower Model Policy discovery. Video Import now uses the
  shared rich option formatter, so each choice includes backend and capability
  tags plus effective/inherited/unavailable annotations. STATUS has a wrapping
  top band containing all four checkboxes plus State and Forget. Its lower row
  contains the full-width rolling log with Stop aligned beside it.
  Scene Object Visuals now runs two persisted, editable prompts before
  extraction. The first creates a normalized `objects_with_sub_objects`
  artifact: every found object is a root key, recursively decomposed sub-objects
  are keys under their immediate parents, countable parts carry count metadata,
  and strongly implied hidden parts carry visibility, reason, and occluder
  metadata. Fully hidden parts remain available for later reasoning but are not
  sent to visual extraction. A prompt-writer fan-out then asks the model for a
  better ready-to-run extraction prompt for every non-hidden root and
  sub-object, preserving exact writer prompts, outputs, generated prompts, and
  explicit errors. The next prompt sends the input image plus the saved text
  and visible hierarchy,
  validates the returned JSON object names, displays the exact prompt,
  formatted/raw response, warnings, chosen front-to-back order, and per-object
  route choice. Roots use `direct_from_scene`; sub-objects may use
  `direct_from_scene`, `from_parent_cutout`, or both, defaulting to both if the
  model omits a route. The pipeline runs a progressive direct pass plus an
  independent recursive parent-reference pass, retaining every route input,
  prompt, status, and output. The client enforces every sub-object before its
  parent even if the model orders them incorrectly. Unknown names are reported
  and ignored; omitted known objects are visibly appended last; a response with
  no recognized names fails. Extracted variants render at the bottom as one
  vertical strip per input image. Successful textual-description,
  `objects_with_sub_objects`, prompt-writer, extraction-order, object-visual, and
  turtle model responses are cached by model ID, exact prompt, and image
  content hash. The cache persists in workspace Video Import page state and
  emits a STATUS cache-hit line when reused. Editable prompt panels and
  per-route prompt details start collapsed. Every LLM stage has its own explicit
  Call LLM button, and downstream checkpoint calls replay required upstream
  prompt workflows through that cache. An always-visible Scene Object Pipe
  Flow now sits between the collapsed description and visual-extraction nodes:
  a rendered left-column tree sits beside the Description → Visuals → Turtle
  stack and connects the Extraction root, persisted
  inventory-scope, prompt-source, and image-route branch nodes, visible
  continue/convergence diamonds, and the Turtle / Import Game destination. All
  36 combinations are routed as curved SVG legs behind the branch cards, with
  the selected leg highlighted. Clicking a
  node opens its branch editor/history on the
  right; clicking a branch endpoint or bottom destination opens a stacked full
  path. Converged `Both`/model-planned paths provide explicit parent-fork
  disambiguation without changing execution. Previous/next controls cycle all
  36 inventory × prompt × image-route paths. Runs append labeled fork/outcome
  history, and the selected pipes now directly gate roots vs sub-objects,
  baseline vs rewritten prompt attempts, and direct vs parent-cutout passes.
  The tree remains visible without an imported video. Live acceptance confirmed
  one root, three fork levels with 3/3/4 branch cards, one highlighted branch
  per level, convergence rendering, destination routing, and path cycling on
  2026-09-01. A live screenshot then exposed the board's grid row collapsing to
  18px/2px visible height because `overflow: hidden` removed its automatic
  minimum size; `overflow: visible` now preserves the 628.5px content-sized row,
  backed by a regression assertion. Focused tests (8), the frontend production
  build, and the visible spline screenshot passed.
  The final placement is a true two-column workspace: live geometry put the
  414px tree at x=56 and the 646px Description / Visuals / Turtle stack at
  x=498. The tree begins at Extraction, ends at Turtle / Import Game, renders
  exactly 36 SVG route legs, and highlights exactly one current route.
  The left tree is now wire-first: thin shared/branch connectors and small
  glowing root, branch, convergence, and destination orbs replace the former
  boxed tree cards; labels remain clickable and the right editor remains the
  only card-style stack. Live computed styles confirmed 36 route lines, one
  selected route, transparent/no-border branch and stage nodes, and 7px round
  branch orbs; a live screenshot captures the result.
  The center is now a strict two-column workspace. A single sticky left
  `.video-import-pipe-column` physically contains the `VIDEO IMPORT PIPE FLOW`
  header and spline, joined by an origin orb and continuous 2px cyan stem. The
  right column owns the fork/path editor and Description → Visuals → Turtle
  stack. Live geometry confirmed the combined left column at x=56/414px wide,
  the right editor at x=480, the stack at x=498/646px wide, and a zero-pixel
  seam between the pipe header bottom and spline top.
  Entering Video Import also starts with UI Debug, Generations, and UI Config
  hidden; their existing topbar restore controls remain available.
  Scene-object LLM stages now ignore Processing Trail marks and consume
  Extracted Frame Gallery input images directly; restored probe-era inventories
  and scenes are filtered out. The prior fixed hierarchy/fan-out/route
  combination has been superseded by one recursive cycle: Describer lists
  direct children, Planner orders them, Outliner traces one object per
  independently scheduled call, and Extractor cuts and reconstructs the
  background from those outlines; every cutout is enqueued through the same cycle
  until Describer returns no children or the branch reaches the fixed level-9
  ceiling. Describer, Planner, Outliner, Extractor, and
  Turtle expose explicit Call LLM buttons and persisted prompts/outputs. The
  implementation supplies initial templates, but the running system never
  generates or rewrites prompts. Planner is strictly order-only. Outliner owns
  precise polygons, holes, clockwise contour instructions, and normalized
  Turtle traces, with one object per call and no dependency on other outline
  calls or extraction. Extractor owns cutting and background reconstruction
  from the stored Outliner geometry. Turtle
  prefers leaf-object images. The left wire/orb tree is now data-driven from
  real parentInventoryId links rather than 36 hypothetical routes.
  `NONE`, unusable geometry, or cut failures stop only that sub-object branch
  and render as `EXTRACTOR STOP` leaves; other sibling branches continue.
  Live inspection confirmed zero fixed-route SVG paths, the recursive empty
  state before Describer runs, the four Describer / Planner / Recursive
  Extractor / Turtle Call LLM controls.
  The two-column geometry remains 414px left tree / 672px inspector / 646px
  right stack. Focused UI tests (9), the frontend production build, and a live
  recursive-tree screenshot passed.
  Recursive roots now come only from the new persisted, explicit multi-selection
  checkboxes in Extracted Frame Gallery; picked inputs, keepers, algorithmic
  groups, and fallbacks cannot populate that set. The sticky left middle column
  mirrors real selected inputs, then Extracted Objects and Leftover Backgrounds
  grouped by recursion level; the right middle column owns the workflow.
  Extractor now requests multi-part pixel-edge polygons plus hole polygons.
  `member-cut` supersamples masks at 4×, preserves source alpha, writes
  anti-aliased RGBA PNG cutouts, and erases the identical mask from the leftover
  background. Every precise cutout also produces a separate padded next-pass
  PNG enlarged to at least 640px on its longest side; recursive Describer and
  terminal Turtle calls use that analysis image while galleries retain the
  original cutout.
  Live HMR inspection (without blocking on another test run) showed 111
  available frame checkboxes, zero implicit selections, a disabled Describer
  call until explicit selection, the 412px left gallery column, 672px right
  workflow column, level 0/1 galleries, manual Describer/Planner/Extractor
  prompts, and Opus 4.8 Fast selected. UI Debug, Generations, and UI Config were
  hidden on page entry.
  Recursive automation now has five
  persisted controls: Describer, Planner, Extractor, advance recursion levels,
  and next-pass enlargement. Each worker consumes only its own ready queue;
  failed/not-found objects are not automatically retried. Disabling recursion
  retains cutouts, and re-enabling it creates their missing child inventories.
  Next-pass enlargement is now conditional in `member-cut`; when disabled, the
  exact precision cutout is reused. All pre-extraction sections remain
  full-width above the two-column area, whose full-width top border is the
  automation strip; the left side begins with hideable galleries and the right
  side contains the recursive workflow.
  The Alt-hover 5× image magnifier now includes a scrollable context sidecar.
  It resolves the exact filesystem image back to its recursive inventory and
  shows the saved image description plus every detected object's name,
  description, and status; unanalyzed images report that no saved context
  exists.
  Ordinary non-Alt image hover shows two separate blocks: the exact parent
  object description that selected a cutout for extraction and that image's
  latest raw Describer output. A fresh cutout immediately has parent context,
  then gains its own Describer block without replacing the first.
  Extracted Images and the other left galleries support additive multi-select
  through Ctrl-click (or Ctrl+Enter/Space), which toggles only that item while
  preserving prior selections. Ordinary click exclusively opens the popup and
  workflow gallery checkboxes are hidden.
  Extracted Frame Gallery input checkboxes and Select all/none remain enabled
  during model work, so auto-starting on the first selection cannot lock the
  user out of adding more images to the same input set.
  Selected Images mirror tiles no longer repeat selection checkboxes. Clicking
  an image tile pins its metadata popup at a fixed screen position until the
  explicit Close button is pressed; ordinary hover remains transient. Popouts
  auto-size but cap at half the viewport in each dimension, scroll their text,
  and pinned popouts support bounded two-axis resizing. Normal and Alt popout
  headers are sticky within their scrollers so Close remains visible.
  Image popouts now fetch and pretty-print the complete provenance sidecar and
  pretty-print Describer/Turtle Gen/Turtle PNG JSON locally in the popout
  without rewriting the raw persisted artifacts.
  Ordinary pinned and Alt-click image popouts now include the exact
  pretty-printed Planner output, or a truthful waiting/queued/retrying/leaf
  status before an output exists.
  Planner output now includes per-object surgical cutout instructions with
  include/exclude/occlusion rules, a clockwise contour description, and
  normalized Turtle-style move/line boundary commands. Extractor injects these
  instructions and refines the guide into final pixel-edge polygons/holes.
  Extractor now also returns an LLM-authored background continuation plan.
  Content-aware removal now prefers the selected image-output model's standard
  OpenAI-compatible `/images/edits` masked edit, accepts only a real exact-size
  image, and composites only the cut mask. Simulated/failed output falls back
  to NumPy boundary diffusion. Model/artifact/fallback metadata and the fill
  plan are retained in API output and provenance; median, blur, and transparent
  hole remain selectable.
  Outliner now records its exact source image and decoded dimensions. Member
  cutting verifies identical dimensions and same-source/provenance-descendant
  lineage, rejects out-of-bounds coordinates instead of clamping, and records
  the alignment proof in both cutout and scene provenance.
  The ChatConversation colored picker is now the reusable
  `ColoredTagCombobox.tsx`. Video Import uses it for every model selector, with
  backend grouping and colored vision/image-output/multimodal/reasoning/tools/
  JSON/audio/code/text plus preferred/inherited/unavailable chips.
  Removed Describer's inherited one-third cap. Every stage now defaults to full
  global capacity, with fair lowest-utilization dispatch across ready queues.
  Added a persisted global Hold/Drain Workers control for LLM-server
  maintenance. It drains active calls, blocks new admissions, resumes on
  release, and is automatically pressed/owned by restart-pending.
  Clearing Selected Images now removes each selected root's complete recursive
  workflow metadata and descendants, scene/Turtle state, response/provenance
  caches, derived gallery selections, and pinned popups without deleting the
  source image files.
  Selected Images tiles now expose live D/P/O/E/T/I stage strips with distinct
  waiting, active, retrying, partial, and complete colors and detailed tooltips.
  Scene detection and frame extraction now have independent job state, polling,
  progress, and cancellation, so they can run concurrently. Video metadata
  writes merge atomically to preserve both completion records.
  Video captioning is another independent media job: prefer embedded WebVTT,
  otherwise transcribe 30-second audio chunks concurrently through an enabled
  audio model; persist `captions.vtt` plus timed `video.json` cues and render
  the active cue over playback.
  The LLM controller stage rows expose ready-but-waiting Pending jobs, durable
  completed counts, and persisted observed average call duration. Each stage
  leaves at least five or 30% of global slots available to other stages in
  either direction; equal-utilization dispatch rotates across the stage order.
  Keep automatic LLM scheduling blocked until page-state restoration completes;
  otherwise a persisted worker hold leaks fresh calls during reload.
  Alt rollover gives the image a full half-width/half-height pane beside the
  context and scales it aspect-correctly with contain (including above 5× for
  small tiles). The combined rectangle is clamped onscreen so neither pane
  covers the other.
  Alt-click now pins that complete image/context pair across keyup and
  pointer-leave until its explicit Close button is pressed.
  Planner output is directly reachable from the controller and selected-cycle
  status button: the target section is opened and smooth-scrolled to the exact
  selected inventory. Describer/Extractor status buttons use the same reveal
  behavior.
  Concurrent root/output rendering is now sorted by source frame index.
  Undescribed empty inventories no longer falsely show Planner complete; the
  selected-cycle/controller status distinguishes waiting for Describer,
  Planner queued, retrying after error, and output ready. Planner reveal retries
  its scroll after the collapsed section mounts.
  All five recursive automation controls default ON only when no saved state
  exists; subsequent loads restore the exact last persisted toggle values.
  Frame extraction now supports both short start/end time windows and
  start/end scene-number windows. Scene mode has a persisted skip-scenes
  stride, records each output's source scene, and defaults on first use to
  scene 2 with one skipped scene (2, 4, 6, ...); saved state still wins.
  The automation border now has a global model and total 1-50 process ceiling,
  followed by Describer/Planner/Extractor/Turtle Gen/Turtle PNG rows with per-call model,
  concurrency, and prompt-source selectors. Call models default to `use
  global`; call limits default to `keep below global limit`.
  The former six-root cap is removed. Root and recursive-child descriptions
  share a work-conserving pool, and every call queue fills the selected
  effective concurrency whenever enough work is ready.
  The inherited Describer share is a soft one-third of the global ceiling:
  Describer borrows idle slots, then stops refilling above one-third whenever
  downstream call types are waiting. A numeric Describer override still wins.
  All five LLM call types now launch cooperatively at the same time through a
  shared global semaphore. The scheduler enforces global/per-type limits,
  selects the least-utilized runnable type, and exposes active/queued counters.
  Failed calls now cool down for one second, allow other queued work to move
  ahead, and retry indefinitely. Retries bypass the content cache so invalid
  prior responses are not replayed forever.
  Every call type reserves up to two initial slots for due retries while
  allowing fresh/retry work to borrow unused reservation, keeping all available
  capacity work-conserving.
  Restart-pending now drains the cooperative scheduler: active calls may
  finish, but queued calls and stages about to advance refuse new model work.
  The controller reports `RESTART PENDING · DRAINING`; cancel resumes queues,
  while restart-started remains paused through reload.
  Restart intent is mirrored in the backend presence registry, allowing
  isolated browser contexts to discover it on their five-second poll and drain
  workers even when BroadcastChannel is unavailable.
  Described object leaves now run separate Turtle Gen and Turtle PNG LLM calls,
  then render through a validated non-Python drawing runtime, and
  appear first in a Pre-Turtle Leaves gallery before terminating in a separate
  persisted Turtle Output gallery. Hover metadata shows the program and
  terminal render.
  Every generated Video Import PNG now receives a `.provenance.json` sidecar
  with original/current dimensions, source video/frame/scene, parent links,
  crop/mask data, resize scale/padding, and flattened lineage back to the
  first-seen frame. Turtle artifacts are linked into the leaf provenance.
  Extracted Frame Gallery now has a Clear action that clears frame tiles and
  their pick/group/LLM-input state while preserving source files. Every
  workflow gallery now has its own Clear action; recursive level clears reset
  that level plus descendants so automation regenerates them, and Turtle Output
  clears/requeues its own persisted program/render gallery.
  Opening or changing a per-call model, process-limit, or prompt combo exposes
  that call's complete selected prompt in a full-width 320px-minimum editor
  directly below the controller bar.
  The controller prompt editor now has explicit Reload Prompt and Save Prompt
  actions. Reload updates only the active prompt from filesystem page state;
  Save immediately persists the current snapshot and browser mirror.
  The prior Windows Uvicorn/WatchFiles handoff was reproduced: the reloader
  logged `Reloading`, lost its parent, and left a high-CPU orphan worker without
  a usable listener. Automatic backend file watching is now disabled on all
  platforms; the user/operator performs one explicit batched restart after a
  group of backend edits.
  Restart Now, Cancel Restart, and topbar Restart controls remain bright,
  colored, glowing, and full-contrast in pending/preparing states;
  lifecycle-disabled buttons no longer dim.
  Frontend Vite HMR and the surgical UI file-change reload hook are also
  disabled. UI reloads are explicit, so edits can be batched before the browser
  is refreshed.
  The global title frame now exposes a page-process/restart-change event
  channel for every page. Restart requested during active work becomes a
  draggable, nonmodal center notice that records the original reason and keeps
  appending global/page changes while the user continues working. The existing
  Restart controls remain informed and clickable; only explicit Restart Now
  starts the restart.
  Open workbench tabs now heartbeat every five seconds through both a cross-tab
  BroadcastChannel and local backend presence registry with
  tab/workspace/page/URL identity. The title frame shows
  Open Workbenches and Active counts and exposes the live snapshot as
  `window.__workbenchGlobalFrameStatus`, so operators/agents can inspect what
  is active, including across isolated browser contexts. Restart-pending
  requests and updates broadcast to every open tab.
  The global title frame also owns an allowlisted realtime UI command channel
  for bounded style, `live-ui-*` class, and scroll changes. It rejects
  executable/network CSS, counts live patches in the topbar, records them in a
  pending-restart ledger, and can roll all ephemeral changes back without a
  reload. Arbitrary JavaScript evaluation is intentionally not exposed.
  Live validation confirmed the restart notice remains nonmodal, moves by its
  header, records later change-channel messages, and leaves page pointer events
  enabled.
  Final focused Video Import/global-frame regressions pass (25 tests), the frontend
  production build passes, `git diff --check` passes, and the restarted
  workbench API responds on port 8000.
  Explicit live rollout verification after the manual browser reload showed
  all five cooperative call types ON, the persisted global ceiling at 18,
  Describer auto-reserved at 6, live active/queued counters, Backend connected,
  and the full Describer prompt editor with Reload Prompt and Save Prompt.
  The final explicit rollout showed 19 Selected Images tiles with zero repeated
  checkboxes, a clicked metadata popup remaining pinned after pointer-leave
  until Close, and Planner Output opening the target visual-output section.
  After the final manual Vite restart/browser reload, live validation measured
  the pinned popup at 624×160 inside a 640×360 half-viewport cap with
  `resize: both`, scrolling, Close, and pretty-printed provenance. A structured
  title-frame command applied one live patch, showed `Live patches 1`, and
  restored the original style without reload.
  A later validated frontend batch is intentionally pending explicit rollout:
  live Video Import still had 10/18 LLM workers active, so the global
  nonmodal restart notice was opened instead of interrupting them. Its ledger
  lists cooperative simultaneous scheduling, two retry-reserved workers per
  call type, truthful first-image Planner status/order, and bounded resizable
  pretty-printed popouts. The user can press Restart Now when ready.
  The latest batch passes 32 focused tests and the frontend production build.
  Its active-tab draggable restart notice is visible and lists Alt-click sticky
  image/description, Ctrl-only selection, central backend workbench presence,
  and explicit restart-supervisor changes. It remains nonmodal while the last
  four observed LLM workers finish; the user owns pressing Restart Now.
  The completed rollout now passes 32 focused tests. Live checks confirmed
  Planner appears in ordinary and Alt popups; Alt-click remains pinned after
  Alt keyup and pointer-leave; Close stays visible after scrolling; Restart is
  bright cyan at full opacity; duplicate restart requests debounce to one new
  API instance; and the central presence endpoint reports both open workbench
  tabs with workspace/page identity.
  Every item in those left galleries now has an independently persisted
  multi-selection checkbox. Input selections share the strict Describer input
  set; extracted-object and leftover-background selections persist separately
  for curation.
  The left gallery order is now all Extracted Images, explicitly Selected
  Images, then separate Extracted Objects and Leftover Backgrounds panels for
  every recursion level. Each panel has an independently persisted
  hide/restore disclosure. Live HMR showed 412px left / 672px right columns,
  eight level-aware panels for depth 2, one available input checkbox with zero
  implicit checks, and a disabled Describer until selection.
  Video Import initially prefers an enabled Claude Opus 4.8/4.8-fast vision
  model for both object and Turtle selectors, preserves manual choices, and
  falls back to the effective workspace model when Opus is unavailable. Live
  reload selected enabled
  `enullm-8801-copilot-headless-3_percent100` / Claude Opus 4.8 Fast in both
  object selectors. The live stack shows only the four user-editable initial
  templates (Description, Planner, Extractor, Turtle) and no generated prompt
  writer.
  Legacy saved Extractor templates using `{{objectName}}` are migrated on load
  to the single shared `{{nextObjectName}}` template. Live reload confirmed the
  five shared target/order placeholders, no Planner-generated prompt UI, and no
  per-object prompt display.
  Any Video Import image now supports Alt-hover magnification through a fixed,
  pointer-transparent overlay sized to exactly 5× displayed width and 5×
  displayed height; key release, pointer exit, and window blur remove it. Live
  geometry confirmed a 299.96×168.59 image produced a 1499.8×842.97 content
  overlay (exactly 5.0× in both dimensions).
  The center Video Import scroller
  uses `scrollbar-gutter: stable`, a constrained `minmax(0,1fr)` track, and
  border-box sizing. It reserves the live 15px scrollbar width instead of
  overlaying controls and reclaims 15px of excess left padding; live geometry
  shows a 28px left inset and 52px minimum right-edge control clearance.
  Focused integration tests: 10 passed; frontend build and live UI inspection
  passed on 2026-08-31.
- The Video Import model pipeline was stabilized against the live 21-worker
  EmuLLM fleet. EmuLLM now reserves the greater of five workers or 30% of
  connected capacity for other clients (14-client ceiling, 7-worker reserve at
  current capacity), immediately skips a request-local not-ready worker, rejects
  duplicate worker IDs, reports active-request age/stuck workers and disconnect
  diagnostics, and persists an immediate anti-idle checkbox that is currently
  OFF. Workbench model invocation is asynchronous, caches resolved model
  context for 300 seconds, and uses a lightweight workspace lookup that does
  not recursively count resources. Video Import state strips base64 debug
  payloads and shards member inventories and the model-response cache beside
  `page_state.json`, reducing the live state from about 74 MB to about 2.4 MB.
  The model resources were synchronized to the live 65-model catalog with zero
  relationship errors. Final validation sent three simultaneous Workbench
  Outliner calls through EmuLLM: all returned valid bounded polygons in 16.9
  seconds wall time, with 0.84-second pre-dispatch latency instead of the prior
  96–134-second stalls. A second bottleneck was found in EmuLLM administration:
  every three-second dashboard poll deserialized complete mailbox JSONL
  histories, while bulk servant restart processed all workers sequentially.
  Mailbox summaries now count JSONL records without full deserialization,
  `/emullm/admin/health` is a filesystem-free readiness probe, and full admin
  snapshots fell from 19–22 seconds to 39–145 ms. Bulk restart now uses
  reconnect-aware rolling batches of seven; a live 21-worker rollout completed
  in 94.46 seconds with all 21 ready, instead of more than 20 minutes.
  Admin/status dashboards pause when hidden, optionally poll hidden pages every
  two minutes, and persist visible polling windows of continuous, one, two, or
  five minutes with an explicit Wake/Refresh control. Startup reconciliation
  writes its operational JSON as raw bytes rather than routing it through the
  MeTTa resource codec.
  The recursive Planner contract now separately declares symmetric touching
  pairs, directed foreground-to-occluded relationships, directed
  container-to-fully-contained relationships, and a relationship-aware
  extraction order. Parsed relations persist with each inventory, render beside
  Planner output, and provide per-object context to Outliner. Legacy persisted
  order-only default prompts migrate to the expanded contract without replacing
  unrelated custom Planner templates.
  Planner now also returns one in-object pixel label point per ordered object;
  the workbench persists a numbered order preview. Every Outliner result must
  include a normalized Turtle trace, which the backend draws with its
  polygons/holes over the exact source image and checks against the mask
  boundary before marking it extraction-ready. The preview, agreement,
  boundary coverage, and geometry hash persist in a small gallery, and
  Extractor verifies the matching artifact/hash before cutting. Scene detection
  now exposes threshold, sampling rate, minimum gap, and an optional marker cap;
  blank means scan to the video end. A scene-starved frame extractor stops
  without cancelling a scene detector that is still running.
  Video Import can start a pinned MediaMTX 1.20.1 container and displays
  standard WHIP/RTMP publish and WHEP/HLS playback URLs. It can also consume an
  external HLS/RTSP/RTMP/SRT/HTTP video or podcast endpoint in a background
  scene job, saving scene frames until end/limit/interrupt. Existing ARC
  playback image sequences are listed from real recording directories and
  imported directly; every frame's provenance embeds the cumulative move list,
  incoming action/state, and source node that produced it.
  The top source field resolves YouTube URLs through yt-dlp for direct scene
  consumption, while the upload control accepts movies and bounded image ZIP
  sequences. ZIP entries are decoded without path extraction and retain
  archive-entry provenance. A persisted left-column Extracted Images source
  dropdown switches between video, stream, ARC, archive, and restored frame
  collections.
  The duplicate top-level Scene Objects Textual Description section was
  removed without removing Describer controls or recursive prompt/output
  inspection, and JSON CONFIG is now the final page section. The full existing
  ARC3 player (including B1/B2 support) is embedded as a recording source and
  refreshes the source catalog after moves. Workspace media now uses
  `data/arc3_games/{recordings,importables,curated}`, `data/video_import`, and
  `data/vision_frames`; legacy roots are migrated with persisted JSON path
  rewrites while readers keep compatibility fallbacks.
  The live ARC3 workspace migration completed with 3,236 files under
  `arc3_games`, 119 under `video_import`, and 1,208 initial `vision_frames`;
  the remaining legacy importables tree was conflict-safely merged to 2,071
  canonical files and all three legacy roots were removed. Live acceptance
  found 12 recordings, two curated sources, nine videos, a running MediaMTX
  router, a two-frame ARC import whose second provenance contains its one-move
  prefix, no duplicate top Describer section, and JSON CONFIG last.
- The App Menu now has a persisted top minimize/restore button, retaining every
  destination as its original icon-only button at 36px, plus a persisted
  `[ - / + ]` density control for zero-gap tight or comfortable spacing. Every
  menu group heading is an independent persisted disclosure. Video Import
  temporarily minimizes the App Menu, Resource Browser, and Documentation
  frames on entry and restores their prior widths on exit. Built-in menu glyphs
  are distinct and semantic for icon-only use. Every active plugin manifest now
  exports exactly one `<Plugin Name> Admin` UI page under PLUGINS: Coplex,
  CoplexStdPy, EMULLM, Mailbox Chat, Web Proxy, and WS_COLLAB. Redundant plugin
  docs/audio/monitor menu exports were removed; the PLUGINS group itself now
  owns collapsing those six admin links instead of hiding them behind the
  generic overflow threshold. Focused Video Import, shell-navigation, and
  plugin-export tests passed (14 tests), the frontend production build passed,
  and live geometry confirmed `36px 1166px 36px` on 2026-08-31.
- EMULLM model assets were refreshed from the live `:8801` relay on 2026-08-31
  after restarting its managed service. Discovery fetched and imported all 51
  advertised models, including 21 new resources and every fetched property,
  provider-metadata field, limit, pricing field, and capability. EMULLM's
  OpenAI-compatible list omits backing-model capabilities, so discovery now
  also fetches `/emullm/admin/copilots/models` and embeds the matching Copilot
  SDK backing metadata. This corrected 28 imported headless assets to
  `vision: true`; 24 inherited EMULLM vision variants are effectively enabled
  in the active workspace after updating its three local discovery overrides.
  Both shared and workspace EMULLM backends are explicitly enabled, enforced by
  a regression test. Video Import merges availability monotonically so slower
  Model Policy metadata cannot downgrade a model already confirmed enabled by
  resolution. Model options keep availability separate and derive a
  `preferred` / `not preferred: <policy source> selected another model`
  explanation instead of treating non-preference as disablement.
  The live Scene Objects selector now has 30 enabled vision choices total,
  including those 24 EMULLM assets. A real
  `enullm-8801-copilot-headless-2_percent100` call with `frame_0065.png`
  returned `SEEN:` and an accurate image description in 7.9 seconds. Model
  discovery/model-selection/Video Import/SingularityNET focused tests: 49
  passed.
- UI acceptance-debug invariant through **2026-09-02**: keep the labeled,
  colored borders for `DEBUG A · APP MENU`, `DEBUG B · DOCS INDEX`,
  `DEBUG C · DOCS SCAN CONTROLS`, `DEBUG D · FILE LIST SCROLLER`, and
  `DEBUG E · DOCUMENT / SUPERCONTROL`. The user is using these persistent
  colors to identify layout shells while hammering out sizing and scrolling.
  Every interactive control is also outlined by type for the same period:
  button (pink), input (yellow), select (cyan), textarea (orange),
  content-editable (violet), and resize separator (green).
  Every rendered descendant carrying a TSX `className` also receives a violet
  dashed rounded outline so component/layout boundaries remain visible. Exact
  compile-time `src/**/*.tsx:line` locations remain stamped onto JSX DOM elements
  as `data-tsx-source`; hovering shows that exact location beside the mouse with
  viewport-edge flipping. A persisted top-bar `Debug UI On/Off`
  button enables or disables both the colored layer and location popup.
  The filename overlap was never caused by this popup: it came from a stale
  174px Docs grid column underneath a 220px app menu. Keep all focused-page
  layouts bound to `--nav-rail-width`; do not move the popup to compensate.
  Do not remove, neutralize, or restyle them before that date unless the user
  explicitly asks.

- Workflow UI invariant: every grouped accordion surface must be rendered by
  `ThreeStateAccordionStack`, and every direct member must use that stack's ID.
  Do not imitate stacking with wrapper divs, page grids, positioning, or CSS
  repairs. The workflow page has exactly three structural stacks: CENTER,
  LEFT, and RIGHT. CENTER owns the full workspace column between Resource and
  Docs. Its `LEFT + RIGHT` member contains the LEFT and RIGHT stacks.
- Accordion control invariant: existing accordion members are the page layout
  and control surface. Keep each control full-width inside the appropriate
  existing member. Do not add new accordion members, floating toolbars, cards,
  side controls, or independent control rows unless the user explicitly asks
  for a new panel.
- The canonical workflow accordion names and placement destinations are listed
  in `docs/design/WORKFLOW_ACCORDION_MAP.md`. When the user names an
  accordion, place the requested control inside that exact existing member.

- Canonical checkout: `C:\snet\PeTTa\repos\symbolic_ml_workbench`
- Active branch: `main` in the user's existing local checkout
- Remote tracking branch: `origin/main` (informational; no push authorized)
- Historical validated commit from the earlier checkpoint: `24ff5a79`
  (`Add model policy history aggregation`)
- Python environment: one repository-root `.venv` containing all optional
  ARC3, workbench, test, notebook, and integration dependencies
- Frontend dependencies: `frontend/apps/workbench/node_modules`
- Local `.env` is ignored by Git and must point at the canonical checkout;
  never copy its secrets into this ledger

## Completed and validated

- [x] Add AtomSpaces -> Resource AtomSpace. The real
  `/workspaces/{workspace_id}/resource-atomspace` endpoint materializes
  all effective filesystem/runtime resources as atoms and all six canonical
  relationship fields plus `preferredImplementation` as links. The page offers
  kind/search/relationship filters, selected-atom link inspection, and MeTTa
  graph output.
- [x] Add the resource-level `dependsOn` / `dependedOnBy` availability graph,
  separate from `implements` / `implementedBy` implementation links and from
  `inheritsFrom` / `inheritedBy` property inheritance. Saves synchronize reverse
  dependency backlinks, model resolution uses dependencies for effective
  enabled state, discovery persists both graph directions, generic resource
  controls expose both fields, and Models enable/disable scope now selects
  dependencies/dependents rather than inheritance parents/children.
- [x] Make Models resource overrides directly editable and replace immediate
  enable/disable writes with a scope chooser for the selected resource,
  ancestors, and descendants. Enabling a child whose effective state is blocked
  by a disabled parent selects its parents by default. Model discovery imports
  and removals now synchronize the mandatory parent-side `implementedBy`
  backlinks, preventing imported EMULLM children such as
  `enullm-8801-copilot-headless-2_percent75` from remaining unresolved.
- [x] Keep the shared hierarchy **Show View** controls and resource tree visible
  together as separate bordered chips. The bounded TREE FILTERS chip stays
  above the independently scrolling TREE chip, with explicit spacing, layout,
  and stacking order so a long model/resource tree cannot overlap the controls.
  TREE FILTERS can collapse vertically to its header so TREE receives the
  released height. Verified on
  2026-08-31 in the live Models page, with the focused universal artifact
  editor tests and frontend production build passing.
- [x] Add the repository-native `llm_task_harness` plugin and Python runtime.
  The plugin contributes a real deep-linkable task console, native admin
  settings, durable task/event/transcript storage, approval and human-input
  pauses, cancellation/recovery, guarded workspace tools, dynamic extension
  tools, and iterative read-only subagents. Execution is disabled by default;
  enabled process/test calls are documented as host-code authority rather than
  an OS sandbox. Security hardening covers denied secrets and task roots,
  scoped filesystem/Git access, context limits, bounded output/environment/DNS
  work, public-address-pinned HTTP, process-tree termination, and request-scoped
  provider cancellation. On 2026-08-27 the reusable runtime was consolidated
  from `python/llm_task_harness.py` into the canonical plugin as `runtime.py`,
  with `__init__.py` preserving the public API; the built wheel now contains
  the runtime, entrypoint, manifest, documentation, and console together under
  `llm_task_harness/`. Tests stay in `tests/` and durable state stays in
  `runtime/llm_task_harness/` by repository convention. Verified initially on
  2026-08-26 and again after consolidation: the focused runtime/plugin
  suite passes (72 passed, 2 Windows symlink-privilege skips), the frontend
  production build and repository/scoped diff checks pass, and the active app
  restores `pluginId=llm_task_harness&pluginPage=task-console` after reload with
  `/llm_task_harness/ui` loaded and execution visibly disabled. Independent
  plugin and security reviews found no reproducible release blockers. The full
  repository run reached 928 passed and 2 skipped with 31 failures in unrelated
  pre-existing
  model-catalog, resource-discovery, legacy UI assertion, documentation,
  operation-playground, web-proxy, and service-registry areas.
- [x] ChatConversation's mailbox chooser now merges mailbox directories from
  every plugin that exposes one instead of only the first source that answers.
  `fetchDirectory` in `ChatConversation.tsx` fetches `/ws_collab/mailbox/mailboxes`
  and `/workbench/mailbox/mailboxes` concurrently (each tolerating the other being
  down) and unions both by mailbox id, letting the live ws_collab relay win on
  id collisions. `python/workbench_api_server/mailbox_api_lib.py` (the `/workbench/mailbox/*`
  surface) previously went dark (503) whenever the sibling `mailbox_channels`
  package wasn't installed; it now falls back to the bundled `mailbox_chat`
  plugin copy (`plugins/mailbox_chat/src/mailbox_chat/`) via a thin
  `_ChannelStoreShim`/`_MailboxClientShim` adapting its `mailbox_store`/
  `agent_mailbox` naming to the API this module was written against. This is
  the same on-disk store `scripts/stt_mailbox_listener.py` and
  `scripts/agent_mailbox.py` write to (defaults to `<repo>/mailbox/`, now
  gitignored), so mailboxes/transcripts created by those tools show up in the
  Chat UI's mailbox chooser without a running mailbox_channels relay. Verified
  on 2026-08-26: `mailbox_api_lib.mailbox_list()` returns the real
  `symbolic-workbench-user` mailbox created by an earlier STT test; targeted
  pytest (`test_mailbox_api_lib.py`, `test_page_ui_tools.py`,
  `test_chat_autoscroll_settings_ui.py`, 19 tests) and `npm run build` both
  pass.
  Follow-up fix: `mailbox_chat.agent_mailbox.mailbox_dir()` itself defaults to
  `Path.cwd() / "mailbox"`, which only lines up with the repo-root `mailbox/`
  store when a process happens to be launched from the repository root. The
  live dev API server is started with `os.chdir(SERVER_ROOT)`
  (`python/workbench_api_server/scripts/run_api_server.py`), so `/workbench/mailbox/mailboxes` still
  came back empty against the real running server even though the direct
  Python check above passed. `mailbox_api_lib.py`'s fallback block now pins
  the shim's `mailbox_dir` to `<repo_root>/mailbox` (falling back to
  `AGENT_MAILBOX_DIR` when set) instead of delegating to the bundled client's
  cwd-relative default, and `scripts/stt_mailbox_listener.py` now sets the
  same `AGENT_MAILBOX_DIR` default before importing the bundled client, so
  both agree on one location no matter their invocation cwd. Audited the other
  `scan: startup` plugins (`ws_collab`, `emullm`, `llm_task_harness`) and the
  Codex-specific `.codex/mailbox/agent_mailbox.py` / `mailbox_poll_watchdog.py`
  pair: all already anchor their storage off `Path(__file__)`/the manifest
  path rather than cwd, so only the bundled `mailbox_chat` copy's two direct
  consumers needed this fix. Verified on 2026-08-27 against the actual running
  dev server (not just a direct import): restarted the live API process (the
  `/workbench/system/restart` file-watcher trigger did not pick up the change, so
  the process was stopped and relaunched via `run_api_server.py`) and
  `GET http://127.0.0.1:8000/workbench/mailbox/mailboxes` now returns
  `symbolic-workbench-user` and `server_outbound_relay_agent_to_mailbox`; the
  19 targeted tests above still pass unchanged (they always pin
  `AGENT_MAILBOX_DIR` explicitly so this bug never surfaced there).
- [x] Add `scripts/stt_mailbox_listener.py`: a live, offline speech-to-text
  bridge that listens on one or more real audio input devices (enumerated via
  `sounddevice`) and posts each finalized utterance into the shared mailbox
  through the bundled `mailbox_chat`/`mailbox_channels` `send()` client (no
  relay server required), defaulting to the `symbolic-workbench-user` channel
  the Chat page displays by default. Transcription runs fully local/offline
  with Vosk (`vosk-model-small-en-us-0.15`, cached under
  `~/.cache/ws_collab_models`). Documented in `docs/AGENT_MAILBOX.md`; added a
  `stt` pyproject extra (`sounddevice`, `vosk`). Verified on 2026-08-26: real
  device enumeration and a live 3s capture on the Intel Smart Sound mic array
  opened and streamed without error; a Windows-SAPI-synthesized WAV fed
  through the Vosk recognizer transcribed exactly ("testing one two three the
  quick brown fox"); and a direct `send()` call produced a correctly
  structured `stt_transcript` record in the local mailbox store.
- [x] Rework the ChatConversation header into a two-region layout. The persistent
  Require Match line owns the filter buttons and collapses only New Object,
  Subscription, From/To, Send-to, and the selected stream's configuration panel.
  Below a fixed divider, Chat/File owns the per-stream auto-scroll override and
  global policy, while Mailbox and Add Mailbox share one row above the scrolling
  conversation. The real mailbox configuration editor is hosted by a Config tab
  beside Chat and File instead of remaining as a bottom panel. Focused Chat UI
  tests, the frontend production build, diff check, and live expanded/collapsed
  geometry and Config-tab verification passed on 2026-08-26.
- [x] Add a collapsible Chat-page mailbox arranger. Mailbox choices support Name,
  per-minute activity, per-hour activity, and personal-unread sorting; Group by
  is schema-driven and defaults to the discovered `server` field. Option numbers
  are messages beyond the current FROM identity's personal cursor. Stream open
  behavior is selectable between resume-at-last-read and go-to-end-and-mark-read,
  with optional cursor advancement when the end is viewed. The Workbench API
  supplies bulk activity/cursor metadata and the UI falls back to the ws_collab
  relay when the optional local mailbox client is unavailable. Workbench also
  tracks `field_cache_config` records and each stream's cached field-value data;
  discovered cached fields automatically populate Group by and cached values
  determine the stream's group.
  Focused tests and the frontend production build passed; live browser
  verification showed discovered grouping fields, cursor-relative unread badges,
  per-minute/per-hour activity tags, 30 cached fields, cache limit 16, and two
  live cache-config records on 2026-08-26.
- [x] Migrate the former dual-purpose relationship into `implements` /
  `implementedBy` for implementation identity and `inheritsFrom` /
  `inheritedBy` for borrow/exclude and lend/withhold property policies. Maintained loaders,
  editors, APIs, scripts, tests, documentation, and filesystem MeTTa resources
  no longer use generic `children`, `parents`, or `inherits` fields for this
  relationship. Genuine runtime/UI tree parent-child structures are unchanged.
  `implements` is the upward inheritance edge to conceptual parent contracts.
  Effective inheritance is borrow intersect lend, minus exclude and withhold,
  followed by local overrides. Parents withhold identity and relationship fields
  by default. The complete contract is documented in
  `docs/design/RESOURCE_RELATIONSHIP_MODEL.md`.
- [x] Support partial implementations throughout family resolvers and editors.
  Do not classify every resource with `implements` as concrete. Derive and expose
  UI-only abstract/partial/concrete/runnable status from the current draft, resolved
  inheritance, and family-specific unresolved behavior, bindings, constraints,
  and execution route. Show the missing obligations; do not persist an
  authoritative abstractness flag. Allow runtime resolution to traverse deeper
  specialization chains until the job is runnable.
  Treat this status as contextual and reversible: an `implements` parent may
  supply required pieces, so removing or disabling that parent can make a
  previously runnable resource abstract. Invalidate affected descendants and
  explain the lost parent or obligation.
  Operation and Prompt resolution now traverses deeper preferred implementations
  until runnable; Models and Datatypes use negotiated multi-parent inheritance
  with conflict and cycle detection. The rich Operation and Datatype editors
  expose live BORROW/EXCLUDE, LEND/WITHHOLD, provenance, missing obligations,
  and derived status. Focused validation passed (107-test cross-family suite,
  59-test final regression suite, and 33 additional Operation tests); frontend
  production build passed; live family APIs returned successfully; and browser
  verification showed runnable-through-preferred Operation status and
  concrete-through-preferred Datatype status on 2026-08-26.
- [x] Standardize every maintained implementation pointer on the
  single canonical persisted field `preferredImplementation`. Frontend editors,
  backend resolution, scripts, tests, documentation, and 42 filesystem MeTTa
  resources now read and write only that name; no legacy alias fallback remains.
  Artifact-specific UI labels such as Preferred Alternative or Default
  Implementation remain presentation text over the same canonical field.
- [ ] Add policy-selectable `specializationPriorities` profiles (for example
  `bySpeed` and `byAccuracy`) as ordered implementation-ID lists. Keep
  `preferredImplementation` singular as the deterministic fallback.

- [x] Rebuild the Docs filesystem page as the sole main page with a left
  Tree/Navigator/Full Paths document host and persistent open-document tabs.
  Every open file owns a separately mounted embedded SuperControl, preserving
  its display/editor state, draft, dirty marker, close action, and filesystem
  persistence callback while inactive. The active document fills the complete
  right-side allocation. The obsolete nested `FILESYSTEM DOCUMENT` pseudo-page
  is removed. Start/INCLUDE/EXCLUDE masks now execute in the backend; the
  `**/docs/` scan uses Git-indexed roots and measures about 0.5 seconds cold
  instead of 7-10 seconds. Its complete index is cached for 30 seconds by
  normalized start/include/exclude scope and filesystem revision, reducing
  repeated reads to about 16ms. Explicit Scan/Refresh bypasses the cache, and
  repository writes invalidate it. The app menu and Docs layout share the persisted
  `--nav-rail-width`, preventing the menu from overlapping filename prefixes,
  and all Docs file browsers reserve a real scrollbar gutter.

- [x] Repair the Models `+ Backend`/`+ model`/`+ preset` creation flow so new
  documents are immediately dirty and therefore expose Save. Every pending
  save now has a logical **Save in workspace** selector populated from the
  workspace registry; the backend/model/system is written to that workspace's
  canonical lifecycle directory without exposing or asking for a disk path.
  Cross-workspace saves keep the resulting resource open under its destination
  workspace identity. Focused UI contract tests and the frontend production
  build passed on 2026-08-24.

- [x] Add the shared `enullm-8801` OpenAI-compatible backend resource for the
  local emullm relay at `http://127.0.0.1:8801/v1`, with LLM completion and
  vision capabilities, keyless configuration, the requested `yourelf.same`
  default model, and filesystem categories. Backend catalog parsing and focused
  resource validation passed on 2026-08-24.

- [x] Add filesystem-backed Workbench plugin discovery under
  `plugins`, a Plugins navigation submenu/page with manual refresh
  and persisted `startup`/`disabled` scan policy, and the first `web_proxy`
  plugin. The proxy exposes the allowlisted local emullm relay at
  `/web_proxy/http/127.0.0.1:8801/`, forwards GET/POST/PUT/PATCH/DELETE/OPTIONS/
  HEAD plus bidirectional WebSockets, and rejects non-manifest targets. Live
  smoke validation preserved the upstream GET status/content type and returned
  HTTP 200 from a proxied relay POST. Focused backend/navigation tests: 65
  passed; frontend production build and `git diff --check` passed on
  2026-08-24.

- [x] Give every Workbench plugin an administration/configure page. A plugin
  now publishes `admin.json` beside `plugin.json`; the scanner reads that file
  from disk without importing the plugin, so the Plugins page constructs the
  configure link, desktop `ui.pages`, and the initialization readiness report
  from the filesystem alone. The declared `path` is served by the plugin's own
  router on the API port and mirrored beneath `/workbench` for the browser, exposing
  `GET <path>`, `PUT <path>/settings`, `POST <path>/initialize`, and
  `POST <path>/actions/{action}`. Descriptors are data, rendered natively by
  `PluginAdminPanel`; a plugin exporting neither `create_admin_router` nor its
  own admin route receives `plugin_admin.generic_admin_router`, so no plugin is
  left without a configure page. Plugin initialization is declarative
  (`init.requires`, `init.files`, `init.install`, `init.steps`) plus an optional
  `initialize(manifest)` hook the loader calls before `create_router` and the
  page can re-run. `web_proxy` gained a real configure page with live target
  probing, an editable outbound allowlist, and transport settings that the
  running proxy re-reads from `plugin.json`.

  Fixed while doing this: plugin JSON was being written through the workspace
  resource API, which redirects every `.json` path to a `.metta` sibling, so
  configure-page edits silently produced `plugin.metta` and lost the manifest.
  Plugin configuration now uses new `read_config_json`/`write_config_json`/
  `config_file_exists` provider methods that never mirror to MeTTa and write LF.

  Validation on 2026-08-25: `tests/test_web_proxy_plugin.py` 11 passed;
  full suite 602 passed with only the pre-existing failures/errors unchanged
  (temp-dir `PermissionError` collection errors, `docs/CHAT_PAGE.md` back-link,
  `arc3_play_api.py` provider-boundary offenders, missing operation topics);
  frontend production build and `git diff --check` passed. Live UI verified end
  to end: configure page opened from the Plugins card, initialization checks,
  target probe, and a save that persisted to `plugin.json` and re-rendered.

- [x] Keep plugin Python restarts explicit, as selected by the user on
  2026-09-12. The current native launcher uses the explicit restart supervisor
  with `reload=False`, not the old directory watcher. Backend/plugin Python
  edits require an intentional API restart; do not widen `reload_dirs` or
  silently interrupt active work. The maintained guard is
  `tests/workbench_api/test_windows_dependency_bootstrap.py::test_api_server_uses_explicit_batched_restarts`.

- [x] Harden plugin discovery so every entry whose name begins with `hide_`
  (case-insensitive) is skipped before manifest parsing, and only directories
  containing `plugin.json` are considered plugins. Manifest-less directories
  and loose filesystem objects are ignored. Validation on 2026-08-26:
  `tests/test_web_proxy_plugin.py` passed (16 tests) with an external pytest
  base directory. The running Workbench was not restarted.

- [x] Move the plugin administration declaration out of `admin.json` and into
  `plugin.json`, which is now the only manifest. A plugin declares `configPage`
  (an absolute URL to a page it serves itself, embedded by the workbench) or
  `adminPage` (an API path serving a descriptor the workbench renders natively).
  `plugin-install` declares initialization requirements, `plugin-init` lists
  commands one plugin asks another to run, and `ui.pages` installs menu entries
  in the workbench navigation. Each plugin may export `resolve_ui_pages` to say
  where its own pages live, and `apply_plugin_init` to accept commands; a target
  may return an `APIRouter` for the loader to mount so plugins never touch the
  application object. `web_proxy` gained persisted `mounts` that relay HTTP and
  WebSockets, and WS_COLLAB uses `plugin-init` to mount `/ws_collab` onto its
  standalone server. Renamed the `web-proxy` route to `web_proxy` so every
  plugin prefix equals its id.

  Fixed while doing this: both hand-merged manifests were invalid JSON (a `//`
  comment and a missing comma), `web_proxy` had a duplicated `label` and had
  lost `allowedTargets`, the loader's injected plugin-directory `path` silently
  overwrote the declared administration path so the configure page answered 404,
  and the WS_COLLAB console built `/v1/v1/auth/whoami` when served from inside a
  versioned mount.

  The Vite dev/preview proxy is now generated from the plugin manifests and
  their persisted mounts, and anything the web server does not own falls back to
  the API, so a new plugin route needs no config edit. The API root redirects to
  the web interface using `WORKBENCH_WEB_URL`.

  Validation on 2026-08-25: `tests/test_web_proxy_plugin.py` 15 passed; frontend
  production build passed. Live UI verified: both plugins load, install their
  menu entries, list clickable URLs, the native configure page saves to
  `plugin.json`, and the WS_COLLAB console reaches WebSocket transport through
  Vite → API → web_proxy mount → the standalone server.

- [x] Add `cadence=on-activation` to the WS_COLLAB worker monitor
  (`plugins/ws_collab/ws_collab/workers.py`), resolving the tension
  between the health monitor (warn ~60s, overdue ~120s, unresponsive ~300s) and
  the doctrine's ban on agent keep-alive loops: an agent that only runs when its
  recurring automation fires was previously guaranteed to be flagged as a
  failure. A worker now declares `meta.cadence = "on-activation"` at
  registration. Its state is still tracked truthfully, but its alerts become
  severity `info` with `confirmation_required` false, it gets no unresponsive
  TTS announcement, and it is excluded from the all-workers-down team-failure
  check, which is now judged only over continuous-cadence workers. `cadence` is
  exposed on `GET /workers` and on every alert. Designed jointly with the `zira`
  agent over the WS_COLLAB conversation stream, which proposed exactly this
  combination and rejected simply raising the global thresholds because that
  hides real failures.

  Rewrote the WS_COLLAB long-running prompt (published as version 2 through
  `POST /ws_collab/prompt`, version 1 preserved in durable history; also
  written to `emullm/.git/long_running_prompt.txt`). It now documents that
  **Copilot's own built-in Workflows cron is the approved recurring launcher**,
  with a worked `save_workflow` example, and that one minute is the floor
  because cron's smallest field is minutes - so a 10s or 30s cycle is not
  achievable and must be reported rather than simulated. OS schedulers,
  watchdogs, self-revival scripts, and wrapper loops remain prohibited. It also
  distinguishes the two activation shapes (bounded monitor vs persistent
  worker), explains mechanically how a persistent worker holds its turn, and
  corrects the WebSocket contract: the client sends `ping` and the server
  answers `pong`; the server's own `ping` must not be answered.

  Validation on 2026-08-25: `tests/test_workers.py` 20 passed (16 existing plus
  4 new covering declaration, informational alerts, continuous workers still
  raising danger, and team-failure exclusion); full ws_collab suite 252 passed
  with 1 pre-existing failure (`test_event_store.py` hits a Windows
  atomic-replace `PermissionError` in `jsonl_store.py`, untouched by this work).
  Verified live after restarting the 8802 server: registration reports
  `cadence: on-activation` and it appears on the worker roster.

- [x] Re-hosted Overview inside the standard resource-page shell so it behaves
  like other pages (for example Events): normal page body container, top menu
  row placement, and persistent docs/help context on the right instead of the
  previous bare/full-bleed wrapper behavior.

- [x] Seeded shared `design/models/model_overridden_properties.json` with
  initial web-sourced capability metadata for all current shared model
  resources. Data now includes OpenRouter-derived modality/token-limit fields
  where available, Hugging Face embedding metadata for BAAI/UAE models, and
  explicit unresolved notes for models without reliable public capability
  evidence in this pass.

- [x] LLM top menu modes are now real mode-specific pages on the Models
  surface: **Browse Models**, **Discover Public Properties**, and
  **Override**. Discover mode auto-focuses backend discovery, lets users select
  a worker model, and runs a web-grovel capability prompt (vision/multimodal,
  token limits, and related metadata) that merges into
  `design/models/model_overridden_properties.json`. Override mode is now a
  dedicated filesystem-backed editor for that override resource.

- [x] Workspace chooser cards now report per-resource inheritance splits without
  requiring any workspace to be opened first. Discovery now includes
  `resourceCountBreakdowns` for workflows, operations, datatypes,
  representations, models, and prompts, each with `total`, `local`,
  `inherited`, and `overridden` counts. The chooser summary renders entries in
  the format `N resource (L local / I inherited / O overridden)`.

- [x] Add a new ARC3 workflow page `arc3.two_image_prolog` for two-image upload
  and contract-driven Prolog extraction. The new renderer
  (`arc3_prompt_prolog`) is wired into `FilesystemWorkbenchPage`, presents
  dedicated BEFORE/AFTER image inputs, runs the provided combined prompt
  contract against a selected enabled model, and renders parsed outputs for
  `new_identities`, `objects_pl`, `differences_pl`, `similarities_pl`,
  `turtle_from_image_pl`, `turtle_from_diff_pl`, and `rules_pl` with a raw
  response fallback panel. Added filesystem page source editing in the right
  column via `ResourceSourceEditor`. Validation on 2026-08-18: `pytest -q
  tests/test_visual_image_diff_ui.py` passed (19 passed) using a repo-local
  temp directory override, frontend `npm run build` passed, and
  `git diff --check` passed.

- [x] Reorganize the active Workbench around the human/AI blackboard model:
  Workspace owns Overview, Goals, Planning, and Workflows; Capabilities owns
  Operations, Source Code, Systems, Models, Datatypes, and Policies; Knowledge
  owns Data, AtomSpaces, and Artifacts; Runtime owns Goal Runs, Executions,
  Events, States, and Logs; System owns Model Policy, Benchmarks, Processes,
  and Settings. Source Code reuses the Prompt editor and language-filtered
  Operation implementation editors for Prolog, MeTTa, and Python. Systems
  configures callable runtimes and agents separately from model backends, while
  Models retains backends, models, and presets. Data and AtomSpaces are
  knowledge surfaces rather than design-time datatype definitions. The active
  rich editors, documentation panel, deep links, and legacy route aliases are
  preserved. Navigation, Source Code, policy, and Systems contract validation:
  58 passed; frontend production build passed on 2026-08-17.

- [x] Add selectable Model Policy performance-history aggregation. The chart
  can display every persisted result, the latest point per model/preset series,
  or an average per series without changing the exact chronological result
  rows. Model-policy focused validation: 44 passed; frontend production build
  passed on 2026-08-17.

- [x] Make the Visual Image Diff structural columns adjustable without moving
  any content outside its existing `ThreeStateAccordionStack`. The default
  desktop proportions now match the accepted wide layout at approximately
  `1 : 2.8 : 1.9` (LEFT : CENTER : RIGHT). The two stack borders are pointer
  drag handles with keyboard adjustment, persist their ratios in browser
  storage, and reset to the accepted proportions on double-click. Existing
  two-column and one-column responsive layouts remain unchanged and hide the
  inactive drag borders. Focused Visual Image Diff/navigation/workflow tests:
  73 passed; frontend production build and `git diff --check` passed on
  2026-08-17. The full repository suite passed with `586 passed` using an
  external pytest base directory. Live browser validation confirmed the two
  separators, accepted reset proportions, and identical width state in a
  freshly opened tab after adjustment.

- [x] Restore the complete repository validation baseline after the navigation,
  resource hierarchy, and runtime-discovery changes. UI contract tests now
  normalize formatting locally instead of coupling behavior checks to Prettier
  whitespace; controlled tree branches assert their three-state display mode;
  the Documentation resizer and current legacy Workflow label are asserted by
  their live UI names; generated count-to-ten guides link back to the repository
  README; and temporary pytest trees are excluded from maintained-document
  discovery. Validation on 2026-08-17: `460 passed` using an external
  `--basetemp`; frontend `npm run build` passed (with only Vite's existing
  large-chunk advisory).

- [x] Extend the English Workflow Generation Order composer inside its existing
  `ThreeStateAccordionStack`: `[+group]` now creates and selects a simultaneous
  group; a composed `[group]` row runs only that group; the full-width insertion
  selector sits below the group's children; and every occurrence exposes a real
  filesystem-backed Prompt selector followed by an effective-model override.
  Prompt/model routing is serialized into nested `generation_steps`, group model
  overrides control the actual group invocation, the analyzer receives the
  effective Prompt catalog, and saved audit files retain both the full composer
  and the last subset run. Summary, Memory, Checklist, Outputs, Rules, Workflow,
  and Group rows now have distinct semantic background/border tints. Each group
  also owns a full-width inner shuffle control, independent of the existing
  top-level shuffle. The former New/Reuse/Preserve/Hide occurrence modes are
  removed. Every listed occurrence executes, and its compact `VISIBLE` control
  independently declares whether its current value is exposed to later stages
  of other output types (`peers`, default on) or exposed as the old value to a
  later occurrence of the same type (`updates`, default off). The twenty-one
  composer outputs now map one-to-one to filesystem-backed shared prompts. The
  authoring pipelines include `+englishsteps` -> `+steps` -> `+workflow`,
  `+libops` -> `+matchops` -> `+inventops` -> `+codeops` -> `+promptops`,
  `+libdt` -> `+matchdt` -> `+inventdt` -> `+codedt`, and
  `+libwf` -> `+matchwf` -> `+inventwf` -> `+codewf`. Operation prompts are
  proposed only for new LLM-backed implementations; deterministic Operations
  do not receive unnecessary prompt resources. Datatype and Workflow selection
  use the real effective filesystem catalogs. Groups can be copied with their
  child order, Prompt/model overrides, and visibility scopes preserved under fresh
  composer identities. New and restored rows default to their matching Prompt
  while retaining the override dropdown. Focused tests: 10 passed; frontend
  production build passed on 2026-08-16. Live browser validation confirmed all
  twenty-one full-width composer buttons, real filesystem Prompt defaults for
  `englishsteps`, `steps`, and `promptops`, and a copied group whose child order,
  selected Prompts, inherited-model overrides, and visibility scopes were preserved.
  The add-output composer now keeps its controls in the same existing accordion
  while placing the Operations (`libops` onward), Datatypes (`libdt` onward),
  and Workflows (`libwf` onward) pipelines on distinct full-width rows.

- [x] Add persisted system-wide model selection with a real model catalog,
  global fallback, and an explicit `Pervasive` checkbox that makes the global
  model override operation/policy choices while still allowing the Workspace
  Overview to declare a highest-priority workspace override. The
  `generate_count_to_ten` workspace currently overrides to SNET `asi1`; the
  global fallback remains MiniMax M3 with
  pervasiveness disabled. English-to-Workflow now browses the previous
  Workflow and returns a revised Workflow JSON object instead of compiling
  MeTTa, sends every multi-field runtime input to the LLM, limits its catalog
  to the shared workflow-language primitives, and requires a combined
  `new_memory_values_plan` companion output. The UI rejects incomplete output,
  adopts the combined plan in the existing Memory / Value Plan accordion, and
  leaves filesystem application as a separate user action. Focused tests (17)
  and the frontend production build passed. Live SNET invocations on
  2026-08-16 returned a 10-step Workflow with ten combined memory values from
  `asi1-mini`, then a 16-step Workflow with seventeen combined memory values
  from `asi1`; both reported zero unresolved operations and validation reports
  with no errors or warnings. The non-mini result remains an unapplied draft
  pending review because its loop condition appears bound to the initial count
  rather than a reevaluated count.
  OmniRoute Best Free was also exercised first, but its upstream free pool
  failed twice with HTTP 400/403 and then 429, so no draft was accepted from
  that route.

- [x] Rebuild the active Workflows layout as exactly three native
  `ThreeStateAccordionStack` surfaces: CENTER, LEFT, and RIGHT. CENTER now owns
  all authoring, preflight, `LEFT + RIGHT`, and reference members; the actual
  LEFT and RIGHT stacks are DOM children of `LEFT + RIGHT`; WORKFLOW RUNNER is
  first in LEFT; and RUNNER DESIGN REFERENCE is last in CENTER. Removed the
  old center-stack drag exception so every member remains reorderable. CENTER
  also has one native `− / * / +` stack control that updates all eight direct
  members together. No CSS resizing was added. The English-to-Workflow rich
  runner now loads its model selector from the effective `/models` catalog,
  and its operation binds the abstract `workflow.generate_from_english` prompt
  with a concrete MeTTa/JSON prompt variant rather than incorrectly treating a
  child prompt ID as an abstract prompt. Focused tests: 8 workflow-layout tests
  plus prompt-resolution regression tests passed; frontend production build
  and `git diff --check` passed; live validation confirmed only the three stack
  IDs, correct nesting/order, matching 546px CENTER/member boundaries, all
  eight members changing together, and 16 enabled model choices on 2026-08-16.

- [x] Remove the experimental `Workflows (New)` page, its navigation entry,
  `workflowV2` rendering state, component, and dedicated CSS. Legacy V2 URLs
  now resolve to the active Workflows page instead of producing a dead route.

- [x] Make the workflow Resource Browser respond to its own resizable width
  with named CSS container queries rather than browser-window media queries.
  At narrow widths, branch summaries, variant toggles, stage controls, badges,
  metadata, and child rows stack without horizontal overflow; an extra-compact
  layout applies below 210px. Focused navigation tests: 33 passed; frontend
  production build passed; live validation at a 250px pane confirmed stacked
  controls and no horizontal overflow on 2026-08-15.

- [x] Give every System Settings Workspace Registry row a lazy expandable,
  synchronized MeTTa/JSON editor for its complete filesystem metadata. Saves
  preserve custom fields, enforce the registry workspace ID, and refresh the
  structured row. Each row also reports its own recursive file count, disk
  usage, and nonzero local resource counts without inherited resources. A
  separate transitive usage metric reports how many project workspaces consume
  it and lists their IDs; the inverse metric reports how many project
  workspaces each row itself consumes and lists those IDs. Focused Settings and process tests: 15 passed;
  frontend production build and `git diff
  --check` passed on 2026-08-15.

- [x] Make Managed Process Startup Policy a canonical MeTTa/JSON resource at
  `shared_library_system/policies/workbench_startup.workbench_startup_policy.metta`.
  Settings and `run_workbench` now share that resource; the former JSON config
  is read only as a migration fallback and all new saves are physical MeTTa
  through the JSON compatibility provider. System Settings now embeds a
  synchronized structured/MeTTa/JSON editor for that resource, preserves
  invalid drafts, and disables save until source validation succeeds. Service
  entries now fully define labels, launchers/batch files, working directories,
  ports, health paths, command-match patterns, and control permissions as
  independent `managed_service` resources under `design/services`, so new
  managed processes can be added without code changes. Each service owns a
  `defaultStartup` fallback; the separate startup policy contains only optional
  `start`/`hidden` overrides. Services can declare `singleton`; launch is then
  suppressed whenever any matching process already exists, including an
  externally started process without the configured listener. Ambiguous
  `hidden` was split into `hiddenWindow` (console launch behavior) and
  `hideFromProcessViewer` (Processes-page visibility); Settings always requests
  the complete list, and legacy `hidden` is read as `hiddenWindow`. `allowKill` and
  `allowRelaunch` are independently enforced by both UI and API. Focused
  tests: 13 passed; frontend
  production build and `git diff --check` passed on 2026-08-15.

- [x] Expand the Processes viewer beyond listener-only discovery: each known
  service now reports every OS process whose command line matches the process
  the Workbench would launch, including independently started Flask/Uvicorn,
  Vite, OmniRoute, router, and mailbox process trees. Matching command lines
  are redacted before reaching the browser and the socket-owning process is
  identified separately. Every match is a first-class visible row, and a
  matching external process counts as detected even without the configured
  listener. Rows expose the live working directory plus confirmed per-PID
  Kill and Relaunch controls; the backend revalidates service/PID matching
  immediately before either local-only action. Focused service-monitor tests
  (6 passed), frontend
  production build, and focused `git diff --check` passed on 2026-08-15.

- [x] Rework Workspace Overview and System Settings boundaries: Overview now
  shows real local/inherited resource counts, every effective inherited
  workspace, and workspace-specific inclusion/credential controls. System
  Settings now owns the global workspace registry (project/library type,
  chooser visibility, recoverable deletion), run_workbench process startup
  and window-visibility policy, and system resource-provider status. The right
  inspector is filesystem documentation across pages. Focused tests: 36
  passed; frontend build and live Overview/Settings checks passed on
  2026-08-14.
- [x] Accept `menu=<view>` as a navigation deep-link alias, keep legacy
  `view=<view>` compatibility, and strip stale run-selection parameters when
  opening Workspace Overview. Focused navigation tests and frontend build
  passed; the clean `menu=overview` URL was verified live on 2026-08-14.
- [x] Put the automated ARC runner controls in the persistent top bar: mode,
  move limit, seconds per game, game limit, seed, selected-step execution,
  cascade, auto-play, pause, and stop all share the same run-input state. Live
  UI editing verification passed; focused UI/ARC tests: 51 passed; frontend
  build passed on 2026-08-13.
- [x] Fix automatic-session playground inputs so workflow defaults populate
  the visible final step (`60` seconds, `10` moves, seed `0`, automatic mode),
  while Python also normalizes explicitly null time/move limits. Live UI field
  inspection passed; focused UI/ARC tests: 51 passed; frontend build passed
  on 2026-08-13.
- [x] Replace the misleading workflow `Step` control with explicit execution
  controls: Previous/Next navigate without running, `Run this step` invokes
  exactly the selected Operation playground, `Run cascade` keeps whole-graph
  execution, and `Auto-play all` starts automatic mode. Live UI validation
  ran initialization, discovery, and the dependent filter one at a time;
  focused UI/ARC tests: 50 passed; frontend build passed on 2026-08-13.
- [x] Repair ARC3 Random Player cascade startup after automatic-mode inputs
  were added: workflow-level defaults are merged before required-input
  validation, the UI seeds editable run inputs with those defaults plus the
  active workspace root, and unused clock inputs were removed. Focused engine
  and ARC tests: 37 passed; frontend build and live UI startup passed on
  2026-08-13.
- [x] Rebuild the ARC3 Random Player outer loop around real UI-steppable
  operations: human or random game selection, zero-move initialization,
  per-move game-frame capture, an 11-frame replay gallery/GIF, and an
  interactive frame player with speed and scrub controls.
- [x] Track selected ARC games from an initially empty ordered list, filter
  the live catalog before random selection, and add an explicit final step
  selecting and remembering another unplayed game. UI validation selected
  `dc22` followed by distinct `tn36`, with `[dc22, tn36]` persisted in the
  workflow context. Focused ARC tests: 17 passed; frontend build passed on
  2026-08-13.
- [x] Keep shared libraries workflow-free and give every runnable application
  workspace at most one primary workflow. Moved six former library workflows
  into dedicated workspaces and removed the duplicate Random Player workflow
  and planning strategy from the combined image/ARC workspace. Ownership
  invariant and focused workspace tests passed on 2026-08-13.

- [x] Add the shared SingularityNET OpenAI-compatible LLM backend at
  `https://llm.c.singularitynet.io/v1`, with credentials resolved only from
  `SNET_API_KEY`.
- [x] Rename the active Backends navigation concept to Systems.
- [x] Give Systems a first-class `view=systems` route and `/systems` API.
- [x] Keep vendor/API backends exclusively in Models and model policy.
- [x] Add filesystem-backed system resources for Python, SWI-Prolog, MeTTa,
  the LLM System Caller, OmegaClaw, and Codex.
- [x] Allow the system schema to represent runtimes, agents, MCP servers, and
  plugins through `systemType`.
- [x] Make root `.venv` the single Python environment used by ARC3 and the
  browser workbench; prevent launchers from creating `workbench/.venv`.
- [x] Run the full Python suite: 317 tests passed on 2026-08-11.
- [x] Run the frontend production build successfully on 2026-08-11.
- [x] Run the focused Systems, mailbox, workspace, launcher, model-policy, and
  universal-editor suite: 97 tests passed on 2026-08-11.
- [x] Start the API and Vite UI on acceptance ports and verify the live Systems
  endpoint returns `codex,llm,metta,omegaclaw,python,prolog`.
- [x] Add a durable mailbox polling command with bounded checks, early message
  exit, monitored-port failure detection, and deterministic regression tests.
- [x] Add a repository-owned Codex heartbeat definition and document its
  mapping to the machine-local installed automation.
- [x] Move every workbench-owned API route to `/workbench/*`. Plugin bare
  mounts remain unchanged (`/web_proxy/...`, `/ws_collab/...`, etc.), while
  plugin administration mirrors now live at `/workbench/{plugin}/admin` through
  the `plugin_api.py`/`plugin_admin.py` `API_PREFIX = "/workbench"` contract.
  Changed: all 18 former `app.include_router(...)` calls plus the hardcoded
  workbench route decorators in
  `python/workbench_api_server/app.py` (health, whoami, analyze, runs, tasks, workflows)
  now use `/workbench`; the self-referencing health-check URL in
  `service_monitor_api.py`'s `_builtin_definitions()`; the mockup URLs in
  `workflow_runner_todo_api.py`; `python/workbench_api_server/scripts/submit_managed_command.py`
  and `scripts/mailbox_codex_listener.py`'s own calls into the workbench API;
  `scripts/capture_workflow_runner_visuals.ps1`; all 51 frontend `.tsx`/`.ts`
  files that called the former namespace (bulk replacement verified
  none of them referenced a plugin's own bare mount); the matching
  test-file assertions (mailbox, workspaces, engine, goal-runs, repository,
  system/services, arc3-play, plugins-meta, plus three stale `app.py`-source
  string assertions and `test_mailbox_api_lib.py`'s OWN isolated-app fixture,
  which still used the former prefix after its call-site assertions
  were bulk-renamed — caught by a targeted git-stash A/B pytest diff); reference docs
  (`docs/WORKBENCH.md`, `docs/AGENT_MAILBOX.md`, `docs/CHAT_PAGE.md`,
  `docs/VIDEO_IMPORT.md`, `docs/DATA_REPRESENTATIONS.md`,
  `docs/design/{OPERATIONS_AND_EXECUTIONS,GOALS_AND_PLANS_ARCHITECTURE,
  RUNTIME_PERSISTENCE_ARCHITECTURE,CODEX_CURRENT_IMPLEMENTATION_INVENTORY}.md`,
  `plugins/README.md`); and the workspace `.metta` resources
  (`mailbox.system.metta`, `image_filter_skills.operation.metta`,
  `workbench_api.managed_service.metta`). Left alone (confirmed genuinely
  unrelated external service contracts): OmniRoute's key and login endpoints,
  `/api/auth/login` on :20128, OpenRouter's `https://openrouter.ai/api/v1`,
  HuggingFace's `/api/models/...`, unsloth studio's own `/api/inference/*` on
  :8888. The standalone `python/arc_cli_debugger/webui/server.py` tool now follows the same
  `/workbench/config` convention. Root `/` no longer 302-redirects the API port to the Vite
  port (`http://127.0.0.1:8000/` used to "secretly host" `:5173` via a
  redirect); it now RELAYS instead, proxying HTTP and the HMR WebSocket
  through to Vite so the API port serves byte-identical content with the
  browser never leaving `:8000`'s origin. The relay is deliberately gated:
  only the exact root, and paths matching the same `VITE_OWNED` allowlist
  `frontend/vite.config.ts`'s own `API_FALLBACK` proxy rule uses (`@vite`,
  `@id`, `@fs`, `@react-refresh`, `__vite`, `src/`, `node_modules/`, `assets/`,
  `index.html`, `favicon.ico`, or any path carrying a query string) are
  relayed; everything else 404s from the API directly. This guard exists
  because the first version relayed everything unmatched, and Vite's own
  `API_FALLBACK` proxy rule sends anything IT doesn't recognize straight back
  to the API — for a genuinely removed stale path,
  neither side recognized it, so the two catch-alls ping-ponged the request
  between `:8000` and `:5173` until it timed out. Added `GET
  /workbench/endpoints`, a full JSON listing of every registered path+method
  built from `app.openapi()` (so it stays correct without hand-walking
  `app.routes`, which changed shape under fastapi 0.141's `_IncludedRouter`
  wrapper). Added `httpx`/`websockets` to the `debugger`/`all` pyproject
  extras (previously only in `test`) since core `app.py` now imports them
  directly for the relay, not just tests. Verified: full repo pytest suite
  33 failed/865 passed both before and after (the 33 are pre-existing,
  confirmed via `git stash` A/B diff); `npm
  run build` succeeds; live-restarted API+Vite and curl-verified `GET
  /workbench/health`, `GET /plugins`, `GET /workbench/endpoints`
  (232 entries), `GET /workbench/web_proxy/admin` (plugin mirror works), `GET
  /` on both `:8000` and `:5173` return 200 with zero redirects
  (`-MaximumRedirection 0`), `@vite/client`/`src/main.tsx` relay correctly
  with `text/javascript`, and a made-up path 404s immediately instead of
  timing out.

## Next work

- [x] Refresh the navigation and workflow-runner source-contract assertions
  after the shared three-stack accordion refactor. The formatting-insensitive
  reader is scoped to those test modules so it cannot alter runtime file reads.
  Focused validation: 68 passed on 2026-08-17.
- [x] Restore a clean full-suite Windows run. Runtime-discovery tests use a
  sibling `--basetemp` so repository ancestry cannot masquerade as a discovered
  runtime root. Latest validation on 2026-08-17: 460 passed.

- [x] Visually inspect the active Vite app at
  `http://127.0.0.1:5173/?workspace=shared_library_system&view=systems`.
  Root cards now show their provider instead of `inherits undefined`.
- [x] Verify all seven shared Systems open from the hierarchy into persistent
  tabs; raw editing produces a dirty marker and split comparison opens. The
  source/save/reload path remains shared with the tested model editor lifecycle.
- [x] Verify `?view=backends` redirects to Models and does not expose vendor
  backends in Systems. Confirmed in the live app on 2026-08-17.
- [ ] Add concrete MCP or plugin system resources only when real filesystem or
  connector data exists; do not add mock catalog entries.
- [x] Retain the shared universal hierarchy/editor shell while giving Systems a
  dedicated rich configuration panel and generic resource-operation runner.
  Systems no longer enter the model/preset configurator or model-only runner.

## Runtime recovery

- [x] Install the standalone relay client under `.codex/mailbox/` for the
  stable identity `symbolic-workbench-codex`, with a workspace-specific
  README and bounded recurring-poll prompt targeting the local relay on port
  46667. The served client was repaired upstream to run outside its package.

- [x] Extract the JSONL/REST mailbox and Mattermost relay into the standalone
  sibling project `C:\snet\PeTTa\repos\mailbox_channel_relay_bridging_proxy`,
  branded **Mailbox Channel Relay Bridging Proxy**. Workbench now acts only as
  a client and external-service controller. The proxy owns loopback port 46667,
  stays healthy in mailbox-only mode, and reports optional adapter status.
- [x] Preserve `agent_mailbox.py` filesystem and `--url` compatibility while
  using transport-neutral identities and retaining the existing mailbox data.
- [x] Separate standalone proxy configuration under `config/` from durable
  mailbox data under `mailbox/`; support independent `--config-dir` and
  `--mailbox-dir` overrides without overlapping source or runtime files.
- [x] Add the client-side `--dir` JSONL override with deterministic transport
  precedence and serve the matching client from `/agent_mailbox.py`.
- [x] Expand the canonical mailbox client with named mailbox configuration,
  peek/follow, explicit cursors and acknowledgements, filtering, bounded waits,
  output formats/files, REST timeout/retries, checks, counts, and diagnostics;
  delegate the Workbench CLI entrypoint to that canonical sibling client.
- [x] Add the mailbox-backed Discord adapter with multiple listener support,
  inbound polling, outbound text/attachments, and delivery-ledger deduplication.
- [x] Add a safe public attachment gateway with configurable advertised URL;
  IRC now emits hosted links for image and other file attachments.
- [x] Add Matrix/Element and Slack mailbox adapters with multiple listeners,
  inbound polling/sync, threads, file transfer, and durable deduplication.
- [x] Add persisted channel-to-channel routes controlled either by mailbox
  relay agents or internal presence controllers, plus trusted `!relay` runtime
  administration using open mailbox identities; remove the obsolete
  `agents.json` registry entirely.
- [x] Add optional REST Bearer authentication: clients accept `--token` or
  `AGENT_MAILBOX_TOKEN`; servers enforce it only when `MAILBOX_RELAY_TOKEN` is set.
- [x] Add REST `--curl` dry-run output for every mailbox command with Bearer
  tokens redacted and no network side effects.
- [x] Package a cross-platform `AUTOMATION_PROMPT.md` explaining how users add
  a bounded, non-overlapping mailbox poller as a recurring Codex task.
- [x] Add a paste-ready `INSTALL_WITH_CODEX.md` bootstrap prompt that instructs
  another Codex to create and validate `.codex/mailbox/` in its own workspace.
- [x] Validate the standalone proxy suite (39 passed) and focused Workbench
  mailbox/service/system integration suite (18 passed) on 2026-08-13.

- [x] Pin OmniRoute's generic `PORT` and `DASHBOARD_PORT` variables to 20128
  so loading the repository `.env` cannot make its dashboard occupy the
  Workbench API port 8000.
- [x] Pin FreeRouter's inherited `CLAWROUTER_PORT` override to 18800 so it
  cannot occupy ClawRouter's port 3456.
- [x] Restrict Uvicorn live reload to application Python source changes under
  `python/workbench_api_server`, explicitly excluding generated `environment_files`,
  `runtime`, `__pycache__`, and server-test files so execution cannot restart
  the API.

The canonical development ports are:

- UI: `http://127.0.0.1:5173`
- API: `http://127.0.0.1:8000`
- Logs: `C:\snet\PeTTa\workbench-codex-session`

Process IDs are intentionally not durable. Rediscover listeners before stopping
services:

```powershell
Get-NetTCPConnection -State Listen -LocalPort 5173,8000 |
    Select-Object LocalPort,OwningProcess
```

Stop only the PIDs currently listening on those two ports and only after
confirming they belong to this checkout's Vite and Uvicorn commands.

## Historical checkout inventory - no cleanup authorized

The damaged historical checkout may still exist physically at
`C:\symbolic_learner_arc3_codex`, with a temporary alias at
`C:\snet\PeTTa\repos\symbolic_learner_workbench_broken`. A detached temporary
worktree may also remain at
`C:\snet\PeTTa\repos\symbolic_learner_workbench_systems`.

Do not use these historical paths for new work, or delete or move them as part
of this ledger cleanup. Any future explicitly authorized directory cleanup must
first account for open processes and worktree registrations in the user's
current checkout:

```powershell
git -C C:\snet\PeTTa\repos\symbolic_ml_workbench worktree list
```

Preserve the user's canonical checkout and its `main` branch.

## Generic insertable inspection gallery checkpoint

- The corrected direct ARC3 chooser path now binds its selected `$game` into
  both downstream observation playgrounds. Live verification selected `s5i5`
  without running either optional gallery probe and visibly populated the next
  Operation's `game` input. Evidence: `artifacts/arc3_chooser_downstream_binding_verified.png`.
- Focused ARC3 tests: 10 passed. Frontend production build and `git diff
  --check` passed on 2026-08-12.

- Added shared `gallery.curate_resource` and `collection.random_list_element`
  filesystem Operations backed by `workspaces/shared_library_system/collection_operations.py`.
- The workflow editor can insert any abstract Operation after the selected step;
  the inserted node is immediately available through the normal playground path.
- Gallery invocation results render human-inspectable cards while preserving the
  identical structured artifact for downstream AI/Operations.
- ARC3's `arc3_random.build_game_preview_gallery` is only an intentionally costly
  demonstration. See `workspaces/arc3_random_player/docs/GAME_PREVIEW_GALLERY_BAD_EXAMPLE.md`.
- Focused ARC/gallery tests: 9 passed. Frontend production build and live browser
  insertion check passed. Changes remain uncommitted.
- Douglas clarified that Operations should be presented as durable delayed
  Codex/agent task specifications. The Operation Playground now makes this
  lifecycle explicit (`defined`, `running`, `completed`, or `failed`) while
  retaining inputs, outputs, implementations, and invocation evidence.
- The implementation ladder explicitly includes capable agents/LLMs,
  progressively smaller models, ILP/program-synthesis systems that derive and
  write code from specifications plus evidence, and the resulting deterministic
  implementations. Non-model execution is not assumed to be manually authored.
- Fixed filesystem Python Operation loading so an entrypoint can import sibling
  modules from its own source directory. This repairs the live ARC3 discovery
  failure (`No module named 'collection_operations'`) shown in Mattermost.
- Correction after superseded ordering guidance: discovery now fans out. The
  chooser depends directly on discovery and consumes `$games`; preview and
  Gallery Curation are disabled-by-default non-blocking probe steps. The engine
  persists optional disabled probes as `skipped`, while `required true` remains
  available to specialized workflows that intentionally turn a probe into a
  gate.
- ARC3 workflow refinement: `arc3_random.select_game` is again the semantic
  workflow step. Its preferred `Select Random` child delegates to the shared
  `collection.random_list_element` behavior, so selection itself is not defined
  as intrinsically random and can still be replaced by another implementation.
- After selection, the workflow now queries real workspace MeTTa sources,
  persists the selected game's default runtime AtomSpace, starts the game,
  enumerates its live controls, and only then enters capture/propose/execute.
  Live runners stay in a process-local session registry while workflow state
  carries a JSON-compatible handle. Focused ARC3 tests: 12 passed.
- Workspace visibility correction: `arc3_random_player` now includes the
  `arc3` workspace, labeled **ARC3 Shared Library**, with inherited resources.
  Because `arc3` includes `shared`,
  the effective layer order is `shared -> arc3 -> arc3_random_player`; the
  Random Player designer can therefore resolve and display the reusable shared
  resources plus ARC3's prompt-backed symbolic-analysis Operations and Prompts.
- Workflows and Workflow Runs are now one navigation destination. The separate
  Runtime rail entry was removed; Canvas, Editor, and Workflow runs are sibling
  tabs under Workflows, and existing `?view=workflowRuns` deep links continue to
  open the combined page's run-history tab. Focused navigation regression tests
  and the frontend production build pass.
- Workflow Canvas and Workflow Editor now share that same Workflows destination
  instead of appearing as separate top-level tabs. The canvas is the default;
  its resource-browser editor control opens the structural/source editor while
  keeping Workflows selected. Individual Operation resources retain their rich
  OperationLibraryEditor view from workflow resource links.
- The combined Workflow Editor keeps its workflow/Operation resource tree at
  the left while retaining filesystem documentation at the right. The wide
  artifact-editor layout no longer makes the workflow tree disappear.
- Every Operation playground now has an explicit **Edit Operation** link to the
  exact resource in the full rich editor, restoring discoverable access to
  alternatives/defaults, persistent tabs, split comparison, raw source, save,
  and execution techniques from within workflows.
- Every workflow step now presents **Run Workflow Step** and **Edit Workflow
  Step** panes. The edit pane changes that step's dependencies, bindings,
  outputs, parameters, probe settings, and implementation choice in the parent
  Workflow. Editing the underlying Operation remains a separate action.
- Context leak fixed: workflow runner controls are hidden outside Workflow
  Editor/Workflow Runs, and the standalone Operations page labels its action
  **Run Operation** instead of attempting a stale selected Workflow Step.
- Fixed the missing Workflow Step panes shown for `arc3_random.discover_games`:
  the reusable `arc3_random.*` Operation family now lives in
  `shared_library_arc3`, which the Random Player workspace actually includes.
  Its workflow references can therefore resolve to abstract Operations and
  Python implementations.
- Workflow Editor now begins with a full Workflow Runner setup surface rather
  than relying on launch buttons alone: workflow selection, readiness and
  resource-resolution diagnostics, editable JSON inputs, mode, move/time/game
  limits, seed, selected-step implementation context, validation, save, single
  step launch, durable workflow launch, and automatic all-games launch.
- Each **Edit Workflow Step** pane now uses the shared synchronized MeTTa/JSON
  source editor. Applying either representation updates the same selected step
  in the parent Workflow; the underlying Operation remains a separate resource.
- Workflow Editor and Workflow Runs stay mounted as adjacent center panes. The
  existing first two tab buttons act as focus controls, assigning roughly
  two-thirds width to the selected pane while leaving the other visible. Legacy
  `view=workflowRuns` links redirect into the combined view with Runs focused;
  the left resource tree and right documentation inspector remain visible.
- The full **Configure and launch a durable run** surface spans above both
  center panes. Their divider is a keyboard-accessible vertical separator that
  can be dragged between 20% and 80%; the two tab buttons remain 2/3-width
  presets. Live geometry verification confirmed the runner clears both panes
  and spans the available center width.
- Workflow steps now accept concise same-name output lists: JSON
  `"outputs": ["played_games"]` is normalized by the durable engine to the
  runtime binding `{ "played_games": "played_games" }`. The ARC3 outer loop's
  initial step uses the real shared `echo.value` operation to publish its empty
  played-games list without a bespoke initializer.
- The Workflow Runs **Filter Records** surface now includes live All, Running,
  Failed, and Cancelled counters directly beneath the runner/splitter area.
  Running includes durable waiting and paused runs; text filtering composes with
  the selected status instead of replacing persisted history.
- Workflow Runs now uses a selected-run workspace: a full-width Spline band
  occupies the top 20%, while a dense selectable run list and the primary
  Detected Objects/evidence pane share the lower 80% at 25/75 width. The latest
  active run is selected by default, selection remains highlighted, and the
  Topology/Chronology toggle changes only that run's visualization. Spline,
  Runs, and Objects each expose hover frame controls for minimize, maximize,
  and restore.
- The shell now exposes persistent mouse-resizable Resource Browser and
  Documentation dividers with saved widths and double-click restore defaults.
  Detected Objects supports list and tile views; it owns the primary left run
  workspace while the independently scrolling run selector occupies the right.
  The selected-run spline is bottom-anchored and minimizes downward. Workflow
  Editor and Workflow Runs tabs remain repeatable two-thirds layout presets.
- Workflow panel titles now toggle minimize/default directly for the runner,
  focal task editor, run history, selected-run spline, and detected objects.
  Minimized hover frames become explicit Restore controls, offset below titles.
  Resource Browser and Documentation titles follow the same toggle convention.
- The duplicate global Automated Runner strip is hidden. A composable,
  right-anchored title-bar stack now separates permanent global actions
  (Restart App, Switch Workspace, Reset layouts, Theme) from view-contributed
  restore actions; additions grow leftward. The focal stage count follows the
  selected durable run, with the loaded frozen workflow providing its stages.
- Navigation now writes semantic, shareable `view` URLs. Workflows uses
  `?workspace=<id>&view=workflows`; direct links restore the Workflow Editor,
  while legacy `view=canvas`, `view=editor`, and `menu=Workflows` links remain
  readable for compatibility.
- The right-hand runtime workspace now places a real single-run state inspector
  immediately above Detected Objects. STEP STATES, CHAPTER STATES (ARC3 game
  levels), GAME STATES, and ALL STATES never mix runs; workflow startup inputs
  are surfaced as STARTUP STATES. Each value has a JSON-compatible two-row
  property editor for enabled/always-ignore state, semantic datatype,
  STARTUP/STEPS/CHAPTER/GAME/ALWAYS/POST-MORTEM applicability, Preferred
  Renderer, and Treat As List. Guess, Image, MeTTa,
  JSON, and compact-text renderers remain available. The States navigation item
  deep-links to this inspector inside the combined Workflow view. Detected
  Objects remains the complete global pre-fill with stable artifact/provenance
  identity for future credit assignment.
- Workflow Runner performs a preflight enumeration of provisional
  `state_value` definitions from startup inputs and declared step outputs.
  The bootstrap infers stable IDs, source bindings, datatype/list hints,
  applicability, renderer, and source-aware `allowRedefinition` defaults;
  users can override enabled state, datatype, renderer, list handling, and
  redefinition before launch. The effective JSON configuration is persisted in
  the durable `workflow.started` event, while runtime steps remain responsible
  for attaching actual values and producer provenance. The same effective
  definitions immediately populate Detected Memory Values before launch; after
  launch that control prefers the frozen configuration from the selected run.
- Docs is now a repository-wide filesystem explorer backed by the existing
  filesystem provider. It starts with a `.md` path filter, can browse all
  approved text/source files, and presents a separate unexposed-path inventory
  with exclusion reasons. Secret candidates and unsupported file types are
  classified server-side, their contents never enter the index response, and
  the direct file endpoint enforces the same deny policy.
  The collapsible filesystem tree remains visible as the permanent left-side
  navigator, honoring the exposed/unexposed selection and path filter while
  documents open independently in the right pane.
  The navigator switches between a collapsible **Tree** and a flat
  **Navigator** result list; both modes share the exposure tabs and filter.
  The four-panel tab frame contains Exposed Full Path, Exposed Navigator,
  Exposed Tree, and Unexposed Full Path. Full-path panels preserve each
  complete repository-relative path on one row.
  Navigator mode behaves as a directory browser with breadcrumbs, folders,
  parent navigation, current-directory file rows, sizes, and filtered results.
  Every exposed text/source document now has a filesystem-backed editor with
  save support. Markdown retains rendered preview/source switching; JSON and
  notebooks are validated server-side before writing. The same path/exposure
  policy guards reads and writes; finer edit policy is a later layer.
  The source editor now uses CodeMirror with syntax modes for JSON, Markdown,
  JavaScript/TypeScript, Python, CSS, and HTML. Exposed PNG, JPEG, GIF, WebP,
  and SVG assets render through a separately policy-checked repository route.
  Every open file has reveal actions for Tree, Navigator, and Full Paths. They
  switch panels, clear conflicting filters, expand/navigate to the parent,
  highlight the file, and scroll it into view.
  Repository filters accept pipe-separated alternatives; for example,
  `.md|.txt` displays paths matching either suffix.
  Full-path lists have reversible sorting, in UI order, by File Name, File
  Size, Directory Name (full directory path), Parent Name (immediate directory),
  and Parent Bytes (matching total size in that directory).
  Path Depth is also available, counting repository-relative path segments.
  Independent Hide/Show `.dotdirs` and `.dotfiles` toggles compose with all
  filters, panels, and sorts.
  Both dot-path toggles default to hidden. The default include expression is
  `.md|.metta|.json`, and a separate pipe-aware exclusion line defaults to
  `runtime/|venv/`.
- The Processes page now renders service process matches as a collapsed
  service-to-PID disclosure tree. Each PID expands independently to show its
  working directory, command line, and unchanged relaunch/kill controls.
  Process discovery includes OS parent PID and parent process name; both appear
  in each collapsed PID row and its expanded details.
  Per-PID Stop and Relaunch no longer pass Windows `taskkill /T`; they target
  only the selected PID and explicitly state that parents and children are
  preserved. Whole-service Stop/Restart remains the deliberate tree operation.
  Process relationships are now an always-expanded visual hierarchy, not a
  disclosure control. Matching parent PIDs recursively own child rows, while
  parents outside the service match appear as explicit external root nodes.
  External roots no longer display an implementation-oriented “outside match”
  message. Their API records include redacted command line and working
  directory in addition to name and PID for full parent context.
  Parent restart evidence is merged directly into the original parent nodes:
  redacted command, working directory, and ready/missing status appear within
  the relationship tree rather than in a separate panel. The UI intentionally
  does not launch an arbitrary parent yet.
  Process-tree names, directories, and redacted commands wrap without ellipsis
  or clipping. Security-sensitive values remain redacted, but visible metadata
  is not truncated.
  Parent evidence uses the available horizontal space: identity, PID, working
  directory, redacted command, and readiness flow left-to-right, with a
  responsive stacked fallback only at narrower widths.
- System Settings now manages workbench-wide credentials through the protected
  `shared_library_system` credential store. Workspace-local credential rows
  explicitly say when System Credentials or the process environment already
  supplies a key, making the workspace override clearly optional.
  Backend metadata may declare `apiKeyOptional`, `api_key_optional`, or
  `credentialRequired: false`. Credential rows label OPTIONAL versus REQUIRED;
  a missing optional key explicitly says the backend may run without it.
- The global title bar now contains a visited-page breadcrumb trail immediately
  to the right of the brand. It grows rightward without truncating labels,
  scrolls horizontally when necessary, and clicking an earlier page returns
  there while trimming the later trail.
  Docs initially opens on Exposed Full Path with the default `.md` filter.
- [x] Preserve breadcrumb forward history when returning to an earlier visited page; discard it only after navigating somewhere new.
- [x] Record meaningful within-page states in the title-bar breadcrumb, including Docs panels, directories, and opened files, while excluding transient filters and sorting.
- [x] Reserve the left-middle workflow column as empty and stack the Workflow Editor and Workflow Runs surfaces together in the right-middle column.
- [x] Make Workflow Runner reflow against its actual parent width and height; remove the stage-wide JavaScript width override.
- [x] Rebuild the Workflow Runner presentation as a parent-sized vertical stack with full-width controls, stacked state records, and responsive actions.
- [x] Keep legacy workflow controls available under Workflow Editor while mounting isolated replacement launch and runs controls under Workflow Runs; hard-contain replacements inside the right column.
- [x] Roll the active Workflows UI back to the original Detected Memory Values composition while preserving all non-Workflow pages; keep replacement experiments disabled.
- [x] Add a separately namespaced DurableRunLauncher above Workflow Runs with a fixed header/footer, scrollable field body, container-responsive controls, and real workflow actions.
- [x] Delete the active legacy Workflow Runner markup and controller hooks; portal the isolated DurableRunLauncher into the left workflow column while Workflow Runs remains on the right.
- [x] Make the selected `STAGE n OF total` surface use the shared strip/scroll/full accordion contract for every selected workflow step and participate in the global left-column controls.
- [x] Recompose Workflows (Legacy) into independent accordion stacks: one Resource Browser contents accordion; Workflow Runner, Selected Stage, and per-step members in the left column; Workflow Runs plus Startup/Step/Chapter/Game/All state members and nested Detected Objects in the right column; and Left/Right Columns, Selected Run Spline, and Runner Design Reference in the outer stack. Remove the obsolete global All Panels and Workflow Steps controls so collapsing a workflow member cannot resize the Resource Browser.
- [x] Keep the selected strip/scroll/full button visibly highlighted on every three-state accordion control after its mode changes.
- [x] Establish a shared accordion-stack host and extensible strip contract. Right-column values/objects explicitly mount into the same registered stack as Workflow Runs, while the special Left Column / Right Column strip uses the shared accessory slot for its STACK, LEFT, and RIGHT control frames.
- [x] Make the shared accordion-member API own all four visual regions: a persistent strip/banner; a non-minimized item header; a mode-sized list/body that scrolls only in `*` mode and expands in `+` mode; and a non-minimized status/summary footer. Migrate Detected Objects to that API instead of hand-drawing peer chrome.
- [x] Make accordion frames own their item canvases and reflow. The shared API now supplies the constrained `*` height through `--accordion-scroll-size`, clips arbitrary item rendering to the body canvas, and owns body scrolling; `+` releases the constraint. Repair stack-aware parent-grid selectors so a 38px collapsed Workflow Runs strip immediately pulls the following value member upward, and keep the right-column value stack as the scrolling owner for all accordion canvases.
- [x] Move the Detected Objects configuration into the shared accordion member's four-region canvas and remove the orphan Separate View controls. Its strip remains visible in every mode, while minimizing hides its header, configuration/body, and footer and reduces the complete member to 38px so the stack reflows.
- [x] Make Workflow Runs, every Values scope, and Detected Objects literal peers: all seven are now immediate children of the same right-column accordion stack, with no intermediate memory-workspace or scope-stack wrappers drawing separate chrome.
- [x] Standardize the left workflow column on the same shared member renderer as the right. Workflow Runner, Selected Stage, and all 18 Workflow Steps now receive identical persistent strips, mode-owned canvases, borders, adjacency, and stack scrolling from the left-column accordion.
- [x] Register all three spline-stack peers with the shared four-region accordion renderer. LEFT COLUMN / RIGHT COLUMN owns its stack sizing buttons in the persistent strip and its independent LEFT/RIGHT controls in the item-header banner; Selected Run Spline owns Topology/Chronology in its item-header banner; Runner Design Reference receives the same persistent strip and per-item sizing controls.
- [x] Give every shared accordion member one continuous outer frame with a purple persistent strip and a darker attached item-header banner. Keep member-specific controls—such as independent LEFT/RIGHT sizing and Spline Topology/Chronology—inside that banner above the mode-controlled body.
- [x] Treat the complete left and right column stacks as the LEFT COLUMN / RIGHT COLUMN member body. Its shared status footer spans both columns after their content and before the next Spline member; the right stack no longer overlaps that footer row.
- [x] Make accordion strips vertically reorderable. While dragging, siblings temporarily render as a compact strip list; dropping moves the member one row, persists the order, and restores every saved strip/scroll/full frame. Runner Design Reference and Selected Run Spline derive their visible grid rows from this shared order rather than fixed legacy rows.
- [x] Infer capture-loop groups preflight from repeated workflow output bindings, assign value definitions by producer step, persist the plan with the run, group runtime artifacts by iteration, and show loopbacks in the preflight spline.
# Current workflow-control checkpoint

- The workflow preflight spline is a real accordion member above the LEFT/RIGHT controls and renders dependency branches, inferred repeated-output capture groups, and explicit bounded FOR/WHILE control arcs.
- `arc3_random_player.outer_loop` now describes the existing automatic session operation as two nested bounded loops: while unplayed games remain, and while elapsed game time is below the configured seconds-per-game limit. The existing `arc3_random.run_session` implementation remains the executable owner of those loops.
- Repository Docs can summarize the current exposed/filtered file list with a selected effective workspace model and configurable first-N-lines excerpts, persist the result under `docs/generated/`, and open the Markdown immediately in the right pane. Unexposed paths are rejected server-side.
- [x] Keep SingularityNET as an enabled shared LLM backend and add a real
  `snet-asi1` model child from its live `/v1/models` catalog, so effective
  workspace model selectors can use SingularityNET rather than showing an
  enabled backend with zero selectable models.
- [x] Identify ASI:One, ASI Cloud, and SingularityNET backend resources by
  normalized base API endpoints: `https.api.asi1.ai.v1`,
  `https.inference.asicloud.cudos.org.v1`, and
  `https.llm.c.singularitynet.io.v1`; preserve provider names separately.
- [x] Add backend aliases and alias-aware resolution so legacy IDs, provider
  names, hyphenated names, and literal base URLs resolve to the canonical
  endpoint-derived backend IDs without breaking existing model parents or API
  discovery routes.
- [x] Verify authenticated model discovery for ASI:One, ASI Cloud, and
  SingularityNET: each `<baseUrl>/models` request resolves its declared
  workspace/system/environment credential and sends it as a Bearer token.
- [x] Add `run_workbench.bat /kill [web_port] [api_port]` to stop the three
  router gateways plus the workbench API and Vite process trees. Shutdown is
  scoped by listener port and verified command evidence; it never broadly
  kills every Python or Node process.
- [x] Route the sibling Mailbox Channel Relay through `run_workbench` when its
  System Settings startup policy is enabled. Record every process actually
  launched by `start_with_policy.py` in an ownership ledger, and make `/kill`
  stop only those recorded process trees—including the relay—while leaving
  independently started services untouched.
- [x] Enforce the managed-launch invariant for all six long-running services:
  each final batch command is passed as a raw argument vector through the
  Python launcher. The ownership ledger records its root PID, working
  directory, raw command, and process-tree termination scope; child Node,
  Python, npm, and cmd processes remain descendants of that owned root.
- [x] Add the loopback-only managed-command submission API and batch client.
  `run_clawrouter.bat` now expands its port and submits the final `npx.cmd`
  argument vector to the Workbench API, which validates, launches, and records
  it. If the API is unavailable, the client emits a prominent warning and
  executes the same command in legacy mode.
- [x] Move every non-bootstrap daemon to that same API submission boundary:
  OmniRoute, FreeRouter, Vite, and Mailbox Relay batch wrappers now submit
  their fully expanded final commands. The API server explicitly reports its
  unavoidable bootstrap legacy mode; foreground dependency checks and
  installers remain untracked one-shot setup commands.
- [x] Enable Mailbox Channel Relay automatic startup by default and in the
  shared startup policy. `run_workbench` still checks port 46667 health first,
  so it starts the relay only when it is not already running.
- [x] Add delayed API-startup reconciliation for enabled managed daemons.
  After an API restart it restores missing Mailbox Relay/router services,
  skips disabled services, leaves healthy external listeners unclaimed, and
  excludes the bootstrapping API and port-ambiguous Vite process. Results are
  persisted to `runtime/logs/startup-reconciliation.json`.
- [x] Fix Windows raw-command parsing by placing an explicit `--` boundary
  before every `%ComSpec% /d /c ...` child command and stripping that marker
  inside `start_with_policy.py` before launch.
- [x] Fix the Windows trailing-backslash quoting failure in `run_demo.bat`:
  pass the workbench directory as `%ROOT%.` so quoted `--cwd` values cannot
  escape their closing quote and swallow the raw child command.
- [x] Make managed launches concurrency-safe: serialize API launch admission,
  deduplicate per-service requests while a listener is still starting, and use
  unique atomic ledger temp files so API reconciliation and `run_workbench`
  cannot collide or start duplicate daemons.
- [x] Preserve required batch-local environment across API-owned launches with
  strict per-service allowlists (OmniRoute ports, Vite host/port/API target,
  FreeRouter port isolation, and Mailbox Relay `PYTHONPATH`).
- [x] Replace blind daemon health sleeps with ownership-aware waits that fail
  immediately when the API-owned process exits before opening its health port.
- [x] Add the `generate_count_to_ten` project workspace as a minimal
  English-to-workflow acceptance fixture. It inherits Shared, contains an
  authoritative English prompt and documentation, and exposes an intentionally
  empty workflow target wired to `workflow.populate_from_english` for preflight
  generation.
- [x] Stack a real-data `WORKFLOW ACTIONS` accordion above Preflight Spline and
  LEFT/RIGHT on the active Workflow page. It enumerates effective authoring
  Operations, prioritizes Generate from English, and exposes memory planning,
  preflight, and run controls without mixing them into Add Step.
# Workflow description authoring (2026-08-16)

- `workflow.populate_from_english` is the semantic authoring boundary; description editing is an implied phase rather than a separate Operation.
- ENGLISH → WORKFLOW defaults to the top of the draggable spline accordion stack.
- Its UI is a nested accordion stack: English editor, model/format, memory/value plan, draft generation, validation, and apply.
- Memory/value inference now exposes a nested evidence accordion per value with origin, source binding, datatype, and current/default value; it explicitly distinguishes runtime inference from future English-description proposals.
- English-to-workflow prompts require complete operation prototypes and exactly one complete workflow resource in the selected format.
- Generate Draft embeds the canonical rich `OperationPlayground`, prepopulated with the English specification, complete effective operation catalog, workflow schema, memory/value plan, existing workflow, validation errors, and selected output format.
- Removed the redundant Model/Output accordion because those choices belong to the rich runner; system-injected `workspace_root` is no longer misclassified as an inferred workflow memory/value.
- Flattened authoring phases into the main draggable spline stack above the rich runner. Relocated Runner Design Reference out of the overlaid runtime grid into normal main-stack flow so mockups cannot float across runner inputs.
- [x] Add the real `English Workflow` route as three native `ThreeStateAccordionStack` columns: an editable filesystem English specification, a model-resolved generation surface, and a generated-contract stack. No contract fields are shown as inferred before Analyze runs.
- [x] Make Generation Contract analysis a filesystem-backed `workflow.analyze_generation_contract` LLM Operation. One response produces summary, memory candidates, acceptance checklist, output requirements, validation rules, and a candidate Workflow in a user-controlled order.
- [x] Replace decorative generation progress with `GENERATION ORDER`, an append-only in-page audit list of the actual button-press order and the concrete outputs created by each press.
- [x] Add contract-order trials with a recorded requested/returned order, selected model, heuristic coverage score, generated Workflow step count, and backend validation issue count. Live SNET asi1 verification with Workflow first produced 12 steps, 12 acceptance checks, 2 memory candidates, and 5 validation issues (80/100).
- [x] Make Generation Order a true composer. Clicking an output title appends an occurrence; the first occurrence defaults to New and repeated occurrences default to Reuse old. Every occurrence independently supports New, Reuse old, Preserve, or Hide, repeated output names remain in the submitted order, and the remove control is positioned between the cyclic left/right controls.
- [x] Make Analyze execute the exact composed `generation_steps` sequence in one LLM call and persist the requested steps, returned order, generated contract, candidate Workflow, validation result, model, and score to the workspace filesystem. The saved sequence is restored when the English Workflow page reloads.
- [x] Composer validation on 2026-08-16: 5 focused English Workflow tests passed, the frontend production build passed, and live browser verification confirmed an empty initial order, first Summary occurrence = New, repeated Summary occurrence = Reuse old, visible `← × →` controls, and no console errors.
- [x] Add `[group]` as a first-class highlighted Generation Order container. Creating or clicking a group selects it as the insertion target; output `+` buttons then add nested steps into that group, clicking it again returns insertion to the top level, and Analyze submits the nested steps as one simultaneous batch. Groups and their children retain per-occurrence modes, repeats, cyclic movement, removal, audit order, and persistence.
- [x] Group-container validation on 2026-08-16: focused English Workflow tests (5) and the frontend production build passed; live browser checks confirmed Summary and Memory inserted as nested `1.1`/`1.2` entries while highlighted, Workflow returned to top-level `2` after unhighlighting, and no console errors were emitted.
- [x] Make Generation Contract section arrows cyclic one-position rotations: left from the first position wraps to the end, and right from the last position wraps to the beginning.
- [x] Prevent experimental contract candidates from enabling Apply. Only the authoritative Generate Draft path can enable filesystem Apply after backend validation passes.
- [x] Make `workspace=` plus `view=` authoritative deep links. Initial loads,
  browser history, and in-app location changes now switch away from an already
  selected workspace when the URL names a different one; Switch Workspace
  clears the old workspace and runtime selection parameters instead of
  immediately reopening it.
- [x] Add durable State deep links with the canonical `state=<uuid>` query
  parameter. The States destination uses the real state-artifact history,
  resolves an older state UUID to its owning run through the engine API, and
  selects that exact record without replacing it with `runtimeRecord=`.
- [x] Drive English Workflow Generation Contract buttons from effective Prompt
  resources instead of a hard-coded React list. Applicable prompts now declare
  their button name, produced section, and sortable classification in MeTTa;
  the selected Prompt ID is persisted with each generated-order occurrence.
- [x] Make English Workflow contract-section controls filesystem-driven. The
  UI now discovers effective Prompt resources whose `applicability` includes
  `english_to_workbench.contract_section`, uses each resource's `buttonName`
  and exact Prompt ID when inserting a generation step, and orders the
  controls by durable `classificationId` with deterministic name fallbacks.
  All 21 shared section Prompts declare their applicability, button name,
  classification, and produced contract field. Live verification confirmed
  the classified order and that `+ summary` selects the Summary Prompt.

# Phase 2 semantic-memory records (2026-08-17)

- [x] Freeze versioned `Observation`, `EncounterRecord`, `RecognitionAccount`,
  artifact/provenance, instance-parameter, evidence, identity-decision, and
  per-object Turtle-reference contracts in the existing object-memory package.
- [x] Give observations, encounters, artifacts, evidence, match proposals,
  recognition accounts, merge decisions, and split decisions deterministic,
  order-stable construction paths while leaving durable object identity under
  `object_registry.pl` governance.
- [x] Add focused tests for Phase 1 node linkage, artifact/provenance layering,
  Turtle references, positive/negative evidence, rivals, reversible identity
  decisions, immutability, schema versions, and deterministic identifiers.
- [x] Add an append-only semantic `EncounterLog` with Phase 1 node-linked
  records, required prior-history ordering, idempotent replay, conflict
  rejection, per-object history lookup, and deterministic log hashing.
- [x] Wrap the established deterministic `analyze_grid` implementation behind
  `GridAdapter`. Preserve the exact source-grid hash, artifact URI, dimensions,
  coordinate contract, action-tree node, extractor provenance, candidate IDs,
  regions, and Turtle details while keeping provider intermediates outside the
  persistent observation record.
- [x] Add the backend-neutral `SymbolicStore`/`SemanticStoreBackend` boundary
  with exact write-once identity, conflict rejection, idempotent composition,
  semantic encounter history, and automatic artifact/Turtle indexing. Provide
  a deterministic in-memory backend for tests while leaving the durable
  backend slot open for Prolog or AtomSpace.
- [x] Connect `GenerativeForm` to the canonical Turtle DSL through the existing
  `SWIPrologBridge`. Correct extracted programs to stamp their initial cell,
  declare pen width, and preserve one-cell/disconnected objects; calculate
  regenerated-cell fit, distance, residual, and description length. Live
  SWI-Prolog 10.1.7 validation passed alongside the canonical DSL tests.
- [x] Generate supported thick rectangular objects as a single rotated Turtle
  movement with canonical `pen_width(1..4)`, not adjacent row enumeration. An
  exact-regeneration regression test requires one `set_pos`, explicit rotation,
  pen width, and equality with the source cells.
- [x] Add `SingleWriter.apply_evidence` as the calibrated path for object
  confidence. It validates evidence subjects, deduplicates deterministic IDs,
  preserves source provenance, accumulates positive and negative weights, and
  derives the same confidence and attribution regardless of arrival order.
- [x] Add explicit, idempotent `SingleWriter` merge/split application with
  same-type validation, decision/evidence provenance, active/demoted/tombstoned
  lifecycle states, prior-state snapshots, and reversible false-merge and
  false-split behavior. Keep generated Phase 1 `object_registry.pl` files as
  the eventual synchronization target rather than creating a second registry.
- [x] Add generic action-tree semantic-record linkage. Each node can maintain
  a deterministic, conflict-checked `semantic_records.json` manifest and
  GitHub-browsable README links while keeping Phase 2/3 payloads external to
  Phase 1 `state.json` and `Arc3Runner`.
- [x] Add an optional external post-capture observer seam to `Arc3Runner`.
  Observers receive current/previous nodes and action context after durable
  Phase 1 capture; failures are isolated so semantic services cannot interrupt
  gameplay or suppress other observers.
- [x] Implement `SemanticGridCaptureObserver` on the external seam. It writes
  deterministic Observation and Encounter JSON records, SHA-256-addressed
  per-candidate Turtle artifacts, previous-encounter chains, semantic-store
  entries, action-tree manifests, and README links while retaining candidate
  status until registry-backed recognition commits durable identity.
- [x] Enrich the established grid extractor with normalized geometry/topology:
  exact bounds and boundary cells, enclosed hole regions, connected-component
  count, line thickness, and pairwise spatial relations. Cover hollow,
  irregular, thick, and disconnected fixtures without changing the adapter
  boundary.
- [x] Add deterministic `InstanceMatcher` correspondence proposals. Explain
  matched and changed fields, identify declared transformations, retain every
  rival in stable advisory order, and create recognition accounts without
  allowing even perfect similarity to commit identity or confidence.
- [x] Add deterministic `ObjectChange` records and `ChangeDetector` handling
  explicit correspondences. Cover movement, recolor, resize, orientation,
  reshape, appearance/disappearance, one-to-many split, and many-to-one merge
  without treating advisory proposals as authoritative correspondence.
- [x] Extend generated `object_registry.pl` files through a managed,
  append-only `semantic_identity_decisions.pl` sidecar retained across manual
  and GPT registry rewrites. Only friendly registry IDs are accepted; SWI-Prolog
  loading and accepted/reversed history queries are verified.
- [x] Add `RegistryCorrespondenceAuthority`: explicit registry selection and
  attributable evidence are mandatory even for a perfect match; acceptance
  calibrates through `SingleWriter`, preserves rivals and property explanations,
  emits a recognition account, and records encounter/decision/evidence history.
- [x] Turn encounter history into durable unresolved recognition work. Select
  the latest known instance per identity, persist every competing proposal,
  and persist an unresolved account without authorizing identity by similarity.
- [x] Invoke unresolved recognition from live semantic grid capture whenever
  known identity history is present, persist proposal/account artifacts beside
  the state, and link them through the action-tree semantic manifest.
- [x] Build deterministic signed evidence from correspondence explanations.
  Exact properties and allowed transformations support identity; unexplained
  changes contradict it, while aggregate similarity remains advisory only.
- [x] Represent Turtle reconstruction fit as signed identity evidence. Preserve
  the artifact, fit parameters, and measured residual; exact regeneration
  supports identity while a nonzero residual contradicts it.
- [x] Invoke Turtle reconstruction during every semantic grid capture through
  the real SWI-Prolog Turtle DSL. Persist fit score, distance, residual, and
  description length on each Turtle reference; emit separately attributable
  reconstruction evidence into the encounter, semantic store, action-tree
  manifest, and deterministic replay. Renderer failures remain infrastructure
  warnings and never become fabricated negative identity evidence.
- [x] Expose explicit live registry authorization controls. Semantic observers
  enumerate only pending proposal identities present in the friendly Prolog
  registry; `Arc3Runner` forwards accept/reject selections without exposing
  observer internals. Acceptance requires proposal-linked evidence and the
  `SingleWriter`, while rejection records append-only history without changing
  confidence. Both persist a resolved account beside the originating node.
- [x] Enable semantic capture in the canonical interactive and Prolog-controlled
  ARC3 runners. A shared composition factory binds the established grid
  extractor, runner grid accessor, SWI-backed observer, semantic store, and
  single identity writer; both entry points provide an explicit
  `--no-semantic-capture` opt-out instead of silently omitting object memory.
- [x] Add complete deterministic semantic-store snapshots and replay. Restore
  all exact record namespaces in dependency order, rebuild encounter/artifact
  indexes, reject unknown namespaces, and make repeated replay idempotent.
- [x] Expose live recognition evidence through Phase 1 inspection. Persist and
  link evidence beside proposals/accounts, then summarize candidates, selected
  identity, advisory similarity, polarity, confidence, decision source, and
  rivals in each action-tree node README.
- [x] Replay semantic state directly from Phase 1 action-tree manifests. Decode
  exact nested records, deduplicate repeated links, restore encounter chains in
  predecessor order, and reject missing or cyclic history rather than silently
  producing a partial store.
- [x] Make each named English Workflow Generation Order title a quick-call
  control. Section titles now run only their existing configured generation
  step; `[group]` runs only its nested batch, while the Prompt-discovered `+`
  controls remain the sole way to append another occurrence.
- [x] Add a durable SWI-Prolog `SemanticStoreBackend`. Persist exact typed
  records as inspectable `semantic_record/3` facts, atomically rewrite the
  store, round-trip nested/unicode payloads, hydrate facade indexes after a
  restart, and verify the generated store with live SWI-Prolog.
- [x] Make durable identity commits duplicate-safe and preserve typed confidence
  history. Repeat compatible commits return the calibrated object, conflicting
  payloads fail, and evidence/lifecycle transitions survive snapshots and
  Prolog reloads through merge, split, demotion, tombstoning, and reversal.
- [x] Model degraded recognition explicitly. Add reflection, visibility, and
  noise instance parameters; explain declared degradation with signed evidence;
  and retain the best complete stored form when a later encounter is partial or
  noisier while still updating its position and supported transformations.
- [x] Connect live parent/current captures to semantic change history. Match
  stable candidates across consecutive observations, persist correspondence
  proposals and evidence-linked `ObjectChange` records, link readable summaries
  into the action tree, and retain them through disk and Prolog replay.
- [x] Separate explained transformations from potentially new structure.
  Preserve unexplained property changes as deterministic provisional residuals,
  persist and inspect them in live action trees, and round-trip them through
  semantic snapshots and the SWI-Prolog backend.
- [x] Track structured residual recurrence without auto-committing identity.
  Emit a distinct occurrence record each time, remain provisional initially,
  and advance repeated unexplained structure to `commit_request` only through
  the deterministic `ResidualGate`.
- [x] Preserve and recognize normalized grid topology. Carry normalized boundary
  cells, holes, component count, and thickness into semantic instances; prove
  translated topology with signed evidence; and regression-test exact hollow
  object regeneration through live SWI-Prolog without filling its hole.
- [x] Add the filesystem-backed `Visual Image Diff` page as three native
  `ThreeStateAccordionStack` columns. Persist the corrected ACTION3 then
  ACTION1 image sequence as workspace assets and a sequence manifest;
  split the former monolithic ARC3 analysis prompt into classified Prompt
  resources; and initialize the composer from one ordered Prompt Profile group
  while retaining inline `+ step`, removal, and reordering controls.
  The center stack's single `GENERATE VISUAL DIFF` accordion now uses the
  English Workflow composition model: selected model first, an inline Prompt
  resource palette, selected-group insertion, `[+group]`, group copy/shuffle/
  clear, wraparound rotation inside and outside groups, Prompt and effective
  model selectors, and independent `peers`/`updates` visibility. No editable
  surface was moved outside the page's three native accordion stacks. Focused
  tests (5), frontend production build, `git diff --check`, and live selected-
  group insertion/copy verification passed on 2026-08-17. Visual Image Diff
  stack controls are semantic headers with their collective size buttons built
  into the header. Each header freezes against its own independently scrolling
  stack rather than floating against the page scroll surface. Frontend build,
  `git diff --check`, 59 focused accordion/navigation tests, and live DOM/
  screenshot verification passed after the header refinement. Full repository
  validation after the refinement: 529 passed in 43.18s using an external
  Windows base-temp directory.
- [x] Make Visual Image Diff executable without leaving its three accordion
  stacks. The left sequence accordion accepts multiple image uploads, the
  center `GENERATE VISUAL DIFF` accordion selects an effective model and runs
  the selected group as one real model invocation, and the right `RESOURCE
  OUTPUTS` accordion displays status, errors, usage, and response text. The
  browser prepares a labeled contact sheet so every ordered image can pass
  through the existing single-image model endpoint. Center prompt rows now
  fit their accordion body at narrow widths, reserve a stable scrollbar
  gutter, and no longer place text or controls underneath the scrollbar.
  Added the requested eleven-stage source/normalize/object/Turtle/compare/
  rules/Prolog/validate/report pipeline as filesystem Prompt resources and
  placed them first, in supplied order, inside the existing
  `visual_image_diff.analysis_group` profile. The workspace manifest now
  distributes those eleven prompts across the five real
  `free_staged_symbolic_analysis` transaction groups: Objects (6), Changes
  (1), Prolog (1), Rules (1), and Audit (2). The first Objects entry therefore
  starts as a group rather than eleven unrelated composer rows. Model selectors
  now display the resolved backend label beside the model name while retaining
  the model resource ID as the invocation value. Accordion summary-strip clicks
  now cycle through all three native sizes (`strip`, `scroll`, `full`); the
  three sizing buttons remain direct state selectors. Visual Image Diff prompt
  and group titles now also execute as quick calls, matching the English
  Workflow generation-order behavior while submitting the current ordered
  image sequence. The former separate `+ STEPS` and `GROUP PROMPT` members are
  merged into that one center accordion, with the same compact inline composer,
  wide horizontal rows, narrow stacked rows, shuffle/clear actions, and primary
  run placement used by English Workflow. Focused Visual Image Diff tests (8),
  frontend production build, `git diff --check`, and live browser verification
  of one center member, twelve inline add controls, five groups, and eleven
  nested prompt steps passed on 2026-08-17. Full repository validation after
  the unified composer change: 539 passed in 54.46s. The RIGHT stack now also
  has a separate item-level `PROMPT CONTENT` member alongside the retained
  whole-transaction `COMPOSED GROUP PROMPT`: touching or focusing any of the
  eleven individual pipeline Prompt rows selects and highlights that resource,
  opens the inspector, and displays its complete filesystem-backed text plus
  ID, label, classification, applicability, and produced values without
  truncation. Changing a row's Prompt selector updates the same inspector.
  Focused item-inspector tests (9), frontend production build,
  `git diff --check`, live selection verification, and the full repository
  suite (543 passed in 59.29s) completed on 2026-08-17.
- [x] Add an in-page Visual Image Diff UIX comparison without replacing the
  established flat composer. CENTER now contains the original `GENERATE
  VISUAL DIFF` member unchanged and a second `GENERATE VISUAL DIFF ·
  SUBACCORDION UIX` member bound to the same filesystem Prompt resources,
  model choices, composition state, visibility routing, ordering actions, and
  invocation path. The alternate view renders five top-level group resources
  and their eleven Prompt steps as native nested `ThreeStateAccordionMember`
  instances with independent three-state controls. Managed-order accordion
  members follow the shared semantic order and intentionally disable a second,
  conflicting drag order; all existing members remain draggable. Live browser
  verification confirmed five flat rows, five group accordions, eleven nested
  Prompt accordions, right-side Prompt inspection from the alternate view,
  shared edits between both presentations, vertical scrolling, and no
  horizontal overflow. Focused accordion/navigation/UIX tests: 72 passed;
  frontend production build and `git diff --check` passed; full repository
  validation: 557 passed in 65.55s on 2026-08-17. The alternate version's
  sublist now uses native collapsed accordion strips carrying the same compact
  controls as `workflow.populate_from_english`: ordinal/state cycling, quick
  run title, `peers`/`updates`, filesystem Prompt selection, backend-qualified
  model override, and wraparound left/remove/right actions. Parent groups stay
  expandable while all eleven nested Prompt members start in `strip` mode and
  retain their own `_ | * | +` selectors. Long values remain horizontally
  reachable inside each strip and are not shortened. Frontend build, focused
  72-test validation, live verification of 11 compact Prompt strips, strip to
  scroll to strip cycling, and screenshot inspection passed on 2026-08-17.
  Full repository validation after the compact-strip refinement: 582 passed
  in 80.52s using an external Windows base-temp directory.
- [x] Make each expanded Visual Image Diff transaction a real Workflow Item +
  Operation debugger inside its existing `ThreeStateAccordionMember`. The
  debugger uses the shared rich `OperationPlayground`, retains Run/Edit
  Workflow Step tabs, and lists the exact filesystem Prompt resources used by
  the selected Prompt implementation. Replace the Prolog group's incorrect
  Turtle-renderer binding with the semantic `symbolic.get_prolog_evidence`
  Operation. Its default `prompted_llm` child binds the existing cherry-pick
  Prompt, while its `python` child deterministically collects all seven Prolog
  artifacts and asks SWI-Prolog to load-check them when available, with no
  Prompt or LLM call. The workflow keeps the semantic Operation stable and
  persists only the selected implementation override. Live browser verification
  confirmed both choices in the rich cascade selector and confirmed that the
  Python route visibly changes to `NON-PROMPT OPERATION DEBUGGER`. Focused UI,
  navigation, editor, and provider validation: 123 passed; frontend production
  build passed; full repository validation: 618 passed in 76.83s on
  2026-08-17.
- [x] Restore English Workflow as a first-class page and bind every one of the
  13 current project workflows to a real editable English description. Eleven
  missing `docs/WORKFLOW_DESCRIPTION.md` companions were derived from their
  filesystem workflow resources; the existing ARC3 and count-to-ten documents
  were retained. Entering English Workflow now refreshes a missing in-memory
  description binding from the shell snapshot, so descriptions added after a
  workspace was opened appear without making descriptions a catalog admission
  requirement. A behavior regression proves a workflow with no generation
  metadata still joins the workflow catalog. Live browser verification showed
  the complete editable Review with Approval document. Focused English,
  navigation, workflow-resource, and shell-snapshot validation: 81 passed;
  frontend production build and `git diff --check` passed. Full repository
  validation reached 636 passed with one unrelated pre-existing datatype
  backlink failure (`information.implementedBy` is missing `system_contract`) on
  2026-08-17.
- [x] Make the eleven Visual Image Diff pipeline Prompts model-provider
  neutral. Removed embedded OpenAI, Groq, and OpenRouter profile IDs from the
  Objects, Changes, and Rules stage contracts and removed the four legacy
  OpenRouter defaults from the five-group workspace manifest. Each Prompt row
  now inherits the page's selected workbench backend/model unless the user
  explicitly chooses a row override. Focused Visual Image Diff validation:
  13 passed; `git diff --check` passed; live browser verification confirmed
  all eleven Prompt steps loaded with no provider-profile strings and the
  current `ASICloud · asi1` selection on 2026-08-17.
- [x] Match the approved Visual Image Diff SUBACCORDION UIX framing. Every
  group keeps one permanent compact strip with its ordinal, `[group]` title,
  `visible`/`peers`/`updates`, group type, backend + model, left/remove/right,
  and native `-`/`*`/`+` sizing controls. Its only expanded item-header row is
  `SELECTED`, `COPY`, `SHUFFLE`, and `CLEAR`. The expanded body contains only
  the nested compact Prompt strips; the duplicate play row, flags, selectors,
  movement controls, and transaction label were removed. The attached footer
  identifies the resolved Workflow Item + Prompt or non-Prompt Operation and
  exposes `INPUT / OUTPUT` plus `RUN GROUP`; `INPUT / OUTPUT` lazily opens the
  existing rich Operation playground rather than duplicating it in the body.
  Focused Visual Image Diff validation: 14 passed; frontend production build
  and `git diff --check` passed. Live browser verification confirmed the full
  compact strip, exact four-button header, six nested compact Object prompts,
  zero duplicate body control rows, and a real six-field playground opened
  from the footer on 2026-08-17.
- [x] Keep the original Visual Diff composer and SUBACCORDION UIX synchronized
  through one shared Workflow Item + Operation playground renderer. The
  original composer now exposes the selected group's rich playground while the
  UIX keeps one playground per expandable group; both write workflow-step and
  implementation changes to the same live composition state. Focused Visual
  Image Diff validation: 14 passed; frontend production build passed; live
  browser verification confirmed both presentations resolved the Objects route
  to `vision.extract_scene_objects.automatic_llm` and selected
  `asicloud-asi1` on 2026-08-17.
- [x] Make the Visual Image Diff columns a real data-authoring-source flow.
  `LEFT STACK · DATA` begins with `RESOURCE OUTPUTS` as its declaration/index,
  followed by the filesystem image sequence and transition context; the same
  member also accumulates real playground outputs. `CENTER STACK ·
  AUTHORING` retains both composer presentations and the shared rich Operation
  playground. `RIGHT STACK · SOURCE DETAILS` is limited to the selected Prompt
  resource and the composed group Prompt. Opening a center playground now
  resolves its declared inputs from the left-side data aliases (including
  current/previous images, image collections, manifests, and sequence context),
  and successful executions merge their outputs back into the left stack for
  later steps. Live browser verification confirmed the three stack roles and
  prefilled current/previous filesystem asset URLs. Focused Visual Image Diff
  validation: 16 passed; frontend production build passed. Repository-wide
  validation reached 643 passed; all five temp-location-sensitive failures
  passed when rerun with an external base-temp, leaving only the unrelated
  pre-existing `fan_out_and_merge` editable-workflow `version` violation on
  2026-08-18.
- [x] Make filesystem `workflow_page` resources the sole source of the
  WORKFLOWS submenu and expose raw executable Workflow resources separately
  under CAPABILITIES as `Workflow Resources`, backed by the existing rich
  Workflow Editor. Effective workspace plus inherited page specifications are
  enumerated on workspace load and ordered by `menuPlacement` (`first`,
  `middle`, `last`), then numeric `order`, then label. The shared `Generate
  Workflow` page is first and ARC3 `Visual Sequencing` is middle. Every
  three-column page specification is now required to include a minimized
  `CURRENT PAGE SPECIFICATION` `ResourceSourceEditor` bound to its own
  filesystem `workflow_page` JSON; English Workflow and Visual Sequencing both
  expose and save that resolved source through the shared editor. Live browser
  verification confirmed the ordered page-resource menu, the separate rich
  Workflow Resources route, and editable source JSON on both three-column
  pages. Focused workflow-page/navigation validation: 106 passed; runtime
  discovery validation with an external base-temp: 13 passed; frontend
  production build and `git diff --check` passed. Full repository validation:
  653 passed with only the unrelated pre-existing `fan_out_and_merge`
  editable-workflow `version` violation remaining on 2026-08-18.
- [x] Softcode the shared `Generate Workflow` page entirely from its filesystem
  `workflow_page` specification and remove the dedicated
  `EnglishWorkflowPage` layout. `WorkflowPageHost` now enumerates native
  `ThreeStateAccordionStack` columns and members through a runtime component
  registry. The resolved page declares 10 LEFT data/result members, 3 CENTER
  authoring members, and 6 RIGHT source/detail members; former center outputs
  such as Workflow Draft Preview and contract results now live in LEFT. Live
  browser verification confirmed every declared member, real filesystem text
  loading, model-backed authoring controls, and the editable Current Page
  Specification. Focused workflow-page/navigation validation: 80 passed;
  frontend production build and `git diff --check` passed on 2026-08-18.
- [x] Give each of the four workbench agents an independent self-managing
  mailbox watchdog rather than a central multi-agent loop. Each supervisor owns
  exactly one identity and cursor, checks its child every 10 seconds, runs a
  bounded poll every 5 seconds for 61 checks, restarts it on exit, and preserves
  deliveries in a per-agent durable spool. Heartbeats now consume only their
  own spool and acknowledge a fixed snapshot offset so concurrently arriving
  mail cannot be skipped. All four supervisors and poll children were verified
  live; focused watchdog validation: 5 passed and `git diff --check` passed on
  2026-08-18.
- [x] Softcode Visual Image Diff through the same filesystem-driven
  `WorkflowPageHost` and runtime component registry used by Generate Workflow,
  while retaining its richer visual composer, nested subaccordion UIX, model
  invocation, image sequence authoring, source inspectors, and Operation
  playground. The page specification now declares three LEFT data members,
  three CENTER authoring members, and three RIGHT source/detail members, and
  the shared host supports controlled member modes plus the page's resizable
  column dividers. Its original three-member RIGHT stack was subsequently
  expanded into the composed group Prompt plus all 11 pipeline Prompt editors.
  Focused workflow-page/navigation validation: 88 passed;
  frontend production build and `git diff --check` passed. Live browser
  verification confirmed all nine registered surfaces exactly once, two
  column dividers, both model/group composers, and zero unavailable-component
  fallbacks on 2026-08-18.
- [x] Expand the Visual Image Diff RIGHT source-details stack into the live
  composed group Prompt followed by all 11 filesystem-backed pipeline Prompt
  resources selectable from the CENTER composers. Each named Prompt member is
  a compact rich resource editor: contract metadata, synchronized MeTTa/JSON
  text editing, validity gating, and a per-resource Save Prompt action using
  the sibling-preserving Prompt update API. Live browser verification
  confirmed 13 right-column members in the declared order, 11 Prompt editors,
  independent expansion, and zero unavailable-component fallbacks. Focused
  validation: 79 passed; frontend production build and `git diff --check`
  passed on 2026-08-18.
- [x] Add a first-class Workflow Page Builder under WORKFLOWS. CURRENT PAGE
  SPECIFICATION accepts pasted `workflow_page` JSON; CLEAR removes the draft
  and generated preview while preserving the editor, and LOAD performs one
  best-effort construction pass. The loader normalizes left/center/right,
  renders every valid declaration through `WorkflowPageHost`, and inserts
  visible recovered-error accordion members for malformed columns or members
  instead of rejecting the entire page. It initializes from a real effective
  filesystem page rather than mock content. Live browser verification covered
  CLEAR, a recovered bad component beside a valid component, three-column
  rendering, and filesystem-page restoration. Focused validation: 92 passed;
  frontend production build and `git diff --check` passed on 2026-08-18.
- [x] Split Workflow Page Builder construction into explicit LOAD and INIT
  phases. LOAD now synchronizes CURRENT PAGE SPECIFICATION with the visible
  three-column declaration and recovered error members without activating
  component bindings; INIT then initializes every valid declared component.
  CLEAR resets both phases while preserving the specification editor, and a
  refreshed filesystem definition with the same page id is synchronized back
  into the builder rather than being ignored as stale. Generate Workflow and
  Visual Sequencing retain their validate/apply-to-filesystem then snapshot-
  refresh synchronization path. Focused validation: 102 passed; frontend
  production build and `git diff --check` passed. Live browser verification
  confirmed the filesystem definition begins in LOADED state with 20 declared
  members and INIT replaces every pending surface with its initialized binding
  preview on 2026-08-18.
- [x] Turn Visual Sequencing `RESOURCE OUTPUTS` into the datafield planner for
  the LEFT stack. `READ MIDDLE FLOW` derives the 23 current datafields from the
  11 real filesystem Prompt `produces` contracts and records which Prompts
  consume and produce each field. `ADD MISSING FIELD EDITORS` inserts one
  editable accordion member per absent field immediately after RESOURCE
  OUTPUTS, without duplicating members already declared by the page. The live
  generated layout is synchronized into CURRENT PAGE SPECIFICATION as an
  unsaved definition, so Validate and Apply can persist it. Live browser
  verification confirmed 23 editors from `source_images` through
  `workflow_report`, the correct left-stack order, and a synchronized/apply-
  enabled page specification. Full validation: 667 passed; frontend production
  build and `git diff --check` passed on 2026-08-18.
- [x] Recursively convert JSON embedded inside string values during JSON→MeTTa
  serialization, including JSON contracts surrounded by natural-language
  Prompt prose. The codec uses reversible text/structured-JSON parts so the
  MeTTa→JSON path reconstructs the original string semantics; nested embedded
  JSON is handled recursively while ordinary prose and scalar-looking strings
  remain strings. Python persistence and browser-side editor codecs implement
  the same contract. Visual Sequencing Prompt editors now also expose explicit
  Load, filesystem Reload, Clear, and validated Save Prompt actions. Live
  browser verification confirmed all four controls. Full validation: 669
  passed; frontend production build and `git diff --check` passed on
  2026-08-18.
- [x] Simplify Visual Sequencing group members around resource inheritance.
  Nested Prompt steps no longer repeat a model selector; they inherit the
  containing group's selected model, including single-step quick runs.
  Arrow/× controls on nested steps were replaced by drag ordering plus a
  keyboard-accessible position selector, explicit OVERRIDE and REMOVE
  actions, and Prompt-resource replacement by drag-and-drop. Collapsed Prompt
  strips in the RIGHT source-details stack are themselves drag sources:
  dropping one on a Prompt step replaces that occurrence, while dropping it
  on a group appends a new step. Live DOM verification found 11 draggable
  right-column Prompt strips, 11 nested drag/order controls, and zero nested
  model selectors. Focused validation: 18 passed; full validation: 669 passed;
  frontend production build and `git diff --check` passed on 2026-08-18.
- [x] Retire the duplicate flat Visual Diff composer and retain the nested
  subaccordion as the sole filesystem-declared authoring component. GRAPH is
  now a live alternative presentation of that exact `generationOrder`, not a
  mock: real HTML editors are embedded directly in its SVG graph nodes. GRAPH
  keeps the RIGHT source-details stack visible as its draggable filesystem
  Prompt palette, uses one unified graph canvas and one uninterrupted vertical
  call-sequence spine, and places
  insertion targets before, between, and after the calls. Dropping on a gap
  inserts a Prompt occurrence at that exact position; dropping on a call
  replaces it. Existing calls drag-reorder and also retain keyboard-accessible
  position selectors. Group model/visibility/order/run/copy/shuffle/clear/remove
  controls and datafield editors mutate the same `generationOrder` and
  `workflowData` used by COLUMNS. Column mode retains DOM-drawn field-to-Prompt
  lines; GRAPH uses the same contracts to draw its editable edges and nodes. The
  graph no longer renders a list of per-group graph cards: S1-S5 are subtle
  annotated bands along the single global call sequence. S1 is restored as the
  `IMAGE PAIR + COMMAND` stage and explicitly consumes editable `image_pair`
  and `transition_command` fields before source, normalization, and object
  extraction. Calls are globally numbered 1-11 while the underlying editable
  groups remain intact.
  Focused Visual Image Diff validation: 19 passed; frontend production build,
  `git diff --check`, screenshot review, and live GRAPH browser verification
  passed on 2026-08-18. Updated live DOM evidence: one graph canvas, one
  sequence spine, five annotation bands, zero legacy stack cards, 11 globally
  numbered Prompt editors, both S1 input editors, and the visible RIGHT Prompt
  resource column.
- [x] Make the unified GRAPH call sequence reorderable across transaction-group
  boundaries. Every call node is a drag source; every before/between/after gap
  accepts either an existing occurrence or a filesystem Prompt dragged from
  the RIGHT column. Moving an occurrence into another segment transfers the
  real nested step to that target group and corrects same-group indices after
  removal. Dropping a RIGHT Prompt on a gap inserts it; dropping it on a call
  replaces that occurrence. Focused Visual Image Diff validation: 19 passed;
  frontend production build passed on 2026-08-18.
- [x] Replace the hand-rendered GRAPH SVG with `@xyflow/react` and
  `@dagrejs/dagre`. Prompt occurrences are single rounded custom React Flow
  nodes in one Dagre-ranked top-to-bottom sequence; data nodes, group-control
  nodes, and insertion targets share the same pannable/zoomable canvas.
  Smooth-step directed edges, a minimap, viewport controls, foreground editor
  nodes, and stack-aware collision spacing reduce occlusion. Inputs use left
  handles and outputs use bottom handles. The graph still mutates the same
  `generationOrder`/`workflowData`, supports cross-group call moves, and accepts
  filesystem Prompts from the RIGHT column at every insertion target. Focused
  Visual Image Diff validation: 19 passed; frontend production build passed on
  2026-08-18.
- [x] Add graph-wide mouseover discoverability for Visual Sequencing GRAPH mode.
  Group, Prompt, datafield, action, and insertion-gap controls now expose
  explicit hover tooltips (`title`) plus stronger hover/focus highlights on
  graph nodes and insertion targets, so every hovered graph element identifies
  itself and its action. Live verification on the default page URL
  `http://127.0.0.1:5173/?workspace=arc3_random_player&view=visualImageDiff`
  confirmed one React Flow canvas, 11 Prompt calls, visible RIGHT Prompt
  column, S1 `image_pair` and `transition_command` datafield editors, and
  nonzero tooltip counts across group, prompt, gap, and toolbar controls
  (30/77/16/6). Graph group controls also retain explicit REMOVE alongside run,
  copy, shuffle, and clear.
- [x] Make each GRAPH left-side datafield map to a right-side helper
  displayer/editor/uploader node. Each helper stays compact by default with a
  value preview and drag handle, and expands into the full editor plus file
  uploader only when selected. The helper nodes are filesystem-backed through
  the same `workflowData` mutation path as COLUMNS. Live default-port check at
  `http://127.0.0.1:5173/?workspace=arc3_random_player&view=visualImageDiff`
  confirmed 36 helper drag handles, one expanded selected editor, 35 compact
  preview helpers, and visible file upload control.
- [x] Keep moved GRAPH helper nodes as the same original node instance.
  Dragging a right-side helper now persists that helper node's position by its
  real React Flow node ID, so moving `image_pair` (or any datafield helper)
  moves the original instead of appearing as a fresh reset node.
- [x] Keep helper-node selection in-place instead of showing a separate-looking
  expanded card. Selecting a helper now slightly enlarges that same original
  node and reveals editor/upload controls inline. Live default-port verification
  confirmed one selected helper with inline editor (`selectedNodes:1`,
  `editorVisible:1`) and zero legacy separate expanded cards
  (`legacyExpandedNodes:0`).
- [x] Verify left-side datafield clicks do not trigger far-right helper changes.
  Live UI check at `http://127.0.0.1:5173/?workspace=arc3_random_player&view=visualImageDiff`
  (GRAPH mode) confirmed: initial selected helper count `0`, after clicking a
  left datafield editor it remains `0`, and only clicking a right helper sets it
  to selected with inline editor (`1`).
- [x] Make all GRAPH canvas item types draggable and persistent in-place
  (groups, Prompt nodes, left data nodes, insertion gaps, and right data helper
  nodes). Live drag verification on the default URL confirmed movement deltas
  for every node type (`~30px` each) rather than snapping back.
- [x] Remove left/right datafield duplication in GRAPH mode. Data helpers are
  now consolidated into the left data nodes only, with inline edit plus upload
  (`UP`) on that same node. Live default-port verification confirmed
  `dataDetailNodes:0` with matching left data/upload counts (`36/36`).
- [x] Move workspace resource persistence into the shared Resource Source
  editor instead of keeping a Models-only Save destination selector. The
  reusable control supplies Save, Save As, Reload, and Load From; accepts the
  active workspace plus a workspace-relative resource path; remembers the
  original workspace for later reloads; and orders destinations as current,
  inherited hierarchy, separator, other libraries, then other workspaces.
  Models now uses this common control for backends, models, presets, and
  systems. Frontend production build passed on 2026-08-24.
- [x] Derive each Backend's rich editor as an aggregate instead of presenting
  one undifferentiated source document. Backend tabs now expose File (shared
  workspace file lifecycle and JSON/MeTTa/tree source), Resource (structured
  Configuration plus resolved/inherited JSON), Backend Actions (discovery,
  enablement, defaults, capabilities, and example actions), and the Universal
  Execution Runner with backend inspect/readiness/validation Operations.
  Frontend production build passed on 2026-08-24.
- [x] Make the focused Models editor resource URL-addressable with `edit=<id>`.
  Selecting the EMULLM backend now synchronizes `edit=enullm-8801`; loading a
  Models URL with that parameter reopens the same backend. Navigation away
  clears stale `edit` state while the legacy `resource` link remains accepted.
- [x] Make backend source editing conspicuous from the derived Resource view.
  The document toolbar now exposes a prominent Edit button that reveals File
  mode, and the resolved/inherited JSON panel has a direct Edit JSON / MeTTa
  action rather than requiring users to discover the small File tab.
- [x] Make the Backend aggregate visibly and semantically tabbed. The editor
  now has a labeled EDITORS tab strip, connected tab/panel borders, a strong
  active-tab treatment, hover affordances, and tablist/tab ARIA semantics.
- [x] Distinguish every shared Resource Source file action by storage channel.
  Workspace resources use Save To Workspace, Save To Other Workspace, Reload
  From Origin, and Load From Workspace. Native browser file handles use Load,
  Save, Save As, and Reload Local File. Portable client transfer uses Upload
  and Download without falsely claiming a persistent reloadable path.
- [x] Expose Backend enablement directly in the derived Resource tab. The tab
  shows whether state is declared locally or resolved and provides an explicit
  Enable Backend / Disable Backend action without requiring Backend Actions.
- [x] Label split-comparison document tabs by pane in the upper tab menu. When
  split view is active, the primary focused document is marked LEFT and the
  comparison document is marked RIGHT with distinct visual badges.
- [x] Give the Backend aggregate two display modes. Tabs shows one derived
  editor at a time; Stack aligns File, Resource, Backend Actions, and Universal
  Execution Runner vertically in one scrolling document. Selecting a named
  editor while stacked returns to Tabs focused on that editor.
## User/UI preferences

- [x] Relink the active Workflow Canvas in the WORKFLOWS menu and make
  workspace opening deterministic. Explicit `view=` wins; otherwise a local
  workspace preference or last-page history wins, followed by inherited
  workspace preferences and the configurable system fallback (Overview by
  default). First visits therefore resolve through inheritance/system rather
  than falling into the legacy canvas route, while invalid saved page IDs open
  Settings for repair. Canvas URLs now round-trip as Canvas instead of
  reopening Current Workflow.
- [x] Add a browser-persisted User/UI Settings preference for placing shared Resource Source save/load controls above or below editor text areas; apply changes live without modifying workspace resources.
- [x] Add a shared per-page UI tools contract: show currently available UI configuration, open a context-filled Codex UI conversation, and retain page URL, scroll position, and tool state per workspace/page for safe session reloads.
- [x] Replace broad Vite/UI restart behavior with an allowlisted, debounced surgical reloader that calls `onUIRestart`, flushes all visited-page session records, and permits one browser reload per restart token; manual restart no longer touches `vite.config.ts`.
- [x] Replace the selected Operations document control with an embedded
  `UniversalArtifactEditor` Super Control. The rich Abstract Operation or
  Operation Implementation surface is now the first Super Control tab, and
  `ResourceSourceEditor` is mounted only by the shared Resource tab instead of
  remaining duplicated in `OperationLibraryEditor`. Operations supplies typed
  resource data and callbacks; Super Control owns renderer selection and its
  CSS. Operations contributes no other tabs: the existing File, Markdown,
  Resource & Inheritance, and Universal Execution Runner editors remain owned by
  Super Control, while library/model/policy/plugin pages are not injected.
  Validation on
  2026-08-26: 9 focused UI contract tests passed, the frontend production build
  passed, and live browser checks confirmed zero source editors on the Abstract
  Operation tab and exactly one on the Resource tab.
- [x] Replace the selected Topics document control with an embedded standard
  Super Control while keeping the taxonomy heading and tree outside. Topics
  contributes no special editor tab; it supplies only its filesystem resource
  text, metadata, Save/Delete actions, and an initial Resource selection. File,
  Markdown, Resource & Inheritance, and Universal Execution Runner remain the
  only tabs.
  Resource & Inheritance combines editable resource controls with the resolved
  read-only view. The latter supports save/export and reload-from-origin, never
  loading a different resource, and links to its real parent for editing.
- [x] Make embedded Super Control import and own the Models-style toolbar,
  editor-tab, source-border, scrollbar, and responsive CSS so hosts do not need
  to load component styling.
- [x] Implement the documented Super Control display contract: Tabs, Stacked,
  Single, SplitV, and SplitH, with independently selected panes where required.
  ALL must expose every registered content-backed tab; CTX must use the
  content-backed subset of the selector API result. Registered controls without
  real renderers stay hidden rather than producing empty placeholder tabs.
  Expose ALL and CTX as persistent segmented buttons in the banner beside the
  DISPLAY selector, not as editor tabs or a pull-down.
  Mode changes must preserve dirty resource state, and every non-Tabs
  mode must retain a visible action that restores Tabs. Tabs mode must expose a
  pull-down selector for switching directly to every other display mode.
  Single must initially show the context-selected default tab, normally File
  through `ResourceSourceEditor`. Put the switcher in the Super Control header
  action slot currently occupied by the one-off Split view button; do not add a
  separate control row or absorb host-level document comparison.
- [x] Make parsed JSON identity displays consistently include the stable `id`
  plus available `kind`, `type`, `subkind`, or equivalent role metadata. A
  human label may supplement but must not hide resource identity, and parse
  failures must be explicit. For one JSON object, derive the Super Control
  header as `KIND - Label (id)`, omit `(id)` when it equals the label, and use
  `KIND - id` when no separate label exists.
- [x] Make `ResourceSourceEditor` choose a CodeMirror syntax mode from the source
  format, resource metadata, and filename extension. Normal source views remain
  editable; explicitly resolved/inherited views remain read-only. MeTTa must use
  a Lisp- or Clojure-compatible lexer when no dedicated MeTTa lexer is present.
  Content detection takes precedence over extension: JSON-parsable documents
  default to the MeTTa representation, while detected Markdown uses the
  CodeMirror Markdown lexer even without a Markdown filename suffix. Run every
  opened source through file-type detection using content, path/extension,
  shebang markers, and resource metadata, then load the best CodeMirror language
  extension; use plain text only when no language is confidently identified.
- [x] Base the JSON Tree presentation on CodeMirror's parsed JSON structure and
  folding state. Give every object/array node a clickable expand/collapse
  disclosure and add persistent overlaid Expand/Collapse controls for the whole
  tree and selected branch. Tree, JSON, and MeTTa views must remain synchronized
  and folding must never mutate source.

  Accepted on 2026-09-12 in the authorized separate browser using
  `workspace=arc3_random_player`: an invalid JSON draft survived Tabs, Stacked,
  Single, SplitV and SplitH with Save disabled; ALL/CTX retained actual
  content-backed tabs. Native MeTTa used the Clojure lexer, JSON used JSON,
  and tree disclosure/fold state round-tripped through the real CodeMirror
  editor without changing document bytes. A uniquely named temporary Operation
  was edited, saved through Super Control, reloaded clean, and then deleted;
  the original shared Echo Operation retained its exact hash.
  Narrow acceptance found clipped source-format buttons and unreadable split
  widths. Headers/format controls now wrap, identity remains visible, and
  SplitV/SplitH retain their chosen orientation with usable minimum pane sizes
  and internal scrolling. The final focused batch passed 40 Node and 34 Python
  UI-contract cases. Screenshots `super-control-todo-desktop.png` and
  `super-control-todo-narrow.png` are in session artifacts. No operation/model
  execution or original-resource save was used for this acceptance.

## Recovery note (preprocessing option-a refinement, in progress)
- Committed + unpushed on local main (origin/main..HEAD): 60be96cc2 A, c74ea6150 B, e4003b75d C, 4b8153c2a D, 9fb772823 E, 73335fc53 C-recording-key, 126b89595 + 84031c75b process-viewer hot-loop fix (psutil + single-flight cache).
- UNCOMMITTED refinement (snapshot: files/recovery-preproc-refinement/): moved the single Preprocessing section into the shared shell (const preprocessingSection rendered once after the step nav) so it shows in Recognition/Objects/Frames; canonical key preprocSequenceId = data/<catalog entry id> (matches seedTodos extraction target), with a URL->catalog re-resolution fallback for cold reload before confirmation. Added VideoImportRecordingUrl.test.mjs route/context tests (8 pass). Frontend builds.
- Refinement audit (GPT-6 Astra): computed browser styles proved the setup was
  hidden by the subview CSS allowlist, even when present in the DOM. DOM presence
  was not successful visual verification. Added explicit Recognition/Objects/Frames
  visibility and one shared-shell instance; removed temporary debug attributes.
  Context resolution now uses only validated catalog entries, giving the current
  URL priority over a previous selected ID during back/forward navigation.
  Removed the speculative URL-to-directory fallback. Saves are serialized, retain
  their originating sequence, flush pending edits on context changes, and ignore
  stale responses; errors are visible rather than interpreted as Original Pixels.
- Catalog evidence: the bare canonical ls20/20260718-154544 recording was absent
  from the returned canonical entries, but a legacy imported adapter named
  arc_recordings/data-recordings-ls20-20260718-154544 exists. Do not claim the
  recording itself was deleted or silently choose a suffixed attempt.
  Live acceptance uses the explicit real _attempt8 canonical entry.
- Full Preprocessing Setup is NOT complete merely because the initial A-E commits
  exist. Remaining acceptance includes actual visible controls, persistence/reload,
  preview identity and correct sequence scope, full OpenCV/LLM input-path coverage,
  downstream staleness and coordinate/implementation-version lineage.
- Binary-capable implementation-only recovery diff:
  C:\Users\dougl\.copilot\session-state\624aa1a5-4c13-425c-9e1d-a651f9915222\files\recovery-preproc-refinement\implementation-head.patch.
  No relevant untracked implementation files existed at the snapshot checkpoint.
- NEXT after this: reconcile files/visual_sequence_cache.paused.patch (23KB, intact) over current main for Visual Sequence caching.
- Catalog prerequisite brought forward with coordinator approval: the preserved
  patch was reviewed, not applied blindly. Its shallow directory-mtime signature
  missed deletion of image.png inside an existing frame directory on Windows.
  The implementation now checks source membership and manifest metadata once on
  startup, then uses the existing uvicorn[standard] watchfiles dependency's native
  notifications to avoid repeating exhaustive checks on warm requests. Processing
  outputs below recording frames do not invalidate the catalog. Cold enumeration
  memoizes image lists within a single catalog scan, including whole-game reuse.
  Persistent snapshots, single-flight assembly, ETag/304, explicit refresh and
  browser session-cache revalidation preserve imageCount and the >800 load guard.
  Real measurements: old isolated catalog 34.25s / 428 entries; saved snapshot
  reload 9.54s; subsequent validated request 0.074s. Browser acceptance remains
  pending; these timings are not a claim of full Preprocessing completion.
- Workflow: no PR/push; commit local main only; preserve runtime/generated files.
