//@ pragma UseQApplication
import QtQuick
import Quickshell
import "modules/bar"

ShellRoot {
    id: root

    Variants {
        model: Quickshell.screens

        TopBar {
            required property var modelData
            screen: modelData
        }
    }
}
