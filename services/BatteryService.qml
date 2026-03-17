pragma Singleton
import QtQuick
import Quickshell.Services.UPower

QtObject {
    id: root

    property int percentage: Math.round(UPower.displayDevice.percentage * 100)
    property bool isCharging: !UPower.onBattery
    property string iconName: {
        let level = Math.round(percentage / 10) * 10;
        let levelStr = level.toString().padStart(3, '0');
        return "battery-" + levelStr + (isCharging ? "-charging" : "");
    }
    property string text: percentage + "%"
}
