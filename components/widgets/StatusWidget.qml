import QtQuick
import QtQuick.Layouts
import qs.services
import qs.utils
import qs.config
import qs.components.primitives
import qs.components.effects

MateriaPill {
    id: root

    RowLayout {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        StylizedRect {
            color: bluetoothButton.containsMouse ? Color.setAlpha(Theme.colorOnPrimaryContainer, 0.25) : "transparent"
            Layout.preferredHeight: 34
            Layout.preferredWidth: 34
            radius: parent.height / 2

            StylizedIcon {
                id: bluetoothIcon
                anchors.centerIn: parent
                iconName: BluetoothService.iconName
                overlayColor: root.textColor
                scale: bluetoothButton.pressed ? 0.9 : 1

                Behavior on scale {
                    Anim {}
                }

                MouseArea {
                    id: bluetoothButton
                    hoverEnabled: true
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: BluetoothService.toggleBluetooth()
                }
            }
        }

        StylizedRect {
            color: wifiButton.containsMouse ? Color.setAlpha(Theme.colorOnPrimaryContainer, 0.25) : "transparent"
            Layout.preferredHeight: 34
            Layout.preferredWidth: 34
            radius: parent.height / 2

            StylizedIcon {
                id: wifiIcon
                anchors.centerIn: parent
                iconName: NetworkService.iconName
                overlayColor: root.textColor
                scale: wifiButton.pressed ? 0.9 : 1

                Behavior on scale {
                    Anim {}
                }

                MouseArea {
                    id: wifiButton
                    hoverEnabled: true
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: NetworkService.toggleWifi()
                }
            }
        }

        StylizedRect {
            color: audioButton.containsMouse ? Color.setAlpha(Theme.colorOnPrimaryContainer, 0.25) : "transparent"
            Layout.preferredHeight: 34
            Layout.preferredWidth: 34
            radius: parent.height / 2

            StylizedIcon {
                id: audioIcon
                anchors.centerIn: parent
                iconName: AudioService.iconName
                overlayColor: root.textColor
                scale: audioButton.pressed ? 0.9 : 1

                Behavior on scale {
                    Anim {}
                }

                MouseArea {
                    id: audioButton
                    hoverEnabled: true
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: AudioService.toggleMute()
                }
            }
        }
    }
}
