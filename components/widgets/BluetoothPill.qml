import QtQuick
import QtQuick.Layouts
import "../../services/"
import "../primitives/"

MateriaPill {
    id: bluetoothPill
    active: BluetoothService.connectedCount > 0
    info: BluetoothService.isTransitioning
    warning: BluetoothService.isBlocked
    clickable: true
    onClicked: BluetoothService.toggleBluetooth()

    RowLayout {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        StylizedIcon {
            iconName: BluetoothService.iconName
            overlayColor: bluetoothPill.textColor
        }

        StylizedText {
            text: BluetoothService.text
            color: bluetoothPill.textColor
        }
    }
}
