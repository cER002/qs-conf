pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    NotificationServer {
        id: server

        keepOnReload: false
        persistenceSupported: true
        bodyHyperlinksSupported: true
        bodyImagesSupported: true
        bodyMarkupSupported: true
        actionsSupported: true
        imageSupported: true

        onNotification: notif => {
            notif.tracked = true;
        }
    }

    readonly property int notificationCount: server.trackedNotifications.values.length
    readonly property alias trackedNotifications: server.trackedNotifications
}
