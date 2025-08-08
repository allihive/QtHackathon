#include "CameraController.hpp"

CameraController::CameraController(QObject* parent)
        : QObject(parent)
{
    // pick the front‐facing camera (fallback to default)
    QCameraDevice chosenDev = QMediaDevices::defaultVideoInput();
    for (auto &dev : QMediaDevices::videoInputs()) {
        if (dev.position() == QCameraDevice::Position::FrontFace) {
            chosenDev = dev;
            break;
        }
    }

    // now select it
    selectCamera(chosenDev);
    // and leave 'active' off until QML or Kotlin/Java turns it on
}
