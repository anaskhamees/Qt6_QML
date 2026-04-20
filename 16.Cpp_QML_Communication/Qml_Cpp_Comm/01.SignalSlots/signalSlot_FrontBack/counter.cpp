#include "counter.h"

Counter::Counter(QObject *parent):QObject(parent)
{
}

//called from QML
void Counter::increment()
{
    m_value++;
    emit valueChanged(m_value); // notify QML
}
