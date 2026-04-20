#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "sender.h"
#include "receiver.h"
int main(int argc, char *argv[])
{
    //QGuiApplication app(argc, argv);

    //QQmlApplicationEngine engine;
    Sender sender;
    Receiver receiver;
    /*connect(sender, &SenderClass::signalName,
       receiver, &ReceiverClass::slotName);
     */

    // connect signal with slot
    QObject::connect(&sender,&Sender::sendValue,&receiver,&Receiver::receiveValue);
    sender.start();

    // QObject::connect(
    //     &engine,
    //     &QQmlApplicationEngine::objectCreationFailed,
    //     &app,
    //     []() { QCoreApplication::exit(-1); },
    //     Qt::QueuedConnection);
    // engine.loadFromModule("signal_slot", "Main");

    //return app.exec();
}
