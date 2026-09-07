[← Back to top-level README](README.md)

# Repository File Tree and Responsibilities

This is the clickable source map for the maintained repository. Every listed path links directly to the file and includes its responsibility.

## Root documentation

- [`README.md`](README.md) — top-level documentation index, delivered-debugger phase boundary, layered resource discovery, installation, and runnable commands.
- [`README_WINDOWS.md`](README_WINDOWS.md) — native Windows installation, long paths, Python aliases, `.venv`, line endings, batch launchers, Prolog, Kaggle, PyCharm, and UNC-path troubleshooting.
- [`python/arc_cli_debugger/config/README.md`](python/arc_cli_debugger/config/README.md) — unified provider/prompt configuration, provider cycling, comparison transcripts, artifact restoration, Unsloth Studio, Claude, and OpenAI.
- [`DEBUGGER.md`](DEBUGGER.md) — ARC3 debugger controls, pluggable commands, action trees, provider artifacts, replay, browser terminal, and Turtle mock inspection.
- [`KAGGLE.md`](KAGGLE.md) — ARC Prize 2026 local development, notebook generation, accelerator, submission, and troubleshooting guide.
- [`TODO_PHASE_ARCHITECTURE.md`](TODO_PHASE_ARCHITECTURE.md) — large technical overview separating the delivered debugger from Phase 2 object semantics and Phase 3 learning/prediction.
- [`TODO.md`](TODO.md) — post-delivery debugger maintenance plus concrete Phase 2 and Phase 3 implementation work.
- [`TODO_DELIVERABLES.md`](TODO_DELIVERABLES.md) — completed Phase 1 debugger checklist and partial/open Phase 2 and Phase 3 outcomes with evidence links.
- [`FILE_TREE.md`](FILE_TREE.md) — this clickable source map.
- [`docs/WORLD_ANALYSIS_WORKBENCH.md`](docs/WORLD_ANALYSIS_WORKBENCH.md) — domain-neutral AtomSpaces, observations, world models, goals, simulations, and ARC3 human-demonstration workflow.

The planning documents have deliberately separate scopes and cross-link one another:

- architecture explains how the debugger, object memory, and learner are designed;
- TODO tracks what is actively being implemented;
- deliverables tracks what is delivered and what remains to be checked off.

## World Analysis Workbench core

- [`python/worldworkbench/core.py`](python/worldworkbench/core.py) — compatibility state facade, versioned Atoms, observations, interventions, world models, goals, simulations, and orchestration contracts.
- [`python/worldworkbench/__init__.py`](python/worldworkbench/__init__.py) — public domain-neutral workbench API.
- [`python/worldworkbench/adapters/arc3.py`](python/worldworkbench/adapters/arc3.py) — ARC3 observation, intervention, human-choice, and artifact translation boundary.
- [`python/worldworkbench/adapters/__init__.py`](python/worldworkbench/adapters/__init__.py) — public ARC3 adapter exports.
- [`docs/DATA_REPRESENTATIONS.md`](docs/DATA_REPRESENTATIONS.md) — filesystem-backed semantic, representation, and concrete datatype model.
- [`workspaces/shared_library_system/design/configs/world_workbench_operations.config.metta`](workspaces/shared_library_system/design/configs/world_workbench_operations.config.metta) — reusable processing-resource contracts, including object extraction and Turtle representation operations.
- [`python/arc_cli_debugger/config/llm_workflows.json`](python/arc_cli_debugger/config/llm_workflows.json) — runnable workflow-desktop catalog, including the seven-step `ls20` human-observation workflow and its nested subworkflows.
- [`python/arc_cli_debugger/workflow_operation_editor.py`](python/arc_cli_debugger/workflow_operation_editor.py) — MeTTaSymbolicLearnerWorkbench desktop for composing, validating, inspecting, saving, and running typed operations and nested subworkflows.

## Workbench architecture and contributor guidance

