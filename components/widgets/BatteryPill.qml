import QtQuick
import QtQuick.Layouts
import qs.services
import qs.components.primitives

MateriaPill {
    id: batteryPill
    active: BatteryService.isCharging
    warning: !BatteryService.isCharging && BatteryService.percentage <= 25

    RowLayout {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        StylizedIcon {
            iconName: BatteryService.iconName
            overlayColor: batteryPill.textColor
        }

        StylizedText {
            text: BatteryService.text
            color: batteryPill.textColor
        }
    }
}
