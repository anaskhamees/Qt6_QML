import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 300
    height: 200

    Column {
        anchors.centerIn: parent
        spacing: 20

        // automatically updates when value changes
        Text {
            //text: counter ? "Value: " + counter.value : "Value: -"
            text: "Value: " + counter.value
            font.pixelSize: 20
        }

        Button {
            text: "Increase"
            onClicked: {
                counter.value = counter.value + 1
            }
        }
    }
}
