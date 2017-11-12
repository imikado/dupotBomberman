//websocket
var _isServer=false;
var _urlWebsocket='ws://127.0.0.1';
var _urlWebsocketPort='1100';
var _bConnected=false;


var _iUserAlive=0;
var _iNbUser=0;


//dimensions réelles de l'écran
var _width;
var _height;

//dimensions de base de notre jeu
var _virtualWidth=720;
var _virtualHeight=960;
//ratio permettant d’adapter à la résolution de l'écran
var _iRatio;

//pages
var _oPageScene;
var _oPageServerSide;

//jeu
var _gameStarted=false;
var _oMap=Array();

var _tTeam=Array('blue','red','green','yellow');
var _tTeamInverse=Array();
_tTeamInverse['blue']=0;
_tTeamInverse['red']=1;
_tTeamInverse['green']=2;
_tTeamInverse['yellow']=3;
var _iNextTeam=0;
var _sTeam='';


function debug(text_){
    console.log(text_);
}





//fonctions de démarrage du jeu
function init(){
    _iUserAlive=0;
    _gameStarted=false;

}
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


function getTile(){
    return 720/13;
}
function getGameHeight(){
    return convert(getTile()*17);
}
function getWidth(){
    return _width;
}
function getHeight(){
    return _height;
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



    _oMap=new Map();
    _oMap.build( [
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

                ]);


    var tDetailUser=Array();
    tDetailUser.push( {x:1,y:1,visible:true,img:"persoBlue"} );
    tDetailUser.push( {x:11,y:1,visible:true,img:"persoRed"} );
    tDetailUser.push( {x:1,y:15,visible:true,img:"persoGreen"} );
    tDetailUser.push( {x:11,y:15,visible:true,img:"persoYellow"} );


    for(var iUser=0;iUser<_iNbUser;iUser++){
        modelPerso.append(tDetailUser[iUser]);
    }

    _gameStarted=true;
}

function Map(){
    this._tMap=new Array();
    this._iWallBreakable=0;
    this._iBomb=0;

}
Map.prototype={
    isBomb:function(x_,y_){
        if( this._getValue(x_,y_).type === 'bomb' ){
            return true;
        }
        return false;
    },
    isWallBreakable:function(x_,y_){
        if( this._getValue(x_,y_).type === 'wallBreakable' ){
            return true;
        }
        return false;
    },
    isWall:function(x_,y_){
        if( this._getValue(x_,y_).type === 'wall' ){
            return true;
        }
        return false;
    },
    isEmpty:function(x_,y_){
        if( this._getValue(x_,y_) === '' ){
            return true;
        }
        return false;
    },
    iCanWalk:function(x_,y_){
        if(this.isEmpty(x_,y_) ){
            return true;
        }
        return false;
    },

    clean:function(x_,y_){
        this._setValue(x_,y_,'');
    },

    cleanWallBreakable:function(x_,y_){
        if( this.isWallBreakable(x_,y_)  ){
            modelWallBreakable.get( this._getValue(x_,y_).index  ).visible=false;
            this.clean(x_,y_);
        }
    },
    cleanBomb:function(x_,y_){

        var oBomb=this._getValue(x_,y_);

        if(_sTeam===oBomb.team){
            _oPageScene.enableBombBtn();
        }

        modelBomb.remove(oBomb.index );
        this.clean(x_,y_);
        this._iBomb--;
    },

    addWall:function(x_,y_){
        modelWall.append({x:x_,y:y_});

        var obj={type:'wall'};
        this._setValue(x_,y_,obj );
    },
    addWallBreakable:function(x_,y_){
        modelWallBreakable.append({x:x_,y:y_,visible:true});

        this._setValue(x_,y_,{type:'wallBreakable',index:this._iWallBreakable} );
        this._iWallBreakable++;
    },

    addBomb:function(x_,y_,team_){
        modelBomb.append({x:x_,y:y_,isTimerActive:_isServer,actionExplose:'false',team:team_});

        this._setValue(x_,y_,{type:'bomb',index:this._iBomb,team:team_} );
        this._iBomb++;

    },
    addEmpty:function(x_,y_){
        this._setValue(x_,y_,'');
    },

    build:function(tMap_){
        for(var vary=0;vary < tMap_.length;vary++ ){
            for(var varx=0;varx < tMap_[0].length;varx++ ){

                if( tMap_[vary][varx] === 1 ){
                    this.addWall(varx,vary);

                }else if( tMap_[vary][varx] === 2 ){
                    this.addWallBreakable(varx,vary);

                }else{
                    this.addEmpty(varx,vary);

                }
            }
        }
    },

    _getValue:function(x_,y_){
        return this._tMap[y_+'_'+x_];
    },
    _setValue:function(x_,y_,value_){
        this._tMap[y_+'_'+x_]=value_;
    },



};


