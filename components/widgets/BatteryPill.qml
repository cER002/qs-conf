pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import qs.config
import qs.services
import qs.components.effects
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
            id: batterySvg
            implicitSize: Config.pill.imageSize
            iconName: BatteryService.iconName
            layer.enabled: true
            layer.effect: MultiEffect {
                colorization: 1
                colorizationColor: batteryPill.textColor
            }
        }

        StylizedText {
            text: BatteryService.percentage + "%"
            color: batteryPill.textColor
        }
    }
}
