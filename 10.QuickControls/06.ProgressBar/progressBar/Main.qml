import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480
    title: "ProgressBarApp"

    Column {
        spacing: 20
        anchors.centerIn: parent

        ProgressBar {
            id: progressBarId
            from: 0
            to: 100
            value: 0
            width: 300
        }

        Button {
            text: "Start Progress"
            onClicked: {
                progressAnimation.restart()
            }
        }

        Button {
            text: "Indeterminate Mode"
            onClicked: {
                progressBarId.indeterminate = !progressBarId.indeterminate
            }
        }
    }

    // Animation for progress
    NumberAnimation {
        id: progressAnimation
        target: progressBarId
        property: "value"
        from: 0
        to: 100
        duration: 5000 // 5 seconds
    }
}
