pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property int brightness: 0
    property bool isAvailable: true

    Process {
        id: brightnessProc
        running: true

        command: ["sh", "-c", "brightnessctl i -m | cut -d',' -f4 | tr -d '%'; inotifywait -m -e modify /sys/class/backlight/intel_backlight/brightness -q | while read -r _ ; do brightnessctl i -m | cut -d',' -f4 | tr -d '%'; done"]

        stdout: SplitParser {
            splitMarker: "\n"
            onRead: data => {
                let brightness = parseInt(data);
                if (!isNaN(brightness)) {
                    root.brightness = brightness;
                }
            }
        }
    }
}
