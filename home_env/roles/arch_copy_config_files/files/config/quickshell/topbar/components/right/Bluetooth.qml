import Quickshell
import Quickshell.Io
import Quickshell.Bluetooth
import QtQuick
import "../../../theme"


Row {

    Process {
        id: bluetoothProc
        command: ["blueman-manager"]
    }

    Process {
        id: bluetoothProcEntered
        command: ["echo Hello"]
    }

    readonly property string icon: {
        if (Bluetooth.defaultAdapter.enabled)
            return String.fromCodePoint(0xF00AF)
        else 
            return String.fromCodePoint(0xF00B2)
    }

    // Repeater {
    //     model: Bluetooth.defaultAdapter.devices

    //     delegate: Text {

    //         required property var modelData
    //         text: modelData.name
    //     }
    // }

    Text {
        text: icon
        color: Theme.foreground
        font {
            family: Theme.nerdfont
            pixelSize: 17
        }
        
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: bluetoothProc.running = true
            // onEntered: bluetoothProcEntered.running = true
        }
    }

}