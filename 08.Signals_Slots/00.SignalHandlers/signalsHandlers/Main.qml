import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("signalHandlers")
    Rectangle{
        id:rectId
        width: 250
        height:150
        color: "purple"

        MouseArea{
            anchors.fill: parent
            //hoverTrue : to make Hovering IN/OUT Automatically
            hoverEnabled: false

            // Click > Signal
            // onClicked > Handler
            onClicked:{
                console.log("Clicked On Rectangle")
            }

            // DoubleClick > Signal
            // onDoubleClicked > Handler
            onDoubleClicked: {
                console.log("Double Clicked On Rectangle")
            }
            // Entered > Signal
            // onEntered > Handler
            onEntered: {
                console.log("You Are In Rectangle !")
            }
            onExited: {
                console.log("You Are Out !")
            }

            //When Drag and Released the mouse Coordinates X-Y
            onReleased:mouse=> {
                console.log("Released at X: "+mouse.x+" , Y= "+mouse.y)
            }

            // Press and Hold Signal
            onPressAndHold: mouse=>{
                                console.log("Is Mouse was Held: "+ mouse.wasHeld)
            }

            // Mouse postions changes Events
            onPositionChanged: mouse=>{
                console.log("Position changed, X: "+mouse.x+", Y: "+mouse.y)
            }
        }
    }
}
