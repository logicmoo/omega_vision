from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
VIDEO_IMPORT_PAGE = (
    ROOT
    / "frontend"
    / "packages"
    / "omega_vision_ui"
    / "src"
    / "components"
    / "VideoImportPage.tsx"
)
PROLOG_DATA_INSPECTOR = VIDEO_IMPORT_PAGE.with_name("PrologDataInspector.tsx")
PROLOG_CLAUSE_EXPLORER = VIDEO_IMPORT_PAGE.with_name("PrologClauseExplorer.tsx")
PROLOG_CLAUSE_MODEL = VIDEO_IMPORT_PAGE.with_name("PrologClauseExplorerModel.ts")
PROLOG_CLAUSE_MODEL_TEST = VIDEO_IMPORT_PAGE.with_name("PrologClauseExplorerModel.test.mjs")
VIDEO_IMPORT_RECORDING_URL = VIDEO_IMPORT_PAGE.with_name("VideoImportRecordingUrl.ts")
VIDEO_IMPORT_RECORDING_URL_TEST = VIDEO_IMPORT_PAGE.with_name("VideoImportRecordingUrl.test.mjs")
VIDEO_IMPORT_NAVIGATION_URL = VIDEO_IMPORT_PAGE.with_name("VideoImportNavigationUrl.ts")
VIDEO_IMPORT_NAVIGATION_URL_TEST = VIDEO_IMPORT_PAGE.with_name("VideoImportNavigationUrl.test.mjs")
VISUAL_SEQUENCE_LOAD_GATE = VIDEO_IMPORT_PAGE.with_name("VisualSequenceLoadGate.ts")
VISUAL_SEQUENCE_LOAD_GATE_TEST = VIDEO_IMPORT_PAGE.with_name("VisualSequenceLoadGate.test.mjs")
VISUAL_GROUP_TREE_MODEL = VIDEO_IMPORT_PAGE.with_name("VisualGroupTreeModel.ts")
VISUAL_GROUP_TREE_MODEL_TEST = VIDEO_IMPORT_PAGE.with_name("VisualGroupTreeModel.test.mjs")
VISUAL_REGION_HIGHLIGHT_MODEL = VIDEO_IMPORT_PAGE.with_name("VisualRegionHighlightModel.ts")
VISUAL_REGION_HIGHLIGHT_MODEL_TEST = VIDEO_IMPORT_PAGE.with_name("VisualRegionHighlightModel.test.mjs")
VISUAL_REGION_HIGHLIGHT_OVERLAY = VIDEO_IMPORT_PAGE.with_name("VisualRegionHighlightOverlay.tsx")
COMPACT_TRANSFORM_STATUS_MODEL = VIDEO_IMPORT_PAGE.with_name("CompactTransformStatusModel.ts")
COMPACT_TRANSFORM_STATUS_MODEL_TEST = VIDEO_IMPORT_PAGE.with_name("CompactTransformStatusModel.test.mjs")
TRANSFORM_TEXT_BAND_MODEL = VIDEO_IMPORT_PAGE.with_name("TransformTextBandModel.ts")
VIDEO_IMPORT_API = ROOT / "python" / "omega_vision" / "services" / "video_import_api.py"
VIDEO_IMPORT_STYLES = (
    ROOT
    / "frontend"
    / "packages"
    / "omega_vision_ui"
    / "src"
    / "styles"
    / "video_import.css"
)
MODEL_OPTION_DISPLAY = ROOT / "frontend" / "apps" / "workbench" / "src" / "components" / "modelOptionDisplay.ts"
COLORED_COMBOBOX = ROOT / "frontend" / "apps" / "workbench" / "src" / "components" / "ColoredTagCombobox.tsx"
CHAT_CONVERSATION = ROOT / "frontend" / "apps" / "workbench" / "src" / "components" / "ChatConversation.tsx"
RESOURCE_SOURCE_EDITOR = (
    ROOT / "frontend" / "apps" / "workbench" / "src" / "components" / "ResourceSourceEditor.tsx"
)
WORKSPACE_FILE_CONTROLS = (
    ROOT / "frontend" / "apps" / "workbench" / "src" / "components" / "WorkspaceResourceFileControls.tsx"
)
OPERATION_EDITOR_STYLES = (
    ROOT / "frontend" / "apps" / "workbench" / "src" / "styles" / "operation_editor.css"
)
WORKBENCH_PAGE = ROOT / "frontend" / "apps" / "workbench" / "src" / "pages" / "FilesystemWorkbenchPage.tsx"
SPRITE_VIEWER_PAGE = ROOT / "frontend" / "apps" / "workbench" / "src" / "components" / "SpriteViewerPage.tsx"


def test_preprocessing_shared_shell_is_visible_in_primary_subviews() -> None:
    page = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    styles = VIDEO_IMPORT_STYLES.read_text(encoding="utf-8")
    assert page.count('{preprocessingSection}') == 1
    assert page.count('section("preprocessing",') == 1
    for subview in ("recognition", "objects", "frames"):
        assert f'[data-subview="{subview}"] > [data-section="preprocessing"]' in styles
    assert "preprocessingSequenceId(" in page
    assert 'visualSequenceReady && resolvedPreprocSequenceId === `data/${selectedImageSet}`' in page
    assert 'title="add step before"' in page
    assert 'data-step-id={step.stepId}' in page
    assert "preprocPendingSave.current?.()" in page
    assert "if (!visualSequenceLocationMatchesUrl(window.location.href, visualSequenceLocation)) return" in page
    assert 'disabled={busy || !preprocContextReady}' in page


def test_colored_combobox_is_shared_by_chat_and_video_models() -> None:
    combo = COLORED_COMBOBOX.read_text(encoding="utf-8")
    chat = CHAT_CONVERSATION.read_text(encoding="utf-8")
    video = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    display = MODEL_OPTION_DISPLAY.read_text(encoding="utf-8")

    assert "export function ColoredTagCombobox" in combo
    assert 'role="listbox"' in combo
    assert 'className="colored-combobox-tag"' in combo
    assert "disabled={description.disabled}" in combo
    assert "ColoredTagCombobox" in chat
    assert "function StreamPicker" not in chat
    assert video.count("<ColoredTagCombobox") >= 8
    assert '"imageOutput"' in display
    assert '"image output"' in display


def test_user_preview_picker_has_no_number_parameter() -> None:
    source = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")

    assert '{groupKind !== "user" && (' in source
    assert 'id === "select:user" ? {} : { n: "" }' in source
    assert 'step.entryId === "select:user" ? { ...step, params: {} } : step' in source

    user_picker = source.index('if (groupKind === "user")')
    numbered_picker = source.index(
        "const count = Math.max(1, Math.min(frames.length, Number(groupCount) || 6));"
    )
    assert user_picker < numbered_picker


def test_direct_controls_replace_extractor_reduce_buttons_and_keep_scoped_todos() -> None:
    source = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")

    assert 'className="video-import-global-extractor"' not in source
    assert "▶ Reduce all" not in source
    assert 'className="video-import-direct-calls"' in source
    assert "{[0, 1].map((slot)" in source
    assert 'aria-label={`Direct process/doer ${slot + 1}`}' in source
    assert "`${API}/direct-calls`" in source
    assert 'className="video-import-todo-pooler-row"' in source
    assert 'const PARTS_EXTRACTOR_DOERS = ["python_opencv"]' in source
    assert "parts_extraction_0/python_scikit" not in source
    assert "parts_extraction_0/shape_finder_prolog" not in source
    assert 'const showAllPartsExtractors = partsExtractorSel === "__all__"' in source
    assert "const displayCells = [" in source
    assert 'className="video-import-todo-preview-count"' in source
    assert "allItems.slice(0, requested)" in source
    assert '"⊕ Add/Merge todos"' in source
    assert '"↻ Fresh todos"' in source
    assert 'mergeTodos: mode === "merge"' in source
    assert 'freshTodos: mode === "fresh"' in source
    # Per-transform stats moved to the independent bottom text band, whose honest
    # labels live in the pure TransformTextBandModel.
    text_band_model = TRANSFORM_TEXT_BAND_MODEL.read_text(encoding="utf-8")
    assert "summarizeTransformCell(" in source
    assert 'className="video-import-transform-textband"' in source
    assert '["visualGroupCount", "v groups"]' in text_band_model
    assert '["smallFeatureCount", "small marks"]' in text_band_model
    assert '["observationCount", "stable observations"]' in text_band_model
    assert '"group_acceptance_0"' in source
    assert '"group_acceptance_prolog"' in source
    assert '"observation_identity_0"' in source
    assert '"content_hash"' in source
    assert 'dependsOn: ["group_acceptance_0/group_acceptance_prolog"]' in source


