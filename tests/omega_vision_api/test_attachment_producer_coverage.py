from copy import deepcopy

from PIL import Image, ImageDraw

from omega_vision.perception import pixels_to_regions_cv as cv
from omega_vision.services import video_import_api as api


def source_image(path, *, transparent=False, noise=False):
    image = Image.new("RGBA" if transparent else "RGB", (48, 32), "white")
    draw = ImageDraw.Draw(image)
    draw.rectangle((10, 8, 19, 23), fill="red")
    draw.rectangle((20, 8, 29, 23), fill="blue")
    if transparent:
        image.putpixel((0, 0), (255, 255, 255, 0))
    if noise:
        image.putpixel((1, 1), (0, 0, 0))
    image.save(path)
    return path


def extract(path):
    return cv.extract_region_facts_cv(path, filter_mode="none", max_dim=0)


def test_real_cv_producer_attests_complete_retained_solid_regions(tmp_path):
    image = source_image(tmp_path / "source.png")
    result = extract(image)
    evidence = result["attachmentEvidence"]
    assert result["regionCount"] == result["blobCount"] == 3
    assert all(evidence["complete"].values())
    assert evidence["backgroundRolesTrusted"] is True
    assert evidence == extract(image)["attachmentEvidence"]


def test_pruned_regions_do_not_attest_complete_attachment_absences(tmp_path):
    result = extract(source_image(tmp_path / "noise.png", noise=True))
    assert result["blobCount"] > result["regionCount"]
    evidence = result["attachmentEvidence"]
    assert evidence["complete"]["regions"] is False
    assert evidence["complete"]["shared_edges"] is False
    assert evidence["backgroundRolesTrusted"] is False


def test_rgb_producer_cannot_attest_transparent_background_roles(tmp_path):
    result = extract(source_image(tmp_path / "alpha.png", transparent=True))
    assert result["attachmentEvidence"]["backgroundRolesTrusted"] is False


def test_missing_producer_probes_remain_incomplete(tmp_path, monkeypatch):
    monkeypatch.setattr(cv, "region_fillpoints_cv", lambda *_: {})
    result = extract(source_image(tmp_path / "source.png"))
    assert result["attachmentEvidence"]["complete"]["probes"] is False
    assert result["attachmentEvidence"]["backgroundRolesTrusted"] is False


def test_dropped_contour_and_degenerate_polygon_cannot_attest_holes():
    polygon = {"outer": [(0, 0), (9, 0), (9, 9), (0, 0)],
               "holes": [], "contours": [{"kind": "outer"}, {"kind": "hole"}]}
    evidence = cv._attachment_evidence(
        {1: {}}, {1}, {1: polygon}, {1: [(3, 3, 2)]}, opaque=True, policy={},
    )
    assert evidence["complete"]["holes"] is False
    degenerate = deepcopy(polygon)
    degenerate.update(outer=[(0, 0), (1, 0), (0, 0)], contours=[{"kind": "outer"}])
    evidence = cv._attachment_evidence(
        {1: {}}, {1}, {1: degenerate}, {1: [(0, 0, 1)]}, opaque=True, policy={},
    )
    assert evidence["complete"]["holes"] is False


def test_api_producer_binds_preprocessing_policy_not_frame_identity(tmp_path):
    image = source_image(tmp_path / "source.png")
    output = tmp_path / "output"
    output.mkdir()
    unit = {"image": image, "preprocessingRevision": "chain:one"}
    first = api._transform_parts_extraction_cv(unit, output, {"filter": "none"})
    changed_frame = source_image(tmp_path / "other.png")
    second = api._transform_parts_extraction_cv({**unit, "image": changed_frame}, output, {"filter": "none"})
    assert first["attachmentEvidence"] == second["attachmentEvidence"]
    changed = api._transform_parts_extraction_cv(
        {**unit, "preprocessingRevision": "chain:two"}, output, {"filter": "none"},
    )
    assert changed["attachmentEvidence"]["extractionPolicyHash"] != first["attachmentEvidence"]["extractionPolicyHash"]


def test_cv_execution_revision_changes_even_when_new_implementation_emits_identical_facts(tmp_path, monkeypatch):
    from omega_vision.services import video_import_semantics as semantics
    unit_dir = tmp_path / "data" / "omega_vision" / "curated" / "unit"
    unit_dir.mkdir(parents=True)
    image = source_image(unit_dir / "source.png")
    unit = {"image": image, "dir": unit_dir, "id": "source", "workspaceRoot": tmp_path}
    transformation, doer = semantics.PARTS.split("/")
    options = {"filter": "none"}
    assert api.run_transform_step(unit, transformation, doer, options)["status"] == "written"
    output = unit_dir / transformation / doer
    facts = (output / "result.pl").read_bytes()
    revision = api._read_output_revision(output / "meta.json")
    assert api.run_transform_step(unit, transformation, doer, options)["status"] == "skipped"
    implementation = semantics._implementation_revision
    monkeypatch.setattr(semantics, "_implementation_revision", lambda stage: {
        **implementation(stage), "simulatedImplementation": "updated",
    })
    assert api.run_transform_step(unit, transformation, doer, options)["status"] == "written"
    assert (output / "result.pl").read_bytes() == facts
    assert api._read_output_revision(output / "meta.json") != revision
