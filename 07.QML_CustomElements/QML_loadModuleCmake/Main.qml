import QtQuick
import customButtons
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("LoadableQMLmoduleCMake")

    Column{
        x:10
        y:10
        grayButton{
            buttonText:"Gray_Button"
            onBtnClicked:{
                console.log("GrayButton Clicked")
            }
        }

    }
}
