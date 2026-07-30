import Quickshell
import Quickshell.Io
import QtQuick
import "../../../theme"


Row {

    Process {
        id: systemProc
        command: ["btop"]
    }

    readonly property string icon: {
        return String.fromCodePoint(0xF4BC)
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
            onClicked: systemProc.running = true
        }
    }
}