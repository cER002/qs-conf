import QtQuick
import "../../config/"
import "../../services/"
import "../primitives/"

MateriaPill {
    active: BatteryService.isCharging
    warning: !BatteryService.isCharging && BatteryService.percentage <= 25

    text: BatteryService.text
}
