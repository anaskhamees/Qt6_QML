import QtQuick
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("SwipeViewApp")
    SwipeView{
        id:swipeViewId
        anchors.fill:parent
        currentIndex: pageIndicatorId.currentIndex
        anchors.bottomMargin: 20
        Image{
            id:image1
            fillMode: Image.PreserveAspectFit
            source:"file:images/ivi.jpg"
        }

        Image{
            id:image2
            fillMode: Image.PreserveAspectFit
            source:"file:images/automotive.png"
        }
        Image{
            id:image3
            fillMode: Image.PreserveAspectFit
            source:"file:images/opel.png"
        }

    }
    PageIndicator{
        id:pageIndicatorId
        count: swipeViewId.count
        currentIndex: swipeViewId.currentIndex
        anchors.bottom: swipeViewId.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
