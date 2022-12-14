import QtQuick 2.15

Item {
    id: taskObject
    width: 300
    height: 40
    anchors.left: parent.left
    anchors.right: parent.right

    property string taskName: "Example"
    property string taskPrice: "0 €"

    MouseArea {
        id: clickArea
        anchors.fill: parent
        onClicked: {
            backend.task_select(task.text)
            if (durationInput.text == ""){
                durationInput.text = "1"
            }
            backend.calc_total()
        }

        Rectangle {
            id: bg
            color: "#ea3838"
            anchors.fill: parent
        }
        Text {
            id: task
            text: taskName
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            font.styleName: "Regular"
            anchors.leftMargin: 8
        }
        Text {
            id: price
            text: taskPrice
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 8
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3}D{i:2}D{i:3}D{i:4}D{i:1}
}
##^##*/
