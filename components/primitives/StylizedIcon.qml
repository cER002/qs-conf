pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.config

IconImage {
    id: root

    property string iconName: ""

    asynchronous: true
    implicitSize: Config.image.size
    visible: source !== ""

    onIconNameChanged: {
        root.source = Quickshell.iconPath(root.iconName, "application-x-executable");
    }
}
