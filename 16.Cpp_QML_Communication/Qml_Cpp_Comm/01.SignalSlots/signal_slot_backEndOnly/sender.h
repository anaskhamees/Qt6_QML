#ifndef SENDER_H
#define SENDER_H

#include <QObject>

class Sender : public QObject
{
    Q_OBJECT
public:
    explicit Sender(QObject *parent = nullptr);
     void start(); // called from QML

signals:
    void sendValue(int value); // signal
};

#endif // SENDER_H
