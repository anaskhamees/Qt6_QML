#ifndef RECEIVER_H
#define RECEIVER_H

#include <QObject>
#include <QDebug>

class Receiver : public QObject
{
    Q_OBJECT
public:
    explicit Receiver(QObject *parent = nullptr);

public slots:
    void receiveValue(int value); // slot
};

#endif // RECEIVER_H
