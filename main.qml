import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 1080
    height: 870
    title: qsTr("Format Code")

    BackGround {
        id: bg
        anchors.fill: parent
    }

    Rectangle {
        id: create

        width: 500
        height: 60
        radius: 40
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 20
        }
        border.width: 2
        border.color: "#008896"
        Text {
            id: text_backup
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 30
            }
            font.pixelSize: 25
            opacity: 0.6
            text: "object  data_type  name"
            visible: text_input.text == ""
        }
        TextInput {
            id: text_input
            width: parent.width - text_input.anchors.leftMargin * 2
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 30
            }
            clip: true
            font.pixelSize: 25

            Keys.onReturnPressed: CTRL.create(text_input.text)
        }
    }

    ListOption {
        id: list_option
        anchors {
            left: parent.left
            leftMargin: 30
            top: parent.top
            topMargin: 180
        }
    }

    Loader {
        width: 760
        anchors {
            left: parent.left
            leftMargin: 280
            top: parent.top
            topMargin: 100
        }
        source: list_option.source
    }

    PopUpNotify {
        id: popup
        anchors.fill: parent
    }
}
