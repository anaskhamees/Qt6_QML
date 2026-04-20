#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "myclass.h"
#include <QQmlContext>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    //create object from myclass
    MyClass myclass;
    //Expose C++ object to QML
    // In QML, you can access it using: AnasClass.someFunction()
    engine.rootContext()->setContextProperty("AnasClass",&myclass);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("propertiesContext", "Main");

    return app.exec();
}
