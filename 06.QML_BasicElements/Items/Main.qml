import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML Basic Elements")

    Item {
        id: containerItemId
         x:50
         y:50
         width: 400
         height: 250

         Rectangle{
             anchors.fill: parent // the Rectangle will fill its parent (Item)
             color: "red"

             //add border to rectangle [Grouped Property Syntax#1]

             /* border.color: "black"
             border.width: 10*/

             //Grouped Property [Syntax #2]

             /*border{
                 color: "blue"
                 width: 15
             }*/

             //Grouped Property [Syntax #3]

             border.color: "dodgerblue";border.width:10
         }

         Rectangle{
             x:10
             y:10
             width: 100
             height: 100
             color: "green"
         }

         Rectangle{
             x:50;y:50
             width: 100;height: 100;color: "yellow"
         }

         Rectangle{
             x:100;y:100
             width: 100;height: 100;color: "purple"
         }

         Text {
             id: txtId
             x:250
             y:100
             text: qsTr("Hello World !")
             color: "white"

             //Text Syntax #1
             font.family: "Helvetica"
             font.pointSize: 13
             font.bold: true

             //Text Syntax #2
             font{
                 family: "Helvetica"
                 pointSize: 13
                 bold: true
             }

             //Text Syntax #3

         //    font.family: "Helvetica";font.pointSize: 13;font.bold: true


         }
    }
}
