import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Behavior")

    Rectangle{
        id:containerRectId
        anchors.fill: parent
        color:"yellow"

        Rectangle{
            id:containedRectId
            width: 100
            height:100
            radius: 10
            x:50
            y:50
            color: "blue"

            Behavior on x{
                NumberAnimation{
                  //  target: containedRectId
                    duration: 1000
                }
            }
        }

        MouseArea{
            anchors.fill: parent
            onClicked: (mouse)=>{
                           containedRectId.x=mouse.x
                       }
        }
    }
}
