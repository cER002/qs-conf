import QtQuick
import Quickshell
import qs.config
import "../../components/widgets/"

Variants {
    model: Quickshell.screens
    PanelWindow {
        id: barWindow

        required property var modelData

        screen: modelData
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: Config.bar.height
        color: "transparent"

        Rectangle {
            id: barContent
            width: parent.width
            height: parent.height
            color: "transparent"

            Row {
                anchors {
                    left: parent.left
                    margins: 8
                    verticalCenter: parent.verticalCenter
                }
                spacing: 8

                ClockPill {}
                WorkspacePill {}
                ActiveWindowPill {}
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
}
