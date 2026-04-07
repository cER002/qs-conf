import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import qs.components.primitives

MouseArea {
    id: iconDelegate
    required property SystemTrayItem modelData

    width: 18
    height: 18
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    cursorShape: Qt.PointingHandCursor

    QsMenuAnchor {
        id: menuAnchor
        anchor.item: iconDelegate
        menu: iconDelegate.modelData.menu
    }

    StylizedIcon {
        anchors.fill: parent
        implicitSize: 16
        scale: iconDelegate.pressed ? 0.9 : 1.0
        source: iconDelegate.modelData.icon
    }

    onClicked: mouse => {
        if (mouse.button === Qt.LeftButton) {
            iconDelegate.modelData.activate();
        } else if (mouse.button === Qt.RightButton) {
            if (iconDelegate.modelData.hasMenu) {
                menuAnchor.open();
            } else {
                iconDelegate.modelData.secondaryActivate();
            }
        }
    }
}
