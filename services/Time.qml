pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property SystemClock _clock: SystemClock {
        id: internalClock
        precision: SystemClock.Seconds
    }

    readonly property string currentTime: Qt.formatTime(internalClock.date, "HH:mm:ss")
    readonly property string currentDate: Qt.formatDate(internalClock.date, "dddd, MMMM d")

    function format(formatString: string): string {
        return Qt.formatDateTime(internalClock.date, formatString);
    }
}
