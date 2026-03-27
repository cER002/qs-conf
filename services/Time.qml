pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    readonly property string currentTime: Qt.formatTime(clock.date, "HH:mm:ss")
    readonly property string currentDate: Qt.formatDate(clock.date, "dddd, MMMM d")

    function format(formatString: string): string {
        return Qt.formatDateTime(clock.date, formatString);
    }
}
