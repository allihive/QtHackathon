

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
import Generated.QtQuick3D.Flowafirst__1_
import Generated.QtQuick3D.Flowasecond
import Generated.QtQuick3D.Flowathird
import Generated.QtQuick3D.Flowafinished

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor
    property int flowerState: 0

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
                pivot.x: 0
                pivot.z: 350
                pivot.y: 100
                eulerRotation.y: 30
                fieldOfViewOrientation: PerspectiveCamera.Horizontal
                z: 116.97166
            }

            Flowafinished {
                id: flowafinished
                x: -132.162
                scale.z: 10
                scale.y: 10
                scale.x: 10
                visible: false
                z: -272.50958
            }

            Flowafirst__1_ {
                id: flowafirst__1_
                x: -132.268
                y: -13.58
                scale.z: 10
                scale.y: 10
                scale.x: 10
                z: -263.89462
            }

            Flowasecond {
                id: flowasecond
                x: -126.978
                y: -12.046
                visible: false
                scale.z: 10
                scale.y: 10
                scale.x: 10
                z: -257.73355
            }

            Flowathird {
                id: flowathird
                x: -127.335
                y: -10.637
                visible: false
                scale.z: 10
                scale.y: 10
                scale.x: 10
                z: -255.4046
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

    StateGroup {
        id: newStateGroup
    }

    StateGroup {
        id: newStateGroup1
    }
    states: [

        State {
            name: "Flower1"
            when: rectangle.flowerState == 1

            PropertyChanges {
                target: flowafirst__1_
                visible: false
            }
            PropertyChanges {
                target: flowasecond
                visible: true
            }
            PropertyChanges {
                target: flowathird
                visible: false
            }
            PropertyChanges {
                target: flowafinished
                visible: false
            }

            PropertyChanges {
                target: sceneCamera
                frustumCullingEnabled: false
            }
        },

        State {
            name: "Flower2"
            when: rectangle.flowerState == 2

            PropertyChanges {
                target: flowafirst__1_
                visible: false
            }
            PropertyChanges {
                target: flowasecond
                visible: false
            }
            PropertyChanges {
                target: flowathird
                visible: true
            }
            PropertyChanges {
                target: flowafinished
                visible: false
                eulerRotation.x: 20
            }
        },

        State {
            name: "Flower3"
            when: rectangle.flowerState == 3

            PropertyChanges {
                target: flowafirst__1_
                visible: false
            }
            PropertyChanges {
                target: flowasecond
                visible: false
            }
            PropertyChanges {
                target: flowathird
                visible: false
            }
            PropertyChanges {
                target: flowafinished
                x: -121.291
                y: -21.22
                visible: true
                scale.z: 10
                scale.y: 10
                scale.x: 10
                eulerRotation.x: 20
                z: -283.15918
            }

            PropertyChanges {
                target: directionalLight
                x: -338.803
                y: 321.706
                eulerRotation.x: -150
                eulerRotation.z: 50
                eulerRotation.y: 90
                pivot.y: 0
                z: 160.09911
                brightness: 2
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;matPrevEnvDoc:"SkyBox";matPrevEnvValueDoc:"preview_studio";matPrevModelDoc:"#Sphere"}
D{i:3;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/

