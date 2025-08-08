import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick3D 1.15
import QtQuick3D.Helpers 1.15
import Generated.QtQuick3D.Flowafirst__1_

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor

    View3D {
        anchors.fill: parent

        environment: ExtendedSceneEnvironment {
            clearColor: "#91b1d2"
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: SceneEnvironment.MSAA
            antialiasingQuality: SceneEnvironment.High
        }

        Node {
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
                pivot.x: 0
                pivot.z: 350
                pivot.y: 100
                eulerRotation.y: 30
                fieldOfViewOrientation: PerspectiveCamera.Horizontal
                z: 116.97166
            }

            Flowafirst__1_ {
                id: flowafirst
                x: -132.268
                y: -13.58
                scale: Qt.vector3d(10, 10, 10)
                z: -263.89462
            }
        }
    }
}
