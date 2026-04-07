pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property var masterList: []
    property var popups: masterList.filter(n => n.isPopup)

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
            console.log("🔔 DBUS CAUGHT:", notif.summary);
            const newNotif = notifData.createObject(root, {
                notification: notif
            });
            root.masterList = [newNotif, ...root.masterList];
        }
    }

    Component {
        id: notifData

        NotifcationContent {}
    }
}
