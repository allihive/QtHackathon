// AppInitializer.cpp
#include "AppInitializer.hpp"
#include "CameraController.hpp"

#include <QCoreApplication>
#include <QPermissions>
#include <QQmlContext>
#include <QDir>
#include <QQmlContext>
#include <QDebug>

void AppInitializer::configureEngine(QQmlApplicationEngine &engine,
                                     CameraController       &camCtrl)
{
    qDebug() << "[AppInitializer] Starting QML engine configuration…";

    // 1) Register CameraController as a QML type
    qDebug() << "[AppInitializer] Registering CameraController QML type (RobotApp 1.0)…";
    qmlRegisterType<CameraController>("RobotApp", 1, 0, "CameraController");
    qDebug() << "[AppInitializer] ✔ CameraController registered";

    // 2) Register QVideoSink as uncreatable (used by VideoOutput::sink)
    qDebug() << "[AppInitializer] Registering uncreatable QVideoSink type…";
    qmlRegisterUncreatableType<QVideoSink>(
            "QtMultimedia", 6, 9, "VideoSink",
            QStringLiteral("Provided by CameraController"));
    qDebug() << "[AppInitializer] ✔ QVideoSink uncreatable type registered";

    // 3a) Add unpacked qml folder to import paths
    const QString unpackedQmlPath = QCoreApplication::applicationDirPath() + "qrc:/";
    QDir qmlDir(unpackedQmlPath);
    if (qmlDir.exists()) {
        engine.addImportPath(unpackedQmlPath);
        qDebug() << "[AppInitializer] Added import path:" << unpackedQmlPath;
    } else {
        qWarning() << "[AppInitializer] ⚠ Import path does not exist:" << unpackedQmlPath;
    }

    // 3b) Always add the Qt resource path
    const QString qrcPath = QStringLiteral("qrc:/");
    engine.addImportPath(qrcPath);
    qDebug() << "[AppInitializer] Added import path:" << qrcPath;

    // 4) Expose the CameraController instance under the name "camCtrl"
    QQmlContext *rootCtx = engine.rootContext();
    if (rootCtx) {
        rootCtx->setContextProperty(QStringLiteral("camCtrl"), &camCtrl);
        qDebug() << "[AppInitializer] Exposed CameraController as context property 'camCtrl'";
    } else {
        qWarning() << "[AppInitializer] ⚠ Failed to obtain QQmlContext; 'camCtrl' not exposed";
    }

    // Final summary of import paths
    qDebug() << "[AppInitializer] Engine import paths now:" << engine.importPathList();
    qDebug() << "[AppInitializer] QML engine configuration complete.";
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
