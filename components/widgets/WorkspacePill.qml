pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.services
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

                visible: isActive || isOccupied

                width: visible ? dot.width : 0
                height: 16
                cursorShape: Qt.PointingHandCursor

                onClicked: HyprlandService.dispatch("workspace " + dotArea.wsNum)

                Rectangle {
                    id: dot
                    anchors.centerIn: parent

                    width: dotArea.isActive ? 18 : 8
                    height: 8
                    radius: height / 2

                    color: dotArea.isActive ? Theme.primary : Theme.secondaryContainer

                    Behavior on width {
                        NumberAnimation {
                            duration: 300
                            easing.type: Easing.OutQuint
                        }
                    }

                    Behavior on color {
                        ColorAnimation {
                            duration: 300
                            easing.type: Easing.OutQuint
                        }
                    }
                }
            }
        }
    }
}
