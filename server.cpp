#include "server.h"
#include "QtWebSockets/QWebSocketServer"
#include "QtWebSockets/QWebSocket"
#include <QtCore>

QT_USE_NAMESPACE

Server::Server( QString port,bool bDebug, QObject * oQml_) : QWebSocketServer(QStringLiteral("Server"),
                                                             QWebSocketServer::NonSecureMode){
    _oQml=oQml_;
    //qDebug()<<"constructeur";

    _Team=new QStringList('blue','red','green','yellow');


    connect(this, &QWebSocketServer::newConnection,
            this, &Server::onNewConnection);

    connect(this,  &QWebSocketServer::serverError, this,&Server::onError);

    connect(this,  &QWebSocketServer::acceptError, this,&Server::acceptError);

    connect (this, &QWebSocketServer::closed, this, &Server::onClose);



    if (listen(QHostAddress::Any, port.toInt() ) ){
        //signal
        QMetaObject::invokeMethod(_oQml, "serverIsConnected");

    }else{
        //qDebug() << errorString();
    }
}

void Server::onNewConnection(){

    QWebSocket *pSocket = nextPendingConnection();

    connect(pSocket, &QWebSocket::textMessageReceived, this, &Server::processMessage);
    connect(pSocket, &QWebSocket::disconnected, this, &Server::socketDisconnected);

    //enregistrement team

    QVariant returnedValue;
    QMetaObject::invokeMethod(_oQml, "webSocketServer_message",
                              Q_RETURN_ARG(QVariant, returnedValue),
                              Q_ARG(QVariant, ":connect"));

    QString sReturn= returnedValue.toString();

    QStringList tReturn=sReturn.split("###");
    QString sUserReturn="";
    QString sAllReturn="";

    sUserReturn=tReturn[0];
    sAllReturn=tReturn[1];

    pSocket->sendTextMessage(sUserReturn);

    m_clients << pSocket;
}

void Server::processMessage(QString message_)
{
    /*
    var tMessage=message_.split(':');
    if(tMessage[0]===''){

        var userTeam=_tTeam[ _iNextTeam ];

        sUserReturn='setTeam:'+userTeam;

        stack.currentItem.webSocketAppendMessage("New User "+userTeam);

        _iNextTeam++;

    }else if(tMessage[1]==='start'){

        sAllReturn="gotoScene;"+_iNextTeam;


    }else{

        stack.currentItem.webSocketAppendMessage(qsTr("Server received message: %1").arg(message_));

        sAllReturn=message_;

    }
    */

    QStringList tMessage=message_.split(':');
    if(tMessage[0]==''){
        string userTeam=_tTeam[ _iNextTeam ];

        sUserReturn='setTeam:'+userTeam;
    }else if(tMessage[1]=='start'){

    }else{

    }






    QStringList tReturn=sReturn.split("###");

    QString sUserReturn="";
    QString sAllReturn="";

    sUserReturn=tReturn[0];
    sAllReturn=tReturn[1];

    QWebSocket *pSender = qobject_cast<QWebSocket *>(sender());
    for (QWebSocket *pClient : qAsConst(m_clients)) {
        if (pClient == pSender && sUserReturn!="") //don't echo message back to sender
        {

            pClient->sendTextMessage(sUserReturn);
        }
        if(sAllReturn!=""){
            pClient->sendTextMessage(sAllReturn);
        }
    }
}

void Server::socketDisconnected(){

    //qDebug( )<< "disconnect" ;

}

void Server::onClose(){
    //qDebug() << "close" ;
}


void Server::onError(QWebSocketProtocol::CloseCode error)
{
    //qDebug() << error ;
}
void Server::acceptError(QAbstractSocket::SocketError error)
{
    //qDebug() << error ;
}

