#include <QGuiApplication>
#include <QQmlApplicationEngine>

//Donot forget to edit CMake File
#include <QQuickStyle>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    //load the style
   // QQuickStyle::setStyle("Material");
    //QQuickStyle::setStyle("Universal");
    //QQuickStyle::setStyle("Fusion");
    //QQuickStyle::setStyle("Imagine");

    QQuickStyle::setStyle("Default");



    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("button", "Main");

    return app.exec();
}
