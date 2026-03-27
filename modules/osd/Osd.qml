import QtQuick
import Quickshell
import qs.components.osd

Variants {
    model: Quickshell.screens

    OsdWrapper {
        required property var modelData
        screen: modelData
    }
}
