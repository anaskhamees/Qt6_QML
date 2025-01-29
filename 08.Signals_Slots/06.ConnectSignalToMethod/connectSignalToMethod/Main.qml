import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ConnectSignalToMethod")

    Rectangle{
        id:rectId
        width:300
        height: 250
        color:"red"

        //setUp the signal
        signal welcome(string msg)

        //set up custom Method to be Handler
        function myHandlerFun(message)
        {
            console.log("customResponse: "+message)
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            rectId.welcome("Helloworld !, welcome")
        }
    }

    // Connect a Signal To a Handler (Slot)
    Component.onCompleted: {
        rectId.welcome.connect(rectId.myHandlerFun)
    }
}
