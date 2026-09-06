[? Back to top-level README](README.md)

# PREVIEW — Final Layout Materialization

This tree is a COPY-preview of C:\snet\PeTTa\repos\symbolic_learner_workbench arranged in the
APPROVED final layout (see docs/design/FINAL_REPOSITORY_LAYOUT_AND_HISTORICAL_PATH_MAPPING.md,
decisions Q1-Q12). The source repo was not modified. This is NOT a git repo and NOT the historical
replay — it is the tip content only, for layout review.

- Everything on disk was copied (tracked + untracked + ignored), EXCEPT: .git (root), __pycache__,
  *.pyc, .venv/venv, .pytest_cache, .pytest-local, .tmp_pytest_ren, .tmp
- Plugin subrepos under plugins/ kept their own .git dirs (they stay independent repos).
- COPY_HISTORY files (Q1/Q2/Q3) appear TWICE by design: once under workbench_api_server/ and once
  under python/omega_vision/services/ (22 modules; job_manager.py -> services/jobs.py,
  arc3_play_api.py -> services/arc3_play.py, phase3_pipeline.py -> services/phase3_live.py).
- prolog/omega_vision/__init__.py became python/omega_vision/perception/__init__.py;
  the thin outer generative_vision/__init__.py is parked at perception/_package_init_outer.py (merged in Phase 4).
- Internal imports/paths are NOT repaired here (that is Phase 4 of the plan) — nothing in this tree runs.
- Full mapping: PREVIEW_FILE_MAP.csv (historical_path, final_path, tracked/untracked).
- Empty planned dirs included: frontend/apps/omega_vision/, frontend/packages/shared_ui/,
  tests/workbench_ui/, tests/omega_vision_ui/. prolog/pack.pl is authored later.
