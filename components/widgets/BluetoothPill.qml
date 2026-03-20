import QtQuick
import QtQuick.Layouts
import qs.services
import "../effects/"
import "../primitives/"

MateriaPill {
    id: bluetoothPill

    accentRole: "primary"
    semanticState: {
        if (BluetoothService.connectedCount > 0)
            return "active";
        if (BluetoothService.isTransitioning)
            return "info";
        if (BluetoothService.isBlocked)
            return "warning";
        return "normal";
    }

    clickable: true
    onClicked: BluetoothService.toggleBluetooth()

    Behavior on implicitWidth {
        Anim {}
    }

    Behavior on color {
        CAnim {}
    }

    Behavior on scale {
        Anim {}
    }

    RowLayout {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        StylizedIcon {
            iconName: BluetoothService.iconName
            overlayColor: bluetoothPill.textColor
        }
    }
}
