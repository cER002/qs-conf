import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

MouseArea {
    id: iconDelegate
    required property SystemTrayItem modelData

    implicitWidth: 24
    implicitHeight: 24
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    cursorShape: Qt.PointingHandCursor

    QsMenuAnchor {
        id: menuAnchor
        anchor.item: iconDelegate
        menu: iconDelegate.modelData.menu
    }

    IconImage {
        anchors.fill: parent
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
