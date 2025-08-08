#include "CameraController.hpp"
#include <QDebug>
#include <QMediaDevices>
#include <QCameraDevice>
#include <QCamera>
#include <QVideoSink>
#include <QMediaCaptureSession>

CameraController::CameraController(QObject *parent)
        : QObject(parent)
        , m_videoSink(this)                // init QVideoSink with parent
        , m_captureSession(this)           // init capture session with parent
        , m_camera(nullptr)
{
    qDebug() << "[CameraController] ▶ Constructor start";

    // 1) Hook up the video sink
    m_captureSession.setVideoSink(&m_videoSink);
    qDebug() << "[CameraController] • Video sink set on capture session";

    // 2) Enumerate available cameras
    const auto inputs = QMediaDevices::videoInputs();
    if (inputs.isEmpty()) {
        qWarning() << "[CameraController] ⚠ No video input devices found!";
    } else {
        QStringList names;
        for (const auto &dev : inputs)
            names << dev.description();
        qDebug() << "[CameraController] • Available cameras:" << names;
    }

    // 3) Log the default camera
    const QCameraDevice defaultDev = QMediaDevices::defaultVideoInput();
    qDebug() << "[CameraController] • Default camera:"
             << defaultDev.description() << "(" << defaultDev.id() << ")";

    // 4) Pick a front-facing camera if we can
    QCameraDevice chosenDev = defaultDev;
    for (const auto &dev : inputs) {
        qDebug() << "[CameraController]   – Inspecting"
                 << dev.description() << "position=" << dev.position();
        if (dev.position() == QCameraDevice::Position::FrontFace) {
            chosenDev = dev;
            qDebug() << "[CameraController]   → Picked front-facing:"
                     << dev.description();
            break;
        }
    }
    if (chosenDev.isNull()) {
        qWarning() << "[CameraController] ⚠ Chosen device invalid—falling back to default.";
        chosenDev = defaultDev;
    }

    qDebug() << "[CameraController] • Final camera choice:"
             << chosenDev.description() << "(" << chosenDev.id() << ")";

    // 5) Instantiate & configure QCamera
    selectCamera(chosenDev);
    qDebug() << "[CameraController] • selectCamera() called with ID"
             << chosenDev.id();

    // 6) Watch for active state changes
    if (m_camera) {
        connect(m_camera, &QCamera::activeChanged,
                this, [](bool active){
                    qDebug() << "[CameraController] ↔ Camera activeChanged =" << active;
                });
        qDebug() << "[CameraController] • Connected to QCamera::activeChanged";
    } else {
        qWarning() << "[CameraController] ⚠ m_camera is null after selectCamera()!";
    }

    // 7) Final status
    qDebug() << "[CameraController] ✔ Constructor complete; isActive() =" << isActive();
}
