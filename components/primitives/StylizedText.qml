pragma ComponentBehavior: Bound
import QtQuick
import qs.config

Text {
    id: root

    property bool animateText: false

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
    verticalAlignment: Text.AlignVCenter

    transformOrigin: Item.Center
    antialiasing: true

    Behavior on text {
        enabled: root.animateText

        SequentialAnimation {
            NumberAnimation {
                target: root
                property: "scale"
                to: 0
                duration: 150
                easing.type: Easing.InQuint
            }

            PropertyAction {}

            NumberAnimation {
                target: root
                property: "scale"
                to: 1
                duration: 150
                easing.type: Easing.OutQuint
            }
        }
    }
}
