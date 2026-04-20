#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
int main(int argc, char *argv[])
{
    /*
     * QQuickStyle::setStyle("Fusion");
     *
     * This function sets the Qt Quick Controls style used by the application.
     *
     * "Fusion" is one of the built-in Qt widget styles.
     *
     * What it does:
     * - Changes the visual appearance of Qt Quick Controls (Buttons, Sliders, etc.)
     *
     * Important notes:
     * - Must be called BEFORE creating the QGuiApplication/QApplication window
     *   and before loading the QML engine.
     *
     * Available styles (depending on Qt build):
     * - "Basic"
     * - "Fusion"
     * - "Material"
     * - "Universal"
     *
     * Summary:
     * This does NOT affect logic or communication.
     * It only controls the UI theme/style of Qt Quick Controls.
     */
    QQuickStyle::setStyle("Material"); //global activation for qml engine

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("taskManager", "Main");

    return app.exec();
}
