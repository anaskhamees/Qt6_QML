#include "counter.h"

Counter::Counter(QObject *parent)
    : QObject{parent}
{}
void Counter::setCounter(int value)
{
    if (m_counter == value)
        return;

    m_counter = value;
    emit counterChanged();
}

 void Counter::increment()
{
    setCounter(m_counter + 1);
}
