import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML Data Types App")

    property string mString:"https://github.com/anaskhamees"
    property int mInt:50
    property bool isMale:false
    property double mDouble:22.5
    property url mURL:"https://github.com/anaskhamees"

    Rectangle{
        width: 400
        height: 100+mInt
        radius: 15
        border.width: 10
        border.color: "blue"
        anchors.centerIn: parent
        color: "orange"
        Text{
            id:txtID
            anchors.centerIn: parent
            text:mURL
            font.bold: isMale ? true:false
        }
    }

    Component.onCompleted: {
        console.log("App is running")
    }
}
