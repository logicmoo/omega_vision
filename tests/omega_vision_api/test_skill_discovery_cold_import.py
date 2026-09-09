from __future__ import annotations

import importlib
import shutil
import sys
import time
from pathlib import Path

import pytest

from omega_vision.services import video_import_api

REPO = Path(video_import_api.__file__).resolve().parents[3]
REAL_SKILLS = REPO / "data" / "omega_vision" / "video_import" / "filter_skills"
HEAVY = ("skimage", "matplotlib")


class _BlockHeavyImports:
    """meta_path finder that makes scikit-image / matplotlib look uninstalled,
    so tests prove the active paths never import them for discovery."""

    def find_spec(self, name, path=None, target=None):  # noqa: ANN001, D401
        if name.split(".")[0] in HEAVY:
            raise ImportError(f"blocked heavy import '{name}' (cold-import regression)")
        return None


@pytest.fixture()
def heavy_blocked():
    finder = _BlockHeavyImports()
    saved = {k: v for k, v in list(sys.modules.items()) if k.split(".")[0] in HEAVY}
    for key in saved:
        sys.modules.pop(key, None)
    sys.meta_path.insert(0, finder)
    try:
        yield
    finally:
        if finder in sys.meta_path:
            sys.meta_path.remove(finder)
        sys.modules.update(saved)


def _copy_real_skills(tmp_path: Path) -> Path:
    skills = video_import_api._skills_dir(tmp_path)
    skills.mkdir(parents=True, exist_ok=True)
    for name in (
        "colormap_gradients.py", "skimage_effects.py", "pilgram_filter.py",
        "pillow_effects.py", "edge_sketch.py",
    ):
        src = REAL_SKILLS / name
        if src.is_file():
            shutil.copy2(src, skills / name)
    return skills


def test_finder_blocks_heavy_imports(heavy_blocked):
    with pytest.raises(ImportError):
        importlib.import_module("matplotlib")
    with pytest.raises(ImportError):
        importlib.import_module("skimage")


def test_skill_discovery_does_not_import_skimage_or_matplotlib(tmp_path, heavy_blocked):
    _copy_real_skills(tmp_path)
    entries = video_import_api._discover_skills(tmp_path)
    ids = {e["id"] for e in entries}
    assert "skill:colormap_gradients" in ids
    colormap = next(e for e in entries if e["id"] == "skill:colormap_gradients")
    assert not colormap.get("broken")
    # The static colormap combo survives without matplotlib.
    assert "viridis" in colormap["paramChoices"]["cmap"]
    pilgram = next(e for e in entries if e["id"] == "skill:pilgram_filter")
    assert not pilgram.get("broken")
    skimage_skill = next(e for e in entries if e["id"] == "skill:skimage_effects")
    assert not skimage_skill.get("broken")
    # Discovery imported neither heavy package.
    assert "matplotlib" not in sys.modules
    assert "skimage" not in sys.modules


def test_composite_registry_enumeration_is_import_free(heavy_blocked):
    composites = video_import_api._registered_transform_composites()
    ids = {c["id"] for c in composites}
    assert "parts_extraction_0/python_opencv" in ids
    assert "turtle_programs/turtle_programs_prolog" in ids
    assert all(c["available"] for c in composites)
    assert "matplotlib" not in sys.modules and "skimage" not in sys.modules


def test_catalog_enumeration_works_with_heavy_blocked(tmp_path, heavy_blocked):
    sets = video_import_api._list_image_sets(tmp_path)
    assert isinstance(sets, list)
    assert "matplotlib" not in sys.modules and "skimage" not in sys.modules


def test_discovery_cold_load_is_fast_without_heavy_imports(tmp_path, heavy_blocked):
    _copy_real_skills(tmp_path)
    start = time.perf_counter()
    video_import_api._discover_skills(tmp_path)
    elapsed = time.perf_counter() - start
    # With the heavy packages blocked, discovery must complete quickly (no
    # multi-second scikit-image / matplotlib cold import on the load path).
    assert elapsed < 5.0, f"discovery took {elapsed:.2f}s with heavy imports blocked"


def test_list_filters_handles_inherited_skills_dir_outside_workspace(heavy_blocked):
    # For workspaces whose skills dir is the shared/inherited data home, it is NOT
    # under the workspace root, so a naive Path.relative_to(root) raised ValueError
    # -> 500 on /filters. The overlay-safe _data_rel_of must handle it, and the
    # endpoint must return without importing scikit-image / matplotlib.
    try:
        root = video_import_api._workspace_root("arc3_random_player")
        skills = video_import_api._skills_dir(root)
    except Exception:  # noqa: BLE001 - workspace not resolvable in this environment
        pytest.skip("arc3_random_player workspace not resolvable")
    if str(skills.resolve()).startswith(str(root.resolve())):
        pytest.skip("skills dir is inside the workspace root; inheritance not exercised")

    result = video_import_api.list_filters("arc3_random_player")
    assert isinstance(result.get("filters"), list) and result["filters"]
    assert isinstance(result.get("skillsDir"), str) and result["skillsDir"]
    assert "matplotlib" not in sys.modules and "skimage" not in sys.modules
