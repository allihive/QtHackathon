cmake_minimum_required(VERSION 3.21.1)

option(LINK_INSIGHT "Link Qt Insight Tracker library" ON)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)

project(RobotApp LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
        CACHE STRING "Import paths for Qt Creator's code model"
        FORCE
)

find_package(Qt6 6.8 REQUIRED COMPONENTS
        Core
        QuickControls2
        Multimedia
        Gui
        Widgets
        Qml
        Quick
        QuickTimeline
        Quick3D
)
qt_standard_project_setup()

# 1) List all of your .cpp sources explicitly
qt_add_executable(RobotApp
        App/main.cpp
        App/CameraController.cpp
        App/AppInitializer.cpp
)

# 2) Package your QML under the RobotAppUI URI
qt_add_qml_module(RobotApp
        URI RobotAppUI            # ← Renamed from RobotApp
        VERSION 1.0
        QML_FILES
        RobotContent/App.qml
)

# Turn off the Java‐side QML bindings generator to avoid the name clash
set_target_properties(RobotApp PROPERTIES
     QT_ANDROID_GENERATE_JAVA_QTQUICKVIEW_CONTENTS OFF
)

# 3) Link against all the Qt modules you use
target_link_libraries(RobotApp
        PRIVATE
        Qt6::Core
        Qt6::Quick
        Qt6::Qml
        Qt6::Multimedia
)

qt_add_resources(${CMAKE_PROJECT_NAME} "configuration"
        PREFIX "/"
        FILES
        qtquickcontrols2.conf
)

include(qds)

if (BUILD_QDS_COMPONENTS)
    include(qmlcomponents OPTIONAL)
endif()

if (LINK_INSIGHT)
    include(insight OPTIONAL)
endif ()

include(GNUInstallDirs)
install(TARGETS ${CMAKE_PROJECT_NAME}
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
