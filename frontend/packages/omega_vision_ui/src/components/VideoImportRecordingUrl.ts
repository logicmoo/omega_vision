const RECORDING_QUERY_PARAMETER = "recording";

export function recordingFromUrl(href: string): string {
  return new URL(href).searchParams.get(RECORDING_QUERY_PARAMETER)?.trim() || "";
}

export function urlWithRecording(href: string, recording: string): string {
  const url = new URL(href);
  const normalized = recording.trim();
  if (normalized) url.searchParams.set(RECORDING_QUERY_PARAMETER, normalized);
  else url.searchParams.delete(RECORDING_QUERY_PARAMETER);
  return url.toString();
}
