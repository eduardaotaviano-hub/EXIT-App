import QtQuick
import QtQuick.Controls
import QtQuick.LocalStorage

Rectangle {
    anchors.fill: parent
    color: "white"

    signal abrirEventoCriado()
    signal voltarParaPerfil()

    Button {
        text: "👤"
        width: 40
        height: 40

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 16
        anchors.leftMargin: 16

        onClicked: voltarParaPerfil()
    }


    function abrirBanco() {
        return LocalStorage.openDatabaseSync(
            "ExitDB",
            "1.0",
            "Banco local do aplicativo Exit",
            1000000
        )
    }

    function salvarEvento() {
        if (campoTitulo.text.trim() === "" ||
            campoLocal.text.trim() === "" ||
            campoData.text.trim() === "") {
            return
        }

        var db = abrirBanco()

        db.transaction(function(tx) {
            tx.executeSql(
                "INSERT INTO eventos (titulo, local, dataEvento) VALUES (?, ?, ?)",
                [campoTitulo.text, campoLocal.text, campoData.text]
            )
        })
    }

    Column {
        anchors.centerIn: parent
        spacing: 15
        width: parent.width * 0.8

        Text {
            text: "Criar Rolê"
            font.pixelSize: 28
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter

        }



        TextField {
            id: campoTitulo
            placeholderText: "Nome do evento"
            width: parent.width
        }

        TextField {
            id: campoLocal
            placeholderText: "Local"
            width: parent.width
        }

        TextField {
            id: campoData
            placeholderText: "Data"
            width: parent.width
        }

        TextArea {
            id: campoDescricao
            placeholderText: "Descrição"
            width: parent.width
            height: 80
        }

        Button {
            text: "Criar evento"
            width: parent.width

             onClicked: {
                salvarEvento()
                abrirEventoCriado()
            }
        }
    }
}
