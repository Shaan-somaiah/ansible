import Quickshell
import Quickshell.Io
import QtQuick
import "right"
import "../../theme"


Rectangle {

    anchors {
        right: parent.right
        top: parent.top
        rightMargin: 10
        topMargin: 10
    }
    width: status.implicitWidth + 24
    height: status.height + 14
    radius: 10
    color: Theme.opaqueBackground


    Row {
        id: status
        anchors.centerIn: parent
        spacing: 12

        System {}

        Sound {}

        Bluetooth {}

        Power {}

    }
}