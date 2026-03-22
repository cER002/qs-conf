pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    function loadTheme(jsonData) {
        if (!jsonData || jsonData === "")
            return;

        try {
            const scheme = JSON.parse(jsonData);

            for (const [key, value] of Object.entries(scheme)) {
                if (root.hasOwnProperty(key)) {
                    root[key] = value;
                }
            }
        } catch (e) {
            console.warn("Theme hot-reload failed to parse JSON: ", e);
        }
    }

    FileView {
        id: themeFileView
        path: Quickshell.env("HOME") + "/.config/quickshell/config/shell-theme.json"
        watchChanges: true
        onLoaded: root.loadTheme(themeFileView.text())
        onFileChanged: themeFileView.reload()
    }

    property color background: "#101418"
    property color colorOnBackground: "#e0e2e8"

    property color surface: "#101418"
    property color surfaceDim: "#101418"
    property color surfaceBright: "#36393e"

    property color surfaceContainerLowest: "#0b0e12"
    property color surfaceContainerLow: "#181c20"
    property color surfaceContainer: "#1d2024"
    property color surfaceContainerHigh: "#272a2f"
    property color surfaceContainerHighest: "#32353a"

    property color surfaceVariant: "#42474e"
    property color colorOnSurface: "#e0e2e8"
    property color colorOnSurfaceVariant: "#c2c7cf"

    property color primary: "#9ccbfb"
    property color colorOnPrimary: "#003354"
    property color primaryContainer: "#124a73"
    property color colorOnPrimaryContainer: "#cfe5ff"

    property color secondary: "#b9c8da"
    property color colorOnSecondary: "#243240"
    property color secondaryContainer: "#3a4857"
    property color colorOnSecondaryContainer: "#d5e4f7"

    property color tertiary: "#d4bee6"
    property color colorOnTertiary: "#392a49"
    property color tertiaryContainer: "#504060"
    property color colorOnTertiaryContainer: "#f0dbff"

    property color error: "#ffb4ab"
    property color colorOnError: "#690005"
    property color errorContainer: "#93000a"
    property color colorOnErrorContainer: "#ffdad6"

    property color outline: "#8c9199"
    property color outlineVariant: "#42474e"
}
