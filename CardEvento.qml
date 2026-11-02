import QtQuick
import QtQuick.Controls

Rectangle {
    property int eventoId: -1
    property string titulo: "Evento exemplo"
    property string local: "Local do evento"
    property string dataEvento: "Data do evento"

    signal editarSolicitado(int idEvento, string titulo, string local, string dataEvento)
    signal excluirSolicitado(int idEvento)

    width: parent ? parent.width - 80 : 300
    height: 150
    radius: 10
    color: "#f2f2f2"
    anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 12
        spacing: 5
        width: parent.width - 20

        Text {
            text: titulo
            font.pixelSize: 16
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            elide: Text.ElideRight
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
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

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 2
        spacing: 12

        Button {
            text: "Editar"
            flat: true
            onClicked: editarSolicitado(eventoId, titulo, local, dataEvento)
        }

        Button {
            text: "Excluir"
            flat: true
            onClicked: excluirSolicitado(eventoId)
        }
    }
}
