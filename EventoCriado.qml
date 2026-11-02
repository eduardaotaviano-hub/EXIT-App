import QtQuick
import QtQuick.Controls

Rectangle {
    anchors.fill: parent
    color: "white"

    signal voltarParaPerfil()

    Button {
        text: "👤"
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.leftMargin: 16
        anchors.top: parent.top
        anchors.topMargin: 16

        onClicked: voltarParaPerfil()
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Evento criado!"
            font.pixelSize: 30
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "Seu rolê foi criado com sucesso."
            font.pixelSize: 18
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
