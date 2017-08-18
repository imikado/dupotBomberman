#include "client.h"

#include <QtCore/QDebug>

QT_USE_NAMESPACE


Client::Client( QString url,bool bDebug, QObject * oQml_) : QWebSocket("MyApplication"), isConnecteda(false),_sUrl(url)
    {
qDebug()<<"constructeur A";
    _oQml=oQml_;

    qDebug()<<"constructeur B";

    connect(this, &QWebSocket::connected, this, &Client::SL_Connected);
    connect(this, &QWebSocket::disconnected, this, &Client::SL_Disconnected);

    connect(this,&QWebSocket::textMessageReceived,this,&Client::onTextMessageReceived);



    connect(this,static_cast<void(QWebSocket::*)(QAbstractSocket::SocketError)> ( &QWebSocket::error),this,&Client::SL_error);
    open(QUrl(url));
    }

void Client::SL_Connected()
    {
    qDebug() << "Connected to server on port" ;
    isConnecteda=true;
    }

void Client::SL_Disconnected()
    {
    qDebug() << "disConnected to ";
    isConnecteda=false;
    }

void Client::sendT(QString text_){

    qDebug() << "start sebd";
    qDebug() << "dest:" << _sUrl;
    qDebug() << "try to send " << text_ << "isConnected ?" ;
    if(isConnecteda==false){
        qDebug()<<"not connected";
        return;
    }else{
        qDebug() <<"seems to be connected";
        sendTextMessage(text_);
    }
}

void Client::SL_error(QAbstractSocket::SocketError error){
    qDebug() << "error " << error;
}

void Client::onTextMessageReceived(QString message)
{

        qDebug() << "!!!Message received:" << message;
        QVariant returnedValue;
        QMetaObject::invokeMethod(_oQml, "webSocketClient_message",
                 Q_RETURN_ARG(QVariant, returnedValue),
                Q_ARG(QVariant, message));

     //close();
}

/*

Client::Client(const QUrl &url, bool bDebug, QObject *parent) :
    QObject(parent){


    QWebSocket pWebSocket  ;
    //connect(&pWebSocket, &QWebSocket::error, this, &Client::onError);

    connect(&pWebSocket,&QWebSocket::stateChanged,this,&Client::onState);

    connect(&pWebSocket,&QWebSocket::connected,this,&Client::onConnected);
    connect(&pWebSocket,&QWebSocket::disconnected,this,&Client::onDisconnected);

    pWebSocket.open(url);
    qDebug()<<pWebSocket.errorString();

 }

void Client::onState(QAbstractSocket::SocketState state){

    QString sMess="";
    if(state==QAbstractSocket::UnconnectedState){
        sMess="UnconnectedState";
    }



     qDebug() << "onState" << state << ":" << sMess << state.  ;
}

void Client::onConnected(){
    qDebug() << "connected";
}


void Client::onDisconnected(){
    qDebug() << "onDisconnected";
}

void Client::onError(QAbstractSocket::SocketError error){
    qDebug() << "error " << error;
}

void Client::sendT(QString text_){
     qDebug() << "message sent "<< text_;
     pWebSocket->sendTextMessage(text_);
}

*/

/*

Client::Client(const QUrl &url, bool debug, QObject *parent) :
    QObject(parent),
    m_url(url),
    m_debug(debug)
{
    if (m_debug)
        qDebug() << "WebSocket server:" << url;
    connect(&m_webSocket, &QWebSocket::connected, this, &Client::onConnected);
    connect(&m_webSocket, &QWebSocket::disconnected, this, &Client::onClosed);


    qDebug()<< "websocket open url";
    m_webSocket.open(QUrl(url));
}

void Client::onConnected()
{
    if (m_debug)
        qDebug() << "WebSocket connected";
    connect(&m_webSocket, &QWebSocket::textMessageReceived,
            this, &Client::onTextMessageReceived);
    m_webSocket.sendTextMessage(QStringLiteral("Hello, world!"));
}

void Client::onTextMessageReceived(QString message)
{
    if (m_debug)
        qDebug() << "Message received:" << message;
    m_webSocket.close();
}


void Client::sendT(QString message){
    qDebug() << "message sent "<< message;
    m_webSocket.sendTextMessage(message);
}

void Client::onClosed(){
    qDebug() << "closed ";
}
*/