def test_prolog_inspector_loads_real_sources_into_reusable_clause_explorer() -> None:
    page = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    inspector = PROLOG_DATA_INSPECTOR.read_text(encoding="utf-8")
    explorer = PROLOG_CLAUSE_EXPLORER.read_text(encoding="utf-8")
    model = PROLOG_CLAUSE_MODEL.read_text(encoding="utf-8")
    styles = VIDEO_IMPORT_STYLES.read_text(encoding="utf-8")

    assert 'sources={(it.transforms || [])' in page
    assert 'String(transform.resultPath).toLowerCase().endsWith(".pl")' in page
    assert "workspaceId={workspaceId}" in page
    assert 'from "./PrologClauseExplorer"' in inspector
    assert "<PrologClauseExplorer" in inspector
    assert "fetch(definition.sourceUrl" in inspector
    assert 'dialect: "prolog" as const' in inspector
    assert "readOnly: true" in inspector
    assert "availableSources.map((definition)" in inspector
    assert 'text: document?.text || ""' in inspector
    assert "loadedSourceCount" in inspector
    assert "retryFailedSources" in inspector
    assert "failed.map((definition) => loadSource(definition))" in inspector
    assert "const next = new Map(previous)" in inspector
    assert "setReload" not in inspector
    assert "rootLimit={30}" in inspector
    assert 'role="tablist" aria-label="Loaded symbolic source files"' in explorer
    assert "function sourceDisplayName" in explorer
    assert "{sourceDisplayName(source)}" in explorer
    tabs_start = styles.rindex(".pce-tabs {")
    tabs_end = styles.index(".pce-tabs button", tabs_start)
    assert "overflow-x: auto" in styles[tabs_start:tabs_end]
    assert 'from "@app/components/ResourceSourceEditor"' in explorer
    assert "contentReadOnly" in explorer
    assert 'defaultTextLang={editorLanguage}' in explorer
    assert 'revealLine={syntax === "prolog" ? locationLine : undefined}' in explorer
    for value, label in (("prolog", "Prolog syntax"), ("metta", "MeTTa syntax"), ("json", "JSON syntax")):
        assert f'<option value="{value}">{label}</option>' in explorer
    for field in ("predicate:", "arity:", "arguments:", "prolog:", "metta:"):
        assert field in model
    assert "video-import-prolog-formats" not in inspector
    assert 'placeholder="Filter predicates, atoms, or clause text' in explorer
    assert "Copy visible" not in explorer


def test_visual_sequence_selection_round_trips_through_recording_url_state() -> None:
    page = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    url_state = VIDEO_IMPORT_RECORDING_URL.read_text(encoding="utf-8")
    executable_test = VIDEO_IMPORT_RECORDING_URL_TEST.read_text(encoding="utf-8")

    assert 'const RECORDING_QUERY_PARAMETER = "recording"' in url_state
    assert 'const GAME_QUERY_PARAMETER = "game"' in url_state
    assert "url.searchParams.set(RECORDING_QUERY_PARAMETER, location.recording)" in url_state
    assert "url.searchParams.set(GAME_QUERY_PARAMETER, location.game)" in url_state
    assert "url.searchParams.delete(GAME_QUERY_PARAMETER)" in url_state
    assert "url.searchParams.delete(RECORDING_QUERY_PARAMETER)" in url_state
    assert "game-backed Visual Sequence updates preserve every unrelated query parameter" in executable_test
    assert "one-image non-game Visual Sequence uses its catalog-stable id" in executable_test
    assert "legacy full-path recording links resolve then canonicalize" in executable_test
    assert "catalog resolution rejects unknown, ambiguous, and unsafe locations" in executable_test
    assert "visualSequenceLocationFromUrl(window.location.href)" in page
    catalog = VIDEO_IMPORT_PAGE.with_name("VisualSequenceCatalog.ts").read_text(encoding="utf-8")
    assert "loadVisualSequenceCatalog(workspaceId" in page
    assert "/visual-sequences?workspaceId=" in catalog
    assert "data.visualSequences ?? data.sets" in catalog
    assert "A Visual Sequence may contain one image or many" in page
    assert 'type RecordingHistoryMode = "none" | "push" | "replace"' in page
    assert 'selectRecording(recording, "push")' in page
    assert 'selectRecording(currentRecording, "replace")' in page
    assert 'importArcRecording(selectedRecording, "none")' in page
    assert 'selectVisualSequence(sequence, "push")' in page
    assert 'writeVisualSequenceLocation(visualSequenceLocation, "replace")' in page
    assert 'window.addEventListener("popstate", restoreVisualSequenceFromHistory)' in page
    assert 'window.removeEventListener("popstate", restoreVisualSequenceFromHistory)' in page
    assert "Visual Sequence unavailable" in page
    assert "Unavailable recording" in page
    assert "<select className=\"video-import-catalog\" value={selectedRecording}" in page


def test_recognition_navigation_round_trips_without_replaying_actions() -> None:
    page = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    navigation = VIDEO_IMPORT_NAVIGATION_URL.read_text(encoding="utf-8")
    executable_test = VIDEO_IMPORT_NAVIGATION_URL_TEST.read_text(encoding="utf-8")

    assert 'const NAVIGATION_QUERY_PARAMETER = "nav"' in navigation
    assert "url.searchParams.set(NAVIGATION_QUERY_PARAMETER, canonical.join(\",\"))" in navigation
    assert "resolveRecognitionNavigation" in navigation
    assert "rootIndex = normalized.findIndex" in navigation
    assert "navigationPathFromUrl(window.location.href)" in page
    assert 'writeRecognitionNavigation([tab], "push")' in page
    assert 'selectExtractionNavigationRow(String(it.id), !open)' in page
    assert "selectPrologNavigation(rowKey, t)" in page
    assert 'writeRecognitionNavigation(resolved.canonicalPath, "replace")' in page
    assert "Recognition nav reads tab names case-insensitively" in executable_test
    assert "nested extraction and Prolog paths resolve without encoding source paths" in executable_test
    assert "stale prefixes and suffixes stop at the deepest valid destination" in executable_test
    assert "saved back and forward URLs independently restore their destinations" in executable_test
    for mutating_action in ("Fresh todos", "Add/Merge todos", "fetch(", "method:"):
        assert mutating_action not in navigation


def test_large_visual_sequences_require_explicit_non_mutating_confirmation() -> None:
    page = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    gate = VISUAL_SEQUENCE_LOAD_GATE.read_text(encoding="utf-8")
    executable_test = VISUAL_SEQUENCE_LOAD_GATE_TEST.read_text(encoding="utf-8")
    styles = VIDEO_IMPORT_STYLES.read_text(encoding="utf-8")

    assert "VISUAL_SEQUENCE_CONFIRMATION_THRESHOLD = 800" in gate
    assert "Number(entry.imageCount || 0) > VISUAL_SEQUENCE_CONFIRMATION_THRESHOLD" in gate
    assert "the confirmation threshold allows 800 and gates 801" in executable_test
    assert "large sequence confirmation reports the exact formatted count" in executable_test
    assert "const [pendingVisualSequence, setPendingVisualSequence]" in page
    assert "requiresVisualSequenceConfirmation(entry, isVisualSequenceConfirmed(entry))" in page
    assert "setPendingVisualSequence" in page
    assert "commitVisualSequence(pendingVisualSequence.entry, pendingVisualSequence.historyMode)" in page
    assert 'role="dialog"' in page
    assert 'aria-modal="true"' in page
    assert '<button type="button" autoFocus onClick={cancelVisualSequence}>Cancel</button>' in page
    assert "It does not run reductions" in page
    assert ".video-import-confirm-backdrop" in styles
    assert ".video-import-confirm-dialog" in styles


