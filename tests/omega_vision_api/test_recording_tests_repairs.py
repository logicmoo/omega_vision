import json

import pytest

from omega_vision.evaluation import event_recordings as originals
from omega_vision.evaluation import induction_recording_repairs as repairs

DOC = ("recordings", "events_tests", "documentation", "plate_momentary.md")
EVALUATION = ("recordings", "events_tests", "plate_momentary_train_a", "evaluation.json")
IMAGE = ("recordings", "events_tests", "plate_momentary_train_a", "0", "image.png")
OLD_DOC = b"# Plate momentary\n- **train_a**: Generated old documentation\n"
NEW_DOC = b"# Plate momentary\n- **train_a**: Correct positive trial description\n"


@pytest.fixture
def baseline(tmp_path, monkeypatch):
    files = {DOC: OLD_DOC, EVALUATION: b'{"controlInterpretation":"old"}', IMAGE: b"unchanged image"}
    originals.publish_recording_files(tmp_path, files)
    monkeypatch.setattr(repairs, "recording_test_files", lambda: (files, {}))
    return tmp_path / "data" / "omega_vision", files


def test_archive_then_explicit_repair_preserves_history_images_and_create_only_guard(baseline):
    home, files = baseline
    old = dict(files)
    image_time = home.joinpath(*IMAGE).stat().st_mtime_ns
    assert repairs.archive_generated_baseline(home)["archivedFiles"] == 2
    assert home.joinpath(*repairs.ARCHIVE, "old", *DOC).read_bytes() == old[DOC]
    assert home.joinpath(*DOC).read_bytes() == old[DOC]
    files[DOC] = NEW_DOC
    files[EVALUATION] = b'{"controlInterpretation":"correct"}'
    with pytest.raises(FileExistsError, match="preserved without overwrite"):
        originals.publish_recording_files(home, files)
    assert repairs.publish_description_repair(home)["changedFiles"] == 2
    assert home.joinpath(*DOC).read_bytes() == files[DOC]
    assert home.joinpath(*EVALUATION).read_bytes() == files[EVALUATION]
    assert home.joinpath(*repairs.ARCHIVE, "old", *EVALUATION).read_bytes() == old[EVALUATION]
    assert home.joinpath(*IMAGE).read_bytes() == old[IMAGE]
    assert home.joinpath(*IMAGE).stat().st_mtime_ns == image_time
    assert repairs.publish_description_repair(home)["changedFiles"] == 0
    assert originals.publish_recording_files(home, files)["createdFileCount"] == 0
    assert not list(home.joinpath(*repairs.ARCHIVE).glob(".replacement-*"))
    assert len(json.loads(home.joinpath(*repairs.ARCHIVE, "repaired.json").read_bytes())["repairedFiles"]) == 2


def test_archive_rejects_non_generated_live_baseline_without_creating_history(baseline):
    home, _ = baseline
    home.joinpath(*DOC).write_bytes(b"User's concurrent revision")
    with pytest.raises(FileExistsError, match="not the generated baseline"):
        repairs.archive_generated_baseline(home)
    assert not home.joinpath(*repairs.ARCHIVE).exists()


def test_repair_preflight_preserves_concurrent_user_edit_without_partial_writes(baseline):
    home, files = baseline
    repairs.archive_generated_baseline(home)
    old_eval = files[EVALUATION]
    files[DOC] = NEW_DOC
    files[EVALUATION] = b'{"controlInterpretation":"correct"}'
    home.joinpath(*EVALUATION).write_bytes(b"User's concurrent evaluation")
    with pytest.raises(FileExistsError, match="Concurrent documentation edit preserved"):
        repairs.publish_description_repair(home)
    assert home.joinpath(*DOC).read_bytes() == OLD_DOC
    assert home.joinpath(*EVALUATION).read_bytes() != old_eval
    assert home.joinpath(*EVALUATION).read_bytes() == b"User's concurrent evaluation"


def test_repair_refuses_generator_image_changes(baseline):
    home, files = baseline
    repairs.archive_generated_baseline(home)
    files[DOC] = NEW_DOC
    files[IMAGE] = b"Accidental image change"
    with pytest.raises(ValueError, match="cannot change this file type"):
        repairs.publish_description_repair(home)
    assert home.joinpath(*DOC).read_bytes() == OLD_DOC
    assert home.joinpath(*IMAGE).read_bytes() == b"unchanged image"


def test_repair_rechecks_concurrent_edits_after_staging(baseline, monkeypatch):
    home, files = baseline
    repairs.archive_generated_baseline(home)
    files[DOC] = NEW_DOC
    original = repairs.os.fsync

    def concurrent_edit(descriptor):
        original(descriptor)
        home.joinpath(*DOC).write_bytes(b"Concurrent editor's text")

    monkeypatch.setattr(repairs.os, "fsync", concurrent_edit)
    with pytest.raises(FileExistsError, match="Concurrent documentation edit preserved"):
        repairs.publish_description_repair(home)
    assert home.joinpath(*DOC).read_bytes() == b"Concurrent editor's text"
    assert not list(home.joinpath(*repairs.ARCHIVE).glob(".replacement-*"))


@pytest.mark.parametrize("target,content", [
    (DOC, b"# An unrelated rewritten heading\n- **train_a**: Correct positive trial description\n"),
    (EVALUATION, b'{"controlInterpretation":"correct","frames":[{"new":"oracle"}]}'),
])
def test_repair_refuses_non_description_changes(baseline, target, content):
    home, files = baseline
    repairs.archive_generated_baseline(home)
    files[target] = content
    with pytest.raises(ValueError, match="Description repair cannot change"):
        repairs.publish_description_repair(home)
    assert home.joinpath(*DOC).read_bytes() == OLD_DOC


@pytest.mark.parametrize("area", ["archive", "target", "lock"])
def test_repair_rejects_redirected_storage_paths(baseline, monkeypatch, area):
    home, _ = baseline
    original = repairs.storage_path

    def redirect(root, *parts):
        affected = (
            (area == "archive" and parts[:len(repairs.ARCHIVE)] == repairs.ARCHIVE)
            or (area == "target" and parts == DOC)
            or (area == "lock" and parts[:1] == ("locks",))
        )
        return home / "elsewhere" if affected else original(root, *parts)

    monkeypatch.setattr(repairs, "storage_path", redirect)
    with pytest.raises(ValueError, match="redirect"):
        repairs.archive_generated_baseline(home)
    assert not home.joinpath(*repairs.ARCHIVE).exists()
    assert not (home / "elsewhere").exists()
