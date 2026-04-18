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
            color: bluetoothButton.containsMouse ? Color.setAlpha(Theme.colorOnPrimaryContainer, 0.2) : "transparent"
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            radius: parent.height / 2

            StylizedIcon {
                id: bluetoothIcon
                implicitSize: Config.pill.imageSize
                anchors.centerIn: parent
                iconName: BluetoothService.iconName
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
            color: wifiButton.containsMouse ? Color.setAlpha(Theme.colorOnPrimaryContainer, 0.2) : "transparent"
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            radius: parent.height / 2

            StylizedIcon {
                id: wifiIcon
                implicitSize: Config.pill.imageSize
                anchors.centerIn: parent
                iconName: NetworkService.iconName
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
            color: audioButton.containsMouse ? Color.setAlpha(Theme.colorOnPrimaryContainer, 0.2) : "transparent"
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            radius: parent.height / 2

            StylizedIcon {
                id: audioIcon
                implicitSize: Config.pill.imageSize
                anchors.centerIn: parent
                iconName: AudioService.iconName
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
