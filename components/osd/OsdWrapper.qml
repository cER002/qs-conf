pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.services

Item {
    id: root

    required property ShellScreen screen

    property real currentValue: 0
    property string currentMode: "audio"
    property bool isVisible: false
    property bool isReady: false

    function showOsd(value, mode) {
        if (!root.isReady) {
            return;
        }
        if (root.screen.name !== HyprlandService.focusedMonitor.name) {
            return;
        }
        root.currentValue = value;
        root.currentMode = mode;
        root.isVisible = true;

        killTimer.restart();
    }

    Timer {
        running: true
        interval: 1000
        onTriggered: root.isReady = true
    }

    Timer {
        id: killTimer
        interval: 2000
        onTriggered: root.isVisible = false
    }

    Connections {
        target: AudioService
        function onVolumeChanged(): void {
            root.showOsd(AudioService.volume / 100, "audio");
        }
    }

    Connections {
        target: BrightnessService
        function onBrightnessChanged(): void {
            root.showOsd(BrightnessService.brightness / 100, "brightness");
        }
    }

    LazyLoader {
        id: osd
        active: root.isVisible

        PanelWindow {
            screen: root.screen

            exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Overlay

            anchors.bottom: true
            margins.bottom: 120

            color: "transparent"
            implicitWidth: background.width
            implicitHeight: background.height

            OsdBackground {
                id: background
                isActive: root.isVisible

                OsdContent {
                    percent: root.currentValue
                    mode: root.currentMode
                }
            }
        }
    }
}
