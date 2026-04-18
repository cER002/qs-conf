pragma ComponentBehavior: Bound
pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property alias bar: jsonConfig.bar
    property alias pill: jsonConfig.pill
    property alias font: jsonConfig.font
    property alias image: jsonConfig.image
    property alias notify: jsonConfig.notify

    Timer {
        id: saveTimer
        interval: 500
        onTriggered: {
            root.recentlySaved = true;
            fileView.writeAdapter();
            cooldownTimer.restart();
        }
    }

    Timer {
        id: cooldownTimer
        interval: 1000
        onTriggered: root.recentlySaved = false
    }

    FileView {
        id: fileView

        path: Quickshell.env("HOME") + "/.config/quickshell/config/config.json"
        watchChanges: true

        property bool recentlySaved: false

        onFileChanged: {
            if (!recentlySaved) {
                reload();
            }
        }

        Component.onCompleted: {
            writeAdapter();
        }

        onAdapterUpdated: saveTimer.restart()

        adapter: JsonAdapter {
            id: jsonConfig

            property JsonObject bar: JsonObject {
                property int height: 50
                property int margins: 8
                property int spacing: 8
            }

            property JsonObject pill: JsonObject {
                property int paddingX: 16
                property int paddingY: 6
                property int height: 40
                property int radius: 10
                property int imageSize: 32
            }

            property JsonObject font: JsonObject {
                property int weightNormal: Font.Normal
                property int weightMedium: Font.Medium
                property int weightBold: Font.Bold
                property int size: 18
                property string family: "IosevkaNF"
            }

            property JsonObject image: JsonObject {
                property int size: 32
            }

            property JsonObject notify: JsonObject {
                property int imageSize: 48
                property int imageSizeSmall: 24
            }
        }
    }
}
