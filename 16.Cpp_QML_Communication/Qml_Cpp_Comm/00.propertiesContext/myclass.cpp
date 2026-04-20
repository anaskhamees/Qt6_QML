#include "myclass.h"
#include <QDebug>

// Constructor implementation
MyClass::MyClass(QObject *parent)
    : QObject(parent)   // Initialize base QObject
{
}

// INVOKABLE method implementation
// Purpose: called directly from QML as a normal function
void MyClass::sayHelloInvokable() {
    qDebug() << "Hello from INVOKABLE";
}

// SLOT method implementation
// Purpose: can respond to signals OR be called from QML
void MyClass::sayHelloSlot() {
    qDebug() << "Hello from SLOT";
}
