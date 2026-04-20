#include "sender.h"

Sender::Sender(QObject *parent)
    : QObject(parent)
{
}

// This function emits the signal
void Sender::start()
{
    emit sendValue(100); //  emit signal
}
