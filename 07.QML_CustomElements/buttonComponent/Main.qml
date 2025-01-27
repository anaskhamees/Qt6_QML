/**
 * Using custom Component withou using ExternalFiles.
 * Method1: use Component Element with Loader Element.
 * Method2: use inlined Component --> MButton:Rectangle.
 */

import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // Method 1 :

    Row{
        spacing: 10
        Loader{
            id:firstBtn
            sourceComponent: btnComponent
            onLoaded: {
                var customBtn=firstBtn.item // Retrieve the loaded item
                // You Can Now, Access the loaded component's properties and signals
                customBtn.buttonText="Button_1"
                customBtn.btnClicked.connect(function(){
                  console.log("Button_1 Clicked")
                })
            }
        }

        Loader{
            id:secondBtn
            sourceComponent: btnComponent
            onLoaded: {
                var customBtn=secondBtn.item // Retrieve the loaded item
                // You Can Now, Access the loaded component's properties and signals
                customBtn.buttonText="Button_2"
                customBtn.btnClicked.connect(function(){
                  console.log("Button_2 Clicked")
                })
            }
        }
    }

    Component{
        id:btnComponent
        Item {
            //building a Custom Button
            id:rootId
            property alias buttonText :btnTxtId.text
            width: btnId.width
            height: btnId.height

            signal btnClicked
            Rectangle{
                id:btnId
                width: btnTxtId.implicitWidth+10
                height: btnTxtId.implicitHeight+10
                color: "red"
                border{
                    color: "blue"
                    width: 5
                }
                Text {
                    id: btnTxtId
                    text: qsTr("Button")
                    anchors.centerIn: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        rootId.btnClicked() // Emit The Signal
                    }
                }
            }
        }
    }

    // Method 2

    component MButton:Rectangle{
        id:btnId
        property alias buttonText :btnTxtId.text
        signal btnClicked
        width: btnTxtId.implicitWidth+10
        height: btnTxtId.implicitHeight+10
        color: "red"
        border{
            color: "blue"
            width: 5
        }
        Text {
            id: btnTxtId
            text: qsTr("Button")
            anchors.centerIn: parent
            onTextChanged: {
                console.log("Text changed to "+btnTxtId.text);
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                btnId.btnClicked() // Emit The Signal
            }
        }
    }

    }

    Column{
        spacing: 20
        y:50
        MButton{
            buttonText:"Button_3"
            onBtnClicked: {
                console.log("inlinedComponent : Button_3 Clicked")
            }
        }

        MButton{
            buttonText:"Button_4"
            onBtnClicked: {
                console.log("inlinedComponent : Button_4 Clicked")
            }
        }
    }
}

