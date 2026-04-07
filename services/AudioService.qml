pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    property PwNode defaultSink: Pipewire.defaultAudioSink
    property PwNode defaultSource: Pipewire.defaultAudioSource
    property int defaultSinkVolume: defaultSink?.audio ? Math.round(defaultSink.audio.volume * 100) : 0
    property int defaultSourceVolume: defaultSource?.audio ? Math.round(defaultSource.audio.volume * 100) : 0
    property bool isSinkMuted: !!defaultSink?.audio?.muted
    property bool isSourceMuted: !!defaultSource?.audio?.muted
    property string iconNameAlternative: {
        if (!defaultSource || isSourceMuted || defaultSourceVolume === 0)
            return "audio-input-microphone-muted";
        if (defaultSourceVolume < 33)
            return "audio-input-microphone-low";
        if (defaultSourceVolume < 67)
            return "audio-input-microphone-medium";
        return "audio-input-microphone-high";
    }
    property string iconName: {
        if (!defaultSink || isSinkMuted || defaultSinkVolume === 0)
            return "audio-volume-muted";
        if (defaultSinkVolume < 33)
            return "audio-volume-low";
        if (defaultSinkVolume < 67)
            return "audio-volume-medium";
        return "audio-volume-high";
    }

    function changeVolume(step) {
        if (defaultSink?.audio) {
            let newVolume = (defaultSinkVolume + step) / 100.0;
            defaultSink.audio.volume = Math.max(0.0, Math.min(1.0, newVolume));
            if (isSinkMuted && step > 0)
                defaultSink.audio.muted = false;
        }
    }

    function toggleMute() {
        if (defaultSink?.audio) {
            defaultSink.audio.muted = !defaultSink.audio.muted;
        }
    }

    PwObjectTracker {
        objects: [root.defaultSink, root.defaultSource]
    }
}