- [`AGENTS.md`](AGENTS.md) — contributor and Codex operating contract, active entrypoints, UI baseline, validation requirements, and ordered implementation tasks.
- [`docs/WORKBENCH.md`](docs/WORKBENCH.md) — workbench-specific setup, API, frontend, workspace, and workflow-engine orientation.
- [`docs/design/CODEX_CURRENT_IMPLEMENTATION_INVENTORY.md`](docs/design/CODEX_CURRENT_IMPLEMENTATION_INVENTORY.md) — inventory of active, obsolete, real, and mock workbench surfaces.
- [`docs/design/WORKBENCH_NAVIGATION_V2.md`](docs/design/WORKBENCH_NAVIGATION_V2.md) — DESIGN, RUNTIME, and SYSTEM navigation contract.
- [`docs/design/UNIVERSAL_ARTIFACT_EDITOR.md`](docs/design/UNIVERSAL_ARTIFACT_EDITOR.md) — required hierarchy, tabs, comparison, JSON, documentation, and execution capabilities shared by rich editors.
- [`docs/design/GOALS_AND_PLANS_ARCHITECTURE.md`](docs/design/GOALS_AND_PLANS_ARCHITECTURE.md) — semantic Goal and Plan resources, variants, inheritance, and runtime relationships.
- [`docs/design/FILESYSTEM_RESOURCE_MODEL.md`](docs/design/FILESYSTEM_RESOURCE_MODEL.md) — shared-library inheritance, workspace overrides, resource kinds, and file naming.
- [`docs/design/RUNTIME_PERSISTENCE_ARCHITECTURE.md`](docs/design/RUNTIME_PERSISTENCE_ARCHITECTURE.md) — durable Goal Run linkage and workflow execution evidence.
- [`docs/design/EXECUTIVE_VISION.md`](docs/design/EXECUTIVE_VISION.md) — executive thesis that structured orchestration, memory, evidence, validation, and model coaching can make both frontier and non-frontier models substantially more capable.
- [`docs/design/WORKFLOW_CONTROL_LANGUAGE.md`](docs/design/WORKFLOW_CONTROL_LANGUAGE.md) — minimal model-generated workflow language, AtomSpace memory ports, values, conditionals, loops, call/return behavior, preflight rules, and bounded execution semantics.
- [`docs/design/SEMANTIC_WORKFLOW_TO_RUNTIME_IMPLEMENTATION.md`](docs/design/SEMANTIC_WORKFLOW_TO_RUNTIME_IMPLEMENTATION.md) — two-stage semantic workflow generation and runtime implementation resolution, including Bicameral Mode CoT and coaching cadence.
- [`docs/todo/MODEL_RUNTIME_USAGE_AND_BENCHMARKING_POLICIES.md`](docs/todo/MODEL_RUNTIME_USAGE_AND_BENCHMARKING_POLICIES.md) — model-policy specification, backend contract, filters, health, pings, and benchmarks.
- [`docs/todo/assets/model_runtime_policy_mockup.png`](docs/todo/assets/model_runtime_policy_mockup.png) — visual acceptance reference for the model-policy UI.
- [`docs/DATATYPES_MANIFEST_EXPLAINED.md`](docs/DATATYPES_MANIFEST_EXPLAINED.md) — detailed AtomSpace, Atom, datatype, representation, operation-port, rule, and event model.

## Active workbench frontend

- [`frontend/apps/workbench/package.json`](frontend/apps/workbench/package.json) and [`frontend/apps/workbench/package-lock.json`](frontend/apps/workbench/package-lock.json) — React/Vite dependencies and reproducible npm resolution.
- [`frontend/apps/workbench/index.html`](frontend/apps/workbench/index.html) — Vite browser entry document.
- [`frontend/apps/workbench/src/main.tsx`](frontend/apps/workbench/src/main.tsx) — React root bootstrap.
- [`frontend/apps/workbench/src/App.tsx`](frontend/apps/workbench/src/App.tsx) — authoritative active-page selection.
- [`frontend/apps/workbench/src/pages/FilesystemWorkbenchPage.tsx`](frontend/apps/workbench/src/pages/FilesystemWorkbenchPage.tsx) — active filesystem workbench shell, navigation, runtime views, inspector, and editor routing.
- [`frontend/apps/workbench/src/components/UniversalArtifactEditor.tsx`](frontend/apps/workbench/src/components/UniversalArtifactEditor.tsx) — reusable rich editor frame with hierarchy, persistent tabs, split comparison, and docked panels.
- [`frontend/apps/workbench/src/components/HierarchyResourceEditor.tsx`](frontend/apps/workbench/src/components/HierarchyResourceEditor.tsx) — common hierarchy/editor composition used by filesystem resource libraries.
- [`frontend/apps/workbench/src/components/ArtifactTreeBranch.tsx`](frontend/apps/workbench/src/components/ArtifactTreeBranch.tsx) — recursive collapsible tree branch with variant visibility controls.
- [`frontend/apps/workbench/src/components/useArtifactTreeFilter.ts`](frontend/apps/workbench/src/components/useArtifactTreeFilter.ts) — shared multi-property tree filtering and optional parent-chain expansion.
- [`frontend/apps/workbench/src/components/resourceRelationships.ts`](frontend/apps/workbench/src/components/resourceRelationships.ts) — normalizes bidirectional parent/child and specification/variant relationships.
- [`frontend/apps/workbench/src/components/DataCatalogPanel.tsx`](frontend/apps/workbench/src/components/DataCatalogPanel.tsx) — semantic, representation, and concrete datatype editor.
- [`frontend/apps/workbench/src/components/GoalPlanLibraryEditor.tsx`](frontend/apps/workbench/src/components/GoalPlanLibraryEditor.tsx) — Goal/interpretation and Plan/variant editor.
- [`frontend/apps/workbench/src/components/RuntimeHistoryView.tsx`](frontend/apps/workbench/src/components/RuntimeHistoryView.tsx) — durable Goal Runs, workflow runs, executions, events, states, and logs UI.
- [`frontend/apps/workbench/src/components/OperationLibraryEditor.tsx`](frontend/apps/workbench/src/components/OperationLibraryEditor.tsx) — Operations route over the rich operation library editor.
- [`frontend/apps/workbench/src/components/OperationPlayground.tsx`](frontend/apps/workbench/src/components/OperationPlayground.tsx) — executable operation test surface and result display.
- [`frontend/apps/workbench/src/components/PromptLibraryEditor.tsx`](frontend/apps/workbench/src/components/PromptLibraryEditor.tsx) and [`PromptHierarchyPanel.tsx`](frontend/apps/workbench/src/components/PromptHierarchyPanel.tsx) — prompt specification/implementation hierarchy and editing.
- [`frontend/apps/workbench/src/components/LlmModelsEditor.tsx`](frontend/apps/workbench/src/components/LlmModelsEditor.tsx) — backend, model, and profile hierarchy editor.
- [`frontend/apps/workbench/src/components/PolicyLibraryEditor.tsx`](frontend/apps/workbench/src/components/PolicyLibraryEditor.tsx) — editable policy specifications and variants.
- [`frontend/apps/workbench/src/components/ModelPolicyPage.tsx`](frontend/apps/workbench/src/components/ModelPolicyPage.tsx) — live filesystem policy registry, health controls, benchmark runner, matrix, and results history.
- [`frontend/apps/workbench/src/components/HelpDocumentTabs.tsx`](frontend/apps/workbench/src/components/HelpDocumentTabs.tsx) — right-side contextual filesystem Markdown tabs, with Contents first, a Theses tab, and repository-link navigation available from every active page.
- [`frontend/apps/workbench/src/components/RepositoryDocsPage.tsx`](frontend/apps/workbench/src/components/RepositoryDocsPage.tsx) — repository Markdown index, filtering, refresh, rendered documents, and linked source viewer.
- [`frontend/apps/workbench/src/styles/workbench.css`](frontend/apps/workbench/src/styles/workbench.css) — active shell, navigation, runtime views, responsive layout, and focused Docs layout.
- [`frontend/apps/workbench/src/styles/help_tabs.css`](frontend/apps/workbench/src/styles/help_tabs.css), [`repository_docs.css`](frontend/apps/workbench/src/styles/repository_docs.css), [`operation_editor.css`](frontend/apps/workbench/src/styles/operation_editor.css), [`operation_playground.css`](frontend/apps/workbench/src/styles/operation_playground.css), and [`models_editor.css`](frontend/apps/workbench/src/styles/models_editor.css) — focused component styling.
- [`frontend/apps/workbench/tsconfig.json`](frontend/apps/workbench/tsconfig.json), [`tsconfig.app.json`](frontend/apps/workbench/tsconfig.app.json), [`tsconfig.node.json`](frontend/apps/workbench/tsconfig.node.json), and [`vite.config.ts`](frontend/apps/workbench/vite.config.ts) — TypeScript project boundaries and Vite build configuration.

