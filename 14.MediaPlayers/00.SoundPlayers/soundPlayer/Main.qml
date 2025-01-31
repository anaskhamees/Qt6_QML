import QtQuick
import QtMultimedia

Window {
    width: 640
    height: 400
    visible: true

    MediaPlayer {
        id: player
        source: "file:///home/anas/Downloads/islam.mp3"
        audioOutput: AudioOutput {}
    }

    Component.onCompleted: {
        player.play()
    }
}
