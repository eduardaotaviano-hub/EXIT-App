import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 360
    height: 640
    visible: true
    title: "EXIT"

    property int paginaAtual: 0

    StackLayout {
        anchors.fill: parent
        currentIndex: paginaAtual

        Rectangle {
            anchors.fill: parent
            color: "white"

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    text: "EXIT"
                    font.pixelSize: 40
                    font.bold: true
                    color: "#0A5C2F"
                }

                TextField {
                    placeholderText: "Email"
                    width: 220
                }

                TextField {
                    placeholderText: "Senha"
                    echoMode: TextInput.Password
                    width: 220
                }

                Button {
                    text: "Entrar"
                    width: 220
                    onClicked: paginaAtual = 1
                }
            }
        }

        Perfil {
            id: paginaPerfil
            Layout.fillWidth: true
            Layout.fillHeight: true
            onAbrirCriarRole: paginaAtual = 2
            onAbrirConfiguracoes: paginaAtual = 4
            onAbrirEditarRole: function(idEvento, titulo, local, dataEvento) {
                paginaEditarRole.prepararEdicao(idEvento, titulo, local, dataEvento)
                paginaAtual = 5
            }
        }

        CriarRole {
            Layout.fillWidth: true
            Layout.fillHeight: true

            onAbrirEventoCriado: {
                    paginaAtual = 3
                    paginaPerfil.carregarEventosDoBanco()
                }

            onVoltarParaPerfil: {
                    paginaAtual = 1
                }

        }

        EventoCriado {
            Layout.fillWidth: true
            Layout.fillHeight: true
            onVoltarParaPerfil: paginaAtual = 1
        }

        Configuracoes {
            Layout.fillWidth: true
            Layout.fillHeight: true
            onVoltarParaPerfil: paginaAtual = 1
        }

        EditarRole {
            id: paginaEditarRole
            Layout.fillWidth: true
            Layout.fillHeight: true

            onEventoAtualizado: {
                paginaPerfil.carregarEventosDoBanco()
                paginaAtual = 1
            }

            onVoltarParaPerfil: paginaAtual = 1
        }
    }
}
