import QtQuick
import "../../config"
import "../../services/"
import "../primitives/"

MateriaPill {
    id: root
    property bool showFullDate: false

    clickable: true
    onClicked: {
        showFullDate = !showFullDate;
    }

    text: showFullDate ? Time.currentDate : Time.currentTime
}
