pragma Singleton
import QtQuick
import Quickshell.Services.UPower

QtObject {
    id: root

    property int percentage: Math.round(UPower.displayDevice.percentage * 100)
    property bool isCharging: !UPower.onBattery
    property string batterySymbol: {
        if (isCharging)
            return "󰂄 ";
        if (percentage === 100)
            return "󰁹 ";
        if (percentage > 90)
            return "󰂂 ";
        if (percentage > 80)
            return "󰂁 ";
        if (percentage > 70)
            return "󰂀 ";
        if (percentage > 60)
            return "󰁿";
        if (percentage > 50)
            return "󰁾 ";
        if (percentage > 40)
            return "󰁽 ";
        if (percentage > 30)
            return "󰁼 ";
        if (percentage > 20)
            return "󰁻 ";
        if (percentage > 10)
            return "󰁺 ";
        return "󰂎 ";
    }
    property string text: batterySymbol + percentage + "%"
}
