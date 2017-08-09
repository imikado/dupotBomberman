import QtQuick 2.0
import QtQuick.Controls 1.5

import "qrc:/items"


Rectangle {
    visible:true
    color: "#5f0f0f"
    width:main.oGame.getWidth()
    height:main.oGame.getHeight()

    Image{
        source:"/images/pageGameOver.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width:main.oGame.convert(400)
        height:main.oGame.convert(650)

        Bouton{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            _width: main.oGame.convert(292)
            _height: main.oGame.convert(60)
            _text: qsTr("Re-Jouer!")
            _link:main.oGame.gotoScene
        }

        Bouton{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 50
            _width: main.oGame.convert(292)
            _height: main.oGame.convert(60)
            _text: qsTr("Retour au menu")
            _link:main.oGame.gotoMenu
        }



    }
}
