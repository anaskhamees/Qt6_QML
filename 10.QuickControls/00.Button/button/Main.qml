import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ButtonApp")

    ColumnLayout{
    anchors.left: parent.left
    anchors.right: parent.right

    Button{
        id:btn1Id
        text:"Button_1"
        Layout.fillWidth:true
        onClicked: function() {
        console.log("Button_1 is Clicked")
        }
    }

    Button{
        id:btn2Id
        text:"Button_2"
        Layout.fillWidth:true
        onClicked: function() {
        console.log("Button_2 is Clicked")
    }
    }

}
}
