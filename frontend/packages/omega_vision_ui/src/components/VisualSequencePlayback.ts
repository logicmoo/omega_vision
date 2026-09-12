export type PlaybackChannel = "frames" | "test";

export class SequencePlaybackCoordinator {
  private owner: { channel: PlaybackChannel; pause: () => void } | null = null;
  private held: PlaybackChannel | null = null;
  private holdTicket = 0;
  claim(channel: PlaybackChannel, pause: () => void): boolean {
    if (this.held && this.held !== channel) return false;
    if (this.owner?.channel !== channel) this.owner?.pause();
    this.owner = { channel, pause };
    return true;
  }
  release(channel: PlaybackChannel) {
    if (this.owner?.channel === channel) this.owner = null;
  }
  hold(channel: PlaybackChannel): number {
    if (this.owner?.channel !== channel) this.owner?.pause();
    this.held = channel;
    return ++this.holdTicket;
  }
  unhold(channel: PlaybackChannel, ticket?: number) {
    if (this.held === channel && (ticket === undefined || ticket === this.holdTicket)) this.held = null;
  }
  pauseAll() { this.owner?.pause(); }
}

type PlaybackOptions = {
  coordinator: SequencePlaybackCoordinator;
  channel: PlaybackChannel;
  allowed: () => boolean;
  ready: () => boolean;
  atEnd: () => boolean;
  advance: () => boolean | Promise<boolean>;
  paceMs: () => number;
  suspensionEpoch: () => number;
  onPlayingChange: (playing: boolean) => void;
  onError?: (error: unknown) => void;
};
export type PlaybackClock = {
  setTimeout: (callback: () => void, milliseconds: number) => unknown;
  clearTimeout: (handle: unknown) => void;
};
const defaultClock: PlaybackClock = {
  setTimeout: (callback, milliseconds) => setTimeout(callback, milliseconds),
  clearTimeout: handle => clearTimeout(handle as ReturnType<typeof setTimeout>),
};

/** One paced operation at a time. Loading waits for notify(), never a polling loop. */
export class PacedSequencePlayback {
  private options: PlaybackOptions;
  private clock: PlaybackClock;
  private timer: unknown = null;
  private ticket = 0;
  private inFlight = false;
  private startedEpoch = 0;
  playing = false;
  constructor(options: PlaybackOptions, clock: PlaybackClock = defaultClock) {
    this.options = options;
    this.clock = clock;
  }
  play(): boolean {
    if (this.playing) return true;
    if (!this.options.allowed() || this.options.atEnd()
      || !this.options.coordinator.claim(this.options.channel, () => this.pause())) return false;
    this.startedEpoch = this.options.suspensionEpoch();
    this.playing = true;
    this.options.onPlayingChange(true);
    this.notify();
    return this.playing;
  }
  pause() {
    this.clearTimer();
    this.options.coordinator.release(this.options.channel);
    if (this.playing) { this.playing = false; this.options.onPlayingChange(false); }
  }
  notify(resetPace = false) {
    if (!this.playing) return;
    if (!this.options.allowed() || this.options.suspensionEpoch() !== this.startedEpoch || this.options.atEnd()) {
      this.pause();
      return;
    }
    if (resetPace || !this.options.ready()) this.clearTimer();
    if (this.inFlight || this.timer !== null || !this.options.ready()) return;
    const pace = this.options.paceMs();
    if (!Number.isFinite(pace) || pace < 100 || pace > 10000) {
      this.pause();
      return;
    }
    const ticket = ++this.ticket;
    this.timer = this.clock.setTimeout(() => void this.tick(ticket), pace);
  }
  private clearTimer() {
    ++this.ticket;
    if (this.timer !== null) this.clock.clearTimeout(this.timer);
    this.timer = null;
  }
  private async tick(ticket: number) {
    if (ticket !== this.ticket || !this.playing) return;
    this.timer = null;
    if (!this.options.allowed() || this.options.suspensionEpoch() !== this.startedEpoch || this.options.atEnd()) {
      this.pause();
      return;
    }
    if (!this.options.ready()) return;
    this.inFlight = true;
    try {
      if (!await this.options.advance()) this.pause();
    } catch (error) {
      this.pause();
      this.options.onError?.(error);
    } finally {
      this.inFlight = false;
      this.notify();
    }
  }
}
