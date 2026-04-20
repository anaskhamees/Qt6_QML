#ifndef TASKMANAGER_H
#define TASKMANAGER_H

#include <QObject>
#include <QtQml/qqml.h>

class TaskManager : public QObject
{
    Q_OBJECT
    QML_ELEMENT //make this class automatically avaiable in qml
    //we need to expose totalTasks and completedTasks in qml
    Q_PROPERTY(int totalTasks READ getTotalTasks NOTIFY statusChanged)
    Q_PROPERTY(int completedTasks READ getCompletedTasks NOTIFY statusChanged)


public:
    explicit TaskManager(QObject *parent = nullptr);
    //getter for total tasks
    int getTotalTasks() const;
    //getter for completedTasks
    int getCompletedTasks()  const ;

    Q_INVOKABLE void addTask();
    Q_INVOKABLE void completeTask();

signals:
    void statusChanged();
private:
    int m_totalTasks=0;
    int m_completedTasks=0;
};

#endif // TASKMANAGER_H
