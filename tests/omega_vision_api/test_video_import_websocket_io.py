import asyncio
import json
import threading
from starlette.websockets import WebSocketDisconnect

from omega_vision.services import video_import_api as api
from omega_vision.services import video_import_pipeline as pipeline


def test_websocket_path_io_is_off_loop_and_cached_until_workspace_changes(tmp_path, monkeypatch):
    resolutions = []
    pushed_states = {}
    loop_thread = threading.get_ident()
    for workspace in ("first", "second"):
        directory = tmp_path / workspace
        directory.mkdir()
        (directory / "page_state.json").write_text(json.dumps({"members": [{"id": workspace}]}))

    def workspace_root(workspace):
        assert threading.get_ident() != loop_thread, "workspace filesystem lookup blocked the event loop"
        resolutions.append(workspace)
        return tmp_path / workspace

    monkeypatch.setattr(api, "_workspace_root", workspace_root)
    monkeypatch.setattr(api, "_imports_root", lambda root: root)
    monkeypatch.setattr(pipeline, "get_run", lambda _: None)
    monkeypatch.setattr(pipeline, "get_runs", lambda _: [])
    job_tick = [0]

    def jobs(_):
        job_tick[0] += 1
        return [{"id": str(job_tick[0])}]

    monkeypatch.setattr(api, "_list_workspace_jobs", jobs)

    async def exercise():
        class Socket:
            def __init__(self):
                self.receives = 0
                self.first_pushes = 0
                self.switch = asyncio.Event()
                self.close = asyncio.Event()

            async def accept(self):
                pass

            async def receive_json(self):
                self.receives += 1
                if self.receives == 1:
                    return {"cmd": "subscribe", "workspaceId": "first"}
                if self.receives == 2:
                    await self.switch.wait()
                    return {"cmd": "subscribe", "workspaceId": "second"}
                await self.close.wait()
                raise WebSocketDisconnect()

            async def send_json(self, message):
                if message["type"] == "state":
                    pushed_states[message["workspaceId"]] = message["members"]
                if message["type"] != "jobs":
                    return
                if message["workspaceId"] == "first":
                    self.first_pushes += 1
                    if self.first_pushes == 2:
                        self.switch.set()
                else:
                    self.close.set()

        await asyncio.wait_for(api.pipeline_ws(Socket()), timeout=10)

    asyncio.run(exercise())
    assert resolutions == ["first", "second"]
    assert pushed_states == {"first": [{"id": "first"}], "second": [{"id": "second"}]}
