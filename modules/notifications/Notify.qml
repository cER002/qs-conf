pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.services
import qs.components.osd

PanelWindow {
    id: notificationBackground
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.namespace: "quickshell-notifications"
    exclusionMode: ExclusionMode.Ignore
    implicitWidth: notifications.implicitWidth
    implicitHeight: notifications.implicitHeight
    color: "transparent"
    anchors {
        bottom: true
        right: true
    }
    margins {
        bottom: 10
        right: 10
    }

    ColumnLayout {
        id: notifications
        spacing: 8
        Repeater {
            model: NotificationService.trackedNotifications

            NotifyBackground {
                id: notification

                NotifyContent {
                    modelData: notification.modelData
                }
            }
        }
    }
}
