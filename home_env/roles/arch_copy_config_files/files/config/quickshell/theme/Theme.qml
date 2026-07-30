pragma Singleton

import QtQuick
import Quickshell.Io

QtObject {
    id: root

    property var json: ({})
    property FileView file: FileView {
        path: "/home/shaan/.config/my_colors/colors.json"
        watchChanges: true

        onLoaded: {
            root.json = JSON.parse(text())
        }

        onFileChanged: reload()
    }

    function c(name) {
        return json.colors?.[name]?.default?.color ?? "#ff00ff"
    }

    readonly property color background: c("background")
    readonly property color foreground: c("on_background")
    readonly property color accent: c("primary")
    readonly property color surface: c("surface_container")

    readonly property color opaqueBackground:
        Qt.rgba(
        background.r,
        background.g,
        background.b,
        0.6
    )

    readonly property color opaqueForeground:
        Qt.rgba(
        foreground.r,
        foreground.g,
        foreground.b,
        0.6
    )

    readonly property font nerdfont: "JetBrainsMono Nerd Font Mono"

}