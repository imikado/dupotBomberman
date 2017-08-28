var _isServer=false;
var _urlWebsocket='ws://127.0.0.1';
var _urlWebsocketPort='1100';


var iUserAlive=0;
var iNbUser=0;

var gameStarted=false;

var sTeam='';


var tMap=Array();


//dimensions réelles de l'écran
var _width;
var _height;

//dimensions de base de notre jeu
var _virtualWidth=720;
var _virtualHeight=960;

//ratio permettant d’adapter à la résolution de l'écran
var _iRatio;

var _oPageScene;
var _oPageServerSide;

//jeu
var tWalkBreakable=Array();


var tTeam=Array('blue','red','green','yellow');
var tTeamInverse=Array();
tTeamInverse['blue']=0;
tTeamInverse['red']=1;
tTeamInverse['green']=2;
tTeamInverse['yellow']=3;

var iNextTeam=0;

var bConnected=false;




function debug(text_){
    console.log(text_);
}




function getGameHeight(){
    return convert(  getTile()*17 );
}


function init(){
    iUserAlive=0;
    gameStarted=false;

}





function getTile(){
    return 720/13;
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




//---fonctions de navigations
function gotoSplashscreen(){
    main.launchPage('Splashscreen');
}
function gotoMenu(){
    main.launchPage('Menu');
}
function gotoServerSide(){
    _oPageServerSide=main.launchPage('ServerSide');
}
function gotoClientSide(){
    _oPageServerSide=main.launchPage('ClientSide');
}

function gotoScene(){
    _oPageScene=main.launchPage('Scene');

    buildGame();
}
function gotoGameover(){
    init();

    main.launchPage('GameOver');
}
function gotoHelp(){
    main.launchPage('Help');
}



function buildGame(){

    modelWall.clear();
    modelWallBreakable.clear();
    modelBomb.clear();
    modelPerso.clear();

    tMap=[
        [1,1,1,1,1,1,1,1,1,1,1,1,1],
        [1,0,0,0,0,2,0,2,0,0,0,0,1],
        [1,0,1,2,1,2,1,0,1,0,1,0,1],
        [1,2,2,0,0,0,2,2,0,2,2,0,1],
        [1,2,1,2,1,0,1,0,1,0,1,2,1],
        [1,0,0,0,2,0,2,0,0,0,0,0,1],
        [1,0,1,0,1,0,1,0,1,0,1,0,1],
        [1,0,0,2,0,0,0,0,0,2,0,2,1],
        [1,2,1,0,1,0,1,0,1,0,1,0,1],
        [1,0,2,0,2,0,2,0,2,2,2,0,1],
        [1,0,1,2,1,0,1,0,1,0,1,2,1],
        [1,0,2,2,0,0,0,2,0,0,0,2,1],
        [1,2,1,0,1,0,1,0,1,2,1,2,1],
        [1,0,0,2,0,2,0,2,2,0,0,0,1],
        [1,0,1,0,1,0,1,2,1,2,1,0,1],
        [1,0,0,2,0,0,2,0,0,2,0,0,1],
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
                modelWallBreakable.append({x:x_,y:y_,visible:true});

                tWalkBreakable[x_+'_'+y_]=iWallBreakable;
                iWallBreakable++;

            }else if(tMap[y_][x_]===0){

            }
        }
    }
    //'blue','red','green','yellow'

    var tDetailUser=Array();
    tDetailUser.push( {x:1,y:1,visible:true,img:"persoBlue"} );
    tDetailUser.push( {x:11,y:1,visible:true,img:"persoRed"} );
    tDetailUser.push( {x:1,y:15,visible:true,img:"persoGreen"} );
    tDetailUser.push( {x:11,y:15,visible:true,img:"persoYellow"} );


    for(var iUser=0;iUser<iNbUser;iUser++){
        modelPerso.append(tDetailUser[iUser]);
    }

    gameStarted=true;
}


