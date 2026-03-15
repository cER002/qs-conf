pragma Singleton
import QtQuick
import Quickshell

QtObject {
    id: root

    property SystemClock _clock: SystemClock {
        id: internalClock
        precision: SystemClock.Minutes
    }

    readonly property string currentTime: Qt.formatTime(internalClock.date, "HH:mm")
    readonly property string currentDate: Qt.formatDate(internalClock.date, "dddd, MMMM d")
}
