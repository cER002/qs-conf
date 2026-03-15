pragma Singleton
import QtQuick

QtObject {
    id: root

    property var bar: {
        "height": 50,
        "margins": 8,
        "spacing": 8
    }

    property var pill: {
        "paddingX": 16,
        "paddingY": 6,
        "fontSize": 14
    }
}
