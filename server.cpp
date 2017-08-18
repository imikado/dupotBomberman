#include "server.h"
#include "QtWebSockets/QWebSocketServer"
#include "QtWebSockets/QWebSocket"
#include <QtCore/QDebug>

QT_USE_NAMESPACE

Server::Server( QString port,bool bDebug) : QWebSocketServer(QStringLiteral("Server"),
                                                             QWebSocketServer::NonSecureMode)
    {

    qDebug()<<"constructeur";

    connect(this, &QWebSocketServer::newConnection,
            this, &Server::onNewConnection);

    connect(this,  &QWebSocketServer::serverError, this,&Server::onError);

    connect(this,  &QWebSocketServer::acceptError, this,&Server::acceptError);

    connect (this, &QWebSocketServer::closed, this, &Server::onClose);


    if (listen(QHostAddress::Any, port.toInt()))
    {

        qDebug() << "Chat Server listening (" << isListening() << ") on port" << serverUrl();

    }else{
        qDebug() << errorString();
    }
}

void Server::onNewConnection()
{
    QWebSocket *pSocket = nextPendingConnection();

    connect(pSocket, &QWebSocket::textMessageReceived, this, &Server::processMessage);
    connect(pSocket, &QWebSocket::disconnected, this, &Server::socketDisconnected);

    m_clients << pSocket;
}

void Server::processMessage(QString message)
{

    qDebug( )<< "Server : receive msg:"<< message;
    QWebSocket *pSender = qobject_cast<QWebSocket *>(sender());
    for (QWebSocket *pClient : qAsConst(m_clients)) {
        //if (pClient != pSender) //don't echo message back to sender
        //{
            pClient->sendTextMessage(message);
        //}
    }
}

void Server::socketDisconnected()
{

    qDebug( )<< "disconnect" ;

}

void Server::onClose(){
    qDebug() << "close" ;
}


void Server::onError(QWebSocketProtocol::CloseCode error)
{
    qDebug() << error ;
}
void Server::acceptError(QAbstractSocket::SocketError error)
{
    qDebug() << error ;
}

/*
Server::Server(quint16 port, QObject *parent) :
    QObject(parent),
    m_pWebSocketServer(Q_NULLPTR)
{
    m_pWebSocketServer = new QWebSocketServer(QStringLiteral("Server"),
                                              QWebSocketServer::NonSecureMode,
                                              this);
    if (m_pWebSocketServer->listen(QHostAddress::Any, port))
    {

        qDebug() << "Chat Server listening (" << m_pWebSocketServer->isListening() << ") on port" << m_pWebSocketServer->serverUrl();

        connect(m_pWebSocketServer, &QWebSocketServer::newConnection, this, &Server::onNewConnection);

        connect(m_pWebSocketServer,  &QWebSocketServer::serverError, this,&Server::onError);

        connect(m_pWebSocketServer,  &QWebSocketServer::acceptError, this,&Server::acceptError);

        connect (m_pWebSocketServer, &QWebSocketServer::closed, this, &Server::onClose);



    }else{
        qDebug() << m_pWebSocketServer->errorString();
    }
}
void Server::onNewConnection()
{
    QWebSocket *pSocket = nextPendingConnection();

    connect(pSocket, &QWebSocket::textMessageReceived, this, &Server::processMessage);
    connect(pSocket, &QWebSocket::disconnected, this, &Server::socketDisconnected);

    m_clients << pSocket;
}


Server::~Server()
{
    m_pWebSocketServer->close();
    qDeleteAll(m_clients.begin(), m_clients.end());
}

void Server::onNewConnection()
{
    QWebSocket *pSocket = m_pWebSocketServer->nextPendingConnection();

    connect(pSocket, &QWebSocket::textMessageReceived, this, &Server::processMessage);
    connect(pSocket, &QWebSocket::disconnected, this, &Server::socketDisconnected);

    m_clients << pSocket;
}


void Server::processMessage(QString message)
{

    qDebug( )<< "receive msg:"<< message;
    QWebSocket *pSender = qobject_cast<QWebSocket *>(sender());
    for (QWebSocket *pClient : qAsConst(m_clients)) {
        if (pClient != pSender) //don't echo message back to sender
        {
            pClient->sendTextMessage(message);
        }
    }
}

void Server::socketDisconnected()
{

    qDebug( )<< "disconnect" ;
    QWebSocket *pClient = qobject_cast<QWebSocket *>(sender());
    if (pClient)
    {
        m_clients.removeAll(pClient);
        pClient->deleteLater();
    }
}

void Server::onClose(){
    qDebug() << "close" ;
}


void Server::onError(QWebSocketProtocol::CloseCode error)
{
    qDebug() << error ;
}
void Server::acceptError(QAbstractSocket::SocketError error)
{
    qDebug() << error ;
}

*/
