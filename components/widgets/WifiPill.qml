import QtQuick
import QtQuick.Layouts
import "../../services/"
import "../effects/"
import "../primitives/"

MateriaPill {
    id: wifiPill
    accentRole: "primary"
    semanticState: {
        if (NetworkService.isConnected)
            return "active";
        if (NetworkService.isTransitioning)
            return "info";
        if (NetworkService.isDisconnected && !NetworkService.isTransitioning)
            return "warning";
        return "normal";
    }

    clickable: true
    onClicked: NetworkService.toggleWifi()

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
            iconName: NetworkService.iconName
            overlayColor: wifiPill.textColor
        }
    }
}
