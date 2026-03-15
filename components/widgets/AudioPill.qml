import QtQuick
import "../../config/"
import "../../services/"
import "../primitives/"

MateriaPill {
    text: AudioService.currentVolume

    warning: AudioService.isMuted

    clickable: true
    onClicked: AudioService.toggleMute()
}
