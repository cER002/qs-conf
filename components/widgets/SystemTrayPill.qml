pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import Qt5Compat.GraphicalEffects
import qs.components.primitives

MateriaPill {
    id: trayPill
    defaultWidthAnimation: false
    active: isExpanded
    property bool isExpanded: false

    Item {
        id: wrapper
        implicitWidth: (trayPill.isExpanded ? iconRow.implicitWidth + 8 : 0) + arrowBtn.width
        implicitHeight: 18

        Behavior on implicitWidth {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutQuint
            }
        }

        Item {
            id: iconContainer
            anchors.left: parent.left
            anchors.right: arrowBtn.left
            anchors.rightMargin: trayPill.isExpanded ? 8 : 0
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            clip: true

            Row {
                id: iconRow
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
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

                        IconImage {
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

            IconImage {
                anchors.centerIn: parent
                source: Quickshell.iconPath("pan-start-symbolic", "go-previous")
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

                layer.enabled: true
                layer.effect: ColorOverlay {
                    color: trayPill.textColor
                }
            }
        }
    }
}
