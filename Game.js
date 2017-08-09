var tMap=Array();

var tBall=Array();
var tBigBall=Array();

var tDirection=Array('haut','bas','gauche','droite');


//dimensions réelles de l'écran
var _width;
var _height;

//dimensions de base de notre jeu
var _virtualWidth=720;
var _virtualHeight=960;

//ratio permettant d’adapter à la résolution de l'écran
var _iRatio;

var _iScore=0;

var _oPageScene;
var _oPageServerSide;



function Perso(){
    this.x=1;
    this.y=1;
    this.direction='droite';
}
Perso.prototype={
}

var oPerso=new Perso();

function getTile(){
    return 26;
}

function getWidth(){
    return _width;
}
function getHeight(){
    return _height;
}

//fonction de démarrage du jeu
function start(width_,height_){

    if(width_> height_){
        _width=height_*(_virtualWidth/_virtualHeight);
    }else{
        _width=width_;
    }

    _height=_width*(_virtualHeight/_virtualWidth);
    if(_height<height_){
        _height=height_;
    }

    _iRatio=_width/_virtualWidth;

    main.width=_width;
    main.height=_height;

    //appel à la page splashscreen
    gotoSplashscreen();
}

//converti une dimension a la taille de l'écran
function convert(size_){
    return size_*_iRatio;
}

//fonctions de navigations
function gotoSplashscreen(){
    main.launchPage('Splashscreen');
}
function gotoMenu(){
    main.launchPage('Menu');
}

function gotoServerSide(){
    _oPageServerSide=main.launchPage('ServerSide');
    main.enableServer();
}
function gotoClientSide(){
    _oPageServerSide=main.launchPage('ClientSide');
}

function gotoScene(){
    _oPageScene=main.launchPage('Scene');

    buildGame();
}
function gotoGameover(){

    main.launchPage('GameOver');
}


//jeu

function buildGame(){


    oPerso._x=1;
    oPerso._y=1;


    tMap=[
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
            [1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1],
            [1,0,1,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1],
            [1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
            [1,0,1,1,1,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,0,1],
            [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
            [1,1,1,1,1,0,1,1,0,1,1,1,0,1,1,1,1,0,1,1,0,1,1,1,1,1],
            [3,3,3,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,3,3,3],
            [3,3,3,3,1,0,1,0,1,1,1,1,2,2,1,1,1,1,0,1,0,1,3,3,3,3],
            [3,3,3,3,1,0,1,0,1,4,4,4,4,4,4,4,4,1,0,1,0,1,3,3,3,3],
            [3,3,3,3,1,0,1,0,1,4,4,4,4,4,4,4,4,1,0,1,0,1,3,3,3,3],
            [3,3,3,3,1,0,1,0,1,4,4,4,4,4,4,4,4,1,0,1,0,1,3,3,3,3],
            [3,3,3,3,1,0,1,0,1,1,1,1,1,1,1,1,1,1,0,1,0,1,3,3,3,3],
            [3,3,3,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,3,3,3],
            [1,1,1,1,1,1,1,1,0,1,0,1,1,1,0,1,0,1,1,0,1,1,1,1,1,1],
            [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1],
            [1,0,1,1,1,1,1,1,0,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,0,1],
            [1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1],
            [1,0,1,1,0,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1],
            [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
            [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],

        ];

    var iBall=0;
    var iBigBall=0;

    var iNewBigBall=0;

    for(var y_=0;y_< tMap.length;y_++){
        for(var x_=0;x_ < tMap[0].length;x_++){
            if(tMap[y_][x_]===1){
                modelWall.append({x:x_,y:y_});

            }else if(tMap[y_][x_]===0){
                if(iNewBigBall && (iNewBigBall%30)==0){
                    modelBigBall.append({x:x_,y:y_,visible:true});

                    tBigBall[x_+'_'+y_]=iBigBall;
                    iBigBall++;
                }else{

                    modelBall.append({x:x_,y:y_,visible:true});

                    tBall[x_+'_'+y_]=iBall;
                    iBall++;

                }

                iNewBigBall++;
            }
        }
    }

    _oPageScene.movePerso( oPerso._x, oPerso._y );

    //_oPageScene.startTimer();

}


function cycle(){


}



function iCanWalk(x_,y_){
    if(tMap[y_][x_]===0 || tMap[y_][x_]===4){
        return true;
    }
    return false;
}

function iCanWalkDirection(oObject_,direction_){
    if(direction_==='haut' && iCanWalk(oObject_.x,oObject_.y-1) ){
        return true;
    }else if(direction_==='bas' && iCanWalk(oObject_.x,oObject_.y+1) ){
        return true;
    }else if(direction_==='gauche' && iCanWalk(oObject_.x-1,oObject_.y) ){
        return true;
    }else if(direction_==='droite' && iCanWalk(oObject_.x+1,oObject_.y) ){
        return true;
    }
    return false;
}


function clickUp(){
    oPerso.newdirection='haut';
}
function clickDown(){
    oPerso.newdirection='bas';

}
function clickLeft(){
    oPerso.newdirection='gauche';

}
function clickRight(){
    oPerso.newdirection='droite';

}

var tTeam=Array('blue','red','green','yellow');
var sTeam='';

var iNextTeam=0;

//---websocket
//client
function webSocketClient_receive(message_){

   if(message_.substr(0,8)==='setTeam:'){
       sTeam=message_.substr(8);
   }

   message_+="\n";
   stack.currentItem.webSocketAppendMessage( qsTr("Client received message: %1").arg((message_)) );



}
function webSocketClient_send(message_){

    main.webSocketConnectServer('ws://localhost:1027');
    main.webSocketSendText(sTeam+":"+message_);
}

//server
function webSocketServer_receive(message_,websocket_){

    var tMessage=message_.split(':');
    if(tMessage[0]===''){

        var userTeam=tTeam[ iNextTeam ];

        websocket_.sendTextMessage('setTeam:'+userTeam);

        iNextTeam++;
    }else{
        message_+="\n";

        stack.currentItem.webSocketAppendMessage(qsTr("Server received message: %1").arg(message_));

        websocket_.sendTextMessage(qsTr("Hello Client!"));

    }



}

