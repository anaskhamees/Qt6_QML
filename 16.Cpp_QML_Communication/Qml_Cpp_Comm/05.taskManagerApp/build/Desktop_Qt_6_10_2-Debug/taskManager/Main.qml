import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import taskManager
import QtQuick.Controls.Material
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Task Manager App")
    // Material.theme: Material.Dark
    // Material.accent: Material.red
    Image {
        id: background
        anchors.fill: parent
        source: "qrc:/background.webp"
    }
    // create instance from task manager class in backend
    TaskManager{
        id:taskManager  //create instance object
    }

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 20

        Text {
            id: name
            text: qsTr("Task Dashboard")
            font.pixelSize:25
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle{
            width: 300
            height: 200
            radius: 15
            color: "lightblue"
            Column{
                anchors.centerIn: parent
                spacing: 10
                Text {
                    text: qsTr("Total Tasks: "+taskManager.totalTasks)
                    color: "black"
                    font.pixelSize: 20
                }

                Text {
                    text: qsTr("Completed Tasks: "+taskManager.completedTasks)
                    color: "black"
                    font.pixelSize: 20
                }
            }
        }

        RowLayout{
            spacing: 15
            Button{
                text: "Add Task"
                //call c++ function directly
                onClicked: {
                    taskManager.addTask()
                }
            }

            Button{
                text: "Complete Task"
                onClicked: {
                    //call c++ function directly
                    taskManager.completeTask()
                }
            }
        }

        ProgressBar{
            Layout.fillWidth: true     // auto stretch
            value: taskManager.totalTasks===0 ? 0:
                                                taskManager.completedTasks/taskManager.totalTasks
        }
    }
}
