import QtQuick
import QtQuick.Layouts
import qs.services
import "../effects/"
import qs.components.primitives

MateriaPill {
    id: activeWindowPill
    clip: true

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
            iconName: WindowService.appClass
            overlayColor: activeWindowPill.textColor
        }
        StylizedText {
            text: WindowService.text
            Layout.maximumWidth: 200
            elide: Text.ElideRight
            color: activeWindowPill.textColor
        }
    }
}
