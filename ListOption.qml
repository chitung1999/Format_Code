import QtQuick 2.0

Item {
    id: root

    property int index: 0
    property string source: option.get(0).source

    ListModel {
        id: option
        ListElement {
            title: "QT PROPERTY"
            source: "qrc:/QtProperty.qml"
        }
        ListElement {
            title: "QT ..."
            source: ""
        }
    }

    Column {
        Repeater {
            id: repeat
            model: option
            Rectangle {
                width: 220
                height: 60
                color: "transparent"
                Text {
                    anchors {
                        left: parent.left
                        leftMargin: 50
                        verticalCenter: parent.verticalCenter
                    }
                    font.pixelSize: 20
                    text: title
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = "#bcbcbc"
                    onExited:  parent.color = "transparent"
                    onClicked: {
                        root.source = source
                        root.index = index
                    }
                }
            }
        }
    }

    Rectangle {
        id: choose
        y: choose.height * root.index
        width: 8
        height: 60
        color: "#008896"
    }
}
