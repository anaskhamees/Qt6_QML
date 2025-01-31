import QtQuick
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Flickable_ScrollBar_App")

    Flickable{
        width: parent.width
        height: parent.height
        contentHeight: columnId.implicitHeight

        Column{
            id:columnId
            anchors.fill: parent

            Rectangle{
                id:rect1Id
                color: "black"
                width: parent.width
                height: 150
                Text {
                    id: rect1TxtId
                    anchors.centerIn: parent
                    text: qsTr("Black")
                    font.bold: true
                    color: "white"
                }
            }

            Rectangle{
                id:rect2Id
                color: "red"
                width: parent.width
                height: 150
                Text {
                    id: rect2TxtId
                    anchors.centerIn: parent
                    text: qsTr("Red")
                    font.bold: true
                    color: "white"
                }
            }

            Rectangle{
                id:rect3Id
                color: "blue"
                width: parent.width
                height: 150
                Text {
                    id: rect3TxtId
                    anchors.centerIn: parent
                    text: qsTr("Blue")
                    font.bold: true
                    color: "white"
                }
            }

            Rectangle{
                id:rect4Id
                color: "green"
                width: parent.width
                height: 150
                Text {
                    id: rect4TxtId
                    anchors.centerIn: parent
                    text: qsTr("Green")
                    font.bold: true
                    color: "white"
                }
            }
            Rectangle{
                id:rect5Id
                color: "orange"
                width: parent.width
                height: 150
                Text {
                    id: rect5TxtId
                    anchors.centerIn: parent
                    text: qsTr("Orange")
                    font.bold: true
                    color: "white"
                }
            }
        }
        ScrollBar.vertical: ScrollBar{

        }
    }
}
