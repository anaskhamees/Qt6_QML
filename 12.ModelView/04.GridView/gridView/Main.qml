import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("GridViewApp")

    ListModel{
        id:dataModelId
        ListElement{
            number:1
            mycolor:"red"
        }

        ListElement{
            number:2
            mycolor:"yellow"
        }

        ListElement{
            number:3
            mycolor:"blue"
        }

        ListElement{
            number:4
            mycolor:"green"
        }

        ListElement{
            number:5
            mycolor:"pink"
        }

        ListElement{
            number:6
            mycolor:"dodgerblue"
        }

        ListElement{
            number:7
            mycolor:"magenta"
        }

        ListElement{
            number:8
            mycolor:"silver"
        }

        ListElement{
            number:9
            mycolor:"yellowgreen"
        }
    }

    GridView{
        id:gridViewId
        anchors.fill: parent
        model:dataModelId
        // flow control the direction of move from left to right
        // or top to down
        //flow:GridView.FlowLeftToRight
        flow:GridView.FlowTopToBottom
        delegate: Rectangle{
            width: 100
            height: width
            color: mycolor
            radius: 10
            Text {
                text: number
                anchors.centerIn: parent
                font.pointSize: 25
            }
        }
    }
}
