import QtQuick 2.0

Item {
    id: root
    visible: false

    property string message: CTRL.popupNtf

    Rectangle {
        anchors.fill: parent
        color: "#000"
        opacity: 0.3
    }

    Rectangle {
        id: box
        width: msg.width + 120
        height: msg.height + 160
        radius: 30
        anchors.centerIn: parent
        border.color: "#008896"
        border.width: 2
        color: "#eeeeee"

        Text {
            id: msg
            text: root.message
            font.pixelSize: 40
            color: "black"
            anchors.centerIn: parent
        }
    }

    Timer {
        id: timer
        interval: 2000
        onTriggered: root.visible = false
    }

    Connections {
        target: CTRL
        function onPopupNtfChanged() {
            root.visible = true
            timer.start()
        }
    }
}
