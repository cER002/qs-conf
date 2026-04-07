import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.config
import qs.components.widgets

Variants {
    model: Quickshell.screens
    PanelWindow {
        id: barWindow

        required property var modelData

        WlrLayershell.namespace: "quickshell-navbar"
        screen: modelData
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: Config.bar.height
        color: "transparent"

        Row {
            anchors {
                left: parent.left
                margins: 8
                verticalCenter: parent.verticalCenter
            }
            spacing: 8

            WorkspacePill {}
            ActiveWindowPill {}
        }

        ClockPill {
            anchors.centerIn: parent
        }

        Row {
            anchors {
                right: parent.right
                margins: 8
                verticalCenter: parent.verticalCenter
            }
            spacing: 8
            layoutDirection: Qt.RightToLeft

            BatteryPill {}
            StatusWidget {}
            SystemTrayPill {}
        }
    }
}
