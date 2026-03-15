pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Scope {
    id: root

    property var sink: Pipewire.defaultAudioSink
    property int volume: sink?.audio ? Math.round(sink.audio.volume * 100) : 0
    property bool isMuted: !!sink?.audio?.muted

    property string currentVolume: {
        if (isMuted)
            return "  " + volume + "%";
        if (volume > 66)
            return "  " + volume + "%";
        if (volume > 33)
            return "  " + volume + "%";
        return " " + volume + "%";
    }

    function changeVolume(step) {
        if (sink?.audio) {
            let newVolume = (volume + step) / 100.0;
            sink.audio.volume = Math.max(0.0, Math.min(1.0, newVolume));
            if (isMuted && step > 0)
                sink.audio.muted = false;
        }
    }

    function toggleMute() {
        if (sink?.audio) {
            sink.audio.muted = !sink.audio.muted;
        }
    }

    PwObjectTracker {
        objects: [root.sink]
    }
}
