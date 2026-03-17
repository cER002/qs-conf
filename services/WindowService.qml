pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Hyprland

Scope {
    id: root

    property var activeTop: Hyprland.activeToplevel
    property string title: activeTop ? (activeTop.title !== "" ? activeTop.title : "Desktop") : "Desktop"

    Connections {
        target: Hyprland

        function onRawEvent(event) {
            const n = event.name;

            if (n.includes("window") || n === "activewindow" || n === "activeworkspace") {
                Hyprland.refreshToplevels();
            }
        }
    }

    property string rawClass: {
        if (!activeTop)
            return "";
        let ipc = activeTop.lastIpcObject;
        return ipc ? (ipc["class"] ?? "") : "";
    }

    property string appClass: {
        if (title === "Desktop") {
            return "application-x-desktop";
        }

        if (!rawClass)
            return "";
        let name = rawClass.toLowerCase();

        if (name.includes(".")) {
            let parts = name.split(".");
            name = parts[parts.length - 1];
        }

        const aliases = {
            "pavucontrol": "multimedia-volume-control",
            "code-oss": "visual-studio-code"
        };

        return aliases[name] || name;
    }

    property string text: title
}
