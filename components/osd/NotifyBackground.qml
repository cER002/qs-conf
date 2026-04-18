pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Services.Notifications
import qs.config
import qs.components.effects

Rectangle {
    id: root

    required property Notification modelData
    default property Component notificationContent
    property bool isPopupVisible: true
    visible: isPopupVisible
    implicitWidth: contentLoader.implicitWidth
    implicitHeight: contentLoader.implicitHeight
    radius: 12
    color: Theme.surfaceContainerHighest

    border {
        width: 2
        color: {
            switch (root.modelData.urgency) {
            case NotificationUrgency.Low:
                return Theme.surfaceVariant;
            case NotificationUrgency.Normal:
                return Theme.primary;
            case NotificationUrgency.Critical:
                return Theme.error;
            default:
                return Theme.surfaceVariant;
            }
        }
    }

    Behavior on color {
        CAnim {}
    }

    Timer {
        interval: root.modelData.expireTimeout > 0 ? root.modelData.expireTimeout : 5000
        running: root.modelData.urgency !== NotificationUrgency.Critical
        onTriggered: root.isPopupVisible = false
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            for (let i = 0; i < root.modelData.actions.length; i++) {
                if (root.modelData.actions[i].text === "Activate" || root.modelData.actions[i].text === "View") {
                    root.modelData.actions[i].invoke();
                    return;
                }
            }
            root.modelData.dismiss();
        }
    }

    Loader {
        id: contentLoader
        anchors.centerIn: parent
        sourceComponent: root.notificationContent
    }
}
