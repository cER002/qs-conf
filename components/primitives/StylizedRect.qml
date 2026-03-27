import QtQuick
import qs.components.effects

Rectangle {
    id: root
    color: "transparent"

    Behavior on color {
        CAnim {}
    }
}
