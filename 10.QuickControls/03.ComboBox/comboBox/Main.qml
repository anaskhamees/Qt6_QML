import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ComboBox")

    ColumnLayout{
        width: parent.width
        height: parent.height

        //Non editable Combobox
        Label{
            text: "Non-Editable ComboBox"
            wrapMode: Label.Wrap
            Layout.fillWidth: true
        }
        ComboBox{
            id:nonEditablComboBoxId
            model:["One","Two","Three","Four"]
            Layout.fillWidth: true
            onActivated: {
                console.log("[" + currentIndex +"]" + currentText + " is Activated")
            }
        }

        // Editable ComboBox
        // editable Combobox
        Label{
            text: "Editable ComboBox"
            wrapMode: Label.Wrap
            Layout.fillWidth: true
        }
        ComboBox{
            id:editablComboBoxId
            editable: true
          // textRole : Can be text or location >> of List Element
            textRole:"location"

            model: ListModel{
                id:model
                ListElement{
                    text:"Dog"
                    location:"Cairo"
                }

                ListElement{
                    text:"Cat"
                    location:"Alexandria"
                }

                ListElement{
                    text:"Bird"
                    location:"Luxor"
                }
            }

            Layout.fillWidth: true
            onActivated: {
                console.log("[" + currentIndex +"]" + currentText + " is Activated")
            }
        }
    }

}
