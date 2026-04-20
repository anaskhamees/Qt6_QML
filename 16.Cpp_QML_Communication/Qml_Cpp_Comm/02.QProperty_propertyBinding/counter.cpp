#include "counter.h"

Counter::Counter(QObject *parent)
    : QObject(parent)
{
}

int Counter::getValue() const
{
    return m_value;
}

void Counter::setValue(int v)
{
    if (m_value == v)
        return;

    m_value = v;

    emit valueChanged(); // notify QML
}
