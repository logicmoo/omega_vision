import { useEffect, useMemo, useState, type MouseEvent } from "react";
import { ResourceSourceEditor } from "@app/components/ResourceSourceEditor";

type PrologClause = {
  index: number;
  predicate: string;
  arity: number;
  args: string[];
  source: string;
  metta: string;
  sourcePath: string;
  sourceLabel: string;
};

type PredicateGroup = {
  key: string;
  predicate: string;
  arity: number;
  clauses: PrologClause[];
};

type ParsedProlog = {
  source: string;
  clauses: PrologClause[];
  predicates: PredicateGroup[];
};

export type PrologInspectorSource = {
  sourcePath: string;
  sourceUrl: string;
  label: string;
};

type InspectorProps = {
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

function splitTopLevel(text: string, delimiter = ","): string[] {
  const parts: string[] = [];
  let start = 0;
  let parens = 0;
  let brackets = 0;
  let braces = 0;
  let quote = "";
  let escaped = false;

  for (let index = 0; index < text.length; index += 1) {
    const char = text[index];
    if (quote) {
      if (escaped) escaped = false;
      else if (char === "\\") escaped = true;
      else if (char === quote) quote = "";
      continue;
    }
    if (char === "'" || char === '"') {
      quote = char;
      continue;
    }
    if (char === "(") parens += 1;
    else if (char === ")") parens -= 1;
    else if (char === "[") brackets += 1;
    else if (char === "]") brackets -= 1;
    else if (char === "{") braces += 1;
    else if (char === "}") braces -= 1;
    else if (char === delimiter && parens === 0 && brackets === 0 && braces === 0) {
      parts.push(text.slice(start, index).trim());
      start = index + 1;
    }
  }
  const tail = text.slice(start).trim();
  if (tail) parts.push(tail);
  return parts;
}

function splitPrologStatements(source: string): string[] {
  const statements: string[] = [];
  let current = "";
  let parens = 0;
  let brackets = 0;
  let braces = 0;
  let quote = "";
  let escaped = false;
  let lineComment = false;

  for (let index = 0; index < source.length; index += 1) {
    const char = source[index];
    if (lineComment) {
      if (char === "\n") {
        lineComment = false;
        current += char;
      }
      continue;
    }
    if (quote) {
      current += char;
      if (escaped) escaped = false;
      else if (char === "\\") escaped = true;
      else if (char === quote) quote = "";
      continue;
    }
    if (char === "%") {
      lineComment = true;
      continue;
    }
    if (char === "'" || char === '"') {
      quote = char;
      current += char;
      continue;
    }
    if (char === "(") parens += 1;
    else if (char === ")") parens -= 1;
    else if (char === "[") brackets += 1;
    else if (char === "]") brackets -= 1;
    else if (char === "{") braces += 1;
    else if (char === "}") braces -= 1;
    current += char;
    if (char === "." && parens === 0 && brackets === 0 && braces === 0) {
      const statement = current.trim();
      if (statement) statements.push(statement);
      current = "";
    }
  }
  return statements;
}

function topLevelRuleSeparator(text: string): number {
  let parens = 0;
  let brackets = 0;
  let quote = "";
  let escaped = false;
  for (let index = 0; index < text.length - 1; index += 1) {
    const char = text[index];
    if (quote) {
      if (escaped) escaped = false;
      else if (char === "\\") escaped = true;
      else if (char === quote) quote = "";
      continue;
    }
    if (char === "'" || char === '"') quote = char;
    else if (char === "(") parens += 1;
    else if (char === ")") parens -= 1;
    else if (char === "[") brackets += 1;
    else if (char === "]") brackets -= 1;
    else if (char === ":" && text[index + 1] === "-" && parens === 0 && brackets === 0) return index;
  }
  return -1;
}

function prologTermToMetta(term: string): string {
  const value = term.trim();
  if (!value) return "";
  if (value.startsWith("[") && value.endsWith("]")) {
    const members = splitTopLevel(value.slice(1, -1));
    return members.length ? `(list ${members.map(prologTermToMetta).join(" ")})` : "(list)";
  }
  if ((value.startsWith("'") && value.endsWith("'")) || (value.startsWith('"') && value.endsWith('"'))) {
    return JSON.stringify(value.slice(1, -1).replace(/\\(['"\\])/g, "$1"));
  }
  const match = /^([a-z][A-Za-z0-9_]*)\s*\(([\s\S]*)\)$/.exec(value);
  if (!match) return value;
  const args = splitTopLevel(match[2]).map(prologTermToMetta);
  return args.length ? `(${match[1]} ${args.join(" ")})` : `(${match[1]})`;
}

function groupClausesByPredicate(clauses: PrologClause[]): PredicateGroup[] {
  const byPredicate = new Map<string, PredicateGroup>();
  for (const clause of clauses) {
    const key = `${clause.predicate}/${clause.arity}`;
    const group = byPredicate.get(key) || {
      key,
      predicate: clause.predicate,
      arity: clause.arity,
      clauses: [],
    };
    group.clauses.push(clause);
    byPredicate.set(key, group);
  }
  return [...byPredicate.values()];
}

export function parsePrologData(source: string, sourcePath = "", sourceLabel = sourcePath || "Prolog source"): ParsedProlog {
  const clauses: PrologClause[] = [];
  for (const statement of splitPrologStatements(source)) {
    const body = statement.replace(/\.\s*$/, "").trim();
    if (!body || body.startsWith(":-") || body.startsWith("?-")) continue;
    const ruleAt = topLevelRuleSeparator(body);
    const head = (ruleAt >= 0 ? body.slice(0, ruleAt) : body).trim();
    const match = /^([a-z][A-Za-z0-9_]*)(?:\s*\(([\s\S]*)\))?$/.exec(head);
    if (!match) continue;
    const args = match[2] === undefined || !match[2].trim() ? [] : splitTopLevel(match[2]);
    clauses.push({
      index: clauses.length,
      predicate: match[1],
      arity: args.length,
      args,
      source: statement,
      metta: ruleAt >= 0
        ? `; Prolog rule retained in PL view only: ${statement.replace(/\s+/g, " ")}`
        : prologTermToMetta(head),
      sourcePath,
      sourceLabel,
    });
  }

  return { source, clauses, predicates: groupClausesByPredicate(clauses) };
}

function clausePreview(clause: PrologClause): string {
  const singleLine = clause.source.replace(/\s+/g, " ").trim();
  return singleLine.length > 68 ? `${singleLine.slice(0, 65)}...` : singleLine;
}

export function PrologDataInspector({
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
  const [activeSourcePath, setActiveSourcePath] = useState<string | null>(sourcePath);
  const [reload, setReload] = useState(0);
  const [format, setFormat] = useState<"pl" | "metta" | "json">("pl");
  const [selectedPredicate, setSelectedPredicate] = useState<string | null>(null);
  const [query, setQuery] = useState("");
  const [copyStatus, setCopyStatus] = useState("");

  useEffect(() => {
    const controller = new AbortController();
    setDocuments(new Map(availableSources.map((definition) => [
      definition.sourcePath,
      { definition, text: null, error: "" },
    ])));
    setSelectedPredicate(null);
    for (const definition of availableSources) {
      void (async () => {
        try {
          const response = await fetch(definition.sourceUrl, { cache: "no-store", signal: controller.signal });
          if (!response.ok) throw new Error(`HTTP ${response.status} while reading ${definition.sourcePath}`);
          const text = await response.text();
          if (controller.signal.aborted) return;
          setDocuments((previous) => {
            const next = new Map(previous);
            next.set(definition.sourcePath, { definition, text, error: "" });
            return next;
          });
        } catch (reason) {
          if (controller.signal.aborted) return;
          setDocuments((previous) => {
            const next = new Map(previous);
            next.set(definition.sourcePath, {
              definition,
              text: null,
              error: reason instanceof Error ? reason.message : String(reason),
            });
            return next;
          });
        }
      })();
    }
    return () => controller.abort();
  }, [reload, sourceSignature]);

  useEffect(() => {
    setActiveSourcePath(sourcePath);
    setSelectedPredicate(null);
    setQuery("");
  }, [sourcePath]);

  const parsedDocuments = useMemo(() => {
    const parsed = new Map<string, ParsedProlog>();
    for (const definition of availableSources) {
      const document = documents.get(definition.sourcePath);
      if (document?.text !== null && document?.text !== undefined) {
        parsed.set(
          definition.sourcePath,
          parsePrologData(document.text, definition.sourcePath, definition.label),
        );
      }
    }
    return parsed;
  }, [availableSources, documents]);
  const parsed = useMemo(() => {
    if (activeSourcePath) {
      return parsedDocuments.get(activeSourcePath) || { source: "", clauses: [], predicates: [] };
    }
    const loaded = availableSources.flatMap((definition) => {
      const document = parsedDocuments.get(definition.sourcePath);
      return document ? [{ definition, document }] : [];
    });
    const clauses = loaded
      .flatMap(({ document }) => document.clauses)
      .map((clause, index) => ({ ...clause, index }));
    return {
      source: loaded.map(({ definition, document }) =>
        `% --- ${definition.label}: ${definition.sourcePath} ---\n${document.source}`
      ).join("\n\n"),
      clauses,
      predicates: groupClausesByPredicate(clauses),
    };
  }, [activeSourcePath, availableSources, parsedDocuments]);
  const activeDefinition = activeSourcePath
    ? availableSources.find((source) => source.sourcePath === activeSourcePath)
    : undefined;
  const activeDocument = activeDefinition ? documents.get(activeDefinition.sourcePath) : undefined;
  const loadedCount = availableSources.filter((source) => parsedDocuments.has(source.sourcePath)).length;
  const loading = activeDefinition
    ? !activeDocument || (activeDocument.text === null && !activeDocument.error)
    : loadedCount === 0 && availableSources.some((source) => !documents.get(source.sourcePath)?.error);
  const error = activeDefinition
    ? activeDocument?.error || ""
    : loadedCount === 0
      ? availableSources.map((source) => documents.get(source.sourcePath)?.error).filter(Boolean).join(" | ")
      : "";
  const normalizedQuery = query.trim().toLowerCase();
  const visiblePredicates = useMemo(() => parsed.predicates.filter((group) =>
    !normalizedQuery
    || group.key.toLowerCase().includes(normalizedQuery)
    || group.clauses.some((clause) => clause.source.toLowerCase().includes(normalizedQuery))
  ), [normalizedQuery, parsed.predicates]);
  const selectedGroup = selectedPredicate
    ? parsed.predicates.find((group) => group.key === selectedPredicate)
    : undefined;
  const visibleClauses = (selectedGroup ? selectedGroup.clauses : parsed.clauses).filter((clause) =>
    !normalizedQuery
    || clause.source.toLowerCase().includes(normalizedQuery)
    || `${clause.predicate}/${clause.arity}`.includes(normalizedQuery)
  );
  const visibleText = format === "metta"
    ? visibleClauses.map((clause) => clause.metta).join("\n")
    : format === "json"
      ? JSON.stringify({
          sources: availableSources
            .filter((source) => activeSourcePath === null || source.sourcePath === activeSourcePath)
            .map((source) => ({
              label: source.label,
              path: source.sourcePath,
            })),
          clauses: visibleClauses.map((clause) => ({
            predicate: clause.predicate,
            arity: clause.arity,
            arguments: clause.args,
            source: clause.sourcePath,
            prolog: clause.source,
            metta: clause.metta,
          })),
        }, null, 2)
      : !selectedGroup && !normalizedQuery
        ? parsed.source
        : visibleClauses.map((clause) => clause.source).join("\n");
  const editorLanguage = format === "pl" ? "prolog" : format === "json" ? "json" : "clojure";

  const stopRowToggle = (event: MouseEvent<HTMLElement>) => event.stopPropagation();
  const copyVisible = async () => {
    try {
      await navigator.clipboard.writeText(visibleText);
      setCopyStatus("Copied");
    } catch (reason) {
      setCopyStatus(reason instanceof Error ? reason.message : "Copy failed");
    }
  };

  return (
    <section className="video-import-prolog-inspector" onClick={stopRowToggle} onKeyDown={(event) => event.stopPropagation()}>
      <header className="video-import-prolog-head">
        <span className="video-import-prolog-fileicon">{format === "pl" ? "PL" : format === "metta" ? "M" : "J"}</span>
        <span className="video-import-prolog-title">
          <b>{activeDefinition?.label || `All ${availableSources.length} symbolic sources`}</b>
          <code>{activeDefinition?.sourcePath || `${loadedCount} loaded filesystem sources`}</code>
        </span>
        {!loading && !error && (
          <span className="video-import-prolog-summary">
            <span>{parsed.clauses.length} clauses</span>
            <span>{parsed.predicates.length} predicates</span>
            <span>{activeDefinition ? "read-only generated output" : `${loadedCount}/${availableSources.length} sources loaded`}</span>
          </span>
        )}
        <span className="video-import-prolog-formats" role="group" aria-label="Symbolic representation">
          <button type="button" className={format === "pl" ? "is-active" : ""} onClick={() => setFormat("pl")}>PL source</button>
          <button type="button" className={format === "metta" ? "is-active" : ""} onClick={() => setFormat("metta")}>MeTTa</button>
          <button type="button" className={format === "json" ? "is-active" : ""} onClick={() => setFormat("json")}>JSON</button>
        </span>
        <button type="button" className="video-import-prolog-close" aria-label="Close Prolog data inspector" onClick={onClose}>x</button>
      </header>
      <div className="video-import-prolog-tabs" role="tablist" aria-label="Loaded symbolic source files">
        <button
          type="button"
          role="tab"
          aria-selected={activeSourcePath === null}
          className={activeSourcePath === null ? "is-active" : ""}
          onClick={() => {
            setActiveSourcePath(null);
            setSelectedPredicate(null);
          }}
        >
          <span>All sources</span>
          <b>{[...parsedDocuments.values()].reduce((total, document) => total + document.clauses.length, 0)}</b>
        </button>
        {availableSources.map((definition) => {
          const document = documents.get(definition.sourcePath);
          const count = parsedDocuments.get(definition.sourcePath)?.clauses.length;
          return (
            <button
              type="button"
              role="tab"
              aria-selected={activeSourcePath === definition.sourcePath}
              className={activeSourcePath === definition.sourcePath ? "is-active" : ""}
              key={definition.sourcePath}
              title={definition.sourcePath}
              onClick={() => {
                setActiveSourcePath(definition.sourcePath);
                setSelectedPredicate(null);
              }}
            >
              <span>{definition.label}</span>
              <b>{document?.error ? "!" : count ?? "..."}</b>
            </button>
          );
        })}
      </div>
      {error ? (
        <div className="video-import-prolog-message is-error">
          <b>Could not load symbolic source data.</b>
          <span>{error}</span>
          <button type="button" onClick={() => setReload((value) => value + 1)}>Retry</button>
        </div>
      ) : loading ? (
        <div className="video-import-prolog-message">Loading {activeDefinition?.sourcePath || "symbolic sources"}...</div>
      ) : (
        <>
          <div className="video-import-prolog-toolbar">
            <input
              type="search"
              value={query}
              onChange={(event) => setQuery(event.target.value)}
              placeholder="Filter predicates or clause text..."
              aria-label="Filter Prolog predicates or clauses"
            />
            <span>{selectedGroup ? selectedGroup.key : "All predicates"}</span>
            <button type="button" onClick={() => void copyVisible()}>Copy visible</button>
            {copyStatus && <em>{copyStatus}</em>}
          </div>
          <div className="video-import-prolog-split">
            <nav className="video-import-prolog-tree" aria-label="Predicate and arity tree">
              <div className="video-import-prolog-treehead">
                <span>Predicate / arity</span><span>Clauses</span>
              </div>
              <button
                type="button"
                className={`video-import-prolog-predicate${selectedPredicate === null ? " is-active" : ""}`}
                onClick={() => setSelectedPredicate(null)}
              >
                <span className="video-import-prolog-chevron">-</span>
                <b>All predicates</b>
                <span className="video-import-prolog-count">{parsed.clauses.length}</span>
              </button>
              {visiblePredicates.map((group) => {
                const active = group.key === selectedPredicate;
                return (
                  <div className="video-import-prolog-group" key={group.key}>
                    <button
                      type="button"
                      className={`video-import-prolog-predicate${active ? " is-active" : ""}`}
                      onClick={() => setSelectedPredicate(active ? null : group.key)}
                    >
                      <span className="video-import-prolog-chevron">{active ? "v" : ">"}</span>
                      <b>{group.key}</b>
                      <span className="video-import-prolog-count">{group.clauses.length}</span>
                    </button>
                    {active && (
                      <ol>
                        {group.clauses.map((clause, index) => <li key={clause.index} title={clause.source}>{index + 1}. {clausePreview(clause)}</li>)}
                      </ol>
                    )}
                  </div>
                );
              })}
              {visiblePredicates.length === 0 && <div className="video-import-prolog-empty">No matching predicate heads.</div>}
            </nav>
            <div className="video-import-prolog-source-editor">
              <ResourceSourceEditor
                key={`${activeSourcePath || "__all__"}:${format}`}
                value={visibleText || `No ${selectedGroup ? selectedGroup.key : "clauses"} match the current filter.`}
                onChange={() => undefined}
                label={`${format === "pl" ? "Prolog" : format === "metta" ? "MeTTa" : "JSON"} clause source`}
                sourcePath={activeDefinition?.sourcePath || `all-sources.${format === "pl" ? "pl" : format}`}
                showEnablement={false}
                contentReadOnly
                defaultFormat="text"
                defaultTextLang={editorLanguage}
              />
            </div>
          </div>
          <footer className="video-import-prolog-foot">
            <span className="is-ok">Parsed successfully</span>
            <span>{
              format === "pl"
                ? activeDefinition ? "Exact filesystem source" : "Combined exact filesystem sources"
                : format === "metta" ? "Generated MeTTa view" : "Generated structured JSON view"
            }</span>
            <span>{visibleClauses.length} visible clauses</span>
          </footer>
        </>
      )}
    </section>
  );
}
