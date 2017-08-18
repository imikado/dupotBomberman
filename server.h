#ifndef SERVER_H
#define SERVER_H

#include <QtCore/QObject>
#include <QtCore/QList>
#include <QtCore/QByteArray>
#include <QtWebSockets/QWebSocket>

#include <QtWebSockets/QWebSocketServer>



class Server : public QWebSocketServer
{
    Q_OBJECT
public:
    Server();

    Server(QString port,bool bDebug);

    bool isConnecteda;
    QString _sUrl;

    QList<QWebSocket *> m_clients;

protected slots:
    void onNewConnection();
    void processMessage(QString message);
    void socketDisconnected();

    void onError(QWebSocketProtocol::CloseCode error);
    void acceptError(QAbstractSocket::SocketError error);
    void onClose();




};

#endif //SERVER_H

/*
QT_FORWARD_DECLARE_CLASS(QWebSocketServer)
QT_FORWARD_DECLARE_CLASS(QWebSocket)


class Server : public QObject
{
    Q_OBJECT
public:
    explicit Server(quint16 port, QObject *parent = Q_NULLPTR);
    virtual ~Server();

private Q_SLOTS:
    void onNewConnection();
    void processMessage(QString message);
    void socketDisconnected();

    void onError(QWebSocketProtocol::CloseCode error);
    void acceptError(QAbstractSocket::SocketError error);
    void onClose();

private:
    QWebSocketServer *m_pWebSocketServer;
    QList<QWebSocket *> m_clients;
};
*/
