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

    Q_INVOKABLE void connectServer(QString port_){
         Server oServer(port_.toInt());
    }

    Q_INVOKABLE void connectClient(QString url_){
       Client oClient(url_,true);
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

    ApplicationData data;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("applicationData", &data);
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));







    /*

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));


    QObject *rootObject = engine.rootObjects().first();
     QObject *qmlObject = rootObject->findChild<QObject*>("main");

       // Step 2a: set or get the desired property value for the root object
     rootObject->setProperty("lanIp", "to"+address.toString() );

    //engine.rootContext()->setContextProperty("lanIp", "to"+address.toString() );

    qDebug() <<"test "  << address.toString() ;
*/
    return app.exec();
}
#include "main.moc"