def test_visual_and_symbolic_groups_are_independent_interleaved_peers() -> None:
    page = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    model = VISUAL_GROUP_TREE_MODEL.read_text(encoding="utf-8")
    executable_test = VISUAL_GROUP_TREE_MODEL_TEST.read_text(encoding="utf-8")
    styles = VIDEO_IMPORT_STYLES.read_text(encoding="utf-8")

    assert "export function interleaveVisualGroupClaims" in model
    assert "sharedCount(current, right)" in model
    assert "right.kind !== current.kind" in model
    assert "overlapping V and W claims are adjacent peers with deterministic alternation" in executable_test
    assert "claims remain independent data with no inferred connector fields" in executable_test
    assert 'kind: "v"' in page
    assert 'kind: "w"' in page
    assert 'kind: "g"' in page
    assert "const acceptanceCell = cells.find" in page
    assert "Array.isArray(t.acceptedGroups)" in page
    assert "const activeStrokeGroups = finalGroupClaims.length" in page
    assert "const activeGroupColorOf = finalGroupClaims.length ? finalGroupColorOf : groupColorOf" in page
    assert "const peerGroupClaims = interleaveVisualGroupClaims" in page
    assert "visualGroupDisplayRows(claims, groupLayerFilter)" in page
    assert "finalGroupColorOf.get(finalClaim.id)" in page
    assert "underlying V/W/G facts remain independent" in page
    assert "visualGroupClaims.length > 0 && !groupingCell" in page
    assert "renderPeerGroupTree(visualGroupClaims)" in page
    assert "renderPeerGroupTree(peerGroupClaims)" in page
    assert "Independent peer claim; overlap ordering is display-only." in page
    assert "setHover([pid])" in page
    assert "mapsTo" not in page
    assert ".video-import-reduce-groupnode.is-v" in styles
    assert ".video-import-reduce-groupnode.is-w" in styles
    assert ".video-import-reduce-groupnode.is-g" in styles
    assert ".video-import-reduce-groupnode.is-combined" in styles
    assert ".video-import-reduce-grouptree li button.is-hover" in styles
    assert 'aria-label="Group layers"' in page
    for value, label in (("v", "V"), ("w", "W"), ("g", "G"), ("all", "W+V+G")):
        assert f'<option value="{value}">{label}</option>' in page
    assert 'window.localStorage.getItem("videoImport.groupLayerFilter")' in page
    assert 'window.localStorage.setItem("videoImport.groupLayerFilter", groupLayerFilter)' in page
    assert "G · final groups pending" in page
    assert "layer filters keep only anchors while retaining exact equality aliases" in executable_test


def test_region_highlights_use_persisted_geometry_on_real_images() -> None:
    page = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    model = VISUAL_REGION_HIGHLIGHT_MODEL.read_text(encoding="utf-8")
    model_test = VISUAL_REGION_HIGHLIGHT_MODEL_TEST.read_text(encoding="utf-8")
    overlay = VISUAL_REGION_HIGHLIGHT_OVERLAY.read_text(encoding="utf-8")
    api = VIDEO_IMPORT_API.read_text(encoding="utf-8")
    styles = VIDEO_IMPORT_STYLES.read_text(encoding="utf-8")

    assert 'cell["geometryPath"] = _data_rel_of(root, geometry)' in api
    assert 'cell["geometryRevision"]' in api
    assert "String(transform.geometryRevision || \"\")" in page
    assert 'fetch(url, { cache: "no-store" })' in page
    assert "protectedGeometryKeys.has(key)" in page
    assert "Math.max(0, 11 - protectedEntries.length)" in page
    assert "String(candidate.id) === expandedReduceId" in page
    assert "loadReduceGeometry(geometryPath, geometryRevision, true)" in page
    assert 'existing.status !== "unavailable"' in page
    assert "<VisualRegionHighlightOverlay" in page
    assert "<RegionHighlightLayer" in page
    assert "activeHighlightMembers(selArr, hoveredArr)" in page
    assert "togglePinnedMembers(previous[rowKey] || [], ids, additive)" in page
    assert "sanitizePinnedHighlights(current, validByRow)" in page
    assert "onMouseEnter={() => setHover(members)}" in page
    assert "onMouseLeave={clearHover}" in page
    assert "export function resolveRegionHighlight" in model
    assert "details?.smallFeature?.pixelRuns" in model
    assert "geometry?.smallFeatures?.[featureKey]?.pixelRuns" in model
    assert "single region resolves legacy numeric polygon keys" in model_test
    assert "group union resolves every V W or G member" in model_test
    assert "equal aliases toggle the same underlying pinned member set" in model_test
    assert "hover is ephemeral while pinned selection survives hover leave" in model_test
    assert "frame changes remove stale region selections" in model_test
    assert "source coordinates stay aligned" in model_test
    assert 'pointerEvents="none"' in overlay
    assert ".video-import-region-highlight-overlay" in styles
    assert ".video-import-region-highlight-halo" in styles
    assert ".video-import-region-highlight-unavailable" in styles
    assert ".video-import-reduce-stage.is-submitted .video-import-region-preview .video-import-reduce-stageimg" in styles
    assert "width: 100%;" in styles


def test_metadata_transforms_render_as_compact_real_status_lines() -> None:
    page = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    model = COMPACT_TRANSFORM_STATUS_MODEL.read_text(encoding="utf-8")
    model_test = COMPACT_TRANSFORM_STATUS_MODEL_TEST.read_text(encoding="utf-8")
    styles = VIDEO_IMPORT_STYLES.read_text(encoding="utf-8")

    assert 'const compactMetadataKinds: CompactMetadataKind[]' in page
    assert '"group_acceptance_0"' in page
    assert '"observation_identity_0"' in page
    assert "!compactMetadataKinds.includes" in page
    assert "{renderCompactMetadata(it, inputRel)}" in page
    assert 'aria-label="Frame metadata transforms"' in page
    assert "compactTransformStatus(" in page
    assert "selectPrologNavigation(rowKey, transform)" in page
    assert "Click to inspect the real result source." in page
    assert "G acceptance: done · count unavailable" in model
    assert "Observation IDs: done · count unavailable" in model
    assert "completed G acceptance shows real mode counts" in model_test
    assert "completed observations show the persisted stable count" in model_test
    assert "missing legacy metadata stages stay visible without fake counts" in model_test
    assert "queued running error and stale states remain honest" in model_test
    assert ".video-import-compact-metadata-line.is-running" in styles
    assert ".video-import-compact-metadata-line.is-error" in styles
    assert ".video-import-compact-metadata-line.is-stale" in styles
    assert ".video-import-compact-metadata-line.is-missing" in styles


def test_debug_visual_runs_and_displays_immediately_after_turtle() -> None:
    page = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    styles = VIDEO_IMPORT_STYLES.read_text(encoding="utf-8")

    assert "const visualCells = cells.filter" in page
    assert 'String(cell.name) !== "parts_debug_0"' in page
    assert 'String(cell.name) === "parts_debug_0"' in page
    assert page.index('String(cell.name) !== "parts_debug_0"') < page.index(
        'String(cell.name) === "parts_debug_0"'
    )
    assert 'String(t.name) === "parts_debug_0" && t.debugImage' in page
    assert 'className="video-import-region-preview is-debug-comparison"' in page
    assert "<VisualRegionHighlightOverlay" in page
    # The debug note and non-visual state text moved to the bottom text band model.
    text_band_model = TRANSFORM_TEXT_BAND_MODEL.read_text(encoding="utf-8")
    assert "compare beside Turtle · same source geometry" in text_band_model
    assert 'error · ${String(transform.error || "transform failed")}' in text_band_model
    assert 'className="video-import-transform-textband"' in page
    assert 'dependsOn: [`parts_extraction_0/${partsExtractorSel}`, "turtle_programs/turtle_programs_prolog"]' in page
    assert 'priority: 50, type: "ui"' in page
    assert ".video-import-debug-comparison-image" in styles
    assert "width: 150px;" in styles
    assert "height: 150px;" in styles


def test_prolog_clause_explorer_matches_supplied_control_surface() -> None:
    explorer = PROLOG_CLAUSE_EXPLORER.read_text(encoding="utf-8")
    styles = VIDEO_IMPORT_STYLES.read_text(encoding="utf-8")

    assert "useState<Set<string>>(new Set())" in explorer
    assert "if (next.has(key)) next.delete(key)" in explorer
    assert "else next.add(key)" in explorer
    assert "rows.slice(0, visibleCount)" in explorer
    assert "renderGroupChildren(group)" in explorer
    assert "partitionClausesByArgument(group.clauses, argumentIndex)" in explorer
    assert "planExpandMost(" in explorer
    assert "partitionRowsKey(group.key, argumentIndex)" in explorer
    assert "Math.min(pageSize, rows.length - visibleCount)" in explorer
    assert "Math.min(pageSize, partitions.length - visibleParts)" in explorer
    assert "rootLimit: initialRootLimit = 30" in explorer
    for control in (
        "TSX control",
        "CSS",
        "Collapse all",
        "Expand most",
        "Edit facts",
        "File appearance",
        "Alphabetical",
        "Auto: best argument",
        "Always argument 1",
        "Always argument 2",
        "Never group by argument",
        "Tree when over",
        "Max parts / page",
        "Root max",
        "Predicate tree",
        "Only current file",
        "Link to file",
        "Matching clauses",
        "Edit source",
        "Sync tree",
        "Selection",
        "unique atoms",
    ):
        assert control in explorer
    assert 'event.key.toLowerCase() === "k"' in explorer
    assert '["ArrowUp", "ArrowDown", "ArrowLeft", "ArrowRight"]' in explorer
    assert "filterPredicateGroups(orderedGroups, query)" in explorer
    assert "orderPredicateGroups(fileOrderedGroups, predicateOrder)" in explorer
    assert "const matchingRows = matchingClauses" in explorer
    assert "setCurrentFile(source)" in explorer
    assert "setFileFocus(source)" in explorer
    assert "setMatching(false)" in explorer
    assert "if (linkToFile)" in explorer
    assert "setCurrentFile(clause.sourcePath)" in explorer
    matching_start = explorer.index("{matchingRows.map")
    matching_end = explorer.index("{!selectedPredicate", matching_start)
    matching_block = explorer[matching_start:matching_end]
    assert "selectMatchingClause(clause)" in matching_block
    assert "setCurrentFile(clause.sourcePath)" not in matching_block
    matching_selector = explorer[
        explorer.index("const selectMatchingClause"):
        explorer.index("const expandMost")
    ]
    assert "if (linkToFile)" in matching_selector
    assert "setCurrentFile(clause.sourcePath)" in matching_selector
    assert "setFileFocus(clause.sourcePath)" in matching_selector
    assert "setMatching(false)" in matching_selector
    assert 'aria-pressed={linkToFile}' in explorer
    assert 'setFileFocus("")' in explorer
    assert "setLimits(plan.limits)" in explorer
    tree_start = styles.rindex(".pce-tree {")
    tree_end = styles.index("}", tree_start)
    assert "overflow: auto" in styles[tree_start:tree_end]
    source_start = styles.index(".pce-source-editor .cm-scroller")
    source_end = styles.index("}", source_start)
    assert "overflow: auto" in styles[source_start:source_end]
    workspace_start = styles.index(
        ".pce-workspace {",
        styles.index("/* Clause Explorer acceptance layout"),
    )
    workspace_end = styles.index("}", workspace_start)
    assert "grid-template-columns: minmax(330px, 42%) 5px minmax(0, 1fr)" in styles[
        workspace_start:workspace_end
    ]
    assert '<div className="pce-divider" aria-hidden="true" />' in explorer
    assert ".pce-editor-dialog" in styles


