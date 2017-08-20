#include "client.h"

#include <QtCore/QDebug>

QT_USE_NAMESPACE


Client::Client( QString url,bool bDebug, QObject * oQml_) : QWebSocket("MyApplication"), isConnecteda(false),_sUrl(url)
    {
    //qDebug()<<"constructeur A";
    _oQml=oQml_;

    //qDebug()<<"constructeur B";

    connect(this, &QWebSocket::connected, this, &Client::SL_Connected);
    connect(this, &QWebSocket::disconnected, this, &Client::SL_Disconnected);

    connect(this,&QWebSocket::textMessageReceived,this,&Client::onTextMessageReceived);



    connect(this,static_cast<void(QWebSocket::*)(QAbstractSocket::SocketError)> ( &QWebSocket::error),this,&Client::SL_error);
    open(QUrl(url));
    }

void Client::SL_Connected()
    {
    //qDebug() << "Connected to server on port" ;
    isConnecteda=true;


    QMetaObject::invokeMethod(_oQml, "hideBoxClient");


    }

void Client::SL_Disconnected()
    {
    //qDebug() << "disConnected to ";
    isConnecteda=false;
    }

void Client::sendT(QString text_){

    //qDebug() << "start sebd";
    //qDebug() << "dest:" << _sUrl;
    //qDebug() << "try to send " << text_ << "isConnected ?" ;
    if(isConnecteda==false){
       // qDebug()<<"not connected";
        return;
    }else{
        //qDebug() <<"seems to be connected";
        sendTextMessage(text_);
    }
}

void Client::SL_error(QAbstractSocket::SocketError error){
    //qDebug() << "error " << error;
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

