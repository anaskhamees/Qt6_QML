import QtQuick              // Core QML types (Item, Image, etc.)
import QtQuick.Controls     // UI controls like SwipeView, PageIndicator
Window {
    width: 640              // Window width
    height: 480             // Window height
    visible: true           // Make the window visible when the app starts
    title: qsTr("SwipeViewApp")  // Window title (qsTr allows translation)

    // SwipeView allows the user to swipe horizontally between pages
    SwipeView{
        id: swipeViewId                 // ID used to reference this SwipeView
        anchors.fill: parent            // Make it fill the entire window
        currentIndex: pageIndicatorId.currentIndex 
        // Synchronizes the current page with the PageIndicator

        anchors.bottomMargin: 20        // Leave space at the bottom for PageIndicator

        // First page of SwipeView
        Image{
            id: image1
            fillMode: Image.PreserveAspectFit
            // Keeps the image aspect ratio without distortion

            source: "file:images/ivi.jpg"
            // Image file path
        }

        // Second page
        Image{
            id: image2
            fillMode: Image.PreserveAspectFit
            source: "file:images/automotive.png"
        }

        // Third page
        Image{
            id: image3
            fillMode: Image.PreserveAspectFit
            source: "file:images/opel.png"
        }

    }

    // PageIndicator shows dots representing the pages in SwipeView
    PageIndicator{
        id: pageIndicatorId

        count: swipeViewId.count
        // Number of dots equals the number of pages in SwipeView

        currentIndex: swipeViewId.currentIndex
        // Highlights the dot of the current page

        anchors.bottom: swipeViewId.bottom
        // Position it at the bottom of the SwipeView

        anchors.horizontalCenter: parent.horizontalCenter
        // Center the indicator horizontally in the window
    }
}
