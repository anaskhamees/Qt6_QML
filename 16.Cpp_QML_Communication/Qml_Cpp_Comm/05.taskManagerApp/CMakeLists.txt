cmake_minimum_required(VERSION 3.16)

project(taskManager VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(apptaskManager
    main.cpp
)

qt_add_qml_module(apptaskManager
    URI taskManager
    QML_FILES
        Main.qml
        SOURCES taskmanager.h taskmanager.cpp
        RESOURCES background.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apptaskManager PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apptaskManager
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(apptaskManager
    PRIVATE
        Qt6::Quick
        Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS apptaskManager
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
