import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Property Bindings App")

    property double rectWidth: 22.5
    property double rectHeight: 22.5

    Rectangle{
        id:redRectId
        width: rectWidth*3
        height:rectHeight*1.5
        color: "red"
        radius: 10
        anchors.centerIn: parent
        Text {
            id: redRectTxtId
            text: qsTr("I am Bigger")
            font.pointSize: 5
            anchors.centerIn: parent
        }
    }
    Rectangle{
        id:blueRectId
        width: rectWidth*6
        height:rectHeight*4
        color: "blue"
        radius: 5
        anchors.bottom: parent.bottom

        MouseArea{
            anchors.fill: parent
            onClicked: {
                redRectId.width=redRectId.width+15
                redRectId.height=redRectId.height+5
                redRectTxtId.font.pointSize=redRectTxtId.font.pointSize+2
            }
        }
    }

}
