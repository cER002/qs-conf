import QtQuick
import QtQuick.Layouts
import "../effects/"
import qs.services
import qs.components.primitives

MateriaPill {
    id: audioPill

    accentRole: "normal"
    semanticState: AudioService.isMuted ? "warning" : "normal"

    clickable: true
    onClicked: AudioService.toggleMute()

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
            iconName: AudioService.iconName
            overlayColor: audioPill.textColor
        }

        StylizedText {
            text: AudioService.currentVolume
            color: audioPill.textColor
        }
    }
}
