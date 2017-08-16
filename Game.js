
function debug(text_){
    console.log(text_);
}

var gameStarted=false;

var tMap=Array();

var tBall=Array();
var tBigBall=Array();

var tDirection=Array('haut','bas','gauche','droite');

var _urlWebsocket='ws://127.0.0.1:1100';
//var _urlWebsocket='ws://localhost:1100';

//var _urlWebsocket='ws://192.168.1.11:1100';

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



function getTile(){
    return 50;
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
    //main.enableServer();
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
var tWalkBreakable=Array();

function buildGame(){



    tMap=[
        [1,1,1,1,1,1,1,1,1,1,1,1,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,1,2,1,0,1,0,1,0,1,0,1],
        [1,0,2,0,0,0,0,0,0,0,0,0,1],
        [1,0,1,2,1,0,1,0,1,0,1,0,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,1,0,1,0,1,0,1,0,1,0,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,1,0,1,0,1,0,1,0,1,0,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,1,0,1,0,1,0,1,0,1,0,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,1,0,1,0,1,0,1,0,1,0,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,1,0,1,0,1,0,1,0,1,0,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,1,1,1,1,1,1,1,1,1,1,1,1],

        ];

    var iBall=0;
    var iBigBall=0;

    var iNewBigBall=0;
    var iWallBreakable=0;

    for(var y_=0;y_< tMap.length;y_++){
        for(var x_=0;x_ < tMap[0].length;x_++){
            if(tMap[y_][x_]===1){
                modelWall.append({x:x_,y:y_});

             }else if(tMap[y_][x_]===2){
                modelWallBreakable.append({x:x_,y:y_});

                tWalkBreakable[x_+'_'+y_]=iWallBreakable;
                iWallBreakable++;

            }else if(tMap[y_][x_]===0){

            }
        }
    }

    modelPerso.append({x:1,y:1,visible:true});
    modelPerso.append({x:11,y:1,visible:true});
    modelPerso.append({x:1,y:15,visible:true});
    modelPerso.append({x:11,y:15,visible:true});

    gameStarted=true;
}


function cycle(){


}

function exploseBomb(x_,y_){
    if(tMap[y_][x_]===2){
        tMap[y_][x_]=0;

        console.log('look for tWalkBreakable '+x_+'_'+y_);
        if(tWalkBreakable[x_+'_'+y_] > -1 ){

            var indexBreakable=tWalkBreakable[x_+'_'+y_];

            console.log('remove modelWallBrakable, index : '+indexBreakable);
            modelWallBreakable.remove( indexBreakable  );
        }

    }else if(tMap[y_][x_]===0){

        console.log('check perso x,y :'+x_+' '+y_);

        //loop perso to know if there is anybody
        var maxPerso=modelPerso.count;
        for(var i=0;i<maxPerso;i++){
            var oCheckPerso=modelPerso.get(i);
            console.log('check x,y :'+x_+' '+y_+' vs perso.x'+oCheckPerso.x+' perso.y'+oCheckPerso.y);
            if(oCheckPerso.x===x_ && oCheckPerso.y===y_){
                console.log('perso find');
                oCheckPerso.visible=false;
            }
        }

    }
}
function removeBomb(index_){
    console.log('removeBomb : '+index_);
    modelBomb.remove(index_);
}



function iCanWalk(x_,y_){
    if(tMap[y_][x_]===0 || tMap[y_][x_]===4){
        return true;
    }
    return false;
}

function iCanWalkDirection(oObject_,direction_){
    if(direction_==='up' && iCanWalk(oObject_.x,oObject_.y-1) ){
        return true;
    }else if(direction_==='down' && iCanWalk(oObject_.x,oObject_.y+1) ){
        return true;
    }else if(direction_==='left' && iCanWalk(oObject_.x-1,oObject_.y) ){
        return true;
    }else if(direction_==='right' && iCanWalk(oObject_.x+1,oObject_.y) ){
        return true;
    }
    return false;
}


function clickUp(){
    webSocketClient_send('gotoUp');
}
function clickDown(){
    webSocketClient_send('gotoDown');

}
function clickLeft(){
    webSocketClient_send('gotoLeft');

}
function clickRight(){
    webSocketClient_send('gotoRight');

}
function clickBomb(){
    webSocketClient_send('putBomb');
}

function putBomb(x_,y_){
    modelBomb.append({x:x_,y:y_});
}


var tTeam=Array('blue','red','green','yellow');
var tTeamInverse=Array();
tTeamInverse['blue']=0;
tTeamInverse['red']=1;
tTeamInverse['green']=2;
tTeamInverse['yellow']=3;

var sTeam='';

var tWebsocket=Array();
var iWebsocket=0;

var iNextTeam=0;

//---websocket
//client
function webSocketClient_receive(message_){

   if(message_.substr(0,8)==='setTeam:'){
       sTeam=message_.substr(8);
   }else if(message_==='gotoScene'){
        gotoScene();
   }else{
       var tMessage=message_.split(':');
       var iTeamSocket=tTeamInverse[tMessage[0] ];
       var oPersoSocket=modelPerso.get(tTeamInverse[tMessage[0] ] );

       if(tMessage[1]==='gotoUp' && iCanWalkDirection(oPersoSocket,'up') ){
           oPersoSocket.y-=1;
       }else if(tMessage[1]==='gotoDown' && iCanWalkDirection(oPersoSocket,'down') ){
           oPersoSocket.y+=1;
       }else if(tMessage[1]==='gotoLeft' && iCanWalkDirection(oPersoSocket,'left') ){
           oPersoSocket.x-=1;
       }else if(tMessage[1]==='gotoRight' && iCanWalkDirection(oPersoSocket,'right') ){
           oPersoSocket.x+=1;
       }else if(tMessage[1]==='putBomb'){
           putBomb(oPersoSocket.x,oPersoSocket.y);

       }
   }

   message_+="\n";
   stack.currentItem.webSocketAppendMessage( qsTr("Client received message: %1").arg((message_)) );



}
var bConnected=false;
function webSocketClient_send(message_){

    if(false===bConnected){
        main.webSocketConnectServer(_urlWebsocket);
        bConnected=true;
    }
    var iTeamToSend=tTeamInverse[sTeam];
    if(gameStarted){
        if(modelPerso.get(iTeamToSend).visible===true ){
            main.webSocketSendText(sTeam+":"+message_);
        }else{
            console.log('gameover can not play');
        }
    }else{
        main.webSocketSendText(sTeam+":"+message_);
    }
}

//server
function webSocketServer_receive(message_,websocket_){

    var tMessage=message_.split(':');
    if(tMessage[0]===''){

        var userTeam=tTeam[ iNextTeam ];

        websocket_.sendTextMessage('setTeam:'+userTeam);

        if(!tWebsocket[iNextTeam] ){
            tWebsocket[iNextTeam]=websocket_;
        }

        iNextTeam++;
    }else if(tMessage[1]==='start'){

        for(var i in tWebsocket){
            tWebsocket[i].sendTextMessage("gotoScene");
        }

    }else{
        //message_+="\n";

        stack.currentItem.webSocketAppendMessage(qsTr("Server received message: %1").arg(message_));

        //websocket_.sendTextMessage('qsTr("Hello Client!")'ok);

        for(var i in tWebsocket){
            tWebsocket[i].sendTextMessage(message_);
        }

    }



}

