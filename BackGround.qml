import QtQuick 2.0
import QtGraphicalEffects 1.14

Item {
    id: root

    Rectangle {
        id: box_hide
        width: 1020
        height: 750
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 100
        }
        color: "#eeeeee"
        Rectangle {
            width: 220
            height: parent.height
            color: "#a6a6a6"
        }
        visible: false
    }



    Rectangle {
        id: box
        width: box_hide.width + box.border.width * 2
        height: box_hide.height + box.border.width * 2
        anchors.centerIn: box_hide
        radius: 30
        border.width: 2
        border.color: "#008896"
    }

    OpacityMask {
        id: mask
        anchors.fill: box_hide
        source: box_hide
        maskSource: box
        visible: true
    }

    Text {
        id: title
        anchors {
            top: box.top
            topMargin: 30
            left: box.left
            leftMargin: 30
        }
        font.pixelSize: 30
        font.bold: true
        text: "Option"
    }

}
