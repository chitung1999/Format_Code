#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>

class Controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString obj      READ obj                        NOTIFY objChanged)
    Q_PROPERTY(QString type     READ type                       NOTIFY typeChanged)
    Q_PROPERTY(QString name     READ name                       NOTIFY nameChanged)
    Q_PROPERTY(QString nameUp   READ nameUp                     NOTIFY nameUpChanged)
    Q_PROPERTY(QString popupNtf READ popupNtf WRITE setPopupNtf NOTIFY popupNtfChanged)
public:
     static Controller *getInstance();

     QString obj() const;
     QString type() const;
     QString name() const;
     QString nameUp() const;

     const QString &popupNtf() const;
     void setPopupNtf(const QString &newPopupNtf);

signals:
     void objChanged();
     void typeChanged();
     void nameChanged();
     void nameUpChanged();
     void popupNtfChanged();

public slots:
    void create(QString str);

private:
    explicit Controller(QObject *parent = nullptr);

    QString m_obj;
    QString m_type;
    QString m_name;
    QString m_nameUp;
    QString m_popupNtf;
};

#endif // CONTROLLER_H
