import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";
import { fitRasterViewport } from "./FullRasterViewportModel.ts";

test("the entire rectangular viewport fits with its border, preserving source aspect ratio", () => {
  for (const [width, height, availableWidth, availableHeight] of [
    [48, 32, 700, 340], [48, 32, 260, 500], [16, 64, 300, 220], [1024, 512, 200, 100],
  ]) {
    const fitted = fitRasterViewport(width, height, availableWidth, availableHeight);
    assert.ok(fitted.width + 2 <= availableWidth + 1e-8);
    assert.ok(fitted.height + 2 <= availableHeight + 1e-8);
    assert.ok(Math.abs(fitted.width / fitted.height - width / height) < 1e-8);
    assert.ok(Math.abs(fitted.width + 2 - availableWidth) < 1e-8 || Math.abs(fitted.height + 2 - availableHeight) < 1e-8);
  }
});

test("unknown source size and collapsed panes cannot invent a viewport", () => {
  for (const args of [[0, 32, 700, 340], [48, NaN, 700, 340], [48, 32, 0, 100], [48, 32, 100, Infinity]]) {
    assert.equal(fitRasterViewport(...args), null);
  }
});

test("checkerboard belongs only to exact source bounds for both observed and native images", () => {
  const read = path => readFileSync(new URL(path, import.meta.url), "utf8");
  const css = read("../styles/full_raster_viewport.css");
  assert.match(css, /\.full-raster-viewport \{[\s\S]*?border: 1px solid[\s\S]*?conic-gradient/);
  assert.match(css, /\.full-raster-viewport \.arc3-visual-sequence-image,[\s\S]*?background: transparent/);
  assert.match(read("./Arc3VisualSequencePlayer.tsx"), /naturalWidth[\s\S]*?naturalHeight/);
  assert.match(read("./Arc3VisualSequencePlayer.tsx"), /Full viewport:/);
  assert.match(read("./SpotlightDemo.tsx"), /<FullRasterViewport width=\{frame.width\} height=\{frame.height\}>/);
});
