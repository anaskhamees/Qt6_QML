import QtQuick
import QtQuick.Layouts
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("gridLayout")

    //RowLayout
    //ColumnLayout
    //Flow
    GridLayout{
        anchors.centerIn: parent
        columns: 3
        Rectangle{
            id:rect1Id
            width:100
            height: 100
            color: "magenta"
            Text {
                id: rect1TxtId
                text: qsTr("1")
                anchors.centerIn: parent
            }
        }

        Rectangle{
            id:rect2Id
            width:100
            height: 100
            color: "yellowgreen"
            Text {
                id: rect2TxtId
                text: qsTr("2")
                anchors.centerIn: parent
            }
        }

        Rectangle{
            id:rect3Id
            width:100
            height: 100
            color: "dodgerblue"
            Text {
                id: rect3TxtId
                text: qsTr("3")
                anchors.centerIn: parent

            }
        }

        Rectangle{
            id:rect4Id
            width:100
            height: 100
            color: "yellow"
            Text {
                id: rect4TxtId
                text: qsTr("4")
                anchors.centerIn: parent

            }
        }

        Rectangle{
            id:rect5Id
            width:100
            height: 100
            color: "red"
            Text {
                id: rect5TxtId
                text: qsTr("5")
                anchors.centerIn: parent

            }
        }

        Rectangle{
            id:rect6Id
            width:100
            height: 100
            color: "blue"
            Text {
                id: rect6TxtId
                text: qsTr("6")
                anchors.centerIn: parent

            }
        }

        Rectangle{
            id:rect7Id
            width:100
            height: 100
            color: "purple"
            Text {
                id: rect7TxtId
                text: qsTr("7")
                anchors.centerIn: parent

            }
        }

        Rectangle{
            id:rect8Id
            width:100
            height: 100
            color: "green"
            Text {
                id: rect8TxtId
                text: qsTr("8")
                anchors.centerIn: parent

            }
        }

        Rectangle{
            id:rect9Id
            width:100
            height: 100
            color: "yellow"
            Text {
                id: rect9TxtId
                text: qsTr("9")
                anchors.centerIn: parent

            }
        }

    }
}
