pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Qt5Compat.GraphicalEffects
import qs.components.effects
import qs.components.primitives

MateriaPill {
    id: trayPill

    property bool isExpanded: false

    accentRole: "primary"
    semanticState: isExpanded ? "active" : "normal"

    Item {
        id: trayLayout

        implicitWidth: trayMask.width + arrowBtn.width

        Item {
            id: trayMask

            anchors.right: arrowBtn.left
            anchors.verticalCenter: parent.verticalCenter
            implicitWidth: (trayPill.isExpanded ? iconRow.implicitWidth + 18 : 0)
            visible: width > 0
            implicitHeight: trayPill.implicitHeight + 20

            Rectangle {
                id: pillMask
                width: trayMask.width
                height: trayMask.height
                radius: height / 2
                visible: false
            }

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: pillMask
            }

            Behavior on implicitWidth {
                Anim {
                    duration: 550
                }
            }

            Row {
                id: iconRow
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                layoutDirection: Qt.RightToLeft
                spacing: 12

                Repeater {
                    model: SystemTray.items

                    delegate: TrayItem {}
                }
            }
        }

        MouseArea {
            id: arrowBtn
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            width: 18
            height: 18
            cursorShape: Qt.PointingHandCursor
            onClicked: trayPill.isExpanded = !trayPill.isExpanded

            StylizedIcon {
                anchors.centerIn: parent
                source: Quickshell.iconPath("arrow-down", "go-previous")
                width: 20
                height: 20
                scale: arrowBtn.pressed ? 0.85 : 1.0
                rotation: trayPill.isExpanded ? 90 : 0

                Behavior on scale {
                    NumberAnimation {
                        duration: 150
                        easing.type: Easing.OutQuint
                    }
                }
                Behavior on rotation {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.OutQuint
                    }
                }
            }
        }
    }
}
