#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "counter.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Counter counter;
    /*
     * rootContext():
     * Returns the root QQmlContext of the QML engine.
     * This is commonly called the "QML global context".
     *
     * QML global context means:
     * - A shared namespace available to all QML files loaded by this engine
     * - Objects and values defined here can be accessed anywhere in QML
     *   (unless shadowed by a more local context)
     *
     * setContextProperty(name, object):
     * Injects a C++ object into the QML global context.
     *
     * "counter" → the name used inside QML to reference the object
     * &counter  → pointer to the C++ instance
     *
     * After this line, QML can:
     * - Call functions marked with Q_INVOKABLE
     * - Access properties declared with Q_PROPERTY
     * - React to signals emitted from this object
     *
     * Example usage in QML:
     *   counter.increment()
     *   Text { text: counter.value }
     *
     */
    engine.rootContext()->setContextProperty("counter", &counter);



    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QProperty_", "Main");

    return app.exec();
}
