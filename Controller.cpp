#include "Controller.h"
#include <QClipboard>

Controller::Controller(QObject *parent) : QObject(parent)
{
}

Controller *Controller::getInstance()
{
    static Controller _self;
    return &_self;
}

QString Controller::obj() const
{
    return m_obj;
}

QString Controller::type() const
{
    return m_type;
}

QString Controller::name() const
{
    return m_name;
}

QString Controller::nameUp() const
{
    return m_nameUp;
}

const QString &Controller::popupNtf() const
{
    return m_popupNtf;
}

void Controller::setPopupNtf(const QString &newPopupNtf)
{
    m_popupNtf = newPopupNtf;
    emit popupNtfChanged();
}

void Controller::create(QString str)
{
    if(str.count(' ') != 2) {

        setPopupNtf("Invalid format!");
        return;
    }

    int index = str.indexOf(' ');
    m_obj = str.left(index);

    str = str.mid(index + 1);
    index = str.indexOf(' ');
    m_type = str.left(index);
    m_name = str.mid(index + 1);

    if(m_obj.isEmpty() || m_type.isEmpty() || m_name.isEmpty()) {
        setPopupNtf("Invalid format!");
        return;
    }

    m_nameUp = m_name;
    m_nameUp[0] = m_nameUp[0].toUpper();
    emit objChanged();
    emit nameChanged();
    emit nameUpChanged();
    emit typeChanged();
}
