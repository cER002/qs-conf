import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services
import qs.components.primitives

MateriaPill {
    id: clockPill
    property bool showFullDate: false
    clickable: true
    active: showFullDate
    onClicked: {
        showFullDate = !showFullDate;
    }

    RowLayout {
        Layout.alignment: Qt.AlignVCenter
        spacing: 8

        StylizedIcon {
            iconName: "preferences-system-time-symbolic"
            overlayColor: clockPill.textColor
        }

        StylizedText {
            color: clockPill.textColor
            text: clockPill.showFullDate ? Time.currentDate : Time.currentTime
        }
    }
}
