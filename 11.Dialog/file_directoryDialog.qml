import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

ApplicationWindow {
    id: windowId
    width: 700
    height: 500
    visible: true
    title: "Mini File Manager"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20
        width: 450

        Label {
            text: "Qt Quick File & Folder Dialog Demo"
            font.pixelSize: 22
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            spacing: 15

            Button {
                text: "📄 Open File"
                onClicked: openFileDialog.open()
            }

            Button {
                text: "💾 Save File"
                onClicked: saveFileDialog.open()
            }

            Button {
                text: "📁 Select Folder"
                onClicked: folderDialog.open()
            }
        }

        Rectangle {
            Layout.fillWidth: true
            height: 120
            radius: 6
            color: "#eeeeee"
            border.color: "#cccccc"

            Text {
                id: resultText
                anchors.centerIn: parent
                width: parent.width - 20
                wrapMode: Text.Wrap
                text: "Selected path will appear here..."
            }
        }
    }

    // OPEN FILE
    FileDialog {
        id: openFileDialog
        title: "Open File"
        nameFilters: ["Images (*.png *.jpg)", "Text files (*.txt)", "All files (*)"]

        onAccepted: {
            resultText.text = "Opened file:\n" + selectedFile
            console.log("Opened:", selectedFile)
        }
    }

    // SAVE FILE
    FileDialog {
        id: saveFileDialog
        title: "Save File"
        fileMode: FileDialog.SaveFile

        onAccepted: {
            resultText.text = "File will be saved to:\n" + selectedFile
            console.log("Save path:", selectedFile)
        }
    }

    // SELECT FOLDER
    FolderDialog {
        id: folderDialog
        title: "Select Folder"

        onAccepted: {
            resultText.text = "Selected folder:\n" + selectedFolder
            console.log("Folder:", selectedFolder)
        }
    }
}
