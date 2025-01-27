import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("SignalParameters")
    Rectangle{
        id:rectId
        width: 300
        height:200
        color: "green"
        MouseArea{
            anchors.fill: parent

        /*************** Deprecated Method ****************

            //synatxMethod #1
            onClicked:{
                console.log("PositionX: "+mouse.x+" - PositionY:  "+mouse.y)
            }
        ***************************************************/

            // SyntaxMethod #2 > Java Script Functions

            /* onClicked: function(mouse){
                console.log("PositionX: "+mouse.x+" - PositionY:  "+mouse.y)
            }*/

            // SyntaxMethod #3 > Arrow Functions
            onClicked:mouse_param=>{
                          console.log("PositionX: "+mouse_param.x+" - PositionY:  "+mouse_param.y)
                      }



        }

    }
}
