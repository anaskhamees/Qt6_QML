import QtQuick
import QtQuick.Controls

Window {
    visible: true
    width: 300
    height: 200
    title: "PropertiesContext"
    Column {
        anchors.centerIn: parent
        spacing: 10

        Button {
            text: "Call INVOKABLE"
            onClicked: AnasClass.sayHelloInvokable()
        }

        Button {
            text: "Call SLOT"
            onClicked: AnasClass.sayHelloSlot()
        }
    }
}
