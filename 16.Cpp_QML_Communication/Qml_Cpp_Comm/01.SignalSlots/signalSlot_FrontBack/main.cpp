#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "counter.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Counter counter;
    engine.rootContext()->setContextProperty("counter",&counter);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("cppSignal", "Main");

    return app.exec();
}
