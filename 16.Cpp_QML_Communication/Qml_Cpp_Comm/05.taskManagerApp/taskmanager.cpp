#include "taskmanager.h"

TaskManager::TaskManager(QObject *parent)
    : QObject{parent}
{}
int TaskManager::getTotalTasks() const{
    return m_totalTasks;
}

int TaskManager::getCompletedTasks()const {
    return m_completedTasks;
}

void TaskManager::addTask(){
    m_totalTasks++;
    emit statusChanged();
}

void TaskManager::completeTask(){
    if(m_completedTasks<m_totalTasks){
        m_completedTasks++;
        emit statusChanged();
    }
}


