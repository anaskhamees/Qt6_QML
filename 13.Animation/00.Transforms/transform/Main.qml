import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Transform")

    AnasRectangle{
        id:rect1Id
        x:50
        y:100
        width: 100
        height: 100
        radius: 10
        color:"red"
        onClicked: function(){
            //Translation on X
            x+=20
        }
    }

    AnasRectangle{
        id:rect2Id
        x:rect1Id.x+rect1Id.width+100
        y:100
        width: 100
        height: 100
        radius: 10
        color:"blue"
        onClicked: function(){
            //Rotation on X
            rotation+=10
        }
    }

    AnasRectangle{
        id:rect3Id
        x:rect2Id.x+rect2Id.width+100
        y:100
        width: 100
        height: 100
        radius: 10
        color:"green"
        onClicked: function(){
            //Scaling on X
            scale+=0.05

            //Rotation
            rotation+=10
        }
    }
}
