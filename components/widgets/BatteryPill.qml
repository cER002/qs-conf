import QtQuick
import QtQuick.Layouts
import "../effects/"
import qs.services
import qs.components.primitives

MateriaPill {
    id: batteryPill

    accentRole: "primary"
    semanticState: {
        if (!BatteryService.isCharging && BatteryService.percentage <= 25)
            return "warning";
        if (BatteryService.isCharging)
            return "info";
        return "active";
    }

    Behavior on implicitWidth {
        Anim {}
    }

    Behavior on color {
        CAnim {}
    }

    RowLayout {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        StylizedIcon {
            iconName: BatteryService.iconName
        }

        StylizedText {
            text: BatteryService.percentage + "%"
            color: batteryPill.textColor
        }
    }
}
