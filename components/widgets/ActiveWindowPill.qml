import QtQuick
import QtQuick.Layouts
import qs.services
import qs.components.primitives

MateriaPill {
    id: activeWindowPill
    clip: true

    RowLayout {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        StylizedIcon {
            iconName: WindowService.appClass
            overlayColor: activeWindowPill.textColor
        }
        StylizedText {
            text: WindowService.text
            Layout.maximumWidth: 300
            elide: Text.ElideRight
            color: activeWindowPill.textColor
        }
    }
}
