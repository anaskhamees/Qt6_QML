import QtQuick
import QtQuick.Dialogs
import QtQuick.Controls
Window {
    id:windowId
    width: 640
    height: 480
    visible: true
    title: qsTr("SwipViewApp")

      Rectangle{
          anchors.centerIn: parent
          id:containedRectId
          width: 400
          height: 250
          radius: 10
          color: "purple"


          ColorAnimation {
              id:animationId
              from: "white"
              property: "color"
              target: containedRectId
              to: "black"
              duration: 2000
          }

          MouseArea{
              anchors.fill: parent
              onClicked:function (){
                  animationId.start()
              }
          }
      }


  }