def test_prolog_clause_parser_tracks_multiline_statement_locations() -> None:
    model = PROLOG_CLAUSE_MODEL.read_text(encoding="utf-8")
    executable_test = PROLOG_CLAUSE_MODEL_TEST.read_text(encoding="utf-8")

    assert "export function splitPrologStatements" in model
    assert "let lineComment = false" in model
    assert "let blockComment = false" in model
    assert 'if (char === "/" && next === "*")' in model
    assert "parens === 0" in model
    assert "brackets === 0" in model
    assert "braces === 0" in model
    assert "line: statement.line" in model
    assert "endLine: statement.endLine" in model
    assert "splitTopLevel(match[2])" in model
    assert "parser preserves multiline clauses" in executable_test
    assert "predicate order switches" in executable_test
    assert '["zeta/1", "alpha/1", "beta/1"]' in executable_test
    assert '["alpha/1", "beta/1", "zeta/1"]' in executable_test


def test_prolog_clause_paths_are_tooltips_and_file_sync_uses_shared_controls() -> None:
    explorer = PROLOG_CLAUSE_EXPLORER.read_text(encoding="utf-8")
    inspector = PROLOG_DATA_INSPECTOR.read_text(encoding="utf-8")
    model = PROLOG_CLAUSE_MODEL.read_text(encoding="utf-8")
    source_editor = RESOURCE_SOURCE_EDITOR.read_text(encoding="utf-8")
    file_controls = WORKSPACE_FILE_CONTROLS.read_text(encoding="utf-8")
    source_styles = OPERATION_EDITOR_STYLES.read_text(encoding="utf-8")
    explorer_styles = VIDEO_IMPORT_STYLES.read_text(encoding="utf-8")

    assert 'title={`${clause.sourcePath}:L${clause.line}\\n${rendered}`}' in explorer
    assert "title={source.name}" in explorer
    assert "<em>L{clause.line}</em>" in explorer
    assert "{clause.sourcePath}:{clause.line}" not in explorer
    assert "{clause.sourceLabel}:{clause.line}" not in explorer
    assert "<code>{sourcePath}</code>" not in inspector
    assert "path: clause.sourcePath" not in model
    assert "path: source.name" not in model
    assert "file: sourceBasename(clause.sourcePath)" in model
    assert "file: sourceBasename(source.name)" in model

    assert 'fileControlsContent={currentSource?.text || ""}' in explorer
    assert 'fileControls={currentSource && workspaceId && !matching && syntax === "prolog"' in explorer
    assert "relativePath: currentSource.name" in explorer
    assert 'variant: "compact"' in explorer
    assert "openHref: currentSource.sourceUrl" in explorer
    assert "readOnly: currentSource.readOnly === true" in explorer
    assert "onLoad: () => syncTree()" in explorer
    assert "if (currentSource.readOnly === true)" in explorer
    assert "await onReloadSource(currentSource)" in explorer
    assert "focusTreeClause(target)" in explorer
    assert "onReloadSource={reloadSource}" in inspector
    assert "fileControlsContent?: string" in source_editor
    assert "content={fileControlsContent ??" in source_editor
    assert "readOnly={contentReadOnly || fileControls.readOnly}" in source_editor
    assert "const frame = window.requestAnimationFrame(reveal)" in source_editor
    assert "const timer = window.setTimeout(reveal, 50)" in source_editor
    assert "revealRequestedLine(view)" in source_editor
    assert ">Reload From Origin</button>" in file_controls
    assert "disabled={disabled || readOnly || busy" in file_controls
    assert 'variant?: "default" | "compact"' in file_controls
    assert 'data-resource-file-controls="compact"' in file_controls
    assert "variant === \"compact\"" in file_controls
    assert "{openHref && <a" in file_controls
    compact_controls = file_controls[
        file_controls.index('if (variant === "compact")'):
        file_controls.index('data-resource-file-controls="shared"')
    ]
    assert "{!readOnly && currentLocation.path" in compact_controls
    assert "Save To Workspace" not in compact_controls
    assert "Save To Other Workspace" not in compact_controls
    assert "Reload Local File" not in compact_controls
    assert ".workspace-resource-file-controls.is-compact{" in source_styles
    assert "height:34px" in source_styles
    assert "flex-wrap:nowrap" in source_styles
    compact_explorer_styles = explorer_styles[
        explorer_styles.index(".pce-source-editor .workspace-resource-file-controls.is-compact"):
    ]
    assert "flex: 0 0 34px" in compact_explorer_styles
    assert "prologClauseFolding" in source_editor


def test_prolog_clause_tree_discloses_only_overflowing_structured_arguments() -> None:
    explorer = PROLOG_CLAUSE_EXPLORER.read_text(encoding="utf-8")
    model = PROLOG_CLAUSE_MODEL.read_text(encoding="utf-8")
    executable_test = PROLOG_CLAUSE_MODEL_TEST.read_text(encoding="utf-8")
    styles = VIDEO_IMPORT_STYLES.read_text(encoding="utf-8")

    assert "export type PrologTerm =" in model
    assert 'kind: "list"' in model
    assert 'kind: "compound"' in model
    assert "export function parsePrologTerm" in model
    assert 'findTopLevelCharacter(body, "|")' in model
    assert "tail: parsePrologTerm(tailSource)" in model
    assert "argTerms: PrologTerm[]" in model
    assert "argumentTerms: clause.argTerms.map(structuredTerm)" in model
    assert "export function shouldExposeTermTree" in model
    assert "&& isOverflowing" in model

    assert "const [expandedTerms, setExpandedTerms] = useState<Set<string>>(new Set())" in explorer
    assert "new ResizeObserver(measure)" in explorer
    assert "element.scrollWidth > element.clientWidth + 1" in explorer
    assert "function useCompactClause" in explorer
    assert "function ClauseTreeRow" in explorer
    assert "function TermTreeNode" in explorer
    assert "<TermTreeNode" in explorer
    assert 'hiddenArguments.has(index) ? "."' in explorer
    assert "structuredSummary(structuredTerms)" in explorer
    assert "clause.argTerms.flatMap((term, index) => hiddenArguments.has(index)" in explorer
    assert "label={`arg ${index + 1}:`}" in explorer
    assert "term.items.map((item, index)" in explorer
    assert 'label: `[${index}]`' in explorer
    assert 'label: "tail"' in explorer
    assert "visibleChildren.length < children.length" in explorer
    assert "more list items" in explorer
    assert ".pce-clause-measure" in styles
    assert "visibility: hidden" in styles
    assert ".pce-term-children" in styles

    assert "generic Prolog terms preserve lists at every argument and nesting depth" in executable_test
    assert "structured term disclosure follows measured visibility" in executable_test
    assert 'parsePrologTerm("next(none)")' in executable_test
    assert 'parsePrologTerm("wrapper([a,b], child(deep([x,y,z])))")' in executable_test


