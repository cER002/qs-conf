pragma ComponentBehavior: Bound

import QtQuick
import qs.config
import qs.components.primitives
import qs.components.osd

NotifyPill {
    id: root

    Column {
        spacing: 4

        StylizedText {
            width: Math.min(implicitWidth, 480)
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            text: root.modelData ? root.modelData.summary : ""
            color: Theme.colorOnSurface
            font.bold: true
            font.pixelSize: 20
            elide: Text.ElideRight
        }

        StylizedText {
            width: Math.min(implicitWidth, 550)
            maximumLineCount: 2
            wrapMode: Text.Wrap
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            text: root.modelData ? root.modelData.body : ""
            color: Theme.colorOnSurfaceVariant
            font.pixelSize: 16
            elide: Text.ElideRight
        }
    }
}
