#include "receiver.h"

Receiver::Receiver(QObject *parent)
    : QObject(parent)
{
}

// This slot will be called when signal is emitted
void Receiver::receiveValue(int value)
{
    qDebug() << "Receiver got value:" << value;
}
