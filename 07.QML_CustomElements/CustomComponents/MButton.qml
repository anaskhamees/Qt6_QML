import QtQuick   // Import the basic Qt Quick module

Item {
    id: rootId   // Root item id so we can reference it inside the component

    // This property exposes the Text element's text
    // So when someone writes buttonText:"Hello" outside the component
    // it actually changes btnTxtId.text
    property alias buttonText: btnTxtId.text

    // Custom signal that will be emitted when the button is clicked
    signal btnClicked

    // implicitWidth / implicitHeight allow layouts (Column, Row, etc.)
    // to know the preferred size of this component
    implicitWidth: btnId.width
    implicitHeight: btnId.height

    Rectangle {
        id: btnId  // Rectangle that represents the button body

        // Button width depends on text width + padding
        width: btnTxtId.implicitWidth + 20

        // Button height depends on text height + padding
        height: btnTxtId.implicitHeight + 20

        color: "red"   // Button background color

        // Border around the button
        border.color: "blue"
        border.width: 5

        Text {
            id: btnTxtId

            // Default text (can be overridden using buttonText)
            text: "Button"

            // Center the text inside the button
            anchors.centerIn: parent
        }

        MouseArea {
            // MouseArea detects mouse interactions
            anchors.fill: parent   // Fill the entire button area

            onClicked: {
                // Emit the custom signal when the button is clicked
                rootId.btnClicked()
            }
        }
    }
}
