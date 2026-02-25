import QtQuick
import QtQuick.Window

Window {
    width: 600
    height: 500
    visible: true
    title: "Qt Object Full Example"

    Column {
        anchors.centerIn: parent
        spacing: 30
        id:mainCol

        // Date & Time formatting
        Text {
            text: Qt.formatDateTime(new Date(), "dd/MM/yyyy - hh:mm:ss")
            font.pixelSize: 20
        }

        // Locale example
        Text {
            text: "Locale: " + Qt.locale().name
        }

        // Platform info
        Text {
            text: "Platform OS: " + Qt.platform.os
        }


        Rectangle {
            width: 200
            height: 40
            radius: 10
            color: "lightgray"

            Text {
                anchors.centerIn: parent
                text: "Click to Create Object"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    dynamicRectComponent.createObject(mainCol)
                }
            }
        }

        // Dynamic object creation
        Component {
            id: dynamicRectComponent
            Rectangle {
                width: 100
                height: 50
                color: "orange"
                radius: 10
                Text {
                    anchors.centerIn: parent
                    text: "Dynamic"
                }
            }
        }
    }
}
