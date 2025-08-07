

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick3D
import QtQuick3D.Effects
import QtQuick3D.Helpers
import Robot
import Generated.QtQuick3D.Scene
import Generated.QtQuick3D.Flower__1_

Rectangle {
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    View3D {
        id: extendedView3D
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0

        environment: sceneEnvironment

        ExtendedSceneEnvironment {
            id: sceneEnvironment
            clearColor: "#91b1d2"
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }

        Node {
            id: scene
            DirectionalLight {
                id: directionalLight
                x: -2.9
                y: -408.254
                z: 86.67305
            }

            PerspectiveCamera {
                id: sceneCamera
                x: 102.903
                y: 179.004
                eulerRotation.y: 30
                fieldOfViewOrientation: PerspectiveCamera.Horizontal
                z: 116.97166
            }

            Flower__1_ {
                id: flower__1_
                x: -64.743
                y: -67.177
                scale.z: 10
                scale.y: 10
                scale.x: 10
                z: -171.98117
            }
        }
    }

    Item {
        id: __materialLibrary__
        PrincipledMaterial {
            id: defaultMaterial
            objectName: "Default Material"
            baseColor: "#4aee45"
        }
    }
}

/*##^##
Designer {
    D{i:0;matPrevEnvDoc:"SkyBox";matPrevEnvValueDoc:"preview_studio";matPrevModelDoc:"#Sphere"}
D{i:3;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/

