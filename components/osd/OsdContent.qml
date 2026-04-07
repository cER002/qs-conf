pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import qs.config
import qs.services
import qs.components.effects
import qs.components.primitives

Item {
    id: root

    required property real percent
    required property string mode

    implicitWidth: 220
    implicitHeight: 40

    RowLayout {
        id: layout
        anchors.centerIn: parent
        spacing: 12

        StylizedIcon {
            iconName: {
                switch (root.mode) {
                    case "audio": return AudioService.iconName
                    case "mic": return AudioService.iconNameAlternative
                    case "brightness": return BrightnessService.iconName
                }
            } 
            implicitSize: 32
        }

        Item {
            Layout.preferredWidth: 180
            Layout.preferredHeight: 12

            Item {
                id: barContent
                anchors.fill: parent
                visible: false

                Rectangle {
                    anchors.fill: parent
                    color: Theme.surfaceVariant
                }

                Rectangle {
                    id: fillRect
                    height: parent.height
                    width: parent.width * Math.max(0, Math.min(1, root.percent))
                    color: Theme.primary

                    Behavior on width {
                        Anim {}
                    }
                }
            }

            OpacityMask {
                anchors.fill: parent
                source: barContent
                maskSource: Rectangle {
                    width: barContent.width
                    height: barContent.height
                    radius: 6
                }
            }
        }
    }
}
