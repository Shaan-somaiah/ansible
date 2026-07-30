import Quickshell
import Quickshell.Io
import QtQuick
import "../../../theme"


Row {

    Process {
        id: bluetoothProc
        command: ["blueman-manager"]
    }

    readonly property string icon: {
        return String.fromCodePoint(0xF00AF)
    }

    Text {
        text: icon
        color: Theme.opaqueForeground
        font {
            family: Theme.nerdfont
            pixelSize: 17
        }
        
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: bluetoothProc.running = true
        }
    }
}