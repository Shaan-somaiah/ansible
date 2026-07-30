import Quickshell
import "components"

PanelWindow {

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 45
    color: "transparent"

    // Clock
    Left {}
    
    // Workspaces
    Center {}

    // System
    Right{}
    
}