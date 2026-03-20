pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Bluetooth

Singleton {
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

    property string iconName: {
        if (!adapter)
            return "bluetooth-disabled";
        if (adapter.state === BluetoothAdapterState.Disabled || adapter.state === BluetoothAdapterState.Blocked) {
            return "bluetooth-disabled";
        }
        if (connectedCount > 0) {
            return "bluetooth-paired";
        }
        return "bluetooth-disconnected";
    }

    property bool isTransitioning: {
        if (!adapter)
            return false;
        return adapter.state === BluetoothAdapterState.Enabling || adapter.state === BluetoothAdapterState.Disabling;
    }

    property bool isBlocked: {
        if (!adapter)
            return false;
        return adapter.state === BluetoothAdapterState.Blocked;
    }

    function toggleBluetooth() {
        if (!adapter) {
            return;
        }

        if (adapter.state === BluetoothAdapterState.Disabled || adapter.state === BluetoothAdapterState.Disabling) {
            adapter.enabled = true;
        } else if (adapter.state === BluetoothAdapterState.Enabled || adapter.state === BluetoothAdapterState.Enabling) {
            adapter.enabled = false;
        }
    }
}
