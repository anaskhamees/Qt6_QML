import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("CustomeComponentsApp")
    Column{
        spacing:2
        MButton{
            id:button1Id
            buttonText:"Button_1"
            onBtnClicked: {
                console.log("Button_1 Clicked")
            }

            // width: 100
            // height: 25
        }
        MButton{
            id:button2Id
            buttonText:"Button_2"
            onBtnClicked: {
                console.log("Button_2 Clicked")
            }

            // width: 100
            // height: 25
        }
    }
}
