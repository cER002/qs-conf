pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    id: root

    default property alias content: contentLayout.data

    property color bgColor: {
        if (warning)
            return Theme.errorContainer;
        if (active)
            return Theme.primary;
        if (info)
            return Theme.secondaryContainer;
        return Theme.surfaceContainerHigh;
    }
    property color textColor: {
        if (warning)
            return Theme.colorOnErrorContainer;
        if (active)
            return Theme.colorOnPrimary;
        if (info)
            return Theme.colorOnSecondaryContainer;
        return Theme.colorOnSurface;
    }
    property int paddingX: Config.pill.paddingX
    property int paddingY: Config.pill.paddingY
    property bool active: false
    property bool warning: false
    property bool info: false
    property bool clickable: false
    property bool defaultWidthAnimation: true

    signal clicked

    implicitWidth: contentLayout.implicitWidth + (paddingX * 2)
    implicitHeight: contentLayout.implicitHeight + (paddingY * 2)
    height: Config.pill.height
    radius: height / 2
    color: root.bgColor
    scale: (clickable && mouseArea.pressed) ? 0.90 : 1.0

    Behavior on implicitWidth {
        enabled: root.defaultWidthAnimation
        NumberAnimation {
            duration: 500
            easing.type: Easing.Bezier
            easing.bezierCurve: [0.16, 1, 0.3, 1, 1, 1]
        }
    }

    Behavior on color {
        ColorAnimation {
            duration: 500
            easing.type: Easing.Bezier
            easing.bezierCurve: [0.16, 1, 0.3, 1, 1, 1]
        }
    }

    Behavior on scale {
        NumberAnimation {
            duration: 150
            easing.type: Easing.Bezier
            easing.bezierCurve: [0.16, 1, 0.3, 1, 1, 1]
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: root.clickable
        cursorShape: root.clickable ? Qt.PointingHandCursor : Qt.ArrowCursor
        onClicked: root.clicked()
    }

    RowLayout {
        id: contentLayout
        anchors.fill: parent
        anchors.leftMargin: root.paddingX
        anchors.rightMargin: root.paddingY
        spacing: 8
    }
}
