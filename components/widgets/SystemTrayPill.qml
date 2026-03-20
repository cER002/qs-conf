pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import Qt5Compat.GraphicalEffects
import "../effects/"
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
                Anim {}
            }

            Row {
                id: iconRow
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                layoutDirection: Qt.RightToLeft
                spacing: 8

                Repeater {
                    model: SystemTray.items

                    delegate: MouseArea {
                        id: iconDelegate
                        required property SystemTrayItem modelData

                        width: 18
                        height: 18
                        acceptedButtons: Qt.LeftButton | Qt.RightButton
                        cursorShape: Qt.PointingHandCursor

                        QsMenuAnchor {
                            id: menuAnchor
                            anchor.item: iconDelegate
                            menu: iconDelegate.modelData.menu
                        }

                        StylizedIcon {
                            layer.enabled: false
                            anchors.fill: parent
                            scale: iconDelegate.pressed ? 0.9 : 1.0
                            source: iconDelegate.modelData.icon
                        }

                        onClicked: mouse => {
                            if (mouse.button === Qt.LeftButton) {
                                iconDelegate.modelData.activate();
                            } else if (mouse.button === Qt.RightButton) {
                                if (iconDelegate.modelData.hasMenu) {
                                    menuAnchor.open();
                                } else {
                                    iconDelegate.modelData.secondaryActivate();
                                }
                            }
                        }
                    }
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
                source: Quickshell.iconPath("pan-start-symbolic", "go-previous")
                overlayColor: trayPill.textColor
                width: 16
                height: 16
                scale: arrowBtn.pressed ? 0.85 : 1.0
                rotation: trayPill.isExpanded ? 0 : -90

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
