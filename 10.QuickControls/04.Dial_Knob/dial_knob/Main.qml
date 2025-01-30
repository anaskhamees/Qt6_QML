import QtQuick
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("DialKnob")
    Column{
        width: parent.width
        spacing: 40
        Label{
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "Controlable Knob"
            font.pointSize: 25

        }
            Dial{
                anchors.horizontalCenter: parent.horizontalCenter
                from: 1
                to:100
                value:50
                onValueChanged: function(){
                    console.log("Current Value: "+value)
                    knobTxtId.text=value
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                id: knobTxtId
                text: qsTr("default")
                font.pointSize: 20
                font.bold: true
            }
        }

    }

