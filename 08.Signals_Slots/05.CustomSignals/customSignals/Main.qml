import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("customSignal")

    Rectangle{
        id:rectId
        width: 200
        height: 150
        color: "dodgerblue"

        // Setup Signal
        signal welcome(string message)
        // once create a signal Qt system create a handler automatically
        //Handler
        onWelcome: function(message){
            console.log("YourMessage: "+message);
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                // Fire the signal by calling it like a function
                rectId.welcome("HelloWorld, Welcome !")
            }
        }
    }

}
