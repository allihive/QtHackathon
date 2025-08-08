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

    // Expose start/stop to QML
    Q_PROPERTY(bool active READ isActive WRITE setActive)

    // Expose the video sink to QML
    Q_PROPERTY(QVideoSink* videoSink READ videoSink CONSTANT)

public:
    explicit CameraController(QObject* parent = nullptr);

    // Getter for 'active'
    bool isActive() const { return m_camera && m_camera->isActive(); }

    // Expose the list of cameras to QML
    Q_INVOKABLE QList<QCameraDevice> availableCameras() const {
        return QMediaDevices::videoInputs();
    }

    // Allow QML to select which camera to use
    Q_INVOKABLE void selectCamera(const QCameraDevice &dev) {
        if (m_camera) {
            m_camera->stop();
            m_camera->deleteLater();
        }
        m_camera = new QCamera(dev, this);
        m_captureSession.setCamera(m_camera);
    }

    // Provide the sink so VideoOutput { sink: camCtrl.videoSink } works
    QVideoSink* videoSink() { return &m_videoSink; }

public slots:
            void setActive(bool on) {
        if (!m_camera)
            return;
        if (on)
            m_camera->start();
        else
            m_camera->stop();
    }

private:
    QCamera*             m_camera       = nullptr;
    QMediaCaptureSession m_captureSession;
    QVideoSink           m_videoSink;
};
