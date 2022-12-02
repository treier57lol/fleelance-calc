import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 960
    height: 540
    visible: true
    title: qsTr("FreelanceCalc")

    Rectangle {
        id: rectangle
        color: "#202223"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        transformOrigin: Item.Top

        Rectangle {
            id: rectangle2
            width: 910
            height: 152
            color: "#303131"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            transformOrigin: Item.Top
            anchors.topMargin: 25

            Text {
                id: text3
                x: 295
                width: 597
                color: "#ffffff"
                text: qsTr("$20,000")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 104
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                layer.mipmap: false
                layer.smooth: false
                font.styleName: "Medium"
                textFormat: Text.RichText
                font.weight: Font.DemiBold
                font.family: "Chakra Petch"
                anchors.bottomMargin: 16
                anchors.topMargin: 16
                anchors.rightMargin: 16
            }
        }

        Flow {
            id: flow0
            x: 25
            y: 200
            width: 910
            height: 316
            spacing: 33
            flow: Flow.LeftToRight

            Flow {
                id: flow1
                width: parent.width/2-parent.spacing/2
                height: parent.height
                clip: false

                ListView {
                    id: listView
                    y: search.height
                    width: parent.width
                    height: 266
                    spacing: 12
                    clip: true
                    model: ListModel {
                        ListElement {
                            name: "Grey"
                            colorCode: "grey"
                        }

                        ListElement {
                            name: "Red"
                            colorCode: "red"
                        }

                        ListElement {
                            name: "Blue"
                            colorCode: "blue"
                        }

                        ListElement {
                            name: "Green"
                            colorCode: "green"
                        }
                    }
                    delegate: Item {
                        x: 5
                        width: 80
                        height: 40
                        Row {
                            id: row1
                            spacing: 10
                            Rectangle {
                                width: 40
                                height: 40
                                color: colorCode
                            }

                            Text {
                                text: name
                                anchors.verticalCenter: parent.verticalCenter
                                font.bold: true
                            }
                        }
                    }
                }

                Rectangle {
                    id: search
                    width: parent.width
                    height: 40
                    color: "#303131"
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter

                    TextInput {
                        id: textInput
                        color: "#cbcbcb"
                        text: qsTr("")
                        anchors.fill: parent
                        font.pixelSize: 26
                        verticalAlignment: Text.AlignVCenter
                        clip: true
                        mouseSelectionMode: TextInput.SelectCharacters
                        selectByMouse: true
                        cursorVisible: true
                        selectionColor: "#a7a7a7"
                        anchors.rightMargin: 12
                        anchors.leftMargin: 12
                        anchors.bottomMargin: 6
                        anchors.topMargin: 6

                        Text {
                            id: text2
                            color: "#666666"
                            text: qsTr("Search")
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            font.pixelSize: 26
                            verticalAlignment: Text.AlignVCenter
                            anchors.leftMargin: 0
                            anchors.bottomMargin: 0
                            anchors.topMargin: 0
                            visible: !textInput.text
                        }
                    }
                }
            }

            Flow {
                id: flow2
                width: parent.width/2-parent.spacing/2
                height: parent.height

                Text {
                    id: text1
                    color: "#ffffff"
                    text: qsTr("siia tulevad valikud")
                    font.pixelSize: 12
                }
            }
        }






    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}D{i:3}D{i:2}D{i:6}D{i:18}D{i:17}D{i:16}D{i:5}D{i:20}D{i:19}
D{i:4}D{i:1}
}
##^##*/
