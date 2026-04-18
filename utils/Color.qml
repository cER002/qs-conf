pragma Singleton

import QtQuick
import Quickshell

Singleton {
    function setAlpha(color, alpha) {
        return Qt.rgba(color.r, color.g, color.b, alpha);
    }
}