def test_inherited_model_is_available_before_full_model_enumeration() -> None:
    source = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")

    fast_selection = source.index("model-selection?include_models=false")
    full_registry = source.index("/model-policy")
    assert fast_selection < full_registry
    assert "inheritedModelRef.current = inherited" in source
    assert "inheritedChoices" in source
    assert 'text: "inherited"' in source
    assert "allCallsModelTouchedRef.current = true" in source
    assert "describerModelTouchedRef.current = true" in source
    assert "plannerModelTouchedRef.current = true" in source
    assert "extractorModelTouchedRef.current = true" in source
    assert "turtleModelTouchedRef.current = true" in source
    assert 'from "@app/components/ColoredTagCombobox"' in source
    assert "modelCapabilityTags" in source
    assert "videoModelDescription" in source
    assert '"image output": "#ff8bd1"' in source
    assert '"no vision": "#e0a458"' in source
    assert "disabled: !model.enabled || !compatible" in source
    assert "preferred by ${preferenceSourceLabel(preferenceSource)}" in source
    assert "preferred:" in source
    display = MODEL_OPTION_DISPLAY.read_text(encoding="utf-8")
    for capability in ("multimodal", "vision", "audio", "reasoning", "tools", "code", "json", "text"):
        assert f'"{capability}"' in display
    assert "[${tags.join(\", \")}]" in display


def test_each_video_import_image_collection_has_a_distinct_gallery_name() -> None:
    source = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")

    for name in (
        "USER PICK GALLERY",
        "EXTRACTED FRAME GALLERY",
        "FILTER EFFECT GALLERY",
        "PROCESSED OUTPUT GALLERY",
        "PROCESSING TRAIL GALLERY",
        "SCENE OBJECT VISUALS",
    ):
        assert name in source
    assert 'aria-label="Extracted Frame Gallery"' in source
    assert 'role="listitem"' in source
    assert "Extracted Frame Gallery:" in source


def test_status_controls_have_their_own_top_row() -> None:
    source = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    styles = (ROOT / "frontend" / "packages" / "omega_vision_ui" / "src" / "styles" / "video_import.css").read_text(encoding="utf-8")

    controls = source.index('className="video-import-activity-controls"')
    lower = source.index('className="video-import-activity-lower"', controls)
    logs = source.index('className="video-import-activity-lines"', lower)
    assert controls < lower < logs
    assert source[controls:logs].count('type="checkbox"') == 4
    assert "copyStateJson" in source[controls:logs]
    assert "forgetState" in source[controls:logs]
    assert "stopEverything" in source[controls:lower]
    assert ".video-import-activity-controls" in styles
    assert ".video-import-activity-lower" in styles
    assert "flex-wrap: wrap" in styles
    assert "grid-template-columns: minmax(0, 1fr)" in styles


def test_center_scroller_reserves_its_scrollbar_gutter() -> None:
    styles = (ROOT / "frontend" / "packages" / "omega_vision_ui" / "src" / "styles" / "video_import.css").read_text(encoding="utf-8")

    page_rule = styles[styles.index(".video-import-page {"):styles.index("}", styles.index(".video-import-page {"))]
    assert "scrollbar-gutter: stable" in page_rule
    assert "box-sizing: border-box" in page_rule
    assert "grid-template-columns: minmax(0, 1fr)" in page_rule
    assert "padding-left: 10px" in page_rule
    assert ".video-import-page > * { min-width: 0; max-width: 100%; }" in styles


def test_model_responses_are_persistently_cached_by_prompt_and_image() -> None:
    source = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")

    assert "type CachedModelResponse" in source
    assert "modelResponseCache," in source
    assert "modelResponseCacheRef.current = restoredModelCache" in source
    assert "responseCacheHash(image)" in source
    assert "cached.modelId === modelId" in source
    assert "cached.prompt === prompt" in source
    assert "cached.imageHash === imageHash" in source
    assert "↻ cached model response" in source
    assert source.count("invokeCachedModel(") == 11


