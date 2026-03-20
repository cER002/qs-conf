pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    id: root

    default property alias content: contentLayout.data

    width: 240
    height: 48
    radius: height / 2
    color: Theme.surfaceContainerHighest

    RowLayout {
        id: contentLayout
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12
    }
}
