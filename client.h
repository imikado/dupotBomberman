#ifndef CLIENT_H
#define CLIENT_H

#include <QtCore/QObject>
#include <QtWebSockets/QWebSocket>



class Client : public QWebSocket
{
    Q_OBJECT
public:
    Client();

    Client(QString url,bool bDebug,QObject * Qml);

    void sendT(QString text_);

    bool isConnecteda;
    QString _sUrl;
    QObject * _oQml;

signals:
    void messageFromClientChanged(QString mess);

protected slots:
    void SL_Connected();
    void SL_Disconnected();

    void SL_error(QAbstractSocket::SocketError error);

    void onTextMessageReceived(QString message);




};
#endif // CLIENT_H

/*

class Client:public QObject{

    Q_OBJECT

public :
    Client(const QUrl &url, bool debug, QObject *parent);

    void sendT(QString text_);

protected slots:
    void onConnected();
    void onDisconnected();

    void onState(QAbstractSocket::SocketState state);


    void onError(QAbstractSocket::SocketError error);


private:
       QWebSocket* pWebSocket;
};
*/
/*
class Client : public QObject
{
    Q_OBJECT
public:
    explicit Client(const QUrl &url, bool debug = false, QObject *parent = Q_NULLPTR);

    void sendT(QString message);

Q_SIGNALS:
    void closed();


private Q_SLOTS:
    void onConnected();
    void onTextMessageReceived(QString message);
     void onClosed();


private:
    QWebSocket m_webSocket;
    QUrl m_url;
    bool m_debug;
};
*/

