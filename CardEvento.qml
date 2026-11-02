import QtQuick

Rectangle {
    property string titulo: "Evento exemplo"
    property string local: "Local do evento"
    property string dataEvento: "Data do evento"

    width: parent ? parent.width - 80 : 300
    height: 100
    radius: 10
    color: "#f2f2f2"
    anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined

    Column {
        anchors.centerIn: parent
        spacing: 6

        Text {
            text: titulo
            font.pixelSize: 16
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: local
            font.pixelSize: 13
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: dataEvento
            font.pixelSize: 12
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

