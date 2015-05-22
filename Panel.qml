import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.2

Item {
    id: root
    width: 300
    height: 400
    property bool deploy

    ListModel {
        id: messagesModel
    }

    function message(text, img, isleft, istext) {
        messagesModel.append({imgSource: img, msgText: text, leftMessage: isleft, isText: istext})
        listView.currentIndex = listView.count - 1
    }

    signal deployMessage(var text, var img, var left, var istext)

    Component {
        id: msgDelegate
        Loader {
            source: isText ? "TextDelegate.qml" : "MessageDelegate.qml"
        }
    }

    Rectangle {
        id: headerRect
        width: 300
        height: 28
        color: "steelblue"
        radius: 3
        Rectangle {
            width: parent.width
            height: parent.height / 2
            y: parent.height / 2
            color: parent.color
        }
        TextInput {
            font.bold: true
            font.pointSize: 9
            color: "white"
            text: "Человек"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
        }
        TextInput {
            font.bold: true
            font.pointSize: 9
            color: "white"
            text: "Человек 2"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
        }
    }
    Rectangle {
        id: messagesRect
        anchors {
            top: headerRect.bottom
            left: headerRect.left
            right: headerRect.right
        }
        height: 400
        color: "white"
        opacity: 0.9
        border.color: "steelblue"
        border.width: 1

        Item {
            clip: true
            anchors.fill: parent
            anchors.margins: 3
            ListView {
                id: listView
                anchors.fill: parent
                anchors.margins: 10
                model: messagesModel
                delegate: msgDelegate
                spacing: 15
            }
        }
    }
    Rectangle {
        visible: !root.deploy
        anchors {
            left: headerRect.left
            right: headerRect.right
            top: messagesRect.bottom
        }
        height: 90
        color: "steelblue"
        TextArea {
            id: sendTextArea
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }
            height: 55
        }
        Button {
            anchors {
                bottom: parent.bottom
                bottomMargin: 3
                left: parent.left
                leftMargin: 5
            }
            text: "Отправить"
            onClicked: {
                var t = sendTextArea.text

                if (t[0] == 't')
                    messagesModel.append({msgText: t.slice(1, t.length), isText: true, imgSource: "", leftMessage: false})
                else
                    messagesModel.append({msgText: t, leftMessage: true, isText: false, imgSource: ""})
            }
        }
        Button {
            anchors {
                bottom: parent.bottom
                bottomMargin: 3
                right: parent.right
                rightMargin: 5
            }
            text: "Отправить"
            onClicked: {
                var t = sendTextArea.text

                if (t[0] == 't')
                    messagesModel.append({msgText: t.slice(1, 0), isText: true, imgSource: "", leftMessage: false})
                else
                    messagesModel.append({msgText: t, leftMessage: false, isText: false, imgSource: ""})
            }
        }
        Button {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 3
            anchors.horizontalCenter: parent.horizontalCenter
            text: "На видео"
            onClicked: {
                var m = messagesModel.get(0)
                root.deployMessage(m.msgText, m.imgSource, m.leftMessage, m.isText)
                messagesModel.remove(0)
            }
        }
    }
}