//---bomb
function exploseBomb(x_,y_){
    if(!gameStarted){
        return;
    }

    if(tMap[y_][x_]===2){
        tMap[y_][x_]=0;

        console.log('look for tWalkBreakable '+x_+'_'+y_);
        if(tWalkBreakable[x_+'_'+y_] > -1 ){

            var indexBreakable=tWalkBreakable[x_+'_'+y_];

            console.log('remove modelWallBrakable, index : '+indexBreakable);
            modelWallBreakable.get( indexBreakable  ).visible=false;
        }

    }else if(tMap[y_][x_]===0){

        console.log('check perso x,y :'+x_+' '+y_);

        //loop perso to know if there is anybody
        var maxPerso=modelPerso.count;
        for(var i=0;i<maxPerso;i++){
            var oCheckPerso=modelPerso.get(i);
            console.log('check x,y :'+x_+' '+y_+' vs perso.x'+oCheckPerso.x+' perso.y'+oCheckPerso.y);
            if(oCheckPerso.x===x_ && oCheckPerso.y===y_){
                console.log('perso killed');
                oCheckPerso.visible=false;
                iUserAlive-=1;

                if(iUserAlive<=1){
                    gotoGameover();
                }
            }
        }

    }
}
function removeBomb(index_){
    console.log('removeBomb : '+index_);
    if(sTeam===modelBomb.get(index_).team){
        _oPageScene.enableBombBtn();
    }
    modelBomb.remove(index_);
}
function putBomb(x_,y_,team_){
    modelBomb.append({x:x_,y:y_,isTimerActive:_isServer,actionExplose:'false',team:team_});
    if(sTeam===team_){
        _oPageScene.disableBombBtn();
    }
}
function exploseBombIndex(index_){

    modelBomb.get(index_).actionExplose='true';

}


//---map
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





//---socket
function socketExplose(index_){
    webSocketClient_send("exploseBombIndex;"+index_);

}
function socketRemoveBomb(index_){
    webSocketClient_send("removeBomb;"+index_);
}
function webSocketStartGame(){
    webSocketClient_send("restart;"+iNbUser);
}



//---gamepad
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


//---websocket
//client
function webSocketClient_receive(message_){

   if(message_.substr(0,8)==='setTeam:'){
       bConnected=true;
       sTeam=message_.substr(8);

       stack.currentItem.webSocketAppendMessage( "Message: vous etes le User "+sTeam );
       return;

   }else if(message_.substr(0,9)==='gotoScene'){

       var tStart=message_.split(';');
       iNbUser=tStart[1];

       gotoScene();
       return;

   }else{
       var tMessage=message_.split(':');
       var iTeamSocket=tTeamInverse[tMessage[0] ];
       var oPersoSocket=modelPerso.get(tTeamInverse[tMessage[0] ] );

       if(tMessage[1].substr(0,7)==='restart'){
           var tStart=tMessage[1].split(';');
           iNbUser=tStart[1];

           gotoScene();
           return;
       }else if(tMessage[1]==='gotoUp' && iCanWalkDirection(oPersoSocket,'up') ){
           oPersoSocket.y-=1;
       }else if(tMessage[1]==='gotoDown' && iCanWalkDirection(oPersoSocket,'down') ){
           oPersoSocket.y+=1;
       }else if(tMessage[1]==='gotoLeft' && iCanWalkDirection(oPersoSocket,'left') ){
           oPersoSocket.x-=1;
       }else if(tMessage[1]==='gotoRight' && iCanWalkDirection(oPersoSocket,'right') ){
           oPersoSocket.x+=1;
       }else if(tMessage[1]==='putBomb'){
           putBomb(oPersoSocket.x,oPersoSocket.y,tMessage[0]);

       }else if(tMessage[1].substr(0,16)==='exploseBombIndex'){
           exploseBombIndex(tMessage[1].substr(17) );
       }else if(tMessage[1].substr(0,10)==='removeBomb'){
           removeBomb(tMessage[1].substr(11) );
       }



   }
}
function webSocketClient_send(message_){

    if(false===bConnected){
        main.webSocketConnectServer(_urlWebsocket+":"+_urlWebsocketPort);

    }else{
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
}

//server
function webSocketServer_receive(message_){

    var sReturn;
    var sUserReturn='';
    var sAllReturn='';

    var tMessage=message_.split(':');
    if(tMessage[0]===''){

        var userTeam=tTeam[ iNextTeam ];

        sUserReturn='setTeam:'+userTeam;

        stack.currentItem.webSocketAppendMessage("New User "+userTeam);

        iNextTeam++;

    }else if(tMessage[1]==='start'){

        sAllReturn="gotoScene;"+iNextTeam;


    }else{

        stack.currentItem.webSocketAppendMessage(qsTr("Server received message: %1").arg(message_));

        sAllReturn=message_;

    }

    return sUserReturn+'###'+sAllReturn;

}

