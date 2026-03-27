pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland

Singleton {
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
        let ipc = activeTop?.lastIpcObject;
        return ipc ? (ipc["class"] ?? "") : "";
    }

    property string appClass: {
        if (title === "Desktop") {
            return "application-x-desktop";
        }

        if (!rawClass)
            return "";

        let raw = rawClass.toLowerCase();

        let stripped = raw.includes(".") ? raw.split(".").pop() : raw;

        const aliases = {
            "pavucontrol": "multimedia-volume-control",
            "xournalpp": "xournal",
            "proton.vpn.app.gtk": "protonvpn-logo",
            "protonvpn-app": "protonvpn-logo",
            "nm-connection-editor": "applications-internet",
            "zathura": "evince",
            "com.obsproject.studio": "obs",
            "hyprland-share-picker": "preferences-desktop-display",
            "draw.io": "drawio",
            "mars": "java",
            "qt5ct": "preferences-system",
            "qt6ct": "preferences-system",
            "electron": "electron37"
        };

        return aliases[raw] || aliases[stripped] || stripped;
    }
}