The other files under `frontend/apps/workbench/src/pages/` and older shell-oriented components are retained reference or compatibility surfaces — they are not active unless [`App.tsx`](frontend/apps/workbench/src/App.tsx) imports them; do not mistake their polish or mock data for the running application.

## Workbench backend and persistence

- [`python/workbench_api_server/app.py`](python/workbench_api_server/app.py) — FastAPI entrypoint and router registration.
- [`python/workbench_api_server/workspace_api.py`](python/workbench_api_server/workspace_api.py) and [`workspace_config.py`](python/workbench_api_server/workspace_config.py) — workspace discovery, snapshots, safe file access, and workspace metadata.
- [`python/workbench_api_server/repository_docs_api.py`](python/workbench_api_server/repository_docs_api.py) — safe repository Markdown index and linked source-file reader used by SYSTEM → Docs.
- [`python/workbench_api_server/resource_convention.py`](python/workbench_api_server/resource_convention.py) and [`resource_relationships.py`](python/workbench_api_server/resource_relationships.py) — filename/kind rules and bidirectional relationship normalization.
- [`python/workbench_api_server/datatype_api.py`](python/workbench_api_server/datatype_api.py), [`operation_api.py`](python/workbench_api_server/operation_api.py), [`prompt_api.py`](python/workbench_api_server/prompt_api.py), and [`policy_api.py`](python/workbench_api_server/policy_api.py) — filesystem CRUD and resolution routes for each resource family.
- [`python/workbench_api_server/datatype_library.py`](python/workbench_api_server/datatype_library.py), [`operation_library.py`](python/workbench_api_server/operation_library.py), [`prompt_library.py`](python/workbench_api_server/prompt_library.py), [`policy_library.py`](python/workbench_api_server/policy_library.py), [`model_library.py`](python/workbench_api_server/model_library.py), and [`goal_plan_library.py`](python/workbench_api_server/goal_plan_library.py) — shared/workspace loaders, validation, inheritance, and save behavior.
- [`python/workbench_api_server/operation_resolution.py`](python/workbench_api_server/operation_resolution.py) — resolves abstract operations to compatible concrete implementations.
- [`python/workbench_api_server/representation_planner.py`](python/workbench_api_server/representation_planner.py) — selects datatype representations and conversion paths.
- [`python/workbench_api_server/model_policy_todo_api.py`](python/workbench_api_server/model_policy_todo_api.py) — exposes the implemented policy specification, remaining follow-ups, and acceptance image from disk.
- [`python/workbench_api_server/workflow_engine.py`](python/workbench_api_server/workflow_engine.py), [`advanced_workflow_engine.py`](python/workbench_api_server/advanced_workflow_engine.py), and [`workflow_engine_api.py`](python/workbench_api_server/workflow_engine_api.py) — workflow validation, execution, commands, events, artifacts, and logs.
- [`python/workbench_api_server/goal_run_api.py`](python/workbench_api_server/goal_run_api.py) — resolves filesystem Goal, Plan, Context, and workflow resources into durable goal pursuits.
- [`python/workbench_api_server/workflow_providers.py`](python/workbench_api_server/workflow_providers.py) and [`shared_operation_callables.py`](workspaces/titlecase_demo/shared_operation_callables.py) — runtime provider adapters and built-in executable operations.
- [`python/omega_vision/perception/grid_analysis.py`](python/omega_vision/perception/grid_analysis.py), [`store.py`](python/workbench_api_server/store.py), and [`models.py`](python/workbench_api_server/models.py) — runtime coordination, persistence primitives, and API data models.
- [`python/workbench_api_server/routes/artifacts.py`](python/workbench_api_server/routes/artifacts.py) and [`routes/workflow.py`](python/workbench_api_server/routes/workflow.py) — compatibility artifact/workflow routes.
- [`python/workbench_api_server/requirements.txt`](python/workbench_api_server/requirements.txt) — backend Python dependencies.

