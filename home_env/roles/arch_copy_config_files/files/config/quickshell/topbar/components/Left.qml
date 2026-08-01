import Quickshell
import Quickshell.Io
import QtQuick
import "../../theme"


Rectangle {
    
    anchors {
        left: parent.left
        top: parent.top
        leftMargin: 10
        topMargin: 10
    }

    width: clock.implicitWidth + 24
    height: clock.height + 14
    radius: 10
    color: Theme.opaqueBackground

    SystemClock {
        id: system_clock
        precision: SystemClock.Minutes
    }
    
    Process {
        id: notificationProc
        command: ["swaync-client", "-t", "-sw"]
    } 


    Row {
        id: clock
        anchors.centerIn: parent
        spacing: 1

        Text {
            text: Qt.formatDateTime(system_clock.date, "ddd dd MMM - hh:mm AP")
            color: Theme.foreground
            font.family: Theme.nerdfont
            font.pixelSize: 14

            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: notificationProc.running = true
                // onEntered: calenderProc.running = true
                // onExited:  notificationProc.running = true
            }
        }
    }

}
