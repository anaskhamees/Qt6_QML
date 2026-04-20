#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT

        // Q_PROPERTY exposes "value" to QML
    /*
     * Q_PROPERTY defines a property that is exposed to Qt's Meta-Object System
     * and becomes accessible from QML.
     *
     * Syntax:
     *   Q_PROPERTY(type name READ getter WRITE setter NOTIFY signal)
     *
     * int value
     *   → Property type is int, and its name in QML will be "value"
     *
     * READ getValue
     *   → Getter function used to read the property value
     *   → Must be a const function: int getValue() const;
     *
     * WRITE setValue
     *   → Setter function used to modify the property value
     *   → Called automatically when QML assigns a new value:
     *       counter.value = 10
     *
     * NOTIFY valueChanged
     *   → Signal emitted when the value changes
     *   → Required for QML to react and update bindings automatically
     *
     * Important:
     * - If NOTIFY is missing, QML will NOT update when the value changes
     * - The signal should be emitted inside setValue() when the value actually changes
     *
     * This enables reactive programming:
     * QML automatically updates UI when the property changes.
     */

    Q_PROPERTY(int value READ getValue WRITE setValue NOTIFY valueChanged)
public:
    explicit Counter(QObject *parent = nullptr);

    int getValue() const;       // READ
    void setValue(int v);       // WRITE

signals:
    void valueChanged();        // NOTIFY

private:
    int m_value = 0;
};

#endif // COUNTER_H
