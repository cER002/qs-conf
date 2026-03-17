import QtQuick
import QtQuick.Layouts
import "../../services/"
import "../primitives/"

MateriaPill {
    id: wifiPill
    active: NetworkService.isConnected
    info: NetworkService.isTransitioning
    warning: NetworkService.isDisconnected && !NetworkService.isTransitioning
    clickable: true
    onClicked: NetworkService.toggleWifi()

    RowLayout {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        StylizedIcon {
            iconName: NetworkService.iconName
            overlayColor: wifiPill.textColor
        }
        StylizedText {
            text: NetworkService.text
            color: wifiPill.textColor
        }
    }
}
