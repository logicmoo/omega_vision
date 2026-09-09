from __future__ import annotations

from omega_vision.perception.image_preprocessing import (
    ORIGINAL_PIXELS_ID,
    chain_signature,
    cumulative_scale,
    default_chain,
    effective_steps,
    is_effectively_original,
    is_noop_step,
    normalize_chain,
    validate_chain,
)


def test_default_chain_is_two_stable_original_pixels_rows():
    chain = default_chain()
    assert [s["entryId"] for s in chain] == [ORIGINAL_PIXELS_ID, ORIGINAL_PIXELS_ID]
    assert [s["stepId"] for s in chain] == ["pp-original-1", "pp-original-2"]
    assert all(is_noop_step(s) for s in chain)
    assert is_effectively_original(chain)


def test_normalize_preserves_ids_generates_missing_and_dedupes():
    raw = [
        {"stepId": "keep", "entryId": "skill:darken_light_gradients", "params": {"maxLightnessDelta": 8}},
        {"entryId": "scale_3x_nearest"},  # missing stepId -> generated
        {"stepId": "keep", "entryId": ORIGINAL_PIXELS_ID},  # duplicate id -> regenerated
        "not-a-dict",  # dropped
    ]
    chain = normalize_chain(raw, id_factory=lambda: "gen")
    assert chain[0]["stepId"] == "keep"
    assert chain[0]["params"] == {"maxLightnessDelta": 8}
    assert chain[1]["entryId"] == "scale_3x_nearest" and chain[1]["params"] == {}
    ids = [s["stepId"] for s in chain]
    assert len(ids) == len(set(ids)) == 3  # unique, non-dict dropped


def test_normalize_non_list_yields_default():
    assert normalize_chain(None) == default_chain()
    assert normalize_chain("x") == default_chain()


def test_effective_steps_drops_noops_and_empty_is_original():
    chain = [
        {"stepId": "a", "entryId": ORIGINAL_PIXELS_ID, "params": {}},
        {"stepId": "b", "entryId": "scale_3x_nearest", "params": {}},
        {"stepId": "c", "entryId": ORIGINAL_PIXELS_ID, "params": {}},
    ]
    eff = effective_steps(chain)
    assert [s["entryId"] for s in eff] == ["scale_3x_nearest"]
    assert not is_effectively_original(chain)
    assert is_effectively_original([{"entryId": ORIGINAL_PIXELS_ID}])
    assert is_effectively_original([])


def test_validate_chain_flags_unknown_and_non_materializable():
    chain = [
        {"stepId": "a", "entryId": ORIGINAL_PIXELS_ID},
        {"stepId": "b", "entryId": "scale_3x_nearest"},
        {"stepId": "c", "entryId": "nope"},
        {"stepId": "d", "entryId": "skill:probe_only"},
    ]
    errors = validate_chain(
        chain,
        valid_entry_ids={"scale_3x_nearest", "skill:probe_only"},
        materializable_entry_ids={"scale_3x_nearest"},
    )
    assert any("nope" in e and "not a registered filter" in e for e in errors)
    assert any("probe_only" in e and "not deterministic/materializable" in e for e in errors)
    assert not any("scale_3x_nearest" in e for e in errors)
    assert not any(ORIGINAL_PIXELS_ID in e for e in errors)


def test_chain_signature_is_original_when_effectively_empty():
    assert chain_signature("src1", default_chain()) == "original:src1"
    assert chain_signature("src1", []) == "original:src1"


def test_chain_signature_depends_on_steps_params_order_and_source():
    base = [{"entryId": "scale_3x_nearest", "params": {}},
            {"entryId": "skill:darken_light_gradients", "params": {"maxLightnessDelta": 16}}]
    sig = chain_signature("src", base)
    assert sig.startswith("chain:")
    # same inputs -> same signature
    assert chain_signature("src", base) == sig
    # different source
    assert chain_signature("src2", base) != sig
    # different params
    changed = [dict(base[0]), {"entryId": "skill:darken_light_gradients", "params": {"maxLightnessDelta": 8}}]
    assert chain_signature("src", changed) != sig
    # different order
    assert chain_signature("src", list(reversed(base))) != sig
    # per-filter version participates
    assert chain_signature("src", base, registry_versions={"scale_3x_nearest": "2"}) != sig


def test_cumulative_scale_multiplies_effective_steps():
    chain = [
        {"entryId": ORIGINAL_PIXELS_ID},
        {"entryId": "scale_3x_nearest"},
        {"entryId": "skill:darken_light_gradients"},
    ]
    scales = {"scale_3x_nearest": 3.0}
    scale = cumulative_scale(chain, lambda eid, params: scales.get(eid, 1.0))
    assert scale == 3.0
    assert cumulative_scale(default_chain(), lambda eid, params: 3.0) == 1.0
