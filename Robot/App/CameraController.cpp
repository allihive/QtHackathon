#include "CameraController.hpp"

CameraController::CameraController(QObject* parent)
        : QObject(parent)
{
    // pick the default video input device
    QCameraDevice defaultDev = QMediaDevices::defaultVideoInput();

    // create the camera and hook it to the capture session
    m_camera = new QCamera(defaultDev, this);
    m_captureSession.setCamera(m_camera);
    m_captureSession.setVideoSink(&m_videoSink);
}