## Filesystem workspaces and resource families

- [`workspaces/shared_library_system/shared_library_system.workspace.metta`](workspaces/shared_library_system/shared_library_system.workspace.metta) — system shared-library identity and inheritance root.
- [`workspaces/shared_library_system/docs/contents.md`](workspaces/shared_library_system/docs/contents.md) — first tab in the right-side Documentation inspector and filesystem-backed index into every shared help section, the project theses, design documents, and repository Docs explorer.
- [`workspaces/shared_library_system/docs/data.md`](workspaces/shared_library_system/docs/data.md), [`goals.md`](workspaces/shared_library_system/docs/goals.md), [`plans.md`](workspaces/shared_library_system/docs/plans.md), [`operations.md`](workspaces/shared_library_system/docs/operations.md), [`prompts.md`](workspaces/shared_library_system/docs/prompts.md), [`policies.md`](workspaces/shared_library_system/docs/policies.md), and [`llm_catalog.md`](workspaces/shared_library_system/docs/llm_catalog.md) — contextual Help documents displayed beside rich editors.
- [`workspaces/shared_library_system/design/operations/control_loops.operation.metta`](workspaces/shared_library_system/design/operations/control_loops.operation.metta), [`control_conditionals.operation.metta`](workspaces/shared_library_system/design/operations/control_conditionals.operation.metta), and [`workflow_language_primitives.operation.metta`](workspaces/shared_library_system/design/operations/workflow_language_primitives.operation.metta) — shared bounded loop, conditional branch/call, value, AtomSpace memory, break/continue, and return primitives for model-generated workflows.
- [`workspaces/shared_library_system/design/operations/populate_workflow_from_english.operation.metta`](workspaces/shared_library_system/design/operations/populate_workflow_from_english.operation.metta) — semantic workflow compiler operation with MeTTa and JSON LLM implementation children.
- [`workspaces/shared_library_system/design/prompts/generate_workflow_from_english.prompt.metta`](workspaces/shared_library_system/design/prompts/generate_workflow_from_english.prompt.metta), [`generate_workflow_from_english.metta.prompt.metta`](workspaces/shared_library_system/design/prompts/generate_workflow_from_english.metta.prompt.metta), and [`generate_workflow_from_english.json.prompt.metta`](workspaces/shared_library_system/design/prompts/generate_workflow_from_english.json.prompt.metta) — constrained semantic workflow compiler prompt and strict MeTTa/JSON variants.
- [`workspaces/shared_library_system/design/prompts/plan_workflow_memory_and_values.prompt.metta`](workspaces/shared_library_system/design/prompts/plan_workflow_memory_and_values.prompt.metta) and [`plan_workflow_memory_and_values.default.prompt.metta`](workspaces/shared_library_system/design/prompts/plan_workflow_memory_and_values.default.prompt.metta) — shared planner for AtomSpace memory, value lifecycles, iteration groups, and reevaluation checkpoints.
- `workspaces/shared_library_system/design/semantic_datatypes/*.semantic_datatype.metta` — abstract meanings such as Image, Entity, Observation, AtomSpace, Goal, Event, and World Model.
- `workspaces/shared_library_system/design/representation_datatypes/*.representation_datatype.metta` — interchangeable structures such as bitmap, scene graph, object list, symbolic facts, Turtle program, and natural language.
- `workspaces/shared_library_system/design/concrete_datatypes/*.concrete_datatype.metta` — exact encodings such as PNG, JPEG, JSON, UTF-8 text, Prolog, NumPy, and SVG.
- `workspaces/shared_library_system/design/operations/*.operation.metta` — abstract executable contracts and same-kind implementation children, distinguished by their `parents` relationships and implementation metadata.
- `workspaces/shared_library_system/design/prompts/*.prompt.metta` — semantic prompt contracts, same-kind alternatives, and prompt-profile composition resources maintained together as source code.
- `workspaces/shared_library_system/design/backends` and `design/models` — provider transports, model identities, and same-kind model presets; the loader retains read-only compatibility with legacy `profiles` directories.
- `workspaces/shared_library_system/design/goals` — desired-outcome specifications and same-kind interpretations.
- `workspaces/shared_library_system/design/planning_strategies` — human, PDDL, LLM, or rule planning strategies and their same-kind alternatives.
- `workspaces/shared_library_system/design/atomspaces` — AtomSpace declarations and same-kind alternatives.
- `workspaces/shared_library_system/runtime/` — generated goal runs, workflow runs, execs, events, states, resolved contexts, and logs; normally empty in the system shared library.
- `workspaces/shared_library_system/policies/*.metta` — model runtime policies, vendor policy, eligibility entries, health observations, ping jobs/events, benchmark policies, and benchmark results.
- [`workspaces/shared_library_arc3/docs/README.md`](workspaces/shared_library_arc3/docs/README.md) — ARC3 shared-library purpose; its `design/workflows/`, `design/operations/`, and `design/prompts/` extend the system shared library.
- [`workspaces/arc3_random_player/docs/ARC3_RANDOM_PLAYER_WORKFLOW_ENGLISH.md`](workspaces/arc3_random_player/docs/ARC3_RANDOM_PLAYER_WORKFLOW_ENGLISH.md) and [`workspaces/arc3_random_player/design/prompts/arc3_random_player_english_specification.prompt.metta`](workspaces/arc3_random_player/design/prompts/arc3_random_player_english_specification.prompt.metta) — ARC3-specific human-readable workflow specification and first-class prompt resource consumed by the shared workflow compiler.
- [`workspaces/default/default.workspace.metta`](workspaces/default/default.workspace.metta) — minimal editable starter template; it declares Shared as its initial inclusion and intentionally contains no local resources.
- [`workspaces/titlecase_demo/design/workflows/titlecase_demo.workflow.metta`](workspaces/titlecase_demo/design/workflows/titlecase_demo.workflow.metta) and [`workspaces/review_with_approval/design/workflows/review_with_approval.workflow.metta`](workspaces/review_with_approval/design/workflows/review_with_approval.workflow.metta) — runnable examples in dedicated application workspaces; shared libraries provide their reusable operations but own no workflows.
- [`workspaces/tic_tac_toe_learner/docs/README.md`](workspaces/tic_tac_toe_learner/docs/README.md) and [`workspaces/workflow_engine_tour/docs/README.md`](workspaces/workflow_engine_tour/docs/README.md) — focused example-workspace entry documents.
- [`workbench.workspace.json`](workbench.workspace.json) — repository-level workspace selection/configuration.

