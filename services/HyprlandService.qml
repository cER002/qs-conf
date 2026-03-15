pragma Singleton
import QtQuick
import Quickshell.Hyprland

QtObject {
    id: root

    readonly property var workspaces: Hyprland.workspaces
    readonly property var monitors: Hyprland.monitors
    readonly property HyprlandWorkspace focusedWorkspace: Hyprland.focusedWorkspace
    readonly property int activeWsId: focusedWorkspace?.id ?? 1
    function dispatch(cmd) {
        Hyprland.dispatch(cmd);
    }
}
