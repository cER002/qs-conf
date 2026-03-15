import QtQuick
import "../../config/"
import "../../services/"
import "../primitives/"

MateriaPill {
    text: NetworkService.text
    warning: !NetworkService.isConnected
    clickable: true
    onClicked: {
        console.log("maybe add a wifi popup");
    }
}