## Workbench launchers, maintenance, and validation

- [`run_workbench.bat`](run_workbench.bat) — top-level Windows launcher for the API and Vite servers.
- [`python/workbench_api_server/scripts/run_demo.bat`](python/workbench_api_server/scripts/run_demo.bat) and [`run_demo.sh`](python/workbench_api_server/scripts/run_demo.sh) — platform-specific demo launchers.
- [`python/workbench_api_server/scripts/run_api_server.bat`](python/workbench_api_server/scripts/run_api_server.bat) and [`run_vite_server.bat`](python/workbench_api_server/scripts/run_vite_server.bat) — individual backend/frontend launchers.
- [`scripts/migrate_datatype_kinds.mjs`](scripts/migrate_datatype_kinds.mjs) — one-time semantic/representation/concrete datatype migration helper.
- [`scripts/sync_resource_relationships.mjs`](scripts/sync_resource_relationships.mjs) — synchronizes inverse parent/child and specification/variant pointers.
- [`scripts/normalize_markdown_encoding.py`](scripts/normalize_markdown_encoding.py) — detects and repairs UTF-8 Markdown accidentally decoded as Windows-1252.
- [`.github/workflows/python-tests.yml`](.github/workflows/python-tests.yml) — CI Python test workflow.
- `tests/test_workbench_server.py`, `tests/test_navigation_v2_ui.py`, `tests/test_universal_artifact_editor_ui.py`, and the other `tests/test_*` files — backend contracts, navigation/editor regressions, resource schemas, relationships, playground behavior, policy behavior, and documentation links.
- `python/workbench_api_server/test_*.py` — workflow-engine, provider, runtime, and operation-library unit tests colocated with the backend.

## IDE and generated records

- `.idea/` and [`.run/interactive_runner.run.xml`](.run/interactive_runner.run.xml) — intentionally versioned PyCharm project and run configuration.
- `.llm_responses/*.md` — immutable generated model request/response evidence; the Docs index may display these, but they are not maintained design documents.

## Repository configuration and protected Kaggle surface

- [`.gitattributes`](.gitattributes) — repository line-ending policy.
- [`.env.example`](.env.example) — realistic placeholders for unified LLM config, transcript logging, provider keys/models/endpoints, analysis profiles, runtime paths, web UI, PyCharm, and Kaggle.
- [`python/arc_cli_debugger/config/llm_providers.json`](python/arc_cli_debugger/config/llm_providers.json) — single source for reusable `prompt_text` blocks and ordered `llm_providers`, with each provider selecting its own prompt-section list.
- [`pyproject.toml`](pyproject.toml) — canonical package metadata, dependency extras, platform-specific terminal dependencies, package layout, and pytest configuration.
- [`requirements.txt`](requirements.txt) — compatibility installer for debugger, notebook, and test extras.
- [`Makefile`](Makefile) — POSIX setup, local-play, notebook-build, submission, status, and cleanup commands; native Windows alternatives are documented separately.
- [`.gitignore`](.gitignore) — excludes credentials, generated notebooks, environments, caches, and runtime artifacts.
- [`python/arc_cli_debugger/cli/play_local.py`](python/arc_cli_debugger/cli/play_local.py) — protected local runner that exercises `MyAgent` against real ARC3 games after resolving runtime resources.
- [`scripts/slim_framework.py`](scripts/slim_framework.py) — trims optional framework imports in the vendored ARC-AGI-3 Agents framework.
- [`python/notebooks/submission.ipynb`](python/notebooks/submission.ipynb) — generated Kaggle submission notebook; do not edit by hand.
- [`python/notebooks/kernel-metadata.json`](python/notebooks/kernel-metadata.json) — Kaggle kernel metadata and accelerator settings.
- [`python/notebooks/arc3_debugger.ipynb`](python/notebooks/arc3_debugger.ipynb) — guided notebook interface over the same ARC3 debugger runtime.
- [`python/notebooks/arc3_runner.ipynb`](python/notebooks/arc3_runner.ipynb) — lower-level notebook interface for scripted ARC3 runner use.

