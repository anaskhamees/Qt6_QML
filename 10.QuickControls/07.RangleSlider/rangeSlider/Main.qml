import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("RangeSliderApp")

    ColumnLayout{
        width: parent.width
        spacing: 15
        Label{
            text: "Range Slider"
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
            font.pointSize: 25
        }

    RangeSlider {
        id:rangeSliderId
        Layout.alignment:Qt.AlignHCenter
        from: 1
        to: 100
        first.value: 0
        second.value: 100
        stepSize: 5
        }

    Text {
        id: minTxtId
        text: qsTr("Min: "+rangeSliderId.first.value)
        font.bold: true
        Layout.alignment: Qt.AlignHCenter
    }

    Text {
        id: maxTxtId
        text: qsTr("Max: "+rangeSliderId.second.value)
        font.bold: true
        Layout.alignment: Qt.AlignHCenter

    }

    }
}

