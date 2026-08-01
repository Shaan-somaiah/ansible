import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import QtQuick
import "../../../theme"


Row {

    readonly property var sink: Pipewire.defaultAudioSink

    PwObjectTracker {
        objects: sink ? [sink]: []
    }
    readonly property bool ready: sink && sink.ready
    readonly property bool muted: ready && sink.audio.muted
    readonly property int vol: ready ? Math.round(sink.audio.volume * 100) : 0

    readonly property string icon: {
        if(!ready)      return String.fromCodePoint(0xF075E)
        if(muted)       return String.fromCodePoint(0xEEE8)
        if(vol === 0)   return String.fromCodePoint(0xEEE8)
        if(vol < 34)    return String.fromCodePoint(0xF026)
        if(vol < 64)    return String.fromCodePoint(0xF027)
        return String.fromCodePoint(0xF028)
    }


    Text {
        text: icon
        color: Theme.foreground
        font {
            family: Theme.nerdfont
            pixelSize: 17
        }
    }

    Text {
        padding: 2
    }

    Text {
        text: vol + "%"
        color: Theme.foreground
        font {
            family: Theme.nerdfont
            pixelSize: 16
        }
    }

}