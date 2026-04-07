pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    readonly property string currentTime: Qt.formatTime(clock.date, "HH:mm")
    readonly property string currentDate: Qt.formatDate(clock.date, "dddd, MMMM d")

    function format(formatString: string): string {
        return Qt.formatDateTime(clock.date, formatString);
    }
}
