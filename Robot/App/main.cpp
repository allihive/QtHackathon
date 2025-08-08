// main.cpp
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "AppInitializer.hpp"
#include "CameraController.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    CameraController camCtrl;

    // 1) set up imports & expose C++ → QML
    AppInitializer::configureEngine(engine, camCtrl);

    // 2) permission + QML load
    const QUrl mainQmlUrl(QStringLiteral("qrc:/RobotAppUI/App.qml"));
    AppInitializer::requestPermissionAndLoad(app, engine, mainQmlUrl);

    return app.exec();
}
