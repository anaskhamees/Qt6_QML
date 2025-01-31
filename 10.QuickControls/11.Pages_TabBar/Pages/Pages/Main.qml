import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 640
    height: 400

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: homePage  // Load first page
    }

    Page{
        id:homePage
        Rectangle {
            anchors.fill: parent
            color: "lightblue"
            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    text: "This is the Home Page"
                    font.pixelSize: 20
                }

                Button {
                    text: "Go to Second Page"
                    onClicked: stackView.push(secondPage)
                }
            }
        }
    }

    Page {
        id: secondPage

        Rectangle {
            anchors.fill: parent
            color: "lightgreen"

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    text: "This is the Second Page"
                    font.pixelSize: 20
                }

                Button {
                    text: "Go Back"
                    onClicked: stackView.pop()
                }
            }
        }
    }
}


