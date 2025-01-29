import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id:rectId
        width: 200
        height: 150
        color: "red"
        MouseArea{
            id:mouseAreaId
            anchors.fill: parent
        }
    }

    //Handle the signal outside the mouse Area
    Connections{
        target: mouseAreaId
        function onClicked(){
            console.log("On Click");
        }
        function onDoubleClicked(mouse){
            console.log("DoubleClicked at:"+mouse.x);
        }
    }
}
