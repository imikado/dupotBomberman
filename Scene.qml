import QtQuick 2.0
import QtQuick.Controls 1.5

import "qrc:/items/"

Rectangle{
    visible:true
    color:'#3b606b'
    width:main.oGame.getWidth()
    height:main.oGame.getHeight()




    Wall{}

    WallBreakable{}

    Bomb{}


    Perso{}

    Center{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: main.oGame.convert( 50)

        x:main.oGame.convert( 250)


    }

    Left{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: main.oGame.convert( 50)
    }

    Right{
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: main.oGame.convert( 50)
    }


    Timer{
        id:timeGameOver
        interval: 1000
        running:false
        repeat: false
        onTriggered: main.oGame.gotoGameover();
    }



    function gameOver(){
        timeGameOver.start();
    }




    function webSocketAppendMessage(text_){
        //textlog.text+=text_;
    }
}

