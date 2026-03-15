import QtQuick
import "../../config"
import "../../services"
import "../primitives/"

Row {
    spacing: 8

    Repeater {
        model: 10

        MateriaPill {

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

            text: wsNum.toString()

            active: isActive
            info: isOccupied && !isActive

            clickable: true
            onClicked: HyprlandService.dispatch("workspace " + wsNum)
        }
    }
}
