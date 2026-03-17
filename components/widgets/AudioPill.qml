import QtQuick
import QtQuick.Layouts
import qs.services
import qs.components.primitives

MateriaPill {
    id: audioPill
    warning: AudioService.isMuted
    clickable: true
    onClicked: AudioService.toggleMute()

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
