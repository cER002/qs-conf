pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.config
import qs.services

Item {
    id: root

    property var modelData: ({})
    default property Component islandComponent
    property var activeNotif: NotificationService.popups.length > 0 ? NotificationService.popups[0] : null
    property bool showNotif: activeNotif != null

    onActiveNotifChanged: {
        if (activeNotif !== null) {
            root.modelData = {
                summary: activeNotif.summary || "",
                body: activeNotif.body || "",
                appIcon: activeNotif.appIcon || "",
                appName: activeNotif.appName || "",
                image: activeNotif.image || "",
                actions: activeNotif.actions || []
            };
        }
    }

    LazyLoader {
        active: root.showNotif

        PanelWindow {
            id: islandRoot
            anchors.bottom: true
            color: "transparent"

            exclusionMode: ExclusionMode.Ignore
            WlrLayershell.namespace: "quickshell-notify"
            WlrLayershell.layer: WlrLayer.Overlay

            implicitHeight: 200
            implicitWidth: 800
            margins.bottom: 12

            Rectangle {
                id: islandBackground

                readonly property real maxWidth: 700
                readonly property real maxHeight: 150
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                implicitWidth: Math.min(maxWidth, (contentLoader.item ? contentLoader.item.implicitWidth + 40 : 200))
                implicitHeight: Math.min(maxHeight, (contentLoader.item ? contentLoader.item.implicitHeight + 20 : 60))
                radius: implicitHeight / 2

                color: Theme.surfaceContainerHighest

                transformOrigin: Item.Center

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        if (root.activeNotif !== null) {
                            console.log("notification clicked");

                            if (root.activeNotif.actions.invoke) {
                                root.activeNotif.actions.invoke();
                            }
                        }
                    }
                }

                Behavior on implicitWidth {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.OutExpo
                    }
                }

                Behavior on implicitHeight {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.OutExpo
                    }
                }

                SequentialAnimation {
                    id: bumpAnim

                    NumberAnimation {
                        target: islandBackground
                        property: "scale"
                        to: 1.05
                        duration: 100
                        easing.type: Easing.OutCubic
                    }
                    NumberAnimation {
                        target: islandBackground
                        property: "scale"
                        to: 1.0
                        duration: 250
                        easing.type: Easing.OutBounce
                    }
                }

                Connections {
                    target: root
                    function onActiveNotifChanged() {
                        if (root.activeNotif !== null) {
                            bumpAnim.restart();
                        }
                    }
                }
                NumberAnimation on scale {
                    from: 0
                    to: 1
                    duration: 600
                    easing.type: Easing.OutBack
                }

                NumberAnimation on opacity {
                    from: 0.8
                    to: 1.0
                    duration: 600
                }

                Loader {
                    id: contentLoader
                    anchors.centerIn: parent
                    sourceComponent: root.islandComponent
                }
            }
        }
    }
}
