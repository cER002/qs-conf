pragma ComponentBehavior: Bound
pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property string ssid: "Disconnected"
    property int signalStrength: 0
    property string connectionState: "Wifi off"

    property bool isConnected: connectionState === "connected"
    property bool isConnecting: connectionState === "connecting"
    property bool isDisconnected: connectionState === "disconnected"
    property bool isDisconnecting: connectionState === "disconnecting"
    property bool isUnavailable: connectionState === "unavailable"
    property bool isTransitioning: isConnecting || isDisconnecting

    property string iconName: {
        if (isTransitioning)
            return "network-wireless-acquiring";
        if (isDisconnected)
            return "network-wireless-disconnected";
        if (signalStrength > 80)
            return "network-wireless-signal-excellent";
        if (signalStrength > 60)
            return "network-wireless-signal-good";
        if (signalStrength > 40)
            return "network-wireless-signal-ok";
        if (signalStrength > 20)
            return "network-wireless-signal-weak";
        return "network-wireless-signal-none";
    }

    Process {
        id: wifiStateFetcher

        running: true

        command: ["sh", "-c", "line=$(nmcli -t -f TYPE,STATE,CONNECTION dev | grep '^wifi:' | head -n 1); state=$(echo \"$line\" | cut -d':' -f2); ssid=$(echo \"$line\" | cut -d':' -f3); if [ \"$state\" = \"connected\" ]; then sig=$(nmcli -t -f active,signal dev wifi | grep '^yes' | head -n 1 | cut -d':' -f2); echo \"connected:$ssid:${sig:-0}\"; elif [ \"$state\" = \"deactivating\" ]; then echo \"disconnecting::0\"; elif [ \"$state\" = \"unavailable\" ]; then echo \"unavailable::0\"; elif [ \"$state\" = \"disconnected\" ]; then echo \"disconnected::0\"; else echo \"connecting:$ssid:0\"; fi"]

        stdout: SplitParser {
            splitMarker: "\n"
            onRead: data => {
                let parts = data.split(":");
                if (parts.length >= 3) {
                    root.connectionState = parts[0];
                    root.ssid = parts[1];
                    root.signalStrength = parseInt(parts[2]);
                }
            }
        }
    }

    Process {
        id: monitorProc

        running: true
        command: ["nmcli", "monitor"]

        stdout: SplitParser {
            splitMarker: "\n"
            onRead: data => {
                wifiStateFetcher.running = true;
            }
        }

        onExited: monitorRestartTimer.start()
    }

    Timer {
        id: monitorRestartTimer
        interval: 2000
        onTriggered: monitorProc.running = true
    }

    function toggleWifi() {
        if (isUnavailable) {
            toggleWifiProc.command = ["nmcli", "radio", 'wifi', 'on'];
        }
        if (!isUnavailable) {
            toggleWifiProc.command = ["nmcli", "radio", 'wifi', 'off'];
        }

        toggleWifiProc.running = true;
    }

    Process {
        id: toggleWifiProc
    }
}
