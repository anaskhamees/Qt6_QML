import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("BtnBusyApp")

    ColumnLayout{
        width: parent.width
        BusyIndicator{
            id:busyIndicatorId
            running: true
            Layout.alignment: Qt.AlignHCenter
        }
        ColumnLayout{
            Button{
                id:btn1
                text:"Run"
                Layout.fillWidth:true
                onClicked: {
                    busyIndicatorId.running=true
                }
            }

            Button{
                id:btn2
                text:"Stop"
                Layout.fillWidth:true
                onClicked: {
                    busyIndicatorId.running=false
                }
            }
        }
    }
}
