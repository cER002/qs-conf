import QtQuick
import "../../config/"
import "../../services/"
import "../primitives/"

MateriaPill {
    text: BluetoothService.text
    info: BluetoothService.isEnabled && BluetoothService.connectedCount === 0
    active: BluetoothService.connectedCount > 0
    clickable: true
    onClicked: BluetoothService.toggleBluetooth()
}
