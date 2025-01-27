import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("propertyChangeHandlers")

    Rectangle{
        id:rectId
        height: 150
        width: height+100
        color: "red"
        property string description: "SimpleRectangle"

        /* for any propery in QML ,
         * QML will create a signal named [<propertyName>Changed]
         * and handler called on<PropertyName>Changed
         */

        // property change handlers

        onWidthChanged: {
            console.log("The Width was Changed to : "+rectId.width)
        }

        onHeightChanged: {
            console.log("The Height was Changed to : "+rectId.height)
        }

        onColorChanged: {
            console.log("The Rectangle Color was Changed to : "+rectId.color)
        }

        onDescriptionChanged: {
            console.log("The Rectangle Desc. was Changed to : "+rectId.description)
        }

        MouseArea{
            anchors.fill: parent
                onClicked: {
                    rectId.width+=5
                    rectId.height+=5
                    rectId.color="black"
                    rectId.description="NewModifiedDescription"
                }
        }
    }
}
