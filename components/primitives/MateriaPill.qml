import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.config

Rectangle {
    id: root

    property string text: "PLACEHOLDER_TEXT"
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
    property string iconName: ""
    property int paddingX: Config.pill.paddingX
    property int paddingY: Config.pill.paddingY
    property bool active: false
    property bool warning: false
    property bool info: false

    property bool clickable: false
    signal clicked

    implicitWidth: contentLayout.implicitWidth + (paddingX * 2)
    implicitHeight: contentLayout.implicitHeight + (paddingY * 2)
    radius: height / 2
    color: root.bgColor
    scale: (clickable && mouseArea.pressed) ? 0.90 : 1.0

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 300
            easing.type: Easing.OutQuint
        }
    }
    Behavior on color {
        ColorAnimation {
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }

    Behavior on scale {
        NumberAnimation {
            duration: 150
            easing.type: Easing.OutQuint
        }
    }

    RowLayout {
        id: contentLayout
        anchors.fill: parent
        anchors.leftMargin: root.paddingX
        anchors.rightMargin: root.paddingY
        spacing: 8

        IconImage {
            id: internalIcon
            source: {
                return Quickshell.iconPath(root.iconName, "application-x-executable");
            }
            implicitSize: 18
            visible: root.iconName !== ""
            Layout.alignment: Qt.AlignVCenter
            Layout.minimumWidth: 18
        }

        Text {
            id: internalText
            text: root.text
            color: root.textColor

            font.pixelSize: 16
            font.weight: Font.Bold
            font.family: "IosevkaNF"

            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
            elide: Text.ElideRight

            Behavior on color {
                ColorAnimation {
                    duration: 300
                    easing.type: Easing.OutQuint
                }
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: root.clickable
        cursorShape: root.clickable ? Qt.PointingHandCursor : Qt.ArrowCursor
        onClicked: root.clicked()
    }
}
