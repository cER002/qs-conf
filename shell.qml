import QtQuick
import Quickshell
import "modules/bar"

ShellRoot {
    Variants {
        model: Quickshell.screens

        TopBar {
            required property var modelData
            screen: modelData
        }
    }
}