function exploseBomb(x_,y_){
    if(!_gameStarted){
        return;
    }

    if( _oMap.isWallBreakable(x_,y_) ){

        _oMap.cleanWallBreakable(x_,y_);

    }else if( _oMap.isEmpty(x_,y_) ){

        //loop perso to know if there is anybody
        var maxPerso=modelPerso.count;
        for(var i=0;i<maxPerso;i++){
            var oCheckPerso=modelPerso.get(i);
            console.log('check x,y :'+x_+' '+y_+' vs perso.x'+oCheckPerso.x+' perso.y'+oCheckPerso.y);
            if(oCheckPerso.x===x_ && oCheckPerso.y===y_){
                console.log('perso killed');
                oCheckPerso.visible=false;
                _iUserAlive-=1;

                if(_iUserAlive<=1){
                    gotoGameover();
                }
            }
        }

    }
}

function removeBomb(x_,y_){

    _oMap.cleanBomb(x_,y_);


}
function putBomb(x_,y_,team_){

    _oMap.addBomb(x_,y_,team_);

    if(_sTeam===team_){
        _oPageScene.disableBombBtn();
    }
}
function exploseBombIndex(index_){

    modelBomb.get(index_).actionExplose='true';

}


//---map

function iCanWalkDirection(oObject_,direction_){
    if(direction_==='up' && _oMap.iCanWalk(oObject_.x,oObject_.y-1) ){
        return true;
    }else if(direction_==='down' && _oMap.iCanWalk(oObject_.x,oObject_.y+1) ){
        return true;
    }else if(direction_==='left' && _oMap.iCanWalk(oObject_.x-1,oObject_.y) ){
        return true;
    }else if(direction_==='right' && _oMap.iCanWalk(oObject_.x+1,oObject_.y) ){
        return true;
    }
    return false;
}





//---socket
function socketExplose(index_){
    webSocketClient_send("exploseBombIndex;"+index_);
}
function socketRemoveBomb(x_,y_){
    webSocketClient_send("removeBomb;"+x_+"_"+y_);
}
function webSocketStartGame(){
    webSocketClient_send("restart;"+_iNbUser);
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
       _bConnected=true;
       _sTeam=message_.substr(8);

       stack.currentItem.webSocketAppendMessage( "Message: vous etes le User "+_sTeam );
       return;

   }else if(message_.substr(0,9)==='gotoScene'){

       var tStart=message_.split(';');
       _iNbUser=tStart[1];

       gotoScene();
       return;

   }else{
       var tMessage=message_.split(':');
       var iTeamSocket=_tTeamInverse[tMessage[0] ];
       var oPersoSocket=modelPerso.get(_tTeamInverse[tMessage[0] ] );

       if(tMessage[1].substr(0,7)==='restart'){
           var tStart=tMessage[1].split(';');
           _iNbUser=tStart[1];

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
           var tArg=tMessage[1].substr(11).split('_');

           removeBomb(tArg[0], tArg[1] );
       }



   }
}
function webSocketClient_send(message_){

    if(false===_bConnected){
        applicationData.connectClient(_urlWebsocket+":"+_urlWebsocketPort);

    }else{
        var iTeamToSend=_tTeamInverse[_sTeam];
        if(_gameStarted){
            if(modelPerso.get(iTeamToSend).visible===true ){
                applicationData.sendMessage(_sTeam+":"+message_);
            }else{
                console.log('gameover can not play');
            }
        }else{
            applicationData.sendMessage(_sTeam+":"+message_);
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

        var userTeam=_tTeam[ _iNextTeam ];

        sUserReturn='setTeam:'+userTeam;

        stack.currentItem.webSocketAppendMessage("New User "+userTeam);

        _iNextTeam++;

    }else if(tMessage[1]==='start'){

        sAllReturn="gotoScene;"+_iNextTeam;


    }else{

        stack.currentItem.webSocketAppendMessage(qsTr("Server received message: %1").arg(message_));

        sAllReturn=message_;

    }

    return sUserReturn+'###'+sAllReturn;

}

