import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ColorAnimationApp")
    Rectangle{
        id:rectId
        width: 100
        height: 100
        radius: 10
        color: "purple"

        ColorAnimation {
            id:colorAnimationId
            property: "color"
            target: rectId
            from: "white"
            to: "black"
            duration: 2000
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: function() {
            colorAnimationId.start()
        }
    }
}
