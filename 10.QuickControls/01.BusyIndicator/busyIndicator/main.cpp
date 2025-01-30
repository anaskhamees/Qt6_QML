#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    //Load your favorite style
    //QQuickStyle::setStyle("Material");
    //QQuickStyle::setStyle("Default");
     //QQuickStyle::setStyle("Imagine");
    QQuickStyle::setStyle("Universal");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("busyIndicator", "Main");

    return app.exec();
}
