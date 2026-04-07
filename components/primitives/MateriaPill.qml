pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs.config

StylizedRect {
    id: root

    default property alias content: contentLayout.data

    property string semanticState: "normal"
    property string accentRole: "primary"
    property color textColor: Theme.colorOnSurface
    property int paddingX: Config.pill.paddingX
    property int paddingY: Config.pill.paddingY
    property bool clickable: false
    readonly property color _roleColor: {
        switch (accentRole) {
        case "secondary":
            return Theme.secondaryContainer;
        case "tertiary":
            return Theme.tertiaryContainer;
        case "primary":
            return Theme.primaryContainer;
        default:
            return Theme.surfaceContainerHigh;
        }
    }
    readonly property color _roleTextColor: {
        switch (accentRole) {
        case "secondary":
            return Theme.colorOnSecondaryContainer;
        case "tertiary":
            return Theme.colorOnTertiaryContainer;
        case "primary":
            return Theme.colorOnPrimaryContainer;
        default:
            return Theme.colorOnSurface;
        }
    }

    signal clicked

    implicitWidth: contentLayout.implicitWidth + (paddingX * 2)
    implicitHeight: contentLayout.implicitHeight + (paddingY * 2)
    height: Config.pill.height
    radius: Config.pill.radius
    color: Theme.surfaceContainerHigh
    scale: (clickable && mouseArea.pressed) ? 0.90 : 1.0

    state: root.semanticState

    states: [
        State {
            name: "warning"
            PropertyChanges {
                root.color: Theme.errorContainer
                root.textColor: Theme.colorOnErrorContainer
            }
        },
        State {
            name: "active"
            PropertyChanges {
                root.color: root._roleColor
                root.textColor: root._roleTextColor
            }
        },
        State {
            name: "info"
            PropertyChanges {
                root.color: Theme.tertiaryContainer
                root.textColor: Theme.colorOnTertiaryContainer
            }
        },
        State {
            name: "normal"
        }
    ]

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
        anchors.verticalCenter: parent.verticalCenter
        anchors {
            leftMargin: root.paddingX
        }
        spacing: 8
    }
}
