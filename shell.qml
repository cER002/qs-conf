//@ pragma UseQApplication
import QtQuick
import Quickshell
import "modules/bar"
import "modules/osd"

ShellRoot {
    id: root

    TopBar {}
    Osd {}
}
