pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Bluetooth

Scope {
    id: root

    property var adapter: Bluetooth.defaultAdapter

    property int connectedCount: {
        let count = 0;
        let devs = Bluetooth.devices?.values ?? [];

        for (let i = 0; i < devs.length; i++) {
            if (devs[i]?.connected) {
                count++;
            }
        }
        return count;
    }

    property bool isEnabled: (adapter?.enabled ?? false) || (connectedCount > 0)

    property string text: {
        if (!isEnabled)
            return "󰂲";
        if (connectedCount <= 0)
            return "󰂯";
        return "󰂱 " + connectedCount;
    }

    function toggleBluetooth() {
        if (!adapter) {
            return;
        }

        if (adapter.state === BluetoothAdapterState.Disabled || adapter.state === BluetoothAdapterState.Disabling) {
            adapter.enabled = true;
        } else if (adapter.state === BluetoothAdapterState.Enabled || adapter.state === BluetoothAdapterState.Enabling) {
            adapter.enabled = false;
        } else if (adapter.state === BluetoothAdapterState.Blocked) {
            console.log("WARNING: Bluetooth is blocked by a physical/software killswitch (rfkill)!");
        }
    }
}
