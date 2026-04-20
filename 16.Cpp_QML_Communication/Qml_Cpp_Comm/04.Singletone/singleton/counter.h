#ifndef COUNTER_H
#define COUNTER_H
#include <QObject>          // Base class for all Qt objects
#include<qqml.h>
class Counter : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(int counter READ counter WRITE setCounter NOTIFY counterChanged)

public:
    explicit Counter(QObject *parent = nullptr);
    int counter() const { return m_counter; }

    void setCounter(int value);
    Q_INVOKABLE void increment();
signals:
    void counterChanged();

private:
    int m_counter = 0;
};
#endif // COUNTER_H
