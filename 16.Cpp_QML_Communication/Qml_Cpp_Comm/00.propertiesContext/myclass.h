#ifndef MYCLASS_H          // Prevent multiple inclusion
#define MYCLASS_H

#include <QObject>         // Base class for all Qt objects

class MyClass : public QObject
{
    Q_OBJECT              // Enables Qt meta-object features (signals, slots, invokable)

public:
    // Constructor (can be called from C++)
    explicit MyClass(QObject *parent = nullptr);

    // Exposed to QML / meta-object system
    // Used for normal function calls from QML
    Q_INVOKABLE void sayHelloInvokable();

signals:
    // (empty for now)
    // Signals are used to notify QML or other objects

public slots:
    // Slot function
    // Can receive signals AND be called from QML
    void sayHelloSlot();

};

#endif // MYCLASS_H
