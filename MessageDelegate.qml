import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Item {
    id: delegate
    width: 300
    height: 68

    Image {
        id: photo
        anchors {
            top: parent.top
            topMargin: 10
        }
        width: 48
        height: width
        fillMode: Image.PreserveAspectCrop
        x: leftMessage ? 10 : 45
        source: imgSource

        Button {
            id: photoButton
            visible: !root.deploy
            anchors.centerIn: parent
            width: 32
            text: "..."
            onClicked: fileDialog.open()
        }
    }

    Rectangle {
        anchors {
            left: photo.right
            leftMargin: 10
            top: parent.top
            bottom: parent.bottom
        }
        width: 170
        radius: 4
        border.color: "lightgray"
        border.width: 1
    }

    Text {
        anchors {
            left: photo.right
            leftMargin: 20
            top: photo.top
            right: parent.right
            rightMargin: 10
            bottom: parent.bottom
            bottomMargin: 10
        }

        text: msgText
    }
    FileDialog {
        id: fileDialog
        onAccepted: messagesModel.get(index).imgSource = fileDialog.fileUrl.toString()
    }
}
