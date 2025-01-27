import QtQuick

Item {
    //building a Custom Button
    id:rootId
    property alias buttonText :btnTxtId.text
    width: btnId.width
    height: btnId.height

    signal btnClicked
    Rectangle{
        id:btnId
        width: btnTxtId.implicitWidth+10
        height: btnTxtId.implicitHeight+10
        color: "gray"
        border{
            color: "blue"
            width: 5
        }
        Text {
            id: btnTxtId
            text: qsTr("Button")
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                rootId.btnClicked() // Emit The Signal
            }
        }
    }
}
