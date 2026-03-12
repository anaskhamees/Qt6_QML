import QtQuick  // Import core QML types like Window, Rectangle, MouseArea, etc.

Window {
    width: 640             // Window width
    height: 480            // Window height
    visible: true          // Make the window visible when the app starts
    title: qsTr("Behavior") // Window title, qsTr allows translation

    // Main container rectangle filling the window
    Rectangle {
        id: containerRectId
        anchors.fill: parent // Fill the entire window
        color: "yellow"      // Background color

        // Rectangle that will move when clicked
        Rectangle {
            id: containedRectId
            width: 100          // Initial width
            height: 100         // Initial height
            radius: 10          // Rounded corners
            x: 50               // Initial horizontal position
            y: 50               // Initial vertical position
            color: "blue"       // Rectangle color

            // Behavior defines automatic animation whenever a property changes
            Behavior on x {
                NumberAnimation { 
                    // target: containedRectId  // Optional, automatically targets x
                    duration: 1000           // Animation duration: 1 second
                }
            }
        }

        // MouseArea detects clicks on the container rectangle
        MouseArea {
            anchors.fill: parent // Fill entire container to capture clicks anywhere
            onClicked: (mouse) => {
                containedRectId.x = mouse.x  // Move the inner rectangle to the click's x position
                // Because of Behavior on x, this movement will be animated smoothly
            }
        }
    }
}
