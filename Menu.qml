import QtQuick 2.0
import QtQuick.Controls 1.5

import "qrc:/items"

Rectangle {
    visible:true
    color: "#33b387"
    width:main.oGame.getWidth()
    height:main.oGame.getHeight()

    Image{

        source:"/images/pageStartGame.png"
        anchors.horizontalCenter: parent.horizontalCenter

        width:main.oGame.convert(400)
        height:main.oGame.convert(650)


    }

    Bouton{
        anchors.verticalCenterOffset: main.oGame.convert(100)

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        _width: main.oGame.convert(380)
        _height: main.oGame.convert(60)
        _text: qsTr("Heberger une partie")
        _link:main.oGame.gotoServerSide
    }

    Bouton{
        anchors.verticalCenterOffset: main.oGame.convert(200)

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        _width: main.oGame.convert(380)
        _height: main.oGame.convert(60)
        _text: qsTr("Rejoindre une partie")
        _link:main.oGame.gotoClientSide
    }

    Bouton{
        anchors.verticalCenterOffset: main.oGame.convert(300)

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        _width: main.oGame.convert(380)
        _height: main.oGame.convert(60)
        _text: qsTr("Aide")
        _link:main.oGame.gotoHelp
    }





}
