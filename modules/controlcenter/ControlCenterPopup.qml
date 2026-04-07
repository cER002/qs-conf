pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import qs.config
import qs.services
import "../../components/primitives"

PopupWindow {
    id: root

    visible: false
    color: "transparent"

    Process { id: poweroffProc; command: ["systemctl", "poweroff"] }
    Process { id: rebootProc; command: ["systemctl", "reboot"] }
    Process { id: suspendProc; command: ["systemctl", "suspend"] }

    Rectangle {
        width: 320
        height: mainLayout.implicitHeight + 32
        color: Theme.surfaceContainer
        radius: Config.pill.radius
        border.width: 1
        border.color: Theme.outlineVariant

        ColumnLayout {
            id: mainLayout
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                margins: 16
            }
            spacing: 16

            // Top Row: Toggles
            RowLayout {
                Layout.fillWidth: true
                spacing: 8

                SimpleToggle {
                    Layout.fillWidth: true
                    iconName: NetworkService.iconName
                    isActive: NetworkService.isConnected
                    onClicked: NetworkService.toggleWifi()
                }

                SimpleToggle {
                    Layout.fillWidth: true
                    iconName: BluetoothService.iconName
                    isActive: BluetoothService.isEnabled
                    onClicked: BluetoothService.toggleBluetooth()
                }

                SimpleToggle {
                    Layout.fillWidth: true
                    iconName: AudioService.iconName
                    isActive: !AudioService.isMuted && AudioService.volume > 0
                    onClicked: AudioService.toggleMute()
                }
            }

            // Middle Section: Sliders
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                SimpleSlider {
                    Layout.fillWidth: true
                    iconName: BrightnessService.iconName
                    value: BrightnessService.brightness
                    onValueChangedByUser: newValue => {
                        // Using brightnessctl directly to set brightness
                        let p = Qt.createQmlObject('import Quickshell.Io; Process { running: true; command: ["brightnessctl", "s", "' + newValue + '%"] }', root);
                        p.onExited.connect(() => p.destroy());
                    }
                }

                SimpleSlider {
                    Layout.fillWidth: true
                    iconName: AudioService.iconName
                    value: AudioService.volume
                    onValueChangedByUser: newValue => {
                        let step = newValue - AudioService.volume;
                        AudioService.changeVolume(step);
                    }
                }
            }

            // Bottom Row: Power Options
            RowLayout {
                Layout.fillWidth: true
                spacing: 8

                SimpleToggle {
                    Layout.fillWidth: true
                    iconName: "system-shutdown"
                    onClicked: poweroffProc.running = true
                }

                SimpleToggle {
                    Layout.fillWidth: true
                    iconName: "system-reboot"
                    onClicked: rebootProc.running = true
                }

                SimpleToggle {
                    Layout.fillWidth: true
                    iconName: "system-suspend"
                    onClicked: suspendProc.running = true
                }
            }
        }
    }
}