def test_member_gallery_has_two_stage_runner_with_inspectable_prompts() -> None:
    source = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    styles = (ROOT / "frontend" / "packages" / "omega_vision_ui" / "src" / "styles" / "video_import.css").read_text(encoding="utf-8")

    assert "SCENE OBJECTS TEXTUAL DESCRIPTION." in source
    assert "list only its direct visually separable child objects" in source
    assert "{{subjectContext}}" in source
    assert "Do not return polygons or coordinates in this stage." in source
    assert "OBJECT EXTRACTION PLANNER." in source
    assert "Planner orders direct children; it does not generate prompts." in source
    assert "OBJECT OUTLINER." in source
    assert "Outline exactly ONE object" in source
    assert "SCENE OBJECT VISUAL EXTRACTION." in source
    assert "Locate ONLY this listed thing:" in source
    assert "const describeMemberScenes = (onlyMissing = false)" in source
    assert "describeRecursiveSubject" in source
    assert "planRecursiveInventory" in source
    assert "runRecursivePlanner" in source
    assert "runRecursiveOutliner" in source
    assert "runRecursiveExtractor" in source
    assert "queue.push(child)" in source
    assert "parentInventoryId: parent.id" in source
    assert "MAX_RECURSIVE_OBJECT_DEPTH = 9" in source
    assert "(inventory.depth || 0) < MAX_RECURSIVE_OBJECT_DEPTH" in source
    assert "descriptionPrompt: inventoryPrompt" in source
    extraction_section = source.index('section("members", "SCENE OBJECT VISUALS · RECURSIVE DESCRIBER / PLANNER / OUTLINER / EXTRACTOR"')
    assert 'section("memberDescription", "SCENE OBJECTS TEXTUAL DESCRIPTION"' not in source
    assert extraction_section > 0
    assert "video-import-member-tabs" not in source
    assert "PROMPTS + IMAGE OUTPUTS" in source
    assert "Exact Describer prompt" in source
    assert "Exact Describer output" in source
    assert "Call LLM · Describe selected input images" in source
    assert "Call LLM · Planner" in source
    assert "Call LLM · Outliner" in source
    assert "Call LLM · Recursive Extractor" in source
    assert "Call LLM · Turtle Gen" in source
    assert "Call LLM · Turtle PNG" in source
    assert "DEFAULT_MEMBER_DESCRIPTION_PROMPT" in source
    assert "DEFAULT_MEMBER_ORDER_PROMPT" in source
    assert "DEFAULT_MEMBER_OUTLINER_PROMPT" in source
    assert "DEFAULT_RECURSIVE_EXTRACTOR_PROMPT" in source
    assert "DEFAULT_TURTLE_PROMPT" in source
    assert "DEFAULT_TURTLE_PNG_PROMPT" in source
    assert "renderTurtlePrompt" in source
    assert "renderTurtlePngPrompt" in source
    assert "turtle-render" in source
    assert "TURTLE OUTPUT" in source
    assert "PRE-TURTLE LEAVES" in source
    assert "clearPreTurtleLeaves" in source
    assert "activeTurtleArtifact.rawProgram" in source
    assert 'className="video-import-member-prompt-editor"' in source
    assert source.count('className="video-import-member-prompt-disclosure"') == 5
    assert "video-import-member-prompt-disclosure" in styles
    assert "<textarea value={memberOrderPrompt}" in source
    assert "<textarea value={memberOutlinerPrompt}" in source
    assert "<textarea value={memberExtractorPrompt}" in source
    assert "<textarea value={turtlePrompt}" in source
    assert "<textarea value={turtlePngPrompt}" in source
    assert "D · DESCRIBER" in source
    assert "Call LLM · Describe selected input images" in source
    assert '{{goal}}' in source
    assert '{{alreadyExtracted}}' in source
    assert "renderMemberDescriptionPrompt" in source
    assert "renderMemberExtractionPrompt" in source
    assert "renderMemberOrderPrompt" in source
    assert "renderMemberOutlinerPrompt" in source
    assert "Exact Describer prompt" in source
    assert "Exact Planner prompt" in source
    assert "Planner-selected next-object data" in source
    assert "traceTurtle" in source
    assert "normalized 0..1000 move/line commands" in source
    assert "renderSharedExtractorPrompt" in source
    assert "One shared reconstruction template." in source
    planner_prompt = source[source.index("const DEFAULT_MEMBER_ORDER_PROMPT"):source.index("const DEFAULT_MEMBER_OUTLINER_PROMPT")]
    assert "cutoutInstructions" not in planner_prompt
    assert '\\"groups\\":[[\\"exact object name\\"' in planner_prompt
    assert "Group the listed objects into ordered waves for extraction." in planner_prompt
    assert "Use every object's exact name exactly once" in planner_prompt
    assert "parsePlannerRelationships" in source
    assert "migratePlannerPrompt" in source
    assert "setMemberOrderPrompt(migratePlannerPrompt(s.memberOrderPrompt))" in source
    assert "plannerTouching: relationships.touching" in source
    assert "plannerOcclusions: relationships.occlusions" in source
    assert "plannerContainments: relationships.containments" in source
    assert "parsePlannerLabels" in source
    assert "planner-visualization" in source
    assert "PLANNER NUMBERED ORDER PREVIEW" in source
    assert "outline-verification" in source
    assert "outlineVerificationImage: thing.outlineVerificationImage" in source
    assert "VERIFIED TRACE · agreement" in source
    assert "video-import-verification-gallery" in styles
    assert "Touching: none declared." in source
    assert "Occlusions: none declared." in source
    assert "Containments: none declared." in source
    outliner_prompt = source[source.index("const DEFAULT_MEMBER_OUTLINER_PROMPT"):source.index("const DEFAULT_RECURSIVE_EXTRACTOR_PROMPT")]
    assert "polygons" in outliner_prompt
    assert "holes" in outliner_prompt
    assert "{{plannerRelationships}}" in outliner_prompt
    assert "containedBy:" in source
    assert "one object per call" in source.lower()
    assert "const scenePath = inventory.sourceImage" in source
    assert "outlineRecursiveThing" in source
    assert "hasAlignedOutline" in source
    assert "outlineSourceImage: thing.outlineImage" in source
    assert "outlineSourceDimensions: thing.outlineDimensions" in source
    assert "PIXEL COORDINATE SPACE:" in source
    assert "runConcurrent(orderedCandidates, outlinerConcurrency" in source
    assert "polygons: thing.outlinePolygons || []" in source
    assert "Outliner owns geometry; Extractor owns cutting and background reconstruction." in source
    assert "{{nextObjectName}}" in source
    assert "{{plannerPosition}}" in source
    assert "<pre>{attempt.prompt}</pre>" not in source
    assert "const objectPlans =" not in source
    assert "DESCRIBER INPUT IMAGE" in source
    assert "EXACT ROUTE INPUT IMAGE" in source
    assert 'open={attempt.status === "extracted"}' not in source
    assert "Planned extraction order:" in source
    assert "↓ Planner output" in source
    assert "revealRecursiveOutput" in source
    assert "(described && inventory.things.length === 0)" in source
    assert ".sort((left, right) => left.frameIndex - right.frameIndex" in source
    assert "orderedMemberInventories" in source
    assert "Describer retrying" in source
    assert "waiting for Describer" in source
    assert "video-import-planner-jump-status" in source
    assert 'id={`recursive-output-${responseCacheHash(inventory.id)}`}' in source
    assert 'setCollapsedMap((current) => ({ ...current, [sectionId]: false }))' in source
    assert 'scrollIntoView({ behavior: "smooth", block: "start" })' in source
    assert "normalizeMemberPromptLabels" in source
    assert "OUTPUT IMAGE(S)" in source
    assert "video-import-member-call-images" in source
    assert 'type="checkbox" checked={probed}' in source
    assert "check at least one Processing Trail probe first" not in source
    assert "checkedProbes.has(inventory.probeIndex)" not in source
    assert "const scenePath = frame.path" in source
    assert "sourceImage: scenePath" in source
    assert "inputImage: inputPath" in source
    assert "/player/asset?path=" not in source
    assert "/asset?path=${encodeURIComponent(path)}" in source
    assert "Could not load checked probe image:" not in source
    assert "include_disabled_models=true" in source
    assert "no enabled vision models" in source
    assert "isRunnableVisionModel" in source
    assert "model.capabilities?.vision === true" in source
    assert "formatDetectedJson" in source
    assert "```(?:json)?" in source
    assert "Describer output · JSON formatted" in source
    assert "No enabled vision-capable model" in source
    assert "Enable their backend in Models" in source
    assert "automaticVideoModelId" in source
    assert "opus[\\s/_-]*4[._-]?8" in source
    assert "if (opus48) return opus48.id" in source
    assert "turtleLeafCandidates" in source
    assert "nextPassImage" in source
    assert "activeImageMember.nextPassImage || activeImageMember.cutout" in source
    runner = source.index('className="video-import-member-runner"')
    strips = source.index('className="video-import-extracted-object-strips"')
    assert runner < strips
    assert "VERTICAL STRIPS OF EXTRACTED OBJECTS" in source
    assert "memberInputPaths" in source
    assert "frames.filter((frame) => memberInputPaths.has(frame.path))" in source
    assert "multi-select at least one Extracted Frame Gallery image as an LLM input" in source
    assert 'className="video-import-member-input-check"' in source
    assert "Only checked images enter the recursive Describer" in source
    assert 'checked={memberInputPaths.has(frame.path)} disabled={busy}' not in source
    assert "disabled={busy || memberInputPaths.size === frames.length}" not in source
    assert "Select all" in source
    assert "Select none" in source
    assert "clearExtractedFrames" in source
    assert "× Clear extracted frames" in source
    assert "clearRecursiveLevel" in source
    assert "clearSelectedImages" in source
    assert "onClear={clearSelectedImages}" in source
    assert "affectedInventoryIds" in source
    assert "modelResponseCacheRef.current = remainingCache" in source
    assert "compactCachedModelPayload" in source
    assert "compactModelResponseCache" in source
    assert "delete imageProvenanceCacheRef.current[path]" in source
    assert "setPinnedImageContext" in source
    assert "their recursive metadata" in source
    assert "watchConcurrentJob" in source
    assert "sceneJob?.state === \"running\"" in source
    assert "frameExtractionJob?.state === \"running\"" in source
    assert 'watchConcurrentJob(String(payload.jobId), "scenes"' in source
    assert 'watchConcurrentJob(String(payload.jobId), "extract"' in source
    assert '<button disabled={!selectedPath || sceneJob?.state === "running" || job?.state === "running"}' in source
    assert "clearSceneDetection" in source
    assert "scene detection cleared; next scan starts from the beginning" in source
    assert '<button disabled={!markers.length && sceneJob?.state !== "running"} onClick={clearSceneDetection}>× Clear scenes</button>' in source
    assert '<button disabled={frameExtractionJob?.state === "running" || job?.state === "running" || (mode === "scenes" && !markers.length)}' in source
    assert "captionJob?.state === \"running\"" in source
    assert 'watchConcurrentJob(String(payload.jobId), "captions"' in source
    assert "CC Generate captions" in source
    assert "× Clear captions" in source
    assert "video-import-active-caption" in source
    assert "visibleJobs.map" in source
    assert "video-import-status-progress" in source
    assert "effectiveCaptionModel" in source
    assert "clearTurtleTerminations" in source
    assert "onClear={clearTurtleTerminations}" in source
    assert "onClear={clearPreTurtleLeaves}" in source
    assert 'useState<"interval" | "scenes">("scenes")' in source
    assert 'const [startScene, setStartScene] = useState("2")' in source
    assert 'const [skipScenes, setSkipScenes] = useState("1")' in source
    assert "startScene: Math.max(1, Number(startScene) || 1)" in source
    assert "endScene: endScene.trim() ? Number(endScene) : undefined" in source
    assert "skipScenes: Math.max(0, Number(skipScenes) || 0)" in source
    assert ">start scene <" in source
    assert ">end scene <" in source
    assert "scene(s)</label>" in source
    assert "frame.sceneIndex" in source
    assert "provenance?: string" in source
    assert "setStartScene(s.startScene)" in source
    assert "setSkipScenes(s.skipScenes)" in source
    assert "video-import-workflow-galleries" in source
    assert "WorkflowGalleryPanel" in source
    assert "WorkflowGalleryItem" in source
    assert 'role={onSelectedChange ? "checkbox" : undefined}' in source
    assert "const toggle = () => onSelectedChange?.(!selected)" in source
    assert 'onClick={(event) => event.stopPropagation()}' in source
    assert "showCheckbox = false" in source
    assert "if (event.ctrlKey) toggle()" in source
    assert "if (!target || event.ctrlKey" in source
    assert "Click for popup · Ctrl-click to select or unselect" in source
    assert "pinnedImageContext" in source
    assert "handleImageContextClick" in source
    assert "video-import-image-hover-context${pinnedImageContext ? \" is-pinned\" : \"\"}" in source
    assert "× Close" in source
    assert ".video-import-image-hover-context.is-pinned" in styles
    assert "pointer-events: auto; resize: both" in styles
    assert "max-width: calc(50vw - 16px)" in styles
    assert "max-height: calc(50vh - 16px)" in styles
    assert "collapsedLeftGalleries" in source
    assert "selectedWorkflowGalleryPaths" in source
    assert "previousInventory = memberInventories.find" in source
    assert "previousThings = new Map" in source
    assert "existingChild = memberInventories.find" in source
    assert "queuedInventoryIds" in source
    assert 'title={`EXTRACTED IMAGES · ${frames.length}`}' in source
    assert 'title={`SELECTED IMAGES · ${memberInputPaths.size}`}' in source
    assert "selectedImageStageIndicators" in source
    assert "stageIndicators={selectedImageStageIndicators(frame)}" in source
    assert 'label: "T", value: `${generatedTurtles}/${rootLeaves.length}`' in source
    assert 'label: "I", value: `${renderedImages}/${rootLeaves.length}`' in source
    assert "grid-template-columns: repeat(6, 1fr)" in styles
    assert "video-import-gallery-stage-strip" in source
    assert ".video-import-gallery-stage-strip span.is-active" in styles
    assert ".video-import-gallery-stage-strip span.is-retrying" in styles
    assert ".video-import-gallery-stage-strip span.is-partial" in styles
    assert ".video-import-gallery-stage-strip span.is-complete" in styles
    assert "LEFTOVER BACKGROUNDS" in source
    assert "video-import-workflow-gallery-panel" in source
    assert "outlinePolygons: polygons" in source
    assert "outlineHoles: holes" in source
    assert "outlineBox: box" in source
    assert "pixel-edge precision" in source
    assert "fillInstructions" in source
    assert "remove: content-aware inpaint" in source
    assert "parsed.backgroundFill" in source
    assert "imageGenerationModelId: effectiveImageOutputModel" in source
    assert "automaticImageOutputModelId" in source
    assert "masked image editing via ${effectiveImageOutputModel}" in source
    assert "no enabled model advertises image output" in source
    assert "DEFAULT_RECURSIVE_AUTOMATION" in source
    automation_defaults = source[source.index("const DEFAULT_RECURSIVE_AUTOMATION"):source.index("const DEFAULT_MEMBER_DESCRIPTION_PROMPT")]
    assert "describer: true" in automation_defaults
    assert "planner: true" in automation_defaults
    assert "outliner: true" in automation_defaults
    assert "extractor: true" in automation_defaults
    assert "turtle: true" in automation_defaults
    assert "turtlePng: true" in automation_defaults
    assert "advanceLevels: true" in automation_defaults
    assert "enlargeSubobjects: true" in automation_defaults
    assert "setRecursiveAutomation({" in source
    assert "s.recursiveAutomation.describer === true" in source
    assert "recursiveAutomation.describer" in source
    assert "recursiveAutomation.planner" in source
    assert "recursiveAutomation.outliner" in source
    assert "recursiveAutomation.extractor" in source
    assert "recursiveAutomation.turtle" in source
    assert "recursiveAutomation.turtlePng" in source
    assert "recursiveAutomation.advanceLevels" in source
    assert "recursiveAutomation.enlargeSubobjects" in source
    assert "enlargeForNextPass: recursiveAutomation.enlargeSubobjects" in source
    assert "visibleAltImageZoom.imagePath" in source
    assert "maximumImageWidth" in source
    assert "maximumImageHeight" in source
    assert "const width = maximumImageWidth" in source
    assert "const height = maximumImageHeight" in source
    assert "window.innerWidth - width - contextWidth" in source
    assert "visibleAltImageZoom.scale.toFixed(1)" in source
    assert "pinnedAltImageZoom" in source
    assert "visibleAltImageZoom" in source
    assert "event.altKey && altImageZoom" in source
    assert "video-import-alt-image-zoom${pinnedAltImageZoom ? \" is-pinned\" : \"\"}" in source
    assert ".video-import-alt-image-zoom.is-pinned" in styles
    assert "position: sticky; z-index: 3; top: -10px" in styles
    assert "position: sticky; z-index: 3; top: -8px" in styles
    assert "transform: translate(-50%, -50%)" not in styles
    assert "activeImageParentThing?.description ||" in source
    assert "activeImageInventory?.sceneDescription ||" in source
    assert "activeImageInventory?.descriptionOutput ||" in source
    assert "activeImageInventory?.orderOutput ||" in source
    assert "activeImagePlannerStatus" in source
    assert "PLANNER · {activeImagePlannerStatus}" in source
    assert "formatDetectedJson(activeImagePlannerOutput)" in source
    assert "activeImageOutlinerOutputs" in source
    assert "OUTLINER · {activeImageOutlinerOutputs.length} OBJECT(S)" in source
    assert "imageProvenanceCacheRef" in source
    assert "activeImageProvenance" in source
    assert "image-provenance?workspaceId=" in source
    assert "JSON.stringify(activeImageProvenance, null, 2)" in source
    assert "formatDetectedJson(activeImageDescriberOutput" in source
    assert "formatDetectedJson(activeTurtleArtifact.pngProgram)" in source
    assert "OBJECTS · {activeImageInventory?.things.length || 0}" in source
    assert "No object list has been made for this image yet." in source
    assert "PARENT OBJECT DESCRIPTION" in source
    assert "LAST IMAGE DESCRIBER OUTPUT" in source
    assert "video-import-image-hover-context" in source
    assert "ALL LLM CALLS" in source
    assert "slots stay available for other stages in either direction." in source
    assert "ACTIVE WORKER" in source
    assert "video-import-llm-call-metrics" in source
    assert "PENDING" in source
    assert "COMPLETED" in source
    assert "AVG / JOB" in source
    assert "performance.now() - startedAt" in source
    assert "llmCallMetrics" in source
    assert "llmStageProgress" in source
    assert "ready to run (awaiting a free worker)" in source
    assert ".video-import-llm-call-metrics" in styles
    assert '" has-workers"' in source
    assert ".video-import-llm-call-row > button.has-workers" in styles
    assert "thing.status === \"outlining\"" in source
    assert "thing.status === \"extracting\"" in source
    assert "manualWorkerHold" in source
    assert "workersHeld = manualWorkerHold || restartPendingSignal" in source
    assert "if (!restoredRef.current || workersHeld) return;" in source
    assert 'aria-pressed={workersHeld}' in source
    assert "■ HOLD / DRAIN WORKERS" in source
    assert "▶ WORKERS HELD / DRAINING" in source
    assert "before restarting an LLM server" in source
    assert ".video-import-worker-hold.is-held" in styles
    assert "noneLabel={`<use global" in source
    assert "reserve cross-stage capacity" in source
    assert "Math.ceil(totalLlmConcurrency / 3)" not in source
    assert "queuedDescriptionTasks" in source
    assert "orderedDescriptionTasks.slice(0, descriptionConcurrency)" not in source
    assert "automaticDescriptionClaimsRef" in source
    assert "allowsOverlappingRefill" in source
    assert "total max processes" in source
    assert "DEFAULT_LLM_CALL_CONCURRENCY" in source
    assert "effectiveCallConcurrency" in source
    assert "descriptionTasks.slice(0, 6)" not in source
    assert "descriptionTasks" in source
    assert "LLM_RETRY_DELAY_MS = 1000" in source
    assert "scheduleRetry" in source
    assert "retryReady" in source
    assert "bypassCache = false" in source
    assert "!bypassCache && cached" in source
    assert "failedStage: \"gen\"" in source
    assert "failedStage: \"png\"" in source
    assert "llmSchedulerRef" in source
    assert "acquireLlmSlot" in source
    assert "scheduler.waiters.findIndex" not in source
    assert "bestUtilization" in source
    assert "downstreamWaiting" not in source
    assert "reserve cross-stage capacity" in source
    assert "LLM_STAGE_MIN_PER_STAGE = 5" in source
    assert "LLM_STAGE_RESERVE_MAX = 6" in source
    assert "LLM_STAGE_ORDER" in source
    assert "bestRoundRobinDistance" in source
    assert "scheduler.lastGrantedIndex" in source
    assert "cooperativeRetryOrder" in source
    assert "retryReserve = Math.min(2" in source
    assert "automaticStagesRunningRef" in source
    assert "setAutomaticSchedulerTick((tick) => tick + 1)" in source
    scheduler_dependencies = source[source.index("  }, [", source.index("const automaticStagesRunningRef")):source.index("  ]);", source.index("const automaticStagesRunningRef"))]
    assert "models," in scheduler_dependencies
    assert "restartPendingSignal" in source
    assert "Restart pending; new LLM work is paused." in source
    assert "queued LLM work was paused before launch" in source
    assert "RESTART PENDING · DRAINING" in source
    assert 'launch("describer"' in source
    assert 'launch("planner"' in source
    assert 'launch("outliner"' in source
    assert 'launch("extractor"' in source
    assert 'launch("turtle"' in source
    assert 'launch("turtlePng"' in source
    assert "Array.from({ length: 50 }" in source
    assert "selectedDescriptionPrompt" in source
    assert "selectedPlannerPrompt" in source
    assert "selectedOutlinerPrompt" in source
    assert "selectedExtractorPrompt" in source
    assert "selectedTurtlePrompt" in source
    assert "selectedTurtlePngPrompt" in source
    assert "T · TURTLE GEN" in source
    assert "O · OUTLINER" in source
    assert "PNG · TURTLE PNG" in source
    assert "video-import-controller-prompt" in source
    assert "Fully exposed from the controller prompt selector." in source
    assert "↻ Reload prompt" in source
    assert "💾 Save prompt" in source
    assert "reloadExpandedPrompt" in source
    assert "saveExpandedPrompt" in source
    assert "no saved Video Import state is available" in source
    assert "usePageProcessActivity" in source
    assert "onOpen={() => setExpandedCallPrompt(type)}" in source
    assert "min-height: 320px" in styles
    assert "isolation: isolate; overflow: visible" in styles
    assert "flex: 0 1 min(720px, calc(50vw - 16px))" in styles
    automation = source.index('className="video-import-recursive-automation"')
    split = source.index('aria-label="Video Import pipeline forks"')
    assert 'section("memberDescription", "SCENE OBJECTS TEXTUAL DESCRIPTION"' not in source
    assert automation < split
    assert source.index('section("config", "ADVANCED CONTROLS · JSON CONFIG"') > source.index('section("finish", "COMPLETION / EXPORT"')
    assert '.video-import-page[data-subview] > [data-section="finish"]' in styles


