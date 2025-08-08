// RobotContent/App.qml
import QtQuick
import QtMultimedia
import RobotApp

Window {
    id: window
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Robot Selfie Preview")

    CameraController {
        id: cam
        active: true
    }

    VideoOutput {
        anchors.fill: parent
        sink: cam.videoSink
    }
}
