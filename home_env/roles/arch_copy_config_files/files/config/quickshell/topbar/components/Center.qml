import Quickshell
import Quickshell.Hyprland
import QtQuick
import "../../theme"
    

Rectangle {

    anchors {
        horizontalCenter: parent.horizontalCenter
        top: parent.top
        topMargin: 10
    }

    width: workspace.implicitWidth + 24
    height: workspace.height + 24
    radius: 10
    color: Theme.opaqueBackground

    Row {
        id: workspace
        anchors.centerIn: parent
        spacing: 16

        Repeater {
            model: 5
            delegate: Rectangle {
                required property int index
                readonly property int workspaceId: index + 1
                width: 10
                height: 10
                radius: 10
                color: Hyprland.focusedWorkspace && Hyprland.focusedWorkspace.id === workspaceId
                       ? Theme.opaqueForeground : Theme.opaqueBackground

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Hyprland.dispatch(
                        "hl.dsp.focus({ workspace = " + parent.workspaceId + " })"
                    )
                }

            }
        }
        
    }
}
