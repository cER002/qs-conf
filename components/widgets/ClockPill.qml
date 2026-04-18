import QtQuick
import QtQuick.Layouts
import qs.services
import qs.components.effects
import qs.components.primitives

MateriaPill {
    id: clockPill
    property bool showFullDate: false

    semanticState: showFullDate ? "info" : "normal"
    clickable: true
    onClicked: {
        showFullDate = !showFullDate;
    }

    Behavior on implicitWidth {
        Anim {}
    }

    Behavior on color {
        CAnim {}
    }

    Behavior on scale {
        Anim {}
    }

    StylizedText {
        color: clockPill.textColor
        text: clockPill.showFullDate ? Time.currentDate : Time.currentTime
        Layout.fillWidth: true
        elide: Text.ElideRight
    }
}
