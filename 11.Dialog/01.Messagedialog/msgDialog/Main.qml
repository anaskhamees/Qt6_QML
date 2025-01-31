import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("MessageDialogApp")

    Button{
        anchors.centerIn: parent
        id:btnId
        text:"Press"
        onClicked: function(){
            msgDialogId.open()
        }
    }

    MessageDialog{
        id:msgDialogId
        title:"Message"
        text:"Hello World, I am Surviver"
        buttons: MessageDialog.Ok | MessageDialog.Cancel

        onAccepted: function(){
            console.log("Dialog is Accepted")
        }
        onRejected: function(){
            console.log("Dialog is Rejected")
        }
    }
}
