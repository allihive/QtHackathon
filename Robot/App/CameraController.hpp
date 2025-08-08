#pragma once

#include <QObject>
#include <QtMultimedia/QMediaDevices>
#include <QtMultimedia/QMediaCaptureSession>
#include <QtMultimedia/QCamera>
#include <QtMultimedia/QCameraDevice>
#include <QtMultimedia/QVideoSink>

class CameraController : public QObject
{
    Q_OBJECT
    // no NOTIFY clause, since we don't need to notify QML of changes
    Q_PROPERTY(bool active READ isActive WRITE setActive)

public:
    explicit CameraController(QObject* parent = nullptr);

    // expose the video sink to QML
    QVideoSink* videoSink() { return &m_videoSink; }

    // getter
    bool isActive() const { return m_camera && m_camera->isActive(); }

public slots:
    // setter: start/stop the camera
    void setActive(bool on) {
        if (!m_camera) return;
        if (on)
            m_camera->start();
        else
            m_camera->stop();
    }

private:
    QCamera*               m_camera       = nullptr;
    QMediaCaptureSession   m_captureSession;
    QVideoSink             m_videoSink;
};
