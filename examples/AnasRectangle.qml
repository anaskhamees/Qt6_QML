import QtQuick

Rectangle {
    id:rootRectId
    signal myClicked
    MouseArea{
        anchors.fill: parent

        onClicked: {
            // Emit Signal
            rootRectId.myClicked()
        }
    }
}
