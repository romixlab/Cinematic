import QtQuick 2.0

Item {
    id: delegate
    width: 300
    height: 68

    Text {
        anchors.centerIn: parent
        font.bold: true
        font.pointSize: 12
        text: msgText
    }
}
