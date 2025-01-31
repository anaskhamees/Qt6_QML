import QtQuick

Rectangle {
    id:rootId
    signal clicked
    MouseArea{
        anchors.fill: parent
        onClicked: function(){
           //Emit clicked Signal
            rootId.clicked()
        }
    }
}
