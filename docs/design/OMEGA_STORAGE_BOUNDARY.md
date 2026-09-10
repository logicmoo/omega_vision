# Omega storage boundary

[Back to repository README](../../README.md)

User-authorized contract, 2026-09-10. This supersedes older Omega data-overlay
and automatic layout-migration descriptions; it does not change workbench
resource inheritance or relocate Python/React source.

The authoritative seven-point instruction is
[AGENTS.md, Mandatory Omega Vision shared-storage contract](../../AGENTS.md#mandatory-omega-vision-shared-storage-contract-2026-09-10).
Its recovery reference is maintained by the coordinator in `CODEX_TODO.md`.

## Integrated main acceptance

The coordinator completed the storage gate and owned API restart on 2026-09-10.
This section supersedes the intermediate pending/blocked checkpoints retained
below. Independent targeted re-review found no remaining issue in the corrected
output-containment, recognition-ID and memory-alias chains. The frontend canonical
recognition matrix and source paths now follow `curated/recognition_reduce`.
Fifty focused frontend tests and the production build pass.

Actual HTTP requests from `arc3_random_player` and `default` expose the same nine
areas and identical record/version identities: 534 Shape versions in each of two
areas and 382/386 Object versions in two areas. Preferences were unchanged.
The existing LS20 recording remains canonical and writable; its historical
`arc_recordings` adapter is read-only. No data was migrated or fabricated.

The mounted inspector was exercised against these real stores: geometry, zoom,
fit, two-axis scrolling, read-only JSON/MeTTa CodeMirror, filtering, object members,
and Nowhere empty/reset/reload. Workspace-only area browsing works without
sequence enumeration. Instrumented memory requests were setup/read only.
Exact attributed multi-group references have deterministic model coverage but
were not live-demonstrated: current canonical stores contain legacy unattributed
objects, while historical native records outside this root remain explicitly
unavailable. That data limitation is not permission to infer or migrate references.

The remaining Python partition passed 1,285 tests. The new document-backlink
failure was fixed and its targeted regression rerun; the unrelated installed
Codex plugin's two-page-versus-one assertion remains unchanged. Windows symlink
privilege limitations remain as reported below; deterministic escape tests pass.

## Visual Sequence option-list cache

The later, explicitly authorized list-only cache uses
`data/omega_vision/.cache/visual-sequence-list/choices.json`. Its identity is the
actual canonical root and option-catalog version, never the caller workspace.
Only stable option IDs, labels/groups, exact counts and small selection/read-only
metadata are retained. The previous signature-based catalog snapshot is not read
or removed; it cannot override this dedicated payload.

Clean hits read this JSON and a tiny dirty token without enumerating frame
directories or computing a recursive signature. Managed source/metadata changes
invalidate before and after writes; explicit Refresh and five-minute expiry
cover external edits. Existing OS-owned locking and atomic JSON publication
serialize/coalesce rebuilds without clearing concurrent invalidations.
Cached discovery is never authorization: current selected-resource resolvers and
confirmation checks remain authoritative. Invalid paths/counts and read/build
errors are not disguised as a stale success.

Browser choices share one option/ETag snapshot across workspaces, while requests
still validate their own caller context. Opening the dropdown itself makes no
per-sequence frame requests. This is not an image, frame-manifest, preprocessing,
execution-output or broader Visual Sequence caching system.

## One physical home

Repository workspaces and the repository entrypoint use
`<repo>/data/omega_vision`. Omega memory, preferences, candidates, event logs,
hypotheses, checkpoints, executions, pipeline configuration, caches, locks and
logs use their existing relative `runtime/`, `design/`, `knowledge/` or other
Omega-specific conventions **beneath that home**. Workspace model, backend and
credential resolution continues to use the actual workspace configuration root.

The strengthened stop-gate contract supersedes the earlier fixture exception:
there is **no external-root fallback**, including in tests. Unrecognized storage
contexts and conflicting `OMEGA_VISION_DATA` overrides are rejected. Tests
explicitly configure a temporary repository and use its `data/omega_vision`
home, exactly like production. Included workspaces are not Omega data mounts.

Logical `data/...` assets resolve only inside that home. Historical
`data/omega_vision/...` URLs normalize the prefix once, not twice. Responses use
logical `data/...` references, including execution and checkpoint references.
Traversal and child symlink escapes are rejected. Non-data workspace paths
remain available to ordinary workbench configuration resolution, not Omega
asset endpoints.

## Visual Sequences

New sequences live in `recordings/` (video, live and non-game captures as well
as game recordings) or `curated/` (image collections). A directory name alone
does not establish game identity; game/level metadata must be explicit.
`importables/` is staging, never an inspectable sequence family. Generated
recognition images and extracted archives use existing family subdirectories
within `curated/`, not new top-level `recognition_*`, `video` or `arc_recordings`
roots. Preview images and intake metadata remain support artifacts, not sequences.

Legacy sequence families **inside** the home remain visible through explicit
read adapters. Catalog entries include `readOnly`, `migrationRequired` and a
visible read-only label. Existing video frame directories remain usable for
playback. Transform/todo/preprocessing/image-output writes to legacy sequence
families are rejected; choosing a historical URL cannot create another legacy
save. Fresh extraction targets `recordings/`; no existing frame directory is
renamed, copied, deleted or rewritten to manufacture compatibility.

## Historical stores and identity

Workspace/include stores outside the home are inventoried as unavailable,
requiring explicit migration or selection. Catalog responses report
`unavailableStorage`, never mount those stores or silently copy their records.
Historical workspace memory preference metadata can be read to preserve old
selection IDs; those IDs remain unavailable under the new grant, and are not
silently replaced with writable defaults. Explicitly saving new preferences
writes only under the home.

Workspaces divide neither physical nor logical Omega data. Shared provider
`filesystem:omega_vision` and storage realm `omega_vision` occupy existing
provider/workspace identity slots; those values never identify an editor
workspace or create a workspace directory namespace. Memory locations, record
concepts, observation identities, catalogs and execution discovery remain stable
across workspace switches. Game/level/run scope and access grants still apply.
Candidate provenance is retained. New memory envelopes carry `storageContext`
with the real creating workspace as metadata; it never filters shared discovery.
Preferences are shared and scoped only by game/level/run, not editor workspace.
The shared visual option list uses `.cache/visual-sequence-list/choices.json`. Memory cache
identity retains physical-root, shared-provider, scope and grant inputs, never
an editor-workspace partition. Old workspace caches cannot authorize new
locations. The cache remains metadata-only; directory escapes are rejected.
Browser Nowhere snapshots are page-session-bound, not workspace-bound; changing
workspaces neither loses their records nor permits another page's snapshot.

Runtime layout lookup and LLM-step discovery no longer perform automatic
migrations, including manifest path rewriting, copy-era cleanup and frame moves.
Historical data migration is a separate, explicitly authorized operation.

## Transport identity versus workspace provenance

These semantics apply to the existing transport; no frontend may depend on a
synthetic shared workspace value to conceal an editor-workspace partition.

| Field/surface | Meaning and matching rule |
|---|---|
| Request `workspaceId` | Caller workspace for configuration/model resolution and authorization. Not a data-owner or catalog filter. |
| `source.workspaceId` | Creating/historical workspace provenance. Native persisted records retain the creator; legacy/unattributed records may carry the shared compatibility value. Display/preserve it, but never include it in identity, ownership, or reference resolution. |
| Area/location `workspaceId` | Existing transport compatibility field; native shared locations currently carry `omega_vision`. It is not an owner and need not equal the record source or reference workspace. |
| Reference `workspaceId` | Retained historical source provenance. Existing serialized references still require a nonempty value, but it is not an identity or access-check component. Do not rewrite old references to the current/shared workspace. |
| Native `providerRef` | Stable `filesystem:omega_vision` across workspace switches. Other providers remain distinct; never collapse provider boundaries. |
| `memoryLocationId` | Stable authorized physical area identifier across workspace switches. Preserve it exactly; never prefix it with or derive a UI identity from the caller workspace. |
| Record/reference matching | Match authorized provider, location, record UID, memory kind and revision strictly. Shape references imply Shape kind where the wire format has no separate kind field. Workspace provenance differences neither split identity nor make a reference unresolved. |

For example, an area with `workspaceId: omega_vision` legitimately contains a
record whose `source.workspaceId` is `example`, referenced with provenance
`workspaceId: example`, while the caller browses from `another`. All three refer
to the same authorized shared area/record. Removing workspace comparisons does
not authorize arbitrary providers, locations, revisions, or filesystem paths;
the backend must still resolve the requested location through current grants.
Unavailable historical location IDs remain unavailable, not silently rebound.
Nowhere additionally retains its independent browser-session boundary.

## Frozen backend handoff allowlist

**Refrozen after independent review corrections:** descendant output/claim
redirection, canonical recognition catalog/execution/cache identity, and
sequence-alias run/preference identity are corrected and verified. The current
receipt below supersedes previous final-gate claims. A concrete parent-owned
recognition-selector integration follow-up remains; Git, servers and live data
remain untouched.

The final backend allowlist is exactly the following **14 implementation files,
19 test/fixture files, and this design document (34 files total)**. No additional
implementation changes are pending in this handoff. `AGENTS.md`, `CODEX_TODO.md`,
all frontend files and live runtime/data files are excluded from this owner's
allowlist and remain under their respective owners.

Backend implementation:

- `python/omega_vision/inherited_source_overlay.py`
- `python/omega_vision/perception/memory_catalog_cache.py`
- `python/omega_vision/perception/memory_locations.py`
- `python/omega_vision/perception/symbolic_arc.py`
- `python/omega_vision/project_paths.py`
- `python/omega_vision/services/arc3_play.py`
- `python/omega_vision/services/arc3_runner.py`
- `python/omega_vision/services/transform_task_pooler.py`
- `python/omega_vision/services/video_import_api.py`
- `python/omega_vision/services/video_import_pipeline.py`
- `python/omega_vision/services/video_import_semantics.py`
- `python/omega_vision/services/workflow_providers.py`
- `python/workbench_api_server/arc3_play_api.py`
- `python/workbench_api_server/workspace_api.py`

Regression changes:

- `tests/omega_vision/conftest.py` (new explicit canonical temporary repository)
- `tests/omega_vision/test_memory_catalog_cache.py`
- `tests/omega_vision/test_memory_locations.py`
- `tests/omega_vision_api/conftest.py` (new explicit canonical temporary repository)
- `tests/omega_vision_api/test_storage_boundary.py` (new)
- `tests/omega_vision_api/test_arc3_play_preview_gallery.py`
- `tests/omega_vision_api/test_arc3_play_recordings_path.py`
- `tests/omega_vision_api/test_attachment_producer_coverage.py`
- `tests/omega_vision_api/test_cross_frame_pipeline.py`
- `tests/omega_vision_api/test_direct_transform_call.py`
- `tests/omega_vision_api/test_preprocessing_chain_api.py`
- `tests/omega_vision_api/test_semantic_active_integration.py`
- `tests/omega_vision_api/test_semantic_stage_boundaries.py`
- `tests/omega_vision_api/test_skill_discovery_cold_import.py`
- `tests/omega_vision_api/test_transform_task_pooler_order.py`
- `tests/omega_vision_api/test_video_import_cutout.py`
- `tests/omega_vision_api/test_video_import_observation_identity.py`
- `tests/omega_vision_api/test_video_import_semantics.py`
- `tests/omega_vision_api/test_visual_sequence_cache.py`

The recovery checkpoint is in `CODEX_TODO.md`. Frontend and live runtime files
belong to parallel owners and are not part of this backend change.

Historical pre-stop-gate validation: **390 passed, 1 skipped** across `tests/omega_vision_api`,
the two memory test modules above, and workbench `test_knowledge_data.py`,
`test_knowledge_artifacts.py`, and `test_repository_markdown_navigation.py`.
The skip requires unavailable Windows symlink privileges. Nine deprecation
warnings remain. The final log is `.codex/omega-boundary-final.log`.
An additional 100 concurrent cache-publication rounds passed.

Host-seam follow-up: **72 passed, 1 skipped** across storage-boundary and
memory/cache tests (`.codex/workspace-only-memory-acceptance.log`). Four API
regressions persist real Shape/Object records in global/run areas, switch to a
second real fixture workspace, and call setup/read without `sequenceId`.
These calls must not enumerate sequences, must retain the saved record identity
and provenance, and must not mutate Save To/Look In preferences. Supplying an
explicit missing sequence still returns 404. Browsing a saved run area does not
require selecting its sequence in the editor.

Windows can return an extended `\\?\` path prefix during concurrent directory
creation. The shared resolver normalizes that equivalent spelling before
containment comparisons; it still resolves and rejects escaping symlinks.
Existing physical `Recordings` capitalization on case-insensitive filesystems
is preserved; logical references use `recordings`. No live migration or server
lifecycle action was performed.

## Strengthened stop-gate receipt

The following destinations are physical, not merely changed UI labels.
`H` means exactly
`C:\snet\PeTTa\repos\symbolic_ml_workbench\data\omega_vision`
in the production checkout. In tests it means the corresponding
`<temporary-repository>\data\omega_vision`. Variables below are existing
sequence, game, level, run, journal, context, or content identifiers—not workspace
namespaces.

| Active surface and route/helper | Physical destination |
|---|---|
| Video intake and saved page state: `_imports_root`, `_write_page_state` | `H\video_import\<import-id>\...`; `H\video_import\page_state.json` and its adjacent atomic temporary files |
| Intake discovery: `_importables_container` | `H\importables\...`; staging only, excluded from sequence catalogs |
| Video extraction: `_video_frames_dir` | `H\recordings\<video-source-id>\...` |
| Capture/recording materialization and live PlaySession | `H\recordings\<source-id>\...` or `H\recordings\<game>\<saved-level>\...`, with game savepoints beneath that game's directory |
| Image archive intake: `_import_image_archive` | `H\curated\image_archives\<archive-id>\...` |
| Image collection/recognition intake | `H\curated\curated_data\<source-id>\...`; `H\curated\recognition_inputs\...` |
| Generated transform images, JSON, Prolog, todos and semantic output | Beneath the authorized source unit in `H\recordings\...` or `H\curated\...`; legacy family writes rejected |
| Memory JSON copies: native `_memory` → `MemoryLocations.save_record` | `H\knowledge\artifacts\memory\global\{shapes,objects}\*.memory.json`, or existing `games\<game>\levels\<level>\runs\<run>\{shapes,objects}` branches (optional scope levels omitted when absent) |
| Shared memory preferences | `H\runtime\memory-settings\<shared-context-hash>.json` |
| Existing symbolic memory writer | `H\object_memory\...` by default; pipeline `H\object_memory_video_import\<sequence-scope>\...`; explicit configured paths must remain inside `H` |
| Candidate/proposal journals: semantic `_store` | `H\runtime\rule-candidates\...`, `H\runtime\rule-proposals\...` |
| Promoted rule descriptors | `H\design\event-rules\...`, `H\design\grouping-rules\...` |
| Event and hypothesis journals: semantic `_event_log` | `H\runtime\events\visual-sequences\<sequence-key>\...`; `H\runtime\event-hypotheses\visual-sequences\<sequence-key>\...` |
| Checkpoints and human grouping reviews | `H\runtime\{object-checkpoints,grouping-checkpoints,temporal-checkpoints,grouping-reviews}\...` |
| Direct execution records | `H\runtime\executions\direct-<job-id>.json` |
| Optional action-tree runtime state | `H\runtime\states\play_action_trees\...`; standalone Omega default `H\runtime\states\action_trees\...` |
| Pipeline template | `H\transform_pipeline.json` |
| Visual Sequence option-list cache | `H\.cache\visual-sequence-list\choices.json`, `dirty.json`, and contained rebuild lock |
| Memory metadata cache and invalidation guards | `H\.cache\memory-catalog\...`; configured cache paths outside the authorized root rejected |
| Game preview thumbnails, both Play implementations | `H\.cache\environment_thumbnails\<safe-game-id>.png` |
| Pooler control, heartbeat, log and lock | `H\pooler_control.json`, `H\pooler_status.json`, `H\pooler.log`, `H\pooler.lock` |
| Semantic learning/promotion locks | `H\runtime\semantic-learning\...`, `H\runtime\grouping-promotion-locks\...`; other journal locks remain adjacent to their contained journals |
| Prolog execution scratch | `H\runtime\scratch\symbolic_arc\*.pl`, `H\runtime\scratch\workflow_providers\*.pl` |
| Explicit runner history/state exports | Operator-selected descendants of `H`; external paths rejected, never silently substituted |
| Asset URLs | Logical `data/...` resolves beneath `H`; ordinary non-Omega workbench configuration assets retain their separate existing resolver |
| Nowhere memory | No physical destination: current browser-session payloads, no persistent memory/cache copy |

### Offending production behavior corrected

- Removed workspace/include Omega discovery layers and workspace runtime writers;
  removed the former external-fixture fallback entirely.
- Added physical canonical-root redirect rejection, normalized Windows device
  prefixes, and retained containment checks rather than permitting aliases outside
  the authorized root.
- Removed automatic video-frame moves, layout normalization and LLM-step migration.
  No runtime reader performs historical copy/merge/rename/delete.
- Corrected optional Play action-tree arguments that still referenced workspace
  runtime directories; moved preview-cache writes out of Python source directories.
- Constrained symbolic memory overrides, vocabulary exports, identity readers,
  runner exports and Prolog scratch files.
- Guarded pooler control/status/log/lock paths and queued source-image references.
  Explicit legacy scan roots are rejected; whole-home scans exclude legacy todos.
  Historical unavailable control selections are reported without rewriting them.
  Explicit logical `data/...` reselection normalizes to the canonical physical path.
- Both Play implementations reject workspace-local silo writes and mutations of
  legacy sequence families. Their catalogs mark legacy entries read-only.
  Bulk mutations validate all selected directories before changing anything.
  Materialization and explicit rename-reference updates resolve logical asset URLs,
  rather than joining those URLs to the configuration workspace.
- Catalog/provider/cache/record identities and execution discovery use the shared
  store. Creating workspace remains provenance only. Clearing shared recordings
  detaches active recorders using that physical store, not only one workspace.

### Evidence and remaining boundary conditions

Full path-boundary checkpoint (before the browser-identity follow-up below):
**422 passed, 1 skipped**, in 383.08 seconds.
Log: `.codex/canonical-gate-final.log`. It includes all Omega API tests,
memory/cache tests, three symbolic ARC regression modules, and workbench
knowledge-data, knowledge-artifact and Markdown-navigation compatibility tests.
`git diff --check` passed.
The strengthened shared-save identity and mocked-pooler log assertions then
passed with the full boundary module and Markdown checks: **38 passed**,
`.codex/canonical-gate-receipt.log`. No production code changed between those
two successful validation runs.

`test_shared_physical_memory_preserves_workspace_attribution` covers both Shape
and Object records through two actual temporary workspace directories: shared
catalog revisions/cache files, preserved creating-workspace metadata, stable
record/concept/revision identity when the other workspace saves the same payload,
and visibility of new second-workspace saves from the first workspace.
`test_two_workspaces_share_sequences_caches_locks_and_executions` checks equal
sequence catalogs, provider IDs, one visual cache, shared locks/lane keys and
cross-workspace execution status.

Four sequence-free setup/read tests cover global/run × Shape/Object, enforce
no sequence enumeration for saved-area browsing, preserve Save To/Look In, and
reject explicitly invalid sequences. Writer tests cover root overrides, canonical
redirects, legacy write blocking/preservation, configured caches, pooler controls,
status/log/locks, thumbnails, exports and scratch. Pooler process creation is
mocked in the log test; no server/pooler is actually started.

No known noncompliant writer remains in the audited active backend chains.
The one skipped test requires Windows symlink privileges; deterministic
containment/prefix/redirect tests passed, but that OS-level symlink case is not
claimed as executed. Historical incompatible files remain untouched and are
unavailable until explicit operator selection/migration. Existing loaded servers
have **not** been restarted or verified against this code. Backend storage,
snapshot-authority and frontend correction checkpoints have now passed as
documented below. No backend implementation blocker remains. The coordinator
owns the next integrated tests, Git actions, restart and live acceptance, and is
authorized to proceed automatically without another approval request.
No Git write, live-data mutation,
frontend integration or live data-producing acceptance was performed.

### Inspector and shared-seam corrections complete

The inspector owner's earlier read-only audit identified these violations,
subsequently corrected by the frontend owners:

- `frontend/apps/workbench/src/components/ShapeObjectInspector.model.ts:115,120`:
  `recordIdentity` / `areaIdentity` include workspace provenance in identity.
- The same model at line 145: `exactReferencedRecord` uses workspace matching.
- `frontend/apps/workbench/src/components/ShapeObjectInspectorBrowser.tsx:39`:
  rejects a record when `source.workspaceId != area.workspaceId`.
- The same browser at line 101: exact-reference location filtering uses workspace.
- `ShapeObjectInspector.model.test.mjs:157–170`: expectations treat differing
  workspace provenance as distinct identity or an unresolved reference.

Those predicates contradicted the transport contract above even if some native
responses happen to use the same `omega_vision` compatibility value.
The coordinator has authorized this narrow correction **now, in parallel, as
part of the storage gate—not after the gate**. It is owned solely by the
inspector child within its six new files; no backend, Git or server changes are
delegated to that child. Remove workspace from identity/ownership/reference
predicates; preserve provenance for display and preserve strict authorized
provider/location/record/kind/revision checks. Replace the contrary expectations
with cross-workspace shared-identity/resolution regressions and negative tests
for each real boundary. Browsing must still leave Save To/Look In untouched.
No inspector files were edited as part of this backend handoff.
The agreed canonical callback identity is
`(providerRef, memoryLocationId, memoryKind, recordUid, revision)`;
`workspaceId` is provenance/display-only, never ownership, identity or an access
partition. Historical workspace provenance remains valid without partitioning.
Final coordinator report: the child applied the narrow correction only in
`ShapeObjectInspector.model.ts`, `ShapeObjectInspectorBrowser.tsx` and
`ShapeObjectInspector.model.test.mjs`. Strict provider/location/kind/record/revision
matching and displayed provenance are retained, including the existing Nowhere
catalog-provider/source distinction. Combined frontend correction validation is
**39 focused tests passed, TypeScript passed, production build passed**, reported
by the coordinator. Coverage includes shared per-page Nowhere payload/queue across
workspaces, distinct tabs, reset and retired-response isolation, and strict
provider/location/kind/record/revision matching. Frontend validation is complete,
not pending; this backend owner did not independently rerun those frontend checks.
The coordinator's next integrated/live verification has not yet been performed.

Transport follow-up: **13 passed** (the two Shape/Object shared-save cases plus
Markdown-navigation checks), `.codex/transport-provenance-gate.log`.
The backend regression explicitly verifies source/reference workspace `example`
differs from area workspace `omega_vision` while provider/location and shared
record identities agree. This historical transport checkpoint supplements the
completed frontend and latest backend authority receipts.

### Shared browser snapshot transport — backend correction verified

The latest provider/root requirement **supersedes the earlier unbound v1
snapshot contract**. One opaque RAM snapshot per browser page across caller
workspace switches is supported using the bound v2 envelope described below.
`memorySessionId` remains the same page token, while request `workspaceId` remains
the actual caller workspace used for configuration and authorization. The
snapshot's `workspaceId` is retained provenance, not an acceptance restriction.
Rehydrating and returning an unchanged bound snapshot under another caller
preserves the exact wire string and integrity hash. Output keys remain
`(sequenceId, frameId, step)` with no workspace component.

The follow-up audit found and corrected a backend identity dependency:
`VolatileMemory.put` formerly hashed `source.workspaceId` into new record IDs.
New volatile IDs now exclude only that workspace provenance; page token,
provider, kind, payload revision, concept and remaining source context still
distinguish records. An equivalent re-save from another caller reuses the
existing record and its creating-workspace provenance. Within an authorized
provider/root-bound envelope, records using the former volatile-ID calculation
remain strictly validated and retain their exact IDs/provenance; a RAM-only
canonical-ID index supports subsequent re-saves without rewriting historical
references. Unbound outer v1 snapshots are not automatically migrated or accepted:
their physical origin cannot be verified. Invalid IDs/revisions/envelopes,
tampered hashes and other page tokens remain rejected.

The existing Nowhere transport distinction is unchanged: its catalog area
advertises provider `session`, while a record's source retains the native
provider/provenance. Preserve the explicit Nowhere adapter; this is not permission
to equate arbitrary providers.

Latest validation: **77 passed, 1 skipped**, `.codex/browser-identity-final.log`,
covering complete memory-location and storage-boundary suites plus browser-owned
semantic execution cases. New Shape/Object API regressions pass one snapshot
between two real temporary workspace directories, retain record and output
identities and original provenance, verify the Nowhere provider distinction,
reject another page token, invalid sequence and unauthorized location, and check
that neither memory nor output payloads appear on disk. Unit coverage also checks
provider/kind/revision/game/level/run distinctions and old snapshot ID preservation.
The skip is the unchanged Windows symlink-privilege limitation.

The coordinator also completed the shared-seam corrections: `MemorySession.ts`
now uses one per-page snapshot/error/serialized mutation queue across caller
workspaces; `MemorySetupModel.memoryTree` no longer partitions stable IDs by
workspace; `MemorySetupHost` no longer equates workspace provenance with referenced
shape ownership. These are included in the completed frontend validation above.
The backend transport is ready for the coordinator's next integration phase.

### Provider/root/session binding — opaque snapshot v2

The backend is the snapshot schema authority. Each new outer envelope carries:

- `schemaVersion: 2`;
- `storageContext.providerRef`: the expected native provider derived by the server;
- `storageContext.rootId`: a deterministic fingerprint of the resolved,
  normalized physical shared root—not a caller workspace, exposed root path,
  or configurable client authority;
- the existing page `sessionId`, provenance `workspaceId`, opaque inner memory,
  transient outputs and content-integrity hash.

`video_import_semantics.browser_memory` resolves the actual caller workspace
through the authorized canonical storage resolver and supplies the expected
provider/root to `BrowserMemory`. Incoming binding must match exactly, as must
the expected page token. Every contained memory record must also have the expected
source provider. These checks run on read and before response serialization.
Another provider/root fails with HTTP 403; another page token, unbound v1 or
invalid integrity/schema fails with HTTP 422. V1 receives an explicit
`reset page memory explicitly` message; its payload is not silently discarded,
rebound, upgraded or persisted. Reset/reload starts a fresh page snapshot/token.
Frontend code continues to store/forward an opaque string, without decoding it.

The root fingerprint and content hash are **not credentials or proof of server
issuance**. They enforce declared transport-context consistency against
server-derived expectations; current filesystem/provider grants still authorize
access. No server-global payload cache, payload signing store or persistence is
introduced.

Latest authority validation: **33 passed**, `.codex/snapshot-authority-gate.log`.
Alongside same-page cross-workspace Shape/Object save/setup/read/output continuity,
negative API cases replace provider/root/session declarations and recompute the
public content hash. They remain rejected. A correctly hashed inner record from
a different provider is also rejected under an otherwise matching outer envelope.
Unit cases reject a genuinely different expected root/provider and reject
wrong-provider or rotated-session records before response serialization.
The suite includes browser-owned semantic execution, queued-session handling,
disconnect cleanup, legacy volatile-record identity and RAM-only checks.
Full memory/cache/boundary and Markdown follow-up: **96 passed, 1 skipped**,
`.codex/snapshot-boundary-final.log`; `git diff --check` passed.
The skip remains the unavailable Windows symlink privilege. Frontend integration
must surface the v1 reset-required error without silently replacing the old
snapshot with `null`; explicit reset/reload may create a fresh v2 snapshot.

### Prior snapshot-binding checkpoint

- Latest backend authority/execution coverage: **33 passed**.
- Latest complete memory/cache/boundary/Markdown coverage: **96 passed, 1 skipped**.
- Latest frontend correction receipt from coordinator: **39 passed**, TypeScript
  and production build passed.
- Whitespace validation: `git diff --check` passed.
- No known backend implementation blocker remains. The one skipped OS-level
  symlink test lacks Windows privileges; deterministic containment/root-redirect
  coverage passed. V1 browser snapshots require explicit reset/reload, not a
  silent downgrade or empty replacement.
- Production is not yet running this implementation. The coordinator reports the
  current API is still old **PID 48832**, with no restart yet. The coordinator owns
  and may automatically proceed with full integration/tests/Git/restart/live
  acceptance; no further approval is requested by this backend handoff.
- Backend work is frozen to the allowlist above. No additional unrelated audit,
  repeated full suite, frontend edit, Git write, server action or live-data
  migration is included.

### Corrected frozen receipt after independent review

The three reopened backend findings are fixed. This correction changed only:

- `python/omega_vision/services/video_import_api.py`
- `python/omega_vision/services/video_import_semantics.py`
- `tests/omega_vision_api/test_storage_boundary.py`
- This design document.

The overall 34-file allowlist above is unchanged. The current physical destination
table remains applicable; these corrections close additional paths into it:

1. Transform output directories, claims, known final targets, existing nested
   descendants, TODO targets and fresh-output targets are resolved and checked
   before their associated writes/runners. A redirected descendant cannot escape
   the unit/step directory, the shared root or the writable sequence families.
   The actual claim destination remains
   `H\<recordings-or-curated>\<sequence-unit>\<transformation-step>\<doer>\claim.json`,
   with results beside it. Twelve deterministic cases cover directory, claim,
   result and nested redirects into an external root, a read-only legacy family,
   or another canonical sequence. They assert no mkdir/claim/runner/TODO side
   effect. This is filesystem-topology validation, not a claim of race-proof
   sandboxing against concurrent malicious filesystem replacement or plugins.
2. Canonical recognition catalog ID is `curated/recognition_reduce`, whose
   `data/<id>` resolves to exactly its advertised directory
   `H\curated\recognition_reduce`. Execution and manifest adapters agree.
   Existing `H\recognition_reduce` remains a separate read-only legacy entry;
   nothing is merged or moved. The existing shared catalog cache at
   `H\.cache\visual_sequences.json` incorporates a catalog-identity revision
   salt so old incorrect IDs cannot survive either memory or disk cache hits.
   No cache infrastructure or memory-cache schema was redesigned.
3. Resolved physical sequence identity now precedes run scopes and preferences,
   including imported-recording provenance. Canonical, prefixed and
   double-prefixed references share destination IDs and preferences at
   `H\runtime\memory-settings\<shared-context-hash>.json` across caller workspaces.
   Game/level/run organization is retained. Recognized historical alias
   preferences are read without copying; explicit Nowhere settings are preserved,
   legacy alias areas are unavailable, and conflicting historical preferences
   require explicit selection/migration instead of persistent defaults.

Focused correction evidence:

- **91 passed**, boundary/transform/direct-call/preprocessing/pooler regression
  coverage: `.codex/review-three-focused.log`.
- **15 passed**, alias/game/level/run and imported-memory authorization follow-up:
  `.codex/review-alias-semantics-final.log`.
- **7 passed**, stale memory/disk recognition IDs and existing catalog cache/ETag
  coverage: `.codex/review-catalog-cache.log`.
- **21 passed**, required README backlink plus all three review-correction
  regressions: `.codex/review-doc-link-fix.log`. The missing backlink found by the
  coordinator's remaining-suite partition is fixed; its unrelated known local
  Codex plugin UI-page-count failure was not changed.
- `git diff --check` passed. Existing CRLF warnings were not normalized.
- These are distinct targeted invocations with overlapping coverage, not a
  summed count of unique tests. Prior broad results above remain historical.

**Remaining integration item, owned by the coordinator:** active
`frontend/packages/omega_vision_ui/src/components/VideoImportPage.tsx` still uses
the old `recognition_reduce` literal for `DEFAULT_IMAGE_SET` (around line 3396),
fallback selection (5395–5400), and canonical rich-matrix checks (10745,10789).
Update those canonical checks/defaults to the advertised canonical entry without
reclassifying explicit legacy references as writable. Otherwise a legacy sibling
can be chosen by default or the canonical sequence can lose its rich matrix.
The coordinator's earlier 39 frontend tests/TypeScript/build passed for the
workspace/session corrections; they predate and do not validate this new ID
integration. This backend owner made no frontend edits.

No known backend correction remains. Overall integration/live acceptance is not
declared complete: the coordinator owns that frontend follow-up and subsequent
tests/Git/restart/live acceptance. Last reported production process remains the
old API PID 48832; this owner did not start, stop or restart it. No live data was
migrated, merged, renamed or deleted.

### Mandatory contract included verbatim in this handoff

1. ONE shared physical Omega Vision data root: <repository>\data\omega_vision. All our data, memory, rules, events, executions, preferences, cache, logs and locks must be descendants. No sibling repo\data\recordings/runtime/knowledge/etc and no workspace-root Omega data writes.
2. ALL Visual Sequences are under ONLY omega_vision\recordings or omega_vision\curated. Retain curated spelling. importables is staging, not a sequence family. No new standalone video/arc_recordings/recognition_* sequence roots.
3. Workspaces DO NOT divide data physically OR logically. No omega_vision\workspaces\<id> namespace, workspace-specific catalogs/ownership filters or cache namespaces that divide the shared data. Workspace provenance/editor configuration is metadata only. Same assets and stable identities are visible across workspace switches. Game/level/run areas may organize the shared store.
4. Inspector gets real authorized areas from this shared root; area selection must not change Save To/Look In. Read-only saved-area browsing must not depend on unrelated sequence enumeration; sequence-specific actions still require valid context.
5. Nowhere stays current-browser-RAM-only; never persist/cache its payloads or relabel full payload copies as audit.
6. Preserve existing files/history. NO automatic migration, merge, rename or deletion of legacy data. Inventory incompatibilities and show unavailable historical settings honestly rather than silently substituting destinations.
7. Enforce these through shared resolver/writer helpers AND regression coverage: path containment for each writer/cache, two-workspace shared visibility/identity, only two canonical sequence families for new saves, no out-of-root/hidden-workspace fallback. Reject unsafe paths; do not weaken access checks. Do not declare compliant based only on changed labels.
