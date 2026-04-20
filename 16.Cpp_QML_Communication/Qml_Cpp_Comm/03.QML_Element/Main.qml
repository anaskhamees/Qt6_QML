import QtQuick
import QtQuick.Controls
import qmlElement
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML Element")

    Counter{
        id:counter
    }
    Column{
        anchors.centerIn: parent
        spacing: 20
        Text {
            id: name
            text: qsTr("Value: "+counter.value)
            font.pixelSize: 20
        }
        Button{
            text: "Increase"
            onClicked: {
                counter.value++;
            }
        }
    }
}
