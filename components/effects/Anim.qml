import QtQuick

NumberAnimation {
    duration: 400
    easing.type: Easing.Bezier
    easing.bezierCurve: [0.16, 1, 0.3, 1, 1, 1]
}
