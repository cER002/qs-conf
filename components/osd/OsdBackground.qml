pragma ComponentBehavior: Bound

import QtQuick
import qs.config

Rectangle {
    id: root

    required property bool isActive
    default property alias contentChildren: container.data

    width: container.implicitWidth + 32
    height: container.implicitHeight + 16
    radius: height / 4
    color: Theme.surfaceContainerHighest
    opacity: root.isActive ? 1 : 0
    scale: root.isActive ? 1 : 0.8

    Behavior on opacity {
        NumberAnimation {
            duration: 200
        }
    }

    Behavior on scale {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutBack
        }
    }

    Item {
        id: container
        anchors.centerIn: parent

        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height
    }
}
