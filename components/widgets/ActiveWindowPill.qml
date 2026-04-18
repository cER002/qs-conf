import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config
import qs.components.effects
import qs.components.primitives

MateriaPill {
    id: activeWindowPill
    clip: true

    Behavior on implicitWidth {
        Anim {}
    }

    Behavior on scale {
        Anim {}
    }

    RowLayout {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        StylizedIcon {
            implicitSize: Config.pill.imageSize
            iconName: WindowService.appClass
        }
        StylizedText {
            text: WindowService.title
            Layout.maximumWidth: 200
            elide: Text.ElideRight
            color: activeWindowPill.textColor
        }
    }
}
