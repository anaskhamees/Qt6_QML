import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 400

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            id: labelId
            text: "Value: 0"
            font.pixelSize: 18
        }

        Slider {
            id: slider
            width: 300
            from: 0
            to: 100
            value: 0
            stepSize: 1

            onValueChanged: labelId.text = "Value: " + value
        }
    }
}
