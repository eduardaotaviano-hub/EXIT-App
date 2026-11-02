import QtQuick
import QtQuick.Controls
import QtQuick.LocalStorage



Rectangle {


    function abrirBanco() {
        return LocalStorage.openDatabaseSync(
            "ExitDB",
            "1.0",
            "Banco local do aplicativo Exit",
            1000000
        )
    }

        function criarTabelaEventos() {
            var db = abrirBanco()

            db.transaction(function(tx) {
                tx.executeSql(`
                    CREATE TABLE IF NOT EXISTS eventos (
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        titulo TEXT,
                        local TEXT,
                        dataEvento TEXT
                    )
                `)
            })
        }

        function inserirEventosTeste() {
            var db = abrirBanco()

            db.transaction(function(tx) {
                var rs = tx.executeSql("SELECT COUNT(*) AS total FROM eventos")

                if (rs.rows.item(0).total === 0) {
                    tx.executeSql(
                        "INSERT INTO eventos (titulo, local, dataEvento) VALUES (?, ?, ?)",
                        ["Cinema com amigos", "Manaíra Shopping", "30/03 às 20h"]
                    )

                    tx.executeSql(
                        "INSERT INTO eventos (titulo, local, dataEvento) VALUES (?, ?, ?)",
                        ["Rolê no centro", "Centro Histórico", "02/04 às 18h"]
                    )
                }
            })
        }

        function excluirEvento(idEvento) {
            var db = abrirBanco()

            db.transaction(function(tx) {
                tx.executeSql("DELETE FROM eventos WHERE id = ?", [idEvento])
            })

            carregarEventosDoBanco()
        }

        function apagarEventosVazios() {
            var db = abrirBanco()

            db.transaction(function(tx) {
                tx.executeSql(
                    "DELETE FROM eventos WHERE titulo = '' OR titulo IS NULL"
                )
            })
        }

        function carregarEventosDoBanco() {
            eventosModel.clear()

            var db = abrirBanco()

            db.transaction(function(tx) {
                var rs = tx.executeSql("SELECT id, titulo, local, dataEvento FROM eventos ORDER BY id DESC")

                for (var i = 0; i < rs.rows.length; i++) {
                    var item = rs.rows.item(i)

                    eventosModel.append({
                        id: item.id,
                        titulo: item.titulo,
                        local: item.local,
                        dataEvento: item.dataEvento
                    })
                }
            })
        }



                Component.onCompleted: {
                    criarTabelaEventos()
                    inserirEventosTeste()
                    carregarEventosDoBanco()


                }




    anchors.fill: parent
    color: "white"

    signal abrirCriarRole()
    signal abrirConfiguracoes()
    signal abrirEditarRole(int idEvento, string titulo, string local, string dataEvento)

    property int eventoSelecionadoId: -1

    Dialog {
        id: confirmarExclusaoDialog
        title: "Excluir evento"
        modal: true
        width: parent.width - 40
        anchors.centerIn: parent
        standardButtons: Dialog.Yes | Dialog.No

        Label {
            text: "Tem certeza de que deseja excluir este evento?"
            wrapMode: Text.WordWrap
        }

        onAccepted: {
            if (eventoSelecionadoId !== -1) {
                excluirEvento(eventoSelecionadoId)
                eventoSelecionadoId = -1
            }
        }

        onRejected: eventoSelecionadoId = -1
    }




    Column {
        anchors.fill: parent
        spacing: 20


        // Barra superior
        Rectangle {
            width: parent.width
            height: 50
            color: "transparent"

            Text {
                text: "Perfil"
                font.pixelSize: 28
                font.bold: true

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Button {
                text: "+"
                width: 40
                height: 40

                anchors.right: parent.right
                anchors.rightMargin: 40
                anchors.verticalCenter: parent.verticalCenter

                onClicked: abrirCriarRole()
            }

            Button {
                text: "⚙"
                width: 40
                height: 40
                anchors.left: parent.left
                anchors.leftMargin: 16
                anchors.verticalCenter: parent.verticalCenter
                onClicked: abrirConfiguracoes()
            }
        }

        Rectangle {
            width: 120
            height: 120
            radius: 60
            color: "#FFFFFF"
            anchors.horizontalCenter: parent.horizontalCenter


            Image {
                source: "fotos/pessoa.png"
                width: 190
                height: 190
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectCrop
                smooth: true
            }
        }

        Text {
            text: "Jang ki Yong 💣❤️"
            font.pixelSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "@아주 화끈한 남자"
            color: "gray"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            width: parent.width -80
            height: 2
            color: "#e0e0e0"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "Eventos Criados"
            font.pixelSize: 18
            anchors.left: parent.left
            anchors.leftMargin: 40
        }


        ListModel {
            id: eventosModel
        }

        ScrollView {
            id: eventosScroll
            width: parent.width
            height: 300
            clip: true

            Column {
                width: eventosScroll.availableWidth
                spacing: 10

                Repeater {
                    model: eventosModel

                    delegate: CardEvento {
                        eventoId: model.id
                        titulo: model.titulo
                        local: model.local
                        dataEvento: model.dataEvento

                        onExcluirSolicitado: function(idEvento) {
                            eventoSelecionadoId = idEvento
                            confirmarExclusaoDialog.open()
                        }

                        onEditarSolicitado: function(idEvento, titulo, local, dataEvento) {
                            abrirEditarRole(idEvento, titulo, local, dataEvento)
                        }
                    }
                }
            }
        }
    }
}


