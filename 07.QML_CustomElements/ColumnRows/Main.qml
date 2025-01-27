import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("CustomeComponentsApp")

    Column {
         spacing: 2

         Rectangle { color: "red"; width: 50; height: 50 }
         Rectangle { id: greenRect; color: "green"; width: 50; height: 50 }
         Rectangle { color: "blue"; width: 50; height: 50 }
    }

    Row {
         spacing: 2
         x: 50
         Rectangle { color: "yellow"; width: 50; height: 50 }
         Rectangle { id: greenRectRow; color: "green"; width: 50; height: 50 }
         Rectangle { color: "blue"; width: 50; height: 50 }
    }
}
