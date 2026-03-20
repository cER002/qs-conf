import QtQuick
import QtQuick.Layouts
import Quickshell
import "../effects/"
import qs.services
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

    RowLayout {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        StylizedIcon {
            iconName: "preferences-system-time-symbolic"
            overlayColor: clockPill.textColor
        }

        StylizedText {
            color: clockPill.textColor
            text: clockPill.showFullDate ? Time.currentDate : Time.currentTime
        }
    }
}
