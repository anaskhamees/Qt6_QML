import QtQuick
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("CppSignal")
    Column{
        anchors.centerIn: parent
        spacing: 10
        Text {
            id: label
            text: qsTr("Value: 0")
            font.pointSize: 18
        }
        Button{
            text: "Increment"
            onClicked: {
                counter.increment()// call cpp
            }
        }
        // Listen to cpp signal
        Connections{
            target: counter
            function onValueChanged(value){
                label.text="Value: "+value
            }
        }
    }
}
