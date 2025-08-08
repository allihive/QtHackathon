// RobotContent/App.qml
import QtQuick
import QtMultimedia
import RobotContent

Window {
    id: window
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Flower power!")

    CameraController {
        id: cam
        active: true
    }

    VideoOutput {
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
        videoSink: cam.videoSink
    }
}
