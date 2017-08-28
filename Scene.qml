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



    Joystick{
        x:0
        y:0
        width:parent.width
        height:main.oGame.getGameHeight()

    }

    Center{
        id:btnBomb
        y:main.oGame.getGameHeight()+main.oGame.convert(20)
        anchors.right: parent.right


    }

    /*
    Left{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: main.oGame.convert( 50)
    }


    Right{
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: main.oGame.convert( 50)
    }
    */

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

    function disableBombBtn(){
        btnBomb.disable();
    }
    function enableBombBtn(){
        btnBomb.enable();
    }
}

