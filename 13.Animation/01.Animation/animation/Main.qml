import QtQuick            // Import core QML types like Rectangle, Item, etc.
import QtQuick.Controls   // Import UI controls like Button, Slider, etc.

Window {
    id: rootId            // Identifier for the window, used to reference properties and controls
    width: 640            // Window width
    height: 480           // Window height
    visible: true         // Make the window visible when the application starts
    title: qsTr("AnimationApp") // Window title; qsTr allows translation for internationalization

    property bool running: false // Boolean property controlling whether animations are active

    // Main container rectangle filling the entire window
    Rectangle {
        id: containerRectId
        anchors.fill: parent // Make the rectangle fill the parent window
        color: "lightblue"   // Set background color

        // Rectangle that will be animated
        Rectangle {
            id: containedRectId
            width: 100         // Initial width
            height: 100        // Initial height
            radius: 10         // Rounded corners
            x: 40              // Initial horizontal position
            y: 50              // Initial vertical position
            color: "purple"    // Rectangle color


            //Note: You could also use PropertyAnimation instead of NumberAnimation
            PropertyAnimation on x {
                to: 530
                duration: 2000
            }

            // Animation for moving rectangle along the X axis
            NumberAnimation on x {
                to: 530          // Target X position
                duration: 2000   // Duration in milliseconds (2 seconds)
                running: rootId.running // Animation only runs when 'running' is true
            }

            // Animation for rotating the rectangle
            RotationAnimation on rotation {
                to: 600          // Target rotation angle in degrees
                duration: 2000   // Duration in milliseconds (2 seconds)
                running: rootId.running // Controlled by the same 'running' property
            }

        }
    }

    // Row containing control buttons
    Row {
        spacing: 20            // Space between buttons
        anchors.centerIn: parent // Center the row in the window

        // Button to start animation
        Button {
            id: statAnimationBtnId
            text: "Start Animation"
            onClicked: {
                rootId.running = true // Start animations when clicked
            }
        }

        // Button to stop animation
        Button {
            id: stopAnimationBtnId
            text: "Stop Animation"
            onClicked: {
                rootId.running = false // Stop animations when clicked
            }
        }

        // Button to reset rectangle to original position, size, and rotation
        Button {
            id: resetAnimationBtnId
            text: "Reset Animation"
            onClicked: {
                containedRectId.x = 40        // Reset X position
                containedRectId.y = 50        // Reset Y position
                containedRectId.rotation = 0  // Reset rotation
                containedRectId.width = 100   // Reset width
                containedRectId.height = 100  // Reset height
                rootId.running = false        // Stop any running animations
            }
        }
    }
}
