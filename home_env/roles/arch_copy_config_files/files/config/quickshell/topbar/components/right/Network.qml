import Quickshell
import Quickshell.Io
import QtQuick
import "../../../theme"


Row {

    Process {
        id: networkProc
        command: ["kitty", "nmtui"]
    }

    readonly property string icon: {
        return String.fromCodePoint(0xF1EB)
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
            onClicked: networkProc.running = true
        }
    }
}