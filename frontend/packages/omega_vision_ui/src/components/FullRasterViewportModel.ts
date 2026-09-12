export function fitRasterViewport(width: number, height: number, availableWidth: number, availableHeight: number) {
  if (!Number.isSafeInteger(width) || !Number.isSafeInteger(height) || width <= 0 || height <= 0
      || !Number.isFinite(availableWidth) || !Number.isFinite(availableHeight)
      || availableWidth <= 2 || availableHeight <= 2) return null;
  const scale = Math.min((availableWidth - 2) / width, (availableHeight - 2) / height);
  return { width: width * scale, height: height * scale, scale };
}
