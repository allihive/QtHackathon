// AppInitializer.cpp
#include "AppInitializer.hpp"
#include "CameraController.hpp"

#include <QCoreApplication>
#include <QPermissions>
#include <QQmlContext>
#include <QDebug>

void AppInitializer::configureEngine(QQmlApplicationEngine &engine,
                                     CameraController       &camCtrl)
{
    // 1) If you ever need to instantiate CameraController in QML:
    qmlRegisterType<CameraController>("RobotApp", 1, 0, "CameraController");

    // 2) Make QVideoSink available if you bind VideoOutput::sink to it
    qmlRegisterUncreatableType<QVideoSink>(
            "QtMultimedia", 6, 9, "VideoSink",
            QStringLiteral("Provided by CameraController"));

    // 3) QML import paths (so qrc:/qml and your unpacked qml/ folder work)
    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(QStringLiteral("qrc:/"));

    // 4) Expose your single CameraController instance as "camCtrl"
    engine.rootContext()->setContextProperty(QStringLiteral("camCtrl"), &camCtrl);
}

void AppInitializer::requestPermissionAndLoad(QGuiApplication &app,
                                              QQmlApplicationEngine &engine,
                                              const QUrl &mainQmlUrl)
{
    QCameraPermission camPerm;
    auto status = app.checkPermission(camPerm);

    auto loadOrExit = [&](bool granted){
        if (granted) {
            engine.load(mainQmlUrl);
            if (engine.rootObjects().isEmpty())
                QCoreApplication::exit(-1);
        } else {
            qWarning() << "Camera permission denied; exiting.";
            QCoreApplication::exit(-1);
        }
    };

    if (status == Qt::PermissionStatus::Undetermined) {
        app.requestPermission(
                camPerm,
                &app,
                [loadOrExit](const QPermission &result) {
                    loadOrExit(result.status() == Qt::PermissionStatus::Granted);
                }
        );
        // start the event loop so the lambda can run
        app.exec();
    }
    else if (status == Qt::PermissionStatus::Granted) {
        loadOrExit(true);
    }
    else {
        loadOrExit(false);
    }
}
