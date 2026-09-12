import { useId, useState, type ReactNode } from "react";
import { Arc3VisualSequencePlayer } from "./Arc3VisualSequencePlayer";
import { RecordingTests } from "./RecordingTests";
import type { VisualSequenceCatalogEntry } from "./VideoImportRecordingUrl";
import type { RecordingTest } from "./RecordingTestsModel";
import { SpotlightControls, SpotlightMemoryBoard, SpotlightResults, useSpotlightDemo } from "./SpotlightDemo";
import { SequencePlaybackCoordinator } from "./VisualSequencePlayback";

type Props = {
  workspaceId: string; sequence: VisualSequenceCatalogEntry; onClose: () => void;
  renderTestResults?: (test: RecordingTest) => ReactNode;
};

export function VisualSequenceDemoView(props: Props) {
  return <VisualSequenceDemoSession key={`${props.workspaceId}:${props.sequence.id}`} {...props} />;
}

function VisualSequenceDemoSession({ workspaceId, sequence, onClose, renderTestResults }: Props) {
  const [controlsVisible, setControlsVisible] = useState(false);
  const [playbackCoordinator] = useState(() => new SequencePlaybackCoordinator());
  const playerId = useId();
  const spotlight = useSpotlightDemo(workspaceId, sequence.id, controlsVisible, playbackCoordinator);
  return <section className="visual-sequence-demo" aria-label="Sequence demo and frame player">
    <div className="visual-sequence-demo-toolbar">
      <span>Stored-frame demo · no game required</span>
      <button type="button" aria-expanded={controlsVisible} aria-controls={playerId}
        onClick={() => {
          if (controlsVisible) playbackCoordinator.pauseAll();
          setControlsVisible(value => !value);
        }}>
        {controlsVisible ? "Hide controls" : "Add controls"}
      </button>
    </div>
    {controlsVisible && <SpotlightControls demo={spotlight} />}
    {spotlight.registered && <SpotlightResults demo={spotlight} />}
    <div id={playerId} className="visual-sequence-demo-player">
      <Arc3VisualSequencePlayer workspaceId={workspaceId} sequence={sequence}
        onClose={onClose} controlsVisible={controlsVisible}
        playbackCoordinator={playbackCoordinator} navigationDisabled={spotlight.testPlaying || Boolean(spotlight.busy)}
        frameIndex={spotlight.frameIndex} onFrameIndexChange={spotlight.setFrameIndex}
        comparison={spotlight.registered ? <SpotlightMemoryBoard demo={spotlight} controlsVisible={controlsVisible} /> : undefined} />
    </div>
    {renderTestResults && <RecordingTests workspaceId={workspaceId} visualSequenceId={sequence.id}
      controlsVisible={false} showRecordingPreview={false}
      presentation="runtime" renderResults={renderTestResults} />}
  </section>;
}
