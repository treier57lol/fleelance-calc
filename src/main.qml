import QtQuick 2.15
import QtQuick.Window 2.15
import "qml/controls"

Window {
    id: window
    width: 960
    height: 540
    visible: true
    title: qsTr("FreelanceCalc")

    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width

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
                id: price
                color: "#ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 104
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                clip: true
                fontSizeMode: Text.HorizontalFit
                layer.mipmap: false
                layer.smooth: false
                font.styleName: "Medium"
                textFormat: Text.RichText
                font.weight: Font.DemiBold
                font.family: "Chakra Petch"
                anchors.bottomMargin: 16
                anchors.topMargin: 16
                anchors.rightMargin: 16
                anchors.leftMargin: 16
            }

            Text {
                id: duration
                y: 112
                color: "#ffffff"
                font.styleName: "Medium"
                textFormat: Text.RichText
                font.weight: Font.DemiBold
                font.family: "Chakra Petch"
                text: qsTr("Duration: ")
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                font.pixelSize: 24
                anchors.bottomMargin: 7
                anchors.leftMargin: 16
            }
        }

        Flow {
            id: flow0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 200
            anchors.rightMargin: 25
            anchors.leftMargin: 25
            anchors.bottomMargin: 24
            spacing: 33
            flow: Flow.LeftToRight

            Flow {
                id: flow1
                width: parent.width/2-parent.spacing/2
                height: parent.height
                flow: Flow.TopToBottom
                spacing: 8
                clip: false


                Rectangle {
                    id: searchField
                    width: parent.width
                    height: 40
                    color: "#303131"
                    //                    anchors.horizontalCenterOffset: 0
                    //                    anchors.horizontalCenter: parent.horizontalCenter

                    TextInput {
                        id: searchInput
                        color: "#cbcbcb"
                        text: qsTr("")
                        anchors.fill: parent
                        font.pixelSize: 26
                        verticalAlignment: Text.AlignVCenter
                        clip: true
                        mouseSelectionMode: TextInput.SelectCharacters
                        selectByMouse: true
                        cursorVisible: false
                        selectionColor: "#a7a7a7"
                        anchors.rightMargin: 12
                        anchors.leftMargin: 12
                        anchors.bottomMargin: 6
                        anchors.topMargin: 6
                        onTextChanged: {
                            backend.search(this.text)
                        }

                        Text {
                            id: searchPlaceholder
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
                            visible: !parent.text
                        }
                    }
                }
                ListView {
                    id: listView
                    width: parent.width
                    height: 266
                    spacing: 8
                    clip: true
                    property ListModel listModel: ListModel {}
                    model: listModel
                    delegate: TaskObject {
                        taskName: task_name
                        taskPrice: task_price
                    }
                }
            }

            Flow {
                id: flow2
                width: parent.width/2-parent.spacing/2
                height: parent.height
                spacing: 5
                flow: Flow.TopToBottom

                Flow {
                    id: flow3
                    width: parent.width
                    height: 40
                    spacing: 11
                    flow: Flow.LeftToRight

                    Rectangle {
                        id: durationField
                        width: 200
                        height: parent.height
                        color: "#303131"
                        TextInput {
                            id: durationInput
                            color: "#cbcbcb"
                            text: qsTr("")
                            anchors.fill: parent
                            font.pixelSize: 26
                            verticalAlignment: Text.AlignVCenter
                            Text {
                                id: durationInputPlaceholder
                                visible: !parent.text
                                color: "#666666"
                                text: qsTr("Duration")
                                anchors.left: parent.left
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                font.pixelSize: 26
                                verticalAlignment: Text.AlignVCenter
                                anchors.leftMargin: 0
                                anchors.bottomMargin: 0
                                anchors.topMargin: 0
                            }
                            selectionColor: "#a7a7a7"
                            anchors.leftMargin: 12
                            onTextChanged: {
                                backend.set_duration_value(this.text)
                                backend.calc_total()
                            }
                            mouseSelectionMode: TextInput.SelectCharacters
                            selectByMouse: true
                            cursorVisible: false
                            anchors.rightMargin: 12
                            anchors.bottomMargin: 6
                            anchors.topMargin: 6
                            clip: true
                        }
                    }

                    Text {
                        id: text2
                        height: parent.height
                        text: qsTr("days")
                        color: "#ffffff"
                        font.styleName: "Medium"
                        textFormat: Text.RichText
                        font.weight: Font.DemiBold
                        font.family: "Chakra Petch"
                        font.pixelSize: 22
                        verticalAlignment: Text.AlignVCenter
                    }
                }

            }
        }
    }

    Connections {
        target: backend

        function onCalcPrice(number){
            price.text = number
        }

        function onCalcDuration(number){
            duration.text = number
        }

        function onSearchResult(result) {
            listView.listModel.append({task_name: result[0], task_price: result[1]})
        }

        function onClearSearch() {
            listView.listModel.clear()
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}D{i:3}D{i:4}D{i:2}D{i:9}D{i:8}D{i:7}D{i:10}D{i:6}D{i:17}
D{i:16}D{i:15}D{i:18}D{i:14}D{i:13}D{i:5}D{i:1}D{i:19}
}
##^##*/
