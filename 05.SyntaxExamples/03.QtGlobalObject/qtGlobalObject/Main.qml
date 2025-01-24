import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: "Qt Global Example"

    // Accessing Qt's application state
    Rectangle {
        width: 640
        height: 100
        color: Qt.application.active ? "green" : "red"

        Text {
            anchors.centerIn: parent
            text: Qt.application.active ? "Application is Active" : "Application is Inactive"
            color: "white"
        }
    }

    // Using Qt's color functions
    Rectangle {
        width: 200
        height: 200
        color: Qt.darker(Qt.rgba(1, 0, 0, 1), 1.5)
        radius: 10
        anchors.top: parent.top
        anchors.topMargin: 120
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    // Formatting Date/Time using Qt
    Rectangle {
        width: 640
        height: 100
        color: "lightgray"
        anchors.top: parent.top
        anchors.topMargin: 350

        Text {
            anchors.centerIn: parent
            text: Qt.formatDateTime(new Date(), "yyyy-MM-dd HH:mm:ss")
            font.bold: true
        }

        Text {
            text: Qt.platform.os
            font.bold: true
        }
    }

    // Dynamic QML Object Creation using Qt.createQmlObject
    Component.onCompleted: {
        var dynamicComponent = Qt.createQmlObject('import QtQuick; Rectangle { width: 100; height: 100; color: "blue" }', parent);
        dynamicComponent.x = 300;
        dynamicComponent.y = 300;
    }

    // MD5 hashing example using Qt.md5
    Text {
        anchors.top: parent.top
        anchors.topMargin: 470
        text: "MD5 of 'Hello, World!': " + Qt.md5("Hello, World!")
        font.pixelSize: 20
    }
}
