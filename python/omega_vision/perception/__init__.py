"""omega_vision.perception - turn a rendered frame into a symbolic part-graph
without an LLM: perception (quantize / connected-components / topology) in
Python, grouping in SWI-Prolog.

Public entry point: ``symbolic_arc.extract_frame(png_path, char)``.

Runtime dependencies:
  - Python: numpy, scipy, Pillow
  - System: SWI-Prolog (``swipl`` on PATH)
  - Prolog rules: the ``*.pl`` files in ``prolog/omega_vision/``
"""
