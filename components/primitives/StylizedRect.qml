import QtQuick
import "../effects"

Rectangle {
    id: root
    color: "transparent"

    Behavior on color {
        CAnim {}
    }
}
