import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("CheckBoxApp")

Column{
    spacing: 20
    anchors.horizontalCenter: parent.horizontalCenter

    CheckBox{
        text:"Option_1"
        checked: true
        onCheckedChanged: function(){
            if(checked){
                console.log("Option_1 is checked")
            }else{
                console.log("Option_1 in Not checked")
            }
        }
    }

    CheckBox{
        text: "Option_2"
        onCheckedChanged: function(){
            if(checked){
                console.log("Option_2 is checked")
            }else{
                console.log("Option_2 in Not checked")
            }
        }
    }

    CheckBox{
        text:"Option_3"
        checked:false
        enabled: false
    }
}
}