def test_scene_object_flow_is_recursive_describer_planner_outliner_extractor_tree() -> None:
    source = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    styles = (ROOT / "frontend" / "packages" / "omega_vision_ui" / "src" / "styles" / "video_import.css").read_text(encoding="utf-8")

    assert 'aria-label="Video Import pipeline forks"' in source
    assert 'aria-label="Recursive object workflow tree"' in source
    assert "RECURSIVE OBJECT FLOW" in source
    assert "Describer → Planner → Outliner → Extractor" in source
    assert "Every extracted object becomes the input to another cycle." in source
    assert "RecursiveInventoryTreeNode" in source
    assert "recursiveRootInventories.map" in source
    assert "candidate.parentInventoryId === inventory.id" in source
    assert "video-import-recursive-tree-node" in source
    assert "video-import-recursive-tree-leaf" in source
    assert "TURTLE" in source
    assert 'className="video-import-pipe-bushy-wires"' not in source
    assert '{selected && (\n        <section className="video-import-pipe-board"' not in source
    assert 'className="video-import-scene-object-workspace"' in source
    assert 'className="video-import-pipe-column"' in source
    assert "VIDEO_IMPORT_SUBVIEWS" in source
    assert 'data-subview={activeSubview}' in source
    assert 'aria-label="Video Import steps"' in source
    assert "1 · Sources" in source
    assert "2 · Frames & Filters" in source
    assert "3 · Games" in source
    assert "4 · Objects" in source
    assert "5 · Sprite View" in source
    assert "6 · Recognition" in source
    assert "5 · Finish" not in source
    assert '{ id: "advanced", label: "Advanced" }' not in source
    assert '.video-import-page[data-subview="sources"]' in styles
    assert '.video-import-page[data-subview] > [data-section="config"]' in styles
    assert "runnableInventoryIds" in source
    assert "runnableMemberInventories" in source
    assert "memberInputPaths.has(inventory.framePath)" in source
    assert "frame extraction stopped: no completed scene list yet; scene detection continues to the end" in source
    assert "stopped: frame extraction is starved while scene detection continues to the end" in source
    assert "scene threshold" in source
    assert "samples/s" in source
    assert "min gap" in source
    assert 'placeholder="until end"' in source
    assert "■ Stop scene scan" in source
    assert "scene scan stop requested; detected markers will be preserved" in source
    assert "■ Stop frame extraction" in source
    assert "frame extraction stop requested; completed frames will be preserved" in source
    assert "Select a game recording to import its moves as a Sequence Set…" in source
    assert "move-list provenance" in source
    assert "Publish (WHIP)" in source
    assert "Watch (HLS)" in source
    assert "Consume stream + detect scenes" in source
    assert "Paste HLS, RTSP, RTMP, SRT, or HTTP video/podcast stream URL" in source
    assert "YouTube / HLS / RTSP / RTMP / SRT / video URL or local movie path" in source
    assert "Consume URL + detect scenes" in source
    assert "⇪ Upload movie / image ZIP…" in source
    assert 'accept="video/*,.zip,application/zip"' in source
    assert '"image-archive/upload"' in source
    assert "Extracted Images source" in source
    assert '.filter((source) => source.id !== "video-extraction"' in source
    assert "Current video above" in source
    assert "Curated data ·" in source
    assert "curated-image-sources/import" in source
    assert "ARC3 PLAYER / RECORDING SOURCE" in source
    assert "<EmbeddedArc3PlayPage" in source
    assert "onRecordingChanged={refreshArcRecordings}" in source
    assert source.index('className="video-import-pipe-board"') < source.index('section("members", "SCENE OBJECT VISUALS · RECURSIVE DESCRIBER / PLANNER / OUTLINER / EXTRACTOR"')
    assert ".video-import-scene-object-workspace" in styles
    assert "grid-column: 1; grid-row: 2 / 5" in styles
    assert ".video-import-pipe-column > header::after" in styles
    assert "display: grid; grid-template-rows: auto auto" in styles
    assert "position: sticky; top: 8px" in styles
    assert ".video-import-recursive-tree" in styles
    assert ".video-import-recursive-tree-node::before" in styles
    assert ".video-import-recursive-tree-node > button.is-selected > i" in styles
    assert ".video-import-recursive-tree-leaf" in styles
    assert "border-radius: 50%" in styles
    board_start = styles.index("\n.video-import-pipe-board {")
    board_rule = styles[board_start:styles.index("}", board_start)]
    assert "overflow: visible" in board_rule


