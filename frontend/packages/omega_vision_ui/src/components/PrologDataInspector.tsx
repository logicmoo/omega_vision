import { useEffect, useMemo, useState, type MouseEvent } from "react";
import {
  PrologClauseExplorer,
  type SourceFile,
} from "./PrologClauseExplorer";

export { parsePrologData } from "./PrologClauseExplorer";

export type PrologInspectorSource = {
  sourcePath: string;
  sourceUrl: string;
  label: string;
};

type InspectorProps = {
  workspaceId: string;
  sourcePath: string;
  sourceUrl: string;
  sources?: PrologInspectorSource[];
  title?: string;
  onClose: () => void;
};

type LoadedSource = {
  definition: PrologInspectorSource;
  text: string | null;
  error: string;
};

function basename(path: string): string {
  return path.split(/[\\/]/).filter(Boolean).at(-1) || path;
}

async function loadSource(
  definition: PrologInspectorSource,
  signal?: AbortSignal,
): Promise<LoadedSource> {
  try {
    const response = await fetch(definition.sourceUrl, {
      cache: "no-store",
      signal,
    });
    if (!response.ok) throw new Error(`HTTP ${response.status} while reading ${basename(definition.sourcePath)}`);
    return { definition, text: await response.text(), error: "" };
  } catch (reason) {
    if (signal?.aborted) throw reason;
    return {
      definition,
      text: null,
      error: reason instanceof Error ? reason.message : String(reason),
    };
  }
}

export function PrologDataInspector({
  workspaceId,
  sourcePath,
  sourceUrl,
  sources = [],
  title = "OpenCV symbolic data",
  onClose,
}: InspectorProps) {
  const availableSources = useMemo(() => {
    const primary = sources.find((source) => source.sourcePath === sourcePath) || {
      sourcePath,
      sourceUrl,
      label: title,
    };
    const ordered = [primary, ...sources.filter((source) => source.sourcePath !== sourcePath)];
    const unique = new Map<string, PrologInspectorSource>();
    for (const source of ordered) {
      if (source.sourcePath && source.sourceUrl && !unique.has(source.sourcePath)) {
        unique.set(source.sourcePath, source);
      }
    }
    return [...unique.values()];
  }, [sourcePath, sourceUrl, sources, title]);
  const sourceSignature = availableSources
    .map((source) => `${source.sourcePath}\u0000${source.sourceUrl}\u0000${source.label}`)
    .join("\u0001");
  const [documents, setDocuments] = useState<Map<string, LoadedSource>>(new Map());
  const [retrying, setRetrying] = useState(false);

  useEffect(() => {
    const controller = new AbortController();
    setDocuments(new Map(availableSources.map((definition) => [
      definition.sourcePath,
      { definition, text: null, error: "" },
    ])));

    void Promise.all(availableSources.map((definition) => loadSource(definition, controller.signal))).then((loaded) => {
      if (controller.signal.aborted) return;
      setDocuments(new Map(loaded.map((document) => [document.definition.sourcePath, document])));
    }).catch(() => undefined);

    return () => controller.abort();
  }, [sourceSignature]);

  const loadedSources = useMemo<SourceFile[]>(() => availableSources.map((definition) => {
    const document = documents.get(definition.sourcePath);
    return {
      name: definition.sourcePath,
      label: definition.label,
      text: document?.text || "",
      dialect: "prolog" as const,
      readOnly: true,
    };
  }), [availableSources, documents]);
  const loadedSourceCount = availableSources.filter((definition) =>
    documents.get(definition.sourcePath)?.text !== null
    && documents.get(definition.sourcePath)?.text !== undefined
  ).length;
  const errors = availableSources.flatMap((definition) => {
    const error = documents.get(definition.sourcePath)?.error;
    return error ? [`${basename(definition.label || definition.sourcePath)}: ${error}`] : [];
  });
  const loading = availableSources.some((definition) => {
    const document = documents.get(definition.sourcePath);
    return !document || (document.text === null && !document.error);
  });
  const reloadSource = async (source: SourceFile) => {
    const definition = availableSources.find((candidate) => candidate.sourcePath === source.name);
    if (!definition) throw new Error("The active source is no longer part of this completed transform row.");
    const loaded = await loadSource(definition);
    setDocuments((previous) => new Map(previous).set(definition.sourcePath, loaded));
    if (loaded.error) throw new Error(loaded.error);
  };
  const retryFailedSources = async () => {
    const failed = availableSources.filter((definition) =>
      Boolean(documents.get(definition.sourcePath)?.error)
    );
    if (!failed.length) return;
    setRetrying(true);
    try {
      const loaded = await Promise.all(failed.map((definition) => loadSource(definition)));
      setDocuments((previous) => {
        const next = new Map(previous);
        for (const document of loaded) next.set(document.definition.sourcePath, document);
        return next;
      });
    } finally {
      setRetrying(false);
    }
  };
  const stopRowToggle = (event: MouseEvent<HTMLElement>) => event.stopPropagation();

  return (
    <section
      className="video-import-prolog-inspector"
      onClick={stopRowToggle}
      onKeyDown={(event) => event.stopPropagation()}
    >
      {loading ? (
        <div className="video-import-prolog-message">
          <span>Loading {availableSources.length} real filesystem source{availableSources.length === 1 ? "" : "s"}...</span>
          <button type="button" onClick={onClose}>Close</button>
        </div>
      ) : (
        <>
          {errors.length > 0 && (
            <div className="video-import-prolog-load-warning">
              <span>{loadedSourceCount}/{availableSources.length} sources loaded. {errors.join(" | ")}</span>
              <button type="button" disabled={retrying} onClick={() => void retryFailedSources()}>
                {retrying ? "Retrying failed sources..." : "Retry failed sources"}
              </button>
            </div>
          )}
          <PrologClauseExplorer
            key={sourceSignature}
            sources={loadedSources}
            initialSource={sourcePath}
            pageSize={20}
            rootLimit={30}
            workspaceId={workspaceId}
            onReloadSource={reloadSource}
            onClose={onClose}
          />
        </>
      )}
    </section>
  );
}
