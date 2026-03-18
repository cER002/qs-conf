pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects
import qs.config

IconImage {
    id: root

    property string iconName: ""
    property color overlayColor: Theme.colorOnSurface

    implicitSize: Config.image.size
    visible: iconName !== "" || source !== ""
    source: Quickshell.iconPath(iconName, "application-x-executable")

    layer.enabled: true
    layer.effect: ColorOverlay {
        color: root.overlayColor
    }
}
