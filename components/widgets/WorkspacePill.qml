pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services
import qs.utils
import qs.components.effects
import qs.components.primitives

MateriaPill {
    id: wsPill

    Row {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        Repeater {
            model: 10

            delegate: MouseArea {
                id: dotArea

                required property int index
                property int wsNum: index + 1
                property bool isActive: HyprlandService.activeWsId === wsNum
                property bool isOccupied: {
                    let w = HyprlandService.workspaces.values;
                    for (let i = 0; i < w.length; i++) {
                        if (w[i].id === wsNum)
                            return true;
                    }
                    return false;
                }

                width: !visible ? 0 : (isActive ? 18 : 10)
                height: 16
                cursorShape: Qt.PointingHandCursor

                onClicked: HyprlandService.dispatch("workspace " + dotArea.wsNum)

                Behavior on width {
                    Anim {}
                }

                Rectangle {
                    id: dot

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 12
                    radius: 6
                    width: parent.width
                    color: dotArea.isActive ? Theme.primary : (dotArea.isOccupied ? Color.setAlpha(Theme.tertiary, 0.5) : Theme.secondaryContainer)
                }
            }
        }
    }
}
