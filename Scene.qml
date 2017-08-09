import QtQuick 2.0
import QtQuick.Controls 1.5

import "qrc:/items/"

Rectangle{
    visible:true
    color:'#262d2f'
    width:main.oGame.getWidth()
    height:main.oGame.getHeight()

    Score{
        id:"oScore"
    }


    Wall{}



    Ball{}

    BigBall{}

    Ghost{}

    Pacman{
        id:"perso"
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
    /*
    Boom{}
    Cloud{}
    */
    /*
    Timer {
        id:timerEnemy
        interval: 1000;
        running: true
        repeat: true
        onTriggered: main.oGame.addEnemy();
    }*/

    Timer{
        id:timeGameOver
        interval: 1000
        running:false
        repeat: false
        onTriggered: main.oGame.gotoGameover();
    }

    Timer {
        id:timerCycle
        interval: 500;
        running: false
        repeat: true
        onTriggered: main.oGame.cycle();
    }

    function setScore(sText_){
        oScore.setText(sText_);
    }

    function stopTimer(){
        timerCycle.stop();
    }
    function startTimer(){
        timerCycle.start();
    }

    function gameOver(){
        timeGameOver.start();
    }

    function movePacman(x_,y_){
        perso._x=x_;
        perso._y=y_;

    }

    function movePacmanTo(direction_){
        if(direction_==='droite'){
            if(main.oGame.iCanWalk(perso._x+1,perso._y) ){
                perso._x+=1;
            }
        }else if(direction_==='gauche'){
            if(main.oGame.iCanWalk(perso._x-1,perso._y) ){
                perso._x-=1;
            }
        }else if(direction_==='haut'){
            if(main.oGame.iCanWalk(perso._x,perso._y-1) ){
                perso._y-=1;
            }
        }else if(direction_==='bas'){
            if(main.oGame.iCanWalk(perso._x,perso._y+1) ){
                perso._y+=1;
            }
        }

        main.oGame.oPacman._x=perso._x;
        main.oGame.oPacman._y=perso._y;
    }
}

