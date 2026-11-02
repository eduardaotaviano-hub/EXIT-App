import QtQuick
import QtQuick.Controls
import QtQuick.LocalStorage

Rectangle {
    id: root
    anchors.fill: parent
    color: "white"

    signal voltarParaPerfil()
    signal eventoAtualizado()

    property int eventoId: -1

    function abrirBanco() {
        return LocalStorage.openDatabaseSync(
            "ExitDB",
            "1.0",
            "Banco local do aplicativo Exit",
            1000000
        )
    }

    function prepararEdicao(idEvento, titulo, local, dataEvento) {
        eventoId = idEvento
        campoTitulo.text = titulo
        campoLocal.text = local
        campoData.text = dataEvento
    }

    function atualizarEvento() {
        if (eventoId < 0 || campoTitulo.text.trim() === "" ||
                campoLocal.text.trim() === "" || campoData.text.trim() === "") {
            mensagemErro.text = "Preencha título, local e data antes de salvar."
            mensagemErro.visible = true
            return
        }

        try {
            var db = abrirBanco()
            db.transaction(function(tx) {
                tx.executeSql(
                    "UPDATE eventos SET titulo = ?, local = ?, dataEvento = ? WHERE id = ?",
                    [campoTitulo.text.trim(), campoLocal.text.trim(), campoData.text.trim(), eventoId]
                )
            })
            mensagemErro.visible = false
            eventoAtualizado()
        } catch (erro) {
            mensagemErro.text = "Não foi possível atualizar o evento. Tente novamente."
            mensagemErro.visible = true
            console.log("Erro ao atualizar evento:", erro)
        }
    }

    Button {
        text: "<"
        width: 40
        height: 40
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 16
        anchors.leftMargin: 16
        onClicked: voltarParaPerfil()
    }

    Column {
        anchors.centerIn: parent
        spacing: 15
        width: parent.width * 0.8

        Text {
            text: "Editar evento"
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

        Text {
            id: mensagemErro
            visible: false
            color: "#c62828"
            wrapMode: Text.WordWrap
            width: parent.width
        }

        Button {
            text: "Salvar alterações"
            width: parent.width
            onClicked: atualizarEvento()
        }
    }
}
