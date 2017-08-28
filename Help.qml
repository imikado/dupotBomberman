import QtQuick 2.0

import "qrc:/items"

Item {
    width:parent.width
    height:parent.height

    Rectangle{
    color:"#333333"
    width:parent.width
    height:parent.height


    Text{

        wrapMode: Text.WordWrap

        y:main.oGame.convert(30);

         width:parent.width-main.oGame.convert(50)
         anchors.horizontalCenter: parent.horizontalCenter

         color: "white"

        text:"Déplacez votre doigt directement sur le jeu pour deplacer le personnage. Utiliser le bouton 'Bomb' pour en déposer une."
    }

    Image{

        y:main.oGame.convert(100)
        width:parent.width

        source: "/images/helpMove.png"
    }


    }

    Bouton{

        _width: main.oGame.convert(380)
        _height: main.oGame.convert(60)
        _text: qsTr("Retour au menu")
        _link:main.oGame.gotoMenu

        anchors.horizontalCenter: parent.horizontalCenter

        anchors.bottom: parent.bottom
        anchors.bottomMargin: main.oGame.convert(30)
    }
}