## Runnable scripts and runtime bootstrap

- [`scripts/_runtime.py`](scripts/_runtime.py) — layered resolver for launch directory, code checkout, `.env` files, LLM config, action-tree output, import paths, startup reporting, and optional PyCharm attachment.
- [`scripts/setup_windows.bat`](scripts/setup_windows.bat) — native Windows setup using Python 3.12+, `.venv`, optional dependencies, the vendored Agents framework, and import verification.
- [`python/arc_cli_debugger/cli/interactive_runner.bat`](python/arc_cli_debugger/cli/interactive_runner.bat) — native Windows launcher that preserves the caller workspace, isolates Python paths, repairs missing core dependencies, and invokes the project interpreter directly.
- [`python/arc_cli_debugger/cli/interactive_runner.py`](python/arc_cli_debugger/cli/interactive_runner.py) — runtime-aware terminal launcher that installs the multi-LLM and provider command extensions into the debugger UI loop.
- [`python/arc_cli_debugger/interactive_runner.py`](python/arc_cli_debugger/interactive_runner.py) — full terminal debugger implementation imported and extended by the launcher.
- [`python/arc_cli_debugger/webui/run_webui.py`](python/arc_cli_debugger/webui/run_webui.py) — runtime-aware browser-UI launcher; the browser subprocess uses the same multi-LLM interactive script.
- [`python/arc_cli_debugger/cli/prolog_controlled_runner.py`](python/arc_cli_debugger/cli/prolog_controlled_runner.py) — runtime-aware SWI-Prolog action-selection demonstration.
- [`python/arc_cli_debugger/cli/re_play.py`](python/arc_cli_debugger/cli/re_play.py) — direct ARC3 action-space and one-step smoke demo.
- [`python/arc_cli_debugger/cli/my_play.py`](python/arc_cli_debugger/cli/my_play.py) — direct ARC3 repeated-`ACTION1` smoke demo.
- [`python/arc_cli_debugger/cli/me_play.py`](python/arc_cli_debugger/cli/me_play.py) — random-action ARC3 demo with terminal rendering.
- [`python/arc_cli_debugger/cli/he_play.py`](python/arc_cli_debugger/cli/he_play.py) — random-action ARC3 demo with human rendering.
- [`python/arc_cli_debugger/webui/server.py`](python/arc_cli_debugger/webui/server.py) — FastAPI/WebSocket cross-platform PTY server launching `python/arc_cli_debugger/cli/interactive_runner.py`; Windows uses ConPTY through `pywinpty`.
- [`python/arc_cli_debugger/webui/static/index.html`](python/arc_cli_debugger/webui/static/index.html) — browser terminal page and client-side controls.

## Phase 1 delivered debugger, providers, and evidence

- [`python/arc_cli_debugger/arc3_runner.py`](python/arc_cli_debugger/arc3_runner.py) — ARC3 lifecycle, legal actions, level handling, rendered observations, action history, replay, reset/restart, exports, and pluggable symbolic command entry points.
- [`python/arc_cli_debugger/multillm_runner.py`](python/arc_cli_debugger/multillm_runner.py) — provider-switching debugger extension, transcript chooser/restoration, provider-aware regeneration, and per-node LLM provenance.
- [`python/arc_cli_debugger/llm_providers.py`](python/arc_cli_debugger/llm_providers.py) — unified provider/prompt registry, prompt-section composition, OpenAI-compatible routing, Anthropic translation, and provider usage metadata.
- [`python/arc_cli_debugger/unsloth_studio.py`](python/arc_cli_debugger/unsloth_studio.py) — authenticated Unsloth inference-status probing, automatic GGUF loading, readiness waiting, lifecycle reporting, and one no-model retry.
- [`python/arc_cli_debugger/llm_json.py`](python/arc_cli_debugger/llm_json.py) — strict JSON parsing, deterministic malformed-JSON repair, required-key validation, and normalized strict serialization.
- [`python/arc_cli_debugger/llm_json_patch.py`](python/arc_cli_debugger/llm_json_patch.py) — response wrapper that records initial output, performs local or text-only repair, and keeps interactions in one run record.
- [`python/arc_cli_debugger/llm_transcripts.py`](python/arc_cli_debugger/llm_transcripts.py) — artifact-first Markdown comparison/cache writer, request/image/debug capture, transcript metadata, listing, and artifact restoration.
- [`python/arc_cli_debugger/llm_readme_patch.py`](python/arc_cli_debugger/llm_readme_patch.py) — README integration that marks the active restorable transcript, links historical runs, and prevents recursive embedding.
- [`python/arc_cli_debugger/action_tree.py`](python/arc_cli_debugger/action_tree.py) — deterministic action tree, rendered state metadata, encounter/action history, replay paths, generated READMEs, level-wide `object_registry.pl`, and provider artifact storage.
- [`python/omega_vision/gpt_bridge.py`](python/omega_vision/gpt_bridge.py) — provider-selected prompt, shared multimodal request, artifact generation, friendly-identity normalization, and debugger-visible Prolog outputs; it is a bridge, not the final native object learner.
- [`python/omega_vision/prolog_bridge.py`](python/omega_vision/prolog_bridge.py) — subprocess bridge into SWI-Prolog and the Turtle interpreter; later semantic queries extend this bridge.
- [`python/arc_cli_debugger/project_paths.py`](python/arc_cli_debugger/project_paths.py) — unified workbench/legacy ARC3 config, analysis-run/action-tree, history, and export path access.
- [`python/omega_vision/image_codec.py`](python/omega_vision/image_codec.py) — authoritative rendered-frame extraction and PNG encoding used by debugger state capture.

