pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    property var sink: Pipewire.defaultAudioSink
    property int volume: sink?.audio ? Math.round(sink.audio.volume * 100) : 0
    property bool isMuted: !!sink?.audio?.muted
    property string iconName: {
        if (!sink || isMuted || volume === 0)
            return "audio-volume-muted";
        if (volume < 33)
            return "audio-volume-low";
        if (volume < 67)
            return "audio-volume-medium";
        return "audio-volume-high";
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
