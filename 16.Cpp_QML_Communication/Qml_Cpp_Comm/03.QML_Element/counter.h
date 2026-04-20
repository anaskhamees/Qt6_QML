#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>          // Base class for all Qt objects
#include <QtQml/qqml.h>    // Required for QML_ELEMENT macro

// Counter class that will be exposed to QML
class Counter : public QObject
{
    Q_OBJECT
    // Enables Qt meta-object system:
    // - signals & slots
    // - Q_PROPERTY
    // - runtime type info

    QML_ELEMENT
    // Registers this class automatically as a QML type
    // Allows usage in QML like:
    // Counter { }

    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged FINAL)
    /*
      Exposes "value" to QML as a property

     - int value → property name and type
     - READ value → getter function
     - WRITE setValue → setter function
     - NOTIFY valueChanged → signal emitted when value changes
     - FINAL → prevents overriding in derived classes
    */

public:
    // Constructor
    explicit Counter(QObject *parent = nullptr);

    // Getter: used when QML reads "counter.value"
    int value() const;

    // Setter: used when QML writes "counter.value = x"
    void setValue(int v);

signals:
    // Signal emitted when value changes
    // QML listens to this to update UI automatically
    void valueChanged(int value);

private:
    // Internal storage for the property
    int m_value = 0;
};

#endif // COUNTER_H
