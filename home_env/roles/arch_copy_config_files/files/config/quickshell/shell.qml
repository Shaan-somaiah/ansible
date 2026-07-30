import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 50
    color: "transparent"


    readonly property color foreground: "#c6c7c4";
    readonly property color background: "#101212";
    readonly property color cursor: "#c6c7c4";
    readonly property color color0: "#101212";
    readonly property color color1: "#4B5451";
    readonly property color color2: "#5B6562";
    readonly property color color3: "#6C746F";
    readonly property color color4: "#7B817A";
    readonly property color color5: "#86867A";
    readonly property color color6: "#7A8584";
    readonly property color color7: "#c6c7c4";
    readonly property color color8: "#8a8b89";
    readonly property color color9: "#4B5451";
    readonly property color color10: "#5B6562";
    readonly property color color11: "#6C746F";
    readonly property color color12: "#7B817A";
    readonly property color color13: "#86867A";
    readonly property color color14: "#7A8584";
    readonly property color color15: "#c6c7c4";


    // readonly property color background: "#101212"
    // readonly property color foreground: "#c6c7c4"
    // readonly property color accent: "#f38ba8"
    // readonly property color inactive: "#55f38ba8"


    Process {
        id: notificationProc
        command: ["swaync-client", "-t", "-sw"]
    }
    Process {
        id: networkProc
        command: ["kitty", "nmtui"]
    }
    Process {
        id: bluetoothProc
        command: ["blueman-manager"]
    }
    Process {
        id: btopProc
        command: ["kitty", "btop"]
    }
    Process {
        id: powerProc
        command: ["wlogout", "-p", "layer-shell"]
    }
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    // Left pill: notification + clock
    Rectangle {
        id: leftPill
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 10
            topMargin: 10
        }
        width: leftRow.implicitWidth + 24
        height: 35
        radius: 10
        color: background
        Row {
            id: leftRow
            anchors.centerIn: parent
            spacing: 10
            Text {
                text: ""
                color: foreground
                font.family: "JetBrainsMono Nerd Font Mono"
                font.pixelSize: 16
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: notificationProc.running = true
                }
            }
            Text {
                text: Qt.formatDateTime(clock.date, "hh:mm:ss AP")
                color: foreground
                font.family: "JetBrainsMono Nerd Font Mono"
                font.pixelSize: 15
            }
        }
    }
    // Centre pill: persistent workspaces 1–5
    Rectangle {
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 10
        }
        width: workspaceRow.implicitWidth + 24
        height: 35
        radius: 10
        color: background
        Row {
            id: workspaceRow
            anchors.centerIn: parent
            spacing: 10
            Repeater {
                model: 5
                delegate: Rectangle {
                    required property int index
                    readonly property int workspaceId: index + 1
                    width: 10
                    height: 10
                    radius: 5
                    color: Hyprland.focusedWorkspace
                           && Hyprland.focusedWorkspace.id === workspaceId
                           ? accent : inactive
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
    // Right pill: expandable stats + Bluetooth, network, power
    Rectangle {
        id: rightPill
        anchors {
            right: parent.right
            top: parent.top
            rightMargin: 10
            topMargin: 10
        }
        width: rightRow.implicitWidth + 24
        height: 35
        radius: 10
        color: background
        property bool expanded: false
        Row {
            id: rightRow
            anchors.centerIn: parent
            spacing: 12
            Text {
                text: rightPill.expanded ? "" : ""
                color: foreground
                font.family: "JetBrainsMono Nerd Font Mono"
                font.pixelSize: 16
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: rightPill.expanded = !rightPill.expanded
                }
            }
            Text {
                visible: rightPill.expanded
                text: "󰻠"
                color: foreground
                font.family: "JetBrainsMono Nerd Font Mono"
                font.pixelSize: 16
                MouseArea {
                    anchors.fill: parent
                    onClicked: btopProc.running = true
                }
            }
            Text {
                visible: rightPill.expanded
                text: ""
                color: foreground
                font.family: "JetBrainsMono Nerd Font Mono"
                font.pixelSize: 16
                MouseArea {
                    anchors.fill: parent
                    onClicked: btopProc.running = true
                }
            }
            Text {
                visible: rightPill.expanded
                text: ""
                color: foreground
                font.family: "JetBrainsMono Nerd Font Mono"
                font.pixelSize: 16
                MouseArea {
                    anchors.fill: parent
                    onClicked: btopProc.running = true
                }
            }
            Text {
                text: "󰂯"
                color: foreground
                font.family: "JetBrainsMono Nerd Font Mono"
                font.pixelSize: 16
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: bluetoothProc.running = true
                }
            }
            Text {
                text: ""
                color: foreground
                font.family: "JetBrainsMono Nerd Font Mono"
                font.pixelSize: 16
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: networkProc.running = true
                }
            }
            Text {
                text: "⏻"
                color: foreground
                font.family: "JetBrainsMono Nerd Font Mono"
                font.pixelSize: 16
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: powerProc.running = true
                }
            }
        }
    }
}