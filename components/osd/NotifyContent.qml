import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications
import qs.utils
import qs.config
import qs.components.primitives

Item {
    id: root
    required property Notification modelData
    implicitWidth: 400
    implicitHeight: innerLayout.implicitHeight + 32

    RowLayout {
        id: innerLayout
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 16
        spacing: 20

        Item {
            id: mediaBox
            Layout.alignment: Qt.AlignTop
            Layout.preferredWidth: Config.notify.imageSize
            Layout.preferredHeight: Config.notify.imageSize
            readonly property bool hasImage: root.modelData && root.modelData.image && root.modelData.image !== ""
            readonly property bool hasIcon: root.modelData && root.modelData.appIcon && root.modelData.appIcon !== ""

            visible: hasImage || hasIcon
            IconImage {
                anchors.fill: parent
                source: root.modelData.image !== "" ? root.modelData.image : Quickshell.iconPath(root.modelData?.appIcon, "application-x-executable")
                asynchronous: !source.toString().startsWith("image://")
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Rectangle {
                        width: Config.notify.imageSize
                        height: Config.notify.imageSize
                        radius: 10
                    }
                }
            }

            Rectangle {
                width: 30
                height: 30
                radius: 12
                color: Theme.surfaceContainerHighest
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    bottomMargin: -8
                    leftMargin: -8
                }
                visible: mediaBox.hasImage && mediaBox.hasIcon

                IconImage {
                    anchors.centerIn: parent
                    width: Config.notify.imageSizeSmall
                    height: Config.notify.imageSizeSmall
                    source: root.modelData?.appIcon ? Quickshell.iconPath(root.modelData.appIcon) : ""
                    mipmap: true
                    smooth: true
                }
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            spacing: 4

            StylizedText {
                Layout.fillWidth: true
                text: root.modelData.summary
                color: Theme.colorOnSurface
                font.bold: true
                font.pixelSize: 18
                elide: Text.ElideRight
            }

            StylizedText {
                Layout.fillWidth: true
                maximumLineCount: 3
                wrapMode: Text.Wrap
                visible: root.modelData.body !== ""
                text: root.modelData.body
                color: Theme.colorOnSurfaceVariant
                font.pixelSize: 14
                elide: Text.ElideRight
                textFormat: Text.StyledText
                linkColor: Theme.primary

                onLinkActivated: function (link) {
                    Qt.openUrlExternally(link);
                    root.modelData.dismiss();
                }
                HoverHandler {
                    cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.topMargin: 8
                spacing: 8
                visible: {
                    if (root.modelData.actions.length === 0) {
                        return false;
                    }

                    if (root.modelData.actions.length === 1 && (root.modelData.actions[0].text === "Activate" || root.modelData.actions[0].text === "View")) {
                        return false;
                    }

                    return true;
                }
                Repeater {
                    model: root.modelData.actions
                    delegate: Rectangle {
                        id: actionBtn
                        required property NotificationAction modelData
                        visible: actionBtn.modelData.text !== "Activate" ? true : actionBtn.modelData.text !== "View" ? true : false
                        Layout.fillWidth: true
                        Layout.preferredHeight: 32
                        radius: 6
                        color: actionMouseArea.containsMouse ? Color.setAlpha(Theme.surfaceContainer, 0.4) : Theme.surfaceContainer

                        StylizedText {
                            anchors.centerIn: parent
                            text: actionBtn.modelData.text
                            color: Theme.colorOnSurface
                            font.pixelSize: 13
                        }

                        MouseArea {
                            id: actionMouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: actionBtn.modelData.invoke()
                        }
                    }
                }
            }
        }
    }
}