## Shared Python object-memory and learner contracts

- [`python/omega_vision/__init__.py`](python/omega_vision/__init__.py) — public exports for shared Phase 2 and connected Phase 3 contracts.
- [`python/omega_vision/runtime/replay.py`](python/omega_vision/runtime/replay.py) — exact semantic codecs, durable Prolog facts, queryable MeTTa AtomSpace records, and action-tree replay.
- [`python/omega_vision/core/models.py`](python/omega_vision/core/models.py) — backend-neutral execution mode, normalized result, object, residual, atom, rule, evidence, confidence, and prediction records.
- [`python/omega_vision/adapters/providers.py`](python/omega_vision/adapters/providers.py) — one provider interface with PROLOG, GPT-artifact, and deterministic PYTHON implementations.
- [`python/omega_vision/forms/forms.py`](python/omega_vision/forms/forms.py) — `AbstractGenerativeForm` and the grid/Turtle `GenerativeForm` (TODO alias `CellLogoForm`); the holder can also delegate every contract method to a held subclass instance.
- [`python/omega_vision/forms/contour_fill.py`](python/omega_vision/forms/contour_fill.py) — raster `ContourFillForm`: translation-invariant canonical fill programs with fit, residual, code length, and mirror completion (TODO A.8 task 8).
- [`python/omega_vision/_future.py`](python/omega_vision/_future.py) — TODO §16 future-component scaffolding backing the `LayeredStrokeForm`, `PartGraph3DForm`, `Robot3DAdapter`, `RGBDObjectProposer`, `AnimeRegionProposer`, and `SketchformerEmbedding` importable stubs.
- [`python/omega_vision/adapters/adapters.py`](python/omega_vision/adapters/adapters.py) — modality-neutral perception adapter and thin grid-extractor adapter, with later image and simple-video providers sharing the same contracts.
- [`python/omega_vision/core/memory.py`](python/omega_vision/core/memory.py) — residual admission, reference storage, zero-confidence commitments, positive/negative evidence updates, confidence governance, and tombstones through `SingleWriter`.
- [`python/omega_vision/core/prediction.py`](python/omega_vision/core/prediction.py) — exact-identity rule store and prediction-before-outcome ledger.
- [`python/omega_vision/core/learning.py`](python/omega_vision/core/learning.py) — connected transition analysis, transformation learning, competing-rule induction/ranking/execution, prediction, and independent outcome grading pipeline.
- [`python/omega_vision/runtime/integration.py`](python/omega_vision/runtime/integration.py) — validated Game Object Learner payload/result contracts and concrete pipeline plugin independent of debugger internals.

## Existing and connected Prolog contracts

- [`prolog/omega_vision/arc3_agent.pl`](prolog/omega_vision/arc3_agent.pl) — action-selection controller seam.
- [`prolog/omega_vision/turtle_dsl.pl`](prolog/omega_vision/turtle_dsl.pl) — authoritative Turtle execution semantics, including movement and pen-width behavior reused by Phase 2 object programs.
- [`prolog/omega_vision/object_memory_contract.pl`](prolog/omega_vision/object_memory_contract.pl) — canonical Prolog records and normalized candidate access predicates.
- [`prolog/omega_vision/generative_form.pl`](prolog/omega_vision/generative_form.pl) — grid generative-form facade reusing `turtle_dsl.pl`.
- [`prolog/omega_vision/residual_gate.pl`](prolog/omega_vision/residual_gate.pl) — symbolic residual disposition and admission decisions.
- [`prolog/omega_vision/single_writer.pl`](prolog/omega_vision/single_writer.pl) — sole Prolog mutation path for committed atoms, evidence, confidence, and tombstones.
- [`prolog/omega_vision/transition_analysis.pl`](prolog/omega_vision/transition_analysis.pl) — provider-driven transition-analysis contract.
- [`prolog/omega_vision/transformation_learning.pl`](prolog/omega_vision/transformation_learning.pl) — transformation candidate generation, application, and validation seam.
- [`prolog/omega_vision/rule_induction.pl`](prolog/omega_vision/rule_induction.pl) — competing-rule proposal, specialization, generalization, assumptions, and critique seam.
- [`prolog/omega_vision/rule_ranking.pl`](prolog/omega_vision/rule_ranking.pl) — deterministic scoring and ranking of normalized rules using evidence and prediction history.
- [`prolog/omega_vision/transition_rules.pl`](prolog/omega_vision/transition_rules.pl) — exact rule storage plus caller-supplied applicability and execution.
- [`prolog/omega_vision/prediction_ledger.pl`](prolog/omega_vision/prediction_ledger.pl) — durable prediction records and prediction-before-outcome enforcement.
- [`prolog/omega_vision/prediction_evaluation.pl`](prolog/omega_vision/prediction_evaluation.pl) — independent comparison and grading of prior predictions.
- [`prolog/omega_vision/game_object_learner_api.pl`](prolog/omega_vision/game_object_learner_api.pl) — connected orchestration from transition analysis through rule storage, prediction, later grading, and debugger-visible result handoff.

