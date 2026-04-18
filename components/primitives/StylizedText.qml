pragma ComponentBehavior: Bound
import QtQuick
import qs.config

Text {
    id: root

    color: Theme.colorOnSurface

    Behavior on color {
        ColorAnimation {
            duration: 200
            easing.type: Easing.OutQuint
        }
    }

    font.family: Config.font.family
    font.pixelSize: Config.font.size
    font.weight: Config.font.weightNormal
    renderType: Text.NativeRendering

    transformOrigin: Item.Center
    antialiasing: true
}
