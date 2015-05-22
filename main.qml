import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

ApplicationWindow {
    title: qsTr("Cinematic")
    width: 1240
    height: 800
    visible: true
    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Window {
        id: sendWindow
        width: 300
        height: 500
        data: Panel {
            width: sendWindow.width
            height: sendWindow.height
            onDeployMessage: deployed.message(text, img, left, istext)
        }
        visible:true
    }

    Panel {
        id: deployed
        deploy: true
        scale: 2
        anchors {
            centerIn: parent
        }
    }
}
