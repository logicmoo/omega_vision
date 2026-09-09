import { memoryRequest } from "@app/components/MemorySession";
import { record, semanticJson, type SemanticPlan } from "./SemanticEventsModel";
import type { SemanticContext, SemanticExecutionApi, SemanticExecutionState } from "./SemanticEventsPanel";

const base = "/workbench/video-import";

export async function postSemanticMemoryAction(
  path: string, body: Record<string, unknown>, signal: AbortSignal,
): Promise<Record<string, unknown>> {
  return record(await memoryRequest(`${base}/semantic${path}`, body, signal));
}

export function createSemanticExecutionApi(beforeCommit: () => Promise<void>): SemanticExecutionApi {
  const post = async (path: string, body: Record<string, unknown>, signal: AbortSignal,
    onProgress?: (receipt: Record<string, unknown>) => void, readOnly = false) => record(
    await memoryRequest(`${base}${path}`, body, signal, onProgress, readOnly),
  );
  const request = (context: SemanticContext, stageId: string) => ({ ...context, stageId });
  return {
    async read(context, signal) {
      const value = await post("/semantic/execution/read", { ...context }, signal, undefined, true);
      for (const field of ["frames", "stages", "todos", "jobs", "artifacts", "outputs"]) {
        if (!Array.isArray(value[field])) throw new Error(`Execution response is missing ${field}.`);
      }
      if (Array.isArray(value.errors) && value.errors.length) {
        throw new Error(`Some saved stage records could not be read: ${JSON.stringify(value.errors)}`);
      }
      return value as unknown as SemanticExecutionState;
    },
    async plan(context, stageId, signal) {
      await beforeCommit();
      return await post("/semantic/execution/plan", request(context, stageId), signal) as SemanticPlan;
    },
    async commit(context, plan, run, signal) {
      await beforeCommit();
      return new Promise<Record<string, unknown>>((resolve, reject) => {
        void post("/semantic/execution/commit", {
          ...request(context, plan.stageId), run, confirmed: true, confirmationKey: plan.confirmationKey,
        }, signal, resolve).then(resolve, reject);
      });
    },
    async cancel(context, job, signal) {
      return record(await semanticJson(`${base}/jobs/cancel`, {
        method: "POST", signal, headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ workspaceId: context.workspaceId, jobId: job.id }),
      }));
    },
  };
}
