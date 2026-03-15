pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Scope {
    id: root

    property string ssid: "Disconnected"
    property int signalStrength: 0
    property bool isConnected: false

    property string wifiSymbol: {
        if (!isConnected)
            return "󰤭  ";
        if (signalStrength > 80)
            return "󰤨  ";
        if (signalStrength > 60)
            return "󰤥  ";
        if (signalStrength > 40)
            return "󰤢  ";
        if (signalStrength > 20)
            return "󰤟  ";
        return "󰤯  ";
    }

    property string text: wifiSymbol + (isConnected ? ssid : "Disconnected")

    Process {
        id: wifiProcess

        command: ["sh", "-c", "wifi=$(nmcli -t -f active,ssid,signal dev wifi | grep '^yes' | head -n 1); if [ -z \"$wifi\" ]; then echo 'no:Disconnected:0'; else echo \"$wifi\"; fi"]

        stdout: SplitParser {
            splitMarker: "\n"
            onRead: data => {
                let parts = data.split(":");
                if (parts.length >= 3) {
                    root.isConnected = (parts[0] === "yes");
                    root.ssid = parts[1];
                    root.signalStrength = parseInt(parts[2]);
                }
            }
        }
    }

    Timer {
        interval: 3000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: wifiProcess.running = true
    }
}
