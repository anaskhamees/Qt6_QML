import QtQuick
import QtQuick.Controls

Window {
    width: 400
    height: 200
    visible: true
    title: "Property Change Handler Example"

    // Define a custom property
    property string message: "Hello, World!"

    // React to changes in the 'message' property
    onMessageChanged: {
        console.log("The message property has changed to:", message)
    }

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: message
            font.pixelSize: 20
        }

        Button {
            text: "Change Message"
            onClicked: {
                message = "Message updated at " + new Date().toLocaleTimeString()
            }
        }
    }
}
