import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Image App")

    Item {
        id: containerItemId
        x:50
        y:50
        width: 600
        height: 300

        Image{
            id:imgId1
            width: 250
            height: 150

            //Load Image From Working Directory
            source: "file:ivi.jpg"
            Text {
                id: imgId1Txt
                y:imgId1.y+imgId1.height
                text: qsTr("IVI From project working directory")
            }
        }

        Image{
            id:imgId2
            x:imgId1.x+imgId1.width+10
            width: 250
            height: 150

            //Load Image From resource file of the project
            // The image will be part of App binary(MachineCode)
            source: "qrc:/images/bmwImg.jpg"

            Text {
                id: imgId2Txt
                y:imgId2.y +imgId2.height
                text: qsTr("BMW from Qt resource file")
            }
        }

        Image{
            id:imgId3
            y:imgId1.y+imgId1.height+25
            width: 250
            height: 150

            //Load Image From Full Path (OS-Dependent)
            source: "file:/home/anas/Downloads/kia.webp"

            Text {
                id: imgId3Txt
                y:imgId3.y
                text: qsTr("Kia From Linux Full Path")
            }
        }

        Image{
            id:imgId4
            x:imgId3.x+imgId3.width+15
            y:imgId2.y+imgId2.height+35
            width: 250
            height: 150

            //Load Image From Internet
            source: "https://res.cloudinary.com/total-dealer/image/upload/w_750,f_auto,q_75/v1/production/sep40bx7vg1n5oby4xis8ml61woe"

            Text {
                y:imgId4.y
                id: img4Txt
                text: qsTr("Tuscon Loaded From Internel")
            }
        }

    }
}
