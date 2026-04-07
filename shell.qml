//@ pragma UseQApplication
import QtQuick
import Quickshell
import "modules/bar"
import "modules/osd"
import "modules/notifications"

ShellRoot {
    id: root

    TopBar {}
    Osd {}
    Notify {}
}