## Tests and runnable checks

- [`tests/workbench_api/test_llm_providers.py`](tests/workbench_api/test_llm_providers.py) — provider availability/cycling, selected prompt sections, transition exclusion, model routing, usage metadata, and Claude image conversion.
- [`tests/workbench_api/test_unsloth_studio.py`](tests/workbench_api/test_unsloth_studio.py) — Unsloth status/load lifecycle, already-loaded reuse, automatic loading, payload settings, and status reporting.
- [`tests/workbench_api/test_llm_json.py`](tests/workbench_api/test_llm_json.py) — malformed-JSON repair, required-key validation, and one-transcript text-only fallback logging.
- [`tests/workbench_api/test_llm_transcripts.py`](tests/workbench_api/test_llm_transcripts.py) — artifact-first layout, Markdown prompt rendering, response-at-bottom behavior, README history links, and artifact restoration.
- [`tests/workbench_api/test_env_example.py`](tests/workbench_api/test_env_example.py) — `.env.example` parsing and expected unified settings.
- [`tests/workbench_api/test_dotenv_runtime.py`](tests/workbench_api/test_dotenv_runtime.py) — `.env` loading and shell/IDE precedence.
- [`tests/workbench_api/test_resource_discovery.py`](tests/workbench_api/test_resource_discovery.py) — launch-workspace config/action-tree discovery and startup path reporting.
- [`tests/workbench_api/test_windows_dependency_bootstrap.py`](tests/workbench_api/test_windows_dependency_bootstrap.py) — venv-direct execution, path sanitization, Command Prompt quoting, workspace preservation, and dependency repair.
- [`tests/omega_vision/test_object_memory_contracts.py`](tests/omega_vision/test_object_memory_contracts.py) — provider normalization, residual admission, `SingleWriter`, rules, connected Phase 3 flow, prediction ordering, Kaggle-path, and runner-placement tests.
- [`tests/workbench_api/test_documentation_links.py`](tests/workbench_api/test_documentation_links.py) — root-document coverage, cross-links, valid file-tree links, and descriptions.
- [`tests/workbench_api/test_runtime_home.py`](tests/workbench_api/test_runtime_home.py) — code-root precedence and script bootstrap coverage.
- [`tests/workbench_api/test_world_workbench.py`](tests/workbench_api/test_world_workbench.py) — versioned Atom compatibility records, goal-directed simulation, human-demonstration observation, ARC3 adapter isolation, and seven-step workflow tests.
- [`tests/plt/test_object_memory.pl`](tests/plt/test_object_memory.pl) — Prolog tests for residuals, commitments, rules, connected Phase 3 flow, and prediction grading.
- [`tests/plt/test_turtle_dsl.pl`](tests/plt/test_turtle_dsl.pl) — Turtle movement, pen state, pen width, and thick/thin equivalence tests.

## Runtime-generated action-tree files

`action_trees/` is intentionally documented last because it contains generated runtime evidence rather than maintained application source. The inventory stops after the immediate `action_trees/<game>/` game roots; it does not enumerate deeper level or action-path directories.

Each `action_trees/<game>/` root contains generated `level_<n>/` trees. Files found deeper in those trees follow these roles:

- `README.md` — state navigation, active transcript, historical run links, embedded latest provider artifacts, readable identities, Turtle mocks, candidate rules, critiques, and confidence outputs.
- `image.png` — authoritative captured rendered frame.
- `state.json` — debugger metadata and action path.
- `llm_provider.json` — provider, model, endpoint, analysis level, generation time, and restored-transcript provenance for current artifacts.
- `llm_adapter_<adapter>_<provider>_<model>_<level>_<profile>_tokens_<budget>_<timestamp>.md` — immutable artifact snapshot followed by exact request/response debugging details.
- `object_registry.pl` — Phase 1 readable provider identities for the level and the bootstrap point for Phase 2 persistent identity.
- `objects.pl` — provider-proposed current-state object descriptions.
- `differences.pl` — provider-proposed parent/current symbolic delta.
- `similarities.pl` — provider-proposed object correspondence or similarity.
- `turtle_from_image.pl` — provider-supplied Turtle mock or reconstruction.
- `turtle_from_diff.pl` — provider-supplied visual transformation description.
- `rules.pl` — candidate rules, assumptions, critiques, probability or confidence output, and supporting context.

Phase 2 and Phase 3 add semantic object records, per-object Turtle programs, recognition accounts, evidence, calibrated confidence, learner payloads, predictions, outcomes, and grades while continuing to expose them through this Phase 1 debugger evidence surface.

[← Back to top-level README](README.md)
