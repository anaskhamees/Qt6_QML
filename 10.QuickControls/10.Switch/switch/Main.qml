import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("SwitchApp")

    ColumnLayout {
        Switch {
            text: qsTr("Wi-Fi")
        }
        Switch {
            text: qsTr("Bluetooth")
        }
    }

}