def test_sprite_finish_and_advanced_have_one_canonical_video_import_surface() -> None:
    page = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    workbench = WORKBENCH_PAGE.read_text(encoding="utf-8")
    sprite = SPRITE_VIEWER_PAGE.read_text(encoding="utf-8")
    navigation = VIDEO_IMPORT_NAVIGATION_URL.read_text(encoding="utf-8")
    navigation_test = VIDEO_IMPORT_NAVIGATION_URL_TEST.read_text(encoding="utf-8")

    omega_start = workbench.index('group: "OMEGA VISION"')
    omega_end = workbench.index('group: "CAPABILITIES"', omega_start)
    omega_menu = workbench[omega_start:omega_end]
    assert '{ label: "Sprite View", view: "videoImport", subview: "sprite-view", glyph: "◳" }' in omega_menu
    assert 'label: "Finish"' not in omega_menu
    assert 'label: "VI Advanced"' not in omega_menu
    assert 'label: "Sprite Viewer"' not in omega_menu
    assert 'view === "spriteViewer"' not in workbench
    assert "default: module.SpriteViewerPage" not in workbench
    assert 'value === "spriteviewer"' in workbench
    assert page.count("<SpriteViewerPage />") == 1
    assert "export function SpriteViewerPage()" in sprite
    assert 'className={`video-import-sprite-view${activeSubview === "sprite-view" ? " is-active" : ""}`}' in page
    assert page.count('section("finish", "COMPLETION / EXPORT"') == 1
    assert page.count('section("config", "ADVANCED CONTROLS · JSON CONFIG"') == 1
    for preserved_control in (
        "Call LLM · Turtle Gen",
        "Call LLM · Turtle PNG",
        "Materialize filtered frames as a Visual Sequence",
        "⏎ Apply to flow",
        "↻ track live",
        "⟲ forget saved",
    ):
        assert page.count(preserved_control) == 1
    assert "resolveVideoImportShellDestination" in navigation
    assert "canonicalVideoImportShellUrl" in navigation
    assert "legacy Sprite Viewer routes migrate to Video Import step 5" in navigation_test
    assert "legacy Finish and Advanced destinations open integrated sections" in navigation_test


def test_alt_hover_gives_image_and_context_separate_half_page_panes() -> None:
    source = VIDEO_IMPORT_PAGE.read_text(encoding="utf-8")
    styles = (ROOT / "frontend" / "packages" / "omega_vision_ui" / "src" / "styles" / "video_import.css").read_text(encoding="utf-8")

    assert "type AltImageZoom" in source
    assert "hoveredImageRef" in source
    assert "showAltImageZoom" in source
    assert "event.altKey" in source
    assert 'event.key === "Alt"' in source
    assert "const width = maximumImageWidth" in source
    assert "const height = maximumImageHeight" in source
    assert "maximumImageWidth / rect.width" in source
    assert "maximumImageHeight / rect.height" in source
    assert 'window.addEventListener("keydown", keyDown)' in source
    assert 'window.addEventListener("keyup", hide)' in source
    assert 'window.addEventListener("blur", blur)' in source
    assert "onPointerMove={handleImageZoomPointer}" in source
    assert 'video-import-alt-image-zoom${pinnedAltImageZoom ? " is-pinned" : ""}' in source
    assert "visibleAltImageZoom.scale.toFixed(1)" in source
    assert ".video-import-alt-image-zoom" in styles
    assert "position: fixed" in styles
    assert "pointer-events: none" in styles
    assert ".video-import-pipe-parent-choice" in styles
    assert ".video-import-pipe-cycle" in styles
    assert "enabled: previous?.enabled === true || model.enabled" in source
    assert "vision: previous?.vision === true || model.vision" in source
