import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("SwitchApp")

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        // Wi-Fi Switch
        Switch {
            id: wifiSwitch
            text: qsTr("Wi-Fi")

            // Triggered when the switch state changes
            onCheckedChanged: {
                if (checked)
                    wifiStatus.text = "Wi-Fi is ON"
                else
                    wifiStatus.text = "Wi-Fi is OFF"
            }
        }

        // Label showing Wi-Fi status
        Label {
            id: wifiStatus
            text: "Wi-Fi is OFF"
        }

        // Bluetooth Switch
        Switch {
            id: bluetoothSwitch
            text: qsTr("Bluetooth")

            onCheckedChanged: {
                if (checked)
                    bluetoothStatus.text = "Bluetooth is ON"
                else
                    bluetoothStatus.text = "Bluetooth is OFF"
            }
        }

        // Label showing Bluetooth status
        Label {
            id: bluetoothStatus
            text: "Bluetooth is OFF"
        }
    }
}
