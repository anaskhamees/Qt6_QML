import QtQuick
import QtQuick.Controls
Window {
    id:rootId
    width: 640
    height: 480
    visible: true
    title: qsTr("AnimationApp")

    property bool running: false

    Rectangle{
        id:containerRectId
        anchors.fill: parent
        color:"lightblue"
        Rectangle{
            id:containedRectId
            width: 100
            height: 100
            radius: 10
            x:40
            y:50
            color: "purple"

            // PropertyAnimation on x{
            //     to:530
            //     duration: 2000
            // }

            NumberAnimation on x{
                to:530
                duration:2000
                running: rootId.running
            }

            RotationAnimation on rotation {
                to :600
                duration: 2000
                running: rootId.running
            }
        }
    }

    Row{
        spacing: 20
        anchors.centerIn: parent
        Button{
            id:statAnimationBtnId
            text: "Start Animation"
            onClicked: {
                rootId.running=true
            }
        }

        Button{
            id:stopAnimationBtnId
            text: "Stop Animation"
            onClicked: {
                rootId.running=false
            }
        }

        Button {
                id:resetAnimationBtnId
                text: "Reset Animation"
                onClicked: {
                    containedRectId.x=40
                    containedRectId.y=50
                    containedRectId.rotation=0
                    containedRectId.width=100
                    containedRectId.height=100
                    rootId.running=false
                }
        }

}
}

