import Quickshell
import Quickshell.Io
import QtQuick
import "../../../theme"


Row {

    Process {
        id: powerProc
        command: ["wlogout", "-p", "layer-shell"]
    }

    readonly property string icon: {
        return String.fromCodePoint(0xF011)
    }

    Text {
        text: icon
        color: Theme.opaqueForeground
        font {
            family: Theme.nerdfont
            pixelSize: 15
        }
        
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: powerProc.running = true
        }
    }
}