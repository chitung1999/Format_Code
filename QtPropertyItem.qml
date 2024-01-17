import QtQuick 2.0

Item {
    id: root

    width: parent.width
    height: content.height + content.anchors.topMargin
    visible: false

    property string title
    property string content

    Text {
        id: title
        anchors {
            left: parent.left
            top: parent.top
            topMargin: 20
        }
        font.pixelSize: 20
        font.bold: true
        text: "• " + root.title + ":"
    }

    TextEdit {
        id: content
        width: 650
        anchors {
            left: parent.left
            leftMargin: 40
            top: parent.top
            topMargin: 60
        }
        font.pixelSize: 20
        text: root.content
        readOnly: true
        wrapMode: TextEdit.Wrap

        MouseArea {
            anchors.fill: parent
            onDoubleClicked: root.copy()
        }
    }

    Image {
        id: copy
        anchors {
            verticalCenter: content.verticalCenter
            right: parent.right
            rightMargin: 20
        }
        source: "qrc:/copy.png"

        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.7
            onReleased: parent.scale = 1
            onClicked: root.copy()
        }
    }

    function copy() {
        content.selectAll()
        content.copy()
    }

    Connections {
        target: CTRL
        function onNameChanged() { root.visible = true}
    }
}
