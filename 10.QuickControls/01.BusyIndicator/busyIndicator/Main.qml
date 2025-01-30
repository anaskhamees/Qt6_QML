import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("BusyIndicatorApp")

    BusyIndicator{
        anchors.centerIn: parent
        id:busyIndicatorId
        running: true
    }
}
