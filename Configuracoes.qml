import QtQuick
import QtQuick.Controls

Rectangle {
    anchors.fill: parent
    color: "white"

    signal voltarParaPerfil()

    Column {
        anchors.fill: parent
        spacing: 20
        padding: 20

        Rectangle {
            width: parent.width
            height: 50
            color: "transparent"

            Button {
                text: "<"
                width: 40
                height: 40
                anchors.left: parent.left
                anchors.leftMargin: 16
                anchors.verticalCenter: parent.verticalCenter
                onClicked: voltarParaPerfil()
            }

            Text {
                text: "Configurações"
                font.pixelSize: 28
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Text {
            text: "Conta"
            font.pixelSize: 18
            font.bold: true
        }

        Rectangle {
            width: parent.width - 40
            height: 50
            radius: 10
            color: "#f2f2f2"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Editar perfil"
                anchors.centerIn: parent
            }
        }

        Rectangle {
            width: parent.width - 40
            height: 50
            radius: 10
            color: "#f2f2f2"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Alterar senha"
                anchors.centerIn: parent
            }
        }

        Text {
            text: "Preferências"
            font.pixelSize: 18
            font.bold: true
        }

        Rectangle {
            width: parent.width - 40
            height: 50
            radius: 10
            color: "#f2f2f2"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Notificações"
                anchors.centerIn: parent
            }
        }

        Rectangle {
            width: parent.width - 40
            height: 50
            radius: 10
            color: "#f2f2f2"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Privacidade"
                anchors.centerIn: parent
            }
        }

        Rectangle {
            width: parent.width - 40
            height: 50
            radius: 10
            color: "#f2f2f2"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Sair"
                anchors.centerIn: parent
                color: "red"
            }
        }
    }
}
