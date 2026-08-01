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
                readonly property var workspace: Hyprland.workspaces.values.find(w => w.id === workspaceId)

                readonly property color dotcolor: {
                    if (Hyprland.focusedWorkspace?.id === workspaceId)
                        return Theme.foreground

                    if (workspace && workspace.toplevels.values.length > 0)
                        return Theme.opaqueForeground

                    return Theme.background
                }
                width: 10
                height: 10
                radius: 10
                color: dotcolor

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
