#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QHostInfo>
#include <QQmlContext>
#include <QNetworkInterface>
#include <QStringList>

#include "server.h"
#include "client.h"

class ApplicationData : public QObject
{
    Q_OBJECT
public:

    Server *oServer;
    Client *oClient;

    bool bServer=false;

    QObject *oQml;

    void setQmlObject(QObject *oQml_){
        oQml=oQml_;
    }

    Q_INVOKABLE void connectServer(QString port_){
        oServer=new Server(port_,true,oQml);
        bServer=true;
    }
    Q_INVOKABLE void disconnectServer(){
        if(bServer){
           oServer->disconnect();
        }
    }


    Q_INVOKABLE void connectClient(QString url_){
        oClient =new Client(url_,true,oQml);
    }
    Q_INVOKABLE void disconnectClient(){
        oClient->disconnect();
    }


    Q_INVOKABLE void sendMessage(QString text_){
        oClient->sendT(text_);
    }


    Q_INVOKABLE QString getIp() const {



        QStringList addresses;
          foreach(QHostAddress address, QNetworkInterface::allAddresses())
          {
            // Filtre les adresses localhost ...
            if(address != QHostAddress::LocalHostIPv6
               && address != QHostAddress::LocalHost
               // ... APIPA ...
               && !address.isInSubnet(QHostAddress::parseSubnet("169.254.0.0/16"))
               // ... Lien Local IPv6
               && !address.isInSubnet(QHostAddress::parseSubnet("FE80::/64")))
            {
              addresses << address.toString();
            }
          }


        return addresses[0];
    }
};

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);


     QQmlApplicationEngine engine;

    ApplicationData data;



    engine.rootContext()->setContextProperty("applicationData", &data);
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));


    QList<QObject*> rootObjt=engine.rootObjects();

    data.setQmlObject( rootObjt[0] );








    return app.exec();
}
#include "main.moc"
