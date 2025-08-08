// AppInitializer.hpp
#pragma once

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QUrl>

class CameraController;

class AppInitializer
{
public:
    // Set up engine: imports + expose C++ objects
    static void configureEngine(QQmlApplicationEngine &engine,
                                CameraController &camCtrl);

    // Ask for camera permission; on granted, loads QML
    static void requestPermissionAndLoad(QGuiApplication  &app,
                                         QQmlApplicationEngine &engine,
                                         const QUrl       &mainQmlUrl);
};
