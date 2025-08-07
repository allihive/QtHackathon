import QtQuick
import QtQuick3D

Node {
    id: node
    scale.x: 20
    scale.y: 20
    scale.z: 20

    // Resources
    PrincipledMaterial {
        id: material_028_material
        objectName: "Material.028"
        baseColor: "#ff1ecc00"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_006_material
        objectName: "Material.006"
        baseColor: "#ffcc0308"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_001_material
        objectName: "Material.001"
        baseColor: "#ffcc0308"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_002_material
        objectName: "Material.002"
        baseColor: "#ffcc0308"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_004_material
        objectName: "Material.004"
        baseColor: "#ffcc0308"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_009_material
        objectName: "Material.009"
        baseColor: "#ffcc0000"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_003_material
        objectName: "Material.003"
        baseColor: "#ffcc0000"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_007_material
        objectName: "Material.007"
        baseColor: "#ffcc0308"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_008_material
        objectName: "Material.008"
        baseColor: "#ffcc0000"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_029_material
        objectName: "Material.029"
        baseColor: "#ff19cc00"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_031_material
        objectName: "Material.031"
        baseColor: "#ff19cc00"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: material_material
        objectName: "Material"
        baseColor: "#ffcc9020"
        roughness: 0.5
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }

    // Nodes:
    Node {
        id: root
        objectName: "ROOT"
        Model {
            id: cylinder
            objectName: "Cylinder"
            x: -0.25573092699050903
            y: 4.369513511657715
            z: -1.116187334060669
            scale.x: 0.0892347
            scale.y: 3.8749
            scale.z: 0.148485
            source: "meshes/cylinder_mesh.mesh"
            materials: [
                material_028_material
            ]
        }
        Model {
            id: plane
            objectName: "Plane"
            x: -0.3345687687397003
            y: 8.713001251220703
            z: 1.1924158334732056
            rotation: Qt.quaternion(0, 0, 0.271179, 0.962529)
            scale.x: -0.665473
            scale.y: -0.864106
            scale.z: -1.94809
            source: "meshes/plane_001_mesh.mesh"
            materials: [
                material_006_material
            ]
        }
        Model {
            id: plane_001
            objectName: "Plane.001"
            x: 1.372267723083496
            y: 9.044410705566406
            z: -1.1810098886489868
            rotation: Qt.quaternion(-0.335465, 0.662269, 0.257636, 0.618455)
            scale.x: -0.665473
            scale.y: -0.864107
            scale.z: -1.94809
            source: "meshes/plane_002_mesh.mesh"
            materials: [
                material_001_material
            ]
        }
        Model {
            id: plane_002
            objectName: "Plane.002"
            x: 0.004201248288154602
            y: 9.21604061126709
            z: -2.82049298286438
            rotation: Qt.quaternion(0.512606, -0.850066, -0.0434081, -0.112862)
            scale.x: -0.665473
            scale.y: -0.864106
            scale.z: -1.94809
            source: "meshes/plane_003_mesh.mesh"
            materials: [
                material_002_material
            ]
        }
        Model {
            id: plane_006
            objectName: "Plane.006"
            x: -2.3453264236450195
            y: 8.833532333374023
            z: -0.9934329986572266
            rotation: Qt.quaternion(0.210097, -0.621281, 0.276641, 0.702381)
            scale.x: -0.665473
            scale.y: -0.864106
            scale.z: -1.94809
            source: "meshes/plane_007_mesh.mesh"
            materials: [
                material_004_material
            ]
        }
        Model {
            id: plane_010
            objectName: "Plane.010"
            x: -1.7656925916671753
            y: 14.647619247436523
            z: -6.459181785583496
            rotation: Qt.quaternion(0.887927, 0.40904, 0.210296, -0.00688208)
            scale.x: 1
            scale.y: 1
            scale.z: 1
            source: "meshes/plane_013_mesh.mesh"
            materials: [
                material_009_material
            ]
        }
        Model {
            id: plane_003
            objectName: "Plane.003"
            x: 4.134734630584717
            y: 8.70705509185791
            z: 6.670264720916748
            rotation: Qt.quaternion(-0.349057, 0.000197418, 0.937032, -0.0114421)
            scale.x: 1
            scale.y: 1
            scale.z: 1
            source: "meshes/plane_019_mesh.mesh"
            materials: [
                material_003_material
            ]
        }
        Model {
            id: plane_004
            objectName: "Plane.004"
            x: -6.30255126953125
            y: 14.348336219787598
            z: -2.7717392444610596
            rotation: Qt.quaternion(0.693838, 0.316301, 0.62548, -0.165279)
            source: "meshes/plane_020_mesh.mesh"
            materials: [
                material_007_material
            ]
        }
        Model {
            id: plane_005
            objectName: "Plane.005"
            x: 4.506256580352783
            y: 14.678033828735352
            z: -3.5011003017425537
            rotation: Qt.quaternion(0.8143, 0.332583, -0.400651, 0.256481)
            source: "meshes/plane_022_mesh.mesh"
            materials: [
                material_008_material
            ]
        }
        Model {
            id: plane_021
            objectName: "Plane.021"
            x: -0.8053242564201355
            y: 0.23627936840057373
            z: -1.917524814605713
            rotation: Qt.quaternion(0.92406, 0.141782, -0.235341, 0.265755)
            source: "meshes/plane_044_mesh.mesh"
            materials: [
                material_029_material
            ]
        }
        Model {
            id: plane_029
            objectName: "Plane.029"
            x: -0.682991087436676
            y: 1.3137288093566895
            z: -0.07708603143692017
            rotation: Qt.quaternion(0.637295, 0.301202, 0.709314, -0.00225998)
            scale.x: 1
            scale.y: 1
            scale.z: 1
            source: "meshes/plane_046_mesh.mesh"
            materials: [
                material_031_material
            ]
        }
        Model {
            id: keski_001
            objectName: "keski.001"
            x: -0.27270933985710144
            y: 7.803339958190918
            z: -1.1519217491149902
            rotation: Qt.quaternion(0.777494, 0.0260291, 0.62832, -0.00632502)
            scale.x: 0.693136
            scale.y: 0.46021
            scale.z: 0.670918
            source: "meshes/mesh_mesh.mesh"
            materials: [
                material_material
            ]
        }
    }

    // Animations:
}
