#ifndef COUNTER_H
#define COUNTER_H
#include <QObject>
class Counter:public QObject
{
    Q_OBJECT
public:
    explicit Counter(QObject *parent=nullptr);
    Q_INVOKABLE void increment(); //this is will called from QML

signals:
    void valueChanged(int value); //emitted when value  changed
private:
    int m_value=0;
};

#endif // COUNTER_H
