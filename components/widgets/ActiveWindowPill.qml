import QtQuick
import Quickshell
import "../../config"
import "../../services"
import "../primitives"

MateriaPill {
    text: WindowService.text
    width: Math.min(implicitWidth, 400)
    clip: true
    iconName: WindowService.appClass
}
