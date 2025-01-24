import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Shapes Application")
    property string welcomTxt1: "Hello"
    property string welcomTxt2: "World"
    property string welcomTxt3: "!"
    property string myName1:"Anas"
    property string myName2:"Khamees"

    Row{
        spacing: 15
        anchors.centerIn: parent
        Rectangle{
            id:redRectId
            width: 100
            height: 100
            color: "red"
          // Positioning methods
            /*x:50
              y:50*/
            radius: 10
            antialiasing : true //for smoother edge curves in Rect corners
            border.color: "blue"
            border.width: 10
           // anchors.centerIn: parent
            Text {
                id: redRectTxtID
                anchors.centerIn:parent
                text: welcomTxt1
            }
            MouseArea{
                anchors.fill: parent //telling the MouseArea element to fill the Rectangle that contains it.
                onClicked:
                {
                    console.log("Clicked on the Red Rectangle")
                    parent.color= "black"
                }
            }
        }

        Rectangle{
            id:greenRectId
            width: 100
            height: 100
            color: "green"
          // Positioning methods
            /*x:50
              y:50*/
            radius: 10
            antialiasing : false //for smoother edge curves in Rect corners
            border.color: "gray"
            border.width: 10
       //     anchors.centerIn: parent
            Text {
                id: greenRectTxtID
                anchors.centerIn:parent
                text: welcomTxt2
            }
            MouseArea{
                anchors.fill: parent //telling the MouseArea element to fill the Rectangle that contains it.
                onClicked:
                {
                    console.log("Clicked on the Green Rectangle")
                    parent.color= "black"

                }


            }
        }

        Rectangle{
            id:blueRectId
            width: 100
            height: 100
            color: "blue"
          // Positioning methods
            /*x:50
              y:50*/
            radius: 10
            antialiasing : true //for smoother edge curves in Rect corners
            border.color: "yellow"
            border.width: 10
            //anchors.centerIn: parent
            Text {
                id: blueRectTxtID
                anchors.centerIn:parent
                text: welcomTxt3
            }
            MouseArea{
                anchors.fill: parent //telling the MouseArea element to fill the Rectangle that contains it.
                onClicked:
                {
                    console.log("Clicked on the Blue Rectangle")
                    parent.color= "black"

                }


            }
        }

        Rectangle{
            id:roundedRectId
            width: 100
            height: 100
            color: "purple"
          // Positioning methods
            /*x:50
              y:50*/
            radius: 25
            antialiasing : true //for smoother edge curves in Rect corners
            border.color: "gray"
            border.width: 10
            //anchors.centerIn: parent
            Text {
                id: roundedTxtID
                anchors.centerIn:parent
                text: myName1
            }
            MouseArea{
                anchors.fill: parent //telling the MouseArea element to fill the Rectangle that contains it.
                onClicked:
                {
                    console.log("Clicked on the Purple Reounded Rectangle")
                    parent.color= "black"

                }


            }
        }

        Rectangle{

            id:circleID
            width: 100
            height: 100
            color: "pink"
          // Positioning methods
            /*x:50
              y:50*/
            radius: 100
            antialiasing : true //for smoother edge curves in Rect corners
            border.color: "black"
            border.width: 10
            //anchors.centerIn: parent
            Text {
                id: circleTxtID
                anchors.centerIn:parent
                text: myName2
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    console.log("Clicked on the Pink Circle")
                    parent.color= "black"
                }
            }
        }
    }

}
