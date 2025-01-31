import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
Window {
    id:windowId
    width: 640
    height: 480
    visible: true
    title: qsTr("ColorDialogApp")
    Column{
        spacing: 15
        anchors.centerIn: parent
        Button{
            text: "Choose Color"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: function(){
                colorDialogId.open()
            }
        }
        ColorDialog{
            id:colorDialogId
            title:"Choose Color"
            onAccepted: function(){
                console.log("Choose Color : "+ selectedColor)
                windowId.color=selectedColor
            }

            onRejected: function(){
                console.log("The Dialog is Rejected")
            }
        }
    }
}
